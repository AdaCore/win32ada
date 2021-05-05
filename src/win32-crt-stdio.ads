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
--  Copyright (C) 2000-2012, AdaCore
--
-------------------------------------------------------------------------------

with Stdarg;
with Win32;

package Win32.crt.Stdio is

   BUFSIZ  : constant := 512;
   NSTREAM : constant := 40;
   NFILE   : constant := NSTREAM;
   EOF     : constant := -1;

   subtype size_t is Win32.Size_T;
   subtype wchar_t is Win32.Wchar_T;
   subtype wint_t is wchar_t;
   subtype wctype_t is wchar_t;

   type FILE is record
      ptr      : Win32.PSTR;
      cnt      : Win32.INT;
      base     : Win32.PSTR;
      flag     : Win32.INT;
      file     : Win32.INT;
      charbuf  : Win32.INT;
      bufsiz   : Win32.INT;
      tmpfname : Win32.PSTR;
   end record;

   pragma Convention (C, FILE);

   type FILE_Access is access all FILE;

   P_tmpdir : constant CHAR_Array := "\" & Nul;

   L_tmpnam : constant := 14;

   SEEK_CUR     : constant := 1;
   SEEK_END     : constant := 2;
   SEEK_SET     : constant := 0;
   FILENAME_MAX : constant := 260;
   FOPEN_MAX    : constant := 20;
   SYS_OPEN     : constant := 20;
   TMP_MAX      : constant := 32767;

   subtype fpos_t is Win32.LONG;

   IOREAD  : constant := 16#0001#;
   IOWRT   : constant := 16#0002#;
   IOFBF   : constant := 16#0000#;
   IOLBF   : constant := 16#0040#;
   IONBF   : constant := 16#0004#;
   IOMYBUF : constant := 16#0008#;
   IOEOF   : constant := 16#0010#;
   IOERR   : constant := 16#0020#;
   IOSTRG  : constant := 16#0040#;
   IORW    : constant := 16#0080#;

   function filbuf (stream : FILE_Access) return Win32.INT;

   function flsbuf
     (c      : in Win32.INT;
      stream : FILE_Access)
      return Win32.INT;

   function fsopen
     (filename : Win32.PCSTR;
      mode     : Win32.PCSTR;
      shflag   : in Win32.INT)
      return FILE_Access;

   type FILE_array is array (0 .. NSTREAM - 1) of aliased FILE;

   type Access_File_Array is access FILE_array;

#if TARGET = "Win32" then
   function IOB_Addr return Access_File_Array;
   pragma Import (C, IOB_Addr, "__p__iob");
#else
   IOB_Addr : constant Access_File_Array;
   pragma Import (C, IOB_Addr, "__imp__iob");
