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

package Win32.crt.Mbstring is

   function mbbtombc (c : Win32.UINT) return Win32.UINT;

   function mbbtype (ch : Win32.UCHAR; ctype : Win32.INT) return Win32.INT;

   function mbctombb (ch : Win32.UINT) return Win32.UINT;

   function mbsbtype
     (mbstr : Win32.PCBYTE;
      count : Win32.Size_T)
      return Win32.INT;

   function mbscat
     (string1 : Win32.PBYTE;
      string2 : Win32.PCBYTE)
      return Win32.PBYTE;

   function mbschr
     (string : Win32.PCBYTE;
      ch     : Win32.UINT)
      return Win32.PBYTE;

   function mbscmp
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE)
      return Win32.INT;

   function mbscpy
     (string1 : Win32.PBYTE;
      string2 : Win32.PCBYTE)
      return Win32.PBYTE;

   function mbscspn
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE)
      return Win32.Size_T;

   function mbsdec
     (start   : Win32.PCBYTE;
      current : Win32.PCBYTE)
      return Win32.PBYTE;

   function mbsdup (string : Win32.PCBYTE) return Win32.PBYTE;

   function mbsicmp
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE)
      return Win32.INT;

   function mbsinc (current : Win32.PCBYTE) return Win32.PBYTE;

   function mbslen (string : Win32.PCBYTE) return Win32.Size_T;

   function mbslwr (string : Win32.PBYTE) return Win32.PBYTE;

   function mbsnbcat
     (dest  : Win32.PBYTE;
      src   : Win32.PCBYTE;
      count : Win32.Size_T)
      return Win32.PBYTE;

   function mbsnbcmp
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE;
      count   : Win32.Size_T)
      return Win32.INT;

   function mbsnbcnt
     (string : Win32.PCBYTE;
      n      : Win32.Size_T)
      return Win32.Size_T;

   function mbsnbcpy
     (dest  : Win32.PBYTE;
      src   : Win32.PCBYTE;
      count : Win32.Size_T)
      return Win32.PBYTE;

   function mbsnbicmp
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE;
      count   : Win32.Size_T)
      return Win32.INT;

   function mbsnbset
     (string : Win32.PBYTE;
      ch     : Win32.UINT;
      count  : Win32.Size_T)
      return Win32.PBYTE;

   function mbsncat
     (string1 : Win32.PBYTE;
      string2 : Win32.PCBYTE;
      count   : Win32.Size_T)
      return Win32.PBYTE;

   function mbsnccnt
     (string : Win32.PCBYTE;
      n      : Win32.Size_T)
      return Win32.Size_T;

   function mbsncmp
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE;
      count   : Win32.Size_T)
      return Win32.INT;

   function mbsncpy
     (string1 : Win32.PBYTE;
      string2 : Win32.PCBYTE;
      count   : Win32.Size_T)
      return Win32.PBYTE;

   function mbsnextc (string : Win32.PCBYTE) return Win32.UINT;

   function mbsnicmp
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE;
      count   : Win32.Size_T)
      return Win32.INT;

   function mbsninc
     (string : Win32.PCBYTE;
      count  : Win32.Size_T)
      return Win32.PBYTE;

   function mbsnset
     (string : Win32.PBYTE;
      ch     : Win32.UINT;
      count  : Win32.Size_T)
      return Win32.PBYTE;

   function mbspbrk
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE)
      return Win32.PBYTE;

   function mbsrchr
     (string : Win32.PCBYTE;
      ch     : Win32.UINT)
      return Win32.PBYTE;

   function mbsrev (string : Win32.PBYTE) return Win32.PBYTE;

   function mbsset
     (string : Win32.PBYTE;
      ch     : Win32.UINT)
      return Win32.PBYTE;

   function mbsspn
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE)
      return Win32.Size_T;

   function mbsspnp
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE)
      return Win32.PBYTE;

   function mbsstr
     (string1 : Win32.PCBYTE;
      string2 : Win32.PCBYTE)
      return Win32.PBYTE;

   function mbstok
     (string1 : Win32.PBYTE;
      string2 : Win32.PCBYTE)
      return Win32.PBYTE;

   function mbsupr (string : Win32.PBYTE) return Win32.PBYTE;

   function mbclen (c : Win32.PCBYTE) return Win32.Size_T;

   procedure mbccpy (dest : Win32.PBYTE; src : Win32.PCBYTE);

   function mbccmp (cpc1, cpc2 : Win32.PCBYTE) return Win32.INT;

   function ismbcalpha (ch : Win32.UINT) return Win32.INT;

   function ismbcdigit (ch : Win32.UINT) return Win32.INT;

   function ismbclegal (ch : Win32.UINT) return Win32.INT;

   function ismbclower (ch : Win32.UINT) return Win32.INT;

   function ismbcprint (ch : Win32.UINT) return Win32.INT;

   function ismbcspace (ch : Win32.UINT) return Win32.INT;

   function ismbcupper (ch : Win32.UINT) return Win32.INT;

   function mbctolower (ch : Win32.UINT) return Win32.UINT;

   function mbctoupper (ch : Win32.UINT) return Win32.UINT;

   function ismbblead (ch : Win32.UINT) return Win32.INT;

   function ismbbtrail (ch : Win32.UINT) return Win32.INT;

   function ismbslead
     (string  : Win32.PCBYTE;
      current : Win32.PCBYTE)
      return Win32.INT;

   function ismbstrail
     (string  : Win32.PCBYTE;
      current : Win32.PCBYTE)
      return Win32.INT;

   function ismbchira (ch : Win32.UINT) return Win32.INT;

   function ismbckata (ch : Win32.UINT) return Win32.INT;

   function ismbcsymbol (ch : Win32.UINT) return Win32.INT;

   function ismbcl0 (ch : Win32.UINT) return Win32.INT;

   function ismbcl1 (ch : Win32.UINT) return Win32.INT;

   function ismbcl2 (ch : Win32.UINT) return Win32.INT;

   function mbcjistojms (ch : Win32.UINT) return Win32.UINT;

   function mbcjmstojis (ch : Win32.UINT) return Win32.UINT;

   function mbctohira (ch : Win32.UINT) return Win32.UINT;

   function mbctokata (ch : Win32.UINT) return Win32.UINT;

