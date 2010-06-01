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

with Convert;
with Interfaces.C;
with Win32;        use Win32;
with Win32.Windef;
with Win32.Wingdi;

package Poly is

   polyclass_str : aliased constant Win32.CHAR_Array := "POLYDEMO" & Nul;
   polytitle_str : aliased constant Win32.CHAR_Array :=
      "PolyBezier Demo" & Nul;
   POLYCLASS     : Win32.LPCSTR                      :=
      Convert.CP (polyclass_str);
   POLYTITLE     : Win32.LPCSTR                      :=
      Convert.CP (polytitle_str);

   MAX_BEZIER : constant := 80;
   VELMAX     : constant := 10;
   VELMIN     : constant := 2;
   BEZ_CURVES : constant := 1;
   BEZ_PTS    : constant := (3 * BEZ_CURVES) + 1;
   BEZ_PTS_DW : Win32.DWORD := 4;

   type pt_array is array (0 .. BEZ_PTS - 1) of aliased Win32.Windef.POINT;
   type pt_array_ptr is access all pt_array;

   type BEZBUFFER is record
      pPts : Win32.Wingdi.POINTL_Array (0 .. BEZ_PTS - 1);

   end record;
   type PBEZBUFFER is access BEZBUFFER;

   null_BEZBUFFER : BEZBUFFER;

   type BEZBUFFER_ARRAY is array (0 .. MAX_BEZIER - 1) of aliased BEZBUFFER;
   type PBEZBUFFER_ARRAY is access BEZBUFFER_ARRAY;

   type POLYDATA is record
      nBezTotal  : Integer; --Win32.INT;
      nBezCurr   : Integer; --Win32.INT;
      nColor     : Integer; --Win32.INT;
      pVel       : pt_array;
      hBezBuffer : Win32.Windef.HGLOBAL;
   end record;
   type PPOLYDATA is access POLYDATA;

   procedure CreatePolyWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT);

   function PolyProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, PolyProc);

   function PolyCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL;

   procedure PolyDestroyProc (hWnd_p : Win32.Windef.HWND);

   function PolyCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL;

   procedure PolyPaintProc (hWnd_p : Win32.Windef.HWND);

   procedure PolyRedraw (hWnd_p : Win32.Windef.HWND);

   function PolyNewVel (i : Win32.INT) return Win32.LONG;

   procedure PolyInitPoints (hWnd_p : Win32.Windef.HWND);

   procedure PolyDrawBez (hWnd_p : Win32.Windef.HWND);

end Poly;
