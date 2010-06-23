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

with Stdarg.Impl;
with Stdarg.Inst;

package body Win32.crt.WcharPkg is

   use Stdarg, Stdarg.Impl, Stdarg.Inst;

   function getwchar return wint_t is
   begin
      return fgetwc (Stdio.stdin);
   end getwchar;

   function putwchar (c : in wint_t) return wint_t is
   begin
      return fputwc (c, Stdio.stdout);
   end putwchar;

   function "&" is new Stdarg.Concat (Win32.crt.Stdio.FILE_Access);
   function "&" is new Stdarg.Concat (Win32.PCWSTR);
   function "&" is new Stdarg.Concat (Win32.PWSTR);

   function fwprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      Complete_Args : constant Stdarg.ArgList := Stdarg.Empty &
                                                 stream &
                                                 format &
                                                 args;

      function C_fwprintf return Win32.INT;
      pragma Import (C, C_fwprintf, "fwprintf");

   begin
      return Win32.INT
               (F_Varargs
                   (C_fwprintf'Address,
                    ArgCount (Complete_Args),
                    Address_of_First_Arg (Complete_Args)));
   end fwprintf;

   function fwscanf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      Complete_Args : constant Stdarg.ArgList := Stdarg.Empty &
                                                 stream &
                                                 format &
                                                 args;

      function C_fwscanf return Win32.INT;
      pragma Import (C, C_fwscanf, "fwscanf");

   begin
      return Win32.INT
               (F_Varargs
                   (C_fwscanf'Address,
                    ArgCount (Complete_Args),
                    Address_of_First_Arg (Complete_Args)));
   end fwscanf;

   function wprintf
     (format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      Complete_Args : constant Stdarg.ArgList := Stdarg.Empty & format & args;

      function C_wprintf return Win32.INT;
      pragma Import (C, C_wprintf, "wprintf");

   begin
      return Win32.INT
               (F_Varargs
                   (C_wprintf'Address,
                    ArgCount (Complete_Args),
                    Address_of_First_Arg (Complete_Args)));
   end wprintf;

   function wscanf
     (format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      Complete_Args : constant Stdarg.ArgList := Stdarg.Empty & format & args;

      function C_wscanf return Win32.INT;
      pragma Import (C, C_wscanf, "wscanf");

   begin
      return Win32.INT
               (F_Varargs
                   (C_wscanf'Address,
                    ArgCount (Complete_Args),
                    Address_of_First_Arg (Complete_Args)));
   end wscanf;

   function snwprintf
     (buffer : Win32.PWSTR;
      count  : size_t;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      Complete_Args : constant Stdarg.ArgList :=
         Stdarg.Empty & buffer & INT (count) & format & args;

      function C_snwprintf return Win32.INT;
      pragma Import (C, C_snwprintf, "_snwprintf");

   begin
      return Win32.INT
               (F_Varargs
                   (C_snwprintf'Address,
                    ArgCount (Complete_Args),
                    Address_of_First_Arg (Complete_Args)));
   end snwprintf;

   function swprintf
     (buffer : Win32.PWSTR;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      Complete_Args : constant Stdarg.ArgList := Stdarg.Empty &
                                                 buffer &
                                                 format &
                                                 args;

      function C_swprintf return Win32.INT;
      pragma Import (C, C_swprintf, "swprintf");

   begin
      return Win32.INT
               (F_Varargs
                   (C_swprintf'Address,
                    ArgCount (Complete_Args),
                    Address_of_First_Arg (Complete_Args)));
   end swprintf;

   function swscanf
     (buffer : Win32.PWSTR;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      Complete_Args : constant Stdarg.ArgList := Stdarg.Empty &
                                                 buffer &
                                                 format &
                                                 args;

      function C_swscanf return Win32.INT;
      pragma Import (C, C_swscanf, "swscanf");

   begin
      return Win32.INT
               (F_Varargs
                   (C_swscanf'Address,
                    ArgCount (Complete_Args),
                    Address_of_First_Arg (Complete_Args)));
   end swscanf;

   function vfwprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      function C_Vfwprintf
        (Stream : Win32.crt.Stdio.FILE_Access;
         Format : Win32.PCWSTR;
         AP     : Param_Access)
         return Win32.INT;
      pragma Import (C, C_Vfwprintf, "vfwprintf");
   begin
      return C_Vfwprintf (stream, format, Address_of_Vararg_List (args));
   end vfwprintf;

   function vwprintf
     (format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      function C_Vwprintf
        (Format : Win32.PCWSTR;
         AP     : Param_Access)
         return Win32.INT;
      pragma Import (C, C_Vwprintf, "vwprintf");
   begin
      return C_Vwprintf (format, Address_of_Vararg_List (args));
   end vwprintf;

   function vsnwprintf
     (buffer : Win32.PWSTR;
      count  : size_t;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      function C_Vsnwprintf
        (Buffer : Win32.PWSTR;
         Count  : size_t;
         Format : Win32.PCWSTR;
         AP     : Param_Access)
         return Win32.INT;
      pragma Import (C, C_Vsnwprintf, "_vsnwprintf");
   begin
      return C_Vsnwprintf
               (buffer,
                count,
                format,
                Address_of_Vararg_List (args));
   end vsnwprintf;

   function vswprintf
     (buffer : Win32.PWSTR;
      format : Win32.PCWSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT
   is
      function C_Vswprintf
        (Buffer : Win32.PWSTR;
         Format : Win32.PCWSTR;
         AP     : Param_Access)
         return Win32.INT;
      pragma Import (C, C_Vswprintf, "vswprintf");
   begin
      return C_Vswprintf (buffer, format, Address_of_Vararg_List (args));
   end vswprintf;

end Win32.crt.WcharPkg;
