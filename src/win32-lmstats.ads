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



with Win32.Winnt;



package Win32.Lmstats is



   STATSOPT_CLR : constant := 1;               --  lmstats.h:184



   use type Interfaces.C.unsigned_long;

   STATS_NO_VALUE : constant Win32.ULONG := Win32.ULONG'Last;

   --  lmstats.h:185

   STATS_OVERFLOW : constant Win32.ULONG := Win32.ULONG'Last - 1;

   --  lmstats.h:186



   type STAT_WORKSTATION_0;                                --  lmstats.h:99

   type STAT_SERVER_0;                                     --  lmstats.h:159



   type PSTAT_WORKSTATION_0 is access all STAT_WORKSTATION_0;

   --  lmstats.h:156

   subtype LPSTAT_WORKSTATION_0 is PSTAT_WORKSTATION_0;    --  lmstats.h:156

   type PSTAT_SERVER_0 is access all STAT_SERVER_0;        --  lmstats.h:177

   subtype LPSTAT_SERVER_0 is PSTAT_SERVER_0;              --  lmstats.h:177



   type STAT_WORKSTATION_0 is                              --  lmstats.h:99

      record

         StatisticsStartTime : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:100

         BytesReceived : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:102

         SmbsReceived : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:103

         PagingReadBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:104

         NonPagingReadBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:105

         CacheReadBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:106

         NetworkReadBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:107

         BytesTransmitted : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:109

         SmbsTransmitted : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:110

         PagingWriteBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:111

         NonPagingWriteBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:112

         CacheWriteBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:113

         NetworkWriteBytesRequested : Win32.Winnt.LARGE_INTEGER;

         --  lmstats.h:114

         InitiallyFailedOperations : Win32.DWORD;      --  lmstats.h:116

         FailedCompletionOperations : Win32.DWORD;      --  lmstats.h:117

         ReadOperations : Win32.DWORD;      --  lmstats.h:119

         RandomReadOperations : Win32.DWORD;      --  lmstats.h:120

         ReadSmbs : Win32.DWORD;      --  lmstats.h:121

         LargeReadSmbs : Win32.DWORD;      --  lmstats.h:122

         SmallReadSmbs : Win32.DWORD;      --  lmstats.h:123

         WriteOperations : Win32.DWORD;      --  lmstats.h:125

         RandomWriteOperations : Win32.DWORD;      --  lmstats.h:126

         WriteSmbs : Win32.DWORD;      --  lmstats.h:127

         LargeWriteSmbs : Win32.DWORD;      --  lmstats.h:128

         SmallWriteSmbs : Win32.DWORD;      --  lmstats.h:129

         RawReadsDenied : Win32.DWORD;      --  lmstats.h:131

         RawWritesDenied : Win32.DWORD;      --  lmstats.h:132

         NetworkErrors : Win32.DWORD;      --  lmstats.h:134

         Sessions : Win32.DWORD;      --  lmstats.h:137

         FailedSessions : Win32.DWORD;      --  lmstats.h:138

         Reconnects : Win32.DWORD;      --  lmstats.h:139

         CoreConnects : Win32.DWORD;      --  lmstats.h:140

         Lanman20Connects : Win32.DWORD;      --  lmstats.h:141

         Lanman21Connects : Win32.DWORD;      --  lmstats.h:142

         LanmanNtConnects : Win32.DWORD;      --  lmstats.h:143

         ServerDisconnects : Win32.DWORD;      --  lmstats.h:144

         HungSessions : Win32.DWORD;      --  lmstats.h:145

         UseCount : Win32.DWORD;      --  lmstats.h:146

         FailedUseCount : Win32.DWORD;      --  lmstats.h:147

         CurrentCommands : Win32.DWORD;      --  lmstats.h:154

      end record;



   type STAT_SERVER_0 is                                   --  lmstats.h:159

      record

         sts0_start : Win32.DWORD;               --  lmstats.h:160

         sts0_fopens : Win32.DWORD;               --  lmstats.h:161

         sts0_devopens : Win32.DWORD;               --  lmstats.h:162

         sts0_jobsqueued : Win32.DWORD;               --  lmstats.h:163

         sts0_sopens : Win32.DWORD;               --  lmstats.h:164

         sts0_stimedout : Win32.DWORD;               --  lmstats.h:165

         sts0_serrorout : Win32.DWORD;               --  lmstats.h:166

         sts0_pwerrors : Win32.DWORD;               --  lmstats.h:167

         sts0_permerrors : Win32.DWORD;               --  lmstats.h:168

         sts0_syserrors : Win32.DWORD;               --  lmstats.h:169

         sts0_bytessent_low : Win32.DWORD;               --  lmstats.h:170

         sts0_bytessent_high : Win32.DWORD;               --  lmstats.h:171

         sts0_bytesrcvd_low : Win32.DWORD;               --  lmstats.h:172

         sts0_bytesrcvd_high : Win32.DWORD;               --  lmstats.h:173

         sts0_avresponse : Win32.DWORD;               --  lmstats.h:174

         sts0_reqbufneed : Win32.DWORD;               --  lmstats.h:175

         sts0_bigbufneed : Win32.DWORD;               --  lmstats.h:176

      end record;



   function NetStatisticsGet

     (server : Win32.Winnt.LPTSTR;

      service : Win32.Winnt.LPTSTR;

      level : Win32.DWORD;

      options : Win32.DWORD;

      bufptr : access Win32.PBYTE)

     return Win32.DWORD;                          --  lmstats.h:47



private



   pragma Convention (C, STAT_WORKSTATION_0);               --  lmstats.h:99

   pragma Convention (C, STAT_SERVER_0);                    --  lmstats.h:159



   pragma Import (Stdcall, NetStatisticsGet, "NetStatisticsGet");

   --  lmstats.h:47



end Win32.Lmstats;





