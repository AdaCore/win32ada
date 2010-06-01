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

package Win32.Wownt16 is

   CPEX_DEST_STDCALL : constant := 16#0#;
   CPEX_DEST_CDECL   : constant := 16#80000000#;

   function GetVDMPointer32W
     (vp    : Win32.LPVOID;
      fMode : Win32.UINT)
      return Win32.DWORD;

   function LoadLibraryEx32W
     (lpszLibFile : Win32.LPCSTR;
      hFile       : Win32.DWORD;
      dwFlags     : Win32.DWORD)
      return Win32.DWORD;

   function GetProcAddress32W
     (hModule  : Win32.DWORD;
      lpszProc : Win32.LPCSTR)
      return Win32.DWORD;

   function FreeLibrary32W (hLibModule : Win32.DWORD) return Win32.DWORD;

private

   pragma Import (Stdcall, GetVDMPointer32W, "GetVDMPointer32W");
   pragma Import (Stdcall, LoadLibraryEx32W, "LoadLibraryEx32W");
   pragma Import (Stdcall, GetProcAddress32W, "GetProcAddress32W");
   pragma Import (Stdcall, FreeLibrary32W, "FreeLibrary32W");

end Win32.Wownt16;
