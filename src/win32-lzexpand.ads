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



package Win32.Lzexpand is



   LZERROR_BADINHANDLE : constant := -1;        --  lzexpand.h:16

   LZERROR_BADOUTHANDLE : constant := -2;        --  lzexpand.h:17

   LZERROR_READ : constant := -3;        --  lzexpand.h:18

   LZERROR_WRITE : constant := -4;        --  lzexpand.h:19

   LZERROR_GLOBALLOC : constant := -5;        --  lzexpand.h:20

   LZERROR_GLOBLOCK : constant := -6;        --  lzexpand.h:21

   LZERROR_BADVALUE : constant := -7;        --  lzexpand.h:22

   LZERROR_UNKNOWNALG : constant := -8;        --  lzexpand.h:23



   function LZStart return Win32.INT;                      --  lzexpand.h:32



   procedure LZDone;                                       --  lzexpand.h:38



   function LZCopy

     (hfSource : Win32.INT;

      hfDest : Win32.INT)

     return Win32.LONG;                          --  lzexpand.h:51



   function LZInit

     (hfSource : Win32.INT)

     return Win32.INT;                           --  lzexpand.h:58



   function GetExpandedNameA

     (lpszSource : Win32.LPSTR;

      lpszBuffer : Win32.LPSTR)

     return Win32.INT;                           --  lzexpand.h:64



   function GetExpandedName

     (lpszSource : Win32.LPSTR;

      lpszBuffer : Win32.LPSTR)

     return Win32.INT

     renames GetExpandedNameA;                   --  lzexpand.h:64



   function GetExpandedNameW

     (lpszSource : Win32.LPWSTR;

      lpszBuffer : Win32.LPWSTR)

     return Win32.INT;                           --  lzexpand.h:70



   function LZOpenFileA

     (lpFileName : Win32.LPSTR;

      lpReOpenBuf : Win32.Winbase.LPOFSTRUCT;

      wStyle : Win32.WORD)

     return Win32.INT;                           --  lzexpand.h:82



   function LZOpenFile

     (lpFileName : Win32.LPSTR;

      lpReOpenBuf : Win32.Winbase.LPOFSTRUCT;

      wStyle : Win32.WORD)

     return Win32.INT

     renames LZOpenFileA;                        --  lzexpand.h:82



   function LZOpenFileW

     (lpFileName : Win32.LPWSTR;

      lpReOpenBuf : Win32.Winbase.LPOFSTRUCT;

      wStyle : Win32.WORD)

     return Win32.INT;                           --  lzexpand.h:89



   function LZSeek

     (hFile : Win32.INT;

      lOffset : Win32.LONG;

      iOrigin : Win32.INT)

     return Win32.LONG;                          --  lzexpand.h:102



   function LZRead

     (hFile : Win32.INT;

      lpBuffer : Win32.LPSTR;

      cbRead : Win32.INT)

     return Win32.INT;                           --  lzexpand.h:110



   procedure LZClose

     (hFile : Win32.INT);                          --  lzexpand.h:118



private



   pragma Import (Stdcall, LZStart, "LZStart"); --  lzexpand.h :32

   pragma Import (Stdcall, LZDone, "LZDone");   --  lzexpand.h :38

   pragma Import (Stdcall, LZCopy, "LZCopy");   --  lzexpand.h :51

   pragma Import (Stdcall, LZInit, "LZInit");   --  lzexpand.h :58

   pragma Import (Stdcall, GetExpandedNameA, "GetExpandedNameA");

   --  lzexpand.h:64

   pragma Import (Stdcall, GetExpandedNameW, "GetExpandedNameW");

   --  lzexpand.h:70

   pragma Import (Stdcall, LZOpenFileA, "LZOpenFileA"); --  lzexpand.h :82

   pragma Import (Stdcall, LZOpenFileW, "LZOpenFileW"); --  lzexpand.h :89

   pragma Import (Stdcall, LZSeek, "LZSeek");           --  lzexpand.h :102

   pragma Import (Stdcall, LZRead, "LZRead");           --  lzexpand.h :110

   pragma Import (Stdcall, LZClose, "LZClose");         --  lzexpand.h :118



end Win32.Lzexpand;





