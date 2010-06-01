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
with Wininfo;

package body Maze is

   use Interfaces.C;

   use type System.Address;
   use type Win32.BOOL;

   bResult : Win32.BOOL;
   lReturn : Win32.LRESULT;

   mcs : aliased Win32.Winuser.MDICREATESTRUCT;
   ps  : aliased Win32.Winuser.PAINTSTRUCT;

   function HANDLE_TO_PMAZEDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE,
      PMAZEDATA);

   procedure CreateMazeWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT)
   is
      hInst : Win32.Winnt.HANDLE;
      mcs_p : Win32.Winuser.LPMDICREATESTRUCT;
   begin
      hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

      mcs.szClass := MAZECLASS;
      mcs.szTitle := MAZETITLE;
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

   end CreateMazeWindow;

   function MazeProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT
   is
   begin
      case wMsg is

         when Win32.Winuser.WM_CREATE =>
            bResult := MazeCreateProc (hWnd_p);

         when Win32.Winuser.WM_COMMAND =>
            bResult := MazeCommandProc (hWnd_p, wParam_p, lParam_p);

         when Win32.Winuser.WM_TIMER =>
            DrawMaze (hWnd_p);

         when Win32.Winuser.WM_PAINT =>
            MazePaintProc (hWnd_p);

         when Win32.Winuser.WM_DESTROY =>
            MazeDestroyProc (hWnd_p);

         when others =>
            return Win32.Winuser.DefMDIChildProc
                     (hWnd_p,
                      wMsg,
                      wParam_p,
                      lParam_p);

      end case;
      return (0);

   end MazeProc;

   function MazeCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL is
      ppd        : PMAZEDATA := new MAZEDATA;
      ppd_handle : Win32.Winnt.HANDLE;
   begin
      if Wininfo.AllocWindowInfo (hWnd_p, (MAZEDATA'Size / 8)) =
         Win32.TRUE
      then
         ppd_handle := Wininfo.LockWindowInfo (hWnd_p);
         if ppd_handle /= System.Null_Address then
            ppd     := HANDLE_TO_PMAZEDATA (ppd_handle);
            bResult := Wininfo.UnlockWindowInfo (hWnd_p);
            return Win32.TRUE;
         end if;
         bResult := Wininfo.FreeWindowInfo (hWnd_p);
      end if;
      return Win32.FALSE;
   end MazeCreateProc;

   function MazeCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL
   is
   begin
      return Win32.TRUE;
   end MazeCommandProc;

   procedure MazePaintProc (hWnd_p : Win32.Windef.HWND) is
      hDC_p : Win32.Windef.HDC;
   begin
      hDC_p := Win32.Winuser.BeginPaint (hWnd_p, ps'Access);
      if hDC_p /= System.Null_Address then
         bResult := Win32.Winuser.EndPaint (hWnd_p, ps'Access);
      end if;
   end MazePaintProc;

   procedure MazeDestroyProc (hWnd_p : Win32.Windef.HWND) is
   begin
      bResult := Win32.Winuser.KillTimer (hWnd_p, 1);
      bResult := Wininfo.FreeWindowInfo (hWnd_p);
   end MazeDestroyProc;

   procedure DrawMaze (hWnd_p : Win32.Windef.HWND) is
   begin
      null;
   end DrawMaze;

end Maze;
