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

package Win32.crt.Math is

   DOMAIN    : constant := 1;
   SING      : constant := 2;
   OVERFLOW  : constant := 3;
   UNDERFLOW : constant := 4;
   TLOSS     : constant := 5;
   PLOSS     : constant := 6;
   EDOM      : constant := 33;
   ERANGE    : constant := 34;

   type struct_exception is record
      c_type : Win32.INT;
      name   : Win32.PSTR;
      arg1   : Win32.DOUBLE;
      arg2   : Win32.DOUBLE;
      retval : Win32.DOUBLE;
   end record;

   type complex is record
      x : Win32.DOUBLE;
      y : Win32.DOUBLE;
   end record;

   function HUGE return Win32.DOUBLE;

   function HUGE_VAL return Win32.DOUBLE renames HUGE;

   function c_abs (n : Win32.INT) return Win32.INT;

   function acos (x : Win32.DOUBLE) return Win32.DOUBLE;

   function asin (x : Win32.DOUBLE) return Win32.DOUBLE;

   function atan (x : Win32.DOUBLE) return Win32.DOUBLE;

   function atan2 (y : Win32.DOUBLE; x : Win32.DOUBLE) return Win32.DOUBLE;

   function atof (a_string : Win32.PCSTR) return Win32.DOUBLE;

   function cabs (z : complex) return Win32.DOUBLE;

   function ceil (x : Win32.DOUBLE) return Win32.DOUBLE;

   function cos (x : Win32.DOUBLE) return Win32.DOUBLE;

   function cosh (x : Win32.DOUBLE) return Win32.DOUBLE;

   function exp (x : Win32.DOUBLE) return Win32.DOUBLE;

   function fabs (x : Win32.DOUBLE) return Win32.DOUBLE;

   function floor (x : Win32.DOUBLE) return Win32.DOUBLE;

   function fmod (x : Win32.DOUBLE; y : Win32.DOUBLE) return Win32.DOUBLE;

   function frexp
     (x      : Win32.DOUBLE;
      expptr : Win32.PINT)
      return Win32.DOUBLE;

   function hypot (x : Win32.DOUBLE; y : Win32.DOUBLE) return Win32.DOUBLE;

   function j0 (x : Win32.DOUBLE) return Win32.DOUBLE;

   function j1 (x : Win32.DOUBLE) return Win32.DOUBLE;

   function jn (n : Win32.INT; x : Win32.DOUBLE) return Win32.DOUBLE;

   function labs (n : Win32.INT) return Win32.INT;

   function ldexp (x : Win32.DOUBLE; exp : Win32.INT) return Win32.DOUBLE;

   function log (x : Win32.DOUBLE) return Win32.DOUBLE;

   function log10 (x : Win32.DOUBLE) return Win32.DOUBLE;

   function matherr (except : access struct_exception) return Win32.INT;

   function modf
     (x      : Win32.DOUBLE;
      intptr : access Win32.DOUBLE)
      return Win32.DOUBLE;

   function pow (x : Win32.DOUBLE; y : Win32.DOUBLE) return Win32.DOUBLE;

   function sin (x : Win32.DOUBLE) return Win32.DOUBLE;

   function sinh (x : Win32.DOUBLE) return Win32.DOUBLE;

   function sqrt (x : Win32.DOUBLE) return Win32.DOUBLE;

   function tan (x : Win32.DOUBLE) return Win32.DOUBLE;

   function tanh (x : Win32.DOUBLE) return Win32.DOUBLE;

   function y0 (x : Win32.DOUBLE) return Win32.DOUBLE;

   function y1 (x : Win32.DOUBLE) return Win32.DOUBLE;

   function yn (n : Win32.INT; x : Win32.DOUBLE) return Win32.DOUBLE;

private

   pragma Convention (C, struct_exception);
   pragma Convention (C_Pass_By_Copy, complex);

   pragma Import (C, c_abs, "abs");
   pragma Import (C, acos, "acos");
   pragma Import (C, asin, "asin");
   pragma Import (C, atan, "atan");
   pragma Import (C, atan2, "atan2");
   pragma Import (C, atof, "atof");
   pragma Import (C, cabs, "_cabs");
   pragma Import (C, ceil, "ceil");
   pragma Import (C, cos, "cos");
   pragma Import (C, cosh, "cosh");
   pragma Import (C, exp, "exp");
   pragma Import (C, fabs, "fabs");
   pragma Import (C, floor, "floor");
   pragma Import (C, fmod, "fmod");
   pragma Import (C, frexp, "frexp");
   pragma Import (C, hypot, "_hypot");
   pragma Import (C, j0, "_j0");
   pragma Import (C, j1, "_j1");
   pragma Import (C, jn, "_jn");
   pragma Import (C, labs, "labs");
   pragma Import (C, ldexp, "ldexp");
   pragma Import (C, log, "log");
   pragma Import (C, log10, "log10");
   pragma Import (C, matherr, "_matherr");
   pragma Import (C, modf, "modf");
   pragma Import (C, pow, "pow");
   pragma Import (C, sin, "sin");
   pragma Import (C, sinh, "sinh");
   pragma Import (C, sqrt, "sqrt");
   pragma Import (C, tan, "tan");
   pragma Import (C, tanh, "tanh");
   pragma Import (C, y0, "_y0");
   pragma Import (C, y1, "_y1");
   pragma Import (C, yn, "_yn");

end Win32.crt.Math;
