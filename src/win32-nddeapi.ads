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

package Win32.Nddeapi is

   use Interfaces;
   use type Interfaces.C.char_array;

   SEP_CHAR                     : constant := 44;
   BAR_CHAR                     : constant CHAR_Array  := "|" & Nul;
   BAR_WCHAR                    : constant WCHAR_Array :=
      To_Win (C.To_C ("|")) & Wide_Nul;
   NDDE_NO_ERROR                : constant := 0;
   NDDE_ACCESS_DENIED           : constant := 1;
   NDDE_BUF_TOO_SMALL           : constant := 2;
   NDDE_ERROR_MORE_DATA         : constant := 3;
   NDDE_INVALID_SERVER          : constant := 4;
   NDDE_INVALID_SHARE           : constant := 5;
   NDDE_INVALID_PARAMETER       : constant := 6;
   NDDE_INVALID_LEVEL           : constant := 7;
   NDDE_INVALID_PASSWORD        : constant := 8;
   NDDE_INVALID_ITEMNAME        : constant := 9;
   NDDE_INVALID_TOPIC           : constant := 10;
   NDDE_INTERNAL_ERROR          : constant := 11;
   NDDE_OUT_OF_MEMORY           : constant := 12;
   NDDE_INVALID_APPNAME         : constant := 13;
   NDDE_NOT_IMPLEMENTED         : constant := 14;
   NDDE_SHARE_ALREADY_EXIST     : constant := 15;
   NDDE_SHARE_NOT_EXIST         : constant := 16;
   NDDE_INVALID_FILENAME        : constant := 17;
   NDDE_NOT_RUNNING             : constant := 18;
   NDDE_INVALID_WINDOW          : constant := 19;
   NDDE_INVALID_SESSION         : constant := 20;
   NDDE_INVALID_ITEM_LIST       : constant := 21;
   NDDE_SHARE_DATA_CORRUPTED    : constant := 22;
   NDDE_REGISTRY_ERROR          : constant := 23;
   NDDE_CANT_ACCESS_SERVER      : constant := 24;
   NDDE_INVALID_SPECIAL_COMMAND : constant := 25;
   NDDE_INVALID_SECURITY_DESC   : constant := 26;
   NDDE_TRUST_SHARE_FAIL        : constant := 27;
   MAX_NDDESHARENAME            : constant := 256;
   MAX_DOMAINNAME               : constant := 15;
   MAX_USERNAME                 : constant := 15;
   MAX_APPNAME                  : constant := 255;
   MAX_TOPICNAME                : constant := 255;
   MAX_ITEMNAME                 : constant := 255;
   NDDEF_NOPASSWORDPROMPT       : constant := 16#1#;
   NDDEF_NOCACHELOOKUP          : constant := 16#2#;
   NDDEF_STRIP_NDDE             : constant := 16#4#;
   SHARE_TYPE_OLD               : constant := 16#1#;
   SHARE_TYPE_NEW               : constant := 16#2#;
   SHARE_TYPE_STATIC            : constant := 16#4#;
   NDDE_TRUST_SHARE_START       : constant := 16#80000000#;
   NDDE_TRUST_SHARE_INIT        : constant := 16#40000000#;
   NDDE_TRUST_SHARE_DEL         : constant := 16#20000000#;
   NDDE_TRUST_CMD_SHOW          : constant := 16#10000000#;
   NDDE_CMD_SHOW_MASK           : constant := 16#ffff#;

   type NDDESHAREINFO;

   type PNDDESHAREINFO is access all NDDESHAREINFO;

   type NDDESHAREINFO is record
      lRevision        : Win32.LONG;
      lpszShareName    : Win32.Winnt.LPTSTR;
      lShareType       : Win32.LONG;
      lpszAppTopicList : Win32.Winnt.LPTSTR;
      fSharedFlag      : Win32.LONG;
      fService         : Win32.LONG;
      fStartAppFlag    : Win32.LONG;
      nCmdShow         : Win32.LONG;
      qModifyId        : Win32.LONG_Array (0 .. 1);
      cNumItems        : Win32.LONG;
      lpszItemList     : Win32.Winnt.LPTSTR;
   end record;

   function NDdeShareAddA
     (lpszServer : Win32.LPSTR;
      nLevel     : Win32.UINT;
      pSD        : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpBuffer   : Win32.LPBYTE;
      cBufSize   : Win32.DWORD)
      return Win32.UINT;

   function NDdeShareAdd
     (lpszServer : Win32.LPSTR;
      nLevel     : Win32.UINT;
      pSD        : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpBuffer   : Win32.LPBYTE;
      cBufSize   : Win32.DWORD)
      return Win32.UINT renames NDdeShareAddA;

   function NDdeShareAddW
     (lpszServer : Win32.LPWSTR;
      nLevel     : Win32.UINT;
      pSD        : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpBuffer   : Win32.LPBYTE;
      cBufSize   : Win32.DWORD)
      return Win32.UINT;

   function NDdeShareDelA
     (lpszServer    : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      wReserved     : Win32.UINT)
      return Win32.UINT;

   function NDdeShareDel
     (lpszServer    : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      wReserved     : Win32.UINT)
      return Win32.UINT renames NDdeShareDelA;

   function NDdeShareDelW
     (lpszServer    : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      wReserved     : Win32.UINT)
      return Win32.UINT;

   function NDdeGetShareSecurityA
     (lpszServer     : Win32.LPSTR;
      lpszShareName  : Win32.LPSTR;
      si             : Win32.Winnt.SECURITY_INFORMATION;
      pSD            : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbSD           : Win32.DWORD;
      lpcbsdRequired : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeGetShareSecurity
     (lpszServer     : Win32.LPSTR;
      lpszShareName  : Win32.LPSTR;
      si             : Win32.Winnt.SECURITY_INFORMATION;
      pSD            : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbSD           : Win32.DWORD;
      lpcbsdRequired : Win32.LPDWORD)
      return Win32.UINT renames NDdeGetShareSecurityA;

   function NDdeGetShareSecurityW
     (lpszServer     : Win32.LPWSTR;
      lpszShareName  : Win32.LPWSTR;
      si             : Win32.Winnt.SECURITY_INFORMATION;
      pSD            : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbSD           : Win32.DWORD;
      lpcbsdRequired : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeSetShareSecurityA
     (lpszServer    : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      si            : Win32.Winnt.SECURITY_INFORMATION;
      pSD           : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.UINT;

   function NDdeSetShareSecurity
     (lpszServer    : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      si            : Win32.Winnt.SECURITY_INFORMATION;
      pSD           : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.UINT renames NDdeSetShareSecurityA;

   function NDdeSetShareSecurityW
     (lpszServer    : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      si            : Win32.Winnt.SECURITY_INFORMATION;
      pSD           : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.UINT;

   function NDdeShareEnumA
     (lpszServer         : Win32.LPSTR;
      nLevel             : Win32.UINT;
      lpBuffer           : Win32.LPBYTE;
      cBufSize           : Win32.DWORD;
      lpnEntriesRead     : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeShareEnum
     (lpszServer         : Win32.LPSTR;
      nLevel             : Win32.UINT;
      lpBuffer           : Win32.LPBYTE;
      cBufSize           : Win32.DWORD;
      lpnEntriesRead     : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
      return Win32.UINT renames NDdeShareEnumA;

   function NDdeShareEnumW
     (lpszServer         : Win32.LPWSTR;
      nLevel             : Win32.UINT;
      lpBuffer           : Win32.LPBYTE;
      cBufSize           : Win32.DWORD;
      lpnEntriesRead     : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeShareGetInfoA
     (lpszServer        : Win32.LPSTR;
      lpszShareName     : Win32.LPSTR;
      nLevel            : Win32.UINT;
      lpBuffer          : Win32.LPBYTE;
      cBufSize          : Win32.DWORD;
      lpnTotalAvailable : Win32.LPDWORD;
      lpnItems          : Win32.LPWORD)
      return Win32.UINT;

   function NDdeShareGetInfo
     (lpszServer        : Win32.LPSTR;
      lpszShareName     : Win32.LPSTR;
      nLevel            : Win32.UINT;
      lpBuffer          : Win32.LPBYTE;
      cBufSize          : Win32.DWORD;
      lpnTotalAvailable : Win32.LPDWORD;
      lpnItems          : Win32.LPWORD)
      return Win32.UINT renames NDdeShareGetInfoA;

   function NDdeShareGetInfoW
     (lpszServer        : Win32.LPWSTR;
      lpszShareName     : Win32.LPWSTR;
      nLevel            : Win32.UINT;
      lpBuffer          : Win32.LPBYTE;
      cBufSize          : Win32.DWORD;
      lpnTotalAvailable : Win32.LPDWORD;
      lpnItems          : Win32.LPWORD)
      return Win32.UINT;

   function NDdeShareSetInfoA
     (lpszServer    : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      nLevel        : Win32.UINT;
      lpBuffer      : Win32.LPBYTE;
      cBufSize      : Win32.DWORD;
      sParmNum      : Win32.WORD)
      return Win32.UINT;

   function NDdeShareSetInfo
     (lpszServer    : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      nLevel        : Win32.UINT;
      lpBuffer      : Win32.LPBYTE;
      cBufSize      : Win32.DWORD;
      sParmNum      : Win32.WORD)
      return Win32.UINT renames NDdeShareSetInfoA;

   function NDdeShareSetInfoW
     (lpszServer    : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      nLevel        : Win32.UINT;
      lpBuffer      : Win32.LPBYTE;
      cBufSize      : Win32.DWORD;
      sParmNum      : Win32.WORD)
      return Win32.UINT;

   function NDdeSetTrustedShareA
     (lpszServer     : Win32.LPSTR;
      lpszShareName  : Win32.LPSTR;
      dwTrustOptions : Win32.DWORD)
      return Win32.UINT;

   function NDdeSetTrustedShare
     (lpszServer     : Win32.LPSTR;
      lpszShareName  : Win32.LPSTR;
      dwTrustOptions : Win32.DWORD)
      return Win32.UINT renames NDdeSetTrustedShareA;

   function NDdeSetTrustedShareW
     (lpszServer     : Win32.LPWSTR;
      lpszShareName  : Win32.LPWSTR;
      dwTrustOptions : Win32.DWORD)
      return Win32.UINT;

   function NDdeGetTrustedShareA
     (lpszServer       : Win32.LPSTR;
      lpszShareName    : Win32.LPSTR;
      lpdwTrustOptions : Win32.LPDWORD;
      lpdwShareModId0  : Win32.LPDWORD;
      lpdwShareModId1  : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeGetTrustedShare
     (lpszServer       : Win32.LPSTR;
      lpszShareName    : Win32.LPSTR;
      lpdwTrustOptions : Win32.LPDWORD;
      lpdwShareModId0  : Win32.LPDWORD;
      lpdwShareModId1  : Win32.LPDWORD)
      return Win32.UINT renames NDdeGetTrustedShareA;

   function NDdeGetTrustedShareW
     (lpszServer       : Win32.LPWSTR;
      lpszShareName    : Win32.LPWSTR;
      lpdwTrustOptions : Win32.LPDWORD;
      lpdwShareModId0  : Win32.LPDWORD;
      lpdwShareModId1  : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeTrustedShareEnumA
     (lpszServer         : Win32.LPSTR;
      nLevel             : Win32.UINT;
      lpBuffer           : Win32.LPBYTE;
      cBufSize           : Win32.DWORD;
      lpnEntriesRead     : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeTrustedShareEnum
     (lpszServer         : Win32.LPSTR;
      nLevel             : Win32.UINT;
      lpBuffer           : Win32.LPBYTE;
      cBufSize           : Win32.DWORD;
      lpnEntriesRead     : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
      return Win32.UINT renames NDdeTrustedShareEnumA;

   function NDdeTrustedShareEnumW
     (lpszServer         : Win32.LPWSTR;
      nLevel             : Win32.UINT;
      lpBuffer           : Win32.LPBYTE;
      cBufSize           : Win32.DWORD;
      lpnEntriesRead     : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
      return Win32.UINT;

   function NDdeGetErrorStringA
     (uErrorCode      : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize        : Win32.DWORD)
      return Win32.UINT;

   function NDdeGetErrorString
     (uErrorCode      : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize        : Win32.DWORD)
      return Win32.UINT renames NDdeGetErrorStringA;

   function NDdeGetErrorStringW
     (uErrorCode      : Win32.UINT;
      lpszErrorString : Win32.LPWSTR;
      cBufSize        : Win32.DWORD)
      return Win32.UINT;

   function NDdeIsValidShareNameA
     (shareName : Win32.LPSTR)
      return Win32.BOOL;

   function NDdeIsValidShareName
     (shareName : Win32.LPSTR)
      return Win32.BOOL renames NDdeIsValidShareNameA;

   function NDdeIsValidShareNameW
     (shareName : Win32.LPWSTR)
      return Win32.BOOL;

   function NDdeIsValidAppTopicListA
     (targetTopic : Win32.LPSTR)
      return Win32.BOOL;

   function NDdeIsValidAppTopicList
     (targetTopic : Win32.LPSTR)
      return Win32.BOOL renames NDdeIsValidAppTopicListA;

   function NDdeIsValidAppTopicListW
     (targetTopic : Win32.LPWSTR)
      return Win32.BOOL;

private

   pragma Convention (C, NDDESHAREINFO);

   pragma Import (Stdcall, NDdeShareAddA, "NDdeShareAddA");
   pragma Import (Stdcall, NDdeShareAddW, "NDdeShareAddW");
   pragma Import (Stdcall, NDdeShareDelA, "NDdeShareDelA");
   pragma Import (Stdcall, NDdeShareDelW, "NDdeShareDelW");
   pragma Import (Stdcall, NDdeGetShareSecurityA, "NDdeGetShareSecurityA");
   pragma Import (Stdcall, NDdeGetShareSecurityW, "NDdeGetShareSecurityW");
   pragma Import (Stdcall, NDdeSetShareSecurityA, "NDdeSetShareSecurityA");
   pragma Import (Stdcall, NDdeSetShareSecurityW, "NDdeSetShareSecurityW");
   pragma Import (Stdcall, NDdeShareEnumA, "NDdeShareEnumA");
   pragma Import (Stdcall, NDdeShareEnumW, "NDdeShareEnumW");
   pragma Import (Stdcall, NDdeShareGetInfoA, "NDdeShareGetInfoA");
   pragma Import (Stdcall, NDdeShareGetInfoW, "NDdeShareGetInfoW");
   pragma Import (Stdcall, NDdeShareSetInfoA, "NDdeShareSetInfoA");
   pragma Import (Stdcall, NDdeShareSetInfoW, "NDdeShareSetInfoW");
   pragma Import (Stdcall, NDdeSetTrustedShareA, "NDdeSetTrustedShareA");
   pragma Import (Stdcall, NDdeSetTrustedShareW, "NDdeSetTrustedShareW");
   pragma Import (Stdcall, NDdeGetTrustedShareA, "NDdeGetTrustedShareA");
   pragma Import (Stdcall, NDdeGetTrustedShareW, "NDdeGetTrustedShareW");
   pragma Import (Stdcall, NDdeTrustedShareEnumA, "NDdeTrustedShareEnumA");
   pragma Import (Stdcall, NDdeTrustedShareEnumW, "NDdeTrustedShareEnumW");
   pragma Import (Stdcall, NDdeGetErrorStringA, "NDdeGetErrorStringA");
   pragma Import (Stdcall, NDdeGetErrorStringW, "NDdeGetErrorStringW");
   pragma Import (Stdcall, NDdeIsValidShareNameA, "NDdeIsValidShareNameA");
   pragma Import (Stdcall, NDdeIsValidShareNameW, "NDdeIsValidShareNameW");
   pragma Import
     (Stdcall,
      NDdeIsValidAppTopicListA,
      "NDdeIsValidAppTopicListA");
   pragma Import
     (Stdcall,
      NDdeIsValidAppTopicListW,
      "NDdeIsValidAppTopicListW");

end Win32.Nddeapi;
