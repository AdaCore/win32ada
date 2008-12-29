-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  package Draw body
-- 
--  This package body is a translation of the collection of C functions in
--  draw.c which is part of the gdidemo sample application.


with Win32;         use Win32;
with Win32.WinDef;  use Win32.WinDef;
with Win32.WinUser; use Win32.WinUser;
with Win32.WinGdi;  use Win32.WinGdi;
with Win32.WinBase; use Win32.WinBase;
with Win32.Winnt;   use Win32.Winnt;
with Ada.Unchecked_Conversion;
with Convert;
with Gdidemo_Util;
with Interfaces.C; use Interfaces.C;  -- with and use only for type operations
with Wininfo;
with System;

package body Draw is

  use type System.Address;

  -- Used in CreateDrawWindow
  mcs   : aliased Win32.WinUser.MDICREATESTRUCT;
  
  -- Used in DrawPaintProc
  ps    : aliased Win32.WinUser.PAINTSTRUCT;

  -- Used in DrawObject
  rect_p : aliased Win32.WinDef.RECT;
  
  -- Dummy function return values
  bResult : Win32.BOOL;
  iResult : Win32.INT;
  uResult : Win32.UINT;
  lReturn : Win32.LRESULT;

  -- Unchecked conversion utility functions
  function HANDLE_TO_PDRAWDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE, PDRAWDATA);
 
-- | CREATE DRAW WINDOW PROCEDURE
procedure CreateDrawWindow (hWndClient : Win32.WinDef.HWND;
                            nItem      : Win32.INT) is 
  hInst : Win32.Winnt.HANDLE;
  mcs_p : Win32.WinUser.LPMDICREATESTRUCT;
begin 
  hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

  -- ** Initialize the MDI create struct for creation of the
  -- ** test window.
  mcs.szClass := DRAWCLASS;
  mcs.szTitle := DRAWTITLE;
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

end CreateDrawWindow;
 
 
-- | DRAW WINDOW PROCEDURE
function DrawProc (hWnd_p   : Win32.WinDef.HWND;
                   wMsg     : Win32.UINT;
                   wParam_p : Win32.WPARAM;
                   lParam_p : Win32.LPARAM) return Win32.LRESULT is
begin
  case wMsg is

    when Win32.WinUser.WM_CREATE =>
      bResult := DrawCreateProc(hWnd_p);

    when Win32.WinUser.WM_COMMAND =>
      bResult := DrawCommandProc(hWnd_p,wParam_p,lParam_p);
 
    when Win32.WinUser.WM_TIMER =>
      DrawObject(hWnd_p);
 
    when Win32.WinUser.WM_PAINT =>
      DrawPaintProc(hWnd_p);
 
    when Win32.WinUser.WM_DESTROY =>
      DrawDestroyProc(hWnd_p);

    when others =>
      return Win32.WinUser.DefMDIChildProc (hWnd_p, wMsg, wParam_p, lParam_p);

  end case; 

  return (0);

end DrawProc; 


-- | DRAW CREATE PROCEDURE
function DrawCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL is
  pdd : PDRAWDATA := new DRAWDATA;
  pdd_handle : Win32.Winnt.HANDLE;
