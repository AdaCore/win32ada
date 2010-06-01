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

with Win32.Utils;

package body Win32.Wingdi is

   function MAKEROP4 (fore, back : DWORD) return DWORD is
      use Interfaces;
   begin
      return DWORD (((Shift_Left (Unsigned_32 (back), 8)) and
                     16#ff00_0000#) or
                    Unsigned_32 (fore));
   end MAKEROP4;

   function MAKEPOINTS (dwValue : DWORD) return Win32.Windef.POINTS is
      Res : Win32.Windef.POINTS;
      use Win32.Utils;
   begin
      Res.x := SHORT (LOWORD (dwValue));
      Res.y := SHORT (HIWORD (dwValue));
      return Res;
   end MAKEPOINTS;

   function RGB (bRed, bGreen, bBlue : BYTE) return Win32.Windef.COLORREF is
      use Win32.Utils;
   begin
      return Win32.Windef.COLORREF (MAKELONG
                                       (Low  =>
                                           MAKEWORD
                                             (Low  => bRed,
                                              High => bGreen),
                                        High =>
                                           MAKEWORD (Low => bBlue, High => 0)))
;
   end RGB;

   function PALETTERGB
     (bRed, bGreen, bBlue : BYTE)
      return Win32.Windef.COLORREF
   is
      use Win32.Utils;
   begin
      return Win32.Windef.COLORREF (MAKELONG
                                       (Low  =>
                                           MAKEWORD
                                             (Low  => bRed,
                                              High => bGreen),
                                        High =>
                                           MAKEWORD (Low => bBlue, High => 2)))
;
   end PALETTERGB;

   function PALETTEINDEX
     (wPaletteIndex : WORD)
      return Win32.Windef.COLORREF
   is
      use Win32.Utils;
   begin
      return Win32.Windef.COLORREF (MAKELONG
                                       (Low  => wPaletteIndex,
                                        High => 16#0100#));
   end PALETTEINDEX;

   function GetRValue (rgb : Win32.Windef.COLORREF) return BYTE is
      use Win32.Utils;
   begin
      return LOBYTE (LOWORD (Win32.Utils.DWORD (rgb)));
   end GetRValue;

   function GetGValue (rgb : Win32.Windef.COLORREF) return BYTE is
      use Win32.Utils;
   begin
      return HIBYTE (LOWORD (Win32.Utils.DWORD (rgb)));
   end GetGValue;

   function GetBValue (rgb : Win32.Windef.COLORREF) return BYTE is
      use Win32.Utils;
   begin
      return LOBYTE (HIWORD (Win32.Utils.DWORD (rgb)));
   end GetBValue;

end Win32.Wingdi;
