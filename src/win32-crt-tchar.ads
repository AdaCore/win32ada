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

with Win32.crt.Ctype;
with Win32.crt.Stdio;
with Win32.crt.Stdlib;
with Win32.crt.Strings;
with Stdarg;

package Win32.crt.Tchar is

   TEOF : constant := -1;                           --  tchar.h:421
   istlegal : constant := 1;                            --  tchar.h:505

   type TCHAR is new Win32.CHAR;                               --  tchar.h:409
   type TINT is new Win32.INT;                                 --  tchar.h:410


   function ftcscat (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR)
                    return Win32.PSTR
     renames Win32.crt.Strings.strcat;       --  tchar.h:42

   function ftcschr (string1 : Win32.PCSTR;
                     c : Win32.INT)
                    return Win32.PSTR
     renames Win32.crt.Strings.strchr;       --  tchar.h:43

   function ftcscmp (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.INT
     renames Win32.crt.Strings.strcmp;       --  tchar.h:44



   function ftcscpy (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR)
                    return Win32.PSTR
     renames Win32.crt.Strings.strcpy;       --  tchar.h:45

   function ftcscspn (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR)
                     return Win32.Size_T
     renames Win32.crt.Strings.strcspn;      --  tchar.h:46


   function ftcslen (string1 : Win32.PCSTR) return Win32.Size_T
     renames Win32.crt.Strings.strlen;       --  tchar.h:47

   function ftcsncat (string1 : Win32.PSTR;
                      string2 : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.PSTR
     renames Win32.crt.Strings.strncat;      --  tchar.h:48

   function ftcsncmp (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.INT
     renames Win32.crt.Strings.strncmp;      --  tchar.h:49

   function ftcsncpy (string1 : Win32.PSTR;
                      string2 : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.PSTR
     renames Win32.crt.Strings.strncpy;      --  tchar.h:50


   function ftcspbrk (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR)
                     return Win32.PSTR
     renames Win32.crt.Strings.strpbrk;      --  tchar.h:51

   function ftcsrchr (string1 : Win32.PCSTR;
                      c : Win32.INT)
                     return Win32.PSTR
     renames Win32.crt.Strings.strrchr;      --  tchar.h:52


   function ftcsspn (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.Size_T
     renames Win32.crt.Strings.strspn;       --  tchar.h:53

   function ftcsstr (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.PSTR
     renames Win32.crt.Strings.strstr;       --  tchar.h:54

   function ftcstok (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR)
                    return Win32.PSTR
     renames Win32.crt.Strings.strtok;       --  tchar.h:55

   function ftcsdup (string1 : Win32.PCSTR) return Win32.PSTR
     renames Win32.crt.Strings.strdup;       --  tchar.h:57

   function ftcsicmp (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR)
                     return Win32.INT
     renames Win32.crt.Strings.stricmp;      --  tchar.h:58

   function ftcsnicmp (string1 : Win32.PCSTR;
                       string2 : Win32.PCSTR;
                       count : Win32.Size_T)
                      return Win32.INT
     renames Win32.crt.Strings.strnicmp;     --  tchar.h:59

   function ftcsnset (string1 : Win32.PSTR;
                      c : Win32.INT;
                      count : Win32.Size_T)
                     return Win32.PSTR
     renames Win32.crt.Strings.strnset;      --  tchar.h:60

   function ftcsrev (string1 : Win32.PSTR) return Win32.PSTR
     renames Win32.crt.Strings.strrev;       --  tchar.h:61

   function ftcsset (string1 : Win32.PSTR;
                     c : Win32.INT)
                    return Win32.PSTR
     renames Win32.crt.Strings.strset;       --  tchar.h:62

   function ftcsclen (string1 : Win32.PCSTR) return Win32.Size_T
     renames Win32.crt.Strings.strlen;       --  tchar.h:67

   function ftcsnccat (string1 : Win32.PSTR;
                       string2 : Win32.PCSTR;
                       count : Win32.Size_T)
                      return Win32.PSTR
     renames Win32.crt.Strings.strncat;      --  tchar.h:68

   function ftcsnccpy (string1 : Win32.PSTR;
                       string2 : Win32.PCSTR;
                       count : Win32.Size_T)
                      return Win32.PSTR
     renames Win32.crt.Strings.strncpy;      --  tchar.h:69

   function ftcsnccmp (string1 : Win32.PCSTR;
                       string2 : Win32.PCSTR;
                       count : Win32.Size_T)
                      return Win32.INT
     renames Win32.crt.Strings.strncmp;      --  tchar.h:70

   function ftcsncicmp (string1 : Win32.PCSTR;
                        string2 : Win32.PCSTR;
                        count : Win32.Size_T)
                       return Win32.INT
     renames Win32.crt.Strings.strnicmp;   --  tchar.h:71

   function ftcsncset (string1 : Win32.PSTR;
                       c : Win32.INT;
                       count : Win32.Size_T)
                      return Win32.PSTR
     renames Win32.crt.Strings.strnset;     --  tchar.h:72


   function tprintf
     (format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.printf;                         --  tchar.h:269

   function ftprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.fprintf;                        --  tchar.h:270

   function stprintf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.sprintf;                        --  tchar.h:271

   function sntprintf
     (buffer : Win32.PSTR;
      count : Win32.Size_T;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.snprintf;                       --  tchar.h:272

   function vtprintf
     (format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.vprintf;                        --  tchar.h:273

   function vftprintf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.vfprintf;                       --  tchar.h:274

   function vstprintf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.vsprintf;                       --  tchar.h:275

   function vsntprintf
     (buffer : Win32.PSTR;
      count : Win32.Size_T;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.vsnprintf;                      --  tchar.h:276

   function tscanf
     (format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.scanf;                          --  tchar.h:277

   function ftscanf
     (stream : Win32.crt.Stdio.FILE_Access;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.fscanf;                         --  tchar.h:278

   function stscanf
     (buffer : Win32.PSTR;
      format : Win32.PCSTR;
      args : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
     renames Win32.crt.Stdio.sscanf;                         --  tchar.h:279

   function fgettc
     (f : in Win32.crt.Stdio.FILE_Access) return Win32.INT    --  tchar.h:284
     renames Win32.crt.Stdio.fgetc;

   function fgettchar return Win32.INT                         --  tchar.h:285
     renames Win32.crt.Stdio.fgetchar;

   function fgetts
     (s : in Win32.PSTR;
      i : in Win32.INT;
      f : in Win32.crt.Stdio.FILE_Access) return Win32.PSTR   --  tchar.h:286
     renames Win32.crt.Stdio.fgets;

   function fputtc
     (i : in Win32.INT;
      f : in Win32.crt.Stdio.FILE_Access)
     return Win32.INT                                        --  tchar.h:287
     renames Win32.crt.Stdio.fputc;

   function fputtchar
     (i : in Win32.INT) return Win32.INT                      --  tchar.h:288
     renames Win32.crt.Stdio.fputchar;

   function fputts
     (s : Win32.PCSTR;
      f : in Win32.crt.Stdio.FILE_Access) return Win32.INT    --  tchar.h:289
     renames Win32.crt.Stdio.fputs;

   function gettc (f : in Win32.crt.Stdio.FILE_Access) return Win32.INT
   --  tchar.h:290
     renames Win32.crt.Stdio.getc;

   function gettchar return Win32.INT                          --  tchar.h:291
     renames Win32.crt.Stdio.getchar;

   function puttc
     (i : in Win32.INT;
      f : in Win32.crt.Stdio.FILE_Access)
     return Win32.INT                                        --  tchar.h:292
     renames Win32.crt.Stdio.putc;

   function puttchar
     (i : in Win32.INT) return Win32.INT                      --  tchar.h:293
     renames Win32.crt.Stdio.putchar;

   function ungettc
     (i : in Win32.INT;
      f : in Win32.crt.Stdio.FILE_Access)
     return Win32.INT                                        --  tchar.h:294
     renames Win32.crt.Stdio.ungetc;



   function tcstod (nptr : Win32.PCSTR;
                    endptr : access Win32.PSTR)
                   return Win32.DOUBLE
     renames Win32.crt.Stdlib.strtod;        --  tchar.h:299

   function tcstol (nptr : Win32.PCSTR;
                    endptr : access Win32.PSTR;
                    base : Win32.INT)
                   return Win32.INT
     renames Win32.crt.Stdlib.strtol;        --  tchar.h:300

   function tcstoul (nptr : Win32.PCSTR;
                     endptr : access Win32.PSTR;
                     base : Win32.INT)
                    return Win32.UINT
     renames Win32.crt.Stdlib.strtoul;      --  tchar.h:301

   function tcscat (string1 : Win32.PSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR
     renames Win32.crt.Strings.strcat;       --  tchar.h:426

   function tcschr (string1 : Win32.PCSTR;
                    c : Win32.INT)
                   return Win32.PSTR
     renames Win32.crt.Strings.strchr;       --  tchar.h:427

   function tcscmp (string1 : Win32.PCSTR;
                    string2 : Win32.PCSTR)
                   return Win32.INT
     renames Win32.crt.Strings.strcmp;       --  tchar.h:428



   function tcscpy (string1 : Win32.PSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR
     renames Win32.crt.Strings.strcpy;       --  tchar.h:429

   function tcscspn (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.Size_T
     renames Win32.crt.Strings.strcspn;      --  tchar.h:430


   function tcslen (string1 : Win32.PCSTR) return Win32.Size_T
     renames Win32.crt.Strings.strlen;       --  tchar.h:431

   function tcsncat (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR;
                     count : Win32.Size_T)
                    return Win32.PSTR
     renames Win32.crt.Strings.strncat;      --  tchar.h:432

   function tcsncmp (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR;
                     count : Win32.Size_T)
                    return Win32.INT
     renames Win32.crt.Strings.strncmp;      --  tchar.h:433

   function tcsncpy (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR;
                     count : Win32.Size_T)
                    return Win32.PSTR
     renames Win32.crt.Strings.strncpy;      --  tchar.h:434


   function tcspbrk (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.PSTR
     renames Win32.crt.Strings.strpbrk;      --  tchar.h:435

   function tcsrchr (string1 : Win32.PCSTR;
                     c : Win32.INT)
                    return Win32.PSTR
     renames Win32.crt.Strings.strrchr;      --  tchar.h:436


   function tcsspn (string1 : Win32.PCSTR;
                    string2 : Win32.PCSTR)
                   return Win32.Size_T
     renames Win32.crt.Strings.strspn;       --  tchar.h:437

   function tcsstr (string1 : Win32.PCSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR
     renames Win32.crt.Strings.strstr;       --  tchar.h:438

   function tcstok (string1 : Win32.PSTR;
                    string2 : Win32.PCSTR)
                   return Win32.PSTR
     renames Win32.crt.Strings.strtok;       --  tchar.h:439

   function tcsdup (string1 : Win32.PCSTR) return Win32.PSTR
     renames Win32.crt.Strings.strdup;       --  tchar.h:441

   function tcsicmp (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.INT
     renames Win32.crt.Strings.stricmp;      --  tchar.h:442

   function tcsnicmp (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.INT
     renames Win32.crt.Strings.strnicmp;     --  tchar.h:443

   function tcsnset (string1 : Win32.PSTR;
                     c : Win32.INT;
                     count : Win32.Size_T)
                    return Win32.PSTR
     renames Win32.crt.Strings.strnset;      --  tchar.h:444

   function tcsrev (string1 : Win32.PSTR) return Win32.PSTR
     renames Win32.crt.Strings.strrev;       --  tchar.h:445

   function tcsset (string1 : Win32.PSTR;
                    c : Win32.INT)
                   return Win32.PSTR
     renames Win32.crt.Strings.strset;       --  tchar.h:446


   function tcsclen (string1 : Win32.PCSTR) return Win32.Size_T
     renames Win32.crt.Strings.strlen;       --  tchar.h:451

   function tcsnccat (string1 : Win32.PSTR;
                      string2 : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.PSTR
     renames Win32.crt.Strings.strncat;      --  tchar.h:452

   function tcsnccpy (string1 : Win32.PSTR;
                      string2 : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.PSTR
     renames Win32.crt.Strings.strncpy;      --  tchar.h:453

   function tcsnccmp (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR;
                      count : Win32.Size_T)
                     return Win32.INT
     renames Win32.crt.Strings.strncmp;      --  tchar.h:454

   function tcsncicmp (string1 : Win32.PCSTR;
                       string2 : Win32.PCSTR;
                       count : Win32.Size_T)
                      return Win32.INT
     renames Win32.crt.Strings.strnicmp;     --  tchar.h:455

   function tcsncset (string1 : Win32.PSTR;
                      c : Win32.INT;
                      count : Win32.Size_T)
                     return Win32.PSTR
     renames Win32.crt.Strings.strnset;      --  tchar.h:456


   function tcslwr (string1 : Win32.PSTR) return Win32.PSTR
     renames Win32.crt.Strings.strlwr;       --  tchar.h:469

   function tcsupr (string1 : Win32.PSTR) return Win32.PSTR
     renames Win32.crt.Strings.strupr;       --  tchar.h:470

   function tcsxfrm (string1 : Win32.PSTR;
                     string2 : Win32.PCSTR;
                     count : Win32.Size_T)
                    return Win32.Size_T
     renames Win32.crt.Strings.strxfrm;      --  tchar.h:471

   function tcscoll (string1 : Win32.PCSTR;
                     string2 : Win32.PCSTR)
                    return Win32.INT
     renames Win32.crt.Strings.strcoll;      --  tchar.h:472

   function tcsicoll (string1 : Win32.PCSTR;
                      string2 : Win32.PCSTR)
                     return Win32.INT
     renames Win32.crt.Strings.stricoll;     --  tchar.h:473

   function tclen (cpc : Win32.PCCH)
                  return Win32.Size_T;                          --  tchar.h:481

   procedure tccpy (pc1 : in out Win32.PCHAR;
                    cpc2 : Win32.PCCH);                         --  tchar.h:482

   function tccmp (cpc1 : Win32.PCCH;
                   cpc2 : Win32.PCCH)
                  return Win32.INT;                            --  tchar.h:483

   function istalpha (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isalpha;                        --  tchar.h:489

   function istupper (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isupper;                        --  tchar.h:490

   function istlower (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.islower;                        --  tchar.h:491

   function istdigit (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isdigit;                        --  tchar.h:492

   function istxdigit (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isxdigit;                       --  tchar.h:493

   function istspace (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isspace;                        --  tchar.h:494

   function istpunct (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.ispunct;                        --  tchar.h:495

   function istalnum (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isalnum;                        --  tchar.h:496

   function istprint (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isprint;                        --  tchar.h:497

   function istgraph (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isgraph;                        --  tchar.h:498

   function istcntrl (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.iscntrl;                        --  tchar.h:499

   function istascii (c : in Win32.crt.Ctype.char) return Win32.INT
     renames Win32.crt.Ctype.isascii;                        --  tchar.h:500


   function totupper (c : Win32.crt.Ctype.char)
                     return Win32.crt.Ctype.char              --  tchar.h: 502
     renames Win32.crt.Ctype.toupper;

   function totlower (c : Win32.crt.Ctype.char)
                     return Win32.crt.Ctype.char              --  tchar.h: 503
     renames Win32.crt.Ctype.tolower;

   function strdec (cpc : Win32.PCCH;
                    pc : Win32.PCCH)
                   return Win32.PCHAR;                     --  tchar.h: 529

   function strinc (pc : Win32.PCCH)
                   return Win32.PCHAR;                     --  tchar.h: 530

   function strnextc (cpc : Win32.PCCH)
                     return Win32.UINT;                      --  tchar.h: 531

   function strninc (pc : Win32.PCCH;
                     sz : Win32.Size_T)
                    return Win32.PCHAR;                    --  tchar.h: 532

   function strncnt (cpc : Win32.PCCH;
                     sz : Win32.Size_T)
                    return Win32.Size_T;                        --  tchar.h:533

   procedure strspnp (cpc1 : in out Win32.PCCH;
                      cpc2 : in Win32.PCCH;
                      crv : out Win32.PCCH);                --  tchar.h: 534


   function tcsdec (cpc : Win32.PCCH;
                    pc : Win32.PCCH)
                   return Win32.PCHAR                      --  tchar.h: 461
     renames strdec;

   function tcsinc (pc : Win32.PCCH)
                   return Win32.PCHAR                      --  tchar.h: 462
     renames strinc;

   function tcsnbcnt (cpc : Win32.PCCH;
                      sz : Win32.Size_T)
                     return Win32.Size_T                   --  tchar.h:463
     renames strncnt;

   function tcsnccnt (cpc : Win32.PCCH;
                      sz : Win32.Size_T)
                     return Win32.Size_T                   --  tchar.h:464
     renames strncnt;

   function tcsnextc (cpc : Win32.PCCH)
                     return Win32.UINT                       --  tchar.h: 465
     renames strnextc;

   function tcsninc (pc : Win32.PCCH;
                     sz : Win32.Size_T)
                    return Win32.PCHAR                     --  tchar.h: 466
     renames strninc;

   procedure tcsspnp (cpc1 : in out Win32.PCCH;
                      cpc2 : in Win32.PCCH;
                      crv : out Win32.PCCH)                 --  tchar.h: 467
     renames strspnp;

   function ftcsdec (cpc : Win32.PCCH;
                     pc : Win32.PCCH)
                    return Win32.PCHAR                     --  tchar.h: 74
     renames tcsdec;

   function ftcsinc (pc : Win32.PCCH)
                    return Win32.PCHAR                      --  tchar.h: 75
     renames tcsinc;

   function ftcsnbcnt (cpc : Win32.PCCH;
                       sz : Win32.Size_T)
                      return Win32.Size_T                  --  tchar.h:76
     renames tcsnbcnt;

   function ftcsnccnt (cpc : Win32.PCCH;
                       sz : Win32.Size_T)
                      return Win32.Size_T                  --  tchar.h:77
     renames tcsnccnt;

   function ftcsnextc (cpc : Win32.PCCH)
                      return Win32.UINT                       --  tchar.h: 78
     renames tcsnextc;

   function ftcsninc (pc : Win32.PCCH;
                      sz : Win32.Size_T)
                     return Win32.PCHAR                     --  tchar.h: 79
     renames tcsninc;

   procedure ftcsspnp (cpc1 : in out Win32.PCCH;
                       cpc2 : in Win32.PCCH;
                       crv : out Win32.PCCH)                --  tchar.h: 80
     renames strspnp;

   function ftcslwr (string1 : Win32.PSTR) return Win32.PSTR
     renames tcslwr;                    --  tchar.h:82

   function ftcsupr (string1 : Win32.PSTR) return Win32.PSTR
     renames tcsupr;                    --  tchar.h:83

   function ftclen (cpc : Win32.PCCH)
                   return Win32.Size_T
     renames tclen;                             --  tchar.h:85

   procedure ftccpy (pc1 : in out Win32.PCHAR;
                     cpc2 : Win32.PCCH)
     renames tccpy;                             --  tchar.h:86

   function ftccmp (cpc1 : Win32.PCCH;
                    cpc2 : Win32.PCCH)
                   return Win32.INT
     renames tccmp;                             --  tchar.h: 87

   function T (x : Win32.PSTR) return Win32.PSTR;           --  tchar.h: 546

   function TEXT (x : Win32.PSTR) return Win32.PSTR
     renames T;                                          --  tchar.h: 547

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


