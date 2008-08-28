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

package Win32.Nddeapi is

   use Interfaces;
   use type Interfaces.C.char_array;

   SEP_CHAR : constant := 44;          --  nddeapi.h:24
   BAR_CHAR : constant CHAR_Array := "|" & Nul;
   --  nddeapi.h:25
   BAR_WCHAR : constant WCHAR_Array :=
     To_Win (C.To_C ("|")) & Wide_Nul;
   --  nddeapi.h:27
   NDDE_NO_ERROR                : constant := 0;            --  nddeapi.h:30
   NDDE_ACCESS_DENIED           : constant := 1;            --  nddeapi.h:31
   NDDE_BUF_TOO_SMALL           : constant := 2;            --  nddeapi.h:32
   NDDE_ERROR_MORE_DATA         : constant := 3;            --  nddeapi.h:33
   NDDE_INVALID_SERVER          : constant := 4;            --  nddeapi.h:34
   NDDE_INVALID_SHARE           : constant := 5;            --  nddeapi.h:35
   NDDE_INVALID_PARAMETER       : constant := 6;            --  nddeapi.h:36
   NDDE_INVALID_LEVEL           : constant := 7;            --  nddeapi.h:37
   NDDE_INVALID_PASSWORD        : constant := 8;            --  nddeapi.h:38
   NDDE_INVALID_ITEMNAME        : constant := 9;            --  nddeapi.h:39
   NDDE_INVALID_TOPIC           : constant := 10;           --  nddeapi.h:40
   NDDE_INTERNAL_ERROR          : constant := 11;           --  nddeapi.h:41
   NDDE_OUT_OF_MEMORY           : constant := 12;           --  nddeapi.h:42
   NDDE_INVALID_APPNAME         : constant := 13;           --  nddeapi.h:43
   NDDE_NOT_IMPLEMENTED         : constant := 14;           --  nddeapi.h:44
   NDDE_SHARE_ALREADY_EXIST     : constant := 15;           --  nddeapi.h:45
   NDDE_SHARE_NOT_EXIST         : constant := 16;           --  nddeapi.h:46
   NDDE_INVALID_FILENAME        : constant := 17;           --  nddeapi.h:47
   NDDE_NOT_RUNNING             : constant := 18;           --  nddeapi.h:48
   NDDE_INVALID_WINDOW          : constant := 19;           --  nddeapi.h:49
   NDDE_INVALID_SESSION         : constant := 20;           --  nddeapi.h:50
   NDDE_INVALID_ITEM_LIST       : constant := 21;           --  nddeapi.h:51
   NDDE_SHARE_DATA_CORRUPTED    : constant := 22;           --  nddeapi.h:52
   NDDE_REGISTRY_ERROR          : constant := 23;           --  nddeapi.h:53
   NDDE_CANT_ACCESS_SERVER      : constant := 24;           --  nddeapi.h:54
   NDDE_INVALID_SPECIAL_COMMAND : constant := 25;           --  nddeapi.h:55
   NDDE_INVALID_SECURITY_DESC   : constant := 26;           --  nddeapi.h:56
   NDDE_TRUST_SHARE_FAIL        : constant := 27;           --  nddeapi.h:57
   MAX_NDDESHARENAME            : constant := 256;          --  nddeapi.h:60
   MAX_DOMAINNAME               : constant := 15;           --  nddeapi.h:61
   MAX_USERNAME                 : constant := 15;           --  nddeapi.h:62
   MAX_APPNAME                  : constant := 255;          --  nddeapi.h:63
   MAX_TOPICNAME                : constant := 255;          --  nddeapi.h:64
   MAX_ITEMNAME                 : constant := 255;          --  nddeapi.h:65
   NDDEF_NOPASSWORDPROMPT       : constant := 16#1#;        --  nddeapi.h:68
   NDDEF_NOCACHELOOKUP          : constant := 16#2#;        --  nddeapi.h:69
   NDDEF_STRIP_NDDE             : constant := 16#4#;        --  nddeapi.h:70
   SHARE_TYPE_OLD               : constant := 16#1#;        --  nddeapi.h:92
   SHARE_TYPE_NEW               : constant := 16#2#;        --  nddeapi.h:93
   SHARE_TYPE_STATIC            : constant := 16#4#;        --  nddeapi.h:94
   NDDE_TRUST_SHARE_START       : constant := 16#80000000#; --  nddeapi.h :268
   NDDE_TRUST_SHARE_INIT        : constant := 16#40000000#; --  nddeapi.h:269
   NDDE_TRUST_SHARE_DEL         : constant := 16#20000000#; --  nddeapi.h:270
   NDDE_TRUST_CMD_SHOW          : constant := 16#10000000#; --  nddeapi.h:271
   NDDE_CMD_SHOW_MASK           : constant := 16#ffff#;     --  nddeapi.h:272

   type NDDESHAREINFO;                                     --  nddeapi.h:75

   type PNDDESHAREINFO is access all NDDESHAREINFO;        --  nddeapi.h:89

   type NDDESHAREINFO is                                   --  nddeapi.h:75
      record
         lRevision : Win32.LONG;                   --  nddeapi.h:76
         lpszShareName : Win32.Winnt.LPTSTR;           --  nddeapi.h:77
         lShareType : Win32.LONG;                   --  nddeapi.h:78
         lpszAppTopicList : Win32.Winnt.LPTSTR;           --  nddeapi.h:79
         fSharedFlag : Win32.LONG;                   --  nddeapi.h:80
         fService : Win32.LONG;                   --  nddeapi.h:81
         fStartAppFlag : Win32.LONG;                   --  nddeapi.h:82
         nCmdShow : Win32.LONG;                   --  nddeapi.h:83
         qModifyId : Win32.LONG_Array (0 .. 1);       --  nddeapi.h:84
         cNumItems : Win32.LONG;                   --  nddeapi.h:85
         lpszItemList : Win32.Winnt.LPTSTR;           --  nddeapi.h:86
      end record;

   function NDdeShareAddA
     (lpszServer : Win32.LPSTR;
      nLevel : Win32.UINT;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD)
     return Win32.UINT;                           --  nddeapi.h:100

   function NDdeShareAdd
     (lpszServer : Win32.LPSTR;
      nLevel : Win32.UINT;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD)
     return Win32.UINT
     renames NDdeShareAddA;                       --  nddeapi.h:100

   function NDdeShareAddW
     (lpszServer : Win32.LPWSTR;
      nLevel : Win32.UINT;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD)
     return Win32.UINT;                           --  nddeapi.h:109

   function NDdeShareDelA
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      wReserved : Win32.UINT)
     return Win32.UINT;                           --  nddeapi.h:121

   function NDdeShareDel
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      wReserved : Win32.UINT)
     return Win32.UINT
     renames NDdeShareDelA;                       --  nddeapi.h:121

   function NDdeShareDelW
     (lpszServer : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      wReserved : Win32.UINT)
     return Win32.UINT;                           --  nddeapi.h:128

   function NDdeGetShareSecurityA
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      si : Win32.Winnt.SECURITY_INFORMATION;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbSD : Win32.DWORD;
      lpcbsdRequired : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:139

   function NDdeGetShareSecurity
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      si : Win32.Winnt.SECURITY_INFORMATION;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbSD : Win32.DWORD;
      lpcbsdRequired : Win32.LPDWORD)
     return Win32.UINT
     renames NDdeGetShareSecurityA;               --  nddeapi.h:139

   function NDdeGetShareSecurityW
     (lpszServer : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      si : Win32.Winnt.SECURITY_INFORMATION;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR;
      cbSD : Win32.DWORD;
      lpcbsdRequired : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:149

   function NDdeSetShareSecurityA
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      si : Win32.Winnt.SECURITY_INFORMATION;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.UINT;                           --  nddeapi.h:163

   function NDdeSetShareSecurity
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      si : Win32.Winnt.SECURITY_INFORMATION;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.UINT
     renames NDdeSetShareSecurityA;               --  nddeapi.h:163

   function NDdeSetShareSecurityW
     (lpszServer : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      si : Win32.Winnt.SECURITY_INFORMATION;
      pSD : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.UINT;                           --  nddeapi.h:171

   function NDdeShareEnumA
     (lpszServer : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnEntriesRead : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:182

   function NDdeShareEnum
     (lpszServer : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnEntriesRead : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
     return Win32.UINT
     renames NDdeShareEnumA;                      --  nddeapi.h:182

   function NDdeShareEnumW
     (lpszServer : Win32.LPWSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnEntriesRead : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:192

   function NDdeShareGetInfoA
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnTotalAvailable : Win32.LPDWORD;
      lpnItems : Win32.LPWORD)
     return Win32.UINT;                           --  nddeapi.h:205

   function NDdeShareGetInfo
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnTotalAvailable : Win32.LPDWORD;
      lpnItems : Win32.LPWORD)
     return Win32.UINT
     renames NDdeShareGetInfoA;                   --  nddeapi.h:205

   function NDdeShareGetInfoW
     (lpszServer : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnTotalAvailable : Win32.LPDWORD;
      lpnItems : Win32.LPWORD)
     return Win32.UINT;                           --  nddeapi.h:216

   function NDdeShareSetInfoA
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      sParmNum : Win32.WORD)
     return Win32.UINT;                           --  nddeapi.h:230

   function NDdeShareSetInfo
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      sParmNum : Win32.WORD)
     return Win32.UINT
     renames NDdeShareSetInfoA;                   --  nddeapi.h:230

   function NDdeShareSetInfoW
     (lpszServer : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      sParmNum : Win32.WORD)
     return Win32.UINT;                           --  nddeapi.h:240

   function NDdeSetTrustedShareA
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      dwTrustOptions : Win32.DWORD)
     return Win32.UINT;                           --  nddeapi.h:254

   function NDdeSetTrustedShare
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      dwTrustOptions : Win32.DWORD)
     return Win32.UINT
     renames NDdeSetTrustedShareA;                --  nddeapi.h:254

   function NDdeSetTrustedShareW
     (lpszServer : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      dwTrustOptions : Win32.DWORD)
     return Win32.UINT;                           --  nddeapi.h:261

   function NDdeGetTrustedShareA
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      lpdwTrustOptions : Win32.LPDWORD;
      lpdwShareModId0 : Win32.LPDWORD;
      lpdwShareModId1 : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:279

   function NDdeGetTrustedShare
     (lpszServer : Win32.LPSTR;
      lpszShareName : Win32.LPSTR;
      lpdwTrustOptions : Win32.LPDWORD;
      lpdwShareModId0 : Win32.LPDWORD;
      lpdwShareModId1 : Win32.LPDWORD)
     return Win32.UINT
     renames NDdeGetTrustedShareA;                --  nddeapi.h:279

   function NDdeGetTrustedShareW
     (lpszServer : Win32.LPWSTR;
      lpszShareName : Win32.LPWSTR;
      lpdwTrustOptions : Win32.LPDWORD;
      lpdwShareModId0 : Win32.LPDWORD;
      lpdwShareModId1 : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:288

   function NDdeTrustedShareEnumA
     (lpszServer : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnEntriesRead : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:301

   function NDdeTrustedShareEnum
     (lpszServer : Win32.LPSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnEntriesRead : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
     return Win32.UINT
     renames NDdeTrustedShareEnumA;               --  nddeapi.h:301

   function NDdeTrustedShareEnumW
     (lpszServer : Win32.LPWSTR;
      nLevel : Win32.UINT;
      lpBuffer : Win32.LPBYTE;
      cBufSize : Win32.DWORD;
      lpnEntriesRead : Win32.LPDWORD;
      lpcbTotalAvailable : Win32.LPDWORD)
     return Win32.UINT;                           --  nddeapi.h:311

   function NDdeGetErrorStringA
     (uErrorCode : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize : Win32.DWORD)
     return Win32.UINT;                           --  nddeapi.h:324

   function NDdeGetErrorString
     (uErrorCode : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize : Win32.DWORD)
     return Win32.UINT
     renames NDdeGetErrorStringA;                 --  nddeapi.h:324

   function NDdeGetErrorStringW
     (uErrorCode : Win32.UINT;
      lpszErrorString : Win32.LPWSTR;
      cBufSize : Win32.DWORD)
     return Win32.UINT;                           --  nddeapi.h:331

   function NDdeIsValidShareNameA
     (shareName : Win32.LPSTR)
     return Win32.BOOL;                           --  nddeapi.h:341

   function NDdeIsValidShareName
     (shareName : Win32.LPSTR)
     return Win32.BOOL
     renames NDdeIsValidShareNameA;               --  nddeapi.h:341

   function NDdeIsValidShareNameW
     (shareName : Win32.LPWSTR)
     return Win32.BOOL;                           --  nddeapi.h:346

   function NDdeIsValidAppTopicListA
     (targetTopic : Win32.LPSTR)
     return Win32.BOOL;                           --  nddeapi.h:354

   function NDdeIsValidAppTopicList
     (targetTopic : Win32.LPSTR)
     return Win32.BOOL
     renames NDdeIsValidAppTopicListA;            --  nddeapi.h:354

   function NDdeIsValidAppTopicListW
     (targetTopic : Win32.LPWSTR)
     return Win32.BOOL;                           --  nddeapi.h:359

private

   pragma Convention (C, NDDESHAREINFO);                    --  nddeapi.h:75

   pragma Import (Stdcall, NDdeShareAddA, "NDdeShareAddA"); --  nddeapi.h:100
   pragma Import (Stdcall, NDdeShareAddW, "NDdeShareAddW"); --  nddeapi.h:109
   pragma Import (Stdcall, NDdeShareDelA, "NDdeShareDelA"); --  nddeapi.h:121
   pragma Import (Stdcall, NDdeShareDelW, "NDdeShareDelW"); --  nddeapi.h:128
   pragma Import (Stdcall, NDdeGetShareSecurityA, "NDdeGetShareSecurityA");
   --  nddeapi.h:139
   pragma Import (Stdcall, NDdeGetShareSecurityW, "NDdeGetShareSecurityW");
   --  nddeapi.h:149
   pragma Import (Stdcall, NDdeSetShareSecurityA, "NDdeSetShareSecurityA");
   --  nddeapi.h:163
   pragma Import (Stdcall, NDdeSetShareSecurityW, "NDdeSetShareSecurityW");
   --  nddeapi.h:171
   pragma Import (Stdcall, NDdeShareEnumA, "NDdeShareEnumA"); --  nddeapi.h:182
   pragma Import (Stdcall, NDdeShareEnumW, "NDdeShareEnumW"); --  nddeapi.h:192
   pragma Import (Stdcall, NDdeShareGetInfoA, "NDdeShareGetInfoA");
   --  nddeapi.h:205
   pragma Import (Stdcall, NDdeShareGetInfoW, "NDdeShareGetInfoW");
   --  nddeapi.h:216
   pragma Import (Stdcall, NDdeShareSetInfoA, "NDdeShareSetInfoA");
   --  nddeapi.h:230
   pragma Import (Stdcall, NDdeShareSetInfoW, "NDdeShareSetInfoW");
   --  nddeapi.h:240
   pragma Import (Stdcall, NDdeSetTrustedShareA, "NDdeSetTrustedShareA");
   --  nddeapi.h:254
   pragma Import (Stdcall, NDdeSetTrustedShareW, "NDdeSetTrustedShareW");
   --  nddeapi.h:261
   pragma Import (Stdcall, NDdeGetTrustedShareA, "NDdeGetTrustedShareA");
   --  nddeapi.h:279
   pragma Import (Stdcall, NDdeGetTrustedShareW, "NDdeGetTrustedShareW");
   --  nddeapi.h:288
   pragma Import (Stdcall, NDdeTrustedShareEnumA, "NDdeTrustedShareEnumA");
   --  nddeapi.h:301
   pragma Import (Stdcall, NDdeTrustedShareEnumW, "NDdeTrustedShareEnumW");
   --  nddeapi.h:311
   pragma Import (Stdcall, NDdeGetErrorStringA, "NDdeGetErrorStringA");
   --  nddeapi.h:324
   pragma Import (Stdcall, NDdeGetErrorStringW, "NDdeGetErrorStringW");
   --  nddeapi.h:331
   pragma Import (Stdcall, NDdeIsValidShareNameA, "NDdeIsValidShareNameA");
   --  nddeapi.h:341
   pragma Import (Stdcall, NDdeIsValidShareNameW, "NDdeIsValidShareNameW");
   --  nddeapi.h:346
   pragma Import (Stdcall, NDdeIsValidAppTopicListA,
                    "NDdeIsValidAppTopicListA");
   --  nddeapi.h:354
   pragma Import (Stdcall, NDdeIsValidAppTopicListW,
                    "NDdeIsValidAppTopicListW");
   --  nddeapi.h:359

end Win32.Nddeapi;
