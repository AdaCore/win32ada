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

with Win32;
with Win32.Windef;
with Interfaces.C;
with Convert;

package Draw is

   drawclass_str : aliased constant Win32.CHAR_Array := "DRAWDEMO";
   drawtitle_str : aliased constant Win32.CHAR_Array := "Random Objects Demo";
   DRAWCLASS     : Win32.LPCSTR                      :=
      Convert.CP (drawclass_str);
   DRAWTITLE     : Win32.LPCSTR                      :=
      Convert.CP (drawtitle_str);

   OBJ_RECTANGLE : constant := 0;
   OBJ_ELLIPSE   : constant := 1;
   OBJ_ROUNDRECT : constant := 2;
   OBJ_CHORD     : constant := 3;
   OBJ_PIE       : constant := 4;

   type DRAWDATA is record
      nObject : Win32.INT;
   end record;
   type PDRAWDATA is access DRAWDATA;

   procedure CreateDrawWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT);

   function DrawProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, DrawProc);

   function DrawCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL;

   procedure DrawDestroyProc (hWnd_p : Win32.Windef.HWND);

   function DrawCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL;

   procedure DrawPaintProc (hwnd_p : Win32.Windef.HWND);

   procedure DrawObject (hwnd_p : Win32.Windef.HWND);

end Draw;
