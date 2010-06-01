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
with Bounce;
with Convert;
with Dialog;
with Draw;
with Init;
with Maze;
with Poly;
with System;
with Win32;
with Win32.Windef;
with Win32.Winuser;
with Xform;

use  Win32;

package body Gdidemo_Util is

   use Interfaces.C;

   use type System.Address;

   xform_chars : aliased constant Win32.CHAR_Array := "&XForm";
   maze_chars  : aliased constant Win32.CHAR_Array := "&Maze";

   ps : aliased Win32.Winuser.PAINTSTRUCT;

   bResult       : Win32.BOOL;
   iResult       : Win32.INT;
   longPtrResult : Win32.LONG_PTR;
   lreturn       : Win32.LRESULT;

   glSeed : Win32.DWORD := Win32.DWORD (365387184);

   function GETINSTANCE
     (hWnd_p : Win32.Windef.HWND)
      return Win32.Winnt.HANDLE
   is
   begin
      return Convert.LONGPTR_TO_HANDLE
               (Win32.Winuser.GetWindowLongPtr
                   (hWnd_p,
                    Win32.Winuser.GWL_HINSTANCE));
   end GETINSTANCE;

   function GETCLASSBRUSH
     (hWnd_p : Win32.Windef.HWND)
      return Win32.Windef.HBRUSH
   is
   begin
      return Win32.Windef.HBRUSH (Convert.ULONGPTR_TO_HANDLE
                                     (Win32.Winuser.GetClassLongPtr
                                         (hWnd_p,
                                          Win32.Winuser.GCL_HBRBACKGROUND)));
   end GETCLASSBRUSH;

   function WndProc
     (hWndFrame : Win32.Windef.HWND;
      wMsg      : Win32.UINT;
      wParam_p  : Win32.WPARAM;
      lParam_p  : Win32.LPARAM)
      return Win32.LRESULT
   is
      hWndClient : Win32.Windef.HWND;
   begin
      case wMsg is
         when Win32.Winuser.WM_CREATE =>
            bResult := CreateProc (hWndFrame);

            bResult :=
               Win32.Winuser.PostMessage
                 (hWndFrame,
                  Win32.Winuser.WM_COMMAND,
                  IDM_DEMO_DRAW,
                  0);
            bResult :=
               Win32.Winuser.PostMessage
                 (hWndFrame,
                  Win32.Winuser.WM_COMMAND,
                  IDM_DEMO_POLYBEZIER,
                  0);
            bResult :=
               Win32.Winuser.PostMessage
                 (hWndFrame,
                  Win32.Winuser.WM_COMMAND,
                  IDM_DEMO_BOUNCE,
                  0);
            bResult :=
               Win32.Winuser.PostMessage
                 (hWndFrame,
                  Win32.Winuser.WM_COMMAND,
                  IDM_WINDOW_TILE,
                  0);

         when Win32.Winuser.WM_PAINT =>
            PaintProc (hWndFrame);

         when Win32.Winuser.WM_DESTROY =>
            DestroyProc (hWndFrame);

         when Win32.Winuser.WM_COMMAND =>
            bResult    := CommandProc (hWndFrame, wParam_p, lParam_p);
            hWndClient :=
              Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                    (Win32.Winuser.GetWindowLongPtr
                                        (hWndFrame,
                                         CLIENTWND)));
            return Win32.Winuser.DefFrameProc
                     (hWndFrame,
                      hWndClient,
                      wMsg,
                      wParam_p,
                      lParam_p);

         when others =>
            hWndClient :=
              Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                    (Win32.Winuser.GetWindowLongPtr
                                        (hWndFrame,
                                         CLIENTWND)));
            return Winuser.DefFrameProc
                     (hWndFrame,
                      hWndClient,
                      wMsg,
                      wParam_p,
                      lParam_p);
      end case;
      return 0;

   end WndProc;

   function CreateProc (hWndFrame : Win32.Windef.HWND) return Win32.BOOL is
      xform_chars_ptr : constant LPCSTR := Convert.CP (xform_chars);
      maze_chars_ptr  : constant LPCSTR := Convert.CP (maze_chars);

      hMenu_p : Win32.Windef.HMENU;
      hWnd_p  : Win32.Windef.HWND;

   begin
      hWnd_p := Init.CreateMDIClientWindow (hWndFrame);
      if hWnd_p /= System.Null_Address then
         longPtrResult :=
            Win32.Winuser.SetWindowLongPtr
              (hWndFrame,
               CLIENTWND,
               Convert.HANDLE_TO_LONGPTR (Win32.Winnt.HANDLE (hWnd_p)));
      end if;

      hMenu_p :=
         Win32.Winuser.GetSubMenu (Win32.Winuser.GetMenu (hWndFrame), 0);
      if hMenu_p /= System.Null_Address then
         bResult :=
            Win32.Winuser.ModifyMenu
              (hMenu_p,
               IDM_DEMO_XFORM,
               Win32.Winuser.MF_BYCOMMAND or Win32.Winuser.MF_GRAYED,
               IDM_DEMO_XFORM,
               xform_chars_ptr);
         bResult :=
            Win32.Winuser.ModifyMenu
              (hMenu_p,
               IDM_DEMO_MAZE,
               Win32.Winuser.MF_BYCOMMAND or Win32.Winuser.MF_GRAYED,
               IDM_DEMO_MAZE,
               maze_chars_ptr);
         bResult := Win32.Winuser.DrawMenuBar (hWndFrame);
      end if;

      return Win32.TRUE;

   end CreateProc;

   function CommandProc
     (hWndFrame : Win32.Windef.HWND;
      wParam_p  : Win32.WPARAM;
      lParam_p  : Win32.LPARAM)
      return Win32.BOOL
   is
      hWndClient : Win32.Windef.HWND;
   begin
      case wParam_p is

      when IDM_DEMO_POLYBEZIER =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            Poly.CreatePolyWindow (hWndClient, 0);
         end if;

      when IDM_DEMO_XFORM =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            Xform.CreateXFormWindow (hWndClient, 0);
         end if;

      when IDM_DEMO_MAZE =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            Maze.CreateMazeWindow (hWndClient, 0);
         end if;

      when IDM_DEMO_DRAW =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            Draw.CreateDrawWindow (hWndClient, 0);
         end if;

      when IDM_DEMO_BOUNCE =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            Bounce.CreateBounceWindow (hWndClient, 0);
         end if;

      when IDM_WINDOW_CASCADE =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            lreturn :=
               Win32.Winuser.SendMessage
                 (hWndClient,
                  Win32.Winuser.WM_MDICASCADE,
                  0,
                  0);
         end if;

      when IDM_WINDOW_TILE =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            lreturn :=
               Win32.Winuser.SendMessage
                 (hWndClient,
                  Win32.Winuser.WM_MDITILE,
                  0,
                  0);
         end if;

      when IDM_WINDOW_ICON =>
         hWndClient :=
           Win32.Windef.HWND (Convert.LONGPTR_TO_HANDLE
                                 (Win32.Winuser.GetWindowLongPtr
                                     (hWndFrame,
                                      CLIENTWND)));
         if hWndClient /= System.Null_Address then
            lreturn :=
               Win32.Winuser.SendMessage
                 (hWndClient,
                  Win32.Winuser.WM_MDIICONARRANGE,
                  0,
                  0);
         end if;

      when IDM_HELP_ABOUT =>
         iResult :=
            Dialog.DisplayDialogBox
              (hWndFrame,
               Win32.LPCSTR (Convert.MAKEINTRESOURCE (ABOUTBOX)),
               Dialog.AboutDlgProc'Access,
               0);

      when others =>
         return Win32.FALSE;

      end case;

      return Win32.TRUE;

   end CommandProc;

   procedure PaintProc (hWndFrame : Win32.Windef.HWND) is
      hDC_p : Win32.Windef.HDC;
   begin
      hDC_p := Win32.Winuser.BeginPaint (hWndFrame, ps'Access);
      if hDC_p /= System.Null_Address then
         bResult := Win32.Winuser.EndPaint (hWndFrame, ps'Access);
      end if;
   end PaintProc;

   procedure DestroyProc (hWndFrame : Win32.Windef.HWND) is
   begin
      Win32.Winuser.PostQuitMessage (0);
   end DestroyProc;

   function lRandom return Win32.DWORD is
   begin
      glSeed := glSeed * 69069;
      glSeed := glSeed + 1;

      return glSeed;
   end lRandom;

   function lRandom return Win32.LONG is
      W : Win32.DWORD := lRandom;
      function To_Long is new Ada.Unchecked_Conversion (
         Win32.DWORD,
         Win32.LONG);
   begin
      return To_Long (W);
   end lRandom;

end Gdidemo_Util;
