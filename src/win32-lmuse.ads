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

package Win32.Lmuse is

   USE_LOCAL_PARMNUM      : constant := 1;
   USE_REMOTE_PARMNUM     : constant := 2;
   USE_PASSWORD_PARMNUM   : constant := 3;
   USE_ASGTYPE_PARMNUM    : constant := 4;
   USE_USERNAME_PARMNUM   : constant := 5;
   USE_DOMAINNAME_PARMNUM : constant := 6;
   USE_OK                 : constant := 0;
   USE_PAUSED             : constant := 1;
   USE_SESSLOST           : constant := 2;
   USE_DISCONN            : constant := 2;
   USE_NETERR             : constant := 3;
   USE_CONN               : constant := 4;
   USE_RECONN             : constant := 5;
   USE_DISKDEV            : constant := 0;
   USE_SPOOLDEV           : constant := 1;
   USE_CHARDEV            : constant := 2;
   USE_IPC                : constant := 3;

   type USE_INFO_0;
   type USE_INFO_1;
   type USE_INFO_2;

   type PUSE_INFO_0 is access all USE_INFO_0;
   subtype LPUSE_INFO_0 is PUSE_INFO_0;
   type PUSE_INFO_1 is access all USE_INFO_1;
   subtype LPUSE_INFO_1 is PUSE_INFO_1;
   type PUSE_INFO_2 is access all USE_INFO_2;
   subtype LPUSE_INFO_2 is PUSE_INFO_2;

   type USE_INFO_0 is record
      ui0_local  : Win32.Winnt.LPTSTR;
      ui0_remote : Win32.Winnt.LPTSTR;
   end record;

   type USE_INFO_1 is record
      ui1_local    : Win32.Winnt.LPTSTR;
      ui1_remote   : Win32.Winnt.LPTSTR;
      ui1_password : Win32.Winnt.LPTSTR;
      ui1_status   : Win32.DWORD;
      ui1_asg_type : Win32.DWORD;
      ui1_refcount : Win32.DWORD;
      ui1_usecount : Win32.DWORD;
   end record;

   type USE_INFO_2 is record
      ui2_local      : Win32.Winnt.LPTSTR;
      ui2_remote     : Win32.Winnt.LPTSTR;
      ui2_password   : Win32.Winnt.LPTSTR;
      ui2_status     : Win32.DWORD;
      ui2_asg_type   : Win32.DWORD;
      ui2_refcount   : Win32.DWORD;
      ui2_usecount   : Win32.DWORD;
      ui2_username   : Win32.Winnt.LPTSTR;
      ui2_domainname : Win32.Winnt.LPTSTR;
   end record;

   function NetUseAdd
     (UncServerName : Win32.Winnt.LPTSTR;
      Level         : Win32.DWORD;
      Buf           : Win32.LPBYTE;
      ParmError     : access Win32.DWORD)
      return Win32.DWORD;

   function NetUseDel
     (UncServerName : Win32.Winnt.LPTSTR;
      UseName       : Win32.Winnt.LPTSTR;
      ForceCond     : Win32.DWORD)
      return Win32.DWORD;

   function NetUseEnum
     (UncServerName       : Win32.Winnt.LPTSTR;
      Level               : Win32.DWORD;
      BufPtr              : access Win32.PBYTE;
      PreferedMaximumSize : Win32.DWORD;
      EntriesRead         : access Win32.DWORD;
      TotalEntries        : access Win32.DWORD;
      ResumeHandle        : access Win32.DWORD)
      return Win32.DWORD;

   function NetUseGetInfo
     (UncServerName : Win32.Winnt.LPTSTR;
      UseName       : Win32.Winnt.LPTSTR;
      Level         : Win32.DWORD;
      BufPtr        : access Win32.PBYTE)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, USE_INFO_0);
   pragma Convention (C, USE_INFO_1);
   pragma Convention (C, USE_INFO_2);

   pragma Import (Stdcall, NetUseAdd, "NetUseAdd");
   pragma Import (Stdcall, NetUseDel, "NetUseDel");
   pragma Import (Stdcall, NetUseEnum, "NetUseEnum");
   pragma Import (Stdcall, NetUseGetInfo, "NetUseGetInfo");

end Win32.Lmuse;
