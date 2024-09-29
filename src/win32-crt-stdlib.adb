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
--  Copyright (C) 2000-2011, AdaCore
--
-------------------------------------------------------------------------------

with Win32.crt.PerThread;

package body Win32.crt.Stdlib is

   function Maximum (A, B : T) return T is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Maximum;

   function Minimum (A, B : T) return T is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Minimum;

   use type Win32.INT;
   function Mx is new Maximum (Win32.INT, ">");
   function Max (A, B : Win32.INT) return Win32.INT renames Mx;

   function Mn is new Minimum (Win32.INT, "<");
   function Min (A, B : Win32.INT) return Win32.INT renames Mn;

   function errno return Win32.INT is
   begin
      return To_PINT
                (Win32.crt.PerThread.Get_Address
                   (Win32.crt.PerThread.Errno)).all;
   end errno;

   function doserrno return Win32.ULONG is
   begin
      return To_PULONG
                (Win32.crt.PerThread.Get_Address
                    (Win32.crt.PerThread.Doserrno)).all;
   end doserrno;

   function ldiv (numer : Win32.LONG; denom : Win32.LONG) return ldiv_t is
      function w_ldiv (numer, denom : Win32.LONG) return access ldiv_t;
      pragma Import (C, w_ldiv, "ldiv");
      Res : ldiv_t;
   begin
      return w_ldiv (numer, denom).all;
   end ldiv;

   function div (numer : Win32.INT; denom : Win32.INT) return div_t is
      function w_div (numer, denom : Win32.INT) return access div_t;
      pragma Import (C, w_div, "div");
      Res : div_t;
   begin
      return w_div (numer, denom).all;
   end div;

end Win32.crt.Stdlib;
