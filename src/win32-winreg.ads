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

with Ada.Unchecked_Conversion;
with Win32.Winbase;
with Win32.Winnt;

package Win32.Winreg is

   subtype HKEY is Win32.Winnt.HANDLE;                    --  winreg.h:37

   HKEY_CLASSES_ROOT        : constant  HKEY;              --  winreg.h:44
   HKEY_CURRENT_CONFIG      : constant  HKEY;              --  winreg.h
   HKEY_CURRENT_USER        : constant  HKEY;              --  winreg.h:45
   HKEY_LOCAL_MACHINE       : constant  HKEY;              --  winreg.h:46
   HKEY_USERS               : constant  HKEY;              --  winreg.h:47
   HKEY_PERFORMANCE_DATA    : constant  HKEY;              --  winreg.h:48
   HKEY_PERFORMANCE_TEXT    : constant  HKEY;              --  winreg.h:49
   HKEY_PERFORMANCE_NLSTEXT : constant  HKEY;              --  winreg.h:50
   WIN31_CLASS : constant  Win32.LPSTR := null;
   --  winreg.h:57

   type REGSAM is new Win32.Winnt.ACCESS_MASK;             --  winreg.h:31

   type PHKEY is access all HKEY;                          --  winreg.h:38

   function RegCloseKey (hKey : Win32.Winreg.HKEY) return Win32.LONG;
   --  winreg.h:67

   function RegConnectRegistryA (lpMachineName : Win32.LPSTR;
                                 hKey : Win32.Winreg.HKEY;
                                 phkResult : PHKEY)
                                return Win32.LONG;
   --  winreg.h:74

   function RegConnectRegistry (lpMachineName : Win32.LPSTR;
                                hKey : Win32.Winreg.HKEY;
                                phkResult : PHKEY)
                               return Win32.LONG
     renames RegConnectRegistryA;
   --  winreg.h:74

   function RegConnectRegistryW (lpMachineName : Win32.LPWSTR;
                                 hKey : Win32.Winreg.HKEY;
                                 phkResult : PHKEY)
                                return Win32.LONG;
   --  winreg.h:82

   function RegCreateKeyA (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCSTR;
                           phkResult : PHKEY)
                          return Win32.LONG;    --  winreg.h:96

   function RegCreateKey (hKey : Win32.Winreg.HKEY;
                          lpSubKey : Win32.LPCSTR;
                          phkResult : PHKEY)
                         return Win32.LONG
     renames RegCreateKeyA; --  winreg.h:96

   function RegCreateKeyW (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCWSTR;
                           phkResult : PHKEY)
                          return Win32.LONG;    --  winreg.h:104

   function RegCreateKeyExA
     (hKey : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR;
      Reserved : Win32.DWORD;
      lpClass : Win32.LPSTR;
      dwOptions : Win32.DWORD;
      samDesired : REGSAM;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES;
      phkResult : PHKEY;
      lpdwDisposition : Win32.LPDWORD)
     return Win32.LONG;            --  winreg.h:118

   function RegCreateKeyEx
     (hKey : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCSTR;
      Reserved : Win32.DWORD;
      lpClass : Win32.LPSTR;
      dwOptions : Win32.DWORD;
      samDesired : REGSAM;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES;
      phkResult : PHKEY;
      lpdwDisposition : Win32.LPDWORD)
     return Win32.LONG
     renames RegCreateKeyExA;      --  winreg.h:118

   function RegCreateKeyExW
     (hKey : Win32.Winreg.HKEY;
      lpSubKey : Win32.LPCWSTR;
      Reserved : Win32.DWORD;
      lpClass : Win32.LPWSTR;
      dwOptions : Win32.DWORD;
      samDesired : REGSAM;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES;
      phkResult : PHKEY;
      lpdwDisposition : Win32.LPDWORD)
     return Win32.LONG;            --  winreg.h:132

   function RegDeleteKeyA (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCSTR)
                          return Win32.LONG;     --  winreg.h:152

   function RegDeleteKey (hKey : Win32.Winreg.HKEY;
                          lpSubKey : Win32.LPCSTR)
                         return Win32.LONG
     renames RegDeleteKeyA;  --  winreg.h:152

   function RegDeleteKeyW (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCWSTR)
                          return Win32.LONG;     --  winreg.h:159

   function RegDeleteValueA (hKey : Win32.Winreg.HKEY;
                             lpValueName : Win32.LPSTR)
                            return Win32.LONG; --  winreg.h:172

   function RegDeleteValue (hKey : Win32.Winreg.HKEY;
                            lpValueName : Win32.LPSTR)
                           return Win32.LONG
     renames RegDeleteValueA;
   --  winreg.h:172

   function RegDeleteValueW (hKey : Win32.Winreg.HKEY;
                             lpValueName : Win32.LPWSTR)
                            return Win32.LONG; --  winreg.h:179

   function RegEnumKeyA (hKey : Win32.Winreg.HKEY;
                         dwIndex : Win32.DWORD;
                         lpName : Win32.LPSTR;
                         cbName : Win32.DWORD)
                        return Win32.LONG;        --  winreg.h:192

   function RegEnumKey (hKey : Win32.Winreg.HKEY;
                        dwIndex : Win32.DWORD;
                        lpName : Win32.LPSTR;
                        cbName : Win32.DWORD)
                       return Win32.LONG
     renames RegEnumKeyA;       --  winreg.h:192

   function RegEnumKeyW (hKey : Win32.Winreg.HKEY;
                         dwIndex : Win32.DWORD;
                         lpName : Win32.LPWSTR;
                         cbName : Win32.DWORD)
                        return Win32.LONG;        --  winreg.h:201

   function RegEnumKeyExA (hKey : Win32.Winreg.HKEY;
                           dwIndex : Win32.DWORD;
                           lpName : Win32.LPSTR;
                           lpcbName : Win32.LPDWORD;
                           lpReserved : Win32.LPDWORD;
                           lpClass : Win32.LPSTR;
                           lpcbClass : Win32.LPDWORD;
                           lpftLastWriteTime : Win32.Winbase.PFILETIME)
                          return Win32.LONG;
   --  winreg.h:216

   function RegEnumKeyEx (hKey : Win32.Winreg.HKEY;
                          dwIndex : Win32.DWORD;
                          lpName : Win32.LPSTR;
                          lpcbName : Win32.LPDWORD;
                          lpReserved : Win32.LPDWORD;
                          lpClass : Win32.LPSTR;
                          lpcbClass : Win32.LPDWORD;
                          lpftLastWriteTime : Win32.Winbase.PFILETIME)
                         return Win32.LONG
     renames RegEnumKeyExA;
   --  winreg.h:216

   function RegEnumKeyExW (hKey : Win32.Winreg.HKEY;
                           dwIndex : Win32.DWORD;
                           lpName : Win32.LPWSTR;
                           lpcbName : Win32.LPDWORD;
                           lpReserved : Win32.LPDWORD;
                           lpClass : Win32.LPWSTR;
                           lpcbClass : Win32.LPDWORD;
                           lpftLastWriteTime : Win32.Winbase.PFILETIME)
                          return Win32.LONG;
   --  winreg.h:229

   function RegEnumValueA (hKey : Win32.Winreg.HKEY;
                           dwIndex : Win32.DWORD;
                           lpValueName : Win32.LPSTR;
                           lpcbValueName : Win32.LPDWORD;
                           lpReserved : Win32.LPDWORD;
                           lpType : Win32.LPDWORD;
                           lpData : Win32.LPBYTE;
                           lpcbData : Win32.LPDWORD)
                          return Win32.LONG; --  winreg.h:248

   function RegEnumValue (hKey : Win32.Winreg.HKEY;
                          dwIndex : Win32.DWORD;
                          lpValueName : Win32.LPSTR;
                          lpcbValueName : Win32.LPDWORD;
                          lpReserved : Win32.LPDWORD;
                          lpType : Win32.LPDWORD;
                          lpData : Win32.LPBYTE;
                          lpcbData : Win32.LPDWORD)
                         return Win32.LONG
     renames RegEnumValueA;
   --  winreg.h:248

   function RegEnumValueW (hKey : Win32.Winreg.HKEY;
                           dwIndex : Win32.DWORD;
                           lpValueName : Win32.LPWSTR;
                           lpcbValueName : Win32.LPDWORD;
                           lpReserved : Win32.LPDWORD;
                           lpType : Win32.LPDWORD;
                           lpData : Win32.LPBYTE;
                           lpcbData : Win32.LPDWORD)
                          return Win32.LONG; --  winreg.h:261

   function RegFlushKey (hKey : Win32.Winreg.HKEY) return Win32.LONG;
   --  winreg.h:280

   function RegGetKeySecurity
     (hKey : Win32.Winreg.HKEY;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpcbSecurityDescriptor : Win32.LPDWORD)
     return Win32.LONG;          --  winreg.h:287

   function RegLoadKeyA (hKey : Win32.Winreg.HKEY;
                         lpSubKey : Win32.LPCSTR;
                         lpFile : Win32.LPCSTR)
                        return Win32.LONG;       --  winreg.h:297

   function RegLoadKey (hKey : Win32.Winreg.HKEY;
                        lpSubKey : Win32.LPCSTR;
                        lpFile : Win32.LPCSTR)
                       return Win32.LONG
     renames RegLoadKeyA;      --  winreg.h:297

   function RegLoadKeyW (hKey : Win32.Winreg.HKEY;
                         lpSubKey : Win32.LPCWSTR;
                         lpFile : Win32.LPCWSTR)
                        return Win32.LONG;       --  winreg.h:305

   function RegNotifyChangeKeyValue (hKey : Win32.Winreg.HKEY;
                                     bWatchSubtree : Win32.BOOL;
                                     dwNotifyFilter : Win32.DWORD;
                                     hEvent : Win32.Winnt.HANDLE;
                                     fAsynchronus : Win32.BOOL)
                                    return Win32.LONG;
   --  winreg.h:319

   function RegOpenKeyA (hKey : Win32.Winreg.HKEY;
                         lpSubKey : Win32.LPCSTR;
                         phkResult : PHKEY)
                        return Win32.LONG;      --  winreg.h:330

   function RegOpenKey (hKey : Win32.Winreg.HKEY;
                        lpSubKey : Win32.LPCSTR;
                        phkResult : PHKEY)
                       return Win32.LONG
     renames RegOpenKeyA;     --  winreg.h:330

   function RegOpenKeyW (hKey : Win32.Winreg.HKEY;
                         lpSubKey : Win32.LPCWSTR;
                         phkResult : PHKEY)
                        return Win32.LONG;      --  winreg.h:338

   function RegOpenKeyExA (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCSTR;
                           ulOptions : Win32.DWORD;
                           samDesired : REGSAM;
                           phkResult : PHKEY)
                          return Win32.LONG;   --  winreg.h:352

   function RegOpenKeyEx (hKey : Win32.Winreg.HKEY;
                          lpSubKey : Win32.LPCSTR;
                          ulOptions : Win32.DWORD;
                          samDesired : REGSAM;
                          phkResult : PHKEY)
                         return Win32.LONG
     renames RegOpenKeyExA; --  winreg.h:352

   function RegOpenKeyExW (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCWSTR;
                           ulOptions : Win32.DWORD;
                           samDesired : REGSAM;
                           phkResult : PHKEY)
                          return Win32.LONG;   --  winreg.h:362

   function RegQueryInfoKeyA (hKey : Win32.Winreg.HKEY;
                              lpClass : Win32.LPSTR;
                              lpcbClass : Win32.LPDWORD;
                              lpReserved : Win32.LPDWORD;
                              lpcSubKeys : Win32.LPDWORD;
                              lpcbMaxSubKeyLen : Win32.LPDWORD;
                              lpcbMaxClassLen : Win32.LPDWORD;
                              lpcValues : Win32.LPDWORD;
                              lpcbMaxValueNameLen : Win32.LPDWORD;
                              lpcbMaxValueLen : Win32.LPDWORD;
                              lpcbSecurityDescriptor : Win32.LPDWORD;
                              lpftLastWriteTime : Win32.Winbase.PFILETIME)
                             return Win32.LONG;
   --  winreg.h:378

   function RegQueryInfoKey (hKey : Win32.Winreg.HKEY;
                             lpClass : Win32.LPSTR;
                             lpcbClass : Win32.LPDWORD;
                             lpReserved : Win32.LPDWORD;
                             lpcSubKeys : Win32.LPDWORD;
                             lpcbMaxSubKeyLen : Win32.LPDWORD;
                             lpcbMaxClassLen : Win32.LPDWORD;
                             lpcValues : Win32.LPDWORD;
                             lpcbMaxValueNameLen : Win32.LPDWORD;
                             lpcbMaxValueLen : Win32.LPDWORD;
                             lpcbSecurityDescriptor : Win32.LPDWORD;
                             lpftLastWriteTime : Win32.Winbase.PFILETIME)
                            return Win32.LONG
     renames RegQueryInfoKeyA;
   --  winreg.h:378

   function RegQueryInfoKeyW (hKey : Win32.Winreg.HKEY;
                              lpClass : Win32.LPWSTR;
                              lpcbClass : Win32.LPDWORD;
                              lpReserved : Win32.LPDWORD;
                              lpcSubKeys : Win32.LPDWORD;
                              lpcbMaxSubKeyLen : Win32.LPDWORD;
                              lpcbMaxClassLen : Win32.LPDWORD;
                              lpcValues : Win32.LPDWORD;
                              lpcbMaxValueNameLen : Win32.LPDWORD;
                              lpcbMaxValueLen : Win32.LPDWORD;
                              lpcbSecurityDescriptor : Win32.LPDWORD;
                              lpftLastWriteTime : Win32.Winbase.PFILETIME)
                             return Win32.LONG;
   --  winreg.h:395

   function RegQueryValueA (hKey : Win32.Winreg.HKEY;
                            lpSubKey : Win32.LPCSTR;
                            lpValue : Win32.LPSTR;
                            lpcbValue : Win32.PLONG)
                           return Win32.LONG;   --  winreg.h:418

   function RegQueryValue (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCSTR;
                           lpValue : Win32.LPSTR;
                           lpcbValue : Win32.PLONG)
                          return Win32.LONG
     renames RegQueryValueA;
   --  winreg.h:418

   function RegQueryValueW (hKey : Win32.Winreg.HKEY;
                            lpSubKey : Win32.LPCWSTR;
                            lpValue : Win32.LPWSTR;
                            lpcbValue : Win32.PLONG)
                           return Win32.LONG;   --  winreg.h:427

   function RegQueryValueExA (hKey : Win32.Winreg.HKEY;
                              lpValueName : Win32.LPSTR;
                              lpReserved : Win32.LPDWORD;
                              lpType : Win32.LPDWORD;
                              lpData : Win32.LPBYTE;
                              lpcbData : Win32.LPDWORD)
                             return Win32.LONG;
   --  winreg.h:442

   function RegQueryValueEx (hKey : Win32.Winreg.HKEY;
                             lpValueName : Win32.LPSTR;
                             lpReserved : Win32.LPDWORD;
                             lpType : Win32.LPDWORD;
                             lpData : Win32.LPBYTE;
                             lpcbData : Win32.LPDWORD)
                            return Win32.LONG
     renames RegQueryValueExA;
   --  winreg.h:442

   function RegQueryValueExW (hKey : Win32.Winreg.HKEY;
                              lpValueName : Win32.LPWSTR;
                              lpReserved : Win32.LPDWORD;
                              lpType : Win32.LPDWORD;
                              lpData : Win32.LPBYTE;
                              lpcbData : Win32.LPDWORD)
                             return Win32.LONG;
   --  winreg.h:453

   function RegReplaceKeyA (hKey : Win32.Winreg.HKEY;
                            lpSubKey : Win32.LPCSTR;
                            lpNewFile : Win32.LPCSTR;
                            lpOldFile : Win32.LPCSTR)
                           return Win32.LONG;   --  winreg.h:470

   function RegReplaceKey (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCSTR;
                           lpNewFile : Win32.LPCSTR;
                           lpOldFile : Win32.LPCSTR)
                          return Win32.LONG
     renames RegReplaceKeyA;
   --  winreg.h:470

   function RegReplaceKeyW (hKey : Win32.Winreg.HKEY;
                            lpSubKey : Win32.LPCWSTR;
                            lpNewFile : Win32.LPCWSTR;
                            lpOldFile : Win32.LPCWSTR)
                           return Win32.LONG;   --  winreg.h:479

   function RegRestoreKeyA (hKey : Win32.Winreg.HKEY;
                            lpFile : Win32.LPCSTR;
                            dwFlags : Win32.DWORD)
                           return Win32.LONG;     --  winreg.h:494

   function RegRestoreKey (hKey : Win32.Winreg.HKEY;
                           lpFile : Win32.LPCSTR;
                           dwFlags : Win32.DWORD)
                          return Win32.LONG
     renames RegRestoreKeyA; --  winreg.h:494

   function RegRestoreKeyW (hKey : Win32.Winreg.HKEY;
                            lpFile : Win32.LPCWSTR;
                            dwFlags : Win32.DWORD)
                           return Win32.LONG;     --  winreg.h:502

   function RegSaveKeyA
     (hKey : Win32.Winreg.HKEY;
      lpFile : Win32.LPCSTR;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES)
     return Win32.LONG;            --  winreg.h:516

   function RegSaveKey
     (hKey : Win32.Winreg.HKEY;
      lpFile : Win32.LPCSTR;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES)
     return Win32.LONG
     renames RegSaveKeyA;          --  winreg.h:516

   function RegSaveKeyW
     (hKey : Win32.Winreg.HKEY;
      lpFile : Win32.LPCWSTR;
      lpSecurityAttributes : Win32.Winbase.LPSECURITY_ATTRIBUTES)
     return Win32.LONG;            --  winreg.h:524

   function RegSetKeySecurity
     (hKey : Win32.Winreg.HKEY;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.LONG;             --  winreg.h:538

   function RegSetValueA (hKey : Win32.Winreg.HKEY;
                          lpSubKey : Win32.LPCSTR;
                          dwType : Win32.DWORD;
                          lpData : Win32.LPCSTR;
                          cbData : Win32.DWORD)
                         return Win32.LONG;      --  winreg.h:547

   function RegSetValue (hKey : Win32.Winreg.HKEY;
                         lpSubKey : Win32.LPCSTR;
                         dwType : Win32.DWORD;
                         lpData : Win32.LPCSTR;
                         cbData : Win32.DWORD)
                        return Win32.LONG
     renames RegSetValueA;    --  winreg.h:547

   function RegSetValueW (hKey : Win32.Winreg.HKEY;
                          lpSubKey : Win32.LPCWSTR;
                          dwType : Win32.DWORD;
                          lpData : Win32.LPCWSTR;
                          cbData : Win32.DWORD)
                         return Win32.LONG;      --  winreg.h:557

   function RegSetValueExA (hKey : Win32.Winreg.HKEY;
                            lpValueName : Win32.LPCSTR;
                            Reserved : Win32.DWORD;
                            dwType : Win32.DWORD;
                            lpData : Win32.PCBYTE;
                            cbData : Win32.DWORD)
                           return Win32.LONG; --  winreg.h:574

   function RegSetValueEx (hKey : Win32.Winreg.HKEY;
                           lpValueName : Win32.LPCSTR;
                           Reserved : Win32.DWORD;
                           dwType : Win32.DWORD;
                           lpData : Win32.PCBYTE;
                           cbData : Win32.DWORD)
                          return Win32.LONG
     renames RegSetValueExA;
   --  winreg.h:574

   function RegSetValueExW (hKey : Win32.Winreg.HKEY;
                            lpValueName : Win32.LPCWSTR;
                            Reserved : Win32.DWORD;
                            dwType : Win32.DWORD;
                            lpData : Win32.PCBYTE;
                            cbData : Win32.DWORD)
                           return Win32.LONG; --  winreg.h:585

   function RegUnLoadKeyA (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCSTR)
                          return Win32.LONG;     --  winreg.h:602

   function RegUnLoadKey (hKey : Win32.Winreg.HKEY;
                          lpSubKey : Win32.LPCSTR)
                         return Win32.LONG
     renames RegUnLoadKeyA;  --  winreg.h:602

   function RegUnLoadKeyW (hKey : Win32.Winreg.HKEY;
                           lpSubKey : Win32.LPCWSTR)
                          return Win32.LONG;     --  winreg.h:609

   function InitiateSystemShutdownA (lpMachineName : Win32.LPSTR;
                                     lpMessage : Win32.LPSTR;
                                     dwTimeout : Win32.DWORD;
                                     bForceAppsClosed : Win32.BOOL;
                                     bRebootAfterShutdown : Win32.BOOL)
                                    return Win32.BOOL;
   --  winreg.h:626

   function InitiateSystemShutdown
     (lpMachineName : Win32.LPSTR;
      lpMessage : Win32.LPSTR;
      dwTimeout : Win32.DWORD;
      bForceAppsClosed : Win32.BOOL;
      bRebootAfterShutdown : Win32.BOOL)
     return Win32.BOOL
     renames InitiateSystemShutdownA;
   --  winreg.h:626

   function InitiateSystemShutdownW (lpMachineName : Win32.LPWSTR;
                                     lpMessage : Win32.LPWSTR;
                                     dwTimeout : Win32.DWORD;
                                     bForceAppsClosed : Win32.BOOL;
                                     bRebootAfterShutdown : Win32.BOOL)
                                    return Win32.BOOL;
   --  winreg.h:636

   function AbortSystemShutdownA (lpMachineName : Win32.LPSTR)
      return Win32.BOOL;                                  --  winreg.h:653

   function AbortSystemShutdown (lpMachineName : Win32.LPSTR) return Win32.BOOL
     renames AbortSystemShutdownA;                       --  winreg.h:653

   function AbortSystemShutdownW (lpMachineName : Win32.LPWSTR)
      return Win32.BOOL;                                  --  winreg.h:659

private

   function To_Hkey is new Ada.Unchecked_Conversion (Win32.DWORD, HKEY);

   HKEY_CLASSES_ROOT : constant  HKEY := To_Hkey (16#80000000#);
   --  winreg.h:44
   HKEY_CURRENT_CONFIG : constant  HKEY := To_Hkey (16#80000005#);
   --  winreg.h
   HKEY_CURRENT_USER : constant  HKEY := To_Hkey (16#80000001#);
   --  winreg.h:45
   HKEY_LOCAL_MACHINE : constant  HKEY := To_Hkey (16#80000002#);
   --  winreg.h:46
   HKEY_USERS : constant  HKEY := To_Hkey (16#80000003#);
   --  winreg.h:47
   HKEY_PERFORMANCE_DATA : constant  HKEY := To_Hkey (16#80000004#);
   --  winreg.h:48
   HKEY_PERFORMANCE_TEXT : constant  HKEY := To_Hkey (16#80000050#);
   --  winreg.h:49
   HKEY_PERFORMANCE_NLSTEXT : constant  HKEY := To_Hkey (16#80000060#);
   --  winreg.h:50

   pragma Import (Stdcall, RegCloseKey, "RegCloseKey");        --  winreg.h:67
   pragma Import (Stdcall, RegConnectRegistryA, "RegConnectRegistryA");
   --  winreg.h:74
   pragma Import (Stdcall, RegConnectRegistryW, "RegConnectRegistryW");
   --  winreg.h:82
   pragma Import (Stdcall, RegCreateKeyA, "RegCreateKeyA");    --  winreg.h:96
   pragma Import (Stdcall, RegCreateKeyW, "RegCreateKeyW");    --  winreg.h:104
   pragma Import (Stdcall, RegCreateKeyExA, "RegCreateKeyExA");
   --  winreg.h:118
   pragma Import (Stdcall, RegCreateKeyExW, "RegCreateKeyExW");
   --  winreg.h:132
   pragma Import (Stdcall, RegDeleteKeyA, "RegDeleteKeyA");    --  winreg.h:152
   pragma Import (Stdcall, RegDeleteKeyW, "RegDeleteKeyW");    --  winreg.h:159
   pragma Import (Stdcall, RegDeleteValueA, "RegDeleteValueA");
   --  winreg.h:172
   pragma Import (Stdcall, RegDeleteValueW, "RegDeleteValueW");
   --  winreg.h:179
   pragma Import (Stdcall, RegEnumKeyA, "RegEnumKeyA");        --  winreg.h:192
   pragma Import (Stdcall, RegEnumKeyW, "RegEnumKeyW");        --  winreg.h:201
   pragma Import (Stdcall, RegEnumKeyExA, "RegEnumKeyExA");    --  winreg.h:216
   pragma Import (Stdcall, RegEnumKeyExW, "RegEnumKeyExW");    --  winreg.h:229
   pragma Import (Stdcall, RegEnumValueA, "RegEnumValueA");    --  winreg.h:248
   pragma Import (Stdcall, RegEnumValueW, "RegEnumValueW");    --  winreg.h:261
   pragma Import (Stdcall, RegFlushKey, "RegFlushKey");        --  winreg.h:280
   pragma Import (Stdcall, RegGetKeySecurity, "RegGetKeySecurity");
   --  winreg.h:287
   pragma Import (Stdcall, RegLoadKeyA, "RegLoadKeyA");        --  winreg.h:297
   pragma Import (Stdcall, RegLoadKeyW, "RegLoadKeyW");        --  winreg.h:305
   pragma Import (Stdcall, RegNotifyChangeKeyValue, "RegNotifyChangeKeyValue");
   --  winreg.h:319
   pragma Import (Stdcall, RegOpenKeyA, "RegOpenKeyA");        --  winreg.h:330
   pragma Import (Stdcall, RegOpenKeyW, "RegOpenKeyW");        --  winreg.h:338
   pragma Import (Stdcall, RegOpenKeyExA, "RegOpenKeyExA");    --  winreg.h:352
   pragma Import (Stdcall, RegOpenKeyExW, "RegOpenKeyExW");    --  winreg.h:362
   pragma Import (Stdcall, RegQueryInfoKeyA, "RegQueryInfoKeyA");
   --  winreg.h:378
   pragma Import (Stdcall, RegQueryInfoKeyW, "RegQueryInfoKeyW");
   --  winreg.h:395
   pragma Import (Stdcall, RegQueryValueA, "RegQueryValueA");  --  winreg.h:418
   pragma Import (Stdcall, RegQueryValueW, "RegQueryValueW");  --  winreg.h:427
   pragma Import (Stdcall, RegQueryValueExA, "RegQueryValueExA");
   --  winreg.h:442
   pragma Import (Stdcall, RegQueryValueExW, "RegQueryValueExW");
   --  winreg.h:453
   pragma Import (Stdcall, RegReplaceKeyA, "RegReplaceKeyA");  --  winreg.h:470
   pragma Import (Stdcall, RegReplaceKeyW, "RegReplaceKeyW");  --  winreg.h:479
   pragma Import (Stdcall, RegRestoreKeyA, "RegRestoreKeyA");  --  winreg.h:494
   pragma Import (Stdcall, RegRestoreKeyW, "RegRestoreKeyW");  --  winreg.h:502
   pragma Import (Stdcall, RegSaveKeyA, "RegSaveKeyA");        --  winreg.h:516
   pragma Import (Stdcall, RegSaveKeyW, "RegSaveKeyW");        --  winreg.h:524
   pragma Import (Stdcall, RegSetKeySecurity, "RegSetKeySecurity");
   --  winreg.h:538
   pragma Import (Stdcall, RegSetValueA, "RegSetValueA");      --  winreg.h:547
   pragma Import (Stdcall, RegSetValueW, "RegSetValueW");      --  winreg.h:557
   pragma Import (Stdcall, RegSetValueExA, "RegSetValueExA");  --  winreg.h:574
   pragma Import (Stdcall, RegSetValueExW, "RegSetValueExW");  --  winreg.h:585
   pragma Import (Stdcall, RegUnLoadKeyA, "RegUnLoadKeyA");    --  winreg.h:602
   pragma Import (Stdcall, RegUnLoadKeyW, "RegUnLoadKeyW");    --  winreg.h:609
   pragma Import (Stdcall, InitiateSystemShutdownA, "InitiateSystemShutdownA");
   --  winreg.h:626
   pragma Import (Stdcall, InitiateSystemShutdownW, "InitiateSystemShutdownW");
   --  winreg.h:636
   pragma Import (Stdcall, AbortSystemShutdownA, "AbortSystemShutdownA");
   --  winreg.h:653
   pragma Import (Stdcall, AbortSystemShutdownW, "AbortSystemShutdownW");
   --  winreg.h:659

end Win32.Winreg;
