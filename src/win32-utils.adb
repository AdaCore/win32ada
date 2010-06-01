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

with Interfaces;

package body Win32.Utils is
   use Interfaces;

   function MAKEWORD (Low, High : BYTE) return WORD is
      use type Interfaces.C.unsigned_short;
   begin
      return (WORD (High) * 2 ** 8) + WORD (Low);
   end MAKEWORD;

   function MAKELONG (Low, High : WORD) return DWORD is
   begin
      return DWORD (Shift_Left (Unsigned_32 (High), 16) or
                    Unsigned_32 (Low));
   end MAKELONG;

   function LOWORD (L : DWORD) return WORD is
   begin
      return WORD (Unsigned_32 (L) and 16#FFFF#);
   end LOWORD;

   function HIWORD (L : DWORD) return WORD is
      use type DWORD;
   begin
      return WORD (L / (2 ** 16));
   end HIWORD;

   function LOBYTE (W : WORD) return BYTE is
      use type Interfaces.C.unsigned_short;
   begin
      return BYTE (W and 16#FF#);
   end LOBYTE;

   function HIBYTE (W : WORD) return BYTE is
      use type Interfaces.C.unsigned_short;
   begin
      return BYTE (W / 2 ** 8);
   end HIBYTE;

end Win32.Utils;
