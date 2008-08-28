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

with Win32.Winnt;
with Win32.Winsvc;

package Win32.Lmserver is

   SV_PLATFORM_ID_OS2 : constant := 400; --  lmserver.h:730
   SV_PLATFORM_ID_NT : constant := 500; --  lmserver.h:731
   MAJOR_VERSION_MASK : constant := 16#f#;
   --  lmserver.h:738
   SV_TYPE_WORKSTATION : constant := 16#1#;
   --  lmserver.h:744
   SV_TYPE_SERVER : constant := 16#2#;
   --  lmserver.h:745
   SV_TYPE_SQLSERVER : constant := 16#4#;
   --  lmserver.h:746
   SV_TYPE_DOMAIN_CTRL : constant := 16#8#;
   --  lmserver.h:747
   SV_TYPE_DOMAIN_BAKCTRL : constant := 16#10#;
   --  lmserver.h:748
   SV_TYPE_TIME_SOURCE : constant := 16#20#;
   --  lmserver.h:749
   SV_TYPE_AFP : constant := 16#40#;
   --  lmserver.h:750
   SV_TYPE_NOVELL : constant := 16#80#;
   --  lmserver.h:751
   SV_TYPE_DOMAIN_MEMBER : constant := 16#100#;
   --  lmserver.h:752
   SV_TYPE_PRINTQ_SERVER : constant := 16#200#;
   --  lmserver.h:753
   SV_TYPE_DIALIN_SERVER : constant := 16#400#;
   --  lmserver.h:754
   SV_TYPE_XENIX_SERVER : constant := 16#800#;
   --  lmserver.h:755
   SV_TYPE_SERVER_UNIX : constant := 16#800#;
   --  lmserver.h:756
   SV_TYPE_NT : constant := 16#1000#;
   --  lmserver.h:757
   SV_TYPE_WFW : constant := 16#2000#;
   --  lmserver.h:758
   SV_TYPE_SERVER_MFPN : constant := 16#4000#;
   --  lmserver.h:759
   SV_TYPE_SERVER_NT : constant := 16#8000#;
   --  lmserver.h:760
   SV_TYPE_POTENTIAL_BROWSER : constant := 16#10000#;
   --  lmserver.h:761
   SV_TYPE_BACKUP_BROWSER : constant := 16#20000#;
   --  lmserver.h:762
   SV_TYPE_MASTER_BROWSER : constant := 16#40000#;
   --  lmserver.h:763
   SV_TYPE_DOMAIN_MASTER : constant := 16#80000#;
   --  lmserver.h:764
   SV_TYPE_SERVER_OSF : constant := 16#100000#;
   --  lmserver.h:765
   SV_TYPE_SERVER_VMS : constant := 16#200000#;
   --  lmserver.h:766
   SV_TYPE_ALTERNATE_XPORT : constant := 16#20000000#;
   --  lmserver.h:767
   SV_TYPE_LOCAL_LIST_ONLY : constant := 16#40000000#;
   --  lmserver.h:768
   SV_TYPE_DOMAIN_ENUM : constant := 16#80000000#;
   --  lmserver.h:769
   SV_TYPE_ALL : constant := 16#ffffffff#;
   --  lmserver.h:770
   SV_NODISC : constant := -1;  --  lmserver.h:777
   SV_USERSECURITY : constant := 1;   --  lmserver.h:783
   SV_SHARESECURITY : constant := 0;   --  lmserver.h:784
   SV_HIDDEN : constant := 1;   --  lmserver.h:790
   SV_VISIBLE : constant := 0;   --  lmserver.h:791
   SV_PLATFORM_ID_PARMNUM : constant := 101; --  lmserver.h:797
   SV_NAME_PARMNUM : constant := 102; --  lmserver.h:798
   SV_VERSION_MAJOR_PARMNUM : constant := 103; --  lmserver.h:799
   SV_VERSION_MINOR_PARMNUM : constant := 104; --  lmserver.h:800
   SV_TYPE_PARMNUM : constant := 105; --  lmserver.h:801
   SV_COMMENT_PARMNUM : constant := 5;   --  lmserver.h:802
   SV_USERS_PARMNUM : constant := 107; --  lmserver.h:803
   SV_DISC_PARMNUM : constant := 10;  --  lmserver.h:804
   SV_HIDDEN_PARMNUM : constant := 16;  --  lmserver.h:805
   SV_ANNOUNCE_PARMNUM : constant := 17;  --  lmserver.h:806
   SV_ANNDELTA_PARMNUM : constant := 18;  --  lmserver.h:807
   SV_USERPATH_PARMNUM : constant := 112; --  lmserver.h:808
   SV_ULIST_MTIME_PARMNUM : constant := 401; --  lmserver.h:810
   SV_GLIST_MTIME_PARMNUM : constant := 402; --  lmserver.h:811
   SV_ALIST_MTIME_PARMNUM : constant := 403; --  lmserver.h:812
   SV_ALERTS_PARMNUM : constant := 11;  --  lmserver.h:813
   SV_SECURITY_PARMNUM : constant := 405; --  lmserver.h:814
   SV_NUMADMIN_PARMNUM : constant := 406; --  lmserver.h:815
   SV_LANMASK_PARMNUM : constant := 407; --  lmserver.h:816
   SV_GUESTACC_PARMNUM : constant := 408; --  lmserver.h:817
   SV_CHDEVQ_PARMNUM : constant := 410; --  lmserver.h:818
   SV_CHDEVJOBS_PARMNUM : constant := 411; --  lmserver.h:819
   SV_CONNECTIONS_PARMNUM : constant := 412; --  lmserver.h:820
   SV_SHARES_PARMNUM : constant := 413; --  lmserver.h:821
   SV_OPENFILES_PARMNUM : constant := 414; --  lmserver.h:822
   SV_SESSREQS_PARMNUM : constant := 417; --  lmserver.h:823
   SV_ACTIVELOCKS_PARMNUM : constant := 419; --  lmserver.h:824
   SV_NUMREQBUF_PARMNUM : constant := 420; --  lmserver.h:825
   SV_NUMBIGBUF_PARMNUM : constant := 422; --  lmserver.h:826
   SV_NUMFILETASKS_PARMNUM : constant := 423; --  lmserver.h:827
   SV_ALERTSCHED_PARMNUM : constant := 37;  --  lmserver.h:828
   SV_ERRORALERT_PARMNUM : constant := 38;  --  lmserver.h:829
   SV_LOGONALERT_PARMNUM : constant := 39;  --  lmserver.h:830
   SV_ACCESSALERT_PARMNUM : constant := 40;  --  lmserver.h:831
   SV_DISKALERT_PARMNUM : constant := 41;  --  lmserver.h:832
   SV_NETIOALERT_PARMNUM : constant := 42;  --  lmserver.h:833
   SV_MAXAUDITSZ_PARMNUM : constant := 43;  --  lmserver.h:834
   SV_SRVHEURISTICS_PARMNUM : constant := 431; --  lmserver.h:835
   SV_SESSOPENS_PARMNUM : constant := 501; --  lmserver.h:837
   SV_SESSVCS_PARMNUM : constant := 502; --  lmserver.h:838
   SV_OPENSEARCH_PARMNUM : constant := 503; --  lmserver.h:839
   SV_SIZREQBUF_PARMNUM : constant := 504; --  lmserver.h:840
   SV_INITWORKITEMS_PARMNUM : constant := 505; --  lmserver.h:841
   SV_MAXWORKITEMS_PARMNUM : constant := 506; --  lmserver.h:842
   SV_RAWWORKITEMS_PARMNUM : constant := 507; --  lmserver.h:843
   SV_IRPSTACKSIZE_PARMNUM : constant := 508; --  lmserver.h:844
   SV_MAXRAWBUFLEN_PARMNUM : constant := 509; --  lmserver.h:845
   SV_SESSUSERS_PARMNUM : constant := 510; --  lmserver.h:846
   SV_SESSCONNS_PARMNUM : constant := 511; --  lmserver.h:847
   SV_MAXNONPAGEDMEMORYUSAGE_PARMNUM : constant := 512; --  lmserver.h:848
   SV_MAXPAGEDMEMORYUSAGE_PARMNUM : constant := 513; --  lmserver.h:849
   SV_ENABLESOFTCOMPAT_PARMNUM : constant := 514; --  lmserver.h:850
   SV_ENABLEFORCEDLOGOFF_PARMNUM : constant := 515; --  lmserver.h:851
   SV_TIMESOURCE_PARMNUM : constant := 516; --  lmserver.h:852
   SV_ACCEPTDOWNLEVELAPIS_PARMNUM : constant := 517; --  lmserver.h:853
   SV_LMANNOUNCE_PARMNUM : constant := 518; --  lmserver.h:854
   SV_DOMAIN_PARMNUM : constant := 519; --  lmserver.h:855
   SV_MAXCOPYREADLEN_PARMNUM : constant := 520; --  lmserver.h:856
   SV_MAXCOPYWRITELEN_PARMNUM : constant := 521; --  lmserver.h:857
   SV_MINKEEPSEARCH_PARMNUM : constant := 522; --  lmserver.h:858
   SV_MAXKEEPSEARCH_PARMNUM : constant := 523; --  lmserver.h:859
   SV_MINKEEPCOMPLSEARCH_PARMNUM : constant := 524; --  lmserver.h:860
   SV_MAXKEEPCOMPLSEARCH_PARMNUM : constant := 525; --  lmserver.h:861
   SV_THREADCOUNTADD_PARMNUM : constant := 526; --  lmserver.h:862
   SV_NUMBLOCKTHREADS_PARMNUM : constant := 527; --  lmserver.h:863
   SV_SCAVTIMEOUT_PARMNUM : constant := 528; --  lmserver.h:864
   SV_MINRCVQUEUE_PARMNUM : constant := 529; --  lmserver.h:865
   SV_MINFREEWORKITEMS_PARMNUM : constant := 530; --  lmserver.h:866
   SV_XACTMEMSIZE_PARMNUM : constant := 531; --  lmserver.h:867
   SV_THREADPRIORITY_PARMNUM : constant := 532; --  lmserver.h:868
   SV_MAXMPXCT_PARMNUM : constant := 533; --  lmserver.h:869
   SV_OPLOCKBREAKWAIT_PARMNUM : constant := 534; --  lmserver.h:870
   SV_OPLOCKBREAKRESPONSEWAIT_PARMNUM : constant := 535; --  lmserver.h:871
   SV_ENABLEOPLOCKS_PARMNUM : constant := 536; --  lmserver.h:872
   SV_ENABLEOPLOCKFORCECLOSE_PARMNUM : constant := 537; --  lmserver.h:873
   SV_ENABLEFCBOPENS_PARMNUM : constant := 538; --  lmserver.h:874
   SV_ENABLERAW_PARMNUM : constant := 539; --  lmserver.h:875
   SV_ENABLESHAREDNETDRIVES_PARMNUM : constant := 540; --  lmserver.h:876
   SV_MINFREECONNECTIONS_PARMNUM : constant := 541; --  lmserver.h:877
   SV_MAXFREECONNECTIONS_PARMNUM : constant := 542; --  lmserver.h:878
   SV_INITSESSTABLE_PARMNUM : constant := 543; --  lmserver.h:879
   SV_INITCONNTABLE_PARMNUM : constant := 544; --  lmserver.h:880
   SV_INITFILETABLE_PARMNUM : constant := 545; --  lmserver.h:881
   SV_INITSEARCHTABLE_PARMNUM : constant := 546; --  lmserver.h:882
   SV_ALERTSCHEDULE_PARMNUM : constant := 547; --  lmserver.h:883
   SV_ERRORTHRESHOLD_PARMNUM : constant := 548; --  lmserver.h:884
   SV_NETWORKERRORTHRESHOLD_PARMNUM : constant := 549; --  lmserver.h:885
   SV_DISKSPACETHRESHOLD_PARMNUM : constant := 550; --  lmserver.h:886
   SV_DISKCONFIGURATION_PARMNUM : constant := 551; --  lmserver.h:887
   SV_MAXLINKDELAY_PARMNUM : constant := 552; --  lmserver.h:888
   SV_MINLINKTHROUGHPUT_PARMNUM : constant := 553; --  lmserver.h:889
   SV_LINKINFOVALIDTIME_PARMNUM : constant := 554; --  lmserver.h:890
   SV_SCAVQOSINFOUPDATETIME_PARMNUM : constant := 555; --  lmserver.h:891
   SV_MAXWORKITEMIDLETIME_PARMNUM : constant := 556; --  lmserver.h:892
   SV_MAXRAWWORKITEMS_PARMNUM : constant := 557; --  lmserver.h:893
   SV_NONBLOCKINGTHREADS_PARMNUM : constant := 558; --  lmserver.h:894
   SV_BLOCKINGTHREADS_PARMNUM : constant := 559; --  lmserver.h:895
   SV_PRODUCTTYPE_PARMNUM : constant := 560; --  lmserver.h:896
   SV_SERVERSIZE_PARMNUM : constant := 561; --  lmserver.h:897
   SV_CONNECTIONLESSAUTODISC_PARMNUM : constant := 562; --  lmserver.h:898
   SV_SHARINGVIOLATIONRETRIES_PARMNUM : constant := 563; --  lmserver.h:899
   SV_SHARINGVIOLATIONDELAY_PARMNUM : constant := 564; --  lmserver.h:900
   SV_MAXGLOBALOPENSEARCH_PARMNUM : constant := 565; --  lmserver.h:901
   SV_REMOVEDUPLICATESEARCHES_PARMNUM : constant := 566; --  lmserver.h:902
   SV_LOCKVIOLATIONRETRIES_PARMNUM : constant := 567; --  lmserver.h:903
   SV_LOCKVIOLATIONOFFSET_PARMNUM : constant := 568; --  lmserver.h:904
   SV_LOCKVIOLATIONDELAY_PARMNUM : constant := 569; --  lmserver.h:905
   SV_MDLREADSWITCHOVER_PARMNUM : constant := 570; --  lmserver.h:906
   SV_CACHEDOPENLIMIT_PARMNUM : constant := 571; --  lmserver.h:907
   SV_CRITICALTHREADS_PARMNUM : constant := 572; --  lmserver.h:908
   SV_RESTRICTNULLSESSACCESS_PARMNUM : constant := 573; --  lmserver.h:909
   SV_ENABLEWFW311DIRECTIPX_PARMNUM : constant := 574; --  lmserver.h:910
   SV_COMMENT_INFOLEVEL : constant := 1005; --  lmserver.h:916
   SV_USERS_INFOLEVEL : constant := 1107; --  lmserver.h:918
   SV_DISC_INFOLEVEL : constant := 1010; --  lmserver.h:920
   SV_HIDDEN_INFOLEVEL : constant := 1016; --  lmserver.h:922
   SV_ANNOUNCE_INFOLEVEL : constant := 1017; --  lmserver.h:924
   SV_ANNDELTA_INFOLEVEL : constant := 1018; --  lmserver.h:926
   SV_SESSOPENS_INFOLEVEL : constant := 1501; --  lmserver.h:928
   SV_SESSVCS_INFOLEVEL : constant := 1502; --  lmserver.h:930
   SV_OPENSEARCH_INFOLEVEL : constant := 1503; --  lmserver.h:932
   SV_MAXWORKITEMS_INFOLEVEL : constant := 1506; --  lmserver.h:934
   SV_MAXRAWBUFLEN_INFOLEVEL : constant := 1509; --  lmserver.h:936
   SV_SESSUSERS_INFOLEVEL : constant := 1510; --  lmserver.h:938
   SV_SESSCONNS_INFOLEVEL : constant := 1511; --  lmserver.h:940
   SV_MAXNONPAGEDMEMORYUSAGE_INFOLEVEL : constant := 1512; --  lmserver.h:942
   SV_MAXPAGEDMEMORYUSAGE_INFOLEVEL : constant := 1513; --  lmserver.h:944
   SV_ENABLESOFTCOMPAT_INFOLEVEL : constant := 1514; --  lmserver.h:946
   SV_ENABLEFORCEDLOGOFF_INFOLEVEL : constant := 1515; --  lmserver.h:948
   SV_TIMESOURCE_INFOLEVEL : constant := 1516; --  lmserver.h:950
   SV_LMANNOUNCE_INFOLEVEL : constant := 1518; --  lmserver.h:952
   SV_MAXCOPYREADLEN_INFOLEVEL : constant := 1520; --  lmserver.h:954
   SV_MAXCOPYWRITELEN_INFOLEVEL : constant := 1521; --  lmserver.h:956
   SV_MINKEEPSEARCH_INFOLEVEL : constant := 1522; --  lmserver.h:958
   SV_MAXKEEPSEARCH_INFOLEVEL : constant := 1523; --  lmserver.h:960
   SV_MINKEEPCOMPLSEARCH_INFOLEVEL : constant := 1524; --  lmserver.h:962
   SV_MAXKEEPCOMPLSEARCH_INFOLEVEL : constant := 1525; --  lmserver.h:964
   SV_SCAVTIMEOUT_INFOLEVEL : constant := 1528; --  lmserver.h:966
   SV_MINRCVQUEUE_INFOLEVEL : constant := 1529; --  lmserver.h:968
   SV_MINFREEWORKITEMS_INFOLEVEL : constant := 1530; --  lmserver.h:970
   SV_MAXMPXCT_INFOLEVEL : constant := 1533; --  lmserver.h:972
   SV_OPLOCKBREAKWAIT_INFOLEVEL : constant := 1534; --  lmserver.h:974
   SV_OPLOCKBREAKRESPONSEWAIT_INFOLEVEL : constant := 1535; --  lmserver.h:976
   SV_ENABLEOPLOCKS_INFOLEVEL : constant := 1536; --  lmserver.h:978
   SV_ENABLEOPLOCKFORCECLOSE_INFOLEVEL : constant := 1537; --  lmserver.h:980
   SV_ENABLEFCBOPENS_INFOLEVEL : constant := 1538; --  lmserver.h:982
   SV_ENABLERAW_INFOLEVEL : constant := 1539; --  lmserver.h:984
   SV_ENABLESHAREDNETDRIVES_INFOLEVEL : constant := 1540; --  lmserver.h:986
   SV_MINFREECONNECTIONS_INFOLEVEL : constant := 1541; --  lmserver.h:988
   SV_MAXFREECONNECTIONS_INFOLEVEL : constant := 1542; --  lmserver.h:990
   SV_INITSESSTABLE_INFOLEVEL : constant := 1543; --  lmserver.h:992
   SV_INITCONNTABLE_INFOLEVEL : constant := 1544; --  lmserver.h:994
   SV_INITFILETABLE_INFOLEVEL : constant := 1545; --  lmserver.h:996
   SV_INITSEARCHTABLE_INFOLEVEL : constant := 1546; --  lmserver.h:998
   SV_ALERTSCHEDULE_INFOLEVEL : constant := 1547; --  lmserver.h:1000
   SV_ERRORTHRESHOLD_INFOLEVEL : constant := 1548; --  lmserver.h:1002
   SV_NETWORKERRORTHRESHOLD_INFOLEVEL : constant := 1549; --  lmserver.h:1004
   SV_DISKSPACETHRESHOLD_INFOLEVEL : constant := 1550; --  lmserver.h:1006
   SV_MAXLINKDELAY_INFOLEVEL : constant := 1552; --  lmserver.h:1008
   SV_MINLINKTHROUGHPUT_INFOLEVEL : constant := 1553; --  lmserver.h:1010
   SV_LINKINFOVALIDTIME_INFOLEVEL : constant := 1554; --  lmserver.h:1012
   SV_SCAVQOSINFOUPDATETIME_INFOLEVEL : constant := 1555; --  lmserver.h:1014
   SV_MAXWORKITEMIDLETIME_INFOLEVEL : constant := 1556; --  lmserver.h:1016
   SV_MAXRAWWORKITEMS_INFOLOEVEL : constant := 1557; --  lmserver.h:1018
   SV_NONBLOCKINGTHREADS_INFOLOEVEL : constant := 1558; --  lmserver.h:1020
   SV_BLOCKINGTHREADS_INFOLOEVEL : constant := 1559; --  lmserver.h:1022
   SV_PRODUCTTYPE_INFOLOEVEL : constant := 1560; --  lmserver.h:1024
   SV_SERVERSIZE_INFOLOEVEL : constant := 1561; --  lmserver.h:1026
   SV_CONNECTIONLESSAUTODISC_INFOLOEVEL : constant := 1562; --  lmserver.h:1028
   SV_SHARINGVIOLATIONRETRIES_INFOLOEVEL : constant := 1563;
   --  lmserver.h:1030
   SV_SHARINGVIOLATIONDELAY_INFOLOEVEL : constant := 1564; --  lmserver.h:1032
   SV_MAXGLOBALOPENSEARCH_INFOLOEVEL : constant := 1565; --  lmserver.h:1034
   SV_REMOVEDUPLICATESEARCHES_INFOLOEVEL : constant := 1566;
   --  lmserver.h:1036
   SV_LOCKVIOLATIONRETRIES_INFOLOEVEL : constant := 1567; --  lmserver.h:1038
   SV_LOCKVIOLATIONOFFSET_INFOLOEVEL : constant := 1568; --  lmserver.h:1040
   SV_LOCKVIOLATIONDELAY_INFOLOEVEL : constant := 1569; --  lmserver.h:1042
   SV_MDLREADSWITCHOVER_INFOLOEVEL : constant := 1570; --  lmserver.h:1044
   SV_CACHEDOPENLIMIT_INFOLOEVEL : constant := 1571; --  lmserver.h:1046
   SV_CRITICALTHREADS_INFOLOEVEL : constant := 1572; --  lmserver.h:1048
   SV_RESTRICTNULLSESSACCESS_INFOLOEVEL : constant := 1573; --  lmserver.h:1050
   SV_ENABLEWFW311DIRECTIPX_INFOLOEVEL : constant := 1574; --  lmserver.h:1052
   SVI1_NUM_ELEMENTS : constant := 5;   --  lmserver.h:1055
   SVI2_NUM_ELEMENTS : constant := 40;  --  lmserver.h:1056
   SVI3_NUM_ELEMENTS : constant := 44;  --  lmserver.h:1057
   SV_MAX_CMD_LEN : constant := 256; --  lmserver.h:1063
   SW_AUTOPROF_LOAD_MASK : constant := 16#1#;
   --  lmserver.h:1069
   SW_AUTOPROF_SAVE_MASK : constant := 16#2#;
   --  lmserver.h:1070
   SV_MAX_SRV_HEUR_LEN : constant := 32;  --  lmserver.h:1076
   SV_USERS_PER_LICENSE : constant := 5;   --  lmserver.h:1082

   type SERVER_INFO_100;                                   --  lmserver.h:167
   type SERVER_INFO_101;                                   --  lmserver.h:172
   type SERVER_INFO_102;                                   --  lmserver.h:181
   type SERVER_INFO_402;                                   --  lmserver.h:197
   type SERVER_INFO_403;                                   --  lmserver.h:231
   type SERVER_INFO_502;                                   --  lmserver.h:268
   type SERVER_INFO_503;                                   --  lmserver.h:289
   type SERVER_INFO_599;                                   --  lmserver.h:334
   type SERVER_INFO_598;                                   --  lmserver.h:393
   type SERVER_INFO_1005;                                  --  lmserver.h:416
   type SERVER_INFO_1107;                                  --  lmserver.h:420
   type SERVER_INFO_1010;                                  --  lmserver.h:424
   type SERVER_INFO_1016;                                  --  lmserver.h:428
   type SERVER_INFO_1017;                                  --  lmserver.h:432
   type SERVER_INFO_1018;                                  --  lmserver.h:436
   type SERVER_INFO_1501;                                  --  lmserver.h:440
   type SERVER_INFO_1502;                                  --  lmserver.h:444
   type SERVER_INFO_1503;                                  --  lmserver.h:448
   type SERVER_INFO_1506;                                  --  lmserver.h:452
   type SERVER_INFO_1509;                                  --  lmserver.h:456
   type SERVER_INFO_1510;                                  --  lmserver.h:460
   type SERVER_INFO_1511;                                  --  lmserver.h:464
   type SERVER_INFO_1512;                                  --  lmserver.h:468
   type SERVER_INFO_1513;                                  --  lmserver.h:472
   type SERVER_INFO_1514;                                  --  lmserver.h:476
   type SERVER_INFO_1515;                                  --  lmserver.h:480
   type SERVER_INFO_1516;                                  --  lmserver.h:484
   type SERVER_INFO_1518;                                  --  lmserver.h:488
   type SERVER_INFO_1520;                                  --  lmserver.h:492
   type SERVER_INFO_1521;                                  --  lmserver.h:496
   type SERVER_INFO_1522;                                  --  lmserver.h:500
   type SERVER_INFO_1523;                                  --  lmserver.h:504
   type SERVER_INFO_1524;                                  --  lmserver.h:508
   type SERVER_INFO_1525;                                  --  lmserver.h:512
   type SERVER_INFO_1528;                                  --  lmserver.h:516
   type SERVER_INFO_1529;                                  --  lmserver.h:520
   type SERVER_INFO_1530;                                  --  lmserver.h:524
   type SERVER_INFO_1533;                                  --  lmserver.h:528
   type SERVER_INFO_1534;                                  --  lmserver.h:532
   type SERVER_INFO_1535;                                  --  lmserver.h:536
   type SERVER_INFO_1536;                                  --  lmserver.h:540
   type SERVER_INFO_1537;                                  --  lmserver.h:544
   type SERVER_INFO_1538;                                  --  lmserver.h:548
   type SERVER_INFO_1539;                                  --  lmserver.h:552
   type SERVER_INFO_1540;                                  --  lmserver.h:556
   type SERVER_INFO_1541;                                  --  lmserver.h:560
   type SERVER_INFO_1542;                                  --  lmserver.h:564
   type SERVER_INFO_1543;                                  --  lmserver.h:568
   type SERVER_INFO_1544;                                  --  lmserver.h:572
   type SERVER_INFO_1545;                                  --  lmserver.h:576
   type SERVER_INFO_1546;                                  --  lmserver.h:580
   type SERVER_INFO_1547;                                  --  lmserver.h:584
   type SERVER_INFO_1548;                                  --  lmserver.h:588
   type SERVER_INFO_1549;                                  --  lmserver.h:592
   type SERVER_INFO_1550;                                  --  lmserver.h:596
   type SERVER_INFO_1552;                                  --  lmserver.h:600
   type SERVER_INFO_1553;                                  --  lmserver.h:604
   type SERVER_INFO_1554;                                  --  lmserver.h:608
   type SERVER_INFO_1555;                                  --  lmserver.h:612
   type SERVER_INFO_1556;                                  --  lmserver.h:616
   type SERVER_INFO_1557;                                  --  lmserver.h:620
   type SERVER_INFO_1558;                                  --  lmserver.h:624
   type SERVER_INFO_1559;                                  --  lmserver.h:628
   type SERVER_INFO_1560;                                  --  lmserver.h:632
   type SERVER_INFO_1561;                                  --  lmserver.h:636
   type SERVER_INFO_1562;                                  --  lmserver.h:640
   type SERVER_INFO_1563;                                  --  lmserver.h:644
   type SERVER_INFO_1564;                                  --  lmserver.h:648
   type SERVER_INFO_1565;                                  --  lmserver.h:652
   type SERVER_INFO_1566;                                  --  lmserver.h:656
   type SERVER_INFO_1567;                                  --  lmserver.h:660
   type SERVER_INFO_1568;                                  --  lmserver.h:664
   type SERVER_INFO_1569;                                  --  lmserver.h:668
   type SERVER_INFO_1570;                                  --  lmserver.h:672
   type SERVER_INFO_1571;                                  --  lmserver.h:676
   type SERVER_INFO_1572;                                  --  lmserver.h:680
   type SERVER_INFO_1573;                                  --  lmserver.h:684
   type SERVER_INFO_1574;                                  --  lmserver.h:688
   type SERVER_TRANSPORT_INFO_0;                           --  lmserver.h:711

   type PSERVER_INFO_100 is access all SERVER_INFO_100;    --  lmserver.h:170
   subtype LPSERVER_INFO_100 is PSERVER_INFO_100;          --  lmserver.h:170
   type PSERVER_INFO_101 is access all SERVER_INFO_101;    --  lmserver.h:179
   subtype LPSERVER_INFO_101 is PSERVER_INFO_101;          --  lmserver.h:179
   type PSERVER_INFO_102 is access all SERVER_INFO_102;    --  lmserver.h:195
   subtype LPSERVER_INFO_102 is PSERVER_INFO_102;          --  lmserver.h:195
   type PSERVER_INFO_402 is access all SERVER_INFO_402;    --  lmserver.h:229
   subtype LPSERVER_INFO_402 is PSERVER_INFO_402;          --  lmserver.h:229
   type PSERVER_INFO_403 is access all SERVER_INFO_403;    --  lmserver.h:266
   subtype LPSERVER_INFO_403 is PSERVER_INFO_403;          --  lmserver.h:266
   type PSERVER_INFO_502 is access all SERVER_INFO_502;    --  lmserver.h:287
   subtype LPSERVER_INFO_502 is PSERVER_INFO_502;          --  lmserver.h:287
   type PSERVER_INFO_503 is access all SERVER_INFO_503;    --  lmserver.h:332
   subtype LPSERVER_INFO_503 is PSERVER_INFO_503;          --  lmserver.h:332
   type PSERVER_INFO_599 is access all SERVER_INFO_599;    --  lmserver.h:391
   subtype LPSERVER_INFO_599 is PSERVER_INFO_599;          --  lmserver.h:391
   type PSERVER_INFO_598 is access all SERVER_INFO_598;    --  lmserver.h:414
   subtype LPSERVER_INFO_598 is PSERVER_INFO_598;          --  lmserver.h:414
   type PSERVER_INFO_1005 is access all SERVER_INFO_1005;  --  lmserver.h:418
   subtype LPSERVER_INFO_1005 is PSERVER_INFO_1005;        --  lmserver.h:418
   type PSERVER_INFO_1107 is access all SERVER_INFO_1107;  --  lmserver.h:422
   subtype LPSERVER_INFO_1107 is PSERVER_INFO_1107;        --  lmserver.h:422
   type PSERVER_INFO_1010 is access all SERVER_INFO_1010;  --  lmserver.h:426
   subtype LPSERVER_INFO_1010 is PSERVER_INFO_1010;        --  lmserver.h:426
   type PSERVER_INFO_1016 is access all SERVER_INFO_1016;  --  lmserver.h:430
   subtype LPSERVER_INFO_1016 is PSERVER_INFO_1016;        --  lmserver.h:430
   type PSERVER_INFO_1017 is access all SERVER_INFO_1017;  --  lmserver.h:434
   subtype LPSERVER_INFO_1017 is PSERVER_INFO_1017;        --  lmserver.h:434
   type PSERVER_INFO_1018 is access all SERVER_INFO_1018;  --  lmserver.h:438
   subtype LPSERVER_INFO_1018 is PSERVER_INFO_1018;        --  lmserver.h:438
   type PSERVER_INFO_1501 is access all SERVER_INFO_1501;  --  lmserver.h:442
   subtype LPSERVER_INFO_1501 is PSERVER_INFO_1501;        --  lmserver.h:442
   type PSERVER_INFO_1502 is access all SERVER_INFO_1502;  --  lmserver.h:446
   subtype LPSERVER_INFO_1502 is PSERVER_INFO_1502;        --  lmserver.h:446
   type PSERVER_INFO_1503 is access all SERVER_INFO_1503;  --  lmserver.h:450
   subtype LPSERVER_INFO_1503 is PSERVER_INFO_1503;        --  lmserver.h:450
   type PSERVER_INFO_1506 is access all SERVER_INFO_1506;  --  lmserver.h:454
   subtype LPSERVER_INFO_1506 is PSERVER_INFO_1506;        --  lmserver.h:454
   type PSERVER_INFO_1509 is access all SERVER_INFO_1509;  --  lmserver.h:458
   subtype LPSERVER_INFO_1509 is PSERVER_INFO_1509;        --  lmserver.h:458
   type PSERVER_INFO_1510 is access all SERVER_INFO_1510;  --  lmserver.h:462
   subtype LPSERVER_INFO_1510 is PSERVER_INFO_1510;        --  lmserver.h:462
   type PSERVER_INFO_1511 is access all SERVER_INFO_1511;  --  lmserver.h:466
   subtype LPSERVER_INFO_1511 is PSERVER_INFO_1511;        --  lmserver.h:466
   type PSERVER_INFO_1512 is access all SERVER_INFO_1512;  --  lmserver.h:470
   subtype LPSERVER_INFO_1512 is PSERVER_INFO_1512;        --  lmserver.h:470
   type PSERVER_INFO_1513 is access all SERVER_INFO_1513;  --  lmserver.h:474
   subtype LPSERVER_INFO_1513 is PSERVER_INFO_1513;        --  lmserver.h:474
   type PSERVER_INFO_1514 is access all SERVER_INFO_1514;  --  lmserver.h:478
   subtype LPSERVER_INFO_1514 is PSERVER_INFO_1514;        --  lmserver.h:478
   type PSERVER_INFO_1515 is access all SERVER_INFO_1515;  --  lmserver.h:482
   subtype LPSERVER_INFO_1515 is PSERVER_INFO_1515;        --  lmserver.h:482
   type PSERVER_INFO_1516 is access all SERVER_INFO_1516;  --  lmserver.h:486
   subtype LPSERVER_INFO_1516 is PSERVER_INFO_1516;        --  lmserver.h:486
   type PSERVER_INFO_1518 is access all SERVER_INFO_1518;  --  lmserver.h:490
   subtype LPSERVER_INFO_1518 is PSERVER_INFO_1518;        --  lmserver.h:490
   type PSERVER_INFO_1520 is access all SERVER_INFO_1520;  --  lmserver.h:494
   subtype LPSERVER_INFO_1520 is PSERVER_INFO_1520;        --  lmserver.h:494
   type PSERVER_INFO_1521 is access all SERVER_INFO_1521;  --  lmserver.h:498
   subtype LPSERVER_INFO_1521 is PSERVER_INFO_1521;        --  lmserver.h:498
   type PSERVER_INFO_1522 is access all SERVER_INFO_1522;  --  lmserver.h:502
   subtype LPSERVER_INFO_1522 is PSERVER_INFO_1522;        --  lmserver.h:502
   type PSERVER_INFO_1523 is access all SERVER_INFO_1523;  --  lmserver.h:506
   subtype LPSERVER_INFO_1523 is PSERVER_INFO_1523;        --  lmserver.h:506
   type PSERVER_INFO_1524 is access all SERVER_INFO_1524;  --  lmserver.h:510
   subtype LPSERVER_INFO_1524 is PSERVER_INFO_1524;        --  lmserver.h:510
   type PSERVER_INFO_1525 is access all SERVER_INFO_1525;  --  lmserver.h:514
   subtype LPSERVER_INFO_1525 is PSERVER_INFO_1525;        --  lmserver.h:514
   type PSERVER_INFO_1528 is access all SERVER_INFO_1528;  --  lmserver.h:518
   subtype LPSERVER_INFO_1528 is PSERVER_INFO_1528;        --  lmserver.h:518
   type PSERVER_INFO_1529 is access all SERVER_INFO_1529;  --  lmserver.h:522
   subtype LPSERVER_INFO_1529 is PSERVER_INFO_1529;        --  lmserver.h:522
   type PSERVER_INFO_1530 is access all SERVER_INFO_1530;  --  lmserver.h:526
   subtype LPSERVER_INFO_1530 is PSERVER_INFO_1530;        --  lmserver.h:526
   type PSERVER_INFO_1533 is access all SERVER_INFO_1533;  --  lmserver.h:530
   subtype LPSERVER_INFO_1533 is PSERVER_INFO_1533;        --  lmserver.h:530
   type PSERVER_INFO_1534 is access all SERVER_INFO_1534;  --  lmserver.h:534
   subtype LPSERVER_INFO_1534 is PSERVER_INFO_1534;        --  lmserver.h:534
   type PSERVER_INFO_1535 is access all SERVER_INFO_1535;  --  lmserver.h:538
   subtype LPSERVER_INFO_1535 is PSERVER_INFO_1535;        --  lmserver.h:538
   type PSERVER_INFO_1536 is access all SERVER_INFO_1536;  --  lmserver.h:542
   subtype LPSERVER_INFO_1536 is PSERVER_INFO_1536;        --  lmserver.h:542
   type PSERVER_INFO_1537 is access all SERVER_INFO_1537;  --  lmserver.h:546
   subtype LPSERVER_INFO_1537 is PSERVER_INFO_1537;        --  lmserver.h:546
   type PSERVER_INFO_1538 is access all SERVER_INFO_1538;  --  lmserver.h:550
   subtype LPSERVER_INFO_1538 is PSERVER_INFO_1538;        --  lmserver.h:550
   type PSERVER_INFO_1539 is access all SERVER_INFO_1539;  --  lmserver.h:554
   subtype LPSERVER_INFO_1539 is PSERVER_INFO_1539;        --  lmserver.h:554
   type PSERVER_INFO_1540 is access all SERVER_INFO_1540;  --  lmserver.h:558
   subtype LPSERVER_INFO_1540 is PSERVER_INFO_1540;        --  lmserver.h:558
   type PSERVER_INFO_1541 is access all SERVER_INFO_1541;  --  lmserver.h:562
   subtype LPSERVER_INFO_1541 is PSERVER_INFO_1541;        --  lmserver.h:562
   type PSERVER_INFO_1542 is access all SERVER_INFO_1542;  --  lmserver.h:566
   subtype LPSERVER_INFO_1542 is PSERVER_INFO_1542;        --  lmserver.h:566
   type PSERVER_INFO_1543 is access all SERVER_INFO_1543;  --  lmserver.h:570
   subtype LPSERVER_INFO_1543 is PSERVER_INFO_1543;        --  lmserver.h:570
   type PSERVER_INFO_1544 is access all SERVER_INFO_1544;  --  lmserver.h:574
   subtype LPSERVER_INFO_1544 is PSERVER_INFO_1544;        --  lmserver.h:574
   type PSERVER_INFO_1545 is access all SERVER_INFO_1545;  --  lmserver.h:578
   subtype LPSERVER_INFO_1545 is PSERVER_INFO_1545;        --  lmserver.h:578
   type PSERVER_INFO_1546 is access all SERVER_INFO_1546;  --  lmserver.h:582
   subtype LPSERVER_INFO_1546 is PSERVER_INFO_1546;        --  lmserver.h:582
   type PSERVER_INFO_1547 is access all SERVER_INFO_1547;  --  lmserver.h:586
   subtype LPSERVER_INFO_1547 is PSERVER_INFO_1547;        --  lmserver.h:586
   type PSERVER_INFO_1548 is access all SERVER_INFO_1548;  --  lmserver.h:590
   subtype LPSERVER_INFO_1548 is PSERVER_INFO_1548;        --  lmserver.h:590
   type PSERVER_INFO_1549 is access all SERVER_INFO_1549;  --  lmserver.h:594
   subtype LPSERVER_INFO_1549 is PSERVER_INFO_1549;        --  lmserver.h:594
   type PSERVER_INFO_1550 is access all SERVER_INFO_1550;  --  lmserver.h:598
   subtype LPSERVER_INFO_1550 is PSERVER_INFO_1550;        --  lmserver.h:598
   type PSERVER_INFO_1552 is access all SERVER_INFO_1552;  --  lmserver.h:602
   subtype LPSERVER_INFO_1552 is PSERVER_INFO_1552;        --  lmserver.h:602
   type PSERVER_INFO_1553 is access all SERVER_INFO_1553;  --  lmserver.h:606
   subtype LPSERVER_INFO_1553 is PSERVER_INFO_1553;        --  lmserver.h:606
   type PSERVER_INFO_1554 is access all SERVER_INFO_1554;  --  lmserver.h:610
   subtype LPSERVER_INFO_1554 is PSERVER_INFO_1554;        --  lmserver.h:610
   type PSERVER_INFO_1555 is access all SERVER_INFO_1555;  --  lmserver.h:614
   subtype LPSERVER_INFO_1555 is PSERVER_INFO_1555;        --  lmserver.h:614
   type PSERVER_INFO_1556 is access all SERVER_INFO_1556;  --  lmserver.h:618
   subtype LPSERVER_INFO_1556 is PSERVER_INFO_1556;        --  lmserver.h:618
   type PSERVER_INFO_1557 is access all SERVER_INFO_1557;  --  lmserver.h:622
   subtype LPSERVER_INFO_1557 is PSERVER_INFO_1557;        --  lmserver.h:622
   type PSERVER_INFO_1558 is access all SERVER_INFO_1558;  --  lmserver.h:626
   subtype LPSERVER_INFO_1558 is PSERVER_INFO_1558;        --  lmserver.h:626
   type PSERVER_INFO_1559 is access all SERVER_INFO_1559;  --  lmserver.h:630
   subtype LPSERVER_INFO_1559 is PSERVER_INFO_1559;        --  lmserver.h:630
   type PSERVER_INFO_1560 is access all SERVER_INFO_1560;  --  lmserver.h:634
   subtype LPSERVER_INFO_1560 is PSERVER_INFO_1560;        --  lmserver.h:634
   type PSERVER_INFO_1561 is access all SERVER_INFO_1561;  --  lmserver.h:638
   subtype LPSERVER_INFO_1561 is PSERVER_INFO_1561;        --  lmserver.h:638
   type PSERVER_INFO_1562 is access all SERVER_INFO_1562;  --  lmserver.h:642
   subtype LPSERVER_INFO_1562 is PSERVER_INFO_1562;        --  lmserver.h:642
   type PSERVER_INFO_1563 is access all SERVER_INFO_1563;  --  lmserver.h:646
   subtype LPSERVER_INFO_1563 is PSERVER_INFO_1563;        --  lmserver.h:646
   type PSERVER_INFO_1564 is access all SERVER_INFO_1564;  --  lmserver.h:650
   subtype LPSERVER_INFO_1564 is PSERVER_INFO_1564;        --  lmserver.h:650
   type PSERVER_INFO_1565 is access all SERVER_INFO_1565;  --  lmserver.h:654
   subtype LPSERVER_INFO_1565 is PSERVER_INFO_1565;        --  lmserver.h:654
   type PSERVER_INFO_1566 is access all SERVER_INFO_1566;  --  lmserver.h:658
   subtype LPSERVER_INFO_1566 is PSERVER_INFO_1566;        --  lmserver.h:658
   type PSERVER_INFO_1567 is access all SERVER_INFO_1567;  --  lmserver.h:662
   subtype LPSERVER_INFO_1567 is PSERVER_INFO_1567;        --  lmserver.h:662
   type PSERVER_INFO_1568 is access all SERVER_INFO_1568;  --  lmserver.h:666
   subtype LPSERVER_INFO_1568 is PSERVER_INFO_1568;        --  lmserver.h:666
   type PSERVER_INFO_1569 is access all SERVER_INFO_1569;  --  lmserver.h:670
   subtype LPSERVER_INFO_1569 is PSERVER_INFO_1569;        --  lmserver.h:670
   type PSERVER_INFO_1570 is access all SERVER_INFO_1570;  --  lmserver.h:674
   subtype LPSERVER_INFO_1570 is PSERVER_INFO_1570;        --  lmserver.h:674
   type PSERVER_INFO_1571 is access all SERVER_INFO_1571;  --  lmserver.h:678
   subtype LPSERVER_INFO_1571 is PSERVER_INFO_1571;        --  lmserver.h:678
   type PSERVER_INFO_1572 is access all SERVER_INFO_1572;  --  lmserver.h:682
   subtype LPSERVER_INFO_1572 is PSERVER_INFO_1572;        --  lmserver.h:682
   type PSERVER_INFO_1573 is access all SERVER_INFO_1573;  --  lmserver.h:686
   subtype LPSERVER_INFO_1573 is PSERVER_INFO_1573;        --  lmserver.h:686
   type PSERVER_INFO_1574 is access all SERVER_INFO_1574;  --  lmserver.h:690
   subtype LPSERVER_INFO_1574 is PSERVER_INFO_1574;        --  lmserver.h:690
   type PSERVER_TRANSPORT_INFO_0 is access all SERVER_TRANSPORT_INFO_0;
   --  lmserver.h:717
   subtype LPSERVER_TRANSPORT_INFO_0 is PSERVER_TRANSPORT_INFO_0;
   --  lmserver.h:717

   type SERVER_INFO_100 is                                 --  lmserver.h:167
      record
         sv100_platform_id : Win32.DWORD;                 --  lmserver.h:168
         sv100_name : Win32.Winnt.LPTSTR;          --  lmserver.h:169
      end record;

   type SERVER_INFO_101 is                                 --  lmserver.h:172
      record
         sv101_platform_id : Win32.DWORD;               --  lmserver.h:173
         sv101_name : Win32.Winnt.LPTSTR;        --  lmserver.h:174
         sv101_version_major : Win32.DWORD;               --  lmserver.h:175
         sv101_version_minor : Win32.DWORD;               --  lmserver.h:176
         sv101_type : Win32.DWORD;               --  lmserver.h:177
         sv101_comment : Win32.Winnt.LPTSTR;        --  lmserver.h:178
      end record;

   type SERVER_INFO_102 is                                 --  lmserver.h:181
      record
         sv102_platform_id : Win32.DWORD;               --  lmserver.h:182
         sv102_name : Win32.Winnt.LPTSTR;        --  lmserver.h:183
         sv102_version_major : Win32.DWORD;               --  lmserver.h:184
         sv102_version_minor : Win32.DWORD;               --  lmserver.h:185
         sv102_type : Win32.DWORD;               --  lmserver.h:186
         sv102_comment : Win32.Winnt.LPTSTR;        --  lmserver.h:187
         sv102_users : Win32.DWORD;               --  lmserver.h:188
         sv102_disc : Win32.LONG;                --  lmserver.h:189
         sv102_hidden : Win32.BOOL;                --  lmserver.h:190
         sv102_announce : Win32.DWORD;               --  lmserver.h:191
         sv102_anndelta : Win32.DWORD;               --  lmserver.h:192
         sv102_licenses : Win32.DWORD;               --  lmserver.h:193
         sv102_userpath : Win32.Winnt.LPTSTR;        --  lmserver.h:194
      end record;

   type SERVER_INFO_402 is                                 --  lmserver.h:197
      record
         sv402_ulist_mtime : Win32.DWORD;               --  lmserver.h:198
         sv402_glist_mtime : Win32.DWORD;               --  lmserver.h:199
         sv402_alist_mtime : Win32.DWORD;               --  lmserver.h:200
         sv402_alerts : Win32.Winnt.LPTSTR;        --  lmserver.h:201
         sv402_security : Win32.DWORD;               --  lmserver.h:202
         sv402_numadmin : Win32.DWORD;               --  lmserver.h:203
         sv402_lanmask : Win32.DWORD;               --  lmserver.h:204
         sv402_guestacct : Win32.Winnt.LPTSTR;        --  lmserver.h:205
         sv402_chdevs : Win32.DWORD;               --  lmserver.h:206
         sv402_chdevq : Win32.DWORD;               --  lmserver.h:207
         sv402_chdevjobs : Win32.DWORD;               --  lmserver.h:208
         sv402_connections : Win32.DWORD;               --  lmserver.h:209
         sv402_shares : Win32.DWORD;               --  lmserver.h:210
         sv402_openfiles : Win32.DWORD;               --  lmserver.h:211
         sv402_sessopens : Win32.DWORD;               --  lmserver.h:212
         sv402_sessvcs : Win32.DWORD;               --  lmserver.h:213
         sv402_sessreqs : Win32.DWORD;               --  lmserver.h:214
         sv402_opensearch : Win32.DWORD;               --  lmserver.h:215
         sv402_activelocks : Win32.DWORD;               --  lmserver.h:216
         sv402_numreqbuf : Win32.DWORD;               --  lmserver.h:217
         sv402_sizreqbuf : Win32.DWORD;               --  lmserver.h:218
         sv402_numbigbuf : Win32.DWORD;               --  lmserver.h:219
         sv402_numfiletasks : Win32.DWORD;               --  lmserver.h:220
         sv402_alertsched : Win32.DWORD;               --  lmserver.h:221
         sv402_erroralert : Win32.DWORD;               --  lmserver.h:222
         sv402_logonalert : Win32.DWORD;               --  lmserver.h:223
         sv402_accessalert : Win32.DWORD;               --  lmserver.h:224
         sv402_diskalert : Win32.DWORD;               --  lmserver.h:225
         sv402_netioalert : Win32.DWORD;               --  lmserver.h:226
         sv402_maxauditsz : Win32.DWORD;               --  lmserver.h:227
         sv402_srvheuristics : Win32.Winnt.LPTSTR;        --  lmserver.h:228
      end record;

   type SERVER_INFO_403 is                                 --  lmserver.h:231
      record
         sv403_ulist_mtime : Win32.DWORD;               --  lmserver.h:232
         sv403_glist_mtime : Win32.DWORD;               --  lmserver.h:233
         sv403_alist_mtime : Win32.DWORD;               --  lmserver.h:234
         sv403_alerts : Win32.Winnt.LPTSTR;        --  lmserver.h:235
         sv403_security : Win32.DWORD;               --  lmserver.h:236
         sv403_numadmin : Win32.DWORD;               --  lmserver.h:237
         sv403_lanmask : Win32.DWORD;               --  lmserver.h:238
         sv403_guestacct : Win32.Winnt.LPTSTR;        --  lmserver.h:239
         sv403_chdevs : Win32.DWORD;               --  lmserver.h:240
         sv403_chdevq : Win32.DWORD;               --  lmserver.h:241
         sv403_chdevjobs : Win32.DWORD;               --  lmserver.h:242
         sv403_connections : Win32.DWORD;               --  lmserver.h:243
         sv403_shares : Win32.DWORD;               --  lmserver.h:244
         sv403_openfiles : Win32.DWORD;               --  lmserver.h:245
         sv403_sessopens : Win32.DWORD;               --  lmserver.h:246
         sv403_sessvcs : Win32.DWORD;               --  lmserver.h:247
         sv403_sessreqs : Win32.DWORD;               --  lmserver.h:248
         sv403_opensearch : Win32.DWORD;               --  lmserver.h:249
         sv403_activelocks : Win32.DWORD;               --  lmserver.h:250
         sv403_numreqbuf : Win32.DWORD;               --  lmserver.h:251
         sv403_sizreqbuf : Win32.DWORD;               --  lmserver.h:252
         sv403_numbigbuf : Win32.DWORD;               --  lmserver.h:253
         sv403_numfiletasks : Win32.DWORD;               --  lmserver.h:254
         sv403_alertsched : Win32.DWORD;               --  lmserver.h:255
         sv403_erroralert : Win32.DWORD;               --  lmserver.h:256
         sv403_logonalert : Win32.DWORD;               --  lmserver.h:257
         sv403_accessalert : Win32.DWORD;               --  lmserver.h:258
         sv403_diskalert : Win32.DWORD;               --  lmserver.h:259
         sv403_netioalert : Win32.DWORD;               --  lmserver.h:260
         sv403_maxauditsz : Win32.DWORD;               --  lmserver.h:261
         sv403_srvheuristics : Win32.Winnt.LPTSTR;        --  lmserver.h:262
         sv403_auditedevents : Win32.DWORD;               --  lmserver.h:263
         sv403_autoprofile : Win32.DWORD;               --  lmserver.h:264
         sv403_autopath : Win32.Winnt.LPTSTR;        --  lmserver.h:265
      end record;

   type SERVER_INFO_502 is                                 --  lmserver.h:268
      record
         sv502_sessopens : Win32.DWORD;      --  lmserver.h:269
         sv502_sessvcs : Win32.DWORD;      --  lmserver.h:270
         sv502_opensearch : Win32.DWORD;      --  lmserver.h:271
         sv502_sizreqbuf : Win32.DWORD;      --  lmserver.h:272
         sv502_initworkitems : Win32.DWORD;      --  lmserver.h:273
         sv502_maxworkitems : Win32.DWORD;      --  lmserver.h:274
         sv502_rawworkitems : Win32.DWORD;      --  lmserver.h:275
         sv502_irpstacksize : Win32.DWORD;      --  lmserver.h:276
         sv502_maxrawbuflen : Win32.DWORD;      --  lmserver.h:277
         sv502_sessusers : Win32.DWORD;      --  lmserver.h:278
         sv502_sessconns : Win32.DWORD;      --  lmserver.h:279
         sv502_maxpagedmemoryusage : Win32.DWORD;      --  lmserver.h:280
         sv502_maxnonpagedmemoryusage : Win32.DWORD;      --  lmserver.h:281
         sv502_enablesoftcompat : Win32.BOOL;       --  lmserver.h:282
         sv502_enableforcedlogoff : Win32.BOOL;       --  lmserver.h:283
         sv502_timesource : Win32.BOOL;       --  lmserver.h:284
         sv502_acceptdownlevelapis : Win32.BOOL;       --  lmserver.h:285
         sv502_lmannounce : Win32.BOOL;       --  lmserver.h:286
      end record;

   type SERVER_INFO_503 is                                 --  lmserver.h:289
      record
         sv503_sessopens : Win32.DWORD;     --  lmserver.h:290
         sv503_sessvcs : Win32.DWORD;     --  lmserver.h:291
         sv503_opensearch : Win32.DWORD;     --  lmserver.h:292
         sv503_sizreqbuf : Win32.DWORD;     --  lmserver.h:293
         sv503_initworkitems : Win32.DWORD;     --  lmserver.h:294
         sv503_maxworkitems : Win32.DWORD;     --  lmserver.h:295
         sv503_rawworkitems : Win32.DWORD;     --  lmserver.h:296
         sv503_irpstacksize : Win32.DWORD;     --  lmserver.h:297
         sv503_maxrawbuflen : Win32.DWORD;     --  lmserver.h:298
         sv503_sessusers : Win32.DWORD;     --  lmserver.h:299
         sv503_sessconns : Win32.DWORD;     --  lmserver.h:300
         sv503_maxpagedmemoryusage : Win32.DWORD;     --  lmserver.h:301
         sv503_maxnonpagedmemoryusage : Win32.DWORD;     --  lmserver.h:302
         sv503_enablesoftcompat : Win32.BOOL;      --  lmserver.h:303
         sv503_enableforcedlogoff : Win32.BOOL;      --  lmserver.h:304
         sv503_timesource : Win32.BOOL;      --  lmserver.h:305
         sv503_acceptdownlevelapis : Win32.BOOL;      --  lmserver.h:306
         sv503_lmannounce : Win32.BOOL;      --  lmserver.h:307
         sv503_domain : Win32.Winnt.LPTSTR;
         --  lmserver.h:308
         sv503_maxcopyreadlen : Win32.DWORD;     --  lmserver.h:309
         sv503_maxcopywritelen : Win32.DWORD;     --  lmserver.h:310
         sv503_minkeepsearch : Win32.DWORD;     --  lmserver.h:311
         sv503_maxkeepsearch : Win32.DWORD;     --  lmserver.h:312
         sv503_minkeepcomplsearch : Win32.DWORD;     --  lmserver.h:313
         sv503_maxkeepcomplsearch : Win32.DWORD;     --  lmserver.h:314
         sv503_threadcountadd : Win32.DWORD;     --  lmserver.h:315
         sv503_numblockthreads : Win32.DWORD;     --  lmserver.h:316
         sv503_scavtimeout : Win32.DWORD;     --  lmserver.h:317
         sv503_minrcvqueue : Win32.DWORD;     --  lmserver.h:318
         sv503_minfreeworkitems : Win32.DWORD;     --  lmserver.h:319
         sv503_xactmemsize : Win32.DWORD;     --  lmserver.h:320
         sv503_threadpriority : Win32.DWORD;     --  lmserver.h:321
         sv503_maxmpxct : Win32.DWORD;     --  lmserver.h:322
         sv503_oplockbreakwait : Win32.DWORD;     --  lmserver.h:323
         sv503_oplockbreakresponsewait : Win32.DWORD;     --  lmserver.h:324
         sv503_enableoplocks : Win32.BOOL;      --  lmserver.h:325
         sv503_enableoplockforceclose : Win32.BOOL;      --  lmserver.h:326
         sv503_enablefcbopens : Win32.BOOL;      --  lmserver.h:327
         sv503_enableraw : Win32.BOOL;      --  lmserver.h:328
         sv503_enablesharednetdrives : Win32.BOOL;      --  lmserver.h:329
         sv503_minfreeconnections : Win32.DWORD;     --  lmserver.h:330
         sv503_maxfreeconnections : Win32.DWORD;     --  lmserver.h:331
      end record;

   type SERVER_INFO_599 is                                 --  lmserver.h:334
      record
         sv599_sessopens : Win32.DWORD;     --  lmserver.h:335
         sv599_sessvcs : Win32.DWORD;     --  lmserver.h:336
         sv599_opensearch : Win32.DWORD;     --  lmserver.h:337
         sv599_sizreqbuf : Win32.DWORD;     --  lmserver.h:338
         sv599_initworkitems : Win32.DWORD;     --  lmserver.h:339
         sv599_maxworkitems : Win32.DWORD;     --  lmserver.h:340
         sv599_rawworkitems : Win32.DWORD;     --  lmserver.h:341
         sv599_irpstacksize : Win32.DWORD;     --  lmserver.h:342
         sv599_maxrawbuflen : Win32.DWORD;     --  lmserver.h:343
         sv599_sessusers : Win32.DWORD;     --  lmserver.h:344
         sv599_sessconns : Win32.DWORD;     --  lmserver.h:345
         sv599_maxpagedmemoryusage : Win32.DWORD;     --  lmserver.h:346
         sv599_maxnonpagedmemoryusage : Win32.DWORD;     --  lmserver.h:347
         sv599_enablesoftcompat : Win32.BOOL;      --  lmserver.h:348
         sv599_enableforcedlogoff : Win32.BOOL;      --  lmserver.h:349
         sv599_timesource : Win32.BOOL;      --  lmserver.h:350
         sv599_acceptdownlevelapis : Win32.BOOL;      --  lmserver.h:351
         sv599_lmannounce : Win32.BOOL;      --  lmserver.h:352
         sv599_domain : Win32.Winnt.LPTSTR;
         --  lmserver.h:353
         sv599_maxcopyreadlen : Win32.DWORD;     --  lmserver.h:354
         sv599_maxcopywritelen : Win32.DWORD;     --  lmserver.h:355
         sv599_minkeepsearch : Win32.DWORD;     --  lmserver.h:356
         sv599_maxkeepsearch : Win32.DWORD;     --  lmserver.h:357
         sv599_minkeepcomplsearch : Win32.DWORD;     --  lmserver.h:358
         sv599_maxkeepcomplsearch : Win32.DWORD;     --  lmserver.h:359
         sv599_threadcountadd : Win32.DWORD;     --  lmserver.h:360
         sv599_numblockthreads : Win32.DWORD;     --  lmserver.h:361
         sv599_scavtimeout : Win32.DWORD;     --  lmserver.h:362
         sv599_minrcvqueue : Win32.DWORD;     --  lmserver.h:363
         sv599_minfreeworkitems : Win32.DWORD;     --  lmserver.h:364
         sv599_xactmemsize : Win32.DWORD;     --  lmserver.h:365
         sv599_threadpriority : Win32.DWORD;     --  lmserver.h:366
         sv599_maxmpxct : Win32.DWORD;     --  lmserver.h:367
         sv599_oplockbreakwait : Win32.DWORD;     --  lmserver.h:368
         sv599_oplockbreakresponsewait : Win32.DWORD;     --  lmserver.h:369
         sv599_enableoplocks : Win32.BOOL;      --  lmserver.h:370
         sv599_enableoplockforceclose : Win32.BOOL;      --  lmserver.h:371
         sv599_enablefcbopens : Win32.BOOL;      --  lmserver.h:372
         sv599_enableraw : Win32.BOOL;      --  lmserver.h:373
         sv599_enablesharednetdrives : Win32.BOOL;      --  lmserver.h:374
         sv599_minfreeconnections : Win32.DWORD;     --  lmserver.h:375
         sv599_maxfreeconnections : Win32.DWORD;     --  lmserver.h:376
         sv599_initsesstable : Win32.DWORD;     --  lmserver.h:377
         sv599_initconntable : Win32.DWORD;     --  lmserver.h:378
         sv599_initfiletable : Win32.DWORD;     --  lmserver.h:379
         sv599_initsearchtable : Win32.DWORD;     --  lmserver.h:380
         sv599_alertschedule : Win32.DWORD;     --  lmserver.h:381
         sv599_errorthreshold : Win32.DWORD;     --  lmserver.h:382
         sv599_networkerrorthreshold : Win32.DWORD;     --  lmserver.h:383
         sv599_diskspacethreshold : Win32.DWORD;     --  lmserver.h:384
         sv599_diskconfiguration : Win32.DWORD;     --  lmserver.h:385
         sv599_maxlinkdelay : Win32.DWORD;     --  lmserver.h:386
         sv599_minlinkthroughput : Win32.DWORD;     --  lmserver.h:387
         sv599_linkinfovalidtime : Win32.DWORD;     --  lmserver.h:388
         sv599_scavqosinfoupdatetime : Win32.DWORD;     --  lmserver.h:389
         sv599_maxworkitemidletime : Win32.DWORD;     --  lmserver.h:390
      end record;

   type SERVER_INFO_598 is                                 --  lmserver.h:393
      record
         sv598_maxrawworkitems : Win32.DWORD;     --  lmserver.h:394
         sv598_nonblockingthreads : Win32.DWORD;     --  lmserver.h:395
         sv598_blockingthreads : Win32.DWORD;     --  lmserver.h:396
         sv598_producttype : Win32.DWORD;     --  lmserver.h:397
         sv598_serversize : Win32.DWORD;     --  lmserver.h:398
         sv598_connectionlessautodisc : Win32.DWORD;     --  lmserver.h:399
         sv598_sharingviolationretries : Win32.DWORD;     --  lmserver.h:400
         sv598_sharingviolationdelay : Win32.DWORD;     --  lmserver.h:401
         sv598_maxglobalopensearch : Win32.DWORD;     --  lmserver.h:402
         sv598_removeduplicatesearches : Win32.DWORD;     --  lmserver.h:403
         sv598_lockviolationoffset : Win32.DWORD;     --  lmserver.h:404
         sv598_lockviolationdelay : Win32.DWORD;     --  lmserver.h:405
         sv598_mdlreadswitchover : Win32.DWORD;     --  lmserver.h:406
         sv598_cachedopenlimit : Win32.DWORD;     --  lmserver.h:407
         sv598_criticalthreads : Win32.DWORD;     --  lmserver.h:408
         sv598_restrictnullsessaccess : Win32.BOOL;      --  lmserver.h:409
         sv598_enablewfw311directipx : Win32.BOOL;      --  lmserver.h:410
         sv598_reserved8 : Win32.DWORD;     --  lmserver.h:411
         sv598_reserved9 : Win32.DWORD;     --  lmserver.h:412
         sv598_reserved10 : Win32.DWORD;     --  lmserver.h:413
      end record;

   type SERVER_INFO_1005 is                                --  lmserver.h:416
      record
         sv1005_comment : Win32.Winnt.LPTSTR;             --  lmserver.h:417
      end record;

   type SERVER_INFO_1107 is                                --  lmserver.h:420
      record
         sv1107_users : Win32.DWORD;                      --  lmserver.h:421
      end record;

   type SERVER_INFO_1010 is                                --  lmserver.h:424
      record
         sv1010_disc : Win32.LONG;                        --  lmserver.h:425
      end record;

   type SERVER_INFO_1016 is                                --  lmserver.h:428
      record
         sv1016_hidden : Win32.BOOL;                      --  lmserver.h:429
      end record;

   type SERVER_INFO_1017 is                                --  lmserver.h:432
      record
         sv1017_announce : Win32.DWORD;                   --  lmserver.h:433
      end record;

   type SERVER_INFO_1018 is                                --  lmserver.h:436
      record
         sv1018_anndelta : Win32.DWORD;                   --  lmserver.h:437
      end record;

   type SERVER_INFO_1501 is                                --  lmserver.h:440
      record
         sv1501_sessopens : Win32.DWORD;                  --  lmserver.h:441
      end record;

   type SERVER_INFO_1502 is                                --  lmserver.h:444
      record
         sv1502_sessvcs : Win32.DWORD;                    --  lmserver.h:445
      end record;

   type SERVER_INFO_1503 is                                --  lmserver.h:448
      record
         sv1503_opensearch : Win32.DWORD;                 --  lmserver.h:449
      end record;

   type SERVER_INFO_1506 is                                --  lmserver.h:452
      record
         sv1506_maxworkitems : Win32.DWORD;               --  lmserver.h:453
      end record;

   type SERVER_INFO_1509 is                                --  lmserver.h:456
      record
         sv1509_maxrawbuflen : Win32.DWORD;               --  lmserver.h:457
      end record;

   type SERVER_INFO_1510 is                                --  lmserver.h:460
      record
         sv1510_sessusers : Win32.DWORD;                  --  lmserver.h:461
      end record;

   type SERVER_INFO_1511 is                                --  lmserver.h:464
      record
         sv1511_sessconns : Win32.DWORD;                  --  lmserver.h:465
      end record;

   type SERVER_INFO_1512 is                                --  lmserver.h:468
      record
         sv1512_maxnonpagedmemoryusage : Win32.DWORD;     --  lmserver.h:469
      end record;

   type SERVER_INFO_1513 is                                --  lmserver.h:472
      record
         sv1513_maxpagedmemoryusage : Win32.DWORD;        --  lmserver.h:473
      end record;

   type SERVER_INFO_1514 is                                --  lmserver.h:476
      record
         sv1514_enablesoftcompat : Win32.BOOL;            --  lmserver.h:477
      end record;

   type SERVER_INFO_1515 is                                --  lmserver.h:480
      record
         sv1515_enableforcedlogoff : Win32.BOOL;          --  lmserver.h:481
      end record;

   type SERVER_INFO_1516 is                                --  lmserver.h:484
      record
         sv1516_timesource : Win32.BOOL;                  --  lmserver.h:485
      end record;

   type SERVER_INFO_1518 is                                --  lmserver.h:488
      record
         sv1518_lmannounce : Win32.BOOL;                  --  lmserver.h:489
      end record;

   type SERVER_INFO_1520 is                                --  lmserver.h:492
      record
         sv1520_maxcopyreadlen : Win32.DWORD;             --  lmserver.h:493
      end record;

   type SERVER_INFO_1521 is                                --  lmserver.h:496
      record
         sv1521_maxcopywritelen : Win32.DWORD;            --  lmserver.h:497
      end record;

   type SERVER_INFO_1522 is                                --  lmserver.h:500
      record
         sv1522_minkeepsearch : Win32.DWORD;              --  lmserver.h:501
      end record;

   type SERVER_INFO_1523 is                                --  lmserver.h:504
      record
         sv1523_maxkeepsearch : Win32.DWORD;              --  lmserver.h:505
      end record;

   type SERVER_INFO_1524 is                                --  lmserver.h:508
      record
         sv1524_minkeepcomplsearch : Win32.DWORD;         --  lmserver.h:509
      end record;

   type SERVER_INFO_1525 is                                --  lmserver.h:512
      record
         sv1525_maxkeepcomplsearch : Win32.DWORD;         --  lmserver.h:513
      end record;

   type SERVER_INFO_1528 is                                --  lmserver.h:516
      record
         sv1528_scavtimeout : Win32.DWORD;                --  lmserver.h:517
      end record;

   type SERVER_INFO_1529 is                                --  lmserver.h:520
      record
         sv1529_minrcvqueue : Win32.DWORD;                --  lmserver.h:521
      end record;

   type SERVER_INFO_1530 is                                --  lmserver.h:524
      record
         sv1530_minfreeworkitems : Win32.DWORD;           --  lmserver.h:525
      end record;

   type SERVER_INFO_1533 is                                --  lmserver.h:528
      record
         sv1533_maxmpxct : Win32.DWORD;                   --  lmserver.h:529
      end record;

   type SERVER_INFO_1534 is                                --  lmserver.h:532
      record
         sv1534_oplockbreakwait : Win32.DWORD;            --  lmserver.h:533
      end record;

   type SERVER_INFO_1535 is                                --  lmserver.h:536
      record
         sv1535_oplockbreakresponsewait : Win32.DWORD;    --  lmserver.h:537
      end record;

   type SERVER_INFO_1536 is                                --  lmserver.h:540
      record
         sv1536_enableoplocks : Win32.BOOL;               --  lmserver.h:541
      end record;

   type SERVER_INFO_1537 is                                --  lmserver.h:544
      record
         sv1537_enableoplockforceclose : Win32.BOOL;      --  lmserver.h:545
      end record;

   type SERVER_INFO_1538 is                                --  lmserver.h:548
      record
         sv1538_enablefcbopens : Win32.BOOL;              --  lmserver.h:549
      end record;

   type SERVER_INFO_1539 is                                --  lmserver.h:552
      record
         sv1539_enableraw : Win32.BOOL;                   --  lmserver.h:553
      end record;

   type SERVER_INFO_1540 is                                --  lmserver.h:556
      record
         sv1540_enablesharednetdrives : Win32.BOOL;       --  lmserver.h:557
      end record;

   type SERVER_INFO_1541 is                                --  lmserver.h:560
      record
         sv1541_minfreeconnections : Win32.BOOL;          --  lmserver.h:561
      end record;

   type SERVER_INFO_1542 is                                --  lmserver.h:564
      record
         sv1542_maxfreeconnections : Win32.BOOL;          --  lmserver.h:565
      end record;

   type SERVER_INFO_1543 is                                --  lmserver.h:568
      record
         sv1543_initsesstable : Win32.DWORD;              --  lmserver.h:569
      end record;

   type SERVER_INFO_1544 is                                --  lmserver.h:572
      record
         sv1544_initconntable : Win32.DWORD;              --  lmserver.h:573
      end record;

   type SERVER_INFO_1545 is                                --  lmserver.h:576
      record
         sv1545_initfiletable : Win32.DWORD;              --  lmserver.h:577
      end record;

   type SERVER_INFO_1546 is                                --  lmserver.h:580
      record
         sv1546_initsearchtable : Win32.DWORD;            --  lmserver.h:581
      end record;

   type SERVER_INFO_1547 is                                --  lmserver.h:584
      record
         sv1547_alertschedule : Win32.DWORD;              --  lmserver.h:585
      end record;

   type SERVER_INFO_1548 is                                --  lmserver.h:588
      record
         sv1548_errorthreshold : Win32.DWORD;             --  lmserver.h:589
      end record;

   type SERVER_INFO_1549 is                                --  lmserver.h:592
      record
         sv1549_networkerrorthreshold : Win32.DWORD;      --  lmserver.h:593
      end record;

   type SERVER_INFO_1550 is                                --  lmserver.h:596
      record
         sv1550_diskspacethreshold : Win32.DWORD;         --  lmserver.h:597
      end record;

   type SERVER_INFO_1552 is                                --  lmserver.h:600
      record
         sv1552_maxlinkdelay : Win32.DWORD;               --  lmserver.h:601
      end record;

   type SERVER_INFO_1553 is                                --  lmserver.h:604
      record
         sv1553_minlinkthroughput : Win32.DWORD;          --  lmserver.h:605
      end record;

   type SERVER_INFO_1554 is                                --  lmserver.h:608
      record
         sv1554_linkinfovalidtime : Win32.DWORD;          --  lmserver.h:609
      end record;

   type SERVER_INFO_1555 is                                --  lmserver.h:612
      record
         sv1555_scavqosinfoupdatetime : Win32.DWORD;      --  lmserver.h:613
      end record;

   type SERVER_INFO_1556 is                                --  lmserver.h:616
      record
         sv1556_maxworkitemidletime : Win32.DWORD;        --  lmserver.h:617
      end record;

   type SERVER_INFO_1557 is                                --  lmserver.h:620
      record
         sv1557_maxrawworkitems : Win32.DWORD;            --  lmserver.h:621
      end record;

   type SERVER_INFO_1558 is                                --  lmserver.h:624
      record
         sv1558_nonblockingthreads : Win32.DWORD;         --  lmserver.h:625
      end record;

   type SERVER_INFO_1559 is                                --  lmserver.h:628
      record
         sv1559_blockingthreads : Win32.DWORD;            --  lmserver.h:629
      end record;

   type SERVER_INFO_1560 is                                --  lmserver.h:632
      record
         sv1560_producttype : Win32.DWORD;                --  lmserver.h:633
      end record;

   type SERVER_INFO_1561 is                                --  lmserver.h:636
      record
         sv1561_serversize : Win32.DWORD;                 --  lmserver.h:637
      end record;

   type SERVER_INFO_1562 is                                --  lmserver.h:640
      record
         sv1562_connectionlessautodisc : Win32.DWORD;     --  lmserver.h:641
      end record;

   type SERVER_INFO_1563 is                                --  lmserver.h:644
      record
         sv1563_sharingviolationretries : Win32.DWORD;    --  lmserver.h:645
      end record;

   type SERVER_INFO_1564 is                                --  lmserver.h:648
      record
         sv1564_sharingviolationdelay : Win32.DWORD;      --  lmserver.h:649
      end record;

   type SERVER_INFO_1565 is                                --  lmserver.h:652
      record
         sv1565_maxglobalopensearch : Win32.DWORD;        --  lmserver.h:653
      end record;

   type SERVER_INFO_1566 is                                --  lmserver.h:656
      record
         sv1566_removeduplicatesearches : Win32.BOOL;     --  lmserver.h:657
      end record;

   type SERVER_INFO_1567 is                                --  lmserver.h:660
      record
         sv1567_lockviolationretries : Win32.DWORD;       --  lmserver.h:661
      end record;

   type SERVER_INFO_1568 is                                --  lmserver.h:664
      record
         sv1568_lockviolationoffset : Win32.DWORD;        --  lmserver.h:665
      end record;

   type SERVER_INFO_1569 is                                --  lmserver.h:668
      record
         sv1569_lockviolationdelay : Win32.DWORD;         --  lmserver.h:669
      end record;

   type SERVER_INFO_1570 is                                --  lmserver.h:672
      record
         sv1570_mdlreadswitchover : Win32.DWORD;          --  lmserver.h:673
      end record;

   type SERVER_INFO_1571 is                                --  lmserver.h:676
      record
         sv1571_cachedopenlimit : Win32.DWORD;            --  lmserver.h:677
      end record;

   type SERVER_INFO_1572 is                                --  lmserver.h:680
      record
         sv1572_criticalthreads : Win32.DWORD;            --  lmserver.h:681
      end record;

   type SERVER_INFO_1573 is                                --  lmserver.h:684
      record
         sv1573_restrictnullsessaccess : Win32.DWORD;     --  lmserver.h:685
      end record;

   type SERVER_INFO_1574 is                                --  lmserver.h:688
      record
         sv1574_enablewfw311directipx : Win32.DWORD;      --  lmserver.h:689
      end record;

   type SERVER_TRANSPORT_INFO_0 is                         --  lmserver.h:711
      record
         svti0_numberofvcs : Win32.DWORD;      --  lmserver.h:712
         svti0_transportname : Win32.Winnt.LPTSTR;
         --  lmserver.h:713
         svti0_transportaddress : Win32.LPBYTE;     --  lmserver.h:714
         svti0_transportaddresslength : Win32.DWORD;      --  lmserver.h:715
         svti0_networkaddress : Win32.Winnt.LPTSTR;
         --  lmserver.h:716
      end record;

   function NetServerEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      servertype : Win32.DWORD;
      domain : Win32.Winnt.LPTSTR;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmserver.h:76

   function NetServerGetInfo
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmserver.h:89

   function NetServerSetInfo
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      ParmError : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmserver.h:96

   function NetServerSetInfoCommandLine
     (argc : Win32.WORD;
      argv : Win32.String_Vector_Access)
     return Win32.DWORD;                          --  lmserver.h:108

   function NetServerDiskEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmserver.h:114

   function NetServerTransportAdd
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : Win32.LPBYTE)
     return Win32.DWORD;                          --  lmserver.h:125

   function NetServerTransportDel
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : Win32.LPBYTE)
     return Win32.DWORD;                          --  lmserver.h:132

   function NetServerTransportEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmserver.h:139

   function SetServiceBits
     (hServiceStatus : Win32.Winsvc.SERVICE_STATUS_HANDLE;
      dwServiceBits : Win32.DWORD;
      bSetBitsOn : Win32.BOOL;
      bUpdateImmediately : Win32.BOOL)
     return Win32.BOOL;                           --  lmserver.h:156

