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

with Win32.Mmreg;
with Win32.Mmsystem;
with Win32.Windef;
with Win32.Winnt;

package Win32.Msacm is

   use Interfaces;
   use type Interfaces.C.char_array;

   DRV_MAPPER_PREFERRED_INPUT_GET : constant := 16#4000#; --  msacm.h:53
   DRV_MAPPER_PREFERRED_OUTPUT_GET : constant := 16#4002#; --  msacm.h:57
   DRVM_MAPPER_STATUS : constant := 16#2000#; --  msacm.h:62
   WIDM_MAPPER_STATUS : constant := 16#2000#; --  msacm.h:66
   WAVEIN_MAPPER_STATUS_DEVICE : constant := 0;       --  msacm.h:67
   WAVEIN_MAPPER_STATUS_MAPPED : constant := 1;       --  msacm.h:68
   WAVEIN_MAPPER_STATUS_FORMAT : constant := 2;       --  msacm.h:69
   WODM_MAPPER_STATUS : constant := 16#2000#; --  msacm.h:73
   WAVEOUT_MAPPER_STATUS_DEVICE : constant := 0;       --  msacm.h:74
   WAVEOUT_MAPPER_STATUS_MAPPED : constant := 1;       --  msacm.h:75
   WAVEOUT_MAPPER_STATUS_FORMAT : constant := 2;       --  msacm.h:76
   ACMERR_BASE : constant := 512;     --  msacm.h:161
   ACMERR_NOTPOSSIBLE : constant := 512;     --  msacm.h:162
   ACMERR_BUSY : constant := 513;     --  msacm.h:163
   ACMERR_UNPREPARED : constant := 514;     --  msacm.h:164
   ACMERR_CANCELED : constant := 515;     --  msacm.h:165
   ACM_METRIC_COUNT_DRIVERS : constant := 1;       --  msacm.h:207
   ACM_METRIC_COUNT_CODECS : constant := 2;       --  msacm.h:208
   ACM_METRIC_COUNT_CONVERTERS : constant := 3;       --  msacm.h:209
   ACM_METRIC_COUNT_FILTERS : constant := 4;       --  msacm.h:210
   ACM_METRIC_COUNT_DISABLED : constant := 5;       --  msacm.h:211
   ACM_METRIC_COUNT_HARDWARE : constant := 6;       --  msacm.h:212
   ACM_METRIC_COUNT_LOCAL_DRIVERS : constant := 20;      --  msacm.h:213
   ACM_METRIC_COUNT_LOCAL_CODECS : constant := 21;      --  msacm.h:214
   ACM_METRIC_COUNT_LOCAL_CONVERTERS : constant := 22;      --  msacm.h:215
   ACM_METRIC_COUNT_LOCAL_FILTERS : constant := 23;      --  msacm.h:216
   ACM_METRIC_COUNT_LOCAL_DISABLED : constant := 24;      --  msacm.h:217
   ACM_METRIC_HARDWARE_WAVE_INPUT : constant := 30;      --  msacm.h:218
   ACM_METRIC_HARDWARE_WAVE_OUTPUT : constant := 31;      --  msacm.h:219
   ACM_METRIC_MAX_SIZE_FORMAT : constant := 50;      --  msacm.h:220
   ACM_METRIC_MAX_SIZE_FILTER : constant := 51;      --  msacm.h:221
   ACM_METRIC_DRIVER_SUPPORT : constant := 100;     --  msacm.h:222
   ACM_METRIC_DRIVER_PRIORITY : constant := 101;     --  msacm.h:223
   ACM_DRIVERENUMF_NOLOCAL : constant := 16#40000000#;
   --  msacm.h:256
   ACM_DRIVERENUMF_DISABLED : constant := 16#80000000#;
   --  msacm.h:257
   ACM_DRIVERADDF_FUNCTION : constant := 16#3#;   --  msacm.h:320
   ACM_DRIVERADDF_NOTIFYHWND : constant := 16#4#;   --  msacm.h:321
   ACM_DRIVERADDF_TYPEMASK : constant := 16#7#;   --  msacm.h:322
   ACM_DRIVERADDF_LOCAL : constant := 16#0#;   --  msacm.h:323
   ACM_DRIVERADDF_GLOBAL : constant := 16#8#;   --  msacm.h:324
   ACMDM_USER : constant := 16#4000#; --  msacm.h:402
   ACMDM_RESERVED_LOW : constant := 16#6000#; --  msacm.h:403
   ACMDM_RESERVED_HIGH : constant := 16#6fff#; --  msacm.h:404
   ACMDM_BASE : constant := 16#6000#; --  msacm.h:406
   ACMDM_DRIVER_ABOUT : constant := 16#600b#; --  msacm.h:408
   ACM_DRIVERPRIORITYF_ENABLE : constant := 16#1#;   --  msacm.h:426
   ACM_DRIVERPRIORITYF_DISABLE : constant := 16#2#;   --  msacm.h:427
   ACM_DRIVERPRIORITYF_ABLEMASK : constant := 16#3#;   --  msacm.h:428
   ACM_DRIVERPRIORITYF_BEGIN : constant := 16#10000#;
   --  msacm.h:429
   ACM_DRIVERPRIORITYF_END : constant := 16#20000#;
   --  msacm.h:430
   ACM_DRIVERPRIORITYF_DEFERMASK : constant := 16#30000#;
   --  msacm.h:431
   ACMDRIVERDETAILS_SHORTNAME_CHARS : constant := 32;      --  msacm.h:450
   ACMDRIVERDETAILS_LONGNAME_CHARS : constant := 128;     --  msacm.h:451
   ACMDRIVERDETAILS_COPYRIGHT_CHARS : constant := 80;      --  msacm.h:452
   ACMDRIVERDETAILS_LICENSING_CHARS : constant := 128;     --  msacm.h:453
   ACMDRIVERDETAILS_FEATURES_CHARS : constant := 512;     --  msacm.h:454

   ACMDRIVERDETAILS_FCCTYPE_AUDIOCODEC : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('a', 'u', 'd', 'c');
   --  msacm.h: 563
   ACMDRIVERDETAILS_FCCCOMP_UNDEFINED : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC (Nul, Nul, Nul, Nul);
   --  msacm.h: 564

   ACMDRIVERDETAILS_SUPPORTF_CODEC : constant := 16#1#;   --  msacm.h:604
   ACMDRIVERDETAILS_SUPPORTF_CONVERTER : constant := 16#2#;
   --  msacm.h:605
   ACMDRIVERDETAILS_SUPPORTF_FILTER : constant := 16#4#;   --  msacm.h:606
   ACMDRIVERDETAILS_SUPPORTF_HARDWARE : constant := 16#8#;
   --  msacm.h:607
   ACMDRIVERDETAILS_SUPPORTF_ASYNC : constant := 16#10#;  --  msacm.h:608
   ACMDRIVERDETAILS_SUPPORTF_LOCAL : constant := 16#40000000#;
   --  msacm.h:609
   ACMDRIVERDETAILS_SUPPORTF_DISABLED : constant := 16#80000000#;
   --  msacm.h:610
   ACMFORMATTAGDETAILS_FORMATTAG_CHARS : constant := 48;
   --  msacm.h:662
   ACM_FORMATTAGDETAILSF_INDEX : constant := 16#0#;   --  msacm.h:741
   ACM_FORMATTAGDETAILSF_FORMATTAG : constant := 16#1#;   --  msacm.h:742
   ACM_FORMATTAGDETAILSF_LARGESTSIZE : constant := 16#2#;   --  msacm.h:743
   ACM_FORMATTAGDETAILSF_QUERYMASK : constant := 16#f#;   --  msacm.h:744
   ACMFORMATDETAILS_FORMAT_CHARS : constant := 128;     --  msacm.h:834
   ACM_FORMATDETAILSF_INDEX : constant := 16#0#;   --  msacm.h:914
   ACM_FORMATDETAILSF_FORMAT : constant := 16#1#;   --  msacm.h:915
   ACM_FORMATDETAILSF_QUERYMASK : constant := 16#f#;   --  msacm.h:916
   ACM_FORMATENUMF_WFORMATTAG : constant := 16#10000#;
   --  msacm.h:988
   ACM_FORMATENUMF_NCHANNELS : constant := 16#20000#;
   --  msacm.h:989
   ACM_FORMATENUMF_NSAMPLESPERSEC : constant := 16#40000#;
   --  msacm.h:990
   ACM_FORMATENUMF_WBITSPERSAMPLE : constant := 16#80000#;
   --  msacm.h:991
   ACM_FORMATENUMF_CONVERT : constant := 16#100000#;
   --  msacm.h:992
   ACM_FORMATENUMF_SUGGEST : constant := 16#200000#;
   --  msacm.h:993
   ACM_FORMATENUMF_HARDWARE : constant := 16#400000#;
   --  msacm.h:994
   ACM_FORMATENUMF_INPUT : constant := 16#800000#;
   --  msacm.h:995
   ACM_FORMATENUMF_OUTPUT : constant := 16#1000000#;
   --  msacm.h:996
   ACM_FORMATSUGGESTF_WFORMATTAG : constant := 16#10000#;
   --  msacm.h:1016
   ACM_FORMATSUGGESTF_NCHANNELS : constant := 16#20000#;
   --  msacm.h:1017
   ACM_FORMATSUGGESTF_NSAMPLESPERSEC : constant := 16#40000#;
   --  msacm.h:1018
   ACM_FORMATSUGGESTF_WBITSPERSAMPLE : constant := 16#80000#;
   --  msacm.h:1019
   ACM_FORMATSUGGESTF_TYPEMASK : constant := 16#ff0000#;
   --  msacm.h:1021
   ACMHELPMSGSTRINGA : constant CHAR_Array :=
     "acmchoose_help" & Nul;
   --  msacm.h:1032
   ACMHELPMSGSTRINGW : constant WCHAR_Array :=
     To_Win (C.To_C ("acmchoose_help")) & Wide_Nul;
   --  msacm.h:1033
   ACMHELPMSGSTRING : CHAR_Array renames ACMHELPMSGSTRINGA;
   --  msacm.h:1037
   MM_ACM_FORMATCHOOSE : constant := 16#8000#; --  msacm.h:1047
   FORMATCHOOSE_MESSAGE : constant := 0;       --  msacm.h:1049
   FORMATCHOOSE_FORMATTAG_VERIFY : constant := 0;       --  msacm.h:1050
   FORMATCHOOSE_FORMAT_VERIFY : constant := 1;       --  msacm.h:1051
   FORMATCHOOSE_CUSTOM_VERIFY : constant := 2;       --  msacm.h:1052
   ACMFORMATCHOOSE_STYLEF_SHOWHELP : constant := 16#4#;   --  msacm.h:1213
   ACMFORMATCHOOSE_STYLEF_ENABLEHOOK : constant := 16#8#;   --  msacm.h:1214
   ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATE : constant := 16#10#;
   --  msacm.h:1215
   ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATEHANDLE : constant := 16#20#;
   --  msacm.h:1216
   ACMFORMATCHOOSE_STYLEF_INITTOWFXSTRUCT : constant := 16#40#;
   --  msacm.h:1217
   ACMFILTERTAGDETAILS_FILTERTAG_CHARS : constant := 48;    --  msacm.h:1259
   ACM_FILTERTAGDETAILSF_INDEX : constant := 16#0#; --  msacm.h:1338
   ACM_FILTERTAGDETAILSF_FILTERTAG : constant := 16#1#; --  msacm.h:1339
   ACM_FILTERTAGDETAILSF_LARGESTSIZE : constant := 16#2#; --  msacm.h:1340
   ACM_FILTERTAGDETAILSF_QUERYMASK : constant := 16#f#; --  msacm.h:1341
   ACMFILTERDETAILS_FILTER_CHARS : constant := 128;   --  msacm.h:1432
   ACM_FILTERDETAILSF_INDEX : constant := 16#0#; --  msacm.h:1510
   ACM_FILTERDETAILSF_FILTER : constant := 16#1#; --  msacm.h:1511
   ACM_FILTERDETAILSF_QUERYMASK : constant := 16#f#; --  msacm.h:1512
   ACM_FILTERENUMF_DWFILTERTAG : constant := 16#10000#;
   --  msacm.h:1584
   MM_ACM_FILTERCHOOSE : constant := 16#8000#;
   --  msacm.h:1600
   FILTERCHOOSE_MESSAGE : constant := 0;     --  msacm.h:1602
   FILTERCHOOSE_FILTERTAG_VERIFY : constant := 0;     --  msacm.h:1603
   FILTERCHOOSE_FILTER_VERIFY : constant := 1;     --  msacm.h:1604
   FILTERCHOOSE_CUSTOM_VERIFY : constant := 2;     --  msacm.h:1605
   ACMFILTERCHOOSE_STYLEF_SHOWHELP : constant := 16#4#; --  msacm.h:1765
   ACMFILTERCHOOSE_STYLEF_ENABLEHOOK : constant := 16#8#; --  msacm.h:1766
   ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATE : constant := 16#10#;
   --  msacm.h:1767
   ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATEHANDLE : constant := 16#20#;
   --  msacm.h:1768
   ACMFILTERCHOOSE_STYLEF_INITTOFILTERSTRUCT : constant := 16#40#;
   --  msacm.h:1769
   ACMSTREAMHEADER_STATUSF_DONE : constant := 16#10000#;
   --  msacm.h:1832
   ACMSTREAMHEADER_STATUSF_PREPARED : constant := 16#20000#;
   --  msacm.h:1833
   ACMSTREAMHEADER_STATUSF_INQUEUE : constant := 16#100000#;
   --  msacm.h:1834
   ACM_STREAMOPENF_QUERY : constant := 16#1#; --  msacm.h:1850
   ACM_STREAMOPENF_ASYNC : constant := 16#2#; --  msacm.h:1851
   ACM_STREAMOPENF_NONREALTIME : constant := 16#4#; --  msacm.h:1852
   ACM_STREAMSIZEF_SOURCE : constant := 16#0#; --  msacm.h:1885
   ACM_STREAMSIZEF_DESTINATION : constant := 16#1#; --  msacm.h:1886
   ACM_STREAMSIZEF_QUERYMASK : constant := 16#f#; --  msacm.h:1887
   ACM_STREAMCONVERTF_BLOCKALIGN : constant := 16#4#; --  msacm.h:1920
   ACM_STREAMCONVERTF_START : constant := 16#10#; --  msacm.h:1921
   ACM_STREAMCONVERTF_END : constant := 16#20#; --  msacm.h:1922

   subtype HACMDRIVERID is Win32.Winnt.HANDLE;            --  msacm.h:129
   type PHACMDRIVERID is access all HACMDRIVERID;          --  msacm.h:130
   subtype LPHACMDRIVERID is PHACMDRIVERID;                --  msacm.h:131

   subtype HACMDRIVER is Win32.Winnt.HANDLE;              --  msacm.h:133
   type PHACMDRIVER is access all HACMDRIVER;              --  msacm.h:134
   subtype LPHACMDRIVER is PHACMDRIVER;                    --  msacm.h:135

   subtype HACMSTREAM is Win32.Winnt.HANDLE;              --  msacm.h:137
   type PHACMSTREAM is access all HACMSTREAM;              --  msacm.h:138
   subtype LPHACMSTREAM is PHACMSTREAM;                    --  msacm.h:139

   subtype HACMOBJ is Win32.Winnt.HANDLE;                 --  msacm.h:141
   type PHACMOBJ is access all HACMOBJ;                    --  msacm.h:142
   subtype LPHACMOBJ is PHACMOBJ;                          --  msacm.h:143

   type ACMDRIVERDETAILSA;                                 --  msacm.h:457
   type ACMDRIVERDETAILSW;                                 --  msacm.h:484
   type ACMFORMATTAGDETAILSA;                              --  msacm.h:665
   type ACMFORMATTAGDETAILSW;                              --  msacm.h:677
   type ACMFORMATDETAILSA;                                 --  msacm.h:837
   type ACMFORMATDETAILSW;                                 --  msacm.h:849
   type ACMFORMATCHOOSEA;                                  --  msacm.h:1092
   type ACMFORMATCHOOSEW;                                  --  msacm.h:1127
   type ACMFILTERTAGDETAILSA;                              --  msacm.h:1262
   type ACMFILTERTAGDETAILSW;                              --  msacm.h:1274
   type ACMFILTERDETAILSA;                                 --  msacm.h:1435
   type ACMFILTERDETAILSW;                                 --  msacm.h:1447
   type ACMFILTERCHOOSEA;                                  --  msacm.h:1645
   type ACMFILTERCHOOSEW;                                  --  msacm.h:1680
   type ACMSTREAMHEADER;                                   --  msacm.h:1810

   type PACMDRIVERDETAILSA is access all ACMDRIVERDETAILSA; --  msacm.h:482
   subtype PACMDRIVERDETAILS is PACMDRIVERDETAILSA;        --  msacm.h:517
   subtype LPACMDRIVERDETAILSA is PACMDRIVERDETAILSA;      --  msacm.h:482
   subtype LPACMDRIVERDETAILS is LPACMDRIVERDETAILSA;      --  msacm.h:518
   type PACMDRIVERDETAILSW is access all ACMDRIVERDETAILSW; --  msacm.h:509
   subtype LPACMDRIVERDETAILSW is PACMDRIVERDETAILSW;      --  msacm.h:509
   type PACMFORMATTAGDETAILSA is access all ACMFORMATTAGDETAILSA;
   --  msacm.h:675
   subtype PACMFORMATTAGDETAILS is PACMFORMATTAGDETAILSA;  --  msacm.h:695
   subtype LPACMFORMATTAGDETAILSA is PACMFORMATTAGDETAILSA; --  msacm.h:675
   subtype LPACMFORMATTAGDETAILS is LPACMFORMATTAGDETAILSA; --  msacm.h:696
   type PACMFORMATTAGDETAILSW is access all ACMFORMATTAGDETAILSW;
   --  msacm.h:687
   subtype LPACMFORMATTAGDETAILSW is PACMFORMATTAGDETAILSW; --  msacm.h:687
   type PACMFORMATDETAILSA is access all ACMFORMATDETAILSA; --  msacm.h:847
   subtype PACMFORMATDETAILS is PACMFORMATDETAILSA;        --  msacm.h:867
   subtype LPACMFORMATDETAILSA is PACMFORMATDETAILSA;      --  msacm.h:847
   subtype LPACMFORMATDETAILS is LPACMFORMATDETAILSA;      --  msacm.h:868
   type PACMFORMATDETAILSW is access all ACMFORMATDETAILSW; --  msacm.h:859
   subtype LPACMFORMATDETAILSW is PACMFORMATDETAILSW;      --  msacm.h:859
   type PACMFORMATCHOOSEA is access all ACMFORMATCHOOSEA;  --  msacm.h:1125
   subtype PACMFORMATCHOOSE is PACMFORMATCHOOSEA;          --  msacm.h:1168
   subtype LPACMFORMATCHOOSEA is PACMFORMATCHOOSEA;        --  msacm.h:1125
   subtype LPACMFORMATCHOOSE is LPACMFORMATCHOOSEA;        --  msacm.h:1169
   type PACMFORMATCHOOSEW is access all ACMFORMATCHOOSEW;  --  msacm.h:1160
   subtype LPACMFORMATCHOOSEW is PACMFORMATCHOOSEW;        --  msacm.h:1160
   type PACMFILTERTAGDETAILSA is access all ACMFILTERTAGDETAILSA;
   --  msacm.h:1272
   subtype PACMFILTERTAGDETAILS is PACMFILTERTAGDETAILSA;  --  msacm.h:1292
   subtype LPACMFILTERTAGDETAILSA is PACMFILTERTAGDETAILSA; --  msacm.h:1272
   subtype LPACMFILTERTAGDETAILS is LPACMFILTERTAGDETAILSA; --  msacm.h:1293
   type PACMFILTERTAGDETAILSW is access all ACMFILTERTAGDETAILSW;
   --  msacm.h:1284
   subtype LPACMFILTERTAGDETAILSW is PACMFILTERTAGDETAILSW; --  msacm.h:1284
   type PACMFILTERDETAILSA is access all ACMFILTERDETAILSA; --  msacm.h:1445
   subtype PACMFILTERDETAILS is PACMFILTERDETAILSA;        --  msacm.h:1465
   subtype LPACMFILTERDETAILSA is PACMFILTERDETAILSA;      --  msacm.h:1445
   subtype LPACMFILTERDETAILS is LPACMFILTERDETAILSA;      --  msacm.h:1466
   type PACMFILTERDETAILSW is access all ACMFILTERDETAILSW; --  msacm.h:1457
   subtype LPACMFILTERDETAILSW is PACMFILTERDETAILSW;      --  msacm.h:1457
   type PACMFILTERCHOOSEA is access all ACMFILTERCHOOSEA;  --  msacm.h:1678
   subtype PACMFILTERCHOOSE is PACMFILTERCHOOSEA;          --  msacm.h:1721
   subtype LPACMFILTERCHOOSEA is PACMFILTERCHOOSEA;        --  msacm.h:1678
   subtype LPACMFILTERCHOOSE is LPACMFILTERCHOOSEA;        --  msacm.h:1722
   type PACMFILTERCHOOSEW is access all ACMFILTERCHOOSEW;  --  msacm.h:1713
   subtype LPACMFILTERCHOOSEW is PACMFILTERCHOOSEW;        --  msacm.h:1713
   type PACMSTREAMHEADER is access all ACMSTREAMHEADER;    --  msacm.h:1825
   subtype LPACMSTREAMHEADER is PACMSTREAMHEADER;          --  msacm.h:1825

   type ACMDRIVERENUMCB is access function
     (hadid : HACMDRIVERID;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:242
   pragma Convention (Stdcall, ACMDRIVERENUMCB);

   type ACMDRIVERPROC is access function
     (p1 : Win32.DWORD;
      p2 : HACMDRIVERID;
      p3 : Win32.UINT;
      p4 : Win32.LPARAM;
      p5 : Win32.LPARAM)
     return Win32.LRESULT;                        --  msacm.h:332
   pragma Convention (Stdcall, ACMDRIVERPROC);

   type LPACMDRIVERPROC is access all ACMDRIVERPROC;       --  msacm.h:333

   type ACMDRIVERDETAILSA is                               --  msacm.h:457
      record
         cbStruct : Win32.DWORD;                       --  msacm.h:459
         fccType : Win32.Mmsystem.FOURCC;             --  msacm.h:461
         fccComp : Win32.Mmsystem.FOURCC;             --  msacm.h:462
         wMid : Win32.WORD;                        --  msacm.h:464
         wPid : Win32.WORD;                        --  msacm.h:465
         vdwACM : Win32.DWORD;                       --  msacm.h:467
         vdwDriver : Win32.DWORD;                       --  msacm.h:468
         fdwSupport : Win32.DWORD;                       --  msacm.h:470
         cFormatTags : Win32.DWORD;                       --  msacm.h:471
         cFilterTags : Win32.DWORD;                       --  msacm.h:472
         hicon : Win32.Windef.HICON;                --  msacm.h:474
         szShortName : Win32.CHAR_Array
           (0 .. ACMDRIVERDETAILS_SHORTNAME_CHARS - 1);
         --  msacm.h:476
         szLongName : Win32.CHAR_Array
           (0 .. ACMDRIVERDETAILS_LONGNAME_CHARS - 1);
         --  msacm.h:477
         szCopyright : Win32.CHAR_Array
           (0 .. ACMDRIVERDETAILS_COPYRIGHT_CHARS - 1);
         --  msacm.h:478
         szLicensing : Win32.CHAR_Array
           (0 .. ACMDRIVERDETAILS_LICENSING_CHARS - 1);
         --  msacm.h:479
         szFeatures : Win32.CHAR_Array
           (0 .. ACMDRIVERDETAILS_FEATURES_CHARS - 1);
         --  msacm.h:480
      end record;

   subtype ACMDRIVERDETAILS is ACMDRIVERDETAILSA;          --  msacm.h:516

   type ACMDRIVERDETAILSW is                               --  msacm.h:484
      record
         cbStruct : Win32.DWORD;                       --  msacm.h:486
         fccType : Win32.Mmsystem.FOURCC;             --  msacm.h:488
         fccComp : Win32.Mmsystem.FOURCC;             --  msacm.h:489
         wMid : Win32.WORD;                        --  msacm.h:491
         wPid : Win32.WORD;                        --  msacm.h:492
         vdwACM : Win32.DWORD;                       --  msacm.h:494
         vdwDriver : Win32.DWORD;                       --  msacm.h:495
         fdwSupport : Win32.DWORD;                       --  msacm.h:497
         cFormatTags : Win32.DWORD;                       --  msacm.h:498
         cFilterTags : Win32.DWORD;                       --  msacm.h:499
         hicon : Win32.Windef.HICON;                --  msacm.h:501
         szShortName : Win32.WCHAR_Array
           (0 .. ACMDRIVERDETAILS_SHORTNAME_CHARS - 1);
         --  msacm.h:503
         szLongName : Win32.WCHAR_Array
           (0 .. ACMDRIVERDETAILS_LONGNAME_CHARS - 1);
         --  msacm.h:504
         szCopyright : Win32.WCHAR_Array
           (0 .. ACMDRIVERDETAILS_COPYRIGHT_CHARS - 1);
         --  msacm.h:505
         szLicensing : Win32.WCHAR_Array
           (0 .. ACMDRIVERDETAILS_LICENSING_CHARS - 1);
         --  msacm.h:506
         szFeatures : Win32.WCHAR_Array
           (0 .. ACMDRIVERDETAILS_FEATURES_CHARS - 1);
         --  msacm.h:507
      end record;

   type ACMFORMATTAGDETAILSA is                            --  msacm.h:665
      record
         cbStruct : Win32.DWORD;                  --  msacm.h:667
         dwFormatTagIndex : Win32.DWORD;                  --  msacm.h:668
         dwFormatTag : Win32.DWORD;                  --  msacm.h:669
         cbFormatSize : Win32.DWORD;                  --  msacm.h:670
         fdwSupport : Win32.DWORD;                  --  msacm.h:671
         cStandardFormats : Win32.DWORD;                  --  msacm.h:672
         szFormatTag : Win32.CHAR_Array
           (0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
         --  msacm.h:673
      end record;

   subtype ACMFORMATTAGDETAILS is ACMFORMATTAGDETAILSA;    --  msacm.h:694

   type ACMFORMATTAGDETAILSW is                            --  msacm.h:677
      record
         cbStruct : Win32.DWORD;                  --  msacm.h:679
         dwFormatTagIndex : Win32.DWORD;                  --  msacm.h:680
         dwFormatTag : Win32.DWORD;                  --  msacm.h:681
         cbFormatSize : Win32.DWORD;                  --  msacm.h:682
         fdwSupport : Win32.DWORD;                  --  msacm.h:683
         cStandardFormats : Win32.DWORD;                  --  msacm.h:684
         szFormatTag : Win32.WCHAR_Array
           (0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
         --  msacm.h:685
      end record;

   type ACMFORMATTAGENUMCBA is access function
     (hadid : HACMDRIVERID;
      paftd : LPACMFORMATTAGDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:757
   pragma Convention (Stdcall, ACMFORMATTAGENUMCBA);
   subtype ACMFORMATTAGENUMCB is ACMFORMATTAGENUMCBA;      --  msacm.h:794
   type ACMFORMATTAGENUMCBW is access function
     (hadid : HACMDRIVERID;
      paftd : LPACMFORMATTAGDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:773
   pragma Convention (Stdcall, ACMFORMATTAGENUMCBW);

   type ACMFORMATDETAILSA is                               --  msacm.h:837
      record
         cbStruct : Win32.DWORD;                     --  msacm.h:839
         dwFormatIndex : Win32.DWORD;                     --  msacm.h:840
         dwFormatTag : Win32.DWORD;                     --  msacm.h:841
         fdwSupport : Win32.DWORD;                     --  msacm.h:842
         pwfx : Win32.Mmsystem.LPWAVEFORMATEX;   --  msacm.h:843
         cbwfx : Win32.DWORD;                     --  msacm.h:844
         szFormat : Win32.CHAR_Array (0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
         --  msacm.h:845
      end record;

   subtype ACMFORMATDETAILS is ACMFORMATDETAILSA;          --  msacm.h:866

   type ACMFORMATDETAILSW is                               --  msacm.h:849
      record
         cbStruct : Win32.DWORD;                     --  msacm.h:851
         dwFormatIndex : Win32.DWORD;                     --  msacm.h:852
         dwFormatTag : Win32.DWORD;                     --  msacm.h:853
         fdwSupport : Win32.DWORD;                     --  msacm.h:854
         pwfx : Win32.Mmsystem.LPWAVEFORMATEX;   --  msacm.h:855
         cbwfx : Win32.DWORD;                     --  msacm.h:856
         szFormat : Win32.WCHAR_Array
           (0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
         --  msacm.h:857
      end record;

   type ACMFORMATENUMCBA is access function
     (hadid : HACMDRIVERID;
      pafd : LPACMFORMATDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:928
   pragma Convention (Stdcall, ACMFORMATENUMCBA);
   subtype ACMFORMATENUMCB is ACMFORMATENUMCBA;            --  msacm.h:966
   type ACMFORMATENUMCBW is access function
     (hadid : HACMDRIVERID;
      pafd : LPACMFORMATDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:945
   pragma Convention (Stdcall, ACMFORMATENUMCBW);
   type ACMFORMATCHOOSEHOOKPROCA is access function
     (hwnd : Win32.Windef.HWND;
      uMsg : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
     return Win32.UINT;                           --  msacm.h:1056
   pragma Convention (Stdcall, ACMFORMATCHOOSEHOOKPROCA);
   subtype ACMFORMATCHOOSEHOOKPROC is ACMFORMATCHOOSEHOOKPROCA;
   --  msacm.h:1075
   type ACMFORMATCHOOSEHOOKPROCW is access function
     (hwnd : Win32.Windef.HWND;
      uMsg : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
     return Win32.UINT;                           --  msacm.h:1064
   pragma Convention (Stdcall, ACMFORMATCHOOSEHOOKPROCW);

   type ACMFORMATCHOOSEA is                                --  msacm.h:1092
      record
         cbStruct : Win32.DWORD;                   --  msacm.h:1094
         fdwStyle : Win32.DWORD;                   --  msacm.h:1095
         hwndOwner : Win32.Windef.HWND;             --  msacm.h:1097
         pwfx : Win32.Mmsystem.LPWAVEFORMATEX; --  msacm.h:1099
         cbwfx : Win32.DWORD;                   --  msacm.h:1100
         pszTitle : Win32.LPCSTR;                  --  msacm.h:1101
         szFormatTag : Win32.CHAR_Array
           (0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
         --  msacm.h:1103
         szFormat : Win32.CHAR_Array
           (0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
         --  msacm.h:1104
         pszName : Win32.LPSTR;                   --  msacm.h:1106
         cchName : Win32.DWORD;                   --  msacm.h:1107
         fdwEnum : Win32.DWORD;                   --  msacm.h:1109
         pwfxEnum : Win32.Mmsystem.LPWAVEFORMATEX; --  msacm.h:1110
         hInstance : Win32.Windef.HINSTANCE;        --  msacm.h:1120
         pszTemplateName : Win32.LPCSTR;                  --  msacm.h:1121
         lCustData : Win32.LPARAM;                  --  msacm.h:1122
         pfnHook : ACMFORMATCHOOSEHOOKPROCA;      --  msacm.h:1123
      end record;

   subtype ACMFORMATCHOOSE is ACMFORMATCHOOSEA;            --  msacm.h:1167

   type ACMFORMATCHOOSEW is                                --  msacm.h:1127
      record
         cbStruct : Win32.DWORD;                   --  msacm.h:1129
         fdwStyle : Win32.DWORD;                   --  msacm.h:1130
         hwndOwner : Win32.Windef.HWND;             --  msacm.h:1132
         pwfx : Win32.Mmsystem.LPWAVEFORMATEX; --  msacm.h:1134
         cbwfx : Win32.DWORD;                   --  msacm.h:1135
         pszTitle : Win32.LPCWSTR;                 --  msacm.h:1136
         szFormatTag : Win32.WCHAR_Array
           (0 .. ACMFORMATTAGDETAILS_FORMATTAG_CHARS - 1);
         --  msacm.h:1138
         szFormat : Win32.WCHAR_Array
           (0 .. ACMFORMATDETAILS_FORMAT_CHARS - 1);
         --  msacm.h:1139
         pszName : Win32.LPWSTR;                  --  msacm.h:1141
         cchName : Win32.DWORD;                   --  msacm.h:1142
         fdwEnum : Win32.DWORD;                   --  msacm.h:1144
         pwfxEnum : Win32.Mmsystem.LPWAVEFORMATEX; --  msacm.h:1145
         hInstance : Win32.Windef.HINSTANCE;        --  msacm.h:1155
         pszTemplateName : Win32.LPCWSTR;                 --  msacm.h:1156
         lCustData : Win32.LPARAM;                  --  msacm.h:1157
         pfnHook : ACMFORMATCHOOSEHOOKPROCW;      --  msacm.h:1158
      end record;

   type ACMFILTERTAGDETAILSA is                            --  msacm.h:1262
      record
         cbStruct : Win32.DWORD;                  --  msacm.h:1264
         dwFilterTagIndex : Win32.DWORD;                  --  msacm.h:1265
         dwFilterTag : Win32.DWORD;                  --  msacm.h:1266
         cbFilterSize : Win32.DWORD;                  --  msacm.h:1267
         fdwSupport : Win32.DWORD;                  --  msacm.h:1268
         cStandardFilters : Win32.DWORD;                  --  msacm.h:1269
         szFilterTag : Win32.CHAR_Array
           (0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
         --  msacm.h:1270
      end record;

   subtype ACMFILTERTAGDETAILS is ACMFILTERTAGDETAILSA;    --  msacm.h:1291

   type ACMFILTERTAGDETAILSW is                            --  msacm.h:1274
      record
         cbStruct : Win32.DWORD;                  --  msacm.h:1276
         dwFilterTagIndex : Win32.DWORD;                  --  msacm.h:1277
         dwFilterTag : Win32.DWORD;                  --  msacm.h:1278
         cbFilterSize : Win32.DWORD;                  --  msacm.h:1279
         fdwSupport : Win32.DWORD;                  --  msacm.h:1280
         cStandardFilters : Win32.DWORD;                  --  msacm.h:1281
         szFilterTag : Win32.WCHAR_Array
           (0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
         --  msacm.h:1282
      end record;

   type ACMFILTERTAGENUMCBA is access function
     (hadid : HACMDRIVERID;
      paftd : LPACMFILTERTAGDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:1354
   pragma Convention (Stdcall, ACMFILTERTAGENUMCBA);
   subtype ACMFILTERTAGENUMCB is ACMFILTERTAGENUMCBA;      --  msacm.h:1392
   type ACMFILTERTAGENUMCBW is access function
     (hadid : HACMDRIVERID;
      paftd : LPACMFILTERTAGDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:1371
   pragma Convention (Stdcall, ACMFILTERTAGENUMCBW);

   type ACMFILTERDETAILSA is                               --  msacm.h:1435
      record
         cbStruct : Win32.DWORD;                     --  msacm.h:1437
         dwFilterIndex : Win32.DWORD;                     --  msacm.h:1438
         dwFilterTag : Win32.DWORD;                     --  msacm.h:1439
         fdwSupport : Win32.DWORD;                     --  msacm.h:1440
         pwfltr : Win32.Mmreg.LPWAVEFILTER;        --  msacm.h:1441
         cbwfltr : Win32.DWORD;                     --  msacm.h:1442
         szFilter : Win32.CHAR_Array
           (0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
         --  msacm.h:1443
      end record;

   subtype ACMFILTERDETAILS is ACMFILTERDETAILSA;          --  msacm.h:1464

   type ACMFILTERDETAILSW is                               --  msacm.h:1447
      record
         cbStruct : Win32.DWORD;                     --  msacm.h:1449
         dwFilterIndex : Win32.DWORD;                     --  msacm.h:1450
         dwFilterTag : Win32.DWORD;                     --  msacm.h:1451
         fdwSupport : Win32.DWORD;                     --  msacm.h:1452
         pwfltr : Win32.Mmreg.LPWAVEFILTER;        --  msacm.h:1453
         cbwfltr : Win32.DWORD;                     --  msacm.h:1454
         szFilter : Win32.WCHAR_Array
           (0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
         --  msacm.h:1455
      end record;

   type ACMFILTERENUMCBA is access function
     (hadid : HACMDRIVERID;
      pafd : LPACMFILTERDETAILSA;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:1524
   pragma Convention (Stdcall, ACMFILTERENUMCBA);
   subtype ACMFILTERENUMCB is ACMFILTERENUMCBA;            --  msacm.h:1562
   type ACMFILTERENUMCBW is access function
     (hadid : HACMDRIVERID;
      pafd : LPACMFILTERDETAILSW;
      dwInstance : Win32.DWORD;
      fdwSupport : Win32.DWORD)
     return Win32.BOOL;                           --  msacm.h:1541
   pragma Convention (Stdcall, ACMFILTERENUMCBW);
   type ACMFILTERCHOOSEHOOKPROCA is access function
     (hwnd : Win32.Windef.HWND;
      uMsg : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
     return Win32.UINT;                           --  msacm.h:1609
   pragma Convention (Stdcall, ACMFILTERCHOOSEHOOKPROCA);
   subtype ACMFILTERCHOOSEHOOKPROC is ACMFILTERCHOOSEHOOKPROCA;
   --  msacm.h:1628
   type ACMFILTERCHOOSEHOOKPROCW is access function
     (hwnd : Win32.Windef.HWND;
      uMsg : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
     return Win32.UINT;                           --  msacm.h:1617
   pragma Convention (Stdcall, ACMFILTERCHOOSEHOOKPROCW);

   type ACMFILTERCHOOSEA is                                --  msacm.h:1645
      record
         cbStruct : Win32.DWORD;                   --  msacm.h:1647
         fdwStyle : Win32.DWORD;                   --  msacm.h:1648
         hwndOwner : Win32.Windef.HWND;             --  msacm.h:1650
         pwfltr : Win32.Mmreg.LPWAVEFILTER;      --  msacm.h:1652
         cbwfltr : Win32.DWORD;                   --  msacm.h:1653
         pszTitle : Win32.LPCSTR;                  --  msacm.h:1655
         szFilterTag : Win32.CHAR_Array
           (0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
         --  msacm.h:1657
         szFilter : Win32.CHAR_Array
           (0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
         --  msacm.h:1658
         pszName : Win32.LPSTR;                   --  msacm.h:1659
         cchName : Win32.DWORD;                   --  msacm.h:1660
         fdwEnum : Win32.DWORD;                   --  msacm.h:1662
         pwfltrEnum : Win32.Mmreg.LPWAVEFILTER;      --  msacm.h:1663
         hInstance : Win32.Windef.HINSTANCE;        --  msacm.h:1673
         pszTemplateName : Win32.LPCSTR;                  --  msacm.h:1674
         lCustData : Win32.LPARAM;                  --  msacm.h:1675
         pfnHook : ACMFILTERCHOOSEHOOKPROCA;      --  msacm.h:1676
      end record;

   subtype ACMFILTERCHOOSE is ACMFILTERCHOOSEA;            --  msacm.h:1720

   type ACMFILTERCHOOSEW is                                --  msacm.h:1680
      record
         cbStruct : Win32.DWORD;                   --  msacm.h:1682
         fdwStyle : Win32.DWORD;                   --  msacm.h:1683
         hwndOwner : Win32.Windef.HWND;             --  msacm.h:1685
         pwfltr : Win32.Mmreg.LPWAVEFILTER;      --  msacm.h:1687
         cbwfltr : Win32.DWORD;                   --  msacm.h:1688
         pszTitle : Win32.LPCWSTR;                 --  msacm.h:1690
         szFilterTag : Win32.WCHAR_Array
           (0 .. ACMFILTERTAGDETAILS_FILTERTAG_CHARS - 1);
         --  msacm.h:1692
         szFilter : Win32.WCHAR_Array
           (0 .. ACMFILTERDETAILS_FILTER_CHARS - 1);
         --  msacm.h:1693
         pszName : Win32.LPWSTR;                  --  msacm.h:1694
         cchName : Win32.DWORD;                   --  msacm.h:1695
         fdwEnum : Win32.DWORD;                   --  msacm.h:1697
         pwfltrEnum : Win32.Mmreg.LPWAVEFILTER;      --  msacm.h:1698
         hInstance : Win32.Windef.HINSTANCE;        --  msacm.h:1708
         pszTemplateName : Win32.LPCWSTR;                 --  msacm.h:1709
         lCustData : Win32.LPARAM;                  --  msacm.h:1710
         pfnHook : ACMFILTERCHOOSEHOOKPROCW;      --  msacm.h:1711
      end record;

   type ACMSTREAMHEADER is                                 --  msacm.h:1810
      record
         cbStruct : Win32.DWORD;                  --  msacm.h:1812
         fdwStatus : Win32.DWORD;                  --  msacm.h:1813
         dwUser : Win32.DWORD;                  --  msacm.h:1814
         pbSrc : Win32.LPBYTE;                 --  msacm.h:1815
         cbSrcLength : Win32.DWORD;                  --  msacm.h:1816
         cbSrcLengthUsed : Win32.DWORD;                  --  msacm.h:1817
         dwSrcUser : Win32.DWORD;                  --  msacm.h:1818
         pbDst : Win32.LPBYTE;                 --  msacm.h:1819
         cbDstLength : Win32.DWORD;                  --  msacm.h:1820
         cbDstLengthUsed : Win32.DWORD;                  --  msacm.h:1821
         dwDstUser : Win32.DWORD;                  --  msacm.h:1822
         dwReservedDriver : Win32.DWORD_Array (0 .. 9);      --  msacm.h:1823
      end record;

   function acmGetVersion return Win32.DWORD;              --  msacm.h:187

   function acmMetrics
     (hao : HACMOBJ;
      uMetric : Win32.UINT;
      pMetric : Win32.LPVOID)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:200

   function acmDriverEnum
     (fnCallback : ACMDRIVERENUMCB;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:249

   function acmDriverID
     (hao : HACMOBJ;
      phadid : LPHACMDRIVERID;
      fdwDriverID : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:269

   function acmDriverAddA
     (phadid : LPHACMDRIVERID;
      hinstModule : Win32.Windef.HINSTANCE;
      lParam : Win32.LPARAM;
      dwPriority : Win32.DWORD;
      fdwAdd : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:286

   function acmDriverAdd
     (phadid : LPHACMDRIVERID;
      hinstModule : Win32.Windef.HINSTANCE;
      lParam : Win32.LPARAM;
      dwPriority : Win32.DWORD;
      fdwAdd : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmDriverAddA;                       --  msacm.h:286

   function acmDriverAddW
     (phadid : LPHACMDRIVERID;
      hinstModule : Win32.Windef.HINSTANCE;
      lParam : Win32.LPARAM;
      dwPriority : Win32.DWORD;
      fdwAdd : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:295

   function acmDriverRemove
     (hadid : HACMDRIVERID;
      fdwRemove : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:343

   function acmDriverOpen
     (phad : LPHACMDRIVER;
      hadid : HACMDRIVERID;
      fdwOpen : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:358

   function acmDriverClose
     (had : HACMDRIVER;
      fdwClose : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:374

   function acmDriverMessage
     (had : HACMDRIVER;
      uMsg : Win32.UINT;
      lParam1 : Win32.LPARAM;
      lParam2 : Win32.LPARAM)
     return Win32.LRESULT;                        --  msacm.h:389

   function acmDriverPriority
     (hadid : HACMDRIVERID;
      dwPriority : Win32.DWORD;
      fdwPriority : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:418

   function acmDriverDetailsA_func
     (hadid : HACMDRIVERID;
      padd : LPACMDRIVERDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:614

   function acmDriverDetails_func
     (hadid : HACMDRIVERID;
      padd : LPACMDRIVERDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmDriverDetailsA_func;              --  msacm.h:614

   function acmDriverDetailsW_func
     (hadid : HACMDRIVERID;
      padd : LPACMDRIVERDETAILSW;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:621

   function acmFormatTagDetailsA_func
     (had : HACMDRIVER;
      paftd : LPACMFORMATTAGDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:713

   function acmFormatTagDetails_func
     (had : HACMDRIVER;
      paftd : LPACMFORMATTAGDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFormatTagDetailsA_func;           --  msacm.h:713

   function acmFormatTagDetailsW_func
     (had : HACMDRIVER;
      paftd : LPACMFORMATTAGDETAILSW;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:720

   function acmFormatTagEnumA
     (had : HACMDRIVER;
      paftd : LPACMFORMATTAGDETAILSA;
      fnCallback : ACMFORMATTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:765

   function acmFormatTagEnum
     (had : HACMDRIVER;
      paftd : LPACMFORMATTAGDETAILSA;
      fnCallback : ACMFORMATTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFormatTagEnumA;                   --  msacm.h:765

   function acmFormatTagEnumW
     (had : HACMDRIVER;
      paftd : LPACMFORMATTAGDETAILSW;
      fnCallback : ACMFORMATTAGENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:781

   function acmFormatDetailsA_func
     (had : HACMDRIVER;
      pafd : LPACMFORMATDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:886

   function acmFormatDetails_func
     (had : HACMDRIVER;
      pafd : LPACMFORMATDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFormatDetailsA_func;              --  msacm.h:886

   function acmFormatDetailsW_func
     (had : HACMDRIVER;
      pafd : LPACMFORMATDETAILSW;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:893

   function acmFormatEnumA
     (had : HACMDRIVER;
      pafd : LPACMFORMATDETAILSA;
      fnCallback : ACMFORMATENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:936

   function acmFormatEnum
     (had : HACMDRIVER;
      pafd : LPACMFORMATDETAILSA;
      fnCallback : ACMFORMATENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFormatEnumA;                      --  msacm.h:936

   function acmFormatEnumW
     (had : HACMDRIVER;
      pafd : LPACMFORMATDETAILSW;
      fnCallback : ACMFORMATENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:953

   function acmFormatSuggest
     (had : HACMDRIVER;
      pwfxSrc : Win32.Mmsystem.LPWAVEFORMATEX;
      pwfxDst : Win32.Mmsystem.LPWAVEFORMATEX;
      cbwfxDst : Win32.DWORD;
      fdwSuggest : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1007

   function acmFormatChooseA_func
     (pafmtc : LPACMFORMATCHOOSEA)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1220

   function acmFormatChoose_func
     (pafmtc : LPACMFORMATCHOOSEA)
     return Win32.Mmsystem.MMRESULT
     renames acmFormatChooseA_func;               --  msacm.h:1220

   function acmFormatChooseW_func
     (pafmtc : LPACMFORMATCHOOSEW)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1225

   function acmFilterTagDetailsA_func
     (had : HACMDRIVER;
      paftd : LPACMFILTERTAGDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1310

   function acmFilterTagDetails_func
     (had : HACMDRIVER;
      paftd : LPACMFILTERTAGDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFilterTagDetailsA_func;           --  msacm.h:1310

   function acmFilterTagDetailsW_func
     (had : HACMDRIVER;
      paftd : LPACMFILTERTAGDETAILSW;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1317

   function acmFilterTagEnumA
     (had : HACMDRIVER;
      paftd : LPACMFILTERTAGDETAILSA;
      fnCallback : ACMFILTERTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1362

   function acmFilterTagEnum
     (had : HACMDRIVER;
      paftd : LPACMFILTERTAGDETAILSA;
      fnCallback : ACMFILTERTAGENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFilterTagEnumA;                   --  msacm.h:1362

   function acmFilterTagEnumW
     (had : HACMDRIVER;
      paftd : LPACMFILTERTAGDETAILSW;
      fnCallback : ACMFILTERTAGENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1379

   function acmFilterDetailsA_func
     (had : HACMDRIVER;
      pafd : LPACMFILTERDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1483

   function acmFilterDetails_func
     (had : HACMDRIVER;
      pafd : LPACMFILTERDETAILSA;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFilterDetailsA_func;              --  msacm.h:1483

   function acmFilterDetailsW_func
     (had : HACMDRIVER;
      pafd : LPACMFILTERDETAILSW;
      fdwDetails : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1490

   function acmFilterEnumA
     (had : HACMDRIVER;
      pafd : LPACMFILTERDETAILSA;
      fnCallback : ACMFILTERENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1532

   function acmFilterEnum
     (had : HACMDRIVER;
      pafd : LPACMFILTERDETAILSA;
      fnCallback : ACMFILTERENUMCBA;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT
     renames acmFilterEnumA;                      --  msacm.h:1532

   function acmFilterEnumW
     (had : HACMDRIVER;
      pafd : LPACMFILTERDETAILSW;
      fnCallback : ACMFILTERENUMCBW;
      dwInstance : Win32.DWORD;
      fdwEnum : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1549

   function acmFilterChooseA_func
     (pafltrc : LPACMFILTERCHOOSEA)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1772

   function acmFilterChoose_func
     (pafltrc : LPACMFILTERCHOOSEA)
     return Win32.Mmsystem.MMRESULT
     renames acmFilterChooseA_func;               --  msacm.h:1772

   function acmFilterChooseW_func
     (pafltrc : LPACMFILTERCHOOSEW)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1777

   function acmStreamOpen
     (phas : LPHACMSTREAM;
      had : HACMDRIVER;
      pwfxSrc : Win32.Mmsystem.LPWAVEFORMATEX;
      pwfxDst : Win32.Mmsystem.LPWAVEFORMATEX;
      pwfltr : Win32.Mmreg.LPWAVEFILTER;
      dwCallback : Win32.DWORD;
      dwInstance : Win32.DWORD;
      fdwOpen : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1838

   function acmStreamClose
     (has : HACMSTREAM;
      fdwClose : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1862

   function acmStreamSize
     (has : HACMSTREAM;
      cbInput : Win32.DWORD;
      pdwOutputBytes : Win32.LPDWORD;
      fdwSize : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1877

   function acmStreamReset
     (has : HACMSTREAM;
      fdwReset : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1898

   function acmStreamConvert
     (has : HACMSTREAM;
      pash : LPACMSTREAMHEADER;
      fdwConvert : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1913

   function acmStreamPrepareHeader
     (has : HACMSTREAM;
      pash : LPACMSTREAMHEADER;
      fdwPrepare : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1932

   function acmStreamUnprepareHeader
     (has : HACMSTREAM;
      pash : LPACMSTREAMHEADER;
      fdwUnprepare : Win32.DWORD)
     return Win32.Mmsystem.MMRESULT;              --  msacm.h:1949

private

   pragma Convention (C, ACMDRIVERDETAILSA);                --  msacm.h:457
   pragma Convention (C, ACMDRIVERDETAILSW);                --  msacm.h:484
   pragma Convention (C, ACMFORMATTAGDETAILSA);             --  msacm.h:665
   pragma Convention (C, ACMFORMATTAGDETAILSW);             --  msacm.h:677
   pragma Convention (C, ACMFORMATDETAILSA);                --  msacm.h:837
   pragma Convention (C, ACMFORMATDETAILSW);                --  msacm.h:849
   pragma Convention (C, ACMFORMATCHOOSEA);                 --  msacm.h:1092
   pragma Convention (C, ACMFORMATCHOOSEW);                 --  msacm.h:1127
   pragma Convention (C, ACMFILTERTAGDETAILSA);             --  msacm.h:1262
   pragma Convention (C, ACMFILTERTAGDETAILSW);             --  msacm.h:1274
   pragma Convention (C, ACMFILTERDETAILSA);                --  msacm.h:1435
   pragma Convention (C, ACMFILTERDETAILSW);                --  msacm.h:1447
   pragma Convention (C, ACMFILTERCHOOSEA);                 --  msacm.h:1645
   pragma Convention (C, ACMFILTERCHOOSEW);                 --  msacm.h:1680
   pragma Convention (C, ACMSTREAMHEADER);                  --  msacm.h:1810

   pragma Import (Stdcall, acmGetVersion, "acmGetVersion");
   --  msacm.h:187
   pragma Import (Stdcall, acmMetrics, "acmMetrics");
   --  msacm.h:200
   pragma Import (Stdcall, acmDriverEnum, "acmDriverEnum");
   --  msacm.h:249
   pragma Import (Stdcall, acmDriverID, "acmDriverID");
   --  msacm.h:269
   pragma Import (Stdcall, acmDriverAddA, "acmDriverAddA");
   --  msacm.h:286
   pragma Import (Stdcall, acmDriverAddW, "acmDriverAddW");
   --  msacm.h:295
   pragma Import (Stdcall, acmDriverRemove, "acmDriverRemove");
   --  msacm.h:343
   pragma Import (Stdcall, acmDriverOpen, "acmDriverOpen");
   --  msacm.h:358
   pragma Import (Stdcall, acmDriverClose, "acmDriverClose");
   --  msacm.h:374
   pragma Import (Stdcall, acmDriverMessage, "acmDriverMessage");
   --  msacm.h:389
   pragma Import (Stdcall, acmDriverPriority, "acmDriverPriority");
   --  msacm.h:418
   pragma Import (Stdcall, acmDriverDetailsA_func, "acmDriverDetailsA");
   --  msacm.h:614
   pragma Import (Stdcall, acmDriverDetailsW_func, "acmDriverDetailsW");
   --  msacm.h:621
   pragma Import (Stdcall, acmFormatTagDetailsA_func, "acmFormatTagDetailsA");
   --  msacm.h:713
   pragma Import (Stdcall, acmFormatTagDetailsW_func, "acmFormatTagDetailsW");
   --  msacm.h:720
   pragma Import (Stdcall, acmFormatTagEnumA, "acmFormatTagEnumA");
   --  msacm.h:765
   pragma Import (Stdcall, acmFormatTagEnumW, "acmFormatTagEnumW");
   --  msacm.h:781
   pragma Import (Stdcall, acmFormatDetailsA_func, "acmFormatDetailsA");
   --  msacm.h:886
   pragma Import (Stdcall, acmFormatDetailsW_func, "acmFormatDetailsW");
   --  msacm.h:893
   pragma Import (Stdcall, acmFormatEnumA, "acmFormatEnumA");
   --  msacm.h:936
   pragma Import (Stdcall, acmFormatEnumW, "acmFormatEnumW");
   --  msacm.h:953
   pragma Import (Stdcall, acmFormatSuggest, "acmFormatSuggest");
   --  msacm.h:1007
   pragma Import (Stdcall, acmFormatChooseA_func, "acmFormatChooseA");
   --  msacm.h:1220
   pragma Import (Stdcall, acmFormatChooseW_func, "acmFormatChooseW");
   --  msacm.h:1225
   pragma Import (Stdcall, acmFilterTagDetailsA_func, "acmFilterTagDetailsA");
   --  msacm.h:1310
   pragma Import (Stdcall, acmFilterTagDetailsW_func, "acmFilterTagDetailsW");
   --  msacm.h:1317
   pragma Import (Stdcall, acmFilterTagEnumA, "acmFilterTagEnumA");
   --  msacm.h:1362
   pragma Import (Stdcall, acmFilterTagEnumW, "acmFilterTagEnumW");
   --  msacm.h:1379
   pragma Import (Stdcall, acmFilterDetailsA_func, "acmFilterDetailsA");
   --  msacm.h:1483
   pragma Import (Stdcall, acmFilterDetailsW_func, "acmFilterDetailsW");
   --  msacm.h:1490
   pragma Import (Stdcall, acmFilterEnumA, "acmFilterEnumA");
   --  msacm.h:1532
   pragma Import (Stdcall, acmFilterEnumW, "acmFilterEnumW");
   --  msacm.h:1549
   pragma Import (Stdcall, acmFilterChooseA_func, "acmFilterChooseA");
   --  msacm.h:1772
   pragma Import (Stdcall, acmFilterChooseW_func, "acmFilterChooseW");
   --  msacm.h:1777
   pragma Import (Stdcall, acmStreamOpen, "acmStreamOpen");
   --  msacm.h:1838
   pragma Import (Stdcall, acmStreamClose, "acmStreamClose");
   --  msacm.h:1862
   pragma Import (Stdcall, acmStreamSize, "acmStreamSize");
   --  msacm.h:1877
   pragma Import (Stdcall, acmStreamReset, "acmStreamReset");
   --  msacm.h:1898
   pragma Import (Stdcall, acmStreamConvert, "acmStreamConvert");
   --  msacm.h:1913
   pragma Import (Stdcall, acmStreamPrepareHeader, "acmStreamPrepareHeader");
   --  msacm.h:1932
   pragma Import (Stdcall, acmStreamUnprepareHeader,
                    "acmStreamUnprepareHeader");
   --  msacm.h:1949

end Win32.Msacm;


