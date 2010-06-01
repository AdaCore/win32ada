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

package Win32.crt.Stddef is

   function errno return Win32.INT renames Win32.crt.Stdlib.errno;

   subtype ptrdiff_t is Interfaces.C.ptrdiff_t;

   subtype size_t is Win32.Size_T;

   subtype wchar_t is Win32.Wchar_T;

   function threadid return Win32.ULONG;

   function threadhandle return Win32.ULONG;

private

   pragma Import (C, threadid, "__threadid");
   pragma Import (C, threadhandle, "__threadhandle");

end Win32.crt.Stddef;
