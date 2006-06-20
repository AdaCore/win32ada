-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- 
-- $Id$
--
--  package Maze specification
--
--  This is a translation of maze.h from the Microsoft gdidemo sample
--  application.

with Win32;  use Win32;
with Win32.WinDef;
with Interfaces.C;
with Convert;

package Maze is

  mazeclass_str : aliased constant Win32.CHAR_ARRAY := "MAZEDEMO" & Nul;
  mazetitle_str : aliased constant Win32.CHAR_ARRAY := "Maze Demo" & Nul;
  MAZECLASS : Win32.LPCSTR := Convert.CP(mazeclass_str);
  MAZETITLE : Win32.LPCSTR := Convert.CP(mazetitle_str); 

  type MAZEDATA is record
    nMaze : Win32.INT;
  end record;
  type PMAZEDATA is access MAZEDATA;


  -- /*
  -- ** MAZE WINDOW ROUTINES (maze.adb)
  -- */

  procedure CreateMazeWindow (hWndClient : Win32.WinDef.HWND;
                              nItem      : Win32.INT);

  function MazeProc (hWnd_p   : Win32.WinDef.HWND;
                     wMsg     : Win32.UINT;
                     wParam_p : Win32.WPARAM;
                     lParam_p : Win32.LPARAM) return Win32.LRESULT;
  pragma Convention (Stdcall, MazeProc);

  function MazeCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL;

  procedure MazeDestroyProc (hWnd_p : Win32.WinDef.HWND);

  function MazeCommandProc (hWnd_p   : Win32.WinDef.HWND;
                            wParam_p : Win32.WPARAM;
                            lParam_p : Win32.LPARAM) return Win32.BOOL;

  procedure MazePaintProc (hWnd_p : Win32.WinDef.HWND);

  procedure DrawMaze (hWnd_p : Win32.WinDef.HWND);

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Maze;
