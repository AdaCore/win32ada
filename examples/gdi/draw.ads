-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  package Draw specification
--
--  This package is a translation of C files draw.[hc] which are part of the
--  Microsoft gdidemo sample application.
--

with Win32;
with Win32.WinDef;
with Interfaces.C;
with Convert;

package Draw is

  drawclass_str : aliased constant Win32.CHAR_ARRAY := "DRAWDEMO";
  drawtitle_str : aliased constant Win32.CHAR_ARRAY := "Random Objects Demo";
  DRAWCLASS : Win32.LPCSTR := Convert.CP(drawclass_str);
  DRAWTITLE : Win32.LPCSTR := Convert.CP(drawtitle_str); 

  OBJ_RECTANGLE : constant :=      0;
  OBJ_ELLIPSE   : constant :=      1;
  OBJ_ROUNDRECT : constant :=      2;
  OBJ_CHORD     : constant :=      3;
  OBJ_PIE       : constant :=      4;

  type DRAWDATA is record
    nObject : Win32.INT;
  end record;
  type PDRAWDATA is access DRAWDATA;

  -- /*
  -- ** DRAW WINDOW ROUTINES (draw.c)
  -- */

  procedure CreateDrawWindow (hWndClient : Win32.WinDef.HWND;
                              nItem      : Win32.INT);

  function DrawProc (hWnd_p   : Win32.WinDef.HWND;
                     wMsg     : Win32.UINT;
                     wParam_p : Win32.WPARAM;
                     lParam_p : Win32.LPARAM) return Win32.LRESULT;
  pragma Convention (Stdcall, DrawProc); 

  function DrawCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL;

  procedure DrawDestroyProc (hWnd_p : Win32.WinDef.HWND);

  function DrawCommandProc (hWnd_p   : Win32.WinDef.HWND;
                            wParam_p : Win32.WPARAM;
                            lParam_p : Win32.LPARAM) return Win32.BOOL;

  procedure DrawPaintProc (hwnd_p : Win32.WinDef.HWND);

  procedure DrawObject (hwnd_p : Win32.WinDef.HWND);

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

end Draw;
