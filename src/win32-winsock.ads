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

with Win32.Windef;
with Win32.Winnt;
with Interfaces.C;

package Win32.Winsock is

   subtype u_long is Win32.ULONG;                          --  winsock.h:39

   function "not"(uOperand : Interfaces.C.unsigned)
                 return Interfaces.C.unsigned
     renames Interfaces.C."not";


   FD_SETSIZE : constant := 64;            --  winsock.h:56
   IOCPARM_MASK : constant := 16#7f#;        --  winsock.h:128
   IOC_VOID : constant := 16#20000000#;  --  winsock.h:129
   IOC_OUT : constant := 16#40000000#;  --  winsock.h:130
   IOC_IN : constant := 16#80000000#;  --  winsock.h:131
   IOC_INOUT : constant := 16#c0000000#;  --  winsock.h:132
   IPPROTO_IP : constant := 0;             --  winsock.h:199
   IPPROTO_ICMP : constant := 1;             --  winsock.h:200
   IPPROTO_GGP : constant := 2;             --  winsock.h:201
   IPPROTO_TCP : constant := 6;             --  winsock.h:202
   IPPROTO_PUP : constant := 12;            --  winsock.h:203
   IPPROTO_UDP : constant := 17;            --  winsock.h:204
   IPPROTO_IDP : constant := 22;            --  winsock.h:205
   IPPROTO_ND : constant := 77;            --  winsock.h:206
   IPPROTO_RAW : constant := 255;           --  winsock.h:208
   IPPROTO_MAX : constant := 256;           --  winsock.h:209
   IPPORT_ECHO : constant := 7;             --  winsock.h:214
   IPPORT_DISCARD : constant := 9;             --  winsock.h:215
   IPPORT_SYSTAT : constant := 11;            --  winsock.h:216
   IPPORT_DAYTIME : constant := 13;            --  winsock.h:217
   IPPORT_NETSTAT : constant := 15;            --  winsock.h:218
   IPPORT_FTP : constant := 21;            --  winsock.h:219
   IPPORT_TELNET : constant := 23;            --  winsock.h:220
   IPPORT_SMTP : constant := 25;            --  winsock.h:221
   IPPORT_TIMESERVER : constant := 37;            --  winsock.h:222
   IPPORT_NAMESERVER : constant := 42;            --  winsock.h:223
   IPPORT_WHOIS : constant := 43;            --  winsock.h:224
   IPPORT_MTP : constant := 57;            --  winsock.h:225
   IPPORT_TFTP : constant := 69;            --  winsock.h:230
   IPPORT_RJE : constant := 77;            --  winsock.h:231
   IPPORT_FINGER : constant := 79;            --  winsock.h:232
   IPPORT_TTYLINK : constant := 87;            --  winsock.h:233
   IPPORT_SUPDUP : constant := 95;            --  winsock.h:234
   IPPORT_EXECSERVER : constant := 512;           --  winsock.h:239
   IPPORT_LOGINSERVER : constant := 513;           --  winsock.h:240
   IPPORT_CMDSERVER : constant := 514;           --  winsock.h:241
   IPPORT_EFSSERVER : constant := 520;           --  winsock.h:242
   IPPORT_BIFFUDP : constant := 512;           --  winsock.h:247
   IPPORT_WHOSERVER : constant := 513;           --  winsock.h:248
   IPPORT_ROUTESERVER : constant := 520;           --  winsock.h:249
   IPPORT_RESERVED : constant := 1024;          --  winsock.h:256
   IMPLINK_IP : constant := 155;           --  winsock.h:261
   IMPLINK_LOWEXPER : constant := 156;           --  winsock.h:262
   IMPLINK_HIGHEXPER : constant := 158;           --  winsock.h:263
   IN_CLASSA_NET : constant := 16#ff000000#;  --  winsock.h:294
   IN_CLASSA_NSHIFT : constant := 24;            --  winsock.h:295
   IN_CLASSA_HOST : constant := 16#ffffff#;    --  winsock.h:296
   IN_CLASSA_MAX : constant := 128;           --  winsock.h:297
   IN_CLASSB_NET : constant := 16#ffff0000#;  --  winsock.h:300
   IN_CLASSB_NSHIFT : constant := 16;            --  winsock.h:301
   IN_CLASSB_HOST : constant := 16#ffff#;      --  winsock.h:302
   IN_CLASSB_MAX : constant := 65536;         --  winsock.h:303
   IN_CLASSC_NET : constant := 16#ffffff00#;  --  winsock.h:306
   IN_CLASSC_NSHIFT : constant := 8;             --  winsock.h:307
   IN_CLASSC_HOST : constant := 16#ff#;        --  winsock.h:308
   INADDR_ANY : constant u_long := 16#0#;  --  winsock.h:310
   INADDR_LOOPBACK : constant := 16#7f000001#;  --  winsock.h:311
   INADDR_BROADCAST : constant u_long := 16#ffffffff#;
   --  winsock.h:312
   INADDR_NONE : constant := 16#ffffffff#;  --  winsock.h:313
   WSADESCRIPTION_LEN : constant := 256;           --  winsock.h:325
   WSASYS_STATUS_LEN : constant := 128;           --  winsock.h:326
   IP_OPTIONS : constant := 1;             --  winsock.h:343
   IP_MULTICAST_IF : constant := 2;             --  winsock.h:344
   IP_MULTICAST_TTL : constant := 3;             --  winsock.h:345
   IP_MULTICAST_LOOP : constant := 4;             --  winsock.h:346
   IP_ADD_MEMBERSHIP : constant := 5;             --  winsock.h:347
   IP_DROP_MEMBERSHIP : constant := 6;             --  winsock.h:348
   IP_DEFAULT_MULTICAST_TTL : constant := 1;             --  winsock.h:350
   IP_DEFAULT_MULTICAST_LOOP : constant := 1;             --  winsock.h:351
   IP_MAX_MEMBERSHIPS : constant := 20;            --  winsock.h:352

   INVALID_SOCKET : constant := Win32.UINT'Last;
   --  winsock.h:371
   SOCKET_ERROR : constant := -1;            --  winsock.h:372
   SOCK_STREAM : constant := 1;             --  winsock.h:377
   SOCK_DGRAM : constant := 2;             --  winsock.h:378
   SOCK_RAW : constant := 3;             --  winsock.h:379
   SOCK_RDM : constant := 4;             --  winsock.h:380
   SOCK_SEQPACKET : constant := 5;             --  winsock.h:381
   SO_DEBUG : constant := 16#1#;         --  winsock.h:386
   SO_ACCEPTCONN : constant := 16#2#;         --  winsock.h:387
   SO_REUSEADDR : constant := 16#4#;         --  winsock.h:388
   SO_KEEPALIVE : constant := 16#8#;         --  winsock.h:389
   SO_DONTROUTE : constant := 16#10#;        --  winsock.h:390
   SO_BROADCAST : constant := 16#20#;        --  winsock.h:391
   SO_USELOOPBACK : constant := 16#40#;        --  winsock.h:392
   SO_LINGER : constant := 16#80#;        --  winsock.h:393
   SO_OOBINLINE : constant := 16#100#;       --  winsock.h:394

   SO_DONTLINGER : constant := not  Win32.UINT'(SO_LINGER);
   --  winsock.h:396
   SO_SNDBUF : constant := 16#1001#;      --  winsock.h:401
   SO_RCVBUF : constant := 16#1002#;      --  winsock.h:402
   SO_SNDLOWAT : constant := 16#1003#;      --  winsock.h:403
   SO_RCVLOWAT : constant := 16#1004#;      --  winsock.h:404
   SO_SNDTIMEO : constant := 16#1005#;      --  winsock.h:405
   SO_RCVTIMEO : constant := 16#1006#;      --  winsock.h:406
   SO_ERROR : constant := 16#1007#;      --  winsock.h:407
   SO_TYPE : constant := 16#1008#;      --  winsock.h:408
   SO_CONNDATA : constant := 16#7000#;      --  winsock.h:414
   SO_CONNOPT : constant := 16#7001#;      --  winsock.h:415
   SO_DISCDATA : constant := 16#7002#;      --  winsock.h:416
   SO_DISCOPT : constant := 16#7003#;      --  winsock.h:417
   SO_CONNDATALEN : constant := 16#7004#;      --  winsock.h:418
   SO_CONNOPTLEN : constant := 16#7005#;      --  winsock.h:419
   SO_DISCDATALEN : constant := 16#7006#;      --  winsock.h:420
   SO_DISCOPTLEN : constant := 16#7007#;      --  winsock.h:421
   SO_OPENTYPE : constant := 16#7008#;      --  winsock.h:426
   SO_SYNCHRONOUS_ALERT : constant := 16#10#;        --  winsock.h:428
   SO_SYNCHRONOUS_NONALERT : constant := 16#20#;        --  winsock.h:429
   SO_MAXDG : constant := 16#7009#;      --  winsock.h:434
   SO_MAXPATHDG : constant := 16#700a#;      --  winsock.h:435
   TCP_NODELAY : constant := 16#1#;         --  winsock.h:440
   TCP_BSDURGENT : constant := 16#7000#;      --  winsock.h:441
   AF_UNSPEC : constant := 0;             --  winsock.h:446
   AF_UNIX : constant := 1;             --  winsock.h:447
   AF_INET : constant := 2;             --  winsock.h:448
   AF_IMPLINK : constant := 3;             --  winsock.h:449
   AF_PUP : constant := 4;             --  winsock.h:450
   AF_CHAOS : constant := 5;             --  winsock.h:451
   AF_IPX : constant := 6;             --  winsock.h:452
   AF_NS : constant := 6;             --  winsock.h:453
   AF_ISO : constant := 7;             --  winsock.h:454
   AF_OSI : constant := 7;             --  winsock.h:455
   AF_ECMA : constant := 8;             --  winsock.h:456
   AF_DATAKIT : constant := 9;             --  winsock.h:457
   AF_CCITT : constant := 10;            --  winsock.h:458
   AF_SNA : constant := 11;            --  winsock.h:459
   AF_DECnet : constant := 12;            --  winsock.h:460
   AF_DLI : constant := 13;            --  winsock.h:461
   AF_LAT : constant := 14;            --  winsock.h:462
   AF_HYLINK : constant := 15;            --  winsock.h:463
   AF_APPLETALK : constant := 16;            --  winsock.h:464
   AF_NETBIOS : constant := 17;            --  winsock.h:465
   AF_MAX : constant := 18;            --  winsock.h:467
   PF_UNSPEC : constant := 0;             --  winsock.h:490
   PF_UNIX : constant := 1;             --  winsock.h:491
   PF_INET : constant := 2;             --  winsock.h:492
   PF_IMPLINK : constant := 3;             --  winsock.h:493
   PF_PUP : constant := 4;             --  winsock.h:494
   PF_CHAOS : constant := 5;             --  winsock.h:495
   PF_NS : constant := 6;             --  winsock.h:496
   PF_IPX : constant := 6;             --  winsock.h:497
   PF_ISO : constant := 7;             --  winsock.h:498
   PF_OSI : constant := 7;             --  winsock.h:499
   PF_ECMA : constant := 8;             --  winsock.h:500
   PF_DATAKIT : constant := 9;             --  winsock.h:501
   PF_CCITT : constant := 10;            --  winsock.h:502
   PF_SNA : constant := 11;            --  winsock.h:503
   PF_DECnet : constant := 12;            --  winsock.h:504
   PF_DLI : constant := 13;            --  winsock.h:505
   PF_LAT : constant := 14;            --  winsock.h:506
   PF_HYLINK : constant := 15;            --  winsock.h:507
   PF_APPLETALK : constant := 16;            --  winsock.h:508
   PF_MAX : constant := 18;            --  winsock.h:510
   SOL_SOCKET : constant := 16#ffff#;      --  winsock.h:523
   SOMAXCONN : constant := 5;             --  winsock.h:528
   MSG_OOB : constant := 16#1#;         --  winsock.h:530
   MSG_PEEK : constant := 16#2#;         --  winsock.h:531
   MSG_DONTROUTE : constant := 16#4#;         --  winsock.h:532
   MSG_MAXIOVLEN : constant := 16;            --  winsock.h:534
   MSG_PARTIAL : constant := 16#8000#;      --  winsock.h:536
   MAXGETHOSTSTRUCT : constant := 1024;          --  winsock.h:541
   FD_READ : constant := 16#1#;         --  winsock.h:546
   FD_WRITE : constant := 16#2#;         --  winsock.h:547
   FD_OOB : constant := 16#4#;         --  winsock.h:548
   FD_ACCEPT : constant := 16#8#;         --  winsock.h:549
   FD_CONNECT : constant := 16#10#;        --  winsock.h:550
   FD_CLOSE : constant := 16#20#;        --  winsock.h:551
   WSABASEERR : constant := 10000;         --  winsock.h:557
   WSAEINTR : constant := 10004;         --  winsock.h:561
   WSAEBADF : constant := 10009;         --  winsock.h:562
   WSAEACCES : constant := 10013;         --  winsock.h:563
   WSAEFAULT : constant := 10014;         --  winsock.h:564
   WSAEINVAL : constant := 10022;         --  winsock.h:565
   WSAEMFILE : constant := 10024;         --  winsock.h:566
   WSAEWOULDBLOCK : constant := 10035;         --  winsock.h:571
   WSAEINPROGRESS : constant := 10036;         --  winsock.h:572
   WSAEALREADY : constant := 10037;         --  winsock.h:573
   WSAENOTSOCK : constant := 10038;         --  winsock.h:574
   WSAEDESTADDRREQ : constant := 10039;         --  winsock.h:575
   WSAEMSGSIZE : constant := 10040;         --  winsock.h:576
   WSAEPROTOTYPE : constant := 10041;         --  winsock.h:577
   WSAENOPROTOOPT : constant := 10042;         --  winsock.h:578
   WSAEPROTONOSUPPORT : constant := 10043;         --  winsock.h:579
   WSAESOCKTNOSUPPORT : constant := 10044;         --  winsock.h:580
   WSAEOPNOTSUPP : constant := 10045;         --  winsock.h:581
   WSAEPFNOSUPPORT : constant := 10046;         --  winsock.h:582
   WSAEAFNOSUPPORT : constant := 10047;         --  winsock.h:583
   WSAEADDRINUSE : constant := 10048;         --  winsock.h:584
   WSAEADDRNOTAVAIL : constant := 10049;         --  winsock.h:585
   WSAENETDOWN : constant := 10050;         --  winsock.h:586
   WSAENETUNREACH : constant := 10051;         --  winsock.h:587
   WSAENETRESET : constant := 10052;         --  winsock.h:588
   WSAECONNABORTED : constant := 10053;         --  winsock.h:589
   WSAECONNRESET : constant := 10054;         --  winsock.h:590
   WSAENOBUFS : constant := 10055;         --  winsock.h:591
   WSAEISCONN : constant := 10056;         --  winsock.h:592
   WSAENOTCONN : constant := 10057;         --  winsock.h:593
   WSAESHUTDOWN : constant := 10058;         --  winsock.h:594
   WSAETOOMANYREFS : constant := 10059;         --  winsock.h:595
   WSAETIMEDOUT : constant := 10060;         --  winsock.h:596
   WSAECONNREFUSED : constant := 10061;         --  winsock.h:597
   WSAELOOP : constant := 10062;         --  winsock.h:598
   WSAENAMETOOLONG : constant := 10063;         --  winsock.h:599
   WSAEHOSTDOWN : constant := 10064;         --  winsock.h:600
   WSAEHOSTUNREACH : constant := 10065;         --  winsock.h:601
   WSAENOTEMPTY : constant := 10066;         --  winsock.h:602
   WSAEPROCLIM : constant := 10067;         --  winsock.h:603
   WSAEUSERS : constant := 10068;         --  winsock.h:604
   WSAEDQUOT : constant := 10069;         --  winsock.h:605
   WSAESTALE : constant := 10070;         --  winsock.h:606
   WSAEREMOTE : constant := 10071;         --  winsock.h:607
   WSAEDISCON : constant := 10101;         --  winsock.h:609
   WSASYSNOTREADY : constant := 10091;         --  winsock.h:614
   WSAVERNOTSUPPORTED : constant := 10092;         --  winsock.h:615
   WSANOTINITIALISED : constant := 10093;         --  winsock.h:616
   WSAHOST_NOT_FOUND : constant := 11001;         --  winsock.h:632
   HOST_NOT_FOUND : constant := 11001;         --  winsock.h:633
   WSATRY_AGAIN : constant := 11002;         --  winsock.h:636
   TRY_AGAIN : constant := 11002;         --  winsock.h:637
   WSANO_RECOVERY : constant := 11003;         --  winsock.h:640
   NO_RECOVERY : constant := 11003;         --  winsock.h:641
   WSANO_DATA : constant := 11004;         --  winsock.h:644
   NO_DATA : constant := 11004;         --  winsock.h:645
   WSANO_ADDRESS : constant := 11004;         --  winsock.h:648
   NO_ADDRESS : constant := 11004;         --  winsock.h:649

   subtype u_char is Win32.UCHAR;                          --  winsock.h:36
   subtype u_short is Win32.USHORT;                        --  winsock.h:37
   subtype u_int is Win32.UINT;                            --  winsock.h:38
   type SOCKET is new u_int;                               --  winsock.h:45

   type SOCKET_Array is                                    --  winsock.h:61
     array (Integer range 0 .. FD_SETSIZE - 1)
     of SOCKET;

   type FD_SET;                                            --  winsock.h:59
   type TIMEVAL;                                           --  winsock.h:102
   type HOSTENT;                                           --  winsock.h:158
   type netent;                                            --  winsock.h:171
   type SERVENT;                                           --  winsock.h:178
   type PROTOENT;                                          --  winsock.h:185
   type struct_anonymous1_t;                               --  winsock.h:270
   type struct_anonymous2_t;                               --  winsock.h:271
   type union_anonymous3_t;                                --  winsock.h:273
   type IN_ADDR;                                           --  winsock.h:268
   type SOCKADDR_IN;                                       --  winsock.h:318
   type WSADATA;                                           --  winsock.h:328
   type ip_mreq;                                           --  winsock.h:357
   type SOCKADDR;                                          --  winsock.h:473
   type sockproto;                                         --  winsock.h:482
   type LINGER;                                            --  winsock.h:515

   type LPWSADATA is access all WSADATA;                   --  winsock.h:338

   type ac_SOCKADDR_t is access all SOCKADDR;         --  winsock.h:705
   type PSOCKADDR is access all SOCKADDR;                  --  winsock.h:830
   subtype LPSOCKADDR is PSOCKADDR;                        --  winsock.h:831

   type PSOCKADDR_IN is access all SOCKADDR_IN;            --  winsock.h:834
   subtype LPSOCKADDR_IN is PSOCKADDR_IN;                  --  winsock.h:835

   type PLINGER is access all LINGER;                      --  winsock.h:838
   subtype LPLINGER is PLINGER;                            --  winsock.h:839

   type PIN_ADDR is access all IN_ADDR;                    --  winsock.h:842
   subtype LPIN_ADDR is PIN_ADDR;                          --  winsock.h:843

   type PFD_SET is access all FD_SET;                      --  winsock.h:846
   subtype LPFD_SET is PFD_SET;                            --  winsock.h:847

   type PHOSTENT is access all HOSTENT;                    --  winsock.h:850
   subtype LPHOSTENT is PHOSTENT;                          --  winsock.h:851

   type PSERVENT is access all SERVENT;                    --  winsock.h:854
   subtype LPSERVENT is PSERVENT;                          --  winsock.h:855

   type PPROTOENT is access all PROTOENT;                  --  winsock.h:858
   subtype LPPROTOENT is PPROTOENT;                        --  winsock.h:859

   type ac_TIMEVAL_t is access all TIMEVAL;           --  winsock.h:742
   type PTIMEVAL is access all TIMEVAL;                    --  winsock.h:862
   subtype LPTIMEVAL is PTIMEVAL;                          --  winsock.h:863

   type FD_SET is                                          --  winsock.h:59
      record
         fd_count : u_int;                                --  winsock.h:60
         fd_array : SOCKET_Array;                         --  winsock.h:61
      end record;

   type TIMEVAL is                                         --  winsock.h:102
      record
         tv_sec : Win32.LONG;                            --  winsock.h:103
         tv_usec : Win32.LONG;                            --  winsock.h:104
      end record;

   type PPCHAR is access all Win32.PSTR;                   --  winsock.h:160

   type HOSTENT is                                         --  winsock.h:158
      record
         h_name : Win32.PSTR;                        --  winsock.h:159
         h_aliases : PPCHAR;                            --  winsock.h:160
         h_addrtype : Win32.SHORT;                       --  winsock.h:161
         h_length : Win32.SHORT;                       --  winsock.h:162
         h_addr_list : PPCHAR;                            --  winsock.h:163
      end record;

   type netent is                                          --  winsock.h:171
      record
         n_name : Win32.PSTR;                         --  winsock.h:172
         n_aliases : PPCHAR;                             --  winsock.h:173
         n_addrtype : Win32.SHORT;                        --  winsock.h:174
         n_net : u_long;                             --  winsock.h:175
      end record;

   type SERVENT is                                         --  winsock.h:178
      record
         s_name : Win32.PSTR;                          --  winsock.h:179
         s_aliases : PPCHAR;                              --  winsock.h:180
         s_port : Win32.SHORT;                         --  winsock.h:181
         s_proto : Win32.PSTR;                          --  winsock.h:182
      end record;

   type PROTOENT is                                        --  winsock.h:185
      record
         p_name : Win32.PSTR;                          --  winsock.h:186
         p_aliases : PPCHAR;                              --  winsock.h:187
         p_proto : Win32.SHORT;                         --  winsock.h:188
      end record;

   type struct_anonymous1_t is                             --  winsock.h:270
      record
         s_b1 : u_char;                                   --  winsock.h:270
         s_b2 : u_char;                                   --  winsock.h:270
         s_b3 : u_char;                                   --  winsock.h:270
         s_b4 : u_char;                                   --  winsock.h:270
      end record;

   type struct_anonymous2_t is                             --  winsock.h:271
      record
         s_w1 : u_short;                                  --  winsock.h:271
         s_w2 : u_short;                                  --  winsock.h:271
      end record;

   type union_anonymous3_t_kind is ( --  winsock.h:273
     S_un_b_kind,
     S_un_w_kind,
     S_addr_kind
                                   );

   type union_anonymous3_t (Which : union_anonymous3_t_kind := S_un_b_kind) is
      --  winsock.h:273
      record
         case Which is
            when S_un_b_kind =>
               S_un_b : struct_anonymous1_t;            --  winsock.h:270
            when S_un_w_kind =>
               S_un_w : struct_anonymous2_t;            --  winsock.h:271
            when S_addr_kind =>
               S_addr : u_long;                         --  winsock.h:272
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous3_t);

   pragma Unchecked_Union (union_anonymous3_t);

   type IN_ADDR is                                         --  winsock.h:268
      record
         S_un : union_anonymous3_t;                       --  winsock.h:273
      end record;

   type SOCKADDR_IN is                                     --  winsock.h:318
      record
         sin_family : Win32.SHORT;                        --  winsock.h:319
         sin_port : u_short;                            --  winsock.h:320
         sin_addr : IN_ADDR;                            --  winsock.h:321
         sin_zero : Win32.CHAR_Array (0 .. 7);             --  winsock.h:322
      end record;

   type WSADATA is                                         --  winsock.h:328
      record
         wVersion : Win32.WORD;                     --  winsock.h:329
         wHighVersion : Win32.WORD;                     --  winsock.h:330
         szDescription : Win32.CHAR_Array (0 .. WSADESCRIPTION_LEN);
         --  winsock.h:331
         szSystemStatus : Win32.CHAR_Array (0 .. WSASYS_STATUS_LEN);
         --  winsock.h:332
         iMaxSockets : Win32.USHORT;                   --  winsock.h:333
         iMaxUdpDg : Win32.USHORT;                   --  winsock.h:334
         lpVendorInfo : Win32.PSTR;                     --  winsock.h:335
      end record;

   type ip_mreq is                                         --  winsock.h:357
      record
         imr_multiaddr : IN_ADDR;                         --  winsock.h:358
         imr_interface : IN_ADDR;                         --  winsock.h:359
      end record;

   type SOCKADDR is                                        --  winsock.h:473
      record
         sa_family : u_short;                             --  winsock.h:474
         sa_data : Win32.CHAR_Array (0 .. 13);             --  winsock.h:475
      end record;

   type sockproto is                                       --  winsock.h:482
      record
         sp_family : u_short;                           --  winsock.h:483
         sp_protocol : u_short;                           --  winsock.h:484
      end record;

   type LINGER is                                          --  winsock.h:515
      record
         l_onoff : u_short;                              --  winsock.h:516
         l_linger : u_short;                              --  winsock.h:517
      end record;

   function WSAFDIsSet
     (fd : SOCKET;
      set : access FD_SET)
     return Win32.INT;                            --  winsock.h:68

   procedure FD_CLR (fd : SOCKET;
                     set : access FD_SET);                   --  winsock.h:75

   procedure FD_SET_PROC (fd : SOCKET;
                          set : access FD_SET);              --  winsock.h:90

   --  procedure FD_ZERO(set : access FD_SET);               -- winsock.h:95

   function FD_ISSET (fd : SOCKET;
                      set : access FD_SET)                   --  winsock.h:97
                     return Win32.INT
     renames WSAFDIsSet;

   function timerisset (tvp : access TIMEVAL) return Win32.BOOL;
   --  winsock.h:112

   type LPCMPFN is access function (left, right : Win32.LONG) return Boolean;

   function timercmp (tvp : access TIMEVAL;
                      uvp : access TIMEVAL;
                      cmp : LPCMPFN)
                     return Win32.BOOL;                    --  winsock.h:113
   pragma Convention (Stdcall, LPCMPFN);

   procedure timerclear (tvp : access TIMEVAL);              --  winsock.h:116


   function FIONREAD return Win32.LONG;                    --  winsock.h:141
   function FIONBIO return Win32.LONG;                     --  winsock.h:142
   function FIOASYNC return Win32.LONG;                    --  winsock.h:143
   function SIOCSHIWAT return Win32.LONG;                  --  winsock.h:146
   function SIOCGHIWAT return Win32.LONG;                  --  winsock.h:147
   function SIOCSLOWAT return Win32.LONG;                  --  winsock.h:148
   function SIOCGLOWAT return Win32.LONG;                  --  winsock.h:149
   function SIOCATMARK return Win32.LONG;                  --  winsock.h:150

   function IN_CLASSA (i : Win32.LONG) return Win32.BOOL;    --  winsock.h:293

   function IN_CLASSB (i : Win32.LONG) return Win32.BOOL;    --  winsock.h:299

   function IN_CLASSC (i : Win32.LONG) return Win32.BOOL;    --  winsock.h:305

   function c_accept
     (s : SOCKET;
      addr : access SOCKADDR;
      addrlen : access Win32.INT)
     return SOCKET;                               --  winsock.h:702

   function bind
     (s : SOCKET;
      addr : ac_SOCKADDR_t;
      namelen : Win32.INT)
     return Win32.INT;                            --  winsock.h:705

   function closesocket
     (s : SOCKET)
     return Win32.INT;                            --  winsock.h:707

   function connect
     (s : SOCKET;
      name : ac_SOCKADDR_t;
      namelen : Win32.INT)
     return Win32.INT;                            --  winsock.h:709

   function ioctlsocket
     (s : SOCKET;
      cmd : Win32.LONG;
      argp : access Win32.ULONG)
     return Win32.INT;                            --  winsock.h:711

   function getpeername
     (s : SOCKET;
      name : access SOCKADDR;
      namelen : access Win32.INT)
     return Win32.INT;                            --  winsock.h:713

   function getsockname
     (s : SOCKET;
      name : access SOCKADDR;
      namelen : access Win32.INT)
     return Win32.INT;                            --  winsock.h:716

   function getsockopt
     (s : SOCKET;
      level : Win32.INT;
      optname : Win32.INT;
      optval : Win32.PSTR;
      optlen : access Win32.INT)
     return Win32.INT;                            --  winsock.h:719

   function htonl
     (hostlong : u_long)
     return u_long;                               --  winsock.h:722

   function htons
     (hostshort : u_short)
     return u_short;                              --  winsock.h:724

   function inet_addr
     (cp : Win32.PCSTR)
     return Win32.ULONG;                          --  winsock.h:726

   function inet_ntoa
     (c_in : IN_ADDR)
     return Win32.PSTR;                           --  winsock.h:728

   function listen
     (s : SOCKET;
      backlog : Win32.INT)
     return Win32.INT;                            --  winsock.h:730

   function ntohl
     (netlong : u_long)
     return u_long;                               --  winsock.h:732

   function ntohs
     (netshort : u_short)
     return u_short;                              --  winsock.h:734

   function recv
     (s : SOCKET;
      buf : Win32.PSTR;
      len : Win32.INT;
      flags : Win32.INT)
     return Win32.INT;                            --  winsock.h:736

   function recvfrom
     (s : SOCKET;
      buf : Win32.PSTR;
      len : Win32.INT;
      flags : Win32.INT;
      from : access SOCKADDR;
      fromlen : access Win32.INT)
     return Win32.INT;                            --  winsock.h:738

   function c_select
     (nfds : Win32.INT;
      readfds : access FD_SET;
      writefds : access FD_SET;
      exceptfds : access FD_SET;
      timeout : ac_TIMEVAL_t)
     return Win32.INT;                            --  winsock.h:741

   function send
     (s : SOCKET;
      buf : Win32.PCSTR;
      len : Win32.INT;
      flags : Win32.INT)
     return Win32.INT;                            --  winsock.h:744

   function sendto
     (s : SOCKET;
      buf : Win32.PCSTR;
      len : Win32.INT;
      flags : Win32.INT;
      to : ac_SOCKADDR_t;
      tolen : Win32.INT)
     return Win32.INT;                            --  winsock.h:746

   function setsockopt
     (s : SOCKET;
      level : Win32.INT;
      optname : Win32.INT;
      optval : Win32.PCSTR;
      optlen : Win32.INT)
     return Win32.INT;                            --  winsock.h:749

   function shutdown
     (s : SOCKET;
      how : Win32.INT)
     return Win32.INT;                            --  winsock.h:752

   function socket_func
     (af : Win32.INT;
      c_type : Win32.INT;
      protocol : Win32.INT)
     return SOCKET;                               --  winsock.h:754

   function gethostbyaddr
     (addr : Win32.PCSTR;
      len : Win32.INT;
      c_type : Win32.INT)
     return PHOSTENT;                             --  winsock.h:758

   function gethostbyname
     (name : Win32.PCSTR)
     return PHOSTENT;                             --  winsock.h:761

   function gethostname
     (name : Win32.PSTR;
      namelen : Win32.INT)
     return Win32.INT;                            --  winsock.h:763

   function getservbyport
     (port : Win32.INT;
      proto : Win32.PCSTR)
     return PSERVENT;                             --  winsock.h:765

   function getservbyname
     (name : Win32.PCSTR;
      proto : Win32.PCSTR)
     return PSERVENT;                             --  winsock.h:767

   function getprotobynumber
     (proto : Win32.INT)
     return PPROTOENT;                            --  winsock.h:770

   function getprotobyname
     (name : Win32.PCSTR)
     return PPROTOENT;                            --  winsock.h:772

   function WSAStartup
     (wVersionRequired : Win32.WORD;
      lpWSAData : Win32.Winsock.LPWSADATA)
     return Win32.INT;                            --  winsock.h:776

   function WSACleanup return Win32.INT;                   --  winsock.h:778

   procedure WSASetLastError
     (iError : Win32.INT);                         --  winsock.h:780

   function WSAGetLastError return Win32.INT;              --  winsock.h:782

   function h_errno return Win32.INT                       --  winsock.h:629
     renames WSAGetLastError;

   function WSAIsBlocking return Win32.BOOL;               --  winsock.h:784

   function WSAUnhookBlockingHook return Win32.INT;        --  winsock.h:786

   function WSASetBlockingHook
     (lpBlockFunc : Win32.Windef.FARPROC)
     return Win32.Windef.FARPROC;                 --  winsock.h:788

   function WSACancelBlockingCall return Win32.INT;        --  winsock.h:790

   function WSAAsyncGetServByName
     (hWnd : Win32.Windef.HWND;
      wMsg : u_int;
      name : Win32.PCSTR;
      proto : Win32.PCSTR;
      buf : Win32.PSTR;
      buflen : Win32.INT)
     return Win32.Winnt.HANDLE;                   --  winsock.h:792

   function WSAAsyncGetServByPort
     (hWnd : Win32.Windef.HWND;
      wMsg : u_int;
      port : Win32.INT;
      proto : Win32.PCSTR;
      buf : Win32.PSTR;
      buflen : Win32.INT)
     return Win32.Winnt.HANDLE;                   --  winsock.h:797

   function WSAAsyncGetProtoByName
     (hWnd : Win32.Windef.HWND;
      wMsg : u_int;
      name : Win32.PCSTR;
      buf : Win32.PSTR;
      buflen : Win32.INT)
     return Win32.Winnt.HANDLE;                   --  winsock.h:801

   function WSAAsyncGetProtoByNumber
     (hWnd : Win32.Windef.HWND;
      wMsg : u_int;
      number : Win32.INT;
      buf : Win32.PSTR;
      buflen : Win32.INT)
     return Win32.Winnt.HANDLE;                   --  winsock.h:805

   function WSAAsyncGetHostByName
     (hWnd : Win32.Windef.HWND;
      wMsg : u_int;
      name : Win32.PCSTR;
      buf : Win32.PSTR;
      buflen : Win32.INT)
     return Win32.Winnt.HANDLE;                   --  winsock.h:809

   function WSAAsyncGetHostByAddr
     (hWnd : Win32.Windef.HWND;
      wMsg : u_int;
      addr : Win32.PCSTR;
      len : Win32.INT;
      c_type : Win32.INT;
      buf : Win32.PSTR;
      buflen : Win32.INT)
     return Win32.Winnt.HANDLE;                   --  winsock.h:813

   function WSACancelAsyncRequest
     (hAsyncTaskHandle : Win32.Winnt.HANDLE)
     return Win32.INT;                            --  winsock.h:817

   function WSAAsyncSelect
     (s : SOCKET;
      hWnd : Win32.Windef.HWND;
      wMsg : u_int;
      lEvent : Win32.LONG)
     return Win32.INT;                            --  winsock.h:819

   function WSARecvEx
     (s : SOCKET;
      buf : Win32.PSTR;
      len : Win32.INT;
      flags : access Win32.INT)
     return Win32.INT;                            --  winsock.h:822

