-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$

with Win32;
with Win32.WinDef;
with Win32.WinUser;
with Win32.WinGdi;
with Win32.WinBase;

with Convert;
with Gdidemo_Util;
with System;
with Wininfo;
with Unchecked_Conversion;

--  Interfaces.C included only to get visibility to type operations
with Interfaces.C;   use Interfaces.C;

with Interfaces.C.Strings; use Interfaces.C.Strings;

package body Bounce is

  use type System.Address;
  use type Win32.BOOL;

  -- Used in CreateBounceWindow
  mcs         : aliased Win32.WinUser.MDICREATESTRUCT;

  -- Used in BouncePaintProc
  ps          : aliased Win32.WinUser.PAINTSTRUCT;

  -- Used in BounceRefresh
  rect_p      : aliased Win32.WinDef.RECT;
  pDimensions : aliased Win32.WinDef.POINT;

  -- Used in CheckEdgePostion
  pPos,
  pDir,
  pDim        : aliased Win32.WinDef.POINT;
  rect_p2     : aliased Win32.Windef.RECT;
  
  -- Used in ballBounce
  pOrg,
  pExt        : aliased Win32.WinDef.POINT;

  -- Used in ballGetPosition
  pOrg2       : aliased Win32.WinDef.POINT;


  -- Dummy function return values
  bResult : Win32.BOOL;
  iResult : Win32.INT;
  uResult : Win32.UINT;
  hlResult : Win32.Windef.HLOCAL;
  lreturn  : Win32.LRESULT;

  -- Local functions to this package body
  procedure XFormClear (XForm : in out MYXFORM);
  procedure XFormScale (XForm : in out MYXFORM;
                        xScale, yScale : Win32.LONG);
  procedure XFormTrans (XForm : in out MYXFORM;
                        xTrans, yTrans : Win32.LONG);
  procedure XFormPoint (XForm : MYXFORM;
                        Point : in out Win32.WinDef.POINT);

  -- Unchecked conversion utility functions
  function HANDLE_TO_PBD is new Unchecked_Conversion (Win32.Winnt.HANDLE,
                                                      PBOUNCEDATA);
  function LPVOID_TO_PBALLDATA is new Unchecked_Conversion (Win32.LPVOID,
                                                            PBALLDATA);
 
-- | CREATE BOUNCE WINDOW PROCEDURE
procedure CreateBounceWindow (hWndClient : Win32.WinDef.HWND;
                              nItem      : Win32.INT) is
  hInst_p : Win32.Winnt.HANDLE;
  mcs_p   : Win32.WinUser.LPMDICREATESTRUCT;
begin

  hInst_p := Gdidemo_Util.GETINSTANCE (hWndClient);

  --  Initialize the MDI create struct for creation of the
  --  test window.
  mcs.szClass := BOUNCECLASS;
  mcs.szTitle := BOUNCETITLE;
  mcs.hOwner  := hInst_p;
  mcs.x       := Win32.WinUser.CW_USEDEFAULT;
  mcs.y       := Win32.WinUser.CW_USEDEFAULT;
  mcs.cx      := Win32.WinUser.CW_USEDEFAULT;
  mcs.cy      := Win32.WinUser.CW_USEDEFAULT;
  mcs.style   := 0;
  mcs.lParam  := Win32.LPARAM (nItem);

  mcs_p := mcs'Access;

  lreturn := Win32.WinUser.SendMessage
                                (hWndClient,
                                 Win32.WinUser.WM_MDICREATE,
                                 0,
                                 Convert.LPMDICREATESTRUCT_TO_LPARAM (mcs_p));

end CreateBounceWindow;

-- |
-- | BOUNCE WINDOW PROCEDURE
-- | The callback procedure supplied.
function BounceProc (hWnd_p   : Win32.WinDef.HWND;
                     wMsg     : Win32.UINT;
                     wParam_p : Win32.WPARAM;
                     lParam_p : Win32.LPARAM) return Win32.LRESULT is
