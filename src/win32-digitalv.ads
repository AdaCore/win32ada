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

with Win32.Mmsystem;
with Win32.Windef;

package Win32.Digitalv is

   INC_DIGITALV : constant := 100;       --  digitalv.h:16
   MCI_TEST : constant := 16#20#;    --  digitalv.h:22
   MCI_CAPTURE : constant := 16#870#;   --  digitalv.h:26
   MCI_MONITOR : constant := 16#871#;   --  digitalv.h:27
   MCI_RESERVE : constant := 16#872#;   --  digitalv.h:28
   MCI_SETAUDIO : constant := 16#873#;   --  digitalv.h:29
   MCI_SIGNAL : constant := 16#875#;   --  digitalv.h:30
   MCI_SETVIDEO : constant := 16#876#;   --  digitalv.h:31
   MCI_QUALITY : constant := 16#877#;   --  digitalv.h:32
   MCI_LIST : constant := 16#878#;   --  digitalv.h:33
   MCI_UNDO : constant := 16#879#;   --  digitalv.h:34
   MCI_CONFIGURE : constant := 16#87a#;   --  digitalv.h:35
   MCI_RESTORE : constant := 16#87b#;   --  digitalv.h:36
   MCI_ON : constant := 1;         --  digitalv.h:40
   MCI_OFF : constant := 0;         --  digitalv.h:41
   MCI_DGV_FILE_MODE_SAVING : constant := 16#1#;     --  digitalv.h:43
   MCI_DGV_FILE_MODE_LOADING : constant := 16#2#;     --  digitalv.h:44
   MCI_DGV_FILE_MODE_EDITING : constant := 16#3#;     --  digitalv.h:45
   MCI_DGV_FILE_MODE_IDLE : constant := 16#4#;     --  digitalv.h:46
   MCI_ON_S : constant := 16#8000#;  --  digitalv.h:50
   MCI_OFF_S : constant := 16#8001#;  --  digitalv.h:51
   MCI_DGV_FILE_S : constant := 16#8002#;  --  digitalv.h:52
   MCI_DGV_INPUT_S : constant := 16#8003#;  --  digitalv.h:53
   MCI_DGV_FILE_MODE_SAVING_S : constant := 16#8004#;  --  digitalv.h:55
   MCI_DGV_FILE_MODE_LOADING_S : constant := 16#8005#;  --  digitalv.h:56
   MCI_DGV_FILE_MODE_EDITING_S : constant := 16#8006#;  --  digitalv.h:57
   MCI_DGV_FILE_MODE_IDLE_S : constant := 16#8007#;  --  digitalv.h:58
   MCI_DGV_SETVIDEO_SRC_NTSC_S : constant := 16#8010#;  --  digitalv.h:60
   MCI_DGV_SETVIDEO_SRC_RGB_S : constant := 16#8011#;  --  digitalv.h:61
   MCI_DGV_SETVIDEO_SRC_SVIDEO_S : constant := 16#8012#;  --  digitalv.h:62
   MCI_DGV_SETVIDEO_SRC_PAL_S : constant := 16#8013#;  --  digitalv.h:63
   MCI_DGV_SETVIDEO_SRC_SECAM_S : constant := 16#8014#;  --  digitalv.h:64
   MCI_DGV_SETVIDEO_SRC_GENERIC_S : constant := 16#8015#;  --  digitalv.h:65
   MCI_DGV_SETAUDIO_SRC_LEFT_S : constant := 16#8020#;  --  digitalv.h:67
   MCI_DGV_SETAUDIO_SRC_RIGHT_S : constant := 16#8021#;  --  digitalv.h:68
   MCI_DGV_SETAUDIO_SRC_AVERAGE_S : constant := 16#8022#;  --  digitalv.h:69
   MCI_DGV_SETAUDIO_SRC_STEREO_S : constant := 16#8023#;  --  digitalv.h:70
   MM_MCISIGNAL : constant := 16#3cb#;   --  digitalv.h:74
   MCIERR_DGV_DEVICE_LIMIT : constant := 512;       --  digitalv.h:78
   MCIERR_DGV_IOERR : constant := 513;       --  digitalv.h:79
   MCIERR_DGV_WORKSPACE_EMPTY : constant := 514;       --  digitalv.h:80
   MCIERR_DGV_DISK_FULL : constant := 515;       --  digitalv.h:81
   MCIERR_DGV_DEVICE_MEMORY_FULL : constant := 516;       --  digitalv.h:82
   MCIERR_DGV_BAD_CLIPBOARD_RANGE : constant := 517;       --  digitalv.h:83
   MCI_DGV_METHOD_PRE : constant := 16#a000#;  --  digitalv.h:87
   MCI_DGV_METHOD_POST : constant := 16#a001#;  --  digitalv.h:88
   MCI_DGV_METHOD_DIRECT : constant := 16#a002#;  --  digitalv.h:89
   MCI_DGV_FF_AVSS : constant := 16#4000#;  --  digitalv.h:93
   MCI_DGV_FF_AVI : constant := 16#4001#;  --  digitalv.h:94
   MCI_DGV_FF_DIB : constant := 16#4002#;  --  digitalv.h:95
   MCI_DGV_FF_RDIB : constant := 16#4003#;  --  digitalv.h:96
   MCI_DGV_FF_JPEG : constant := 16#4004#;  --  digitalv.h:97
   MCI_DGV_FF_RJPEG : constant := 16#4005#;  --  digitalv.h:98
   MCI_DGV_FF_JFIF : constant := 16#4006#;  --  digitalv.h:99
   MCI_DGV_FF_MPEG : constant := 16#4007#;  --  digitalv.h:100
   MCI_DGV_GETDEVCAPS_CAN_LOCK : constant := 16#4000#;  --  digitalv.h:104
   MCI_DGV_GETDEVCAPS_CAN_STRETCH : constant := 16#4001#;  --  digitalv.h:105
   MCI_DGV_GETDEVCAPS_CAN_FREEZE : constant := 16#4002#;  --  digitalv.h:106
   MCI_DGV_GETDEVCAPS_MAX_WINDOWS : constant := 16#4003#;  --  digitalv.h:107
   MCI_DGV_GETDEVCAPS_CAN_REVERSE : constant := 16#4004#;  --  digitalv.h:108
   MCI_DGV_GETDEVCAPS_HAS_STILL : constant := 16#4005#;  --  digitalv.h:109
   MCI_DGV_GETDEVCAPS_PALETTES : constant := 16#4006#;  --  digitalv.h:110
   MCI_DGV_GETDEVCAPS_CAN_STR_IN : constant := 16#4008#;  --  digitalv.h:111
   MCI_DGV_GETDEVCAPS_CAN_TEST : constant := 16#4009#;  --  digitalv.h:112
   MCI_DGV_GETDEVCAPS_MAXIMUM_RATE : constant := 16#400a#;  --  digitalv.h:113
   MCI_DGV_GETDEVCAPS_MINIMUM_RATE : constant := 16#400b#;  --  digitalv.h:114
   MCI_DGV_CAPTURE_AS : constant := 16#10000#; --  digitalv.h:118
   MCI_DGV_CAPTURE_AT : constant := 16#20000#; --  digitalv.h:119
   MCI_DGV_COPY_AT : constant := 16#10000#; --  digitalv.h:123
   MCI_DGV_COPY_AUDIO_STREAM : constant := 16#20000#; --  digitalv.h:124
   MCI_DGV_COPY_VIDEO_STREAM : constant := 16#40000#; --  digitalv.h:125
   MCI_DGV_CUE_INPUT : constant := 16#10000#; --  digitalv.h:129
   MCI_DGV_CUE_OUTPUT : constant := 16#20000#; --  digitalv.h:130
   MCI_DGV_CUE_NOSHOW : constant := 16#40000#; --  digitalv.h:131
   MCI_DGV_CUT_AT : constant := 16#10000#; --  digitalv.h:135
   MCI_DGV_CUT_AUDIO_STREAM : constant := 16#20000#; --  digitalv.h:136
   MCI_DGV_CUT_VIDEO_STREAM : constant := 16#40000#; --  digitalv.h:137
   MCI_DGV_DELETE_AT : constant := 16#10000#; --  digitalv.h:141
   MCI_DGV_DELETE_AUDIO_STREAM : constant := 16#20000#; --  digitalv.h:142
   MCI_DGV_DELETE_VIDEO_STREAM : constant := 16#40000#; --  digitalv.h:143
   MCI_DGV_FREEZE_AT : constant := 16#10000#; --  digitalv.h:147
   MCI_DGV_FREEZE_OUTSIDE : constant := 16#20000#; --  digitalv.h:148
   MCI_DGV_INFO_TEXT : constant := 16#10000#; --  digitalv.h:152
   MCI_DGV_INFO_ITEM : constant := 16#20000#; --  digitalv.h:153
   MCI_INFO_VERSION : constant := 16#400#;   --  digitalv.h:157
   MCI_DGV_INFO_USAGE : constant := 16#4000#;  --  digitalv.h:159
   MCI_DGV_INFO_AUDIO_QUALITY : constant := 16#4001#;  --  digitalv.h:160
   MCI_DGV_INFO_STILL_QUALITY : constant := 16#4002#;  --  digitalv.h:161
   MCI_DGV_INFO_VIDEO_QUALITY : constant := 16#4003#;  --  digitalv.h:162
   MCI_DGV_INFO_AUDIO_ALG : constant := 16#4004#;  --  digitalv.h:163
   MCI_DGV_INFO_STILL_ALG : constant := 16#4005#;  --  digitalv.h:164
   MCI_DGV_INFO_VIDEO_ALG : constant := 16#4006#;  --  digitalv.h:165
   MCI_DGV_LIST_ITEM : constant := 16#10000#; --  digitalv.h:169
   MCI_DGV_LIST_COUNT : constant := 16#20000#; --  digitalv.h:170
   MCI_DGV_LIST_NUMBER : constant := 16#40000#; --  digitalv.h:171
   MCI_DGV_LIST_ALG : constant := 16#80000#; --  digitalv.h:172
   MCI_DGV_LIST_AUDIO_ALG : constant := 16#4000#;  --  digitalv.h:176
   MCI_DGV_LIST_AUDIO_QUALITY : constant := 16#4001#;  --  digitalv.h:177
   MCI_DGV_LIST_AUDIO_STREAM : constant := 16#4002#;  --  digitalv.h:178
   MCI_DGV_LIST_STILL_ALG : constant := 16#4003#;  --  digitalv.h:179
   MCI_DGV_LIST_STILL_QUALITY : constant := 16#4004#;  --  digitalv.h:180
   MCI_DGV_LIST_VIDEO_ALG : constant := 16#4005#;  --  digitalv.h:181
   MCI_DGV_LIST_VIDEO_QUALITY : constant := 16#4006#;  --  digitalv.h:182
   MCI_DGV_LIST_VIDEO_STREAM : constant := 16#4007#;  --  digitalv.h:183
   MCI_DGV_LIST_VIDEO_SOURCE : constant := 16#4008#;  --  digitalv.h:184
   MCI_DGV_MONITOR_METHOD : constant := 16#10000#; --  digitalv.h:189
   MCI_DGV_MONITOR_SOURCE : constant := 16#20000#; --  digitalv.h:190
   MCI_DGV_MONITOR_INPUT : constant := 16#4000#;  --  digitalv.h:194
   MCI_DGV_MONITOR_FILE : constant := 16#4001#;  --  digitalv.h:195
   MCI_DGV_OPEN_WS : constant := 16#10000#; --  digitalv.h:199
   MCI_DGV_OPEN_PARENT : constant := 16#20000#; --  digitalv.h:200
   MCI_DGV_OPEN_NOSTATIC : constant := 16#40000#; --  digitalv.h:201
   MCI_DGV_PASTE_AT : constant := 16#10000#; --  digitalv.h:205
   MCI_DGV_PASTE_AUDIO_STREAM : constant := 16#20000#; --  digitalv.h:206
   MCI_DGV_PASTE_VIDEO_STREAM : constant := 16#40000#; --  digitalv.h:207
   MCI_DGV_PASTE_INSERT : constant := 16#80000#; --  digitalv.h:208
   MCI_DGV_PASTE_OVERWRITE : constant := 16#100000#; --  digitalv.h:209
   MCI_DGV_PLAY_REPEAT : constant := 16#10000#; --  digitalv.h:213
   MCI_DGV_PLAY_REVERSE : constant := 16#20000#; --  digitalv.h:214
   MCI_DGV_RECT : constant := 16#10000#; --  digitalv.h:218
   MCI_DGV_PUT_SOURCE : constant := 16#20000#; --  digitalv.h:219
   MCI_DGV_PUT_DESTINATION : constant := 16#40000#; --  digitalv.h:220
   MCI_DGV_PUT_FRAME : constant := 16#80000#; --  digitalv.h:221
   MCI_DGV_PUT_VIDEO : constant := 16#100000#; --  digitalv.h:222
   MCI_DGV_PUT_WINDOW : constant := 16#200000#; --  digitalv.h:223
   MCI_DGV_PUT_CLIENT : constant := 16#400000#; --  digitalv.h:224
   MCI_QUALITY_ITEM : constant := 16#10000#; --  digitalv.h:228
   MCI_QUALITY_NAME : constant := 16#20000#; --  digitalv.h:229
   MCI_QUALITY_ALG : constant := 16#40000#; --  digitalv.h:230
   MCI_QUALITY_DIALOG : constant := 16#80000#; --  digitalv.h:231
   MCI_QUALITY_HANDLE : constant := 16#100000#; --  digitalv.h:232
   MCI_QUALITY_ITEM_AUDIO : constant := 16#4000#;  --  digitalv.h:236
   MCI_QUALITY_ITEM_STILL : constant := 16#4001#;  --  digitalv.h:237
   MCI_QUALITY_ITEM_VIDEO : constant := 16#4002#;  --  digitalv.h:238
   MCI_DGV_REALIZE_NORM : constant := 16#10000#; --  digitalv.h:242
   MCI_DGV_REALIZE_BKGD : constant := 16#20000#; --  digitalv.h:243
   MCI_DGV_RECORD_HOLD : constant := 16#20000#; --  digitalv.h:247
   MCI_DGV_RECORD_AUDIO_STREAM : constant := 16#40000#; --  digitalv.h:248
   MCI_DGV_RECORD_VIDEO_STREAM : constant := 16#80000#; --  digitalv.h:249
   MCI_DGV_RESERVE_IN : constant := 16#10000#; --  digitalv.h:253
   MCI_DGV_RESERVE_SIZE : constant := 16#20000#; --  digitalv.h:254
   MCI_DGV_RESTORE_FROM : constant := 16#10000#; --  digitalv.h:258
   MCI_DGV_RESTORE_AT : constant := 16#20000#; --  digitalv.h:259
   MCI_DGV_SAVE_ABORT : constant := 16#20000#; --  digitalv.h:263
   MCI_DGV_SAVE_KEEPRESERVE : constant := 16#40000#; --  digitalv.h:264
   MCI_DGV_SET_SEEK_EXACTLY : constant := 16#10000#; --  digitalv.h:268
   MCI_DGV_SET_SPEED : constant := 16#20000#; --  digitalv.h:269
   MCI_DGV_SET_STILL : constant := 16#40000#; --  digitalv.h:270
   MCI_DGV_SET_FILEFORMAT : constant := 16#80000#; --  digitalv.h:271
   MCI_DGV_SETAUDIO_OVER : constant := 16#10000#; --  digitalv.h:275
   MCI_DGV_SETAUDIO_CLOCKTIME : constant := 16#20000#; --  digitalv.h:276
   MCI_DGV_SETAUDIO_ALG : constant := 16#40000#; --  digitalv.h:277
   MCI_DGV_SETAUDIO_QUALITY : constant := 16#80000#; --  digitalv.h:278
   MCI_DGV_SETAUDIO_RECORD : constant := 16#100000#; --  digitalv.h:279
   MCI_DGV_SETAUDIO_LEFT : constant := 16#200000#; --  digitalv.h:280
   MCI_DGV_SETAUDIO_RIGHT : constant := 16#400000#; --  digitalv.h:281
   MCI_DGV_SETAUDIO_ITEM : constant := 16#800000#; --  digitalv.h:282
   MCI_DGV_SETAUDIO_VALUE : constant := 16#1000000#;
   --  digitalv.h:283
   MCI_DGV_SETAUDIO_INPUT : constant := 16#2000000#;
   --  digitalv.h:284
   MCI_DGV_SETAUDIO_OUTPUT : constant := 16#4000000#;
   --  digitalv.h:285
   MCI_DGV_SETAUDIO_TREBLE : constant := 16#4000#;  --  digitalv.h:289
   MCI_DGV_SETAUDIO_BASS : constant := 16#4001#;  --  digitalv.h:290
   MCI_DGV_SETAUDIO_VOLUME : constant := 16#4002#;  --  digitalv.h:291
   MCI_DGV_SETAUDIO_STREAM : constant := 16#4003#;  --  digitalv.h:292
   MCI_DGV_SETAUDIO_SOURCE : constant := 16#4004#;  --  digitalv.h:293
   MCI_DGV_SETAUDIO_SAMPLESPERSEC : constant := 16#4005#;  --  digitalv.h:294
   MCI_DGV_SETAUDIO_AVGBYTESPERSEC : constant := 16#4006#;  --  digitalv.h:295
   MCI_DGV_SETAUDIO_BLOCKALIGN : constant := 16#4007#;  --  digitalv.h:296
   MCI_DGV_SETAUDIO_BITSPERSAMPLE : constant := 16#4008#;  --  digitalv.h:297
   MCI_DGV_SETAUDIO_SOURCE_STEREO : constant := 16#0#;     --  digitalv.h:302
   MCI_DGV_SETAUDIO_SOURCE_LEFT : constant := 16#1#;     --  digitalv.h:303
   MCI_DGV_SETAUDIO_SOURCE_RIGHT : constant := 16#2#;     --  digitalv.h:304
   MCI_DGV_SETAUDIO_SOURCE_AVERAGE : constant := 16#4000#;  --  digitalv.h:305
   MCI_DGV_SETVIDEO_QUALITY : constant := 16#10000#; --  digitalv.h:309
   MCI_DGV_SETVIDEO_ALG : constant := 16#20000#; --  digitalv.h:310
   MCI_DGV_SETVIDEO_CLOCKTIME : constant := 16#40000#; --  digitalv.h:311
   MCI_DGV_SETVIDEO_SRC_NUMBER : constant := 16#80000#; --  digitalv.h:312
   MCI_DGV_SETVIDEO_ITEM : constant := 16#100000#; --  digitalv.h:313
   MCI_DGV_SETVIDEO_OVER : constant := 16#200000#; --  digitalv.h:314
   MCI_DGV_SETVIDEO_RECORD : constant := 16#400000#; --  digitalv.h:315
   MCI_DGV_SETVIDEO_STILL : constant := 16#800000#; --  digitalv.h:316
   MCI_DGV_SETVIDEO_VALUE : constant := 16#1000000#;
   --  digitalv.h:317
   MCI_DGV_SETVIDEO_INPUT : constant := 16#2000000#;
   --  digitalv.h:318
   MCI_DGV_SETVIDEO_OUTPUT : constant := 16#4000000#;
   --  digitalv.h:319
   MCI_DGV_SETVIDEO_SRC_NTSC : constant := 16#4000#;  --  digitalv.h:324
   MCI_DGV_SETVIDEO_SRC_RGB : constant := 16#4001#;  --  digitalv.h:325
   MCI_DGV_SETVIDEO_SRC_SVIDEO : constant := 16#4002#;  --  digitalv.h:326
   MCI_DGV_SETVIDEO_SRC_PAL : constant := 16#4003#;  --  digitalv.h:327
   MCI_DGV_SETVIDEO_SRC_SECAM : constant := 16#4004#;  --  digitalv.h:328
   MCI_DGV_SETVIDEO_SRC_GENERIC : constant := 16#4005#;  --  digitalv.h:329
   MCI_DGV_SETVIDEO_BRIGHTNESS : constant := 16#4000#;  --  digitalv.h:333
   MCI_DGV_SETVIDEO_COLOR : constant := 16#4001#;  --  digitalv.h:334
   MCI_DGV_SETVIDEO_CONTRAST : constant := 16#4002#;  --  digitalv.h:335
   MCI_DGV_SETVIDEO_TINT : constant := 16#4003#;  --  digitalv.h:336
   MCI_DGV_SETVIDEO_SHARPNESS : constant := 16#4004#;  --  digitalv.h:337
   MCI_DGV_SETVIDEO_GAMMA : constant := 16#4005#;  --  digitalv.h:338
   MCI_DGV_SETVIDEO_STREAM : constant := 16#4006#;  --  digitalv.h:339
   MCI_DGV_SETVIDEO_PALHANDLE : constant := 16#4007#;  --  digitalv.h:340
   MCI_DGV_SETVIDEO_FRAME_RATE : constant := 16#4008#;  --  digitalv.h:341
   MCI_DGV_SETVIDEO_SOURCE : constant := 16#4009#;  --  digitalv.h:342
   MCI_DGV_SETVIDEO_KEY_INDEX : constant := 16#400a#;  --  digitalv.h:343
   MCI_DGV_SETVIDEO_KEY_COLOR : constant := 16#400b#;  --  digitalv.h:344
   MCI_DGV_SETVIDEO_BITSPERPEL : constant := 16#400c#;  --  digitalv.h:345
   MCI_DGV_SIGNAL_AT : constant := 16#10000#; --  digitalv.h:349
   MCI_DGV_SIGNAL_EVERY : constant := 16#20000#; --  digitalv.h:350
   MCI_DGV_SIGNAL_USERVAL : constant := 16#40000#; --  digitalv.h:351
   MCI_DGV_SIGNAL_CANCEL : constant := 16#80000#; --  digitalv.h:352
   MCI_DGV_SIGNAL_POSITION : constant := 16#100000#; --  digitalv.h:353
   MCI_DGV_STATUS_NOMINAL : constant := 16#20000#; --  digitalv.h:390
   MCI_DGV_STATUS_REFERENCE : constant := 16#40000#; --  digitalv.h:391
   MCI_DGV_STATUS_LEFT : constant := 16#80000#; --  digitalv.h:392
   MCI_DGV_STATUS_RIGHT : constant := 16#100000#; --  digitalv.h:393
   MCI_DGV_STATUS_DISKSPACE : constant := 16#200000#; --  digitalv.h:394
   MCI_DGV_STATUS_INPUT : constant := 16#400000#; --  digitalv.h:395
   MCI_DGV_STATUS_OUTPUT : constant := 16#800000#; --  digitalv.h:396
   MCI_DGV_STATUS_RECORD : constant := 16#1000000#;
   --  digitalv.h:397
   MCI_DGV_STATUS_AUDIO_INPUT : constant := 16#4000#;  --  digitalv.h:401
   MCI_DGV_STATUS_HWND : constant := 16#4001#;  --  digitalv.h:402
   MCI_DGV_STATUS_SPEED : constant := 16#4003#;  --  digitalv.h:403
   MCI_DGV_STATUS_HPAL : constant := 16#4004#;  --  digitalv.h:404
   MCI_DGV_STATUS_BRIGHTNESS : constant := 16#4005#;  --  digitalv.h:405
   MCI_DGV_STATUS_COLOR : constant := 16#4006#;  --  digitalv.h:406
   MCI_DGV_STATUS_CONTRAST : constant := 16#4007#;  --  digitalv.h:407
   MCI_DGV_STATUS_FILEFORMAT : constant := 16#4008#;  --  digitalv.h:408
   MCI_DGV_STATUS_AUDIO_SOURCE : constant := 16#4009#;  --  digitalv.h:409
   MCI_DGV_STATUS_GAMMA : constant := 16#400a#;  --  digitalv.h:410
   MCI_DGV_STATUS_MONITOR : constant := 16#400b#;  --  digitalv.h:411
   MCI_DGV_STATUS_MONITOR_METHOD : constant := 16#400c#;  --  digitalv.h:412
   MCI_DGV_STATUS_FRAME_RATE : constant := 16#400e#;  --  digitalv.h:413
   MCI_DGV_STATUS_BASS : constant := 16#400f#;  --  digitalv.h:414
   MCI_DGV_STATUS_SIZE : constant := 16#4010#;  --  digitalv.h:415
   MCI_DGV_STATUS_SEEK_EXACTLY : constant := 16#4011#;  --  digitalv.h:416
   MCI_DGV_STATUS_SHARPNESS : constant := 16#4012#;  --  digitalv.h:417
   MCI_DGV_STATUS_SMPTE : constant := 16#4013#;  --  digitalv.h:418
   MCI_DGV_STATUS_AUDIO : constant := 16#4014#;  --  digitalv.h:419
   MCI_DGV_STATUS_TINT : constant := 16#4015#;  --  digitalv.h:420
   MCI_DGV_STATUS_TREBLE : constant := 16#4016#;  --  digitalv.h:421
   MCI_DGV_STATUS_UNSAVED : constant := 16#4017#;  --  digitalv.h:422
   MCI_DGV_STATUS_VIDEO : constant := 16#4018#;  --  digitalv.h:423
   MCI_DGV_STATUS_VOLUME : constant := 16#4019#;  --  digitalv.h:424
   MCI_DGV_STATUS_AUDIO_RECORD : constant := 16#401a#;  --  digitalv.h:425
   MCI_DGV_STATUS_VIDEO_SOURCE : constant := 16#401b#;  --  digitalv.h:426
   MCI_DGV_STATUS_VIDEO_RECORD : constant := 16#401c#;  --  digitalv.h:427
   MCI_DGV_STATUS_STILL_FILEFORMAT : constant := 16#401d#;  --  digitalv.h:428
   MCI_DGV_STATUS_VIDEO_SRC_NUM : constant := 16#401e#;  --  digitalv.h:429
   MCI_DGV_STATUS_FILE_MODE : constant := 16#401f#;  --  digitalv.h:430
   MCI_DGV_STATUS_FILE_COMPLETION : constant := 16#4020#;  --  digitalv.h:431
   MCI_DGV_STATUS_WINDOW_VISIBLE : constant := 16#4021#;  --  digitalv.h:432
   MCI_DGV_STATUS_WINDOW_MINIMIZED : constant := 16#4022#;  --  digitalv.h:433
   MCI_DGV_STATUS_WINDOW_MAXIMIZED : constant := 16#4023#;  --  digitalv.h:434
   MCI_DGV_STATUS_KEY_INDEX : constant := 16#4024#;  --  digitalv.h:435
   MCI_DGV_STATUS_KEY_COLOR : constant := 16#4025#;  --  digitalv.h:436
   MCI_DGV_STATUS_PAUSE_MODE : constant := 16#4026#;  --  digitalv.h:437
   MCI_DGV_STATUS_SAMPLESPERSEC : constant := 16#4027#;  --  digitalv.h:438
   MCI_DGV_STATUS_AVGBYTESPERSEC : constant := 16#4028#;  --  digitalv.h:439
   MCI_DGV_STATUS_BLOCKALIGN : constant := 16#4029#;  --  digitalv.h:440
   MCI_DGV_STATUS_BITSPERSAMPLE : constant := 16#402a#;  --  digitalv.h:441
   MCI_DGV_STATUS_BITSPERPEL : constant := 16#402b#;  --  digitalv.h:442
   MCI_DGV_STATUS_FORWARD : constant := 16#402c#;  --  digitalv.h:443
   MCI_DGV_STATUS_AUDIO_STREAM : constant := 16#402d#;  --  digitalv.h:444
   MCI_DGV_STATUS_VIDEO_STREAM : constant := 16#402e#;  --  digitalv.h:445
   MCI_DGV_STEP_REVERSE : constant := 16#10000#; --  digitalv.h:449
   MCI_DGV_STEP_FRAMES : constant := 16#20000#; --  digitalv.h:450
   MCI_DGV_STOP_HOLD : constant := 16#10000#; --  digitalv.h:454
   MCI_DGV_UPDATE_HDC : constant := 16#20000#; --  digitalv.h:458
   MCI_DGV_UPDATE_PAINT : constant := 16#40000#; --  digitalv.h:459
   MCI_DGV_WHERE_SOURCE : constant := 16#20000#; --  digitalv.h:463
   MCI_DGV_WHERE_DESTINATION : constant := 16#40000#; --  digitalv.h:464
   MCI_DGV_WHERE_FRAME : constant := 16#80000#; --  digitalv.h:465
   MCI_DGV_WHERE_VIDEO : constant := 16#100000#; --  digitalv.h:466
   MCI_DGV_WHERE_WINDOW : constant := 16#200000#; --  digitalv.h:467
   MCI_DGV_WHERE_MAX : constant := 16#400000#; --  digitalv.h:468
   MCI_DGV_WINDOW_HWND : constant := 16#10000#; --  digitalv.h:472
   MCI_DGV_WINDOW_STATE : constant := 16#40000#; --  digitalv.h:473
   MCI_DGV_WINDOW_TEXT : constant := 16#80000#; --  digitalv.h:474
   MCI_DGV_WINDOW_DEFAULT : constant := 16#0#;     --  digitalv.h:478

   type MCI_DGV_RECT_PARMS;                                --  digitalv.h:490
   type MCI_DGV_CAPTURE_PARMSA;                            --  digitalv.h:504
   type MCI_DGV_CAPTURE_PARMSW;                            --  digitalv.h:514
   type MCI_DGV_COPY_PARMS;                                --  digitalv.h:547
   type MCI_DGV_CUE_PARMS;                                 --  digitalv.h:555
   type MCI_DGV_CUT_PARMS;                                 --  digitalv.h:572
   type MCI_DGV_DELETE_PARMS;                              --  digitalv.h:589
   type MCI_DGV_INFO_PARMSA;                               --  digitalv.h:604
   type MCI_DGV_INFO_PARMSW;                               --  digitalv.h:610
   type MCI_DGV_LIST_PARMSA;                               --  digitalv.h:634
   type MCI_DGV_LIST_PARMSW;                               --  digitalv.h:642
   type MCI_DGV_MONITOR_PARMS;                             --  digitalv.h:667
   type MCI_DGV_OPEN_PARMSA;                               --  digitalv.h:686
   type MCI_DGV_OPEN_PARMSW;                               --  digitalv.h:701
   type MCI_DGV_PASTE_PARMS;                               --  digitalv.h:733
   type MCI_DGV_QUALITY_PARMSA;                            --  digitalv.h:754
   type MCI_DGV_QUALITY_PARMSW;                            --  digitalv.h:761
   type MCI_DGV_RECORD_PARMS;                              --  digitalv.h:794
   type MCI_DGV_RESERVE_PARMSA;                            --  digitalv.h:803
   type MCI_DGV_RESERVE_PARMSW;                            --  digitalv.h:808
   type MCI_DGV_RESTORE_PARMSA;                            --  digitalv.h:833
   type MCI_DGV_RESTORE_PARMSW;                            --  digitalv.h:843
   type MCI_DGV_SAVE_PARMSA;                               --  digitalv.h:868
   type MCI_DGV_SAVE_PARMSW;                               --  digitalv.h:873
   type MCI_DGV_SET_PARMS;                                 --  digitalv.h:895
   type MCI_DGV_SETAUDIO_PARMSA;                           --  digitalv.h:907
   type MCI_DGV_SETAUDIO_PARMSW;                           --  digitalv.h:915
   type MCI_DGV_SIGNAL_PARMS;                              --  digitalv.h:936
   type MCI_DGV_SETVIDEO_PARMSA;                           --  digitalv.h:949
   type MCI_DGV_SETVIDEO_PARMSW;                           --  digitalv.h:958
   type MCI_DGV_STATUS_PARMSA;                             --  digitalv.h:981
   type MCI_DGV_STATUS_PARMSW;                             --  digitalv.h:989
   type MCI_DGV_STEP_PARMS;                                --  digitalv.h:1008
   type MCI_DGV_UPDATE_PARMS;                              --  digitalv.h:1036
   type MCI_DGV_WINDOW_PARMSA;                             --  digitalv.h:1057
   type MCI_DGV_WINDOW_PARMSW;                             --  digitalv.h:1069

   type LPMCI_DGV_RECT_PARMS is access all MCI_DGV_RECT_PARMS;
   --  digitalv.h:491
   type LPMCI_DGV_CAPTURE_PARMSA is access all MCI_DGV_CAPTURE_PARMSA;
   --  digitalv.h:520
   type LPMCI_DGV_CAPTURE_PARMSW is access all MCI_DGV_CAPTURE_PARMSW;
   --  digitalv.h:521
   subtype LPMCI_DGV_CAPTURE_PARMS is LPMCI_DGV_CAPTURE_PARMSA;
   --  digitalv.h:525
   type LPMCI_CLOSE_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:531
   type LPMCI_DGV_COPY_PARMS is access all MCI_DGV_COPY_PARMS;
   --  digitalv.h:548
   type LPMCI_DGV_CUE_PARMS is access all MCI_DGV_CUE_PARMS;
   --  digitalv.h:556
   type LPMCI_DGV_CUT_PARMS is access all MCI_DGV_CUT_PARMS;
   --  digitalv.h:573
   type LPMCI_DGV_DELETE_PARMS is access all MCI_DGV_DELETE_PARMS;
   --  digitalv.h:590
   type LPMCI_DGV_FREEZE_PARMS is access all MCI_DGV_RECT_PARMS;
   --  digitalv.h:595
   type LPMCI_DGV_INFO_PARMSA is access all MCI_DGV_INFO_PARMSA;
   --  digitalv.h:617
   type LPMCI_DGV_INFO_PARMSW is access all MCI_DGV_INFO_PARMSW;
   --  digitalv.h:618
   subtype LPMCI_DGV_INFO_PARMS is LPMCI_DGV_INFO_PARMSA;
   --  digitalv.h:622
   type LPMCI_DGV_LIST_PARMSA is access all MCI_DGV_LIST_PARMSA;
   --  digitalv.h:648
   type LPMCI_DGV_LIST_PARMSW is access all MCI_DGV_LIST_PARMSW;
   --  digitalv.h:649
   subtype LPMCI_DGV_LIST_PARMS is LPMCI_DGV_LIST_PARMSA;
   --  digitalv.h:653
   type LPMCI_DGV_LOAD_PARMS is access all Win32.Mmsystem.MCI_LOAD_PARMS;
   --  digitalv.h:659
   type LPMCI_DGV_MONITOR_PARMS is access all MCI_DGV_MONITOR_PARMS;
   --  digitalv.h:668
   type LPMCI_DGV_OPEN_PARMSA is access all MCI_DGV_OPEN_PARMSA;
   --  digitalv.h:707
   type LPMCI_DGV_OPEN_PARMSW is access all MCI_DGV_OPEN_PARMSW;
   --  digitalv.h:708
   subtype LPMCI_DGV_OPEN_PARMS is LPMCI_DGV_OPEN_PARMSA;
   --  digitalv.h:712
   type LPMCI_DGV_PAUSE_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:718
   type LPMCI_DGV_PASTE_PARMS is access all MCI_DGV_PASTE_PARMS;
   --  digitalv.h:734
   type LPMCI_DGV_PLAY_PARMS is access all Win32.Mmsystem.MCI_PLAY_PARMS;
   --  digitalv.h:739
   type LPMCI_DGV_PUT_PARMS is access all MCI_DGV_RECT_PARMS;
   --  digitalv.h:744
   type LPMCI_DGV_QUALITY_PARMSA is access all MCI_DGV_QUALITY_PARMSA;
   --  digitalv.h:767
   type LPMCI_DGV_QUALITY_PARMSW is access all MCI_DGV_QUALITY_PARMSW;
   --  digitalv.h:768
   subtype LPMCI_DGV_QUALITY_PARMS is LPMCI_DGV_QUALITY_PARMSA;
   --  digitalv.h:772
   type LPMCI_REALIZE_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:778
   type LPMCI_DGV_RECORD_PARMS is access all MCI_DGV_RECORD_PARMS;
   --  digitalv.h:795
   type LPMCI_DGV_RESERVE_PARMSA is access all MCI_DGV_RESERVE_PARMSA;
   --  digitalv.h:814
   type LPMCI_DGV_RESERVE_PARMSW is access all MCI_DGV_RESERVE_PARMSW;
   --  digitalv.h:815
   subtype LPMCI_DGV_RESERVE_PARMS is LPMCI_DGV_RESERVE_PARMSA;
   --  digitalv.h:819
   type LPMCI_DGV_RESTORE_PARMSA is access all MCI_DGV_RESTORE_PARMSA;
   --  digitalv.h:849
   type LPMCI_DGV_RESTORE_PARMSW is access all MCI_DGV_RESTORE_PARMSW;
   --  digitalv.h:850
   subtype LPMCI_DGV_RESTORE_PARMS is LPMCI_DGV_RESTORE_PARMSA;
   --  digitalv.h:854
   type LPMCI_DGV_RESUME_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:860
   type LPMCI_DGV_SAVE_PARMSA is access all MCI_DGV_SAVE_PARMSA;
   --  digitalv.h:879
   type LPMCI_DGV_SAVE_PARMSW is access all MCI_DGV_SAVE_PARMSW;
   --  digitalv.h:880
   subtype LPMCI_DGV_SAVE_PARMS is LPMCI_DGV_SAVE_PARMSA;
   --  digitalv.h:884
   type LPMCI_DGV_SET_PARMS is access all MCI_DGV_SET_PARMS;
   --  digitalv.h:896
   type LPMCI_DGV_SETAUDIO_PARMSA is access all MCI_DGV_SETAUDIO_PARMSA;
   --  digitalv.h:921
   type LPMCI_DGV_SETAUDIO_PARMSW is access all MCI_DGV_SETAUDIO_PARMSW;
   --  digitalv.h:922
   subtype LPMCI_DGV_SETAUDIO_PARMS is LPMCI_DGV_SETAUDIO_PARMSA;
   --  digitalv.h:926
   type LPMCI_DGV_SIGNAL_PARMS is access all MCI_DGV_SIGNAL_PARMS;
   --  digitalv.h:937
   type LPMCI_DGV_SETVIDEO_PARMSA is access all MCI_DGV_SETVIDEO_PARMSA;
   --  digitalv.h:964
   type LPMCI_DGV_SETVIDEO_PARMSW is access all MCI_DGV_SETVIDEO_PARMSW;
   --  digitalv.h:965
   subtype LPMCI_DGV_SETVIDEO_PARMS is LPMCI_DGV_SETVIDEO_PARMSA;
   --  digitalv.h:969
   type LPMCI_DGV_STATUS_PARMSA is access all MCI_DGV_STATUS_PARMSA;
   --  digitalv.h:995
   type LPMCI_DGV_STATUS_PARMSW is access all MCI_DGV_STATUS_PARMSW;
   --  digitalv.h:996
   subtype LPMCI_DGV_STATUS_PARMS is LPMCI_DGV_STATUS_PARMSA;
   --  digitalv.h:1000
   type LPMCI_DGV_STEP_PARMS is access all MCI_DGV_STEP_PARMS;
   --  digitalv.h:1009
   type LPMCI_DGV_STOP_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:1014
   type LPMCI_DGV_UNFREEZE_PARMS is access all MCI_DGV_RECT_PARMS;
   --  digitalv.h:1019
   type LPMCI_DGV_UPDATE_PARMS is access all MCI_DGV_UPDATE_PARMS;
   --  digitalv.h:1037
   type LPMCI_DGV_WHERE_PARMS is access all MCI_DGV_RECT_PARMS;
   --  digitalv.h:1042
   type LPMCI_DGV_WINDOW_PARMSA is access all MCI_DGV_WINDOW_PARMSA;
   --  digitalv.h:1075
   type LPMCI_DGV_WINDOW_PARMSW is access all MCI_DGV_WINDOW_PARMSW;
   --  digitalv.h:1076
   subtype LPMCI_DGV_WINDOW_PARMS is LPMCI_DGV_WINDOW_PARMSA;
   --  digitalv.h:1080

   type MCI_DGV_RECT_PARMS is                              --  digitalv.h:490
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:480
         rc : Win32.Windef.RECT;                  --  digitalv.h:488
      end record;

   type MCI_DGV_CAPTURE_PARMSA is                          --  digitalv.h:504
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:496
         lpstrFileName : Win32.LPSTR;                     --  digitalv.h:497
         rc : Win32.Windef.RECT;               --  digitalv.h:502
      end record;

   type MCI_DGV_CAPTURE_PARMSW is                          --  digitalv.h:514
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:506
         lpstrFileName : Win32.LPWSTR;                    --  digitalv.h:507
         rc : Win32.Windef.RECT;               --  digitalv.h:512
      end record;

   subtype MCI_DGV_CAPTURE_PARMS is MCI_DGV_CAPTURE_PARMSA; --  digitalv.h:518

   subtype MCI_CLOSE_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:530

   type MCI_DGV_COPY_PARMS is                              --  digitalv.h:547
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:536
         dwFrom : Win32.DWORD;                     --  digitalv.h:537
         dwTo : Win32.DWORD;                     --  digitalv.h:538
         rc : Win32.Windef.RECT;               --  digitalv.h:543
         dwAudioStream : Win32.DWORD;                     --  digitalv.h:545
         dwVideoStream : Win32.DWORD;                     --  digitalv.h:546
      end record;

   type MCI_DGV_CUE_PARMS is                               --  digitalv.h:555
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:553
         dwTo : Win32.DWORD;                        --  digitalv.h:554
      end record;

   type MCI_DGV_CUT_PARMS is                               --  digitalv.h:572
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:561
         dwFrom : Win32.DWORD;                     --  digitalv.h:562
         dwTo : Win32.DWORD;                     --  digitalv.h:563
         rc : Win32.Windef.RECT;               --  digitalv.h:568
         dwAudioStream : Win32.DWORD;                     --  digitalv.h:570
         dwVideoStream : Win32.DWORD;                     --  digitalv.h:571
      end record;

   type MCI_DGV_DELETE_PARMS is                            --  digitalv.h:589
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:578
         dwFrom : Win32.DWORD;                     --  digitalv.h:579
         dwTo : Win32.DWORD;                     --  digitalv.h:580
         rc : Win32.Windef.RECT;               --  digitalv.h:585
         dwAudioStream : Win32.DWORD;                     --  digitalv.h:587
         dwVideoStream : Win32.DWORD;                     --  digitalv.h:588
      end record;

   subtype MCI_DGV_FREEZE_PARMS is MCI_DGV_RECT_PARMS;     --  digitalv.h:594

   type MCI_DGV_INFO_PARMSA is                             --  digitalv.h:604
      record
         dwCallback : Win32.DWORD;                       --  digitalv.h:600
         lpstrReturn : Win32.LPSTR;                       --  digitalv.h:601
         dwRetSize : Win32.DWORD;                       --  digitalv.h:602
         dwItem : Win32.DWORD;                       --  digitalv.h:603
      end record;

   type MCI_DGV_INFO_PARMSW is                             --  digitalv.h:610
      record
         dwCallback : Win32.DWORD;                       --  digitalv.h:606
         lpstrReturn : Win32.LPWSTR;                      --  digitalv.h:607
         dwRetSize : Win32.DWORD;                       --  digitalv.h:608
         dwItem : Win32.DWORD;                       --  digitalv.h:609
      end record;

   subtype MCI_DGV_INFO_PARMS is MCI_DGV_INFO_PARMSA;      --  digitalv.h:614

   type MCI_DGV_LIST_PARMSA is                             --  digitalv.h:634
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:628
         lpstrReturn : Win32.LPSTR;                    --  digitalv.h:629
         dwLength : Win32.DWORD;                    --  digitalv.h:630
         dwNumber : Win32.DWORD;                    --  digitalv.h:631
         dwItem : Win32.DWORD;                    --  digitalv.h:632
         lpstrAlgorithm : Win32.LPSTR;                    --  digitalv.h:633
      end record;

   type MCI_DGV_LIST_PARMSW is                             --  digitalv.h:642
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:636
         lpstrReturn : Win32.LPWSTR;                   --  digitalv.h:637
         dwLength : Win32.DWORD;                    --  digitalv.h:638
         dwNumber : Win32.DWORD;                    --  digitalv.h:639
         dwItem : Win32.DWORD;                    --  digitalv.h:640
         lpstrAlgorithm : Win32.LPWSTR;                   --  digitalv.h:641
      end record;

   subtype MCI_DGV_LIST_PARMS is MCI_DGV_LIST_PARMSA;      --  digitalv.h:646

   subtype MCI_DGV_LOAD_PARMS is Win32.Mmsystem.MCI_LOAD_PARMS;
   --  digitalv.h:658

   type MCI_DGV_MONITOR_PARMS is                           --  digitalv.h:667
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:664
         dwSource : Win32.DWORD;                        --  digitalv.h:665
         dwMethod : Win32.DWORD;                        --  digitalv.h:666
      end record;

   type MCI_DGV_OPEN_PARMSA is                             --  digitalv.h:686
      record
         dwCallback : Win32.DWORD;                  --  digitalv.h:673
         wDeviceID : Win32.UINT;                   --  digitalv.h:674
         lpstrDeviceType : Win32.LPSTR;                  --  digitalv.h:678
         lpstrElementName : Win32.LPSTR;                  --  digitalv.h:679
         lpstrAlias : Win32.LPSTR;                  --  digitalv.h:680
         dwStyle : Win32.DWORD;                  --  digitalv.h:681
         hWndParent : Win32.Windef.HWND;            --  digitalv.h:682
      end record;

   type MCI_DGV_OPEN_PARMSW is                             --  digitalv.h:701
      record
         dwCallback : Win32.DWORD;                  --  digitalv.h:688
         wDeviceID : Win32.UINT;                   --  digitalv.h:689
         lpstrDeviceType : Win32.LPWSTR;                 --  digitalv.h:693
         lpstrElementName : Win32.LPWSTR;                 --  digitalv.h:694
         lpstrAlias : Win32.LPWSTR;                 --  digitalv.h:695
         dwStyle : Win32.DWORD;                  --  digitalv.h:696
         hWndParent : Win32.Windef.HWND;            --  digitalv.h:697
      end record;

   subtype MCI_DGV_OPEN_PARMS is MCI_DGV_OPEN_PARMSA;      --  digitalv.h:705

   subtype MCI_DGV_PAUSE_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:717

   type MCI_DGV_PASTE_PARMS is                             --  digitalv.h:733
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:723
         dwTo : Win32.DWORD;                     --  digitalv.h:724
         rc : Win32.Windef.RECT;               --  digitalv.h:729
         dwAudioStream : Win32.DWORD;                     --  digitalv.h:731
         dwVideoStream : Win32.DWORD;                     --  digitalv.h:732
      end record;

   subtype MCI_DGV_PLAY_PARMS is Win32.Mmsystem.MCI_PLAY_PARMS;
   --  digitalv.h:738

   subtype MCI_DGV_PUT_PARMS is MCI_DGV_RECT_PARMS;        --  digitalv.h:743

   type MCI_DGV_QUALITY_PARMSA is                          --  digitalv.h:754
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:749
         dwItem : Win32.DWORD;                    --  digitalv.h:750
         lpstrName : Win32.LPSTR;                    --  digitalv.h:751
         lpstrAlgorithm : Win32.DWORD;                    --  digitalv.h:752
         dwHandle : Win32.DWORD;                    --  digitalv.h:753
      end record;

   type MCI_DGV_QUALITY_PARMSW is                          --  digitalv.h:761
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:756
         dwItem : Win32.DWORD;                    --  digitalv.h:757
         lpstrName : Win32.LPWSTR;                   --  digitalv.h:758
         lpstrAlgorithm : Win32.DWORD;                    --  digitalv.h:759
         dwHandle : Win32.DWORD;                    --  digitalv.h:760
      end record;

   subtype MCI_DGV_QUALITY_PARMS is MCI_DGV_QUALITY_PARMSA; --  digitalv.h:765

   subtype MCI_REALIZE_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:777

   type MCI_DGV_RECORD_PARMS is                            --  digitalv.h:794
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:783
         dwFrom : Win32.DWORD;                     --  digitalv.h:784
         dwTo : Win32.DWORD;                     --  digitalv.h:785
         rc : Win32.Windef.RECT;               --  digitalv.h:790
         dwAudioStream : Win32.DWORD;                     --  digitalv.h:792
         dwVideoStream : Win32.DWORD;                     --  digitalv.h:793
      end record;

   type MCI_DGV_RESERVE_PARMSA is                          --  digitalv.h:803
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:800
         lpstrPath : Win32.LPSTR;                        --  digitalv.h:801
         dwSize : Win32.DWORD;                        --  digitalv.h:802
      end record;

   type MCI_DGV_RESERVE_PARMSW is                          --  digitalv.h:808
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:805
         lpstrPath : Win32.LPWSTR;                       --  digitalv.h:806
         dwSize : Win32.DWORD;                        --  digitalv.h:807
      end record;

   subtype MCI_DGV_RESERVE_PARMS is MCI_DGV_RESERVE_PARMSA; --  digitalv.h:812

   type MCI_DGV_RESTORE_PARMSA is                          --  digitalv.h:833
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:825
         lpstrFileName : Win32.LPSTR;                     --  digitalv.h:826
         rc : Win32.Windef.RECT;               --  digitalv.h:831
      end record;

   type MCI_DGV_RESTORE_PARMSW is                          --  digitalv.h:843
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:835
         lpstrFileName : Win32.LPWSTR;                    --  digitalv.h:836
         rc : Win32.Windef.RECT;               --  digitalv.h:841
      end record;

   subtype MCI_DGV_RESTORE_PARMS is MCI_DGV_RESTORE_PARMSA; --  digitalv.h:847

   subtype MCI_DGV_RESUME_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:859

   type MCI_DGV_SAVE_PARMSA is                             --  digitalv.h:868
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:865
         lpstrFileName : Win32.LPSTR;                     --  digitalv.h:866
         rc : Win32.Windef.RECT;               --  digitalv.h:867
      end record;

   type MCI_DGV_SAVE_PARMSW is                             --  digitalv.h:873
      record
         dwCallback : Win32.DWORD;                     --  digitalv.h:870
         lpstrFileName : Win32.LPWSTR;                    --  digitalv.h:871
         rc : Win32.Windef.RECT;               --  digitalv.h:872
      end record;

   subtype MCI_DGV_SAVE_PARMS is MCI_DGV_SAVE_PARMSA;      --  digitalv.h:877

   type MCI_DGV_SET_PARMS is                               --  digitalv.h:895
      record
         dwCallback : Win32.DWORD;                      --  digitalv.h:890
         dwTimeFormat : Win32.DWORD;                      --  digitalv.h:891
         dwAudio : Win32.DWORD;                      --  digitalv.h:892
         dwFileFormat : Win32.DWORD;                      --  digitalv.h:893
         dwSpeed : Win32.DWORD;                      --  digitalv.h:894
      end record;

   type MCI_DGV_SETAUDIO_PARMSA is                         --  digitalv.h:907
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:901
         dwItem : Win32.DWORD;                    --  digitalv.h:902
         dwValue : Win32.DWORD;                    --  digitalv.h:903
         dwOver : Win32.DWORD;                    --  digitalv.h:904
         lpstrAlgorithm : Win32.LPSTR;                    --  digitalv.h:905
         lpstrQuality : Win32.LPSTR;                    --  digitalv.h:906
      end record;

   type MCI_DGV_SETAUDIO_PARMSW is                         --  digitalv.h:915
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:909
         dwItem : Win32.DWORD;                    --  digitalv.h:910
         dwValue : Win32.DWORD;                    --  digitalv.h:911
         dwOver : Win32.DWORD;                    --  digitalv.h:912
         lpstrAlgorithm : Win32.LPWSTR;                   --  digitalv.h:913
         lpstrQuality : Win32.LPWSTR;                   --  digitalv.h:914
      end record;

   subtype MCI_DGV_SETAUDIO_PARMS is MCI_DGV_SETAUDIO_PARMSA;
   --  digitalv.h:919

   type MCI_DGV_SIGNAL_PARMS is                            --  digitalv.h:936
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:932
         dwPosition : Win32.DWORD;                        --  digitalv.h:933
         dwPeriod : Win32.DWORD;                        --  digitalv.h:934
         dwUserParm : Win32.DWORD;                        --  digitalv.h:935
      end record;

   type MCI_DGV_SETVIDEO_PARMSA is                         --  digitalv.h:949
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:942
         dwItem : Win32.DWORD;                    --  digitalv.h:943
         dwValue : Win32.DWORD;                    --  digitalv.h:944
         dwOver : Win32.DWORD;                    --  digitalv.h:945
         lpstrAlgorithm : Win32.LPSTR;                    --  digitalv.h:946
         lpstrQuality : Win32.LPSTR;                    --  digitalv.h:947
         dwSourceNumber : Win32.DWORD;                    --  digitalv.h:948
      end record;

   type MCI_DGV_SETVIDEO_PARMSW is                         --  digitalv.h:958
      record
         dwCallback : Win32.DWORD;                    --  digitalv.h:951
         dwItem : Win32.DWORD;                    --  digitalv.h:952
         dwValue : Win32.DWORD;                    --  digitalv.h:953
         dwOver : Win32.DWORD;                    --  digitalv.h:954
         lpstrAlgorithm : Win32.LPWSTR;                   --  digitalv.h:955
         lpstrQuality : Win32.LPWSTR;                   --  digitalv.h:956
         dwSourceNumber : Win32.DWORD;                    --  digitalv.h:957
      end record;

   subtype MCI_DGV_SETVIDEO_PARMS is MCI_DGV_SETVIDEO_PARMSA;
   --  digitalv.h:962

   type MCI_DGV_STATUS_PARMSA is                           --  digitalv.h:981
      record
         dwCallback : Win32.DWORD;                       --  digitalv.h:975
         dwReturn : Win32.DWORD;                       --  digitalv.h:976
         dwItem : Win32.DWORD;                       --  digitalv.h:977
         dwTrack : Win32.DWORD;                       --  digitalv.h:978
         lpstrDrive : Win32.LPSTR;                       --  digitalv.h:979
         dwReference : Win32.DWORD;                       --  digitalv.h:980
      end record;

   type MCI_DGV_STATUS_PARMSW is                           --  digitalv.h:989
      record
         dwCallback : Win32.DWORD;                       --  digitalv.h:983
         dwReturn : Win32.DWORD;                       --  digitalv.h:984
         dwItem : Win32.DWORD;                       --  digitalv.h:985
         dwTrack : Win32.DWORD;                       --  digitalv.h:986
         lpstrDrive : Win32.LPWSTR;                      --  digitalv.h:987
         dwReference : Win32.DWORD;                       --  digitalv.h:988
      end record;

   subtype MCI_DGV_STATUS_PARMS is MCI_DGV_STATUS_PARMSA;  --  digitalv.h:993

   type MCI_DGV_STEP_PARMS is                              --  digitalv.h:1008
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:1006
         dwFrames : Win32.DWORD;                        --  digitalv.h:1007
      end record;

   subtype MCI_DGV_STOP_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;
   --  digitalv.h:1013

   subtype MCI_DGV_UNFREEZE_PARMS is MCI_DGV_RECT_PARMS;   --  digitalv.h:1018

   type MCI_DGV_UPDATE_PARMS is                            --  digitalv.h:1036
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:1024
         rc : Win32.Windef.RECT;                  --  digitalv.h:1029
         hDC : Win32.Windef.HDC;                   --  digitalv.h:1031
      end record;

   subtype MCI_DGV_WHERE_PARMS is MCI_DGV_RECT_PARMS;      --  digitalv.h:1041

   type MCI_DGV_WINDOW_PARMSA is                           --  digitalv.h:1057
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:1047
         hWnd : Win32.Windef.HWND;                  --  digitalv.h:1048
         nCmdShow : Win32.UINT;                         --  digitalv.h:1052
         lpstrText : Win32.LPSTR;                        --  digitalv.h:1056
      end record;

   type MCI_DGV_WINDOW_PARMSW is                           --  digitalv.h:1069
      record
         dwCallback : Win32.DWORD;                        --  digitalv.h:1059
         hWnd : Win32.Windef.HWND;                  --  digitalv.h:1060
         nCmdShow : Win32.UINT;                         --  digitalv.h:1064
         lpstrText : Win32.LPWSTR;                       --  digitalv.h:1068
      end record;

   subtype MCI_DGV_WINDOW_PARMS is MCI_DGV_WINDOW_PARMSA;  --  digitalv.h:1073

   --  The macro SEND_DGVSIGNAL was not translated into Ada because it
   --  requires a constant that is defined in a system module.
