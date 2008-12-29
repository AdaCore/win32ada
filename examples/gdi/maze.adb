-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  package Maze body
--
--  This package body is a translation of the routines found in maze.c which
--  is part of the Microsoft gdidemo sample application.  This collection of
--  routines don't do anything, but are included for completeness.

with Ada.Unchecked_Conversion;
with Convert;
with Gdidemo_Util;
with System;
with Win32;
with Win32.WinDef;
with Win32.Winnt;
with Win32.WinUser;
with WinInfo;


package body Maze is

use Interfaces.C;  -- for operations on types

  use type System.Address;
  use type Win32.BOOL;

  -- Dummy function return values
  bResult : Win32.BOOL;
  lReturn : Win32.LRESULT;
  
  mcs   : aliased Win32.WinUser.MDICREATESTRUCT;
  ps    : aliased Win32.WinUser.PAINTSTRUCT;


  -- Unchecked conversion utility functions
  function HANDLE_TO_PMAZEDATA is new Ada.Unchecked_Conversion (
      Win32.Winnt.HANDLE, PMAZEDATA);
-- | CREATE MAZE WINDOW PROCEDURE

procedure CreateMazeWindow (hWndClient : Win32.WinDef.HWND;
                            nItem      : Win32.INT) is
  hInst : Win32.Winnt.HANDLE;
  mcs_p : Win32.WinUser.LPMDICREATESTRUCT;
begin
  hInst := Gdidemo_Util.GETINSTANCE (hWndClient);

  --  Initialize the MDI create struct for creation of the
  --  test window.
  mcs.szClass := MAZECLASS;
  mcs.szTitle := MAZETITLE;
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

end CreateMazeWindow;


-- | MAZE WINDOW PROCEDURE
function MazeProc (hWnd_p   : Win32.WinDef.HWND;
                   wMsg     : Win32.UINT;
                   wParam_p : Win32.WPARAM;
                   lParam_p : Win32.LPARAM) return Win32.LRESULT is
begin
  case wMsg is

    when Win32.WinUser.WM_CREATE =>
      bResult := MazeCreateProc(hWnd_p);
 
    when Win32.WinUser.WM_COMMAND =>
      bResult := MazeCommandProc(hWnd_p,wParam_p,lParam_p);
 
    when Win32.WinUser.WM_TIMER =>
      DrawMaze(hWnd_p);
 
    when Win32.WinUser.WM_PAINT =>
      MazePaintProc(hWnd_p);
 
    when Win32.WinUser.WM_DESTROY =>
      MazeDestroyProc(hWnd_p);
 
    when others =>
      return Win32.WinUser.DefMDIChildProc (hWnd_p,wMsg,wParam_p,lParam_p);

  end case;
  return (0);

end MazeProc;


-- | MAZE CREATE PROCEDURE
function MazeCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL is
  ppd : PMAZEDATA := new MAZEDATA;
  ppd_handle : Win32.Winnt.HANDLE;
begin
  if WinInfo.AllocWindowInfo (hWnd_p, (MAZEDATA'size / 8)) = 
     Win32.True then
    ppd_handle := WinInfo.LockWindowInfo (hWnd_p);
    if ppd_handle /= System.Null_Address then 
      ppd := HANDLE_TO_PMAZEDATA (ppd_handle);
      bResult := WinInfo.UnlockWindowInfo (hWnd_p);
      return Win32.TRUE;
    end if;
    bResult := WinInfo.FreeWindowInfo (hWnd_p);
  end if;
  return Win32.FALSE;
end MazeCreateProc;


-- | MAZE COMMAND PROCEDURE
function MazeCommandProc (hWnd_p   : Win32.WinDef.HWND;
                          wParam_p : Win32.WPARAM;
                          lParam_p : Win32.LPARAM) return Win32.BOOL is
begin
  return Win32.TRUE;
end MazeCommandProc;


-- | MAZE PAINT PROCEDURE
procedure MazePaintProc (hWnd_p : Win32.WinDef.HWND) is
  hDC_p : Win32.WinDef.HDC;
begin
  hDC_p := Win32.WinUser.BeginPaint (hWnd_p, ps'Access);
  if hDC_p /= System.Null_Address then 
    bResult := Win32.WinUser.EndPaint (hWnd_p, ps'Access);
  end if;
end MazePaintProc;


-- | MAZE DESTROY PROCEDURE
procedure MazeDestroyProc (hWnd_p : Win32.WinDef.HWND) is
begin
  bResult := Win32.WinUser.KillTimer(hWnd_p,1);
  bResult := WinInfo.FreeWindowInfo(hWnd_p);
end MazeDestroyProc;


procedure DrawMaze (hWnd_p : Win32.WinDef.HWND) is
begin
  null;
end DrawMaze;

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

end Maze;
