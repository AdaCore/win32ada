-- $Source$ 
-- $Revision$ $Date$ $Author$ 

--/****************************************************************************\
--*
--* DDEMO.ADB
--*
--* This file implements a simple DDEML sample application that demonstrates
--* some of the ways the DDEML APIs can be used.
--*
--* Each instance of this application becomes both a DDE client and a DDE
--* server with any other instances of this application that are found.
--*
--* Since it assumes it is talking to itself, this program takes some liberties
--* to simplify things.  For instance, this application does not support the
--* standard SysTopic topic and does not use any standard formats.
--*
--* The basic concepts this application will show you are:
--*                                             
--*   How to handle links			
--*   How to use lists of conversations properly
--*   How to handle simple asynchronous transactions
--*   How to use your own custom formats
--*
-- ------------------------------------------------------------------
-- To use this demo:
-- From a command prompt, type "start ddemo" multiple times.
-- Each instance of ddemo represents one counter, and the counters of all
--    active instances of the application show in every window.
-- You start the counter for an instance by pushing the left mouse button on its
--    window, and stop it by pressing the right mouse button.  Typing 'b' in a 
--    window will cause it to throw an unhandled exception (verifying that the
--    other instances handle that correctly).
--
-- ------------------------------------------------------------------


with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with DDEmoPkg; use DDEmoPkg;
with Interfaces.C;
with Interfaces.C.Strings;
with System;
with Win32;	use Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winuser;
with Win32.WinMain;
with Win32.DDEML;

use type Interfaces.C.INT;
use type Interfaces.C.LONG;
use type Win32.Windef.HWND;


procedure DDEMO is

    -- define dummy variables to hold results of function calls
    lResult : Win32.LONG;

    hdc:   Windef.HDC;
    hInst: WinDef.HINSTANCE;            -- our instance/module handle
    MSG:   Winuser.LPMSG;

    use type Win32.DWORD;
    use type Win32.UINT;


--  FUNCTION: InitApplication(HINSTANCE)
--
--  PURPOSE: Initializes window data and registers window class
--
--  COMMENTS:
--
--  This function is called at initialization time only if no other
--  instances of the application are running.  This function performs
--  initialization tasks that can be done once for any number of running
--  instances.
--
--  In this case, we initialize a window class by filling out a data
--  structure of type WNDCLASS and calling the Windows RegisterClass()
--  function.  Since all instances of this application use the same window
--  class, we only need to do this when the first instance is initialized.

function InitApplication(hInstance : Windef.HINSTANCE)
    return Win32.BOOL is

  WC_Ptr : Win32.Winuser.PWNDCLASSA;
begin
  wc :=(
        style         => 0,
        lpfnWndProc   => MainWndProc'Access,
        cbClsExtra    => 0,					  
        cbWndExtra    => 0,
        hInstance     => hInstance, 
        hIcon         => System.Null_Address,
        hCursor       => WinUser.LoadCursor(System.Null_Address,
                                          Win32.LPCSTR(WinUser.IDC_ARROW)),
        hbrBackground => System.Null_Address,
        lpszMenuName  => null,
        lpszClassName => szTitle);
  WC_Ptr := WC'Access;
  --  Register the window class and return success/failure code.
  return Win32.BOOL (Winuser.RegisterClass
                           (Winuser.ac_WNDCLASSA_t(WC_Ptr)));

end InitApplication;



begin  -- DDemo
     HINST := WinMain.Get_Hinstance;
     bResult := InitApplication(HINST);

	 -- Here we tell DDEML what we will be doing.
     --
     -- 1) We let it know our callback proc address - MakeProcInstance
     --      is called just to be more portable.
     -- 2) Filter-inits - don't accept any WM_DDE_INITIATE messages for
     --      anything but our registered service name.
     -- 3) Don't bother to notify us of confirmed connections
     -- 4) Don't allow connections with ourselves.
     -- 5) Don't bother us with XTYP_POKE transactions.

    uResult := DDEML.DdeInitialize(idInst'Access, DdeCallback'Access,
				            DDEML.APPCMD_FILTERINITS or
				            DDEML.CBF_SKIP_CONNECT_CONFIRMS or
				            DDEML.CBF_FAIL_SELFCONNECTIONS or
				            DDEML.CBF_FAIL_POKES,
				            0);

     --  Create a main window for this application instance.
     hwndMain := WinUser.CreateWindow (
            lpClassName  => szTitle,
            lpWindowName => szTitle,
            dwStyle      => WinUser.WS_CAPTION or 
	                    WinUser.WS_BORDER or 
                            WinUser.WS_SYSMENU,
            X            => WinUser.CW_USEDEFAULT, 
            Y            => WinUser.CW_USEDEFAULT,
            nWidth       => 0,
            nHeight      => 0,
            hWndParent   => System.Null_Address,
            hMenu        => System.Null_Address,
            hInstance    => HINST,
            lpParam      => System.Null_Address);

     --   If window could not be created, return "failure"
     if hwndMain = System.Null_Address then
          bResult := DDEML.DdeUninitialize(idInst);
          return;
     end if;

     hdc := WinUser.GetDC(hwndMain);
     bResult := Wingdi.GetTextMetrics(hdc, metrics'Access);

    cyText := Win32.INT(metrics.tmHeight + metrics.tmExternalLeading);
    cxText := Win32.INT(metrics.tmMaxCharWidth * 8);
    cyTitle := WinUser.GetSystemMetrics(WinUser.SM_CYCAPTION);
    iResult := WinUser.ReleaseDC(hwndMain, hdc);

    bResult := WinUser.SetWindowPos(hwndMain, System.Null_Address, 0, 0, 
                        cxText, cyText + cyTitle,
            		WinUser.SWP_NOMOVE or WinUser.SWP_NOZORDER or
            		WinUser.SWP_NOREDRAW or WinUser.SWP_NOACTIVATE);
    bResult := WinUser.ShowWindow(hwndMain, WinMain.Get_nCmdShow);
    bResult := WinUser.UpdateWindow(hwndMain);


     -- Initialize all our string handles for lookups later
    hszAppName := DDEML.DdeCreateStringHandle(idInst, szApp, 0);

     -- Register our formats
    OurFormat := WinUser.RegisterClipboardFormat(Win32.LPCSTR(szApp));

     -- Connect to any other instances of ourselves that may already be
     -- running.
    hConvList := DDEML.DdeConnectList(idInst, hszAppName, hszAppName, 
                                      hConvList, NULL);

     -- Register our service -
     --  This will cause DDEML to notify DDEML clients about the existance
     --  of a new DDE service.
    hddeResult := DDEML.DdeNameService(idInst, hszAppName, 0, 
                                       DDEML.DNS_REGISTER);

    -- Acquire and dispatch messages until a WM_QUIT message is received.
    MSG := new Winuser.MSG;
    while (Winuser.GetMessage (MSG, System.Null_Address, 
                               Win32.UINT(0), Win32.UINT(0)) /= 0)
        loop
            bResult := Winuser.TranslateMessage(Winuser.ac_MSG_t(MSG));
            lResult := Winuser.DispatchMessage(Winuser.ac_MSG_t(MSG));
        end loop;

    bResult := Winuser.DestroyWindow(hwndMain);
    bResult := Winuser.UnregisterClass(szTitle, hInst);

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

end DDEMO;


