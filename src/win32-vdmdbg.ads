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

with Win32.Winbase;
with Win32.Winnt;

package Win32.Vdmdbg is

   DBG_SEGLOAD                : constant := 0;
   DBG_SEGMOVE                : constant := 1;
   DBG_SEGFREE                : constant := 2;
   DBG_MODLOAD                : constant := 3;
   DBG_MODFREE                : constant := 4;
   DBG_SINGLESTEP             : constant := 5;
   DBG_BREAK                  : constant := 6;
   DBG_GPFAULT                : constant := 7;
   DBG_DIVOVERFLOW            : constant := 8;
   DBG_INSTRFAULT             : constant := 9;
   DBG_TASKSTART              : constant := 10;
   DBG_TASKSTOP               : constant := 11;
   DBG_DLLSTART               : constant := 12;
   DBG_DLLSTOP                : constant := 13;
   DBG_ATTACH                 : constant := 14;
   VDMCONTEXT_i386            : constant := 16#10000#;
   VDMCONTEXT_i486            : constant := 16#10000#;
   VDMCONTEXT_CONTROL         : constant := 16#10001#;
   VDMCONTEXT_INTEGER         : constant := 16#10002#;
   VDMCONTEXT_SEGMENTS        : constant := 16#10004#;
   VDMCONTEXT_FLOATING_POINT  : constant := 16#10008#;
   VDMCONTEXT_DEBUG_REGISTERS : constant := 16#10010#;
   VDMCONTEXT_FULL            : constant := 16#10007#;
   V86FLAGS_CARRY             : constant := 16#1#;
   V86FLAGS_PARITY            : constant := 16#4#;
   V86FLAGS_AUXCARRY          : constant := 16#10#;
   V86FLAGS_ZERO              : constant := 16#40#;
   V86FLAGS_SIGN              : constant := 16#80#;
   V86FLAGS_TRACE             : constant := 16#100#;
   V86FLAGS_INTERRUPT         : constant := 16#200#;
   V86FLAGS_DIRECTION         : constant := 16#400#;
   V86FLAGS_OVERFLOW          : constant := 16#800#;
   V86FLAGS_IOPL              : constant := 16#3000#;
   V86FLAGS_IOPL_BITS         : constant := 16#12#;
   V86FLAGS_RESUME            : constant := 16#10000#;
   V86FLAGS_V86               : constant := 16#20000#;
   V86FLAGS_ALIGNMENT         : constant := 16#40000#;
   MAX_MODULE_NAME            : constant := 9;
   MAX_PATH16                 : constant := 255;
   GLOBAL_ALL                 : constant := 0;
   GLOBAL_LRU                 : constant := 1;
   GLOBAL_FREE                : constant := 2;
   GT_UNKNOWN                 : constant := 0;
   GT_DGROUP                  : constant := 1;
   GT_DATA                    : constant := 2;
   GT_CODE                    : constant := 3;
   GT_TASK                    : constant := 4;
   GT_RESOURCE                : constant := 5;
   GT_MODULE                  : constant := 6;
   GT_FREE                    : constant := 7;
   GT_INTERNAL                : constant := 8;
   GT_SENTINEL                : constant := 9;
   GT_BURGERMASTER            : constant := 10;
   GD_USERDEFINED             : constant := 0;
   GD_CURSORCOMPONENT         : constant := 1;
   GD_BITMAP                  : constant := 2;
   GD_ICONCOMPONENT           : constant := 3;
   GD_MENU                    : constant := 4;
   GD_DIALOG                  : constant := 5;
   GD_STRING                  : constant := 6;
   GD_FONTDIR                 : constant := 7;
   GD_FONT                    : constant := 8;
   GD_ACCELERATORS            : constant := 9;
   GD_RCDATA                  : constant := 10;
   GD_ERRTABLE                : constant := 11;
   GD_CURSOR                  : constant := 12;
   GD_ICON                    : constant := 14;
   GD_NAMETABLE               : constant := 15;
   GD_MAX_RESOURCE            : constant := 15;
   WOW_SYSTEM                 : constant DWORD := 16#1#;

   type SEGMENT_NOTE;
   type IMAGE_NOTE;
   type MODULEENTRY;
   type GLOBALENTRY;

   subtype VDMCONTEXT is Win32.Winnt.CONTEXT;
   subtype VDMLDT_ENTRY is Win32.Winnt.LDT_ENTRY;

   type LPVDMCONTEXT is access all VDMCONTEXT;
   type LPVDMLDT_ENTRY is access all VDMLDT_ENTRY;
   type LPMODULEENTRY is access all MODULEENTRY;
   type LPGLOBALENTRY is access all GLOBALENTRY;

   type SEGMENT_NOTE is record
      Selector1 : Win32.WORD;
      Selector2 : Win32.WORD;
      Segment   : Win32.WORD;
      Module    : Win32.CHAR_Array (0 .. MAX_MODULE_NAME);
      FileName  : Win32.CHAR_Array (0 .. MAX_PATH16);
      c_Type    : Win32.WORD;
      Length    : Win32.DWORD;
   end record;

   type IMAGE_NOTE is record
      Module   : Win32.CHAR_Array (0 .. MAX_MODULE_NAME);
      FileName : Win32.CHAR_Array (0 .. MAX_PATH16);
      hModule  : Win32.WORD;
      hTask    : Win32.WORD;
   end record;

   type MODULEENTRY is record
      dwSize    : Win32.DWORD;
      szModule  : Win32.CHAR_Array (0 .. MAX_MODULE_NAME);
      hModule   : Win32.Winnt.HANDLE;
      wcUsage   : Win32.WORD;
      szExePath : Win32.CHAR_Array (0 .. MAX_PATH16);
      wNext     : Win32.WORD;
   end record;

   type GLOBALENTRY is record
      dwSize       : Win32.DWORD;
      dwAddress    : Win32.DWORD;
      dwBlockSize  : Win32.DWORD;
      hBlock       : Win32.Winnt.HANDLE;
      wcLock       : Win32.WORD;
      wcPageLock   : Win32.WORD;
      wFlags       : Win32.WORD;
      wHeapPresent : Win32.BOOL;
      hOwner       : Win32.Winnt.HANDLE;
      wType        : Win32.WORD;
      wData        : Win32.WORD;
      dwNext       : Win32.DWORD;
      dwNextAlt    : Win32.DWORD;
   end record;

   type DEBUGEVENTPROC is access function
     (p1   : Win32.Winbase.LPDEBUG_EVENT;
      p2   : Win32.LPVOID)
      return Win32.DWORD;
   pragma Convention (Stdcall, DEBUGEVENTPROC);
   type PROCESSENUMPROC is access function
     (dwProcessId   : Win32.DWORD;
      dwAttributes  : Win32.DWORD;
      lpUserDefined : Win32.LPARAM)
      return Win32.BOOL;
   pragma Convention (Stdcall, PROCESSENUMPROC);
   type TASKENUMPROC is access function
     (dwThreadId    : Win32.DWORD;
      hMod16        : Win32.WORD;
      hTask16       : Win32.WORD;
      lpUserDefined : Win32.LPARAM)
      return Win32.BOOL;
   pragma Convention (Stdcall, TASKENUMPROC);

   function VDMProcessException
     (lpDebugEvent : Win32.Winbase.LPDEBUG_EVENT)
      return Win32.BOOL;

   function VDMGetThreadSelectorEntry
     (hProcess        : Win32.Winnt.HANDLE;
      hThread         : Win32.Winnt.HANDLE;
      wSelector       : Win32.WORD;
      lpSelectorEntry : LPVDMLDT_ENTRY)
      return Win32.BOOL;

   function VDMGetPointer
     (hProcess  : Win32.Winnt.HANDLE;
      hThread   : Win32.Winnt.HANDLE;
      wSelector : Win32.WORD;
      dwOffset  : Win32.DWORD;
      fProtMode : Win32.BOOL)
      return Win32.ULONG;

   function VDMGetThreadContext
     (lpDebugEvent : Win32.Winbase.LPDEBUG_EVENT;
      lpVDMContext : Win32.Vdmdbg.LPVDMCONTEXT)
      return Win32.BOOL;

   function VDMSetThreadContext
     (lpDebugEvent : Win32.Winbase.LPDEBUG_EVENT;
      lpVDMContext : Win32.Vdmdbg.LPVDMCONTEXT)
      return Win32.BOOL;

   function VDMGetSelectorModule
     (hProcess        : Win32.Winnt.HANDLE;
      hThread         : Win32.Winnt.HANDLE;
      wSelector       : Win32.WORD;
      lpSegmentNumber : Win32.PUINT;
      lpModuleName    : Win32.LPSTR;
      nNameSize       : Win32.UINT;
      lpModulePath    : Win32.LPSTR;
      nPathSize       : Win32.UINT)
      return Win32.BOOL;

   function VDMGetModuleSelector
     (hProcess       : Win32.Winnt.HANDLE;
      hThread        : Win32.Winnt.HANDLE;
      wSegmentNumber : Win32.UINT;
      lpModuleName   : Win32.LPSTR;
      lpSelector     : Win32.LPWORD)
      return Win32.BOOL;

   function VDMModuleFirst
     (hProcess      : Win32.Winnt.HANDLE;
      hThread       : Win32.Winnt.HANDLE;
      lpModuleEntry : Win32.Vdmdbg.LPMODULEENTRY;
      lpEventProc   : DEBUGEVENTPROC;
      lpData        : Win32.LPVOID)
      return Win32.BOOL;

   function VDMModuleNext
     (hProcess      : Win32.Winnt.HANDLE;
      hThread       : Win32.Winnt.HANDLE;
      lpModuleEntry : Win32.Vdmdbg.LPMODULEENTRY;
      lpEventProc   : DEBUGEVENTPROC;
      lpData        : Win32.LPVOID)
      return Win32.BOOL;

   function VDMGlobalFirst
     (hProcess      : Win32.Winnt.HANDLE;
      hThread       : Win32.Winnt.HANDLE;
      lpGlobalEntry : Win32.Vdmdbg.LPGLOBALENTRY;
      wFlags        : Win32.WORD;
      lpEventProc   : DEBUGEVENTPROC;
      lpData        : Win32.LPVOID)
      return Win32.BOOL;

   function VDMGlobalNext
     (hProcess      : Win32.Winnt.HANDLE;
      hThread       : Win32.Winnt.HANDLE;
      lpGlobalEntry : Win32.Vdmdbg.LPGLOBALENTRY;
      wFlags        : Win32.WORD;
      lpEventProc   : DEBUGEVENTPROC;
      lpData        : Win32.LPVOID)
      return Win32.BOOL;

   function VDMEnumProcessWOW
     (fp     : PROCESSENUMPROC;
      lparam : Win32.LPARAM)
      return Win32.INT;

   function VDMEnumTaskWOW
     (dwProcessId : Win32.DWORD;
      fp          : TASKENUMPROC;
      lparam      : Win32.LPARAM)
      return Win32.INT;

   function VDMKillWOW return Win32.BOOL;

   function VDMDetectWOW return Win32.BOOL;

   function VDMBreakThread
     (hProcess : Win32.Winnt.HANDLE;
      hThread  : Win32.Winnt.HANDLE)
      return Win32.BOOL;

