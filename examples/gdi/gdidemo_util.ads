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

with Interfaces.C;
with Win32;
with Win32.Windef;
with Win32.Winnt;

package Gdidemo_Util is

   APPMENU  : constant := 1000;
   APPICON  : constant := 1001;
   ABOUTBOX : constant := 1002;

   IDM_DEMO_POLYBEZIER : constant := 100;
   IDM_DEMO_XFORM      : constant := 101;
   IDM_DEMO_MAZE       : constant := 102;
   IDM_DEMO_DRAW       : constant := 103;
   IDM_DEMO_BOUNCE     : constant := 104;

   IDM_WINDOW_CASCADE : constant := 200;
   IDM_WINDOW_TILE    : constant := 201;
   IDM_WINDOW_ICON    : constant := 202;
   IDM_HELP_ABOUT     : constant := 900;

   COLOR_SCALE_RED   : constant := 1;
   COLOR_SCALE_GREEN : constant := 2;
   COLOR_SCALE_BLUE  : constant := 3;
   COLOR_SCALE_GRAY  : constant := 4;

   CLIENTWND : constant := 0;

   function WndProc
     (hWndFrame : Win32.Windef.HWND;
      wMsg      : Win32.UINT;
      wParam_p  : Win32.WPARAM;
      lParam_p  : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, WndProc);

   function CreateProc (hWndFrame : Win32.Windef.HWND) return Win32.BOOL;

   procedure DestroyProc (hWndFrame : Win32.Windef.HWND);

   function CommandProc
     (hWndFrame : Win32.Windef.HWND;
      wParam_p  : Win32.WPARAM;
      lParam_p  : Win32.LPARAM)
      return Win32.BOOL;

   procedure PaintProc (hWndFrame : Win32.Windef.HWND);

   function lRandom return Win32.LONG;
   function lRandom return Win32.DWORD;

   function GETINSTANCE
     (hWnd_p : Win32.Windef.HWND)
      return Win32.Winnt.HANDLE;
   function GETCLASSBRUSH
     (hWnd_p : Win32.Windef.HWND)
      return Win32.Windef.HBRUSH;

end Gdidemo_Util;
