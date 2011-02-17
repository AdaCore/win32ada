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

with Win32;

package Win32.crt.Stdlib is

   EXIT_SUCCESS      : constant := 0;
   EXIT_FAILURE      : constant := 1;
   RAND_MAX          : constant := 16#7fff#;
   MAX_PATH          : constant := 260;
   MAX_DRIVE         : constant := 3;
   MAX_DIR           : constant := 256;
   MAX_FNAME         : constant := 256;
   MAX_EXT           : constant := 256;
   CRIT_ERROR_PROMPT : constant := 0;
   CRIT_ERROR_FAIL   : constant := 1;
   SLEEP_MINIMUM     : constant := 0;
   SLEEP_FOREVER     : constant := -1;
   DOS_MODE          : constant := 0;
   OS2_MODE          : constant := 1;
   WIN_MODE          : constant := 2;
   OS2_20_MODE       : constant := 3;
   DOSX32_MODE       : constant := 4;
   POSIX_MODE        : constant := 5;
   REAL_MODE         : constant := 0;
   PROT_MODE         : constant := 1;
   FLAT_MODE         : constant := 2;

   type onexit_t is access function return Win32.INT;
   pragma Convention (Stdcall, onexit_t);

   type div_t is record
      quot  : Win32.INT;
      c_rem : Win32.INT;
   end record;

   type ldiv_t is record
      quot  : Win32.INT;
      c_rem : Win32.INT;
   end record;

   type atexit_t is access procedure;
   pragma Convention (C, atexit_t);

   type String_Array is
     array (0 .. Win32.ANYSIZE_ARRAY) of aliased Win32.PSTR;

   type USA is access Win32.USHORT;
   type SAP is access String_Array;
   type AI is access Win32.INT;
   type SAPP is access SAP;
   type SP is access Win32.PSTR;

#if HOST = "Win32" then
   sys_errlist_addr : constant SAP;
   pragma Import (C, sys_errlist_addr, "_imp___sys_errlist");
   pragma Suppress (Index_Check, sys_errlist_addr);

   sys_nerr_addr : constant AI;
   pragma Import (C, sys_nerr_addr, "_imp___sys_nerr");

   function mb_cur_max_addr return USA;
   pragma Import (C, mb_cur_max_addr, "__p___mb_cur_max");

   function argc_addr return AI;
   pragma Import (C, argc_addr, "__p___argc");

   function argv_addr return SAPP;
   pragma Import (C, argv_addr, "__p___argv");

   function environ_addr return SAPP;
   pragma Import (C, environ_addr, "__p__environ");

   function osver_addr return AI;
   pragma Import (C, osver_addr, "__p__osver");

   function winver_addr return AI;
   pragma Import (C, winver_addr, "__p__winver");

   function winmajor_addr return AI;
   pragma Import (C, winmajor_addr, "__p__winmajor");

   function winminor_addr return AI;
   pragma Import (C, winminor_addr, "__p__winminor");

   function fmode_addr return AI;
   pragma Import (C, fmode_addr, "__p__fmode");

   fileinfo_addr : constant AI;
   pragma Import (C, fileinfo_addr, "_imp___fileinfo");

   function pgmptr_addr return SP;
   pragma Import (C, pgmptr_addr, "__p__pgmptr");
#else
   sys_errlist_addr : constant SAP;
   pragma Import (C, sys_errlist_addr, "__imp__sys_errlist");
   pragma Suppress (Index_Check, sys_errlist_addr);

   sys_nerr_addr : constant AI;
   pragma Import (C, sys_nerr_addr, "__imp__sys_nerr");

   mb_cur_max_addr : constant USA;
   pragma Import (C, mb_cur_max_addr, "__imp___mb_cur_max");

   argc_addr : constant AI;
   pragma Import (C, argc_addr, "__imp___argc");

   argv_addr : constant SAPP;
   pragma Import (C, argv_addr, "__imp___argv");

   environ_addr : constant SAPP;
   pragma Import (C, environ_addr, "__imp__environ");

   osver_addr : constant AI;
   pragma Import (C, osver_addr, "__imp__osver");

   winver_addr : constant AI;
   pragma Import (C, winver_addr, "__imp__winver");

   winmajor_addr : constant AI;
   pragma Import (C, winmajor_addr, "__imp__winmajor");

   winminor_addr : constant AI;
   pragma Import (C, winminor_addr, "__imp__winminor");

   fmode_addr : constant AI;
   pragma Import (C, fmode_addr, "__imp__fmode");

   fileinfo_addr : constant AI;
   pragma Import (C, fileinfo_addr, "__imp__fileinfo");

   pgmptr_addr : constant SP;
   pragma Import (C, pgmptr_addr, "__imp__pgmptr");
