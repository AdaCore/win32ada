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

package Win32.Lmchdev is

   CHARDEV_STAT_OPENED         : constant := 16#2#;
   CHARDEV_STAT_ERROR          : constant := 16#4#;
   CHARDEV_CLOSE               : constant := 0;
   CHARDEVQ_DEV_PARMNUM        : constant := 1;
   CHARDEVQ_PRIORITY_PARMNUM   : constant := 2;
   CHARDEVQ_DEVS_PARMNUM       : constant := 3;
   CHARDEVQ_NUMUSERS_PARMNUM   : constant := 4;
   CHARDEVQ_NUMAHEAD_PARMNUM   : constant := 5;
   CHARDEVQ_PRIORITY_INFOLEVEL : constant := 1002;
   CHARDEVQ_DEVS_INFOLEVEL     : constant := 1003;
   CHARDEVQ_MAX_PRIORITY       : constant := 1;
   CHARDEVQ_MIN_PRIORITY       : constant := 9;
   CHARDEVQ_DEF_PRIORITY       : constant := 5;
   CHARDEVQ_NO_REQUESTS        : constant := -1;
   HANDLE_INFO_LEVEL_1         : constant := 1;
   HANDLE_CHARTIME_PARMNUM     : constant := 1;
   HANDLE_CHARCOUNT_PARMNUM    : constant := 2;

   type CHARDEV_INFO_0;
   type CHARDEV_INFO_1;
   type CHARDEVQ_INFO_0;
   type CHARDEVQ_INFO_1;
   type CHARDEVQ_INFO_1002;
   type CHARDEVQ_INFO_1003;
   type HANDLE_INFO_1;

   type PCHARDEV_INFO_0 is access all CHARDEV_INFO_0;
   subtype LPCHARDEV_INFO_0 is PCHARDEV_INFO_0;

   type PCHARDEV_INFO_1 is access all CHARDEV_INFO_1;
   subtype LPCHARDEV_INFO_1 is PCHARDEV_INFO_1;

   type PCHARDEVQ_INFO_0 is access all CHARDEVQ_INFO_0;
   subtype LPCHARDEVQ_INFO_0 is PCHARDEVQ_INFO_0;

   type PCHARDEVQ_INFO_1 is access all CHARDEVQ_INFO_1;
   subtype LPCHARDEVQ_INFO_1 is PCHARDEVQ_INFO_1;

   type PCHARDEVQ_INFO_1002 is access all CHARDEVQ_INFO_1002;
   subtype LPCHARDEVQ_INFO_1002 is PCHARDEVQ_INFO_1002;

   type PCHARDEVQ_INFO_1003 is access all CHARDEVQ_INFO_1003;
   subtype LPCHARDEVQ_INFO_1003 is PCHARDEVQ_INFO_1003;

   type PHANDLE_INFO_1 is access all HANDLE_INFO_1;
   subtype LPHANDLE_INFO_1 is PHANDLE_INFO_1;

   type CHARDEV_INFO_0 is record
      ch0_dev : Win32.Winnt.LPTSTR;
   end record;

   type CHARDEV_INFO_1 is record
      ch1_dev      : Win32.Winnt.LPTSTR;
      ch1_status   : Win32.DWORD;
      ch1_username : Win32.Winnt.LPTSTR;
      ch1_time     : Win32.DWORD;
   end record;

   type CHARDEVQ_INFO_0 is record
      cq0_dev : Win32.Winnt.LPTSTR;
   end record;

   type CHARDEVQ_INFO_1 is record
      cq1_dev      : Win32.Winnt.LPTSTR;
      cq1_priority : Win32.DWORD;
      cq1_devs     : Win32.Winnt.LPTSTR;
      cq1_numusers : Win32.DWORD;
      cq1_numahead : Win32.DWORD;
   end record;

   type CHARDEVQ_INFO_1002 is record
      cq1002_priority : Win32.DWORD;
   end record;

   type CHARDEVQ_INFO_1003 is record
      cq1003_devs : Win32.Winnt.LPTSTR;
   end record;

   type HANDLE_INFO_1 is record
      hdli1_chartime  : Win32.DWORD;
      hdli1_charcount : Win32.DWORD;
   end record;

   function NetCharDevEnum
     (servername    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetCharDevGetInfo
     (servername : Win32.Winnt.LPTSTR;
      devname    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetCharDevControl
     (servername : Win32.Winnt.LPTSTR;
      devname    : Win32.Winnt.LPTSTR;
      opcode     : Win32.DWORD)
      return Win32.DWORD;

   function NetCharDevQEnum
     (servername    : Win32.Winnt.LPTSTR;
      username      : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetCharDevQGetInfo
     (servername : Win32.Winnt.LPTSTR;
      queuename  : Win32.Winnt.LPTSTR;
      username   : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetCharDevQSetInfo
     (servername : Win32.Winnt.LPTSTR;
      queuename  : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      buf        : Win32.LPBYTE;
      parm_err   : Win32.LPDWORD)
      return Win32.DWORD;

   function NetCharDevQPurge
     (servername : Win32.Winnt.LPTSTR;
      queuename  : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetCharDevQPurgeSelf
     (servername   : Win32.Winnt.LPTSTR;
      queuename    : Win32.Winnt.LPTSTR;
      computername : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetHandleGetInfo
     (handle : Win32.Winnt.HANDLE;
      level  : Win32.DWORD;
      bufptr : access Win32.PBYTE)
      return Win32.DWORD;

   function NetHandleSetInfo
     (handle  : Win32.Winnt.HANDLE;
      level   : Win32.DWORD;
      buf     : Win32.LPBYTE;
      parmnum : Win32.DWORD;
      parmerr : Win32.LPDWORD)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, CHARDEV_INFO_0);
   pragma Convention (C_Pass_By_Copy, CHARDEV_INFO_1);
   pragma Convention (C_Pass_By_Copy, CHARDEVQ_INFO_0);
   pragma Convention (C, CHARDEVQ_INFO_1);
   pragma Convention (C_Pass_By_Copy, CHARDEVQ_INFO_1002);
   pragma Convention (C_Pass_By_Copy, CHARDEVQ_INFO_1003);
   pragma Convention (C_Pass_By_Copy, HANDLE_INFO_1);

   pragma Import (Stdcall, NetCharDevEnum, "NetCharDevEnum");
   pragma Import (Stdcall, NetCharDevGetInfo, "NetCharDevGetInfo");
   pragma Import (Stdcall, NetCharDevControl, "NetCharDevControl");
   pragma Import (Stdcall, NetCharDevQEnum, "NetCharDevQEnum");
   pragma Import (Stdcall, NetCharDevQGetInfo, "NetCharDevQGetInfo");
   pragma Import (Stdcall, NetCharDevQSetInfo, "NetCharDevQSetInfo");
   pragma Import (Stdcall, NetCharDevQPurge, "NetCharDevQPurge");
   pragma Import (Stdcall, NetCharDevQPurgeSelf, "NetCharDevQPurgeSelf");
   pragma Import (Stdcall, NetHandleGetInfo, "NetHandleGetInfo");
   pragma Import (Stdcall, NetHandleSetInfo, "NetHandleSetInfo");

end Win32.Lmchdev;
