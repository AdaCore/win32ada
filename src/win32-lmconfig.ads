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

with Win32.Winnt;

package Win32.Lmconfig is

   type CONFIG_INFO_0;                                     --  lmconfig.h:95

   type PCONFIG_INFO_0 is access all CONFIG_INFO_0;        --  lmconfig.h:98
   subtype LPCONFIG_INFO_0 is PCONFIG_INFO_0;              --  lmconfig.h:98

   type CONFIG_INFO_0 is                                   --  lmconfig.h:95
      record
         cfgi0_key : Win32.Winnt.LPTSTR;                 --  lmconfig.h:96
         cfgi0_data : Win32.Winnt.LPTSTR;                 --  lmconfig.h:97
      end record;

   function NetConfigGet
     (server : Win32.Winnt.LPTSTR;
      component : Win32.Winnt.LPTSTR;
      parameter : Win32.Winnt.LPTSTR;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmconfig.h:55

   function NetConfigGetAll
     (server : Win32.Winnt.LPTSTR;
      component : Win32.Winnt.LPTSTR;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmconfig.h:68

   function NetConfigSet
     (server : Win32.Winnt.LPTSTR;
      reserved1 : Win32.Winnt.LPTSTR;
      component : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      reserved2 : Win32.DWORD;
      buf : Win32.LPBYTE;
      reserved3 : Win32.DWORD)
     return Win32.DWORD;                          --  lmconfig.h:81

private

   pragma Convention (C_Pass_By_Copy, CONFIG_INFO_0);         --  lmconfig.h:95

   pragma Import (Stdcall, NetConfigGet, "NetConfigGet");     --  lmconfig.h:55
   pragma Import (Stdcall, NetConfigGetAll, "NetConfigGetAll");
   --  lmconfig.h:68
   pragma Import (Stdcall, NetConfigSet, "NetConfigSet");     --  lmconfig.h:81

end Win32.Lmconfig;


