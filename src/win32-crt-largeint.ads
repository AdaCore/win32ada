--  See end of file for Copyright (c) information.

with Win32.Winnt;

package Win32.crt.Largeint is

   --  Large integer add - 64-bits + 64-bits -> 64-bits

   function LargeIntegerAdd
     (Addend1 : in Win32.Winnt.LARGE_INTEGER;
      Addend2 : in Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER;

   --  Enlarged integer multiply - 32-bits * 32-bits -> 64-bits

   function EnlargedIntegerMultiply
     (Multiplicand : in Win32.LONG;
      Multiplier   : in Win32.LONG)
     return Win32.Winnt.LARGE_INTEGER;

   --  Unsigned enlarged integer multiply - 32-bits * 32-bits -> 64-bits

   function EnlargedUnsignedMultiply
     (Multiplicand : in Win32.ULONG;
      Multiplier   : in Win32.ULONG)
     return Win32.Winnt.LARGE_INTEGER;

   --  Enlarged integer divide - 64-bits / 32-bits > 32-bits

   function EnlargedUnsignedDivide
     (Dividend  : in Win32.Winnt.ULARGE_INTEGER;
      Divisor   : in Win32.ULONG;
      Remainder : in Win32.PULONG) return Win32.ULONG;

   --  Extended large integer magic divide - 64-bits / 32-bits -> 64-bits
   --  NOT SUPPORTED

--  function ExtendedMagicDivide
--      (Dividend    : in Win32.Winnt.LARGE_INTEGER;
--       MagicDivisor: in Win32.Winnt.LARGE_INTEGER;
--       ShiftCount  : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER;

   --  Large Integer divide - 64-bits / 32-bits -> 64-bits

   function ExtendedLargeIntegerDivide
     (Dividend  : in Win32.Winnt.LARGE_INTEGER;
      Divisor   : in Win32.ULONG;
      Remainder : in Win32.PULONG) return Win32.Winnt.LARGE_INTEGER;

   --  Large Integer divide - 64-bits / 32-bits -> 64-bits

   function LargeIntegerDivide
     (Dividend  : in Win32.Winnt.LARGE_INTEGER;
      Divisor   : in Win32.Winnt.LARGE_INTEGER;
      Remainder : in Win32.Winnt.PLARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER;

   --  Extended integer multiply - 32-bits * 64-bits -> 64-bits

   function ExtendedIntegerMultiply
     (Multiplicand : in Win32.Winnt.LARGE_INTEGER;
      Multiplier   : in Win32.LONG) return Win32.Winnt.LARGE_INTEGER;

   --  Large integer negation - -(64-bits)

   function LargeIntegerNegate
     (Subtrahend : in Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER;


   --  Large integer subtract - 64-bits - 64-bits -> 64-bits.

   function LargeIntegerSubtract
     (Minuend    : in Win32.Winnt.LARGE_INTEGER;
      Subtrahend : in Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER;

   --  Large integer and - 64-bits & 64-bits -> 64-bits.

   function LargeIntegerAnd
     (Source : Win32.Winnt.LARGE_INTEGER;
      Mask   : Win32.Winnt.LARGE_INTEGER)
     return Win32.Winnt.LARGE_INTEGER;

   --  Large integer conversion routines.

   --  Convert signed integer to large integer.

   function ConvertLongToLargeInteger
     (SignedInteger : in Win32.LONG) return Win32.Winnt.LARGE_INTEGER;

   --  Convert unsigned integer to large integer.

   function ConvertUlongToLargeInteger
     (UnsignedInteger : in Win32.ULONG) return Win32.Winnt.LARGE_INTEGER;

   --  Large integer shift routines.

   function LargeIntegerShiftLeft
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerShiftRight
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER;

   function LargeIntegerArithmeticShift
     (LargeInteger : in Win32.Winnt.LARGE_INTEGER;
      ShiftCount   : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER;

   --  For comparison routines, define both the Win32 name and provide a
   --  rename for convenience.

   function LargeIntegerGreaterThan
     (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean;
   function ">" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean
     renames LargeIntegerGreaterThan;

   function LargeIntegerGreaterThanOrEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean;
   function ">=" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean
     renames LargeIntegerGreaterThanOrEqualTo;

   function LargeIntegerEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean;

   function LargeIntegerNotEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean;

   function LargeIntegerLessThan
     (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean;
   function "<" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean
     renames LargeIntegerLessThan;

   function LargeIntegerLessThanOrEqualTo
     (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean;
   function "<=" (X, Y : Win32.Winnt.LARGE_INTEGER) return Boolean
     renames LargeIntegerLessThanOrEqualTo;

   function LargeIntegerGreaterThanZero
     (X : Win32.Winnt.LARGE_INTEGER) return Boolean;

   function LargeIntegerGreaterOrEqualToZero
     (X : Win32.Winnt.LARGE_INTEGER) return Boolean;

   function LargeIntegerEqualToZero
     (X : Win32.Winnt.LARGE_INTEGER) return Boolean;

   function LargeIntegerNotEqualToZero
     (X : Win32.Winnt.LARGE_INTEGER) return Boolean;

   function LargeIntegerLessThanZero
     (X : Win32.Winnt.LARGE_INTEGER) return Boolean;

   function LargeIntegerLessThanOrEqualToZero
     (X : Win32.Winnt.LARGE_INTEGER) return Boolean;

private

   ----------------------------------------------------------------------------
   --
   --  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
   --  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED,
   --  INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
   --  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire
   --  risk as to the accuracy and the use of this file.  This file may be
   --  used, copied, modified and distributed only by licensees of Microsoft
   --  Corporation's WIN32 Software Development Kit in accordance with the
   --  terms of the licensee's End-User License Agreement for Microsoft
   --  Software for the WIN32 Development Kit.
   --
   --  Copyright (c) Intermetrics, Inc. 1995
   --  Portions (c) 1985-1994 Microsoft Corporation with permission.
   --  Microsoft is a registered trademark and Windows and Windows NT are
   --  trademarks of Microsoft Corporation.
   --
   ----------------------------------------------------------------------------

end Win32.crt.Largeint;
