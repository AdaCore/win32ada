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

package Win32.Lmerrlog is

   LOGFLAGS_FORWARD : constant := 0; --  lmerrlog.h:84
   LOGFLAGS_BACKWARD : constant := 16#1#;
   --  lmerrlog.h:85
   LOGFLAGS_SEEK : constant := 16#2#;
   --  lmerrlog.h:86
   ERRLOG_BASE : constant := 3100;
   --  lmerrlog.h:141
   NELOG_Internal_Error : constant := 3100;
   --  lmerrlog.h:143
   NELOG_Resource_Shortage : constant := 3101;
   --  lmerrlog.h:148
   NELOG_Unable_To_Lock_Segment : constant := 3102;
   --  lmerrlog.h:153
   NELOG_Unable_To_Unlock_Segment : constant := 3103;
   --  lmerrlog.h:159
   NELOG_Uninstall_Service : constant := 3104;
   --  lmerrlog.h:165
   NELOG_Init_Exec_Fail : constant := 3105;
   --  lmerrlog.h:171
   NELOG_Ncb_Error : constant := 3106;
   --  lmerrlog.h:177
   NELOG_Net_Not_Started : constant := 3107;
   --  lmerrlog.h:182
   NELOG_Ioctl_Error : constant := 3108;
   --  lmerrlog.h:187
   NELOG_System_Semaphore : constant := 3109;
   --  lmerrlog.h:196
   NELOG_Init_OpenCreate_Err : constant := 3110;
   --  lmerrlog.h:202
   NELOG_NetBios : constant := 3111;
   --  lmerrlog.h:208
   NELOG_SMB_Illegal : constant := 3112;
   --  lmerrlog.h:214
   NELOG_Service_Fail : constant := 3113;
   --  lmerrlog.h:220
   NELOG_Entries_Lost : constant := 3114;
   --  lmerrlog.h:226
   NELOG_Init_Seg_Overflow : constant := 3120;
   --  lmerrlog.h:237
   NELOG_Srv_No_Mem_Grow : constant := 3121;
   --  lmerrlog.h:243
   NELOG_Access_File_Bad : constant := 3122;
   --  lmerrlog.h:248
   NELOG_Srvnet_Not_Started : constant := 3123;
   --  lmerrlog.h:254
   NELOG_Init_Chardev_Err : constant := 3124;
   --  lmerrlog.h:259
   NELOG_Remote_API : constant := 3125;
   --  lmerrlog.h:265
   NELOG_Ncb_TooManyErr : constant := 3126;
   --  lmerrlog.h:270
   NELOG_Mailslot_err : constant := 3127;
   --  lmerrlog.h:276
   NELOG_ReleaseMem_Alert : constant := 3128;
   --  lmerrlog.h:281
   NELOG_AT_cannot_write : constant := 3129;
   --  lmerrlog.h:287
   NELOG_Cant_Make_Msg_File : constant := 3130;
   --  lmerrlog.h:292
   NELOG_Exec_Netservr_NoMem : constant := 3131;
   --  lmerrlog.h:297
   NELOG_Server_Lock_Failure : constant := 3132;
   --  lmerrlog.h:303
   NELOG_Msg_Shutdown : constant := 3140;
   --  lmerrlog.h:312
   NELOG_Msg_Sem_Shutdown : constant := 3141;
   --  lmerrlog.h:319
   NELOG_Msg_Log_Err : constant := 3150;
   --  lmerrlog.h:325
   NELOG_VIO_POPUP_ERR : constant := 3151;
   --  lmerrlog.h:334
   NELOG_Msg_Unexpected_SMB_Type : constant := 3152;
   --  lmerrlog.h:340
   NELOG_Wksta_Infoseg : constant := 3160;
   --  lmerrlog.h:350
   NELOG_Wksta_Compname : constant := 3161;
   --  lmerrlog.h:356
   NELOG_Wksta_BiosThreadFailure : constant := 3162;
   --  lmerrlog.h:361
   NELOG_Wksta_IniSeg : constant := 3163;
   --  lmerrlog.h:367
   NELOG_Wksta_HostTab_Full : constant := 3164;
   --  lmerrlog.h:373
   NELOG_Wksta_Bad_Mailslot_SMB : constant := 3165;
   --  lmerrlog.h:378
   NELOG_Wksta_UASInit : constant := 3166;
   --  lmerrlog.h:383
   NELOG_Wksta_SSIRelogon : constant := 3167;
   --  lmerrlog.h:389
   NELOG_Build_Name : constant := 3170;
   --  lmerrlog.h:400
   NELOG_Name_Expansion : constant := 3171;
   --  lmerrlog.h:406
   NELOG_Message_Send : constant := 3172;
   --  lmerrlog.h:412
   NELOG_Mail_Slt_Err : constant := 3173;
   --  lmerrlog.h:420
   NELOG_AT_cannot_read : constant := 3174;
   --  lmerrlog.h:426
   NELOG_AT_sched_err : constant := 3175;
   --  lmerrlog.h:431
   NELOG_AT_schedule_file_created : constant := 3176;
   --  lmerrlog.h:436
   NELOG_Srvnet_NB_Open : constant := 3177;
   --  lmerrlog.h:441
   NELOG_AT_Exec_Err : constant := 3178;
   --  lmerrlog.h:446
   NELOG_Lazy_Write_Err : constant := 3180;
   --  lmerrlog.h:455
   NELOG_HotFix : constant := 3181;
   --  lmerrlog.h:461
   NELOG_HardErr_From_Server : constant := 3182;
   --  lmerrlog.h:470
   NELOG_LocalSecFail1 : constant := 3183;
   --  lmerrlog.h:476
   NELOG_LocalSecFail2 : constant := 3184;
   --  lmerrlog.h:485
   NELOG_LocalSecFail3 : constant := 3185;
   --  lmerrlog.h:494
   NELOG_LocalSecGeneralFail : constant := 3186;
   --  lmerrlog.h:503
   NELOG_NetWkSta_Internal_Error : constant := 3190;
   --  lmerrlog.h:516
   NELOG_NetWkSta_No_Resource : constant := 3191;
   --  lmerrlog.h:522
   NELOG_NetWkSta_SMB_Err : constant := 3192;
   --  lmerrlog.h:527
   NELOG_NetWkSta_VC_Err : constant := 3193;
   --  lmerrlog.h:533
   NELOG_NetWkSta_Stuck_VC_Err : constant := 3194;
   --  lmerrlog.h:539
   NELOG_NetWkSta_NCB_Err : constant := 3195;
   --  lmerrlog.h:544
   NELOG_NetWkSta_Write_Behind_Err : constant := 3196;
   --  lmerrlog.h:550
   NELOG_NetWkSta_Reset_Err : constant := 3197;
   --  lmerrlog.h:556
   NELOG_NetWkSta_Too_Many : constant := 3198;
   --  lmerrlog.h:562
   NELOG_Srv_Thread_Failure : constant := 3204;
   --  lmerrlog.h:572
   NELOG_Srv_Close_Failure : constant := 3205;
   --  lmerrlog.h:578
   NELOG_ReplUserCurDir : constant := 3206;
   --  lmerrlog.h:584
   NELOG_ReplCannotMasterDir : constant := 3207;
   --  lmerrlog.h:590
   NELOG_ReplUpdateError : constant := 3208;
   --  lmerrlog.h:596
   NELOG_ReplLostMaster : constant := 3209;
   --  lmerrlog.h:602
   NELOG_NetlogonAuthDCFail : constant := 3210;
   --  lmerrlog.h:608
   NELOG_ReplLogonFailed : constant := 3211;
   --  lmerrlog.h:613
   NELOG_ReplNetErr : constant := 3212;
   --  lmerrlog.h:618
   NELOG_ReplMaxFiles : constant := 3213;
   --  lmerrlog.h:623
   NELOG_ReplMaxTreeDepth : constant := 3214;
   --  lmerrlog.h:629
   NELOG_ReplBadMsg : constant := 3215;
   --  lmerrlog.h:634
   NELOG_ReplSysErr : constant := 3216;
   --  lmerrlog.h:639
   NELOG_ReplUserLoged : constant := 3217;
   --  lmerrlog.h:644
   NELOG_ReplBadImport : constant := 3218;
   --  lmerrlog.h:650
   NELOG_ReplBadExport : constant := 3219;
   --  lmerrlog.h:655
   NELOG_ReplSignalFileErr : constant := 3220;
   --  lmerrlog.h:660
   NELOG_DiskFT : constant := 3221;
   --  lmerrlog.h:666
   NELOG_ReplAccessDenied : constant := 3222;
   --  lmerrlog.h:673
   NELOG_NetlogonFailedPrimary : constant := 3223;
   --  lmerrlog.h:679
   NELOG_NetlogonPasswdSetFailed : constant := 3224;
   --  lmerrlog.h:684
   NELOG_NetlogonTrackingError : constant := 3225;
   --  lmerrlog.h:690
   NELOG_NetlogonSyncError : constant := 3226;
   --  lmerrlog.h:695
   NELOG_UPS_PowerOut : constant := 3230;
   --  lmerrlog.h:704
   NELOG_UPS_Shutdown : constant := 3231;
   --  lmerrlog.h:709
   NELOG_UPS_CmdFileError : constant := 3232;
   --  lmerrlog.h:714
   NELOG_UPS_CannotOpenDriver : constant := 3233;
   --  lmerrlog.h:720
   NELOG_UPS_PowerBack : constant := 3234;
   --  lmerrlog.h:726
   NELOG_UPS_CmdFileConfig : constant := 3235;
   --  lmerrlog.h:731
   NELOG_UPS_CmdFileExec : constant := 3236;
   --  lmerrlog.h:737
   NELOG_Missing_Parameter : constant := 3250;
   --  lmerrlog.h:747
   NELOG_Invalid_Config_Line : constant := 3251;
   --  lmerrlog.h:753
   NELOG_Invalid_Config_File : constant := 3252;
   --  lmerrlog.h:759
   NELOG_File_Changed : constant := 3253;
   --  lmerrlog.h:765
   NELOG_Files_Dont_Fit : constant := 3254;
   --  lmerrlog.h:771
   NELOG_Wrong_DLL_Version : constant := 3255;
   --  lmerrlog.h:778
   NELOG_Error_in_DLL : constant := 3256;
   --  lmerrlog.h:784
   NELOG_System_Error : constant := 3257;
   --  lmerrlog.h:790
   NELOG_FT_ErrLog_Too_Large : constant := 3258;
   --  lmerrlog.h:796
   NELOG_FT_Update_In_Progress : constant := 3259;
   --  lmerrlog.h:802
   NELOG_OEM_Code : constant := 3299;
   --  lmerrlog.h:829
   ERRLOG2_BASE : constant := 5700;
   --  lmerrlog.h:838
   NELOG_NetlogonSSIInitError : constant := 5700;
   --  lmerrlog.h:840
   NELOG_NetlogonFailedToUpdateTrustList : constant := 5701;
   --  lmerrlog.h:847
   NELOG_NetlogonFailedToAddRpcInterface : constant := 5702;
   --  lmerrlog.h:853
   NELOG_NetlogonFailedToReadMailslot : constant := 5703;
   --  lmerrlog.h:859
   NELOG_NetlogonFailedToRegisterSC : constant := 5704;
   --  lmerrlog.h:865
   NELOG_NetlogonChangeLogCorrupt : constant := 5705;
   --  lmerrlog.h:872
   NELOG_NetlogonFailedToCreateShare : constant := 5706;
   --  lmerrlog.h:879
   NELOG_NetlogonDownLevelLogonFailed : constant := 5707;
   --  lmerrlog.h:885
   NELOG_NetlogonDownLevelLogoffFailed : constant := 5708;
   --  lmerrlog.h:890
   NELOG_NetlogonNTLogonFailed : constant := 5709;
   --  lmerrlog.h:895
   NELOG_NetlogonNTLogoffFailed : constant := 5710;
   --  lmerrlog.h:901
   NELOG_NetlogonPartialSyncCallSuccess : constant := 5711;
   --  lmerrlog.h:907
   NELOG_NetlogonPartialSyncCallFailed : constant := 5712;
   --  lmerrlog.h:914
   NELOG_NetlogonFullSyncCallSuccess : constant := 5713;
   --  lmerrlog.h:920
   NELOG_NetlogonFullSyncCallFailed : constant := 5714;
   --  lmerrlog.h:927
   NELOG_NetlogonPartialSyncSuccess : constant := 5715;
   --  lmerrlog.h:933
   NELOG_NetlogonPartialSyncFailed : constant := 5716;
   --  lmerrlog.h:941
   NELOG_NetlogonFullSyncSuccess : constant := 5717;
   --  lmerrlog.h:947
   NELOG_NetlogonFullSyncFailed : constant := 5718;
   --  lmerrlog.h:954
   NELOG_NetlogonAuthNoDomainController : constant := 5719;
   --  lmerrlog.h:960
   NELOG_NetlogonAuthNoTrustLsaSecret : constant := 5720;
   --  lmerrlog.h:966
   NELOG_NetlogonAuthNoTrustSamAccount : constant := 5721;
   --  lmerrlog.h:972
   NELOG_NetlogonServerAuthFailed : constant := 5722;
   --  lmerrlog.h:979
   NELOG_NetlogonServerAuthNoTrustSamAccount : constant := 5723;
   --  lmerrlog.h:986
   NELOG_FailedToRegisterSC : constant := 5724;
   --  lmerrlog.h:997
   NELOG_FailedToSetServiceStatus : constant := 5725;
   --  lmerrlog.h:1002
   NELOG_FailedToGetComputerName : constant := 5726;
   --  lmerrlog.h:1007
   NELOG_DriverNotLoaded : constant := 5727;
   --  lmerrlog.h:1012
   NELOG_NoTranportLoaded : constant := 5728;
   --  lmerrlog.h:1017
   NELOG_NetlogonFailedDomainDelta : constant := 5729;
   --  lmerrlog.h:1026
   NELOG_NetlogonFailedGlobalGroupDelta : constant := 5730;
   --  lmerrlog.h:1032
   NELOG_NetlogonFailedLocalGroupDelta : constant := 5731;
   --  lmerrlog.h:1038
   NELOG_NetlogonFailedUserDelta : constant := 5732;
   --  lmerrlog.h:1044
   NELOG_NetlogonFailedPolicyDelta : constant := 5733;
   --  lmerrlog.h:1050
   NELOG_NetlogonFailedTrustedDomainDelta : constant := 5734;
   --  lmerrlog.h:1056
   NELOG_NetlogonFailedAccountDelta : constant := 5735;
   --  lmerrlog.h:1062
   NELOG_NetlogonFailedSecretDelta : constant := 5736;
   --  lmerrlog.h:1068
   NELOG_NetlogonSystemError : constant := 5737;
   --  lmerrlog.h:1074
   NELOG_NetlogonDuplicateMachineAccounts : constant := 5738;
   --  lmerrlog.h:1079
   NELOG_NetlogonTooManyGlobalGroups : constant := 5739;
   --  lmerrlog.h:1087
   NELOG_NetlogonBrowserDriver : constant := 5740;
   --  lmerrlog.h:1094
   NELOG_NetlogonAddNameFailure : constant := 5741;
   --  lmerrlog.h:1099
   NELOG_RplMessages : constant := 5742;
   --  lmerrlog.h:1107
   NELOG_RplXnsBoot : constant := 5743;
   --  lmerrlog.h:1112
   NELOG_RplSystem : constant := 5744;
   --  lmerrlog.h:1118
   NELOG_RplWkstaTimeout : constant := 5745;
   --  lmerrlog.h:1123
   NELOG_RplWkstaFileOpen : constant := 5746;
   --  lmerrlog.h:1129
   NELOG_RplWkstaFileRead : constant := 5747;
   --  lmerrlog.h:1135
   NELOG_RplWkstaMemory : constant := 5748;
   --  lmerrlog.h:1141
   NELOG_RplWkstaFileChecksum : constant := 5749;
   --  lmerrlog.h:1147
   NELOG_RplWkstaFileLineCount : constant := 5750;
   --  lmerrlog.h:1153
   NELOG_RplWkstaBbcFile : constant := 5751;
   --  lmerrlog.h:1159
   NELOG_RplWkstaFileSize : constant := 5752;
   --  lmerrlog.h:1166
   NELOG_RplWkstaInternal : constant := 5753;
   --  lmerrlog.h:1172
   NELOG_RplWkstaWrongVersion : constant := 5754;
   --  lmerrlog.h:1178
   NELOG_RplWkstaNetwork : constant := 5755;
   --  lmerrlog.h:1184
   NELOG_RplAdapterResource : constant := 5756;
   --  lmerrlog.h:1189
   NELOG_RplFileCopy : constant := 5757;
   --  lmerrlog.h:1194
   NELOG_RplFileDelete : constant := 5758;
   --  lmerrlog.h:1199
   NELOG_RplFilePerms : constant := 5759;
   --  lmerrlog.h:1204
   NELOG_RplCheckConfigs : constant := 5760;
   --  lmerrlog.h:1208
   NELOG_RplCreateProfiles : constant := 5761;
   --  lmerrlog.h:1212
   NELOG_RplRegistry : constant := 5762;
   --  lmerrlog.h:1216
   NELOG_RplReplaceRPLDISK : constant := 5763;
   --  lmerrlog.h:1220
   NELOG_RplCheckSecurity : constant := 5764;
   --  lmerrlog.h:1224
   NELOG_RplBackupDatabase : constant := 5765;
   --  lmerrlog.h:1230
   NELOG_RplInitDatabase : constant := 5766;
   --  lmerrlog.h:1234
   NELOG_RplRestoreDatabaseFailure : constant := 5767;
   --  lmerrlog.h:1240
   NELOG_RplRestoreDatabaseSuccess : constant := 5768;
   --  lmerrlog.h:1245
   NELOG_RplInitRestoredDatabase : constant := 5769;
   --  lmerrlog.h:1249

   type ERROR_LOG;                                         --  lmerrlog.h:57
   type HLOG;                                              --  lmerrlog.h:77

   type PERROR_LOG is access all ERROR_LOG;                --  lmerrlog.h:67
   subtype LPERROR_LOG is PERROR_LOG;                      --  lmerrlog.h:67

   type PHLOG is access all HLOG;                          --  lmerrlog.h:82
   subtype LPHLOG is PHLOG;                                --  lmerrlog.h:82

   type ERROR_LOG is                                       --  lmerrlog.h:57
      record
         el_len : Win32.DWORD;                      --  lmerrlog.h:58
         el_reserved : Win32.DWORD;                      --  lmerrlog.h:59
         el_time : Win32.DWORD;                      --  lmerrlog.h:60
         el_error : Win32.DWORD;                      --  lmerrlog.h:61
         el_name : Win32.Winnt.LPTSTR;               --  lmerrlog.h:62
         el_text : Win32.Winnt.LPTSTR;               --  lmerrlog.h:63
         el_data : Win32.LPBYTE;                     --  lmerrlog.h:64
         el_data_size : Win32.DWORD;                      --  lmerrlog.h:65
         el_nstrings : Win32.DWORD;                      --  lmerrlog.h:66
      end record;

   type HLOG is                                            --  lmerrlog.h:77
      record
         time : Win32.DWORD;                        --  lmerrlog.h:78
         last_flags : Win32.DWORD;                        --  lmerrlog.h:79
         offset : Win32.DWORD;                        --  lmerrlog.h:80
         rec_offset : Win32.DWORD;                        --  lmerrlog.h:81
      end record;

   function NetErrorLogClear
