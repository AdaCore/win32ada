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

package Win32.crt.FloatPkg is

   DBL_DIG            : constant := 15;
   DBL_EPSILON        : constant := 2.22044604925031357389e-16;
   DBL_MANT_DIG       : constant := 53;
   DBL_MAX            : constant := 1.7976931348623158e+308;
   DBL_MAX_10_EXP     : constant := 308;
   DBL_MAX_EXP        : constant := 1024;
   DBL_MIN            : constant := 2.22507385850720582968e-308;
   DBL_MIN_10_EXP     : constant := -307;
   DBL_MIN_EXP        : constant := -1021;
   DBL_RADIX          : constant := 2;
   DBL_ROUNDS         : constant := 1;
   FLT_DIG            : constant := 6;
   FLT_EPSILON        : constant := 1.19209289600000031694e-07;
   FLT_GUARD          : constant := 0;
   FLT_MANT_DIG       : constant := 24;
   FLT_MAX            : constant := 3.40282346599999902814e+38;
   FLT_MAX_10_EXP     : constant := 38;
   FLT_MAX_EXP        : constant := 128;
   FLT_MIN            : constant := 1.17549435100000025997e-38;
   FLT_MIN_10_EXP     : constant := -37;
   FLT_MIN_EXP        : constant := -125;
   FLT_NORMALIZE      : constant := 0;
   FLT_RADIX          : constant := 2;
   FLT_ROUNDS         : constant := 1;
   LDBL_DIG           : constant := 15;
   LDBL_EPSILON       : constant := 2.22044604925031357389e-16;
   LDBL_MANT_DIG      : constant := 53;
   LDBL_MAX           : constant := DBL_MAX;
   LDBL_MAX_10_EXP    : constant := 308;
   LDBL_MAX_EXP       : constant := 1024;
   LDBL_MIN           : constant := 2.22507385850720582968e-308;
   LDBL_MIN_10_EXP    : constant := -307;
   LDBL_MIN_EXP       : constant := -1021;
   LDBL_RADIX         : constant := DBL_RADIX;
   LDBL_ROUNDS        : constant := DBL_ROUNDS;
   MCW_EM             : constant := 16#8001f#;
   EM_INEXACT         : constant := 16#1#;
   EM_UNDERFLOW       : constant := 16#2#;
   EM_OVERFLOW        : constant := 16#4#;
   EM_ZERODIVIDE      : constant := 16#8#;
   EM_INVALID         : constant := 16#10#;
   MCW_RC             : constant := 16#300#;
   RC_NEAR            : constant := 16#0#;
   RC_DOWN            : constant := 16#100#;
   RC_UP              : constant := 16#200#;
   RC_CHOP            : constant := 16#300#;
   SW_INEXACT         : constant := 16#1#;
   SW_UNDERFLOW       : constant := 16#2#;
   SW_OVERFLOW        : constant := 16#4#;
   SW_ZERODIVIDE      : constant := 16#8#;
   SW_INVALID         : constant := 16#10#;
   MCW_PC             : constant := 16#30000#;
   PC_64              : constant := 16#0#;
   PC_53              : constant := 16#10000#;
   PC_24              : constant := 16#20000#;
   MCW_IC             : constant := 16#40000#;
   IC_AFFINE          : constant := 16#40000#;
   IC_PROJECTIVE      : constant := 16#0#;
   EM_DENORMAL        : constant := 16#80000#;
   SW_DENORMAL        : constant := 16#80000#;
   MCW_DN             : constant := 16#1000000#;
   DN_FLUSH           : constant := 16#1000000#;
   DN_SAVE            : constant := 16#0#;
   CW_DEFAULT         : constant := 16#1f#;
   SW_UNEMULATED      : constant := 16#40#;
   SW_SQRTNEG         : constant := 16#80#;
   SW_STACKOVERFLOW   : constant := 16#200#;
   SW_STACKUNDERFLOW  : constant := 16#400#;
   FPE_INVALID        : constant := 16#81#;
   FPE_DENORMAL       : constant := 16#82#;
   FPE_ZERODIVIDE     : constant := 16#83#;
   FPE_OVERFLOW       : constant := 16#84#;
   FPE_UNDERFLOW      : constant := 16#85#;
   FPE_INEXACT        : constant := 16#86#;
   FPE_UNEMULATED     : constant := 16#87#;
   FPE_SQRTNEG        : constant := 16#88#;
   FPE_STACKOVERFLOW  : constant := 16#8a#;
   FPE_STACKUNDERFLOW : constant := 16#8b#;
   FPE_EXPLICITGEN    : constant := 16#8c#;
   FPCLASS_SNAN       : constant := 16#1#;
   FPCLASS_QNAN       : constant := 16#2#;
   FPCLASS_NINF       : constant := 16#4#;
   FPCLASS_NN         : constant := 16#8#;
   FPCLASS_ND         : constant := 16#10#;
   FPCLASS_NZ         : constant := 16#20#;
   FPCLASS_PZ         : constant := 16#40#;
   FPCLASS_PD         : constant := 16#80#;
   FPCLASS_PN         : constant := 16#100#;
   FPCLASS_PINF       : constant := 16#200#;

   function clearfp return Win32.UINT;

   function clear87 return Win32.UINT renames clearfp;

   function controlfp
     (new_value : Win32.UINT;
      mask      : Win32.UINT)
      return Win32.UINT;

   function statusfp return Win32.UINT;

   function status87 return Win32.UINT renames statusfp;

   procedure fpreset;

   function control87
     (new_value : Win32.UINT;
      mask      : Win32.UINT)
      return Win32.UINT;

   function copysign
     (x    : Win32.DOUBLE;
      y    : Win32.DOUBLE)
      return Win32.DOUBLE;

   function chgsign (x : Win32.DOUBLE) return Win32.DOUBLE;

   function scalb (x : Win32.DOUBLE; exp : Win32.INT) return Win32.DOUBLE;

   function logb (x : Win32.DOUBLE) return Win32.DOUBLE;

   function nextafter
     (x    : Win32.DOUBLE;
      y    : Win32.DOUBLE)
      return Win32.DOUBLE;

   function finite (x : Win32.DOUBLE) return Win32.INT;

   function isnan (x : Win32.DOUBLE) return Win32.INT;

   function fpclass (x : Win32.DOUBLE) return Win32.INT;

private

   pragma Import (C, clearfp, "_clearfp");
   pragma Import (C, controlfp, "_controlfp");
   pragma Import (C, statusfp, "_statusfp");
   pragma Import (C, fpreset, "_fpreset");
   pragma Import (C, control87, "_control87");
   pragma Import (C, copysign, "_copysign");
   pragma Import (C, chgsign, "_chgsign");
   pragma Import (C, scalb, "_scalb");
   pragma Import (C, logb, "_logb");
   pragma Import (C, nextafter, "_nextafter");
   pragma Import (C, finite, "_finite");
   pragma Import (C, isnan, "_isnan");
   pragma Import (C, fpclass, "_fpclass");

end Win32.crt.FloatPkg;
