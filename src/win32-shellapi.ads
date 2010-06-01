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

with Win32.Windef;
with Win32.Winnt;

package Win32.Shellapi is

   SE_ERR_SHARE           : constant := 26;
   SE_ERR_ASSOCINCOMPLETE : constant := 27;
   SE_ERR_DDETIMEOUT      : constant := 28;
   SE_ERR_DDEFAIL         : constant := 29;
   SE_ERR_DDEBUSY         : constant := 30;
   SE_ERR_NOASSOC         : constant := 31;

   subtype HDROP is Win32.Winnt.HANDLE;
   type PPTCHAR is access all Win32.Winnt.PTCHAR;

   function DragQueryFileW
     (hDropFile : HDROP;
      iFile     : Win32.UINT;
      lpszFile  : Win32.LPWSTR;
      cb        : Win32.UINT)
      return Win32.UINT;

   function DragQueryFileA
     (hDropFile : HDROP;
      iFile     : Win32.UINT;
      lpszFile  : Win32.LPSTR;
      cb        : Win32.UINT)
      return Win32.UINT;

   function DragQueryFile
     (hDropFile : HDROP;
      iFile     : Win32.UINT;
      lpszFile  : Win32.LPSTR;
      cb        : Win32.UINT)
      return Win32.UINT renames DragQueryFileA;

   function DragQueryPoint
     (hDropFile : HDROP;
      lppt      : Win32.Windef.LPPOINT)
      return Win32.BOOL;

   procedure DragFinish (hDropFree : HDROP);

   procedure DragAcceptFiles
     (hWnd    : Win32.Windef.HWND;
      fAccept : Win32.BOOL);

   function ExtractIconW
     (hInst           : Win32.Windef.HINSTANCE;
      lpszExeFileName : Win32.LPCWSTR;
      nIconIndex      : Win32.UINT)
      return Win32.Windef.HICON;

   function ExtractIconA
     (hInst           : Win32.Windef.HINSTANCE;
      lpszExeFileName : Win32.LPCSTR;
      nIconIndex      : Win32.UINT)
      return Win32.Windef.HICON;

   function ExtractIcon
     (hInst           : Win32.Windef.HINSTANCE;
      lpszExeFileName : Win32.LPCSTR;
      nIconIndex      : Win32.UINT)
      return Win32.Windef.HICON renames ExtractIconA;

   function ShellExecuteA
     (hwnd         : Win32.Windef.HWND;
      lpOperation  : Win32.LPCSTR;
      lpFile       : Win32.LPCSTR;
      lpParameters : Win32.LPSTR;
      lpDirectory  : Win32.LPCSTR;
      nShowCmd     : Win32.INT)
      return Win32.Windef.HINSTANCE;

   function ShellExecute
     (hwnd         : Win32.Windef.HWND;
      lpOperation  : Win32.LPCSTR;
      lpFile       : Win32.LPCSTR;
      lpParameters : Win32.LPSTR;
      lpDirectory  : Win32.LPCSTR;
      nShowCmd     : Win32.INT)
      return Win32.Windef.HINSTANCE renames ShellExecuteA;

   function ShellExecuteW
     (hwnd         : Win32.Windef.HWND;
      lpOperation  : Win32.LPCWSTR;
      lpFile       : Win32.LPCWSTR;
      lpParameters : Win32.LPWSTR;
      lpDirectory  : Win32.LPCWSTR;
      nShowCmd     : Win32.INT)
      return Win32.Windef.HINSTANCE;

   function FindExecutableA
     (lpFile      : Win32.LPCSTR;
      lpDirectory : Win32.LPCSTR;
      lpResult    : Win32.LPSTR)
      return Win32.Windef.HINSTANCE;

   function FindExecutable
     (lpFile      : Win32.LPCSTR;
      lpDirectory : Win32.LPCSTR;
      lpResult    : Win32.LPSTR)
      return Win32.Windef.HINSTANCE renames FindExecutableA;

   function FindExecutableW
     (lpFile      : Win32.LPCWSTR;
      lpDirectory : Win32.LPCWSTR;
      lpResult    : Win32.LPWSTR)
      return Win32.Windef.HINSTANCE;

   function CommandLineToArgvW
     (lpCmdLine : Win32.Winnt.PTCHAR;
      pNumArgs  : access Win32.INT)
      return PPTCHAR;

   function ShellAboutA
     (hWnd         : Win32.Windef.HWND;
      szApp        : Win32.LPCSTR;
      szOtherStuff : Win32.LPCSTR;
      hIcon        : Win32.Windef.HICON)
      return Win32.INT;

   function ShellAbout
     (hWnd         : Win32.Windef.HWND;
      szApp        : Win32.LPCSTR;
      szOtherStuff : Win32.LPCSTR;
      hIcon        : Win32.Windef.HICON)
      return Win32.INT renames ShellAboutA;

   function ShellAboutW
     (hWnd         : Win32.Windef.HWND;
      szApp        : Win32.LPCWSTR;
      szOtherStuff : Win32.LPCWSTR;
      hIcon        : Win32.Windef.HICON)
      return Win32.INT;

   function DuplicateIcon
     (hInst : Win32.Windef.HINSTANCE;
      hIcon : Win32.Windef.HICON)
      return Win32.Windef.HICON;

   function ExtractAssociatedIconA
     (hInst      : Win32.Windef.HINSTANCE;
      lpIconPath : Win32.LPSTR;
      lpiIcon    : Win32.LPWORD)
      return Win32.Windef.HICON;

   function ExtractAssociatedIcon
     (hInst      : Win32.Windef.HINSTANCE;
      lpIconPath : Win32.LPSTR;
      lpiIcon    : Win32.LPWORD)
      return Win32.Windef.HICON renames ExtractAssociatedIconA;

   function ExtractAssociatedIconW
     (hInst      : Win32.Windef.HINSTANCE;
      lpIconPath : Win32.LPWSTR;
      lpiIcon    : Win32.LPWORD)
      return Win32.Windef.HICON;

private

   pragma Import (Stdcall, DragQueryFileW, "DragQueryFileW");
   pragma Import (Stdcall, DragQueryFileA, "DragQueryFileA");
   pragma Import (Stdcall, DragQueryPoint, "DragQueryPoint");
   pragma Import (Stdcall, DragFinish, "DragFinish");
   pragma Import (Stdcall, DragAcceptFiles, "DragAcceptFiles");
   pragma Import (Stdcall, ExtractIconW, "ExtractIconW");
   pragma Import (Stdcall, ExtractIconA, "ExtractIconA");
   pragma Import (Stdcall, ShellExecuteA, "ShellExecuteA");
   pragma Import (Stdcall, ShellExecuteW, "ShellExecuteW");
   pragma Import (Stdcall, FindExecutableA, "FindExecutableA");
   pragma Import (Stdcall, FindExecutableW, "FindExecutableW");
   pragma Import (Stdcall, CommandLineToArgvW, "CommandLineToArgvW");
   pragma Import (Stdcall, ShellAboutA, "ShellAboutA");
   pragma Import (Stdcall, ShellAboutW, "ShellAboutW");
   pragma Import (Stdcall, DuplicateIcon, "DuplicateIcon");
   pragma Import (Stdcall, ExtractAssociatedIconA, "ExtractAssociatedIconA");
   pragma Import (Stdcall, ExtractAssociatedIconW, "ExtractAssociatedIconW");

end Win32.Shellapi;
