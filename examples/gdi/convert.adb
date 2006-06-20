-- $Source$ 
-- $Revision$ $Date$ $Author$
 
with Ada.Unchecked_Conversion;
with Interfaces;    use Interfaces;    -- for operations on types
with Interfaces.C;  use Interfaces.C;  -- for operations on types
with System;
with Win32;


package body Convert is

  pragma Suppress(All_Checks);

  function LOWORD (w : Win32.DWORD) return Win32.WORD is
  begin
    return Win32.WORD (w and 16#FFFF#);
  end LOWORD;

  function HIWORD (w : Win32.DWORD) return Win32.WORD is
    shift : Interfaces.UNSIGNED_32;
  begin
    shift := Interfaces.UNSIGNED_32 (w);
    shift := Interfaces.Shift_Right (shift, 16);
    return Win32.WORD (shift);
  end HIWORD;

  function LOWORD (i : Win32.INT) return Win32.SHORT is
    signed_word : Win32.SHORT;
  begin
    signed_word := Win32.SHORT (LOWORD (w => Win32.DWORD (i)));
    return signed_word;
  end LOWORD;

  function HIWORD (i : Win32.INT) return Win32.SHORT is
    signed_word : Win32.SHORT;
  begin
    signed_word := Win32.SHORT (HIWORD (w => Win32.DWORD (i)));
    return signed_word;
  end HIWORD;

  function MAKEINTRESOURCE (i : Win32.INT) return Win32.LPCSTR is
    tmp : Win32.DWORD;
  begin
    tmp := Win32.DWORD (loword (i));
    return DWORD_TO_LPCSTR (tmp);
  end MAKEINTRESOURCE;

  function CP(C_Str : Win32.CHAR_Array) return Win32.LPCSTR is
      function UC is new Ada.Unchecked_Conversion
            (System.Address,Win32.LPCSTR);
  begin
      return UC(C_Str(C_Str'First)'Address);
  end CP;

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

end Convert;
