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

package Win32.Lmuse is

   USE_LOCAL_PARMNUM : constant := 1;               --  lmuse.h:135
   USE_REMOTE_PARMNUM : constant := 2;               --  lmuse.h:136
   USE_PASSWORD_PARMNUM : constant := 3;               --  lmuse.h:137
   USE_ASGTYPE_PARMNUM : constant := 4;               --  lmuse.h:138
   USE_USERNAME_PARMNUM : constant := 5;               --  lmuse.h:139
   USE_DOMAINNAME_PARMNUM : constant := 6;               --  lmuse.h:140
   USE_OK : constant := 0;               --  lmuse.h:147
   USE_PAUSED : constant := 1;               --  lmuse.h:148
   USE_SESSLOST : constant := 2;               --  lmuse.h:149
   USE_DISCONN : constant := 2;               --  lmuse.h:150
   USE_NETERR : constant := 3;               --  lmuse.h:151
   USE_CONN : constant := 4;               --  lmuse.h:152
   USE_RECONN : constant := 5;               --  lmuse.h:153
   USE_DISKDEV : constant := 0;               --  lmuse.h:161
   USE_SPOOLDEV : constant := 1;               --  lmuse.h:162
   USE_CHARDEV : constant := 2;               --  lmuse.h:163
   USE_IPC : constant := 3;               --  lmuse.h:164

   type USE_INFO_0;                                        --  lmuse.h:97
   type USE_INFO_1;                                        --  lmuse.h:102
   type USE_INFO_2;                                        --  lmuse.h:112

   type PUSE_INFO_0 is access all USE_INFO_0;              --  lmuse.h:100
   subtype LPUSE_INFO_0 is PUSE_INFO_0;                    --  lmuse.h:100
   type PUSE_INFO_1 is access all USE_INFO_1;              --  lmuse.h:110
   subtype LPUSE_INFO_1 is PUSE_INFO_1;                    --  lmuse.h:110
   type PUSE_INFO_2 is access all USE_INFO_2;              --  lmuse.h:122
   subtype LPUSE_INFO_2 is PUSE_INFO_2;                    --  lmuse.h:122

   type USE_INFO_0 is                                      --  lmuse.h:97
      record
         ui0_local : Win32.Winnt.LPTSTR;                 --  lmuse.h:98
         ui0_remote : Win32.Winnt.LPTSTR;                 --  lmuse.h:99
      end record;

   type USE_INFO_1 is                                      --  lmuse.h:102
      record
         ui1_local : Win32.Winnt.LPTSTR;               --  lmuse.h:103
         ui1_remote : Win32.Winnt.LPTSTR;               --  lmuse.h:104
         ui1_password : Win32.Winnt.LPTSTR;               --  lmuse.h:105
         ui1_status : Win32.DWORD;                      --  lmuse.h:106
         ui1_asg_type : Win32.DWORD;                      --  lmuse.h:107
         ui1_refcount : Win32.DWORD;                      --  lmuse.h:108
         ui1_usecount : Win32.DWORD;                      --  lmuse.h:109
      end record;

   type USE_INFO_2 is                                      --  lmuse.h:112
      record
         ui2_local : Win32.Winnt.LPTSTR;             --  lmuse.h:113
         ui2_remote : Win32.Winnt.LPTSTR;             --  lmuse.h:114
         ui2_password : Win32.Winnt.LPTSTR;             --  lmuse.h:115
         ui2_status : Win32.DWORD;                    --  lmuse.h:116
         ui2_asg_type : Win32.DWORD;                    --  lmuse.h:117
         ui2_refcount : Win32.DWORD;                    --  lmuse.h:118
         ui2_usecount : Win32.DWORD;                    --  lmuse.h:119
         ui2_username : Win32.Winnt.LPTSTR;             --  lmuse.h:120
         ui2_domainname : Win32.Winnt.LPTSTR;             --  lmuse.h:121
      end record;

   function NetUseAdd
     (UncServerName : Win32.Winnt.LPTSTR;
      Level : Win32.DWORD;
      Buf : Win32.LPBYTE;
      ParmError : access Win32.DWORD)
     return Win32.DWORD;                          --  lmuse.h:60

   function NetUseDel
     (UncServerName : Win32.Winnt.LPTSTR;
      UseName : Win32.Winnt.LPTSTR;
      ForceCond : Win32.DWORD)
     return Win32.DWORD;                          --  lmuse.h:68

   function NetUseEnum
     (UncServerName : Win32.Winnt.LPTSTR;
      Level : Win32.DWORD;
      BufPtr : access Win32.PBYTE;
      PreferedMaximumSize : Win32.DWORD;
      EntriesRead : access Win32.DWORD;
      TotalEntries : access Win32.DWORD;
      ResumeHandle : access Win32.DWORD)
     return Win32.DWORD;                          --  lmuse.h:75

   function NetUseGetInfo
     (UncServerName : Win32.Winnt.LPTSTR;
      UseName : Win32.Winnt.LPTSTR;
      Level : Win32.DWORD;
      BufPtr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmuse.h:86

private

   pragma Convention (C_Pass_By_Copy, USE_INFO_0);               --  lmuse.h:97
   pragma Convention (C, USE_INFO_1);                       --  lmuse.h:102
   pragma Convention (C, USE_INFO_2);                       --  lmuse.h:112

   pragma Import (Stdcall, NetUseAdd, "NetUseAdd");              --  lmuse.h:60
   pragma Import (Stdcall, NetUseDel, "NetUseDel");              --  lmuse.h:68
   pragma Import (Stdcall, NetUseEnum, "NetUseEnum");            --  lmuse.h:75
   pragma Import (Stdcall, NetUseGetInfo, "NetUseGetInfo");      --  lmuse.h:86

end Win32.Lmuse;


