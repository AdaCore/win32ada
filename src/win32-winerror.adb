--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-winerror.adb, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT
--  WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
--  TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
--  PARTICULAR PURPOSE.  The user assumes the entire risk as to the accuracy
--  and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------

with Interfaces.C;
with Interfaces;
with Win32.Utils;

package body Win32.Winerror is

   use type Interfaces.C.unsigned_long;

   function SUCCEEDED (Status : HRESULT) return Standard.Boolean is
      use Win32.Utils;
   begin
      return (Status >= 0);
   end SUCCEEDED;

   function FAILED (Status : HRESULT) return Standard.Boolean is
      use Win32.Utils;
   begin
      return not SUCCEEDED (Status);
   end FAILED;

   function HRESULT_CODE (H : HRESULT) return WORD is
      use Win32.Utils;
   begin
      return Win32.Utils.LOWORD (Win32.Utils.DWORD (H));
   end HRESULT_CODE;

   function HRESULT_FACILITY (H : HRESULT) return WORD is
      use Interfaces.C;
   begin
      return Win32.Utils.HIWORD (Win32.Utils.DWORD (H)) and 16#1fff#;
   end HRESULT_FACILITY;

   function HRESULT_SEVERITY (H : HRESULT) return WORD is
   begin
      if H < 0 then return 1; else return 0; end if;
   end HRESULT_SEVERITY;

   function MAKE_HRESULT (sev, fac, code : WORD) return HRESULT is
      use Win32.Utils;
      use Interfaces;
   begin
      return HRESULT
        (Shift_Left (Unsigned_32 (sev), 31) or
        Shift_Left (Unsigned_32 (fac), 16) or
        Unsigned_32 (LONG (code)));
   end MAKE_HRESULT;

   function HRESULT_FROM_WIN32 (X : DWORD) return HRESULT is
      use Win32.Utils;
      use type Interfaces.C.unsigned_short;
   begin
      if X  /=  0 then
         return HRESULT (Win32.Utils.MAKELONG
           (Low  => LOWORD (X),
           High => FACILITY_WIN32 or 16#8000#));
      else
         return 0;
      end if;
   end HRESULT_FROM_WIN32;

   function HRESULT_FROM_NT (X : DWORD) return HRESULT is
      use Interfaces.C;
   begin
      return HRESULT (X or FACILITY_NT_BIT);
   end HRESULT_FROM_NT;

end Win32.Winerror;


