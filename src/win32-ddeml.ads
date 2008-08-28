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

with Win32.Windef;
with Win32.Winnt;

package Win32.Ddeml is

   use type Interfaces.C.char_array;

   XST_NULL           : constant := 0;        --  ddeml.h:74
   XST_INCOMPLETE     : constant := 1;        --  ddeml.h:75
   XST_CONNECTED      : constant := 2;        --  ddeml.h:76
   XST_INIT1          : constant := 3;        --  ddeml.h:77
   XST_INIT2          : constant := 4;        --  ddeml.h:78
   XST_REQSENT        : constant := 5;        --  ddeml.h:79
   XST_DATARCVD       : constant := 6;        --  ddeml.h:80
   XST_POKESENT       : constant := 7;        --  ddeml.h:81
   XST_POKEACKRCVD    : constant := 8;        --  ddeml.h:82
   XST_EXECSENT       : constant := 9;        --  ddeml.h:83
   XST_EXECACKRCVD    : constant := 10;       --  ddeml.h:84
   XST_ADVSENT        : constant := 11;       --  ddeml.h:85
   XST_UNADVSENT      : constant := 12;       --  ddeml.h:86
   XST_ADVACKRCVD     : constant := 13;       --  ddeml.h:87
   XST_UNADVACKRCVD   : constant := 14;       --  ddeml.h:88
   XST_ADVDATASENT    : constant := 15;       --  ddeml.h:89
   XST_ADVDATAACKRCVD : constant := 16;       --  ddeml.h:90
   CADV_LATEACK       : constant := 16#ffff#; --  ddeml.h:93
   ST_CONNECTED       : constant := 16#1#;    --  ddeml.h:97
   ST_ADVISE          : constant := 16#2#;    --  ddeml.h:98
   ST_ISLOCAL         : constant := 16#4#;    --  ddeml.h:99
   ST_BLOCKED         : constant := 16#8#;    --  ddeml.h:100
   ST_CLIENT          : constant := 16#10#;   --  ddeml.h:101
   ST_TERMINATED      : constant := 16#20#;   --  ddeml.h:102
   ST_INLIST          : constant := 16#40#;   --  ddeml.h:103
   ST_BLOCKNEXT       : constant := 16#80#;   --  ddeml.h:104
   ST_ISSELF          : constant := 16#100#;  --  ddeml.h:105
   DDE_FACK           : constant := 16#8000#; --  ddeml.h:110
   DDE_FBUSY          : constant := 16#4000#; --  ddeml.h:111
   DDE_FDEFERUPD      : constant := 16#4000#; --  ddeml.h:112
   DDE_FACKREQ        : constant := 16#8000#; --  ddeml.h:113
   DDE_FRELEASE       : constant := 16#2000#; --  ddeml.h:114
   DDE_FREQUESTED     : constant := 16#1000#; --  ddeml.h:115
   DDE_FAPPSTATUS     : constant := 16#ff#;   --  ddeml.h:116
   DDE_FNOTPROCESSED  : constant := 16#0#;    --  ddeml.h:117
   DDE_FACKRESERVED : constant := 16#ffff3f00#;
   --  ddeml.h:119
   DDE_FADVRESERVED : constant := 16#ffff3fff#;
   --  ddeml.h:120
   DDE_FDATRESERVED : constant := 16#ffff4fff#;
   --  ddeml.h:121
   DDE_FPOKRESERVED : constant := 16#ffffdfff#;
   --  ddeml.h:122
   MSGF_DDEMGR          : constant := 16#8001#; --  ddeml.h:126
   CP_WINANSI           : constant := 1004;     --  ddeml.h:130
   CP_WINUNICODE        : constant := 1200;     --  ddeml.h:131
   XTYPF_NOBLOCK        : constant := 16#2#;    --  ddeml.h:135
   XTYPF_NODATA         : constant := 16#4#;    --  ddeml.h:136
   XTYPF_ACKREQ         : constant := 16#8#;    --  ddeml.h:137
   XCLASS_MASK          : constant := 16#fc00#; --  ddeml.h:139
   XCLASS_BOOL          : constant := 16#1000#; --  ddeml.h:140
   XCLASS_DATA          : constant := 16#2000#; --  ddeml.h:141
   XCLASS_FLAGS         : constant := 16#4000#; --  ddeml.h:142
   XCLASS_NOTIFICATION  : constant := 16#8000#; --  ddeml.h:143
   XTYP_ERROR           : constant := 16#8002#; --  ddeml.h:145
   XTYP_ADVDATA         : constant := 16#4010#; --  ddeml.h:146
   XTYP_ADVREQ          : constant := 16#2022#; --  ddeml.h:147
   XTYP_ADVSTART        : constant := 16#1030#; --  ddeml.h:148
   XTYP_ADVSTOP         : constant := 16#8040#; --  ddeml.h:149
   XTYP_EXECUTE         : constant := 16#4050#; --  ddeml.h:150
   XTYP_CONNECT         : constant := 16#1062#; --  ddeml.h:151
   XTYP_CONNECT_CONFIRM : constant := 16#8072#; --  ddeml.h:152
   XTYP_XACT_COMPLETE   : constant := 16#8080#; --  ddeml.h:153
   XTYP_POKE            : constant := 16#4090#; --  ddeml.h:154
   XTYP_REGISTER        : constant := 16#80a2#; --  ddeml.h:155
   XTYP_REQUEST         : constant := 16#20b0#; --  ddeml.h:156
   XTYP_DISCONNECT      : constant := 16#80c2#; --  ddeml.h:157
   XTYP_UNREGISTER      : constant := 16#80d2#; --  ddeml.h:158
   XTYP_WILDCONNECT     : constant := 16#20e2#; --  ddeml.h:159
   XTYP_MASK            : constant := 16#f0#;   --  ddeml.h:161
   XTYP_SHIFT           : constant := 4;        --  ddeml.h:162
   TIMEOUT_ASYNC : constant := 16#ffffffff#;
   --  ddeml.h:166
   QID_SYNC : constant := 16#ffffffff#;
   --  ddeml.h:170
   SZDDESYS_TOPIC : constant CHAR_Array := "System" & Nul;
   --  ddeml.h:184
   SZDDESYS_ITEM_TOPICS : constant CHAR_Array := "Topics" & Nul;
   --  ddeml.h:185
   SZDDESYS_ITEM_SYSITEMS : constant CHAR_Array := "SysItems" & Nul;
   --  ddeml.h:186
   SZDDESYS_ITEM_RTNMSG : constant CHAR_Array :=
     "ReturnMessage" & Nul;
   --  ddeml.h:187
   SZDDESYS_ITEM_STATUS : constant CHAR_Array := "Status" & Nul;
   --  ddeml.h:188
   SZDDESYS_ITEM_FORMATS : constant CHAR_Array := "Formats" & Nul;
   --  ddeml.h:189
   SZDDESYS_ITEM_HELP : constant CHAR_Array := "Help" & Nul;
   --  ddeml.h:190
   SZDDE_ITEM_ITEMLIST : constant CHAR_Array :=
     "TopicItemList" & Nul;
   --  ddeml.h:191
   CBR_BLOCK : constant := 16#ffffffff#;
   --  ddeml.h:202
   CBF_FAIL_SELFCONNECTIONS : constant := 16#1000#;  --  ddeml.h:220
   CBF_FAIL_CONNECTIONS : constant := 16#2000#;  --  ddeml.h:221
   CBF_FAIL_ADVISES : constant := 16#4000#;  --  ddeml.h:222
   CBF_FAIL_EXECUTES : constant := 16#8000#;  --  ddeml.h:223
   CBF_FAIL_POKES : constant := 16#10000#; --  ddeml.h:224
   CBF_FAIL_REQUESTS : constant := 16#20000#; --  ddeml.h:225
   CBF_FAIL_ALLSVRXACTIONS : constant := 16#3f000#; --  ddeml.h:226
   CBF_SKIP_CONNECT_CONFIRMS : constant := 16#40000#; --  ddeml.h:228
   CBF_SKIP_REGISTRATIONS : constant := 16#80000#; --  ddeml.h:229
   CBF_SKIP_UNREGISTRATIONS : constant := 16#100000#; --  ddeml.h:230
   CBF_SKIP_DISCONNECTS : constant := 16#200000#; --  ddeml.h:231
   CBF_SKIP_ALLNOTIFICATIONS : constant := 16#3c0000#; --  ddeml.h:232
   APPCMD_CLIENTONLY : constant := 16#10#;    --  ddeml.h:237
   APPCMD_FILTERINITS : constant := 16#20#;    --  ddeml.h:238
   APPCMD_MASK : constant := 16#ff0#;   --  ddeml.h:239
   APPCLASS_STANDARD : constant := 16#0#;     --  ddeml.h:244
   APPCLASS_MASK : constant := 16#f#;     --  ddeml.h:245
   EC_ENABLEALL : constant := 0;         --  ddeml.h:281
   EC_ENABLEONE : constant := 16#80#;    --  ddeml.h:282
   EC_DISABLE : constant := 16#8#;     --  ddeml.h:283
   EC_QUERYWAITING : constant := 2;         --  ddeml.h:284
   DNS_REGISTER : constant := 16#1#;     --  ddeml.h:289
   DNS_UNREGISTER : constant := 16#2#;     --  ddeml.h:290
   DNS_FILTERON : constant := 16#4#;     --  ddeml.h:291
   DNS_FILTEROFF : constant := 16#8#;     --  ddeml.h:292
   HDATA_APPOWNED : constant := 16#1#;     --  ddeml.h:314
   DMLERR_NO_ERROR : constant := 0;         --  ddeml.h:319
   DMLERR_FIRST : constant := 16#4000#;  --  ddeml.h:321
   DMLERR_ADVACKTIMEOUT : constant := 16#4000#;  --  ddeml.h:323
   DMLERR_BUSY : constant := 16#4001#;  --  ddeml.h:324
   DMLERR_DATAACKTIMEOUT : constant := 16#4002#;  --  ddeml.h:325
   DMLERR_DLL_NOT_INITIALIZED : constant := 16#4003#;  --  ddeml.h:326
   DMLERR_DLL_USAGE : constant := 16#4004#;  --  ddeml.h:327
   DMLERR_EXECACKTIMEOUT : constant := 16#4005#;  --  ddeml.h:328
   DMLERR_INVALIDPARAMETER : constant := 16#4006#;  --  ddeml.h:329
   DMLERR_LOW_MEMORY : constant := 16#4007#;  --  ddeml.h:330
   DMLERR_MEMORY_ERROR : constant := 16#4008#;  --  ddeml.h:331
   DMLERR_NOTPROCESSED : constant := 16#4009#;  --  ddeml.h:332
   DMLERR_NO_CONV_ESTABLISHED : constant := 16#400a#;  --  ddeml.h:333
   DMLERR_POKEACKTIMEOUT : constant := 16#400b#;  --  ddeml.h:334
   DMLERR_POSTMSG_FAILED : constant := 16#400c#;  --  ddeml.h:335
   DMLERR_REENTRANCY : constant := 16#400d#;  --  ddeml.h:336
   DMLERR_SERVER_DIED : constant := 16#400e#;  --  ddeml.h:337
   DMLERR_SYS_ERROR : constant := 16#400f#;  --  ddeml.h:338
   DMLERR_UNADVACKTIMEOUT : constant := 16#4010#;  --  ddeml.h:339
   DMLERR_UNFOUND_QUEUE_ID : constant := 16#4011#;  --  ddeml.h:340
   DMLERR_LAST : constant := 16#4011#;  --  ddeml.h:342
   MH_CREATE : constant := 1;         --  ddeml.h:429
   MH_KEEP : constant := 2;         --  ddeml.h:430
   MH_DELETE : constant := 3;         --  ddeml.h:431
   MH_CLEANUP : constant := 4;         --  ddeml.h:432
   MAX_MONITORS : constant := 4;         --  ddeml.h:467
   APPCLASS_MONITOR : constant := 16#1#;     --  ddeml.h:468
   XTYP_MONITOR : constant := 16#80f2#;  --  ddeml.h:469
   MF_HSZ_INFO : constant := 16#1000000#;
   --  ddeml.h:475
   MF_SENDMSGS : constant := 16#2000000#;
   --  ddeml.h:476
   MF_POSTMSGS : constant := 16#4000000#;
   --  ddeml.h:477
   MF_CALLBACKS : constant := 16#8000000#;
   --  ddeml.h:478
   MF_ERRORS : constant := 16#10000000#;
   --  ddeml.h:479
   MF_LINKS : constant := 16#20000000#;
   --  ddeml.h:480
   MF_CONV : constant := 16#40000000#;
   --  ddeml.h:481
   MF_MASK : constant := 16#ff000000#;
   --  ddeml.h:483

   type HCONVLIST is new Win32.DWORD;                      --  ddeml.h:21
   type HCONV is new Win32.DWORD;                          --  ddeml.h:22
   type HSZ is new Win32.DWORD;                            --  ddeml.h:23
   type HDDEDATA is new Win32.DWORD;                       --  ddeml.h:24

   type HSZPAIR;                                           --  ddeml.h:29
   type CONVCONTEXT;                                       --  ddeml.h:38
   type CONVINFO;                                          --  ddeml.h:52
   type DDEML_MSG_HOOK_DATA;                               --  ddeml.h:368
   type MONMSGSTRUCT;                                      --  ddeml.h:376
   type MONCBSTRUCT;                                       --  ddeml.h:387
   type MONHSZSTRUCTA;                                     --  ddeml.h:405
   type MONHSZSTRUCTW;                                     --  ddeml.h:413
   type MONERRSTRUCT;                                      --  ddeml.h:434
   type MONLINKSTRUCT;                                     --  ddeml.h:441
   type MONCONVSTRUCT;                                     --  ddeml.h:456

   type PHSZPAIR is access all HSZPAIR;                    --  ddeml.h:33
   type PCONVCONTEXT is access all CONVCONTEXT;            --  ddeml.h:47
   type PCONVINFO is access all CONVINFO;                  --  ddeml.h:70
   type PDDEML_MSG_HOOK_DATA is access all DDEML_MSG_HOOK_DATA;
   --  ddeml.h:373
   type PMONMSGSTRUCT is access all MONMSGSTRUCT;          --  ddeml.h:385
   type PMONCBSTRUCT is access all MONCBSTRUCT;            --  ddeml.h:403
   type PMONHSZSTRUCTA is access all MONHSZSTRUCTA;        --  ddeml.h:412
   type PMONHSZSTRUCTW is access all MONHSZSTRUCTW;        --  ddeml.h:420
   type PMONHSZSTRUCT is access all MONHSZSTRUCTA;         --  ddeml.h:426
   type PMONERRSTRUCT is access all MONERRSTRUCT;          --  ddeml.h:439
   type PMONLINKSTRUCT is access all MONLINKSTRUCT;        --  ddeml.h:454
   type PMONCONVSTRUCT is access all MONCONVSTRUCT;        --  ddeml.h:465

   type HSZPAIR is                                         --  ddeml.h:29
      record
         hszSvc : HSZ;                                  --  ddeml.h:30
         hszTopic : HSZ;                                  --  ddeml.h:31
      end record;

   type CONVCONTEXT is                                     --  ddeml.h:38
      record
         cb : Win32.UINT;                         --  ddeml.h:39
         wFlags : Win32.UINT;                         --  ddeml.h:40
         wCountryID : Win32.UINT;                         --  ddeml.h:41
         iCodePage : Win32.INT;                          --  ddeml.h:42
         dwLangID : Win32.DWORD;                        --  ddeml.h:43
         dwSecurity : Win32.DWORD;                        --  ddeml.h:44
         qos : Win32.Winnt.SECURITY_QUALITY_OF_SERVICE;
         --  ddeml.h:45
      end record;

   type CONVINFO is                                        --  ddeml.h:52
      record
         cb : Win32.DWORD;                     --  ddeml.h:53
         hUser : Win32.DWORD;                     --  ddeml.h:54
         hConvPartner : HCONV;                           --  ddeml.h:55
         hszSvcPartner : HSZ;                             --  ddeml.h:56
         hszServiceReq : HSZ;                             --  ddeml.h:57
         hszTopic : HSZ;                             --  ddeml.h:58
         hszItem : HSZ;                             --  ddeml.h:59
         wFmt : Win32.UINT;                      --  ddeml.h:60
         wType : Win32.UINT;                      --  ddeml.h:61
         wStatus : Win32.UINT;                      --  ddeml.h:62
         wConvst : Win32.UINT;                      --  ddeml.h:63
         wLastError : Win32.UINT;                      --  ddeml.h:64
         hConvList : Win32.Ddeml.HCONVLIST;           --  ddeml.h:65
         ConvCtxt : CONVCONTEXT;                     --  ddeml.h:66
         hwnd : Win32.Windef.HWND;               --  ddeml.h:67
         hwndPartner : Win32.Windef.HWND;               --  ddeml.h:68
      end record;

   type PFNCALLBACK is access function (wType : Win32.UINT;
                                        wFmt : Win32.UINT;
                                        hConv : Win32.Ddeml.HCONV;
                                        hsz1 : HSZ;
                                        hsz2 : HSZ;
                                        hData : HDDEDATA;
                                        dwData1 : Win32.DWORD;
                                        dwData2 : Win32.DWORD)
                                       return HDDEDATA;
   pragma Convention (Stdcall, PFNCALLBACK);
   --  ddeml.h:199

   type DDEML_MSG_HOOK_DATA is                             --  ddeml.h:368
      record
         uiLo : Win32.UINT;                             --  ddeml.h:369
         uiHi : Win32.UINT;                             --  ddeml.h:370
         cbData : Win32.DWORD;                            --  ddeml.h:371
         Data : Win32.DWORD_Array (0 .. 7);                --  ddeml.h:372
      end record;

   type MONMSGSTRUCT is                                    --  ddeml.h:376
      record
         cb : Win32.UINT;                             --  ddeml.h:377
         hwndTo : Win32.Windef.HWND;                      --  ddeml.h:378
         dwTime : Win32.DWORD;                            --  ddeml.h:379
         hTask : Win32.Winnt.HANDLE;                     --  ddeml.h:380
         wMsg : Win32.UINT;                             --  ddeml.h:381
         wParam : Win32.WPARAM;                           --  ddeml.h:382
         lParam : Win32.LPARAM;                           --  ddeml.h:383
         dmhd : DDEML_MSG_HOOK_DATA;                    --  ddeml.h:384
      end record;

   type MONCBSTRUCT is                                     --  ddeml.h:387
      record
         cb : Win32.UINT;                            --  ddeml.h:388
         dwTime : Win32.DWORD;                           --  ddeml.h:389
         hTask : Win32.Winnt.HANDLE;                    --  ddeml.h:390
         dwRet : Win32.DWORD;                           --  ddeml.h:391
         wType : Win32.UINT;                            --  ddeml.h:392
         wFmt : Win32.UINT;                            --  ddeml.h:393
         hConv : Win32.Ddeml.HCONV;                     --  ddeml.h:394
         hsz1 : HSZ;                                   --  ddeml.h:395
         hsz2 : HSZ;                                   --  ddeml.h:396
         hData : HDDEDATA;                              --  ddeml.h:397
         dwData1 : Win32.DWORD;                           --  ddeml.h:398
         dwData2 : Win32.DWORD;                           --  ddeml.h:399
         cc : CONVCONTEXT;                           --  ddeml.h:400
         cbData : Win32.DWORD;                           --  ddeml.h:401
         Data : Win32.DWORD_Array (0 .. 7);               --  ddeml.h:402
      end record;

   type MONHSZSTRUCTA is                                   --  ddeml.h:405
      record
         cb : Win32.UINT;                           --  ddeml.h:406
         fsAction : Win32.BOOL;                           --  ddeml.h:407
         dwTime : Win32.DWORD;                          --  ddeml.h:408
         hsz : Win32.Ddeml.HSZ;                      --  ddeml.h:409
         hTask : Win32.Winnt.HANDLE;                   --  ddeml.h:410
         str : Win32.CHAR_Array (0 .. ANYSIZE_ARRAY);   --  ddeml.h:411
      end record;

   type MONHSZSTRUCTW is                                   --  ddeml.h:413
      record
         cb : Win32.UINT;                           --  ddeml.h:414
         fsAction : Win32.BOOL;                           --  ddeml.h:415
         dwTime : Win32.DWORD;                          --  ddeml.h:416
         hsz : Win32.Ddeml.HSZ;                      --  ddeml.h:417
         hTask : Win32.Winnt.HANDLE;                   --  ddeml.h:418
         str : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  ddeml.h:419
      end record;

   subtype MONHSZSTRUCT is MONHSZSTRUCTA;                  --  ddeml.h:425

   type MONERRSTRUCT is                                    --  ddeml.h:434
      record
         cb : Win32.UINT;                         --  ddeml.h:435
         wLastError : Win32.UINT;                         --  ddeml.h:436
         dwTime : Win32.DWORD;                        --  ddeml.h:437
         hTask : Win32.Winnt.HANDLE;                 --  ddeml.h:438
      end record;

   type MONLINKSTRUCT is                                   --  ddeml.h:441
      record
         cb : Win32.UINT;                       --  ddeml.h:442
         dwTime : Win32.DWORD;                      --  ddeml.h:443
         hTask : Win32.Winnt.HANDLE;               --  ddeml.h:444
         fEstablished : Win32.BOOL;                       --  ddeml.h:445
         fNoData : Win32.BOOL;                       --  ddeml.h:446
         hszSvc : HSZ;                              --  ddeml.h:447
         hszTopic : HSZ;                              --  ddeml.h:448
         hszItem : HSZ;                              --  ddeml.h:449
         wFmt : Win32.UINT;                       --  ddeml.h:450
         fServer : Win32.BOOL;                       --  ddeml.h:451
         hConvServer : HCONV;                            --  ddeml.h:452
         hConvClient : HCONV;                            --  ddeml.h:453
      end record;

   type MONCONVSTRUCT is                                   --  ddeml.h:456
      record
         cb : Win32.UINT;                        --  ddeml.h:457
         fConnect : Win32.BOOL;                        --  ddeml.h:458
         dwTime : Win32.DWORD;                       --  ddeml.h:459
         hTask : Win32.Winnt.HANDLE;                --  ddeml.h:460
         hszSvc : HSZ;                               --  ddeml.h:461
         hszTopic : HSZ;                               --  ddeml.h:462
         hConvClient : HCONV;                             --  ddeml.h:463
         hConvServer : HCONV;                             --  ddeml.h:464
      end record;

   function DdeInitializeA (pidInst : Win32.LPDWORD;
                            pfnCallback : Win32.Ddeml.PFNCALLBACK;
                            afCmd : Win32.DWORD;
                            ulRes : Win32.DWORD)
                           return Win32.UINT; --  ddeml.h:206

   function DdeInitialize (pidInst : Win32.LPDWORD;
                           pfnCallback : Win32.Ddeml.PFNCALLBACK;
                           afCmd : Win32.DWORD;
                           ulRes : Win32.DWORD)
                          return Win32.UINT
     renames DdeInitializeA;
   --  ddeml.h:206

   function DdeInitializeW (pidInst : Win32.LPDWORD;
                            pfnCallback : Win32.Ddeml.PFNCALLBACK;
                            afCmd : Win32.DWORD;
                            ulRes : Win32.DWORD)
                           return Win32.UINT; --  ddeml.h:208

   function DdeUninitialize (idInst : Win32.DWORD) return Win32.BOOL;
   --  ddeml.h:249

   function DdeConnectList (idInst : Win32.DWORD;
                            hszService : HSZ;
                            hszTopic : HSZ;
                            hConvList : Win32.Ddeml.HCONVLIST;
                            pCC : PCONVCONTEXT)
                           return Win32.Ddeml.HCONVLIST;
   --  ddeml.h:255

   function DdeQueryNextServer (hConvList : Win32.Ddeml.HCONVLIST;
                                hConvPrev : HCONV)
                               return HCONV;    --  ddeml.h:257

   function DdeDisconnectList (hConvList : Win32.Ddeml.HCONVLIST)
                              return Win32.BOOL;                --  ddeml.h:258

   function DdeConnect (idInst : Win32.DWORD;
                        hszService : HSZ;
                        hszTopic : HSZ;
                        pCC : PCONVCONTEXT)
                       return HCONV;           --  ddeml.h:264

   function DdeDisconnect (hConv : Win32.Ddeml.HCONV) return Win32.BOOL;
   --  ddeml.h:266

   function DdeReconnect (hConv : Win32.Ddeml.HCONV) return Win32.Ddeml.HCONV;
   --  ddeml.h:267

   function DdeQueryConvInfo (hConv : Win32.Ddeml.HCONV;
                              idTransaction : Win32.DWORD;
                              pConvInfo : Win32.Ddeml.PCONVINFO)
                             return Win32.UINT;
   --  ddeml.h:268

   function DdeSetUserHandle (hConv : Win32.Ddeml.HCONV;
                              id : Win32.DWORD;
                              hUser : Win32.DWORD)
                             return Win32.BOOL;     --  ddeml.h:269

   function DdeAbandonTransaction (idInst : Win32.DWORD;
                                   hConv : Win32.Ddeml.HCONV;
                                   idTransaction : Win32.DWORD)
                                  return Win32.BOOL;
   --  ddeml.h:270

   function DdePostAdvise (idInst : Win32.DWORD;
                           hszTopic : HSZ;
                           hszItem : HSZ)
                          return Win32.BOOL;     --  ddeml.h:277

   function DdeEnableCallback (idInst : Win32.DWORD;
                               hConv : Win32.Ddeml.HCONV;
                               wCmd : Win32.UINT)
                              return Win32.BOOL;   --  ddeml.h:278

   function DdeImpersonateClient (hConv : Win32.Ddeml.HCONV) return Win32.BOOL;
   --  ddeml.h:279

   function DdeNameService (idInst : Win32.DWORD;
                            hsz1 : HSZ;
                            hsz2 : HSZ;
                            afCmd : Win32.UINT)
                           return HDDEDATA;        --  ddeml.h:287

   function DdeClientTransaction (pData : Win32.PCBYTE;
                                  cbData : Win32.DWORD;
                                  hConv : Win32.Ddeml.HCONV;
                                  hszItem : HSZ;
                                  wFmt : Win32.UINT;
                                  wType : Win32.UINT;
                                  dwTimeout : Win32.DWORD;
                                  pdwResult : Win32.LPDWORD)
                                 return HDDEDATA;
   --  ddeml.h:298

   function DdeCreateDataHandle (idInst : Win32.DWORD;
                                 pSrc : Win32.LPBYTE;
                                 cb : Win32.DWORD;
                                 cbOff : Win32.DWORD;
                                 hszItem : HSZ;
                                 wFmt : Win32.UINT;
                                 afCmd : Win32.UINT)
                                return HDDEDATA;  --  ddeml.h:306

   function DdeAddData (hData : HDDEDATA;
                        pSrc : Win32.LPBYTE;
                        cb : Win32.DWORD;
                        cbOff : Win32.DWORD)
                       return HDDEDATA;             --  ddeml.h:308

   function DdeGetData (hData : HDDEDATA;
                        pDst : Win32.LPBYTE;
                        cbMax : Win32.DWORD;
                        cbOff : Win32.DWORD)
                       return Win32.DWORD;          --  ddeml.h:309

   function DdeAccessData (hData : HDDEDATA;
                           pcbDataSize : Win32.LPDWORD)
                          return Win32.LPBYTE; --  ddeml.h:310

   function DdeUnaccessData (hData : HDDEDATA) return Win32.BOOL;
   --  ddeml.h:311

   function DdeFreeDataHandle (hData : HDDEDATA) return Win32.BOOL;
   --  ddeml.h:312

   function DdeGetLastError (idInst : Win32.DWORD) return Win32.UINT;
   --  ddeml.h:317

   function DdeCreateStringHandleA (idInst : Win32.DWORD;
                                    psz : Win32.LPCSTR;
                                    iCodePage : Win32.INT)
                                   return HSZ;  --  ddeml.h:344

   function DdeCreateStringHandle (idInst : Win32.DWORD;
                                   psz : Win32.LPCSTR;
                                   iCodePage : Win32.INT)
                                  return HSZ
     renames DdeCreateStringHandleA;
   --  ddeml.h:344

   function DdeCreateStringHandleW (idInst : Win32.DWORD;
                                    psz : Win32.LPWSTR;
                                    iCodePage : Win32.INT)
                                   return HSZ;  --  ddeml.h:345

   function DdeQueryStringA (idInst : Win32.DWORD;
                             hsz : Win32.Ddeml.HSZ;
                             psz : Win32.LPSTR;
                             cchMax : Win32.DWORD;
                             iCodePage : Win32.INT)
                            return Win32.DWORD; --  ddeml.h:351

   function DdeQueryString (idInst : Win32.DWORD;
                            hsz : Win32.Ddeml.HSZ;
                            psz : Win32.LPSTR;
                            cchMax : Win32.DWORD;
                            iCodePage : Win32.INT)
                           return Win32.DWORD
     renames DdeQueryStringA;
   --  ddeml.h:351

   function DdeQueryStringW (idInst : Win32.DWORD;
                             hsz : Win32.Ddeml.HSZ;
                             psz : Win32.LPWSTR;
                             cchMax : Win32.DWORD;
                             iCodePage : Win32.INT)
                            return Win32.DWORD; --  ddeml.h:352

   function DdeFreeStringHandle (idInst : Win32.DWORD;
                                 hsz : Win32.Ddeml.HSZ)
                                return Win32.BOOL; --  ddeml.h:358

   function DdeKeepStringHandle (idInst : Win32.DWORD;
                                 hsz : Win32.Ddeml.HSZ)
                                return Win32.BOOL; --  ddeml.h:359

   function DdeCmpStringHandles (hsz1 : HSZ;
                                 hsz2 : HSZ)
                                return Win32.INT;    --  ddeml.h:360

