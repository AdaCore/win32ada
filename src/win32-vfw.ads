-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Stdarg;
with Win32.Commdlg;
with Win32.Mmsystem;
with Win32.Objbase;
with Win32.Rpcdce;
with Win32.Windef;
with Win32.Winerror;
with Win32.Wingdi;
with Win32.Winnt;
with Win32.Winuser;

package Win32.Vfw is

    ICVERSION                  : constant := 16#104#;       -- vfw.h:111
    BI_1632                    : constant := 16#32333631#;  -- vfw.h:119
    ICERR_OK                   : constant := 0;             -- vfw.h:137
    ICERR_DONTDRAW             : constant := 1;             -- vfw.h:138
    ICERR_NEWPALETTE           : constant := 2;             -- vfw.h:139
    ICERR_GOTOKEYFRAME         : constant := 3;             -- vfw.h:140
    ICERR_STOPDRAWING          : constant := 4;             -- vfw.h:141
    ICERR_UNSUPPORTED          : constant := -1;            -- vfw.h:143
    ICERR_BADFORMAT            : constant := -2;            -- vfw.h:144
    ICERR_MEMORY               : constant := -3;            -- vfw.h:145
    ICERR_INTERNAL             : constant := -4;            -- vfw.h:146
    ICERR_BADFLAGS             : constant := -5;            -- vfw.h:147
    ICERR_BADPARAM             : constant := -6;            -- vfw.h:148
    ICERR_BADSIZE              : constant := -7;            -- vfw.h:149
    ICERR_BADHANDLE            : constant := -8;            -- vfw.h:150
    ICERR_CANTUPDATE           : constant := -9;            -- vfw.h:151
    ICERR_ABORT                : constant := -10;           -- vfw.h:152
    ICERR_ERROR                : constant := -100;          -- vfw.h:153
    ICERR_BADBITDEPTH          : constant := -200;          -- vfw.h:154
    ICERR_BADIMAGESIZE         : constant := -201;          -- vfw.h:155
    ICERR_CUSTOM               : constant := -400;          -- vfw.h:157
    ICMODE_COMPRESS            : constant := 1;             -- vfw.h:162
    ICMODE_DECOMPRESS          : constant := 2;             -- vfw.h:163
    ICMODE_FASTDECOMPRESS      : constant := 3;             -- vfw.h:164
    ICMODE_QUERY               : constant := 4;             -- vfw.h:165
    ICMODE_FASTCOMPRESS        : constant := 5;             -- vfw.h:166
    ICMODE_DRAW                : constant := 8;             -- vfw.h:167
    AVIIF_LIST                 : constant := 16#1#;         -- vfw.h:171
    AVIIF_TWOCC                : constant := 16#2#;         -- vfw.h:172
    AVIIF_KEYFRAME             : constant := 16#10#;        -- vfw.h:173
    ICQUALITY_LOW              : constant := 0;             -- vfw.h:176
    ICQUALITY_HIGH             : constant := 10000;         -- vfw.h:177
    ICQUALITY_DEFAULT          : constant := -1;            -- vfw.h:178
    ICM_USER                   : constant := 16#4000#;      -- vfw.h:183
    ICM_RESERVED               : constant := 16#5000#;      -- vfw.h:185
    ICM_RESERVED_LOW           : constant := 16#5000#;      -- vfw.h:186
    ICM_RESERVED_HIGH          : constant := 16#6000#;      -- vfw.h:187
    ICM_GETSTATE               : constant := 16#5000#;      -- vfw.h:195
    ICM_SETSTATE               : constant := 16#5001#;      -- vfw.h:196
    ICM_GETINFO                : constant := 16#5002#;      -- vfw.h:197
    ICM_CONFIGURE              : constant := 16#500a#;      -- vfw.h:199
    ICM_ABOUT                  : constant := 16#500b#;      -- vfw.h:200
    ICM_GETERRORTEXT           : constant := 16#500c#;      -- vfw.h:202
    ICM_GETFORMATNAME          : constant := 16#5014#;      -- vfw.h:204
    ICM_ENUMFORMATS            : constant := 16#5015#;      -- vfw.h:205
    ICM_GETDEFAULTQUALITY      : constant := 16#501e#;      -- vfw.h:207
    ICM_GETQUALITY             : constant := 16#501f#;      -- vfw.h:208
    ICM_SETQUALITY             : constant := 16#5020#;      -- vfw.h:209
    ICM_SET                    : constant := 16#5028#;      -- vfw.h:211
    ICM_GET                    : constant := 16#5029#;      -- vfw.h:212
    ICM_FRAMERATE              : constant Win32.Mmsystem.FOURCC :=        
                                Win32.Mmsystem.mmioFOURCC('F','r','m','R');
                                                            -- vfw.h:215
    ICM_KEYFRAMERATE           : constant Win32.Mmsystem.FOURCC :=   
                                Win32.Mmsystem.mmioFOURCC('K','e','y','R');
                                                            -- vfw.h:216
    ICM_COMPRESS_GET_FORMAT    : constant := 16#4004#;      -- vfw.h:224
    ICM_COMPRESS_GET_SIZE      : constant := 16#4005#;      -- vfw.h:225
    ICM_COMPRESS_QUERY         : constant := 16#4006#;      -- vfw.h:226
    ICM_COMPRESS_BEGIN         : constant := 16#4007#;      -- vfw.h:227
    ICM_COMPRESS               : constant := 16#4008#;      -- vfw.h:228
    ICM_COMPRESS_END           : constant := 16#4009#;      -- vfw.h:229
    ICM_DECOMPRESS_GET_FORMAT  : constant := 16#400a#;      -- vfw.h:231
    ICM_DECOMPRESS_QUERY       : constant := 16#400b#;      -- vfw.h:232
    ICM_DECOMPRESS_BEGIN       : constant := 16#400c#;      -- vfw.h:233
    ICM_DECOMPRESS             : constant := 16#400d#;      -- vfw.h:234
    ICM_DECOMPRESS_END         : constant := 16#400e#;      -- vfw.h:235
    ICM_DECOMPRESS_SET_PALETTE : constant := 16#401d#;      -- vfw.h:236
    ICM_DECOMPRESS_GET_PALETTE : constant := 16#401e#;      -- vfw.h:237
    ICM_DRAW_QUERY             : constant := 16#401f#;      -- vfw.h:239
    ICM_DRAW_BEGIN             : constant := 16#400f#;      -- vfw.h:240
    ICM_DRAW_GET_PALETTE       : constant := 16#4010#;      -- vfw.h:241
    ICM_DRAW_UPDATE            : constant := 16#4011#;      -- vfw.h:242
    ICM_DRAW_START             : constant := 16#4012#;      -- vfw.h:243
    ICM_DRAW_STOP              : constant := 16#4013#;      -- vfw.h:244
    ICM_DRAW_BITS              : constant := 16#4014#;      -- vfw.h:245
    ICM_DRAW_END               : constant := 16#4015#;      -- vfw.h:246
    ICM_DRAW_GETTIME           : constant := 16#4020#;      -- vfw.h:247
    ICM_DRAW                   : constant := 16#4021#;      -- vfw.h:248
    ICM_DRAW_WINDOW            : constant := 16#4022#;      -- vfw.h:249
    ICM_DRAW_SETTIME           : constant := 16#4023#;      -- vfw.h:250
    ICM_DRAW_REALIZE           : constant := 16#4024#;      -- vfw.h:251
    ICM_DRAW_FLUSH             : constant := 16#4025#;      -- vfw.h:252
    ICM_DRAW_RENDERBUFFER      : constant := 16#4026#;      -- vfw.h:253
    ICM_DRAW_START_PLAY        : constant := 16#4027#;      -- vfw.h:255
    ICM_DRAW_STOP_PLAY         : constant := 16#4028#;      -- vfw.h:256
    ICM_DRAW_SUGGESTFORMAT     : constant := 16#4032#;      -- vfw.h:258
    ICM_DRAW_CHANGEPALETTE     : constant := 16#4033#;      -- vfw.h:259
    ICM_DRAW_IDLE              : constant := 16#4034#;      -- vfw.h:261
    ICM_GETBUFFERSWANTED       : constant := 16#4029#;      -- vfw.h:263
    ICM_GETDEFAULTKEYFRAMERATE : constant := 16#402a#;      -- vfw.h:265
    ICM_DECOMPRESSEX_BEGIN     : constant := 16#403c#;      -- vfw.h:268
    ICM_DECOMPRESSEX_QUERY     : constant := 16#403d#;      -- vfw.h:269
    ICM_DECOMPRESSEX           : constant := 16#403e#;      -- vfw.h:270
    ICM_DECOMPRESSEX_END       : constant := 16#403f#;      -- vfw.h:271
    ICM_COMPRESS_FRAMES_INFO   : constant := 16#4046#;      -- vfw.h:273
    ICM_COMPRESS_FRAMES        : constant := 16#4047#;      -- vfw.h:274
    ICM_SET_STATUS_PROC        : constant := 16#4048#;      -- vfw.h:275
    ICM_ENUM_FORMATS           : constant := 16#4050#;      -- vfw.h:277
    ICM_GET_FORMAT_NAME        : constant := 16#4051#;      -- vfw.h:278
    VIDCF_QUALITY              : constant := 16#1#;         -- vfw.h:311
    VIDCF_CRUNCH               : constant := 16#2#;         -- vfw.h:312
    VIDCF_TEMPORAL             : constant := 16#4#;         -- vfw.h:313
    VIDCF_COMPRESSFRAMES       : constant := 16#8#;         -- vfw.h:314
    VIDCF_DRAW                 : constant := 16#10#;        -- vfw.h:315
    VIDCF_FASTTEMPORALC        : constant := 16#20#;        -- vfw.h:316
    VIDCF_FASTTEMPORALD        : constant := 16#80#;        -- vfw.h:317
    ICCOMPRESS_KEYFRAME        : constant := 16#1#;         -- vfw.h:325
    ICCOMPRESSFRAMES_PADDING   : constant := 16#1#;         -- vfw.h:352
    ICSTATUS_START             : constant := 0;             -- vfw.h:385
    ICSTATUS_STATUS            : constant := 1;             -- vfw.h:386
    ICSTATUS_END               : constant := 2;             -- vfw.h:387
    ICSTATUS_ERROR             : constant := 3;             -- vfw.h:388
    ICSTATUS_YIELD             : constant := 4;             -- vfw.h:389
    ICDECOMPRESS_HURRYUP       : constant := 16#80000000#;  -- vfw.h:398
    ICDECOMPRESS_UPDATE        : constant := 16#40000000#;  -- vfw.h:399
    ICDECOMPRESS_PREROLL       : constant := 16#20000000#;  -- vfw.h:400
    ICDECOMPRESS_NULLFRAME     : constant := 16#10000000#;  -- vfw.h:401
    ICDECOMPRESS_NOTKEYFRAME   : constant := 16#8000000#;   -- vfw.h:402
    ICDRAW_QUERY               : constant := 16#1#;         -- vfw.h:446
    ICDRAW_FULLSCREEN          : constant := 16#2#;         -- vfw.h:447
    ICDRAW_HDC                 : constant := 16#4#;         -- vfw.h:448
    ICDRAW_ANIMATE             : constant := 16#8#;         -- vfw.h:449
    ICDRAW_CONTINUE            : constant := 16#10#;        -- vfw.h:450
    ICDRAW_MEMORYDC            : constant := 16#20#;        -- vfw.h:451
    ICDRAW_UPDATING            : constant := 16#40#;        -- vfw.h:452
    ICDRAW_RENDER              : constant := 16#80#;        -- vfw.h:453
    ICDRAW_BUFFER              : constant := 16#100#;       -- vfw.h:454
    ICDRAW_HURRYUP             : constant := 16#80000000#;  -- vfw.h:483
    ICDRAW_UPDATE              : constant := 16#40000000#;  -- vfw.h:484
    ICDRAW_PREROLL             : constant := 16#20000000#;  -- vfw.h:485
    ICDRAW_NULLFRAME           : constant := 16#10000000#;  -- vfw.h:486
    ICDRAW_NOTKEYFRAME         : constant := 16#8000000#;   -- vfw.h:487
    ICINSTALL_FUNCTION         : constant := 16#1#;         -- vfw.h:541
    ICINSTALL_DRIVER           : constant := 16#2#;         -- vfw.h:542
    ICINSTALL_HDRV             : constant := 16#4#;         -- vfw.h:543
    ICMF_CONFIGURE_QUERY       : constant := 16#1#;         -- vfw.h:550
    ICMF_ABOUT_QUERY           : constant := 16#1#;         -- vfw.h:551
    -- ICDECOMPRESS_HURRYUP    : constant := 16#80000000#;-- vfw.h:684
    -- ICDRAW_QUERY            : constant := 16#1#;     -- vfw.h:908
    -- ICDRAW_FULLSCREEN       : constant := 16#2#;     -- vfw.h:909
    -- ICDRAW_HDC              : constant := 16#4#;     -- vfw.h:910
    -- ICDRAW_HURRYUP          : constant := 16#80000000#;-- vfw.h:937
    -- ICDRAW_UPDATE           : constant := 16#40000000#;-- vfw.h:938
    ICMF_COMPVARS_VALID        : constant := 16#1#;         -- vfw.h:1119
    ICMF_CHOOSE_KEYFRAME       : constant := 16#1#;         -- vfw.h:1133
    ICMF_CHOOSE_DATARATE       : constant := 16#2#;         -- vfw.h:1134
    ICMF_CHOOSE_PREVIEW        : constant := 16#4#;         -- vfw.h:1135
    ICMF_CHOOSE_ALLCOMPRESSORS : constant := 16#8#;         -- vfw.h:1136
    DDF_0001                   : constant := 16#1#;         -- vfw.h:1169
    DDF_UPDATE                 : constant := 16#2#;         -- vfw.h:1170
    DDF_SAME_HDC               : constant := 16#4#;         -- vfw.h:1171
    DDF_SAME_DRAW              : constant := 16#8#;         -- vfw.h:1172
    DDF_DONTDRAW               : constant := 16#10#;        -- vfw.h:1173
    DDF_ANIMATE                : constant := 16#20#;        -- vfw.h:1174
    DDF_BUFFER                 : constant := 16#40#;        -- vfw.h:1175
    DDF_JUSTDRAWIT             : constant := 16#80#;        -- vfw.h:1176
    DDF_FULLSCREEN             : constant := 16#100#;       -- vfw.h:1177
    DDF_BACKGROUNDPAL          : constant := 16#200#;       -- vfw.h:1178
    DDF_NOTKEYFRAME            : constant := 16#400#;       -- vfw.h:1179
    DDF_HURRYUP                : constant := 16#800#;       -- vfw.h:1180
    DDF_HALFTONE               : constant := 16#1000#;      -- vfw.h:1181
    DDF_2000                   : constant := 16#2000#;      -- vfw.h:1182
    DDF_PREROLL                : constant := 16#10#;        -- vfw.h:1184
    DDF_SAME_DIB               : constant := 16#8#;         -- vfw.h:1185
    DDF_SAME_SIZE              : constant := 16#8#;         -- vfw.h:1186
    PD_CAN_DRAW_DIB            : constant := 16#1#;         -- vfw.h:1331
    PD_CAN_STRETCHDIB          : constant := 16#2#;         -- vfw.h:1332
    PD_STRETCHDIB_1_1_OK       : constant := 16#4#;         -- vfw.h:1333
    PD_STRETCHDIB_1_2_OK       : constant := 16#8#;         -- vfw.h:1334
    PD_STRETCHDIB_1_N_OK       : constant := 16#10#;        -- vfw.h:1335
    formtypeAVI                : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('A','V','I',' ');
                                                            -- vfw.h:1435
    listtypeAVIHEADER          : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('h','d','r','l');
                                                            -- vfw.h:1436
    ckidAVIMAINHDR             : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('a','v','i','h');
                                                            -- vfw.h:1437
    listtypeSTREAMHEADER       : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('s','t','r','l');
                                                            -- vfw.h:1438
    ckidSTREAMHEADER           : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('s','t','r','h');
                                                            -- vfw.h:1439
    ckidSTREAMFORMAT           : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('s','t','r','f');
                                                            -- vfw.h:1440
    ckidSTREAMHANDLERDATA      : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('s','t','r','d');
                                                            -- vfw.h:1441
    ckidSTREAMNAME             : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('s','t','r','n');
                                                            -- vfw.h:1442
    listtypeAVIMOVIE           : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('m','o','v','i');
                                                            -- vfw.h:1444
    listtypeAVIRECORD          : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('r','e','c',' ');
                                                            -- vfw.h:1445
    ckidAVINEWINDEX            : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('i','d','x','1');
                                                            -- vfw.h:1447
    streamtypeVIDEO            : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('v','i','d','s');
                                                            -- vfw.h:1452
    streamtypeAUDIO            : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('a','u','d','s');
                                                            -- vfw.h:1453
    streamtypeMIDI             : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('m','i','d','s');
                                                            -- vfw.h:1454
    streamtypeTEXT             : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('t','x','t','s');
                                                            -- vfw.h:1455
 
    AVIF_HASINDEX              : constant := 16#10#;        -- vfw.h:1496
    AVIF_MUSTUSEINDEX          : constant := 16#20#;        -- vfw.h:1497
    AVIF_ISINTERLEAVED         : constant := 16#100#;       -- vfw.h:1498
    AVIF_WASCAPTUREFILE        : constant := 16#10000#;     -- vfw.h:1499
    AVIF_COPYRIGHTED           : constant := 16#20000#;     -- vfw.h:1500
    AVI_HEADERSIZE             : constant := 2048;          -- vfw.h:1503
    AVISF_DISABLED             : constant := 16#1#;         -- vfw.h:1528
    AVISF_VIDEO_PALCHANGES     : constant := 16#10000#;     -- vfw.h:1530
    -- AVIIF_LIST              : constant := 16#1#;     -- vfw.h:1550
    -- AVIIF_KEYFRAME          : constant := 16#10#;    -- vfw.h:1551
    AVIIF_FIRSTPART            : constant := 16#20#;        -- vfw.h:1552
    AVIIF_LASTPART             : constant := 16#40#;        -- vfw.h:1553
    AVIIF_MIDPART              : constant := 16#60#;        -- vfw.h:1554
    AVIIF_NOTIME               : constant := 16#100#;       -- vfw.h:1556
    AVIIF_COMPUSE              : constant := 16#fff0000#;   -- vfw.h:1557
    AVISTREAMINFO_DISABLED     : constant := 16#1#;         -- vfw.h:1706
    AVISTREAMINFO_FORMATCHANGES: constant := 16#10000#;     -- vfw.h:1707
    AVIFILEINFO_HASINDEX       : constant := 16#10#;        -- vfw.h:1763
    AVIFILEINFO_MUSTUSEINDEX   : constant := 16#20#;        -- vfw.h:1764
    AVIFILEINFO_ISINTERLEAVED  : constant := 16#100#;       -- vfw.h:1765
    AVIFILEINFO_WASCAPTUREFILE : constant := 16#10000#;     -- vfw.h:1766
    AVIFILEINFO_COPYRIGHTED    : constant := 16#20000#;     -- vfw.h:1767
    AVIFILECAPS_CANREAD        : constant := 16#1#;         -- vfw.h:1770
    AVIFILECAPS_CANWRITE       : constant := 16#2#;         -- vfw.h:1771
    AVIFILECAPS_ALLKEYFRAMES   : constant := 16#10#;        -- vfw.h:1772
    AVIFILECAPS_NOCOMPRESSION  : constant := 16#20#;        -- vfw.h:1773
    AVICOMPRESSF_INTERLEAVE    : constant := 16#1#;         -- vfw.h:1802
    AVICOMPRESSF_DATARATE      : constant := 16#2#;         -- vfw.h:1803
    AVICOMPRESSF_KEYFRAMES     : constant := 16#4#;         -- vfw.h:1804
    AVICOMPRESSF_VALID         : constant := 16#8#;         -- vfw.h:1805
    AVIFILEHANDLER_CANREAD     : constant := 16#1#;         -- vfw.h:2020
    AVIFILEHANDLER_CANWRITE    : constant := 16#2#;         -- vfw.h:2021
    AVIFILEHANDLER_CANACCEPTNONRGB     : constant := 16#4#; -- vfw.h:2022
    AVISTREAMREAD_CONVENIENT   : constant := -1;            -- vfw.h:2105
    FIND_DIR                   : constant := 16#f#;         -- vfw.h:2163
    FIND_NEXT                  : constant := 16#1#;         -- vfw.h:2164
    FIND_PREV                  : constant := 16#4#;         -- vfw.h:2165
    FIND_TYPE                  : constant := 16#f0#;        -- vfw.h:2167
    FIND_KEY                   : constant := 16#10#;        -- vfw.h:2168
    FIND_ANY                   : constant := 16#20#;        -- vfw.h:2169
    FIND_FORMAT                : constant := 16#40#;        -- vfw.h:2170
    FIND_RET                   : constant := 16#f000#;      -- vfw.h:2172
    FIND_POS                   : constant := 16#0#;         -- vfw.h:2173
    FIND_LENGTH                : constant := 16#1000#;      -- vfw.h:2174
    FIND_OFFSET                : constant := 16#2000#;      -- vfw.h:2175
    FIND_SIZE                  : constant := 16#3000#;      -- vfw.h:2176
    FIND_INDEX                 : constant := 16#4000#;      -- vfw.h:2177
    SEARCH_NEAREST             : constant := 16#4#;         -- vfw.h:2191
    SEARCH_BACKWARD            : constant := 16#4#;         -- vfw.h:2192
    SEARCH_FORWARD             : constant := 16#1#;         -- vfw.h:2193
    SEARCH_KEY                 : constant := 16#10#;        -- vfw.h:2194
    SEARCH_ANY                 : constant := 16#20#;        -- vfw.h:2195
    comptypeDIB                : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC('D','I','B',' ');
                                                            -- vfw.h:2270
    AVIERR_OK                  : constant := 0;             -- vfw.h:2390
    MCIWNDOPENF_NEW            : constant := 16#1#;         -- vfw.h:2521
    MCIWNDF_NOAUTOSIZEWINDOW   : constant := 16#1#;         -- vfw.h:2524
    MCIWNDF_NOPLAYBAR          : constant := 16#2#;         -- vfw.h:2525
    MCIWNDF_NOAUTOSIZEMOVIE    : constant := 16#4#;         -- vfw.h:2526
    MCIWNDF_NOMENU             : constant := 16#8#;         -- vfw.h:2527
    MCIWNDF_SHOWNAME           : constant := 16#10#;        -- vfw.h:2528
    MCIWNDF_SHOWPOS            : constant := 16#20#;        -- vfw.h:2529
    MCIWNDF_SHOWMODE           : constant := 16#40#;        -- vfw.h:2530
    MCIWNDF_SHOWALL            : constant := 16#70#;        -- vfw.h:2531
    MCIWNDF_NOTIFYANSI         : constant := 16#80#;        -- vfw.h:2539
    MCIWNDF_NOTIFYMODEW        : constant := 16#100#;       -- vfw.h:2541
    MCIWNDF_NOTIFYPOSW         : constant := 16#200#;       -- vfw.h:2542
    MCIWNDF_NOTIFYSIZEW        : constant := 16#400#;       -- vfw.h:2543
    MCIWNDF_NOTIFYMEDIAW       : constant := 16#800#;       -- vfw.h:2544
    MCIWNDF_NOTIFYERRORW       : constant := 16#1000#;      -- vfw.h:2545
    MCIWNDF_NOTIFYALLW         : constant := 16#1f00#;      -- vfw.h:2546
    MCIWNDF_NOTIFYMODEA        : constant := 16#180#;       -- vfw.h:2548
    MCIWNDF_NOTIFYPOSA         : constant := 16#280#;       -- vfw.h:2549
    MCIWNDF_NOTIFYSIZEA        : constant := 16#480#;       -- vfw.h:2550
    MCIWNDF_NOTIFYMEDIAA       : constant := 16#880#;       -- vfw.h:2551
    MCIWNDF_NOTIFYERRORA       : constant := 16#1080#;      -- vfw.h:2552
    MCIWNDF_NOTIFYALLA         : constant := 16#1f80#;      -- vfw.h:2553
    MCIWNDF_NOTIFYMODE         : constant := 16#180#;       -- vfw.h:2563
    MCIWNDF_NOTIFYPOS          : constant := 16#280#;       -- vfw.h:2564
    MCIWNDF_NOTIFYSIZE         : constant := 16#480#;       -- vfw.h:2565
    MCIWNDF_NOTIFYMEDIA        : constant := 16#880#;       -- vfw.h:2566
    MCIWNDF_NOTIFYERROR        : constant := 16#1080#;      -- vfw.h:2567
    MCIWNDF_NOTIFYALL          : constant := 16#1f80#;      -- vfw.h:2568
    MCIWNDF_RECORD             : constant := 16#2000#;      -- vfw.h:2573
    MCIWNDF_NOERRORDLG         : constant := 16#4000#;      -- vfw.h:2574
    MCIWNDF_NOOPEN             : constant := 16#8000#;      -- vfw.h:2575
    MCIWNDM_GETDEVICEID        : constant := 16#464#;       -- vfw.h:2690
    MCIWNDM_GETSTART           : constant := 16#467#;       -- vfw.h:2691
    MCIWNDM_GETLENGTH          : constant := 16#468#;       -- vfw.h:2692
    MCIWNDM_GETEND             : constant := 16#469#;       -- vfw.h:2693
    MCIWNDM_EJECT              : constant := 16#46b#;       -- vfw.h:2694
    MCIWNDM_SETZOOM            : constant := 16#46c#;       -- vfw.h:2695
    MCIWNDM_GETZOOM            : constant := 16#46d#;       -- vfw.h:2696
    MCIWNDM_SETVOLUME          : constant := 16#46e#;       -- vfw.h:2697
    MCIWNDM_GETVOLUME          : constant := 16#46f#;       -- vfw.h:2698
    MCIWNDM_SETSPEED           : constant := 16#470#;       -- vfw.h:2699
    MCIWNDM_GETSPEED           : constant := 16#471#;       -- vfw.h:2700
    MCIWNDM_SETREPEAT          : constant := 16#472#;       -- vfw.h:2701
    MCIWNDM_GETREPEAT          : constant := 16#473#;       -- vfw.h:2702
    MCIWNDM_REALIZE            : constant := 16#476#;       -- vfw.h:2703
    MCIWNDM_VALIDATEMEDIA      : constant := 16#479#;       -- vfw.h:2704
    MCIWNDM_PLAYFROM           : constant := 16#47a#;       -- vfw.h:2705
    MCIWNDM_PLAYTO             : constant := 16#47b#;       -- vfw.h:2706
    MCIWNDM_GETPALETTE         : constant := 16#47e#;       -- vfw.h:2707
    MCIWNDM_SETPALETTE         : constant := 16#47f#;       -- vfw.h:2708
    MCIWNDM_SETTIMERS          : constant := 16#481#;       -- vfw.h:2709
    MCIWNDM_SETACTIVETIMER     : constant := 16#482#;       -- vfw.h:2710
    MCIWNDM_SETINACTIVETIMER   : constant := 16#483#;       -- vfw.h:2711
    MCIWNDM_GETACTIVETIMER     : constant := 16#484#;       -- vfw.h:2712
    MCIWNDM_GETINACTIVETIMER   : constant := 16#485#;       -- vfw.h:2713
    MCIWNDM_CHANGESTYLES       : constant := 16#487#;       -- vfw.h:2714
    MCIWNDM_GETSTYLES          : constant := 16#488#;       -- vfw.h:2715
    MCIWNDM_GETALIAS           : constant := 16#489#;       -- vfw.h:2716
    MCIWNDM_PLAYREVERSE        : constant := 16#48b#;       -- vfw.h:2717
    MCIWNDM_GET_SOURCE         : constant := 16#48c#;       -- vfw.h:2718
    MCIWNDM_PUT_SOURCE         : constant := 16#48d#;       -- vfw.h:2719
    MCIWNDM_GET_DEST           : constant := 16#48e#;       -- vfw.h:2720
    MCIWNDM_PUT_DEST           : constant := 16#48f#;       -- vfw.h:2721
    MCIWNDM_CAN_PLAY           : constant := 16#490#;       -- vfw.h:2722
    MCIWNDM_CAN_WINDOW         : constant := 16#491#;       -- vfw.h:2723
    MCIWNDM_CAN_RECORD         : constant := 16#492#;       -- vfw.h:2724
    MCIWNDM_CAN_SAVE           : constant := 16#493#;       -- vfw.h:2725
    MCIWNDM_CAN_EJECT          : constant := 16#494#;       -- vfw.h:2726
    MCIWNDM_CAN_CONFIG         : constant := 16#495#;       -- vfw.h:2727
    MCIWNDM_PALETTEKICK        : constant := 16#496#;       -- vfw.h:2728
    MCIWNDM_OPENINTERFACE      : constant := 16#497#;       -- vfw.h:2729
    MCIWNDM_SETOWNER           : constant := 16#498#;       -- vfw.h:2730
    MCIWNDM_SENDSTRINGA        : constant := 16#465#;       -- vfw.h:2735
    MCIWNDM_GETPOSITIONA       : constant := 16#466#;       -- vfw.h:2736
    MCIWNDM_GETMODEA           : constant := 16#46a#;       -- vfw.h:2737
    MCIWNDM_SETTIMEFORMATA     : constant := 16#477#;       -- vfw.h:2738
    MCIWNDM_GETTIMEFORMATA     : constant := 16#478#;       -- vfw.h:2739
    MCIWNDM_GETFILENAMEA       : constant := 16#47c#;       -- vfw.h:2740
    MCIWNDM_GETDEVICEA         : constant := 16#47d#;       -- vfw.h:2741
    MCIWNDM_GETERRORA          : constant := 16#480#;       -- vfw.h:2742
    MCIWNDM_NEWA               : constant := 16#486#;       -- vfw.h:2743
    MCIWNDM_RETURNSTRINGA      : constant := 16#48a#;       -- vfw.h:2744
    MCIWNDM_OPENA              : constant := 16#499#;       -- vfw.h:2745
    MCIWNDM_SENDSTRINGW        : constant := 16#4c9#;       -- vfw.h:2747
    MCIWNDM_GETPOSITIONW       : constant := 16#4ca#;       -- vfw.h:2748
    MCIWNDM_GETMODEW           : constant := 16#4ce#;       -- vfw.h:2749
    MCIWNDM_SETTIMEFORMATW     : constant := 16#4db#;       -- vfw.h:2750
    MCIWNDM_GETTIMEFORMATW     : constant := 16#4dc#;       -- vfw.h:2751
    MCIWNDM_GETFILENAMEW       : constant := 16#4e0#;       -- vfw.h:2752
    MCIWNDM_GETDEVICEW         : constant := 16#4e1#;       -- vfw.h:2753
    MCIWNDM_GETERRORW          : constant := 16#4e4#;       -- vfw.h:2754
    MCIWNDM_NEWW               : constant := 16#4ea#;       -- vfw.h:2755
    MCIWNDM_RETURNSTRINGW      : constant := 16#4ee#;       -- vfw.h:2756
    MCIWNDM_OPENW              : constant := 16#4fc#;       -- vfw.h:2757
    MCIWNDM_SENDSTRING         : constant := 16#465#;       -- vfw.h:2773
    MCIWNDM_GETPOSITION        : constant := 16#466#;       -- vfw.h:2774
    MCIWNDM_GETMODE            : constant := 16#46a#;       -- vfw.h:2775
    MCIWNDM_SETTIMEFORMAT      : constant := 16#477#;       -- vfw.h:2776
    MCIWNDM_GETTIMEFORMAT      : constant := 16#478#;       -- vfw.h:2777
    MCIWNDM_GETFILENAME        : constant := 16#47c#;       -- vfw.h:2778
    MCIWNDM_GETDEVICE          : constant := 16#47d#;       -- vfw.h:2779
    MCIWNDM_GETERROR           : constant := 16#480#;       -- vfw.h:2780
    MCIWNDM_NEW                : constant := 16#486#;       -- vfw.h:2781
    MCIWNDM_RETURNSTRING       : constant := 16#48a#;       -- vfw.h:2782
    MCIWNDM_OPEN               : constant := 16#499#;       -- vfw.h:2783
    MCIWNDM_NOTIFYMODE         : constant := 16#4c8#;       -- vfw.h:2799
    MCIWNDM_NOTIFYPOS          : constant := 16#4c9#;       -- vfw.h:2800
    MCIWNDM_NOTIFYSIZE         : constant := 16#4ca#;       -- vfw.h:2801
    MCIWNDM_NOTIFYMEDIA        : constant := 16#4cb#;       -- vfw.h:2802
    MCIWNDM_NOTIFYERROR        : constant := 16#4cd#;       -- vfw.h:2803
    MCIWND_START               : constant := -1;            -- vfw.h:2806
    MCIWND_END                 : constant := -2;            -- vfw.h:2807
    DV_ERR_OK                  : constant := 0;             -- vfw.h:2872
    DV_ERR_BASE                : constant := 1;             -- vfw.h:2873
    DV_ERR_NONSPECIFIC         : constant := 1;             -- vfw.h:2874
    DV_ERR_BADFORMAT           : constant := 2;             -- vfw.h:2875
    DV_ERR_STILLPLAYING        : constant := 3;             -- vfw.h:2877
    DV_ERR_UNPREPARED          : constant := 4;             -- vfw.h:2879
    DV_ERR_SYNC                : constant := 5;             -- vfw.h:2881
    DV_ERR_TOOMANYCHANNELS     : constant := 6;             -- vfw.h:2883
    DV_ERR_NOTDETECTED         : constant := 7;             -- vfw.h:2885
    DV_ERR_BADINSTALL          : constant := 8;             -- vfw.h:2886
    DV_ERR_CREATEPALETTE       : constant := 9;             -- vfw.h:2887
    DV_ERR_SIZEFIELD           : constant := 10;            -- vfw.h:2888
    DV_ERR_PARAM1              : constant := 11;            -- vfw.h:2889
    DV_ERR_PARAM2              : constant := 12;            -- vfw.h:2890
    DV_ERR_CONFIG1             : constant := 13;            -- vfw.h:2891
    DV_ERR_CONFIG2             : constant := 14;            -- vfw.h:2892
    DV_ERR_FLAGS               : constant := 15;            -- vfw.h:2893
    DV_ERR_13                  : constant := 16;            -- vfw.h:2894
    DV_ERR_NOTSUPPORTED        : constant := 17;            -- vfw.h:2896
    DV_ERR_NOMEM               : constant := 18;            -- vfw.h:2897
    DV_ERR_ALLOCATED           : constant := 19;            -- vfw.h:2898
    DV_ERR_BADDEVICEID         : constant := 20;            -- vfw.h:2899
    DV_ERR_INVALHANDLE         : constant := 21;            -- vfw.h:2900
    DV_ERR_BADERRNUM           : constant := 22;            -- vfw.h:2901
    DV_ERR_NO_BUFFERS          : constant := 23;            -- vfw.h:2902
    DV_ERR_MEM_CONFLICT        : constant := 24;            -- vfw.h:2904
    DV_ERR_IO_CONFLICT         : constant := 25;            -- vfw.h:2905
    DV_ERR_DMA_CONFLICT        : constant := 26;            -- vfw.h:2906
    DV_ERR_INT_CONFLICT        : constant := 27;            -- vfw.h:2907
    DV_ERR_PROTECT_ONLY        : constant := 28;            -- vfw.h:2908
    DV_ERR_LASTERROR           : constant := 28;            -- vfw.h:2909
    DV_ERR_USER_MSG            : constant := 1001;          -- vfw.h:2914
    MM_DRVM_OPEN               : constant := 16#3d0#;       -- vfw.h:2927
    MM_DRVM_CLOSE              : constant := 16#3d1#;       -- vfw.h:2928
    MM_DRVM_DATA               : constant := 16#3d2#;       -- vfw.h:2929
    MM_DRVM_ERROR              : constant := 16#3d3#;       -- vfw.h:2930
    DV_VM_OPEN                 : constant := 16#3d0#;       -- vfw.h:2933
    DV_VM_CLOSE                : constant := 16#3d1#;       -- vfw.h:2934
    DV_VM_DATA                 : constant := 16#3d2#;       -- vfw.h:2935
    DV_VM_ERROR                : constant := 16#3d3#;       -- vfw.h:2936
    VHDR_DONE                  : constant := 16#1#;         -- vfw.h:2955
    VHDR_PREPARED              : constant := 16#2#;         -- vfw.h:2956
    VHDR_INQUEUE               : constant := 16#4#;         -- vfw.h:2957
    VHDR_KEYFRAME              : constant := 16#8#;         -- vfw.h:2958
    VHDR_VALID                 : constant := 16#f#;         -- vfw.h:2959
    VCAPS_OVERLAY              : constant := 16#1#;         -- vfw.h:2975
    VCAPS_SRC_CAN_CLIP         : constant := 16#2#;         -- vfw.h:2976
    VCAPS_DST_CAN_CLIP         : constant := 16#4#;         -- vfw.h:2977
    VCAPS_CAN_SCALE            : constant := 16#8#;         -- vfw.h:2978
    VIDEO_EXTERNALIN           : constant := 16#1#;         -- vfw.h:2988
    VIDEO_EXTERNALOUT          : constant := 16#2#;         -- vfw.h:2989
    VIDEO_IN                   : constant := 16#4#;         -- vfw.h:2990
    VIDEO_OUT                  : constant := 16#8#;         -- vfw.h:2991
    VIDEO_DLG_QUERY            : constant := 16#10#;        -- vfw.h:2994
    VIDEO_CONFIGURE_QUERY      : constant := 16#8000#;      -- vfw.h:2997
    VIDEO_CONFIGURE_SET        : constant := 16#1000#;      -- vfw.h:3000
    VIDEO_CONFIGURE_GET        : constant := 16#2000#;      -- vfw.h:3003
    VIDEO_CONFIGURE_QUERYSIZE  : constant := 16#1#;         -- vfw.h:3004
    VIDEO_CONFIGURE_CURRENT    : constant := 16#10#;        -- vfw.h:3006
    VIDEO_CONFIGURE_NOMINAL    : constant := 16#20#;        -- vfw.h:3007
    VIDEO_CONFIGURE_MIN        : constant := 16#40#;        -- vfw.h:3008
    VIDEO_CONFIGURE_MAX        : constant := 16#80#;        -- vfw.h:3009
    DVM_USER                   : constant := 16#4000#;      -- vfw.h:3016
    DVM_CONFIGURE_START        : constant := 16#1000#;      -- vfw.h:3018
    DVM_CONFIGURE_END          : constant := 16#1fff#;      -- vfw.h:3019
    DVM_PALETTE                : constant := 16#1001#;      -- vfw.h:3021
    DVM_FORMAT                 : constant := 16#1002#;      -- vfw.h:3022
    DVM_PALETTERGB555          : constant := 16#1003#;      -- vfw.h:3023
    DVM_SRC_RECT               : constant := 16#1004#;      -- vfw.h:3024
    DVM_DST_RECT               : constant := 16#1005#;      -- vfw.h:3025
    WM_CAP_START               : constant := 16#400#;       -- vfw.h:3067
    WM_CAP_UNICODE_START       : constant := 16#464#;       -- vfw.h:3070
    WM_CAP_GET_CAPSTREAMPTR    : constant := 16#401#;       -- vfw.h:3072
    WM_CAP_SET_CALLBACK_ERRORW : constant := 16#466#;       -- vfw.h:3074
    WM_CAP_SET_CALLBACK_STATUSW: constant := 16#467#;       -- vfw.h:3075
    WM_CAP_SET_CALLBACK_ERRORA : constant := 16#402#;       -- vfw.h:3076
    WM_CAP_SET_CALLBACK_STATUSA: constant := 16#403#;       -- vfw.h:3077
    WM_CAP_SET_CALLBACK_ERROR  : constant := 16#402#;       -- vfw.h:3082
    WM_CAP_SET_CALLBACK_STATUS : constant := 16#403#;       -- vfw.h:3083
    WM_CAP_SET_CALLBACK_YIELD  : constant := 16#404#;       -- vfw.h:3087
    WM_CAP_SET_CALLBACK_FRAME  : constant := 16#405#;       -- vfw.h:3088
    WM_CAP_SET_CALLBACK_VIDEOSTREAM    : constant := 16#406#;
                                                            -- vfw.h:3089
    WM_CAP_SET_CALLBACK_WAVESTREAM     : constant := 16#407#;
                                                            -- vfw.h:3090
    WM_CAP_GET_USER_DATA       : constant := 16#408#;       -- vfw.h:3091
    WM_CAP_SET_USER_DATA       : constant := 16#409#;       -- vfw.h:3092
    WM_CAP_DRIVER_CONNECT      : constant := 16#40a#;       -- vfw.h:3094
    WM_CAP_DRIVER_DISCONNECT   : constant := 16#40b#;       -- vfw.h:3095
    WM_CAP_DRIVER_GET_NAMEA    : constant := 16#40c#;       -- vfw.h:3097
    WM_CAP_DRIVER_GET_VERSIONA : constant := 16#40d#;       -- vfw.h:3098
    WM_CAP_DRIVER_GET_NAMEW    : constant := 16#470#;       -- vfw.h:3099
    WM_CAP_DRIVER_GET_VERSIONW : constant := 16#471#;       -- vfw.h:3100
    WM_CAP_DRIVER_GET_NAME     : constant := 16#40c#;       -- vfw.h:3105
    WM_CAP_DRIVER_GET_VERSION  : constant := 16#40d#;       -- vfw.h:3106
    WM_CAP_DRIVER_GET_CAPS     : constant := 16#40e#;       -- vfw.h:3109
    WM_CAP_FILE_SET_CAPTURE_FILEA      : constant := 16#414#;
                                                            -- vfw.h:3111
    WM_CAP_FILE_GET_CAPTURE_FILEA      : constant := 16#415#;
                                                            -- vfw.h:3112
    WM_CAP_FILE_SAVEASA        : constant := 16#417#;       -- vfw.h:3113
    WM_CAP_FILE_SAVEDIBA       : constant := 16#419#;       -- vfw.h:3114
    WM_CAP_FILE_SET_CAPTURE_FILEW      : constant := 16#478#;
                                                            -- vfw.h:3115
    WM_CAP_FILE_GET_CAPTURE_FILEW      : constant := 16#479#;
                                                            -- vfw.h:3116
    WM_CAP_FILE_SAVEASW        : constant := 16#47b#;       -- vfw.h:3117
    WM_CAP_FILE_SAVEDIBW       : constant := 16#47d#;       -- vfw.h:3118
    WM_CAP_FILE_SET_CAPTURE_FILE       : constant := 16#414#;
                                                            -- vfw.h:3125
    WM_CAP_FILE_GET_CAPTURE_FILE       : constant := 16#415#;
                                                            -- vfw.h:3126
    WM_CAP_FILE_SAVEAS         : constant := 16#417#;       -- vfw.h:3127
    WM_CAP_FILE_SAVEDIB        : constant := 16#419#;       -- vfw.h:3128
    WM_CAP_FILE_ALLOCATE       : constant := 16#416#;       -- vfw.h:3132
    WM_CAP_FILE_SET_INFOCHUNK  : constant := 16#418#;       -- vfw.h:3133
    WM_CAP_EDIT_COPY           : constant := 16#41e#;       -- vfw.h:3135
    WM_CAP_SET_AUDIOFORMAT     : constant := 16#423#;       -- vfw.h:3137
    WM_CAP_GET_AUDIOFORMAT     : constant := 16#424#;       -- vfw.h:3138
    WM_CAP_DLG_VIDEOFORMAT     : constant := 16#429#;       -- vfw.h:3140
    WM_CAP_DLG_VIDEOSOURCE     : constant := 16#42a#;       -- vfw.h:3141
    WM_CAP_DLG_VIDEODISPLAY    : constant := 16#42b#;       -- vfw.h:3142
    WM_CAP_GET_VIDEOFORMAT     : constant := 16#42c#;       -- vfw.h:3143
    WM_CAP_SET_VIDEOFORMAT     : constant := 16#42d#;       -- vfw.h:3144
    WM_CAP_DLG_VIDEOCOMPRESSION: constant := 16#42e#;       -- vfw.h:3145
    WM_CAP_SET_PREVIEW         : constant := 16#432#;       -- vfw.h:3147
    WM_CAP_SET_OVERLAY         : constant := 16#433#;       -- vfw.h:3148
    WM_CAP_SET_PREVIEWRATE     : constant := 16#434#;       -- vfw.h:3149
    WM_CAP_SET_SCALE           : constant := 16#435#;       -- vfw.h:3150
    WM_CAP_GET_STATUS          : constant := 16#436#;       -- vfw.h:3151
    WM_CAP_SET_SCROLL          : constant := 16#437#;       -- vfw.h:3152
    WM_CAP_GRAB_FRAME          : constant := 16#43c#;       -- vfw.h:3154
    WM_CAP_GRAB_FRAME_NOSTOP   : constant := 16#43d#;       -- vfw.h:3155
    WM_CAP_SEQUENCE            : constant := 16#43e#;       -- vfw.h:3157
    WM_CAP_SEQUENCE_NOFILE     : constant := 16#43f#;       -- vfw.h:3158
    WM_CAP_SET_SEQUENCE_SETUP  : constant := 16#440#;       -- vfw.h:3159
    WM_CAP_GET_SEQUENCE_SETUP  : constant := 16#441#;       -- vfw.h:3160
    WM_CAP_SET_MCI_DEVICEA     : constant := 16#442#;       -- vfw.h:3162
    WM_CAP_GET_MCI_DEVICEA     : constant := 16#443#;       -- vfw.h:3163
    WM_CAP_SET_MCI_DEVICEW     : constant := 16#4a6#;       -- vfw.h:3164
    WM_CAP_GET_MCI_DEVICEW     : constant := 16#4a7#;       -- vfw.h:3165
    WM_CAP_SET_MCI_DEVICE      : constant := 16#442#;       -- vfw.h:3170
    WM_CAP_GET_MCI_DEVICE      : constant := 16#443#;       -- vfw.h:3171
    WM_CAP_STOP                : constant := 16#444#;       -- vfw.h:3176
    WM_CAP_ABORT               : constant := 16#445#;       -- vfw.h:3177
    WM_CAP_SINGLE_FRAME_OPEN   : constant := 16#446#;       -- vfw.h:3179
    WM_CAP_SINGLE_FRAME_CLOSE  : constant := 16#447#;       -- vfw.h:3180
    WM_CAP_SINGLE_FRAME        : constant := 16#448#;       -- vfw.h:3181
    WM_CAP_PAL_OPENA           : constant := 16#450#;       -- vfw.h:3183
    WM_CAP_PAL_SAVEA           : constant := 16#451#;       -- vfw.h:3184
    WM_CAP_PAL_OPENW           : constant := 16#4b4#;       -- vfw.h:3185
    WM_CAP_PAL_SAVEW           : constant := 16#4b5#;       -- vfw.h:3186
    WM_CAP_PAL_OPEN            : constant := 16#450#;       -- vfw.h:3191
    WM_CAP_PAL_SAVE            : constant := 16#451#;       -- vfw.h:3192
    WM_CAP_PAL_PASTE           : constant := 16#452#;       -- vfw.h:3195
    WM_CAP_PAL_AUTOCREATE      : constant := 16#453#;       -- vfw.h:3196
    WM_CAP_PAL_MANUALCREATE    : constant := 16#454#;       -- vfw.h:3197
    WM_CAP_SET_CALLBACK_CAPCONTROL     : constant := 16#455#;
                                                            -- vfw.h:3200
    WM_CAP_UNICODE_END         : constant := 16#4b5#;       -- vfw.h:3204
    WM_CAP_END                 : constant := 16#4b5#;       -- vfw.h:3205
    CONTROLCALLBACK_PREROLL    : constant := 1;             -- vfw.h:3383
    CONTROLCALLBACK_CAPTURING  : constant := 2;             -- vfw.h:3384
    infotypeDIGITIZATION_TIME  : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC ('I','D','I','T');
                                                            -- vfw.h:3422
    infotypeSMPTE_TIME         : constant Win32.Mmsystem.FOURCC :=
                                Win32.Mmsystem.mmioFOURCC ('I','S','M','P');
                                                            -- vfw.h:3423
    IDS_CAP_BEGIN              : constant := 300;           -- vfw.h:3429
    IDS_CAP_END                : constant := 301;           -- vfw.h:3430
    IDS_CAP_INFO               : constant := 401;           -- vfw.h:3432
    IDS_CAP_OUTOFMEM           : constant := 402;           -- vfw.h:3433
    IDS_CAP_FILEEXISTS         : constant := 403;           -- vfw.h:3434
    IDS_CAP_ERRORPALOPEN       : constant := 404;           -- vfw.h:3435
    IDS_CAP_ERRORPALSAVE       : constant := 405;           -- vfw.h:3436
    IDS_CAP_ERRORDIBSAVE       : constant := 406;           -- vfw.h:3437
    IDS_CAP_DEFAVIEXT          : constant := 407;           -- vfw.h:3438
    IDS_CAP_DEFPALEXT          : constant := 408;           -- vfw.h:3439
    IDS_CAP_CANTOPEN           : constant := 409;           -- vfw.h:3440
    IDS_CAP_SEQ_MSGSTART       : constant := 410;           -- vfw.h:3441
    IDS_CAP_SEQ_MSGSTOP        : constant := 411;           -- vfw.h:3442
    IDS_CAP_VIDEDITERR         : constant := 412;           -- vfw.h:3444
    IDS_CAP_READONLYFILE       : constant := 413;           -- vfw.h:3445
    IDS_CAP_WRITEERROR         : constant := 414;           -- vfw.h:3446
    IDS_CAP_NODISKSPACE        : constant := 415;           -- vfw.h:3447
    IDS_CAP_SETFILESIZE        : constant := 416;           -- vfw.h:3448
    IDS_CAP_SAVEASPERCENT      : constant := 417;           -- vfw.h:3449
    IDS_CAP_DRIVER_ERROR       : constant := 418;           -- vfw.h:3451
    IDS_CAP_WAVE_OPEN_ERROR    : constant := 419;           -- vfw.h:3453
    IDS_CAP_WAVE_ALLOC_ERROR   : constant := 420;           -- vfw.h:3454
    IDS_CAP_WAVE_PREPARE_ERROR : constant := 421;           -- vfw.h:3455
    IDS_CAP_WAVE_ADD_ERROR     : constant := 422;           -- vfw.h:3456
    IDS_CAP_WAVE_SIZE_ERROR    : constant := 423;           -- vfw.h:3457
    IDS_CAP_VIDEO_OPEN_ERROR   : constant := 424;           -- vfw.h:3459
    IDS_CAP_VIDEO_ALLOC_ERROR  : constant := 425;           -- vfw.h:3460
    IDS_CAP_VIDEO_PREPARE_ERROR: constant := 426;           -- vfw.h:3461
    IDS_CAP_VIDEO_ADD_ERROR    : constant := 427;           -- vfw.h:3462
    IDS_CAP_VIDEO_SIZE_ERROR   : constant := 428;           -- vfw.h:3463
    IDS_CAP_FILE_OPEN_ERROR    : constant := 429;           -- vfw.h:3465
    IDS_CAP_FILE_WRITE_ERROR   : constant := 430;           -- vfw.h:3466
    IDS_CAP_RECORDING_ERROR    : constant := 431;           -- vfw.h:3467
    IDS_CAP_RECORDING_ERROR2   : constant := 432;           -- vfw.h:3468
    IDS_CAP_AVI_INIT_ERROR     : constant := 433;           -- vfw.h:3469
    IDS_CAP_NO_FRAME_CAP_ERROR : constant := 434;           -- vfw.h:3470
    IDS_CAP_NO_PALETTE_WARN    : constant := 435;           -- vfw.h:3471
    IDS_CAP_MCI_CONTROL_ERROR  : constant := 436;           -- vfw.h:3472
    IDS_CAP_MCI_CANT_STEP_ERROR: constant := 437;           -- vfw.h:3473
    IDS_CAP_NO_AUDIO_CAP_ERROR : constant := 438;           -- vfw.h:3474
    IDS_CAP_AVI_DRAWDIB_ERROR  : constant := 439;           -- vfw.h:3475
    IDS_CAP_COMPRESSOR_ERROR   : constant := 440;           -- vfw.h:3476
    IDS_CAP_AUDIO_DROP_ERROR   : constant := 441;           -- vfw.h:3477
    IDS_CAP_STAT_LIVE_MODE     : constant := 500;           -- vfw.h:3480
    IDS_CAP_STAT_OVERLAY_MODE  : constant := 501;           -- vfw.h:3481
    IDS_CAP_STAT_CAP_INIT      : constant := 502;           -- vfw.h:3482
    IDS_CAP_STAT_CAP_FINI      : constant := 503;           -- vfw.h:3483
    IDS_CAP_STAT_PALETTE_BUILD : constant := 504;           -- vfw.h:3484
    IDS_CAP_STAT_OPTPAL_BUILD  : constant := 505;           -- vfw.h:3485
    IDS_CAP_STAT_I_FRAMES      : constant := 506;           -- vfw.h:3486
    IDS_CAP_STAT_L_FRAMES      : constant := 507;           -- vfw.h:3487
    IDS_CAP_STAT_CAP_L_FRAMES  : constant := 508;           -- vfw.h:3488
    IDS_CAP_STAT_CAP_AUDIO     : constant := 509;           -- vfw.h:3489
    IDS_CAP_STAT_VIDEOCURRENT  : constant := 510;           -- vfw.h:3490
    IDS_CAP_STAT_VIDEOAUDIO    : constant := 511;           -- vfw.h:3491
    IDS_CAP_STAT_VIDEOONLY     : constant := 512;           -- vfw.h:3492
    IDS_CAP_STAT_FRAMESDROPPED : constant := 513;           -- vfw.h:3493

    type TWOCC is new Win32.WORD;                           -- vfw.h:1432

    subtype HIC is Win32.Winnt.HANDLE;                     -- vfw.h:113
    subtype HDRAWDIB is Win32.Winnt.HANDLE;                -- vfw.h:1162
    subtype HVIDEO is Win32.Winnt.HANDLE;                  -- vfw.h:2855
    type LPHVIDEO is access all HVIDEO;                     -- vfw.h:2856

    type ICOPEN;                                            -- vfw.h:290
    type ICINFO;                                            -- vfw.h:308
    type ICCOMPRESS;                                        -- vfw.h:347
    type ICCOMPRESSFRAMES;                                  -- vfw.h:378
    type ICSETSTATUSPROC;                                   -- vfw.h:393
    type ICDECOMPRESS;                                      -- vfw.h:414
    type ICDECOMPRESSEX;                                    -- vfw.h:441
    type ICDRAWBEGIN;                                       -- vfw.h:478
    type ICDRAW;                                            -- vfw.h:495
    type ICDRAWSUGGEST;                                     -- vfw.h:505
    type ICPALETTE;                                         -- vfw.h:515
    type COMPVARS;                                          -- vfw.h:1115
    type DRAWDIBTIME;                                       -- vfw.h:1326
    type MainAVIHeader;                                     -- vfw.h:1521
    type AVIStreamHeader;                                   -- vfw.h:1547
    type AVIINDEXENTRY;                                     -- vfw.h:1565
    type AVIPALCHANGE;                                      -- vfw.h:1579
    type AVISTREAMINFOW;                                    -- vfw.h:1655
    type AVISTREAMINFOA;                                    -- vfw.h:1676
    type AVIFILEINFOW;                                      -- vfw.h:1715
    type AVIFILEINFOA;                                      -- vfw.h:1734
    type AVICOMPRESSOPTIONS;                                -- vfw.h:1794
    type IAVIStreamVtbl;                                    -- vfw.h:1840
    type IAVIStream;                                        -- vfw.h:1840
    type IAVIStreamingVtbl;                                 -- vfw.h:1884
    type IAVIStreaming;                                     -- vfw.h:1884
    type IAVIEditStreamVtbl;                                -- vfw.h:1906
    type IAVIEditStream;                                    -- vfw.h:1906
    type IAVIFileVtbl;                                      -- vfw.h:1940
    type IAVIFile;                                          -- vfw.h:1940
    type IGetFrameVtbl;                                     -- vfw.h:1981
    type IGetFrame;                                         -- vfw.h:1981
    type VIDEOHDR;                                          -- vfw.h:2944
    type CHANNEL_CAPS;                                      -- vfw.h:2962
    type CAPDRIVERCAPS;                                     -- vfw.h:3289
    type CAPSTATUS;                                         -- vfw.h:3305
    type CAPTUREPARMS;                                      -- vfw.h:3327
    type CAPINFOCHUNK;                                      -- vfw.h:3353

    type PCOMPVARS is access all COMPVARS;                  -- vfw.h:1115
    type LPDRAWDIBTIME is access all DRAWDIBTIME;           -- vfw.h:1326
    type LPAVISTREAMINFOW is access all AVISTREAMINFOW;     -- vfw.h:1674
    type LPAVISTREAMINFOA is access all AVISTREAMINFOA;     -- vfw.h:1695
    subtype LPAVISTREAMINFO is LPAVISTREAMINFOA;            -- vfw.h:1702
    type LPAVIFILEINFOW is access all AVIFILEINFOW;         -- vfw.h:1732
    type LPAVIFILEINFOA is access all AVIFILEINFOA;         -- vfw.h:1751
    subtype LPAVIFILEINFO is LPAVIFILEINFOA;                -- vfw.h:1758
    type LPAVICOMPRESSOPTIONS is access all AVICOMPRESSOPTIONS;
                                                            -- vfw.h:1794
    type PAVISTREAM is access all IAVIStream;               -- vfw.h:1878
    type PAVISTREAMING is access all IAVIStreaming;         -- vfw.h:1900
    type PAVIEDITSTREAM is access all IAVIEditStream;       -- vfw.h:1930
    type PAVIFILE is access all IAVIFile;                   -- vfw.h:1973
    type PGETFRAME is access all IGetFrame;                 -- vfw.h:2004
    type PVIDEOHDR is access all VIDEOHDR;                  -- vfw.h:2952
    subtype LPVIDEOHDR is PVIDEOHDR;                        -- vfw.h:2952
    type PCHANNEL_CAPS is access all CHANNEL_CAPS;          -- vfw.h:2972
    subtype LPCHANNEL_CAPS is PCHANNEL_CAPS;                -- vfw.h:2972
    type PCAPDRIVERCAPS is access all CAPDRIVERCAPS;        -- vfw.h:3303
    subtype LPCAPDRIVERCAPS is PCAPDRIVERCAPS;              -- vfw.h:3303
    type PCAPSTATUS is access all CAPSTATUS;                -- vfw.h:3324
    subtype LPCAPSTATUS is PCAPSTATUS;                      -- vfw.h:3324
    type PCAPTUREPARMS is access all CAPTUREPARMS;          -- vfw.h:3351
    subtype LPCAPTUREPARMS is PCAPTUREPARMS;                -- vfw.h:3351
    type PCAPINFOCHUNK is access all CAPINFOCHUNK;          -- vfw.h:3357
    subtype LPCAPINFOCHUNK is PCAPINFOCHUNK;                -- vfw.h:3357

    type ac_IGetFrameVtbl_t is access all IGetFrameVtbl;
                                                            -- vfw.h:1981
    type ac_IAVIFileVtbl_t is access all IAVIFileVtbl; -- vfw.h:1940
    type ac_IAVIEditStreamVtbl_t is access all IAVIEditStreamVtbl;
                                                            -- vfw.h:1906
    type ac_IAVIStreamingVtbl_t is access all IAVIStreamingVtbl;
                                                            -- vfw.h:1884
    type ac_IAVIStreamVtbl_t is access all IAVIStreamVtbl;
                                                            -- vfw.h:1840

    type af_376_GetData is access function (
                lInput: Win32.LPARAM;
                lFrame: Win32.LONG;
                lpBits: Win32.LPVOID;
                len   : Win32.LONG)
               return Win32.LONG;                           -- vfw.h:376
    pragma Convention(Stdcall, af_376_GetData);
    type af_377_PutData is access function (
                lOutput: Win32.LPARAM;
                lFrame : Win32.LONG;
                lpBits : Win32.LPVOID;
                len    : Win32.LONG)
               return Win32.LONG;                           -- vfw.h:377
    pragma Convention(Stdcall, af_377_PutData);
    type af_392_Status is access function (
                lParam : Win32.LPARAM;
                message: Win32.UINT;
                l      : Win32.LONG)
               return Win32.LONG;                           -- vfw.h:392
    pragma Convention(Stdcall, af_392_Status);
    type af_1843_QueryInterface is access function (
                This  : access IAVIStream;
                riid  : access Win32.Objbase.IID;
                ppvObj: access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- vfw.h:1843
    pragma Convention(Stdcall, af_1843_QueryInterface);
    type af_1844_AddRef is access function (
                This: access IAVIStream)
               return Win32.ULONG;                          -- vfw.h:1844
    pragma Convention(Stdcall, af_1844_AddRef);
    type af_1845_Release is access function (
                This: access IAVIStream)
               return Win32.ULONG;                          -- vfw.h:1845
    pragma Convention(Stdcall, af_1845_Release);
    type af_1848_Create is access function (
                This   : access IAVIStream;
                lParam1: Win32.LPARAM;
                lParam2: Win32.LPARAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:1848
    pragma Convention(Stdcall, af_1848_Create);
    type af_1849_Info is access function (
                This : access IAVIStream;
                psi  : access AVISTREAMINFOW;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1849
    pragma Convention(Stdcall, af_1849_Info);
    type af_1850_FindSample is access function (
                This  : access IAVIStream;
                lPos  : Win32.LONG;
                lFlags: Win32.LONG)
               return Win32.LONG;                           -- vfw.h:1850
    pragma Convention(Stdcall, af_1850_FindSample);
    type af_1851_ReadFormat is access function (
                This      : access IAVIStream;
                lPos      : Win32.LONG;
                lpFormat  : Win32.LPVOID;
                lpcbFormat: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1851
    pragma Convention(Stdcall, af_1851_ReadFormat);
    type af_1853_SetFormat is access function (
                This    : access IAVIStream;
                lPos    : Win32.LONG;
                lpFormat: Win32.LPVOID;
                cbFormat: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1853
    pragma Convention(Stdcall, af_1853_SetFormat);
    type af_1855_Read is access function (
                This     : access IAVIStream;
                lStart   : Win32.LONG;
                lSamples : Win32.LONG;
                lpBuffer : Win32.LPVOID;
                cbBuffer : Win32.LONG;
                plBytes  : access Win32.LONG;
                plSamples: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1855
    pragma Convention(Stdcall, af_1855_Read);
    type af_1858_Write is access function (
                This          : access IAVIStream;
                lStart        : Win32.LONG;
                lSamples      : Win32.LONG;
                lpBuffer      : Win32.LPVOID;
                cbBuffer      : Win32.LONG;
                dwFlags       : Win32.DWORD;
                plSampWritten : access Win32.LONG;
                plBytesWritten: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1858
    pragma Convention(Stdcall, af_1858_Write);
    type af_1863_Delete is access function (
                This    : access IAVIStream;
                lStart  : Win32.LONG;
                lSamples: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1863
    pragma Convention(Stdcall, af_1863_Delete);
    type af_1864_ReadData is access function (
                This: access IAVIStream;
                fcc : Win32.DWORD;
                lp  : Win32.LPVOID;
                lpcb: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1864
    pragma Convention(Stdcall, af_1864_ReadData);
    type af_1865_WriteData is access function (
                This: access IAVIStream;
                fcc : Win32.DWORD;
                lp  : Win32.LPVOID;
                cb  : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1865
    pragma Convention(Stdcall, af_1865_WriteData);
    type af_1867_SetInfo is access function (
                This  : access IAVIStream;
                lpInfo: access AVISTREAMINFOW;
                cbInfo: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1867
    pragma Convention(Stdcall, af_1867_SetInfo);
    type af_1887_QueryInterface is access function (
                This  : access IAVIStreaming;
                riid  : access Win32.Objbase.IID;
                ppvObj: access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- vfw.h:1887
    pragma Convention(Stdcall, af_1887_QueryInterface);
    type af_1888_AddRef is access function (
                This: access IAVIStreaming)
               return Win32.ULONG;                          -- vfw.h:1888
    pragma Convention(Stdcall, af_1888_AddRef);
    type af_1889_Release is access function (
                This: access IAVIStreaming)
               return Win32.ULONG;                          -- vfw.h:1889
    pragma Convention(Stdcall, af_1889_Release);
    type af_1892_c_Begin is access function (
                This  : access IAVIStreaming;
                lStart: Win32.LONG;
                lEnd  : Win32.LONG;
                lRate : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1892
    pragma Convention(Stdcall, af_1892_c_Begin);
    type af_1897_c_End is access function (
                This: access IAVIStreaming)
               return Win32.Objbase.HRESULT;                -- vfw.h:1897
    pragma Convention(Stdcall, af_1897_c_End);
    type af_1909_QueryInterface is access function (
                This  : access IAVIEditStream;
                riid  : access Win32.Objbase.IID;
                ppvObj: access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- vfw.h:1909
    pragma Convention(Stdcall, af_1909_QueryInterface);
    type af_1910_AddRef is access function (
                This: access IAVIEditStream)
               return Win32.ULONG;                          -- vfw.h:1910
    pragma Convention(Stdcall, af_1910_AddRef);
    type af_1911_Release is access function (
                This: access IAVIEditStream)
               return Win32.ULONG;                          -- vfw.h:1911
    pragma Convention(Stdcall, af_1911_Release);
    type af_1914_Cut is access function (
                This    : access IAVIEditStream;
                plStart : access Win32.LONG;
                plLength: access Win32.LONG;
                ppResult: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:1914
    pragma Convention(Stdcall, af_1914_Cut);
    type af_1917_Copy is access function (
                This    : access IAVIEditStream;
                plStart : access Win32.LONG;
                plLength: access Win32.LONG;
                ppResult: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:1917
    pragma Convention(Stdcall, af_1917_Copy);
    type af_1920_Paste is access function (
                This    : access IAVIEditStream;
                plPos   : access Win32.LONG;
                plLength: access Win32.LONG;
                pstream : PAVISTREAM;
                lStart  : Win32.LONG;
                lEnd    : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1920
    pragma Convention(Stdcall, af_1920_Paste);
    type af_1925_Clone is access function (
                This    : access IAVIEditStream;
                ppResult: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:1925
    pragma Convention(Stdcall, af_1925_Clone);
    type af_1926_SetInfo is access function (
                This  : access IAVIEditStream;
                lpInfo: access AVISTREAMINFOW;
                cbInfo: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1926
    pragma Convention(Stdcall, af_1926_SetInfo);
    type af_1943_QueryInterface is access function (
                This  : access IAVIFile;
                riid  : access Win32.Objbase.IID;
                ppvObj: access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- vfw.h:1943
    pragma Convention(Stdcall, af_1943_QueryInterface);
    type af_1944_AddRef is access function (
                This: access IAVIFile)
               return Win32.ULONG;                          -- vfw.h:1944
    pragma Convention(Stdcall, af_1944_AddRef);
    type af_1945_Release is access function (
                This: access IAVIFile)
               return Win32.ULONG;                          -- vfw.h:1945
    pragma Convention(Stdcall, af_1945_Release);
    type af_1948_Info is access function (
                This : access IAVIFile;
                pfi  : access AVIFILEINFOW;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1948
    pragma Convention(Stdcall, af_1948_Info);
    type af_1951_GetStream is access function (
                This    : access IAVIFile;
                ppStream: access PAVISTREAM;
                fccType : Win32.DWORD;
                lParam  : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1951
    pragma Convention(Stdcall, af_1951_GetStream);
    type af_1955_CreateStream is access function (
                This    : access IAVIFile;
                ppStream: access PAVISTREAM;
                psi     : access AVISTREAMINFOW)
               return Win32.Objbase.HRESULT;                -- vfw.h:1955
    pragma Convention(Stdcall, af_1955_CreateStream);
    type af_1958_WriteData is access function (
                This  : access IAVIFile;
                ckid  : Win32.DWORD;
                lpData: Win32.LPVOID;
                cbData: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1958
    pragma Convention(Stdcall, af_1958_WriteData);
    type af_1962_ReadData is access function (
                This    : access IAVIFile;
                ckid    : Win32.DWORD;
                lpData  : Win32.LPVOID;
                lpcbData: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1962
    pragma Convention(Stdcall, af_1962_ReadData);
    type af_1966_EndRecord is access function (
                This: access IAVIFile)
               return Win32.Objbase.HRESULT;                -- vfw.h:1966
    pragma Convention(Stdcall, af_1966_EndRecord);
    type af_1967_DeleteStream is access function (
                This   : access IAVIFile;
                fccType: Win32.DWORD;
                lParam : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1967
    pragma Convention(Stdcall, af_1967_DeleteStream);
    type af_1984_QueryInterface is access function (
                This  : access IGetFrame;
                riid  : access Win32.Objbase.IID;
                ppvObj: access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- vfw.h:1984
    pragma Convention(Stdcall, af_1984_QueryInterface);
    type af_1985_AddRef is access function (
                This: access IGetFrame)
               return Win32.ULONG;                          -- vfw.h:1985
    pragma Convention(Stdcall, af_1985_AddRef);
    type af_1986_Release is access function (
                This: access IGetFrame)
               return Win32.ULONG;                          -- vfw.h:1986
    pragma Convention(Stdcall, af_1986_Release);
    type af_1990_GetFrame is access function (
                This: access IGetFrame;
                lPos: Win32.LONG)
               return Win32.LPVOID;                         -- vfw.h:1990
    pragma Convention(Stdcall, af_1990_GetFrame);
    type af_1993_c_Begin is access function (
                This  : access IGetFrame;
                lStart: Win32.LONG;
                lEnd  : Win32.LONG;
                lRate : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:1993
    pragma Convention(Stdcall, af_1993_c_Begin);
    type af_1994_c_End is access function (
                This: access IGetFrame)
               return Win32.Objbase.HRESULT;                -- vfw.h:1994
    pragma Convention(Stdcall, af_1994_c_End);
    type af_1996_SetFormat is access function (
                This  : access IGetFrame;
                lpbi  : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpBits: Win32.LPVOID;
                x     : Win32.INT;
                y     : Win32.INT;
                dx    : Win32.INT;
                dy    : Win32.INT)
               return Win32.Objbase.HRESULT;                -- vfw.h:1996
    pragma Convention(Stdcall, af_1996_SetFormat);

    type ICOPEN is                                          -- vfw.h:290
        record
            dwSize    : Win32.DWORD;                        -- vfw.h:284
            fccType   : Win32.DWORD;                        -- vfw.h:285
            fccHandler: Win32.DWORD;                        -- vfw.h:286
            dwVersion : Win32.DWORD;                        -- vfw.h:287
            dwFlags   : Win32.DWORD;                        -- vfw.h:288
            dwError   : Win32.LRESULT;                      -- vfw.h:289
        end record;

    type ICINFO is                                          -- vfw.h:308
        record
            dwSize       : Win32.DWORD;                     -- vfw.h:296
            fccType      : Win32.DWORD;                     -- vfw.h:297
            fccHandler   : Win32.DWORD;                     -- vfw.h:298
            dwFlags      : Win32.DWORD;                     -- vfw.h:299
            dwVersion    : Win32.DWORD;                     -- vfw.h:300
            dwVersionICM : Win32.DWORD;                     -- vfw.h:301
            szName       : Win32.WCHAR_Array(0..15);        -- vfw.h:305
            szDescription: Win32.WCHAR_Array(0..127);       -- vfw.h:306
            szDriver     : Win32.WCHAR_Array(0..127);       -- vfw.h:307
        end record;

    type ICCOMPRESS is                                      -- vfw.h:347
        record
            dwFlags    : Win32.DWORD;                       -- vfw.h:328
            lpbiOutput : Win32.Wingdi.LPBITMAPINFOHEADER;   -- vfw.h:330
            lpOutput   : Win32.LPVOID;                      -- vfw.h:331
            lpbiInput  : Win32.Wingdi.LPBITMAPINFOHEADER;   -- vfw.h:333
            lpInput    : Win32.LPVOID;                      -- vfw.h:334
            lpckid     : Win32.LPDWORD;                     -- vfw.h:336
            lpdwFlags  : Win32.LPDWORD;                     -- vfw.h:337
            lFrameNum  : Win32.LONG;                        -- vfw.h:338
            dwFrameSize: Win32.DWORD;                       -- vfw.h:339
            dwQuality  : Win32.DWORD;                       -- vfw.h:341
            lpbiPrev   : Win32.Wingdi.LPBITMAPINFOHEADER;   -- vfw.h:344
            lpPrev     : Win32.LPVOID;                      -- vfw.h:345
        end record;

    type ICCOMPRESSFRAMES is                                -- vfw.h:378
        record
            dwFlags           : Win32.DWORD;                -- vfw.h:355
            lpbiOutput        : Win32.Wingdi.LPBITMAPINFOHEADER;
                                                            -- vfw.h:357
            lOutput           : Win32.LPARAM;               -- vfw.h:358
            lpbiInput         : Win32.Wingdi.LPBITMAPINFOHEADER;
                                                            -- vfw.h:360
            lInput            : Win32.LPARAM;               -- vfw.h:361
            lStartFrame       : Win32.LONG;                 -- vfw.h:363
            lFrameCount       : Win32.LONG;                 -- vfw.h:364
            lQuality          : Win32.LONG;                 -- vfw.h:366
            lDataRate         : Win32.LONG;                 -- vfw.h:367
            lKeyRate          : Win32.LONG;                 -- vfw.h:368
            dwRate            : Win32.DWORD;                -- vfw.h:370
            dwScale           : Win32.DWORD;                -- vfw.h:371
            dwOverheadPerFrame: Win32.DWORD;                -- vfw.h:373
            dwReserved2       : Win32.DWORD;                -- vfw.h:374
            GetData           : af_376_GetData;             -- vfw.h:376
            PutData           : af_377_PutData;             -- vfw.h:377
        end record;

    type ICSETSTATUSPROC is                                 -- vfw.h:393
        record
            dwFlags: Win32.DWORD;                           -- vfw.h:381
            lParam : Win32.LPARAM;                          -- vfw.h:382
            Status : af_392_Status;                         -- vfw.h:392
        end record;

    type ICDECOMPRESS is                                    -- vfw.h:414
        record
            dwFlags   : Win32.DWORD;                        -- vfw.h:405
            lpbiInput : Win32.Wingdi.LPBITMAPINFOHEADER;    -- vfw.h:407
            lpInput   : Win32.LPVOID;                       -- vfw.h:409
            lpbiOutput: Win32.Wingdi.LPBITMAPINFOHEADER;    -- vfw.h:411
            lpOutput  : Win32.LPVOID;                       -- vfw.h:412
            ckid      : Win32.DWORD;                        -- vfw.h:413
        end record;

    type ICDECOMPRESSEX is                                  -- vfw.h:441
        record
            dwFlags: Win32.DWORD;                           -- vfw.h:420
            lpbiSrc: Win32.Wingdi.LPBITMAPINFOHEADER;       -- vfw.h:422
            lpSrc  : Win32.LPVOID;                          -- vfw.h:423
            lpbiDst: Win32.Wingdi.LPBITMAPINFOHEADER;       -- vfw.h:425
            lpDst  : Win32.LPVOID;                          -- vfw.h:426
            xDst   : Win32.INT;                             -- vfw.h:431
            yDst   : Win32.INT;                             -- vfw.h:432
            dxDst  : Win32.INT;                             -- vfw.h:433
            dyDst  : Win32.INT;                             -- vfw.h:434
            xSrc   : Win32.INT;                             -- vfw.h:436
            ySrc   : Win32.INT;                             -- vfw.h:437
            dxSrc  : Win32.INT;                             -- vfw.h:438
            dySrc  : Win32.INT;                             -- vfw.h:439
        end record;

    type ICDRAWBEGIN is                                     -- vfw.h:478
        record
            dwFlags: Win32.DWORD;                           -- vfw.h:457
            hpal   : Win32.Windef.HPALETTE;                 -- vfw.h:459
            hwnd   : Win32.Windef.HWND;                     -- vfw.h:460
            hdc    : Win32.Windef.HDC;                      -- vfw.h:461
            xDst   : Win32.INT;                             -- vfw.h:463
            yDst   : Win32.INT;                             -- vfw.h:464
            dxDst  : Win32.INT;                             -- vfw.h:465
            dyDst  : Win32.INT;                             -- vfw.h:466
            lpbi   : Win32.Wingdi.LPBITMAPINFOHEADER;       -- vfw.h:468
            xSrc   : Win32.INT;                             -- vfw.h:470
            ySrc   : Win32.INT;                             -- vfw.h:471
            dxSrc  : Win32.INT;                             -- vfw.h:472
            dySrc  : Win32.INT;                             -- vfw.h:473
            dwRate : Win32.DWORD;                           -- vfw.h:475
            dwScale: Win32.DWORD;                           -- vfw.h:476
        end record;

    type ICDRAW is                                          -- vfw.h:495
        record
            dwFlags : Win32.DWORD;                          -- vfw.h:490
            lpFormat: Win32.LPVOID;                         -- vfw.h:491
            lpData  : Win32.LPVOID;                         -- vfw.h:492
            cbData  : Win32.DWORD;                          -- vfw.h:493
            lTime   : Win32.LONG;                           -- vfw.h:494
        end record;

    type ICDRAWSUGGEST is                                   -- vfw.h:505
        record
            lpbiIn         : Win32.Wingdi.LPBITMAPINFOHEADER;
                                                            -- vfw.h:498
            lpbiSuggest    : Win32.Wingdi.LPBITMAPINFOHEADER;
                                                            -- vfw.h:499
            dxSrc          : Win32.INT;                     -- vfw.h:500
            dySrc          : Win32.INT;                     -- vfw.h:501
            dxDst          : Win32.INT;                     -- vfw.h:502
            dyDst          : Win32.INT;                     -- vfw.h:503
            hicDecompressor: HIC;                           -- vfw.h:504
        end record;

    type ICPALETTE is                                       -- vfw.h:515
        record
            dwFlags: Win32.DWORD;                           -- vfw.h:511
            iStart : Win32.INT;                             -- vfw.h:512
            iLen   : Win32.INT;                             -- vfw.h:513
            lppe   : Win32.Wingdi.LPPALETTEENTRY;           -- vfw.h:514
        end record;

    type COMPVARS is                                        -- vfw.h:1115
        record
            cbSize    : Win32.LONG;                         -- vfw.h:1097
            dwFlags   : Win32.DWORD;                        -- vfw.h:1099
            hic       : Win32.Vfw.HIC;                      -- vfw.h:1100
            fccType   : Win32.DWORD;                        -- vfw.h:1101
            fccHandler: Win32.DWORD;                        -- vfw.h:1102
            lpbiIn    : Win32.Wingdi.LPBITMAPINFO;          -- vfw.h:1104
            lpbiOut   : Win32.Wingdi.LPBITMAPINFO;          -- vfw.h:1105
            lpBitsOut : Win32.LPVOID;                       -- vfw.h:1106
            lpBitsPrev: Win32.LPVOID;                       -- vfw.h:1107
            lFrame    : Win32.LONG;                         -- vfw.h:1108
            lKey      : Win32.LONG;                         -- vfw.h:1109
            lDataRate : Win32.LONG;                         -- vfw.h:1110
            lQ        : Win32.LONG;                         -- vfw.h:1111
            lKeyCount : Win32.LONG;                         -- vfw.h:1112
            lpState   : Win32.LPVOID;                       -- vfw.h:1113
            cbState   : Win32.LONG;                         -- vfw.h:1114
        end record;

    type DRAWDIBTIME is                                     -- vfw.h:1326
        record
            timeCount     : Win32.LONG;                     -- vfw.h:1319
            timeDraw      : Win32.LONG;                     -- vfw.h:1320
            timeDecompress: Win32.LONG;                     -- vfw.h:1321
            timeDither    : Win32.LONG;                     -- vfw.h:1322
            timeStretch   : Win32.LONG;                     -- vfw.h:1323
            timeBlt       : Win32.LONG;                     -- vfw.h:1324
            timeSetDIBits : Win32.LONG;                     -- vfw.h:1325
        end record;

    type MainAVIHeader is                                   -- vfw.h:1521
        record
            dwMicroSecPerFrame   : Win32.DWORD;             -- vfw.h:1507
            dwMaxBytesPerSec     : Win32.DWORD;             -- vfw.h:1508
            dwPaddingGranularity : Win32.DWORD;             -- vfw.h:1509
            dwFlags              : Win32.DWORD;             -- vfw.h:1511
            dwTotalFrames        : Win32.DWORD;             -- vfw.h:1512
            dwInitialFrames      : Win32.DWORD;             -- vfw.h:1513
            dwStreams            : Win32.DWORD;             -- vfw.h:1514
            dwSuggestedBufferSize: Win32.DWORD;             -- vfw.h:1515
            dwWidth              : Win32.DWORD;             -- vfw.h:1517
            dwHeight             : Win32.DWORD;             -- vfw.h:1518
            dwReserved           : Win32.DWORD_Array(0..3); -- vfw.h:1520
        end record;

    type AVIStreamHeader is                                 -- vfw.h:1547
        record
            fccType              : Win32.Mmsystem.FOURCC;   -- vfw.h:1533
            fccHandler           : Win32.Mmsystem.FOURCC;   -- vfw.h:1534
            dwFlags              : Win32.DWORD;             -- vfw.h:1535
            wPriority            : Win32.WORD;              -- vfw.h:1536
            wLanguage            : Win32.WORD;              -- vfw.h:1537
            dwInitialFrames      : Win32.DWORD;             -- vfw.h:1538
            dwScale              : Win32.DWORD;             -- vfw.h:1539
            dwRate               : Win32.DWORD;             -- vfw.h:1540
            dwStart              : Win32.DWORD;             -- vfw.h:1541
            dwLength             : Win32.DWORD;             -- vfw.h:1542
            dwSuggestedBufferSize: Win32.DWORD;             -- vfw.h:1543
            dwQuality            : Win32.DWORD;             -- vfw.h:1544
            dwSampleSize         : Win32.DWORD;             -- vfw.h:1545
            rcFrame              : Win32.Windef.RECT;       -- vfw.h:1546
        end record;

    type AVIINDEXENTRY is                                   -- vfw.h:1565
        record
            ckid         : Win32.DWORD;                     -- vfw.h:1561
            dwFlags      : Win32.DWORD;                     -- vfw.h:1562
            dwChunkOffset: Win32.DWORD;                     -- vfw.h:1563
            dwChunkLength: Win32.DWORD;                     -- vfw.h:1564
        end record;

    type PALETTEENTRY_Array is                              -- vfw.h:1578
        array(Natural range 0..Win32.ANYSIZE_ARRAY)
        of aliased Win32.Wingdi.PALETTEENTRY;

    type AVIPALCHANGE is                                    -- vfw.h:1579
        record
            bFirstEntry: Win32.BYTE;                        -- vfw.h:1575
            bNumEntries: Win32.BYTE;                        -- vfw.h:1576
            wFlags     : Win32.WORD;                        -- vfw.h:1577
            peNew      : PALETTEENTRY_Array;                -- vfw.h:1578
        end record;

    type AVISTREAMINFOW is                                  -- vfw.h:1655
        record
            fccType              : Win32.DWORD;             -- vfw.h:1656
            fccHandler           : Win32.DWORD;             -- vfw.h:1657
            dwFlags              : Win32.DWORD;             -- vfw.h:1658
            dwCaps               : Win32.DWORD;             -- vfw.h:1659
            wPriority            : Win32.WORD;              -- vfw.h:1660
            wLanguage            : Win32.WORD;              -- vfw.h:1661
            dwScale              : Win32.DWORD;             -- vfw.h:1662
            dwRate               : Win32.DWORD;             -- vfw.h:1663
            dwStart              : Win32.DWORD;             -- vfw.h:1664
            dwLength             : Win32.DWORD;             -- vfw.h:1665
            dwInitialFrames      : Win32.DWORD;             -- vfw.h:1666
            dwSuggestedBufferSize: Win32.DWORD;             -- vfw.h:1667
            dwQuality            : Win32.DWORD;             -- vfw.h:1668
            dwSampleSize         : Win32.DWORD;             -- vfw.h:1669
            rcFrame              : Win32.Windef.RECT;       -- vfw.h:1670
            dwEditCount          : Win32.DWORD;             -- vfw.h:1671
            dwFormatChangeCount  : Win32.DWORD;             -- vfw.h:1672
            szName               : Win32.WCHAR_Array(0..63);
                                                            -- vfw.h:1673
        end record;

    type AVISTREAMINFOA is                                  -- vfw.h:1676
        record
            fccType              : Win32.DWORD;             -- vfw.h:1677
            fccHandler           : Win32.DWORD;             -- vfw.h:1678
            dwFlags              : Win32.DWORD;             -- vfw.h:1679
            dwCaps               : Win32.DWORD;             -- vfw.h:1680
            wPriority            : Win32.WORD;              -- vfw.h:1681
            wLanguage            : Win32.WORD;              -- vfw.h:1682
            dwScale              : Win32.DWORD;             -- vfw.h:1683
            dwRate               : Win32.DWORD;             -- vfw.h:1684
            dwStart              : Win32.DWORD;             -- vfw.h:1685
            dwLength             : Win32.DWORD;             -- vfw.h:1686
            dwInitialFrames      : Win32.DWORD;             -- vfw.h:1687
            dwSuggestedBufferSize: Win32.DWORD;             -- vfw.h:1688
            dwQuality            : Win32.DWORD;             -- vfw.h:1689
            dwSampleSize         : Win32.DWORD;             -- vfw.h:1690
            rcFrame              : Win32.Windef.RECT;       -- vfw.h:1691
            dwEditCount          : Win32.DWORD;             -- vfw.h:1692
            dwFormatChangeCount  : Win32.DWORD;             -- vfw.h:1693
            szName               : Win32.CHAR_Array(0..63);
                                                            -- vfw.h:1694
        end record;

    subtype AVISTREAMINFO is AVISTREAMINFOA;                -- vfw.h:1701

    type AVIFILEINFOW is                                    -- vfw.h:1715
        record
            dwMaxBytesPerSec     : Win32.DWORD;             -- vfw.h:1716
            dwFlags              : Win32.DWORD;             -- vfw.h:1717
            dwCaps               : Win32.DWORD;             -- vfw.h:1718
            dwStreams            : Win32.DWORD;             -- vfw.h:1719
            dwSuggestedBufferSize: Win32.DWORD;             -- vfw.h:1720
            dwWidth              : Win32.DWORD;             -- vfw.h:1722
            dwHeight             : Win32.DWORD;             -- vfw.h:1723
            dwScale              : Win32.DWORD;             -- vfw.h:1725
            dwRate               : Win32.DWORD;             -- vfw.h:1726
            dwLength             : Win32.DWORD;             -- vfw.h:1727
            dwEditCount          : Win32.DWORD;             -- vfw.h:1729
            szFileType           : Win32.WCHAR_Array(0..63);-- vfw.h:1731
        end record;

    type AVIFILEINFOA is                                    -- vfw.h:1734
        record
            dwMaxBytesPerSec     : Win32.DWORD;             -- vfw.h:1735
            dwFlags              : Win32.DWORD;             -- vfw.h:1736
            dwCaps               : Win32.DWORD;             -- vfw.h:1737
            dwStreams            : Win32.DWORD;             -- vfw.h:1738
            dwSuggestedBufferSize: Win32.DWORD;             -- vfw.h:1739
            dwWidth              : Win32.DWORD;             -- vfw.h:1741
            dwHeight             : Win32.DWORD;             -- vfw.h:1742
            dwScale              : Win32.DWORD;             -- vfw.h:1744
            dwRate               : Win32.DWORD;             -- vfw.h:1745
            dwLength             : Win32.DWORD;             -- vfw.h:1746
            dwEditCount          : Win32.DWORD;             -- vfw.h:1748
            szFileType           : Win32.CHAR_Array(0..63); -- vfw.h:1750
        end record;

    subtype AVIFILEINFO is AVIFILEINFOA;                    -- vfw.h:1757

    type AVISAVECALLBACK is access function (
                p1: Win32.INT)
               return Win32.BOOL;                           -- vfw.h:1775
    pragma Convention(Stdcall, AVISAVECALLBACK);

    type AVICOMPRESSOPTIONS is                              -- vfw.h:1794
        record
            fccType          : Win32.DWORD;                 -- vfw.h:1783
            fccHandler       : Win32.DWORD;                 -- vfw.h:1784
            dwKeyFrameEvery  : Win32.DWORD;                 -- vfw.h:1785
            dwQuality        : Win32.DWORD;                 -- vfw.h:1786
            dwBytesPerSecond : Win32.DWORD;                 -- vfw.h:1787
            dwFlags          : Win32.DWORD;                 -- vfw.h:1788
            lpFormat         : Win32.LPVOID;                -- vfw.h:1789
            cbFormat         : Win32.DWORD;                 -- vfw.h:1790
            lpParms          : Win32.LPVOID;                -- vfw.h:1791
            cbParms          : Win32.DWORD;                 -- vfw.h:1792
            dwInterleaveEvery: Win32.DWORD;                 -- vfw.h:1793
        end record;

    type IAVIStreamVtbl is                                  -- vfw.h:1840
        record
            QueryInterface: af_1843_QueryInterface;         -- vfw.h:1843
            AddRef        : af_1844_AddRef;                 -- vfw.h:1844
            Release       : af_1845_Release;                -- vfw.h:1845
            Create        : af_1848_Create;                 -- vfw.h:1848
            Info          : af_1849_Info;                   -- vfw.h:1849
            FindSample    : af_1850_FindSample;             -- vfw.h:1850
            ReadFormat    : af_1851_ReadFormat;             -- vfw.h:1851
            SetFormat     : af_1853_SetFormat;              -- vfw.h:1853
            Read          : af_1855_Read;                   -- vfw.h:1855
            Write         : af_1858_Write;                  -- vfw.h:1858
            Delete        : af_1863_Delete;                 -- vfw.h:1863
            ReadData      : af_1864_ReadData;               -- vfw.h:1864
            WriteData     : af_1865_WriteData;              -- vfw.h:1865
            SetInfo       : af_1867_SetInfo;                -- vfw.h:1867
        end record;

    type IAVIStream is                                      -- vfw.h:1840
        record
            lpVtbl: ac_IAVIStreamVtbl_t;                    -- vfw.h:1840
        end record;

    type IAVIStreamingVtbl is                               -- vfw.h:1884
        record
            QueryInterface: af_1887_QueryInterface;         -- vfw.h:1887
            AddRef        : af_1888_AddRef;                 -- vfw.h:1888
            Release       : af_1889_Release;                -- vfw.h:1889
            c_Begin       : af_1892_c_Begin;                -- vfw.h:1892
            c_End         : af_1897_c_End;                  -- vfw.h:1897
        end record;

    type IAVIStreaming is                                   -- vfw.h:1884
        record
            lpVtbl: ac_IAVIStreamingVtbl_t;                 -- vfw.h:1884
        end record;

    type IAVIEditStreamVtbl is                              -- vfw.h:1906
        record
            QueryInterface: af_1909_QueryInterface;         -- vfw.h:1909
            AddRef        : af_1910_AddRef;                 -- vfw.h:1910
            Release       : af_1911_Release;                -- vfw.h:1911
            Cut           : af_1914_Cut;                    -- vfw.h:1914
            Copy          : af_1917_Copy;                   -- vfw.h:1917
            Paste         : af_1920_Paste;                  -- vfw.h:1920
            Clone         : af_1925_Clone;                  -- vfw.h:1925
            SetInfo       : af_1926_SetInfo;                -- vfw.h:1926
        end record;

    type IAVIEditStream is                                  -- vfw.h:1906
        record
            lpVtbl: ac_IAVIEditStreamVtbl_t;                -- vfw.h:1906
        end record;

    type IAVIFileVtbl is                                    -- vfw.h:1940
        record
            QueryInterface: af_1943_QueryInterface;         -- vfw.h:1943
            AddRef        : af_1944_AddRef;                 -- vfw.h:1944
            Release       : af_1945_Release;                -- vfw.h:1945
            Info          : af_1948_Info;                   -- vfw.h:1948
            GetStream     : af_1951_GetStream;              -- vfw.h:1951
            CreateStream  : af_1955_CreateStream;           -- vfw.h:1955
            WriteData     : af_1958_WriteData;              -- vfw.h:1958
            ReadData      : af_1962_ReadData;               -- vfw.h:1962
            EndRecord     : af_1966_EndRecord;              -- vfw.h:1966
            DeleteStream  : af_1967_DeleteStream;           -- vfw.h:1967
        end record;

    type IAVIFile is                                        -- vfw.h:1940
        record
            lpVtbl: ac_IAVIFileVtbl_t;                      -- vfw.h:1940
        end record;

    type IGetFrameVtbl is                                   -- vfw.h:1981
        record
            QueryInterface: af_1984_QueryInterface;         -- vfw.h:1984
            AddRef        : af_1985_AddRef;                 -- vfw.h:1985
            Release       : af_1986_Release;                -- vfw.h:1986
            GetFrame      : af_1990_GetFrame;               -- vfw.h:1990
            c_Begin       : af_1993_c_Begin;                -- vfw.h:1993
            c_End         : af_1994_c_End;                  -- vfw.h:1994
            SetFormat     : af_1996_SetFormat;              -- vfw.h:1996
        end record;

    type IGetFrame is                                       -- vfw.h:1981
        record
            lpVtbl: ac_IGetFrameVtbl_t;                     -- vfw.h:1981
        end record;

    type VIDEOHDR is                                        -- vfw.h:2944
        record
            lpData        : Win32.LPBYTE;                   -- vfw.h:2945
            dwBufferLength: Win32.DWORD;                    -- vfw.h:2946
            dwBytesUsed   : Win32.DWORD;                    -- vfw.h:2947
            dwTimeCaptured: Win32.DWORD;                    -- vfw.h:2948
            dwUser        : Win32.DWORD;                    -- vfw.h:2949
            dwFlags       : Win32.DWORD;                    -- vfw.h:2950
            dwReserved    : Win32.DWORD_Array(0..3);        -- vfw.h:2951
        end record;

    type CHANNEL_CAPS is                                    -- vfw.h:2962
        record
            dwFlags           : Win32.DWORD;                -- vfw.h:2963
            dwSrcRectXMod     : Win32.DWORD;                -- vfw.h:2964
            dwSrcRectYMod     : Win32.DWORD;                -- vfw.h:2965
            dwSrcRectWidthMod : Win32.DWORD;                -- vfw.h:2966
            dwSrcRectHeightMod: Win32.DWORD;                -- vfw.h:2967
            dwDstRectXMod     : Win32.DWORD;                -- vfw.h:2968
            dwDstRectYMod     : Win32.DWORD;                -- vfw.h:2969
            dwDstRectWidthMod : Win32.DWORD;                -- vfw.h:2970
            dwDstRectHeightMod: Win32.DWORD;                -- vfw.h:2971
        end record;

    type CAPDRIVERCAPS is                                   -- vfw.h:3289
        record
            wDeviceIndex           : Win32.UINT;            -- vfw.h:3290
            fHasOverlay            : Win32.BOOL;            -- vfw.h:3291
            fHasDlgVideoSource     : Win32.BOOL;            -- vfw.h:3292
            fHasDlgVideoFormat     : Win32.BOOL;            -- vfw.h:3293
            fHasDlgVideoDisplay    : Win32.BOOL;            -- vfw.h:3294
            fCaptureInitialized    : Win32.BOOL;            -- vfw.h:3295
            fDriverSuppliesPalettes: Win32.BOOL;            -- vfw.h:3296
            hVideoIn               : Win32.Winnt.HANDLE;    -- vfw.h:3299
            hVideoOut              : Win32.Winnt.HANDLE;    -- vfw.h:3300
            hVideoExtIn            : Win32.Winnt.HANDLE;    -- vfw.h:3301
            hVideoExtOut           : Win32.Winnt.HANDLE;    -- vfw.h:3302
        end record;

    type CAPSTATUS is                                       -- vfw.h:3305
        record
            uiImageWidth               : Win32.UINT;        -- vfw.h:3306
            uiImageHeight              : Win32.UINT;        -- vfw.h:3307
            fLiveWindow                : Win32.BOOL;        -- vfw.h:3308
            fOverlayWindow             : Win32.BOOL;        -- vfw.h:3309
            fScale                     : Win32.BOOL;        -- vfw.h:3310
            ptScroll                   : Win32.Windef.POINT;-- vfw.h:3311
            fUsingDefaultPalette       : Win32.BOOL;        -- vfw.h:3312
            fAudioHardware             : Win32.BOOL;        -- vfw.h:3313
            fCapFileExists             : Win32.BOOL;        -- vfw.h:3314
            dwCurrentVideoFrame        : Win32.DWORD;       -- vfw.h:3315
            dwCurrentVideoFramesDropped: Win32.DWORD;       -- vfw.h:3316
            dwCurrentWaveSamples       : Win32.DWORD;       -- vfw.h:3317
            dwCurrentTimeElapsedMS     : Win32.DWORD;       -- vfw.h:3318
            hPalCurrent                : Win32.Windef.HPALETTE;
                                                            -- vfw.h:3319
            fCapturingNow              : Win32.BOOL;        -- vfw.h:3320
            dwReturn                   : Win32.DWORD;       -- vfw.h:3321
            wNumVideoAllocated         : Win32.UINT;        -- vfw.h:3322
            wNumAudioAllocated         : Win32.UINT;        -- vfw.h:3323
        end record;

    type CAPTUREPARMS is                                    -- vfw.h:3327
        record
            dwRequestMicroSecPerFrame: Win32.DWORD;         -- vfw.h:3328
            fMakeUserHitOKToCapture  : Win32.BOOL;          -- vfw.h:3329
            wPercentDropForError     : Win32.UINT;          -- vfw.h:3330
            fYield                   : Win32.BOOL;          -- vfw.h:3331
            dwIndexSize              : Win32.DWORD;         -- vfw.h:3332
            wChunkGranularity        : Win32.UINT;          -- vfw.h:3333
            fUsingDOSMemory          : Win32.BOOL;          -- vfw.h:3334
            wNumVideoRequested       : Win32.UINT;          -- vfw.h:3335
            fCaptureAudio            : Win32.BOOL;          -- vfw.h:3336
            wNumAudioRequested       : Win32.UINT;          -- vfw.h:3337
            vKeyAbort                : Win32.UINT;          -- vfw.h:3338
            fAbortLeftMouse          : Win32.BOOL;          -- vfw.h:3339
            fAbortRightMouse         : Win32.BOOL;          -- vfw.h:3340
            fLimitEnabled            : Win32.BOOL;          -- vfw.h:3341
            wTimeLimit               : Win32.UINT;          -- vfw.h:3342
            fMCIControl              : Win32.BOOL;          -- vfw.h:3343
            fStepMCIDevice           : Win32.BOOL;          -- vfw.h:3344
            dwMCIStartTime           : Win32.DWORD;         -- vfw.h:3345
            dwMCIStopTime            : Win32.DWORD;         -- vfw.h:3346
            fStepCaptureAt2x         : Win32.BOOL;          -- vfw.h:3347
            wStepCaptureAverageFrames: Win32.UINT;          -- vfw.h:3348
            dwAudioBufferSize        : Win32.DWORD;         -- vfw.h:3349
            fDisableWriteCache       : Win32.BOOL;          -- vfw.h:3350
        end record;

    type CAPINFOCHUNK is                                    -- vfw.h:3353
        record
            fccInfoID: Win32.Mmsystem.FOURCC;               -- vfw.h:3354
            lpData   : Win32.LPVOID;                        -- vfw.h:3355
            cbData   : Win32.LONG;                          -- vfw.h:3356
        end record;

    type CAPYIELDCALLBACK is access function (
                hWnd: Win32.Windef.HWND)
               return Win32.LRESULT;                        -- vfw.h:3364
    pragma Convention(Stdcall, CAPYIELDCALLBACK);
    type CAPSTATUSCALLBACKW is access function (
                hWnd: Win32.Windef.HWND;
                nID : Win32.INT;
                lpsz: Win32.LPCWSTR)
               return Win32.LRESULT;                        -- vfw.h:3365
    pragma Convention(Stdcall, CAPSTATUSCALLBACKW);
    type CAPERRORCALLBACKW is access function (
                hWnd: Win32.Windef.HWND;
                nID : Win32.INT;
                lpsz: Win32.LPCWSTR)
               return Win32.LRESULT;                        -- vfw.h:3366
    pragma Convention(Stdcall, CAPERRORCALLBACKW);
    type CAPSTATUSCALLBACKA is access function (
                hWnd: Win32.Windef.HWND;
                nID : Win32.INT;
                lpsz: Win32.LPCSTR)
               return Win32.LRESULT;                        -- vfw.h:3367
    pragma Convention(Stdcall, CAPSTATUSCALLBACKA);
    subtype CAPSTATUSCALLBACK is CAPSTATUSCALLBACKA;        -- vfw.h:3373
    type CAPERRORCALLBACKA is access function (
                hWnd: Win32.Windef.HWND;
                nID : Win32.INT;
                lpsz: Win32.LPCSTR)
               return Win32.LRESULT;                        -- vfw.h:3368
    pragma Convention(Stdcall, CAPERRORCALLBACKA);
    subtype CAPERRORCALLBACK is CAPERRORCALLBACKA;          -- vfw.h:3374
    type CAPVIDEOCALLBACK is access function (
                hWnd  : Win32.Windef.HWND;
                lpVHdr: LPVIDEOHDR)
               return Win32.LRESULT;                        -- vfw.h:3376
    pragma Convention(Stdcall, CAPVIDEOCALLBACK);
    type CAPWAVECALLBACK is access function (
                hWnd  : Win32.Windef.HWND;
                lpWHdr: Win32.Mmsystem.LPWAVEHDR)
               return Win32.LRESULT;                        -- vfw.h:3377
    pragma Convention(Stdcall, CAPWAVECALLBACK);
    type CAPCONTROLCALLBACK is access function (
                hWnd  : Win32.Windef.HWND;
                nState: Win32.INT)
               return Win32.LRESULT;                        -- vfw.h:3378
    pragma Convention(Stdcall, CAPCONTROLCALLBACK);

    IID_IAVIFile            : Win32.Rpcdce.GUID;            -- vfw.h:2010
    IID_IAVIStream          : Win32.Rpcdce.GUID;            -- vfw.h:2011
    IID_IAVIStreaming       : Win32.Rpcdce.GUID;            -- vfw.h:2012
    IID_IGetFrame           : Win32.Rpcdce.GUID;            -- vfw.h:2013
    IID_IAVIEditStream      : Win32.Rpcdce.GUID;            -- vfw.h:2014
    CLSID_AVISimpleUnMarshal: Win32.Rpcdce.GUID;            -- vfw.h:2016

    function VideoForWindowsVersion return Win32.DWORD;     -- vfw.h:64

    function InitVFW return Win32.LONG;                     -- vfw.h:72

    function TermVFW return Win32.LONG;                     -- vfw.h:73

    function MKFOURCC(ch0: Win32.Char;
                      ch1: Win32.Char;
                      ch2: Win32.Char;
                      ch3: Win32.Char)
                      return Win32.Mmsystem.FOURCC;         -- vfw.h: 94

    function aviTWOCC(ch0: Win32.Char;
                      ch1: Win32.Char) return TWOCC;        -- vfw.h:128
    pragma Inline(aviTWOCC);


    function ICInfo_func(
                fccType   : Win32.DWORD;
                fccHandler: Win32.DWORD;
                lpicinfo  : access ICINFO)
               return Win32.BOOL;                           -- vfw.h:524

    function ICInstall(
                fccType   : Win32.DWORD;
                fccHandler: Win32.DWORD;
                lParam    : Win32.LPARAM;
                szDesc    : Win32.LPSTR;
                wFlags    : Win32.UINT)
               return Win32.BOOL;                           -- vfw.h:525

    function ICRemove(
                fccType   : Win32.DWORD;
                fccHandler: Win32.DWORD;
                wFlags    : Win32.UINT)
               return Win32.BOOL;                           -- vfw.h:526

    function ICGetInfo(
                hic    : Win32.Vfw.HIC;
                picinfo: access ICINFO;
                cb     : Win32.DWORD)
               return Win32.LRESULT;                        -- vfw.h:527

    function ICOpen_func(
                fccType   : Win32.DWORD;
                fccHandler: Win32.DWORD;
                wMode     : Win32.UINT)
               return HIC;                                  -- vfw.h:529

    function ICOpenFunction(
                fccType    : Win32.DWORD;
                fccHandler : Win32.DWORD;
                wMode      : Win32.UINT;
                lpfnHandler: Win32.Windef.FARPROC)
               return HIC;                                  -- vfw.h:530

    function ICClose(
                hic: Win32.Vfw.HIC)
               return Win32.LRESULT;                        -- vfw.h:531

    function ICSendMessage(
                hic: Win32.Vfw.HIC;
                msg: Win32.UINT;
                dw1: Win32.DWORD;
                dw2: Win32.DWORD)
               return Win32.LRESULT;                        -- vfw.h:533

    function ICCompress_func(
                hic        : Win32.Vfw.HIC;
                dwFlags    : Win32.DWORD;
                lpbiOutput : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpData     : Win32.LPVOID;
                lpbiInput  : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpBits     : Win32.LPVOID;
                lpckid     : Win32.LPDWORD;
                lpdwFlags  : Win32.LPDWORD;
                lFrameNum  : Win32.LONG;
                dwFrameSize: Win32.DWORD;
                dwQuality  : Win32.DWORD;
                lpbiPrev   : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpPrev     : Win32.LPVOID)
               return Win32.DWORD;                          -- vfw.h:612

    function ICDecompress_func(
                hic       : Win32.Vfw.HIC;
                dwFlags   : Win32.DWORD;
                lpbiFormat: Win32.Wingdi.LPBITMAPINFOHEADER;
                lpData    : Win32.LPVOID;
                lpbi      : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpBits    : Win32.LPVOID)
               return Win32.DWORD;                          -- vfw.h:686

    function ICDrawBegin_func(
                hic    : Win32.Vfw.HIC;
                dwFlags: Win32.DWORD;
                hpal   : Win32.Windef.HPALETTE;
                hwnd   : Win32.Windef.HWND;
                hdc    : Win32.Windef.HDC;
                xDst   : Win32.INT;
                yDst   : Win32.INT;
                dxDst  : Win32.INT;
                dyDst  : Win32.INT;
                lpbi   : Win32.Wingdi.LPBITMAPINFOHEADER;
                xSrc   : Win32.INT;
                ySrc   : Win32.INT;
                dxSrc  : Win32.INT;
                dySrc  : Win32.INT;
                dwRate : Win32.DWORD;
                dwScale: Win32.DWORD)
               return Win32.DWORD;                          -- vfw.h:912

    function ICDraw_func(
                hic     : Win32.Vfw.HIC;
                dwFlags : Win32.DWORD;
                lpFormat: Win32.LPVOID;
                lpData  : Win32.LPVOID;
                cbData  : Win32.DWORD;
                lTime   : Win32.LONG)
               return Win32.DWORD;                          -- vfw.h:940

    function ICLocate(
                fccType   : Win32.DWORD;
                fccHandler: Win32.DWORD;
                lpbiIn    : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpbiOut   : Win32.Wingdi.LPBITMAPINFOHEADER;
                wFlags    : Win32.WORD)
               return HIC;                                  -- vfw.h:1067

    function ICGetDisplayFormat(
                hic     : Win32.Vfw.HIC;
                lpbiIn  : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpbiOut : Win32.Wingdi.LPBITMAPINFOHEADER;
                BitDepth: Win32.INT;
                dx      : Win32.INT;
                dy      : Win32.INT)
               return Win32.Vfw.HIC;                        -- vfw.h:1068

    function ICImageCompress(
                hic     : Win32.Vfw.HIC;
                uiFlags : Win32.UINT;
                lpbiIn  : Win32.Wingdi.LPBITMAPINFO;
                lpBits  : Win32.LPVOID;
                lpbiOut : Win32.Wingdi.LPBITMAPINFO;
                lQuality: Win32.LONG;
                plSize  : access Win32.LONG)
               return Win32.Winnt.HANDLE;                   -- vfw.h:1076

    function ICImageDecompress(
                hic    : Win32.Vfw.HIC;
                uiFlags: Win32.UINT;
                lpbiIn : Win32.Wingdi.LPBITMAPINFO;
                lpBits : Win32.LPVOID;
                lpbiOut: Win32.Wingdi.LPBITMAPINFO)
               return Win32.Winnt.HANDLE;                   -- vfw.h:1085

    function ICCompressorChoose(
                hwnd     : Win32.Windef.HWND;
                uiFlags  : Win32.UINT;
                pvIn     : Win32.LPVOID;
                lpData   : Win32.LPVOID;
                pc       : PCOMPVARS;
                lpszTitle: Win32.LPSTR)
               return Win32.BOOL;                           -- vfw.h:1124

    function ICSeqCompressFrameStart(
                pc    : PCOMPVARS;
                lpbiIn: Win32.Wingdi.LPBITMAPINFO)
               return Win32.BOOL;                           -- vfw.h:1140

    procedure ICSeqCompressFrameEnd(
                pc: PCOMPVARS);                             -- vfw.h:1141

    function ICSeqCompressFrame(
                pc     : PCOMPVARS;
                uiFlags: Win32.UINT;
                lpBits : Win32.LPVOID;
                pfKey  : access Win32.BOOL;
                plSize : access Win32.LONG)
               return Win32.LPVOID;                         -- vfw.h:1143

    procedure ICCompressorFree(
                pc: PCOMPVARS);                             -- vfw.h:1150

    function DrawDibInit return Win32.BOOL;                 -- vfw.h:1197

    function DrawDibOpen return HDRAWDIB;                   -- vfw.h:1203

    function DrawDibClose(
                hdd: HDRAWDIB)
               return Win32.BOOL;                           -- vfw.h:1209

    function DrawDibGetBuffer(
                hdd    : HDRAWDIB;
                lpbi   : Win32.Wingdi.LPBITMAPINFOHEADER;
                dwSize : Win32.DWORD;
                dwFlags: Win32.DWORD)
               return Win32.LPVOID;                         -- vfw.h:1215

    function DrawDibError(
                hdd: HDRAWDIB)
               return Win32.UINT;                           -- vfw.h:1220

    function DrawDibGetPalette(
                hdd: HDRAWDIB)
               return Win32.Windef.HPALETTE;                -- vfw.h:1228

    function DrawDibSetPalette(
                hdd : HDRAWDIB;
                hpal: Win32.Windef.HPALETTE)
               return Win32.BOOL;                           -- vfw.h:1237

    function DrawDibChangePalette(
                hdd   : HDRAWDIB;
                iStart: Win32.INT;
                iLen  : Win32.INT;
                lppe  : Win32.Wingdi.LPPALETTEENTRY)
               return Win32.BOOL;                           -- vfw.h:1242

    function DrawDibRealize(
                hdd        : HDRAWDIB;
                hdc        : Win32.Windef.HDC;
                fBackground: Win32.BOOL)
               return Win32.UINT;                           -- vfw.h:1250

    function DrawDibStart(
                hdd : HDRAWDIB;
                rate: Win32.DWORD)
               return Win32.BOOL;                           -- vfw.h:1258

    function DrawDibStop(
                hdd: HDRAWDIB)
               return Win32.BOOL;                           -- vfw.h:1266

    function DrawDibBegin(
                hdd   : HDRAWDIB;
                hdc   : Win32.Windef.HDC;
                dxDst : Win32.INT;
                dyDst : Win32.INT;
                lpbi  : Win32.Wingdi.LPBITMAPINFOHEADER;
                dxSrc : Win32.INT;
                dySrc : Win32.INT;
                wFlags: Win32.UINT)
               return Win32.BOOL;                           -- vfw.h:1274

    function DrawDibDraw(
                hdd   : HDRAWDIB;
                hdc   : Win32.Windef.HDC;
                xDst  : Win32.INT;
                yDst  : Win32.INT;
                dxDst : Win32.INT;
                dyDst : Win32.INT;
                lpbi  : Win32.Wingdi.LPBITMAPINFOHEADER;
                lpBits: Win32.LPVOID;
                xSrc  : Win32.INT;
                ySrc  : Win32.INT;
                dxSrc : Win32.INT;
                dySrc : Win32.INT;
                wFlags: Win32.UINT)
               return Win32.BOOL;                           -- vfw.h:1288

    function DrawDibUpdate(hdd: HDRAWDIB;
                           hdc: Win32.Windef.HDC;
                           x  : Win32.INT;
                           y  : Win32.INT)
                          return Win32.BOOL;                -- vfw.h:1307
 
    function DrawDibEnd(
                hdd: HDRAWDIB)
               return Win32.BOOL;                           -- vfw.h:1313

    function DrawDibTime_func(
                hdd     : HDRAWDIB;
                lpddtime: LPDRAWDIBTIME)
               return Win32.BOOL;                           -- vfw.h:1328

    function DrawDibProfileDisplay(
                lpbi: Win32.Wingdi.LPBITMAPINFOHEADER)
               return Win32.DWORD;                          -- vfw.h:1337

    function FromHex(n: Win32.BYTE)
                     return Win32.BYTE;                     -- vfw.h:1475

    function StreamFromFOURCC(fcc: Win32.Mmsystem.FOURCC) 
                              return Win32.WORD;            -- vfw.h:1476


    function TWOCCFromFOURCC(fcc: Win32.Mmsystem.FOURCC) return TWOCC;
                                                            -- vfw.h:1480

    function ToHex(n: Win32.BYTE)
                   return Win32.BYTE;                       -- vfw.h:1485

    function MAKEAVICKID(tcc   : TWOCC;
                         stream: Win32.USHORT)
                         return Win32.DWORD;                -- vfw.h:1486

    procedure AVIFileInit;                                  -- vfw.h:2027

    procedure AVIStreamInit
               renames AVIFileInit;                         -- vfw.h:2027

    procedure AVIFileExit;                                  -- vfw.h:2028

    procedure AVIStreamExit
               renames AVIFileExit;                         -- vfw.h:2028

    function AVIFileAddRef(
                pfile: PAVIFILE)
               return Win32.ULONG;                          -- vfw.h:2030

    function AVIFileRelease(
                pfile: PAVIFILE)
               return Win32.ULONG;                          -- vfw.h:2031

    function AVIFileClose(
                pfile: PAVIFILE)
               return Win32.ULONG
               renames AVIFileRelease;                      -- vfw.h:2031

    function AVIFileOpenA(
                ppfile   : access PAVIFILE;
                szFile   : Win32.LPCSTR;
                uMode    : Win32.UINT;
                lpHandler: Win32.Objbase.LPCLSID)
               return Win32.Objbase.HRESULT;                -- vfw.h:2034

    function AVIFileOpenW(
                ppfile   : access PAVIFILE;
                szFile   : Win32.LPCWSTR;
                uMode    : Win32.UINT;
                lpHandler: Win32.Objbase.LPCLSID)
               return Win32.Objbase.HRESULT;                -- vfw.h:2036

    function AVIFileOpen(
                ppfile   : access PAVIFILE;
                szFile   : Win32.LPCSTR;
                uMode    : Win32.UINT;
                lpHandler: Win32.Objbase.LPCLSID)
               return Win32.Objbase.HRESULT
               renames AVIFileOpenA;                        -- vfw.h:2042

    function AVIFileInfoW_func(
                pfile: PAVIFILE;
                pfi  : LPAVIFILEINFOW;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2051

    function AVIFileInfoA_func(
                pfile: PAVIFILE;
                pfi  : LPAVIFILEINFOA;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2052

    function AVIFileInfo_func(
                pfile: PAVIFILE;
                pfi  : LPAVIFILEINFOA;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT
               renames AVIFileInfoA_func;                   -- vfw.h:2052

    function AVIFileGetStream(
                pfile  : PAVIFILE;
                ppavi  : access PAVISTREAM;
                fccType: Win32.DWORD;
                lParam : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2064

    function AVIFileCreateStream(
                pfile: PAVIFILE;
                ppavi: access PAVISTREAM;
                psi  : access AVISTREAMINFOW)
               return Win32.Objbase.HRESULT;                -- vfw.h:2067

    function AVIFileWriteData(
                pfile : PAVIFILE;
                ckid  : Win32.DWORD;
                lpData: Win32.LPVOID;
                cbData: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2071

    function AVIFileReadData(
                pfile   : PAVIFILE;
                ckid    : Win32.DWORD;
                lpData  : Win32.LPVOID;
                lpcbData: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2075

    function AVIFileEndRecord(
                pfile: PAVIFILE)
               return Win32.Objbase.HRESULT;                -- vfw.h:2079

    function AVIStreamAddRef(
                pavi: PAVISTREAM)
               return Win32.ULONG;                          -- vfw.h:2081

    function AVIStreamRelease(
                pavi: PAVISTREAM)
               return Win32.ULONG;                          -- vfw.h:2082

    function AVIStreamClose(
                pavi: PAVISTREAM)
               return Win32.ULONG
               renames AVIStreamRelease;                    -- vfw.h:2082

    function AVIStreamInfoW_func(
                pavi : PAVISTREAM;
                psi  : LPAVISTREAMINFOW;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2084

    function AVIStreamInfoA_func(
                pavi : PAVISTREAM;
                psi  : LPAVISTREAMINFOA;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2085

    function AVIStreamInfo_func(
                pavi : PAVISTREAM;
                psi  : LPAVISTREAMINFOA;
                lSize: Win32.LONG)
               return Win32.Objbase.HRESULT
               renames AVIStreamInfoA_func;                 -- vfw.h:2085

    function AVIStreamFindSample(
                pavi  : PAVISTREAM;
                lPos  : Win32.LONG;
                lFlags: Win32.LONG)
               return Win32.LONG;                           -- vfw.h:2092

    function AVIStreamFindKeyFrame(
                pavi  : PAVISTREAM;
                lPos  : Win32.LONG;
                lFlags: Win32.LONG)
               return Win32.LONG
               renames AVIStreamFindSample;                 -- vfw.h:2092

    function AVIStreamReadFormat(
                pavi      : PAVISTREAM;
                lPos      : Win32.LONG;
                lpFormat  : Win32.LPVOID;
                lpcbFormat: Win32.PLONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2093

    function AVIStreamSetFormat(
                pavi    : PAVISTREAM;
                lPos    : Win32.LONG;
                lpFormat: Win32.LPVOID;
                cbFormat: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2094

    function AVIStreamReadData(
                pavi: PAVISTREAM;
                fcc : Win32.DWORD;
                lp  : Win32.LPVOID;
                lpcb: Win32.PLONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2095

    function AVIStreamWriteData(
                pavi: PAVISTREAM;
                fcc : Win32.DWORD;
                lp  : Win32.LPVOID;
                cb  : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2096

    function AVIStreamRead(
                pavi     : PAVISTREAM;
                lStart   : Win32.LONG;
                lSamples : Win32.LONG;
                lpBuffer : Win32.LPVOID;
                cbBuffer : Win32.LONG;
                plBytes  : Win32.PLONG;
                plSamples: Win32.PLONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2098

    function AVIStreamWrite(
                pavi          : PAVISTREAM;
                lStart        : Win32.LONG;
                lSamples      : Win32.LONG;
                lpBuffer      : Win32.LPVOID;
                cbBuffer      : Win32.LONG;
                dwFlags       : Win32.DWORD;
                plSampWritten : access Win32.LONG;
                plBytesWritten: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2107

    function AVIStreamStart(
                pavi: PAVISTREAM)
               return Win32.LONG;                           -- vfw.h:2115

    function AVIStreamLength(
                pavi: PAVISTREAM)
               return Win32.LONG;                           -- vfw.h:2116

    function AVIStreamTimeToSample(
                pavi : PAVISTREAM;
                lTime: Win32.LONG)
               return Win32.LONG;                           -- vfw.h:2117

    function AVIStreamSampleToTime(
                pavi   : PAVISTREAM;
                lSample: Win32.LONG)
               return Win32.LONG;                           -- vfw.h:2118

    function AVIStreamBeginStreaming(
                pavi  : PAVISTREAM;
                lStart: Win32.LONG;
                lEnd  : Win32.LONG;
                lRate : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2121

    function AVIStreamEndStreaming(
                pavi: PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:2122

    function AVIStreamGetFrameOpen(
                pavi      : PAVISTREAM;
                lpbiWanted: Win32.Wingdi.LPBITMAPINFOHEADER)
               return PGETFRAME;                            -- vfw.h:2127

    function AVIStreamGetFrame(
                pg  : PGETFRAME;
                lPos: Win32.LONG)
               return Win32.LPVOID;                         -- vfw.h:2129

    function AVIStreamGetFrameClose(
                pg: PGETFRAME)
               return Win32.Objbase.HRESULT;                -- vfw.h:2130

    function AVIStreamOpenFromFileA(
                ppavi        : access PAVISTREAM;
                szFile       : Win32.LPCSTR;
                fccType      : Win32.DWORD;
                lParam       : Win32.LONG;
                mode         : Win32.UINT;
                pclsidHandler: access Win32.Objbase.CLSID)
               return Win32.Objbase.HRESULT;                -- vfw.h:2139

    function AVIStreamOpenFromFile(
                ppavi        : access PAVISTREAM;
                szFile       : Win32.LPCSTR;
                fccType      : Win32.DWORD;
                lParam       : Win32.LONG;
                mode         : Win32.UINT;
                pclsidHandler: access Win32.Objbase.CLSID)
               return Win32.Objbase.HRESULT
               renames AVIStreamOpenFromFileA;              -- vfw.h:2139

    function AVIStreamOpenFromFileW(
                ppavi        : access PAVISTREAM;
                szFile       : Win32.LPCWSTR;
                fccType      : Win32.DWORD;
                lParam       : Win32.LONG;
                mode         : Win32.UINT;
                pclsidHandler: access Win32.Objbase.CLSID)
               return Win32.Objbase.HRESULT;                -- vfw.h:2142

    function AVIStreamCreate(
                ppavi        : access PAVISTREAM;
                lParam1      : Win32.LONG;
                lParam2      : Win32.LONG;
                pclsidHandler: access Win32.Objbase.CLSID)
               return Win32.Objbase.HRESULT;                -- vfw.h:2152

    function AVIStreamSampleToSample(pavi1: PAVISTREAM;
                                     pavi2: PAVISTREAM;
                                     l    : Win32.LONG)
                                     return Win32.LONG;     -- vfw.h:2200
 
    function AVIStreamNextSample(pavi: PAVISTREAM;
                                 l   : Win32.LONG)
                                 return Win32.LONG;         -- vfw.h:2203

    function AVIStreamPrevSample(pavi: PAVISTREAM;
                                 l   : Win32.LONG)
                                return Win32.LONG;          -- vfw.h:2206

    function AVIStreamNearestSample(pavi: PAVISTREAM;
                                    l   : Win32.LONG)
                                    return Win32.LONG;      -- vfw.h:2209

    function AVIStreamNextKeyFrame(pavi: PAVISTREAM;
                                   l   : Win32.LONG)
                                   return Win32.LONG;       -- vfw.h:2212

    function AVIStreamPrevKeyFrame(pavi: PAVISTREAM;
                                   l   : Win32.LONG)
                                   return Win32.LONG;       -- vfw.h:2215

    function AVIStreamNearestKeyFrame(pavi: PAVISTREAM;
                                      l   : Win32.LONG)
                                      return Win32.LONG;    -- vfw.h:2218

    function AVIStreamIsKeyFrame(pavi: PAVISTREAM;
                                 l   : Win32.LONG)
                                 return Win32.BOOL;         -- vfw.h:2221

    function AVIStreamPrevSampleTime(pavi: PAVISTREAM;
                                     t   : Win32.LONG)
                                     return Win32.LONG;     -- vfw.h:2224

    function AVIStreamNextSampleTime(pavi: PAVISTREAM; 
                                     t   : Win32.LONG)
                                     return Win32.LONG;     -- vfw.h:2227

    function AVIStreamNearestSampleTime(pavi: PAVISTREAM; 
                                        t   : Win32.LONG)
                                        return Win32.LONG;
                                                            -- vfw.h:2230

    function AVIStreamNextKeyFrameTime(pavi: PAVISTREAM;
                                       t   : Win32.LONG)
                                       return Win32.LONG;
                                                            --vfw.h:2233

    function AVIStreamPrevKeyFrameTime(pavi: PAVISTREAM;
                                       t   : Win32.LONG)
                                       return Win32.LONG;
                                                            -- vfw.h:2236

    function AVIStreamNearestKeyFrameTime(pavi: PAVISTREAM;
                                          t   : Win32.LONG)
                                          return Win32.LONG;
                                                            --vfw.h:2239

    function AVIStreamStartTime(pavi: PAVISTREAM)
                                return Win32.LONG;          -- vfw.h:2242

    function AVIStreamLengthTime(pavi: PAVISTREAM)
                                 return Win32.LONG;         -- vfw.h:2245

    function AVIStreamEnd(pavi: PAVISTREAM)
                          return Win32.LONG;                -- vfw.h:2248

    function AVIStreamEndTime(pavi: PAVISTREAM)
                              return Win32.LONG;            -- vfw.h:2251

    function AVIStreamSampleSize(pavi  : PAVISTREAM;
                                 lPos  : Win32.LONG;
                                 plSize: access Win32.LONG)
                                 return Win32.Objbase.HRESULT;  
                                                            -- vfw.h:2253

    function AVIStreamFormatSize(pavi  : PAVISTREAM;
                                 lPos  : Win32.LONG; 
                                 plSize: access Win32.LONG)
                                 return Win32.Objbase.HRESULT;  
                                                            -- vfw.h:2257

    function AVIStreamDataSize(pavi  : PAVISTREAM;
                               fcc   : Win32.DWORD;
                               plSize: access Win32.LONG)
                               return Win32.Objbase.HRESULT;    
                                                            -- vfw.h:2260

    function AVIMakeCompressedStream(
                ppsCompressed: access PAVISTREAM;
                ppsSource    : PAVISTREAM;
                lpOptions    : access AVICOMPRESSOPTIONS;
                pclsidHandler: access Win32.Objbase.CLSID)
               return Win32.Objbase.HRESULT;                -- vfw.h:2273

    function AVISaveA(
                szFile       : Win32.LPCSTR;
                pclsidHandler: access Win32.Objbase.CLSID;
                lpfnCallback : AVISAVECALLBACK;
                nStreams     : Win32.INT;
                pfile        : PAVISTREAM;
                lpOptions    : LPAVICOMPRESSOPTIONS;
                Args         : Stdarg.ArgList := Stdarg.Empty)
               return Win32.Objbase.HRESULT;                -- vfw.h:2279

    function AVISave(
                szFile       : Win32.LPCSTR;
                pclsidHandler: access Win32.Objbase.CLSID;
                lpfnCallback : AVISAVECALLBACK;
                nStreams     : Win32.INT;
                pfile        : PAVISTREAM;
                lpOptions    : LPAVICOMPRESSOPTIONS;
                Args         : Stdarg.ArgList := Stdarg.Empty)
               return Win32.Objbase.HRESULT
               renames AVISaveA;                            -- vfw.h:2279

    function AVISaveVA(
                szFile       : Win32.LPCSTR;
                pclsidHandler: access Win32.Objbase.CLSID;
                lpfnCallback : AVISAVECALLBACK;
                nStreams     : Win32.INT;
                ppavi        : access PAVISTREAM;
                plpOptions   : access LPAVICOMPRESSOPTIONS)
               return Win32.Objbase.HRESULT;                -- vfw.h:2287

    function AVISaveV(
                szFile       : Win32.LPCSTR;
                pclsidHandler: access Win32.Objbase.CLSID;
                lpfnCallback : AVISAVECALLBACK;
                nStreams     : Win32.INT;
                ppavi        : access PAVISTREAM;
                plpOptions   : access LPAVICOMPRESSOPTIONS)
               return Win32.Objbase.HRESULT
               renames AVISaveVA;                           -- vfw.h:2287

    function AVISaveW(
                szFile       : Win32.LPCWSTR;
                pclsidHandler: access Win32.Objbase.CLSID;
                lpfnCallback : AVISAVECALLBACK;
                nStreams     : Win32.INT;
                pfile        : PAVISTREAM;
                lpOptions    : LPAVICOMPRESSOPTIONS;
                Args         : Stdarg.ArgList := Stdarg.Empty)
               return Win32.Objbase.HRESULT;                -- vfw.h:2293

    function AVISaveVW(
                szFile       : Win32.LPCWSTR;
                pclsidHandler: access Win32.Objbase.CLSID;
                lpfnCallback : AVISAVECALLBACK;
                nStreams     : Win32.INT;
                ppavi        : access PAVISTREAM;
                plpOptions   : access LPAVICOMPRESSOPTIONS)
               return Win32.Objbase.HRESULT;                -- vfw.h:2301

    function AVISaveOptions(
                hwnd      : Win32.Windef.HWND;
                uiFlags   : Win32.UINT;
                nStreams  : Win32.INT;
                ppavi     : access PAVISTREAM;
                plpOptions: access LPAVICOMPRESSOPTIONS)
               return Win32.BOOL;                           -- vfw.h:2317

    function AVISaveOptionsFree(
                nStreams  : Win32.INT;
                plpOptions: access LPAVICOMPRESSOPTIONS)
               return Win32.Objbase.HRESULT;                -- vfw.h:2323

    function AVIBuildFilterW(
                lpszFilter: Win32.LPWSTR;
                cbFilter  : Win32.LONG;
                fSaving   : Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- vfw.h:2332

    function AVIBuildFilterA(
                lpszFilter: Win32.LPSTR;
                cbFilter  : Win32.LONG;
                fSaving   : Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- vfw.h:2333

    function AVIBuildFilter(
                lpszFilter: Win32.LPSTR;
                cbFilter  : Win32.LONG;
                fSaving   : Win32.BOOL)
               return Win32.Objbase.HRESULT
               renames AVIBuildFilterA;                     -- vfw.h:2333

    function AVIMakeFileFromStreams(
                ppfile    : access PAVIFILE;
                nStreams  : Win32.INT;
                papStreams: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:2339

    function AVIMakeStreamFromClipboard(
                cfFormat: Win32.UINT;
                hGlobal : Win32.Winnt.HANDLE;
                ppstream: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:2343

    function AVIPutFileOnClipboard(
                pf: PAVIFILE)
               return Win32.Objbase.HRESULT;                -- vfw.h:2351

    function AVIGetFromClipboard(
                lppf: access PAVIFILE)
               return Win32.Objbase.HRESULT;                -- vfw.h:2353

    function AVIClearClipboard return Win32.Objbase.HRESULT;-- vfw.h:2355

    function CreateEditableStream(
                ppsEditable: access PAVISTREAM;
                psSource   : PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:2362

    function EditStreamCut(
                pavi    : PAVISTREAM;
                plStart : access Win32.LONG;
                plLength: access Win32.LONG;
                ppResult: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:2366

    function EditStreamCopy(
                pavi    : PAVISTREAM;
                plStart : access Win32.LONG;
                plLength: access Win32.LONG;
                ppResult: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:2368

    function EditStreamPaste(
                pavi    : PAVISTREAM;
                plPos   : access Win32.LONG;
                plLength: access Win32.LONG;
                pstream : PAVISTREAM;
                lStart  : Win32.LONG;
                lEnd    : Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2370

    function EditStreamClone(
                pavi    : PAVISTREAM;
                ppResult: access PAVISTREAM)
               return Win32.Objbase.HRESULT;                -- vfw.h:2372

    function EditStreamSetNameA(
                pavi    : PAVISTREAM;
                lpszName: Win32.LPCSTR)
               return Win32.Objbase.HRESULT;                -- vfw.h:2375

    function EditStreamSetName(
                pavi    : PAVISTREAM;
                lpszName: Win32.LPCSTR)
               return Win32.Objbase.HRESULT
               renames EditStreamSetNameA;                  -- vfw.h:2375

    function EditStreamSetNameW(
                pavi    : PAVISTREAM;
                lpszName: Win32.LPCWSTR)
               return Win32.Objbase.HRESULT;                -- vfw.h:2376

    function EditStreamSetInfoW(
                pavi  : PAVISTREAM;
                lpInfo: LPAVISTREAMINFOW;
                cbInfo: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2377

    function EditStreamSetInfoA(
                pavi  : PAVISTREAM;
                lpInfo: LPAVISTREAMINFOA;
                cbInfo: Win32.LONG)
               return Win32.Objbase.HRESULT;                -- vfw.h:2378

    function EditStreamSetInfo(
                pavi  : PAVISTREAM;
                lpInfo: LPAVISTREAMINFOA;
                cbInfo: Win32.LONG)
               return Win32.Objbase.HRESULT
               renames EditStreamSetInfoA;                  -- vfw.h:2378

    function MAKE_AVIERR(error: Win32.WORD) return Win32.Winerror.HRESULT;
                                                            -- vfw.h:2392
    pragma Inline(MAKE_AVIERR);

    
    function MCIWndSM(hWnd  : Win32.Windef.HWND;
                      Msg   : Win32.UINT;
                      wParam: Win32.WPARAM;
                      lParam: Win32.LPARAM)
                              return Win32.LRESULT          -- vfw.h:2505
                              renames Win32.Winuser.SendMessage;

    function MCIWndCanPlay(hwnd: Win32.Windef.HWND)         
                           return Win32.BOOL;               -- vfw.h:2582
            
    function MCIWndCanRecord(hwnd: Win32.Windef.HWND)       
                             return Win32.BOOL;             -- vfw.h:2583
    
    function MCIWndCanSave(hwnd: Win32.Windef.HWND)
                           return Win32.BOOL;               -- vfw.h:2584
                
    function MCIWndCanWindow(hwnd: Win32.Windef.HWND)
                             return Win32.BOOL;             -- vfw.h:2585
                
    function MCIWndCanEject(hwnd: Win32.Windef.HWND)
                            return Win32.BOOL;              -- vfw.h:2586
                
    function MCIWndCanConfig(hwnd: Win32.Windef.HWND)
                             return Win32.BOOL;             -- vfw.h:2587
                
    function MCIWndPaletteKick(hwnd: Win32.Windef.HWND)
                               return Win32.BOOL;           -- vfw.h:2588
    
    function MCIWndSave(hwnd  : Win32.Windef.HWND;
                        szFile: Win32.LPVOID)
                        return Win32.LONG;                  -- vfw.h:2590
        
    function MCIWndSaveDialog(hwnd: Win32.Windef.HWND)      
                              return Win32.LONG;            -- vfw.h:2591

    function MCIWndNew(hwnd: Win32.Windef.HWND;
                       lp  : Win32.LPVOID)
                        return Win32.LONG;                  -- vfw.h:2594
                            
    
    function MCIWndRecord(hwnd: Win32.Windef.HWND)
                          return Win32.LONG;                -- vfw.h:2596
                
    function MCIWndOpen(hwnd: Win32.Windef.HWND;
                        sz  : Win32.LPVOID;
                        f   : Win32.BOOL)
                        return Win32.LONG;                  -- vfw.h:2597
                                        
    function MCIWndOpenDialog(hwnd: Win32.Windef.HWND)      
                              return Win32.LONG;            -- vfw.h:2598
    
    function MCIWndClose(hwnd: Win32.Windef.HWND)
                         return Win32.LONG;                 -- vfw.h:2599
                
    function MCIWndPlay(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2600
                
    function MCIWndStop(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2601
                
    function MCIWndPause(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2602
                
    function MCIWndResume(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2603
                
    function MCIWndSeek(hwnd: Win32.Windef.HWND;
                        lPos: Win32.LONG)
                        return Win32.LONG;                  -- vfw.h:2604
                
    function MCIWndEject(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2605
    
    function MCIWndHome(hwnd: Win32.Windef.HWND)            
                        return Win32.LONG;                  -- vfw.h:2607
    
    function MCIWndEnd(hwnd: Win32.Windef.HWND)             
                        return Win32.LONG;                  -- vfw.h:2608
        
    function MCIWndGetSource(hwnd: Win32.Windef.HWND;
                             prc : Win32.Windef.LPRECT)
                             return Win32.LONG;             -- vfw.h:2610
                
    function MCIWndPutSource(hwnd: Win32.Windef.HWND;
                             prc : Win32.Windef.LPRECT)
                             return Win32.LONG;             -- vfw.h:2611
    
    function MCIWndGetDest(hwnd: Win32.Windef.HWND;
                           prc : Win32.Windef.LPRECT)
                           return Win32.LONG;               -- vfw.h:2613
                
    function MCIWndPutDest(hwnd: Win32.Windef.HWND;
                           prc : Win32.Windef.LPRECT)
                           return Win32.LONG;               -- vfw.h:2614
    
    function MCIWndPlayReverse(hwnd: Win32.Windef.HWND)
                               return Win32.LONG;           -- vfw.h:2616
                
    function MCIWndPlayFrom(hwnd: Win32.Windef.HWND;
                            lPos: Win32.LONG)
                          return Win32.LONG;                -- vfw.h:2617
                
    function MCIWndPlayTo(hwnd: Win32.Windef.HWND;
                          lPos: Win32.LONG)
                          return Win32.LONG;                -- vfw.h:2618
                
    function MCIWndPlayFromTo(hwnd  : Win32.Windef.HWND; 
                              lStart: Win32.LONG;
                              lEnd  : Win32.LONG ) 
                              return Win32.LONG;            -- vfw.h:2619

    function MCIWndGetDeviceID(hwnd: Win32.Windef.HWND)
                        return Win32.UINT;                  -- vfw.h:2621
                
    function MCIWndGetAlias(hwnd: Win32.Windef.HWND)
                        return Win32.UINT;                  -- vfw.h:2622
                
    function MCIWndGetMode(hwnd: Win32.Windef.HWND;
                           lp  : Win32.Winnt.LPTSTR;
                           len : Win32.UINT)
                           return Win32.LONG;               -- vfw.h:2623
        
    function MCIWndGetPosition(hwnd: Win32.Windef.HWND)
                               return Win32.LONG;           -- vfw.h:2624
                
    function MCIWndGetPositionString(hwnd: Win32.Windef.HWND;
                                     lp  : Win32.Winnt.LPTSTR;
                                     len : Win32.UINT)
                        return Win32.LONG;                  -- vfw.h:2625
        
    function MCIWndGetStart(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2626
                
    function MCIWndGetLength(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2627
                
    function MCIWndGetEnd(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2628
            
    
    function MCIWndStep(hwnd: Win32.Windef.HWND;
                        n   : Win32.LONG)
                        return Win32.LONG;                  -- vfw.h:2630
    
    procedure MCIWndDestroy(hwnd: Win32.Windef.HWND);       -- vfw.h:2632
        
    procedure MCIWndSetZoom(hwnd : Win32.Windef.HWND;
                           iZoom: Win32.UINT);              -- vfw.h:2633
        
    function MCIWndGetZoom(hwnd: Win32.Windef.HWND)
                        return Win32.UINT;                  -- vfw.h:2634
                
    function MCIWndSetVolume(hwnd: Win32.Windef.HWND;
                             iVol: Win32.UINT)
                             return Win32.LONG;             -- vfw.h:2635
        
    function MCIWndGetVolume(hwnd: Win32.Windef.HWND)
                             return Win32.LONG;             -- vfw.h:2636
                
    function MCIWndSetSpeed(hwnd  : Win32.Windef.HWND;
                            iSpeed: Win32.UINT)
                            return Win32.LONG;              -- vfw.h:2637
        
    function MCIWndGetSpeed(hwnd: Win32.Windef.HWND)
                        return Win32.LONG;                  -- vfw.h:2638
                
    function MCIWndSetTimeFormat(hwnd: Win32.Windef.HWND;
                                 lp  : Win32.Winnt.LPTSTR)
                                 return Win32.LONG;         -- vfw.h:2639
                
    function MCIWndGetTimeFormat(hwnd: Win32.Windef.HWND;
                                 lp  : Win32.Winnt.LPTSTR; 
                                 len : Win32.UINT)
                                 return Win32.LONG;         -- vfw.h:2640

    procedure MCIWndValidateMedia(hwnd: Win32.Windef.HWND); -- vfw.h:2641
    
    procedure MCIWndSetRepeat(hwnd: Win32.Windef.HWND;
                              f   : Win32.BOOL);            -- vfw.h:2643
        
    function MCIWndGetRepeat(hwnd: Win32.Windef.HWND)
                             return Win32.BOOL;             -- vfw.h:2644
    
    procedure MCIWndSetActiveTimer(hwnd  : Win32.Windef.HWND;
                                   active: Win32.UINT);
                                        -- vfw.h:2649                   
    procedure MCIWndSetInactiveTimer(hwnd    : Win32.Windef.HWND;
                                     inactive: Win32.UINT);
                                        -- vfw.h:2652
    
    procedure MCIWndSetTimers(hwnd    : Win32.Windef.HWND;
                              active  : Win32.UINT;
                              inactive: Win32.UINT);        -- vfw.h:2655
    
    function MCIWndGetActiveTimer(hwnd: Win32.Windef.HWND) 
                                return Win32.UINT;          -- vfw.h:2658
            
    function MCIWndGetInactiveTimer(hwnd: Win32.Windef.HWND)    
                                return Win32.UINT;          -- vfw.h:2658
                
    function MCIWndRealize(hwnd  : Win32.Windef.HWND;
                           fBkgnd: Win32.BOOL)
                           return Win32.LONG;               -- vfw.h:2663
    
    function MCIWndSendString(hwnd: Win32.Windef.HWND;
                              sz  : Win32.Winnt.LPTSTR)
                              return Win32.LONG;            -- vfw.h:2665

    function MCIWndReturnString(hwnd: Win32.Windef.HWND;
                                lp  : Win32.LPVOID;
                                len : Win32.UINT)
                                return Win32.LONG;          -- vfw.h:2666

    function MCIWndGetError(hwnd: Win32.Windef.HWND;
                            lp  : Win32.LPVOID; 
                            len : Win32.UINT)
                            return Win32.LONG;              -- vfw.h:2667
                                    
    function MCIWndGetPalette(hwnd: Win32.Windef.HWND)
                        return Win32.Windef.HPALETTE;       -- vfw.h:2671
                
    function MCIWndSetPalette(hwnd: Win32.Windef.HWND;
                              hpal: Win32.Windef.HPALETTE)
                              return Win32.LONG;            -- vfw.h:2672

    function MCIWndGetFileName(hwnd: Win32.Windef.HWND;
                               lp  : Win32.LPVOID;
                               len : Win32.UINT)
                               return Win32.LONG;           -- vfw.h:2674

    function MCIWndGetDevice(hwnd: Win32.Windef.HWND;
                             lp  : Win32.LPVOID; 
                             len : Win32.UINT)
                             return Win32.LONG;             -- vfw.h:2675

    function MCIWndGetStyles(hwnd: Win32.Windef.HWND)
                        return Win32.UINT;                  -- vfw.h:2677
                
    function MCIWndChangeStyles(hwnd : Win32.Windef.HWND;
                                mask : Win32.UINT;
                                value: Win32.LONG)
                                return Win32.LONG;          -- vfw.h:2678
    
    function MCIWndOpenInterface(hwnd: Win32.Windef.HWND;
                                 pUnk: Win32.Objbase.LPUNKNOWN)
                                 return Win32.LONG;         -- vfw.h:2680
                            
    function MCIWndSetOwner(hwnd : Win32.Windef.HWND;
                            hwndP: Win32.Windef.HWND)
                            return Win32.LONG;              -- vfw.h:2682

    

    function MCIWndCreateA(
                hwndParent: Win32.Windef.HWND;
                hInstance : Win32.Windef.HINSTANCE;
                dwStyle   : Win32.DWORD;
                szFile    : Win32.LPCSTR)
               return Win32.Windef.HWND;                    -- vfw.h:2509

    function MCIWndCreate(
                hwndParent: Win32.Windef.HWND;
                hInstance : Win32.Windef.HINSTANCE;
                dwStyle   : Win32.DWORD;
                szFile    : Win32.LPCSTR)
               return Win32.Windef.HWND
               renames MCIWndCreateA;                       -- vfw.h:2509

    function MCIWndCreateW(
                hwndParent: Win32.Windef.HWND;
                hInstance : Win32.Windef.HINSTANCE;
                dwStyle   : Win32.DWORD;
                szFile    : Win32.LPCWSTR)
               return Win32.Windef.HWND;                    -- vfw.h:2511

    function MCIWndRegisterClass return Win32.BOOL;         -- vfw.h:2518


    function AVICapSM(hWnd  : Win32.Windef.HWND;
                      Msg   : Win32.UINT;
                      wParam: Win32.WPARAM;
                      lParam: Win32.LPARAM)
                              return Win32.LRESULT          -- vfw.h:3041
                              renames Win32.Winuser.SendMessage;

    function capSetCallbackOnError(hwnd  : Win32.Windef.HWND;
                                   fpProc: Win32.LPVOID)       
                                   return Win32.BOOL;       -- vfw.h:3215

    
    function capSetCallbackOnStatus(hwnd  : Win32.Windef.HWND;
                                    fpProc: Win32.LPVOID)      
                                    return Win32.BOOL;      -- vfw.h:3216

    
    function capSetCallbackOnYield(hwnd  : Win32.Windef.HWND;
                                   fpProc: Win32.LPVOID)       
                                   return Win32.BOOL;       -- vfw.h:3217

    
    function capSetCallbackOnFrame(hwnd  : Win32.Windef.HWND;
                                   fpProc: Win32.LPVOID)       
                                   return Win32.BOOL;       -- vfw.h:3218

    
    function capSetCallbackOnVideoStream(hwnd  : Win32.Windef.HWND;
                                         fpProc: Win32.LPVOID) 
                                         return Win32.BOOL; -- vfw.h:3219

    
    function capSetCallbackOnWaveStream(
                hwnd: Win32.Windef.HWND;
                fpProc: Win32.LPVOID)  
                return Win32.BOOL;                          -- vfw.h:3220

    
    function capSetCallbackOnCapControl(hwnd  : Win32.Windef.HWND;
                                        fpProc: Win32.LPVOID)  
                                        return Win32.BOOL;  -- vfw.h:3221

    function capSetUserData(hwnd : Win32.Windef.HWND;
                            lUser: Win32.LONG)       
                            return Win32.BOOL;              -- vfw.h:3223
    
    function capGetUserData(hwnd: Win32.Windef.HWND)
                            return Win32.LRESULT;           -- vfw.h:3224  

    function capDriverConnect(hwnd: Win32.Windef.HWND;
                              i   : Win32.INT)                 
                              return Win32.BOOL;            -- vfw.h:3226

    function capDriverDisconnect(hwnd: Win32.Windef.HWND)                  
                        return Win32.BOOL;                  -- vfw.h:3227

    function capDriverGetName(hwnd  : Win32.Windef.HWND;
                              szName: Win32.Winnt.LPTSTR;
                              wSize : Win32.WORD)     
                              return Win32.BOOL;            -- vfw.h:3228

    function capDriverGetVersion(hwnd : Win32.Windef.HWND;
                                 szVer: Win32.Winnt.LPTSTR; 
                                 wSize: Win32.WORD)   
                                 return Win32.BOOL;         -- vfw.h:3229

    function capDriverGetCaps(hwnd : Win32.Windef.HWND;
                              s    : LPCAPDRIVERCAPS;
                              wSize:Win32.WORD)          
                              return Win32.BOOL;            -- vfw.h:3230

    function capFileSetCaptureFile(hwnd  : Win32.Windef.HWND;
                                   szName: Win32.Winnt.LPTSTR)       
                                   return Win32.BOOL;       -- vfw.h:3232

    function capFileGetCaptureFile(hwnd  : Win32.Windef.HWND;
                                   szName: Win32.Winnt.LPTSTR;
                                   wSize : Win32.WORD)
                                   return Win32.BOOL;       -- vfw.h:3233
    
    function capFileAlloc(hwnd  : Win32.Windef.HWND;
                          dwSize: Win32.DWORD)                
                          return Win32.BOOL;                -- vfw.h:3234
    
    function capFileSaveAs(hwnd  : Win32.Windef.HWND;
                           szName: Win32.Winnt.LPTSTR)               
                           return Win32.BOOL;               -- vfw.h:3235
    
    function capFileSetInfoChunk(hwnd       : Win32.Windef.HWND;
                                 lpInfoChunk: LPCAPINFOCHUNK)    
                                 return Win32.BOOL;         -- vfw.h:3236
    
    function capFileSaveDIB(hwnd  : Win32.Windef.HWND;
                            szName: Win32.Winnt.LPTSTR)              
                            return Win32.BOOL;              -- vfw.h:3237

    function capEditCopy(hwnd: Win32.Windef.HWND)                          
                        return Win32.BOOL;                  -- vfw.h:3239

    function capSetAudioFormat(hwnd : Win32.Windef.HWND;
                               s    : Win32.Mmsystem.LPWAVEFORMATEX;
                               wSize: Win32.WORD)         
                        return Win32.BOOL;                  -- vfw.h:3241
    
    function capGetAudioFormat(hwnd : Win32.Windef.HWND;
                               s    : Win32.Mmsystem.LPWAVEFORMATEX;
                               wSize: Win32.WORD)         
                               return Win32.DWORD;          -- vfw.h:3242
    
    function capGetAudioFormatSize(hwnd: Win32.Windef.HWND)                
                                   return Win32.DWORD;      -- vfw.h:3243
    
    function capDlgVideoFormat(hwnd: Win32.Windef.HWND)                    
                               return Win32.BOOL;           -- vfw.h:3245

    function capDlgVideoSource(hwnd: Win32.Windef.HWND)                    
                               return Win32.BOOL;           -- vfw.h:3246

    
    function capDlgVideoDisplay(hwnd: Win32.Windef.HWND)                   
                                return Win32.BOOL;          -- vfw.h:3247
    
    function capDlgVideoCompression(hwnd: Win32.Windef.HWND)               
                                    return Win32.BOOL;      -- vfw.h:3248

    function capGetVideoFormat(hwnd  : Win32.Windef.HWND;
                               s     : Win32.LPVOID; 
                               wSize : Win32.WORD)         
                               return Win32.DWORD;          -- vfw.h:3250
    
    function capGetVideoFormatSize(hwnd: Win32.Windef.HWND)            
                                   return Win32.DWORD;      -- vfw.h:3251
    
    function capSetVideoFormat(hwnd : Win32.Windef.HWND;
                               s    : Win32.LPVOID;
                               wSize: Win32.WORD)         
                               return Win32.BOOL;           -- vfw.h:3252

    function capPreview(hwnd: Win32.Windef.HWND;
                        f   : Win32.BOOL)                       
                        return Win32.BOOL;                  -- vfw.h:3254
    
    function capPreviewRate(hwnd: Win32.Windef.HWND;
                            wMS : Win32.WORD)                 
                            return Win32.BOOL;              -- vfw.h:3255
    
    function capOverlay(hwnd: Win32.Windef.HWND;
                        f   : Win32.BOOL)                       
                        return Win32.BOOL;                  -- vfw.h:3256
    
    function capPreviewScale(hwnd: Win32.Windef.HWND;
                             f   : Win32.BOOL)                  
                             return Win32.BOOL;             -- vfw.h:3257
    
    function capGetStatus(hwnd : Win32.Windef.HWND;
                          s    : LPCAPSTATUS;
                          wSize: Win32.WORD)           
                          return Win32.BOOL;                -- vfw.h:3258
    
    function capSetScrollPos(hwnd: Win32.Windef.HWND;
                             lpP : Win32.Windef.LPPOINT)                
                             return Win32.BOOL;             -- vfw.h:3259
    
    function capGrabFrame(hwnd: Win32.Windef.HWND)                         
                          return Win32.BOOL;                -- vfw.h:3261
    
    function capGrabFrameNoStop(hwnd: Win32.Windef.HWND)                   
                                return Win32.BOOL;          -- vfw.h:3262

    function capCaptureSequence(hwnd: Win32.Windef.HWND)                   
                                return Win32.BOOL;          -- vfw.h:3264

    function capCaptureSequenceNoFile(hwnd: Win32.Windef.HWND)             
                        return Win32.BOOL;                  -- vfw.h:3265

    function capCaptureStop(hwnd: Win32.Windef.HWND)                       
                        return Win32.BOOL;                  -- vfw.h:3266

        function capCaptureAbort(hwnd: Win32.Windef.HWND)                      
                        return Win32.BOOL;                  -- vfw.h:3267

    function capCaptureSingleFrameOpen(hwnd: Win32.Windef.HWND)            
                        return Win32.BOOL;                  -- vfw.h:3269
    
    function capCaptureSingleFrameClose(hwnd: Win32.Windef.HWND)           
                        return Win32.BOOL;                  -- vfw.h:3270
    
    function capCaptureSingleFrame(hwnd: Win32.Windef.HWND)                
                        return Win32.BOOL;                  -- vfw.h:3271

    function capCaptureGetSetup(hwnd : Win32.Windef.HWND;
                                s    : LPCAPTUREPARMS;
                                wSize: Win32.WORD)        
                                return Win32.BOOL;          -- vfw.h:3273
    
    function capCaptureSetSetup(hwnd : Win32.Windef.HWND;
                                s    : LPCAPTUREPARMS;
                                wSize: Win32.WORD)        
                                return Win32.BOOL;          -- vfw.h:3274

    function capSetMCIDeviceName(hwnd  : Win32.Windef.HWND;
                                 szName: Win32.Winnt.LPTSTR)         
                                 return Win32.BOOL;         -- vfw.h:3276
    
    function capGetMCIDeviceName(hwnd  : Win32.Windef.HWND;
                                 szName: Win32.Winnt.LPTSTR;
                                 wSize : Win32.WORD )  
                                 return Win32.BOOL;         -- vfw.h:3277

    function capPaletteOpen(hwnd  : Win32.Windef.HWND;
                            szName: Win32.Winnt.LPTSTR)              
                            return Win32.BOOL;              -- vfw.h:3279
    
    function capPaletteSave(hwnd  : Win32.Windef.HWND;
                            szName: Win32.Winnt.LPTSTR)              
                            return Win32.BOOL;              -- vfw.h:3280
    
    function capPalettePaste(hwnd: Win32.Windef.HWND)                      
                             return Win32.BOOL;             -- vfw.h:3281

    function capPaletteAuto(hwnd   : Win32.Windef.HWND;
                            iFrames: Win32.INT; 
                            iColors: Win32.INT)    
                            return Win32.BOOL;              -- vfw.h:3282
    
    function capPaletteManual(hwnd   : Win32.Windef.HWND;
                              fGrab  : Win32.BOOL;
                              iColors: Win32.INT)    
                              return Win32.BOOL;            -- vfw.h:3283

    function capCreateCaptureWindowA(
                lpszWindowName: Win32.LPCSTR;
                dwStyle       : Win32.DWORD;
                x             : Win32.INT;
                y             : Win32.INT;
                nWidth        : Win32.INT;
                nHeight       : Win32.INT;
                hwndParent    : Win32.Windef.HWND;
                nID           : Win32.INT)
               return Win32.Windef.HWND;                    -- vfw.h:3390

    function capCreateCaptureWindow(
                lpszWindowName: Win32.LPCSTR;
                dwStyle       : Win32.DWORD;
                x             : Win32.INT;
                y             : Win32.INT;
                nWidth        : Win32.INT;
                nHeight       : Win32.INT;
                hwndParent    : Win32.Windef.HWND;
                nID           : Win32.INT)
               return Win32.Windef.HWND
               renames capCreateCaptureWindowA;             -- vfw.h:3390

    function capGetDriverDescriptionA(
                wDriverIndex: Win32.UINT;
                lpszName    : Win32.LPSTR;
                cbName      : Win32.INT;
                lpszVer     : Win32.LPSTR;
                cbVer       : Win32.INT)
               return Win32.BOOL;                           -- vfw.h:3396

    function capGetDriverDescription(
                wDriverIndex: Win32.UINT;
                lpszName    : Win32.LPSTR;
                cbName      : Win32.INT;
                lpszVer     : Win32.LPSTR;
                cbVer       : Win32.INT)
               return Win32.BOOL
               renames capGetDriverDescriptionA;            -- vfw.h:3396

    function capCreateCaptureWindowW(
                lpszWindowName: Win32.LPCWSTR;
                dwStyle       : Win32.DWORD;
                x             : Win32.INT;
                y             : Win32.INT;
                nWidth        : Win32.INT;
                nHeight       : Win32.INT;
                hwndParent    : Win32.Windef.HWND;
                nID           : Win32.INT)
               return Win32.Windef.HWND;                    -- vfw.h:3400

    function capGetDriverDescriptionW(
                wDriverIndex: Win32.UINT;
                lpszName    : Win32.LPWSTR;
                cbName      : Win32.INT;
                lpszVer     : Win32.LPWSTR;
                cbVer       : Win32.INT)
               return Win32.BOOL;                           -- vfw.h:3406

    function GetOpenFileNamePreviewA(
                lpofn: Win32.Commdlg.LPOPENFILENAMEA)
               return Win32.BOOL;                           -- vfw.h:3513

    function GetOpenFileNamePreview(
                lpofn: Win32.Commdlg.LPOPENFILENAMEA)
               return Win32.BOOL
               renames GetOpenFileNamePreviewA;             -- vfw.h:3513

    function GetSaveFileNamePreviewA(
                lpofn: Win32.Commdlg.LPOPENFILENAMEA)
               return Win32.BOOL;                           -- vfw.h:3514

    function GetSaveFileNamePreview(
                lpofn: Win32.Commdlg.LPOPENFILENAMEA)
               return Win32.BOOL
               renames GetSaveFileNamePreviewA;             -- vfw.h:3514

    function GetOpenFileNamePreviewW(
                lpofn: Win32.Commdlg.LPOPENFILENAMEW)
               return Win32.BOOL;                           -- vfw.h:3516

    function GetSaveFileNamePreviewW(
                lpofn: Win32.Commdlg.LPOPENFILENAMEW)
               return Win32.BOOL;                           -- vfw.h:3517

private

    pragma Convention(C, ICOPEN);                           -- vfw.h:290
    pragma Convention(C, ICINFO);                           -- vfw.h:308
    pragma Convention(C, ICCOMPRESS);                       -- vfw.h:347
    pragma Convention(C, ICCOMPRESSFRAMES);                 -- vfw.h:378
    pragma Convention(C, ICSETSTATUSPROC);                  -- vfw.h:393
    pragma Convention(C, ICDECOMPRESS);                     -- vfw.h:414
    pragma Convention(C, ICDECOMPRESSEX);                   -- vfw.h:441
    pragma Convention(C, ICDRAWBEGIN);                      -- vfw.h:478
    pragma Convention(C, ICDRAW);                           -- vfw.h:495
    pragma Convention(C, ICDRAWSUGGEST);                    -- vfw.h:505
    pragma Convention(C, ICPALETTE);                        -- vfw.h:515
    pragma Convention(C, COMPVARS);                         -- vfw.h:1115
    pragma Convention(C, DRAWDIBTIME);                      -- vfw.h:1326
    pragma Convention(C, MainAVIHeader);                    -- vfw.h:1521
    pragma Convention(C, AVIStreamHeader);                  -- vfw.h:1547
    pragma Convention(C, AVIINDEXENTRY);                    -- vfw.h:1565
    pragma Convention(C, AVIPALCHANGE);                     -- vfw.h:1579
    pragma Convention(C, AVISTREAMINFOW);                   -- vfw.h:1655
    pragma Convention(C, AVISTREAMINFOA);                   -- vfw.h:1676
    pragma Convention(C, AVIFILEINFOW);                     -- vfw.h:1715
    pragma Convention(C, AVIFILEINFOA);                     -- vfw.h:1734
    pragma Convention(C, AVICOMPRESSOPTIONS);               -- vfw.h:1794
    pragma Convention(C, IAVIStreamVtbl);                   -- vfw.h:1840
    pragma Convention(C, IAVIStream);                       -- vfw.h:1840
    pragma Convention(C, IAVIStreamingVtbl);                -- vfw.h:1884
    pragma Convention(C, IAVIStreaming);                    -- vfw.h:1884
    pragma Convention(C, IAVIEditStreamVtbl);               -- vfw.h:1906
    pragma Convention(C, IAVIEditStream);                   -- vfw.h:1906
    pragma Convention(C, IAVIFileVtbl);                     -- vfw.h:1940
    pragma Convention(C, IAVIFile);                         -- vfw.h:1940
    pragma Convention(C, IGetFrameVtbl);                    -- vfw.h:1981
    pragma Convention(C, IGetFrame);                        -- vfw.h:1981
    pragma Convention(C, VIDEOHDR);                         -- vfw.h:2944
    pragma Convention(C, CHANNEL_CAPS);                     -- vfw.h:2962
    pragma Convention(C, CAPDRIVERCAPS);                    -- vfw.h:3289
    pragma Convention(C, CAPSTATUS);                        -- vfw.h:3305
    pragma Convention(C, CAPTUREPARMS);                     -- vfw.h:3327
    pragma Convention(C, CAPINFOCHUNK);                     -- vfw.h:3353

    pragma Import(Stdcall, IID_IAVIFile, "IID_IAVIFile");         -- vfw.h:2010
    pragma Import(Stdcall, IID_IAVIStream, "IID_IAVIStream");     -- vfw.h:2011
    pragma Import(Stdcall, IID_IAVIStreaming, "IID_IAVIStreaming");
                                                            -- vfw.h:2012
    pragma Import(Stdcall, IID_IGetFrame, "IID_IGetFrame");       -- vfw.h:2013
    pragma Import(Stdcall, IID_IAVIEditStream, "IID_IAVIEditStream");
                                                            -- vfw.h:2014
    pragma Import(Stdcall, CLSID_AVISimpleUnMarshal, "CLSID_AVISimpleUnMarshal");
                                                            -- vfw.h:2016

    pragma Import(Stdcall, VideoForWindowsVersion, "VideoForWindowsVersion");
                                                            -- vfw.h:64
    pragma Import(Stdcall, InitVFW, "InitVFW");                   -- vfw.h:72
    pragma Import(Stdcall, TermVFW, "TermVFW");                   -- vfw.h:73
    pragma Import(Stdcall, ICInfo_func, "ICInfo");                -- vfw.h:524
    pragma Import(Stdcall, ICInstall, "ICInstall");               -- vfw.h:525
    pragma Import(Stdcall, ICRemove, "ICRemove");                 -- vfw.h:526
    pragma Import(Stdcall, ICGetInfo, "ICGetInfo");               -- vfw.h:527
    pragma Import(Stdcall, ICOpen_func, "ICOpen");                -- vfw.h:529
    pragma Import(Stdcall, ICOpenFunction, "ICOpenFunction");     -- vfw.h:530
    pragma Import(Stdcall, ICClose, "ICClose");                   -- vfw.h:531
    pragma Import(Stdcall, ICSendMessage, "ICSendMessage");       -- vfw.h:533
    pragma Import(Stdcall, ICCompress_func, "ICCompress");        -- vfw.h:612
    pragma Import(Stdcall, ICDecompress_func, "ICDecompress");    -- vfw.h:686
    pragma Import(Stdcall, ICDrawBegin_func, "ICDrawBegin");      -- vfw.h:912
    pragma Import(Stdcall, ICDraw_func, "ICDraw");                -- vfw.h:940
    pragma Import(Stdcall, ICLocate, "ICLocate");                 -- vfw.h:1067
    pragma Import(Stdcall, ICGetDisplayFormat, "ICGetDisplayFormat");
                                                            -- vfw.h:1068
    pragma Import(Stdcall, ICImageCompress, "ICImageCompress");   -- vfw.h:1076
    pragma Import(Stdcall, ICImageDecompress, "ICImageDecompress");
                                                            -- vfw.h:1085
    pragma Import(Stdcall, ICCompressorChoose, "ICCompressorChoose");
                                                            -- vfw.h:1124
    pragma Import(Stdcall, ICSeqCompressFrameStart, "ICSeqCompressFrameStart");
                                                            -- vfw.h:1140
    pragma Import(Stdcall, ICSeqCompressFrameEnd, "ICSeqCompressFrameEnd");
                                                            -- vfw.h:1141
    pragma Import(Stdcall, ICSeqCompressFrame, "ICSeqCompressFrame");
                                                            -- vfw.h:1143
    pragma Import(Stdcall, ICCompressorFree, "ICCompressorFree"); -- vfw.h:1150
    pragma Import(Stdcall, DrawDibInit, "DrawDibInit");           -- vfw.h:1197
    pragma Import(Stdcall, DrawDibOpen, "DrawDibOpen");           -- vfw.h:1203
    pragma Import(Stdcall, DrawDibClose, "DrawDibClose");         -- vfw.h:1209
    pragma Import(Stdcall, DrawDibGetBuffer, "DrawDibGetBuffer"); -- vfw.h:1215
    pragma Import(Stdcall, DrawDibError, "DrawDibError");         -- vfw.h:1220
    pragma Import(Stdcall, DrawDibGetPalette, "DrawDibGetPalette");
                                                            -- vfw.h:1228
    pragma Import(Stdcall, DrawDibSetPalette, "DrawDibSetPalette");
                                                            -- vfw.h:1237
    pragma Import(Stdcall, DrawDibChangePalette, "DrawDibChangePalette");
                                                            -- vfw.h:1242
    pragma Import(Stdcall, DrawDibRealize, "DrawDibRealize");     -- vfw.h:1250
    pragma Import(Stdcall, DrawDibStart, "DrawDibStart");         -- vfw.h:1258
    pragma Import(Stdcall, DrawDibStop, "DrawDibStop");           -- vfw.h:1266
    pragma Import(Stdcall, DrawDibBegin, "DrawDibBegin");         -- vfw.h:1274
    pragma Import(Stdcall, DrawDibDraw, "DrawDibDraw");           -- vfw.h:1288
    pragma Import(Stdcall, DrawDibEnd, "DrawDibEnd");             -- vfw.h:1313
    pragma Import(Stdcall, DrawDibTime_func, "DrawDibTime");      -- vfw.h:1328
    pragma Import(Stdcall, DrawDibProfileDisplay, "DrawDibProfileDisplay");
                                                            -- vfw.h:1337
    pragma Import(Stdcall, AVIFileInit, "AVIFileInit");           -- vfw.h:2027
    pragma Import(Stdcall, AVIFileExit, "AVIFileExit");           -- vfw.h:2028
    pragma Import(Stdcall, AVIFileAddRef, "AVIFileAddRef");       -- vfw.h:2030
    pragma Import(Stdcall, AVIFileRelease, "AVIFileRelease");     -- vfw.h:2031
    pragma Import(Stdcall, AVIFileOpenA, "AVIFileOpenA");         -- vfw.h:2034
    pragma Import(Stdcall, AVIFileOpenW, "AVIFileOpenW");         -- vfw.h:2036
    pragma Import(Stdcall, AVIFileInfoW_func, "AVIFileInfoW");    -- vfw.h:2051
    pragma Import(Stdcall, AVIFileInfoA_func, "AVIFileInfoA");    -- vfw.h:2052
    pragma Import(Stdcall, AVIFileGetStream, "AVIFileGetStream"); -- vfw.h:2064
    pragma Import(Stdcall, AVIFileCreateStream, "AVIFileCreateStream");
                                                            -- vfw.h:2067
    pragma Import(Stdcall, AVIFileWriteData, "AVIFileWriteData"); -- vfw.h:2071
    pragma Import(Stdcall, AVIFileReadData, "AVIFileReadData");   -- vfw.h:2075
    pragma Import(Stdcall, AVIFileEndRecord, "AVIFileEndRecord"); -- vfw.h:2079
    pragma Import(Stdcall, AVIStreamAddRef, "AVIStreamAddRef");   -- vfw.h:2081
    pragma Import(Stdcall, AVIStreamRelease, "AVIStreamRelease"); -- vfw.h:2082
    pragma Import(Stdcall, AVIStreamInfoW_func, "AVIStreamInfoW");-- vfw.h:2084
    pragma Import(Stdcall, AVIStreamInfoA_func, "AVIStreamInfoA");-- vfw.h:2085
    pragma Import(Stdcall, AVIStreamFindSample, "AVIStreamFindSample");
                                                            -- vfw.h:2092
    pragma Import(Stdcall, AVIStreamReadFormat, "AVIStreamReadFormat");
                                                            -- vfw.h:2093
    pragma Import(Stdcall, AVIStreamSetFormat, "AVIStreamSetFormat");
                                                            -- vfw.h:2094
    pragma Import(Stdcall, AVIStreamReadData, "AVIStreamReadData");
                                                            -- vfw.h:2095
    pragma Import(Stdcall, AVIStreamWriteData, "AVIStreamWriteData");
                                                            -- vfw.h:2096
    pragma Import(Stdcall, AVIStreamRead, "AVIStreamRead");       -- vfw.h:2098
    pragma Import(Stdcall, AVIStreamWrite, "AVIStreamWrite");     -- vfw.h:2107
    pragma Import(Stdcall, AVIStreamStart, "AVIStreamStart");     -- vfw.h:2115
    pragma Import(Stdcall, AVIStreamLength, "AVIStreamLength");   -- vfw.h:2116
    pragma Import(Stdcall, AVIStreamTimeToSample, "AVIStreamTimeToSample");
                                                            -- vfw.h:2117
    pragma Import(Stdcall, AVIStreamSampleToTime, "AVIStreamSampleToTime");
                                                            -- vfw.h:2118
    pragma Import(Stdcall, AVIStreamBeginStreaming, "AVIStreamBeginStreaming");
                                                            -- vfw.h:2121
    pragma Import(Stdcall, AVIStreamEndStreaming, "AVIStreamEndStreaming");
                                                            -- vfw.h:2122
    pragma Import(Stdcall, AVIStreamGetFrameOpen, "AVIStreamGetFrameOpen");
                                                            -- vfw.h:2127
    pragma Import(Stdcall, AVIStreamGetFrame, "AVIStreamGetFrame");
                                                            -- vfw.h:2129
    pragma Import(Stdcall, AVIStreamGetFrameClose, "AVIStreamGetFrameClose");
                                                            -- vfw.h:2130
    pragma Import(Stdcall, AVIStreamOpenFromFileA, "AVIStreamOpenFromFileA");
                                                            -- vfw.h:2139
    pragma Import(Stdcall, AVIStreamOpenFromFileW, "AVIStreamOpenFromFileW");
                                                            -- vfw.h:2142
    pragma Import(Stdcall, AVIStreamCreate, "AVIStreamCreate");   -- vfw.h:2152
    pragma Import(Stdcall, AVIMakeCompressedStream, "AVIMakeCompressedStream");
                                                            -- vfw.h:2273
    pragma Import(Stdcall, AVISaveVA, "AVISaveVA");               -- vfw.h:2287
    pragma Import(Stdcall, AVISaveVW, "AVISaveVW");               -- vfw.h:2301
    pragma Import(Stdcall, AVISaveOptions, "AVISaveOptions");     -- vfw.h:2317
    pragma Import(Stdcall, AVISaveOptionsFree, "AVISaveOptionsFree");
                                                            -- vfw.h:2323
    pragma Import(Stdcall, AVIBuildFilterW, "AVIBuildFilterW");   -- vfw.h:2332
    pragma Import(Stdcall, AVIBuildFilterA, "AVIBuildFilterA");   -- vfw.h:2333
    pragma Import(Stdcall, AVIMakeFileFromStreams, "AVIMakeFileFromStreams");
                                                            -- vfw.h:2339
    pragma Import(Stdcall, AVIMakeStreamFromClipboard, "AVIMakeStreamFromClipboard");
                                                            -- vfw.h:2343
    pragma Import(Stdcall, AVIPutFileOnClipboard, "AVIPutFileOnClipboard");
                                                            -- vfw.h:2351
    pragma Import(Stdcall, AVIGetFromClipboard, "AVIGetFromClipboard");
                                                            -- vfw.h:2353
    pragma Import(Stdcall, AVIClearClipboard, "AVIClearClipboard");
                                                            -- vfw.h:2355
    pragma Import(Stdcall, CreateEditableStream, "CreateEditableStream");
                                                            -- vfw.h:2362
    pragma Import(Stdcall, EditStreamCut, "EditStreamCut");       -- vfw.h:2366
    pragma Import(Stdcall, EditStreamCopy, "EditStreamCopy");     -- vfw.h:2368
    pragma Import(Stdcall, EditStreamPaste, "EditStreamPaste");   -- vfw.h:2370
    pragma Import(Stdcall, EditStreamClone, "EditStreamClone");   -- vfw.h:2372
    pragma Import(Stdcall, EditStreamSetNameA, "EditStreamSetNameA");
                                                            -- vfw.h:2375
    pragma Import(Stdcall, EditStreamSetNameW, "EditStreamSetNameW");
                                                            -- vfw.h:2376
    pragma Import(Stdcall, EditStreamSetInfoW, "EditStreamSetInfoW");
                                                            -- vfw.h:2377
    pragma Import(Stdcall, EditStreamSetInfoA, "EditStreamSetInfoA");
                                                            -- vfw.h:2378
    pragma Import(Stdcall, MCIWndCreateA, "MCIWndCreateA");       -- vfw.h:2509
    pragma Import(Stdcall, MCIWndCreateW, "MCIWndCreateW");       -- vfw.h:2511
    pragma Import(Stdcall, MCIWndRegisterClass, "MCIWndRegisterClass");
                                                            -- vfw.h:2518
    pragma Import(Stdcall, capCreateCaptureWindowA, "capCreateCaptureWindowA");
                                                            -- vfw.h:3390
    pragma Import(Stdcall, capGetDriverDescriptionA, "capGetDriverDescriptionA");
                                                            -- vfw.h:3396
    pragma Import(Stdcall, capCreateCaptureWindowW, "capCreateCaptureWindowW");
                                                            -- vfw.h:3400
    pragma Import(Stdcall, capGetDriverDescriptionW, "capGetDriverDescriptionW");
                                                            -- vfw.h:3406
    pragma Import(Stdcall, GetOpenFileNamePreviewA, "GetOpenFileNamePreviewA");
                                                            -- vfw.h:3513
    pragma Import(Stdcall, GetSaveFileNamePreviewA, "GetSaveFileNamePreviewA");
                                                            -- vfw.h:3514
    pragma Import(Stdcall, GetOpenFileNamePreviewW, "GetOpenFileNamePreviewW");
                                                            -- vfw.h:3516
    pragma Import(Stdcall, GetSaveFileNamePreviewW, "GetSaveFileNamePreviewW");
                                                            -- vfw.h:3517

    pragma Inline(MKFOURCC);                                -- vfw.h:94
    pragma Inline(StreamFromFOURCC);                        -- vfw.h:1476
    pragma Inline(TWOCCFromFOURCC);                         -- vfw.h:1480

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

end Win32.Vfw;