begin
  if WinInfo.AllocWindowInfo (hWnd_p, (DRAWDATA'size / 8)) = 
     Win32.True then 
    pdd_handle := WinInfo.LockWindowInfo (hWnd_p);
    if pdd_handle /= System.Null_Address then 
      pdd := HANDLE_TO_PDRAWDATA (pdd_handle);
      pdd.nObject := 0;
      bResult := Wininfo.UnlockWindowInfo(hWnd_p);

      uResult := Win32.WinUser.SetTimer(hWnd_p,1,50,null);
      return Win32.TRUE;
    end if;
    bResult := Wininfo.FreeWindowInfo(hWnd_p);
  end if;
  return Win32.FALSE;
end DrawCreateProc;


-- | DRAW COMMAND PROCEDURE
function DrawCommandProc (hWnd_p   : Win32.WinDef.HWND;
                          wParam_p : Win32.WPARAM;
                          lParam_p : Win32.LPARAM) return Win32.BOOL is
begin
  return Win32.TRUE; 
end DrawCommandProc;


-- | DRAW PAINT PROCEDURE
procedure DrawPaintProc (hWnd_p : Win32.WinDef.HWND) is
  hDC_p : Win32.WinDef.HDC;
begin
  hDC_p := Win32.WinUser.BeginPaint (hWnd_p, ps'Access);
  if hDC_p /= System.Null_Address then 
    bResult := Win32.WinUser.EndPaint (hWnd_p, ps'Access);
  end if;
end DrawPaintProc;
 
-- | DRAW DESTROY PROCEDURE
procedure DrawDestroyProc (hWnd_p : Win32.WinDef.HWND) is
begin
  bResult := Win32.WinUser.KillTimer(hWnd_p,1);
  bResult := Wininfo.FreeWindowInfo(hWnd_p);
end DrawDestroyProc;

 
procedure DrawObject (hWnd_p : Win32.WinDef.HWND) is
  pdd        : PDRAWDATA; -- := new DRAWDATA;
  hDC_p      : Win32.WinDef.HDC;
  x1,y1,x2,y2,x3,y3,x4,y4,nObject : Win32.INT;
  r,g,b      : Win32.BYTE;
  hBrush_p   : Win32.WinDef.HGDIOBJ;
  pdd_handle : Win32.Winnt.HANDLE;
  dw         : Win32.DWORD;
  use type Win32.INT;
begin
  pdd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if pdd_handle /= System.Null_Address then 
    pdd := HANDLE_TO_PDRAWDATA (pdd_handle);
    hDC_p := Win32.WinUser.GetDC (hWnd_p);
    if hDC_p /= System.Null_Address then 
      bResult := Win32.WinUser.GetClientRect(hWnd_p,rect_p'Access);
      dw := Gdidemo_Util.lRandom rem 255;
      r := Win32.BYTE (dw);
      dw := Gdidemo_Util.lRandom rem 255;
      g := Win32.BYTE (dw);
      dw := Gdidemo_Util.lRandom rem 255;
      b := Win32.BYTE (dw);

      hBrush_p := Win32.WinGdi.SelectObject (hDC_p, Win32.Windef.HGDIOBJ (
            Win32.WinGdi.CreateSolidBrush (Win32.WinGdi.RGB (r,g,b))));
      if hBrush_p /= System.Null_Address then 
        x1 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.right);
        y1 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.bottom);
        x2 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.right);
        y2 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.bottom);
        x3 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.right);
        y3 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.bottom);
        x4 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.right);
        y4 := Win32.INT(Gdidemo_Util.lRandom rem rect_p.bottom);

        -- Since the computed x,y values may be negative, make them positive
        -- so that all objects fit in the client area.
        if x1 < 0 then
          x1 := -x1;
        end if;
        if y1 < 0 then
          y1 := -y1;
        end if;
        if x2 < 0 then
          x2 := -x2;
        end if;
        if y2 < 0 then
          y2 := -y2;
        end if;
        if x3 < 0 then
          x3 := -x3;
        end if;
        if y3 < 0 then
          y3 := -y3;
        end if;
        if x4 < 0 then
          x4 := -x4;
        end if;
        if y4 < 0 then
          y4 := -y4;
        end if;

        nObject := Win32.INT(Gdidemo_Util.lRandom rem Win32.LONG(5));

        case nObject is
          when OBJ_RECTANGLE =>
            bResult := Win32.WinGdi.Rectangle(hDC_p,x1,y1,x2,y2);
 
          when OBJ_ELLIPSE =>
            bResult := Win32.WinGdi.Ellipse(hDC_p,x1,y1,x2,y2);
 
          when OBJ_ROUNDRECT =>
            bResult := Win32.WinGdi.RoundRect(hDC_p,x1,y1,x2,y2,x3,y3);
 
          when OBJ_CHORD =>
            bResult := Win32.WinGdi.Chord(hDC_p,x1,y1,x2,y2,x3,y3,x4,y4);
 
          when OBJ_PIE =>
            bResult := Win32.WinGdi.Pie(hDC_p,x1,y1,x2,y2,x3,y3,x4,y4);
    
          when others =>
            bResult := Win32.WinGdi.Rectangle(hDC_p,x1,y1,x2,y2);


        end case;

        bResult := Win32.WinGdi.DeleteObject(
                     Win32.WinGdi.SelectObject(hDC_p,hBrush_p));

      end if;
      iResult := Win32.WinUser.ReleaseDC(hWnd_p,hDC_p);
    end if;
    bResult := Wininfo.UnlockWindowInfo(hWnd_p);
  end if;

end DrawObject;

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

end Draw;
