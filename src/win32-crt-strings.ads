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

with Interfaces.C;

package Win32.crt.Strings is

   subtype size_t is Interfaces.C.size_t;

   function memccpy
     (dest  : Win32.PVOID;
      src   : Win32.PCVOID;
      ch    : Win32.INT;
      count : Win32.UINT)
      return Win32.PVOID;

   function memchr
     (buf   : Win32.PCVOID;
      ch    : Win32.INT;
      count : size_t)
      return Win32.PVOID;

   function memcmp
     (buf1  : Win32.PCVOID;
      buf2  : Win32.PCVOID;
      count : size_t)
      return Win32.INT;

   function memicmp
     (buf1  : Win32.PCVOID;
      buf2  : Win32.PCVOID;
      count : Win32.UINT)
      return Win32.INT;

   function memcpy
     (dest  : Win32.PVOID;
      src   : Win32.PCVOID;
      count : size_t)
      return Win32.PVOID;

   function memmove
     (dest  : Win32.PVOID;
      src   : Win32.PCVOID;
      count : size_t)
      return Win32.PVOID;

   function memset
     (dest  : Win32.PVOID;
      c     : Win32.INT;
      count : size_t)
      return Win32.PVOID;

   function strcat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR;

   function strchr (string1 : Win32.PCSTR; c : Win32.INT) return Win32.PSTR;

   function strcmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT;

   function strcmpi
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT;

   function stricmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT;

   function strcoll
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT;

   function stricoll
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.INT;

   function strcpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR;

   function strcspn
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return size_t;

   function strdup (string1 : Win32.PCSTR) return Win32.PSTR;

   function strerror (string1 : Win32.PCSTR) return Win32.PSTR;

   function strerror_c0 (errnum : Win32.INT) return Win32.PSTR;

   function strlen (string1 : Win32.PCSTR) return size_t;

   function strlwr (string1 : Win32.PSTR) return Win32.PSTR;

   function strncat
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : size_t)
      return Win32.PSTR;

   function strncmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : size_t)
      return Win32.INT;

   function strnicmp
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR;
      count   : size_t)
      return Win32.INT;

   function strncpy
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : size_t)
      return Win32.PSTR;

   function strnset
     (string1 : Win32.PSTR;
      c       : Win32.INT;
      count   : size_t)
      return Win32.PSTR;

   function strpbrk
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR;

   function strrchr
     (string1 : Win32.PCSTR;
      c       : Win32.INT)
      return Win32.PSTR;

   function strrev (string1 : Win32.PSTR) return Win32.PSTR;

   function strset (string1 : Win32.PSTR; c : Win32.INT) return Win32.PSTR;

   function strspn
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return size_t;

   function strstr
     (string1 : Win32.PCSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR;

   function strtok
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR)
      return Win32.PSTR;

   function strupr (string1 : Win32.PSTR) return Win32.PSTR;

   function strxfrm
     (string1 : Win32.PSTR;
      string2 : Win32.PCSTR;
      count   : size_t)
      return size_t;

   function wcscat
     (string1 : Win32.PWSTR;
      string2 : Win32.PCWSTR)
      return Win32.PWSTR;

   function wcschr
     (string1 : Win32.PCWSTR;
      c       : Win32.Wchar_T)
      return Win32.PWSTR;

   function wcscmp
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return Win32.INT;

   function wcscpy
     (string1 : Win32.PWSTR;
      string2 : Win32.PCWSTR)
      return Win32.PWSTR;

   function wcscspn
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return size_t;

   function wcslen (string1 : Win32.PCWSTR) return size_t;

   function wcsncat
     (string1 : Win32.PWSTR;
      string2 : Win32.PCWSTR;
      count   : size_t)
      return Win32.PWSTR;

   function wcsncmp
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR;
      count   : size_t)
      return Win32.INT;

   function wcsncpy
     (string1 : Win32.PWSTR;
      string2 : Win32.PCWSTR;
      count   : size_t)
      return Win32.PWSTR;

   function wcspbrk
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return Win32.PWSTR;

   function wcsrchr
     (string1 : Win32.PCWSTR;
      c       : Win32.Wchar_T)
      return Win32.PWSTR;

   function wcsspn
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return size_t;

   function wcsstr
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return Win32.PWSTR;

   function wcswcs
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return Win32.PWSTR renames wcsstr;

   function wcstok
     (string1 : Win32.PWSTR;
      string2 : Win32.PCWSTR)
      return Win32.PWSTR;

   function wcsdup (string1 : Win32.PCWSTR) return Win32.PWSTR;

   function wcsicmp
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return Win32.INT;

   function wcsnicmp
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR;
      count   : size_t)
      return Win32.INT;

   function wcsnset
     (string1 : Win32.PWSTR;
      c       : Win32.Wchar_T;
      count   : size_t)
      return Win32.PWSTR;

   function wcsrev (string1 : Win32.PWSTR) return Win32.PWSTR;

   function wcsset
     (string1 : Win32.PWSTR;
      count   : Win32.Wchar_T)
      return Win32.PWSTR;

   function wcslwr (string1 : Win32.PWSTR) return Win32.PWSTR;

   function wcsupr (string1 : Win32.PWSTR) return Win32.PWSTR;

   function wcsxfrm
     (string1 : Win32.PWSTR;
      string2 : Win32.PCWSTR;
      count   : size_t)
      return size_t;

   function wcscoll
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return Win32.INT;

   function wcsicoll
     (string1 : Win32.PCWSTR;
      string2 : Win32.PCWSTR)
      return Win32.INT;

private

   pragma Import (C, memccpy, "_memccpy");
   pragma Import (C, memchr, "memchr");
   pragma Import (C, memcmp, "memcmp");
   pragma Import (C, memicmp, "_memicmp");
   pragma Import (C, memcpy, "memcpy");
   pragma Import (C, memmove, "memmove");
   pragma Import (C, memset, "memset");
   pragma Import (C, strcat, "strcat");
   pragma Import (C, strchr, "strchr");
   pragma Import (C, strcmp, "strcmp");
   pragma Import (C, strcmpi, "_strcmpi");
   pragma Import (C, stricmp, "_stricmp");
   pragma Import (C, strcoll, "strcoll");
   pragma Import (C, stricoll, "_stricoll");
   pragma Import (C, strcpy, "strcpy");
   pragma Import (C, strcspn, "strcspn");
   pragma Import (C, strdup, "_strdup");
   pragma Import (C, strerror, "_strerror");
   pragma Import (C, strerror_c0, "strerror");
   pragma Import (C, strlen, "strlen");
   pragma Import (C, strlwr, "_strlwr");
   pragma Import (C, strncat, "strncat");
   pragma Import (C, strncmp, "strncmp");
   pragma Import (C, strnicmp, "_strnicmp");
   pragma Import (C, strncpy, "strncpy");
   pragma Import (C, strnset, "_strnset");
   pragma Import (C, strpbrk, "strpbrk");
   pragma Import (C, strrchr, "strrchr");
   pragma Import (C, strrev, "_strrev");
   pragma Import (C, strset, "_strset");
   pragma Import (C, strspn, "strspn");
   pragma Import (C, strstr, "strstr");
   pragma Import (C, strtok, "strtok");
   pragma Import (C, strupr, "_strupr");
   pragma Import (C, strxfrm, "strxfrm");
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

end Win32.crt.Strings;
