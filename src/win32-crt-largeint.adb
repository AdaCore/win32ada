-- $Source$
-- $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
-- TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
-- PURPOSE.  The user assumes the entire risk as to the accuracy and the
-- use of this file.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Royalty-free, unlimited, worldwide, non-exclusive use, modification,
-- reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with Win32.crt.Largeint.Ops;

package body Win32.crt.Largeint is

    -- Large integer add - 64-bits + 64-bits -> 64-bits

    I :  Win32.Winnt.LARGE_INTEGER;
    ULI: Win32.Winnt.ULARGE_INTEGER;
    UL:  Win32.ULONG;

    function LI is new Ada.Unchecked_Conversion (
        Win32.LONGLONG, Win32.Winnt.LARGE_INTEGER);

    function LI is new Ada.Unchecked_Conversion (
        Win32.DWORDLONG, Win32.Winnt.LARGE_INTEGER);

    package Op renames Win32.crt.Largeint.Ops;
    use Op;

    function LargeIntegerAdd
        (Addend1 : in Win32.Winnt.LARGE_INTEGER;
         Addend2 : in Win32.Winnt.LARGE_INTEGER)
         return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(Addend1.Quadpart + Addend2.Quadpart);
    end;

    -- Enlarged integer multiply - 32-bits * 32-bits -> 64-bits

    function EnlargedIntegerMultiply
        (Multiplicand : in Win32.LONG;
         Multiplier   : in Win32.LONG)
        return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(OP."*"(Multiplicand, Multiplier));
    end;

    -- Unsigned enlarged integer multiply - 32-bits * 32-bits -> 64-bits

    function EnlargedUnsignedMultiply
        (Multiplicand : in Win32.ULONG;
         Multiplier   : in Win32.ULONG)
        return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(OP."*"(Multiplicand, Multiplier));
    end;

    -- Extended integer multiply - 32-bits * 64-bits -> 64-bits

    function ExtendedIntegerMultiply
        (Multiplicand: in Win32.Winnt.LARGE_INTEGER;
         Multiplier  : in Win32.LONG) return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(Multiplicand.Quadpart * Multiplier);
    end;

    -- Enlarged integer divide - 64-bits / 32-bits > 32-bits

    function EnlargedUnsignedDivide
        (Dividend : in Win32.Winnt.ULARGE_INTEGER;
         Divisor  : in Win32.ULONG;
         Remainder: in Win32.PULONG) return Win32.ULONG is
    begin
       Remainder.all := Dividend.Quadpart mod Divisor;
       return Dividend.Quadpart / Divisor;
    end EnlargedUnsignedDivide;

    -- Large Integer divide - 64-bits / 32-bits -> 64-bits

    function ExtendedLargeIntegerDivide
        (Dividend : in Win32.Winnt.LARGE_INTEGER;
         Divisor  : in Win32.ULONG;
         Remainder: in Win32.PULONG) return Win32.Winnt.LARGE_INTEGER
    is
       use Win32.Crt.Largeint.Ops;
    begin
       Remainder.all := Dividend.Quadpart mod Divisor;
       return LI(Dividend.Quadpart / Divisor);
    end ExtendedLargeIntegerDivide;

    -- Large Integer divide - 64-bits / 32-bits -> 64-bits

    function LargeIntegerDivide
        (Dividend : in Win32.Winnt.LARGE_INTEGER;
         Divisor  : in Win32.Winnt.LARGE_INTEGER;
         Remainder: in Win32.Winnt.PLARGE_INTEGER)
        return Win32.Winnt.LARGE_INTEGER is
    begin
       Remainder.Quadpart := Dividend.Quadpart mod Divisor.QuadPart;
       return LI(Dividend.Quadpart / Divisor.QuadPart);
    end LargeIntegerDivide;

    -- Large integer negation - -(64-bits)

    function LargeIntegerNegate
        (Subtrahend : in Win32.Winnt.LARGE_INTEGER)
        return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(-Subtrahend.Quadpart);
    end;


    -- Large integer subtract - 64-bits - 64-bits -> 64-bits.

    function LargeIntegerSubtract
        (Minuend    : in Win32.Winnt.LARGE_INTEGER;
         Subtrahend : in Win32.Winnt.LARGE_INTEGER)
        return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(Minuend.Quadpart - Subtrahend.Quadpart);
    end;

    -- Large integer and - 64-bits & 64-bits -> 64-bits.

    function LargeIntegerAnd (
         Source: in  Win32.Winnt.LARGE_INTEGER;
         Mask  : in  Win32.Winnt.LARGE_INTEGER)
        return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(To_Unsigned(Source.Quadpart) and To_Unsigned(Mask.Quadpart));
    end;

    -- Large integer conversion routines.

    -- Convert signed integer to large integer.

    function ConvertLongToLargeInteger
        (SignedInteger : in Win32.LONG) return Win32.Winnt.LARGE_INTEGER is
        Res: Op.LONGLONG := To_64(To_Unsigned(SignedInteger));
    begin
        return LI(Res);
    end;

    -- Convert unsigned integer to large integer.

    function ConvertUlongToLargeInteger
        (UnsignedInteger : in Win32.ULONG) return Win32.Winnt.LARGE_INTEGER is
        Res: Op.DWORDLONG := To_64(UnsignedInteger);
    begin
        return LI(To_Signed(Res));
    end;

    -- Large integer shift routines.

    function LargeIntegerShiftLeft
        (LargeInteger: in Win32.Winnt.LARGE_INTEGER;
         ShiftCount  : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(Shift_Left(To_Unsigned(LargeInteger.Quadpart),
                             Win32.Winnt.CCHAR'Pos(ShiftCount)));
    end;

    function LargeIntegerShiftRight
        (LargeInteger: in Win32.Winnt.LARGE_INTEGER;
         ShiftCount  : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(Shift_Right(To_Unsigned(LargeInteger.Quadpart),
                              Win32.Winnt.CCHAR'Pos(ShiftCount)));
    end;

    function LargeIntegerArithmeticShift
        (LargeInteger: in Win32.Winnt.LARGE_INTEGER;
         ShiftCount  : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
    begin
        return LI(Shift_Right_Arithmetic(To_Unsigned(LargeInteger.Quadpart),
                                         Win32.Winnt.CCHAR'Pos(ShiftCount)));
    end;

    --  define some LONGLONG oparators

    LI_Zero : constant Win32.LONGLONG := (0, 0);

    function LargeIntegerGreaterThan
      (X, Y: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart > Y.QuadPart;
    end LargeIntegerGreaterThan;

    function LargeIntegerGreaterThanOrEqualTo
      (X, Y: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart >= Y.QuadPart;
    end LargeIntegerGreaterThanOrEqualTo;

    function LargeIntegerEqualTo
      (X, Y: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart = Y.QuadPart;
    end LargeIntegerEqualTo;

    function LargeIntegerNotEqualTo
      (X, Y: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart /= Y.QuadPart;
    end LargeIntegerNotEqualTo;

    function LargeIntegerLessThan
      (X, Y: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart < Y.QuadPart;
    end LargeIntegerLessThan;

    function LargeIntegerLessThanOrEqualTo
        (X, Y: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart <= Y.QuadPart;
    end LargeIntegerLessThanOrEqualTo;

    function LargeIntegerGreaterThanZero
      (X: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart > LI_Zero;
    end LargeIntegerGreaterThanZero;

    function LargeIntegerGreaterOrEqualToZero
      (X: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart >= LI_Zero;
    end LargeIntegerGreaterOrEqualToZero;

    function LargeIntegerEqualToZero
      (X: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart = LI_Zero;
    end LargeIntegerEqualToZero;

    function LargeIntegerNotEqualToZero
      (X: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart /= LI_Zero;
    end LargeIntegerNotEqualToZero;

    function LargeIntegerLessThanZero
      (X: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart < LI_Zero;
    end LargeIntegerLessThanZero;

    function LargeIntegerLessThanOrEqualToZero
      (X: Win32.Winnt.LARGE_INTEGER) return Boolean is
    begin
       return X.QuadPart <= LI_Zero;
    end LargeIntegerLessThanOrEqualToZero;

end Win32.crt.Largeint;


----------------------
-- REVISION HISTORY --
----------------------

--  ----------------------------
--  New changes after this line.  Each line starts with: "--  "
--  Lots of changes to support the LARGE_INTEGER operations.
--  All pragma import have been removed because there is no DLL for this unit
--   it is a Microsoft static library.
--  Fixes 8109-003.