private

   pragma Convention (C, FD_SET);                           --  winsock.h :59
   pragma Convention (C_Pass_By_Copy, TIMEVAL);             --  winsock.h :102
   pragma Convention (C_Pass_By_Copy, HOSTENT);             --  winsock.h :158
   pragma Convention (C_Pass_By_Copy, netent);              --  winsock.h :171
   pragma Convention (C_Pass_By_Copy, SERVENT);             --  winsock.h :178
   pragma Convention (C_Pass_By_Copy, PROTOENT);            --  winsock.h :185
   pragma Convention (C_Pass_By_Copy, struct_anonymous1_t); --  winsock.h :270
   pragma Convention (C_Pass_By_Copy, struct_anonymous2_t); --  winsock.h :271
   pragma Convention (C_Pass_By_Copy, IN_ADDR);             --  winsock.h :268

   pragma Convention (C_Pass_By_Copy, SOCKADDR_IN); --  winsock.h :318
   pragma Convention (C, WSADATA);                  --  winsock.h :328
   pragma Convention (C_Pass_By_Copy, ip_mreq);     --  winsock.h :357
   pragma Convention (C_Pass_By_Copy, SOCKADDR);    --  winsock.h :473
   pragma Convention (C_Pass_By_Copy, sockproto);   --  winsock.h :482
   pragma Convention (C_Pass_By_Copy, LINGER);      --  winsock.h :515

   pragma Import (Stdcall, WSAFDIsSet, "__WSAFDIsSet");     --  winsock.h:68
   pragma Import (Stdcall, c_accept, "accept");             --  winsock.h:702
   pragma Import (Stdcall, bind, "bind");                   --  winsock.h:705
   pragma Import (Stdcall, closesocket, "closesocket");     --  winsock.h:707
   pragma Import (Stdcall, connect, "connect");             --  winsock.h:709
   pragma Import (Stdcall, ioctlsocket, "ioctlsocket");     --  winsock.h:711
   pragma Import (Stdcall, getpeername, "getpeername");     --  winsock.h:713
   pragma Import (Stdcall, getsockname, "getsockname");     --  winsock.h:716
   pragma Import (Stdcall, getsockopt, "getsockopt");       --  winsock.h:719
   pragma Import (Stdcall, htonl, "htonl");                 --  winsock.h:722
   pragma Import (Stdcall, htons, "htons");                 --  winsock.h:724
   pragma Import (Stdcall, inet_addr, "inet_addr");         --  winsock.h:726
   pragma Import (Stdcall, inet_ntoa, "inet_ntoa");         --  winsock.h:728
   pragma Import (Stdcall, listen, "listen");               --  winsock.h:730
   pragma Import (Stdcall, ntohl, "ntohl");                 --  winsock.h:732
   pragma Import (Stdcall, ntohs, "ntohs");                 --  winsock.h:734
   pragma Import (Stdcall, recv, "recv");                   --  winsock.h:736
   pragma Import (Stdcall, recvfrom, "recvfrom");           --  winsock.h:738
   pragma Import (Stdcall, c_select, "select");             --  winsock.h:741
   pragma Import (Stdcall, send, "send");                   --  winsock.h:744
   pragma Import (Stdcall, sendto, "sendto");               --  winsock.h:746
   pragma Import (Stdcall, setsockopt, "setsockopt");       --  winsock.h:749
   pragma Import (Stdcall, shutdown, "shutdown");           --  winsock.h:752
   pragma Import (Stdcall, socket_func, "socket");          --  winsock.h:754
   pragma Import (Stdcall, gethostbyaddr, "gethostbyaddr"); --  winsock.h:758
   pragma Import (Stdcall, gethostbyname, "gethostbyname"); --  winsock.h:761
   pragma Import (Stdcall, gethostname, "gethostname");     --  winsock.h:763
   pragma Import (Stdcall, getservbyport, "getservbyport"); --  winsock.h:765
   pragma Import (Stdcall, getservbyname, "getservbyname"); --  winsock.h:767
   pragma Import (Stdcall, getprotobynumber, "getprotobynumber");
   --  winsock.h:770
   pragma Import (Stdcall, getprotobyname, "getprotobyname");
   --  winsock.h:772
   pragma Import (Stdcall, WSAStartup, "WSAStartup");       --  winsock.h:776
   pragma Import (Stdcall, WSACleanup, "WSACleanup");       --  winsock.h:778
   pragma Import (Stdcall, WSASetLastError, "WSASetLastError");
   --  winsock.h:780
   pragma Import (Stdcall, WSAGetLastError, "WSAGetLastError");
   --  winsock.h:782
   pragma Import (Stdcall, WSAIsBlocking, "WSAIsBlocking"); --  winsock.h:784
   pragma Import (Stdcall, WSAUnhookBlockingHook, "WSAUnhookBlockingHook");
   --  winsock.h:786
   pragma Import (Stdcall, WSASetBlockingHook, "WSASetBlockingHook");
   --  winsock.h:788
   pragma Import (Stdcall, WSACancelBlockingCall, "WSACancelBlockingCall");
   --  winsock.h:790
   pragma Import (Stdcall, WSAAsyncGetServByName, "WSAAsyncGetServByName");
   --  winsock.h:792
   pragma Import (Stdcall, WSAAsyncGetServByPort, "WSAAsyncGetServByPort");
   --  winsock.h:797
   pragma Import (Stdcall, WSAAsyncGetProtoByName, "WSAAsyncGetProtoByName");
   --  winsock.h:801
   pragma Import (Stdcall, WSAAsyncGetProtoByNumber,
                    "WSAAsyncGetProtoByNumber");
   --  winsock.h:805
   pragma Import (Stdcall, WSAAsyncGetHostByName, "WSAAsyncGetHostByName");
   --  winsock.h:809
   pragma Import (Stdcall, WSAAsyncGetHostByAddr, "WSAAsyncGetHostByAddr");
   --  winsock.h:813
   pragma Import (Stdcall, WSACancelAsyncRequest, "WSACancelAsyncRequest");
   --  winsock.h:817
   pragma Import (Stdcall, WSAAsyncSelect, "WSAAsyncSelect"); --  winsock.h:819
   pragma Import (Stdcall, WSARecvEx, "WSARecvEx");           --  winsock.h:822

end Win32.Winsock;


