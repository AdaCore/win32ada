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

with Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winuser;

package Keylook_Pkg is

   cxChar   : Win32.INT := 0;
   cyChar   : Win32.INT := 0;
   IgnoredB : Win32.BOOL;
   IgnoredH : Win32.Windef.HGDIOBJ;
   IgnoredI : Win32.INT;

   rect : aliased Win32.Windef.RECT := (0, 0, 0, 0);

   msg      : aliased Win32.Winuser.MSG;
   wndclass : aliased Win32.Winuser.WNDCLASS;

   function WndProc
     (hwnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, WndProc);

   function CP (C_Str : Win32.CHAR_Array) return Win32.LPCSTR;

end Keylook_Pkg;
