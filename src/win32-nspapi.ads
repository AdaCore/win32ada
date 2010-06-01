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

with Win32.Objbase;
with Win32.Oleauto;
with Win32.Rpcdce;
with Win32.Winnt;
with Win32.Winsock;

package Win32.Nspapi is

   use Interfaces;
   use type Interfaces.C.char_array;

   SERVICE_RESOURCE            : constant := 16#1#;
   SERVICE_SERVICE             : constant := 16#2#;
   SERVICE_LOCAL               : constant := 16#4#;
   SERVICE_REGISTER            : constant := 16#1#;
   SERVICE_DEREGISTER          : constant := 16#2#;
   SERVICE_FLUSH               : constant := 16#3#;
   SERVICE_ADD_TYPE            : constant := 16#4#;
   SERVICE_DELETE_TYPE         : constant := 16#5#;
   SERVICE_FLAG_DEFER          : constant := 16#1#;
   SERVICE_FLAG_HARD           : constant := 16#2#;
   PROP_COMMENT                : constant := 16#1#;
   PROP_LOCALE                 : constant := 16#2#;
   PROP_DISPLAY_HINT           : constant := 16#4#;
   PROP_VERSION                : constant := 16#8#;
   PROP_START_TIME             : constant := 16#10#;
   PROP_MACHINE                : constant := 16#20#;
   PROP_ADDRESSES              : constant := 16#100#;
   PROP_SD                     : constant := 16#200#;
   PROP_ALL                    : constant := 16#80000000#;
   SERVICE_ADDRESS_FLAG_RPC_CN : constant := 16#1#;
   SERVICE_ADDRESS_FLAG_RPC_DG : constant := 16#2#;
   SERVICE_ADDRESS_FLAG_RPC_NB : constant := 16#4#;
   NS_DEFAULT                  : constant := 0;
   NS_SAP                      : constant := 1;
   NS_NDS                      : constant := 2;
   NS_TCPIP_LOCAL              : constant := 10;
   NS_TCPIP_HOSTS              : constant := 11;
   NS_DNS                      : constant := 12;
   NS_NETBT                    : constant := 13;
   NS_WINS                     : constant := 14;
   NS_NBP                      : constant := 20;
   NS_MS                       : constant := 30;
   NS_STDA                     : constant := 31;
   NS_CAIRO                    : constant := 32;
   NS_X500                     : constant := 40;
   NS_NIS                      : constant := 41;
   NSTYPE_HIERARCHICAL         : constant := 16#1#;
   NSTYPE_DYNAMIC              : constant := 16#2#;
   NSTYPE_ENUMERABLE           : constant := 16#4#;
   NSTYPE_WORKGROUP            : constant := 16#8#;
   XP_CONNECTIONLESS           : constant := 16#1#;
   XP_GUARANTEED_DELIVERY      : constant := 16#2#;
   XP_GUARANTEED_ORDER         : constant := 16#4#;
   XP_MESSAGE_ORIENTED         : constant := 16#8#;
   XP_PSEUDO_STREAM            : constant := 16#10#;
   XP_GRACEFUL_CLOSE           : constant := 16#20#;
   XP_EXPEDITED_DATA           : constant := 16#40#;
   XP_CONNECT_DATA             : constant := 16#80#;
   XP_DISCONNECT_DATA          : constant := 16#100#;
   XP_SUPPORTS_BROADCAST       : constant := 16#200#;
   XP_SUPPORTS_MULTICAST       : constant := 16#400#;
   XP_BANDWIDTH_ALLOCATION     : constant := 16#800#;
   XP_FRAGMENTATION            : constant := 16#1000#;
   XP_ENCRYPTS                 : constant := 16#2000#;
   RES_SOFT_SEARCH             : constant := 16#1#;
   RES_FIND_MULTIPLE           : constant := 16#2#;
   RES_SERVICE                 : constant := 16#4#;
   SERVICE_TYPE_VALUE_SAPIDA   : constant CHAR_Array  := "SapId" & Nul;
   SERVICE_TYPE_VALUE_SAPIDW   : constant WCHAR_Array :=
      To_Win (C.To_C ("SapId")) & Wide_Nul;
   SERVICE_TYPE_VALUE_CONNA    : constant CHAR_Array  :=
      "ConnectionOriented" & Nul;
   SERVICE_TYPE_VALUE_CONNW    : constant WCHAR_Array :=
      To_Win (C.To_C ("ConnectionOriented")) & Wide_Nul;
   SERVICE_TYPE_VALUE_TCPPORTA : constant CHAR_Array  := "TcpPort" & Nul;
   SERVICE_TYPE_VALUE_TCPPORTW : constant WCHAR_Array :=
      To_Win (C.To_C ("TcpPort")) & Wide_Nul;
   SERVICE_TYPE_VALUE_UDPPORTA : constant CHAR_Array  := "UdpPort" & Nul;
   SERVICE_TYPE_VALUE_UDPPORTW : constant WCHAR_Array :=
      To_Win (C.To_C ("UdpPort")) & Wide_Nul;
   SERVICE_TYPE_VALUE_SAPID    : CHAR_Array renames SERVICE_TYPE_VALUE_SAPIDA;
   SERVICE_TYPE_VALUE_CONN     : CHAR_Array renames SERVICE_TYPE_VALUE_CONNA;
   SERVICE_TYPE_VALUE_TCPPORT  : CHAR_Array renames
     SERVICE_TYPE_VALUE_TCPPORTA;
   SERVICE_TYPE_VALUE_UDPPORT  : CHAR_Array renames
     SERVICE_TYPE_VALUE_UDPPORTA;
   SET_SERVICE_PARTIAL_SUCCESS : constant := 16#1#;

   type NS_INFOA;
   type NS_INFOW;
   type SERVICE_TYPE_VALUE;
   type SERVICE_TYPE_VALUE_ABSA;
   type SERVICE_TYPE_VALUE_ABSW;
   type SERVICE_TYPE_INFO;
   type SERVICE_TYPE_INFO_ABSA;
   type SERVICE_TYPE_INFO_ABSW;
   type SERVICE_ADDRESS;
   type SERVICE_ADDRESSES;
   type SERVICE_INFOA;
   type SERVICE_INFOW;
   type NS_SERVICE_INFOA;
   type NS_SERVICE_INFOW;
   type SOCKET_ADDRESS;
   type CSADDR_INFO;
   type PROTOCOL_INFOA;
   type PROTOCOL_INFOW;
   type NETRESOURCE2A;
   type NETRESOURCE2W;
   type SERVICE_ASYNC_INFO;

   type LPNS_INFOA is access all NS_INFOA;
   type LPNS_INFOW is access all NS_INFOW;
   type LPNS_INFO is access all NS_INFOA;
   type PSERVICE_TYPE_VALUE is access all SERVICE_TYPE_VALUE;
   subtype LPSERVICE_TYPE_VALUE is PSERVICE_TYPE_VALUE;
   type PSERVICE_TYPE_VALUE_ABSA is access all SERVICE_TYPE_VALUE_ABSA;
   subtype LPSERVICE_TYPE_VALUE_ABSA is PSERVICE_TYPE_VALUE_ABSA;
   type PSERVICE_TYPE_VALUE_ABSW is access all SERVICE_TYPE_VALUE_ABSW;
   subtype LPSERVICE_TYPE_VALUE_ABSW is PSERVICE_TYPE_VALUE_ABSW;
   type PSERVICE_TYPE_VALUE_ABS is access all SERVICE_TYPE_VALUE_ABSA;
   subtype LPSERVICE_TYPE_VALUE_ABS is PSERVICE_TYPE_VALUE_ABS;
   type PSERVICE_TYPE_INFO is access all SERVICE_TYPE_INFO;
   subtype LPSERVICE_TYPE_INFO is PSERVICE_TYPE_INFO;
   type PSERVICE_TYPE_INFO_ABSA is access all SERVICE_TYPE_INFO_ABSA;
   subtype LPSERVICE_TYPE_INFO_ABSA is PSERVICE_TYPE_INFO_ABSA;
   type PSERVICE_TYPE_INFO_ABSW is access all SERVICE_TYPE_INFO_ABSW;
   subtype LPSERVICE_TYPE_INFO_ABSW is PSERVICE_TYPE_INFO_ABSW;
   type PSERVICE_TYPE_INFO_ABS is access all SERVICE_TYPE_INFO_ABSA;
   subtype LPSERVICE_TYPE_INFO_ABS is PSERVICE_TYPE_INFO_ABS;
   type PSERVICE_ADDRESS is access all SERVICE_ADDRESS;
   subtype LPSERVICE_ADDRESS is PSERVICE_ADDRESS;
   type PSERVICE_ADDRESSES is access all SERVICE_ADDRESSES;
   subtype LPSERVICE_ADDRESSES is PSERVICE_ADDRESSES;
   type PSERVICE_INFOA is access all SERVICE_INFOA;
   subtype LPSERVICE_INFOA is PSERVICE_INFOA;
   type PSERVICE_INFOW is access all SERVICE_INFOW;
   subtype LPSERVICE_INFOW is PSERVICE_INFOW;
   type PSERVICE_INFO is access all SERVICE_INFOA;
   subtype LPSERVICE_INFO is PSERVICE_INFO;
   type PNS_SERVICE_INFOA is access all NS_SERVICE_INFOA;
   subtype LPNS_SERVICE_INFOA is PNS_SERVICE_INFOA;
   type PNS_SERVICE_INFOW is access all NS_SERVICE_INFOW;
   subtype LPNS_SERVICE_INFOW is PNS_SERVICE_INFOW;
   type PNS_SERVICE_INFO is access all NS_SERVICE_INFOA;
   subtype LPNS_SERVICE_INFO is PNS_SERVICE_INFO;
   type PSOCKET_ADDRESS is access all SOCKET_ADDRESS;
   subtype LPSOCKET_ADDRESS is PSOCKET_ADDRESS;
   type PCSADDR_INFO is access all CSADDR_INFO;
   subtype LPCSADDR_INFO is PCSADDR_INFO;
   type PPROTOCOL_INFOA is access all PROTOCOL_INFOA;
   subtype LPPROTOCOL_INFOA is PPROTOCOL_INFOA;
   type PPROTOCOL_INFOW is access all PROTOCOL_INFOW;
   subtype LPPROTOCOL_INFOW is PPROTOCOL_INFOW;
   type PPROTOCOL_INFO is access all PROTOCOL_INFOA;
   subtype LPPROTOCOL_INFO is PPROTOCOL_INFO;
   type PNETRESOURCE2A is access all NETRESOURCE2A;
   subtype LPNETRESOURCE2A is PNETRESOURCE2A;
   type PNETRESOURCE2W is access all NETRESOURCE2W;
   subtype LPNETRESOURCE2W is PNETRESOURCE2W;
   type PNETRESOURCE2 is access all NETRESOURCE2A;
   subtype LPNETRESOURCE2 is PNETRESOURCE2;
   type PSERVICE_ASYNC_INFO is access all SERVICE_ASYNC_INFO;
   subtype LPSERVICE_ASYNC_INFO is PSERVICE_ASYNC_INFO;

   type NS_INFOA is record
      dwNameSpace      : Win32.DWORD;
      dwNameSpaceFlags : Win32.DWORD;
      lpNameSpace      : Win32.LPSTR;
   end record;

   subtype PNS_INFOA is NS_INFOA;

   type NS_INFOW is record
      dwNameSpace      : Win32.DWORD;
      dwNameSpaceFlags : Win32.DWORD;
      lpNameSpace      : Win32.LPWSTR;
   end record;

   subtype PNS_INFOW is NS_INFOW;

   subtype NS_INFO is NS_INFOA;

   subtype PNS_INFO is PNS_INFOA;

   type SERVICE_TYPE_VALUE is record
      dwNameSpace       : Win32.DWORD;
      dwValueType       : Win32.DWORD;
      dwValueSize       : Win32.DWORD;
      dwValueNameOffset : Win32.DWORD;
      dwValueOffset     : Win32.DWORD;
   end record;

   type SERVICE_TYPE_VALUE_ABSA is record
      dwNameSpace : Win32.DWORD;
      dwValueType : Win32.DWORD;
      dwValueSize : Win32.DWORD;
      lpValueName : Win32.LPSTR;
      lpValue     : Win32.PVOID;
   end record;

   type SERVICE_TYPE_VALUE_ABSW is record
      dwNameSpace : Win32.DWORD;
      dwValueType : Win32.DWORD;
      dwValueSize : Win32.DWORD;
      lpValueName : Win32.LPWSTR;
      lpValue     : Win32.PVOID;
   end record;

   subtype SERVICE_TYPE_VALUE_ABS is SERVICE_TYPE_VALUE_ABSA;

   type SERVICE_TYPE_VALUE_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased SERVICE_TYPE_VALUE;

   type SERVICE_TYPE_INFO is record
      dwTypeNameOffset : Win32.DWORD;
      dwValueCount     : Win32.DWORD;
      Values           : SERVICE_TYPE_VALUE_Array;
   end record;

   type SERVICE_TYPE_VALUE_ABSA_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased SERVICE_TYPE_VALUE_ABSA;

   type SERVICE_TYPE_INFO_ABSA is record
      lpTypeName   : Win32.LPSTR;
      dwValueCount : Win32.DWORD;
      Values       : SERVICE_TYPE_VALUE_ABSA_Array;
   end record;

   type SERVICE_TYPE_VALUE_ABSW_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased SERVICE_TYPE_VALUE_ABSW;

   type SERVICE_TYPE_INFO_ABSW is record
      lpTypeName   : Win32.LPWSTR;
      dwValueCount : Win32.DWORD;
      Values       : SERVICE_TYPE_VALUE_ABSW_Array;
   end record;

   subtype SERVICE_TYPE_INFO_ABS is SERVICE_TYPE_INFO_ABSA;

   type SERVICE_ADDRESS is record
      dwAddressType     : Win32.DWORD;
      dwAddressFlags    : Win32.DWORD;
      dwAddressLength   : Win32.DWORD;
      dwPrincipalLength : Win32.DWORD;
      lpAddress         : Win32.PBYTE;
      lpPrincipal       : Win32.PBYTE;
   end record;

   type SERVICE_ADDRESS_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased SERVICE_ADDRESS;

   type SERVICE_ADDRESSES is record
      dwAddressCount : Win32.DWORD;
      Addresses      : SERVICE_ADDRESS_Array;
   end record;

   type SERVICE_INFOA is record
      lpServiceType       : Win32.Objbase.LPGUID;
      lpServiceName       : Win32.LPSTR;
      lpComment           : Win32.LPSTR;
      lpLocale            : Win32.LPSTR;
      dwDisplayHint       : Win32.DWORD;
      dwVersion           : Win32.DWORD;
      dwTime              : Win32.DWORD;
      lpMachineName       : Win32.LPSTR;
      lpServiceAddress    : LPSERVICE_ADDRESSES;
      ServiceSpecificInfo : Win32.Oleauto.BLOB;
   end record;

   type SERVICE_INFOW is record
      lpServiceType       : Win32.Objbase.LPGUID;
      lpServiceName       : Win32.LPWSTR;
      lpComment           : Win32.LPWSTR;
      lpLocale            : Win32.LPWSTR;
      dwDisplayHint       : Win32.DWORD;
      dwVersion           : Win32.DWORD;
      dwTime              : Win32.DWORD;
      lpMachineName       : Win32.LPWSTR;
      lpServiceAddress    : LPSERVICE_ADDRESSES;
      ServiceSpecificInfo : Win32.Oleauto.BLOB;
   end record;

   subtype SERVICE_INFO is SERVICE_INFOA;

   type NS_SERVICE_INFOA is record
      dwNameSpace : Win32.DWORD;
      ServiceInfo : SERVICE_INFOA;
   end record;

   type NS_SERVICE_INFOW is record
      dwNameSpace : Win32.DWORD;
      ServiceInfo : SERVICE_INFOW;
   end record;

   subtype NS_SERVICE_INFO is NS_SERVICE_INFOA;

   type SOCKET_ADDRESS is record
      lpSockaddr      : Win32.Winsock.LPSOCKADDR;
      iSockaddrLength : Win32.INT;
   end record;

   type CSADDR_INFO is record
      LocalAddr   : SOCKET_ADDRESS;
      RemoteAddr  : SOCKET_ADDRESS;
      iSocketType : Win32.INT;
      iProtocol   : Win32.INT;
   end record;

   type PROTOCOL_INFOA is record
      dwServiceFlags : Win32.DWORD;
      iAddressFamily : Win32.INT;
      iMaxSockAddr   : Win32.INT;
      iMinSockAddr   : Win32.INT;
      iSocketType    : Win32.INT;
      iProtocol      : Win32.INT;
      dwMessageSize  : Win32.DWORD;
      lpProtocol     : Win32.LPSTR;
   end record;

   type PROTOCOL_INFOW is record
      dwServiceFlags : Win32.DWORD;
      iAddressFamily : Win32.INT;
      iMaxSockAddr   : Win32.INT;
      iMinSockAddr   : Win32.INT;
      iSocketType    : Win32.INT;
      iProtocol      : Win32.INT;
      dwMessageSize  : Win32.DWORD;
      lpProtocol     : Win32.LPWSTR;
   end record;

   subtype PROTOCOL_INFO is PROTOCOL_INFOA;

   type NETRESOURCE2A is record
      dwScope       : Win32.DWORD;
      dwType        : Win32.DWORD;
      dwUsage       : Win32.DWORD;
      dwDisplayType : Win32.DWORD;
      lpLocalName   : Win32.LPSTR;
      lpRemoteName  : Win32.LPSTR;
      lpComment     : Win32.LPSTR;
      ns_info       : Win32.Nspapi.NS_INFO;
      ServiceType   : Win32.Rpcdce.GUID;
      dwProtocols   : Win32.DWORD;
      lpiProtocols  : Win32.LPINT;
   end record;

   type NETRESOURCE2W is record
      dwScope       : Win32.DWORD;
      dwType        : Win32.DWORD;
      dwUsage       : Win32.DWORD;
      dwDisplayType : Win32.DWORD;
      lpLocalName   : Win32.LPWSTR;
      lpRemoteName  : Win32.LPWSTR;
      lpComment     : Win32.LPWSTR;
      ns_info       : Win32.Nspapi.NS_INFO;
      ServiceType   : Win32.Rpcdce.GUID;
      dwProtocols   : Win32.DWORD;
      lpiProtocols  : Win32.LPINT;
   end record;

   subtype NETRESOURCE2 is NETRESOURCE2A;

   type LPFN_NSPAPI is access function return Win32.DWORD;
   pragma Convention (Stdcall, LPFN_NSPAPI);
   type LPSERVICE_CALLBACK_PROC is access procedure
     (lParam           : Win32.LPARAM;
      hAsyncTaskHandle : Win32.Winnt.HANDLE);
   pragma Convention (Stdcall, LPSERVICE_CALLBACK_PROC);

   type SERVICE_ASYNC_INFO is record
      lpServiceCallbackProc : LPSERVICE_CALLBACK_PROC;
      lParam                : Win32.LPARAM;
      hAsyncTaskHandle      : Win32.Winnt.HANDLE;
   end record;

   function EnumProtocolsA
     (lpiProtocols     : Win32.LPINT;
      lpProtocolBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD)
      return Win32.INT;

   function EnumProtocols
     (lpiProtocols     : Win32.LPINT;
      lpProtocolBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD)
      return Win32.INT renames EnumProtocolsA;

   function EnumProtocolsW
     (lpiProtocols     : Win32.LPINT;
      lpProtocolBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD)
      return Win32.INT;

   function GetAddressByNameA
     (dwNameSpace           : Win32.DWORD;
      lpServiceType         : Win32.Objbase.LPGUID;
      lpServiceName         : Win32.LPSTR;
      lpiProtocols          : Win32.LPINT;
      dwResolution          : Win32.DWORD;
      lpServiceAsyncInfo    : LPSERVICE_ASYNC_INFO;
      lpCsaddrBuffer        : Win32.LPVOID;
      lpdwBufferLength      : Win32.LPDWORD;
      lpAliasBuffer         : Win32.LPSTR;
      lpdwAliasBufferLength : Win32.LPDWORD)
      return Win32.INT;

   function GetAddressByName
     (dwNameSpace           : Win32.DWORD;
      lpServiceType         : Win32.Objbase.LPGUID;
      lpServiceName         : Win32.LPSTR;
      lpiProtocols          : Win32.LPINT;
      dwResolution          : Win32.DWORD;
      lpServiceAsyncInfo    : LPSERVICE_ASYNC_INFO;
      lpCsaddrBuffer        : Win32.LPVOID;
      lpdwBufferLength      : Win32.LPDWORD;
      lpAliasBuffer         : Win32.LPSTR;
      lpdwAliasBufferLength : Win32.LPDWORD)
      return Win32.INT renames GetAddressByNameA;

   function GetAddressByNameW
     (dwNameSpace           : Win32.DWORD;
      lpServiceType         : Win32.Objbase.LPGUID;
      lpServiceName         : Win32.LPWSTR;
      lpiProtocols          : Win32.LPINT;
      dwResolution          : Win32.DWORD;
      lpServiceAsyncInfo    : LPSERVICE_ASYNC_INFO;
      lpCsaddrBuffer        : Win32.LPVOID;
      lpdwBufferLength      : Win32.LPDWORD;
      lpAliasBuffer         : Win32.LPWSTR;
      lpdwAliasBufferLength : Win32.LPDWORD)
      return Win32.INT;

   function GetTypeByNameA
     (lpServiceName : Win32.LPSTR;
      lpServiceType : Win32.Objbase.LPGUID)
      return Win32.INT;

   function GetTypeByName
     (lpServiceName : Win32.LPSTR;
      lpServiceType : Win32.Objbase.LPGUID)
      return Win32.INT renames GetTypeByNameA;

   function GetTypeByNameW
     (lpServiceName : Win32.LPWSTR;
      lpServiceType : Win32.Objbase.LPGUID)
      return Win32.INT;

   function GetNameByTypeA
     (lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      dwNameLength  : Win32.DWORD)
      return Win32.INT;

   function GetNameByType
     (lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      dwNameLength  : Win32.DWORD)
      return Win32.INT renames GetNameByTypeA;

   function GetNameByTypeW
     (lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPWSTR;
      dwNameLength  : Win32.DWORD)
      return Win32.INT;

   function SetServiceA
     (dwNameSpace        : Win32.DWORD;
      dwOperation        : Win32.DWORD;
      dwFlags            : Win32.DWORD;
      lpServiceInfo      : LPSERVICE_INFOA;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpdwStatusFlags    : Win32.LPDWORD)
      return Win32.INT;

   function SetService
     (dwNameSpace        : Win32.DWORD;
      dwOperation        : Win32.DWORD;
      dwFlags            : Win32.DWORD;
      lpServiceInfo      : LPSERVICE_INFOA;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpdwStatusFlags    : Win32.LPDWORD)
      return Win32.INT renames SetServiceA;

   function SetServiceW
     (dwNameSpace        : Win32.DWORD;
      dwOperation        : Win32.DWORD;
      dwFlags            : Win32.DWORD;
      lpServiceInfo      : LPSERVICE_INFOW;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpdwStatusFlags    : Win32.LPDWORD)
      return Win32.INT;

   function GetServiceA
     (dwNameSpace        : Win32.DWORD;
      lpGuid             : Win32.Objbase.LPGUID;
      lpServiceName      : Win32.LPSTR;
      dwProperties       : Win32.DWORD;
      lpBuffer           : Win32.LPVOID;
      lpdwBufferSize     : Win32.LPDWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO)
      return Win32.INT;

   function GetService
     (dwNameSpace        : Win32.DWORD;
      lpGuid             : Win32.Objbase.LPGUID;
      lpServiceName      : Win32.LPSTR;
      dwProperties       : Win32.DWORD;
      lpBuffer           : Win32.LPVOID;
      lpdwBufferSize     : Win32.LPDWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO)
      return Win32.INT renames GetServiceA;

   function GetServiceW
     (dwNameSpace        : Win32.DWORD;
      lpGuid             : Win32.Objbase.LPGUID;
      lpServiceName      : Win32.LPWSTR;
      dwProperties       : Win32.DWORD;
      lpBuffer           : Win32.LPVOID;
      lpdwBufferSize     : Win32.LPDWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO)
      return Win32.INT;

