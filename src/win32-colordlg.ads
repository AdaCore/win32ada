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

package Win32.Colordlg is

   DLG_COLOR         : constant := 10;  --  colordlg.h :3
   COLOR_HUESCROLL   : constant := 700; --  colordlg.h :5
   COLOR_SATSCROLL   : constant := 701; --  colordlg.h :6
   COLOR_LUMSCROLL   : constant := 702; --  colordlg.h :7
   COLOR_HUE         : constant := 703; --  colordlg.h :8
   COLOR_SAT         : constant := 704; --  colordlg.h :9
   COLOR_LUM         : constant := 705; --  colordlg.h :10
   COLOR_RED         : constant := 706; --  colordlg.h :11
   COLOR_GREEN       : constant := 707; --  colordlg.h :12
   COLOR_BLUE        : constant := 708; --  colordlg.h :13
   COLOR_CURRENT     : constant := 709; --  colordlg.h :14
   COLOR_RAINBOW     : constant := 710; --  colordlg.h :15
   COLOR_SAVE        : constant := 711; --  colordlg.h :16
   COLOR_ADD         : constant := 712; --  colordlg.h :17
   COLOR_SOLID       : constant := 713; --  colordlg.h :18
   COLOR_TUNE        : constant := 714; --  colordlg.h :19
   COLOR_SCHEMES     : constant := 715; --  colordlg.h :20
   COLOR_ELEMENT     : constant := 716; --  colordlg.h :21
   COLOR_SAMPLES     : constant := 717; --  colordlg.h :22
   COLOR_PALETTE     : constant := 718; --  colordlg.h :23
   COLOR_MIX         : constant := 719; --  colordlg.h :24
   COLOR_BOX1        : constant := 720; --  colordlg.h :25
   COLOR_CUSTOM1     : constant := 721; --  colordlg.h :26
   COLOR_HUEACCEL    : constant := 723; --  colordlg.h :28
   COLOR_SATACCEL    : constant := 724; --  colordlg.h :29
   COLOR_LUMACCEL    : constant := 725; --  colordlg.h :30
   COLOR_REDACCEL    : constant := 726; --  colordlg.h :31
   COLOR_GREENACCEL  : constant := 727; --  colordlg.h :32
   COLOR_BLUEACCEL   : constant := 728; --  colordlg.h :33
   NUM_BASIC_COLORS  : constant := 48;  --  colordlg.h :35
   NUM_CUSTOM_COLORS : constant := 16;  --  colordlg.h :36

end Win32.Colordlg;
