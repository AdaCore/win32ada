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

with Win32;        use Win32;
with Win32.Windef;
with Interfaces.C;
with Convert;

package Maze is

   mazeclass_str : aliased constant Win32.CHAR_Array := "MAZEDEMO" & Nul;
   mazetitle_str : aliased constant Win32.CHAR_Array := "Maze Demo" & Nul;
   MAZECLASS     : Win32.LPCSTR                      :=
      Convert.CP (mazeclass_str);
   MAZETITLE     : Win32.LPCSTR                      :=
      Convert.CP (mazetitle_str);

   type MAZEDATA is record
      nMaze : Win32.INT;
   end record;
   type PMAZEDATA is access MAZEDATA;

   procedure CreateMazeWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT);

   function MazeProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, MazeProc);

   function MazeCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL;

   procedure MazeDestroyProc (hWnd_p : Win32.Windef.HWND);

   function MazeCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL;

   procedure MazePaintProc (hWnd_p : Win32.Windef.HWND);

   procedure DrawMaze (hWnd_p : Win32.Windef.HWND);

end Maze;