begin
  case wMsg is
    when Win32.WinUser.WM_CREATE =>
      bResult := BounceCreateProc(hWnd_p);
 
    when Win32.WinUser.WM_MOVE =>
      BounceRefresh(hWnd_p);
 
    when Win32.WinUser.WM_COMMAND =>
      bResult := BounceCommandProc(hWnd_p,wParam_p,lParam_p);
 
    when Win32.WinUser.WM_TIMER =>
      BounceObjects(hWnd_p);
 
    when Win32.WinUser.WM_PAINT =>
      BouncePaintProc(hWnd_p);
 
    when Win32.WinUser.WM_DESTROY =>
      BounceDestroyProc(hWnd_p);
 
    when others =>
      return Win32.WinUser.DefMDIChildProc (hWnd_p, wMsg, wParam_p, lParam_p);

  end case;

  return Win32.LRESULT (0);

end BounceProc; 
 

-- | BOUNCE CREATE PROCEDURE
-- |
function BounceCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL is
  pbd : PBOUNCEDATA; -- := new BOUNCEDATA; note that we don't have to do 'new'
  pbd_handle : Win32.Winnt.HANDLE;
begin
  if WinInfo.AllocWindowInfo (hWnd_p, (BOUNCEDATA'size / 8)) = 
    Win32.TRUE then
    pbd_handle := WinInfo.LockWindowInfo (hWnd_p);
    if pbd_handle /= System.Null_Address then  
      pbd := HANDLE_TO_PBD (pbd_handle); 
      pbd.hBall1 := ballCreate (hWnd_p, 20, 20, 
                                  Win32.WinGdi.RGB (255,0,0));
      pbd.hBall2 := ballCreate (hWnd_p, 20, 20, 
                                  Win32.WinGdi.RGB (0,0,255));
      pbd.hBall3 := ballCreate (hWnd_p, 20, 20, 
                                  Win32.WinGdi.RGB (0,255,0));
      pbd.hBall4 := ballCreate (hWnd_p, 20, 20, 
                                  Win32.WinGdi.RGB (255,0,255));
      bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      uResult := Win32.WinUser.SetTimer (hWnd_p, 1, 50, null);
      return Win32.TRUE;
    end if;
    bResult := Wininfo.FreeWindowInfo (hWnd_p);
  end if;
  return Win32.FALSE;
end BounceCreateProc;



-- | BOUNCE COMMAND PROCEDURE
-- |
function BounceCommandProc (hWnd_p   : Win32.WinDef.HWND;
                            wParam_p : Win32.WPARAM;
                            lParam_p : Win32.LPARAM) return Win32.BOOL is
begin
  return Win32.TRUE;
end BounceCommandProc; 


-- | BOUNCE PAINT PROCEDURE
-- |
procedure BouncePaintProc (hWnd_p : Win32.WinDef.HWND) is
  hDC_p : Win32.WinDef.HDC;
begin
  hDC_p := Win32.WinUser.BeginPaint (hWnd_p, ps'Access);
  if hDC_p /= System.Null_Address then 
    bResult := Win32.WinUser.EndPaint (hWnd_p, ps'Access);
  end if;
  BounceRefresh (hWnd_p);

end BouncePaintProc;


-- | BOUNCE DESTROY PROCEDURE
-- |
procedure BounceDestroyProc (hWnd_p : Win32.WinDef.HWND) is
  pbd : PBOUNCEDATA;
  pbd_handle : Win32.Winnt.HANDLE;
begin
  bResult := Win32.WinUser.KillTimer (hWnd_p, 1);
  pbd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if pbd_handle /= System.Null_Address then
    pbd := HANDLE_TO_PBD (pbd_handle);
    bResult := ballDestroy (pbd.hBall1);
    bResult := ballDestroy (pbd.hBall2);
    bResult := ballDestroy (pbd.hBall3);
    bResult := ballDestroy (pbd.hBall4);
    bResult := Wininfo.UnlockWindowInfo (hWnd_p);
  end if;
  bResult := Wininfo.FreeWindowInfo (hWnd_p);

end BounceDestroyProc;


-- | BOUNCE REFRESH
-- |
procedure BounceRefresh (hWnd_p : Win32.WinDef.HWND) is
  pbd         : PBOUNCEDATA;
  pbd_handle  : Win32.Winnt.HANDLE;
  hDC_p       : Win32.WinDef.HDC;
  xDirection  : Win32.LONG;
  yDirection  : Win32.LONG;
begin
  pbd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if pbd_handle /= System.Null_Address then
    pbd := HANDLE_TO_PBD (pbd_handle);
    hDC_p := Win32.WinUser.GetDc (hWnd_p);
    if hDC_p /= System.Null_Address then
      bResult := Win32.WinUser.GetClientRect(hWnd_p,rect_p'Access);
      iResult := Win32.WinUser.FillRect
                 (hDC_p,rect_p'Access,Gdidemo_Util.GETCLASSBRUSH(hWnd_p));
      xDirection := (Gdidemo_util.lRandom rem 5) + 5;
      yDirection := (Gdidemo_util.lRandom rem 5) + 5;
      ballSetPosition(pbd.hBall1,0,0);
      ballSetDirection(pbd.hBall1,xDirection,yDirection);
      ballGetDimensions(pbd.hBall2,pDimensions);
      ballSetPosition(pbd.hBall2,
                      rect_p.right - pDimensions.x, 0);
      xDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
      yDirection := (Gdidemo_Util.lRandom rem 5) + 5;
      ballSetDirection(pbd.hBall2,xDirection,yDirection);
      ballGetDimensions(pbd.hBall3, pDimensions);
      ballSetPosition(pbd.hBall3, 0, (rect_p.bottom - pDimensions.y));
      xDirection := (Gdidemo_Util.lRandom rem 5) + 5;
      yDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
      ballSetDirection(pbd.hBall3, xDirection, yDirection);
      ballGetDimensions(pbd.hBall4,pDimensions);
      ballSetPosition(pbd.hBall4,
                      rect_p.right - pDimensions.x,
                      rect_p.bottom - pDimensions.y);
      xDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
      yDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
      ballSetDirection(pbd.hBall4,xDirection,yDirection);
 
      ballBounce(pbd.hBall1);
      ballBounce(pbd.hBall2);
      ballBounce(pbd.hBall3);
      ballBounce(pbd.hBall4);

      iResult := Win32.WinUser.ReleaseDC (hWnd_p, hDC_p);
    end if;
    bResult := Wininfo.UnlockWindowInfo (hWnd_p);
  end if;    
end BounceRefresh;

 
procedure BounceObjects (hWnd_p : Win32.WinDef.HWND) is
  pbd : PBOUNCEDATA; 
  pbd_handle : Win32.Winnt.HANDLE;
begin
  pbd_handle := Wininfo.LockWindowInfo (hWnd_p);
  if pbd_handle /= System.Null_Address then 
    pbd := HANDLE_TO_PBD (pbd_handle);
    --  /*
    --  ** Determine if the balls hit any of the edges of the display.  If
    --  ** they do, then these functions reset their position to something
    --  ** more desireable and re-do their direction.
    --  */
    CheckEdgePosition(hWnd_p,pbd.hBall1);
    CheckEdgePosition(hWnd_p,pbd.hBall2);
    CheckEdgePosition(hWnd_p,pbd.hBall3);
    CheckEdgePosition(hWnd_p,pbd.hBall4);
 
    ballBounce(pbd.hBall1);
    ballBounce(pbd.hBall2);
    ballBounce(pbd.hBall3);
    ballBounce(pbd.hBall4);
 
    bResult := Wininfo.UnlockWindowInfo(hWnd_p);
  end if;
end BounceObjects;


procedure CheckEdgePosition (hWnd_p : Win32.WinDef.HWND;
                             hBall  : Win32.Winnt.HANDLE) is
  xNewPos,yNewPos,xNewDir,yNewDir : Win32.LONG;
begin
  ballGetPosition(hBall,pPos);
  ballGetDirection(hBall,pDir);
  ballGetDimensions(hBall,pDim);

  bResult := Win32.WinUser.GetClientRect(hWnd_p,rect_p2'Access);

  -- /*
  -- ** Check each edge of the client rectagle.  If the ball goes past the
  -- ** boundries, reset the position and give it a new direction.
  -- */
  xNewDir := pDir.x;
  yNewDir := pDir.y;
  xNewPos := pPos.x + pDir.x;
  yNewPos := pPos.y + pDir.y;

  if xNewPos < rect_p2.left then
    xNewDir := (Gdidemo_Util.lRandom rem 5) + 5;
    ballSetPosition (hBall,rect_p2.left,pPos.y);
  end if;

  if (xNewPos + pDim.x) > rect_p2.right then
    xNewDir := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
    ballSetPosition(hBall, (rect_p2.right - pDim.x), pPos.y);
  end if;

  if yNewPos < rect_p2.top then
    yNewDir := (Gdidemo_Util.lRandom rem 5) + 5;
    ballSetPosition(hBall,pPos.x,rect_p2.top);
  end if;

  if (yNewPos + pDim.y) > rect_p2.bottom then
    yNewDir := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
    ballSetPosition(hBall, pPos.x, (rect_p2.bottom - pDim.y));
  end if;

  ballSetDirection(hBall,xNewDir,yNewDir);

end CheckEdgePosition; 


-- | CLEAR XFORM
-- |
procedure XFormClear (XForm : in out MYXFORM) is
begin
  for Row in 0 .. 2 loop
    for Col in 0 .. 2 loop
      if Row = Col then
        XForm.xForm (Row,Col) := 1;
      else
        XForm.xForm (Row,Col) := 0;
      end if;
    end loop;
  end loop;
end XformClear;


-- | XFORM SCALE
-- |
procedure XFormScale(XForm : in out MYXFORM;
                     xScale : Win32.LONG;
                     yScale : Win32.LONG) is
begin
  for idx in 0 .. 2 loop
    XForm.xForm (idx,0) := Xform.xForm (idx,0) * xScale;
    XForm.xForm (idx,1) := Xform.xForm (idx,1) * yScale;
  end loop;
end XformScale;


procedure XFormTrans(XForm : in out MYXFORM;
                     xTrans : Win32.LONG;
                     yTrans : Win32.LONG) is
begin
  XForm.xForm (2,0) := XForm.xForm (2,0) + xTrans;
  XForm.xForm (2,1) := XForm.xForm (2,1) + yTrans;
end XFormTrans;

 
procedure XFormPoint (XForm : MYXFORM;
                      Point : in out Win32.WinDef.POINT) is
  x,y : Win32.LONG;
begin
  x := (XForm.xForm(0,0) * Point.x) + (XForm.xForm(1,0) * Point.y) +  
        XForm.xForm(2,0);
  y := (XForm.xForm(0,1) * Point.x) + (XForm.xForm(1,1) * Point.y) + 
        XForm.xForm(2,1);
  Point.x := x;
  Point.y := y;
end XFormPoint;

-- ** -------------------------------
-- ** -------------------------------
-- ** -------------------------------
 
function ballCreate (hWnd_p  : Win32.WinDef.HWND;
                     nWidth  : Win32.LONG;
                     nHeight : Win32.LONG;
                     crColor : Win32.WinDef.COLORREF) return 
                                                      Win32.Winnt.HANDLE is
  hBall : Win32.Windef.HLOCAL;
  pbd   : PBALLDATA;
  mem_ptr : Win32.LPVOID;
begin
  hBall := Win32.WinBase.LocalAlloc (Win32.WinBase.LHND, (BALLDATA'size / 8));
  if hBall /= System.Null_Address then
    mem_ptr := Win32.WinBase.LocalLock (hBall);
    if mem_ptr /= System.Null_Address then 
      pbd := LPVOID_TO_PBALLDATA (mem_ptr);
      pbd.hWnd         := hWnd_p;
      pbd.nWidth       := nWidth;
      pbd.nHeight      := nHeight;
      pbd.xDirection   := 0;
      pbd.yDirection   := 0;
      pbd.bNewPosition := Win32.FALSE;
      pbd.xPosition    := 0;
      pbd.yPosition    := 0;
      pbd.crColor      := crColor;
      XFormClear(pbd.xForm);

      bResult := Win32.WinBase.LocalUnlock (hBall);
      return Win32.Winnt.HANDLE (hBall);
    end if;
    hlResult := Win32.WinBase.LocalFree (hBall);
  end if;
  return System.Null_Address;
end ballCreate;


function ballDestroy (hBall : Win32.Winnt.HANDLE) return Win32.BOOL is
begin
  if Win32.WinBase.LocalFree (Win32.Windef.HLOCAL (hBall)) 
      /= System.Null_Address then
    return Win32.FALSE;
  else
    return Win32.True;
  end if;
end ballDestroy;


procedure ballBounce (hBall : Win32.Winnt.HANDLE) is
  pbd            : PBALLDATA;
  pbd_ptr        : Win32.LPVOID;
  hDC_p          : Win32.WinDef.HDC;
  hBrush_p       : Win32.WinDef.HBRUSH;
  hTmp,hOld,hNew : Win32.WinDef.HRGN;
begin
  pbd_ptr := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hBall));
  if pbd_ptr /= System.Null_Address then 
    pbd := LPVOID_TO_PBALLDATA (pbd_ptr);
    -- /*
    -- ** Create old ball object.
    -- */
    pOrg.x := 0;
    pOrg.y := 0;
    pExt.x := pbd.nWidth;
    pExt.y := pbd.nHeight;
    XFormPoint(pbd.xForm,pOrg);
    XFormPoint(pbd.xForm,pExt);
    hOld := Win32.WinGdi.CreateEllipticRgn(Win32.INT(pOrg.x),Win32.INT(pOrg.y),
                                           Win32.INT(pExt.x),Win32.INT(pExt.y));

    -- /*
    -- ** Create new ball object.
    -- */
    if pbd.bNewPosition = Win32.TRUE then
      pbd.bNewPosition := Win32.FALSE;
      XFormClear(pbd.xForm);
      XFormTrans(pbd.xForm,pbd.xPosition,pbd.yPosition);
    else
      XFormTrans(pbd.xForm,pbd.xDirection,pbd.yDirection);
    end if;

    pOrg.x := 0;
    pOrg.y := 0;
    pExt.x := pbd.nWidth;
    pExt.y := pbd.nHeight;
    XFormPoint(pbd.xForm,pOrg);
    XFormPoint(pbd.xForm,pExt);
    hNew := Win32.WinGdi.CreateEllipticRgn(Win32.INT(pOrg.x),Win32.INT(pOrg.y),
                                           Win32.INT(pExt.x),Win32.INT(pExt.y));

    hDC_p := Win32.WinUser.GetDC (pbd.hWnd); 
    if hDC_p /= System.Null_Address then
      hTmp := Win32.WinGdi.CreateRectRgn(1,1,2,2);
      iResult := Win32.WinGdi.CombineRgn(hTmp,hOld,hNew,Win32.WinGdi.RGN_DIFF);
      bResult := Win32.WinGdi.FillRgn(hDC_p,hTmp,
                                Gdidemo_Util.GETCLASSBRUSH(pbd.hWnd));

      hBrush_p := Win32.WinGdi.CreateSolidBrush(pbd.crColor);
      bResult := Win32.WinGdi.FillRgn(hDC_p,hNew,hBrush_p);
      bResult := Win32.WinGdi.DeleteObject(Win32.Windef.HGDIOBJ (hBrush_p));

      iResult := Win32.WinUser.ReleaseDC(pbd.hWnd,hDC_p);

      bResult := Win32.WinGdi.DeleteObject(Win32.Windef.HGDIOBJ (hTmp));
    end if;
    bResult := Win32.WinGdi.DeleteObject(Win32.Windef.HGDIOBJ (hOld));
    bResult := Win32.WinGdi.DeleteObject(Win32.Windef.HGDIOBJ (hNew));

    bResult := Win32.WinBase.LocalUnlock(Win32.Windef.HLOCAL (hBall));
  end if;
end ballBounce;
 

procedure ballGetDimensions(hBall      : Win32.Winnt.HANDLE;
                            pDimension : in out Win32.WinDef.POINT) is
  pbd : PBALLDATA;
  bOK : Win32.BOOL;
  pbd_pvoid : Win32.LPVOID;
begin
  bOK := Win32.FALSE;
  pbd_pvoid := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hBall));
  if pbd_pvoid /= System.Null_Address then
    pbd := LPVOID_TO_PBALLDATA (pbd_pvoid);
    pDimension.x := pbd.nWidth;
    pDimension.y := pbd.nHeight;

    bOK := Win32.TRUE;
    bResult := Win32.WinBase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
  end if;
end ballGetDimensions;


function ballSetDimensions (hBall   : Win32.Winnt.HANDLE;
                            nWidth  : Win32.LONG;
                            nHeight : Win32.LONG) return Win32.BOOL is
  pbd : PBALLDATA;
  bOK : Win32.BOOL;
  pbd_pvoid : Win32.LPVOID;
begin
  bOK := Win32.FALSE;
  pbd_pvoid := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hBall));
  if pbd_pvoid /= System.Null_Address then 
    pbd := LPVOID_TO_PBALLDATA (pbd_pvoid);
    pbd.nWidth  := nWidth;
    pbd.nHeight := nHeight;

    bOK := Win32.TRUE;
    bResult := Win32.WinBase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
  end if;
  return bOK;
end ballSetDimensions; 


procedure ballGetDirection (hBall      : Win32.Winnt.HANDLE;
                            pDirection : in out Win32.WinDef.POINT)  is
  pbd : PBALLDATA;
  bOK : Win32.BOOL;
  pbd_pvoid : Win32.LPVOID;
begin
  bOK := Win32.FALSE;
  pbd_pvoid := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hBall));
  if pbd_pvoid /= System.Null_Address then 
    pbd := LPVOID_TO_PBALLDATA (pbd_pvoid);
    pDirection.x := pbd.xDirection;
    pDirection.y := pbd.yDirection;

    bOK := Win32.TRUE;
    bResult := Win32.WinBase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
  end if;
end ballGetDirection;


procedure ballSetDirection (hBall      : Win32.Winnt.HANDLE;
                            xDirection : Win32.LONG;
                            yDirection : Win32.LONG) is
  pbd : PBALLDATA;
  bOK : Win32.BOOL;
  pbd_pvoid : Win32.LPVOID;
begin
  bOK := Win32.FALSE;
  pbd_pvoid := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hBall));
  if pbd_pvoid /= System.Null_Address then 
    pbd := LPVOID_TO_PBALLDATA (pbd_pvoid);
    pbd.xDirection := xDirection;
    pbd.yDirection := yDirection;

    bOK := Win32.TRUE;
    bResult := Win32.WinBase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
  end if;
