--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-cderr.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
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

package Win32.Cderr is

   CDERR_DIALOGFAILURE    : constant :=  16#ffff#; --  cderr.h  :4
   CDERR_GENERALCODES     : constant :=  16#0#;    --  cderr.h  :6
   CDERR_STRUCTSIZE       : constant :=  16#1#;    --  cderr.h  :7
   CDERR_INITIALIZATION   : constant :=  16#2#;    --  cderr.h  :8
   CDERR_NOTEMPLATE       : constant :=  16#3#;    --  cderr.h  :9
   CDERR_NOHINSTANCE      : constant :=  16#4#;    --  cderr.h  :10
   CDERR_LOADSTRFAILURE   : constant :=  16#5#;    --  cderr.h  :11
   CDERR_FINDRESFAILURE   : constant :=  16#6#;    --  cderr.h  :12
   CDERR_LOADRESFAILURE   : constant :=  16#7#;    --  cderr.h  :13
   CDERR_LOCKRESFAILURE   : constant :=  16#8#;    --  cderr.h  :14
   CDERR_MEMALLOCFAILURE  : constant :=  16#9#;    --  cderr.h  :15
   CDERR_MEMLOCKFAILURE   : constant :=  16#a#;    --  cderr.h  :16
   CDERR_NOHOOK           : constant :=  16#b#;    --  cderr.h  :17
   CDERR_REGISTERMSGFAIL  : constant :=  16#c#;    --  cderr.h  :18
   PDERR_PRINTERCODES     : constant :=  16#1000#; --  cderr.h  :20
   PDERR_SETUPFAILURE     : constant :=  16#1001#; --  cderr.h  :21
   PDERR_PARSEFAILURE     : constant :=  16#1002#; --  cderr.h  :22
   PDERR_RETDEFFAILURE    : constant :=  16#1003#; --  cderr.h  :23
   PDERR_LOADDRVFAILURE   : constant :=  16#1004#; --  cderr.h  :24
   PDERR_GETDEVMODEFAIL   : constant :=  16#1005#; --  cderr.h  :25
   PDERR_INITFAILURE      : constant :=  16#1006#; --  cderr.h  :26
   PDERR_NODEVICES        : constant :=  16#1007#; --  cderr.h  :27
   PDERR_NODEFAULTPRN     : constant :=  16#1008#; --  cderr.h  :28
   PDERR_DNDMMISMATCH     : constant :=  16#1009#; --  cderr.h  :29
   PDERR_CREATEICFAILURE  : constant :=  16#100a#; --  cderr.h  :30
   PDERR_PRINTERNOTFOUND  : constant :=  16#100b#; --  cderr.h  :31
   PDERR_DEFAULTDIFFERENT : constant :=  16#100c#; --  cderr.h  :32
   CFERR_CHOOSEFONTCODES  : constant :=  16#2000#; --  cderr.h  :34
   CFERR_NOFONTS          : constant :=  16#2001#; --  cderr.h  :35
   CFERR_MAXLESSTHANMIN   : constant :=  16#2002#; --  cderr.h  :36
   FNERR_FILENAMECODES    : constant :=  16#3000#; --  cderr.h  :38
   FNERR_SUBCLASSFAILURE  : constant :=  16#3001#; --  cderr.h  :39
   FNERR_INVALIDFILENAME  : constant :=  16#3002#; --  cderr.h  :40
   FNERR_BUFFERTOOSMALL   : constant :=  16#3003#; --  cderr.h  :41
   FRERR_FINDREPLACECODES : constant :=  16#4000#; --  cderr.h  :43
   FRERR_BUFFERLENGTHZERO : constant :=  16#4001#; --  cderr.h  :44
   CCERR_CHOOSECOLORCODES : constant :=  16#5000#; --  cderr.h  :46

end Win32.Cderr;


