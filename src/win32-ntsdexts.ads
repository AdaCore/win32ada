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

with Stdarg;
with Win32.Winnt;

package Win32.Ntsdexts is


   type NTSD_EXTENSION_APIS;                               --  ntsdexts.h:68

   type PNTSD_EXTENSION_APIS is access all NTSD_EXTENSION_APIS;
   --  ntsdexts.h:75

   type PNTSD_OUTPUT_ROUTINE is access procedure
     (p1 : Win32.PCHAR;
      Args : Stdarg.ArgList := Stdarg.Empty);      --  ntsdexts.h:35
   pragma Convention (Stdcall, PNTSD_OUTPUT_ROUTINE);

   type PNTSD_GET_EXPRESSION is access function
     (p1 : Win32.PCHAR)
     return Win32.DWORD;                          --  ntsdexts.h:42
   pragma Convention (Stdcall, PNTSD_GET_EXPRESSION);

   type PNTSD_GET_SYMBOL is access procedure
     (offset : Win32.LPVOID;
      pchBuffer : Win32.PUCHAR;
      pDisplacement : Win32.LPDWORD);              --  ntsdexts.h:48
   pragma Convention (Stdcall, PNTSD_GET_SYMBOL);

   type PNTSD_DISASM is access function
     (lpOffset : Win32.LPDWORD;
      lpBuffer : Win32.LPSTR;
      fShowEfeectiveAddress : Win32.BOOL)
     return Win32.DWORD;                          --  ntsdexts.h:56
   pragma Convention (Stdcall, PNTSD_DISASM);

   type PNTSD_CHECK_CONTROL_C is access function return Win32.BOOL;
   pragma Convention (Stdcall, PNTSD_CHECK_CONTROL_C);
   --  ntsdexts.h:64

   type NTSD_EXTENSION_APIS is                             --  ntsdexts.h:68
      record
         nSize : Win32.DWORD;            --  ntsdexts.h:69
         lpOutputRoutine : PNTSD_OUTPUT_ROUTINE;   --  ntsdexts.h:70
         lpGetExpressionRoutine : PNTSD_GET_EXPRESSION;   --  ntsdexts.h:71
         lpGetSymbolRoutine : PNTSD_GET_SYMBOL;       --  ntsdexts.h:72
         lpDisasmRoutine : PNTSD_DISASM;           --  ntsdexts.h:73
         lpCheckControlCRoutine : PNTSD_CHECK_CONTROL_C;  --  ntsdexts.h:74
      end record;

   type PNTSD_EXTENSION_ROUTINE is access procedure
     (hCurrentProcess : Win32.Winnt.HANDLE;
      hCurrentThread : Win32.Winnt.HANDLE;
      dwCurrentPc : Win32.DWORD;
      lpExtensionApis : PNTSD_EXTENSION_APIS;
      lpArgumentString : Win32.LPSTR);             --  ntsdexts.h:79
   pragma Convention (Stdcall, PNTSD_EXTENSION_ROUTINE);

private

   pragma Convention (C, NTSD_EXTENSION_APIS);              --  ntsdexts.h:68

end Win32.Ntsdexts;


