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

package Win32.Cpl is

   WM_CPL_LAUNCH        : constant := 16#7e8#;
   WM_CPL_LAUNCHED      : constant := 16#7e9#;
   CPL_INIT             : constant := 1;
   CPL_GETCOUNT         : constant := 2;
   CPL_INQUIRE          : constant := 3;
   CPL_SELECT           : constant := 4;
   CPL_DBLCLK           : constant := 5;
   CPL_STOP             : constant := 6;
   CPL_EXIT             : constant := 7;
   CPL_NEWINQUIRE       : constant := 8;
   CPL_DO_PRINTER_SETUP : constant := 100;
   CPL_DO_NETPRN_SETUP  : constant := 101;
   CPL_SETUP            : constant := 200;

   type CPLINFO;
   type NEWCPLINFOA;
   type NEWCPLINFOW;

   type LPCPLINFO is access all CPLINFO;
   type LPNEWCPLINFOA is access all NEWCPLINFOA;
   type LPNEWCPLINFOW is access all NEWCPLINFOW;
   subtype LPNEWCPLINFO is LPNEWCPLINFOA;

   type APPLET_PROC is access function
     (hwndCpl : Win32.Windef.HWND;
      msg     : Win32.UINT;
      lParam1 : Win32.LONG;
      lParam2 : Win32.LONG)
      return Win32.LONG;
   pragma Convention (Stdcall, APPLET_PROC);

   type CPLINFO is record
      idIcon : Win32.INT;
      idName : Win32.INT;
      idInfo : Win32.INT;
      lData  : Win32.LONG;
   end record;

   type NEWCPLINFOA is record
      dwSize        : Win32.DWORD;
      dwFlags       : Win32.DWORD;
      dwHelpContext : Win32.DWORD;
      lData         : Win32.LONG;
      hIcon         : Win32.Windef.HICON;
      szName        : Win32.CHAR_Array (0 .. 31);
      szInfo        : Win32.CHAR_Array (0 .. 63);
      szHelpFile    : Win32.CHAR_Array (0 .. 127);
   end record;

   subtype NEWCPLINFO is NEWCPLINFOA;

   type NEWCPLINFOW is record
      dwSize        : Win32.DWORD;
      dwFlags       : Win32.DWORD;
      dwHelpContext : Win32.DWORD;
      lData         : Win32.LONG;
      hIcon         : Win32.Windef.HICON;
      szName        : Win32.WCHAR_Array (0 .. 31);
      szInfo        : Win32.WCHAR_Array (0 .. 63);
      szHelpFile    : Win32.WCHAR_Array (0 .. 127);
   end record;

private

   pragma Convention (C_Pass_By_Copy, CPLINFO);
   pragma Convention (C, NEWCPLINFOA);
   pragma Convention (C, NEWCPLINFOW);

end Win32.Cpl;
