-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winbase;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;

package Win32.Winspool is

    PRINTER_CONTROL_PAUSE          : constant := 1;         -- winspool.h:127
    PRINTER_CONTROL_RESUME         : constant := 2;         -- winspool.h:128
    PRINTER_CONTROL_PURGE          : constant := 3;         -- winspool.h:129
    PRINTER_STATUS_PAUSED          : constant := 16#1#;     -- winspool.h:131
    PRINTER_STATUS_ERROR           : constant := 16#2#;     -- winspool.h:132
    PRINTER_STATUS_PENDING_DELETION: constant := 16#4#;     -- winspool.h:133
    PRINTER_STATUS_PAPER_JAM       : constant := 16#8#;     -- winspool.h:134
    PRINTER_STATUS_PAPER_OUT       : constant := 16#10#;    -- winspool.h:135
    PRINTER_STATUS_MANUAL_FEED     : constant := 16#20#;    -- winspool.h:136
    PRINTER_STATUS_PAPER_PROBLEM   : constant := 16#40#;    -- winspool.h:137
    PRINTER_STATUS_OFFLINE         : constant := 16#80#;    -- winspool.h:138
    PRINTER_STATUS_IO_ACTIVE       : constant := 16#100#;   -- winspool.h:139
    PRINTER_STATUS_BUSY            : constant := 16#200#;   -- winspool.h:140
    PRINTER_STATUS_PRINTING        : constant := 16#400#;   -- winspool.h:141
    PRINTER_STATUS_OUTPUT_BIN_FULL : constant := 16#800#;   -- winspool.h:142
    PRINTER_STATUS_NOT_AVAILABLE   : constant := 16#1000#;  -- winspool.h:143
    PRINTER_STATUS_WAITING         : constant := 16#2000#;  -- winspool.h:144
    PRINTER_STATUS_PROCESSING      : constant := 16#4000#;  -- winspool.h:145
    PRINTER_STATUS_INITIALIZING    : constant := 16#8000#;  -- winspool.h:146
    PRINTER_STATUS_WARMING_UP      : constant := 16#10000#; -- winspool.h:147
    PRINTER_STATUS_TONER_LOW       : constant := 16#20000#; -- winspool.h:148
    PRINTER_STATUS_NO_TONER        : constant := 16#40000#; -- winspool.h:149
    PRINTER_STATUS_PAGE_PUNT       : constant := 16#80000#; -- winspool.h:150
    PRINTER_STATUS_USER_INTERVENTION: constant := 16#100000#;
                                                            -- winspool.h:151
    PRINTER_STATUS_OUT_OF_MEMORY   : constant := 16#200000#;-- winspool.h:152
    PRINTER_STATUS_DOOR_OPEN       : constant := 16#400000#;-- winspool.h:153
    PRINTER_ATTRIBUTE_QUEUED       : constant := 16#1#;     -- winspool.h:156
    PRINTER_ATTRIBUTE_DIRECT       : constant := 16#2#;     -- winspool.h:157
    PRINTER_ATTRIBUTE_DEFAULT      : constant := 16#4#;     -- winspool.h:158
    PRINTER_ATTRIBUTE_SHARED       : constant := 16#8#;     -- winspool.h:159
    PRINTER_ATTRIBUTE_NETWORK      : constant := 16#10#;    -- winspool.h:160
    PRINTER_ATTRIBUTE_HIDDEN       : constant := 16#20#;    -- winspool.h:161
    PRINTER_ATTRIBUTE_LOCAL        : constant := 16#40#;    -- winspool.h:162
    PRINTER_ATTRIBUTE_ENABLE_DEVQ  : constant := 16#80#;    -- winspool.h:164
    PRINTER_ATTRIBUTE_KEEPPRINTEDJOBS: constant := 16#100#; -- winspool.h:165
    PRINTER_ATTRIBUTE_DO_COMPLETE_FIRST: constant := 16#200#;
                                                            -- winspool.h:166
    NO_PRIORITY                    : constant := 0;         -- winspool.h:171
    MAX_PRIORITY                   : constant := 99;        -- winspool.h:172
    MIN_PRIORITY                   : constant := 1;         -- winspool.h:173
    DEF_PRIORITY                   : constant := 1;         -- winspool.h:174
    JOB_CONTROL_PAUSE              : constant := 1;         -- winspool.h:276
    JOB_CONTROL_RESUME             : constant := 2;         -- winspool.h:277
    JOB_CONTROL_CANCEL             : constant := 3;         -- winspool.h:278
    JOB_CONTROL_RESTART            : constant := 4;         -- winspool.h:279
    JOB_STATUS_PAUSED              : constant := 16#1#;     -- winspool.h:281
    JOB_STATUS_ERROR               : constant := 16#2#;     -- winspool.h:282
    JOB_STATUS_DELETING            : constant := 16#4#;     -- winspool.h:283
    JOB_STATUS_SPOOLING            : constant := 16#8#;     -- winspool.h:284
    JOB_STATUS_PRINTING            : constant := 16#10#;    -- winspool.h:285
    JOB_STATUS_OFFLINE             : constant := 16#20#;    -- winspool.h:286
    JOB_STATUS_PAPEROUT            : constant := 16#40#;    -- winspool.h:287
    JOB_STATUS_PRINTED             : constant := 16#80#;    -- winspool.h:288
    JOB_POSITION_UNSPECIFIED       : constant := 0;         -- winspool.h:290
    FORM_BUILTIN                   : constant := 16#1#;     -- winspool.h:396
    PRINTER_ENUM_DEFAULT           : constant := 16#1#;     -- winspool.h:532
    PRINTER_ENUM_LOCAL             : constant := 16#2#;     -- winspool.h:533
    PRINTER_ENUM_CONNECTIONS       : constant := 16#4#;     -- winspool.h:534
    PRINTER_ENUM_FAVORITE          : constant := 16#4#;     -- winspool.h:535
    PRINTER_ENUM_NAME              : constant := 16#8#;     -- winspool.h:536
    PRINTER_ENUM_REMOTE            : constant := 16#10#;    -- winspool.h:537
    PRINTER_ENUM_SHARED            : constant := 16#20#;    -- winspool.h:538
    PRINTER_ENUM_NETWORK           : constant := 16#40#;    -- winspool.h:539
    PRINTER_ENUM_EXPAND            : constant := 16#4000#;  -- winspool.h:541
    PRINTER_ENUM_CONTAINER         : constant := 16#8000#;  -- winspool.h:542
    PRINTER_ENUM_ICONMASK          : constant := 16#ff0000#;-- winspool.h:544
    PRINTER_ENUM_ICON1             : constant := 16#10000#; -- winspool.h:545
    PRINTER_ENUM_ICON2             : constant := 16#20000#; -- winspool.h:546
    PRINTER_ENUM_ICON3             : constant := 16#40000#; -- winspool.h:547
    PRINTER_ENUM_ICON4             : constant := 16#80000#; -- winspool.h:548
    PRINTER_ENUM_ICON5             : constant := 16#100000#;-- winspool.h:549
    PRINTER_ENUM_ICON6             : constant := 16#200000#;-- winspool.h:550
    PRINTER_ENUM_ICON7             : constant := 16#400000#;-- winspool.h:551
    PRINTER_ENUM_ICON8             : constant := 16#800000#;-- winspool.h:552
    PRINTER_CHANGE_ADD_PRINTER     : constant := 16#1#;     -- winspool.h:1227
    PRINTER_CHANGE_SET_PRINTER     : constant := 16#2#;     -- winspool.h:1228
    PRINTER_CHANGE_DELETE_PRINTER  : constant := 16#4#;     -- winspool.h:1229
    PRINTER_CHANGE_FAILED_CONNECTION_PRINTER: constant := 16#8#;
                                                            -- winspool.h:1230
    PRINTER_CHANGE_PRINTER         : constant := 16#ff#;    -- winspool.h:1231
    PRINTER_CHANGE_ADD_JOB         : constant := 16#100#;   -- winspool.h:1232
    PRINTER_CHANGE_SET_JOB         : constant := 16#200#;   -- winspool.h:1233
    PRINTER_CHANGE_DELETE_JOB      : constant := 16#400#;   -- winspool.h:1234
    PRINTER_CHANGE_WRITE_JOB       : constant := 16#800#;   -- winspool.h:1235
    PRINTER_CHANGE_JOB             : constant := 16#ff00#;  -- winspool.h:1236
    PRINTER_CHANGE_ADD_FORM        : constant := 16#10000#; -- winspool.h:1237
    PRINTER_CHANGE_SET_FORM        : constant := 16#20000#; -- winspool.h:1238
    PRINTER_CHANGE_DELETE_FORM     : constant := 16#40000#; -- winspool.h:1239
    PRINTER_CHANGE_FORM            : constant := 16#70000#; -- winspool.h:1240
    PRINTER_CHANGE_ADD_PORT        : constant := 16#100000#;-- winspool.h:1241
    PRINTER_CHANGE_CONFIGURE_PORT  : constant := 16#200000#;-- winspool.h:1242
    PRINTER_CHANGE_DELETE_PORT     : constant := 16#400000#;-- winspool.h:1243
    PRINTER_CHANGE_PORT            : constant := 16#700000#;-- winspool.h:1244
    PRINTER_CHANGE_ADD_PRINT_PROCESSOR: constant := 16#1000000#;
                                                            -- winspool.h:1245
    PRINTER_CHANGE_DELETE_PRINT_PROCESSOR: constant := 16#4000000#;
                                                            -- winspool.h:1246
    PRINTER_CHANGE_PRINT_PROCESSOR : constant := 16#7000000#;
                                                            -- winspool.h:1247
    PRINTER_CHANGE_ADD_PRINTER_DRIVER: constant := 16#10000000#;
                                                            -- winspool.h:1248
    PRINTER_CHANGE_SET_PRINTER_DRIVER: constant := 16#20000000#;
                                                            -- winspool.h:1249
    PRINTER_CHANGE_DELETE_PRINTER_DRIVER: constant := 16#40000000#;
                                                            -- winspool.h:1250
    PRINTER_CHANGE_PRINTER_DRIVER  : constant := 16#70000000#;
                                                            -- winspool.h:1251
    PRINTER_CHANGE_TIMEOUT         : constant := 16#80000000#;
                                                            -- winspool.h:1252
    PRINTER_CHANGE_ALL             : constant := 16#7777ffff#;
                                                            -- winspool.h:1253
    PRINTER_ERROR_INFORMATION      : constant := 16#80000000#;
                                                            -- winspool.h:1283
    PRINTER_ERROR_WARNING          : constant := 16#40000000#;
                                                            -- winspool.h:1284
    PRINTER_ERROR_SEVERE           : constant := 16#20000000#;
                                                            -- winspool.h:1285
    PRINTER_ERROR_OUTOFPAPER       : constant := 16#1#;     -- winspool.h:1287
    PRINTER_ERROR_JAM              : constant := 16#2#;     -- winspool.h:1288
    PRINTER_ERROR_OUTOFTONER       : constant := 16#4#;     -- winspool.h:1289
    SERVER_ACCESS_ADMINISTER       : constant := 16#1#;     -- winspool.h:1692
    SERVER_ACCESS_ENUMERATE        : constant := 16#2#;     -- winspool.h:1693
    PRINTER_ACCESS_ADMINISTER      : constant := 16#4#;     -- winspool.h:1695
    PRINTER_ACCESS_USE             : constant := 16#8#;     -- winspool.h:1696
    JOB_ACCESS_ADMINISTER          : constant := 16#10#;    -- winspool.h:1698
    SERVER_ALL_ACCESS              : constant := 16#f0003#; -- winspool.h:1705
    SERVER_READ                    : constant := 16#20002#; -- winspool.h:1709
    SERVER_WRITE                   : constant := 16#20003#; -- winspool.h:1712
    SERVER_EXECUTE                 : constant := 16#20002#; -- winspool.h:1716
    PRINTER_ALL_ACCESS             : constant := 16#f000c#; -- winspool.h:1723
    PRINTER_READ                   : constant := 16#20008#; -- winspool.h:1727
    PRINTER_WRITE                  : constant := 16#20008#; -- winspool.h:1730
    PRINTER_EXECUTE                : constant := 16#20008#; -- winspool.h:1733
    JOB_ALL_ACCESS                 : constant := 16#f0010#; -- winspool.h:1740
    JOB_READ                       : constant := 16#20010#; -- winspool.h:1743
    JOB_WRITE                      : constant := 16#20010#; -- winspool.h:1746
    JOB_EXECUTE                    : constant := 16#20010#; -- winspool.h:1749

    type PRINTER_INFO_1A;                                   -- winspool.h:25
    type PRINTER_INFO_1W;                                   -- winspool.h:31
    type PRINTER_INFO_2A;                                   -- winspool.h:47
    type PRINTER_INFO_2W;                                   -- winspool.h:70
    type PRINTER_INFO_3;                                    -- winspool.h:103
    type PRINTER_INFO_4A;                                   -- winspool.h:107
    type PRINTER_INFO_4W;                                   -- winspool.h:112
    type JOB_INFO_1A;                                       -- winspool.h:176
    type JOB_INFO_1W;                                       -- winspool.h:191
    type JOB_INFO_2A;                                       -- winspool.h:216
    type JOB_INFO_2W;                                       -- winspool.h:241
    type ADDJOB_INFO_1A;                                    -- winspool.h:292
    type ADDJOB_INFO_1W;                                    -- winspool.h:296
    type DRIVER_INFO_1A;                                    -- winspool.h:310
    type DRIVER_INFO_1W;                                    -- winspool.h:313
    type DRIVER_INFO_2A;                                    -- winspool.h:326
    type DRIVER_INFO_2W;                                    -- winspool.h:334
    type DOC_INFO_1A;                                       -- winspool.h:353
    type DOC_INFO_1W;                                       -- winspool.h:358
    type FORM_INFO_1A;                                      -- winspool.h:373
    type FORM_INFO_1W;                                      -- winspool.h:379
    type PRINTPROCESSOR_INFO_1A;                            -- winspool.h:399
    type PRINTPROCESSOR_INFO_1W;                            -- winspool.h:402
    type PORT_INFO_1A;                                      -- winspool.h:415
    type PORT_INFO_1W;                                      -- winspool.h:418
    type MONITOR_INFO_1A;                                   -- winspool.h:432
    type MONITOR_INFO_1W;                                   -- winspool.h:435
    type MONITOR_INFO_2A;                                   -- winspool.h:448
    type MONITOR_INFO_2W;                                   -- winspool.h:453
    type DATATYPES_INFO_1A;                                 -- winspool.h:468
    type DATATYPES_INFO_1W;                                 -- winspool.h:471
    type PRINTER_DEFAULTSA;                                 -- winspool.h:484
    type PRINTER_DEFAULTSW;                                 -- winspool.h:489
    type PROVIDOR_INFO_1A;                                  -- winspool.h:1628
    type PROVIDOR_INFO_1W;                                  -- winspool.h:1633

    type PPRINTER_INFO_1A is access all PRINTER_INFO_1A;    -- winspool.h:30
    subtype LPPRINTER_INFO_1A is PPRINTER_INFO_1A;          -- winspool.h:30

    type PPRINTER_INFO_1W is access all PRINTER_INFO_1W;    -- winspool.h:36
    subtype LPPRINTER_INFO_1W is PPRINTER_INFO_1W;          -- winspool.h:36

    type PPRINTER_INFO_1 is access all PRINTER_INFO_1A;     -- winspool.h:43
    subtype LPPRINTER_INFO_1 is PPRINTER_INFO_1;            -- winspool.h:44

    type PPRINTER_INFO_2A is access all PRINTER_INFO_2A;    -- winspool.h:69
    subtype LPPRINTER_INFO_2A is PPRINTER_INFO_2A;          -- winspool.h:69

    type PPRINTER_INFO_2W is access all PRINTER_INFO_2W;    -- winspool.h:92
    subtype LPPRINTER_INFO_2W is PPRINTER_INFO_2W;          -- winspool.h:92

    type PPRINTER_INFO_2 is access all PRINTER_INFO_2A;     -- winspool.h:99
    subtype LPPRINTER_INFO_2 is PPRINTER_INFO_2;            -- winspool.h:100

    type PPRINTER_INFO_3 is access all PRINTER_INFO_3;      -- winspool.h:105
    subtype LPPRINTER_INFO_3 is PPRINTER_INFO_3;            -- winspool.h:105

    type PPRINTER_INFO_4A is access all PRINTER_INFO_4A;    -- winspool.h:111
    subtype LPPRINTER_INFO_4A is PPRINTER_INFO_4A;          -- winspool.h:111

    type PPRINTER_INFO_4W is access all PRINTER_INFO_4W;    -- winspool.h:116
    subtype LPPRINTER_INFO_4W is PPRINTER_INFO_4W;          -- winspool.h:116

    type PPRINTER_INFO_4 is access all PRINTER_INFO_4A;     -- winspool.h:123
    subtype LPPRINTER_INFO_4 is PPRINTER_INFO_4;            -- winspool.h:124

    type PJOB_INFO_1A is access all JOB_INFO_1A;            -- winspool.h:190
    subtype LPJOB_INFO_1A is PJOB_INFO_1A;                  -- winspool.h:190

    type PJOB_INFO_1W is access all JOB_INFO_1W;            -- winspool.h:205
    subtype LPJOB_INFO_1W is PJOB_INFO_1W;                  -- winspool.h:205

    type PJOB_INFO_1 is access all JOB_INFO_1A;             -- winspool.h:212
    subtype LPJOB_INFO_1 is PJOB_INFO_1;                    -- winspool.h:213

    type PJOB_INFO_2A is access all JOB_INFO_2A;            -- winspool.h:240
    subtype LPJOB_INFO_2A is PJOB_INFO_2A;                  -- winspool.h:240

    type PJOB_INFO_2W is access all JOB_INFO_2W;            -- winspool.h:265
    subtype LPJOB_INFO_2W is PJOB_INFO_2W;                  -- winspool.h:265

    type PJOB_INFO_2 is access all JOB_INFO_2A;             -- winspool.h:272
    subtype LPJOB_INFO_2 is PJOB_INFO_2;                    -- winspool.h:273

    type PADDJOB_INFO_1A is access all ADDJOB_INFO_1A;      -- winspool.h:295
    subtype LPADDJOB_INFO_1A is PADDJOB_INFO_1A;            -- winspool.h:295

    type PADDJOB_INFO_1W is access all ADDJOB_INFO_1W;      -- winspool.h:299
    subtype LPADDJOB_INFO_1W is PADDJOB_INFO_1W;            -- winspool.h:299

    type PADDJOB_INFO_1 is access all ADDJOB_INFO_1A;       -- winspool.h:306
    subtype LPADDJOB_INFO_1 is PADDJOB_INFO_1;              -- winspool.h:307

    type PDRIVER_INFO_1A is access all DRIVER_INFO_1A;      -- winspool.h:312
    subtype LPDRIVER_INFO_1A is PDRIVER_INFO_1A;            -- winspool.h:312

    type PDRIVER_INFO_1W is access all DRIVER_INFO_1W;      -- winspool.h:315
    subtype LPDRIVER_INFO_1W is PDRIVER_INFO_1W;            -- winspool.h:315

    type PDRIVER_INFO_1 is access all DRIVER_INFO_1A;       -- winspool.h:322
    subtype LPDRIVER_INFO_1 is PDRIVER_INFO_1;              -- winspool.h:323

    type PDRIVER_INFO_2A is access all DRIVER_INFO_2A;      -- winspool.h:333
    subtype LPDRIVER_INFO_2A is PDRIVER_INFO_2A;            -- winspool.h:333

    type PDRIVER_INFO_2W is access all DRIVER_INFO_2W;      -- winspool.h:341
    subtype LPDRIVER_INFO_2W is PDRIVER_INFO_2W;            -- winspool.h:341

    type PDRIVER_INFO_2 is access all DRIVER_INFO_2A;       -- winspool.h:348
    subtype LPDRIVER_INFO_2 is PDRIVER_INFO_2;              -- winspool.h:349

    type PDOC_INFO_1A is access all DOC_INFO_1A;            -- winspool.h:357
    subtype LPDOC_INFO_1A is PDOC_INFO_1A;                  -- winspool.h:357

    type PDOC_INFO_1W is access all DOC_INFO_1W;            -- winspool.h:362
    subtype LPDOC_INFO_1W is PDOC_INFO_1W;                  -- winspool.h:362

    type PDOC_INFO_1 is access all DOC_INFO_1A;             -- winspool.h:369
    subtype LPDOC_INFO_1 is PDOC_INFO_1;                    -- winspool.h:370

    type PFORM_INFO_1A is access all FORM_INFO_1A;          -- winspool.h:378
    subtype LPFORM_INFO_1A is PFORM_INFO_1A;                -- winspool.h:378

    type PFORM_INFO_1W is access all FORM_INFO_1W;          -- winspool.h:384
    subtype LPFORM_INFO_1W is PFORM_INFO_1W;                -- winspool.h:384

    type PFORM_INFO_1 is access all FORM_INFO_1A;           -- winspool.h:391
    subtype LPFORM_INFO_1 is PFORM_INFO_1;                  -- winspool.h:392

    type PPRINTPROCESSOR_INFO_1A is access all PRINTPROCESSOR_INFO_1A;
                                                            -- winspool.h:401
    subtype LPPRINTPROCESSOR_INFO_1A is PPRINTPROCESSOR_INFO_1A;
                                                            -- winspool.h:401

    type PPRINTPROCESSOR_INFO_1W is access all PRINTPROCESSOR_INFO_1W;
                                                            -- winspool.h:404
    subtype LPPRINTPROCESSOR_INFO_1W is PPRINTPROCESSOR_INFO_1W;
                                                            -- winspool.h:404

    type PPRINTPROCESSOR_INFO_1 is access all PRINTPROCESSOR_INFO_1A;
                                                            -- winspool.h:411
    subtype LPPRINTPROCESSOR_INFO_1 is PPRINTPROCESSOR_INFO_1;
                                                            -- winspool.h:412

    type PPORT_INFO_1A is access all PORT_INFO_1A;          -- winspool.h:417
    subtype LPPORT_INFO_1A is PPORT_INFO_1A;                -- winspool.h:417

    type PPORT_INFO_1W is access all PORT_INFO_1W;          -- winspool.h:420
    subtype LPPORT_INFO_1W is PPORT_INFO_1W;                -- winspool.h:420

    type PPORT_INFO_1 is access all PORT_INFO_1A;           -- winspool.h:427
    subtype LPPORT_INFO_1 is PPORT_INFO_1;                  -- winspool.h:428

    type PMONITOR_INFO_1A is access all MONITOR_INFO_1A;    -- winspool.h:434
    subtype LPMONITOR_INFO_1A is PMONITOR_INFO_1A;          -- winspool.h:434

    type PMONITOR_INFO_1W is access all MONITOR_INFO_1W;    -- winspool.h:437
    subtype LPMONITOR_INFO_1W is PMONITOR_INFO_1W;          -- winspool.h:437

    type PMONITOR_INFO_1 is access all MONITOR_INFO_1A;     -- winspool.h:444
    subtype LPMONITOR_INFO_1 is PMONITOR_INFO_1;            -- winspool.h:445

    type PMONITOR_INFO_2A is access all MONITOR_INFO_2A;    -- winspool.h:452
    subtype LPMONITOR_INFO_2A is PMONITOR_INFO_2A;          -- winspool.h:452

    type PMONITOR_INFO_2W is access all MONITOR_INFO_2W;    -- winspool.h:457
    subtype LPMONITOR_INFO_2W is PMONITOR_INFO_2W;          -- winspool.h:457

    type PMONITOR_INFO_2 is access all MONITOR_INFO_2A;     -- winspool.h:464
    subtype LPMONITOR_INFO_2 is PMONITOR_INFO_2;            -- winspool.h:465

    type PDATATYPES_INFO_1A is access all DATATYPES_INFO_1A;-- winspool.h:470
    subtype LPDATATYPES_INFO_1A is PDATATYPES_INFO_1A;      -- winspool.h:470

    type PDATATYPES_INFO_1W is access all DATATYPES_INFO_1W;-- winspool.h:473
    subtype LPDATATYPES_INFO_1W is PDATATYPES_INFO_1W;      -- winspool.h:473

    type PDATATYPES_INFO_1 is access all DATATYPES_INFO_1A; -- winspool.h:480
    subtype LPDATATYPES_INFO_1 is PDATATYPES_INFO_1;        -- winspool.h:481

    type PPRINTER_DEFAULTSA is access all PRINTER_DEFAULTSA;-- winspool.h:488
    subtype LPPRINTER_DEFAULTSA is PPRINTER_DEFAULTSA;      -- winspool.h:488

    type PPRINTER_DEFAULTSW is access all PRINTER_DEFAULTSW;-- winspool.h:493
    subtype LPPRINTER_DEFAULTSW is PPRINTER_DEFAULTSW;      -- winspool.h:493

    type PPRINTER_DEFAULTS is access all PRINTER_DEFAULTSA; -- winspool.h:500
    subtype LPPRINTER_DEFAULTS is PPRINTER_DEFAULTS;        -- winspool.h:501

    type PPROVIDOR_INFO_1A is access all PROVIDOR_INFO_1A;  -- winspool.h:1632
    subtype LPPROVIDOR_INFO_1A is PPROVIDOR_INFO_1A;        -- winspool.h:1632

    type PPROVIDOR_INFO_1W is access all PROVIDOR_INFO_1W;  -- winspool.h:1637
    subtype LPPROVIDOR_INFO_1W is PPROVIDOR_INFO_1W;        -- winspool.h:1637

    type PPROVIDOR_INFO_1 is access all PROVIDOR_INFO_1A;   -- winspool.h:1644
    subtype LPPROVIDOR_INFO_1 is PPROVIDOR_INFO_1;          -- winspool.h:1645

    type PRINTER_INFO_1A is                                 -- winspool.h:25
        record
            Flags       : Win32.DWORD;                      -- winspool.h:26
            pDescription: Win32.LPSTR;                      -- winspool.h:27
            pName       : Win32.LPSTR;                      -- winspool.h:28
            pComment    : Win32.LPSTR;                      -- winspool.h:29
        end record;

    type PRINTER_INFO_1W is                                 -- winspool.h:31
        record
            Flags       : Win32.DWORD;                      -- winspool.h:32
            pDescription: Win32.LPWSTR;                     -- winspool.h:33
            pName       : Win32.LPWSTR;                     -- winspool.h:34
            pComment    : Win32.LPWSTR;                     -- winspool.h:35
        end record;

    subtype PRINTER_INFO_1 is PRINTER_INFO_1A;              -- winspool.h:42

    type PRINTER_INFO_2A is                                 -- winspool.h:47
        record
            pServerName        : Win32.LPSTR;               -- winspool.h:48
            pPrinterName       : Win32.LPSTR;               -- winspool.h:49
            pShareName         : Win32.LPSTR;               -- winspool.h:50
            pPortName          : Win32.LPSTR;               -- winspool.h:51
            pDriverName        : Win32.LPSTR;               -- winspool.h:52
            pComment           : Win32.LPSTR;               -- winspool.h:53
            pLocation          : Win32.LPSTR;               -- winspool.h:54
            pDevMode           : Win32.Wingdi.LPDEVMODEA;   -- winspool.h:55
            pSepFile           : Win32.LPSTR;               -- winspool.h:56
            pPrintProcessor    : Win32.LPSTR;               -- winspool.h:57
            pDatatype          : Win32.LPSTR;               -- winspool.h:58
            pParameters        : Win32.LPSTR;               -- winspool.h:59
            pSecurityDescriptor: Win32.Winnt.PSECURITY_DESCRIPTOR;  
                                                            -- winspool.h:60
            Attributes         : Win32.DWORD;               -- winspool.h:61
            Priority           : Win32.DWORD;               -- winspool.h:62
            DefaultPriority    : Win32.DWORD;               -- winspool.h:63
            StartTime          : Win32.DWORD;               -- winspool.h:64
            UntilTime          : Win32.DWORD;               -- winspool.h:65
            Status             : Win32.DWORD;               -- winspool.h:66
            cJobs              : Win32.DWORD;               -- winspool.h:67
            AveragePPM         : Win32.DWORD;               -- winspool.h:68
        end record;

    type PRINTER_INFO_2W is                                 -- winspool.h:70
        record
            pServerName        : Win32.LPWSTR;              -- winspool.h:71
            pPrinterName       : Win32.LPWSTR;              -- winspool.h:72
            pShareName         : Win32.LPWSTR;              -- winspool.h:73
            pPortName          : Win32.LPWSTR;              -- winspool.h:74
            pDriverName        : Win32.LPWSTR;              -- winspool.h:75
            pComment           : Win32.LPWSTR;              -- winspool.h:76
            pLocation          : Win32.LPWSTR;              -- winspool.h:77
            pDevMode           : Win32.Wingdi.LPDEVMODEW;   -- winspool.h:78
            pSepFile           : Win32.LPWSTR;              -- winspool.h:79
            pPrintProcessor    : Win32.LPWSTR;              -- winspool.h:80
            pDatatype          : Win32.LPWSTR;              -- winspool.h:81
            pParameters        : Win32.LPWSTR;              -- winspool.h:82
            pSecurityDescriptor: Win32.Winnt.PSECURITY_DESCRIPTOR;  
                                                            -- winspool.h:83
            Attributes         : Win32.DWORD;               -- winspool.h:84
            Priority           : Win32.DWORD;               -- winspool.h:85
            DefaultPriority    : Win32.DWORD;               -- winspool.h:86
            StartTime          : Win32.DWORD;               -- winspool.h:87
            UntilTime          : Win32.DWORD;               -- winspool.h:88
            Status             : Win32.DWORD;               -- winspool.h:89
            cJobs              : Win32.DWORD;               -- winspool.h:90
            AveragePPM         : Win32.DWORD;               -- winspool.h:91
        end record;

    subtype PRINTER_INFO_2 is PRINTER_INFO_2A;              -- winspool.h:98

    type PRINTER_INFO_3 is                                  -- winspool.h:103
        record
            pSecurityDescriptor: Win32.Winnt.PSECURITY_DESCRIPTOR;  
                                                            -- winspool.h:104
        end record;

    type PRINTER_INFO_4A is                                 -- winspool.h:107
        record
            pPrinterName: Win32.LPSTR;                      -- winspool.h:108
            pServerName : Win32.LPSTR;                      -- winspool.h:109
            Attributes  : Win32.DWORD;                      -- winspool.h:110
        end record;

    type PRINTER_INFO_4W is                                 -- winspool.h:112
        record
            pPrinterName: Win32.LPWSTR;                     -- winspool.h:113
            pServerName : Win32.LPWSTR;                     -- winspool.h:114
            Attributes  : Win32.DWORD;                      -- winspool.h:115
        end record;

    subtype PRINTER_INFO_4 is PRINTER_INFO_4A;              -- winspool.h:122
                                                           
    type JOB_INFO_1A is                                     -- winspool.h:176
        record
            JobId       : Win32.DWORD;                      -- winspool.h:177
            pPrinterName: Win32.LPSTR;                      -- winspool.h:178
            pMachineName: Win32.LPSTR;                      -- winspool.h:179
            pUserName   : Win32.LPSTR;                      -- winspool.h:180
            pDocument   : Win32.LPSTR;                      -- winspool.h:181
            pDatatype   : Win32.LPSTR;                      -- winspool.h:182
            pStatus     : Win32.LPSTR;                      -- winspool.h:183
            Status      : Win32.DWORD;                      -- winspool.h:184
            Priority    : Win32.DWORD;                      -- winspool.h:185
            Position    : Win32.DWORD;                      -- winspool.h:186
            TotalPages  : Win32.DWORD;                      -- winspool.h:187
            PagesPrinted: Win32.DWORD;                      -- winspool.h:188
            Submitted   : Win32.Winbase.SYSTEMTIME;         -- winspool.h:189
        end record;

    type JOB_INFO_1W is                                     -- winspool.h:191
        record
            JobId       : Win32.DWORD;                      -- winspool.h:192
            pPrinterName: Win32.LPWSTR;                     -- winspool.h:193
            pMachineName: Win32.LPWSTR;                     -- winspool.h:194
            pUserName   : Win32.LPWSTR;                     -- winspool.h:195
            pDocument   : Win32.LPWSTR;                     -- winspool.h:196
            pDatatype   : Win32.LPWSTR;                     -- winspool.h:197
            pStatus     : Win32.LPWSTR;                     -- winspool.h:198
            Status      : Win32.DWORD;                      -- winspool.h:199
            Priority    : Win32.DWORD;                      -- winspool.h:200
            Position    : Win32.DWORD;                      -- winspool.h:201
            TotalPages  : Win32.DWORD;                      -- winspool.h:202
            PagesPrinted: Win32.DWORD;                      -- winspool.h:203
            Submitted   : Win32.Winbase.SYSTEMTIME;         -- winspool.h:204
        end record;                                        
                                                           
    subtype JOB_INFO_1 is JOB_INFO_1A;                      -- winspool.h:211
                                                           
    type JOB_INFO_2A is                                     -- winspool.h:216
        record
            JobId              : Win32.DWORD;               -- winspool.h:217
            pPrinterName       : Win32.LPSTR;               -- winspool.h:218
            pMachineName       : Win32.LPSTR;               -- winspool.h:219
            pUserName          : Win32.LPSTR;               -- winspool.h:220
            pDocument          : Win32.LPSTR;               -- winspool.h:221
            pNotifyName        : Win32.LPSTR;               -- winspool.h:222
            pDatatype          : Win32.LPSTR;               -- winspool.h:223
            pPrintProcessor    : Win32.LPSTR;               -- winspool.h:224
            pParameters        : Win32.LPSTR;               -- winspool.h:225
            pDriverName        : Win32.LPSTR;               -- winspool.h:226
            pDevMode           : Win32.Wingdi.LPDEVMODEA;   -- winspool.h:227
            pStatus            : Win32.LPSTR;               -- winspool.h:228
            pSecurityDescriptor: Win32.Winnt.PSECURITY_DESCRIPTOR;  
                                                            -- winspool.h:229
            Status             : Win32.DWORD;               -- winspool.h:230
            Priority           : Win32.DWORD;               -- winspool.h:231
            Position           : Win32.DWORD;               -- winspool.h:232
            StartTime          : Win32.DWORD;               -- winspool.h:233
            UntilTime          : Win32.DWORD;               -- winspool.h:234
            TotalPages         : Win32.DWORD;               -- winspool.h:235
            Size               : Win32.DWORD;               -- winspool.h:236
            Submitted          : Win32.Winbase.SYSTEMTIME;  -- winspool.h:237
            Time               : Win32.DWORD;               -- winspool.h:238
            PagesPrinted       : Win32.DWORD;               -- winspool.h:239
        end record;

    type JOB_INFO_2W is                                     -- winspool.h:241
        record
            JobId              : Win32.DWORD;               -- winspool.h:242
            pPrinterName       : Win32.LPWSTR;              -- winspool.h:243
            pMachineName       : Win32.LPWSTR;              -- winspool.h:244
            pUserName          : Win32.LPWSTR;              -- winspool.h:245
            pDocument          : Win32.LPWSTR;              -- winspool.h:246
            pNotifyName        : Win32.LPWSTR;              -- winspool.h:247
            pDatatype          : Win32.LPWSTR;              -- winspool.h:248
            pPrintProcessor    : Win32.LPWSTR;              -- winspool.h:249
            pParameters        : Win32.LPWSTR;              -- winspool.h:250
            pDriverName        : Win32.LPWSTR;              -- winspool.h:251
            pDevMode           : Win32.Wingdi.LPDEVMODEW;   -- winspool.h:252
            pStatus            : Win32.LPWSTR;              -- winspool.h:253
            pSecurityDescriptor: Win32.Winnt.PSECURITY_DESCRIPTOR;  
                                                            -- winspool.h:254
            Status             : Win32.DWORD;               -- winspool.h:255
            Priority           : Win32.DWORD;               -- winspool.h:256
            Position           : Win32.DWORD;               -- winspool.h:257
            StartTime          : Win32.DWORD;               -- winspool.h:258
            UntilTime          : Win32.DWORD;               -- winspool.h:259
            TotalPages         : Win32.DWORD;               -- winspool.h:260
            Size               : Win32.DWORD;               -- winspool.h:261
            Submitted          : Win32.Winbase.SYSTEMTIME;  -- winspool.h:262
            Time               : Win32.DWORD;               -- winspool.h:263
            PagesPrinted       : Win32.DWORD;               -- winspool.h:264
        end record;

    subtype JOB_INFO_2 is JOB_INFO_2A;                      -- winspool.h:271
                                                           
    type ADDJOB_INFO_1A is                                  -- winspool.h:292
        record
            Path : Win32.LPSTR;                             -- winspool.h:293
            JobId: Win32.DWORD;                             -- winspool.h:294
        end record;

    type ADDJOB_INFO_1W is                                  -- winspool.h:296
        record
            Path : Win32.LPWSTR;                            -- winspool.h:297
            JobId: Win32.DWORD;                             -- winspool.h:298
        end record;

    subtype ADDJOB_INFO_1 is ADDJOB_INFO_1A;                -- winspool.h:305
                                                           
    type DRIVER_INFO_1A is                                  -- winspool.h:310
        record
            pName: Win32.LPSTR;                             -- winspool.h:311
        end record;

    type DRIVER_INFO_1W is                                  -- winspool.h:313
        record
            pName: Win32.LPWSTR;                            -- winspool.h:314
        end record;

    subtype DRIVER_INFO_1 is DRIVER_INFO_1A;                -- winspool.h:321
                                                           
    type DRIVER_INFO_2A is                                  -- winspool.h:326
        record
            cVersion    : Win32.DWORD;                      -- winspool.h:327
            pName       : Win32.LPSTR;                      -- winspool.h:328
            pEnvironment: Win32.LPSTR;                      -- winspool.h:329
            pDriverPath : Win32.LPSTR;                      -- winspool.h:330
            pDataFile   : Win32.LPSTR;                      -- winspool.h:331
            pConfigFile : Win32.LPSTR;                      -- winspool.h:332
        end record;

    type DRIVER_INFO_2W is                                  -- winspool.h:334
        record
            cVersion    : Win32.DWORD;                      -- winspool.h:335
            pName       : Win32.LPWSTR;                     -- winspool.h:336
            pEnvironment: Win32.LPWSTR;                     -- winspool.h:337
            pDriverPath : Win32.LPWSTR;                     -- winspool.h:338
            pDataFile   : Win32.LPWSTR;                     -- winspool.h:339
            pConfigFile : Win32.LPWSTR;                     -- winspool.h:340
        end record;

    subtype DRIVER_INFO_2 is DRIVER_INFO_2A;                -- winspool.h:347
                                                           
    type DOC_INFO_1A is                                     -- winspool.h:353
        record
            pDocName   : Win32.LPSTR;                       -- winspool.h:354
            pOutputFile: Win32.LPSTR;                       -- winspool.h:355
            pDatatype  : Win32.LPSTR;                       -- winspool.h:356
        end record;

    type DOC_INFO_1W is                                     -- winspool.h:358
        record
            pDocName   : Win32.LPWSTR;                      -- winspool.h:359
            pOutputFile: Win32.LPWSTR;                      -- winspool.h:360
            pDatatype  : Win32.LPWSTR;                      -- winspool.h:361
        end record;

    subtype DOC_INFO_1 is DOC_INFO_1A;                      -- winspool.h:368
                                                           
    type FORM_INFO_1A is                                    -- winspool.h:373
        record
            Flags        : Win32.DWORD;                     -- winspool.h:374
            pName        : Win32.LPSTR;                     -- winspool.h:375
            Size         : Win32.Windef.SIZEL;              -- winspool.h:376
            ImageableArea: Win32.Windef.RECTL;              -- winspool.h:377
        end record;

    type FORM_INFO_1W is                                    -- winspool.h:379
        record
            Flags        : Win32.DWORD;                     -- winspool.h:380
            pName        : Win32.LPWSTR;                    -- winspool.h:381
            Size         : Win32.Windef.SIZEL;              -- winspool.h:382
            ImageableArea: Win32.Windef.RECTL;              -- winspool.h:383
        end record;

    subtype FORM_INFO_1 is FORM_INFO_1A;                    -- winspool.h:390
                                                           
    type PRINTPROCESSOR_INFO_1A is                          -- winspool.h:399
        record
            pName: Win32.LPSTR;                             -- winspool.h:400
        end record;

    type PRINTPROCESSOR_INFO_1W is                          -- winspool.h:402
        record
            pName: Win32.LPWSTR;                            -- winspool.h:403
        end record;

    subtype PRINTPROCESSOR_INFO_1 is PRINTPROCESSOR_INFO_1A;-- winspool.h:410

    type PORT_INFO_1A is                                    -- winspool.h:415
        record
            pName: Win32.LPSTR;                             -- winspool.h:416
        end record;

    type PORT_INFO_1W is                                    -- winspool.h:418
        record
            pName: Win32.LPWSTR;                            -- winspool.h:419
        end record;

    subtype PORT_INFO_1 is PORT_INFO_1A;                    -- winspool.h:426

    type MONITOR_INFO_1A is                                 -- winspool.h:432
        record
            pName: Win32.LPSTR;                             -- winspool.h:433
        end record;

    type MONITOR_INFO_1W is                                 -- winspool.h:435
        record
            pName: Win32.LPWSTR;                            -- winspool.h:436
        end record;

    subtype MONITOR_INFO_1 is MONITOR_INFO_1A;              -- winspool.h:443
                                                           
    type MONITOR_INFO_2A is                                 -- winspool.h:448
        record
            pName       : Win32.LPSTR;                      -- winspool.h:449
            pEnvironment: Win32.LPSTR;                      -- winspool.h:450
            pDLLName    : Win32.LPSTR;                      -- winspool.h:451
        end record;

    type MONITOR_INFO_2W is                                 -- winspool.h:453
        record
            pName       : Win32.LPWSTR;                     -- winspool.h:454
            pEnvironment: Win32.LPWSTR;                     -- winspool.h:455
            pDLLName    : Win32.LPWSTR;                     -- winspool.h:456
        end record;

    subtype MONITOR_INFO_2 is MONITOR_INFO_2A;              -- winspool.h:463
                                                           
    type DATATYPES_INFO_1A is                               -- winspool.h:468
        record
            pName: Win32.LPSTR;                             -- winspool.h:469
        end record;

    type DATATYPES_INFO_1W is                               -- winspool.h:471
        record
            pName: Win32.LPWSTR;                            -- winspool.h:472
        end record;

    subtype DATATYPES_INFO_1 is DATATYPES_INFO_1A;          -- winspool.h:479
                                                           
    type PRINTER_DEFAULTSA is                               -- winspool.h:484
        record
            pDatatype    : Win32.LPSTR;                     -- winspool.h:485
            pDevMode     : Win32.Wingdi.LPDEVMODEA;         -- winspool.h:486
            DesiredAccess: Win32.Winnt.ACCESS_MASK;         -- winspool.h:487
        end record;

    type PRINTER_DEFAULTSW is                               -- winspool.h:489
        record
            pDatatype    : Win32.LPWSTR;                    -- winspool.h:490
            pDevMode     : Win32.Wingdi.LPDEVMODEW;         -- winspool.h:491
            DesiredAccess: Win32.Winnt.ACCESS_MASK;         -- winspool.h:492
        end record;

    subtype PRINTER_DEFAULTS is PRINTER_DEFAULTSA;          -- winspool.h:499

    type PROVIDOR_INFO_1A is                                -- winspool.h:1628
        record
            pName       : Win32.LPSTR;                      -- winspool.h:1629
            pEnvironment: Win32.LPSTR;                      -- winspool.h:1630
            pDLLName    : Win32.LPSTR;                      -- winspool.h:1631
        end record;

    type PROVIDOR_INFO_1W is                                -- winspool.h:1633
        record
            pName       : Win32.LPWSTR;                     -- winspool.h:1634
            pEnvironment: Win32.LPWSTR;                     -- winspool.h:1635
            pDLLName    : Win32.LPWSTR;                     -- winspool.h:1636
        end record;

    subtype PROVIDOR_INFO_1 is PROVIDOR_INFO_1A;            -- winspool.h:1643

    function EnumPrintersA(
                Flags       : Win32.DWORD;
                Name        : Win32.LPSTR;
                Level       : Win32.DWORD;
                pPrinterEnum: Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD;
                pcReturned  : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:506

    function EnumPrinters(
                Flags       : Win32.DWORD;
                Name        : Win32.LPSTR;
                Level       : Win32.DWORD;
                pPrinterEnum: Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD;
                pcReturned  : Win32.LPDWORD)
               return Win32.BOOL
               renames EnumPrintersA;                       -- winspool.h:506

    function EnumPrintersW(
                Flags       : Win32.DWORD;
                Name        : Win32.LPWSTR;
                Level       : Win32.DWORD;
                pPrinterEnum: Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD;
                pcReturned  : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:517

    function OpenPrinterA(
                pPrinterName: Win32.LPSTR;
                phPrinter   : Win32.Windef.LPHANDLE;
                pDefault    : LPPRINTER_DEFAULTSA)
               return Win32.BOOL;                           -- winspool.h:556

    function OpenPrinter(
                pPrinterName: Win32.LPSTR;
                phPrinter   : Win32.Windef.LPHANDLE;
                pDefault    : LPPRINTER_DEFAULTSA)
               return Win32.BOOL
               renames OpenPrinterA;                        -- winspool.h:556

    function OpenPrinterW(
                pPrinterName: Win32.LPWSTR;
                phPrinter   : Win32.Windef.LPHANDLE;
                pDefault    : LPPRINTER_DEFAULTSW)
               return Win32.BOOL;                           -- winspool.h:563

    function ResetPrinterA(
                hPrinter: Win32.Winnt.HANDLE;
                pDefault: LPPRINTER_DEFAULTSA)
               return Win32.BOOL;                           -- winspool.h:576

    function ResetPrinter(
                hPrinter: Win32.Winnt.HANDLE;
                pDefault: LPPRINTER_DEFAULTSA)
               return Win32.BOOL
               renames ResetPrinterA;                       -- winspool.h:576

    function ResetPrinterW(
                hPrinter: Win32.Winnt.HANDLE;
                pDefault: LPPRINTER_DEFAULTSW)
               return Win32.BOOL;                           -- winspool.h:582

    function SetJobA(
                hPrinter: Win32.Winnt.HANDLE;
                JobId   : Win32.DWORD;
                Level   : Win32.DWORD;
                pJob    : Win32.LPBYTE;
                Command : Win32.DWORD)
               return Win32.BOOL;                           -- winspool.h:594

    function SetJob(
                hPrinter: Win32.Winnt.HANDLE;
                JobId   : Win32.DWORD;
                Level   : Win32.DWORD;
                pJob    : Win32.LPBYTE;
                Command : Win32.DWORD)
               return Win32.BOOL
               renames SetJobA;                             -- winspool.h:594

    function SetJobW(
                hPrinter: Win32.Winnt.HANDLE;
                JobId   : Win32.DWORD;
                Level   : Win32.DWORD;
                pJob    : Win32.LPBYTE;
                Command : Win32.DWORD)
               return Win32.BOOL;                           -- winspool.h:603

    function GetJobA(
                hPrinter : Win32.Winnt.HANDLE;
                JobId    : Win32.DWORD;
                Level    : Win32.DWORD;
                pJob     : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:618

    function GetJob(
                hPrinter : Win32.Winnt.HANDLE;
                JobId    : Win32.DWORD;
                Level    : Win32.DWORD;
                pJob     : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL
               renames GetJobA;                             -- winspool.h:618

    function GetJobW(
                hPrinter : Win32.Winnt.HANDLE;
                JobId    : Win32.DWORD;
                Level    : Win32.DWORD;
                pJob     : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:628

    function EnumJobsA(
                hPrinter  : Win32.Winnt.HANDLE;
                FirstJob  : Win32.DWORD;
                NoJobs    : Win32.DWORD;
                Level     : Win32.DWORD;
                pJob      : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:644

    function EnumJobs(
                hPrinter  : Win32.Winnt.HANDLE;
                FirstJob  : Win32.DWORD;
                NoJobs    : Win32.DWORD;
                Level     : Win32.DWORD;
                pJob      : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL
               renames EnumJobsA;                           -- winspool.h:644

    function EnumJobsW(
                hPrinter  : Win32.Winnt.HANDLE;
                FirstJob  : Win32.DWORD;
                NoJobs    : Win32.DWORD;
                Level     : Win32.DWORD;
                pJob      : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:656

    function AddPrinterA(
                pName   : Win32.LPSTR;
                Level   : Win32.DWORD;
                pPrinter: Win32.LPBYTE)
               return Win32.Winnt.HANDLE;                   -- winspool.h:674

    function AddPrinter(
                pName   : Win32.LPSTR;
                Level   : Win32.DWORD;
                pPrinter: Win32.LPBYTE)
               return Win32.Winnt.HANDLE
               renames AddPrinterA;                         -- winspool.h:674

    function AddPrinterW(
                pName   : Win32.LPWSTR;
                Level   : Win32.DWORD;
                pPrinter: Win32.LPBYTE)
               return Win32.Winnt.HANDLE;                   -- winspool.h:681

    function DeletePrinter(
                hPrinter: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:694

    function SetPrinterA(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pPrinter: Win32.LPBYTE;
                Command : Win32.DWORD)
               return Win32.BOOL;                           -- winspool.h:700

    function SetPrinter(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pPrinter: Win32.LPBYTE;
                Command : Win32.DWORD)
               return Win32.BOOL
               renames SetPrinterA;                         -- winspool.h:700

    function SetPrinterW(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pPrinter: Win32.LPBYTE;
                Command : Win32.DWORD)
               return Win32.BOOL;                           -- winspool.h:708

    function GetPrinterA(
                hPrinter : Win32.Winnt.HANDLE;
                Level    : Win32.DWORD;
                pPrinter : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:722

    function GetPrinter(
                hPrinter : Win32.Winnt.HANDLE;
                Level    : Win32.DWORD;
                pPrinter : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL
               renames GetPrinterA;                         -- winspool.h:722

    function GetPrinterW(
                hPrinter : Win32.Winnt.HANDLE;
                Level    : Win32.DWORD;
                pPrinter : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:731

    function AddPrinterDriverA(
                pName      : Win32.LPSTR;
                Level      : Win32.DWORD;
                pDriverInfo: Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:746

    function AddPrinterDriver(
                pName      : Win32.LPSTR;
                Level      : Win32.DWORD;
                pDriverInfo: Win32.LPBYTE)
               return Win32.BOOL
               renames AddPrinterDriverA;                   -- winspool.h:746

    function AddPrinterDriverW(
                pName      : Win32.LPWSTR;
                Level      : Win32.DWORD;
                pDriverInfo: Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:753

    function EnumPrinterDriversA(
                pName       : Win32.LPSTR;
                pEnvironment: Win32.LPSTR;
                Level       : Win32.DWORD;
                pDriverInfo : Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD;
                pcReturned  : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:766

    function EnumPrinterDrivers(
                pName       : Win32.LPSTR;
                pEnvironment: Win32.LPSTR;
                Level       : Win32.DWORD;
                pDriverInfo : Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD;
                pcReturned  : Win32.LPDWORD)
               return Win32.BOOL
               renames EnumPrinterDriversA;                 -- winspool.h:766

    function EnumPrinterDriversW(
                pName       : Win32.LPWSTR;
                pEnvironment: Win32.LPWSTR;
                Level       : Win32.DWORD;
                pDriverInfo : Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD;
                pcReturned  : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:777

    function GetPrinterDriverA(
                hPrinter    : Win32.Winnt.HANDLE;
                pEnvironment: Win32.LPSTR;
                Level       : Win32.DWORD;
                pDriverInfo : Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:794

    function GetPrinterDriver(
                hPrinter    : Win32.Winnt.HANDLE;
                pEnvironment: Win32.LPSTR;
                Level       : Win32.DWORD;
                pDriverInfo : Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD)
               return Win32.BOOL
               renames GetPrinterDriverA;                   -- winspool.h:794

    function GetPrinterDriverW(
                hPrinter    : Win32.Winnt.HANDLE;
                pEnvironment: Win32.LPWSTR;
                Level       : Win32.DWORD;
                pDriverInfo : Win32.LPBYTE;
                cbBuf       : Win32.DWORD;
                pcbNeeded   : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:804

    function GetPrinterDriverDirectoryA(
                pName           : Win32.LPSTR;
                pEnvironment    : Win32.LPSTR;
                Level           : Win32.DWORD;
                pDriverDirectory: Win32.LPBYTE;
                cbBuf           : Win32.DWORD;
                pcbNeeded       : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:820

    function GetPrinterDriverDirectory(
                pName           : Win32.LPSTR;
                pEnvironment    : Win32.LPSTR;
                Level           : Win32.DWORD;
                pDriverDirectory: Win32.LPBYTE;
                cbBuf           : Win32.DWORD;
                pcbNeeded       : Win32.LPDWORD)
               return Win32.BOOL
               renames GetPrinterDriverDirectoryA;          -- winspool.h:820

    function GetPrinterDriverDirectoryW(
                pName           : Win32.LPWSTR;
                pEnvironment    : Win32.LPWSTR;
                Level           : Win32.DWORD;
                pDriverDirectory: Win32.LPBYTE;
                cbBuf           : Win32.DWORD;
                pcbNeeded       : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:830

    function DeletePrinterDriverA(
                pName       : Win32.LPSTR;
                pEnvironment: Win32.LPSTR;
                pDriverName : Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:846

    function DeletePrinterDriver(
                pName       : Win32.LPSTR;
                pEnvironment: Win32.LPSTR;
                pDriverName : Win32.LPSTR)
               return Win32.BOOL
               renames DeletePrinterDriverA;                -- winspool.h:846

    function DeletePrinterDriverW(
                pName       : Win32.LPWSTR;
                pEnvironment: Win32.LPWSTR;
                pDriverName : Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:853

    function AddPrintProcessorA(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                pPathName          : Win32.LPSTR;
                pPrintProcessorName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:866

    function AddPrintProcessor(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                pPathName          : Win32.LPSTR;
                pPrintProcessorName: Win32.LPSTR)
               return Win32.BOOL
               renames AddPrintProcessorA;                  -- winspool.h:866

    function AddPrintProcessorW(
                pName              : Win32.LPWSTR;
                pEnvironment       : Win32.LPWSTR;
                pPathName          : Win32.LPWSTR;
                pPrintProcessorName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:874

    function EnumPrintProcessorsA(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                Level              : Win32.DWORD;
                pPrintProcessorInfo: Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD;
                pcReturned         : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:888

    function EnumPrintProcessors(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                Level              : Win32.DWORD;
                pPrintProcessorInfo: Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD;
                pcReturned         : Win32.LPDWORD)
               return Win32.BOOL
               renames EnumPrintProcessorsA;                -- winspool.h:888

    function EnumPrintProcessorsW(
                pName              : Win32.LPWSTR;
                pEnvironment       : Win32.LPWSTR;
                Level              : Win32.DWORD;
                pPrintProcessorInfo: Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD;
                pcReturned         : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:899

    function GetPrintProcessorDirectoryA(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                Level              : Win32.DWORD;
                pPrintProcessorInfo: Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:918

    function GetPrintProcessorDirectory(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                Level              : Win32.DWORD;
                pPrintProcessorInfo: Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD)
               return Win32.BOOL
               renames GetPrintProcessorDirectoryA;         -- winspool.h:918

    function GetPrintProcessorDirectoryW(
                pName              : Win32.LPWSTR;
                pEnvironment       : Win32.LPWSTR;
                Level              : Win32.DWORD;
                pPrintProcessorInfo: Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:928

    function EnumPrintProcessorDatatypesA(
                pName              : Win32.LPSTR;
                pPrintProcessorName: Win32.LPSTR;
                Level              : Win32.DWORD;
                pDatatypes         : Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD;
                pcReturned         : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:944

    function EnumPrintProcessorDatatypes(
                pName              : Win32.LPSTR;
                pPrintProcessorName: Win32.LPSTR;
                Level              : Win32.DWORD;
                pDatatypes         : Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD;
                pcReturned         : Win32.LPDWORD)
               return Win32.BOOL
               renames EnumPrintProcessorDatatypesA;        -- winspool.h:944

    function EnumPrintProcessorDatatypesW(
                pName              : Win32.LPWSTR;
                pPrintProcessorName: Win32.LPWSTR;
                Level              : Win32.DWORD;
                pDatatypes         : Win32.LPBYTE;
                cbBuf              : Win32.DWORD;
                pcbNeeded          : Win32.LPDWORD;
                pcReturned         : Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:955

    function DeletePrintProcessorA(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                pPrintProcessorName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:972

    function DeletePrintProcessor(
                pName              : Win32.LPSTR;
                pEnvironment       : Win32.LPSTR;
                pPrintProcessorName: Win32.LPSTR)
               return Win32.BOOL
               renames DeletePrintProcessorA;               -- winspool.h:972

    function DeletePrintProcessorW(
                pName              : Win32.LPWSTR;
                pEnvironment       : Win32.LPWSTR;
                pPrintProcessorName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:979

    function StartDocPrinterA(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pDocInfo: Win32.LPBYTE)
               return Win32.DWORD;                          -- winspool.h:992

    function StartDocPrinter(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pDocInfo: Win32.LPBYTE)
               return Win32.DWORD
               renames StartDocPrinterA;                    -- winspool.h:992

    function StartDocPrinterW(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pDocInfo: Win32.LPBYTE)
               return Win32.DWORD;                          -- winspool.h:999

    function StartPagePrinter(
                hPrinter: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:1012

    function WritePrinter(
                hPrinter : Win32.Winnt.HANDLE;
                pBuf     : Win32.LPVOID;
                cbBuf    : Win32.DWORD;
                pcWritten: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1018

    function EndPagePrinter(
                hPrinter: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:1027

    function AbortPrinter(
                hPrinter: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:1033

    function ReadPrinter(
                hPrinter    : Win32.Winnt.HANDLE;
                pBuf        : Win32.LPVOID;
                cbBuf       : Win32.DWORD;
                pNoBytesRead: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1039

    function EndDocPrinter(
                hPrinter: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:1048

    function AddJobA(
                hPrinter : Win32.Winnt.HANDLE;
                Level    : Win32.DWORD;
                pData    : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1054

    function AddJob(
                hPrinter : Win32.Winnt.HANDLE;
                Level    : Win32.DWORD;
                pData    : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL
               renames AddJobA;                             -- winspool.h:1054

    function AddJobW(
                hPrinter : Win32.Winnt.HANDLE;
                Level    : Win32.DWORD;
                pData    : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1063

    function ScheduleJob(
                hPrinter: Win32.Winnt.HANDLE;
                JobId   : Win32.DWORD)
               return Win32.BOOL;                           -- winspool.h:1078

    function PrinterProperties(
                hWnd    : Win32.Windef.HWND;
                hPrinter: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:1085

    function DocumentPropertiesA(
                hWnd          : Win32.Windef.HWND;
                hPrinter      : Win32.Winnt.HANDLE;
                pDeviceName   : Win32.LPSTR;
                pDevModeOutput: Win32.Wingdi.PDEVMODEA;
                pDevModeInput : Win32.Wingdi.PDEVMODEA;
                fMode         : Win32.DWORD)
               return Win32.LONG;                           -- winspool.h:1092

    function DocumentProperties(
                hWnd          : Win32.Windef.HWND;
                hPrinter      : Win32.Winnt.HANDLE;
                pDeviceName   : Win32.LPSTR;
                pDevModeOutput: Win32.Wingdi.PDEVMODEA;
                pDevModeInput : Win32.Wingdi.PDEVMODEA;
                fMode         : Win32.DWORD)
               return Win32.LONG
               renames DocumentPropertiesA;                 -- winspool.h:1092

    function DocumentPropertiesW(
                hWnd          : Win32.Windef.HWND;
                hPrinter      : Win32.Winnt.HANDLE;
                pDeviceName   : Win32.LPWSTR;
                pDevModeOutput: Win32.Wingdi.PDEVMODEW;
                pDevModeInput : Win32.Wingdi.PDEVMODEW;
                fMode         : Win32.DWORD)
               return Win32.LONG;                           -- winspool.h:1102

    function AdvancedDocumentPropertiesA(
                hWnd          : Win32.Windef.HWND;
                hPrinter      : Win32.Winnt.HANDLE;
                pDeviceName   : Win32.LPSTR;
                pDevModeOutput: Win32.Wingdi.PDEVMODEA;
                pDevModeInput : Win32.Wingdi.PDEVMODEA)
               return Win32.LONG;                           -- winspool.h:1118

    function AdvancedDocumentProperties(
                hWnd          : Win32.Windef.HWND;
                hPrinter      : Win32.Winnt.HANDLE;
                pDeviceName   : Win32.LPSTR;
                pDevModeOutput: Win32.Wingdi.PDEVMODEA;
                pDevModeInput : Win32.Wingdi.PDEVMODEA)
               return Win32.LONG
               renames AdvancedDocumentPropertiesA;         -- winspool.h:1118

    function AdvancedDocumentPropertiesW(
                hWnd          : Win32.Windef.HWND;
                hPrinter      : Win32.Winnt.HANDLE;
                pDeviceName   : Win32.LPWSTR;
                pDevModeOutput: Win32.Wingdi.PDEVMODEW;
                pDevModeInput : Win32.Wingdi.PDEVMODEW)
               return Win32.LONG;                           -- winspool.h:1127

    function GetPrinterDataA(
                hPrinter  : Win32.Winnt.HANDLE;
                pValueName: Win32.LPSTR;
                pType     : Win32.LPDWORD;
                pData     : Win32.LPBYTE;
                nSize     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD)
               return Win32.DWORD;                          -- winspool.h:1143

    function GetPrinterData(
                hPrinter  : Win32.Winnt.HANDLE;
                pValueName: Win32.LPSTR;
                pType     : Win32.LPDWORD;
                pData     : Win32.LPBYTE;
                nSize     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD)
               return Win32.DWORD
               renames GetPrinterDataA;                     -- winspool.h:1143

    function GetPrinterDataW(
                hPrinter  : Win32.Winnt.HANDLE;
                pValueName: Win32.LPWSTR;
                pType     : Win32.LPDWORD;
                pData     : Win32.LPBYTE;
                nSize     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD)
               return Win32.DWORD;                          -- winspool.h:1153

    function SetPrinterDataA(
                hPrinter  : Win32.Winnt.HANDLE;
                pValueName: Win32.LPSTR;
                c_Type    : Win32.DWORD;
                pData     : Win32.LPBYTE;
                cbData    : Win32.DWORD)
               return Win32.DWORD;                          -- winspool.h:1171

    function SetPrinterData(
                hPrinter  : Win32.Winnt.HANDLE;
                pValueName: Win32.LPSTR;
                c_Type    : Win32.DWORD;
                pData     : Win32.LPBYTE;
                cbData    : Win32.DWORD)
               return Win32.DWORD
               renames SetPrinterDataA;                     -- winspool.h:1171

    function SetPrinterDataW(
                hPrinter  : Win32.Winnt.HANDLE;
                pValueName: Win32.LPWSTR;
                c_Type    : Win32.DWORD;
                pData     : Win32.LPBYTE;
                cbData    : Win32.DWORD)
               return Win32.DWORD;                          -- winspool.h:1180

    function WaitForPrinterChange(
                hPrinter: Win32.Winnt.HANDLE;
                Flags   : Win32.DWORD)
               return Win32.DWORD;                          -- winspool.h:1197

    function FindFirstPrinterChangeNotification(
                hPrinter  : Win32.Winnt.HANDLE;
                fdwFlags  : Win32.DWORD;
                fdwOptions: Win32.DWORD;
                pvReserved: Win32.LPVOID)
               return Win32.Winnt.HANDLE;                   -- winspool.h:1204

    function FindNextPrinterChangeNotification(
                hChange   : Win32.Winnt.HANDLE;
                pdwChange : Win32.PDWORD;
                dwReserved: Win32.DWORD;
                pvReserved: Win32.LPVOID)
               return Win32.BOOL;                           -- winspool.h:1213

    function FindClosePrinterChangeNotification(
                hChange: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:1223

    function PrinterMessageBoxA(
                hPrinter: Win32.Winnt.HANDLE;
                Error   : Win32.DWORD;
                hWnd    : Win32.Windef.HWND;
                pText   : Win32.LPSTR;
                pCaption: Win32.LPSTR;
                dwType  : Win32.DWORD)
               return Win32.DWORD;                          -- winspool.h:1257

    function PrinterMessageBox(
                hPrinter: Win32.Winnt.HANDLE;
                Error   : Win32.DWORD;
                hWnd    : Win32.Windef.HWND;
                pText   : Win32.LPSTR;
                pCaption: Win32.LPSTR;
                dwType  : Win32.DWORD)
               return Win32.DWORD
               renames PrinterMessageBoxA;                  -- winspool.h:1257

    function PrinterMessageBoxW(
                hPrinter: Win32.Winnt.HANDLE;
                Error   : Win32.DWORD;
                hWnd    : Win32.Windef.HWND;
                pText   : Win32.LPWSTR;
                pCaption: Win32.LPWSTR;
                dwType  : Win32.DWORD)
               return Win32.DWORD;                          -- winspool.h:1267

    function ClosePrinter(
                hPrinter: Win32.Winnt.HANDLE)
               return Win32.BOOL;                           -- winspool.h:1293

    function AddFormA(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pForm   : Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1299

    function AddForm(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pForm   : Win32.LPBYTE)
               return Win32.BOOL
               renames AddFormA;                            -- winspool.h:1299

    function AddFormW(
                hPrinter: Win32.Winnt.HANDLE;
                Level   : Win32.DWORD;
                pForm   : Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1306

    function DeleteFormA(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1321

    function DeleteForm(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPSTR)
               return Win32.BOOL
               renames DeleteFormA;                         -- winspool.h:1321

    function DeleteFormW(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1327

    function GetFormA(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPSTR;
                Level    : Win32.DWORD;
                pForm    : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1341

    function GetForm(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPSTR;
                Level    : Win32.DWORD;
                pForm    : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL
               renames GetFormA;                            -- winspool.h:1341

    function GetFormW(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPWSTR;
                Level    : Win32.DWORD;
                pForm    : Win32.LPBYTE;
                cbBuf    : Win32.DWORD;
                pcbNeeded: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1351

    function SetFormA(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPSTR;
                Level    : Win32.DWORD;
                pForm    : Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1369

    function SetForm(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPSTR;
                Level    : Win32.DWORD;
                pForm    : Win32.LPBYTE)
               return Win32.BOOL
               renames SetFormA;                            -- winspool.h:1369

    function SetFormW(
                hPrinter : Win32.Winnt.HANDLE;
                pFormName: Win32.LPWSTR;
                Level    : Win32.DWORD;
                pForm    : Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1377

    function EnumFormsA(
                hPrinter  : Win32.Winnt.HANDLE;
                Level     : Win32.DWORD;
                pForm     : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1393

    function EnumForms(
                hPrinter  : Win32.Winnt.HANDLE;
                Level     : Win32.DWORD;
                pForm     : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL
               renames EnumFormsA;                          -- winspool.h:1393

    function EnumFormsW(
                hPrinter  : Win32.Winnt.HANDLE;
                Level     : Win32.DWORD;
                pForm     : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1403

    function EnumMonitorsA(
                pName     : Win32.LPSTR;
                Level     : Win32.DWORD;
                pMonitors : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1421

    function EnumMonitors(
                pName     : Win32.LPSTR;
                Level     : Win32.DWORD;
                pMonitors : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL
               renames EnumMonitorsA;                       -- winspool.h:1421

    function EnumMonitorsW(
                pName     : Win32.LPWSTR;
                Level     : Win32.DWORD;
                pMonitors : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1431

    function AddMonitorA(
                pName    : Win32.LPSTR;
                Level    : Win32.DWORD;
                pMonitors: Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1449

    function AddMonitor(
                pName    : Win32.LPSTR;
                Level    : Win32.DWORD;
                pMonitors: Win32.LPBYTE)
               return Win32.BOOL
               renames AddMonitorA;                         -- winspool.h:1449

    function AddMonitorW(
                pName    : Win32.LPWSTR;
                Level    : Win32.DWORD;
                pMonitors: Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1456

    function DeleteMonitorA(
                pName       : Win32.LPSTR;
                pEnvironment: Win32.LPSTR;
                pMonitorName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1471

    function DeleteMonitor(
                pName       : Win32.LPSTR;
                pEnvironment: Win32.LPSTR;
                pMonitorName: Win32.LPSTR)
               return Win32.BOOL
               renames DeleteMonitorA;                      -- winspool.h:1471

    function DeleteMonitorW(
                pName       : Win32.LPWSTR;
                pEnvironment: Win32.LPWSTR;
                pMonitorName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1478

    function EnumPortsA(
                pName     : Win32.LPSTR;
                Level     : Win32.DWORD;
                pPorts    : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1493

    function EnumPorts(
                pName     : Win32.LPSTR;
                Level     : Win32.DWORD;
                pPorts    : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL
               renames EnumPortsA;                          -- winspool.h:1493

    function EnumPortsW(
                pName     : Win32.LPWSTR;
                Level     : Win32.DWORD;
                pPorts    : Win32.LPBYTE;
                cbBuf     : Win32.DWORD;
                pcbNeeded : Win32.LPDWORD;
                pcReturned: Win32.LPDWORD)
               return Win32.BOOL;                           -- winspool.h:1503

    function AddPortA(
                pName       : Win32.LPSTR;
                hWnd        : Win32.Windef.HWND;
                pMonitorName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1521

    function AddPort(
                pName       : Win32.LPSTR;
                hWnd        : Win32.Windef.HWND;
                pMonitorName: Win32.LPSTR)
               return Win32.BOOL
               renames AddPortA;                            -- winspool.h:1521

    function AddPortW(
                pName       : Win32.LPWSTR;
                hWnd        : Win32.Windef.HWND;
                pMonitorName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1528

    function ConfigurePortA(
                pName    : Win32.LPSTR;
                hWnd     : Win32.Windef.HWND;
                pPortName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1543

    function ConfigurePort(
                pName    : Win32.LPSTR;
                hWnd     : Win32.Windef.HWND;
                pPortName: Win32.LPSTR)
               return Win32.BOOL
               renames ConfigurePortA;                      -- winspool.h:1543

    function ConfigurePortW(
                pName    : Win32.LPWSTR;
                hWnd     : Win32.Windef.HWND;
                pPortName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1550

    function DeletePortA(
                pName    : Win32.LPSTR;
                hWnd     : Win32.Windef.HWND;
                pPortName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1565

    function DeletePort(
                pName    : Win32.LPSTR;
                hWnd     : Win32.Windef.HWND;
                pPortName: Win32.LPSTR)
               return Win32.BOOL
               renames DeletePortA;                         -- winspool.h:1565

    function DeletePortW(
                pName    : Win32.LPWSTR;
                hWnd     : Win32.Windef.HWND;
                pPortName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1572

    function AddPrinterConnectionA(
                pName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1587

    function AddPrinterConnection(
                pName: Win32.LPSTR)
               return Win32.BOOL
               renames AddPrinterConnectionA;               -- winspool.h:1587

    function AddPrinterConnectionW(
                pName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1592

    function DeletePrinterConnectionA(
                pName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1605

    function DeletePrinterConnection(
                pName: Win32.LPSTR)
               return Win32.BOOL
               renames DeletePrinterConnectionA;            -- winspool.h:1605

    function DeletePrinterConnectionW(
                pName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1610

    function ConnectToPrinterDlg(
                hwnd : Win32.Windef.HWND;
                Flags: Win32.DWORD)
               return Win32.Winnt.HANDLE;                   -- winspool.h:1623

    function AddPrintProvidorA(
                pName        : Win32.LPSTR;
                level        : Win32.DWORD;
                pProvidorInfo: Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1652

    function AddPrintProvidor(
                pName        : Win32.LPSTR;
                level        : Win32.DWORD;
                pProvidorInfo: Win32.LPBYTE)
               return Win32.BOOL
               renames AddPrintProvidorA;                   -- winspool.h:1652

    function AddPrintProvidorW(
                pName        : Win32.LPWSTR;
                level        : Win32.DWORD;
                pProvidorInfo: Win32.LPBYTE)
               return Win32.BOOL;                           -- winspool.h:1659

    function DeletePrintProvidorA(
                pName             : Win32.LPSTR;
                pEnvironment      : Win32.LPSTR;
                pPrintProvidorName: Win32.LPSTR)
               return Win32.BOOL;                           -- winspool.h:1672

    function DeletePrintProvidor(
                pName             : Win32.LPSTR;
                pEnvironment      : Win32.LPSTR;
                pPrintProvidorName: Win32.LPSTR)
               return Win32.BOOL
               renames DeletePrintProvidorA;                -- winspool.h:1672

    function DeletePrintProvidorW(
                pName             : Win32.LPWSTR;
                pEnvironment      : Win32.LPWSTR;
                pPrintProvidorName: Win32.LPWSTR)
               return Win32.BOOL;                           -- winspool.h:1679

private

    pragma Convention(C_Pass_By_Copy, PRINTER_INFO_1A);                  -- winspool.h:25
    pragma Convention(C_Pass_By_Copy, PRINTER_INFO_1W);                  -- winspool.h:31
    pragma Convention(C, PRINTER_INFO_2A);                  -- winspool.h:47
    pragma Convention(C, PRINTER_INFO_2W);                  -- winspool.h:70
    pragma Convention(C_Pass_By_Copy, PRINTER_INFO_3);                   -- winspool.h:103
    pragma Convention(C_Pass_By_Copy, PRINTER_INFO_4A);                  -- winspool.h:107
    pragma Convention(C_Pass_By_Copy, PRINTER_INFO_4W);                  -- winspool.h:112
    pragma Convention(C, JOB_INFO_1A);                      -- winspool.h:176
    pragma Convention(C, JOB_INFO_1W);                      -- winspool.h:191
    pragma Convention(C, JOB_INFO_2A);                      -- winspool.h:216
    pragma Convention(C, JOB_INFO_2W);                      -- winspool.h:241
    pragma Convention(C_Pass_By_Copy, ADDJOB_INFO_1A);                   -- winspool.h:292
    pragma Convention(C_Pass_By_Copy, ADDJOB_INFO_1W);                   -- winspool.h:296
    pragma Convention(C_Pass_By_Copy, DRIVER_INFO_1A);                   -- winspool.h:310
    pragma Convention(C_Pass_By_Copy, DRIVER_INFO_1W);                   -- winspool.h:313
    pragma Convention(C, DRIVER_INFO_2A);                   -- winspool.h:326
    pragma Convention(C, DRIVER_INFO_2W);                   -- winspool.h:334
    pragma Convention(C_Pass_By_Copy, DOC_INFO_1A);                      -- winspool.h:353
    pragma Convention(C_Pass_By_Copy, DOC_INFO_1W);                      -- winspool.h:358
    pragma Convention(C, FORM_INFO_1A);                     -- winspool.h:373
    pragma Convention(C, FORM_INFO_1W);                     -- winspool.h:379
    pragma Convention(C_Pass_By_Copy, PRINTPROCESSOR_INFO_1A);           -- winspool.h:399
    pragma Convention(C_Pass_By_Copy, PRINTPROCESSOR_INFO_1W);           -- winspool.h:402
    pragma Convention(C_Pass_By_Copy, PORT_INFO_1A);                     -- winspool.h:415
    pragma Convention(C_Pass_By_Copy, PORT_INFO_1W);                     -- winspool.h:418
    pragma Convention(C_Pass_By_Copy, MONITOR_INFO_1A);                  -- winspool.h:432
    pragma Convention(C_Pass_By_Copy, MONITOR_INFO_1W);                  -- winspool.h:435
    pragma Convention(C_Pass_By_Copy, MONITOR_INFO_2A);                  -- winspool.h:448
    pragma Convention(C_Pass_By_Copy, MONITOR_INFO_2W);                  -- winspool.h:453
    pragma Convention(C_Pass_By_Copy, DATATYPES_INFO_1A);                -- winspool.h:468
    pragma Convention(C_Pass_By_Copy, DATATYPES_INFO_1W);                -- winspool.h:471
    pragma Convention(C_Pass_By_Copy, PRINTER_DEFAULTSA);                -- winspool.h:484
    pragma Convention(C_Pass_By_Copy, PRINTER_DEFAULTSW);                -- winspool.h:489
    pragma Convention(C_Pass_By_Copy, PROVIDOR_INFO_1A);                 -- winspool.h:1628
    pragma Convention(C_Pass_By_Copy, PROVIDOR_INFO_1W);                 -- winspool.h:1633

    pragma Import(Stdcall, EnumPrintersA, "EnumPrintersA");       -- winspool.h:506
    pragma Import(Stdcall, EnumPrintersW, "EnumPrintersW");       -- winspool.h:517
    pragma Import(Stdcall, OpenPrinterA, "OpenPrinterA");         -- winspool.h:556
    pragma Import(Stdcall, OpenPrinterW, "OpenPrinterW");         -- winspool.h:563
    pragma Import(Stdcall, ResetPrinterA, "ResetPrinterA");       -- winspool.h:576
    pragma Import(Stdcall, ResetPrinterW, "ResetPrinterW");       -- winspool.h:582
    pragma Import(Stdcall, SetJobA, "SetJobA");                   -- winspool.h:594
    pragma Import(Stdcall, SetJobW, "SetJobW");                   -- winspool.h:603
    pragma Import(Stdcall, GetJobA, "GetJobA");                   -- winspool.h:618
    pragma Import(Stdcall, GetJobW, "GetJobW");                   -- winspool.h:628
    pragma Import(Stdcall, EnumJobsA, "EnumJobsA");               -- winspool.h:644
    pragma Import(Stdcall, EnumJobsW, "EnumJobsW");               -- winspool.h:656
    pragma Import(Stdcall, AddPrinterA, "AddPrinterA");           -- winspool.h:674
    pragma Import(Stdcall, AddPrinterW, "AddPrinterW");           -- winspool.h:681
    pragma Import(Stdcall, DeletePrinter, "DeletePrinter");       -- winspool.h:694
    pragma Import(Stdcall, SetPrinterA, "SetPrinterA");           -- winspool.h:700
    pragma Import(Stdcall, SetPrinterW, "SetPrinterW");           -- winspool.h:708
    pragma Import(Stdcall, GetPrinterA, "GetPrinterA");           -- winspool.h:722
    pragma Import(Stdcall, GetPrinterW, "GetPrinterW");           -- winspool.h:731
    pragma Import(Stdcall, AddPrinterDriverA, "AddPrinterDriverA");
                                                            -- winspool.h:746
    pragma Import(Stdcall, AddPrinterDriverW, "AddPrinterDriverW");
                                                            -- winspool.h:753
    pragma Import(Stdcall, EnumPrinterDriversA, "EnumPrinterDriversA");
                                                            -- winspool.h:766
    pragma Import(Stdcall, EnumPrinterDriversW, "EnumPrinterDriversW");
                                                            -- winspool.h:777
    pragma Import(Stdcall, GetPrinterDriverA, "GetPrinterDriverA");
                                                            -- winspool.h:794
    pragma Import(Stdcall, GetPrinterDriverW, "GetPrinterDriverW");
                                                            -- winspool.h:804
    pragma Import(Stdcall, GetPrinterDriverDirectoryA, "GetPrinterDriverDirectoryA");
                                                            -- winspool.h:820
    pragma Import(Stdcall, GetPrinterDriverDirectoryW, "GetPrinterDriverDirectoryW");
                                                            -- winspool.h:830
    pragma Import(Stdcall, DeletePrinterDriverA, "DeletePrinterDriverA");
                                                            -- winspool.h:846
    pragma Import(Stdcall, DeletePrinterDriverW, "DeletePrinterDriverW");
                                                            -- winspool.h:853
    pragma Import(Stdcall, AddPrintProcessorA, "AddPrintProcessorA");
                                                            -- winspool.h:866
    pragma Import(Stdcall, AddPrintProcessorW, "AddPrintProcessorW");
                                                            -- winspool.h:874
    pragma Import(Stdcall, EnumPrintProcessorsA, "EnumPrintProcessorsA");
                                                            -- winspool.h:888
    pragma Import(Stdcall, EnumPrintProcessorsW, "EnumPrintProcessorsW");
                                                            -- winspool.h:899
    pragma Import(Stdcall, GetPrintProcessorDirectoryA, 
                     "GetPrintProcessorDirectoryA");        -- winspool.h:918
    pragma Import(Stdcall, GetPrintProcessorDirectoryW,
                     "GetPrintProcessorDirectoryW");        -- winspool.h:928
    pragma Import(Stdcall, EnumPrintProcessorDatatypesA,
                     "EnumPrintProcessorDatatypesA");       -- winspool.h:944
    pragma Import(Stdcall, EnumPrintProcessorDatatypesW,
                     "EnumPrintProcessorDatatypesW");       -- winspool.h:955
    pragma Import(Stdcall, DeletePrintProcessorA, "DeletePrintProcessorA");
                                                            -- winspool.h:972
    pragma Import(Stdcall, DeletePrintProcessorW, "DeletePrintProcessorW");
                                                            -- winspool.h:979
    pragma Import(Stdcall, StartDocPrinterA, "StartDocPrinterA"); -- winspool.h:992
    pragma Import(Stdcall, StartDocPrinterW, "StartDocPrinterW"); -- winspool.h:999
    pragma Import(Stdcall, StartPagePrinter, "StartPagePrinter"); -- winspool.h:1012
    pragma Import(Stdcall, WritePrinter, "WritePrinter");         -- winspool.h:1018
    pragma Import(Stdcall, EndPagePrinter, "EndPagePrinter");     -- winspool.h:1027
    pragma Import(Stdcall, AbortPrinter, "AbortPrinter");         -- winspool.h:1033
    pragma Import(Stdcall, ReadPrinter, "ReadPrinter");           -- winspool.h:1039
    pragma Import(Stdcall, EndDocPrinter, "EndDocPrinter");       -- winspool.h:1048
    pragma Import(Stdcall, AddJobA, "AddJobA");                   -- winspool.h:1054
    pragma Import(Stdcall, AddJobW, "AddJobW");                   -- winspool.h:1063
    pragma Import(Stdcall, ScheduleJob, "ScheduleJob");           -- winspool.h:1078
    pragma Import(Stdcall, PrinterProperties, "PrinterProperties");
                                                            -- winspool.h:1085
    pragma Import(Stdcall, DocumentPropertiesA, "DocumentPropertiesA");
                                                            -- winspool.h:1092
    pragma Import(Stdcall, DocumentPropertiesW, "DocumentPropertiesW");
                                                            -- winspool.h:1102
    pragma Import(Stdcall, AdvancedDocumentPropertiesA,
                     "AdvancedDocumentPropertiesA");        -- winspool.h:1118
    pragma Import(Stdcall, AdvancedDocumentPropertiesW,
                     "AdvancedDocumentPropertiesW");        -- winspool.h:1127
    pragma Import(Stdcall, GetPrinterDataA, "GetPrinterDataA");   -- winspool.h:1143
    pragma Import(Stdcall, GetPrinterDataW, "GetPrinterDataW");   -- winspool.h:1153
    pragma Import(Stdcall, SetPrinterDataA, "SetPrinterDataA");   -- winspool.h:1171
    pragma Import(Stdcall, SetPrinterDataW, "SetPrinterDataW");   -- winspool.h:1180
    pragma Import(Stdcall, WaitForPrinterChange, "WaitForPrinterChange");
                                                            -- winspool.h:1197
    pragma Import(Stdcall, FindFirstPrinterChangeNotification,
                     "FindFirstPrinterChangeNotification"); -- winspool.h:1204
    pragma Import(Stdcall, FindNextPrinterChangeNotification,
                     "FindNextPrinterChangeNotification");  -- winspool.h:1213
    pragma Import(Stdcall, FindClosePrinterChangeNotification,
                     "FindClosePrinterChangeNotification"); -- winspool.h:1223
    pragma Import(Stdcall, PrinterMessageBoxA, "PrinterMessageBoxA"); 
                                                            -- winspool.h:1257
    pragma Import(Stdcall, PrinterMessageBoxW, "PrinterMessageBoxW"); 
                                                            -- winspool.h:1267
    pragma Import(Stdcall, ClosePrinter, "ClosePrinter");         -- winspool.h:1293
    pragma Import(Stdcall, AddFormA, "AddFormA");                 -- winspool.h:1299
    pragma Import(Stdcall, AddFormW, "AddFormW");                 -- winspool.h:1306
    pragma Import(Stdcall, DeleteFormA, "DeleteFormA");           -- winspool.h:1321
    pragma Import(Stdcall, DeleteFormW, "DeleteFormW");           -- winspool.h:1327
    pragma Import(Stdcall, GetFormA, "GetFormA");                 -- winspool.h:1341
    pragma Import(Stdcall, GetFormW, "GetFormW");                 -- winspool.h:1351
    pragma Import(Stdcall, SetFormA, "SetFormA");                 -- winspool.h:1369
    pragma Import(Stdcall, SetFormW, "SetFormW");                 -- winspool.h:1377
    pragma Import(Stdcall, EnumFormsA, "EnumFormsA");             -- winspool.h:1393
    pragma Import(Stdcall, EnumFormsW, "EnumFormsW");             -- winspool.h:1403
    pragma Import(Stdcall, EnumMonitorsA, "EnumMonitorsA");       -- winspool.h:1421
    pragma Import(Stdcall, EnumMonitorsW, "EnumMonitorsW");       -- winspool.h:1431
    pragma Import(Stdcall, AddMonitorA, "AddMonitorA");           -- winspool.h:1449
    pragma Import(Stdcall, AddMonitorW, "AddMonitorW");           -- winspool.h:1456
    pragma Import(Stdcall, DeleteMonitorA, "DeleteMonitorA");     -- winspool.h:1471
    pragma Import(Stdcall, DeleteMonitorW, "DeleteMonitorW");     -- winspool.h:1478
    pragma Import(Stdcall, EnumPortsA, "EnumPortsA");             -- winspool.h:1493
    pragma Import(Stdcall, EnumPortsW, "EnumPortsW");             -- winspool.h:1503
    pragma Import(Stdcall, AddPortA, "AddPortA");                 -- winspool.h:1521
    pragma Import(Stdcall, AddPortW, "AddPortW");                 -- winspool.h:1528
    pragma Import(Stdcall, ConfigurePortA, "ConfigurePortA");     -- winspool.h:1543
    pragma Import(Stdcall, ConfigurePortW, "ConfigurePortW");     -- winspool.h:1550
    pragma Import(Stdcall, DeletePortA, "DeletePortA");           -- winspool.h:1565
    pragma Import(Stdcall, DeletePortW, "DeletePortW");           -- winspool.h:1572
    pragma Import(Stdcall, AddPrinterConnectionA, "AddPrinterConnectionA");
                                                            -- winspool.h:1587
    pragma Import(Stdcall, AddPrinterConnectionW, "AddPrinterConnectionW");
                                                            -- winspool.h:1592
    pragma Import(Stdcall, DeletePrinterConnectionA, "DeletePrinterConnectionA");
                                                            -- winspool.h:1605
    pragma Import(Stdcall, DeletePrinterConnectionW, "DeletePrinterConnectionW");
                                                            -- winspool.h:1610
    pragma Import(Stdcall, ConnectToPrinterDlg, "ConnectToPrinterDlg");
                                                            -- winspool.h:1623
    pragma Import(Stdcall, AddPrintProvidorA, "AddPrintProvidorA");
                                                            -- winspool.h:1652
    pragma Import(Stdcall, AddPrintProvidorW, "AddPrintProvidorW");
                                                            -- winspool.h:1659
    pragma Import(Stdcall, DeletePrintProvidorA, "DeletePrintProvidorA");
                                                            -- winspool.h:1672
    pragma Import(Stdcall, DeletePrintProvidorW, "DeletePrintProvidorW");
                                                            -- winspool.h:1679

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

end Win32.Winspool;
