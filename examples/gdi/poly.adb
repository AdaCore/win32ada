-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- 
-- $Id$
--
--  package Poly body
--
--  This is a translation of poly.c, which is part of the Microsoft gdidemo
--  sample application.  Implementation of this in Ada required some design
--  change to do away with some fance C pointer arithmetic which just wasn't
--  translating well.
-- 
-- | POLYBEZIER MODULE
-- |   This module contains the routines for demo

with Ada.Unchecked_Conversion;
with Convert;
with Gdidemo_Util;
with Interfaces.C.Pointers;
with System;
with Win32;  use Win32;
with Win32.WinBase;
with Win32.WinDef;
with Win32.WinGdi;
with Win32.Winnt;
with Win32.WinUser;
with Wininfo;

use Interfaces.C;

package body Poly is 

  use type System.Address;

  -- dummy return parameters
  bResult : Win32.BOOL := Win32.TRUE;
  uResult : Win32.UINT;
  iResult : Win32.INT;
  lReturn : Win32.LRESULT;
  hGResult : Win32.Windef.HGLOBAL;

  -- conversion utilities
  function HANDLE_TO_PPOLYDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE, PPOLYDATA);
  function LPVOID_TO_PBEZBUFFER is new Ada.Unchecked_Conversion (
      Win32.LPVOID, PBEZBUFFER);
  function TO_AC_POINT_T is new Ada.Unchecked_Conversion (
      pt_array_ptr, Win32.Wingdi.ac_POINT_t);
  --  Note; can't use Interfaces.C.Pointers yet since there appear to be 
  --  unimplemented attributes used in the pointer arithmetic packages.