#end if;

   iob : FILE_array renames IOB_Addr.all;

   stdin  : constant FILE_Access := iob (0)'Access;
   stdout : constant FILE_Access := iob (1)'Access;
   stderr : constant FILE_Access := iob (2)'Access;

   procedure clearerr (stream : FILE_Access);

   function fclose (stream : in FILE_Access) return Win32.INT;

   function fcloseall return Win32.INT;

   function fdopen
     (handle : in Win32.INT;
      mode   : Win32.PCSTR)
      return FILE_Access;

   function fflush (stream : in FILE_Access) return Win32.INT;

   function fgetc (stream : in FILE_Access) return Win32.INT;

   function fgetchar return Win32.INT;

   function fgetpos
     (stream : in FILE_Access;
      pos    : access fpos_t)
      return Win32.INT;

   function fgets
     (string1 : in Win32.PSTR;
      n       : in Win32.INT;
      stream  : in FILE_Access)
      return Win32.PSTR;

   function feof (Stream : FILE_Access) return Boolean;

   function ferror (Stream : FILE_Access) return Boolean;

   function fileno (Stream : FILE_Access) return Win32.INT;

   function flushall return Win32.INT;

   function fopen
     (filename : Win32.PCSTR;
      mode     : Win32.PCSTR)
      return FILE_Access;

   function fputc
     (c      : in Win32.INT;
      stream : in FILE_Access)
      return Win32.INT;

   function fputchar (c : in Win32.INT) return Win32.INT;

   function fputs
     (string : Win32.PCSTR;
      stream : in FILE_Access)
      return Win32.INT;

   function fread
     (buffer : in Win32.PVOID;
      size   : in size_t;
      count  : in size_t;
      stream : in FILE_Access)
      return size_t;

   function freopen
     (path   : Win32.PCSTR;
      mode   : Win32.PCSTR;
      stream : in FILE_Access)
      return FILE_Access;

   function fsetpos
     (stream : in FILE_Access;
      pos    : access Win32.LONG)
      return Win32.INT;

   function fseek
     (stream : in FILE_Access;
      offset : in Win32.LONG;
      origin : in Win32.INT)
      return Win32.INT;

   function ftell (stream : in FILE_Access) return Win32.LONG;

   function fwrite
     (buffer : in Win32.PCVOID;
      size   : in size_t;
      count  : in size_t;
      stream : in FILE_Access)
      return size_t;

   function getc (stream : in FILE_Access) return Win32.INT;

   function getchar return Win32.INT;

   function gets (buffer : in Win32.PSTR) return Win32.PSTR;

   function getw (stream : in FILE_Access) return Win32.INT;

   procedure perror (string1 : Win32.PCSTR);

   function pclose (stream : in FILE_Access) return Win32.INT;

   function popen
     (command : Win32.PCSTR;
      mode    : Win32.PCSTR)
      return FILE_Access;

   function putc
     (c      : in Win32.INT;
      stream : in FILE_Access)
      return Win32.INT;

   function putchar (c : in Win32.INT) return Win32.INT;

   function puts (string1 : Win32.PCSTR) return Win32.INT;

   function putw
     (binint : in Win32.INT;
      stream : in FILE_Access)
      return Win32.INT;

   function remove (path : Win32.PCSTR) return Win32.INT;

   function rename
     (oldname : Win32.PCSTR;
      newname : Win32.PCSTR)
      return Win32.INT;

   procedure rewind (stream : FILE_Access);

   function rmtmp return Win32.INT;

   procedure setbuf (stream : FILE_Access; buffer : Win32.PSTR);

   function setvbuf
     (stream : in FILE_Access;
      buffer : in Win32.PSTR;
      mode   : in Win32.INT;
      size   : in size_t)
      return Win32.INT;

   function tempnam
     (dir    : in Win32.PSTR;
      prefix : in Win32.PSTR)
      return Win32.PSTR;

   function tmpfile return FILE_Access;

   function tmpnam (string1 : in Win32.PSTR) return Win32.PSTR;

   function ungetc
     (c      : in Win32.INT;
      stream : in FILE_Access)
      return Win32.INT;

   function unlink (filename : Win32.PCSTR) return Win32.INT;

   function fprintf
     (stream : FILE_Access;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function fscanf
     (stream : FILE_Access;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function printf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function scanf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function snprintf
     (buffer : Win32.PSTR;
      count  : size_t;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function sprintf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function sscanf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function vfprintf
     (stream : FILE_Access;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function vprintf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function vsnprintf
     (buffer : Win32.PSTR;
      count  : size_t;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function vsprintf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

private

   pragma Inline (feof);
   pragma Inline (ferror);
   pragma Inline (fileno);

   pragma Import (C, filbuf, "_filbuf");
   pragma Import (C, flsbuf, "_flsbuf");
   pragma Import (C, fsopen, "_fsopen");
   pragma Import (C, clearerr, "clearerr");
   pragma Import (C, fclose, "fclose");
   pragma Import (C, fcloseall, "_fcloseall");
   pragma Import (C, fdopen, "_fdopen");
   pragma Import (C, fflush, "fflush");
   pragma Import (C, fgetc, "fgetc");
   pragma Import (C, fgetchar, "_fgetchar");
   pragma Import (C, fgetpos, "fgetpos");
   pragma Import (C, fgets, "fgets");
   pragma Import (C, flushall, "_flushall");
   pragma Import (C, fopen, "fopen");
   pragma Import (C, fputc, "fputc");
   pragma Import (C, fputchar, "_fputchar");
   pragma Import (C, fputs, "fputs");
   pragma Import (C, fread, "fread");
   pragma Import (C, freopen, "freopen");
   pragma Import (C, fsetpos, "fsetpos");
   pragma Import (C, fseek, "fseek");
   pragma Import (C, ftell, "ftell");
   pragma Import (C, fwrite, "fwrite");
   pragma Import (C, getc, "getc");
   pragma Import (C, getchar, "getchar");
   pragma Import (C, gets, "gets");
   pragma Import (C, getw, "_getw");
   pragma Import (C, perror, "perror");
   pragma Import (C, pclose, "_pclose");
   pragma Import (C, popen, "_popen");
   pragma Import (C, putc, "putc");
   pragma Import (C, putchar, "putchar");
   pragma Import (C, puts, "puts");
   pragma Import (C, putw, "_putw");
   pragma Import (C, remove, "remove");
   pragma Import (C, rename, "rename");
   pragma Import (C, rewind, "rewind");
   pragma Import (C, rmtmp, "_rmtmp");
   pragma Import (C, setbuf, "setbuf");
   pragma Import (C, setvbuf, "setvbuf");
   pragma Import (C, tempnam, "_tempnam");
   pragma Import (C, tmpfile, "tmpfile");
   pragma Import (C, tmpnam, "tmpnam");
   pragma Import (C, ungetc, "ungetc");
   pragma Import (C, unlink, "_unlink");

end Win32.crt.Stdio;
