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
with Win32.Windef;
with Win32.Winnt;

package Win32.Ras is

   use type Interfaces.C.char_array;

   RAS_MaxEntryName                 : constant := 20;
   RAS_MaxDeviceName                : constant := 32;
   RAS_MaxDeviceType                : constant := 16;
   RAS_MaxParamKey                  : constant := 32;
   RAS_MaxParamValue                : constant := 128;
   RAS_MaxPhoneNumber               : constant := 128;
   RAS_MaxCallbackNumber            : constant := 48;
   RAS_MaxIpAddress                 : constant := 15;
   RAS_MaxIpxAddress                : constant := 21;
   RASCS_PAUSED                     : constant := 16#1000#;
   RASCS_DONE                       : constant := 16#2000#;
   RDEOPT_UsePrefixSuffix           : constant := 16#1#;
   RDEOPT_PausedStates              : constant := 16#2#;
   RDEOPT_IgnoreModemSpeaker        : constant := 16#4#;
   RDEOPT_SetModemSpeaker           : constant := 16#8#;
   RDEOPT_IgnoreSoftwareCompression : constant := 16#10#;
   RDEOPT_SetSoftwareCompression    : constant := 16#20#;
   RASDIALEVENT                     : constant CHAR_Array :=
      "RasDialEvent" & Nul;
   WM_RASDIALEVENT                  : constant := 16#cccd#;

   type tagRASCONNSTATE is (
      RASCS_OpenPort,
      RASCS_PortOpened,
      RASCS_ConnectDevice,
      RASCS_DeviceConnected,
      RASCS_AllDevicesConnected,
      RASCS_Authenticate,
      RASCS_AuthNotify,
      RASCS_AuthRetry,
      RASCS_AuthCallback,
      RASCS_AuthChangePassword,
      RASCS_AuthProject,
      RASCS_AuthLinkSpeed,
      RASCS_AuthAck,
      RASCS_ReAuthenticate,
      RASCS_Authenticated,
      RASCS_PrepareForCallback,
      RASCS_WaitForModemReset,
      RASCS_WaitForCallback,
      RASCS_Projected,
      RASCS_Interactive,
      RASCS_RetryAuthentication,
      RASCS_CallbackSetByCaller,
      RASCS_PasswordExpired,
      RASCS_Connected,
      RASCS_Disconnected);
   for tagRASCONNSTATE use
     (RASCS_OpenPort            => 0,
      RASCS_PortOpened          => 1,
      RASCS_ConnectDevice       => 2,
      RASCS_DeviceConnected     => 3,
      RASCS_AllDevicesConnected => 4,
      RASCS_Authenticate        => 5,
      RASCS_AuthNotify          => 6,
      RASCS_AuthRetry           => 7,
      RASCS_AuthCallback        => 8,
      RASCS_AuthChangePassword  => 9,
      RASCS_AuthProject         => 10,
      RASCS_AuthLinkSpeed       => 11,
      RASCS_AuthAck             => 12,
      RASCS_ReAuthenticate      => 13,
      RASCS_Authenticated       => 14,
      RASCS_PrepareForCallback  => 15,
      RASCS_WaitForModemReset   => 16,
      RASCS_WaitForCallback     => 17,
      RASCS_Projected           => 18,
      RASCS_Interactive         => 4096,
      RASCS_RetryAuthentication => 4097,
      RASCS_CallbackSetByCaller => 4098,
      RASCS_PasswordExpired     => 4099,
      RASCS_Connected           => 8192,
      RASCS_Disconnected        => 8193);
   for tagRASCONNSTATE'Size use 32;

   type tagRASPROJECTION is (RASP_PppIp, RASP_PppIpx, RASP_PppNbf, RASP_Amb);
   for tagRASPROJECTION use
     (RASP_PppIp  => 32801,
      RASP_PppIpx => 32811,
      RASP_PppNbf => 32831,
      RASP_Amb    => 65536);

   subtype HRASCONN is Win32.Winnt.HANDLE;

   type RASCONNW;
   type RASCONNA;
   type RASCONNSTATUSW;
   type RASCONNSTATUSA;
   type RASDIALPARAMSW;
   type RASDIALPARAMSA;
   type RASDIALEXTENSIONS;
   type RASENTRYNAMEW;
   type RASENTRYNAMEA;
   type RASAMBW;
   type RASAMBA;
   type RASPPPNBFW;
   type RASPPPNBFA;
   type RASIPXW;
   type RASPPPIPXA;
   type RASPPPIPW;
   type RASPPPIPA;

   type RASCONNW is record
      dwSize      : Win32.DWORD;
      hrasconn    : Win32.Ras.HRASCONN;
      szEntryName : Win32.WCHAR_Array (0 .. RAS_MaxEntryName);
   end record;

   type RASCONNA is record
      dwSize      : Win32.DWORD;
      hrasconn    : Win32.Ras.HRASCONN;
      szEntryName : Win32.CHAR_Array (0 .. RAS_MaxEntryName);
   end record;

   type RASCONN is access all RASCONNA;

   type LPRASCONNW is access all RASCONNW;
   type LPRASCONNA is access all RASCONNA;
   type LPRASCONN is access all RASCONN;

   type RASCONNSTATE is new tagRASCONNSTATE;

   type LPRASCONNSTATE is access all RASCONNSTATE;

   type RASCONNSTATUSW is record
      dwSize       : Win32.DWORD;
      rasconnstate : tagRASCONNSTATE;
      dwError      : Win32.DWORD;
      szDeviceType : Win32.WCHAR_Array (0 .. RAS_MaxDeviceType);
      szDeviceName : Win32.WCHAR_Array (0 .. RAS_MaxDeviceType);
   end record;

   type RASCONNSTATUSA is record
      dwSize       : Win32.DWORD;
      rasconnstate : tagRASCONNSTATE;
      dwError      : Win32.DWORD;
      szDeviceType : Win32.CHAR_Array (0 .. RAS_MaxDeviceType);
      szDeviceName : Win32.CHAR_Array (0 .. RAS_MaxDeviceType);
   end record;

   type RASCONNSTATUS is access all RASCONNSTATUSA;

   type LPRASCONNSTATUSW is access all RASCONNSTATUSW;
   type LPRASCONNSTATUSA is access all RASCONNSTATUSA;
   type LPRASCONNSTATUS is access all RASCONNSTATUS;

   type RASDIALPARAMSW is record
      dwSize           : Win32.DWORD;
      szEntryName      : Win32.WCHAR_Array (0 .. RAS_MaxEntryName);
      szPhoneNumber    : Win32.WCHAR_Array (0 .. RAS_MaxPhoneNumber);
      szCallbackNumber : Win32.WCHAR_Array (0 .. RAS_MaxCallbackNumber);
      szUserName       : Win32.WCHAR_Array (0 .. Win32.Lmcons.UNLEN);
      szPassword       : Win32.WCHAR_Array (0 .. Win32.Lmcons.PWLEN);
      szDomain         : Win32.WCHAR_Array (0 .. Win32.Lmcons.DNLEN);
   end record;

   type RASDIALPARAMSA is record
      dwSize           : Win32.DWORD;
      szEntryName      : Win32.CHAR_Array (0 .. RAS_MaxEntryName);
      szPhoneNumber    : Win32.CHAR_Array (0 .. RAS_MaxPhoneNumber);
      szCallbackNumber : Win32.CHAR_Array (0 .. RAS_MaxCallbackNumber);
      szUserName       : Win32.CHAR_Array (0 .. Win32.Lmcons.UNLEN);
      szPassword       : Win32.CHAR_Array (0 .. Win32.Lmcons.PWLEN);
      szDomain         : Win32.CHAR_Array (0 .. Win32.Lmcons.DNLEN);
   end record;

   type RASDIALPARAMS is access all RASDIALPARAMSA;

   type LPRASDIALPARAMSW is access all RASDIALPARAMSW;
   type LPRASDIALPARAMSA is access all RASDIALPARAMSA;
   type LPRASDIALPARAMS is access all RASDIALPARAMS;

   type RASDIALEXTENSIONS is record
      dwSize     : Win32.DWORD;
      dwfOptions : Win32.DWORD;
      hwndParent : Win32.Windef.HWND;
      reserved   : Win32.DWORD;
   end record;

   type LPRASDIALEXTENSIONS is access all RASDIALEXTENSIONS;

   type RASENTRYNAMEW is record
      dwSize      : Win32.DWORD;
      szEntryName : Win32.WCHAR_Array (0 .. RAS_MaxEntryName);
   end record;

   type RASENTRYNAMEA is record
      dwSize      : Win32.DWORD;
      szEntryName : Win32.CHAR_Array (0 .. RAS_MaxEntryName);
   end record;

   type RASENTRYNAME is access all RASENTRYNAMEA;

   type LPRASENTRYNAMEW is access all RASENTRYNAMEW;
   type LPRASENTRYNAMEA is access all RASENTRYNAMEA;
   type LPRASENTRYNAME is access all RASENTRYNAME;

   type RASPROJECTION is new tagRASPROJECTION;

   type LPRASPROJECTION is access all RASPROJECTION;

   type RASAMBW is record
      dwSize         : Win32.DWORD;
      dwError        : Win32.DWORD;
      szNetBiosError : Win32.WCHAR_Array (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
      bLana          : Win32.BYTE;
   end record;

   type RASAMBA is record
      dwSize         : Win32.DWORD;
      dwError        : Win32.DWORD;
      szNetBiosError : Win32.CHAR_Array (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
      bLana          : Win32.BYTE;
   end record;

   subtype RASAMB is RASAMBA;
   type LPRASAMBW is access all RASAMBW;
   type LPRASAMBA is access all RASAMBA;
   type LPRASAMB is access all RASAMB;

   type RASPPPNBFW is record
      dwSize            : Win32.DWORD;
      dwError           : Win32.DWORD;
      dwNetBiosError    : Win32.DWORD;
      szNetBiosError    : Win32.WCHAR_Array (
         0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
      szWorkstationName : Win32.WCHAR_Array (
         0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
      bLana             : Win32.BYTE;
   end record;

   type RASPPPNBFA is record
      dwSize            : Win32.DWORD;
      dwError           : Win32.DWORD;
      dwNetBiosError    : Win32.DWORD;
      szNetBiosError    : Win32.CHAR_Array (
         0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
      szWorkstationName : Win32.CHAR_Array (
         0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
      bLana             : Win32.BYTE;
   end record;

   type RASPPPNBF is access all RASPPPNBFA;

   type LPRASPPPNBFW is access all RASPPPNBFW;
   type LPRASPPPNBFA is access all RASPPPNBFA;
   type LPRASPPPNBF is access all RASPPPNBF;

   type RASIPXW is record
      dwSize       : Win32.DWORD;
      dwError      : Win32.DWORD;
      szIpxAddress : Win32.WCHAR_Array (0 .. RAS_MaxIpxAddress);
   end record;

   type RASPPPIPXA is record
      dwSize       : Win32.DWORD;
      dwError      : Win32.DWORD;
      szIpxAddress : Win32.CHAR_Array (0 .. RAS_MaxIpxAddress);
   end record;

   type RASPPPIPX is access all RASPPPIPXA;

   type LPRASPPPIPXW is access all RASIPXW;
   type LPRASPPPIPXA is access all RASPPPIPXA;
   type LPRASPPPIPX is access all RASPPPIPX;

   type RASPPPIPW is record
      dwSize      : Win32.DWORD;
      dwError     : Win32.DWORD;
      szIpAddress : Win32.WCHAR_Array (0 .. RAS_MaxIpAddress);
   end record;

   type RASPPPIPA is record
      dwSize      : Win32.DWORD;
      dwError     : Win32.DWORD;
      szIpAddress : Win32.CHAR_Array (0 .. RAS_MaxIpAddress);
   end record;

   type RASPPPIP is access all RASPPPIPA;

   type LPRASPPPIPW is access all RASPPPIPW;
   type LPRASPPPIPA is access all RASPPPIPA;
   type LPRASPPPIP is access all RASPPPIP;

   type RASDIALFUNC is access procedure
     (unMsg        : Win32.UINT;
      RasConnState : tagRASCONNSTATE;
      dwError      : Win32.DWORD);
   pragma Convention (Stdcall, RASDIALFUNC);
   type RASDIALFUNC1 is access procedure
     (hRasConn        : Win32.Ras.HRASCONN;
      unMsg           : Win32.UINT;
      rascs           : tagRASCONNSTATE;
      dwError         : Win32.DWORD;
      dwExtendedError : Win32.DWORD);
   pragma Convention (Stdcall, RASDIALFUNC1);

   function RasDialA
     (lpRasDialExtensions : access RASDIALEXTENSIONS;
      lpszPhonebookPath   : Win32.LPSTR;
      lpRasDialParams     : access RASDIALPARAMSA;
      dwNotifierType      : Win32.DWORD;
      notifier            : Win32.LPVOID;
      lphRasConn          : access HRASCONN)
      return Win32.DWORD;

   function RasDial
     (lpRasDialExtensions : access RASDIALEXTENSIONS;
      lpszPhonebookPath   : Win32.LPSTR;
      lpRasDialParams     : access RASDIALPARAMSA;
      dwNotifierType      : Win32.DWORD;
      notifier            : Win32.LPVOID;
      lphRasConn          : access HRASCONN)
      return Win32.DWORD renames RasDialA;

   function RasDialW
     (lpRasDialExtensions : access RASDIALEXTENSIONS;
      lpszPhonebookPath   : Win32.LPWSTR;
      lpRasDialParams     : access RASDIALPARAMSW;
      dwNotifierType      : Win32.DWORD;
      notifier            : Win32.LPVOID;
      lphRasConn          : access HRASCONN)
      return Win32.DWORD;

   function RasEnumConnectionsA
     (lpRasConn      : access RASCONNA;
      lpcb           : Win32.LPDWORD;
      lpcConnections : Win32.LPDWORD)
      return Win32.DWORD;

   function RasEnumConnections
     (lpRasConn      : access RASCONNA;
      lpcb           : Win32.LPDWORD;
      lpcConnections : Win32.LPDWORD)
      return Win32.DWORD renames RasEnumConnectionsA;

   function RasEnumConnectionsW
     (lpRasConn      : access RASCONNW;
      lpcb           : Win32.LPDWORD;
      lpcConnections : Win32.LPDWORD)
      return Win32.DWORD;

   function RasEnumEntriesA
     (reserved          : Win32.LPSTR;
      lpszPhonebookPath : Win32.LPSTR;
      lpRasEntryname    : access RASENTRYNAMEA;
      lpcb              : Win32.LPDWORD;
      lpcEntries        : Win32.LPDWORD)
      return Win32.DWORD;

   function RasEnumEntries
     (reserved          : Win32.LPSTR;
      lpszPhonebookPath : Win32.LPSTR;
      lpRasEntryname    : access RASENTRYNAMEA;
      lpcb              : Win32.LPDWORD;
      lpcEntries        : Win32.LPDWORD)
      return Win32.DWORD renames RasEnumEntriesA;

   function RasEnumEntriesW
     (reserved          : Win32.LPWSTR;
      lpszPhonebookPath : Win32.LPWSTR;
      lpRasEntryname    : access RASENTRYNAMEW;
      lpcb              : Win32.LPDWORD;
      lpcEntries        : Win32.LPDWORD)
      return Win32.DWORD;

   function RasGetConnectStatusA
     (hRasConn        : Win32.Ras.HRASCONN;
      lprasconnstatus : access RASCONNSTATUSA)
      return Win32.DWORD;

   function RasGetConnectStatus
     (hRasConn        : Win32.Ras.HRASCONN;
      lprasconnstatus : access RASCONNSTATUSA)
      return Win32.DWORD renames RasGetConnectStatusA;

   function RasGetConnectStatusW
     (hRasConn        : Win32.Ras.HRASCONN;
      lprasconnstatus : access RASCONNSTATUSW)
      return Win32.DWORD;

   function RasGetErrorStringA
     (uErrorValue     : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize        : Win32.DWORD)
      return Win32.DWORD;

   function RasGetErrorString
     (uErrorValue     : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize        : Win32.DWORD)
      return Win32.DWORD renames RasGetErrorStringA;

   function RasGetErrorStringW
     (uErrorValue     : Win32.UINT;
      lpszErrorString : Win32.LPWSTR;
      cBufSize        : Win32.DWORD)
      return Win32.DWORD;

   function RasHangUpA (hRasConn : Win32.Ras.HRASCONN) return Win32.DWORD;

   function RasHangUp (hRasConn : Win32.Ras.HRASCONN) return Win32.DWORD
      renames RasHangUpA;

   function RasHangUpW (hRasConn : Win32.Ras.HRASCONN) return Win32.DWORD;

   function RasGetProjectionInfoA
     (hRasConn      : Win32.Ras.HRASCONN;
      Rasprojection : tagRASPROJECTION;
      lpProjection  : Win32.LPVOID;
      lpcb          : Win32.LPDWORD)
      return Win32.DWORD;

   function RasGetProjectionInfo
     (hRasConn      : Win32.Ras.HRASCONN;
      RasProjection : tagRASPROJECTION;
      lpProjection  : Win32.LPVOID;
      lpcb          : Win32.LPDWORD)
      return Win32.DWORD renames RasGetProjectionInfoA;

   function RasGetProjectionInfoW
     (hRasConn      : Win32.Ras.HRASCONN;
      RasProjection : tagRASPROJECTION;
      lpProjection  : Win32.LPVOID;
      lpcb          : Win32.LPDWORD)
      return Win32.DWORD;

private

   pragma Convention (C, RASCONNW);
   pragma Convention (C, RASCONNA);
   pragma Convention (C, RASCONNSTATUSW);
   pragma Convention (C, RASCONNSTATUSA);
   pragma Convention (C, RASDIALPARAMSW);
   pragma Convention (C, RASDIALPARAMSA);
   pragma Convention (C_Pass_By_Copy, RASDIALEXTENSIONS);
   pragma Convention (C, RASENTRYNAMEW);
   pragma Convention (C, RASENTRYNAMEA);
   pragma Convention (C, RASAMBW);
   pragma Convention (C, RASAMBA);
   pragma Convention (C, RASPPPNBFW);
   pragma Convention (C, RASPPPNBFA);
   pragma Convention (C, RASIPXW);
   pragma Convention (C, RASPPPIPXA);
   pragma Convention (C, RASPPPIPW);
   pragma Convention (C, RASPPPIPA);

   pragma Import (Stdcall, RasDialA, "RasDialA");
   pragma Import (Stdcall, RasDialW, "RasDialW");
   pragma Import (Stdcall, RasEnumConnectionsA, "RasEnumConnectionsA");
   pragma Import (Stdcall, RasEnumConnectionsW, "RasEnumConnectionsW");
   pragma Import (Stdcall, RasEnumEntriesA, "RasEnumEntriesA");
   pragma Import (Stdcall, RasEnumEntriesW, "RasEnumEntriesW");
   pragma Import (Stdcall, RasGetConnectStatusA, "RasGetConnectStatusA");
   pragma Import (Stdcall, RasGetConnectStatusW, "RasGetConnectStatusW");
   pragma Import (Stdcall, RasGetErrorStringA, "RasGetErrorStringA");
   pragma Import (Stdcall, RasGetErrorStringW, "RasGetErrorStringW");
   pragma Import (Stdcall, RasHangUpA, "RasHangUpA");
   pragma Import (Stdcall, RasHangUpW, "RasHangUpW");
   pragma Import (Stdcall, RasGetProjectionInfoA, "RasGetProjectionInfoA");
   pragma Import (Stdcall, RasGetProjectionInfoW, "RasGetProjectionInfoW");

end Win32.Ras;
