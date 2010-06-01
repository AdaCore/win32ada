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

with Stdarg.Impl;

package body Win32.Winbase is

   function GlobalDiscard
     (hglbMem : Win32.Windef.HGLOBAL)
      return Win32.Windef.HGLOBAL
   is
   begin
      return GlobalReAlloc (hglbMem, 0, GMEM_MOVEABLE);
   end GlobalDiscard;

   function LocalDiscard
     (hlocMem : Win32.Windef.HLOCAL)
      return Win32.Windef.HLOCAL
   is
   begin
      return LocalReAlloc (hlocMem, 0, LMEM_MOVEABLE);
   end LocalDiscard;

   function MAKEINTATOM (wInteger : WORD) return Win32.Winnt.LPTSTR is
      type Int is range
         -(2 ** (Standard'Address_Size - 1)) ..
         +(2 ** (Standard'Address_Size - 1) - 1);
      function To_LPTSTR is new Ada.Unchecked_Conversion (
         Int,
         Win32.Winnt.LPTSTR);
   begin
      return To_LPTSTR (Int (wInteger));
   end MAKEINTATOM;

   function FormatMessageA
     (dwFlags      : Win32.DWORD;
      lpSource     : Win32.LPCVOID;
      dwMessageId  : Win32.DWORD;
      dwLanguageId : Win32.DWORD;
      lpBuffer     : Win32.LPSTR;
      nSize        : Win32.DWORD;
      Arguments    : Stdarg.ArgList := Stdarg.Empty)
      return Win32.DWORD
   is
      function Doit
        (dwFlags      : Win32.DWORD;
         lpSource     : Win32.LPCVOID;
         dwMessageId  : Win32.DWORD;
         dwLanguageId : Win32.DWORD;
         lpBuffer     : Win32.LPSTR;
         nSize        : Win32.DWORD;
         Arguments    : access Stdarg.Impl.Param_Access)
         return Win32.DWORD;
      pragma Import (Stdcall, Doit, "FormatMessageA");

      Param_Addr : aliased Stdarg.Impl.Param_Access :=
         Stdarg.Impl.Address_of_First_Arg (Arguments);
   begin
      return Doit
               (dwFlags,
                lpSource,
                dwMessageId,
                dwLanguageId,
                lpBuffer,
                nSize,
                Param_Addr'Access);
   end FormatMessageA;

   function FormatMessageW
     (dwFlags      : Win32.DWORD;
      lpSource     : Win32.LPCVOID;
      dwMessageId  : Win32.DWORD;
      dwLanguageId : Win32.DWORD;
      lpBuffer     : Win32.LPWSTR;
      nSize        : Win32.DWORD;
      Arguments    : Stdarg.ArgList := Stdarg.Empty)
      return Win32.DWORD
   is
      function Doit
        (dwFlags      : Win32.DWORD;
         lpSource     : Win32.LPCVOID;
         dwMessageId  : Win32.DWORD;
         dwLanguageId : Win32.DWORD;
         lpBuffer     : Win32.LPWSTR;
         nSize        : Win32.DWORD;
         Arguments    : access Stdarg.Impl.Param_Access)
         return Win32.DWORD;
      pragma Import (Stdcall, Doit, "FormatMessageW");

      Param_Addr : aliased Stdarg.Impl.Param_Access :=
         Stdarg.Impl.Address_of_First_Arg (Arguments);
   begin
      return Doit
               (dwFlags,
                lpSource,
                dwMessageId,
                dwLanguageId,
                lpBuffer,
                nSize,
                Param_Addr'Access);
   end FormatMessageW;

end Win32.Winbase;
