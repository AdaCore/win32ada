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

with Init;
with Interfaces.C;
with System;
with Win32;
with Win32.Windef;
with Win32.Winuser;
with Win32.Winmain;

procedure Gdidemo is

   use type System.Address;
   use type Interfaces.C.int;
   use type Win32.BOOL;

   hWndFrame  : Win32.Windef.HWND;
   msg_p      : Win32.Winuser.LPMSG;
   hInst      : Win32.Windef.HINSTANCE;
   bResult    : Win32.BOOL;
   longResult : Win32.LONG;

begin
   hInst := Win32.Winmain.Get_hInstance;

   if Win32.Winmain.Get_hPrevInstance = System.Null_Address then
      if Init.RegisterAppClass (hInst) = Win32.FALSE then
         return;
      end if;
   end if;

   hWndFrame := Init.CreateAppWindow (hInst);
   bResult   :=
      Win32.Winuser.ShowWindow (hWndFrame, Win32.Winmain.Get_nCmdShow);
   bResult   := Win32.Winuser.UpdateWindow (hWndFrame);

   msg_p := new Win32.Winuser.MSG;
   while Win32.Winuser.GetMessage (msg_p, System.Null_Address, 0, 0) /=
         Win32.FALSE
   loop
      bResult    :=
         Win32.Winuser.TranslateMessage (Win32.Winuser.ac_MSG_t (msg_p));
      longResult :=
         Win32.Winuser.DispatchMessage (Win32.Winuser.ac_MSG_t (msg_p));
   end loop;

   Init.UnregisterAppClass (hInst);

end Gdidemo;
