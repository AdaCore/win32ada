-- $Source$ 
-- $Revision$ $Date$ $Author$ 


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
with Win32.WinDef;
with Win32.WinUser;
with Xform;

use Win32;

package body Gdidemo_Util is

--  Interfaces.C must be with'ed and use'd in order to get operations on types
use Interfaces.C;

  use type System.Address;

  -- Used in CreateProc
  xform_chars     : aliased constant Win32.CHAR_Array := "&XForm";
  maze_chars      : aliased constant Win32.CHAR_Array := "&Maze";
                                                      
  -- used in PaintProc
  ps    : aliased Win32.WinUser.PAINTSTRUCT;

  -- dummy function return values
  bResult : Win32.BOOL;
  iResult : Win32.INT;
  longResult : Win32.LONG;
  lreturn : Win32.LRESULT;

  -- Initialize the value of glSeed (used by  the lrandom function)
  --     static DWORD glSeed = (DWORD)-365387184;
  glSeed : Win32.DWORD := Win32.DWORD (365387184);


function GETINSTANCE (hWnd_p : Win32.WinDef.HWND) return Win32.Winnt.HANDLE is
begin
  return Convert.LONG_TO_HANDLE (Win32.WinUser.GetWindowLong 
                                  (hWnd_p, Win32.WinUser.GWL_HINSTANCE));
end GETINSTANCE;

function GETCLASSBRUSH (hWnd_p : Win32.WinDef.HWND) return 
                                                    Win32.WinDef.HBRUSH is
begin
  return Win32.WinDef.HBRUSH (Convert.DWORD_TO_HANDLE
                               (Win32.WinUser.GetClassLong 
                                  (hWnd_p, Win32.WinUser.GCL_HBRBACKGROUND)));
end GETCLASSBRUSH;


-- | CLIENT WINDOW PROCEDURE
-- |   This is the main window function for the client-window created.  This is
-- |   the frame window which encompasses the MDI control window.
function WndProc (hWndFrame : Win32.Windef.HWND;
                  wMsg      : Win32.UINT;
                  wParam_p  : Win32.WPARAM;
                  lParam_p  : Win32.LPARAM) return Win32.LRESULT is
  hWndClient : Win32.WinDef.HWND;
begin
  case wMsg is
    -- /*
    -- ** Set up any pre-display stuff.  This is where we create the MDI
    -- ** control window.
    -- */
    when Win32.WinUser.WM_CREATE =>
      bResult := CreateProc(hWndFrame);

      -- /*
      -- ** DEMO MODE - These PostMessages Are for Demonstration Only
      -- */
      bResult := Win32.WinUser.PostMessage(hWndFrame,
                 Win32.WinUser.WM_COMMAND,IDM_DEMO_DRAW,0);
      bResult := Win32.WinUser.PostMessage(hWndFrame,
                 Win32.WinUser.WM_COMMAND,IDM_DEMO_POLYBEZIER,0);
      bResult := Win32.WinUser.PostMessage(hWndFrame,
                 Win32.WinUser.WM_COMMAND,IDM_DEMO_BOUNCE,0);
      bResult := Win32.WinUser.PostMessage(hWndFrame,
                 Win32.WinUser.WM_COMMAND,IDM_WINDOW_TILE,0);

    -- /*
    -- ** Paint the background of the frame.  This really is a NOP since
    -- ** the MDI control is displayed over the frame's client window.
    -- */
    when Win32.WinUser.WM_PAINT =>
      PaintProc(hWndFrame);

    -- /*
    -- ** Time to die.
    -- */
    when Win32.WinUser.WM_DESTROY =>
      DestroyProc(hWndFrame);

    -- /*
    -- ** Process the frame-commands.  We need to let the default handler
    -- ** have this event, since the MDI control handles the
    -- ** commands as well.
    -- */
    when Win32.WinUser.WM_COMMAND =>
      bResult := CommandProc(hWndFrame,wParam_p,lParam_p);
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame,CLIENTWND)));
      return Win32.WinUser.DefFrameProc (hWndFrame,hWndClient,
                                         wMsg,wParam_p,lParam_p);

    -- /*
    -- ** Since this is the frame-window, we need to grab the MDI client
    -- ** control window to pass to the MDI control.  We store this as
    -- ** part of the extra-object information for the frame-window.
    -- */
    when others =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong(hWndFrame,CLIENTWND)));
      return WinUser.DefFrameProc(hWndFrame,hWndClient,wMsg,wParam_p,lParam_p);
  end case;
  return 0;

end WndProc;


-- | CLIENT CREATE PROCEDURE
-- |   This is the main event-handler for the WM_CREATE message.  It is here
-- |   we create the MDI control window for the application.  We store this
-- |   information as part of the frame-window extra object information.

function CreateProc (hWndFrame : Win32.WinDef.HWND) return Win32.BOOL is
  xform_chars_ptr : constant LPCSTR := Convert.CP(xform_chars);
  maze_chars_ptr  : constant LPCSTR := Convert.CP(maze_chars);

  hMenu_p         : Win32.WinDef.HMENU;
  hWnd_p          : Win32.WinDef.HWND;