private

   pragma Convention (c_pass_by_copy, SERVER_INFO_100);     --  lmserver.h:167
   pragma Convention (C, SERVER_INFO_101);                  --  lmserver.h:172
   pragma Convention (C, SERVER_INFO_102);                  --  lmserver.h:181
   pragma Convention (C, SERVER_INFO_402);                  --  lmserver.h:197
   pragma Convention (C, SERVER_INFO_403);                  --  lmserver.h:231
   pragma Convention (C, SERVER_INFO_502);                  --  lmserver.h:268
   pragma Convention (C, SERVER_INFO_503);                  --  lmserver.h:289
   pragma Convention (C, SERVER_INFO_599);                  --  lmserver.h:334
   pragma Convention (C, SERVER_INFO_598);                  --  lmserver.h:393
   pragma Convention (c_pass_by_copy, SERVER_INFO_1005);    --  lmserver.h:416
   pragma Convention (c_pass_by_copy, SERVER_INFO_1107);    --  lmserver.h:420
   pragma Convention (c_pass_by_copy, SERVER_INFO_1010);    --  lmserver.h:424
   pragma Convention (c_pass_by_copy, SERVER_INFO_1016);    --  lmserver.h:428
   pragma Convention (c_pass_by_copy, SERVER_INFO_1017);    --  lmserver.h:432
   pragma Convention (c_pass_by_copy, SERVER_INFO_1018);    --  lmserver.h:436
   pragma Convention (c_pass_by_copy, SERVER_INFO_1501);    --  lmserver.h:440
   pragma Convention (c_pass_by_copy, SERVER_INFO_1502);    --  lmserver.h:444
   pragma Convention (c_pass_by_copy, SERVER_INFO_1503);    --  lmserver.h:448
   pragma Convention (c_pass_by_copy, SERVER_INFO_1506);    --  lmserver.h:452
   pragma Convention (c_pass_by_copy, SERVER_INFO_1509);    --  lmserver.h:456
   pragma Convention (c_pass_by_copy, SERVER_INFO_1510);    --  lmserver.h:460
   pragma Convention (c_pass_by_copy, SERVER_INFO_1511);    --  lmserver.h:464
   pragma Convention (c_pass_by_copy, SERVER_INFO_1512);    --  lmserver.h:468
   pragma Convention (c_pass_by_copy, SERVER_INFO_1513);    --  lmserver.h:472
   pragma Convention (c_pass_by_copy, SERVER_INFO_1514);    --  lmserver.h:476
   pragma Convention (c_pass_by_copy, SERVER_INFO_1515);    --  lmserver.h:480
   pragma Convention (c_pass_by_copy, SERVER_INFO_1516);    --  lmserver.h:484
   pragma Convention (c_pass_by_copy, SERVER_INFO_1518);    --  lmserver.h:488
   pragma Convention (c_pass_by_copy, SERVER_INFO_1520);    --  lmserver.h:492
   pragma Convention (c_pass_by_copy, SERVER_INFO_1521);    --  lmserver.h:496
   pragma Convention (c_pass_by_copy, SERVER_INFO_1522);    --  lmserver.h:500
   pragma Convention (c_pass_by_copy, SERVER_INFO_1523);    --  lmserver.h:504
   pragma Convention (c_pass_by_copy, SERVER_INFO_1524);    --  lmserver.h:508
   pragma Convention (c_pass_by_copy, SERVER_INFO_1525);    --  lmserver.h:512
   pragma Convention (c_pass_by_copy, SERVER_INFO_1528);    --  lmserver.h:516
   pragma Convention (c_pass_by_copy, SERVER_INFO_1529);    --  lmserver.h:520
   pragma Convention (c_pass_by_copy, SERVER_INFO_1530);    --  lmserver.h:524
   pragma Convention (c_pass_by_copy, SERVER_INFO_1533);    --  lmserver.h:528
   pragma Convention (c_pass_by_copy, SERVER_INFO_1534);    --  lmserver.h:532
   pragma Convention (c_pass_by_copy, SERVER_INFO_1535);    --  lmserver.h:536
   pragma Convention (c_pass_by_copy, SERVER_INFO_1536);    --  lmserver.h:540
   pragma Convention (c_pass_by_copy, SERVER_INFO_1537);    --  lmserver.h:544
   pragma Convention (c_pass_by_copy, SERVER_INFO_1538);    --  lmserver.h:548
   pragma Convention (c_pass_by_copy, SERVER_INFO_1539);    --  lmserver.h:552
   pragma Convention (c_pass_by_copy, SERVER_INFO_1540);    --  lmserver.h:556
   pragma Convention (c_pass_by_copy, SERVER_INFO_1541);    --  lmserver.h:560
   pragma Convention (c_pass_by_copy, SERVER_INFO_1542);    --  lmserver.h:564
   pragma Convention (c_pass_by_copy, SERVER_INFO_1543);    --  lmserver.h:568
   pragma Convention (c_pass_by_copy, SERVER_INFO_1544);    --  lmserver.h:572
   pragma Convention (c_pass_by_copy, SERVER_INFO_1545);    --  lmserver.h:576
   pragma Convention (c_pass_by_copy, SERVER_INFO_1546);    --  lmserver.h:580
   pragma Convention (c_pass_by_copy, SERVER_INFO_1547);    --  lmserver.h:584
   pragma Convention (c_pass_by_copy, SERVER_INFO_1548);    --  lmserver.h:588
   pragma Convention (c_pass_by_copy, SERVER_INFO_1549);    --  lmserver.h:592
   pragma Convention (c_pass_by_copy, SERVER_INFO_1550);    --  lmserver.h:596
   pragma Convention (c_pass_by_copy, SERVER_INFO_1552);    --  lmserver.h:600
   pragma Convention (c_pass_by_copy, SERVER_INFO_1553);    --  lmserver.h:604
   pragma Convention (c_pass_by_copy, SERVER_INFO_1554);    --  lmserver.h:608
   pragma Convention (c_pass_by_copy, SERVER_INFO_1555);    --  lmserver.h:612
   pragma Convention (c_pass_by_copy, SERVER_INFO_1556);    --  lmserver.h:616
   pragma Convention (c_pass_by_copy, SERVER_INFO_1557);    --  lmserver.h:620
   pragma Convention (c_pass_by_copy, SERVER_INFO_1558);    --  lmserver.h:624
   pragma Convention (c_pass_by_copy, SERVER_INFO_1559);    --  lmserver.h:628
   pragma Convention (c_pass_by_copy, SERVER_INFO_1560);    --  lmserver.h:632
   pragma Convention (c_pass_by_copy, SERVER_INFO_1561);    --  lmserver.h:636
   pragma Convention (c_pass_by_copy, SERVER_INFO_1562);    --  lmserver.h:640
   pragma Convention (c_pass_by_copy, SERVER_INFO_1563);    --  lmserver.h:644
   pragma Convention (c_pass_by_copy, SERVER_INFO_1564);    --  lmserver.h:648
   pragma Convention (c_pass_by_copy, SERVER_INFO_1565);    --  lmserver.h:652
   pragma Convention (c_pass_by_copy, SERVER_INFO_1566);    --  lmserver.h:656
   pragma Convention (c_pass_by_copy, SERVER_INFO_1567);    --  lmserver.h:660
   pragma Convention (c_pass_by_copy, SERVER_INFO_1568);    --  lmserver.h:664
   pragma Convention (c_pass_by_copy, SERVER_INFO_1569);    --  lmserver.h:668
   pragma Convention (c_pass_by_copy, SERVER_INFO_1570);    --  lmserver.h:672
   pragma Convention (c_pass_by_copy, SERVER_INFO_1571);    --  lmserver.h:676
   pragma Convention (c_pass_by_copy, SERVER_INFO_1572);    --  lmserver.h:680
   pragma Convention (c_pass_by_copy, SERVER_INFO_1573);    --  lmserver.h:684
   pragma Convention (c_pass_by_copy, SERVER_INFO_1574);    --  lmserver.h:688
   pragma Convention (C, SERVER_TRANSPORT_INFO_0);          --  lmserver.h:711

   pragma Import (Stdcall, NetServerEnum, "NetServerEnum"); --  lmserver.h:76
   pragma Import (Stdcall, NetServerGetInfo, "NetServerGetInfo");
   --  lmserver.h:89
   pragma Import (Stdcall, NetServerSetInfo, "NetServerSetInfo");
   --  lmserver.h:96
   pragma Import (Stdcall, NetServerSetInfoCommandLine,
                    "NetServerSetInfoCommandLine");        --  lmserver.h:108
   pragma Import (Stdcall, NetServerDiskEnum, "NetServerDiskEnum");
   --  lmserver.h:114
   pragma Import (Stdcall, NetServerTransportAdd, "NetServerTransportAdd");
   --  lmserver.h:125
   pragma Import (Stdcall, NetServerTransportDel, "NetServerTransportDel");
   --  lmserver.h:132
   pragma Import (Stdcall, NetServerTransportEnum, "NetServerTransportEnum");
   --  lmserver.h:139
   pragma Import (Stdcall, SetServiceBits, "SetServiceBits");
   --  lmserver.h:156

end Win32.Lmserver;
