-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  package Init body
--
--  This package contains a translation of the c functions found in init.c
--  which is part of the Microsoft gdidemo sample application.
--
--| INITIALIZATION MODULE
--|   This module contains startup-routines for the creation of windows for this
--|   application.
--|
--|   RegisterAppClass
--|   UnregisterAppClass
--|   CreateAppWindow
--|   CreateMDIClientWindow
--|


with Ada.Unchecked_Conversion;
with Bounce;
with Convert;
with Draw;
with Gdidemo_Util;
with Interfaces.C;
with Interfaces.C.Strings;
with Maze;
with Poly;
with System;
with Win32.WinDef;
with Win32.WinGdi;
with Win32.WinUser;
with Xform;

package body Init is

  use Win32;
  use type Win32.Windef.ATOM;

  package GU renames Gdidemo_Util;

  appclass_str : aliased constant Win32.CHAR_Array := "GDIDEMO" & Nul;
  apptitle_str : aliased constant Win32.CHAR_Array :=
                             "Ada 95 Windows GDI Demonstration" & Nul;
  APPCLASS : Win32.LPCSTR := Convert.CP(appclass_str);
  APPTITLE : Win32.LPCSTR := Convert.CP(apptitle_str);


  init_title_str : aliased constant Win32.CHAR_Array := "Init" & Nul;
  init_title     : constant Win32.LPCSTR := Convert.CP(init_title_str);

  CWUSEDEF : constant := 16#80000000#;
  function mod_to_int is new Ada.unchecked_conversion (
      Interfaces.C.unsigned_long, Win32.INT);
  CW_USEDEF : Win32.INT := mod_to_int (CWUSEDEF); 
  
  --  dummy return values
  bResult : Win32.BOOL;

  function LPCLIENTCREATESTRUCT_TO_LPVOID is new Ada.Unchecked_Conversion
           (Win32.WinUser.LPCLIENTCREATESTRUCT, Win32.LPVOID);
  
  mdiclient_str : aliased constant Win32.CHAR_Array := "MDICLIENT" & Nul;
  mdiclient     : constant Win32.LPCSTR := Convert.CP(mdiclient_str);

  ccs           : aliased Win32.WinUser.CLIENTCREATESTRUCT;
  wndClass_p    : aliased Win32.WinUser.WNDCLASS;
  



--  REGISTER APPLICATION CLASS
--    This routine registers all classes necessary for the application.
function RegisterAppClass (hInst : Win32.Windef.HINSTANCE) return Win32.BOOL is
    use type Win32.INT;
    use type Win32.UINT;