--  package BEZBUF_Ptrs is new Interfaces.C.Pointers
--          (Index         => Natural, --Interfaces.C.ptrdiff_t,
--           Element       => BEZBUFFER,
--           Element_Array => BEZBUFFER_ARRAY,
--           Default_Terminator => null_BEZBUFFER); 
--  use BEZBUF_Ptrs;

  function LPVOID_TO_PBEZBUFFER_ARRAY is new Ada.Unchecked_Conversion( 
           Win32.LPVOID, PBEZBUFFER_ARRAY);

  mcs      : aliased Win32.WinUser.MDICREATESTRUCT;
  ps       : aliased Win32.WinUser.PAINTSTRUCT;
  rect_p   : aliased Win32.WinDef.RECT;
  rect2_p  : aliased Win32.WinDef.RECT;
  bez1_pts : aliased pt_array; 
  rect3_p  : aliased Win32.WinDef.RECT;
  bez2_pts : aliased pt_array;

                                             
  -- array of colors to be used for curves.
  type COLORREF_ARRAY is array (0 .. 19) of Win32.WinDef.COLORREF;
  crColor : COLORREF_ARRAY := (
                         16#000000FF#,16#0000FF00#,16#00FF0000#,16#0000FFFF#,
                         16#00FF00FF#,16#00FFFF00#,16#00FFFFFF#,16#00000080#,
                         16#00008000#,16#00800000#,16#00008080#,16#00800080#,
                         16#00808000#,16#00808080#,16#000000FF#,16#0000FF00#,
                         16#00FF0000#,16#0000FFFF#,16#00FF00FF#,16#00FFFF00#);
 
-- | CREATE BEZIER WINDOW PROCEDURE
-- |   Create the bezier MDI-child window.
procedure CreatePolyWindow (hWndClient : Win32.WinDef.HWND;
                            nItem      : Win32.INT) is
  hInst : Win32.Winnt.HANDLE;
  mcs_p : Win32.WinUser.LPMDICREATESTRUCT;
begin
  hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

  --  Initialize the MDI create struct for creation of the
  --  test window.
  mcs.szClass := POLYCLASS;
  mcs.szTitle := POLYTITLE;
  mcs.hOwner  := hInst;
  mcs.x       := Win32.WinUser.CW_USEDEFAULT;
  mcs.y       := Win32.WinUser.CW_USEDEFAULT;
  mcs.cx      := Win32.WinUser.CW_USEDEFAULT;
  mcs.cy      := Win32.WinUser.CW_USEDEFAULT;
  mcs.style   := 0;
  mcs.lParam  := Win32.LPARAM (nItem);

  mcs_p := mcs'Access;

  lReturn := Win32.WinUser.SendMessage
                                (hWndClient,
                                 Win32.WinUser.WM_MDICREATE,
                                 0,
                                 Convert.LPMDICREATESTRUCT_TO_LPARAM (mcs_p));
                                              

end CreatePolyWindow;


-- | POLYBEZIER WINDOW PROCEDURE
-- |   This is the main window function for the polybezier demo window.
function PolyProc (hWnd_p   : Win32.WinDef.HWND;
                   wMsg     : Win32.UINT;
                   wParam_p : Win32.WPARAM;
                   lParam_p : Win32.LPARAM) return Win32.LRESULT is
begin
  case wMsg is
    when Win32.WinUser.WM_CREATE =>
      bResult := PolyCreateProc(hWnd_p);
 
    when Win32.WinUser.WM_COMMAND =>
      bResult := PolyCommandProc(hWnd_p,wParam_p,lParam_p);
 
    when Win32.WinUser.WM_MOVE =>
      PolyRedraw(hWnd_p);
 
    when Win32.WinUser.WM_TIMER =>
      PolyDrawBez(hWnd_p);
 
    when Win32.WinUser.WM_PAINT =>
      PolyPaintProc(hWnd_p);
 
    when Win32.WinUser.WM_DESTROY =>
      PolyDestroyProc(hWnd_p);
 
    when others =>
      return Win32.WinUser.DefMDIChildProc (hWnd_p,wMsg,wParam_p,lParam_p);
  end case;
  return 0;
end PolyProc;


-- | POLYBEZIER CREATE PROCEDURE
-- |   Create the polybezier window for the demo application.  This is a child
-- |   of the MDI client window.  Allocate the extra object information for
-- |   handling of the polybezier demo.
function PolyCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL is
  ppd : PPOLYDATA;
  ppd_handle : Win32.Winnt.HANDLE;
begin
  if Wininfo.AllocWindowInfo (hwnd_p, (POLYDATA'size / 8)) = Win32.True then
    ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
    if ppd_handle /= System.Null_Address then 
      ppd := HANDLE_TO_PPOLYDATA (ppd_handle);
      ppd.nBezTotal := 20;
      ppd.nBezCurr  := 0;
      ppd.nColor    := 0;
      ppd.hBezBuffer := Win32.WinBase.GlobalAlloc (Win32.WinBase.GHND,
                                            (BEZBUFFER'Size / 8) * MAX_BEZIER);
      bResult := Wininfo.UnlockWindowInfo (hwnd_p);
      PolyInitPoints (hWnd_p);
      uResult := Win32.WinUser.SetTimer (hWnd_p,1,50,null);
      return Win32.TRUE;
    end if;
    bResult := Wininfo.FreeWindowInfo (hWnd_p);
  end if;
  return Win32.FALSE;
end PolyCreateProc;


-- | POLYBEZIER COMMAND PROCEDURE
-- |   Process polybezier commands.  This is a NOP for now.  But who knows what
-- |   tomorrow may bring.
function PolyCommandProc (hWnd_p : Win32.WinDef.HWND;
                          wParam_p : Win32.WPARAM;
                          lParam_p : Win32.LPARAM) return Win32.BOOL is
begin
  return Win32.TRUE;
end PolyCommandProc; 


-- | POLYBEZIER PAINT PROCEDURE
-- |   Repaint the bezier window.  All we really do here is validate our window,
-- |   and reset the array of bezier objects.
procedure PolyPaintProc (hWnd_p : WinDef.HWND) is
  hDC_p : Win32.WinDef.HDC;
begin
  hDC_p := Win32.WinUser.BeginPaint (hWnd_p, ps'Access);
  if hDC_p /= System.Null_Address then 
    bResult := Win32.WinUser.EndPaint (hWnd_p, ps'Access);
  end if;
  PolyRedraw (hWnd_p);
end PolyPaintProc;


-- | POLYBEZIER DESTROY PROCEDURE
-- |   Kill the polybezier demo.  Free up the resources allocated on behalf of
-- |   this object.
procedure PolyDestroyProc (hWnd_p : Win32.WinDef.HWND) is
  ppd : PPOLYDATA;
  ppd_handle : Win32.Winnt.HANDLE;
begin
  bResult := Win32.WinUser.KillTimer(hWnd_p,1);
  ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if ppd_handle /= System.Null_Address then 
    ppd := HANDLE_TO_PPOLYDATA (ppd_handle);
    hGResult := Win32.WinBase.GlobalFree(ppd.hBezBuffer);
    bResult := Wininfo.UnlockWindowInfo(hWnd_p);
  end if;
  bResult := Wininfo.FreeWindowInfo(hWnd_p);
end PolyDestroyProc; 


-- | GET NEW VELOCITY
-- |   This routine creates a new velocity for the bezier points.  Each bezier
-- |   point is randomly chosen.  The two inside points should have a speed
-- |   less then the endpoints (most of the time-better effect).
function PolyNewVel (i : Win32.INT) return Win32.LONG is
  nRet : Win32.LONG;
begin
  if (i = 1) or (i = 2) then
--    nRet := ((Win32.INT (Gdidemo_Util.lRandom) rem VELMAX) / 3) + VELMIN;
-- yes, it is important where that INT_T conversion goes!
    nRet := ((Gdidemo_Util.lRandom rem VELMAX) / 3) + VELMIN;
  else
--    nRet := (Win32.INT (Gdidemo_Util.lRandom) rem VELMAX) + VELMIN; 
    nRet := (Gdidemo_Util.lRandom rem VELMAX) + VELMIN; 
  end if;
  if nRet < 0 then
    return (-1 * nRet);
  else
    return nRet;
  end if;   
end PolyNewVel;


-- | INITIALIZE POLYBEZIER POINTS
-- |   This routine initializes the polybezier points for the first object.
-- |   This is performed on startup of the window.
procedure PolyInitPoints (hWnd_p : Win32.WinDef.HWND) is
  ppd   : PPOLYDATA;
  lpBez : PBEZBUFFER;
  ppd_handle : Win32.Winnt.HANDLE;
  lpBez_void : Win32.LPVOID;
begin
  ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if ppd_handle /= System.Null_Address then 
    ppd := HANDLE_TO_PPOLYDATA (ppd_handle);
    lpBez_void := WinBase.GlobalLock (ppd.hBezBuffer);
    if lpBez_void /= System.Null_Address then 
      lpBez := LPVOID_TO_PBEZBUFFER (lpBez_void);
      bResult := Win32.WinUser.GetClientRect (hWnd_p, rect_p'Access);
      for idx in 0 .. BEZ_PTS - 1 loop 
        lpBez.pPts(idx).x := (Gdidemo_Util.lRandom) rem rect_p.right;
        lpBez.pPts(idx).y := (Gdidemo_Util.lRandom) rem rect_p.bottom;

        ppd.pVel(idx).x := PolyNewVel(Win32.INT (idx));
        ppd.pVel(idx).y := PolyNewVel(Win32.INT (idx));
      end loop;
      bResult := Win32.WinBase.GlobalUnlock(ppd.hBezBuffer);
    end if;
    bResult := Wininfo.UnlockWindowInfo(hWnd_p);
  end if;
end PolyInitPoints;


-- | POLYBEZIER REDRAW
-- |   This routine resets the bezier curves and redraws the poly-bezier client
-- |   area.
procedure PolyRedraw (hWnd_p : Win32.WinDef.HWND) is
  ppd          : PPOLYDATA;
  lpBez        : PBEZBUFFER_ARRAY;
  -- lpBez,lpCurr : BEZBUF_Ptrs.Pointer;  --PBEZBUFFER;
  hDC_p        : Win32.WinDef.HDC;
  ppd_handle   : Win32.Winnt.HANDLE;
  lpBez_void   : Win32.LPVOID;
  -- note that bez_pts is pt_array, not the array defined in Wingdi.  This 
  -- will not execute properly if that type is used.
  bez_pts_ptr  : pt_array_ptr;
begin
  ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if ppd_handle /= System.Null_Address then 
    ppd := HANDLE_TO_PPOLYDATA (ppd_handle);
    lpBez_void := Win32.WinBase.GlobalLock (ppd.hBezBuffer);
    if lpBez_void /= System.Null_Address then 
      lpBez := LPVOID_TO_PBEZBUFFER_ARRAY (lpBez_void);
      -- lpBez := LPVOID_TO_Pointer (lpBez_void);
      hDC_p := Win32.WinUser.GetDC (hWnd_p);
      if hDC_p /= System.Null_Address then 
        -- /*
        -- ** Save the current bezier.  Set the first bezier in the
        -- ** array to that curve, and use it as a basis for the next
        -- ** series.
        -- */
--                 lpCurr        = lpBez+ppd->nBezCurr;
--                 *lpBez        = *lpCurr;
--                 ppd->nBezCurr = 0;
        lpBez (0) := lpBez (ppd.nBezCurr);
        ppd.nBezCurr := 0;

        -- /*
        -- ** Clean the curves (all but the first curve).
        -- */
        for j in 1 .. ppd.nBezTotal - 1 loop
          for i in 0 .. 3 loop -- BEZ_PTS - 1 loop
            lpBez(j).pPts(i).x := -1;
            lpBez(j).pPts(i).y :=  0;
          end loop;
        end loop;
        -- /*
        -- ** Clear the display.
        -- */
        bResult := Win32.WinUser.GetClientRect(hWnd_p,rect2_p'Access);
        bResult := Win32.WinGdi.BitBlt(hDC_p,0,0,Win32.INT(rect2_p.right), 
                                       Win32.INT(rect2_p.bottom), 
                                       System.Null_Address, 0,0,0);
 
        -- /*
        -- ** Draw the first curve in the bezier array.
        -- */
        -- Create a real array of points to pass to the PolyBezier function
        for i in 0 .. 3 loop -- BEZ_PTS - 1 loop
          bez1_pts(i).x := lpBez(0).pPts(i).x;
          bez1_pts(i).y := lpBez(0).pPts(i).y;
        end loop;
        bez_pts_ptr := bez1_pts'access;
        -- can't convert BEZ_PTS to DWORD, so 
        bResult := Win32.WinGdi.PolyBezier (hDC_p,
                   --bez1_pts'access, BEZ_PTS_DW);
                   TO_AC_POINT_T (bez_pts_ptr), BEZ_PTS_DW);
        iResult := Win32.WinUser.ReleaseDC(hWnd_p,hDC_p);
      end if;
      bResult := Win32.WinBase.GlobalUnlock(ppd.hBezBuffer);
    end if;
    bResult := Wininfo.UnlockWindowInfo(hWnd_p);
  end if;
end PolyRedraw;


procedure PolyDrawBez (hWnd_p : Win32.WinDef.HWND) is
  ppd     : PPOLYDATA;
  lpBez   : PBEZBUFFER_ARRAY;
  lpCurr,lpPrev : BEZBUFFER;
  x,y     : Win32.LONG;
  hDC_p   : Win32.WinDef.HDC;
  hPen_p  : Win32.WinDef.HGDIOBJ;
  ppd_handle : Win32.Winnt.HANDLE;
  lpBez_void : Win32.LPVOID;
  bez_pts_ptr : pt_array_ptr;
  gdi_obj     : Win32.Windef.HGDIOBJ;
begin
  ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if ppd_handle /= System.Null_Address then 
    ppd := HANDLE_TO_PPOLYDATA (ppd_handle);
    lpBez_void := Win32.WinBase.GlobalLock (ppd.hBezBuffer);
    if lpBez_void /= System.Null_Address then 
      lpBez := LPVOID_TO_PBEZBUFFER_ARRAY (lpBez_void); 
      hDC_p := Win32.WinUser.GetDC (hWnd_p);
      if hDC_p /= System.Null_Address then 
        bResult := Win32.WinUser.GetClientRect(hWnd_p,rect3_p'Access);
--                 lpPrev = lpBez+ppd->nBezCurr;
--                 ppd->nBezCurr += 1;
        lpPrev := lpBez (ppd.nBezCurr);
        ppd.nBezCurr := ppd.nBezCurr + 1;
        if ppd.nBezCurr >= ppd.nBezTotal then
          ppd.nBezCurr := 0;
          ppd.nColor  := (ppd.nColor + 1) rem 20; -- (++ppd->nColor % 20);
        end if;
        lpCurr := lpBez(ppd.nBezCurr);
 
        if lpCurr.pPts(0).x /= -1 then
          hPen_p := Win32.WinGdi.SelectObject(hDC_p, Win32.Windef.HGDIOBJ (
                    Win32.WinGdi.GetStockObject(Win32.WinGdi.BLACK_PEN)));
          -- make a real array of points to pass to polybezier
          for i in 0 .. 3 loop -- BEZ_PTS - 1 loop
            bez2_pts(i).x := lpCurr.pPts(i).x;
            bez2_pts(i).y := lpCurr.pPts(i).y;
          end loop;
          bez_pts_ptr := bez2_pts'access;
          bResult := Win32.WinGdi.PolyBezier(hDC_p,
                     TO_AC_POINT_T (bez_pts_ptr), BEZ_PTS_DW);
          gdi_obj := Win32.WinGdi.SelectObject(hDC_p,hPen_p);
        end if;

        for idx in 0 .. 3 loop --BEZ_PTS - 1 loop -- =0; idx < BEZ_PTS; idx++)
          x := lpPrev.pPts(idx).x + ppd.pVel(idx).x;
          y := lpPrev.pPts(idx).y + ppd.pVel(idx).y;
 
          if x >= rect3_p.right then
            x := rect3_p.right - ((x - rect3_p.right)+1);
            ppd.pVel(idx).x := -1 * PolyNewVel(Win32.INT(idx));
          end if;

          if x <= rect3_p.left then
            x := rect3_p.left + ((rect3_p.left - x)+1);
            ppd.pVel(idx).x := PolyNewVel(Win32.INT(idx));
          end if;

          if y >= rect3_p.bottom then
            y := rect3_p.bottom - ((y - rect3_p.bottom)+1);
            ppd.pVel(idx).y := -1 * PolyNewVel(Win32.INT(idx));
          end if;

          if y <= rect3_p.top then
            y := rect3_p.top + ((rect3_p.top - y)+1);
            ppd.pVel(idx).y := PolyNewVel(Win32.INT(idx));
          end if;

          lpCurr.pPts(idx).x := x;
          lpCurr.pPts(idx).y := y;

        end loop;
        hPen_p := Win32.WinGdi.SelectObject(hDC_p, Win32.Windef.HGDIOBJ (
                               Win32.WinGdi.CreatePen(Win32.WinGdi.PS_SOLID,
                                                      1,crColor(ppd.nColor))));
        -- make a real array of points to pass to polybezier
        for i in 0 .. 3 loop -- BEZ_PTS - 1 loop
          bez2_pts(i).x := lpCurr.pPts(i).x;
          bez2_pts(i).y := lpCurr.pPts(i).y;
        end loop;
        bez_pts_ptr := bez2_pts'access;
        bResult := Win32.WinGdi.PolyBezier(hDC_p, 
                                TO_AC_POINT_T (bez_pts_ptr), BEZ_PTS_DW);
        bResult := Win32.WinGdi.DeleteObject(Win32.WinGdi.SelectObject
                                                          (hDC_p,hPen_p));
        iResult := Win32.WinGdi.SetROP2(hDC_p,Win32.WinGdi.R2_COPYPEN);
        iResult := Win32.WinUser.ReleaseDC(hWnd_p,hDC_p);
        -- store new bez data back in buffer
        lpBez(ppd.nBezCurr) := lpCurr;
      end if;
      bResult := Win32.WinBase.GlobalUnlock(ppd.hBezBuffer);
    end if;
    bResult := Wininfo.UnlockWindowInfo(hWnd_p);
  end if;
end PolyDrawBez;

-------------------------------------------------------------------------------
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

end Poly;
