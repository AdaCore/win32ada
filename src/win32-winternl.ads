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
      ReturnLength             : access DWORD)
      return DWORD;

   type THREADINFOCLASS is (
      ThreadBasicInformation,
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
      ReturnLength            : access DWORD)
      return DWORD;

private

   pragma Convention (C_Pass_By_Copy, PROCESS_BASIC_INFORMATION);
   pragma Import
     (Stdcall,
      NtQueryInformationProcess,
      "NtQueryInformationProcess");
   pragma Import
     (Stdcall,
      NtQueryInformationThread,
      "NtQueryInformationThread");

end Win32.Winternl;
