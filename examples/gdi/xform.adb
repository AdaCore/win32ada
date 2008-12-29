-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  This is a translation of xform.c which is a member of the Microsoft
--  gdidemo sample application.  I believe that this collection of routines
--  was under development and was not completely implemented (since the
--  c version doesn't exercise this code).  


with Ada.Unchecked_Conversion;
with Convert;
with Gdidemo_Util;
with System;
with Win32;
with Win32.WinDef;
with Win32.Winnt;
with Win32.WinUser;
with Win32.WinGdi;
with WinInfo;


package body Xform is

  use Interfaces.C;

  use type System.Address;
  use type Win32.LONG;
  use type Win32.BOOL;

  --  Dummy function return values
  bResult : Win32.BOOL;
  uResult : Win32.UINT;
  iResult : Win32.INT;
  lReturn : Win32.LRESULT;

  -- aliased variables
  mcs       : aliased Win32.WinUser.MDICREATESTRUCT;
  rect_p    : aliased Win32.WinDef.RECT;
  rect2_p   : aliased Win32.WinDef.RECT;
  old_point : aliased Win32.WinDef.POINT;
  poly_pts  : aliased pt_array;  --Win32.WinDef.POINT_A;
  old_pt    : aliased Win32.WinDef.POINT;
  poly2_pts : aliased pt_array;  --WinDef.POINT_A;
  xForm_p   : aliased Win32.WinGdi.XFORM;
  rect3_p   : aliased Win32.WinDef.RECT; 
  ps        : aliased Win32.WinUser.PAINTSTRUCT;


  -- Unchecked conversion utility functions
  function HANDLE_TO_PXFORMDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE, PXFORMDATA);

  function PT_ARRAY_TO_PT (param: pt_array) return Win32.Wingdi.ac_POINT_t is
      function to_pt is new Ada.Unchecked_Conversion (
	  Win32.LONG, Win32.Wingdi.ac_POINT_t);
  begin
      return to_pt(param(0).x);
  end PT_ARRAY_TO_PT;
 
  --  Local functions to this package body
  procedure ResetXForm (hWnd_p : Win32.WinDef.HWND);
  procedure DrawXForm (hWnd_p : Win32.WinDef.HWND);


-- | CREATE XFORM WINDOW PROCEDURE
procedure CreateXFormWindow (hWndClient : Win32.WinDef.HWND;
                             nItem      : Win32.INT) is
  hInst : Win32.Winnt.HANDLE;
  mcs_p : Win32.WinUser.LPMDICREATESTRUCT;
begin
  hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

  --  Initialize the MDI create struct for creation of the
  --  test window.
  mcs.szClass := XFORMCLASS;
  mcs.szTitle := XFORMTITLE;
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
                                              

end CreateXFormWindow;


-- | XFORM WINDOW PROCEDURE
function XFormProc (hWnd_p   : Win32.WinDef.HWND;
                    wMsg     : Win32.UINT;
                    wParam_p : Win32.WPARAM;
                    lParam_p : Win32.LPARAM) return Win32.LRESULT is
begin
  case wMsg is

    when Win32.WinUser.WM_CREATE =>
      bResult := XFormCreateProc(hWnd_p);
 
    when Win32.WinUser.WM_MOVE =>
      ResetXForm(hWnd_p);
 
    when Win32.WinUser.WM_TIMER =>
      DrawXForm(hWnd_p);
 
    when Win32.WinUser.WM_COMMAND =>
      bResult := XFormCommandProc(hWnd_p,wParam_p,lParam_p);
 
    when Win32.WinUser.WM_PAINT =>
      XFormPaintProc(hWnd_p);
 
    when Win32.WinUser.WM_DESTROY =>
      XFormDestroyProc(hWnd_p);
 
    when others =>
      return Win32.WinUser.DefMDIChildProc(hWnd_p,wMsg,wParam_p,lParam_p);
  end case;
  return 0;
end XFormProc;


-- | XFORM CREATE PROCEDURE
function XFormCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL is
  pxd : PXFORMDATA := new XFORMDATA;
  pxd_handle : Win32.Winnt.HANDLE;
  dx, dy : Win32.LONG;
