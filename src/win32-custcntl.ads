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

with Win32.Windef;
with Win32.Winnt;

package Win32.Custcntl is

   CCHCCCLASS : constant := 32;
   CCHCCDESC  : constant := 32;
   CCHCCTEXT  : constant := 256;
   CCF_NOTEXT : constant := 16#1#;

   type CCSTYLEA;
   type CCSTYLEW;
   type CCSTYLEFLAGA;
   type CCSTYLEFLAGW;
   type CCINFOA;
   type CCINFOW;

   type LPCCSTYLEA is access all CCSTYLEA;
   subtype LPCCSTYLE is LPCCSTYLEA;
   type LPCCSTYLEW is access all CCSTYLEW;
   type LPCCSTYLEFLAGA is access all CCSTYLEFLAGA;
   subtype LPCCSTYLEFLAG is LPCCSTYLEFLAGA;
   type LPCCSTYLEFLAGW is access all CCSTYLEFLAGW;
   type LPCCINFOA is access all CCINFOA;
   subtype LPCCINFO is LPCCINFOA;
   type LPCCINFOW is access all CCINFOW;

   type CCSTYLEA is record
      flStyle    : Win32.DWORD;
      flExtStyle : Win32.DWORD;
      szText     : Win32.CHAR_Array (0 .. CCHCCTEXT - 1);
      lgid       : Win32.Winnt.LANGID;
      wReserved1 : Win32.WORD;
   end record;

   subtype CCSTYLE is CCSTYLEA;

   type CCSTYLEW is record
      flStyle    : Win32.DWORD;
      flExtStyle : Win32.DWORD;
      szText     : Win32.WCHAR_Array (0 .. CCHCCTEXT - 1);
      lgid       : Win32.Winnt.LANGID;
      wReserved1 : Win32.WORD;
   end record;

   type LPFNCCSTYLEA is access function
     (hwndParent : Win32.Windef.HWND;
      pccs       : LPCCSTYLEA)
      return Win32.BOOL;
   pragma Convention (Stdcall, LPFNCCSTYLEA);
   subtype LPFNCCSTYLE is LPFNCCSTYLEA;
   type LPFNCCSTYLEW is access function
     (hwndParent : Win32.Windef.HWND;
      pccs       : LPCCSTYLEW)
      return Win32.BOOL;
   pragma Convention (Stdcall, LPFNCCSTYLEW);
   type LPFNCCSIZETOTEXTA is access function
     (flStyle    : Win32.DWORD;
      flExtStyle : Win32.DWORD;
      hfont      : Win32.Windef.HFONT;
      pszText    : Win32.LPSTR)
      return Win32.INT;
   pragma Convention (Stdcall, LPFNCCSIZETOTEXTA);
   subtype LPFNCCSIZETOTEXT is LPFNCCSIZETOTEXTA;
   type LPFNCCSIZETOTEXTW is access function
     (flStyle    : Win32.DWORD;
      flExtStyle : Win32.DWORD;
      hfont      : Win32.Windef.HFONT;
      pszText    : Win32.LPWSTR)
      return Win32.INT;
   pragma Convention (Stdcall, LPFNCCSIZETOTEXTW);

   type CCSTYLEFLAGA is record
      flStyle     : Win32.DWORD;
      flStyleMask : Win32.DWORD;
      pszStyle    : Win32.LPSTR;
   end record;

   subtype CCSTYLEFLAG is CCSTYLEFLAGA;

   type CCSTYLEFLAGW is record
      flStyle     : Win32.DWORD;
      flStyleMask : Win32.DWORD;
      pszStyle    : Win32.LPWSTR;
   end record;

   type CCINFOA is record
      szClass           : Win32.CHAR_Array (0 .. 31);
      flOptions         : Win32.DWORD;
      szDesc            : Win32.CHAR_Array (0 .. 31);
      cxDefault         : Win32.UINT;
      cyDefault         : Win32.UINT;
      flStyleDefault    : Win32.DWORD;
      flExtStyleDefault : Win32.DWORD;
      flCtrlTypeMask    : Win32.DWORD;
      szTextDefault     : Win32.CHAR_Array (0 .. CCHCCTEXT - 1);
      cStyleFlags       : Win32.INT;
      aStyleFlags       : LPCCSTYLEFLAGA;
      lpfnStyle         : LPFNCCSTYLEA;
      lpfnSizeToText    : LPFNCCSIZETOTEXTA;
      dwReserved1       : Win32.DWORD;
      dwReserved2       : Win32.DWORD;
   end record;

   subtype CCINFO is CCINFOA;

   type CCINFOW is record
      szClass           : Win32.WCHAR_Array (0 .. CCHCCCLASS - 1);
      flOptions         : Win32.DWORD;
      szDesc            : Win32.WCHAR_Array (0 .. CCHCCDESC - 1);
      cxDefault         : Win32.UINT;
      cyDefault         : Win32.UINT;
      flStyleDefault    : Win32.DWORD;
      flExtStyleDefault : Win32.DWORD;
      flCtrlTypeMask    : Win32.DWORD;
      cStyleFlags       : Win32.INT;
      aStyleFlags       : LPCCSTYLEFLAGW;
      szTextDefault     : Win32.WCHAR_Array (0 .. CCHCCTEXT - 1);
      lpfnStyle         : LPFNCCSTYLEW;
      lpfnSizeToText    : LPFNCCSIZETOTEXTW;
      dwReserved1       : Win32.DWORD;
      dwReserved2       : Win32.DWORD;
   end record;

   type LPFNCCINFOA is access function (acci : LPCCINFOA) return Win32.UINT;
   pragma Convention (Stdcall, LPFNCCINFOA);

   subtype LPFNCCINFO is LPFNCCINFOA;

   type LPFNCCINFOW is access function (acci : LPCCINFOW) return Win32.UINT;
   pragma Convention (Stdcall, LPFNCCINFOW);

private

   pragma Convention (C, CCSTYLEA);
   pragma Convention (C, CCSTYLEW);
   pragma Convention (C_Pass_By_Copy, CCSTYLEFLAGA);
   pragma Convention (C_Pass_By_Copy, CCSTYLEFLAGW);
   pragma Convention (C, CCINFOA);
   pragma Convention (C, CCINFOW);

end Win32.Custcntl;
