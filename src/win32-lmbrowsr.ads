-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winnt;

package Win32.Lmbrowsr is

    type BROWSER_STATISTICS;                                -- lmbrowsr.h:63
    type BROWSER_STATISTICS_100;                            -- lmbrowsr.h:85
    type BROWSER_STATISTICS_101;                            -- lmbrowsr.h:95

    type PBROWSER_STATISTICS is access all BROWSER_STATISTICS;
                                                            -- lmbrowsr.h:83
    subtype LPBROWSER_STATISTICS is PBROWSER_STATISTICS;    -- lmbrowsr.h:83
    type PBROWSER_STATISTICS_100 is access all BROWSER_STATISTICS_100;
                                                            -- lmbrowsr.h:93
    type PBROWSER_STATISTICS_101 is access all BROWSER_STATISTICS_101;
                                                            -- lmbrowsr.h:113

    type BROWSER_STATISTICS is                              -- lmbrowsr.h:63
        record
            StatisticsStartTime                    : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:64
            NumberOfServerAnnouncements            : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:65
            NumberOfDomainAnnouncements            : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:66
            NumberOfElectionPackets                : Win32.ULONG;
                                                            -- lmbrowsr.h:67
            NumberOfMailslotWrites                 : Win32.ULONG;
                                                            -- lmbrowsr.h:68
            NumberOfGetBrowserServerListRequests   : Win32.ULONG;
                                                            -- lmbrowsr.h:69
            NumberOfServerEnumerations             : Win32.ULONG;
                                                            -- lmbrowsr.h:70
            NumberOfDomainEnumerations             : Win32.ULONG;
                                                            -- lmbrowsr.h:71
            NumberOfOtherEnumerations              : Win32.ULONG;
                                                            -- lmbrowsr.h:72
            NumberOfMissedServerAnnouncements      : Win32.ULONG;
                                                            -- lmbrowsr.h:73
            NumberOfMissedMailslotDatagrams        : Win32.ULONG;
                                                            -- lmbrowsr.h:74
            NumberOfMissedGetBrowserServerListRequests: Win32.ULONG;
                                                            -- lmbrowsr.h:75
            NumberOfFailedServerAnnounceAllocations: Win32.ULONG;
                                                            -- lmbrowsr.h:76
            NumberOfFailedMailslotAllocations      : Win32.ULONG;
                                                            -- lmbrowsr.h:77
            NumberOfFailedMailslotReceives         : Win32.ULONG;
                                                            -- lmbrowsr.h:78
            NumberOfFailedMailslotWrites           : Win32.ULONG;
                                                            -- lmbrowsr.h:79
            NumberOfFailedMailslotOpens            : Win32.ULONG;
                                                            -- lmbrowsr.h:80
            NumberOfDuplicateMasterAnnouncements   : Win32.ULONG;
                                                            -- lmbrowsr.h:81
            NumberOfIllegalDatagrams               : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:82
        end record;

    type BROWSER_STATISTICS_100 is                          -- lmbrowsr.h:85
        record
            StartTime                           : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:86
            NumberOfServerAnnouncements         : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:87
            NumberOfDomainAnnouncements         : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:88
            NumberOfElectionPackets             : Win32.ULONG;
                                                            -- lmbrowsr.h:89
            NumberOfMailslotWrites              : Win32.ULONG;
                                                            -- lmbrowsr.h:90
            NumberOfGetBrowserServerListRequests: Win32.ULONG;
                                                            -- lmbrowsr.h:91
            NumberOfIllegalDatagrams            : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:92
        end record;

    type BROWSER_STATISTICS_101 is                          -- lmbrowsr.h:95
        record
            StartTime                              : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:96
            NumberOfServerAnnouncements            : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:97
            NumberOfDomainAnnouncements            : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:98
            NumberOfElectionPackets                : Win32.ULONG;
                                                            -- lmbrowsr.h:99
            NumberOfMailslotWrites                 : Win32.ULONG;
                                                            -- lmbrowsr.h:100
            NumberOfGetBrowserServerListRequests   : Win32.ULONG;
                                                            -- lmbrowsr.h:101
            NumberOfIllegalDatagrams               : Win32.Winnt.LARGE_INTEGER;
                                                            -- lmbrowsr.h:102
            NumberOfMissedServerAnnouncements      : Win32.ULONG;
                                                            -- lmbrowsr.h:104
            NumberOfMissedMailslotDatagrams        : Win32.ULONG;
                                                            -- lmbrowsr.h:105
            NumberOfMissedGetBrowserServerListRequests: Win32.ULONG;
                                                            -- lmbrowsr.h:106
            NumberOfFailedServerAnnounceAllocations: Win32.ULONG;
                                                            -- lmbrowsr.h:107
            NumberOfFailedMailslotAllocations      : Win32.ULONG;
                                                            -- lmbrowsr.h:108
            NumberOfFailedMailslotReceives         : Win32.ULONG;
                                                            -- lmbrowsr.h:109
            NumberOfFailedMailslotWrites           : Win32.ULONG;
                                                            -- lmbrowsr.h:110
            NumberOfFailedMailslotOpens            : Win32.ULONG;
                                                            -- lmbrowsr.h:111
            NumberOfDuplicateMasterAnnouncements   : Win32.ULONG;
                                                            -- lmbrowsr.h:112
        end record;

    function I_BrowserServerEnum(
                servername   : Win32.Winnt.LPTSTR;
                transport    : Win32.Winnt.LPTSTR;
                clientname   : Win32.Winnt.LPTSTR;
                level        : Win32.DWORD;
                bufptr       : access Win32.PBYTE;
                prefmaxlen   : Win32.DWORD;
                entriesread  : Win32.LPDWORD;
                totalentries : Win32.LPDWORD;
                servertype   : Win32.DWORD;
                domain       : Win32.Winnt.LPTSTR;
                resume_handle: Win32.LPDWORD)
               return Win32.DWORD;                          -- lmbrowsr.h:120

    function I_BrowserQueryOtherDomains(
                servername  : Win32.Winnt.LPTSTR;
                bufptr      : access Win32.PBYTE;
                entriesread : Win32.LPDWORD;
                totalentries: Win32.LPDWORD)
               return Win32.DWORD;                          -- lmbrowsr.h:136

    function I_BrowserResetNetlogonState(
                servername: Win32.Winnt.LPTSTR)
               return Win32.DWORD;                          -- lmbrowsr.h:144
                                                        
    function I_BrowserQueryStatistics(                  
                servername: Win32.Winnt.LPTSTR;         
                statistics: access LPBROWSER_STATISTICS)                
               return Win32.DWORD;                          -- lmbrowsr.h:149
                                                        
    function I_BrowserResetStatistics(                  
                servername: Win32.Winnt.LPTSTR)         
               return Win32.DWORD;                          -- lmbrowsr.h:155

    function I_BrowserServerEnumForXactsrv(
                TransportName        : Win32.Winnt.LPTSTR;
                ClientName           : Win32.Winnt.LPTSTR;
                NtLevel              : Win32.ULONG;
                ClientLevel          : Win32.USHORT;
                Buffer               : Win32.PVOID;
                BufferLength         : Win32.WORD;
                PreferedMaximumLength: Win32.DWORD;
                EntriesRead          : Win32.LPDWORD;
                TotalEntries         : Win32.LPDWORD;
                ServerType           : Win32.DWORD;
                Domain               : Win32.Winnt.LPTSTR;
                Converter            : Win32.PWORD)
               return Win32.WORD;                           -- lmbrowsr.h:161

private

    pragma Convention(C, BROWSER_STATISTICS);               -- lmbrowsr.h:63
    pragma Convention(C, BROWSER_STATISTICS_100);           -- lmbrowsr.h:85
    pragma Convention(C, BROWSER_STATISTICS_101);           -- lmbrowsr.h:95

    pragma Import(Stdcall, I_BrowserServerEnum, "I_BrowserServerEnum");
                                                            -- lmbrowsr.h:120
    pragma Import(Stdcall, I_BrowserQueryOtherDomains, "I_BrowserQueryOtherDomains");
                                                            -- lmbrowsr.h:136
    pragma Import(Stdcall, I_BrowserResetNetlogonState, 
                     "I_BrowserResetNetlogonState");        -- lmbrowsr.h:144
    pragma Import(Stdcall, I_BrowserQueryStatistics, "I_BrowserQueryStatistics");
                                                            -- lmbrowsr.h:149
    pragma Import(Stdcall, I_BrowserResetStatistics, "I_BrowserResetStatistics");
                                                            -- lmbrowsr.h:155
    pragma Import(Stdcall, I_BrowserServerEnumForXactsrv, 
                     "I_BrowserServerEnumForXactsrv");      -- lmbrowsr.h:161

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Lmbrowsr;
