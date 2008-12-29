-- $Source$ 
-- $Revision$ $Date$ $Author$ 


with Win32;	use Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.WinMain;
with Win32.Winuser;
with Win32.DDEML;

with Ada.Unchecked_Conversion;
with Interfaces.C;
with Interfaces.C.Strings;

use type Interfaces.C.INT;
use type Interfaces.C.LONG;


package DdemoPkg is

    function DdeCallBack(wType: 	Win32.UINT;
                         wFmt:      Win32.UINT;
                         hConv: 	DDEML.HCONV;
                         hsz_topic: DDEML.HSZ;
                         hsz_item: 	DDEML.HSZ;
                         hData: 	DDEML.HDDEDATA;
                         lData1: 	Win32.DWORD;
                         lData2: 	Win32.DWORD) return DDEML.HDDEDATA;
    pragma Convention (Stdcall, DdeCallBack);

    function MainWndProc(HWND    : Windef.HWND;
                         MESSAGE : Win32.UINT;
                         WPARAM  : Win32.WPARAM;
                         LPARAM  : Win32.LPARAM) return Win32.LRESULT;
    pragma Convention (Stdcall, MainWndProc);


    function CP(C_Str: CHAR_Array) return Win32.PCSTR;


    szTitle_str: aliased constant CHAR_Array := 
                     "DDEmo" & Nul;     -- App Title
    szTitle:     Win32.PCSTR;

    szApp_str:   aliased constant CHAR_Array :=
                     "DDEmo" & Nul;     -- DDE service name
    szApp:       Win32.PCSTR;



    idInst:  aliased Win32.DWORD := 0;  -- our DDEML instance object
    metrics: aliased Wingdi.TEXTMETRIC;
    wc:      aliased Win32.Winuser.WNDCLASS;

    hConvList:  DDEML.HCONVLIST := 0;   -- the list of all convs we have open
    hszAppName: DDEML.HSZ       := 0;   -- the generic hsz for everything
    hwndMain:   WinDef.HWND;            -- our main window handle

    OurFormat:  Win32.UINT;             -- our custom registered format


    -- define dummy variables to hold results of function calls
    iResult    : Win32.INT;
    bResult    : Win32.BOOL;
    uResult    : Win32.UINT;
    hddeResult : DDEML.HDDEDATA;


    cyText:  Win32.INT;   	            -- sizes for painting
    cxText:  Win32.INT;
    cyTitle: Win32.INT;

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

end DdemoPkg;
