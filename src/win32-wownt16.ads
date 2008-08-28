--  $Source$
--  $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
--  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
--  FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
--  the accuracy and the use of this file.  This file may be used, copied,
--  modified and distributed only by licensees of Microsoft Corporation's
--  WIN32 Software Development Kit in accordance with the terms of the
--  licensee's End-User License Agreement for Microsoft Software for the
--  WIN32 Development Kit.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Portions (c) 1985-1994 Microsoft Corporation with permission.
--  Microsoft is a registered trademark and Windows and Windows NT are
--  trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

package Win32.Wownt16 is

   CPEX_DEST_STDCALL : constant := 16#0#;                  --  wownt16.h:117
   CPEX_DEST_CDECL : constant := 16#80000000#;           --  wownt16.h:118

   function GetVDMPointer32W
     (vp : Win32.LPVOID;
      fMode : Win32.UINT)
     return Win32.DWORD;                          --  wownt16.h:38

   function LoadLibraryEx32W
     (lpszLibFile : Win32.LPCSTR;
      hFile : Win32.DWORD;
      dwFlags : Win32.DWORD)
     return Win32.DWORD;                          --  wownt16.h:48

   function GetProcAddress32W
     (hModule : Win32.DWORD;
      lpszProc : Win32.LPCSTR)
     return Win32.DWORD;                          --  wownt16.h:49

   function FreeLibrary32W
     (hLibModule : Win32.DWORD)
     return Win32.DWORD;                          --  wownt16.h:50

   --  on NT but not on Windows 95
   --  function CallProcEx32W(
   --  cParams        : Win32.DWORD;
   --  fAddressConvert: Win32.DWORD;
   --  lpProcAddress  : Win32.DWORD;
   --  Args           : Stdarg.ArgList := Stdarg.Empty)
   --  return Win32.DWORD;                       -- wownt16.h:115

private

   pragma Import (Stdcall, GetVDMPointer32W, "GetVDMPointer32W");
   --  wownt16.h:38
   pragma Import (Stdcall, LoadLibraryEx32W, "LoadLibraryEx32W");
   --  wownt16.h:48
   pragma Import (Stdcall, GetProcAddress32W, "GetProcAddress32W");
   --  wownt16.h:49
   pragma Import (Stdcall, FreeLibrary32W, "FreeLibrary32W");
   --  wownt16.h:50

end Win32.Wownt16;
