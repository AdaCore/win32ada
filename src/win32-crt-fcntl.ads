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

package Win32.crt.Fcntl is

   O_RDONLY      : constant := 16#0#;
   O_WRONLY      : constant := 16#1#;
   O_RDWR        : constant := 16#2#;
   O_APPEND      : constant := 16#8#;
   O_CREAT       : constant := 16#100#;
   O_TRUNC       : constant := 16#200#;
   O_EXCL        : constant := 16#400#;
   O_TEXT        : constant := 16#4000#;
   O_BINARY      : constant := 16#8000#;
   O_RAW         : constant := 16#8000#;
   O_NOINHERIT   : constant := 16#80#;
   O_TEMPORARY   : constant := 16#40#;
   O_SHORT_LIVED : constant := 16#1000#;
   O_SEQUENTIAL  : constant := 16#20#;
   O_RANDOM      : constant := 16#10#;

end Win32.crt.Fcntl;
