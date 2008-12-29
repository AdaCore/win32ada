-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
-- Collection of functions to convert between types.


with Win32;
with Win32.Winnt;
with Win32.WinUser;
with Interfaces.C.Strings;
with Interfaces.C;
with Unchecked_Conversion;


package Convert is

--  null_handle : Win32.Winnt.HANDLE := 0;

  function HANDLE_TO_LONG is new Unchecked_Conversion (Win32.Winnt.HANDLE,
                                                       Win32.LONG);
  function LONG_TO_HANDLE is new Unchecked_Conversion (Win32.LONG,
                                                       Win32.Winnt.HANDLE);
  function UNSIGNED_TO_HANDLE is new Unchecked_Conversion 
                                                      (Interfaces.C.Unsigned,
                                                       Win32.Winnt.HANDLE);
  function DWORD_TO_HANDLE is new Unchecked_Conversion (Win32.DWORD,
                                                        Win32.Winnt.HANDLE);
  function CHARS_PTR_TO_PCHAR is new Unchecked_Conversion
                              (Interfaces.C.Strings.Chars_Ptr, Win32.PCHAR);

  function LPMDICREATESTRUCT_TO_LPARAM is new Unchecked_Conversion
                                       (Win32.WinUser.LPMDICREATESTRUCT,
                                        Win32.LPARAM);

  function dword_to_int is new Unchecked_Conversion (Interfaces.C.Unsigned,
                                                     Interfaces.C.Int);

  function DWORD_TO_LPCSTR is new Unchecked_Conversion (Win32.DWORD,
                                                        Win32.LPCSTR);
  function LOWORD (w : Win32.DWORD) return Win32.WORD;
  function HIWORD (w : Win32.DWORD) return Win32.WORD;
  function LOWORD (i : Win32.INT) return Win32.SHORT;
  function HIWORD (i : Win32.INT) return Win32.SHORT;

  function MAKEINTRESOURCE (i : Win32.INT) return Win32.LPCSTR;
  
  function CP(C_Str: Win32.CHAR_Array) return Win32.LPCSTR;

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Convert;
