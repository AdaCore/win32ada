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
with Interfaces;               use Interfaces;
with Interfaces.C;             use Interfaces.C;
with System;
with Win32;

package body Convert is

   pragma Suppress (All_Checks);

   function LOWORD (w : Win32.DWORD) return Win32.WORD is
   begin
      return Win32.WORD (w and 16#FFFF#);
   end LOWORD;

   function HIWORD (w : Win32.DWORD) return Win32.WORD is
      shift : Interfaces.Unsigned_32;
   begin
      shift := Interfaces.Unsigned_32 (w);
      shift := Interfaces.Shift_Right (shift, 16);
      return Win32.WORD (shift);
   end HIWORD;

   function LOWORD (i : Win32.INT) return Win32.SHORT is
      signed_word : Win32.SHORT;
   begin
      signed_word := Win32.SHORT (LOWORD (w => Win32.DWORD (i)));
      return signed_word;
   end LOWORD;

   function HIWORD (i : Win32.INT) return Win32.SHORT is
      signed_word : Win32.SHORT;
   begin
      signed_word := Win32.SHORT (HIWORD (w => Win32.DWORD (i)));
      return signed_word;
   end HIWORD;

   function MAKEINTRESOURCE (i : Win32.INT) return Win32.LPCSTR is
      tmp : Win32.DWORD;
   begin
      tmp := Win32.DWORD (LOWORD (i));
      return DWORD_TO_LPCSTR (tmp);
   end MAKEINTRESOURCE;

   function CP (C_Str : Win32.CHAR_Array) return Win32.LPCSTR is
      function UC is new Ada.Unchecked_Conversion (
         System.Address,
         Win32.LPCSTR);
   begin
      return UC (C_Str (C_Str'First)'Address);
   end CP;

end Convert;
