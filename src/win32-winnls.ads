-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winbase;
with Win32.Winnt;

package Win32.Winnls is

    MAX_LEADBYTES              : constant := 12;            -- winnls.h:31
    MAX_DEFAULTCHAR            : constant := 2;             -- winnls.h:32
    MB_PRECOMPOSED             : constant := 16#1#;         -- winnls.h:38
    MB_COMPOSITE               : constant := 16#2#;         -- winnls.h:39
    MB_USEGLYPHCHARS           : constant := 16#4#;         -- winnls.h:40
    MB_ERR_INVALID_CHARS       : constant := 16#8#;         -- winnls.h:41
    WC_DEFAULTCHECK            : constant := 16#100#;       -- winnls.h:43
    WC_COMPOSITECHECK          : constant := 16#200#;       -- winnls.h:44
    WC_DISCARDNS               : constant := 16#10#;        -- winnls.h:45
    WC_SEPCHARS                : constant := 16#20#;        -- winnls.h:46
    WC_DEFAULTCHAR             : constant := 16#40#;        -- winnls.h:47
    CT_CTYPE1                  : constant := 16#1#;         -- winnls.h:54
    CT_CTYPE2                  : constant := 16#2#;         -- winnls.h:55
    CT_CTYPE3                  : constant := 16#4#;         -- winnls.h:56
    C1_UPPER                   : constant := 16#1#;         -- winnls.h:61
    C1_LOWER                   : constant := 16#2#;         -- winnls.h:62
    C1_DIGIT                   : constant := 16#4#;         -- winnls.h:63
    C1_SPACE                   : constant := 16#8#;         -- winnls.h:64
    C1_PUNCT                   : constant := 16#10#;        -- winnls.h:65
    C1_CNTRL                   : constant := 16#20#;        -- winnls.h:66
    C1_BLANK                   : constant := 16#40#;        -- winnls.h:67
    C1_XDIGIT                  : constant := 16#80#;        -- winnls.h:68
    C1_ALPHA                   : constant := 16#100#;       -- winnls.h:69
    C2_LEFTTORIGHT             : constant := 16#1#;         -- winnls.h:74
    C2_RIGHTTOLEFT             : constant := 16#2#;         -- winnls.h:75
    C2_EUROPENUMBER            : constant := 16#3#;         -- winnls.h:77
    C2_EUROPESEPARATOR         : constant := 16#4#;         -- winnls.h:78
    C2_EUROPETERMINATOR        : constant := 16#5#;         -- winnls.h:79
    C2_ARABICNUMBER            : constant := 16#6#;         -- winnls.h:80
    C2_COMMONSEPARATOR         : constant := 16#7#;         -- winnls.h:81
    C2_BLOCKSEPARATOR          : constant := 16#8#;         -- winnls.h:83
    C2_SEGMENTSEPARATOR        : constant := 16#9#;         -- winnls.h:84
    C2_WHITESPACE              : constant := 16#a#;         -- winnls.h:85
    C2_OTHERNEUTRAL            : constant := 16#b#;         -- winnls.h:86
    C2_NOTAPPLICABLE           : constant := 16#0#;         -- winnls.h:88
    C3_NONSPACING              : constant := 16#1#;         -- winnls.h:93
    C3_DIACRITIC               : constant := 16#2#;         -- winnls.h:94
    C3_VOWELMARK               : constant := 16#4#;         -- winnls.h:95
    C3_SYMBOL                  : constant := 16#8#;         -- winnls.h:96
    C3_KATAKANA                : constant := 16#10#;        -- winnls.h:98
    C3_HIRAGANA                : constant := 16#20#;        -- winnls.h:99
    C3_HALFWIDTH               : constant := 16#40#;        -- winnls.h:100
    C3_FULLWIDTH               : constant := 16#80#;        -- winnls.h:101
    C3_IDEOGRAPH               : constant := 16#100#;       -- winnls.h:102
    C3_KASHIDA                 : constant := 16#200#;       -- winnls.h:103
    C3_LEXICAL                 : constant := 16#400#;       -- winnls.h:104
    C3_ALPHA                   : constant := 16#8000#;      -- winnls.h:106
    C3_NOTAPPLICABLE           : constant := 16#0#;         -- winnls.h:108
    NORM_IGNORECASE            : constant := 16#1#;         -- winnls.h:114
    NORM_IGNORENONSPACE        : constant := 16#2#;         -- winnls.h:115
    NORM_IGNORESYMBOLS         : constant := 16#4#;         -- winnls.h:116
    NORM_IGNOREKANATYPE        : constant := 16#10000#;     -- winnls.h:118
    NORM_IGNOREWIDTH           : constant := 16#20000#;     -- winnls.h:119
    MAP_FOLDCZONE              : constant := 16#10#;        -- winnls.h:125
    MAP_PRECOMPOSED            : constant := 16#20#;        -- winnls.h:126
    MAP_COMPOSITE              : constant := 16#40#;        -- winnls.h:127
    MAP_FOLDDIGITS             : constant := 16#80#;        -- winnls.h:128
    LCMAP_LOWERCASE            : constant := 16#100#;       -- winnls.h:134
    LCMAP_UPPERCASE            : constant := 16#200#;       -- winnls.h:135
    LCMAP_SORTKEY              : constant := 16#400#;       -- winnls.h:136
    LCMAP_BYTEREV              : constant := 16#800#;       -- winnls.h:137
    LCMAP_HIRAGANA             : constant := 16#100000#;    -- winnls.h:139
    LCMAP_KATAKANA             : constant := 16#200000#;    -- winnls.h:140
    LCMAP_HALFWIDTH            : constant := 16#400000#;    -- winnls.h:141
    LCMAP_FULLWIDTH            : constant := 16#800000#;    -- winnls.h:142
    LCID_INSTALLED             : constant := 16#1#;         -- winnls.h:148
    LCID_SUPPORTED             : constant := 16#2#;         -- winnls.h:149
    CP_INSTALLED               : constant := 16#1#;         -- winnls.h:154
    CP_SUPPORTED               : constant := 16#2#;         -- winnls.h:155
    SORT_STRINGSORT            : constant := 16#1000#;      -- winnls.h:188
    CP_ACP                     : constant := 0;             -- winnls.h:194
    CP_OEMCP                   : constant := 1;             -- winnls.h:195
    CP_MACCP                   : constant := 2;             -- winnls.h:196
    CTRY_DEFAULT               : constant := 0;             -- winnls.h:202
    CTRY_AUSTRALIA             : constant := 61;            -- winnls.h:204
    CTRY_AUSTRIA               : constant := 43;            -- winnls.h:205
    CTRY_BELGIUM               : constant := 32;            -- winnls.h:206
    CTRY_BRAZIL                : constant := 55;            -- winnls.h:207
    CTRY_BULGARIA              : constant := 359;           -- winnls.h:208
    CTRY_CANADA                : constant := 2;             -- winnls.h:209
    CTRY_CROATIA               : constant := 385;           -- winnls.h:210
    CTRY_CZECH                 : constant := 42;            -- winnls.h:211
    CTRY_DENMARK               : constant := 45;            -- winnls.h:212
    CTRY_FINLAND               : constant := 358;           -- winnls.h:213
    CTRY_FRANCE                : constant := 33;            -- winnls.h:214
    CTRY_GERMANY               : constant := 49;            -- winnls.h:215
    CTRY_GREECE                : constant := 30;            -- winnls.h:216
    CTRY_HONG_KONG             : constant := 852;           -- winnls.h:217
    CTRY_HUNGARY               : constant := 36;            -- winnls.h:218
    CTRY_ICELAND               : constant := 354;           -- winnls.h:219
    CTRY_IRELAND               : constant := 353;           -- winnls.h:220
    CTRY_ITALY                 : constant := 39;            -- winnls.h:221
    CTRY_JAPAN                 : constant := 81;            -- winnls.h:222
    CTRY_MEXICO                : constant := 52;            -- winnls.h:223
    CTRY_NETHERLANDS           : constant := 31;            -- winnls.h:224
    CTRY_NEW_ZEALAND           : constant := 64;            -- winnls.h:225
    CTRY_NORWAY                : constant := 47;            -- winnls.h:226
    CTRY_POLAND                : constant := 48;            -- winnls.h:227
    CTRY_PORTUGAL              : constant := 351;           -- winnls.h:228
    CTRY_PRCHINA               : constant := 86;            -- winnls.h:229
    CTRY_ROMANIA               : constant := 40;            -- winnls.h:230
    CTRY_RUSSIA                : constant := 7;             -- winnls.h:231
    CTRY_SINGAPORE             : constant := 65;            -- winnls.h:232
    CTRY_SLOVAK                : constant := 42;            -- winnls.h:233
    CTRY_SLOVENIA              : constant := 386;           -- winnls.h:234
    CTRY_SOUTH_KOREA           : constant := 82;            -- winnls.h:235
    CTRY_SPAIN                 : constant := 34;            -- winnls.h:236
    CTRY_SWEDEN                : constant := 46;            -- winnls.h:237
    CTRY_SWITZERLAND           : constant := 41;            -- winnls.h:238
    CTRY_TAIWAN                : constant := 886;           -- winnls.h:239
    CTRY_TURKEY                : constant := 90;            -- winnls.h:240
    CTRY_UNITED_KINGDOM        : constant := 44;            -- winnls.h:241
    CTRY_UNITED_STATES         : constant := 1;             -- winnls.h:242
    LOCALE_NOUSEROVERRIDE      : constant := 16#80000000#;  -- winnls.h:255
    LOCALE_USE_CP_ACP          : constant := 16#40000000#;  -- winnls.h:256
    LOCALE_ILANGUAGE           : constant := 16#1#;         -- winnls.h:258
    LOCALE_SLANGUAGE           : constant := 16#2#;         -- winnls.h:259
    LOCALE_SENGLANGUAGE        : constant := 16#1001#;      -- winnls.h:260
    LOCALE_SABBREVLANGNAME     : constant := 16#3#;         -- winnls.h:261
    LOCALE_SNATIVELANGNAME     : constant := 16#4#;         -- winnls.h:262
    LOCALE_ICOUNTRY            : constant := 16#5#;         -- winnls.h:263
    LOCALE_SCOUNTRY            : constant := 16#6#;         -- winnls.h:264
    LOCALE_SENGCOUNTRY         : constant := 16#1002#;      -- winnls.h:265
    LOCALE_SABBREVCTRYNAME     : constant := 16#7#;         -- winnls.h:266
    LOCALE_SNATIVECTRYNAME     : constant := 16#8#;         -- winnls.h:267
    LOCALE_IDEFAULTLANGUAGE    : constant := 16#9#;         -- winnls.h:268
    LOCALE_IDEFAULTCOUNTRY     : constant := 16#a#;         -- winnls.h:269
    LOCALE_IDEFAULTCODEPAGE    : constant := 16#b#;         -- winnls.h:270
    LOCALE_IDEFAULTANSICODEPAGE: constant := 16#1004#;      -- winnls.h:271
    LOCALE_SLIST               : constant := 16#c#;         -- winnls.h:273
    LOCALE_IMEASURE            : constant := 16#d#;         -- winnls.h:274
    LOCALE_SDECIMAL            : constant := 16#e#;         -- winnls.h:276
    LOCALE_STHOUSAND           : constant := 16#f#;         -- winnls.h:277
    LOCALE_SGROUPING           : constant := 16#10#;        -- winnls.h:278
    LOCALE_IDIGITS             : constant := 16#11#;        -- winnls.h:279
    LOCALE_ILZERO              : constant := 16#12#;        -- winnls.h:280
    LOCALE_INEGNUMBER          : constant := 16#1010#;      -- winnls.h:281
    LOCALE_SNATIVEDIGITS       : constant := 16#13#;        -- winnls.h:282
    LOCALE_SCURRENCY           : constant := 16#14#;        -- winnls.h:284
    LOCALE_SINTLSYMBOL         : constant := 16#15#;        -- winnls.h:285
    LOCALE_SMONDECIMALSEP      : constant := 16#16#;        -- winnls.h:286
    LOCALE_SMONTHOUSANDSEP     : constant := 16#17#;        -- winnls.h:287
    LOCALE_SMONGROUPING        : constant := 16#18#;        -- winnls.h:288
    LOCALE_ICURRDIGITS         : constant := 16#19#;        -- winnls.h:289
    LOCALE_IINTLCURRDIGITS     : constant := 16#1a#;        -- winnls.h:290
    LOCALE_ICURRENCY           : constant := 16#1b#;        -- winnls.h:291
    LOCALE_INEGCURR            : constant := 16#1c#;        -- winnls.h:292
    LOCALE_SDATE               : constant := 16#1d#;        -- winnls.h:294
    LOCALE_STIME               : constant := 16#1e#;        -- winnls.h:295
    LOCALE_SSHORTDATE          : constant := 16#1f#;        -- winnls.h:296
    LOCALE_SLONGDATE           : constant := 16#20#;        -- winnls.h:297
    LOCALE_STIMEFORMAT         : constant := 16#1003#;      -- winnls.h:298
    LOCALE_IDATE               : constant := 16#21#;        -- winnls.h:299
    LOCALE_ILDATE              : constant := 16#22#;        -- winnls.h:300
    LOCALE_ITIME               : constant := 16#23#;        -- winnls.h:301
    LOCALE_ITIMEMARKPOSN       : constant := 16#1005#;      -- winnls.h:302
    LOCALE_ICENTURY            : constant := 16#24#;        -- winnls.h:303
    LOCALE_ITLZERO             : constant := 16#25#;        -- winnls.h:304
    LOCALE_IDAYLZERO           : constant := 16#26#;        -- winnls.h:305
    LOCALE_IMONLZERO           : constant := 16#27#;        -- winnls.h:306
    LOCALE_S1159               : constant := 16#28#;        -- winnls.h:307
    LOCALE_S2359               : constant := 16#29#;        -- winnls.h:308
    LOCALE_ICALENDARTYPE       : constant := 16#1009#;      -- winnls.h:310
    LOCALE_IOPTIONALCALENDAR   : constant := 16#100b#;      -- winnls.h:311
    LOCALE_IFIRSTDAYOFWEEK     : constant := 16#100c#;      -- winnls.h:312
    LOCALE_IFIRSTWEEKOFYEAR    : constant := 16#100d#;      -- winnls.h:313
    LOCALE_SDAYNAME1           : constant := 16#2a#;        -- winnls.h:315
    LOCALE_SDAYNAME2           : constant := 16#2b#;        -- winnls.h:316
    LOCALE_SDAYNAME3           : constant := 16#2c#;        -- winnls.h:317
    LOCALE_SDAYNAME4           : constant := 16#2d#;        -- winnls.h:318
    LOCALE_SDAYNAME5           : constant := 16#2e#;        -- winnls.h:319
    LOCALE_SDAYNAME6           : constant := 16#2f#;        -- winnls.h:320
    LOCALE_SDAYNAME7           : constant := 16#30#;        -- winnls.h:321
    LOCALE_SABBREVDAYNAME1     : constant := 16#31#;        -- winnls.h:322
    LOCALE_SABBREVDAYNAME2     : constant := 16#32#;        -- winnls.h:323
    LOCALE_SABBREVDAYNAME3     : constant := 16#33#;        -- winnls.h:324
    LOCALE_SABBREVDAYNAME4     : constant := 16#34#;        -- winnls.h:325
    LOCALE_SABBREVDAYNAME5     : constant := 16#35#;        -- winnls.h:326
    LOCALE_SABBREVDAYNAME6     : constant := 16#36#;        -- winnls.h:327
    LOCALE_SABBREVDAYNAME7     : constant := 16#37#;        -- winnls.h:328
    LOCALE_SMONTHNAME1         : constant := 16#38#;        -- winnls.h:329
    LOCALE_SMONTHNAME2         : constant := 16#39#;        -- winnls.h:330
    LOCALE_SMONTHNAME3         : constant := 16#3a#;        -- winnls.h:331
    LOCALE_SMONTHNAME4         : constant := 16#3b#;        -- winnls.h:332
    LOCALE_SMONTHNAME5         : constant := 16#3c#;        -- winnls.h:333
    LOCALE_SMONTHNAME6         : constant := 16#3d#;        -- winnls.h:334
    LOCALE_SMONTHNAME7         : constant := 16#3e#;        -- winnls.h:335
    LOCALE_SMONTHNAME8         : constant := 16#3f#;        -- winnls.h:336
    LOCALE_SMONTHNAME9         : constant := 16#40#;        -- winnls.h:337
    LOCALE_SMONTHNAME10        : constant := 16#41#;        -- winnls.h:338
    LOCALE_SMONTHNAME11        : constant := 16#42#;        -- winnls.h:339
    LOCALE_SMONTHNAME12        : constant := 16#43#;        -- winnls.h:340
    LOCALE_SMONTHNAME13        : constant := 16#100e#;      -- winnls.h:341
    LOCALE_SABBREVMONTHNAME1   : constant := 16#44#;        -- winnls.h:342
    LOCALE_SABBREVMONTHNAME2   : constant := 16#45#;        -- winnls.h:343
    LOCALE_SABBREVMONTHNAME3   : constant := 16#46#;        -- winnls.h:344
    LOCALE_SABBREVMONTHNAME4   : constant := 16#47#;        -- winnls.h:345
    LOCALE_SABBREVMONTHNAME5   : constant := 16#48#;        -- winnls.h:346
    LOCALE_SABBREVMONTHNAME6   : constant := 16#49#;        -- winnls.h:347
    LOCALE_SABBREVMONTHNAME7   : constant := 16#4a#;        -- winnls.h:348
    LOCALE_SABBREVMONTHNAME8   : constant := 16#4b#;        -- winnls.h:349
    LOCALE_SABBREVMONTHNAME9   : constant := 16#4c#;        -- winnls.h:350
    LOCALE_SABBREVMONTHNAME10  : constant := 16#4d#;        -- winnls.h:351
    LOCALE_SABBREVMONTHNAME11  : constant := 16#4e#;        -- winnls.h:352
    LOCALE_SABBREVMONTHNAME12  : constant := 16#4f#;        -- winnls.h:353
    LOCALE_SABBREVMONTHNAME13  : constant := 16#100f#;      -- winnls.h:354
    LOCALE_SPOSITIVESIGN       : constant := 16#50#;        -- winnls.h:356
    LOCALE_SNEGATIVESIGN       : constant := 16#51#;        -- winnls.h:357
    LOCALE_IPOSSIGNPOSN        : constant := 16#52#;        -- winnls.h:358
    LOCALE_INEGSIGNPOSN        : constant := 16#53#;        -- winnls.h:359
    LOCALE_IPOSSYMPRECEDES     : constant := 16#54#;        -- winnls.h:360
    LOCALE_IPOSSEPBYSPACE      : constant := 16#55#;        -- winnls.h:361
    LOCALE_INEGSYMPRECEDES     : constant := 16#56#;        -- winnls.h:362
    LOCALE_INEGSEPBYSPACE      : constant := 16#57#;        -- winnls.h:363
    TIME_NOMINUTESORSECONDS    : constant := 16#1#;         -- winnls.h:369
    TIME_NOSECONDS             : constant := 16#2#;         -- winnls.h:370
    TIME_NOTIMEMARKER          : constant := 16#4#;         -- winnls.h:371
    TIME_FORCE24HOURFORMAT     : constant := 16#8#;         -- winnls.h:372
    DATE_SHORTDATE             : constant := 16#1#;         -- winnls.h:378
    DATE_LONGDATE              : constant := 16#2#;         -- winnls.h:379
    DATE_USE_ALT_CALENDAR      : constant := 16#4#;         -- winnls.h:380
    CAL_ICALINTVALUE           : constant := 16#1#;         -- winnls.h:388
    CAL_SCALNAME               : constant := 16#2#;         -- winnls.h:389
    CAL_IYEAROFFSETRANGE       : constant := 16#3#;         -- winnls.h:390
    CAL_SERASTRING             : constant := 16#4#;         -- winnls.h:391
    CAL_SSHORTDATE             : constant := 16#5#;         -- winnls.h:392
    CAL_SLONGDATE              : constant := 16#6#;         -- winnls.h:393
    CAL_SDAYNAME1              : constant := 16#7#;         -- winnls.h:394
    CAL_SDAYNAME2              : constant := 16#8#;         -- winnls.h:395
    CAL_SDAYNAME3              : constant := 16#9#;         -- winnls.h:396
    CAL_SDAYNAME4              : constant := 16#a#;         -- winnls.h:397
    CAL_SDAYNAME5              : constant := 16#b#;         -- winnls.h:398
    CAL_SDAYNAME6              : constant := 16#c#;         -- winnls.h:399
    CAL_SDAYNAME7              : constant := 16#d#;         -- winnls.h:400
    CAL_SABBREVDAYNAME1        : constant := 16#e#;         -- winnls.h:401
    CAL_SABBREVDAYNAME2        : constant := 16#f#;         -- winnls.h:402
    CAL_SABBREVDAYNAME3        : constant := 16#10#;        -- winnls.h:403
    CAL_SABBREVDAYNAME4        : constant := 16#11#;        -- winnls.h:404
    CAL_SABBREVDAYNAME5        : constant := 16#12#;        -- winnls.h:405
    CAL_SABBREVDAYNAME6        : constant := 16#13#;        -- winnls.h:406
    CAL_SABBREVDAYNAME7        : constant := 16#14#;        -- winnls.h:407
    CAL_SMONTHNAME1            : constant := 16#15#;        -- winnls.h:408
    CAL_SMONTHNAME2            : constant := 16#16#;        -- winnls.h:409
    CAL_SMONTHNAME3            : constant := 16#17#;        -- winnls.h:410
    CAL_SMONTHNAME4            : constant := 16#18#;        -- winnls.h:411
    CAL_SMONTHNAME5            : constant := 16#19#;        -- winnls.h:412
    CAL_SMONTHNAME6            : constant := 16#1a#;        -- winnls.h:413
    CAL_SMONTHNAME7            : constant := 16#1b#;        -- winnls.h:414
    CAL_SMONTHNAME8            : constant := 16#1c#;        -- winnls.h:415
    CAL_SMONTHNAME9            : constant := 16#1d#;        -- winnls.h:416
    CAL_SMONTHNAME10           : constant := 16#1e#;        -- winnls.h:417
    CAL_SMONTHNAME11           : constant := 16#1f#;        -- winnls.h:418
    CAL_SMONTHNAME12           : constant := 16#20#;        -- winnls.h:419
    CAL_SMONTHNAME13           : constant := 16#21#;        -- winnls.h:420
    CAL_SABBREVMONTHNAME1      : constant := 16#22#;        -- winnls.h:421
    CAL_SABBREVMONTHNAME2      : constant := 16#23#;        -- winnls.h:422
    CAL_SABBREVMONTHNAME3      : constant := 16#24#;        -- winnls.h:423
    CAL_SABBREVMONTHNAME4      : constant := 16#25#;        -- winnls.h:424
    CAL_SABBREVMONTHNAME5      : constant := 16#26#;        -- winnls.h:425
    CAL_SABBREVMONTHNAME6      : constant := 16#27#;        -- winnls.h:426
    CAL_SABBREVMONTHNAME7      : constant := 16#28#;        -- winnls.h:427
    CAL_SABBREVMONTHNAME8      : constant := 16#29#;        -- winnls.h:428
    CAL_SABBREVMONTHNAME9      : constant := 16#2a#;        -- winnls.h:429
    CAL_SABBREVMONTHNAME10     : constant := 16#2b#;        -- winnls.h:430
    CAL_SABBREVMONTHNAME11     : constant := 16#2c#;        -- winnls.h:431
    CAL_SABBREVMONTHNAME12     : constant := 16#2d#;        -- winnls.h:432
    CAL_SABBREVMONTHNAME13     : constant := 16#2e#;        -- winnls.h:433
    ENUM_ALL_CALENDARS         : constant := 16#ffffffff#;  -- winnls.h:439
    CAL_GREGORIAN              : constant := 1;             -- winnls.h:445
    CAL_GREGORIAN_US           : constant := 2;             -- winnls.h:446
    CAL_JAPAN                  : constant := 3;             -- winnls.h:447
    CAL_TAIWAN                 : constant := 4;             -- winnls.h:448
    CAL_KOREA                  : constant := 5;             -- winnls.h:449

    type LCTYPE is new Win32.DWORD;                         -- winnls.h:463
    type CALTYPE is new Win32.DWORD;                        -- winnls.h:468
    type CALID is new Win32.DWORD;                          -- winnls.h:473

    type CPINFO;                                            -- winnls.h:480
    type NUMBERFMTA;                                        -- winnls.h:491
    type NUMBERFMTW;                                        -- winnls.h:499
    type CURRENCYFMTA;                                      -- winnls.h:520
    type CURRENCYFMTW;                                      -- winnls.h:530

    type LPCPINFO is access all CPINFO;                     -- winnls.h:484
    type LPNUMBERFMTA is access all NUMBERFMTA;             -- winnls.h:498
    subtype LPNUMBERFMT is LPNUMBERFMTA;                    -- winnls.h:512
    type LPNUMBERFMTW is access all NUMBERFMTW;             -- winnls.h:506
    type LPCURRENCYFMTA is access all CURRENCYFMTA;         -- winnls.h:529
    subtype LPCURRENCYFMT is LPCURRENCYFMTA;                -- winnls.h:545
    type LPCURRENCYFMTW is access all CURRENCYFMTW;         -- winnls.h:539

    type CPINFO is                                          -- winnls.h:480
        record
            MaxCharSize: Win32.UINT;                        -- winnls.h:481
            DefaultChar: Win32.BYTE_Array(0..MAX_DEFAULTCHAR-1);
                                                            -- winnls.h:482
            LeadByte   : Win32.BYTE_Array(0..MAX_LEADBYTES-1);
                                                            -- winnls.h:483
        end record;

    type NUMBERFMTA is                                      -- winnls.h:491
        record
            NumDigits    : Win32.UINT;                      -- winnls.h:492
            LeadingZero  : Win32.UINT;                      -- winnls.h:493
            Grouping     : Win32.UINT;                      -- winnls.h:494
            lpDecimalSep : Win32.LPSTR;                     -- winnls.h:495
            lpThousandSep: Win32.LPSTR;                     -- winnls.h:496
            NegativeOrder: Win32.UINT;                      -- winnls.h:497
        end record;

    type NUMBERFMTW is                                      -- winnls.h:499
        record
            NumDigits    : Win32.UINT;                      -- winnls.h:500
            LeadingZero  : Win32.UINT;                      -- winnls.h:501
            Grouping     : Win32.UINT;                      -- winnls.h:502
            lpDecimalSep : Win32.LPWSTR;                    -- winnls.h:503
            lpThousandSep: Win32.LPWSTR;                    -- winnls.h:504
            NegativeOrder: Win32.UINT;                      -- winnls.h:505
        end record;

    subtype NUMBERFMT is NUMBERFMTA;                        -- winnls.h:511

    type CURRENCYFMTA is                                    -- winnls.h:520
        record
            NumDigits       : Win32.UINT;                   -- winnls.h:521
            LeadingZero     : Win32.UINT;                   -- winnls.h:522
            Grouping        : Win32.UINT;                   -- winnls.h:523
            lpDecimalSep    : Win32.LPSTR;                  -- winnls.h:524
            lpThousandSep   : Win32.LPSTR;                  -- winnls.h:525
            NegativeOrder   : Win32.UINT;                   -- winnls.h:526
            PositiveOrder   : Win32.UINT;                   -- winnls.h:527
            lpCurrencySymbol: Win32.LPSTR;                  -- winnls.h:528
        end record;

    type CURRENCYFMTW is                                    -- winnls.h:530
        record
            NumDigits       : Win32.UINT;                   -- winnls.h:531
            LeadingZero     : Win32.UINT;                   -- winnls.h:532
            Grouping        : Win32.UINT;                   -- winnls.h:533
            lpDecimalSep    : Win32.LPWSTR;                 -- winnls.h:534
            lpThousandSep   : Win32.LPWSTR;                 -- winnls.h:535
            NegativeOrder   : Win32.UINT;                   -- winnls.h:536
            PositiveOrder   : Win32.UINT;                   -- winnls.h:537
            lpCurrencySymbol: Win32.LPWSTR;                 -- winnls.h:538
        end record;

    subtype CURRENCYFMT is CURRENCYFMTA;                    -- winnls.h:544

    type LOCALE_ENUMPROCA is access function (lpLocaleString: Win32.LPSTR) 
        return Win32.BOOL;                                  -- winnls.h:556
    pragma Convention(Stdcall, LOCALE_ENUMPROCA);
    subtype LOCALE_ENUMPROC is LOCALE_ENUMPROCA;            -- winnls.h:594
    type CODEPAGE_ENUMPROCA is access function (lpCodePageString: Win32.LPSTR) 
        return Win32.BOOL;                                  -- winnls.h:557
    pragma Convention(Stdcall, CODEPAGE_ENUMPROCA);
    subtype CODEPAGE_ENUMPROC is CODEPAGE_ENUMPROCA;        -- winnls.h:595
    type DATEFMT_ENUMPROCA is access function (lpDateFormatString: Win32.LPSTR) 
        return Win32.BOOL;                                  -- winnls.h:558
    pragma Convention(Stdcall, DATEFMT_ENUMPROCA);
    subtype DATEFMT_ENUMPROC is DATEFMT_ENUMPROCA;          -- winnls.h:596
    type TIMEFMT_ENUMPROCA is access function (lpTimeFormatString: Win32.LPSTR)
        return Win32.BOOL;                                  -- winnls.h:559
    pragma Convention(Stdcall, TIMEFMT_ENUMPROCA);
    subtype TIMEFMT_ENUMPROC is TIMEFMT_ENUMPROCA;          -- winnls.h:597
    type CALINFO_ENUMPROCA is access function (
        lpCalendarInfoString: Win32.LPSTR) return Win32.BOOL;
    pragma Convention(Stdcall, CALINFO_ENUMPROCA);
                                                            -- winnls.h:560
    subtype CALINFO_ENUMPROC is CALINFO_ENUMPROCA;          -- winnls.h:598
    type LOCALE_ENUMPROCW is access function (lpLocaleString: Win32.LPWSTR) 
        return Win32.BOOL;                                  -- winnls.h:562
    pragma Convention(Stdcall, LOCALE_ENUMPROCW);
    type CODEPAGE_ENUMPROCW is access function (lpCodePageString:Win32.LPWSTR)
        return Win32.BOOL;                                  -- winnls.h:563
    pragma Convention(Stdcall, CODEPAGE_ENUMPROCW);
    type DATEFMT_ENUMPROCW is access function (
        lpDateFormatString: Win32.LPWSTR) return Win32.BOOL;-- winnls.h:564
    pragma Convention(Stdcall, DATEFMT_ENUMPROCW);
    type TIMEFMT_ENUMPROCW is access function (
        lpTimeFormatString: Win32.LPWSTR) return Win32.BOOL;-- winnls.h:565
    pragma Convention(Stdcall, TIMEFMT_ENUMPROCW);
    type CALINFO_ENUMPROCW is access function (
        lpCalendarInfoString: Win32.LPWSTR) return Win32.BOOL;
    pragma Convention(Stdcall, CALINFO_ENUMPROCW);
                                                            -- winnls.h:566

    type ac_NUMBERFMTA_t is access all NUMBERFMTA;     -- winnls.h:842
    type ac_NUMBERFMTW_t is access all NUMBERFMTW;     -- winnls.h:852
    type ac_CURRENCYFMTA_t is access all CURRENCYFMTA; -- winnls.h:868
    type ac_CURRENCYFMTW_t is access all CURRENCYFMTW; -- winnls.h:878

    function IsValidCodePage(CodePage: Win32.UINT) return Win32.BOOL;
                                                            -- winnls.h:625

    function GetACP return Win32.UINT;                      -- winnls.h:631

    function GetOEMCP return Win32.UINT;                    -- winnls.h:636

    function GetCPInfo(CodePage: Win32.UINT;
                       lpCPInfo: access CPINFO)
                                 return Win32.BOOL;         -- winnls.h:641

    function IsDBCSLeadByte(TestChar: Win32.BYTE) return Win32.BOOL;
                                                            -- winnls.h:648

    function IsDBCSLeadByteEx(CodePage: Win32.UINT;
                              TestChar: Win32.BYTE)
                                        return Win32.BOOL;  -- winnls.h:654

    function MultiByteToWideChar(CodePage      : Win32.UINT;
                                 dwFlags       : Win32.DWORD;
                                 lpMultiByteStr: Win32.LPCSTR;
                                 cchMultiByte  : Win32.INT;
                                 lpWideCharStr : Win32.LPWSTR;
                                 cchWideChar   : Win32.INT)
                                                 return Win32.INT;
                                                            -- winnls.h:661

    function WideCharToMultiByte(CodePage         : Win32.UINT;
                                 dwFlags          : Win32.DWORD;
                                 lpWideCharStr    : Win32.LPCWSTR;
                                 cchWideChar      : Win32.INT;
                                 lpMultiByteStr   : Win32.LPSTR;
                                 cchMultiByte     : Win32.INT;
                                 lpDefaultChar    : Win32.LPCSTR;
                                 lpUsedDefaultChar: Win32.LPBOOL)
                                                    return Win32.INT;
                                                            -- winnls.h:672

    function CompareStringA(Locale    : Win32.Winnt.LCID;
                            dwCmpFlags: Win32.DWORD;
                            lpString1 : Win32.LPCSTR;
                            cchCount1 : Win32.INT;
                            lpString2 : Win32.LPCSTR;
                            cchCount2 : Win32.INT)
                                        return Win32.INT;   -- winnls.h:690

    function CompareString(Locale    : Win32.Winnt.LCID;
                           dwCmpFlags: Win32.DWORD;
                           lpString1 : Win32.LPCSTR;
                           cchCount1 : Win32.INT;
                           lpString2 : Win32.LPCSTR;
                           cchCount2 : Win32.INT)
                                       return Win32.INT
                                       renames CompareStringA;
                                                            -- winnls.h:690

    function CompareStringW(Locale    : Win32.Winnt.LCID;
                            dwCmpFlags: Win32.DWORD;
                            lpString1 : Win32.LPCWSTR;
                            cchCount1 : Win32.INT;
                            lpString2 : Win32.LPCWSTR;
                            cchCount2 : Win32.INT)
                                        return Win32.INT;   -- winnls.h:700

    function LCMapStringA(Locale    : Win32.Winnt.LCID;
                          dwMapFlags: Win32.DWORD;
                          lpSrcStr  : Win32.LPCSTR;
                          cchSrc    : Win32.INT;
                          lpDestStr : Win32.LPSTR;
                          cchDest   : Win32.INT)
                                      return Win32.INT;     -- winnls.h:716

    function LCMapStringW(Locale    : Win32.Winnt.LCID;
                          dwMapFlags: Win32.DWORD;
                          lpSrcStr  : Win32.LPCWSTR;
                          cchSrc    : Win32.INT;
                          lpDestStr : Win32.LPWSTR;
                          cchDest   : Win32.INT)
                                      return Win32.INT;     -- winnls.h:726

    function LCMapString (Locale    : Win32.Winnt.LCID;
                          dwMapFlags: Win32.DWORD;
                          lpSrcStr  : Win32.LPCSTR;
                          cchSrc    : Win32.INT;
                          lpDestStr : Win32.LPSTR;
                          cchDest   : Win32.INT)
          return Win32.INT renames LCMapStringA;            -- winnls.h:736

    function GetLocaleInfoA(Locale  : Win32.Winnt.LCID;
                            LCTYPE  : Win32.Winnls.LCTYPE;
                            lpLCData: Win32.LPSTR;
                            cchData : Win32.INT)
                                      return Win32.INT;     -- winnls.h:742

    function GetLocaleInfo(Locale  : Win32.Winnt.LCID;
                           LCTYPE  : Win32.Winnls.LCTYPE;
                           lpLCData: Win32.LPSTR;
                           cchData : Win32.INT)
                                     return Win32.INT
                                     renames GetLocaleInfoA;-- winnls.h:742

    function GetLocaleInfoW(Locale  : Win32.Winnt.LCID;
                            LCTYPE  : Win32.Winnls.LCTYPE;
                            lpLCData: Win32.LPWSTR;
                            cchData : Win32.INT)
                                      return Win32.INT;     -- winnls.h:750

    function SetLocaleInfoA(Locale  : Win32.Winnt.LCID;
                            LCTYPE  : Win32.Winnls.LCTYPE;
                            lpLCData: Win32.LPCSTR)
                                      return Win32.BOOL;    -- winnls.h:764

    function SetLocaleInfo(Locale  : Win32.Winnt.LCID;
                           LCTYPE  : Win32.Winnls.LCTYPE;
                           lpLCData: Win32.LPCSTR)
                                     return Win32.BOOL
                                     renames SetLocaleInfoA;-- winnls.h:764

    function SetLocaleInfoW(Locale  : Win32.Winnt.LCID;
                            LCTYPE  : Win32.Winnls.LCTYPE;
                            lpLCData: Win32.LPCWSTR)
                                      return Win32.BOOL;    -- winnls.h:771

    function GetTimeFormatA(Locale   : Win32.Winnt.LCID;
                            dwFlags  : Win32.DWORD;
                            lpTime   : Win32.Winbase.ac_SYSTEMTIME_t;
                            lpFormat : Win32.LPCSTR;
                            lpTimeStr: Win32.LPSTR;
                            cchTime  : Win32.INT)
                                       return Win32.INT;    -- winnls.h:784

    function GetTimeFormat(Locale   : Win32.Winnt.LCID;
                           dwFlags  : Win32.DWORD;
                           lpTime   : Win32.Winbase.ac_SYSTEMTIME_t;
                           lpFormat : Win32.LPCSTR;
                           lpTimeStr: Win32.LPSTR;
                           cchTime  : Win32.INT)
                                      return Win32.INT
                                      renames GetTimeFormatA;
                                                            -- winnls.h:784

    function GetTimeFormatW(Locale   : Win32.Winnt.LCID;
                            dwFlags  : Win32.DWORD;
                            lpTime   : Win32.Winbase.ac_SYSTEMTIME_t;
                            lpFormat : Win32.LPCWSTR;
                            lpTimeStr: Win32.LPWSTR;
                            cchTime  : Win32.INT)
                                       return Win32.INT;    -- winnls.h:794

    function GetDateFormatA(Locale   : Win32.Winnt.LCID;
                            dwFlags  : Win32.DWORD;
                            lpDate   : Win32.Winbase.ac_SYSTEMTIME_t;
                            lpFormat : Win32.LPCSTR;
                            lpDateStr: Win32.LPSTR;
                            cchDate  : Win32.INT)
                                       return Win32.INT;    -- winnls.h:810

    function GetDateFormat(Locale   : Win32.Winnt.LCID;
                           dwFlags  : Win32.DWORD;
                           lpDate   : Win32.Winbase.ac_SYSTEMTIME_t;
                           lpFormat : Win32.LPCSTR;
                           lpDateStr: Win32.LPSTR;
                           cchDate  : Win32.INT)
                                      return Win32.INT
                                      renames GetDateFormatA;
                                                            -- winnls.h:810

    function GetDateFormatW(Locale   : Win32.Winnt.LCID;
                            dwFlags  : Win32.DWORD;
                            lpDate   : Win32.Winbase.ac_SYSTEMTIME_t;
                            lpFormat : Win32.LPCWSTR;
                            lpDateStr: Win32.LPWSTR;
                            cchDate  : Win32.INT)
                                       return Win32.INT;    -- winnls.h:820

    function GetNumberFormatA(Locale     : Win32.Winnt.LCID;
                              dwFlags    : Win32.DWORD;
                              lpValue    : Win32.LPCSTR;
                              lpFormat   : ac_NUMBERFMTA_t;
                              lpNumberStr: Win32.LPSTR;
                              cchNumber  : Win32.INT)
                                           return Win32.INT;-- winnls.h:836

    function GetNumberFormat(Locale     : Win32.Winnt.LCID;
                             dwFlags    : Win32.DWORD;
                             lpValue    : Win32.LPCSTR;
                             lpFormat   : ac_NUMBERFMTA_t;
                             lpNumberStr: Win32.LPSTR;
                             cchNumber  : Win32.INT)
                                          return Win32.INT
                                          renames GetNumberFormatA;
                                                            -- winnls.h:836

    function GetNumberFormatW(Locale     : Win32.Winnt.LCID;
                              dwFlags    : Win32.DWORD;
                              lpValue    : Win32.LPCWSTR;
                              lpFormat   : ac_NUMBERFMTW_t;
                              lpNumberStr: Win32.LPWSTR;
                              cchNumber  : Win32.INT)
                                           return Win32.INT;-- winnls.h:846

    function GetCurrencyFormatA(Locale       : Win32.Winnt.LCID;
                                dwFlags      : Win32.DWORD;
                                lpValue      : Win32.LPCSTR;
                                lpFormat     : ac_CURRENCYFMTA_t;
                                lpCurrencyStr: Win32.LPSTR;
                                cchCurrency  : Win32.INT)
                                               return Win32.INT;
                                                            -- winnls.h:862

    function GetCurrencyFormat(Locale       : Win32.Winnt.LCID;
                               dwFlags      : Win32.DWORD;
                               lpValue      : Win32.LPCSTR;
                               lpFormat     : ac_CURRENCYFMTA_t;
                               lpCurrencyStr: Win32.LPSTR;
                               cchCurrency  : Win32.INT)
                                              return Win32.INT
                                              renames GetCurrencyFormatA;
                                                            -- winnls.h:862

    function GetCurrencyFormatW(Locale       : Win32.Winnt.LCID;
                                dwFlags      : Win32.DWORD;
                                lpValue      : Win32.LPCWSTR;
                                lpFormat     : ac_CURRENCYFMTW_t;
                                lpCurrencyStr: Win32.LPWSTR;
                                cchCurrency  : Win32.INT)
                                               return Win32.INT;
                                                            -- winnls.h:872

    function EnumCalendarInfoA(lpCalInfoEnumProc: CALINFO_ENUMPROCA;
                               Locale           : Win32.Winnt.LCID;
                               Calendar         : CALID;
                               CalType          : Win32.Winnls.CALTYPE)
                                                  return Win32.BOOL;
                                                            -- winnls.h:888

    function EnumCalendarInfo(lpCalInfoEnumProc: CALINFO_ENUMPROCA;
                              Locale           : Win32.Winnt.LCID;
                              Calendar         : CALID;
                              CalType          : Win32.Winnls.CALTYPE)
                                                 return Win32.BOOL
                                                 renames EnumCalendarInfoA;
                                                            -- winnls.h:888

    function EnumCalendarInfoW(lpCalInfoEnumProc: CALINFO_ENUMPROCW;
                               Locale           : Win32.Winnt.LCID;
                               Calendar         : CALID;
                               CalType          : Win32.Winnls.CALTYPE)
                                                  return Win32.BOOL;
                                                            -- winnls.h:896

    function EnumTimeFormatsA(lpTimeFmtEnumProc: TIMEFMT_ENUMPROCA;
                              Locale           : Win32.Winnt.LCID;
                              dwFlags          : Win32.DWORD)
                                                 return Win32.BOOL;
                                                            -- winnls.h:910

    function EnumTimeFormats(lpTimeFmtEnumProc: TIMEFMT_ENUMPROCA;
                             Locale           : Win32.Winnt.LCID;
                             dwFlags          : Win32.DWORD)
                                                return Win32.BOOL
                                                renames EnumTimeFormatsA;
                                                            -- winnls.h:910

    function EnumTimeFormatsW(lpTimeFmtEnumProc: TIMEFMT_ENUMPROCW;
                              Locale           : Win32.Winnt.LCID;
                              dwFlags          : Win32.DWORD)
                                                 return Win32.BOOL;
                                                            -- winnls.h:917

    function EnumDateFormatsA(lpDateFmtEnumProc: DATEFMT_ENUMPROCA;
                              Locale           : Win32.Winnt.LCID;
                              dwFlags          : Win32.DWORD)
                                                 return Win32.BOOL;
                                                            -- winnls.h:930

    function EnumDateFormats(lpDateFmtEnumProc: DATEFMT_ENUMPROCA;
                             Locale           : Win32.Winnt.LCID;
                             dwFlags          : Win32.DWORD)
                                                return Win32.BOOL
                                                renames EnumDateFormatsA;
                                                            -- winnls.h:930

    function EnumDateFormatsW(lpDateFmtEnumProc: DATEFMT_ENUMPROCW;
                              Locale           : Win32.Winnt.LCID;
                              dwFlags          : Win32.DWORD)
                                                 return Win32.BOOL;
                                                            -- winnls.h:937

    function IsValidLocale(Locale : Win32.Winnt.LCID;
                           dwFlags: Win32.DWORD)
                                    return Win32.BOOL;      -- winnls.h:950

    function ConvertDefaultLocale(Locale: Win32.Winnt.LCID) 
        return Win32.Winnt.LCID;                            -- winnls.h:957

    function GetThreadLocale return Win32.Winnt.LCID;               
                                                            -- winnls.h:963

    function SetThreadLocale(Locale: Win32.Winnt.LCID) return Win32.BOOL;
                                                            -- winnls.h:968

    function GetSystemDefaultLangID return Win32.Winnt.LANGID;      
                                                            -- winnls.h:975

    function GetUserDefaultLangID return Win32.Winnt.LANGID;-- winnls.h:980
                                                                
    function GetSystemDefaultLCID return Win32.Winnt.LCID;  -- winnls.h:985
                                                                
    function GetUserDefaultLCID return Win32.Winnt.LCID;    -- winnls.h:990

    function GetStringTypeExA(Locale    : Win32.Winnt.LCID;
                              dwInfoType: Win32.DWORD;
                              lpSrcStr  : Win32.LPCSTR;
                              cchSrc    : Win32.INT;
                              lpCharType: Win32.LPWORD)
                                          return Win32.BOOL;-- winnls.h:1000

    function GetStringTypeEx(Locale    : Win32.Winnt.LCID;
                             dwInfoType: Win32.DWORD;
                             lpSrcStr  : Win32.LPCSTR;
                             cchSrc    : Win32.INT;
                             lpCharType: Win32.LPWORD)
                                         return Win32.BOOL
                                         renames GetStringTypeExA;
                                                            -- winnls.h:1000

    function GetStringTypeExW(Locale    : Win32.Winnt.LCID;
                              dwInfoType: Win32.DWORD;
                              lpSrcStr  : Win32.LPCWSTR;
                              cchSrc    : Win32.INT;
                              lpCharType: Win32.LPWORD)
                                          return Win32.BOOL;-- winnls.h:1009

    function GetStringTypeA(Locale    : Win32.Winnt.LCID;
                            dwInfoType: Win32.DWORD;
                            lpSrcStr  : Win32.LPCSTR;
                            cchSrc    : Win32.INT;
                            lpCharType: Win32.LPWORD)
                                        return Win32.BOOL;  -- winnls.h:1035

    function GetStringTypeW(dwInfoType: Win32.DWORD;
                            lpSrcStr  : Win32.LPCWSTR;
                            cchSrc    : Win32.INT;
                            lpCharType: Win32.LPWORD)
                                        return Win32.BOOL;  -- winnls.h:1045

    function FoldStringA(dwMapFlags: Win32.DWORD;
                         lpSrcStr  : Win32.LPCSTR;
                         cchSrc    : Win32.INT;
                         lpDestStr : Win32.LPSTR;
                         cchDest   : Win32.INT)
                                     return Win32.INT;      -- winnls.h:1055

    function FoldString(dwMapFlags: Win32.DWORD;
                        lpSrcStr  : Win32.LPCSTR;
                        cchSrc    : Win32.INT;
                        lpDestStr : Win32.LPSTR;
                        cchDest   : Win32.INT)
                                    return Win32.INT
                                    renames FoldStringA;    -- winnls.h:1055

    function FoldStringW(dwMapFlags: Win32.DWORD;
                         lpSrcStr  : Win32.LPCWSTR;
                         cchSrc    : Win32.INT;
                         lpDestStr : Win32.LPWSTR;
                         cchDest   : Win32.INT)
                                     return Win32.INT;      -- winnls.h:1064

    function EnumSystemLocalesA(lpLocaleEnumProc: LOCALE_ENUMPROCA;
                                dwFlags         : Win32.DWORD)
                                                  return Win32.BOOL;
                                                            -- winnls.h:1079

    function EnumSystemLocales(lpLocaleEnumProc: LOCALE_ENUMPROCA;
                               dwFlags         : Win32.DWORD)
                                                 return Win32.BOOL
                                                 renames EnumSystemLocalesA;
                                                            -- winnls.h:1079

    function EnumSystemLocalesW(lpLocaleEnumProc: LOCALE_ENUMPROCW;
                                dwFlags         : Win32.DWORD)
                                                  return Win32.BOOL;
                                                            -- winnls.h:1085

    function EnumSystemCodePagesA(lpCodePageEnumProc: CODEPAGE_ENUMPROCA;
                                  dwFlags           : Win32.DWORD)
                                                      return Win32.BOOL;
                                                            -- winnls.h:1097

    function EnumSystemCodePages(
        lpCodePageEnumProc: CODEPAGE_ENUMPROCA;
        dwFlags           : Win32.DWORD)
                            return Win32.BOOL
                            renames EnumSystemCodePagesA;   -- winnls.h:1097

    function EnumSystemCodePagesW(lpCodePageEnumProc: CODEPAGE_ENUMPROCW;
                                  dwFlags           : Win32.DWORD)
                                                      return Win32.BOOL;
                                                            -- winnls.h:1103

