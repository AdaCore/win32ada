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
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;

package Win32.Winspool is

   PRINTER_CONTROL_PAUSE                    : constant := 1;
   PRINTER_CONTROL_RESUME                   : constant := 2;
   PRINTER_CONTROL_PURGE                    : constant := 3;
   PRINTER_STATUS_PAUSED                    : constant := 16#1#;
   PRINTER_STATUS_ERROR                     : constant := 16#2#;
   PRINTER_STATUS_PENDING_DELETION          : constant := 16#4#;
   PRINTER_STATUS_PAPER_JAM                 : constant := 16#8#;
   PRINTER_STATUS_PAPER_OUT                 : constant := 16#10#;
   PRINTER_STATUS_MANUAL_FEED               : constant := 16#20#;
   PRINTER_STATUS_PAPER_PROBLEM             : constant := 16#40#;
   PRINTER_STATUS_OFFLINE                   : constant := 16#80#;
   PRINTER_STATUS_IO_ACTIVE                 : constant := 16#100#;
   PRINTER_STATUS_BUSY                      : constant := 16#200#;
   PRINTER_STATUS_PRINTING                  : constant := 16#400#;
   PRINTER_STATUS_OUTPUT_BIN_FULL           : constant := 16#800#;
   PRINTER_STATUS_NOT_AVAILABLE             : constant := 16#1000#;
   PRINTER_STATUS_WAITING                   : constant := 16#2000#;
   PRINTER_STATUS_PROCESSING                : constant := 16#4000#;
   PRINTER_STATUS_INITIALIZING              : constant := 16#8000#;
   PRINTER_STATUS_WARMING_UP                : constant := 16#10000#;
   PRINTER_STATUS_TONER_LOW                 : constant := 16#20000#;
   PRINTER_STATUS_NO_TONER                  : constant := 16#40000#;
   PRINTER_STATUS_PAGE_PUNT                 : constant := 16#80000#;
   PRINTER_STATUS_USER_INTERVENTION         : constant := 16#100000#;
   PRINTER_STATUS_OUT_OF_MEMORY             : constant := 16#200000#;
   PRINTER_STATUS_DOOR_OPEN                 : constant := 16#400000#;
   PRINTER_ATTRIBUTE_QUEUED                 : constant := 16#1#;
   PRINTER_ATTRIBUTE_DIRECT                 : constant := 16#2#;
   PRINTER_ATTRIBUTE_DEFAULT                : constant := 16#4#;
   PRINTER_ATTRIBUTE_SHARED                 : constant := 16#8#;
   PRINTER_ATTRIBUTE_NETWORK                : constant := 16#10#;
   PRINTER_ATTRIBUTE_HIDDEN                 : constant := 16#20#;
   PRINTER_ATTRIBUTE_LOCAL                  : constant := 16#40#;
   PRINTER_ATTRIBUTE_ENABLE_DEVQ            : constant := 16#80#;
   PRINTER_ATTRIBUTE_KEEPPRINTEDJOBS        : constant := 16#100#;
   PRINTER_ATTRIBUTE_DO_COMPLETE_FIRST      : constant := 16#200#;
   NO_PRIORITY                              : constant := 0;
   MAX_PRIORITY                             : constant := 99;
   MIN_PRIORITY                             : constant := 1;
   DEF_PRIORITY                             : constant := 1;
   JOB_CONTROL_PAUSE                        : constant := 1;
   JOB_CONTROL_RESUME                       : constant := 2;
   JOB_CONTROL_CANCEL                       : constant := 3;
   JOB_CONTROL_RESTART                      : constant := 4;
   JOB_STATUS_PAUSED                        : constant := 16#1#;
   JOB_STATUS_ERROR                         : constant := 16#2#;
   JOB_STATUS_DELETING                      : constant := 16#4#;
   JOB_STATUS_SPOOLING                      : constant := 16#8#;
   JOB_STATUS_PRINTING                      : constant := 16#10#;
   JOB_STATUS_OFFLINE                       : constant := 16#20#;
   JOB_STATUS_PAPEROUT                      : constant := 16#40#;
   JOB_STATUS_PRINTED                       : constant := 16#80#;
   JOB_POSITION_UNSPECIFIED                 : constant := 0;
   FORM_BUILTIN                             : constant := 16#1#;
   PRINTER_ENUM_DEFAULT                     : constant := 16#1#;
   PRINTER_ENUM_LOCAL                       : constant := 16#2#;
   PRINTER_ENUM_CONNECTIONS                 : constant := 16#4#;
   PRINTER_ENUM_FAVORITE                    : constant := 16#4#;
   PRINTER_ENUM_NAME                        : constant := 16#8#;
   PRINTER_ENUM_REMOTE                      : constant := 16#10#;
   PRINTER_ENUM_SHARED                      : constant := 16#20#;
   PRINTER_ENUM_NETWORK                     : constant := 16#40#;
   PRINTER_ENUM_EXPAND                      : constant := 16#4000#;
   PRINTER_ENUM_CONTAINER                   : constant := 16#8000#;
   PRINTER_ENUM_ICONMASK                    : constant := 16#ff0000#;
   PRINTER_ENUM_ICON1                       : constant := 16#10000#;
   PRINTER_ENUM_ICON2                       : constant := 16#20000#;
   PRINTER_ENUM_ICON3                       : constant := 16#40000#;
   PRINTER_ENUM_ICON4                       : constant := 16#80000#;
   PRINTER_ENUM_ICON5                       : constant := 16#100000#;
   PRINTER_ENUM_ICON6                       : constant := 16#200000#;
   PRINTER_ENUM_ICON7                       : constant := 16#400000#;
   PRINTER_ENUM_ICON8                       : constant := 16#800000#;
   PRINTER_CHANGE_ADD_PRINTER               : constant := 16#1#;
   PRINTER_CHANGE_SET_PRINTER               : constant := 16#2#;
   PRINTER_CHANGE_DELETE_PRINTER            : constant := 16#4#;
   PRINTER_CHANGE_FAILED_CONNECTION_PRINTER : constant := 16#8#;
   PRINTER_CHANGE_PRINTER                   : constant := 16#ff#;
   PRINTER_CHANGE_ADD_JOB                   : constant := 16#100#;
   PRINTER_CHANGE_SET_JOB                   : constant := 16#200#;
   PRINTER_CHANGE_DELETE_JOB                : constant := 16#400#;
   PRINTER_CHANGE_WRITE_JOB                 : constant := 16#800#;
   PRINTER_CHANGE_JOB                       : constant := 16#ff00#;
   PRINTER_CHANGE_ADD_FORM                  : constant := 16#10000#;
   PRINTER_CHANGE_SET_FORM                  : constant := 16#20000#;
   PRINTER_CHANGE_DELETE_FORM               : constant := 16#40000#;
   PRINTER_CHANGE_FORM                      : constant := 16#70000#;
   PRINTER_CHANGE_ADD_PORT                  : constant := 16#100000#;
   PRINTER_CHANGE_CONFIGURE_PORT            : constant := 16#200000#;
   PRINTER_CHANGE_DELETE_PORT               : constant := 16#400000#;
   PRINTER_CHANGE_PORT                      : constant := 16#700000#;
   PRINTER_CHANGE_ADD_PRINT_PROCESSOR       : constant := 16#1000000#;
   PRINTER_CHANGE_DELETE_PRINT_PROCESSOR    : constant := 16#4000000#;
   PRINTER_CHANGE_PRINT_PROCESSOR           : constant := 16#7000000#;
   PRINTER_CHANGE_ADD_PRINTER_DRIVER        : constant := 16#10000000#;
   PRINTER_CHANGE_SET_PRINTER_DRIVER        : constant := 16#20000000#;
   PRINTER_CHANGE_DELETE_PRINTER_DRIVER     : constant := 16#40000000#;
   PRINTER_CHANGE_PRINTER_DRIVER            : constant := 16#70000000#;
   PRINTER_CHANGE_TIMEOUT                   : constant := 16#80000000#;
   PRINTER_CHANGE_ALL                       : constant := 16#7777ffff#;
   PRINTER_ERROR_INFORMATION                : constant := 16#80000000#;
   PRINTER_ERROR_WARNING                    : constant := 16#40000000#;
   PRINTER_ERROR_SEVERE                     : constant := 16#20000000#;
   PRINTER_ERROR_OUTOFPAPER                 : constant := 16#1#;
   PRINTER_ERROR_JAM                        : constant := 16#2#;
   PRINTER_ERROR_OUTOFTONER                 : constant := 16#4#;
   SERVER_ACCESS_ADMINISTER                 : constant := 16#1#;
   SERVER_ACCESS_ENUMERATE                  : constant := 16#2#;
   PRINTER_ACCESS_ADMINISTER                : constant := 16#4#;
   PRINTER_ACCESS_USE                       : constant := 16#8#;
   JOB_ACCESS_ADMINISTER                    : constant := 16#10#;
   SERVER_ALL_ACCESS                        : constant := 16#f0003#;
   SERVER_READ                              : constant := 16#20002#;
   SERVER_WRITE                             : constant := 16#20003#;
   SERVER_EXECUTE                           : constant := 16#20002#;
   PRINTER_ALL_ACCESS                       : constant := 16#f000c#;
   PRINTER_READ                             : constant := 16#20008#;
   PRINTER_WRITE                            : constant := 16#20008#;
   PRINTER_EXECUTE                          : constant := 16#20008#;
   JOB_ALL_ACCESS                           : constant := 16#f0010#;
   JOB_READ                                 : constant := 16#20010#;
   JOB_WRITE                                : constant := 16#20010#;
   JOB_EXECUTE                              : constant := 16#20010#;

   type PRINTER_INFO_1A;
   type PRINTER_INFO_1W;
   type PRINTER_INFO_2A;
   type PRINTER_INFO_2W;
   type PRINTER_INFO_3;
   type PRINTER_INFO_4A;
   type PRINTER_INFO_4W;
   type JOB_INFO_1A;
   type JOB_INFO_1W;
   type JOB_INFO_2A;
   type JOB_INFO_2W;
   type ADDJOB_INFO_1A;
   type ADDJOB_INFO_1W;
   type DRIVER_INFO_1A;
   type DRIVER_INFO_1W;
   type DRIVER_INFO_2A;
   type DRIVER_INFO_2W;
   type DOC_INFO_1A;
   type DOC_INFO_1W;
   type FORM_INFO_1A;
   type FORM_INFO_1W;
   type PRINTPROCESSOR_INFO_1A;
   type PRINTPROCESSOR_INFO_1W;
   type PORT_INFO_1A;
   type PORT_INFO_1W;
   type MONITOR_INFO_1A;
   type MONITOR_INFO_1W;
   type MONITOR_INFO_2A;
   type MONITOR_INFO_2W;
   type DATATYPES_INFO_1A;
   type DATATYPES_INFO_1W;
   type PRINTER_DEFAULTSA;
   type PRINTER_DEFAULTSW;
   type PROVIDOR_INFO_1A;
   type PROVIDOR_INFO_1W;

   type PPRINTER_INFO_1A is access all PRINTER_INFO_1A;
   subtype LPPRINTER_INFO_1A is PPRINTER_INFO_1A;

   type PPRINTER_INFO_1W is access all PRINTER_INFO_1W;
   subtype LPPRINTER_INFO_1W is PPRINTER_INFO_1W;

   type PPRINTER_INFO_1 is access all PRINTER_INFO_1A;
   subtype LPPRINTER_INFO_1 is PPRINTER_INFO_1;

   type PPRINTER_INFO_2A is access all PRINTER_INFO_2A;
   subtype LPPRINTER_INFO_2A is PPRINTER_INFO_2A;

   type PPRINTER_INFO_2W is access all PRINTER_INFO_2W;
   subtype LPPRINTER_INFO_2W is PPRINTER_INFO_2W;

   type PPRINTER_INFO_2 is access all PRINTER_INFO_2A;
   subtype LPPRINTER_INFO_2 is PPRINTER_INFO_2;

   type PPRINTER_INFO_3 is access all PRINTER_INFO_3;
   subtype LPPRINTER_INFO_3 is PPRINTER_INFO_3;

   type PPRINTER_INFO_4A is access all PRINTER_INFO_4A;
   subtype LPPRINTER_INFO_4A is PPRINTER_INFO_4A;

   type PPRINTER_INFO_4W is access all PRINTER_INFO_4W;
   subtype LPPRINTER_INFO_4W is PPRINTER_INFO_4W;

   type PPRINTER_INFO_4 is access all PRINTER_INFO_4A;
   subtype LPPRINTER_INFO_4 is PPRINTER_INFO_4;

   type PJOB_INFO_1A is access all JOB_INFO_1A;
   subtype LPJOB_INFO_1A is PJOB_INFO_1A;

   type PJOB_INFO_1W is access all JOB_INFO_1W;
   subtype LPJOB_INFO_1W is PJOB_INFO_1W;

   type PJOB_INFO_1 is access all JOB_INFO_1A;
   subtype LPJOB_INFO_1 is PJOB_INFO_1;

   type PJOB_INFO_2A is access all JOB_INFO_2A;
   subtype LPJOB_INFO_2A is PJOB_INFO_2A;

   type PJOB_INFO_2W is access all JOB_INFO_2W;
   subtype LPJOB_INFO_2W is PJOB_INFO_2W;

   type PJOB_INFO_2 is access all JOB_INFO_2A;
   subtype LPJOB_INFO_2 is PJOB_INFO_2;

   type PADDJOB_INFO_1A is access all ADDJOB_INFO_1A;
   subtype LPADDJOB_INFO_1A is PADDJOB_INFO_1A;

   type PADDJOB_INFO_1W is access all ADDJOB_INFO_1W;
   subtype LPADDJOB_INFO_1W is PADDJOB_INFO_1W;

   type PADDJOB_INFO_1 is access all ADDJOB_INFO_1A;
   subtype LPADDJOB_INFO_1 is PADDJOB_INFO_1;

   type PDRIVER_INFO_1A is access all DRIVER_INFO_1A;
   subtype LPDRIVER_INFO_1A is PDRIVER_INFO_1A;

   type PDRIVER_INFO_1W is access all DRIVER_INFO_1W;
   subtype LPDRIVER_INFO_1W is PDRIVER_INFO_1W;

   type PDRIVER_INFO_1 is access all DRIVER_INFO_1A;
   subtype LPDRIVER_INFO_1 is PDRIVER_INFO_1;

   type PDRIVER_INFO_2A is access all DRIVER_INFO_2A;
   subtype LPDRIVER_INFO_2A is PDRIVER_INFO_2A;

   type PDRIVER_INFO_2W is access all DRIVER_INFO_2W;
   subtype LPDRIVER_INFO_2W is PDRIVER_INFO_2W;

   type PDRIVER_INFO_2 is access all DRIVER_INFO_2A;
   subtype LPDRIVER_INFO_2 is PDRIVER_INFO_2;

   type PDOC_INFO_1A is access all DOC_INFO_1A;
   subtype LPDOC_INFO_1A is PDOC_INFO_1A;

   type PDOC_INFO_1W is access all DOC_INFO_1W;
   subtype LPDOC_INFO_1W is PDOC_INFO_1W;

   type PDOC_INFO_1 is access all DOC_INFO_1A;
   subtype LPDOC_INFO_1 is PDOC_INFO_1;

   type PFORM_INFO_1A is access all FORM_INFO_1A;
   subtype LPFORM_INFO_1A is PFORM_INFO_1A;

   type PFORM_INFO_1W is access all FORM_INFO_1W;
   subtype LPFORM_INFO_1W is PFORM_INFO_1W;

   type PFORM_INFO_1 is access all FORM_INFO_1A;
   subtype LPFORM_INFO_1 is PFORM_INFO_1;

   type PPRINTPROCESSOR_INFO_1A is access all PRINTPROCESSOR_INFO_1A;
   subtype LPPRINTPROCESSOR_INFO_1A is PPRINTPROCESSOR_INFO_1A;

   type PPRINTPROCESSOR_INFO_1W is access all PRINTPROCESSOR_INFO_1W;
   subtype LPPRINTPROCESSOR_INFO_1W is PPRINTPROCESSOR_INFO_1W;

   type PPRINTPROCESSOR_INFO_1 is access all PRINTPROCESSOR_INFO_1A;
   subtype LPPRINTPROCESSOR_INFO_1 is PPRINTPROCESSOR_INFO_1;

   type PPORT_INFO_1A is access all PORT_INFO_1A;
   subtype LPPORT_INFO_1A is PPORT_INFO_1A;

   type PPORT_INFO_1W is access all PORT_INFO_1W;
   subtype LPPORT_INFO_1W is PPORT_INFO_1W;

   type PPORT_INFO_1 is access all PORT_INFO_1A;
   subtype LPPORT_INFO_1 is PPORT_INFO_1;

   type PMONITOR_INFO_1A is access all MONITOR_INFO_1A;
   subtype LPMONITOR_INFO_1A is PMONITOR_INFO_1A;

   type PMONITOR_INFO_1W is access all MONITOR_INFO_1W;
   subtype LPMONITOR_INFO_1W is PMONITOR_INFO_1W;

   type PMONITOR_INFO_1 is access all MONITOR_INFO_1A;
   subtype LPMONITOR_INFO_1 is PMONITOR_INFO_1;

   type PMONITOR_INFO_2A is access all MONITOR_INFO_2A;
   subtype LPMONITOR_INFO_2A is PMONITOR_INFO_2A;

   type PMONITOR_INFO_2W is access all MONITOR_INFO_2W;
   subtype LPMONITOR_INFO_2W is PMONITOR_INFO_2W;

   type PMONITOR_INFO_2 is access all MONITOR_INFO_2A;
   subtype LPMONITOR_INFO_2 is PMONITOR_INFO_2;

   type PDATATYPES_INFO_1A is access all DATATYPES_INFO_1A;
   subtype LPDATATYPES_INFO_1A is PDATATYPES_INFO_1A;

   type PDATATYPES_INFO_1W is access all DATATYPES_INFO_1W;
   subtype LPDATATYPES_INFO_1W is PDATATYPES_INFO_1W;

   type PDATATYPES_INFO_1 is access all DATATYPES_INFO_1A;
   subtype LPDATATYPES_INFO_1 is PDATATYPES_INFO_1;

   type PPRINTER_DEFAULTSA is access all PRINTER_DEFAULTSA;
   subtype LPPRINTER_DEFAULTSA is PPRINTER_DEFAULTSA;

   type PPRINTER_DEFAULTSW is access all PRINTER_DEFAULTSW;
   subtype LPPRINTER_DEFAULTSW is PPRINTER_DEFAULTSW;

   type PPRINTER_DEFAULTS is access all PRINTER_DEFAULTSA;
   subtype LPPRINTER_DEFAULTS is PPRINTER_DEFAULTS;

   type PPROVIDOR_INFO_1A is access all PROVIDOR_INFO_1A;
   subtype LPPROVIDOR_INFO_1A is PPROVIDOR_INFO_1A;

   type PPROVIDOR_INFO_1W is access all PROVIDOR_INFO_1W;
   subtype LPPROVIDOR_INFO_1W is PPROVIDOR_INFO_1W;

   type PPROVIDOR_INFO_1 is access all PROVIDOR_INFO_1A;
   subtype LPPROVIDOR_INFO_1 is PPROVIDOR_INFO_1;

   type PRINTER_INFO_1A is record
      Flags        : Win32.DWORD;
      pDescription : Win32.LPSTR;
      pName        : Win32.LPSTR;
      pComment     : Win32.LPSTR;
   end record;

   type PRINTER_INFO_1W is record
      Flags        : Win32.DWORD;
      pDescription : Win32.LPWSTR;
      pName        : Win32.LPWSTR;
      pComment     : Win32.LPWSTR;
   end record;

   subtype PRINTER_INFO_1 is PRINTER_INFO_1A;

   type PRINTER_INFO_2A is record
      pServerName         : Win32.LPSTR;
      pPrinterName        : Win32.LPSTR;
      pShareName          : Win32.LPSTR;
      pPortName           : Win32.LPSTR;
      pDriverName         : Win32.LPSTR;
      pComment            : Win32.LPSTR;
      pLocation           : Win32.LPSTR;
      pDevMode            : Win32.Wingdi.LPDEVMODEA;
      pSepFile            : Win32.LPSTR;
      pPrintProcessor     : Win32.LPSTR;
      pDatatype           : Win32.LPSTR;
      pParameters         : Win32.LPSTR;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      Attributes          : Win32.DWORD;
      Priority            : Win32.DWORD;
      DefaultPriority     : Win32.DWORD;
      StartTime           : Win32.DWORD;
      UntilTime           : Win32.DWORD;
      Status              : Win32.DWORD;
      cJobs               : Win32.DWORD;
      AveragePPM          : Win32.DWORD;
   end record;

   type PRINTER_INFO_2W is record
      pServerName         : Win32.LPWSTR;
      pPrinterName        : Win32.LPWSTR;
      pShareName          : Win32.LPWSTR;
      pPortName           : Win32.LPWSTR;
      pDriverName         : Win32.LPWSTR;
      pComment            : Win32.LPWSTR;
      pLocation           : Win32.LPWSTR;
      pDevMode            : Win32.Wingdi.LPDEVMODEW;
      pSepFile            : Win32.LPWSTR;
      pPrintProcessor     : Win32.LPWSTR;
      pDatatype           : Win32.LPWSTR;
      pParameters         : Win32.LPWSTR;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      Attributes          : Win32.DWORD;
      Priority            : Win32.DWORD;
      DefaultPriority     : Win32.DWORD;
      StartTime           : Win32.DWORD;
      UntilTime           : Win32.DWORD;
      Status              : Win32.DWORD;
      cJobs               : Win32.DWORD;
      AveragePPM          : Win32.DWORD;
   end record;

   subtype PRINTER_INFO_2 is PRINTER_INFO_2A;

   type PRINTER_INFO_3 is record
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
   end record;

   type PRINTER_INFO_4A is record
      pPrinterName : Win32.LPSTR;
      pServerName  : Win32.LPSTR;
      Attributes   : Win32.DWORD;
   end record;

   type PRINTER_INFO_4W is record
      pPrinterName : Win32.LPWSTR;
      pServerName  : Win32.LPWSTR;
      Attributes   : Win32.DWORD;
   end record;

   subtype PRINTER_INFO_4 is PRINTER_INFO_4A;

   type JOB_INFO_1A is record
      JobId        : Win32.DWORD;
      pPrinterName : Win32.LPSTR;
      pMachineName : Win32.LPSTR;
      pUserName    : Win32.LPSTR;
      pDocument    : Win32.LPSTR;
      pDatatype    : Win32.LPSTR;
      pStatus      : Win32.LPSTR;
      Status       : Win32.DWORD;
      Priority     : Win32.DWORD;
      Position     : Win32.DWORD;
      TotalPages   : Win32.DWORD;
      PagesPrinted : Win32.DWORD;
      Submitted    : Win32.Winbase.SYSTEMTIME;
   end record;

   type JOB_INFO_1W is record
      JobId        : Win32.DWORD;
      pPrinterName : Win32.LPWSTR;
      pMachineName : Win32.LPWSTR;
      pUserName    : Win32.LPWSTR;
      pDocument    : Win32.LPWSTR;
      pDatatype    : Win32.LPWSTR;
      pStatus      : Win32.LPWSTR;
      Status       : Win32.DWORD;
      Priority     : Win32.DWORD;
      Position     : Win32.DWORD;
      TotalPages   : Win32.DWORD;
      PagesPrinted : Win32.DWORD;
      Submitted    : Win32.Winbase.SYSTEMTIME;
   end record;

   subtype JOB_INFO_1 is JOB_INFO_1A;

   type JOB_INFO_2A is record
      JobId               : Win32.DWORD;
      pPrinterName        : Win32.LPSTR;
      pMachineName        : Win32.LPSTR;
      pUserName           : Win32.LPSTR;
      pDocument           : Win32.LPSTR;
      pNotifyName         : Win32.LPSTR;
      pDatatype           : Win32.LPSTR;
      pPrintProcessor     : Win32.LPSTR;
      pParameters         : Win32.LPSTR;
      pDriverName         : Win32.LPSTR;
      pDevMode            : Win32.Wingdi.LPDEVMODEA;
      pStatus             : Win32.LPSTR;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      Status              : Win32.DWORD;
      Priority            : Win32.DWORD;
      Position            : Win32.DWORD;
      StartTime           : Win32.DWORD;
      UntilTime           : Win32.DWORD;
      TotalPages          : Win32.DWORD;
      Size                : Win32.DWORD;
      Submitted           : Win32.Winbase.SYSTEMTIME;
      Time                : Win32.DWORD;
      PagesPrinted        : Win32.DWORD;
   end record;

   type JOB_INFO_2W is record
      JobId               : Win32.DWORD;
      pPrinterName        : Win32.LPWSTR;
      pMachineName        : Win32.LPWSTR;
      pUserName           : Win32.LPWSTR;
      pDocument           : Win32.LPWSTR;
      pNotifyName         : Win32.LPWSTR;
      pDatatype           : Win32.LPWSTR;
      pPrintProcessor     : Win32.LPWSTR;
      pParameters         : Win32.LPWSTR;
      pDriverName         : Win32.LPWSTR;
      pDevMode            : Win32.Wingdi.LPDEVMODEW;
      pStatus             : Win32.LPWSTR;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      Status              : Win32.DWORD;
      Priority            : Win32.DWORD;
      Position            : Win32.DWORD;
      StartTime           : Win32.DWORD;
      UntilTime           : Win32.DWORD;
      TotalPages          : Win32.DWORD;
      Size                : Win32.DWORD;
      Submitted           : Win32.Winbase.SYSTEMTIME;
      Time                : Win32.DWORD;
      PagesPrinted        : Win32.DWORD;
   end record;

   subtype JOB_INFO_2 is JOB_INFO_2A;

   type ADDJOB_INFO_1A is record
      Path  : Win32.LPSTR;
      JobId : Win32.DWORD;
   end record;

   type ADDJOB_INFO_1W is record
      Path  : Win32.LPWSTR;
      JobId : Win32.DWORD;
   end record;

   subtype ADDJOB_INFO_1 is ADDJOB_INFO_1A;

   type DRIVER_INFO_1A is record
      pName : Win32.LPSTR;
   end record;

   type DRIVER_INFO_1W is record
      pName : Win32.LPWSTR;
   end record;

   subtype DRIVER_INFO_1 is DRIVER_INFO_1A;

   type DRIVER_INFO_2A is record
      cVersion     : Win32.DWORD;
      pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      pDriverPath  : Win32.LPSTR;
      pDataFile    : Win32.LPSTR;
      pConfigFile  : Win32.LPSTR;
   end record;

   type DRIVER_INFO_2W is record
      cVersion     : Win32.DWORD;
      pName        : Win32.LPWSTR;
      pEnvironment : Win32.LPWSTR;
      pDriverPath  : Win32.LPWSTR;
      pDataFile    : Win32.LPWSTR;
      pConfigFile  : Win32.LPWSTR;
   end record;

   subtype DRIVER_INFO_2 is DRIVER_INFO_2A;

   type DOC_INFO_1A is record
      pDocName    : Win32.LPSTR;
      pOutputFile : Win32.LPSTR;
      pDatatype   : Win32.LPSTR;
   end record;

   type DOC_INFO_1W is record
      pDocName    : Win32.LPWSTR;
      pOutputFile : Win32.LPWSTR;
      pDatatype   : Win32.LPWSTR;
   end record;

   subtype DOC_INFO_1 is DOC_INFO_1A;

   type FORM_INFO_1A is record
      Flags         : Win32.DWORD;
      pName         : Win32.LPSTR;
      Size          : Win32.Windef.SIZEL;
      ImageableArea : Win32.Windef.RECTL;
   end record;

   type FORM_INFO_1W is record
      Flags         : Win32.DWORD;
      pName         : Win32.LPWSTR;
      Size          : Win32.Windef.SIZEL;
      ImageableArea : Win32.Windef.RECTL;
   end record;

   subtype FORM_INFO_1 is FORM_INFO_1A;

   type PRINTPROCESSOR_INFO_1A is record
      pName : Win32.LPSTR;
   end record;

   type PRINTPROCESSOR_INFO_1W is record
      pName : Win32.LPWSTR;
   end record;

   subtype PRINTPROCESSOR_INFO_1 is PRINTPROCESSOR_INFO_1A;

   type PORT_INFO_1A is record
      pName : Win32.LPSTR;
   end record;

   type PORT_INFO_1W is record
      pName : Win32.LPWSTR;
   end record;

   subtype PORT_INFO_1 is PORT_INFO_1A;

   type MONITOR_INFO_1A is record
      pName : Win32.LPSTR;
   end record;

   type MONITOR_INFO_1W is record
      pName : Win32.LPWSTR;
   end record;

   subtype MONITOR_INFO_1 is MONITOR_INFO_1A;

   type MONITOR_INFO_2A is record
      pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      pDLLName     : Win32.LPSTR;
   end record;

   type MONITOR_INFO_2W is record
      pName        : Win32.LPWSTR;
      pEnvironment : Win32.LPWSTR;
      pDLLName     : Win32.LPWSTR;
   end record;

   subtype MONITOR_INFO_2 is MONITOR_INFO_2A;

   type DATATYPES_INFO_1A is record
      pName : Win32.LPSTR;
   end record;

   type DATATYPES_INFO_1W is record
      pName : Win32.LPWSTR;
   end record;

   subtype DATATYPES_INFO_1 is DATATYPES_INFO_1A;

   type PRINTER_DEFAULTSA is record
      pDatatype     : Win32.LPSTR;
      pDevMode      : Win32.Wingdi.LPDEVMODEA;
      DesiredAccess : Win32.Winnt.ACCESS_MASK;
   end record;

   type PRINTER_DEFAULTSW is record
      pDatatype     : Win32.LPWSTR;
      pDevMode      : Win32.Wingdi.LPDEVMODEW;
      DesiredAccess : Win32.Winnt.ACCESS_MASK;
   end record;

   subtype PRINTER_DEFAULTS is PRINTER_DEFAULTSA;

   type PROVIDOR_INFO_1A is record
      pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      pDLLName     : Win32.LPSTR;
   end record;

   type PROVIDOR_INFO_1W is record
      pName        : Win32.LPWSTR;
      pEnvironment : Win32.LPWSTR;
      pDLLName     : Win32.LPWSTR;
   end record;

   subtype PROVIDOR_INFO_1 is PROVIDOR_INFO_1A;

   function EnumPrintersA
     (Flags        : Win32.DWORD;
      Name         : Win32.LPSTR;
      Level        : Win32.DWORD;
      pPrinterEnum : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD;
      pcReturned   : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumPrinters
     (Flags        : Win32.DWORD;
      Name         : Win32.LPSTR;
      Level        : Win32.DWORD;
      pPrinterEnum : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD;
      pcReturned   : Win32.LPDWORD)
      return Win32.BOOL renames EnumPrintersA;

   function EnumPrintersW
     (Flags        : Win32.DWORD;
      Name         : Win32.LPWSTR;
      Level        : Win32.DWORD;
      pPrinterEnum : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD;
      pcReturned   : Win32.LPDWORD)
      return Win32.BOOL;

   function OpenPrinterA
     (pPrinterName : Win32.LPSTR;
      phPrinter    : Win32.Windef.LPHANDLE;
      pDefault     : LPPRINTER_DEFAULTSA)
      return Win32.BOOL;

   function OpenPrinter
     (pPrinterName : Win32.LPSTR;
      phPrinter    : Win32.Windef.LPHANDLE;
      pDefault     : LPPRINTER_DEFAULTSA)
      return Win32.BOOL renames OpenPrinterA;

   function OpenPrinterW
     (pPrinterName : Win32.LPWSTR;
      phPrinter    : Win32.Windef.LPHANDLE;
      pDefault     : LPPRINTER_DEFAULTSW)
      return Win32.BOOL;

   function ResetPrinterA
     (hPrinter : Win32.Winnt.HANDLE;
      pDefault : LPPRINTER_DEFAULTSA)
      return Win32.BOOL;

   function ResetPrinter
     (hPrinter : Win32.Winnt.HANDLE;
      pDefault : LPPRINTER_DEFAULTSA)
      return Win32.BOOL renames ResetPrinterA;

   function ResetPrinterW
     (hPrinter : Win32.Winnt.HANDLE;
      pDefault : LPPRINTER_DEFAULTSW)
      return Win32.BOOL;

   function SetJobA
     (hPrinter : Win32.Winnt.HANDLE;
      JobId    : Win32.DWORD;
      Level    : Win32.DWORD;
      pJob     : Win32.LPBYTE;
      Command  : Win32.DWORD)
      return Win32.BOOL;

   function SetJob
     (hPrinter : Win32.Winnt.HANDLE;
      JobId    : Win32.DWORD;
      Level    : Win32.DWORD;
      pJob     : Win32.LPBYTE;
      Command  : Win32.DWORD)
      return Win32.BOOL renames SetJobA;

   function SetJobW
     (hPrinter : Win32.Winnt.HANDLE;
      JobId    : Win32.DWORD;
      Level    : Win32.DWORD;
      pJob     : Win32.LPBYTE;
      Command  : Win32.DWORD)
      return Win32.BOOL;

   function GetJobA
     (hPrinter  : Win32.Winnt.HANDLE;
      JobId     : Win32.DWORD;
      Level     : Win32.DWORD;
      pJob      : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function GetJob
     (hPrinter  : Win32.Winnt.HANDLE;
      JobId     : Win32.DWORD;
      Level     : Win32.DWORD;
      pJob      : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL renames GetJobA;

   function GetJobW
     (hPrinter  : Win32.Winnt.HANDLE;
      JobId     : Win32.DWORD;
      Level     : Win32.DWORD;
      pJob      : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumJobsA
     (hPrinter   : Win32.Winnt.HANDLE;
      FirstJob   : Win32.DWORD;
      NoJobs     : Win32.DWORD;
      Level      : Win32.DWORD;
      pJob       : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumJobs
     (hPrinter   : Win32.Winnt.HANDLE;
      FirstJob   : Win32.DWORD;
      NoJobs     : Win32.DWORD;
      Level      : Win32.DWORD;
      pJob       : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL renames EnumJobsA;

   function EnumJobsW
     (hPrinter   : Win32.Winnt.HANDLE;
      FirstJob   : Win32.DWORD;
      NoJobs     : Win32.DWORD;
      Level      : Win32.DWORD;
      pJob       : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function AddPrinterA
     (pName    : Win32.LPSTR;
      Level    : Win32.DWORD;
      pPrinter : Win32.LPBYTE)
      return Win32.Winnt.HANDLE;

   function AddPrinter
     (pName    : Win32.LPSTR;
      Level    : Win32.DWORD;
      pPrinter : Win32.LPBYTE)
      return Win32.Winnt.HANDLE renames AddPrinterA;

   function AddPrinterW
     (pName    : Win32.LPWSTR;
      Level    : Win32.DWORD;
      pPrinter : Win32.LPBYTE)
      return Win32.Winnt.HANDLE;

   function DeletePrinter (hPrinter : Win32.Winnt.HANDLE) return Win32.BOOL;

   function SetPrinterA
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pPrinter : Win32.LPBYTE;
      Command  : Win32.DWORD)
      return Win32.BOOL;

   function SetPrinter
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pPrinter : Win32.LPBYTE;
      Command  : Win32.DWORD)
      return Win32.BOOL renames SetPrinterA;

   function SetPrinterW
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pPrinter : Win32.LPBYTE;
      Command  : Win32.DWORD)
      return Win32.BOOL;

   function GetPrinterA
     (hPrinter  : Win32.Winnt.HANDLE;
      Level     : Win32.DWORD;
      pPrinter  : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function GetPrinter
     (hPrinter  : Win32.Winnt.HANDLE;
      Level     : Win32.DWORD;
      pPrinter  : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL renames GetPrinterA;

   function GetPrinterW
     (hPrinter  : Win32.Winnt.HANDLE;
      Level     : Win32.DWORD;
      pPrinter  : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function AddPrinterDriverA
     (pName       : Win32.LPSTR;
      Level       : Win32.DWORD;
      pDriverInfo : Win32.LPBYTE)
      return Win32.BOOL;

   function AddPrinterDriver
     (pName       : Win32.LPSTR;
      Level       : Win32.DWORD;
      pDriverInfo : Win32.LPBYTE)
      return Win32.BOOL renames AddPrinterDriverA;

   function AddPrinterDriverW
     (pName       : Win32.LPWSTR;
      Level       : Win32.DWORD;
      pDriverInfo : Win32.LPBYTE)
      return Win32.BOOL;

   function EnumPrinterDriversA
     (pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      Level        : Win32.DWORD;
      pDriverInfo  : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD;
      pcReturned   : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumPrinterDrivers
     (pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      Level        : Win32.DWORD;
      pDriverInfo  : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD;
      pcReturned   : Win32.LPDWORD)
      return Win32.BOOL renames EnumPrinterDriversA;

   function EnumPrinterDriversW
     (pName        : Win32.LPWSTR;
      pEnvironment : Win32.LPWSTR;
      Level        : Win32.DWORD;
      pDriverInfo  : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD;
      pcReturned   : Win32.LPDWORD)
      return Win32.BOOL;

   function GetPrinterDriverA
     (hPrinter     : Win32.Winnt.HANDLE;
      pEnvironment : Win32.LPSTR;
      Level        : Win32.DWORD;
      pDriverInfo  : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD)
      return Win32.BOOL;

   function GetPrinterDriver
     (hPrinter     : Win32.Winnt.HANDLE;
      pEnvironment : Win32.LPSTR;
      Level        : Win32.DWORD;
      pDriverInfo  : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD)
      return Win32.BOOL renames GetPrinterDriverA;

   function GetPrinterDriverW
     (hPrinter     : Win32.Winnt.HANDLE;
      pEnvironment : Win32.LPWSTR;
      Level        : Win32.DWORD;
      pDriverInfo  : Win32.LPBYTE;
      cbBuf        : Win32.DWORD;
      pcbNeeded    : Win32.LPDWORD)
      return Win32.BOOL;

   function GetPrinterDriverDirectoryA
     (pName            : Win32.LPSTR;
      pEnvironment     : Win32.LPSTR;
      Level            : Win32.DWORD;
      pDriverDirectory : Win32.LPBYTE;
      cbBuf            : Win32.DWORD;
      pcbNeeded        : Win32.LPDWORD)
      return Win32.BOOL;

   function GetPrinterDriverDirectory
     (pName            : Win32.LPSTR;
      pEnvironment     : Win32.LPSTR;
      Level            : Win32.DWORD;
      pDriverDirectory : Win32.LPBYTE;
      cbBuf            : Win32.DWORD;
      pcbNeeded        : Win32.LPDWORD)
      return Win32.BOOL renames GetPrinterDriverDirectoryA;

   function GetPrinterDriverDirectoryW
     (pName            : Win32.LPWSTR;
      pEnvironment     : Win32.LPWSTR;
      Level            : Win32.DWORD;
      pDriverDirectory : Win32.LPBYTE;
      cbBuf            : Win32.DWORD;
      pcbNeeded        : Win32.LPDWORD)
      return Win32.BOOL;

   function DeletePrinterDriverA
     (pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      pDriverName  : Win32.LPSTR)
      return Win32.BOOL;

   function DeletePrinterDriver
     (pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      pDriverName  : Win32.LPSTR)
      return Win32.BOOL renames DeletePrinterDriverA;

   function DeletePrinterDriverW
     (pName        : Win32.LPWSTR;
      pEnvironment : Win32.LPWSTR;
      pDriverName  : Win32.LPWSTR)
      return Win32.BOOL;

   function AddPrintProcessorA
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      pPathName           : Win32.LPSTR;
      pPrintProcessorName : Win32.LPSTR)
      return Win32.BOOL;

   function AddPrintProcessor
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      pPathName           : Win32.LPSTR;
      pPrintProcessorName : Win32.LPSTR)
      return Win32.BOOL renames AddPrintProcessorA;

   function AddPrintProcessorW
     (pName               : Win32.LPWSTR;
      pEnvironment        : Win32.LPWSTR;
      pPathName           : Win32.LPWSTR;
      pPrintProcessorName : Win32.LPWSTR)
      return Win32.BOOL;

   function EnumPrintProcessorsA
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      Level               : Win32.DWORD;
      pPrintProcessorInfo : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD;
      pcReturned          : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumPrintProcessors
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      Level               : Win32.DWORD;
      pPrintProcessorInfo : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD;
      pcReturned          : Win32.LPDWORD)
      return Win32.BOOL renames EnumPrintProcessorsA;

   function EnumPrintProcessorsW
     (pName               : Win32.LPWSTR;
      pEnvironment        : Win32.LPWSTR;
      Level               : Win32.DWORD;
      pPrintProcessorInfo : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD;
      pcReturned          : Win32.LPDWORD)
      return Win32.BOOL;

   function GetPrintProcessorDirectoryA
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      Level               : Win32.DWORD;
      pPrintProcessorInfo : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD)
      return Win32.BOOL;

   function GetPrintProcessorDirectory
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      Level               : Win32.DWORD;
      pPrintProcessorInfo : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD)
      return Win32.BOOL renames GetPrintProcessorDirectoryA;

   function GetPrintProcessorDirectoryW
     (pName               : Win32.LPWSTR;
      pEnvironment        : Win32.LPWSTR;
      Level               : Win32.DWORD;
      pPrintProcessorInfo : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumPrintProcessorDatatypesA
     (pName               : Win32.LPSTR;
      pPrintProcessorName : Win32.LPSTR;
      Level               : Win32.DWORD;
      pDatatypes          : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD;
      pcReturned          : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumPrintProcessorDatatypes
     (pName               : Win32.LPSTR;
      pPrintProcessorName : Win32.LPSTR;
      Level               : Win32.DWORD;
      pDatatypes          : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD;
      pcReturned          : Win32.LPDWORD)
      return Win32.BOOL renames EnumPrintProcessorDatatypesA;

   function EnumPrintProcessorDatatypesW
     (pName               : Win32.LPWSTR;
      pPrintProcessorName : Win32.LPWSTR;
      Level               : Win32.DWORD;
      pDatatypes          : Win32.LPBYTE;
      cbBuf               : Win32.DWORD;
      pcbNeeded           : Win32.LPDWORD;
      pcReturned          : Win32.LPDWORD)
      return Win32.BOOL;

   function DeletePrintProcessorA
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      pPrintProcessorName : Win32.LPSTR)
      return Win32.BOOL;

   function DeletePrintProcessor
     (pName               : Win32.LPSTR;
      pEnvironment        : Win32.LPSTR;
      pPrintProcessorName : Win32.LPSTR)
      return Win32.BOOL renames DeletePrintProcessorA;

   function DeletePrintProcessorW
     (pName               : Win32.LPWSTR;
      pEnvironment        : Win32.LPWSTR;
      pPrintProcessorName : Win32.LPWSTR)
      return Win32.BOOL;

   function StartDocPrinterA
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pDocInfo : Win32.LPBYTE)
      return Win32.DWORD;

   function StartDocPrinter
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pDocInfo : Win32.LPBYTE)
      return Win32.DWORD renames StartDocPrinterA;

   function StartDocPrinterW
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pDocInfo : Win32.LPBYTE)
      return Win32.DWORD;

   function StartPagePrinter
     (hPrinter : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function WritePrinter
     (hPrinter  : Win32.Winnt.HANDLE;
      pBuf      : Win32.LPVOID;
      cbBuf     : Win32.DWORD;
      pcWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function EndPagePrinter
     (hPrinter : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function AbortPrinter (hPrinter : Win32.Winnt.HANDLE) return Win32.BOOL;

   function ReadPrinter
     (hPrinter     : Win32.Winnt.HANDLE;
      pBuf         : Win32.LPVOID;
      cbBuf        : Win32.DWORD;
      pNoBytesRead : Win32.LPDWORD)
      return Win32.BOOL;

   function EndDocPrinter (hPrinter : Win32.Winnt.HANDLE) return Win32.BOOL;

   function AddJobA
     (hPrinter  : Win32.Winnt.HANDLE;
      Level     : Win32.DWORD;
      pData     : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function AddJob
     (hPrinter  : Win32.Winnt.HANDLE;
      Level     : Win32.DWORD;
      pData     : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL renames AddJobA;

   function AddJobW
     (hPrinter  : Win32.Winnt.HANDLE;
      Level     : Win32.DWORD;
      pData     : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function ScheduleJob
     (hPrinter : Win32.Winnt.HANDLE;
      JobId    : Win32.DWORD)
      return Win32.BOOL;

   function PrinterProperties
     (hWnd     : Win32.Windef.HWND;
      hPrinter : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function DocumentPropertiesA
     (hWnd           : Win32.Windef.HWND;
      hPrinter       : Win32.Winnt.HANDLE;
      pDeviceName    : Win32.LPSTR;
      pDevModeOutput : Win32.Wingdi.PDEVMODEA;
      pDevModeInput  : Win32.Wingdi.PDEVMODEA;
      fMode          : Win32.DWORD)
      return Win32.LONG;

   function DocumentProperties
     (hWnd           : Win32.Windef.HWND;
      hPrinter       : Win32.Winnt.HANDLE;
      pDeviceName    : Win32.LPSTR;
      pDevModeOutput : Win32.Wingdi.PDEVMODEA;
      pDevModeInput  : Win32.Wingdi.PDEVMODEA;
      fMode          : Win32.DWORD)
      return Win32.LONG renames DocumentPropertiesA;

   function DocumentPropertiesW
     (hWnd           : Win32.Windef.HWND;
      hPrinter       : Win32.Winnt.HANDLE;
      pDeviceName    : Win32.LPWSTR;
      pDevModeOutput : Win32.Wingdi.PDEVMODEW;
      pDevModeInput  : Win32.Wingdi.PDEVMODEW;
      fMode          : Win32.DWORD)
      return Win32.LONG;

   function AdvancedDocumentPropertiesA
     (hWnd           : Win32.Windef.HWND;
      hPrinter       : Win32.Winnt.HANDLE;
      pDeviceName    : Win32.LPSTR;
      pDevModeOutput : Win32.Wingdi.PDEVMODEA;
      pDevModeInput  : Win32.Wingdi.PDEVMODEA)
      return Win32.LONG;

   function AdvancedDocumentProperties
     (hWnd           : Win32.Windef.HWND;
      hPrinter       : Win32.Winnt.HANDLE;
      pDeviceName    : Win32.LPSTR;
      pDevModeOutput : Win32.Wingdi.PDEVMODEA;
      pDevModeInput  : Win32.Wingdi.PDEVMODEA)
      return Win32.LONG renames AdvancedDocumentPropertiesA;

   function AdvancedDocumentPropertiesW
     (hWnd           : Win32.Windef.HWND;
      hPrinter       : Win32.Winnt.HANDLE;
      pDeviceName    : Win32.LPWSTR;
      pDevModeOutput : Win32.Wingdi.PDEVMODEW;
      pDevModeInput  : Win32.Wingdi.PDEVMODEW)
      return Win32.LONG;

   function GetPrinterDataA
     (hPrinter   : Win32.Winnt.HANDLE;
      pValueName : Win32.LPSTR;
      pType      : Win32.LPDWORD;
      pData      : Win32.LPBYTE;
      nSize      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD)
      return Win32.DWORD;

   function GetPrinterData
     (hPrinter   : Win32.Winnt.HANDLE;
      pValueName : Win32.LPSTR;
      pType      : Win32.LPDWORD;
      pData      : Win32.LPBYTE;
      nSize      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD)
      return Win32.DWORD renames GetPrinterDataA;

   function GetPrinterDataW
     (hPrinter   : Win32.Winnt.HANDLE;
      pValueName : Win32.LPWSTR;
      pType      : Win32.LPDWORD;
      pData      : Win32.LPBYTE;
      nSize      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD)
      return Win32.DWORD;

   function SetPrinterDataA
     (hPrinter   : Win32.Winnt.HANDLE;
      pValueName : Win32.LPSTR;
      c_Type     : Win32.DWORD;
      pData      : Win32.LPBYTE;
      cbData     : Win32.DWORD)
      return Win32.DWORD;

   function SetPrinterData
     (hPrinter   : Win32.Winnt.HANDLE;
      pValueName : Win32.LPSTR;
      c_Type     : Win32.DWORD;
      pData      : Win32.LPBYTE;
      cbData     : Win32.DWORD)
      return Win32.DWORD renames SetPrinterDataA;

   function SetPrinterDataW
     (hPrinter   : Win32.Winnt.HANDLE;
      pValueName : Win32.LPWSTR;
      c_Type     : Win32.DWORD;
      pData      : Win32.LPBYTE;
      cbData     : Win32.DWORD)
      return Win32.DWORD;

   function WaitForPrinterChange
     (hPrinter : Win32.Winnt.HANDLE;
      Flags    : Win32.DWORD)
      return Win32.DWORD;

   function FindFirstPrinterChangeNotification
     (hPrinter   : Win32.Winnt.HANDLE;
      fdwFlags   : Win32.DWORD;
      fdwOptions : Win32.DWORD;
      pvReserved : Win32.LPVOID)
      return Win32.Winnt.HANDLE;

   function FindNextPrinterChangeNotification
     (hChange    : Win32.Winnt.HANDLE;
      pdwChange  : Win32.PDWORD;
      dwReserved : Win32.DWORD;
      pvReserved : Win32.LPVOID)
      return Win32.BOOL;

   function FindClosePrinterChangeNotification
     (hChange : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function PrinterMessageBoxA
     (hPrinter : Win32.Winnt.HANDLE;
      Error    : Win32.DWORD;
      hWnd     : Win32.Windef.HWND;
      pText    : Win32.LPSTR;
      pCaption : Win32.LPSTR;
      dwType   : Win32.DWORD)
      return Win32.DWORD;

   function PrinterMessageBox
     (hPrinter : Win32.Winnt.HANDLE;
      Error    : Win32.DWORD;
      hWnd     : Win32.Windef.HWND;
      pText    : Win32.LPSTR;
      pCaption : Win32.LPSTR;
      dwType   : Win32.DWORD)
      return Win32.DWORD renames PrinterMessageBoxA;

   function PrinterMessageBoxW
     (hPrinter : Win32.Winnt.HANDLE;
      Error    : Win32.DWORD;
      hWnd     : Win32.Windef.HWND;
      pText    : Win32.LPWSTR;
      pCaption : Win32.LPWSTR;
      dwType   : Win32.DWORD)
      return Win32.DWORD;

   function ClosePrinter (hPrinter : Win32.Winnt.HANDLE) return Win32.BOOL;

   function AddFormA
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pForm    : Win32.LPBYTE)
      return Win32.BOOL;

   function AddForm
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pForm    : Win32.LPBYTE)
      return Win32.BOOL renames AddFormA;

   function AddFormW
     (hPrinter : Win32.Winnt.HANDLE;
      Level    : Win32.DWORD;
      pForm    : Win32.LPBYTE)
      return Win32.BOOL;

   function DeleteFormA
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPSTR)
      return Win32.BOOL;

   function DeleteForm
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPSTR)
      return Win32.BOOL renames DeleteFormA;

   function DeleteFormW
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPWSTR)
      return Win32.BOOL;

   function GetFormA
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPSTR;
      Level     : Win32.DWORD;
      pForm     : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function GetForm
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPSTR;
      Level     : Win32.DWORD;
      pForm     : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL renames GetFormA;

   function GetFormW
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPWSTR;
      Level     : Win32.DWORD;
      pForm     : Win32.LPBYTE;
      cbBuf     : Win32.DWORD;
      pcbNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function SetFormA
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPSTR;
      Level     : Win32.DWORD;
      pForm     : Win32.LPBYTE)
      return Win32.BOOL;

   function SetForm
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPSTR;
      Level     : Win32.DWORD;
      pForm     : Win32.LPBYTE)
      return Win32.BOOL renames SetFormA;

   function SetFormW
     (hPrinter  : Win32.Winnt.HANDLE;
      pFormName : Win32.LPWSTR;
      Level     : Win32.DWORD;
      pForm     : Win32.LPBYTE)
      return Win32.BOOL;

   function EnumFormsA
     (hPrinter   : Win32.Winnt.HANDLE;
      Level      : Win32.DWORD;
      pForm      : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumForms
     (hPrinter   : Win32.Winnt.HANDLE;
      Level      : Win32.DWORD;
      pForm      : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL renames EnumFormsA;

   function EnumFormsW
     (hPrinter   : Win32.Winnt.HANDLE;
      Level      : Win32.DWORD;
      pForm      : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumMonitorsA
     (pName      : Win32.LPSTR;
      Level      : Win32.DWORD;
      pMonitors  : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumMonitors
     (pName      : Win32.LPSTR;
      Level      : Win32.DWORD;
      pMonitors  : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL renames EnumMonitorsA;

   function EnumMonitorsW
     (pName      : Win32.LPWSTR;
      Level      : Win32.DWORD;
      pMonitors  : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function AddMonitorA
     (pName     : Win32.LPSTR;
      Level     : Win32.DWORD;
      pMonitors : Win32.LPBYTE)
      return Win32.BOOL;

   function AddMonitor
     (pName     : Win32.LPSTR;
      Level     : Win32.DWORD;
      pMonitors : Win32.LPBYTE)
      return Win32.BOOL renames AddMonitorA;

   function AddMonitorW
     (pName     : Win32.LPWSTR;
      Level     : Win32.DWORD;
      pMonitors : Win32.LPBYTE)
      return Win32.BOOL;

   function DeleteMonitorA
     (pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      pMonitorName : Win32.LPSTR)
      return Win32.BOOL;

   function DeleteMonitor
     (pName        : Win32.LPSTR;
      pEnvironment : Win32.LPSTR;
      pMonitorName : Win32.LPSTR)
      return Win32.BOOL renames DeleteMonitorA;

   function DeleteMonitorW
     (pName        : Win32.LPWSTR;
      pEnvironment : Win32.LPWSTR;
      pMonitorName : Win32.LPWSTR)
      return Win32.BOOL;

   function EnumPortsA
     (pName      : Win32.LPSTR;
      Level      : Win32.DWORD;
      pPorts     : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumPorts
     (pName      : Win32.LPSTR;
      Level      : Win32.DWORD;
      pPorts     : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL renames EnumPortsA;

   function EnumPortsW
     (pName      : Win32.LPWSTR;
      Level      : Win32.DWORD;
      pPorts     : Win32.LPBYTE;
      cbBuf      : Win32.DWORD;
      pcbNeeded  : Win32.LPDWORD;
      pcReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function AddPortA
     (pName        : Win32.LPSTR;
      hWnd         : Win32.Windef.HWND;
      pMonitorName : Win32.LPSTR)
      return Win32.BOOL;

   function AddPort
     (pName        : Win32.LPSTR;
      hWnd         : Win32.Windef.HWND;
      pMonitorName : Win32.LPSTR)
      return Win32.BOOL renames AddPortA;

   function AddPortW
     (pName        : Win32.LPWSTR;
      hWnd         : Win32.Windef.HWND;
      pMonitorName : Win32.LPWSTR)
      return Win32.BOOL;

   function ConfigurePortA
     (pName     : Win32.LPSTR;
      hWnd      : Win32.Windef.HWND;
      pPortName : Win32.LPSTR)
      return Win32.BOOL;

   function ConfigurePort
     (pName     : Win32.LPSTR;
      hWnd      : Win32.Windef.HWND;
      pPortName : Win32.LPSTR)
      return Win32.BOOL renames ConfigurePortA;

   function ConfigurePortW
     (pName     : Win32.LPWSTR;
      hWnd      : Win32.Windef.HWND;
      pPortName : Win32.LPWSTR)
      return Win32.BOOL;

   function DeletePortA
     (pName     : Win32.LPSTR;
      hWnd      : Win32.Windef.HWND;
      pPortName : Win32.LPSTR)
      return Win32.BOOL;

   function DeletePort
     (pName     : Win32.LPSTR;
      hWnd      : Win32.Windef.HWND;
      pPortName : Win32.LPSTR)
      return Win32.BOOL renames DeletePortA;

   function DeletePortW
     (pName     : Win32.LPWSTR;
      hWnd      : Win32.Windef.HWND;
      pPortName : Win32.LPWSTR)
      return Win32.BOOL;

   function AddPrinterConnectionA (pName : Win32.LPSTR) return Win32.BOOL;

   function AddPrinterConnection (pName : Win32.LPSTR) return Win32.BOOL
      renames AddPrinterConnectionA;

   function AddPrinterConnectionW (pName : Win32.LPWSTR) return Win32.BOOL;

   function DeletePrinterConnectionA
     (pName : Win32.LPSTR)
      return Win32.BOOL;

   function DeletePrinterConnection (pName : Win32.LPSTR) return Win32.BOOL
      renames DeletePrinterConnectionA;

   function DeletePrinterConnectionW
     (pName : Win32.LPWSTR)
      return Win32.BOOL;

   function ConnectToPrinterDlg
     (hwnd  : Win32.Windef.HWND;
      Flags : Win32.DWORD)
      return Win32.Winnt.HANDLE;

   function AddPrintProvidorA
     (pName         : Win32.LPSTR;
      level         : Win32.DWORD;
      pProvidorInfo : Win32.LPBYTE)
      return Win32.BOOL;

   function AddPrintProvidor
     (pName         : Win32.LPSTR;
      level         : Win32.DWORD;
      pProvidorInfo : Win32.LPBYTE)
      return Win32.BOOL renames AddPrintProvidorA;

   function AddPrintProvidorW
     (pName         : Win32.LPWSTR;
      level         : Win32.DWORD;
      pProvidorInfo : Win32.LPBYTE)
      return Win32.BOOL;

   function DeletePrintProvidorA
     (pName              : Win32.LPSTR;
      pEnvironment       : Win32.LPSTR;
      pPrintProvidorName : Win32.LPSTR)
      return Win32.BOOL;

   function DeletePrintProvidor
     (pName              : Win32.LPSTR;
      pEnvironment       : Win32.LPSTR;
      pPrintProvidorName : Win32.LPSTR)
      return Win32.BOOL renames DeletePrintProvidorA;

   function DeletePrintProvidorW
     (pName              : Win32.LPWSTR;
      pEnvironment       : Win32.LPWSTR;
      pPrintProvidorName : Win32.LPWSTR)
      return Win32.BOOL;

private

   pragma Convention (C_Pass_By_Copy, PRINTER_INFO_1A);
   pragma Convention (C_Pass_By_Copy, PRINTER_INFO_1W);
   pragma Convention (C, PRINTER_INFO_2A);
   pragma Convention (C, PRINTER_INFO_2W);
   pragma Convention (C_Pass_By_Copy, PRINTER_INFO_3);
   pragma Convention (C_Pass_By_Copy, PRINTER_INFO_4A);
   pragma Convention (C_Pass_By_Copy, PRINTER_INFO_4W);
   pragma Convention (C, JOB_INFO_1A);
   pragma Convention (C, JOB_INFO_1W);
   pragma Convention (C, JOB_INFO_2A);
   pragma Convention (C, JOB_INFO_2W);
   pragma Convention (C_Pass_By_Copy, ADDJOB_INFO_1A);
   pragma Convention (C_Pass_By_Copy, ADDJOB_INFO_1W);
   pragma Convention (C_Pass_By_Copy, DRIVER_INFO_1A);
   pragma Convention (C_Pass_By_Copy, DRIVER_INFO_1W);
   pragma Convention (C, DRIVER_INFO_2A);
   pragma Convention (C, DRIVER_INFO_2W);
   pragma Convention (C_Pass_By_Copy, DOC_INFO_1A);
   pragma Convention (C_Pass_By_Copy, DOC_INFO_1W);
   pragma Convention (C, FORM_INFO_1A);
   pragma Convention (C, FORM_INFO_1W);
   pragma Convention (C_Pass_By_Copy, PRINTPROCESSOR_INFO_1A);
   pragma Convention (C_Pass_By_Copy, PRINTPROCESSOR_INFO_1W);
   pragma Convention (C_Pass_By_Copy, PORT_INFO_1A);
   pragma Convention (C_Pass_By_Copy, PORT_INFO_1W);
   pragma Convention (C_Pass_By_Copy, MONITOR_INFO_1A);
   pragma Convention (C_Pass_By_Copy, MONITOR_INFO_1W);
   pragma Convention (C_Pass_By_Copy, MONITOR_INFO_2A);
   pragma Convention (C_Pass_By_Copy, MONITOR_INFO_2W);
   pragma Convention (C_Pass_By_Copy, DATATYPES_INFO_1A);
   pragma Convention (C_Pass_By_Copy, DATATYPES_INFO_1W);
   pragma Convention (C_Pass_By_Copy, PRINTER_DEFAULTSA);
   pragma Convention (C_Pass_By_Copy, PRINTER_DEFAULTSW);
   pragma Convention (C_Pass_By_Copy, PROVIDOR_INFO_1A);
   pragma Convention (C_Pass_By_Copy, PROVIDOR_INFO_1W);

   pragma Import (Stdcall, EnumPrintersA, "EnumPrintersA");
   pragma Import (Stdcall, EnumPrintersW, "EnumPrintersW");
   pragma Import (Stdcall, OpenPrinterA, "OpenPrinterA");
   pragma Import (Stdcall, OpenPrinterW, "OpenPrinterW");
   pragma Import (Stdcall, ResetPrinterA, "ResetPrinterA");
   pragma Import (Stdcall, ResetPrinterW, "ResetPrinterW");
   pragma Import (Stdcall, SetJobA, "SetJobA");
   pragma Import (Stdcall, SetJobW, "SetJobW");
   pragma Import (Stdcall, GetJobA, "GetJobA");
   pragma Import (Stdcall, GetJobW, "GetJobW");
   pragma Import (Stdcall, EnumJobsA, "EnumJobsA");
   pragma Import (Stdcall, EnumJobsW, "EnumJobsW");
   pragma Import (Stdcall, AddPrinterA, "AddPrinterA");
   pragma Import (Stdcall, AddPrinterW, "AddPrinterW");
   pragma Import (Stdcall, DeletePrinter, "DeletePrinter");
   pragma Import (Stdcall, SetPrinterA, "SetPrinterA");
   pragma Import (Stdcall, SetPrinterW, "SetPrinterW");
   pragma Import (Stdcall, GetPrinterA, "GetPrinterA");
   pragma Import (Stdcall, GetPrinterW, "GetPrinterW");
   pragma Import (Stdcall, AddPrinterDriverA, "AddPrinterDriverA");
   pragma Import (Stdcall, AddPrinterDriverW, "AddPrinterDriverW");
   pragma Import (Stdcall, EnumPrinterDriversA, "EnumPrinterDriversA");
   pragma Import (Stdcall, EnumPrinterDriversW, "EnumPrinterDriversW");
   pragma Import (Stdcall, GetPrinterDriverA, "GetPrinterDriverA");
   pragma Import (Stdcall, GetPrinterDriverW, "GetPrinterDriverW");
   pragma Import
     (Stdcall,
      GetPrinterDriverDirectoryA,
      "GetPrinterDriverDirectoryA");
   pragma Import
     (Stdcall,
      GetPrinterDriverDirectoryW,
      "GetPrinterDriverDirectoryW");
   pragma Import (Stdcall, DeletePrinterDriverA, "DeletePrinterDriverA");
   pragma Import (Stdcall, DeletePrinterDriverW, "DeletePrinterDriverW");
   pragma Import (Stdcall, AddPrintProcessorA, "AddPrintProcessorA");
   pragma Import (Stdcall, AddPrintProcessorW, "AddPrintProcessorW");
   pragma Import (Stdcall, EnumPrintProcessorsA, "EnumPrintProcessorsA");
   pragma Import (Stdcall, EnumPrintProcessorsW, "EnumPrintProcessorsW");
   pragma Import
     (Stdcall,
      GetPrintProcessorDirectoryA,
      "GetPrintProcessorDirectoryA");
   pragma Import
     (Stdcall,
      GetPrintProcessorDirectoryW,
      "GetPrintProcessorDirectoryW");
   pragma Import
     (Stdcall,
      EnumPrintProcessorDatatypesA,
      "EnumPrintProcessorDatatypesA");
   pragma Import
     (Stdcall,
      EnumPrintProcessorDatatypesW,
      "EnumPrintProcessorDatatypesW");
   pragma Import (Stdcall, DeletePrintProcessorA, "DeletePrintProcessorA");
   pragma Import (Stdcall, DeletePrintProcessorW, "DeletePrintProcessorW");
   pragma Import (Stdcall, StartDocPrinterA, "StartDocPrinterA");
   pragma Import (Stdcall, StartDocPrinterW, "StartDocPrinterW");
   pragma Import (Stdcall, StartPagePrinter, "StartPagePrinter");
   pragma Import (Stdcall, WritePrinter, "WritePrinter");
   pragma Import (Stdcall, EndPagePrinter, "EndPagePrinter");
   pragma Import (Stdcall, AbortPrinter, "AbortPrinter");
   pragma Import (Stdcall, ReadPrinter, "ReadPrinter");
   pragma Import (Stdcall, EndDocPrinter, "EndDocPrinter");
   pragma Import (Stdcall, AddJobA, "AddJobA");
   pragma Import (Stdcall, AddJobW, "AddJobW");
   pragma Import (Stdcall, ScheduleJob, "ScheduleJob");
   pragma Import (Stdcall, PrinterProperties, "PrinterProperties");
   pragma Import (Stdcall, DocumentPropertiesA, "DocumentPropertiesA");
   pragma Import (Stdcall, DocumentPropertiesW, "DocumentPropertiesW");
   pragma Import
     (Stdcall,
      AdvancedDocumentPropertiesA,
      "AdvancedDocumentPropertiesA");
   pragma Import
     (Stdcall,
      AdvancedDocumentPropertiesW,
      "AdvancedDocumentPropertiesW");
   pragma Import (Stdcall, GetPrinterDataA, "GetPrinterDataA");
   pragma Import (Stdcall, GetPrinterDataW, "GetPrinterDataW");
   pragma Import (Stdcall, SetPrinterDataA, "SetPrinterDataA");
   pragma Import (Stdcall, SetPrinterDataW, "SetPrinterDataW");
   pragma Import (Stdcall, WaitForPrinterChange, "WaitForPrinterChange");
   pragma Import
     (Stdcall,
      FindFirstPrinterChangeNotification,
      "FindFirstPrinterChangeNotification");
   pragma Import
     (Stdcall,
      FindNextPrinterChangeNotification,
      "FindNextPrinterChangeNotification");
   pragma Import
     (Stdcall,
      FindClosePrinterChangeNotification,
      "FindClosePrinterChangeNotification");
   pragma Import (Stdcall, PrinterMessageBoxA, "PrinterMessageBoxA");
   pragma Import (Stdcall, PrinterMessageBoxW, "PrinterMessageBoxW");
   pragma Import (Stdcall, ClosePrinter, "ClosePrinter");
   pragma Import (Stdcall, AddFormA, "AddFormA");
   pragma Import (Stdcall, AddFormW, "AddFormW");
   pragma Import (Stdcall, DeleteFormA, "DeleteFormA");
   pragma Import (Stdcall, DeleteFormW, "DeleteFormW");
   pragma Import (Stdcall, GetFormA, "GetFormA");
   pragma Import (Stdcall, GetFormW, "GetFormW");
   pragma Import (Stdcall, SetFormA, "SetFormA");
   pragma Import (Stdcall, SetFormW, "SetFormW");
   pragma Import (Stdcall, EnumFormsA, "EnumFormsA");
   pragma Import (Stdcall, EnumFormsW, "EnumFormsW");
   pragma Import (Stdcall, EnumMonitorsA, "EnumMonitorsA");
   pragma Import (Stdcall, EnumMonitorsW, "EnumMonitorsW");
   pragma Import (Stdcall, AddMonitorA, "AddMonitorA");
   pragma Import (Stdcall, AddMonitorW, "AddMonitorW");
   pragma Import (Stdcall, DeleteMonitorA, "DeleteMonitorA");
   pragma Import (Stdcall, DeleteMonitorW, "DeleteMonitorW");
   pragma Import (Stdcall, EnumPortsA, "EnumPortsA");
   pragma Import (Stdcall, EnumPortsW, "EnumPortsW");
   pragma Import (Stdcall, AddPortA, "AddPortA");
   pragma Import (Stdcall, AddPortW, "AddPortW");
   pragma Import (Stdcall, ConfigurePortA, "ConfigurePortA");
   pragma Import (Stdcall, ConfigurePortW, "ConfigurePortW");
   pragma Import (Stdcall, DeletePortA, "DeletePortA");
   pragma Import (Stdcall, DeletePortW, "DeletePortW");
   pragma Import (Stdcall, AddPrinterConnectionA, "AddPrinterConnectionA");
   pragma Import (Stdcall, AddPrinterConnectionW, "AddPrinterConnectionW");
   pragma Import
     (Stdcall,
      DeletePrinterConnectionA,
      "DeletePrinterConnectionA");
   pragma Import
     (Stdcall,
      DeletePrinterConnectionW,
      "DeletePrinterConnectionW");
   pragma Import (Stdcall, ConnectToPrinterDlg, "ConnectToPrinterDlg");
   pragma Import (Stdcall, AddPrintProvidorA, "AddPrintProvidorA");
   pragma Import (Stdcall, AddPrintProvidorW, "AddPrintProvidorW");
   pragma Import (Stdcall, DeletePrintProvidorA, "DeletePrintProvidorA");
   pragma Import (Stdcall, DeletePrintProvidorW, "DeletePrintProvidorW");

end Win32.Winspool;
