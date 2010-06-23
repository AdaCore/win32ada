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

with Win32.crt.Ctype;
with Win32.crt.Stdio;
with Win32.crt.Stdlib;
with Win32.crt.Strings;
with Stdarg;

package Win32.crt.Tchar is

   TEOF     : constant := -1;
   istlegal : constant := 1;

   type TCHAR is new Win32.CHAR;
   type TINT is new Win32.INT;

   function ftcscat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strcat;

   function ftcschr
     (string1 : Win32.PCSTR;
      c       : Win32.INT)
      return Win32.PSTR renames Win32.crt.Strings.strchr;

   function ftcscmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT renames Win32.crt.Strings.strcmp;

   function ftcscpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strcpy;

   function ftcscspn
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.Size_T renames Win32.crt.Strings.strcspn;

   function ftcslen (string1 : Win32.PCSTR) return Win32.Size_T renames
     Win32.crt.Strings.strlen;

   function ftcsncat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncat;

   function ftcsncmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strncmp;

   function ftcsncpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncpy;

   function ftcspbrk
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strpbrk;

   function ftcsrchr
     (string1 : Win32.PCSTR;
      c       : Win32.INT)
      return Win32.PSTR renames Win32.crt.Strings.strrchr;

   function ftcsspn
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.Size_T renames Win32.crt.Strings.strspn;

   function ftcsstr
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strstr;

   function ftcstok
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strtok;

   function ftcsdup (string1 : Win32.PCSTR) return Win32.PSTR renames
     Win32.crt.Strings.strdup;

   function ftcsicmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT renames Win32.crt.Strings.stricmp;

   function ftcsnicmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strnicmp;

   function ftcsnset
     (string1 : Win32.PSTR;
      c       : Win32.INT;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strnset;

   function ftcsrev (string1 : Win32.PSTR) return Win32.PSTR renames
     Win32.crt.Strings.strrev;

   function ftcsset (string1 : Win32.PSTR; c : Win32.INT) return Win32.PSTR
      renames Win32.crt.Strings.strset;

   function ftcsclen (string1 : Win32.PCSTR) return Win32.Size_T renames
     Win32.crt.Strings.strlen;

   function ftcsnccat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncat;

   function ftcsnccpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncpy;

   function ftcsnccmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strncmp;

   function ftcsncicmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strnicmp;

   function ftcsncset
     (string1 : Win32.PSTR;
      c       : Win32.INT;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strnset;

   function tprintf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.printf;

   function ftprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.fprintf;

   function stprintf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.sprintf;

   function sntprintf
     (buffer : Win32.PSTR;
      count  : Win32.Size_T;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.snprintf;

   function vtprintf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.vprintf;

   function vftprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.vfprintf;

   function vstprintf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.vsprintf;

   function vsntprintf
     (buffer : Win32.PSTR;
      count  : Win32.Size_T;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.vsnprintf;

   function tscanf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.scanf;

   function ftscanf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.fscanf;

   function stscanf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames Win32.crt.Stdio.sscanf;

   function fgettc (f : Win32.crt.Stdio.FILE_Access) return Win32.INT
      renames Win32.crt.Stdio.fgetc;

   function fgettchar return Win32.INT renames Win32.crt.Stdio.fgetchar;

   function fgetts
     (s    : Win32.PSTR;
      i    : Win32.INT;
      f    : Win32.crt.Stdio.FILE_Access)
      return Win32.PSTR renames Win32.crt.Stdio.fgets;

   function fputtc
     (i    : Win32.INT;
      f    : Win32.crt.Stdio.FILE_Access)
      return Win32.INT renames Win32.crt.Stdio.fputc;

   function fputtchar (i : in Win32.INT) return Win32.INT renames
     Win32.crt.Stdio.fputchar;

   function fputts
     (s    : Win32.PCSTR;
      f    : Win32.crt.Stdio.FILE_Access)
      return Win32.INT renames Win32.crt.Stdio.fputs;

   function gettc (f : in Win32.crt.Stdio.FILE_Access) return Win32.INT renames
     Win32.crt.Stdio.getc;

   function gettchar return Win32.INT renames Win32.crt.Stdio.getchar;

   function puttc
     (i    : Win32.INT;
      f    : Win32.crt.Stdio.FILE_Access)
      return Win32.INT renames Win32.crt.Stdio.putc;

   function puttchar (i : in Win32.INT) return Win32.INT renames
     Win32.crt.Stdio.putchar;

   function ungettc
     (i    : Win32.INT;
      f    : Win32.crt.Stdio.FILE_Access)
      return Win32.INT renames Win32.crt.Stdio.ungetc;

   function tcstod
     (nptr   : Win32.PCSTR;
      endptr : access Win32.PSTR)
      return Win32.DOUBLE renames Win32.crt.Stdlib.strtod;

   function tcstol
     (nptr   : Win32.PCSTR;
      endptr : access Win32.PSTR;
      base   : Win32.INT)
      return Win32.INT renames Win32.crt.Stdlib.strtol;

   function tcstoul
     (nptr   : Win32.PCSTR;
      endptr : access Win32.PSTR;
      base   : Win32.INT)
      return Win32.UINT renames Win32.crt.Stdlib.strtoul;

   function tcscat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strcat;

   function tcschr (string1 : Win32.PCSTR; c : Win32.INT) return Win32.PSTR
      renames Win32.crt.Strings.strchr;

   function tcscmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT renames Win32.crt.Strings.strcmp;

   function tcscpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strcpy;

   function tcscspn
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.Size_T renames Win32.crt.Strings.strcspn;

   function tcslen (string1 : Win32.PCSTR) return Win32.Size_T renames
     Win32.crt.Strings.strlen;

   function tcsncat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncat;

   function tcsncmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strncmp;

   function tcsncpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncpy;

   function tcspbrk
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strpbrk;

   function tcsrchr
     (string1 : Win32.PCSTR;
      c       : Win32.INT)
      return Win32.PSTR renames Win32.crt.Strings.strrchr;

   function tcsspn
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.Size_T renames Win32.crt.Strings.strspn;

   function tcsstr
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strstr;

   function tcstok
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR renames Win32.crt.Strings.strtok;

   function tcsdup (string1 : Win32.PCSTR) return Win32.PSTR renames
     Win32.crt.Strings.strdup;

   function tcsicmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT renames Win32.crt.Strings.stricmp;

   function tcsnicmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strnicmp;

   function tcsnset
     (string1 : Win32.PSTR;
      c       : Win32.INT;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strnset;

   function tcsrev (string1 : Win32.PSTR) return Win32.PSTR renames
     Win32.crt.Strings.strrev;

   function tcsset (string1 : Win32.PSTR; c : Win32.INT) return Win32.PSTR
      renames Win32.crt.Strings.strset;

   function tcsclen (string1 : Win32.PCSTR) return Win32.Size_T renames
     Win32.crt.Strings.strlen;

   function tcsnccat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncat;

   function tcsnccpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strncpy;

   function tcsnccmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strncmp;

   function tcsncicmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.INT renames Win32.crt.Strings.strnicmp;

   function tcsncset
     (string1 : Win32.PSTR;
      c       : Win32.INT;
      count   : Win32.Size_T)
      return Win32.PSTR renames Win32.crt.Strings.strnset;

   function tcslwr (string1 : Win32.PSTR) return Win32.PSTR renames
     Win32.crt.Strings.strlwr;

   function tcsupr (string1 : Win32.PSTR) return Win32.PSTR renames
     Win32.crt.Strings.strupr;

   function tcsxfrm
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : Win32.Size_T)
      return Win32.Size_T renames Win32.crt.Strings.strxfrm;

   function tcscoll
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT renames Win32.crt.Strings.strcoll;

   function tcsicoll
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT renames Win32.crt.Strings.stricoll;

   function tclen (cpc : Win32.PCCH) return Win32.Size_T;

   procedure tccpy (pc1 : Win32.PCHAR; cpc2 : Win32.PCCH);

   function tccmp (cpc1 : Win32.PCCH; cpc2 : Win32.PCCH) return Win32.INT;

   function istalpha (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isalpha;

   function istupper (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isupper;

   function istlower (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.islower;

   function istdigit (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isdigit;

   function istxdigit (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isxdigit;

   function istspace (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isspace;

   function istpunct (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.ispunct;

   function istalnum (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isalnum;

   function istprint (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isprint;

   function istgraph (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isgraph;

   function istcntrl (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.iscntrl;

   function istascii (c : Win32.crt.Ctype.char) return Win32.INT renames
     Win32.crt.Ctype.isascii;

   function totupper (c : Win32.crt.Ctype.char) return Win32.crt.Ctype.char
      renames Win32.crt.Ctype.toupper;

   function totlower (c : Win32.crt.Ctype.char) return Win32.crt.Ctype.char
      renames Win32.crt.Ctype.tolower;

   function strdec (cpc : Win32.PCCH; pc : Win32.PCCH) return Win32.PCHAR;

   function strinc (pc : Win32.PCCH) return Win32.PCHAR;

   function strnextc (cpc : Win32.PCCH) return Win32.UINT;

   function strninc (pc : Win32.PCCH; sz : Win32.Size_T) return Win32.PCHAR;

   function strncnt
     (cpc  : Win32.PCCH;
      sz   : Win32.Size_T)
      return Win32.Size_T;

   procedure strspnp
     (cpc1 : in out Win32.PCCH;
      cpc2 : Win32.PCCH;
      crv  : out Win32.PCCH);

   function tcsdec (cpc : Win32.PCCH; pc : Win32.PCCH) return Win32.PCHAR
      renames strdec;

   function tcsinc (pc : Win32.PCCH) return Win32.PCHAR renames strinc;

   function tcsnbcnt
     (cpc  : Win32.PCCH;
      sz   : Win32.Size_T)
      return Win32.Size_T renames strncnt;

   function tcsnccnt
     (cpc  : Win32.PCCH;
      sz   : Win32.Size_T)
      return Win32.Size_T renames strncnt;

   function tcsnextc (cpc : Win32.PCCH) return Win32.UINT renames strnextc;

   function tcsninc (pc : Win32.PCCH; sz : Win32.Size_T) return Win32.PCHAR
      renames strninc;

   procedure tcsspnp
     (cpc1 : in out Win32.PCCH;
      cpc2 : Win32.PCCH;
      crv  : out Win32.PCCH) renames strspnp;

   function ftcsdec (cpc : Win32.PCCH; pc : Win32.PCCH) return Win32.PCHAR
      renames tcsdec;

   function ftcsinc (pc : Win32.PCCH) return Win32.PCHAR renames tcsinc;

   function ftcsnbcnt
     (cpc  : Win32.PCCH;
      sz   : Win32.Size_T)
      return Win32.Size_T renames tcsnbcnt;

   function ftcsnccnt
     (cpc  : Win32.PCCH;
      sz   : Win32.Size_T)
      return Win32.Size_T renames tcsnccnt;

   function ftcsnextc (cpc : Win32.PCCH) return Win32.UINT renames tcsnextc;

   function ftcsninc
     (pc   : Win32.PCCH;
      sz   : Win32.Size_T)
      return Win32.PCHAR renames tcsninc;

   procedure ftcsspnp
     (cpc1 : in out Win32.PCCH;
      cpc2 : Win32.PCCH;
      crv  : out Win32.PCCH) renames strspnp;

   function ftcslwr (string1 : Win32.PSTR) return Win32.PSTR renames tcslwr;

   function ftcsupr (string1 : Win32.PSTR) return Win32.PSTR renames tcsupr;

   function ftclen (cpc : Win32.PCCH) return Win32.Size_T renames tclen;

   procedure ftccpy (pc1 : Win32.PCHAR; cpc2 : Win32.PCCH) renames
     tccpy;

   function ftccmp (cpc1 : Win32.PCCH; cpc2 : Win32.PCCH) return Win32.INT
      renames tccmp;

   function T (x : Win32.PSTR) return Win32.PSTR;

   function TEXT (x : Win32.PSTR) return Win32.PSTR renames T;

private
   pragma Inline (tclen);
   pragma Inline (tccpy);
   pragma Inline (strdec);
   pragma Inline (strinc);
   pragma Inline (strnextc);
   pragma Inline (strninc);
   pragma Inline (strncnt);
   pragma Inline (strspnp);

end Win32.crt.Tchar;
