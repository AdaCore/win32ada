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

package Win32.crt.Ctype is

   UPPER    : constant := 16#1#;
   LOWER    : constant := 16#2#;
   DIGIT    : constant := 16#4#;
   SPACE    : constant := 16#8#;
   PUNCT    : constant := 16#10#;
   CONTROL  : constant := 16#20#;
   BLANK    : constant := 16#40#;
   HEX      : constant := 16#80#;
   LEADBYTE : constant := 16#8000#;
   ALPHA    : constant := 16#103#;

   subtype wint_t is Win32.Wchar_T;
   subtype wctype_t is Win32.Wchar_T;
   subtype char is Win32.UCHAR;

   WEOF : constant wint_t := wint_t'Val (16#ffff#);

   function isalpha (c : char) return Win32.INT;

   function isupper (c : char) return Win32.INT;

   function islower (c : char) return Win32.INT;

   function isdigit (c : char) return Win32.INT;

   function isxdigit (c : char) return Win32.INT;

   function isspace (c : char) return Win32.INT;

   function ispunct (c : char) return Win32.INT;

   function isalnum (c : char) return Win32.INT;

   function isprint (c : char) return Win32.INT;

   function isgraph (c : char) return Win32.INT;

   function iscntrl (c : char) return Win32.INT;

   function toupper (c : char) return char;

   function tolower (c : char) return char;

   function tolower_c0 (c : char) return char;

   function toupper_c0 (c : char) return char;

   function isascii (c : char) return Win32.INT;

   function toascii (c : char) return char;

   function iscsymf (c : char) return Win32.INT;

   function iscsym (c : char) return Win32.INT;

   function iswalpha (c : wint_t) return Win32.INT;

   function iswupper (c : wint_t) return Win32.INT;

   function iswlower (c : wint_t) return Win32.INT;

   function iswdigit (c : wint_t) return Win32.INT;

   function iswxdigit (c : wint_t) return Win32.INT;

   function iswspace (c : wint_t) return Win32.INT;

   function iswpunct (c : wint_t) return Win32.INT;

   function iswalnum (c : wint_t) return Win32.INT;

   function iswprint (c : wint_t) return Win32.INT;

   function iswgraph (c : wint_t) return Win32.INT;

   function iswcntrl (c : wint_t) return Win32.INT;

   function iswascii (c : wint_t) return Win32.INT;

   function isleadbyte (c : char) return Win32.INT;

   function towupper (c : Win32.Wchar_T) return Win32.Wchar_T;

   function towlower (c : Win32.Wchar_T) return Win32.Wchar_T;

   function iswctype (c : wint_t; desc : wctype_t) return Win32.INT;

   function isctype (ch : char; desc : Win32.INT) return Win32.INT;

private

   pragma Import (C, isalpha, "isalpha");
   pragma Import (C, isupper, "isupper");
   pragma Import (C, islower, "islower");
   pragma Import (C, isdigit, "isdigit");
   pragma Import (C, isxdigit, "isxdigit");
   pragma Import (C, isspace, "isspace");
   pragma Import (C, ispunct, "ispunct");
   pragma Import (C, isalnum, "isalnum");
   pragma Import (C, isprint, "isprint");
   pragma Import (C, isgraph, "isgraph");
   pragma Import (C, iscntrl, "iscntrl");
   pragma Import (C, toupper, "toupper");
   pragma Import (C, tolower, "tolower");
   pragma Import (C, tolower_c0, "_tolower");
   pragma Import (C, toupper_c0, "_toupper");
   pragma Import (C, isascii, "__isascii");
   pragma Import (C, toascii, "__toascii");
   pragma Import (C, iscsymf, "__iscsymf");
   pragma Import (C, iscsym, "__iscsym");
   pragma Import (C, iswalpha, "iswalpha");
   pragma Import (C, iswupper, "iswupper");
   pragma Import (C, iswlower, "iswlower");
   pragma Import (C, iswdigit, "iswdigit");
   pragma Import (C, iswxdigit, "iswxdigit");
   pragma Import (C, iswspace, "iswspace");
   pragma Import (C, iswpunct, "iswpunct");
   pragma Import (C, iswalnum, "iswalnum");
   pragma Import (C, iswprint, "iswprint");
   pragma Import (C, iswgraph, "iswgraph");
   pragma Import (C, iswcntrl, "iswcntrl");
   pragma Import (C, iswascii, "iswascii");
   pragma Import (C, isleadbyte, "isleadbyte");
   pragma Import (C, towupper, "towupper");
   pragma Import (C, towlower, "towlower");
   pragma Import (C, iswctype, "iswctype");
   pragma Import (C, isctype, "_isctype");

end Win32.crt.Ctype;