#end if;

   MB_CUR_MAX : Win32.USHORT renames mb_cur_max_addr.all;

   sys_errlist : String_Array renames sys_errlist_addr.all;
   pragma Suppress (All_Checks, On => sys_errlist);

   sys_nerr : Win32.INT renames sys_nerr_addr.all;

   argc : Win32.INT renames argc_addr.all;

   argv : SAP renames argv_addr.all;

   environ : SAP renames environ_addr.all;

   fmode : Win32.INT renames fmode_addr.all;

   fileinfo : Win32.INT renames fileinfo_addr.all;

   pgmptr : Win32.PSTR renames pgmptr_addr.all;

   osver : Win32.INT renames osver_addr.all;

   winver : Win32.INT renames winver_addr.all;

   winmajor : Win32.INT renames winmajor_addr.all;

   winminor : Win32.INT renames winminor_addr.all;

   function errno return Win32.INT;

   function doserrno return Win32.ULONG;

   function atexit (proc : atexit_t) return Win32.INT;

   function atoi (string1 : Win32.PCSTR) return Win32.INT;

   function atol (string1 : Win32.PCSTR) return Win32.INT;
   function div (numer : Win32.INT; denom : Win32.INT) return div_t;

   function getenv (varname : Win32.PCSTR) return Win32.PSTR;

   function itoa
     (value   : Win32.INT;
      string1 : Win32.PSTR;
      radix   : Win32.INT)
      return Win32.PSTR;

   function ldiv (numer : Win32.INT; denom : Win32.INT) return ldiv_t;

   function ltoa
     (value   : Win32.INT;
      string1 : Win32.PSTR;
      radix   : Win32.INT)
      return Win32.PSTR;

   function mblen
     (mbstr : Win32.PCSTR;
      count : Win32.Size_T)
      return Win32.INT;

   function mbstrlen (s : Win32.PCSTR) return Win32.Size_T;

   function mbtowc
     (wchar  : Win32.PWSTR;
      mbchar : Win32.PCSTR;
      count  : Win32.Size_T)
      return Win32.INT;

   function mbstowcs
     (wcstr : Win32.PWSTR;
      mbstr : Win32.PCSTR;
      count : Win32.Size_T)
      return Win32.Size_T;

   function rand return Win32.INT;

   procedure srand (seed : Win32.UINT);

   function strtod
     (nptr   : Win32.PCSTR;
      endptr : access Win32.PSTR)
      return Win32.DOUBLE;

   function strtol
     (nptr   : Win32.PCSTR;
      endptr : access Win32.PSTR;
      base   : Win32.INT)
      return Win32.INT;

   function strtoul
     (nptr   : Win32.PCSTR;
      endptr : access Win32.PSTR;
      base   : Win32.INT)
      return Win32.UINT;

   function ultoa
     (value   : Win32.UINT;
      string1 : Win32.PSTR;
      radix   : Win32.INT)
      return Win32.PSTR;

   function wctomb
     (mbchar : Win32.PSTR;
      wchar  : Win32.Wchar_T)
      return Win32.INT;

   function wcstombs
     (mbstr   : Win32.PSTR;
      wchar_t : Win32.PCWSTR;
      count   : Win32.Size_T)
      return Win32.Size_T;

   function ecvt
     (value : Win32.DOUBLE;
      count : Win32.INT;
      dec   : Win32.PINT;
      sign  : Win32.PINT)
      return Win32.PSTR;

   function fcvt
     (value : Win32.DOUBLE;
      count : Win32.INT;
      dec   : Win32.PINT;
      sign  : Win32.PINT)
      return Win32.PSTR;

   function fullpath
     (buffer   : Win32.PSTR;
      pathname : Win32.PCSTR;
      maxlen   : Win32.Size_T)
      return Win32.PSTR;

   function gcvt
     (value      : Win32.DOUBLE;
      num_digits : Win32.INT;
      buffer     : Win32.PSTR)
      return Win32.PSTR;

   function lrotl (value : Win32.UINT; shift : Win32.INT) return Win32.UINT;

   function lrotr (value : Win32.UINT; shift : Win32.INT) return Win32.UINT;

   procedure makepath
     (path  : Win32.PSTR;
      drive : Win32.PCSTR;
      dir   : Win32.PCSTR;
      fname : Win32.PCSTR;
      ext   : Win32.PCSTR);

   function onexit (func : onexit_t) return onexit_t;

   function putenv (envstring : Win32.PCSTR) return Win32.INT;

   function rotl (value : Win32.UINT; shift : Win32.INT) return Win32.UINT;

   function rotr (value : Win32.UINT; shift : Win32.INT) return Win32.UINT;

   procedure searchenv
     (filename : Win32.PCSTR;
      varname  : Win32.PCSTR;
      pathname : Win32.PSTR);

   procedure splitpath
     (path  : Win32.PCSTR;
      drive : Win32.PSTR;
      dir   : Win32.PSTR;
      fname : Win32.PSTR;
      ext   : Win32.PSTR);

   procedure swab (src : Win32.PSTR; dest : Win32.PSTR; n : Win32.INT);

   procedure seterrormode (fnErrorMode : Win32.INT);

   procedure beep (dwFrequency : Win32.UINT; dwDuration : Win32.UINT);

   procedure sleep (cMilliSeconds : Win32.UINT);

   generic
      type T is private;
      with function ">" (A, B : T) return Boolean;
   function Maximum (A, B : T) return T;

   function Max (A, B : Win32.INT) return Win32.INT;

   generic
      type T is private;
      with function "<" (A, B : T) return Boolean;
   function Minimum (A, B : T) return T;

   function Min (A, B : Win32.INT) return Win32.INT;

   procedure exit_program (Status : Win32.INT);

   procedure exit_program_now (Status : Win32.INT);

