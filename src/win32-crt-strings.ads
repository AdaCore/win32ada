--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-strings.ads, v $
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

with Interfaces.C;

package Win32.crt.Strings is

   subtype size_t is Interfaces.C.size_t;                  --  string.h :44

   function memccpy (dest : Win32.PVOID;
                     src : Win32.PCVOID;
                     ch : Win32.INT;
                     count : Win32.UINT)
                    return Win32.PVOID;                --  string.h :68

   function memchr (buf : Win32.PCVOID;
                    ch : Win32.INT;
                    count : size_t)
                   return Win32.PVOID;                 --  string.h :69

   function memcmp (buf1 : Win32.PCVOID;
                    buf2 : Win32.PCVOID;
                    count : size_t)
                   return Win32.INT;                   --  string.h :70

   function memicmp (buf1 : Win32.PCVOID;
                     buf2 : Win32.PCVOID;
                     count : Win32.UINT)
                    return Win32.INT;                  --  string.h :71

   function memcpy (dest : Win32.PVOID;
                    src : Win32.PCVOID;
                    count : size_t)
                   return Win32.PVOID;                 --  string.h :72

   function memmove (dest : Win32.PVOID;
                     src : Win32.PCVOID;
                     count : size_t)
                    return Win32.PVOID;                --  string.h :73

   function memset (dest : Win32.PVOID;
                    c : Win32.INT;
                    count : size_t)
                   return Win32.PVOID;                 --  string.h :74

   function strcat (string1 : Win32.PSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR;                  --  string.h :75

   function strchr (string1 : Win32.PCSTR;
                    c : Win32.INT)
                   return Win32.PSTR;                  --  string.h :76

   function strcmp (string1 : Win32.PCSTR;
                    string2 : Win32.PCSTR)
                   return Win32.INT;                   --  string.h :77

   function strcmpi (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.INT;                  --  string.h :78

   function stricmp (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.INT;                  --  string.h :79

   function strcoll (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.INT;                  --  string.h :80

   function stricoll (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR)
                     return Win32.INT;                 --  string.h :85

   function strcpy (string1 : Win32.PSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR;                  --  string.h :86

   function strcspn (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return size_t;                     --  string.h :87

   function strdup (string1 : Win32.PCSTR) return Win32.PSTR; --  string.h :88

   function strerror (string1 : Win32.PCSTR) return Win32.PSTR;
   --  string.h :89

   function strerror_c0 (errnum : Win32.INT) return Win32.PSTR;
   --  string.h :90

   function strlen (string1 : Win32.PCSTR) return size_t;    --  string.h :91

   function strlwr (string1 : Win32.PSTR) return Win32.PSTR; --  string.h :92

   function strncat (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR;
                     count : size_t)
                    return Win32.PSTR;                 --  string.h :93

   function strncmp (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR;
                     count : size_t)
                    return Win32.INT;                  --  string.h :94

   function strnicmp (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR;
                      count : size_t)
                     return Win32.INT;                 --  string.h :95

   function strncpy (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR;
                     count : size_t)
                    return Win32.PSTR;                 --  string.h :96

   function strnset (string1 : Win32.PSTR;
                     c : Win32.INT;
                     count : size_t)
                    return Win32.PSTR;                 --  string.h :97

   function strpbrk (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.PSTR;                 --  string.h :98

   function strrchr (string1 : Win32.PCSTR;
                     c : Win32.INT)
                    return Win32.PSTR;                 --  string.h :99

   function strrev (string1 : Win32.PSTR) return Win32.PSTR; --  string.h :100

   function strset (string1 : Win32.PSTR;
                    c : Win32.INT)
                   return Win32.PSTR;                  --  string.h :101

   function strspn (string1 : Win32.PCSTR;
                    string2 : Win32.PCSTR)
                   return size_t;                      --  string.h :102

   function strstr (string1 : Win32.PCSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR;                  --  string.h :103

   function strtok (string1 : Win32.PSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR;                  --  string.h :104

   function strupr (string1 : Win32.PSTR) return Win32.PSTR; --  string.h :105

   function strxfrm (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR;
                     count : size_t)
                    return size_t;                     --  string.h :106

   function wcscat (string1 : Win32.PWSTR;
                    string2 : Win32.PCWSTR)
                   return Win32.PWSTR;                 --  string.h :109

   function wcschr (string1 : Win32.PCWSTR;
                    c : Win32.Wchar_T)
                   return Win32.PWSTR;                 --  string.h :110

   function wcscmp (string1 : Win32.PCWSTR;
                    string2 : Win32.PCWSTR)
                   return Win32.INT;                   --  string.h :111

   function wcscpy (string1 : Win32.PWSTR;
                    string2 : Win32.PCWSTR)
                   return Win32.PWSTR;                 --  string.h :112

   function wcscspn (string1 : Win32.PCWSTR;
                     string2 : Win32.PCWSTR)
                    return size_t;                     --  string.h :113

   function wcslen (string1 : Win32.PCWSTR) return size_t;   --  string.h :114

   function wcsncat (string1 : Win32.PWSTR;
                     string2 : Win32.PCWSTR;
                     count : size_t)
                    return Win32.PWSTR;                --  string.h :115

   function wcsncmp (string1 : Win32.PCWSTR;
                     string2 : Win32.PCWSTR;
                     count : size_t)
                    return Win32.INT;                  --  string.h :116

   function wcsncpy (string1 : Win32.PWSTR;
                     string2 : Win32.PCWSTR;
                     count : size_t)
                    return Win32.PWSTR;                --  string.h :117

   function wcspbrk (string1 : Win32.PCWSTR;
                     string2 : Win32.PCWSTR)
                    return Win32.PWSTR;                --  string.h :118

   function wcsrchr (string1 : Win32.PCWSTR;
                     c : Win32.Wchar_T)
                    return Win32.PWSTR;                --  string.h :119

   function wcsspn (string1 : Win32.PCWSTR;
                    string2 : Win32.PCWSTR)
                   return size_t;                      --  string.h :120

   function wcsstr (string1 : Win32.PCWSTR;
                    string2 : Win32.PCWSTR)
                   return Win32.PWSTR;                 --  string.h :121

   function wcswcs (string1 : Win32.PCWSTR;
                    string2 : Win32.PCWSTR)
                   return Win32.PWSTR
     renames wcsstr;                     --  string.h :121

   function wcstok (string1 : Win32.PWSTR;
                    string2 : Win32.PCWSTR)
                   return Win32.PWSTR;                 --  string.h :122

   function wcsdup (string1 : Win32.PCWSTR) return Win32.PWSTR;
   --  string.h :124

   function wcsicmp (string1 : Win32.PCWSTR;
                     string2 : Win32.PCWSTR)
                    return Win32.INT;                  --  string.h :125

   function wcsnicmp (string1 : Win32.PCWSTR;
                      string2 : Win32.PCWSTR;
                      count : size_t)
                     return Win32.INT;                 --  string.h :126

   function wcsnset (string1 : Win32.PWSTR;
                     c : Win32.Wchar_T;
                     count : size_t)
                    return Win32.PWSTR;                --  string.h :127

   function wcsrev (string1 : Win32.PWSTR) return Win32.PWSTR;
   --  string.h :128

   function wcsset (string1 : Win32.PWSTR;
                    count : Win32.Wchar_T)
                   return Win32.PWSTR;                 --  string.h :129

   function wcslwr (string1 : Win32.PWSTR) return Win32.PWSTR;
   --  string.h :131

   function wcsupr (string1 : Win32.PWSTR) return Win32.PWSTR;
   --  string.h :132

   function wcsxfrm (string1 : Win32.PWSTR;
                     string2 : Win32.PCWSTR;
                     count : size_t)
                    return size_t;                     --  string.h :133

   function wcscoll (string1 : Win32.PCWSTR;
                     string2 : Win32.PCWSTR)
                    return Win32.INT;                  --  string.h :134

   function wcsicoll (string1 : Win32.PCWSTR;
                      string2 : Win32.PCWSTR)
                     return Win32.INT;                 --  string.h :135

private

   pragma Import (C, memccpy, "_memccpy");     --  string.h :68
   pragma Import (C, memchr, "memchr");        --  string.h :69
   pragma Import (C, memcmp, "memcmp");        --  string.h :70
   pragma Import (C, memicmp, "_memicmp");     --  string.h :71
   pragma Import (C, memcpy, "memcpy");        --  string.h :72
   pragma Import (C, memmove, "memmove");      --  string.h :73
   pragma Import (C, memset, "memset");        --  string.h :74
   pragma Import (C, strcat, "strcat");        --  string.h :75
   pragma Import (C, strchr, "strchr");        --  string.h :76
   pragma Import (C, strcmp, "strcmp");        --  string.h :77
   pragma Import (C, strcmpi, "_strcmpi");     --  string.h :78
   pragma Import (C, stricmp, "_stricmp");     --  string.h :79
   pragma Import (C, strcoll, "strcoll");      --  string.h :80
   pragma Import (C, stricoll, "_stricoll");   --  string.h :85
   pragma Import (C, strcpy, "strcpy");        --  string.h :86
   pragma Import (C, strcspn, "strcspn");      --  string.h :87
   pragma Import (C, strdup, "_strdup");       --  string.h :88
   pragma Import (C, strerror, "_strerror");   --  string.h :89
   pragma Import (C, strerror_c0, "strerror"); --  string.h :90
   pragma Import (C, strlen, "strlen");        --  string.h :91
   pragma Import (C, strlwr, "_strlwr");       --  string.h :92
   pragma Import (C, strncat, "strncat");      --  string.h :93
   pragma Import (C, strncmp, "strncmp");      --  string.h :94
   pragma Import (C, strnicmp, "_strnicmp");   --  string.h :95
   pragma Import (C, strncpy, "strncpy");      --  string.h :96
   pragma Import (C, strnset, "_strnset");     --  string.h :97
   pragma Import (C, strpbrk, "strpbrk");      --  string.h :98
   pragma Import (C, strrchr, "strrchr");      --  string.h :99
   pragma Import (C, strrev, "_strrev");       --  string.h :100
   pragma Import (C, strset, "_strset");       --  string.h :101
   pragma Import (C, strspn, "strspn");        --  string.h :102
   pragma Import (C, strstr, "strstr");        --  string.h :103
   pragma Import (C, strtok, "strtok");        --  string.h :104
   pragma Import (C, strupr, "_strupr");       --  string.h :105
   pragma Import (C, strxfrm, "strxfrm");      --  string.h :106
   pragma Import (C, wcscat, "wcscat");        --  string.h :109
   pragma Import (C, wcschr, "wcschr");        --  string.h :110
   pragma Import (C, wcscmp, "wcscmp");        --  string.h :111
   pragma Import (C, wcscpy, "wcscpy");        --  string.h :112
   pragma Import (C, wcscspn, "wcscspn");      --  string.h :113
   pragma Import (C, wcslen, "wcslen");        --  string.h :114
   pragma Import (C, wcsncat, "wcsncat");      --  string.h :115
   pragma Import (C, wcsncmp, "wcsncmp");      --  string.h :116
   pragma Import (C, wcsncpy, "wcsncpy");      --  string.h :117
   pragma Import (C, wcspbrk, "wcspbrk");      --  string.h :118
   pragma Import (C, wcsrchr, "wcsrchr");      --  string.h :119
   pragma Import (C, wcsspn, "wcsspn");        --  string.h :120
   pragma Import (C, wcsstr, "wcsstr");        --  string.h :121
   pragma Import (C, wcstok, "wcstok");        --  string.h :122
   pragma Import (C, wcsdup, "_wcsdup");       --  string.h :124
   pragma Import (C, wcsicmp, "_wcsicmp");     --  string.h :125
   pragma Import (C, wcsnicmp, "_wcsnicmp");   --  string.h :126
   pragma Import (C, wcsnset, "_wcsnset");     --  string.h :127
   pragma Import (C, wcsrev, "_wcsrev");       --  string.h :128
   pragma Import (C, wcsset, "_wcsset");       --  string.h :129
   pragma Import (C, wcslwr, "_wcslwr");       --  string.h :131
   pragma Import (C, wcsupr, "_wcsupr");       --  string.h :132
   pragma Import (C, wcsxfrm, "wcsxfrm");      --  string.h :133
   pragma Import (C, wcscoll, "wcscoll");      --  string.h :134
   pragma Import (C, wcsicoll, "_wcsicoll");   --  string.h :135

end Win32.crt.Strings;


