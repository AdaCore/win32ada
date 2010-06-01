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

with Ada.Unchecked_Conversion;
with Win32.Winbase;
with Win32.Winnt;

package Win32.Winreg is

   subtype HKEY is Win32.Winnt.HANDLE;

   HKEY_CLASSES_ROOT        : constant HKEY;
   HKEY_CURRENT_CONFIG      : constant HKEY;
   HKEY_CURRENT_USER        : constant HKEY;
   HKEY_LOCAL_MACHINE       : constant HKEY;
   HKEY_USERS               : constant HKEY;
   HKEY_PERFORMANCE_DATA    : constant HKEY;
   HKEY_PERFORMANCE_TEXT    : constant HKEY;
   HKEY_PERFORMANCE_NLSTEXT : constant HKEY;
   WIN31_CLASS              : constant Win32.LPSTR := null;

   type REGSAM is new Win32.Winnt.ACCESS_MASK;

   type PHKEY is access all HKEY;

   function RegCloseKey (hKey : Win32.Winreg.HKEY) return Win32.LONG;

   function RegConnectRegistryA
     (lpMachineName : Win32.LPSTR;
      hKey          : Win32.Winreg.HKEY;
      phkResult     : PHKEY)
      return Win32.LONG;

   function RegConnectRegistry
     (lpMachineName : Win32.LPSTR;
      hKey          : Win32.Winreg.HKEY;
      phkResult     : PHKEY)
      return Win32.LONG renames RegConnectRegistryA;

   function RegConnectRegistryW
     (lpMachineName : Win32.LPWSTR;
      hKey          : Win32.Winreg.HKEY;
      phkResult     : PHKEY)
      return Win32.LONG;

   function RegCreateKeyA
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      phkResult : PHKEY)
      return Win32.LONG;

   function RegCreateKey
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      phkResult : PHKEY)
      return Win32.LONG renames RegCreateKeyA;

   function RegCreateKeyW
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCWSTR;
      phkResult : PHKEY)
      return Win32.LONG;

   function RegCreateKeyExA
     (hKey                 : Win32.Winreg.HKEY;
      lpSubKey             : Win32.LPCSTR;
      Reserved             : Win32.DWORD;
      lpClass              : Win32.LPSTR;
      dwOptions            : Win32.DWORD;
      samDesired           : REGSAM;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES;
      phkResult            : PHKEY;
      lpdwDisposition      : Win32.LPDWORD)
      return Win32.LONG;

   function RegCreateKeyEx
     (hKey                 : Win32.Winreg.HKEY;
      lpSubKey             : Win32.LPCSTR;
      Reserved             : Win32.DWORD;
      lpClass              : Win32.LPSTR;
      dwOptions            : Win32.DWORD;
      samDesired           : REGSAM;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES;
      phkResult            : PHKEY;
      lpdwDisposition      : Win32.LPDWORD)
      return Win32.LONG renames RegCreateKeyExA;

   function RegCreateKeyExW
     (hKey                 : Win32.Winreg.HKEY;
      lpSubKey             : Win32.LPCWSTR;
      Reserved             : Win32.DWORD;
      lpClass              : Win32.LPWSTR;
      dwOptions            : Win32.DWORD;
      samDesired           : REGSAM;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES;
      phkResult            : PHKEY;
      lpdwDisposition      : Win32.LPDWORD)
      return Win32.LONG;

   function RegDeleteKeyA
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR)
      return Win32.LONG;

   function RegDeleteKey
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR)
      return Win32.LONG renames RegDeleteKeyA;

   function RegDeleteKeyW
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCWSTR)
      return Win32.LONG;

   function RegDeleteValueA
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPSTR)
      return Win32.LONG;

   function RegDeleteValue
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPSTR)
      return Win32.LONG renames RegDeleteValueA;

   function RegDeleteValueW
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPWSTR)
      return Win32.LONG;

   function RegEnumKeyA
     (hKey    : Win32.Winreg.HKEY;
      dwIndex : Win32.DWORD;
      lpName  : Win32.LPSTR;
      cbName  : Win32.DWORD)
      return Win32.LONG;

   function RegEnumKey
     (hKey    : Win32.Winreg.HKEY;
      dwIndex : Win32.DWORD;
      lpName  : Win32.LPSTR;
      cbName  : Win32.DWORD)
      return Win32.LONG renames RegEnumKeyA;

   function RegEnumKeyW
     (hKey    : Win32.Winreg.HKEY;
      dwIndex : Win32.DWORD;
      lpName  : Win32.LPWSTR;
      cbName  : Win32.DWORD)
      return Win32.LONG;

   function RegEnumKeyExA
     (hKey              : Win32.Winreg.HKEY;
      dwIndex           : Win32.DWORD;
      lpName            : Win32.LPSTR;
      lpcbName          : Win32.LPDWORD;
      lpReserved        : Win32.LPDWORD;
      lpClass           : Win32.LPSTR;
      lpcbClass         : Win32.LPDWORD;
      lpftLastWriteTime : Win32.Winbase.PFILETIME)
      return Win32.LONG;

   function RegEnumKeyEx
     (hKey              : Win32.Winreg.HKEY;
      dwIndex           : Win32.DWORD;
      lpName            : Win32.LPSTR;
      lpcbName          : Win32.LPDWORD;
      lpReserved        : Win32.LPDWORD;
      lpClass           : Win32.LPSTR;
      lpcbClass         : Win32.LPDWORD;
      lpftLastWriteTime : Win32.Winbase.PFILETIME)
      return Win32.LONG renames RegEnumKeyExA;

   function RegEnumKeyExW
     (hKey              : Win32.Winreg.HKEY;
      dwIndex           : Win32.DWORD;
      lpName            : Win32.LPWSTR;
      lpcbName          : Win32.LPDWORD;
      lpReserved        : Win32.LPDWORD;
      lpClass           : Win32.LPWSTR;
      lpcbClass         : Win32.LPDWORD;
      lpftLastWriteTime : Win32.Winbase.PFILETIME)
      return Win32.LONG;

   function RegEnumValueA
     (hKey          : Win32.Winreg.HKEY;
      dwIndex       : Win32.DWORD;
      lpValueName   : Win32.LPSTR;
      lpcbValueName : Win32.LPDWORD;
      lpReserved    : Win32.LPDWORD;
      lpType        : Win32.LPDWORD;
      lpData        : Win32.LPBYTE;
      lpcbData      : Win32.LPDWORD)
      return Win32.LONG;

   function RegEnumValue
     (hKey          : Win32.Winreg.HKEY;
      dwIndex       : Win32.DWORD;
      lpValueName   : Win32.LPSTR;
      lpcbValueName : Win32.LPDWORD;
      lpReserved    : Win32.LPDWORD;
      lpType        : Win32.LPDWORD;
      lpData        : Win32.LPBYTE;
      lpcbData      : Win32.LPDWORD)
      return Win32.LONG renames RegEnumValueA;

   function RegEnumValueW
     (hKey          : Win32.Winreg.HKEY;
      dwIndex       : Win32.DWORD;
      lpValueName   : Win32.LPWSTR;
      lpcbValueName : Win32.LPDWORD;
      lpReserved    : Win32.LPDWORD;
      lpType        : Win32.LPDWORD;
      lpData        : Win32.LPBYTE;
      lpcbData      : Win32.LPDWORD)
      return Win32.LONG;

   function RegFlushKey (hKey : Win32.Winreg.HKEY) return Win32.LONG;

   function RegGetKeySecurity
     (hKey                   : Win32.Winreg.HKEY;
      SecurityInformation    : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor    : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpcbSecurityDescriptor : Win32.LPDWORD)
      return Win32.LONG;

   function RegLoadKeyA
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR;
      lpFile   : Win32.LPCSTR)
      return Win32.LONG;

   function RegLoadKey
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR;
      lpFile   : Win32.LPCSTR)
      return Win32.LONG renames RegLoadKeyA;

   function RegLoadKeyW
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCWSTR;
      lpFile   : Win32.LPCWSTR)
      return Win32.LONG;

   function RegNotifyChangeKeyValue
     (hKey           : Win32.Winreg.HKEY;
      bWatchSubtree  : Win32.BOOL;
      dwNotifyFilter : Win32.DWORD;
      hEvent         : Win32.Winnt.HANDLE;
      fAsynchronus   : Win32.BOOL)
      return Win32.LONG;

   function RegOpenKeyA
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      phkResult : PHKEY)
      return Win32.LONG;

   function RegOpenKey
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      phkResult : PHKEY)
      return Win32.LONG renames RegOpenKeyA;

   function RegOpenKeyW
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCWSTR;
      phkResult : PHKEY)
      return Win32.LONG;

   function RegOpenKeyExA
     (hKey       : Win32.Winreg.HKEY;
      lpSubKey   : Win32.LPCSTR;
      ulOptions  : Win32.DWORD;
      samDesired : REGSAM;
      phkResult  : PHKEY)
      return Win32.LONG;

   function RegOpenKeyEx
     (hKey       : Win32.Winreg.HKEY;
      lpSubKey   : Win32.LPCSTR;
      ulOptions  : Win32.DWORD;
      samDesired : REGSAM;
      phkResult  : PHKEY)
      return Win32.LONG renames RegOpenKeyExA;

   function RegOpenKeyExW
     (hKey       : Win32.Winreg.HKEY;
      lpSubKey   : Win32.LPCWSTR;
      ulOptions  : Win32.DWORD;
      samDesired : REGSAM;
      phkResult  : PHKEY)
      return Win32.LONG;

   function RegQueryInfoKeyA
     (hKey                   : Win32.Winreg.HKEY;
      lpClass                : Win32.LPSTR;
      lpcbClass              : Win32.LPDWORD;
      lpReserved             : Win32.LPDWORD;
      lpcSubKeys             : Win32.LPDWORD;
      lpcbMaxSubKeyLen       : Win32.LPDWORD;
      lpcbMaxClassLen        : Win32.LPDWORD;
      lpcValues              : Win32.LPDWORD;
      lpcbMaxValueNameLen    : Win32.LPDWORD;
      lpcbMaxValueLen        : Win32.LPDWORD;
      lpcbSecurityDescriptor : Win32.LPDWORD;
      lpftLastWriteTime      : Win32.Winbase.PFILETIME)
      return Win32.LONG;

   function RegQueryInfoKey
     (hKey                   : Win32.Winreg.HKEY;
      lpClass                : Win32.LPSTR;
      lpcbClass              : Win32.LPDWORD;
      lpReserved             : Win32.LPDWORD;
      lpcSubKeys             : Win32.LPDWORD;
      lpcbMaxSubKeyLen       : Win32.LPDWORD;
      lpcbMaxClassLen        : Win32.LPDWORD;
      lpcValues              : Win32.LPDWORD;
      lpcbMaxValueNameLen    : Win32.LPDWORD;
      lpcbMaxValueLen        : Win32.LPDWORD;
      lpcbSecurityDescriptor : Win32.LPDWORD;
      lpftLastWriteTime      : Win32.Winbase.PFILETIME)
      return Win32.LONG renames RegQueryInfoKeyA;

   function RegQueryInfoKeyW
     (hKey                   : Win32.Winreg.HKEY;
      lpClass                : Win32.LPWSTR;
      lpcbClass              : Win32.LPDWORD;
      lpReserved             : Win32.LPDWORD;
      lpcSubKeys             : Win32.LPDWORD;
      lpcbMaxSubKeyLen       : Win32.LPDWORD;
      lpcbMaxClassLen        : Win32.LPDWORD;
      lpcValues              : Win32.LPDWORD;
      lpcbMaxValueNameLen    : Win32.LPDWORD;
      lpcbMaxValueLen        : Win32.LPDWORD;
      lpcbSecurityDescriptor : Win32.LPDWORD;
      lpftLastWriteTime      : Win32.Winbase.PFILETIME)
      return Win32.LONG;

   function RegQueryValueA
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      lpValue   : Win32.LPSTR;
      lpcbValue : Win32.PLONG)
      return Win32.LONG;

   function RegQueryValue
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      lpValue   : Win32.LPSTR;
      lpcbValue : Win32.PLONG)
      return Win32.LONG renames RegQueryValueA;

   function RegQueryValueW
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCWSTR;
      lpValue   : Win32.LPWSTR;
      lpcbValue : Win32.PLONG)
      return Win32.LONG;

   function RegQueryValueExA
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPSTR;
      lpReserved  : Win32.LPDWORD;
      lpType      : Win32.LPDWORD;
      lpData      : Win32.LPBYTE;
      lpcbData    : Win32.LPDWORD)
      return Win32.LONG;

   function RegQueryValueEx
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPSTR;
      lpReserved  : Win32.LPDWORD;
      lpType      : Win32.LPDWORD;
      lpData      : Win32.LPBYTE;
      lpcbData    : Win32.LPDWORD)
      return Win32.LONG renames RegQueryValueExA;

   function RegQueryValueExW
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPWSTR;
      lpReserved  : Win32.LPDWORD;
      lpType      : Win32.LPDWORD;
      lpData      : Win32.LPBYTE;
      lpcbData    : Win32.LPDWORD)
      return Win32.LONG;

   function RegReplaceKeyA
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      lpNewFile : Win32.LPCSTR;
      lpOldFile : Win32.LPCSTR)
      return Win32.LONG;

   function RegReplaceKey
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCSTR;
      lpNewFile : Win32.LPCSTR;
      lpOldFile : Win32.LPCSTR)
      return Win32.LONG renames RegReplaceKeyA;

   function RegReplaceKeyW
     (hKey      : Win32.Winreg.HKEY;
      lpSubKey  : Win32.LPCWSTR;
      lpNewFile : Win32.LPCWSTR;
      lpOldFile : Win32.LPCWSTR)
      return Win32.LONG;

   function RegRestoreKeyA
     (hKey    : Win32.Winreg.HKEY;
      lpFile  : Win32.LPCSTR;
      dwFlags : Win32.DWORD)
      return Win32.LONG;

   function RegRestoreKey
     (hKey    : Win32.Winreg.HKEY;
      lpFile  : Win32.LPCSTR;
      dwFlags : Win32.DWORD)
      return Win32.LONG renames RegRestoreKeyA;

   function RegRestoreKeyW
     (hKey    : Win32.Winreg.HKEY;
      lpFile  : Win32.LPCWSTR;
      dwFlags : Win32.DWORD)
      return Win32.LONG;

   function RegSaveKeyA
     (hKey                 : Win32.Winreg.HKEY;
      lpFile               : Win32.LPCSTR;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES)
      return Win32.LONG;

   function RegSaveKey
     (hKey                 : Win32.Winreg.HKEY;
      lpFile               : Win32.LPCSTR;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES)
      return Win32.LONG renames RegSaveKeyA;

   function RegSaveKeyW
     (hKey                 : Win32.Winreg.HKEY;
      lpFile               : Win32.LPCWSTR;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES)
      return Win32.LONG;

   function RegSetKeySecurity
     (hKey                : Win32.Winreg.HKEY;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.LONG;

   function RegSetValueA
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR;
      dwType   : Win32.DWORD;
      lpData   : Win32.LPCSTR;
      cbData   : Win32.DWORD)
      return Win32.LONG;

   function RegSetValue
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR;
      dwType   : Win32.DWORD;
      lpData   : Win32.LPCSTR;
      cbData   : Win32.DWORD)
      return Win32.LONG renames RegSetValueA;

   function RegSetValueW
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCWSTR;
      dwType   : Win32.DWORD;
      lpData   : Win32.LPCWSTR;
      cbData   : Win32.DWORD)
      return Win32.LONG;

   function RegSetValueExA
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPCSTR;
      Reserved    : Win32.DWORD;
      dwType      : Win32.DWORD;
      lpData      : Win32.PCBYTE;
      cbData      : Win32.DWORD)
      return Win32.LONG;

   function RegSetValueEx
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPCSTR;
      Reserved    : Win32.DWORD;
      dwType      : Win32.DWORD;
      lpData      : Win32.PCBYTE;
      cbData      : Win32.DWORD)
      return Win32.LONG renames RegSetValueExA;

   function RegSetValueExW
     (hKey        : Win32.Winreg.HKEY;
      lpValueName : Win32.LPCWSTR;
      Reserved    : Win32.DWORD;
      dwType      : Win32.DWORD;
      lpData      : Win32.PCBYTE;
      cbData      : Win32.DWORD)
      return Win32.LONG;

   function RegUnLoadKeyA
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR)
      return Win32.LONG;

   function RegUnLoadKey
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR)
      return Win32.LONG renames RegUnLoadKeyA;

   function RegUnLoadKeyW
     (hKey     : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCWSTR)
      return Win32.LONG;

   function InitiateSystemShutdownA
     (lpMachineName        : Win32.LPSTR;
      lpMessage            : Win32.LPSTR;
      dwTimeout            : Win32.DWORD;
      bForceAppsClosed     : Win32.BOOL;
      bRebootAfterShutdown : Win32.BOOL)
      return Win32.BOOL;

   function InitiateSystemShutdown
     (lpMachineName        : Win32.LPSTR;
      lpMessage            : Win32.LPSTR;
      dwTimeout            : Win32.DWORD;
      bForceAppsClosed     : Win32.BOOL;
      bRebootAfterShutdown : Win32.BOOL)
      return Win32.BOOL renames InitiateSystemShutdownA;

   function InitiateSystemShutdownW
     (lpMachineName        : Win32.LPWSTR;
      lpMessage            : Win32.LPWSTR;
      dwTimeout            : Win32.DWORD;
      bForceAppsClosed     : Win32.BOOL;
      bRebootAfterShutdown : Win32.BOOL)
      return Win32.BOOL;

   function AbortSystemShutdownA
     (lpMachineName : Win32.LPSTR)
      return Win32.BOOL;

   function AbortSystemShutdown
     (lpMachineName : Win32.LPSTR)
      return Win32.BOOL renames AbortSystemShutdownA;

   function AbortSystemShutdownW
     (lpMachineName : Win32.LPWSTR)
      return Win32.BOOL;

