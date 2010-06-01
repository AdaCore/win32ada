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
with Win32.crt.Stat;
with Win32.crt.Types;

package Win32.crt.Io is

   A_NORMAL : constant := 16#0#;
   A_RDONLY : constant := 16#1#;
   A_HIDDEN : constant := 16#2#;
   A_SYSTEM : constant := 16#4#;
   A_SUBDIR : constant := 16#10#;
   A_ARCH   : constant := 16#20#;

   type fsize_t is new Win32.ULONG;

   type finddata_t;

   type Char260 is array (Integer range 0 .. 259) of Win32.CHAR;

   type PipeEnds is array (0 .. 1) of Win32.INT;

   type finddata_t is record
      attrib      : Win32.UINT;
      time_create : Win32.crt.Types.time_t;
      time_access : Win32.crt.Types.time_t;
      time_write  : Win32.crt.Types.time_t;
      size        : fsize_t;
      name        : Char260;
   end record;

   function c_access
     (path : Win32.PCSTR;
      mode : Win32.INT)
      return Win32.INT;

   function chmod
     (filename : Win32.PCSTR;
      pmode    : Win32.INT)
      return Win32.INT;

   function chsize (handle : Win32.INT; size : Win32.LONG) return Win32.INT;

   function close (handle : Win32.INT) return Win32.INT;

   function commit (handle : Win32.INT) return Win32.INT;

   function creat
     (filename : Win32.PCSTR;
      pmode    : Win32.INT)
      return Win32.INT;

   function dup (handle : Win32.INT) return Win32.INT;

   function dup2
     (handle1 : Win32.INT;
      handle2 : Win32.INT)
      return Win32.INT;

   function eof (handle : Win32.INT) return Win32.INT;

   function filelength (handle : Win32.INT) return Win32.LONG;

   function findfirst
     (filespec : Win32.PSTR;
      fileinfo : access finddata_t)
      return Win32.LONG;

   function findnext
     (handle   : Win32.LONG;
      fileinfo : access finddata_t)
      return Win32.INT;

   function findclose (handle : Win32.LONG) return Win32.INT;

   function isatty (handle : Win32.INT) return Win32.INT;

   function locking
     (handle : Win32.INT;
      mode   : Win32.INT;
      nbytes : Win32.LONG)
      return Win32.INT;

   function lseek
     (handle : Win32.INT;
      offset : Win32.LONG;
      origin : Win32.INT)
      return Win32.LONG;

   function mktemp (template : Win32.PSTR) return Win32.PSTR;

   function open
     (filename : Win32.PCSTR;
      oflag    : Win32.UINT;
      pmode    : Win32.UINT := Win32.crt.Stat.S_IREAD)
      return Win32.INT;

   function pipe
     (phandles : access PipeEnds;
      psize    : Win32.UINT;
      textmode : Win32.INT)
      return Win32.INT;

   function read
     (handle : Win32.INT;
      buffer : Win32.PVOID;
      count  : Win32.UINT)
      return Win32.INT;

   function remove (path : Win32.PCSTR) return Win32.INT;

   function rename
     (oldname : Win32.PCSTR;
      newname : Win32.PCSTR)
      return Win32.INT;

   function setmode (handle : Win32.INT; mode : Win32.INT) return Win32.INT;

   function sopen
     (filename : Win32.PCSTR;
      oflag    : Win32.INT;
      shflag   : Win32.INT;
      pmode    : Win32.INT := Win32.crt.Stat.S_IREAD)
      return Win32.INT;

   function tell (handle : Win32.INT) return Win32.LONG;

   function umask (pmode : Win32.INT) return Win32.INT;

   function unlink (filename : Win32.PCSTR) return Win32.INT;

   function write
     (handle : Win32.INT;
      buffer : Win32.PCVOID;
      count  : Win32.UINT)
      return Win32.INT;

   function get_osfhandle (filehandle : Win32.INT) return Win32.LONG;

   function open_osfhandle
     (osfhandle : Win32.LONG;
      flags     : Win32.INT)
      return Win32.INT;

private

   pragma Convention (C, finddata_t);

   pragma Import (C, c_access, "_access");
   pragma Import (C, chmod, "_chmod");
   pragma Import (C, chsize, "_chsize");
   pragma Import (C, close, "_close");
   pragma Import (C, commit, "_commit");
   pragma Import (C, creat, "_creat");
   pragma Import (C, dup, "_dup");
   pragma Import (C, dup2, "_dup2");
   pragma Import (C, eof, "_eof");
   pragma Import (C, filelength, "_filelength");
   pragma Import (C, findfirst, "_findfirst");
   pragma Import (C, findnext, "_findnext");
   pragma Import (C, findclose, "_findclose");
   pragma Import (C, isatty, "_isatty");
   pragma Import (C, locking, "_locking");
   pragma Import (C, lseek, "_lseek");
   pragma Import (C, mktemp, "_mktemp");
   pragma Import (C, open, "_open");
   pragma Import (C, pipe, "_pipe");
   pragma Import (C, read, "_read");
   pragma Import (C, remove, "remove");
   pragma Import (C, rename, "rename");
   pragma Import (C, setmode, "_setmode");
   pragma Import (C, sopen, "_sopen");
   pragma Import (C, tell, "_tell");
   pragma Import (C, umask, "_umask");
   pragma Import (C, unlink, "_unlink");
   pragma Import (C, write, "_write");
   pragma Import (C, get_osfhandle, "_get_osfhandle");
   pragma Import (C, open_osfhandle, "_open_osfhandle");

end Win32.crt.Io;
