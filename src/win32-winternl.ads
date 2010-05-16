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

--  Some internal non documented API, use with caution

with Win32.Winnt;

package Win32.Winternl is

   pragma Linker_Options ("-lntdll");

   type PROCESS_BASIC_INFORMATION is record
      ExitStatus                   : DWORD;
      PebBaseAddress               : DWORD;
      AffinityMask                 : DWORD;
      BasePriority                 : DWORD;
      UniqueProcessId              : DWORD;
      InheritedFromUniqueProcessId : DWORD;
   end record;

   type PROCESSINFOCLASS is new DWORD;

   ProcessBasicInformation : constant PROCESSINFOCLASS := 0;
   ProcessDebugPort        : constant PROCESSINFOCLASS := 7;
   ProcessWow64Information : constant PROCESSINFOCLASS := 26;
   ProcessImageFileName    : constant PROCESSINFOCLASS := 27;

   function NtQueryInformationProcess
     (ProcessHandle            : Win32.Winnt.HANDLE;
      ProcessInformationClass  : PROCESSINFOCLASS;
      ProcessInformation       : access PROCESS_BASIC_INFORMATION;
      ProcessInformationLength : DWORD;
      ReturnLength             : access DWORD) return DWORD;

   type THREADINFOCLASS is
     (ThreadBasicInformation,
      ThreadTimes,
      ThreadPriority,
      ThreadBasePriority,
      ThreadAffinityMask,
      ThreadImpersonationToken,
      ThreadDescriptorTableEntry,
      ThreadEnableAlignmentFaultFixup,
      ThreadEventPair,
      ThreadQuerySetWin32StartAddress,
      ThreadZeroTlsCell,
      ThreadPerformanceCount,
      ThreadAmILastThread,
      ThreadIdealProcessor,
      ThreadPriorityBoost,
      ThreadSetTlsArrayAddress,
      ThreadIsIoPending,
      ThreadHideFromDebugger);
   for THREADINFOCLASS'Size use 32;

   type THREAD_BASIC_INFORMATION is record
      ExitStatus          : DWORD;
      TebBaseAddress      : DWORD;
      UniqueProcessId     : DWORD;
      UniqueThreadId      : DWORD;
      AffinityMask        : DWORD;
      BasePriority        : DWORD;
      DiffProcessPriority : DWORD;
   end record;

   function NtQueryInformationThread
     (ThreadHandle            : Win32.Winnt.HANDLE;
      ThreadInformationClass  : THREADINFOCLASS;
      ThreadInformation       : access THREAD_BASIC_INFORMATION;
      ThreadInformationLength : DWORD;
      ReturnLength            : access DWORD) return DWORD;

private

   pragma Convention (C_Pass_By_Copy, PROCESS_BASIC_INFORMATION);
   pragma Import
     (Stdcall, NtQueryInformationProcess, "NtQueryInformationProcess");
   pragma Import
     (Stdcall, NtQueryInformationThread, "NtQueryInformationThread");

end Win32.Winternl;
