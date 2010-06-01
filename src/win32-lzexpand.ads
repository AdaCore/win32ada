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

package Win32.Lzexpand is

   LZERROR_BADINHANDLE  : constant := -1;
   LZERROR_BADOUTHANDLE : constant := -2;
   LZERROR_READ         : constant := -3;
   LZERROR_WRITE        : constant := -4;
   LZERROR_GLOBALLOC    : constant := -5;
   LZERROR_GLOBLOCK     : constant := -6;
   LZERROR_BADVALUE     : constant := -7;
   LZERROR_UNKNOWNALG   : constant := -8;

   function LZStart return Win32.INT;

   procedure LZDone;

   function LZCopy
     (hfSource : Win32.INT;
      hfDest   : Win32.INT)
      return Win32.LONG;

   function LZInit (hfSource : Win32.INT) return Win32.INT;

   function GetExpandedNameA
     (lpszSource : Win32.LPSTR;
      lpszBuffer : Win32.LPSTR)
      return Win32.INT;

   function GetExpandedName
     (lpszSource : Win32.LPSTR;
      lpszBuffer : Win32.LPSTR)
      return Win32.INT renames GetExpandedNameA;

   function GetExpandedNameW
     (lpszSource : Win32.LPWSTR;
      lpszBuffer : Win32.LPWSTR)
      return Win32.INT;

   function LZOpenFileA
     (lpFileName  : Win32.LPSTR;
      lpReOpenBuf : Win32.Winbase.LPOFSTRUCT;
      wStyle      : Win32.WORD)
      return Win32.INT;

   function LZOpenFile
     (lpFileName  : Win32.LPSTR;
      lpReOpenBuf : Win32.Winbase.LPOFSTRUCT;
      wStyle      : Win32.WORD)
      return Win32.INT renames LZOpenFileA;

   function LZOpenFileW
     (lpFileName  : Win32.LPWSTR;
      lpReOpenBuf : Win32.Winbase.LPOFSTRUCT;
      wStyle      : Win32.WORD)
      return Win32.INT;

   function LZSeek
     (hFile   : Win32.INT;
      lOffset : Win32.LONG;
      iOrigin : Win32.INT)
      return Win32.LONG;

   function LZRead
     (hFile    : Win32.INT;
      lpBuffer : Win32.LPSTR;
      cbRead   : Win32.INT)
      return Win32.INT;

   procedure LZClose (hFile : Win32.INT);

private

   pragma Import (Stdcall, LZStart, "LZStart");
   pragma Import (Stdcall, LZDone, "LZDone");
   pragma Import (Stdcall, LZCopy, "LZCopy");
   pragma Import (Stdcall, LZInit, "LZInit");
   pragma Import (Stdcall, GetExpandedNameA, "GetExpandedNameA");
   pragma Import (Stdcall, GetExpandedNameW, "GetExpandedNameW");
   pragma Import (Stdcall, LZOpenFileA, "LZOpenFileA");
   pragma Import (Stdcall, LZOpenFileW, "LZOpenFileW");
   pragma Import (Stdcall, LZSeek, "LZSeek");
   pragma Import (Stdcall, LZRead, "LZRead");
   pragma Import (Stdcall, LZClose, "LZClose");

end Win32.Lzexpand;
