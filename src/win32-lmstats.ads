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

with Win32.Winnt;

package Win32.Lmstats is

   STATSOPT_CLR : constant := 1;

   use type Interfaces.C.unsigned_long;
   STATS_NO_VALUE : constant Win32.ULONG := Win32.ULONG'Last;
   STATS_OVERFLOW : constant Win32.ULONG := Win32.ULONG'Last - 1;

   type STAT_WORKSTATION_0;
   type STAT_SERVER_0;

   type PSTAT_WORKSTATION_0 is access all STAT_WORKSTATION_0;
   subtype LPSTAT_WORKSTATION_0 is PSTAT_WORKSTATION_0;
   type PSTAT_SERVER_0 is access all STAT_SERVER_0;
   subtype LPSTAT_SERVER_0 is PSTAT_SERVER_0;

   type STAT_WORKSTATION_0 is record
      StatisticsStartTime          : Win32.Winnt.LARGE_INTEGER;
      BytesReceived                : Win32.Winnt.LARGE_INTEGER;
      SmbsReceived                 : Win32.Winnt.LARGE_INTEGER;
      PagingReadBytesRequested     : Win32.Winnt.LARGE_INTEGER;
      NonPagingReadBytesRequested  : Win32.Winnt.LARGE_INTEGER;
      CacheReadBytesRequested      : Win32.Winnt.LARGE_INTEGER;
      NetworkReadBytesRequested    : Win32.Winnt.LARGE_INTEGER;
      BytesTransmitted             : Win32.Winnt.LARGE_INTEGER;
      SmbsTransmitted              : Win32.Winnt.LARGE_INTEGER;
      PagingWriteBytesRequested    : Win32.Winnt.LARGE_INTEGER;
      NonPagingWriteBytesRequested : Win32.Winnt.LARGE_INTEGER;
      CacheWriteBytesRequested     : Win32.Winnt.LARGE_INTEGER;
      NetworkWriteBytesRequested   : Win32.Winnt.LARGE_INTEGER;
      InitiallyFailedOperations    : Win32.DWORD;
      FailedCompletionOperations   : Win32.DWORD;
      ReadOperations               : Win32.DWORD;
      RandomReadOperations         : Win32.DWORD;
      ReadSmbs                     : Win32.DWORD;
      LargeReadSmbs                : Win32.DWORD;
      SmallReadSmbs                : Win32.DWORD;
      WriteOperations              : Win32.DWORD;
      RandomWriteOperations        : Win32.DWORD;
      WriteSmbs                    : Win32.DWORD;
      LargeWriteSmbs               : Win32.DWORD;
      SmallWriteSmbs               : Win32.DWORD;
      RawReadsDenied               : Win32.DWORD;
      RawWritesDenied              : Win32.DWORD;
      NetworkErrors                : Win32.DWORD;
      Sessions                     : Win32.DWORD;
      FailedSessions               : Win32.DWORD;
      Reconnects                   : Win32.DWORD;
      CoreConnects                 : Win32.DWORD;
      Lanman20Connects             : Win32.DWORD;
      Lanman21Connects             : Win32.DWORD;
      LanmanNtConnects             : Win32.DWORD;
      ServerDisconnects            : Win32.DWORD;
      HungSessions                 : Win32.DWORD;
      UseCount                     : Win32.DWORD;
      FailedUseCount               : Win32.DWORD;
      CurrentCommands              : Win32.DWORD;
   end record;

   type STAT_SERVER_0 is record
      sts0_start          : Win32.DWORD;
      sts0_fopens         : Win32.DWORD;
      sts0_devopens       : Win32.DWORD;
      sts0_jobsqueued     : Win32.DWORD;
      sts0_sopens         : Win32.DWORD;
      sts0_stimedout      : Win32.DWORD;
      sts0_serrorout      : Win32.DWORD;
      sts0_pwerrors       : Win32.DWORD;
      sts0_permerrors     : Win32.DWORD;
      sts0_syserrors      : Win32.DWORD;
      sts0_bytessent_low  : Win32.DWORD;
      sts0_bytessent_high : Win32.DWORD;
      sts0_bytesrcvd_low  : Win32.DWORD;
      sts0_bytesrcvd_high : Win32.DWORD;
      sts0_avresponse     : Win32.DWORD;
      sts0_reqbufneed     : Win32.DWORD;
      sts0_bigbufneed     : Win32.DWORD;
   end record;

   function NetStatisticsGet
     (server  : Win32.Winnt.LPTSTR;
      service : Win32.Winnt.LPTSTR;
      level   : Win32.DWORD;
      options : Win32.DWORD;
      bufptr  : access Win32.PBYTE)
      return Win32.DWORD;

private

   pragma Convention (C, STAT_WORKSTATION_0);
   pragma Convention (C, STAT_SERVER_0);

   pragma Import (Stdcall, NetStatisticsGet, "NetStatisticsGet");

end Win32.Lmstats;
