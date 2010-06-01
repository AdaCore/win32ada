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

with Win32.Winnt;

package Win32.Lmconfig is

   type CONFIG_INFO_0;

   type PCONFIG_INFO_0 is access all CONFIG_INFO_0;
   subtype LPCONFIG_INFO_0 is PCONFIG_INFO_0;

   type CONFIG_INFO_0 is record
      cfgi0_key  : Win32.Winnt.LPTSTR;
      cfgi0_data : Win32.Winnt.LPTSTR;
   end record;

   function NetConfigGet
     (server    : Win32.Winnt.LPTSTR;
      component : Win32.Winnt.LPTSTR;
      parameter : Win32.Winnt.LPTSTR;
      bufptr    : access Win32.PBYTE)
      return Win32.DWORD;

   function NetConfigGetAll
     (server    : Win32.Winnt.LPTSTR;
      component : Win32.Winnt.LPTSTR;
      bufptr    : access Win32.PBYTE)
      return Win32.DWORD;

   function NetConfigSet
     (server    : Win32.Winnt.LPTSTR;
      reserved1 : Win32.Winnt.LPTSTR;
      component : Win32.Winnt.LPTSTR;
      level     : Win32.DWORD;
      reserved2 : Win32.DWORD;
      buf       : Win32.LPBYTE;
      reserved3 : Win32.DWORD)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, CONFIG_INFO_0);

   pragma Import (Stdcall, NetConfigGet, "NetConfigGet");
   pragma Import (Stdcall, NetConfigGetAll, "NetConfigGetAll");
   pragma Import (Stdcall, NetConfigSet, "NetConfigSet");

end Win32.Lmconfig;
