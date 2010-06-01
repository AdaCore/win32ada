/*************************************************************************/
/* Define wrapper routines for win32-largeint-ops.adb, ObjectAda version */
/*                                                                       */
/* This file is now maintained and made available by AdaCore under       */
/* the same terms.                                                       */
/*                                                                       */
/* Copyright (C) 2000-2010, AdaCore                                      */
/*************************************************************************/

#include <windows.h>
#include <winnt.h>

#if defined (_WIN64)

#define LARGE_INTEGER long long int
#define PLARGE_INTEGER LARGE_INTEGER *

/* ??? MISSING NDRcopy in Win32 import libraries */

void NDRcopy (void *P1, void *P2, unsigned int c)
{
}

#else

/* On Win32 the [S/G]et[Window/Class]LongPtr and [S/G]et[Window/Class]Long
   are aliases */

#undef SetWindowLongPtrA
#undef SetWindowLongPtrW
#undef GetWindowLongPtrA
#undef GetWindowLongPtrW

LONG_PTR WINAPI
SetWindowLongPtrA (HWND hWND, int nIndex, LONG_PTR dwNewLong)
{
  return SetWindowLongA (hWND, nIndex, dwNewLong);
}
LONG_PTR WINAPI
SetWindowLongPtrW (HWND hWND, int nIndex, LONG_PTR dwNewLong)
{
  return SetWindowLongW (hWND, nIndex, dwNewLong);
}

LONG_PTR WINAPI
GetWindowLongPtrA (HWND hWND, int nIndex)
{
  return GetWindowLongA (hWND, nIndex);
}
LONG_PTR WINAPI
GetWindowLongPtrW (HWND hWND, int nIndex)
{
  return GetWindowLongW (hWND, nIndex);
}

#undef SetClassLongPtrA
#undef SetClassLongPtrW
#undef GetClassLongPtrA
#undef GetClassLongPtrW

LONG_PTR WINAPI
SetClassLongPtrA (HWND hWND, int nIndex, LONG_PTR dwNewLong)
{
  return SetClassLongA (hWND, nIndex, dwNewLong);
}
LONG_PTR WINAPI
SetClassLongPtrW (HWND hWND, int nIndex, LONG_PTR dwNewLong)
{
  return SetClassLongW (hWND, nIndex, dwNewLong);
}

LONG_PTR WINAPI
GetClassLongPtrA (HWND hWND, int nIndex)
{
  return GetClassLongA (hWND, nIndex);
}
LONG_PTR WINAPI
GetClassLongPtrW (HWND hWND, int nIndex)
{
  return GetClassLongW (hWND, nIndex);
}
#define LARGEINT_PROTOS
#include <largeint.h>
#endif

/***************
function wrap_add(Left, Right : Ptr_64) return Integer_64;
--------
function wrap_add(Left, Right : Ptr_64) return Unsigned_64;
****************/

/* Used for both signed and unsigned */
PLARGE_INTEGER wrap_add
(PLARGE_INTEGER result, PLARGE_INTEGER left, PLARGE_INTEGER right)
{
#if defined (_WIN64)
  *result = *left + *right;
#else
  *result = LargeIntegerAdd (*left, *right);
#endif
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
#if defined (_WIN64)
  *result = *left - *right;
#else
  *result = LargeIntegerSubtract(*left, *right);
#endif
  return result;
}

/***************
function wrap_imul(Left, Right : Integer_32) return Integer_64;
****************/

PLARGE_INTEGER wrap_imul
(PLARGE_INTEGER result, LONG left, LONG right)
{
#if defined (_WIN64)
  *result = left * right;
#else
  *result = EnlargedIntegerMultiply(left, right);
#endif
  return result;
}

/***************
function wrap_umul(Left, Right : Unsigned_32) return Unsigned_64;
****************/

PLARGE_INTEGER wrap_umul
(PLARGE_INTEGER result, ULONG left, ULONG right)
{
#if defined (_WIN64)
  *result = left * right;
#else
  *result = EnlargedUnsignedMultiply(left, right);
#endif
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
#if defined (_WIN64)
  *result = *left * right;
#else
  *result = ExtendedIntegerMultiply(*left, right);
#endif
  return result;
}

/***************
function wrap_neg(Left : Ptr_64) return Integer_64;
****************/

PLARGE_INTEGER wrap_neg
(PLARGE_INTEGER result, PLARGE_INTEGER left)
{
#if defined (_WIN64)
  *result = - (*left);
#else
  *result = LargeIntegerNegate(*left);
#endif
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
#if defined (_WIN64)
  /* ???? Not sure what this routine is supposed to do */
  *result = 0;
#else
  *result = ExtendedMagicDivide(*Dividend, *MagicDivisor, ShiftCount);
#endif
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
#if defined (_WIN64)
  *result = *Dividend / (LARGE_INTEGER)Divisor;
  if (Remainder)
    *Remainder = *Dividend % (LARGE_INTEGER)Divisor;
#else
  *result = ExtendedLargeIntegerDivide(*Dividend, Divisor, Remainder);
#endif
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
#if defined (_WIN64)
  *result = *Dividend / *Divisor;
  if (Remainder)
    *Remainder = *Dividend % *Divisor;
#else
  *result = LargeIntegerDivide(*Dividend, *Divisor, Remainder);
#endif
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
#if defined (_WIN64)
  *result = *LargeInteger << (int)ShiftCount;
#else
  *result = LargeIntegerShiftLeft(*LargeInteger, (int)ShiftCount);
#endif
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
#if defined (_WIN64)
  *result = *LargeInteger >> (int)ShiftCount;
#else
  *result = LargeIntegerShiftRight(*LargeInteger, ShiftCount);
#endif
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
#if defined (_WIN64)
  *result = *LargeInteger >> (int)ShiftCount;
#else
  *result = LargeIntegerArithmeticShift(*LargeInteger, ShiftCount);
#endif
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
  *result = 0;        /* Cause caller to raise exception */
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
  *result = 0;        /* Cause caller to raise exception */
  return result;
}
