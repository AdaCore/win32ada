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

package Win32.Lmsvc is

   SERVICE_INSTALL_STATE         : constant := 16#3#;   --  lmsvc.h :144
   SERVICE_UNINSTALLED           : constant := 16#0#;   --  lmsvc.h :145
   SERVICE_INSTALL_PENDING       : constant := 16#1#;   --  lmsvc.h :146
   SERVICE_UNINSTALL_PENDING     : constant := 16#2#;   --  lmsvc.h :147
   SERVICE_INSTALLED             : constant := 16#3#;   --  lmsvc.h :148
   SERVICE_PAUSE_STATE           : constant := 16#c#;   --  lmsvc.h :152
   LM20_SERVICE_ACTIVE           : constant := 16#0#;   --  lmsvc.h :153
   LM20_SERVICE_CONTINUE_PENDING : constant := 16#4#;   --  lmsvc.h :154
   LM20_SERVICE_PAUSE_PENDING    : constant := 16#8#;   --  lmsvc.h :155
   LM20_SERVICE_PAUSED           : constant := 16#c#;   --  lmsvc.h :156
   SERVICE_NOT_UNINSTALLABLE     : constant := 16#0#;   --  lmsvc.h :160
   SERVICE_UNINSTALLABLE         : constant := 16#10#;  --  lmsvc.h :161
   SERVICE_NOT_PAUSABLE          : constant := 16#0#;   --  lmsvc.h :165
   SERVICE_PAUSABLE              : constant := 16#20#;  --  lmsvc.h :166
   SERVICE_REDIR_PAUSED          : constant := 16#700#; --  lmsvc.h :171
   SERVICE_REDIR_DISK_PAUSED     : constant := 16#100#; --  lmsvc.h :172
   SERVICE_REDIR_PRINT_PAUSED    : constant := 16#200#; --  lmsvc.h :173
   SERVICE_REDIR_COMM_PAUSED     : constant := 16#400#; --  lmsvc.h :174
   SERVICE_CTRL_INTERROGATE      : constant := 0;       --  lmsvc.h :186
   SERVICE_CTRL_PAUSE            : constant := 1;       --  lmsvc.h :187
   SERVICE_CTRL_CONTINUE         : constant := 2;       --  lmsvc.h :188
   SERVICE_CTRL_UNINSTALL        : constant := 3;       --  lmsvc.h :189
   SERVICE_CTRL_REDIR_DISK       : constant := 16#1#;   --  lmsvc.h :198
   SERVICE_CTRL_REDIR_PRINT      : constant := 16#2#;   --  lmsvc.h :199
   SERVICE_CTRL_REDIR_COMM       : constant := 16#4#;   --  lmsvc.h :200
   SERVICE_IP_NO_HINT            : constant := 16#0#;   --  lmsvc.h :211
   SERVICE_CCP_NO_HINT           : constant := 16#0#;   --  lmsvc.h :212
   SERVICE_IP_QUERY_HINT : constant := 16#10000#;
   --  lmsvc.h:214
   SERVICE_CCP_QUERY_HINT : constant := 16#10000#;
   --  lmsvc.h:215
   SERVICE_IP_CHKPT_NUM        : constant := 16#ff#;   --  lmsvc.h :221
   SERVICE_CCP_CHKPT_NUM       : constant := 16#ff#;   --  lmsvc.h :222
   SERVICE_IP_WAIT_TIME        : constant := 16#ff00#; --  lmsvc.h :228
   SERVICE_CCP_WAIT_TIME       : constant := 16#ff00#; --  lmsvc.h :229
   SERVICE_IP_WAITTIME_SHIFT   : constant := 8;        --  lmsvc.h :235
   SERVICE_NTIP_WAITTIME_SHIFT : constant := 12;       --  lmsvc.h :236
   UPPER_HINT_MASK             : constant := 16#ff00#; --  lmsvc.h :241
   LOWER_HINT_MASK             : constant := 16#ff#;   --  lmsvc.h :242
   UPPER_GET_HINT_MASK : constant := 16#ff00000#;
   --  lmsvc.h:243
   LOWER_GET_HINT_MASK : constant := 16#ff00#; --  lmsvc.h :244
   SERVICE_NT_MAXTIME  : constant := 16#ffff#; --  lmsvc.h :245
   SERVICE_RESRV_MASK : constant := 16#1ffff#;
   --  lmsvc.h:246
   SERVICE_MAXTIME                 : constant := 16#ff#; --  lmsvc.h :247
   SERVICE_BASE                    : constant := 3050;   --  lmsvc.h :258
   SERVICE_UIC_NORMAL              : constant := 0;      --  lmsvc.h :259
   SERVICE_UIC_BADPARMVAL          : constant := 3051;   --  lmsvc.h :265
   SERVICE_UIC_MISSPARM            : constant := 3052;   --  lmsvc.h :271
   SERVICE_UIC_UNKPARM             : constant := 3053;   --  lmsvc.h :277
   SERVICE_UIC_RESOURCE            : constant := 3054;   --  lmsvc.h :282
   SERVICE_UIC_CONFIG              : constant := 3055;   --  lmsvc.h :287
   SERVICE_UIC_SYSTEM              : constant := 3056;   --  lmsvc.h :292
   SERVICE_UIC_INTERNAL            : constant := 3057;   --  lmsvc.h :297
   SERVICE_UIC_AMBIGPARM           : constant := 3058;   --  lmsvc.h :302
   SERVICE_UIC_DUPPARM             : constant := 3059;   --  lmsvc.h :307
   SERVICE_UIC_KILL                : constant := 3060;   --  lmsvc.h :312
   SERVICE_UIC_EXEC                : constant := 3061;   --  lmsvc.h :318
   SERVICE_UIC_SUBSERV             : constant := 3062;   --  lmsvc.h :323
   SERVICE_UIC_CONFLPARM           : constant := 3063;   --  lmsvc.h :328
   SERVICE_UIC_FILE                : constant := 3064;   --  lmsvc.h :333
   SERVICE_UIC_M_NULL              : constant := 0;      --  lmsvc.h :348
   SERVICE_UIC_M_MEMORY            : constant := 3070;   --  lmsvc.h :354
   SERVICE_UIC_M_DISK              : constant := 3071;   --  lmsvc.h :355
   SERVICE_UIC_M_THREADS           : constant := 3072;   --  lmsvc.h :356
   SERVICE_UIC_M_PROCESSES         : constant := 3073;   --  lmsvc.h :357
   SERVICE_UIC_M_SECURITY          : constant := 3074;   --  lmsvc.h :367
   SERVICE_UIC_M_LANROOT           : constant := 3075;   --  lmsvc.h :370
   SERVICE_UIC_M_REDIR             : constant := 3076;   --  lmsvc.h :375
   SERVICE_UIC_M_SERVER            : constant := 3077;   --  lmsvc.h :380
   SERVICE_UIC_M_SEC_FILE_ERR      : constant := 3078;   --  lmsvc.h :385
   SERVICE_UIC_M_FILES             : constant := 3079;   --  lmsvc.h :390
   SERVICE_UIC_M_LOGS              : constant := 3080;   --  lmsvc.h :395
   SERVICE_UIC_M_LANGROUP          : constant := 3081;   --  lmsvc.h :400
   SERVICE_UIC_M_MSGNAME           : constant := 3082;   --  lmsvc.h :405
   SERVICE_UIC_M_ANNOUNCE          : constant := 3083;   --  lmsvc.h :410
   SERVICE_UIC_M_UAS               : constant := 3084;   --  lmsvc.h :415
   SERVICE_UIC_M_SERVER_SEC_ERR    : constant := 3085;   --  lmsvc.h :420
   SERVICE_UIC_M_WKSTA             : constant := 3087;   --  lmsvc.h :425
   SERVICE_UIC_M_ERRLOG            : constant := 3088;   --  lmsvc.h :430
   SERVICE_UIC_M_FILE_UW           : constant := 3089;   --  lmsvc.h :435
   SERVICE_UIC_M_ADDPAK            : constant := 3090;   --  lmsvc.h :440
   SERVICE_UIC_M_LAZY              : constant := 3091;   --  lmsvc.h :446
   SERVICE_UIC_M_UAS_MACHINE_ACCT  : constant := 3092;   --  lmsvc.h :451
   SERVICE_UIC_M_UAS_SERVERS_NMEMB : constant := 3093;   --  lmsvc.h :456
   SERVICE_UIC_M_UAS_SERVERS_NOGRP : constant := 3094;   --  lmsvc.h :461
   SERVICE_UIC_M_UAS_INVALID_ROLE  : constant := 3095;   --  lmsvc.h :466
   SERVICE_UIC_M_NETLOGON_NO_DC    : constant := 3096;   --  lmsvc.h :473
   SERVICE_UIC_M_NETLOGON_DC_CFLCT : constant := 3097;   --  lmsvc.h :478
   SERVICE_UIC_M_NETLOGON_AUTH     : constant := 3098;   --  lmsvc.h :483
   SERVICE_UIC_M_UAS_PROLOG        : constant := 3099;   --  lmsvc.h :488
   SERVICE2_BASE                   : constant := 5600;   --  lmsvc.h :494
   SERVICE_UIC_M_NETLOGON_MPATH    : constant := 5600;   --  lmsvc.h :497
   SERVICE_UIC_M_LSA_MACHINE_ACCT  : constant := 5601;   --  lmsvc.h :502
   SERVICE_UIC_M_DATABASE_ERROR    : constant := 5602;   --  lmsvc.h :508

   type SERVICE_INFO_0;                                    --  lmsvc.h:69
   type SERVICE_INFO_1;                                    --  lmsvc.h:73
   type SERVICE_INFO_2;                                    --  lmsvc.h:80

   type PSERVICE_INFO_0 is access all SERVICE_INFO_0;      --  lmsvc.h:71
   subtype LPSERVICE_INFO_0 is PSERVICE_INFO_0;            --  lmsvc.h:71
   type PSERVICE_INFO_1 is access all SERVICE_INFO_1;      --  lmsvc.h:78
   subtype LPSERVICE_INFO_1 is PSERVICE_INFO_1;            --  lmsvc.h:78
   type PSERVICE_INFO_2 is access all SERVICE_INFO_2;      --  lmsvc.h:88
   subtype LPSERVICE_INFO_2 is PSERVICE_INFO_2;            --  lmsvc.h:88

   type SERVICE_INFO_0 is                                  --  lmsvc.h:69
      record
         svci0_name : Win32.Winnt.LPTSTR;                 --  lmsvc.h:70
      end record;

   type SERVICE_INFO_1 is                                  --  lmsvc.h:73
      record
         svci1_name   : Win32.Winnt.LPTSTR; --  lmsvc.h :74
         svci1_status : Win32.DWORD;        --  lmsvc.h :75
         svci1_code   : Win32.DWORD;        --  lmsvc.h :76
         svci1_pid    : Win32.DWORD;        --  lmsvc.h :77
      end record;

   type SERVICE_INFO_2 is                                  --  lmsvc.h:80
      record
         svci2_name           : Win32.Winnt.LPTSTR; --  lmsvc.h :81
         svci2_status         : Win32.DWORD;        --  lmsvc.h :82
         svci2_code           : Win32.DWORD;        --  lmsvc.h :83
         svci2_pid            : Win32.DWORD;        --  lmsvc.h :84
         svci2_text           : Win32.Winnt.LPTSTR; --  lmsvc.h :85
         svci2_specific_error : Win32.DWORD;        --  lmsvc.h :86
         svci2_display_name   : Win32.Winnt.LPTSTR; --  lmsvc.h :87
      end record;

   function NetServiceControl
     (servername : Win32.Winnt.LPTSTR;
      service : Win32.Winnt.LPTSTR;
      opcode : Win32.DWORD;
      arg : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmsvc.h:95

   function NetServiceEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmsvc.h:104

   function NetServiceGetInfo
     (servername : Win32.Winnt.LPTSTR;
      service : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmsvc.h:115

   function NetServiceInstall
     (servername : Win32.Winnt.LPTSTR;
      service : Win32.Winnt.LPTSTR;
      argc : Win32.DWORD;
      argv : Win32.String_Vector_Access;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmsvc.h:123

private

   pragma Convention (c_pass_by_copy, SERVICE_INFO_0);      --  lmsvc.h:69
   pragma Convention (c_pass_by_copy, SERVICE_INFO_1);      --  lmsvc.h:73
   pragma Convention (C, SERVICE_INFO_2);                   --  lmsvc.h:80

   pragma Import (Stdcall, NetServiceControl, "NetServiceControl");
   --  lmsvc.h:95
   pragma Import (Stdcall, NetServiceEnum, "NetServiceEnum");   --  lmsvc.h:104
   pragma Import (Stdcall, NetServiceGetInfo, "NetServiceGetInfo");
   --  lmsvc.h:115
   pragma Import (Stdcall, NetServiceInstall, "NetServiceInstall");
   --  lmsvc.h:123

end Win32.Lmsvc;
