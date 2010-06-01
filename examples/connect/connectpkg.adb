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

with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;
with Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winmain;
with Win32.Winuser;

package body ConnectPkg is

   use Win32;
   use Win32.Windef;
   use Win32.Wingdi;
   use Win32.Winuser;

   use type Interfaces.C.char_array;
   use type System.Address;
   use type Interfaces.C.int;

   MAXPOINTS : constant := 1000;
   type POINT_Array is array (0 .. MAXPOINTS - 1) of POINTS;
   points : POINT_Array;
   nCount : Integer := 0;

   function WndProc
     (hwnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT
   is
      hdc : Win32.Windef.HDC;
      function To_DWORD is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         Win32.DWORD);
      dwLparam : constant Win32.DWORD := To_DWORD (lParam);
      IgnoredC : Win32.Windef.COLORREF;
      IgnoredI : Win32.INT;

      use type Interfaces.C.unsigned;
   begin
      case msg is
         when WM_LBUTTONDOWN =>
            nCount   := 0;
            IgnoredB := InvalidateRect (hwnd, null, Win32.TRUE);

         when WM_MOUSEMOVE =>
            if (((wParam and MK_LBUTTON) /= 0) and
                (nCount < MAXPOINTS))
            then
               points (nCount) := MAKEPOINTS (dwLparam);
               nCount          := nCount + 1;
               hdc             := GetDC (hwnd);
               IgnoredC        :=
                  SetPixel
                    (hdc,
                     INT (LOWORD (dwLparam)),
                     INT (HIWORD (dwLparam)),
                     0);
               IgnoredI        := ReleaseDC (hwnd, hdc);
            end if;

         when WM_LBUTTONUP =>
            IgnoredB := InvalidateRect (hwnd, null, Win32.FALSE);

         when WM_PAINT =>
            hdc := BeginPaint (hwnd, ps'Access);

            for i in 0 .. nCount - 2 loop
               for j in 1 .. nCount - 1 loop
                  IgnoredB :=
                     MoveToEx
                       (hdc,
                        INT (points (i).x),
                        INT (points (i).y),
                        null);
                  IgnoredB :=
                     LineTo (hdc, INT (points (j).x), INT (points (j).y));
               end loop;
            end loop;

            IgnoredB := EndPaint (hwnd, ps'Access);

         when WM_DESTROY =>
            PostQuitMessage (0);

         when others =>
            return DefWindowProc (hwnd, msg, wParam, lParam);
      end case;

      return 0;
   end WndProc;

end ConnectPkg;
