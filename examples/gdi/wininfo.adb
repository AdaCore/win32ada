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

with Convert;
with Interfaces.C;
with System;
with Win32.Windef;
with Win32.Winbase;
with Win32.Winuser;

package body Wininfo is

   use type Interfaces.C.int;
   use type Interfaces.C.long;
   use type System.Address;
   use type Win32.BOOL;

   lResult : Win32.LONG_PTR;

   function AllocWindowInfo
     (hWnd_p : Win32.Windef.HWND;
      wSize  : Win32.WORD)
      return Win32.BOOL
   is
      hsd : Win32.Winnt.HANDLE;
   begin
      hsd :=
        Win32.Winnt.HANDLE (Win32.Winbase.LocalAlloc
                               (Win32.Winbase.LHND,
                                Win32.Size_T (wSize)));
      if hsd /= System.Null_Address then
         lResult :=
            Win32.Winuser.SetWindowLongPtr
              (hWnd_p,
               0,
               Convert.HANDLE_TO_LONGPTR (hsd));
         return Win32.TRUE;
      else
         return Win32.FALSE;
      end if;
   end AllocWindowInfo;

   function LockWindowInfo
     (hWnd_p : Win32.Windef.HWND)
      return Win32.Winnt.HANDLE
   is
      use type Win32.LONG_PTR;
      hMem : Win32.Winnt.HANDLE;
      pMem : Win32.LPVOID;
      lMem : Win32.LONG_PTR;
   begin
      lMem := Win32.Winuser.GetWindowLongPtr (hWnd_p, 0);
      if lMem /= 0 then
         hMem := Convert.LONGPTR_TO_HANDLE (lMem);
         pMem := Win32.Winbase.LocalLock (Win32.Windef.HLOCAL (hMem));
      end if;
      return Win32.Winnt.HANDLE (pMem);
   end LockWindowInfo;

   function UnlockWindowInfo (hwnd_p : Win32.Windef.HWND) return Win32.BOOL is
      use type Win32.LONG_PTR;
      hMem : Win32.Winnt.HANDLE;
      lMem : Win32.LONG_PTR;
   begin
      lMem := Win32.Winuser.GetWindowLongPtr (hwnd_p, 0);
      if lMem /= 0 then
         hMem := Convert.LONGPTR_TO_HANDLE (lMem);
         if Win32.Winbase.LocalUnlock (Win32.Windef.HLOCAL (hMem)) =
            Win32.FALSE
         then
            return Win32.TRUE;
         end if;
      end if;
      return Win32.FALSE;

   end UnlockWindowInfo;

   function FreeWindowInfo (hwnd_p : Win32.Windef.HWND) return Win32.BOOL is
      use type Win32.LONG_PTR;
      hMem : Win32.Windef.HLOCAL;
      lMem : Win32.LONG_PTR;
   begin
      lMem := Win32.Winuser.GetWindowLongPtr (hwnd_p, 0);
      if lMem /= 0 then
         hMem := Win32.Windef.HLOCAL (Convert.LONGPTR_TO_HANDLE (lMem));
         hMem := Win32.Winbase.LocalFree (hMem);
      end if;
      return Win32.TRUE;

   end FreeWindowInfo;

end Wininfo;
