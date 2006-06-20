-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  This is a translation of wininfo.c which is a member of the Microsoft 
--  gdidemo sample application.
--
-- | WINDOW INFORMATION MODULE
-- |   This module contains the routines which deal with obtaining the extra
-- |   object information associated with a window.  For these to work, the
-- |   window class must reserve the 0th word of the win-class object to be
-- |   used to hold global-memory handle.


with Convert;
with Interfaces.C;
with System;
with Win32.WinDef;
with Win32.WinBase;
with Win32.WinUser;

package body Wininfo is

  use type Interfaces.C.Int;
  use type Interfaces.C.Long;
  use type System.Address;
  use type Win32.BOOL;

  -- dummy return values
  lResult : Win32.LONG;
  
-- | ALLOC WINDOW INFO
-- |   This routine allocates memory out of the application heap for storing
-- |   extra memory for the Win32.dow.  It is alway referenced as offset 0.
function AllocWindowInfo (hWnd_p : Win32.WinDef.HWND;
                          wSize  : Win32.WORD) return Win32.BOOL is
  hsd : Win32.Winnt.HANDLE;
begin
  hsd := Win32.Winnt.HANDLE
           (Win32.WinBase.LocalAlloc (Win32.WinBase.LHND, Win32.UINT (wSize)));
  --     if(hsd = LocalAlloc(LHND,(WORD)wSize))
  if hsd /= System.Null_Address then 
    lResult := Win32.WinUser.SetWindowLong(hWnd_p, 0, 
                                           Convert.HANDLE_TO_LONG (hsd));
    return Win32.TRUE;
  else
    return Win32.FALSE;
  end if;
end AllocWindowInfo; 


-- | LOCK WINDOW INFO
-- |   This routine de-references the extra-memory associated with the Window.
-- |   it locks the object and gives the caller a pointer to the memory.
function LockWindowInfo (hWnd_p : Win32.WinDef.HWND) return 
                                                     Win32.Winnt.HANDLE is
  hMem : Win32.Winnt.HANDLE;
  pMem : Win32.LPVOID;
  lMem : Win32.LONG;
begin
  --     if(hMem = (HANDLE)GetWindowLong(hWnd,0))
  lMem := Win32.WinUser.GetWindowLong (hWnd_p, 0);
  if lMem /= 0 then
    hMem := Convert.LONG_TO_HANDLE (lMem);
    pMem := Win32.WinBase.LocalLock (Win32.Windef.HLOCAL (hMem));
    --         pMem = (PVOID)LocalLock(hMem);
  end if;
  return Win32.Winnt.HANDLE (pMem);
end LockWindowInfo;
 

-- | UNLOCK WINDOW INFO
-- |   This routine unlocks the memory the caller has previously locked.
function UnlockWindowInfo (hwnd_p : Win32.WinDef.HWND) return Win32.BOOL is
  hMem : Win32.Winnt.HANDLE;
  lMem : Win32.LONG;
begin
  lMem := Win32.WinUser.GetWindowLong (hWnd_p, 0);
  if lMem /= 0 then
    hMem := Convert.LONG_TO_HANDLE (lMem);
    if Win32.WinBase.LocalUnlock (Win32.Windef.HLOCAL (hMem)) = 
                                                       Win32.FALSE then
      return Win32.TRUE;
    end if; 
  end if;
  return Win32.FALSE;

end UnlockWindowInfo;


-- | FREE WINDOW INFO
-- |   This routine frees the object memory associated with the Win32.dow.
function FreeWindowInfo (hwnd_p : Win32.WinDef.HWND) return Win32.BOOL is
  hMem : Win32.WinDef.HLOCAL;
  lMem : Win32.LONG;
begin
  lMem := Win32.WinUser.GetWindowLong (hWnd_p, 0);
  if lMem /= 0 then
    hMem := Win32.WinDef.HLOCAL (Convert.LONG_TO_HANDLE (lMem));
    hMem := Win32.WinBase.LocalFree (hMem);
  end if;
  return Win32.TRUE;
    
end FreeWindowInfo;

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

end Wininfo;
