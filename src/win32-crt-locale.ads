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

package Win32.crt.Locale is

   LC_ALL      : constant := 0;
   LC_COLLATE  : constant := 1;
   LC_CTYPE    : constant := 2;
   LC_MONETARY : constant := 3;
   LC_NUMERIC  : constant := 4;
   LC_TIME     : constant := 5;
   LC_MIN      : constant := 0;
   LC_MAX      : constant := 5;

   type lconv is record
      decimal_point     : Win32.PSTR;
      thousands_sep     : Win32.PSTR;
      grouping          : Win32.PSTR;
      int_curr_symbol   : Win32.PSTR;
      currency_symbol   : Win32.PSTR;
      mon_decimal_point : Win32.PSTR;
      mon_thousands_sep : Win32.PSTR;
      mon_grouping      : Win32.PSTR;
      positive_sign     : Win32.PSTR;
      negative_sign     : Win32.PSTR;
      int_frac_digits   : Win32.CHAR;
      frac_digits       : Win32.CHAR;
      p_cs_precedes     : Win32.CHAR;
      p_sep_by_space    : Win32.CHAR;
      n_cs_precedes     : Win32.CHAR;
      n_sep_by_space    : Win32.CHAR;
      p_sign_posn       : Win32.CHAR;
      n_sign_posn       : Win32.CHAR;
   end record;

   type a_lconv_t is access all lconv;

   function setlocale
     (category : Win32.INT;
      locale   : Win32.PCSTR)
      return Win32.PSTR;

   function localeconv return a_lconv_t;

private

   pragma Convention (C, lconv);

   pragma Import (C, setlocale, "setlocale");
   pragma Import (C, localeconv, "localeconv");

end Win32.crt.Locale;
