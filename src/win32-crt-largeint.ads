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

with Win32.Winnt;

package Win32.crt.Largeint is

   function LargeIntegerAdd
     (Addend1 : in Win32.Winnt.LARGE_INTEGER;
      Addend2 : in Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER;

   function EnlargedIntegerMultiply
     (Multiplicand : in Win32.LONG;
      Multiplier   : in Win32.LONG)
      return Win32.Winnt.LARGE_INTEGER;

   function EnlargedUnsignedMultiply
     (Multiplicand : in Win32.ULONG;
      Multiplier   : in Win32.ULONG)
      return Win32.Winnt.LARGE_INTEGER;

   function EnlargedUnsignedDivide
     (Dividend  : in Win32.Winnt.ULARGE_INTEGER;
      Divisor   : in Win32.ULONG;
      Remainder : in Win32.PULONG)
      return Win32.ULONG;

   function ExtendedLargeIntegerDivide
     (Dividend  : in Win32.Winnt.LARGE_INTEGER;
      Divisor   : in Win32.ULONG;
      Remainder : in Win32.PULONG)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerDivide
     (Dividend  : in Win32.Winnt.LARGE_INTEGER;
      Divisor   : in Win32.Winnt.LARGE_INTEGER;
      Remainder : in Win32.Winnt.PLARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER;

   function ExtendedIntegerMultiply
     (Multiplicand : in Win32.Winnt.LARGE_INTEGER;
      Multiplier   : in Win32.LONG)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerNegate
     (Subtrahend : in Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerSubtract
     (Minuend    : in Win32.Winnt.LARGE_INTEGER;
      Subtrahend : in Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerAnd
     (Source : Win32.Winnt.LARGE_INTEGER;
      Mask   : Win32.Winnt.LARGE_INTEGER)
      return Win32.Winnt.LARGE_INTEGER;

   function ConvertLongToLargeInteger
     (SignedInteger : in Win32.LONG)
      return Win32.Winnt.LARGE_INTEGER;

   function ConvertUlongToLargeInteger
     (UnsignedInteger : in Win32.ULONG)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerShiftLeft
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerShiftRight
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerArithmeticShift
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR)
      return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerGreaterThan
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean;
   function ">" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean renames
     LargeIntegerGreaterThan;

   function LargeIntegerGreaterThanOrEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean;
   function ">=" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean renames
     LargeIntegerGreaterThanOrEqualTo;

   function LargeIntegerEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

   function LargeIntegerNotEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

   function LargeIntegerLessThan
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean;
   function "<" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean renames
     LargeIntegerLessThan;

   function LargeIntegerLessThanOrEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER)
      return Boolean;
   function "<=" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean renames
     LargeIntegerLessThanOrEqualTo;

   function LargeIntegerGreaterThanZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

   function LargeIntegerGreaterOrEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

   function LargeIntegerEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

   function LargeIntegerNotEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

   function LargeIntegerLessThanZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

   function LargeIntegerLessThanOrEqualToZero
     (X    : Win32.Winnt.LARGE_INTEGER)
      return Boolean;

end Win32.crt.Largeint;
