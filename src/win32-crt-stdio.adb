-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT 
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
-- TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR 
-- PURPOSE.  The user assumes the entire risk as to the accuracy and the 
-- use of this file.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Royalty-free, unlimited, worldwide, non-exclusive use, modification, 
-- reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------


with Ada.Unchecked_Conversion;
with Stdarg.Impl;
with Stdarg.Inst;

package body Win32.crt.Stdio is

    use Stdarg, Stdarg.Impl, Stdarg.Inst;

    function feof (Stream: FILE_Access) return Boolean is
        use Interfaces.C;
    begin
        return((Unsigned(Stream.Flag) and IOEOF) /= 0);
    end Feof;

    function Ferror (Stream: FILE_Access) return Boolean is
      use Interfaces.C;
    begin
        return((Unsigned(Stream.Flag) and IOERR) /= 0);
    end Ferror;

    function Fileno (Stream: FILE_Access) return Interfaces.C.Int is
    begin
      return Stream.File;
    end Fileno;
 
    function "&" is new Stdarg.Concat(FILE_Access);
    function "&" is new Stdarg.Concat(Win32.PCHAR);
    function "&" is new Stdarg.Concat(Win32.PCSTR);

    function fprintf (
        stream : FILE_Access;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        Complete_Args: Stdarg.Arglist :=
            Stdarg.Empty & Stream & Format & Args;

        function C_Fprintf return Win32.INT;
        pragma Import(C, C_Fprintf, "fprintf");

        function To_INT is new Ada.Unchecked_Conversion(
                         Stdarg.C_Param, Win32.INT);
    begin
        return To_INT(F_Varargs(
            C_Fprintf'Address,
            ArgCount(Complete_Args),
            Address_of_First_Arg(Complete_Args)));
    end fprintf;

    function fscanf (
        stream : FILE_Access;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        Complete_Args: Stdarg.Arglist :=
            Stdarg.Empty & Stream & Format & Args;

        function C_fscanf return Win32.INT;
        pragma Import(C, C_fscanf, "fscanf");

        function To_INT is new Ada.Unchecked_Conversion(
                         Stdarg.C_Param, Win32.INT);
    begin
        return To_INT(F_Varargs(
            C_fscanf'Address,
            ArgCount(Complete_Args),
            Address_of_First_Arg(Complete_Args)));
    end fscanf;

    function printf (
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        Complete_Args: Stdarg.Arglist :=
            Stdarg.Empty & Format & Args;

        function C_printf return Win32.INT;
        pragma Import(C, C_printf, "printf");

        function To_INT is new Ada.Unchecked_Conversion(
                         Stdarg.C_Param, Win32.INT);
    begin
        -- Dump(Address_of_First_Arg(Complete_Args), ArgCount(Complete_Args));
        return To_INT(F_Varargs(
            C_printf'Address,
            ArgCount(Complete_Args),
            Address_of_First_Arg(Complete_Args)));
    end printf;

    function scanf (
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        Complete_Args: Stdarg.Arglist :=
            Stdarg.Empty & Format & Args;

        function C_scanf return Win32.INT;
        pragma Import(C, C_scanf, "scanf");

        function To_INT is new Ada.Unchecked_Conversion(
                         Stdarg.C_Param, Win32.INT);
    begin
        return To_INT(F_Varargs(
            C_scanf'Address,
            ArgCount(Complete_Args),
            Address_of_First_Arg(Complete_Args)));
    end scanf;

    function snprintf (
        buffer : Win32.PSTR;
        count  : size_t;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        Complete_Args: Stdarg.Arglist :=
            Stdarg.Empty & Buffer & Int(Count) & Format & Args;

        function C_snprintf return Win32.INT;
        pragma Import(C, C_snprintf, "_snprintf");

        function To_INT is new Ada.Unchecked_Conversion(
                         Stdarg.C_Param, Win32.INT);
    begin
        return To_INT(F_Varargs(
            C_snprintf'Address,
            ArgCount(Complete_Args),
            Address_of_First_Arg(Complete_Args)));
    end snprintf;

    function sprintf (
        buffer : Win32.PSTR;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        Complete_Args: Stdarg.Arglist :=
            Stdarg.Empty & Buffer & Format & Args;

        function C_sprintf return Win32.INT;
        pragma Import(C, C_sprintf, "sprintf");

        function To_INT is new Ada.Unchecked_Conversion(
                         Stdarg.C_Param, Win32.INT);
    begin
        return To_INT(F_Varargs(
            C_sprintf'Address,
            ArgCount(Complete_Args),
            Address_of_First_Arg(Complete_Args)));
    end sprintf;

    function sscanf (
        buffer : Win32.PSTR;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        Complete_Args: Stdarg.Arglist :=
            Stdarg.Empty & Buffer & Format & Args;

        function C_sscanf return Win32.INT;
        pragma Import(C, C_sscanf, "sscanf");

        function To_INT is new Ada.Unchecked_Conversion(
                         Stdarg.C_Param, Win32.INT);
    begin
        return To_INT(F_Varargs(
            C_sscanf'Address,
            ArgCount(Complete_Args),
            Address_of_First_Arg(Complete_Args)));
    end sscanf;

    function vfprintf (
        stream : FILE_Access;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        function C_Vfprintf(Stream : FILE_Access;
                            Format : Win32.PCSTR;
                            AP     : Param_Access) return Win32.INT;
        pragma Import(C, C_Vfprintf, "vfprintf");
    begin
        return C_Vfprintf(Stream, Format, Address_of_Vararg_List (Args));
    end vfprintf;

    function vprintf (
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        function C_Vprintf(Format  : Win32.PCSTR;
                            AP     : Param_Access) return Win32.INT;
        pragma Import(C, C_Vprintf, "vprintf");
    begin
        return C_Vprintf(Format, Address_of_Vararg_List (Args));
    end vprintf;

    function vsnprintf (
        buffer : Win32.PSTR;
        count  : size_t;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        function C_Vsnprintf(Buffer  : Win32.PSTR;
                              Count  : size_t;
                              Format : Win32.PCSTR;
                              AP     : Param_Access) return Win32.INT;
        pragma Import(C, C_Vsnprintf, "_vsnprintf");
    begin
        return C_Vsnprintf(Buffer, Count, Format, 
			   Address_of_Vararg_List (Args));
    end vsnprintf;

    function vsprintf (
        buffer : Win32.PSTR;
        format : Win32.PCSTR;
        args   : Stdarg.ArgList := Stdarg.Empty) return Win32.INT is

        function C_Vsprintf(Buffer  : Win32.PSTR;
                             Format : Win32.PCSTR;
                             AP     : Param_Access) return Win32.INT;
        pragma Import(C, C_Vsprintf, "vsprintf");
    begin
        return C_Vsprintf(Buffer, Format, Address_of_Vararg_List (Args));
    end vsprintf;
 
end Win32.crt.Stdio;
