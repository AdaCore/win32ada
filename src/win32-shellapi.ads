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

with Win32.Windef;
with Win32.Winnt;

package Win32.Shellapi is

   SE_ERR_SHARE : constant := 26;                --  shellapi.h:47
   SE_ERR_ASSOCINCOMPLETE : constant := 27;                --  shellapi.h:48
   SE_ERR_DDETIMEOUT : constant := 28;                --  shellapi.h:49
   SE_ERR_DDEFAIL : constant := 29;                --  shellapi.h:50
   SE_ERR_DDEBUSY : constant := 30;                --  shellapi.h:51
   SE_ERR_NOASSOC : constant := 31;                --  shellapi.h:52

   subtype HDROP is Win32.Winnt.HANDLE;                   --  shellapi.h:21
   type PPTCHAR is access all Win32.Winnt.PTCHAR;          --  shellapi.h:59

   function DragQueryFileW
     (hDropFile : HDROP;
      iFile : Win32.UINT;
      lpszFile : Win32.LPWSTR;
      cb : Win32.UINT)
     return Win32.UINT;                           --  shellapi.h:23

   function DragQueryFileA
     (hDropFile : HDROP;
      iFile : Win32.UINT;
      lpszFile : Win32.LPSTR;
      cb : Win32.UINT)
     return Win32.UINT;                           --  shellapi.h:24

   function DragQueryFile
     (hDropFile : HDROP;
      iFile : Win32.UINT;
      lpszFile : Win32.LPSTR;
      cb : Win32.UINT)
     return Win32.UINT
     renames DragQueryFileA;                      --  shellapi.h:24

   function DragQueryPoint
     (hDropFile : HDROP;
      lppt : Win32.Windef.LPPOINT)
     return Win32.BOOL;                           --  shellapi.h:32

   procedure DragFinish
     (hDropFree : HDROP);                          --  shellapi.h:33

   procedure DragAcceptFiles
     (hWnd : Win32.Windef.HWND;
      fAccept : Win32.BOOL);                       --  shellapi.h:35

   function ExtractIconW
     (hInst : Win32.Windef.HINSTANCE;
      lpszExeFileName : Win32.LPCWSTR;
      nIconIndex : Win32.UINT)
     return Win32.Windef.HICON;                   --  shellapi.h:37

   function ExtractIconA
     (hInst : Win32.Windef.HINSTANCE;
      lpszExeFileName : Win32.LPCSTR;
      nIconIndex : Win32.UINT)
     return Win32.Windef.HICON;                   --  shellapi.h:38

   function ExtractIcon
     (hInst : Win32.Windef.HINSTANCE;
      lpszExeFileName : Win32.LPCSTR;
      nIconIndex : Win32.UINT)
     return Win32.Windef.HICON
     renames ExtractIconA;                        --  shellapi.h:38

   function ShellExecuteA
     (hwnd : Win32.Windef.HWND;
      lpOperation : Win32.LPCSTR;
      lpFile : Win32.LPCSTR;
      lpParameters : Win32.LPSTR;
      lpDirectory : Win32.LPCSTR;
      nShowCmd : Win32.INT)
     return Win32.Windef.HINSTANCE;               --  shellapi.h:54

   function ShellExecute
     (hwnd : Win32.Windef.HWND;
      lpOperation : Win32.LPCSTR;
      lpFile : Win32.LPCSTR;
      lpParameters : Win32.LPSTR;
      lpDirectory : Win32.LPCSTR;
      nShowCmd : Win32.INT)
     return Win32.Windef.HINSTANCE
     renames ShellExecuteA;                       --  shellapi.h:54

   function ShellExecuteW
     (hwnd : Win32.Windef.HWND;
      lpOperation : Win32.LPCWSTR;
      lpFile : Win32.LPCWSTR;
      lpParameters : Win32.LPWSTR;
      lpDirectory : Win32.LPCWSTR;
      nShowCmd : Win32.INT)
     return Win32.Windef.HINSTANCE;               --  shellapi.h:55

   function FindExecutableA
     (lpFile : Win32.LPCSTR;
      lpDirectory : Win32.LPCSTR;
      lpResult : Win32.LPSTR)
     return Win32.Windef.HINSTANCE;               --  shellapi.h:57

   function FindExecutable
     (lpFile : Win32.LPCSTR;
      lpDirectory : Win32.LPCSTR;
      lpResult : Win32.LPSTR)
     return Win32.Windef.HINSTANCE
     renames FindExecutableA;                     --  shellapi.h:57

   function FindExecutableW
     (lpFile : Win32.LPCWSTR;
      lpDirectory : Win32.LPCWSTR;
      lpResult : Win32.LPWSTR)
     return Win32.Windef.HINSTANCE;               --  shellapi.h:58

   function CommandLineToArgvW
     (lpCmdLine : Win32.Winnt.PTCHAR;
      pNumArgs : access Win32.INT)
     return PPTCHAR;                              --  shellapi.h:59

   function ShellAboutA
     (hWnd : Win32.Windef.HWND;
      szApp : Win32.LPCSTR;
      szOtherStuff : Win32.LPCSTR;
      hIcon : Win32.Windef.HICON)
     return Win32.INT;                            --  shellapi.h:61

   function ShellAbout
     (hWnd : Win32.Windef.HWND;
      szApp : Win32.LPCSTR;
      szOtherStuff : Win32.LPCSTR;
      hIcon : Win32.Windef.HICON)
     return Win32.INT
     renames ShellAboutA;                         --  shellapi.h:61

   function ShellAboutW
     (hWnd : Win32.Windef.HWND;
      szApp : Win32.LPCWSTR;
      szOtherStuff : Win32.LPCWSTR;
      hIcon : Win32.Windef.HICON)
     return Win32.INT;                            --  shellapi.h:62

   function DuplicateIcon
     (hInst : Win32.Windef.HINSTANCE;
      hIcon : Win32.Windef.HICON)
     return Win32.Windef.HICON;                   --  shellapi.h:74

   function ExtractAssociatedIconA
     (hInst : Win32.Windef.HINSTANCE;
      lpIconPath : Win32.LPSTR;
      lpiIcon : Win32.LPWORD)
     return Win32.Windef.HICON;                   --  shellapi.h:75

   function ExtractAssociatedIcon
     (hInst : Win32.Windef.HINSTANCE;
      lpIconPath : Win32.LPSTR;
      lpiIcon : Win32.LPWORD)
     return Win32.Windef.HICON
     renames ExtractAssociatedIconA;              --  shellapi.h:75

   function ExtractAssociatedIconW
     (hInst : Win32.Windef.HINSTANCE;
      lpIconPath : Win32.LPWSTR;
      lpiIcon : Win32.LPWORD)
     return Win32.Windef.HICON;                   --  shellapi.h:76

