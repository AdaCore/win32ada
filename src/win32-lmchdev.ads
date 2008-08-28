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

package Win32.Lmchdev is

   CHARDEV_STAT_OPENED         : constant := 16#2#; --  lmchdev.h :180
   CHARDEV_STAT_ERROR          : constant := 16#4#; --  lmchdev.h :181
   CHARDEV_CLOSE               : constant := 0;     --  lmchdev.h :187
   CHARDEVQ_DEV_PARMNUM        : constant := 1;     --  lmchdev.h :193
   CHARDEVQ_PRIORITY_PARMNUM   : constant := 2;     --  lmchdev.h :194
   CHARDEVQ_DEVS_PARMNUM       : constant := 3;     --  lmchdev.h :195
   CHARDEVQ_NUMUSERS_PARMNUM   : constant := 4;     --  lmchdev.h :196
   CHARDEVQ_NUMAHEAD_PARMNUM   : constant := 5;     --  lmchdev.h :197
   CHARDEVQ_PRIORITY_INFOLEVEL : constant := 1002;  --  lmchdev.h :203
   CHARDEVQ_DEVS_INFOLEVEL     : constant := 1003;  --  lmchdev.h :205
   CHARDEVQ_MAX_PRIORITY       : constant := 1;     --  lmchdev.h :212
   CHARDEVQ_MIN_PRIORITY       : constant := 9;     --  lmchdev.h :213
   CHARDEVQ_DEF_PRIORITY       : constant := 5;     --  lmchdev.h :214
   CHARDEVQ_NO_REQUESTS        : constant := -1;    --  lmchdev.h :220
   HANDLE_INFO_LEVEL_1         : constant := 1;     --  lmchdev.h :268
   HANDLE_CHARTIME_PARMNUM     : constant := 1;     --  lmchdev.h :274
   HANDLE_CHARCOUNT_PARMNUM    : constant := 2;     --  lmchdev.h :275

   type CHARDEV_INFO_0;                                    --  lmchdev.h:84
   type CHARDEV_INFO_1;                                    --  lmchdev.h:88
   type CHARDEVQ_INFO_0;                                   --  lmchdev.h:151
   type CHARDEVQ_INFO_1;                                   --  lmchdev.h:155
   type CHARDEVQ_INFO_1002;                                --  lmchdev.h:163
   type CHARDEVQ_INFO_1003;                                --  lmchdev.h:167
   type HANDLE_INFO_1;                                     --  lmchdev.h:255

   type PCHARDEV_INFO_0 is access all CHARDEV_INFO_0;      --  lmchdev.h:86
   subtype LPCHARDEV_INFO_0 is PCHARDEV_INFO_0;            --  lmchdev.h:86

   type PCHARDEV_INFO_1 is access all CHARDEV_INFO_1;      --  lmchdev.h:93
   subtype LPCHARDEV_INFO_1 is PCHARDEV_INFO_1;            --  lmchdev.h:93

   type PCHARDEVQ_INFO_0 is access all CHARDEVQ_INFO_0;    --  lmchdev.h:153
   subtype LPCHARDEVQ_INFO_0 is PCHARDEVQ_INFO_0;          --  lmchdev.h:153

   type PCHARDEVQ_INFO_1 is access all CHARDEVQ_INFO_1;    --  lmchdev.h:161
   subtype LPCHARDEVQ_INFO_1 is PCHARDEVQ_INFO_1;          --  lmchdev.h:161

   type PCHARDEVQ_INFO_1002 is access all CHARDEVQ_INFO_1002;
   --  lmchdev.h:165
   subtype LPCHARDEVQ_INFO_1002 is PCHARDEVQ_INFO_1002;    --  lmchdev.h:165

   type PCHARDEVQ_INFO_1003 is access all CHARDEVQ_INFO_1003;
   --  lmchdev.h:169
   subtype LPCHARDEVQ_INFO_1003 is PCHARDEVQ_INFO_1003;    --  lmchdev.h:169

   type PHANDLE_INFO_1 is access all HANDLE_INFO_1;        --  lmchdev.h:258
   subtype LPHANDLE_INFO_1 is PHANDLE_INFO_1;              --  lmchdev.h:258

   type CHARDEV_INFO_0 is                                  --  lmchdev.h:84
      record
         ch0_dev : Win32.Winnt.LPTSTR;                    --  lmchdev.h:85
      end record;

   type CHARDEV_INFO_1 is                                  --  lmchdev.h:88
      record
         ch1_dev : Win32.Winnt.LPTSTR;               --  lmchdev.h:89
         ch1_status : Win32.DWORD;                      --  lmchdev.h:90
         ch1_username : Win32.Winnt.LPTSTR;               --  lmchdev.h:91
         ch1_time : Win32.DWORD;                      --  lmchdev.h:92
      end record;

   type CHARDEVQ_INFO_0 is                                 --  lmchdev.h:151
      record
         cq0_dev : Win32.Winnt.LPTSTR;                    --  lmchdev.h:152
      end record;

   type CHARDEVQ_INFO_1 is                                 --  lmchdev.h:155
      record
         cq1_dev : Win32.Winnt.LPTSTR;               --  lmchdev.h:156
         cq1_priority : Win32.DWORD;                      --  lmchdev.h:157
         cq1_devs : Win32.Winnt.LPTSTR;               --  lmchdev.h:158
         cq1_numusers : Win32.DWORD;                      --  lmchdev.h:159
         cq1_numahead : Win32.DWORD;                      --  lmchdev.h:160
      end record;

   type CHARDEVQ_INFO_1002 is                              --  lmchdev.h:163
      record
         cq1002_priority : Win32.DWORD;                   --  lmchdev.h:164
      end record;

   type CHARDEVQ_INFO_1003 is                              --  lmchdev.h:167
      record
         cq1003_devs : Win32.Winnt.LPTSTR;                --  lmchdev.h:168
      end record;

   type HANDLE_INFO_1 is                                   --  lmchdev.h:255
      record
         hdli1_chartime : Win32.DWORD;                   --  lmchdev.h:256
         hdli1_charcount : Win32.DWORD;                   --  lmchdev.h:257
      end record;

   function NetCharDevEnum
     (servername : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmchdev.h:55

   function NetCharDevGetInfo
     (servername : Win32.Winnt.LPTSTR;
      devname : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmchdev.h:66

   function NetCharDevControl
     (servername : Win32.Winnt.LPTSTR;
      devname : Win32.Winnt.LPTSTR;
      opcode : Win32.DWORD)
     return Win32.DWORD;                          --  lmchdev.h:74

   function NetCharDevQEnum
     (servername : Win32.Winnt.LPTSTR;
      username : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE;
      prefmaxlen : Win32.DWORD;
      entriesread : Win32.LPDWORD;
      totalentries : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmchdev.h:105

   function NetCharDevQGetInfo
     (servername : Win32.Winnt.LPTSTR;
      queuename : Win32.Winnt.LPTSTR;
      username : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmchdev.h:117

   function NetCharDevQSetInfo
     (servername : Win32.Winnt.LPTSTR;
      queuename : Win32.Winnt.LPTSTR;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parm_err : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmchdev.h:126

   function NetCharDevQPurge
     (servername : Win32.Winnt.LPTSTR;
      queuename : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmchdev.h:135

   function NetCharDevQPurgeSelf
     (servername : Win32.Winnt.LPTSTR;
      queuename : Win32.Winnt.LPTSTR;
      computername : Win32.Winnt.LPTSTR)
     return Win32.DWORD;                          --  lmchdev.h:141

   function NetHandleGetInfo
     (handle : Win32.Winnt.HANDLE;
      level : Win32.DWORD;
      bufptr : access Win32.PBYTE)
     return Win32.DWORD;                          --  lmchdev.h:236

   function NetHandleSetInfo
     (handle : Win32.Winnt.HANDLE;
      level : Win32.DWORD;
      buf : Win32.LPBYTE;
      parmnum : Win32.DWORD;
      parmerr : Win32.LPDWORD)
     return Win32.DWORD;                          --  lmchdev.h:243

private

   pragma Convention (C_Pass_By_Copy, CHARDEV_INFO_0);        --  lmchdev.h:84
   pragma Convention (C_Pass_By_Copy, CHARDEV_INFO_1);        --  lmchdev.h:88
   pragma Convention (C_Pass_By_Copy, CHARDEVQ_INFO_0);       --  lmchdev.h:151
   pragma Convention (C, CHARDEVQ_INFO_1);                    --  lmchdev.h:155
   pragma Convention (C_Pass_By_Copy, CHARDEVQ_INFO_1002);    --  lmchdev.h:163
   pragma Convention (C_Pass_By_Copy, CHARDEVQ_INFO_1003);    --  lmchdev.h:167
   pragma Convention (C_Pass_By_Copy, HANDLE_INFO_1);         --  lmchdev.h:255

   pragma Import (Stdcall, NetCharDevEnum, "NetCharDevEnum");  --  lmchdev.h:55
   pragma Import (Stdcall, NetCharDevGetInfo, "NetCharDevGetInfo");
   --  lmchdev.h:66
   pragma Import (Stdcall, NetCharDevControl, "NetCharDevControl");
   --  lmchdev.h:74
   pragma Import (Stdcall, NetCharDevQEnum, "NetCharDevQEnum");
   --  lmchdev.h:105
   pragma Import (Stdcall, NetCharDevQGetInfo, "NetCharDevQGetInfo");
   --  lmchdev.h:117
   pragma Import (Stdcall, NetCharDevQSetInfo, "NetCharDevQSetInfo");
   --  lmchdev.h:126
   pragma Import (Stdcall, NetCharDevQPurge, "NetCharDevQPurge");
   --  lmchdev.h:135
   pragma Import (Stdcall, NetCharDevQPurgeSelf, "NetCharDevQPurgeSelf");
   --  lmchdev.h:141
   pragma Import (Stdcall, NetHandleGetInfo, "NetHandleGetInfo");
   --  lmchdev.h:236
   pragma Import (Stdcall, NetHandleSetInfo, "NetHandleSetInfo");
   --  lmchdev.h:243

end Win32.Lmchdev;
