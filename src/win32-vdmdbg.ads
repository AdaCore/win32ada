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



with Win32.Winbase;

with Win32.Winnt;



package Win32.Vdmdbg is



   DBG_SEGLOAD : constant := 0;             --  vdmdbg.h:29

   DBG_SEGMOVE : constant := 1;             --  vdmdbg.h:30

   DBG_SEGFREE : constant := 2;             --  vdmdbg.h:31

   DBG_MODLOAD : constant := 3;             --  vdmdbg.h:32

   DBG_MODFREE : constant := 4;             --  vdmdbg.h:33

   DBG_SINGLESTEP : constant := 5;             --  vdmdbg.h:34

   DBG_BREAK : constant := 6;             --  vdmdbg.h:35

   DBG_GPFAULT : constant := 7;             --  vdmdbg.h:36

   DBG_DIVOVERFLOW : constant := 8;             --  vdmdbg.h:37

   DBG_INSTRFAULT : constant := 9;             --  vdmdbg.h:38

   DBG_TASKSTART : constant := 10;            --  vdmdbg.h:39

   DBG_TASKSTOP : constant := 11;            --  vdmdbg.h:40

   DBG_DLLSTART : constant := 12;            --  vdmdbg.h:41

   DBG_DLLSTOP : constant := 13;            --  vdmdbg.h:42

   DBG_ATTACH : constant := 14;            --  vdmdbg.h:43

   VDMCONTEXT_i386 : constant := 16#10000#;     --  vdmdbg.h:50

   VDMCONTEXT_i486 : constant := 16#10000#;     --  vdmdbg.h:51

   VDMCONTEXT_CONTROL : constant := 16#10001#;     --  vdmdbg.h:53

   VDMCONTEXT_INTEGER : constant := 16#10002#;     --  vdmdbg.h:54

   VDMCONTEXT_SEGMENTS : constant := 16#10004#;     --  vdmdbg.h:55

   VDMCONTEXT_FLOATING_POINT : constant := 16#10008#;     --  vdmdbg.h:56

   VDMCONTEXT_DEBUG_REGISTERS : constant := 16#10010#;     --  vdmdbg.h:57

   VDMCONTEXT_FULL : constant := 16#10007#;     --  vdmdbg.h:59

   V86FLAGS_CARRY : constant := 16#1#;         --  vdmdbg.h:217

   V86FLAGS_PARITY : constant := 16#4#;         --  vdmdbg.h:218

   V86FLAGS_AUXCARRY : constant := 16#10#;        --  vdmdbg.h:219

   V86FLAGS_ZERO : constant := 16#40#;        --  vdmdbg.h:220

   V86FLAGS_SIGN : constant := 16#80#;        --  vdmdbg.h:221

   V86FLAGS_TRACE : constant := 16#100#;       --  vdmdbg.h:222

   V86FLAGS_INTERRUPT : constant := 16#200#;       --  vdmdbg.h:223

   V86FLAGS_DIRECTION : constant := 16#400#;       --  vdmdbg.h:224

   V86FLAGS_OVERFLOW : constant := 16#800#;       --  vdmdbg.h:225

   V86FLAGS_IOPL : constant := 16#3000#;      --  vdmdbg.h:226

   V86FLAGS_IOPL_BITS : constant := 16#12#;        --  vdmdbg.h:227

   V86FLAGS_RESUME : constant := 16#10000#;     --  vdmdbg.h:228

   V86FLAGS_V86 : constant := 16#20000#;     --  vdmdbg.h:229

   V86FLAGS_ALIGNMENT : constant := 16#40000#;     --  vdmdbg.h:230

   MAX_MODULE_NAME : constant := 9;             --  vdmdbg.h:232

   MAX_PATH16 : constant := 255;           --  vdmdbg.h:233

   GLOBAL_ALL : constant := 0;             --  vdmdbg.h:262

   GLOBAL_LRU : constant := 1;             --  vdmdbg.h:263

   GLOBAL_FREE : constant := 2;             --  vdmdbg.h:264

   GT_UNKNOWN : constant := 0;             --  vdmdbg.h:267

   GT_DGROUP : constant := 1;             --  vdmdbg.h:268

   GT_DATA : constant := 2;             --  vdmdbg.h:269

   GT_CODE : constant := 3;             --  vdmdbg.h:270

   GT_TASK : constant := 4;             --  vdmdbg.h:271

   GT_RESOURCE : constant := 5;             --  vdmdbg.h:272

   GT_MODULE : constant := 6;             --  vdmdbg.h:273

   GT_FREE : constant := 7;             --  vdmdbg.h:274

   GT_INTERNAL : constant := 8;             --  vdmdbg.h:275

   GT_SENTINEL : constant := 9;             --  vdmdbg.h:276

   GT_BURGERMASTER : constant := 10;            --  vdmdbg.h:277

   GD_USERDEFINED : constant := 0;             --  vdmdbg.h:280

   GD_CURSORCOMPONENT : constant := 1;             --  vdmdbg.h:281

   GD_BITMAP : constant := 2;             --  vdmdbg.h:282

   GD_ICONCOMPONENT : constant := 3;             --  vdmdbg.h:283

   GD_MENU : constant := 4;             --  vdmdbg.h:284

   GD_DIALOG : constant := 5;             --  vdmdbg.h:285

   GD_STRING : constant := 6;             --  vdmdbg.h:286

   GD_FONTDIR : constant := 7;             --  vdmdbg.h:287

   GD_FONT : constant := 8;             --  vdmdbg.h:288

   GD_ACCELERATORS : constant := 9;             --  vdmdbg.h:289

   GD_RCDATA : constant := 10;            --  vdmdbg.h:290

   GD_ERRTABLE : constant := 11;            --  vdmdbg.h:291

   GD_CURSOR : constant := 12;            --  vdmdbg.h:292

   GD_ICON : constant := 14;            --  vdmdbg.h:293

   GD_NAMETABLE : constant := 15;            --  vdmdbg.h:294

   GD_MAX_RESOURCE : constant := 15;            --  vdmdbg.h:295

   WOW_SYSTEM : constant DWORD := 16#1#;   --  vdmdbg.h:433



   type SEGMENT_NOTE;                                      --  vdmdbg.h:235

   type IMAGE_NOTE;                                        --  vdmdbg.h:245

   type MODULEENTRY;                                       --  vdmdbg.h:259

   type GLOBALENTRY;                                       --  vdmdbg.h:311



   subtype VDMCONTEXT is Win32.Winnt.CONTEXT;              --  vdmdbg.h:67

   subtype VDMLDT_ENTRY is Win32.Winnt.LDT_ENTRY;          --  vdmdbg.h:68



   type LPVDMCONTEXT is access all VDMCONTEXT;             --  vdmdbg.h:208

   type LPVDMLDT_ENTRY is access all VDMLDT_ENTRY;         --  vdmdbg.h:209

   type LPMODULEENTRY is access all MODULEENTRY;           --  vdmdbg.h:259

   type LPGLOBALENTRY is access all GLOBALENTRY;           --  vdmdbg.h:311



   type SEGMENT_NOTE is                                    --  vdmdbg.h:235

      record

         Selector1 : Win32.WORD;                          --  vdmdbg.h:236

         Selector2 : Win32.WORD;                          --  vdmdbg.h:237

         Segment : Win32.WORD;                          --  vdmdbg.h:238

         Module : Win32.CHAR_Array (0 .. MAX_MODULE_NAME); --  vdmdbg.h:239

         FileName : Win32.CHAR_Array (0 .. MAX_PATH16);     --  vdmdbg.h:240

         c_Type : Win32.WORD;                          --  vdmdbg.h:241

         Length : Win32.DWORD;                         --  vdmdbg.h:242

      end record;



   type IMAGE_NOTE is                                      --  vdmdbg.h:245

      record

         Module : Win32.CHAR_Array (0 .. MAX_MODULE_NAME); --  vdmdbg.h:246

         FileName : Win32.CHAR_Array (0 .. MAX_PATH16);      --  vdmdbg.h:247

         hModule : Win32.WORD;                           --  vdmdbg.h:248

         hTask : Win32.WORD;                           --  vdmdbg.h:249

      end record;



   type MODULEENTRY is                                     --  vdmdbg.h:259

      record

         dwSize : Win32.DWORD;                         --  vdmdbg.h:253

         szModule : Win32.CHAR_Array (0 .. MAX_MODULE_NAME); --  vdmdbg.h:254

         hModule : Win32.Winnt.HANDLE;                  --  vdmdbg.h:255

         wcUsage : Win32.WORD;                          --  vdmdbg.h:256

         szExePath : Win32.CHAR_Array (0 .. MAX_PATH16);     --  vdmdbg.h:257

         wNext : Win32.WORD;                          --  vdmdbg.h:258

      end record;



   type GLOBALENTRY is                                     --  vdmdbg.h:311

      record

         dwSize : Win32.DWORD;                      --  vdmdbg.h:298

         dwAddress : Win32.DWORD;                      --  vdmdbg.h:299

         dwBlockSize : Win32.DWORD;                      --  vdmdbg.h:300

         hBlock : Win32.Winnt.HANDLE;               --  vdmdbg.h:301

         wcLock : Win32.WORD;                       --  vdmdbg.h:302

         wcPageLock : Win32.WORD;                       --  vdmdbg.h:303

         wFlags : Win32.WORD;                       --  vdmdbg.h:304

         wHeapPresent : Win32.BOOL;                       --  vdmdbg.h:305

         hOwner : Win32.Winnt.HANDLE;               --  vdmdbg.h:306

         wType : Win32.WORD;                       --  vdmdbg.h:307

         wData : Win32.WORD;                       --  vdmdbg.h:308

         dwNext : Win32.DWORD;                      --  vdmdbg.h:309

         dwNextAlt : Win32.DWORD;                      --  vdmdbg.h:310

      end record;



   type DEBUGEVENTPROC is access function

     (p1 : Win32.Winbase.LPDEBUG_EVENT;

      p2 : Win32.LPVOID)

     return Win32.DWORD;                          --  vdmdbg.h:313

   pragma Convention (Stdcall, DEBUGEVENTPROC);

   type PROCESSENUMPROC is access function

     (dwProcessId : Win32.DWORD;

      dwAttributes : Win32.DWORD;

      lpUserDefined : Win32.LPARAM)

     return Win32.BOOL;                           --  vdmdbg.h:430

   pragma Convention (Stdcall, PROCESSENUMPROC);

   type TASKENUMPROC is access function

     (dwThreadId : Win32.DWORD;

      hMod16 : Win32.WORD;

      hTask16 : Win32.WORD;

      lpUserDefined : Win32.LPARAM)

     return Win32.BOOL;                           --  vdmdbg.h:431

   pragma Convention (Stdcall, TASKENUMPROC);



   function VDMProcessException

     (lpDebugEvent : Win32.Winbase.LPDEBUG_EVENT)

     return Win32.BOOL;                           --  vdmdbg.h:328



   function VDMGetThreadSelectorEntry

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      wSelector : Win32.WORD;

      lpSelectorEntry : LPVDMLDT_ENTRY)

     return Win32.BOOL;                           --  vdmdbg.h:334



   function VDMGetPointer

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      wSelector : Win32.WORD;

      dwOffset : Win32.DWORD;

      fProtMode : Win32.BOOL)

     return Win32.ULONG;                          --  vdmdbg.h:343



   function VDMGetThreadContext

     (lpDebugEvent : Win32.Winbase.LPDEBUG_EVENT;

      lpVDMContext : Win32.Vdmdbg.LPVDMCONTEXT)

     return Win32.BOOL;                           --  vdmdbg.h:353



   function VDMSetThreadContext

     (lpDebugEvent : Win32.Winbase.LPDEBUG_EVENT;

      lpVDMContext : Win32.Vdmdbg.LPVDMCONTEXT)

     return Win32.BOOL;                           --  vdmdbg.h:360



   function VDMGetSelectorModule

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      wSelector : Win32.WORD;

      lpSegmentNumber : Win32.PUINT;

      lpModuleName : Win32.LPSTR;

      nNameSize : Win32.UINT;

      lpModulePath : Win32.LPSTR;

      nPathSize : Win32.UINT)

     return Win32.BOOL;                           --  vdmdbg.h:367



   function VDMGetModuleSelector

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      wSegmentNumber : Win32.UINT;

      lpModuleName : Win32.LPSTR;

      lpSelector : Win32.LPWORD)

     return Win32.BOOL;                           --  vdmdbg.h:380



   function VDMModuleFirst

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      lpModuleEntry : Win32.Vdmdbg.LPMODULEENTRY;

      lpEventProc : DEBUGEVENTPROC;

      lpData : Win32.LPVOID)

     return Win32.BOOL;                           --  vdmdbg.h:390



   function VDMModuleNext

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      lpModuleEntry : Win32.Vdmdbg.LPMODULEENTRY;

      lpEventProc : DEBUGEVENTPROC;

      lpData : Win32.LPVOID)

     return Win32.BOOL;                           --  vdmdbg.h:400



   function VDMGlobalFirst

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      lpGlobalEntry : Win32.Vdmdbg.LPGLOBALENTRY;

      wFlags : Win32.WORD;

      lpEventProc : DEBUGEVENTPROC;

      lpData : Win32.LPVOID)

     return Win32.BOOL;                           --  vdmdbg.h:410



   function VDMGlobalNext

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE;

      lpGlobalEntry : Win32.Vdmdbg.LPGLOBALENTRY;

      wFlags : Win32.WORD;

      lpEventProc : DEBUGEVENTPROC;

      lpData : Win32.LPVOID)

     return Win32.BOOL;                           --  vdmdbg.h:421



   function VDMEnumProcessWOW

     (fp : PROCESSENUMPROC;

      lparam : Win32.LPARAM)

     return Win32.INT;                            --  vdmdbg.h:437



   function VDMEnumTaskWOW

     (dwProcessId : Win32.DWORD;

      fp : TASKENUMPROC;

      lparam : Win32.LPARAM)

     return Win32.INT;

   --  vdmdbg.h:444



   function VDMKillWOW return Win32.BOOL;                  --  vdmdbg.h:452



   function VDMDetectWOW return Win32.BOOL;                --  vdmdbg.h:458



   function VDMBreakThread

     (hProcess : Win32.Winnt.HANDLE;

      hThread : Win32.Winnt.HANDLE)

     return Win32.BOOL;

   --  vdmdbg.h:464



