-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32;
with Win32.crt.Strings;
with Win32.crt.Stdlib;

package Win32.crt.Stddef is

    -- For the C macro offsetof(s,m) use the Ada 95 R.C'Position attribute

    errno: Interfaces.C.Int renames Win32.crt.Stdlib.errno; -- stddef.h:61

    subtype ptrdiff_t is interfaces.c.ptrdiff_t;            -- stddef.h:70

    subtype size_t is Win32.size_t;                         -- stddef.h:75

    subtype wchar_t is Win32.wchar_t;                       -- stddef.h:80

    function threadid return Win32.ULONG;                   -- stddef.h:90

    function threadhandle return Win32.ULONG;               -- stddef.h:91

private

    pragma Import(C, threadid, "__threadid");
    pragma Import(C, threadhandle, "__threadhandle");

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

end Win32.crt.Stddef;
