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
with Win32.crt.Strings;

package Win32.crt.Memory is

   function memccpy
     (dest  : Win32.PVOID;
      src   : Win32.PCVOID;
      ch    : Win32.INT;
      count : Win32.UINT)
      return Win32.PVOID renames Win32.crt.Strings.memccpy;

   function memchr
     (buf   : Win32.PCVOID;
      ch    : Win32.INT;
      count : Win32.Size_T)
      return Win32.PVOID renames Win32.crt.Strings.memchr;

   function memcmp
     (buf1  : Win32.PCVOID;
      buf2  : Win32.PCVOID;
      count : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.memcmp;

   function memcpy
     (dest  : Win32.PVOID;
      src   : Win32.PCVOID;
      count : Win32.Size_T)
      return Win32.PVOID renames Win32.crt.Strings.memcpy;

   function memicmp
     (buf1  : Win32.PCVOID;
      buf2  : Win32.PCVOID;
      count : Win32.UINT)
      return Win32.INT renames Win32.crt.Strings.memicmp;

   function memset
     (dest  : Win32.PVOID;
      ch    : Win32.INT;
      count : Win32.Size_T)
      return Win32.PVOID renames Win32.crt.Strings.memset;

end Win32.crt.Memory;
