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
with Win32.crt.Largeint.Ops;

package body Win32.crt.Largeint is

   function LI is new Ada.Unchecked_Conversion (
      Win32.LONGLONG,
      Win32.Winnt.LARGE_INTEGER);

   function LI is new Ada.Unchecked_Conversion (
      Win32.DWORDLONG,
      Win32.Winnt.LARGE_INTEGER);

   package Op renames Win32.crt.Largeint.Ops;
   use Op;

   function LargeIntegerAdd
     (Addend1 : in Win32.Winnt.LARGE_INTEGER;
      Addend2 : in Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI (Addend1.QuadPart + Addend2.QuadPart);
   end LargeIntegerAdd;

   function EnlargedIntegerMultiply
     (Multiplicand : in Win32.LONG;
      Multiplier   : in Win32.LONG)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI (Op."*" (Multiplicand, Multiplier));
   end EnlargedIntegerMultiply;

   function EnlargedUnsignedMultiply
     (Multiplicand : in Win32.ULONG;
      Multiplier   : in Win32.ULONG)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI (Op."*" (Multiplicand, Multiplier));
   end EnlargedUnsignedMultiply;

   function ExtendedIntegerMultiply
     (Multiplicand : in Win32.Winnt.LARGE_INTEGER;
      Multiplier   : in Win32.LONG)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI (Multiplicand.QuadPart * Multiplier);
   end ExtendedIntegerMultiply;

   function EnlargedUnsignedDivide
     (Dividend  : in Win32.Winnt.ULARGE_INTEGER;
      Divisor   : in Win32.ULONG;
      Remainder : in Win32.PULONG)
      return Win32.ULONG
   is
   begin
      Remainder.all := Dividend.QuadPart mod Divisor;
      return Dividend.QuadPart / Divisor;
   end EnlargedUnsignedDivide;

   function ExtendedLargeIntegerDivide
     (Dividend  : in Win32.Winnt.LARGE_INTEGER;
      Divisor   : in Win32.ULONG;
      Remainder : in Win32.PULONG)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      Remainder.all := Dividend.QuadPart mod Divisor;
      return LI (Dividend.QuadPart / Divisor);
   end ExtendedLargeIntegerDivide;

   function LargeIntegerDivide
     (Dividend  : in Win32.Winnt.LARGE_INTEGER;
      Divisor   : in Win32.Winnt.LARGE_INTEGER;
      Remainder : in Win32.Winnt.PLARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      Remainder.QuadPart := Dividend.QuadPart mod Divisor.QuadPart;
      return LI (Dividend.QuadPart / Divisor.QuadPart);
   end LargeIntegerDivide;

   function LargeIntegerNegate
     (Subtrahend : in Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI (-Subtrahend.QuadPart);
   end LargeIntegerNegate;

   function LargeIntegerSubtract
     (Minuend    : in Win32.Winnt.LARGE_INTEGER;
      Subtrahend : in Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI (Minuend.QuadPart - Subtrahend.QuadPart);
   end LargeIntegerSubtract;

   function LargeIntegerAnd
     (Source : in Win32.Winnt.LARGE_INTEGER;
      Mask   : in Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI
               (To_Unsigned (Source.QuadPart) and
                To_Unsigned (Mask.QuadPart));
   end LargeIntegerAnd;

   function ConvertLongToLargeInteger
     (SignedInteger : in Win32.LONG)
      return Win32.Winnt.LARGE_INTEGER
   is
      Res : constant Op.LONGLONG := To_64 (To_Unsigned (SignedInteger));
   begin
      return LI (Res);
   end ConvertLongToLargeInteger;

   function ConvertUlongToLargeInteger
     (UnsignedInteger : in Win32.ULONG)
      return Win32.Winnt.LARGE_INTEGER
   is
      Res : constant Op.DWORDLONG := To_64 (UnsignedInteger);
   begin
      return LI (To_Signed (Res));
   end ConvertUlongToLargeInteger;

   function LargeIntegerShiftLeft
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI
               (Shift_Left
                   (To_Unsigned (LargeInteger.QuadPart),
                    Win32.Winnt.CCHAR'Pos (ShiftCount)));
   end LargeIntegerShiftLeft;

   function LargeIntegerShiftRight
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI
               (Shift_Right
                   (To_Unsigned (LargeInteger.QuadPart),
                    Win32.Winnt.CCHAR'Pos (ShiftCount)));
   end LargeIntegerShiftRight;

   function LargeIntegerArithmeticShift
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR)
      return Win32.Winnt.LARGE_INTEGER
   is
   begin
      return LI
               (Shift_Right_Arithmetic
                   (To_Unsigned (LargeInteger.QuadPart),
                    Win32.Winnt.CCHAR'Pos (ShiftCount)));
   end LargeIntegerArithmeticShift;

   LI_Zero : constant Win32.LONGLONG := (0, 0);

   function LargeIntegerGreaterThan
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart > Y.QuadPart;
   end LargeIntegerGreaterThan;

   function LargeIntegerGreaterThanOrEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart >= Y.QuadPart;
   end LargeIntegerGreaterThanOrEqualTo;

   function LargeIntegerEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart = Y.QuadPart;
   end LargeIntegerEqualTo;

   function LargeIntegerNotEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart /= Y.QuadPart;
   end LargeIntegerNotEqualTo;

   function LargeIntegerLessThan
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart < Y.QuadPart;
   end LargeIntegerLessThan;

   function LargeIntegerLessThanOrEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart <= Y.QuadPart;
   end LargeIntegerLessThanOrEqualTo;

   function LargeIntegerGreaterThanZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart > LI_Zero;
   end LargeIntegerGreaterThanZero;

   function LargeIntegerGreaterOrEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart >= LI_Zero;
   end LargeIntegerGreaterOrEqualToZero;

   function LargeIntegerEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart = LI_Zero;
   end LargeIntegerEqualToZero;

   function LargeIntegerNotEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart /= LI_Zero;
   end LargeIntegerNotEqualToZero;

   function LargeIntegerLessThanZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart < LI_Zero;
   end LargeIntegerLessThanZero;

   function LargeIntegerLessThanOrEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean
   is
   begin
      return X.QuadPart <= LI_Zero;
   end LargeIntegerLessThanOrEqualToZero;

end Win32.crt.Largeint;