begin

  -- ** Set the common wndClass information.  This is common to all windows
  -- ** of this application.
  wndClass_p.style         := Win32.WinUser.CS_HREDRAW or 
                              Win32.WinUser.CS_VREDRAW;
  wndClass_p.cbClsExtra    := 0;
  wndClass_p.cbWndExtra    := Win32.LONG'Size / 8;  --sizeof(LONG);
  wndClass_p.hCursor       := Win32.WinUser.LoadCursor (System.Null_Address,
                              Win32.LPCSTR(Win32.WinUser.IDC_ARROW));
  wndClass_p.hInstance     := hInst;

  --/*
  -- ** Register the main top-level window (frame).
  --*/
  wndClass_p.lpfnWndProc   := GU.WndProc'Access;
  wndClass_p.hIcon         := Win32.WinUser.LoadIcon (hInst,
                      Win32.LPCSTR(Win32.WinUser.MAKEINTRESOURCE(GU.APPICON)));
  wndClass_p.hbrBackground := Win32.WinDef.HBRUSH (
                            Win32.WinGdi.GetStockObject(
                            Win32.WinGdi.WHITE_BRUSH));
  wndClass_p.lpszMenuName  := Win32.LPCSTR (
                            Win32.WinUser.MAKEINTRESOURCE(GU.APPMENU));
  wndClass_p.lpszClassName := APPCLASS;

  if Win32.WinUser.RegisterClass (wndClass_p'Access) = 0 then
    return Win32.FALSE;
  end if;

  --  /*
  --  ** Register the polybezier demo window.
  --  */
  wndClass_p.lpfnWndProc   := Poly.PolyProc'Access;
  wndClass_p.hIcon         := Win32.WinUser.LoadIcon (System.Null_Address,
                            Win32.LPCSTR(Win32.WinUser.IDI_APPLICATION));
  wndClass_p.hbrBackground := Win32.WinDef.HBRUSH (
                            Win32.WinGdi.GetStockObject(
                            Win32.WinGdi.BLACK_BRUSH));
  wndClass_p.lpszMenuName  := null;
  wndClass_p.lpszClassName := Poly.POLYCLASS;

  if Win32.WinUser.RegisterClass(wndClass_p'Access) = 0 then
    bResult := Win32.WinUser.UnregisterClass(APPCLASS,hInst);
    return Win32.FALSE;
  end if; 

  --  /*
  --  ** Register the xform demo window.
  --  */
  wndClass_p.lpfnWndProc   := Xform.XFormProc'Access;
  wndClass_p.hIcon         := Win32.WinUser.LoadIcon (System.Null_Address,
                            Win32.LPCSTR(Win32.WinUser.IDI_APPLICATION));
  wndClass_p.hbrBackground := Win32.WinDef.HBRUSH (
                            Win32.WinGdi.GetStockObject(
                            Win32.WinGdi.BLACK_BRUSH));
  wndClass_p.lpszClassName := Xform.XFORMCLASS;

  if Win32.WinUser.RegisterClass (wndClass_p'Access) = 0 then
    bResult := Win32.WinUser.UnregisterClass (APPCLASS,       hInst);
    bResult := Win32.WinUser.UnregisterClass (Poly.POLYCLASS, hInst);
    return Win32.FALSE;
  end if; 


  --  /*
  --  ** Register the maze demo window.
  --  */
  wndClass_p.lpfnWndProc   := Maze.MazeProc'Access;
  wndClass_p.hIcon         := Win32.WinUser.LoadIcon (System.Null_Address,
                            Win32.LPCSTR(Win32.WinUser.IDI_APPLICATION));
  wndClass_p.hbrBackground := Win32.WinDef.HBRUSH (
                            Win32.WinGdi.GetStockObject(
                            Win32.WinGdi.BLACK_BRUSH));
  wndClass_p.lpszClassName := Maze.MAZECLASS;

  if Win32.WinUser.RegisterClass (wndClass_p'Access) = 0 then
    bResult := Win32.WinUser.UnregisterClass (APPCLASS,         hInst);
    bResult := Win32.WinUser.UnregisterClass (Poly.POLYCLASS,   hInst);
    bResult := Win32.WinUser.UnregisterClass (Xform.XFORMCLASS, hInst);
    return Win32.FALSE;
  end if; 


  --  /*
  --  ** Register the random draw demo window.
  --  */
  wndClass_p.lpfnWndProc   := Draw.DrawProc'Access;
  wndClass_p.hIcon         := Win32.WinUser.LoadIcon (System.Null_Address,
                                Win32.LPCSTR(Win32.WinUser.IDI_APPLICATION));
  wndClass_p.hbrBackground := Win32.WinDef.HBRUSH (
                            Win32.WinGdi.GetStockObject (
                            Win32.WinGdi.WHITE_BRUSH));
  wndClass_p.lpszClassName := Draw.DRAWCLASS;

  if Win32.WinUser.RegisterClass (wndClass_p'Access) = 0 then
    bResult := Win32.WinUser.UnregisterClass (APPCLASS, hInst);
    bResult := Win32.WinUser.UnregisterClass (Poly.POLYCLASS, hInst);
    bResult := Win32.WinUser.UnregisterClass (Xform.XFORMCLASS, hInst);
    bResult := Win32.WinUser.UnregisterClass (Maze.MAZECLASS, hInst);
    return Win32.FALSE;
  end if; 


  --  /*
  --  ** Register the bouncing ball demo window.
  --  */
  wndClass_p.lpfnWndProc   := Bounce.BounceProc'Access;
  wndClass_p.hIcon         := Win32.WinUser.LoadIcon (System.Null_Address,
                            Win32.LPCSTR (
                            Win32.WinUser.IDI_APPLICATION));
  wndClass_p.hbrBackground := Win32.WinDef.HBRUSH (
                            Win32.WinGdi.GetStockObject(
                            Win32.WinGdi.WHITE_BRUSH));
  wndClass_p.lpszClassName := Bounce.BOUNCECLASS;

  if Win32.WinUser.RegisterClass(wndClass_p'Access) = 0 then
    bResult := Win32.WinUser.UnregisterClass (APPCLASS,         hInst);
    bResult := Win32.WinUser.UnregisterClass (Poly.POLYCLASS,   hInst);
    bResult := Win32.WinUser.UnregisterClass (Xform.XFORMCLASS, hInst);
    bResult := Win32.WinUser.UnregisterClass (Maze.MAZECLASS,   hInst);
    bResult := Win32.WinUser.UnregisterClass (Draw.DRAWCLASS,   hInst);
    return Win32.FALSE;
  end if; 

  return Win32.TRUE;
end RegisterAppClass;


-- | UNREGISTER APPLICATION CLASS
-- |   This routine unregisters all classes registered for the application.
-- |   It is typically called upon termination of the application.
procedure UnregisterAppClass (hInst : Win32.WinDef.HINSTANCE) is
begin

  bResult := Win32.WinUser.UnregisterClass (APPCLASS,              hInst);
  bResult := Win32.WinUser.UnregisterClass (Poly.POLYCLASS,        hInst);
  bResult := Win32.WinUser.UnregisterClass (Xform.XFORMCLASS,      hInst);
  bResult := Win32.WinUser.UnregisterClass (Maze.MAZECLASS,        hInst);
  bResult := Win32.WinUser.UnregisterClass (Draw.DRAWCLASS,        hInst);
  bResult := Win32.WinUser.UnregisterClass (Bounce.BOUNCECLASS,    hInst);
end UnregisterAppClass;

function CWTest (
    dwExStyle    : Interfaces.C.Unsigned_Long; 
    lpClassName  : Win32.LPCSTR; 
    lpWindowName : Win32.LPCSTR; 
    dwStyle      : Interfaces.C.Unsigned_Long; 
    X            : Interfaces.C.Unsigned_Long; 
    Y            : Interfaces.C.Unsigned_Long; 
    nWidth       : Interfaces.C.Unsigned_Long; 
    nHeight      : Interfaces.C.Unsigned_Long; 
    hWndParent   : Interfaces.C.Unsigned; 
    hMenu        : Interfaces.C.Unsigned; 
    hInstance    : Interfaces.C.Unsigned; 
    lpParam      : Integer) return Win32.Windef.HWND;
pragma import (Stdcall, CWTest, "CreateWindowExA@48"); 

-- | CREATE APPLICATION WINDOW
-- |   This routine creates the main top-level window.
function CreateAppWindow (hInst : Win32.WinDef.HINSTANCE) return 
                                                          Win32.WinDef.HWND is 
    use type Win32.DWORD;
begin
   return Win32.WinUser.CreateWindow ( 
    lpClassName  => APPCLASS,
    lpWindowName => APPTITLE, 
    dwStyle      => Win32.WinUser.WS_OVERLAPPEDWINDOW or
                    Win32.WinUser.WS_CLIPCHILDREN,
    X            => Win32.WinUser.CW_USEDEFAULT,
    Y            => Win32.WinUser.CW_USEDEFAULT,
    nWidth       => Win32.WinUser.CW_USEDEFAULT,
    nHeight      => Win32.WinUser.CW_USEDEFAULT,
    hWndParent   => System.Null_Address, 
    hMenu        => System.Null_Address, 
    hInstance    => hInst,
    lpParam      => System.Null_Address); 
end CreateAppWindow;


-- | CREATE MDI CLIENT WINDOW
-- |   This routine creates the client window which handles the MDI windows.
-- |   The window will eventually be size to fit into the frame-window's client
-- |   area.
function CreateMDIClientWindow (hWndFrame : Win32.WinDef.HWND) 
                                            return Win32.WinDef.HWND is
  hWndClient : Win32.WinDef.HWND;
  hInst      : Win32.Winnt.HANDLE;
  ccs_ptr    : Win32.WinUser.LPCLIENTCREATESTRUCT;
  use type Win32.DWORD;
begin
  --  ** Initialize the client struct to point to define the menu and child
  --  ** identifiers.  The menu item specifies the parent menu in which the
  --  ** the list of MDI childs will be appended to this menu.
  ccs.hWindowMenu  := System.Null_Address;
  ccs.idFirstChild := 0;
  ccs_ptr := ccs'Access;

  hInst := GU.GETINSTANCE(hWndFrame);

  hWndClient := Win32.WinUser.CreateWindow (
    lpClassName  => MDICLIENT,
    lpWindowName => null,
    dwStyle      => Win32.WinUser.WS_CHILD or 
                    Win32.WinUser.WS_CLIPSIBLINGS or
                    Win32.WinUser.WS_VISIBLE,
    X            => 0,
    Y            => 0,
    nWidth       => 1,
    nHeight      => 1, 
    hWndParent   => hWndFrame,
    hMenu        => System.Null_Address, 
    hInstance    => Win32.Windef.HINSTANCE (hInst),
    lpParam      => LPCLIENTCREATESTRUCT_TO_LPVOID (ccs_ptr));

    return hWndClient;
end CreateMDIClientWindow; 

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

end Init;
