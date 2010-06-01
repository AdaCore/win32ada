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

   ICVERSION                  : constant := 16#104#;
   BI_1632                    : constant := 16#32333631#;
   ICERR_OK                   : constant := 0;
   ICERR_DONTDRAW             : constant := 1;
   ICERR_NEWPALETTE           : constant := 2;
   ICERR_GOTOKEYFRAME         : constant := 3;
   ICERR_STOPDRAWING          : constant := 4;
   ICERR_UNSUPPORTED          : constant := -1;
   ICERR_BADFORMAT            : constant := -2;
   ICERR_MEMORY               : constant := -3;
   ICERR_INTERNAL             : constant := -4;
   ICERR_BADFLAGS             : constant := -5;
   ICERR_BADPARAM             : constant := -6;
   ICERR_BADSIZE              : constant := -7;
   ICERR_BADHANDLE            : constant := -8;
   ICERR_CANTUPDATE           : constant := -9;
   ICERR_ABORT                : constant := -10;
   ICERR_ERROR                : constant := -100;
   ICERR_BADBITDEPTH          : constant := -200;
   ICERR_BADIMAGESIZE         : constant := -201;
   ICERR_CUSTOM               : constant := -400;
   ICMODE_COMPRESS            : constant := 1;
   ICMODE_DECOMPRESS          : constant := 2;
   ICMODE_FASTDECOMPRESS      : constant := 3;
   ICMODE_QUERY               : constant := 4;
   ICMODE_FASTCOMPRESS        : constant := 5;
   ICMODE_DRAW                : constant := 8;
   AVIIF_LIST                 : constant := 16#1#;
   AVIIF_TWOCC                : constant := 16#2#;
   AVIIF_KEYFRAME             : constant := 16#10#;
   ICQUALITY_LOW              : constant := 0;
   ICQUALITY_HIGH             : constant := 10000;
   ICQUALITY_DEFAULT          : constant := -1;
   ICM_USER                   : constant := 16#4000#;
   ICM_RESERVED               : constant := 16#5000#;
   ICM_RESERVED_LOW           : constant := 16#5000#;
   ICM_RESERVED_HIGH          : constant := 16#6000#;
   ICM_GETSTATE               : constant := 16#5000#;
   ICM_SETSTATE               : constant := 16#5001#;
   ICM_GETINFO                : constant := 16#5002#;
   ICM_CONFIGURE              : constant := 16#500a#;
   ICM_ABOUT                  : constant := 16#500b#;
   ICM_GETERRORTEXT           : constant := 16#500c#;
   ICM_GETFORMATNAME          : constant := 16#5014#;
   ICM_ENUMFORMATS            : constant := 16#5015#;
   ICM_GETDEFAULTQUALITY      : constant := 16#501e#;
   ICM_GETQUALITY             : constant := 16#501f#;
   ICM_SETQUALITY             : constant := 16#5020#;
   ICM_SET                    : constant := 16#5028#;
   ICM_GET                    : constant := 16#5029#;
   ICM_FRAMERATE              : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('F', 'r', 'm', 'R');
   ICM_KEYFRAMERATE           : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('K', 'e', 'y', 'R');
   ICM_COMPRESS_GET_FORMAT    : constant := 16#4004#;
   ICM_COMPRESS_GET_SIZE      : constant := 16#4005#;
   ICM_COMPRESS_QUERY         : constant := 16#4006#;
   ICM_COMPRESS_BEGIN         : constant := 16#4007#;
   ICM_COMPRESS               : constant := 16#4008#;
   ICM_COMPRESS_END           : constant := 16#4009#;
   ICM_DECOMPRESS_GET_FORMAT  : constant := 16#400a#;
   ICM_DECOMPRESS_QUERY       : constant := 16#400b#;
   ICM_DECOMPRESS_BEGIN       : constant := 16#400c#;
   ICM_DECOMPRESS             : constant := 16#400d#;
   ICM_DECOMPRESS_END         : constant := 16#400e#;
   ICM_DECOMPRESS_SET_PALETTE : constant := 16#401d#;
   ICM_DECOMPRESS_GET_PALETTE : constant := 16#401e#;
   ICM_DRAW_QUERY             : constant := 16#401f#;
   ICM_DRAW_BEGIN             : constant := 16#400f#;
   ICM_DRAW_GET_PALETTE       : constant := 16#4010#;
   ICM_DRAW_UPDATE            : constant := 16#4011#;
   ICM_DRAW_START             : constant := 16#4012#;
   ICM_DRAW_STOP              : constant := 16#4013#;
   ICM_DRAW_BITS              : constant := 16#4014#;
   ICM_DRAW_END               : constant := 16#4015#;
   ICM_DRAW_GETTIME           : constant := 16#4020#;
   ICM_DRAW                   : constant := 16#4021#;
   ICM_DRAW_WINDOW            : constant := 16#4022#;
   ICM_DRAW_SETTIME           : constant := 16#4023#;
   ICM_DRAW_REALIZE           : constant := 16#4024#;
   ICM_DRAW_FLUSH             : constant := 16#4025#;
   ICM_DRAW_RENDERBUFFER      : constant := 16#4026#;
   ICM_DRAW_START_PLAY        : constant := 16#4027#;
   ICM_DRAW_STOP_PLAY         : constant := 16#4028#;
   ICM_DRAW_SUGGESTFORMAT     : constant := 16#4032#;
   ICM_DRAW_CHANGEPALETTE     : constant := 16#4033#;
   ICM_DRAW_IDLE              : constant := 16#4034#;
   ICM_GETBUFFERSWANTED       : constant := 16#4029#;
   ICM_GETDEFAULTKEYFRAMERATE : constant := 16#402a#;
   ICM_DECOMPRESSEX_BEGIN     : constant := 16#403c#;
   ICM_DECOMPRESSEX_QUERY     : constant := 16#403d#;
   ICM_DECOMPRESSEX           : constant := 16#403e#;
   ICM_DECOMPRESSEX_END       : constant := 16#403f#;
   ICM_COMPRESS_FRAMES_INFO   : constant := 16#4046#;
   ICM_COMPRESS_FRAMES        : constant := 16#4047#;
   ICM_SET_STATUS_PROC        : constant := 16#4048#;
   ICM_ENUM_FORMATS           : constant := 16#4050#;
   ICM_GET_FORMAT_NAME        : constant := 16#4051#;
   VIDCF_QUALITY              : constant := 16#1#;
   VIDCF_CRUNCH               : constant := 16#2#;
   VIDCF_TEMPORAL             : constant := 16#4#;
   VIDCF_COMPRESSFRAMES       : constant := 16#8#;
   VIDCF_DRAW                 : constant := 16#10#;
   VIDCF_FASTTEMPORALC        : constant := 16#20#;
   VIDCF_FASTTEMPORALD        : constant := 16#80#;
   ICCOMPRESS_KEYFRAME        : constant := 16#1#;
   ICCOMPRESSFRAMES_PADDING   : constant := 16#1#;
   ICSTATUS_START             : constant := 0;
   ICSTATUS_STATUS            : constant := 1;
   ICSTATUS_END               : constant := 2;
   ICSTATUS_ERROR             : constant := 3;
   ICSTATUS_YIELD             : constant := 4;
   ICDECOMPRESS_HURRYUP       : constant := 16#80000000#;
   ICDECOMPRESS_UPDATE        : constant := 16#40000000#;
   ICDECOMPRESS_PREROLL       : constant := 16#20000000#;
   ICDECOMPRESS_NULLFRAME     : constant := 16#10000000#;
   ICDECOMPRESS_NOTKEYFRAME   : constant := 16#8000000#;
   ICDRAW_QUERY               : constant := 16#1#;
   ICDRAW_FULLSCREEN          : constant := 16#2#;
   ICDRAW_HDC                 : constant := 16#4#;
   ICDRAW_ANIMATE             : constant := 16#8#;
   ICDRAW_CONTINUE            : constant := 16#10#;
   ICDRAW_MEMORYDC            : constant := 16#20#;
   ICDRAW_UPDATING            : constant := 16#40#;
   ICDRAW_RENDER              : constant := 16#80#;
   ICDRAW_BUFFER              : constant := 16#100#;
   ICDRAW_HURRYUP             : constant := 16#80000000#;
   ICDRAW_UPDATE              : constant := 16#40000000#;
   ICDRAW_PREROLL             : constant := 16#20000000#;
   ICDRAW_NULLFRAME           : constant := 16#10000000#;
   ICDRAW_NOTKEYFRAME         : constant := 16#8000000#;
   ICINSTALL_FUNCTION         : constant := 16#1#;
   ICINSTALL_DRIVER           : constant := 16#2#;
   ICINSTALL_HDRV             : constant := 16#4#;
   ICMF_CONFIGURE_QUERY       : constant := 16#1#;
   ICMF_ABOUT_QUERY           : constant := 16#1#;
   ICMF_COMPVARS_VALID        : constant := 16#1#;
   ICMF_CHOOSE_KEYFRAME       : constant := 16#1#;
   ICMF_CHOOSE_DATARATE       : constant := 16#2#;
   ICMF_CHOOSE_PREVIEW        : constant := 16#4#;
   ICMF_CHOOSE_ALLCOMPRESSORS : constant := 16#8#;
   DDF_0001                   : constant := 16#1#;
   DDF_UPDATE                 : constant := 16#2#;
   DDF_SAME_HDC               : constant := 16#4#;
   DDF_SAME_DRAW              : constant := 16#8#;
   DDF_DONTDRAW               : constant := 16#10#;
   DDF_ANIMATE                : constant := 16#20#;
   DDF_BUFFER                 : constant := 16#40#;
   DDF_JUSTDRAWIT             : constant := 16#80#;
   DDF_FULLSCREEN             : constant := 16#100#;
   DDF_BACKGROUNDPAL          : constant := 16#200#;
   DDF_NOTKEYFRAME            : constant := 16#400#;
   DDF_HURRYUP                : constant := 16#800#;
   DDF_HALFTONE               : constant := 16#1000#;
   DDF_2000                   : constant := 16#2000#;
   DDF_PREROLL                : constant := 16#10#;
   DDF_SAME_DIB               : constant := 16#8#;
   DDF_SAME_SIZE              : constant := 16#8#;
   PD_CAN_DRAW_DIB            : constant := 16#1#;
   PD_CAN_STRETCHDIB          : constant := 16#2#;
   PD_STRETCHDIB_1_1_OK       : constant := 16#4#;
   PD_STRETCHDIB_1_2_OK       : constant := 16#8#;
   PD_STRETCHDIB_1_N_OK       : constant := 16#10#;
   formtypeAVI                : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('A', 'V', 'I', ' ');
   listtypeAVIHEADER          : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('h', 'd', 'r', 'l');
   ckidAVIMAINHDR             : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('a', 'v', 'i', 'h');
   listtypeSTREAMHEADER       : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('s', 't', 'r', 'l');
   ckidSTREAMHEADER           : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('s', 't', 'r', 'h');
   ckidSTREAMFORMAT           : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('s', 't', 'r', 'f');
   ckidSTREAMHANDLERDATA      : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('s', 't', 'r', 'd');
   ckidSTREAMNAME             : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('s', 't', 'r', 'n');
   listtypeAVIMOVIE           : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('m', 'o', 'v', 'i');
   listtypeAVIRECORD          : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('r', 'e', 'c', ' ');
   ckidAVINEWINDEX            : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('i', 'd', 'x', '1');
   streamtypeVIDEO            : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('v', 'i', 'd', 's');
   streamtypeAUDIO            : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('a', 'u', 'd', 's');
   streamtypeMIDI             : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('m', 'i', 'd', 's');
   streamtypeTEXT             : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('t', 'x', 't', 's');

   AVIF_HASINDEX                   : constant := 16#10#;
   AVIF_MUSTUSEINDEX               : constant := 16#20#;
   AVIF_ISINTERLEAVED              : constant := 16#100#;
   AVIF_WASCAPTUREFILE             : constant := 16#10000#;
   AVIF_COPYRIGHTED                : constant := 16#20000#;
   AVI_HEADERSIZE                  : constant := 2048;
   AVISF_DISABLED                  : constant := 16#1#;
   AVISF_VIDEO_PALCHANGES          : constant := 16#10000#;
   AVIIF_FIRSTPART                 : constant := 16#20#;
   AVIIF_LASTPART                  : constant := 16#40#;
   AVIIF_MIDPART                   : constant := 16#60#;
   AVIIF_NOTIME                    : constant := 16#100#;
   AVIIF_COMPUSE                   : constant := 16#fff0000#;
   AVISTREAMINFO_DISABLED          : constant := 16#1#;
   AVISTREAMINFO_FORMATCHANGES     : constant := 16#10000#;
   AVIFILEINFO_HASINDEX            : constant := 16#10#;
   AVIFILEINFO_MUSTUSEINDEX        : constant := 16#20#;
   AVIFILEINFO_ISINTERLEAVED       : constant := 16#100#;
   AVIFILEINFO_WASCAPTUREFILE      : constant := 16#10000#;
   AVIFILEINFO_COPYRIGHTED         : constant := 16#20000#;
   AVIFILECAPS_CANREAD             : constant := 16#1#;
   AVIFILECAPS_CANWRITE            : constant := 16#2#;
   AVIFILECAPS_ALLKEYFRAMES        : constant := 16#10#;
   AVIFILECAPS_NOCOMPRESSION       : constant := 16#20#;
   AVICOMPRESSF_INTERLEAVE         : constant := 16#1#;
   AVICOMPRESSF_DATARATE           : constant := 16#2#;
   AVICOMPRESSF_KEYFRAMES          : constant := 16#4#;
   AVICOMPRESSF_VALID              : constant := 16#8#;
   AVIFILEHANDLER_CANREAD          : constant := 16#1#;
   AVIFILEHANDLER_CANWRITE         : constant := 16#2#;
   AVIFILEHANDLER_CANACCEPTNONRGB  : constant := 16#4#;
   AVISTREAMREAD_CONVENIENT        : constant := -1;
   FIND_DIR                        : constant := 16#f#;
   FIND_NEXT                       : constant := 16#1#;
   FIND_PREV                       : constant := 16#4#;
   FIND_TYPE                       : constant := 16#f0#;
   FIND_KEY                        : constant := 16#10#;
   FIND_ANY                        : constant := 16#20#;
   FIND_FORMAT                     : constant := 16#40#;
   FIND_RET                        : constant := 16#f000#;
   FIND_POS                        : constant := 16#0#;
   FIND_LENGTH                     : constant := 16#1000#;
   FIND_OFFSET                     : constant := 16#2000#;
   FIND_SIZE                       : constant := 16#3000#;
   FIND_INDEX                      : constant := 16#4000#;
   SEARCH_NEAREST                  : constant := 16#4#;
   SEARCH_BACKWARD                 : constant := 16#4#;
   SEARCH_FORWARD                  : constant := 16#1#;
   SEARCH_KEY                      : constant := 16#10#;
   SEARCH_ANY                      : constant := 16#20#;
   comptypeDIB                     : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('D', 'I', 'B', ' ');
   AVIERR_OK                       : constant := 0;
   MCIWNDOPENF_NEW                 : constant := 16#1#;
   MCIWNDF_NOAUTOSIZEWINDOW        : constant := 16#1#;
   MCIWNDF_NOPLAYBAR               : constant := 16#2#;
   MCIWNDF_NOAUTOSIZEMOVIE         : constant := 16#4#;
   MCIWNDF_NOMENU                  : constant := 16#8#;
   MCIWNDF_SHOWNAME                : constant := 16#10#;
   MCIWNDF_SHOWPOS                 : constant := 16#20#;
   MCIWNDF_SHOWMODE                : constant := 16#40#;
   MCIWNDF_SHOWALL                 : constant := 16#70#;
   MCIWNDF_NOTIFYANSI              : constant := 16#80#;
   MCIWNDF_NOTIFYMODEW             : constant := 16#100#;
   MCIWNDF_NOTIFYPOSW              : constant := 16#200#;
   MCIWNDF_NOTIFYSIZEW             : constant := 16#400#;
   MCIWNDF_NOTIFYMEDIAW            : constant := 16#800#;
   MCIWNDF_NOTIFYERRORW            : constant := 16#1000#;
   MCIWNDF_NOTIFYALLW              : constant := 16#1f00#;
   MCIWNDF_NOTIFYMODEA             : constant := 16#180#;
   MCIWNDF_NOTIFYPOSA              : constant := 16#280#;
   MCIWNDF_NOTIFYSIZEA             : constant := 16#480#;
   MCIWNDF_NOTIFYMEDIAA            : constant := 16#880#;
   MCIWNDF_NOTIFYERRORA            : constant := 16#1080#;
   MCIWNDF_NOTIFYALLA              : constant := 16#1f80#;
   MCIWNDF_NOTIFYMODE              : constant := 16#180#;
   MCIWNDF_NOTIFYPOS               : constant := 16#280#;
   MCIWNDF_NOTIFYSIZE              : constant := 16#480#;
   MCIWNDF_NOTIFYMEDIA             : constant := 16#880#;
   MCIWNDF_NOTIFYERROR             : constant := 16#1080#;
   MCIWNDF_NOTIFYALL               : constant := 16#1f80#;
   MCIWNDF_RECORD                  : constant := 16#2000#;
   MCIWNDF_NOERRORDLG              : constant := 16#4000#;
   MCIWNDF_NOOPEN                  : constant := 16#8000#;
   MCIWNDM_GETDEVICEID             : constant := 16#464#;
   MCIWNDM_GETSTART                : constant := 16#467#;
   MCIWNDM_GETLENGTH               : constant := 16#468#;
   MCIWNDM_GETEND                  : constant := 16#469#;
   MCIWNDM_EJECT                   : constant := 16#46b#;
   MCIWNDM_SETZOOM                 : constant := 16#46c#;
   MCIWNDM_GETZOOM                 : constant := 16#46d#;
   MCIWNDM_SETVOLUME               : constant := 16#46e#;
   MCIWNDM_GETVOLUME               : constant := 16#46f#;
   MCIWNDM_SETSPEED                : constant := 16#470#;
   MCIWNDM_GETSPEED                : constant := 16#471#;
   MCIWNDM_SETREPEAT               : constant := 16#472#;
   MCIWNDM_GETREPEAT               : constant := 16#473#;
   MCIWNDM_REALIZE                 : constant := 16#476#;
   MCIWNDM_VALIDATEMEDIA           : constant := 16#479#;
   MCIWNDM_PLAYFROM                : constant := 16#47a#;
   MCIWNDM_PLAYTO                  : constant := 16#47b#;
   MCIWNDM_GETPALETTE              : constant := 16#47e#;
   MCIWNDM_SETPALETTE              : constant := 16#47f#;
   MCIWNDM_SETTIMERS               : constant := 16#481#;
   MCIWNDM_SETACTIVETIMER          : constant := 16#482#;
   MCIWNDM_SETINACTIVETIMER        : constant := 16#483#;
   MCIWNDM_GETACTIVETIMER          : constant := 16#484#;
   MCIWNDM_GETINACTIVETIMER        : constant := 16#485#;
   MCIWNDM_CHANGESTYLES            : constant := 16#487#;
   MCIWNDM_GETSTYLES               : constant := 16#488#;
   MCIWNDM_GETALIAS                : constant := 16#489#;
   MCIWNDM_PLAYREVERSE             : constant := 16#48b#;
   MCIWNDM_GET_SOURCE              : constant := 16#48c#;
   MCIWNDM_PUT_SOURCE              : constant := 16#48d#;
   MCIWNDM_GET_DEST                : constant := 16#48e#;
   MCIWNDM_PUT_DEST                : constant := 16#48f#;
   MCIWNDM_CAN_PLAY                : constant := 16#490#;
   MCIWNDM_CAN_WINDOW              : constant := 16#491#;
   MCIWNDM_CAN_RECORD              : constant := 16#492#;
   MCIWNDM_CAN_SAVE                : constant := 16#493#;
   MCIWNDM_CAN_EJECT               : constant := 16#494#;
   MCIWNDM_CAN_CONFIG              : constant := 16#495#;
   MCIWNDM_PALETTEKICK             : constant := 16#496#;
   MCIWNDM_OPENINTERFACE           : constant := 16#497#;
   MCIWNDM_SETOWNER                : constant := 16#498#;
   MCIWNDM_SENDSTRINGA             : constant := 16#465#;
   MCIWNDM_GETPOSITIONA            : constant := 16#466#;
   MCIWNDM_GETMODEA                : constant := 16#46a#;
   MCIWNDM_SETTIMEFORMATA          : constant := 16#477#;
   MCIWNDM_GETTIMEFORMATA          : constant := 16#478#;
   MCIWNDM_GETFILENAMEA            : constant := 16#47c#;
   MCIWNDM_GETDEVICEA              : constant := 16#47d#;
   MCIWNDM_GETERRORA               : constant := 16#480#;
   MCIWNDM_NEWA                    : constant := 16#486#;
   MCIWNDM_RETURNSTRINGA           : constant := 16#48a#;
   MCIWNDM_OPENA                   : constant := 16#499#;
   MCIWNDM_SENDSTRINGW             : constant := 16#4c9#;
   MCIWNDM_GETPOSITIONW            : constant := 16#4ca#;
   MCIWNDM_GETMODEW                : constant := 16#4ce#;
   MCIWNDM_SETTIMEFORMATW          : constant := 16#4db#;
   MCIWNDM_GETTIMEFORMATW          : constant := 16#4dc#;
   MCIWNDM_GETFILENAMEW            : constant := 16#4e0#;
   MCIWNDM_GETDEVICEW              : constant := 16#4e1#;
   MCIWNDM_GETERRORW               : constant := 16#4e4#;
   MCIWNDM_NEWW                    : constant := 16#4ea#;
   MCIWNDM_RETURNSTRINGW           : constant := 16#4ee#;
   MCIWNDM_OPENW                   : constant := 16#4fc#;
   MCIWNDM_SENDSTRING              : constant := 16#465#;
   MCIWNDM_GETPOSITION             : constant := 16#466#;
   MCIWNDM_GETMODE                 : constant := 16#46a#;
   MCIWNDM_SETTIMEFORMAT           : constant := 16#477#;
   MCIWNDM_GETTIMEFORMAT           : constant := 16#478#;
   MCIWNDM_GETFILENAME             : constant := 16#47c#;
   MCIWNDM_GETDEVICE               : constant := 16#47d#;
   MCIWNDM_GETERROR                : constant := 16#480#;
   MCIWNDM_NEW                     : constant := 16#486#;
   MCIWNDM_RETURNSTRING            : constant := 16#48a#;
   MCIWNDM_OPEN                    : constant := 16#499#;
   MCIWNDM_NOTIFYMODE              : constant := 16#4c8#;
   MCIWNDM_NOTIFYPOS               : constant := 16#4c9#;
   MCIWNDM_NOTIFYSIZE              : constant := 16#4ca#;
   MCIWNDM_NOTIFYMEDIA             : constant := 16#4cb#;
   MCIWNDM_NOTIFYERROR             : constant := 16#4cd#;
   MCIWND_START                    : constant := -1;
   MCIWND_END                      : constant := -2;
   DV_ERR_OK                       : constant := 0;
   DV_ERR_BASE                     : constant := 1;
   DV_ERR_NONSPECIFIC              : constant := 1;
   DV_ERR_BADFORMAT                : constant := 2;
   DV_ERR_STILLPLAYING             : constant := 3;
   DV_ERR_UNPREPARED               : constant := 4;
   DV_ERR_SYNC                     : constant := 5;
   DV_ERR_TOOMANYCHANNELS          : constant := 6;
   DV_ERR_NOTDETECTED              : constant := 7;
   DV_ERR_BADINSTALL               : constant := 8;
   DV_ERR_CREATEPALETTE            : constant := 9;
   DV_ERR_SIZEFIELD                : constant := 10;
   DV_ERR_PARAM1                   : constant := 11;
   DV_ERR_PARAM2                   : constant := 12;
   DV_ERR_CONFIG1                  : constant := 13;
   DV_ERR_CONFIG2                  : constant := 14;
   DV_ERR_FLAGS                    : constant := 15;
   DV_ERR_13                       : constant := 16;
   DV_ERR_NOTSUPPORTED             : constant := 17;
   DV_ERR_NOMEM                    : constant := 18;
   DV_ERR_ALLOCATED                : constant := 19;
   DV_ERR_BADDEVICEID              : constant := 20;
   DV_ERR_INVALHANDLE              : constant := 21;
   DV_ERR_BADERRNUM                : constant := 22;
   DV_ERR_NO_BUFFERS               : constant := 23;
   DV_ERR_MEM_CONFLICT             : constant := 24;
   DV_ERR_IO_CONFLICT              : constant := 25;
   DV_ERR_DMA_CONFLICT             : constant := 26;
   DV_ERR_INT_CONFLICT             : constant := 27;
   DV_ERR_PROTECT_ONLY             : constant := 28;
   DV_ERR_LASTERROR                : constant := 28;
   DV_ERR_USER_MSG                 : constant := 1001;
   MM_DRVM_OPEN                    : constant := 16#3d0#;
   MM_DRVM_CLOSE                   : constant := 16#3d1#;
   MM_DRVM_DATA                    : constant := 16#3d2#;
   MM_DRVM_ERROR                   : constant := 16#3d3#;
   DV_VM_OPEN                      : constant := 16#3d0#;
   DV_VM_CLOSE                     : constant := 16#3d1#;
   DV_VM_DATA                      : constant := 16#3d2#;
   DV_VM_ERROR                     : constant := 16#3d3#;
   VHDR_DONE                       : constant := 16#1#;
   VHDR_PREPARED                   : constant := 16#2#;
   VHDR_INQUEUE                    : constant := 16#4#;
   VHDR_KEYFRAME                   : constant := 16#8#;
   VHDR_VALID                      : constant := 16#f#;
   VCAPS_OVERLAY                   : constant := 16#1#;
   VCAPS_SRC_CAN_CLIP              : constant := 16#2#;
   VCAPS_DST_CAN_CLIP              : constant := 16#4#;
   VCAPS_CAN_SCALE                 : constant := 16#8#;
   VIDEO_EXTERNALIN                : constant := 16#1#;
   VIDEO_EXTERNALOUT               : constant := 16#2#;
   VIDEO_IN                        : constant := 16#4#;
   VIDEO_OUT                       : constant := 16#8#;
   VIDEO_DLG_QUERY                 : constant := 16#10#;
   VIDEO_CONFIGURE_QUERY           : constant := 16#8000#;
   VIDEO_CONFIGURE_SET             : constant := 16#1000#;
   VIDEO_CONFIGURE_GET             : constant := 16#2000#;
   VIDEO_CONFIGURE_QUERYSIZE       : constant := 16#1#;
   VIDEO_CONFIGURE_CURRENT         : constant := 16#10#;
   VIDEO_CONFIGURE_NOMINAL         : constant := 16#20#;
   VIDEO_CONFIGURE_MIN             : constant := 16#40#;
   VIDEO_CONFIGURE_MAX             : constant := 16#80#;
   DVM_USER                        : constant := 16#4000#;
   DVM_CONFIGURE_START             : constant := 16#1000#;
   DVM_CONFIGURE_END               : constant := 16#1fff#;
   DVM_PALETTE                     : constant := 16#1001#;
   DVM_FORMAT                      : constant := 16#1002#;
   DVM_PALETTERGB555               : constant := 16#1003#;
   DVM_SRC_RECT                    : constant := 16#1004#;
   DVM_DST_RECT                    : constant := 16#1005#;
   WM_CAP_START                    : constant := 16#400#;
   WM_CAP_UNICODE_START            : constant := 16#464#;
   WM_CAP_GET_CAPSTREAMPTR         : constant := 16#401#;
   WM_CAP_SET_CALLBACK_ERRORW      : constant := 16#466#;
   WM_CAP_SET_CALLBACK_STATUSW     : constant := 16#467#;
   WM_CAP_SET_CALLBACK_ERRORA      : constant := 16#402#;
   WM_CAP_SET_CALLBACK_STATUSA     : constant := 16#403#;
   WM_CAP_SET_CALLBACK_ERROR       : constant := 16#402#;
   WM_CAP_SET_CALLBACK_STATUS      : constant := 16#403#;
   WM_CAP_SET_CALLBACK_YIELD       : constant := 16#404#;
   WM_CAP_SET_CALLBACK_FRAME       : constant := 16#405#;
   WM_CAP_SET_CALLBACK_VIDEOSTREAM : constant := 16#406#;
   WM_CAP_SET_CALLBACK_WAVESTREAM  : constant := 16#407#;
   WM_CAP_GET_USER_DATA            : constant := 16#408#;
   WM_CAP_SET_USER_DATA            : constant := 16#409#;
   WM_CAP_DRIVER_CONNECT           : constant := 16#40a#;
   WM_CAP_DRIVER_DISCONNECT        : constant := 16#40b#;
   WM_CAP_DRIVER_GET_NAMEA         : constant := 16#40c#;
   WM_CAP_DRIVER_GET_VERSIONA      : constant := 16#40d#;
   WM_CAP_DRIVER_GET_NAMEW         : constant := 16#470#;
   WM_CAP_DRIVER_GET_VERSIONW      : constant := 16#471#;
   WM_CAP_DRIVER_GET_NAME          : constant := 16#40c#;
   WM_CAP_DRIVER_GET_VERSION       : constant := 16#40d#;
   WM_CAP_DRIVER_GET_CAPS          : constant := 16#40e#;
   WM_CAP_FILE_SET_CAPTURE_FILEA   : constant := 16#414#;
   WM_CAP_FILE_GET_CAPTURE_FILEA   : constant := 16#415#;
   WM_CAP_FILE_SAVEASA             : constant := 16#417#;
   WM_CAP_FILE_SAVEDIBA            : constant := 16#419#;
   WM_CAP_FILE_SET_CAPTURE_FILEW   : constant := 16#478#;
   WM_CAP_FILE_GET_CAPTURE_FILEW   : constant := 16#479#;
   WM_CAP_FILE_SAVEASW             : constant := 16#47b#;
   WM_CAP_FILE_SAVEDIBW            : constant := 16#47d#;
   WM_CAP_FILE_SET_CAPTURE_FILE    : constant := 16#414#;
   WM_CAP_FILE_GET_CAPTURE_FILE    : constant := 16#415#;
   WM_CAP_FILE_SAVEAS              : constant := 16#417#;
   WM_CAP_FILE_SAVEDIB             : constant := 16#419#;
   WM_CAP_FILE_ALLOCATE            : constant := 16#416#;
   WM_CAP_FILE_SET_INFOCHUNK       : constant := 16#418#;
   WM_CAP_EDIT_COPY                : constant := 16#41e#;
   WM_CAP_SET_AUDIOFORMAT          : constant := 16#423#;
   WM_CAP_GET_AUDIOFORMAT          : constant := 16#424#;
   WM_CAP_DLG_VIDEOFORMAT          : constant := 16#429#;
   WM_CAP_DLG_VIDEOSOURCE          : constant := 16#42a#;
   WM_CAP_DLG_VIDEODISPLAY         : constant := 16#42b#;
   WM_CAP_GET_VIDEOFORMAT          : constant := 16#42c#;
   WM_CAP_SET_VIDEOFORMAT          : constant := 16#42d#;
   WM_CAP_DLG_VIDEOCOMPRESSION     : constant := 16#42e#;
   WM_CAP_SET_PREVIEW              : constant := 16#432#;
   WM_CAP_SET_OVERLAY              : constant := 16#433#;
   WM_CAP_SET_PREVIEWRATE          : constant := 16#434#;
   WM_CAP_SET_SCALE                : constant := 16#435#;
   WM_CAP_GET_STATUS               : constant := 16#436#;
   WM_CAP_SET_SCROLL               : constant := 16#437#;
   WM_CAP_GRAB_FRAME               : constant := 16#43c#;
   WM_CAP_GRAB_FRAME_NOSTOP        : constant := 16#43d#;
   WM_CAP_SEQUENCE                 : constant := 16#43e#;
   WM_CAP_SEQUENCE_NOFILE          : constant := 16#43f#;
   WM_CAP_SET_SEQUENCE_SETUP       : constant := 16#440#;
   WM_CAP_GET_SEQUENCE_SETUP       : constant := 16#441#;
   WM_CAP_SET_MCI_DEVICEA          : constant := 16#442#;
   WM_CAP_GET_MCI_DEVICEA          : constant := 16#443#;
   WM_CAP_SET_MCI_DEVICEW          : constant := 16#4a6#;
   WM_CAP_GET_MCI_DEVICEW          : constant := 16#4a7#;
   WM_CAP_SET_MCI_DEVICE           : constant := 16#442#;
   WM_CAP_GET_MCI_DEVICE           : constant := 16#443#;
   WM_CAP_STOP                     : constant := 16#444#;
   WM_CAP_ABORT                    : constant := 16#445#;
   WM_CAP_SINGLE_FRAME_OPEN        : constant := 16#446#;
   WM_CAP_SINGLE_FRAME_CLOSE       : constant := 16#447#;
   WM_CAP_SINGLE_FRAME             : constant := 16#448#;
   WM_CAP_PAL_OPENA                : constant := 16#450#;
   WM_CAP_PAL_SAVEA                : constant := 16#451#;
   WM_CAP_PAL_OPENW                : constant := 16#4b4#;
   WM_CAP_PAL_SAVEW                : constant := 16#4b5#;
   WM_CAP_PAL_OPEN                 : constant := 16#450#;
   WM_CAP_PAL_SAVE                 : constant := 16#451#;
   WM_CAP_PAL_PASTE                : constant := 16#452#;
   WM_CAP_PAL_AUTOCREATE           : constant := 16#453#;
   WM_CAP_PAL_MANUALCREATE         : constant := 16#454#;
   WM_CAP_SET_CALLBACK_CAPCONTROL  : constant := 16#455#;
   WM_CAP_UNICODE_END              : constant := 16#4b5#;
   WM_CAP_END                      : constant := 16#4b5#;
   CONTROLCALLBACK_PREROLL         : constant := 1;
   CONTROLCALLBACK_CAPTURING       : constant := 2;
   infotypeDIGITIZATION_TIME       : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'D', 'I', 'T');
   infotypeSMPTE_TIME              : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('I', 'S', 'M', 'P');
   IDS_CAP_BEGIN                   : constant := 300;
   IDS_CAP_END                     : constant := 301;
   IDS_CAP_INFO                    : constant := 401;
   IDS_CAP_OUTOFMEM                : constant := 402;
   IDS_CAP_FILEEXISTS              : constant := 403;
   IDS_CAP_ERRORPALOPEN            : constant := 404;
   IDS_CAP_ERRORPALSAVE            : constant := 405;
   IDS_CAP_ERRORDIBSAVE            : constant := 406;
   IDS_CAP_DEFAVIEXT               : constant := 407;
   IDS_CAP_DEFPALEXT               : constant := 408;
   IDS_CAP_CANTOPEN                : constant := 409;
   IDS_CAP_SEQ_MSGSTART            : constant := 410;
   IDS_CAP_SEQ_MSGSTOP             : constant := 411;
   IDS_CAP_VIDEDITERR              : constant := 412;
   IDS_CAP_READONLYFILE            : constant := 413;
   IDS_CAP_WRITEERROR              : constant := 414;
   IDS_CAP_NODISKSPACE             : constant := 415;
   IDS_CAP_SETFILESIZE             : constant := 416;
   IDS_CAP_SAVEASPERCENT           : constant := 417;
   IDS_CAP_DRIVER_ERROR            : constant := 418;
   IDS_CAP_WAVE_OPEN_ERROR         : constant := 419;
   IDS_CAP_WAVE_ALLOC_ERROR        : constant := 420;
   IDS_CAP_WAVE_PREPARE_ERROR      : constant := 421;
   IDS_CAP_WAVE_ADD_ERROR          : constant := 422;
   IDS_CAP_WAVE_SIZE_ERROR         : constant := 423;
   IDS_CAP_VIDEO_OPEN_ERROR        : constant := 424;
   IDS_CAP_VIDEO_ALLOC_ERROR       : constant := 425;
   IDS_CAP_VIDEO_PREPARE_ERROR     : constant := 426;
   IDS_CAP_VIDEO_ADD_ERROR         : constant := 427;
   IDS_CAP_VIDEO_SIZE_ERROR        : constant := 428;
   IDS_CAP_FILE_OPEN_ERROR         : constant := 429;
   IDS_CAP_FILE_WRITE_ERROR        : constant := 430;
   IDS_CAP_RECORDING_ERROR         : constant := 431;
   IDS_CAP_RECORDING_ERROR2        : constant := 432;
   IDS_CAP_AVI_INIT_ERROR          : constant := 433;
   IDS_CAP_NO_FRAME_CAP_ERROR      : constant := 434;
   IDS_CAP_NO_PALETTE_WARN         : constant := 435;
   IDS_CAP_MCI_CONTROL_ERROR       : constant := 436;
   IDS_CAP_MCI_CANT_STEP_ERROR     : constant := 437;
   IDS_CAP_NO_AUDIO_CAP_ERROR      : constant := 438;
   IDS_CAP_AVI_DRAWDIB_ERROR       : constant := 439;
   IDS_CAP_COMPRESSOR_ERROR        : constant := 440;
   IDS_CAP_AUDIO_DROP_ERROR        : constant := 441;
   IDS_CAP_STAT_LIVE_MODE          : constant := 500;
   IDS_CAP_STAT_OVERLAY_MODE       : constant := 501;
   IDS_CAP_STAT_CAP_INIT           : constant := 502;
   IDS_CAP_STAT_CAP_FINI           : constant := 503;
   IDS_CAP_STAT_PALETTE_BUILD      : constant := 504;
   IDS_CAP_STAT_OPTPAL_BUILD       : constant := 505;
   IDS_CAP_STAT_I_FRAMES           : constant := 506;
   IDS_CAP_STAT_L_FRAMES           : constant := 507;
   IDS_CAP_STAT_CAP_L_FRAMES       : constant := 508;
   IDS_CAP_STAT_CAP_AUDIO          : constant := 509;
   IDS_CAP_STAT_VIDEOCURRENT       : constant := 510;
   IDS_CAP_STAT_VIDEOAUDIO         : constant := 511;
   IDS_CAP_STAT_VIDEOONLY          : constant := 512;
   IDS_CAP_STAT_FRAMESDROPPED      : constant := 513;

   type TWOCC is new Win32.WORD;

   subtype HIC is Win32.Winnt.HANDLE;
   subtype HDRAWDIB is Win32.Winnt.HANDLE;
   subtype HVIDEO is Win32.Winnt.HANDLE;
   type LPHVIDEO is access all HVIDEO;

   type ICOPEN;
   type ICINFO;
   type ICCOMPRESS;
   type ICCOMPRESSFRAMES;
   type ICSETSTATUSPROC;
   type ICDECOMPRESS;
   type ICDECOMPRESSEX;
   type ICDRAWBEGIN;
   type ICDRAW;
   type ICDRAWSUGGEST;
   type ICPALETTE;
   type COMPVARS;
   type DRAWDIBTIME;
   type MainAVIHeader;
   type AVIStreamHeader;
   type AVIINDEXENTRY;
   type AVIPALCHANGE;
   type AVISTREAMINFOW;
   type AVISTREAMINFOA;
   type AVIFILEINFOW;
   type AVIFILEINFOA;
   type AVICOMPRESSOPTIONS;
   type IAVIStreamVtbl;
   type IAVIStream;
   type IAVIStreamingVtbl;
   type IAVIStreaming;
   type IAVIEditStreamVtbl;
   type IAVIEditStream;
   type IAVIFileVtbl;
   type IAVIFile;
   type IGetFrameVtbl;
   type IGetFrame;
   type VIDEOHDR;
   type CHANNEL_CAPS;
   type CAPDRIVERCAPS;
   type CAPSTATUS;
   type CAPTUREPARMS;
   type CAPINFOCHUNK;

   type PCOMPVARS is access all COMPVARS;
   type LPDRAWDIBTIME is access all DRAWDIBTIME;
   type LPAVISTREAMINFOW is access all AVISTREAMINFOW;
   type LPAVISTREAMINFOA is access all AVISTREAMINFOA;
   subtype LPAVISTREAMINFO is LPAVISTREAMINFOA;
   type LPAVIFILEINFOW is access all AVIFILEINFOW;
   type LPAVIFILEINFOA is access all AVIFILEINFOA;
   subtype LPAVIFILEINFO is LPAVIFILEINFOA;
   type LPAVICOMPRESSOPTIONS is access all AVICOMPRESSOPTIONS;
   type PAVISTREAM is access all IAVIStream;
   type PAVISTREAMING is access all IAVIStreaming;
   type PAVIEDITSTREAM is access all IAVIEditStream;
   type PAVIFILE is access all IAVIFile;
   type PGETFRAME is access all IGetFrame;
   type PVIDEOHDR is access all VIDEOHDR;
   subtype LPVIDEOHDR is PVIDEOHDR;
   type PCHANNEL_CAPS is access all CHANNEL_CAPS;
   subtype LPCHANNEL_CAPS is PCHANNEL_CAPS;
   type PCAPDRIVERCAPS is access all CAPDRIVERCAPS;
   subtype LPCAPDRIVERCAPS is PCAPDRIVERCAPS;
   type PCAPSTATUS is access all CAPSTATUS;
   subtype LPCAPSTATUS is PCAPSTATUS;
   type PCAPTUREPARMS is access all CAPTUREPARMS;
   subtype LPCAPTUREPARMS is PCAPTUREPARMS;
   type PCAPINFOCHUNK is access all CAPINFOCHUNK;
   subtype LPCAPINFOCHUNK is PCAPINFOCHUNK;

   type ac_IGetFrameVtbl_t is access all IGetFrameVtbl;
   type ac_IAVIFileVtbl_t is access all IAVIFileVtbl;
   type ac_IAVIEditStreamVtbl_t is access all IAVIEditStreamVtbl;
   type ac_IAVIStreamingVtbl_t is access all IAVIStreamingVtbl;
   type ac_IAVIStreamVtbl_t is access all IAVIStreamVtbl;

   type af_376_GetData is access function
     (lInput : Win32.LPARAM;
      lFrame : Win32.LONG;
      lpBits : Win32.LPVOID;
      len    : Win32.LONG)
      return Win32.LONG;
   pragma Convention (Stdcall, af_376_GetData);
   type af_377_PutData is access function
     (lOutput : Win32.LPARAM;
      lFrame  : Win32.LONG;
      lpBits  : Win32.LPVOID;
      len     : Win32.LONG)
      return Win32.LONG;
   pragma Convention (Stdcall, af_377_PutData);
   type af_392_Status is access function
     (lParam  : Win32.LPARAM;
      message : Win32.UINT;
      l       : Win32.LONG)
      return Win32.LONG;
   pragma Convention (Stdcall, af_392_Status);
   type af_1843_QueryInterface is access function
     (This   : access IAVIStream;
      riid   : access Win32.Objbase.IID;
      ppvObj : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1843_QueryInterface);
   type af_1844_AddRef is access function
     (This : access IAVIStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1844_AddRef);
   type af_1845_Release is access function
     (This : access IAVIStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1845_Release);
   type af_1848_Create is access function
     (This    : access IAVIStream;
      lParam1 : Win32.LPARAM;
      lParam2 : Win32.LPARAM)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1848_Create);
   type af_1849_Info is access function
     (This  : access IAVIStream;
      psi   : access AVISTREAMINFOW;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1849_Info);
   type af_1850_FindSample is access function
     (This   : access IAVIStream;
      lPos   : Win32.LONG;
      lFlags : Win32.LONG)
      return Win32.LONG;
   pragma Convention (Stdcall, af_1850_FindSample);
   type af_1851_ReadFormat is access function
     (This       : access IAVIStream;
      lPos       : Win32.LONG;
      lpFormat   : Win32.LPVOID;
      lpcbFormat : access Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1851_ReadFormat);
   type af_1853_SetFormat is access function
     (This     : access IAVIStream;
      lPos     : Win32.LONG;
      lpFormat : Win32.LPVOID;
      cbFormat : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1853_SetFormat);
   type af_1855_Read is access function
     (This      : access IAVIStream;
      lStart    : Win32.LONG;
      lSamples  : Win32.LONG;
      lpBuffer  : Win32.LPVOID;
      cbBuffer  : Win32.LONG;
      plBytes   : access Win32.LONG;
      plSamples : access Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1855_Read);
   type af_1858_Write is access function
     (This           : access IAVIStream;
      lStart         : Win32.LONG;
      lSamples       : Win32.LONG;
      lpBuffer       : Win32.LPVOID;
      cbBuffer       : Win32.LONG;
      dwFlags        : Win32.DWORD;
      plSampWritten  : access Win32.LONG;
      plBytesWritten : access Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1858_Write);
   type af_1863_Delete is access function
     (This     : access IAVIStream;
      lStart   : Win32.LONG;
      lSamples : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1863_Delete);
   type af_1864_ReadData is access function
     (This : access IAVIStream;
      fcc  : Win32.DWORD;
      lp   : Win32.LPVOID;
      lpcb : access Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1864_ReadData);
   type af_1865_WriteData is access function
     (This : access IAVIStream;
      fcc  : Win32.DWORD;
      lp   : Win32.LPVOID;
      cb   : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1865_WriteData);
   type af_1867_SetInfo is access function
     (This   : access IAVIStream;
      lpInfo : access AVISTREAMINFOW;
      cbInfo : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1867_SetInfo);
   type af_1887_QueryInterface is access function
     (This   : access IAVIStreaming;
      riid   : access Win32.Objbase.IID;
      ppvObj : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1887_QueryInterface);
   type af_1888_AddRef is access function
     (This : access IAVIStreaming)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1888_AddRef);
   type af_1889_Release is access function
     (This : access IAVIStreaming)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1889_Release);
   type af_1892_c_Begin is access function
     (This   : access IAVIStreaming;
      lStart : Win32.LONG;
      lEnd   : Win32.LONG;
      lRate  : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1892_c_Begin);
   type af_1897_c_End is access function
     (This : access IAVIStreaming)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1897_c_End);
   type af_1909_QueryInterface is access function
     (This   : access IAVIEditStream;
      riid   : access Win32.Objbase.IID;
      ppvObj : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1909_QueryInterface);
   type af_1910_AddRef is access function
     (This : access IAVIEditStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1910_AddRef);
   type af_1911_Release is access function
     (This : access IAVIEditStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1911_Release);
   type af_1914_Cut is access function
     (This     : access IAVIEditStream;
      plStart  : access Win32.LONG;
      plLength : access Win32.LONG;
      ppResult : access PAVISTREAM)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1914_Cut);
   type af_1917_Copy is access function
     (This     : access IAVIEditStream;
      plStart  : access Win32.LONG;
      plLength : access Win32.LONG;
      ppResult : access PAVISTREAM)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1917_Copy);
   type af_1920_Paste is access function
     (This     : access IAVIEditStream;
      plPos    : access Win32.LONG;
      plLength : access Win32.LONG;
      pstream  : PAVISTREAM;
      lStart   : Win32.LONG;
      lEnd     : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1920_Paste);
   type af_1925_Clone is access function
     (This     : access IAVIEditStream;
      ppResult : access PAVISTREAM)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1925_Clone);
   type af_1926_SetInfo is access function
     (This   : access IAVIEditStream;
      lpInfo : access AVISTREAMINFOW;
      cbInfo : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1926_SetInfo);
   type af_1943_QueryInterface is access function
     (This   : access IAVIFile;
      riid   : access Win32.Objbase.IID;
      ppvObj : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1943_QueryInterface);
   type af_1944_AddRef is access function
     (This : access IAVIFile)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1944_AddRef);
   type af_1945_Release is access function
     (This : access IAVIFile)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1945_Release);
   type af_1948_Info is access function
     (This  : access IAVIFile;
      pfi   : access AVIFILEINFOW;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1948_Info);
   type af_1951_GetStream is access function
     (This     : access IAVIFile;
      ppStream : access PAVISTREAM;
      fccType  : Win32.DWORD;
      lParam   : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1951_GetStream);
   type af_1955_CreateStream is access function
     (This     : access IAVIFile;
      ppStream : access PAVISTREAM;
      psi      : access AVISTREAMINFOW)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1955_CreateStream);
   type af_1958_WriteData is access function
     (This   : access IAVIFile;
      ckid   : Win32.DWORD;
      lpData : Win32.LPVOID;
      cbData : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1958_WriteData);
   type af_1962_ReadData is access function
     (This     : access IAVIFile;
      ckid     : Win32.DWORD;
      lpData   : Win32.LPVOID;
      lpcbData : access Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1962_ReadData);
   type af_1966_EndRecord is access function
     (This : access IAVIFile)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1966_EndRecord);
   type af_1967_DeleteStream is access function
     (This    : access IAVIFile;
      fccType : Win32.DWORD;
      lParam  : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1967_DeleteStream);
   type af_1984_QueryInterface is access function
     (This   : access IGetFrame;
      riid   : access Win32.Objbase.IID;
      ppvObj : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1984_QueryInterface);
   type af_1985_AddRef is access function
     (This : access IGetFrame)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1985_AddRef);
   type af_1986_Release is access function
     (This : access IGetFrame)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1986_Release);
   type af_1990_GetFrame is access function
     (This : access IGetFrame;
      lPos : Win32.LONG)
      return Win32.LPVOID;
   pragma Convention (Stdcall, af_1990_GetFrame);
   type af_1993_c_Begin is access function
     (This   : access IGetFrame;
      lStart : Win32.LONG;
      lEnd   : Win32.LONG;
      lRate  : Win32.LONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1993_c_Begin);
   type af_1994_c_End is access function
     (This : access IGetFrame)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1994_c_End);
   type af_1996_SetFormat is access function
     (This   : access IGetFrame;
      lpbi   : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpBits : Win32.LPVOID;
      x      : Win32.INT;
      y      : Win32.INT;
      dx     : Win32.INT;
      dy     : Win32.INT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1996_SetFormat);

   type ICOPEN is record
      dwSize     : Win32.DWORD;
      fccType    : Win32.DWORD;
      fccHandler : Win32.DWORD;
      dwVersion  : Win32.DWORD;
      dwFlags    : Win32.DWORD;
      dwError    : Win32.LRESULT;
   end record;

   type ICINFO is record
      dwSize        : Win32.DWORD;
      fccType       : Win32.DWORD;
      fccHandler    : Win32.DWORD;
      dwFlags       : Win32.DWORD;
      dwVersion     : Win32.DWORD;
      dwVersionICM  : Win32.DWORD;
      szName        : Win32.WCHAR_Array (0 .. 15);
      szDescription : Win32.WCHAR_Array (0 .. 127);
      szDriver      : Win32.WCHAR_Array (0 .. 127);
   end record;

   type ICCOMPRESS is record
      dwFlags     : Win32.DWORD;
      lpbiOutput  : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpOutput    : Win32.LPVOID;
      lpbiInput   : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpInput     : Win32.LPVOID;
      lpckid      : Win32.LPDWORD;
      lpdwFlags   : Win32.LPDWORD;
      lFrameNum   : Win32.LONG;
      dwFrameSize : Win32.DWORD;
      dwQuality   : Win32.DWORD;
      lpbiPrev    : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpPrev      : Win32.LPVOID;
   end record;

   type ICCOMPRESSFRAMES is record
      dwFlags            : Win32.DWORD;
      lpbiOutput         : Win32.Wingdi.LPBITMAPINFOHEADER;
      lOutput            : Win32.LPARAM;
      lpbiInput          : Win32.Wingdi.LPBITMAPINFOHEADER;
      lInput             : Win32.LPARAM;
      lStartFrame        : Win32.LONG;
      lFrameCount        : Win32.LONG;
      lQuality           : Win32.LONG;
      lDataRate          : Win32.LONG;
      lKeyRate           : Win32.LONG;
      dwRate             : Win32.DWORD;
      dwScale            : Win32.DWORD;
      dwOverheadPerFrame : Win32.DWORD;
      dwReserved2        : Win32.DWORD;
      GetData            : af_376_GetData;
      PutData            : af_377_PutData;
   end record;

   type ICSETSTATUSPROC is record
      dwFlags : Win32.DWORD;
      lParam  : Win32.LPARAM;
      Status  : af_392_Status;
   end record;

   type ICDECOMPRESS is record
      dwFlags    : Win32.DWORD;
      lpbiInput  : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpInput    : Win32.LPVOID;
      lpbiOutput : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpOutput   : Win32.LPVOID;
      ckid       : Win32.DWORD;
   end record;

   type ICDECOMPRESSEX is record
      dwFlags : Win32.DWORD;
      lpbiSrc : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpSrc   : Win32.LPVOID;
      lpbiDst : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpDst   : Win32.LPVOID;
      xDst    : Win32.INT;
      yDst    : Win32.INT;
      dxDst   : Win32.INT;
      dyDst   : Win32.INT;
      xSrc    : Win32.INT;
      ySrc    : Win32.INT;
      dxSrc   : Win32.INT;
      dySrc   : Win32.INT;
   end record;

   type ICDRAWBEGIN is record
      dwFlags : Win32.DWORD;
      hpal    : Win32.Windef.HPALETTE;
      hwnd    : Win32.Windef.HWND;
      hdc     : Win32.Windef.HDC;
      xDst    : Win32.INT;
      yDst    : Win32.INT;
      dxDst   : Win32.INT;
      dyDst   : Win32.INT;
      lpbi    : Win32.Wingdi.LPBITMAPINFOHEADER;
      xSrc    : Win32.INT;
      ySrc    : Win32.INT;
      dxSrc   : Win32.INT;
      dySrc   : Win32.INT;
      dwRate  : Win32.DWORD;
      dwScale : Win32.DWORD;
   end record;

   type ICDRAW is record
      dwFlags  : Win32.DWORD;
      lpFormat : Win32.LPVOID;
      lpData   : Win32.LPVOID;
      cbData   : Win32.DWORD;
      lTime    : Win32.LONG;
   end record;

   type ICDRAWSUGGEST is record
      lpbiIn          : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpbiSuggest     : Win32.Wingdi.LPBITMAPINFOHEADER;
      dxSrc           : Win32.INT;
      dySrc           : Win32.INT;
      dxDst           : Win32.INT;
      dyDst           : Win32.INT;
      hicDecompressor : HIC;
   end record;

   type ICPALETTE is record
      dwFlags : Win32.DWORD;
      iStart  : Win32.INT;
      iLen    : Win32.INT;
      lppe    : Win32.Wingdi.LPPALETTEENTRY;
   end record;

   type COMPVARS is record
      cbSize     : Win32.LONG;
      dwFlags    : Win32.DWORD;
      hic        : Win32.Vfw.HIC;
      fccType    : Win32.DWORD;
      fccHandler : Win32.DWORD;
      lpbiIn     : Win32.Wingdi.LPBITMAPINFO;
      lpbiOut    : Win32.Wingdi.LPBITMAPINFO;
      lpBitsOut  : Win32.LPVOID;
      lpBitsPrev : Win32.LPVOID;
      lFrame     : Win32.LONG;
      lKey       : Win32.LONG;
      lDataRate  : Win32.LONG;
      lQ         : Win32.LONG;
      lKeyCount  : Win32.LONG;
      lpState    : Win32.LPVOID;
      cbState    : Win32.LONG;
   end record;

   type DRAWDIBTIME is record
      timeCount      : Win32.LONG;
      timeDraw       : Win32.LONG;
      timeDecompress : Win32.LONG;
      timeDither     : Win32.LONG;
      timeStretch    : Win32.LONG;
      timeBlt        : Win32.LONG;
      timeSetDIBits  : Win32.LONG;
   end record;

   type MainAVIHeader is record
      dwMicroSecPerFrame    : Win32.DWORD;
      dwMaxBytesPerSec      : Win32.DWORD;
      dwPaddingGranularity  : Win32.DWORD;
      dwFlags               : Win32.DWORD;
      dwTotalFrames         : Win32.DWORD;
      dwInitialFrames       : Win32.DWORD;
      dwStreams             : Win32.DWORD;
      dwSuggestedBufferSize : Win32.DWORD;
      dwWidth               : Win32.DWORD;
      dwHeight              : Win32.DWORD;
      dwReserved            : Win32.DWORD_Array (0 .. 3);
   end record;

   type AVIStreamHeader is record
      fccType               : Win32.Mmsystem.FOURCC;
      fccHandler            : Win32.Mmsystem.FOURCC;
      dwFlags               : Win32.DWORD;
      wPriority             : Win32.WORD;
      wLanguage             : Win32.WORD;
      dwInitialFrames       : Win32.DWORD;
      dwScale               : Win32.DWORD;
      dwRate                : Win32.DWORD;
      dwStart               : Win32.DWORD;
      dwLength              : Win32.DWORD;
      dwSuggestedBufferSize : Win32.DWORD;
      dwQuality             : Win32.DWORD;
      dwSampleSize          : Win32.DWORD;
      rcFrame               : Win32.Windef.RECT;
   end record;

   type AVIINDEXENTRY is record
      ckid          : Win32.DWORD;
      dwFlags       : Win32.DWORD;
      dwChunkOffset : Win32.DWORD;
      dwChunkLength : Win32.DWORD;
   end record;

   type PALETTEENTRY_Array is
     array (Natural range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased Win32.Wingdi.PALETTEENTRY;

   type AVIPALCHANGE is record
      bFirstEntry : Win32.BYTE;
      bNumEntries : Win32.BYTE;
      wFlags      : Win32.WORD;
      peNew       : PALETTEENTRY_Array;
   end record;

   type AVISTREAMINFOW is record
      fccType               : Win32.DWORD;
      fccHandler            : Win32.DWORD;
      dwFlags               : Win32.DWORD;
      dwCaps                : Win32.DWORD;
      wPriority             : Win32.WORD;
      wLanguage             : Win32.WORD;
      dwScale               : Win32.DWORD;
      dwRate                : Win32.DWORD;
      dwStart               : Win32.DWORD;
      dwLength              : Win32.DWORD;
      dwInitialFrames       : Win32.DWORD;
      dwSuggestedBufferSize : Win32.DWORD;
      dwQuality             : Win32.DWORD;
      dwSampleSize          : Win32.DWORD;
      rcFrame               : Win32.Windef.RECT;
      dwEditCount           : Win32.DWORD;
      dwFormatChangeCount   : Win32.DWORD;
      szName                : Win32.WCHAR_Array (0 .. 63);
   end record;

   type AVISTREAMINFOA is record
      fccType               : Win32.DWORD;
      fccHandler            : Win32.DWORD;
      dwFlags               : Win32.DWORD;
      dwCaps                : Win32.DWORD;
      wPriority             : Win32.WORD;
      wLanguage             : Win32.WORD;
      dwScale               : Win32.DWORD;
      dwRate                : Win32.DWORD;
      dwStart               : Win32.DWORD;
      dwLength              : Win32.DWORD;
      dwInitialFrames       : Win32.DWORD;
      dwSuggestedBufferSize : Win32.DWORD;
      dwQuality             : Win32.DWORD;
      dwSampleSize          : Win32.DWORD;
      rcFrame               : Win32.Windef.RECT;
      dwEditCount           : Win32.DWORD;
      dwFormatChangeCount   : Win32.DWORD;
      szName                : Win32.CHAR_Array (0 .. 63);
   end record;

   subtype AVISTREAMINFO is AVISTREAMINFOA;

   type AVIFILEINFOW is record
      dwMaxBytesPerSec      : Win32.DWORD;
      dwFlags               : Win32.DWORD;
      dwCaps                : Win32.DWORD;
      dwStreams             : Win32.DWORD;
      dwSuggestedBufferSize : Win32.DWORD;
      dwWidth               : Win32.DWORD;
      dwHeight              : Win32.DWORD;
      dwScale               : Win32.DWORD;
      dwRate                : Win32.DWORD;
      dwLength              : Win32.DWORD;
      dwEditCount           : Win32.DWORD;
      szFileType            : Win32.WCHAR_Array (0 .. 63);
   end record;

   type AVIFILEINFOA is record
      dwMaxBytesPerSec      : Win32.DWORD;
      dwFlags               : Win32.DWORD;
      dwCaps                : Win32.DWORD;
      dwStreams             : Win32.DWORD;
      dwSuggestedBufferSize : Win32.DWORD;
      dwWidth               : Win32.DWORD;
      dwHeight              : Win32.DWORD;
      dwScale               : Win32.DWORD;
      dwRate                : Win32.DWORD;
      dwLength              : Win32.DWORD;
      dwEditCount           : Win32.DWORD;
      szFileType            : Win32.CHAR_Array (0 .. 63);
   end record;

   subtype AVIFILEINFO is AVIFILEINFOA;

   type AVISAVECALLBACK is access function
     (p1   : Win32.INT)
      return Win32.BOOL;
   pragma Convention (Stdcall, AVISAVECALLBACK);

   type AVICOMPRESSOPTIONS is record
      fccType           : Win32.DWORD;
      fccHandler        : Win32.DWORD;
      dwKeyFrameEvery   : Win32.DWORD;
      dwQuality         : Win32.DWORD;
      dwBytesPerSecond  : Win32.DWORD;
      dwFlags           : Win32.DWORD;
      lpFormat          : Win32.LPVOID;
      cbFormat          : Win32.DWORD;
      lpParms           : Win32.LPVOID;
      cbParms           : Win32.DWORD;
      dwInterleaveEvery : Win32.DWORD;
   end record;

   type IAVIStreamVtbl is record
      QueryInterface : af_1843_QueryInterface;
      AddRef         : af_1844_AddRef;
      Release        : af_1845_Release;
      Create         : af_1848_Create;
      Info           : af_1849_Info;
      FindSample     : af_1850_FindSample;
      ReadFormat     : af_1851_ReadFormat;
      SetFormat      : af_1853_SetFormat;
      Read           : af_1855_Read;
      Write          : af_1858_Write;
      Delete         : af_1863_Delete;
      ReadData       : af_1864_ReadData;
      WriteData      : af_1865_WriteData;
      SetInfo        : af_1867_SetInfo;
   end record;

   type IAVIStream is record
      lpVtbl : ac_IAVIStreamVtbl_t;
   end record;

   type IAVIStreamingVtbl is record
      QueryInterface : af_1887_QueryInterface;
      AddRef         : af_1888_AddRef;
      Release        : af_1889_Release;
      c_Begin        : af_1892_c_Begin;
      c_End          : af_1897_c_End;
   end record;

   type IAVIStreaming is record
      lpVtbl : ac_IAVIStreamingVtbl_t;
   end record;

   type IAVIEditStreamVtbl is record
      QueryInterface : af_1909_QueryInterface;
      AddRef         : af_1910_AddRef;
      Release        : af_1911_Release;
      Cut            : af_1914_Cut;
      Copy           : af_1917_Copy;
      Paste          : af_1920_Paste;
      Clone          : af_1925_Clone;
      SetInfo        : af_1926_SetInfo;
   end record;

   type IAVIEditStream is record
      lpVtbl : ac_IAVIEditStreamVtbl_t;
   end record;

   type IAVIFileVtbl is record
      QueryInterface : af_1943_QueryInterface;
      AddRef         : af_1944_AddRef;
      Release        : af_1945_Release;
      Info           : af_1948_Info;
      GetStream      : af_1951_GetStream;
      CreateStream   : af_1955_CreateStream;
      WriteData      : af_1958_WriteData;
      ReadData       : af_1962_ReadData;
      EndRecord      : af_1966_EndRecord;
      DeleteStream   : af_1967_DeleteStream;
   end record;

   type IAVIFile is record
      lpVtbl : ac_IAVIFileVtbl_t;
   end record;

   type IGetFrameVtbl is record
      QueryInterface : af_1984_QueryInterface;
      AddRef         : af_1985_AddRef;
      Release        : af_1986_Release;
      GetFrame       : af_1990_GetFrame;
      c_Begin        : af_1993_c_Begin;
      c_End          : af_1994_c_End;
      SetFormat      : af_1996_SetFormat;
   end record;

   type IGetFrame is record
      lpVtbl : ac_IGetFrameVtbl_t;
   end record;

   type VIDEOHDR is record
      lpData         : Win32.LPBYTE;
      dwBufferLength : Win32.DWORD;
      dwBytesUsed    : Win32.DWORD;
      dwTimeCaptured : Win32.DWORD;
      dwUser         : Win32.DWORD;
      dwFlags        : Win32.DWORD;
      dwReserved     : Win32.DWORD_Array (0 .. 3);
   end record;

   type CHANNEL_CAPS is record
      dwFlags            : Win32.DWORD;
      dwSrcRectXMod      : Win32.DWORD;
      dwSrcRectYMod      : Win32.DWORD;
      dwSrcRectWidthMod  : Win32.DWORD;
      dwSrcRectHeightMod : Win32.DWORD;
      dwDstRectXMod      : Win32.DWORD;
      dwDstRectYMod      : Win32.DWORD;
      dwDstRectWidthMod  : Win32.DWORD;
      dwDstRectHeightMod : Win32.DWORD;
   end record;

   type CAPDRIVERCAPS is record
      wDeviceIndex            : Win32.UINT;
      fHasOverlay             : Win32.BOOL;
      fHasDlgVideoSource      : Win32.BOOL;
      fHasDlgVideoFormat      : Win32.BOOL;
      fHasDlgVideoDisplay     : Win32.BOOL;
      fCaptureInitialized     : Win32.BOOL;
      fDriverSuppliesPalettes : Win32.BOOL;
      hVideoIn                : Win32.Winnt.HANDLE;
      hVideoOut               : Win32.Winnt.HANDLE;
      hVideoExtIn             : Win32.Winnt.HANDLE;
      hVideoExtOut            : Win32.Winnt.HANDLE;
   end record;

   type CAPSTATUS is record
      uiImageWidth                : Win32.UINT;
      uiImageHeight               : Win32.UINT;
      fLiveWindow                 : Win32.BOOL;
      fOverlayWindow              : Win32.BOOL;
      fScale                      : Win32.BOOL;
      ptScroll                    : Win32.Windef.POINT;
      fUsingDefaultPalette        : Win32.BOOL;
      fAudioHardware              : Win32.BOOL;
      fCapFileExists              : Win32.BOOL;
      dwCurrentVideoFrame         : Win32.DWORD;
      dwCurrentVideoFramesDropped : Win32.DWORD;
      dwCurrentWaveSamples        : Win32.DWORD;
      dwCurrentTimeElapsedMS      : Win32.DWORD;
      hPalCurrent                 : Win32.Windef.HPALETTE;
      fCapturingNow               : Win32.BOOL;
      dwReturn                    : Win32.DWORD;
      wNumVideoAllocated          : Win32.UINT;
      wNumAudioAllocated          : Win32.UINT;
   end record;

   type CAPTUREPARMS is record
      dwRequestMicroSecPerFrame : Win32.DWORD;
      fMakeUserHitOKToCapture   : Win32.BOOL;
      wPercentDropForError      : Win32.UINT;
      fYield                    : Win32.BOOL;
      dwIndexSize               : Win32.DWORD;
      wChunkGranularity         : Win32.UINT;
      fUsingDOSMemory           : Win32.BOOL;
      wNumVideoRequested        : Win32.UINT;
      fCaptureAudio             : Win32.BOOL;
      wNumAudioRequested        : Win32.UINT;
      vKeyAbort                 : Win32.UINT;
      fAbortLeftMouse           : Win32.BOOL;
      fAbortRightMouse          : Win32.BOOL;
      fLimitEnabled             : Win32.BOOL;
      wTimeLimit                : Win32.UINT;
      fMCIControl               : Win32.BOOL;
      fStepMCIDevice            : Win32.BOOL;
      dwMCIStartTime            : Win32.DWORD;
      dwMCIStopTime             : Win32.DWORD;
      fStepCaptureAt2x          : Win32.BOOL;
      wStepCaptureAverageFrames : Win32.UINT;
      dwAudioBufferSize         : Win32.DWORD;
      fDisableWriteCache        : Win32.BOOL;
   end record;

   type CAPINFOCHUNK is record
      fccInfoID : Win32.Mmsystem.FOURCC;
      lpData    : Win32.LPVOID;
      cbData    : Win32.LONG;
   end record;

   type CAPYIELDCALLBACK is access function
     (hWnd : Win32.Windef.HWND)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPYIELDCALLBACK);
   type CAPSTATUSCALLBACKW is access function
     (hWnd : Win32.Windef.HWND;
      nID  : Win32.INT;
      lpsz : Win32.LPCWSTR)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPSTATUSCALLBACKW);
   type CAPERRORCALLBACKW is access function
     (hWnd : Win32.Windef.HWND;
      nID  : Win32.INT;
      lpsz : Win32.LPCWSTR)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPERRORCALLBACKW);
   type CAPSTATUSCALLBACKA is access function
     (hWnd : Win32.Windef.HWND;
      nID  : Win32.INT;
      lpsz : Win32.LPCSTR)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPSTATUSCALLBACKA);
   subtype CAPSTATUSCALLBACK is CAPSTATUSCALLBACKA;
   type CAPERRORCALLBACKA is access function
     (hWnd : Win32.Windef.HWND;
      nID  : Win32.INT;
      lpsz : Win32.LPCSTR)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPERRORCALLBACKA);
   subtype CAPERRORCALLBACK is CAPERRORCALLBACKA;
   type CAPVIDEOCALLBACK is access function
     (hWnd   : Win32.Windef.HWND;
      lpVHdr : LPVIDEOHDR)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPVIDEOCALLBACK);
   type CAPWAVECALLBACK is access function
     (hWnd   : Win32.Windef.HWND;
      lpWHdr : Win32.Mmsystem.LPWAVEHDR)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPWAVECALLBACK);
   type CAPCONTROLCALLBACK is access function
     (hWnd   : Win32.Windef.HWND;
      nState : Win32.INT)
      return Win32.LRESULT;
   pragma Convention (Stdcall, CAPCONTROLCALLBACK);

   IID_IAVIFile             : Win32.Rpcdce.GUID;
   IID_IAVIStream           : Win32.Rpcdce.GUID;
   IID_IAVIStreaming        : Win32.Rpcdce.GUID;
   IID_IGetFrame            : Win32.Rpcdce.GUID;
   IID_IAVIEditStream       : Win32.Rpcdce.GUID;
   CLSID_AVISimpleUnMarshal : Win32.Rpcdce.GUID;

   function VideoForWindowsVersion return Win32.DWORD;

   function InitVFW return Win32.LONG;

   function TermVFW return Win32.LONG;

   function MKFOURCC
     (ch0  : Win32.CHAR;
      ch1  : Win32.CHAR;
      ch2  : Win32.CHAR;
      ch3  : Win32.CHAR)
      return Win32.Mmsystem.FOURCC;

   function aviTWOCC (ch0 : Win32.CHAR; ch1 : Win32.CHAR) return TWOCC;
   pragma Inline (aviTWOCC);

   function ICInfo_func
     (fccType    : Win32.DWORD;
      fccHandler : Win32.DWORD;
      lpicinfo   : access ICINFO)
      return Win32.BOOL;

   function ICInstall
     (fccType    : Win32.DWORD;
      fccHandler : Win32.DWORD;
      lParam     : Win32.LPARAM;
      szDesc     : Win32.LPSTR;
      wFlags     : Win32.UINT)
      return Win32.BOOL;

   function ICRemove
     (fccType    : Win32.DWORD;
      fccHandler : Win32.DWORD;
      wFlags     : Win32.UINT)
      return Win32.BOOL;

   function ICGetInfo
     (hic     : Win32.Vfw.HIC;
      picinfo : access ICINFO;
      cb      : Win32.DWORD)
      return Win32.LRESULT;

   function ICOpen_func
     (fccType    : Win32.DWORD;
      fccHandler : Win32.DWORD;
      wMode      : Win32.UINT)
      return HIC;

   function ICOpenFunction
     (fccType     : Win32.DWORD;
      fccHandler  : Win32.DWORD;
      wMode       : Win32.UINT;
      lpfnHandler : Win32.Windef.FARPROC)
      return HIC;

   function ICClose (hic : Win32.Vfw.HIC) return Win32.LRESULT;

   function ICSendMessage
     (hic  : Win32.Vfw.HIC;
      msg  : Win32.UINT;
      dw1  : Win32.DWORD;
      dw2  : Win32.DWORD)
      return Win32.LRESULT;

   function ICCompress_func
     (hic         : Win32.Vfw.HIC;
      dwFlags     : Win32.DWORD;
      lpbiOutput  : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpData      : Win32.LPVOID;
      lpbiInput   : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpBits      : Win32.LPVOID;
      lpckid      : Win32.LPDWORD;
      lpdwFlags   : Win32.LPDWORD;
      lFrameNum   : Win32.LONG;
      dwFrameSize : Win32.DWORD;
      dwQuality   : Win32.DWORD;
      lpbiPrev    : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpPrev      : Win32.LPVOID)
      return Win32.DWORD;

   function ICDecompress_func
     (hic        : Win32.Vfw.HIC;
      dwFlags    : Win32.DWORD;
      lpbiFormat : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpData     : Win32.LPVOID;
      lpbi       : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpBits     : Win32.LPVOID)
      return Win32.DWORD;

   function ICDrawBegin_func
     (hic     : Win32.Vfw.HIC;
      dwFlags : Win32.DWORD;
      hpal    : Win32.Windef.HPALETTE;
      hwnd    : Win32.Windef.HWND;
      hdc     : Win32.Windef.HDC;
      xDst    : Win32.INT;
      yDst    : Win32.INT;
      dxDst   : Win32.INT;
      dyDst   : Win32.INT;
      lpbi    : Win32.Wingdi.LPBITMAPINFOHEADER;
      xSrc    : Win32.INT;
      ySrc    : Win32.INT;
      dxSrc   : Win32.INT;
      dySrc   : Win32.INT;
      dwRate  : Win32.DWORD;
      dwScale : Win32.DWORD)
      return Win32.DWORD;

   function ICDraw_func
     (hic      : Win32.Vfw.HIC;
      dwFlags  : Win32.DWORD;
      lpFormat : Win32.LPVOID;
      lpData   : Win32.LPVOID;
      cbData   : Win32.DWORD;
      lTime    : Win32.LONG)
      return Win32.DWORD;

   function ICLocate
     (fccType    : Win32.DWORD;
      fccHandler : Win32.DWORD;
      lpbiIn     : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpbiOut    : Win32.Wingdi.LPBITMAPINFOHEADER;
      wFlags     : Win32.WORD)
      return HIC;

   function ICGetDisplayFormat
     (hic      : Win32.Vfw.HIC;
      lpbiIn   : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpbiOut  : Win32.Wingdi.LPBITMAPINFOHEADER;
      BitDepth : Win32.INT;
      dx       : Win32.INT;
      dy       : Win32.INT)
      return Win32.Vfw.HIC;

   function ICImageCompress
     (hic      : Win32.Vfw.HIC;
      uiFlags  : Win32.UINT;
      lpbiIn   : Win32.Wingdi.LPBITMAPINFO;
      lpBits   : Win32.LPVOID;
      lpbiOut  : Win32.Wingdi.LPBITMAPINFO;
      lQuality : Win32.LONG;
      plSize   : access Win32.LONG)
      return Win32.Winnt.HANDLE;

   function ICImageDecompress
     (hic     : Win32.Vfw.HIC;
      uiFlags : Win32.UINT;
      lpbiIn  : Win32.Wingdi.LPBITMAPINFO;
      lpBits  : Win32.LPVOID;
      lpbiOut : Win32.Wingdi.LPBITMAPINFO)
      return Win32.Winnt.HANDLE;

   function ICCompressorChoose
     (hwnd      : Win32.Windef.HWND;
      uiFlags   : Win32.UINT;
      pvIn      : Win32.LPVOID;
      lpData    : Win32.LPVOID;
      pc        : PCOMPVARS;
      lpszTitle : Win32.LPSTR)
      return Win32.BOOL;

   function ICSeqCompressFrameStart
     (pc     : PCOMPVARS;
      lpbiIn : Win32.Wingdi.LPBITMAPINFO)
      return Win32.BOOL;

   procedure ICSeqCompressFrameEnd (pc : PCOMPVARS);

   function ICSeqCompressFrame
     (pc      : PCOMPVARS;
      uiFlags : Win32.UINT;
      lpBits  : Win32.LPVOID;
      pfKey   : access Win32.BOOL;
      plSize  : access Win32.LONG)
      return Win32.LPVOID;

   procedure ICCompressorFree (pc : PCOMPVARS);

   function DrawDibInit return Win32.BOOL;

   function DrawDibOpen return HDRAWDIB;

   function DrawDibClose (hdd : HDRAWDIB) return Win32.BOOL;

   function DrawDibGetBuffer
     (hdd     : HDRAWDIB;
      lpbi    : Win32.Wingdi.LPBITMAPINFOHEADER;
      dwSize  : Win32.DWORD;
      dwFlags : Win32.DWORD)
      return Win32.LPVOID;

   function DrawDibError (hdd : HDRAWDIB) return Win32.UINT;

   function DrawDibGetPalette (hdd : HDRAWDIB) return Win32.Windef.HPALETTE;

   function DrawDibSetPalette
     (hdd  : HDRAWDIB;
      hpal : Win32.Windef.HPALETTE)
      return Win32.BOOL;

   function DrawDibChangePalette
     (hdd    : HDRAWDIB;
      iStart : Win32.INT;
      iLen   : Win32.INT;
      lppe   : Win32.Wingdi.LPPALETTEENTRY)
      return Win32.BOOL;

   function DrawDibRealize
     (hdd         : HDRAWDIB;
      hdc         : Win32.Windef.HDC;
      fBackground : Win32.BOOL)
      return Win32.UINT;

   function DrawDibStart
     (hdd  : HDRAWDIB;
      rate : Win32.DWORD)
      return Win32.BOOL;

   function DrawDibStop (hdd : HDRAWDIB) return Win32.BOOL;

   function DrawDibBegin
     (hdd    : HDRAWDIB;
      hdc    : Win32.Windef.HDC;
      dxDst  : Win32.INT;
      dyDst  : Win32.INT;
      lpbi   : Win32.Wingdi.LPBITMAPINFOHEADER;
      dxSrc  : Win32.INT;
      dySrc  : Win32.INT;
      wFlags : Win32.UINT)
      return Win32.BOOL;

   function DrawDibDraw
     (hdd    : HDRAWDIB;
      hdc    : Win32.Windef.HDC;
      xDst   : Win32.INT;
      yDst   : Win32.INT;
      dxDst  : Win32.INT;
      dyDst  : Win32.INT;
      lpbi   : Win32.Wingdi.LPBITMAPINFOHEADER;
      lpBits : Win32.LPVOID;
      xSrc   : Win32.INT;
      ySrc   : Win32.INT;
      dxSrc  : Win32.INT;
      dySrc  : Win32.INT;
      wFlags : Win32.UINT)
      return Win32.BOOL;

   function DrawDibUpdate
     (hdd  : HDRAWDIB;
      hdc  : Win32.Windef.HDC;
      x    : Win32.INT;
      y    : Win32.INT)
      return Win32.BOOL;

   function DrawDibEnd (hdd : HDRAWDIB) return Win32.BOOL;

   function DrawDibTime_func
     (hdd      : HDRAWDIB;
      lpddtime : LPDRAWDIBTIME)
      return Win32.BOOL;

   function DrawDibProfileDisplay
     (lpbi : Win32.Wingdi.LPBITMAPINFOHEADER)
      return Win32.DWORD;

   function FromHex (n : Win32.BYTE) return Win32.BYTE;

   function StreamFromFOURCC
     (fcc  : Win32.Mmsystem.FOURCC)
      return Win32.WORD;

   function TWOCCFromFOURCC (fcc : Win32.Mmsystem.FOURCC) return TWOCC;

   function ToHex (n : Win32.BYTE) return Win32.BYTE;

   function MAKEAVICKID
     (tcc    : TWOCC;
      stream : Win32.USHORT)
      return Win32.DWORD;

   procedure AVIFileInit;

   procedure AVIStreamInit renames AVIFileInit;

   procedure AVIFileExit;

   procedure AVIStreamExit renames AVIFileExit;

   function AVIFileAddRef (pfile : PAVIFILE) return Win32.ULONG;

   function AVIFileRelease (pfile : PAVIFILE) return Win32.ULONG;

   function AVIFileClose (pfile : PAVIFILE) return Win32.ULONG renames
     AVIFileRelease;

   function AVIFileOpenA
     (ppfile    : access PAVIFILE;
      szFile    : Win32.LPCSTR;
      uMode     : Win32.UINT;
      lpHandler : Win32.Objbase.LPCLSID)
      return Win32.Objbase.HRESULT;

   function AVIFileOpenW
     (ppfile    : access PAVIFILE;
      szFile    : Win32.LPCWSTR;
      uMode     : Win32.UINT;
      lpHandler : Win32.Objbase.LPCLSID)
      return Win32.Objbase.HRESULT;

   function AVIFileOpen
     (ppfile    : access PAVIFILE;
      szFile    : Win32.LPCSTR;
      uMode     : Win32.UINT;
      lpHandler : Win32.Objbase.LPCLSID)
      return Win32.Objbase.HRESULT renames AVIFileOpenA;

   function AVIFileInfoW_func
     (pfile : PAVIFILE;
      pfi   : LPAVIFILEINFOW;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIFileInfoA_func
     (pfile : PAVIFILE;
      pfi   : LPAVIFILEINFOA;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIFileInfo_func
     (pfile : PAVIFILE;
      pfi   : LPAVIFILEINFOA;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT renames AVIFileInfoA_func;

   function AVIFileGetStream
     (pfile   : PAVIFILE;
      ppavi   : access PAVISTREAM;
      fccType : Win32.DWORD;
      lParam  : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIFileCreateStream
     (pfile : PAVIFILE;
      ppavi : access PAVISTREAM;
      psi   : access AVISTREAMINFOW)
      return Win32.Objbase.HRESULT;

   function AVIFileWriteData
     (pfile  : PAVIFILE;
      ckid   : Win32.DWORD;
      lpData : Win32.LPVOID;
      cbData : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIFileReadData
     (pfile    : PAVIFILE;
      ckid     : Win32.DWORD;
      lpData   : Win32.LPVOID;
      lpcbData : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIFileEndRecord
     (pfile : PAVIFILE)
      return Win32.Objbase.HRESULT;

   function AVIStreamAddRef (pavi : PAVISTREAM) return Win32.ULONG;

   function AVIStreamRelease (pavi : PAVISTREAM) return Win32.ULONG;

   function AVIStreamClose (pavi : PAVISTREAM) return Win32.ULONG renames
     AVIStreamRelease;

   function AVIStreamInfoW_func
     (pavi  : PAVISTREAM;
      psi   : LPAVISTREAMINFOW;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamInfoA_func
     (pavi  : PAVISTREAM;
      psi   : LPAVISTREAMINFOA;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamInfo_func
     (pavi  : PAVISTREAM;
      psi   : LPAVISTREAMINFOA;
      lSize : Win32.LONG)
      return Win32.Objbase.HRESULT renames AVIStreamInfoA_func;

   function AVIStreamFindSample
     (pavi   : PAVISTREAM;
      lPos   : Win32.LONG;
      lFlags : Win32.LONG)
      return Win32.LONG;

   function AVIStreamFindKeyFrame
     (pavi   : PAVISTREAM;
      lPos   : Win32.LONG;
      lFlags : Win32.LONG)
      return Win32.LONG renames AVIStreamFindSample;

   function AVIStreamReadFormat
     (pavi       : PAVISTREAM;
      lPos       : Win32.LONG;
      lpFormat   : Win32.LPVOID;
      lpcbFormat : Win32.PLONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamSetFormat
     (pavi     : PAVISTREAM;
      lPos     : Win32.LONG;
      lpFormat : Win32.LPVOID;
      cbFormat : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamReadData
     (pavi : PAVISTREAM;
      fcc  : Win32.DWORD;
      lp   : Win32.LPVOID;
      lpcb : Win32.PLONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamWriteData
     (pavi : PAVISTREAM;
      fcc  : Win32.DWORD;
      lp   : Win32.LPVOID;
      cb   : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamRead
     (pavi      : PAVISTREAM;
      lStart    : Win32.LONG;
      lSamples  : Win32.LONG;
      lpBuffer  : Win32.LPVOID;
      cbBuffer  : Win32.LONG;
      plBytes   : Win32.PLONG;
      plSamples : Win32.PLONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamWrite
     (pavi           : PAVISTREAM;
      lStart         : Win32.LONG;
      lSamples       : Win32.LONG;
      lpBuffer       : Win32.LPVOID;
      cbBuffer       : Win32.LONG;
      dwFlags        : Win32.DWORD;
      plSampWritten  : access Win32.LONG;
      plBytesWritten : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamStart (pavi : PAVISTREAM) return Win32.LONG;

   function AVIStreamLength (pavi : PAVISTREAM) return Win32.LONG;

   function AVIStreamTimeToSample
     (pavi  : PAVISTREAM;
      lTime : Win32.LONG)
      return Win32.LONG;

   function AVIStreamSampleToTime
     (pavi    : PAVISTREAM;
      lSample : Win32.LONG)
      return Win32.LONG;

   function AVIStreamBeginStreaming
     (pavi   : PAVISTREAM;
      lStart : Win32.LONG;
      lEnd   : Win32.LONG;
      lRate  : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamEndStreaming
     (pavi : PAVISTREAM)
      return Win32.Objbase.HRESULT;

   function AVIStreamGetFrameOpen
     (pavi       : PAVISTREAM;
      lpbiWanted : Win32.Wingdi.LPBITMAPINFOHEADER)
      return PGETFRAME;

   function AVIStreamGetFrame
     (pg   : PGETFRAME;
      lPos : Win32.LONG)
      return Win32.LPVOID;

   function AVIStreamGetFrameClose
     (pg   : PGETFRAME)
      return Win32.Objbase.HRESULT;

   function AVIStreamOpenFromFileA
     (ppavi         : access PAVISTREAM;
      szFile        : Win32.LPCSTR;
      fccType       : Win32.DWORD;
      lParam        : Win32.LONG;
      mode          : Win32.UINT;
      pclsidHandler : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT;

   function AVIStreamOpenFromFile
     (ppavi         : access PAVISTREAM;
      szFile        : Win32.LPCSTR;
      fccType       : Win32.DWORD;
      lParam        : Win32.LONG;
      mode          : Win32.UINT;
      pclsidHandler : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT renames AVIStreamOpenFromFileA;

   function AVIStreamOpenFromFileW
     (ppavi         : access PAVISTREAM;
      szFile        : Win32.LPCWSTR;
      fccType       : Win32.DWORD;
      lParam        : Win32.LONG;
      mode          : Win32.UINT;
      pclsidHandler : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT;

   function AVIStreamCreate
     (ppavi         : access PAVISTREAM;
      lParam1       : Win32.LONG;
      lParam2       : Win32.LONG;
      pclsidHandler : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT;

   function AVIStreamSampleToSample
     (pavi1 : PAVISTREAM;
      pavi2 : PAVISTREAM;
      l     : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNextSample
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamPrevSample
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNearestSample
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNextKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamPrevKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNearestKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamIsKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.BOOL;

   function AVIStreamPrevSampleTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNextSampleTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNearestSampleTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNextKeyFrameTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamPrevKeyFrameTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamNearestKeyFrameTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG;

   function AVIStreamStartTime (pavi : PAVISTREAM) return Win32.LONG;

   function AVIStreamLengthTime (pavi : PAVISTREAM) return Win32.LONG;

   function AVIStreamEnd (pavi : PAVISTREAM) return Win32.LONG;

   function AVIStreamEndTime (pavi : PAVISTREAM) return Win32.LONG;

   function AVIStreamSampleSize
     (pavi   : PAVISTREAM;
      lPos   : Win32.LONG;
      plSize : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamFormatSize
     (pavi   : PAVISTREAM;
      lPos   : Win32.LONG;
      plSize : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIStreamDataSize
     (pavi   : PAVISTREAM;
      fcc    : Win32.DWORD;
      plSize : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function AVIMakeCompressedStream
     (ppsCompressed : access PAVISTREAM;
      ppsSource     : PAVISTREAM;
      lpOptions     : access AVICOMPRESSOPTIONS;
      pclsidHandler : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT;

   function AVISaveA
     (szFile        : Win32.LPCSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      pfile         : PAVISTREAM;
      lpOptions     : LPAVICOMPRESSOPTIONS;
      Args          : Stdarg.ArgList := Stdarg.Empty)
      return Win32.Objbase.HRESULT;

   function AVISave
     (szFile        : Win32.LPCSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      pfile         : PAVISTREAM;
      lpOptions     : LPAVICOMPRESSOPTIONS;
      Args          : Stdarg.ArgList := Stdarg.Empty)
      return Win32.Objbase.HRESULT renames AVISaveA;

   function AVISaveVA
     (szFile        : Win32.LPCSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      ppavi         : access PAVISTREAM;
      plpOptions    : access LPAVICOMPRESSOPTIONS)
      return Win32.Objbase.HRESULT;

   function AVISaveV
     (szFile        : Win32.LPCSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      ppavi         : access PAVISTREAM;
      plpOptions    : access LPAVICOMPRESSOPTIONS)
      return Win32.Objbase.HRESULT renames AVISaveVA;

   function AVISaveW
     (szFile        : Win32.LPCWSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      pfile         : PAVISTREAM;
      lpOptions     : LPAVICOMPRESSOPTIONS;
      Args          : Stdarg.ArgList := Stdarg.Empty)
      return Win32.Objbase.HRESULT;

   function AVISaveVW
     (szFile        : Win32.LPCWSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      ppavi         : access PAVISTREAM;
      plpOptions    : access LPAVICOMPRESSOPTIONS)
      return Win32.Objbase.HRESULT;

   function AVISaveOptions
     (hwnd       : Win32.Windef.HWND;
      uiFlags    : Win32.UINT;
      nStreams   : Win32.INT;
      ppavi      : access PAVISTREAM;
      plpOptions : access LPAVICOMPRESSOPTIONS)
      return Win32.BOOL;

   function AVISaveOptionsFree
     (nStreams   : Win32.INT;
      plpOptions : access LPAVICOMPRESSOPTIONS)
      return Win32.Objbase.HRESULT;

   function AVIBuildFilterW
     (lpszFilter : Win32.LPWSTR;
      cbFilter   : Win32.LONG;
      fSaving    : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function AVIBuildFilterA
     (lpszFilter : Win32.LPSTR;
      cbFilter   : Win32.LONG;
      fSaving    : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function AVIBuildFilter
     (lpszFilter : Win32.LPSTR;
      cbFilter   : Win32.LONG;
      fSaving    : Win32.BOOL)
      return Win32.Objbase.HRESULT renames AVIBuildFilterA;

   function AVIMakeFileFromStreams
     (ppfile     : access PAVIFILE;
      nStreams   : Win32.INT;
      papStreams : access PAVISTREAM)
      return Win32.Objbase.HRESULT;

   function AVIMakeStreamFromClipboard
     (cfFormat : Win32.UINT;
      hGlobal  : Win32.Winnt.HANDLE;
      ppstream : access PAVISTREAM)
      return Win32.Objbase.HRESULT;

   function AVIPutFileOnClipboard
     (pf   : PAVIFILE)
      return Win32.Objbase.HRESULT;

   function AVIGetFromClipboard
     (lppf : access PAVIFILE)
      return Win32.Objbase.HRESULT;

   function AVIClearClipboard return Win32.Objbase.HRESULT;

   function CreateEditableStream
     (ppsEditable : access PAVISTREAM;
      psSource    : PAVISTREAM)
      return Win32.Objbase.HRESULT;

   function EditStreamCut
     (pavi     : PAVISTREAM;
      plStart  : access Win32.LONG;
      plLength : access Win32.LONG;
      ppResult : access PAVISTREAM)
      return Win32.Objbase.HRESULT;

   function EditStreamCopy
     (pavi     : PAVISTREAM;
      plStart  : access Win32.LONG;
      plLength : access Win32.LONG;
      ppResult : access PAVISTREAM)
      return Win32.Objbase.HRESULT;

   function EditStreamPaste
     (pavi     : PAVISTREAM;
      plPos    : access Win32.LONG;
      plLength : access Win32.LONG;
      pstream  : PAVISTREAM;
      lStart   : Win32.LONG;
      lEnd     : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function EditStreamClone
     (pavi     : PAVISTREAM;
      ppResult : access PAVISTREAM)
      return Win32.Objbase.HRESULT;

   function EditStreamSetNameA
     (pavi     : PAVISTREAM;
      lpszName : Win32.LPCSTR)
      return Win32.Objbase.HRESULT;

   function EditStreamSetName
     (pavi     : PAVISTREAM;
      lpszName : Win32.LPCSTR)
      return Win32.Objbase.HRESULT renames EditStreamSetNameA;

   function EditStreamSetNameW
     (pavi     : PAVISTREAM;
      lpszName : Win32.LPCWSTR)
      return Win32.Objbase.HRESULT;

   function EditStreamSetInfoW
     (pavi   : PAVISTREAM;
      lpInfo : LPAVISTREAMINFOW;
      cbInfo : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function EditStreamSetInfoA
     (pavi   : PAVISTREAM;
      lpInfo : LPAVISTREAMINFOA;
      cbInfo : Win32.LONG)
      return Win32.Objbase.HRESULT;

   function EditStreamSetInfo
     (pavi   : PAVISTREAM;
      lpInfo : LPAVISTREAMINFOA;
      cbInfo : Win32.LONG)
      return Win32.Objbase.HRESULT renames EditStreamSetInfoA;

   function MAKE_AVIERR (error : Win32.WORD) return Win32.Winerror.HRESULT;
   pragma Inline (MAKE_AVIERR);

   function MCIWndSM
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT renames Win32.Winuser.SendMessage;

   function MCIWndCanPlay (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MCIWndCanRecord (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MCIWndCanSave (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MCIWndCanWindow (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MCIWndCanEject (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MCIWndCanConfig (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MCIWndPaletteKick (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MCIWndSave
     (hwnd   : Win32.Windef.HWND;
      szFile : Win32.LPVOID)
      return Win32.LONG;

   function MCIWndSaveDialog (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndNew
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID)
      return Win32.LONG;

   function MCIWndRecord (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndOpen
     (hwnd : Win32.Windef.HWND;
      sz   : Win32.LPVOID;
      f    : Win32.BOOL)
      return Win32.LONG;

   function MCIWndOpenDialog (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndClose (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndPlay (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndStop (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndPause (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndResume (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndSeek
     (hwnd : Win32.Windef.HWND;
      lPos : Win32.LONG)
      return Win32.LONG;

   function MCIWndEject (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndHome (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndEnd (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndGetSource
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG;

   function MCIWndPutSource
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG;

   function MCIWndGetDest
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG;

   function MCIWndPutDest
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG;

   function MCIWndPlayReverse (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndPlayFrom
     (hwnd : Win32.Windef.HWND;
      lPos : Win32.LONG)
      return Win32.LONG;

   function MCIWndPlayTo
     (hwnd : Win32.Windef.HWND;
      lPos : Win32.LONG)
      return Win32.LONG;

   function MCIWndPlayFromTo
     (hwnd   : Win32.Windef.HWND;
      lStart : Win32.LONG;
      lEnd   : Win32.LONG)
      return Win32.LONG;

   function MCIWndGetDeviceID (hwnd : Win32.Windef.HWND) return Win32.UINT;

   function MCIWndGetAlias (hwnd : Win32.Windef.HWND) return Win32.UINT;

   function MCIWndGetMode
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR;
      len  : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetPosition (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndGetPositionString
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR;
      len  : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetStart (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndGetLength (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndGetEnd (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndStep
     (hwnd : Win32.Windef.HWND;
      n    : Win32.LONG)
      return Win32.LONG;

   procedure MCIWndDestroy (hwnd : Win32.Windef.HWND);

   procedure MCIWndSetZoom (hwnd : Win32.Windef.HWND; iZoom : Win32.UINT);

   function MCIWndGetZoom (hwnd : Win32.Windef.HWND) return Win32.UINT;

   function MCIWndSetVolume
     (hwnd : Win32.Windef.HWND;
      iVol : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetVolume (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndSetSpeed
     (hwnd   : Win32.Windef.HWND;
      iSpeed : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetSpeed (hwnd : Win32.Windef.HWND) return Win32.LONG;

   function MCIWndSetTimeFormat
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR)
      return Win32.LONG;

   function MCIWndGetTimeFormat
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR;
      len  : Win32.UINT)
      return Win32.LONG;

   procedure MCIWndValidateMedia (hwnd : Win32.Windef.HWND);

   procedure MCIWndSetRepeat (hwnd : Win32.Windef.HWND; f : Win32.BOOL);

   function MCIWndGetRepeat (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   procedure MCIWndSetActiveTimer
     (hwnd   : Win32.Windef.HWND;
      active : Win32.UINT);
   procedure MCIWndSetInactiveTimer
     (hwnd     : Win32.Windef.HWND;
      inactive : Win32.UINT);

   procedure MCIWndSetTimers
     (hwnd     : Win32.Windef.HWND;
      active   : Win32.UINT;
      inactive : Win32.UINT);

   function MCIWndGetActiveTimer
     (hwnd : Win32.Windef.HWND)
      return Win32.UINT;

   function MCIWndGetInactiveTimer
     (hwnd : Win32.Windef.HWND)
      return Win32.UINT;

   function MCIWndRealize
     (hwnd   : Win32.Windef.HWND;
      fBkgnd : Win32.BOOL)
      return Win32.LONG;

   function MCIWndSendString
     (hwnd : Win32.Windef.HWND;
      sz   : Win32.Winnt.LPTSTR)
      return Win32.LONG;

   function MCIWndReturnString
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetError
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetPalette
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HPALETTE;

   function MCIWndSetPalette
     (hwnd : Win32.Windef.HWND;
      hpal : Win32.Windef.HPALETTE)
      return Win32.LONG;

   function MCIWndGetFileName
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetDevice
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG;

   function MCIWndGetStyles (hwnd : Win32.Windef.HWND) return Win32.UINT;

   function MCIWndChangeStyles
     (hwnd  : Win32.Windef.HWND;
      mask  : Win32.UINT;
      value : Win32.LONG)
      return Win32.LONG;

   function MCIWndOpenInterface
     (hwnd : Win32.Windef.HWND;
      pUnk : Win32.Objbase.LPUNKNOWN)
      return Win32.LONG;

   function MCIWndSetOwner
     (hwnd  : Win32.Windef.HWND;
      hwndP : Win32.Windef.HWND)
      return Win32.LONG;

   function MCIWndCreateA
     (hwndParent : Win32.Windef.HWND;
      hInstance  : Win32.Windef.HINSTANCE;
      dwStyle    : Win32.DWORD;
      szFile     : Win32.LPCSTR)
      return Win32.Windef.HWND;

   function MCIWndCreate
     (hwndParent : Win32.Windef.HWND;
      hInstance  : Win32.Windef.HINSTANCE;
      dwStyle    : Win32.DWORD;
      szFile     : Win32.LPCSTR)
      return Win32.Windef.HWND renames MCIWndCreateA;

   function MCIWndCreateW
     (hwndParent : Win32.Windef.HWND;
      hInstance  : Win32.Windef.HINSTANCE;
      dwStyle    : Win32.DWORD;
      szFile     : Win32.LPCWSTR)
      return Win32.Windef.HWND;

   function MCIWndRegisterClass return Win32.BOOL;

   function AVICapSM
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT renames Win32.Winuser.SendMessage;

   function capSetCallbackOnError
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL;

   function capSetCallbackOnStatus
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL;

   function capSetCallbackOnYield
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL;

   function capSetCallbackOnFrame
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL;

   function capSetCallbackOnVideoStream
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL;

   function capSetCallbackOnWaveStream
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL;

   function capSetCallbackOnCapControl
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL;

   function capSetUserData
     (hwnd  : Win32.Windef.HWND;
      lUser : Win32.LONG)
      return Win32.BOOL;

   function capGetUserData (hwnd : Win32.Windef.HWND) return Win32.LRESULT;

   function capDriverConnect
     (hwnd : Win32.Windef.HWND;
      i    : Win32.INT)
      return Win32.BOOL;

   function capDriverDisconnect
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function capDriverGetName
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR;
      wSize  : Win32.WORD)
      return Win32.BOOL;

   function capDriverGetVersion
     (hwnd  : Win32.Windef.HWND;
      szVer : Win32.Winnt.LPTSTR;
      wSize : Win32.WORD)
      return Win32.BOOL;

   function capDriverGetCaps
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPDRIVERCAPS;
      wSize : Win32.WORD)
      return Win32.BOOL;

   function capFileSetCaptureFile
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL;

   function capFileGetCaptureFile
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR;
      wSize  : Win32.WORD)
      return Win32.BOOL;

   function capFileAlloc
     (hwnd   : Win32.Windef.HWND;
      dwSize : Win32.DWORD)
      return Win32.BOOL;

   function capFileSaveAs
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL;

   function capFileSetInfoChunk
     (hwnd        : Win32.Windef.HWND;
      lpInfoChunk : LPCAPINFOCHUNK)
      return Win32.BOOL;

   function capFileSaveDIB
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL;

   function capEditCopy (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capSetAudioFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.Mmsystem.LPWAVEFORMATEX;
      wSize : Win32.WORD)
      return Win32.BOOL;

   function capGetAudioFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.Mmsystem.LPWAVEFORMATEX;
      wSize : Win32.WORD)
      return Win32.DWORD;

   function capGetAudioFormatSize
     (hwnd : Win32.Windef.HWND)
      return Win32.DWORD;

   function capDlgVideoFormat (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capDlgVideoSource (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capDlgVideoDisplay (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capDlgVideoCompression
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function capGetVideoFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.LPVOID;
      wSize : Win32.WORD)
      return Win32.DWORD;

   function capGetVideoFormatSize
     (hwnd : Win32.Windef.HWND)
      return Win32.DWORD;

   function capSetVideoFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.LPVOID;
      wSize : Win32.WORD)
      return Win32.BOOL;

   function capPreview
     (hwnd : Win32.Windef.HWND;
      f    : Win32.BOOL)
      return Win32.BOOL;

   function capPreviewRate
     (hwnd : Win32.Windef.HWND;
      wMS  : Win32.WORD)
      return Win32.BOOL;

   function capOverlay
     (hwnd : Win32.Windef.HWND;
      f    : Win32.BOOL)
      return Win32.BOOL;

   function capPreviewScale
     (hwnd : Win32.Windef.HWND;
      f    : Win32.BOOL)
      return Win32.BOOL;

   function capGetStatus
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPSTATUS;
      wSize : Win32.WORD)
      return Win32.BOOL;

   function capSetScrollPos
     (hwnd : Win32.Windef.HWND;
      lpP  : Win32.Windef.LPPOINT)
      return Win32.BOOL;

   function capGrabFrame (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capGrabFrameNoStop (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capCaptureSequence (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capCaptureSequenceNoFile
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function capCaptureStop (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capCaptureAbort (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capCaptureSingleFrameOpen
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function capCaptureSingleFrameClose
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function capCaptureSingleFrame
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function capCaptureGetSetup
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPTUREPARMS;
      wSize : Win32.WORD)
      return Win32.BOOL;

   function capCaptureSetSetup
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPTUREPARMS;
      wSize : Win32.WORD)
      return Win32.BOOL;

   function capSetMCIDeviceName
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL;

   function capGetMCIDeviceName
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR;
      wSize  : Win32.WORD)
      return Win32.BOOL;

   function capPaletteOpen
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL;

   function capPaletteSave
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL;

   function capPalettePaste (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function capPaletteAuto
     (hwnd    : Win32.Windef.HWND;
      iFrames : Win32.INT;
      iColors : Win32.INT)
      return Win32.BOOL;

   function capPaletteManual
     (hwnd    : Win32.Windef.HWND;
      fGrab   : Win32.BOOL;
      iColors : Win32.INT)
      return Win32.BOOL;

   function capCreateCaptureWindowA
     (lpszWindowName : Win32.LPCSTR;
      dwStyle        : Win32.DWORD;
      x              : Win32.INT;
      y              : Win32.INT;
      nWidth         : Win32.INT;
      nHeight        : Win32.INT;
      hwndParent     : Win32.Windef.HWND;
      nID            : Win32.INT)
      return Win32.Windef.HWND;

   function capCreateCaptureWindow
     (lpszWindowName : Win32.LPCSTR;
      dwStyle        : Win32.DWORD;
      x              : Win32.INT;
      y              : Win32.INT;
      nWidth         : Win32.INT;
      nHeight        : Win32.INT;
      hwndParent     : Win32.Windef.HWND;
      nID            : Win32.INT)
      return Win32.Windef.HWND renames capCreateCaptureWindowA;

   function capGetDriverDescriptionA
     (wDriverIndex : Win32.UINT;
      lpszName     : Win32.LPSTR;
      cbName       : Win32.INT;
      lpszVer      : Win32.LPSTR;
      cbVer        : Win32.INT)
      return Win32.BOOL;

   function capGetDriverDescription
     (wDriverIndex : Win32.UINT;
      lpszName     : Win32.LPSTR;
      cbName       : Win32.INT;
      lpszVer      : Win32.LPSTR;
      cbVer        : Win32.INT)
      return Win32.BOOL renames capGetDriverDescriptionA;

   function capCreateCaptureWindowW
     (lpszWindowName : Win32.LPCWSTR;
      dwStyle        : Win32.DWORD;
      x              : Win32.INT;
      y              : Win32.INT;
      nWidth         : Win32.INT;
      nHeight        : Win32.INT;
      hwndParent     : Win32.Windef.HWND;
      nID            : Win32.INT)
      return Win32.Windef.HWND;

   function capGetDriverDescriptionW
     (wDriverIndex : Win32.UINT;
      lpszName     : Win32.LPWSTR;
      cbName       : Win32.INT;
      lpszVer      : Win32.LPWSTR;
      cbVer        : Win32.INT)
      return Win32.BOOL;

   function GetOpenFileNamePreviewA
     (lpofn : Win32.Commdlg.LPOPENFILENAMEA)
      return Win32.BOOL;

   function GetOpenFileNamePreview
     (lpofn : Win32.Commdlg.LPOPENFILENAMEA)
      return Win32.BOOL renames GetOpenFileNamePreviewA;

   function GetSaveFileNamePreviewA
     (lpofn : Win32.Commdlg.LPOPENFILENAMEA)
      return Win32.BOOL;

   function GetSaveFileNamePreview
     (lpofn : Win32.Commdlg.LPOPENFILENAMEA)
      return Win32.BOOL renames GetSaveFileNamePreviewA;

   function GetOpenFileNamePreviewW
     (lpofn : Win32.Commdlg.LPOPENFILENAMEW)
      return Win32.BOOL;

   function GetSaveFileNamePreviewW
     (lpofn : Win32.Commdlg.LPOPENFILENAMEW)
      return Win32.BOOL;

private

   pragma Convention (C, ICOPEN);
   pragma Convention (C, ICINFO);
   pragma Convention (C, ICCOMPRESS);
   pragma Convention (C, ICCOMPRESSFRAMES);
   pragma Convention (C, ICSETSTATUSPROC);
   pragma Convention (C, ICDECOMPRESS);
   pragma Convention (C, ICDECOMPRESSEX);
   pragma Convention (C, ICDRAWBEGIN);
   pragma Convention (C, ICDRAW);
   pragma Convention (C, ICDRAWSUGGEST);
   pragma Convention (C, ICPALETTE);
   pragma Convention (C, COMPVARS);
   pragma Convention (C, DRAWDIBTIME);
   pragma Convention (C, MainAVIHeader);
   pragma Convention (C, AVIStreamHeader);
   pragma Convention (C, AVIINDEXENTRY);
   pragma Convention (C, AVIPALCHANGE);
   pragma Convention (C, AVISTREAMINFOW);
   pragma Convention (C, AVISTREAMINFOA);
   pragma Convention (C, AVIFILEINFOW);
   pragma Convention (C, AVIFILEINFOA);
   pragma Convention (C, AVICOMPRESSOPTIONS);
   pragma Convention (C, IAVIStreamVtbl);
   pragma Convention (C, IAVIStream);
   pragma Convention (C, IAVIStreamingVtbl);
   pragma Convention (C, IAVIStreaming);
   pragma Convention (C, IAVIEditStreamVtbl);
   pragma Convention (C, IAVIEditStream);
   pragma Convention (C, IAVIFileVtbl);
   pragma Convention (C, IAVIFile);
   pragma Convention (C, IGetFrameVtbl);
   pragma Convention (C, IGetFrame);
   pragma Convention (C, VIDEOHDR);
   pragma Convention (C, CHANNEL_CAPS);
   pragma Convention (C, CAPDRIVERCAPS);
   pragma Convention (C, CAPSTATUS);
   pragma Convention (C, CAPTUREPARMS);
   pragma Convention (C, CAPINFOCHUNK);

   pragma Import (Stdcall, IID_IAVIFile, "IID_IAVIFile");
   pragma Import (Stdcall, IID_IAVIStream, "IID_IAVIStream");
   pragma Import (Stdcall, IID_IAVIStreaming, "IID_IAVIStreaming");
   pragma Import (Stdcall, IID_IGetFrame, "IID_IGetFrame");
   pragma Import (Stdcall, IID_IAVIEditStream, "IID_IAVIEditStream");
   pragma Import
     (Stdcall,
      CLSID_AVISimpleUnMarshal,
      "CLSID_AVISimpleUnMarshal");

   pragma Import (Stdcall, VideoForWindowsVersion, "VideoForWindowsVersion");
   pragma Import (Stdcall, InitVFW, "InitVFW");
   pragma Import (Stdcall, TermVFW, "TermVFW");
   pragma Import (Stdcall, ICInfo_func, "ICInfo");
   pragma Import (Stdcall, ICInstall, "ICInstall");
   pragma Import (Stdcall, ICRemove, "ICRemove");
   pragma Import (Stdcall, ICGetInfo, "ICGetInfo");
   pragma Import (Stdcall, ICOpen_func, "ICOpen");
   pragma Import (Stdcall, ICOpenFunction, "ICOpenFunction");
   pragma Import (Stdcall, ICClose, "ICClose");
   pragma Import (Stdcall, ICSendMessage, "ICSendMessage");
   pragma Import (Stdcall, ICCompress_func, "ICCompress");
   pragma Import (Stdcall, ICDecompress_func, "ICDecompress");
   pragma Import (Stdcall, ICDrawBegin_func, "ICDrawBegin");
   pragma Import (Stdcall, ICDraw_func, "ICDraw");
   pragma Import (Stdcall, ICLocate, "ICLocate");
   pragma Import (Stdcall, ICGetDisplayFormat, "ICGetDisplayFormat");
   pragma Import (Stdcall, ICImageCompress, "ICImageCompress");
   pragma Import (Stdcall, ICImageDecompress, "ICImageDecompress");
   pragma Import (Stdcall, ICCompressorChoose, "ICCompressorChoose");
   pragma Import
     (Stdcall,
      ICSeqCompressFrameStart,
      "ICSeqCompressFrameStart");
   pragma Import (Stdcall, ICSeqCompressFrameEnd, "ICSeqCompressFrameEnd");
   pragma Import (Stdcall, ICSeqCompressFrame, "ICSeqCompressFrame");
   pragma Import (Stdcall, ICCompressorFree, "ICCompressorFree");
   pragma Import (Stdcall, DrawDibInit, "DrawDibInit");
   pragma Import (Stdcall, DrawDibOpen, "DrawDibOpen");
   pragma Import (Stdcall, DrawDibClose, "DrawDibClose");
   pragma Import (Stdcall, DrawDibGetBuffer, "DrawDibGetBuffer");
   pragma Import (Stdcall, DrawDibError, "DrawDibError");
   pragma Import (Stdcall, DrawDibGetPalette, "DrawDibGetPalette");
   pragma Import (Stdcall, DrawDibSetPalette, "DrawDibSetPalette");
   pragma Import (Stdcall, DrawDibChangePalette, "DrawDibChangePalette");
   pragma Import (Stdcall, DrawDibRealize, "DrawDibRealize");
   pragma Import (Stdcall, DrawDibStart, "DrawDibStart");
   pragma Import (Stdcall, DrawDibStop, "DrawDibStop");
   pragma Import (Stdcall, DrawDibBegin, "DrawDibBegin");
   pragma Import (Stdcall, DrawDibDraw, "DrawDibDraw");
   pragma Import (Stdcall, DrawDibEnd, "DrawDibEnd");
   pragma Import (Stdcall, DrawDibTime_func, "DrawDibTime");
   pragma Import (Stdcall, DrawDibProfileDisplay, "DrawDibProfileDisplay");
   pragma Import (Stdcall, AVIFileInit, "AVIFileInit");
   pragma Import (Stdcall, AVIFileExit, "AVIFileExit");
   pragma Import (Stdcall, AVIFileAddRef, "AVIFileAddRef");
   pragma Import (Stdcall, AVIFileRelease, "AVIFileRelease");
   pragma Import (Stdcall, AVIFileOpenA, "AVIFileOpenA");
   pragma Import (Stdcall, AVIFileOpenW, "AVIFileOpenW");
   pragma Import (Stdcall, AVIFileInfoW_func, "AVIFileInfoW");
   pragma Import (Stdcall, AVIFileInfoA_func, "AVIFileInfoA");
   pragma Import (Stdcall, AVIFileGetStream, "AVIFileGetStream");
   pragma Import (Stdcall, AVIFileCreateStream, "AVIFileCreateStream");
   pragma Import (Stdcall, AVIFileWriteData, "AVIFileWriteData");
   pragma Import (Stdcall, AVIFileReadData, "AVIFileReadData");
   pragma Import (Stdcall, AVIFileEndRecord, "AVIFileEndRecord");
   pragma Import (Stdcall, AVIStreamAddRef, "AVIStreamAddRef");
   pragma Import (Stdcall, AVIStreamRelease, "AVIStreamRelease");
   pragma Import (Stdcall, AVIStreamInfoW_func, "AVIStreamInfoW");
   pragma Import (Stdcall, AVIStreamInfoA_func, "AVIStreamInfoA");
   pragma Import (Stdcall, AVIStreamFindSample, "AVIStreamFindSample");
   pragma Import (Stdcall, AVIStreamReadFormat, "AVIStreamReadFormat");
   pragma Import (Stdcall, AVIStreamSetFormat, "AVIStreamSetFormat");
   pragma Import (Stdcall, AVIStreamReadData, "AVIStreamReadData");
   pragma Import (Stdcall, AVIStreamWriteData, "AVIStreamWriteData");
   pragma Import (Stdcall, AVIStreamRead, "AVIStreamRead");
   pragma Import (Stdcall, AVIStreamWrite, "AVIStreamWrite");
   pragma Import (Stdcall, AVIStreamStart, "AVIStreamStart");
   pragma Import (Stdcall, AVIStreamLength, "AVIStreamLength");
   pragma Import (Stdcall, AVIStreamTimeToSample, "AVIStreamTimeToSample");
   pragma Import (Stdcall, AVIStreamSampleToTime, "AVIStreamSampleToTime");
   pragma Import
     (Stdcall,
      AVIStreamBeginStreaming,
      "AVIStreamBeginStreaming");
   pragma Import (Stdcall, AVIStreamEndStreaming, "AVIStreamEndStreaming");
   pragma Import (Stdcall, AVIStreamGetFrameOpen, "AVIStreamGetFrameOpen");
   pragma Import (Stdcall, AVIStreamGetFrame, "AVIStreamGetFrame");
   pragma Import (Stdcall, AVIStreamGetFrameClose, "AVIStreamGetFrameClose");
   pragma Import (Stdcall, AVIStreamOpenFromFileA, "AVIStreamOpenFromFileA");
   pragma Import (Stdcall, AVIStreamOpenFromFileW, "AVIStreamOpenFromFileW");
   pragma Import (Stdcall, AVIStreamCreate, "AVIStreamCreate");
   pragma Import
     (Stdcall,
      AVIMakeCompressedStream,
      "AVIMakeCompressedStream");
   pragma Import (Stdcall, AVISaveVA, "AVISaveVA");
   pragma Import (Stdcall, AVISaveVW, "AVISaveVW");
   pragma Import (Stdcall, AVISaveOptions, "AVISaveOptions");
   pragma Import (Stdcall, AVISaveOptionsFree, "AVISaveOptionsFree");
   pragma Import (Stdcall, AVIBuildFilterW, "AVIBuildFilterW");
   pragma Import (Stdcall, AVIBuildFilterA, "AVIBuildFilterA");
   pragma Import (Stdcall, AVIMakeFileFromStreams, "AVIMakeFileFromStreams");
   pragma Import
     (Stdcall,
      AVIMakeStreamFromClipboard,
      "AVIMakeStreamFromClipboard");
   pragma Import (Stdcall, AVIPutFileOnClipboard, "AVIPutFileOnClipboard");
   pragma Import (Stdcall, AVIGetFromClipboard, "AVIGetFromClipboard");
   pragma Import (Stdcall, AVIClearClipboard, "AVIClearClipboard");
   pragma Import (Stdcall, CreateEditableStream, "CreateEditableStream");
   pragma Import (Stdcall, EditStreamCut, "EditStreamCut");
   pragma Import (Stdcall, EditStreamCopy, "EditStreamCopy");
   pragma Import (Stdcall, EditStreamPaste, "EditStreamPaste");
   pragma Import (Stdcall, EditStreamClone, "EditStreamClone");
   pragma Import (Stdcall, EditStreamSetNameA, "EditStreamSetNameA");
   pragma Import (Stdcall, EditStreamSetNameW, "EditStreamSetNameW");
   pragma Import (Stdcall, EditStreamSetInfoW, "EditStreamSetInfoW");
   pragma Import (Stdcall, EditStreamSetInfoA, "EditStreamSetInfoA");
   pragma Import (Stdcall, MCIWndCreateA, "MCIWndCreateA");
   pragma Import (Stdcall, MCIWndCreateW, "MCIWndCreateW");
   pragma Import (Stdcall, MCIWndRegisterClass, "MCIWndRegisterClass");
   pragma Import
     (Stdcall,
      capCreateCaptureWindowA,
      "capCreateCaptureWindowA");
   pragma Import
     (Stdcall,
      capGetDriverDescriptionA,
      "capGetDriverDescriptionA");
   pragma Import
     (Stdcall,
      capCreateCaptureWindowW,
      "capCreateCaptureWindowW");
   pragma Import
     (Stdcall,
      capGetDriverDescriptionW,
      "capGetDriverDescriptionW");
   pragma Import
     (Stdcall,
      GetOpenFileNamePreviewA,
      "GetOpenFileNamePreviewA");
   pragma Import
     (Stdcall,
      GetSaveFileNamePreviewA,
      "GetSaveFileNamePreviewA");
   pragma Import
     (Stdcall,
      GetOpenFileNamePreviewW,
      "GetOpenFileNamePreviewW");
   pragma Import
     (Stdcall,
      GetSaveFileNamePreviewW,
      "GetSaveFileNamePreviewW");

   pragma Inline (MKFOURCC);
   pragma Inline (StreamFromFOURCC);
   pragma Inline (TWOCCFromFOURCC);

end Win32.Vfw;
