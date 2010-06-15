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

package Win32.Ddeml is

   use type Interfaces.C.char_array;

   XST_NULL                   : constant := 0;
   XST_INCOMPLETE             : constant := 1;
   XST_CONNECTED              : constant := 2;
   XST_INIT1                  : constant := 3;
   XST_INIT2                  : constant := 4;
   XST_REQSENT                : constant := 5;
   XST_DATARCVD               : constant := 6;
   XST_POKESENT               : constant := 7;
   XST_POKEACKRCVD            : constant := 8;
   XST_EXECSENT               : constant := 9;
   XST_EXECACKRCVD            : constant := 10;
   XST_ADVSENT                : constant := 11;
   XST_UNADVSENT              : constant := 12;
   XST_ADVACKRCVD             : constant := 13;
   XST_UNADVACKRCVD           : constant := 14;
   XST_ADVDATASENT            : constant := 15;
   XST_ADVDATAACKRCVD         : constant := 16;
   CADV_LATEACK               : constant := 16#ffff#;
   ST_CONNECTED               : constant := 16#1#;
   ST_ADVISE                  : constant := 16#2#;
   ST_ISLOCAL                 : constant := 16#4#;
   ST_BLOCKED                 : constant := 16#8#;
   ST_CLIENT                  : constant := 16#10#;
   ST_TERMINATED              : constant := 16#20#;
   ST_INLIST                  : constant := 16#40#;
   ST_BLOCKNEXT               : constant := 16#80#;
   ST_ISSELF                  : constant := 16#100#;
   DDE_FACK                   : constant := 16#8000#;
   DDE_FBUSY                  : constant := 16#4000#;
   DDE_FDEFERUPD              : constant := 16#4000#;
   DDE_FACKREQ                : constant := 16#8000#;
   DDE_FRELEASE               : constant := 16#2000#;
   DDE_FREQUESTED             : constant := 16#1000#;
   DDE_FAPPSTATUS             : constant := 16#ff#;
   DDE_FNOTPROCESSED          : constant := 16#0#;
   DDE_FACKRESERVED           : constant := 16#ffff3f00#;
   DDE_FADVRESERVED           : constant := 16#ffff3fff#;
   DDE_FDATRESERVED           : constant := 16#ffff4fff#;
   DDE_FPOKRESERVED           : constant := 16#ffffdfff#;
   MSGF_DDEMGR                : constant := 16#8001#;
   CP_WINANSI                 : constant := 1004;
   CP_WINUNICODE              : constant := 1200;
   XTYPF_NOBLOCK              : constant := 16#2#;
   XTYPF_NODATA               : constant := 16#4#;
   XTYPF_ACKREQ               : constant := 16#8#;
   XCLASS_MASK                : constant := 16#fc00#;
   XCLASS_BOOL                : constant := 16#1000#;
   XCLASS_DATA                : constant := 16#2000#;
   XCLASS_FLAGS               : constant := 16#4000#;
   XCLASS_NOTIFICATION        : constant := 16#8000#;
   XTYP_ERROR                 : constant := 16#8002#;
   XTYP_ADVDATA               : constant := 16#4010#;
   XTYP_ADVREQ                : constant := 16#2022#;
   XTYP_ADVSTART              : constant := 16#1030#;
   XTYP_ADVSTOP               : constant := 16#8040#;
   XTYP_EXECUTE               : constant := 16#4050#;
   XTYP_CONNECT               : constant := 16#1062#;
   XTYP_CONNECT_CONFIRM       : constant := 16#8072#;
   XTYP_XACT_COMPLETE         : constant := 16#8080#;
   XTYP_POKE                  : constant := 16#4090#;
   XTYP_REGISTER              : constant := 16#80a2#;
   XTYP_REQUEST               : constant := 16#20b0#;
   XTYP_DISCONNECT            : constant := 16#80c2#;
   XTYP_UNREGISTER            : constant := 16#80d2#;
   XTYP_WILDCONNECT           : constant := 16#20e2#;
   XTYP_MASK                  : constant := 16#f0#;
   XTYP_SHIFT                 : constant := 4;
   TIMEOUT_ASYNC              : constant := 16#ffffffff#;
   QID_SYNC                   : constant := 16#ffffffff#;
   SZDDESYS_TOPIC             : constant CHAR_Array := "System" & Nul;
   SZDDESYS_ITEM_TOPICS       : constant CHAR_Array := "Topics" & Nul;
   SZDDESYS_ITEM_SYSITEMS     : constant CHAR_Array := "SysItems" & Nul;
   SZDDESYS_ITEM_RTNMSG       : constant CHAR_Array := "ReturnMessage" & Nul;
   SZDDESYS_ITEM_STATUS       : constant CHAR_Array := "Status" & Nul;
   SZDDESYS_ITEM_FORMATS      : constant CHAR_Array := "Formats" & Nul;
   SZDDESYS_ITEM_HELP         : constant CHAR_Array := "Help" & Nul;
   SZDDE_ITEM_ITEMLIST        : constant CHAR_Array := "TopicItemList" & Nul;
   CBR_BLOCK                  : constant := 16#ffffffff#;
   CBF_FAIL_SELFCONNECTIONS   : constant := 16#1000#;
   CBF_FAIL_CONNECTIONS       : constant := 16#2000#;
   CBF_FAIL_ADVISES           : constant := 16#4000#;
   CBF_FAIL_EXECUTES          : constant := 16#8000#;
   CBF_FAIL_POKES             : constant := 16#10000#;
   CBF_FAIL_REQUESTS          : constant := 16#20000#;
   CBF_FAIL_ALLSVRXACTIONS    : constant := 16#3f000#;
   CBF_SKIP_CONNECT_CONFIRMS  : constant := 16#40000#;
   CBF_SKIP_REGISTRATIONS     : constant := 16#80000#;
   CBF_SKIP_UNREGISTRATIONS   : constant := 16#100000#;
   CBF_SKIP_DISCONNECTS       : constant := 16#200000#;
   CBF_SKIP_ALLNOTIFICATIONS  : constant := 16#3c0000#;
   APPCMD_CLIENTONLY          : constant := 16#10#;
   APPCMD_FILTERINITS         : constant := 16#20#;
   APPCMD_MASK                : constant := 16#ff0#;
   APPCLASS_STANDARD          : constant := 16#0#;
   APPCLASS_MASK              : constant := 16#f#;
   EC_ENABLEALL               : constant := 0;
   EC_ENABLEONE               : constant := 16#80#;
   EC_DISABLE                 : constant := 16#8#;
   EC_QUERYWAITING            : constant := 2;
   DNS_REGISTER               : constant := 16#1#;
   DNS_UNREGISTER             : constant := 16#2#;
   DNS_FILTERON               : constant := 16#4#;
   DNS_FILTEROFF              : constant := 16#8#;
   HDATA_APPOWNED             : constant := 16#1#;
   DMLERR_NO_ERROR            : constant := 0;
   DMLERR_FIRST               : constant := 16#4000#;
   DMLERR_ADVACKTIMEOUT       : constant := 16#4000#;
   DMLERR_BUSY                : constant := 16#4001#;
   DMLERR_DATAACKTIMEOUT      : constant := 16#4002#;
   DMLERR_DLL_NOT_INITIALIZED : constant := 16#4003#;
   DMLERR_DLL_USAGE           : constant := 16#4004#;
   DMLERR_EXECACKTIMEOUT      : constant := 16#4005#;
   DMLERR_INVALIDPARAMETER    : constant := 16#4006#;
   DMLERR_LOW_MEMORY          : constant := 16#4007#;
   DMLERR_MEMORY_ERROR        : constant := 16#4008#;
   DMLERR_NOTPROCESSED        : constant := 16#4009#;
   DMLERR_NO_CONV_ESTABLISHED : constant := 16#400a#;
   DMLERR_POKEACKTIMEOUT      : constant := 16#400b#;
   DMLERR_POSTMSG_FAILED      : constant := 16#400c#;
   DMLERR_REENTRANCY          : constant := 16#400d#;
   DMLERR_SERVER_DIED         : constant := 16#400e#;
   DMLERR_SYS_ERROR           : constant := 16#400f#;
   DMLERR_UNADVACKTIMEOUT     : constant := 16#4010#;
   DMLERR_UNFOUND_QUEUE_ID    : constant := 16#4011#;
   DMLERR_LAST                : constant := 16#4011#;
   MH_CREATE                  : constant := 1;
   MH_KEEP                    : constant := 2;
   MH_DELETE                  : constant := 3;
   MH_CLEANUP                 : constant := 4;
   MAX_MONITORS               : constant := 4;
   APPCLASS_MONITOR           : constant := 16#1#;
   XTYP_MONITOR               : constant := 16#80f2#;
   MF_HSZ_INFO                : constant := 16#1000000#;
   MF_SENDMSGS                : constant := 16#2000000#;
   MF_POSTMSGS                : constant := 16#4000000#;
   MF_CALLBACKS               : constant := 16#8000000#;
   MF_ERRORS                  : constant := 16#10000000#;
   MF_LINKS                   : constant := 16#20000000#;
   MF_CONV                    : constant := 16#40000000#;
   MF_MASK                    : constant := 16#ff000000#;

   type HCONVLIST is new Win32.LONG_PTR;
   type HCONV is new Win32.LONG_PTR;
   type HSZ is new Win32.LONG_PTR;
   type HDDEDATA is new Win32.LONG_PTR;

   type HSZPAIR;
   type CONVCONTEXT;
   type CONVINFO;
   type DDEML_MSG_HOOK_DATA;
   type MONMSGSTRUCT;
   type MONCBSTRUCT;
   type MONHSZSTRUCTA;
   type MONHSZSTRUCTW;
   type MONERRSTRUCT;
   type MONLINKSTRUCT;
   type MONCONVSTRUCT;

   type PHSZPAIR is access all HSZPAIR;
   type PCONVCONTEXT is access all CONVCONTEXT;
   type PCONVINFO is access all CONVINFO;
   type PDDEML_MSG_HOOK_DATA is access all DDEML_MSG_HOOK_DATA;
   type PMONMSGSTRUCT is access all MONMSGSTRUCT;
   type PMONCBSTRUCT is access all MONCBSTRUCT;
   type PMONHSZSTRUCTA is access all MONHSZSTRUCTA;
   type PMONHSZSTRUCTW is access all MONHSZSTRUCTW;
   type PMONHSZSTRUCT is access all MONHSZSTRUCTA;
   type PMONERRSTRUCT is access all MONERRSTRUCT;
   type PMONLINKSTRUCT is access all MONLINKSTRUCT;
   type PMONCONVSTRUCT is access all MONCONVSTRUCT;

   type HSZPAIR is record
      hszSvc   : HSZ;
      hszTopic : HSZ;
   end record;

   type CONVCONTEXT is record
      cb         : Win32.UINT;
      wFlags     : Win32.UINT;
      wCountryID : Win32.UINT;
      iCodePage  : Win32.INT;
      dwLangID   : Win32.DWORD;
      dwSecurity : Win32.DWORD;
      qos        : Win32.Winnt.SECURITY_QUALITY_OF_SERVICE;
   end record;

   type CONVINFO is record
      cb            : Win32.DWORD;
      hUser         : Win32.ULONG_PTR;
      hConvPartner  : HCONV;
      hszSvcPartner : HSZ;
      hszServiceReq : HSZ;
      hszTopic      : HSZ;
      hszItem       : HSZ;
      wFmt          : Win32.UINT;
      wType         : Win32.UINT;
      wStatus       : Win32.UINT;
      wConvst       : Win32.UINT;
      wLastError    : Win32.UINT;
      hConvList     : Win32.Ddeml.HCONVLIST;
      ConvCtxt      : CONVCONTEXT;
      hwnd          : Win32.Windef.HWND;
      hwndPartner   : Win32.Windef.HWND;
   end record;

   type PFNCALLBACK is access function
     (wType   : Win32.UINT;
      wFmt    : Win32.UINT;
      hConv   : Win32.Ddeml.HCONV;
      hsz1    : HSZ;
      hsz2    : HSZ;
      hData   : HDDEDATA;
      dwData1 : Win32.ULONG_PTR;
      dwData2 : Win32.ULONG_PTR)
      return HDDEDATA;
   pragma Convention (Stdcall, PFNCALLBACK);

   type DDEML_MSG_HOOK_DATA is record
      uiLo   : Win32.UINT_PTR;
      uiHi   : Win32.UINT_PTR;
      cbData : Win32.DWORD;
      Data   : Win32.DWORD_Array (0 .. 7);
   end record;

   type MONMSGSTRUCT is record
      cb     : Win32.UINT;
      hwndTo : Win32.Windef.HWND;
      dwTime : Win32.DWORD;
      hTask  : Win32.Winnt.HANDLE;
      wMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      dmhd   : DDEML_MSG_HOOK_DATA;
   end record;

   type MONCBSTRUCT is record
      cb      : Win32.UINT;
      dwTime  : Win32.DWORD;
      hTask   : Win32.Winnt.HANDLE;
      dwRet   : Win32.DWORD;
      wType   : Win32.UINT;
      wFmt    : Win32.UINT;
      hConv   : Win32.Ddeml.HCONV;
      hsz1    : HSZ;
      hsz2    : HSZ;
      hData   : HDDEDATA;
      dwData1 : Win32.ULONG_PTR;
      dwData2 : Win32.ULONG_PTR;
      cc      : CONVCONTEXT;
      cbData  : Win32.DWORD;
      Data    : Win32.DWORD_Array (0 .. 7);
   end record;

   type MONHSZSTRUCTA is record
      cb       : Win32.UINT;
      fsAction : Win32.BOOL;
      dwTime   : Win32.DWORD;
      hsz      : Win32.Ddeml.HSZ;
      hTask    : Win32.Winnt.HANDLE;
      str      : Win32.CHAR_Array (0 .. ANYSIZE_ARRAY);
   end record;

   type MONHSZSTRUCTW is record
      cb       : Win32.UINT;
      fsAction : Win32.BOOL;
      dwTime   : Win32.DWORD;
      hsz      : Win32.Ddeml.HSZ;
      hTask    : Win32.Winnt.HANDLE;
      str      : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   subtype MONHSZSTRUCT is MONHSZSTRUCTA;

   type MONERRSTRUCT is record
      cb         : Win32.UINT;
      wLastError : Win32.UINT;
      dwTime     : Win32.DWORD;
      hTask      : Win32.Winnt.HANDLE;
   end record;

   type MONLINKSTRUCT is record
      cb           : Win32.UINT;
      dwTime       : Win32.DWORD;
      hTask        : Win32.Winnt.HANDLE;
      fEstablished : Win32.BOOL;
      fNoData      : Win32.BOOL;
      hszSvc       : HSZ;
      hszTopic     : HSZ;
      hszItem      : HSZ;
      wFmt         : Win32.UINT;
      fServer      : Win32.BOOL;
      hConvServer  : HCONV;
      hConvClient  : HCONV;
   end record;

   type MONCONVSTRUCT is record
      cb          : Win32.UINT;
      fConnect    : Win32.BOOL;
      dwTime      : Win32.DWORD;
      hTask       : Win32.Winnt.HANDLE;
      hszSvc      : HSZ;
      hszTopic    : HSZ;
      hConvClient : HCONV;
      hConvServer : HCONV;
   end record;

   function DdeInitializeA
     (pidInst     : Win32.LPDWORD;
      pfnCallback : Win32.Ddeml.PFNCALLBACK;
      afCmd       : Win32.DWORD;
      ulRes       : Win32.DWORD)
      return Win32.UINT;

   function DdeInitialize
     (pidInst     : Win32.LPDWORD;
      pfnCallback : Win32.Ddeml.PFNCALLBACK;
      afCmd       : Win32.DWORD;
      ulRes       : Win32.DWORD)
      return Win32.UINT renames DdeInitializeA;

   function DdeInitializeW
     (pidInst     : Win32.LPDWORD;
      pfnCallback : Win32.Ddeml.PFNCALLBACK;
      afCmd       : Win32.DWORD;
      ulRes       : Win32.DWORD)
      return Win32.UINT;

   function DdeUninitialize (idInst : Win32.DWORD) return Win32.BOOL;

   function DdeConnectList
     (idInst     : Win32.DWORD;
      hszService : HSZ;
      hszTopic   : HSZ;
      hConvList  : Win32.Ddeml.HCONVLIST;
      pCC        : PCONVCONTEXT)
      return Win32.Ddeml.HCONVLIST;

   function DdeQueryNextServer
     (hConvList : Win32.Ddeml.HCONVLIST;
      hConvPrev : HCONV)
      return HCONV;

   function DdeDisconnectList
     (hConvList : Win32.Ddeml.HCONVLIST)
      return Win32.BOOL;

   function DdeConnect
     (idInst     : Win32.DWORD;
      hszService : HSZ;
      hszTopic   : HSZ;
      pCC        : PCONVCONTEXT)
      return HCONV;

   function DdeDisconnect (hConv : Win32.Ddeml.HCONV) return Win32.BOOL;

   function DdeReconnect
     (hConv : Win32.Ddeml.HCONV)
      return Win32.Ddeml.HCONV;

   function DdeQueryConvInfo
     (hConv         : Win32.Ddeml.HCONV;
      idTransaction : Win32.DWORD;
      pConvInfo     : Win32.Ddeml.PCONVINFO)
      return Win32.UINT;

   function DdeSetUserHandle
     (hConv : Win32.Ddeml.HCONV;
      id    : Win32.DWORD;
      hUser : Win32.DWORD)
      return Win32.BOOL;

   function DdeAbandonTransaction
     (idInst        : Win32.DWORD;
      hConv         : Win32.Ddeml.HCONV;
      idTransaction : Win32.DWORD)
      return Win32.BOOL;

   function DdePostAdvise
     (idInst   : Win32.DWORD;
      hszTopic : HSZ;
      hszItem  : HSZ)
      return Win32.BOOL;

   function DdeEnableCallback
     (idInst : Win32.DWORD;
      hConv  : Win32.Ddeml.HCONV;
      wCmd   : Win32.UINT)
      return Win32.BOOL;

   function DdeImpersonateClient
     (hConv : Win32.Ddeml.HCONV)
      return Win32.BOOL;

   function DdeNameService
     (idInst : Win32.DWORD;
      hsz1   : HSZ;
      hsz2   : HSZ;
      afCmd  : Win32.UINT)
      return HDDEDATA;

   function DdeClientTransaction
     (pData     : Win32.PCBYTE;
      cbData    : Win32.DWORD;
      hConv     : Win32.Ddeml.HCONV;
      hszItem   : HSZ;
      wFmt      : Win32.UINT;
      wType     : Win32.UINT;
      dwTimeout : Win32.DWORD;
      pdwResult : Win32.LPDWORD)
      return HDDEDATA;

   function DdeCreateDataHandle
     (idInst  : Win32.DWORD;
      pSrc    : Win32.LPBYTE;
      cb      : Win32.DWORD;
      cbOff   : Win32.DWORD;
      hszItem : HSZ;
      wFmt    : Win32.UINT;
      afCmd   : Win32.UINT)
      return HDDEDATA;

   function DdeAddData
     (hData : HDDEDATA;
      pSrc  : Win32.LPBYTE;
      cb    : Win32.DWORD;
      cbOff : Win32.DWORD)
      return HDDEDATA;

   function DdeGetData
     (hData : HDDEDATA;
      pDst  : Win32.LPBYTE;
      cbMax : Win32.DWORD;
      cbOff : Win32.DWORD)
      return Win32.DWORD;

   function DdeAccessData
     (hData       : HDDEDATA;
      pcbDataSize : Win32.LPDWORD)
      return Win32.LPBYTE;

   function DdeUnaccessData (hData : HDDEDATA) return Win32.BOOL;

   function DdeFreeDataHandle (hData : HDDEDATA) return Win32.BOOL;

   function DdeGetLastError (idInst : Win32.DWORD) return Win32.UINT;

   function DdeCreateStringHandleA
     (idInst    : Win32.DWORD;
      psz       : Win32.LPCSTR;
      iCodePage : Win32.INT)
      return HSZ;

   function DdeCreateStringHandle
     (idInst    : Win32.DWORD;
      psz       : Win32.LPCSTR;
      iCodePage : Win32.INT)
      return HSZ renames DdeCreateStringHandleA;

   function DdeCreateStringHandleW
     (idInst    : Win32.DWORD;
      psz       : Win32.LPWSTR;
      iCodePage : Win32.INT)
      return HSZ;

   function DdeQueryStringA
     (idInst    : Win32.DWORD;
      hsz       : Win32.Ddeml.HSZ;
      psz       : Win32.LPSTR;
      cchMax    : Win32.DWORD;
      iCodePage : Win32.INT)
      return Win32.DWORD;

   function DdeQueryString
     (idInst    : Win32.DWORD;
      hsz       : Win32.Ddeml.HSZ;
      psz       : Win32.LPSTR;
      cchMax    : Win32.DWORD;
      iCodePage : Win32.INT)
      return Win32.DWORD renames DdeQueryStringA;

   function DdeQueryStringW
     (idInst    : Win32.DWORD;
      hsz       : Win32.Ddeml.HSZ;
      psz       : Win32.LPWSTR;
      cchMax    : Win32.DWORD;
      iCodePage : Win32.INT)
      return Win32.DWORD;

   function DdeFreeStringHandle
     (idInst : Win32.DWORD;
      hsz    : Win32.Ddeml.HSZ)
      return Win32.BOOL;

   function DdeKeepStringHandle
     (idInst : Win32.DWORD;
      hsz    : Win32.Ddeml.HSZ)
      return Win32.BOOL;

   function DdeCmpStringHandles (hsz1 : HSZ; hsz2 : HSZ) return Win32.INT;

