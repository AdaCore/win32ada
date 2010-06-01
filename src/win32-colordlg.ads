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

package Win32.Colordlg is

   DLG_COLOR         : constant := 10;
   COLOR_HUESCROLL   : constant := 700;
   COLOR_SATSCROLL   : constant := 701;
   COLOR_LUMSCROLL   : constant := 702;
   COLOR_HUE         : constant := 703;
   COLOR_SAT         : constant := 704;
   COLOR_LUM         : constant := 705;
   COLOR_RED         : constant := 706;
   COLOR_GREEN       : constant := 707;
   COLOR_BLUE        : constant := 708;
   COLOR_CURRENT     : constant := 709;
   COLOR_RAINBOW     : constant := 710;
   COLOR_SAVE        : constant := 711;
   COLOR_ADD         : constant := 712;
   COLOR_SOLID       : constant := 713;
   COLOR_TUNE        : constant := 714;
   COLOR_SCHEMES     : constant := 715;
   COLOR_ELEMENT     : constant := 716;
   COLOR_SAMPLES     : constant := 717;
   COLOR_PALETTE     : constant := 718;
   COLOR_MIX         : constant := 719;
   COLOR_BOX1        : constant := 720;
   COLOR_CUSTOM1     : constant := 721;
   COLOR_HUEACCEL    : constant := 723;
   COLOR_SATACCEL    : constant := 724;
   COLOR_LUMACCEL    : constant := 725;
   COLOR_REDACCEL    : constant := 726;
   COLOR_GREENACCEL  : constant := 727;
   COLOR_BLUEACCEL   : constant := 728;
   NUM_BASIC_COLORS  : constant := 48;
   NUM_CUSTOM_COLORS : constant := 16;

end Win32.Colordlg;
