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

with Win32;
with Win32.crt.Stdlib;

package Win32.crt.Errno is

   EPERM        : constant := 1;
   ENOENT       : constant := 2;
   ESRCH        : constant := 3;
   EINTR        : constant := 4;
   EIO          : constant := 5;
   ENXIO        : constant := 6;
   E2BIG        : constant := 7;
   ENOEXEC      : constant := 8;
   EBADF        : constant := 9;
   ECHILD       : constant := 10;
   EAGAIN       : constant := 11;
   ENOMEM       : constant := 12;
   EACCES       : constant := 13;
   EFAULT       : constant := 14;
   EBUSY        : constant := 16;
   EEXIST       : constant := 17;
   EXDEV        : constant := 18;
   ENODEV       : constant := 19;
   ENOTDIR      : constant := 20;
   EISDIR       : constant := 21;
   EINVAL       : constant := 22;
   ENFILE       : constant := 23;
   EMFILE       : constant := 24;
   ENOTTY       : constant := 25;
   EFBIG        : constant := 27;
   ENOSPC       : constant := 28;
   ESPIPE       : constant := 29;
   EROFS        : constant := 30;
   EMLINK       : constant := 31;
   EPIPE        : constant := 32;
   EDOM         : constant := 33;
   ERANGE       : constant := 34;
   EDEADLK      : constant := 36;
   ENAMETOOLONG : constant := 38;
   ENOLCK       : constant := 39;
   ENOSYS       : constant := 40;
   ENOTEMPTY    : constant := 41;
   EILSEQ       : constant := 42;
   EDEADLOCK    : constant := 36;

   function errno return Win32.INT renames Win32.crt.Stdlib.errno;

end Win32.crt.Errno;
