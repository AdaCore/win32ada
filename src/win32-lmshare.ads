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

package Win32.Lmshare is

   SHARE_NETNAME_PARMNUM      : constant := 1;            --  lmshare.h :190
   SHARE_TYPE_PARMNUM         : constant := 3;            --  lmshare.h :191
   SHARE_REMARK_PARMNUM       : constant := 4;            --  lmshare.h :192
   SHARE_PERMISSIONS_PARMNUM  : constant := 5;            --  lmshare.h :193
   SHARE_MAX_USES_PARMNUM     : constant := 6;            --  lmshare.h :194
   SHARE_CURRENT_USES_PARMNUM : constant := 7;            --  lmshare.h :195
   SHARE_PATH_PARMNUM         : constant := 8;            --  lmshare.h :196
   SHARE_PASSWD_PARMNUM       : constant := 9;            --  lmshare.h :197
   SHARE_FILE_SD_PARMNUM      : constant := 501;          --  lmshare.h :198
   SHARE_REMARK_INFOLEVEL     : constant := 1004;         --  lmshare.h :204
   SHARE_MAX_USES_INFOLEVEL   : constant := 1006;         --  lmshare.h :206
   SHARE_FILE_SD_INFOLEVEL    : constant := 1501;         --  lmshare.h :208
   SHI1_NUM_ELEMENTS          : constant := 4;            --  lmshare.h :211
   SHI2_NUM_ELEMENTS          : constant := 10;           --  lmshare.h :212
   STYPE_DISKTREE             : constant := 0;            --  lmshare.h :219
   STYPE_PRINTQ               : constant := 1;            --  lmshare.h :220
   STYPE_DEVICE               : constant := 2;            --  lmshare.h :221
   STYPE_IPC                  : constant := 3;            --  lmshare.h :222
   STYPE_DFS                  : constant := 100;          --  lmshare.h :223
   STYPE_SPECIAL              : constant := 16#80000000#; --  lmshare.h :225
   SHI_USES_UNLIMITED : constant DWORD := DWORD'Last;
   --  lmshare.h:227
   SESS_GUEST : constant := 16#1#;         --  lmshare.h:327
   SESS_NOENCRYPTION : constant := 16#2#;         --  lmshare.h:328
   SESI1_NUM_ELEMENTS : constant := 8;             --  lmshare.h:330
   SESI2_NUM_ELEMENTS : constant := 9;             --  lmshare.h:331
   PERM_FILE_READ : constant := 16#1#;         --  lmshare.h:445
   PERM_FILE_WRITE : constant := 16#2#;         --  lmshare.h:446
   PERM_FILE_CREATE : constant := 16#4#;         --  lmshare.h:447

   type SHARE_INFO_0;                                      --  lmshare.h:135
   type SHARE_INFO_1;                                      --  lmshare.h:139
   type SHARE_INFO_2;                                      --  lmshare.h:145
   type SHARE_INFO_502;                                    --  lmshare.h:156
   type SHARE_INFO_1004;                                   --  lmshare.h:169
   type SHARE_INFO_1006;                                   --  lmshare.h:173
   type SHARE_INFO_1501;                                   --  lmshare.h:177
   type SESSION_INFO_0;                                    --  lmshare.h:276
   type SESSION_INFO_1;                                    --  lmshare.h:280
   type SESSION_INFO_2;                                    --  lmshare.h:289
   type SESSION_INFO_10;                                   --  lmshare.h:299
   type SESSION_INFO_502;                                  --  lmshare.h:306
   type CONNECTION_INFO_0;                                 --  lmshare.h:363
   type CONNECTION_INFO_1;                                 --  lmshare.h:367
   type FILE_INFO_2;                                       --  lmshare.h:425
   type FILE_INFO_3;                                       --  lmshare.h:429

   type PSHARE_INFO_0 is access all SHARE_INFO_0;          --  lmshare.h:137
   subtype LPSHARE_INFO_0 is PSHARE_INFO_0;                --  lmshare.h:137
   type PSHARE_INFO_1 is access all SHARE_INFO_1;          --  lmshare.h:143
   subtype LPSHARE_INFO_1 is PSHARE_INFO_1;                --  lmshare.h:143
   type PSHARE_INFO_2 is access all SHARE_INFO_2;          --  lmshare.h:154
   subtype LPSHARE_INFO_2 is PSHARE_INFO_2;                --  lmshare.h:154
   type PSHARE_INFO_502 is access all SHARE_INFO_502;      --  lmshare.h:167
   subtype LPSHARE_INFO_502 is PSHARE_INFO_502;            --  lmshare.h:167
   type PSHARE_INFO_1004 is access all SHARE_INFO_1004;    --  lmshare.h:171
   subtype LPSHARE_INFO_1004 is PSHARE_INFO_1004;          --  lmshare.h:171
   type PSHARE_INFO_1006 is access all SHARE_INFO_1006;    --  lmshare.h:175
   subtype LPSHARE_INFO_1006 is PSHARE_INFO_1006;          --  lmshare.h:175
   type PSHARE_INFO_1501 is access all SHARE_INFO_1501;    --  lmshare.h:180
   subtype LPSHARE_INFO_1501 is PSHARE_INFO_1501;          --  lmshare.h:180
   type PSESSION_INFO_0 is access all SESSION_INFO_0;      --  lmshare.h:278
   subtype LPSESSION_INFO_0 is PSESSION_INFO_0;            --  lmshare.h:278
   type PSESSION_INFO_1 is access all SESSION_INFO_1;      --  lmshare.h:287
   subtype LPSESSION_INFO_1 is PSESSION_INFO_1;            --  lmshare.h:287
   type PSESSION_INFO_2 is access all SESSION_INFO_2;      --  lmshare.h:297
   subtype LPSESSION_INFO_2 is PSESSION_INFO_2;            --  lmshare.h:297
   type PSESSION_INFO_10 is access all SESSION_INFO_10;    --  lmshare.h:304
   subtype LPSESSION_INFO_10 is PSESSION_INFO_10;          --  lmshare.h:304
   type PSESSION_INFO_502 is access all SESSION_INFO_502;  --  lmshare.h:315
   subtype LPSESSION_INFO_502 is PSESSION_INFO_502;        --  lmshare.h:315
   type PCONNECTION_INFO_0 is access all CONNECTION_INFO_0; --  lmshare.h:365
   subtype LPCONNECTION_INFO_0 is PCONNECTION_INFO_0;      --  lmshare.h:365
   type PCONNECTION_INFO_1 is access all CONNECTION_INFO_1; --  lmshare.h:375
   subtype LPCONNECTION_INFO_1 is PCONNECTION_INFO_1;      --  lmshare.h:375
   type PFILE_INFO_2 is access all FILE_INFO_2;            --  lmshare.h:427
   subtype LPFILE_INFO_2 is PFILE_INFO_2;                  --  lmshare.h:427
   type PFILE_INFO_3 is access all FILE_INFO_3;            --  lmshare.h:435
   subtype LPFILE_INFO_3 is PFILE_INFO_3;                  --  lmshare.h:435

   type SHARE_INFO_0 is                                    --  lmshare.h:135
      record
         shi0_netname : Win32.Winnt.LPTSTR;               --  lmshare.h:136
      end record;

   type SHARE_INFO_1 is                                    --  lmshare.h:139
      record
         shi1_netname : Win32.Winnt.LPTSTR;               --  lmshare.h:140
         shi1_type : Win32.DWORD;                      --  lmshare.h:141
         shi1_remark : Win32.Winnt.LPTSTR;               --  lmshare.h:142
      end record;

   type SHARE_INFO_2 is                                    --  lmshare.h:145
      record
         shi2_netname : Win32.Winnt.LPTSTR;          --  lmshare.h:146
         shi2_type : Win32.DWORD;                 --  lmshare.h:147
         shi2_remark : Win32.Winnt.LPTSTR;          --  lmshare.h:148
         shi2_permissions : Win32.DWORD;                 --  lmshare.h:149
         shi2_max_uses : Win32.DWORD;                 --  lmshare.h:150
         shi2_current_uses : Win32.DWORD;                 --  lmshare.h:151
         shi2_path : Win32.Winnt.LPTSTR;          --  lmshare.h:152
         shi2_passwd : Win32.Winnt.LPTSTR;          --  lmshare.h:153
      end record;

   type SHARE_INFO_502 is                                  --  lmshare.h:156
      record
         shi502_netname : Win32.Winnt.LPTSTR; --  lmshare.h:157
         shi502_type : Win32.DWORD;        --  lmshare.h:158
         shi502_remark : Win32.Winnt.LPTSTR; --  lmshare.h:159
         shi502_permissions : Win32.DWORD;        --  lmshare.h:160
         shi502_max_uses : Win32.DWORD;        --  lmshare.h:161
         shi502_current_uses : Win32.DWORD;        --  lmshare.h:162
         shi502_path : Win32.Winnt.LPTSTR; --  lmshare.h:163
         shi502_passwd : Win32.Winnt.LPTSTR; --  lmshare.h:164
         shi502_reserved : Win32.DWORD;        --  lmshare.h:165
         shi502_security_descriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
         --  lmshare.h:166
      end record;

   type SHARE_INFO_1004 is                                 --  lmshare.h:169
      record
         shi1004_remark : Win32.Winnt.LPTSTR;             --  lmshare.h:170
      end record;

   type SHARE_INFO_1006 is                                 --  lmshare.h:173
      record
         shi1006_max_uses : Win32.DWORD;                  --  lmshare.h:174
      end record;

   type SHARE_INFO_1501 is                                 --  lmshare.h:177
      record
         shi1501_reserved : Win32.DWORD;       --  lmshare.h:178
         shi1501_security_descriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
         --  lmshare.h:179
      end record;

   type SESSION_INFO_0 is                                  --  lmshare.h:276
      record
         sesi0_cname : Win32.Winnt.LPTSTR;                --  lmshare.h:277
      end record;

   type SESSION_INFO_1 is                                  --  lmshare.h:280
      record
         sesi1_cname : Win32.Winnt.LPTSTR;           --  lmshare.h:281
         sesi1_username : Win32.Winnt.LPTSTR;           --  lmshare.h:282
         sesi1_num_opens : Win32.DWORD;                  --  lmshare.h:283
         sesi1_time : Win32.DWORD;                  --  lmshare.h:284
         sesi1_idle_time : Win32.DWORD;                  --  lmshare.h:285
         sesi1_user_flags : Win32.DWORD;                  --  lmshare.h:286
      end record;

   type SESSION_INFO_2 is                                  --  lmshare.h:289
      record
         sesi2_cname : Win32.Winnt.LPTSTR;          --  lmshare.h:290
         sesi2_username : Win32.Winnt.LPTSTR;          --  lmshare.h:291
         sesi2_num_opens : Win32.DWORD;                 --  lmshare.h:292
         sesi2_time : Win32.DWORD;                 --  lmshare.h:293
         sesi2_idle_time : Win32.DWORD;                 --  lmshare.h:294
         sesi2_user_flags : Win32.DWORD;                 --  lmshare.h:295
         sesi2_cltype_name : Win32.Winnt.LPTSTR;          --  lmshare.h:296
      end record;

   type SESSION_INFO_10 is                                 --  lmshare.h:299
      record
         sesi10_cname : Win32.Winnt.LPTSTR;           --  lmshare.h:300
         sesi10_username : Win32.Winnt.LPTSTR;           --  lmshare.h:301
         sesi10_time : Win32.DWORD;                  --  lmshare.h:302
         sesi10_idle_time : Win32.DWORD;                  --  lmshare.h:303
      end record;

   type SESSION_INFO_502 is                                --  lmshare.h:306
      record
         sesi502_cname : Win32.Winnt.LPTSTR;        --  lmshare.h:307
         sesi502_username : Win32.Winnt.LPTSTR;        --  lmshare.h:308
         sesi502_num_opens : Win32.DWORD;               --  lmshare.h:309
         sesi502_time : Win32.DWORD;               --  lmshare.h:310
         sesi502_idle_time : Win32.DWORD;               --  lmshare.h:311
         sesi502_user_flags : Win32.DWORD;               --  lmshare.h:312
         sesi502_cltype_name : Win32.Winnt.LPTSTR;        --  lmshare.h:313
         sesi502_transport : Win32.Winnt.LPTSTR;        --  lmshare.h:314
      end record;

   type CONNECTION_INFO_0 is                               --  lmshare.h:363
      record
         coni0_id : Win32.DWORD;                          --  lmshare.h:364
      end record;

   type CONNECTION_INFO_1 is                               --  lmshare.h:367
      record
         coni1_id : Win32.DWORD;                   --  lmshare.h:368
         coni1_type : Win32.DWORD;                   --  lmshare.h:369
         coni1_num_opens : Win32.DWORD;                   --  lmshare.h:370
         coni1_num_users : Win32.DWORD;                   --  lmshare.h:371
         coni1_time : Win32.DWORD;                   --  lmshare.h:372
         coni1_username : Win32.Winnt.LPTSTR;            --  lmshare.h:373
         coni1_netname : Win32.Winnt.LPTSTR;            --  lmshare.h:374
      end record;

   type FILE_INFO_2 is                                     --  lmshare.h:425
      record
         fi2_id : Win32.DWORD;                            --  lmshare.h:426
      end record;

   type FILE_INFO_3 is                                     --  lmshare.h:429
      record
         fi3_id : Win32.DWORD;                   --  lmshare.h:430
         fi3_permissions : Win32.DWORD;                   --  lmshare.h:431
         fi3_num_locks : Win32.DWORD;                   --  lmshare.h:432
         fi3_pathname : Win32.Winnt.LPTSTR;            --  lmshare.h:433
         fi3_username : Win32.Winnt.LPTSTR;            --  lmshare.h:434
      end record;

   function NetShareAdd
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:64

   function NetShareEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:72

   function NetShareEnumSticky
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:83

   function NetShareGetInfo
     (servername : Win32.Winnt.LPTSTR;
      netname : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmshare.h:94

   function NetShareSetInfo
     (servername : Win32.Winnt.LPTSTR;
      netname : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:102

   function NetShareDel
     (servername : Win32.Winnt.LPTSTR;
      netname : Win32.Winnt.LPTSTR;
      reserved : Win32.DWORD)
     return Win32.DWORD;                          --  lmshare.h:111

   function NetShareDelSticky
     (servername : Win32.Winnt.LPTSTR;
      netname : Win32.Winnt.LPTSTR;
      reserved : Win32.DWORD)
     return Win32.DWORD;                          --  lmshare.h:118

   function NetShareCheck
     (servername : Win32.Winnt.LPTSTR;
      device : Win32.Winnt.LPTSTR;
      c_type : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:125

   function NetSessionEnum
     (servername : Win32.Winnt.LPTSTR;
      UncClientName : Win32.Winnt.LPTSTR;
      username : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:243

   function NetSessionDel
     (servername : Win32.Winnt.LPTSTR;
      UncClientName : Win32.Winnt.LPTSTR;
      username : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmshare.h:256

   function NetSessionGetInfo
     (servername : Win32.Winnt.LPTSTR;
      UncClientName : Win32.Winnt.LPTSTR;
      username : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmshare.h:263

   function NetConnectionEnum
     (servername : Win32.Winnt.LPTSTR;
      qualifier : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:348

   function NetFileClose
     (servername : Win32.Winnt.LPTSTR;
      fileid : Win32.DWORD)
     return Win32.DWORD;                          --  lmshare.h:391

   function NetFileEnum
     (servername : Win32.Winnt.LPTSTR;
      basepath : Win32.Winnt.LPTSTR;
      username : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmshare.h:397

   function NetFileGetInfo
     (servername : Win32.Winnt.LPTSTR;
      fileid : Win32.DWORD;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmshare.h:410

private

   pragma Convention (C_Pass_By_Copy, SHARE_INFO_0);    --  lmshare.h:135
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1);    --  lmshare.h:139
   pragma Convention (C, SHARE_INFO_2);                 --  lmshare.h:145
   pragma Convention (C, SHARE_INFO_502);               --  lmshare.h:156
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1004); --  lmshare.h:169
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1006); --  lmshare.h:173
   pragma Convention (C_Pass_By_Copy, SHARE_INFO_1501); --  lmshare.h:177
   pragma Convention (C_Pass_By_Copy, SESSION_INFO_0);  --  lmshare.h:276
   pragma Convention (C, SESSION_INFO_1);               --  lmshare.h:280
   pragma Convention (C, SESSION_INFO_2);               --  lmshare.h:289
   pragma Convention (C_Pass_By_Copy, SESSION_INFO_10); --  lmshare.h:299
   pragma Convention (C, SESSION_INFO_502);             --  lmshare.h:306
   pragma Convention (C_Pass_By_Copy, CONNECTION_INFO_0);   --  lmshare.h:363
   pragma Convention (C, CONNECTION_INFO_1);                --  lmshare.h:367
   pragma Convention (C_Pass_By_Copy, FILE_INFO_2);         --  lmshare.h:425
   pragma Convention (C, FILE_INFO_3);                      --  lmshare.h:429

   pragma Import (Stdcall, NetShareAdd, "NetShareAdd");     --  lmshare.h:64
   pragma Import (Stdcall, NetShareEnum, "NetShareEnum");   --  lmshare.h:72
   pragma Import (Stdcall, NetShareEnumSticky, "NetShareEnumSticky");
   --  lmshare.h:83
   pragma Import (Stdcall, NetShareGetInfo, "NetShareGetInfo");
   --  lmshare.h:94
   pragma Import (Stdcall, NetShareSetInfo, "NetShareSetInfo");
   --  lmshare.h:102
   pragma Import (Stdcall, NetShareDel, "NetShareDel");       --  lmshare.h:111
   pragma Import (Stdcall, NetShareDelSticky, "NetShareDelSticky");
   --  lmshare.h:118
   pragma Import (Stdcall, NetShareCheck, "NetShareCheck");   --  lmshare.h:125
   pragma Import (Stdcall, NetSessionEnum, "NetSessionEnum"); --  lmshare.h:243
   pragma Import (Stdcall, NetSessionDel, "NetSessionDel");   --  lmshare.h:256
   pragma Import (Stdcall, NetSessionGetInfo, "NetSessionGetInfo");
   --  lmshare.h:263
   pragma Import (Stdcall, NetConnectionEnum, "NetConnectionEnum");
   --  lmshare.h:348
   pragma Import (Stdcall, NetFileClose, "NetFileClose");     --  lmshare.h:391
   pragma Import (Stdcall, NetFileEnum, "NetFileEnum");       --  lmshare.h:397
   pragma Import (Stdcall, NetFileGetInfo, "NetFileGetInfo"); --  lmshare.h:410

end Win32.Lmshare;