private

   pragma Inline (mbccmp);
   pragma Import (C, mbbtombc, "_mbbtombc");
   pragma Import (C, mbbtype, "_mbbtype");
   pragma Import (C, mbctombb, "_mbctombb");
   pragma Import (C, mbsbtype, "_mbsbtype");
   pragma Import (C, mbscat, "_mbscat");
   pragma Import (C, mbschr, "_mbschr");
   pragma Import (C, mbscmp, "_mbscmp");
   pragma Import (C, mbscpy, "_mbscpy");
   pragma Import (C, mbscspn, "_mbscspn");
   pragma Import (C, mbsdec, "_mbsdec");
   pragma Import (C, mbsdup, "_mbsdup");
   pragma Import (C, mbsicmp, "_mbsicmp");
   pragma Import (C, mbsinc, "_mbsinc");
   pragma Import (C, mbslen, "_mbslen");
   pragma Import (C, mbslwr, "_mbslwr");
   pragma Import (C, mbsnbcat, "_mbsnbcat");
   pragma Import (C, mbsnbcmp, "_mbsnbcmp");
   pragma Import (C, mbsnbcnt, "_mbsnbcnt");
   pragma Import (C, mbsnbcpy, "_mbsnbcpy");
   pragma Import (C, mbsnbicmp, "_mbsnbicmp");
   pragma Import (C, mbsnbset, "_mbsnbset");
   pragma Import (C, mbsncat, "_mbsncat");
   pragma Import (C, mbsnccnt, "_mbsnccnt");
   pragma Import (C, mbsncmp, "_mbsncmp");
   pragma Import (C, mbsncpy, "_mbsncpy");
   pragma Import (C, mbsnextc, "_mbsnextc");
   pragma Import (C, mbsnicmp, "_mbsnicmp");
   pragma Import (C, mbsninc, "_mbsninc");
   pragma Import (C, mbsnset, "_mbsnset");
   pragma Import (C, mbspbrk, "_mbspbrk");
   pragma Import (C, mbsrchr, "_mbsrchr");
   pragma Import (C, mbsrev, "_mbsrev");
   pragma Import (C, mbsset, "_mbsset");
   pragma Import (C, mbsspn, "_mbsspn");
   pragma Import (C, mbsspnp, "_mbsspnp");
   pragma Import (C, mbsstr, "_mbsstr");
   pragma Import (C, mbstok, "_mbstok");
   pragma Import (C, mbsupr, "_mbsupr");
   pragma Import (C, mbclen, "_mbclen");
   pragma Import (C, mbccpy, "_mbccpy");
   pragma Import (C, ismbcalpha, "_ismbcalpha");
   pragma Import (C, ismbcdigit, "_ismbcdigit");
   pragma Import (C, ismbclegal, "_ismbclegal");
   pragma Import (C, ismbclower, "_ismbclower");
   pragma Import (C, ismbcprint, "_ismbcprint");
   pragma Import (C, ismbcspace, "_ismbcspace");
   pragma Import (C, ismbcupper, "_ismbcupper");
   pragma Import (C, mbctolower, "_mbctolower");
   pragma Import (C, mbctoupper, "_mbctoupper");
   pragma Import (C, ismbblead, "_ismbblead");
   pragma Import (C, ismbbtrail, "_ismbbtrail");
   pragma Import (C, ismbslead, "_ismbslead");
   pragma Import (C, ismbstrail, "_ismbstrail");
   pragma Import (C, ismbchira, "_ismbchira");
   pragma Import (C, ismbckata, "_ismbckata");
   pragma Import (C, ismbcsymbol, "_ismbcsymbol");
   pragma Import (C, ismbcl0, "_ismbcl0");
   pragma Import (C, ismbcl1, "_ismbcl1");
   pragma Import (C, ismbcl2, "_ismbcl2");
   pragma Import (C, mbcjistojms, "_mbcjistojms");
   pragma Import (C, mbcjmstojis, "_mbcjmstojis");
   pragma Import (C, mbctohira, "_mbctohira");
   pragma Import (C, mbctokata, "_mbctokata");

end Win32.crt.Mbstring;
