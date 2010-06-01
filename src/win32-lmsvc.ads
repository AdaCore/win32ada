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

package Win32.Lmsvc is

   SERVICE_INSTALL_STATE           : constant := 16#3#;
   SERVICE_UNINSTALLED             : constant := 16#0#;
   SERVICE_INSTALL_PENDING         : constant := 16#1#;
   SERVICE_UNINSTALL_PENDING       : constant := 16#2#;
   SERVICE_INSTALLED               : constant := 16#3#;
   SERVICE_PAUSE_STATE             : constant := 16#c#;
   LM20_SERVICE_ACTIVE             : constant := 16#0#;
   LM20_SERVICE_CONTINUE_PENDING   : constant := 16#4#;
   LM20_SERVICE_PAUSE_PENDING      : constant := 16#8#;
   LM20_SERVICE_PAUSED             : constant := 16#c#;
   SERVICE_NOT_UNINSTALLABLE       : constant := 16#0#;
   SERVICE_UNINSTALLABLE           : constant := 16#10#;
   SERVICE_NOT_PAUSABLE            : constant := 16#0#;
   SERVICE_PAUSABLE                : constant := 16#20#;
   SERVICE_REDIR_PAUSED            : constant := 16#700#;
   SERVICE_REDIR_DISK_PAUSED       : constant := 16#100#;
   SERVICE_REDIR_PRINT_PAUSED      : constant := 16#200#;
   SERVICE_REDIR_COMM_PAUSED       : constant := 16#400#;
   SERVICE_CTRL_INTERROGATE        : constant := 0;
   SERVICE_CTRL_PAUSE              : constant := 1;
   SERVICE_CTRL_CONTINUE           : constant := 2;
   SERVICE_CTRL_UNINSTALL          : constant := 3;
   SERVICE_CTRL_REDIR_DISK         : constant := 16#1#;
   SERVICE_CTRL_REDIR_PRINT        : constant := 16#2#;
   SERVICE_CTRL_REDIR_COMM         : constant := 16#4#;
   SERVICE_IP_NO_HINT              : constant := 16#0#;
   SERVICE_CCP_NO_HINT             : constant := 16#0#;
   SERVICE_IP_QUERY_HINT           : constant := 16#10000#;
   SERVICE_CCP_QUERY_HINT          : constant := 16#10000#;
   SERVICE_IP_CHKPT_NUM            : constant := 16#ff#;
   SERVICE_CCP_CHKPT_NUM           : constant := 16#ff#;
   SERVICE_IP_WAIT_TIME            : constant := 16#ff00#;
   SERVICE_CCP_WAIT_TIME           : constant := 16#ff00#;
   SERVICE_IP_WAITTIME_SHIFT       : constant := 8;
   SERVICE_NTIP_WAITTIME_SHIFT     : constant := 12;
   UPPER_HINT_MASK                 : constant := 16#ff00#;
   LOWER_HINT_MASK                 : constant := 16#ff#;
   UPPER_GET_HINT_MASK             : constant := 16#ff00000#;
   LOWER_GET_HINT_MASK             : constant := 16#ff00#;
   SERVICE_NT_MAXTIME              : constant := 16#ffff#;
   SERVICE_RESRV_MASK              : constant := 16#1ffff#;
   SERVICE_MAXTIME                 : constant := 16#ff#;
   SERVICE_BASE                    : constant := 3050;
   SERVICE_UIC_NORMAL              : constant := 0;
   SERVICE_UIC_BADPARMVAL          : constant := 3051;
   SERVICE_UIC_MISSPARM            : constant := 3052;
   SERVICE_UIC_UNKPARM             : constant := 3053;
   SERVICE_UIC_RESOURCE            : constant := 3054;
   SERVICE_UIC_CONFIG              : constant := 3055;
   SERVICE_UIC_SYSTEM              : constant := 3056;
   SERVICE_UIC_INTERNAL            : constant := 3057;
   SERVICE_UIC_AMBIGPARM           : constant := 3058;
   SERVICE_UIC_DUPPARM             : constant := 3059;
   SERVICE_UIC_KILL                : constant := 3060;
   SERVICE_UIC_EXEC                : constant := 3061;
   SERVICE_UIC_SUBSERV             : constant := 3062;
   SERVICE_UIC_CONFLPARM           : constant := 3063;
   SERVICE_UIC_FILE                : constant := 3064;
   SERVICE_UIC_M_NULL              : constant := 0;
   SERVICE_UIC_M_MEMORY            : constant := 3070;
   SERVICE_UIC_M_DISK              : constant := 3071;
   SERVICE_UIC_M_THREADS           : constant := 3072;
   SERVICE_UIC_M_PROCESSES         : constant := 3073;
   SERVICE_UIC_M_SECURITY          : constant := 3074;
   SERVICE_UIC_M_LANROOT           : constant := 3075;
   SERVICE_UIC_M_REDIR             : constant := 3076;
   SERVICE_UIC_M_SERVER            : constant := 3077;
   SERVICE_UIC_M_SEC_FILE_ERR      : constant := 3078;
   SERVICE_UIC_M_FILES             : constant := 3079;
   SERVICE_UIC_M_LOGS              : constant := 3080;
   SERVICE_UIC_M_LANGROUP          : constant := 3081;
   SERVICE_UIC_M_MSGNAME           : constant := 3082;
   SERVICE_UIC_M_ANNOUNCE          : constant := 3083;
   SERVICE_UIC_M_UAS               : constant := 3084;
   SERVICE_UIC_M_SERVER_SEC_ERR    : constant := 3085;
   SERVICE_UIC_M_WKSTA             : constant := 3087;
   SERVICE_UIC_M_ERRLOG            : constant := 3088;
   SERVICE_UIC_M_FILE_UW           : constant := 3089;
   SERVICE_UIC_M_ADDPAK            : constant := 3090;
   SERVICE_UIC_M_LAZY              : constant := 3091;
   SERVICE_UIC_M_UAS_MACHINE_ACCT  : constant := 3092;
   SERVICE_UIC_M_UAS_SERVERS_NMEMB : constant := 3093;
   SERVICE_UIC_M_UAS_SERVERS_NOGRP : constant := 3094;
   SERVICE_UIC_M_UAS_INVALID_ROLE  : constant := 3095;
   SERVICE_UIC_M_NETLOGON_NO_DC    : constant := 3096;
   SERVICE_UIC_M_NETLOGON_DC_CFLCT : constant := 3097;
   SERVICE_UIC_M_NETLOGON_AUTH     : constant := 3098;
   SERVICE_UIC_M_UAS_PROLOG        : constant := 3099;
   SERVICE2_BASE                   : constant := 5600;
   SERVICE_UIC_M_NETLOGON_MPATH    : constant := 5600;
   SERVICE_UIC_M_LSA_MACHINE_ACCT  : constant := 5601;
   SERVICE_UIC_M_DATABASE_ERROR    : constant := 5602;

   type SERVICE_INFO_0;
   type SERVICE_INFO_1;
   type SERVICE_INFO_2;

   type PSERVICE_INFO_0 is access all SERVICE_INFO_0;
   subtype LPSERVICE_INFO_0 is PSERVICE_INFO_0;
   type PSERVICE_INFO_1 is access all SERVICE_INFO_1;
   subtype LPSERVICE_INFO_1 is PSERVICE_INFO_1;
   type PSERVICE_INFO_2 is access all SERVICE_INFO_2;
   subtype LPSERVICE_INFO_2 is PSERVICE_INFO_2;

   type SERVICE_INFO_0 is record
      svci0_name : Win32.Winnt.LPTSTR;
   end record;

   type SERVICE_INFO_1 is record
      svci1_name   : Win32.Winnt.LPTSTR;
      svci1_status : Win32.DWORD;
      svci1_code   : Win32.DWORD;
      svci1_pid    : Win32.DWORD;
   end record;

   type SERVICE_INFO_2 is record
      svci2_name           : Win32.Winnt.LPTSTR;
      svci2_status         : Win32.DWORD;
      svci2_code           : Win32.DWORD;
      svci2_pid            : Win32.DWORD;
      svci2_text           : Win32.Winnt.LPTSTR;
      svci2_specific_error : Win32.DWORD;
      svci2_display_name   : Win32.Winnt.LPTSTR;
   end record;

   function NetServiceControl
     (servername : Win32.Winnt.LPTSTR;
      service    : Win32.Winnt.LPTSTR;
      opcode     : Win32.DWORD;
      arg        : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetServiceEnum
     (servername    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetServiceGetInfo
     (servername : Win32.Winnt.LPTSTR;
      service    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetServiceInstall
     (servername : Win32.Winnt.LPTSTR;
      service    : Win32.Winnt.LPTSTR;
      argc       : Win32.DWORD;
      argv       : Win32.String_Vector_Access;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, SERVICE_INFO_0);
   pragma Convention (C_Pass_By_Copy, SERVICE_INFO_1);
   pragma Convention (C, SERVICE_INFO_2);

   pragma Import (Stdcall, NetServiceControl, "NetServiceControl");
   pragma Import (Stdcall, NetServiceEnum, "NetServiceEnum");
   pragma Import (Stdcall, NetServiceGetInfo, "NetServiceGetInfo");
   pragma Import (Stdcall, NetServiceInstall, "NetServiceInstall");

end Win32.Lmsvc;
