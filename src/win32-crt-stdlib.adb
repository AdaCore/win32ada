--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-stdlib.adb, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------


with Ada.Unchecked_Conversion;
with System;
with Win32.crt.PerThread;

package body Win32.crt.Stdlib is

   function Maximum (A, B : T) return T is
   begin
      if A > B then return A; else return B; end if;
   end Maximum;

   function Minimum (A, B : T) return T is
   begin
      if A < B then return A; else return B; end if;
   end Minimum;

   use type Win32.INT;         --  to get ">"
   function Mx is new Maximum (Win32.INT, ">");
   function Max (A, B : Win32.INT) return Win32.INT renames Mx;

   function Mn is new Minimum (Win32.INT, "<");
   function Min (A, B : Win32.INT) return Win32.INT renames Mn;

   --  If necessary someone could look at this code, and write a
   --  procedure that gets the address and then *sets* the code
   --  instead of getting it.  I don't know if this is useful.

   function errno return Win32.INT is
      function To_PINT is new Ada.Unchecked_Conversion
        (System.Address, Win32.PINT);
   begin
      return To_PINT (Win32.crt.PerThread.Get_Address
        (Win32.crt.PerThread.Errno)).all;
   end errno;

   function doserrno return Win32.ULONG is
      function To_PULONG is new Ada.Unchecked_Conversion
        (System.Address, Win32.PULONG);
   begin
      return To_PULONG (Win32.crt.PerThread.Get_Address
        (Win32.crt.PerThread.Doserrno)).all;
   end doserrno;

   function ldiv (numer : Win32.INT; denom : Win32.INT) return ldiv_t is
      procedure ldiv_wrapper (numer, denom : Win32.INT; res : out ldiv_t);
      pragma Import (C, ldiv_wrapper, "ldiv_wrapper");
      Res : ldiv_t;
   begin
      ldiv_wrapper (numer, denom, Res);
      return Res;
   end ldiv;

   function div (numer : Win32.INT; denom : Win32.INT) return div_t is
      procedure div_wrapper (numer, denom : Win32.INT; res : out div_t);
      pragma Import (C, div_wrapper, "div_wrapper");
      Res : div_t;
   begin
      div_wrapper (numer, denom, Res);
      return Res;
   end div;

end Win32.crt.Stdlib;


