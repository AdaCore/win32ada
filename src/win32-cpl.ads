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

package Win32.Cpl is

   WM_CPL_LAUNCH : constant := 16#7e8#;         --  cpl.h:63
   WM_CPL_LAUNCHED : constant := 16#7e9#;         --  cpl.h:64
   CPL_INIT : constant := 1;               --  cpl.h:118
   CPL_GETCOUNT : constant := 2;               --  cpl.h:124
   CPL_INQUIRE : constant := 3;               --  cpl.h:131
   CPL_SELECT : constant := 4;               --  cpl.h:140
   CPL_DBLCLK : constant := 5;               --  cpl.h:146
   CPL_STOP : constant := 6;               --  cpl.h:153
   CPL_EXIT : constant := 7;               --  cpl.h:159
   CPL_NEWINQUIRE : constant := 8;               --  cpl.h:165
   CPL_DO_PRINTER_SETUP : constant := 100;             --  cpl.h:170
   CPL_DO_NETPRN_SETUP : constant := 101;             --  cpl.h:171
   CPL_SETUP : constant := 200;             --  cpl.h:176

   type CPLINFO;                                           --  cpl.h:73
   type NEWCPLINFOA;                                       --  cpl.h:81
   type NEWCPLINFOW;                                       --  cpl.h:93

   type LPCPLINFO is access all CPLINFO;                   --  cpl.h:79
   type LPNEWCPLINFOA is access all NEWCPLINFOA;           --  cpl.h:111
   type LPNEWCPLINFOW is access all NEWCPLINFOW;           --  cpl.h:112
   subtype LPNEWCPLINFO is LPNEWCPLINFOA;                  --  cpl.h:113

   type APPLET_PROC is access function
     (hwndCpl : Win32.Windef.HWND;
      msg : Win32.UINT;
      lParam1 : Win32.LONG;
      lParam2 : Win32.LONG)
     return Win32.LONG;                           --  cpl.h:69
   pragma Convention (Stdcall, APPLET_PROC);

   type CPLINFO is                                         --  cpl.h:73
      record
         idIcon : Win32.INT;                              --  cpl.h:75
         idName : Win32.INT;                              --  cpl.h:76
         idInfo : Win32.INT;                              --  cpl.h:77
         lData : Win32.LONG;                             --  cpl.h:78
      end record;

   type NEWCPLINFOA is                                     --  cpl.h:81
      record
         dwSize : Win32.DWORD;                     --  cpl.h:83
         dwFlags : Win32.DWORD;                     --  cpl.h:84
         dwHelpContext : Win32.DWORD;                     --  cpl.h:85
         lData : Win32.LONG;                      --  cpl.h:86
         hIcon : Win32.Windef.HICON;              --  cpl.h:87
         szName : Win32.CHAR_Array (0 .. 31);         --  cpl.h:88
         szInfo : Win32.CHAR_Array (0 .. 63);         --  cpl.h:89
         szHelpFile : Win32.CHAR_Array (0 .. 127);        --  cpl.h:90
      end record;

   subtype NEWCPLINFO is NEWCPLINFOA;                      --  cpl.h:108

   type NEWCPLINFOW is                                     --  cpl.h:93
      record
         dwSize        : Win32.DWORD;                  --  cpl.h:95
         dwFlags       : Win32.DWORD;                  --  cpl.h:96
         dwHelpContext : Win32.DWORD;                  --  cpl.h:97
         lData         : Win32.LONG;                   --  cpl.h:98
         hIcon         : Win32.Windef.HICON;           --  cpl.h:99
         szName        : Win32.WCHAR_Array (0 .. 31);  --  cpl.h:100
         szInfo        : Win32.WCHAR_Array (0 .. 63);  --  cpl.h:101
         szHelpFile    : Win32.WCHAR_Array (0 .. 127); --  cpl.h:102
      end record;

private

   pragma Convention (C_Pass_By_Copy, CPLINFO);             --  cpl.h:73
   pragma Convention (C, NEWCPLINFOA);                      --  cpl.h:81
   pragma Convention (C, NEWCPLINFOW);                      --  cpl.h:93

end Win32.Cpl;
