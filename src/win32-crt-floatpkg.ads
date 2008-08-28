-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
--  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
--  FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
--  the accuracy and the use of this file.  This file may be used, copied,
--  modified and distributed only by licensees of Microsoft Corporation's
--  WIN32 Software Development Kit in accordance with the terms of the
--  licensee's End-User License Agreement for Microsoft Software for the
--  WIN32 Development Kit.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Portions (c) 1985-1994 Microsoft Corporation with permission.
--  Microsoft is a registered trademark and Windows and Windows NT are
--  trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

package Win32.crt.FloatPkg is

   DBL_DIG            : constant := 15;                    -- float.h:46
   DBL_EPSILON        : constant := 2.22044604925031357389e-16;
   --  float.h:47
   DBL_MANT_DIG       : constant := 53;                    -- float.h:48
   DBL_MAX            : constant := 1.7976931348623158e+308;
   --  float.h:49
   DBL_MAX_10_EXP     : constant := 308;                   -- float.h:50
   DBL_MAX_EXP        : constant := 1024;                  -- float.h:51
   DBL_MIN            : constant := 2.22507385850720582968e-308;
   --  float.h:52
   DBL_MIN_10_EXP     : constant := -307;                  -- float.h:53
   DBL_MIN_EXP        : constant := -1021;                 -- float.h:54
   DBL_RADIX          : constant := 2;                     -- float.h:55
   DBL_ROUNDS         : constant := 1;                     -- float.h:56
   FLT_DIG            : constant := 6;                     -- float.h:58
   FLT_EPSILON        : constant := 1.19209289600000031694e-07;
   --  float.h:59
   FLT_GUARD          : constant := 0;                     -- float.h:60
   FLT_MANT_DIG       : constant := 24;                    -- float.h:61
   FLT_MAX            : constant := 3.40282346599999902814e+38;
   --  float.h:62
   FLT_MAX_10_EXP     : constant := 38;                    -- float.h:63
   FLT_MAX_EXP        : constant := 128;                   -- float.h:64
   FLT_MIN            : constant := 1.17549435100000025997e-38;
   --  float.h:65
   FLT_MIN_10_EXP     : constant := -37;                   -- float.h:66
   FLT_MIN_EXP        : constant := -125;                  -- float.h:67
   FLT_NORMALIZE      : constant := 0;                     -- float.h:68
   FLT_RADIX          : constant := 2;                     -- float.h:69
   FLT_ROUNDS         : constant := 1;                     -- float.h:70
   LDBL_DIG           : constant := 15;                    -- float.h:72
   LDBL_EPSILON       : constant := 2.22044604925031357389e-16;
   --  float.h:73
   LDBL_MANT_DIG      : constant := 53;                    -- float.h:74
   LDBL_MAX           : constant := DBL_MAX;               -- float.h:75
   LDBL_MAX_10_EXP    : constant := 308;                   -- float.h:76
   LDBL_MAX_EXP       : constant := 1024;                  -- float.h:77
   LDBL_MIN           : constant := 2.22507385850720582968e-308;
   --  float.h:78
   LDBL_MIN_10_EXP    : constant := -307;                  -- float.h:79
   LDBL_MIN_EXP       : constant := -1021;                 -- float.h:80
   LDBL_RADIX         : constant := DBL_RADIX;             -- float.h:81
   LDBL_ROUNDS        : constant := DBL_ROUNDS;            -- float.h:82
   MCW_EM             : constant := 16#8001f#;             -- float.h:101
   EM_INEXACT         : constant := 16#1#;                 -- float.h:102
   EM_UNDERFLOW       : constant := 16#2#;                 -- float.h:103
   EM_OVERFLOW        : constant := 16#4#;                 -- float.h:104
   EM_ZERODIVIDE      : constant := 16#8#;                 -- float.h:105
   EM_INVALID         : constant := 16#10#;                -- float.h:106
   MCW_RC             : constant := 16#300#;               -- float.h:108
   RC_NEAR            : constant := 16#0#;                 -- float.h:109
   RC_DOWN            : constant := 16#100#;               -- float.h:110
   RC_UP              : constant := 16#200#;               -- float.h:111
   RC_CHOP            : constant := 16#300#;               -- float.h:112
   SW_INEXACT         : constant := 16#1#;                 -- float.h:118
   SW_UNDERFLOW       : constant := 16#2#;                 -- float.h:119
   SW_OVERFLOW        : constant := 16#4#;                 -- float.h:120
   SW_ZERODIVIDE      : constant := 16#8#;                 -- float.h:121
   SW_INVALID         : constant := 16#10#;                -- float.h:122
   MCW_PC             : constant := 16#30000#;             -- float.h:129
   PC_64              : constant := 16#0#;                 -- float.h:130
   PC_53              : constant := 16#10000#;             -- float.h:131
   PC_24              : constant := 16#20000#;             -- float.h:132
   MCW_IC             : constant := 16#40000#;             -- float.h:134
   IC_AFFINE          : constant := 16#40000#;             -- float.h:135
   IC_PROJECTIVE      : constant := 16#0#;                 -- float.h:136
   EM_DENORMAL        : constant := 16#80000#;             -- float.h:138
   SW_DENORMAL        : constant := 16#80000#;             -- float.h:140
   MCW_DN             : constant := 16#1000000#;           -- float.h:150
   DN_FLUSH           : constant := 16#1000000#;           -- float.h:151
   DN_SAVE            : constant := 16#0#;                 -- float.h:152
   CW_DEFAULT         : constant := 16#1f#;                -- float.h:159
   SW_UNEMULATED      : constant := 16#40#;                -- float.h:182
   SW_SQRTNEG         : constant := 16#80#;                -- float.h:183
   SW_STACKOVERFLOW   : constant := 16#200#;               -- float.h:184
   SW_STACKUNDERFLOW  : constant := 16#400#;               -- float.h:185
   FPE_INVALID        : constant := 16#81#;                -- float.h:189
   FPE_DENORMAL       : constant := 16#82#;                -- float.h:190
   FPE_ZERODIVIDE     : constant := 16#83#;                -- float.h:191
   FPE_OVERFLOW       : constant := 16#84#;                -- float.h:192
   FPE_UNDERFLOW      : constant := 16#85#;                -- float.h:193
   FPE_INEXACT        : constant := 16#86#;                -- float.h:194
   FPE_UNEMULATED     : constant := 16#87#;                -- float.h:196
   FPE_SQRTNEG        : constant := 16#88#;                -- float.h:197
   FPE_STACKOVERFLOW  : constant := 16#8a#;                -- float.h:198
   FPE_STACKUNDERFLOW : constant := 16#8b#;                -- float.h:199
   FPE_EXPLICITGEN    : constant := 16#8c#;                -- float.h:201
   FPCLASS_SNAN       : constant := 16#1#;                 -- float.h:215
   FPCLASS_QNAN       : constant := 16#2#;                 -- float.h:216
   FPCLASS_NINF       : constant := 16#4#;                 -- float.h:217
   FPCLASS_NN         : constant := 16#8#;                 -- float.h:218
   FPCLASS_ND         : constant := 16#10#;                -- float.h:219
   FPCLASS_NZ         : constant := 16#20#;                -- float.h:220
   FPCLASS_PZ         : constant := 16#40#;                -- float.h:221
   FPCLASS_PD         : constant := 16#80#;                -- float.h:222
   FPCLASS_PN         : constant := 16#100#;               -- float.h:223
   FPCLASS_PINF       : constant := 16#200#;               -- float.h:224

   --  Global variable holding floating point error code
   --  function fpecode return Win32.INT;                   -- float.h:174
   --  not in Microsoft OpenTools, see win32-extras.ads instead

   function clearfp return Win32.UINT;                     -- float.h:89

   function clear87 return Win32.UINT renames clearfp;     -- float.h:94

   function controlfp (new_value : Win32.UINT;
                       mask     : Win32.UINT)
                      return Win32.UINT;               -- float.h:90

   function statusfp return Win32.UINT;                    -- float.h:91

   function status87 return Win32.UINT renames statusfp;   -- float.h:95

   procedure fpreset;                                      -- float.h:92

   function control87 (new_value : Win32.UINT;
                       mask     : Win32.UINT)
                      return Win32.UINT;               -- float.h:143

   function copysign (x : Win32.DOUBLE;
                      y : Win32.DOUBLE)
                     return Win32.DOUBLE;              -- float.h:206

   function chgsign (x : Win32.DOUBLE) return Win32.DOUBLE;  -- float.h:207

   function scalb (x  : Win32.DOUBLE;
                   exp : Win32.INT)
                  return Win32.DOUBLE;                 -- float.h:208

   function logb (x : Win32.DOUBLE) return Win32.DOUBLE;     -- float.h:209

   function nextafter (x : Win32.DOUBLE;
                       y : Win32.DOUBLE)
                      return Win32.DOUBLE;             -- float.h:210

   function finite (x : Win32.DOUBLE) return Win32.INT;      -- float.h:211

   function isnan (x : Win32.DOUBLE) return Win32.INT;       -- float.h:212

   function fpclass (x : Win32.DOUBLE) return Win32.INT;     -- float.h:213

private

   --  pragma Inline (fpecode);

   pragma Import (C, clearfp, "_clearfp");                  -- float.h:89
   pragma Import (C, controlfp, "_controlfp");              -- float.h:90
   pragma Import (C, statusfp, "_statusfp");                -- float.h:91
   pragma Import (C, fpreset, "_fpreset");                  -- float.h:92
   pragma Import (C, control87, "_control87");              -- float.h:143
   pragma Import (C, copysign, "_copysign");                -- float.h:206
   pragma Import (C, chgsign, "_chgsign");                  -- float.h:207
   pragma Import (C, scalb, "_scalb");                      -- float.h:208
   pragma Import (C, logb, "_logb");                        -- float.h:209
   pragma Import (C, nextafter, "_nextafter");              -- float.h:210
   pragma Import (C, finite, "_finite");                    -- float.h:211
   pragma Import (C, isnan, "_isnan");                      -- float.h:212
   pragma Import (C, fpclass, "_fpclass");                  -- float.h:213

end Win32.crt.FloatPkg;