private

   pragma Import (Stdcall, DragQueryFileW, "DragQueryFileW"); --  shellapi.h:23
   pragma Import (Stdcall, DragQueryFileA, "DragQueryFileA"); --  shellapi.h:24
   pragma Import (Stdcall, DragQueryPoint, "DragQueryPoint"); --  shellapi.h:32
   pragma Import (Stdcall, DragFinish, "DragFinish");         --  shellapi.h:33
   pragma Import (Stdcall, DragAcceptFiles, "DragAcceptFiles");
   --  shellapi.h:35
   pragma Import (Stdcall, ExtractIconW, "ExtractIconW");     --  shellapi.h:37
   pragma Import (Stdcall, ExtractIconA, "ExtractIconA");     --  shellapi.h:38
   pragma Import (Stdcall, ShellExecuteA, "ShellExecuteA");   --  shellapi.h:54
   pragma Import (Stdcall, ShellExecuteW, "ShellExecuteW");   --  shellapi.h:55
   pragma Import (Stdcall, FindExecutableA, "FindExecutableA");
   --  shellapi.h:57
   pragma Import (Stdcall, FindExecutableW, "FindExecutableW");
   --  shellapi.h:58
   pragma Import (Stdcall, CommandLineToArgvW, "CommandLineToArgvW");
   --  shellapi.h:59
   pragma Import (Stdcall, ShellAboutA, "ShellAboutA");       --  shellapi.h:61
   pragma Import (Stdcall, ShellAboutW, "ShellAboutW");       --  shellapi.h:62
   pragma Import (Stdcall, DuplicateIcon, "DuplicateIcon");   --  shellapi.h:74
   pragma Import (Stdcall, ExtractAssociatedIconA, "ExtractAssociatedIconA");
   --  shellapi.h:75
   pragma Import (Stdcall, ExtractAssociatedIconW, "ExtractAssociatedIconW");
   --  shellapi.h:76

end Win32.Shellapi;


