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

package Win32.Winsvc is

   use Interfaces;
   use type Interfaces.C.char_array;

   SERVICES_ACTIVE_DATABASEA     : constant CHAR_Array     :=
      "ServicesActive" & Nul;
   SERVICES_ACTIVE_DATABASEW     : constant WCHAR_Array    :=
      To_Win (C.To_C ("ServicesActive")) & Wide_Nul;
   SERVICES_ACTIVE_DATABASE      : CHAR_Array renames
     SERVICES_ACTIVE_DATABASEA;
   SERVICES_FAILED_DATABASEA     : constant CHAR_Array     :=
      "ServicesFailed" & Nul;
   SERVICES_FAILED_DATABASEW     : constant WCHAR_Array    :=
      To_Win (C.To_C ("ServicesFailed")) & Wide_Nul;
   SERVICES_FAILED_DATABASE      : CHAR_Array renames
     SERVICES_FAILED_DATABASEA;
   SC_GROUP_IDENTIFIERA          : constant Character      := '+';
   SC_GROUP_IDENTIFIERW          : constant Wide_Character := '+';
   SC_GROUP_IDENTIFIER           : Character renames SC_GROUP_IDENTIFIERA;
   SERVICE_NO_CHANGE             : constant := 16#ffffffff#;
   SERVICE_ACTIVE                : constant := 16#1#;
   SERVICE_INACTIVE              : constant := 16#2#;
   SERVICE_STATE_ALL             : constant := 16#3#;
   SERVICE_CONTROL_STOP          : constant := 16#1#;
   SERVICE_CONTROL_PAUSE         : constant := 16#2#;
   SERVICE_CONTROL_CONTINUE      : constant := 16#3#;
   SERVICE_CONTROL_INTERROGATE   : constant := 16#4#;
   SERVICE_CONTROL_SHUTDOWN      : constant := 16#5#;
   SERVICE_STOPPED               : constant := 16#1#;
   SERVICE_START_PENDING         : constant := 16#2#;
   SERVICE_STOP_PENDING          : constant := 16#3#;
   SERVICE_RUNNING               : constant := 16#4#;
   SERVICE_CONTINUE_PENDING      : constant := 16#5#;
   SERVICE_PAUSE_PENDING         : constant := 16#6#;
   SERVICE_PAUSED                : constant := 16#7#;
   SERVICE_ACCEPT_STOP           : constant := 16#1#;
   SERVICE_ACCEPT_PAUSE_CONTINUE : constant := 16#2#;
   SERVICE_ACCEPT_SHUTDOWN       : constant := 16#4#;
   SC_MANAGER_CONNECT            : constant := 16#1#;
   SC_MANAGER_CREATE_SERVICE     : constant := 16#2#;
   SC_MANAGER_ENUMERATE_SERVICE  : constant := 16#4#;
   SC_MANAGER_LOCK               : constant := 16#8#;
   SC_MANAGER_QUERY_LOCK_STATUS  : constant := 16#10#;
   SC_MANAGER_MODIFY_BOOT_CONFIG : constant := 16#20#;
   SC_MANAGER_ALL_ACCESS         : constant := 16#f003f#;
   SERVICE_QUERY_CONFIG          : constant := 16#1#;
   SERVICE_CHANGE_CONFIG         : constant := 16#2#;
   SERVICE_QUERY_STATUS          : constant := 16#4#;
   SERVICE_ENUMERATE_DEPENDENTS  : constant := 16#8#;
   SERVICE_START                 : constant := 16#10#;
   SERVICE_STOP                  : constant := 16#20#;
   SERVICE_PAUSE_CONTINUE        : constant := 16#40#;
   SERVICE_INTERROGATE           : constant := 16#80#;
   SERVICE_USER_DEFINED_CONTROL  : constant := 16#100#;
   SERVICE_ALL_ACCESS            : constant := 16#f01ff#;

   type SERVICE_STATUS_HANDLE is new Win32.DWORD;

   subtype SC_HANDLE is Win32.Winnt.HANDLE;
   subtype LPSC_HANDLE is Win32.Winnt.PHANDLE;
   subtype SC_LOCK is Win32.LPVOID;

   type SERVICE_STATUS;
   type ENUM_SERVICE_STATUSA;
   type ENUM_SERVICE_STATUSW;
   type QUERY_SERVICE_LOCK_STATUSA;
   type QUERY_SERVICE_LOCK_STATUSW;
   type QUERY_SERVICE_CONFIGA;
   type QUERY_SERVICE_CONFIGW;
   type SERVICE_TABLE_ENTRYA;
   type SERVICE_TABLE_ENTRYW;

   type LPSERVICE_STATUS is access all SERVICE_STATUS;
   type LPENUM_SERVICE_STATUSA is access all ENUM_SERVICE_STATUSA;
   subtype LPENUM_SERVICE_STATUS is LPENUM_SERVICE_STATUSA;
   type LPENUM_SERVICE_STATUSW is access all ENUM_SERVICE_STATUSW;
   type LPQUERY_SERVICE_LOCK_STATUSA is access all QUERY_SERVICE_LOCK_STATUSA;
   type LPQUERY_SERVICE_LOCK_STATUSW is access all QUERY_SERVICE_LOCK_STATUSW;
   subtype LPQUERY_SERVICE_LOCK_STATUS is LPQUERY_SERVICE_LOCK_STATUSA;
   type LPQUERY_SERVICE_CONFIGA is access all QUERY_SERVICE_CONFIGA;
   subtype LPQUERY_SERVICE_CONFIG is LPQUERY_SERVICE_CONFIGA;
   type LPQUERY_SERVICE_CONFIGW is access all QUERY_SERVICE_CONFIGW;
   type LPSERVICE_TABLE_ENTRYA is access all SERVICE_TABLE_ENTRYA;
   subtype LPSERVICE_TABLE_ENTRY is LPSERVICE_TABLE_ENTRYA;
   type LPSERVICE_TABLE_ENTRYW is access all SERVICE_TABLE_ENTRYW;

   type SERVICE_STATUS is record
      dwServiceType             : Win32.DWORD;
      dwCurrentState            : Win32.DWORD;
      dwControlsAccepted        : Win32.DWORD;
      dwWin32ExitCode           : Win32.DWORD;
      dwServiceSpecificExitCode : Win32.DWORD;
      dwCheckPoint              : Win32.DWORD;
      dwWaitHint                : Win32.DWORD;
   end record;

   type ENUM_SERVICE_STATUSA is record
      lpServiceName : Win32.LPSTR;
      lpDisplayName : Win32.LPSTR;
      ServiceStatus : SERVICE_STATUS;
   end record;

   type ENUM_SERVICE_STATUSW is record
      lpServiceName : Win32.LPWSTR;
      lpDisplayName : Win32.LPWSTR;
      ServiceStatus : SERVICE_STATUS;
   end record;

   subtype ENUM_SERVICE_STATUS is ENUM_SERVICE_STATUSA;

   type QUERY_SERVICE_LOCK_STATUSA is record
      fIsLocked      : Win32.DWORD;
      lpLockOwner    : Win32.LPSTR;
      dwLockDuration : Win32.DWORD;
   end record;

   type QUERY_SERVICE_LOCK_STATUSW is record
      fIsLocked      : Win32.DWORD;
      lpLockOwner    : Win32.LPWSTR;
      dwLockDuration : Win32.DWORD;
   end record;

   subtype QUERY_SERVICE_LOCK_STATUS is QUERY_SERVICE_LOCK_STATUSA;

   type QUERY_SERVICE_CONFIGA is record
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPSTR;
      lpLoadOrderGroup   : Win32.LPSTR;
      dwTagId            : Win32.DWORD;
      lpDependencies     : Win32.LPSTR;
      lpServiceStartName : Win32.LPSTR;
      lpDisplayName      : Win32.LPSTR;
   end record;

   type QUERY_SERVICE_CONFIGW is record
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPWSTR;
      lpLoadOrderGroup   : Win32.LPWSTR;
      dwTagId            : Win32.DWORD;
      lpDependencies     : Win32.LPWSTR;
      lpServiceStartName : Win32.LPWSTR;
      lpDisplayName      : Win32.LPWSTR;
   end record;

   subtype QUERY_SERVICE_CONFIG is QUERY_SERVICE_CONFIGA;

   type LPSERVICE_MAIN_FUNCTIONW is access procedure
     (dwNumServicesArgs   : Win32.DWORD;
      lpServiceArgVectors : access Win32.PWSTR);
   pragma Convention (Stdcall, LPSERVICE_MAIN_FUNCTIONW);
   type LPSERVICE_MAIN_FUNCTIONA is access procedure
     (dwNumServicesArgs   : Win32.DWORD;
      lpServiceArgVectors : access Win32.PSTR);
   pragma Convention (Stdcall, LPSERVICE_MAIN_FUNCTIONA);
   subtype LPSERVICE_MAIN_FUNCTION is LPSERVICE_MAIN_FUNCTIONA;

   type SERVICE_TABLE_ENTRYA is record
      lpServiceName : Win32.LPSTR;
      lpServiceProc : LPSERVICE_MAIN_FUNCTIONA;
   end record;

   type SERVICE_TABLE_ENTRYW is record
      lpServiceName : Win32.LPWSTR;
      lpServiceProc : LPSERVICE_MAIN_FUNCTIONW;
   end record;

   subtype SERVICE_TABLE_ENTRY is SERVICE_TABLE_ENTRYA;

   type LPHANDLER_FUNCTION is access procedure (dwControl : Win32.DWORD);
   pragma Convention (Stdcall, LPHANDLER_FUNCTION);

   function ChangeServiceConfigA
     (hService           : SC_HANDLE;
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPCSTR;
      lpLoadOrderGroup   : Win32.LPCSTR;
      lpdwTagId          : Win32.LPDWORD;
      lpDependencies     : Win32.LPCSTR;
      lpServiceStartName : Win32.LPCSTR;
      lpPassword         : Win32.LPCSTR;
      lpDisplayName      : Win32.LPCSTR)
      return Win32.BOOL;

   function ChangeServiceConfig
     (hService           : SC_HANDLE;
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPCSTR;
      lpLoadOrderGroup   : Win32.LPCSTR;
      lpdwTagId          : Win32.LPDWORD;
      lpDependencies     : Win32.LPCSTR;
      lpServiceStartName : Win32.LPCSTR;
      lpPassword         : Win32.LPCSTR;
      lpDisplayName      : Win32.LPCSTR)
      return Win32.BOOL renames ChangeServiceConfigA;

   function ChangeServiceConfigW
     (hService           : SC_HANDLE;
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPCWSTR;
      lpLoadOrderGroup   : Win32.LPCWSTR;
      lpdwTagId          : Win32.LPDWORD;
      lpDependencies     : Win32.LPCWSTR;
      lpServiceStartName : Win32.LPCWSTR;
      lpPassword         : Win32.LPCWSTR;
      lpDisplayName      : Win32.LPCWSTR)
      return Win32.BOOL;

   function CloseServiceHandle (hSCObject : SC_HANDLE) return Win32.BOOL;

   function ControlService
     (hService        : SC_HANDLE;
      dwControl       : Win32.DWORD;
      lpServiceStatus : access SERVICE_STATUS)
      return Win32.BOOL;

   function CreateServiceA
     (hSCManager         : SC_HANDLE;
      lpServiceName      : Win32.LPCSTR;
      lpDisplayName      : Win32.LPCSTR;
      dwDesiredAccess    : Win32.DWORD;
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPCSTR;
      lpLoadOrderGroup   : Win32.LPCSTR;
      lpdwTagId          : Win32.LPDWORD;
      lpDependencies     : Win32.LPCSTR;
      lpServiceStartName : Win32.LPCSTR;
      lpPassword         : Win32.LPCSTR)
      return SC_HANDLE;

   function CreateService
     (hSCManager         : SC_HANDLE;
      lpServiceName      : Win32.LPCSTR;
      lpDisplayName      : Win32.LPCSTR;
      dwDesiredAccess    : Win32.DWORD;
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPCSTR;
      lpLoadOrderGroup   : Win32.LPCSTR;
      lpdwTagId          : Win32.LPDWORD;
      lpDependencies     : Win32.LPCSTR;
      lpServiceStartName : Win32.LPCSTR;
      lpPassword         : Win32.LPCSTR)
      return SC_HANDLE renames CreateServiceA;

   function CreateServiceW
     (hSCManager         : SC_HANDLE;
      lpServiceName      : Win32.LPCWSTR;
      lpDisplayName      : Win32.LPCWSTR;
      dwDesiredAccess    : Win32.DWORD;
      dwServiceType      : Win32.DWORD;
      dwStartType        : Win32.DWORD;
      dwErrorControl     : Win32.DWORD;
      lpBinaryPathName   : Win32.LPCWSTR;
      lpLoadOrderGroup   : Win32.LPCWSTR;
      lpdwTagId          : Win32.LPDWORD;
      lpDependencies     : Win32.LPCWSTR;
      lpServiceStartName : Win32.LPCWSTR;
      lpPassword         : Win32.LPCWSTR)
      return SC_HANDLE;

   function DeleteService (hService : SC_HANDLE) return Win32.BOOL;

   function EnumDependentServicesA
     (hService           : SC_HANDLE;
      dwServiceState     : Win32.DWORD;
      lpServices         : access ENUM_SERVICE_STATUSA;
      cbBufSize          : Win32.DWORD;
      pcbBytesNeeded     : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumDependentServices
     (hService           : SC_HANDLE;
      dwServiceState     : Win32.DWORD;
      lpServices         : access ENUM_SERVICE_STATUSA;
      cbBufSize          : Win32.DWORD;
      pcbBytesNeeded     : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD)
      return Win32.BOOL renames EnumDependentServicesA;

   function EnumDependentServicesW
     (hService           : SC_HANDLE;
      dwServiceState     : Win32.DWORD;
      lpServices         : access ENUM_SERVICE_STATUSW;
      cbBufSize          : Win32.DWORD;
      pcbBytesNeeded     : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumServicesStatusA
     (hSCManager         : SC_HANDLE;
      dwServiceType      : Win32.DWORD;
      dwServiceState     : Win32.DWORD;
      lpServices         : access ENUM_SERVICE_STATUSA;
      cbBufSize          : Win32.DWORD;
      pcbBytesNeeded     : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD;
      lpResumeHandle     : Win32.LPDWORD)
      return Win32.BOOL;

   function EnumServicesStatus
     (hSCManager         : SC_HANDLE;
      dwServiceType      : Win32.DWORD;
      dwServiceState     : Win32.DWORD;
      lpServices         : access ENUM_SERVICE_STATUSA;
      cbBufSize          : Win32.DWORD;
      pcbBytesNeeded     : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD;
      lpResumeHandle     : Win32.LPDWORD)
      return Win32.BOOL renames EnumServicesStatusA;

   function EnumServicesStatusW
     (hSCManager         : SC_HANDLE;
      dwServiceType      : Win32.DWORD;
      dwServiceState     : Win32.DWORD;
      lpServices         : access ENUM_SERVICE_STATUSW;
      cbBufSize          : Win32.DWORD;
      pcbBytesNeeded     : Win32.LPDWORD;
      lpServicesReturned : Win32.LPDWORD;
      lpResumeHandle     : Win32.LPDWORD)
      return Win32.BOOL;

   function GetServiceKeyNameA
     (hSCManager    : SC_HANDLE;
      lpDisplayName : Win32.LPCSTR;
      lpServiceName : Win32.LPSTR;
      lpcchBuffer   : Win32.LPDWORD)
      return Win32.BOOL;

   function GetServiceKeyName
     (hSCManager    : SC_HANDLE;
      lpDisplayName : Win32.LPCSTR;
      lpServiceName : Win32.LPSTR;
      lpcchBuffer   : Win32.LPDWORD)
      return Win32.BOOL renames GetServiceKeyNameA;

   function GetServiceKeyNameW
     (hSCManager    : SC_HANDLE;
      lpDisplayName : Win32.LPCWSTR;
      lpServiceName : Win32.LPWSTR;
      lpcchBuffer   : Win32.LPDWORD)
      return Win32.BOOL;

   function GetServiceDisplayNameA
     (hSCManager    : SC_HANDLE;
      lpServiceName : Win32.LPCSTR;
      lpDisplayName : Win32.LPSTR;
      lpcchBuffer   : Win32.LPDWORD)
      return Win32.BOOL;

   function GetServiceDisplayName
     (hSCManager    : SC_HANDLE;
      lpServiceName : Win32.LPCSTR;
      lpDisplayName : Win32.LPSTR;
      lpcchBuffer   : Win32.LPDWORD)
      return Win32.BOOL renames GetServiceDisplayNameA;

   function GetServiceDisplayNameW
     (hSCManager    : SC_HANDLE;
      lpServiceName : Win32.LPCWSTR;
      lpDisplayName : Win32.LPWSTR;
      lpcchBuffer   : Win32.LPDWORD)
      return Win32.BOOL;

   function LockServiceDatabase (hSCManager : SC_HANDLE) return SC_LOCK;

   function NotifyBootConfigStatus
     (BootAcceptable : Win32.BOOL)
      return Win32.BOOL;

   function OpenSCManagerA
     (lpMachineName   : Win32.LPCSTR;
      lpDatabaseName  : Win32.LPCSTR;
      dwDesiredAccess : Win32.DWORD)
      return SC_HANDLE;

   function OpenSCManager
     (lpMachineName   : Win32.LPCSTR;
      lpDatabaseName  : Win32.LPCSTR;
      dwDesiredAccess : Win32.DWORD)
      return SC_HANDLE renames OpenSCManagerA;

   function OpenSCManagerW
     (lpMachineName   : Win32.LPCWSTR;
      lpDatabaseName  : Win32.LPCWSTR;
      dwDesiredAccess : Win32.DWORD)
      return SC_HANDLE;

   function OpenServiceA
     (hSCManager      : SC_HANDLE;
      lpServiceName   : Win32.LPCSTR;
      dwDesiredAccess : Win32.DWORD)
      return SC_HANDLE;

   function OpenService
     (hSCManager      : SC_HANDLE;
      lpServiceName   : Win32.LPCSTR;
      dwDesiredAccess : Win32.DWORD)
      return SC_HANDLE renames OpenServiceA;

   function OpenServiceW
     (hSCManager      : SC_HANDLE;
      lpServiceName   : Win32.LPCWSTR;
      dwDesiredAccess : Win32.DWORD)
      return SC_HANDLE;

   function QueryServiceConfigA
     (hService        : SC_HANDLE;
      lpServiceConfig : access QUERY_SERVICE_CONFIGA;
      cbBufSize       : Win32.DWORD;
      pcbBytesNeeded  : Win32.LPDWORD)
      return Win32.BOOL;

   function QueryServiceConfig
     (hService        : SC_HANDLE;
      lpServiceConfig : access QUERY_SERVICE_CONFIGA;
      cbBufSize       : Win32.DWORD;
      pcbBytesNeeded  : Win32.LPDWORD)
      return Win32.BOOL renames QueryServiceConfigA;

   function QueryServiceConfigW
     (hService        : SC_HANDLE;
      lpServiceConfig : access QUERY_SERVICE_CONFIGW;
      cbBufSize       : Win32.DWORD;
      pcbBytesNeeded  : Win32.LPDWORD)
      return Win32.BOOL;

   function QueryServiceLockStatusA
     (hSCManager     : SC_HANDLE;
      lpLockStatus   : access QUERY_SERVICE_LOCK_STATUSA;
      cbBufSize      : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function QueryServiceLockStatus
     (hSCManager     : SC_HANDLE;
      lpLockStatus   : access QUERY_SERVICE_LOCK_STATUSA;
      cbBufSize      : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD)
      return Win32.BOOL renames QueryServiceLockStatusA;

   function QueryServiceLockStatusW
     (hSCManager     : SC_HANDLE;
      lpLockStatus   : access QUERY_SERVICE_LOCK_STATUSW;
      cbBufSize      : Win32.DWORD;
      pcbBytesNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   function QueryServiceObjectSecurity
     (hService              : SC_HANDLE;
      dwSecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      lpSecurityDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbBufSize             : Win32.DWORD;
      pcbBytesNeeded        : Win32.LPDWORD)
      return Win32.BOOL;

   function QueryServiceStatus
     (hService        : SC_HANDLE;
      lpServiceStatus : access SERVICE_STATUS)
      return Win32.BOOL;

   function RegisterServiceCtrlHandlerA
     (lpServiceName : Win32.LPCSTR;
      lpHandlerProc : LPHANDLER_FUNCTION)
      return SERVICE_STATUS_HANDLE;

   function RegisterServiceCtrlHandler
     (lpServiceName : Win32.LPCSTR;
      lpHandlerProc : LPHANDLER_FUNCTION)
      return SERVICE_STATUS_HANDLE renames
     RegisterServiceCtrlHandlerA;

   function RegisterServiceCtrlHandlerW
     (lpServiceName : Win32.LPCWSTR;
      lpHandlerProc : LPHANDLER_FUNCTION)
      return SERVICE_STATUS_HANDLE;

   function SetServiceObjectSecurity
     (hService              : SC_HANDLE;
      dwSecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      lpSecurityDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL;

   function SetServiceStatus
     (hServiceStatus  : SERVICE_STATUS_HANDLE;
      lpServiceStatus : access SERVICE_STATUS)
      return Win32.BOOL;

   function StartServiceCtrlDispatcherA
     (lpServiceStartTable : access SERVICE_TABLE_ENTRYA)
      return Win32.BOOL;

   function StartServiceCtrlDispatcher
     (lpServiceStartTable : access SERVICE_TABLE_ENTRYA)
      return Win32.BOOL renames StartServiceCtrlDispatcherA;

   function StartServiceCtrlDispatcherW
     (lpServiceStartTable : access SERVICE_TABLE_ENTRYW)
      return Win32.BOOL;

   function StartServiceA
     (hService            : SC_HANDLE;
      dwNumServiceArgs    : Win32.DWORD;
      lpServiceArgVectors : access Win32.LPCSTR)
      return Win32.BOOL;

   function StartService
     (hService            : SC_HANDLE;
      dwNumServiceArgs    : Win32.DWORD;
      lpServiceArgVectors : access Win32.LPCSTR)
      return Win32.BOOL renames StartServiceA;

   function StartServiceW
     (hService            : SC_HANDLE;
      dwNumServiceArgs    : Win32.DWORD;
      lpServiceArgVectors : access Win32.LPCWSTR)
      return Win32.BOOL;

   function UnlockServiceDatabase (ScLock : SC_LOCK) return Win32.BOOL;

private

   pragma Convention (C, SERVICE_STATUS);
   pragma Convention (C, ENUM_SERVICE_STATUSA);
   pragma Convention (C, ENUM_SERVICE_STATUSW);
   pragma Convention (C_Pass_By_Copy, QUERY_SERVICE_LOCK_STATUSA);
   pragma Convention (C_Pass_By_Copy, QUERY_SERVICE_LOCK_STATUSW);
   pragma Convention (C, QUERY_SERVICE_CONFIGA);
   pragma Convention (C, QUERY_SERVICE_CONFIGW);
   pragma Convention (C_Pass_By_Copy, SERVICE_TABLE_ENTRYA);
   pragma Convention (C_Pass_By_Copy, SERVICE_TABLE_ENTRYW);

   pragma Import (Stdcall, ChangeServiceConfigA, "ChangeServiceConfigA");
   pragma Import (Stdcall, ChangeServiceConfigW, "ChangeServiceConfigW");
   pragma Import (Stdcall, CloseServiceHandle, "CloseServiceHandle");
   pragma Import (Stdcall, ControlService, "ControlService");
   pragma Import (Stdcall, CreateServiceA, "CreateServiceA");
   pragma Import (Stdcall, CreateServiceW, "CreateServiceW");
   pragma Import (Stdcall, DeleteService, "DeleteService");
   pragma Import (Stdcall, EnumDependentServicesA, "EnumDependentServicesA");
   pragma Import (Stdcall, EnumDependentServicesW, "EnumDependentServicesW");
   pragma Import (Stdcall, EnumServicesStatusA, "EnumServicesStatusA");
   pragma Import (Stdcall, EnumServicesStatusW, "EnumServicesStatusW");
   pragma Import (Stdcall, GetServiceKeyNameA, "GetServiceKeyNameA");
   pragma Import (Stdcall, GetServiceKeyNameW, "GetServiceKeyNameW");
   pragma Import (Stdcall, GetServiceDisplayNameA, "GetServiceDisplayNameA");
   pragma Import (Stdcall, GetServiceDisplayNameW, "GetServiceDisplayNameW");
   pragma Import (Stdcall, LockServiceDatabase, "LockServiceDatabase");
   pragma Import (Stdcall, NotifyBootConfigStatus, "NotifyBootConfigStatus");
   pragma Import (Stdcall, OpenSCManagerA, "OpenSCManagerA");
   pragma Import (Stdcall, OpenSCManagerW, "OpenSCManagerW");
   pragma Import (Stdcall, OpenServiceA, "OpenServiceA");
   pragma Import (Stdcall, OpenServiceW, "OpenServiceW");
   pragma Import (Stdcall, QueryServiceConfigA, "QueryServiceConfigA");
   pragma Import (Stdcall, QueryServiceConfigW, "QueryServiceConfigW");
   pragma Import
     (Stdcall,
      QueryServiceLockStatusA,
      "QueryServiceLockStatusA");
   pragma Import
     (Stdcall,
      QueryServiceLockStatusW,
      "QueryServiceLockStatusW");
   pragma Import
     (Stdcall,
      QueryServiceObjectSecurity,
      "QueryServiceObjectSecurity");
   pragma Import (Stdcall, QueryServiceStatus, "QueryServiceStatus");
   pragma Import
     (Stdcall,
      RegisterServiceCtrlHandlerA,
      "RegisterServiceCtrlHandlerA");
   pragma Import
     (Stdcall,
      RegisterServiceCtrlHandlerW,
      "RegisterServiceCtrlHandlerW");
   pragma Import
     (Stdcall,
      SetServiceObjectSecurity,
      "SetServiceObjectSecurity");
   pragma Import (Stdcall, SetServiceStatus, "SetServiceStatus");
   pragma Import
     (Stdcall,
      StartServiceCtrlDispatcherA,
      "StartServiceCtrlDispatcherA");
   pragma Import
     (Stdcall,
      StartServiceCtrlDispatcherW,
      "StartServiceCtrlDispatcherW");
   pragma Import (Stdcall, StartServiceA, "StartServiceA");
   pragma Import (Stdcall, StartServiceW, "StartServiceW");
   pragma Import (Stdcall, UnlockServiceDatabase, "UnlockServiceDatabase");

end Win32.Winsvc;
