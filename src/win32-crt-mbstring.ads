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



package Win32.crt.Mbstring is



   function mbbtombc (c : Win32.UINT) return Win32.UINT;     --  mbstring.h:56



   function mbbtype (ch : Win32.UCHAR;

                     ctype : Win32.INT) return Win32.INT;    --  mbstring.h:57



   function mbctombb (ch : Win32.UINT) return Win32.UINT;    --  mbstring.h:58



   function mbsbtype (mbstr : Win32.PCBYTE;

                      count : Win32.Size_T)

                     return Win32.INT;              --  mbstring.h:59



   function mbscat (string1 : Win32.PBYTE;

                    string2 : Win32.PCBYTE)

                   return Win32.PBYTE;            --  mbstring.h:60



   function mbschr (string : Win32.PCBYTE;

                    ch : Win32.UINT)

                   return Win32.PBYTE;             --  mbstring.h:62



   function mbscmp (string1 : Win32.PCBYTE;

                    string2 : Win32.PCBYTE)

                   return Win32.INT;              --  mbstring.h:63



   function mbscpy (string1 : Win32.PBYTE;

                    string2 : Win32.PCBYTE)

                   return Win32.PBYTE;            --  mbstring.h:65



   function mbscspn (string1 : Win32.PCBYTE;

                     string2 : Win32.PCBYTE)

                    return Win32.Size_T;          --  mbstring.h:67



   function mbsdec (start : Win32.PCBYTE;

                    current : Win32.PCBYTE)

                   return Win32.PBYTE;            --  mbstring.h:69



   function mbsdup (string : Win32.PCBYTE) return Win32.PBYTE;

   --  mbstring.h:71



   function mbsicmp (string1 : Win32.PCBYTE;

                     string2 : Win32.PCBYTE)

                    return Win32.INT;             --  mbstring.h:72



   function mbsinc (current : Win32.PCBYTE) return Win32.PBYTE;

   --  mbstring.h:74



   function mbslen (string : Win32.PCBYTE) return Win32.Size_T;

   --  mbstring.h:75



   function mbslwr (string : Win32.PBYTE) return Win32.PBYTE; --  mbstring.h:76



   function mbsnbcat (dest : Win32.PBYTE;

                      src : Win32.PCBYTE;

                      count : Win32.Size_T)

                     return Win32.PBYTE;            --  mbstring.h:77



   function mbsnbcmp (string1 : Win32.PCBYTE;

                      string2 : Win32.PCBYTE;

                      count : Win32.Size_T)

                     return Win32.INT;            --  mbstring.h:79



   function mbsnbcnt (string : Win32.PCBYTE;

                      n : Win32.Size_T)

                     return Win32.Size_T;          --  mbstring.h:81



   function mbsnbcpy (dest : Win32.PBYTE;

                      src : Win32.PCBYTE;

                      count : Win32.Size_T)

                     return Win32.PBYTE;            --  mbstring.h:82



   function mbsnbicmp (string1 : Win32.PCBYTE;

                       string2 : Win32.PCBYTE;

                       count : Win32.Size_T)

                      return Win32.INT;           --  mbstring.h:84



   function mbsnbset (string : Win32.PBYTE;

                      ch : Win32.UINT;

                      count : Win32.Size_T)

                     return Win32.PBYTE;           --  mbstring.h:86



   function mbsncat (string1 : Win32.PBYTE;

                     string2 : Win32.PCBYTE;

                     count : Win32.Size_T)

                    return Win32.PBYTE;           --  mbstring.h:88



   function mbsnccnt (string : Win32.PCBYTE;

                      n : Win32.Size_T)

                     return Win32.Size_T;          --  mbstring.h:90



   function mbsncmp (string1 : Win32.PCBYTE;

                     string2 : Win32.PCBYTE;

                     count : Win32.Size_T)

                    return Win32.INT;             --  mbstring.h:91



   function mbsncpy (string1 : Win32.PBYTE;

                     string2 : Win32.PCBYTE;

                     count : Win32.Size_T)

                    return Win32.PBYTE;           --  mbstring.h:93



   function mbsnextc (string : Win32.PCBYTE) return Win32.UINT;

   --  mbstring.h:95



   function mbsnicmp (string1 : Win32.PCBYTE;

                      string2 : Win32.PCBYTE;

                      count : Win32.Size_T)

                     return Win32.INT;            --  mbstring.h:96



   function mbsninc (string : Win32.PCBYTE;

                     count : Win32.Size_T)

                    return Win32.PBYTE;            --  mbstring.h:98



   function mbsnset (string : Win32.PBYTE;

                     ch : Win32.UINT;

                     count : Win32.Size_T)

                    return Win32.PBYTE;            --  mbstring.h:99



   function mbspbrk (string1 : Win32.PCBYTE;

                     string2 : Win32.PCBYTE)

                    return Win32.PBYTE;           --  mbstring.h:101



   function mbsrchr (string : Win32.PCBYTE;

                     ch : Win32.UINT)

                    return Win32.PBYTE;            --  mbstring.h:103



   function mbsrev (string : Win32.PBYTE) return Win32.PBYTE;

   --  mbstring.h:104



   function mbsset (string : Win32.PBYTE;

                    ch : Win32.UINT)

                   return Win32.PBYTE;             --  mbstring.h:105



   function mbsspn (string1 : Win32.PCBYTE;

                    string2 : Win32.PCBYTE)

                   return Win32.Size_T;

   --  mbstring.h:106



   function mbsspnp (string1 : Win32.PCBYTE;

                     string2 : Win32.PCBYTE)

                    return Win32.PBYTE;           --  mbstring.h:108



   function mbsstr (string1 : Win32.PCBYTE;

                    string2 : Win32.PCBYTE)

                   return Win32.PBYTE;            --  mbstring.h:110



   function mbstok (string1 : Win32.PBYTE;

                    string2 : Win32.PCBYTE)

                   return Win32.PBYTE;            --  mbstring.h:112



   function mbsupr (string : Win32.PBYTE) return Win32.PBYTE;

   --  mbstring.h:114



   function mbclen (c : Win32.PCBYTE) return Win32.Size_T;

   --  mbstring.h:117



   procedure mbccpy (dest : Win32.PBYTE;

                     src : Win32.PCBYTE);                   --  mbstring.h:118



   function mbccmp (cpc1, cpc2 : Win32.PCBYTE) return Win32.INT;

   --  mbstring.h:119



   function ismbcalpha (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:123



   function ismbcdigit (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:124



   function ismbclegal (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:125



   function ismbclower (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:126



   function ismbcprint (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:127



   function ismbcspace (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:128



   function ismbcupper (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:129



   function mbctolower (ch : Win32.UINT) return Win32.UINT;  --  mbstring.h:131



   function mbctoupper (ch : Win32.UINT) return Win32.UINT;  --  mbstring.h:132



   function ismbblead (ch : Win32.UINT) return Win32.INT;    --  mbstring.h:138



   function ismbbtrail (ch : Win32.UINT) return Win32.INT;   --  mbstring.h:139



   function ismbslead (string : Win32.PCBYTE;

                       current : Win32.PCBYTE)

                      return Win32.INT;           --  mbstring.h:140



   function ismbstrail (string : Win32.PCBYTE;

                        current : Win32.PCBYTE)

                       return Win32.INT;          --  mbstring.h:142



   function ismbchira (ch : Win32.UINT) return Win32.INT;    --  mbstring.h:150



   function ismbckata (ch : Win32.UINT) return Win32.INT;    --  mbstring.h:151



   function ismbcsymbol (ch : Win32.UINT) return Win32.INT;  --  mbstring.h:152



   function ismbcl0 (ch : Win32.UINT) return Win32.INT;      --  mbstring.h:153



   function ismbcl1 (ch : Win32.UINT) return Win32.INT;      --  mbstring.h:154



   function ismbcl2 (ch : Win32.UINT) return Win32.INT;      --  mbstring.h:155



   function mbcjistojms (ch : Win32.UINT) return Win32.UINT; --  mbstring.h:156



   function mbcjmstojis (ch : Win32.UINT) return Win32.UINT; --  mbstring.h:157



   function mbctohira (ch : Win32.UINT) return Win32.UINT;   --  mbstring.h:158



   function mbctokata (ch : Win32.UINT) return Win32.UINT;   --  mbstring.h:159



private



   pragma Inline (mbccmp);

   pragma Import (C, mbbtombc, "_mbbtombc");                --  mbstring.h:56

   pragma Import (C, mbbtype, "_mbbtype");                  --  mbstring.h:57

   pragma Import (C, mbctombb, "_mbctombb");                --  mbstring.h:58

   pragma Import (C, mbsbtype, "_mbsbtype");                --  mbstring.h:59

   pragma Import (C, mbscat, "_mbscat");                    --  mbstring.h:60

   pragma Import (C, mbschr, "_mbschr");                    --  mbstring.h:62

   pragma Import (C, mbscmp, "_mbscmp");                    --  mbstring.h:63

   pragma Import (C, mbscpy, "_mbscpy");                    --  mbstring.h:65

   pragma Import (C, mbscspn, "_mbscspn");                  --  mbstring.h:67

   pragma Import (C, mbsdec, "_mbsdec");                    --  mbstring.h:69

   pragma Import (C, mbsdup, "_mbsdup");                    --  mbstring.h:71

   pragma Import (C, mbsicmp, "_mbsicmp");                  --  mbstring.h:72

   pragma Import (C, mbsinc, "_mbsinc");                    --  mbstring.h:74

   pragma Import (C, mbslen, "_mbslen");                    --  mbstring.h:75

   pragma Import (C, mbslwr, "_mbslwr");                    --  mbstring.h:76

   pragma Import (C, mbsnbcat, "_mbsnbcat");                --  mbstring.h:77

   pragma Import (C, mbsnbcmp, "_mbsnbcmp");                --  mbstring.h:79

   pragma Import (C, mbsnbcnt, "_mbsnbcnt");                --  mbstring.h:81

   pragma Import (C, mbsnbcpy, "_mbsnbcpy");                --  mbstring.h:82

   pragma Import (C, mbsnbicmp, "_mbsnbicmp");              --  mbstring.h:84

   pragma Import (C, mbsnbset, "_mbsnbset");                --  mbstring.h:86

   pragma Import (C, mbsncat, "_mbsncat");                  --  mbstring.h:88

   pragma Import (C, mbsnccnt, "_mbsnccnt");                --  mbstring.h:90

   pragma Import (C, mbsncmp, "_mbsncmp");                  --  mbstring.h:91

   pragma Import (C, mbsncpy, "_mbsncpy");                  --  mbstring.h:93

   pragma Import (C, mbsnextc, "_mbsnextc");                --  mbstring.h:95

   pragma Import (C, mbsnicmp, "_mbsnicmp");                --  mbstring.h:96

   pragma Import (C, mbsninc, "_mbsninc");                  --  mbstring.h:98

   pragma Import (C, mbsnset, "_mbsnset");                  --  mbstring.h:99

   pragma Import (C, mbspbrk, "_mbspbrk");                  --  mbstring.h:101

   pragma Import (C, mbsrchr, "_mbsrchr");                  --  mbstring.h:103

   pragma Import (C, mbsrev, "_mbsrev");                    --  mbstring.h:104

   pragma Import (C, mbsset, "_mbsset");                    --  mbstring.h:105

   pragma Import (C, mbsspn, "_mbsspn");                    --  mbstring.h:106

   pragma Import (C, mbsspnp, "_mbsspnp");                  --  mbstring.h:108

   pragma Import (C, mbsstr, "_mbsstr");                    --  mbstring.h:110

   pragma Import (C, mbstok, "_mbstok");                    --  mbstring.h:112

   pragma Import (C, mbsupr, "_mbsupr");                    --  mbstring.h:114

   pragma Import (C, mbclen, "_mbclen");                    --  mbstring.h:117

   pragma Import (C, mbccpy, "_mbccpy");                    --  mbstring.h:118

   pragma Import (C, ismbcalpha, "_ismbcalpha");            --  mbstring.h:123

   pragma Import (C, ismbcdigit, "_ismbcdigit");            --  mbstring.h:124

   pragma Import (C, ismbclegal, "_ismbclegal");            --  mbstring.h:125

   pragma Import (C, ismbclower, "_ismbclower");            --  mbstring.h:126

   pragma Import (C, ismbcprint, "_ismbcprint");            --  mbstring.h:127

   pragma Import (C, ismbcspace, "_ismbcspace");            --  mbstring.h:128

   pragma Import (C, ismbcupper, "_ismbcupper");            --  mbstring.h:129

   pragma Import (C, mbctolower, "_mbctolower");            --  mbstring.h:131

   pragma Import (C, mbctoupper, "_mbctoupper");            --  mbstring.h:132

   pragma Import (C, ismbblead, "_ismbblead");              --  mbstring.h:138

   pragma Import (C, ismbbtrail, "_ismbbtrail");            --  mbstring.h:139

   pragma Import (C, ismbslead, "_ismbslead");              --  mbstring.h:140

   pragma Import (C, ismbstrail, "_ismbstrail");            --  mbstring.h:142

   pragma Import (C, ismbchira, "_ismbchira");              --  mbstring.h:150

   pragma Import (C, ismbckata, "_ismbckata");              --  mbstring.h:151

   pragma Import (C, ismbcsymbol, "_ismbcsymbol");          --  mbstring.h:152

   pragma Import (C, ismbcl0, "_ismbcl0");                  --  mbstring.h:153

   pragma Import (C, ismbcl1, "_ismbcl1");                  --  mbstring.h:154

   pragma Import (C, ismbcl2, "_ismbcl2");                  --  mbstring.h:155

   pragma Import (C, mbcjistojms, "_mbcjistojms");          --  mbstring.h:156

   pragma Import (C, mbcjmstojis, "_mbcjmstojis");          --  mbstring.h:157

   pragma Import (C, mbctohira, "_mbctohira");              --  mbstring.h:158

   pragma Import (C, mbctokata, "_mbctokata");              --  mbstring.h:159



end Win32.crt.Mbstring;





