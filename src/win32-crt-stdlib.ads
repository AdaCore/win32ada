--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-stdlib.ads, v $
--  $Revision : 1.2 $ $Date : 2000/04/14 11 :32 :26 $ $Author : dijk $
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

with Win32;

package Win32.crt.Stdlib is

   EXIT_SUCCESS : constant := 0;                 --  stdlib.h :72
   EXIT_FAILURE : constant := 1;                 --  stdlib.h :73
   RAND_MAX : constant := 16#7fff#;          --  stdlib.h :105
   MAX_PATH : constant := 260;               --  stdlib.h :131
   MAX_DRIVE : constant := 3;                 --  stdlib.h :132
   MAX_DIR : constant := 256;               --  stdlib.h :133
   MAX_FNAME : constant := 256;               --  stdlib.h :134
   MAX_EXT : constant := 256;               --  stdlib.h :135
   CRIT_ERROR_PROMPT : constant := 0;                 --  stdlib.h :138
   CRIT_ERROR_FAIL : constant := 1;                 --  stdlib.h :139
   SLEEP_MINIMUM : constant := 0;                 --  stdlib.h :142
   SLEEP_FOREVER : constant := -1;                --  stdlib.h :143
   DOS_MODE : constant := 0;                 --  stdlib.h :243
   OS2_MODE : constant := 1;                 --  stdlib.h :244
   WIN_MODE : constant := 2;                 --  stdlib.h :245
   OS2_20_MODE : constant := 3;                 --  stdlib.h :246
   DOSX32_MODE : constant := 4;                 --  stdlib.h :247
   POSIX_MODE : constant := 5;                 --  stdlib.h :248
   REAL_MODE : constant := 0;                 --  stdlib.h :259
   PROT_MODE : constant := 1;                 --  stdlib.h :260
   FLAT_MODE : constant := 2;                 --  stdlib.h :261

   type onexit_t is access function return Win32.INT;      --  stdlib.h :77
   pragma Convention (Stdcall, onexit_t);

   type div_t is                                           --  stdlib.h :90
      record
         quot : Win32.INT;                               --  stdlib.h :91
         c_rem : Win32.INT;                               --  stdlib.h :92
      end record;

   type ldiv_t is                                          --  stdlib.h :95
      record
         quot : Win32.INT;                               --  stdlib.h :96
         c_rem : Win32.INT;                               --  stdlib.h :97
      end record;

   type atexit_t is access procedure;                      --  stdlib.h :276

   --  use extensible arrays
   type String_Array is array (0 .. Win32.ANYSIZE_ARRAY) of aliased Win32.PSTR;

   --  auxiliary declarations

   type USA is access Win32.USHORT;
   function mb_cur_max_addr return USA;
   pragma Import (C, mb_cur_max_addr, "__p___mb_cur_max");

   type SAP is access String_Array;
   Sys_Errlist_Addr : constant SAP;
   pragma Import (C, Sys_Errlist_Addr, "_sys_errlist");

   type AI is access Win32.INT;
   sys_nerr_addr : constant AI;
   pragma Import (C, sys_nerr_addr, "_sys_nerr");

   function argc_addr return AI;
   pragma Import (C, argc_addr, "__p___argc");

   type SAPP is access SAP;
   function argv_addr return SAPP;
   pragma Import (C, argv_addr, "__p___argv");

   function environ_addr return SAPP;
   pragma Import (C, environ_addr, "__p__environ");

   function fmode_addr return AI;
   pragma Import (C, fmode_addr, "__p__fmode");

   fileinfo_addr : constant AI;
   pragma Import (C, fileinfo_addr, "_fileinfo");

   type SP is access Win32.PSTR;
   function pgmptr_addr return SP;
   pragma Import (C, pgmptr_addr, "__p__pgmptr");

   function osver_addr return AI;
   pragma Import (C, osver_addr, "__p__osver");

   function winver_addr return AI;
   pragma Import (C, winver_addr, "__p__winver");

   function winmajor_addr return AI;
   pragma Import (C, winmajor_addr, "__p__winmajor");

   function winminor_addr return AI;
   pragma Import (C, winminor_addr, "__p__winminor");

   --  end of auxiliary declarations

   MB_CUR_MAX : Win32.USHORT
     renames mb_cur_max_addr.all;           --  max mb-len for current locale

   sys_errlist : String_Array
     renames Sys_Errlist_Addr.all;           --  perror error message table
   pragma Suppress (All_Checks, On => sys_errlist);

   sys_nerr : Win32.INT
     renames sys_nerr_addr.all;           --  # of entries in sys_errlist table

   argc : Win32.INT
     renames argc_addr.all;                  --  count of cmd line args

   argv : SAP
     renames argv_addr.all;                  --  table of cmd line args

   environ : SAP
     renames environ_addr.all;               --  environment table

   fmode : Win32.INT
     renames fmode_addr.all;                 --  default file translation mode

   fileinfo : Win32.INT
     renames fileinfo_addr.all;             --  open file info mode (for spawn)

   pgmptr : Win32.PSTR
     renames pgmptr_addr.all;                --  module (EXE) name

   --  Windows major/minor and O.S. version numbers

   osver : Win32.INT renames osver_addr.all;

   winver : Win32.INT renames winver_addr.all;

   winmajor : Win32.INT renames winmajor_addr.all;

   winminor : Win32.INT renames winminor_addr.all;


   function errno return Win32.INT;            --  XENIX style error number

   function doserrno return Win32.ULONG;       --  OS system error value


   function atexit (proc : atexit_t) return Win32.INT;       --  stdlib.h :276

   function atoi (string1 : Win32.PCSTR) return Win32.INT;
   --  stdlib.h :278

   function atol (string1 : Win32.PCSTR) return Win32.INT;
   --  stdlib.h :279
   function div (numer : Win32.INT;
                 denom : Win32.INT)
                return div_t;                          --  stdlib.h :284

   function getenv (varname : Win32.PCSTR) return Win32.PSTR;
   --  stdlib.h :287

   function itoa (value : Win32.INT;
                  string1 : Win32.PSTR;
                  radix : Win32.INT)
                 return Win32.PSTR;                    --  stdlib.h :288

   function ldiv (numer : Win32.INT;
                  denom : Win32.INT)
                 return ldiv_t;                        --  stdlib.h :290

   function ltoa (value : Win32.INT;
                  string1 : Win32.PSTR;
                  radix : Win32.INT)
                 return Win32.PSTR;                    --  stdlib.h :291

   function mblen (mbstr : Win32.PCSTR;
                   count : Win32.Size_T)
                  return Win32.INT;                    --  stdlib.h :293

   function mbstrlen (s : Win32.PCSTR) return Win32.Size_T;
   --  stdlib.h :294

   function mbtowc (wchar : Win32.PWSTR;
                    mbchar : Win32.PCSTR;
                    count : Win32.Size_T)
                   return Win32.INT;                   --  stdlib.h :295

   function mbstowcs (wcstr : Win32.PWSTR;
                      mbstr : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.Size_T;              --  stdlib.h :296

   function rand return Win32.INT;                         --  stdlib.h :299

   procedure srand (seed : Win32.UINT);                      --  stdlib.h :301

   function strtod (nptr : Win32.PCSTR;
                    endptr : access Win32.PSTR)
                   return Win32.DOUBLE;                --  stdlib.h :302

   function strtol (nptr : Win32.PCSTR;
                    endptr : access Win32.PSTR;
                    base : Win32.INT)
                   return Win32.INT;                   --  stdlib.h :303

   function strtoul (nptr : Win32.PCSTR;
                     endptr : access Win32.PSTR;
                     base : Win32.INT)
                    return Win32.UINT;                 --  stdlib.h :304

   function ultoa (value : Win32.UINT;
                   string1 : Win32.PSTR;
                   radix : Win32.INT)
                  return Win32.PSTR;                   --  stdlib.h :306

   function wctomb (mbchar : Win32.PSTR;
                    wchar : Win32.Wchar_T)
                   return Win32.INT;                   --  stdlib.h :307

   function wcstombs (mbstr : Win32.PSTR;
                      wchar_t : Win32.PCWSTR;
                      count : Win32.Size_T)
                     return Win32.Size_T;              --  stdlib.h :308

   function ecvt (value : Win32.DOUBLE;
                  count : Win32.INT;
                  dec : Win32.PINT;
                  sign : Win32.PINT)
                 return Win32.PSTR;                    --  stdlib.h :325

   function fcvt (value : Win32.DOUBLE;
                  count : Win32.INT;
                  dec : Win32.PINT;
                  sign : Win32.PINT)
                 return Win32.PSTR;                    --  stdlib.h :327

   function fullpath (buffer : Win32.PSTR;
                      pathname : Win32.PCSTR;
                      maxlen : Win32.Size_T)
                     return Win32.PSTR;                --  stdlib.h :328

   function gcvt (value : Win32.DOUBLE;
                  num_digits : Win32.INT;
                  buffer : Win32.PSTR)
                 return Win32.PSTR;                    --  stdlib.h :329

   function lrotl (value : Win32.UINT;
                   shift : Win32.INT)
                  return Win32.UINT;                   --  stdlib.h :330

   function lrotr (value : Win32.UINT;
                   shift : Win32.INT)
                  return Win32.UINT;                   --  stdlib.h :331

   procedure makepath (path : Win32.PSTR;
                       drive : Win32.PCSTR;
                       dir : Win32.PCSTR;
                       fname : Win32.PCSTR;
                       ext : Win32.PCSTR);                 --  stdlib.h :332

   function onexit (func : onexit_t) return onexit_t;        --  stdlib.h :334

   function putenv (envstring : Win32.PCSTR) return Win32.INT;
   --  stdlib.h :336

   function rotl (value : Win32.UINT;
                  shift : Win32.INT)
                 return Win32.UINT;                    --  stdlib.h :337

   function rotr (value : Win32.UINT;
                  shift : Win32.INT)
                 return Win32.UINT;                    --  stdlib.h :338

   procedure searchenv (filename : Win32.PCSTR;
                        varname : Win32.PCSTR;
                        pathname : Win32.PSTR);              --  stdlib.h :339

   procedure splitpath (path : Win32.PCSTR;
                        drive : Win32.PSTR;
                        dir : Win32.PSTR;
                        fname : Win32.PSTR;
                        ext : Win32.PSTR);                 --  stdlib.h :340

   procedure swab (src : Win32.PSTR;
                   dest : Win32.PSTR;
                   n : Win32.INT);                        --  stdlib.h :341

   procedure seterrormode (fnErrorMode : Win32.INT);         --  stdlib.h :342

   procedure beep (dwFrequency : Win32.UINT;
                   dwDuration : Win32.UINT);                --  stdlib.h :343

   procedure sleep (cMilliSeconds : Win32.UINT);             --  stdlib.h :344

   generic
      type T is private;
      with function ">"(A, B : T) return Boolean;
   function Maximum (A, B : T) return T;                     --  stdlib.h :360

   function Max (A, B : Win32.INT) return Win32.INT;

   generic
      type T is private;
      with function "<"(A, B : T) return Boolean;
   function Minimum (A, B : T) return T;                     --  stdlib.h :361

   function Min (A, B : Win32.INT) return Win32.INT;

   procedure exit_program (Status : Win32.INT);             --  stdlib.h :285

   procedure exit_program_now (Status : Win32.INT);         --  stdlib.h :326

private

   pragma Convention (C_Pass_By_Copy, div_t);                  --  stdlib.h :90
   pragma Convention (C_Pass_By_Copy, ldiv_t);                 --  stdlib.h :95

   pragma Inline (errno);
   pragma Inline (doserrno);

   pragma Import (C, atexit, "atexit");                     --  stdlib.h :276
   pragma Import (C, atoi, "atoi");                         --  stdlib.h :278
   pragma Import (C, atol, "atol");                         --  stdlib.h :279
   pragma Import (C, getenv, "getenv");                     --  stdlib.h :287
   pragma Import (C, itoa, "_itoa");                        --  stdlib.h :288
   pragma Import (C, ltoa, "_ltoa");                        --  stdlib.h :291
   pragma Import (C, mblen, "mblen");                       --  stdlib.h :293
   pragma Import (C, mbstrlen, "_mbstrlen");                --  stdlib.h :294
   pragma Import (C, mbtowc, "mbtowc");                     --  stdlib.h :295
   pragma Import (C, mbstowcs, "mbstowcs");                 --  stdlib.h :296
   pragma Import (C, rand, "rand");                         --  stdlib.h :299
   pragma Import (C, srand, "srand");                       --  stdlib.h :301
   pragma Import (C, strtod, "strtod");                     --  stdlib.h :302
   pragma Import (C, strtol, "strtol");                     --  stdlib.h :303
   pragma Import (C, strtoul, "strtoul");                   --  stdlib.h :304
   pragma Import (C, ultoa, "_ultoa");                      --  stdlib.h :306
   pragma Import (C, wctomb, "wctomb");                     --  stdlib.h :307
   pragma Import (C, wcstombs, "wcstombs");                 --  stdlib.h :308
   pragma Import (C, ecvt, "_ecvt");                        --  stdlib.h :325
   pragma Import (C, fcvt, "_fcvt");                        --  stdlib.h :327
   pragma Import (C, fullpath, "_fullpath");                --  stdlib.h :328
   pragma Import (C, gcvt, "_gcvt");                        --  stdlib.h :329
   pragma Import (C, lrotl, "_lrotl");                      --  stdlib.h :330
   pragma Import (C, lrotr, "_lrotr");                      --  stdlib.h :331
   pragma Import (C, makepath, "_makepath");                --  stdlib.h :332
   pragma Import (C, onexit, "_onexit");                    --  stdlib.h :334
   pragma Import (C, putenv, "_putenv");                    --  stdlib.h :336
   pragma Import (C, rotl, "_rotl");                        --  stdlib.h :337
   pragma Import (C, rotr, "_rotr");                        --  stdlib.h :338
   pragma Import (C, searchenv, "_searchenv");              --  stdlib.h :339
   pragma Import (C, splitpath, "_splitpath");              --  stdlib.h :340
   pragma Import (C, swab, "_swab");                        --  stdlib.h :341
   pragma Import (C, seterrormode, "_seterrormode");        --  stdlib.h :342
   pragma Import (C, beep, "_beep");                        --  stdlib.h :343
   pragma Import (C, sleep, "_sleep");                      --  stdlib.h :344
   pragma Import (C, exit_program, "exit");
   pragma Import (C, exit_program_now, "_exit");

end Win32.crt.Stdlib;
