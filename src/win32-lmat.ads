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

package Win32.Lmat is

   JOB_RUN_PERIODICALLY : constant := 16#1#;
   JOB_EXEC_ERROR       : constant := 16#2#;
   JOB_RUNS_TODAY       : constant := 16#4#;
   JOB_ADD_CURRENT_DATE : constant := 16#8#;
   JOB_NONINTERACTIVE   : constant := 16#10#;
   JOB_INPUT_FLAGS      : constant := 16#19#;
   JOB_OUTPUT_FLAGS     : constant := 16#17#;

   type AT_INFO;
   type AT_ENUM;

   type PAT_INFO is access all AT_INFO;
   subtype LPAT_INFO is PAT_INFO;

   type PAT_ENUM is access all AT_ENUM;
   subtype LPAT_ENUM is PAT_ENUM;

   type AT_INFO is record
      JobTime     : Win32.DWORD;
      DaysOfMonth : Win32.DWORD;
      DaysOfWeek  : Win32.UCHAR;
      Flags       : Win32.UCHAR;
      Command     : Win32.LPWSTR;
   end record;

   type AT_ENUM is record
      JobId       : Win32.DWORD;
      JobTime     : Win32.DWORD;
      DaysOfMonth : Win32.DWORD;
      DaysOfWeek  : Win32.UCHAR;
      Flags       : Win32.UCHAR;
      Command     : Win32.LPWSTR;
   end record;

   function NetScheduleJobAdd
     (Servername : Win32.LPWSTR;
      Buffer     : Win32.LPBYTE;
      JobId      : Win32.LPDWORD)
      return Win32.DWORD;

   function NetScheduleJobDel
     (Servername : Win32.LPWSTR;
      MinJobId   : Win32.DWORD;
      MaxJobId   : Win32.DWORD)
      return Win32.DWORD;

   function NetScheduleJobEnum
     (Servername             : Win32.LPWSTR;
      PointerToBuffer        : access Win32.PBYTE;
      PrefferedMaximumLength : Win32.DWORD;
      EntriesRead            : Win32.LPDWORD;
      TotalEntries           : Win32.LPDWORD;
      ResumeHandle           : Win32.LPDWORD)
      return Win32.DWORD;

   function NetScheduleJobGetInfo
     (Servername      : Win32.LPWSTR;
      JobId           : Win32.DWORD;
      PointerToBuffer : access Win32.PBYTE)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, AT_INFO);
   pragma Convention (C, AT_ENUM);

   pragma Import (Stdcall, NetScheduleJobAdd, "NetScheduleJobAdd");
   pragma Import (Stdcall, NetScheduleJobDel, "NetScheduleJobDel");
   pragma Import (Stdcall, NetScheduleJobEnum, "NetScheduleJobEnum");
   pragma Import (Stdcall, NetScheduleJobGetInfo, "NetScheduleJobGetInfo");

end Win32.Lmat;