begin
  if WinInfo.AllocWindowInfo(hWnd_p,(XFORMDATA'size / 8)) = 
     Win32.TRUE then
    pxd_handle := WinInfo.LockWindowInfo (hWnd_p);
    if pxd_handle /= System.Null_Address then 
      pxd := HANDLE_TO_PXFORMDATA (pxd_handle);
      bResult := Win32.WinUser.GetClientRect(hWnd_p,rect_p'Access);

      dx := (rect_p.right + rect_p.left) / 16; 
      dy := (rect_p.bottom + rect_p.top) / 16; 

      pxd.pObject(0).x := dx * 2;  -- dx << 1;
      pxd.pObject(0).y := 0;
      pxd.pObject(1).x := dx;
      pxd.pObject(1).y := dy;
      pxd.pObject(2).x := 0;
      pxd.pObject(2).y := dy;
      pxd.pObject(3).x := dx * 2;  -- dx << 1;
      pxd.pObject(3).y := 0;
      pxd.nObject      := 4;
 
      pxd.xForm.eM11 := 0.866;
      pxd.xForm.eM12 := 0.5;
      pxd.xForm.eM21 := -0.5;
      pxd.xForm.eM22 := 0.866;
      pxd.xForm.eDx  := 0.0;
      pxd.xForm.eDy  := 0.0;

      bResult := WinInfo.UnlockWindowInfo(hWnd_p);
      uResult := Win32.WinUser.SetTimer (hWnd_p,1,500,null);
      return Win32.TRUE;
    end if;
    bResult := WinInfo.FreeWindowInfo(hWnd_p);
  end if;
  return Win32.FALSE;
end XFormCreateProc;


-- | XFORM COMMAND PROCEDURE
function XFormCommandProc (hWnd_p   : Win32.WinDef.HWND;
                          wParam_p : Win32.WPARAM;
                          lParam_p : Win32.LPARAM) return Win32.BOOL is
begin
  return Win32.TRUE;
end XFormCommandProc;


-- | XFORM PAINT PROCEDURE
procedure XFormPaintProc (hWnd_p : Win32.WinDef.HWND) is
  hDC_p : Win32.WinDef.HDC;
begin
  hDC_p := Win32.WinUser.BeginPaint (hWnd_p, ps'Access);
  if hDC_p /= System.Null_Address then 
    bResult := Win32.WinUser.EndPaint (hWnd_p, ps'Access);
  end if;
  ResetXForm (hWnd_p);
end XFormPaintProc;


-- | XFORM DESTROY PROCEDURE
procedure XFormDestroyProc (hWnd_p : Win32.WinDef.HWND) is
begin
  bResult := Win32.WinUser.KillTimer(hWnd_p,1);
  bResult := WinInfo.FreeWindowInfo(hWnd_p);
end XFormDestroyProc;


procedure ResetXForm (hWnd_p : Win32.WinDef.HWND) is
  pxd       : PXFORMDATA;
  pxd_handle: Win32.Winnt.HANDLE;
  hDC_p     : Win32.WinDef.HDC;
begin
  pxd_handle := WinInfo.LockWindowInfo (hWnd_p);
  if pxd_handle /= System.Null_Address then 
    pxd := HANDLE_TO_PXFORMDATA (pxd_handle);
    hDC_p := Win32.WinUser.GetDC (hWnd_p);
    if hDC_p /= System.Null_Address then 
-- #ifndef NOT_IMPLEMENTED
      bResult := Win32.WinUser.GetClientRect(hWnd_p,rect2_p'Access);
      bResult := Win32.WinGdi.BitBlt(hDC_p,0,0,Win32.INT(rect2_p.right),
                                     Win32.INT(rect2_p.bottom),
                                     System.Null_Address,0,0,0);
      bResult := Win32.WinGdi.SetViewportOrgEx(hDC_p,
                       -- rect.right >> 1,rect.bottom >> 1,NULL);
                       Win32.INT (rect2_p.right / 2), 
                       Win32.INT (rect2_p.bottom / 2), old_point'Access);
      bResult := Win32.WinGdi.SetWorldTransform(hDC_p,pxd.xForm'Access);
      --  create an array of points,
      for I in 0 .. 3 loop
        poly_pts (I).x := pxd.pObject (I).x;
        poly_pts (I).y := pxd.pObject (I).y;
      end loop;
      bResult := Win32.WinGdi.Polyline(hDC_p, --poly_pts'Access, pxd.nObject);
                 PT_ARRAY_TO_PT (poly_pts), pxd.nObject);
      bResult := Win32.WinGdi.ModifyWorldTransform(hDC_p,pxd.xForm'Access,
                                                   Win32.WinGdi.MWT_IDENTITY);
 
      --             // I have to put this in since GDI currently doesn't
      --             // reset the drawing attributes -- 5/24/91
      --             //
      bResult := Win32.WinGdi.SetViewportOrgEx(hDC_p,0,0,old_point'Access);

-- #endif
 
      iResult := Win32.WinUser.ReleaseDC(hWnd_p,hDC_p);
    end if;
    bResult := WinInfo.UnlockWindowInfo(hWnd_p);
  end if;
end ResetXForm;

 
procedure DrawXForm (hWnd_p : Win32.WinDef.HWND) is
  pxd : PXFORMDATA;
  pxd_handle : Win32.Winnt.HANDLE;
  hDC_p : Win32.WinDef.HDC;
-- #ifndef NOT_IMPLEMENTED
-- #endif
begin
  pxd_handle := WinInfo.LockWindowInfo (hWnd_p);
  if pxd_handle /= System.Null_Address then 
    pxd := HANDLE_TO_PXFORMDATA (pxd_handle); 
    hDC_p := Win32.WinUser.GetDC (hWnd_p);
    if hDC_p /= System.Null_Address then 
 
-- #ifndef NOT_IMPLEMENTED
 
      bResult := Win32.WinUser.GetClientRect(hWnd_p,rect3_p'Access);
      bResult := Win32.WinGdi.SetViewportOrgEx(hDC_p,
                                               Win32.INT (rect3_p.right/2), 
                                               Win32.INT (rect3_p.bottom/2), 
                                               old_pt'access);
 
      bResult := Win32.WinGdi.SetWorldTransform(hDC_p,pxd.xForm'Access);
      --  create a real array of points
      for I in 0 .. 3 loop
        poly2_pts (I).x := pxd.pObject (I).x;
        poly2_pts (I).y := pxd.pObject (I).y;
      end loop;
      bResult := Win32.WinGdi.Polyline(hDC_p, --poly2_pts'Access, pxd.nObject);
                 PT_ARRAY_TO_PT (poly2_pts), pxd.nObject);

      bResult := Win32.WinGdi.ModifyWorldTransform(hDC_p,
             pxd.xForm'Access,Win32.WinGdi.MWT_RIGHTMULTIPLY);
      --  create a real array of points
      for I in 0 .. 3 loop
        poly2_pts (I).x := pxd.pObject (I).x;
        poly2_pts (I).y := pxd.pObject (I).y;
      end loop;
      bResult := Win32.WinGdi.Polyline(hDC_p,  --poly2_pts'Access, pxd.nObject);
                 PT_ARRAY_TO_PT (poly2_pts), pxd.nObject);

      bResult := Win32.WinGdi.GetWorldTransform(hDC_p,xForm_p'Access);
      pxd.xForm.eM11 := xForm_p.eM11;
      pxd.xForm.eM12 := xForm_p.eM12;
      pxd.xForm.eM21 := xForm_p.eM21;
      pxd.xForm.eM22 := xForm_p.eM22;
      pxd.xForm.eDx  := xForm_p.eDx;
      pxd.xForm.eDy  := xForm_p.eDy;

      bResult := Win32.WinGdi.ModifyWorldTransform(hDC_p,pxd.xForm'Access,
                                                   Win32.WinGdi.MWT_IDENTITY);
 
      --             // I have to put this in since GDI currently doesn't
      --             // reset the drawing attributes -- 5/24/91
      --             //
      bResult := Win32.WinGdi.SetViewportOrgEx(hDC_p,0,0,old_pt'access);

-- #endif
      iResult := Win32.WinUser.ReleaseDC(hWnd_p,hDC_p);
    end if;
    bResult := WinInfo.UnlockWindowInfo(hWnd_p);
  end if;
end DrawXForm;

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

end Xform;
