-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

package Win32.Odbcver is

    use type Interfaces.C.Char_Array;

    VER_FILEVERSION_STR    : constant CHAR_Array := " 2.00.15100" & Nul;
                                                            -- odbcver.h:14
    VER_PRODUCTVERSION_STR : constant CHAR_Array := " 2.00.15100" & Nul;
                                                            -- odbcver.h:16
    VER_FILEFLAGSMASK      : constant := 16#3#;             -- odbcver.h:18
    VER_FILEFLAGS          : constant := 0;                 -- odbcver.h:22
    VER_FILEOS             : constant := 16#40004#;         -- odbcver.h:26
    VER_COMPANYNAME_STR    : constant CHAR_Array := 
                             "Microsoft Corporation" & Nul; -- odbcver.h:31
    VER_PRODUCTNAME_STR    : constant CHAR_Array := 
                             "Microsoft Open Database Connectivity" & Nul;
                                                            -- odbcver.h:32

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

end Win32.Odbcver;