private

   pragma Convention (C_Pass_By_Copy, HSZPAIR);
   pragma Convention (C, CONVCONTEXT);
   pragma Convention (C, CONVINFO);
   pragma Convention (C, DDEML_MSG_HOOK_DATA);
   pragma Convention (C, MONMSGSTRUCT);
   pragma Convention (C, MONCBSTRUCT);
   pragma Convention (C, MONHSZSTRUCTA);
   pragma Convention (C, MONHSZSTRUCTW);
   pragma Convention (C_Pass_By_Copy, MONERRSTRUCT);
   pragma Convention (C, MONLINKSTRUCT);
   pragma Convention (C, MONCONVSTRUCT);

   pragma Import (Stdcall, DdeInitializeA, "DdeInitializeA");
   pragma Import (Stdcall, DdeInitializeW, "DdeInitializeW");
   pragma Import (Stdcall, DdeUninitialize, "DdeUninitialize");
   pragma Import (Stdcall, DdeConnectList, "DdeConnectList");
   pragma Import (Stdcall, DdeQueryNextServer, "DdeQueryNextServer");
   pragma Import (Stdcall, DdeDisconnectList, "DdeDisconnectList");
   pragma Import (Stdcall, DdeConnect, "DdeConnect");
   pragma Import (Stdcall, DdeDisconnect, "DdeDisconnect");
   pragma Import (Stdcall, DdeReconnect, "DdeReconnect");
   pragma Import (Stdcall, DdeQueryConvInfo, "DdeQueryConvInfo");
   pragma Import (Stdcall, DdeSetUserHandle, "DdeSetUserHandle");
   pragma Import (Stdcall, DdeAbandonTransaction, "DdeAbandonTransaction");
   pragma Import (Stdcall, DdePostAdvise, "DdePostAdvise");
   pragma Import (Stdcall, DdeEnableCallback, "DdeEnableCallback");
   pragma Import (Stdcall, DdeImpersonateClient, "DdeImpersonateClient");
   pragma Import (Stdcall, DdeNameService, "DdeNameService");
   pragma Import (Stdcall, DdeClientTransaction, "DdeClientTransaction");
   pragma Import (Stdcall, DdeCreateDataHandle, "DdeCreateDataHandle");
   pragma Import (Stdcall, DdeAddData, "DdeAddData");
   pragma Import (Stdcall, DdeGetData, "DdeGetData");
   pragma Import (Stdcall, DdeAccessData, "DdeAccessData");
   pragma Import (Stdcall, DdeUnaccessData, "DdeUnaccessData");
   pragma Import (Stdcall, DdeFreeDataHandle, "DdeFreeDataHandle");
   pragma Import (Stdcall, DdeGetLastError, "DdeGetLastError");
   pragma Import (Stdcall, DdeCreateStringHandleA, "DdeCreateStringHandleA");
   pragma Import (Stdcall, DdeCreateStringHandleW, "DdeCreateStringHandleW");
   pragma Import (Stdcall, DdeQueryStringA, "DdeQueryStringA");
   pragma Import (Stdcall, DdeQueryStringW, "DdeQueryStringW");
   pragma Import (Stdcall, DdeFreeStringHandle, "DdeFreeStringHandle");
   pragma Import (Stdcall, DdeKeepStringHandle, "DdeKeepStringHandle");
   pragma Import (Stdcall, DdeCmpStringHandles, "DdeCmpStringHandles");

end Win32.Ddeml;