begin
  -- /*
  -- ** Set the window information to contain the child window.
  -- */
  hWnd_p := Init.CreateMDIClientWindow (hWndFrame);
  if hWnd_p /= System.Null_Address then 
    longResult := Win32.WinUser.SetWindowLong(hWndFrame,CLIENTWND,
                 Convert.HANDLE_TO_LONG (Win32.Winnt.HANDLE (hWnd_p)));
  end if;

  hMenu_p := Win32.WinUser.GetSubMenu (Win32.WinUser.GetMenu (hWndFrame), 0);
  if hMenu_p /= System.Null_Address then 
    bResult := Win32.WinUser.ModifyMenu (hMenu_p, IDM_DEMO_XFORM,
               Win32.WinUser.MF_BYCOMMAND or Win32.WinUser.MF_GRAYED,
               IDM_DEMO_XFORM ,
               xform_chars_ptr);
               --Win32.LPCSTR (Convert.CHARS_PTR_TO_PCHAR (xform_chars_ptr)));
    bResult := Win32.WinUser.ModifyMenu (hMenu_p, IDM_DEMO_MAZE,
               Win32.WinUser.MF_BYCOMMAND or Win32.WinUser.MF_GRAYED,
               IDM_DEMO_MAZE,
               maze_chars_ptr);
               --Win32.LPCSTR (Convert.CHARS_PTR_TO_PCHAR (maze_chars_ptr)));
    bResult := Win32.WinUser.DrawMenuBar(hWndFrame);
  end if;

  return Win32.TRUE;

end CreateProc;


-- | COMMAND PROCEDURE
-- |   This is the main event-handler for the WM_COMMAND event for the window
-- |   application.  All we really do is process the MENU commands for creating
-- |   the DEMO windows.
function CommandProc (hWndFrame : Win32.WinDef.HWND;
                      wParam_p  : Win32.WPARAM;
                      lParam_p  : Win32.LPARAM) return Win32.BOOL is 
  hWndClient : Win32.WinDef.HWND;
begin
  case wParam_p is

    -- /*
    -- ** Demo the poly-bezier window.
    -- */
    when IDM_DEMO_POLYBEZIER =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then 
        Poly.CreatePolyWindow (hWndClient,0);
      end if;

    -- /*
    -- ** Demo the xform's.
    -- */
    when IDM_DEMO_XFORM =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then
        XForm.CreateXFormWindow (hWndClient,0);
      end if;


    -- /*
    -- ** Demo the maze.
    -- */
    when IDM_DEMO_MAZE =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then 
        Maze.CreateMazeWindow(hWndClient,0);
      end if;


    -- /*
    -- ** Demo random drawing objects.
    -- */
    when IDM_DEMO_DRAW =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then 
        Draw.CreateDrawWindow(hWndClient,0);
      end if;


    -- /*
    -- ** Demo bouncing region balls.
    -- */
    when IDM_DEMO_BOUNCE =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then 
        Bounce.CreateBounceWindow(hWndClient,0);
      end if;


    -- /*
    -- ** MDI cascade the demo windows.
    -- */
    when IDM_WINDOW_CASCADE =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then 
        lreturn := Win32.WinUser.SendMessage(hWndClient,
                                             Win32.WinUser.WM_MDICASCADE,0,0);
      end if;


    -- /*
    -- ** MDI tile the demo windows.
    -- */
    when IDM_WINDOW_TILE =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then 
        lreturn := Win32.WinUser.SendMessage(hWndClient,
                                             Win32.WinUser.WM_MDITILE,0,0);
      end if;


    -- /*
    -- ** MDI arrange the MDI icons.
    -- */
    when IDM_WINDOW_ICON =>
      hWndClient := Win32.WinDef.HWND (
                      Convert.LONG_TO_HANDLE (
                        Win32.WinUser.GetWindowLong (hWndFrame, CLIENTWND)));
      if hWndClient /= System.Null_Address then 
        lreturn := Win32.WinUser.SendMessage(hWndClient,
                                         Win32.WinUser.WM_MDIICONARRANGE,0,0);
      end if;


    -- /*
    -- ** Display the about box.
    -- */
    when IDM_HELP_ABOUT =>
      iResult := Dialog.DisplayDialogBox (
                   hWndFrame,
                   Win32.LPCSTR (Convert.MAKEINTRESOURCE (ABOUTBOX)),
                   Dialog.AboutDlgProc'Access,
                   0); 


    -- /*
    -- ** Command not recognized.
    -- */
    when others =>
      return Win32.FALSE;

  end case;

  return Win32.TRUE;

end CommandProc;


-- | CLIENT PAINT PROCEDURE
-- |   This is the main event-handler for the WM_PAINT message.
procedure PaintProc (hWndFrame : Win32.WinDef.HWND) is
  hDC_p : Win32.WinDef.HDC;
begin
  hDC_p := Win32.WinUser.BeginPaint (hWndFrame, ps'Access);
  if hDC_p /= System.Null_Address then 
    bResult := Win32.WinUser.EndPaint (hWndFrame, ps'Access);
  end if;
end PaintProc;


-- | CLIENT DESTROY PROCEDURE
-- |   This routine is called to cleanup global resources upon exit of the
-- |   application.
procedure DestroyProc (hWndFrame : Win32.WinDef.HWND) is
begin 
  Win32.WinUser.PostQuitMessage(0);
end DestroyProc;
  

function lRandom return Win32.DWORD is
begin
  glSeed := glSeed * 69069;
  glSeed := glSeed + 1;

  return glSeed;
end lRandom;

function lRandom return Win32.LONG is
  W: Win32.DWORD := lRandom;
  function To_Long is new Ada.Unchecked_Conversion(Win32.DWORD, Win32.LONG);
begin
  return To_Long(W);
end lRandom;

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

end Gdidemo_Util;
