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

with Win32.Lmcons;
with Win32.Winnt;

package Win32.Lmaccess is

   use Interfaces;
   use type Interfaces.C.char_array;

   UF_SCRIPT                                 : constant := 16#1#;
   UF_ACCOUNTDISABLE                         : constant := 16#2#;
   UF_HOMEDIR_REQUIRED                       : constant := 16#8#;
   UF_LOCKOUT                                : constant := 16#10#;
   UF_PASSWD_NOTREQD                         : constant := 16#20#;
   UF_PASSWD_CANT_CHANGE                     : constant := 16#40#;
   UF_TEMP_DUPLICATE_ACCOUNT                 : constant := 16#100#;
   UF_NORMAL_ACCOUNT                         : constant := 16#200#;
   UF_INTERDOMAIN_TRUST_ACCOUNT              : constant := 16#800#;
   UF_WORKSTATION_TRUST_ACCOUNT              : constant := 16#1000#;
   UF_SERVER_TRUST_ACCOUNT                   : constant := 16#2000#;
   UF_MACHINE_ACCOUNT_MASK                   : constant := 16#3800#;
   UF_ACCOUNT_TYPE_MASK                      : constant := 16#3b00#;
   UF_DONT_EXPIRE_PASSWD                     : constant := 16#10000#;
   UF_SETTABLE_BITS                          : constant := 16#13b7b#;
   FILTER_TEMP_DUPLICATE_ACCOUNT             : constant := 16#1#;
   FILTER_NORMAL_ACCOUNT                     : constant := 16#2#;
   FILTER_INTERDOMAIN_TRUST_ACCOUNT          : constant := 16#8#;
   FILTER_WORKSTATION_TRUST_ACCOUNT          : constant := 16#10#;
   FILTER_SERVER_TRUST_ACCOUNT               : constant := 16#20#;
   LG_INCLUDE_INDIRECT                       : constant := 16#1#;
   AF_OP_PRINT                               : constant := 16#1#;
   AF_OP_COMM                                : constant := 16#2#;
   AF_OP_SERVER                              : constant := 16#4#;
   AF_OP_ACCOUNTS                            : constant := 16#8#;
   AF_SETTABLE_BITS                          : constant := 16#f#;
   UAS_ROLE_STANDALONE                       : constant := 0;
   UAS_ROLE_MEMBER                           : constant := 1;
   UAS_ROLE_BACKUP                           : constant := 2;
   UAS_ROLE_PRIMARY                          : constant := 3;
   USER_NAME_PARMNUM                         : constant := 1;
   USER_PASSWORD_PARMNUM                     : constant := 3;
   USER_PASSWORD_AGE_PARMNUM                 : constant := 4;
   USER_PRIV_PARMNUM                         : constant := 5;
   USER_HOME_DIR_PARMNUM                     : constant := 6;
   USER_COMMENT_PARMNUM                      : constant := 7;
   USER_FLAGS_PARMNUM                        : constant := 8;
   USER_SCRIPT_PATH_PARMNUM                  : constant := 9;
   USER_AUTH_FLAGS_PARMNUM                   : constant := 10;
   USER_FULL_NAME_PARMNUM                    : constant := 11;
   USER_USR_COMMENT_PARMNUM                  : constant := 12;
   USER_PARMS_PARMNUM                        : constant := 13;
   USER_WORKSTATIONS_PARMNUM                 : constant := 14;
   USER_LAST_LOGON_PARMNUM                   : constant := 15;
   USER_LAST_LOGOFF_PARMNUM                  : constant := 16;
   USER_ACCT_EXPIRES_PARMNUM                 : constant := 17;
   USER_MAX_STORAGE_PARMNUM                  : constant := 18;
   USER_UNITS_PER_WEEK_PARMNUM               : constant := 19;
   USER_LOGON_HOURS_PARMNUM                  : constant := 20;
   USER_PAD_PW_COUNT_PARMNUM                 : constant := 21;
   USER_NUM_LOGONS_PARMNUM                   : constant := 22;
   USER_LOGON_SERVER_PARMNUM                 : constant := 23;
   USER_COUNTRY_CODE_PARMNUM                 : constant := 24;
   USER_CODE_PAGE_PARMNUM                    : constant := 25;
   USER_PRIMARY_GROUP_PARMNUM                : constant := 51;
   USER_PROFILE                              : constant := 52;
   USER_PROFILE_PARMNUM                      : constant := 52;
   USER_HOME_DIR_DRIVE_PARMNUM               : constant := 53;
   USER_NAME_INFOLEVEL                       : constant := 1001;
   USER_PASSWORD_INFOLEVEL                   : constant := 1003;
   USER_PASSWORD_AGE_INFOLEVEL               : constant := 1004;
   USER_PRIV_INFOLEVEL                       : constant := 1005;
   USER_HOME_DIR_INFOLEVEL                   : constant := 1006;
   USER_COMMENT_INFOLEVEL                    : constant := 1007;
   USER_FLAGS_INFOLEVEL                      : constant := 1008;
   USER_SCRIPT_PATH_INFOLEVEL                : constant := 1009;
   USER_AUTH_FLAGS_INFOLEVEL                 : constant := 1010;
   USER_FULL_NAME_INFOLEVEL                  : constant := 1011;
   USER_USR_COMMENT_INFOLEVEL                : constant := 1012;
   USER_PARMS_INFOLEVEL                      : constant := 1013;
   USER_WORKSTATIONS_INFOLEVEL               : constant := 1014;
   USER_LAST_LOGON_INFOLEVEL                 : constant := 1015;
   USER_LAST_LOGOFF_INFOLEVEL                : constant := 1016;
   USER_ACCT_EXPIRES_INFOLEVEL               : constant := 1017;
   USER_MAX_STORAGE_INFOLEVEL                : constant := 1018;
   USER_UNITS_PER_WEEK_INFOLEVEL             : constant := 1019;
   USER_LOGON_HOURS_INFOLEVEL                : constant := 1020;
   USER_PAD_PW_COUNT_INFOLEVEL               : constant := 1021;
   USER_NUM_LOGONS_INFOLEVEL                 : constant := 1022;
   USER_LOGON_SERVER_INFOLEVEL               : constant := 1023;
   USER_COUNTRY_CODE_INFOLEVEL               : constant := 1024;
   USER_CODE_PAGE_INFOLEVEL                  : constant := 1025;
   USER_PRIMARY_GROUP_INFOLEVEL              : constant := 1051;
   USER_HOME_DIR_DRIVE_INFOLEVEL             : constant := 1053;
   NULL_USERSETINFO_PASSWD                   : constant CHAR_Array  :=
      "              " & Nul;
   TIMEQ_FOREVER                             : constant Win32.ULONG :=
      Win32.ULONG'Last;
   USER_MAXSTORAGE_UNLIMITED                 : constant Win32.ULONG :=
      Win32.ULONG'Last;
   USER_NO_LOGOFF                            : constant Win32.ULONG :=
      Win32.ULONG'Last;
   UNITS_PER_DAY                             : constant := 24;
   UNITS_PER_WEEK                            : constant := 168;
   USER_PRIV_MASK                            : constant := 16#3#;
   USER_PRIV_GUEST                           : constant := 0;
   USER_PRIV_USER                            : constant := 1;
   USER_PRIV_ADMIN                           : constant := 2;
   MAX_PASSWD_LEN                            : constant := 256;
   DEF_MIN_PWLEN                             : constant := 6;
   DEF_PWUNIQUENESS                          : constant := 5;
   DEF_MAX_PWHIST                            : constant := 8;
   DEF_MIN_PWAGE                             : constant Win32.ULONG := 0;
   DEF_FORCE_LOGOFF                          : constant Win32.ULONG :=
      16#ffffffff#;
   DEF_MAX_BADPW                             : constant := 0;
   ONE_DAY                                   : constant Win32.ULONG :=
      8#250600#;
   VALIDATED_LOGON                           : constant := 0;
   PASSWORD_EXPIRED                          : constant := 2;
   NON_VALIDATED_LOGON                       : constant := 3;
   VALID_LOGOFF                              : constant := 1;
   MODALS_MIN_PASSWD_LEN_PARMNUM             : constant := 1;
   MODALS_MAX_PASSWD_AGE_PARMNUM             : constant := 2;
   MODALS_MIN_PASSWD_AGE_PARMNUM             : constant := 3;
   MODALS_FORCE_LOGOFF_PARMNUM               : constant := 4;
   MODALS_PASSWD_HIST_LEN_PARMNUM            : constant := 5;
   MODALS_ROLE_PARMNUM                       : constant := 6;
   MODALS_PRIMARY_PARMNUM                    : constant := 7;
   MODALS_DOMAIN_NAME_PARMNUM                : constant := 8;
   MODALS_DOMAIN_ID_PARMNUM                  : constant := 9;
   MODALS_LOCKOUT_DURATION_PARMNUM           : constant := 10;
   MODALS_LOCKOUT_OBSERVATION_WINDOW_PARMNUM : constant := 11;
   MODALS_LOCKOUT_THRESHOLD_PARMNUM          : constant := 12;
   MODALS_MIN_PASSWD_LEN_INFOLEVEL           : constant := 1001;
   MODALS_MAX_PASSWD_AGE_INFOLEVEL           : constant := 1002;
   MODALS_MIN_PASSWD_AGE_INFOLEVEL           : constant := 1003;
   MODALS_FORCE_LOGOFF_INFOLEVEL             : constant := 1004;
   MODALS_PASSWD_HIST_LEN_INFOLEVEL          : constant := 1005;
   MODALS_ROLE_INFOLEVEL                     : constant := 1006;
   MODALS_PRIMARY_INFOLEVEL                  : constant := 1007;
   MODALS_DOMAIN_NAME_INFOLEVEL              : constant := 1008;
   MODALS_DOMAIN_ID_INFOLEVEL                : constant := 1009;
   GROUPIDMASK                               : constant := 16#8000#;
   GROUP_SPECIALGRP_USERS                    : constant WCHAR_Array :=
      To_Win (C.To_C ("USERS")) & Wide_Nul;
   GROUP_SPECIALGRP_ADMINS                   : constant WCHAR_Array :=
      To_Win (C.To_C ("ADMINS")) & Wide_Nul;
   GROUP_SPECIALGRP_GUESTS                   : constant WCHAR_Array :=
      To_Win (C.To_C ("GUESTS")) & Wide_Nul;
   GROUP_SPECIALGRP_LOCAL                    : constant WCHAR_Array :=
      To_Win (C.To_C ("LOCAL")) & Wide_Nul;
   GROUP_ALL_PARMNUM                         : constant := 0;
   GROUP_NAME_PARMNUM                        : constant := 1;
   GROUP_COMMENT_PARMNUM                     : constant := 2;
   GROUP_ATTRIBUTES_PARMNUM                  : constant := 3;
   GROUP_ALL_INFOLEVEL                       : constant := 1000;
   GROUP_NAME_INFOLEVEL                      : constant := 1001;
   GROUP_COMMENT_INFOLEVEL                   : constant := 1002;
   GROUP_ATTRIBUTES_INFOLEVEL                : constant := 1003;
   LOCALGROUP_NAME_PARMNUM                   : constant := 1;
   LOCALGROUP_COMMENT_PARMNUM                : constant := 2;
   MAXPERMENTRIES                            : constant := 64;
   ACCESS_NONE                               : constant := 0;
   ACCESS_ALL                                : constant := 16#7f#;
   ACCESS_READ                               : constant := 16#1#;
   ACCESS_WRITE                              : constant := 16#2#;
   ACCESS_CREATE                             : constant := 16#4#;
   ACCESS_EXEC                               : constant := 16#8#;
   ACCESS_DELETE                             : constant := 16#10#;
   ACCESS_ATRIB                              : constant := 16#20#;
   ACCESS_PERM                               : constant := 16#40#;
   ACCESS_GROUP                              : constant := 16#8000#;
   ACCESS_AUDIT                              : constant := 16#1#;
   ACCESS_SUCCESS_OPEN                       : constant := 16#10#;
   ACCESS_SUCCESS_WRITE                      : constant := 16#20#;
   ACCESS_SUCCESS_DELETE                     : constant := 16#40#;
   ACCESS_SUCCESS_ACL                        : constant := 16#80#;
   ACCESS_SUCCESS_MASK                       : constant := 16#f0#;
   ACCESS_FAIL_OPEN                          : constant := 16#100#;
   ACCESS_FAIL_WRITE                         : constant := 16#200#;
   ACCESS_FAIL_DELETE                        : constant := 16#400#;
   ACCESS_FAIL_ACL                           : constant := 16#800#;
   ACCESS_FAIL_MASK                          : constant := 16#f00#;
   ACCESS_FAIL_SHIFT                         : constant := 4;
   ACCESS_RESOURCE_NAME_PARMNUM              : constant := 1;
   ACCESS_ATTR_PARMNUM                       : constant := 2;
   ACCESS_COUNT_PARMNUM                      : constant := 3;
   ACCESS_ACCESS_LIST_PARMNUM                : constant := 4;
   ACCESS_RESOURCE_NAME_INFOLEVEL            : constant := 1001;
   ACCESS_ATTR_INFOLEVEL                     : constant := 1002;
   ACCESS_COUNT_INFOLEVEL                    : constant := 1003;
   ACCESS_ACCESS_LIST_INFOLEVEL              : constant := 1004;
   ACCESS_LETTERS                            : constant CHAR_Array  :=
      "RWCXDAP         " & Nul;
   NETLOGON_CONTROL_QUERY                    : constant := 1;
   NETLOGON_CONTROL_REPLICATE                : constant := 2;
   NETLOGON_CONTROL_SYNCHRONIZE              : constant := 3;
   NETLOGON_CONTROL_PDC_REPLICATE            : constant := 4;
   NETLOGON_CONTROL_REDISCOVER               : constant := 5;
   NETLOGON_CONTROL_TC_QUERY                 : constant := 6;
   NETLOGON_CONTROL_BACKUP_CHANGE_LOG        : constant := 16#fffc#;
   NETLOGON_CONTROL_TRUNCATE_LOG             : constant := 16#fffd#;
   NETLOGON_CONTROL_SET_DBFLAG               : constant := 16#fffe#;
   NETLOGON_CONTROL_BREAKPOINT               : constant := 16#ffff#;
   NETLOGON_REPLICATION_NEEDED               : constant := 16#1#;
   NETLOGON_REPLICATION_IN_PROGRESS          : constant := 16#2#;
   NETLOGON_FULL_SYNC_REPLICATION            : constant := 16#4#;
   NETLOGON_REDO_NEEDED                      : constant := 16#8#;

   type USER_INFO_0;
   type USER_INFO_1;
   type USER_INFO_2;
   type USER_INFO_3;
   type USER_INFO_10;
   type USER_INFO_11;
   type USER_INFO_20;
   type USER_INFO_21;
   type USER_INFO_22;
   type USER_INFO_1003;
   type USER_INFO_1005;
   type USER_INFO_1006;
   type USER_INFO_1007;
   type USER_INFO_1008;
   type USER_INFO_1009;
   type USER_INFO_1010;
   type USER_INFO_1011;
   type USER_INFO_1012;
   type USER_INFO_1013;
   type USER_INFO_1014;
   type USER_INFO_1017;
   type USER_INFO_1018;
   type USER_INFO_1020;
   type USER_INFO_1023;
   type USER_INFO_1024;
   type USER_INFO_1025;
   type USER_INFO_1051;
   type USER_INFO_1052;
   type USER_INFO_1053;
   type USER_MODALS_INFO_0;
   type USER_MODALS_INFO_1;
   type USER_MODALS_INFO_2;
   type USER_MODALS_INFO_3;
   type USER_MODALS_INFO_1001;
   type USER_MODALS_INFO_1002;
   type USER_MODALS_INFO_1003;
   type USER_MODALS_INFO_1004;
   type USER_MODALS_INFO_1005;
   type USER_MODALS_INFO_1006;
   type USER_MODALS_INFO_1007;
   type GROUP_INFO_0;
   type GROUP_INFO_1;
   type GROUP_INFO_2;
   type GROUP_INFO_1002;
   type GROUP_INFO_1005;
   type GROUP_USERS_INFO_0;
   type GROUP_USERS_INFO_1;
   type LOCALGROUP_INFO_0;
   type LOCALGROUP_INFO_1;
   type LOCALGROUP_INFO_1002;
   type LOCALGROUP_MEMBERS_INFO_0;
   type LOCALGROUP_MEMBERS_INFO_1;
   type LOCALGROUP_USERS_INFO_0;
   type ACCESS_INFO_0;
   type ACCESS_INFO_1;
   type ACCESS_INFO_1002;
   type ACCESS_LIST;
   type NETLOGON_INFO_1;
   type NETLOGON_INFO_2;

   type PUSER_INFO_0 is access all USER_INFO_0;
   subtype LPUSER_INFO_0 is PUSER_INFO_0;

   type PUSER_INFO_1 is access all USER_INFO_1;
   subtype LPUSER_INFO_1 is PUSER_INFO_1;

   type PUSER_INFO_2 is access all USER_INFO_2;
   subtype LPUSER_INFO_2 is PUSER_INFO_2;

   type PUSER_INFO_3 is access all USER_INFO_3;
   subtype LPUSER_INFO_3 is PUSER_INFO_3;

   type PUSER_INFO_10 is access all USER_INFO_10;
   subtype LPUSER_INFO_10 is PUSER_INFO_10;

   type PUSER_INFO_11 is access all USER_INFO_11;
   subtype LPUSER_INFO_11 is PUSER_INFO_11;

   type PUSER_INFO_20 is access all USER_INFO_20;
   subtype LPUSER_INFO_20 is PUSER_INFO_20;

   type PUSER_INFO_21 is access all USER_INFO_21;
   subtype LPUSER_INFO_21 is PUSER_INFO_21;

   type PUSER_INFO_22 is access all USER_INFO_22;
   subtype LPUSER_INFO_22 is PUSER_INFO_22;

   type PUSER_INFO_1003 is access all USER_INFO_1003;
   subtype LPUSER_INFO_1003 is PUSER_INFO_1003;

   type PUSER_INFO_1005 is access all USER_INFO_1005;
   subtype LPUSER_INFO_1005 is PUSER_INFO_1005;

   type PUSER_INFO_1006 is access all USER_INFO_1006;
   subtype LPUSER_INFO_1006 is PUSER_INFO_1006;

   type PUSER_INFO_1007 is access all USER_INFO_1007;
   subtype LPUSER_INFO_1007 is PUSER_INFO_1007;

   type PUSER_INFO_1008 is access all USER_INFO_1008;
   subtype LPUSER_INFO_1008 is PUSER_INFO_1008;

   type PUSER_INFO_1009 is access all USER_INFO_1009;
   subtype LPUSER_INFO_1009 is PUSER_INFO_1009;

   type PUSER_INFO_1010 is access all USER_INFO_1010;
   subtype LPUSER_INFO_1010 is PUSER_INFO_1010;

   type PUSER_INFO_1011 is access all USER_INFO_1011;
   subtype LPUSER_INFO_1011 is PUSER_INFO_1011;

   type PUSER_INFO_1012 is access all USER_INFO_1012;
   subtype LPUSER_INFO_1012 is PUSER_INFO_1012;

   type PUSER_INFO_1013 is access all USER_INFO_1013;
   subtype LPUSER_INFO_1013 is PUSER_INFO_1013;

   type PUSER_INFO_1014 is access all USER_INFO_1014;
   subtype LPUSER_INFO_1014 is PUSER_INFO_1014;

   type PUSER_INFO_1017 is access all USER_INFO_1017;
   subtype LPUSER_INFO_1017 is PUSER_INFO_1017;

   type PUSER_INFO_1018 is access all USER_INFO_1018;
   subtype LPUSER_INFO_1018 is PUSER_INFO_1018;

   type PUSER_INFO_1020 is access all USER_INFO_1020;
   subtype LPUSER_INFO_1020 is PUSER_INFO_1020;

   type PUSER_INFO_1023 is access all USER_INFO_1023;
   subtype LPUSER_INFO_1023 is PUSER_INFO_1023;

   type PUSER_INFO_1024 is access all USER_INFO_1024;
   subtype LPUSER_INFO_1024 is PUSER_INFO_1024;

   type PUSER_INFO_1025 is access all USER_INFO_1025;
   subtype LPUSER_INFO_1025 is PUSER_INFO_1025;

   type PUSER_INFO_1051 is access all USER_INFO_1051;
   subtype LPUSER_INFO_1051 is PUSER_INFO_1051;

   type PUSER_INFO_1052 is access all USER_INFO_1052;
   subtype LPUSER_INFO_1052 is PUSER_INFO_1052;

   type PUSER_INFO_1053 is access all USER_INFO_1053;
   subtype LPUSER_INFO_1053 is PUSER_INFO_1053;

   type PUSER_MODALS_INFO_0 is access all USER_MODALS_INFO_0;
   subtype LPUSER_MODALS_INFO_0 is PUSER_MODALS_INFO_0;

   type PUSER_MODALS_INFO_1 is access all USER_MODALS_INFO_1;
   subtype LPUSER_MODALS_INFO_1 is PUSER_MODALS_INFO_1;

   type PUSER_MODALS_INFO_2 is access all USER_MODALS_INFO_2;
   subtype LPUSER_MODALS_INFO_2 is PUSER_MODALS_INFO_2;

   type PUSER_MODALS_INFO_3 is access all USER_MODALS_INFO_3;
   subtype LPUSER_MODALS_INFO_3 is PUSER_MODALS_INFO_3;

   type PUSER_MODALS_INFO_1001 is access all USER_MODALS_INFO_1001;
   subtype LPUSER_MODALS_INFO_1001 is PUSER_MODALS_INFO_1001;

   type PUSER_MODALS_INFO_1002 is access all USER_MODALS_INFO_1002;
   subtype LPUSER_MODALS_INFO_1002 is PUSER_MODALS_INFO_1002;

   type PUSER_MODALS_INFO_1003 is access all USER_MODALS_INFO_1003;
   subtype LPUSER_MODALS_INFO_1003 is PUSER_MODALS_INFO_1003;

   type PUSER_MODALS_INFO_1004 is access all USER_MODALS_INFO_1004;
   subtype LPUSER_MODALS_INFO_1004 is PUSER_MODALS_INFO_1004;

   type PUSER_MODALS_INFO_1005 is access all USER_MODALS_INFO_1005;
   subtype LPUSER_MODALS_INFO_1005 is PUSER_MODALS_INFO_1005;

   type PUSER_MODALS_INFO_1006 is access all USER_MODALS_INFO_1006;
   subtype LPUSER_MODALS_INFO_1006 is PUSER_MODALS_INFO_1006;

   type PUSER_MODALS_INFO_1007 is access all USER_MODALS_INFO_1007;
   subtype LPUSER_MODALS_INFO_1007 is PUSER_MODALS_INFO_1007;

   type PGROUP_INFO_0 is access all GROUP_INFO_0;
   subtype LPGROUP_INFO_0 is PGROUP_INFO_0;

   type PGROUP_INFO_1 is access all GROUP_INFO_1;
   subtype LPGROUP_INFO_1 is PGROUP_INFO_1;

   type PGROUP_INFO_2 is access all GROUP_INFO_2;

   type PGROUP_INFO_1002 is access all GROUP_INFO_1002;
   subtype LPGROUP_INFO_1002 is PGROUP_INFO_1002;

   type PGROUP_INFO_1005 is access all GROUP_INFO_1005;
   subtype LPGROUP_INFO_1005 is PGROUP_INFO_1005;

   type PGROUP_USERS_INFO_0 is access all GROUP_USERS_INFO_0;
   subtype LPGROUP_USERS_INFO_0 is PGROUP_USERS_INFO_0;

   type PGROUP_USERS_INFO_1 is access all GROUP_USERS_INFO_1;
   subtype LPGROUP_USERS_INFO_1 is PGROUP_USERS_INFO_1;

   type PLOCALGROUP_INFO_0 is access all LOCALGROUP_INFO_0;
   subtype LPLOCALGROUP_INFO_0 is PLOCALGROUP_INFO_0;

   type PLOCALGROUP_INFO_1 is access all LOCALGROUP_INFO_1;
   subtype LPLOCALGROUP_INFO_1 is PLOCALGROUP_INFO_1;

   type PLOCALGROUP_INFO_1002 is access all LOCALGROUP_INFO_1002;
   subtype LPLOCALGROUP_INFO_1002 is PLOCALGROUP_INFO_1002;

   type PLOCALGROUP_MEMBERS_INFO_0 is access all LOCALGROUP_MEMBERS_INFO_0;

   type LPLOCALGROUP_MEMBERS_INFO_0 is access all LOCALGROUP_MEMBERS_INFO_0;

   type PLOCALGROUP_MEMBERS_INFO_1 is access all LOCALGROUP_MEMBERS_INFO_1;

   type LPLOCALGROUP_MEMBERS_INFO_1 is access all LOCALGROUP_MEMBERS_INFO_1;

   type PLOCALGROUP_USERS_INFO_0 is access all LOCALGROUP_USERS_INFO_0;
   subtype LPLOCALGROUP_USERS_INFO_0 is PLOCALGROUP_USERS_INFO_0;

   type PACCESS_INFO_0 is access all ACCESS_INFO_0;
   subtype LPACCESS_INFO_0 is PACCESS_INFO_0;

   type PACCESS_INFO_1 is access all ACCESS_INFO_1;
   subtype LPACCESS_INFO_1 is PACCESS_INFO_1;

   type PACCESS_INFO_1002 is access all ACCESS_INFO_1002;
   subtype LPACCESS_INFO_1002 is PACCESS_INFO_1002;

   type PACCESS_LIST is access all ACCESS_LIST;
   subtype LPACCESS_LIST is PACCESS_LIST;

   type PNETLOGON_INFO_1 is access all NETLOGON_INFO_1;

   type PNETLOGON_INFO_2 is access all NETLOGON_INFO_2;

   type USER_INFO_0 is record
      usri0_name : Win32.LPWSTR;
   end record;

   type USER_INFO_1 is record
      usri1_name         : Win32.LPWSTR;
      usri1_password     : Win32.LPWSTR;
      usri1_password_age : Win32.DWORD;
      usri1_priv         : Win32.DWORD;
      usri1_home_dir     : Win32.LPWSTR;
      usri1_comment      : Win32.LPWSTR;
      usri1_flags        : Win32.DWORD;
      usri1_script_path  : Win32.LPWSTR;
   end record;

   type USER_INFO_2 is record
      usri2_name           : Win32.LPWSTR;
      usri2_password       : Win32.LPWSTR;
      usri2_password_age   : Win32.DWORD;
      usri2_priv           : Win32.DWORD;
      usri2_home_dir       : Win32.LPWSTR;
      usri2_comment        : Win32.LPWSTR;
      usri2_flags          : Win32.DWORD;
      usri2_script_path    : Win32.LPWSTR;
      usri2_auth_flags     : Win32.DWORD;
      usri2_full_name      : Win32.LPWSTR;
      usri2_usr_comment    : Win32.LPWSTR;
      usri2_parms          : Win32.LPWSTR;
      usri2_workstations   : Win32.LPWSTR;
      usri2_last_logon     : Win32.DWORD;
      usri2_last_logoff    : Win32.DWORD;
      usri2_acct_expires   : Win32.DWORD;
      usri2_max_storage    : Win32.DWORD;
      usri2_units_per_week : Win32.DWORD;
      usri2_logon_hours    : Win32.PBYTE;
      usri2_bad_pw_count   : Win32.DWORD;
      usri2_num_logons     : Win32.DWORD;
      usri2_logon_server   : Win32.LPWSTR;
      usri2_country_code   : Win32.DWORD;
      usri2_code_page      : Win32.DWORD;
   end record;

   type USER_INFO_3 is record
      usri3_name             : Win32.LPWSTR;
      usri3_password         : Win32.LPWSTR;
      usri3_password_age     : Win32.DWORD;
      usri3_priv             : Win32.DWORD;
      usri3_home_dir         : Win32.LPWSTR;
      usri3_comment          : Win32.LPWSTR;
      usri3_flags            : Win32.DWORD;
      usri3_script_path      : Win32.LPWSTR;
      usri3_auth_flags       : Win32.DWORD;
      usri3_full_name        : Win32.LPWSTR;
      usri3_usr_comment      : Win32.LPWSTR;
      usri3_parms            : Win32.LPWSTR;
      usri3_workstations     : Win32.LPWSTR;
      usri3_last_logon       : Win32.DWORD;
      usri3_last_logoff      : Win32.DWORD;
      usri3_acct_expires     : Win32.DWORD;
      usri3_max_storage      : Win32.DWORD;
      usri3_units_per_week   : Win32.DWORD;
      usri3_logon_hours      : Win32.PBYTE;
      usri3_bad_pw_count     : Win32.DWORD;
      usri3_num_logons       : Win32.DWORD;
      usri3_logon_server     : Win32.LPWSTR;
      usri3_country_code     : Win32.DWORD;
      usri3_code_page        : Win32.DWORD;
      usri3_user_id          : Win32.DWORD;
      usri3_primary_group_id : Win32.DWORD;
      usri3_profile          : Win32.LPWSTR;
      usri3_home_dir_drive   : Win32.LPWSTR;
      usri3_password_expired : Win32.DWORD;
   end record;

   type USER_INFO_10 is record
      usri10_name        : Win32.LPWSTR;
      usri10_comment     : Win32.LPWSTR;
      usri10_usr_comment : Win32.LPWSTR;
      usri10_full_name   : Win32.LPWSTR;
   end record;

   type USER_INFO_11 is record
      usri11_name           : Win32.LPWSTR;
      usri11_comment        : Win32.LPWSTR;
      usri11_usr_comment    : Win32.LPWSTR;
      usri11_full_name      : Win32.LPWSTR;
      usri11_priv           : Win32.DWORD;
      usri11_auth_flags     : Win32.DWORD;
      usri11_password_age   : Win32.DWORD;
      usri11_home_dir       : Win32.LPWSTR;
      usri11_parms          : Win32.LPWSTR;
      usri11_last_logon     : Win32.DWORD;
      usri11_last_logoff    : Win32.DWORD;
      usri11_bad_pw_count   : Win32.DWORD;
      usri11_num_logons     : Win32.DWORD;
      usri11_logon_server   : Win32.LPWSTR;
      usri11_country_code   : Win32.DWORD;
      usri11_workstations   : Win32.LPWSTR;
      usri11_max_storage    : Win32.DWORD;
      usri11_units_per_week : Win32.DWORD;
      usri11_logon_hours    : Win32.PBYTE;
      usri11_code_page      : Win32.DWORD;
   end record;

   type USER_INFO_20 is record
      usri20_name      : Win32.LPWSTR;
      usri20_full_name : Win32.LPWSTR;
      usri20_comment   : Win32.LPWSTR;
      usri20_flags     : Win32.DWORD;
      usri20_user_id   : Win32.DWORD;
   end record;

   type USER_INFO_21 is record
      usri21_password : Win32.BYTE_Array (
         0 .. Win32.Lmcons.ENCRYPTED_PWLEN - 1);
   end record;

   type USER_INFO_22 is record
      usri22_name           : Win32.LPWSTR;
      usri22_password       : Win32.BYTE_Array (
         0 .. Win32.Lmcons.ENCRYPTED_PWLEN - 1);
      usri22_password_age   : Win32.DWORD;
      usri22_priv           : Win32.DWORD;
      usri22_home_dir       : Win32.LPWSTR;
      usri22_comment        : Win32.LPWSTR;
      usri22_flags          : Win32.DWORD;
      usri22_script_path    : Win32.LPWSTR;
      usri22_auth_flags     : Win32.DWORD;
      usri22_full_name      : Win32.LPWSTR;
      usri22_usr_comment    : Win32.LPWSTR;
      usri22_parms          : Win32.LPWSTR;
      usri22_workstations   : Win32.LPWSTR;
      usri22_last_logon     : Win32.DWORD;
      usri22_last_logoff    : Win32.DWORD;
      usri22_acct_expires   : Win32.DWORD;
      usri22_max_storage    : Win32.DWORD;
      usri22_units_per_week : Win32.DWORD;
      usri22_logon_hours    : Win32.PBYTE;
      usri22_bad_pw_count   : Win32.DWORD;
      usri22_num_logons     : Win32.DWORD;
      usri22_logon_server   : Win32.LPWSTR;
      usri22_country_code   : Win32.DWORD;
      usri22_code_page      : Win32.DWORD;
   end record;

   type USER_INFO_1003 is record
      usri1003_password : Win32.LPWSTR;
   end record;

   type USER_INFO_1005 is record
      usri1005_priv : Win32.DWORD;
   end record;

   type USER_INFO_1006 is record
      usri1006_home_dir : Win32.LPWSTR;
   end record;

   type USER_INFO_1007 is record
      usri1007_comment : Win32.LPWSTR;
   end record;

   type USER_INFO_1008 is record
      usri1008_flags : Win32.DWORD;
   end record;

   type USER_INFO_1009 is record
      usri1009_script_path : Win32.LPWSTR;
   end record;

   type USER_INFO_1010 is record
      usri1010_auth_flags : Win32.DWORD;
   end record;

   type USER_INFO_1011 is record
      usri1011_full_name : Win32.LPWSTR;
   end record;

   type USER_INFO_1012 is record
      usri1012_usr_comment : Win32.LPWSTR;
   end record;

   type USER_INFO_1013 is record
      usri1013_parms : Win32.LPWSTR;
   end record;

   type USER_INFO_1014 is record
      usri1014_workstations : Win32.LPWSTR;
   end record;

   type USER_INFO_1017 is record
      usri1017_acct_expires : Win32.DWORD;
   end record;

   type USER_INFO_1018 is record
      usri1018_max_storage : Win32.DWORD;
   end record;

   type USER_INFO_1020 is record
      usri1020_units_per_week : Win32.DWORD;
      usri1020_logon_hours    : Win32.LPBYTE;
   end record;

   type USER_INFO_1023 is record
      usri1023_logon_server : Win32.LPWSTR;
   end record;

   type USER_INFO_1024 is record
      usri1024_country_code : Win32.DWORD;
   end record;

   type USER_INFO_1025 is record
      usri1025_code_page : Win32.DWORD;
   end record;

   type USER_INFO_1051 is record
      usri1051_primary_group_id : Win32.DWORD;
   end record;

   type USER_INFO_1052 is record
      usri1052_profile : Win32.LPWSTR;
   end record;

   type USER_INFO_1053 is record
      usri1053_home_dir_drive : Win32.LPWSTR;
   end record;

   type USER_MODALS_INFO_0 is record
      usrmod0_min_passwd_len    : Win32.DWORD;
      usrmod0_max_passwd_age    : Win32.DWORD;
      usrmod0_min_passwd_age    : Win32.DWORD;
      usrmod0_force_logoff      : Win32.DWORD;
      usrmod0_password_hist_len : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1 is record
      usrmod1_role    : Win32.DWORD;
      usrmod1_primary : Win32.LPWSTR;
   end record;

   type USER_MODALS_INFO_2 is record
      usrmod2_domain_name : Win32.LPWSTR;
      usrmod2_domain_id   : Win32.Winnt.PSID;
   end record;

   type USER_MODALS_INFO_3 is record
      usrmod3_lockout_duration           : Win32.DWORD;
      usrmod3_lockout_observation_window : Win32.DWORD;
      usrmod3_lockout_threshold          : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1001 is record
      usrmod1001_min_passwd_len : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1002 is record
      usrmod1002_max_passwd_age : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1003 is record
      usrmod1003_min_passwd_age : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1004 is record
      usrmod1004_force_logoff : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1005 is record
      usrmod1005_password_hist_len : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1006 is record
      usrmod1006_role : Win32.DWORD;
   end record;

   type USER_MODALS_INFO_1007 is record
      usrmod1007_primary : Win32.LPWSTR;
   end record;

   type GROUP_INFO_0 is record
      grpi0_name : Win32.LPWSTR;
   end record;

   type GROUP_INFO_1 is record
      grpi1_name    : Win32.LPWSTR;
      grpi1_comment : Win32.LPWSTR;
   end record;

   type GROUP_INFO_2 is record
      grpi2_name       : Win32.LPWSTR;
      grpi2_comment    : Win32.LPWSTR;
      grpi2_group_id   : Win32.DWORD;
      grpi2_attributes : Win32.DWORD;
   end record;

   type GROUP_INFO_1002 is record
      grpi1002_comment : Win32.LPWSTR;
   end record;

   type GROUP_INFO_1005 is record
      grpi1005_attributes : Win32.DWORD;
   end record;

   type GROUP_USERS_INFO_0 is record
      grui0_name : Win32.LPWSTR;
   end record;

   type GROUP_USERS_INFO_1 is record
      grui1_name       : Win32.LPWSTR;
      grui1_attributes : Win32.DWORD;
   end record;

   type LOCALGROUP_INFO_0 is record
      lgrpi0_name : Win32.LPWSTR;
   end record;

   type LOCALGROUP_INFO_1 is record
      lgrpi1_name    : Win32.LPWSTR;
      lgrpi1_comment : Win32.LPWSTR;
   end record;

   type LOCALGROUP_INFO_1002 is record
      lgrpi1002_comment : Win32.LPWSTR;
   end record;

   type LOCALGROUP_MEMBERS_INFO_0 is record
      lgrmi0_sid : Win32.Winnt.PSID;
   end record;

   type LOCALGROUP_MEMBERS_INFO_1 is record
      lgrmi1_sid      : Win32.Winnt.PSID;
      lgrmi1_sidusage : Win32.Winnt.SID_NAME_USE;
      lgrmi1_name     : Win32.LPWSTR;
   end record;

   type LOCALGROUP_USERS_INFO_0 is record
      lgrui0_name : Win32.LPWSTR;
   end record;

   type ACCESS_INFO_0 is record
      acc0_resource_name : Win32.Winnt.LPTSTR;
   end record;

   type ACCESS_INFO_1 is record
      acc1_resource_name : Win32.Winnt.LPTSTR;
      acc1_attr          : Win32.DWORD;
      acc1_count         : Win32.DWORD;
   end record;

   type ACCESS_INFO_1002 is record
      acc1002_attr : Win32.DWORD;
   end record;

   type ACCESS_LIST is record
      acl_ugname : Win32.Winnt.LPTSTR;
      acl_access : Win32.DWORD;
   end record;

   type NETLOGON_INFO_1 is record
      netlog1_flags                 : Win32.DWORD;
      netlog1_pdc_connection_status : Win32.DWORD;
   end record;

   type NETLOGON_INFO_2 is record
      netlog2_flags                 : Win32.DWORD;
      netlog2_pdc_connection_status : Win32.DWORD;
      netlog2_trusted_dc_name       : Win32.LPWSTR;
      netlog2_tc_connection_status  : Win32.DWORD;
   end record;

   function NetUserAdd
     (servername : Win32.LPWSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetUserEnum
     (servername    : Win32.LPWSTR;
      level         : Win32.DWORD;
      filter        : Win32.DWORD;
      bufptr        : access Win32.LPBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetUserGetInfo
     (servername : Win32.LPWSTR;
      username   : Win32.LPWSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD;

   function NetUserSetInfo
     (servername : Win32.LPWSTR;
      username   : Win32.LPWSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetUserDel
     (servername : Win32.LPWSTR;
      username   : Win32.LPWSTR)
      return Win32.DWORD;

   function NetUserGetGroups
     (servername   : Win32.LPWSTR;
      username     : Win32.LPWSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.LPBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD)
      return Win32.DWORD;

   function NetUserSetGroups
     (servername  : Win32.LPWSTR;
      username    : Win32.LPWSTR;
      level       : Win32.DWORD;
      buf         : Win32.LPBYTE;
      num_entries : Win32.DWORD)
      return Win32.DWORD;

   function NetUserGetLocalGroups
     (servername   : Win32.LPWSTR;
      username     : Win32.LPWSTR;
      level        : Win32.DWORD;
      flags        : Win32.DWORD;
      bufptr       : access Win32.LPBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD)
      return Win32.DWORD;

   function NetUserModalsGet
     (servername : Win32.LPWSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD;

   function NetUserModalsSet
     (servername : Win32.LPWSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetGroupAdd
     (servername : Win32.LPWSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetGroupAddUser
     (servername : Win32.LPWSTR;
      GroupName  : Win32.LPWSTR;
      username   : Win32.LPWSTR)
      return Win32.DWORD;

   function NetGroupEnum
     (servername    : Win32.LPWSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.LPBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetGroupGetInfo
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD;

   function NetGroupSetInfo
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetGroupDel
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR)
      return Win32.DWORD;

   function NetGroupDelUser
     (servername : Win32.LPWSTR;
      GroupName  : Win32.LPWSTR;
      Username   : Win32.LPWSTR)
      return Win32.DWORD;

   function NetGroupGetUsers
     (servername   : Win32.LPWSTR;
      groupname    : Win32.LPWSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.LPBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      ResumeHandle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetGroupSetUsers
     (servername   : Win32.LPWSTR;
      groupname    : Win32.LPWSTR;
      level        : Win32.DWORD;
      buf          : Win32.LPBYTE;
      totalentries : Win32.DWORD)
      return Win32.DWORD;

   function NetLocalGroupAdd
     (servername : Win32.LPWSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetLocalGroupAddMember
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR;
      membersid  : Win32.Winnt.PSID)
      return Win32.DWORD;

   function NetLocalGroupEnum
     (servername   : Win32.LPWSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.LPBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetLocalGroupGetInfo
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD;

   function NetLocalGroupSetInfo
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetLocalGroupDel
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR)
      return Win32.DWORD;

   function NetLocalGroupDelMember
     (servername : Win32.LPWSTR;
      groupname  : Win32.LPWSTR;
      membersid  : Win32.Winnt.PSID)
      return Win32.DWORD;

   function NetLocalGroupGetMembers
     (servername     : Win32.LPWSTR;
      localgroupname : Win32.LPWSTR;
      level          : Win32.DWORD;
      bufptr         : access Win32.LPBYTE;
      prefmaxlen     : Win32.DWORD;
      entriesread    : Win32.LPDWORD;
      totalentries   : Win32.LPDWORD;
      resumehandle   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetLocalGroupSetMembers
     (servername   : Win32.LPWSTR;
      groupname    : Win32.LPWSTR;
      level        : Win32.DWORD;
      buf          : Win32.LPBYTE;
      totalentries : Win32.DWORD)
      return Win32.DWORD;

   function RxNetAccessAdd
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetAccessAdd
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD renames RxNetAccessAdd;

   function RxNetAccessEnum
     (servername    : Win32.Winnt.LPTSTR;
      BasePath      : Win32.Winnt.LPTSTR;
      Recursive     : Win32.DWORD;
      level         : Win32.DWORD;
      bufptr        : access Win32.LPBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetAccessEnum
     (servername    : Win32.Winnt.LPTSTR;
      BasePath      : Win32.Winnt.LPTSTR;
      Recursive     : Win32.DWORD;
      level         : Win32.DWORD;
      bufptr        : access Win32.LPBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD renames RxNetAccessEnum;

   function RxNetAccessGetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD;

   function NetAccessGetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD renames RxNetAccessGetInfo;

   function RxNetAccessSetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetAccessSetInfo
     (servername : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD renames RxNetAccessSetInfo;

   function RxNetAccessDel
     (servername : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetAccessDel
     (servername : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR)
      return Win32.DWORD renames RxNetAccessDel;

   function RxNetAccessGetUserPerms
     (servername : Win32.Winnt.LPTSTR;
      UGname     : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR;
      Perms      : Win32.LPDWORD)
      return Win32.DWORD;

   function NetAccessGetUserPerms
     (servername : Win32.Winnt.LPTSTR;
      UGname     : Win32.Winnt.LPTSTR;
      resource   : Win32.Winnt.LPTSTR;
      Perms      : Win32.LPDWORD)
      return Win32.DWORD renames RxNetAccessGetUserPerms;

   function NetGetDCName
     (servername : Win32.LPWSTR;
      domainname : Win32.LPWSTR;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD;

   function NetGetAnyDCName
     (servername : Win32.LPWSTR;
      domainname : Win32.LPWSTR;
      bufptr     : access Win32.LPBYTE)
      return Win32.DWORD;

   function I_NetLogonControl
     (ServerName   : Win32.LPWSTR;
      FunctionCode : Win32.DWORD;
      QueryLevel   : Win32.DWORD;
      Buffer       : access Win32.LPBYTE)
      return Win32.DWORD;

   function I_NetLogonControl2
     (ServerName   : Win32.LPWSTR;
      FunctionCode : Win32.DWORD;
      QueryLevel   : Win32.DWORD;
      Data         : Win32.LPBYTE;
      Buffer       : access Win32.LPBYTE)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, USER_INFO_0);
   pragma Convention (C, USER_INFO_1);
   pragma Convention (C, USER_INFO_2);
   pragma Convention (C, USER_INFO_3);
   pragma Convention (C_Pass_By_Copy, USER_INFO_10);
   pragma Convention (C, USER_INFO_11);
   pragma Convention (C, USER_INFO_20);
   pragma Convention (C_Pass_By_Copy, USER_INFO_21);
   pragma Convention (C, USER_INFO_22);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1003);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1005);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1006);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1007);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1008);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1009);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1010);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1011);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1012);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1013);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1014);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1017);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1018);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1020);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1023);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1024);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1025);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1051);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1052);
   pragma Convention (C_Pass_By_Copy, USER_INFO_1053);
   pragma Convention (C, USER_MODALS_INFO_0);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_2);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_3);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1001);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1002);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1003);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1004);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1005);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1006);
   pragma Convention (C_Pass_By_Copy, USER_MODALS_INFO_1007);
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_0);
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_1);
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_2);
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_1002);
   pragma Convention (C_Pass_By_Copy, GROUP_INFO_1005);
   pragma Convention (C_Pass_By_Copy, GROUP_USERS_INFO_0);
   pragma Convention (C_Pass_By_Copy, GROUP_USERS_INFO_1);
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_INFO_0);
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_INFO_1);
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_INFO_1002);
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_MEMBERS_INFO_0);
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_MEMBERS_INFO_1);
   pragma Convention (C_Pass_By_Copy, LOCALGROUP_USERS_INFO_0);
   pragma Convention (C_Pass_By_Copy, ACCESS_INFO_0);
   pragma Convention (C_Pass_By_Copy, ACCESS_INFO_1);
   pragma Convention (C_Pass_By_Copy, ACCESS_INFO_1002);
   pragma Convention (C_Pass_By_Copy, ACCESS_LIST);
   pragma Convention (C_Pass_By_Copy, NETLOGON_INFO_1);
   pragma Convention (C_Pass_By_Copy, NETLOGON_INFO_2);

   pragma Import (Stdcall, NetUserAdd, "NetUserAdd");
   pragma Import (Stdcall, NetUserEnum, "NetUserEnum");
   pragma Import (Stdcall, NetUserGetInfo, "NetUserGetInfo");
   pragma Import (Stdcall, NetUserSetInfo, "NetUserSetInfo");
   pragma Import (Stdcall, NetUserDel, "NetUserDel");
   pragma Import (Stdcall, NetUserGetGroups, "NetUserGetGroups");
   pragma Import (Stdcall, NetUserSetGroups, "NetUserSetGroups");
   pragma Import (Stdcall, NetUserGetLocalGroups, "NetUserGetLocalGroups");
   pragma Import (Stdcall, NetUserModalsGet, "NetUserModalsGet");
   pragma Import (Stdcall, NetUserModalsSet, "NetUserModalsSet");
   pragma Import (Stdcall, NetGroupAdd, "NetGroupAdd");
   pragma Import (Stdcall, NetGroupAddUser, "NetGroupAddUser");
   pragma Import (Stdcall, NetGroupEnum, "NetGroupEnum");
   pragma Import (Stdcall, NetGroupGetInfo, "NetGroupGetInfo");
   pragma Import (Stdcall, NetGroupSetInfo, "NetGroupSetInfo");
   pragma Import (Stdcall, NetGroupDel, "NetGroupDel");
   pragma Import (Stdcall, NetGroupDelUser, "NetGroupDelUser");
   pragma Import (Stdcall, NetGroupGetUsers, "NetGroupGetUsers");
   pragma Import (Stdcall, NetGroupSetUsers, "NetGroupSetUsers");
   pragma Import (Stdcall, NetLocalGroupAdd, "NetLocalGroupAdd");
   pragma Import (Stdcall, NetLocalGroupAddMember, "NetLocalGroupAddMember");
   pragma Import (Stdcall, NetLocalGroupEnum, "NetLocalGroupEnum");
   pragma Import (Stdcall, NetLocalGroupGetInfo, "NetLocalGroupGetInfo");
   pragma Import (Stdcall, NetLocalGroupSetInfo, "NetLocalGroupSetInfo");
   pragma Import (Stdcall, NetLocalGroupDel, "NetLocalGroupDel");
   pragma Import (Stdcall, NetLocalGroupDelMember, "NetLocalGroupDelMember");
   pragma Import
     (Stdcall,
      NetLocalGroupGetMembers,
      "NetLocalGroupGetMembers");
   pragma Import
     (Stdcall,
      NetLocalGroupSetMembers,
      "NetLocalGroupSetMembers");
   pragma Import (Stdcall, RxNetAccessAdd, "RxNetAccessAdd");
   pragma Import (Stdcall, RxNetAccessEnum, "RxNetAccessEnum");
   pragma Import (Stdcall, RxNetAccessGetInfo, "RxNetAccessGetInfo");
   pragma Import (Stdcall, RxNetAccessSetInfo, "RxNetAccessSetInfo");
   pragma Import (Stdcall, RxNetAccessDel, "RxNetAccessDel");
   pragma Import
     (Stdcall,
      RxNetAccessGetUserPerms,
      "RxNetAccessGetUserPerms");
   pragma Import (Stdcall, NetGetDCName, "NetGetDCName");
   pragma Import (Stdcall, NetGetAnyDCName, "NetGetAnyDCName");
   pragma Import (Stdcall, I_NetLogonControl, "I_NetLogonControl");
   pragma Import (Stdcall, I_NetLogonControl2, "I_NetLogonControl2");

end Win32.Lmaccess;
