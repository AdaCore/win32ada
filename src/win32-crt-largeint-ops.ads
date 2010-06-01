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

package Win32.crt.Largeint.Ops is

   subtype LONG is Win32.LONG;
   subtype ULONG is Win32.ULONG;
   subtype DWORD is Win32.DWORD;
   subtype LONGLONG is Win32.LONGLONG;
   subtype DWORDLONG is Win32.DWORDLONG;

   function Int32x32To64 (A, B : LONG) return LONGLONG;

   function UInt32x32To64 (A, B : DWORD) return DWORDLONG;

   type Shift_Count is range 0 .. 31;

   function Int64ShllMod32
     (Val  : DWORDLONG;
      By   : Shift_Count)
      return DWORDLONG;

   function Int64ShraMod32
     (Val  : LONGLONG;
      By   : Shift_Count)
      return LONGLONG;

   function Int64ShrlMod32
     (Val  : DWORDLONG;
      By   : Shift_Count)
      return DWORDLONG;

   function To_Signed is new Ada.Unchecked_Conversion (DWORD, LONG);
   function To_Signed is new Ada.Unchecked_Conversion (DWORDLONG, LONGLONG);
   function To_Unsigned is new Ada.Unchecked_Conversion (LONG, DWORD);
   function To_Unsigned is new Ada.Unchecked_Conversion (
      LONGLONG,
      DWORDLONG);

   function To_64 (Low : DWORD; High : DWORD := 0) return DWORDLONG;
   function To_64 (Low : DWORD; High : LONG := 0) return LONGLONG;

   procedure Split (Value : DWORDLONG; Low, High : out DWORD);

   function "+" (Left, Right : LONGLONG) return LONGLONG;
   function "+" (Left, Right : DWORDLONG) return DWORDLONG;
   function "-" (Left, Right : LONGLONG) return LONGLONG;
   function "-" (Left, Right : DWORDLONG) return DWORDLONG;
   function "*" (Left, Right : LONG) return LONGLONG;
   function "*" (Left, Right : DWORD) return DWORDLONG;
   function "*" (Left : LONGLONG; Right : LONG) return LONGLONG;
   function "-" (Left : LONGLONG) return LONGLONG;

   function "/" (Left, Right : LONGLONG) return LONGLONG;
   function "/" (Left : LONGLONG; Right : ULONG) return LONGLONG;
   function "/" (Left : DWORDLONG; Right : ULONG) return ULONG;
   function "mod" (Left, Right : LONGLONG) return LONGLONG;
   function "mod" (Left : LONGLONG; Right : ULONG) return ULONG;
   function "mod" (Left : DWORDLONG; Right : ULONG) return ULONG;

   function ">" (Left, Right : LONGLONG) return Boolean;
   function ">=" (Left, Right : LONGLONG) return Boolean;
   function "<" (Left, Right : LONGLONG) return Boolean;
   function "<=" (Left, Right : LONGLONG) return Boolean;

   function "and" (Left, Right : DWORDLONG) return DWORDLONG;
   function Shift_Left
     (Value  : DWORDLONG;
      Amount : Natural)
      return DWORDLONG;
   function Shift_Right
     (Value  : DWORDLONG;
      Amount : Natural)
      return DWORDLONG;
   function Shift_Right_Arithmetic
     (Value  : DWORDLONG;
      Amount : Natural)
      return DWORDLONG;

   function Image
     (Value : LONGLONG;
      Hex   : Boolean := Standard.False)
      return String;
   function Image
     (Value : DWORDLONG;
      Hex   : Boolean := Standard.True)
      return String;

private

   pragma Inline (Int32x32To64);
   pragma Inline (UInt32x32To64);
   pragma Inline (Int64ShllMod32);
   pragma Inline (Int64ShraMod32);
   pragma Inline (Int64ShrlMod32);

end Win32.crt.Largeint.Ops;
