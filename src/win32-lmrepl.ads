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

package Win32.Lmrepl is

   REPL_ROLE_EXPORT : constant := 1;       --  lmrepl.h:56
   REPL_ROLE_IMPORT : constant := 2;       --  lmrepl.h:57
   REPL_ROLE_BOTH : constant := 3;       --  lmrepl.h:58
   REPL_INTERVAL_INFOLEVEL : constant := 1000;    --  lmrepl.h:61
   REPL_PULSE_INFOLEVEL : constant := 1001;    --  lmrepl.h:62
   REPL_GUARDTIME_INFOLEVEL : constant := 1002;    --  lmrepl.h:63
   REPL_RANDOM_INFOLEVEL : constant := 1003;    --  lmrepl.h:64
   REPL_INTEGRITY_FILE : constant := 1;       --  lmrepl.h:117
   REPL_INTEGRITY_TREE : constant := 2;       --  lmrepl.h:118
   REPL_EXTENT_FILE : constant := 1;       --  lmrepl.h:121
   REPL_EXTENT_TREE : constant := 2;       --  lmrepl.h:122
   REPL_EXPORT_INTEGRITY_INFOLEVEL : constant := 1000;    --  lmrepl.h:125
   REPL_EXPORT_EXTENT_INFOLEVEL : constant := 1001;    --  lmrepl.h:126
   REPL_UNLOCK_NOFORCE : constant := 0;       --  lmrepl.h:212
   REPL_UNLOCK_FORCE : constant := 1;       --  lmrepl.h:213
   REPL_STATE_OK : constant := 0;       --  lmrepl.h:283
   REPL_STATE_NO_MASTER : constant := 1;       --  lmrepl.h:284
   REPL_STATE_NO_SYNC : constant := 2;       --  lmrepl.h:285
   REPL_STATE_NEVER_REPLICATED : constant := 3;       --  lmrepl.h:286

   type REPL_INFO_0;                                       --  lmrepl.h:67
   type REPL_INFO_1000;                                    --  lmrepl.h:80
   type REPL_INFO_1001;                                    --  lmrepl.h:84
   type REPL_INFO_1002;                                    --  lmrepl.h:88
   type REPL_INFO_1003;                                    --  lmrepl.h:92
   type REPL_EDIR_INFO_0;                                  --  lmrepl.h:129
   type REPL_EDIR_INFO_1;                                  --  lmrepl.h:133
   type REPL_EDIR_INFO_2;                                  --  lmrepl.h:139
   type REPL_EDIR_INFO_1000;                               --  lmrepl.h:147
   type REPL_EDIR_INFO_1001;                               --  lmrepl.h:151
   type REPL_IDIR_INFO_0;                                  --  lmrepl.h:221
   type REPL_IDIR_INFO_1;                                  --  lmrepl.h:225

   type PREPL_INFO_0 is access all REPL_INFO_0;            --  lmrepl.h:78
   type LPREPL_INFO_0 is access all REPL_INFO_0;           --  lmrepl.h:78
   type PREPL_INFO_1000 is access all REPL_INFO_1000;      --  lmrepl.h:82
   type LPREPL_INFO_1000 is access all REPL_INFO_1000;     --  lmrepl.h:82
   type PREPL_INFO_1001 is access all REPL_INFO_1001;      --  lmrepl.h:86
   type LPREPL_INFO_1001 is access all REPL_INFO_1001;     --  lmrepl.h:86
   type PREPL_INFO_1002 is access all REPL_INFO_1002;      --  lmrepl.h:90
   type LPREPL_INFO_1002 is access all REPL_INFO_1002;     --  lmrepl.h:90
   type PREPL_INFO_1003 is access all REPL_INFO_1003;      --  lmrepl.h:94
   type LPREPL_INFO_1003 is access all REPL_INFO_1003;     --  lmrepl.h:94
   type PREPL_EDIR_INFO_0 is access all REPL_EDIR_INFO_0;  --  lmrepl.h:131
   type LPREPL_EDIR_INFO_0 is access all REPL_EDIR_INFO_0; --  lmrepl.h:131
   type PREPL_EDIR_INFO_1 is access all REPL_EDIR_INFO_1;  --  lmrepl.h:137
   type LPREPL_EDIR_INFO_1 is access all REPL_EDIR_INFO_1; --  lmrepl.h:137
   type PREPL_EDIR_INFO_2 is access all REPL_EDIR_INFO_2;  --  lmrepl.h:145
   type LPREPL_EDIR_INFO_2 is access all REPL_EDIR_INFO_2; --  lmrepl.h:145
   type PREPL_EDIR_INFO_1000 is access all REPL_EDIR_INFO_1000;
   --  lmrepl.h:149
   type LPREPL_EDIR_INFO_1000 is access all REPL_EDIR_INFO_1000;
   --  lmrepl.h:149
   type PREPL_EDIR_INFO_1001 is access all REPL_EDIR_INFO_1001;
   --  lmrepl.h:153
   type LPREPL_EDIR_INFO_1001 is access all REPL_EDIR_INFO_1001;
   --  lmrepl.h:153
   type PREPL_IDIR_INFO_0 is access all REPL_IDIR_INFO_0;  --  lmrepl.h:223
   type LPREPL_IDIR_INFO_0 is access all REPL_IDIR_INFO_0; --  lmrepl.h:223
   type PREPL_IDIR_INFO_1 is access all REPL_IDIR_INFO_1;  --  lmrepl.h:232
   type LPREPL_IDIR_INFO_1 is access all REPL_IDIR_INFO_1; --  lmrepl.h:232

   type REPL_INFO_0 is                                     --  lmrepl.h:67
      record
         rp0_role : Win32.DWORD;                 --  lmrepl.h:68
         rp0_exportpath : Win32.Winnt.LPTSTR;          --  lmrepl.h:69
         rp0_exportlist : Win32.Winnt.LPTSTR;          --  lmrepl.h:70
         rp0_importpath : Win32.Winnt.LPTSTR;          --  lmrepl.h:71
         rp0_importlist : Win32.Winnt.LPTSTR;          --  lmrepl.h:72
         rp0_logonusername : Win32.Winnt.LPTSTR;          --  lmrepl.h:73
         rp0_interval : Win32.DWORD;                 --  lmrepl.h:74
         rp0_pulse : Win32.DWORD;                 --  lmrepl.h:75
         rp0_guardtime : Win32.DWORD;                 --  lmrepl.h:76
         rp0_random : Win32.DWORD;                 --  lmrepl.h:77
      end record;

   type REPL_INFO_1000 is                                  --  lmrepl.h:80
      record
         rp1000_interval : Win32.DWORD;                   --  lmrepl.h:81
      end record;

   type REPL_INFO_1001 is                                  --  lmrepl.h:84
      record
         rp1001_pulse : Win32.DWORD;                      --  lmrepl.h:85
      end record;

   type REPL_INFO_1002 is                                  --  lmrepl.h:88
      record
         rp1002_guardtime : Win32.DWORD;                  --  lmrepl.h:89
      end record;

   type REPL_INFO_1003 is                                  --  lmrepl.h:92
      record
         rp1003_random : Win32.DWORD;                     --  lmrepl.h:93
      end record;

   type REPL_EDIR_INFO_0 is                                --  lmrepl.h:129
      record
         rped0_dirname : Win32.Winnt.LPTSTR;              --  lmrepl.h:130
      end record;

   type REPL_EDIR_INFO_1 is                                --  lmrepl.h:133
      record
         rped1_dirname : Win32.Winnt.LPTSTR;            --  lmrepl.h:134
         rped1_integrity : Win32.DWORD;                   --  lmrepl.h:135
         rped1_extent : Win32.DWORD;                   --  lmrepl.h:136
      end record;

   type REPL_EDIR_INFO_2 is                                --  lmrepl.h:139
      record
         rped2_dirname : Win32.Winnt.LPTSTR;            --  lmrepl.h:140
         rped2_integrity : Win32.DWORD;                   --  lmrepl.h:141
         rped2_extent : Win32.DWORD;                   --  lmrepl.h:142
         rped2_lockcount : Win32.DWORD;                   --  lmrepl.h:143
         rped2_locktime : Win32.DWORD;                   --  lmrepl.h:144
      end record;

   type REPL_EDIR_INFO_1000 is                             --  lmrepl.h:147
      record
         rped1000_integrity : Win32.DWORD;                --  lmrepl.h:148
      end record;

   type REPL_EDIR_INFO_1001 is                             --  lmrepl.h:151
      record
         rped1001_extent : Win32.DWORD;                   --  lmrepl.h:152
      end record;

   type REPL_IDIR_INFO_0 is                                --  lmrepl.h:221
      record
         rpid0_dirname : Win32.Winnt.LPTSTR;              --  lmrepl.h:222
      end record;

   type REPL_IDIR_INFO_1 is                                --  lmrepl.h:225
      record
         rpid1_dirname : Win32.Winnt.LPTSTR;     --  lmrepl.h:226
         rpid1_state : Win32.DWORD;            --  lmrepl.h:227
         rpid1_mastername : Win32.Winnt.LPTSTR;     --  lmrepl.h:228
         rpid1_last_update_time : Win32.DWORD;            --  lmrepl.h:229
         rpid1_lockcount : Win32.DWORD;            --  lmrepl.h:230
         rpid1_locktime : Win32.DWORD;            --  lmrepl.h:231
      end record;

   function NetReplGetInfo
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmrepl.h:98

   function NetReplSetInfo
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmrepl.h:105

   function NetReplExportDirAdd
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmrepl.h:157

   function NetReplExportDirDel
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmrepl.h:165

   function NetReplExportDirEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmrepl.h:171

   function NetReplExportDirGetInfo
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmrepl.h:182

   function NetReplExportDirSetInfo
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmrepl.h:190

   function NetReplExportDirLock
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmrepl.h:199

   function NetReplExportDirUnlock
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR;
      unlockforce : Win32.DWORD)
     return Win32.DWORD;                          --  lmrepl.h:205

   function NetReplImportDirAdd
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmrepl.h:236

   function NetReplImportDirDel
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmrepl.h:244

   function NetReplImportDirEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmrepl.h:250

   function NetReplImportDirGetInfo
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmrepl.h:261

   function NetReplImportDirLock
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmrepl.h:269

   function NetReplImportDirUnlock
     (servername : Win32.Winnt.LPTSTR;
      dirname : Win32.Winnt.LPTSTR;
      unlockforce : Win32.DWORD)
     return Win32.DWORD;                          --  lmrepl.h:276

