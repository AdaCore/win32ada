-- $Source$ 
-- $Revision$ $Date$ $Author$ 

with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;
with Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winmain;
with Win32.Winuser;

package body ConnectPkg is

    use Win32;
    use Win32.Windef;
    use Win32.Wingdi;
    use Win32.Winuser;

    use type Interfaces.C.Char_Array;
    use type System.Address;
    use type Interfaces.C.Int;


    MAXPOINTS: constant := 1000;
    type       POINT_Array is array(0..MAXPOINTS-1) of POINTS;
    points   : POINT_Array;
    nCount   : Integer := 0;

    function WndProc (hwnd   : Win32.Windef.HWND;
		              msg    : Win32.UINT;
		              wParam : Win32.WPARAM;
		              lParam : Win32.LPARAM) return Win32.LRESULT is

	    hdc     : Win32.Windef.HDC;
            function To_DWORD is new Ada.Unchecked_Conversion
                (Win32.LPARAM, Win32.DWORD);
	    dwLparam: constant Win32.DWORD := To_DWORD(lParam);
            IgnoredC: Win32.Windef.COLORREF;
            IgnoredI: Win32.INT;

	    use type Interfaces.C.Unsigned;     -- to get "and"
    begin
	    case msg is
        when WM_LBUTTONDOWN =>
	        nCount := 0;
	        IgnoredB := InvalidateRect(hwnd, null, Win32.TRUE);

        when WM_MOUSEMOVE =>
	        if(((wParam and MK_LBUTTON) /= 0) and (nCount < MAXPOINTS)) then
	            points(nCount) := MAKEPOINTS(dwlParam);
	            nCount         := nCount + 1;
	            hdc            := GetDC(hwnd);
	            IgnoredC       := SetPixel(hdc, INT(LOWORD(dwLparam)), 
	                                       INT(HIWORD(dwLparam)), 0);
	            IgnoredI       := ReleaseDC(hwnd, hdc);
	        end if;

        when WM_LBUTTONUP =>
	        IgnoredB := InvalidateRect(hwnd, null, Win32.FALSE);

        when WM_PAINT =>
	        hdc := BeginPaint(hwnd, ps'access);

	        for i in 0..nCount -2 loop
	            for j in 1..nCount-1 loop
		            IgnoredB := MoveToEx(hdc, INT(points(i).x), 
		                                 INT(points(i).y), null);
		            IgnoredB := LineTo(hdc, INT(points(j).x), 
					                   INT(points(j).y));
			    end loop;
			end loop;

	        IgnoredB := EndPaint(hwnd, ps'access);

        when WM_DESTROY =>
	        PostQuitMessage(0);

        when others =>
	        return DefWIndowProc(hwnd, msg, wParam, lParam);
	    end case;

	    return 0;   -- all cases but "others" end up here
    end WndProc;

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
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED "AS IS" WITHOUT 
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT 
-- LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR 
-- A PARTICULAR PURPOSE.  The user assumes the entire risk as to the accuracy 
-- and the use of this file.  This file may be used only by licensees of 
-- Microsoft Corporation's WIN32 Software Development Kit in accordance with 
-- the terms of the licensee's End-User License Agreement for Microsoft 
-- Software for the WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are 
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end ConnectPkg;
