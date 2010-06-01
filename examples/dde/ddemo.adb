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

with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with DdemoPkg;                 use DdemoPkg;
with Interfaces.C;
with Interfaces.C.Strings;
with System;
with Win32;                    use Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winuser;
with Win32.Winmain;
with Win32.Ddeml;

use type Interfaces.C.int;
use type Interfaces.C.long;
use type Win32.Windef.HWND;

procedure DDEMO is

   lResult : Win32.LONG;

   hdc   : Windef.HDC;
   hInst : Windef.HINSTANCE;
   MSG   : Winuser.LPMSG;

   use type Win32.DWORD;
   use type Win32.UINT;

   function InitApplication
     (hInstance : Windef.HINSTANCE)
      return Win32.BOOL
   is
      WC_Ptr : Win32.Winuser.PWNDCLASSA;
   begin
      wc     :=
        (style         => 0,
         lpfnWndProc   => MainWndProc'Access,
         cbClsExtra    => 0,
         cbWndExtra    => 0,
         hInstance     => hInstance,
         hIcon         => System.Null_Address,
         hCursor       => Winuser.LoadCursor
                            (System.Null_Address,
                             Win32.LPCSTR (Winuser.IDC_ARROW)),
         hbrBackground => System.Null_Address,
         lpszMenuName  => null,
         lpszClassName => szTitle);
      WC_Ptr := wc'Access;
      return Win32.BOOL (Winuser.RegisterClass
                            (Winuser.ac_WNDCLASSA_t (WC_Ptr)));

   end InitApplication;

begin
   hInst   := Winmain.Get_hInstance;
   bResult := InitApplication (hInst);

   uResult :=
      Ddeml.DdeInitialize
        (idInst'Access,
         DdeCallBack'Access,
         Ddeml.APPCMD_FILTERINITS or
         Ddeml.CBF_SKIP_CONNECT_CONFIRMS or
         Ddeml.CBF_FAIL_SELFCONNECTIONS or
         Ddeml.CBF_FAIL_POKES,
         0);

   hwndMain :=
      Winuser.CreateWindow
        (lpClassName  => szTitle,
         lpWindowName => szTitle,
         dwStyle      => Winuser.WS_CAPTION or
                         Winuser.WS_BORDER or
                         Winuser.WS_SYSMENU,
         X            => Winuser.CW_USEDEFAULT,
         Y            => Winuser.CW_USEDEFAULT,
         nWidth       => 0,
         nHeight      => 0,
         hWndParent   => System.Null_Address,
         hMenu        => System.Null_Address,
         hInstance    => hInst,
         lpParam      => System.Null_Address);

   if hwndMain = System.Null_Address then
      bResult := Ddeml.DdeUninitialize (idInst);
      return ;
   end if;

   hdc     := Winuser.GetDC (hwndMain);
   bResult := Wingdi.GetTextMetrics (hdc, metrics'Access);

   cyText  := Win32.INT (metrics.tmHeight + metrics.tmExternalLeading);
   cxText  := Win32.INT (metrics.tmMaxCharWidth * 8);
   cyTitle := Winuser.GetSystemMetrics (Winuser.SM_CYCAPTION);
   iResult := Winuser.ReleaseDC (hwndMain, hdc);

   bResult :=
      Winuser.SetWindowPos
        (hwndMain,
         System.Null_Address,
         0,
         0,
         cxText,
         cyText + cyTitle,
         Winuser.SWP_NOMOVE or
         Winuser.SWP_NOZORDER or
         Winuser.SWP_NOREDRAW or
         Winuser.SWP_NOACTIVATE);
   bResult := Winuser.ShowWindow (hwndMain, Winmain.Get_nCmdShow);
   bResult := Winuser.UpdateWindow (hwndMain);

   hszAppName := Ddeml.DdeCreateStringHandle (idInst, szApp, 0);

   OurFormat := Winuser.RegisterClipboardFormat (Win32.LPCSTR (szApp));

   hConvList :=
      Ddeml.DdeConnectList (idInst, hszAppName, hszAppName, hConvList, null);

   hddeResult :=
      Ddeml.DdeNameService (idInst, hszAppName, 0, Ddeml.DNS_REGISTER);

   MSG := new Winuser.MSG;
   while (Winuser.GetMessage
             (MSG,
              System.Null_Address,
              Win32.UINT (0),
              Win32.UINT (0)) /=
          0)
   loop
      bResult := Winuser.TranslateMessage (Winuser.ac_MSG_t (MSG));
      lResult := Winuser.DispatchMessage (Winuser.ac_MSG_t (MSG));
   end loop;

   bResult := Winuser.DestroyWindow (hwndMain);
   bResult := Winuser.UnregisterClass (szTitle, hInst);

end DDEMO;
