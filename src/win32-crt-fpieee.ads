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

with Win32;
with Win32.Winnt;

package Win32.crt.Fpieee is

   type FPIEEE_COMPARE_RESULT is (
      FpCompareEqual,
      FpCompareGreater,
      FpCompareLess,
      FpCompareUnordered);

   type FPIEEE_FORMAT is (
      FpFormatFp32,
      FpFormatFp64,
      FpFormatFp80,
      FpFormatFp128,
      FpFormatI16,
      FpFormatI32,
      FpFormatI64,
      FpFormatU16,
      FpFormatU32,
      FpFormatU64,
      FpFormatBcd80,
      FpFormatCompare,
      FpFormatString);

   pragma Convention (C, FPIEEE_FORMAT);

   type FP_OPERATION_CODE is (
      FpCodeUnspecified,
      FpCodeAdd,
      FpCodeSubtract,
      FpCodeMultiply,
      FpCodeDivide,
      FpCodeSquareRoot,
      FpCodeRemainder,
      FpCodeCompare,
      FpCodeConvert,
      FpCodeRound,
      FpCodeTruncate,
      FpCodeFloor,
      FpCodeCeil,
      FpCodeAcos,
      FpCodeAsin,
      FpCodeAtan,
      FpCodeAtan2,
      FpCodeCabs,
      FpCodeCos,
      FpCodeCosh,
      FpCodeExp,
      FpCodeFabs,
      FpCodeFmod,
      FpCodeFrexp,
      FpCodeHypot,
      FpCodeLdexp,
      FpCodeLog,
      FpCodeLog10,
      FpCodeModf,
      FpCodePow,
      FpCodeSin,
      FpCodeSinh,
      FpCodeTan,
      FpCodeTanh,
      FpCodeY0,
      FpCodeY1,
      FpCodeYn,
      FpCodeLogb,
      FpCodeNextafter,
      FpCodeNegate);

   type FPIEEE_ROUNDING_MODE is (
      FpRoundNearest,
      FpRoundMinusInfinity,
      FpRoundPlusInfinity,
      FpRoundChopped);

   type FPIEEE_PRECISION is (FpPrecisionFull, FpPrecision53, FpPrecision24);

   subtype FP32 is Win32.FLOAT;

   subtype FP64 is Win32.DOUBLE;

   subtype I16 is Win32.SHORT;

   subtype I32 is Win32.LONG;

   subtype U16 is Win32.USHORT;

   subtype U32 is Win32.ULONG;

   type FP80 is array (0 .. 4) of aliased Win32.USHORT;

   type FP128 is array (0 .. 3) of aliased Win32.ULONG;

   type I64 is array (0 .. 1) of aliased Win32.ULONG;

   type U64 is array (0 .. 1) of aliased Win32.ULONG;

   type BCD80 is array (0 .. 4) of aliased Win32.USHORT;

   type FPIEEE_VALUE (Format : FPIEEE_FORMAT := FpFormatFp128) is record
      OperandValid : Boolean;
      case Format is
      when FpFormatFp32 =>
         Fp32Value : FP32;
      when FpFormatFp64 =>
         Fp64Value : FP64;
      when FpFormatFp80 =>
         Fp80Value : FP80;
      when FpFormatFp128 =>
         Fp128Value : FP128;
      when FpFormatI16 =>
         I16Value : I16;
      when FpFormatI32 =>
         I32Value : I32;
      when FpFormatI64 =>
         I64Value : I64;
      when FpFormatU16 =>
         U16Value : U16;
      when FpFormatU32 =>
         U32Value : U32;
      when FpFormatU64 =>
         U64Value : U64;
      when FpFormatBcd80 =>
         Bcd80Value : BCD80;
      when FpFormatString =>
         StringValue : Win32.PSTR;
      when FpFormatCompare =>
         CompareValue : Win32.INT;
      end case;
   end record;

   for FPIEEE_VALUE use record
      Fp32Value    at 0 range 0 .. 31;
      Fp64Value    at 0 range 0 .. 63;
      Fp80Value    at 0 range 0 .. 79;
      Fp128Value   at 0 range 0 .. 127;
      I16Value     at 0 range 0 .. 15;
      I32Value     at 0 range 0 .. 31;
      I64Value     at 0 range 0 .. 63;
      U16Value     at 0 range 0 .. 15;
      U32Value     at 0 range 0 .. 31;
      U64Value     at 0 range 0 .. 63;
      Bcd80Value   at 0 range 0 .. 79;
      StringValue  at 0 range 0 .. LONG_PTR'Size - 1;
      CompareValue at 0 range 0 .. 31;
      OperandValid at 16 range 0 .. 0;
      Format       at 16 range 1 .. 4;
   end record;

   pragma Warnings (Off, FPIEEE_VALUE);
   --  ??? This is suspicious but let's kill this working for now

   FVSIZE : constant := 24;

   pragma Warnings (Off);
   for FPIEEE_VALUE'Size use FVSIZE * 8;
   pragma Warnings (On);

   type FPIEEE_EXCEPTION_FLAGS is record
      Inexact, Underflow, Overflow, ZeroDivide, InvalidOperation : Boolean;
   end record;

   for FPIEEE_EXCEPTION_FLAGS use record
      Inexact          at 0 range 0 .. 0;
      Underflow        at 0 range 1 .. 1;
      Overflow         at 0 range 2 .. 2;
      ZeroDivide       at 0 range 3 .. 3;
      InvalidOperation at 0 range 4 .. 4;
   end record;

   type FPIEEE_RECORD is record
      RoundingMode : Win32.Bits2;
      Precision    : Win32.Bits3;
      Operation    : Win32.Bits12;
      Cause        : FPIEEE_EXCEPTION_FLAGS;
      Enable       : FPIEEE_EXCEPTION_FLAGS;
      Status       : FPIEEE_EXCEPTION_FLAGS;
      Operand1     : FPIEEE_VALUE;
      Operand2     : FPIEEE_VALUE;
      Result       : FPIEEE_VALUE;
   end record;

   for FPIEEE_RECORD use record
      RoundingMode at 0 range 0 .. 1;
      Precision    at 0 range 2 .. 4;
      Operation    at 0 range 5 .. 16;
      Cause        at 4 range 0 .. 4;
      Enable       at 8 range 0 .. 4;
      Status       at 12 range 0 .. 4;
      Operand1     at 16 range 0 .. (FVSIZE * 8 - 1);
      Operand2     at 16 + FVSIZE range 0 .. (FVSIZE * 8 - 1);
      Result       at 16 + FVSIZE + FVSIZE range 0 .. (FVSIZE * 8 - 1);
   end record;

   type handler_func is access function
     (reason : access FPIEEE_RECORD)
      return Win32.INT;
   pragma Convention (Stdcall, handler_func);

   function fpieee_flt
     (exc_code : Win32.ULONG;
      exc_info : Win32.Winnt.PEXCEPTION_POINTERS;
      handler  : handler_func)
      return Win32.INT;

private

   pragma Convention (C, FPIEEE_COMPARE_RESULT);
   pragma Convention (C, FP_OPERATION_CODE);
   pragma Convention (C, FPIEEE_ROUNDING_MODE);
   pragma Convention (C, FPIEEE_PRECISION);
   pragma Convention (C, FP80);
   pragma Convention (C, FP128);
   pragma Convention (C, I64);
   pragma Convention (C, U64);
   pragma Convention (C, BCD80);
   pragma Convention (C, FPIEEE_VALUE);
   pragma Convention (C, FPIEEE_EXCEPTION_FLAGS);
   pragma Convention (C, FPIEEE_RECORD);

   pragma Import (C, fpieee_flt, "_fpieee_flt");

end Win32.crt.Fpieee;