(server : Win32.Winnt.LPTSTR;
                             backupfile : Win32.Winnt.LPTSTR;
                             reserved : Win32.LPBYTE)
                            return Win32.DWORD;             --  lmerrlog.h:95

   function NetErrorLogRead
(server : Win32.Winnt.LPTSTR;
                            reserved1 : Win32.Winnt.LPTSTR;
                            errloghandle : LPHLOG;
                            offset : Win32.DWORD;
                            reserved2 : Win32.LPDWORD;
                            reserved3 : Win32.DWORD;
                            offsetflag : Win32.DWORD;
                            bufptr : access Win32.PBYTE;
                            prefmaxlen : Win32.DWORD;
                            bytesread : Win32.LPDWORD;
                            totalbytes : Win32.LPDWORD)
                           return Win32.DWORD;           --  lmerrlog.h:102

   function NetErrorLogWrite
(reserved1 : Win32.LPBYTE;
                             code : Win32.DWORD;
                             component : Win32.Winnt.LPTSTR;
                             buffer : Win32.LPBYTE;
                             numbytes : Win32.DWORD;
                             msgbuf : Win32.LPBYTE;
                             strcount : Win32.DWORD;
                             reserved2 : Win32.LPBYTE)
                            return Win32.DWORD;             --  lmerrlog.h:117

private

   pragma Convention (C, ERROR_LOG);                        --  lmerrlog.h:57
   pragma Convention (C_Pass_By_Copy, HLOG);                --  lmerrlog.h:77

   pragma Import (Stdcall, NetErrorLogClear, "NetErrorLogClear");
   --  lmerrlog.h:95
   pragma Import (Stdcall, NetErrorLogRead, "NetErrorLogRead");
   --  lmerrlog.h:102
   pragma Import (Stdcall, NetErrorLogWrite, "NetErrorLogWrite");
   --  lmerrlog.h:117

end Win32.Lmerrlog;
