-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

package Win32.Lmapibuf is

    function NetApiBufferAllocate(
                ByteCount: Win32.DWORD;
                Buffer   : access Win32.LPVOID)
               return Win32.DWORD;                          -- lmapibuf.h:48

    function NetApiBufferFree(
                Buffer: Win32.LPVOID)
               return Win32.DWORD;                          -- lmapibuf.h:54

    function NetApiBufferReallocate(
                OldBuffer   : Win32.LPVOID;
                NewByteCount: Win32.DWORD;
                NewBuffer   : access Win32.LPVOID)
               return Win32.DWORD;                          -- lmapibuf.h:59

    function NetApiBufferSize(
                Buffer   : Win32.LPVOID;
                ByteCount: Win32.LPDWORD)
               return Win32.DWORD;                          -- lmapibuf.h:66

    function NetapipBufferAllocate(
                ByteCount: Win32.DWORD;
                Buffer   : access Win32.LPVOID)
               return Win32.DWORD;                          -- lmapibuf.h:77

private

    pragma Import(Stdcall, NetApiBufferAllocate, "NetApiBufferAllocate");
                                                            -- lmapibuf.h:48
    pragma Import(Stdcall, NetApiBufferFree, "NetApiBufferFree"); -- lmapibuf.h:54
    pragma Import(Stdcall, NetApiBufferReallocate, "NetApiBufferReallocate");
                                                            -- lmapibuf.h:59
    pragma Import(Stdcall, NetApiBufferSize, "NetApiBufferSize"); -- lmapibuf.h:66
    pragma Import(Stdcall, NetapipBufferAllocate, "NetapipBufferAllocate");
                                                            -- lmapibuf.h:77

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

end Win32.Lmapibuf;
