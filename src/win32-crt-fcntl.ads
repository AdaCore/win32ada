-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

package Win32.crt.Fcntl is

    O_RDONLY                       : constant := 16#0#;     -- fcntl.h:17
    O_WRONLY                       : constant := 16#1#;     -- fcntl.h:18
    O_RDWR                         : constant := 16#2#;     -- fcntl.h:19
    O_APPEND                       : constant := 16#8#;     -- fcntl.h:20
    O_CREAT                        : constant := 16#100#;   -- fcntl.h:22
    O_TRUNC                        : constant := 16#200#;   -- fcntl.h:23
    O_EXCL                         : constant := 16#400#;   -- fcntl.h:24
    O_TEXT                         : constant := 16#4000#;  -- fcntl.h:30
    O_BINARY                       : constant := 16#8000#;  -- fcntl.h:31
    O_RAW                          : constant := 16#8000#;  -- fcntl.h:35
    O_NOINHERIT                    : constant := 16#80#;    -- fcntl.h:39
    O_TEMPORARY                    : constant := 16#40#;    -- fcntl.h:43
    O_SHORT_LIVED                  : constant := 16#1000#;  -- fcntl.h:47
    O_SEQUENTIAL                   : constant := 16#20#;    -- fcntl.h:51
    O_RANDOM                       : constant := 16#10#;    -- fcntl.h:52

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.crt.Fcntl;
