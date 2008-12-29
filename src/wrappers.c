/* $Source$ */
/* $Revision: 11231 $ $Date: 2000-08-10 11:10:30 +0200 (Thu, 10 Aug 2000) $ $Author: dijk $ */
/* Define wrapper routines for win32-largeint-ops.adb, ObjectAda version */

#include <windows.h>
#include <winnt.h>

#define LARGEINT_PROTOS
#include <largeint.h>

/***************
function wrap_add(Left, Right : Ptr_64) return Integer_64;
--------
function wrap_add(Left, Right : Ptr_64) return Unsigned_64;
****************/

/* Used for both signed and unsigned */
PLARGE_INTEGER wrap_add
(PLARGE_INTEGER result, PLARGE_INTEGER left, PLARGE_INTEGER right)
{
  *result = LargeIntegerAdd (*left, *right);
  return result;
}

/***************
function wrap_sub(Left, Right : Ptr_64) return Integer_64;
--------
function wrap_sub(Left, Right : Ptr_64) return Unsigned_64;
****************/

/* Used for both signed and unsigned */
PLARGE_INTEGER wrap_sub
(PLARGE_INTEGER result, PLARGE_INTEGER left, PLARGE_INTEGER right)
{
  *result = LargeIntegerSubtract(*left, *right);
  return result;
}

/***************
function wrap_imul(Left, Right : Integer_32) return Integer_64;
****************/

PLARGE_INTEGER wrap_imul
(PLARGE_INTEGER result, LONG left, LONG right)
{
  *result = EnlargedIntegerMultiply(left, right);
  return result;
}


/***************
function wrap_umul(Left, Right : Unsigned_32) return Unsigned_64;
****************/

PLARGE_INTEGER wrap_umul
(PLARGE_INTEGER result, ULONG left, ULONG right)
{
  *result = EnlargedUnsignedMultiply(left, right);
  return result;
}

/***************
function wrap_imul64x32
    (Left : Ptr_64;
     Right : Integer_32) return Integer_64;
****************/

PLARGE_INTEGER wrap_imul64x32
(PLARGE_INTEGER result, PLARGE_INTEGER left, LONG right)
{
  *result = ExtendedIntegerMultiply(*left, right);
  return result;
}

/***************
function wrap_neg(Left : Ptr_64) return Integer_64;
****************/

PLARGE_INTEGER wrap_neg
(PLARGE_INTEGER result, PLARGE_INTEGER left)
{
  *result = LargeIntegerNegate(*left);
  return result;
}

/***************
function wrap_ExtendedMagicDivide
    (Dividend    : Ptr_64;
     MagicDivisor: Ptr_64;
     ShiftCount  : Natural) return Integer_64;
****************/

PLARGE_INTEGER wrap_ExtendedMagicDivide
(PLARGE_INTEGER result,
 PLARGE_INTEGER Dividend,
 PLARGE_INTEGER MagicDivisor,
 CCHAR ShiftCount)
{
  *result = ExtendedMagicDivide(*Dividend, *MagicDivisor, ShiftCount);
  return result;
}

/***************
function wrap_ExtendedLargeIntegerDivide
    (Dividend : Ptr_64;
     Divisor  : Unsigned_32;
     Remainder: access Unsigned_32) return Integer_64;
****************/

PLARGE_INTEGER wrap_ExtendedLargeIntegerDivide
(PLARGE_INTEGER result,
 PLARGE_INTEGER Dividend,
 ULONG Divisor,
 PULONG Remainder)
{
  *result = ExtendedLargeIntegerDivide(*Dividend, Divisor, Remainder);
  return result;
}

/***************
function wrap_LargeIntegerDivide
    (Dividend : Ptr_64;
     Divisor  : Ptr_64;
     Remainder: access Integer_64) 
    return Integer_64;
****************/

PLARGE_INTEGER wrap_LargeIntegerDivide
(PLARGE_INTEGER result,
 PLARGE_INTEGER Dividend,
 PLARGE_INTEGER Divisor,
 PLARGE_INTEGER Remainder)
{
  *result = LargeIntegerDivide(*Dividend, *Divisor, Remainder);
  return result;
}

/***************
function wrap_Shift_Left  (Value: Ptr_64; Amount: Natural)
    return Unsigned_64;
****************/

PLARGE_INTEGER wrap_Shift_Left
(PLARGE_INTEGER result,
 PLARGE_INTEGER LargeInteger,
 CCHAR ShiftCount)
{
  *result = LargeIntegerShiftLeft(*LargeInteger, (int)ShiftCount);
  return result;
}

/***************
function wrap_Shift_Right  (Value: Ptr_64; Amount: Natural)
    return Unsigned_64;
****************/

PLARGE_INTEGER wrap_Shift_Right
(PLARGE_INTEGER result,
 PLARGE_INTEGER LargeInteger,
 CCHAR ShiftCount)
{
  *result = LargeIntegerShiftRight(*LargeInteger, ShiftCount);
  return result;
}

/***************
function wrap_Shift_Right_Arithmetic  (Value: Ptr_64; Amount: Natural)
    return Unsigned_64;
****************/

PLARGE_INTEGER wrap_Shift_Right_Arithmetic
(PLARGE_INTEGER result,
 PLARGE_INTEGER LargeInteger,
 CCHAR ShiftCount)
{
  *result = LargeIntegerArithmeticShift(*LargeInteger, ShiftCount);
  return result;
}

/***************
function wrap_sImage (Value: Ptr_64;  Hex: Boolean := Standard.False) 
    return Image_Result;
****************/

char *wrap_sImage
(char *result,
 PLARGE_INTEGER Value,
 long Hex)
{
  *result = 0;        /* Cause caller to raise execption */
  return result;
}

/***************
function wrap_uImage (Value: Ptr_64;  Hex: Boolean := Standard.False) 
    return Image_Result;

****************/

char *wrap_uImage
(char *result,
 PLARGE_INTEGER Value,
 long Hex)
{
  *result = 0;        /* Cause caller to raise execption */
  return result;
}
