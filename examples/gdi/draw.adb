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
--  Copyright (C) 2000-2014, AdaCore
--
-------------------------------------------------------------------------------

with Win32;                    use Win32;
with Win32.Windef;             use Win32.Windef;
with Win32.Winuser;            use Win32.Winuser;
with Win32.Wingdi;             use Win32.Wingdi;
with Win32.Winbase;            use Win32.Winbase;
with Win32.Winnt;              use Win32.Winnt;
with Ada.Unchecked_Conversion;
with Convert;
with Gdidemo_Util;
with Interfaces.C;             use Interfaces.C;
with Wininfo;
with System;

package body Draw is

   use type System.Address;

   mcs : aliased Win32.Winuser.MDICREATESTRUCT;

   ps : aliased Win32.Winuser.PAINTSTRUCT;

   rect_p : aliased Win32.Windef.RECT;

   bResult : Win32.BOOL;
   iResult : Win32.INT;
   uResult : Win32.UINT_PTR;
   lReturn : Win32.LRESULT;

   function HANDLE_TO_PDRAWDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE,
      PDRAWDATA);

   procedure CreateDrawWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT)
   is
      hInst : Win32.Winnt.HANDLE;
      mcs_p : Win32.Winuser.LPMDICREATESTRUCT;
   begin
      hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

      mcs.szClass := DRAWCLASS;
      mcs.szTitle := DRAWTITLE;
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

   end CreateDrawWindow;

   function DrawProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT
   is
   begin
      case wMsg is

         when Win32.Winuser.WM_CREATE =>
            bResult := DrawCreateProc (hWnd_p);

         when Win32.Winuser.WM_COMMAND =>
            bResult := DrawCommandProc (hWnd_p, wParam_p, lParam_p);

         when Win32.Winuser.WM_TIMER =>
            DrawObject (hWnd_p);

         when Win32.Winuser.WM_PAINT =>
            DrawPaintProc (hWnd_p);

         when Win32.Winuser.WM_DESTROY =>
            DrawDestroyProc (hWnd_p);

         when others =>
            return Win32.Winuser.DefMDIChildProc
                     (hWnd_p,
                      wMsg,
                      wParam_p,
                      lParam_p);

      end case;

      return (0);

   end DrawProc;

   function DrawCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL is
      pdd        : PDRAWDATA := new DRAWDATA;
      pdd_handle : Win32.Winnt.HANDLE;
   begin
      if Wininfo.AllocWindowInfo (hWnd_p, (DRAWDATA'Size / 8)) =
         Win32.TRUE
      then
         pdd_handle := Wininfo.LockWindowInfo (hWnd_p);
         if pdd_handle /= System.Null_Address then
            pdd         := HANDLE_TO_PDRAWDATA (pdd_handle);
            pdd.nObject := 0;
            bResult     := Wininfo.UnlockWindowInfo (hWnd_p);

            uResult := Win32.Winuser.SetTimer (hWnd_p, 1, 50, null);
            return Win32.TRUE;
         end if;
         bResult := Wininfo.FreeWindowInfo (hWnd_p);
      end if;
      return Win32.FALSE;
   end DrawCreateProc;

   function DrawCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL
   is
   begin
      return Win32.TRUE;
   end DrawCommandProc;

   procedure DrawPaintProc (hWnd_p : Win32.Windef.HWND) is
      hDC_p : Win32.Windef.HDC;
   begin
      hDC_p := Win32.Winuser.BeginPaint (hwnd_p, ps'Access);
      if hDC_p /= System.Null_Address then
         bResult := Win32.Winuser.EndPaint (hwnd_p, ps'Access);
      end if;
   end DrawPaintProc;

   procedure DrawDestroyProc (hWnd_p : Win32.Windef.HWND) is
   begin
      bResult := Win32.Winuser.KillTimer (hWnd_p, 1);
      bResult := Wininfo.FreeWindowInfo (hWnd_p);
   end DrawDestroyProc;

   procedure DrawObject (hWnd_p : Win32.Windef.HWND) is
      pdd                                     : PDRAWDATA;
      hDC_p                                   : Win32.Windef.HDC;
      x1, y1, x2, y2, x3, y3, x4, y4, nObject : Win32.INT;
      r, g, b                                 : Win32.BYTE;
      hBrush_p                                : Win32.Windef.HGDIOBJ;
      pdd_handle                              : Win32.Winnt.HANDLE;
      dw                                      : Win32.DWORD;
      use type Win32.INT;
   begin
      pdd_handle := Wininfo.LockWindowInfo (hwnd_p);
      if pdd_handle /= System.Null_Address then
         pdd   := HANDLE_TO_PDRAWDATA (pdd_handle);
         hDC_p := Win32.Winuser.GetDC (hwnd_p);
         if hDC_p /= System.Null_Address then
            bResult := Win32.Winuser.GetClientRect (hwnd_p, rect_p'Access);
            dw      := Gdidemo_Util.lRandom rem 255;
            r       := Win32.BYTE (dw);
            dw      := Gdidemo_Util.lRandom rem 255;
            g       := Win32.BYTE (dw);
            dw      := Gdidemo_Util.lRandom rem 255;
            b       := Win32.BYTE (dw);

            hBrush_p :=
               Win32.Wingdi.SelectObject
                 (hDC_p,
                  Win32.Windef.HGDIOBJ (Win32.Wingdi.CreateSolidBrush
                                           (Win32.Wingdi.RGB (r, g, b))));
            if hBrush_p /= System.Null_Address then
               x1 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.right);
               y1 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.bottom);
               x2 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.right);
               y2 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.bottom);
               x3 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.right);
               y3 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.bottom);
               x4 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.right);
               y4 := Win32.INT (Gdidemo_Util.lRandom rem rect_p.bottom);

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

               nObject :=
                 Win32.INT (Gdidemo_Util.lRandom rem Win32.LONG (5));

               case nObject is
                  when OBJ_RECTANGLE =>
                     bResult :=
                        Win32.Wingdi.Rectangle (hDC_p, x1, y1, x2, y2);

                  when OBJ_ELLIPSE =>
                     bResult := Win32.Wingdi.Ellipse (hDC_p, x1, y1, x2, y2);

                  when OBJ_ROUNDRECT =>
                     bResult :=
                        Win32.Wingdi.RoundRect
                          (hDC_p,
                           x1,
                           y1,
                           x2,
                           y2,
                           x3,
                           y3);

                  when OBJ_CHORD =>
                     bResult :=
                        Win32.Wingdi.Chord
                          (hDC_p,
                           x1,
                           y1,
                           x2,
                           y2,
                           x3,
                           y3,
                           x4,
                           y4);

                  when OBJ_PIE =>
                     bResult :=
                        Win32.Wingdi.Pie
                          (hDC_p,
                           x1,
                           y1,
                           x2,
                           y2,
                           x3,
                           y3,
                           x4,
                           y4);

                  when others =>
                     bResult :=
                        Win32.Wingdi.Rectangle (hDC_p, x1, y1, x2, y2);

               end case;

               bResult :=
                  Win32.Wingdi.DeleteObject
                    (Win32.Wingdi.SelectObject (hDC_p, hBrush_p));

            end if;
            iResult := Win32.Winuser.ReleaseDC (hwnd_p, hDC_p);
         end if;
         bResult := Wininfo.UnlockWindowInfo (hwnd_p);
      end if;

   end DrawObject;

end Draw;
