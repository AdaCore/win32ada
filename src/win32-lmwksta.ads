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

package Win32.Lmwksta is

   WKSTA_PLATFORM_ID_PARMNUM             : constant := 100;
   WKSTA_COMPUTERNAME_PARMNUM            : constant := 1;
   WKSTA_LANGROUP_PARMNUM                : constant := 2;
   WKSTA_VER_MAJOR_PARMNUM               : constant := 4;
   WKSTA_VER_MINOR_PARMNUM               : constant := 5;
   WKSTA_LOGGED_ON_USERS_PARMNUM         : constant := 6;
   WKSTA_LANROOT_PARMNUM                 : constant := 7;
   WKSTA_LOGON_DOMAIN_PARMNUM            : constant := 8;
   WKSTA_LOGON_SERVER_PARMNUM            : constant := 9;
   WKSTA_CHARWAIT_PARMNUM                : constant := 10;
   WKSTA_CHARTIME_PARMNUM                : constant := 11;
   WKSTA_CHARCOUNT_PARMNUM               : constant := 12;
   WKSTA_KEEPCONN_PARMNUM                : constant := 13;
   WKSTA_KEEPSEARCH_PARMNUM              : constant := 14;
   WKSTA_MAXCMDS_PARMNUM                 : constant := 15;
   WKSTA_NUMWORKBUF_PARMNUM              : constant := 16;
   WKSTA_MAXWRKCACHE_PARMNUM             : constant := 17;
   WKSTA_SESSTIMEOUT_PARMNUM             : constant := 18;
   WKSTA_SIZERROR_PARMNUM                : constant := 19;
   WKSTA_NUMALERTS_PARMNUM               : constant := 20;
   WKSTA_NUMSERVICES_PARMNUM             : constant := 21;
   WKSTA_NUMCHARBUF_PARMNUM              : constant := 22;
   WKSTA_SIZCHARBUF_PARMNUM              : constant := 23;
   WKSTA_ERRLOGSZ_PARMNUM                : constant := 27;
   WKSTA_PRINTBUFTIME_PARMNUM            : constant := 28;
   WKSTA_SIZWORKBUF_PARMNUM              : constant := 29;
   WKSTA_MAILSLOTS_PARMNUM               : constant := 30;
   WKSTA_NUMDGRAMBUF_PARMNUM             : constant := 31;
   WKSTA_WRKHEURISTICS_PARMNUM           : constant := 32;
   WKSTA_MAXTHREADS_PARMNUM              : constant := 33;
   WKSTA_LOCKQUOTA_PARMNUM               : constant := 41;
   WKSTA_LOCKINCREMENT_PARMNUM           : constant := 42;
   WKSTA_LOCKMAXIMUM_PARMNUM             : constant := 43;
   WKSTA_PIPEINCREMENT_PARMNUM           : constant := 44;
   WKSTA_PIPEMAXIMUM_PARMNUM             : constant := 45;
   WKSTA_DORMANTFILELIMIT_PARMNUM        : constant := 46;
   WKSTA_CACHEFILETIMEOUT_PARMNUM        : constant := 47;
   WKSTA_USEOPPORTUNISTICLOCKING_PARMNUM : constant := 48;
   WKSTA_USEUNLOCKBEHIND_PARMNUM         : constant := 49;
   WKSTA_USECLOSEBEHIND_PARMNUM          : constant := 50;
   WKSTA_BUFFERNAMEDPIPES_PARMNUM        : constant := 51;
   WKSTA_USELOCKANDREADANDUNLOCK_PARMNUM : constant := 52;
   WKSTA_UTILIZENTCACHING_PARMNUM        : constant := 53;
   WKSTA_USERAWREAD_PARMNUM              : constant := 54;
   WKSTA_USERAWWRITE_PARMNUM             : constant := 55;
   WKSTA_USEWRITERAWWITHDATA_PARMNUM     : constant := 56;
   WKSTA_USEENCRYPTION_PARMNUM           : constant := 57;
   WKSTA_BUFFILESWITHDENYWRITE_PARMNUM   : constant := 58;
   WKSTA_BUFFERREADONLYFILES_PARMNUM     : constant := 59;
   WKSTA_FORCECORECREATEMODE_PARMNUM     : constant := 60;
   WKSTA_USE512BYTESMAXTRANSFER_PARMNUM  : constant := 61;
   WKSTA_READAHEADTHRUPUT_PARMNUM        : constant := 62;
   WKSTA_OTH_DOMAINS_PARMNUM             : constant := 101;
   TRANSPORT_QUALITYOFSERVICE_PARMNUM    : constant := 201;
   TRANSPORT_NAME_PARMNUM                : constant := 202;

   type WKSTA_INFO_100;
   type WKSTA_INFO_101;
   type WKSTA_INFO_102;
   type WKSTA_INFO_302;
   type WKSTA_INFO_402;
   type WKSTA_INFO_502;
   type WKSTA_INFO_1010;
   type WKSTA_INFO_1011;
   type WKSTA_INFO_1012;
   type WKSTA_INFO_1027;
   type WKSTA_INFO_1028;
   type WKSTA_INFO_1032;
   type WKSTA_INFO_1013;
   type WKSTA_INFO_1018;
   type WKSTA_INFO_1023;
   type WKSTA_INFO_1033;
   type WKSTA_INFO_1041;
   type WKSTA_INFO_1042;
   type WKSTA_INFO_1043;
   type WKSTA_INFO_1044;
   type WKSTA_INFO_1045;
   type WKSTA_INFO_1046;
   type WKSTA_INFO_1047;
   type WKSTA_INFO_1048;
   type WKSTA_INFO_1049;
   type WKSTA_INFO_1050;
   type WKSTA_INFO_1051;
   type WKSTA_INFO_1052;
   type WKSTA_INFO_1053;
   type WKSTA_INFO_1054;
   type WKSTA_INFO_1055;
   type WKSTA_INFO_1056;
   type WKSTA_INFO_1057;
   type WKSTA_INFO_1058;
   type WKSTA_INFO_1059;
   type WKSTA_INFO_1060;
   type WKSTA_INFO_1061;
   type WKSTA_INFO_1062;
   type WKSTA_USER_INFO_0;
   type WKSTA_USER_INFO_1;
   type WKSTA_USER_INFO_1101;
   type WKSTA_TRANSPORT_INFO_0;

   type PWKSTA_INFO_100 is access all WKSTA_INFO_100;
   subtype LPWKSTA_INFO_100 is PWKSTA_INFO_100;
   type PWKSTA_INFO_101 is access all WKSTA_INFO_101;
   subtype LPWKSTA_INFO_101 is PWKSTA_INFO_101;
   type PWKSTA_INFO_102 is access all WKSTA_INFO_102;
   subtype LPWKSTA_INFO_102 is PWKSTA_INFO_102;
   type PWKSTA_INFO_302 is access all WKSTA_INFO_302;
   subtype LPWKSTA_INFO_302 is PWKSTA_INFO_302;
   type PWKSTA_INFO_402 is access all WKSTA_INFO_402;
   subtype LPWKSTA_INFO_402 is PWKSTA_INFO_402;
   type PWKSTA_INFO_502 is access all WKSTA_INFO_502;
   subtype LPWKSTA_INFO_502 is PWKSTA_INFO_502;
   type PWKSTA_INFO_1010 is access all WKSTA_INFO_1010;
   subtype LPWKSTA_INFO_1010 is PWKSTA_INFO_1010;
   type PWKSTA_INFO_1011 is access all WKSTA_INFO_1011;
   subtype LPWKSTA_INFO_1011 is PWKSTA_INFO_1011;
   type PWKSTA_INFO_1012 is access all WKSTA_INFO_1012;
   subtype LPWKSTA_INFO_1012 is PWKSTA_INFO_1012;
   type PWKSTA_INFO_1027 is access all WKSTA_INFO_1027;
   subtype LPWKSTA_INFO_1027 is PWKSTA_INFO_1027;
   type PWKSTA_INFO_1028 is access all WKSTA_INFO_1028;
   subtype LPWKSTA_INFO_1028 is PWKSTA_INFO_1028;
   type PWKSTA_INFO_1032 is access all WKSTA_INFO_1032;
   subtype LPWKSTA_INFO_1032 is PWKSTA_INFO_1032;
   type PWKSTA_INFO_1013 is access all WKSTA_INFO_1013;
   subtype LPWKSTA_INFO_1013 is PWKSTA_INFO_1013;
   type PWKSTA_INFO_1018 is access all WKSTA_INFO_1018;
   subtype LPWKSTA_INFO_1018 is PWKSTA_INFO_1018;
   type PWKSTA_INFO_1023 is access all WKSTA_INFO_1023;
   subtype LPWKSTA_INFO_1023 is PWKSTA_INFO_1023;
   type PWKSTA_INFO_1033 is access all WKSTA_INFO_1033;
   subtype LPWKSTA_INFO_1033 is PWKSTA_INFO_1033;
   type PWKSTA_INFO_1041 is access all WKSTA_INFO_1041;
   subtype LPWKSTA_INFO_1041 is PWKSTA_INFO_1041;
   type PWKSTA_INFO_1042 is access all WKSTA_INFO_1042;
   subtype LPWKSTA_INFO_1042 is PWKSTA_INFO_1042;
   type PWKSTA_INFO_1043 is access all WKSTA_INFO_1043;
   subtype LPWKSTA_INFO_1043 is PWKSTA_INFO_1043;
   type PWKSTA_INFO_1044 is access all WKSTA_INFO_1044;
   subtype LPWKSTA_INFO_1044 is PWKSTA_INFO_1044;
   type PWKSTA_INFO_1045 is access all WKSTA_INFO_1045;
   subtype LPWKSTA_INFO_1045 is PWKSTA_INFO_1045;
   type PWKSTA_INFO_1046 is access all WKSTA_INFO_1046;
   subtype LPWKSTA_INFO_1046 is PWKSTA_INFO_1046;
   type PWKSTA_INFO_1047 is access all WKSTA_INFO_1047;
   subtype LPWKSTA_INFO_1047 is PWKSTA_INFO_1047;
   type PWKSTA_INFO_1048 is access all WKSTA_INFO_1048;
   subtype LPWKSTA_INFO_1048 is PWKSTA_INFO_1048;
   type PWKSTA_INFO_1049 is access all WKSTA_INFO_1049;
   subtype LPWKSTA_INFO_1049 is PWKSTA_INFO_1049;
   type PWKSTA_INFO_1050 is access all WKSTA_INFO_1050;
   subtype LPWKSTA_INFO_1050 is PWKSTA_INFO_1050;
   type PWKSTA_INFO_1051 is access all WKSTA_INFO_1051;
   subtype LPWKSTA_INFO_1051 is PWKSTA_INFO_1051;
   type PWKSTA_INFO_1052 is access all WKSTA_INFO_1052;
   subtype LPWKSTA_INFO_1052 is PWKSTA_INFO_1052;
   type PWKSTA_INFO_1053 is access all WKSTA_INFO_1053;
   subtype LPWKSTA_INFO_1053 is PWKSTA_INFO_1053;
   type PWKSTA_INFO_1054 is access all WKSTA_INFO_1054;
   subtype LPWKSTA_INFO_1054 is PWKSTA_INFO_1054;
   type PWKSTA_INFO_1055 is access all WKSTA_INFO_1055;
   subtype LPWKSTA_INFO_1055 is PWKSTA_INFO_1055;
   type PWKSTA_INFO_1056 is access all WKSTA_INFO_1056;
   subtype LPWKSTA_INFO_1056 is PWKSTA_INFO_1056;
   type PWKSTA_INFO_1057 is access all WKSTA_INFO_1057;
   subtype LPWKSTA_INFO_1057 is PWKSTA_INFO_1057;
   type PWKSTA_INFO_1058 is access all WKSTA_INFO_1058;
   subtype LPWKSTA_INFO_1058 is PWKSTA_INFO_1058;
   type PWKSTA_INFO_1059 is access all WKSTA_INFO_1059;
   subtype LPWKSTA_INFO_1059 is PWKSTA_INFO_1059;
   type PWKSTA_INFO_1060 is access all WKSTA_INFO_1060;
   subtype LPWKSTA_INFO_1060 is PWKSTA_INFO_1060;
   type PWKSTA_INFO_1061 is access all WKSTA_INFO_1061;
   subtype LPWKSTA_INFO_1061 is PWKSTA_INFO_1061;
   type PWKSTA_INFO_1062 is access all WKSTA_INFO_1062;
   subtype LPWKSTA_INFO_1062 is PWKSTA_INFO_1062;
   type PWKSTA_USER_INFO_0 is access all WKSTA_USER_INFO_0;
   subtype LPWKSTA_USER_INFO_0 is PWKSTA_USER_INFO_0;
   type PWKSTA_USER_INFO_1 is access all WKSTA_USER_INFO_1;
   subtype LPWKSTA_USER_INFO_1 is PWKSTA_USER_INFO_1;
   type PWKSTA_USER_INFO_1101 is access all WKSTA_USER_INFO_1101;
   subtype LPWKSTA_USER_INFO_1101 is PWKSTA_USER_INFO_1101;
   type PWKSTA_TRANSPORT_INFO_0 is access all WKSTA_TRANSPORT_INFO_0;
   subtype LPWKSTA_TRANSPORT_INFO_0 is PWKSTA_TRANSPORT_INFO_0;

   type WKSTA_INFO_100 is record
      wki100_platform_id  : Win32.DWORD;
      wki100_computername : Win32.Winnt.LPTSTR;
      wki100_langroup     : Win32.Winnt.LPTSTR;
      wki100_ver_major    : Win32.DWORD;
      wki100_ver_minor    : Win32.DWORD;
   end record;

   type WKSTA_INFO_101 is record
      wki101_platform_id  : Win32.DWORD;
      wki101_computername : Win32.Winnt.LPTSTR;
      wki101_langroup     : Win32.Winnt.LPTSTR;
      wki101_ver_major    : Win32.DWORD;
      wki101_ver_minor    : Win32.DWORD;
      wki101_lanroot      : Win32.Winnt.LPTSTR;
   end record;

   type WKSTA_INFO_102 is record
      wki102_platform_id     : Win32.DWORD;
      wki102_computername    : Win32.Winnt.LPTSTR;
      wki102_langroup        : Win32.Winnt.LPTSTR;
      wki102_ver_major       : Win32.DWORD;
      wki102_ver_minor       : Win32.DWORD;
      wki102_lanroot         : Win32.Winnt.LPTSTR;
      wki102_logged_on_users : Win32.DWORD;
   end record;

   type WKSTA_INFO_302 is record
      wki302_char_wait                : Win32.DWORD;
      wki302_collection_time          : Win32.DWORD;
      wki302_maximum_collection_count : Win32.DWORD;
      wki302_keep_conn                : Win32.DWORD;
      wki302_keep_search              : Win32.DWORD;
      wki302_max_cmds                 : Win32.DWORD;
      wki302_num_work_buf             : Win32.DWORD;
      wki302_siz_work_buf             : Win32.DWORD;
      wki302_max_wrk_cache            : Win32.DWORD;
      wki302_sess_timeout             : Win32.DWORD;
      wki302_siz_error                : Win32.DWORD;
      wki302_num_alerts               : Win32.DWORD;
      wki302_num_services             : Win32.DWORD;
      wki302_errlog_sz                : Win32.DWORD;
      wki302_print_buf_time           : Win32.DWORD;
      wki302_num_char_buf             : Win32.DWORD;
      wki302_siz_char_buf             : Win32.DWORD;
      wki302_wrk_heuristics           : Win32.Winnt.LPTSTR;
      wki302_mailslots                : Win32.DWORD;
      wki302_num_dgram_buf            : Win32.DWORD;
   end record;

   type WKSTA_INFO_402 is record
      wki402_char_wait                : Win32.DWORD;
      wki402_collection_time          : Win32.DWORD;
      wki402_maximum_collection_count : Win32.DWORD;
      wki402_keep_conn                : Win32.DWORD;
      wki402_keep_search              : Win32.DWORD;
      wki402_max_cmds                 : Win32.DWORD;
      wki402_num_work_buf             : Win32.DWORD;
      wki402_siz_work_buf             : Win32.DWORD;
      wki402_max_wrk_cache            : Win32.DWORD;
      wki402_sess_timeout             : Win32.DWORD;
      wki402_siz_error                : Win32.DWORD;
      wki402_num_alerts               : Win32.DWORD;
      wki402_num_services             : Win32.DWORD;
      wki402_errlog_sz                : Win32.DWORD;
      wki402_print_buf_time           : Win32.DWORD;
      wki402_num_char_buf             : Win32.DWORD;
      wki402_siz_char_buf             : Win32.DWORD;
      wki402_wrk_heuristics           : Win32.Winnt.LPTSTR;
      wki402_mailslots                : Win32.DWORD;
      wki402_num_dgram_buf            : Win32.DWORD;
      wki402_max_threads              : Win32.DWORD;
   end record;

   type WKSTA_INFO_502 is record
      wki502_char_wait                              : Win32.DWORD;
      wki502_collection_time                        : Win32.DWORD;
      wki502_maximum_collection_count               : Win32.DWORD;
      wki502_keep_conn                              : Win32.DWORD;
      wki502_max_cmds                               : Win32.DWORD;
      wki502_sess_timeout                           : Win32.DWORD;
      wki502_siz_char_buf                           : Win32.DWORD;
      wki502_max_threads                            : Win32.DWORD;
      wki502_lock_quota                             : Win32.DWORD;
      wki502_lock_increment                         : Win32.DWORD;
      wki502_lock_maximum                           : Win32.DWORD;
      wki502_pipe_increment                         : Win32.DWORD;
      wki502_pipe_maximum                           : Win32.DWORD;
      wki502_cache_file_timeout                     : Win32.DWORD;
      wki502_dormant_file_limit                     : Win32.DWORD;
      wki502_read_ahead_throughput                  : Win32.DWORD;
      wki502_num_mailslot_buffers                   : Win32.DWORD;
      wki502_num_srv_announce_buffers               : Win32.DWORD;
      wki502_max_illegal_datagram_events            : Win32.DWORD;
      wki502_illegal_datagram_event_reset_frequency : Win32.DWORD;
      wki502_log_election_packets                   : Win32.BOOL;
      wki502_use_opportunistic_locking              : Win32.BOOL;
      wki502_use_unlock_behind                      : Win32.BOOL;
      wki502_use_close_behind                       : Win32.BOOL;
      wki502_buf_named_pipes                        : Win32.BOOL;
      wki502_use_lock_read_unlock                   : Win32.BOOL;
      wki502_utilize_nt_caching                     : Win32.BOOL;
      wki502_use_raw_read                           : Win32.BOOL;
      wki502_use_raw_write                          : Win32.BOOL;
      wki502_use_write_raw_data                     : Win32.BOOL;
      wki502_use_encryption                         : Win32.BOOL;
      wki502_buf_files_deny_write                   : Win32.BOOL;
      wki502_buf_read_only_files                    : Win32.BOOL;
      wki502_force_core_create_mode                 : Win32.BOOL;
      wki502_use_512_byte_max_transfer              : Win32.BOOL;
   end record;

   type WKSTA_INFO_1010 is record
      wki1010_char_wait : Win32.DWORD;
   end record;

   type WKSTA_INFO_1011 is record
      wki1011_collection_time : Win32.DWORD;
   end record;

   type WKSTA_INFO_1012 is record
      wki1012_maximum_collection_count : Win32.DWORD;
   end record;

   type WKSTA_INFO_1027 is record
      wki1027_errlog_sz : Win32.DWORD;
   end record;

   type WKSTA_INFO_1028 is record
      wki1028_print_buf_time : Win32.DWORD;
   end record;

   type WKSTA_INFO_1032 is record
      wki1032_wrk_heuristics : Win32.DWORD;
   end record;

   type WKSTA_INFO_1013 is record
      wki1013_keep_conn : Win32.DWORD;
   end record;

   type WKSTA_INFO_1018 is record
      wki1018_sess_timeout : Win32.DWORD;
   end record;

   type WKSTA_INFO_1023 is record
      wki1023_siz_char_buf : Win32.DWORD;
   end record;

   type WKSTA_INFO_1033 is record
      wki1033_max_threads : Win32.DWORD;
   end record;

   type WKSTA_INFO_1041 is record
      wki1041_lock_quota : Win32.DWORD;
   end record;

   type WKSTA_INFO_1042 is record
      wki1042_lock_increment : Win32.DWORD;
   end record;

   type WKSTA_INFO_1043 is record
      wki1043_lock_maximum : Win32.DWORD;
   end record;

   type WKSTA_INFO_1044 is record
      wki1044_pipe_increment : Win32.DWORD;
   end record;

   type WKSTA_INFO_1045 is record
      wki1045_pipe_maximum : Win32.DWORD;
   end record;

   type WKSTA_INFO_1046 is record
      wki1046_dormant_file_limit : Win32.DWORD;
   end record;

   type WKSTA_INFO_1047 is record
      wki1047_cache_file_timeout : Win32.DWORD;
   end record;

   type WKSTA_INFO_1048 is record
      wki1048_use_opportunistic_locking : Win32.BOOL;
   end record;

   type WKSTA_INFO_1049 is record
      wki1049_use_unlock_behind : Win32.BOOL;
   end record;

   type WKSTA_INFO_1050 is record
      wki1050_use_close_behind : Win32.BOOL;
   end record;

   type WKSTA_INFO_1051 is record
      wki1051_buf_named_pipes : Win32.BOOL;
   end record;

   type WKSTA_INFO_1052 is record
      wki1052_use_lock_read_unlock : Win32.BOOL;
   end record;

   type WKSTA_INFO_1053 is record
      wki1053_utilize_nt_caching : Win32.BOOL;
   end record;

   type WKSTA_INFO_1054 is record
      wki1054_use_raw_read : Win32.BOOL;
   end record;

   type WKSTA_INFO_1055 is record
      wki1055_use_raw_write : Win32.BOOL;
   end record;

   type WKSTA_INFO_1056 is record
      wki1056_use_write_raw_data : Win32.BOOL;
   end record;

   type WKSTA_INFO_1057 is record
      wki1057_use_encryption : Win32.BOOL;
   end record;

   type WKSTA_INFO_1058 is record
      wki1058_buf_files_deny_write : Win32.BOOL;
   end record;

   type WKSTA_INFO_1059 is record
      wki1059_buf_read_only_files : Win32.BOOL;
   end record;

   type WKSTA_INFO_1060 is record
      wki1060_force_core_create_mode : Win32.BOOL;
   end record;

   type WKSTA_INFO_1061 is record
      wki1061_use_512_byte_max_transfer : Win32.BOOL;
   end record;

   type WKSTA_INFO_1062 is record
      wki1062_read_ahead_throughput : Win32.DWORD;
   end record;

   type WKSTA_USER_INFO_0 is record
      wkui0_username : Win32.Winnt.LPTSTR;
   end record;

   type WKSTA_USER_INFO_1 is record
      wkui1_username     : Win32.Winnt.LPTSTR;
      wkui1_logon_domain : Win32.Winnt.LPTSTR;
      wkui1_oth_domains  : Win32.Winnt.LPTSTR;
      wkui1_logon_server : Win32.Winnt.LPTSTR;
   end record;

   type WKSTA_USER_INFO_1101 is record
      wkui1101_oth_domains : Win32.Winnt.LPTSTR;
   end record;

   type WKSTA_TRANSPORT_INFO_0 is record
      wkti0_quality_of_service : Win32.DWORD;
      wkti0_number_of_vcs      : Win32.DWORD;
      wkti0_transport_name     : Win32.Winnt.LPTSTR;
      wkti0_transport_address  : Win32.Winnt.LPTSTR;
      wkti0_wan_ish            : Win32.BOOL;
   end record;

   function NetWkstaGetInfo
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetWkstaSetInfo
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buffer     : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetWkstaUserGetInfo
     (reserved : Win32.Winnt.LPTSTR;
      level    : Win32.DWORD;
      bufptr   : access Win32.PBYTE)
      return Win32.DWORD;

   function NetWkstaUserSetInfo
     (reserved : Win32.Winnt.LPTSTR;
      level    : Win32.DWORD;
      buf      : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
      return Win32.DWORD;

   function NetWkstaUserEnum
     (servername   : Win32.Winnt.LPTSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.PBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetWkstaTransportAdd
     (servername : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetWkstaTransportDel
     (servername    : Win32.Winnt.LPTSTR;
      transportname : Win32.Winnt.LPTSTR;
      ucond         : Win32.DWORD)
      return Win32.DWORD;

   function NetWkstaTransportEnum
     (servername   : Win32.Winnt.LPTSTR;
      level        : Win32.DWORD;
      bufptr       : access Win32.PBYTE;
      prefmaxlen   : Win32.DWORD;
      entriesread  : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resumehandle : Win32.LPDWORD)
      return Win32.DWORD;

private

   pragma Convention (C, WKSTA_INFO_100);
   pragma Convention (C, WKSTA_INFO_101);
   pragma Convention (C, WKSTA_INFO_102);
   pragma Convention (C, WKSTA_INFO_302);
   pragma Convention (C, WKSTA_INFO_402);
   pragma Convention (C, WKSTA_INFO_502);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1010);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1011);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1012);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1027);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1028);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1032);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1013);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1018);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1023);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1033);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1041);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1042);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1043);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1044);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1045);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1046);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1047);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1048);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1049);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1050);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1051);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1052);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1053);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1054);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1055);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1056);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1057);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1058);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1059);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1060);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1061);
   pragma Convention (C_Pass_By_Copy, WKSTA_INFO_1062);
   pragma Convention (C_Pass_By_Copy, WKSTA_USER_INFO_0);
   pragma Convention (C_Pass_By_Copy, WKSTA_USER_INFO_1);
   pragma Convention (C_Pass_By_Copy, WKSTA_USER_INFO_1101);
   pragma Convention (C, WKSTA_TRANSPORT_INFO_0);

   pragma Import (Stdcall, NetWkstaGetInfo, "NetWkstaGetInfo");
   pragma Import (Stdcall, NetWkstaSetInfo, "NetWkstaSetInfo");
   pragma Import (Stdcall, NetWkstaUserGetInfo, "NetWkstaUserGetInfo");
   pragma Import (Stdcall, NetWkstaUserSetInfo, "NetWkstaUserSetInfo");
   pragma Import (Stdcall, NetWkstaUserEnum, "NetWkstaUserEnum");
   pragma Import (Stdcall, NetWkstaTransportAdd, "NetWkstaTransportAdd");
   pragma Import (Stdcall, NetWkstaTransportDel, "NetWkstaTransportDel");
   pragma Import (Stdcall, NetWkstaTransportEnum, "NetWkstaTransportEnum");

end Win32.Lmwksta;
