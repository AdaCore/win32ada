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

with Win32.crt.Types;

package Win32.crt.Stat is

   S_IFMT   : constant := 8#170000#;
   S_IFDIR  : constant := 8#40000#;
   S_IFCHR  : constant := 8#20000#;
   S_IFIFO  : constant := 8#10000#;
   S_IFREG  : constant := 8#100000#;
   S_IREAD  : constant := 8#400#;
   S_IWRITE : constant := 8#200#;
   S_IEXEC  : constant := 8#100#;

   type struct_stat is record
      st_dev   : Win32.crt.Types.dev_t;
      st_ino   : Win32.crt.Types.ino_t;
      st_mode  : Win32.USHORT;
      st_nlink : Win32.SHORT;
      st_uid   : Win32.SHORT;
      st_gid   : Win32.SHORT;
      st_rdev  : Win32.crt.Types.dev_t;
      st_size  : Win32.crt.Types.off_t;
      st_atime : Win32.crt.Types.time_t;
      st_mtime : Win32.crt.Types.time_t;
      st_ctime : Win32.crt.Types.time_t;
   end record;

   function fstat
     (handle : Win32.INT;
      buffer : access struct_stat)
      return Win32.INT;

   function stat
     (path   : Win32.PCSTR;
      buffer : access struct_stat)
      return Win32.INT;

private

   pragma Convention (C, struct_stat);

   pragma Import (C, fstat, "_fstat");
   pragma Import (C, stat, "_stat");

end Win32.crt.Stat;
