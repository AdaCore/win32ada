-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  package Poly specification
--
--  This specification is a translation of poly.h which is part of the
--  Microsoft gdidemo sample application.


with Convert;
with Interfaces.C;
with Win32;  use Win32;
with Win32.WinDef;
with Win32.WinGdi;

package Poly is

  polyclass_str : aliased constant Win32.CHAR_ARRAY := "POLYDEMO" & Nul;
  polytitle_str : aliased constant Win32.CHAR_ARRAY := "PolyBezier Demo" & Nul;
  POLYCLASS : Win32.LPCSTR := Convert.CP(polyclass_str);
  POLYTITLE : Win32.LPCSTR := Convert.CP(polytitle_str); 

  MAX_BEZIER : constant :=  80;
  VELMAX     : constant :=  10;
  VELMIN     : constant :=  2;
  -- Number of Curves in the Bezier
  BEZ_CURVES : constant :=  1; 
  -- Number of Points is the #Curves * 3 + 1 
  BEZ_PTS    : constant := (3 * BEZ_CURVES) + 1;  
  BEZ_PTS_DW : Win32.DWORD := 4;

  -- /*
  -- ** This structue defines a basic bezier curve.  It is intended to be
  -- ** used in an array of beziers.
  -- */
  type pt_array is array (0 .. BEZ_PTS-1) of 
                                           aliased Win32.WinDef.POINT;
  type pt_array_ptr is access all pt_array;

  type BEZBUFFER is record
--    pPts : pt_array;
    --MPS pPts : Win32.Wingdi.pointl_array; 
    pPts : Win32.Wingdi.pointl_array(0..BEZ_PTS-1); 

  end record;
  type PBEZBUFFER is access BEZBUFFER;

  null_BEZBUFFER : BEZBUFFER;

  -- Create an array of BEZBUFFER to keep track of all of the curves in the
  -- window.
  -- type BEZBUFFER_ARRAY is array (Natural range <>) of aliased BEZBUFFER;
  type BEZBUFFER_ARRAY is array (0 .. MAX_BEZIER - 1) of aliased BEZBUFFER;
  type PBEZBUFFER_ARRAY is access BEZBUFFER_ARRAY;

  -- /*
  -- ** This is the main object for the polybezier window.  This structure
  -- ** defines a series of bezier curves and the distance between each curve.
  -- */
  type POLYDATA is record
    nBezTotal  : integer; --Win32.INT;
    nBezCurr   : integer; --Win32.INT;
    nColor     : integer; --Win32.INT;
    pVel       : pt_array;
    hBezBuffer : Win32.Windef.HGLOBAL;
  end record;
  type PPOLYDATA is access POLYDATA;

  -- /*
  -- ** POLYBEZIER WINDOW ROUTINES (poly.adb)
  -- */

  procedure CreatePolyWindow (hWndClient : Win32.WinDef.HWND;
                              nItem      : Win32.INT);

  function PolyProc (hWnd_p   : Win32.WinDef.HWND;
                     wMsg     : Win32.UINT;
                     wParam_p : Win32.WPARAM;
                     lParam_p : Win32.LPARAM) return Win32.LRESULT;
  pragma Convention (Stdcall, PolyProc);

  function PolyCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL;

  procedure PolyDestroyProc (hWnd_p : Win32.WinDef.HWND);

  function PolyCommandProc (hWnd_p : Win32.WinDef.HWND;
                            wParam_p : Win32.WPARAM;
                            lParam_p : Win32.LPARAM) return Win32.BOOL;

  procedure PolyPaintProc (hWnd_p : Win32.WinDef.HWND);

  procedure PolyRedraw (hWnd_p : Win32.WinDef.HWND);

  function PolyNewVel (i : Win32.INT) return Win32.LONG;

  procedure PolyInitPoints (hWnd_p : Win32.WinDef.HWND);

  procedure PolyDrawBez (hWnd_p : Win32.WinDef.HWND);

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

end Poly;
