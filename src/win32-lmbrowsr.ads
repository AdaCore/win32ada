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

package Win32.Lmbrowsr is

   type BROWSER_STATISTICS;
   type BROWSER_STATISTICS_100;
   type BROWSER_STATISTICS_101;

   type PBROWSER_STATISTICS is access all BROWSER_STATISTICS;
   subtype LPBROWSER_STATISTICS is PBROWSER_STATISTICS;
   type PBROWSER_STATISTICS_100 is access all BROWSER_STATISTICS_100;
   type PBROWSER_STATISTICS_101 is access all BROWSER_STATISTICS_101;

   type BROWSER_STATISTICS is record
      StatisticsStartTime                        : Win32.Winnt.LARGE_INTEGER;
      NumberOfServerAnnouncements                : Win32.Winnt.LARGE_INTEGER;
      NumberOfDomainAnnouncements                : Win32.Winnt.LARGE_INTEGER;
      NumberOfElectionPackets                    : Win32.ULONG;
      NumberOfMailslotWrites                     : Win32.ULONG;
      NumberOfGetBrowserServerListRequests       : Win32.ULONG;
      NumberOfServerEnumerations                 : Win32.ULONG;
      NumberOfDomainEnumerations                 : Win32.ULONG;
      NumberOfOtherEnumerations                  : Win32.ULONG;
      NumberOfMissedServerAnnouncements          : Win32.ULONG;
      NumberOfMissedMailslotDatagrams            : Win32.ULONG;
      NumberOfMissedGetBrowserServerListRequests : Win32.ULONG;
      NumberOfFailedServerAnnounceAllocations    : Win32.ULONG;
      NumberOfFailedMailslotAllocations          : Win32.ULONG;
      NumberOfFailedMailslotReceives             : Win32.ULONG;
      NumberOfFailedMailslotWrites               : Win32.ULONG;
      NumberOfFailedMailslotOpens                : Win32.ULONG;
      NumberOfDuplicateMasterAnnouncements       : Win32.ULONG;
      NumberOfIllegalDatagrams                   : Win32.Winnt.LARGE_INTEGER;
   end record;

   type BROWSER_STATISTICS_100 is record
      StartTime                            : Win32.Winnt.LARGE_INTEGER;
      NumberOfServerAnnouncements          : Win32.Winnt.LARGE_INTEGER;
      NumberOfDomainAnnouncements          : Win32.Winnt.LARGE_INTEGER;
      NumberOfElectionPackets              : Win32.ULONG;
      NumberOfMailslotWrites               : Win32.ULONG;
      NumberOfGetBrowserServerListRequests : Win32.ULONG;
      NumberOfIllegalDatagrams             : Win32.Winnt.LARGE_INTEGER;
   end record;

   type BROWSER_STATISTICS_101 is record
      StartTime                                  : Win32.Winnt.LARGE_INTEGER;
      NumberOfServerAnnouncements                : Win32.Winnt.LARGE_INTEGER;
      NumberOfDomainAnnouncements                : Win32.Winnt.LARGE_INTEGER;
      NumberOfElectionPackets                    : Win32.ULONG;
      NumberOfMailslotWrites                     : Win32.ULONG;
      NumberOfGetBrowserServerListRequests       : Win32.ULONG;
      NumberOfIllegalDatagrams                   : Win32.Winnt.LARGE_INTEGER;
      NumberOfMissedServerAnnouncements          : Win32.ULONG;
      NumberOfMissedMailslotDatagrams            : Win32.ULONG;
      NumberOfMissedGetBrowserServerListRequests : Win32.ULONG;
      NumberOfFailedServerAnnounceAllocations    : Win32.ULONG;
      NumberOfFailedMailslotAllocations          : Win32.ULONG;
      NumberOfFailedMailslotReceives             : Win32.ULONG;
      NumberOfFailedMailslotWrites               : Win32.ULONG;
      NumberOfFailedMailslotOpens                : Win32.ULONG;
      NumberOfDuplicateMasterAnnouncements       : Win32.ULONG;
   end record;

   function I_BrowserServerEnum
     (servername    : Win32.Winnt.LPTSTR;
      transport     : Win32.Winnt.LPTSTR;
      clientname    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      servertype    : Win32.DWORD;
      domain        : Win32.Winnt.LPTSTR;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function I_BrowserQueryOtherDomains
     (servername   : Win32.Winnt.LPTSTR;
      bufptr       : access Win32.PBYTE;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD)
      return Win32.DWORD;

   function I_BrowserResetNetlogonState
     (servername : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function I_BrowserQueryStatistics
     (servername : Win32.Winnt.LPTSTR;
      statistics : access LPBROWSER_STATISTICS)
      return Win32.DWORD;

   function I_BrowserResetStatistics
     (servername : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function I_BrowserServerEnumForXactsrv
     (TransportName         : Win32.Winnt.LPTSTR;
      ClientName            : Win32.Winnt.LPTSTR;
      NtLevel               : Win32.ULONG;
      ClientLevel           : Win32.USHORT;
      Buffer                : Win32.PVOID;
      BufferLength          : Win32.WORD;
      PreferedMaximumLength : Win32.DWORD;
      EntriesRead           : Win32.LPDWORD;
      TotalEntries          : Win32.LPDWORD;
      ServerType            : Win32.DWORD;
      Domain                : Win32.Winnt.LPTSTR;
      Converter             : Win32.PWORD)
      return Win32.WORD;

private

   pragma Convention (C, BROWSER_STATISTICS);
   pragma Convention (C, BROWSER_STATISTICS_100);
   pragma Convention (C, BROWSER_STATISTICS_101);

   pragma Import (Stdcall, I_BrowserServerEnum, "I_BrowserServerEnum");
   pragma Import
     (Stdcall,
      I_BrowserQueryOtherDomains,
      "I_BrowserQueryOtherDomains");
   pragma Import
     (Stdcall,
      I_BrowserResetNetlogonState,
      "I_BrowserResetNetlogonState");
   pragma Import
     (Stdcall,
      I_BrowserQueryStatistics,
      "I_BrowserQueryStatistics");
   pragma Import
     (Stdcall,
      I_BrowserResetStatistics,
      "I_BrowserResetStatistics");
   pragma Import
     (Stdcall,
      I_BrowserServerEnumForXactsrv,
      "I_BrowserServerEnumForXactsrv");

end Win32.Lmbrowsr;
