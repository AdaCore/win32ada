-- $Source$ 
-- $Revision$ $Date$ $Author$ 


with Ada.Command_Line;
with Ada.Unchecked_Conversion;
with Interfaces.C;
with ConnectPkg; use ConnectPkg;
with System;
with Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winmain;
with Win32.Winuser;

procedure Connect is

    use Win32;
    use Win32.Windef;
    use Win32.Wingdi;
    use Win32.Winuser;

    use type Interfaces.C.Char_Array;
    use type System.Address;
    use type Interfaces.C.Int;

    package Pkg renames ConnectPkg;

    IgnoredA : ATOM;
    IgnoredL : LONG;


    function CP (a: CHAR_Array) return LPCSTR is
        function UC1 is new Ada.Unchecked_Conversion(System.Address, LPCSTR);
    begin
        return UC1(a(a'FIRST)'ADDRESS);
    end CP;


    function WinMain (
	                  hInstance    : Win32.Windef.HINSTANCE;
	                  hPrevInstance: Win32.Windef.HINSTANCE;
	                  lpszCmdLine  : PCSTR;
	                  nCmdShow     : INT) return UINT is

	    szAppName    : constant CHAR_Array := "Connect" & Nul;
	    szMesLook    : constant CHAR_Array := 
	               "Connect-the-Dots Mouse Demo - in Ada" & Nul;
	    hwnd         : Win32.Windef.HWND;            use type Win32.UINT;

    begin
	if hPrevInstance = System.Null_Address then
	    Pkg.wndclass.style         := CS_HREDRAW or CS_VREDRAW;
	    Pkg.wndclass.lpfnWndProc   := Pkg.WndProc'access;
	    Pkg.wndclass.cbClsExtra    := 0;
	    Pkg.wndclass.cbWndExtra    := 0;
	    Pkg.wndclass.hInstance     := hInstance;
	    Pkg.wndclass.hIcon         := LoadIcon(System.Null_Address, 
	                                           LPCSTR(IDI_APPLICATION));
	    Pkg.wndclass.hCursor       := HCURSOR(LoadCursor(
                                                  System.Null_Address,
				                  LPCSTR(IDC_ARROW)));
	    Pkg.wndclass.hbrBackground := HBRUSH(GetStockObject(WHITE_BRUSH));
	    Pkg.wndclass.lpszMenuName  := null;
	    Pkg.wndclass.lpszClassName := CP(szAppName);

	    IgnoredA := RegisterClass(Pkg.wndclass'access);
	end if;

	hwnd := CreateWindow(
		 CP(szAppName), CP(szMesLook),
		 WS_OVERLAPPEDWINDOW,
		 CW_USEDEFAULT, CW_USEDEFAULT, 
		 CW_USEDEFAULT, CW_USEDEFAULT,
		 System.Null_Address, 
		 System.Null_Address, 
		 hInstance, 
		 System.Null_Address);

	Pkg.IgnoredB := ShowWindow(hwnd, nCmdShow);
	Pkg.IgnoredB := UpdateWindow(hwnd);

	while GetMessage(Pkg.msg'access, System.Null_Address, 0, 0) /= 0 loop
	    Pkg.IgnoredB := TranslateMessage(Pkg.msg'access);
	    IgnoredL := DispatchMessage(Pkg.msg'access);
	end loop;

        return Pkg.msg.wParam;
    end WinMain;


begin	-- Connect main body

    Ada.Command_Line.Set_Exit_Status(Ada.Command_Line.Exit_Status(
        WinMain(Win32.Winmain.Get_hInstance,
		Win32.Winmain.Get_hPrevInstance,
		Win32.Winmain.Get_lpCmdline,
		Win32.Winmain.Get_nCmdShow)));

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

end Connect;

