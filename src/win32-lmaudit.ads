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

with Win32.Lmerrlog;
with Win32.Winnt;

package Win32.Lmaudit is

   ACTION_LOCKOUT : constant := 8#0#;            --  lmaudit.h:239
   ACTION_ADMINUNLOCK : constant := 8#1#;            --  lmaudit.h:240
   AE_SRVSTATUS : constant := 0;               --  lmaudit.h:275
   AE_SESSLOGON : constant := 1;               --  lmaudit.h:276
   AE_SESSLOGOFF : constant := 2;               --  lmaudit.h:277
   AE_SESSPWERR : constant := 3;               --  lmaudit.h:278
   AE_CONNSTART : constant := 4;               --  lmaudit.h:279
   AE_CONNSTOP : constant := 5;               --  lmaudit.h:280
   AE_CONNREJ : constant := 6;               --  lmaudit.h:281
   AE_RESACCESS : constant := 7;               --  lmaudit.h:282
   AE_RESACCESSREJ : constant := 8;               --  lmaudit.h:283
   AE_CLOSEFILE : constant := 9;               --  lmaudit.h:284
   AE_SERVICESTAT : constant := 11;              --  lmaudit.h:285
   AE_ACLMOD : constant := 12;              --  lmaudit.h:286
   AE_UASMOD : constant := 13;              --  lmaudit.h:287
   AE_NETLOGON : constant := 14;              --  lmaudit.h:288
   AE_NETLOGOFF : constant := 15;              --  lmaudit.h:289
   AE_NETLOGDENIED : constant := 16;              --  lmaudit.h:290
   AE_ACCLIMITEXCD : constant := 17;              --  lmaudit.h:291
   AE_RESACCESS2 : constant := 18;              --  lmaudit.h:292
   AE_ACLMODFAIL : constant := 19;              --  lmaudit.h:293
   AE_LOCKOUT : constant := 20;              --  lmaudit.h:294
   AE_GENERIC_TYPE : constant := 21;              --  lmaudit.h:295
   AE_SRVSTART : constant := 0;               --  lmaudit.h:300
   AE_SRVPAUSED : constant := 1;               --  lmaudit.h:301
   AE_SRVCONT : constant := 2;               --  lmaudit.h:302
   AE_SRVSTOP : constant := 3;               --  lmaudit.h:303
   AE_GUEST : constant := 0;               --  lmaudit.h:309
   AE_USER : constant := 1;               --  lmaudit.h:310
   AE_ADMIN : constant := 2;               --  lmaudit.h:311
   AE_NORMAL : constant := 0;               --  lmaudit.h:317
   AE_USERLIMIT : constant := 0;               --  lmaudit.h:318
   AE_GENERAL : constant := 0;               --  lmaudit.h:319
   AE_ERROR : constant := 1;               --  lmaudit.h:320
   AE_SESSDIS : constant := 1;               --  lmaudit.h:321
   AE_BADPW : constant := 1;               --  lmaudit.h:322
   AE_AUTODIS : constant := 2;               --  lmaudit.h:323
   AE_UNSHARE : constant := 2;               --  lmaudit.h:324
   AE_ADMINPRIVREQD : constant := 2;               --  lmaudit.h:325
   AE_ADMINDIS : constant := 3;               --  lmaudit.h:326
   AE_NOACCESSPERM : constant := 3;               --  lmaudit.h:327
   AE_ACCRESTRICT : constant := 4;               --  lmaudit.h:328
   AE_NORMAL_CLOSE : constant := 0;               --  lmaudit.h:330
   AE_SES_CLOSE : constant := 1;               --  lmaudit.h:331
   AE_ADMIN_CLOSE : constant := 2;               --  lmaudit.h:332
   AE_LIM_UNKNOWN : constant := 0;               --  lmaudit.h:338
   AE_LIM_LOGONHOURS : constant := 1;               --  lmaudit.h:339
   AE_LIM_EXPIRED : constant := 2;               --  lmaudit.h:340
   AE_LIM_INVAL_WKSTA : constant := 3;               --  lmaudit.h:341
   AE_LIM_DISABLED : constant := 4;               --  lmaudit.h:342
   AE_LIM_DELETED : constant := 5;               --  lmaudit.h:343
   AE_MOD : constant := 0;               --  lmaudit.h:349
   AE_DELETE : constant := 1;               --  lmaudit.h:350
   AE_ADD : constant := 2;               --  lmaudit.h:351
   AE_UAS_USER : constant := 0;               --  lmaudit.h:357
   AE_UAS_GROUP : constant := 1;               --  lmaudit.h:358
   AE_UAS_MODALS : constant := 2;               --  lmaudit.h:359
   SVAUD_SERVICE : constant := 16#1#;           --  lmaudit.h:368
   SVAUD_GOODSESSLOGON : constant := 16#6#;           --  lmaudit.h:369
   SVAUD_BADSESSLOGON : constant := 16#18#;          --  lmaudit.h:370
   SVAUD_SESSLOGON : constant := 16#1e#;          --  lmaudit.h:371
   SVAUD_GOODNETLOGON : constant := 16#60#;          --  lmaudit.h:372
   SVAUD_BADNETLOGON : constant := 16#180#;         --  lmaudit.h:373
   SVAUD_NETLOGON : constant := 16#1e0#;         --  lmaudit.h:374
   SVAUD_LOGON : constant := 16#1fe#;         --  lmaudit.h:375
   SVAUD_GOODUSE : constant := 16#600#;         --  lmaudit.h:376
   SVAUD_BADUSE : constant := 16#1800#;        --  lmaudit.h:377
   SVAUD_USE : constant := 16#1e00#;        --  lmaudit.h:378
   SVAUD_USERLIST : constant := 16#2000#;        --  lmaudit.h:379
   SVAUD_PERMISSIONS : constant := 16#4000#;        --  lmaudit.h:380
   SVAUD_RESOURCE : constant := 16#8000#;        --  lmaudit.h:381
   SVAUD_LOGONLIM : constant := 16#10000#;       --  lmaudit.h:382
   AA_AUDIT_ALL : constant := 16#1#;           --  lmaudit.h:388
   AA_A_OWNER : constant := 16#4#;           --  lmaudit.h:389
   AA_CLOSE : constant := 16#8#;           --  lmaudit.h:390
   AA_S_OPEN : constant := 16#10#;          --  lmaudit.h:391
   AA_S_WRITE : constant := 16#20#;          --  lmaudit.h:392
   AA_S_CREATE : constant := 16#20#;          --  lmaudit.h:393
   AA_S_DELETE : constant := 16#40#;          --  lmaudit.h:394
   AA_S_ACL : constant := 16#80#;          --  lmaudit.h:395
   AA_S_ALL : constant := 16#f0#;          --  lmaudit.h:396
   AA_F_OPEN : constant := 16#100#;         --  lmaudit.h:397
   AA_F_WRITE : constant := 16#200#;         --  lmaudit.h:398
   AA_F_CREATE : constant := 16#200#;         --  lmaudit.h:399
   AA_F_DELETE : constant := 16#400#;         --  lmaudit.h:400
   AA_F_ACL : constant := 16#800#;         --  lmaudit.h:401
   AA_F_ALL : constant := 16#f00#;         --  lmaudit.h:402
   AA_A_OPEN : constant := 16#1000#;        --  lmaudit.h:405
   AA_A_WRITE : constant := 16#2000#;        --  lmaudit.h:406
   AA_A_CREATE : constant := 16#2000#;        --  lmaudit.h:407
   AA_A_DELETE : constant := 16#4000#;        --  lmaudit.h:408
   AA_A_ACL : constant := 16#8000#;        --  lmaudit.h:409
   AA_A_ALL : constant := 16#f00#;         --  lmaudit.h:410

   type AUDIT_ENTRY;                                       --  lmaudit.h:108
   type AE_SRVSTATUS_t;                                    --  lmaudit.h:122
   type AE_SESSLOGON_t;                                    --  lmaudit.h:126
   type AE_SESSLOGOFF_t;                                   --  lmaudit.h:132
   type AE_SESSPWERR_t;                                    --  lmaudit.h:138
   type AE_CONNSTART_t;                                    --  lmaudit.h:143
   type AE_CONNSTOP_t;                                     --  lmaudit.h:150
   type AE_CONNREJ_t;                                      --  lmaudit.h:158
   type AE_RESACCESS_t;                                    --  lmaudit.h:165
   type AE_RESACCESSREJ_t;                                 --  lmaudit.h:175
   type AE_CLOSEFILE_t;                                    --  lmaudit.h:182
   type AE_SERVICESTAT_t;                                  --  lmaudit.h:191
   type AE_ACLMOD_t;                                       --  lmaudit.h:201
   type AE_UASMOD_t;                                       --  lmaudit.h:209
   type AE_NETLOGON_t;                                     --  lmaudit.h:218
   type AE_NETLOGOFF_t;                                    --  lmaudit.h:225
   type AE_ACCLIM;                                         --  lmaudit.h:232
   type AE_LOCKOUT_t;                                      --  lmaudit.h:242
   type AE_GENERIC;                                        --  lmaudit.h:252

   type PAUDIT_ENTRY is access all AUDIT_ENTRY;            --  lmaudit.h:116
   subtype LPAUDIT_ENTRY is PAUDIT_ENTRY;                  --  lmaudit.h:116

   type PAE_SRVSTATUS is access all AE_SRVSTATUS_t;        --  lmaudit.h:124
   subtype LPAE_SRVSTATUS is PAE_SRVSTATUS;                --  lmaudit.h:124

   type PAE_SESSLOGON is access all AE_SESSLOGON_t;        --  lmaudit.h:130
   subtype LPAE_SESSLOGON is PAE_SESSLOGON;                --  lmaudit.h:130

   type PAE_SESSLOGOFF is access all AE_SESSLOGOFF_t;      --  lmaudit.h:136
   subtype LPAE_SESSLOGOFF is PAE_SESSLOGOFF;              --  lmaudit.h:136

   type PAE_SESSPWERR is access all AE_SESSPWERR_t;        --  lmaudit.h:141
   subtype LPAE_SESSPWERR is PAE_SESSPWERR;                --  lmaudit.h:141

   type PAE_CONNSTART is access all AE_CONNSTART_t;        --  lmaudit.h:148
   subtype LPAE_CONNSTART is PAE_CONNSTART;                --  lmaudit.h:148

   type PAE_CONNSTOP is access all AE_CONNSTOP_t;          --  lmaudit.h:156
   subtype LPAE_CONNSTOP is PAE_CONNSTOP;                  --  lmaudit.h:156

   type PAE_CONNREJ is access all AE_CONNREJ_t;            --  lmaudit.h:163
   subtype LPAE_CONNREJ is PAE_CONNREJ;                    --  lmaudit.h:163

   type PAE_RESACCESS is access all AE_RESACCESS_t;        --  lmaudit.h:173
   subtype LPAE_RESACCESS is PAE_RESACCESS;                --  lmaudit.h:173

   type PAE_RESACCESSREJ is access all AE_RESACCESSREJ_t;  --  lmaudit.h:180
   subtype LPAE_RESACCESSREJ is PAE_RESACCESSREJ;          --  lmaudit.h:180

   type PAE_CLOSEFILE is access all AE_CLOSEFILE_t;        --  lmaudit.h:189
   subtype LPAE_CLOSEFILE is PAE_CLOSEFILE;                --  lmaudit.h:189

   type PAE_SERVICESTAT is access all AE_SERVICESTAT_t;    --  lmaudit.h:199
   subtype LPAE_SERVICESTAT is PAE_SERVICESTAT;            --  lmaudit.h:199

   type PAE_ACLMOD is access all AE_ACLMOD_t;              --  lmaudit.h:207
   subtype LPAE_ACLMOD is PAE_ACLMOD;                      --  lmaudit.h:207

   type PAE_UASMOD is access all AE_UASMOD_t;              --  lmaudit.h:216
   subtype LPAE_UASMOD is PAE_UASMOD;                      --  lmaudit.h:216

   type PAE_NETLOGON is access all AE_NETLOGON_t;          --  lmaudit.h:223
   subtype LPAE_NETLOGON is PAE_NETLOGON;                  --  lmaudit.h:223

   type PAE_NETLOGOFF is access all AE_NETLOGOFF_t;        --  lmaudit.h:230
   subtype LPAE_NETLOGOFF is PAE_NETLOGOFF;                --  lmaudit.h:230

   type PAE_ACCLIM is access all AE_ACCLIM;                --  lmaudit.h:237
   subtype LPAE_ACCLIM is PAE_ACCLIM;                      --  lmaudit.h:237

   type PAE_LOCKOUT is access all AE_LOCKOUT_t;            --  lmaudit.h:250
   subtype LPAE_LOCKOUT is PAE_LOCKOUT;                    --  lmaudit.h:250

   type PAE_GENERIC is access all AE_GENERIC;              --  lmaudit.h:265
   subtype LPAE_GENERIC is PAE_GENERIC;                    --  lmaudit.h:265

   type AUDIT_ENTRY is                                     --  lmaudit.h:108
      record
         ae_len : Win32.DWORD;                    --  lmaudit.h:109
         ae_reserved : Win32.DWORD;                    --  lmaudit.h:110
         ae_time : Win32.DWORD;                    --  lmaudit.h:111
         ae_type : Win32.DWORD;                    --  lmaudit.h:112
         ae_data_offset : Win32.DWORD;                    --  lmaudit.h:113
         ae_data_size : Win32.DWORD;                    --  lmaudit.h:115
      end record;

   type AE_SRVSTATUS_t is                                  --  lmaudit.h:122
      record
         ae_sv_status : Win32.DWORD;                      --  lmaudit.h:123
      end record;

   type AE_SESSLOGON_t is                                  --  lmaudit.h:126
      record
         ae_so_compname : Win32.DWORD;                   --  lmaudit.h:127
         ae_so_username : Win32.DWORD;                   --  lmaudit.h:128
         ae_so_privilege : Win32.DWORD;                   --  lmaudit.h:129
      end record;

   type AE_SESSLOGOFF_t is                                 --  lmaudit.h:132
      record
         ae_sf_compname : Win32.DWORD;                    --  lmaudit.h:133
         ae_sf_username : Win32.DWORD;                    --  lmaudit.h:134
         ae_sf_reason : Win32.DWORD;                    --  lmaudit.h:135
      end record;

   type AE_SESSPWERR_t is                                  --  lmaudit.h:138
      record
         ae_sp_compname : Win32.DWORD;                    --  lmaudit.h:139
         ae_sp_username : Win32.DWORD;                    --  lmaudit.h:140
      end record;

   type AE_CONNSTART_t is                                  --  lmaudit.h:143
      record
         ae_ct_compname : Win32.DWORD;                    --  lmaudit.h:144
         ae_ct_username : Win32.DWORD;                    --  lmaudit.h:145
         ae_ct_netname : Win32.DWORD;                    --  lmaudit.h:146
         ae_ct_connid : Win32.DWORD;                    --  lmaudit.h:147
      end record;

   type AE_CONNSTOP_t is                                   --  lmaudit.h:150
      record
         ae_cp_compname : Win32.DWORD;                    --  lmaudit.h:151
         ae_cp_username : Win32.DWORD;                    --  lmaudit.h:152
         ae_cp_netname : Win32.DWORD;                    --  lmaudit.h:153
         ae_cp_connid : Win32.DWORD;                    --  lmaudit.h:154
         ae_cp_reason : Win32.DWORD;                    --  lmaudit.h:155
      end record;

   type AE_CONNREJ_t is                                    --  lmaudit.h:158
      record
         ae_cr_compname : Win32.DWORD;                    --  lmaudit.h:159
         ae_cr_username : Win32.DWORD;                    --  lmaudit.h:160
         ae_cr_netname : Win32.DWORD;                    --  lmaudit.h:161
         ae_cr_reason : Win32.DWORD;                    --  lmaudit.h:162
      end record;

   type AE_RESACCESS_t is                                  --  lmaudit.h:165
      record
         ae_ra_compname : Win32.DWORD;                  --  lmaudit.h:166
         ae_ra_username : Win32.DWORD;                  --  lmaudit.h:167
         ae_ra_resname : Win32.DWORD;                  --  lmaudit.h:168
         ae_ra_operation : Win32.DWORD;                  --  lmaudit.h:169
         ae_ra_returncode : Win32.DWORD;                  --  lmaudit.h:170
         ae_ra_restype : Win32.DWORD;                  --  lmaudit.h:171
         ae_ra_fileid : Win32.DWORD;                  --  lmaudit.h:172
      end record;

   type AE_RESACCESSREJ_t is                               --  lmaudit.h:175
      record
         ae_rr_compname : Win32.DWORD;                   --  lmaudit.h:176
         ae_rr_username : Win32.DWORD;                   --  lmaudit.h:177
         ae_rr_resname : Win32.DWORD;                   --  lmaudit.h:178
         ae_rr_operation : Win32.DWORD;                   --  lmaudit.h:179
      end record;

   type AE_CLOSEFILE_t is                                  --  lmaudit.h:182
      record
         ae_cf_compname : Win32.DWORD;                    --  lmaudit.h:183
         ae_cf_username : Win32.DWORD;                    --  lmaudit.h:184
         ae_cf_resname : Win32.DWORD;                    --  lmaudit.h:185
         ae_cf_fileid : Win32.DWORD;                    --  lmaudit.h:186
         ae_cf_duration : Win32.DWORD;                    --  lmaudit.h:187
         ae_cf_reason : Win32.DWORD;                    --  lmaudit.h:188
      end record;

   type AE_SERVICESTAT_t is                                --  lmaudit.h:191
      record
         ae_ss_compname : Win32.DWORD;                   --  lmaudit.h:192
         ae_ss_username : Win32.DWORD;                   --  lmaudit.h:193
         ae_ss_svcname : Win32.DWORD;                   --  lmaudit.h:194
         ae_ss_status : Win32.DWORD;                   --  lmaudit.h:195
         ae_ss_code : Win32.DWORD;                   --  lmaudit.h:196
         ae_ss_text : Win32.DWORD;                   --  lmaudit.h:197
         ae_ss_returnval : Win32.DWORD;                   --  lmaudit.h:198
      end record;

   type AE_ACLMOD_t is                                     --  lmaudit.h:201
      record
         ae_am_compname : Win32.DWORD;                    --  lmaudit.h:202
         ae_am_username : Win32.DWORD;                    --  lmaudit.h:203
         ae_am_resname : Win32.DWORD;                    --  lmaudit.h:204
         ae_am_action : Win32.DWORD;                    --  lmaudit.h:205
         ae_am_datalen : Win32.DWORD;                    --  lmaudit.h:206
      end record;

   type AE_UASMOD_t is                                     --  lmaudit.h:209
      record
         ae_um_compname : Win32.DWORD;                    --  lmaudit.h:210
         ae_um_username : Win32.DWORD;                    --  lmaudit.h:211
         ae_um_resname : Win32.DWORD;                    --  lmaudit.h:212
         ae_um_rectype : Win32.DWORD;                    --  lmaudit.h:213
         ae_um_action : Win32.DWORD;                    --  lmaudit.h:214
         ae_um_datalen : Win32.DWORD;                    --  lmaudit.h:215
      end record;

   type AE_NETLOGON_t is                                   --  lmaudit.h:218
      record
         ae_no_compname : Win32.DWORD;                   --  lmaudit.h:219
         ae_no_username : Win32.DWORD;                   --  lmaudit.h:220
         ae_no_privilege : Win32.DWORD;                   --  lmaudit.h:221
         ae_no_authflags : Win32.DWORD;                   --  lmaudit.h:222
      end record;

   type AE_NETLOGOFF_t is                                  --  lmaudit.h:225
      record
         ae_nf_compname : Win32.DWORD;                   --  lmaudit.h:226
         ae_nf_username : Win32.DWORD;                   --  lmaudit.h:227
         ae_nf_reserved1 : Win32.DWORD;                   --  lmaudit.h:228
         ae_nf_reserved2 : Win32.DWORD;                   --  lmaudit.h:229
      end record;

   type AE_ACCLIM is                                       --  lmaudit.h:232
      record
         ae_al_compname : Win32.DWORD;                    --  lmaudit.h:233
         ae_al_username : Win32.DWORD;                    --  lmaudit.h:234
         ae_al_resname : Win32.DWORD;                    --  lmaudit.h:235
         ae_al_limit : Win32.DWORD;                    --  lmaudit.h:236
      end record;

   type AE_LOCKOUT_t is                                    --  lmaudit.h:242
      record
         ae_lk_compname : Win32.DWORD;                --  lmaudit.h:243
         ae_lk_username : Win32.DWORD;                --  lmaudit.h:244
         ae_lk_action : Win32.DWORD;                --  lmaudit.h:246
         ae_lk_bad_pw_count : Win32.DWORD;                --  lmaudit.h:248
      end record;

   type AE_GENERIC is                                      --  lmaudit.h:252
      record
         ae_ge_msgfile : Win32.DWORD;                     --  lmaudit.h:253
         ae_ge_msgnum : Win32.DWORD;                     --  lmaudit.h:254
         ae_ge_params : Win32.DWORD;                     --  lmaudit.h:255
         ae_ge_param1 : Win32.DWORD;                     --  lmaudit.h:256
         ae_ge_param2 : Win32.DWORD;                     --  lmaudit.h:257
         ae_ge_param3 : Win32.DWORD;                     --  lmaudit.h:258
         ae_ge_param4 : Win32.DWORD;                     --  lmaudit.h:259
         ae_ge_param5 : Win32.DWORD;                     --  lmaudit.h:260
         ae_ge_param6 : Win32.DWORD;                     --  lmaudit.h:261
         ae_ge_param7 : Win32.DWORD;                     --  lmaudit.h:262
         ae_ge_param8 : Win32.DWORD;                     --  lmaudit.h:263
         ae_ge_param9 : Win32.DWORD;                     --  lmaudit.h:264
      end record;

   function NetAuditClear
     (server : Win32.Winnt.LPTSTR;
      backupfile : Win32.Winnt.LPTSTR;
      service : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmaudit.h:73

   function NetAuditRead
     (server : Win32.Winnt.LPTSTR;
      service : Win32.Winnt.LPTSTR;
      auditloghandle : Win32.Lmerrlog.LPHLOG;
      offset : Win32.DWORD;
      reserved1 : Win32.LPDWORD;
      reserved2 : Win32.DWORD;
      offsetflag : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      bytesread : Win32.LPDWORD;
      totalavailable : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmaudit.h:80

   function NetAuditWrite
     (c_type : Win32.DWORD;
      buf : Win32.LPBYTE;
      numbytes : Win32.DWORD;
      service : Win32.Winnt.LPTSTR;
      reserved : Win32.LPBYTE)
     return Win32.DWORD;                          --  lmaudit.h:95

private

   pragma Convention (C, AUDIT_ENTRY);                      --  lmaudit.h:108
   pragma Convention (C_Pass_By_Copy, AE_SRVSTATUS_t);      --  lmaudit.h:122
   pragma Convention (C_Pass_By_Copy, AE_SESSLOGON_t);      --  lmaudit.h:126
   pragma Convention (C_Pass_By_Copy, AE_SESSLOGOFF_t);     --  lmaudit.h:132
   pragma Convention (C_Pass_By_Copy, AE_SESSPWERR_t);      --  lmaudit.h:138
   pragma Convention (C_Pass_By_Copy, AE_CONNSTART_t);      --  lmaudit.h:143
   pragma Convention (C, AE_CONNSTOP_t);                    --  lmaudit.h:150
   pragma Convention (C_Pass_By_Copy, AE_CONNREJ_t);        --  lmaudit.h:158
   pragma Convention (C, AE_RESACCESS_t);                   --  lmaudit.h:165
   pragma Convention (C_Pass_By_Copy, AE_RESACCESSREJ_t);   --  lmaudit.h:175
   pragma Convention (C, AE_CLOSEFILE_t);                   --  lmaudit.h:182
   pragma Convention (C, AE_SERVICESTAT_t);                 --  lmaudit.h:191
   pragma Convention (C, AE_ACLMOD_t);                      --  lmaudit.h:201
   pragma Convention (C, AE_UASMOD_t);                      --  lmaudit.h:209
   pragma Convention (C_Pass_By_Copy, AE_NETLOGON_t);       --  lmaudit.h:218
   pragma Convention (C_Pass_By_Copy, AE_NETLOGOFF_t);      --  lmaudit.h:225
   pragma Convention (C_Pass_By_Copy, AE_ACCLIM);           --  lmaudit.h:232
   pragma Convention (C_Pass_By_Copy, AE_LOCKOUT_t);        --  lmaudit.h:242
   pragma Convention (C, AE_GENERIC);                       --  lmaudit.h:252

   pragma Import (Stdcall, NetAuditClear, "NetAuditClear");    --  lmaudit.h:73
   pragma Import (Stdcall, NetAuditRead, "NetAuditRead");      --  lmaudit.h:80
   pragma Import (Stdcall, NetAuditWrite, "NetAuditWrite");    --  lmaudit.h:95

end Win32.Lmaudit;