private

   pragma Convention (C, MCI_DGV_RECT_PARMS);               --  digitalv.h:490
   pragma Convention (C, MCI_DGV_CAPTURE_PARMSA);           --  digitalv.h:504
   pragma Convention (C, MCI_DGV_CAPTURE_PARMSW);           --  digitalv.h:514
   pragma Convention (C, MCI_DGV_COPY_PARMS);               --  digitalv.h:547
   pragma Convention (C_Pass_By_Copy, MCI_DGV_CUE_PARMS);   --  digitalv.h:555
   pragma Convention (C, MCI_DGV_CUT_PARMS);                --  digitalv.h:572
   pragma Convention (C, MCI_DGV_DELETE_PARMS);             --  digitalv.h:589
   pragma Convention (C_Pass_By_Copy, MCI_DGV_INFO_PARMSA); --  digitalv.h:604
   pragma Convention (C_Pass_By_Copy, MCI_DGV_INFO_PARMSW); --  digitalv.h:610
   pragma Convention (C, MCI_DGV_LIST_PARMSA);              --  digitalv.h:634
   pragma Convention (C, MCI_DGV_LIST_PARMSW);              --  digitalv.h:642
   pragma Convention (C_Pass_By_Copy, MCI_DGV_MONITOR_PARMS);
   --  digitalv.h:667
   pragma Convention (C, MCI_DGV_OPEN_PARMSA);              --  digitalv.h:686
   pragma Convention (C, MCI_DGV_OPEN_PARMSW);              --  digitalv.h:701
   pragma Convention (C, MCI_DGV_PASTE_PARMS);              --  digitalv.h:733
   pragma Convention (C, MCI_DGV_QUALITY_PARMSA);           --  digitalv.h:754
   pragma Convention (C, MCI_DGV_QUALITY_PARMSW);           --  digitalv.h:761
   pragma Convention (C, MCI_DGV_RECORD_PARMS);             --  digitalv.h:794
   pragma Convention (C_Pass_By_Copy, MCI_DGV_RESERVE_PARMSA);
   --  digitalv.h:803
   pragma Convention (C_Pass_By_Copy, MCI_DGV_RESERVE_PARMSW);
   --  digitalv.h:808
   pragma Convention (C, MCI_DGV_RESTORE_PARMSA);           --  digitalv.h:833
   pragma Convention (C, MCI_DGV_RESTORE_PARMSW);           --  digitalv.h:843
   pragma Convention (C, MCI_DGV_SAVE_PARMSA);              --  digitalv.h:868
   pragma Convention (C, MCI_DGV_SAVE_PARMSW);              --  digitalv.h:873
   pragma Convention (C, MCI_DGV_SET_PARMS);                --  digitalv.h:895
   pragma Convention (C, MCI_DGV_SETAUDIO_PARMSA);          --  digitalv.h:907
   pragma Convention (C, MCI_DGV_SETAUDIO_PARMSW);          --  digitalv.h:915
   pragma Convention (C_Pass_By_Copy, MCI_DGV_SIGNAL_PARMS);
   --  digitalv.h:936
   pragma Convention (C, MCI_DGV_SETVIDEO_PARMSA);          --  digitalv.h:949
   pragma Convention (C, MCI_DGV_SETVIDEO_PARMSW);          --  digitalv.h:958
   pragma Convention (C, MCI_DGV_STATUS_PARMSA);            --  digitalv.h:981
   pragma Convention (C, MCI_DGV_STATUS_PARMSW);            --  digitalv.h:989
   pragma Convention (C_Pass_By_Copy, MCI_DGV_STEP_PARMS);  --  digitalv.h:1008
   pragma Convention (C, MCI_DGV_UPDATE_PARMS);             --  digitalv.h:1036
   pragma Convention (C_Pass_By_Copy, MCI_DGV_WINDOW_PARMSA);
   --  digitalv.h:1057
   pragma Convention (C_Pass_By_Copy, MCI_DGV_WINDOW_PARMSW);
   --  digitalv.h:1069

end Win32.Digitalv;


