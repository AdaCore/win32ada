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

package Win32.Mciavi is

   MCI_MCIAVI_PLAY_WINDOW : constant := 16#1000000#;
   --  mciavi.h:30
   MCI_MCIAVI_PLAY_FULLSCREEN : constant := 16#2000000#;
   --  mciavi.h:31
   MCI_MCIAVI_PLAY_FULLBY2 : constant := 16#4000000#;
   --  mciavi.h:32
   MCI_AVI_STATUS_FRAMES_SKIPPED     : constant := 16#8001#; --  mciavi.h :41
   MCI_AVI_STATUS_LAST_PLAY_SPEED    : constant := 16#8002#; --  mciavi.h :49
   MCI_AVI_STATUS_AUDIO_BREAKS       : constant := 16#8003#; --  mciavi.h :56
   MCI_AVI_SETVIDEO_DRAW_PROCEDURE   : constant := 16#8000#; --  mciavi.h :59
   MCI_AVI_SETVIDEO_PALETTE_COLOR    : constant := 16#8100#; --  mciavi.h :61
   MCI_AVI_SETVIDEO_PALETTE_HALFTONE : constant := 16#ffff#; --  mciavi.h :68
   MCIERR_AVI_OLDAVIFORMAT       : constant := 612; --  mciavi.h :73
   MCIERR_AVI_NOTINTERLEAVED     : constant := 613; --  mciavi.h :74
   MCIERR_AVI_NODISPDIB          : constant := 614; --  mciavi.h :75
   MCIERR_AVI_CANTPLAYFULLSCREEN : constant := 615; --  mciavi.h :76
   MCIERR_AVI_TOOBIGFORVGA       : constant := 616; --  mciavi.h :77
   MCIERR_AVI_NOCOMPRESSOR       : constant := 617; --  mciavi.h :78
   MCIERR_AVI_DISPLAYERROR       : constant := 618; --  mciavi.h :79
   MCIERR_AVI_AUDIOERROR         : constant := 619; --  mciavi.h :80
   MCIERR_AVI_BADPALETTE         : constant := 620; --  mciavi.h :81

end Win32.Mciavi;
