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

with Win32.Mmreg;
with Win32.Mmsystem;
with Win32.Windef;
with Win32.Winnt;

package Win32.Msacm is

   use Interfaces;
   use type Interfaces.C.char_array;

   DRV_MAPPER_PREFERRED_INPUT_GET    : constant := 16#4000#;
   DRV_MAPPER_PREFERRED_OUTPUT_GET   : constant := 16#4002#;
   DRVM_MAPPER_STATUS                : constant := 16#2000#;
   WIDM_MAPPER_STATUS                : constant := 16#2000#;
   WAVEIN_MAPPER_STATUS_DEVICE       : constant := 0;
   WAVEIN_MAPPER_STATUS_MAPPED       : constant := 1;
   WAVEIN_MAPPER_STATUS_FORMAT       : constant := 2;
   WODM_MAPPER_STATUS                : constant := 16#2000#;
   WAVEOUT_MAPPER_STATUS_DEVICE      : constant := 0;
   WAVEOUT_MAPPER_STATUS_MAPPED      : constant := 1;
   WAVEOUT_MAPPER_STATUS_FORMAT      : constant := 2;
   ACMERR_BASE                       : constant := 512;
   ACMERR_NOTPOSSIBLE                : constant := 512;
   ACMERR_BUSY                       : constant := 513;
   ACMERR_UNPREPARED                 : constant := 514;
   ACMERR_CANCELED                   : constant := 515;
   ACM_METRIC_COUNT_DRIVERS          : constant := 1;
   ACM_METRIC_COUNT_CODECS           : constant := 2;
   ACM_METRIC_COUNT_CONVERTERS       : constant := 3;
   ACM_METRIC_COUNT_FILTERS          : constant := 4;
   ACM_METRIC_COUNT_DISABLED         : constant := 5;
   ACM_METRIC_COUNT_HARDWARE         : constant := 6;
   ACM_METRIC_COUNT_LOCAL_DRIVERS    : constant := 20;
   ACM_METRIC_COUNT_LOCAL_CODECS     : constant := 21;
   ACM_METRIC_COUNT_LOCAL_CONVERTERS : constant := 22;
   ACM_METRIC_COUNT_LOCAL_FILTERS    : constant := 23;
   ACM_METRIC_COUNT_LOCAL_DISABLED   : constant := 24;
   ACM_METRIC_HARDWARE_WAVE_INPUT    : constant := 30;
   ACM_METRIC_HARDWARE_WAVE_OUTPUT   : constant := 31;
   ACM_METRIC_MAX_SIZE_FORMAT        : constant := 50;
   ACM_METRIC_MAX_SIZE_FILTER        : constant := 51;
   ACM_METRIC_DRIVER_SUPPORT         : constant := 100;
   ACM_METRIC_DRIVER_PRIORITY        : constant := 101;
   ACM_DRIVERENUMF_NOLOCAL           : constant := 16#40000000#;
   ACM_DRIVERENUMF_DISABLED          : constant := 16#80000000#;
   ACM_DRIVERADDF_FUNCTION           : constant := 16#3#;
   ACM_DRIVERADDF_NOTIFYHWND         : constant := 16#4#;
   ACM_DRIVERADDF_TYPEMASK           : constant := 16#7#;
   ACM_DRIVERADDF_LOCAL              : constant := 16#0#;
   ACM_DRIVERADDF_GLOBAL             : constant := 16#8#;
   ACMDM_USER                        : constant := 16#4000#;
   ACMDM_RESERVED_LOW                : constant := 16#6000#;
   ACMDM_RESERVED_HIGH               : constant := 16#6fff#;
   ACMDM_BASE                        : constant := 16#6000#;
   ACMDM_DRIVER_ABOUT                : constant := 16#600b#;
   ACM_DRIVERPRIORITYF_ENABLE        : constant := 16#1#;
   ACM_DRIVERPRIORITYF_DISABLE       : constant := 16#2#;
   ACM_DRIVERPRIORITYF_ABLEMASK      : constant := 16#3#;
   ACM_DRIVERPRIORITYF_BEGIN         : constant := 16#10000#;
   ACM_DRIVERPRIORITYF_END           : constant := 16#20000#;
   ACM_DRIVERPRIORITYF_DEFERMASK     : constant := 16#30000#;
   ACMDRIVERDETAILS_SHORTNAME_CHARS  : constant := 32;
   ACMDRIVERDETAILS_LONGNAME_CHARS   : constant := 128;
   ACMDRIVERDETAILS_COPYRIGHT_CHARS  : constant := 80;
   ACMDRIVERDETAILS_LICENSING_CHARS  : constant := 128;
   ACMDRIVERDETAILS_FEATURES_CHARS   : constant := 512;

   ACMDRIVERDETAILS_FCCTYPE_AUDIOCODEC : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('a', 'u', 'd', 'c');
   ACMDRIVERDETAILS_FCCCOMP_UNDEFINED  : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC (Nul, Nul, Nul, Nul);

   ACMDRIVERDETAILS_SUPPORTF_CODEC             : constant := 16#1#;
   ACMDRIVERDETAILS_SUPPORTF_CONVERTER         : constant := 16#2#;
   ACMDRIVERDETAILS_SUPPORTF_FILTER            : constant := 16#4#;
   ACMDRIVERDETAILS_SUPPORTF_HARDWARE          : constant := 16#8#;
   ACMDRIVERDETAILS_SUPPORTF_ASYNC             : constant := 16#10#;
   ACMDRIVERDETAILS_SUPPORTF_LOCAL             : constant := 16#40000000#;
   ACMDRIVERDETAILS_SUPPORTF_DISABLED          : constant := 16#80000000#;
   ACMFORMATTAGDETAILS_FORMATTAG_CHARS         : constant := 48;
   ACM_FORMATTAGDETAILSF_INDEX                 : constant := 16#0#;
   ACM_FORMATTAGDETAILSF_FORMATTAG             : constant := 16#1#;
   ACM_FORMATTAGDETAILSF_LARGESTSIZE           : constant := 16#2#;
   ACM_FORMATTAGDETAILSF_QUERYMASK             : constant := 16#f#;
   ACMFORMATDETAILS_FORMAT_CHARS               : constant := 128;
   ACM_FORMATDETAILSF_INDEX                    : constant := 16#0#;
   ACM_FORMATDETAILSF_FORMAT                   : constant := 16#1#;
   ACM_FORMATDETAILSF_QUERYMASK                : constant := 16#f#;
   ACM_FORMATENUMF_WFORMATTAG                  : constant := 16#10000#;
   ACM_FORMATENUMF_NCHANNELS                   : constant := 16#20000#;
   ACM_FORMATENUMF_NSAMPLESPERSEC              : constant := 16#40000#;
   ACM_FORMATENUMF_WBITSPERSAMPLE              : constant := 16#80000#;
   ACM_FORMATENUMF_CONVERT                     : constant := 16#100000#;
   ACM_FORMATENUMF_SUGGEST                     : constant := 16#200000#;
   ACM_FORMATENUMF_HARDWARE                    : constant := 16#400000#;
   ACM_FORMATENUMF_INPUT                       : constant := 16#800000#;
   ACM_FORMATENUMF_OUTPUT                      : constant := 16#1000000#;
   ACM_FORMATSUGGESTF_WFORMATTAG               : constant := 16#10000#;
   ACM_FORMATSUGGESTF_NCHANNELS                : constant := 16#20000#;
   ACM_FORMATSUGGESTF_NSAMPLESPERSEC           : constant := 16#40000#;
   ACM_FORMATSUGGESTF_WBITSPERSAMPLE           : constant := 16#80000#;
   ACM_FORMATSUGGESTF_TYPEMASK                 : constant := 16#ff0000#;
   ACMHELPMSGSTRINGA                           : constant CHAR_Array  :=
      "acmchoose_help" & Nul;
   ACMHELPMSGSTRINGW                           : constant WCHAR_Array :=
      To_Win (C.To_C ("acmchoose_help")) & Wide_Nul;
   ACMHELPMSGSTRING                            : CHAR_Array renames
     ACMHELPMSGSTRINGA;
   MM_ACM_FORMATCHOOSE                         : constant := 16#8000#;
   FORMATCHOOSE_MESSAGE                        : constant := 0;
   FORMATCHOOSE_FORMATTAG_VERIFY               : constant := 0;
   FORMATCHOOSE_FORMAT_VERIFY                  : constant := 1;
   FORMATCHOOSE_CUSTOM_VERIFY                  : constant := 2;
   ACMFORMATCHOOSE_STYLEF_SHOWHELP             : constant := 16#4#;
   ACMFORMATCHOOSE_STYLEF_ENABLEHOOK           : constant := 16#8#;
   ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATE       : constant := 16#10#;
   ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATEHANDLE : constant := 16#20#;
   ACMFORMATCHOOSE_STYLEF_INITTOWFXSTRUCT      : constant := 16#40#;
   ACMFILTERTAGDETAILS_FILTERTAG_CHARS         : constant := 48;
   ACM_FILTERTAGDETAILSF_INDEX                 : constant := 16#0#;
   ACM_FILTERTAGDETAILSF_FILTERTAG             : constant := 16#1#;
   ACM_FILTERTAGDETAILSF_LARGESTSIZE           : constant := 16#2#;
   ACM_FILTERTAGDETAILSF_QUERYMASK             : constant := 16#f#;
   ACMFILTERDETAILS_FILTER_CHARS               : constant := 128;
   ACM_FILTERDETAILSF_INDEX                    : constant := 16#0#;
   ACM_FILTERDETAILSF_FILTER                   : constant := 16#1#;
   ACM_FILTERDETAILSF_QUERYMASK                : constant := 16#f#;
   ACM_FILTERENUMF_DWFILTERTAG                 : constant := 16#10000#;
   MM_ACM_FILTERCHOOSE                         : constant := 16#8000#;
   FILTERCHOOSE_MESSAGE                        : constant := 0;
   FILTERCHOOSE_FILTERTAG_VERIFY               : constant := 0;
   FILTERCHOOSE_FILTER_VERIFY                  : constant := 1;
   FILTERCHOOSE_CUSTOM_VERIFY                  : constant := 2;
   ACMFILTERCHOOSE_STYLEF_SHOWHELP             : constant := 16#4#;
   ACMFILTERCHOOSE_STYLEF_ENABLEHOOK           : constant := 16#8#;
   ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATE       : constant := 16#10#;
   ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATEHANDLE : constant := 16#20#;
   ACMFILTERCHOOSE_STYLEF_INITTOFILTERSTRUCT   : constant := 16#40#;
   ACMSTREAMHEADER_STATUSF_DONE                : constant := 16#10000#;
   ACMSTREAMHEADER_STATUSF_PREPARED            : constant := 16#20000#;
   ACMSTREAMHEADER_STATUSF_INQUEUE             : constant := 16#100000#;
   ACM_STREAMOPENF_QUERY                       : constant := 16#1#;
   ACM_STREAMOPENF_ASYNC                       : constant := 16#2#;
   ACM_STREAMOPENF_NONREALTIME                 : constant := 16#4#;
   ACM_STREAMSIZEF_SOURCE                      : constant := 16#0#;
   ACM_STREAMSIZEF_DESTINATION                 : constant := 16#1#;
   ACM_STREAMSIZEF_QUERYMASK                   : constant := 16#f#;
   ACM_STREAMCONVERTF_BLOCKALIGN               : constant := 16#4#;
   ACM_STREAMCONVERTF_START                    : constant := 16#10#;
   ACM_STREAMCONVERTF_END                      : constant := 16#20#;

   subtype HACMDRIVERID is Win32.Winnt.HANDLE;
   type PHACMDRIVERID is access all HACMDRIVERID;
   subtype LPHACMDRIVERID is PHACMDRIVERID;

   subtype HACMDRIVER is Win32.Winnt.HANDLE;
   type PHACMDRIVER is access all HACMDRIVER;
   subtype LPHACMDRIVER is PHACMDRIVER;

   subtype HACMSTREAM is Win32.Winnt.HANDLE;
   type PHACMSTREAM is access all HACMSTREAM;
   subtype LPHACMSTREAM is PHACMSTREAM;

   subtype HACMOBJ is Win32.Winnt.HANDLE;
   type PHACMOBJ is access all HACMOBJ;
   subtype LPHACMOBJ is PHACMOBJ;

   type ACMDRIVERDETAILSA;
   type ACMDRIVERDETAILSW;
   type ACMFORMATTAGDETAILSA;
   type ACMFORMATTAGDETAILSW;
   type ACMFORMATDETAILSA;
   type ACMFORMATDETAILSW;
   type ACMFORMATCHOOSEA;
   type ACMFORMATCHOOSEW;
   type ACMFILTERTAGDETAILSA;
   type ACMFILTERTAGDETAILSW;
   type ACMFILTERDETAILSA;
   type ACMFILTERDETAILSW;
   type ACMFILTERCHOOSEA;
   type ACMFILTERCHOOSEW;
   type ACMSTREAMHEADER;

   type PACMDRIVERDETAILSA is access all ACMDRIVERDETAILSA;
   subtype PACMDRIVERDETAILS is PACMDRIVERDETAILSA;
   subtype LPACMDRIVERDETAILSA is PACMDRIVERDETAILSA;
   subtype LPACMDRIVERDETAILS is LPACMDRIVERDETAILSA;
   type PACMDRIVERDETAILSW is access all ACMDRIVERDETAILSW;
   subtype LPACMDRIVERDETAILSW is PACMDRIVERDETAILSW;
   type PACMFORMATTAGDETAILSA is access all ACMFORMATTAGDETAILSA;
   subtype PACMFORMATTAGDETAILS is PACMFORMATTAGDETAILSA;
   subtype LPACMFORMATTAGDETAILSA is PACMFORMATTAGDETAILSA;
   subtype LPACMFORMATTAGDETAILS is LPACMFORMATTAGDETAILSA;
   type PACMFORMATTAGDETAILSW is access all ACMFORMATTAGDETAILSW;
   subtype LPACMFORMATTAGDETAILSW is PACMFORMATTAGDETAILSW;
   type PACMFORMATDETAILSA is access all ACMFORMATDETAILSA;
   subtype PACMFORMATDETAILS is PACMFORMATDETAILSA;
   subtype LPACMFORMATDETAILSA is PACMFORMATDETAILSA;
   subtype LPACMFORMATDETAILS is LPACMFORMATDETAILSA;
   type PACMFORMATDETAILSW is access all ACMFORMATDETAILSW;
   subtype LPACMFORMATDETAILSW is PACMFORMATDETAILSW;
   type PACMFORMATCHOOSEA is access all ACMFORMATCHOOSEA;
   subtype PACMFORMATCHOOSE is PACMFORMATCHOOSEA;
   subtype LPACMFORMATCHOOSEA is PACMFORMATCHOOSEA;
   subtype LPACMFORMATCHOOSE is LPACMFORMATCHOOSEA;
   type PACMFORMATCHOOSEW is access all ACMFORMATCHOOSEW;
   subtype LPACMFORMATCHOOSEW is PACMFORMATCHOOSEW;
   type PACMFILTERTAGDETAILSA is access all ACMFILTERTAGDETAILSA;
   subtype PACMFILTERTAGDETAILS is PACMFILTERTAGDETAILSA;
   subtype LPACMFILTERTAGDETAILSA is PACMFILTERTAGDETAILSA;
   subtype LPACMFILTERTAGDETAILS is LPACMFILTERTAGDETAILSA;
   type PACMFILTERTAGDETAILSW is access all ACMFILTERTAGDETAILSW;
   subtype LPACMFILTERTAGDETAILSW is PACMFILTERTAGDETAILSW;
   type PACMFILTERDETAILSA is access all ACMFILTERDETAILSA;
   subtype PACMFILTERDETAILS is PACMFILTERDETAILSA;
   subtype LPACMFILTERDETAILSA is PACMFILTERDETAILSA;
   subtype LPACMFILTERDETAILS is LPACMFILTERDETAILSA;
   type PACMFILTERDETAILSW is access all ACMFILTERDETAILSW;
   subtype LPACMFILTERDETAILSW is PACMFILTERDETAILSW;
   type PACMFILTERCHOOSEA is access all ACMFILTERCHOOSEA;
   subtype PACMFILTERCHOOSE is PACMFILTERCHOOSEA;
   subtype LPACMFILTERCHOOSEA is PACMFILTERCHOOSEA;
   subtype LPACMFILTERCHOOSE is LPACMFILTERCHOOSEA;
   type PACMFILTERCHOOSEW is access all ACMFILTERCHOOSEW;
   subtype LPACMFILTERCHOOSEW is PACMFILTERCHOOSEW;
   type PACMSTREAMHEADER is access all ACMSTREAMHEADER;
   subtype LPACMSTREAMHEADER is PACMSTREAMHEADER;

   type ACMDRIVERENUMCB is access function
     (hadid      : HACMDRIVERID;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMDRIVERENUMCB);

   type ACMDRIVERPROC is access function
     (p1   : Win32.DWORD;
      p2   : HACMDRIVERID;
      p3   : Win32.UINT;
      p4   : Win32.LPARAM;
      p5   : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, ACMDRIVERPROC);

   type LPACMDRIVERPROC is access all ACMDRIVERPROC;

   type ACMDRIVERDETAILSA is record
      cbStruct    : Win32.DWORD;
      fccType     : Win32.Mmsystem.FOURCC;
      fccComp     : Win32.Mmsystem.FOURCC;
      wMid        : Win32.WORD;
      wPid        : Win32.WORD;
      vdwACM      : Win32.DWORD;
      vdwDriver   : Win32.DWORD;
      fdwSupport  : Win32.DWORD;
      cFormatTags : Win32.DWORD;
      cFilterTags : Win32.DWORD;
      hicon       : Win32.Windef.HICON;
      szShortName : Win32.CHAR_Array (
         0 .. ACMDRIVERDETAILS_SHORTNAME_CHARS - 1);
      szLongName  : Win32.CHAR_Array (
         0 .. ACMDRIVERDETAILS_LONGNAME_CHARS - 1);
      szCopyright : Win32.CHAR_Array (
         0 .. ACMDRIVERDETAILS_COPYRIGHT_CHARS - 1);
      szLicensing : Win32.CHAR_Array (
         0 .. ACMDRIVERDETAILS_LICENSING_CHARS - 1);
      szFeatures  : Win32.CHAR_Array (
         0 .. ACMDRIVERDETAILS_FEATURES_CHARS - 1);
   end record;

   subtype ACMDRIVERDETAILS is ACMDRIVERDETAILSA;

   type ACMDRIVERDETAILSW is record
      cbStruct    : Win32.DWORD;
      fccType     : Win32.Mmsystem.FOURCC;
      fccComp     : Win32.Mmsystem.FOURCC;
      wMid        : Win32.WORD;
      wPid        : Win32.WORD;
      vdwACM      : Win32.DWORD;
      vdwDriver   : Win32.DWORD;
      fdwSupport  : Win32.DWORD;
      cFormatTags : Win32.DWORD;
      cFilterTags : Win32.DWORD;
      hicon       : Win32.Windef.HICON;
      szShortName : Win32.WCHAR_Array (
         0 .. ACMDRIVERDETAILS_SHORTNAME_CHARS - 1);
      szLongName  : Win32.WCHAR_Array (
         0 .. ACMDRIVERDETAILS_LONGNAME_CHARS - 1);
      szCopyright : Win32.WCHAR_Array (
         0 .. ACMDRIVERDETAILS_COPYRIGHT_CHARS - 1);
      szLicensing : Win32.WCHAR_Array (
         0 .. ACMDRIVERDETAILS_LICENSING_CHARS - 1);
      szFeatures  : Win32.WCHAR_Array (
         0 .. ACMDRIVERDETAILS_FEATURES_CHARS - 1);
   end record;

   type ACMFORMATTAGDETAILSA is record
      cbStruct         : Win32.DWORD;
      dwFormatTagIndex : Win32.DWORD;
      dwFormatTag      : Win32.DWORD;
      cbFormatSize     : Win32.DWORD;
      fdwSupport       : Win32.DWORD;
      cStandardFormats : Win32.DWORD;
      szFormatTag      : Win32.CHAR_Array (
         0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
   end record;

   subtype ACMFORMATTAGDETAILS is ACMFORMATTAGDETAILSA;

   type ACMFORMATTAGDETAILSW is record
      cbStruct         : Win32.DWORD;
      dwFormatTagIndex : Win32.DWORD;
      dwFormatTag      : Win32.DWORD;
      cbFormatSize     : Win32.DWORD;
      fdwSupport       : Win32.DWORD;
      cStandardFormats : Win32.DWORD;
      szFormatTag      : Win32.WCHAR_Array (
         0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
   end record;

   type ACMFORMATTAGENUMCBA is access function
     (hadid      : HACMDRIVERID;
      paftd      : LPACMFORMATTAGDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFORMATTAGENUMCBA);
   subtype ACMFORMATTAGENUMCB is ACMFORMATTAGENUMCBA;
   type ACMFORMATTAGENUMCBW is access function
     (hadid      : HACMDRIVERID;
      paftd      : LPACMFORMATTAGDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFORMATTAGENUMCBW);

   type ACMFORMATDETAILSA is record
      cbStruct      : Win32.DWORD;
      dwFormatIndex : Win32.DWORD;
      dwFormatTag   : Win32.DWORD;
      fdwSupport    : Win32.DWORD;
      pwfx          : Win32.Mmsystem.LPWAVEFORMATEX;
      cbwfx         : Win32.DWORD;
      szFormat      : Win32.CHAR_Array (
         0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
   end record;

   subtype ACMFORMATDETAILS is ACMFORMATDETAILSA;

   type ACMFORMATDETAILSW is record
      cbStruct      : Win32.DWORD;
      dwFormatIndex : Win32.DWORD;
      dwFormatTag   : Win32.DWORD;
      fdwSupport    : Win32.DWORD;
      pwfx          : Win32.Mmsystem.LPWAVEFORMATEX;
      cbwfx         : Win32.DWORD;
      szFormat      : Win32.WCHAR_Array (
         0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
   end record;

   type ACMFORMATENUMCBA is access function
     (hadid      : HACMDRIVERID;
      pafd       : LPACMFORMATDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFORMATENUMCBA);
   subtype ACMFORMATENUMCB is ACMFORMATENUMCBA;
   type ACMFORMATENUMCBW is access function
     (hadid      : HACMDRIVERID;
      pafd       : LPACMFORMATDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFORMATENUMCBW);
   type ACMFORMATCHOOSEHOOKPROCA is access function
     (hwnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, ACMFORMATCHOOSEHOOKPROCA);
   subtype ACMFORMATCHOOSEHOOKPROC is ACMFORMATCHOOSEHOOKPROCA;
   type ACMFORMATCHOOSEHOOKPROCW is access function
     (hwnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, ACMFORMATCHOOSEHOOKPROCW);

   type ACMFORMATCHOOSEA is record
      cbStruct        : Win32.DWORD;
      fdwStyle        : Win32.DWORD;
      hwndOwner       : Win32.Windef.HWND;
      pwfx            : Win32.Mmsystem.LPWAVEFORMATEX;
      cbwfx           : Win32.DWORD;
      pszTitle        : Win32.LPCSTR;
      szFormatTag     : Win32.CHAR_Array (
         0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
      szFormat        : Win32.CHAR_Array (
         0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
      pszName         : Win32.LPSTR;
      cchName         : Win32.DWORD;
      fdwEnum         : Win32.DWORD;
      pwfxEnum        : Win32.Mmsystem.LPWAVEFORMATEX;
      hInstance       : Win32.Windef.HINSTANCE;
      pszTemplateName : Win32.LPCSTR;
      lCustData       : Win32.LPARAM;
      pfnHook         : ACMFORMATCHOOSEHOOKPROCA;
   end record;

   subtype ACMFORMATCHOOSE is ACMFORMATCHOOSEA;

   type ACMFORMATCHOOSEW is record
      cbStruct        : Win32.DWORD;
      fdwStyle        : Win32.DWORD;
      hwndOwner       : Win32.Windef.HWND;
      pwfx            : Win32.Mmsystem.LPWAVEFORMATEX;
      cbwfx           : Win32.DWORD;
      pszTitle        : Win32.LPCWSTR;
      szFormatTag     : Win32.WCHAR_Array (
         0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
      szFormat        : Win32.WCHAR_Array (
         0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
      pszName         : Win32.LPWSTR;
      cchName         : Win32.DWORD;
      fdwEnum         : Win32.DWORD;
      pwfxEnum        : Win32.Mmsystem.LPWAVEFORMATEX;
      hInstance       : Win32.Windef.HINSTANCE;
      pszTemplateName : Win32.LPCWSTR;
      lCustData       : Win32.LPARAM;
      pfnHook         : ACMFORMATCHOOSEHOOKPROCW;
   end record;

   type ACMFILTERTAGDETAILSA is record
      cbStruct         : Win32.DWORD;
      dwFilterTagIndex : Win32.DWORD;
      dwFilterTag      : Win32.DWORD;
      cbFilterSize     : Win32.DWORD;
      fdwSupport       : Win32.DWORD;
      cStandardFilters : Win32.DWORD;
      szFilterTag      : Win32.CHAR_Array (
         0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
   end record;

   subtype ACMFILTERTAGDETAILS is ACMFILTERTAGDETAILSA;

   type ACMFILTERTAGDETAILSW is record
      cbStruct         : Win32.DWORD;
      dwFilterTagIndex : Win32.DWORD;
      dwFilterTag      : Win32.DWORD;
      cbFilterSize     : Win32.DWORD;
      fdwSupport       : Win32.DWORD;
      cStandardFilters : Win32.DWORD;
      szFilterTag      : Win32.WCHAR_Array (
         0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
   end record;

   type ACMFILTERTAGENUMCBA is access function
     (hadid      : HACMDRIVERID;
      paftd      : LPACMFILTERTAGDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFILTERTAGENUMCBA);
   subtype ACMFILTERTAGENUMCB is ACMFILTERTAGENUMCBA;
   type ACMFILTERTAGENUMCBW is access function
     (hadid      : HACMDRIVERID;
      paftd      : LPACMFILTERTAGDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFILTERTAGENUMCBW);

   type ACMFILTERDETAILSA is record
      cbStruct      : Win32.DWORD;
      dwFilterIndex : Win32.DWORD;
      dwFilterTag   : Win32.DWORD;
      fdwSupport    : Win32.DWORD;
      pwfltr        : Win32.Mmreg.LPWAVEFILTER;
      cbwfltr       : Win32.DWORD;
      szFilter      : Win32.CHAR_Array (
         0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
   end record;

   subtype ACMFILTERDETAILS is ACMFILTERDETAILSA;

   type ACMFILTERDETAILSW is record
      cbStruct      : Win32.DWORD;
      dwFilterIndex : Win32.DWORD;
      dwFilterTag   : Win32.DWORD;
      fdwSupport    : Win32.DWORD;
      pwfltr        : Win32.Mmreg.LPWAVEFILTER;
      cbwfltr       : Win32.DWORD;
      szFilter      : Win32.WCHAR_Array (
         0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
   end record;

   type ACMFILTERENUMCBA is access function
     (hadid      : HACMDRIVERID;
      pafd       : LPACMFILTERDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFILTERENUMCBA);
   subtype ACMFILTERENUMCB is ACMFILTERENUMCBA;
   type ACMFILTERENUMCBW is access function
     (hadid      : HACMDRIVERID;
      pafd       : LPACMFILTERDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, ACMFILTERENUMCBW);
   type ACMFILTERCHOOSEHOOKPROCA is access function
     (hwnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, ACMFILTERCHOOSEHOOKPROCA);
   subtype ACMFILTERCHOOSEHOOKPROC is ACMFILTERCHOOSEHOOKPROCA;
   type ACMFILTERCHOOSEHOOKPROCW is access function
     (hwnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, ACMFILTERCHOOSEHOOKPROCW);

   type ACMFILTERCHOOSEA is record
      cbStruct        : Win32.DWORD;
      fdwStyle        : Win32.DWORD;
      hwndOwner       : Win32.Windef.HWND;
      pwfltr          : Win32.Mmreg.LPWAVEFILTER;
      cbwfltr         : Win32.DWORD;
      pszTitle        : Win32.LPCSTR;
      szFilterTag     : Win32.CHAR_Array (
         0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
      szFilter        : Win32.CHAR_Array (
         0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
      pszName         : Win32.LPSTR;
      cchName         : Win32.DWORD;
      fdwEnum         : Win32.DWORD;
      pwfltrEnum      : Win32.Mmreg.LPWAVEFILTER;
      hInstance       : Win32.Windef.HINSTANCE;
      pszTemplateName : Win32.LPCSTR;
      lCustData       : Win32.LPARAM;
      pfnHook         : ACMFILTERCHOOSEHOOKPROCA;
   end record;

   subtype ACMFILTERCHOOSE is ACMFILTERCHOOSEA;

   type ACMFILTERCHOOSEW is record
      cbStruct        : Win32.DWORD;
      fdwStyle        : Win32.DWORD;
      hwndOwner       : Win32.Windef.HWND;
      pwfltr          : Win32.Mmreg.LPWAVEFILTER;
      cbwfltr         : Win32.DWORD;
      pszTitle        : Win32.LPCWSTR;
      szFilterTag     : Win32.WCHAR_Array (
         0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
      szFilter        : Win32.WCHAR_Array (
         0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
      pszName         : Win32.LPWSTR;
      cchName         : Win32.DWORD;
      fdwEnum         : Win32.DWORD;
      pwfltrEnum      : Win32.Mmreg.LPWAVEFILTER;
      hInstance       : Win32.Windef.HINSTANCE;
      pszTemplateName : Win32.LPCWSTR;
      lCustData       : Win32.LPARAM;
      pfnHook         : ACMFILTERCHOOSEHOOKPROCW;
   end record;

   type ACMSTREAMHEADER is record
      cbStruct         : Win32.DWORD;
      fdwStatus        : Win32.DWORD;
      dwUser           : Win32.DWORD;
      pbSrc            : Win32.LPBYTE;
      cbSrcLength      : Win32.DWORD;
      cbSrcLengthUsed  : Win32.DWORD;
      dwSrcUser        : Win32.DWORD;
      pbDst            : Win32.LPBYTE;
      cbDstLength      : Win32.DWORD;
      cbDstLengthUsed  : Win32.DWORD;
      dwDstUser        : Win32.DWORD;
      dwReservedDriver : Win32.DWORD_Array (0 .. 9);
   end record;

   function acmGetVersion return Win32.DWORD;

   function acmMetrics
     (hao     : HACMOBJ;
      uMetric : Win32.UINT;
      pMetric : Win32.LPVOID)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverEnum
     (fnCallback : ACMDRIVERENUMCB;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverID
     (hao         : HACMOBJ;
      phadid      : LPHACMDRIVERID;
      fdwDriverID : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverAddA
     (phadid      : LPHACMDRIVERID;
      hinstModule : Win32.Windef.HINSTANCE;
      lParam      : Win32.LPARAM;
      dwPriority  : Win32.DWORD;
      fdwAdd      : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverAdd
     (phadid      : LPHACMDRIVERID;
      hinstModule : Win32.Windef.HINSTANCE;
      lParam      : Win32.LPARAM;
      dwPriority  : Win32.DWORD;
      fdwAdd      : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmDriverAddA;

   function acmDriverAddW
     (phadid      : LPHACMDRIVERID;
      hinstModule : Win32.Windef.HINSTANCE;
      lParam      : Win32.LPARAM;
      dwPriority  : Win32.DWORD;
      fdwAdd      : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverRemove
     (hadid     : HACMDRIVERID;
      fdwRemove : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverOpen
     (phad    : LPHACMDRIVER;
      hadid   : HACMDRIVERID;
      fdwOpen : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverClose
     (had      : HACMDRIVER;
      fdwClose : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverMessage
     (had     : HACMDRIVER;
      uMsg    : Win32.UINT;
      lParam1 : Win32.LPARAM;
      lParam2 : Win32.LPARAM)
      return Win32.LRESULT;

   function acmDriverPriority
     (hadid       : HACMDRIVERID;
      dwPriority  : Win32.DWORD;
      fdwPriority : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverDetailsA_func
     (hadid      : HACMDRIVERID;
      padd       : LPACMDRIVERDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmDriverDetails_func
     (hadid      : HACMDRIVERID;
      padd       : LPACMDRIVERDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmDriverDetailsA_func;

   function acmDriverDetailsW_func
     (hadid      : HACMDRIVERID;
      padd       : LPACMDRIVERDETAILSW;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatTagDetailsA_func
     (had        : HACMDRIVER;
      paftd      : LPACMFORMATTAGDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatTagDetails_func
     (had        : HACMDRIVER;
      paftd      : LPACMFORMATTAGDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFormatTagDetailsA_func;

   function acmFormatTagDetailsW_func
     (had        : HACMDRIVER;
      paftd      : LPACMFORMATTAGDETAILSW;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatTagEnumA
     (had        : HACMDRIVER;
      paftd      : LPACMFORMATTAGDETAILSA;
      fnCallback : ACMFORMATTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatTagEnum
     (had        : HACMDRIVER;
      paftd      : LPACMFORMATTAGDETAILSA;
      fnCallback : ACMFORMATTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFormatTagEnumA;

   function acmFormatTagEnumW
     (had        : HACMDRIVER;
      paftd      : LPACMFORMATTAGDETAILSW;
      fnCallback : ACMFORMATTAGENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatDetailsA_func
     (had        : HACMDRIVER;
      pafd       : LPACMFORMATDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatDetails_func
     (had        : HACMDRIVER;
      pafd       : LPACMFORMATDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFormatDetailsA_func;

   function acmFormatDetailsW_func
     (had        : HACMDRIVER;
      pafd       : LPACMFORMATDETAILSW;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatEnumA
     (had        : HACMDRIVER;
      pafd       : LPACMFORMATDETAILSA;
      fnCallback : ACMFORMATENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatEnum
     (had        : HACMDRIVER;
      pafd       : LPACMFORMATDETAILSA;
      fnCallback : ACMFORMATENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFormatEnumA;

   function acmFormatEnumW
     (had        : HACMDRIVER;
      pafd       : LPACMFORMATDETAILSW;
      fnCallback : ACMFORMATENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatSuggest
     (had        : HACMDRIVER;
      pwfxSrc    : Win32.Mmsystem.LPWAVEFORMATEX;
      pwfxDst    : Win32.Mmsystem.LPWAVEFORMATEX;
      cbwfxDst   : Win32.DWORD;
      fdwSuggest : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatChooseA_func
     (pafmtc : LPACMFORMATCHOOSEA)
      return Win32.Mmsystem.MMRESULT;

   function acmFormatChoose_func
     (pafmtc : LPACMFORMATCHOOSEA)
      return Win32.Mmsystem.MMRESULT renames acmFormatChooseA_func;

   function acmFormatChooseW_func
     (pafmtc : LPACMFORMATCHOOSEW)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterTagDetailsA_func
     (had        : HACMDRIVER;
      paftd      : LPACMFILTERTAGDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterTagDetails_func
     (had        : HACMDRIVER;
      paftd      : LPACMFILTERTAGDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFilterTagDetailsA_func;

   function acmFilterTagDetailsW_func
     (had        : HACMDRIVER;
      paftd      : LPACMFILTERTAGDETAILSW;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterTagEnumA
     (had        : HACMDRIVER;
      paftd      : LPACMFILTERTAGDETAILSA;
      fnCallback : ACMFILTERTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterTagEnum
     (had        : HACMDRIVER;
      paftd      : LPACMFILTERTAGDETAILSA;
      fnCallback : ACMFILTERTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFilterTagEnumA;

   function acmFilterTagEnumW
     (had        : HACMDRIVER;
      paftd      : LPACMFILTERTAGDETAILSW;
      fnCallback : ACMFILTERTAGENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterDetailsA_func
     (had        : HACMDRIVER;
      pafd       : LPACMFILTERDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterDetails_func
     (had        : HACMDRIVER;
      pafd       : LPACMFILTERDETAILSA;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFilterDetailsA_func;

   function acmFilterDetailsW_func
     (had        : HACMDRIVER;
      pafd       : LPACMFILTERDETAILSW;
      fdwDetails : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterEnumA
     (had        : HACMDRIVER;
      pafd       : LPACMFILTERDETAILSA;
      fnCallback : ACMFILTERENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterEnum
     (had        : HACMDRIVER;
      pafd       : LPACMFILTERDETAILSA;
      fnCallback : ACMFILTERENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT renames acmFilterEnumA;

   function acmFilterEnumW
     (had        : HACMDRIVER;
      pafd       : LPACMFILTERDETAILSW;
      fnCallback : ACMFILTERENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterChooseA_func
     (pafltrc : LPACMFILTERCHOOSEA)
      return Win32.Mmsystem.MMRESULT;

   function acmFilterChoose_func
     (pafltrc : LPACMFILTERCHOOSEA)
      return Win32.Mmsystem.MMRESULT renames acmFilterChooseA_func;

   function acmFilterChooseW_func
     (pafltrc : LPACMFILTERCHOOSEW)
      return Win32.Mmsystem.MMRESULT;

   function acmStreamOpen
     (phas       : LPHACMSTREAM;
      had        : HACMDRIVER;
      pwfxSrc    : Win32.Mmsystem.LPWAVEFORMATEX;
      pwfxDst    : Win32.Mmsystem.LPWAVEFORMATEX;
      pwfltr     : Win32.Mmreg.LPWAVEFILTER;
      dwCallback : Win32.DWORD;
      dwInstance : Win32.DWORD;
      fdwOpen    : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmStreamClose
     (has      : HACMSTREAM;
      fdwClose : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmStreamSize
     (has            : HACMSTREAM;
      cbInput        : Win32.DWORD;
      pdwOutputBytes : Win32.LPDWORD;
      fdwSize        : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmStreamReset
     (has      : HACMSTREAM;
      fdwReset : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmStreamConvert
     (has        : HACMSTREAM;
      pash       : LPACMSTREAMHEADER;
      fdwConvert : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmStreamPrepareHeader
     (has        : HACMSTREAM;
      pash       : LPACMSTREAMHEADER;
      fdwPrepare : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

   function acmStreamUnprepareHeader
     (has          : HACMSTREAM;
      pash         : LPACMSTREAMHEADER;
      fdwUnprepare : Win32.DWORD)
      return Win32.Mmsystem.MMRESULT;

private

   pragma Convention (C, ACMDRIVERDETAILSA);
   pragma Convention (C, ACMDRIVERDETAILSW);
   pragma Convention (C, ACMFORMATTAGDETAILSA);
   pragma Convention (C, ACMFORMATTAGDETAILSW);
   pragma Convention (C, ACMFORMATDETAILSA);
   pragma Convention (C, ACMFORMATDETAILSW);
   pragma Convention (C, ACMFORMATCHOOSEA);
   pragma Convention (C, ACMFORMATCHOOSEW);
   pragma Convention (C, ACMFILTERTAGDETAILSA);
   pragma Convention (C, ACMFILTERTAGDETAILSW);
   pragma Convention (C, ACMFILTERDETAILSA);
   pragma Convention (C, ACMFILTERDETAILSW);
   pragma Convention (C, ACMFILTERCHOOSEA);
   pragma Convention (C, ACMFILTERCHOOSEW);
   pragma Convention (C, ACMSTREAMHEADER);

   pragma Import (Stdcall, acmGetVersion, "acmGetVersion");
   pragma Import (Stdcall, acmMetrics, "acmMetrics");
   pragma Import (Stdcall, acmDriverEnum, "acmDriverEnum");
   pragma Import (Stdcall, acmDriverID, "acmDriverID");
   pragma Import (Stdcall, acmDriverAddA, "acmDriverAddA");
   pragma Import (Stdcall, acmDriverAddW, "acmDriverAddW");
   pragma Import (Stdcall, acmDriverRemove, "acmDriverRemove");
   pragma Import (Stdcall, acmDriverOpen, "acmDriverOpen");
   pragma Import (Stdcall, acmDriverClose, "acmDriverClose");
   pragma Import (Stdcall, acmDriverMessage, "acmDriverMessage");
   pragma Import (Stdcall, acmDriverPriority, "acmDriverPriority");
   pragma Import (Stdcall, acmDriverDetailsA_func, "acmDriverDetailsA");
   pragma Import (Stdcall, acmDriverDetailsW_func, "acmDriverDetailsW");
   pragma Import (Stdcall, acmFormatTagDetailsA_func, "acmFormatTagDetailsA");
   pragma Import (Stdcall, acmFormatTagDetailsW_func, "acmFormatTagDetailsW");
   pragma Import (Stdcall, acmFormatTagEnumA, "acmFormatTagEnumA");
   pragma Import (Stdcall, acmFormatTagEnumW, "acmFormatTagEnumW");
   pragma Import (Stdcall, acmFormatDetailsA_func, "acmFormatDetailsA");
   pragma Import (Stdcall, acmFormatDetailsW_func, "acmFormatDetailsW");
   pragma Import (Stdcall, acmFormatEnumA, "acmFormatEnumA");
   pragma Import (Stdcall, acmFormatEnumW, "acmFormatEnumW");
   pragma Import (Stdcall, acmFormatSuggest, "acmFormatSuggest");
   pragma Import (Stdcall, acmFormatChooseA_func, "acmFormatChooseA");
   pragma Import (Stdcall, acmFormatChooseW_func, "acmFormatChooseW");
   pragma Import (Stdcall, acmFilterTagDetailsA_func, "acmFilterTagDetailsA");
   pragma Import (Stdcall, acmFilterTagDetailsW_func, "acmFilterTagDetailsW");
   pragma Import (Stdcall, acmFilterTagEnumA, "acmFilterTagEnumA");
   pragma Import (Stdcall, acmFilterTagEnumW, "acmFilterTagEnumW");
   pragma Import (Stdcall, acmFilterDetailsA_func, "acmFilterDetailsA");
   pragma Import (Stdcall, acmFilterDetailsW_func, "acmFilterDetailsW");
   pragma Import (Stdcall, acmFilterEnumA, "acmFilterEnumA");
   pragma Import (Stdcall, acmFilterEnumW, "acmFilterEnumW");
   pragma Import (Stdcall, acmFilterChooseA_func, "acmFilterChooseA");
   pragma Import (Stdcall, acmFilterChooseW_func, "acmFilterChooseW");
   pragma Import (Stdcall, acmStreamOpen, "acmStreamOpen");
   pragma Import (Stdcall, acmStreamClose, "acmStreamClose");
   pragma Import (Stdcall, acmStreamSize, "acmStreamSize");
   pragma Import (Stdcall, acmStreamReset, "acmStreamReset");
   pragma Import (Stdcall, acmStreamConvert, "acmStreamConvert");
   pragma Import (Stdcall, acmStreamPrepareHeader, "acmStreamPrepareHeader");
   pragma Import
     (Stdcall,
      acmStreamUnprepareHeader,
      "acmStreamUnprepareHeader");

end Win32.Msacm;
