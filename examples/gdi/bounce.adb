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
with Win32.Winuser;
with Win32.Wingdi;
with Win32.Winbase;

with Convert;
with Gdidemo_Util;
with System;
with Wininfo;
with Unchecked_Conversion;

with Interfaces.C; use Interfaces.C;

with Interfaces.C.Strings; use Interfaces.C.Strings;

package body Bounce is

   use type System.Address;
   use type Win32.BOOL;

   mcs : aliased Win32.Winuser.MDICREATESTRUCT;

   ps : aliased Win32.Winuser.PAINTSTRUCT;

   rect_p      : aliased Win32.Windef.RECT;
   pDimensions : aliased Win32.Windef.POINT;

   pPos, pDir, pDim : aliased Win32.Windef.POINT;
   rect_p2          : aliased Win32.Windef.RECT;

   pOrg, pExt : aliased Win32.Windef.POINT;

   pOrg2 : aliased Win32.Windef.POINT;

   bResult  : Win32.BOOL;
   iResult  : Win32.INT;
   uResult  : Win32.UINT;
   hlResult : Win32.Windef.HLOCAL;
   lreturn  : Win32.LRESULT;

   procedure XFormClear (XForm : in out MYXFORM);
   procedure XFormScale
     (XForm          : in out MYXFORM;
      xScale, yScale : Win32.LONG);
   procedure XFormTrans
     (XForm          : in out MYXFORM;
      xTrans, yTrans : Win32.LONG);
   procedure XFormPoint
     (XForm : MYXFORM;
      Point : in out Win32.Windef.POINT);

   function HANDLE_TO_PBD is new Unchecked_Conversion (
      Win32.Winnt.HANDLE,
      PBOUNCEDATA);
   function LPVOID_TO_PBALLDATA is new Unchecked_Conversion (
      Win32.LPVOID,
      PBALLDATA);

   procedure CreateBounceWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT)
   is
      hInst_p : Win32.Winnt.HANDLE;
      mcs_p   : Win32.Winuser.LPMDICREATESTRUCT;
   begin

      hInst_p := Gdidemo_Util.GETINSTANCE (hWndClient);

      mcs.szClass := BOUNCECLASS;
      mcs.szTitle := BOUNCETITLE;
      mcs.hOwner  := hInst_p;
      mcs.x       := Win32.Winuser.CW_USEDEFAULT;
      mcs.y       := Win32.Winuser.CW_USEDEFAULT;
      mcs.cx      := Win32.Winuser.CW_USEDEFAULT;
      mcs.cy      := Win32.Winuser.CW_USEDEFAULT;
      mcs.style   := 0;
      mcs.lParam  := Win32.LPARAM (nItem);

      mcs_p := mcs'Access;

      lreturn :=
         Win32.Winuser.SendMessage
           (hWndClient,
            Win32.Winuser.WM_MDICREATE,
            0,
            Convert.LPMDICREATESTRUCT_TO_LPARAM (mcs_p));

   end CreateBounceWindow;

   function BounceProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT
   is
   begin
      case wMsg is
         when Win32.Winuser.WM_CREATE =>
            bResult := BounceCreateProc (hWnd_p);

         when Win32.Winuser.WM_MOVE =>
            BounceRefresh (hWnd_p);

         when Win32.Winuser.WM_COMMAND =>
            bResult := BounceCommandProc (hWnd_p, wParam_p, lParam_p);

         when Win32.Winuser.WM_TIMER =>
            BounceObjects (hWnd_p);

         when Win32.Winuser.WM_PAINT =>
            BouncePaintProc (hWnd_p);

         when Win32.Winuser.WM_DESTROY =>
            BounceDestroyProc (hWnd_p);

         when others =>
            return Win32.Winuser.DefMDIChildProc
                     (hWnd_p,
                      wMsg,
                      wParam_p,
                      lParam_p);

      end case;

      return Win32.LRESULT (0);

   end BounceProc;

   function BounceCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL is
      pbd        : PBOUNCEDATA;
      pbd_handle : Win32.Winnt.HANDLE;
   begin
      if Wininfo.AllocWindowInfo (hWnd_p, (BOUNCEDATA'Size / 8)) =
         Win32.TRUE
      then
         pbd_handle := Wininfo.LockWindowInfo (hWnd_p);
         if pbd_handle /= System.Null_Address then
            pbd        := HANDLE_TO_PBD (pbd_handle);
            pbd.hBall1 :=
               ballCreate (hWnd_p, 20, 20, Win32.Wingdi.RGB (255, 0, 0));
            pbd.hBall2 :=
               ballCreate (hWnd_p, 20, 20, Win32.Wingdi.RGB (0, 0, 255));
            pbd.hBall3 :=
               ballCreate (hWnd_p, 20, 20, Win32.Wingdi.RGB (0, 255, 0));
            pbd.hBall4 :=
               ballCreate (hWnd_p, 20, 20, Win32.Wingdi.RGB (255, 0, 255));
            bResult    := Wininfo.UnlockWindowInfo (hWnd_p);
            uResult    := Win32.Winuser.SetTimer (hWnd_p, 1, 50, null);
            return Win32.TRUE;
         end if;
         bResult := Wininfo.FreeWindowInfo (hWnd_p);
      end if;
      return Win32.FALSE;
   end BounceCreateProc;

   function BounceCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL
   is
   begin
      return Win32.TRUE;
   end BounceCommandProc;

   procedure BouncePaintProc (hWnd_p : Win32.Windef.HWND) is
      hDC_p : Win32.Windef.HDC;
   begin
      hDC_p := Win32.Winuser.BeginPaint (hWnd_p, ps'Access);
      if hDC_p /= System.Null_Address then
         bResult := Win32.Winuser.EndPaint (hWnd_p, ps'Access);
      end if;
      BounceRefresh (hWnd_p);

   end BouncePaintProc;

   procedure BounceDestroyProc (hWnd_p : Win32.Windef.HWND) is
      pbd        : PBOUNCEDATA;
      pbd_handle : Win32.Winnt.HANDLE;
   begin
      bResult    := Win32.Winuser.KillTimer (hWnd_p, 1);
      pbd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if pbd_handle /= System.Null_Address then
         pbd     := HANDLE_TO_PBD (pbd_handle);
         bResult := ballDestroy (pbd.hBall1);
         bResult := ballDestroy (pbd.hBall2);
         bResult := ballDestroy (pbd.hBall3);
         bResult := ballDestroy (pbd.hBall4);
         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
      bResult := Wininfo.FreeWindowInfo (hWnd_p);

   end BounceDestroyProc;

   procedure BounceRefresh (hWnd_p : Win32.Windef.HWND) is
      pbd        : PBOUNCEDATA;
      pbd_handle : Win32.Winnt.HANDLE;
      hDC_p      : Win32.Windef.HDC;
      xDirection : Win32.LONG;
      yDirection : Win32.LONG;
   begin
      pbd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if pbd_handle /= System.Null_Address then
         pbd   := HANDLE_TO_PBD (pbd_handle);
         hDC_p := Win32.Winuser.GetDC (hWnd_p);
         if hDC_p /= System.Null_Address then
            bResult    := Win32.Winuser.GetClientRect (hWnd_p, rect_p'Access);
            iResult    :=
               Win32.Winuser.FillRect
                 (hDC_p,
                  rect_p'Access,
                  Gdidemo_Util.GETCLASSBRUSH (hWnd_p));
            xDirection := (Gdidemo_Util.lRandom rem 5) + 5;
            yDirection := (Gdidemo_Util.lRandom rem 5) + 5;
            ballSetPosition (pbd.hBall1, 0, 0);
            ballSetDirection (pbd.hBall1, xDirection, yDirection);
            ballGetDimensions (pbd.hBall2, pDimensions);
            ballSetPosition (pbd.hBall2, rect_p.right - pDimensions.x, 0);
            xDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
            yDirection := (Gdidemo_Util.lRandom rem 5) + 5;
            ballSetDirection (pbd.hBall2, xDirection, yDirection);
            ballGetDimensions (pbd.hBall3, pDimensions);
            ballSetPosition (pbd.hBall3, 0, (rect_p.bottom - pDimensions.y));
            xDirection := (Gdidemo_Util.lRandom rem 5) + 5;
            yDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
            ballSetDirection (pbd.hBall3, xDirection, yDirection);
            ballGetDimensions (pbd.hBall4, pDimensions);
            ballSetPosition
              (pbd.hBall4,
               rect_p.right - pDimensions.x,
               rect_p.bottom - pDimensions.y);
            xDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
            yDirection := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
            ballSetDirection (pbd.hBall4, xDirection, yDirection);

            ballBounce (pbd.hBall1);
            ballBounce (pbd.hBall2);
            ballBounce (pbd.hBall3);
            ballBounce (pbd.hBall4);

            iResult := Win32.Winuser.ReleaseDC (hWnd_p, hDC_p);
         end if;
         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
   end BounceRefresh;

   procedure BounceObjects (hWnd_p : Win32.Windef.HWND) is
      pbd        : PBOUNCEDATA;
      pbd_handle : Win32.Winnt.HANDLE;
   begin
      pbd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if pbd_handle /= System.Null_Address then
         pbd := HANDLE_TO_PBD (pbd_handle);
         CheckEdgePosition (hWnd_p, pbd.hBall1);
         CheckEdgePosition (hWnd_p, pbd.hBall2);
         CheckEdgePosition (hWnd_p, pbd.hBall3);
         CheckEdgePosition (hWnd_p, pbd.hBall4);

         ballBounce (pbd.hBall1);
         ballBounce (pbd.hBall2);
         ballBounce (pbd.hBall3);
         ballBounce (pbd.hBall4);

         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
   end BounceObjects;

   procedure CheckEdgePosition
     (hWnd_p : Win32.Windef.HWND;
      hBall  : Win32.Winnt.HANDLE)
   is
      xNewPos, yNewPos, xNewDir, yNewDir : Win32.LONG;
   begin
      ballGetPosition (hBall, pPos);
      ballGetDirection (hBall, pDir);
      ballGetDimensions (hBall, pDim);

      bResult := Win32.Winuser.GetClientRect (hWnd_p, rect_p2'Access);

      xNewDir := pDir.x;
      yNewDir := pDir.y;
      xNewPos := pPos.x + pDir.x;
      yNewPos := pPos.y + pDir.y;

      if xNewPos < rect_p2.left then
         xNewDir := (Gdidemo_Util.lRandom rem 5) + 5;
         ballSetPosition (hBall, rect_p2.left, pPos.y);
      end if;

      if (xNewPos + pDim.x) > rect_p2.right then
         xNewDir := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
         ballSetPosition (hBall, (rect_p2.right - pDim.x), pPos.y);
      end if;

      if yNewPos < rect_p2.top then
         yNewDir := (Gdidemo_Util.lRandom rem 5) + 5;
         ballSetPosition (hBall, pPos.x, rect_p2.top);
      end if;

      if (yNewPos + pDim.y) > rect_p2.bottom then
         yNewDir := -1 * ((Gdidemo_Util.lRandom rem 5) + 5);
         ballSetPosition (hBall, pPos.x, (rect_p2.bottom - pDim.y));
      end if;

      ballSetDirection (hBall, xNewDir, yNewDir);

   end CheckEdgePosition;

   procedure XFormClear (XForm : in out MYXFORM) is
   begin
      for Row in 0 .. 2 loop
         for Col in 0 .. 2 loop
            if Row = Col then
               XForm.xForm (Row, Col) := 1;
            else
               XForm.xForm (Row, Col) := 0;
            end if;
         end loop;
      end loop;
   end XFormClear;

   procedure XFormScale
     (XForm  : in out MYXFORM;
      xScale : Win32.LONG;
      yScale : Win32.LONG)
   is
   begin
      for idx in 0 .. 2 loop
         XForm.xForm (idx, 0) := XForm.xForm (idx, 0) * xScale;
         XForm.xForm (idx, 1) := XForm.xForm (idx, 1) * yScale;
      end loop;
   end XFormScale;

   procedure XFormTrans
     (XForm  : in out MYXFORM;
      xTrans : Win32.LONG;
      yTrans : Win32.LONG)
   is
   begin
      XForm.xForm (2, 0) := XForm.xForm (2, 0) + xTrans;
      XForm.xForm (2, 1) := XForm.xForm (2, 1) + yTrans;
   end XFormTrans;

   procedure XFormPoint
     (XForm : MYXFORM;
      Point : in out Win32.Windef.POINT)
   is
      x, y : Win32.LONG;
   begin
      x       := (XForm.xForm (0, 0) * Point.x) +
                 (XForm.xForm (1, 0) * Point.y) +
                 XForm.xForm (2, 0);
      y       := (XForm.xForm (0, 1) * Point.x) +
                 (XForm.xForm (1, 1) * Point.y) +
                 XForm.xForm (2, 1);
      Point.x := x;
      Point.y := y;
   end XFormPoint;

   function ballCreate
     (hWnd_p  : Win32.Windef.HWND;
      nWidth  : Win32.LONG;
      nHeight : Win32.LONG;
      crColor : Win32.Windef.COLORREF)
      return Win32.Winnt.HANDLE
   is
      hBall   : Win32.Windef.HLOCAL;
      pbd     : PBALLDATA;
      mem_ptr : Win32.LPVOID;
   begin
      hBall :=
         Win32.Winbase.LocalAlloc (Win32.Winbase.LHND, (BALLDATA'Size / 8));
      if hBall /= System.Null_Address then
         mem_ptr := Win32.Winbase.LocalLock (hBall);
         if mem_ptr /= System.Null_Address then
            pbd              := LPVOID_TO_PBALLDATA (mem_ptr);
            pbd.hWnd         := hWnd_p;
            pbd.nWidth       := nWidth;
            pbd.nHeight      := nHeight;
            pbd.xDirection   := 0;
            pbd.yDirection   := 0;
            pbd.bNewPosition := Win32.FALSE;
            pbd.xPosition    := 0;
            pbd.yPosition    := 0;
            pbd.crColor      := crColor;
            XFormClear (pbd.xForm);

            bResult := Win32.Winbase.LocalUnlock (hBall);
            return Win32.Winnt.HANDLE (hBall);
         end if;
         hlResult := Win32.Winbase.LocalFree (hBall);
      end if;
      return System.Null_Address;
   end ballCreate;

   function ballDestroy (hBall : Win32.Winnt.HANDLE) return Win32.BOOL is
   begin
      if Win32.Winbase.LocalFree (Win32.Windef.HLOCAL (hBall)) /=
         System.Null_Address
      then
         return Win32.FALSE;
      else
         return Win32.TRUE;
      end if;
   end ballDestroy;

   procedure ballBounce (hBall : Win32.Winnt.HANDLE) is
      pbd              : PBALLDATA;
      pbd_ptr          : Win32.LPVOID;
      hDC_p            : Win32.Windef.HDC;
      hBrush_p         : Win32.Windef.HBRUSH;
      hTmp, hOld, hNew : Win32.Windef.HRGN;
   begin
      pbd_ptr := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hBall));
      if pbd_ptr /= System.Null_Address then
         pbd    := LPVOID_TO_PBALLDATA (pbd_ptr);
         pOrg.x := 0;
         pOrg.y := 0;
         pExt.x := pbd.nWidth;
         pExt.y := pbd.nHeight;
         XFormPoint (pbd.xForm, pOrg);
         XFormPoint (pbd.xForm, pExt);
         hOld :=
            Win32.Wingdi.CreateEllipticRgn
              (Win32.INT (pOrg.x),
               Win32.INT (pOrg.y),
               Win32.INT (pExt.x),
               Win32.INT (pExt.y));

         if pbd.bNewPosition = Win32.TRUE then
            pbd.bNewPosition := Win32.FALSE;
            XFormClear (pbd.xForm);
            XFormTrans (pbd.xForm, pbd.xPosition, pbd.yPosition);
         else
            XFormTrans (pbd.xForm, pbd.xDirection, pbd.yDirection);
         end if;

         pOrg.x := 0;
         pOrg.y := 0;
         pExt.x := pbd.nWidth;
         pExt.y := pbd.nHeight;
         XFormPoint (pbd.xForm, pOrg);
         XFormPoint (pbd.xForm, pExt);
         hNew :=
            Win32.Wingdi.CreateEllipticRgn
              (Win32.INT (pOrg.x),
               Win32.INT (pOrg.y),
               Win32.INT (pExt.x),
               Win32.INT (pExt.y));

         hDC_p := Win32.Winuser.GetDC (pbd.hWnd);
         if hDC_p /= System.Null_Address then
            hTmp    := Win32.Wingdi.CreateRectRgn (1, 1, 2, 2);
            iResult :=
               Win32.Wingdi.CombineRgn
                 (hTmp,
                  hOld,
                  hNew,
                  Win32.Wingdi.RGN_DIFF);
            bResult :=
               Win32.Wingdi.FillRgn
                 (hDC_p,
                  hTmp,
                  Gdidemo_Util.GETCLASSBRUSH (pbd.hWnd));

            hBrush_p := Win32.Wingdi.CreateSolidBrush (pbd.crColor);
            bResult  := Win32.Wingdi.FillRgn (hDC_p, hNew, hBrush_p);
            bResult  :=
               Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hBrush_p));

            iResult := Win32.Winuser.ReleaseDC (pbd.hWnd, hDC_p);

            bResult :=
               Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hTmp));
         end if;
         bResult := Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hOld));
         bResult := Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hNew));

         bResult := Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
      end if;
   end ballBounce;

   procedure ballGetDimensions
     (hBall      : Win32.Winnt.HANDLE;
      pDimension : in out Win32.Windef.POINT)
   is
      pbd       : PBALLDATA;
      bOK       : Win32.BOOL;
      pbd_pvoid : Win32.LPVOID;
   begin
      bOK       := Win32.FALSE;
      pbd_pvoid := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hBall));
      if pbd_pvoid /= System.Null_Address then
         pbd          := LPVOID_TO_PBALLDATA (pbd_pvoid);
         pDimension.x := pbd.nWidth;
         pDimension.y := pbd.nHeight;

         bOK     := Win32.TRUE;
         bResult := Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
      end if;
   end ballGetDimensions;

   function ballSetDimensions
     (hBall   : Win32.Winnt.HANDLE;
      nWidth  : Win32.LONG;
      nHeight : Win32.LONG)
      return Win32.BOOL
   is
      pbd       : PBALLDATA;
      bOK       : Win32.BOOL;
      pbd_pvoid : Win32.LPVOID;
   begin
      bOK       := Win32.FALSE;
      pbd_pvoid := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hBall));
      if pbd_pvoid /= System.Null_Address then
         pbd         := LPVOID_TO_PBALLDATA (pbd_pvoid);
         pbd.nWidth  := nWidth;
         pbd.nHeight := nHeight;

         bOK     := Win32.TRUE;
         bResult := Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
      end if;
      return bOK;
   end ballSetDimensions;

   procedure ballGetDirection
     (hBall      : Win32.Winnt.HANDLE;
      pDirection : in out Win32.Windef.POINT)
   is
      pbd       : PBALLDATA;
      bOK       : Win32.BOOL;
      pbd_pvoid : Win32.LPVOID;
   begin
      bOK       := Win32.FALSE;
      pbd_pvoid := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hBall));
      if pbd_pvoid /= System.Null_Address then
         pbd          := LPVOID_TO_PBALLDATA (pbd_pvoid);
         pDirection.x := pbd.xDirection;
         pDirection.y := pbd.yDirection;

         bOK     := Win32.TRUE;
         bResult := Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
      end if;
   end ballGetDirection;

   procedure ballSetDirection
     (hBall      : Win32.Winnt.HANDLE;
      xDirection : Win32.LONG;
      yDirection : Win32.LONG)
   is
      pbd       : PBALLDATA;
      bOK       : Win32.BOOL;
      pbd_pvoid : Win32.LPVOID;
   begin
      bOK       := Win32.FALSE;
      pbd_pvoid := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hBall));
      if pbd_pvoid /= System.Null_Address then
         pbd            := LPVOID_TO_PBALLDATA (pbd_pvoid);
         pbd.xDirection := xDirection;
         pbd.yDirection := yDirection;

         bOK     := Win32.TRUE;
         bResult := Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
      end if;
   end ballSetDirection;

   procedure ballGetPosition
     (hBall     : Win32.Winnt.HANDLE;
      pPosition : in out Win32.Windef.POINT)
   is
      pbd       : PBALLDATA;
      bOK       : Win32.BOOL;
      pbd_pvoid : Win32.LPVOID;
   begin
      bOK       := Win32.FALSE;
      pbd_pvoid := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hBall));
      if pbd_pvoid /= System.Null_Address then
         pbd     := LPVOID_TO_PBALLDATA (pbd_pvoid);
         pOrg2.x := 0;
         pOrg2.y := 0;
         XFormPoint (pbd.xForm, pOrg2);

         pPosition.x := pOrg2.x;
         pPosition.y := pOrg2.y;

         bOK     := Win32.TRUE;
         bResult := Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
      end if;
   end ballGetPosition;

   procedure ballSetPosition
     (hBall : Win32.Winnt.HANDLE;
      x     : Win32.LONG;
      y     : Win32.LONG)
   is
      pbd       : PBALLDATA;
      bOK       : Win32.BOOL;
      pbd_pvoid : Win32.LPVOID;
   begin
      bOK       := Win32.FALSE;
      pbd_pvoid := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hBall));
      if pbd_pvoid /= System.Null_Address then
         pbd              := LPVOID_TO_PBALLDATA (pbd_pvoid);
         pbd.bNewPosition := Win32.TRUE;
         pbd.xPosition    := x;
         pbd.yPosition    := y;

         bOK     := Win32.TRUE;
         bResult := Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hBall));
      end if;

   end ballSetPosition;

end Bounce;
