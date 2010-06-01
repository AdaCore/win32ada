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

package Win32.crt.Limits is

   CHAR_BIT   : constant := 8;
   SCHAR_MIN  : constant := -128;
   SCHAR_MAX  : constant := 127;
   UCHAR_MAX  : constant := 16#ff#;
   CHAR_MIN   : constant := -128;
   CHAR_MAX   : constant := 127;
   MB_LEN_MAX : constant := 2;
   SHRT_MIN   : constant := -32768;
   SHRT_MAX   : constant := 32767;
   USHRT_MAX  : constant := 16#ffff#;
   INT_MIN    : constant := -2147483648;
   INT_MAX    : constant := 2147483647;
   UINT_MAX   : constant := 16#ffffffff#;
   LONG_MIN   : constant := -2147483648;
   LONG_MAX   : constant := 2147483647;
   ULONG_MAX  : constant := 16#ffffffff#;

end Win32.crt.Limits;
