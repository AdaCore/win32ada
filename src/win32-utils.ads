-- $Source$ 
-- $Revision$ $Date$ $Author$
-- See end of file for Copyright (c) information.

package Win32.Utils is
    -- Unsigned types:
    subtype BYTE  is Win32.BYTE;
    subtype WORD  is Win32.WORD;
    subtype DWORD is Win32.DWORD;

    -- windef.h
    function MAKEWORD(Low, High: BYTE) return WORD;

    function MAKELONG(Low, High: WORD) return DWORD;

    function LOWORD(L: DWORD) return WORD;

    function HIWORD(L: DWORD) return WORD;

    function LOBYTE(W: WORD) return BYTE;

    function HIBYTE(W: WORD) return BYTE;

private

    pragma Inline(MAKEWORD);
    pragma Inline(MAKELONG);
    pragma Inline(LOWORD);
    pragma Inline(HIWORD);
    pragma Inline(LOBYTE);
    pragma Inline(HIBYTE);

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT 
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
-- TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR 
-- PURPOSE.  The user assumes the entire risk as to the accuracy and the 
-- use of this file.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Royalty-free, unlimited, worldwide, non-exclusive use, modification, 
-- reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------

end Win32.Utils;