private

    pragma Convention(C, CPINFO);                           -- winnls.h:480
    pragma Convention(C, NUMBERFMTA);                       -- winnls.h:491
    pragma Convention(C, NUMBERFMTW);                       -- winnls.h:499
    pragma Convention(C, CURRENCYFMTA);                     -- winnls.h:520
    pragma Convention(C, CURRENCYFMTW);                     -- winnls.h:530

    pragma Import(Stdcall, IsValidCodePage, "IsValidCodePage");   -- winnls.h:625
    pragma Import(Stdcall, GetACP, "GetACP");                     -- winnls.h:631
    pragma Import(Stdcall, GetOEMCP, "GetOEMCP");                 -- winnls.h:636
    pragma Import(Stdcall, GetCPInfo, "GetCPInfo");               -- winnls.h:641
    pragma Import(Stdcall, IsDBCSLeadByte, "IsDBCSLeadByte");     -- winnls.h:648
    pragma Import(Stdcall, IsDBCSLeadByteEx, "IsDBCSLeadByteEx"); -- winnls.h:654
    pragma Import(Stdcall, MultiByteToWideChar, "MultiByteToWideChar");
                                                            -- winnls.h:661
    pragma Import(Stdcall, WideCharToMultiByte, "WideCharToMultiByte");
                                                            -- winnls.h:672
    pragma Import(Stdcall, CompareStringA, "CompareStringA");     -- winnls.h:690
    pragma Import(Stdcall, CompareStringW, "CompareStringW");     -- winnls.h:700
    pragma Import(Stdcall, LCMAPSTRINGA, "LCMapStringA");         -- winnls.h:716
    pragma Import(Stdcall, LCMAPSTRINGW, "LCMapStringW");         -- winnls.h:726
    pragma Import(Stdcall, GetLocaleInfoA, "GetLocaleInfoA");     -- winnls.h:742
    pragma Import(Stdcall, GetLocaleInfoW, "GetLocaleInfoW");     -- winnls.h:750
    pragma Import(Stdcall, SetLocaleInfoA, "SetLocaleInfoA");     -- winnls.h:764
    pragma Import(Stdcall, SetLocaleInfoW, "SetLocaleInfoW");     -- winnls.h:771
    pragma Import(Stdcall, GetTimeFormatA, "GetTimeFormatA");     -- winnls.h:784
    pragma Import(Stdcall, GetTimeFormatW, "GetTimeFormatW");     -- winnls.h:794
    pragma Import(Stdcall, GetDateFormatA, "GetDateFormatA");     -- winnls.h:810
    pragma Import(Stdcall, GetDateFormatW, "GetDateFormatW");     -- winnls.h:820
    pragma Import(Stdcall, GetNumberFormatA, "GetNumberFormatA"); -- winnls.h:836
    pragma Import(Stdcall, GetNumberFormatW, "GetNumberFormatW"); -- winnls.h:846
    pragma Import(Stdcall, GetCurrencyFormatA, "GetCurrencyFormatA");
                                                            -- winnls.h:862
    pragma Import(Stdcall, GetCurrencyFormatW, "GetCurrencyFormatW");
                                                            -- winnls.h:872
    pragma Import(Stdcall, EnumCalendarInfoA, "EnumCalendarInfoA");
                                                            -- winnls.h:888
    pragma Import(Stdcall, EnumCalendarInfoW, "EnumCalendarInfoW");
                                                            -- winnls.h:896
    pragma Import(Stdcall, EnumTimeFormatsA, "EnumTimeFormatsA"); -- winnls.h:910
    pragma Import(Stdcall, EnumTimeFormatsW, "EnumTimeFormatsW"); -- winnls.h:917
    pragma Import(Stdcall, EnumDateFormatsA, "EnumDateFormatsA"); -- winnls.h:930
    pragma Import(Stdcall, EnumDateFormatsW, "EnumDateFormatsW"); -- winnls.h:937
    pragma Import(Stdcall, IsValidLocale, "IsValidLocale");       -- winnls.h:950
    pragma Import(Stdcall, ConvertDefaultLocale, "ConvertDefaultLocale");
                                                            -- winnls.h:957
    pragma Import(Stdcall, GetThreadLocale, "GetThreadLocale");   -- winnls.h:963
    pragma Import(Stdcall, SetThreadLocale, "SetThreadLocale");   -- winnls.h:968
    pragma Import(Stdcall, GetSystemDefaultLangID, "GetSystemDefaultLangID");
                                                            -- winnls.h:975
    pragma Import(Stdcall, GetUserDefaultLangID, "GetUserDefaultLangID");
                                                            -- winnls.h:980
    pragma Import(Stdcall, GetSystemDefaultLCID, "GetSystemDefaultLCID");
                                                            -- winnls.h:985
    pragma Import(Stdcall, GetUserDefaultLCID, "GetUserDefaultLCID");
                                                            -- winnls.h:990
    pragma Import(Stdcall, GetStringTypeExA, "GetStringTypeExA"); -- winnls.h:1000
    pragma Import(Stdcall, GetStringTypeExW, "GetStringTypeExW"); -- winnls.h:1009
    pragma Import(Stdcall, GetStringTypeA, "GetStringTypeA");     -- winnls.h:1035
    pragma Import(Stdcall, GetStringTypeW, "GetStringTypeW");     -- winnls.h:1045
    pragma Import(Stdcall, FoldStringA, "FoldStringA");           -- winnls.h:1055
    pragma Import(Stdcall, FoldStringW, "FoldStringW");           -- winnls.h:1064
    pragma Import(Stdcall, EnumSystemLocalesA, "EnumSystemLocalesA");
                                                            -- winnls.h:1079
    pragma Import(Stdcall, EnumSystemLocalesW, "EnumSystemLocalesW");
                                                            -- winnls.h:1085
    pragma Import(Stdcall, EnumSystemCodePagesA, "EnumSystemCodePagesA");
                                                            -- winnls.h:1097
    pragma Import(Stdcall, EnumSystemCodePagesW, "EnumSystemCodePagesW");
                                                            -- winnls.h:1103

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

end Win32.Winnls;
