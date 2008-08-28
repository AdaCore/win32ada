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

with Win32.Lmcons;
with Win32.Winnt;

package Win32.Lmaccess is

   use Interfaces;
   use type Interfaces.C.char_array;

   UF_SCRIPT : constant := 16#1#;    --  lmaccess.h:468
   UF_ACCOUNTDISABLE : constant := 16#2#;    --  lmaccess.h:469
   UF_HOMEDIR_REQUIRED : constant := 16#8#;    --  lmaccess.h:470
   UF_LOCKOUT : constant := 16#10#;   --  lmaccess.h:471
   UF_PASSWD_NOTREQD : constant := 16#20#;   --  lmaccess.h:472
   UF_PASSWD_CANT_CHANGE : constant := 16#40#;   --  lmaccess.h:473
   UF_TEMP_DUPLICATE_ACCOUNT : constant := 16#100#;  --  lmaccess.h:479
   UF_NORMAL_ACCOUNT : constant := 16#200#;  --  lmaccess.h:480
   UF_INTERDOMAIN_TRUST_ACCOUNT : constant := 16#800#;  --  lmaccess.h:481
   UF_WORKSTATION_TRUST_ACCOUNT : constant := 16#1000#; --  lmaccess.h:482
   UF_SERVER_TRUST_ACCOUNT : constant := 16#2000#; --  lmaccess.h:483
   UF_MACHINE_ACCOUNT_MASK : constant := 16#3800#; --  lmaccess.h:485
   UF_ACCOUNT_TYPE_MASK : constant := 16#3b00#; --  lmaccess.h:489
   UF_DONT_EXPIRE_PASSWD : constant := 16#10000#; --  lmaccess.h:497
   UF_SETTABLE_BITS : constant := 16#13b7b#; --  lmaccess.h:500
   FILTER_TEMP_DUPLICATE_ACCOUNT : constant := 16#1#;    --  lmaccess.h:515
   FILTER_NORMAL_ACCOUNT : constant := 16#2#;    --  lmaccess.h:516
   FILTER_INTERDOMAIN_TRUST_ACCOUNT : constant := 16#8#;    --  lmaccess.h:518
   FILTER_WORKSTATION_TRUST_ACCOUNT : constant := 16#10#;   --  lmaccess.h:519
   FILTER_SERVER_TRUST_ACCOUNT : constant := 16#20#;   --  lmaccess.h:520
   LG_INCLUDE_INDIRECT : constant := 16#1#;    --  lmaccess.h:525
   AF_OP_PRINT                   : constant := 16#1#; --  lmaccess.h     :531
   AF_OP_COMM                    : constant := 16#2#; --  lmaccess.h     :532
   AF_OP_SERVER                  : constant := 16#4#; --  lmaccess.h     :533
   AF_OP_ACCOUNTS                : constant := 16#8#; --  lmaccess.h     :534
   AF_SETTABLE_BITS              : constant := 16#f#; --  lmaccess.h     :535
   UAS_ROLE_STANDALONE           : constant := 0;     --  lmaccess.h :542
   UAS_ROLE_MEMBER               : constant := 1;     --  lmaccess.h :543
   UAS_ROLE_BACKUP               : constant := 2;     --  lmaccess.h :544
   UAS_ROLE_PRIMARY              : constant := 3;     --  lmaccess.h :545
   USER_NAME_PARMNUM             : constant := 1;     --  lmaccess.h :551
   USER_PASSWORD_PARMNUM         : constant := 3;     --  lmaccess.h :552
   USER_PASSWORD_AGE_PARMNUM     : constant := 4;     --  lmaccess.h :553
   USER_PRIV_PARMNUM             : constant := 5;     --  lmaccess.h     :554
   USER_HOME_DIR_PARMNUM         : constant := 6;     --  lmaccess.h     :555
   USER_COMMENT_PARMNUM          : constant := 7;     --  lmaccess.h     :556
   USER_FLAGS_PARMNUM            : constant := 8;     --  lmaccess.h     :557
   USER_SCRIPT_PATH_PARMNUM      : constant := 9;     --  lmaccess.h     :558
   USER_AUTH_FLAGS_PARMNUM       : constant := 10;    --  lmaccess.h     :559
   USER_FULL_NAME_PARMNUM        : constant := 11;    --  lmaccess.h     :560
   USER_USR_COMMENT_PARMNUM      : constant := 12;    --  lmaccess.h     :561
   USER_PARMS_PARMNUM            : constant := 13;    --  lmaccess.h     :562
   USER_WORKSTATIONS_PARMNUM     : constant := 14;    --  lmaccess.h     :563
   USER_LAST_LOGON_PARMNUM       : constant := 15;    --  lmaccess.h     :564
   USER_LAST_LOGOFF_PARMNUM      : constant := 16;    --  lmaccess.h     :565
   USER_ACCT_EXPIRES_PARMNUM     : constant := 17;    --  lmaccess.h     :566
   USER_MAX_STORAGE_PARMNUM      : constant := 18;    --  lmaccess.h     :567
   USER_UNITS_PER_WEEK_PARMNUM   : constant := 19;    --  lmaccess.h     :568
   USER_LOGON_HOURS_PARMNUM      : constant := 20;    --  lmaccess.h     :569
   USER_PAD_PW_COUNT_PARMNUM     : constant := 21;    --  lmaccess.h     :570
   USER_NUM_LOGONS_PARMNUM       : constant := 22;    --  lmaccess.h     :571
   USER_LOGON_SERVER_PARMNUM     : constant := 23;    --  lmaccess.h     :572
   USER_COUNTRY_CODE_PARMNUM     : constant := 24;    --  lmaccess.h     :573
   USER_CODE_PAGE_PARMNUM        : constant := 25;    --  lmaccess.h     :574
   USER_PRIMARY_GROUP_PARMNUM    : constant := 51;    --  lmaccess.h     :575
   USER_PROFILE                  : constant := 52;    --  lmaccess.h     :576
   USER_PROFILE_PARMNUM          : constant := 52;    --  lmaccess.h     :577
   USER_HOME_DIR_DRIVE_PARMNUM   : constant := 53;    --  lmaccess.h     :578
   USER_NAME_INFOLEVEL           : constant := 1001;  --  lmaccess.h     :584
   USER_PASSWORD_INFOLEVEL       : constant := 1003;  --  lmaccess.h     :586
   USER_PASSWORD_AGE_INFOLEVEL   : constant := 1004;  --  lmaccess.h     :588
   USER_PRIV_INFOLEVEL           : constant := 1005;  --  lmaccess.h     :590
   USER_HOME_DIR_INFOLEVEL       : constant := 1006;  --  lmaccess.h     :592
   USER_COMMENT_INFOLEVEL        : constant := 1007;  --  lmaccess.h     :594
   USER_FLAGS_INFOLEVEL          : constant := 1008;  --  lmaccess.h     :596
   USER_SCRIPT_PATH_INFOLEVEL    : constant := 1009;  --  lmaccess.h     :598
   USER_AUTH_FLAGS_INFOLEVEL     : constant := 1010;  --  lmaccess.h     :600
   USER_FULL_NAME_INFOLEVEL      : constant := 1011;  --  lmaccess.h     :602
   USER_USR_COMMENT_INFOLEVEL    : constant := 1012;  --  lmaccess.h     :604
   USER_PARMS_INFOLEVEL          : constant := 1013;  --  lmaccess.h     :606
   USER_WORKSTATIONS_INFOLEVEL   : constant := 1014;  --  lmaccess.h     :608
   USER_LAST_LOGON_INFOLEVEL     : constant := 1015;  --  lmaccess.h     :610
   USER_LAST_LOGOFF_INFOLEVEL    : constant := 1016;  --  lmaccess.h     :612
   USER_ACCT_EXPIRES_INFOLEVEL   : constant := 1017;  --  lmaccess.h     :614
   USER_MAX_STORAGE_INFOLEVEL    : constant := 1018;  --  lmaccess.h     :616
   USER_UNITS_PER_WEEK_INFOLEVEL : constant := 1019;  --  lmaccess.h     :618
   USER_LOGON_HOURS_INFOLEVEL    : constant := 1020;  --  lmaccess.h     :620
   USER_PAD_PW_COUNT_INFOLEVEL   : constant := 1021;  --  lmaccess.h     :622
   USER_NUM_LOGONS_INFOLEVEL     : constant := 1022;  --  lmaccess.h     :624
   USER_LOGON_SERVER_INFOLEVEL   : constant := 1023;  --  lmaccess.h     :626
   USER_COUNTRY_CODE_INFOLEVEL   : constant := 1024;  --  lmaccess.h     :628
   USER_CODE_PAGE_INFOLEVEL      : constant := 1025;  --  lmaccess.h     :630
   USER_PRIMARY_GROUP_INFOLEVEL  : constant := 1051;  --  lmaccess.h     :632
   USER_HOME_DIR_DRIVE_INFOLEVEL : constant := 1053;  --  lmaccess.h     :636
   NULL_USERSETINFO_PASSWD : constant CHAR_Array :=
     "              " & Nul; --  lmaccess.h:643
   TIMEQ_FOREVER : constant Win32.ULONG := Win32.ULONG'Last;
   --  lmaccess.h:645
   USER_MAXSTORAGE_UNLIMITED : constant Win32.ULONG := Win32.ULONG'Last;
   --  lmaccess.h:646
   USER_NO_LOGOFF : constant Win32.ULONG := Win32.ULONG'Last;
   --  lmaccess.h:647
   UNITS_PER_DAY : constant := 24;       --  lmaccess.h:648
   UNITS_PER_WEEK : constant := 168;      --  lmaccess.h:649
   USER_PRIV_MASK : constant := 16#3#;    --  lmaccess.h:655
   USER_PRIV_GUEST : constant := 0;        --  lmaccess.h:656
   USER_PRIV_USER : constant := 1;        --  lmaccess.h:657
   USER_PRIV_ADMIN : constant := 2;        --  lmaccess.h:658
   MAX_PASSWD_LEN : constant := 256;      --  lmaccess.h:664
   DEF_MIN_PWLEN : constant := 6;        --  lmaccess.h:665
   DEF_PWUNIQUENESS : constant := 5;        --  lmaccess.h:666
   DEF_MAX_PWHIST : constant := 8;        --  lmaccess.h:667
   DEF_MIN_PWAGE : constant Win32.ULONG := 0;
   --  lmaccess.h:670
   DEF_FORCE_LOGOFF : constant Win32.ULONG := 16#ffffffff#;
   --  lmaccess.h:671
   DEF_MAX_BADPW : constant := 0;        --  lmaccess.h:672
   ONE_DAY : constant Win32.ULONG := 8#250600#;
   --  lmaccess.h:673
   VALIDATED_LOGON : constant := 0;        --  lmaccess.h:679
   PASSWORD_EXPIRED : constant := 2;        --  lmaccess.h:680
   NON_VALIDATED_LOGON : constant := 3;        --  lmaccess.h:681
   VALID_LOGOFF : constant := 1;        --  lmaccess.h:683
   MODALS_MIN_PASSWD_LEN_PARMNUM : constant := 1;        --  lmaccess.h:689
   MODALS_MAX_PASSWD_AGE_PARMNUM : constant := 2;        --  lmaccess.h:690
   MODALS_MIN_PASSWD_AGE_PARMNUM : constant := 3;        --  lmaccess.h:691
   MODALS_FORCE_LOGOFF_PARMNUM : constant := 4;        --  lmaccess.h:692
   MODALS_PASSWD_HIST_LEN_PARMNUM : constant := 5;        --  lmaccess.h:693
   MODALS_ROLE_PARMNUM : constant := 6;        --  lmaccess.h:694
   MODALS_PRIMARY_PARMNUM : constant := 7;        --  lmaccess.h:695
   MODALS_DOMAIN_NAME_PARMNUM : constant := 8;        --  lmaccess.h:696
   MODALS_DOMAIN_ID_PARMNUM : constant := 9;        --  lmaccess.h:697
   MODALS_LOCKOUT_DURATION_PARMNUM : constant := 10;       --  lmaccess.h:698
   MODALS_LOCKOUT_OBSERVATION_WINDOW_PARMNUM : constant := 11;
   --  lmaccess.h:699
   MODALS_LOCKOUT_THRESHOLD_PARMNUM : constant := 12;       --  lmaccess.h:700
   MODALS_MIN_PASSWD_LEN_INFOLEVEL : constant := 1001;     --  lmaccess.h:706
   MODALS_MAX_PASSWD_AGE_INFOLEVEL : constant := 1002;     --  lmaccess.h:708
   MODALS_MIN_PASSWD_AGE_INFOLEVEL : constant := 1003;     --  lmaccess.h:710
   MODALS_FORCE_LOGOFF_INFOLEVEL : constant := 1004;     --  lmaccess.h:712
   MODALS_PASSWD_HIST_LEN_INFOLEVEL : constant := 1005;     --  lmaccess.h:714
   MODALS_ROLE_INFOLEVEL : constant := 1006;     --  lmaccess.h:716
   MODALS_PRIMARY_INFOLEVEL : constant := 1007;     --  lmaccess.h:718
   MODALS_DOMAIN_NAME_INFOLEVEL : constant := 1008;     --  lmaccess.h:720
   MODALS_DOMAIN_ID_INFOLEVEL : constant := 1009;     --  lmaccess.h:722
   GROUPIDMASK : constant := 16#8000#; --  lmaccess.h:857
   GROUP_SPECIALGRP_USERS : constant WCHAR_Array :=
     To_Win (C.To_C ("USERS")) & Wide_Nul; --  lmaccess.h:865
   GROUP_SPECIALGRP_ADMINS : constant WCHAR_Array :=
     To_Win (C.To_C ("ADMINS")) & Wide_Nul; --  lmaccess.h:866
   GROUP_SPECIALGRP_GUESTS : constant WCHAR_Array :=
     To_Win (C.To_C ("GUESTS")) & Wide_Nul; --  lmaccess.h:867
   GROUP_SPECIALGRP_LOCAL : constant WCHAR_Array :=
     To_Win (C.To_C ("LOCAL")) & Wide_Nul; --  lmaccess.h:868
   GROUP_ALL_PARMNUM : constant := 0;        --  lmaccess.h:874
   GROUP_NAME_PARMNUM : constant := 1;        --  lmaccess.h:875
   GROUP_COMMENT_PARMNUM : constant := 2;        --  lmaccess.h:876
   GROUP_ATTRIBUTES_PARMNUM : constant := 3;        --  lmaccess.h:877
   GROUP_ALL_INFOLEVEL : constant := 1000;     --  lmaccess.h:883
   GROUP_NAME_INFOLEVEL : constant := 1001;     --  lmaccess.h:885
   GROUP_COMMENT_INFOLEVEL : constant := 1002;     --  lmaccess.h:887
   GROUP_ATTRIBUTES_INFOLEVEL : constant := 1003;     --  lmaccess.h:889
   LOCALGROUP_NAME_PARMNUM : constant := 1;        --  lmaccess.h:1019
   LOCALGROUP_COMMENT_PARMNUM : constant := 2;        --  lmaccess.h:1020
   MAXPERMENTRIES : constant := 64;       --  lmaccess.h:1136
   ACCESS_NONE : constant := 0;        --  lmaccess.h:1144
   ACCESS_ALL : constant := 16#7f#;   --  lmaccess.h:1145
   ACCESS_READ : constant := 16#1#;    --  lmaccess.h:1154
   ACCESS_WRITE : constant := 16#2#;    --  lmaccess.h:1155
   ACCESS_CREATE : constant := 16#4#;    --  lmaccess.h:1156
   ACCESS_EXEC : constant := 16#8#;    --  lmaccess.h:1157
   ACCESS_DELETE : constant := 16#10#;   --  lmaccess.h:1158
   ACCESS_ATRIB : constant := 16#20#;   --  lmaccess.h:1159
   ACCESS_PERM : constant := 16#40#;   --  lmaccess.h:1160
   ACCESS_GROUP : constant := 16#8000#; --  lmaccess.h:1162
   ACCESS_AUDIT : constant := 16#1#;    --  lmaccess.h:1168
   ACCESS_SUCCESS_OPEN : constant := 16#10#;   --  lmaccess.h:1170
   ACCESS_SUCCESS_WRITE : constant := 16#20#;   --  lmaccess.h:1171
   ACCESS_SUCCESS_DELETE : constant := 16#40#;   --  lmaccess.h:1172
   ACCESS_SUCCESS_ACL : constant := 16#80#;   --  lmaccess.h:1173
   ACCESS_SUCCESS_MASK : constant := 16#f0#;   --  lmaccess.h:1174
   ACCESS_FAIL_OPEN : constant := 16#100#;  --  lmaccess.h:1176
   ACCESS_FAIL_WRITE : constant := 16#200#;  --  lmaccess.h:1177
   ACCESS_FAIL_DELETE : constant := 16#400#;  --  lmaccess.h:1178
   ACCESS_FAIL_ACL : constant := 16#800#;  --  lmaccess.h:1179
   ACCESS_FAIL_MASK : constant := 16#f00#;  --  lmaccess.h:1180
   ACCESS_FAIL_SHIFT : constant := 4;        --  lmaccess.h:1182
   ACCESS_RESOURCE_NAME_PARMNUM : constant := 1;        --  lmaccess.h:1188
   ACCESS_ATTR_PARMNUM : constant := 2;        --  lmaccess.h:1189
   ACCESS_COUNT_PARMNUM : constant := 3;        --  lmaccess.h:1190
   ACCESS_ACCESS_LIST_PARMNUM : constant := 4;        --  lmaccess.h:1191
   ACCESS_RESOURCE_NAME_INFOLEVEL : constant := 1001;     --  lmaccess.h:1197
   ACCESS_ATTR_INFOLEVEL : constant := 1002;     --  lmaccess.h:1199
   ACCESS_COUNT_INFOLEVEL : constant := 1003;     --  lmaccess.h:1201
   ACCESS_ACCESS_LIST_INFOLEVEL : constant := 1004;     --  lmaccess.h:1203
   ACCESS_LETTERS : constant CHAR_Array :=
     "RWCXDAP         " & Nul;
   --  lmaccess.h:1212
   NETLOGON_CONTROL_QUERY : constant := 1;        --  lmaccess.h:1272
   NETLOGON_CONTROL_REPLICATE : constant := 2;        --  lmaccess.h:1273
   NETLOGON_CONTROL_SYNCHRONIZE : constant := 3;        --  lmaccess.h:1274
   NETLOGON_CONTROL_PDC_REPLICATE : constant := 4;        --  lmaccess.h:1275
   NETLOGON_CONTROL_REDISCOVER : constant := 5;        --  lmaccess.h:1276
   NETLOGON_CONTROL_TC_QUERY : constant := 6;        --  lmaccess.h:1277
   NETLOGON_CONTROL_BACKUP_CHANGE_LOG : constant := 16#fffc#;
   --  lmaccess.h:1281
   NETLOGON_CONTROL_TRUNCATE_LOG : constant := 16#fffd#; --  lmaccess.h:1282
   NETLOGON_CONTROL_SET_DBFLAG : constant := 16#fffe#; --  lmaccess.h:1283
   NETLOGON_CONTROL_BREAKPOINT : constant := 16#ffff#; --  lmaccess.h:1284
   NETLOGON_REPLICATION_NEEDED : constant := 16#1#;    --  lmaccess.h:1310
   NETLOGON_REPLICATION_IN_PROGRESS : constant := 16#2#;    --  lmaccess.h:1311
   NETLOGON_FULL_SYNC_REPLICATION : constant := 16#4#;    --  lmaccess.h:1312
   NETLOGON_REDO_NEEDED : constant := 16#8#;    --  lmaccess.h:1313

   type USER_INFO_0;                                       --  lmaccess.h:178
   type USER_INFO_1;                                       --  lmaccess.h:182
   type USER_INFO_2;                                       --  lmaccess.h:193
   type USER_INFO_3;                                       --  lmaccess.h:220
   type USER_INFO_10;                                      --  lmaccess.h:252
   type USER_INFO_11;                                      --  lmaccess.h:259
   type USER_INFO_20;                                      --  lmaccess.h:282
   type USER_INFO_21;                                      --  lmaccess.h:290
   type USER_INFO_22;                                      --  lmaccess.h:294
   type USER_INFO_1003;                                    --  lmaccess.h:321
   type USER_INFO_1005;                                    --  lmaccess.h:325
   type USER_INFO_1006;                                    --  lmaccess.h:329
   type USER_INFO_1007;                                    --  lmaccess.h:333
   type USER_INFO_1008;                                    --  lmaccess.h:337
   type USER_INFO_1009;                                    --  lmaccess.h:341
   type USER_INFO_1010;                                    --  lmaccess.h:345
   type USER_INFO_1011;                                    --  lmaccess.h:349
   type USER_INFO_1012;                                    --  lmaccess.h:353
   type USER_INFO_1013;                                    --  lmaccess.h:357
   type USER_INFO_1014;                                    --  lmaccess.h:361
   type USER_INFO_1017;                                    --  lmaccess.h:365
   type USER_INFO_1018;                                    --  lmaccess.h:369
   type USER_INFO_1020;                                    --  lmaccess.h:373
   type USER_INFO_1023;                                    --  lmaccess.h:378
   type USER_INFO_1024;                                    --  lmaccess.h:382
   type USER_INFO_1025;                                    --  lmaccess.h:386
   type USER_INFO_1051;                                    --  lmaccess.h:390
   type USER_INFO_1052;                                    --  lmaccess.h:394
   type USER_INFO_1053;                                    --  lmaccess.h:398
   type USER_MODALS_INFO_0;                                --  lmaccess.h:407
   type USER_MODALS_INFO_1;                                --  lmaccess.h:415
   type USER_MODALS_INFO_2;                                --  lmaccess.h:420
   type USER_MODALS_INFO_3;                                --  lmaccess.h:425
   type USER_MODALS_INFO_1001;                             --  lmaccess.h:431
   type USER_MODALS_INFO_1002;                             --  lmaccess.h:435
   type USER_MODALS_INFO_1003;                             --  lmaccess.h:439
   type USER_MODALS_INFO_1004;                             --  lmaccess.h:443
   type USER_MODALS_INFO_1005;                             --  lmaccess.h:447
   type USER_MODALS_INFO_1006;                             --  lmaccess.h:451
   type USER_MODALS_INFO_1007;                             --  lmaccess.h:455
   type GROUP_INFO_0;                                      --  lmaccess.h:819
   type GROUP_INFO_1;                                      --  lmaccess.h:823
   type GROUP_INFO_2;                                      --  lmaccess.h:828
   type GROUP_INFO_1002;                                   --  lmaccess.h:835
   type GROUP_INFO_1005;                                   --  lmaccess.h:839
   type GROUP_USERS_INFO_0;                                --  lmaccess.h:844
   type GROUP_USERS_INFO_1;                                --  lmaccess.h:848
   type LOCALGROUP_INFO_0;                                 --  lmaccess.h:988
   type LOCALGROUP_INFO_1;                                 --  lmaccess.h:992
   type LOCALGROUP_INFO_1002;                              --  lmaccess.h:997
   type LOCALGROUP_MEMBERS_INFO_0;                         --  lmaccess.h:1001
   type LOCALGROUP_MEMBERS_INFO_1;                         --  lmaccess.h:1006
   type LOCALGROUP_USERS_INFO_0;                           --  lmaccess.h:1013
   type ACCESS_INFO_0;                                     --  lmaccess.h:1108
   type ACCESS_INFO_1;                                     --  lmaccess.h:1112
   type ACCESS_INFO_1002;                                  --  lmaccess.h:1118
   type ACCESS_LIST;                                       --  lmaccess.h:1123
   type NETLOGON_INFO_1;                                   --  lmaccess.h:1290
   type NETLOGON_INFO_2;                                   --  lmaccess.h:1295


   type PUSER_INFO_0 is access all USER_INFO_0;            --  lmaccess.h:180
   subtype LPUSER_INFO_0 is PUSER_INFO_0;                  --  lmaccess.h:180

   type PUSER_INFO_1 is access all USER_INFO_1;            --  lmaccess.h:191
   subtype LPUSER_INFO_1 is PUSER_INFO_1;                  --  lmaccess.h:191

   type PUSER_INFO_2 is access all USER_INFO_2;            --  lmaccess.h:218
   subtype LPUSER_INFO_2 is PUSER_INFO_2;                  --  lmaccess.h:218

   type PUSER_INFO_3 is access all USER_INFO_3;            --  lmaccess.h:250
   subtype LPUSER_INFO_3 is PUSER_INFO_3;                  --  lmaccess.h:250

   type PUSER_INFO_10 is access all USER_INFO_10;          --  lmaccess.h:257
   subtype LPUSER_INFO_10 is PUSER_INFO_10;                --  lmaccess.h:257

   type PUSER_INFO_11 is access all USER_INFO_11;          --  lmaccess.h:280
   subtype LPUSER_INFO_11 is PUSER_INFO_11;                --  lmaccess.h:280

   type PUSER_INFO_20 is access all USER_INFO_20;          --  lmaccess.h:288
   subtype LPUSER_INFO_20 is PUSER_INFO_20;                --  lmaccess.h:288

   type PUSER_INFO_21 is access all USER_INFO_21;          --  lmaccess.h:292
   subtype LPUSER_INFO_21 is PUSER_INFO_21;                --  lmaccess.h:292

   type PUSER_INFO_22 is access all USER_INFO_22;          --  lmaccess.h:319
   subtype LPUSER_INFO_22 is PUSER_INFO_22;                --  lmaccess.h:319

   type PUSER_INFO_1003 is access all USER_INFO_1003;      --  lmaccess.h:323
   subtype LPUSER_INFO_1003 is PUSER_INFO_1003;            --  lmaccess.h:323

   type PUSER_INFO_1005 is access all USER_INFO_1005;      --  lmaccess.h:327
   subtype LPUSER_INFO_1005 is PUSER_INFO_1005;            --  lmaccess.h:327

   type PUSER_INFO_1006 is access all USER_INFO_1006;      --  lmaccess.h:331
   subtype LPUSER_INFO_1006 is PUSER_INFO_1006;            --  lmaccess.h:331

   type PUSER_INFO_1007 is access all USER_INFO_1007;      --  lmaccess.h:335
   subtype LPUSER_INFO_1007 is PUSER_INFO_1007;            --  lmaccess.h:335

   type PUSER_INFO_1008 is access all USER_INFO_1008;      --  lmaccess.h:339
   subtype LPUSER_INFO_1008 is PUSER_INFO_1008;            --  lmaccess.h:339

   type PUSER_INFO_1009 is access all USER_INFO_1009;      --  lmaccess.h:343
   subtype LPUSER_INFO_1009 is PUSER_INFO_1009;            --  lmaccess.h:343

   type PUSER_INFO_1010 is access all USER_INFO_1010;      --  lmaccess.h:347
   subtype LPUSER_INFO_1010 is PUSER_INFO_1010;            --  lmaccess.h:347

   type PUSER_INFO_1011 is access all USER_INFO_1011;      --  lmaccess.h:351
   subtype LPUSER_INFO_1011 is PUSER_INFO_1011;            --  lmaccess.h:351

   type PUSER_INFO_1012 is access all USER_INFO_1012;      --  lmaccess.h:355
   subtype LPUSER_INFO_1012 is PUSER_INFO_1012;            --  lmaccess.h:355

   type PUSER_INFO_1013 is access all USER_INFO_1013;      --  lmaccess.h:359
   subtype LPUSER_INFO_1013 is PUSER_INFO_1013;            --  lmaccess.h:359

   type PUSER_INFO_1014 is access all USER_INFO_1014;      --  lmaccess.h:363
   subtype LPUSER_INFO_1014 is PUSER_INFO_1014;            --  lmaccess.h:363

   type PUSER_INFO_1017 is access all USER_INFO_1017;      --  lmaccess.h:367
   subtype LPUSER_INFO_1017 is PUSER_INFO_1017;            --  lmaccess.h:367

   type PUSER_INFO_1018 is access all USER_INFO_1018;      --  lmaccess.h:371
   subtype LPUSER_INFO_1018 is PUSER_INFO_1018;            --  lmaccess.h:371

   type PUSER_INFO_1020 is access all USER_INFO_1020;      --  lmaccess.h:376
   subtype LPUSER_INFO_1020 is PUSER_INFO_1020;            --  lmaccess.h:376

   type PUSER_INFO_1023 is access all USER_INFO_1023;      --  lmaccess.h:380
   subtype LPUSER_INFO_1023 is PUSER_INFO_1023;            --  lmaccess.h:380

   type PUSER_INFO_1024 is access all USER_INFO_1024;      --  lmaccess.h:384
   subtype LPUSER_INFO_1024 is PUSER_INFO_1024;            --  lmaccess.h:384

   type PUSER_INFO_1025 is access all USER_INFO_1025;      --  lmaccess.h:388
   subtype LPUSER_INFO_1025 is PUSER_INFO_1025;            --  lmaccess.h:388

   type PUSER_INFO_1051 is access all USER_INFO_1051;      --  lmaccess.h:392
   subtype LPUSER_INFO_1051 is PUSER_INFO_1051;            --  lmaccess.h:392

   type PUSER_INFO_1052 is access all USER_INFO_1052;      --  lmaccess.h:396
   subtype LPUSER_INFO_1052 is PUSER_INFO_1052;            --  lmaccess.h:396

   type PUSER_INFO_1053 is access all USER_INFO_1053;      --  lmaccess.h:400
   subtype LPUSER_INFO_1053 is PUSER_INFO_1053;            --  lmaccess.h:400

   type PUSER_MODALS_INFO_0 is access all USER_MODALS_INFO_0;
   --  lmaccess.h:413
   subtype LPUSER_MODALS_INFO_0 is PUSER_MODALS_INFO_0;    --  lmaccess.h:413

   type PUSER_MODALS_INFO_1 is access all USER_MODALS_INFO_1;
   --  lmaccess.h:418
   subtype LPUSER_MODALS_INFO_1 is PUSER_MODALS_INFO_1;    --  lmaccess.h:418

   type PUSER_MODALS_INFO_2 is access all USER_MODALS_INFO_2;
   --  lmaccess.h:423
   subtype LPUSER_MODALS_INFO_2 is PUSER_MODALS_INFO_2;    --  lmaccess.h:423

   type PUSER_MODALS_INFO_3 is access all USER_MODALS_INFO_3;
   --  lmaccess.h:429
   subtype LPUSER_MODALS_INFO_3 is PUSER_MODALS_INFO_3;    --  lmaccess.h:429

   type PUSER_MODALS_INFO_1001 is access all USER_MODALS_INFO_1001;
   --  lmaccess.h:433
   subtype LPUSER_MODALS_INFO_1001 is PUSER_MODALS_INFO_1001;
   --  lmaccess.h:433

   type PUSER_MODALS_INFO_1002 is access all USER_MODALS_INFO_1002;
   --  lmaccess.h:437
   subtype LPUSER_MODALS_INFO_1002 is PUSER_MODALS_INFO_1002;
   --  lmaccess.h:437

   type PUSER_MODALS_INFO_1003 is access all USER_MODALS_INFO_1003;
   --  lmaccess.h:441
   subtype LPUSER_MODALS_INFO_1003 is PUSER_MODALS_INFO_1003;
   --  lmaccess.h:441

   type PUSER_MODALS_INFO_1004 is access all USER_MODALS_INFO_1004;
   --  lmaccess.h:445
   subtype LPUSER_MODALS_INFO_1004 is PUSER_MODALS_INFO_1004;
   --  lmaccess.h:445

   type PUSER_MODALS_INFO_1005 is access all USER_MODALS_INFO_1005;
   --  lmaccess.h:449
   subtype LPUSER_MODALS_INFO_1005 is PUSER_MODALS_INFO_1005;
   --  lmaccess.h:449

   type PUSER_MODALS_INFO_1006 is access all USER_MODALS_INFO_1006;
   --  lmaccess.h:453
   subtype LPUSER_MODALS_INFO_1006 is PUSER_MODALS_INFO_1006;
   --  lmaccess.h:453

   type PUSER_MODALS_INFO_1007 is access all USER_MODALS_INFO_1007;
   --  lmaccess.h:457
   subtype LPUSER_MODALS_INFO_1007 is PUSER_MODALS_INFO_1007;
   --  lmaccess.h:457

   type PGROUP_INFO_0 is access all GROUP_INFO_0;          --  lmaccess.h:821
   subtype LPGROUP_INFO_0 is PGROUP_INFO_0;                --  lmaccess.h:821

   type PGROUP_INFO_1 is access all GROUP_INFO_1;          --  lmaccess.h:826
   subtype LPGROUP_INFO_1 is PGROUP_INFO_1;                --  lmaccess.h:826

   type PGROUP_INFO_2 is access all GROUP_INFO_2;          --  lmaccess.h:833

   type PGROUP_INFO_1002 is access all GROUP_INFO_1002;    --  lmaccess.h:837
   subtype LPGROUP_INFO_1002 is PGROUP_INFO_1002;          --  lmaccess.h:837

   type PGROUP_INFO_1005 is access all GROUP_INFO_1005;    --  lmaccess.h:841
   subtype LPGROUP_INFO_1005 is PGROUP_INFO_1005;          --  lmaccess.h:841

   type PGROUP_USERS_INFO_0 is access all GROUP_USERS_INFO_0;
   --  lmaccess.h:846
   subtype LPGROUP_USERS_INFO_0 is PGROUP_USERS_INFO_0;    --  lmaccess.h:846

   type PGROUP_USERS_INFO_1 is access all GROUP_USERS_INFO_1;
   --  lmaccess.h:851
   subtype LPGROUP_USERS_INFO_1 is PGROUP_USERS_INFO_1;    --  lmaccess.h:851

   type PLOCALGROUP_INFO_0 is access all LOCALGROUP_INFO_0; --  lmaccess.h:990
   subtype LPLOCALGROUP_INFO_0 is PLOCALGROUP_INFO_0;      --  lmaccess.h:990

   type PLOCALGROUP_INFO_1 is access all LOCALGROUP_INFO_1; --  lmaccess.h:995
   subtype LPLOCALGROUP_INFO_1 is PLOCALGROUP_INFO_1;      --  lmaccess.h:995

   type PLOCALGROUP_INFO_1002 is access all LOCALGROUP_INFO_1002;
   --  lmaccess.h:999
   subtype LPLOCALGROUP_INFO_1002 is PLOCALGROUP_INFO_1002; --  lmaccess.h:999

   type PLOCALGROUP_MEMBERS_INFO_0 is access all LOCALGROUP_MEMBERS_INFO_0;
   --  lmaccess.h:1003

   type LPLOCALGROUP_MEMBERS_INFO_0 is access all LOCALGROUP_MEMBERS_INFO_0;
   --  lmaccess.h:1004

   type PLOCALGROUP_MEMBERS_INFO_1 is access all LOCALGROUP_MEMBERS_INFO_1;
   --  lmaccess.h:1010

   type LPLOCALGROUP_MEMBERS_INFO_1 is access all LOCALGROUP_MEMBERS_INFO_1;
   --  lmaccess.h:1011

   type PLOCALGROUP_USERS_INFO_0 is access all LOCALGROUP_USERS_INFO_0;
   --  lmaccess.h:1015
   subtype LPLOCALGROUP_USERS_INFO_0 is PLOCALGROUP_USERS_INFO_0;
   --  lmaccess.h:1016

   type PACCESS_INFO_0 is access all ACCESS_INFO_0;        --  lmaccess.h:1110
   subtype LPACCESS_INFO_0 is PACCESS_INFO_0;              --  lmaccess.h:1110

   type PACCESS_INFO_1 is access all ACCESS_INFO_1;        --  lmaccess.h:1116
   subtype LPACCESS_INFO_1 is PACCESS_INFO_1;              --  lmaccess.h:1116

   type PACCESS_INFO_1002 is access all ACCESS_INFO_1002;  --  lmaccess.h:1120
   subtype LPACCESS_INFO_1002 is PACCESS_INFO_1002;        --  lmaccess.h:1120

   type PACCESS_LIST is access all ACCESS_LIST;            --  lmaccess.h:1126
   subtype LPACCESS_LIST is PACCESS_LIST;                  --  lmaccess.h:1126

   type PNETLOGON_INFO_1 is access all NETLOGON_INFO_1;    --  lmaccess.h:1293

   type PNETLOGON_INFO_2 is access all NETLOGON_INFO_2;    --  lmaccess.h:1304

   type USER_INFO_0 is                                     --  lmaccess.h:178
      record
         usri0_name : Win32.LPWSTR;                       --  lmaccess.h:179
      end record;

   type USER_INFO_1 is                                     --  lmaccess.h:182
      record
         usri1_name : Win32.LPWSTR;               --  lmaccess.h:183
         usri1_password : Win32.LPWSTR;               --  lmaccess.h:184
         usri1_password_age : Win32.DWORD;                --  lmaccess.h:185
         usri1_priv : Win32.DWORD;                --  lmaccess.h:186
         usri1_home_dir : Win32.LPWSTR;               --  lmaccess.h:187
         usri1_comment : Win32.LPWSTR;               --  lmaccess.h:188
         usri1_flags : Win32.DWORD;                --  lmaccess.h:189
         usri1_script_path : Win32.LPWSTR;               --  lmaccess.h:190
      end record;

   type USER_INFO_2 is                                     --  lmaccess.h:193
      record
         usri2_name : Win32.LPWSTR;             --  lmaccess.h:194
         usri2_password : Win32.LPWSTR;             --  lmaccess.h:195
         usri2_password_age : Win32.DWORD;              --  lmaccess.h:196
         usri2_priv : Win32.DWORD;              --  lmaccess.h:197
         usri2_home_dir : Win32.LPWSTR;             --  lmaccess.h:198
         usri2_comment : Win32.LPWSTR;             --  lmaccess.h:199
         usri2_flags : Win32.DWORD;              --  lmaccess.h:200
         usri2_script_path : Win32.LPWSTR;             --  lmaccess.h:201
         usri2_auth_flags : Win32.DWORD;              --  lmaccess.h:202
         usri2_full_name : Win32.LPWSTR;             --  lmaccess.h:203
         usri2_usr_comment : Win32.LPWSTR;             --  lmaccess.h:204
         usri2_parms : Win32.LPWSTR;             --  lmaccess.h:205
         usri2_workstations : Win32.LPWSTR;             --  lmaccess.h:206
         usri2_last_logon : Win32.DWORD;              --  lmaccess.h:207
         usri2_last_logoff : Win32.DWORD;              --  lmaccess.h:208
         usri2_acct_expires : Win32.DWORD;              --  lmaccess.h:209
         usri2_max_storage : Win32.DWORD;              --  lmaccess.h:210
         usri2_units_per_week : Win32.DWORD;              --  lmaccess.h:211
         usri2_logon_hours : Win32.PBYTE;              --  lmaccess.h:212
         usri2_bad_pw_count : Win32.DWORD;              --  lmaccess.h:213
         usri2_num_logons : Win32.DWORD;              --  lmaccess.h:214
         usri2_logon_server : Win32.LPWSTR;             --  lmaccess.h:215
         usri2_country_code : Win32.DWORD;              --  lmaccess.h:216
         usri2_code_page : Win32.DWORD;              --  lmaccess.h:217
      end record;

   type USER_INFO_3 is                                     --  lmaccess.h:220
      record
         usri3_name : Win32.LPWSTR;           --  lmaccess.h:221
         usri3_password : Win32.LPWSTR;           --  lmaccess.h:222
         usri3_password_age : Win32.DWORD;            --  lmaccess.h:223
         usri3_priv : Win32.DWORD;            --  lmaccess.h:224
         usri3_home_dir : Win32.LPWSTR;           --  lmaccess.h:225
         usri3_comment : Win32.LPWSTR;           --  lmaccess.h:226
         usri3_flags : Win32.DWORD;            --  lmaccess.h:227
         usri3_script_path : Win32.LPWSTR;           --  lmaccess.h:228
         usri3_auth_flags : Win32.DWORD;            --  lmaccess.h:229
         usri3_full_name : Win32.LPWSTR;           --  lmaccess.h:230
         usri3_usr_comment : Win32.LPWSTR;           --  lmaccess.h:231
         usri3_parms : Win32.LPWSTR;           --  lmaccess.h:232
         usri3_workstations : Win32.LPWSTR;           --  lmaccess.h:233
         usri3_last_logon : Win32.DWORD;            --  lmaccess.h:234
         usri3_last_logoff : Win32.DWORD;            --  lmaccess.h:235
         usri3_acct_expires : Win32.DWORD;            --  lmaccess.h:236
         usri3_max_storage : Win32.DWORD;            --  lmaccess.h:237
         usri3_units_per_week : Win32.DWORD;            --  lmaccess.h:238
         usri3_logon_hours : Win32.PBYTE;            --  lmaccess.h:239
         usri3_bad_pw_count : Win32.DWORD;            --  lmaccess.h:240
         usri3_num_logons : Win32.DWORD;            --  lmaccess.h:241
         usri3_logon_server : Win32.LPWSTR;           --  lmaccess.h:242
         usri3_country_code : Win32.DWORD;            --  lmaccess.h:243
         usri3_code_page : Win32.DWORD;            --  lmaccess.h:244
         usri3_user_id : Win32.DWORD;            --  lmaccess.h:245
         usri3_primary_group_id : Win32.DWORD;            --  lmaccess.h:246
         usri3_profile : Win32.LPWSTR;           --  lmaccess.h:247
         usri3_home_dir_drive : Win32.LPWSTR;           --  lmaccess.h:248
         usri3_password_expired : Win32.DWORD;            --  lmaccess.h:249
      end record;

   type USER_INFO_10 is                                    --  lmaccess.h:252
      record
         usri10_name : Win32.LPWSTR;               --  lmaccess.h:253
         usri10_comment : Win32.LPWSTR;               --  lmaccess.h:254
         usri10_usr_comment : Win32.LPWSTR;               --  lmaccess.h:255
         usri10_full_name : Win32.LPWSTR;               --  lmaccess.h:256
      end record;

   type USER_INFO_11 is                                    --  lmaccess.h:259
      record
         usri11_name : Win32.LPWSTR;            --  lmaccess.h:260
         usri11_comment : Win32.LPWSTR;            --  lmaccess.h:261
         usri11_usr_comment : Win32.LPWSTR;            --  lmaccess.h:262
         usri11_full_name : Win32.LPWSTR;            --  lmaccess.h:263
         usri11_priv : Win32.DWORD;             --  lmaccess.h:264
         usri11_auth_flags : Win32.DWORD;             --  lmaccess.h:265
         usri11_password_age : Win32.DWORD;             --  lmaccess.h:266
         usri11_home_dir : Win32.LPWSTR;            --  lmaccess.h:267
         usri11_parms : Win32.LPWSTR;            --  lmaccess.h:268
         usri11_last_logon : Win32.DWORD;             --  lmaccess.h:269
         usri11_last_logoff : Win32.DWORD;             --  lmaccess.h:270
         usri11_bad_pw_count : Win32.DWORD;             --  lmaccess.h:271
         usri11_num_logons : Win32.DWORD;             --  lmaccess.h:272
         usri11_logon_server : Win32.LPWSTR;            --  lmaccess.h:273
         usri11_country_code : Win32.DWORD;             --  lmaccess.h:274
         usri11_workstations : Win32.LPWSTR;            --  lmaccess.h:275
         usri11_max_storage : Win32.DWORD;             --  lmaccess.h:276
         usri11_units_per_week : Win32.DWORD;             --  lmaccess.h:277
         usri11_logon_hours : Win32.PBYTE;             --  lmaccess.h:278
         usri11_code_page : Win32.DWORD;             --  lmaccess.h:279
      end record;

   type USER_INFO_20 is                                    --  lmaccess.h:282
      record
         usri20_name : Win32.LPWSTR;                 --  lmaccess.h:283
         usri20_full_name : Win32.LPWSTR;                 --  lmaccess.h:284
         usri20_comment : Win32.LPWSTR;                 --  lmaccess.h:285
         usri20_flags : Win32.DWORD;                  --  lmaccess.h:286
         usri20_user_id : Win32.DWORD;                  --  lmaccess.h:287
      end record;

   type USER_INFO_21 is                                    --  lmaccess.h:290
      record
         usri21_password : Win32.BYTE_Array
           (0 .. Win32.Lmcons.ENCRYPTED_PWLEN - 1);
         --  lmaccess.h:291
      end record;

   type USER_INFO_22 is                                    --  lmaccess.h:294
      record
         usri22_name : Win32.LPWSTR;            --  lmaccess.h:295
         usri22_password : Win32.BYTE_Array
           (0 .. Win32.Lmcons.ENCRYPTED_PWLEN - 1);
         --  lmaccess.h:296
         usri22_password_age : Win32.DWORD;             --  lmaccess.h:297
         usri22_priv : Win32.DWORD;             --  lmaccess.h:298
         usri22_home_dir : Win32.LPWSTR;            --  lmaccess.h:299
         usri22_comment : Win32.LPWSTR;            --  lmaccess.h:300
         usri22_flags : Win32.DWORD;             --  lmaccess.h:301
         usri22_script_path : Win32.LPWSTR;            --  lmaccess.h:302
         usri22_auth_flags : Win32.DWORD;             --  lmaccess.h:303
         usri22_full_name : Win32.LPWSTR;            --  lmaccess.h:304
         usri22_usr_comment : Win32.LPWSTR;            --  lmaccess.h:305
         usri22_parms : Win32.LPWSTR;            --  lmaccess.h:306
         usri22_workstations : Win32.LPWSTR;            --  lmaccess.h:307
         usri22_last_logon : Win32.DWORD;             --  lmaccess.h:308
         usri22_last_logoff : Win32.DWORD;             --  lmaccess.h:309
         usri22_acct_expires : Win32.DWORD;             --  lmaccess.h:310
         usri22_max_storage : Win32.DWORD;             --  lmaccess.h:311
         usri22_units_per_week : Win32.DWORD;             --  lmaccess.h:312
         usri22_logon_hours : Win32.PBYTE;             --  lmaccess.h:313
         usri22_bad_pw_count : Win32.DWORD;             --  lmaccess.h:314
         usri22_num_logons : Win32.DWORD;             --  lmaccess.h:315
         usri22_logon_server : Win32.LPWSTR;            --  lmaccess.h:316
         usri22_country_code : Win32.DWORD;             --  lmaccess.h:317
         usri22_code_page : Win32.DWORD;             --  lmaccess.h:318
      end record;

   type USER_INFO_1003 is                                  --  lmaccess.h:321
      record
         usri1003_password : Win32.LPWSTR;                --  lmaccess.h:322
      end record;

   type USER_INFO_1005 is                                  --  lmaccess.h:325
      record
         usri1005_priv : Win32.DWORD;                     --  lmaccess.h:326
      end record;

   type USER_INFO_1006 is                                  --  lmaccess.h:329
      record
         usri1006_home_dir : Win32.LPWSTR;                --  lmaccess.h:330
      end record;

   type USER_INFO_1007 is                                  --  lmaccess.h:333
      record
         usri1007_comment : Win32.LPWSTR;                 --  lmaccess.h:334
      end record;

   type USER_INFO_1008 is                                  --  lmaccess.h:337
      record
         usri1008_flags : Win32.DWORD;                    --  lmaccess.h:338
      end record;

   type USER_INFO_1009 is                                  --  lmaccess.h:341
      record
         usri1009_script_path : Win32.LPWSTR;             --  lmaccess.h:342
      end record;

   type USER_INFO_1010 is                                  --  lmaccess.h:345
      record
         usri1010_auth_flags : Win32.DWORD;               --  lmaccess.h:346
      end record;

   type USER_INFO_1011 is                                  --  lmaccess.h:349
      record
         usri1011_full_name : Win32.LPWSTR;               --  lmaccess.h:350
      end record;

   type USER_INFO_1012 is                                  --  lmaccess.h:353
      record
         usri1012_usr_comment : Win32.LPWSTR;             --  lmaccess.h:354
      end record;

   type USER_INFO_1013 is                                  --  lmaccess.h:357
      record
         usri1013_parms : Win32.LPWSTR;                   --  lmaccess.h:358
      end record;

   type USER_INFO_1014 is                                  --  lmaccess.h:361
      record
         usri1014_workstations : Win32.LPWSTR;            --  lmaccess.h:362
      end record;

   type USER_INFO_1017 is                                  --  lmaccess.h:365
      record
         usri1017_acct_expires : Win32.DWORD;             --  lmaccess.h:366
      end record;

   type USER_INFO_1018 is                                  --  lmaccess.h:369
      record
         usri1018_max_storage : Win32.DWORD;              --  lmaccess.h:370
      end record;

   type USER_INFO_1020 is                                  --  lmaccess.h:373
      record
         usri1020_units_per_week : Win32.DWORD;           --  lmaccess.h:374
         usri1020_logon_hours : Win32.LPBYTE;          --  lmaccess.h:375
      end record;

   type USER_INFO_1023 is                                  --  lmaccess.h:378
      record
         usri1023_logon_server : Win32.LPWSTR;            --  lmaccess.h:379
      end record;

   type USER_INFO_1024 is                                  --  lmaccess.h:382
      record
         usri1024_country_code : Win32.DWORD;             --  lmaccess.h:383
      end record;

   type USER_INFO_1025 is                                  --  lmaccess.h:386
      record
         usri1025_code_page : Win32.DWORD;                --  lmaccess.h:387
      end record;

   type USER_INFO_1051 is                                  --  lmaccess.h:390
      record
         usri1051_primary_group_id : Win32.DWORD;         --  lmaccess.h:391
      end record;

   type USER_INFO_1052 is                                  --  lmaccess.h:394
      record
         usri1052_profile : Win32.LPWSTR;                 --  lmaccess.h:395
      end record;

   type USER_INFO_1053 is                                  --  lmaccess.h:398
      record
         usri1053_home_dir_drive : Win32.LPWSTR;          --  lmaccess.h:399
      end record;

   type USER_MODALS_INFO_0 is                              --  lmaccess.h:407
      record
         usrmod0_min_passwd_len : Win32.DWORD;         --  lmaccess.h:408
         usrmod0_max_passwd_age : Win32.DWORD;         --  lmaccess.h:409
         usrmod0_min_passwd_age : Win32.DWORD;         --  lmaccess.h:410
         usrmod0_force_logoff : Win32.DWORD;         --  lmaccess.h:411
         usrmod0_password_hist_len : Win32.DWORD;         --  lmaccess.h:412
      end record;

   type USER_MODALS_INFO_1 is                              --  lmaccess.h:415
      record
         usrmod1_role : Win32.DWORD;                   --  lmaccess.h:416
         usrmod1_primary : Win32.LPWSTR;                  --  lmaccess.h:417
      end record;

   type USER_MODALS_INFO_2 is                              --  lmaccess.h:420
      record
         usrmod2_domain_name : Win32.LPWSTR;              --  lmaccess.h:421
         usrmod2_domain_id : Win32.Winnt.PSID;          --  lmaccess.h:422
      end record;

   type USER_MODALS_INFO_3 is                              --  lmaccess.h:425
      record
         usrmod3_lockout_duration : Win32.DWORD; --  lmaccess.h:426
         usrmod3_lockout_observation_window : Win32.DWORD; --  lmaccess.h:427
         usrmod3_lockout_threshold : Win32.DWORD; --  lmaccess.h:428
      end record;

   type USER_MODALS_INFO_1001 is                           --  lmaccess.h:431
      record
         usrmod1001_min_passwd_len : Win32.DWORD;         --  lmaccess.h:432
      end record;

   type USER_MODALS_INFO_1002 is                           --  lmaccess.h:435
      record
         usrmod1002_max_passwd_age : Win32.DWORD;         --  lmaccess.h:436
      end record;

   type USER_MODALS_INFO_1003 is                           --  lmaccess.h:439
      record
         usrmod1003_min_passwd_age : Win32.DWORD;         --  lmaccess.h:440
      end record;

   type USER_MODALS_INFO_1004 is                           --  lmaccess.h:443
      record
         usrmod1004_force_logoff : Win32.DWORD;           --  lmaccess.h:444
      end record;

   type USER_MODALS_INFO_1005 is                           --  lmaccess.h:447
      record
         usrmod1005_password_hist_len : Win32.DWORD;      --  lmaccess.h:448
      end record;

   type USER_MODALS_INFO_1006 is                           --  lmaccess.h:451
      record
         usrmod1006_role : Win32.DWORD;                   --  lmaccess.h:452
      end record;

   type USER_MODALS_INFO_1007 is                           --  lmaccess.h:455
      record
         usrmod1007_primary : Win32.LPWSTR;               --  lmaccess.h:456
      end record;

   type GROUP_INFO_0 is                                    --  lmaccess.h:819
      record
         grpi0_name : Win32.LPWSTR;                       --  lmaccess.h:820
      end record;

   type GROUP_INFO_1 is                                    --  lmaccess.h:823
      record
         grpi1_name : Win32.LPWSTR;                    --  lmaccess.h:824
         grpi1_comment : Win32.LPWSTR;                    --  lmaccess.h:825
      end record;

   type GROUP_INFO_2 is                                    --  lmaccess.h:828
      record
         grpi2_name : Win32.LPWSTR;                 --  lmaccess.h:829
         grpi2_comment : Win32.LPWSTR;                 --  lmaccess.h:830
         grpi2_group_id : Win32.DWORD;                  --  lmaccess.h:831
         grpi2_attributes : Win32.DWORD;                  --  lmaccess.h:832
      end record;

   type GROUP_INFO_1002 is                                 --  lmaccess.h:835
      record
         grpi1002_comment : Win32.LPWSTR;                 --  lmaccess.h:836
      end record;

   type GROUP_INFO_1005 is                                 --  lmaccess.h:839
      record
         grpi1005_attributes : Win32.DWORD;               --  lmaccess.h:840
      end record;

   type GROUP_USERS_INFO_0 is                              --  lmaccess.h:844
      record
         grui0_name : Win32.LPWSTR;                       --  lmaccess.h:845
      end record;

   type GROUP_USERS_INFO_1 is                              --  lmaccess.h:848
      record
         grui1_name : Win32.LPWSTR;                 --  lmaccess.h:849
         grui1_attributes : Win32.DWORD;                  --  lmaccess.h:850
      end record;

   type LOCALGROUP_INFO_0 is                               --  lmaccess.h:988
      record
         lgrpi0_name : Win32.LPWSTR;                      --  lmaccess.h:989
      end record;

   type LOCALGROUP_INFO_1 is                               --  lmaccess.h:992
      record
         lgrpi1_name : Win32.LPWSTR;                   --  lmaccess.h:993
         lgrpi1_comment : Win32.LPWSTR;                   --  lmaccess.h:994
      end record;

   type LOCALGROUP_INFO_1002 is                            --  lmaccess.h:997
      record
         lgrpi1002_comment : Win32.LPWSTR;                --  lmaccess.h:998
      end record;

   type LOCALGROUP_MEMBERS_INFO_0 is                       --  lmaccess.h:1001
      record
         lgrmi0_sid : Win32.Winnt.PSID;                   --  lmaccess.h:1002
      end record;

   type LOCALGROUP_MEMBERS_INFO_1 is                       --  lmaccess.h:1006
      record
         lgrmi1_sid : Win32.Winnt.PSID;              --  lmaccess.h:1007
         lgrmi1_sidusage : Win32.Winnt.SID_NAME_USE;      --  lmaccess.h:1008
         lgrmi1_name : Win32.LPWSTR;                  --  lmaccess.h:1009
      end record;

   type LOCALGROUP_USERS_INFO_0 is                         --  lmaccess.h:1013
      record
         lgrui0_name : Win32.LPWSTR;                      --  lmaccess.h:1014
      end record;

   type ACCESS_INFO_0 is                                   --  lmaccess.h:1108
      record
         acc0_resource_name : Win32.Winnt.LPTSTR;         --  lmaccess.h:1109
      end record;

   type ACCESS_INFO_1 is                                   --  lmaccess.h:1112
      record
         acc1_resource_name : Win32.Winnt.LPTSTR;         --  lmaccess.h:1113
         acc1_attr : Win32.DWORD;                --  lmaccess.h:1114
         acc1_count : Win32.DWORD;                --  lmaccess.h:1115
      end record;

   type ACCESS_INFO_1002 is                                --  lmaccess.h:1118
      record
         acc1002_attr : Win32.DWORD;                      --  lmaccess.h:1119
      end record;

   type ACCESS_LIST is                                     --  lmaccess.h:1123
      record
         acl_ugname : Win32.Winnt.LPTSTR;                 --  lmaccess.h:1124
         acl_access : Win32.DWORD;                        --  lmaccess.h:1125
      end record;

   type NETLOGON_INFO_1 is                                 --  lmaccess.h:1290
      record
         netlog1_flags : Win32.DWORD;     --  lmaccess.h:1291
         netlog1_pdc_connection_status : Win32.DWORD;     --  lmaccess.h:1292
      end record;

   type NETLOGON_INFO_2 is                                 --  lmaccess.h:1295
      record
         netlog2_flags : Win32.DWORD;     --  lmaccess.h:1296
         netlog2_pdc_connection_status : Win32.DWORD;     --  lmaccess.h:1297
         netlog2_trusted_dc_name : Win32.LPWSTR;    --  lmaccess.h:1301
         netlog2_tc_connection_status : Win32.DWORD;     --  lmaccess.h:1303
      end record;

   function NetUserAdd
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:85

   function NetUserEnum
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      filter : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:93

   function NetUserGetInfo
     (servername : Win32.LPWSTR;
      username : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:105

   function NetUserSetInfo
     (servername : Win32.LPWSTR;
      username : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:113

   function NetUserDel
     (servername : Win32.LPWSTR;
      username : Win32.LPWSTR)
     return Win32.DWORD;                          --  lmaccess.h:122

   function NetUserGetGroups
     (servername : Win32.LPWSTR;
      username : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:128

   function NetUserSetGroups
     (servername : Win32.LPWSTR;
      username : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      num_entries : Win32.DWORD)
     return Win32.DWORD;                          --  lmaccess.h:139

   function NetUserGetLocalGroups
     (servername : Win32.LPWSTR;
      username : Win32.LPWSTR;
      level : Win32.DWORD;
      flags : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:148

   function NetUserModalsGet
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:160

   function NetUserModalsSet
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:167

   function NetGroupAdd
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:739

   function NetGroupAddUser
     (servername : Win32.LPWSTR;
      GroupName : Win32.LPWSTR;
      username : Win32.LPWSTR)
     return Win32.DWORD;                          --  lmaccess.h:747

   function NetGroupEnum
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:754

   function NetGroupGetInfo
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:765

   function NetGroupSetInfo
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:773

   function NetGroupDel
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR)
     return Win32.DWORD;                          --  lmaccess.h:782

   function NetGroupDelUser
     (servername : Win32.LPWSTR;
      GroupName : Win32.LPWSTR;
      Username : Win32.LPWSTR)
     return Win32.DWORD;                          --  lmaccess.h:788

   function NetGroupGetUsers
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      ResumeHandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:795

   function NetGroupSetUsers
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      totalentries : Win32.DWORD)
     return Win32.DWORD;                          --  lmaccess.h:807

   function NetLocalGroupAdd
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:908

   function NetLocalGroupAddMember
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      membersid : Win32.Winnt.PSID)
     return Win32.DWORD;                          --  lmaccess.h:916

   function NetLocalGroupEnum
     (servername : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:923

   function NetLocalGroupGetInfo
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:934

   function NetLocalGroupSetInfo
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:942

   function NetLocalGroupDel
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR)
     return Win32.DWORD;                          --  lmaccess.h:951

   function NetLocalGroupDelMember
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      membersid : Win32.Winnt.PSID)
     return Win32.DWORD;                          --  lmaccess.h:957

   function NetLocalGroupGetMembers
     (servername : Win32.LPWSTR;
      localgroupname : Win32.LPWSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:964

   function NetLocalGroupSetMembers
     (servername : Win32.LPWSTR;
      groupname : Win32.LPWSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      totalentries : Win32.DWORD)
     return Win32.DWORD;                          --  lmaccess.h:976

   function RxNetAccessAdd
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:1043

   function NetAccessAdd
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD
     renames RxNetAccessAdd;                      --  lmaccess.h:1043

   function RxNetAccessEnum
     (servername : Win32.Winnt.LPTSTR;
      BasePath : Win32.Winnt.LPTSTR;
      Recursive : Win32.DWORD;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:1053

   function NetAccessEnum
     (servername : Win32.Winnt.LPTSTR;
      BasePath : Win32.Winnt.LPTSTR;
      Recursive : Win32.DWORD;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD
     renames RxNetAccessEnum;                     --  lmaccess.h:1053

   function RxNetAccessGetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:1068

   function NetAccessGetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD
     renames RxNetAccessGetInfo;                  --  lmaccess.h:1068

   function RxNetAccessSetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:1078

   function NetAccessSetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD
     renames RxNetAccessSetInfo;                  --  lmaccess.h:1078

   function RxNetAccessDel
     (servername : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmaccess.h:1089

   function NetAccessDel
     (servername : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR)
     return Win32.DWORD
     renames RxNetAccessDel;                      --  lmaccess.h:1089

   function RxNetAccessGetUserPerms
     (servername : Win32.Winnt.LPTSTR;
      UGname : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR;
      Perms : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaccess.h:1097

   function NetAccessGetUserPerms
     (servername : Win32.Winnt.LPTSTR;
      UGname : Win32.Winnt.LPTSTR;
      resource : Win32.Winnt.LPTSTR;
      Perms : Win32.LPDWORD)
     return Win32.DWORD
     renames RxNetAccessGetUserPerms;             --  lmaccess.h:1097

   function NetGetDCName
     (servername : Win32.LPWSTR;
      domainname : Win32.LPWSTR;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:1228

   function NetGetAnyDCName
     (servername : Win32.LPWSTR;
      domainname : Win32.LPWSTR;
      bufptr : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:1235

   function I_NetLogonControl
     (ServerName : Win32.LPWSTR;
      FunctionCode : Win32.DWORD;
      QueryLevel : Win32.DWORD;
      Buffer : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:1243

   function I_NetLogonControl2
     (ServerName : Win32.LPWSTR;
      FunctionCode : Win32.DWORD;
      QueryLevel : Win32.DWORD;
      Data : Win32.LPBYTE;
      Buffer : access Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaccess.h:1251

private

   pragma Convention (C_Pass_By_Copy, USER_INFO_0);         --  lmaccess.h:178
   pragma Convention (C, USER_INFO_1);                      --  lmaccess.h:182
   pragma Convention (C, USER_INFO_2);                      --  lmaccess.h:193
   pragma Convention (C, USER_INFO_3);                      --  lmaccess.h:220
   pragma Convention (C_Pass_By_Copy, USER_INFO_10);        --  lmaccess.h:252
   pragma Convention (C, USER_INFO_11);                     --  lmaccess.h:259
   pragma Convention (C, USER_INFO_20);                     --  lmaccess.h:282
   pragma Convention (C_Pass_By_Copy, USER_INFO_21);        --  lmaccess.h:290
   pragma Convention (C, USER_INFO_22);                     --  lmaccess.h:294
   pragma Convention (C_Pass_By_Copy, USER_INFO_1003);      --  lmaccess.h:321
   pragma Convention (C_Pass_By_Copy, USER_INFO_1005);      --  lmaccess.h:325
   pragma Convention (C_Pass_By_Copy, USER_INFO_1006);      --  lmaccess.h:329
   pragma Convention (C_Pass_By_Copy, USER_INFO_1007);      --  lmaccess.h:333
   pragma Convention (C_Pass_By_Copy, USER_INFO_1008);      --  lmaccess.h:337
   pragma Convention (C_Pass_By_Copy, USER_INFO_1009);      --  lmaccess.h:341
   pragma Convention (C_Pass_By_Copy, USER_INFO_1010);      --  lmaccess.h:345
   pragma Convention (C_Pass_By_Copy, USER_INFO_1011);      --  lmaccess.h:349
   pragma Convention (C_Pass_By_Copy, USER_INFO_1012);      --  lmaccess.h:353
   pragma Convention (C_Pass_By_Copy, USER_INFO_1013);      --  lmaccess.h:357
   pragma Convention (C_Pass_By_Copy, USER_INFO_1014);      --  lmaccess.h:361
   pragma Convention (C_Pass_By_Copy, USER_INFO_1017);      --  lmaccess.h:365
   pragma Convention (C_Pass_By_Copy, USER_INFO_1018);      --  lmaccess.h:369
   pragma Convention (C_Pass_By_Copy, USER_INFO_1020);      --  lmaccess.h:373
   pragma Convention (C_Pass_By_Copy, USER_INFO_1023);      --  lmaccess.h:378
   pragma Convention (C_Pass_By_Copy, USER_INFO_1024);      --  lmaccess.h:382
   pragma Convention (C_Pass_By_Copy, USER_INFO_1025);      --  lmaccess.h:386
   pragma Convention (C_Pass_By_Copy, USER_INFO_1051);      --  lmaccess.h:390
   pragma Convention (C_Pass_By_Copy, USER_INFO_1052);      --  lmaccess.h:394
   pragma Convention (C_Pass_By_Copy, USER_INFO_1053);      --  lmaccess.h:398
   pragma Convention (C, USER_MODALS_INFO_0);               --  lmaccess.h:407
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1);  --  lmaccess.h:415
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_2);  --  lmaccess.h:420
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_3);  --  lmaccess.h:425
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1001);
   --  lmaccess.h:431
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1002);
   --  lmaccess.h:435
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1003);
   --  lmaccess.h:439
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1004);
   --  lmaccess.h:443
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1005);
   --  lmaccess.h:447
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1006);
   --  lmaccess.h:451
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1007);
   --  lmaccess.h:455
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_0);         --  lmaccess.h:819
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_1);         --  lmaccess.h:823
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_2);         --  lmaccess.h:828
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_1002);      --  lmaccess.h:835
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_1005);      --  lmaccess.h:839
   pragma Convention (C_Pass_By_Copy, GROUP_USERS_INFO_0);   --  lmaccess.h:844
   pragma Convention (C_Pass_By_Copy, GROUP_USERS_INFO_1);   --  lmaccess.h:848
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_INFO_0);    --  lmaccess.h:988
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_INFO_1);    --  lmaccess.h:992
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_INFO_1002); --  lmaccess.h:997
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_MEMBERS_INFO_0);
   --  lmaccess.h:1001
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_MEMBERS_INFO_1);
   --  lmaccess.h:1006
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_USERS_INFO_0);
   --  lmaccess.h:1013
   pragma Convention (C_Pass_By_Copy, ACCESS_INFO_0);       --  lmaccess.h:1108
   pragma Convention (C_Pass_By_Copy, ACCESS_INFO_1);       --  lmaccess.h:1112
   pragma Convention (C_Pass_By_Copy, ACCESS_INFO_1002);    --  lmaccess.h:1118
   pragma Convention (C_Pass_By_Copy, ACCESS_LIST);         --  lmaccess.h:1123
   pragma Convention (C_Pass_By_Copy, NETLOGON_INFO_1);     --  lmaccess.h:1290
   pragma Convention (C_Pass_By_Copy, NETLOGON_INFO_2);     --  lmaccess.h:1295

   pragma Import (Stdcall, NetUserAdd, "NetUserAdd");       --  lmaccess.h:85
   pragma Import (Stdcall, NetUserEnum, "NetUserEnum");     --  lmaccess.h:93
   pragma Import (Stdcall, NetUserGetInfo, "NetUserGetInfo");
   --  lmaccess.h:105
   pragma Import (Stdcall, NetUserSetInfo, "NetUserSetInfo");
   --  lmaccess.h:113
   pragma Import (Stdcall, NetUserDel, "NetUserDel");       --  lmaccess.h:122
   pragma Import (Stdcall, NetUserGetGroups, "NetUserGetGroups");
   --  lmaccess.h:128
   pragma Import (Stdcall, NetUserSetGroups, "NetUserSetGroups");
   --  lmaccess.h:139
   pragma Import (Stdcall, NetUserGetLocalGroups, "NetUserGetLocalGroups");
   --  lmaccess.h:148
   pragma Import (Stdcall, NetUserModalsGet, "NetUserModalsGet");
   --  lmaccess.h:160
   pragma Import (Stdcall, NetUserModalsSet, "NetUserModalsSet");
   --  lmaccess.h:167
   pragma Import (Stdcall, NetGroupAdd, "NetGroupAdd");
   --  lmaccess.h:739
   pragma Import (Stdcall, NetGroupAddUser, "NetGroupAddUser");
   --  lmaccess.h:747
   pragma Import (Stdcall, NetGroupEnum, "NetGroupEnum");
   --  lmaccess.h:754
   pragma Import (Stdcall, NetGroupGetInfo, "NetGroupGetInfo");
   --  lmaccess.h:765
   pragma Import (Stdcall, NetGroupSetInfo, "NetGroupSetInfo");
   --  lmaccess.h:773
   pragma Import (Stdcall, NetGroupDel, "NetGroupDel");
   --  lmaccess.h:782
   pragma Import (Stdcall, NetGroupDelUser, "NetGroupDelUser");
   --  lmaccess.h:788
   pragma Import (Stdcall, NetGroupGetUsers, "NetGroupGetUsers");
   --  lmaccess.h:795
   pragma Import (Stdcall, NetGroupSetUsers, "NetGroupSetUsers");
   --  lmaccess.h:807
   pragma Import (Stdcall, NetLocalGroupAdd, "NetLocalGroupAdd");
   --  lmaccess.h:908
   pragma Import (Stdcall, NetLocalGroupAddMember, "NetLocalGroupAddMember");
   --  lmaccess.h:916
   pragma Import (Stdcall, NetLocalGroupEnum, "NetLocalGroupEnum");
   --  lmaccess.h:923
   pragma Import (Stdcall, NetLocalGroupGetInfo, "NetLocalGroupGetInfo");
   --  lmaccess.h:934
   pragma Import (Stdcall, NetLocalGroupSetInfo, "NetLocalGroupSetInfo");
   --  lmaccess.h:942
   pragma Import (Stdcall, NetLocalGroupDel, "NetLocalGroupDel");
   --  lmaccess.h:951
   pragma Import (Stdcall, NetLocalGroupDelMember, "NetLocalGroupDelMember");
   --  lmaccess.h:957
   pragma Import (Stdcall, NetLocalGroupGetMembers, "NetLocalGroupGetMembers");
   --  lmaccess.h:964
   pragma Import (Stdcall, NetLocalGroupSetMembers, "NetLocalGroupSetMembers");
   --  lmaccess.h:976
   pragma Import (Stdcall, RxNetAccessAdd, "RxNetAccessAdd");
   --  lmaccess.h:1043
   pragma Import (Stdcall, RxNetAccessEnum, "RxNetAccessEnum");
   --  lmaccess.h:1053
   pragma Import (Stdcall, RxNetAccessGetInfo, "RxNetAccessGetInfo");
   --  lmaccess.h:1068
   pragma Import (Stdcall, RxNetAccessSetInfo, "RxNetAccessSetInfo");
   --  lmaccess.h:1078
   pragma Import (Stdcall, RxNetAccessDel, "RxNetAccessDel");
   --  lmaccess.h:1089
   pragma Import (Stdcall, RxNetAccessGetUserPerms, "RxNetAccessGetUserPerms");
   --  lmaccess.h:1097
   pragma Import (Stdcall, NetGetDCName, "NetGetDCName");
   --  lmaccess.h:1228
   pragma Import (Stdcall, NetGetAnyDCName, "NetGetAnyDCName");
   --  lmaccess.h:1235
   pragma Import (Stdcall, I_NetLogonControl, "I_NetLogonControl");
   --  lmaccess.h:1243
   pragma Import (Stdcall, I_NetLogonControl2, "I_NetLogonControl2");
   --  lmaccess.h:1251

end Win32.Lmaccess;
