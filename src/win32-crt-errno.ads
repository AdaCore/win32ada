--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-errno.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
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
with Win32.crt.Stdlib;

package Win32.crt.Errno is

   EPERM        : constant := 1;  --  errno.h :57
   ENOENT       : constant := 2;  --  errno.h :58
   ESRCH        : constant := 3;  --  errno.h :59
   EINTR        : constant := 4;  --  errno.h :60
   EIO          : constant := 5;  --  errno.h :61
   ENXIO        : constant := 6;  --  errno.h :62
   E2BIG        : constant := 7;  --  errno.h :63
   ENOEXEC      : constant := 8;  --  errno.h :64
   EBADF        : constant := 9;  --  errno.h :65
   ECHILD       : constant := 10; --  errno.h :66
   EAGAIN       : constant := 11; --  errno.h :67
   ENOMEM       : constant := 12; --  errno.h :68
   EACCES       : constant := 13; --  errno.h :69
   EFAULT       : constant := 14; --  errno.h :70
   EBUSY        : constant := 16; --  errno.h :71
   EEXIST       : constant := 17; --  errno.h :72
   EXDEV        : constant := 18; --  errno.h :73
   ENODEV       : constant := 19; --  errno.h :74
   ENOTDIR      : constant := 20; --  errno.h :75
   EISDIR       : constant := 21; --  errno.h :76
   EINVAL       : constant := 22; --  errno.h :77
   ENFILE       : constant := 23; --  errno.h :78
   EMFILE       : constant := 24; --  errno.h :79
   ENOTTY       : constant := 25; --  errno.h :80
   EFBIG        : constant := 27; --  errno.h :81
   ENOSPC       : constant := 28; --  errno.h :82
   ESPIPE       : constant := 29; --  errno.h :83
   EROFS        : constant := 30; --  errno.h :84
   EMLINK       : constant := 31; --  errno.h :85
   EPIPE        : constant := 32; --  errno.h :86
   EDOM         : constant := 33; --  errno.h :87
   ERANGE       : constant := 34; --  errno.h :88
   EDEADLK      : constant := 36; --  errno.h :89
   ENAMETOOLONG : constant := 38; --  errno.h :90
   ENOLCK       : constant := 39; --  errno.h :91
   ENOSYS       : constant := 40; --  errno.h :92
   ENOTEMPTY    : constant := 41; --  errno.h :93
   EILSEQ       : constant := 42; --  errno.h :94
   EDEADLOCK    : constant := 36; --  errno.h :99

   errno : Win32.INT
     renames Win32.crt.Stdlib.errno;                     --  errno.h :49

end Win32.crt.Errno;


