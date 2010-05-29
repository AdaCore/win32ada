-------------------------------------------------------------------------------
--
-- This program has been derived by Intermetrics, Inc. from the
-- keylook.c program in "Programming Windows 3.1", third edition,
-- by Charles Petzold, Microsoft Press.
-- The program is derived from source code which is restricted
-- by the license and under the following copyrights:
--
--      Copyright (c) 1992 by Charles Petzold
--
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
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (c) AdaCore 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with Interfaces.C;
with Stdarg;
with System;

package body Keylook_Pkg is

    -- aliased for function WndProc
    ps       : aliased Win32.Winuser.PAINTSTRUCT;
    tm       : aliased Win32.Wingdi.TEXTMETRIC;

    function CP(C_Str : Win32.CHAR_Array) return Win32.LPCSTR is
        function UC is new Ada.Unchecked_Conversion
                               (System.Address, Win32.LPCSTR);
    begin
        return UC(C_Str(C_Str'First)'Address);
    end CP;

    function To_DWORD is new Ada.Unchecked_Conversion(
        Win32.lParam, Win32.DWORD);

    use type Win32.Char_Array;                  -- to get "&"
    Nul: Win32.Char renames Win32.Nul;

    procedure ShowKey (
	hwnd   : Win32.Windef.HWND;
	iType  : Win32.INT;
	Message: Win32.CHAR_Array;
	wParam : Win32.UINT;
	lParam : Win32.LONG) is

	use type Interfaces.C.Int;		-- to get "-"
	use type Interfaces.C.Unsigned_Short;	-- to get "and"
	use type Interfaces.C.Unsigned_Long;	-- to get "and"

	F0: constant Win32.CHAR_Array := 
	    "%-14s %3d    %c %6u %4d %3s %3s %4s %4s" & Nul;
	F1: constant Win32.CHAR_Array := 
	    "%-14s %3d    %c %6u %4d %3s %3s %4s %4s" & Nul;

	type Sarray is array (Win32.INT range 0..1) of Win32.LPCSTR;
	szFormat: constant Sarray := (CP(F0), CP(F1));

	szBuffer: Win32.CHAR_Array(0..79);
	hdc     : Win32.Windef.HDC;
	-- dwLparam: constant Win32.DWORD := Win32.DWORD(lParam);
	dwLparam: constant Win32.DWORD := To_DWORD(lParam);

	-- Functions that replace the x?y:z expressions in the C version
	function charparam return Win32.CHAR is
	begin
	    if Itype /= 0 then
		return Win32.CHAR'Val(
		   Win32.Windef.LOWORD(Win32.DWORD(wParam)) and 16#ff#);
	    else
		return ' ';
	    end if;
	end;

	function bit25 return Win32.CHAR_Array is
	begin
	    if (dwLparam and 16#100_0000#) /= 0 then
		    return "Yes" & Nul;
	    else
		    return "No" & Nul;
	    end if;
	end;
	
	function bit30 return Win32.CHAR_Array is
	begin
	    if (dwLparam and 16#2000_0000#) /= 0 then
		return "Yes" & Nul;
	    else
		return "No" & Nul;
	    end if;
	end;
	
	function bit31 return Win32.CHAR_Array is
	begin
	    if (dwLparam and 16#4000_0000#) /= 0 then
		return "Down" & Nul;
	    else
		return "Up" & Nul;
	    end if;
	end;
	
	function bit32 return Win32.CHAR_Array is
	    use type Interfaces.C.LONG;
	begin
	    if lParam < 0 then 
	        return "Up" & Nul; 
	    else 
	        return "Down" & Nul; 
	    end if;
	end;


	-- use name "+" to avoid conflict with Standard."&" for strings.
	function "+" (Args: Stdarg.ArgList; Arg: Win32.Char_Array)
	    return Stdarg.ArgList is
	    function "&" is new Stdarg.Concat(Win32.LPCSTR);
	begin
	    return Args & CP(Arg);
	end "+";

	function "&" is new Stdarg.Concat(Win32.BYTE);
	function "&" is new Stdarg.Concat(Win32.CHAR);
	function "&" is new Stdarg.Concat(Win32.WORD);
	function "&" is new Stdarg.Concat(Win32.UINT);

    begin	-- ShowKey
	IgnoredB := Win32.Winuser.ScrollWindow(
			hwnd, 0, -cyChar, rect'access, rect'access);
	hdc := Win32.Winuser.GetDC(hwnd);
	IgnoredH := Win32.Wingdi.SelectObject(hdc,
	    Win32.Wingdi.GetStockObject(Win32.Wingdi.SYSTEM_FIXED_FONT));
	IgnoredB := Win32.Wingdi.TextOut(
	    hdc, cxChar, Win32.INT(rect.bottom) - cyChar, 
	    CP(szBuffer),
	    Win32.Winuser.wsprintf(
	        szBuffer(0)'unchecked_access,	        -- buffer
	        szFormat(iType),	                -- format
	        (Stdarg.Empty +
	          Message) &		                -- message name
	          wParam &		                -- key
	          charparam &		                -- char
	          Win32.Windef.LOWORD(dwlParam) &	-- repeat count
	          Win32.Windef.LOBYTE(Win32.Windef.HIWORD(dwlParam)) +
		  					-- scan code
	          bit25 + bit30 + bit31 + bit32));	-- 4 bit fields

	IgnoredI := Win32.Winuser.ReleaseDC(hwnd, hdc);
	IgnoredB := Win32.Winuser.ValidateRect(hwnd, null);
    end ShowKey;

    szTop   : constant Win32.CHAR_Array :=
              "Message        Key Char Repeat Scan Ext ALT Prev Tran" & Nul;
    szUnd   : constant Win32.CHAR_Array :=
              "Message        ___ ____ ______ ____ ___ ___ ____ ____" & Nul;

    function WndProc (hwnd:   Win32.Windef.HWND;
                      msg:    Win32.UINT;
                      wParam: Win32.WPARAM;
                      lParam: Win32.LPARAM) return Win32.LRESULT is

        use type Interfaces.C.int;      -- to get '*'
        use type Interfaces.C.long;     -- to get '*'

        hdc     : Win32.Windef.HDC;
        -- dwLparam: constant Win32.DWORD := Win32.DWORD(lParam);
        dwLparam: constant Win32.DWORD := To_DWORD(lParam);

    begin
        case msg is
            when Win32.Winuser.WM_CREATE =>
                hdc      := Win32.Winuser.GetDC(hwnd);
                IgnoredH := Win32.Wingdi.SelectObject(hdc,
                                     Win32.Wingdi.GetStockObject(
                                     Win32.Wingdi.SYSTEM_FIXED_FONT));
                IgnoredB := Win32.Wingdi.GetTextMetrics(hdc, tm'access);
                cxChar   := Win32.INT(tm.tmAveCharWidth);
                cyChar   := Win32.INT(tm.tmHeight);
                IgnoredI := Win32.Winuser.ReleaseDC(hwnd, hdc);
                rect.top := 3 * Win32.LONG(cyChar)/2;

            when Win32.Winuser.WM_SIZE =>
                rect.right  := Win32.LONG(Win32.Windef.LOWORD(dwlParam));
                rect.bottom := Win32.LONG(Win32.Windef.HIWORD(dwLparam));
                IgnoredB    := Win32.Winuser.UpdateWindow(hwnd);

            when Win32.Winuser.WM_PAINT =>
                IgnoredB := Win32.Winuser.InvalidateRect(hwnd, null,
                                        Win32.TRUE);
                hdc      := Win32.Winuser.BeginPaint(hwnd, ps'access);
                IgnoredH := Win32.Wingdi.SelectObject(hdc,
                                     Win32.Wingdi.GetStockObject(
                                     Win32.Wingdi.SYSTEM_FIXED_FONT));
                IgnoredI := Win32.Wingdi.SetBkMode(hdc,
                                                   Win32.Wingdi.TRANSPARENT);
                IgnoredB := Win32.Wingdi.TextOut(hdc, cxChar, cyChar/2,
                                        CP(szTop), szTop'Length-1);
                IgnoredB := Win32.Wingdi.TextOut(hdc, cxChar, cyChar/2,
                                         CP(szUnd), szUnd'Length-1);
                IgnoredB := Win32.Winuser.EndPaint(hwnd, ps'access);

            when Win32.Winuser.WM_KEYDOWN =>
                ShowKey(hwnd, 0, "WM_KEYDOWN" & Nul,     wParam, lParam);

            when Win32.Winuser.WM_KEYUP =>
                ShowKey(hwnd, 0, "WM_KEYUP" & Nul,       wParam, lParam);

            when Win32.Winuser.WM_CHAR =>
                ShowKey(hwnd, 1, "WM_CHAR" & Nul,        wParam, lParam);

            when Win32.Winuser.WM_DEADCHAR =>
                ShowKey(hwnd, 1, "WM_DEADCHAR" & Nul,    wParam, lParam);

            when Win32.Winuser.WM_SYSKEYDOWN =>
                ShowKey(hwnd, 0, "WM_SYSKEYDOWN" & Nul,  wParam, lParam);

            when Win32.Winuser.WM_SYSKEYUP =>
                ShowKey(hwnd, 0, "WM_SYSKEYUP" & Nul,    wParam, lParam);

            when Win32.Winuser.WM_SYSCHAR =>
                ShowKey(hwnd, 1, "WM_SYSCHAR" & Nul,     wParam, lParam);

            when Win32.Winuser.WM_SYSDEADCHAR =>
                ShowKey(hwnd, 1, "WM_SYSDEADCHAR" & Nul, wParam, lParam);

            when Win32.Winuser.WM_DESTROY =>
                Win32.Winuser.PostQuitMessage(0);

            when others =>
                return Win32.Winuser.DefWIndowProc(hwnd, msg, wParam, lParam);
        end case;

        return 0;       -- all cases except "others" end up here
    end WndProc;

end Keylook_Pkg;
