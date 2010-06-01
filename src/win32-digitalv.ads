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

with Win32.Mmsystem;
with Win32.Windef;

package Win32.Digitalv is

   INC_DIGITALV                    : constant := 100;
   MCI_TEST                        : constant := 16#20#;
   MCI_CAPTURE                     : constant := 16#870#;
   MCI_MONITOR                     : constant := 16#871#;
   MCI_RESERVE                     : constant := 16#872#;
   MCI_SETAUDIO                    : constant := 16#873#;
   MCI_SIGNAL                      : constant := 16#875#;
   MCI_SETVIDEO                    : constant := 16#876#;
   MCI_QUALITY                     : constant := 16#877#;
   MCI_LIST                        : constant := 16#878#;
   MCI_UNDO                        : constant := 16#879#;
   MCI_CONFIGURE                   : constant := 16#87a#;
   MCI_RESTORE                     : constant := 16#87b#;
   MCI_ON                          : constant := 1;
   MCI_OFF                         : constant := 0;
   MCI_DGV_FILE_MODE_SAVING        : constant := 16#1#;
   MCI_DGV_FILE_MODE_LOADING       : constant := 16#2#;
   MCI_DGV_FILE_MODE_EDITING       : constant := 16#3#;
   MCI_DGV_FILE_MODE_IDLE          : constant := 16#4#;
   MCI_ON_S                        : constant := 16#8000#;
   MCI_OFF_S                       : constant := 16#8001#;
   MCI_DGV_FILE_S                  : constant := 16#8002#;
   MCI_DGV_INPUT_S                 : constant := 16#8003#;
   MCI_DGV_FILE_MODE_SAVING_S      : constant := 16#8004#;
   MCI_DGV_FILE_MODE_LOADING_S     : constant := 16#8005#;
   MCI_DGV_FILE_MODE_EDITING_S     : constant := 16#8006#;
   MCI_DGV_FILE_MODE_IDLE_S        : constant := 16#8007#;
   MCI_DGV_SETVIDEO_SRC_NTSC_S     : constant := 16#8010#;
   MCI_DGV_SETVIDEO_SRC_RGB_S      : constant := 16#8011#;
   MCI_DGV_SETVIDEO_SRC_SVIDEO_S   : constant := 16#8012#;
   MCI_DGV_SETVIDEO_SRC_PAL_S      : constant := 16#8013#;
   MCI_DGV_SETVIDEO_SRC_SECAM_S    : constant := 16#8014#;
   MCI_DGV_SETVIDEO_SRC_GENERIC_S  : constant := 16#8015#;
   MCI_DGV_SETAUDIO_SRC_LEFT_S     : constant := 16#8020#;
   MCI_DGV_SETAUDIO_SRC_RIGHT_S    : constant := 16#8021#;
   MCI_DGV_SETAUDIO_SRC_AVERAGE_S  : constant := 16#8022#;
   MCI_DGV_SETAUDIO_SRC_STEREO_S   : constant := 16#8023#;
   MM_MCISIGNAL                    : constant := 16#3cb#;
   MCIERR_DGV_DEVICE_LIMIT         : constant := 512;
   MCIERR_DGV_IOERR                : constant := 513;
   MCIERR_DGV_WORKSPACE_EMPTY      : constant := 514;
   MCIERR_DGV_DISK_FULL            : constant := 515;
   MCIERR_DGV_DEVICE_MEMORY_FULL   : constant := 516;
   MCIERR_DGV_BAD_CLIPBOARD_RANGE  : constant := 517;
   MCI_DGV_METHOD_PRE              : constant := 16#a000#;
   MCI_DGV_METHOD_POST             : constant := 16#a001#;
   MCI_DGV_METHOD_DIRECT           : constant := 16#a002#;
   MCI_DGV_FF_AVSS                 : constant := 16#4000#;
   MCI_DGV_FF_AVI                  : constant := 16#4001#;
   MCI_DGV_FF_DIB                  : constant := 16#4002#;
   MCI_DGV_FF_RDIB                 : constant := 16#4003#;
   MCI_DGV_FF_JPEG                 : constant := 16#4004#;
   MCI_DGV_FF_RJPEG                : constant := 16#4005#;
   MCI_DGV_FF_JFIF                 : constant := 16#4006#;
   MCI_DGV_FF_MPEG                 : constant := 16#4007#;
   MCI_DGV_GETDEVCAPS_CAN_LOCK     : constant := 16#4000#;
   MCI_DGV_GETDEVCAPS_CAN_STRETCH  : constant := 16#4001#;
   MCI_DGV_GETDEVCAPS_CAN_FREEZE   : constant := 16#4002#;
   MCI_DGV_GETDEVCAPS_MAX_WINDOWS  : constant := 16#4003#;
   MCI_DGV_GETDEVCAPS_CAN_REVERSE  : constant := 16#4004#;
   MCI_DGV_GETDEVCAPS_HAS_STILL    : constant := 16#4005#;
   MCI_DGV_GETDEVCAPS_PALETTES     : constant := 16#4006#;
   MCI_DGV_GETDEVCAPS_CAN_STR_IN   : constant := 16#4008#;
   MCI_DGV_GETDEVCAPS_CAN_TEST     : constant := 16#4009#;
   MCI_DGV_GETDEVCAPS_MAXIMUM_RATE : constant := 16#400a#;
   MCI_DGV_GETDEVCAPS_MINIMUM_RATE : constant := 16#400b#;
   MCI_DGV_CAPTURE_AS              : constant := 16#10000#;
   MCI_DGV_CAPTURE_AT              : constant := 16#20000#;
   MCI_DGV_COPY_AT                 : constant := 16#10000#;
   MCI_DGV_COPY_AUDIO_STREAM       : constant := 16#20000#;
   MCI_DGV_COPY_VIDEO_STREAM       : constant := 16#40000#;
   MCI_DGV_CUE_INPUT               : constant := 16#10000#;
   MCI_DGV_CUE_OUTPUT              : constant := 16#20000#;
   MCI_DGV_CUE_NOSHOW              : constant := 16#40000#;
   MCI_DGV_CUT_AT                  : constant := 16#10000#;
   MCI_DGV_CUT_AUDIO_STREAM        : constant := 16#20000#;
   MCI_DGV_CUT_VIDEO_STREAM        : constant := 16#40000#;
   MCI_DGV_DELETE_AT               : constant := 16#10000#;
   MCI_DGV_DELETE_AUDIO_STREAM     : constant := 16#20000#;
   MCI_DGV_DELETE_VIDEO_STREAM     : constant := 16#40000#;
   MCI_DGV_FREEZE_AT               : constant := 16#10000#;
   MCI_DGV_FREEZE_OUTSIDE          : constant := 16#20000#;
   MCI_DGV_INFO_TEXT               : constant := 16#10000#;
   MCI_DGV_INFO_ITEM               : constant := 16#20000#;
   MCI_INFO_VERSION                : constant := 16#400#;
   MCI_DGV_INFO_USAGE              : constant := 16#4000#;
   MCI_DGV_INFO_AUDIO_QUALITY      : constant := 16#4001#;
   MCI_DGV_INFO_STILL_QUALITY      : constant := 16#4002#;
   MCI_DGV_INFO_VIDEO_QUALITY      : constant := 16#4003#;
   MCI_DGV_INFO_AUDIO_ALG          : constant := 16#4004#;
   MCI_DGV_INFO_STILL_ALG          : constant := 16#4005#;
   MCI_DGV_INFO_VIDEO_ALG          : constant := 16#4006#;
   MCI_DGV_LIST_ITEM               : constant := 16#10000#;
   MCI_DGV_LIST_COUNT              : constant := 16#20000#;
   MCI_DGV_LIST_NUMBER             : constant := 16#40000#;
   MCI_DGV_LIST_ALG                : constant := 16#80000#;
   MCI_DGV_LIST_AUDIO_ALG          : constant := 16#4000#;
   MCI_DGV_LIST_AUDIO_QUALITY      : constant := 16#4001#;
   MCI_DGV_LIST_AUDIO_STREAM       : constant := 16#4002#;
   MCI_DGV_LIST_STILL_ALG          : constant := 16#4003#;
   MCI_DGV_LIST_STILL_QUALITY      : constant := 16#4004#;
   MCI_DGV_LIST_VIDEO_ALG          : constant := 16#4005#;
   MCI_DGV_LIST_VIDEO_QUALITY      : constant := 16#4006#;
   MCI_DGV_LIST_VIDEO_STREAM       : constant := 16#4007#;
   MCI_DGV_LIST_VIDEO_SOURCE       : constant := 16#4008#;
   MCI_DGV_MONITOR_METHOD          : constant := 16#10000#;
   MCI_DGV_MONITOR_SOURCE          : constant := 16#20000#;
   MCI_DGV_MONITOR_INPUT           : constant := 16#4000#;
   MCI_DGV_MONITOR_FILE            : constant := 16#4001#;
   MCI_DGV_OPEN_WS                 : constant := 16#10000#;
   MCI_DGV_OPEN_PARENT             : constant := 16#20000#;
   MCI_DGV_OPEN_NOSTATIC           : constant := 16#40000#;
   MCI_DGV_PASTE_AT                : constant := 16#10000#;
   MCI_DGV_PASTE_AUDIO_STREAM      : constant := 16#20000#;
   MCI_DGV_PASTE_VIDEO_STREAM      : constant := 16#40000#;
   MCI_DGV_PASTE_INSERT            : constant := 16#80000#;
   MCI_DGV_PASTE_OVERWRITE         : constant := 16#100000#;
   MCI_DGV_PLAY_REPEAT             : constant := 16#10000#;
   MCI_DGV_PLAY_REVERSE            : constant := 16#20000#;
   MCI_DGV_RECT                    : constant := 16#10000#;
   MCI_DGV_PUT_SOURCE              : constant := 16#20000#;
   MCI_DGV_PUT_DESTINATION         : constant := 16#40000#;
   MCI_DGV_PUT_FRAME               : constant := 16#80000#;
   MCI_DGV_PUT_VIDEO               : constant := 16#100000#;
   MCI_DGV_PUT_WINDOW              : constant := 16#200000#;
   MCI_DGV_PUT_CLIENT              : constant := 16#400000#;
   MCI_QUALITY_ITEM                : constant := 16#10000#;
   MCI_QUALITY_NAME                : constant := 16#20000#;
   MCI_QUALITY_ALG                 : constant := 16#40000#;
   MCI_QUALITY_DIALOG              : constant := 16#80000#;
   MCI_QUALITY_HANDLE              : constant := 16#100000#;
   MCI_QUALITY_ITEM_AUDIO          : constant := 16#4000#;
   MCI_QUALITY_ITEM_STILL          : constant := 16#4001#;
   MCI_QUALITY_ITEM_VIDEO          : constant := 16#4002#;
   MCI_DGV_REALIZE_NORM            : constant := 16#10000#;
   MCI_DGV_REALIZE_BKGD            : constant := 16#20000#;
   MCI_DGV_RECORD_HOLD             : constant := 16#20000#;
   MCI_DGV_RECORD_AUDIO_STREAM     : constant := 16#40000#;
   MCI_DGV_RECORD_VIDEO_STREAM     : constant := 16#80000#;
   MCI_DGV_RESERVE_IN              : constant := 16#10000#;
   MCI_DGV_RESERVE_SIZE            : constant := 16#20000#;
   MCI_DGV_RESTORE_FROM            : constant := 16#10000#;
   MCI_DGV_RESTORE_AT              : constant := 16#20000#;
   MCI_DGV_SAVE_ABORT              : constant := 16#20000#;
   MCI_DGV_SAVE_KEEPRESERVE        : constant := 16#40000#;
   MCI_DGV_SET_SEEK_EXACTLY        : constant := 16#10000#;
   MCI_DGV_SET_SPEED               : constant := 16#20000#;
   MCI_DGV_SET_STILL               : constant := 16#40000#;
   MCI_DGV_SET_FILEFORMAT          : constant := 16#80000#;
   MCI_DGV_SETAUDIO_OVER           : constant := 16#10000#;
   MCI_DGV_SETAUDIO_CLOCKTIME      : constant := 16#20000#;
   MCI_DGV_SETAUDIO_ALG            : constant := 16#40000#;
   MCI_DGV_SETAUDIO_QUALITY        : constant := 16#80000#;
   MCI_DGV_SETAUDIO_RECORD         : constant := 16#100000#;
   MCI_DGV_SETAUDIO_LEFT           : constant := 16#200000#;
   MCI_DGV_SETAUDIO_RIGHT          : constant := 16#400000#;
   MCI_DGV_SETAUDIO_ITEM           : constant := 16#800000#;
   MCI_DGV_SETAUDIO_VALUE          : constant := 16#1000000#;
   MCI_DGV_SETAUDIO_INPUT          : constant := 16#2000000#;
   MCI_DGV_SETAUDIO_OUTPUT         : constant := 16#4000000#;
   MCI_DGV_SETAUDIO_TREBLE         : constant := 16#4000#;
   MCI_DGV_SETAUDIO_BASS           : constant := 16#4001#;
   MCI_DGV_SETAUDIO_VOLUME         : constant := 16#4002#;
   MCI_DGV_SETAUDIO_STREAM         : constant := 16#4003#;
   MCI_DGV_SETAUDIO_SOURCE         : constant := 16#4004#;
   MCI_DGV_SETAUDIO_SAMPLESPERSEC  : constant := 16#4005#;
   MCI_DGV_SETAUDIO_AVGBYTESPERSEC : constant := 16#4006#;
   MCI_DGV_SETAUDIO_BLOCKALIGN     : constant := 16#4007#;
   MCI_DGV_SETAUDIO_BITSPERSAMPLE  : constant := 16#4008#;
   MCI_DGV_SETAUDIO_SOURCE_STEREO  : constant := 16#0#;
   MCI_DGV_SETAUDIO_SOURCE_LEFT    : constant := 16#1#;
   MCI_DGV_SETAUDIO_SOURCE_RIGHT   : constant := 16#2#;
   MCI_DGV_SETAUDIO_SOURCE_AVERAGE : constant := 16#4000#;
   MCI_DGV_SETVIDEO_QUALITY        : constant := 16#10000#;
   MCI_DGV_SETVIDEO_ALG            : constant := 16#20000#;
   MCI_DGV_SETVIDEO_CLOCKTIME      : constant := 16#40000#;
   MCI_DGV_SETVIDEO_SRC_NUMBER     : constant := 16#80000#;
   MCI_DGV_SETVIDEO_ITEM           : constant := 16#100000#;
   MCI_DGV_SETVIDEO_OVER           : constant := 16#200000#;
   MCI_DGV_SETVIDEO_RECORD         : constant := 16#400000#;
   MCI_DGV_SETVIDEO_STILL          : constant := 16#800000#;
   MCI_DGV_SETVIDEO_VALUE          : constant := 16#1000000#;
   MCI_DGV_SETVIDEO_INPUT          : constant := 16#2000000#;
   MCI_DGV_SETVIDEO_OUTPUT         : constant := 16#4000000#;
   MCI_DGV_SETVIDEO_SRC_NTSC       : constant := 16#4000#;
   MCI_DGV_SETVIDEO_SRC_RGB        : constant := 16#4001#;
   MCI_DGV_SETVIDEO_SRC_SVIDEO     : constant := 16#4002#;
   MCI_DGV_SETVIDEO_SRC_PAL        : constant := 16#4003#;
   MCI_DGV_SETVIDEO_SRC_SECAM      : constant := 16#4004#;
   MCI_DGV_SETVIDEO_SRC_GENERIC    : constant := 16#4005#;
   MCI_DGV_SETVIDEO_BRIGHTNESS     : constant := 16#4000#;
   MCI_DGV_SETVIDEO_COLOR          : constant := 16#4001#;
   MCI_DGV_SETVIDEO_CONTRAST       : constant := 16#4002#;
   MCI_DGV_SETVIDEO_TINT           : constant := 16#4003#;
   MCI_DGV_SETVIDEO_SHARPNESS      : constant := 16#4004#;
   MCI_DGV_SETVIDEO_GAMMA          : constant := 16#4005#;
   MCI_DGV_SETVIDEO_STREAM         : constant := 16#4006#;
   MCI_DGV_SETVIDEO_PALHANDLE      : constant := 16#4007#;
   MCI_DGV_SETVIDEO_FRAME_RATE     : constant := 16#4008#;
   MCI_DGV_SETVIDEO_SOURCE         : constant := 16#4009#;
   MCI_DGV_SETVIDEO_KEY_INDEX      : constant := 16#400a#;
   MCI_DGV_SETVIDEO_KEY_COLOR      : constant := 16#400b#;
   MCI_DGV_SETVIDEO_BITSPERPEL     : constant := 16#400c#;
   MCI_DGV_SIGNAL_AT               : constant := 16#10000#;
   MCI_DGV_SIGNAL_EVERY            : constant := 16#20000#;
   MCI_DGV_SIGNAL_USERVAL          : constant := 16#40000#;
   MCI_DGV_SIGNAL_CANCEL           : constant := 16#80000#;
   MCI_DGV_SIGNAL_POSITION         : constant := 16#100000#;
   MCI_DGV_STATUS_NOMINAL          : constant := 16#20000#;
   MCI_DGV_STATUS_REFERENCE        : constant := 16#40000#;
   MCI_DGV_STATUS_LEFT             : constant := 16#80000#;
   MCI_DGV_STATUS_RIGHT            : constant := 16#100000#;
   MCI_DGV_STATUS_DISKSPACE        : constant := 16#200000#;
   MCI_DGV_STATUS_INPUT            : constant := 16#400000#;
   MCI_DGV_STATUS_OUTPUT           : constant := 16#800000#;
   MCI_DGV_STATUS_RECORD           : constant := 16#1000000#;
   MCI_DGV_STATUS_AUDIO_INPUT      : constant := 16#4000#;
   MCI_DGV_STATUS_HWND             : constant := 16#4001#;
   MCI_DGV_STATUS_SPEED            : constant := 16#4003#;
   MCI_DGV_STATUS_HPAL             : constant := 16#4004#;
   MCI_DGV_STATUS_BRIGHTNESS       : constant := 16#4005#;
   MCI_DGV_STATUS_COLOR            : constant := 16#4006#;
   MCI_DGV_STATUS_CONTRAST         : constant := 16#4007#;
   MCI_DGV_STATUS_FILEFORMAT       : constant := 16#4008#;
   MCI_DGV_STATUS_AUDIO_SOURCE     : constant := 16#4009#;
   MCI_DGV_STATUS_GAMMA            : constant := 16#400a#;
   MCI_DGV_STATUS_MONITOR          : constant := 16#400b#;
   MCI_DGV_STATUS_MONITOR_METHOD   : constant := 16#400c#;
   MCI_DGV_STATUS_FRAME_RATE       : constant := 16#400e#;
   MCI_DGV_STATUS_BASS             : constant := 16#400f#;
   MCI_DGV_STATUS_SIZE             : constant := 16#4010#;
   MCI_DGV_STATUS_SEEK_EXACTLY     : constant := 16#4011#;
   MCI_DGV_STATUS_SHARPNESS        : constant := 16#4012#;
   MCI_DGV_STATUS_SMPTE            : constant := 16#4013#;
   MCI_DGV_STATUS_AUDIO            : constant := 16#4014#;
   MCI_DGV_STATUS_TINT             : constant := 16#4015#;
   MCI_DGV_STATUS_TREBLE           : constant := 16#4016#;
   MCI_DGV_STATUS_UNSAVED          : constant := 16#4017#;
   MCI_DGV_STATUS_VIDEO            : constant := 16#4018#;
   MCI_DGV_STATUS_VOLUME           : constant := 16#4019#;
   MCI_DGV_STATUS_AUDIO_RECORD     : constant := 16#401a#;
   MCI_DGV_STATUS_VIDEO_SOURCE     : constant := 16#401b#;
   MCI_DGV_STATUS_VIDEO_RECORD     : constant := 16#401c#;
   MCI_DGV_STATUS_STILL_FILEFORMAT : constant := 16#401d#;
   MCI_DGV_STATUS_VIDEO_SRC_NUM    : constant := 16#401e#;
   MCI_DGV_STATUS_FILE_MODE        : constant := 16#401f#;
   MCI_DGV_STATUS_FILE_COMPLETION  : constant := 16#4020#;
   MCI_DGV_STATUS_WINDOW_VISIBLE   : constant := 16#4021#;
   MCI_DGV_STATUS_WINDOW_MINIMIZED : constant := 16#4022#;
   MCI_DGV_STATUS_WINDOW_MAXIMIZED : constant := 16#4023#;
   MCI_DGV_STATUS_KEY_INDEX        : constant := 16#4024#;
   MCI_DGV_STATUS_KEY_COLOR        : constant := 16#4025#;
   MCI_DGV_STATUS_PAUSE_MODE       : constant := 16#4026#;
   MCI_DGV_STATUS_SAMPLESPERSEC    : constant := 16#4027#;
   MCI_DGV_STATUS_AVGBYTESPERSEC   : constant := 16#4028#;
   MCI_DGV_STATUS_BLOCKALIGN       : constant := 16#4029#;
   MCI_DGV_STATUS_BITSPERSAMPLE    : constant := 16#402a#;
   MCI_DGV_STATUS_BITSPERPEL       : constant := 16#402b#;
   MCI_DGV_STATUS_FORWARD          : constant := 16#402c#;
   MCI_DGV_STATUS_AUDIO_STREAM     : constant := 16#402d#;
   MCI_DGV_STATUS_VIDEO_STREAM     : constant := 16#402e#;
   MCI_DGV_STEP_REVERSE            : constant := 16#10000#;
   MCI_DGV_STEP_FRAMES             : constant := 16#20000#;
   MCI_DGV_STOP_HOLD               : constant := 16#10000#;
   MCI_DGV_UPDATE_HDC              : constant := 16#20000#;
   MCI_DGV_UPDATE_PAINT            : constant := 16#40000#;
   MCI_DGV_WHERE_SOURCE            : constant := 16#20000#;
   MCI_DGV_WHERE_DESTINATION       : constant := 16#40000#;
   MCI_DGV_WHERE_FRAME             : constant := 16#80000#;
   MCI_DGV_WHERE_VIDEO             : constant := 16#100000#;
   MCI_DGV_WHERE_WINDOW            : constant := 16#200000#;
   MCI_DGV_WHERE_MAX               : constant := 16#400000#;
   MCI_DGV_WINDOW_HWND             : constant := 16#10000#;
   MCI_DGV_WINDOW_STATE            : constant := 16#40000#;
   MCI_DGV_WINDOW_TEXT             : constant := 16#80000#;
   MCI_DGV_WINDOW_DEFAULT          : constant := 16#0#;

   type MCI_DGV_RECT_PARMS;
   type MCI_DGV_CAPTURE_PARMSA;
   type MCI_DGV_CAPTURE_PARMSW;
   type MCI_DGV_COPY_PARMS;
   type MCI_DGV_CUE_PARMS;
   type MCI_DGV_CUT_PARMS;
   type MCI_DGV_DELETE_PARMS;
   type MCI_DGV_INFO_PARMSA;
   type MCI_DGV_INFO_PARMSW;
   type MCI_DGV_LIST_PARMSA;
   type MCI_DGV_LIST_PARMSW;
   type MCI_DGV_MONITOR_PARMS;
   type MCI_DGV_OPEN_PARMSA;
   type MCI_DGV_OPEN_PARMSW;
   type MCI_DGV_PASTE_PARMS;
   type MCI_DGV_QUALITY_PARMSA;
   type MCI_DGV_QUALITY_PARMSW;
   type MCI_DGV_RECORD_PARMS;
   type MCI_DGV_RESERVE_PARMSA;
   type MCI_DGV_RESERVE_PARMSW;
   type MCI_DGV_RESTORE_PARMSA;
   type MCI_DGV_RESTORE_PARMSW;
   type MCI_DGV_SAVE_PARMSA;
   type MCI_DGV_SAVE_PARMSW;
   type MCI_DGV_SET_PARMS;
   type MCI_DGV_SETAUDIO_PARMSA;
   type MCI_DGV_SETAUDIO_PARMSW;
   type MCI_DGV_SIGNAL_PARMS;
   type MCI_DGV_SETVIDEO_PARMSA;
   type MCI_DGV_SETVIDEO_PARMSW;
   type MCI_DGV_STATUS_PARMSA;
   type MCI_DGV_STATUS_PARMSW;
   type MCI_DGV_STEP_PARMS;
   type MCI_DGV_UPDATE_PARMS;
   type MCI_DGV_WINDOW_PARMSA;
   type MCI_DGV_WINDOW_PARMSW;

   type LPMCI_DGV_RECT_PARMS is access all MCI_DGV_RECT_PARMS;
   type LPMCI_DGV_CAPTURE_PARMSA is access all MCI_DGV_CAPTURE_PARMSA;
   type LPMCI_DGV_CAPTURE_PARMSW is access all MCI_DGV_CAPTURE_PARMSW;
   subtype LPMCI_DGV_CAPTURE_PARMS is LPMCI_DGV_CAPTURE_PARMSA;
   type LPMCI_CLOSE_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   type LPMCI_DGV_COPY_PARMS is access all MCI_DGV_COPY_PARMS;
   type LPMCI_DGV_CUE_PARMS is access all MCI_DGV_CUE_PARMS;
   type LPMCI_DGV_CUT_PARMS is access all MCI_DGV_CUT_PARMS;
   type LPMCI_DGV_DELETE_PARMS is access all MCI_DGV_DELETE_PARMS;
   type LPMCI_DGV_FREEZE_PARMS is access all MCI_DGV_RECT_PARMS;
   type LPMCI_DGV_INFO_PARMSA is access all MCI_DGV_INFO_PARMSA;
   type LPMCI_DGV_INFO_PARMSW is access all MCI_DGV_INFO_PARMSW;
   subtype LPMCI_DGV_INFO_PARMS is LPMCI_DGV_INFO_PARMSA;
   type LPMCI_DGV_LIST_PARMSA is access all MCI_DGV_LIST_PARMSA;
   type LPMCI_DGV_LIST_PARMSW is access all MCI_DGV_LIST_PARMSW;
   subtype LPMCI_DGV_LIST_PARMS is LPMCI_DGV_LIST_PARMSA;
   type LPMCI_DGV_LOAD_PARMS is access all Win32.Mmsystem.MCI_LOAD_PARMS;
   type LPMCI_DGV_MONITOR_PARMS is access all MCI_DGV_MONITOR_PARMS;
   type LPMCI_DGV_OPEN_PARMSA is access all MCI_DGV_OPEN_PARMSA;
   type LPMCI_DGV_OPEN_PARMSW is access all MCI_DGV_OPEN_PARMSW;
   subtype LPMCI_DGV_OPEN_PARMS is LPMCI_DGV_OPEN_PARMSA;
   type LPMCI_DGV_PAUSE_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   type LPMCI_DGV_PASTE_PARMS is access all MCI_DGV_PASTE_PARMS;
   type LPMCI_DGV_PLAY_PARMS is access all Win32.Mmsystem.MCI_PLAY_PARMS;
   type LPMCI_DGV_PUT_PARMS is access all MCI_DGV_RECT_PARMS;
   type LPMCI_DGV_QUALITY_PARMSA is access all MCI_DGV_QUALITY_PARMSA;
   type LPMCI_DGV_QUALITY_PARMSW is access all MCI_DGV_QUALITY_PARMSW;
   subtype LPMCI_DGV_QUALITY_PARMS is LPMCI_DGV_QUALITY_PARMSA;
   type LPMCI_REALIZE_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   type LPMCI_DGV_RECORD_PARMS is access all MCI_DGV_RECORD_PARMS;
   type LPMCI_DGV_RESERVE_PARMSA is access all MCI_DGV_RESERVE_PARMSA;
   type LPMCI_DGV_RESERVE_PARMSW is access all MCI_DGV_RESERVE_PARMSW;
   subtype LPMCI_DGV_RESERVE_PARMS is LPMCI_DGV_RESERVE_PARMSA;
   type LPMCI_DGV_RESTORE_PARMSA is access all MCI_DGV_RESTORE_PARMSA;
   type LPMCI_DGV_RESTORE_PARMSW is access all MCI_DGV_RESTORE_PARMSW;
   subtype LPMCI_DGV_RESTORE_PARMS is LPMCI_DGV_RESTORE_PARMSA;
   type LPMCI_DGV_RESUME_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   type LPMCI_DGV_SAVE_PARMSA is access all MCI_DGV_SAVE_PARMSA;
   type LPMCI_DGV_SAVE_PARMSW is access all MCI_DGV_SAVE_PARMSW;
   subtype LPMCI_DGV_SAVE_PARMS is LPMCI_DGV_SAVE_PARMSA;
   type LPMCI_DGV_SET_PARMS is access all MCI_DGV_SET_PARMS;
   type LPMCI_DGV_SETAUDIO_PARMSA is access all MCI_DGV_SETAUDIO_PARMSA;
   type LPMCI_DGV_SETAUDIO_PARMSW is access all MCI_DGV_SETAUDIO_PARMSW;
   subtype LPMCI_DGV_SETAUDIO_PARMS is LPMCI_DGV_SETAUDIO_PARMSA;
   type LPMCI_DGV_SIGNAL_PARMS is access all MCI_DGV_SIGNAL_PARMS;
   type LPMCI_DGV_SETVIDEO_PARMSA is access all MCI_DGV_SETVIDEO_PARMSA;
   type LPMCI_DGV_SETVIDEO_PARMSW is access all MCI_DGV_SETVIDEO_PARMSW;
   subtype LPMCI_DGV_SETVIDEO_PARMS is LPMCI_DGV_SETVIDEO_PARMSA;
   type LPMCI_DGV_STATUS_PARMSA is access all MCI_DGV_STATUS_PARMSA;
   type LPMCI_DGV_STATUS_PARMSW is access all MCI_DGV_STATUS_PARMSW;
   subtype LPMCI_DGV_STATUS_PARMS is LPMCI_DGV_STATUS_PARMSA;
   type LPMCI_DGV_STEP_PARMS is access all MCI_DGV_STEP_PARMS;
   type LPMCI_DGV_STOP_PARMS is access all Win32.Mmsystem.MCI_GENERIC_PARMS;
   type LPMCI_DGV_UNFREEZE_PARMS is access all MCI_DGV_RECT_PARMS;
   type LPMCI_DGV_UPDATE_PARMS is access all MCI_DGV_UPDATE_PARMS;
   type LPMCI_DGV_WHERE_PARMS is access all MCI_DGV_RECT_PARMS;
   type LPMCI_DGV_WINDOW_PARMSA is access all MCI_DGV_WINDOW_PARMSA;
   type LPMCI_DGV_WINDOW_PARMSW is access all MCI_DGV_WINDOW_PARMSW;
   subtype LPMCI_DGV_WINDOW_PARMS is LPMCI_DGV_WINDOW_PARMSA;

   type MCI_DGV_RECT_PARMS is record
      dwCallback : Win32.DWORD;
      rc         : Win32.Windef.RECT;
   end record;

   type MCI_DGV_CAPTURE_PARMSA is record
      dwCallback    : Win32.DWORD;
      lpstrFileName : Win32.LPSTR;
      rc            : Win32.Windef.RECT;
   end record;

   type MCI_DGV_CAPTURE_PARMSW is record
      dwCallback    : Win32.DWORD;
      lpstrFileName : Win32.LPWSTR;
      rc            : Win32.Windef.RECT;
   end record;

   subtype MCI_DGV_CAPTURE_PARMS is MCI_DGV_CAPTURE_PARMSA;

   subtype MCI_CLOSE_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;

   type MCI_DGV_COPY_PARMS is record
      dwCallback    : Win32.DWORD;
      dwFrom        : Win32.DWORD;
      dwTo          : Win32.DWORD;
      rc            : Win32.Windef.RECT;
      dwAudioStream : Win32.DWORD;
      dwVideoStream : Win32.DWORD;
   end record;

   type MCI_DGV_CUE_PARMS is record
      dwCallback : Win32.DWORD;
      dwTo       : Win32.DWORD;
   end record;

   type MCI_DGV_CUT_PARMS is record
      dwCallback    : Win32.DWORD;
      dwFrom        : Win32.DWORD;
      dwTo          : Win32.DWORD;
      rc            : Win32.Windef.RECT;
      dwAudioStream : Win32.DWORD;
      dwVideoStream : Win32.DWORD;
   end record;

   type MCI_DGV_DELETE_PARMS is record
      dwCallback    : Win32.DWORD;
      dwFrom        : Win32.DWORD;
      dwTo          : Win32.DWORD;
      rc            : Win32.Windef.RECT;
      dwAudioStream : Win32.DWORD;
      dwVideoStream : Win32.DWORD;
   end record;

   subtype MCI_DGV_FREEZE_PARMS is MCI_DGV_RECT_PARMS;

   type MCI_DGV_INFO_PARMSA is record
      dwCallback  : Win32.DWORD;
      lpstrReturn : Win32.LPSTR;
      dwRetSize   : Win32.DWORD;
      dwItem      : Win32.DWORD;
   end record;

   type MCI_DGV_INFO_PARMSW is record
      dwCallback  : Win32.DWORD;
      lpstrReturn : Win32.LPWSTR;
      dwRetSize   : Win32.DWORD;
      dwItem      : Win32.DWORD;
   end record;

   subtype MCI_DGV_INFO_PARMS is MCI_DGV_INFO_PARMSA;

   type MCI_DGV_LIST_PARMSA is record
      dwCallback     : Win32.DWORD;
      lpstrReturn    : Win32.LPSTR;
      dwLength       : Win32.DWORD;
      dwNumber       : Win32.DWORD;
      dwItem         : Win32.DWORD;
      lpstrAlgorithm : Win32.LPSTR;
   end record;

   type MCI_DGV_LIST_PARMSW is record
      dwCallback     : Win32.DWORD;
      lpstrReturn    : Win32.LPWSTR;
      dwLength       : Win32.DWORD;
      dwNumber       : Win32.DWORD;
      dwItem         : Win32.DWORD;
      lpstrAlgorithm : Win32.LPWSTR;
   end record;

   subtype MCI_DGV_LIST_PARMS is MCI_DGV_LIST_PARMSA;

   subtype MCI_DGV_LOAD_PARMS is Win32.Mmsystem.MCI_LOAD_PARMS;

   type MCI_DGV_MONITOR_PARMS is record
      dwCallback : Win32.DWORD;
      dwSource   : Win32.DWORD;
      dwMethod   : Win32.DWORD;
   end record;

   type MCI_DGV_OPEN_PARMSA is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : Win32.UINT;
      lpstrDeviceType  : Win32.LPSTR;
      lpstrElementName : Win32.LPSTR;
      lpstrAlias       : Win32.LPSTR;
      dwStyle          : Win32.DWORD;
      hWndParent       : Win32.Windef.HWND;
   end record;

   type MCI_DGV_OPEN_PARMSW is record
      dwCallback       : Win32.DWORD;
      wDeviceID        : Win32.UINT;
      lpstrDeviceType  : Win32.LPWSTR;
      lpstrElementName : Win32.LPWSTR;
      lpstrAlias       : Win32.LPWSTR;
      dwStyle          : Win32.DWORD;
      hWndParent       : Win32.Windef.HWND;
   end record;

   subtype MCI_DGV_OPEN_PARMS is MCI_DGV_OPEN_PARMSA;

   subtype MCI_DGV_PAUSE_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;

   type MCI_DGV_PASTE_PARMS is record
      dwCallback    : Win32.DWORD;
      dwTo          : Win32.DWORD;
      rc            : Win32.Windef.RECT;
      dwAudioStream : Win32.DWORD;
      dwVideoStream : Win32.DWORD;
   end record;

   subtype MCI_DGV_PLAY_PARMS is Win32.Mmsystem.MCI_PLAY_PARMS;

   subtype MCI_DGV_PUT_PARMS is MCI_DGV_RECT_PARMS;

   type MCI_DGV_QUALITY_PARMSA is record
      dwCallback     : Win32.DWORD;
      dwItem         : Win32.DWORD;
      lpstrName      : Win32.LPSTR;
      lpstrAlgorithm : Win32.DWORD;
      dwHandle       : Win32.DWORD;
   end record;

   type MCI_DGV_QUALITY_PARMSW is record
      dwCallback     : Win32.DWORD;
      dwItem         : Win32.DWORD;
      lpstrName      : Win32.LPWSTR;
      lpstrAlgorithm : Win32.DWORD;
      dwHandle       : Win32.DWORD;
   end record;

   subtype MCI_DGV_QUALITY_PARMS is MCI_DGV_QUALITY_PARMSA;

   subtype MCI_REALIZE_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;

   type MCI_DGV_RECORD_PARMS is record
      dwCallback    : Win32.DWORD;
      dwFrom        : Win32.DWORD;
      dwTo          : Win32.DWORD;
      rc            : Win32.Windef.RECT;
      dwAudioStream : Win32.DWORD;
      dwVideoStream : Win32.DWORD;
   end record;

   type MCI_DGV_RESERVE_PARMSA is record
      dwCallback : Win32.DWORD;
      lpstrPath  : Win32.LPSTR;
      dwSize     : Win32.DWORD;
   end record;

   type MCI_DGV_RESERVE_PARMSW is record
      dwCallback : Win32.DWORD;
      lpstrPath  : Win32.LPWSTR;
      dwSize     : Win32.DWORD;
   end record;

   subtype MCI_DGV_RESERVE_PARMS is MCI_DGV_RESERVE_PARMSA;

   type MCI_DGV_RESTORE_PARMSA is record
      dwCallback    : Win32.DWORD;
      lpstrFileName : Win32.LPSTR;
      rc            : Win32.Windef.RECT;
   end record;

   type MCI_DGV_RESTORE_PARMSW is record
      dwCallback    : Win32.DWORD;
      lpstrFileName : Win32.LPWSTR;
      rc            : Win32.Windef.RECT;
   end record;

   subtype MCI_DGV_RESTORE_PARMS is MCI_DGV_RESTORE_PARMSA;

   subtype MCI_DGV_RESUME_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;

   type MCI_DGV_SAVE_PARMSA is record
      dwCallback    : Win32.DWORD;
      lpstrFileName : Win32.LPSTR;
      rc            : Win32.Windef.RECT;
   end record;

   type MCI_DGV_SAVE_PARMSW is record
      dwCallback    : Win32.DWORD;
      lpstrFileName : Win32.LPWSTR;
      rc            : Win32.Windef.RECT;
   end record;

   subtype MCI_DGV_SAVE_PARMS is MCI_DGV_SAVE_PARMSA;

   type MCI_DGV_SET_PARMS is record
      dwCallback   : Win32.DWORD;
      dwTimeFormat : Win32.DWORD;
      dwAudio      : Win32.DWORD;
      dwFileFormat : Win32.DWORD;
      dwSpeed      : Win32.DWORD;
   end record;

   type MCI_DGV_SETAUDIO_PARMSA is record
      dwCallback     : Win32.DWORD;
      dwItem         : Win32.DWORD;
      dwValue        : Win32.DWORD;
      dwOver         : Win32.DWORD;
      lpstrAlgorithm : Win32.LPSTR;
      lpstrQuality   : Win32.LPSTR;
   end record;

   type MCI_DGV_SETAUDIO_PARMSW is record
      dwCallback     : Win32.DWORD;
      dwItem         : Win32.DWORD;
      dwValue        : Win32.DWORD;
      dwOver         : Win32.DWORD;
      lpstrAlgorithm : Win32.LPWSTR;
      lpstrQuality   : Win32.LPWSTR;
   end record;

   subtype MCI_DGV_SETAUDIO_PARMS is MCI_DGV_SETAUDIO_PARMSA;

   type MCI_DGV_SIGNAL_PARMS is record
      dwCallback : Win32.DWORD;
      dwPosition : Win32.DWORD;
      dwPeriod   : Win32.DWORD;
      dwUserParm : Win32.DWORD;
   end record;

   type MCI_DGV_SETVIDEO_PARMSA is record
      dwCallback     : Win32.DWORD;
      dwItem         : Win32.DWORD;
      dwValue        : Win32.DWORD;
      dwOver         : Win32.DWORD;
      lpstrAlgorithm : Win32.LPSTR;
      lpstrQuality   : Win32.LPSTR;
      dwSourceNumber : Win32.DWORD;
   end record;

   type MCI_DGV_SETVIDEO_PARMSW is record
      dwCallback     : Win32.DWORD;
      dwItem         : Win32.DWORD;
      dwValue        : Win32.DWORD;
      dwOver         : Win32.DWORD;
      lpstrAlgorithm : Win32.LPWSTR;
      lpstrQuality   : Win32.LPWSTR;
      dwSourceNumber : Win32.DWORD;
   end record;

   subtype MCI_DGV_SETVIDEO_PARMS is MCI_DGV_SETVIDEO_PARMSA;

   type MCI_DGV_STATUS_PARMSA is record
      dwCallback  : Win32.DWORD;
      dwReturn    : Win32.DWORD;
      dwItem      : Win32.DWORD;
      dwTrack     : Win32.DWORD;
      lpstrDrive  : Win32.LPSTR;
      dwReference : Win32.DWORD;
   end record;

   type MCI_DGV_STATUS_PARMSW is record
      dwCallback  : Win32.DWORD;
      dwReturn    : Win32.DWORD;
      dwItem      : Win32.DWORD;
      dwTrack     : Win32.DWORD;
      lpstrDrive  : Win32.LPWSTR;
      dwReference : Win32.DWORD;
   end record;

   subtype MCI_DGV_STATUS_PARMS is MCI_DGV_STATUS_PARMSA;

   type MCI_DGV_STEP_PARMS is record
      dwCallback : Win32.DWORD;
      dwFrames   : Win32.DWORD;
   end record;

   subtype MCI_DGV_STOP_PARMS is Win32.Mmsystem.MCI_GENERIC_PARMS;

   subtype MCI_DGV_UNFREEZE_PARMS is MCI_DGV_RECT_PARMS;

   type MCI_DGV_UPDATE_PARMS is record
      dwCallback : Win32.DWORD;
      rc         : Win32.Windef.RECT;
      hDC        : Win32.Windef.HDC;
   end record;

   subtype MCI_DGV_WHERE_PARMS is MCI_DGV_RECT_PARMS;

   type MCI_DGV_WINDOW_PARMSA is record
      dwCallback : Win32.DWORD;
      hWnd       : Win32.Windef.HWND;
      nCmdShow   : Win32.UINT;
      lpstrText  : Win32.LPSTR;
   end record;

   type MCI_DGV_WINDOW_PARMSW is record
      dwCallback : Win32.DWORD;
      hWnd       : Win32.Windef.HWND;
      nCmdShow   : Win32.UINT;
      lpstrText  : Win32.LPWSTR;
   end record;

   subtype MCI_DGV_WINDOW_PARMS is MCI_DGV_WINDOW_PARMSA;

