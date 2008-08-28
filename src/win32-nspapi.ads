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

with Win32.Objbase;
with Win32.Oleauto;
with Win32.Rpcdce;
with Win32.Winnt;
with Win32.Winsock;

package Win32.Nspapi is

   use Interfaces;
   use type Interfaces.C.char_array;

   SERVICE_RESOURCE            : constant := 16#1#;        --  nspapi.h:81
   SERVICE_SERVICE             : constant := 16#2#;        --  nspapi.h:82
   SERVICE_LOCAL               : constant := 16#4#;        --  nspapi.h:83
   SERVICE_REGISTER            : constant := 16#1#;        --  nspapi.h:88
   SERVICE_DEREGISTER          : constant := 16#2#;        --  nspapi.h:89
   SERVICE_FLUSH               : constant := 16#3#;        --  nspapi.h:90
   SERVICE_ADD_TYPE            : constant := 16#4#;        --  nspapi.h:91
   SERVICE_DELETE_TYPE         : constant := 16#5#;        --  nspapi.h:92
   SERVICE_FLAG_DEFER          : constant := 16#1#;        --  nspapi.h:97
   SERVICE_FLAG_HARD           : constant := 16#2#;        --  nspapi.h:98
   PROP_COMMENT                : constant := 16#1#;        --  nspapi.h:103
   PROP_LOCALE                 : constant := 16#2#;        --  nspapi.h:104
   PROP_DISPLAY_HINT           : constant := 16#4#;        --  nspapi.h:105
   PROP_VERSION                : constant := 16#8#;        --  nspapi.h:106
   PROP_START_TIME             : constant := 16#10#;       --  nspapi.h:107
   PROP_MACHINE                : constant := 16#20#;       --  nspapi.h:108
   PROP_ADDRESSES              : constant := 16#100#;      --  nspapi.h:109
   PROP_SD                     : constant := 16#200#;      --  nspapi.h:110
   PROP_ALL                    : constant := 16#80000000#; --  nspapi.h:111
   SERVICE_ADDRESS_FLAG_RPC_CN : constant := 16#1#;        --  nspapi.h:117
   SERVICE_ADDRESS_FLAG_RPC_DG : constant := 16#2#;        --  nspapi.h:118
   SERVICE_ADDRESS_FLAG_RPC_NB : constant := 16#4#;        --  nspapi.h:119
   NS_DEFAULT                  : constant := 0;            --  nspapi.h:125
   NS_SAP                      : constant := 1;            --  nspapi.h:127
   NS_NDS                      : constant := 2;            --  nspapi.h:128
   NS_TCPIP_LOCAL              : constant := 10;           --  nspapi.h:130
   NS_TCPIP_HOSTS              : constant := 11;           --  nspapi.h:131
   NS_DNS                      : constant := 12;           --  nspapi.h:132
   NS_NETBT                    : constant := 13;           --  nspapi.h:133
   NS_WINS                     : constant := 14;           --  nspapi.h:134
   NS_NBP                      : constant := 20;           --  nspapi.h:136
   NS_MS                       : constant := 30;           --  nspapi.h:138
   NS_STDA                     : constant := 31;           --  nspapi.h:139
   NS_CAIRO                    : constant := 32;           --  nspapi.h:140
   NS_X500                     : constant := 40;           --  nspapi.h:142
   NS_NIS                      : constant := 41;           --  nspapi.h:143
   NSTYPE_HIERARCHICAL         : constant := 16#1#;        --  nspapi.h:148
   NSTYPE_DYNAMIC              : constant := 16#2#;        --  nspapi.h:149
   NSTYPE_ENUMERABLE           : constant := 16#4#;        --  nspapi.h:150
   NSTYPE_WORKGROUP            : constant := 16#8#;        --  nspapi.h:151
   XP_CONNECTIONLESS           : constant := 16#1#;        --  nspapi.h:156
   XP_GUARANTEED_DELIVERY      : constant := 16#2#;        --  nspapi.h:157
   XP_GUARANTEED_ORDER         : constant := 16#4#;        --  nspapi.h:158
   XP_MESSAGE_ORIENTED         : constant := 16#8#;        --  nspapi.h:159
   XP_PSEUDO_STREAM            : constant := 16#10#;       --  nspapi.h:160
   XP_GRACEFUL_CLOSE           : constant := 16#20#;       --  nspapi.h:161
   XP_EXPEDITED_DATA           : constant := 16#40#;       --  nspapi.h:162
   XP_CONNECT_DATA             : constant := 16#80#;       --  nspapi.h:163
   XP_DISCONNECT_DATA          : constant := 16#100#;      --  nspapi.h:164
   XP_SUPPORTS_BROADCAST       : constant := 16#200#;      --  nspapi.h:165
   XP_SUPPORTS_MULTICAST       : constant := 16#400#;      --  nspapi.h:166
   XP_BANDWIDTH_ALLOCATION     : constant := 16#800#;      --  nspapi.h:167
   XP_FRAGMENTATION            : constant := 16#1000#;     --  nspapi.h:168
   XP_ENCRYPTS                 : constant := 16#2000#;     --  nspapi.h:169
   RES_SOFT_SEARCH             : constant := 16#1#;        --  nspapi.h:174
   RES_FIND_MULTIPLE           : constant := 16#2#;        --  nspapi.h:175
   RES_SERVICE                 : constant := 16#4#;        --  nspapi.h:176
   SERVICE_TYPE_VALUE_SAPIDA : constant CHAR_Array := "SapId" & Nul;
   --  nspapi.h:182
   SERVICE_TYPE_VALUE_SAPIDW : constant WCHAR_Array :=
     To_Win (C.To_C ("SapId")) & Wide_Nul;
   --  nspapi.h:183
   SERVICE_TYPE_VALUE_CONNA : constant CHAR_Array :=
     "ConnectionOriented" & Nul;
   --  nspapi.h:185
   SERVICE_TYPE_VALUE_CONNW : constant WCHAR_Array :=
     To_Win (C.To_C ("ConnectionOriented")) & Wide_Nul;
   --  nspapi.h:186
   SERVICE_TYPE_VALUE_TCPPORTA : constant CHAR_Array := "TcpPort" & Nul;
   --  nspapi.h:188
   SERVICE_TYPE_VALUE_TCPPORTW : constant WCHAR_Array :=
     To_Win (C.To_C ("TcpPort")) & Wide_Nul;
   --  nspapi.h:189
   SERVICE_TYPE_VALUE_UDPPORTA : constant CHAR_Array := "UdpPort" & Nul;
   --  nspapi.h:191
   SERVICE_TYPE_VALUE_UDPPORTW : constant WCHAR_Array :=
     To_Win (C.To_C ("UdpPort")) & Wide_Nul;
   --  nspapi.h:192
   SERVICE_TYPE_VALUE_SAPID : CHAR_Array renames SERVICE_TYPE_VALUE_SAPIDA;
   --  nspapi.h:203
   SERVICE_TYPE_VALUE_CONN : CHAR_Array renames SERVICE_TYPE_VALUE_CONNA;
   --  nspapi.h:204
   SERVICE_TYPE_VALUE_TCPPORT : CHAR_Array renames
     SERVICE_TYPE_VALUE_TCPPORTA;
   --  nspapi.h:205
   SERVICE_TYPE_VALUE_UDPPORT : CHAR_Array renames
     SERVICE_TYPE_VALUE_UDPPORTA;
   --  nspapi.h:206
   SET_SERVICE_PARTIAL_SUCCESS : constant := 16#1#;        --  nspapi.h:214

   type NS_INFOA;                                          --  nspapi.h:219
   type NS_INFOW;                                          --  nspapi.h:227
   type SERVICE_TYPE_VALUE;                                --  nspapi.h:246
   type SERVICE_TYPE_VALUE_ABSA;                           --  nspapi.h:257
   type SERVICE_TYPE_VALUE_ABSW;                           --  nspapi.h:269
   type SERVICE_TYPE_INFO;                                 --  nspapi.h:293
   type SERVICE_TYPE_INFO_ABSA;                            --  nspapi.h:299
   type SERVICE_TYPE_INFO_ABSW;                            --  nspapi.h:306
   type SERVICE_ADDRESS;                                   --  nspapi.h:327
   type SERVICE_ADDRESSES;                                 --  nspapi.h:347
   type SERVICE_INFOA;                                     --  nspapi.h:360
   type SERVICE_INFOW;                                     --  nspapi.h:375
   type NS_SERVICE_INFOA;                                  --  nspapi.h:401
   type NS_SERVICE_INFOW;                                  --  nspapi.h:408
   type SOCKET_ADDRESS;                                    --  nspapi.h:425
   type CSADDR_INFO;                                       --  nspapi.h:433
   type PROTOCOL_INFOA;                                    --  nspapi.h:444
   type PROTOCOL_INFOW;                                    --  nspapi.h:457
   type NETRESOURCE2A;                                     --  nspapi.h:480
   type NETRESOURCE2W;                                     --  nspapi.h:496
   type SERVICE_ASYNC_INFO;                                --  nspapi.h:531

   type LPNS_INFOA is access all NS_INFOA;                 --  nspapi.h:223
   type LPNS_INFOW is access all NS_INFOW;                 --  nspapi.h:231
   type LPNS_INFO is access all NS_INFOA;                  --  nspapi.h:239
   type PSERVICE_TYPE_VALUE is access all SERVICE_TYPE_VALUE;
   --  nspapi.h:252
   subtype LPSERVICE_TYPE_VALUE is PSERVICE_TYPE_VALUE;    --  nspapi.h:252
   type PSERVICE_TYPE_VALUE_ABSA is access all SERVICE_TYPE_VALUE_ABSA;
   --  nspapi.h:264
   subtype LPSERVICE_TYPE_VALUE_ABSA is PSERVICE_TYPE_VALUE_ABSA;
   --  nspapi.h:265
   type PSERVICE_TYPE_VALUE_ABSW is access all SERVICE_TYPE_VALUE_ABSW;
   --  nspapi.h:276
   subtype LPSERVICE_TYPE_VALUE_ABSW is PSERVICE_TYPE_VALUE_ABSW;
   --  nspapi.h:277
   type PSERVICE_TYPE_VALUE_ABS is access all SERVICE_TYPE_VALUE_ABSA;
   --  nspapi.h:284
   subtype LPSERVICE_TYPE_VALUE_ABS is PSERVICE_TYPE_VALUE_ABS;
   --  nspapi.h:285
   type PSERVICE_TYPE_INFO is access all SERVICE_TYPE_INFO; --  nspapi.h:297
   subtype LPSERVICE_TYPE_INFO is PSERVICE_TYPE_INFO;       --  nspapi.h:297
   type PSERVICE_TYPE_INFO_ABSA is access all SERVICE_TYPE_INFO_ABSA;
   --  nspapi.h:304
   subtype LPSERVICE_TYPE_INFO_ABSA is PSERVICE_TYPE_INFO_ABSA;
   --  nspapi.h:305
   type PSERVICE_TYPE_INFO_ABSW is access all SERVICE_TYPE_INFO_ABSW;
   --  nspapi.h:311
   subtype LPSERVICE_TYPE_INFO_ABSW is PSERVICE_TYPE_INFO_ABSW;
   --  nspapi.h:312
   type PSERVICE_TYPE_INFO_ABS is access all SERVICE_TYPE_INFO_ABSA;
   --  nspapi.h:319
   subtype LPSERVICE_TYPE_INFO_ABS is PSERVICE_TYPE_INFO_ABS;
   --  nspapi.h:320
   type PSERVICE_ADDRESS is access all SERVICE_ADDRESS;    --  nspapi.h:342
   subtype LPSERVICE_ADDRESS is PSERVICE_ADDRESS;          --  nspapi.h:342
   type PSERVICE_ADDRESSES is access all SERVICE_ADDRESSES; --  nspapi.h:354
   subtype LPSERVICE_ADDRESSES is PSERVICE_ADDRESSES;      --  nspapi.h:354
   type PSERVICE_INFOA is access all SERVICE_INFOA;        --  nspapi.h:371
   subtype LPSERVICE_INFOA is PSERVICE_INFOA;              --  nspapi.h:371
   type PSERVICE_INFOW is access all SERVICE_INFOW;        --  nspapi.h:386
   subtype LPSERVICE_INFOW is PSERVICE_INFOW;              --  nspapi.h:386
   type PSERVICE_INFO is access all SERVICE_INFOA;         --  nspapi.h:393
   subtype LPSERVICE_INFO is PSERVICE_INFO;                --  nspapi.h:394
   type PNS_SERVICE_INFOA is access all NS_SERVICE_INFOA;  --  nspapi.h:404
   subtype LPNS_SERVICE_INFOA is PNS_SERVICE_INFOA;        --  nspapi.h:404
   type PNS_SERVICE_INFOW is access all NS_SERVICE_INFOW;  --  nspapi.h:411
   subtype LPNS_SERVICE_INFOW is PNS_SERVICE_INFOW;        --  nspapi.h:411
   type PNS_SERVICE_INFO is access all NS_SERVICE_INFOA;   --  nspapi.h:418
   subtype LPNS_SERVICE_INFO is PNS_SERVICE_INFO;          --  nspapi.h:419
   type PSOCKET_ADDRESS is access all SOCKET_ADDRESS;      --  nspapi.h:428
   subtype LPSOCKET_ADDRESS is PSOCKET_ADDRESS;            --  nspapi.h:428
   type PCSADDR_INFO is access all CSADDR_INFO;            --  nspapi.h:438
   subtype LPCSADDR_INFO is PCSADDR_INFO;                  --  nspapi.h:438
   type PPROTOCOL_INFOA is access all PROTOCOL_INFOA;      --  nspapi.h:453
   subtype LPPROTOCOL_INFOA is PPROTOCOL_INFOA;            --  nspapi.h:453
   type PPROTOCOL_INFOW is access all PROTOCOL_INFOW;      --  nspapi.h:466
   subtype LPPROTOCOL_INFOW is PPROTOCOL_INFOW;            --  nspapi.h:466
   type PPROTOCOL_INFO is access all PROTOCOL_INFOA;       --  nspapi.h:473
   subtype LPPROTOCOL_INFO is PPROTOCOL_INFO;              --  nspapi.h:474
   type PNETRESOURCE2A is access all NETRESOURCE2A;        --  nspapi.h:492
   subtype LPNETRESOURCE2A is PNETRESOURCE2A;              --  nspapi.h:492
   type PNETRESOURCE2W is access all NETRESOURCE2W;        --  nspapi.h:508
   subtype LPNETRESOURCE2W is PNETRESOURCE2W;              --  nspapi.h:508
   type PNETRESOURCE2 is access all NETRESOURCE2A;         --  nspapi.h:515
   subtype LPNETRESOURCE2 is PNETRESOURCE2;                --  nspapi.h:516
   type PSERVICE_ASYNC_INFO is access all SERVICE_ASYNC_INFO;
   --  nspapi.h:535
   subtype LPSERVICE_ASYNC_INFO is PSERVICE_ASYNC_INFO;    --  nspapi.h:535

   type NS_INFOA is                                        --  nspapi.h:219
      record
         dwNameSpace : Win32.DWORD;                  --  nspapi.h:220
         dwNameSpaceFlags : Win32.DWORD;                  --  nspapi.h:221
         lpNameSpace : Win32.LPSTR;                  --  nspapi.h:222
      end record;

   subtype PNS_INFOA is NS_INFOA;                          --  nspapi.h:223

   type NS_INFOW is                                        --  nspapi.h:227
      record
         dwNameSpace : Win32.DWORD;                  --  nspapi.h:228
         dwNameSpaceFlags : Win32.DWORD;                  --  nspapi.h:229
         lpNameSpace : Win32.LPWSTR;                 --  nspapi.h:230
      end record;

   subtype PNS_INFOW is NS_INFOW;                          --  nspapi.h:231

   subtype NS_INFO is NS_INFOA;                            --  nspapi.h:237

   subtype PNS_INFO is PNS_INFOA;                          --  nspapi.h:238

   type SERVICE_TYPE_VALUE is                              --  nspapi.h:246
      record
         dwNameSpace : Win32.DWORD;                 --  nspapi.h:247
         dwValueType : Win32.DWORD;                 --  nspapi.h:248
         dwValueSize : Win32.DWORD;                 --  nspapi.h:249
         dwValueNameOffset : Win32.DWORD;                 --  nspapi.h:250
         dwValueOffset : Win32.DWORD;                 --  nspapi.h:251
      end record;

   type SERVICE_TYPE_VALUE_ABSA is                         --  nspapi.h:257
      record
         dwNameSpace : Win32.DWORD;                       --  nspapi.h:258
         dwValueType : Win32.DWORD;                       --  nspapi.h:259
         dwValueSize : Win32.DWORD;                       --  nspapi.h:260
         lpValueName : Win32.LPSTR;                       --  nspapi.h:261
         lpValue : Win32.PVOID;                       --  nspapi.h:262
      end record;

   type SERVICE_TYPE_VALUE_ABSW is                         --  nspapi.h:269
      record
         dwNameSpace : Win32.DWORD;                       --  nspapi.h:270
         dwValueType : Win32.DWORD;                       --  nspapi.h:271
         dwValueSize : Win32.DWORD;                       --  nspapi.h:272
         lpValueName : Win32.LPWSTR;                      --  nspapi.h:273
         lpValue : Win32.PVOID;                       --  nspapi.h:274
      end record;

   subtype SERVICE_TYPE_VALUE_ABS is SERVICE_TYPE_VALUE_ABSA;
   --  nspapi.h:283

   type SERVICE_TYPE_VALUE_Array is                        --  nspapi.h:296
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased SERVICE_TYPE_VALUE;

   type SERVICE_TYPE_INFO is                               --  nspapi.h:293
      record
         dwTypeNameOffset : Win32.DWORD;                  --  nspapi.h:294
         dwValueCount : Win32.DWORD;                  --  nspapi.h:295
         Values : SERVICE_TYPE_VALUE_Array;     --  nspapi.h:296
      end record;

   type SERVICE_TYPE_VALUE_ABSA_Array is                   --  nspapi.h:302
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased SERVICE_TYPE_VALUE_ABSA;

   type SERVICE_TYPE_INFO_ABSA is                          --  nspapi.h:299
      record
         lpTypeName : Win32.LPSTR;                      --  nspapi.h:300
         dwValueCount : Win32.DWORD;                      --  nspapi.h:301
         Values : SERVICE_TYPE_VALUE_ABSA_Array;    --  nspapi.h:302
      end record;

   type SERVICE_TYPE_VALUE_ABSW_Array is                   --  nspapi.h:309
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased SERVICE_TYPE_VALUE_ABSW;

   type SERVICE_TYPE_INFO_ABSW is                          --  nspapi.h:306
      record
         lpTypeName : Win32.LPWSTR;                     --  nspapi.h:307
         dwValueCount : Win32.DWORD;                      --  nspapi.h:308
         Values : SERVICE_TYPE_VALUE_ABSW_Array;    --  nspapi.h:309
      end record;

   subtype SERVICE_TYPE_INFO_ABS is SERVICE_TYPE_INFO_ABSA; --  nspapi.h:318

   type SERVICE_ADDRESS is                                 --  nspapi.h:327
      record
         dwAddressType : Win32.DWORD;                 --  nspapi.h:328
         dwAddressFlags : Win32.DWORD;                 --  nspapi.h:329
         dwAddressLength : Win32.DWORD;                 --  nspapi.h:330
         dwPrincipalLength : Win32.DWORD;                 --  nspapi.h:331
         lpAddress : Win32.PBYTE;                 --  nspapi.h:335
         lpPrincipal : Win32.PBYTE;                 --  nspapi.h:340
      end record;

   type SERVICE_ADDRESS_Array is                           --  nspapi.h:352
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased SERVICE_ADDRESS;

   type SERVICE_ADDRESSES is                               --  nspapi.h:347
      record
         dwAddressCount : Win32.DWORD;                    --  nspapi.h:348
         Addresses : SERVICE_ADDRESS_Array;          --  nspapi.h:352
      end record;

   type SERVICE_INFOA is                                   --  nspapi.h:360
      record
         lpServiceType : Win32.Objbase.LPGUID;      --  nspapi.h:361
         lpServiceName : Win32.LPSTR;               --  nspapi.h:362
         lpComment : Win32.LPSTR;               --  nspapi.h:363
         lpLocale : Win32.LPSTR;               --  nspapi.h:364
         dwDisplayHint : Win32.DWORD;               --  nspapi.h:365
         dwVersion : Win32.DWORD;               --  nspapi.h:366
         dwTime : Win32.DWORD;               --  nspapi.h:367
         lpMachineName : Win32.LPSTR;               --  nspapi.h:368
         lpServiceAddress : LPSERVICE_ADDRESSES;       --  nspapi.h:369
         ServiceSpecificInfo : Win32.Oleauto.BLOB;        --  nspapi.h:370
      end record;

   type SERVICE_INFOW is                                   --  nspapi.h:375
      record
         lpServiceType : Win32.Objbase.LPGUID;      --  nspapi.h:376
         lpServiceName : Win32.LPWSTR;              --  nspapi.h:377
         lpComment : Win32.LPWSTR;              --  nspapi.h:378
         lpLocale : Win32.LPWSTR;              --  nspapi.h:379
         dwDisplayHint : Win32.DWORD;               --  nspapi.h:380
         dwVersion : Win32.DWORD;               --  nspapi.h:381
         dwTime : Win32.DWORD;               --  nspapi.h:382
         lpMachineName : Win32.LPWSTR;              --  nspapi.h:383
         lpServiceAddress : LPSERVICE_ADDRESSES;       --  nspapi.h:384
         ServiceSpecificInfo : Win32.Oleauto.BLOB;        --  nspapi.h:385
      end record;

   subtype SERVICE_INFO is SERVICE_INFOA;                  --  nspapi.h:392

   type NS_SERVICE_INFOA is                                --  nspapi.h:401
      record
         dwNameSpace : Win32.DWORD;                       --  nspapi.h:402
         ServiceInfo : SERVICE_INFOA;                     --  nspapi.h:403
      end record;

   type NS_SERVICE_INFOW is                                --  nspapi.h:408
      record
         dwNameSpace : Win32.DWORD;                       --  nspapi.h:409
         ServiceInfo : SERVICE_INFOW;                     --  nspapi.h:410
      end record;

   subtype NS_SERVICE_INFO is NS_SERVICE_INFOA;            --  nspapi.h:417

   type SOCKET_ADDRESS is                                  --  nspapi.h:425
      record
         lpSockaddr : Win32.Winsock.LPSOCKADDR;      --  nspapi.h:426
         iSockaddrLength : Win32.INT;                     --  nspapi.h:427
      end record;

   type CSADDR_INFO is                                     --  nspapi.h:433
      record
         LocalAddr : SOCKET_ADDRESS;                    --  nspapi.h:434
         RemoteAddr : SOCKET_ADDRESS;                    --  nspapi.h:435
         iSocketType : Win32.INT;                         --  nspapi.h:436
         iProtocol : Win32.INT;                         --  nspapi.h:437
      end record;

   type PROTOCOL_INFOA is                                  --  nspapi.h:444
      record
         dwServiceFlags : Win32.DWORD;                    --  nspapi.h:445
         iAddressFamily : Win32.INT;                      --  nspapi.h:446
         iMaxSockAddr : Win32.INT;                      --  nspapi.h:447
         iMinSockAddr : Win32.INT;                      --  nspapi.h:448
         iSocketType : Win32.INT;                      --  nspapi.h:449
         iProtocol : Win32.INT;                      --  nspapi.h:450
         dwMessageSize : Win32.DWORD;                    --  nspapi.h:451
         lpProtocol : Win32.LPSTR;                    --  nspapi.h:452
      end record;

   type PROTOCOL_INFOW is                                  --  nspapi.h:457
      record
         dwServiceFlags : Win32.DWORD;                    --  nspapi.h:458
         iAddressFamily : Win32.INT;                      --  nspapi.h:459
         iMaxSockAddr : Win32.INT;                      --  nspapi.h:460
         iMinSockAddr : Win32.INT;                      --  nspapi.h:461
         iSocketType : Win32.INT;                      --  nspapi.h:462
         iProtocol : Win32.INT;                      --  nspapi.h:463
         dwMessageSize : Win32.DWORD;                    --  nspapi.h:464
         lpProtocol : Win32.LPWSTR;                   --  nspapi.h:465
      end record;

   subtype PROTOCOL_INFO is PROTOCOL_INFOA;                --  nspapi.h:472

   type NETRESOURCE2A is                                   --  nspapi.h:480
      record
         dwScope : Win32.DWORD;                     --  nspapi.h:481
         dwType : Win32.DWORD;                     --  nspapi.h:482
         dwUsage : Win32.DWORD;                     --  nspapi.h:483
         dwDisplayType : Win32.DWORD;                     --  nspapi.h:484
         lpLocalName : Win32.LPSTR;                     --  nspapi.h:485
         lpRemoteName : Win32.LPSTR;                     --  nspapi.h:486
         lpComment : Win32.LPSTR;                     --  nspapi.h:487
         ns_info : Win32.Nspapi.NS_INFO;            --  nspapi.h:488
         ServiceType : Win32.Rpcdce.GUID;               --  nspapi.h:489
         dwProtocols : Win32.DWORD;                     --  nspapi.h:490
         lpiProtocols : Win32.LPINT;                     --  nspapi.h:491
      end record;

   type NETRESOURCE2W is                                   --  nspapi.h:496
      record
         dwScope : Win32.DWORD;                     --  nspapi.h:497
         dwType : Win32.DWORD;                     --  nspapi.h:498
         dwUsage : Win32.DWORD;                     --  nspapi.h:499
         dwDisplayType : Win32.DWORD;                     --  nspapi.h:500
         lpLocalName : Win32.LPWSTR;                    --  nspapi.h:501
         lpRemoteName : Win32.LPWSTR;                    --  nspapi.h:502
         lpComment : Win32.LPWSTR;                    --  nspapi.h:503
         ns_info : Win32.Nspapi.NS_INFO;            --  nspapi.h:504
         ServiceType : Win32.Rpcdce.GUID;               --  nspapi.h:505
         dwProtocols : Win32.DWORD;                     --  nspapi.h:506
         lpiProtocols : Win32.LPINT;                     --  nspapi.h:507
      end record;

   subtype NETRESOURCE2 is NETRESOURCE2A;                  --  nspapi.h:514

   type LPFN_NSPAPI is access function  return Win32.DWORD; --  nspapi.h:519
   pragma Convention (Stdcall, LPFN_NSPAPI);
   type LPSERVICE_CALLBACK_PROC is access procedure
     (lParam : Win32.LPARAM;
      hAsyncTaskHandle : Win32.Winnt.HANDLE);      --  nspapi.h:526
   pragma Convention (Stdcall, LPSERVICE_CALLBACK_PROC);

   type SERVICE_ASYNC_INFO is                              --  nspapi.h:531
      record
         lpServiceCallbackProc : LPSERVICE_CALLBACK_PROC; --  nspapi.h:532
         lParam : Win32.LPARAM;            --  nspapi.h:533
         hAsyncTaskHandle : Win32.Winnt.HANDLE;      --  nspapi.h:534
      end record;

   function EnumProtocolsA
     (lpiProtocols : Win32.LPINT;
      lpProtocolBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD)
     return Win32.INT;                            --  nspapi.h:542

   function EnumProtocols
     (lpiProtocols : Win32.LPINT;
      lpProtocolBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD)
     return Win32.INT
     renames EnumProtocolsA;                      --  nspapi.h:542

   function EnumProtocolsW
     (lpiProtocols : Win32.LPINT;
      lpProtocolBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD)
     return Win32.INT;                            --  nspapi.h:552

   function GetAddressByNameA
     (dwNameSpace : Win32.DWORD;
      lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      lpiProtocols : Win32.LPINT;
      dwResolution : Win32.DWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpCsaddrBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD;
      lpAliasBuffer : Win32.LPSTR;
      lpdwAliasBufferLength : Win32.LPDWORD)
     return Win32.INT;                            --  nspapi.h:565

   function GetAddressByName
     (dwNameSpace : Win32.DWORD;
      lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      lpiProtocols : Win32.LPINT;
      dwResolution : Win32.DWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpCsaddrBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD;
      lpAliasBuffer : Win32.LPSTR;
      lpdwAliasBufferLength : Win32.LPDWORD)
     return Win32.INT
     renames GetAddressByNameA;                   --  nspapi.h:565

   function GetAddressByNameW
     (dwNameSpace : Win32.DWORD;
      lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPWSTR;
      lpiProtocols : Win32.LPINT;
      dwResolution : Win32.DWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpCsaddrBuffer : Win32.LPVOID;
      lpdwBufferLength : Win32.LPDWORD;
      lpAliasBuffer : Win32.LPWSTR;
      lpdwAliasBufferLength : Win32.LPDWORD)
     return Win32.INT;                            --  nspapi.h:579

   function GetTypeByNameA
     (lpServiceName : Win32.LPSTR;
      lpServiceType : Win32.Objbase.LPGUID)
     return Win32.INT;                            --  nspapi.h:599

   function GetTypeByName
     (lpServiceName : Win32.LPSTR;
      lpServiceType : Win32.Objbase.LPGUID)
     return Win32.INT
     renames GetTypeByNameA;                      --  nspapi.h:599

   function GetTypeByNameW
     (lpServiceName : Win32.LPWSTR;
      lpServiceType : Win32.Objbase.LPGUID)
     return Win32.INT;                            --  nspapi.h:605

   function GetNameByTypeA
     (lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      dwNameLength : Win32.DWORD)
     return Win32.INT;                            --  nspapi.h:617

   function GetNameByType
     (lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      dwNameLength : Win32.DWORD)
     return Win32.INT
     renames GetNameByTypeA;                      --  nspapi.h:617

   function GetNameByTypeW
     (lpServiceType : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPWSTR;
      dwNameLength : Win32.DWORD)
     return Win32.INT;                            --  nspapi.h:624

   function SetServiceA
     (dwNameSpace : Win32.DWORD;
      dwOperation : Win32.DWORD;
      dwFlags : Win32.DWORD;
      lpServiceInfo : LPSERVICE_INFOA;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpdwStatusFlags : Win32.LPDWORD)
     return Win32.INT;                            --  nspapi.h:637

   function SetService
     (dwNameSpace : Win32.DWORD;
      dwOperation : Win32.DWORD;
      dwFlags : Win32.DWORD;
      lpServiceInfo : LPSERVICE_INFOA;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpdwStatusFlags : Win32.LPDWORD)
     return Win32.INT
     renames SetServiceA;                         --  nspapi.h:637

   function SetServiceW
     (dwNameSpace : Win32.DWORD;
      dwOperation : Win32.DWORD;
      dwFlags : Win32.DWORD;
      lpServiceInfo : LPSERVICE_INFOW;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO;
      lpdwStatusFlags : Win32.LPDWORD)
     return Win32.INT;                            --  nspapi.h:647

   function GetServiceA
     (dwNameSpace : Win32.DWORD;
      lpGuid : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      dwProperties : Win32.DWORD;
      lpBuffer : Win32.LPVOID;
      lpdwBufferSize : Win32.LPDWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO)
     return Win32.INT;                            --  nspapi.h:663

   function GetService
     (dwNameSpace : Win32.DWORD;
      lpGuid : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPSTR;
      dwProperties : Win32.DWORD;
      lpBuffer : Win32.LPVOID;
      lpdwBufferSize : Win32.LPDWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO)
     return Win32.INT
     renames GetServiceA;                         --  nspapi.h:663

   function GetServiceW
     (dwNameSpace : Win32.DWORD;
      lpGuid : Win32.Objbase.LPGUID;
      lpServiceName : Win32.LPWSTR;
      dwProperties : Win32.DWORD;
      lpBuffer : Win32.LPVOID;
      lpdwBufferSize : Win32.LPDWORD;
      lpServiceAsyncInfo : LPSERVICE_ASYNC_INFO)
     return Win32.INT;                            --  nspapi.h:674

