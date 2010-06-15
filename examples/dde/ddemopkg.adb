-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (C) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (C) 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

with Win32;         use Win32;
with Win32.Windef;
with Win32.Winuser;
with Win32.Winmain;
with Win32.Ddeml;

with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Interfaces.C;
with Interfaces.C.Strings;
with System;

package body DdemoPkg is

   use type Interfaces.C.int;
   use type Interfaces.C.long;
   use type Interfaces.C.short;
   use type Interfaces.C.unsigned_long;
   use type Interfaces.C.unsigned_char;
   use type Interfaces.C.unsigned;

   use type Win32.Ddeml.HCONVLIST;
   use type Win32.Ddeml.HDDEDATA;
   use type Win32.Ddeml.HCONV;
   use type Win32.Ddeml.HSZ;

   BASE_TIMEOUT : constant := 100;

   szPause     : aliased constant Win32.BYTE := 77;
   szPause_Ptr : Win32.PCBYTE                := szPause'Access;

   szResume     : aliased constant Win32.BYTE := 88;
   szResume_Ptr : Win32.PCBYTE                := szResume'Access;

   fActive : Boolean;

   InCount : aliased Win32.INT := 0;
   cConvs  : Win32.INT         := 0;
   count   : aliased Win32.INT := 0;

   rc : aliased Windef.RECT;
   ps : aliased Winuser.PAINTSTRUCT;
   ci : aliased Ddeml.CONVINFO;

   rct : aliased Windef.RECT;

   dwResult : aliased Win32.DWORD;

   package INT_IO is new Ada.Text_IO.Integer_IO (Win32.INT);

   function CP (C_Str : CHAR_Array) return Win32.PCSTR is
      function UC is new Ada.Unchecked_Conversion (
         System.Address,
         Win32.PCSTR);
   begin
      return UC (C_Str (C_Str'First)'Address);
   end CP;

   procedure BroadcastTransaction
     (pSrc   : Win32.PCBYTE;
      cbData : Win32.DWORD;
      fmt    : Win32.UINT;
      xtyp   : Win32.UINT)
   is
      hConv     : Ddeml.HCONV;
      cConvsOrg : Win32.INT;
   begin
      cConvsOrg := cConvs;
      cConvs    := 0;
      if hConvList /= 0 then
         hConv := Ddeml.DdeQueryNextServer (hConvList, 0);
         while hConv /= 0 loop
            cConvs := cConvs + 1;

            if Ddeml.DdeClientTransaction
                  (pSrc,
                   cbData,
                   hConv,
                   hszAppName,
                   fmt,
                   xtyp,
                   Ddeml.TIMEOUT_ASYNC,
                   dwResult'Access) /=
               0
            then

               bResult :=
                  Ddeml.DdeAbandonTransaction (idInst, hConv, dwResult);
            end if;

            hConv := Ddeml.DdeQueryNextServer (hConvList, hConv);
         end loop;
      end if;
      if cConvs /= cConvsOrg then
         bResult := Winuser.InvalidateRect (hwndMain, null, Win32.TRUE);
      end if;
   end BroadcastTransaction;

   procedure MyProcessKey (tchCode : Win32.LONG; lKeyData : Win32.LONG) is
   begin
      if tchCode = Win32.CHAR'Pos ('B') or
         tchCode = Win32.CHAR'Pos ('b')
      then
         raise Program_Error;
      end if;
   end MyProcessKey;

   procedure PaintDemo (hwnd : Windef.HWND) is
      hConv       : Ddeml.HCONV;
      cConvsOrg   : Win32.INT := cConvs;
      int_str     : String (1 .. 20);
      int_c_arr   : Interfaces.C.char_array (0 .. 20);
      hdcResult   : Windef.HDC;
      colorResult : Windef.COLORREF;
   begin
      hdcResult := Winuser.BeginPaint (hwnd, ps'Access);

      bResult     := Winuser.SetRect (rc'Access, 0, 0, cxText, cyText);
      iResult     := Wingdi.SetBkMode (ps.hdc, Wingdi.TRANSPARENT);
      colorResult := Wingdi.SetTextColor (ps.hdc, 16#00FFFFFF#);

      if fActive = True then
         iResult :=
            Winuser.FillRect
              (ps.hdc,
               rc'Access,
               Windef.HBRUSH (Wingdi.GetStockObject (Wingdi.BLACK_BRUSH)));
      else
         iResult :=
            Winuser.FillRect
              (ps.hdc,
               rc'Access,
               Windef.HBRUSH (Wingdi.GetStockObject (Wingdi.GRAY_BRUSH)));
      end if;

      INT_IO.Put (int_str, count);
      int_c_arr := Interfaces.C.To_C (int_str);
      iResult   :=
         Winuser.DrawText
           (ps.hdc,
            LPCSTR (CP (Win32.To_Win (int_c_arr))),
            -1,
            rc'Access,
            Winuser.DT_CENTER or Winuser.DT_VCENTER);

      if hConvList /= 0 then
         bResult     := Winuser.OffsetRect (rc'Access, 0, cyText);
         colorResult := Wingdi.SetTextColor (ps.hdc, 0);
         cConvs      := 0;
         hConv       := Ddeml.DdeQueryNextServer (hConvList, 0);

         while hConv /= 0 loop
            cConvs  := cConvs + 1;
            ci.cb   := Ddeml.CONVINFO'Size / 8;
            uResult :=
               Ddeml.DdeQueryConvInfo (hConv, Ddeml.QID_SYNC, ci'Access);
            iResult :=
               Winuser.FillRect
                 (ps.hdc,
                  rc'Access,
                  Windef.HBRUSH (Wingdi.GetStockObject (Wingdi.WHITE_BRUSH)));
            INT_IO.Put (int_str, Win32.INT (ci.hUser));
            int_c_arr := Interfaces.C.To_C (int_str);
            iResult   :=
               Winuser.DrawText
                 (ps.hdc,
                  LPCSTR (CP (Win32.To_Win (int_c_arr))),
                  -1,
                  rc'Access,
                  Winuser.DT_CENTER or Winuser.DT_VCENTER);
            bResult   := Winuser.OffsetRect (rc'Access, 0, cyText);
            hConv     := Ddeml.DdeQueryNextServer (hConvList, hConv);
         end loop;
      end if;

      bResult := Winuser.EndPaint (hwnd, ps'Access);
      if cConvsOrg /= cConvs then
         bResult :=
            Winuser.SetWindowPos
              (hwndMain,
               System.Null_Address,
               0,
               0,
               cxText,
               (cyText * (cConvs + 1)) + cyTitle,
               Winuser.SWP_NOMOVE or
               Winuser.SWP_NOZORDER or
               Winuser.SWP_NOACTIVATE);
      end if;
   end PaintDemo;

   function MainWndProc
     (hwnd    : Windef.HWND;
      message : Win32.UINT;
      wParam  : Win32.WPARAM;
      lParam  : Win32.LPARAM)
      return Win32.LRESULT
   is
   begin
      case MESSAGE is
         when Winuser.WM_CREATE =>
            fActive := False;

         when Winuser.WM_RBUTTONDOWN =>
            if Winuser.GetKeyState (Winuser.VK_CONTROL) < 0 then

               BroadcastTransaction (szPause_Ptr, 1, 0, Ddeml.XTYP_EXECUTE);
               bResult := Winuser.MessageBeep (0);
            end if;
            bResult := Winuser.KillTimer (hwndMain, 1);
            fActive := False;
            bResult := Winuser.InvalidateRect (HWND, null, Win32.TRUE);
            bResult := Winuser.UpdateWindow (HWND);

         when Winuser.WM_LBUTTONDOWN =>
            if Winuser.GetKeyState (Winuser.VK_CONTROL) < 0 then
               BroadcastTransaction (szResume_Ptr, 1, 0, Ddeml.XTYP_EXECUTE);
               bResult := Winuser.MessageBeep (0);
            end if;
            uResult := Winuser.SetTimer (hwndMain, 1, BASE_TIMEOUT, null);
            fActive := True;
            bResult := Winuser.InvalidateRect (HWND, null, Win32.TRUE);
            bResult := Winuser.UpdateWindow (HWND);

         when Winuser.WM_CHAR =>
            MyProcessKey (Win32.LONG (WPARAM), Win32.LONG (LPARAM));

         when Winuser.WM_TIMER =>
            count   := count + 1;
            bResult := Ddeml.DdePostAdvise (idInst, hszAppName, hszAppName);
            bResult := Winuser.SetRect (rct'Access, 0, 0, cxText, cyText);
            bResult :=
               Winuser.InvalidateRect (hwndMain, rct'Access, Win32.TRUE);
            bResult := Winuser.UpdateWindow (hwndMain);

         when Winuser.WM_PAINT =>
            PaintDemo (HWND);

         when Winuser.WM_CLOSE =>
            bResult    := Winuser.KillTimer (HWND, 1);
            bResult    := Ddeml.DdeDisconnectList (hConvList);
            hddeResult :=
               Ddeml.DdeNameService (idInst, 0, 0, Ddeml.DNS_UNREGISTER);
            bResult    := Ddeml.DdeFreeStringHandle (idInst, hszAppName);
            bResult    := Ddeml.DdeUninitialize (idInst);
            Winuser.PostQuitMessage (0);

         when others =>
            return Winuser.DefWindowProc (HWND, MESSAGE, WPARAM, LPARAM);
      end case;
      return (0);
   end MainWndProc;

   function DdeCallBack
     (wType     : Win32.UINT;
      wFmt      : Win32.UINT;
      hConv     : Ddeml.HCONV;
      hsz_topic : Ddeml.HSZ;
      hsz_item  : Ddeml.HSZ;
      hData     : Ddeml.HDDEDATA;
      lData1    : Win32.DWORD;
      lData2    : Win32.DWORD)
      return Ddeml.HDDEDATA
   is
      pszExec : Win32.PBYTE;
      function To_PBYTE is new Ada.Unchecked_Conversion (Win32.PINT, PBYTE);
   begin
      case wType is
         when Ddeml.XTYP_CONNECT =>
            return Ddeml.HDDEDATA (Win32.TRUE);

         when Ddeml.XTYP_ADVREQ | Ddeml.XTYP_REQUEST =>
            return Ddeml.HDDEDATA (Ddeml.DdeCreateDataHandle
                                      (idInst,
                                       To_PBYTE (count'Access),
                                       count'Size / 8,
                                       0,
                                       hszAppName,
                                       OurFormat,
                                       0));

         when Ddeml.XTYP_ADVSTART =>
            if (wFmt = OurFormat) and (hsz_item = hszAppName) then
               return 1;
            else
               return 0;
            end if;

         when Ddeml.XTYP_ADVDATA =>
            if Ddeml.DdeGetData
                  (hData,
                   To_PBYTE (InCount'Access),
                   InCount'Size / 8,
                   0) /=
               0
            then
               bResult :=
                  Ddeml.DdeSetUserHandle
                    (hConv,
                     Ddeml.QID_SYNC,
                     Win32.DWORD (InCount));
            end if;
            bResult := Winuser.InvalidateRect (hwndMain, null, Win32.TRUE);
            return Ddeml.HDDEDATA (Ddeml.DDE_FACK);

         when Ddeml.XTYP_EXECUTE =>
            pszExec := Ddeml.DdeAccessData (hData, null);
            if pszExec /= null then
               if fActive and (szPause = pszExec.all) then
                  bResult := Winuser.KillTimer (hwndMain, 1);
                  fActive := False;
                  bResult :=
                     Winuser.InvalidateRect (hwndMain, null, Win32.TRUE);
                  bResult := Winuser.UpdateWindow (hwndMain);
               elsif not fActive and (szResume = pszExec.all) then
                  uResult :=
                     Winuser.SetTimer (hwndMain, 1, BASE_TIMEOUT, null);
                  fActive := True;
                  bResult :=
                     Winuser.InvalidateRect (hwndMain, null, Win32.TRUE);
                  bResult := Winuser.UpdateWindow (hwndMain);
               end if;
               bResult := Winuser.MessageBeep (0);
            end if;

         when Ddeml.XTYP_DISCONNECT =>
            bResult := Winuser.InvalidateRect (hwndMain, null, Win32.TRUE);

         when Ddeml.XTYP_REGISTER =>
            hConvList :=
               Ddeml.DdeConnectList
                 (idInst,
                  hsz_item,
                  hszAppName,
                  hConvList,
                  null);
            BroadcastTransaction (null, 0, OurFormat, Ddeml.XTYP_ADVSTART);
            bResult :=
               Winuser.SetWindowPos
                 (hwndMain,
                  System.Null_Address,
                  0,
                  0,
                  cxText,
                  (cyText * (cConvs + 1)) + cyTitle,
                  Winuser.SWP_NOMOVE or Winuser.SWP_NOZORDER);
            bResult := Winuser.UpdateWindow (hwndMain);
            return Ddeml.HDDEDATA (Win32.TRUE);

         when others =>
            null;
      end case;
      return 0;

   end DdeCallBack;

begin
   szTitle := CP (szTitle_str);
   szApp := CP (szApp_str);
end DdemoPkg;
