-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

package Win32.crt.Limits is

    CHAR_BIT   : constant := 8;                             -- limits.h:17
    SCHAR_MIN  : constant := -128;                          -- limits.h:18
    SCHAR_MAX  : constant := 127;                           -- limits.h:19
    UCHAR_MAX  : constant := 16#ff#;                        -- limits.h:20
    CHAR_MIN   : constant := -128;                          -- limits.h:23
    CHAR_MAX   : constant := 127;                           -- limits.h:24
    MB_LEN_MAX : constant := 2;                             -- limits.h:30
    SHRT_MIN   : constant := -32768;                        -- limits.h:31
    SHRT_MAX   : constant := 32767;                         -- limits.h:32
    USHRT_MAX  : constant := 16#ffff#;                      -- limits.h:33
    INT_MIN    : constant := -2147483648;                   -- limits.h:34
    INT_MAX    : constant := 2147483647;                    -- limits.h:35
    UINT_MAX   : constant := 16#ffffffff#;                  -- limits.h:36
    LONG_MIN   : constant := -2147483648;                   -- limits.h:37
    LONG_MAX   : constant := 2147483647;                    -- limits.h:38
    ULONG_MAX  : constant := 16#ffffffff#;                  -- limits.h:39

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

end Win32.crt.Limits;
