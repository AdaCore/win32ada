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



package Win32.Lmat is



   JOB_RUN_PERIODICALLY : constant := 16#1#;               --  lmat.h:48

   JOB_EXEC_ERROR : constant := 16#2#;               --  lmat.h:56

   JOB_RUNS_TODAY : constant := 16#4#;               --  lmat.h:62

   JOB_ADD_CURRENT_DATE : constant := 16#8#;               --  lmat.h:68

   JOB_NONINTERACTIVE : constant := 16#10#;              --  lmat.h:75

   JOB_INPUT_FLAGS : constant := 16#19#;              --  lmat.h:78

   JOB_OUTPUT_FLAGS : constant := 16#17#;              --  lmat.h:82



   type AT_INFO;                                           --  lmat.h:89

   type AT_ENUM;                                           --  lmat.h:97



   type PAT_INFO is access all AT_INFO;                    --  lmat.h:95

   subtype LPAT_INFO is PAT_INFO;                          --  lmat.h:95



   type PAT_ENUM is access all AT_ENUM;                    --  lmat.h:104

   subtype LPAT_ENUM is PAT_ENUM;                          --  lmat.h:104



   type AT_INFO is                                         --  lmat.h:89

      record

         JobTime : Win32.DWORD;                       --  lmat.h:90

         DaysOfMonth : Win32.DWORD;                       --  lmat.h:91

         DaysOfWeek : Win32.UCHAR;                       --  lmat.h:92

         Flags : Win32.UCHAR;                       --  lmat.h:93

         Command : Win32.LPWSTR;                      --  lmat.h:94

      end record;



   type AT_ENUM is                                         --  lmat.h:97

      record

         JobId : Win32.DWORD;                       --  lmat.h:98

         JobTime : Win32.DWORD;                       --  lmat.h:99

         DaysOfMonth : Win32.DWORD;                       --  lmat.h:100

         DaysOfWeek : Win32.UCHAR;                       --  lmat.h:101

         Flags : Win32.UCHAR;                       --  lmat.h:102

         Command : Win32.LPWSTR;                      --  lmat.h:103

      end record;



   function NetScheduleJobAdd

     (Servername : Win32.LPWSTR;

      Buffer : Win32.LPBYTE;

      JobId : Win32.LPDWORD)

     return Win32.DWORD;                          --  lmat.h:107



   function NetScheduleJobDel

     (Servername : Win32.LPWSTR;

      MinJobId : Win32.DWORD;

      MaxJobId : Win32.DWORD)

     return Win32.DWORD;                          --  lmat.h:114



   function NetScheduleJobEnum

     (Servername : Win32.LPWSTR;

      PointerToBuffer : access Win32.PBYTE;

      PrefferedMaximumLength : Win32.DWORD;

      EntriesRead : Win32.LPDWORD;

      TotalEntries : Win32.LPDWORD;

      ResumeHandle : Win32.LPDWORD)

     return Win32.DWORD;                          --  lmat.h:121



   function NetScheduleJobGetInfo

     (Servername : Win32.LPWSTR;

      JobId : Win32.DWORD;

      PointerToBuffer : access Win32.PBYTE)

     return Win32.DWORD;                          --  lmat.h:131



private



   pragma Convention (C_Pass_By_Copy, AT_INFO);             --  lmat.h:89

   pragma Convention (C, AT_ENUM);                          --  lmat.h:97



   pragma Import (Stdcall, NetScheduleJobAdd, "NetScheduleJobAdd");

   --  lmat.h:107

   pragma Import (Stdcall, NetScheduleJobDel, "NetScheduleJobDel");

   --  lmat.h:114

   pragma Import (Stdcall, NetScheduleJobEnum, "NetScheduleJobEnum");

   --  lmat.h:121

   pragma Import (Stdcall, NetScheduleJobGetInfo, "NetScheduleJobGetInfo");

   --  lmat.h:131



end Win32.Lmat;





