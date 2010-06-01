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
with Win32.Windef;
with Win32.Winnt;

package Win32.Wfext is

   MENU_TEXT_LEN        : constant := 40;
   FMMENU_FIRST         : constant := 1;
   FMMENU_LAST          : constant := 99;
   FMEVENT_LOAD         : constant := 100;
   FMEVENT_UNLOAD       : constant := 101;
   FMEVENT_INITMENU     : constant := 102;
   FMEVENT_USER_REFRESH : constant := 103;
   FMEVENT_SELCHANGE    : constant := 104;
   FMEVENT_TOOLBARLOAD  : constant := 105;
   FMEVENT_HELPSTRING   : constant := 106;
   FMEVENT_HELPMENUITEM : constant := 107;
   FMFOCUS_DIR          : constant := 1;
   FMFOCUS_TREE         : constant := 2;
   FMFOCUS_DRIVES       : constant := 3;
   FMFOCUS_SEARCH       : constant := 4;
   FM_GETFOCUS          : constant := 16#600#;
   FM_GETSELCOUNT       : constant := 16#602#;
   FM_GETSELCOUNTLFN    : constant := 16#603#;
   FM_REFRESH_WINDOWS   : constant := 16#606#;
   FM_RELOAD_EXTENSIONS : constant := 16#607#;
   FM_GETDRIVEINFOA     : constant := 16#601#;
   FM_GETFILESELA       : constant := 16#604#;
   FM_GETFILESELLFNA    : constant := 16#605#;
   FM_GETDRIVEINFOW     : constant := 16#611#;
   FM_GETFILESELW       : constant := 16#614#;
   FM_GETFILESELLFNW    : constant := 16#615#;
   FM_GETDRIVEINFO      : constant := 16#601#;
   FM_GETFILESEL        : constant := 16#604#;
   FM_GETFILESELLFN     : constant := 16#605#;

   type FMS_GETFILESELA;
   type FMS_GETFILESELW;
   type FMS_GETDRIVEINFOA;
   type FMS_GETDRIVEINFOW;
   type FMS_LOADA;
   type FMS_LOADW;
   type EXT_BUTTON;
   type FMS_TOOLBARLOAD;
   type FMS_HELPSTRINGA;
   type FMS_HELPSTRINGW;

   type LPFMS_GETFILESELA is access all FMS_GETFILESELA;
   subtype LPFMS_GETFILESEL is LPFMS_GETFILESELA;
   type LPFMS_GETFILESELW is access all FMS_GETFILESELW;
   type LPFMS_GETDRIVEINFOA is access all FMS_GETDRIVEINFOA;
   subtype LPFMS_GETDRIVEINFO is LPFMS_GETDRIVEINFOA;
   type LPFMS_GETDRIVEINFOW is access all FMS_GETDRIVEINFOW;
   type LPFMS_LOADA is access all FMS_LOADA;
   subtype LPFMS_LOAD is LPFMS_LOADA;
   type LPFMS_LOADW is access all FMS_LOADW;
   type LPEXT_BUTTON is access all EXT_BUTTON;
   type LPFMS_TOOLBARLOAD is access all FMS_TOOLBARLOAD;
   type LPFMS_HELPSTRINGA is access all FMS_HELPSTRINGA;
   subtype LPFMS_HELPSTRING is LPFMS_HELPSTRINGA;
   type LPFMS_HELPSTRINGW is access all FMS_HELPSTRINGW;

   type FMS_GETFILESELA is record
      ftTime : Win32.Winbase.FILETIME;
      dwSize : Win32.DWORD;
      bAttr  : Win32.BYTE;
      szName : Win32.CHAR_Array (0 .. 259);
   end record;

   subtype FMS_GETFILESEL is FMS_GETFILESELA;

   type FMS_GETFILESELW is record
      ftTime : Win32.Winbase.FILETIME;
      dwSize : Win32.DWORD;
      bAttr  : Win32.BYTE;
      szName : Win32.WCHAR_Array (0 .. 259);
   end record;

   type FMS_GETDRIVEINFOA is record
      dwTotalSpace : Win32.DWORD;
      dwFreeSpace  : Win32.DWORD;
      szPath       : Win32.CHAR_Array (0 .. 259);
      szVolume     : Win32.CHAR_Array (0 .. 13);
      szShare      : Win32.CHAR_Array (0 .. 127);
   end record;

   subtype FMS_GETDRIVEINFO is FMS_GETDRIVEINFOA;

   type FMS_GETDRIVEINFOW is record
      dwTotalSpace : Win32.DWORD;
      dwFreeSpace  : Win32.DWORD;
      szPath       : Win32.WCHAR_Array (0 .. 259);
      szVolume     : Win32.WCHAR_Array (0 .. 13);
      szShare      : Win32.WCHAR_Array (0 .. 127);
   end record;

   type FMS_LOADA is record
      dwSize     : Win32.DWORD;
      szMenuName : Win32.CHAR_Array (0 .. MENU_TEXT_LEN - 1);
      hMenu      : Win32.Windef.HMENU;
      wMenuDelta : Win32.UINT;
   end record;

   subtype FMS_LOAD is FMS_LOADA;

   type FMS_LOADW is record
      dwSize     : Win32.DWORD;
      szMenuName : Win32.WCHAR_Array (0 .. MENU_TEXT_LEN - 1);
      hMenu      : Win32.Windef.HMENU;
      wMenuDelta : Win32.UINT;
   end record;

   type EXT_BUTTON is record
      idCommand : Win32.WORD;
      idsHelp   : Win32.WORD;
      fsStyle   : Win32.WORD;
   end record;

   type FMS_TOOLBARLOAD is record
      dwSize    : Win32.DWORD;
      lpButtons : LPEXT_BUTTON;
      cButtons  : Win32.WORD;
      cBitmaps  : Win32.WORD;
      idBitmap  : Win32.WORD;
      hBitmap   : Win32.Windef.HBITMAP;
   end record;

   type FMS_HELPSTRINGA is record
      idCommand : Win32.INT;
      hMenu     : Win32.Windef.HMENU;
      szHelp    : Win32.CHAR_Array (0 .. 127);
   end record;

   subtype FMS_HELPSTRING is FMS_HELPSTRINGA;

   type FMS_HELPSTRINGW is record
      idCommand : Win32.INT;
      hMenu     : Win32.Windef.HMENU;
      szHelp    : Win32.WCHAR_Array (0 .. 127);
   end record;

   type FM_EXT_PROC is access function
     (hWnd   : Win32.Windef.HWND;
      wMsg   : Win32.WORD;
      lParam : Win32.LONG)
      return Win32.DWORD;
   pragma Convention (Stdcall, FM_EXT_PROC);
   type FM_UNDELETE_PROC is access function
     (hWndOwner : Win32.Windef.HWND;
      lpszDir   : Win32.Winnt.LPTSTR)
      return Win32.DWORD;
   pragma Convention (Stdcall, FM_UNDELETE_PROC);

   function FMExtensionProc
     (hwnd   : Win32.Windef.HWND;
      wEvent : Win32.WORD;
      lParam : Win32.LONG)
      return Win32.LONG;

private

   pragma Convention (C, FMS_GETFILESELA);
   pragma Convention (C, FMS_GETFILESELW);
   pragma Convention (C, FMS_GETDRIVEINFOA);
   pragma Convention (C, FMS_GETDRIVEINFOW);
   pragma Convention (C, FMS_LOADA);
   pragma Convention (C, FMS_LOADW);
   pragma Convention (C_Pass_By_Copy, EXT_BUTTON);
   pragma Convention (C, FMS_TOOLBARLOAD);
   pragma Convention (C, FMS_HELPSTRINGA);
   pragma Convention (C, FMS_HELPSTRINGW);

   pragma Import (Stdcall, FMExtensionProc, "FMExtensionProc");

end Win32.Wfext;
