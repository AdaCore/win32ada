-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32;
with Win32.crt.Strings;

package Win32.crt.Memory is
    
    function memccpy(dest : Win32.PVOID;
                     src  : Win32.PCVOID;
                     ch   : Win32.INT;
                     count: Win32.UINT)
                         return Win32.PVOID
                         renames Win32.crt.Strings.memccpy; -- memory.h:53

    function memchr(buf  : Win32.PCVOID;
                    ch   : Win32.INT;
                    count: Win32.size_t)
                        return Win32.PVOID
                        renames Win32.crt.Strings.memchr;   -- memory.h:54

    function memcmp(buf1 : Win32.PCVOID;
                    buf2 : Win32.PCVOID;
                    count: Win32.size_t)
                        return Win32.INT
                        renames Win32.crt.Strings.memcmp;   -- memory.h:55

    function memcpy(dest : Win32.PVOID;
                    src  : Win32.PCVOID;
                    count: Win32.size_t)
                        return Win32.PVOID
                        renames Win32.crt.Strings.memcpy;   -- memory.h:56

    function memicmp(buf1 : Win32.PCVOID;
                     buf2 : Win32.PCVOID;
                     count: Win32.UINT)
                         return Win32.INT
                         renames Win32.crt.Strings.memicmp; -- memory.h:57

    function memset(dest : Win32.PVOID;
                    ch   : Win32.INT;
                    count: Win32.size_t)
                        return Win32.PVOID
                        renames Win32.crt.Strings.memset;   -- memory.h:58

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

end Win32.crt.Memory;
