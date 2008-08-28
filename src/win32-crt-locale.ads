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

package Win32.crt.Locale is

   LC_ALL : constant := 0;               --  locale.h:56
   LC_COLLATE : constant := 1;               --  locale.h:57
   LC_CTYPE : constant := 2;               --  locale.h:58
   LC_MONETARY : constant := 3;               --  locale.h:59
   LC_NUMERIC : constant := 4;               --  locale.h:60
   LC_TIME : constant := 5;               --  locale.h:61
   LC_MIN : constant := 0;               --  locale.h:63
   LC_MAX : constant := 5;               --  locale.h:64

   type lconv is                                           --  locale.h:69
      record
         decimal_point : Win32.PSTR;                  --  locale.h:70
         thousands_sep : Win32.PSTR;                  --  locale.h:71
         grouping : Win32.PSTR;                  --  locale.h:72
         int_curr_symbol : Win32.PSTR;                  --  locale.h:73
         currency_symbol : Win32.PSTR;                  --  locale.h:74
         mon_decimal_point : Win32.PSTR;                  --  locale.h:75
         mon_thousands_sep : Win32.PSTR;                  --  locale.h:76
         mon_grouping : Win32.PSTR;                  --  locale.h:77
         positive_sign : Win32.PSTR;                  --  locale.h:78
         negative_sign : Win32.PSTR;                  --  locale.h:79
         int_frac_digits : Win32.CHAR;                  --  locale.h:80
         frac_digits : Win32.CHAR;                  --  locale.h:81
         p_cs_precedes : Win32.CHAR;                  --  locale.h:82
         p_sep_by_space : Win32.CHAR;                  --  locale.h:83
         n_cs_precedes : Win32.CHAR;                  --  locale.h:84
         n_sep_by_space : Win32.CHAR;                  --  locale.h:85
         p_sign_posn : Win32.CHAR;                  --  locale.h:86
         n_sign_posn : Win32.CHAR;                  --  locale.h:87
      end record;

   type a_lconv_t is access all lconv;                     --  locale.h:95

   function setlocale (category : Win32.INT;
                       locale : Win32.PCSTR)
                      return Win32.PSTR;         --  locale.h:94

   function localeconv return a_lconv_t;                   --  locale.h:95

private

   pragma Convention (C, lconv);                            --  locale.h:69

   pragma Import (C, setlocale, "setlocale");               --  locale.h:94
   pragma Import (C, localeconv, "localeconv");             --  locale.h:95


end Win32.crt.Locale;
