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

package Win32.Lmwksta is

   WKSTA_PLATFORM_ID_PARMNUM : constant := 100; --  lmwksta.h:502
   WKSTA_COMPUTERNAME_PARMNUM : constant := 1;   --  lmwksta.h:503
   WKSTA_LANGROUP_PARMNUM : constant := 2;   --  lmwksta.h:504
   WKSTA_VER_MAJOR_PARMNUM : constant := 4;   --  lmwksta.h:505
   WKSTA_VER_MINOR_PARMNUM : constant := 5;   --  lmwksta.h:506
   WKSTA_LOGGED_ON_USERS_PARMNUM : constant := 6;   --  lmwksta.h:507
   WKSTA_LANROOT_PARMNUM : constant := 7;   --  lmwksta.h:508
   WKSTA_LOGON_DOMAIN_PARMNUM : constant := 8;   --  lmwksta.h:509
   WKSTA_LOGON_SERVER_PARMNUM : constant := 9;   --  lmwksta.h:510
   WKSTA_CHARWAIT_PARMNUM : constant := 10;  --  lmwksta.h:511
   WKSTA_CHARTIME_PARMNUM : constant := 11;  --  lmwksta.h:512
   WKSTA_CHARCOUNT_PARMNUM : constant := 12;  --  lmwksta.h:513
   WKSTA_KEEPCONN_PARMNUM : constant := 13;  --  lmwksta.h:514
   WKSTA_KEEPSEARCH_PARMNUM : constant := 14;  --  lmwksta.h:515
   WKSTA_MAXCMDS_PARMNUM : constant := 15;  --  lmwksta.h:516
   WKSTA_NUMWORKBUF_PARMNUM : constant := 16;  --  lmwksta.h:517
   WKSTA_MAXWRKCACHE_PARMNUM : constant := 17;  --  lmwksta.h:518
   WKSTA_SESSTIMEOUT_PARMNUM : constant := 18;  --  lmwksta.h:519
   WKSTA_SIZERROR_PARMNUM : constant := 19;  --  lmwksta.h:520
   WKSTA_NUMALERTS_PARMNUM : constant := 20;  --  lmwksta.h:521
   WKSTA_NUMSERVICES_PARMNUM : constant := 21;  --  lmwksta.h:522
   WKSTA_NUMCHARBUF_PARMNUM : constant := 22;  --  lmwksta.h:523
   WKSTA_SIZCHARBUF_PARMNUM : constant := 23;  --  lmwksta.h:524
   WKSTA_ERRLOGSZ_PARMNUM : constant := 27;  --  lmwksta.h:525
   WKSTA_PRINTBUFTIME_PARMNUM : constant := 28;  --  lmwksta.h:526
   WKSTA_SIZWORKBUF_PARMNUM : constant := 29;  --  lmwksta.h:527
   WKSTA_MAILSLOTS_PARMNUM : constant := 30;  --  lmwksta.h:528
   WKSTA_NUMDGRAMBUF_PARMNUM : constant := 31;  --  lmwksta.h:529
   WKSTA_WRKHEURISTICS_PARMNUM : constant := 32;  --  lmwksta.h:530
   WKSTA_MAXTHREADS_PARMNUM : constant := 33;  --  lmwksta.h:531
   WKSTA_LOCKQUOTA_PARMNUM : constant := 41;  --  lmwksta.h:533
   WKSTA_LOCKINCREMENT_PARMNUM : constant := 42;  --  lmwksta.h:534
   WKSTA_LOCKMAXIMUM_PARMNUM : constant := 43;  --  lmwksta.h:535
   WKSTA_PIPEINCREMENT_PARMNUM : constant := 44;  --  lmwksta.h:536
   WKSTA_PIPEMAXIMUM_PARMNUM : constant := 45;  --  lmwksta.h:537
   WKSTA_DORMANTFILELIMIT_PARMNUM : constant := 46;  --  lmwksta.h:538
   WKSTA_CACHEFILETIMEOUT_PARMNUM : constant := 47;  --  lmwksta.h:539
   WKSTA_USEOPPORTUNISTICLOCKING_PARMNUM : constant := 48;  --  lmwksta.h:540
   WKSTA_USEUNLOCKBEHIND_PARMNUM : constant := 49;  --  lmwksta.h:541
   WKSTA_USECLOSEBEHIND_PARMNUM : constant := 50;  --  lmwksta.h:542
   WKSTA_BUFFERNAMEDPIPES_PARMNUM : constant := 51;  --  lmwksta.h:543
   WKSTA_USELOCKANDREADANDUNLOCK_PARMNUM : constant := 52;  --  lmwksta.h:544
   WKSTA_UTILIZENTCACHING_PARMNUM : constant := 53;  --  lmwksta.h:545
   WKSTA_USERAWREAD_PARMNUM : constant := 54;  --  lmwksta.h:546
   WKSTA_USERAWWRITE_PARMNUM : constant := 55;  --  lmwksta.h:547
   WKSTA_USEWRITERAWWITHDATA_PARMNUM : constant := 56;  --  lmwksta.h:548
   WKSTA_USEENCRYPTION_PARMNUM : constant := 57;  --  lmwksta.h:549
   WKSTA_BUFFILESWITHDENYWRITE_PARMNUM : constant := 58;  --  lmwksta.h:550
   WKSTA_BUFFERREADONLYFILES_PARMNUM : constant := 59;  --  lmwksta.h:551
   WKSTA_FORCECORECREATEMODE_PARMNUM : constant := 60;  --  lmwksta.h:552
   WKSTA_USE512BYTESMAXTRANSFER_PARMNUM : constant := 61;  --  lmwksta.h:553
   WKSTA_READAHEADTHRUPUT_PARMNUM : constant := 62;  --  lmwksta.h:554
   WKSTA_OTH_DOMAINS_PARMNUM : constant := 101; --  lmwksta.h:563
   TRANSPORT_QUALITYOFSERVICE_PARMNUM : constant := 201; --  lmwksta.h:572
   TRANSPORT_NAME_PARMNUM : constant := 202; --  lmwksta.h:573

   type WKSTA_INFO_100;                                    --  lmwksta.h:158
   type WKSTA_INFO_101;                                    --  lmwksta.h:169
   type WKSTA_INFO_102;                                    --  lmwksta.h:181
   type WKSTA_INFO_302;                                    --  lmwksta.h:197
   type WKSTA_INFO_402;                                    --  lmwksta.h:226
   type WKSTA_INFO_502;                                    --  lmwksta.h:256
   type WKSTA_INFO_1010;                                   --  lmwksta.h:306
   type WKSTA_INFO_1011;                                   --  lmwksta.h:310
   type WKSTA_INFO_1012;                                   --  lmwksta.h:314
   type WKSTA_INFO_1027;                                   --  lmwksta.h:322
   type WKSTA_INFO_1028;                                   --  lmwksta.h:326
   type WKSTA_INFO_1032;                                   --  lmwksta.h:330
   type WKSTA_INFO_1013;                                   --  lmwksta.h:339
   type WKSTA_INFO_1018;                                   --  lmwksta.h:343
   type WKSTA_INFO_1023;                                   --  lmwksta.h:347
   type WKSTA_INFO_1033;                                   --  lmwksta.h:351
   type WKSTA_INFO_1041;                                   --  lmwksta.h:358
   type WKSTA_INFO_1042;                                   --  lmwksta.h:362
   type WKSTA_INFO_1043;                                   --  lmwksta.h:366
   type WKSTA_INFO_1044;                                   --  lmwksta.h:370
   type WKSTA_INFO_1045;                                   --  lmwksta.h:374
   type WKSTA_INFO_1046;                                   --  lmwksta.h:378
   type WKSTA_INFO_1047;                                   --  lmwksta.h:382
   type WKSTA_INFO_1048;                                   --  lmwksta.h:386
   type WKSTA_INFO_1049;                                   --  lmwksta.h:390
   type WKSTA_INFO_1050;                                   --  lmwksta.h:394
   type WKSTA_INFO_1051;                                   --  lmwksta.h:398
   type WKSTA_INFO_1052;                                   --  lmwksta.h:402
   type WKSTA_INFO_1053;                                   --  lmwksta.h:406
   type WKSTA_INFO_1054;                                   --  lmwksta.h:410
   type WKSTA_INFO_1055;                                   --  lmwksta.h:414
   type WKSTA_INFO_1056;                                   --  lmwksta.h:418
   type WKSTA_INFO_1057;                                   --  lmwksta.h:422
   type WKSTA_INFO_1058;                                   --  lmwksta.h:426
   type WKSTA_INFO_1059;                                   --  lmwksta.h:430
   type WKSTA_INFO_1060;                                   --  lmwksta.h:434
   type WKSTA_INFO_1061;                                   --  lmwksta.h:438
   type WKSTA_INFO_1062;                                   --  lmwksta.h:442
   type WKSTA_USER_INFO_0;                                 --  lmwksta.h:451
   type WKSTA_USER_INFO_1;                                 --  lmwksta.h:459
   type WKSTA_USER_INFO_1101;                              --  lmwksta.h:469
   type WKSTA_TRANSPORT_INFO_0;                            --  lmwksta.h:478

   type PWKSTA_INFO_100 is access all WKSTA_INFO_100;      --  lmwksta.h:164
   subtype LPWKSTA_INFO_100 is PWKSTA_INFO_100;            --  lmwksta.h:164
   type PWKSTA_INFO_101 is access all WKSTA_INFO_101;      --  lmwksta.h:176
   subtype LPWKSTA_INFO_101 is PWKSTA_INFO_101;            --  lmwksta.h:176
   type PWKSTA_INFO_102 is access all WKSTA_INFO_102;      --  lmwksta.h:189
   subtype LPWKSTA_INFO_102 is PWKSTA_INFO_102;            --  lmwksta.h:189
   type PWKSTA_INFO_302 is access all WKSTA_INFO_302;      --  lmwksta.h:218
   subtype LPWKSTA_INFO_302 is PWKSTA_INFO_302;            --  lmwksta.h:218
   type PWKSTA_INFO_402 is access all WKSTA_INFO_402;      --  lmwksta.h:248
   subtype LPWKSTA_INFO_402 is PWKSTA_INFO_402;            --  lmwksta.h:248
   type PWKSTA_INFO_502 is access all WKSTA_INFO_502;      --  lmwksta.h:295
   subtype LPWKSTA_INFO_502 is PWKSTA_INFO_502;            --  lmwksta.h:295
   type PWKSTA_INFO_1010 is access all WKSTA_INFO_1010;    --  lmwksta.h:308
   subtype LPWKSTA_INFO_1010 is PWKSTA_INFO_1010;          --  lmwksta.h:308
   type PWKSTA_INFO_1011 is access all WKSTA_INFO_1011;    --  lmwksta.h:312
   subtype LPWKSTA_INFO_1011 is PWKSTA_INFO_1011;          --  lmwksta.h:312
   type PWKSTA_INFO_1012 is access all WKSTA_INFO_1012;    --  lmwksta.h:316
   subtype LPWKSTA_INFO_1012 is PWKSTA_INFO_1012;          --  lmwksta.h:316
   type PWKSTA_INFO_1027 is access all WKSTA_INFO_1027;    --  lmwksta.h:324
   subtype LPWKSTA_INFO_1027 is PWKSTA_INFO_1027;          --  lmwksta.h:324
   type PWKSTA_INFO_1028 is access all WKSTA_INFO_1028;    --  lmwksta.h:328
   subtype LPWKSTA_INFO_1028 is PWKSTA_INFO_1028;          --  lmwksta.h:328
   type PWKSTA_INFO_1032 is access all WKSTA_INFO_1032;    --  lmwksta.h:332
   subtype LPWKSTA_INFO_1032 is PWKSTA_INFO_1032;          --  lmwksta.h:332
   type PWKSTA_INFO_1013 is access all WKSTA_INFO_1013;    --  lmwksta.h:341
   subtype LPWKSTA_INFO_1013 is PWKSTA_INFO_1013;          --  lmwksta.h:341
   type PWKSTA_INFO_1018 is access all WKSTA_INFO_1018;    --  lmwksta.h:345
   subtype LPWKSTA_INFO_1018 is PWKSTA_INFO_1018;          --  lmwksta.h:345
   type PWKSTA_INFO_1023 is access all WKSTA_INFO_1023;    --  lmwksta.h:349
   subtype LPWKSTA_INFO_1023 is PWKSTA_INFO_1023;          --  lmwksta.h:349
   type PWKSTA_INFO_1033 is access all WKSTA_INFO_1033;    --  lmwksta.h:353
   subtype LPWKSTA_INFO_1033 is PWKSTA_INFO_1033;          --  lmwksta.h:353
   type PWKSTA_INFO_1041 is access all WKSTA_INFO_1041;    --  lmwksta.h:360
   subtype LPWKSTA_INFO_1041 is PWKSTA_INFO_1041;          --  lmwksta.h:360
   type PWKSTA_INFO_1042 is access all WKSTA_INFO_1042;    --  lmwksta.h:364
   subtype LPWKSTA_INFO_1042 is PWKSTA_INFO_1042;          --  lmwksta.h:364
   type PWKSTA_INFO_1043 is access all WKSTA_INFO_1043;    --  lmwksta.h:368
   subtype LPWKSTA_INFO_1043 is PWKSTA_INFO_1043;          --  lmwksta.h:368
   type PWKSTA_INFO_1044 is access all WKSTA_INFO_1044;    --  lmwksta.h:372
   subtype LPWKSTA_INFO_1044 is PWKSTA_INFO_1044;          --  lmwksta.h:372
   type PWKSTA_INFO_1045 is access all WKSTA_INFO_1045;    --  lmwksta.h:376
   subtype LPWKSTA_INFO_1045 is PWKSTA_INFO_1045;          --  lmwksta.h:376
   type PWKSTA_INFO_1046 is access all WKSTA_INFO_1046;    --  lmwksta.h:380
   subtype LPWKSTA_INFO_1046 is PWKSTA_INFO_1046;          --  lmwksta.h:380
   type PWKSTA_INFO_1047 is access all WKSTA_INFO_1047;    --  lmwksta.h:384
   subtype LPWKSTA_INFO_1047 is PWKSTA_INFO_1047;          --  lmwksta.h:384
   type PWKSTA_INFO_1048 is access all WKSTA_INFO_1048;    --  lmwksta.h:388
   subtype LPWKSTA_INFO_1048 is PWKSTA_INFO_1048;          --  lmwksta.h:388
   type PWKSTA_INFO_1049 is access all WKSTA_INFO_1049;    --  lmwksta.h:392
   subtype LPWKSTA_INFO_1049 is PWKSTA_INFO_1049;          --  lmwksta.h:392
   type PWKSTA_INFO_1050 is access all WKSTA_INFO_1050;    --  lmwksta.h:396
   subtype LPWKSTA_INFO_1050 is PWKSTA_INFO_1050;          --  lmwksta.h:396
   type PWKSTA_INFO_1051 is access all WKSTA_INFO_1051;    --  lmwksta.h:400
   subtype LPWKSTA_INFO_1051 is PWKSTA_INFO_1051;          --  lmwksta.h:400
   type PWKSTA_INFO_1052 is access all WKSTA_INFO_1052;    --  lmwksta.h:404
   subtype LPWKSTA_INFO_1052 is PWKSTA_INFO_1052;          --  lmwksta.h:404
   type PWKSTA_INFO_1053 is access all WKSTA_INFO_1053;    --  lmwksta.h:408
   subtype LPWKSTA_INFO_1053 is PWKSTA_INFO_1053;          --  lmwksta.h:408
   type PWKSTA_INFO_1054 is access all WKSTA_INFO_1054;    --  lmwksta.h:412
   subtype LPWKSTA_INFO_1054 is PWKSTA_INFO_1054;          --  lmwksta.h:412
   type PWKSTA_INFO_1055 is access all WKSTA_INFO_1055;    --  lmwksta.h:416
   subtype LPWKSTA_INFO_1055 is PWKSTA_INFO_1055;          --  lmwksta.h:416
   type PWKSTA_INFO_1056 is access all WKSTA_INFO_1056;    --  lmwksta.h:420
   subtype LPWKSTA_INFO_1056 is PWKSTA_INFO_1056;          --  lmwksta.h:420
   type PWKSTA_INFO_1057 is access all WKSTA_INFO_1057;    --  lmwksta.h:424
   subtype LPWKSTA_INFO_1057 is PWKSTA_INFO_1057;          --  lmwksta.h:424
   type PWKSTA_INFO_1058 is access all WKSTA_INFO_1058;    --  lmwksta.h:428
   subtype LPWKSTA_INFO_1058 is PWKSTA_INFO_1058;          --  lmwksta.h:428
   type PWKSTA_INFO_1059 is access all WKSTA_INFO_1059;    --  lmwksta.h:432
   subtype LPWKSTA_INFO_1059 is PWKSTA_INFO_1059;          --  lmwksta.h:432
   type PWKSTA_INFO_1060 is access all WKSTA_INFO_1060;    --  lmwksta.h:436
   subtype LPWKSTA_INFO_1060 is PWKSTA_INFO_1060;          --  lmwksta.h:436
   type PWKSTA_INFO_1061 is access all WKSTA_INFO_1061;    --  lmwksta.h:440
   subtype LPWKSTA_INFO_1061 is PWKSTA_INFO_1061;          --  lmwksta.h:440
   type PWKSTA_INFO_1062 is access all WKSTA_INFO_1062;    --  lmwksta.h:444
   subtype LPWKSTA_INFO_1062 is PWKSTA_INFO_1062;          --  lmwksta.h:444
   type PWKSTA_USER_INFO_0 is access all WKSTA_USER_INFO_0; --  lmwksta.h:453
   subtype LPWKSTA_USER_INFO_0 is PWKSTA_USER_INFO_0;      --  lmwksta.h:453
   type PWKSTA_USER_INFO_1 is access all WKSTA_USER_INFO_1; --  lmwksta.h:464
   subtype LPWKSTA_USER_INFO_1 is PWKSTA_USER_INFO_1;      --  lmwksta.h:464
   type PWKSTA_USER_INFO_1101 is access all WKSTA_USER_INFO_1101;
   --  lmwksta.h:471
   subtype LPWKSTA_USER_INFO_1101 is PWKSTA_USER_INFO_1101; --  lmwksta.h:472
   type PWKSTA_TRANSPORT_INFO_0 is access all WKSTA_TRANSPORT_INFO_0;
   --  lmwksta.h:484
   subtype LPWKSTA_TRANSPORT_INFO_0 is PWKSTA_TRANSPORT_INFO_0;
   --  lmwksta.h:485

   type WKSTA_INFO_100 is                                  --  lmwksta.h:158
      record
         wki100_platform_id : Win32.DWORD;               --  lmwksta.h:159
         wki100_computername : Win32.Winnt.LPTSTR;        --  lmwksta.h:160
         wki100_langroup : Win32.Winnt.LPTSTR;        --  lmwksta.h:161
         wki100_ver_major : Win32.DWORD;               --  lmwksta.h:162
         wki100_ver_minor : Win32.DWORD;               --  lmwksta.h:163
      end record;

   type WKSTA_INFO_101 is                                  --  lmwksta.h:169
      record
         wki101_platform_id : Win32.DWORD;               --  lmwksta.h:170
         wki101_computername : Win32.Winnt.LPTSTR;        --  lmwksta.h:171
         wki101_langroup : Win32.Winnt.LPTSTR;        --  lmwksta.h:172
         wki101_ver_major : Win32.DWORD;               --  lmwksta.h:173
         wki101_ver_minor : Win32.DWORD;               --  lmwksta.h:174
         wki101_lanroot : Win32.Winnt.LPTSTR;        --  lmwksta.h:175
      end record;

   type WKSTA_INFO_102 is                                  --  lmwksta.h:181
      record
         wki102_platform_id : Win32.DWORD;            --  lmwksta.h:182
         wki102_computername : Win32.Winnt.LPTSTR;     --  lmwksta.h:183
         wki102_langroup : Win32.Winnt.LPTSTR;     --  lmwksta.h:184
         wki102_ver_major : Win32.DWORD;            --  lmwksta.h:185
         wki102_ver_minor : Win32.DWORD;            --  lmwksta.h:186
         wki102_lanroot : Win32.Winnt.LPTSTR;     --  lmwksta.h:187
         wki102_logged_on_users : Win32.DWORD;            --  lmwksta.h:188
      end record;

   type WKSTA_INFO_302 is                                  --  lmwksta.h:197
      record
         wki302_char_wait : Win32.DWORD;   --  lmwksta.h:198
         wki302_collection_time : Win32.DWORD;   --  lmwksta.h:199
         wki302_maximum_collection_count : Win32.DWORD;   --  lmwksta.h:200
         wki302_keep_conn : Win32.DWORD;   --  lmwksta.h:201
         wki302_keep_search : Win32.DWORD;   --  lmwksta.h:202
         wki302_max_cmds : Win32.DWORD;   --  lmwksta.h:203
         wki302_num_work_buf : Win32.DWORD;   --  lmwksta.h:204
         wki302_siz_work_buf : Win32.DWORD;   --  lmwksta.h:205
         wki302_max_wrk_cache : Win32.DWORD;   --  lmwksta.h:206
         wki302_sess_timeout : Win32.DWORD;   --  lmwksta.h:207
         wki302_siz_error : Win32.DWORD;   --  lmwksta.h:208
         wki302_num_alerts : Win32.DWORD;   --  lmwksta.h:209
         wki302_num_services : Win32.DWORD;   --  lmwksta.h:210
         wki302_errlog_sz : Win32.DWORD;   --  lmwksta.h:211
         wki302_print_buf_time : Win32.DWORD;   --  lmwksta.h:212
         wki302_num_char_buf : Win32.DWORD;   --  lmwksta.h:213
         wki302_siz_char_buf : Win32.DWORD;   --  lmwksta.h:214
         wki302_wrk_heuristics : Win32.Winnt.LPTSTR;
         --  lmwksta.h:215
         wki302_mailslots : Win32.DWORD;   --  lmwksta.h:216
         wki302_num_dgram_buf : Win32.DWORD;   --  lmwksta.h:217
      end record;

   type WKSTA_INFO_402 is                                  --  lmwksta.h:226
      record
         wki402_char_wait : Win32.DWORD;   --  lmwksta.h:227
         wki402_collection_time : Win32.DWORD;   --  lmwksta.h:228
         wki402_maximum_collection_count : Win32.DWORD;   --  lmwksta.h:229
         wki402_keep_conn : Win32.DWORD;   --  lmwksta.h:230
         wki402_keep_search : Win32.DWORD;   --  lmwksta.h:231
         wki402_max_cmds : Win32.DWORD;   --  lmwksta.h:232
         wki402_num_work_buf : Win32.DWORD;   --  lmwksta.h:233
         wki402_siz_work_buf : Win32.DWORD;   --  lmwksta.h:234
         wki402_max_wrk_cache : Win32.DWORD;   --  lmwksta.h:235
         wki402_sess_timeout : Win32.DWORD;   --  lmwksta.h:236
         wki402_siz_error : Win32.DWORD;   --  lmwksta.h:237
         wki402_num_alerts : Win32.DWORD;   --  lmwksta.h:238
         wki402_num_services : Win32.DWORD;   --  lmwksta.h:239
         wki402_errlog_sz : Win32.DWORD;   --  lmwksta.h:240
         wki402_print_buf_time : Win32.DWORD;   --  lmwksta.h:241
         wki402_num_char_buf : Win32.DWORD;   --  lmwksta.h:242
         wki402_siz_char_buf : Win32.DWORD;   --  lmwksta.h:243
         wki402_wrk_heuristics : Win32.Winnt.LPTSTR;
         --  lmwksta.h:244
         wki402_mailslots : Win32.DWORD;   --  lmwksta.h:245
         wki402_num_dgram_buf : Win32.DWORD;   --  lmwksta.h:246
         wki402_max_threads : Win32.DWORD;   --  lmwksta.h:247
      end record;

   type WKSTA_INFO_502 is                                  --  lmwksta.h:256
      record
         wki502_char_wait : Win32.DWORD;
         --  lmwksta.h:257
         wki502_collection_time : Win32.DWORD;
         --  lmwksta.h:258
         wki502_maximum_collection_count : Win32.DWORD;
         --  lmwksta.h:259
         wki502_keep_conn : Win32.DWORD;
         --  lmwksta.h:260
         wki502_max_cmds : Win32.DWORD;
         --  lmwksta.h:261
         wki502_sess_timeout : Win32.DWORD;
         --  lmwksta.h:262
         wki502_siz_char_buf : Win32.DWORD;
         --  lmwksta.h:263
         wki502_max_threads : Win32.DWORD;
         --  lmwksta.h:264
         wki502_lock_quota : Win32.DWORD;
         --  lmwksta.h:266
         wki502_lock_increment : Win32.DWORD;
         --  lmwksta.h:267
         wki502_lock_maximum : Win32.DWORD;
         --  lmwksta.h:268
         wki502_pipe_increment : Win32.DWORD;
         --  lmwksta.h:269
         wki502_pipe_maximum : Win32.DWORD;
         --  lmwksta.h:270
         wki502_cache_file_timeout : Win32.DWORD;
         --  lmwksta.h:271
         wki502_dormant_file_limit : Win32.DWORD;
         --  lmwksta.h:272
         wki502_read_ahead_throughput : Win32.DWORD;
         --  lmwksta.h:273
         wki502_num_mailslot_buffers : Win32.DWORD;
         --  lmwksta.h:275
         wki502_num_srv_announce_buffers : Win32.DWORD;
         --  lmwksta.h:276
         wki502_max_illegal_datagram_events : Win32.DWORD;
         --  lmwksta.h:277
         wki502_illegal_datagram_event_reset_frequency : Win32.DWORD;
         --  lmwksta.h:278
         wki502_log_election_packets : Win32.BOOL;
         --  lmwksta.h:279
         wki502_use_opportunistic_locking : Win32.BOOL;
         --  lmwksta.h:281
         wki502_use_unlock_behind : Win32.BOOL;
         --  lmwksta.h:282
         wki502_use_close_behind : Win32.BOOL;
         --  lmwksta.h:283
         wki502_buf_named_pipes : Win32.BOOL;
         --  lmwksta.h:284
         wki502_use_lock_read_unlock : Win32.BOOL;
         --  lmwksta.h:285
         wki502_utilize_nt_caching : Win32.BOOL;
         --  lmwksta.h:286
         wki502_use_raw_read : Win32.BOOL;
         --  lmwksta.h:287
         wki502_use_raw_write : Win32.BOOL;
         --  lmwksta.h:288
         wki502_use_write_raw_data : Win32.BOOL;
         --  lmwksta.h:289
         wki502_use_encryption : Win32.BOOL;
         --  lmwksta.h:290
         wki502_buf_files_deny_write : Win32.BOOL;
         --  lmwksta.h:291
         wki502_buf_read_only_files : Win32.BOOL;
         --  lmwksta.h:292
         wki502_force_core_create_mode : Win32.BOOL;
         --  lmwksta.h:293
         wki502_use_512_byte_max_transfer : Win32.BOOL;
         --  lmwksta.h:294
      end record;

   type WKSTA_INFO_1010 is                                 --  lmwksta.h:306
      record
         wki1010_char_wait : Win32.DWORD;                 --  lmwksta.h:307
      end record;

   type WKSTA_INFO_1011 is                                 --  lmwksta.h:310
      record
         wki1011_collection_time : Win32.DWORD;           --  lmwksta.h:311
      end record;

   type WKSTA_INFO_1012 is                                 --  lmwksta.h:314
      record
         wki1012_maximum_collection_count : Win32.DWORD;  --  lmwksta.h:315
      end record;

   type WKSTA_INFO_1027 is                                 --  lmwksta.h:322
      record
         wki1027_errlog_sz : Win32.DWORD;                 --  lmwksta.h:323
      end record;

   type WKSTA_INFO_1028 is                                 --  lmwksta.h:326
      record
         wki1028_print_buf_time : Win32.DWORD;            --  lmwksta.h:327
      end record;

   type WKSTA_INFO_1032 is                                 --  lmwksta.h:330
      record
         wki1032_wrk_heuristics : Win32.DWORD;            --  lmwksta.h:331
      end record;

   type WKSTA_INFO_1013 is                                 --  lmwksta.h:339
      record
         wki1013_keep_conn : Win32.DWORD;                 --  lmwksta.h:340
      end record;

   type WKSTA_INFO_1018 is                                 --  lmwksta.h:343
      record
         wki1018_sess_timeout : Win32.DWORD;              --  lmwksta.h:344
      end record;

   type WKSTA_INFO_1023 is                                 --  lmwksta.h:347
      record
         wki1023_siz_char_buf : Win32.DWORD;              --  lmwksta.h:348
      end record;

   type WKSTA_INFO_1033 is                                 --  lmwksta.h:351
      record
         wki1033_max_threads : Win32.DWORD;               --  lmwksta.h:352
      end record;

   type WKSTA_INFO_1041 is                                 --  lmwksta.h:358
      record
         wki1041_lock_quota : Win32.DWORD;                --  lmwksta.h:359
      end record;

   type WKSTA_INFO_1042 is                                 --  lmwksta.h:362
      record
         wki1042_lock_increment : Win32.DWORD;            --  lmwksta.h:363
      end record;

   type WKSTA_INFO_1043 is                                 --  lmwksta.h:366
      record
         wki1043_lock_maximum : Win32.DWORD;              --  lmwksta.h:367
      end record;

   type WKSTA_INFO_1044 is                                 --  lmwksta.h:370
      record
         wki1044_pipe_increment : Win32.DWORD;            --  lmwksta.h:371
      end record;

   type WKSTA_INFO_1045 is                                 --  lmwksta.h:374
      record
         wki1045_pipe_maximum : Win32.DWORD;              --  lmwksta.h:375
      end record;

   type WKSTA_INFO_1046 is                                 --  lmwksta.h:378
      record
         wki1046_dormant_file_limit : Win32.DWORD;        --  lmwksta.h:379
      end record;

   type WKSTA_INFO_1047 is                                 --  lmwksta.h:382
      record
         wki1047_cache_file_timeout : Win32.DWORD;        --  lmwksta.h:383
      end record;

   type WKSTA_INFO_1048 is                                 --  lmwksta.h:386
      record
         wki1048_use_opportunistic_locking : Win32.BOOL;  --  lmwksta.h:387
      end record;

   type WKSTA_INFO_1049 is                                 --  lmwksta.h:390
      record
         wki1049_use_unlock_behind : Win32.BOOL;          --  lmwksta.h:391
      end record;

   type WKSTA_INFO_1050 is                                 --  lmwksta.h:394
      record
         wki1050_use_close_behind : Win32.BOOL;           --  lmwksta.h:395
      end record;

   type WKSTA_INFO_1051 is                                 --  lmwksta.h:398
      record
         wki1051_buf_named_pipes : Win32.BOOL;            --  lmwksta.h:399
      end record;

   type WKSTA_INFO_1052 is                                 --  lmwksta.h:402
      record
         wki1052_use_lock_read_unlock : Win32.BOOL;       --  lmwksta.h:403
      end record;

   type WKSTA_INFO_1053 is                                 --  lmwksta.h:406
      record
         wki1053_utilize_nt_caching : Win32.BOOL;         --  lmwksta.h:407
      end record;

   type WKSTA_INFO_1054 is                                 --  lmwksta.h:410
      record
         wki1054_use_raw_read : Win32.BOOL;               --  lmwksta.h:411
      end record;

   type WKSTA_INFO_1055 is                                 --  lmwksta.h:414
      record
         wki1055_use_raw_write : Win32.BOOL;              --  lmwksta.h:415
      end record;

   type WKSTA_INFO_1056 is                                 --  lmwksta.h:418
      record
         wki1056_use_write_raw_data : Win32.BOOL;         --  lmwksta.h:419
      end record;

   type WKSTA_INFO_1057 is                                 --  lmwksta.h:422
      record
         wki1057_use_encryption : Win32.BOOL;             --  lmwksta.h:423
      end record;

   type WKSTA_INFO_1058 is                                 --  lmwksta.h:426
      record
         wki1058_buf_files_deny_write : Win32.BOOL;       --  lmwksta.h:427
      end record;

   type WKSTA_INFO_1059 is                                 --  lmwksta.h:430
      record
         wki1059_buf_read_only_files : Win32.BOOL;        --  lmwksta.h:431
      end record;

   type WKSTA_INFO_1060 is                                 --  lmwksta.h:434
      record
         wki1060_force_core_create_mode : Win32.BOOL;     --  lmwksta.h:435
      end record;

   type WKSTA_INFO_1061 is                                 --  lmwksta.h:438
      record
         wki1061_use_512_byte_max_transfer : Win32.BOOL;  --  lmwksta.h:439
      end record;

   type WKSTA_INFO_1062 is                                 --  lmwksta.h:442
      record
         wki1062_read_ahead_throughput : Win32.DWORD;     --  lmwksta.h:443
      end record;

   type WKSTA_USER_INFO_0 is                               --  lmwksta.h:451
      record
         wkui0_username : Win32.Winnt.LPTSTR;             --  lmwksta.h:452
      end record;

   type WKSTA_USER_INFO_1 is                               --  lmwksta.h:459
      record
         wkui1_username : Win32.Winnt.LPTSTR;         --  lmwksta.h:460
         wkui1_logon_domain : Win32.Winnt.LPTSTR;         --  lmwksta.h:461
         wkui1_oth_domains : Win32.Winnt.LPTSTR;         --  lmwksta.h:462
         wkui1_logon_server : Win32.Winnt.LPTSTR;         --  lmwksta.h:463
      end record;

   type WKSTA_USER_INFO_1101 is                            --  lmwksta.h:469
      record
         wkui1101_oth_domains : Win32.Winnt.LPTSTR;       --  lmwksta.h:470
      end record;

   type WKSTA_TRANSPORT_INFO_0 is                          --  lmwksta.h:478
      record
         wkti0_quality_of_service : Win32.DWORD;          --  lmwksta.h:479
         wkti0_number_of_vcs : Win32.DWORD;          --  lmwksta.h:480
         wkti0_transport_name : Win32.Winnt.LPTSTR;   --  lmwksta.h:481
         wkti0_transport_address : Win32.Winnt.LPTSTR;   --  lmwksta.h:482
         wkti0_wan_ish : Win32.BOOL;           --  lmwksta.h:483
      end record;

   function NetWkstaGetInfo
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmwksta.h:81

   function NetWkstaSetInfo
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buffer : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmwksta.h:88

   function NetWkstaUserGetInfo
     (reserved : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmwksta.h:96

   function NetWkstaUserSetInfo
     (reserved : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmwksta.h:103

   function NetWkstaUserEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmwksta.h:111

   function NetWkstaTransportAdd
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmwksta.h:122

   function NetWkstaTransportDel
     (servername : Win32.Winnt.LPTSTR;
      transportname : Win32.Winnt.LPTSTR;
      ucond : Win32.DWORD)
     return Win32.DWORD;                          --  lmwksta.h:130

   function NetWkstaTransportEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmwksta.h:137

private

   pragma Convention (C, WKSTA_INFO_100);                   --  lmwksta.h:158
   pragma Convention (C, WKSTA_INFO_101);                   --  lmwksta.h:169
   pragma Convention (C, WKSTA_INFO_102);                   --  lmwksta.h:181
   pragma Convention (C, WKSTA_INFO_302);                   --  lmwksta.h:197
   pragma Convention (C, WKSTA_INFO_402);                   --  lmwksta.h:226
   pragma Convention (C, WKSTA_INFO_502);                   --  lmwksta.h:256
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1010);      --  lmwksta.h :306
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1011);      --  lmwksta.h :310
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1012);      --  lmwksta.h :314
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1027);      --  lmwksta.h :322
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1028);      --  lmwksta.h :326
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1032);      --  lmwksta.h :330
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1013);      --  lmwksta.h :339
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1018);      --  lmwksta.h :343
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1023);      --  lmwksta.h :347
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1033);      --  lmwksta.h :351
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1041);      --  lmwksta.h :358
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1042);      --  lmwksta.h :362
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1043);      --  lmwksta.h :366
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1044);      --  lmwksta.h :370
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1045);      --  lmwksta.h :374
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1046);      --  lmwksta.h :378
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1047);      --  lmwksta.h :382
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1048);      --  lmwksta.h :386
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1049);      --  lmwksta.h :390
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1050);      --  lmwksta.h :394
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1051);      --  lmwksta.h :398
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1052);      --  lmwksta.h :402
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1053);      --  lmwksta.h :406
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1054);      --  lmwksta.h :410
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1055);      --  lmwksta.h :414
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1056);      --  lmwksta.h :418
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1057);      --  lmwksta.h :422
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1058);      --  lmwksta.h :426
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1059);      --  lmwksta.h :430
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1060);      --  lmwksta.h :434
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1061);      --  lmwksta.h :438
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1062);      --  lmwksta.h :442
   pragma Convention (C_Pass_By_Copy, WKSTA_USER_INFO_0);    --  lmwksta.h :451
   pragma Convention (C_Pass_By_Copy, WKSTA_USER_INFO_1);    --  lmwksta.h :459
   pragma Convention (C_Pass_By_Copy, WKSTA_USER_INFO_1101); --  lmwksta.h :469
   pragma Convention (C, WKSTA_TRANSPORT_INFO_0);           --  lmwksta.h:478

   pragma Import (Stdcall, NetWkstaGetInfo, "NetWkstaGetInfo");
   --  lmwksta.h:81
   pragma Import (Stdcall, NetWkstaSetInfo, "NetWkstaSetInfo");
   --  lmwksta.h:88
   pragma Import (Stdcall, NetWkstaUserGetInfo, "NetWkstaUserGetInfo");
   --  lmwksta.h:96
   pragma Import (Stdcall, NetWkstaUserSetInfo, "NetWkstaUserSetInfo");
   --  lmwksta.h:103
   pragma Import (Stdcall, NetWkstaUserEnum, "NetWkstaUserEnum");
   --  lmwksta.h:111
   pragma Import (Stdcall, NetWkstaTransportAdd, "NetWkstaTransportAdd");
   --  lmwksta.h:122
   pragma Import (Stdcall, NetWkstaTransportDel, "NetWkstaTransportDel");
   --  lmwksta.h:130
   pragma Import (Stdcall, NetWkstaTransportEnum, "NetWkstaTransportEnum");
   --  lmwksta.h:137

end Win32.Lmwksta;