private

   pragma Convention (C_Pass_By_Copy, NS_INFOA);
   pragma Convention (C_Pass_By_Copy, NS_INFOW);
   pragma Convention (C, SERVICE_TYPE_VALUE);
   pragma Convention (C, SERVICE_TYPE_VALUE_ABSA);
   pragma Convention (C, SERVICE_TYPE_VALUE_ABSW);
   pragma Convention (C, SERVICE_TYPE_INFO);
   pragma Convention (C, SERVICE_TYPE_INFO_ABSA);
   pragma Convention (C, SERVICE_TYPE_INFO_ABSW);
   pragma Convention (C, SERVICE_ADDRESS);
   pragma Convention (C, SERVICE_ADDRESSES);
   pragma Convention (C, SERVICE_INFOA);
   pragma Convention (C, SERVICE_INFOW);
   pragma Convention (C, NS_SERVICE_INFOA);
   pragma Convention (C, NS_SERVICE_INFOW);
   pragma Convention (C_Pass_By_Copy, SOCKET_ADDRESS);
   pragma Convention (C, CSADDR_INFO);
   pragma Convention (C, PROTOCOL_INFOA);
   pragma Convention (C, PROTOCOL_INFOW);
   pragma Convention (C, NETRESOURCE2A);
   pragma Convention (C, NETRESOURCE2W);
   pragma Convention (C_Pass_By_Copy, SERVICE_ASYNC_INFO);

   pragma Import (Stdcall, EnumProtocolsA, "EnumProtocolsA");
   pragma Import (Stdcall, EnumProtocolsW, "EnumProtocolsW");
   pragma Import (Stdcall, GetAddressByNameA, "GetAddressByNameA");
   pragma Import (Stdcall, GetAddressByNameW, "GetAddressByNameW");
   pragma Import (Stdcall, GetTypeByNameA, "GetTypeByNameA");
   pragma Import (Stdcall, GetTypeByNameW, "GetTypeByNameW");
   pragma Import (Stdcall, GetNameByTypeA, "GetNameByTypeA");
   pragma Import (Stdcall, GetNameByTypeW, "GetNameByTypeW");
   pragma Import (Stdcall, SetServiceA, "SetServiceA");
   pragma Import (Stdcall, SetServiceW, "SetServiceW");
   pragma Import (Stdcall, GetServiceA, "GetServiceA");
   pragma Import (Stdcall, GetServiceW, "GetServiceW");

end Win32.Nspapi;
