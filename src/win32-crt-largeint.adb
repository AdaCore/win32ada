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
    
    -- Extended large integer magic divide - 64-bits / 32-bits -> 64-bits
    
    function ExtendedMagicDivide
        (Dividend    : in Win32.Winnt.LARGE_INTEGER;
         MagicDivisor: in Win32.Winnt.LARGE_INTEGER;
         ShiftCount  : in Win32.Winnt.CCHAR) return Win32.Winnt.LARGE_INTEGER is
    begin
	return LI(Op.ExtendedMagicDivide (
	    Dividend.Quadpart, MagicDivisor.Quadpart, 
	    Win32.Winnt.CCHAR'Pos(ShiftCount)));
    end;

    -- Large Integer divide - 64-bits / 32-bits -> 64-bits
    
    function ExtendedLargeIntegerDivide
        (Dividend : in Win32.Winnt.LARGE_INTEGER;
         Divisor  : in Win32.ULONG;
         Remainder: in Win32.PULONG) return Win32.Winnt.LARGE_INTEGER is
    begin
	return LI(Op.ExtendedLargeIntegerDivide (
	    Dividend.Quadpart, Divisor, Remainder));
    end;
    
    -- Large Integer divide - 64-bits / 32-bits -> 64-bits
    
    function LargeIntegerDivide
        (Dividend : in Win32.Winnt.LARGE_INTEGER;
         Divisor  : in Win32.Winnt.LARGE_INTEGER;
         Remainder: in Win32.Winnt.PLARGE_INTEGER) 
        return Win32.Winnt.LARGE_INTEGER is

	RM : aliased Win32.LONGLONG;
      Res: Win32.LONGLONG;
    begin
	Res := Op.LargeIntegerDivide (
	    Dividend.Quadpart, Divisor.Quadpart, RM'access);
	Remainder.Quadpart := RM;
	return LI(Res);
    end;
    
    -- Extended integer multiply - 32-bits * 64-bits -> 64-bits
    
    function ExtendedIntegerMultiply
        (Multiplicand: in Win32.Winnt.LARGE_INTEGER; 
         Multiplier  : in Win32.LONG) return Win32.Winnt.LARGE_INTEGER is
    begin
	return LI(Multiplicand.Quadpart * Multiplier);
    end;
    
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

end Win32.crt.Largeint;
