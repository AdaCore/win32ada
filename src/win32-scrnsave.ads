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

with Win32.Windef;
with Win32.Winnt;

package Win32.Scrnsave is

   IDS_DESCRIPTION       : constant := 1;
   ID_APP                : constant := 100;
   DLG_SCRNSAVECONFIGURE : constant := 2003;
   idsIsPassword         : constant := 1000;
   idsIniFile            : constant := 1001;
   idsScreenSaver        : constant := 1002;
   idsPassword           : constant := 1003;
   idsDifferentPW        : constant := 1004;
   idsChangePW           : constant := 1005;
   idsBadOldPW           : constant := 1006;
   idsAppName            : constant := 1007;
   idsNoHelpMemory       : constant := 1008;
   idsHelpFile           : constant := 1009;
   WS_GT                 : constant := 16#30000#;
   MAXFILELEN            : constant := 13;
   TITLEBARNAMELEN       : constant := 40;
   APPNAMEBUFFERLEN      : constant := 40;
   BUFFLEN               : constant := 255;

   hMainInstance  : Win32.Winnt.HANDLE;
   hMainWindow    : Win32.Windef.HWND;
   szName         : Win32.Winnt.TCHAR_Array (0 .. TITLEBARNAMELEN - 1);
   szAppName      : Win32.Winnt.TCHAR_Array (0 .. APPNAMEBUFFERLEN - 1);
   szIniFile      : Win32.Winnt.TCHAR_Array (0 .. MAXFILELEN - 1);
   szScreenSaver  : Win32.Winnt.TCHAR_Array (0 .. 21);
   szHelpFile     : Win32.Winnt.TCHAR_Array (0 .. MAXFILELEN - 1);
   szNoHelpMemory : Win32.Winnt.TCHAR_Array (0 .. BUFFLEN - 1);
   MyHelpMessage  : Win32.UINT;

   function ScreenSaverProc
     (hWnd    : Win32.Windef.HWND;
      message : Win32.UINT;
      wParam  : Win32.WPARAM;
      lParam  : Win32.LPARAM)
      return Win32.LRESULT;

   function DefScreenSaverProc
     (hWnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function ScreenSaverConfigureDialog
     (hDlg    : Win32.Windef.HWND;
      message : Win32.UINT;
      wParam  : Win32.WPARAM;
      lParam  : Win32.LPARAM)
      return Win32.BOOL;

   function RegisterDialogClasses
     (hInst : Win32.Winnt.HANDLE)
      return Win32.BOOL;

private

   pragma Import (Stdcall, hMainInstance, "hMainInstance");
   pragma Import (Stdcall, hMainWindow, "hMainWindow");
   pragma Import (Stdcall, szName, "szName");
   pragma Import (Stdcall, szAppName, "szAppName");
   pragma Import (Stdcall, szIniFile, "szIniFile");
   pragma Import (Stdcall, szScreenSaver, "szScreenSaver");
   pragma Import (Stdcall, szHelpFile, "szHelpFile");
   pragma Import (Stdcall, szNoHelpMemory, "szNoHelpMemory");
   pragma Import (Stdcall, MyHelpMessage, "MyHelpMessage");

   pragma Import (Stdcall, ScreenSaverProc, "ScreenSaverProc");
   pragma Import (Stdcall, DefScreenSaverProc, "DefScreenSaverProc");
   pragma Import
     (Stdcall,
      ScreenSaverConfigureDialog,
      "ScreenSaverConfigureDialog");
   pragma Import (Stdcall, RegisterDialogClasses, "RegisterDialogClasses");

end Win32.Scrnsave;
