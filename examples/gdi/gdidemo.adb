-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  procedure Gdidemo body 
--
--  This package body is a loose translation of the WinMain function in 
--  gdidemo.c.  This procedure does the initial application initialization
--  and contains the message loop. 


with Init; 
with Interfaces.C; 
with System; 
with Win32;
with Win32.WinDef;
with Win32.WinUser;
with Win32.WinMain;

procedure Gdidemo is

  use type System.Address;
  use type Interfaces.C.Int;
  use type Win32.BOOL;

  hWndFrame  : Win32.WinDef.HWND;
  msg_p      : Win32.WinUser.LPMSG;
  hInst      : Win32.WinDef.HINSTANCE;
  bResult    : Win32.BOOL;
  longResult : Win32.LONG;

begin
  -- Get the instance for this application
  hInst := Win32.WinMain.Get_hInstance;

  --  /*
  --  ** If there's a previous instance of this application, then we do not need
  --  ** to register it again.
  --  */
  if Win32.WinMain.Get_hPrevInstance = System.Null_Address then 
    if Init.RegisterAppClass (hInst) = Win32.FALSE then
      return;
    end if;
  end if;

  hWndFrame := Init.CreateAppWindow (hInst);
  bResult := Win32.WinUser.ShowWindow (hWndFrame, Win32.WinMain.Get_nCmdShow);
  bResult := Win32.WinUser.UpdateWindow (hWndFrame);

  msg_p := new Win32.WinUser.MSG;
  while (Win32.WinUser.GetMessage (msg_p,System.Null_Address,0,0)
                /= Win32.FALSE) loop
    bResult := Win32.WinUser.TranslateMessage(Win32.WinUser.ac_MSG_t(msg_p));
    longResult := Win32.WinUser.DispatchMessage(Win32.WinUser.ac_MSG_t(msg_p));
  end loop;

  Init.UnregisterAppClass(hInst);

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

end Gdidemo;
