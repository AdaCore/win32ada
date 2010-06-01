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

with Stdarg;
with Win32.Winnt;

package Win32.Ntsdexts is

   type NTSD_EXTENSION_APIS;

   type PNTSD_EXTENSION_APIS is access all NTSD_EXTENSION_APIS;

   type PNTSD_OUTPUT_ROUTINE is access procedure
     (p1   : Win32.PCHAR;
      Args : Stdarg.ArgList := Stdarg.Empty);
   pragma Convention (Stdcall, PNTSD_OUTPUT_ROUTINE);

   type PNTSD_GET_EXPRESSION is access function
     (p1   : Win32.PCHAR)
      return Win32.DWORD;
   pragma Convention (Stdcall, PNTSD_GET_EXPRESSION);

   type PNTSD_GET_SYMBOL is access procedure
     (offset        : Win32.LPVOID;
      pchBuffer     : Win32.PUCHAR;
      pDisplacement : Win32.LPDWORD);
   pragma Convention (Stdcall, PNTSD_GET_SYMBOL);

   type PNTSD_DISASM is access function
     (lpOffset              : Win32.LPDWORD;
      lpBuffer              : Win32.LPSTR;
      fShowEfeectiveAddress : Win32.BOOL)
      return Win32.DWORD;
   pragma Convention (Stdcall, PNTSD_DISASM);

   type PNTSD_CHECK_CONTROL_C is access function return Win32.BOOL;
   pragma Convention (Stdcall, PNTSD_CHECK_CONTROL_C);

   type NTSD_EXTENSION_APIS is record
      nSize                  : Win32.DWORD;
      lpOutputRoutine        : PNTSD_OUTPUT_ROUTINE;
      lpGetExpressionRoutine : PNTSD_GET_EXPRESSION;
      lpGetSymbolRoutine     : PNTSD_GET_SYMBOL;
      lpDisasmRoutine        : PNTSD_DISASM;
      lpCheckControlCRoutine : PNTSD_CHECK_CONTROL_C;
   end record;

   type PNTSD_EXTENSION_ROUTINE is access procedure
     (hCurrentProcess  : Win32.Winnt.HANDLE;
      hCurrentThread   : Win32.Winnt.HANDLE;
      dwCurrentPc      : Win32.DWORD;
      lpExtensionApis  : PNTSD_EXTENSION_APIS;
      lpArgumentString : Win32.LPSTR);
   pragma Convention (Stdcall, PNTSD_EXTENSION_ROUTINE);

private

   pragma Convention (C, NTSD_EXTENSION_APIS);

end Win32.Ntsdexts;
