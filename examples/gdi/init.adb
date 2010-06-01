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
with Draw;
with Gdidemo_Util;
with Interfaces.C;
with Interfaces.C.Strings;
with Maze;
with Poly;
with System;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winuser;
with Xform;

package body Init is

   use Win32;
   use type Win32.Windef.ATOM;

   package GU renames Gdidemo_Util;

   appclass_str : aliased constant Win32.CHAR_Array := "GDIDEMO" & Nul;
   apptitle_str : aliased constant Win32.CHAR_Array :=
      "Ada 95 Windows GDI Demonstration" & Nul;
   APPCLASS     : Win32.LPCSTR                      :=
      Convert.CP (appclass_str);
   APPTITLE     : Win32.LPCSTR                      :=
      Convert.CP (apptitle_str);

   init_title_str : aliased constant Win32.CHAR_Array := "Init" & Nul;
   init_title     : constant Win32.LPCSTR             :=
      Convert.CP (init_title_str);

   CWUSEDEF : constant := 16#80000000#;
   function mod_to_int is new Ada.Unchecked_Conversion (
      Interfaces.C.unsigned_long,
      Win32.INT);
   CW_USEDEF : Win32.INT := mod_to_int (CWUSEDEF);

   bResult : Win32.BOOL;

   function LPCLIENTCREATESTRUCT_TO_LPVOID is new Ada.Unchecked_Conversion (
      Win32.Winuser.LPCLIENTCREATESTRUCT,
      Win32.LPVOID);

   mdiclient_str : aliased constant Win32.CHAR_Array := "MDICLIENT" & Nul;
   mdiclient     : constant Win32.LPCSTR             :=
      Convert.CP (mdiclient_str);

   ccs        : aliased Win32.Winuser.CLIENTCREATESTRUCT;
   wndClass_p : aliased Win32.Winuser.WNDCLASS;

   function RegisterAppClass
     (hInst : Win32.Windef.HINSTANCE)
      return Win32.BOOL
   is
      use type Win32.INT;
      use type Win32.UINT;
   begin

      wndClass_p.style      := Win32.Winuser.CS_HREDRAW or
                               Win32.Winuser.CS_VREDRAW;
      wndClass_p.cbClsExtra := 0;
      wndClass_p.cbWndExtra := Win32.LONG'Size / 8;  --sizeof(LONG);
      wndClass_p.hCursor    :=
         Win32.Winuser.LoadCursor
           (System.Null_Address,
            Win32.LPCSTR (Win32.Winuser.IDC_ARROW));
      wndClass_p.hInstance  := hInst;

      wndClass_p.lpfnWndProc   := GU.WndProc'Access;
      wndClass_p.hIcon         :=
         Win32.Winuser.LoadIcon
           (hInst,
            Win32.LPCSTR (Win32.Winuser.MAKEINTRESOURCE (GU.APPICON)));
      wndClass_p.hbrBackground :=
        Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject
                                (Win32.Wingdi.WHITE_BRUSH));
      wndClass_p.lpszMenuName  :=
        Win32.LPCSTR (Win32.Winuser.MAKEINTRESOURCE (GU.APPMENU));
      wndClass_p.lpszClassName := APPCLASS;

      if Win32.Winuser.RegisterClass (wndClass_p'Access) = 0 then
         return Win32.FALSE;
      end if;

      wndClass_p.lpfnWndProc   := Poly.PolyProc'Access;
      wndClass_p.hIcon         :=
         Win32.Winuser.LoadIcon
           (System.Null_Address,
            Win32.LPCSTR (Win32.Winuser.IDI_APPLICATION));
      wndClass_p.hbrBackground :=
        Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject
                                (Win32.Wingdi.BLACK_BRUSH));
      wndClass_p.lpszMenuName  := null;
      wndClass_p.lpszClassName := Poly.POLYCLASS;

      if Win32.Winuser.RegisterClass (wndClass_p'Access) = 0 then
         bResult := Win32.Winuser.UnregisterClass (APPCLASS, hInst);
         return Win32.FALSE;
      end if;

      wndClass_p.lpfnWndProc   := Xform.XFormProc'Access;
      wndClass_p.hIcon         :=
         Win32.Winuser.LoadIcon
           (System.Null_Address,
            Win32.LPCSTR (Win32.Winuser.IDI_APPLICATION));
      wndClass_p.hbrBackground :=
        Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject
                                (Win32.Wingdi.BLACK_BRUSH));
      wndClass_p.lpszClassName := Xform.XFORMCLASS;

      if Win32.Winuser.RegisterClass (wndClass_p'Access) = 0 then
         bResult := Win32.Winuser.UnregisterClass (APPCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Poly.POLYCLASS, hInst);
         return Win32.FALSE;
      end if;

      wndClass_p.lpfnWndProc   := Maze.MazeProc'Access;
      wndClass_p.hIcon         :=
         Win32.Winuser.LoadIcon
           (System.Null_Address,
            Win32.LPCSTR (Win32.Winuser.IDI_APPLICATION));
      wndClass_p.hbrBackground :=
        Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject
                                (Win32.Wingdi.BLACK_BRUSH));
      wndClass_p.lpszClassName := Maze.MAZECLASS;

      if Win32.Winuser.RegisterClass (wndClass_p'Access) = 0 then
         bResult := Win32.Winuser.UnregisterClass (APPCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Poly.POLYCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Xform.XFORMCLASS, hInst);
         return Win32.FALSE;
      end if;

      wndClass_p.lpfnWndProc   := Draw.DrawProc'Access;
      wndClass_p.hIcon         :=
         Win32.Winuser.LoadIcon
           (System.Null_Address,
            Win32.LPCSTR (Win32.Winuser.IDI_APPLICATION));
      wndClass_p.hbrBackground :=
        Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject
                                (Win32.Wingdi.WHITE_BRUSH));
      wndClass_p.lpszClassName := Draw.DRAWCLASS;

      if Win32.Winuser.RegisterClass (wndClass_p'Access) = 0 then
         bResult := Win32.Winuser.UnregisterClass (APPCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Poly.POLYCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Xform.XFORMCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Maze.MAZECLASS, hInst);
         return Win32.FALSE;
      end if;

      wndClass_p.lpfnWndProc   := Bounce.BounceProc'Access;
      wndClass_p.hIcon         :=
         Win32.Winuser.LoadIcon
           (System.Null_Address,
            Win32.LPCSTR (Win32.Winuser.IDI_APPLICATION));
      wndClass_p.hbrBackground :=
        Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject
                                (Win32.Wingdi.WHITE_BRUSH));
      wndClass_p.lpszClassName := Bounce.BOUNCECLASS;

      if Win32.Winuser.RegisterClass (wndClass_p'Access) = 0 then
         bResult := Win32.Winuser.UnregisterClass (APPCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Poly.POLYCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Xform.XFORMCLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Maze.MAZECLASS, hInst);
         bResult := Win32.Winuser.UnregisterClass (Draw.DRAWCLASS, hInst);
         return Win32.FALSE;
      end if;

      return Win32.TRUE;
   end RegisterAppClass;

   procedure UnregisterAppClass (hInst : Win32.Windef.HINSTANCE) is
   begin

      bResult := Win32.Winuser.UnregisterClass (APPCLASS, hInst);
      bResult := Win32.Winuser.UnregisterClass (Poly.POLYCLASS, hInst);
      bResult := Win32.Winuser.UnregisterClass (Xform.XFORMCLASS, hInst);
      bResult := Win32.Winuser.UnregisterClass (Maze.MAZECLASS, hInst);
      bResult := Win32.Winuser.UnregisterClass (Draw.DRAWCLASS, hInst);
      bResult := Win32.Winuser.UnregisterClass (Bounce.BOUNCECLASS, hInst);
   end UnregisterAppClass;

   function CWTest
     (dwExStyle    : Interfaces.C.unsigned_long;
      lpClassName  : Win32.LPCSTR;
      lpWindowName : Win32.LPCSTR;
      dwStyle      : Interfaces.C.unsigned_long;
      X            : Interfaces.C.unsigned_long;
      Y            : Interfaces.C.unsigned_long;
      nWidth       : Interfaces.C.unsigned_long;
      nHeight      : Interfaces.C.unsigned_long;
      hWndParent   : Interfaces.C.unsigned;
      hMenu        : Interfaces.C.unsigned;
      hInstance    : Interfaces.C.unsigned;
      lpParam      : Integer)
      return Win32.Windef.HWND;
   pragma Import (Stdcall, CWTest, "CreateWindowExA@48");

   function CreateAppWindow
     (hInst : Win32.Windef.HINSTANCE)
      return Win32.Windef.HWND
   is
      use type Win32.DWORD;
   begin
      return Win32.Winuser.CreateWindow
               (lpClassName  => APPCLASS,
                lpWindowName => APPTITLE,
                dwStyle      => Win32.Winuser.WS_OVERLAPPEDWINDOW or
                                Win32.Winuser.WS_CLIPCHILDREN,
                X            => Win32.Winuser.CW_USEDEFAULT,
                Y            => Win32.Winuser.CW_USEDEFAULT,
                nWidth       => Win32.Winuser.CW_USEDEFAULT,
                nHeight      => Win32.Winuser.CW_USEDEFAULT,
                hWndParent   => System.Null_Address,
                hMenu        => System.Null_Address,
                hInstance    => hInst,
                lpParam      => System.Null_Address);
   end CreateAppWindow;

   function CreateMDIClientWindow
     (hWndFrame : Win32.Windef.HWND)
      return Win32.Windef.HWND
   is
      hWndClient : Win32.Windef.HWND;
      hInst      : Win32.Winnt.HANDLE;
      ccs_ptr    : Win32.Winuser.LPCLIENTCREATESTRUCT;
      use type Win32.DWORD;
   begin
      ccs.hWindowMenu  := System.Null_Address;
      ccs.idFirstChild := 0;
      ccs_ptr          := ccs'Access;

      hInst := GU.GETINSTANCE (hWndFrame);

      hWndClient :=
         Win32.Winuser.CreateWindow
           (lpClassName  => mdiclient,
            lpWindowName => null,
            dwStyle      => Win32.Winuser.WS_CHILD or
                            Win32.Winuser.WS_CLIPSIBLINGS or
                            Win32.Winuser.WS_VISIBLE,
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

end Init;