private

   pragma Convention (C, SEGMENT_NOTE);
   pragma Convention (C, IMAGE_NOTE);
   pragma Convention (C, MODULEENTRY);
   pragma Convention (C, GLOBALENTRY);

   pragma Import (Stdcall, VDMProcessException, "VDMProcessException");
   pragma Import
     (Stdcall,
      VDMGetThreadSelectorEntry,
      "VDMGetThreadSelectorEntry");
   pragma Import (Stdcall, VDMGetPointer, "VDMGetPointer");
   pragma Import (Stdcall, VDMGetThreadContext, "VDMGetThreadContext");
   pragma Import (Stdcall, VDMSetThreadContext, "VDMSetThreadContext");
   pragma Import (Stdcall, VDMGetSelectorModule, "VDMGetSelectorModule");
   pragma Import (Stdcall, VDMGetModuleSelector, "VDMGetModuleSelector");
   pragma Import (Stdcall, VDMModuleFirst, "VDMModuleFirst");
   pragma Import (Stdcall, VDMModuleNext, "VDMModuleNext");
   pragma Import (Stdcall, VDMGlobalFirst, "VDMGlobalFirst");
   pragma Import (Stdcall, VDMGlobalNext, "VDMGlobalNext");
   pragma Import (Stdcall, VDMEnumProcessWOW, "VDMEnumProcessWOW");
   pragma Import (Stdcall, VDMEnumTaskWOW, "VDMEnumTaskWOW");
   pragma Import (Stdcall, VDMKillWOW, "VDMKillWOW");
   pragma Import (Stdcall, VDMDetectWOW, "VDMDetectWOW");
   pragma Import (Stdcall, VDMBreakThread, "VDMBreakThread");

end Win32.Vdmdbg;
