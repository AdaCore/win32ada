-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Lmcons;
with Win32.Winnt;

package Win32.Lmalert is

    use type Interfaces.C.Char_Array;

    ALERTER_MAILSLOT     : constant Win32.Winnt.TEXT := 
			    "\\.\MAILSLOT\Alerter" & Nul;   -- lmalert.h:121
    ALERT_PRINT_EVENT    : constant Win32.Winnt.TEXT :=  "PRINTING" & Nul;
                                                            -- lmalert.h:143
    ALERT_MESSAGE_EVENT  : constant Win32.Winnt.TEXT := "MESSAGE" & Nul;
                                                            -- lmalert.h:144
    ALERT_ERRORLOG_EVENT : constant Win32.Winnt.TEXT := "ERRORLOG" & Nul;
                                                            -- lmalert.h:145
    ALERT_ADMIN_EVENT    : constant Win32.Winnt.TEXT := "ADMIN" & Nul;
                                                            -- lmalert.h:146
    ALERT_USER_EVENT     : constant Win32.Winnt.TEXT := "USER" & Nul;
                                                            -- lmalert.h:147
    PRJOB_QSTATUS        : constant := 16#3#;               -- lmalert.h:155
    PRJOB_DEVSTATUS      : constant := 16#1fc#;             -- lmalert.h:156
    PRJOB_COMPLETE       : constant := 16#4#;               -- lmalert.h:157
    PRJOB_INTERV         : constant := 16#8#;               -- lmalert.h:158
    PRJOB_ERROR          : constant := 16#10#;              -- lmalert.h:159
    PRJOB_DESTOFFLINE    : constant := 16#20#;              -- lmalert.h:160
    PRJOB_DESTPAUSED     : constant := 16#40#;              -- lmalert.h:161
    PRJOB_NOTIFY         : constant := 16#80#;              -- lmalert.h:162
    PRJOB_DESTNOPAPER    : constant := 16#100#;             -- lmalert.h:163
    PRJOB_DELETED        : constant := 16#8000#;            -- lmalert.h:164
    PRJOB_QS_QUEUED      : constant := 0;                   -- lmalert.h:170
    PRJOB_QS_PAUSED      : constant := 1;                   -- lmalert.h:171
    PRJOB_QS_SPOOLING    : constant := 2;                   -- lmalert.h:172
    PRJOB_QS_PRINTING    : constant := 3;                   -- lmalert.h:173

    type STD_ALERT;                                         -- lmalert.h:86
    type ADMIN_OTHER_INFO;                                  -- lmalert.h:92
    type ERRLOG_OTHER_INFO;                                 -- lmalert.h:97
    type PRINT_OTHER_INFO;                                  -- lmalert.h:102
    type USER_OTHER_INFO;                                   -- lmalert.h:109

    type PSTD_ALERT is access all STD_ALERT;                -- lmalert.h:90
    subtype LPSTD_ALERT is PSTD_ALERT;                      -- lmalert.h:90

    type PADMIN_OTHER_INFO is access all ADMIN_OTHER_INFO;  -- lmalert.h:95
    subtype LPADMIN_OTHER_INFO is PADMIN_OTHER_INFO;        -- lmalert.h:95

    type PERRLOG_OTHER_INFO is access all ERRLOG_OTHER_INFO;-- lmalert.h:100
    subtype LPERRLOG_OTHER_INFO is PERRLOG_OTHER_INFO;      -- lmalert.h:100

    type PPRINT_OTHER_INFO is access all PRINT_OTHER_INFO;  -- lmalert.h:107
    subtype LPPRINT_OTHER_INFO is PPRINT_OTHER_INFO;        -- lmalert.h:107

    type PUSER_OTHER_INFO is access all USER_OTHER_INFO;    -- lmalert.h:112
    subtype LPUSER_OTHER_INFO is PUSER_OTHER_INFO;          -- lmalert.h:112

    type STD_ALERT is                                       -- lmalert.h:86
        record
            alrt_timestamp  : Win32.DWORD;                  -- lmalert.h:87
            alrt_eventname  : Win32.Winnt.TCHAR_Array(0..Win32.Lmcons.EVLEN);
                                                            -- lmalert.h:88
            alrt_servicename: Win32.Winnt.TCHAR_Array(0..Win32.Lmcons.SNLEN);
                                                            -- lmalert.h:89
        end record;

    type ADMIN_OTHER_INFO is                                -- lmalert.h:92
        record
            alrtad_errcode   : Win32.DWORD;                 -- lmalert.h:93
            alrtad_numstrings: Win32.DWORD;                 -- lmalert.h:94
        end record;

    type ERRLOG_OTHER_INFO is                               -- lmalert.h:97
        record
            alrter_errcode: Win32.DWORD;                    -- lmalert.h:98
            alrter_offset : Win32.DWORD;                    -- lmalert.h:99
        end record;

    type PRINT_OTHER_INFO is                                -- lmalert.h:102
        record
            alrtpr_jobid    : Win32.DWORD;                  -- lmalert.h:103
            alrtpr_status   : Win32.DWORD;                  -- lmalert.h:104
            alrtpr_submitted: Win32.DWORD;                  -- lmalert.h:105
            alrtpr_size     : Win32.DWORD;                  -- lmalert.h:106
        end record;

    type USER_OTHER_INFO is                                 -- lmalert.h:109
        record
            alrtus_errcode   : Win32.DWORD;                 -- lmalert.h:110
            alrtus_numstrings: Win32.DWORD;                 -- lmalert.h:111
        end record;

    function NetAlertRaise(
                AlertEventName: Win32.Winnt.LPTSTR;
                Buffer        : Win32.LPVOID;
                BufferSize    : Win32.DWORD)
               return Win32.DWORD;                          -- lmalert.h:67

    function NetAlertRaiseEx(
                AlertEventName  : Win32.Winnt.LPTSTR;
                VariableInfo    : Win32.LPVOID;
                VariableInfoSize: Win32.DWORD;
                ServiceName     : Win32.Winnt.LPTSTR)
               return Win32.DWORD;                          -- lmalert.h:74

private

    pragma Convention(C, STD_ALERT);                        -- lmalert.h:86
    pragma Convention(C_Pass_By_Copy, ADMIN_OTHER_INFO);                 -- lmalert.h:92
    pragma Convention(C_Pass_By_Copy, ERRLOG_OTHER_INFO);                -- lmalert.h:97
    pragma Convention(C_Pass_By_Copy, PRINT_OTHER_INFO);                 -- lmalert.h:102
    pragma Convention(C_Pass_By_Copy, USER_OTHER_INFO);                  -- lmalert.h:109

    pragma Import(Stdcall, NetAlertRaise, "NetAlertRaise");       -- lmalert.h:67
    pragma Import(Stdcall, NetAlertRaiseEx, "NetAlertRaiseEx");   -- lmalert.h:74

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

end Win32.Lmalert;
