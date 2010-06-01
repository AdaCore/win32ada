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

package Win32.Cderr is

   CDERR_DIALOGFAILURE    : constant := 16#ffff#;
   CDERR_GENERALCODES     : constant := 16#0#;
   CDERR_STRUCTSIZE       : constant := 16#1#;
   CDERR_INITIALIZATION   : constant := 16#2#;
   CDERR_NOTEMPLATE       : constant := 16#3#;
   CDERR_NOHINSTANCE      : constant := 16#4#;
   CDERR_LOADSTRFAILURE   : constant := 16#5#;
   CDERR_FINDRESFAILURE   : constant := 16#6#;
   CDERR_LOADRESFAILURE   : constant := 16#7#;
   CDERR_LOCKRESFAILURE   : constant := 16#8#;
   CDERR_MEMALLOCFAILURE  : constant := 16#9#;
   CDERR_MEMLOCKFAILURE   : constant := 16#a#;
   CDERR_NOHOOK           : constant := 16#b#;
   CDERR_REGISTERMSGFAIL  : constant := 16#c#;
   PDERR_PRINTERCODES     : constant := 16#1000#;
   PDERR_SETUPFAILURE     : constant := 16#1001#;
   PDERR_PARSEFAILURE     : constant := 16#1002#;
   PDERR_RETDEFFAILURE    : constant := 16#1003#;
   PDERR_LOADDRVFAILURE   : constant := 16#1004#;
   PDERR_GETDEVMODEFAIL   : constant := 16#1005#;
   PDERR_INITFAILURE      : constant := 16#1006#;
   PDERR_NODEVICES        : constant := 16#1007#;
   PDERR_NODEFAULTPRN     : constant := 16#1008#;
   PDERR_DNDMMISMATCH     : constant := 16#1009#;
   PDERR_CREATEICFAILURE  : constant := 16#100a#;
   PDERR_PRINTERNOTFOUND  : constant := 16#100b#;
   PDERR_DEFAULTDIFFERENT : constant := 16#100c#;
   CFERR_CHOOSEFONTCODES  : constant := 16#2000#;
   CFERR_NOFONTS          : constant := 16#2001#;
   CFERR_MAXLESSTHANMIN   : constant := 16#2002#;
   FNERR_FILENAMECODES    : constant := 16#3000#;
   FNERR_SUBCLASSFAILURE  : constant := 16#3001#;
   FNERR_INVALIDFILENAME  : constant := 16#3002#;
   FNERR_BUFFERTOOSMALL   : constant := 16#3003#;
   FRERR_FINDREPLACECODES : constant := 16#4000#;
   FRERR_BUFFERLENGTHZERO : constant := 16#4001#;
   CCERR_CHOOSECOLORCODES : constant := 16#5000#;

end Win32.Cderr;
