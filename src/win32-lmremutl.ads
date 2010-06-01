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

package Win32.Lmremutl is

   SUPPORTS_REMOTE_ADMIN_PROTOCOL : constant := 16#2#;
   SUPPORTS_RPC                   : constant := 16#4#;
   SUPPORTS_SAM_PROTOCOL          : constant := 16#8#;
   SUPPORTS_UNICODE               : constant := 16#10#;
   SUPPORTS_LOCAL                 : constant := 16#20#;
   SUPPORTS_ANY                   : constant := 16#ffffffff#;
   NO_PERMISSION_REQUIRED         : constant := 16#1#;
   ALLOCATE_RESPONSE              : constant := 16#2#;
   USE_SPECIFIC_TRANSPORT         : constant := 16#80000000#;

   type DESC_CHAR is new Win32.CHAR;

   type LPDESC is new Win32.PCHAR;

   type TIME_OF_DAY_INFO;

   type PTIME_OF_DAY_INFO is access all TIME_OF_DAY_INFO;
   subtype LPTIME_OF_DAY_INFO is PTIME_OF_DAY_INFO;

   type TIME_OF_DAY_INFO is record
      tod_elapsedt  : Win32.DWORD;
      tod_msecs     : Win32.DWORD;
      tod_hours     : Win32.DWORD;
      tod_mins      : Win32.DWORD;
      tod_secs      : Win32.DWORD;
      tod_hunds     : Win32.DWORD;
      tod_timezone  : Win32.LONG;
      tod_tinterval : Win32.DWORD;
      tod_day       : Win32.DWORD;
      tod_month     : Win32.DWORD;
      tod_year      : Win32.DWORD;
      tod_weekday   : Win32.DWORD;
   end record;

   function NetRemoteTOD
     (UncServerName : Win32.Winnt.LPTSTR;
      BufferPtr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetRemoteComputerSupports
     (UncServerName    : Win32.Winnt.LPTSTR;
      OptionsWanted    : Win32.DWORD;
      OptionsSupported : Win32.LPDWORD)
      return Win32.DWORD;

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
      return Win32.DWORD;

private

   pragma Convention (C, TIME_OF_DAY_INFO);

   pragma Import (Stdcall, NetRemoteTOD, "NetRemoteTOD");
   pragma Import
     (Stdcall,
      NetRemoteComputerSupports,
      "NetRemoteComputerSupports");

end Win32.Lmremutl;
