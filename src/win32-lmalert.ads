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

with Win32.Lmcons;
with Win32.Winnt;

package Win32.Lmalert is

   use type Interfaces.C.char_array;

   ALERTER_MAILSLOT     : constant Win32.Winnt.TEXT :=
      "\\.\MAILSLOT\Alerter" & Nul;
   ALERT_PRINT_EVENT    : constant Win32.Winnt.TEXT := "PRINTING" & Nul;
   ALERT_MESSAGE_EVENT  : constant Win32.Winnt.TEXT := "MESSAGE" & Nul;
   ALERT_ERRORLOG_EVENT : constant Win32.Winnt.TEXT := "ERRORLOG" & Nul;
   ALERT_ADMIN_EVENT    : constant Win32.Winnt.TEXT := "ADMIN" & Nul;
   ALERT_USER_EVENT     : constant Win32.Winnt.TEXT := "USER" & Nul;
   PRJOB_QSTATUS        : constant := 16#3#;
   PRJOB_DEVSTATUS      : constant := 16#1fc#;
   PRJOB_COMPLETE       : constant := 16#4#;
   PRJOB_INTERV         : constant := 16#8#;
   PRJOB_ERROR          : constant := 16#10#;
   PRJOB_DESTOFFLINE    : constant := 16#20#;
   PRJOB_DESTPAUSED     : constant := 16#40#;
   PRJOB_NOTIFY         : constant := 16#80#;
   PRJOB_DESTNOPAPER    : constant := 16#100#;
   PRJOB_DELETED        : constant := 16#8000#;
   PRJOB_QS_QUEUED      : constant := 0;
   PRJOB_QS_PAUSED      : constant := 1;
   PRJOB_QS_SPOOLING    : constant := 2;
   PRJOB_QS_PRINTING    : constant := 3;

   type STD_ALERT;
   type ADMIN_OTHER_INFO;
   type ERRLOG_OTHER_INFO;
   type PRINT_OTHER_INFO;
   type USER_OTHER_INFO;

   type PSTD_ALERT is access all STD_ALERT;
   subtype LPSTD_ALERT is PSTD_ALERT;

   type PADMIN_OTHER_INFO is access all ADMIN_OTHER_INFO;
   subtype LPADMIN_OTHER_INFO is PADMIN_OTHER_INFO;

   type PERRLOG_OTHER_INFO is access all ERRLOG_OTHER_INFO;
   subtype LPERRLOG_OTHER_INFO is PERRLOG_OTHER_INFO;

   type PPRINT_OTHER_INFO is access all PRINT_OTHER_INFO;
   subtype LPPRINT_OTHER_INFO is PPRINT_OTHER_INFO;

   type PUSER_OTHER_INFO is access all USER_OTHER_INFO;
   subtype LPUSER_OTHER_INFO is PUSER_OTHER_INFO;

   type STD_ALERT is record
      alrt_timestamp   : Win32.DWORD;
      alrt_eventname   : Win32.Winnt.TCHAR_Array (0 .. Win32.Lmcons.EVLEN);
      alrt_servicename : Win32.Winnt.TCHAR_Array (0 .. Win32.Lmcons.SNLEN);
   end record;

   type ADMIN_OTHER_INFO is record
      alrtad_errcode    : Win32.DWORD;
      alrtad_numstrings : Win32.DWORD;
   end record;

   type ERRLOG_OTHER_INFO is record
      alrter_errcode : Win32.DWORD;
      alrter_offset  : Win32.DWORD;
   end record;

   type PRINT_OTHER_INFO is record
      alrtpr_jobid     : Win32.DWORD;
      alrtpr_status    : Win32.DWORD;
      alrtpr_submitted : Win32.DWORD;
      alrtpr_size      : Win32.DWORD;
   end record;

   type USER_OTHER_INFO is record
      alrtus_errcode    : Win32.DWORD;
      alrtus_numstrings : Win32.DWORD;
   end record;

   function NetAlertRaise
     (AlertEventName : Win32.Winnt.LPTSTR;
      Buffer         : Win32.LPVOID;
      BufferSize     : Win32.DWORD)
      return Win32.DWORD;

   function NetAlertRaiseEx
     (AlertEventName   : Win32.Winnt.LPTSTR;
      VariableInfo     : Win32.LPVOID;
      VariableInfoSize : Win32.DWORD;
      ServiceName      : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

private

   pragma Convention (C, STD_ALERT);
   pragma Convention (C_Pass_By_Copy, ADMIN_OTHER_INFO);
   pragma Convention (C_Pass_By_Copy, ERRLOG_OTHER_INFO);
   pragma Convention (C_Pass_By_Copy, PRINT_OTHER_INFO);
   pragma Convention (C_Pass_By_Copy, USER_OTHER_INFO);

   pragma Import (Stdcall, NetAlertRaise, "NetAlertRaise");
   pragma Import (Stdcall, NetAlertRaiseEx, "NetAlertRaiseEx");

end Win32.Lmalert;
