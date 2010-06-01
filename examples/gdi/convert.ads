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

with Win32;
with Win32.Winnt;
with Win32.Winuser;
with Interfaces.C.Strings;
with Interfaces.C;
with Unchecked_Conversion;

package Convert is

   function HANDLE_TO_LONG is new Unchecked_Conversion (
      Win32.Winnt.HANDLE,
      Win32.LONG);
   function LONG_TO_HANDLE is new Unchecked_Conversion (
      Win32.LONG,
      Win32.Winnt.HANDLE);
   function UNSIGNED_TO_HANDLE is new Unchecked_Conversion (
      Interfaces.C.unsigned,
      Win32.Winnt.HANDLE);
   function DWORD_TO_HANDLE is new Unchecked_Conversion (
      Win32.DWORD,
      Win32.Winnt.HANDLE);
   function CHARS_PTR_TO_PCHAR is new Unchecked_Conversion (
      Interfaces.C.Strings.chars_ptr,
      Win32.PCHAR);

   function LPMDICREATESTRUCT_TO_LPARAM is new Unchecked_Conversion (
      Win32.Winuser.LPMDICREATESTRUCT,
      Win32.LPARAM);

   function dword_to_int is new Unchecked_Conversion (
      Interfaces.C.unsigned,
      Interfaces.C.int);

   function DWORD_TO_LPCSTR is new Unchecked_Conversion (
      Win32.DWORD,
      Win32.LPCSTR);
   function LOWORD (w : Win32.DWORD) return Win32.WORD;
   function HIWORD (w : Win32.DWORD) return Win32.WORD;
   function LOWORD (i : Win32.INT) return Win32.SHORT;
   function HIWORD (i : Win32.INT) return Win32.SHORT;

   function MAKEINTRESOURCE (i : Win32.INT) return Win32.LPCSTR;

   function CP (C_Str : Win32.CHAR_Array) return Win32.LPCSTR;

end Convert;