private

   pragma Convention (C, REPL_INFO_0);                   --  lmrepl.h:67
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1000);   --  lmrepl.h:80
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1001);   --  lmrepl.h:84
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1002);   --  lmrepl.h:88
   pragma Convention (C_Pass_By_Copy, REPL_INFO_1003);   --  lmrepl.h:92
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_0); --  lmrepl.h:129
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_1); --  lmrepl.h:133
   pragma Convention (C, REPL_EDIR_INFO_2);                 --  lmrepl.h:139
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_1000); --  lmrepl.h:147
   pragma Convention (C_Pass_By_Copy, REPL_EDIR_INFO_1001); --  lmrepl.h:151
   pragma Convention (C_Pass_By_Copy, REPL_IDIR_INFO_0);    --  lmrepl.h:221
   pragma Convention (C, REPL_IDIR_INFO_1);                 --  lmrepl.h:225

   pragma Import (Stdcall, NetReplGetInfo, "NetReplGetInfo");  --  lmrepl.h:98
   pragma Import (Stdcall, NetReplSetInfo, "NetReplSetInfo");  --  lmrepl.h:105
   pragma Import (Stdcall, NetReplExportDirAdd, "NetReplExportDirAdd");
   --  lmrepl.h:157
   pragma Import (Stdcall, NetReplExportDirDel, "NetReplExportDirDel");
   --  lmrepl.h:165
   pragma Import (Stdcall, NetReplExportDirEnum, "NetReplExportDirEnum");
   --  lmrepl.h:171
   pragma Import (Stdcall, NetReplExportDirGetInfo, "NetReplExportDirGetInfo");
   --  lmrepl.h:182
   pragma Import (Stdcall, NetReplExportDirSetInfo, "NetReplExportDirSetInfo");
   --  lmrepl.h:190
   pragma Import (Stdcall, NetReplExportDirLock, "NetReplExportDirLock");
   --  lmrepl.h:199
   pragma Import (Stdcall, NetReplExportDirUnlock, "NetReplExportDirUnlock");
   --  lmrepl.h:205
   pragma Import (Stdcall, NetReplImportDirAdd, "NetReplImportDirAdd");
   --  lmrepl.h:236
   pragma Import (Stdcall, NetReplImportDirDel, "NetReplImportDirDel");
   --  lmrepl.h:244
   pragma Import (Stdcall, NetReplImportDirEnum, "NetReplImportDirEnum");
   --  lmrepl.h:250
   pragma Import (Stdcall, NetReplImportDirGetInfo, "NetReplImportDirGetInfo");
   --  lmrepl.h:261
   pragma Import (Stdcall, NetReplImportDirLock, "NetReplImportDirLock");
   --  lmrepl.h:269
   pragma Import (Stdcall, NetReplImportDirUnlock, "NetReplImportDirUnlock");
   --  lmrepl.h:276

end Win32.Lmrepl;


