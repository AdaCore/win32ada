-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winbase;
with Win32.Winnt;

package Win32.Winperf is

    PERF_DATA_VERSION            : constant := 1;           -- winperf.h:48
    PERF_DATA_REVISION           : constant := 1;           -- winperf.h:49
    PERF_NO_INSTANCES            : constant := -1;          -- winperf.h:153
    PERF_SIZE_DWORD              : constant := 16#0#;       -- winperf.h:174
    PERF_SIZE_LARGE              : constant := 16#100#;     -- winperf.h:175
    PERF_SIZE_ZERO               : constant := 16#200#;     -- winperf.h:176
    PERF_SIZE_VARIABLE_LEN       : constant := 16#300#;     -- winperf.h:177
    PERF_TYPE_NUMBER             : constant := 16#0#;       -- winperf.h:182
    PERF_TYPE_COUNTER            : constant := 16#400#;     -- winperf.h:183
    PERF_TYPE_TEXT               : constant := 16#800#;     -- winperf.h:184
    PERF_TYPE_ZERO               : constant := 16#c00#;     -- winperf.h:185
    PERF_NUMBER_HEX              : constant := 16#0#;       -- winperf.h:190
    PERF_NUMBER_DECIMAL          : constant := 16#10000#;   -- winperf.h:191
    PERF_NUMBER_DEC_1000         : constant := 16#20000#;   -- winperf.h:192
    PERF_COUNTER_VALUE           : constant := 16#0#;       -- winperf.h:197
    PERF_COUNTER_RATE            : constant := 16#10000#;   -- winperf.h:198
    PERF_COUNTER_FRACTION        : constant := 16#20000#;   -- winperf.h:199
    PERF_COUNTER_BASE            : constant := 16#30000#;   -- winperf.h:200
    PERF_COUNTER_ELAPSED         : constant := 16#40000#;   -- winperf.h:201
    PERF_COUNTER_QUEUELEN        : constant := 16#50000#;   -- winperf.h:202
    PERF_COUNTER_HISTOGRAM       : constant := 16#60000#;   -- winperf.h:203
    PERF_TEXT_UNICODE            : constant := 16#0#;       -- winperf.h:208
    PERF_TEXT_ASCII              : constant := 16#10000#;   -- winperf.h:209
    PERF_TIMER_TICK              : constant := 16#0#;       -- winperf.h:213
    PERF_TIMER_100NS             : constant := 16#100000#;  -- winperf.h:214
    PERF_OBJECT_TIMER            : constant := 16#200000#;  -- winperf.h:215
    PERF_DELTA_COUNTER           : constant := 16#400000#;  -- winperf.h:220
    PERF_DELTA_BASE              : constant := 16#800000#;  -- winperf.h:221
    PERF_INVERSE_COUNTER         : constant := 16#1000000#; -- winperf.h:222
    PERF_MULTI_COUNTER           : constant := 16#2000000#; -- winperf.h:223
    PERF_DISPLAY_NO_SUFFIX       : constant := 16#0#;       -- winperf.h:227
    PERF_DISPLAY_PER_SEC         : constant := 16#10000000#;-- winperf.h:228
    PERF_DISPLAY_PERCENT         : constant := 16#20000000#;-- winperf.h:229
    PERF_DISPLAY_SECONDS         : constant := 16#30000000#;-- winperf.h:230
    PERF_DISPLAY_NOSHOW          : constant := 16#40000000#;-- winperf.h:231
    PERF_COUNTER_COUNTER         : constant := 16#10410400#;-- winperf.h:237
    PERF_COUNTER_TIMER           : constant := 16#20410500#;-- winperf.h:243
    PERF_COUNTER_QUEUELEN_TYPE   : constant := 16#450400#;  -- winperf.h:248
    PERF_COUNTER_BULK_COUNT      : constant := 16#10410500#;-- winperf.h:253
    PERF_COUNTER_TEXT            : constant := 16#b00#;     -- winperf.h:258
    PERF_COUNTER_RAWCOUNT        : constant := 16#10000#;   -- winperf.h:265
    PERF_COUNTER_LARGE_RAWCOUNT  : constant := 16#10100#;   -- winperf.h:270
    PERF_COUNTER_RAWCOUNT_HEX    : constant := 16#0#;       -- winperf.h:278
    PERF_COUNTER_LARGE_RAWCOUNT_HEX: constant := 16#100#;   -- winperf.h:283
    PERF_SAMPLE_FRACTION         : constant := 16#20c20400#;-- winperf.h:290
    PERF_SAMPLE_COUNTER          : constant := 16#410400#;  -- winperf.h:296
    PERF_COUNTER_NODATA          : constant := 16#40000200#;-- winperf.h:302
    PERF_COUNTER_TIMER_INV       : constant := 16#21410500#;-- winperf.h:307
    PERF_SAMPLE_BASE             : constant := 16#40030401#;-- winperf.h:316
    PERF_AVERAGE_TIMER           : constant := 16#30020400#;-- winperf.h:325
    PERF_AVERAGE_BASE            : constant := 16#40030402#;-- winperf.h:332
    PERF_AVERAGE_BULK            : constant := 16#40020500#;-- winperf.h:341
    PERF_100NSEC_TIMER           : constant := 16#20510500#;-- winperf.h:347
    PERF_100NSEC_TIMER_INV       : constant := 16#21510500#;-- winperf.h:353
    PERF_COUNTER_MULTI_TIMER     : constant := 16#22410500#;-- winperf.h:360
    PERF_COUNTER_MULTI_TIMER_INV : constant := 16#23410500#;-- winperf.h:369
    PERF_COUNTER_MULTI_BASE      : constant := 16#42030500#;-- winperf.h:376
    PERF_100NSEC_MULTI_TIMER     : constant := 16#22510500#;-- winperf.h:382
    PERF_100NSEC_MULTI_TIMER_INV : constant := 16#23510500#;-- winperf.h:391
    PERF_RAW_FRACTION            : constant := 16#20020400#;-- winperf.h:399
    PERF_RAW_BASE                : constant := 16#40030403#;-- winperf.h:405
    PERF_ELAPSED_TIME            : constant := 16#30240500#;-- winperf.h:417
    PERF_COUNTER_HISTOGRAM_TYPE  : constant := 16#80000000#;-- winperf.h:425
    PERF_DETAIL_NOVICE           : constant := 100;         -- winperf.h:434
    PERF_DETAIL_ADVANCED         : constant := 200;         -- winperf.h:435
    PERF_DETAIL_EXPERT           : constant := 300;         -- winperf.h:436
    PERF_DETAIL_WIZARD           : constant := 400;         -- winperf.h:437
    PERF_NO_UNIQUE_ID            : constant := -1;          -- winperf.h:483

    type PERF_DATA_BLOCK;                                   -- winperf.h:52
    type PERF_OBJECT_TYPE;                                  -- winperf.h:90
    type PERF_COUNTER_DEFINITION;                           -- winperf.h:446
    type PERF_INSTANCE_DEFINITION;                          -- winperf.h:485
    type PERF_COUNTER_BLOCK;                                -- winperf.h:520

    type PPERF_DATA_BLOCK is access all PERF_DATA_BLOCK;    -- winperf.h:80
    type PPERF_OBJECT_TYPE is access all PERF_OBJECT_TYPE;  -- winperf.h:151
    type PPERF_COUNTER_DEFINITION is access all PERF_COUNTER_DEFINITION;
                                                            -- winperf.h:470
    type PPERF_INSTANCE_DEFINITION is access all PERF_INSTANCE_DEFINITION;
                                                            -- winperf.h:506
    type PPERF_COUNTER_BLOCK is access all PERF_COUNTER_BLOCK;
                                                            -- winperf.h:523

    type PERF_DATA_BLOCK is                                 -- winperf.h:52
        record
            Signature       : Win32.WCHAR_Array(0..3);      -- winperf.h:53
            LittleEndian    : Win32.DWORD;                  -- winperf.h:54
            Version         : Win32.DWORD;                  -- winperf.h:55
            Revision        : Win32.DWORD;                  -- winperf.h:57
            TotalByteLength : Win32.DWORD;                  -- winperf.h:59
            HeaderLength    : Win32.DWORD;                  -- winperf.h:60
            NumObjectTypes  : Win32.DWORD;                  -- winperf.h:61
            DefaultObject   : Win32.LONG;                   -- winperf.h:63
            SystemTime      : Win32.Winbase.SYSTEMTIME;     -- winperf.h:68
            PerfTime        : Win32.Winnt.LARGE_INTEGER;    -- winperf.h:70
            PerfFreq        : Win32.Winnt.LARGE_INTEGER;    -- winperf.h:72
            PerfTime100nSec : Win32.Winnt.LARGE_INTEGER;    -- winperf.h:74
            SystemNameLength: Win32.DWORD;                  -- winperf.h:76
            SystemNameOffset: Win32.DWORD;                  -- winperf.h:77
        end record;

    type PERF_OBJECT_TYPE is                                -- winperf.h:90
        record
            TotalByteLength     : Win32.DWORD;              -- winperf.h:91
            DefinitionLength    : Win32.DWORD;              -- winperf.h:99
            HeaderLength        : Win32.DWORD;              -- winperf.h:107
            ObjectNameTitleIndex: Win32.DWORD;              -- winperf.h:111
            ObjectNameTitle     : Win32.LPWSTR;             -- winperf.h:113
            ObjectHelpTitleIndex: Win32.DWORD;              -- winperf.h:116
            ObjectHelpTitle     : Win32.LPWSTR;             -- winperf.h:118
            DetailLevel         : Win32.DWORD;              -- winperf.h:121
            NumCounters         : Win32.DWORD;              -- winperf.h:125
            DefaultCounter      : Win32.LONG;               -- winperf.h:128
            NumInstances        : Win32.LONG;               -- winperf.h:132
            CodePage            : Win32.DWORD;              -- winperf.h:144
            PerfTime            : Win32.Winnt.LARGE_INTEGER;-- winperf.h:147
            PerfFreq            : Win32.Winnt.LARGE_INTEGER;-- winperf.h:149
        end record;

    type PERF_COUNTER_DEFINITION is                         -- winperf.h:446
        record
            ByteLength           : Win32.DWORD;             -- winperf.h:447
            CounterNameTitleIndex: Win32.DWORD;             -- winperf.h:448
            CounterNameTitle     : Win32.LPWSTR;            -- winperf.h:451
            CounterHelpTitleIndex: Win32.DWORD;             -- winperf.h:454
            CounterHelpTitle     : Win32.LPWSTR;            -- winperf.h:457
            DefaultScale         : Win32.LONG;              -- winperf.h:460
            DetailLevel          : Win32.DWORD;             -- winperf.h:463
            CounterType          : Win32.DWORD;             -- winperf.h:465
            CounterSize          : Win32.DWORD;             -- winperf.h:466
            CounterOffset        : Win32.DWORD;             -- winperf.h:467
        end record;

    type PERF_INSTANCE_DEFINITION is                        -- winperf.h:485
        record
            ByteLength            : Win32.DWORD;            -- winperf.h:486
            ParentObjectTitleIndex: Win32.DWORD;            -- winperf.h:488
            ParentObjectInstance  : Win32.DWORD;            -- winperf.h:494
            UniqueID              : Win32.LONG;             -- winperf.h:498
            NameOffset            : Win32.DWORD;            -- winperf.h:501
            NameLength            : Win32.DWORD;            -- winperf.h:504
        end record;

    type PERF_COUNTER_BLOCK is                              -- winperf.h:520
        record
            ByteLength: Win32.DWORD;                        -- winperf.h:521
        end record;

private

    pragma Convention(C, PERF_DATA_BLOCK);                  -- winperf.h:52
    pragma Convention(C, PERF_OBJECT_TYPE);                 -- winperf.h:90
    pragma Convention(C, PERF_COUNTER_DEFINITION);          -- winperf.h:446
    pragma Convention(C, PERF_INSTANCE_DEFINITION);         -- winperf.h:485
    pragma Convention(C_Pass_By_Copy, PERF_COUNTER_BLOCK);               -- winperf.h:520

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

end Win32.Winperf;
