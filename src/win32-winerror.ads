-- $Source$
-- $Revision$ $Date$ $Author$
-- See end of file for Copyright (c) information.

package Win32.Winerror is

    FACILITY_WINDOWS                  : constant := 8;      -- winerror.h:59
    FACILITY_STORAGE                  : constant := 3;      -- winerror.h:60
    FACILITY_RPC                      : constant := 1;      -- winerror.h:61
    FACILITY_WIN32                    : constant := 7;      -- winerror.h:62
    FACILITY_CONTROL                  : constant := 10;     -- winerror.h:63
    FACILITY_NULL                     : constant := 0;      -- winerror.h:64
    FACILITY_ITF                      : constant := 4;      -- winerror.h:65
    FACILITY_DISPATCH                 : constant := 2;      -- winerror.h:66
    ERROR_SUCCESS                     : constant := 0;      -- winerror.h:81
    NO_ERROR                          : constant := 0;      -- winerror.h:83
    ERROR_INVALID_FUNCTION            : constant := 1;      -- winerror.h:92
    ERROR_FILE_NOT_FOUND              : constant := 2;      -- winerror.h:101
    ERROR_PATH_NOT_FOUND              : constant := 3;      -- winerror.h:110
    ERROR_TOO_MANY_OPEN_FILES         : constant := 4;      -- winerror.h:119
    ERROR_ACCESS_DENIED               : constant := 5;      -- winerror.h:128
    ERROR_INVALID_HANDLE              : constant := 6;      -- winerror.h:137
    ERROR_ARENA_TRASHED               : constant := 7;      -- winerror.h:146
    ERROR_NOT_ENOUGH_MEMORY           : constant := 8;      -- winerror.h:155
    ERROR_INVALID_BLOCK               : constant := 9;      -- winerror.h:164
    ERROR_BAD_ENVIRONMENT             : constant := 10;     -- winerror.h:173
    ERROR_BAD_FORMAT                  : constant := 11;     -- winerror.h:183
    ERROR_INVALID_ACCESS              : constant := 12;     -- winerror.h:192
    ERROR_INVALID_DATA                : constant := 13;     -- winerror.h:201
    ERROR_OUTOFMEMORY                 : constant := 14;     -- winerror.h:210
    ERROR_INVALID_DRIVE               : constant := 15;     -- winerror.h:219
    ERROR_CURRENT_DIRECTORY           : constant := 16;     -- winerror.h:228
    ERROR_NOT_SAME_DEVICE             : constant := 17;     -- winerror.h:238
    ERROR_NO_MORE_FILES               : constant := 18;     -- winerror.h:247
    ERROR_WRITE_PROTECT               : constant := 19;     -- winerror.h:256
    ERROR_BAD_UNIT                    : constant := 20;     -- winerror.h:265
    ERROR_NOT_READY                   : constant := 21;     -- winerror.h:274
    ERROR_BAD_COMMAND                 : constant := 22;     -- winerror.h:283
    ERROR_CRC                         : constant := 23;     -- winerror.h:292
    ERROR_BAD_LENGTH                  : constant := 24;     -- winerror.h:302
    ERROR_SEEK                        : constant := 25;     -- winerror.h:312
    ERROR_NOT_DOS_DISK                : constant := 26;     -- winerror.h:321
    ERROR_SECTOR_NOT_FOUND            : constant := 27;     -- winerror.h:330
    ERROR_OUT_OF_PAPER                : constant := 28;     -- winerror.h:339
    ERROR_WRITE_FAULT                 : constant := 29;     -- winerror.h:348
    ERROR_READ_FAULT                  : constant := 30;     -- winerror.h:357
    ERROR_GEN_FAILURE                 : constant := 31;     -- winerror.h:366
    ERROR_SHARING_VIOLATION           : constant := 32;     -- winerror.h:376
    ERROR_LOCK_VIOLATION              : constant := 33;     -- winerror.h:386
    ERROR_WRONG_DISK                  : constant := 34;     -- winerror.h:397
    ERROR_SHARING_BUFFER_EXCEEDED     : constant := 36;     -- winerror.h:406
    ERROR_HANDLE_EOF                  : constant := 38;     -- winerror.h:415
    ERROR_HANDLE_DISK_FULL            : constant := 39;     -- winerror.h:424
    ERROR_NOT_SUPPORTED               : constant := 50;     -- winerror.h:433
    ERROR_REM_NOT_LIST                : constant := 51;     -- winerror.h:442
    ERROR_DUP_NAME                    : constant := 52;     -- winerror.h:451
    ERROR_BAD_NETPATH                 : constant := 53;     -- winerror.h:460
    ERROR_NETWORK_BUSY                : constant := 54;     -- winerror.h:469
    ERROR_DEV_NOT_EXIST               : constant := 55;     -- winerror.h:479
    ERROR_TOO_MANY_CMDS               : constant := 56;     -- winerror.h:488
    ERROR_ADAP_HDW_ERR                : constant := 57;     -- winerror.h:497
    ERROR_BAD_NET_RESP                : constant := 58;     -- winerror.h:507
    ERROR_UNEXP_NET_ERR               : constant := 59;     -- winerror.h:516
    ERROR_BAD_REM_ADAP                : constant := 60;     -- winerror.h:525
    ERROR_PRINTQ_FULL                 : constant := 61;     -- winerror.h:534
    ERROR_NO_SPOOL_SPACE              : constant := 62;     -- winerror.h:544
    ERROR_PRINT_CANCELLED             : constant := 63;     -- winerror.h:553
    ERROR_NETNAME_DELETED             : constant := 64;     -- winerror.h:562
    ERROR_NETWORK_ACCESS_DENIED       : constant := 65;     -- winerror.h:571
    ERROR_BAD_DEV_TYPE                : constant := 66;     -- winerror.h:580
    ERROR_BAD_NET_NAME                : constant := 67;     -- winerror.h:589
    ERROR_TOO_MANY_NAMES              : constant := 68;     -- winerror.h:599
    ERROR_TOO_MANY_SESS               : constant := 69;     -- winerror.h:608
    ERROR_SHARING_PAUSED              : constant := 70;     -- winerror.h:618
    ERROR_REQ_NOT_ACCEP               : constant := 71;     -- winerror.h:628
    ERROR_REDIR_PAUSED                : constant := 72;     -- winerror.h:637
    ERROR_FILE_EXISTS                 : constant := 80;     -- winerror.h:646
    ERROR_CANNOT_MAKE                 : constant := 82;     -- winerror.h:655
    ERROR_FAIL_I24                    : constant := 83;     -- winerror.h:664
    ERROR_OUT_OF_STRUCTURES           : constant := 84;     -- winerror.h:673
    ERROR_ALREADY_ASSIGNED            : constant := 85;     -- winerror.h:682
    ERROR_INVALID_PASSWORD            : constant := 86;     -- winerror.h:691
    ERROR_INVALID_PARAMETER           : constant := 87;     -- winerror.h:700
    ERROR_NET_WRITE_FAULT             : constant := 88;     -- winerror.h:709
    ERROR_NO_PROC_SLOTS               : constant := 89;     -- winerror.h:719
    ERROR_TOO_MANY_SEMAPHORES         : constant := 100;    -- winerror.h:728
    ERROR_EXCL_SEM_ALREADY_OWNED      : constant := 101;    -- winerror.h:737
    ERROR_SEM_IS_SET                  : constant := 102;    -- winerror.h:746
    ERROR_TOO_MANY_SEM_REQUESTS       : constant := 103;    -- winerror.h:755
    ERROR_INVALID_AT_INTERRUPT_TIME   : constant := 104;    -- winerror.h:764
    ERROR_SEM_OWNER_DIED              : constant := 105;    -- winerror.h:773
    ERROR_SEM_USER_LIMIT              : constant := 106;    -- winerror.h:782
    ERROR_DISK_CHANGE                 : constant := 107;    -- winerror.h:791
    ERROR_DRIVE_LOCKED                : constant := 108;    -- winerror.h:801
    ERROR_BROKEN_PIPE                 : constant := 109;    -- winerror.h:810
    ERROR_OPEN_FAILED                 : constant := 110;    -- winerror.h:820
    ERROR_BUFFER_OVERFLOW             : constant := 111;    -- winerror.h:829
    ERROR_DISK_FULL                   : constant := 112;    -- winerror.h:838
    ERROR_NO_MORE_SEARCH_HANDLES      : constant := 113;    -- winerror.h:847
    ERROR_INVALID_TARGET_HANDLE       : constant := 114;    -- winerror.h:856
    ERROR_INVALID_CATEGORY            : constant := 117;    -- winerror.h:866
    ERROR_INVALID_VERIFY_SWITCH       : constant := 118;    -- winerror.h:876
    ERROR_BAD_DRIVER_LEVEL            : constant := 119;    -- winerror.h:885
    ERROR_CALL_NOT_IMPLEMENTED        : constant := 120;    -- winerror.h:894
    ERROR_SEM_TIMEOUT                 : constant := 121;    -- winerror.h:903
    ERROR_INSUFFICIENT_BUFFER         : constant := 122;    -- winerror.h:913
    ERROR_INVALID_NAME                : constant := 123;    -- winerror.h:922
    ERROR_INVALID_LEVEL               : constant := 124;    -- winerror.h:931
    ERROR_NO_VOLUME_LABEL             : constant := 125;    -- winerror.h:940
    ERROR_MOD_NOT_FOUND               : constant := 126;    -- winerror.h:949
    ERROR_PROC_NOT_FOUND              : constant := 127;    -- winerror.h:958
    ERROR_WAIT_NO_CHILDREN            : constant := 128;    -- winerror.h:967
    ERROR_CHILD_NOT_COMPLETE          : constant := 129;    -- winerror.h:976
    ERROR_DIRECT_ACCESS_HANDLE        : constant := 130;    -- winerror.h:986
    ERROR_NEGATIVE_SEEK               : constant := 131;    -- winerror.h:995
    ERROR_SEEK_ON_DEVICE              : constant := 132;    -- winerror.h:1004
    ERROR_IS_JOIN_TARGET              : constant := 133;    -- winerror.h:1015
    ERROR_IS_JOINED                   : constant := 134;    -- winerror.h:1026
    ERROR_IS_SUBSTED                  : constant := 135;    -- winerror.h:1037
    ERROR_NOT_JOINED                  : constant := 136;    -- winerror.h:1047
    ERROR_NOT_SUBSTED                 : constant := 137;    -- winerror.h:1057
    ERROR_JOIN_TO_JOIN                : constant := 138;    -- winerror.h:1067
    ERROR_SUBST_TO_SUBST              : constant := 139;    -- winerror.h:1077
    ERROR_JOIN_TO_SUBST               : constant := 140;    -- winerror.h:1087
    ERROR_SUBST_TO_JOIN               : constant := 141;    -- winerror.h:1097
    ERROR_BUSY_DRIVE                  : constant := 142;    -- winerror.h:1106
    ERROR_SAME_DRIVE                  : constant := 143;    -- winerror.h:1116
    ERROR_DIR_NOT_ROOT                : constant := 144;    -- winerror.h:1125
    ERROR_DIR_NOT_EMPTY               : constant := 145;    -- winerror.h:1134
    ERROR_IS_SUBST_PATH               : constant := 146;    -- winerror.h:1144
    ERROR_IS_JOIN_PATH                : constant := 147;    -- winerror.h:1154
    ERROR_PATH_BUSY                   : constant := 148;    -- winerror.h:1163
    ERROR_IS_SUBST_TARGET             : constant := 149;    -- winerror.h:1175
    ERROR_SYSTEM_TRACE                : constant := 150;    -- winerror.h:1185
    ERROR_INVALID_EVENT_COUNT         : constant := 151;    -- winerror.h:1195
    ERROR_TOO_MANY_MUXWAITERS         : constant := 152;    -- winerror.h:1205
    ERROR_INVALID_LIST_FORMAT         : constant := 153;    -- winerror.h:1214
    ERROR_LABEL_TOO_LONG              : constant := 154;    -- winerror.h:1226
    ERROR_TOO_MANY_TCBS               : constant := 155;    -- winerror.h:1235
    ERROR_SIGNAL_REFUSED              : constant := 156;    -- winerror.h:1244
    ERROR_DISCARDED                   : constant := 157;    -- winerror.h:1253
    ERROR_NOT_LOCKED                  : constant := 158;    -- winerror.h:1262
    ERROR_BAD_THREADID_ADDR           : constant := 159;    -- winerror.h:1271
    ERROR_BAD_ARGUMENTS               : constant := 160;    -- winerror.h:1280
    ERROR_BAD_PATHNAME                : constant := 161;    -- winerror.h:1289
    ERROR_SIGNAL_PENDING              : constant := 162;    -- winerror.h:1298
    ERROR_MAX_THRDS_REACHED           : constant := 164;    -- winerror.h:1307
    ERROR_LOCK_FAILED                 : constant := 167;    -- winerror.h:1316
    ERROR_BUSY                        : constant := 170;    -- winerror.h:1325
    ERROR_CANCEL_VIOLATION            : constant := 173;    -- winerror.h:1334
    ERROR_ATOMIC_LOCKS_NOT_SUPPORTED  : constant := 174;    -- winerror.h:1343
    ERROR_INVALID_SEGMENT_NUMBER      : constant := 180;    -- winerror.h:1352
    ERROR_INVALID_ORDINAL             : constant := 182;    -- winerror.h:1361
    ERROR_ALREADY_EXISTS              : constant := 183;    -- winerror.h:1370
    ERROR_INVALID_FLAG_NUMBER         : constant := 186;    -- winerror.h:1379
    ERROR_SEM_NOT_FOUND               : constant := 187;    -- winerror.h:1388
    ERROR_INVALID_STARTING_CODESEG    : constant := 188;    -- winerror.h:1397
    ERROR_INVALID_STACKSEG            : constant := 189;    -- winerror.h:1406
    ERROR_INVALID_MODULETYPE          : constant := 190;    -- winerror.h:1415
    ERROR_INVALID_EXE_SIGNATURE       : constant := 191;    -- winerror.h:1424
    ERROR_EXE_MARKED_INVALID          : constant := 192;    -- winerror.h:1433
    ERROR_BAD_EXE_FORMAT              : constant := 193;    -- winerror.h:1442
    ERROR_ITERATED_DATA_EXCEEDS_64K   : constant := 194;    -- winerror.h:1451
    ERROR_INVALID_MINALLOCSIZE        : constant := 195;    -- winerror.h:1460
    ERROR_DYNLINK_FROM_INVALID_RING   : constant := 196;    -- winerror.h:1470
    ERROR_IOPL_NOT_ENABLED            : constant := 197;    -- winerror.h:1480
    ERROR_INVALID_SEGDPL              : constant := 198;    -- winerror.h:1489
    ERROR_AUTODATASEG_EXCEEDS_64K     : constant := 199;    -- winerror.h:1499
    ERROR_RING2SEG_MUST_BE_MOVABLE    : constant := 200;    -- winerror.h:1508
    ERROR_RELOC_CHAIN_XEEDS_SEGLIM    : constant := 201;    -- winerror.h:1517
    ERROR_INFLOOP_IN_RELOC_CHAIN      : constant := 202;    -- winerror.h:1526
    ERROR_ENVVAR_NOT_FOUND            : constant := 203;    -- winerror.h:1536
    ERROR_NO_SIGNAL_SENT              : constant := 205;    -- winerror.h:1546
    ERROR_FILENAME_EXCED_RANGE        : constant := 206;    -- winerror.h:1555
    ERROR_RING2_STACK_IN_USE          : constant := 207;    -- winerror.h:1564
    ERROR_META_EXPANSION_TOO_LONG     : constant := 208;    -- winerror.h:1574
    ERROR_INVALID_SIGNAL_NUMBER       : constant := 209;    -- winerror.h:1583
    ERROR_THREAD_1_INACTIVE           : constant := 210;    -- winerror.h:1592
    ERROR_LOCKED                      : constant := 212;    -- winerror.h:1601
    ERROR_TOO_MANY_MODULES            : constant := 214;    -- winerror.h:1611
    ERROR_NESTING_NOT_ALLOWED         : constant := 215;    -- winerror.h:1620
    ERROR_BAD_PIPE                    : constant := 230;    -- winerror.h:1629
    ERROR_PIPE_BUSY                   : constant := 231;    -- winerror.h:1638
    ERROR_NO_DATA                     : constant := 232;    -- winerror.h:1647
    ERROR_PIPE_NOT_CONNECTED          : constant := 233;    -- winerror.h:1656
    ERROR_MORE_DATA                   : constant := 234;    -- winerror.h:1665
    ERROR_VC_DISCONNECTED             : constant := 240;    -- winerror.h:1674
    ERROR_INVALID_EA_NAME             : constant := 254;    -- winerror.h:1683
    ERROR_EA_LIST_INCONSISTENT        : constant := 255;    -- winerror.h:1692
    ERROR_NO_MORE_ITEMS               : constant := 259;    -- winerror.h:1701
    ERROR_CANNOT_COPY                 : constant := 266;    -- winerror.h:1710
    ERROR_DIRECTORY                   : constant := 267;    -- winerror.h:1719
    ERROR_EAS_DIDNT_FIT               : constant := 275;    -- winerror.h:1728
    ERROR_EA_FILE_CORRUPT             : constant := 276;    -- winerror.h:1737
    ERROR_EA_TABLE_FULL               : constant := 277;    -- winerror.h:1746
    ERROR_INVALID_EA_HANDLE           : constant := 278;    -- winerror.h:1755
    ERROR_EAS_NOT_SUPPORTED           : constant := 282;    -- winerror.h:1764
    ERROR_NOT_OWNER                   : constant := 288;    -- winerror.h:1773
    ERROR_TOO_MANY_POSTS              : constant := 298;    -- winerror.h:1782
    ERROR_PARTIAL_COPY                : constant := 299;    -- winerror.h:1791
    ERROR_MR_MID_NOT_FOUND            : constant := 317;    -- winerror.h:1801
    ERROR_INVALID_ADDRESS             : constant := 487;    -- winerror.h:1810
    ERROR_ARITHMETIC_OVERFLOW         : constant := 534;    -- winerror.h:1819
    ERROR_PIPE_CONNECTED              : constant := 535;    -- winerror.h:1828
    ERROR_PIPE_LISTENING              : constant := 536;    -- winerror.h:1837
    ERROR_EA_ACCESS_DENIED            : constant := 994;    -- winerror.h:1846
    ERROR_OPERATION_ABORTED           : constant := 995;    -- winerror.h:1856
    ERROR_IO_INCOMPLETE               : constant := 996;    -- winerror.h:1865
    ERROR_IO_PENDING                  : constant := 997;    -- winerror.h:1874
    ERROR_NOACCESS                    : constant := 998;    -- winerror.h:1883
    ERROR_SWAPERROR                   : constant := 999;    -- winerror.h:1892
    ERROR_STACK_OVERFLOW              : constant := 1001;   -- winerror.h:1901
    ERROR_INVALID_MESSAGE             : constant := 1002;   -- winerror.h:1910
    ERROR_CAN_NOT_COMPLETE            : constant := 1003;   -- winerror.h:1919
    ERROR_INVALID_FLAGS               : constant := 1004;   -- winerror.h:1928
    ERROR_UNRECOGNIZED_VOLUME         : constant := 1005;   -- winerror.h:1939
    ERROR_FILE_INVALID                : constant := 1006;   -- winerror.h:1949
    ERROR_FULLSCREEN_MODE             : constant := 1007;   -- winerror.h:1958
    ERROR_NO_TOKEN                    : constant := 1008;   -- winerror.h:1967
    ERROR_BADDB                       : constant := 1009;   -- winerror.h:1976
    ERROR_BADKEY                      : constant := 1010;   -- winerror.h:1985
    ERROR_CANTOPEN                    : constant := 1011;   -- winerror.h:1994
    ERROR_CANTREAD                    : constant := 1012;   -- winerror.h:2003
    ERROR_CANTWRITE                   : constant := 1013;   -- winerror.h:2012
    ERROR_REGISTRY_RECOVERED          : constant := 1014;   -- winerror.h:2022
    ERROR_REGISTRY_CORRUPT            : constant := 1015;   -- winerror.h:2034
    ERROR_REGISTRY_IO_FAILED          : constant := 1016;   -- winerror.h:2045
    ERROR_NOT_REGISTRY_FILE           : constant := 1017;   -- winerror.h:2055
    ERROR_KEY_DELETED                 : constant := 1018;   -- winerror.h:2064
    ERROR_NO_LOG_SPACE                : constant := 1019;   -- winerror.h:2073
    ERROR_KEY_HAS_CHILDREN            : constant := 1020;   -- winerror.h:2083
    ERROR_CHILD_MUST_BE_VOLATILE      : constant := 1021;   -- winerror.h:2092
    ERROR_NOTIFY_ENUM_DIR             : constant := 1022;   -- winerror.h:2103
    ERROR_DEPENDENT_SERVICES_RUNNING  : constant := 1051;   -- winerror.h:2113
    ERROR_INVALID_SERVICE_CONTROL     : constant := 1052;   -- winerror.h:2122
    ERROR_SERVICE_REQUEST_TIMEOUT     : constant := 1053;   -- winerror.h:2132
    ERROR_SERVICE_NO_THREAD           : constant := 1054;   -- winerror.h:2141
    ERROR_SERVICE_DATABASE_LOCKED     : constant := 1055;   -- winerror.h:2150
    ERROR_SERVICE_ALREADY_RUNNING     : constant := 1056;   -- winerror.h:2159
    ERROR_INVALID_SERVICE_ACCOUNT     : constant := 1057;   -- winerror.h:2168
    ERROR_SERVICE_DISABLED            : constant := 1058;   -- winerror.h:2177
    ERROR_CIRCULAR_DEPENDENCY         : constant := 1059;   -- winerror.h:2186
    ERROR_SERVICE_DOES_NOT_EXIST      : constant := 1060;   -- winerror.h:2195
    ERROR_SERVICE_CANNOT_ACCEPT_CTRL  : constant := 1061;   -- winerror.h:2204
    ERROR_SERVICE_NOT_ACTIVE          : constant := 1062;   -- winerror.h:2213
    ERROR_FAILED_SERVICE_CONTROLLER_CONNECT: constant := 1063;
                                                            -- winerror.h:2222
    ERROR_EXCEPTION_IN_SERVICE         : constant := 1064;  -- winerror.h:2231
    ERROR_DATABASE_DOES_NOT_EXIST      : constant := 1065;  -- winerror.h:2240
    ERROR_SERVICE_SPECIFIC_ERROR       : constant := 1066;  -- winerror.h:2249
    ERROR_PROCESS_ABORTED              : constant := 1067;  -- winerror.h:2258
    ERROR_SERVICE_DEPENDENCY_FAIL      : constant := 1068;  -- winerror.h:2267
    ERROR_SERVICE_LOGON_FAILED         : constant := 1069;  -- winerror.h:2276
    ERROR_SERVICE_START_HANG           : constant := 1070;  -- winerror.h:2285
    ERROR_INVALID_SERVICE_LOCK         : constant := 1071;  -- winerror.h:2294
    ERROR_SERVICE_MARKED_FOR_DELETE    : constant := 1072;  -- winerror.h:2303
    ERROR_SERVICE_EXISTS               : constant := 1073;  -- winerror.h:2312
    ERROR_ALREADY_RUNNING_LKG          : constant := 1074;  -- winerror.h:2321
    ERROR_SERVICE_DEPENDENCY_DELETED   : constant := 1075;  -- winerror.h:2331
    ERROR_BOOT_ALREADY_ACCEPTED        : constant := 1076;  -- winerror.h:2341
    ERROR_SERVICE_NEVER_STARTED        : constant := 1077;  -- winerror.h:2350
    ERROR_DUPLICATE_SERVICE_NAME       : constant := 1078;  -- winerror.h:2360
    ERROR_END_OF_MEDIA                 : constant := 1100;  -- winerror.h:2369
    ERROR_FILEMARK_DETECTED            : constant := 1101;  -- winerror.h:2378
    ERROR_BEGINNING_OF_MEDIA           : constant := 1102;  -- winerror.h:2387
    ERROR_SETMARK_DETECTED             : constant := 1103;  -- winerror.h:2396
    ERROR_NO_DATA_DETECTED             : constant := 1104;  -- winerror.h:2405
    ERROR_PARTITION_FAILURE            : constant := 1105;  -- winerror.h:2414
    ERROR_INVALID_BLOCK_LENGTH         : constant := 1106;  -- winerror.h:2424
    ERROR_DEVICE_NOT_PARTITIONED       : constant := 1107;  -- winerror.h:2433
    ERROR_UNABLE_TO_LOCK_MEDIA         : constant := 1108;  -- winerror.h:2442
    ERROR_UNABLE_TO_UNLOAD_MEDIA       : constant := 1109;  -- winerror.h:2451
    ERROR_MEDIA_CHANGED                : constant := 1110;  -- winerror.h:2460
    ERROR_BUS_RESET                    : constant := 1111;  -- winerror.h:2469
    ERROR_NO_MEDIA_IN_DRIVE            : constant := 1112;  -- winerror.h:2478
    ERROR_NO_UNICODE_TRANSLATION       : constant := 1113;  -- winerror.h:2487
    ERROR_DLL_INIT_FAILED              : constant := 1114;  -- winerror.h:2496
    ERROR_SHUTDOWN_IN_PROGRESS         : constant := 1115;  -- winerror.h:2505
    ERROR_NO_SHUTDOWN_IN_PROGRESS      : constant := 1116;  -- winerror.h:2514
    ERROR_IO_DEVICE                    : constant := 1117;  -- winerror.h:2523
    ERROR_SERIAL_NO_DEVICE             : constant := 1118;  -- winerror.h:2532
    ERROR_IRQ_BUSY                     : constant := 1119;  -- winerror.h:2543
    ERROR_MORE_WRITES                  : constant := 1120;  -- winerror.h:2553
    ERROR_COUNTER_TIMEOUT              : constant := 1121;  -- winerror.h:2563
    ERROR_FLOPPY_ID_MARK_NOT_FOUND     : constant := 1122;  -- winerror.h:2572
    ERROR_FLOPPY_WRONG_CYLINDER        : constant := 1123;  -- winerror.h:2582
    ERROR_FLOPPY_UNKNOWN_ERROR         : constant := 1124;  -- winerror.h:2592
    ERROR_FLOPPY_BAD_REGISTERS         : constant := 1125;  -- winerror.h:2601
    ERROR_DISK_RECALIBRATE_FAILED      : constant := 1126;  -- winerror.h:2610
    ERROR_DISK_OPERATION_FAILED        : constant := 1127;  -- winerror.h:2619
    ERROR_DISK_RESET_FAILED            : constant := 1128;  -- winerror.h:2629
    ERROR_EOM_OVERFLOW                 : constant := 1129;  -- winerror.h:2638
    ERROR_NOT_ENOUGH_SERVER_MEMORY     : constant := 1130;  -- winerror.h:2647
    ERROR_POSSIBLE_DEADLOCK            : constant := 1131;  -- winerror.h:2656
    ERROR_MAPPED_ALIGNMENT             : constant := 1132;  -- winerror.h:2666
    ERROR_BAD_USERNAME                 : constant := 2202;  -- winerror.h:2685
    ERROR_NOT_CONNECTED                : constant := 2250;  -- winerror.h:2694
    ERROR_OPEN_FILES                   : constant := 2401;  -- winerror.h:2703
    ERROR_ACTIVE_CONNECTIONS           : constant := 2402;  -- winerror.h:2712
    ERROR_DEVICE_IN_USE                : constant := 2404;  -- winerror.h:2721
    ERROR_BAD_DEVICE                   : constant := 1200;  -- winerror.h:2730
    ERROR_CONNECTION_UNAVAIL           : constant := 1201;  -- winerror.h:2739
    ERROR_DEVICE_ALREADY_REMEMBERED    : constant := 1202;  -- winerror.h:2748
    ERROR_NO_NET_OR_BAD_PATH           : constant := 1203;  -- winerror.h:2757
    ERROR_BAD_PROVIDER                 : constant := 1204;  -- winerror.h:2766
    ERROR_CANNOT_OPEN_PROFILE          : constant := 1205;  -- winerror.h:2775
    ERROR_BAD_PROFILE                  : constant := 1206;  -- winerror.h:2784
    ERROR_NOT_CONTAINER                : constant := 1207;  -- winerror.h:2793
    ERROR_EXTENDED_ERROR               : constant := 1208;  -- winerror.h:2802
    ERROR_INVALID_GROUPNAME            : constant := 1209;  -- winerror.h:2811
    ERROR_INVALID_COMPUTERNAME         : constant := 1210;  -- winerror.h:2820
    ERROR_INVALID_EVENTNAME            : constant := 1211;  -- winerror.h:2829
    ERROR_INVALID_DOMAINNAME           : constant := 1212;  -- winerror.h:2838
    ERROR_INVALID_SERVICENAME          : constant := 1213;  -- winerror.h:2847
    ERROR_INVALID_NETNAME              : constant := 1214;  -- winerror.h:2856
    ERROR_INVALID_SHARENAME            : constant := 1215;  -- winerror.h:2865
    ERROR_INVALID_PASSWORDNAME         : constant := 1216;  -- winerror.h:2874
    ERROR_INVALID_MESSAGENAME          : constant := 1217;  -- winerror.h:2883
    ERROR_INVALID_MESSAGEDEST          : constant := 1218;  -- winerror.h:2892
    ERROR_SESSION_CREDENTIAL_CONFLICT  : constant := 1219;  -- winerror.h:2901
    ERROR_REMOTE_SESSION_LIMIT_EXCEEDED: constant := 1220;  -- winerror.h:2911
    ERROR_DUP_DOMAINNAME               : constant := 1221;  -- winerror.h:2921
    ERROR_NO_NETWORK                   : constant := 1222;  -- winerror.h:2930
    ERROR_CANCELLED                    : constant := 1223;  -- winerror.h:2939
    ERROR_USER_MAPPED_FILE             : constant := 1224;  -- winerror.h:2948
    ERROR_CONNECTION_REFUSED           : constant := 1225;  -- winerror.h:2957
    ERROR_GRACEFUL_DISCONNECT          : constant := 1226;  -- winerror.h:2966
    ERROR_ADDRESS_ALREADY_ASSOCIATED   : constant := 1227;  -- winerror.h:2975
    ERROR_ADDRESS_NOT_ASSOCIATED       : constant := 1228;  -- winerror.h:2984
    ERROR_CONNECTION_INVALID           : constant := 1229;  -- winerror.h:2993
    ERROR_CONNECTION_ACTIVE            : constant := 1230;  -- winerror.h:3002
    ERROR_NETWORK_UNREACHABLE          : constant := 1231;  -- winerror.h:3011
    ERROR_HOST_UNREACHABLE             : constant := 1232;  -- winerror.h:3020
    ERROR_PROTOCOL_UNREACHABLE         : constant := 1233;  -- winerror.h:3029
    ERROR_PORT_UNREACHABLE             : constant := 1234;  -- winerror.h:3039
    ERROR_REQUEST_ABORTED              : constant := 1235;  -- winerror.h:3048
    ERROR_CONNECTION_ABORTED           : constant := 1236;  -- winerror.h:3057
    ERROR_RETRY                        : constant := 1237;  -- winerror.h:3066
    ERROR_CONNECTION_COUNT_LIMIT       : constant := 1238;  -- winerror.h:3076
    ERROR_LOGIN_TIME_RESTRICTION       : constant := 1239;  -- winerror.h:3085
    ERROR_LOGIN_WKSTA_RESTRICTION      : constant := 1240;  -- winerror.h:3094
    ERROR_INCORRECT_ADDRESS            : constant := 1241;  -- winerror.h:3103
    ERROR_ALREADY_REGISTERED           : constant := 1242;  -- winerror.h:3112
    ERROR_SERVICE_NOT_FOUND            : constant := 1243;  -- winerror.h:3121
    ERROR_NOT_ALL_ASSIGNED             : constant := 1300;  -- winerror.h:3140
    ERROR_SOME_NOT_MAPPED              : constant := 1301;  -- winerror.h:3149
    ERROR_NO_QUOTAS_FOR_ACCOUNT        : constant := 1302;  -- winerror.h:3158
    ERROR_LOCAL_USER_SESSION_KEY       : constant := 1303;  -- winerror.h:3167
    ERROR_NULL_LM_PASSWORD             : constant := 1304;  -- winerror.h:3177
    ERROR_UNKNOWN_REVISION             : constant := 1305;  -- winerror.h:3186
    ERROR_REVISION_MISMATCH            : constant := 1306;  -- winerror.h:3195
    ERROR_INVALID_OWNER                : constant := 1307;  -- winerror.h:3204
    ERROR_INVALID_PRIMARY_GROUP        : constant := 1308;  -- winerror.h:3213
    ERROR_NO_IMPERSONATION_TOKEN       : constant := 1309;  -- winerror.h:3223
    ERROR_CANT_DISABLE_MANDATORY       : constant := 1310;  -- winerror.h:3232
    ERROR_NO_LOGON_SERVERS             : constant := 1311;  -- winerror.h:3242
    ERROR_NO_SUCH_LOGON_SESSION        : constant := 1312;  -- winerror.h:3252
    ERROR_NO_SUCH_PRIVILEGE            : constant := 1313;  -- winerror.h:3261
    ERROR_PRIVILEGE_NOT_HELD           : constant := 1314;  -- winerror.h:3270
    ERROR_INVALID_ACCOUNT_NAME         : constant := 1315;  -- winerror.h:3279
    ERROR_USER_EXISTS                  : constant := 1316;  -- winerror.h:3288
    ERROR_NO_SUCH_USER                 : constant := 1317;  -- winerror.h:3297
    ERROR_GROUP_EXISTS                 : constant := 1318;  -- winerror.h:3306
    ERROR_NO_SUCH_GROUP                : constant := 1319;  -- winerror.h:3315
    ERROR_MEMBER_IN_GROUP              : constant := 1320;  -- winerror.h:3326
    ERROR_MEMBER_NOT_IN_GROUP          : constant := 1321;  -- winerror.h:3335
    ERROR_LAST_ADMIN                   : constant := 1322;  -- winerror.h:3345
    ERROR_WRONG_PASSWORD               : constant := 1323;  -- winerror.h:3355
    ERROR_ILL_FORMED_PASSWORD          : constant := 1324;  -- winerror.h:3365
    ERROR_PASSWORD_RESTRICTION         : constant := 1325;  -- winerror.h:3375
    ERROR_LOGON_FAILURE                : constant := 1326;  -- winerror.h:3384
    ERROR_ACCOUNT_RESTRICTION          : constant := 1327;  -- winerror.h:3393
    ERROR_INVALID_LOGON_HOURS          : constant := 1328;  -- winerror.h:3402
    ERROR_INVALID_WORKSTATION          : constant := 1329;  -- winerror.h:3411
    ERROR_PASSWORD_EXPIRED             : constant := 1330;  -- winerror.h:3420
    ERROR_ACCOUNT_DISABLED             : constant := 1331;  -- winerror.h:3429
    ERROR_NONE_MAPPED                  : constant := 1332;  -- winerror.h:3438
    ERROR_TOO_MANY_LUIDS_REQUESTED     : constant := 1333;  -- winerror.h:3447
    ERROR_LUIDS_EXHAUSTED              : constant := 1334;  -- winerror.h:3456
    ERROR_INVALID_SUB_AUTHORITY        : constant := 1335;  -- winerror.h:3465
    ERROR_INVALID_ACL                  : constant := 1336;  -- winerror.h:3474
    ERROR_INVALID_SID                  : constant := 1337;  -- winerror.h:3483
    ERROR_INVALID_SECURITY_DESCR       : constant := 1338;  -- winerror.h:3492
    ERROR_BAD_INHERITANCE_ACL          : constant := 1340;  -- winerror.h:3502
    ERROR_SERVER_DISABLED              : constant := 1341;  -- winerror.h:3511
    ERROR_SERVER_NOT_DISABLED          : constant := 1342;  -- winerror.h:3520
    ERROR_INVALID_ID_AUTHORITY         : constant := 1343;  -- winerror.h:3529
    ERROR_ALLOTTED_SPACE_EXCEEDED      : constant := 1344;  -- winerror.h:3538
    ERROR_INVALID_GROUP_ATTRIBUTES     : constant := 1345;  -- winerror.h:3548
    ERROR_BAD_IMPERSONATION_LEVEL      : constant := 1346;  -- winerror.h:3558
    ERROR_CANT_OPEN_ANONYMOUS          : constant := 1347;  -- winerror.h:3567
    ERROR_BAD_VALIDATION_CLASS         : constant := 1348;  -- winerror.h:3576
    ERROR_BAD_TOKEN_TYPE               : constant := 1349;  -- winerror.h:3585
    ERROR_NO_SECURITY_ON_OBJECT        : constant := 1350;  -- winerror.h:3595
    ERROR_CANT_ACCESS_DOMAIN_INFO      : constant := 1351;  -- winerror.h:3606
    ERROR_INVALID_SERVER_STATE         : constant := 1352;  -- winerror.h:3617
    ERROR_INVALID_DOMAIN_STATE         : constant := 1353;  -- winerror.h:3626
    ERROR_INVALID_DOMAIN_ROLE          : constant := 1354;  -- winerror.h:3635
    ERROR_NO_SUCH_DOMAIN               : constant := 1355;  -- winerror.h:3644
    ERROR_DOMAIN_EXISTS                : constant := 1356;  -- winerror.h:3653
    ERROR_DOMAIN_LIMIT_EXCEEDED        : constant := 1357;  -- winerror.h:3662
    ERROR_INTERNAL_DB_CORRUPTION       : constant := 1358;  -- winerror.h:3672
    ERROR_INTERNAL_ERROR               : constant := 1359;  -- winerror.h:3681
    ERROR_GENERIC_NOT_MAPPED           : constant := 1360;  -- winerror.h:3691
    ERROR_BAD_DESCRIPTOR_FORMAT        : constant := 1361;  -- winerror.h:3700
    ERROR_NOT_LOGON_PROCESS            : constant := 1362;  -- winerror.h:3710
    ERROR_LOGON_SESSION_EXISTS         : constant := 1363;  -- winerror.h:3719
    ERROR_NO_SUCH_PACKAGE              : constant := 1364;  -- winerror.h:3728
    ERROR_BAD_LOGON_SESSION_STATE      : constant := 1365;  -- winerror.h:3738
    ERROR_LOGON_SESSION_COLLISION      : constant := 1366;  -- winerror.h:3747
    ERROR_INVALID_LOGON_TYPE           : constant := 1367;  -- winerror.h:3756
    ERROR_CANNOT_IMPERSONATE           : constant := 1368;  -- winerror.h:3766
    ERROR_RXACT_INVALID_STATE          : constant := 1369;  -- winerror.h:3776
    ERROR_RXACT_COMMIT_FAILURE         : constant := 1370;  -- winerror.h:3785
    ERROR_SPECIAL_ACCOUNT              : constant := 1371;  -- winerror.h:3794
    ERROR_SPECIAL_GROUP                : constant := 1372;  -- winerror.h:3803
    ERROR_SPECIAL_USER                 : constant := 1373;  -- winerror.h:3812
    ERROR_MEMBERS_PRIMARY_GROUP        : constant := 1374;  -- winerror.h:3822
    ERROR_TOKEN_ALREADY_IN_USE         : constant := 1375;  -- winerror.h:3831
    ERROR_NO_SUCH_ALIAS                : constant := 1376;  -- winerror.h:3840
    ERROR_MEMBER_NOT_IN_ALIAS          : constant := 1377;  -- winerror.h:3849
    ERROR_MEMBER_IN_ALIAS              : constant := 1378;  -- winerror.h:3858
    ERROR_ALIAS_EXISTS                 : constant := 1379;  -- winerror.h:3867
    ERROR_LOGON_NOT_GRANTED            : constant := 1380;  -- winerror.h:3877
    ERROR_TOO_MANY_SECRETS             : constant := 1381;  -- winerror.h:3887
    ERROR_SECRET_TOO_LONG              : constant := 1382;  -- winerror.h:3896
    ERROR_INTERNAL_DB_ERROR            : constant := 1383;  -- winerror.h:3905
    ERROR_TOO_MANY_CONTEXT_IDS         : constant := 1384;  -- winerror.h:3915
    ERROR_LOGON_TYPE_NOT_GRANTED       : constant := 1385;  -- winerror.h:3925
    ERROR_NT_CROSS_ENCRYPTION_REQUIRED : constant := 1386;  -- winerror.h:3934
    ERROR_NO_SUCH_MEMBER               : constant := 1387;  -- winerror.h:3944
    ERROR_INVALID_MEMBER               : constant := 1388;  -- winerror.h:3954
    ERROR_TOO_MANY_SIDS                : constant := 1389;  -- winerror.h:3963
    ERROR_LM_CROSS_ENCRYPTION_REQUIRED : constant := 1390;  -- winerror.h:3972
    ERROR_NO_INHERITANCE               : constant := 1391;  -- winerror.h:3981
    ERROR_FILE_CORRUPT                 : constant := 1392;  -- winerror.h:3990
    ERROR_DISK_CORRUPT                 : constant := 1393;  -- winerror.h:3999
    ERROR_NO_USER_SESSION_KEY          : constant := 1394;  -- winerror.h:4008
    ERROR_INVALID_WINDOW_HANDLE        : constant := 1400;  -- winerror.h:4028
    ERROR_INVALID_MENU_HANDLE          : constant := 1401;  -- winerror.h:4037
    ERROR_INVALID_CURSOR_HANDLE        : constant := 1402;  -- winerror.h:4046
    ERROR_INVALID_ACCEL_HANDLE         : constant := 1403;  -- winerror.h:4055
    ERROR_INVALID_HOOK_HANDLE          : constant := 1404;  -- winerror.h:4064
    ERROR_INVALID_DWP_HANDLE           : constant := 1405;  -- winerror.h:4073
    ERROR_TLW_WITH_WSCHILD             : constant := 1406;  -- winerror.h:4082
    ERROR_CANNOT_FIND_WND_CLASS        : constant := 1407;  -- winerror.h:4091
    ERROR_WINDOW_OF_OTHER_THREAD       : constant := 1408;  -- winerror.h:4100
    ERROR_HOTKEY_ALREADY_REGISTERED    : constant := 1409;  -- winerror.h:4109
    ERROR_CLASS_ALREADY_EXISTS         : constant := 1410;  -- winerror.h:4118
    ERROR_CLASS_DOES_NOT_EXIST         : constant := 1411;  -- winerror.h:4127
    ERROR_CLASS_HAS_WINDOWS            : constant := 1412;  -- winerror.h:4136
    ERROR_INVALID_INDEX                : constant := 1413;  -- winerror.h:4145
    ERROR_INVALID_ICON_HANDLE          : constant := 1414;  -- winerror.h:4154
    ERROR_PRIVATE_DIALOG_INDEX         : constant := 1415;  -- winerror.h:4163
    ERROR_LISTBOX_ID_NOT_FOUND         : constant := 1416;  -- winerror.h:4172
    ERROR_NO_WILDCARD_CHARACTERS       : constant := 1417;  -- winerror.h:4181
    ERROR_CLIPBOARD_NOT_OPEN           : constant := 1418;  -- winerror.h:4190
    ERROR_HOTKEY_NOT_REGISTERED        : constant := 1419;  -- winerror.h:4199
    ERROR_WINDOW_NOT_DIALOG            : constant := 1420;  -- winerror.h:4208
    ERROR_CONTROL_ID_NOT_FOUND         : constant := 1421;  -- winerror.h:4217
    ERROR_INVALID_COMBOBOX_MESSAGE     : constant := 1422;  -- winerror.h:4226
    ERROR_WINDOW_NOT_COMBOBOX          : constant := 1423;  -- winerror.h:4235
    ERROR_INVALID_EDIT_HEIGHT          : constant := 1424;  -- winerror.h:4244
    ERROR_DC_NOT_FOUND                 : constant := 1425;  -- winerror.h:4253
    ERROR_INVALID_HOOK_FILTER          : constant := 1426;  -- winerror.h:4262
    ERROR_INVALID_FILTER_PROC          : constant := 1427;  -- winerror.h:4271
    ERROR_HOOK_NEEDS_HMOD              : constant := 1428;  -- winerror.h:4280
    ERROR_GLOBAL_ONLY_HOOK             : constant := 1429;  -- winerror.h:4289
    ERROR_JOURNAL_HOOK_SET             : constant := 1430;  -- winerror.h:4298
    ERROR_HOOK_NOT_INSTALLED           : constant := 1431;  -- winerror.h:4307
    ERROR_INVALID_LB_MESSAGE           : constant := 1432;  -- winerror.h:4316
    ERROR_SETCOUNT_ON_BAD_LB           : constant := 1433;  -- winerror.h:4325
    ERROR_LB_WITHOUT_TABSTOPS          : constant := 1434;  -- winerror.h:4334
    ERROR_DESTROY_OBJECT_OF_OTHER_THREAD   : constant := 1435;
                                                            -- winerror.h:4343
    ERROR_CHILD_WINDOW_MENU            : constant := 1436;  -- winerror.h:4352
    ERROR_NO_SYSTEM_MENU               : constant := 1437;  -- winerror.h:4361
    ERROR_INVALID_MSGBOX_STYLE         : constant := 1438;  -- winerror.h:4370
    ERROR_INVALID_SPI_VALUE            : constant := 1439;  -- winerror.h:4379
    ERROR_SCREEN_ALREADY_LOCKED        : constant := 1440;  -- winerror.h:4388
    ERROR_HWNDS_HAVE_DIFF_PARENT       : constant := 1441;  -- winerror.h:4398
    ERROR_NOT_CHILD_WINDOW             : constant := 1442;  -- winerror.h:4407
    ERROR_INVALID_GW_COMMAND           : constant := 1443;  -- winerror.h:4416
    ERROR_INVALID_THREAD_ID            : constant := 1444;  -- winerror.h:4425
    ERROR_NON_MDICHILD_WINDOW          : constant := 1445;  -- winerror.h:4435
    ERROR_POPUP_ALREADY_ACTIVE         : constant := 1446;  -- winerror.h:4444
    ERROR_NO_SCROLLBARS                : constant := 1447;  -- winerror.h:4453
    ERROR_INVALID_SCROLLBAR_RANGE      : constant := 1448;  -- winerror.h:4462
    ERROR_INVALID_SHOWWIN_COMMAND      : constant := 1449;  -- winerror.h:4471
    ERROR_EVENTLOG_FILE_CORRUPT        : constant := 1500;  -- winerror.h:4491
    ERROR_EVENTLOG_CANT_START          : constant := 1501;  -- winerror.h:4500
    ERROR_LOG_FILE_FULL                : constant := 1502;  -- winerror.h:4509
    ERROR_EVENTLOG_FILE_CHANGED        : constant := 1503;  -- winerror.h:4518
    RPC_S_INVALID_STRING_BINDING       : constant := 1700;  -- winerror.h:4538
    RPC_S_WRONG_KIND_OF_BINDING        : constant := 1701;  -- winerror.h:4547
    RPC_S_INVALID_BINDING              : constant := 1702;  -- winerror.h:4556
    RPC_S_PROTSEQ_NOT_SUPPORTED        : constant := 1703;  -- winerror.h:4565
    RPC_S_INVALID_RPC_PROTSEQ          : constant := 1704;  -- winerror.h:4574
    RPC_S_INVALID_STRING_UUID          : constant := 1705;  -- winerror.h:4583
    RPC_S_INVALID_ENDPOINT_FORMAT      : constant := 1706;  -- winerror.h:4592
    RPC_S_INVALID_NET_ADDR             : constant := 1707;  -- winerror.h:4601
    RPC_S_NO_ENDPOINT_FOUND            : constant := 1708;  -- winerror.h:4610
    RPC_S_INVALID_TIMEOUT              : constant := 1709;  -- winerror.h:4619
    RPC_S_OBJECT_NOT_FOUND             : constant := 1710;  -- winerror.h:4628
    RPC_S_ALREADY_REGISTERED           : constant := 1711;  -- winerror.h:4637
    RPC_S_TYPE_ALREADY_REGISTERED      : constant := 1712;  -- winerror.h:4646
    RPC_S_ALREADY_LISTENING            : constant := 1713;  -- winerror.h:4655
    RPC_S_NO_PROTSEQS_REGISTERED       : constant := 1714;  -- winerror.h:4664
    RPC_S_NOT_LISTENING                : constant := 1715;  -- winerror.h:4673
    RPC_S_UNKNOWN_MGR_TYPE             : constant := 1716;  -- winerror.h:4682
    RPC_S_UNKNOWN_IF                   : constant := 1717;  -- winerror.h:4691
    RPC_S_NO_BINDINGS                  : constant := 1718;  -- winerror.h:4700
    RPC_S_NO_PROTSEQS                  : constant := 1719;  -- winerror.h:4709
    RPC_S_CANT_CREATE_ENDPOINT         : constant := 1720;  -- winerror.h:4718
    RPC_S_OUT_OF_RESOURCES             : constant := 1721;  -- winerror.h:4727
    RPC_S_SERVER_UNAVAILABLE           : constant := 1722;  -- winerror.h:4736
    RPC_S_SERVER_TOO_BUSY              : constant := 1723;  -- winerror.h:4745
    RPC_S_INVALID_NETWORK_OPTIONS      : constant := 1724;  -- winerror.h:4754
    RPC_S_NO_CALL_ACTIVE               : constant := 1725;  -- winerror.h:4763
    RPC_S_CALL_FAILED                  : constant := 1726;  -- winerror.h:4772
    RPC_S_CALL_FAILED_DNE              : constant := 1727;  -- winerror.h:4781
    RPC_S_PROTOCOL_ERROR               : constant := 1728;  -- winerror.h:4790
    RPC_S_UNSUPPORTED_TRANS_SYN        : constant := 1730;  -- winerror.h:4799
    RPC_S_UNSUPPORTED_TYPE             : constant := 1732;  -- winerror.h:4808
    RPC_S_INVALID_TAG                  : constant := 1733;  -- winerror.h:4817
    RPC_S_INVALID_BOUND                : constant := 1734;  -- winerror.h:4826
    RPC_S_NO_ENTRY_NAME                : constant := 1735;  -- winerror.h:4835
    RPC_S_INVALID_NAME_SYNTAX          : constant := 1736;  -- winerror.h:4844
    RPC_S_UNSUPPORTED_NAME_SYNTAX      : constant := 1737;  -- winerror.h:4853
    RPC_S_UUID_NO_ADDRESS              : constant := 1739;  -- winerror.h:4863
    RPC_S_DUPLICATE_ENDPOINT           : constant := 1740;  -- winerror.h:4872
    RPC_S_UNKNOWN_AUTHN_TYPE           : constant := 1741;  -- winerror.h:4881
    RPC_S_MAX_CALLS_TOO_SMALL          : constant := 1742;  -- winerror.h:4890
    RPC_S_STRING_TOO_LONG              : constant := 1743;  -- winerror.h:4899
    RPC_S_PROTSEQ_NOT_FOUND            : constant := 1744;  -- winerror.h:4908
    RPC_S_PROCNUM_OUT_OF_RANGE         : constant := 1745;  -- winerror.h:4917
    RPC_S_BINDING_HAS_NO_AUTH          : constant := 1746;  -- winerror.h:4926
    RPC_S_UNKNOWN_AUTHN_SERVICE        : constant := 1747;  -- winerror.h:4935
    RPC_S_UNKNOWN_AUTHN_LEVEL          : constant := 1748;  -- winerror.h:4944
    RPC_S_INVALID_AUTH_IDENTITY        : constant := 1749;  -- winerror.h:4953
    RPC_S_UNKNOWN_AUTHZ_SERVICE        : constant := 1750;  -- winerror.h:4962
    EPT_S_INVALID_ENTRY                : constant := 1751;  -- winerror.h:4971
    EPT_S_CANT_PERFORM_OP              : constant := 1752;  -- winerror.h:4980
    EPT_S_NOT_REGISTERED               : constant := 1753;  -- winerror.h:4989
    RPC_S_NOTHING_TO_EXPORT            : constant := 1754;  -- winerror.h:4998
    RPC_S_INCOMPLETE_NAME              : constant := 1755;  -- winerror.h:5007
    RPC_S_INVALID_VERS_OPTION          : constant := 1756;  -- winerror.h:5016
    RPC_S_NO_MORE_MEMBERS              : constant := 1757;  -- winerror.h:5025
    RPC_S_NOT_ALL_OBJS_UNEXPORTED      : constant := 1758;  -- winerror.h:5034
    RPC_S_INTERFACE_NOT_FOUND          : constant := 1759;  -- winerror.h:5043
    RPC_S_ENTRY_ALREADY_EXISTS         : constant := 1760;  -- winerror.h:5052
    RPC_S_ENTRY_NOT_FOUND              : constant := 1761;  -- winerror.h:5061
    RPC_S_NAME_SERVICE_UNAVAILABLE     : constant := 1762;  -- winerror.h:5070
    RPC_S_INVALID_NAF_ID               : constant := 1763;  -- winerror.h:5079
    RPC_S_CANNOT_SUPPORT               : constant := 1764;  -- winerror.h:5088
    RPC_S_NO_CONTEXT_AVAILABLE         : constant := 1765;  -- winerror.h:5097
    RPC_S_INTERNAL_ERROR               : constant := 1766;  -- winerror.h:5106
    RPC_S_ZERO_DIVIDE                  : constant := 1767;  -- winerror.h:5115
    RPC_S_ADDRESS_ERROR                : constant := 1768;  -- winerror.h:5124
    RPC_S_FP_DIV_ZERO                  : constant := 1769;  -- winerror.h:5133
    RPC_S_FP_UNDERFLOW                 : constant := 1770;  -- winerror.h:5142
    RPC_S_FP_OVERFLOW                  : constant := 1771;  -- winerror.h:5151
    RPC_X_NO_MORE_ENTRIES              : constant := 1772;  -- winerror.h:5161
    RPC_X_SS_CHAR_TRANS_OPEN_FAIL      : constant := 1773;  -- winerror.h:5170
    RPC_X_SS_CHAR_TRANS_SHORT_FILE     : constant := 1774;  -- winerror.h:5180
    RPC_X_SS_IN_NULL_CONTEXT           : constant := 1775;  -- winerror.h:5190
    RPC_X_SS_CONTEXT_DAMAGED           : constant := 1777;  -- winerror.h:5199
    RPC_X_SS_HANDLES_MISMATCH          : constant := 1778;  -- winerror.h:5208
    RPC_X_SS_CANNOT_GET_CALL_HANDLE    : constant := 1779;  -- winerror.h:5217
    RPC_X_NULL_REF_POINTER             : constant := 1780;  -- winerror.h:5226
    RPC_X_ENUM_VALUE_OUT_OF_RANGE      : constant := 1781;  -- winerror.h:5235
    RPC_X_BYTE_COUNT_TOO_SMALL         : constant := 1782;  -- winerror.h:5244
    RPC_X_BAD_STUB_DATA                : constant := 1783;  -- winerror.h:5253
    ERROR_INVALID_USER_BUFFER          : constant := 1784;  -- winerror.h:5262
    ERROR_UNRECOGNIZED_MEDIA           : constant := 1785;  -- winerror.h:5271
    ERROR_NO_TRUST_LSA_SECRET          : constant := 1786;  -- winerror.h:5280
    ERROR_NO_TRUST_SAM_ACCOUNT         : constant := 1787;  -- winerror.h:5290
    ERROR_TRUSTED_DOMAIN_FAILURE       : constant := 1788;  -- winerror.h:5300
    ERROR_TRUSTED_RELATIONSHIP_FAILURE : constant := 1789;  -- winerror.h:5310
    ERROR_TRUST_FAILURE                : constant := 1790;  -- winerror.h:5319
    RPC_S_CALL_IN_PROGRESS             : constant := 1791;  -- winerror.h:5328
    ERROR_NETLOGON_NOT_STARTED         : constant := 1792;  -- winerror.h:5337
    ERROR_ACCOUNT_EXPIRED              : constant := 1793;  -- winerror.h:5346
    ERROR_REDIRECTOR_HAS_OPEN_HANDLES  : constant := 1794;  -- winerror.h:5355
    ERROR_PRINTER_DRIVER_ALREADY_INSTALLED : constant := 1795;
                                                            -- winerror.h:5364
    ERROR_UNKNOWN_PORT                 : constant := 1796;  -- winerror.h:5373
    ERROR_UNKNOWN_PRINTER_DRIVER       : constant := 1797;  -- winerror.h:5382
    ERROR_UNKNOWN_PRINTPROCESSOR       : constant := 1798;  -- winerror.h:5391
    ERROR_INVALID_SEPARATOR_FILE       : constant := 1799;  -- winerror.h:5400
    ERROR_INVALID_PRIORITY             : constant := 1800;  -- winerror.h:5409
    ERROR_INVALID_PRINTER_NAME         : constant := 1801;  -- winerror.h:5418
    ERROR_PRINTER_ALREADY_EXISTS       : constant := 1802;  -- winerror.h:5427
    ERROR_INVALID_PRINTER_COMMAND      : constant := 1803;  -- winerror.h:5436
    ERROR_INVALID_DATATYPE             : constant := 1804;  -- winerror.h:5445
    ERROR_INVALID_ENVIRONMENT          : constant := 1805;  -- winerror.h:5454
    RPC_S_NO_MORE_BINDINGS             : constant := 1806;  -- winerror.h:5463
    ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT: constant := 1807;
                                                            -- winerror.h:5472
    ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT: constant := 1808;
                                                            -- winerror.h:5481
    ERROR_NOLOGON_SERVER_TRUST_ACCOUNT : constant := 1809;  -- winerror.h:5490
    ERROR_DOMAIN_TRUST_INCONSISTENT    : constant := 1810;  -- winerror.h:5500
    ERROR_SERVER_HAS_OPEN_HANDLES      : constant := 1811;  -- winerror.h:5509
    ERROR_RESOURCE_DATA_NOT_FOUND      : constant := 1812;  -- winerror.h:5518
    ERROR_RESOURCE_TYPE_NOT_FOUND      : constant := 1813;  -- winerror.h:5527
    ERROR_RESOURCE_NAME_NOT_FOUND      : constant := 1814;  -- winerror.h:5536
    ERROR_RESOURCE_LANG_NOT_FOUND      : constant := 1815;  -- winerror.h:5545
    ERROR_NOT_ENOUGH_QUOTA             : constant := 1816;  -- winerror.h:5554
    RPC_S_NO_INTERFACES                : constant := 1817;  -- winerror.h:5563
    RPC_S_CALL_CANCELLED               : constant := 1818;  -- winerror.h:5572
    RPC_S_BINDING_INCOMPLETE           : constant := 1819;  -- winerror.h:5581
    RPC_S_COMM_FAILURE                 : constant := 1820;  -- winerror.h:5590
    RPC_S_UNSUPPORTED_AUTHN_LEVEL      : constant := 1821;  -- winerror.h:5599
    RPC_S_NO_PRINC_NAME                : constant := 1822;  -- winerror.h:5608
    RPC_S_NOT_RPC_ERROR                : constant := 1823;  -- winerror.h:5617
    RPC_S_UUID_LOCAL_ONLY              : constant := 1824;  -- winerror.h:5626
    RPC_S_SEC_PKG_ERROR                : constant := 1825;  -- winerror.h:5635
    RPC_S_NOT_CANCELLED                : constant := 1826;  -- winerror.h:5644
    RPC_X_INVALID_ES_ACTION            : constant := 1827;  -- winerror.h:5653
    RPC_X_WRONG_ES_VERSION             : constant := 1828;  -- winerror.h:5662
    RPC_X_WRONG_STUB_VERSION           : constant := 1829;  -- winerror.h:5671
    RPC_S_GROUP_MEMBER_NOT_FOUND       : constant := 1898;  -- winerror.h:5680
    EPT_S_CANT_CREATE                  : constant := 1899;  -- winerror.h:5689
    RPC_S_INVALID_OBJECT               : constant := 1900;  -- winerror.h:5698
    ERROR_INVALID_TIME                 : constant := 1901;  -- winerror.h:5707
    ERROR_INVALID_FORM_NAME            : constant := 1902;  -- winerror.h:5716
    ERROR_INVALID_FORM_SIZE            : constant := 1903;  -- winerror.h:5725
    ERROR_ALREADY_WAITING              : constant := 1904;  -- winerror.h:5734
    ERROR_PRINTER_DELETED              : constant := 1905;  -- winerror.h:5743
    ERROR_INVALID_PRINTER_STATE        : constant := 1906;  -- winerror.h:5752
    ERROR_PASSWORD_MUST_CHANGE         : constant := 1907;  -- winerror.h:5761
    ERROR_DOMAIN_CONTROLLER_NOT_FOUND  : constant := 1908;  -- winerror.h:5770
    ERROR_ACCOUNT_LOCKED_OUT           : constant := 1909;  -- winerror.h:5779
    ERROR_NO_BROWSER_SERVERS_FOUND     : constant := 6118;  -- winerror.h:5788
    ERROR_INVALID_PIXEL_FORMAT         : constant := 2000;  -- winerror.h:5807
    ERROR_BAD_DRIVER                   : constant := 2001;  -- winerror.h:5816
    ERROR_INVALID_WINDOW_STYLE         : constant := 2002;  -- winerror.h:5825
    ERROR_METAFILE_NOT_SUPPORTED       : constant := 2003;  -- winerror.h:5834
    ERROR_TRANSFORM_NOT_SUPPORTED      : constant := 2004;  -- winerror.h:5843
    ERROR_CLIPPING_NOT_SUPPORTED       : constant := 2005;  -- winerror.h:5852
    ERROR_UNKNOWN_PRINT_MONITOR        : constant := 3000;  -- winerror.h:5870
    ERROR_PRINTER_DRIVER_IN_USE        : constant := 3001;  -- winerror.h:5879
    ERROR_SPOOL_FILE_NOT_FOUND         : constant := 3002;  -- winerror.h:5888
    ERROR_SPL_NO_STARTDOC              : constant := 3003;  -- winerror.h:5897
    ERROR_SPL_NO_ADDJOB                : constant := 3004;  -- winerror.h:5906
    ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED: constant := 3005;
                                                            -- winerror.h:5915
    ERROR_PRINT_MONITOR_ALREADY_INSTALLED  : constant := 3006;
                                                            -- winerror.h:5924
    ERROR_WINS_INTERNAL                : constant := 4000;  -- winerror.h:5938
    ERROR_CAN_NOT_DEL_LOCAL_WINS       : constant := 4001;  -- winerror.h:5947
    ERROR_STATIC_INIT                  : constant := 4002;  -- winerror.h:5956
    ERROR_INC_BACKUP                   : constant := 4003;  -- winerror.h:5965
    ERROR_FULL_BACKUP                  : constant := 4004;  -- winerror.h:5974
    ERROR_REC_NON_EXISTENT             : constant := 4005;  -- winerror.h:5983
    ERROR_RPL_NOT_ALLOWED              : constant := 4006;  -- winerror.h:5992
    SEVERITY_SUCCESS                   : constant := 0;     -- winerror.h:6052
    SEVERITY_ERROR                     : constant := 1;     -- winerror.h:6053
    FACILITY_NT_BIT                    : constant := 16#10000000#;
                                                            -- winerror.h:6113
    NOERROR                            : constant := 16#0#;
                                                            -- winerror.h:6150
    E_UNEXPECTED                       : constant := 16#8000ffff#;
                                                            -- winerror.h:6169
    E_NOTIMPL                          : constant := 16#80004001#;
                                                            -- winerror.h:6179
    E_OUTOFMEMORY                      : constant := 16#8007000e#;
                                                            -- winerror.h:6188
    E_INVALIDARG                       : constant := 16#80070057#;
                                                            -- winerror.h:6197
    E_NOINTERFACE                      : constant := 16#80004002#;
                                                            -- winerror.h:6206
    E_POINTER                          : constant := 16#80004003#;
                                                            -- winerror.h:6215
    E_HANDLE                           : constant := 16#80070006#;
                                                            -- winerror.h:6224
    E_ABORT                            : constant := 16#80004004#;
                                                            -- winerror.h:6233
    E_FAIL                             : constant := 16#80004005#;
                                                            -- winerror.h:6242
    E_ACCESSDENIED                     : constant := 16#80070005#;
                                                            -- winerror.h:6251
    CO_E_INIT_TLS                      : constant := 16#80004006#;
                                                            -- winerror.h:6343
    CO_E_INIT_SHARED_ALLOCATOR         : constant := 16#80004007#;
                                                            -- winerror.h:6352
    CO_E_INIT_MEMORY_ALLOCATOR         : constant := 16#80004008#;
                                                            -- winerror.h:6361
    CO_E_INIT_CLASS_CACHE              : constant := 16#80004009#;
                                                            -- winerror.h:6370
    CO_E_INIT_RPC_CHANNEL              : constant := 16#8000400a#;
                                                            -- winerror.h:6379
    CO_E_INIT_TLS_SET_CHANNEL_CONTROL  : constant := 16#8000400b#;
                                                            -- winerror.h:6388
    CO_E_INIT_TLS_CHANNEL_CONTROL      : constant := 16#8000400c#;
                                                            -- winerror.h:6397
    CO_E_INIT_UNACCEPTED_USER_ALLOCATOR: constant := 16#8000400d#;
                                                            -- winerror.h:6406
    CO_E_INIT_SCM_MUTEX_EXISTS         : constant := 16#8000400e#;
                                                            -- winerror.h:6415
    CO_E_INIT_SCM_FILE_MAPPING_EXISTS  : constant := 16#8000400f#;
                                                            -- winerror.h:6424
    CO_E_INIT_SCM_MAP_VIEW_OF_FILE     : constant := 16#80004010#;
                                                            -- winerror.h:6433
    CO_E_INIT_SCM_EXEC_FAILURE         : constant := 16#80004011#;
                                                            -- winerror.h:6442
    CO_E_INIT_ONLY_SINGLE_THREADED     : constant := 16#80004012#;
                                                            -- winerror.h:6451
    S_OK                               : constant := 16#0#;
                                                            -- winerror.h:6457
    S_FALSE                            : constant := 16#1#;
                                                            -- winerror.h:6458
    OLE_E_FIRST                        : constant := 16#80040000#;
                                                            -- winerror.h:6474
    OLE_E_LAST                         : constant := 16#800400ff#;
                                                            -- winerror.h:6475
    OLE_S_FIRST                        : constant := 16#40000#;
                                                            -- winerror.h:6476
    OLE_S_LAST                         : constant := 16#400ff#;
                                                            -- winerror.h:6477
    OLE_E_OLEVERB                      : constant := 16#80040000#;
                                                            -- winerror.h:6489
    OLE_E_ADVF                         : constant := 16#80040001#;
                                                            -- winerror.h:6498
    OLE_E_ENUM_NOMORE                  : constant := 16#80040002#;
                                                            -- winerror.h:6507
    OLE_E_ADVISENOTSUPPORTED           : constant := 16#80040003#;
                                                            -- winerror.h:6516
    OLE_E_NOCONNECTION                 : constant := 16#80040004#;
                                                            -- winerror.h:6525
    OLE_E_NOTRUNNING                   : constant := 16#80040005#;
                                                            -- winerror.h:6534
    OLE_E_NOCACHE                      : constant := 16#80040006#;
                                                            -- winerror.h:6543
    OLE_E_BLANK                        : constant := 16#80040007#;
                                                            -- winerror.h:6552
    OLE_E_CLASSDIFF                    : constant := 16#80040008#;
                                                            -- winerror.h:6561
    OLE_E_CANT_GETMONIKER              : constant := 16#80040009#;
                                                            -- winerror.h:6570
    OLE_E_CANT_BINDTOSOURCE            : constant := 16#8004000a#;
                                                            -- winerror.h:6579
    OLE_E_STATIC                       : constant := 16#8004000b#;
                                                            -- winerror.h:6588
    OLE_E_PROMPTSAVECANCELLED          : constant := 16#8004000c#;
                                                            -- winerror.h:6597
    OLE_E_INVALIDRECT                  : constant := 16#8004000d#;
                                                            -- winerror.h:6606
    OLE_E_WRONGCOMPOBJ                 : constant := 16#8004000e#;
                                                            -- winerror.h:6615
    OLE_E_INVALIDHWND                  : constant := 16#8004000f#;
                                                            -- winerror.h:6624
    OLE_E_NOT_INPLACEACTIVE            : constant := 16#80040010#;
                                                            -- winerror.h:6633
    OLE_E_CANTCONVERT                  : constant := 16#80040011#;
                                                            -- winerror.h:6642
    OLE_E_NOSTORAGE                    : constant := 16#80040012#;
                                                            -- winerror.h:6652
    DV_E_FORMATETC                     : constant := 16#80040064#;
                                                            -- winerror.h:6661
    DV_E_DVTARGETDEVICE                : constant := 16#80040065#;
                                                            -- winerror.h:6670
    DV_E_STGMEDIUM                     : constant := 16#80040066#;
                                                            -- winerror.h:6679
    DV_E_STATDATA                      : constant := 16#80040067#;
                                                            -- winerror.h:6688
    DV_E_LINDEX                        : constant := 16#80040068#;
                                                            -- winerror.h:6697
    DV_E_TYMED                         : constant := 16#80040069#;
                                                            -- winerror.h:6706
    DV_E_CLIPFORMAT                    : constant := 16#8004006a#;
                                                            -- winerror.h:6715
    DV_E_DVASPECT                      : constant := 16#8004006b#;
                                                            -- winerror.h:6724
    DV_E_DVTARGETDEVICE_SIZE           : constant := 16#8004006c#;
                                                            -- winerror.h:6733
    DV_E_NOIVIEWOBJECT                 : constant := 16#8004006d#;
                                                            -- winerror.h:6742
    DRAGDROP_E_FIRST                   : constant := 16#80040100#;
                                                            -- winerror.h:6744
    DRAGDROP_E_LAST                    : constant := 16#8004010f#;
                                                            -- winerror.h:6745
    DRAGDROP_S_FIRST                   : constant := 16#40100#;
                                                            -- winerror.h:6746
    DRAGDROP_S_LAST                    : constant := 16#4010f#;
                                                            -- winerror.h:6747
    DRAGDROP_E_NOTREGISTERED           : constant := 16#80040100#;
                                                            -- winerror.h:6755
    DRAGDROP_E_ALREADYREGISTERED       : constant := 16#80040101#;
                                                            -- winerror.h:6764
    DRAGDROP_E_INVALIDHWND             : constant := 16#80040102#;
                                                            -- winerror.h:6773
    CLASSFACTORY_E_FIRST               : constant := 16#80040110#;
                                                            -- winerror.h:6775
    CLASSFACTORY_E_LAST                : constant := 16#8004011f#;
                                                            -- winerror.h:6776
    CLASSFACTORY_S_FIRST               : constant := 16#40110#;
                                                            -- winerror.h:6777
    CLASSFACTORY_S_LAST                : constant := 16#4011f#;
                                                            -- winerror.h:6778
    CLASS_E_NOAGGREGATION              : constant := 16#80040110#;
                                                            -- winerror.h:6786
    CLASS_E_CLASSNOTAVAILABLE          : constant := 16#80040111#;
                                                            -- winerror.h:6795
    MARSHAL_E_FIRST                    : constant := 16#80040120#;
                                                            -- winerror.h:6797
    MARSHAL_E_LAST                     : constant := 16#8004012f#;
                                                            -- winerror.h:6798
    MARSHAL_S_FIRST                    : constant := 16#40120#;
                                                            -- winerror.h:6799
    MARSHAL_S_LAST                     : constant := 16#4012f#;
                                                            -- winerror.h:6800
    DATA_E_FIRST                       : constant := 16#80040130#;
                                                            -- winerror.h:6801
    DATA_E_LAST                        : constant := 16#8004013f#;
                                                            -- winerror.h:6802
    DATA_S_FIRST                       : constant := 16#40130#;
                                                            -- winerror.h:6803
    DATA_S_LAST                        : constant := 16#4013f#;
                                                            -- winerror.h:6804
    VIEW_E_FIRST                       : constant := 16#80040140#;
                                                            -- winerror.h:6805
    VIEW_E_LAST                        : constant := 16#8004014f#;
                                                            -- winerror.h:6806
    VIEW_S_FIRST                       : constant := 16#40140#;
                                                            -- winerror.h:6807
    VIEW_S_LAST                        : constant := 16#4014f#;
                                                            -- winerror.h:6808
    VIEW_E_DRAW                        : constant := 16#80040140#;
                                                            -- winerror.h:6816
    REGDB_E_FIRST                      : constant := 16#80040150#;
                                                            -- winerror.h:6818
    REGDB_E_LAST                       : constant := 16#8004015f#;
                                                            -- winerror.h:6819
    REGDB_S_FIRST                      : constant := 16#40150#;
                                                            -- winerror.h:6820
    REGDB_S_LAST                       : constant := 16#4015f#;
                                                            -- winerror.h:6821
    REGDB_E_READREGDB                  : constant := 16#80040150#;
                                                            -- winerror.h:6829
    REGDB_E_WRITEREGDB                 : constant := 16#80040151#;
                                                            -- winerror.h:6838
    REGDB_E_KEYMISSING                 : constant := 16#80040152#;
                                                            -- winerror.h:6847
    REGDB_E_INVALIDVALUE               : constant := 16#80040153#;
                                                            -- winerror.h:6856
    REGDB_E_CLASSNOTREG                : constant := 16#80040154#;
                                                            -- winerror.h:6865
    REGDB_E_IIDNOTREG                  : constant := 16#80040155#;
                                                            -- winerror.h:6874
    CACHE_E_FIRST                      : constant := 16#80040170#;
                                                            -- winerror.h:6876
    CACHE_E_LAST                       : constant := 16#8004017f#;
                                                            -- winerror.h:6877
    CACHE_S_FIRST                      : constant := 16#40170#;
                                                            -- winerror.h:6878
    CACHE_S_LAST                       : constant := 16#4017f#;
                                                            -- winerror.h:6879
    CACHE_E_NOCACHE_UPDATED            : constant := 16#80040170#;
                                                            -- winerror.h:6887
    OLEOBJ_E_FIRST                     : constant := 16#80040180#;
                                                            -- winerror.h:6889
    OLEOBJ_E_LAST                      : constant := 16#8004018f#;
                                                            -- winerror.h:6890
    OLEOBJ_S_FIRST                     : constant := 16#40180#;
                                                            -- winerror.h:6891
    OLEOBJ_S_LAST                      : constant := 16#4018f#;
                                                            -- winerror.h:6892
    OLEOBJ_E_NOVERBS                   : constant := 16#80040180#;
                                                            -- winerror.h:6900
    OLEOBJ_E_INVALIDVERB               : constant := 16#80040181#;
                                                            -- winerror.h:6909
    CLIENTSITE_E_FIRST                 : constant := 16#80040190#;
                                                            -- winerror.h:6911
    CLIENTSITE_E_LAST                  : constant := 16#8004019f#;
                                                            -- winerror.h:6912
    CLIENTSITE_S_FIRST                 : constant := 16#40190#;
                                                            -- winerror.h:6913
    CLIENTSITE_S_LAST                  : constant := 16#4019f#;
                                                            -- winerror.h:6914
    INPLACE_E_NOTUNDOABLE              : constant := 16#800401a0#;
                                                            -- winerror.h:6922
    INPLACE_E_NOTOOLSPACE              : constant := 16#800401a1#;
                                                            -- winerror.h:6931
    INPLACE_E_FIRST                    : constant := 16#800401a0#;
                                                            -- winerror.h:6933
    INPLACE_E_LAST                     : constant := 16#800401af#;
                                                            -- winerror.h:6934
    INPLACE_S_FIRST                    : constant := 16#401a0#;
                                                            -- winerror.h:6935
    INPLACE_S_LAST                     : constant := 16#401af#;
                                                            -- winerror.h:6936
    ENUM_E_FIRST                       : constant := 16#800401b0#;
                                                            -- winerror.h:6937
    ENUM_E_LAST                        : constant := 16#800401bf#;
                                                            -- winerror.h:6938
    ENUM_S_FIRST                       : constant := 16#401b0#;
                                                            -- winerror.h:6939
    ENUM_S_LAST                        : constant := 16#401bf#;
                                                            -- winerror.h:6940
    CONVERT10_E_FIRST                  : constant := 16#800401c0#;
                                                            -- winerror.h:6941
    CONVERT10_E_LAST                   : constant := 16#800401cf#;
                                                            -- winerror.h:6942
    CONVERT10_S_FIRST                  : constant := 16#401c0#;
                                                            -- winerror.h:6943
    CONVERT10_S_LAST                   : constant := 16#401cf#;
                                                            -- winerror.h:6944
    CONVERT10_E_OLESTREAM_GET          : constant := 16#800401c0#;
                                                            -- winerror.h:6952
    CONVERT10_E_OLESTREAM_PUT          : constant := 16#800401c1#;
                                                            -- winerror.h:6961
    CONVERT10_E_OLESTREAM_FMT          : constant := 16#800401c2#;
                                                            -- winerror.h:6970
    CONVERT10_E_OLESTREAM_BITMAP_TO_DIB: constant := 16#800401c3#;
                                                            -- winerror.h:6979
    CONVERT10_E_STG_FMT                : constant := 16#800401c4#;
                                                            -- winerror.h:6988
    CONVERT10_E_STG_NO_STD_STREAM      : constant := 16#800401c5#;
                                                            -- winerror.h:6997
    CONVERT10_E_STG_DIB_TO_BITMAP      : constant := 16#800401c6#;
                                                            -- winerror.h:7007
    CLIPBRD_E_FIRST                    : constant := 16#800401d0#;
                                                            -- winerror.h:7009
    CLIPBRD_E_LAST                     : constant := 16#800401df#;
                                                            -- winerror.h:7010
    CLIPBRD_S_FIRST                    : constant := 16#401d0#;
                                                            -- winerror.h:7011
    CLIPBRD_S_LAST                     : constant := 16#401df#;
                                                            -- winerror.h:7012
    CLIPBRD_E_CANT_OPEN                : constant := 16#800401d0#;
                                                            -- winerror.h:7020
    CLIPBRD_E_CANT_EMPTY               : constant := 16#800401d1#;
                                                            -- winerror.h:7029
    CLIPBRD_E_CANT_SET                 : constant := 16#800401d2#;
                                                            -- winerror.h:7038
    CLIPBRD_E_BAD_DATA                 : constant := 16#800401d3#;
                                                            -- winerror.h:7047
    CLIPBRD_E_CANT_CLOSE               : constant := 16#800401d4#;
                                                            -- winerror.h:7056
    MK_E_FIRST                         : constant := 16#800401e0#;
                                                            -- winerror.h:7058
    MK_E_LAST                          : constant := 16#800401ef#;
                                                            -- winerror.h:7059
    MK_S_FIRST                         : constant := 16#401e0#;
                                                            -- winerror.h:7060
    MK_S_LAST                          : constant := 16#401ef#;
                                                            -- winerror.h:7061
    MK_E_CONNECTMANUALLY               : constant := 16#800401e0#;
                                                            -- winerror.h:7069
    MK_E_EXCEEDEDDEADLINE              : constant := 16#800401e1#;
                                                            -- winerror.h:7078
    MK_E_NEEDGENERIC                   : constant := 16#800401e2#;
                                                            -- winerror.h:7087
    MK_E_UNAVAILABLE                   : constant := 16#800401e3#;
                                                            -- winerror.h:7096
    MK_E_SYNTAX                        : constant := 16#800401e4#;
                                                            -- winerror.h:7105
    MK_E_NOOBJECT                      : constant := 16#800401e5#;
                                                            -- winerror.h:7114
    MK_E_INVALIDEXTENSION              : constant := 16#800401e6#;
                                                            -- winerror.h:7123
    MK_E_INTERMEDIATEINTERFACENOTSUPPORTED : constant := 16#800401e7#;
                                                            -- winerror.h:7132
    MK_E_NOTBINDABLE                   : constant := 16#800401e8#;
                                                            -- winerror.h:7141
    MK_E_NOTBOUND                      : constant := 16#800401e9#;
                                                            -- winerror.h:7150
    MK_E_CANTOPENFILE                  : constant := 16#800401ea#;
                                                            -- winerror.h:7159
    MK_E_MUSTBOTHERUSER                : constant := 16#800401eb#;
                                                            -- winerror.h:7168
    MK_E_NOINVERSE                     : constant := 16#800401ec#;
                                                            -- winerror.h:7177
    MK_E_NOSTORAGE                     : constant := 16#800401ed#;
                                                            -- winerror.h:7186
    MK_E_NOPREFIX                      : constant := 16#800401ee#;
                                                            -- winerror.h:7195
    MK_E_ENUMERATION_FAILED            : constant := 16#800401ef#;
                                                            -- winerror.h:7204
    CO_E_FIRST                         : constant := 16#800401f0#;
                                                            -- winerror.h:7206
    CO_E_LAST                          : constant := 16#800401ff#;
                                                            -- winerror.h:7207
    CO_S_FIRST                         : constant := 16#401f0#;
                                                            -- winerror.h:7208
    CO_S_LAST                          : constant := 16#401ff#;
                                                            -- winerror.h:7209
    CO_E_NOTINITIALIZED                : constant := 16#800401f0#;
                                                            -- winerror.h:7217
    CO_E_ALREADYINITIALIZED            : constant := 16#800401f1#;
                                                            -- winerror.h:7226
    CO_E_CANTDETERMINECLASS            : constant := 16#800401f2#;
                                                            -- winerror.h:7235
    CO_E_CLASSSTRING                   : constant := 16#800401f3#;
                                                            -- winerror.h:7244
    CO_E_IIDSTRING                     : constant := 16#800401f4#;
                                                            -- winerror.h:7253
    CO_E_APPNOTFOUND                   : constant := 16#800401f5#;
                                                            -- winerror.h:7262
    CO_E_APPSINGLEUSE                  : constant := 16#800401f6#;
                                                            -- winerror.h:7271
    CO_E_ERRORINAPP                    : constant := 16#800401f7#;
                                                            -- winerror.h:7280
    CO_E_DLLNOTFOUND                   : constant := 16#800401f8#;
                                                            -- winerror.h:7289
    CO_E_ERRORINDLL                    : constant := 16#800401f9#;
                                                            -- winerror.h:7298
    CO_E_WRONGOSFORAPP                 : constant := 16#800401fa#;
                                                            -- winerror.h:7307
    CO_E_OBJNOTREG                     : constant := 16#800401fb#;
                                                            -- winerror.h:7316
    CO_E_OBJISREG                      : constant := 16#800401fc#;
                                                            -- winerror.h:7325
    CO_E_OBJNOTCONNECTED               : constant := 16#800401fd#;
                                                            -- winerror.h:7334
    CO_E_APPDIDNTREG                   : constant := 16#800401fe#;
                                                            -- winerror.h:7343
    CO_E_RELEASED                      : constant := 16#800401ff#;
                                                            -- winerror.h:7352
    OLE_S_USEREG                       : constant := 16#40000#;
                                                            -- winerror.h:7364
    OLE_S_STATIC                       : constant := 16#40001#;
                                                            -- winerror.h:7373
    OLE_S_MAC_CLIPFORMAT               : constant := 16#40002#;
                                                            -- winerror.h:7382
    DRAGDROP_S_DROP                    : constant := 16#40100#;
                                                            -- winerror.h:7391
    DRAGDROP_S_CANCEL                  : constant := 16#40101#;
                                                            -- winerror.h:7400
    DRAGDROP_S_USEDEFAULTCURSORS       : constant := 16#40102#;
                                                            -- winerror.h:7409
    DATA_S_SAMEFORMATETC               : constant := 16#40130#;
                                                            -- winerror.h:7418
    VIEW_S_ALREADY_FROZEN              : constant := 16#40140#;
                                                            -- winerror.h:7427
    CACHE_S_FORMATETC_NOTSUPPORTED     : constant := 16#40170#;
                                                            -- winerror.h:7436
    CACHE_S_SAMECACHE                  : constant := 16#40171#;
                                                            -- winerror.h:7445
    CACHE_S_SOMECACHES_NOTUPDATED      : constant := 16#40172#;
                                                            -- winerror.h:7454
    OLEOBJ_S_INVALIDVERB               : constant := 16#40180#;
                                                            -- winerror.h:7463
    OLEOBJ_S_CANNOT_DOVERB_NOW         : constant := 16#40181#;
                                                            -- winerror.h:7472
    OLEOBJ_S_INVALIDHWND               : constant := 16#40182#;
                                                            -- winerror.h:7481
    INPLACE_S_TRUNCATED                : constant := 16#401a0#;
                                                            -- winerror.h:7490
    CONVERT10_S_NO_PRESENTATION        : constant := 16#401c0#;
                                                            -- winerror.h:7499
    MK_S_REDUCED_TO_SELF               : constant := 16#401e2#;
                                                            -- winerror.h:7508
    MK_S_ME                            : constant := 16#401e4#;
                                                            -- winerror.h:7517
    MK_S_HIM                           : constant := 16#401e5#;
                                                            -- winerror.h:7526
    MK_S_US                            : constant := 16#401e6#;
                                                            -- winerror.h:7535
    MK_S_MONIKERALREADYREGISTERED      : constant := 16#401e7#;
                                                            -- winerror.h:7544
    CO_E_CLASS_CREATE_FAILED           : constant := 16#80080001#;
                                                            -- winerror.h:7560
    CO_E_SCM_ERROR                     : constant := 16#80080002#;
                                                            -- winerror.h:7569
    CO_E_SCM_RPC_FAILURE               : constant := 16#80080003#;
                                                            -- winerror.h:7578
    CO_E_BAD_PATH                      : constant := 16#80080004#;
                                                            -- winerror.h:7587
    CO_E_SERVER_EXEC_FAILURE           : constant := 16#80080005#;
                                                            -- winerror.h:7596
    CO_E_OBJSRV_RPC_FAILURE            : constant := 16#80080006#;
                                                            -- winerror.h:7605
    MK_E_NO_NORMALIZED                 : constant := 16#80080007#;
                                                            -- winerror.h:7614
    CO_E_SERVER_STOPPING               : constant := 16#80080008#;
                                                            -- winerror.h:7623
    MEM_E_INVALID_ROOT                 : constant := 16#80080009#;
                                                            -- winerror.h:7632
    MEM_E_INVALID_LINK                 : constant := 16#80080010#;
                                                            -- winerror.h:7641
    MEM_E_INVALID_SIZE                 : constant := 16#80080011#;
                                                            -- winerror.h:7650
    DISP_E_UNKNOWNINTERFACE            : constant := 16#80020001#;
                                                            -- winerror.h:7662
    DISP_E_MEMBERNOTFOUND              : constant := 16#80020003#;
                                                            -- winerror.h:7671
    DISP_E_PARAMNOTFOUND               : constant := 16#80020004#;
                                                            -- winerror.h:7680
    DISP_E_TYPEMISMATCH                : constant := 16#80020005#;
                                                            -- winerror.h:7689
    DISP_E_UNKNOWNNAME                 : constant := 16#80020006#;
                                                            -- winerror.h:7698
    DISP_E_NONAMEDARGS                 : constant := 16#80020007#;
                                                            -- winerror.h:7707
    DISP_E_BADVARTYPE                  : constant := 16#80020008#;
                                                            -- winerror.h:7716
    DISP_E_EXCEPTION                   : constant := 16#80020009#;
                                                            -- winerror.h:7725
    DISP_E_OVERFLOW                    : constant := 16#8002000a#;
                                                            -- winerror.h:7734
    DISP_E_BADINDEX                    : constant := 16#8002000b#;
                                                            -- winerror.h:7743
    DISP_E_UNKNOWNLCID                 : constant := 16#8002000c#;
                                                            -- winerror.h:7752
    DISP_E_ARRAYISLOCKED               : constant := 16#8002000d#;
                                                            -- winerror.h:7761
    DISP_E_BADPARAMCOUNT               : constant := 16#8002000e#;
                                                            -- winerror.h:7770
    DISP_E_PARAMNOTOPTIONAL            : constant := 16#8002000f#;
                                                            -- winerror.h:7779
    DISP_E_BADCALLEE                   : constant := 16#80020010#;
                                                            -- winerror.h:7788
    DISP_E_NOTACOLLECTION              : constant := 16#80020011#;
                                                            -- winerror.h:7797
    TYPE_E_BUFFERTOOSMALL              : constant := 16#80028016#;
                                                            -- winerror.h:7806
    TYPE_E_INVDATAREAD                 : constant := 16#80028018#;
                                                            -- winerror.h:7815
    TYPE_E_UNSUPFORMAT                 : constant := 16#80028019#;
                                                            -- winerror.h:7824
    TYPE_E_REGISTRYACCESS              : constant := 16#8002801c#;
                                                            -- winerror.h:7833
    TYPE_E_LIBNOTREGISTERED            : constant := 16#8002801d#;
                                                            -- winerror.h:7842
    TYPE_E_UNDEFINEDTYPE               : constant := 16#80028027#;
                                                            -- winerror.h:7851
    TYPE_E_QUALIFIEDNAMEDISALLOWED     : constant := 16#80028028#;
                                                            -- winerror.h:7860
    TYPE_E_INVALIDSTATE                : constant := 16#80028029#;
                                                            -- winerror.h:7869
    TYPE_E_WRONGTYPEKIND               : constant := 16#8002802a#;
                                                            -- winerror.h:7878
    TYPE_E_ELEMENTNOTFOUND             : constant := 16#8002802b#;
                                                            -- winerror.h:7887
    TYPE_E_AMBIGUOUSNAME               : constant := 16#8002802c#;
                                                            -- winerror.h:7896
    TYPE_E_NAMECONFLICT                : constant := 16#8002802d#;
                                                            -- winerror.h:7905
    TYPE_E_UNKNOWNLCID                 : constant := 16#8002802e#;
                                                            -- winerror.h:7914
    TYPE_E_DLLFUNCTIONNOTFOUND         : constant := 16#8002802f#;
                                                            -- winerror.h:7923
    TYPE_E_BADMODULEKIND               : constant := 16#800288bd#;
                                                            -- winerror.h:7932
    TYPE_E_SIZETOOBIG                  : constant := 16#800288c5#;
                                                            -- winerror.h:7941
    TYPE_E_DUPLICATEID                 : constant := 16#800288c6#;
                                                            -- winerror.h:7950
    TYPE_E_INVALIDID                   : constant := 16#800288cf#;
                                                            -- winerror.h:7959
    TYPE_E_TYPEMISMATCH                : constant := 16#80028ca0#;
                                                            -- winerror.h:7968
    TYPE_E_OUTOFBOUNDS                 : constant := 16#80028ca1#;
                                                            -- winerror.h:7977
    TYPE_E_IOERROR                     : constant := 16#80028ca2#;
                                                            -- winerror.h:7986
    TYPE_E_CANTCREATETMPFILE           : constant := 16#80028ca3#;
                                                            -- winerror.h:7995
    TYPE_E_CANTLOADLIBRARY             : constant := 16#80029c4a#;
                                                            -- winerror.h:8004
    TYPE_E_INCONSISTENTPROPFUNCS       : constant := 16#80029c83#;
                                                            -- winerror.h:8013
    TYPE_E_CIRCULARTYPE                : constant := 16#80029c84#;
                                                            -- winerror.h:8022
    STG_E_INVALIDFUNCTION              : constant := 16#80030001#;
                                                            -- winerror.h:8034
    STG_E_FILENOTFOUND                 : constant := 16#80030002#;
                                                            -- winerror.h:8043
    STG_E_PATHNOTFOUND                 : constant := 16#80030003#;
                                                            -- winerror.h:8052
    STG_E_TOOMANYOPENFILES             : constant := 16#80030004#;
                                                            -- winerror.h:8061
    STG_E_ACCESSDENIED                 : constant := 16#80030005#;
                                                            -- winerror.h:8070
    STG_E_INVALIDHANDLE                : constant := 16#80030006#;
                                                            -- winerror.h:8079
    STG_E_INSUFFICIENTMEMORY           : constant := 16#80030008#;
                                                            -- winerror.h:8088
    STG_E_INVALIDPOINTER               : constant := 16#80030009#;
                                                            -- winerror.h:8097
    STG_E_NOMOREFILES                  : constant := 16#80030012#;
                                                            -- winerror.h:8106
    STG_E_DISKISWRITEPROTECTED         : constant := 16#80030013#;
                                                            -- winerror.h:8115
    STG_E_SEEKERROR                    : constant := 16#80030019#;
                                                            -- winerror.h:8124
    STG_E_WRITEFAULT                   : constant := 16#8003001d#;
                                                            -- winerror.h:8133
    STG_E_READFAULT                    : constant := 16#8003001e#;
                                                            -- winerror.h:8142
    STG_E_SHAREVIOLATION               : constant := 16#80030020#;
                                                            -- winerror.h:8151
    STG_E_LOCKVIOLATION                : constant := 16#80030021#;
                                                            -- winerror.h:8160
    STG_E_FILEALREADYEXISTS            : constant := 16#80030050#;
                                                            -- winerror.h:8169
    STG_E_INVALIDPARAMETER             : constant := 16#80030057#;
                                                            -- winerror.h:8178
    STG_E_MEDIUMFULL                   : constant := 16#80030070#;
                                                            -- winerror.h:8187
    STG_E_ABNORMALAPIEXIT              : constant := 16#800300fa#;
                                                            -- winerror.h:8196
    STG_E_INVALIDHEADER                : constant := 16#800300fb#;
                                                            -- winerror.h:8205
    STG_E_INVALIDNAME                  : constant := 16#800300fc#;
                                                            -- winerror.h:8214
    STG_E_UNKNOWN                      : constant := 16#800300fd#;
                                                            -- winerror.h:8223
    STG_E_UNIMPLEMENTEDFUNCTION        : constant := 16#800300fe#;
                                                            -- winerror.h:8232
    STG_E_INVALIDFLAG                  : constant := 16#800300ff#;
                                                            -- winerror.h:8241
    STG_E_INUSE                        : constant := 16#80030100#;
                                                            -- winerror.h:8250
    STG_E_NOTCURRENT                   : constant := 16#80030101#;
                                                            -- winerror.h:8259
    STG_E_REVERTED                     : constant := 16#80030102#;
                                                            -- winerror.h:8268
    STG_E_CANTSAVE                     : constant := 16#80030103#;
                                                            -- winerror.h:8277
    STG_E_OLDFORMAT                    : constant := 16#80030104#;
                                                            -- winerror.h:8286
    STG_E_OLDDLL                       : constant := 16#80030105#;
                                                            -- winerror.h:8295
    STG_E_SHAREREQUIRED                : constant := 16#80030106#;
                                                            -- winerror.h:8304
    STG_E_NOTFILEBASEDSTORAGE          : constant := 16#80030107#;
                                                            -- winerror.h:8313
    STG_E_EXTANTMARSHALLINGS           : constant := 16#80030108#;
                                                            -- winerror.h:8322
    STG_S_CONVERTED                    : constant := 16#30200#;
                                                            -- winerror.h:8331
    RPC_E_CALL_REJECTED                : constant := 16#80010001#;
                                                            -- winerror.h:8346
    RPC_E_CALL_CANCELED                : constant := 16#80010002#;
                                                            -- winerror.h:8355
    RPC_E_CANTPOST_INSENDCALL          : constant := 16#80010003#;
                                                            -- winerror.h:8365
    RPC_E_CANTCALLOUT_INASYNCCALL      : constant := 16#80010004#;
                                                            -- winerror.h:8375
    RPC_E_CANTCALLOUT_INEXTERNALCALL   : constant := 16#80010005#;
                                                            -- winerror.h:8384
    RPC_E_CONNECTION_TERMINATED        : constant := 16#80010006#;
                                                            -- winerror.h:8395
    RPC_E_SERVER_DIED                  : constant := 16#80010007#;
                                                            -- winerror.h:8406
    RPC_E_CLIENT_DIED                  : constant := 16#80010008#;
                                                            -- winerror.h:8416
    RPC_E_INVALID_DATAPACKET           : constant := 16#80010009#;
                                                            -- winerror.h:8425
    RPC_E_CANTTRANSMIT_CALL            : constant := 16#8001000a#;
                                                            -- winerror.h:8435
    RPC_E_CLIENT_CANTMARSHAL_DATA      : constant := 16#8001000b#;
                                                            -- winerror.h:8444
    RPC_E_CLIENT_CANTUNMARSHAL_DATA    : constant := 16#8001000c#;
                                                            -- winerror.h:8453
    RPC_E_SERVER_CANTMARSHAL_DATA      : constant := 16#8001000d#;
                                                            -- winerror.h:8462
    RPC_E_SERVER_CANTUNMARSHAL_DATA    : constant := 16#8001000e#;
                                                            -- winerror.h:8471
    RPC_E_INVALID_DATA                 : constant := 16#8001000f#;
                                                            -- winerror.h:8480
    RPC_E_INVALID_PARAMETER            : constant := 16#80010010#;
                                                            -- winerror.h:8489
    RPC_E_CANTCALLOUT_AGAIN            : constant := 16#80010011#;
                                                            -- winerror.h:8498
    RPC_E_SERVER_DIED_DNE              : constant := 16#80010012#;
                                                            -- winerror.h:8508
    RPC_E_SYS_CALL_FAILED              : constant := 16#80010100#;
                                                            -- winerror.h:8517
    RPC_E_OUT_OF_RESOURCES             : constant := 16#80010101#;
                                                            -- winerror.h:8526
    RPC_E_ATTEMPTED_MULTITHREAD        : constant := 16#80010102#;
                                                            -- winerror.h:8535
    RPC_E_NOT_REGISTERED               : constant := 16#80010103#;
                                                            -- winerror.h:8544
    RPC_E_FAULT                        : constant := 16#80010104#;
                                                            -- winerror.h:8553
    RPC_E_SERVERFAULT                  : constant := 16#80010105#;
                                                            -- winerror.h:8562
    RPC_E_CHANGED_MODE                 : constant := 16#80010106#;
                                                            -- winerror.h:8571
    RPC_E_INVALIDMETHOD                : constant := 16#80010107#;
                                                            -- winerror.h:8580
    RPC_E_DISCONNECTED                 : constant := 16#80010108#;
                                                            -- winerror.h:8589
    RPC_E_RETRY                        : constant := 16#80010109#;
                                                            -- winerror.h:8598
    RPC_E_SERVERCALL_RETRYLATER        : constant := 16#8001010a#;
                                                            -- winerror.h:8607
    RPC_E_SERVERCALL_REJECTED          : constant := 16#8001010b#;
                                                            -- winerror.h:8616
    RPC_E_INVALID_CALLDATA             : constant := 16#8001010c#;
                                                            -- winerror.h:8625
    RPC_E_CANTCALLOUT_ININPUTSYNCCALL  : constant := 16#8001010d#;
                                                            -- winerror.h:8634
    RPC_E_WRONG_THREAD                 : constant := 16#8001010e#;
                                                            -- winerror.h:8643
    RPC_E_THREAD_NOT_INIT              : constant := 16#8001010f#;
                                                            -- winerror.h:8652
    RPC_E_UNEXPECTED                   : constant := 16#8001ffff#;
                                                            -- winerror.h:8661

    type HRESULT is new ULONG;                              -- winerror.h:6015

    subtype SCODE is HRESULT;                               -- winerror.h:6015

    function SUCCEEDED(Status: HRESULT)                     -- winerror.h:6061
        return Standard.Boolean;

    function FAILED(Status: HRESULT)                        -- winerror.h:6067
        return Standard.Boolean;

    function IS_ERROR(Status: HRESULT)                      -- winerror.h:6074
        return Standard.Boolean
        renames FAILED;

    function HRESULT_CODE(H: HRESULT)                       -- winerror.h:6080
        return WORD;

    function SCODE_CODE(H: HRESULT) return WORD             -- winerror.h:6081
        renames HRESULT_CODE;

    function HRESULT_FACILITY(H: HRESULT) return WORD;      -- winerror.h:6087

    function SCODE_FACILITY(H: HRESULT) return WORD         -- winerror.h:6088
        renames HRESULT_FACILITY;

    function HRESULT_SEVERITY(H: HRESULT) return WORD;      -- winerror.h:6094

    function SCODE_SEVERITY(H: HRESULT) return WORD         -- winerror.h:6095
        renames HRESULT_SEVERITY;

    function MAKE_HRESULT(sev,fac,code: WORD)               -- winerror.h:6101
        return HRESULT;

    function MAKE_SCODE(sev,fac,code: WORD)                 -- winerror.h:6103
        return HRESULT
        renames MAKE_HRESULT;

    function HRESULT_FROM_WIN32(X: DWORD)                   -- winerror.h:6114
        return HRESULT;

    function HRESULT_FROM_NT(X: DWORD) return HRESULT;      -- winerror.h:6120

private

    pragma Inline(SUCCEEDED);
    pragma Inline(FAILED);
    pragma Inline(HRESULT_CODE);
    pragma Inline(HRESULT_FACILITY);
    pragma Inline(HRESULT_SEVERITY);
    pragma Inline(MAKE_HRESULT);
    pragma Inline(HRESULT_FROM_WIN32);
    pragma Inline(HRESULT_FROM_NT);

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Winerror;
