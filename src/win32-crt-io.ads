--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-io.ads, v $
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
with Win32.crt.Stat;
with Win32.crt.Types;

package Win32.crt.Io is

   A_NORMAL : constant := 16#0#;                           --  io.h :73
   A_RDONLY : constant := 16#1#;                           --  io.h :74
   A_HIDDEN : constant := 16#2#;                           --  io.h :75
   A_SYSTEM : constant := 16#4#;                           --  io.h :76
   A_SUBDIR : constant := 16#10#;                          --  io.h :77
   A_ARCH : constant := 16#20#;                          --  io.h :78

   type fsize_t is new Win32.ULONG;                        --  io.h :52

   type finddata_t;                                        --  io.h :58

   type Char260 is                                         --  io.h :64
     array (Integer range 0 .. 259)
     of Win32.CHAR;

   type PipeEnds is array (0 .. 1) of Win32.INT;             --  io.h :100

   type finddata_t is                                      --  io.h :58
      record
         attrib : Win32.UINT;                        --  io.h :59
         time_create : Win32.crt.Types.time_t;            --  io.h :60
         time_access : Win32.crt.Types.time_t;            --  io.h :61
         time_write : Win32.crt.Types.time_t;            --  io.h :62
         size : fsize_t;                           --  io.h :63
         name : Char260;                           --  io.h :64
      end record;

   function c_access (path : Win32.PCSTR;
                      mode : Win32.INT)
                     return Win32.INT;                 --  io.h :82

   function chmod (filename : Win32.PCSTR;
                   pmode : Win32.INT)
                  return Win32.INT;                    --  io.h :83

   function chsize (handle : Win32.INT;
                    size : Win32.LONG)
                   return Win32.INT;                   --  io.h :84

   function close (handle : Win32.INT) return Win32.INT;
   --  io.h :85

   function commit (handle : Win32.INT) return Win32.INT;    --  io.h :86

   function creat (filename : Win32.PCSTR;
                   pmode : Win32.INT)
                  return Win32.INT;                    --  io.h :87

   function dup (handle : Win32.INT) return Win32.INT;       --  io.h :88

   function dup2 (handle1 : Win32.INT;
                  handle2 : Win32.INT)
                 return Win32.INT;                     --  io.h :89

   function eof (handle : Win32.INT) return Win32.INT;       --  io.h :90

   function filelength (handle : Win32.INT) return Win32.LONG;
   --  io.h :91

   function findfirst (filespec : Win32.PSTR;
                       fileinfo : access finddata_t)
                      return Win32.LONG;               --  io.h :92

   function findnext (handle : Win32.LONG;
                      fileinfo : access finddata_t)
                     return Win32.INT;                 --  io.h :93

   function findclose (handle : Win32.LONG) return Win32.INT; --  io.h :94

   function isatty (handle : Win32.INT) return Win32.INT;    --  io.h :95

   function locking (handle : Win32.INT;
                     mode : Win32.INT;
                     nbytes : Win32.LONG)
                    return Win32.INT;                  --  io.h :96

   function lseek (handle : Win32.INT;
                   offset : Win32.LONG;
                   origin : Win32.INT)
                  return Win32.LONG;                   --  io.h :97

   function mktemp (template : Win32.PSTR) return Win32.PSTR; --  io.h :98

   function open (filename : Win32.PCSTR;
                  oflag : Win32.UINT;
                  pmode : Win32.UINT := Win32.crt.Stat.S_IREAD)
                 return Win32.INT;                     --  io.h :99

   function pipe (phandles : access PipeEnds;
                  psize : Win32.UINT;
                  textmode : Win32.INT)
                 return Win32.INT;                     --  io.h :100

   function read (handle : Win32.INT;
                  buffer : Win32.PVOID;
                  count : Win32.UINT)
                 return Win32.INT;                     --  io.h :101

   function remove (path : Win32.PCSTR)
                   return Win32.INT;                             --  io.h :102

   function rename (oldname : Win32.PCSTR;
                    newname : Win32.PCSTR)
                   return Win32.INT;                   --  io.h :103

   function setmode (handle : Win32.INT;
                     mode : Win32.INT)
                    return Win32.INT;                  --  io.h :104

   function sopen (filename : Win32.PCSTR;
                   oflag : Win32.INT;
                   shflag : Win32.INT;
                   pmode : Win32.INT := Win32.crt.Stat.S_IREAD)
                  return Win32.INT;                    --  io.h :105

   function tell (handle : Win32.INT) return Win32.LONG;     --  io.h :106

   function umask (pmode : Win32.INT) return Win32.INT;      --  io.h :107

   function unlink (filename : Win32.PCSTR)
                   return Win32.INT;                              --  io.h :108

   function write (handle : Win32.INT;
                   buffer : Win32.PCVOID;
                   count : Win32.UINT)
                  return Win32.INT;                    --  io.h :109

   function get_osfhandle (filehandle : Win32.INT) return Win32.LONG;
   --  io.h :112

   function open_osfhandle (osfhandle : Win32.LONG;
                            flags : Win32.INT)
                           return Win32.INT;           --  io.h :113

private

   pragma Convention (C, finddata_t);                       --  io.h :58

   pragma Import (C, c_access, "_access");                  --  io.h :82
   pragma Import (C, chmod, "_chmod");                      --  io.h :83
   pragma Import (C, chsize, "_chsize");                    --  io.h :84
   pragma Import (C, close, "_close");                      --  io.h :85
   pragma Import (C, commit, "_commit");                    --  io.h :86
   pragma Import (C, creat, "_creat");                      --  io.h :87
   pragma Import (C, dup, "_dup");                          --  io.h :88
   pragma Import (C, dup2, "_dup2");                        --  io.h :89
   pragma Import (C, eof, "_eof");                          --  io.h :90
   pragma Import (C, filelength, "_filelength");            --  io.h :91
   pragma Import (C, findfirst, "_findfirst");              --  io.h :92
   pragma Import (C, findnext, "_findnext");                --  io.h :93
   pragma Import (C, findclose, "_findclose");              --  io.h :94
   pragma Import (C, isatty, "_isatty");                    --  io.h :95
   pragma Import (C, locking, "_locking");                  --  io.h :96
   pragma Import (C, lseek, "_lseek");                      --  io.h :97
   pragma Import (C, mktemp, "_mktemp");                    --  io.h :98
   pragma Import (C, open, "_open");                        --  io.h :99
   pragma Import (C, pipe, "_pipe");                        --  io.h :100
   pragma Import (C, read, "_read");                        --  io.h :101
   pragma Import (C, remove, "remove");                     --  io.h :102
   pragma Import (C, rename, "rename");                     --  io.h :103
   pragma Import (C, setmode, "_setmode");                  --  io.h :104
   pragma Import (C, sopen, "_sopen");                      --  io.h :105
   pragma Import (C, tell, "_tell");                        --  io.h :106
   pragma Import (C, umask, "_umask");                      --  io.h :107
   pragma Import (C, unlink, "_unlink");                    --  io.h :108
   pragma Import (C, write, "_write");                      --  io.h :109
   pragma Import (C, get_osfhandle, "_get_osfhandle");      --  io.h :112
   pragma Import (C, open_osfhandle, "_open_osfhandle");    --  io.h :113

end Win32.crt.Io;


