--  $Source$
--  $Revision$ $Date$ $Author$
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

with Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;

package Win32.Ole is

   OT_LINK         : constant := 1;     --  ole.h:48
   OT_EMBEDDED     : constant := 2;     --  ole.h:49
   OT_STATIC       : constant := 3;     --  ole.h:50
   OLEVERB_PRIMARY : constant := 0;     --  ole.h:53
   OF_SET          : constant := 16#1#; --  ole.h:70
   OF_GET          : constant := 16#2#; --  ole.h:71
   OF_HANDLER      : constant := 16#4#; --  ole.h:72

   type OLESTATUS is
     ( --  ole.h:167
       OLE_OK,                         --  ole.h:77
       OLE_WAIT_FOR_RELEASE,           --  ole.h:79
       OLE_BUSY,                       --  ole.h:83
       OLE_ERROR_PROTECT_ONLY,         --  ole.h:86
       OLE_ERROR_MEMORY,               --  ole.h:87
       OLE_ERROR_STREAM,               --  ole.h:88
       OLE_ERROR_STATIC,               --  ole.h:89
       OLE_ERROR_BLANK,                --  ole.h:90
       OLE_ERROR_DRAW,                 --  ole.h:91
       OLE_ERROR_METAFILE,             --  ole.h:92
       OLE_ERROR_ABORT,                --  ole.h:93
       OLE_ERROR_CLIPBOARD,            --  ole.h:94
       OLE_ERROR_FORMAT,               --  ole.h:95
       OLE_ERROR_OBJECT,               --  ole.h:96
       OLE_ERROR_OPTION,               --  ole.h:97
       OLE_ERROR_PROTOCOL,             --  ole.h:98
       OLE_ERROR_ADDRESS,              --  ole.h:99
       OLE_ERROR_NOT_EQUAL,            --  ole.h:100
       OLE_ERROR_HANDLE,               --  ole.h:101
       OLE_ERROR_GENERIC,              --  ole.h:102
       OLE_ERROR_CLASS,                --  ole.h:103
       OLE_ERROR_SYNTAX,               --  ole.h:104
       OLE_ERROR_DATATYPE,             --  ole.h:105
       OLE_ERROR_PALETTE,              --  ole.h:106
       OLE_ERROR_NOT_LINK,             --  ole.h:107
       OLE_ERROR_NOT_EMPTY,            --  ole.h:108
       OLE_ERROR_SIZE,                 --  ole.h:109
       OLE_ERROR_DRIVE,                --  ole.h:113
       OLE_ERROR_NETWORK,              --  ole.h:114
       OLE_ERROR_NAME,                 --  ole.h:118
       OLE_ERROR_TEMPLATE,             --  ole.h:121
       OLE_ERROR_NEW,                  --  ole.h:122
       OLE_ERROR_EDIT,                 --  ole.h:123
       OLE_ERROR_OPEN,                 --  ole.h:125
       OLE_ERROR_NOT_OPEN,             --  ole.h:128
       OLE_ERROR_LAUNCH,               --  ole.h:129
       OLE_ERROR_COMM,                 --  ole.h:130
       OLE_ERROR_TERMINATE,            --  ole.h:131
       OLE_ERROR_COMMAND,              --  ole.h:132
       OLE_ERROR_SHOW,                 --  ole.h:133
       OLE_ERROR_DOVERB,               --  ole.h:134
       OLE_ERROR_ADVISE_NATIVE,        --  ole.h:136
       OLE_ERROR_ADVISE_PICT,          --  ole.h:137
       OLE_ERROR_ADVISE_RENAME,        --  ole.h:140
       OLE_ERROR_POKE_NATIVE,          --  ole.h:141
       OLE_ERROR_REQUEST_NATIVE,       --  ole.h:142
       OLE_ERROR_REQUEST_PICT,         --  ole.h:143
       OLE_ERROR_SERVER_BLOCKED,       --  ole.h:145
       OLE_ERROR_REGISTRATION,         --  ole.h:149
       OLE_ERROR_ALREADY_REGISTERED,   --  ole.h:151
       OLE_ERROR_TASK,                 --  ole.h:153
       OLE_ERROR_OUTOFDATE,            --  ole.h:154
       OLE_ERROR_CANT_UPDATE_CLIENT,   --  ole.h:155
       OLE_ERROR_UPDATE,               --  ole.h:157
       OLE_ERROR_SETDATA_FORMAT,       --  ole.h:158
       OLE_ERROR_STATIC_FROM_OTHER_OS, --  ole.h:160
       OLE_ERROR_FILE_VER,             --  ole.h:162
       OLE_WARN_DELETE_DATA            --  ole.h:167
       );

   for OLESTATUS use
      ( --  ole.h:167
        OLE_OK                         => 0,   --  ole.h:77
        OLE_WAIT_FOR_RELEASE           => 1,   --  ole.h:79
        OLE_BUSY                       => 2,   --  ole.h:83
        OLE_ERROR_PROTECT_ONLY         => 3,   --  ole.h:86
        OLE_ERROR_MEMORY               => 4,   --  ole.h:87
        OLE_ERROR_STREAM               => 5,   --  ole.h:88
        OLE_ERROR_STATIC               => 6,   --  ole.h:89
        OLE_ERROR_BLANK                => 7,   --  ole.h:90
        OLE_ERROR_DRAW                 => 8,   --  ole.h:91
        OLE_ERROR_METAFILE             => 9,   --  ole.h:92
        OLE_ERROR_ABORT                => 10,  --  ole.h:93
        OLE_ERROR_CLIPBOARD            => 11,  --  ole.h:94
        OLE_ERROR_FORMAT               => 12,  --  ole.h:95
        OLE_ERROR_OBJECT               => 13,  --  ole.h:96
        OLE_ERROR_OPTION               => 14,  --  ole.h:97
        OLE_ERROR_PROTOCOL             => 15,  --  ole.h:98
        OLE_ERROR_ADDRESS              => 16,  --  ole.h:99
        OLE_ERROR_NOT_EQUAL            => 17,  --  ole.h:100
        OLE_ERROR_HANDLE               => 18,  --  ole.h:101
        OLE_ERROR_GENERIC              => 19,  --  ole.h:102
        OLE_ERROR_CLASS                => 20,  --  ole.h:103
        OLE_ERROR_SYNTAX               => 21,  --  ole.h:104
        OLE_ERROR_DATATYPE             => 22,  --  ole.h:105
        OLE_ERROR_PALETTE              => 23,  --  ole.h:106
        OLE_ERROR_NOT_LINK             => 24,  --  ole.h:107
        OLE_ERROR_NOT_EMPTY            => 25,  --  ole.h:108
        OLE_ERROR_SIZE                 => 26,  --  ole.h:109
        OLE_ERROR_DRIVE                => 27,  --  ole.h:113
        OLE_ERROR_NETWORK              => 28,  --  ole.h:114
        OLE_ERROR_NAME                 => 29,  --  ole.h:118
        OLE_ERROR_TEMPLATE             => 30,  --  ole.h:121
        OLE_ERROR_NEW                  => 31,  --  ole.h:122
        OLE_ERROR_EDIT                 => 32,  --  ole.h:123
        OLE_ERROR_OPEN                 => 33,  --  ole.h:125
        OLE_ERROR_NOT_OPEN             => 34,  --  ole.h:128
        OLE_ERROR_LAUNCH               => 35,  --  ole.h:129
        OLE_ERROR_COMM                 => 36,  --  ole.h:130
        OLE_ERROR_TERMINATE            => 37,  --  ole.h:131
        OLE_ERROR_COMMAND              => 38,  --  ole.h:132
        OLE_ERROR_SHOW                 => 39,  --  ole.h:133
        OLE_ERROR_DOVERB               => 40,  --  ole.h:134
        OLE_ERROR_ADVISE_NATIVE        => 41,  --  ole.h:136
        OLE_ERROR_ADVISE_PICT          => 42,  --  ole.h:137
        OLE_ERROR_ADVISE_RENAME        => 43,  --  ole.h:140
        OLE_ERROR_POKE_NATIVE          => 44,  --  ole.h:141
        OLE_ERROR_REQUEST_NATIVE       => 45,  --  ole.h:142
        OLE_ERROR_REQUEST_PICT         => 46,  --  ole.h:143
        OLE_ERROR_SERVER_BLOCKED       => 47,  --  ole.h:145
        OLE_ERROR_REGISTRATION         => 48,  --  ole.h:149
        OLE_ERROR_ALREADY_REGISTERED   => 49,  --  ole.h:151
        OLE_ERROR_TASK                 => 50,  --  ole.h:153
        OLE_ERROR_OUTOFDATE            => 51,  --  ole.h:154
        OLE_ERROR_CANT_UPDATE_CLIENT   => 52,  --  ole.h:155
        OLE_ERROR_UPDATE               => 53,  --  ole.h:157
        OLE_ERROR_SETDATA_FORMAT       => 54,  --  ole.h:158
        OLE_ERROR_STATIC_FROM_OTHER_OS => 55,  --  ole.h:160
        OLE_ERROR_FILE_VER             => 56,  --  ole.h:162
        OLE_WARN_DELETE_DATA           => 1000 --  ole.h:167
        );
   for OLESTATUS'Size use 32;                              --  ole.h:167

   type OLE_NOTIFICATION is
     ( --  ole.h:182
       OLE_CHANGED,                                        --  ole.h:174
       OLE_SAVED,                                          --  ole.h:175
       OLE_CLOSED,                                         --  ole.h:176
       OLE_RENAMED,                                        --  ole.h:177
       OLE_QUERY_PAINT,                                    --  ole.h:178
       OLE_RELEASE,                                        --  ole.h:179
       OLE_QUERY_RETRY                                     --  ole.h:182
       );
   for OLE_NOTIFICATION'Size use 32;                       --  ole.h:182

   type OLE_RELEASE_METHOD is
     ( --  ole.h:208
       OLE_NONE,                                           --  ole.h:186
       OLE_DELETE,                                         --  ole.h:187
       OLE_LNKPASTE,                                       --  ole.h:188
       OLE_EMBPASTE,                                       --  ole.h:189
       OLE_SHOW,                                           --  ole.h:190
       OLE_RUN,                                            --  ole.h:191
       OLE_ACTIVATE,                                       --  ole.h:192
       OLE_UPDATE,                                         --  ole.h:193
       OLE_CLOSE,                                          --  ole.h:194
       OLE_RECONNECT,                                      --  ole.h:195
       OLE_SETUPDATEOPTIONS,                               --  ole.h:196
       OLE_SERVERUNLAUNCH,                                 --  ole.h:197
       OLE_LOADFROMSTREAM,                                 --  ole.h:198
       OLE_SETDATA,                                        --  ole.h:199
       OLE_REQUESTDATA,                                    --  ole.h:200
       OLE_OTHER,                                          --  ole.h:201
       OLE_CREATE,                                         --  ole.h:202
       OLE_CREATEFROMTEMPLATE,                             --  ole.h:203
       OLE_CREATELINKFROMFILE,                             --  ole.h:204
       OLE_COPYFROMLNK,                                    --  ole.h:205
       OLE_CREATEFROMFILE,                                 --  ole.h:206
       OLE_CREATEINVISIBLE                                 --  ole.h:208
       );
   for OLE_RELEASE_METHOD'Size use 32;                     --  ole.h:208

   type OLEOPT_RENDER is
     ( --  ole.h:216
      olerender_none,                                     --  ole.h:213
      olerender_draw,                                     --  ole.h:214
      olerender_format                                    --  ole.h:216
      );
   for OLEOPT_RENDER'Size use 32;                          --  ole.h:216

   type OLECLIPFORMAT is new Win32.WORD;                   --  ole.h:219

   type OLEOPT_UPDATE is
     ( --  ole.h:232
      oleupdate_always,                                   --  ole.h:224
      oleupdate_onsave,                                   --  ole.h:225
      oleupdate_oncall                                    --  ole.h:232
      );
   for OLEOPT_UPDATE'Size use 32;                          --  ole.h:232

   type LHSERVER is new Win32.LONG;                        --  ole.h:235
   type LHCLIENTDOC is new Win32.LONG;                     --  ole.h:236
   type LHSERVERDOC is new Win32.LONG;                     --  ole.h:237

   type OLE_SERVER_USE is
     ( --  ole.h:408
      OLE_SERVER_MULTI,                                   --  ole.h:406
      OLE_SERVER_SINGLE                                   --  ole.h:408
      );
   for OLE_SERVER_USE'Size use 32;                         --  ole.h:408

   subtype HOBJECT is Win32.Winnt.HANDLE;                 --  ole.h:234
   type OLETARGETDEVICE;                                   --  ole.h:56
   type OLEOBJECT;                                         --  ole.h:239
   type OLESTREAM;                                         --  ole.h:240
   type OLECLIENT;                                         --  ole.h:241
   type OLEOBJECTVTBL;                                     --  ole.h:245
   type OLECLIENTVTBL;                                     --  ole.h:309
   type OLESTREAMVTBL;                                     --  ole.h:322
   type OLESERVER;                                         --  ole.h:411
   type OLESERVERDOC;                                      --  ole.h:424
   type OLESERVERVTBL;                                     --  ole.h:432
   type OLESERVERDOCVTBL;                                  --  ole.h:479

   type LPOLETARGETDEVICE is access all OLETARGETDEVICE;   --  ole.h:67
   type LPOLEOBJECT is access all OLEOBJECT;               --  ole.h:239
   type LPOLESTREAM is access all OLESTREAM;               --  ole.h:240
   type LPOLECLIENT is access all OLECLIENT;               --  ole.h:241
   type LPOLEOBJECTVTBL is access all OLEOBJECTVTBL;       --  ole.h:299
   type LPOLECLIENTVTBL is access all OLECLIENTVTBL;       --  ole.h:314
   type LPOLESTREAMVTBL is access all OLESTREAMVTBL;       --  ole.h:327
   type LPOLESERVER is access all OLESERVER;               --  ole.h:411
   type LPOLESERVERDOC is access all OLESERVERDOC;         --  ole.h:424
   type LPOLESERVERVTBL is access all OLESERVERVTBL;       --  ole.h:472
   type LPOLESERVERDOCVTBL is access all OLESERVERDOCVTBL; --  ole.h:490

   type af_247_QueryProtocol is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR)
     return Win32.PVOID;                          --  ole.h:247
   pragma Convention (Stdcall, af_247_QueryProtocol);

   type af_248_Release is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:248
   pragma Convention (Stdcall, af_248_Release);

   type af_249_Show is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.BOOL)
     return OLESTATUS;                            --  ole.h:249
   pragma Convention (Stdcall, af_249_Show);

   type af_250_DoVerb is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.UINT;
      p3 : Win32.BOOL;
      p4 : Win32.BOOL)
     return OLESTATUS;                            --  ole.h:250
   pragma Convention (Stdcall, af_250_DoVerb);

   type af_251_GetData is access function
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT;
      p3 : access Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:251
   pragma Convention (Stdcall, af_251_GetData);

   type af_252_SetData is access function
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT;
      p3 : Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:252
   pragma Convention (Stdcall, af_252_SetData);

   type af_253_SetTargetDevice is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:253
   pragma Convention (Stdcall, af_253_SetTargetDevice);

   type af_254_SetBounds is access function
     (p1 : access OLEOBJECT;
      p2 : access Win32.Windef.RECT)
     return OLESTATUS;                            --  ole.h:254
   pragma Convention (Stdcall, af_254_SetBounds);

   type af_255_EnumFormats is access function
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT)
     return OLECLIPFORMAT;                        --  ole.h:255
   pragma Convention (Stdcall, af_255_EnumFormats);

   type af_256_SetColorScheme is access function
     (p1 : access OLEOBJECT;
      p2 : access Win32.Wingdi.LOGPALETTE)
     return OLESTATUS;                            --  ole.h:256
   pragma Convention (Stdcall, af_256_SetColorScheme);

   type af_261_Delete is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:261
   pragma Convention (Stdcall, af_261_Delete);

   type af_262_SetHostNames is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR;
      p3 : Win32.LPCSTR)
     return OLESTATUS;                            --  ole.h:262
   pragma Convention (Stdcall, af_262_SetHostNames);

   type af_263_SaveToStream is access function
     (p1 : access OLEOBJECT;
      p2 : LPOLESTREAM)
     return OLESTATUS;                            --  ole.h:263
   pragma Convention (Stdcall, af_263_SaveToStream);

   type af_264_Clone is access function
     (p1 : access OLEOBJECT;
      p2 : LPOLECLIENT;
      p3 : LHCLIENTDOC;
      p4 : Win32.LPCSTR;
      p5 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:264
   pragma Convention (Stdcall, af_264_Clone);

   type af_265_CopyFromLink is access function
     (p1 : access OLEOBJECT;
      p2 : LPOLECLIENT;
      p3 : LHCLIENTDOC;
      p4 : Win32.LPCSTR;
      p5 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:265
   pragma Convention (Stdcall, af_265_CopyFromLink);

   type af_266_Equal is access function
     (p1 : access OLEOBJECT;
      p2 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:266
   pragma Convention (Stdcall, af_266_Equal);

   type af_267_CopyToClipboard is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:267
   pragma Convention (Stdcall, af_267_CopyToClipboard);

   type af_268_Draw is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.Windef.HDC;
      p3 : access Win32.Windef.RECT;
      p4 : access Win32.Windef.RECT;
      p5 : Win32.Windef.HDC)
     return OLESTATUS;                            --  ole.h:268
   pragma Convention (Stdcall, af_268_Draw);

   type af_269_Activate is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.UINT;
      p3 : Win32.BOOL;
      p4 : Win32.BOOL;
      p5 : Win32.Windef.HWND;
      p6 : access Win32.Windef.RECT)
     return OLESTATUS;                            --  ole.h:269
   pragma Convention (Stdcall, af_269_Activate);

   type af_270_Execute is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.Winnt.HANDLE;
      p3 : Win32.UINT)
     return OLESTATUS;                            --  ole.h:270
   pragma Convention (Stdcall, af_270_Execute);

   type af_271_Close is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:271
   pragma Convention (Stdcall, af_271_Close);

   type af_272_Update is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:272
   pragma Convention (Stdcall, af_272_Update);

   type af_273_Reconnect is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:273
   pragma Convention (Stdcall, af_273_Reconnect);

   type af_275_ObjectConvert is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR;
      p3 : LPOLECLIENT;
      p4 : LHCLIENTDOC;
      p5 : Win32.LPCSTR;
      p6 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:275
   pragma Convention (Stdcall, af_275_ObjectConvert);

   type af_276_GetLinkUpdateOptions is access function
     (p1 : access OLEOBJECT;
      p2 : access OLEOPT_UPDATE)
     return OLESTATUS;                            --  ole.h:276
   pragma Convention (Stdcall, af_276_GetLinkUpdateOptions);

   type af_277_SetLinkUpdateOptions is access function
     (p1 : access OLEOBJECT;
      p2 : OLEOPT_UPDATE)
     return OLESTATUS;                            --  ole.h:277
   pragma Convention (Stdcall, af_277_SetLinkUpdateOptions);

   type af_279_Rename is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR)
     return OLESTATUS;                            --  ole.h:279
   pragma Convention (Stdcall, af_279_Rename);

   type af_280_QueryName is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.LPSTR;
      p3 : access Win32.UINT)
     return OLESTATUS;                            --  ole.h:280
   pragma Convention (Stdcall, af_280_QueryName);

   type af_282_QueryType is access function
     (p1 : access OLEOBJECT;
      p2 : access Win32.LONG)
     return OLESTATUS;                            --  ole.h:282
   pragma Convention (Stdcall, af_282_QueryType);

   type af_283_QueryBounds is access function
     (p1 : access OLEOBJECT;
      p2 : access Win32.Windef.RECT)
     return OLESTATUS;                            --  ole.h:283
   pragma Convention (Stdcall, af_283_QueryBounds);

   type af_284_QuerySize is access function
     (p1 : access OLEOBJECT;
      p2 : access Win32.DWORD)
     return OLESTATUS;                            --  ole.h:284
   pragma Convention (Stdcall, af_284_QuerySize);

   type af_285_QueryOpen is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:285
   pragma Convention (Stdcall, af_285_QueryOpen);

   type af_286_QueryOutOfDate is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:286
   pragma Convention (Stdcall, af_286_QueryOutOfDate);

   type af_288_QueryReleaseStatus is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:288
   pragma Convention (Stdcall, af_288_QueryReleaseStatus);

   type af_289_QueryReleaseError is access function
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:289
   pragma Convention (Stdcall, af_289_QueryReleaseError);

   type af_290_QueryReleaseMethod is access function
     (p1 : access OLEOBJECT)
     return OLE_RELEASE_METHOD;                   --  ole.h:290
   pragma Convention (Stdcall, af_290_QueryReleaseMethod);

   type af_292_RequestData is access function
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:292
   pragma Convention (Stdcall, af_292_RequestData);

   type af_293_ObjectLong is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.UINT;
      p3 : access Win32.LONG)
     return OLESTATUS;                            --  ole.h:293
   pragma Convention (Stdcall, af_293_ObjectLong);

   type af_296_ChangeData is access function
     (p1 : access OLEOBJECT;
      p2 : Win32.Winnt.HANDLE;
      p3 : LPOLECLIENT;
      p4 : Win32.BOOL)
     return OLESTATUS;                            --  ole.h:296
   pragma Convention (Stdcall, af_296_ChangeData);

   type af_311_CallBack is access function
     (p1 : LPOLECLIENT;
      p2 : OLE_NOTIFICATION;
      p3 : access OLEOBJECT)
     return Win32.INT;                            --  ole.h:311
   pragma Convention (Stdcall, af_311_CallBack);

   type af_324_Get is access function
     (p1 : LPOLESTREAM;
      p2 : Win32.PVOID;
      p3 : Win32.DWORD)
     return Win32.DWORD;                          --  ole.h:324
   pragma Convention (Stdcall, af_324_Get);

   type af_325_Put is access function
     (p1 : LPOLESTREAM;
      p2 : Win32.PVOID;
      p3 : Win32.DWORD)
     return Win32.DWORD;                          --  ole.h:325
   pragma Convention (Stdcall, af_325_Put);

   type af_434_Open is access function
     (p1 : LPOLESERVER;
      p2 : LHSERVERDOC;
      p3 : Win32.LPCSTR;
      p4 : access LPOLESERVERDOC)
     return OLESTATUS;                            --  ole.h:434
   pragma Convention (Stdcall, af_434_Open);

   type af_440_Create is access function
     (p1 : LPOLESERVER;
      p2 : LHSERVERDOC;
      p3 : Win32.LPCSTR;
      p4 : Win32.LPCSTR;
      p5 : access LPOLESERVERDOC)
     return OLESTATUS;                            --  ole.h:440
   pragma Convention (Stdcall, af_440_Create);

   type af_447_CreateFromTemplate is access function
     (p1 : LPOLESERVER;
      p2 : LHSERVERDOC;
      p3 : Win32.LPCSTR;
      p4 : Win32.LPCSTR;
      p5 : Win32.LPCSTR;
      p6 : access LPOLESERVERDOC)
     return OLESTATUS;                            --  ole.h:447
   pragma Convention (Stdcall, af_447_CreateFromTemplate);

   type af_455_Edit is access function
     (p1 : LPOLESERVER;
      p2 : LHSERVERDOC;
      p3 : Win32.LPCSTR;
      p4 : Win32.LPCSTR;
      p5 : access LPOLESERVERDOC)
     return OLESTATUS;                            --  ole.h:455
   pragma Convention (Stdcall, af_455_Edit);

   type af_462_c_Exit is access function
     (p1 : LPOLESERVER)
     return OLESTATUS;                            --  ole.h:462
   pragma Convention (Stdcall, af_462_c_Exit);

   type af_465_Release is access function
     (p1 : LPOLESERVER)
     return OLESTATUS;                            --  ole.h:465
   pragma Convention (Stdcall, af_465_Release);

   type af_468_Execute is access function
     (p1 : LPOLESERVER;
      p2 : Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:468
   pragma Convention (Stdcall, af_468_Execute);

   type af_481_Save is access function
     (p1 : LPOLESERVERDOC)
     return OLESTATUS;                            --  ole.h:481
   pragma Convention (Stdcall, af_481_Save);

   type af_482_Close is access function
     (p1 : LPOLESERVERDOC)
     return OLESTATUS;                            --  ole.h:482
   pragma Convention (Stdcall, af_482_Close);

   type af_483_SetHostNames is access function
     (p1 : LPOLESERVERDOC;
      p2 : Win32.LPCSTR;
      p3 : Win32.LPCSTR)
     return OLESTATUS;                            --  ole.h:483
   pragma Convention (Stdcall, af_483_SetHostNames);

   type af_484_SetDocDimensions is access function
     (p1 : LPOLESERVERDOC;
      p2 : access Win32.Windef.RECT)
     return OLESTATUS;                            --  ole.h:484
   pragma Convention (Stdcall, af_484_SetDocDimensions);

   type af_485_GetObjectA is access function
     (p1 : LPOLESERVERDOC;
      p2 : Win32.LPCSTR;
      p3 : access LPOLEOBJECT;
      p4 : LPOLECLIENT)
     return OLESTATUS;                            --  ole.h:485
   pragma Convention (Stdcall, af_485_GetObjectA);

   type af_486_Release is access function
     (p1 : LPOLESERVERDOC)
     return OLESTATUS;                            --  ole.h:486
   pragma Convention (Stdcall, af_486_Release);

   type af_487_SetColorScheme is access function
     (p1 : LPOLESERVERDOC;
      p2 : access Win32.Wingdi.LOGPALETTE)
     return OLESTATUS;                            --  ole.h:487
   pragma Convention (Stdcall, af_487_SetColorScheme);

   type af_488_Execute is access function
     (p1 : LPOLESERVERDOC;
      p2 : Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:488
   pragma Convention (Stdcall, af_488_Execute);

   type OLETARGETDEVICE is                                 --  ole.h:56
      record
         otdDeviceNameOffset : Win32.USHORT;             --  ole.h:58
         otdDriverNameOffset : Win32.USHORT;             --  ole.h:59
         otdPortNameOffset : Win32.USHORT;             --  ole.h:60
         otdExtDevmodeOffset : Win32.USHORT;             --  ole.h:61
         otdExtDevmodeSize : Win32.USHORT;             --  ole.h:62
         otdEnvironmentOffset : Win32.USHORT;             --  ole.h:63
         otdEnvironmentSize : Win32.USHORT;             --  ole.h:64
         otdData : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  ole.h:65
      end record;

   type OLEOBJECT is                                       --  ole.h:239
      record
         lpvtbl : LPOLEOBJECTVTBL;                        --  ole.h:304
      end record;

   type OLESTREAM is                                       --  ole.h:240
      record
         lpstbl : LPOLESTREAMVTBL;                        --  ole.h:331
      end record;

   type OLECLIENT is                                       --  ole.h:241
      record
         lpvtbl : LPOLECLIENTVTBL;                        --  ole.h:318
      end record;

   type OLEOBJECTVTBL is                                   --  ole.h:245
      record
         QueryProtocol : af_247_QueryProtocol;     --  ole.h:247
         Release : af_248_Release;           --  ole.h:248
         Show : af_249_Show;              --  ole.h:249
         DoVerb : af_250_DoVerb;            --  ole.h:250
         GetData : af_251_GetData;           --  ole.h:251
         SetData : af_252_SetData;           --  ole.h:252
         SetTargetDevice : af_253_SetTargetDevice;   --  ole.h:253
         SetBounds : af_254_SetBounds;         --  ole.h:254
         EnumFormats : af_255_EnumFormats;       --  ole.h:255
         SetColorScheme : af_256_SetColorScheme;    --  ole.h:256
         Delete : af_261_Delete;            --  ole.h:261
         SetHostNames : af_262_SetHostNames;      --  ole.h:262
         SaveToStream : af_263_SaveToStream;      --  ole.h:263
         Clone : af_264_Clone;             --  ole.h:264
         CopyFromLink : af_265_CopyFromLink;      --  ole.h:265
         Equal : af_266_Equal;             --  ole.h:266
         CopyToClipboard : af_267_CopyToClipboard;   --  ole.h:267
         Draw : af_268_Draw;              --  ole.h:268
         Activate : af_269_Activate;          --  ole.h:269
         Execute : af_270_Execute;           --  ole.h:270
         Close : af_271_Close;             --  ole.h:271
         Update : af_272_Update;            --  ole.h:272
         Reconnect : af_273_Reconnect;         --  ole.h:273
         ObjectConvert : af_275_ObjectConvert;     --  ole.h:275
         GetLinkUpdateOptions : af_276_GetLinkUpdateOptions;
         --  ole.h:276
         SetLinkUpdateOptions : af_277_SetLinkUpdateOptions;
         --  ole.h:277
         Rename : af_279_Rename;            --  ole.h:279
         QueryName : af_280_QueryName;         --  ole.h:280
         QueryType : af_282_QueryType;         --  ole.h:282
         QueryBounds : af_283_QueryBounds;       --  ole.h:283
         QuerySize : af_284_QuerySize;         --  ole.h:284
         QueryOpen : af_285_QueryOpen;         --  ole.h:285
         QueryOutOfDate : af_286_QueryOutOfDate;    --  ole.h:286
         QueryReleaseStatus : af_288_QueryReleaseStatus; --  ole.h:288
         QueryReleaseError : af_289_QueryReleaseError; --  ole.h:289
         QueryReleaseMethod : af_290_QueryReleaseMethod; --  ole.h:290
         RequestData : af_292_RequestData;       --  ole.h:292
         ObjectLong : af_293_ObjectLong;        --  ole.h:293
         ChangeData : af_296_ChangeData;        --  ole.h:296
      end record;

   type OLECLIENTVTBL is                                   --  ole.h:309
      record
         CallBack : af_311_CallBack;                      --  ole.h:311
      end record;

   type OLESTREAMVTBL is                                   --  ole.h:322
      record
         Get : af_324_Get;                                --  ole.h:324
         Put : af_325_Put;                                --  ole.h:325
      end record;

   type OLESERVER is                                       --  ole.h:411
      record
         lpvtbl : LPOLESERVERVTBL;                        --  ole.h:476
      end record;

   type OLESERVERDOC is                                    --  ole.h:424
      record
         lpvtbl : LPOLESERVERDOCVTBL;                     --  ole.h:494
      end record;

   type OLESERVERVTBL is                                   --  ole.h:432
      record
         Open : af_434_Open;                --  ole.h:434
         Create : af_440_Create;              --  ole.h:440
         CreateFromTemplate : af_447_CreateFromTemplate;  --  ole.h:447
         Edit : af_455_Edit;                --  ole.h:455
         c_Exit : af_462_c_Exit;              --  ole.h:462
         Release : af_465_Release;             --  ole.h:465
         Execute : af_468_Execute;             --  ole.h:468
      end record;

   type OLESERVERDOCVTBL is                                --  ole.h:479
      record
         Save : af_481_Save;                  --  ole.h:481
         Close : af_482_Close;                 --  ole.h:482
         SetHostNames : af_483_SetHostNames;          --  ole.h:483
         SetDocDimensions : af_484_SetDocDimensions;      --  ole.h:484
         GetObjectA : af_485_GetObjectA;            --  ole.h:485
         Release : af_486_Release;               --  ole.h:486
         SetColorScheme : af_487_SetColorScheme;        --  ole.h:487
         Execute : af_488_Execute;               --  ole.h:488
      end record;

   function OleDelete
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:335

   function OleRelease
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:336

   function OleSaveToStream
     (p1 : access OLEOBJECT;
      p2 : LPOLESTREAM)
     return OLESTATUS;                            --  ole.h:337

   function OleEqual
     (p1 : access OLEOBJECT;
      p2 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:338

   function OleCopyToClipboard
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:339

   function OleSetHostNames
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR;
      p3 : Win32.LPCSTR)
     return OLESTATUS;                            --  ole.h:340

   function OleSetTargetDevice
     (p1 : access OLEOBJECT;
      p2 : Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:341

   function OleSetBounds
     (p1 : access OLEOBJECT;
      p2 : Win32.Wingdi.ac_RECT_t)
     return OLESTATUS;                            --  ole.h:342

   function OleSetColorScheme
     (p1 : access OLEOBJECT;
      p2 : Win32.Wingdi.ac_LOGPALETTE_t)
     return OLESTATUS;                            --  ole.h:343

   function OleQueryBounds
     (p1 : access OLEOBJECT;
      p2 : access Win32.Windef.RECT)
     return OLESTATUS;                            --  ole.h:344

   function OleQuerySize
     (p1 : access OLEOBJECT;
      p2 : access Win32.DWORD)
     return OLESTATUS;                            --  ole.h:345

   function OleDraw
     (p1 : access OLEOBJECT;
      p2 : Win32.Windef.HDC;
      p3 : Win32.Wingdi.ac_RECT_t;
      p4 : Win32.Wingdi.ac_RECT_t;
      p5 : Win32.Windef.HDC)
     return OLESTATUS;                            --  ole.h:346

   function OleQueryOpen
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:347

   function OleActivate
     (p1 : access OLEOBJECT;
      p2 : Win32.UINT;
      p3 : Win32.BOOL;
      p4 : Win32.BOOL;
      p5 : Win32.Windef.HWND;
      p6 : Win32.Wingdi.ac_RECT_t)
     return OLESTATUS;                            --  ole.h:348

   function OleExecute
     (p1 : access OLEOBJECT;
      p2 : Win32.Winnt.HANDLE;
      p3 : Win32.UINT)
     return OLESTATUS;                            --  ole.h:349

   function OleClose
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:350

   function OleUpdate
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:351

   function OleReconnect
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:352

   function OleGetLinkUpdateOptions
     (p1 : access OLEOBJECT;
      p2 : access OLEOPT_UPDATE)
     return OLESTATUS;                            --  ole.h:353

   function OleSetLinkUpdateOptions
     (p1 : access OLEOBJECT;
      p2 : OLEOPT_UPDATE)
     return OLESTATUS;                            --  ole.h:354

   function OleQueryProtocol
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR)
     return Win32.PVOID;                          --  ole.h:355

   function OleQueryReleaseStatus
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:358

   function OleQueryReleaseError
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:359

   function OleQueryReleaseMethod
     (p1 : access OLEOBJECT)
     return OLE_RELEASE_METHOD;                   --  ole.h:360

   function OleQueryType
     (p1 : access OLEOBJECT;
      p2 : access Win32.LONG)
     return OLESTATUS;                            --  ole.h:362

   function OleQueryClientVersion return Win32.DWORD;      --  ole.h:365

   function OleQueryServerVersion return Win32.DWORD;      --  ole.h:366

   function OleEnumFormats
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT)
     return OLECLIPFORMAT;                        --  ole.h:369

   function OleGetData
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT;
      p3 : access Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:370

   function OleSetData
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT;
      p3 : Win32.Winnt.HANDLE)
     return OLESTATUS;                            --  ole.h:371

   function OleQueryOutOfDate
     (p1 : access OLEOBJECT)
     return OLESTATUS;                            --  ole.h:372

   function OleRequestData
     (p1 : access OLEOBJECT;
      p2 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:373

   function OleQueryLinkFromClip
     (p1 : Win32.LPCSTR;
      p2 : OLEOPT_RENDER;
      p3 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:376

   function OleQueryCreateFromClip
     (p1 : Win32.LPCSTR;
      p2 : OLEOPT_RENDER;
      p3 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:377

   function OleCreateFromClip
     (p1 : Win32.LPCSTR;
      p2 : LPOLECLIENT;
      p3 : LHCLIENTDOC;
      p4 : Win32.LPCSTR;
      p5 : access LPOLEOBJECT;
      p6 : OLEOPT_RENDER;
      p7 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:380

   function OleCreateLinkFromClip
     (p1 : Win32.LPCSTR;
      p2 : LPOLECLIENT;
      p3 : LHCLIENTDOC;
      p4 : Win32.LPCSTR;
      p5 : access LPOLEOBJECT;
      p6 : OLEOPT_RENDER;
      p7 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:381

   function OleCreateFromFile
     (p1 : Win32.LPCSTR;
      p2 : LPOLECLIENT;
      p3 : Win32.LPCSTR;
      p4 : Win32.LPCSTR;
      p5 : LHCLIENTDOC;
      p6 : Win32.LPCSTR;
      p7 : access LPOLEOBJECT;
      p8 : OLEOPT_RENDER;
      p9 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:382

   function OleCreateLinkFromFile
     (p1 : Win32.LPCSTR;
      p2 : LPOLECLIENT;
      p3 : Win32.LPCSTR;
      p4 : Win32.LPCSTR;
      p5 : Win32.LPCSTR;
      p6 : LHCLIENTDOC;
      p7 : Win32.LPCSTR;
      p8 : access LPOLEOBJECT;
      p9 : OLEOPT_RENDER;
      p10 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:383

   function OleLoadFromStream
     (p1 : LPOLESTREAM;
      p2 : Win32.LPCSTR;
      p3 : LPOLECLIENT;
      p4 : LHCLIENTDOC;
      p5 : Win32.LPCSTR;
      p6 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:384

   function OleCreate
     (p1 : Win32.LPCSTR;
      p2 : LPOLECLIENT;
      p3 : Win32.LPCSTR;
      p4 : LHCLIENTDOC;
      p5 : Win32.LPCSTR;
      p6 : access LPOLEOBJECT;
      p7 : OLEOPT_RENDER;
      p8 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:385

   function OleCreateInvisible
     (p1 : Win32.LPCSTR;
      p2 : LPOLECLIENT;
      p3 : Win32.LPCSTR;
      p4 : LHCLIENTDOC;
      p5 : Win32.LPCSTR;
      p6 : access LPOLEOBJECT;
      p7 : OLEOPT_RENDER;
      p8 : OLECLIPFORMAT;
      p9 : Win32.BOOL)
     return OLESTATUS;                            --  ole.h:386

   function OleCreateFromTemplate
     (p1 : Win32.LPCSTR;
      p2 : LPOLECLIENT;
      p3 : Win32.LPCSTR;
      p4 : LHCLIENTDOC;
      p5 : Win32.LPCSTR;
      p6 : access LPOLEOBJECT;
      p7 : OLEOPT_RENDER;
      p8 : OLECLIPFORMAT)
     return OLESTATUS;                            --  ole.h:387

   function OleClone
     (p1 : access OLEOBJECT;
      p2 : LPOLECLIENT;
      p3 : LHCLIENTDOC;
      p4 : Win32.LPCSTR;
      p5 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:388

   function OleCopyFromLink
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR;
      p3 : LPOLECLIENT;
      p4 : LHCLIENTDOC;
      p5 : Win32.LPCSTR;
      p6 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:389

   function OleObjectConvert
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR;
      p3 : LPOLECLIENT;
      p4 : LHCLIENTDOC;
      p5 : Win32.LPCSTR;
      p6 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:390

   function OleRename
     (p1 : access OLEOBJECT;
      p2 : Win32.LPCSTR)
     return OLESTATUS;                            --  ole.h:391

   function OleQueryName
     (p1 : access OLEOBJECT;
      p2 : Win32.LPSTR;
      p3 : access Win32.UINT)
     return OLESTATUS;                            --  ole.h:392

   function OleRevokeObject
     (p1 : LPOLECLIENT)
     return OLESTATUS;                            --  ole.h:393

   function OleIsDcMeta
     (p1 : Win32.Windef.HDC)
     return Win32.BOOL;                           --  ole.h:394

   function OleRegisterClientDoc
     (p1 : Win32.LPCSTR;
      p2 : Win32.LPCSTR;
      p3 : Win32.LONG;
      p4 : access LHCLIENTDOC)
     return OLESTATUS;                            --  ole.h:397

   function OleRevokeClientDoc
     (p1 : LHCLIENTDOC)
     return OLESTATUS;                            --  ole.h:398

   function OleRenameClientDoc
     (p1 : LHCLIENTDOC;
      p2 : Win32.LPCSTR)
     return OLESTATUS;                            --  ole.h:399

   function OleRevertClientDoc
     (p1 : LHCLIENTDOC)
     return OLESTATUS;                            --  ole.h:400

   function OleSavedClientDoc
     (p1 : LHCLIENTDOC)
     return OLESTATUS;                            --  ole.h:401

   function OleEnumObjects
     (p1 : LHCLIENTDOC;
      p2 : access LPOLEOBJECT)
     return OLESTATUS;                            --  ole.h:402

   function OleRegisterServer
     (p1 : Win32.LPCSTR;
      p2 : LPOLESERVER;
      p3 : access LHSERVER;
      p4 : Win32.Windef.HINSTANCE;
      p5 : OLE_SERVER_USE)
     return OLESTATUS;                            --  ole.h:413

   function OleRevokeServer
     (p1 : LHSERVER)
     return OLESTATUS;                            --  ole.h:414

   function OleBlockServer
     (p1 : LHSERVER)
     return OLESTATUS;                            --  ole.h:415

   function OleUnblockServer
     (p1 : LHSERVER;
      p2 : access Win32.BOOL)
     return OLESTATUS;                            --  ole.h:416

   function OleLockServer
     (p1 : access OLEOBJECT;
      p2 : access LHSERVER)
     return OLESTATUS;                            --  ole.h:419

   function OleUnlockServer
     (p1 : LHSERVER)
     return OLESTATUS;                            --  ole.h:420

   function OleRegisterServerDoc
     (p1 : LHSERVER;
      p2 : Win32.LPCSTR;
      p3 : LPOLESERVERDOC;
      p4 : access LHSERVERDOC)
     return OLESTATUS;                            --  ole.h:426

   function OleRevokeServerDoc
     (p1 : LHSERVERDOC)
     return OLESTATUS;                            --  ole.h:427

   function OleRenameServerDoc
     (p1 : LHSERVERDOC;
      p2 : Win32.LPCSTR)
     return OLESTATUS;                            --  ole.h:428

   function OleRevertServerDoc
     (p1 : LHSERVERDOC)
     return OLESTATUS;                            --  ole.h:429

   function OleSavedServerDoc
     (p1 : LHSERVERDOC)
     return OLESTATUS;                            --  ole.h:430

private

   pragma Convention (C_Pass_By_Copy, OLETARGETDEVICE);           --  ole.h:56
   pragma Convention (C_Pass_By_Copy, OLEOBJECT);                 --  ole.h:239
   pragma Convention (C_Pass_By_Copy, OLESTREAM);                 --  ole.h:240
   pragma Convention (C_Pass_By_Copy, OLECLIENT);                 --  ole.h:241
   pragma Convention (C, OLEOBJECTVTBL);                          --  ole.h:245
   pragma Convention (C_Pass_By_Copy, OLECLIENTVTBL);             --  ole.h:309
   pragma Convention (C_Pass_By_Copy, OLESTREAMVTBL);             --  ole.h:322
   pragma Convention (C_Pass_By_Copy, OLESERVER);                 --  ole.h:411
   pragma Convention (C_Pass_By_Copy, OLESERVERDOC);              --  ole.h:424
   pragma Convention (C, OLESERVERVTBL);                          --  ole.h:432
   pragma Convention (C, OLESERVERDOCVTBL);                       --  ole.h:479

   pragma Import (Stdcall, OleDelete, "OleDelete");               --  ole.h:335
   pragma Import (Stdcall, OleRelease, "OleRelease");             --  ole.h:336
   pragma Import (Stdcall, OleSaveToStream, "OleSaveToStream");   --  ole.h:337
   pragma Import (Stdcall, OleEqual, "OleEqual");                 --  ole.h:338
   pragma Import (Stdcall, OleCopyToClipboard, "OleCopyToClipboard");
   --  ole.h:339
   pragma Import (Stdcall, OleSetHostNames, "OleSetHostNames");   --  ole.h:340
   pragma Import (Stdcall, OleSetTargetDevice, "OleSetTargetDevice");
   --  ole.h:341
   pragma Import (Stdcall, OleSetBounds, "OleSetBounds");         --  ole.h:342
   pragma Import (Stdcall, OleSetColorScheme, "OleSetColorScheme");
   --  ole.h:343
   pragma Import (Stdcall, OleQueryBounds, "OleQueryBounds");     --  ole.h:344
   pragma Import (Stdcall, OleQuerySize, "OleQuerySize");         --  ole.h:345
   pragma Import (Stdcall, OleDraw, "OleDraw");                   --  ole.h:346
   pragma Import (Stdcall, OleQueryOpen, "OleQueryOpen");         --  ole.h:347
   pragma Import (Stdcall, OleActivate, "OleActivate");           --  ole.h:348
   pragma Import (Stdcall, OleExecute, "OleExecute");             --  ole.h:349
   pragma Import (Stdcall, OleClose, "OleClose");                 --  ole.h:350
   pragma Import (Stdcall, OleUpdate, "OleUpdate");               --  ole.h:351
   pragma Import (Stdcall, OleReconnect, "OleReconnect");         --  ole.h:352
   pragma Import (Stdcall, OleGetLinkUpdateOptions, "OleGetLinkUpdateOptions");
   --  ole.h:353
   pragma Import (Stdcall, OleSetLinkUpdateOptions, "OleSetLinkUpdateOptions");
   --  ole.h:354
   pragma Import (Stdcall, OleQueryProtocol, "OleQueryProtocol"); --  ole.h:355
   pragma Import (Stdcall, OleQueryReleaseStatus, "OleQueryReleaseStatus");
   --  ole.h:358
   pragma Import (Stdcall, OleQueryReleaseError, "OleQueryReleaseError");
   --  ole.h:359
   pragma Import (Stdcall, OleQueryReleaseMethod, "OleQueryReleaseMethod");
   --  ole.h:360
   pragma Import (Stdcall, OleQueryType, "OleQueryType");         --  ole.h:362
   pragma Import (Stdcall, OleQueryClientVersion, "OleQueryClientVersion");
   --  ole.h:365
   pragma Import (Stdcall, OleQueryServerVersion, "OleQueryServerVersion");
   --  ole.h:366
   pragma Import (Stdcall, OleEnumFormats, "OleEnumFormats");     --  ole.h:369
   pragma Import (Stdcall, OleGetData, "OleGetData");             --  ole.h:370
   pragma Import (Stdcall, OleSetData, "OleSetData");             --  ole.h:371
   pragma Import (Stdcall, OleQueryOutOfDate, "OleQueryOutOfDate");
   --  ole.h:372
   pragma Import (Stdcall, OleRequestData, "OleRequestData");     --  ole.h:373
   pragma Import (Stdcall, OleQueryLinkFromClip, "OleQueryLinkFromClip");
   --  ole.h:376
   pragma Import (Stdcall, OleQueryCreateFromClip, "OleQueryCreateFromClip");
   --  ole.h:377
   pragma Import (Stdcall, OleCreateFromClip, "OleCreateFromClip");
   --  ole.h:380
   pragma Import (Stdcall, OleCreateLinkFromClip, "OleCreateLinkFromClip");
   --  ole.h:381
   pragma Import (Stdcall, OleCreateFromFile, "OleCreateFromFile");
   --  ole.h:382
   pragma Import (Stdcall, OleCreateLinkFromFile, "OleCreateLinkFromFile");
   --  ole.h:383
   pragma Import (Stdcall, OleLoadFromStream, "OleLoadFromStream");
   --  ole.h:384
   pragma Import (Stdcall, OleCreate, "OleCreate");               --  ole.h:385
   pragma Import (Stdcall, OleCreateInvisible, "OleCreateInvisible");
   --  ole.h:386
   pragma Import (Stdcall, OleCreateFromTemplate, "OleCreateFromTemplate");
   --  ole.h:387
   pragma Import (Stdcall, OleClone, "OleClone");                 --  ole.h:388
   pragma Import (Stdcall, OleCopyFromLink, "OleCopyFromLink");   --  ole.h:389
   pragma Import (Stdcall, OleObjectConvert, "OleObjectConvert"); --  ole.h:390
   pragma Import (Stdcall, OleRename, "OleRename");               --  ole.h:391
   pragma Import (Stdcall, OleQueryName, "OleQueryName");         --  ole.h:392
   pragma Import (Stdcall, OleRevokeObject, "OleRevokeObject");   --  ole.h:393
   pragma Import (Stdcall, OleIsDcMeta, "OleIsDcMeta");           --  ole.h:394
   pragma Import (Stdcall, OleRegisterClientDoc, "OleRegisterClientDoc");
   --  ole.h:397
   pragma Import (Stdcall, OleRevokeClientDoc, "OleRevokeClientDoc");
   --  ole.h:398
   pragma Import (Stdcall, OleRenameClientDoc, "OleRenameClientDoc");
   --  ole.h:399
   pragma Import (Stdcall, OleRevertClientDoc, "OleRevertClientDoc");
   --  ole.h:400
   pragma Import (Stdcall, OleSavedClientDoc, "OleSavedClientDoc");
   --  ole.h:401
   pragma Import (Stdcall, OleEnumObjects, "OleEnumObjects");     --  ole.h:402
   pragma Import (Stdcall, OleRegisterServer, "OleRegisterServer");
   --  ole.h:413
   pragma Import (Stdcall, OleRevokeServer, "OleRevokeServer");   --  ole.h:414
   pragma Import (Stdcall, OleBlockServer, "OleBlockServer");     --  ole.h:415
   pragma Import (Stdcall, OleUnblockServer, "OleUnblockServer"); --  ole.h:416
   pragma Import (Stdcall, OleLockServer, "OleLockServer");       --  ole.h:419
   pragma Import (Stdcall, OleUnlockServer, "OleUnlockServer");   --  ole.h:420
   pragma Import (Stdcall, OleRegisterServerDoc, "OleRegisterServerDoc");
   --  ole.h:426
   pragma Import (Stdcall, OleRevokeServerDoc, "OleRevokeServerDoc");
   --  ole.h:427
   pragma Import (Stdcall, OleRenameServerDoc, "OleRenameServerDoc");
   --  ole.h:428
   pragma Import (Stdcall, OleRevertServerDoc, "OleRevertServerDoc");
   --  ole.h:429
   pragma Import (Stdcall, OleSavedServerDoc, "OleSavedServerDoc");
   --  ole.h:430

end Win32.Ole;


