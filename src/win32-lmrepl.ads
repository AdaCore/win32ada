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

package Win32.Lmrepl is

   REPL_ROLE_EXPORT                : constant := 1;
   REPL_ROLE_IMPORT                : constant := 2;
   REPL_ROLE_BOTH                  : constant := 3;
   REPL_INTERVAL_INFOLEVEL         : constant := 1000;
   REPL_PULSE_INFOLEVEL            : constant := 1001;
   REPL_GUARDTIME_INFOLEVEL        : constant := 1002;
   REPL_RANDOM_INFOLEVEL           : constant := 1003;
   REPL_INTEGRITY_FILE             : constant := 1;
   REPL_INTEGRITY_TREE             : constant := 2;
   REPL_EXTENT_FILE                : constant := 1;
   REPL_EXTENT_TREE                : constant := 2;
   REPL_EXPORT_INTEGRITY_INFOLEVEL : constant := 1000;
   REPL_EXPORT_EXTENT_INFOLEVEL    : constant := 1001;
   REPL_UNLOCK_NOFORCE             : constant := 0;
   REPL_UNLOCK_FORCE               : constant := 1;
   REPL_STATE_OK                   : constant := 0;
   REPL_STATE_NO_MASTER            : constant := 1;
   REPL_STATE_NO_SYNC              : constant := 2;
   REPL_STATE_NEVER_REPLICATED     : constant := 3;

   type REPL_INFO_0;
   type REPL_INFO_1000;
   type REPL_INFO_1001;
   type REPL_INFO_1002;
   type REPL_INFO_1003;
   type REPL_EDIR_INFO_0;
   type REPL_EDIR_INFO_1;
   type REPL_EDIR_INFO_2;
   type REPL_EDIR_INFO_1000;
   type REPL_EDIR_INFO_1001;
   type REPL_IDIR_INFO_0;
   type REPL_IDIR_INFO_1;

   type PREPL_INFO_0 is access all REPL_INFO_0;
   type LPREPL_INFO_0 is access all REPL_INFO_0;
   type PREPL_INFO_1000 is access all REPL_INFO_1000;
   type LPREPL_INFO_1000 is access all REPL_INFO_1000;
   type PREPL_INFO_1001 is access all REPL_INFO_1001;
   type LPREPL_INFO_1001 is access all REPL_INFO_1001;
   type PREPL_INFO_1002 is access all REPL_INFO_1002;
   type LPREPL_INFO_1002 is access all REPL_INFO_1002;
   type PREPL_INFO_1003 is access all REPL_INFO_1003;
   type LPREPL_INFO_1003 is access all REPL_INFO_1003;
   type PREPL_EDIR_INFO_0 is access all REPL_EDIR_INFO_0;
   type LPREPL_EDIR_INFO_0 is access all REPL_EDIR_INFO_0;
   type PREPL_EDIR_INFO_1 is access all REPL_EDIR_INFO_1;
   type LPREPL_EDIR_INFO_1 is access all REPL_EDIR_INFO_1;
   type PREPL_EDIR_INFO_2 is access all REPL_EDIR_INFO_2;
   type LPREPL_EDIR_INFO_2 is access all REPL_EDIR_INFO_2;
   type PREPL_EDIR_INFO_1000 is access all REPL_EDIR_INFO_1000;
   type LPREPL_EDIR_INFO_1000 is access all REPL_EDIR_INFO_1000;
   type PREPL_EDIR_INFO_1001 is access all REPL_EDIR_INFO_1001;
   type LPREPL_EDIR_INFO_1001 is access all REPL_EDIR_INFO_1001;
   type PREPL_IDIR_INFO_0 is access all REPL_IDIR_INFO_0;
   type LPREPL_IDIR_INFO_0 is access all REPL_IDIR_INFO_0;
   type PREPL_IDIR_INFO_1 is access all REPL_IDIR_INFO_1;
   type LPREPL_IDIR_INFO_1 is access all REPL_IDIR_INFO_1;

   type REPL_INFO_0 is record
      rp0_role          : Win32.DWORD;
      rp0_exportpath    : Win32.Winnt.LPTSTR;
      rp0_exportlist    : Win32.Winnt.LPTSTR;
      rp0_importpath    : Win32.Winnt.LPTSTR;
      rp0_importlist    : Win32.Winnt.LPTSTR;
      rp0_logonusername : Win32.Winnt.LPTSTR;
      rp0_interval      : Win32.DWORD;
      rp0_pulse         : Win32.DWORD;
      rp0_guardtime     : Win32.DWORD;
      rp0_random        : Win32.DWORD;
   end record;

   type REPL_INFO_1000 is record
      rp1000_interval : Win32.DWORD;
   end record;

   type REPL_INFO_1001 is record
      rp1001_pulse : Win32.DWORD;
   end record;

   type REPL_INFO_1002 is record
      rp1002_guardtime : Win32.DWORD;
   end record;

   type REPL_INFO_1003 is record
      rp1003_random : Win32.DWORD;
   end record;

   type REPL_EDIR_INFO_0 is record
      rped0_dirname : Win32.Winnt.LPTSTR;
   end record;

   type REPL_EDIR_INFO_1 is record
      rped1_dirname   : Win32.Winnt.LPTSTR;
      rped1_integrity : Win32.DWORD;
      rped1_extent    : Win32.DWORD;
   end record;

   type REPL_EDIR_INFO_2 is record
      rped2_dirname   : Win32.Winnt.LPTSTR;
      rped2_integrity : Win32.DWORD;
      rped2_extent    : Win32.DWORD;
      rped2_lockcount : Win32.DWORD;
      rped2_locktime  : Win32.DWORD;
   end record;

   type REPL_EDIR_INFO_1000 is record
      rped1000_integrity : Win32.DWORD;
   end record;

   type REPL_EDIR_INFO_1001 is record
      rped1001_extent : Win32.DWORD;
   end record;

   type REPL_IDIR_INFO_0 is record
      rpid0_dirname : Win32.Winnt.LPTSTR;
   end record;

   type REPL_IDIR_INFO_1 is record
      rpid1_dirname          : Win32.Winnt.LPTSTR;
      rpid1_state            : Win32.DWORD;
      rpid1_mastername       : Win32.Winnt.LPTSTR;
      rpid1_last_update_time : Win32.DWORD;
      rpid1_lockcount        : Win32.DWORD;
      rpid1_locktime         : Win32.DWORD;
   end record;

   function NetReplGetInfo
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetReplSetInfo
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetReplExportDirAdd
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetReplExportDirDel
     (servername : Win32.Winnt.LPTSTR;
      dirname    : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetReplExportDirEnum
     (servername   : Win32.Winnt.LPTSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.PBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetReplExportDirGetInfo
     (servername : Win32.Winnt.LPTSTR;
      dirname    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetReplExportDirSetInfo
     (servername : Win32.Winnt.LPTSTR;
      dirname    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetReplExportDirLock
     (servername : Win32.Winnt.LPTSTR;
      dirname    : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetReplExportDirUnlock
     (servername  : Win32.Winnt.LPTSTR;
      dirname     : Win32.Winnt.LPTSTR;
      unlockforce : Win32.DWORD)
      return Win32.DWORD;

   function NetReplImportDirAdd
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetReplImportDirDel
     (servername : Win32.Winnt.LPTSTR;
      dirname    : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetReplImportDirEnum
     (servername   : Win32.Winnt.LPTSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.PBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetReplImportDirGetInfo
     (servername : Win32.Winnt.LPTSTR;
      dirname    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetReplImportDirLock
     (servername : Win32.Winnt.LPTSTR;
      dirname    : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetReplImportDirUnlock
     (servername  : Win32.Winnt.LPTSTR;
      dirname     : Win32.Winnt.LPTSTR;
      unlockforce : Win32.DWORD)
      return Win32.DWORD;

private

   pragma Convention (C, REPL_INFO_0);
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1000);
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1001);
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1002);
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1003);
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_0);
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_1);
   pragma Convention (C, REPL_EDIR_INFO_2);
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_1000);
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_1001);
   pragma Convention (C_Pass_By_Copy, REPL_IDIR_INFO_0);
   pragma Convention (C, REPL_IDIR_INFO_1);

   pragma Import (Stdcall, NetReplGetInfo, "NetReplGetInfo");
   pragma Import (Stdcall, NetReplSetInfo, "NetReplSetInfo");
   pragma Import (Stdcall, NetReplExportDirAdd, "NetReplExportDirAdd");
   pragma Import (Stdcall, NetReplExportDirDel, "NetReplExportDirDel");
   pragma Import (Stdcall, NetReplExportDirEnum, "NetReplExportDirEnum");
   pragma Import
     (Stdcall,
      NetReplExportDirGetInfo,
      "NetReplExportDirGetInfo");
   pragma Import
     (Stdcall,
      NetReplExportDirSetInfo,
      "NetReplExportDirSetInfo");
   pragma Import (Stdcall, NetReplExportDirLock, "NetReplExportDirLock");
   pragma Import (Stdcall, NetReplExportDirUnlock, "NetReplExportDirUnlock");
   pragma Import (Stdcall, NetReplImportDirAdd, "NetReplImportDirAdd");
   pragma Import (Stdcall, NetReplImportDirDel, "NetReplImportDirDel");
   pragma Import (Stdcall, NetReplImportDirEnum, "NetReplImportDirEnum");
   pragma Import
     (Stdcall,
      NetReplImportDirGetInfo,
      "NetReplImportDirGetInfo");
   pragma Import (Stdcall, NetReplImportDirLock, "NetReplImportDirLock");
   pragma Import (Stdcall, NetReplImportDirUnlock, "NetReplImportDirUnlock");

end Win32.Lmrepl;
