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



package Win32.Wownt32 is



   WCB16_MAX_CBARGS : constant := 16;                      --  wownt32.h:241

   WCB16_PASCAL : constant := 16#0#;                   --  wownt32.h:243

   WCB16_CDECL : constant := 16#1#;                   --  wownt32.h:244



   type WOW_HANDLE_TYPE is ( --  wownt32.h:112

     WOW_TYPE_HWND,                                      --  wownt32.h:113

     WOW_TYPE_HMENU,                                     --  wownt32.h:114

     WOW_TYPE_HDWP,                                      --  wownt32.h:115

     WOW_TYPE_HDROP,                                     --  wownt32.h:116

     WOW_TYPE_HDC,                                       --  wownt32.h:117

     WOW_TYPE_HFONT,                                     --  wownt32.h:118

     WOW_TYPE_HMETAFILE,                                 --  wownt32.h:119

     WOW_TYPE_HRGN,                                      --  wownt32.h:120

     WOW_TYPE_HBITMAP,                                   --  wownt32.h:121

     WOW_TYPE_HBRUSH,                                    --  wownt32.h:122

     WOW_TYPE_HPALETTE,                                  --  wownt32.h:123

     WOW_TYPE_HPEN,                                      --  wownt32.h:124

     WOW_TYPE_HACCEL,                                    --  wownt32.h:125

     WOW_TYPE_HTASK,                                     --  wownt32.h:126

     WOW_TYPE_FULLHWND                                   --  wownt32.h:128

                           );

   for WOW_HANDLE_TYPE'Size use 32;                        --  wownt32.h:112



   function WOWGetVDMPointer

     (vp : Win32.DWORD;

      dwBytes : Win32.DWORD;

      fProtectedMode : Win32.BOOL)

     return Win32.LPVOID;                         --  wownt32.h:37



   function WOWGetVDMPointerFix

     (vp : Win32.DWORD;

      dwBytes : Win32.DWORD;

      fProtectedMode : Win32.BOOL)

     return Win32.LPVOID;                         --  wownt32.h:60



   procedure WOWGetVDMPointerUnfix

     (vp : Win32.DWORD);                           --  wownt32.h:62



   function WOWGlobalAlloc16

     (wFlags : Win32.WORD;

      cb : Win32.DWORD)

     return Win32.WORD;                           --  wownt32.h:74



   function WOWGlobalFree16

     (hMem : Win32.WORD)

     return Win32.WORD;                           --  wownt32.h:75



   function WOWGlobalLock16

     (hMem : Win32.WORD)

     return Win32.DWORD;                          --  wownt32.h:76



   function WOWGlobalUnlock16

     (hMem : Win32.WORD)

     return Win32.BOOL;                           --  wownt32.h:77



   function WOWGlobalAllocLock16

     (wFlags : Win32.WORD;

      cb : Win32.DWORD;

      phMem : Win32.PWORD)

     return Win32.DWORD;                          --  wownt32.h:84



   function WOWGlobalUnlockFree16

     (vpMem : Win32.DWORD)

     return Win32.WORD;                           --  wownt32.h:85



   function WOWGlobalLockSize16

     (hMem : Win32.WORD;

      pcb : Win32.PDWORD)

     return Win32.DWORD;                          --  wownt32.h:86



   procedure WOWYield16;                                   --  wownt32.h:99



   procedure WOWDirectedYield16

     (htask16 : Win32.WORD);                       --  wownt32.h:100



   function WOWHandle32

     (p1 : Win32.WORD;

      p2 : WOW_HANDLE_TYPE)

     return Win32.Winnt.HANDLE;                   --  wownt32.h:130



   function WOWHandle16

     (p1 : Win32.Winnt.HANDLE;

      p2 : WOW_HANDLE_TYPE)

     return Win32.WORD;                           --  wownt32.h:131



   function WOWCallback16

     (vpfn16 : Win32.DWORD;

      dwParam : Win32.DWORD)

     return Win32.DWORD;                          --  wownt32.h:239



   function WOWCallback16Ex

     (vpfn16 : Win32.DWORD;

      dwFlags : Win32.DWORD;

      cbArgs : Win32.DWORD;

      pArgs : Win32.PVOID;

      pdwRetCode : Win32.PDWORD)

     return Win32.BOOL;                           --  wownt32.h:246



private



   pragma Import (Stdcall, WOWGetVDMPointer, "WOWGetVDMPointer");

   --  wownt32.h:37

   pragma Import (Stdcall, WOWGetVDMPointerFix, "WOWGetVDMPointerFix");

   --  wownt32.h:60

   pragma Import (Stdcall, WOWGetVDMPointerUnfix, "WOWGetVDMPointerUnfix");

   --  wownt32.h:62

   pragma Import (Stdcall, WOWGlobalAlloc16, "WOWGlobalAlloc16");

   --  wownt32.h:74

   pragma Import (Stdcall, WOWGlobalFree16, "WOWGlobalFree16");

   --  wownt32.h:75

   pragma Import (Stdcall, WOWGlobalLock16, "WOWGlobalLock16");

   --  wownt32.h:76

   pragma Import (Stdcall, WOWGlobalUnlock16, "WOWGlobalUnlock16");

   --  wownt32.h:77

   pragma Import (Stdcall, WOWGlobalAllocLock16, "WOWGlobalAllocLock16");

   --  wownt32.h:84

   pragma Import (Stdcall, WOWGlobalUnlockFree16, "WOWGlobalUnlockFree16");

   --  wownt32.h:85

   pragma Import (Stdcall, WOWGlobalLockSize16, "WOWGlobalLockSize16");

   --  wownt32.h:86

   pragma Import (Stdcall, WOWYield16, "WOWYield16");

   --  wownt32.h:99

   pragma Import (Stdcall, WOWDirectedYield16, "WOWDirectedYield16");

   --  wownt32.h:100

   pragma Import (Stdcall, WOWHandle32, "WOWHandle32");

   --  wownt32.h:130

   pragma Import (Stdcall, WOWHandle16, "WOWHandle16");

   --  wownt32.h:131

   pragma Import (Stdcall, WOWCallback16, "WOWCallback16");

   --  wownt32.h:239

   pragma Import (Stdcall, WOWCallback16Ex, "WOWCallback16Ex");

   --  wownt32.h:246





end Win32.Wownt32;