private

   pragma Convention (C_Pass_By_Copy, NS_INFOA);            --  nspapi.h:219
   pragma Convention (C_Pass_By_Copy, NS_INFOW);            --  nspapi.h:227
   pragma Convention (C, SERVICE_TYPE_VALUE);               --  nspapi.h:246
   pragma Convention (C, SERVICE_TYPE_VALUE_ABSA);          --  nspapi.h:257
   pragma Convention (C, SERVICE_TYPE_VALUE_ABSW);          --  nspapi.h:269
   pragma Convention (C, SERVICE_TYPE_INFO);                --  nspapi.h:293
   pragma Convention (C, SERVICE_TYPE_INFO_ABSA);           --  nspapi.h:299
   pragma Convention (C, SERVICE_TYPE_INFO_ABSW);           --  nspapi.h:306
   pragma Convention (C, SERVICE_ADDRESS);                  --  nspapi.h:327
   pragma Convention (C, SERVICE_ADDRESSES);                --  nspapi.h:347
   pragma Convention (C, SERVICE_INFOA);                    --  nspapi.h:360
   pragma Convention (C, SERVICE_INFOW);                    --  nspapi.h:375
   pragma Convention (C, NS_SERVICE_INFOA);                 --  nspapi.h:401
   pragma Convention (C, NS_SERVICE_INFOW);                 --  nspapi.h:408
   pragma Convention (C_Pass_By_Copy, SOCKET_ADDRESS);      --  nspapi.h:425
   pragma Convention (C, CSADDR_INFO);                      --  nspapi.h:433
   pragma Convention (C, PROTOCOL_INFOA);                   --  nspapi.h:444
   pragma Convention (C, PROTOCOL_INFOW);                   --  nspapi.h:457
   pragma Convention (C, NETRESOURCE2A);                    --  nspapi.h:480
   pragma Convention (C, NETRESOURCE2W);                    --  nspapi.h:496
   pragma Convention (C_Pass_By_Copy, SERVICE_ASYNC_INFO);  --  nspapi.h:531

   pragma Import (Stdcall, EnumProtocolsA, "EnumProtocolsA");
   --  nspapi.h:542
   pragma Import (Stdcall, EnumProtocolsW, "EnumProtocolsW");
   --  nspapi.h:552
   pragma Import (Stdcall, GetAddressByNameA, "GetAddressByNameA");
   --  nspapi.h:565
   pragma Import (Stdcall, GetAddressByNameW, "GetAddressByNameW");
   --  nspapi.h:579
   pragma Import (Stdcall, GetTypeByNameA, "GetTypeByNameA");  --  nspapi.h:599
   pragma Import (Stdcall, GetTypeByNameW, "GetTypeByNameW");  --  nspapi.h:605
   pragma Import (Stdcall, GetNameByTypeA, "GetNameByTypeA");  --  nspapi.h:617
   pragma Import (Stdcall, GetNameByTypeW, "GetNameByTypeW");  --  nspapi.h:624
   pragma Import (Stdcall, SetServiceA, "SetServiceA");        --  nspapi.h:637
   pragma Import (Stdcall, SetServiceW, "SetServiceW");        --  nspapi.h:647
   pragma Import (Stdcall, GetServiceA, "GetServiceA");        --  nspapi.h:663
   pragma Import (Stdcall, GetServiceW, "GetServiceW");        --  nspapi.h:674

end Win32.Nspapi;
