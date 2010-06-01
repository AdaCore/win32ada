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

with Win32.Winbase;
with Win32.Winnt;

package Win32.Winnls is

   MAX_LEADBYTES               : constant := 12;
   MAX_DEFAULTCHAR             : constant := 2;
   MB_PRECOMPOSED              : constant := 16#1#;
   MB_COMPOSITE                : constant := 16#2#;
   MB_USEGLYPHCHARS            : constant := 16#4#;
   MB_ERR_INVALID_CHARS        : constant := 16#8#;
   WC_DEFAULTCHECK             : constant := 16#100#;
   WC_COMPOSITECHECK           : constant := 16#200#;
   WC_DISCARDNS                : constant := 16#10#;
   WC_SEPCHARS                 : constant := 16#20#;
   WC_DEFAULTCHAR              : constant := 16#40#;
   CT_CTYPE1                   : constant := 16#1#;
   CT_CTYPE2                   : constant := 16#2#;
   CT_CTYPE3                   : constant := 16#4#;
   C1_UPPER                    : constant := 16#1#;
   C1_LOWER                    : constant := 16#2#;
   C1_DIGIT                    : constant := 16#4#;
   C1_SPACE                    : constant := 16#8#;
   C1_PUNCT                    : constant := 16#10#;
   C1_CNTRL                    : constant := 16#20#;
   C1_BLANK                    : constant := 16#40#;
   C1_XDIGIT                   : constant := 16#80#;
   C1_ALPHA                    : constant := 16#100#;
   C2_LEFTTORIGHT              : constant := 16#1#;
   C2_RIGHTTOLEFT              : constant := 16#2#;
   C2_EUROPENUMBER             : constant := 16#3#;
   C2_EUROPESEPARATOR          : constant := 16#4#;
   C2_EUROPETERMINATOR         : constant := 16#5#;
   C2_ARABICNUMBER             : constant := 16#6#;
   C2_COMMONSEPARATOR          : constant := 16#7#;
   C2_BLOCKSEPARATOR           : constant := 16#8#;
   C2_SEGMENTSEPARATOR         : constant := 16#9#;
   C2_WHITESPACE               : constant := 16#a#;
   C2_OTHERNEUTRAL             : constant := 16#b#;
   C2_NOTAPPLICABLE            : constant := 16#0#;
   C3_NONSPACING               : constant := 16#1#;
   C3_DIACRITIC                : constant := 16#2#;
   C3_VOWELMARK                : constant := 16#4#;
   C3_SYMBOL                   : constant := 16#8#;
   C3_KATAKANA                 : constant := 16#10#;
   C3_HIRAGANA                 : constant := 16#20#;
   C3_HALFWIDTH                : constant := 16#40#;
   C3_FULLWIDTH                : constant := 16#80#;
   C3_IDEOGRAPH                : constant := 16#100#;
   C3_KASHIDA                  : constant := 16#200#;
   C3_LEXICAL                  : constant := 16#400#;
   C3_ALPHA                    : constant := 16#8000#;
   C3_NOTAPPLICABLE            : constant := 16#0#;
   NORM_IGNORECASE             : constant := 16#1#;
   NORM_IGNORENONSPACE         : constant := 16#2#;
   NORM_IGNORESYMBOLS          : constant := 16#4#;
   NORM_IGNOREKANATYPE         : constant := 16#10000#;
   NORM_IGNOREWIDTH            : constant := 16#20000#;
   MAP_FOLDCZONE               : constant := 16#10#;
   MAP_PRECOMPOSED             : constant := 16#20#;
   MAP_COMPOSITE               : constant := 16#40#;
   MAP_FOLDDIGITS              : constant := 16#80#;
   LCMAP_LOWERCASE             : constant := 16#100#;
   LCMAP_UPPERCASE             : constant := 16#200#;
   LCMAP_SORTKEY               : constant := 16#400#;
   LCMAP_BYTEREV               : constant := 16#800#;
   LCMAP_HIRAGANA              : constant := 16#100000#;
   LCMAP_KATAKANA              : constant := 16#200000#;
   LCMAP_HALFWIDTH             : constant := 16#400000#;
   LCMAP_FULLWIDTH             : constant := 16#800000#;
   LCID_INSTALLED              : constant := 16#1#;
   LCID_SUPPORTED              : constant := 16#2#;
   CP_INSTALLED                : constant := 16#1#;
   CP_SUPPORTED                : constant := 16#2#;
   SORT_STRINGSORT             : constant := 16#1000#;
   CP_ACP                      : constant := 0;
   CP_OEMCP                    : constant := 1;
   CP_MACCP                    : constant := 2;
   CTRY_DEFAULT                : constant := 0;
   CTRY_AUSTRALIA              : constant := 61;
   CTRY_AUSTRIA                : constant := 43;
   CTRY_BELGIUM                : constant := 32;
   CTRY_BRAZIL                 : constant := 55;
   CTRY_BULGARIA               : constant := 359;
   CTRY_CANADA                 : constant := 2;
   CTRY_CROATIA                : constant := 385;
   CTRY_CZECH                  : constant := 42;
   CTRY_DENMARK                : constant := 45;
   CTRY_FINLAND                : constant := 358;
   CTRY_FRANCE                 : constant := 33;
   CTRY_GERMANY                : constant := 49;
   CTRY_GREECE                 : constant := 30;
   CTRY_HONG_KONG              : constant := 852;
   CTRY_HUNGARY                : constant := 36;
   CTRY_ICELAND                : constant := 354;
   CTRY_IRELAND                : constant := 353;
   CTRY_ITALY                  : constant := 39;
   CTRY_JAPAN                  : constant := 81;
   CTRY_MEXICO                 : constant := 52;
   CTRY_NETHERLANDS            : constant := 31;
   CTRY_NEW_ZEALAND            : constant := 64;
   CTRY_NORWAY                 : constant := 47;
   CTRY_POLAND                 : constant := 48;
   CTRY_PORTUGAL               : constant := 351;
   CTRY_PRCHINA                : constant := 86;
   CTRY_ROMANIA                : constant := 40;
   CTRY_RUSSIA                 : constant := 7;
   CTRY_SINGAPORE              : constant := 65;
   CTRY_SLOVAK                 : constant := 42;
   CTRY_SLOVENIA               : constant := 386;
   CTRY_SOUTH_KOREA            : constant := 82;
   CTRY_SPAIN                  : constant := 34;
   CTRY_SWEDEN                 : constant := 46;
   CTRY_SWITZERLAND            : constant := 41;
   CTRY_TAIWAN                 : constant := 886;
   CTRY_TURKEY                 : constant := 90;
   CTRY_UNITED_KINGDOM         : constant := 44;
   CTRY_UNITED_STATES          : constant := 1;
   LOCALE_NOUSEROVERRIDE       : constant := 16#80000000#;
   LOCALE_USE_CP_ACP           : constant := 16#40000000#;
   LOCALE_ILANGUAGE            : constant := 16#1#;
   LOCALE_SLANGUAGE            : constant := 16#2#;
   LOCALE_SENGLANGUAGE         : constant := 16#1001#;
   LOCALE_SABBREVLANGNAME      : constant := 16#3#;
   LOCALE_SNATIVELANGNAME      : constant := 16#4#;
   LOCALE_ICOUNTRY             : constant := 16#5#;
   LOCALE_SCOUNTRY             : constant := 16#6#;
   LOCALE_SENGCOUNTRY          : constant := 16#1002#;
   LOCALE_SABBREVCTRYNAME      : constant := 16#7#;
   LOCALE_SNATIVECTRYNAME      : constant := 16#8#;
   LOCALE_IDEFAULTLANGUAGE     : constant := 16#9#;
   LOCALE_IDEFAULTCOUNTRY      : constant := 16#a#;
   LOCALE_IDEFAULTCODEPAGE     : constant := 16#b#;
   LOCALE_IDEFAULTANSICODEPAGE : constant := 16#1004#;
   LOCALE_SLIST                : constant := 16#c#;
   LOCALE_IMEASURE             : constant := 16#d#;
   LOCALE_SDECIMAL             : constant := 16#e#;
   LOCALE_STHOUSAND            : constant := 16#f#;
   LOCALE_SGROUPING            : constant := 16#10#;
   LOCALE_IDIGITS              : constant := 16#11#;
   LOCALE_ILZERO               : constant := 16#12#;
   LOCALE_INEGNUMBER           : constant := 16#1010#;
   LOCALE_SNATIVEDIGITS        : constant := 16#13#;
   LOCALE_SCURRENCY            : constant := 16#14#;
   LOCALE_SINTLSYMBOL          : constant := 16#15#;
   LOCALE_SMONDECIMALSEP       : constant := 16#16#;
   LOCALE_SMONTHOUSANDSEP      : constant := 16#17#;
   LOCALE_SMONGROUPING         : constant := 16#18#;
   LOCALE_ICURRDIGITS          : constant := 16#19#;
   LOCALE_IINTLCURRDIGITS      : constant := 16#1a#;
   LOCALE_ICURRENCY            : constant := 16#1b#;
   LOCALE_INEGCURR             : constant := 16#1c#;
   LOCALE_SDATE                : constant := 16#1d#;
   LOCALE_STIME                : constant := 16#1e#;
   LOCALE_SSHORTDATE           : constant := 16#1f#;
   LOCALE_SLONGDATE            : constant := 16#20#;
   LOCALE_STIMEFORMAT          : constant := 16#1003#;
   LOCALE_IDATE                : constant := 16#21#;
   LOCALE_ILDATE               : constant := 16#22#;
   LOCALE_ITIME                : constant := 16#23#;
   LOCALE_ITIMEMARKPOSN        : constant := 16#1005#;
   LOCALE_ICENTURY             : constant := 16#24#;
   LOCALE_ITLZERO              : constant := 16#25#;
   LOCALE_IDAYLZERO            : constant := 16#26#;
   LOCALE_IMONLZERO            : constant := 16#27#;
   LOCALE_S1159                : constant := 16#28#;
   LOCALE_S2359                : constant := 16#29#;
   LOCALE_ICALENDARTYPE        : constant := 16#1009#;
   LOCALE_IOPTIONALCALENDAR    : constant := 16#100b#;
   LOCALE_IFIRSTDAYOFWEEK      : constant := 16#100c#;
   LOCALE_IFIRSTWEEKOFYEAR     : constant := 16#100d#;
   LOCALE_SDAYNAME1            : constant := 16#2a#;
   LOCALE_SDAYNAME2            : constant := 16#2b#;
   LOCALE_SDAYNAME3            : constant := 16#2c#;
   LOCALE_SDAYNAME4            : constant := 16#2d#;
   LOCALE_SDAYNAME5            : constant := 16#2e#;
   LOCALE_SDAYNAME6            : constant := 16#2f#;
   LOCALE_SDAYNAME7            : constant := 16#30#;
   LOCALE_SABBREVDAYNAME1      : constant := 16#31#;
   LOCALE_SABBREVDAYNAME2      : constant := 16#32#;
   LOCALE_SABBREVDAYNAME3      : constant := 16#33#;
   LOCALE_SABBREVDAYNAME4      : constant := 16#34#;
   LOCALE_SABBREVDAYNAME5      : constant := 16#35#;
   LOCALE_SABBREVDAYNAME6      : constant := 16#36#;
   LOCALE_SABBREVDAYNAME7      : constant := 16#37#;
   LOCALE_SMONTHNAME1          : constant := 16#38#;
   LOCALE_SMONTHNAME2          : constant := 16#39#;
   LOCALE_SMONTHNAME3          : constant := 16#3a#;
   LOCALE_SMONTHNAME4          : constant := 16#3b#;
   LOCALE_SMONTHNAME5          : constant := 16#3c#;
   LOCALE_SMONTHNAME6          : constant := 16#3d#;
   LOCALE_SMONTHNAME7          : constant := 16#3e#;
   LOCALE_SMONTHNAME8          : constant := 16#3f#;
   LOCALE_SMONTHNAME9          : constant := 16#40#;
   LOCALE_SMONTHNAME10         : constant := 16#41#;
   LOCALE_SMONTHNAME11         : constant := 16#42#;
   LOCALE_SMONTHNAME12         : constant := 16#43#;
   LOCALE_SMONTHNAME13         : constant := 16#100e#;
   LOCALE_SABBREVMONTHNAME1    : constant := 16#44#;
   LOCALE_SABBREVMONTHNAME2    : constant := 16#45#;
   LOCALE_SABBREVMONTHNAME3    : constant := 16#46#;
   LOCALE_SABBREVMONTHNAME4    : constant := 16#47#;
   LOCALE_SABBREVMONTHNAME5    : constant := 16#48#;
   LOCALE_SABBREVMONTHNAME6    : constant := 16#49#;
   LOCALE_SABBREVMONTHNAME7    : constant := 16#4a#;
   LOCALE_SABBREVMONTHNAME8    : constant := 16#4b#;
   LOCALE_SABBREVMONTHNAME9    : constant := 16#4c#;
   LOCALE_SABBREVMONTHNAME10   : constant := 16#4d#;
   LOCALE_SABBREVMONTHNAME11   : constant := 16#4e#;
   LOCALE_SABBREVMONTHNAME12   : constant := 16#4f#;
   LOCALE_SABBREVMONTHNAME13   : constant := 16#100f#;
   LOCALE_SPOSITIVESIGN        : constant := 16#50#;
   LOCALE_SNEGATIVESIGN        : constant := 16#51#;
   LOCALE_IPOSSIGNPOSN         : constant := 16#52#;
   LOCALE_INEGSIGNPOSN         : constant := 16#53#;
   LOCALE_IPOSSYMPRECEDES      : constant := 16#54#;
   LOCALE_IPOSSEPBYSPACE       : constant := 16#55#;
   LOCALE_INEGSYMPRECEDES      : constant := 16#56#;
   LOCALE_INEGSEPBYSPACE       : constant := 16#57#;
   TIME_NOMINUTESORSECONDS     : constant := 16#1#;
   TIME_NOSECONDS              : constant := 16#2#;
   TIME_NOTIMEMARKER           : constant := 16#4#;
   TIME_FORCE24HOURFORMAT      : constant := 16#8#;
   DATE_SHORTDATE              : constant := 16#1#;
   DATE_LONGDATE               : constant := 16#2#;
   DATE_USE_ALT_CALENDAR       : constant := 16#4#;
   CAL_ICALINTVALUE            : constant := 16#1#;
   CAL_SCALNAME                : constant := 16#2#;
   CAL_IYEAROFFSETRANGE        : constant := 16#3#;
   CAL_SERASTRING              : constant := 16#4#;
   CAL_SSHORTDATE              : constant := 16#5#;
   CAL_SLONGDATE               : constant := 16#6#;
   CAL_SDAYNAME1               : constant := 16#7#;
   CAL_SDAYNAME2               : constant := 16#8#;
   CAL_SDAYNAME3               : constant := 16#9#;
   CAL_SDAYNAME4               : constant := 16#a#;
   CAL_SDAYNAME5               : constant := 16#b#;
   CAL_SDAYNAME6               : constant := 16#c#;
   CAL_SDAYNAME7               : constant := 16#d#;
   CAL_SABBREVDAYNAME1         : constant := 16#e#;
   CAL_SABBREVDAYNAME2         : constant := 16#f#;
   CAL_SABBREVDAYNAME3         : constant := 16#10#;
   CAL_SABBREVDAYNAME4         : constant := 16#11#;
   CAL_SABBREVDAYNAME5         : constant := 16#12#;
   CAL_SABBREVDAYNAME6         : constant := 16#13#;
   CAL_SABBREVDAYNAME7         : constant := 16#14#;
   CAL_SMONTHNAME1             : constant := 16#15#;
   CAL_SMONTHNAME2             : constant := 16#16#;
   CAL_SMONTHNAME3             : constant := 16#17#;
   CAL_SMONTHNAME4             : constant := 16#18#;
   CAL_SMONTHNAME5             : constant := 16#19#;
   CAL_SMONTHNAME6             : constant := 16#1a#;
   CAL_SMONTHNAME7             : constant := 16#1b#;
   CAL_SMONTHNAME8             : constant := 16#1c#;
   CAL_SMONTHNAME9             : constant := 16#1d#;
   CAL_SMONTHNAME10            : constant := 16#1e#;
   CAL_SMONTHNAME11            : constant := 16#1f#;
   CAL_SMONTHNAME12            : constant := 16#20#;
   CAL_SMONTHNAME13            : constant := 16#21#;
   CAL_SABBREVMONTHNAME1       : constant := 16#22#;
   CAL_SABBREVMONTHNAME2       : constant := 16#23#;
   CAL_SABBREVMONTHNAME3       : constant := 16#24#;
   CAL_SABBREVMONTHNAME4       : constant := 16#25#;
   CAL_SABBREVMONTHNAME5       : constant := 16#26#;
   CAL_SABBREVMONTHNAME6       : constant := 16#27#;
   CAL_SABBREVMONTHNAME7       : constant := 16#28#;
   CAL_SABBREVMONTHNAME8       : constant := 16#29#;
   CAL_SABBREVMONTHNAME9       : constant := 16#2a#;
   CAL_SABBREVMONTHNAME10      : constant := 16#2b#;
   CAL_SABBREVMONTHNAME11      : constant := 16#2c#;
   CAL_SABBREVMONTHNAME12      : constant := 16#2d#;
   CAL_SABBREVMONTHNAME13      : constant := 16#2e#;
   ENUM_ALL_CALENDARS          : constant := 16#ffffffff#;
   CAL_GREGORIAN               : constant := 1;
   CAL_GREGORIAN_US            : constant := 2;
   CAL_JAPAN                   : constant := 3;
   CAL_TAIWAN                  : constant := 4;
   CAL_KOREA                   : constant := 5;

   type LCTYPE is new Win32.DWORD;
   type CALTYPE is new Win32.DWORD;
   type CALID is new Win32.DWORD;

   type CPINFO;
   type NUMBERFMTA;
   type NUMBERFMTW;
   type CURRENCYFMTA;
   type CURRENCYFMTW;

   type LPCPINFO is access all CPINFO;
   type LPNUMBERFMTA is access all NUMBERFMTA;
   subtype LPNUMBERFMT is LPNUMBERFMTA;
   type LPNUMBERFMTW is access all NUMBERFMTW;
   type LPCURRENCYFMTA is access all CURRENCYFMTA;
   subtype LPCURRENCYFMT is LPCURRENCYFMTA;
   type LPCURRENCYFMTW is access all CURRENCYFMTW;

   type CPINFO is record
      MaxCharSize : Win32.UINT;
      DefaultChar : Win32.BYTE_Array (0 .. MAX_DEFAULTCHAR - 1);
      LeadByte    : Win32.BYTE_Array (0 .. MAX_LEADBYTES - 1);
   end record;

   type NUMBERFMTA is record
      NumDigits     : Win32.UINT;
      LeadingZero   : Win32.UINT;
      Grouping      : Win32.UINT;
      lpDecimalSep  : Win32.LPSTR;
      lpThousandSep : Win32.LPSTR;
      NegativeOrder : Win32.UINT;
   end record;

   type NUMBERFMTW is record
      NumDigits     : Win32.UINT;
      LeadingZero   : Win32.UINT;
      Grouping      : Win32.UINT;
      lpDecimalSep  : Win32.LPWSTR;
      lpThousandSep : Win32.LPWSTR;
      NegativeOrder : Win32.UINT;
   end record;

   subtype NUMBERFMT is NUMBERFMTA;

   type CURRENCYFMTA is record
      NumDigits        : Win32.UINT;
      LeadingZero      : Win32.UINT;
      Grouping         : Win32.UINT;
      lpDecimalSep     : Win32.LPSTR;
      lpThousandSep    : Win32.LPSTR;
      NegativeOrder    : Win32.UINT;
      PositiveOrder    : Win32.UINT;
      lpCurrencySymbol : Win32.LPSTR;
   end record;

   type CURRENCYFMTW is record
      NumDigits        : Win32.UINT;
      LeadingZero      : Win32.UINT;
      Grouping         : Win32.UINT;
      lpDecimalSep     : Win32.LPWSTR;
      lpThousandSep    : Win32.LPWSTR;
      NegativeOrder    : Win32.UINT;
      PositiveOrder    : Win32.UINT;
      lpCurrencySymbol : Win32.LPWSTR;
   end record;

   subtype CURRENCYFMT is CURRENCYFMTA;

   type LOCALE_ENUMPROCA is access function
     (lpLocaleString : Win32.LPSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, LOCALE_ENUMPROCA);
   subtype LOCALE_ENUMPROC is LOCALE_ENUMPROCA;
   type CODEPAGE_ENUMPROCA is access function
     (lpCodePageString : Win32.LPSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, CODEPAGE_ENUMPROCA);
   subtype CODEPAGE_ENUMPROC is CODEPAGE_ENUMPROCA;
   type DATEFMT_ENUMPROCA is access function
     (lpDateFormatString : Win32.LPSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, DATEFMT_ENUMPROCA);
   subtype DATEFMT_ENUMPROC is DATEFMT_ENUMPROCA;
   type TIMEFMT_ENUMPROCA is access function
     (lpTimeFormatString : Win32.LPSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, TIMEFMT_ENUMPROCA);
   subtype TIMEFMT_ENUMPROC is TIMEFMT_ENUMPROCA;
   type CALINFO_ENUMPROCA is access function
     (lpCalendarInfoString : Win32.LPSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, CALINFO_ENUMPROCA);
   subtype CALINFO_ENUMPROC is CALINFO_ENUMPROCA;
   type LOCALE_ENUMPROCW is access function
     (lpLocaleString : Win32.LPWSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, LOCALE_ENUMPROCW);
   type CODEPAGE_ENUMPROCW is access function
     (lpCodePageString : Win32.LPWSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, CODEPAGE_ENUMPROCW);
   type DATEFMT_ENUMPROCW is access function
     (lpDateFormatString : Win32.LPWSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, DATEFMT_ENUMPROCW);
   type TIMEFMT_ENUMPROCW is access function
     (lpTimeFormatString : Win32.LPWSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, TIMEFMT_ENUMPROCW);
   type CALINFO_ENUMPROCW is access function
     (lpCalendarInfoString : Win32.LPWSTR)
      return Win32.BOOL;
   pragma Convention (Stdcall, CALINFO_ENUMPROCW);

   type ac_NUMBERFMTA_t is access all NUMBERFMTA;
   type ac_NUMBERFMTW_t is access all NUMBERFMTW;
   type ac_CURRENCYFMTA_t is access all CURRENCYFMTA;
   type ac_CURRENCYFMTW_t is access all CURRENCYFMTW;

   function IsValidCodePage (CodePage : Win32.UINT) return Win32.BOOL;

   function GetACP return Win32.UINT;

   function GetOEMCP return Win32.UINT;

   function GetCPInfo
     (CodePage : Win32.UINT;
      lpCPInfo : access CPINFO)
      return Win32.BOOL;

   function IsDBCSLeadByte (TestChar : Win32.BYTE) return Win32.BOOL;

   function IsDBCSLeadByteEx
     (CodePage : Win32.UINT;
      TestChar : Win32.BYTE)
      return Win32.BOOL;

   function MultiByteToWideChar
     (CodePage       : Win32.UINT;
      dwFlags        : Win32.DWORD;
      lpMultiByteStr : Win32.LPCSTR;
      cchMultiByte   : Win32.INT;
      lpWideCharStr  : Win32.LPWSTR;
      cchWideChar    : Win32.INT)
      return Win32.INT;

   function WideCharToMultiByte
     (CodePage          : Win32.UINT;
      dwFlags           : Win32.DWORD;
      lpWideCharStr     : Win32.LPCWSTR;
      cchWideChar       : Win32.INT;
      lpMultiByteStr    : Win32.LPSTR;
      cchMultiByte      : Win32.INT;
      lpDefaultChar     : Win32.LPCSTR;
      lpUsedDefaultChar : Win32.LPBOOL)
      return Win32.INT;

   function CompareStringA
     (Locale     : Win32.Winnt.LCID;
      dwCmpFlags : Win32.DWORD;
      lpString1  : Win32.LPCSTR;
      cchCount1  : Win32.INT;
      lpString2  : Win32.LPCSTR;
      cchCount2  : Win32.INT)
      return Win32.INT;

   function CompareString
     (Locale     : Win32.Winnt.LCID;
      dwCmpFlags : Win32.DWORD;
      lpString1  : Win32.LPCSTR;
      cchCount1  : Win32.INT;
      lpString2  : Win32.LPCSTR;
      cchCount2  : Win32.INT)
      return Win32.INT renames CompareStringA;

   function CompareStringW
     (Locale     : Win32.Winnt.LCID;
      dwCmpFlags : Win32.DWORD;
      lpString1  : Win32.LPCWSTR;
      cchCount1  : Win32.INT;
      lpString2  : Win32.LPCWSTR;
      cchCount2  : Win32.INT)
      return Win32.INT;

   function LCMapStringA
     (Locale     : Win32.Winnt.LCID;
      dwMapFlags : Win32.DWORD;
      lpSrcStr   : Win32.LPCSTR;
      cchSrc     : Win32.INT;
      lpDestStr  : Win32.LPSTR;
      cchDest    : Win32.INT)
      return Win32.INT;

   function LCMapStringW
     (Locale     : Win32.Winnt.LCID;
      dwMapFlags : Win32.DWORD;
      lpSrcStr   : Win32.LPCWSTR;
      cchSrc     : Win32.INT;
      lpDestStr  : Win32.LPWSTR;
      cchDest    : Win32.INT)
      return Win32.INT;

   function LCMapString
     (Locale     : Win32.Winnt.LCID;
      dwMapFlags : Win32.DWORD;
      lpSrcStr   : Win32.LPCSTR;
      cchSrc     : Win32.INT;
      lpDestStr  : Win32.LPSTR;
      cchDest    : Win32.INT)
      return Win32.INT renames LCMapStringA;

   function GetLocaleInfoA
     (Locale   : Win32.Winnt.LCID;
      LCTYPE   : Win32.Winnls.LCTYPE;
      lpLCData : Win32.LPSTR;
      cchData  : Win32.INT)
      return Win32.INT;

   function GetLocaleInfo
     (Locale   : Win32.Winnt.LCID;
      LCTYPE   : Win32.Winnls.LCTYPE;
      lpLCData : Win32.LPSTR;
      cchData  : Win32.INT)
      return Win32.INT renames GetLocaleInfoA;

   function GetLocaleInfoW
     (Locale   : Win32.Winnt.LCID;
      LCTYPE   : Win32.Winnls.LCTYPE;
      lpLCData : Win32.LPWSTR;
      cchData  : Win32.INT)
      return Win32.INT;

   function SetLocaleInfoA
     (Locale   : Win32.Winnt.LCID;
      LCTYPE   : Win32.Winnls.LCTYPE;
      lpLCData : Win32.LPCSTR)
      return Win32.BOOL;

   function SetLocaleInfo
     (Locale   : Win32.Winnt.LCID;
      LCTYPE   : Win32.Winnls.LCTYPE;
      lpLCData : Win32.LPCSTR)
      return Win32.BOOL renames SetLocaleInfoA;

   function SetLocaleInfoW
     (Locale   : Win32.Winnt.LCID;
      LCTYPE   : Win32.Winnls.LCTYPE;
      lpLCData : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetTimeFormatA
     (Locale    : Win32.Winnt.LCID;
      dwFlags   : Win32.DWORD;
      lpTime    : Win32.Winbase.ac_SYSTEMTIME_t;
      lpFormat  : Win32.LPCSTR;
      lpTimeStr : Win32.LPSTR;
      cchTime   : Win32.INT)
      return Win32.INT;

   function GetTimeFormat
     (Locale    : Win32.Winnt.LCID;
      dwFlags   : Win32.DWORD;
      lpTime    : Win32.Winbase.ac_SYSTEMTIME_t;
      lpFormat  : Win32.LPCSTR;
      lpTimeStr : Win32.LPSTR;
      cchTime   : Win32.INT)
      return Win32.INT renames GetTimeFormatA;

   function GetTimeFormatW
     (Locale    : Win32.Winnt.LCID;
      dwFlags   : Win32.DWORD;
      lpTime    : Win32.Winbase.ac_SYSTEMTIME_t;
      lpFormat  : Win32.LPCWSTR;
      lpTimeStr : Win32.LPWSTR;
      cchTime   : Win32.INT)
      return Win32.INT;

   function GetDateFormatA
     (Locale    : Win32.Winnt.LCID;
      dwFlags   : Win32.DWORD;
      lpDate    : Win32.Winbase.ac_SYSTEMTIME_t;
      lpFormat  : Win32.LPCSTR;
      lpDateStr : Win32.LPSTR;
      cchDate   : Win32.INT)
      return Win32.INT;

   function GetDateFormat
     (Locale    : Win32.Winnt.LCID;
      dwFlags   : Win32.DWORD;
      lpDate    : Win32.Winbase.ac_SYSTEMTIME_t;
      lpFormat  : Win32.LPCSTR;
      lpDateStr : Win32.LPSTR;
      cchDate   : Win32.INT)
      return Win32.INT renames GetDateFormatA;

   function GetDateFormatW
     (Locale    : Win32.Winnt.LCID;
      dwFlags   : Win32.DWORD;
      lpDate    : Win32.Winbase.ac_SYSTEMTIME_t;
      lpFormat  : Win32.LPCWSTR;
      lpDateStr : Win32.LPWSTR;
      cchDate   : Win32.INT)
      return Win32.INT;

   function GetNumberFormatA
     (Locale      : Win32.Winnt.LCID;
      dwFlags     : Win32.DWORD;
      lpValue     : Win32.LPCSTR;
      lpFormat    : ac_NUMBERFMTA_t;
      lpNumberStr : Win32.LPSTR;
      cchNumber   : Win32.INT)
      return Win32.INT;

   function GetNumberFormat
     (Locale      : Win32.Winnt.LCID;
      dwFlags     : Win32.DWORD;
      lpValue     : Win32.LPCSTR;
      lpFormat    : ac_NUMBERFMTA_t;
      lpNumberStr : Win32.LPSTR;
      cchNumber   : Win32.INT)
      return Win32.INT renames GetNumberFormatA;

   function GetNumberFormatW
     (Locale      : Win32.Winnt.LCID;
      dwFlags     : Win32.DWORD;
      lpValue     : Win32.LPCWSTR;
      lpFormat    : ac_NUMBERFMTW_t;
      lpNumberStr : Win32.LPWSTR;
      cchNumber   : Win32.INT)
      return Win32.INT;

   function GetCurrencyFormatA
     (Locale        : Win32.Winnt.LCID;
      dwFlags       : Win32.DWORD;
      lpValue       : Win32.LPCSTR;
      lpFormat      : ac_CURRENCYFMTA_t;
      lpCurrencyStr : Win32.LPSTR;
      cchCurrency   : Win32.INT)
      return Win32.INT;

   function GetCurrencyFormat
     (Locale        : Win32.Winnt.LCID;
      dwFlags       : Win32.DWORD;
      lpValue       : Win32.LPCSTR;
      lpFormat      : ac_CURRENCYFMTA_t;
      lpCurrencyStr : Win32.LPSTR;
      cchCurrency   : Win32.INT)
      return Win32.INT renames GetCurrencyFormatA;

   function GetCurrencyFormatW
     (Locale        : Win32.Winnt.LCID;
      dwFlags       : Win32.DWORD;
      lpValue       : Win32.LPCWSTR;
      lpFormat      : ac_CURRENCYFMTW_t;
      lpCurrencyStr : Win32.LPWSTR;
      cchCurrency   : Win32.INT)
      return Win32.INT;

   function EnumCalendarInfoA
     (lpCalInfoEnumProc : CALINFO_ENUMPROCA;
      Locale            : Win32.Winnt.LCID;
      Calendar          : CALID;
      CalType           : Win32.Winnls.CALTYPE)
      return Win32.BOOL;

   function EnumCalendarInfo
     (lpCalInfoEnumProc : CALINFO_ENUMPROCA;
      Locale            : Win32.Winnt.LCID;
      Calendar          : CALID;
      CalType           : Win32.Winnls.CALTYPE)
      return Win32.BOOL renames EnumCalendarInfoA;

   function EnumCalendarInfoW
     (lpCalInfoEnumProc : CALINFO_ENUMPROCW;
      Locale            : Win32.Winnt.LCID;
      Calendar          : CALID;
      CalType           : Win32.Winnls.CALTYPE)
      return Win32.BOOL;

   function EnumTimeFormatsA
     (lpTimeFmtEnumProc : TIMEFMT_ENUMPROCA;
      Locale            : Win32.Winnt.LCID;
      dwFlags           : Win32.DWORD)
      return Win32.BOOL;

   function EnumTimeFormats
     (lpTimeFmtEnumProc : TIMEFMT_ENUMPROCA;
      Locale            : Win32.Winnt.LCID;
      dwFlags           : Win32.DWORD)
      return Win32.BOOL renames EnumTimeFormatsA;

   function EnumTimeFormatsW
     (lpTimeFmtEnumProc : TIMEFMT_ENUMPROCW;
      Locale            : Win32.Winnt.LCID;
      dwFlags           : Win32.DWORD)
      return Win32.BOOL;

   function EnumDateFormatsA
     (lpDateFmtEnumProc : DATEFMT_ENUMPROCA;
      Locale            : Win32.Winnt.LCID;
      dwFlags           : Win32.DWORD)
      return Win32.BOOL;

   function EnumDateFormats
     (lpDateFmtEnumProc : DATEFMT_ENUMPROCA;
      Locale            : Win32.Winnt.LCID;
      dwFlags           : Win32.DWORD)
      return Win32.BOOL renames EnumDateFormatsA;

   function EnumDateFormatsW
     (lpDateFmtEnumProc : DATEFMT_ENUMPROCW;
      Locale            : Win32.Winnt.LCID;
      dwFlags           : Win32.DWORD)
      return Win32.BOOL;

   function IsValidLocale
     (Locale  : Win32.Winnt.LCID;
      dwFlags : Win32.DWORD)
      return Win32.BOOL;

   function ConvertDefaultLocale
     (Locale : Win32.Winnt.LCID)
      return Win32.Winnt.LCID;

   function GetThreadLocale return Win32.Winnt.LCID;

   function SetThreadLocale (Locale : Win32.Winnt.LCID) return Win32.BOOL;

   function GetSystemDefaultLangID return Win32.Winnt.LANGID;

   function GetUserDefaultLangID return Win32.Winnt.LANGID;

   function GetSystemDefaultLCID return Win32.Winnt.LCID;

   function GetUserDefaultLCID return Win32.Winnt.LCID;

   function GetStringTypeExA
     (Locale     : Win32.Winnt.LCID;
      dwInfoType : Win32.DWORD;
      lpSrcStr   : Win32.LPCSTR;
      cchSrc     : Win32.INT;
      lpCharType : Win32.LPWORD)
      return Win32.BOOL;

   function GetStringTypeEx
     (Locale     : Win32.Winnt.LCID;
      dwInfoType : Win32.DWORD;
      lpSrcStr   : Win32.LPCSTR;
      cchSrc     : Win32.INT;
      lpCharType : Win32.LPWORD)
      return Win32.BOOL renames GetStringTypeExA;

   function GetStringTypeExW
     (Locale     : Win32.Winnt.LCID;
      dwInfoType : Win32.DWORD;
      lpSrcStr   : Win32.LPCWSTR;
      cchSrc     : Win32.INT;
      lpCharType : Win32.LPWORD)
      return Win32.BOOL;

   function GetStringTypeA
     (Locale     : Win32.Winnt.LCID;
      dwInfoType : Win32.DWORD;
      lpSrcStr   : Win32.LPCSTR;
      cchSrc     : Win32.INT;
      lpCharType : Win32.LPWORD)
      return Win32.BOOL;

   function GetStringTypeW
     (dwInfoType : Win32.DWORD;
      lpSrcStr   : Win32.LPCWSTR;
      cchSrc     : Win32.INT;
      lpCharType : Win32.LPWORD)
      return Win32.BOOL;

   function FoldStringA
     (dwMapFlags : Win32.DWORD;
      lpSrcStr   : Win32.LPCSTR;
      cchSrc     : Win32.INT;
      lpDestStr  : Win32.LPSTR;
      cchDest    : Win32.INT)
      return Win32.INT;

   function FoldString
     (dwMapFlags : Win32.DWORD;
      lpSrcStr   : Win32.LPCSTR;
      cchSrc     : Win32.INT;
      lpDestStr  : Win32.LPSTR;
      cchDest    : Win32.INT)
      return Win32.INT renames FoldStringA;

   function FoldStringW
     (dwMapFlags : Win32.DWORD;
      lpSrcStr   : Win32.LPCWSTR;
      cchSrc     : Win32.INT;
      lpDestStr  : Win32.LPWSTR;
      cchDest    : Win32.INT)
      return Win32.INT;

   function EnumSystemLocalesA
     (lpLocaleEnumProc : LOCALE_ENUMPROCA;
      dwFlags          : Win32.DWORD)
      return Win32.BOOL;

   function EnumSystemLocales
     (lpLocaleEnumProc : LOCALE_ENUMPROCA;
      dwFlags          : Win32.DWORD)
      return Win32.BOOL renames EnumSystemLocalesA;

   function EnumSystemLocalesW
     (lpLocaleEnumProc : LOCALE_ENUMPROCW;
      dwFlags          : Win32.DWORD)
      return Win32.BOOL;

   function EnumSystemCodePagesA
     (lpCodePageEnumProc : CODEPAGE_ENUMPROCA;
      dwFlags            : Win32.DWORD)
      return Win32.BOOL;

   function EnumSystemCodePages
     (lpCodePageEnumProc : CODEPAGE_ENUMPROCA;
      dwFlags            : Win32.DWORD)
      return Win32.BOOL renames EnumSystemCodePagesA;

   function EnumSystemCodePagesW
     (lpCodePageEnumProc : CODEPAGE_ENUMPROCW;
      dwFlags            : Win32.DWORD)
      return Win32.BOOL;

private

   pragma Convention (C, CPINFO);
   pragma Convention (C, NUMBERFMTA);
   pragma Convention (C, NUMBERFMTW);
   pragma Convention (C, CURRENCYFMTA);
   pragma Convention (C, CURRENCYFMTW);

   pragma Import (Stdcall, IsValidCodePage, "IsValidCodePage");
   pragma Import (Stdcall, GetACP, "GetACP");
   pragma Import (Stdcall, GetOEMCP, "GetOEMCP");
   pragma Import (Stdcall, GetCPInfo, "GetCPInfo");
   pragma Import (Stdcall, IsDBCSLeadByte, "IsDBCSLeadByte");
   pragma Import (Stdcall, IsDBCSLeadByteEx, "IsDBCSLeadByteEx");
   pragma Import (Stdcall, MultiByteToWideChar, "MultiByteToWideChar");
   pragma Import (Stdcall, WideCharToMultiByte, "WideCharToMultiByte");
   pragma Import (Stdcall, CompareStringA, "CompareStringA");
   pragma Import (Stdcall, CompareStringW, "CompareStringW");
   pragma Import (Stdcall, LCMapStringA, "LCMapStringA");
   pragma Import (Stdcall, LCMapStringW, "LCMapStringW");
   pragma Import (Stdcall, GetLocaleInfoA, "GetLocaleInfoA");
   pragma Import (Stdcall, GetLocaleInfoW, "GetLocaleInfoW");
   pragma Import (Stdcall, SetLocaleInfoA, "SetLocaleInfoA");
   pragma Import (Stdcall, SetLocaleInfoW, "SetLocaleInfoW");
   pragma Import (Stdcall, GetTimeFormatA, "GetTimeFormatA");
   pragma Import (Stdcall, GetTimeFormatW, "GetTimeFormatW");
   pragma Import (Stdcall, GetDateFormatA, "GetDateFormatA");
   pragma Import (Stdcall, GetDateFormatW, "GetDateFormatW");
   pragma Import (Stdcall, GetNumberFormatA, "GetNumberFormatA");
   pragma Import (Stdcall, GetNumberFormatW, "GetNumberFormatW");
   pragma Import (Stdcall, GetCurrencyFormatA, "GetCurrencyFormatA");
   pragma Import (Stdcall, GetCurrencyFormatW, "GetCurrencyFormatW");
   pragma Import (Stdcall, EnumCalendarInfoA, "EnumCalendarInfoA");
   pragma Import (Stdcall, EnumCalendarInfoW, "EnumCalendarInfoW");
   pragma Import (Stdcall, EnumTimeFormatsA, "EnumTimeFormatsA");
   pragma Import (Stdcall, EnumTimeFormatsW, "EnumTimeFormatsW");
   pragma Import (Stdcall, EnumDateFormatsA, "EnumDateFormatsA");
   pragma Import (Stdcall, EnumDateFormatsW, "EnumDateFormatsW");
   pragma Import (Stdcall, IsValidLocale, "IsValidLocale");
   pragma Import (Stdcall, ConvertDefaultLocale, "ConvertDefaultLocale");
   pragma Import (Stdcall, GetThreadLocale, "GetThreadLocale");
   pragma Import (Stdcall, SetThreadLocale, "SetThreadLocale");
   pragma Import (Stdcall, GetSystemDefaultLangID, "GetSystemDefaultLangID");
   pragma Import (Stdcall, GetUserDefaultLangID, "GetUserDefaultLangID");
   pragma Import (Stdcall, GetSystemDefaultLCID, "GetSystemDefaultLCID");
   pragma Import (Stdcall, GetUserDefaultLCID, "GetUserDefaultLCID");
   pragma Import (Stdcall, GetStringTypeExA, "GetStringTypeExA");
   pragma Import (Stdcall, GetStringTypeExW, "GetStringTypeExW");
   pragma Import (Stdcall, GetStringTypeA, "GetStringTypeA");
   pragma Import (Stdcall, GetStringTypeW, "GetStringTypeW");
   pragma Import (Stdcall, FoldStringA, "FoldStringA");
   pragma Import (Stdcall, FoldStringW, "FoldStringW");
   pragma Import (Stdcall, EnumSystemLocalesA, "EnumSystemLocalesA");
   pragma Import (Stdcall, EnumSystemLocalesW, "EnumSystemLocalesW");
   pragma Import (Stdcall, EnumSystemCodePagesA, "EnumSystemCodePagesA");
   pragma Import (Stdcall, EnumSystemCodePagesW, "EnumSystemCodePagesW");

end Win32.Winnls;
