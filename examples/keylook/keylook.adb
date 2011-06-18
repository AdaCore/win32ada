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
--  Copyright (C) 2000-2011, AdaCore
--
-------------------------------------------------------------------------------

with Ada.Command_Line;
with Interfaces.C;
with Interfaces.C.Strings;
with Keylook_Pkg;          use Keylook_Pkg;
with Stdarg;
with Stdarg.Inst;
with System;
with Win32;                use Win32;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winmain;
with Win32.Winuser;

procedure KeyLook is

   IgnoredL : Win32.LONG_PTR;
   IgnoredA : Win32.Windef.ATOM;

   function WinMain
     (HINSTANCE     : Win32.Windef.HINSTANCE;
      hPrevInstance : Win32.Windef.HINSTANCE;
      lpszCmdLine   : Win32.PCSTR;
      nCmdShow      : Win32.INT)
      return Win32.WPARAM
   is
      use type Interfaces.C.int;
      use type System.Address;
      use type Win32.UINT;

      szAppName : constant Win32.CHAR_Array := "KeyLook" & Nul;
      szMesLook : constant Win32.CHAR_Array :=
         "Keyboard Message Looker - in Ada" & Nul;
      hwnd      : Win32.Windef.HWND;
   begin
      if hPrevInstance = System.Null_Address then
         wndclass.style         := Win32.Winuser.CS_HREDRAW or
                                   Win32.Winuser.CS_VREDRAW;
         wndclass.lpfnWndProc   := WndProc'Access;
         wndclass.cbClsExtra    := 0;
         wndclass.cbWndExtra    := 0;
         wndclass.hInstance     := HINSTANCE;
         wndclass.hIcon         :=
            Win32.Winuser.LoadIcon
              (System.Null_Address,
               Win32.LPCSTR (Win32.Winuser.IDI_APPLICATION));
         wndclass.hCursor       :=
           Win32.Windef.HCURSOR (Win32.Winuser.LoadCursor
                                    (System.Null_Address,
                                     Win32.LPCSTR (Win32.Winuser.IDC_ARROW)));
         wndclass.hbrBackground :=
           Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject
                                   (Win32.Wingdi.WHITE_BRUSH));
         wndclass.lpszMenuName  := null;
         wndclass.lpszClassName := CP (szAppName);

         IgnoredA := Win32.Winuser.RegisterClass (wndclass'Access);
      end if;

      hwnd :=
         Win32.Winuser.CreateWindow
           (CP (szAppName),
            CP (szMesLook),
            Win32.Winuser.WS_OVERLAPPEDWINDOW,
            Win32.Winuser.CW_USEDEFAULT,
            Win32.Winuser.CW_USEDEFAULT,
            Win32.Winuser.CW_USEDEFAULT,
            Win32.Winuser.CW_USEDEFAULT,
            System.Null_Address,
            System.Null_Address,
            HINSTANCE,
            System.Null_Address);

      IgnoredB := Win32.Winuser.ShowWindow (hwnd, nCmdShow);
      IgnoredB := Win32.Winuser.UpdateWindow (hwnd);

      while Win32.Winuser.GetMessage (msg'Access, System.Null_Address, 0, 0) /=
            0
      loop
         IgnoredB := Win32.Winuser.TranslateMessage (msg'Access);
         IgnoredL := Win32.Winuser.DispatchMessage (msg'Access);
      end loop;

      return msg.wParam;
   end WinMain;

begin

   Ada.Command_Line.Set_Exit_Status
     (Ada.Command_Line.Exit_Status (WinMain
                                       (Win32.Winmain.Get_hInstance,
                                        Win32.Winmain.Get_hPrevInstance,
                                        Win32.Winmain.Get_lpCmdline,
                                        Win32.Winmain.Get_nCmdShow)));

end KeyLook;
