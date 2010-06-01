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
with Win32.Winsvc;

package Win32.Lmserver is

   SV_PLATFORM_ID_OS2                    : constant := 400;
   SV_PLATFORM_ID_NT                     : constant := 500;
   MAJOR_VERSION_MASK                    : constant := 16#f#;
   SV_TYPE_WORKSTATION                   : constant := 16#1#;
   SV_TYPE_SERVER                        : constant := 16#2#;
   SV_TYPE_SQLSERVER                     : constant := 16#4#;
   SV_TYPE_DOMAIN_CTRL                   : constant := 16#8#;
   SV_TYPE_DOMAIN_BAKCTRL                : constant := 16#10#;
   SV_TYPE_TIME_SOURCE                   : constant := 16#20#;
   SV_TYPE_AFP                           : constant := 16#40#;
   SV_TYPE_NOVELL                        : constant := 16#80#;
   SV_TYPE_DOMAIN_MEMBER                 : constant := 16#100#;
   SV_TYPE_PRINTQ_SERVER                 : constant := 16#200#;
   SV_TYPE_DIALIN_SERVER                 : constant := 16#400#;
   SV_TYPE_XENIX_SERVER                  : constant := 16#800#;
   SV_TYPE_SERVER_UNIX                   : constant := 16#800#;
   SV_TYPE_NT                            : constant := 16#1000#;
   SV_TYPE_WFW                           : constant := 16#2000#;
   SV_TYPE_SERVER_MFPN                   : constant := 16#4000#;
   SV_TYPE_SERVER_NT                     : constant := 16#8000#;
   SV_TYPE_POTENTIAL_BROWSER             : constant := 16#10000#;
   SV_TYPE_BACKUP_BROWSER                : constant := 16#20000#;
   SV_TYPE_MASTER_BROWSER                : constant := 16#40000#;
   SV_TYPE_DOMAIN_MASTER                 : constant := 16#80000#;
   SV_TYPE_SERVER_OSF                    : constant := 16#100000#;
   SV_TYPE_SERVER_VMS                    : constant := 16#200000#;
   SV_TYPE_ALTERNATE_XPORT               : constant := 16#20000000#;
   SV_TYPE_LOCAL_LIST_ONLY               : constant := 16#40000000#;
   SV_TYPE_DOMAIN_ENUM                   : constant := 16#80000000#;
   SV_TYPE_ALL                           : constant := 16#ffffffff#;
   SV_NODISC                             : constant := -1;
   SV_USERSECURITY                       : constant := 1;
   SV_SHARESECURITY                      : constant := 0;
   SV_HIDDEN                             : constant := 1;
   SV_VISIBLE                            : constant := 0;
   SV_PLATFORM_ID_PARMNUM                : constant := 101;
   SV_NAME_PARMNUM                       : constant := 102;
   SV_VERSION_MAJOR_PARMNUM              : constant := 103;
   SV_VERSION_MINOR_PARMNUM              : constant := 104;
   SV_TYPE_PARMNUM                       : constant := 105;
   SV_COMMENT_PARMNUM                    : constant := 5;
   SV_USERS_PARMNUM                      : constant := 107;
   SV_DISC_PARMNUM                       : constant := 10;
   SV_HIDDEN_PARMNUM                     : constant := 16;
   SV_ANNOUNCE_PARMNUM                   : constant := 17;
   SV_ANNDELTA_PARMNUM                   : constant := 18;
   SV_USERPATH_PARMNUM                   : constant := 112;
   SV_ULIST_MTIME_PARMNUM                : constant := 401;
   SV_GLIST_MTIME_PARMNUM                : constant := 402;
   SV_ALIST_MTIME_PARMNUM                : constant := 403;
   SV_ALERTS_PARMNUM                     : constant := 11;
   SV_SECURITY_PARMNUM                   : constant := 405;
   SV_NUMADMIN_PARMNUM                   : constant := 406;
   SV_LANMASK_PARMNUM                    : constant := 407;
   SV_GUESTACC_PARMNUM                   : constant := 408;
   SV_CHDEVQ_PARMNUM                     : constant := 410;
   SV_CHDEVJOBS_PARMNUM                  : constant := 411;
   SV_CONNECTIONS_PARMNUM                : constant := 412;
   SV_SHARES_PARMNUM                     : constant := 413;
   SV_OPENFILES_PARMNUM                  : constant := 414;
   SV_SESSREQS_PARMNUM                   : constant := 417;
   SV_ACTIVELOCKS_PARMNUM                : constant := 419;
   SV_NUMREQBUF_PARMNUM                  : constant := 420;
   SV_NUMBIGBUF_PARMNUM                  : constant := 422;
   SV_NUMFILETASKS_PARMNUM               : constant := 423;
   SV_ALERTSCHED_PARMNUM                 : constant := 37;
   SV_ERRORALERT_PARMNUM                 : constant := 38;
   SV_LOGONALERT_PARMNUM                 : constant := 39;
   SV_ACCESSALERT_PARMNUM                : constant := 40;
   SV_DISKALERT_PARMNUM                  : constant := 41;
   SV_NETIOALERT_PARMNUM                 : constant := 42;
   SV_MAXAUDITSZ_PARMNUM                 : constant := 43;
   SV_SRVHEURISTICS_PARMNUM              : constant := 431;
   SV_SESSOPENS_PARMNUM                  : constant := 501;
   SV_SESSVCS_PARMNUM                    : constant := 502;
   SV_OPENSEARCH_PARMNUM                 : constant := 503;
   SV_SIZREQBUF_PARMNUM                  : constant := 504;
   SV_INITWORKITEMS_PARMNUM              : constant := 505;
   SV_MAXWORKITEMS_PARMNUM               : constant := 506;
   SV_RAWWORKITEMS_PARMNUM               : constant := 507;
   SV_IRPSTACKSIZE_PARMNUM               : constant := 508;
   SV_MAXRAWBUFLEN_PARMNUM               : constant := 509;
   SV_SESSUSERS_PARMNUM                  : constant := 510;
   SV_SESSCONNS_PARMNUM                  : constant := 511;
   SV_MAXNONPAGEDMEMORYUSAGE_PARMNUM     : constant := 512;
   SV_MAXPAGEDMEMORYUSAGE_PARMNUM        : constant := 513;
   SV_ENABLESOFTCOMPAT_PARMNUM           : constant := 514;
   SV_ENABLEFORCEDLOGOFF_PARMNUM         : constant := 515;
   SV_TIMESOURCE_PARMNUM                 : constant := 516;
   SV_ACCEPTDOWNLEVELAPIS_PARMNUM        : constant := 517;
   SV_LMANNOUNCE_PARMNUM                 : constant := 518;
   SV_DOMAIN_PARMNUM                     : constant := 519;
   SV_MAXCOPYREADLEN_PARMNUM             : constant := 520;
   SV_MAXCOPYWRITELEN_PARMNUM            : constant := 521;
   SV_MINKEEPSEARCH_PARMNUM              : constant := 522;
   SV_MAXKEEPSEARCH_PARMNUM              : constant := 523;
   SV_MINKEEPCOMPLSEARCH_PARMNUM         : constant := 524;
   SV_MAXKEEPCOMPLSEARCH_PARMNUM         : constant := 525;
   SV_THREADCOUNTADD_PARMNUM             : constant := 526;
   SV_NUMBLOCKTHREADS_PARMNUM            : constant := 527;
   SV_SCAVTIMEOUT_PARMNUM                : constant := 528;
   SV_MINRCVQUEUE_PARMNUM                : constant := 529;
   SV_MINFREEWORKITEMS_PARMNUM           : constant := 530;
   SV_XACTMEMSIZE_PARMNUM                : constant := 531;
   SV_THREADPRIORITY_PARMNUM             : constant := 532;
   SV_MAXMPXCT_PARMNUM                   : constant := 533;
   SV_OPLOCKBREAKWAIT_PARMNUM            : constant := 534;
   SV_OPLOCKBREAKRESPONSEWAIT_PARMNUM    : constant := 535;
   SV_ENABLEOPLOCKS_PARMNUM              : constant := 536;
   SV_ENABLEOPLOCKFORCECLOSE_PARMNUM     : constant := 537;
   SV_ENABLEFCBOPENS_PARMNUM             : constant := 538;
   SV_ENABLERAW_PARMNUM                  : constant := 539;
   SV_ENABLESHAREDNETDRIVES_PARMNUM      : constant := 540;
   SV_MINFREECONNECTIONS_PARMNUM         : constant := 541;
   SV_MAXFREECONNECTIONS_PARMNUM         : constant := 542;
   SV_INITSESSTABLE_PARMNUM              : constant := 543;
   SV_INITCONNTABLE_PARMNUM              : constant := 544;
   SV_INITFILETABLE_PARMNUM              : constant := 545;
   SV_INITSEARCHTABLE_PARMNUM            : constant := 546;
   SV_ALERTSCHEDULE_PARMNUM              : constant := 547;
   SV_ERRORTHRESHOLD_PARMNUM             : constant := 548;
   SV_NETWORKERRORTHRESHOLD_PARMNUM      : constant := 549;
   SV_DISKSPACETHRESHOLD_PARMNUM         : constant := 550;
   SV_DISKCONFIGURATION_PARMNUM          : constant := 551;
   SV_MAXLINKDELAY_PARMNUM               : constant := 552;
   SV_MINLINKTHROUGHPUT_PARMNUM          : constant := 553;
   SV_LINKINFOVALIDTIME_PARMNUM          : constant := 554;
   SV_SCAVQOSINFOUPDATETIME_PARMNUM      : constant := 555;
   SV_MAXWORKITEMIDLETIME_PARMNUM        : constant := 556;
   SV_MAXRAWWORKITEMS_PARMNUM            : constant := 557;
   SV_NONBLOCKINGTHREADS_PARMNUM         : constant := 558;
   SV_BLOCKINGTHREADS_PARMNUM            : constant := 559;
   SV_PRODUCTTYPE_PARMNUM                : constant := 560;
   SV_SERVERSIZE_PARMNUM                 : constant := 561;
   SV_CONNECTIONLESSAUTODISC_PARMNUM     : constant := 562;
   SV_SHARINGVIOLATIONRETRIES_PARMNUM    : constant := 563;
   SV_SHARINGVIOLATIONDELAY_PARMNUM      : constant := 564;
   SV_MAXGLOBALOPENSEARCH_PARMNUM        : constant := 565;
   SV_REMOVEDUPLICATESEARCHES_PARMNUM    : constant := 566;
   SV_LOCKVIOLATIONRETRIES_PARMNUM       : constant := 567;
   SV_LOCKVIOLATIONOFFSET_PARMNUM        : constant := 568;
   SV_LOCKVIOLATIONDELAY_PARMNUM         : constant := 569;
   SV_MDLREADSWITCHOVER_PARMNUM          : constant := 570;
   SV_CACHEDOPENLIMIT_PARMNUM            : constant := 571;
   SV_CRITICALTHREADS_PARMNUM            : constant := 572;
   SV_RESTRICTNULLSESSACCESS_PARMNUM     : constant := 573;
   SV_ENABLEWFW311DIRECTIPX_PARMNUM      : constant := 574;
   SV_COMMENT_INFOLEVEL                  : constant := 1005;
   SV_USERS_INFOLEVEL                    : constant := 1107;
   SV_DISC_INFOLEVEL                     : constant := 1010;
   SV_HIDDEN_INFOLEVEL                   : constant := 1016;
   SV_ANNOUNCE_INFOLEVEL                 : constant := 1017;
   SV_ANNDELTA_INFOLEVEL                 : constant := 1018;
   SV_SESSOPENS_INFOLEVEL                : constant := 1501;
   SV_SESSVCS_INFOLEVEL                  : constant := 1502;
   SV_OPENSEARCH_INFOLEVEL               : constant := 1503;
   SV_MAXWORKITEMS_INFOLEVEL             : constant := 1506;
   SV_MAXRAWBUFLEN_INFOLEVEL             : constant := 1509;
   SV_SESSUSERS_INFOLEVEL                : constant := 1510;
   SV_SESSCONNS_INFOLEVEL                : constant := 1511;
   SV_MAXNONPAGEDMEMORYUSAGE_INFOLEVEL   : constant := 1512;
   SV_MAXPAGEDMEMORYUSAGE_INFOLEVEL      : constant := 1513;
   SV_ENABLESOFTCOMPAT_INFOLEVEL         : constant := 1514;
   SV_ENABLEFORCEDLOGOFF_INFOLEVEL       : constant := 1515;
   SV_TIMESOURCE_INFOLEVEL               : constant := 1516;
   SV_LMANNOUNCE_INFOLEVEL               : constant := 1518;
   SV_MAXCOPYREADLEN_INFOLEVEL           : constant := 1520;
   SV_MAXCOPYWRITELEN_INFOLEVEL          : constant := 1521;
   SV_MINKEEPSEARCH_INFOLEVEL            : constant := 1522;
   SV_MAXKEEPSEARCH_INFOLEVEL            : constant := 1523;
   SV_MINKEEPCOMPLSEARCH_INFOLEVEL       : constant := 1524;
   SV_MAXKEEPCOMPLSEARCH_INFOLEVEL       : constant := 1525;
   SV_SCAVTIMEOUT_INFOLEVEL              : constant := 1528;
   SV_MINRCVQUEUE_INFOLEVEL              : constant := 1529;
   SV_MINFREEWORKITEMS_INFOLEVEL         : constant := 1530;
   SV_MAXMPXCT_INFOLEVEL                 : constant := 1533;
   SV_OPLOCKBREAKWAIT_INFOLEVEL          : constant := 1534;
   SV_OPLOCKBREAKRESPONSEWAIT_INFOLEVEL  : constant := 1535;
   SV_ENABLEOPLOCKS_INFOLEVEL            : constant := 1536;
   SV_ENABLEOPLOCKFORCECLOSE_INFOLEVEL   : constant := 1537;
   SV_ENABLEFCBOPENS_INFOLEVEL           : constant := 1538;
   SV_ENABLERAW_INFOLEVEL                : constant := 1539;
   SV_ENABLESHAREDNETDRIVES_INFOLEVEL    : constant := 1540;
   SV_MINFREECONNECTIONS_INFOLEVEL       : constant := 1541;
   SV_MAXFREECONNECTIONS_INFOLEVEL       : constant := 1542;
   SV_INITSESSTABLE_INFOLEVEL            : constant := 1543;
   SV_INITCONNTABLE_INFOLEVEL            : constant := 1544;
   SV_INITFILETABLE_INFOLEVEL            : constant := 1545;
   SV_INITSEARCHTABLE_INFOLEVEL          : constant := 1546;
   SV_ALERTSCHEDULE_INFOLEVEL            : constant := 1547;
   SV_ERRORTHRESHOLD_INFOLEVEL           : constant := 1548;
   SV_NETWORKERRORTHRESHOLD_INFOLEVEL    : constant := 1549;
   SV_DISKSPACETHRESHOLD_INFOLEVEL       : constant := 1550;
   SV_MAXLINKDELAY_INFOLEVEL             : constant := 1552;
   SV_MINLINKTHROUGHPUT_INFOLEVEL        : constant := 1553;
   SV_LINKINFOVALIDTIME_INFOLEVEL        : constant := 1554;
   SV_SCAVQOSINFOUPDATETIME_INFOLEVEL    : constant := 1555;
   SV_MAXWORKITEMIDLETIME_INFOLEVEL      : constant := 1556;
   SV_MAXRAWWORKITEMS_INFOLOEVEL         : constant := 1557;
   SV_NONBLOCKINGTHREADS_INFOLOEVEL      : constant := 1558;
   SV_BLOCKINGTHREADS_INFOLOEVEL         : constant := 1559;
   SV_PRODUCTTYPE_INFOLOEVEL             : constant := 1560;
   SV_SERVERSIZE_INFOLOEVEL              : constant := 1561;
   SV_CONNECTIONLESSAUTODISC_INFOLOEVEL  : constant := 1562;
   SV_SHARINGVIOLATIONRETRIES_INFOLOEVEL : constant := 1563;
   SV_SHARINGVIOLATIONDELAY_INFOLOEVEL   : constant := 1564;
   SV_MAXGLOBALOPENSEARCH_INFOLOEVEL     : constant := 1565;
   SV_REMOVEDUPLICATESEARCHES_INFOLOEVEL : constant := 1566;
   SV_LOCKVIOLATIONRETRIES_INFOLOEVEL    : constant := 1567;
   SV_LOCKVIOLATIONOFFSET_INFOLOEVEL     : constant := 1568;
   SV_LOCKVIOLATIONDELAY_INFOLOEVEL      : constant := 1569;
   SV_MDLREADSWITCHOVER_INFOLOEVEL       : constant := 1570;
   SV_CACHEDOPENLIMIT_INFOLOEVEL         : constant := 1571;
   SV_CRITICALTHREADS_INFOLOEVEL         : constant := 1572;
   SV_RESTRICTNULLSESSACCESS_INFOLOEVEL  : constant := 1573;
   SV_ENABLEWFW311DIRECTIPX_INFOLOEVEL   : constant := 1574;
   SVI1_NUM_ELEMENTS                     : constant := 5;
   SVI2_NUM_ELEMENTS                     : constant := 40;
   SVI3_NUM_ELEMENTS                     : constant := 44;
   SV_MAX_CMD_LEN                        : constant := 256;
   SW_AUTOPROF_LOAD_MASK                 : constant := 16#1#;
   SW_AUTOPROF_SAVE_MASK                 : constant := 16#2#;
   SV_MAX_SRV_HEUR_LEN                   : constant := 32;
   SV_USERS_PER_LICENSE                  : constant := 5;

   type SERVER_INFO_100;
   type SERVER_INFO_101;
   type SERVER_INFO_102;
   type SERVER_INFO_402;
   type SERVER_INFO_403;
   type SERVER_INFO_502;
   type SERVER_INFO_503;
   type SERVER_INFO_599;
   type SERVER_INFO_598;
   type SERVER_INFO_1005;
   type SERVER_INFO_1107;
   type SERVER_INFO_1010;
   type SERVER_INFO_1016;
   type SERVER_INFO_1017;
   type SERVER_INFO_1018;
   type SERVER_INFO_1501;
   type SERVER_INFO_1502;
   type SERVER_INFO_1503;
   type SERVER_INFO_1506;
   type SERVER_INFO_1509;
   type SERVER_INFO_1510;
   type SERVER_INFO_1511;
   type SERVER_INFO_1512;
   type SERVER_INFO_1513;
   type SERVER_INFO_1514;
   type SERVER_INFO_1515;
   type SERVER_INFO_1516;
   type SERVER_INFO_1518;
   type SERVER_INFO_1520;
   type SERVER_INFO_1521;
   type SERVER_INFO_1522;
   type SERVER_INFO_1523;
   type SERVER_INFO_1524;
   type SERVER_INFO_1525;
   type SERVER_INFO_1528;
   type SERVER_INFO_1529;
   type SERVER_INFO_1530;
   type SERVER_INFO_1533;
   type SERVER_INFO_1534;
   type SERVER_INFO_1535;
   type SERVER_INFO_1536;
   type SERVER_INFO_1537;
   type SERVER_INFO_1538;
   type SERVER_INFO_1539;
   type SERVER_INFO_1540;
   type SERVER_INFO_1541;
   type SERVER_INFO_1542;
   type SERVER_INFO_1543;
   type SERVER_INFO_1544;
   type SERVER_INFO_1545;
   type SERVER_INFO_1546;
   type SERVER_INFO_1547;
   type SERVER_INFO_1548;
   type SERVER_INFO_1549;
   type SERVER_INFO_1550;
   type SERVER_INFO_1552;
   type SERVER_INFO_1553;
   type SERVER_INFO_1554;
   type SERVER_INFO_1555;
   type SERVER_INFO_1556;
   type SERVER_INFO_1557;
   type SERVER_INFO_1558;
   type SERVER_INFO_1559;
   type SERVER_INFO_1560;
   type SERVER_INFO_1561;
   type SERVER_INFO_1562;
   type SERVER_INFO_1563;
   type SERVER_INFO_1564;
   type SERVER_INFO_1565;
   type SERVER_INFO_1566;
   type SERVER_INFO_1567;
   type SERVER_INFO_1568;
   type SERVER_INFO_1569;
   type SERVER_INFO_1570;
   type SERVER_INFO_1571;
   type SERVER_INFO_1572;
   type SERVER_INFO_1573;
   type SERVER_INFO_1574;
   type SERVER_TRANSPORT_INFO_0;

   type PSERVER_INFO_100 is access all SERVER_INFO_100;
   subtype LPSERVER_INFO_100 is PSERVER_INFO_100;
   type PSERVER_INFO_101 is access all SERVER_INFO_101;
   subtype LPSERVER_INFO_101 is PSERVER_INFO_101;
   type PSERVER_INFO_102 is access all SERVER_INFO_102;
   subtype LPSERVER_INFO_102 is PSERVER_INFO_102;
   type PSERVER_INFO_402 is access all SERVER_INFO_402;
   subtype LPSERVER_INFO_402 is PSERVER_INFO_402;
   type PSERVER_INFO_403 is access all SERVER_INFO_403;
   subtype LPSERVER_INFO_403 is PSERVER_INFO_403;
   type PSERVER_INFO_502 is access all SERVER_INFO_502;
   subtype LPSERVER_INFO_502 is PSERVER_INFO_502;
   type PSERVER_INFO_503 is access all SERVER_INFO_503;
   subtype LPSERVER_INFO_503 is PSERVER_INFO_503;
   type PSERVER_INFO_599 is access all SERVER_INFO_599;
   subtype LPSERVER_INFO_599 is PSERVER_INFO_599;
   type PSERVER_INFO_598 is access all SERVER_INFO_598;
   subtype LPSERVER_INFO_598 is PSERVER_INFO_598;
   type PSERVER_INFO_1005 is access all SERVER_INFO_1005;
   subtype LPSERVER_INFO_1005 is PSERVER_INFO_1005;
   type PSERVER_INFO_1107 is access all SERVER_INFO_1107;
   subtype LPSERVER_INFO_1107 is PSERVER_INFO_1107;
   type PSERVER_INFO_1010 is access all SERVER_INFO_1010;
   subtype LPSERVER_INFO_1010 is PSERVER_INFO_1010;
   type PSERVER_INFO_1016 is access all SERVER_INFO_1016;
   subtype LPSERVER_INFO_1016 is PSERVER_INFO_1016;
   type PSERVER_INFO_1017 is access all SERVER_INFO_1017;
   subtype LPSERVER_INFO_1017 is PSERVER_INFO_1017;
   type PSERVER_INFO_1018 is access all SERVER_INFO_1018;
   subtype LPSERVER_INFO_1018 is PSERVER_INFO_1018;
   type PSERVER_INFO_1501 is access all SERVER_INFO_1501;
   subtype LPSERVER_INFO_1501 is PSERVER_INFO_1501;
   type PSERVER_INFO_1502 is access all SERVER_INFO_1502;
   subtype LPSERVER_INFO_1502 is PSERVER_INFO_1502;
   type PSERVER_INFO_1503 is access all SERVER_INFO_1503;
   subtype LPSERVER_INFO_1503 is PSERVER_INFO_1503;
   type PSERVER_INFO_1506 is access all SERVER_INFO_1506;
   subtype LPSERVER_INFO_1506 is PSERVER_INFO_1506;
   type PSERVER_INFO_1509 is access all SERVER_INFO_1509;
   subtype LPSERVER_INFO_1509 is PSERVER_INFO_1509;
   type PSERVER_INFO_1510 is access all SERVER_INFO_1510;
   subtype LPSERVER_INFO_1510 is PSERVER_INFO_1510;
   type PSERVER_INFO_1511 is access all SERVER_INFO_1511;
   subtype LPSERVER_INFO_1511 is PSERVER_INFO_1511;
   type PSERVER_INFO_1512 is access all SERVER_INFO_1512;
   subtype LPSERVER_INFO_1512 is PSERVER_INFO_1512;
   type PSERVER_INFO_1513 is access all SERVER_INFO_1513;
   subtype LPSERVER_INFO_1513 is PSERVER_INFO_1513;
   type PSERVER_INFO_1514 is access all SERVER_INFO_1514;
   subtype LPSERVER_INFO_1514 is PSERVER_INFO_1514;
   type PSERVER_INFO_1515 is access all SERVER_INFO_1515;
   subtype LPSERVER_INFO_1515 is PSERVER_INFO_1515;
   type PSERVER_INFO_1516 is access all SERVER_INFO_1516;
   subtype LPSERVER_INFO_1516 is PSERVER_INFO_1516;
   type PSERVER_INFO_1518 is access all SERVER_INFO_1518;
   subtype LPSERVER_INFO_1518 is PSERVER_INFO_1518;
   type PSERVER_INFO_1520 is access all SERVER_INFO_1520;
   subtype LPSERVER_INFO_1520 is PSERVER_INFO_1520;
   type PSERVER_INFO_1521 is access all SERVER_INFO_1521;
   subtype LPSERVER_INFO_1521 is PSERVER_INFO_1521;
   type PSERVER_INFO_1522 is access all SERVER_INFO_1522;
   subtype LPSERVER_INFO_1522 is PSERVER_INFO_1522;
   type PSERVER_INFO_1523 is access all SERVER_INFO_1523;
   subtype LPSERVER_INFO_1523 is PSERVER_INFO_1523;
   type PSERVER_INFO_1524 is access all SERVER_INFO_1524;
   subtype LPSERVER_INFO_1524 is PSERVER_INFO_1524;
   type PSERVER_INFO_1525 is access all SERVER_INFO_1525;
   subtype LPSERVER_INFO_1525 is PSERVER_INFO_1525;
   type PSERVER_INFO_1528 is access all SERVER_INFO_1528;
   subtype LPSERVER_INFO_1528 is PSERVER_INFO_1528;
   type PSERVER_INFO_1529 is access all SERVER_INFO_1529;
   subtype LPSERVER_INFO_1529 is PSERVER_INFO_1529;
   type PSERVER_INFO_1530 is access all SERVER_INFO_1530;
   subtype LPSERVER_INFO_1530 is PSERVER_INFO_1530;
   type PSERVER_INFO_1533 is access all SERVER_INFO_1533;
   subtype LPSERVER_INFO_1533 is PSERVER_INFO_1533;
   type PSERVER_INFO_1534 is access all SERVER_INFO_1534;
   subtype LPSERVER_INFO_1534 is PSERVER_INFO_1534;
   type PSERVER_INFO_1535 is access all SERVER_INFO_1535;
   subtype LPSERVER_INFO_1535 is PSERVER_INFO_1535;
   type PSERVER_INFO_1536 is access all SERVER_INFO_1536;
   subtype LPSERVER_INFO_1536 is PSERVER_INFO_1536;
   type PSERVER_INFO_1537 is access all SERVER_INFO_1537;
   subtype LPSERVER_INFO_1537 is PSERVER_INFO_1537;
   type PSERVER_INFO_1538 is access all SERVER_INFO_1538;
   subtype LPSERVER_INFO_1538 is PSERVER_INFO_1538;
   type PSERVER_INFO_1539 is access all SERVER_INFO_1539;
   subtype LPSERVER_INFO_1539 is PSERVER_INFO_1539;
   type PSERVER_INFO_1540 is access all SERVER_INFO_1540;
   subtype LPSERVER_INFO_1540 is PSERVER_INFO_1540;
   type PSERVER_INFO_1541 is access all SERVER_INFO_1541;
   subtype LPSERVER_INFO_1541 is PSERVER_INFO_1541;
   type PSERVER_INFO_1542 is access all SERVER_INFO_1542;
   subtype LPSERVER_INFO_1542 is PSERVER_INFO_1542;
   type PSERVER_INFO_1543 is access all SERVER_INFO_1543;
   subtype LPSERVER_INFO_1543 is PSERVER_INFO_1543;
   type PSERVER_INFO_1544 is access all SERVER_INFO_1544;
   subtype LPSERVER_INFO_1544 is PSERVER_INFO_1544;
   type PSERVER_INFO_1545 is access all SERVER_INFO_1545;
   subtype LPSERVER_INFO_1545 is PSERVER_INFO_1545;
   type PSERVER_INFO_1546 is access all SERVER_INFO_1546;
   subtype LPSERVER_INFO_1546 is PSERVER_INFO_1546;
   type PSERVER_INFO_1547 is access all SERVER_INFO_1547;
   subtype LPSERVER_INFO_1547 is PSERVER_INFO_1547;
   type PSERVER_INFO_1548 is access all SERVER_INFO_1548;
   subtype LPSERVER_INFO_1548 is PSERVER_INFO_1548;
   type PSERVER_INFO_1549 is access all SERVER_INFO_1549;
   subtype LPSERVER_INFO_1549 is PSERVER_INFO_1549;
   type PSERVER_INFO_1550 is access all SERVER_INFO_1550;
   subtype LPSERVER_INFO_1550 is PSERVER_INFO_1550;
   type PSERVER_INFO_1552 is access all SERVER_INFO_1552;
   subtype LPSERVER_INFO_1552 is PSERVER_INFO_1552;
   type PSERVER_INFO_1553 is access all SERVER_INFO_1553;
   subtype LPSERVER_INFO_1553 is PSERVER_INFO_1553;
   type PSERVER_INFO_1554 is access all SERVER_INFO_1554;
   subtype LPSERVER_INFO_1554 is PSERVER_INFO_1554;
   type PSERVER_INFO_1555 is access all SERVER_INFO_1555;
   subtype LPSERVER_INFO_1555 is PSERVER_INFO_1555;
   type PSERVER_INFO_1556 is access all SERVER_INFO_1556;
   subtype LPSERVER_INFO_1556 is PSERVER_INFO_1556;
   type PSERVER_INFO_1557 is access all SERVER_INFO_1557;
   subtype LPSERVER_INFO_1557 is PSERVER_INFO_1557;
   type PSERVER_INFO_1558 is access all SERVER_INFO_1558;
   subtype LPSERVER_INFO_1558 is PSERVER_INFO_1558;
   type PSERVER_INFO_1559 is access all SERVER_INFO_1559;
   subtype LPSERVER_INFO_1559 is PSERVER_INFO_1559;
   type PSERVER_INFO_1560 is access all SERVER_INFO_1560;
   subtype LPSERVER_INFO_1560 is PSERVER_INFO_1560;
   type PSERVER_INFO_1561 is access all SERVER_INFO_1561;
   subtype LPSERVER_INFO_1561 is PSERVER_INFO_1561;
   type PSERVER_INFO_1562 is access all SERVER_INFO_1562;
   subtype LPSERVER_INFO_1562 is PSERVER_INFO_1562;
   type PSERVER_INFO_1563 is access all SERVER_INFO_1563;
   subtype LPSERVER_INFO_1563 is PSERVER_INFO_1563;
   type PSERVER_INFO_1564 is access all SERVER_INFO_1564;
   subtype LPSERVER_INFO_1564 is PSERVER_INFO_1564;
   type PSERVER_INFO_1565 is access all SERVER_INFO_1565;
   subtype LPSERVER_INFO_1565 is PSERVER_INFO_1565;
   type PSERVER_INFO_1566 is access all SERVER_INFO_1566;
   subtype LPSERVER_INFO_1566 is PSERVER_INFO_1566;
   type PSERVER_INFO_1567 is access all SERVER_INFO_1567;
   subtype LPSERVER_INFO_1567 is PSERVER_INFO_1567;
   type PSERVER_INFO_1568 is access all SERVER_INFO_1568;
   subtype LPSERVER_INFO_1568 is PSERVER_INFO_1568;
   type PSERVER_INFO_1569 is access all SERVER_INFO_1569;
   subtype LPSERVER_INFO_1569 is PSERVER_INFO_1569;
   type PSERVER_INFO_1570 is access all SERVER_INFO_1570;
   subtype LPSERVER_INFO_1570 is PSERVER_INFO_1570;
   type PSERVER_INFO_1571 is access all SERVER_INFO_1571;
   subtype LPSERVER_INFO_1571 is PSERVER_INFO_1571;
   type PSERVER_INFO_1572 is access all SERVER_INFO_1572;
   subtype LPSERVER_INFO_1572 is PSERVER_INFO_1572;
   type PSERVER_INFO_1573 is access all SERVER_INFO_1573;
   subtype LPSERVER_INFO_1573 is PSERVER_INFO_1573;
   type PSERVER_INFO_1574 is access all SERVER_INFO_1574;
   subtype LPSERVER_INFO_1574 is PSERVER_INFO_1574;
   type PSERVER_TRANSPORT_INFO_0 is access all SERVER_TRANSPORT_INFO_0;
   subtype LPSERVER_TRANSPORT_INFO_0 is PSERVER_TRANSPORT_INFO_0;

   type SERVER_INFO_100 is record
      sv100_platform_id : Win32.DWORD;
      sv100_name        : Win32.Winnt.LPTSTR;
   end record;

   type SERVER_INFO_101 is record
      sv101_platform_id   : Win32.DWORD;
      sv101_name          : Win32.Winnt.LPTSTR;
      sv101_version_major : Win32.DWORD;
      sv101_version_minor : Win32.DWORD;
      sv101_type          : Win32.DWORD;
      sv101_comment       : Win32.Winnt.LPTSTR;
   end record;

   type SERVER_INFO_102 is record
      sv102_platform_id   : Win32.DWORD;
      sv102_name          : Win32.Winnt.LPTSTR;
      sv102_version_major : Win32.DWORD;
      sv102_version_minor : Win32.DWORD;
      sv102_type          : Win32.DWORD;
      sv102_comment       : Win32.Winnt.LPTSTR;
      sv102_users         : Win32.DWORD;
      sv102_disc          : Win32.LONG;
      sv102_hidden        : Win32.BOOL;
      sv102_announce      : Win32.DWORD;
      sv102_anndelta      : Win32.DWORD;
      sv102_licenses      : Win32.DWORD;
      sv102_userpath      : Win32.Winnt.LPTSTR;
   end record;

   type SERVER_INFO_402 is record
      sv402_ulist_mtime   : Win32.DWORD;
      sv402_glist_mtime   : Win32.DWORD;
      sv402_alist_mtime   : Win32.DWORD;
      sv402_alerts        : Win32.Winnt.LPTSTR;
      sv402_security      : Win32.DWORD;
      sv402_numadmin      : Win32.DWORD;
      sv402_lanmask       : Win32.DWORD;
      sv402_guestacct     : Win32.Winnt.LPTSTR;
      sv402_chdevs        : Win32.DWORD;
      sv402_chdevq        : Win32.DWORD;
      sv402_chdevjobs     : Win32.DWORD;
      sv402_connections   : Win32.DWORD;
      sv402_shares        : Win32.DWORD;
      sv402_openfiles     : Win32.DWORD;
      sv402_sessopens     : Win32.DWORD;
      sv402_sessvcs       : Win32.DWORD;
      sv402_sessreqs      : Win32.DWORD;
      sv402_opensearch    : Win32.DWORD;
      sv402_activelocks   : Win32.DWORD;
      sv402_numreqbuf     : Win32.DWORD;
      sv402_sizreqbuf     : Win32.DWORD;
      sv402_numbigbuf     : Win32.DWORD;
      sv402_numfiletasks  : Win32.DWORD;
      sv402_alertsched    : Win32.DWORD;
      sv402_erroralert    : Win32.DWORD;
      sv402_logonalert    : Win32.DWORD;
      sv402_accessalert   : Win32.DWORD;
      sv402_diskalert     : Win32.DWORD;
      sv402_netioalert    : Win32.DWORD;
      sv402_maxauditsz    : Win32.DWORD;
      sv402_srvheuristics : Win32.Winnt.LPTSTR;
   end record;

   type SERVER_INFO_403 is record
      sv403_ulist_mtime   : Win32.DWORD;
      sv403_glist_mtime   : Win32.DWORD;
      sv403_alist_mtime   : Win32.DWORD;
      sv403_alerts        : Win32.Winnt.LPTSTR;
      sv403_security      : Win32.DWORD;
      sv403_numadmin      : Win32.DWORD;
      sv403_lanmask       : Win32.DWORD;
      sv403_guestacct     : Win32.Winnt.LPTSTR;
      sv403_chdevs        : Win32.DWORD;
      sv403_chdevq        : Win32.DWORD;
      sv403_chdevjobs     : Win32.DWORD;
      sv403_connections   : Win32.DWORD;
      sv403_shares        : Win32.DWORD;
      sv403_openfiles     : Win32.DWORD;
      sv403_sessopens     : Win32.DWORD;
      sv403_sessvcs       : Win32.DWORD;
      sv403_sessreqs      : Win32.DWORD;
      sv403_opensearch    : Win32.DWORD;
      sv403_activelocks   : Win32.DWORD;
      sv403_numreqbuf     : Win32.DWORD;
      sv403_sizreqbuf     : Win32.DWORD;
      sv403_numbigbuf     : Win32.DWORD;
      sv403_numfiletasks  : Win32.DWORD;
      sv403_alertsched    : Win32.DWORD;
      sv403_erroralert    : Win32.DWORD;
      sv403_logonalert    : Win32.DWORD;
      sv403_accessalert   : Win32.DWORD;
      sv403_diskalert     : Win32.DWORD;
      sv403_netioalert    : Win32.DWORD;
      sv403_maxauditsz    : Win32.DWORD;
      sv403_srvheuristics : Win32.Winnt.LPTSTR;
      sv403_auditedevents : Win32.DWORD;
      sv403_autoprofile   : Win32.DWORD;
      sv403_autopath      : Win32.Winnt.LPTSTR;
   end record;

   type SERVER_INFO_502 is record
      sv502_sessopens              : Win32.DWORD;
      sv502_sessvcs                : Win32.DWORD;
      sv502_opensearch             : Win32.DWORD;
      sv502_sizreqbuf              : Win32.DWORD;
      sv502_initworkitems          : Win32.DWORD;
      sv502_maxworkitems           : Win32.DWORD;
      sv502_rawworkitems           : Win32.DWORD;
      sv502_irpstacksize           : Win32.DWORD;
      sv502_maxrawbuflen           : Win32.DWORD;
      sv502_sessusers              : Win32.DWORD;
      sv502_sessconns              : Win32.DWORD;
      sv502_maxpagedmemoryusage    : Win32.DWORD;
      sv502_maxnonpagedmemoryusage : Win32.DWORD;
      sv502_enablesoftcompat       : Win32.BOOL;
      sv502_enableforcedlogoff     : Win32.BOOL;
      sv502_timesource             : Win32.BOOL;
      sv502_acceptdownlevelapis    : Win32.BOOL;
      sv502_lmannounce             : Win32.BOOL;
   end record;

   type SERVER_INFO_503 is record
      sv503_sessopens               : Win32.DWORD;
      sv503_sessvcs                 : Win32.DWORD;
      sv503_opensearch              : Win32.DWORD;
      sv503_sizreqbuf               : Win32.DWORD;
      sv503_initworkitems           : Win32.DWORD;
      sv503_maxworkitems            : Win32.DWORD;
      sv503_rawworkitems            : Win32.DWORD;
      sv503_irpstacksize            : Win32.DWORD;
      sv503_maxrawbuflen            : Win32.DWORD;
      sv503_sessusers               : Win32.DWORD;
      sv503_sessconns               : Win32.DWORD;
      sv503_maxpagedmemoryusage     : Win32.DWORD;
      sv503_maxnonpagedmemoryusage  : Win32.DWORD;
      sv503_enablesoftcompat        : Win32.BOOL;
      sv503_enableforcedlogoff      : Win32.BOOL;
      sv503_timesource              : Win32.BOOL;
      sv503_acceptdownlevelapis     : Win32.BOOL;
      sv503_lmannounce              : Win32.BOOL;
      sv503_domain                  : Win32.Winnt.LPTSTR;
      sv503_maxcopyreadlen          : Win32.DWORD;
      sv503_maxcopywritelen         : Win32.DWORD;
      sv503_minkeepsearch           : Win32.DWORD;
      sv503_maxkeepsearch           : Win32.DWORD;
      sv503_minkeepcomplsearch      : Win32.DWORD;
      sv503_maxkeepcomplsearch      : Win32.DWORD;
      sv503_threadcountadd          : Win32.DWORD;
      sv503_numblockthreads         : Win32.DWORD;
      sv503_scavtimeout             : Win32.DWORD;
      sv503_minrcvqueue             : Win32.DWORD;
      sv503_minfreeworkitems        : Win32.DWORD;
      sv503_xactmemsize             : Win32.DWORD;
      sv503_threadpriority          : Win32.DWORD;
      sv503_maxmpxct                : Win32.DWORD;
      sv503_oplockbreakwait         : Win32.DWORD;
      sv503_oplockbreakresponsewait : Win32.DWORD;
      sv503_enableoplocks           : Win32.BOOL;
      sv503_enableoplockforceclose  : Win32.BOOL;
      sv503_enablefcbopens          : Win32.BOOL;
      sv503_enableraw               : Win32.BOOL;
      sv503_enablesharednetdrives   : Win32.BOOL;
      sv503_minfreeconnections      : Win32.DWORD;
      sv503_maxfreeconnections      : Win32.DWORD;
   end record;

   type SERVER_INFO_599 is record
      sv599_sessopens               : Win32.DWORD;
      sv599_sessvcs                 : Win32.DWORD;
      sv599_opensearch              : Win32.DWORD;
      sv599_sizreqbuf               : Win32.DWORD;
      sv599_initworkitems           : Win32.DWORD;
      sv599_maxworkitems            : Win32.DWORD;
      sv599_rawworkitems            : Win32.DWORD;
      sv599_irpstacksize            : Win32.DWORD;
      sv599_maxrawbuflen            : Win32.DWORD;
      sv599_sessusers               : Win32.DWORD;
      sv599_sessconns               : Win32.DWORD;
      sv599_maxpagedmemoryusage     : Win32.DWORD;
      sv599_maxnonpagedmemoryusage  : Win32.DWORD;
      sv599_enablesoftcompat        : Win32.BOOL;
      sv599_enableforcedlogoff      : Win32.BOOL;
      sv599_timesource              : Win32.BOOL;
      sv599_acceptdownlevelapis     : Win32.BOOL;
      sv599_lmannounce              : Win32.BOOL;
      sv599_domain                  : Win32.Winnt.LPTSTR;
      sv599_maxcopyreadlen          : Win32.DWORD;
      sv599_maxcopywritelen         : Win32.DWORD;
      sv599_minkeepsearch           : Win32.DWORD;
      sv599_maxkeepsearch           : Win32.DWORD;
      sv599_minkeepcomplsearch      : Win32.DWORD;
      sv599_maxkeepcomplsearch      : Win32.DWORD;
      sv599_threadcountadd          : Win32.DWORD;
      sv599_numblockthreads         : Win32.DWORD;
      sv599_scavtimeout             : Win32.DWORD;
      sv599_minrcvqueue             : Win32.DWORD;
      sv599_minfreeworkitems        : Win32.DWORD;
      sv599_xactmemsize             : Win32.DWORD;
      sv599_threadpriority          : Win32.DWORD;
      sv599_maxmpxct                : Win32.DWORD;
      sv599_oplockbreakwait         : Win32.DWORD;
      sv599_oplockbreakresponsewait : Win32.DWORD;
      sv599_enableoplocks           : Win32.BOOL;
      sv599_enableoplockforceclose  : Win32.BOOL;
      sv599_enablefcbopens          : Win32.BOOL;
      sv599_enableraw               : Win32.BOOL;
      sv599_enablesharednetdrives   : Win32.BOOL;
      sv599_minfreeconnections      : Win32.DWORD;
      sv599_maxfreeconnections      : Win32.DWORD;
      sv599_initsesstable           : Win32.DWORD;
      sv599_initconntable           : Win32.DWORD;
      sv599_initfiletable           : Win32.DWORD;
      sv599_initsearchtable         : Win32.DWORD;
      sv599_alertschedule           : Win32.DWORD;
      sv599_errorthreshold          : Win32.DWORD;
      sv599_networkerrorthreshold   : Win32.DWORD;
      sv599_diskspacethreshold      : Win32.DWORD;
      sv599_diskconfiguration       : Win32.DWORD;
      sv599_maxlinkdelay            : Win32.DWORD;
      sv599_minlinkthroughput       : Win32.DWORD;
      sv599_linkinfovalidtime       : Win32.DWORD;
      sv599_scavqosinfoupdatetime   : Win32.DWORD;
      sv599_maxworkitemidletime     : Win32.DWORD;
   end record;

   type SERVER_INFO_598 is record
      sv598_maxrawworkitems         : Win32.DWORD;
      sv598_nonblockingthreads      : Win32.DWORD;
      sv598_blockingthreads         : Win32.DWORD;
      sv598_producttype             : Win32.DWORD;
      sv598_serversize              : Win32.DWORD;
      sv598_connectionlessautodisc  : Win32.DWORD;
      sv598_sharingviolationretries : Win32.DWORD;
      sv598_sharingviolationdelay   : Win32.DWORD;
      sv598_maxglobalopensearch     : Win32.DWORD;
      sv598_removeduplicatesearches : Win32.DWORD;
      sv598_lockviolationoffset     : Win32.DWORD;
      sv598_lockviolationdelay      : Win32.DWORD;
      sv598_mdlreadswitchover       : Win32.DWORD;
      sv598_cachedopenlimit         : Win32.DWORD;
      sv598_criticalthreads         : Win32.DWORD;
      sv598_restrictnullsessaccess  : Win32.BOOL;
      sv598_enablewfw311directipx   : Win32.BOOL;
      sv598_reserved8               : Win32.DWORD;
      sv598_reserved9               : Win32.DWORD;
      sv598_reserved10              : Win32.DWORD;
   end record;

   type SERVER_INFO_1005 is record
      sv1005_comment : Win32.Winnt.LPTSTR;
   end record;

   type SERVER_INFO_1107 is record
      sv1107_users : Win32.DWORD;
   end record;

   type SERVER_INFO_1010 is record
      sv1010_disc : Win32.LONG;
   end record;

   type SERVER_INFO_1016 is record
      sv1016_hidden : Win32.BOOL;
   end record;

   type SERVER_INFO_1017 is record
      sv1017_announce : Win32.DWORD;
   end record;

   type SERVER_INFO_1018 is record
      sv1018_anndelta : Win32.DWORD;
   end record;

   type SERVER_INFO_1501 is record
      sv1501_sessopens : Win32.DWORD;
   end record;

   type SERVER_INFO_1502 is record
      sv1502_sessvcs : Win32.DWORD;
   end record;

   type SERVER_INFO_1503 is record
      sv1503_opensearch : Win32.DWORD;
   end record;

   type SERVER_INFO_1506 is record
      sv1506_maxworkitems : Win32.DWORD;
   end record;

   type SERVER_INFO_1509 is record
      sv1509_maxrawbuflen : Win32.DWORD;
   end record;

   type SERVER_INFO_1510 is record
      sv1510_sessusers : Win32.DWORD;
   end record;

   type SERVER_INFO_1511 is record
      sv1511_sessconns : Win32.DWORD;
   end record;

   type SERVER_INFO_1512 is record
      sv1512_maxnonpagedmemoryusage : Win32.DWORD;
   end record;

   type SERVER_INFO_1513 is record
      sv1513_maxpagedmemoryusage : Win32.DWORD;
   end record;

   type SERVER_INFO_1514 is record
      sv1514_enablesoftcompat : Win32.BOOL;
   end record;

   type SERVER_INFO_1515 is record
      sv1515_enableforcedlogoff : Win32.BOOL;
   end record;

   type SERVER_INFO_1516 is record
      sv1516_timesource : Win32.BOOL;
   end record;

   type SERVER_INFO_1518 is record
      sv1518_lmannounce : Win32.BOOL;
   end record;

   type SERVER_INFO_1520 is record
      sv1520_maxcopyreadlen : Win32.DWORD;
   end record;

   type SERVER_INFO_1521 is record
      sv1521_maxcopywritelen : Win32.DWORD;
   end record;

   type SERVER_INFO_1522 is record
      sv1522_minkeepsearch : Win32.DWORD;
   end record;

   type SERVER_INFO_1523 is record
      sv1523_maxkeepsearch : Win32.DWORD;
   end record;

   type SERVER_INFO_1524 is record
      sv1524_minkeepcomplsearch : Win32.DWORD;
   end record;

   type SERVER_INFO_1525 is record
      sv1525_maxkeepcomplsearch : Win32.DWORD;
   end record;

   type SERVER_INFO_1528 is record
      sv1528_scavtimeout : Win32.DWORD;
   end record;

   type SERVER_INFO_1529 is record
      sv1529_minrcvqueue : Win32.DWORD;
   end record;

   type SERVER_INFO_1530 is record
      sv1530_minfreeworkitems : Win32.DWORD;
   end record;

   type SERVER_INFO_1533 is record
      sv1533_maxmpxct : Win32.DWORD;
   end record;

   type SERVER_INFO_1534 is record
      sv1534_oplockbreakwait : Win32.DWORD;
   end record;

   type SERVER_INFO_1535 is record
      sv1535_oplockbreakresponsewait : Win32.DWORD;
   end record;

   type SERVER_INFO_1536 is record
      sv1536_enableoplocks : Win32.BOOL;
   end record;

   type SERVER_INFO_1537 is record
      sv1537_enableoplockforceclose : Win32.BOOL;
   end record;

   type SERVER_INFO_1538 is record
      sv1538_enablefcbopens : Win32.BOOL;
   end record;

   type SERVER_INFO_1539 is record
      sv1539_enableraw : Win32.BOOL;
   end record;

   type SERVER_INFO_1540 is record
      sv1540_enablesharednetdrives : Win32.BOOL;
   end record;

   type SERVER_INFO_1541 is record
      sv1541_minfreeconnections : Win32.BOOL;
   end record;

   type SERVER_INFO_1542 is record
      sv1542_maxfreeconnections : Win32.BOOL;
   end record;

   type SERVER_INFO_1543 is record
      sv1543_initsesstable : Win32.DWORD;
   end record;

   type SERVER_INFO_1544 is record
      sv1544_initconntable : Win32.DWORD;
   end record;

   type SERVER_INFO_1545 is record
      sv1545_initfiletable : Win32.DWORD;
   end record;

   type SERVER_INFO_1546 is record
      sv1546_initsearchtable : Win32.DWORD;
   end record;

   type SERVER_INFO_1547 is record
      sv1547_alertschedule : Win32.DWORD;
   end record;

   type SERVER_INFO_1548 is record
      sv1548_errorthreshold : Win32.DWORD;
   end record;

   type SERVER_INFO_1549 is record
      sv1549_networkerrorthreshold : Win32.DWORD;
   end record;

   type SERVER_INFO_1550 is record
      sv1550_diskspacethreshold : Win32.DWORD;
   end record;

   type SERVER_INFO_1552 is record
      sv1552_maxlinkdelay : Win32.DWORD;
   end record;

   type SERVER_INFO_1553 is record
      sv1553_minlinkthroughput : Win32.DWORD;
   end record;

   type SERVER_INFO_1554 is record
      sv1554_linkinfovalidtime : Win32.DWORD;
   end record;

   type SERVER_INFO_1555 is record
      sv1555_scavqosinfoupdatetime : Win32.DWORD;
   end record;

   type SERVER_INFO_1556 is record
      sv1556_maxworkitemidletime : Win32.DWORD;
   end record;

   type SERVER_INFO_1557 is record
      sv1557_maxrawworkitems : Win32.DWORD;
   end record;

   type SERVER_INFO_1558 is record
      sv1558_nonblockingthreads : Win32.DWORD;
   end record;

   type SERVER_INFO_1559 is record
      sv1559_blockingthreads : Win32.DWORD;
   end record;

   type SERVER_INFO_1560 is record
      sv1560_producttype : Win32.DWORD;
   end record;

   type SERVER_INFO_1561 is record
      sv1561_serversize : Win32.DWORD;
   end record;

   type SERVER_INFO_1562 is record
      sv1562_connectionlessautodisc : Win32.DWORD;
   end record;

   type SERVER_INFO_1563 is record
      sv1563_sharingviolationretries : Win32.DWORD;
   end record;

   type SERVER_INFO_1564 is record
      sv1564_sharingviolationdelay : Win32.DWORD;
   end record;

   type SERVER_INFO_1565 is record
      sv1565_maxglobalopensearch : Win32.DWORD;
   end record;

   type SERVER_INFO_1566 is record
      sv1566_removeduplicatesearches : Win32.BOOL;
   end record;

   type SERVER_INFO_1567 is record
      sv1567_lockviolationretries : Win32.DWORD;
   end record;

   type SERVER_INFO_1568 is record
      sv1568_lockviolationoffset : Win32.DWORD;
   end record;

   type SERVER_INFO_1569 is record
      sv1569_lockviolationdelay : Win32.DWORD;
   end record;

   type SERVER_INFO_1570 is record
      sv1570_mdlreadswitchover : Win32.DWORD;
   end record;

   type SERVER_INFO_1571 is record
      sv1571_cachedopenlimit : Win32.DWORD;
   end record;

   type SERVER_INFO_1572 is record
      sv1572_criticalthreads : Win32.DWORD;
   end record;

   type SERVER_INFO_1573 is record
      sv1573_restrictnullsessaccess : Win32.DWORD;
   end record;

   type SERVER_INFO_1574 is record
      sv1574_enablewfw311directipx : Win32.DWORD;
   end record;

   type SERVER_TRANSPORT_INFO_0 is record
      svti0_numberofvcs            : Win32.DWORD;
      svti0_transportname          : Win32.Winnt.LPTSTR;
      svti0_transportaddress       : Win32.LPBYTE;
      svti0_transportaddresslength : Win32.DWORD;
      svti0_networkaddress         : Win32.Winnt.LPTSTR;
   end record;

   function NetServerEnum
     (servername    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      servertype    : Win32.DWORD;
      domain        : Win32.Winnt.LPTSTR;
      resume_handle : Win32.LPDWORD)
      return          Win32.DWORD;

   function NetServerGetInfo
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return       Win32.DWORD;

   function NetServerSetInfo
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      ParmError  : Win32.LPDWORD)
      return       Win32.DWORD;

   function NetServerSetInfoCommandLine
     (argc : Win32.WORD;
      argv : Win32.String_Vector_Access)
      return Win32.DWORD;

   function NetServerDiskEnum
     (servername    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return          Win32.DWORD;

   function NetServerTransportAdd
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : Win32.LPBYTE)
      return       Win32.DWORD;

   function NetServerTransportDel
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : Win32.LPBYTE)
      return       Win32.DWORD;

   function NetServerTransportEnum
     (servername   : Win32.Winnt.LPTSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.PBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
      return         Win32.DWORD;

   function SetServiceBits
     (hServiceStatus     : Win32.Winsvc.SERVICE_STATUS_HANDLE;
      dwServiceBits      : Win32.DWORD;
      bSetBitsOn         : Win32.BOOL;
      bUpdateImmediately : Win32.BOOL)
      return               Win32.BOOL;

private

   pragma Convention (C_Pass_By_Copy, SERVER_INFO_100);
   pragma Convention (C, SERVER_INFO_101);
   pragma Convention (C, SERVER_INFO_102);
   pragma Convention (C, SERVER_INFO_402);
   pragma Convention (C, SERVER_INFO_403);
   pragma Convention (C, SERVER_INFO_502);
   pragma Convention (C, SERVER_INFO_503);
   pragma Convention (C, SERVER_INFO_599);
   pragma Convention (C, SERVER_INFO_598);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1005);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1107);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1010);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1016);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1017);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1018);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1501);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1502);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1503);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1506);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1509);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1510);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1511);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1512);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1513);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1514);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1515);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1516);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1518);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1520);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1521);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1522);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1523);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1524);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1525);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1528);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1529);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1530);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1533);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1534);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1535);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1536);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1537);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1538);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1539);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1540);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1541);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1542);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1543);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1544);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1545);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1546);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1547);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1548);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1549);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1550);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1552);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1553);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1554);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1555);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1556);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1557);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1558);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1559);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1560);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1561);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1562);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1563);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1564);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1565);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1566);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1567);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1568);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1569);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1570);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1571);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1572);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1573);
   pragma Convention (C_Pass_By_Copy, SERVER_INFO_1574);
   pragma Convention (C, SERVER_TRANSPORT_INFO_0);

   pragma Import (Stdcall, NetServerEnum, "NetServerEnum");
   pragma Import (Stdcall, NetServerGetInfo, "NetServerGetInfo");
   pragma Import (Stdcall, NetServerSetInfo, "NetServerSetInfo");
   pragma Import
     (Stdcall,
      NetServerSetInfoCommandLine,
      "NetServerSetInfoCommandLine");
   pragma Import (Stdcall, NetServerDiskEnum, "NetServerDiskEnum");
   pragma Import (Stdcall, NetServerTransportAdd, "NetServerTransportAdd");
   pragma Import (Stdcall, NetServerTransportDel, "NetServerTransportDel");
   pragma Import (Stdcall, NetServerTransportEnum, "NetServerTransportEnum");
   pragma Import (Stdcall, SetServiceBits, "SetServiceBits");

end Win32.Lmserver;
