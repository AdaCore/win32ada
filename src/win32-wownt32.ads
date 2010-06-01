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

with Win32.Winnt;

package Win32.Wownt32 is

   WCB16_MAX_CBARGS : constant := 16;
   WCB16_PASCAL     : constant := 16#0#;
   WCB16_CDECL      : constant := 16#1#;

   type WOW_HANDLE_TYPE is (
      WOW_TYPE_HWND,
      WOW_TYPE_HMENU,
      WOW_TYPE_HDWP,
      WOW_TYPE_HDROP,
      WOW_TYPE_HDC,
      WOW_TYPE_HFONT,
      WOW_TYPE_HMETAFILE,
      WOW_TYPE_HRGN,
      WOW_TYPE_HBITMAP,
      WOW_TYPE_HBRUSH,
      WOW_TYPE_HPALETTE,
      WOW_TYPE_HPEN,
      WOW_TYPE_HACCEL,
      WOW_TYPE_HTASK,
      WOW_TYPE_FULLHWND);
   for WOW_HANDLE_TYPE'Size use 32;

   function WOWGetVDMPointer
     (vp             : Win32.DWORD;
      dwBytes        : Win32.DWORD;
      fProtectedMode : Win32.BOOL)
      return Win32.LPVOID;

   function WOWGetVDMPointerFix
     (vp             : Win32.DWORD;
      dwBytes        : Win32.DWORD;
      fProtectedMode : Win32.BOOL)
      return Win32.LPVOID;

   procedure WOWGetVDMPointerUnfix (vp : Win32.DWORD);

   function WOWGlobalAlloc16
     (wFlags : Win32.WORD;
      cb     : Win32.DWORD)
      return Win32.WORD;

   function WOWGlobalFree16 (hMem : Win32.WORD) return Win32.WORD;

   function WOWGlobalLock16 (hMem : Win32.WORD) return Win32.DWORD;

   function WOWGlobalUnlock16 (hMem : Win32.WORD) return Win32.BOOL;

   function WOWGlobalAllocLock16
     (wFlags : Win32.WORD;
      cb     : Win32.DWORD;
      phMem  : Win32.PWORD)
      return Win32.DWORD;

   function WOWGlobalUnlockFree16 (vpMem : Win32.DWORD) return Win32.WORD;

   function WOWGlobalLockSize16
     (hMem : Win32.WORD;
      pcb  : Win32.PDWORD)
      return Win32.DWORD;

   procedure WOWYield16;

   procedure WOWDirectedYield16 (htask16 : Win32.WORD);

   function WOWHandle32
     (p1   : Win32.WORD;
      p2   : WOW_HANDLE_TYPE)
      return Win32.Winnt.HANDLE;

   function WOWHandle16
     (p1   : Win32.Winnt.HANDLE;
      p2   : WOW_HANDLE_TYPE)
      return Win32.WORD;

   function WOWCallback16
     (vpfn16  : Win32.DWORD;
      dwParam : Win32.DWORD)
      return Win32.DWORD;

   function WOWCallback16Ex
     (vpfn16     : Win32.DWORD;
      dwFlags    : Win32.DWORD;
      cbArgs     : Win32.DWORD;
      pArgs      : Win32.PVOID;
      pdwRetCode : Win32.PDWORD)
      return Win32.BOOL;

private

   pragma Import (Stdcall, WOWGetVDMPointer, "WOWGetVDMPointer");
   pragma Import (Stdcall, WOWGetVDMPointerFix, "WOWGetVDMPointerFix");
   pragma Import (Stdcall, WOWGetVDMPointerUnfix, "WOWGetVDMPointerUnfix");
   pragma Import (Stdcall, WOWGlobalAlloc16, "WOWGlobalAlloc16");
   pragma Import (Stdcall, WOWGlobalFree16, "WOWGlobalFree16");
   pragma Import (Stdcall, WOWGlobalLock16, "WOWGlobalLock16");
   pragma Import (Stdcall, WOWGlobalUnlock16, "WOWGlobalUnlock16");
   pragma Import (Stdcall, WOWGlobalAllocLock16, "WOWGlobalAllocLock16");
   pragma Import (Stdcall, WOWGlobalUnlockFree16, "WOWGlobalUnlockFree16");
   pragma Import (Stdcall, WOWGlobalLockSize16, "WOWGlobalLockSize16");
   pragma Import (Stdcall, WOWYield16, "WOWYield16");
   pragma Import (Stdcall, WOWDirectedYield16, "WOWDirectedYield16");
   pragma Import (Stdcall, WOWHandle32, "WOWHandle32");
   pragma Import (Stdcall, WOWHandle16, "WOWHandle16");
   pragma Import (Stdcall, WOWCallback16, "WOWCallback16");
   pragma Import (Stdcall, WOWCallback16Ex, "WOWCallback16Ex");

end Win32.Wownt32;