private

   pragma Convention (C_Pass_By_Copy, div_t);
   pragma Convention (C_Pass_By_Copy, ldiv_t);

   pragma Inline (errno);
   pragma Inline (doserrno);

   pragma Import (C, atexit, "atexit");
   pragma Import (C, atoi, "atoi");
   pragma Import (C, atol, "atol");
   pragma Import (C, getenv, "getenv");
   pragma Import (C, itoa, "_itoa");
   pragma Import (C, ltoa, "_ltoa");
   pragma Import (C, mblen, "mblen");
   pragma Import (C, mbstrlen, "_mbstrlen");
   pragma Import (C, mbtowc, "mbtowc");
   pragma Import (C, mbstowcs, "mbstowcs");
   pragma Import (C, rand, "rand");
   pragma Import (C, srand, "srand");
   pragma Import (C, strtod, "strtod");
   pragma Import (C, strtol, "strtol");
   pragma Import (C, strtoul, "strtoul");
   pragma Import (C, ultoa, "_ultoa");
   pragma Import (C, wctomb, "wctomb");
   pragma Import (C, wcstombs, "wcstombs");
   pragma Import (C, ecvt, "_ecvt");
   pragma Import (C, fcvt, "_fcvt");
   pragma Import (C, fullpath, "_fullpath");
   pragma Import (C, gcvt, "_gcvt");
   pragma Import (C, lrotl, "_lrotl");
   pragma Import (C, lrotr, "_lrotr");
   pragma Import (C, makepath, "_makepath");
   pragma Import (C, onexit, "_onexit");
   pragma Import (C, putenv, "_putenv");
   pragma Import (C, rotl, "_rotl");
   pragma Import (C, rotr, "_rotr");
   pragma Import (C, searchenv, "_searchenv");
   pragma Import (C, splitpath, "_splitpath");
   pragma Import (C, swab, "_swab");
   pragma Import (C, seterrormode, "_seterrormode");
   pragma Import (C, beep, "_beep");
   pragma Import (C, sleep, "_sleep");
   pragma Import (C, exit_program, "exit");
   pragma Import (C, exit_program_now, "_exit");

end Win32.crt.Stdlib;
