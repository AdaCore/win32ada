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

with Stdarg.Impl; use Stdarg.Impl;

package body Win32.Lmremutl is

   function "&" is new Stdarg.Concat (Win32.DWORD);
   function "&" is new Stdarg.Concat (Win32.Winnt.LPTSTR);
   function "&" is new Stdarg.Concat (LPDESC);

   function RxRemoteApi
     (ApiNumber      : Win32.DWORD;
      UncServerName  : Win32.Winnt.LPTSTR;
      ParmDescString : LPDESC;
      DataDesc16     : LPDESC;
      DataDesc32     : LPDESC;
      DataDescSmb    : LPDESC;
      AuxDesc16      : LPDESC;
      AuxDesc32      : LPDESC;
      AuxDescSmb     : LPDESC;
      Flags          : Win32.DWORD;
      Args           : Stdarg.ArgList := Stdarg.Empty)
      return Win32.DWORD
   is
      ArgList : constant Stdarg.ArgList :=
         Stdarg.Empty &
         ApiNumber &
         UncServerName &
         ParmDescString &
         DataDesc16 &
         DataDesc32 &
         DataDescSmb &
         AuxDesc16 &
         AuxDesc32 &
         AuxDescSmb &
         Flags &
         Args;
      procedure C_RxRemoteApi;
      pragma Import (C, C_RxRemoteApi, "RxRemoteApi");

   begin
      return (Win32.DWORD (F_Varargs
                              (C_RxRemoteApi'Address,
                               ArgCount (ArgList),
                               Address_of_First_Arg (ArgList))));
   end RxRemoteApi;

end Win32.Lmremutl;
