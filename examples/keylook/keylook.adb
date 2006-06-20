-- $Source$ 
-- $Revision$ $Date$ $Author$ 

with Ada.Command_Line;
with Interfaces.C;
with Interfaces.C.Strings;
with Keylook_Pkg; use Keylook_Pkg;
with Stdarg;
with Stdarg.Inst;
with System;
with Win32; use Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winmain;
with Win32.Winuser;


procedure KeyLook is

    -- global variables, visible to all procedures:
    IgnoredL : Win32.LONG;
    IgnoredA : Win32.Windef.ATOM;


    function WinMain(
	HINSTANCE    : Win32.Windef.HINSTANCE;
	hPrevInstance: Win32.Windef.HINSTANCE;
	lpszCmdLine  : Win32.PCSTR;
	nCmdShow     : Win32.INT) return Win32.WPARAM is

	use type Interfaces.C.INT;
	use type System.Address;	
	use type Win32.UINT;

	szAppName    : constant Win32.CHAR_Array := "KeyLook" & Nul;
	szMesLook    : constant Win32.CHAR_Array := 
		       "Keyboard Message Looker - in Ada" & Nul;
	hwnd         : Win32.Windef.HWND;
    begin
	if hPrevInstance = System.Null_Address then
	    wndclass.style         := Win32.Winuser.CS_HREDRAW or
				                  Win32.Winuser.CS_VREDRAW;
	    wndclass.lpfnWndProc   := WndProc'access;
	    wndclass.cbClsExtra    := 0;
	    wndclass.cbWndExtra    := 0;
	    wndclass.hInstance     := hInstance;
	    wndclass.hIcon         := Win32.Winuser.LoadIcon(System.Null_Address, 
	                              Win32.LPCSTR(Win32.Winuser.IDI_APPLICATION));
	    wndclass.hCursor       := Win32.Windef.HCURSOR(
	                              Win32.Winuser.LoadCursor(System.Null_Address, 
				      Win32.LPCSTR(Win32.Winuser.IDC_ARROW)));
	    wndclass.hbrBackground := Win32.Windef.HBRUSH(
					 Win32.Wingdi.GetStockObject(
					 Win32.Wingdi.WHITE_BRUSH));
	    wndclass.lpszMenuName  := null;
	    wndclass.lpszClassName := CP(szAppName);

	    IgnoredA := Win32.Winuser.RegisterClass(wndclass'access);
	end if;

	hwnd := Win32.Winuser.CreateWindow(
		     CP(szAppName),
		     CP(szMesLook),
		     Win32.Winuser.WS_OVERLAPPEDWINDOW,
		     Win32.Winuser.CW_USEDEFAULT,
		     Win32.Winuser.CW_USEDEFAULT,
		     Win32.Winuser.CW_USEDEFAULT,
		     Win32.Winuser.CW_USEDEFAULT,
		     System.Null_Address, 
		     System.Null_Address, 
		     hInstance, 
		     System.Null_Address);

	IgnoredB := Win32.Winuser.ShowWindow(hwnd, nCmdShow);
	IgnoredB := Win32.Winuser.UpdateWindow(hwnd);

	while Win32.Winuser.GetMessage(msg'access,System.Null_Address,0,0) /= 0 loop
	    IgnoredB := Win32.Winuser.TranslateMessage(msg'access);
	    IgnoredL := Win32.Winuser.DispatchMessage(msg'access);
	end loop;

	return msg.wParam;
    end WinMain;


begin	-- Keylook main body

    Ada.Command_Line.Set_Exit_Status(Ada.Command_Line.Exit_Status(WinMain(
			Win32.Winmain.Get_hInstance,
			Win32.Winmain.Get_hPrevInstance,
			Win32.Winmain.Get_lpCmdline,
			Win32.Winmain.Get_nCmdShow)));

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
-------------------------------------------------------------------------------
end KeyLook;
