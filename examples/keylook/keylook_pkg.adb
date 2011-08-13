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
--  Copyright (C) 2000-2011, AdaCore
--
-------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with Interfaces.C;
with Stdarg;
with System;

package body Keylook_Pkg is

   ps : aliased Win32.Winuser.PAINTSTRUCT;
   tm : aliased Win32.Wingdi.TEXTMETRIC;

   function CP (C_Str : Win32.CHAR_Array) return Win32.LPCSTR is
      function UC is new Ada.Unchecked_Conversion (
         System.Address,
         Win32.LPCSTR);
   begin
      return UC (C_Str (C_Str'First)'Address);
   end CP;

   function To_DWORD is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.DWORD);

   use type Win32.CHAR_Array;
   Nul : Win32.CHAR renames Win32.Nul;

   procedure ShowKey
     (hwnd    : Win32.Windef.HWND;
      iType   : Win32.INT;
      Message : Win32.CHAR_Array;
      wParam  : Win32.WPARAM;
      lParam  : Win32.LPARAM)
   is

      use type Interfaces.C.int;
      use type Interfaces.C.unsigned_short;
      use type Interfaces.C.unsigned_long;
      use type Win32.LPARAM;

      F0 : constant Win32.CHAR_Array :=
         "%-14s %3d    %c %6u %4d %3s %3s %4s %4s" & Nul;
      F1 : constant Win32.CHAR_Array :=
         "%-14s %3d    %c %6u %4d %3s %3s %4s %4s" & Nul;

      type Sarray is array (Win32.INT range 0 .. 1) of Win32.LPCSTR;
      szFormat : constant Sarray := (CP (F0), CP (F1));

      szBuffer : Win32.CHAR_Array (0 .. 79);
      hdc      : Win32.Windef.HDC;
      dwLparam : constant Win32.DWORD := To_DWORD (lParam);

      function charparam return Win32.CHAR is
      begin
         if iType /= 0 then
            return Win32.CHAR'Val
                     (Win32.Windef.LOWORD (Win32.DWORD (wParam)) and 16#ff#);
         else
            return ' ';
         end if;
      end charparam;

      function bit25 return Win32.CHAR_Array is
      begin
         if (dwLparam and 16#100_0000#) /= 0 then
            return "Yes" & Nul;
         else
            return "No" & Nul;
         end if;
      end bit25;

      function bit30 return Win32.CHAR_Array is
      begin
         if (dwLparam and 16#2000_0000#) /= 0 then
            return "Yes" & Nul;
         else
            return "No" & Nul;
         end if;
      end bit30;

      function bit31 return Win32.CHAR_Array is
      begin
         if (dwLparam and 16#4000_0000#) /= 0 then
            return "Down" & Nul;
         else
            return "Up" & Nul;
         end if;
      end bit31;

      function bit32 return Win32.CHAR_Array is
         use type Interfaces.C.long;
      begin
         if lParam < 0 then
            return "Up" & Nul;
         else
            return "Down" & Nul;
         end if;
      end bit32;

      function "+"
        (Args : Stdarg.ArgList;
         Arg  : Win32.CHAR_Array)
         return Stdarg.ArgList
      is
         function "&" is new Stdarg.Concat (Win32.LPCSTR);
      begin
         return Args & CP (Arg);
      end "+";

      function "&" is new Stdarg.Concat (Win32.BYTE);
      function "&" is new Stdarg.Concat (Win32.CHAR);
      function "&" is new Stdarg.Concat (Win32.WORD);
      function "&" is new Stdarg.Concat (Win32.UINT);
      function "&" is new Stdarg.Concat (Win32.UINT_PTR);

   begin
      IgnoredB :=
         Win32.Winuser.ScrollWindow
           (hwnd,
            0,
            -cyChar,
            rect'Access,
            rect'Access);
      hdc      := Win32.Winuser.GetDC (hwnd);
      IgnoredH :=
         Win32.Wingdi.SelectObject
           (hdc,
            Win32.Wingdi.GetStockObject (Win32.Wingdi.SYSTEM_FIXED_FONT));
      IgnoredB :=
         Win32.Wingdi.TextOut
           (hdc,
            cxChar,
            Win32.INT (rect.bottom) - cyChar,
            CP (szBuffer),
            Win32.Winuser.wsprintf
               (szBuffer (0)'Unchecked_Access,
                szFormat (iType),
                (Stdarg.Empty + Message) &
                wParam &
                charparam &
                Win32.Windef.LOWORD (dwLparam) &
                Win32.Windef.LOBYTE (Win32.Windef.HIWORD (dwLparam)) +
                bit25 +
                bit30 +
                bit31 +
                bit32));

      IgnoredI := Win32.Winuser.ReleaseDC (hwnd, hdc);
      IgnoredB := Win32.Winuser.ValidateRect (hwnd, null);
   end ShowKey;

   szTop : constant Win32.CHAR_Array :=
      "Message        Key Char Repeat Scan Ext ALT Prev Tran" & Nul;
   szUnd : constant Win32.CHAR_Array :=
      "Message        ___ ____ ______ ____ ___ ___ ____ ____" & Nul;

   function WndProc
     (hwnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT
   is
      use type Interfaces.C.int;
      use type Interfaces.C.long;

      hdc      : Win32.Windef.HDC;
      dwLparam : constant Win32.DWORD := To_DWORD (lParam);

   begin
      case msg is
      when Win32.Winuser.WM_CREATE =>
         hdc      := Win32.Winuser.GetDC (hwnd);
         IgnoredH :=
            Win32.Wingdi.SelectObject
              (hdc,
               Win32.Wingdi.GetStockObject (Win32.Wingdi.SYSTEM_FIXED_FONT));
         IgnoredB := Win32.Wingdi.GetTextMetrics (hdc, tm'Access);
         cxChar   := Win32.INT (tm.tmAveCharWidth);
         cyChar   := Win32.INT (tm.tmHeight);
         IgnoredI := Win32.Winuser.ReleaseDC (hwnd, hdc);
         rect.top := 3 * Win32.LONG (cyChar) / 2;

      when Win32.Winuser.WM_SIZE =>
         rect.right  := Win32.LONG (Win32.Windef.LOWORD (dwLparam));
         rect.bottom := Win32.LONG (Win32.Windef.HIWORD (dwLparam));
         IgnoredB    := Win32.Winuser.UpdateWindow (hwnd);

      when Win32.Winuser.WM_PAINT =>
         IgnoredB := Win32.Winuser.InvalidateRect (hwnd, null, Win32.TRUE);
         hdc      := Win32.Winuser.BeginPaint (hwnd, ps'Access);
         IgnoredH :=
            Win32.Wingdi.SelectObject
              (hdc,
               Win32.Wingdi.GetStockObject (Win32.Wingdi.SYSTEM_FIXED_FONT));
         IgnoredI := Win32.Wingdi.SetBkMode (hdc, Win32.Wingdi.TRANSPARENT);
         IgnoredB :=
            Win32.Wingdi.TextOut
              (hdc,
               cxChar,
               cyChar / 2,
               CP (szTop),
               szTop'Length - 1);
         IgnoredB :=
            Win32.Wingdi.TextOut
              (hdc,
               cxChar,
               cyChar / 2,
               CP (szUnd),
               szUnd'Length - 1);
         IgnoredB := Win32.Winuser.EndPaint (hwnd, ps'Access);

      when Win32.Winuser.WM_KEYDOWN =>
         ShowKey (hwnd, 0, "WM_KEYDOWN" & Nul, wParam, lParam);

      when Win32.Winuser.WM_KEYUP =>
         ShowKey (hwnd, 0, "WM_KEYUP" & Nul, wParam, lParam);

      when Win32.Winuser.WM_CHAR =>
         ShowKey (hwnd, 1, "WM_CHAR" & Nul, wParam, lParam);

      when Win32.Winuser.WM_DEADCHAR =>
         ShowKey (hwnd, 1, "WM_DEADCHAR" & Nul, wParam, lParam);

      when Win32.Winuser.WM_SYSKEYDOWN =>
         ShowKey (hwnd, 0, "WM_SYSKEYDOWN" & Nul, wParam, lParam);

      when Win32.Winuser.WM_SYSKEYUP =>
         ShowKey (hwnd, 0, "WM_SYSKEYUP" & Nul, wParam, lParam);

      when Win32.Winuser.WM_SYSCHAR =>
         ShowKey (hwnd, 1, "WM_SYSCHAR" & Nul, wParam, lParam);

      when Win32.Winuser.WM_SYSDEADCHAR =>
         ShowKey (hwnd, 1, "WM_SYSDEADCHAR" & Nul, wParam, lParam);

      when Win32.Winuser.WM_DESTROY =>
         Win32.Winuser.PostQuitMessage (0);

      when others =>
         return Win32.Winuser.DefWindowProc (hwnd, msg, wParam, lParam);
      end case;

      return 0;
   end WndProc;

end Keylook_Pkg;