private

   pragma Convention (C_Pass_By_Copy, HSZPAIR);             --  ddeml.h:29
   pragma Convention (C, CONVCONTEXT);                      --  ddeml.h:38
   pragma Convention (C, CONVINFO);                         --  ddeml.h:52
   pragma Convention (C, DDEML_MSG_HOOK_DATA);              --  ddeml.h:368
   pragma Convention (C, MONMSGSTRUCT);                     --  ddeml.h:376
   pragma Convention (C, MONCBSTRUCT);                      --  ddeml.h:387
   pragma Convention (C, MONHSZSTRUCTA);                    --  ddeml.h:405
   pragma Convention (C, MONHSZSTRUCTW);                    --  ddeml.h:413
   pragma Convention (C_Pass_By_Copy, MONERRSTRUCT);        --  ddeml.h:434
   pragma Convention (C, MONLINKSTRUCT);                    --  ddeml.h:441
   pragma Convention (C, MONCONVSTRUCT);                    --  ddeml.h:456

   pragma Import (Stdcall, DdeInitializeA, "DdeInitializeA");   --  ddeml.h:206
   pragma Import (Stdcall, DdeInitializeW, "DdeInitializeW");   --  ddeml.h:208
   pragma Import (Stdcall, DdeUninitialize, "DdeUninitialize"); --  ddeml.h:249
   pragma Import (Stdcall, DdeConnectList, "DdeConnectList");   --  ddeml.h:255
   pragma Import (Stdcall, DdeQueryNextServer, "DdeQueryNextServer");
   --  ddeml.h:257
   pragma Import (Stdcall, DdeDisconnectList, "DdeDisconnectList");
   --  ddeml.h:258
   pragma Import (Stdcall, DdeConnect, "DdeConnect");           --  ddeml.h:264
   pragma Import (Stdcall, DdeDisconnect, "DdeDisconnect");     --  ddeml.h:266
   pragma Import (Stdcall, DdeReconnect, "DdeReconnect");       --  ddeml.h:267
   pragma Import (Stdcall, DdeQueryConvInfo, "DdeQueryConvInfo");
   --  ddeml.h:268
   pragma Import (Stdcall, DdeSetUserHandle, "DdeSetUserHandle");
   --  ddeml.h:269
   pragma Import (Stdcall, DdeAbandonTransaction, "DdeAbandonTransaction");
   --  ddeml.h:270
   pragma Import (Stdcall, DdePostAdvise, "DdePostAdvise");     --  ddeml.h:277
   pragma Import (Stdcall, DdeEnableCallback, "DdeEnableCallback");
   --  ddeml.h:278
   pragma Import (Stdcall, DdeImpersonateClient, "DdeImpersonateClient");
   --  ddeml.h:279
   pragma Import (Stdcall, DdeNameService, "DdeNameService");   --  ddeml.h:287
   pragma Import (Stdcall, DdeClientTransaction, "DdeClientTransaction");
   --  ddeml.h:298
   pragma Import (Stdcall, DdeCreateDataHandle, "DdeCreateDataHandle");
   --  ddeml.h:306
   pragma Import (Stdcall, DdeAddData, "DdeAddData");           --  ddeml.h:308
   pragma Import (Stdcall, DdeGetData, "DdeGetData");           --  ddeml.h:309
   pragma Import (Stdcall, DdeAccessData, "DdeAccessData");     --  ddeml.h:310
   pragma Import (Stdcall, DdeUnaccessData, "DdeUnaccessData"); --  ddeml.h:311
   pragma Import (Stdcall, DdeFreeDataHandle, "DdeFreeDataHandle");
   --  ddeml.h:312
   pragma Import (Stdcall, DdeGetLastError, "DdeGetLastError"); --  ddeml.h:317
   pragma Import (Stdcall, DdeCreateStringHandleA, "DdeCreateStringHandleA");
   --  ddeml.h:344
   pragma Import (Stdcall, DdeCreateStringHandleW, "DdeCreateStringHandleW");
   --  ddeml.h:345
   pragma Import (Stdcall, DdeQueryStringA, "DdeQueryStringA"); --  ddeml.h:351
   pragma Import (Stdcall, DdeQueryStringW, "DdeQueryStringW"); --  ddeml.h:352
   pragma Import (Stdcall, DdeFreeStringHandle, "DdeFreeStringHandle");
   --  ddeml.h:358
   pragma Import (Stdcall, DdeKeepStringHandle, "DdeKeepStringHandle");
   --  ddeml.h:359
   pragma Import (Stdcall, DdeCmpStringHandles, "DdeCmpStringHandles");
   --  ddeml.h:360

end Win32.Ddeml;
