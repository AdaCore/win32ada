-- $Source$ 
-- $Revision$ $Date$ $Author$ 

-- Win32 requires 64 bit integers for some types.
-- This package encapsulates these types and their operations,
-- and avoids requiring such a type be defined in Interfaces.

with Ada.Unchecked_Conversion;

package Win32.crt.Largeint.Ops is
    -- 32 and 64 bit types
    subtype LONG is      Win32.LONG;
    subtype DWORD is     Win32.DWORD;
    subtype LONGLONG is  Win32.LONGLONG;
    subtype DWORDLONG is Win32.DWORDLONG;

    -- winnt.h
    function Int32x32To64(A, B: LONG) return LONGLONG;

    function UInt32x32To64(A, B: DWORD) return DWORDLONG;

    type Shift_Count is range 0..31;

    function Int64ShllMod32 (Val: DWORDLONG;
                             By : Shift_Count) return DWORDLONG;

    function Int64ShraMod32 (Val: LONGLONG;
                             By : Shift_Count) return LONGLONG;

    function Int64ShrlMod32 (Val: DWORDLONG;
                             By : Shift_Count) return DWORDLONG;

    -- Conversions 
    function To_Signed   is new Ada.Unchecked_Conversion (DWORD, LONG);
    function To_Signed   is new Ada.Unchecked_Conversion (DWORDLONG, LONGLONG);
    function To_Unsigned is new Ada.Unchecked_Conversion (LONG, DWORD);
    function To_Unsigned is new Ada.Unchecked_Conversion (LONGLONG, DWORDLONG);

    function To_64(Low : DWORD; High: DWORD := 0) return DWORDLONG;
    function To_64(Low : DWORD; High: LONG := 0)  return LONGLONG;

    procedure Split (Value: DWORDLONG;
                     Low,
                     High : out DWORD);

    -- Arithmetic
    function "+" (Left, Right: LONGLONG)  return LONGLONG;
    function "+" (Left, Right: DWORDLONG) return DWORDLONG;
    function "-" (Left, Right: LONGLONG)  return LONGLONG;
    function "-" (Left, Right: DWORDLONG) return DWORDLONG;
    function "*" (Left, Right: LONG)  return LONGLONG;
    function "*" (Left, Right: DWORD) return DWORDLONG;
    function "*" (Left : LONGLONG;
                  Right: LONG)        return LONGLONG;
    function "-" (Left       : LONGLONG)  return LONGLONG;
    -- no mod, rem, "**" for now

    -- Extended large integer magic divide - 64-bits / 32-bits -> 64-bits
    
    function ExtendedMagicDivide
        (Dividend    : LONGLONG;
         MagicDivisor: LONGLONG;
         ShiftCount  : Natural) return LONGLONG;  

    -- Large Integer divide - 64-bits / 32-bits -> 64-bits
    
    function ExtendedLargeIntegerDivide
        (Dividend : LONGLONG;
         Divisor  : DWORD;
         Remainder: access DWORD) return LONGLONG;  
    
    -- Large Integer divide - 64-bits / 32-bits -> 64-bits
    
    function LargeIntegerDivide
        (Dividend : LONGLONG;
         Divisor  : LONGLONG;
         Remainder: access LONGLONG) 
        return LONGLONG;  
    
    -- Bitwise operations
    function "and" (Left, Right: DWORDLONG) return DWORDLONG;
    function Shift_Left  (Value: DWORDLONG; Amount: Natural)
        return DWORDLONG;
    function Shift_Right (Value: DWORDLONG; Amount: Natural)
        return DWORDLONG;
    function Shift_Right_Arithmetic (Value: DWORDLONG; Amount: Natural)
        return DWORDLONG;
    -- No or, not, bit rotation for now

    -- Printable images, hex or decimal
    function Image (Value: LONGLONG;  Hex: Boolean := Standard.False) 
        return String;
    function Image (Value: DWORDLONG; Hex: Boolean := Standard.True)  
        return String;

private

    pragma Inline(Int32x32To64);
    pragma Inline(UInt32x32To64);
    pragma Inline(Int64ShllMod32);
    pragma Inline(Int64ShraMod32);
    pragma Inline(Int64ShrlMod32);

end Win32.crt.Largeint.Ops;