private

   function To_Hkey is new Ada.Unchecked_Conversion (ULONG_PTR, HKEY);

   HKEY_CLASSES_ROOT        : constant HKEY := To_Hkey (16#80000000#);
   HKEY_CURRENT_CONFIG      : constant HKEY := To_Hkey (16#80000005#);
   HKEY_CURRENT_USER        : constant HKEY := To_Hkey (16#80000001#);
   HKEY_LOCAL_MACHINE       : constant HKEY := To_Hkey (16#80000002#);
   HKEY_USERS               : constant HKEY := To_Hkey (16#80000003#);
   HKEY_PERFORMANCE_DATA    : constant HKEY := To_Hkey (16#80000004#);
   HKEY_PERFORMANCE_TEXT    : constant HKEY := To_Hkey (16#80000050#);
   HKEY_PERFORMANCE_NLSTEXT : constant HKEY := To_Hkey (16#80000060#);

   pragma Import (Stdcall, RegCloseKey, "RegCloseKey");
   pragma Import (Stdcall, RegConnectRegistryA, "RegConnectRegistryA");
   pragma Import (Stdcall, RegConnectRegistryW, "RegConnectRegistryW");
   pragma Import (Stdcall, RegCreateKeyA, "RegCreateKeyA");
   pragma Import (Stdcall, RegCreateKeyW, "RegCreateKeyW");
   pragma Import (Stdcall, RegCreateKeyExA, "RegCreateKeyExA");
   pragma Import (Stdcall, RegCreateKeyExW, "RegCreateKeyExW");
   pragma Import (Stdcall, RegDeleteKeyA, "RegDeleteKeyA");
   pragma Import (Stdcall, RegDeleteKeyW, "RegDeleteKeyW");
   pragma Import (Stdcall, RegDeleteValueA, "RegDeleteValueA");
   pragma Import (Stdcall, RegDeleteValueW, "RegDeleteValueW");
   pragma Import (Stdcall, RegEnumKeyA, "RegEnumKeyA");
   pragma Import (Stdcall, RegEnumKeyW, "RegEnumKeyW");
   pragma Import (Stdcall, RegEnumKeyExA, "RegEnumKeyExA");
   pragma Import (Stdcall, RegEnumKeyExW, "RegEnumKeyExW");
   pragma Import (Stdcall, RegEnumValueA, "RegEnumValueA");
   pragma Import (Stdcall, RegEnumValueW, "RegEnumValueW");
   pragma Import (Stdcall, RegFlushKey, "RegFlushKey");
   pragma Import (Stdcall, RegGetKeySecurity, "RegGetKeySecurity");
   pragma Import (Stdcall, RegLoadKeyA, "RegLoadKeyA");
   pragma Import (Stdcall, RegLoadKeyW, "RegLoadKeyW");
   pragma Import
     (Stdcall,
      RegNotifyChangeKeyValue,
      "RegNotifyChangeKeyValue");
   pragma Import (Stdcall, RegOpenKeyA, "RegOpenKeyA");
   pragma Import (Stdcall, RegOpenKeyW, "RegOpenKeyW");
   pragma Import (Stdcall, RegOpenKeyExA, "RegOpenKeyExA");
   pragma Import (Stdcall, RegOpenKeyExW, "RegOpenKeyExW");
   pragma Import (Stdcall, RegQueryInfoKeyA, "RegQueryInfoKeyA");
   pragma Import (Stdcall, RegQueryInfoKeyW, "RegQueryInfoKeyW");
   pragma Import (Stdcall, RegQueryValueA, "RegQueryValueA");
   pragma Import (Stdcall, RegQueryValueW, "RegQueryValueW");
   pragma Import (Stdcall, RegQueryValueExA, "RegQueryValueExA");
   pragma Import (Stdcall, RegQueryValueExW, "RegQueryValueExW");
   pragma Import (Stdcall, RegReplaceKeyA, "RegReplaceKeyA");
   pragma Import (Stdcall, RegReplaceKeyW, "RegReplaceKeyW");
   pragma Import (Stdcall, RegRestoreKeyA, "RegRestoreKeyA");
   pragma Import (Stdcall, RegRestoreKeyW, "RegRestoreKeyW");
   pragma Import (Stdcall, RegSaveKeyA, "RegSaveKeyA");
   pragma Import (Stdcall, RegSaveKeyW, "RegSaveKeyW");
   pragma Import (Stdcall, RegSetKeySecurity, "RegSetKeySecurity");
   pragma Import (Stdcall, RegSetValueA, "RegSetValueA");
   pragma Import (Stdcall, RegSetValueW, "RegSetValueW");
   pragma Import (Stdcall, RegSetValueExA, "RegSetValueExA");
   pragma Import (Stdcall, RegSetValueExW, "RegSetValueExW");
   pragma Import (Stdcall, RegUnLoadKeyA, "RegUnLoadKeyA");
   pragma Import (Stdcall, RegUnLoadKeyW, "RegUnLoadKeyW");
   pragma Import
     (Stdcall,
      InitiateSystemShutdownA,
      "InitiateSystemShutdownA");
   pragma Import
     (Stdcall,
      InitiateSystemShutdownW,
      "InitiateSystemShutdownW");
   pragma Import (Stdcall, AbortSystemShutdownA, "AbortSystemShutdownA");
   pragma Import (Stdcall, AbortSystemShutdownW, "AbortSystemShutdownW");

end Win32.Winreg;
