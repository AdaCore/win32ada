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
with Interfaces.C.Pointers;
with System;
with Win32;                    use Win32;
with Win32.Winbase;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;
with Win32.Winuser;
with Wininfo;

use  Interfaces.C;

package body Poly is

   use type System.Address;

   bResult  : Win32.BOOL := Win32.TRUE;
   uResult  : Win32.UINT;
   iResult  : Win32.INT;
   lReturn  : Win32.LRESULT;
   hGResult : Win32.Windef.HGLOBAL;

   function HANDLE_TO_PPOLYDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE,
      PPOLYDATA);
   function LPVOID_TO_PBEZBUFFER is new Ada.Unchecked_Conversion (
      Win32.LPVOID,
      PBEZBUFFER);
   function TO_AC_POINT_T is new Ada.Unchecked_Conversion (
      pt_array_ptr,
      Win32.Wingdi.ac_POINT_t);

   function LPVOID_TO_PBEZBUFFER_ARRAY is new Ada.Unchecked_Conversion (
      Win32.LPVOID,
      PBEZBUFFER_ARRAY);

   mcs      : aliased Win32.Winuser.MDICREATESTRUCT;
   ps       : aliased Win32.Winuser.PAINTSTRUCT;
   rect_p   : aliased Win32.Windef.RECT;
   rect2_p  : aliased Win32.Windef.RECT;
   bez1_pts : aliased pt_array;
   rect3_p  : aliased Win32.Windef.RECT;
   bez2_pts : aliased pt_array;

   type COLORREF_ARRAY is array (0 .. 19) of Win32.Windef.COLORREF;
   crColor : COLORREF_ARRAY :=
     (16#000000FF#,
      16#0000FF00#,
      16#00FF0000#,
      16#0000FFFF#,
      16#00FF00FF#,
      16#00FFFF00#,
      16#00FFFFFF#,
      16#00000080#,
      16#00008000#,
      16#00800000#,
      16#00008080#,
      16#00800080#,
      16#00808000#,
      16#00808080#,
      16#000000FF#,
      16#0000FF00#,
      16#00FF0000#,
      16#0000FFFF#,
      16#00FF00FF#,
      16#00FFFF00#);

   procedure CreatePolyWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT)
   is
      hInst : Win32.Winnt.HANDLE;
      mcs_p : Win32.Winuser.LPMDICREATESTRUCT;
   begin
      hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

      mcs.szClass := POLYCLASS;
      mcs.szTitle := POLYTITLE;
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

   end CreatePolyWindow;

   function PolyProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT
   is
   begin
      case wMsg is
         when Win32.Winuser.WM_CREATE =>
            bResult := PolyCreateProc (hWnd_p);

         when Win32.Winuser.WM_COMMAND =>
            bResult := PolyCommandProc (hWnd_p, wParam_p, lParam_p);

         when Win32.Winuser.WM_MOVE =>
            PolyRedraw (hWnd_p);

         when Win32.Winuser.WM_TIMER =>
            PolyDrawBez (hWnd_p);

         when Win32.Winuser.WM_PAINT =>
            PolyPaintProc (hWnd_p);

         when Win32.Winuser.WM_DESTROY =>
            PolyDestroyProc (hWnd_p);

         when others =>
            return Win32.Winuser.DefMDIChildProc
                     (hWnd_p,
                      wMsg,
                      wParam_p,
                      lParam_p);
      end case;
      return 0;
   end PolyProc;

   function PolyCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL is
      ppd        : PPOLYDATA;
      ppd_handle : Win32.Winnt.HANDLE;
   begin
      if Wininfo.AllocWindowInfo (hWnd_p, (POLYDATA'Size / 8)) =
         Win32.TRUE
      then
         ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
         if ppd_handle /= System.Null_Address then
            ppd            := HANDLE_TO_PPOLYDATA (ppd_handle);
            ppd.nBezTotal  := 20;
            ppd.nBezCurr   := 0;
            ppd.nColor     := 0;
            ppd.hBezBuffer :=
               Win32.Winbase.GlobalAlloc
                 (Win32.Winbase.GHND,
                  (BEZBUFFER'Size / 8) * MAX_BEZIER);
            bResult        := Wininfo.UnlockWindowInfo (hWnd_p);
            PolyInitPoints (hWnd_p);
            uResult := Win32.Winuser.SetTimer (hWnd_p, 1, 50, null);
            return Win32.TRUE;
         end if;
         bResult := Wininfo.FreeWindowInfo (hWnd_p);
      end if;
      return Win32.FALSE;
   end PolyCreateProc;

   function PolyCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL
   is
   begin
      return Win32.TRUE;
   end PolyCommandProc;

   procedure PolyPaintProc (hWnd_p : Windef.HWND) is
      hDC_p : Win32.Windef.HDC;
   begin
      hDC_p := Win32.Winuser.BeginPaint (hWnd_p, ps'Access);
      if hDC_p /= System.Null_Address then
         bResult := Win32.Winuser.EndPaint (hWnd_p, ps'Access);
      end if;
      PolyRedraw (hWnd_p);
   end PolyPaintProc;

   procedure PolyDestroyProc (hWnd_p : Win32.Windef.HWND) is
      ppd        : PPOLYDATA;
      ppd_handle : Win32.Winnt.HANDLE;
   begin
      bResult    := Win32.Winuser.KillTimer (hWnd_p, 1);
      ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if ppd_handle /= System.Null_Address then
         ppd      := HANDLE_TO_PPOLYDATA (ppd_handle);
         hGResult := Win32.Winbase.GlobalFree (ppd.hBezBuffer);
         bResult  := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
      bResult := Wininfo.FreeWindowInfo (hWnd_p);
   end PolyDestroyProc;

   function PolyNewVel (i : Win32.INT) return Win32.LONG is
      nRet : Win32.LONG;
   begin
      if (i = 1) or (i = 2) then
         nRet := ((Gdidemo_Util.lRandom rem VELMAX) / 3) + VELMIN;
      else
         nRet := (Gdidemo_Util.lRandom rem VELMAX) + VELMIN;
      end if;
      if nRet < 0 then
         return (-1 * nRet);
      else
         return nRet;
      end if;
   end PolyNewVel;

   procedure PolyInitPoints (hWnd_p : Win32.Windef.HWND) is
      ppd        : PPOLYDATA;
      lpBez      : PBEZBUFFER;
      ppd_handle : Win32.Winnt.HANDLE;
      lpBez_void : Win32.LPVOID;
   begin
      ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if ppd_handle /= System.Null_Address then
         ppd        := HANDLE_TO_PPOLYDATA (ppd_handle);
         lpBez_void := Winbase.GlobalLock (ppd.hBezBuffer);
         if lpBez_void /= System.Null_Address then
            lpBez   := LPVOID_TO_PBEZBUFFER (lpBez_void);
            bResult := Win32.Winuser.GetClientRect (hWnd_p, rect_p'Access);
            for idx in 0 .. BEZ_PTS - 1 loop
               lpBez.pPts (idx).x := (Gdidemo_Util.lRandom) rem rect_p.right;
               lpBez.pPts (idx).y := (Gdidemo_Util.lRandom) rem
                                     rect_p.bottom;

               ppd.pVel (idx).x := PolyNewVel (Win32.INT (idx));
               ppd.pVel (idx).y := PolyNewVel (Win32.INT (idx));
            end loop;
            bResult := Win32.Winbase.GlobalUnlock (ppd.hBezBuffer);
         end if;
         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
   end PolyInitPoints;

   procedure PolyRedraw (hWnd_p : Win32.Windef.HWND) is
      ppd         : PPOLYDATA;
      lpBez       : PBEZBUFFER_ARRAY;
      hDC_p       : Win32.Windef.HDC;
      ppd_handle  : Win32.Winnt.HANDLE;
      lpBez_void  : Win32.LPVOID;
      bez_pts_ptr : pt_array_ptr;
   begin
      ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if ppd_handle /= System.Null_Address then
         ppd        := HANDLE_TO_PPOLYDATA (ppd_handle);
         lpBez_void := Win32.Winbase.GlobalLock (ppd.hBezBuffer);
         if lpBez_void /= System.Null_Address then
            lpBez := LPVOID_TO_PBEZBUFFER_ARRAY (lpBez_void);
            hDC_p := Win32.Winuser.GetDC (hWnd_p);
            if hDC_p /= System.Null_Address then
               lpBez (0)    := lpBez (ppd.nBezCurr);
               ppd.nBezCurr := 0;

               for j in 1 .. ppd.nBezTotal - 1 loop
                  for i in 0 .. 3 loop
                     lpBez (j).pPts (i).x := -1;
                     lpBez (j).pPts (i).y := 0;
                  end loop;
               end loop;
               bResult :=
                  Win32.Winuser.GetClientRect (hWnd_p, rect2_p'Access);
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

               for i in 0 .. 3 loop
                  bez1_pts (i).x := lpBez (0).pPts (i).x;
                  bez1_pts (i).y := lpBez (0).pPts (i).y;
               end loop;
               bez_pts_ptr := bez1_pts'Access;
               bResult     :=
                  Win32.Wingdi.PolyBezier
                    (hDC_p,
                     TO_AC_POINT_T (bez_pts_ptr),
                     BEZ_PTS_DW);
               iResult     := Win32.Winuser.ReleaseDC (hWnd_p, hDC_p);
            end if;
            bResult := Win32.Winbase.GlobalUnlock (ppd.hBezBuffer);
         end if;
         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
   end PolyRedraw;

   procedure PolyDrawBez (hWnd_p : Win32.Windef.HWND) is
      ppd            : PPOLYDATA;
      lpBez          : PBEZBUFFER_ARRAY;
      lpCurr, lpPrev : BEZBUFFER;
      x, y           : Win32.LONG;
      hDC_p          : Win32.Windef.HDC;
      hPen_p         : Win32.Windef.HGDIOBJ;
      ppd_handle     : Win32.Winnt.HANDLE;
      lpBez_void     : Win32.LPVOID;
      bez_pts_ptr    : pt_array_ptr;
      gdi_obj        : Win32.Windef.HGDIOBJ;
   begin
      ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
      if ppd_handle /= System.Null_Address then
         ppd        := HANDLE_TO_PPOLYDATA (ppd_handle);
         lpBez_void := Win32.Winbase.GlobalLock (ppd.hBezBuffer);
         if lpBez_void /= System.Null_Address then
            lpBez := LPVOID_TO_PBEZBUFFER_ARRAY (lpBez_void);
            hDC_p := Win32.Winuser.GetDC (hWnd_p);
            if hDC_p /= System.Null_Address then
               bResult      :=
                  Win32.Winuser.GetClientRect (hWnd_p, rect3_p'Access);
               lpPrev       := lpBez (ppd.nBezCurr);
               ppd.nBezCurr := ppd.nBezCurr + 1;
               if ppd.nBezCurr >= ppd.nBezTotal then
                  ppd.nBezCurr := 0;
                  ppd.nColor   := (ppd.nColor + 1) rem 20;
               end if;
               lpCurr := lpBez (ppd.nBezCurr);

               if lpCurr.pPts (0).x /= -1 then
                  hPen_p :=
                     Win32.Wingdi.SelectObject
                       (hDC_p,
                        Win32.Windef.HGDIOBJ (Win32.Wingdi.GetStockObject
                                                 (Win32.Wingdi.BLACK_PEN)));
                  for i in 0 .. 3 loop
                     bez2_pts (i).x := lpCurr.pPts (i).x;
                     bez2_pts (i).y := lpCurr.pPts (i).y;
                  end loop;
                  bez_pts_ptr := bez2_pts'Access;
                  bResult     :=
                     Win32.Wingdi.PolyBezier
                       (hDC_p,
                        TO_AC_POINT_T (bez_pts_ptr),
                        BEZ_PTS_DW);
                  gdi_obj     := Win32.Wingdi.SelectObject (hDC_p, hPen_p);
               end if;

               for idx in 0 .. 3 loop --BEZ_PTS - 1 loop
                  x := lpPrev.pPts (idx).x + ppd.pVel (idx).x;
                  y := lpPrev.pPts (idx).y + ppd.pVel (idx).y;

                  if x >= rect3_p.right then
                     x                := rect3_p.right -
                                         ((x - rect3_p.right) + 1);
                     ppd.pVel (idx).x := -1 * PolyNewVel (Win32.INT (idx));
                  end if;

                  if x <= rect3_p.left then
                     x                := rect3_p.left +
                                         ((rect3_p.left - x) + 1);
                     ppd.pVel (idx).x := PolyNewVel (Win32.INT (idx));
                  end if;

                  if y >= rect3_p.bottom then
                     y                := rect3_p.bottom -
                                         ((y - rect3_p.bottom) + 1);
                     ppd.pVel (idx).y := -1 * PolyNewVel (Win32.INT (idx));
                  end if;

                  if y <= rect3_p.top then
                     y                := rect3_p.top +
                                         ((rect3_p.top - y) + 1);
                     ppd.pVel (idx).y := PolyNewVel (Win32.INT (idx));
                  end if;

                  lpCurr.pPts (idx).x := x;
                  lpCurr.pPts (idx).y := y;

               end loop;
               hPen_p :=
                  Win32.Wingdi.SelectObject
                    (hDC_p,
                     Win32.Windef.HGDIOBJ (Win32.Wingdi.CreatePen
                                              (Win32.Wingdi.PS_SOLID,
                                               1,
                                               crColor (ppd.nColor))));
               for i in 0 .. 3 loop
                  bez2_pts (i).x := lpCurr.pPts (i).x;
                  bez2_pts (i).y := lpCurr.pPts (i).y;
               end loop;
               bez_pts_ptr          := bez2_pts'Access;
               bResult              :=
                  Win32.Wingdi.PolyBezier
                    (hDC_p,
                     TO_AC_POINT_T (bez_pts_ptr),
                     BEZ_PTS_DW);
               bResult              :=
                  Win32.Wingdi.DeleteObject
                    (Win32.Wingdi.SelectObject (hDC_p, hPen_p));
               iResult              :=
                  Win32.Wingdi.SetROP2 (hDC_p, Win32.Wingdi.R2_COPYPEN);
               iResult              :=
                  Win32.Winuser.ReleaseDC (hWnd_p, hDC_p);
               lpBez (ppd.nBezCurr) := lpCurr;
            end if;
            bResult := Win32.Winbase.GlobalUnlock (ppd.hBezBuffer);
         end if;
         bResult := Wininfo.UnlockWindowInfo (hWnd_p);
      end if;
   end PolyDrawBez;

end Poly;
