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



with Stdarg;

with Win32.Winnt;



package Win32.Lmremutl is



   SUPPORTS_REMOTE_ADMIN_PROTOCOL : constant := 16#2#;     --  lmremutl.h:130

   SUPPORTS_RPC : constant := 16#4#;     --  lmremutl.h:131

   SUPPORTS_SAM_PROTOCOL : constant := 16#8#;     --  lmremutl.h:132

   SUPPORTS_UNICODE : constant := 16#10#;    --  lmremutl.h:133

   SUPPORTS_LOCAL : constant := 16#20#;    --  lmremutl.h:134

   SUPPORTS_ANY : constant := 16#ffffffff#;

   --  lmremutl.h:135

   NO_PERMISSION_REQUIRED : constant := 16#1#;     --  lmremutl.h:141

   ALLOCATE_RESPONSE : constant := 16#2#;     --  lmremutl.h:142

   USE_SPECIFIC_TRANSPORT : constant := 16#80000000#;

   --  lmremutl.h:143



   type DESC_CHAR is new Win32.CHAR;                       --  lmremutl.h:57



   type LPDESC is new Win32.PCHAR;                         --  lmremutl.h:66



   type TIME_OF_DAY_INFO;                                  --  lmremutl.h:107



   type PTIME_OF_DAY_INFO is access all TIME_OF_DAY_INFO;  --  lmremutl.h:120

   subtype LPTIME_OF_DAY_INFO is PTIME_OF_DAY_INFO;        --  lmremutl.h:120



   type TIME_OF_DAY_INFO is                                --  lmremutl.h:107

      record

         tod_elapsedt : Win32.DWORD;                     --  lmremutl.h:108

         tod_msecs : Win32.DWORD;                     --  lmremutl.h:109

         tod_hours : Win32.DWORD;                     --  lmremutl.h:110

         tod_mins : Win32.DWORD;                     --  lmremutl.h:111

         tod_secs : Win32.DWORD;                     --  lmremutl.h:112

         tod_hunds : Win32.DWORD;                     --  lmremutl.h:113

         tod_timezone : Win32.LONG;                      --  lmremutl.h:114

         tod_tinterval : Win32.DWORD;                     --  lmremutl.h:115

         tod_day : Win32.DWORD;                     --  lmremutl.h:116

         tod_month : Win32.DWORD;                     --  lmremutl.h:117

         tod_year : Win32.DWORD;                     --  lmremutl.h:118

         tod_weekday : Win32.DWORD;                     --  lmremutl.h:119

      end record;



   function NetRemoteTOD

     (UncServerName : Win32.Winnt.LPTSTR;

      BufferPtr : access Win32.PBYTE)

     return Win32.DWORD;                          --  lmremutl.h:74



   function NetRemoteComputerSupports

     (UncServerName : Win32.Winnt.LPTSTR;

      OptionsWanted : Win32.DWORD;

      OptionsSupported : Win32.LPDWORD)

     return Win32.DWORD;                          --  lmremutl.h:80



   function RxRemoteApi

     (ApiNumber : Win32.DWORD;

      UncServerName : Win32.Winnt.LPTSTR;

      ParmDescString : LPDESC;

      DataDesc16 : LPDESC;

      DataDesc32 : LPDESC;

      DataDescSmb : LPDESC;

      AuxDesc16 : LPDESC;

      AuxDesc32 : LPDESC;

      AuxDescSmb : LPDESC;

      Flags : Win32.DWORD;

      Args : Stdarg.ArgList := Stdarg.Empty)

     return Win32.DWORD;                          --  lmremutl.h:87



private



   pragma Convention (C, TIME_OF_DAY_INFO);                 --  lmremutl.h:107



   pragma Import (Stdcall, NetRemoteTOD, "NetRemoteTOD");   --  lmremutl.h:74

   pragma Import (Stdcall, NetRemoteComputerSupports,

                    "NetRemoteComputerSupports");

   --  lmremutl.h:80



end Win32.Lmremutl;





