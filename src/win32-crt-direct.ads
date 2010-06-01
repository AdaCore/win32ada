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

package Win32.crt.Direct is

   type diskfree_t is record
      total_clusters      : Win32.UINT;
      avail_clusters      : Win32.UINT;
      sectors_per_cluster : Win32.UINT;
      bytes_per_sector    : Win32.UINT;
   end record;

   function chdir (dirname : Win32.PCSTR) return Win32.INT;

   function chdrive (drive : Win32.INT) return Win32.INT;

   function getcwd
     (buffer : Win32.PSTR;
      maxlen : Win32.INT)
      return Win32.PSTR;

   function getdcwd
     (drive  : Win32.INT;
      buffer : Win32.PSTR;
      maxlen : Win32.INT)
      return Win32.PSTR;

   function getdrive return Win32.INT;

   function mkdir (dirname : Win32.PCSTR) return Win32.INT;

   function rmdir (dirname : Win32.PCSTR) return Win32.INT;

   function getdiskfree
     (p1   : Win32.UINT;
      p2   : access diskfree_t)
      return Win32.UINT;

   function getdrives return Win32.UINT;

private

   pragma Convention (C_Pass_By_Copy, diskfree_t);

   pragma Import (C, chdir, "_chdir");
   pragma Import (C, chdrive, "_chdrive");
   pragma Import (C, getcwd, "_getcwd");
   pragma Import (C, getdcwd, "_getdcwd");
   pragma Import (C, getdrive, "_getdrive");
   pragma Import (C, mkdir, "_mkdir");
   pragma Import (C, rmdir, "_rmdir");
   pragma Import (C, getdiskfree, "_getdiskfree");
   pragma Import (C, getdrives, "_getdrives");

end Win32.crt.Direct;
