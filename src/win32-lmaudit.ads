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

with Win32.Lmerrlog;
with Win32.Winnt;

package Win32.Lmaudit is

   ACTION_LOCKOUT      : constant := 8#0#;
   ACTION_ADMINUNLOCK  : constant := 8#1#;
   AE_SRVSTATUS        : constant := 0;
   AE_SESSLOGON        : constant := 1;
   AE_SESSLOGOFF       : constant := 2;
   AE_SESSPWERR        : constant := 3;
   AE_CONNSTART        : constant := 4;
   AE_CONNSTOP         : constant := 5;
   AE_CONNREJ          : constant := 6;
   AE_RESACCESS        : constant := 7;
   AE_RESACCESSREJ     : constant := 8;
   AE_CLOSEFILE        : constant := 9;
   AE_SERVICESTAT      : constant := 11;
   AE_ACLMOD           : constant := 12;
   AE_UASMOD           : constant := 13;
   AE_NETLOGON         : constant := 14;
   AE_NETLOGOFF        : constant := 15;
   AE_NETLOGDENIED     : constant := 16;
   AE_ACCLIMITEXCD     : constant := 17;
   AE_RESACCESS2       : constant := 18;
   AE_ACLMODFAIL       : constant := 19;
   AE_LOCKOUT          : constant := 20;
   AE_GENERIC_TYPE     : constant := 21;
   AE_SRVSTART         : constant := 0;
   AE_SRVPAUSED        : constant := 1;
   AE_SRVCONT          : constant := 2;
   AE_SRVSTOP          : constant := 3;
   AE_GUEST            : constant := 0;
   AE_USER             : constant := 1;
   AE_ADMIN            : constant := 2;
   AE_NORMAL           : constant := 0;
   AE_USERLIMIT        : constant := 0;
   AE_GENERAL          : constant := 0;
   AE_ERROR            : constant := 1;
   AE_SESSDIS          : constant := 1;
   AE_BADPW            : constant := 1;
   AE_AUTODIS          : constant := 2;
   AE_UNSHARE          : constant := 2;
   AE_ADMINPRIVREQD    : constant := 2;
   AE_ADMINDIS         : constant := 3;
   AE_NOACCESSPERM     : constant := 3;
   AE_ACCRESTRICT      : constant := 4;
   AE_NORMAL_CLOSE     : constant := 0;
   AE_SES_CLOSE        : constant := 1;
   AE_ADMIN_CLOSE      : constant := 2;
   AE_LIM_UNKNOWN      : constant := 0;
   AE_LIM_LOGONHOURS   : constant := 1;
   AE_LIM_EXPIRED      : constant := 2;
   AE_LIM_INVAL_WKSTA  : constant := 3;
   AE_LIM_DISABLED     : constant := 4;
   AE_LIM_DELETED      : constant := 5;
   AE_MOD              : constant := 0;
   AE_DELETE           : constant := 1;
   AE_ADD              : constant := 2;
   AE_UAS_USER         : constant := 0;
   AE_UAS_GROUP        : constant := 1;
   AE_UAS_MODALS       : constant := 2;
   SVAUD_SERVICE       : constant := 16#1#;
   SVAUD_GOODSESSLOGON : constant := 16#6#;
   SVAUD_BADSESSLOGON  : constant := 16#18#;
   SVAUD_SESSLOGON     : constant := 16#1e#;
   SVAUD_GOODNETLOGON  : constant := 16#60#;
   SVAUD_BADNETLOGON   : constant := 16#180#;
   SVAUD_NETLOGON      : constant := 16#1e0#;
   SVAUD_LOGON         : constant := 16#1fe#;
   SVAUD_GOODUSE       : constant := 16#600#;
   SVAUD_BADUSE        : constant := 16#1800#;
   SVAUD_USE           : constant := 16#1e00#;
   SVAUD_USERLIST      : constant := 16#2000#;
   SVAUD_PERMISSIONS   : constant := 16#4000#;
   SVAUD_RESOURCE      : constant := 16#8000#;
   SVAUD_LOGONLIM      : constant := 16#10000#;
   AA_AUDIT_ALL        : constant := 16#1#;
   AA_A_OWNER          : constant := 16#4#;
   AA_CLOSE            : constant := 16#8#;
   AA_S_OPEN           : constant := 16#10#;
   AA_S_WRITE          : constant := 16#20#;
   AA_S_CREATE         : constant := 16#20#;
   AA_S_DELETE         : constant := 16#40#;
   AA_S_ACL            : constant := 16#80#;
   AA_S_ALL            : constant := 16#f0#;
   AA_F_OPEN           : constant := 16#100#;
   AA_F_WRITE          : constant := 16#200#;
   AA_F_CREATE         : constant := 16#200#;
   AA_F_DELETE         : constant := 16#400#;
   AA_F_ACL            : constant := 16#800#;
   AA_F_ALL            : constant := 16#f00#;
   AA_A_OPEN           : constant := 16#1000#;
   AA_A_WRITE          : constant := 16#2000#;
   AA_A_CREATE         : constant := 16#2000#;
   AA_A_DELETE         : constant := 16#4000#;
   AA_A_ACL            : constant := 16#8000#;
   AA_A_ALL            : constant := 16#f00#;

   type AUDIT_ENTRY;
   type AE_SRVSTATUS_t;
   type AE_SESSLOGON_t;
   type AE_SESSLOGOFF_t;
   type AE_SESSPWERR_t;
   type AE_CONNSTART_t;
   type AE_CONNSTOP_t;
   type AE_CONNREJ_t;
   type AE_RESACCESS_t;
   type AE_RESACCESSREJ_t;
   type AE_CLOSEFILE_t;
   type AE_SERVICESTAT_t;
   type AE_ACLMOD_t;
   type AE_UASMOD_t;
   type AE_NETLOGON_t;
   type AE_NETLOGOFF_t;
   type AE_ACCLIM;
   type AE_LOCKOUT_t;
   type AE_GENERIC;

   type PAUDIT_ENTRY is access all AUDIT_ENTRY;
   subtype LPAUDIT_ENTRY is PAUDIT_ENTRY;

   type PAE_SRVSTATUS is access all AE_SRVSTATUS_t;
   subtype LPAE_SRVSTATUS is PAE_SRVSTATUS;

   type PAE_SESSLOGON is access all AE_SESSLOGON_t;
   subtype LPAE_SESSLOGON is PAE_SESSLOGON;

   type PAE_SESSLOGOFF is access all AE_SESSLOGOFF_t;
   subtype LPAE_SESSLOGOFF is PAE_SESSLOGOFF;

   type PAE_SESSPWERR is access all AE_SESSPWERR_t;
   subtype LPAE_SESSPWERR is PAE_SESSPWERR;

   type PAE_CONNSTART is access all AE_CONNSTART_t;
   subtype LPAE_CONNSTART is PAE_CONNSTART;

   type PAE_CONNSTOP is access all AE_CONNSTOP_t;
   subtype LPAE_CONNSTOP is PAE_CONNSTOP;

   type PAE_CONNREJ is access all AE_CONNREJ_t;
   subtype LPAE_CONNREJ is PAE_CONNREJ;

   type PAE_RESACCESS is access all AE_RESACCESS_t;
   subtype LPAE_RESACCESS is PAE_RESACCESS;

   type PAE_RESACCESSREJ is access all AE_RESACCESSREJ_t;
   subtype LPAE_RESACCESSREJ is PAE_RESACCESSREJ;

   type PAE_CLOSEFILE is access all AE_CLOSEFILE_t;
   subtype LPAE_CLOSEFILE is PAE_CLOSEFILE;

   type PAE_SERVICESTAT is access all AE_SERVICESTAT_t;
   subtype LPAE_SERVICESTAT is PAE_SERVICESTAT;

   type PAE_ACLMOD is access all AE_ACLMOD_t;
   subtype LPAE_ACLMOD is PAE_ACLMOD;

   type PAE_UASMOD is access all AE_UASMOD_t;
   subtype LPAE_UASMOD is PAE_UASMOD;

   type PAE_NETLOGON is access all AE_NETLOGON_t;
   subtype LPAE_NETLOGON is PAE_NETLOGON;

   type PAE_NETLOGOFF is access all AE_NETLOGOFF_t;
   subtype LPAE_NETLOGOFF is PAE_NETLOGOFF;

   type PAE_ACCLIM is access all AE_ACCLIM;
   subtype LPAE_ACCLIM is PAE_ACCLIM;

   type PAE_LOCKOUT is access all AE_LOCKOUT_t;
   subtype LPAE_LOCKOUT is PAE_LOCKOUT;

   type PAE_GENERIC is access all AE_GENERIC;
   subtype LPAE_GENERIC is PAE_GENERIC;

   type AUDIT_ENTRY is record
      ae_len         : Win32.DWORD;
      ae_reserved    : Win32.DWORD;
      ae_time        : Win32.DWORD;
      ae_type        : Win32.DWORD;
      ae_data_offset : Win32.DWORD;
      ae_data_size   : Win32.DWORD;
   end record;

   type AE_SRVSTATUS_t is record
      ae_sv_status : Win32.DWORD;
   end record;

   type AE_SESSLOGON_t is record
      ae_so_compname  : Win32.DWORD;
      ae_so_username  : Win32.DWORD;
      ae_so_privilege : Win32.DWORD;
   end record;

   type AE_SESSLOGOFF_t is record
      ae_sf_compname : Win32.DWORD;
      ae_sf_username : Win32.DWORD;
      ae_sf_reason   : Win32.DWORD;
   end record;

   type AE_SESSPWERR_t is record
      ae_sp_compname : Win32.DWORD;
      ae_sp_username : Win32.DWORD;
   end record;

   type AE_CONNSTART_t is record
      ae_ct_compname : Win32.DWORD;
      ae_ct_username : Win32.DWORD;
      ae_ct_netname  : Win32.DWORD;
      ae_ct_connid   : Win32.DWORD;
   end record;

   type AE_CONNSTOP_t is record
      ae_cp_compname : Win32.DWORD;
      ae_cp_username : Win32.DWORD;
      ae_cp_netname  : Win32.DWORD;
      ae_cp_connid   : Win32.DWORD;
      ae_cp_reason   : Win32.DWORD;
   end record;

   type AE_CONNREJ_t is record
      ae_cr_compname : Win32.DWORD;
      ae_cr_username : Win32.DWORD;
      ae_cr_netname  : Win32.DWORD;
      ae_cr_reason   : Win32.DWORD;
   end record;

   type AE_RESACCESS_t is record
      ae_ra_compname   : Win32.DWORD;
      ae_ra_username   : Win32.DWORD;
      ae_ra_resname    : Win32.DWORD;
      ae_ra_operation  : Win32.DWORD;
      ae_ra_returncode : Win32.DWORD;
      ae_ra_restype    : Win32.DWORD;
      ae_ra_fileid     : Win32.DWORD;
   end record;

   type AE_RESACCESSREJ_t is record
      ae_rr_compname  : Win32.DWORD;
      ae_rr_username  : Win32.DWORD;
      ae_rr_resname   : Win32.DWORD;
      ae_rr_operation : Win32.DWORD;
   end record;

   type AE_CLOSEFILE_t is record
      ae_cf_compname : Win32.DWORD;
      ae_cf_username : Win32.DWORD;
      ae_cf_resname  : Win32.DWORD;
      ae_cf_fileid   : Win32.DWORD;
      ae_cf_duration : Win32.DWORD;
      ae_cf_reason   : Win32.DWORD;
   end record;

   type AE_SERVICESTAT_t is record
      ae_ss_compname  : Win32.DWORD;
      ae_ss_username  : Win32.DWORD;
      ae_ss_svcname   : Win32.DWORD;
      ae_ss_status    : Win32.DWORD;
      ae_ss_code      : Win32.DWORD;
      ae_ss_text      : Win32.DWORD;
      ae_ss_returnval : Win32.DWORD;
   end record;

   type AE_ACLMOD_t is record
      ae_am_compname : Win32.DWORD;
      ae_am_username : Win32.DWORD;
      ae_am_resname  : Win32.DWORD;
      ae_am_action   : Win32.DWORD;
      ae_am_datalen  : Win32.DWORD;
   end record;

   type AE_UASMOD_t is record
      ae_um_compname : Win32.DWORD;
      ae_um_username : Win32.DWORD;
      ae_um_resname  : Win32.DWORD;
      ae_um_rectype  : Win32.DWORD;
      ae_um_action   : Win32.DWORD;
      ae_um_datalen  : Win32.DWORD;
   end record;

   type AE_NETLOGON_t is record
      ae_no_compname  : Win32.DWORD;
      ae_no_username  : Win32.DWORD;
      ae_no_privilege : Win32.DWORD;
      ae_no_authflags : Win32.DWORD;
   end record;

   type AE_NETLOGOFF_t is record
      ae_nf_compname  : Win32.DWORD;
      ae_nf_username  : Win32.DWORD;
      ae_nf_reserved1 : Win32.DWORD;
      ae_nf_reserved2 : Win32.DWORD;
   end record;

   type AE_ACCLIM is record
      ae_al_compname : Win32.DWORD;
      ae_al_username : Win32.DWORD;
      ae_al_resname  : Win32.DWORD;
      ae_al_limit    : Win32.DWORD;
   end record;

   type AE_LOCKOUT_t is record
      ae_lk_compname     : Win32.DWORD;
      ae_lk_username     : Win32.DWORD;
      ae_lk_action       : Win32.DWORD;
      ae_lk_bad_pw_count : Win32.DWORD;
   end record;

   type AE_GENERIC is record
      ae_ge_msgfile : Win32.DWORD;
      ae_ge_msgnum  : Win32.DWORD;
      ae_ge_params  : Win32.DWORD;
      ae_ge_param1  : Win32.DWORD;
      ae_ge_param2  : Win32.DWORD;
      ae_ge_param3  : Win32.DWORD;
      ae_ge_param4  : Win32.DWORD;
      ae_ge_param5  : Win32.DWORD;
      ae_ge_param6  : Win32.DWORD;
      ae_ge_param7  : Win32.DWORD;
      ae_ge_param8  : Win32.DWORD;
      ae_ge_param9  : Win32.DWORD;
   end record;

   function NetAuditClear
     (server     : Win32.Winnt.LPTSTR;
      backupfile : Win32.Winnt.LPTSTR;
      service    : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetAuditRead
     (server         : Win32.Winnt.LPTSTR;
      service        : Win32.Winnt.LPTSTR;
      auditloghandle : Win32.Lmerrlog.LPHLOG;
      offset         : Win32.DWORD;
      reserved1      : Win32.LPDWORD;
      reserved2      : Win32.DWORD;
      offsetflag     : Win32.DWORD;
      bufptr         : access Win32.PBYTE;
      prefmaxlen     : Win32.DWORD;
      bytesread      : Win32.LPDWORD;
      totalavailable : Win32.LPDWORD)
      return Win32.DWORD;

   function NetAuditWrite
     (c_type   : Win32.DWORD;
      buf      : Win32.LPBYTE;
      numbytes : Win32.DWORD;
      service  : Win32.Winnt.LPTSTR;
      reserved : Win32.LPBYTE)
      return Win32.DWORD;

private

   pragma Convention (C, AUDIT_ENTRY);
   pragma Convention (C_Pass_By_Copy, AE_SRVSTATUS_t);
   pragma Convention (C_Pass_By_Copy, AE_SESSLOGON_t);
   pragma Convention (C_Pass_By_Copy, AE_SESSLOGOFF_t);
   pragma Convention (C_Pass_By_Copy, AE_SESSPWERR_t);
   pragma Convention (C_Pass_By_Copy, AE_CONNSTART_t);
   pragma Convention (C, AE_CONNSTOP_t);
   pragma Convention (C_Pass_By_Copy, AE_CONNREJ_t);
   pragma Convention (C, AE_RESACCESS_t);
   pragma Convention (C_Pass_By_Copy, AE_RESACCESSREJ_t);
   pragma Convention (C, AE_CLOSEFILE_t);
   pragma Convention (C, AE_SERVICESTAT_t);
   pragma Convention (C, AE_ACLMOD_t);
   pragma Convention (C, AE_UASMOD_t);
   pragma Convention (C_Pass_By_Copy, AE_NETLOGON_t);
   pragma Convention (C_Pass_By_Copy, AE_NETLOGOFF_t);
   pragma Convention (C_Pass_By_Copy, AE_ACCLIM);
   pragma Convention (C_Pass_By_Copy, AE_LOCKOUT_t);
   pragma Convention (C, AE_GENERIC);

   pragma Import (Stdcall, NetAuditClear, "NetAuditClear");
   pragma Import (Stdcall, NetAuditRead, "NetAuditRead");
   pragma Import (Stdcall, NetAuditWrite, "NetAuditWrite");

end Win32.Lmaudit;