private



   pragma Convention (C, SEGMENT_NOTE);                     --  vdmdbg.h:235

   pragma Convention (C, IMAGE_NOTE);                       --  vdmdbg.h:245

   pragma Convention (C, MODULEENTRY);                      --  vdmdbg.h:259

   pragma Convention (C, GLOBALENTRY);                      --  vdmdbg.h:311



   pragma Import (Stdcall, VDMProcessException, "VDMProcessException");

   --  vdmdbg.h:328

   pragma Import (Stdcall, VDMGetThreadSelectorEntry,

                    "VDMGetThreadSelectorEntry");

   --  vdmdbg.h:334

   pragma Import (Stdcall, VDMGetPointer, "VDMGetPointer");

   --  vdmdbg.h:343

   pragma Import (Stdcall, VDMGetThreadContext, "VDMGetThreadContext");

   --  vdmdbg.h:353

   pragma Import (Stdcall, VDMSetThreadContext, "VDMSetThreadContext");

   --  vdmdbg.h:360

   pragma Import (Stdcall, VDMGetSelectorModule, "VDMGetSelectorModule");

   --  vdmdbg.h:367

   pragma Import (Stdcall, VDMGetModuleSelector, "VDMGetModuleSelector");

   --  vdmdbg.h:380

   pragma Import (Stdcall, VDMModuleFirst, "VDMModuleFirst");

   --  vdmdbg.h:390

   pragma Import (Stdcall, VDMModuleNext, "VDMModuleNext");

   --  vdmdbg.h:400

   pragma Import (Stdcall, VDMGlobalFirst, "VDMGlobalFirst");

   --  vdmdbg.h:410

   pragma Import (Stdcall, VDMGlobalNext, "VDMGlobalNext");

   --  vdmdbg.h:421

   pragma Import (Stdcall, VDMEnumProcessWOW, "VDMEnumProcessWOW");

   --  vdmdbg.h:437

   pragma Import (Stdcall, VDMEnumTaskWOW, "VDMEnumTaskWOW");

   --  vdmdbg.h:444

   pragma Import (Stdcall, VDMKillWOW, "VDMKillWOW");

   --  vdmdbg.h:452

   pragma Import (Stdcall, VDMDetectWOW, "VDMDetectWOW");

   --  vdmdbg.h:458

   pragma Import (Stdcall, VDMBreakThread, "VDMBreakThread");

   --  vdmdbg.h:464



end Win32.Vdmdbg;





