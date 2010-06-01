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

with Ada.Unchecked_Conversion;
with Convert;
with Gdidemo_Util;
with System;
with Win32;
with Win32.Windef;
with Win32.Winnt;
with Win32.Winuser;
with Win32.Wingdi;
with Wininfo;

package body Xform is

   use Interfaces.C;

   use type System.Address;
   use type Win32.LONG;
   use type Win32.BOOL;

   bResult : Win32.BOOL;
   uResult : Win32.UINT;
   iResult : Win32.INT;
   lReturn : Win32.LRESULT;

   mcs       : aliased Win32.Winuser.MDICREATESTRUCT;
   rect_p    : aliased Win32.Windef.RECT;
   rect2_p   : aliased Win32.Windef.RECT;
   old_point : aliased Win32.Windef.POINT;
   poly_pts  : aliased pt_array;  --Win32.WinDef.POINT_A;
   old_pt    : aliased Win32.Windef.POINT;
   poly2_pts : aliased pt_array;  --WinDef.POINT_A;
   xForm_p   : aliased Win32.Wingdi.XFORM;
   rect3_p   : aliased Win32.Windef.RECT;
   ps        : aliased Win32.Winuser.PAINTSTRUCT;

   function HANDLE_TO_PXFORMDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE,
      PXFORMDATA);

   function PT_ARRAY_TO_PT
     (param : pt_array)
      return Win32.Wingdi.ac_POINT_t
   is
      function to_pt is new Ada.Unchecked_Conversion (
         Win32.LONG,
         Win32.Wingdi.ac_POINT_t);
   begin
      return to_pt (param (0).x);
   end PT_ARRAY_TO_PT;

   procedure ResetXForm (hWnd_p : Win32.Windef.HWND);
   procedure DrawXForm (hWnd_p : Win32.Windef.HWND);

   procedure CreateXFormWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT)
   is
      hInst : Win32.Winnt.HANDLE;
      mcs_p : Win32.Winuser.LPMDICREATESTRUCT;
   begin
      hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

      mcs.szClass := XFORMCLASS;
      mcs.szTitle := XFORMTITLE;
      mcs.hOwner  := hInst;
      mcs.x       := Win32.Winuser.CW_USEDEFAULT;
      mcs.y       := Win32.Winuser.CW_USEDEFAULT;
      mcs.cx      := Win32.Winuser.CW_USEDEFAULT;
      mcs.cy      := Win32.Winuser.CW_USEDEFAULT;
      mcs.style   := 0;
      mcs.lParam  := Win32.LPARAM (nItem);

      mcs_p := mcs'Access;

      lReturn :=
         Win32.Winuser.SendMessage
           (hWndClient,
            Win32.Winuser.WM_MDICREATE,
            0,
            Convert.LPMDICREATESTRUCT_TO_LPARAM (mcs_p));

   end CreateXFormWindow;

   function XFormProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT
   is
   begin
      case wMsg is

         when Win32.Winuser.WM_CREATE =>
            bResult := XFormCreateProc (hWnd_p);

         when Win32.Winuser.WM_MOVE =>
            ResetXForm (hWnd_p);

         when Win32.Winuser.WM_TIMER =>
            DrawXForm (hWnd_p);

         when Win32.Winuser.WM_COMMAND =>
            bResult := XFormCommandProc (hWnd_p, wParam_p, lParam_p);

         when Win32.Winuser.WM_PAINT =>
            XFormPaintProc (hWnd_p);

         when Win32.Winuser.WM_DESTROY =>
            XFormDestroyProc (hWnd_p);

         when others =>
            return Win32.Winuser.DefMDIChildProc
                     (hWnd_p,
                      wMsg,
                      wParam_p,
                      lParam_p);
      end case;
      return 0;
   end XFormProc;

   function XFormCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL is
      pxd        : PXFORMDATA := new XFORMDATA;
      pxd_handle : Win32.Winnt.HANDLE;
      dx, dy     : Win32.LONG;
   begin
      if Wininfo.AllocWindowInfo (hWnd_p, (XFORMDATA'Size / 8)) =
         Win32.TRUE
      then
         pxd_handle := Wininfo.LockWindowInfo (hWnd_p);
         if pxd_handle /= System.Null_Address then
            pxd     := HANDLE_TO_PXFORMDATA (pxd_handle);
            bResult := Win32.Winuser.GetClientRect (hWnd_p, rect_p'Access);

            dx := (rect_p.right + rect_p.left) / 16;
            dy := (rect_p.bottom + rect_p.top) / 16;

            pxd.pObject (0).x := dx * 2;
            pxd.pObject (0).y := 0;
            pxd.pObject (1).x := dx;
            pxd.pObject (1).y := dy;
            pxd.pObject (2).x := 0;
            pxd.pObject (2).y := dy;
            pxd.pObject (3).x := dx * 2;
            pxd.pObject (3).y := 0;
            pxd.nObject       := 4;

            pxd.xForm.eM11 := 0.866;
            pxd.xForm.eM12 := 0.5;
            pxd.xForm.eM21 := -0.5;
            pxd.xForm.eM22 := 0.866;
            pxd.xForm.eDx  := 0.0;
            pxd.xForm.eDy  := 0.0;

            bResult := Wininfo.UnlockWindowInfo (hWnd_p);
            uResult := Win32.Winuser.SetTimer (hWnd_p, 1, 500, null);
            return Win32.TRUE;
         end if;
         bResult := Wininfo.FreeWindowInfo (hWnd_p);
      end if;
      return Win32.FALSE;
   end XFormCreateProc;

   function XFormCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL
   is
   begin
      return Win32.TRUE;
   end XFormCommandProc;

   procedure XFormPaintProc (hWnd_p : Win32.Windef.HWND) is
      hDC_p : Win32.Windef.HDC;
   begin
      hDC_p := Win32.Winuser.BeginPaint (hWnd_p, ps'Access);
      if hDC_p /= System.Null_Address then
         bResult := Win32.Winuser.EndPaint (hWnd_p, ps'Access);
      end if;
      ResetXForm (hWnd_p);
   end XFormPaintProc;

   procedure XFormDestroyProc (hWnd_p : Win32.Windef.HWND) is
   begin
      bResult := Win32.Winuser.KillTimer (hWnd_p, 1);
      bResult := Wininfo.FreeWindowInfo (hWnd_p);
   end XFormDestroyProc;

   procedure ResetXForm (hWnd_p : Win32.Windef.HWND) is
      pxd        : PXFORMDATA;
      pxd_handle : Win32.Winnt.HANDLE;
      hDC_p      : Win32.Windef.HDC;
   begin
      pxd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if pxd_handle /= System.Null_Address then
         pxd   := HANDLE_TO_PXFORMDATA (pxd_handle);
         hDC_p := Win32.Winuser.GetDC (hWnd_p);
         if hDC_p /= System.Null_Address then
            bResult := Win32.Winuser.GetClientRect (hWnd_p, rect2_p'Access);
            bResult :=
               Win32.Wingdi.BitBlt
                 (hDC_p,
                  0,
                  0,
                  Win32.INT (rect2_p.right),
                  Win32.INT (rect2_p.bottom),
                  System.Null_Address,
                  0,
                  0,
                  0);
            bResult :=
               Win32.Wingdi.SetViewportOrgEx
                 (hDC_p,
                  Win32.INT (rect2_p.right / 2),
                  Win32.INT (rect2_p.bottom / 2),
                  old_point'Access);
            bResult :=
               Win32.Wingdi.SetWorldTransform (hDC_p, pxd.xForm'Access);
            for I in 0 .. 3 loop
               poly_pts (I).x := pxd.pObject (I).x;
               poly_pts (I).y := pxd.pObject (I).y;
            end loop;
            bResult :=
               Win32.Wingdi.Polyline
                 (hDC_p, --poly_pts'Access, pxd.nObject);
                  PT_ARRAY_TO_PT (poly_pts),
                  pxd.nObject);
            bResult :=
               Win32.Wingdi.ModifyWorldTransform
                 (hDC_p,
                  pxd.xForm'Access,
                  Win32.Wingdi.MWT_IDENTITY);

            bResult :=
               Win32.Wingdi.SetViewportOrgEx (hDC_p, 0, 0, old_point'Access);

            iResult := Win32.Winuser.ReleaseDC (hWnd_p, hDC_p);
         end if;
         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
   end ResetXForm;

   procedure DrawXForm (hWnd_p : Win32.Windef.HWND) is
      pxd        : PXFORMDATA;
      pxd_handle : Win32.Winnt.HANDLE;
      hDC_p      : Win32.Windef.HDC;
   begin
      pxd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if pxd_handle /= System.Null_Address then
         pxd   := HANDLE_TO_PXFORMDATA (pxd_handle);
         hDC_p := Win32.Winuser.GetDC (hWnd_p);
         if hDC_p /= System.Null_Address then

            bResult := Win32.Winuser.GetClientRect (hWnd_p, rect3_p'Access);
            bResult :=
               Win32.Wingdi.SetViewportOrgEx
                 (hDC_p,
                  Win32.INT (rect3_p.right / 2),
                  Win32.INT (rect3_p.bottom / 2),
                  old_pt'Access);

            bResult :=
               Win32.Wingdi.SetWorldTransform (hDC_p, pxd.xForm'Access);
            for I in 0 .. 3 loop
               poly2_pts (I).x := pxd.pObject (I).x;
               poly2_pts (I).y := pxd.pObject (I).y;
            end loop;
            bResult :=
               Win32.Wingdi.Polyline
                 (hDC_p, --poly2_pts'Access, pxd.nObject);
                  PT_ARRAY_TO_PT (poly2_pts),
                  pxd.nObject);

            bResult :=
               Win32.Wingdi.ModifyWorldTransform
                 (hDC_p,
                  pxd.xForm'Access,
                  Win32.Wingdi.MWT_RIGHTMULTIPLY);
            for I in 0 .. 3 loop
               poly2_pts (I).x := pxd.pObject (I).x;
               poly2_pts (I).y := pxd.pObject (I).y;
            end loop;
            bResult :=
               Win32.Wingdi.Polyline
                 (hDC_p,  --poly2_pts'Access, pxd.nObject);
                  PT_ARRAY_TO_PT (poly2_pts),
                  pxd.nObject);

            bResult        :=
               Win32.Wingdi.GetWorldTransform (hDC_p, xForm_p'Access);
            pxd.xForm.eM11 := xForm_p.eM11;
            pxd.xForm.eM12 := xForm_p.eM12;
            pxd.xForm.eM21 := xForm_p.eM21;
            pxd.xForm.eM22 := xForm_p.eM22;
            pxd.xForm.eDx  := xForm_p.eDx;
            pxd.xForm.eDy  := xForm_p.eDy;

            bResult :=
               Win32.Wingdi.ModifyWorldTransform
                 (hDC_p,
                  pxd.xForm'Access,
                  Win32.Wingdi.MWT_IDENTITY);

            bResult :=
               Win32.Wingdi.SetViewportOrgEx (hDC_p, 0, 0, old_pt'Access);

            iResult := Win32.Winuser.ReleaseDC (hWnd_p, hDC_p);
         end if;
         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
   end DrawXForm;

end Xform;
