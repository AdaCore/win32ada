--  $Source$
--  $Revision$ $Date$ $Author$
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

with Stdarg;
with Win32;
with Win32.crt.Ctype;
with Win32.crt.Stdio;

package Win32.crt.WcharPkg is                                   --  wchar.h

   subtype size_t is Win32.Size_T;

   subtype wchar_t is Win32.Wchar_T;

   subtype wint_t is Win32.crt.Ctype.wint_t;

   subtype wctype_t is wchar_t;

   --  set bit masks for the possible character types
   UPPER    : constant := 16#1#;    --  upper case letter
   LOWER    : constant := 16#2#;    --  lower case letter
   DIGIT    : constant := 16#4#;    --  digit[0-9]
   SPACE    : constant := 16#8#;    --  tab, carriage return, newline,
                                    --  vertical tab or form feed
   PUNCT    : constant := 16#10#;   --  punctuation character
   CONTROL  : constant := 16#20#;   --  control character
   BLANK    : constant := 16#40#;   --  space char
   HEX      : constant := 16#80#;   --  hexadecimal digit
   LEADBYTE : constant := 16#8000#; --  multibyte leadbyte

   use type Win32.UINT;
   ALPHA : constant := Win32.UINT'(16#0100# or UPPER or LOWER);

   function iswalpha (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswalpha;

   function iswupper (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswupper;

   function iswlower (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswlower;

   function iswdigit (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswdigit;

   function iswxdigit (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswxdigit;

   function iswspace (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswspace;

   function iswpunct (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswpunct;

   function iswalnum (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswalnum;

   function iswprint (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswprint;

   function iswgraph (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswgraph;

   function iswcntrl (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswcntrl;

   function iswascii (c : in wint_t) return Win32.INT
     renames Win32.crt.Ctype.iswascii;

   function isleadbyte (c : Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isleadbyte;

   function towupper (c : in wchar_t) return wchar_t
     renames Win32.crt.Ctype.towupper;

   function towlower (c : in wchar_t) return wchar_t
     renames Win32.crt.Ctype.towlower;

   function iswctype (c : in wint_t; desc : in wctype_t) return
     Win32.INT renames Win32.crt.Ctype.iswctype;

   function isctype (ch : Win32.crt.Ctype.char;
                     desc : Win32.INT)
                    return Win32.INT
     renames Win32.crt.Ctype.isctype;

   function fgetwchar return wint_t;

   function fputwchar (c : in wint_t) return wint_t;

   function fgetwc (stream : Win32.crt.Stdio.FILE_Access) return wint_t;

   function fputwc
     (c : in wint_t;
      stream : Win32.crt.Stdio.FILE_Access)
     return wint_t;

   function ungetwc
     (c : in wint_t;
      stream : Win32.crt.Stdio.FILE_Access)
     return wint_t;

   function getwchar return wint_t;

   function putwchar (c : in wint_t) return wint_t;

   function getwc (stream : Win32.crt.Stdio.FILE_Access) return wint_t
     renames fgetwc;

   function putwc
     (c : in wint_t;
      stream : Win32.crt.Stdio.FILE_Access) return wint_t
     renames fputwc;

   function fwprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function fwscanf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function wprintf
     (format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function wscanf
     (format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function snwprintf
     (buffer : Win32.PWSTR;
      count : size_t;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function swprintf
     (buffer : Win32.PWSTR;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function swscanf
     (buffer : Win32.PWSTR;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function vfwprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function vwprintf
     (format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function vsnwprintf
     (buffer : Win32.PWSTR;
      count : size_t;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   function vswprintf
     (buffer : Win32.PWSTR;
      format : Win32.PCWSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;

   --  also defined in stdlib.h
   type access_unsigned_short is access all Win32.USHORT;

   function wcstod
     (nptr : access Win32.USHORT;
      endptr : access access_unsigned_short) return Win32.DOUBLE;

   function wcstol
     (nptr : in access_unsigned_short;
      endptr : access access_unsigned_short;
      base : in Win32.INT) return Win32.LONG;

   function wcstoul
     (nptr : in access_unsigned_short;
      endptr : access access_unsigned_short;
      base : in Win32.INT) return Win32.ULONG;

   function itow
     (val : in Win32.INT;
      buf : in access_unsigned_short;
      radix : in Win32.INT) return access_unsigned_short;

   function ltow
     (val : in Win32.LONG;
      buf : in access_unsigned_short;
      radix : in Win32.INT) return access_unsigned_short;

   function ultow
     (val : in Win32.ULONG;
      buf : in access_unsigned_short;
      radix : in Win32.INT) return access_unsigned_short;

   function wtol
     (nptr : in access_unsigned_short) return Win32.LONG;

   function wtoi
     (nptr : in access_unsigned_short) return Win32.INT;

   function wcscat
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return access_unsigned_short;

   function wcschr
     (string1 : in access_unsigned_short;
      c : in wchar_t)
     return access_unsigned_short;

   function wcscmp
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return Win32.INT;

   function wcscpy
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return access_unsigned_short;

   function wcscspn
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return size_t;

   function wcslen
     (string1 : in access_unsigned_short) return size_t;

   function wcsncat
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short;
      count : in size_t) return access_unsigned_short;

   function wcsncmp
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short;
      count : in size_t) return Win32.INT;

   function wcsncpy
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short;
      count : in size_t) return access_unsigned_short;

   function wcspbrk
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return access_unsigned_short;

   function wcsrchr
     (string1 : in access_unsigned_short;
      c : in wchar_t)
     return access_unsigned_short;

   function wcsspn
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return size_t;

   function wcsstr
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return access_unsigned_short;

   function wcstok
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return access_unsigned_short;

   function wcsdup
     (string1 : in access_unsigned_short)
     return access_unsigned_short;

   function wcsicmp
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return Win32.INT;

   function wcsnicmp
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short;
      count : in size_t) return Win32.INT;

   function wcsnset
     (string1 : in access_unsigned_short;
      c : in wchar_t;
      count : in size_t) return access_unsigned_short;

   function wcsrev
     (string1 : in access_unsigned_short)
     return access_unsigned_short;

   function wcsset
     (string1 : in access_unsigned_short;
      c : in wchar_t)
     return access_unsigned_short;

   function wcslwr
     (string1 : in access_unsigned_short)
     return access_unsigned_short;

   function wcsupr
     (string1 : in access_unsigned_short)
     return access_unsigned_short;

   function wcsxfrm
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short;
      count : in size_t) return size_t;

   function wcscoll
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short) return Win32.INT;

   function wcsicoll
     (string1 : in access_unsigned_short;
      string2 : in access_unsigned_short)
     return Win32.INT;

   --  wcsftime is in package Time.

private

   pragma Inline (getwchar);
   pragma Inline (putwchar);

   pragma Import (C, fgetwchar, "_fgetwchar");
   pragma Import (C, fputwchar, "_fputwchar");
   pragma Import (C, fgetwc, "fgetwc");
   pragma Import (C, fputwc, "fputwc");
   pragma Import (C, ungetwc, "ungetwc");
   pragma Import (C, wcstod, "wcstod");
   pragma Import (C, wcstol, "wcstol");
   pragma Import (C, wcstoul, "wcstoul");
   pragma Import (C, itow, "_itow");
   pragma Import (C, ltow, "_ltow");
   pragma Import (C, ultow, "_ultow");
   pragma Import (C, wtol, "_wtol");
   pragma Import (C, wtoi, "_wtoi");
   pragma Import (C, wcscat, "wcscat");
   pragma Import (C, wcschr, "wcschr");
   pragma Import (C, wcscmp, "wcscmp");
   pragma Import (C, wcscpy, "wcscpy");
   pragma Import (C, wcscspn, "wcscspn");
   pragma Import (C, wcslen, "wcslen");
   pragma Import (C, wcsncat, "wcsncat");
   pragma Import (C, wcsncmp, "wcsncmp");
   pragma Import (C, wcsncpy, "wcsncpy");
   pragma Import (C, wcspbrk, "wcspbrk");
   pragma Import (C, wcsrchr, "wcsrchr");
   pragma Import (C, wcsspn, "wcsspn");
   pragma Import (C, wcsstr, "wcsstr");
   pragma Import (C, wcstok, "wcstok");
   pragma Import (C, wcsdup, "_wcsdup");
   pragma Import (C, wcsicmp, "_wcsicmp");
   pragma Import (C, wcsnicmp, "_wcsnicmp");
   pragma Import (C, wcsnset, "_wcsnset");
   pragma Import (C, wcsrev, "_wcsrev");
   pragma Import (C, wcsset, "_wcsset");
   pragma Import (C, wcslwr, "_wcslwr");
   pragma Import (C, wcsupr, "_wcsupr");
   pragma Import (C, wcsxfrm, "wcsxfrm");
   pragma Import (C, wcscoll, "wcscoll");
   pragma Import (C, wcsicoll, "_wcsicoll");

end Win32.crt.WcharPkg;


