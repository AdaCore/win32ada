-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (C) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (C) 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

with Win32;         use Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winmain;
with Win32.Winuser;
with Win32.Ddeml;

with Ada.Unchecked_Conversion;
with Interfaces.C;
with Interfaces.C.Strings;

use type Interfaces.C.int; use type Interfaces.C.long;

package DdemoPkg is

   function DdeCallBack
     (wType     : Win32.UINT;
      wFmt      : Win32.UINT;
      hConv     : Ddeml.HCONV;
      hsz_topic : Ddeml.HSZ;
      hsz_item  : Ddeml.HSZ;
      hData     : Ddeml.HDDEDATA;
      lData1    : Win32.DWORD;
      lData2    : Win32.DWORD)
      return Ddeml.HDDEDATA;
   pragma Convention (Stdcall, DdeCallBack);

   function MainWndProc
     (HWND    : Windef.HWND;
      MESSAGE : Win32.UINT;
      WPARAM  : Win32.WPARAM;
      LPARAM  : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, MainWndProc);

   function CP (C_Str : CHAR_Array) return Win32.PCSTR;

   szTitle_str : aliased constant CHAR_Array := "DDEmo" & Nul;
   szTitle     : Win32.PCSTR;

   szApp_str : aliased constant CHAR_Array := "DDEmo" & Nul;
   szApp     : Win32.PCSTR;

   idInst  : aliased Win32.DWORD := 0;
   metrics : aliased Wingdi.TEXTMETRIC;
   wc      : aliased Win32.Winuser.WNDCLASS;

   hConvList  : Ddeml.HCONVLIST := 0;
   hszAppName : Ddeml.HSZ       := 0;
   hwndMain   : Windef.HWND;

   OurFormat : Win32.UINT;

   iResult    : Win32.INT;
   bResult    : Win32.BOOL;
   uResult    : Win32.UINT;
   hddeResult : Ddeml.HDDEDATA;

   cyText  : Win32.INT;
   cxText  : Win32.INT;
   cyTitle : Win32.INT;

end DdemoPkg;
