--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-conio.adb, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT
--  WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
--  TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
--  PARTICULAR PURPOSE.  The user assumes the entire risk as to the accuracy
--  and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------


with Ada.Unchecked_Conversion;
with Stdarg.Impl;

package body Win32.crt.Conio is

   function "&" is new Stdarg.Concat (Win32.PCSTR);

   function cprintf
     (format : Win32.PCSTR;
      args : Stdarg.ArgList :=  Stdarg.Empty) return Win32.INT is

      use Stdarg, Stdarg.Impl;

      Complete_Args : Stdarg.ArgList :=
        Stdarg.Empty & format & args;

      function C_cprintf return Win32.INT;
      pragma Import (C, C_cprintf, "_cprintf");

      function To_INT is new Ada.Unchecked_Conversion
        (Stdarg.C_Param, Win32.INT);
   begin
      return To_INT (F_Varargs
        (C_cprintf'Address,
        ArgCount (Complete_Args),
        Address_of_First_Arg (Complete_Args)));
   end cprintf;

   function cscanf
     (format : Win32.PCSTR;
      args : Stdarg.ArgList :=  Stdarg.Empty) return Win32.INT is

      use Stdarg, Stdarg.Impl;

      Complete_Args : Stdarg.ArgList :=
        Stdarg.Empty & format & args;

      function C_cscanf return Win32.INT;
      pragma Import (C, C_cscanf, "_cscanf");

      function To_INT is new Ada.Unchecked_Conversion
        (Stdarg.C_Param, Win32.INT);
   begin
      return To_INT (F_Varargs
        (C_cscanf'Address,
        ArgCount (Complete_Args),
        Address_of_First_Arg (Complete_Args)));
   end cscanf;

end Win32.crt.Conio;


