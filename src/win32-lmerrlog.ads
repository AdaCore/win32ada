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

package Win32.Lmerrlog is

   LOGFLAGS_FORWARD                          : constant := 0;
   LOGFLAGS_BACKWARD                         : constant := 16#1#;
   LOGFLAGS_SEEK                             : constant := 16#2#;
   ERRLOG_BASE                               : constant := 3100;
   NELOG_Internal_Error                      : constant := 3100;
   NELOG_Resource_Shortage                   : constant := 3101;
   NELOG_Unable_To_Lock_Segment              : constant := 3102;
   NELOG_Unable_To_Unlock_Segment            : constant := 3103;
   NELOG_Uninstall_Service                   : constant := 3104;
   NELOG_Init_Exec_Fail                      : constant := 3105;
   NELOG_Ncb_Error                           : constant := 3106;
   NELOG_Net_Not_Started                     : constant := 3107;
   NELOG_Ioctl_Error                         : constant := 3108;
   NELOG_System_Semaphore                    : constant := 3109;
   NELOG_Init_OpenCreate_Err                 : constant := 3110;
   NELOG_NetBios                             : constant := 3111;
   NELOG_SMB_Illegal                         : constant := 3112;
   NELOG_Service_Fail                        : constant := 3113;
   NELOG_Entries_Lost                        : constant := 3114;
   NELOG_Init_Seg_Overflow                   : constant := 3120;
   NELOG_Srv_No_Mem_Grow                     : constant := 3121;
   NELOG_Access_File_Bad                     : constant := 3122;
   NELOG_Srvnet_Not_Started                  : constant := 3123;
   NELOG_Init_Chardev_Err                    : constant := 3124;
   NELOG_Remote_API                          : constant := 3125;
   NELOG_Ncb_TooManyErr                      : constant := 3126;
   NELOG_Mailslot_err                        : constant := 3127;
   NELOG_ReleaseMem_Alert                    : constant := 3128;
   NELOG_AT_cannot_write                     : constant := 3129;
   NELOG_Cant_Make_Msg_File                  : constant := 3130;
   NELOG_Exec_Netservr_NoMem                 : constant := 3131;
   NELOG_Server_Lock_Failure                 : constant := 3132;
   NELOG_Msg_Shutdown                        : constant := 3140;
   NELOG_Msg_Sem_Shutdown                    : constant := 3141;
   NELOG_Msg_Log_Err                         : constant := 3150;
   NELOG_VIO_POPUP_ERR                       : constant := 3151;
   NELOG_Msg_Unexpected_SMB_Type             : constant := 3152;
   NELOG_Wksta_Infoseg                       : constant := 3160;
   NELOG_Wksta_Compname                      : constant := 3161;
   NELOG_Wksta_BiosThreadFailure             : constant := 3162;
   NELOG_Wksta_IniSeg                        : constant := 3163;
   NELOG_Wksta_HostTab_Full                  : constant := 3164;
   NELOG_Wksta_Bad_Mailslot_SMB              : constant := 3165;
   NELOG_Wksta_UASInit                       : constant := 3166;
   NELOG_Wksta_SSIRelogon                    : constant := 3167;
   NELOG_Build_Name                          : constant := 3170;
   NELOG_Name_Expansion                      : constant := 3171;
   NELOG_Message_Send                        : constant := 3172;
   NELOG_Mail_Slt_Err                        : constant := 3173;
   NELOG_AT_cannot_read                      : constant := 3174;
   NELOG_AT_sched_err                        : constant := 3175;
   NELOG_AT_schedule_file_created            : constant := 3176;
   NELOG_Srvnet_NB_Open                      : constant := 3177;
   NELOG_AT_Exec_Err                         : constant := 3178;
   NELOG_Lazy_Write_Err                      : constant := 3180;
   NELOG_HotFix                              : constant := 3181;
   NELOG_HardErr_From_Server                 : constant := 3182;
   NELOG_LocalSecFail1                       : constant := 3183;
   NELOG_LocalSecFail2                       : constant := 3184;
   NELOG_LocalSecFail3                       : constant := 3185;
   NELOG_LocalSecGeneralFail                 : constant := 3186;
   NELOG_NetWkSta_Internal_Error             : constant := 3190;
   NELOG_NetWkSta_No_Resource                : constant := 3191;
   NELOG_NetWkSta_SMB_Err                    : constant := 3192;
   NELOG_NetWkSta_VC_Err                     : constant := 3193;
   NELOG_NetWkSta_Stuck_VC_Err               : constant := 3194;
   NELOG_NetWkSta_NCB_Err                    : constant := 3195;
   NELOG_NetWkSta_Write_Behind_Err           : constant := 3196;
   NELOG_NetWkSta_Reset_Err                  : constant := 3197;
   NELOG_NetWkSta_Too_Many                   : constant := 3198;
   NELOG_Srv_Thread_Failure                  : constant := 3204;
   NELOG_Srv_Close_Failure                   : constant := 3205;
   NELOG_ReplUserCurDir                      : constant := 3206;
   NELOG_ReplCannotMasterDir                 : constant := 3207;
   NELOG_ReplUpdateError                     : constant := 3208;
   NELOG_ReplLostMaster                      : constant := 3209;
   NELOG_NetlogonAuthDCFail                  : constant := 3210;
   NELOG_ReplLogonFailed                     : constant := 3211;
   NELOG_ReplNetErr                          : constant := 3212;
   NELOG_ReplMaxFiles                        : constant := 3213;
   NELOG_ReplMaxTreeDepth                    : constant := 3214;
   NELOG_ReplBadMsg                          : constant := 3215;
   NELOG_ReplSysErr                          : constant := 3216;
   NELOG_ReplUserLoged                       : constant := 3217;
   NELOG_ReplBadImport                       : constant := 3218;
   NELOG_ReplBadExport                       : constant := 3219;
   NELOG_ReplSignalFileErr                   : constant := 3220;
   NELOG_DiskFT                              : constant := 3221;
   NELOG_ReplAccessDenied                    : constant := 3222;
   NELOG_NetlogonFailedPrimary               : constant := 3223;
   NELOG_NetlogonPasswdSetFailed             : constant := 3224;
   NELOG_NetlogonTrackingError               : constant := 3225;
   NELOG_NetlogonSyncError                   : constant := 3226;
   NELOG_UPS_PowerOut                        : constant := 3230;
   NELOG_UPS_Shutdown                        : constant := 3231;
   NELOG_UPS_CmdFileError                    : constant := 3232;
   NELOG_UPS_CannotOpenDriver                : constant := 3233;
   NELOG_UPS_PowerBack                       : constant := 3234;
   NELOG_UPS_CmdFileConfig                   : constant := 3235;
   NELOG_UPS_CmdFileExec                     : constant := 3236;
   NELOG_Missing_Parameter                   : constant := 3250;
   NELOG_Invalid_Config_Line                 : constant := 3251;
   NELOG_Invalid_Config_File                 : constant := 3252;
   NELOG_File_Changed                        : constant := 3253;
   NELOG_Files_Dont_Fit                      : constant := 3254;
   NELOG_Wrong_DLL_Version                   : constant := 3255;
   NELOG_Error_in_DLL                        : constant := 3256;
   NELOG_System_Error                        : constant := 3257;
   NELOG_FT_ErrLog_Too_Large                 : constant := 3258;
   NELOG_FT_Update_In_Progress               : constant := 3259;
   NELOG_OEM_Code                            : constant := 3299;
   ERRLOG2_BASE                              : constant := 5700;
   NELOG_NetlogonSSIInitError                : constant := 5700;
   NELOG_NetlogonFailedToUpdateTrustList     : constant := 5701;
   NELOG_NetlogonFailedToAddRpcInterface     : constant := 5702;
   NELOG_NetlogonFailedToReadMailslot        : constant := 5703;
   NELOG_NetlogonFailedToRegisterSC          : constant := 5704;
   NELOG_NetlogonChangeLogCorrupt            : constant := 5705;
   NELOG_NetlogonFailedToCreateShare         : constant := 5706;
   NELOG_NetlogonDownLevelLogonFailed        : constant := 5707;
   NELOG_NetlogonDownLevelLogoffFailed       : constant := 5708;
   NELOG_NetlogonNTLogonFailed               : constant := 5709;
   NELOG_NetlogonNTLogoffFailed              : constant := 5710;
   NELOG_NetlogonPartialSyncCallSuccess      : constant := 5711;
   NELOG_NetlogonPartialSyncCallFailed       : constant := 5712;
   NELOG_NetlogonFullSyncCallSuccess         : constant := 5713;
   NELOG_NetlogonFullSyncCallFailed          : constant := 5714;
   NELOG_NetlogonPartialSyncSuccess          : constant := 5715;
   NELOG_NetlogonPartialSyncFailed           : constant := 5716;
   NELOG_NetlogonFullSyncSuccess             : constant := 5717;
   NELOG_NetlogonFullSyncFailed              : constant := 5718;
   NELOG_NetlogonAuthNoDomainController      : constant := 5719;
   NELOG_NetlogonAuthNoTrustLsaSecret        : constant := 5720;
   NELOG_NetlogonAuthNoTrustSamAccount       : constant := 5721;
   NELOG_NetlogonServerAuthFailed            : constant := 5722;
   NELOG_NetlogonServerAuthNoTrustSamAccount : constant := 5723;
   NELOG_FailedToRegisterSC                  : constant := 5724;
   NELOG_FailedToSetServiceStatus            : constant := 5725;
   NELOG_FailedToGetComputerName             : constant := 5726;
   NELOG_DriverNotLoaded                     : constant := 5727;
   NELOG_NoTranportLoaded                    : constant := 5728;
   NELOG_NetlogonFailedDomainDelta           : constant := 5729;
   NELOG_NetlogonFailedGlobalGroupDelta      : constant := 5730;
   NELOG_NetlogonFailedLocalGroupDelta       : constant := 5731;
   NELOG_NetlogonFailedUserDelta             : constant := 5732;
   NELOG_NetlogonFailedPolicyDelta           : constant := 5733;
   NELOG_NetlogonFailedTrustedDomainDelta    : constant := 5734;
   NELOG_NetlogonFailedAccountDelta          : constant := 5735;
   NELOG_NetlogonFailedSecretDelta           : constant := 5736;
   NELOG_NetlogonSystemError                 : constant := 5737;
   NELOG_NetlogonDuplicateMachineAccounts    : constant := 5738;
   NELOG_NetlogonTooManyGlobalGroups         : constant := 5739;
   NELOG_NetlogonBrowserDriver               : constant := 5740;
   NELOG_NetlogonAddNameFailure              : constant := 5741;
   NELOG_RplMessages                         : constant := 5742;
   NELOG_RplXnsBoot                          : constant := 5743;
   NELOG_RplSystem                           : constant := 5744;
   NELOG_RplWkstaTimeout                     : constant := 5745;
   NELOG_RplWkstaFileOpen                    : constant := 5746;
   NELOG_RplWkstaFileRead                    : constant := 5747;
   NELOG_RplWkstaMemory                      : constant := 5748;
   NELOG_RplWkstaFileChecksum                : constant := 5749;
   NELOG_RplWkstaFileLineCount               : constant := 5750;
   NELOG_RplWkstaBbcFile                     : constant := 5751;
   NELOG_RplWkstaFileSize                    : constant := 5752;
   NELOG_RplWkstaInternal                    : constant := 5753;
   NELOG_RplWkstaWrongVersion                : constant := 5754;
   NELOG_RplWkstaNetwork                     : constant := 5755;
   NELOG_RplAdapterResource                  : constant := 5756;
   NELOG_RplFileCopy                         : constant := 5757;
   NELOG_RplFileDelete                       : constant := 5758;
   NELOG_RplFilePerms                        : constant := 5759;
   NELOG_RplCheckConfigs                     : constant := 5760;
   NELOG_RplCreateProfiles                   : constant := 5761;
   NELOG_RplRegistry                         : constant := 5762;
   NELOG_RplReplaceRPLDISK                   : constant := 5763;
   NELOG_RplCheckSecurity                    : constant := 5764;
   NELOG_RplBackupDatabase                   : constant := 5765;
   NELOG_RplInitDatabase                     : constant := 5766;
   NELOG_RplRestoreDatabaseFailure           : constant := 5767;
   NELOG_RplRestoreDatabaseSuccess           : constant := 5768;
   NELOG_RplInitRestoredDatabase             : constant := 5769;

   type ERROR_LOG;
   type HLOG;

   type PERROR_LOG is access all ERROR_LOG;
   subtype LPERROR_LOG is PERROR_LOG;

   type PHLOG is access all HLOG;
   subtype LPHLOG is PHLOG;

   type ERROR_LOG is record
      el_len       : Win32.DWORD;
      el_reserved  : Win32.DWORD;
      el_time      : Win32.DWORD;
      el_error     : Win32.DWORD;
      el_name      : Win32.Winnt.LPTSTR;
      el_text      : Win32.Winnt.LPTSTR;
      el_data      : Win32.LPBYTE;
      el_data_size : Win32.DWORD;
      el_nstrings  : Win32.DWORD;
   end record;

   type HLOG is record
      time       : Win32.DWORD;
      last_flags : Win32.DWORD;
      offset     : Win32.DWORD;
      rec_offset : Win32.DWORD;
   end record;

   function NetErrorLogClear
     (server     : Win32.Winnt.LPTSTR;
      backupfile : Win32.Winnt.LPTSTR;
      reserved   : Win32.LPBYTE)
      return Win32.DWORD;

   function NetErrorLogRead
     (server       : Win32.Winnt.LPTSTR;
      reserved1    : Win32.Winnt.LPTSTR;
      errloghandle : LPHLOG;
      offset       : Win32.DWORD;
      reserved2    : Win32.LPDWORD;
      reserved3    : Win32.DWORD;
      offsetflag   : Win32.DWORD;
      bufptr       : access Win32.PBYTE;
      prefmaxlen   : Win32.DWORD;
      bytesread    : Win32.LPDWORD;
      totalbytes   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetErrorLogWrite
     (reserved1 : Win32.LPBYTE;
      code      : Win32.DWORD;
      component : Win32.Winnt.LPTSTR;
      buffer    : Win32.LPBYTE;
      numbytes  : Win32.DWORD;
      msgbuf    : Win32.LPBYTE;
      strcount  : Win32.DWORD;
      reserved2 : Win32.LPBYTE)
      return Win32.DWORD;

private

   pragma Convention (C, ERROR_LOG);
   pragma Convention (C_Pass_By_Copy, HLOG);

   pragma Import (Stdcall, NetErrorLogClear, "NetErrorLogClear");
   pragma Import (Stdcall, NetErrorLogRead, "NetErrorLogRead");
   pragma Import (Stdcall, NetErrorLogWrite, "NetErrorLogWrite");

end Win32.Lmerrlog;
