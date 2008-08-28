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

package Win32.Winsvc is

   use Interfaces;
   use type Interfaces.C.char_array;

   SERVICES_ACTIVE_DATABASEA : constant CHAR_Array :=
     "ServicesActive" & Nul; --  winsvc.h:62
   SERVICES_ACTIVE_DATABASEW : constant WCHAR_Array :=
     To_Win (C.To_C ("ServicesActive")) & Wide_Nul; --  winsvc.h:59
   SERVICES_ACTIVE_DATABASE : CHAR_Array renames
     SERVICES_ACTIVE_DATABASEA;
   --  winsvc.h:82
   SERVICES_FAILED_DATABASEA : constant CHAR_Array :=
     "ServicesFailed" & Nul; --  winsvc.h:63
   SERVICES_FAILED_DATABASEW : constant WCHAR_Array :=
     To_Win (C.To_C ("ServicesFailed")) & Wide_Nul; --  winsvc.h:60
   SERVICES_FAILED_DATABASE : CHAR_Array renames
     SERVICES_FAILED_DATABASEA;
   --  winsvc.h:83
   SC_GROUP_IDENTIFIERA : constant Character := '+';
   --  winsvc.h:71
   SC_GROUP_IDENTIFIERW : constant Wide_Character := '+';
   --  winsvc.h:70
   SC_GROUP_IDENTIFIER : Character renames SC_GROUP_IDENTIFIERA;
   --  winsvc.h:85
   SERVICE_NO_CHANGE : constant := 16#ffffffff#; --  winsvc.h:92
   SERVICE_ACTIVE : constant := 16#1#;       --  winsvc.h:97
   SERVICE_INACTIVE : constant := 16#2#;       --  winsvc.h:98
   SERVICE_STATE_ALL : constant := 16#3#;       --  winsvc.h:99
   SERVICE_CONTROL_STOP : constant := 16#1#;       --  winsvc.h:105
   SERVICE_CONTROL_PAUSE : constant := 16#2#;       --  winsvc.h:106
   SERVICE_CONTROL_CONTINUE : constant := 16#3#;       --  winsvc.h:107
   SERVICE_CONTROL_INTERROGATE : constant := 16#4#;       --  winsvc.h:108
   SERVICE_CONTROL_SHUTDOWN : constant := 16#5#;       --  winsvc.h:109
   SERVICE_STOPPED : constant := 16#1#;       --  winsvc.h:114
   SERVICE_START_PENDING : constant := 16#2#;       --  winsvc.h:115
   SERVICE_STOP_PENDING : constant := 16#3#;       --  winsvc.h:116
   SERVICE_RUNNING : constant := 16#4#;       --  winsvc.h:117
   SERVICE_CONTINUE_PENDING : constant := 16#5#;       --  winsvc.h:118
   SERVICE_PAUSE_PENDING : constant := 16#6#;       --  winsvc.h:119
   SERVICE_PAUSED : constant := 16#7#;       --  winsvc.h:120
   SERVICE_ACCEPT_STOP : constant := 16#1#;       --  winsvc.h:125
   SERVICE_ACCEPT_PAUSE_CONTINUE : constant := 16#2#;       --  winsvc.h:126
   SERVICE_ACCEPT_SHUTDOWN : constant := 16#4#;       --  winsvc.h:127
   SC_MANAGER_CONNECT : constant := 16#1#;       --  winsvc.h:132
   SC_MANAGER_CREATE_SERVICE : constant := 16#2#;       --  winsvc.h:133
   SC_MANAGER_ENUMERATE_SERVICE : constant := 16#4#;       --  winsvc.h:134
   SC_MANAGER_LOCK : constant := 16#8#;       --  winsvc.h:135
   SC_MANAGER_QUERY_LOCK_STATUS : constant := 16#10#;      --  winsvc.h:136
   SC_MANAGER_MODIFY_BOOT_CONFIG : constant := 16#20#;      --  winsvc.h:137
   SC_MANAGER_ALL_ACCESS : constant := 16#f003f#;   --  winsvc.h:139
   SERVICE_QUERY_CONFIG : constant := 16#1#;       --  winsvc.h:152
   SERVICE_CHANGE_CONFIG : constant := 16#2#;       --  winsvc.h:153
   SERVICE_QUERY_STATUS : constant := 16#4#;       --  winsvc.h:154
   SERVICE_ENUMERATE_DEPENDENTS : constant := 16#8#;       --  winsvc.h:155
   SERVICE_START : constant := 16#10#;      --  winsvc.h:156
   SERVICE_STOP : constant := 16#20#;      --  winsvc.h:157
   SERVICE_PAUSE_CONTINUE : constant := 16#40#;      --  winsvc.h:158
   SERVICE_INTERROGATE : constant := 16#80#;      --  winsvc.h:159
   SERVICE_USER_DEFINED_CONTROL : constant := 16#100#;     --  winsvc.h:160
   SERVICE_ALL_ACCESS : constant := 16#f01ff#;   --  winsvc.h:162

   type SERVICE_STATUS_HANDLE is new Win32.DWORD;          --  winsvc.h:181

   subtype SC_HANDLE is Win32.Winnt.HANDLE;               --  winsvc.h:178
   subtype LPSC_HANDLE is Win32.Winnt.PHANDLE;            --  winsvc.h:179
   subtype SC_LOCK is Win32.LPVOID;                       --  winsvc.h:226

   type SERVICE_STATUS;                                    --  winsvc.h:187
   type ENUM_SERVICE_STATUSA;                              --  winsvc.h:203
   type ENUM_SERVICE_STATUSW;                              --  winsvc.h:208
   type QUERY_SERVICE_LOCK_STATUSA;                        --  winsvc.h:228
   type QUERY_SERVICE_LOCK_STATUSW;                        --  winsvc.h:233
   type QUERY_SERVICE_CONFIGA;                             --  winsvc.h:252
   type QUERY_SERVICE_CONFIGW;                             --  winsvc.h:263
   type SERVICE_TABLE_ENTRYA;                              --  winsvc.h:309
   type SERVICE_TABLE_ENTRYW;                              --  winsvc.h:313

   type LPSERVICE_STATUS is access all SERVICE_STATUS;     --  winsvc.h:195
   type LPENUM_SERVICE_STATUSA is access all ENUM_SERVICE_STATUSA;
   --  winsvc.h:207
   subtype LPENUM_SERVICE_STATUS is LPENUM_SERVICE_STATUSA; --  winsvc.h:218
   type LPENUM_SERVICE_STATUSW is access all ENUM_SERVICE_STATUSW;
   --  winsvc.h:212
   type LPQUERY_SERVICE_LOCK_STATUSA is
     access all QUERY_SERVICE_LOCK_STATUSA;           --  winsvc.h:232
   type LPQUERY_SERVICE_LOCK_STATUSW is
     access all QUERY_SERVICE_LOCK_STATUSW;           --  winsvc.h:237
   subtype LPQUERY_SERVICE_LOCK_STATUS is LPQUERY_SERVICE_LOCK_STATUSA;
   --  winsvc.h:243
   type LPQUERY_SERVICE_CONFIGA is access all QUERY_SERVICE_CONFIGA;
   --  winsvc.h:262
   subtype LPQUERY_SERVICE_CONFIG is LPQUERY_SERVICE_CONFIGA;
   --  winsvc.h:279
   type LPQUERY_SERVICE_CONFIGW is access all QUERY_SERVICE_CONFIGW;
   --  winsvc.h:273
   type LPSERVICE_TABLE_ENTRYA is access all SERVICE_TABLE_ENTRYA;
   --  winsvc.h:312
   subtype LPSERVICE_TABLE_ENTRY is LPSERVICE_TABLE_ENTRYA; --  winsvc.h:322
   type LPSERVICE_TABLE_ENTRYW is access all SERVICE_TABLE_ENTRYW;
   --  winsvc.h:316

   type SERVICE_STATUS is                                  --  winsvc.h:187
      record
         dwServiceType : Win32.DWORD;         --  winsvc.h:188
         dwCurrentState : Win32.DWORD;         --  winsvc.h:189
         dwControlsAccepted : Win32.DWORD;         --  winsvc.h:190
         dwWin32ExitCode : Win32.DWORD;         --  winsvc.h:191
         dwServiceSpecificExitCode : Win32.DWORD;         --  winsvc.h:192
         dwCheckPoint : Win32.DWORD;         --  winsvc.h:193
         dwWaitHint : Win32.DWORD;         --  winsvc.h:194
      end record;

   type ENUM_SERVICE_STATUSA is                            --  winsvc.h:203
      record
         lpServiceName : Win32.LPSTR;                     --  winsvc.h:204
         lpDisplayName : Win32.LPSTR;                     --  winsvc.h:205
         ServiceStatus : SERVICE_STATUS;                  --  winsvc.h:206
      end record;

   type ENUM_SERVICE_STATUSW is                            --  winsvc.h:208
      record
         lpServiceName : Win32.LPWSTR;                    --  winsvc.h:209
         lpDisplayName : Win32.LPWSTR;                    --  winsvc.h:210
         ServiceStatus : SERVICE_STATUS;                  --  winsvc.h:211
      end record;

   subtype ENUM_SERVICE_STATUS is ENUM_SERVICE_STATUSA;    --  winsvc.h:217

   type QUERY_SERVICE_LOCK_STATUSA is                      --  winsvc.h:228
      record
         fIsLocked : Win32.DWORD;                    --  winsvc.h:229
         lpLockOwner : Win32.LPSTR;                    --  winsvc.h:230
         dwLockDuration : Win32.DWORD;                    --  winsvc.h:231
      end record;

   type QUERY_SERVICE_LOCK_STATUSW is                      --  winsvc.h:233
      record
         fIsLocked : Win32.DWORD;                    --  winsvc.h:234
         lpLockOwner : Win32.LPWSTR;                   --  winsvc.h:235
         dwLockDuration : Win32.DWORD;                    --  winsvc.h:236
      end record;

   subtype QUERY_SERVICE_LOCK_STATUS is QUERY_SERVICE_LOCK_STATUSA;
   --  winsvc.h:242

   type QUERY_SERVICE_CONFIGA is                           --  winsvc.h:252
      record
         dwServiceType : Win32.DWORD;                --  winsvc.h:253
         dwStartType : Win32.DWORD;                --  winsvc.h:254
         dwErrorControl : Win32.DWORD;                --  winsvc.h:255
         lpBinaryPathName : Win32.LPSTR;                --  winsvc.h:256
         lpLoadOrderGroup : Win32.LPSTR;                --  winsvc.h:257
         dwTagId : Win32.DWORD;                --  winsvc.h:258
         lpDependencies : Win32.LPSTR;                --  winsvc.h:259
         lpServiceStartName : Win32.LPSTR;                --  winsvc.h:260
         lpDisplayName : Win32.LPSTR;                --  winsvc.h:261
      end record;

   type QUERY_SERVICE_CONFIGW is                           --  winsvc.h:263
      record
         dwServiceType : Win32.DWORD;                --  winsvc.h:264
         dwStartType : Win32.DWORD;                --  winsvc.h:265
         dwErrorControl : Win32.DWORD;                --  winsvc.h:266
         lpBinaryPathName : Win32.LPWSTR;               --  winsvc.h:267
         lpLoadOrderGroup : Win32.LPWSTR;               --  winsvc.h:268
         dwTagId : Win32.DWORD;                --  winsvc.h:269
         lpDependencies : Win32.LPWSTR;               --  winsvc.h:270
         lpServiceStartName : Win32.LPWSTR;               --  winsvc.h:271
         lpDisplayName : Win32.LPWSTR;               --  winsvc.h:272
      end record;

   subtype QUERY_SERVICE_CONFIG is QUERY_SERVICE_CONFIGA;  --  winsvc.h:278

   type LPSERVICE_MAIN_FUNCTIONW is access procedure
     (dwNumServicesArgs : Win32.DWORD;
      lpServiceArgVectors : access Win32.PWSTR);           --  winsvc.h:288
   pragma Convention (Stdcall, LPSERVICE_MAIN_FUNCTIONW);
   type LPSERVICE_MAIN_FUNCTIONA is access procedure
     (dwNumServicesArgs : Win32.DWORD;
      lpServiceArgVectors : access Win32.PSTR);            --  winsvc.h:293
   pragma Convention (Stdcall, LPSERVICE_MAIN_FUNCTIONA);
   subtype LPSERVICE_MAIN_FUNCTION is LPSERVICE_MAIN_FUNCTIONA;
   --  winsvc.h:301

   type SERVICE_TABLE_ENTRYA is                            --  winsvc.h:309
      record
         lpServiceName : Win32.LPSTR;                     --  winsvc.h:310
         lpServiceProc : LPSERVICE_MAIN_FUNCTIONA;        --  winsvc.h:311
      end record;

   type SERVICE_TABLE_ENTRYW is                            --  winsvc.h:313
      record
         lpServiceName : Win32.LPWSTR;                    --  winsvc.h:314
         lpServiceProc : LPSERVICE_MAIN_FUNCTIONW;        --  winsvc.h:315
      end record;

   subtype SERVICE_TABLE_ENTRY is SERVICE_TABLE_ENTRYA;    --  winsvc.h:321

   type LPHANDLER_FUNCTION is access procedure (dwControl : Win32.DWORD);
   pragma Convention (Stdcall, LPHANDLER_FUNCTION);
   --  winsvc.h:329

   function ChangeServiceConfigA (hService : SC_HANDLE;
                                  dwServiceType : Win32.DWORD;
                                  dwStartType : Win32.DWORD;
                                  dwErrorControl : Win32.DWORD;
                                  lpBinaryPathName : Win32.LPCSTR;
                                  lpLoadOrderGroup : Win32.LPCSTR;
                                  lpdwTagId : Win32.LPDWORD;
                                  lpDependencies : Win32.LPCSTR;
                                  lpServiceStartName : Win32.LPCSTR;
                                  lpPassword : Win32.LPCSTR;
                                  lpDisplayName : Win32.LPCSTR)
                                 return Win32.BOOL;
   --  winsvc.h:342

   function ChangeServiceConfig
     (hService : SC_HANDLE;
      dwServiceType : Win32.DWORD;
      dwStartType : Win32.DWORD;
      dwErrorControl : Win32.DWORD;
      lpBinaryPathName : Win32.LPCSTR;
      lpLoadOrderGroup : Win32.LPCSTR;
      lpdwTagId : Win32.LPDWORD;
      lpDependencies : Win32.LPCSTR;
      lpServiceStartName : Win32.LPCSTR;
      lpPassword : Win32.LPCSTR;
      lpDisplayName : Win32.LPCSTR)
     return Win32.BOOL
     renames ChangeServiceConfigA;   --  winsvc.h:342

   function ChangeServiceConfigW (hService : SC_HANDLE;
                                  dwServiceType : Win32.DWORD;
                                  dwStartType : Win32.DWORD;
                                  dwErrorControl : Win32.DWORD;
                                  lpBinaryPathName : Win32.LPCWSTR;
                                  lpLoadOrderGroup : Win32.LPCWSTR;
                                  lpdwTagId : Win32.LPDWORD;
                                  lpDependencies : Win32.LPCWSTR;
                                  lpServiceStartName : Win32.LPCWSTR;
                                  lpPassword : Win32.LPCWSTR;
                                  lpDisplayName : Win32.LPCWSTR)
                                 return Win32.BOOL;
   --  winsvc.h:358

   function CloseServiceHandle (hSCObject : SC_HANDLE) return Win32.BOOL;
   --  winsvc.h:380

   function ControlService (hService : SC_HANDLE;
                            dwControl : Win32.DWORD;
                            lpServiceStatus : access SERVICE_STATUS)
                           return Win32.BOOL;
   --  winsvc.h:387

   function CreateServiceA (hSCManager : SC_HANDLE;
                            lpServiceName : Win32.LPCSTR;
                            lpDisplayName : Win32.LPCSTR;
                            dwDesiredAccess : Win32.DWORD;
                            dwServiceType : Win32.DWORD;
                            dwStartType : Win32.DWORD;
                            dwErrorControl : Win32.DWORD;
                            lpBinaryPathName : Win32.LPCSTR;
                            lpLoadOrderGroup : Win32.LPCSTR;
                            lpdwTagId : Win32.LPDWORD;
                            lpDependencies : Win32.LPCSTR;
                            lpServiceStartName : Win32.LPCSTR;
                            lpPassword : Win32.LPCSTR)
                           return SC_HANDLE;
   --  winsvc.h:396

   function CreateService (hSCManager : SC_HANDLE;
                           lpServiceName : Win32.LPCSTR;
                           lpDisplayName : Win32.LPCSTR;
                           dwDesiredAccess : Win32.DWORD;
                           dwServiceType : Win32.DWORD;
                           dwStartType : Win32.DWORD;
                           dwErrorControl : Win32.DWORD;
                           lpBinaryPathName : Win32.LPCSTR;
                           lpLoadOrderGroup : Win32.LPCSTR;
                           lpdwTagId : Win32.LPDWORD;
                           lpDependencies : Win32.LPCSTR;
                           lpServiceStartName : Win32.LPCSTR;
                           lpPassword : Win32.LPCSTR)
                          return SC_HANDLE
     renames CreateServiceA;
   --  winsvc.h:396

   function CreateServiceW (hSCManager : SC_HANDLE;
                            lpServiceName : Win32.LPCWSTR;
                            lpDisplayName : Win32.LPCWSTR;
                            dwDesiredAccess : Win32.DWORD;
                            dwServiceType : Win32.DWORD;
                            dwStartType : Win32.DWORD;
                            dwErrorControl : Win32.DWORD;
                            lpBinaryPathName : Win32.LPCWSTR;
                            lpLoadOrderGroup : Win32.LPCWSTR;
                            lpdwTagId : Win32.LPDWORD;
                            lpDependencies : Win32.LPCWSTR;
                            lpServiceStartName : Win32.LPCWSTR;
                            lpPassword : Win32.LPCWSTR)
                           return SC_HANDLE;
   --  winsvc.h:414

   function DeleteService (hService : SC_HANDLE) return Win32.BOOL;
   --  winsvc.h:438

   function EnumDependentServicesA
     (hService : SC_HANDLE;
      dwServiceState : Win32.DWORD;
      lpServices : access ENUM_SERVICE_STATUSA;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD)
     return Win32.BOOL;                            --  winsvc.h:445

   function EnumDependentServices
     (hService : SC_HANDLE;
      dwServiceState : Win32.DWORD;
      lpServices : access ENUM_SERVICE_STATUSA;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD)
     return Win32.BOOL
     renames EnumDependentServicesA; --  winsvc.h:445

   function EnumDependentServicesW
     (hService : SC_HANDLE;
      dwServiceState : Win32.DWORD;
      lpServices : access ENUM_SERVICE_STATUSW;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD)
     return Win32.BOOL;                            --  winsvc.h:456

   function EnumServicesStatusA
     (hSCManager : SC_HANDLE;
      dwServiceType : Win32.DWORD;
      dwServiceState : Win32.DWORD;
      lpServices : access ENUM_SERVICE_STATUSA;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD;
      lpResumeHandle : Win32.LPDWORD)
     return Win32.BOOL;                            --  winsvc.h:473

   function EnumServicesStatus
     (hSCManager : SC_HANDLE;
      dwServiceType : Win32.DWORD;
      dwServiceState : Win32.DWORD;
      lpServices : access ENUM_SERVICE_STATUSA;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD;
      lpResumeHandle : Win32.LPDWORD)
     return Win32.BOOL
     renames EnumServicesStatusA;    --  winsvc.h:473

   function EnumServicesStatusW
     (hSCManager : SC_HANDLE;
      dwServiceType : Win32.DWORD;
      dwServiceState : Win32.DWORD;
      lpServices : access ENUM_SERVICE_STATUSW;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD;
      lpResumeHandle : Win32.LPDWORD)
     return Win32.BOOL;                            --  winsvc.h:486

   function GetServiceKeyNameA (hSCManager : SC_HANDLE;
                                lpDisplayName : Win32.LPCSTR;
                                lpServiceName : Win32.LPSTR;
                                lpcchBuffer : Win32.LPDWORD)
                               return Win32.BOOL;
   --  winsvc.h:505

   function GetServiceKeyName (hSCManager : SC_HANDLE;
                               lpDisplayName : Win32.LPCSTR;
                               lpServiceName : Win32.LPSTR;
                               lpcchBuffer : Win32.LPDWORD)
                              return Win32.BOOL
     renames GetServiceKeyNameA;
   --  winsvc.h:505

   function GetServiceKeyNameW (hSCManager : SC_HANDLE;
                                lpDisplayName : Win32.LPCWSTR;
                                lpServiceName : Win32.LPWSTR;
                                lpcchBuffer : Win32.LPDWORD)
                               return Win32.BOOL;
   --  winsvc.h:514

   function GetServiceDisplayNameA (hSCManager : SC_HANDLE;
                                    lpServiceName : Win32.LPCSTR;
                                    lpDisplayName : Win32.LPSTR;
                                    lpcchBuffer : Win32.LPDWORD)
                                   return Win32.BOOL;
   --  winsvc.h:529

   function GetServiceDisplayName
     (hSCManager : SC_HANDLE;
      lpServiceName : Win32.LPCSTR;
      lpDisplayName : Win32.LPSTR;
      lpcchBuffer : Win32.LPDWORD)
     return Win32.BOOL
     renames GetServiceDisplayNameA;      --  winsvc.h:529

   function GetServiceDisplayNameW (hSCManager : SC_HANDLE;
                                    lpServiceName : Win32.LPCWSTR;
                                    lpDisplayName : Win32.LPWSTR;
                                    lpcchBuffer : Win32.LPDWORD)
                                   return Win32.BOOL;
   --  winsvc.h:538

   function LockServiceDatabase (hSCManager : SC_HANDLE) return SC_LOCK;
   --  winsvc.h:553

   function NotifyBootConfigStatus (BootAcceptable : Win32.BOOL)
                                   return Win32.BOOL;          --  winsvc.h:560

   function OpenSCManagerA (lpMachineName : Win32.LPCSTR;
                            lpDatabaseName : Win32.LPCSTR;
                            dwDesiredAccess : Win32.DWORD)
                           return SC_HANDLE;
   --  winsvc.h:567

   function OpenSCManager (lpMachineName : Win32.LPCSTR;
                           lpDatabaseName : Win32.LPCSTR;
                           dwDesiredAccess : Win32.DWORD)
                          return SC_HANDLE
     renames OpenSCManagerA;
   --  winsvc.h:567

   function OpenSCManagerW (lpMachineName : Win32.LPCWSTR;
                            lpDatabaseName : Win32.LPCWSTR;
                            dwDesiredAccess : Win32.DWORD)
                           return SC_HANDLE;
   --  winsvc.h:575

   function OpenServiceA (hSCManager : SC_HANDLE;
                          lpServiceName : Win32.LPCSTR;
                          dwDesiredAccess : Win32.DWORD)
                         return SC_HANDLE; --  winsvc.h:589

   function OpenService (hSCManager : SC_HANDLE;
                         lpServiceName : Win32.LPCSTR;
                         dwDesiredAccess : Win32.DWORD)
                        return SC_HANDLE
     renames OpenServiceA;
   --  winsvc.h:589

   function OpenServiceW (hSCManager : SC_HANDLE;
                          lpServiceName : Win32.LPCWSTR;
                          dwDesiredAccess : Win32.DWORD)
                         return SC_HANDLE; --  winsvc.h:597

   function QueryServiceConfigA (hService : SC_HANDLE;
                                 lpServiceConfig :
                                   access QUERY_SERVICE_CONFIGA;
                                 cbBufSize : Win32.DWORD;
                                 pcbBytesNeeded : Win32.LPDWORD)
                                return Win32.BOOL;
   --  winsvc.h:611

   function QueryServiceConfig (hService : SC_HANDLE;
                                lpServiceConfig : access QUERY_SERVICE_CONFIGA;
                                cbBufSize : Win32.DWORD;
                                pcbBytesNeeded : Win32.LPDWORD)
                               return Win32.BOOL
     renames QueryServiceConfigA;
   --  winsvc.h:611

   function QueryServiceConfigW (hService : SC_HANDLE;
                                 lpServiceConfig :
                                   access QUERY_SERVICE_CONFIGW;
                                 cbBufSize : Win32.DWORD;
                                 pcbBytesNeeded : Win32.LPDWORD)
                                return Win32.BOOL;
   --  winsvc.h:620

   function QueryServiceLockStatusA
     (hSCManager : SC_HANDLE;
      lpLockStatus : access QUERY_SERVICE_LOCK_STATUSA;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD)
     return Win32.BOOL;                  --  winsvc.h:635

   function QueryServiceLockStatus
     (hSCManager : SC_HANDLE;
      lpLockStatus : access QUERY_SERVICE_LOCK_STATUSA;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD)
     return Win32.BOOL
     renames QueryServiceLockStatusA;    --  winsvc.h:635

   function QueryServiceLockStatusW
     (hSCManager : SC_HANDLE;
      lpLockStatus : access QUERY_SERVICE_LOCK_STATUSW;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD)
     return Win32.BOOL;                  --  winsvc.h:644

   function QueryServiceObjectSecurity
     (hService : SC_HANDLE;
      dwSecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      lpSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbBufSize : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD)
     return Win32.BOOL;           --  winsvc.h:659

   function QueryServiceStatus (hService : SC_HANDLE;
                                lpServiceStatus : access SERVICE_STATUS)
                               return Win32.BOOL;
   --  winsvc.h:670

   function RegisterServiceCtrlHandlerA
     (lpServiceName : Win32.LPCSTR;
      lpHandlerProc : LPHANDLER_FUNCTION)
     return SERVICE_STATUS_HANDLE;        --  winsvc.h:678

   function RegisterServiceCtrlHandler
     (lpServiceName : Win32.LPCSTR;
      lpHandlerProc : LPHANDLER_FUNCTION)
     return SERVICE_STATUS_HANDLE
     renames RegisterServiceCtrlHandlerA; --  winsvc.h:678

   function RegisterServiceCtrlHandlerW
     (lpServiceName : Win32.LPCWSTR;
      lpHandlerProc : LPHANDLER_FUNCTION)
     return SERVICE_STATUS_HANDLE;        --  winsvc.h:685

   function SetServiceObjectSecurity
     (hService : SC_HANDLE;
      dwSecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      lpSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL;           --  winsvc.h:698

   function SetServiceStatus (hServiceStatus : SERVICE_STATUS_HANDLE;
                              lpServiceStatus : access SERVICE_STATUS)
                             return Win32.BOOL;
   --  winsvc.h:707

   function StartServiceCtrlDispatcherA
     (lpServiceStartTable : access SERVICE_TABLE_ENTRYA) return Win32.BOOL;
   --  winsvc.h:715

   function StartServiceCtrlDispatcher
     (lpServiceStartTable : access SERVICE_TABLE_ENTRYA) return Win32.BOOL
     renames StartServiceCtrlDispatcherA;         --  winsvc.h:715

   function StartServiceCtrlDispatcherW
     (lpServiceStartTable : access SERVICE_TABLE_ENTRYW) return Win32.BOOL;
   --  winsvc.h:721

   function StartServiceA (hService : SC_HANDLE;
                           dwNumServiceArgs : Win32.DWORD;
                           lpServiceArgVectors : access Win32.LPCSTR)
                          return Win32.BOOL;
   --  winsvc.h:734

   function StartService (hService : SC_HANDLE;
                          dwNumServiceArgs : Win32.DWORD;
                          lpServiceArgVectors : access Win32.LPCSTR)
                         return Win32.BOOL
     renames StartServiceA;
   --  winsvc.h:734

   function StartServiceW (hService : SC_HANDLE;
                           dwNumServiceArgs : Win32.DWORD;
                           lpServiceArgVectors : access Win32.LPCWSTR)
                          return Win32.BOOL;
   --  winsvc.h:742

   function UnlockServiceDatabase (ScLock : SC_LOCK) return Win32.BOOL;
   --  winsvc.h:756

private

   pragma Convention (C, SERVICE_STATUS);                   --  winsvc.h:187
   pragma Convention (C, ENUM_SERVICE_STATUSA);             --  winsvc.h:203
   pragma Convention (C, ENUM_SERVICE_STATUSW);             --  winsvc.h:208
   pragma Convention (C_Pass_By_Copy, QUERY_SERVICE_LOCK_STATUSA);
   --  winsvc.h:228
   pragma Convention (C_Pass_By_Copy, QUERY_SERVICE_LOCK_STATUSW);
   --  winsvc.h:233
   pragma Convention (C, QUERY_SERVICE_CONFIGA);            --  winsvc.h:252
   pragma Convention (C, QUERY_SERVICE_CONFIGW);            --  winsvc.h:263
   pragma Convention (C_Pass_By_Copy, SERVICE_TABLE_ENTRYA);   --  winsvc.h:309
   pragma Convention (C_Pass_By_Copy, SERVICE_TABLE_ENTRYW);   --  winsvc.h:313

   pragma Import (Stdcall, ChangeServiceConfigA, "ChangeServiceConfigA");
   --  winsvc.h:342
   pragma Import (Stdcall, ChangeServiceConfigW, "ChangeServiceConfigW");
   --  winsvc.h:358
   pragma Import (Stdcall, CloseServiceHandle, "CloseServiceHandle");
   --  winsvc.h:380
   pragma Import (Stdcall, ControlService, "ControlService");  --  winsvc.h:387
   pragma Import (Stdcall, CreateServiceA, "CreateServiceA");  --  winsvc.h:396
   pragma Import (Stdcall, CreateServiceW, "CreateServiceW");  --  winsvc.h:414
   pragma Import (Stdcall, DeleteService, "DeleteService");    --  winsvc.h:438
   pragma Import (Stdcall, EnumDependentServicesA, "EnumDependentServicesA");
   --  winsvc.h:445
   pragma Import (Stdcall, EnumDependentServicesW, "EnumDependentServicesW");
   --  winsvc.h:456
   pragma Import (Stdcall, EnumServicesStatusA, "EnumServicesStatusA");
   --  winsvc.h:473
   pragma Import (Stdcall, EnumServicesStatusW, "EnumServicesStatusW");
   --  winsvc.h:486
   pragma Import (Stdcall, GetServiceKeyNameA, "GetServiceKeyNameA");
   --  winsvc.h:505
   pragma Import (Stdcall, GetServiceKeyNameW, "GetServiceKeyNameW");
   --  winsvc.h:514
   pragma Import (Stdcall, GetServiceDisplayNameA, "GetServiceDisplayNameA");
   --  winsvc.h:529
   pragma Import (Stdcall, GetServiceDisplayNameW, "GetServiceDisplayNameW");
   --  winsvc.h:538
   pragma Import (Stdcall, LockServiceDatabase, "LockServiceDatabase");
   --  winsvc.h:553
   pragma Import (Stdcall, NotifyBootConfigStatus, "NotifyBootConfigStatus");
   --  winsvc.h:560
   pragma Import (Stdcall, OpenSCManagerA, "OpenSCManagerA");  --  winsvc.h:567
   pragma Import (Stdcall, OpenSCManagerW, "OpenSCManagerW");  --  winsvc.h:575
   pragma Import (Stdcall, OpenServiceA, "OpenServiceA");      --  winsvc.h:589
   pragma Import (Stdcall, OpenServiceW, "OpenServiceW");      --  winsvc.h:597
   pragma Import (Stdcall, QueryServiceConfigA, "QueryServiceConfigA");
   --  winsvc.h:611
   pragma Import (Stdcall, QueryServiceConfigW, "QueryServiceConfigW");
   --  winsvc.h:620
   pragma Import (Stdcall, QueryServiceLockStatusA, "QueryServiceLockStatusA");
   --  winsvc.h:635
   pragma Import (Stdcall, QueryServiceLockStatusW, "QueryServiceLockStatusW");
   --  winsvc.h:644
   pragma Import (Stdcall, QueryServiceObjectSecurity,
                    "QueryServiceObjectSecurity");
   --  winsvc.h:659
   pragma Import (Stdcall, QueryServiceStatus, "QueryServiceStatus");
   --  winsvc.h:670
   pragma Import (Stdcall, RegisterServiceCtrlHandlerA,
                    "RegisterServiceCtrlHandlerA");        --  winsvc.h:678
   pragma Import (Stdcall, RegisterServiceCtrlHandlerW,
                    "RegisterServiceCtrlHandlerW");        --  winsvc.h:685
   pragma Import (Stdcall, SetServiceObjectSecurity,
                    "SetServiceObjectSecurity");
   --  winsvc.h:698
   pragma Import (Stdcall, SetServiceStatus, "SetServiceStatus");
   --  winsvc.h:707
   pragma Import (Stdcall, StartServiceCtrlDispatcherA,
                    "StartServiceCtrlDispatcherA");        --  winsvc.h:715
   pragma Import (Stdcall, StartServiceCtrlDispatcherW,
                    "StartServiceCtrlDispatcherW");        --  winsvc.h:721
   pragma Import (Stdcall, StartServiceA, "StartServiceA");    --  winsvc.h:734
   pragma Import (Stdcall, StartServiceW, "StartServiceW");    --  winsvc.h:742
   pragma Import (Stdcall, UnlockServiceDatabase, "UnlockServiceDatabase");
   --  winsvc.h:756

end Win32.Winsvc;