private

   pragma Convention (C, MCI_DGV_RECT_PARMS);
   pragma Convention (C, MCI_DGV_CAPTURE_PARMSA);
   pragma Convention (C, MCI_DGV_CAPTURE_PARMSW);
   pragma Convention (C, MCI_DGV_COPY_PARMS);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_CUE_PARMS);
   pragma Convention (C, MCI_DGV_CUT_PARMS);
   pragma Convention (C, MCI_DGV_DELETE_PARMS);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_INFO_PARMSA);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_INFO_PARMSW);
   pragma Convention (C, MCI_DGV_LIST_PARMSA);
   pragma Convention (C, MCI_DGV_LIST_PARMSW);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_MONITOR_PARMS);
   pragma Convention (C, MCI_DGV_OPEN_PARMSA);
   pragma Convention (C, MCI_DGV_OPEN_PARMSW);
   pragma Convention (C, MCI_DGV_PASTE_PARMS);
   pragma Convention (C, MCI_DGV_QUALITY_PARMSA);
   pragma Convention (C, MCI_DGV_QUALITY_PARMSW);
   pragma Convention (C, MCI_DGV_RECORD_PARMS);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_RESERVE_PARMSA);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_RESERVE_PARMSW);
   pragma Convention (C, MCI_DGV_RESTORE_PARMSA);
   pragma Convention (C, MCI_DGV_RESTORE_PARMSW);
   pragma Convention (C, MCI_DGV_SAVE_PARMSA);
   pragma Convention (C, MCI_DGV_SAVE_PARMSW);
   pragma Convention (C, MCI_DGV_SET_PARMS);
   pragma Convention (C, MCI_DGV_SETAUDIO_PARMSA);
   pragma Convention (C, MCI_DGV_SETAUDIO_PARMSW);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_SIGNAL_PARMS);
   pragma Convention (C, MCI_DGV_SETVIDEO_PARMSA);
   pragma Convention (C, MCI_DGV_SETVIDEO_PARMSW);
   pragma Convention (C, MCI_DGV_STATUS_PARMSA);
   pragma Convention (C, MCI_DGV_STATUS_PARMSW);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_STEP_PARMS);
   pragma Convention (C, MCI_DGV_UPDATE_PARMS);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_WINDOW_PARMSA);
   pragma Convention (C_Pass_By_Copy, MCI_DGV_WINDOW_PARMSW);

end Win32.Digitalv;
