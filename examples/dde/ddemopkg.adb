-- $Source$ 
-- $Revision$ $Date$ $Author$ 

with Win32;	use Win32;
with Win32.Windef;
with Win32.Winuser;
with Win32.WinMain;
with Win32.DDEML;

with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Interfaces.C;
with Interfaces.C.Strings;
with System;


package body DdemoPkg is

    use type Interfaces.C.INT;
    use type Interfaces.C.LONG;
    use type Interfaces.C.SHORT;
    use type Interfaces.C.Unsigned_Long;
    use type Interfaces.C.Unsigned_char;
    use type Interfaces.C.Unsigned;

    use type Win32.DDEML.HCONVLIST;
    use type Win32.DDEML.HDDEDATA;
    use type Win32.DDEML.HCONV;
    use type Win32.DDEML.HSZ;

    -- Define this value to limit how fast data changes.  If we just let
    -- data change as fast a possible, we might bog down the system with DDE
    -- messages.

    BASE_TIMEOUT: constant := 100;

    szPause:      aliased constant Win32.Byte := 77; -- DDE Execute command
    szPause_Ptr:  Win32.PCByte                := szPause'Access;

    szResume:     aliased constant Win32.Byte := 88; -- DDE Execute command
    szResume_Ptr: Win32.PCByte                := szResume'Access;

    fActive: Boolean;                   -- indicates data is changing

    InCount: aliased Win32.INT := 0;    -- static buffer to hold incomming data
    cConvs:  Win32.INT         := 0;    -- number of active conversations
    count:   aliased Win32.INT := 0;    -- our data

    -- PaintDemo declarations
    rc: aliased WinDef.RECT;
    ps: aliased WinUser.PAINTSTRUCT;
    ci: aliased DDEML.CONVINFO;

    -- MainWndProc declarations
    rct: aliased WinDef.RECT;

    -- BroadcastTransaction declarations
    dwResult: aliased Win32.DWORD;

    package INT_IO is new Ada.Text_IO.Integer_IO(Win32.INT);


    function CP(C_Str : CHAR_Array) return Win32.PCSTR is
        function UC is new Ada.Unchecked_Conversion
            (System.Address,Win32.PCSTR);
    begin
        return UC(C_Str(C_Str'First)'Address);
    end CP;

-- BroadcastTransaction
--
-- Does the specified transaction on all conversations in hConvList
--

procedure BroadcastTransaction(pSrc   : Win32.PCBYTE; 
                               cbData : Win32.DWORD;
			                   fmt    : Win32.UINT; 
                               xtyp   : Win32.UINT) is
    hConv: DDEML.HCONV;
    cConvsOrg: Win32.INT;
begin
    cConvsOrg := cConvs;
    cConvs := 0;
    if hConvList /= 0 then
        --
        -- Enumerate all the conversations within this list - note that
        -- DDEML will only return active conversations.  Inactive conversations
        -- are automatically removed.
        -- 
        hConv := DDEML.DdeQueryNextServer(hConvList, 0);
        while hConv /= 0 loop
            --
            -- Count the active conversations while we're at it.
            -- 
            cConvs := cConvs + 1;

            -- Spawn an asynchronous transaction - this was chosen because
            -- we have not particular action if an error ocurrs so we just
            -- don't care too much about the results - this technique will
            -- NOT do for XTYP_REQUEST transactions though.
            -- 
            if DDEML.DdeClientTransaction(pSrc, cbData, 
                    hConv, hszAppName, fmt,
                    xtyp, DDEML.TIMEOUT_ASYNC, dwResult'Access) /= 0 then
                
                -- We immediately abandon the transaction so we don't get
                -- a bothersome XTYP_XACT_COMPLETE callback which we don't
                -- care about.
                -- 
                bResult := DDEML.DdeAbandonTransaction(idInst, hConv, dwResult);
            end if;

            hConv := DDEML.DdeQueryNextServer(hConvList, hConv);
        end loop;
    end if;
    if cConvs /= cConvsOrg then
        -- Oh, the number of active conversations has changed.  Time to
        -- repaint!
        bResult := WinUser.InvalidateRect(hwndMain, NULL, Win32.TRUE);
    end if;
end BroadcastTransaction;


-- MyProcessKey
--
-- We demonstrate the robustness of NT here by forcing a GP anytime the
-- 'B' key is pressed while this window has the focus.  NT should properly
-- fake termination to all other apps connected to us.

procedure MyProcessKey(tchCode: Win32.LONG; lKeyData: Win32.LONG) is
begin
    if tchCode = Win32.Char'Pos('B') or tchCode = Win32.Char'Pos('b') then
	raise Program_Error;
    end if;
end MyProcessKey;


procedure PaintDemo(hwnd: WinDef.HWND) is
    hConv: DDEML.HCONV;
    cConvsOrg: Win32.INT := cConvs;
    int_str: String(1..20);
    int_c_arr: Interfaces.C.Char_Array(0..20);
    hdcResult: WinDef.HDC;
    colorResult: Windef.COLORREF;
begin
    hdcResult := WinUser.BeginPaint(hwnd, ps'Access);

     -- Draw our data on top - Black for active, Grey for inactive.
    bResult := WinUser.SetRect(rc'Access, 0, 0, cxText, cyText);
    iResult := WinGdi.SetBkMode(ps.hdc, WinGdi.TRANSPARENT);
    colorResult := WinGdi.SetTextColor(ps.hdc, 16#00FFFFFF#);   -- white text

    if fActive = True then
        iResult := WinUser.FillRect(ps.hdc, rc'Access, 
    				    WinDef.HBrush(WinGdi.GetStockObject(
                                    WinGdi.BLACK_BRUSH)));    
    else
        iResult := WinUser.FillRect(ps.hdc, rc'Access,  
	    			    WinDef.HBrush(WinGdi.GetStockObject(
                                    WinGdi.GRAY_BRUSH)));
    end if;

    INT_IO.Put(int_str,count);
    int_c_arr := Interfaces.C.To_C(int_str);
    iResult := WinUser.DrawText(ps.hdc, 
                                LPCSTR(CP(Win32.To_Win(int_c_arr))), 
                                -1, rc'Access,
				WinUser.DT_CENTER or WinUser.DT_VCENTER);

     -- Now draw the most recently recieved data from each server we are
     -- connected to.
    if hConvList /= 0 then
        bResult := WinUser.OffsetRect(rc'Access, 0, cyText);
        colorResult := WinGdi.SetTextColor(ps.hdc, 0);    -- draw black text
        cConvs := 0;
        hConv := DDEML.DdeQueryNextServer(hConvList, 0);

        while hConv /= 0 loop
            cConvs := cConvs + 1;
             -- count how many conversations are active while we're at it.
            ci.cb := DDEML.CONVINFO'Size/8;
            uResult := DDEML.DdeQueryConvInfo(hConv, DDEML.QID_SYNC, ci'Access);
            iResult := WinUser.FillRect(ps.hdc, rc'Access,  
					WinDef.HBrush(WinGdi.GetStockObject(
                                        WinGdi.WHITE_BRUSH)));
            INT_IO.Put(int_str,Win32.INT(ci.hUser));
            int_c_arr := Interfaces.C.To_C(int_str);
            iResult := WinUser.DrawText(ps.hdc, 
                                        LPCSTR(CP(Win32.To_Win(int_c_arr))), 
                                        -1, rc'Access, 
                                        WinUser.DT_CENTER or 
                                        WinUser.DT_VCENTER);
            bResult := WinUser.OffsetRect(rc'Access, 0, cyText);
            hConv := DDEML.DdeQueryNextServer(hConvList, hConv);
        end loop;
    end if;

    bResult := WinUser.EndPaint(hwnd, ps'Access);
    if cConvsOrg /= cConvs then
         -- The number of active conversations changed!  Resize to fit.
        bResult := WinUser.SetWindowPos(hwndMain, System.Null_Address, 
                                        0, 0, cxText,
                                        (cyText * (cConvs + 1)) + cyTitle,
	                                    WinUser.SWP_NOMOVE or 
                                        WinUser.SWP_NOZORDER or 
                                        WinUser.SWP_NOACTIVATE);
    end if;
end PaintDemo;


function MainWndProc (hwnd    : Windef.HWND;
                      message : Win32.UINT;
                      wParam  : Win32.WPARAM;
                      lParam  : Win32.LPARAM) return Win32.LRESULT is
begin
    case message is
      when WinUser.WM_CREATE =>
        -- initially we are inactive - this reduces some of the message
        -- traffic while we are initializing - but we could start active fine.
        fActive  := FALSE;

      when WinUser.WM_RBUTTONDOWN =>
        if WinUser.GetKeyState(WinUser.VK_CONTROL) < 0 then

             -- A CTRL R_BUTTON click will cause ALL instances of this app
             -- to become inactive.
            BroadcastTransaction(szPause_Ptr, 1, 0, DDEML.XTYP_EXECUTE);
            bResult := WinUser.MessageBeep(0);
        end if;
        -- A R_BUTTON click makes us inactive.  Repaint to show state change.
        -- We do a synchronous update in when WinUser.there is too much DDE 
        -- message activity to allow the WM_PAINT messages through.  Remember 
        -- DDE messages have priority over others!
        bResult := WinUser.KillTimer(hwndMain, 1);
        fActive := FALSE;
        bResult := WinUser.InvalidateRect(hwnd, null, Win32.TRUE);
        bResult := WinUser.UpdateWindow(hwnd);

      when WinUser.WM_LBUTTONDOWN =>
        if WinUser.GetKeyState(WinUser.VK_CONTROL) < 0 then
            -- A CTRL L_BUTTON click will cause ALL instances of this app
            -- to become active.
            BroadcastTransaction(szResume_ptr, 1, 0, DDEML.XTYP_EXECUTE);
            bResult := WinUser.MessageBeep(0);
        end if;
        -- An L_BUTTON click makes us active.  Repaint to show state change.
        uResult := WinUser.SetTimer(hwndMain, 1, BASE_TIMEOUT, null);
        fActive := TRUE;
        bResult := WinUser.InvalidateRect(hwnd, NULL, Win32.TRUE);
        bResult := WinUser.UpdateWindow(hwnd);

      when WinUser.WM_CHAR =>
        MyProcessKey(Win32.LONG(wParam), Win32.LONG(lParam));

      when WinUser.WM_TIMER =>
        -- We use timers for simplicity.  On Win3.1 we could run out of
        -- timers easily but we don't have this worry on NT.
        --
        -- Each tick, we increment our data and call DdePostAdvise() to
        -- update any links there may be on this data.  DDEML makes link
        -- updates on specific items quite easy.
        count := count + 1;
        bResult := DDEML.DdePostAdvise(idInst, hszAppName, hszAppName);
         -- Invalidate the part of ourselves that shows our data and
         -- synchronously update it in   when WinUser.DDE message activity is
         -- blocking paints.
        bResult := WinUser.SetRect(rct'Access, 0, 0, cxText, cyText);
        bResult := WinUser.InvalidateRect(hwndMain, rct'Access, Win32.TRUE);
        bResult := WinUser.UpdateWindow(hwndMain);

      when WinUser.WM_PAINT =>
        PaintDemo(hwnd);

      when WinUser.WM_CLOSE =>
        bResult := WinUser.KillTimer(hwnd, 1);
         -- We do DDE cleanup here.  It is best to do DDE cleanup while
         -- still in the message loop to allow DDEML to recieve messages
         -- while shutting down.
        bResult := DDEML.DdeDisconnectList(hConvList);
        hddeResult := DDEML.DdeNameService(idInst, 0, 0, DDEML.DNS_UNREGISTER);
        bResult := DDEML.DdeFreeStringHandle(idInst, hszAppName);
        bResult := DDEML.DdeUninitialize(idInst);
        WinUser.PostQuitMessage(0);

      when others =>
        return WinUser.DefWindowProc(hwnd, message, wParam, lParam);
    end case;
    return(0);
end MainWndProc;


 -- This is the main DDEML callback proc.  It handles all interaction with
 -- DDEML that is DDEML originated.
function DdeCallBack(wType: 	Win32.UINT;
                     wFmt:      Win32.UINT;
                     hConv: 	DDEML.HCONV;
                     hsz_topic: DDEML.HSZ;
                     hsz_item: 	DDEML.HSZ;
                     hData: 	DDEML.HDDEDATA;
                     lData1: 	Win32.DWORD;
                     lData2: 	Win32.DWORD) return DDEML.HDDEDATA is
    pszExec: Win32.PByte;
	function To_PBYTE is 
		new Ada.Unchecked_Conversion(Win32.PINT,PBYTE);
begin
    case wType is
      when DDEML.XTYP_CONNECT =>
         -- Only allow connections to us.  We can always return TRUE because
         -- the CBF_FILTERINITS bit given to DdeInitialize() told DDEML to
         -- never bother us with connections to any service names other than
         -- what we have registered.
         --
         -- Note that we do not handle the XTYP_WILD_CONNECT transaction.
         -- This means that no wild-card initiates to us will work.
        return DDEML.HDDEDATA(Win32.TRUE);

      when DDEML.XTYP_ADVREQ | DDEML.XTYP_REQUEST =>
         -- These two transactions are the only ones that require us to
         -- render our data.  By using a custom format, we don't have to
         -- convert our count to text form to support CF_TEXT.
        return DDEML.HDDEDATA(DDEML.DdeCreateDataHandle(idInst, 
                              To_PBYTE(count'Access), count'Size/8,
                              0, hszAppName, OurFormat, 0));

      when DDEML.XTYP_ADVSTART =>
         -- Only allow links to our Item in our format.
        if (wFmt = OurFormat) and (hsz_Item = hszAppName) then
             return 1;
	else
	     return 0;
	end if;

      when DDEML.XTYP_ADVDATA =>
         -- Data is comming in.  We don't bother with XTYP_POKE transactions,
         -- but if we did, they would go here.  Since we only allow links
         -- on our item and our format, we need not check these here.
        if DDEML.DdeGetData(hData, To_PBYTE(InCount'Access), 
               InCount'Size/8, 0) /= 0 
        then
            bResult := DDEML.DdeSetUserHandle(hConv, DDEML.QID_SYNC, 
                                              Win32.DWORD(InCount));
        end if;
         -- update ourselves to reflect the new incomming data.
        bResult := WinUser.InvalidateRect(hwndMain, NULL, Win32.TRUE);
         -- This transaction requires a flag return value.  We could also
         -- stick other status bits here if needed but its not recommended.
        return DDEML.HDDEDATA(DDEML.DDE_FACK);

      when DDEML.XTYP_EXECUTE =>
         -- Another instance wants us to do something.  DdeAccessData()
         -- makes parsing of execute strings easy.  Also note, that DDEML
         -- will automatically give us the string in the right form
         -- (UNICODE vs ASCII) depending on which form of DdeInitialize()
         -- we called.
        pszExec := DDEML.DdeAccessData(hData, NULL);
        if pszExec /= null then
            if fActive and (szPause = pszExec.all) then
                bResult := WinUser.KillTimer(hwndMain, 1);
                fActive := FALSE;
                bResult := WinUser.InvalidateRect(hwndMain, NULL, Win32.TRUE);
                bResult := WinUser.UpdateWindow(hwndMain);
            elsif not fActive and (szResume = pszExec.all) then
                uResult := WinUser.SetTimer(hwndMain, 1, BASE_TIMEOUT, NULL);
                fActive := TRUE;
                bResult := WinUser.InvalidateRect(hwndMain, NULL, Win32.TRUE);
                bResult := WinUser.UpdateWindow(hwndMain);
            end if;
             -- The beep gives good feedback on how fast the execute was.
            bResult := WinUser.MessageBeep(0);
        end if;
        

      when DDEML.XTYP_DISCONNECT =>
         -- Somebody went away, repaint so we update our cConvs count.
        bResult := WinUser.InvalidateRect(hwndMain, NULL, Win32.TRUE);
        

      when DDEML.XTYP_REGISTER =>
         -- Since a new server just arrived, lets make sure our links are
         -- up to date.  Note that only one link on a
         -- conversation/topic/item/format set will work anyway so we don't
         -- worry about duplicate links.
         --
         -- Note also that we are using hszItem - which is the InstanceSpecific
         -- name of the server that is registering.  This greatly reduces the
         -- number of messages that go flying around.
        hConvList := DDEML.DdeConnectList(idInst, hsz_Item, hszAppName, 
                                          hConvList, NULL);
        BroadcastTransaction(NULL, 0, OurFormat, DDEML.XTYP_ADVSTART);
        bResult := WinUser.SetWindowPos(hwndMain, System.Null_Address, 
                                        0, 0, cxText,
                                        (cyText * (cConvs + 1)) + cyTitle, 
                                        WinUser.SWP_NOMOVE or 
                                        WinUser.SWP_NOZORDER);
        bResult := WinUser.UpdateWindow(hwndMain);
        return DDEML.HDDEDATA(Win32.True);

	  when others =>
	  	null;
    end case;
    return 0;

end DdeCallBack;

begin

    szTitle := CP(szTitle_str);

    szApp := CP(szApp_str);



-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED "AS IS" WITHOUT 
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT 
-- LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR 
-- A PARTICULAR PURPOSE.  The user assumes the entire risk as to the accuracy 
-- and the use of this file.  This file may be used only by licensees of 
-- Microsoft Corporation's WIN32 Software Development Kit in accordance with 
-- the terms of the licensee's End-User License Agreement for Microsoft 
-- Software for the WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are 
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end DdemoPkg;
