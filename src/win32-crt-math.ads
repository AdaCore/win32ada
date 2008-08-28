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

package Win32.crt.Math is

   DOMAIN    : constant := 1;  --  math.h :88
   SING      : constant := 2;  --  math.h :89
   OVERFLOW  : constant := 3;  --  math.h :90
   UNDERFLOW : constant := 4;  --  math.h :91
   TLOSS     : constant := 5;  --  math.h :92
   PLOSS     : constant := 6;  --  math.h :93
   EDOM      : constant := 33; --  math.h :95
   ERANGE    : constant := 34; --  math.h :96

   type struct_exception is                                --  math.h:50
      record
         c_type : Win32.INT;    --  math.h :51
         name   : Win32.PSTR;   --  math.h :52
         arg1   : Win32.DOUBLE; --  math.h :53
         arg2   : Win32.DOUBLE; --  math.h :54
         retval : Win32.DOUBLE; --  math.h :55
      end record;

   type complex is                                         --  math.h:72
      record
         x : Win32.DOUBLE;                                --  math.h:73
         y : Win32.DOUBLE;                                --  math.h:73
      end record;

   --  a value returned in case of error by a number of the
   --  floating point math routines
   function HUGE return Win32.DOUBLE;                      --  math.h:107

   function HUGE_VAL return Win32.DOUBLE renames HUGE;     --  math.h:110

   function c_abs (n : Win32.INT) return Win32.INT; --  math.h  :114

   function acos (x : Win32.DOUBLE) return Win32.DOUBLE; --  math.h     :115

   function asin (x : Win32.DOUBLE) return Win32.DOUBLE; --  math.h     :116

   function atan (x : Win32.DOUBLE) return Win32.DOUBLE; --  math.h     :117

   function atan2 (y : Win32.DOUBLE;
                   x : Win32.DOUBLE)
                  return Win32.DOUBLE;                 --  math.h:118

   function atof (a_string : Win32.PCSTR) return Win32.DOUBLE;
   --  math.h:119

   function cabs (z : complex) return Win32.DOUBLE;          --  math.h:120

   function ceil (x : Win32.DOUBLE) return Win32.DOUBLE;     --  math.h:121

   function cos (x : Win32.DOUBLE) return Win32.DOUBLE;      --  math.h:122

   function cosh (x : Win32.DOUBLE) return Win32.DOUBLE;     --  math.h:123

   function exp (x : Win32.DOUBLE) return Win32.DOUBLE;      --  math.h:124

   function fabs (x : Win32.DOUBLE) return Win32.DOUBLE;     --  math.h:125

   function floor (x : Win32.DOUBLE) return Win32.DOUBLE;    --  math.h:126

   function fmod (x : Win32.DOUBLE;
                  y : Win32.DOUBLE)
                 return Win32.DOUBLE;                  --  math.h:127

   function frexp (x : Win32.DOUBLE;
                   expptr : Win32.PINT)
                  return Win32.DOUBLE;                 --  math.h:128

   function hypot (x : Win32.DOUBLE;
                   y : Win32.DOUBLE)
                  return Win32.DOUBLE;                 --  math.h:129

   function j0 (x : Win32.DOUBLE) return Win32.DOUBLE;       --  math.h:130

   function j1 (x : Win32.DOUBLE) return Win32.DOUBLE;       --  math.h:131

   function jn (n : Win32.INT;
                x : Win32.DOUBLE)
               return Win32.DOUBLE;                    --  math.h:132

   function labs (n : Win32.INT) return Win32.INT;           --  math.h:133

   function ldexp (x : Win32.DOUBLE;
                   exp : Win32.INT)
                  return Win32.DOUBLE;                 --  math.h:134

   function log (x : Win32.DOUBLE) return Win32.DOUBLE;      --  math.h:135

   function log10 (x : Win32.DOUBLE) return Win32.DOUBLE;    --  math.h:136

   function matherr (except : access struct_exception)
                    return Win32.INT;                            --  math.h:137

   function modf (x : Win32.DOUBLE;
                  intptr : access Win32.DOUBLE)
                 return Win32.DOUBLE;                  --  math.h:138

   function pow (x : Win32.DOUBLE;
                 y : Win32.DOUBLE)
                return Win32.DOUBLE;                   --  math.h:139

   function sin (x : Win32.DOUBLE) return Win32.DOUBLE;      --  math.h:140

   function sinh (x : Win32.DOUBLE) return Win32.DOUBLE;     --  math.h:141

   function sqrt (x : Win32.DOUBLE) return Win32.DOUBLE;     --  math.h:142

   function tan (x : Win32.DOUBLE) return Win32.DOUBLE;      --  math.h:143

   function tanh (x : Win32.DOUBLE) return Win32.DOUBLE;     --  math.h:144

   function y0 (x : Win32.DOUBLE) return Win32.DOUBLE;       --  math.h:145

   function y1 (x : Win32.DOUBLE) return Win32.DOUBLE;       --  math.h:146

   function yn (n : Win32.INT;
                x : Win32.DOUBLE)
               return Win32.DOUBLE;                    --  math.h:147

private

   pragma Convention (C, struct_exception);                 --  math.h:50
   pragma Convention (C_Pass_By_Copy, complex);             --  math.h:72

   pragma Import (C, c_abs, "abs");                         --  math.h:114
   pragma Import (C, acos, "acos");                         --  math.h:115
   pragma Import (C, asin, "asin");                         --  math.h:116
   pragma Import (C, atan, "atan");                         --  math.h:117
   pragma Import (C, atan2, "atan2");                       --  math.h:118
   pragma Import (C, atof, "atof");                         --  math.h:119
   pragma Import (C, cabs, "_cabs");                        --  math.h:120
   pragma Import (C, ceil, "ceil");                         --  math.h:121
   pragma Import (C, cos, "cos");                           --  math.h:122
   pragma Import (C, cosh, "cosh");                         --  math.h:123
   pragma Import (C, exp, "exp");                           --  math.h:124
   pragma Import (C, fabs, "fabs");                         --  math.h:125
   pragma Import (C, floor, "floor");                       --  math.h:126
   pragma Import (C, fmod, "fmod");                         --  math.h:127
   pragma Import (C, frexp, "frexp");                       --  math.h:128
   pragma Import (C, hypot, "_hypot");                      --  math.h:129
   pragma Import (C, j0, "_j0");                            --  math.h:130
   pragma Import (C, j1, "_j1");                            --  math.h:131
   pragma Import (C, jn, "_jn");                            --  math.h:132
   pragma Import (C, labs, "labs");                         --  math.h:133
   pragma Import (C, ldexp, "ldexp");                       --  math.h:134
   pragma Import (C, log, "log");                           --  math.h:135
   pragma Import (C, log10, "log10");                       --  math.h:136
   pragma Import (C, matherr, "_matherr");                  --  math.h:137
   pragma Import (C, modf, "modf");                         --  math.h:138
   pragma Import (C, pow, "pow");                           --  math.h:139
   pragma Import (C, sin, "sin");                           --  math.h:140
   pragma Import (C, sinh, "sinh");                         --  math.h:141
   pragma Import (C, sqrt, "sqrt");                         --  math.h:142
   pragma Import (C, tan, "tan");                           --  math.h:143
   pragma Import (C, tanh, "tanh");                         --  math.h:144
   pragma Import (C, y0, "_y0");                            --  math.h:145
   pragma Import (C, y1, "_y1");                            --  math.h:146
   pragma Import (C, yn, "_yn");                            --  math.h:147

end Win32.crt.Math;
