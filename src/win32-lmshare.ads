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

package Win32.Lmshare is

   SHARE_NETNAME_PARMNUM      : constant := 1;
   SHARE_TYPE_PARMNUM         : constant := 3;
   SHARE_REMARK_PARMNUM       : constant := 4;
   SHARE_PERMISSIONS_PARMNUM  : constant := 5;
   SHARE_MAX_USES_PARMNUM     : constant := 6;
   SHARE_CURRENT_USES_PARMNUM : constant := 7;
   SHARE_PATH_PARMNUM         : constant := 8;
   SHARE_PASSWD_PARMNUM       : constant := 9;
   SHARE_FILE_SD_PARMNUM      : constant := 501;
   SHARE_REMARK_INFOLEVEL     : constant := 1004;
   SHARE_MAX_USES_INFOLEVEL   : constant := 1006;
   SHARE_FILE_SD_INFOLEVEL    : constant := 1501;
   SHI1_NUM_ELEMENTS          : constant := 4;
   SHI2_NUM_ELEMENTS          : constant := 10;
   STYPE_DISKTREE             : constant := 0;
   STYPE_PRINTQ               : constant := 1;
   STYPE_DEVICE               : constant := 2;
   STYPE_IPC                  : constant := 3;
   STYPE_DFS                  : constant := 100;
   STYPE_SPECIAL              : constant := 16#80000000#;
   SHI_USES_UNLIMITED         : constant DWORD := DWORD'Last;
   SESS_GUEST                 : constant := 16#1#;
   SESS_NOENCRYPTION          : constant := 16#2#;
   SESI1_NUM_ELEMENTS         : constant := 8;
   SESI2_NUM_ELEMENTS         : constant := 9;
   PERM_FILE_READ             : constant := 16#1#;
   PERM_FILE_WRITE            : constant := 16#2#;
   PERM_FILE_CREATE           : constant := 16#4#;

   type SHARE_INFO_0;
   type SHARE_INFO_1;
   type SHARE_INFO_2;
   type SHARE_INFO_502;
   type SHARE_INFO_1004;
   type SHARE_INFO_1006;
   type SHARE_INFO_1501;
   type SESSION_INFO_0;
   type SESSION_INFO_1;
   type SESSION_INFO_2;
   type SESSION_INFO_10;
   type SESSION_INFO_502;
   type CONNECTION_INFO_0;
   type CONNECTION_INFO_1;
   type FILE_INFO_2;
   type FILE_INFO_3;

   type PSHARE_INFO_0 is access all SHARE_INFO_0;
   subtype LPSHARE_INFO_0 is PSHARE_INFO_0;
   type PSHARE_INFO_1 is access all SHARE_INFO_1;
   subtype LPSHARE_INFO_1 is PSHARE_INFO_1;
   type PSHARE_INFO_2 is access all SHARE_INFO_2;
   subtype LPSHARE_INFO_2 is PSHARE_INFO_2;
   type PSHARE_INFO_502 is access all SHARE_INFO_502;
   subtype LPSHARE_INFO_502 is PSHARE_INFO_502;
   type PSHARE_INFO_1004 is access all SHARE_INFO_1004;
   subtype LPSHARE_INFO_1004 is PSHARE_INFO_1004;
   type PSHARE_INFO_1006 is access all SHARE_INFO_1006;
   subtype LPSHARE_INFO_1006 is PSHARE_INFO_1006;
   type PSHARE_INFO_1501 is access all SHARE_INFO_1501;
   subtype LPSHARE_INFO_1501 is PSHARE_INFO_1501;
   type PSESSION_INFO_0 is access all SESSION_INFO_0;
   subtype LPSESSION_INFO_0 is PSESSION_INFO_0;
   type PSESSION_INFO_1 is access all SESSION_INFO_1;
   subtype LPSESSION_INFO_1 is PSESSION_INFO_1;
   type PSESSION_INFO_2 is access all SESSION_INFO_2;
   subtype LPSESSION_INFO_2 is PSESSION_INFO_2;
   type PSESSION_INFO_10 is access all SESSION_INFO_10;
   subtype LPSESSION_INFO_10 is PSESSION_INFO_10;
   type PSESSION_INFO_502 is access all SESSION_INFO_502;
   subtype LPSESSION_INFO_502 is PSESSION_INFO_502;
   type PCONNECTION_INFO_0 is access all CONNECTION_INFO_0;
   subtype LPCONNECTION_INFO_0 is PCONNECTION_INFO_0;
   type PCONNECTION_INFO_1 is access all CONNECTION_INFO_1;
   subtype LPCONNECTION_INFO_1 is PCONNECTION_INFO_1;
   type PFILE_INFO_2 is access all FILE_INFO_2;
   subtype LPFILE_INFO_2 is PFILE_INFO_2;
   type PFILE_INFO_3 is access all FILE_INFO_3;
   subtype LPFILE_INFO_3 is PFILE_INFO_3;

   type SHARE_INFO_0 is record
      shi0_netname : Win32.Winnt.LPTSTR;
   end record;

   type SHARE_INFO_1 is record
      shi1_netname : Win32.Winnt.LPTSTR;
      shi1_type    : Win32.DWORD;
      shi1_remark  : Win32.Winnt.LPTSTR;
   end record;

   type SHARE_INFO_2 is record
      shi2_netname      : Win32.Winnt.LPTSTR;
      shi2_type         : Win32.DWORD;
      shi2_remark       : Win32.Winnt.LPTSTR;
      shi2_permissions  : Win32.DWORD;
      shi2_max_uses     : Win32.DWORD;
      shi2_current_uses : Win32.DWORD;
      shi2_path         : Win32.Winnt.LPTSTR;
      shi2_passwd       : Win32.Winnt.LPTSTR;
   end record;

   type SHARE_INFO_502 is record
      shi502_netname             : Win32.Winnt.LPTSTR;
      shi502_type                : Win32.DWORD;
      shi502_remark              : Win32.Winnt.LPTSTR;
      shi502_permissions         : Win32.DWORD;
      shi502_max_uses            : Win32.DWORD;
      shi502_current_uses        : Win32.DWORD;
      shi502_path                : Win32.Winnt.LPTSTR;
      shi502_passwd              : Win32.Winnt.LPTSTR;
      shi502_reserved            : Win32.DWORD;
      shi502_security_descriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
   end record;

   type SHARE_INFO_1004 is record
      shi1004_remark : Win32.Winnt.LPTSTR;
   end record;

   type SHARE_INFO_1006 is record
      shi1006_max_uses : Win32.DWORD;
   end record;

   type SHARE_INFO_1501 is record
      shi1501_reserved            : Win32.DWORD;
      shi1501_security_descriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
   end record;

   type SESSION_INFO_0 is record
      sesi0_cname : Win32.Winnt.LPTSTR;
   end record;

   type SESSION_INFO_1 is record
      sesi1_cname      : Win32.Winnt.LPTSTR;
      sesi1_username   : Win32.Winnt.LPTSTR;
      sesi1_num_opens  : Win32.DWORD;
      sesi1_time       : Win32.DWORD;
      sesi1_idle_time  : Win32.DWORD;
      sesi1_user_flags : Win32.DWORD;
   end record;

   type SESSION_INFO_2 is record
      sesi2_cname       : Win32.Winnt.LPTSTR;
      sesi2_username    : Win32.Winnt.LPTSTR;
      sesi2_num_opens   : Win32.DWORD;
      sesi2_time        : Win32.DWORD;
      sesi2_idle_time   : Win32.DWORD;
      sesi2_user_flags  : Win32.DWORD;
      sesi2_cltype_name : Win32.Winnt.LPTSTR;
   end record;

   type SESSION_INFO_10 is record
      sesi10_cname     : Win32.Winnt.LPTSTR;
      sesi10_username  : Win32.Winnt.LPTSTR;
      sesi10_time      : Win32.DWORD;
      sesi10_idle_time : Win32.DWORD;
   end record;

   type SESSION_INFO_502 is record
      sesi502_cname       : Win32.Winnt.LPTSTR;
      sesi502_username    : Win32.Winnt.LPTSTR;
      sesi502_num_opens   : Win32.DWORD;
      sesi502_time        : Win32.DWORD;
      sesi502_idle_time   : Win32.DWORD;
      sesi502_user_flags  : Win32.DWORD;
      sesi502_cltype_name : Win32.Winnt.LPTSTR;
      sesi502_transport   : Win32.Winnt.LPTSTR;
   end record;

   type CONNECTION_INFO_0 is record
      coni0_id : Win32.DWORD;
   end record;

   type CONNECTION_INFO_1 is record
      coni1_id        : Win32.DWORD;
      coni1_type      : Win32.DWORD;
      coni1_num_opens : Win32.DWORD;
      coni1_num_users : Win32.DWORD;
      coni1_time      : Win32.DWORD;
      coni1_username  : Win32.Winnt.LPTSTR;
      coni1_netname   : Win32.Winnt.LPTSTR;
   end record;

   type FILE_INFO_2 is record
      fi2_id : Win32.DWORD;
   end record;

   type FILE_INFO_3 is record
      fi3_id          : Win32.DWORD;
      fi3_permissions : Win32.DWORD;
      fi3_num_locks   : Win32.DWORD;
      fi3_pathname    : Win32.Winnt.LPTSTR;
      fi3_username    : Win32.Winnt.LPTSTR;
   end record;

   function NetShareAdd
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetShareEnum
     (servername    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetShareEnumSticky
     (servername    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetShareGetInfo
     (servername : Win32.Winnt.LPTSTR;
      netname    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetShareSetInfo
     (servername : Win32.Winnt.LPTSTR;
      netname    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetShareDel
     (servername : Win32.Winnt.LPTSTR;
      netname    : Win32.Winnt.LPTSTR;
      reserved   : Win32.DWORD)
      return Win32.DWORD;

   function NetShareDelSticky
     (servername : Win32.Winnt.LPTSTR;
      netname    : Win32.Winnt.LPTSTR;
      reserved   : Win32.DWORD)
      return Win32.DWORD;

   function NetShareCheck
     (servername : Win32.Winnt.LPTSTR;
      device     : Win32.Winnt.LPTSTR;
      c_type     : Win32.LPDWORD)
      return Win32.DWORD;

   function NetSessionEnum
     (servername    : Win32.Winnt.LPTSTR;
      UncClientName : Win32.Winnt.LPTSTR;
      username      : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetSessionDel
     (servername    : Win32.Winnt.LPTSTR;
      UncClientName : Win32.Winnt.LPTSTR;
      username      : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetSessionGetInfo
     (servername    : Win32.Winnt.LPTSTR;
      UncClientName : Win32.Winnt.LPTSTR;
      username      : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE)
      return Win32.DWORD;

   function NetConnectionEnum
     (servername    : Win32.Winnt.LPTSTR;
      qualifier     : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetFileClose
     (servername : Win32.Winnt.LPTSTR;
      fileid     : Win32.DWORD)
      return Win32.DWORD;

   function NetFileEnum
     (servername    : Win32.Winnt.LPTSTR;
      basepath      : Win32.Winnt.LPTSTR;
      username      : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetFileGetInfo
     (servername : Win32.Winnt.LPTSTR;
      fileid     : Win32.DWORD;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, SHARE_INFO_0);
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1);
   pragma Convention (C, SHARE_INFO_2);
   pragma Convention (C, SHARE_INFO_502);
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1004);
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1006);
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1501);
   pragma Convention (C_Pass_By_Copy, SESSION_INFO_0);
   pragma Convention (C, SESSION_INFO_1);
   pragma Convention (C, SESSION_INFO_2);
   pragma Convention (C_Pass_By_Copy, SESSION_INFO_10);
   pragma Convention (C, SESSION_INFO_502);
   pragma Convention (C_Pass_By_Copy, CONNECTION_INFO_0);
   pragma Convention (C, CONNECTION_INFO_1);
   pragma Convention (C_Pass_By_Copy, FILE_INFO_2);
   pragma Convention (C, FILE_INFO_3);

   pragma Import (Stdcall, NetShareAdd, "NetShareAdd");
   pragma Import (Stdcall, NetShareEnum, "NetShareEnum");
   pragma Import (Stdcall, NetShareEnumSticky, "NetShareEnumSticky");
   pragma Import (Stdcall, NetShareGetInfo, "NetShareGetInfo");
   pragma Import (Stdcall, NetShareSetInfo, "NetShareSetInfo");
   pragma Import (Stdcall, NetShareDel, "NetShareDel");
   pragma Import (Stdcall, NetShareDelSticky, "NetShareDelSticky");
   pragma Import (Stdcall, NetShareCheck, "NetShareCheck");
   pragma Import (Stdcall, NetSessionEnum, "NetSessionEnum");
   pragma Import (Stdcall, NetSessionDel, "NetSessionDel");
   pragma Import (Stdcall, NetSessionGetInfo, "NetSessionGetInfo");
   pragma Import (Stdcall, NetConnectionEnum, "NetConnectionEnum");
   pragma Import (Stdcall, NetFileClose, "NetFileClose");
   pragma Import (Stdcall, NetFileEnum, "NetFileEnum");
   pragma Import (Stdcall, NetFileGetInfo, "NetFileGetInfo");

end Win32.Lmshare;
