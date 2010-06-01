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

with Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;

package Win32.Ole is

   OT_LINK         : constant := 1;
   OT_EMBEDDED     : constant := 2;
   OT_STATIC       : constant := 3;
   OLEVERB_PRIMARY : constant := 0;
   OF_SET          : constant := 16#1#;
   OF_GET          : constant := 16#2#;
   OF_HANDLER      : constant := 16#4#;

   type OLESTATUS is (
      OLE_OK,
      OLE_WAIT_FOR_RELEASE,
      OLE_BUSY,
      OLE_ERROR_PROTECT_ONLY,
      OLE_ERROR_MEMORY,
      OLE_ERROR_STREAM,
      OLE_ERROR_STATIC,
      OLE_ERROR_BLANK,
      OLE_ERROR_DRAW,
      OLE_ERROR_METAFILE,
      OLE_ERROR_ABORT,
      OLE_ERROR_CLIPBOARD,
      OLE_ERROR_FORMAT,
      OLE_ERROR_OBJECT,
      OLE_ERROR_OPTION,
      OLE_ERROR_PROTOCOL,
      OLE_ERROR_ADDRESS,
      OLE_ERROR_NOT_EQUAL,
      OLE_ERROR_HANDLE,
      OLE_ERROR_GENERIC,
      OLE_ERROR_CLASS,
      OLE_ERROR_SYNTAX,
      OLE_ERROR_DATATYPE,
      OLE_ERROR_PALETTE,
      OLE_ERROR_NOT_LINK,
      OLE_ERROR_NOT_EMPTY,
      OLE_ERROR_SIZE,
      OLE_ERROR_DRIVE,
      OLE_ERROR_NETWORK,
      OLE_ERROR_NAME,
      OLE_ERROR_TEMPLATE,
      OLE_ERROR_NEW,
      OLE_ERROR_EDIT,
      OLE_ERROR_OPEN,
      OLE_ERROR_NOT_OPEN,
      OLE_ERROR_LAUNCH,
      OLE_ERROR_COMM,
      OLE_ERROR_TERMINATE,
      OLE_ERROR_COMMAND,
      OLE_ERROR_SHOW,
      OLE_ERROR_DOVERB,
      OLE_ERROR_ADVISE_NATIVE,
      OLE_ERROR_ADVISE_PICT,
      OLE_ERROR_ADVISE_RENAME,
      OLE_ERROR_POKE_NATIVE,
      OLE_ERROR_REQUEST_NATIVE,
      OLE_ERROR_REQUEST_PICT,
      OLE_ERROR_SERVER_BLOCKED,
      OLE_ERROR_REGISTRATION,
      OLE_ERROR_ALREADY_REGISTERED,
      OLE_ERROR_TASK,
      OLE_ERROR_OUTOFDATE,
      OLE_ERROR_CANT_UPDATE_CLIENT,
      OLE_ERROR_UPDATE,
      OLE_ERROR_SETDATA_FORMAT,
      OLE_ERROR_STATIC_FROM_OTHER_OS,
      OLE_ERROR_FILE_VER,
      OLE_WARN_DELETE_DATA);

   for OLESTATUS use
     (OLE_OK                         => 0,
      OLE_WAIT_FOR_RELEASE           => 1,
      OLE_BUSY                       => 2,
      OLE_ERROR_PROTECT_ONLY         => 3,
      OLE_ERROR_MEMORY               => 4,
      OLE_ERROR_STREAM               => 5,
      OLE_ERROR_STATIC               => 6,
      OLE_ERROR_BLANK                => 7,
      OLE_ERROR_DRAW                 => 8,
      OLE_ERROR_METAFILE             => 9,
      OLE_ERROR_ABORT                => 10,
      OLE_ERROR_CLIPBOARD            => 11,
      OLE_ERROR_FORMAT               => 12,
      OLE_ERROR_OBJECT               => 13,
      OLE_ERROR_OPTION               => 14,
      OLE_ERROR_PROTOCOL             => 15,
      OLE_ERROR_ADDRESS              => 16,
      OLE_ERROR_NOT_EQUAL            => 17,
      OLE_ERROR_HANDLE               => 18,
      OLE_ERROR_GENERIC              => 19,
      OLE_ERROR_CLASS                => 20,
      OLE_ERROR_SYNTAX               => 21,
      OLE_ERROR_DATATYPE             => 22,
      OLE_ERROR_PALETTE              => 23,
      OLE_ERROR_NOT_LINK             => 24,
      OLE_ERROR_NOT_EMPTY            => 25,
      OLE_ERROR_SIZE                 => 26,
      OLE_ERROR_DRIVE                => 27,
      OLE_ERROR_NETWORK              => 28,
      OLE_ERROR_NAME                 => 29,
      OLE_ERROR_TEMPLATE             => 30,
      OLE_ERROR_NEW                  => 31,
      OLE_ERROR_EDIT                 => 32,
      OLE_ERROR_OPEN                 => 33,
      OLE_ERROR_NOT_OPEN             => 34,
      OLE_ERROR_LAUNCH               => 35,
      OLE_ERROR_COMM                 => 36,
      OLE_ERROR_TERMINATE            => 37,
      OLE_ERROR_COMMAND              => 38,
      OLE_ERROR_SHOW                 => 39,
      OLE_ERROR_DOVERB               => 40,
      OLE_ERROR_ADVISE_NATIVE        => 41,
      OLE_ERROR_ADVISE_PICT          => 42,
      OLE_ERROR_ADVISE_RENAME        => 43,
      OLE_ERROR_POKE_NATIVE          => 44,
      OLE_ERROR_REQUEST_NATIVE       => 45,
      OLE_ERROR_REQUEST_PICT         => 46,
      OLE_ERROR_SERVER_BLOCKED       => 47,
      OLE_ERROR_REGISTRATION         => 48,
      OLE_ERROR_ALREADY_REGISTERED   => 49,
      OLE_ERROR_TASK                 => 50,
      OLE_ERROR_OUTOFDATE            => 51,
      OLE_ERROR_CANT_UPDATE_CLIENT   => 52,
      OLE_ERROR_UPDATE               => 53,
      OLE_ERROR_SETDATA_FORMAT       => 54,
      OLE_ERROR_STATIC_FROM_OTHER_OS => 55,
      OLE_ERROR_FILE_VER             => 56,
      OLE_WARN_DELETE_DATA           => 1000);
   for OLESTATUS'Size use 32;

   type OLE_NOTIFICATION is (
      OLE_CHANGED,
      OLE_SAVED,
      OLE_CLOSED,
      OLE_RENAMED,
      OLE_QUERY_PAINT,
      OLE_RELEASE,
      OLE_QUERY_RETRY);
   for OLE_NOTIFICATION'Size use 32;

   type OLE_RELEASE_METHOD is (
      OLE_NONE,
      OLE_DELETE,
      OLE_LNKPASTE,
      OLE_EMBPASTE,
      OLE_SHOW,
      OLE_RUN,
      OLE_ACTIVATE,
      OLE_UPDATE,
      OLE_CLOSE,
      OLE_RECONNECT,
      OLE_SETUPDATEOPTIONS,
      OLE_SERVERUNLAUNCH,
      OLE_LOADFROMSTREAM,
      OLE_SETDATA,
      OLE_REQUESTDATA,
      OLE_OTHER,
      OLE_CREATE,
      OLE_CREATEFROMTEMPLATE,
      OLE_CREATELINKFROMFILE,
      OLE_COPYFROMLNK,
      OLE_CREATEFROMFILE,
      OLE_CREATEINVISIBLE);
   for OLE_RELEASE_METHOD'Size use 32;

   type OLEOPT_RENDER is (olerender_none, olerender_draw, olerender_format);
   for OLEOPT_RENDER'Size use 32;

   type OLECLIPFORMAT is new Win32.WORD;

   type OLEOPT_UPDATE is (
      oleupdate_always,
      oleupdate_onsave,
      oleupdate_oncall);
   for OLEOPT_UPDATE'Size use 32;

   type LHSERVER is new Win32.LONG;
   type LHCLIENTDOC is new Win32.LONG;
   type LHSERVERDOC is new Win32.LONG;

   type OLE_SERVER_USE is (OLE_SERVER_MULTI, OLE_SERVER_SINGLE);
   for OLE_SERVER_USE'Size use 32;

   subtype HOBJECT is Win32.Winnt.HANDLE;
   type OLETARGETDEVICE;
   type OLEOBJECT;
   type OLESTREAM;
   type OLECLIENT;
   type OLEOBJECTVTBL;
   type OLECLIENTVTBL;
   type OLESTREAMVTBL;
   type OLESERVER;
   type OLESERVERDOC;
   type OLESERVERVTBL;
   type OLESERVERDOCVTBL;

   type LPOLETARGETDEVICE is access all OLETARGETDEVICE;
   type LPOLEOBJECT is access all OLEOBJECT;
   type LPOLESTREAM is access all OLESTREAM;
   type LPOLECLIENT is access all OLECLIENT;
   type LPOLEOBJECTVTBL is access all OLEOBJECTVTBL;
   type LPOLECLIENTVTBL is access all OLECLIENTVTBL;
   type LPOLESTREAMVTBL is access all OLESTREAMVTBL;
   type LPOLESERVER is access all OLESERVER;
   type LPOLESERVERDOC is access all OLESERVERDOC;
   type LPOLESERVERVTBL is access all OLESERVERVTBL;
   type LPOLESERVERDOCVTBL is access all OLESERVERDOCVTBL;

   type af_247_QueryProtocol is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR)
      return Win32.PVOID;
   pragma Convention (Stdcall, af_247_QueryProtocol);

   type af_248_Release is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_248_Release);

   type af_249_Show is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.BOOL)
      return OLESTATUS;
   pragma Convention (Stdcall, af_249_Show);

   type af_250_DoVerb is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.UINT;
      p3   : Win32.BOOL;
      p4   : Win32.BOOL)
      return OLESTATUS;
   pragma Convention (Stdcall, af_250_DoVerb);

   type af_251_GetData is access function
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT;
      p3   : access Win32.Winnt.HANDLE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_251_GetData);

   type af_252_SetData is access function
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT;
      p3   : Win32.Winnt.HANDLE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_252_SetData);

   type af_253_SetTargetDevice is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.Winnt.HANDLE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_253_SetTargetDevice);

   type af_254_SetBounds is access function
     (p1   : access OLEOBJECT;
      p2   : access Win32.Windef.RECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_254_SetBounds);

   type af_255_EnumFormats is access function
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT)
      return OLECLIPFORMAT;
   pragma Convention (Stdcall, af_255_EnumFormats);

   type af_256_SetColorScheme is access function
     (p1   : access OLEOBJECT;
      p2   : access Win32.Wingdi.LOGPALETTE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_256_SetColorScheme);

   type af_261_Delete is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_261_Delete);

   type af_262_SetHostNames is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR;
      p3   : Win32.LPCSTR)
      return OLESTATUS;
   pragma Convention (Stdcall, af_262_SetHostNames);

   type af_263_SaveToStream is access function
     (p1   : access OLEOBJECT;
      p2   : LPOLESTREAM)
      return OLESTATUS;
   pragma Convention (Stdcall, af_263_SaveToStream);

   type af_264_Clone is access function
     (p1   : access OLEOBJECT;
      p2   : LPOLECLIENT;
      p3   : LHCLIENTDOC;
      p4   : Win32.LPCSTR;
      p5   : access LPOLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_264_Clone);

   type af_265_CopyFromLink is access function
     (p1   : access OLEOBJECT;
      p2   : LPOLECLIENT;
      p3   : LHCLIENTDOC;
      p4   : Win32.LPCSTR;
      p5   : access LPOLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_265_CopyFromLink);

   type af_266_Equal is access function
     (p1   : access OLEOBJECT;
      p2   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_266_Equal);

   type af_267_CopyToClipboard is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_267_CopyToClipboard);

   type af_268_Draw is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.Windef.HDC;
      p3   : access Win32.Windef.RECT;
      p4   : access Win32.Windef.RECT;
      p5   : Win32.Windef.HDC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_268_Draw);

   type af_269_Activate is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.UINT;
      p3   : Win32.BOOL;
      p4   : Win32.BOOL;
      p5   : Win32.Windef.HWND;
      p6   : access Win32.Windef.RECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_269_Activate);

   type af_270_Execute is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.Winnt.HANDLE;
      p3   : Win32.UINT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_270_Execute);

   type af_271_Close is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_271_Close);

   type af_272_Update is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_272_Update);

   type af_273_Reconnect is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_273_Reconnect);

   type af_275_ObjectConvert is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR;
      p3   : LPOLECLIENT;
      p4   : LHCLIENTDOC;
      p5   : Win32.LPCSTR;
      p6   : access LPOLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_275_ObjectConvert);

   type af_276_GetLinkUpdateOptions is access function
     (p1   : access OLEOBJECT;
      p2   : access OLEOPT_UPDATE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_276_GetLinkUpdateOptions);

   type af_277_SetLinkUpdateOptions is access function
     (p1   : access OLEOBJECT;
      p2   : OLEOPT_UPDATE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_277_SetLinkUpdateOptions);

   type af_279_Rename is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR)
      return OLESTATUS;
   pragma Convention (Stdcall, af_279_Rename);

   type af_280_QueryName is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.LPSTR;
      p3   : access Win32.UINT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_280_QueryName);

   type af_282_QueryType is access function
     (p1   : access OLEOBJECT;
      p2   : access Win32.LONG)
      return OLESTATUS;
   pragma Convention (Stdcall, af_282_QueryType);

   type af_283_QueryBounds is access function
     (p1   : access OLEOBJECT;
      p2   : access Win32.Windef.RECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_283_QueryBounds);

   type af_284_QuerySize is access function
     (p1   : access OLEOBJECT;
      p2   : access Win32.DWORD)
      return OLESTATUS;
   pragma Convention (Stdcall, af_284_QuerySize);

   type af_285_QueryOpen is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_285_QueryOpen);

   type af_286_QueryOutOfDate is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_286_QueryOutOfDate);

   type af_288_QueryReleaseStatus is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_288_QueryReleaseStatus);

   type af_289_QueryReleaseError is access function
     (p1   : access OLEOBJECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_289_QueryReleaseError);

   type af_290_QueryReleaseMethod is access function
     (p1   : access OLEOBJECT)
      return OLE_RELEASE_METHOD;
   pragma Convention (Stdcall, af_290_QueryReleaseMethod);

   type af_292_RequestData is access function
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_292_RequestData);

   type af_293_ObjectLong is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.UINT;
      p3   : access Win32.LONG)
      return OLESTATUS;
   pragma Convention (Stdcall, af_293_ObjectLong);

   type af_296_ChangeData is access function
     (p1   : access OLEOBJECT;
      p2   : Win32.Winnt.HANDLE;
      p3   : LPOLECLIENT;
      p4   : Win32.BOOL)
      return OLESTATUS;
   pragma Convention (Stdcall, af_296_ChangeData);

   type af_311_CallBack is access function
     (p1   : LPOLECLIENT;
      p2   : OLE_NOTIFICATION;
      p3   : access OLEOBJECT)
      return Win32.INT;
   pragma Convention (Stdcall, af_311_CallBack);

   type af_324_Get is access function
     (p1   : LPOLESTREAM;
      p2   : Win32.PVOID;
      p3   : Win32.DWORD)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_324_Get);

   type af_325_Put is access function
     (p1   : LPOLESTREAM;
      p2   : Win32.PVOID;
      p3   : Win32.DWORD)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_325_Put);

   type af_434_Open is access function
     (p1   : LPOLESERVER;
      p2   : LHSERVERDOC;
      p3   : Win32.LPCSTR;
      p4   : access LPOLESERVERDOC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_434_Open);

   type af_440_Create is access function
     (p1   : LPOLESERVER;
      p2   : LHSERVERDOC;
      p3   : Win32.LPCSTR;
      p4   : Win32.LPCSTR;
      p5   : access LPOLESERVERDOC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_440_Create);

   type af_447_CreateFromTemplate is access function
     (p1   : LPOLESERVER;
      p2   : LHSERVERDOC;
      p3   : Win32.LPCSTR;
      p4   : Win32.LPCSTR;
      p5   : Win32.LPCSTR;
      p6   : access LPOLESERVERDOC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_447_CreateFromTemplate);

   type af_455_Edit is access function
     (p1   : LPOLESERVER;
      p2   : LHSERVERDOC;
      p3   : Win32.LPCSTR;
      p4   : Win32.LPCSTR;
      p5   : access LPOLESERVERDOC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_455_Edit);

   type af_462_c_Exit is access function
     (p1   : LPOLESERVER)
      return OLESTATUS;
   pragma Convention (Stdcall, af_462_c_Exit);

   type af_465_Release is access function
     (p1   : LPOLESERVER)
      return OLESTATUS;
   pragma Convention (Stdcall, af_465_Release);

   type af_468_Execute is access function
     (p1   : LPOLESERVER;
      p2   : Win32.Winnt.HANDLE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_468_Execute);

   type af_481_Save is access function
     (p1   : LPOLESERVERDOC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_481_Save);

   type af_482_Close is access function
     (p1   : LPOLESERVERDOC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_482_Close);

   type af_483_SetHostNames is access function
     (p1   : LPOLESERVERDOC;
      p2   : Win32.LPCSTR;
      p3   : Win32.LPCSTR)
      return OLESTATUS;
   pragma Convention (Stdcall, af_483_SetHostNames);

   type af_484_SetDocDimensions is access function
     (p1   : LPOLESERVERDOC;
      p2   : access Win32.Windef.RECT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_484_SetDocDimensions);

   type af_485_GetObjectA is access function
     (p1   : LPOLESERVERDOC;
      p2   : Win32.LPCSTR;
      p3   : access LPOLEOBJECT;
      p4   : LPOLECLIENT)
      return OLESTATUS;
   pragma Convention (Stdcall, af_485_GetObjectA);

   type af_486_Release is access function
     (p1   : LPOLESERVERDOC)
      return OLESTATUS;
   pragma Convention (Stdcall, af_486_Release);

   type af_487_SetColorScheme is access function
     (p1   : LPOLESERVERDOC;
      p2   : access Win32.Wingdi.LOGPALETTE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_487_SetColorScheme);

   type af_488_Execute is access function
     (p1   : LPOLESERVERDOC;
      p2   : Win32.Winnt.HANDLE)
      return OLESTATUS;
   pragma Convention (Stdcall, af_488_Execute);

   type OLETARGETDEVICE is record
      otdDeviceNameOffset  : Win32.USHORT;
      otdDriverNameOffset  : Win32.USHORT;
      otdPortNameOffset    : Win32.USHORT;
      otdExtDevmodeOffset  : Win32.USHORT;
      otdExtDevmodeSize    : Win32.USHORT;
      otdEnvironmentOffset : Win32.USHORT;
      otdEnvironmentSize   : Win32.USHORT;
      otdData              : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type OLEOBJECT is record
      lpvtbl : LPOLEOBJECTVTBL;
   end record;

   type OLESTREAM is record
      lpstbl : LPOLESTREAMVTBL;
   end record;

   type OLECLIENT is record
      lpvtbl : LPOLECLIENTVTBL;
   end record;

   type OLEOBJECTVTBL is record
      QueryProtocol        : af_247_QueryProtocol;
      Release              : af_248_Release;
      Show                 : af_249_Show;
      DoVerb               : af_250_DoVerb;
      GetData              : af_251_GetData;
      SetData              : af_252_SetData;
      SetTargetDevice      : af_253_SetTargetDevice;
      SetBounds            : af_254_SetBounds;
      EnumFormats          : af_255_EnumFormats;
      SetColorScheme       : af_256_SetColorScheme;
      Delete               : af_261_Delete;
      SetHostNames         : af_262_SetHostNames;
      SaveToStream         : af_263_SaveToStream;
      Clone                : af_264_Clone;
      CopyFromLink         : af_265_CopyFromLink;
      Equal                : af_266_Equal;
      CopyToClipboard      : af_267_CopyToClipboard;
      Draw                 : af_268_Draw;
      Activate             : af_269_Activate;
      Execute              : af_270_Execute;
      Close                : af_271_Close;
      Update               : af_272_Update;
      Reconnect            : af_273_Reconnect;
      ObjectConvert        : af_275_ObjectConvert;
      GetLinkUpdateOptions : af_276_GetLinkUpdateOptions;
      SetLinkUpdateOptions : af_277_SetLinkUpdateOptions;
      Rename               : af_279_Rename;
      QueryName            : af_280_QueryName;
      QueryType            : af_282_QueryType;
      QueryBounds          : af_283_QueryBounds;
      QuerySize            : af_284_QuerySize;
      QueryOpen            : af_285_QueryOpen;
      QueryOutOfDate       : af_286_QueryOutOfDate;
      QueryReleaseStatus   : af_288_QueryReleaseStatus;
      QueryReleaseError    : af_289_QueryReleaseError;
      QueryReleaseMethod   : af_290_QueryReleaseMethod;
      RequestData          : af_292_RequestData;
      ObjectLong           : af_293_ObjectLong;
      ChangeData           : af_296_ChangeData;
   end record;

   type OLECLIENTVTBL is record
      CallBack : af_311_CallBack;
   end record;

   type OLESTREAMVTBL is record
      Get : af_324_Get;
      Put : af_325_Put;
   end record;

   type OLESERVER is record
      lpvtbl : LPOLESERVERVTBL;
   end record;

   type OLESERVERDOC is record
      lpvtbl : LPOLESERVERDOCVTBL;
   end record;

   type OLESERVERVTBL is record
      Open               : af_434_Open;
      Create             : af_440_Create;
      CreateFromTemplate : af_447_CreateFromTemplate;
      Edit               : af_455_Edit;
      c_Exit             : af_462_c_Exit;
      Release            : af_465_Release;
      Execute            : af_468_Execute;
   end record;

   type OLESERVERDOCVTBL is record
      Save             : af_481_Save;
      Close            : af_482_Close;
      SetHostNames     : af_483_SetHostNames;
      SetDocDimensions : af_484_SetDocDimensions;
      GetObjectA       : af_485_GetObjectA;
      Release          : af_486_Release;
      SetColorScheme   : af_487_SetColorScheme;
      Execute          : af_488_Execute;
   end record;

   function OleDelete (p1 : access OLEOBJECT) return OLESTATUS;

   function OleRelease (p1 : access OLEOBJECT) return OLESTATUS;

   function OleSaveToStream
     (p1   : access OLEOBJECT;
      p2   : LPOLESTREAM)
      return OLESTATUS;

   function OleEqual
     (p1   : access OLEOBJECT;
      p2   : access OLEOBJECT)
      return OLESTATUS;

   function OleCopyToClipboard (p1 : access OLEOBJECT) return OLESTATUS;

   function OleSetHostNames
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR;
      p3   : Win32.LPCSTR)
      return OLESTATUS;

   function OleSetTargetDevice
     (p1   : access OLEOBJECT;
      p2   : Win32.Winnt.HANDLE)
      return OLESTATUS;

   function OleSetBounds
     (p1   : access OLEOBJECT;
      p2   : Win32.Wingdi.ac_RECT_t)
      return OLESTATUS;

   function OleSetColorScheme
     (p1   : access OLEOBJECT;
      p2   : Win32.Wingdi.ac_LOGPALETTE_t)
      return OLESTATUS;

   function OleQueryBounds
     (p1   : access OLEOBJECT;
      p2   : access Win32.Windef.RECT)
      return OLESTATUS;

   function OleQuerySize
     (p1   : access OLEOBJECT;
      p2   : access Win32.DWORD)
      return OLESTATUS;

   function OleDraw
     (p1   : access OLEOBJECT;
      p2   : Win32.Windef.HDC;
      p3   : Win32.Wingdi.ac_RECT_t;
      p4   : Win32.Wingdi.ac_RECT_t;
      p5   : Win32.Windef.HDC)
      return OLESTATUS;

   function OleQueryOpen (p1 : access OLEOBJECT) return OLESTATUS;

   function OleActivate
     (p1   : access OLEOBJECT;
      p2   : Win32.UINT;
      p3   : Win32.BOOL;
      p4   : Win32.BOOL;
      p5   : Win32.Windef.HWND;
      p6   : Win32.Wingdi.ac_RECT_t)
      return OLESTATUS;

   function OleExecute
     (p1   : access OLEOBJECT;
      p2   : Win32.Winnt.HANDLE;
      p3   : Win32.UINT)
      return OLESTATUS;

   function OleClose (p1 : access OLEOBJECT) return OLESTATUS;

   function OleUpdate (p1 : access OLEOBJECT) return OLESTATUS;

   function OleReconnect (p1 : access OLEOBJECT) return OLESTATUS;

   function OleGetLinkUpdateOptions
     (p1   : access OLEOBJECT;
      p2   : access OLEOPT_UPDATE)
      return OLESTATUS;

   function OleSetLinkUpdateOptions
     (p1   : access OLEOBJECT;
      p2   : OLEOPT_UPDATE)
      return OLESTATUS;

   function OleQueryProtocol
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR)
      return Win32.PVOID;

   function OleQueryReleaseStatus (p1 : access OLEOBJECT) return OLESTATUS;

   function OleQueryReleaseError (p1 : access OLEOBJECT) return OLESTATUS;

   function OleQueryReleaseMethod
     (p1   : access OLEOBJECT)
      return OLE_RELEASE_METHOD;

   function OleQueryType
     (p1   : access OLEOBJECT;
      p2   : access Win32.LONG)
      return OLESTATUS;

   function OleQueryClientVersion return Win32.DWORD;

   function OleQueryServerVersion return Win32.DWORD;

   function OleEnumFormats
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT)
      return OLECLIPFORMAT;

   function OleGetData
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT;
      p3   : access Win32.Winnt.HANDLE)
      return OLESTATUS;

   function OleSetData
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT;
      p3   : Win32.Winnt.HANDLE)
      return OLESTATUS;

   function OleQueryOutOfDate (p1 : access OLEOBJECT) return OLESTATUS;

   function OleRequestData
     (p1   : access OLEOBJECT;
      p2   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleQueryLinkFromClip
     (p1   : Win32.LPCSTR;
      p2   : OLEOPT_RENDER;
      p3   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleQueryCreateFromClip
     (p1   : Win32.LPCSTR;
      p2   : OLEOPT_RENDER;
      p3   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleCreateFromClip
     (p1   : Win32.LPCSTR;
      p2   : LPOLECLIENT;
      p3   : LHCLIENTDOC;
      p4   : Win32.LPCSTR;
      p5   : access LPOLEOBJECT;
      p6   : OLEOPT_RENDER;
      p7   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleCreateLinkFromClip
     (p1   : Win32.LPCSTR;
      p2   : LPOLECLIENT;
      p3   : LHCLIENTDOC;
      p4   : Win32.LPCSTR;
      p5   : access LPOLEOBJECT;
      p6   : OLEOPT_RENDER;
      p7   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleCreateFromFile
     (p1   : Win32.LPCSTR;
      p2   : LPOLECLIENT;
      p3   : Win32.LPCSTR;
      p4   : Win32.LPCSTR;
      p5   : LHCLIENTDOC;
      p6   : Win32.LPCSTR;
      p7   : access LPOLEOBJECT;
      p8   : OLEOPT_RENDER;
      p9   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleCreateLinkFromFile
     (p1   : Win32.LPCSTR;
      p2   : LPOLECLIENT;
      p3   : Win32.LPCSTR;
      p4   : Win32.LPCSTR;
      p5   : Win32.LPCSTR;
      p6   : LHCLIENTDOC;
      p7   : Win32.LPCSTR;
      p8   : access LPOLEOBJECT;
      p9   : OLEOPT_RENDER;
      p10  : OLECLIPFORMAT)
      return OLESTATUS;

   function OleLoadFromStream
     (p1   : LPOLESTREAM;
      p2   : Win32.LPCSTR;
      p3   : LPOLECLIENT;
      p4   : LHCLIENTDOC;
      p5   : Win32.LPCSTR;
      p6   : access LPOLEOBJECT)
      return OLESTATUS;

   function OleCreate
     (p1   : Win32.LPCSTR;
      p2   : LPOLECLIENT;
      p3   : Win32.LPCSTR;
      p4   : LHCLIENTDOC;
      p5   : Win32.LPCSTR;
      p6   : access LPOLEOBJECT;
      p7   : OLEOPT_RENDER;
      p8   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleCreateInvisible
     (p1   : Win32.LPCSTR;
      p2   : LPOLECLIENT;
      p3   : Win32.LPCSTR;
      p4   : LHCLIENTDOC;
      p5   : Win32.LPCSTR;
      p6   : access LPOLEOBJECT;
      p7   : OLEOPT_RENDER;
      p8   : OLECLIPFORMAT;
      p9   : Win32.BOOL)
      return OLESTATUS;

   function OleCreateFromTemplate
     (p1   : Win32.LPCSTR;
      p2   : LPOLECLIENT;
      p3   : Win32.LPCSTR;
      p4   : LHCLIENTDOC;
      p5   : Win32.LPCSTR;
      p6   : access LPOLEOBJECT;
      p7   : OLEOPT_RENDER;
      p8   : OLECLIPFORMAT)
      return OLESTATUS;

   function OleClone
     (p1   : access OLEOBJECT;
      p2   : LPOLECLIENT;
      p3   : LHCLIENTDOC;
      p4   : Win32.LPCSTR;
      p5   : access LPOLEOBJECT)
      return OLESTATUS;

   function OleCopyFromLink
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR;
      p3   : LPOLECLIENT;
      p4   : LHCLIENTDOC;
      p5   : Win32.LPCSTR;
      p6   : access LPOLEOBJECT)
      return OLESTATUS;

   function OleObjectConvert
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR;
      p3   : LPOLECLIENT;
      p4   : LHCLIENTDOC;
      p5   : Win32.LPCSTR;
      p6   : access LPOLEOBJECT)
      return OLESTATUS;

   function OleRename
     (p1   : access OLEOBJECT;
      p2   : Win32.LPCSTR)
      return OLESTATUS;

   function OleQueryName
     (p1   : access OLEOBJECT;
      p2   : Win32.LPSTR;
      p3   : access Win32.UINT)
      return OLESTATUS;

   function OleRevokeObject (p1 : LPOLECLIENT) return OLESTATUS;

   function OleIsDcMeta (p1 : Win32.Windef.HDC) return Win32.BOOL;

   function OleRegisterClientDoc
     (p1   : Win32.LPCSTR;
      p2   : Win32.LPCSTR;
      p3   : Win32.LONG;
      p4   : access LHCLIENTDOC)
      return OLESTATUS;

   function OleRevokeClientDoc (p1 : LHCLIENTDOC) return OLESTATUS;

   function OleRenameClientDoc
     (p1   : LHCLIENTDOC;
      p2   : Win32.LPCSTR)
      return OLESTATUS;

   function OleRevertClientDoc (p1 : LHCLIENTDOC) return OLESTATUS;

   function OleSavedClientDoc (p1 : LHCLIENTDOC) return OLESTATUS;

   function OleEnumObjects
     (p1   : LHCLIENTDOC;
      p2   : access LPOLEOBJECT)
      return OLESTATUS;

   function OleRegisterServer
     (p1   : Win32.LPCSTR;
      p2   : LPOLESERVER;
      p3   : access LHSERVER;
      p4   : Win32.Windef.HINSTANCE;
      p5   : OLE_SERVER_USE)
      return OLESTATUS;

   function OleRevokeServer (p1 : LHSERVER) return OLESTATUS;

   function OleBlockServer (p1 : LHSERVER) return OLESTATUS;

   function OleUnblockServer
     (p1   : LHSERVER;
      p2   : access Win32.BOOL)
      return OLESTATUS;

   function OleLockServer
     (p1   : access OLEOBJECT;
      p2   : access LHSERVER)
      return OLESTATUS;

   function OleUnlockServer (p1 : LHSERVER) return OLESTATUS;

   function OleRegisterServerDoc
     (p1   : LHSERVER;
      p2   : Win32.LPCSTR;
      p3   : LPOLESERVERDOC;
      p4   : access LHSERVERDOC)
      return OLESTATUS;

   function OleRevokeServerDoc (p1 : LHSERVERDOC) return OLESTATUS;

   function OleRenameServerDoc
     (p1   : LHSERVERDOC;
      p2   : Win32.LPCSTR)
      return OLESTATUS;

   function OleRevertServerDoc (p1 : LHSERVERDOC) return OLESTATUS;

   function OleSavedServerDoc (p1 : LHSERVERDOC) return OLESTATUS;

private

   pragma Convention (C_Pass_By_Copy, OLETARGETDEVICE);
   pragma Convention (C_Pass_By_Copy, OLEOBJECT);
   pragma Convention (C_Pass_By_Copy, OLESTREAM);
   pragma Convention (C_Pass_By_Copy, OLECLIENT);
   pragma Convention (C, OLEOBJECTVTBL);
   pragma Convention (C_Pass_By_Copy, OLECLIENTVTBL);
   pragma Convention (C_Pass_By_Copy, OLESTREAMVTBL);
   pragma Convention (C_Pass_By_Copy, OLESERVER);
   pragma Convention (C_Pass_By_Copy, OLESERVERDOC);
   pragma Convention (C, OLESERVERVTBL);
   pragma Convention (C, OLESERVERDOCVTBL);

   pragma Import (Stdcall, OleDelete, "OleDelete");
   pragma Import (Stdcall, OleRelease, "OleRelease");
   pragma Import (Stdcall, OleSaveToStream, "OleSaveToStream");
   pragma Import (Stdcall, OleEqual, "OleEqual");
   pragma Import (Stdcall, OleCopyToClipboard, "OleCopyToClipboard");
   pragma Import (Stdcall, OleSetHostNames, "OleSetHostNames");
   pragma Import (Stdcall, OleSetTargetDevice, "OleSetTargetDevice");
   pragma Import (Stdcall, OleSetBounds, "OleSetBounds");
   pragma Import (Stdcall, OleSetColorScheme, "OleSetColorScheme");
   pragma Import (Stdcall, OleQueryBounds, "OleQueryBounds");
   pragma Import (Stdcall, OleQuerySize, "OleQuerySize");
   pragma Import (Stdcall, OleDraw, "OleDraw");
   pragma Import (Stdcall, OleQueryOpen, "OleQueryOpen");
   pragma Import (Stdcall, OleActivate, "OleActivate");
   pragma Import (Stdcall, OleExecute, "OleExecute");
   pragma Import (Stdcall, OleClose, "OleClose");
   pragma Import (Stdcall, OleUpdate, "OleUpdate");
   pragma Import (Stdcall, OleReconnect, "OleReconnect");
   pragma Import
     (Stdcall,
      OleGetLinkUpdateOptions,
      "OleGetLinkUpdateOptions");
   pragma Import
     (Stdcall,
      OleSetLinkUpdateOptions,
      "OleSetLinkUpdateOptions");
   pragma Import (Stdcall, OleQueryProtocol, "OleQueryProtocol");
   pragma Import (Stdcall, OleQueryReleaseStatus, "OleQueryReleaseStatus");
   pragma Import (Stdcall, OleQueryReleaseError, "OleQueryReleaseError");
   pragma Import (Stdcall, OleQueryReleaseMethod, "OleQueryReleaseMethod");
   pragma Import (Stdcall, OleQueryType, "OleQueryType");
   pragma Import (Stdcall, OleQueryClientVersion, "OleQueryClientVersion");
   pragma Import (Stdcall, OleQueryServerVersion, "OleQueryServerVersion");
   pragma Import (Stdcall, OleEnumFormats, "OleEnumFormats");
   pragma Import (Stdcall, OleGetData, "OleGetData");
   pragma Import (Stdcall, OleSetData, "OleSetData");
   pragma Import (Stdcall, OleQueryOutOfDate, "OleQueryOutOfDate");
   pragma Import (Stdcall, OleRequestData, "OleRequestData");
   pragma Import (Stdcall, OleQueryLinkFromClip, "OleQueryLinkFromClip");
   pragma Import (Stdcall, OleQueryCreateFromClip, "OleQueryCreateFromClip");
   pragma Import (Stdcall, OleCreateFromClip, "OleCreateFromClip");
   pragma Import (Stdcall, OleCreateLinkFromClip, "OleCreateLinkFromClip");
   pragma Import (Stdcall, OleCreateFromFile, "OleCreateFromFile");
   pragma Import (Stdcall, OleCreateLinkFromFile, "OleCreateLinkFromFile");
   pragma Import (Stdcall, OleLoadFromStream, "OleLoadFromStream");
   pragma Import (Stdcall, OleCreate, "OleCreate");
   pragma Import (Stdcall, OleCreateInvisible, "OleCreateInvisible");
   pragma Import (Stdcall, OleCreateFromTemplate, "OleCreateFromTemplate");
   pragma Import (Stdcall, OleClone, "OleClone");
   pragma Import (Stdcall, OleCopyFromLink, "OleCopyFromLink");
   pragma Import (Stdcall, OleObjectConvert, "OleObjectConvert");
   pragma Import (Stdcall, OleRename, "OleRename");
   pragma Import (Stdcall, OleQueryName, "OleQueryName");
   pragma Import (Stdcall, OleRevokeObject, "OleRevokeObject");
   pragma Import (Stdcall, OleIsDcMeta, "OleIsDcMeta");
   pragma Import (Stdcall, OleRegisterClientDoc, "OleRegisterClientDoc");
   pragma Import (Stdcall, OleRevokeClientDoc, "OleRevokeClientDoc");
   pragma Import (Stdcall, OleRenameClientDoc, "OleRenameClientDoc");
   pragma Import (Stdcall, OleRevertClientDoc, "OleRevertClientDoc");
   pragma Import (Stdcall, OleSavedClientDoc, "OleSavedClientDoc");
   pragma Import (Stdcall, OleEnumObjects, "OleEnumObjects");
   pragma Import (Stdcall, OleRegisterServer, "OleRegisterServer");
   pragma Import (Stdcall, OleRevokeServer, "OleRevokeServer");
   pragma Import (Stdcall, OleBlockServer, "OleBlockServer");
   pragma Import (Stdcall, OleUnblockServer, "OleUnblockServer");
   pragma Import (Stdcall, OleLockServer, "OleLockServer");
   pragma Import (Stdcall, OleUnlockServer, "OleUnlockServer");
   pragma Import (Stdcall, OleRegisterServerDoc, "OleRegisterServerDoc");
   pragma Import (Stdcall, OleRevokeServerDoc, "OleRevokeServerDoc");
   pragma Import (Stdcall, OleRenameServerDoc, "OleRenameServerDoc");
   pragma Import (Stdcall, OleRevertServerDoc, "OleRevertServerDoc");
   pragma Import (Stdcall, OleSavedServerDoc, "OleSavedServerDoc");

end Win32.Ole;
