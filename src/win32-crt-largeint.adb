--  $Source$
--  $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with Win32.crt.Largeint.Ops;

package body Win32.crt.Largeint is

   --  Large integer add - 64-bits + 64-bits -> 64-bits

--     I : Win32.Winnt.LARGE_INTEGER;
--     ULI : Win32.Winnt.ULARGE_INTEGER;
--     UL : Win32.ULONG;

   function LI is new Ada.Unchecked_Conversion
     (Win32.LONGLONG, Win32.Winnt.LARGE_INTEGER);

   function LI is new Ada.Unchecked_Conversion
     (Win32.DWORDLONG, Win32.Winnt.LARGE_INTEGER);

   package Op renames Win32.crt.Largeint.Ops;
   use Op;

   function LargeIntegerAdd
     (Addend1 : in Win32.Winnt.LARGE_INTEGER;
      Addend2 : in Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Addend1.QuadPart + Addend2.QuadPart);
   end LargeIntegerAdd;

   --  Enlarged integer multiply - 32-bits * 32-bits -> 64-bits

   function EnlargedIntegerMultiply
     (Multiplicand : in Win32.LONG;
      Multiplier : in Win32.LONG)
     return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Op."*"(Multiplicand, Multiplier));
   end EnlargedIntegerMultiply;

   --  Unsigned enlarged integer multiply - 32-bits * 32-bits -> 64-bits

   function EnlargedUnsignedMultiply
     (Multiplicand : in Win32.ULONG;
      Multiplier : in Win32.ULONG)
     return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Op."*"(Multiplicand, Multiplier));
   end EnlargedUnsignedMultiply;

   --  Extended large integer magic divide - 64-bits / 32-bits -> 64-bits

   function ExtendedMagicDivide
     (Dividend : in Win32.Winnt.LARGE_INTEGER;
      MagicDivisor : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Op.ExtendedMagicDivide
        (Dividend.QuadPart, MagicDivisor.QuadPart,
        Win32.Winnt.CCHAR'Pos (ShiftCount)));
   end ExtendedMagicDivide;

   --  Large Integer divide - 64-bits / 32-bits -> 64-bits

   function ExtendedLargeIntegerDivide
     (Dividend : in Win32.Winnt.LARGE_INTEGER;
      Divisor : in Win32.ULONG;
      Remainder : in Win32.PULONG) return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Op.ExtendedLargeIntegerDivide
        (Dividend.QuadPart, Divisor, Remainder));
   end ExtendedLargeIntegerDivide;

   --  Large Integer divide - 64-bits / 32-bits -> 64-bits

   function LargeIntegerDivide
     (Dividend : in Win32.Winnt.LARGE_INTEGER;
      Divisor : in Win32.Winnt.LARGE_INTEGER;
      Remainder : in Win32.Winnt.PLARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER is

      RM : aliased Win32.LONGLONG;
      Res : Win32.LONGLONG;
   begin
      Res := Op.LargeIntegerDivide
        (Dividend.QuadPart, Divisor.QuadPart, RM'Access);
      Remainder.QuadPart := RM;
      return LI (Res);
   end LargeIntegerDivide;

   --  Extended integer multiply - 32-bits * 64-bits -> 64-bits

   function ExtendedIntegerMultiply
     (Multiplicand : in Win32.Winnt.LARGE_INTEGER;
      Multiplier : in Win32.LONG) return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Multiplicand.QuadPart * Multiplier);
   end ExtendedIntegerMultiply;

   --  Large integer negation - -(64-bits)

   function LargeIntegerNegate
     (Subtrahend : in Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (-Subtrahend.QuadPart);
   end LargeIntegerNegate;


   --  Large integer subtract - 64-bits - 64-bits -> 64-bits.

   function LargeIntegerSubtract
     (Minuend : in Win32.Winnt.LARGE_INTEGER;
      Subtrahend : in Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Minuend.QuadPart - Subtrahend.QuadPart);
   end LargeIntegerSubtract;

   --  Large integer and - 64-bits & 64-bits -> 64-bits.

   function LargeIntegerAnd
     (Source : in  Win32.Winnt.LARGE_INTEGER;
      Mask : in  Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (To_Unsigned (Source.QuadPart) and
                 To_Unsigned (Mask.QuadPart));
   end LargeIntegerAnd;

   --  Large integer conversion routines.

   --  Convert signed integer to large integer.

   function ConvertLongToLargeInteger
     (SignedInteger : in Win32.LONG) return Win32.Winnt.LARGE_INTEGER is
      Res : Op.LONGLONG := To_64 (To_Unsigned (SignedInteger));
   begin
      return LI (Res);
   end ConvertLongToLargeInteger;

   --  Convert unsigned integer to large integer.

   function ConvertUlongToLargeInteger
     (UnsignedInteger : in Win32.ULONG) return Win32.Winnt.LARGE_INTEGER is
      Res : Op.DWORDLONG := To_64 (UnsignedInteger);
   begin
      return LI (To_Signed (Res));
   end ConvertUlongToLargeInteger;

   --  Large integer shift routines.

   function LargeIntegerShiftLeft
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Shift_Left (To_Unsigned (LargeInteger.QuadPart),
        Win32.Winnt.CCHAR'Pos (ShiftCount)));
   end LargeIntegerShiftLeft;

   function LargeIntegerShiftRight
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Shift_Right (To_Unsigned (LargeInteger.QuadPart),
        Win32.Winnt.CCHAR'Pos (ShiftCount)));
   end LargeIntegerShiftRight;

   function LargeIntegerArithmeticShift
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
   begin
      return LI (Shift_Right_Arithmetic (To_Unsigned (LargeInteger.QuadPart),
        Win32.Winnt.CCHAR'Pos (ShiftCount)));
   end LargeIntegerArithmeticShift;

end Win32.crt.Largeint;


