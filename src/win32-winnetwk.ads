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

with Win32.Windef;
with Win32.Winnt;

package Win32.Winnetwk is

   RESOURCE_CONNECTED          : constant := 16#1#;
   RESOURCE_GLOBALNET          : constant := 16#2#;
   RESOURCE_REMEMBERED         : constant := 16#3#;
   RESOURCETYPE_ANY            : constant := 16#0#;
   RESOURCETYPE_DISK           : constant := 16#1#;
   RESOURCETYPE_PRINT          : constant := 16#2#;
   RESOURCETYPE_UNKNOWN        : constant := 16#ffffffff#;
   RESOURCEUSAGE_CONNECTABLE   : constant := 16#1#;
   RESOURCEUSAGE_CONTAINER     : constant := 16#2#;
   RESOURCEUSAGE_RESERVED      : constant := 16#80000000#;
   RESOURCEDISPLAYTYPE_GENERIC : constant := 16#0#;
   RESOURCEDISPLAYTYPE_DOMAIN  : constant := 16#1#;
   RESOURCEDISPLAYTYPE_SERVER  : constant := 16#2#;
   RESOURCEDISPLAYTYPE_SHARE   : constant := 16#3#;
   RESOURCEDISPLAYTYPE_FILE    : constant := 16#4#;
   RESOURCEDISPLAYTYPE_GROUP   : constant := 16#5#;
   RESOURCEDISPLAYTYPE_TREE    : constant := 16#a#;
   UNIVERSAL_NAME_INFO_LEVEL   : constant := 16#1#;
   REMOTE_NAME_INFO_LEVEL      : constant := 16#2#;
   NETPROPERTY_PERSISTENT      : constant := 1;
   CONNECT_UPDATE_PROFILE      : constant := 16#1#;
   CONNECT_UPDATE_RECENT       : constant := 16#2#;
   CONNECT_TEMPORARY           : constant := 16#4#;
   CONNECT_INTERACTIVE         : constant := 16#8#;
   CONNECT_PROMPT              : constant := 16#10#;
   CONNECT_NEED_DRIVE          : constant := 16#20#;
   WN_SUCCESS                  : constant := 0;
   WN_NOT_SUPPORTED            : constant := 50;
   WN_NET_ERROR                : constant := 59;
   WN_MORE_DATA                : constant := 234;
   WN_BAD_POINTER              : constant := 487;
   WN_BAD_VALUE                : constant := 87;
   WN_BAD_PASSWORD             : constant := 86;
   WN_ACCESS_DENIED            : constant := 5;
   WN_FUNCTION_BUSY            : constant := 170;
   WN_WINDOWS_ERROR            : constant := 59;
   WN_BAD_USER                 : constant := 2202;
   WN_OUT_OF_MEMORY            : constant := 8;
   WN_NO_NETWORK               : constant := 1222;
   WN_EXTENDED_ERROR           : constant := 1208;
   WN_NOT_CONNECTED            : constant := 2250;
   WN_OPEN_FILES               : constant := 2401;
   WN_DEVICE_IN_USE            : constant := 2404;
   WN_BAD_NETNAME              : constant := 67;
   WN_BAD_LOCALNAME            : constant := 1200;
   WN_ALREADY_CONNECTED        : constant := 85;
   WN_DEVICE_ERROR             : constant := 31;
   WN_CONNECTION_CLOSED        : constant := 1201;
   WN_NO_NET_OR_BAD_PATH       : constant := 1203;
   WN_BAD_PROVIDER             : constant := 1204;
   WN_CANNOT_OPEN_PROFILE      : constant := 1205;
   WN_BAD_PROFILE              : constant := 1206;
   WN_CANCEL                   : constant := 1223;
   WN_RETRY                    : constant := 1237;
   WN_BAD_HANDLE               : constant := 6;
   WN_NO_MORE_ENTRIES          : constant := 259;
   WN_NOT_CONTAINER            : constant := 1207;
   WN_NO_ERROR                 : constant := 0;

   type UNIVERSAL_NAME_INFOA;
   type UNIVERSAL_NAME_INFOW;
   type REMOTE_NAME_INFOA;
   type REMOTE_NAME_INFOW;
   type NETRESOURCEA;
   type NETRESOURCEW;

   type LPUNIVERSAL_NAME_INFOA is access all UNIVERSAL_NAME_INFOA;
   subtype LPUNIVERSAL_NAME_INFO is LPUNIVERSAL_NAME_INFOA;
   type LPUNIVERSAL_NAME_INFOW is access all UNIVERSAL_NAME_INFOW;
   type LPREMOTE_NAME_INFOA is access all REMOTE_NAME_INFOA;
   subtype LPREMOTE_NAME_INFO is LPREMOTE_NAME_INFOA;
   type LPREMOTE_NAME_INFOW is access all REMOTE_NAME_INFOW;
   type LPNETRESOURCEA is access all NETRESOURCEA;
   subtype LPNETRESOURCE is LPNETRESOURCEA;
   type LPNETRESOURCEW is access all NETRESOURCEW;

   type UNIVERSAL_NAME_INFOA is record
      lpUniversalName : Win32.LPSTR;
   end record;

   type UNIVERSAL_NAME_INFOW is record
      lpUniversalName : Win32.LPWSTR;
   end record;

   subtype UNIVERSAL_NAME_INFO is UNIVERSAL_NAME_INFOA;

   type REMOTE_NAME_INFOA is record
      lpUniversalName  : Win32.LPSTR;
      lpConnectionName : Win32.LPSTR;
      lpRemainingPath  : Win32.LPSTR;
   end record;

   type REMOTE_NAME_INFOW is record
      lpUniversalName  : Win32.LPWSTR;
      lpConnectionName : Win32.LPWSTR;
      lpRemainingPath  : Win32.LPWSTR;
   end record;

   subtype REMOTE_NAME_INFO is REMOTE_NAME_INFOA;

   type NETRESOURCEA is record
      dwScope       : Win32.DWORD;
      dwType        : Win32.DWORD;
      dwDisplayType : Win32.DWORD;
      dwUsage       : Win32.DWORD;
      lpLocalName   : Win32.LPSTR;
      lpRemoteName  : Win32.LPSTR;
      lpComment     : Win32.LPSTR;
      lpProvider    : Win32.LPSTR;
   end record;

   type NETRESOURCEW is record
      dwScope       : Win32.DWORD;
      dwType        : Win32.DWORD;
      dwDisplayType : Win32.DWORD;
      dwUsage       : Win32.DWORD;
      lpLocalName   : Win32.LPWSTR;
      lpRemoteName  : Win32.LPWSTR;
      lpComment     : Win32.LPWSTR;
      lpProvider    : Win32.LPWSTR;
   end record;

   subtype NETRESOURCE is NETRESOURCEA;

   function WNETADDCONNECTIONA
     (lpRemoteName : Win32.LPCSTR;
      lpPassword   : Win32.LPCSTR;
      lpLocalName  : Win32.LPCSTR)
      return Win32.DWORD;

   function WNETADDCONNECTIONW
     (lpRemoteName : Win32.LPCWSTR;
      lpPassword   : Win32.LPCWSTR;
      lpLocalName  : Win32.LPCWSTR)
      return Win32.DWORD;

   function WNETADDCONNECTION
     (lpRemoteName : Win32.LPCSTR;
      lpPassword   : Win32.LPCSTR;
      lpLocalName  : Win32.LPCSTR)
      return Win32.DWORD renames WNETADDCONNECTIONA;

   function WNETADDCONNECTION2A
     (lpNetResource : access NETRESOURCEA;
      lpPassword    : Win32.LPCSTR;
      lpUserName    : Win32.LPCSTR;
      dwFlags       : Win32.DWORD)
      return Win32.DWORD;

   function WNETADDCONNECTION2W
     (lpNetResource : access NETRESOURCEW;
      lpPassword    : Win32.LPCWSTR;
      lpUserName    : Win32.LPCWSTR;
      dwFlags       : Win32.DWORD)
      return Win32.DWORD;

   function WNETADDCONNECTION2
     (lpNetResource : access NETRESOURCEA;
      lpPassword    : Win32.LPCSTR;
      lpUserName    : Win32.LPCSTR;
      dwFlags       : Win32.DWORD)
      return Win32.DWORD renames WNETADDCONNECTION2A;

   function WNETADDCONNECTION3A
     (hwndOwner     : Win32.Windef.HWND;
      lpNetResource : access NETRESOURCEA;
      lpPassword    : Win32.LPCSTR;
      lpUserName    : Win32.LPCSTR;
      dwFlags       : Win32.DWORD)
      return Win32.DWORD;

   function WNETADDCONNECTION3W
     (hwndOwner     : Win32.Windef.HWND;
      lpNetResource : access NETRESOURCEW;
      lpPassword    : Win32.LPCWSTR;
      lpUserName    : Win32.LPCWSTR;
      dwFlags       : Win32.DWORD)
      return Win32.DWORD;

   function WNETADDCONNECTION3
     (hwndOwner     : Win32.Windef.HWND;
      lpNetResource : access NETRESOURCEA;
      lpPassword    : Win32.LPCSTR;
      lpUserName    : Win32.LPCSTR;
      dwFlags       : Win32.DWORD)
      return Win32.DWORD renames WNETADDCONNECTION3A;

   function WNETCANCELCONNECTIONA
     (lpName : Win32.LPCSTR;
      fForce : Win32.BOOL)
      return Win32.DWORD;

   function WNETCANCELCONNECTIONW
     (lpName : Win32.LPCWSTR;
      fForce : Win32.BOOL)
      return Win32.DWORD;

   function WNETCANCELCONNECTION
     (lpName : Win32.LPCSTR;
      fForce : Win32.BOOL)
      return Win32.DWORD renames WNETCANCELCONNECTIONA;

   function WNETCANCELCONNECTION2A
     (lpName  : Win32.LPCSTR;
      dwFlags : Win32.DWORD;
      fForce  : Win32.BOOL)
      return Win32.DWORD;

   function WNETCANCELCONNECTION2W
     (lpName  : Win32.LPCWSTR;
      dwFlags : Win32.DWORD;
      fForce  : Win32.BOOL)
      return Win32.DWORD;

   function WNETCANCELCONNECTION2
     (lpName  : Win32.LPCSTR;
      dwFlags : Win32.DWORD;
      fForce  : Win32.BOOL)
      return Win32.DWORD renames WNETCANCELCONNECTION2A;

   function WNETGETCONNECTIONA
     (lpLocalName  : Win32.LPCSTR;
      lpRemoteName : Win32.LPSTR;
      lpnLength    : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETGETCONNECTIONW
     (lpLocalName  : Win32.LPCWSTR;
      lpRemoteName : Win32.LPWSTR;
      lpnLength    : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETGETCONNECTION
     (lpLocalName  : Win32.LPCSTR;
      lpRemoteName : Win32.LPSTR;
      lpnLength    : Win32.LPDWORD)
      return Win32.DWORD renames WNETGETCONNECTIONA;

   function WNETGETUNIVERSALNAMEA
     (lpLocalPath  : Win32.LPCSTR;
      dwInfoLevel  : Win32.DWORD;
      lpBuffer     : Win32.LPVOID;
      lpBufferSize : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETGETUNIVERSALNAMEW
     (lpLocalPath  : Win32.LPCWSTR;
      dwInfoLevel  : Win32.DWORD;
      lpBuffer     : Win32.LPVOID;
      lpBufferSize : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETGETUNIVERSALNAME
     (lpLocalPath  : Win32.LPCSTR;
      dwInfoLevel  : Win32.DWORD;
      lpBuffer     : Win32.LPVOID;
      lpBufferSize : Win32.LPDWORD)
      return Win32.DWORD renames WNETGETUNIVERSALNAMEA;

   function WNETOPENENUMA
     (dwScope       : Win32.DWORD;
      dwType        : Win32.DWORD;
      dwUsage       : Win32.DWORD;
      lpNetResource : access NETRESOURCEA;
      lphEnum       : Win32.Windef.LPHANDLE)
      return Win32.DWORD;

   function WNETOPENENUMW
     (dwScope       : Win32.DWORD;
      dwType        : Win32.DWORD;
      dwUsage       : Win32.DWORD;
      lpNetResource : access NETRESOURCEW;
      lphEnum       : Win32.Windef.LPHANDLE)
      return Win32.DWORD;

   function WNETOPENENUM
     (dwScope       : Win32.DWORD;
      dwType        : Win32.DWORD;
      dwUsage       : Win32.DWORD;
      lpNetResource : access NETRESOURCEA;
      lphEnum       : Win32.Windef.LPHANDLE)
      return Win32.DWORD renames WNETOPENENUMA;

   function WNETENUMRESOURCEA
     (hEnum        : Win32.Winnt.HANDLE;
      lpcCount     : Win32.LPDWORD;
      lpBuffer     : Win32.LPVOID;
      lpBufferSize : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETENUMRESOURCEW
     (hEnum        : Win32.Winnt.HANDLE;
      lpcCount     : Win32.LPDWORD;
      lpBuffer     : Win32.LPVOID;
      lpBufferSize : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETENUMRESOURCE
     (hEnum        : Win32.Winnt.HANDLE;
      lpcCount     : Win32.LPDWORD;
      lpBuffer     : Win32.LPVOID;
      lpBufferSize : Win32.LPDWORD)
      return Win32.DWORD renames WNETENUMRESOURCEA;

   function WNETCLOSEENUM (hEnum : Win32.Winnt.HANDLE) return Win32.DWORD;

   function WNETGETUSERA
     (lpName     : Win32.LPCSTR;
      lpUserName : Win32.LPSTR;
      lpnLength  : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETGETUSERW
     (lpName     : Win32.LPCWSTR;
      lpUserName : Win32.LPWSTR;
      lpnLength  : Win32.LPDWORD)
      return Win32.DWORD;

   function WNETGETUSER
     (lpName     : Win32.LPCSTR;
      lpUserName : Win32.LPSTR;
      lpnLength  : Win32.LPDWORD)
      return Win32.DWORD renames WNETGETUSERA;

   function WNETCONNECTIONDIALOG
     (hwnd   : Win32.Windef.HWND;
      dwType : Win32.DWORD)
      return Win32.DWORD;

   function WNETDISCONNECTDIALOG
     (hwnd   : Win32.Windef.HWND;
      dwType : Win32.DWORD)
      return Win32.DWORD;

   function WNETGETLASTERRORA
     (lpError       : Win32.LPDWORD;
      lpErrorBuf    : Win32.LPSTR;
      nErrorBufSize : Win32.DWORD;
      lpNameBuf     : Win32.LPSTR;
      nNameBufSize  : Win32.DWORD)
      return Win32.DWORD;

   function WNETGETLASTERRORW
     (lpError       : Win32.LPDWORD;
      lpErrorBuf    : Win32.LPWSTR;
      nErrorBufSize : Win32.DWORD;
      lpNameBuf     : Win32.LPWSTR;
      nNameBufSize  : Win32.DWORD)
      return Win32.DWORD;

   function WNETGETLASTERROR
     (lpError       : Win32.LPDWORD;
      lpErrorBuf    : Win32.LPSTR;
      nErrorBufSize : Win32.DWORD;
      lpNameBuf     : Win32.LPSTR;
      nNameBufSize  : Win32.DWORD)
      return Win32.DWORD renames WNETGETLASTERRORA;

private

   pragma Convention (C_Pass_By_Copy, UNIVERSAL_NAME_INFOA);
   pragma Convention (C_Pass_By_Copy, UNIVERSAL_NAME_INFOW);
   pragma Convention (C_Pass_By_Copy, REMOTE_NAME_INFOA);
   pragma Convention (C_Pass_By_Copy, REMOTE_NAME_INFOW);
   pragma Convention (C, NETRESOURCEA);
   pragma Convention (C, NETRESOURCEW);

   pragma Import (Stdcall, WNETADDCONNECTIONA, "WNetAddConnectionA");
   pragma Import (Stdcall, WNETADDCONNECTIONW, "WNetAddConnectionW");
   pragma Import (Stdcall, WNETADDCONNECTION2A, "WNetAddConnection2A");
   pragma Import (Stdcall, WNETADDCONNECTION2W, "WNetAddConnection2W");
   pragma Import (Stdcall, WNETADDCONNECTION3A, "WNetAddConnection3A");
   pragma Import (Stdcall, WNETADDCONNECTION3W, "WNetAddConnection3W");
   pragma Import (Stdcall, WNETCANCELCONNECTIONA, "WNetCancelConnectionA");
   pragma Import (Stdcall, WNETCANCELCONNECTIONW, "WNetCancelConnectionW");
   pragma Import (Stdcall, WNETCANCELCONNECTION2A, "WNetCancelConnection2A");
   pragma Import (Stdcall, WNETCANCELCONNECTION2W, "WNetCancelConnection2W");
   pragma Import (Stdcall, WNETGETCONNECTIONA, "WNetGetConnectionA");
   pragma Import (Stdcall, WNETGETCONNECTIONW, "WNetGetConnectionW");
   pragma Import (Stdcall, WNETGETUNIVERSALNAMEA, "WNetGetUniversalNameA");
   pragma Import (Stdcall, WNETGETUNIVERSALNAMEW, "WNetGetUniversalNameW");
   pragma Import (Stdcall, WNETOPENENUMA, "WNetOpenEnumA");
   pragma Import (Stdcall, WNETOPENENUMW, "WNetOpenEnumW");
   pragma Import (Stdcall, WNETENUMRESOURCEA, "WNetEnumResourceA");
   pragma Import (Stdcall, WNETENUMRESOURCEW, "WNetEnumResourceW");
   pragma Import (Stdcall, WNETCLOSEENUM, "WNetCloseEnum");
   pragma Import (Stdcall, WNETGETUSERA, "WNetGetUserA");
   pragma Import (Stdcall, WNETGETUSERW, "WNetGetUserW");
   pragma Import (Stdcall, WNETCONNECTIONDIALOG, "WNetConnectionDialog");
   pragma Import (Stdcall, WNETDISCONNECTDIALOG, "WNetDisconnectDialog");
   pragma Import (Stdcall, WNETGETLASTERRORA, "WNetGetLastErrorA");
   pragma Import (Stdcall, WNETGETLASTERRORW, "WNetGetLastErrorW");

end Win32.Winnetwk;
