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

package Win32.Mciavi is

   MCI_MCIAVI_PLAY_WINDOW            : constant := 16#1000000#;
   MCI_MCIAVI_PLAY_FULLSCREEN        : constant := 16#2000000#;
   MCI_MCIAVI_PLAY_FULLBY2           : constant := 16#4000000#;
   MCI_AVI_STATUS_FRAMES_SKIPPED     : constant := 16#8001#;
   MCI_AVI_STATUS_LAST_PLAY_SPEED    : constant := 16#8002#;
   MCI_AVI_STATUS_AUDIO_BREAKS       : constant := 16#8003#;
   MCI_AVI_SETVIDEO_DRAW_PROCEDURE   : constant := 16#8000#;
   MCI_AVI_SETVIDEO_PALETTE_COLOR    : constant := 16#8100#;
   MCI_AVI_SETVIDEO_PALETTE_HALFTONE : constant := 16#ffff#;
   MCIERR_AVI_OLDAVIFORMAT           : constant := 612;
   MCIERR_AVI_NOTINTERLEAVED         : constant := 613;
   MCIERR_AVI_NODISPDIB              : constant := 614;
   MCIERR_AVI_CANTPLAYFULLSCREEN     : constant := 615;
   MCIERR_AVI_TOOBIGFORVGA           : constant := 616;
   MCIERR_AVI_NOCOMPRESSOR           : constant := 617;
   MCIERR_AVI_DISPLAYERROR           : constant := 618;
   MCIERR_AVI_AUDIOERROR             : constant := 619;
   MCIERR_AVI_BADPALETTE             : constant := 620;

end Win32.Mciavi;