end ballSetDirection; 


procedure ballGetPosition (hBall     : Win32.Winnt.HANDLE;
                           pPosition : in out Win32.WinDef.POINT)  is
  pbd  : PBALLDATA;
  bOK  : Win32.BOOL;
  pbd_pvoid : Win32.LPVOID;
begin
  bOK := Win32.FALSE;
  pbd_pvoid := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hBall));
  if pbd_pvoid /= System.Null_Address then 
    pbd := LPVOID_TO_PBALLDATA (pbd_pvoid);
    pOrg2.x := 0;
    pOrg2.y := 0;
    XFormPoint(pbd.xForm,pOrg2);

    pPosition.x := pOrg2.x;
    pPosition.y := pOrg2.y;

    bOK := Win32.TRUE;
    bResult := Win32.WinBase.LocalUnlock(Win32.Windef.HLOCAL (hBall));
  end if;
end ballGetPosition; 


procedure ballSetPosition (hBall : Win32.Winnt.HANDLE;
                           x     : Win32.LONG;
                           y     : Win32.LONG) is 
  pbd : PBALLDATA;
  bOK : Win32.BOOL;
  pbd_pvoid : Win32.LPVOID;
begin
  bOK := Win32.FALSE;
  pbd_pvoid := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hBall));
  if pbd_pvoid /= System.Null_Address then 
    pbd := LPVOID_TO_PBALLDATA (pbd_pvoid);
    pbd.bNewPosition := Win32.TRUE;
    pbd.xPosition    := x;
    pbd.yPosition    := y;

    bOK := Win32.TRUE;
    bResult := Win32.WinBase.LocalUnlock(Win32.Windef.HLOCAL (hBall));
  end if;

end ballSetPosition;

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

end Bounce;
