-- $Source$ 
-- $Revision$ $Date$ $Author$ 

with Win32;
with Win32.Windef;
with Win32.Winuser;


package ConnectPkg is

    IgnoredB : Win32.BOOL;
 
    ps       : aliased Win32.Winuser.PAINTSTRUCT;     -- WndProc
    msg      : aliased Win32.Winuser.MSG;             -- WinMain
    wndclass : aliased Win32.Winuser.WNDCLASS;        -- WinMain

    function WndProc (hwnd   : Win32.Windef.HWND;
                      msg    : Win32.UINT;
                      wParam : Win32.WPARAM;
                      lParam : Win32.LPARAM) return Win32.LRESULT;

    pragma Convention(Stdcall, WndProc);              -- Important !

    
-------------------------------------------------------------------------------
--
-- This program has been derived by Intermetrics, Inc. from the 
-- connect.c program in "Programming Windows 3.1", third edition, 
-- by Charles Petzold, Microsoft Press.
-- The program is derived from source code which is restricted 
-- by the license and under the following copyrights:
--
--      Copyright (c) 1992 by Charles Petzold
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

end ConnectPkg; 
