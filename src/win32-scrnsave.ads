--  $Source$
--  $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
--  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
--  FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
--  the accuracy and the use of this file.  This file may be used, copied,
--  modified and distributed only by licensees of Microsoft Corporation's
--  WIN32 Software Development Kit in accordance with the terms of the
--  licensee's End-User License Agreement for Microsoft Software for the
--  WIN32 Development Kit.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Portions (c) 1985-1994 Microsoft Corporation with permission.
--  Microsoft is a registered trademark and Windows and Windows NT are
--  trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

with Win32.Windef;
with Win32.Winnt;

package Win32.Scrnsave is

   IDS_DESCRIPTION : constant := 1;                  --  scrnsave.h:47
   ID_APP : constant := 100;                --  scrnsave.h:54
   DLG_SCRNSAVECONFIGURE : constant := 2003;               --  scrnsave.h:55
   idsIsPassword : constant := 1000;               --  scrnsave.h:57
   idsIniFile : constant := 1001;               --  scrnsave.h:58
   idsScreenSaver : constant := 1002;               --  scrnsave.h:59
   idsPassword : constant := 1003;               --  scrnsave.h:60
   idsDifferentPW : constant := 1004;               --  scrnsave.h:61
   idsChangePW : constant := 1005;               --  scrnsave.h:62
   idsBadOldPW : constant := 1006;               --  scrnsave.h:63
   idsAppName : constant := 1007;               --  scrnsave.h:64
   idsNoHelpMemory : constant := 1008;               --  scrnsave.h:65
   idsHelpFile : constant := 1009;               --  scrnsave.h:66
   WS_GT : constant := 16#30000#;          --  scrnsave.h:136
   MAXFILELEN : constant := 13;                 --  scrnsave.h:138
   TITLEBARNAMELEN : constant := 40;                 --  scrnsave.h:139
   APPNAMEBUFFERLEN : constant := 40;                 --  scrnsave.h:140
   BUFFLEN : constant := 255;                --  scrnsave.h:141

   hMainInstance : Win32.Winnt.HANDLE;                     --  scrnsave.h:144
   hMainWindow : Win32.Windef.HWND;                      --  scrnsave.h:145
   szName : Win32.Winnt.TCHAR_Array (0 .. TITLEBARNAMELEN - 1);
   --  scrnsave.h:146
   szAppName : Win32.Winnt.TCHAR_Array (0 .. APPNAMEBUFFERLEN - 1);
   --  scrnsave.h:147
   szIniFile : Win32.Winnt.TCHAR_Array (0 .. MAXFILELEN - 1);
   --  scrnsave.h:148
   szScreenSaver : Win32.Winnt.TCHAR_Array (0 .. 21);
   --  scrnsave.h:149
   szHelpFile : Win32.Winnt.TCHAR_Array (0 .. MAXFILELEN - 1);
   --  scrnsave.h:150
   szNoHelpMemory : Win32.Winnt.TCHAR_Array (0 .. BUFFLEN - 1);
   --  scrnsave.h:151
   MyHelpMessage : Win32.UINT;                             --  scrnsave.h:152

   function ScreenSaverProc
     (hWnd : Win32.Windef.HWND;
      message : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
     return Win32.LRESULT;                        --  scrnsave.h:74

   function DefScreenSaverProc
     (hWnd : Win32.Windef.HWND;
      msg : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
     return Win32.LRESULT;                        --  scrnsave.h:107

   function ScreenSaverConfigureDialog
     (hDlg : Win32.Windef.HWND;
      message : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
     return Win32.BOOL;                           --  scrnsave.h:115

   function RegisterDialogClasses
     (hInst : Win32.Winnt.HANDLE)
     return Win32.BOOL;                           --  scrnsave.h:122

private

   pragma Import (Stdcall, hMainInstance, "hMainInstance");
   --  scrnsave.h:144
   pragma Import (Stdcall, hMainWindow, "hMainWindow");
   --  scrnsave.h:145
   pragma Import (Stdcall, szName, "szName");
   --  scrnsave.h:146
   pragma Import (Stdcall, szAppName, "szAppName");
   --  scrnsave.h:147
   pragma Import (Stdcall, szIniFile, "szIniFile");
   --  scrnsave.h:148
   pragma Import (Stdcall, szScreenSaver, "szScreenSaver");
   --  scrnsave.h:149
   pragma Import (Stdcall, szHelpFile, "szHelpFile");
   --  scrnsave.h:150
   pragma Import (Stdcall, szNoHelpMemory, "szNoHelpMemory");
   --  scrnsave.h:151
   pragma Import (Stdcall, MyHelpMessage, "MyHelpMessage");
   --  scrnsave.h:152

   pragma Import (Stdcall, ScreenSaverProc, "ScreenSaverProc");
   --  scrnsave.h:74
   pragma Import (Stdcall, DefScreenSaverProc, "DefScreenSaverProc");
   --  scrnsave.h:107
   pragma Import (Stdcall, ScreenSaverConfigureDialog,
                    "ScreenSaverConfigureDialog");
   --  scrnsave.h:115
   pragma Import (Stdcall, RegisterDialogClasses, "RegisterDialogClasses");
   --  scrnsave.h:122

end Win32.Scrnsave;


