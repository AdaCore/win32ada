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
--  Copyright (C) 2000-2025, AdaCore
--
-------------------------------------------------------------------------------

with Stdarg.Impl;

package body Win32.Winbase is

   function Intrinsic_Sync_Add_And_Fetch
     (Ptr   : access Win32.DWORD;
      Value : Win32.DWORD) return Win32.DWORD;
   pragma Import (Intrinsic, Intrinsic_Sync_Add_And_Fetch,
                  External_Name => "__sync_add_and_fetch_4");

   function Intrinsic_Sync_Sub_And_Fetch
     (Ptr   : access Win32.DWORD;
      Value : Win32.DWORD) return Win32.DWORD;
   pragma Import (Intrinsic, Intrinsic_Sync_Sub_And_Fetch,
                  External_Name => "__sync_sub_and_fetch_4");

   function Intrinsic_Sync_Val_Comprare_And_Swap
     (Ptr    : access Win32.DWORD;
      Oldval : Win32.DWORD;
      Newval : Win32.DWORD) return Win32.DWORD;
   pragma Import (Intrinsic, Intrinsic_Sync_Val_Comprare_And_Swap,
                  External_Name => "__sync_val_compare_and_swap_4");

   function Intrinsic_Sync_Lock_Test_And_Set
     (Target : access Win32.DWORD;
      Value  : Win32.DWORD)
      return Win32.DWORD;
   pragma Import (Intrinsic, Intrinsic_Sync_Lock_Test_And_Set,
                  "__sync_lock_test_and_set_4");

   function GlobalDiscard
     (hglbMem : Win32.Windef.HGLOBAL)
      return Win32.Windef.HGLOBAL
   is
   begin
      return GlobalReAlloc (hglbMem, 0, GMEM_MOVEABLE);
   end GlobalDiscard;

   function InterlockedCompareExchange
     (Target    : access Win32.LONG;
      ExChange  : Win32.LONG;
      Comperand : Win32.LONG) return Win32.LONG
   is
      lpInternal : access Win32.DWORD with Import, Address => Target'Address;
   begin
      --  Note the swapped parameters Comperand & ExChange
     return Win32.LONG
       (Intrinsic_Sync_Val_Comprare_And_Swap
         (lpInternal, Win32.DWORD (Comperand), Win32.DWORD (ExChange)));
   end InterlockedCompareExchange;

   function InterlockedDecrement
     (lpAddend : access Win32.LONG) return Win32.LONG
   is
      lpInternal : access Win32.DWORD with Import, Address => lpAddend'Address;
   begin
      return Win32.LONG (Intrinsic_Sync_Sub_And_Fetch (lpInternal, 1));
   end InterlockedDecrement;

   function InterlockedExchange
     (Target : access Win32.LONG;
      Value  : Win32.LONG)
      return Win32.LONG
   is
      lpInternal : access Win32.DWORD with Import, Address => Target'Address;
   begin
      return Win32.LONG
        (Intrinsic_Sync_Lock_Test_And_Set (lpInternal, Win32.DWORD (Value)));
   end InterlockedExchange;

   function InterlockedIncrement
     (lpAddend : access Win32.LONG) return Win32.LONG
   is
      lpInternal : access Win32.DWORD with Import, Address => lpAddend'Address;
   begin
      return Win32.LONG (Intrinsic_Sync_Add_And_Fetch (lpInternal, 1));
   end InterlockedIncrement;

   function LocalDiscard
     (hlocMem : Win32.Windef.HLOCAL)
      return Win32.Windef.HLOCAL is
   begin
      return LocalReAlloc (hlocMem, 0, LMEM_MOVEABLE);
   end LocalDiscard;

   function MAKEINTATOM (wInteger : WORD) return Win32.Winnt.LPTSTR is
      type Int is range
         -(2 ** (Standard'Address_Size - 1)) ..
         +(2 ** (Standard'Address_Size - 1) - 1);
      function To_LPTSTR is new Ada.Unchecked_Conversion
        (Int, Win32.Winnt.LPTSTR);
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

   function HasOverlappedIoCompleted
     (lpOverlapped: Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL
   is
      use type Win32.DWORD;
   begin
      if DWORD (lpOverlapped.Internal) = Win32.Winnt.STATUS_PENDING then
         return Win32.FALSE;
      else
         return Win32.TRUE;
      end if;
   end HasOverlappedIoCompleted;

end Win32.Winbase;
