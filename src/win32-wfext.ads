-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winbase;
with Win32.Windef;
with Win32.Winnt;

package Win32.Wfext is

    MENU_TEXT_LEN            : constant := 40;              -- wfext.h:18
    FMMENU_FIRST             : constant := 1;               -- wfext.h:20
    FMMENU_LAST              : constant := 99;              -- wfext.h:21
    FMEVENT_LOAD             : constant := 100;             -- wfext.h:23
    FMEVENT_UNLOAD           : constant := 101;             -- wfext.h:24
    FMEVENT_INITMENU         : constant := 102;             -- wfext.h:25
    FMEVENT_USER_REFRESH     : constant := 103;             -- wfext.h:26
    FMEVENT_SELCHANGE        : constant := 104;             -- wfext.h:27
    FMEVENT_TOOLBARLOAD      : constant := 105;             -- wfext.h:28
    FMEVENT_HELPSTRING       : constant := 106;             -- wfext.h:29
    FMEVENT_HELPMENUITEM     : constant := 107;             -- wfext.h:30
    FMFOCUS_DIR              : constant := 1;               -- wfext.h:32
    FMFOCUS_TREE             : constant := 2;               -- wfext.h:33
    FMFOCUS_DRIVES           : constant := 3;               -- wfext.h:34
    FMFOCUS_SEARCH           : constant := 4;               -- wfext.h:35
    FM_GETFOCUS              : constant := 16#600#;         -- wfext.h:37
    FM_GETSELCOUNT           : constant := 16#602#;         -- wfext.h:38
    FM_GETSELCOUNTLFN        : constant := 16#603#;         -- wfext.h:39
    FM_REFRESH_WINDOWS       : constant := 16#606#;         -- wfext.h:40
    FM_RELOAD_EXTENSIONS     : constant := 16#607#;         -- wfext.h:41
    FM_GETDRIVEINFOA         : constant := 16#601#;         -- wfext.h:43
    FM_GETFILESELA           : constant := 16#604#;         -- wfext.h:44
    FM_GETFILESELLFNA        : constant := 16#605#;         -- wfext.h:45
    FM_GETDRIVEINFOW         : constant := 16#611#;         -- wfext.h:47
    FM_GETFILESELW           : constant := 16#614#;         -- wfext.h:48
    FM_GETFILESELLFNW        : constant := 16#615#;         -- wfext.h:49
    FM_GETDRIVEINFO          : constant := 16#601#;         -- wfext.h:56
    FM_GETFILESEL            : constant := 16#604#;         -- wfext.h:57
    FM_GETFILESELLFN         : constant := 16#605#;         -- wfext.h:58

    type FMS_GETFILESELA;                                   -- wfext.h:62
    type FMS_GETFILESELW;                                   -- wfext.h:69
    type FMS_GETDRIVEINFOA;                                 -- wfext.h:85
    type FMS_GETDRIVEINFOW;                                 -- wfext.h:93
    type FMS_LOADA;                                         -- wfext.h:110
    type FMS_LOADW;                                         -- wfext.h:117
    type EXT_BUTTON;                                        -- wfext.h:135
    type FMS_TOOLBARLOAD;                                   -- wfext.h:141
    type FMS_HELPSTRINGA;                                   -- wfext.h:150
    type FMS_HELPSTRINGW;                                   -- wfext.h:156

    type LPFMS_GETFILESELA is access all FMS_GETFILESELA;   -- wfext.h:67
    subtype LPFMS_GETFILESEL is LPFMS_GETFILESELA;          -- wfext.h:81
    type LPFMS_GETFILESELW is access all FMS_GETFILESELW;   -- wfext.h:74
    type LPFMS_GETDRIVEINFOA is access all FMS_GETDRIVEINFOA;
                                                            -- wfext.h:91
    subtype LPFMS_GETDRIVEINFO is LPFMS_GETDRIVEINFOA;      -- wfext.h:106
    type LPFMS_GETDRIVEINFOW is access all FMS_GETDRIVEINFOW;
                                                            -- wfext.h:99
    type LPFMS_LOADA is access all FMS_LOADA;               -- wfext.h:115
    subtype LPFMS_LOAD is LPFMS_LOADA;                      -- wfext.h:129
    type LPFMS_LOADW is access all FMS_LOADW;               -- wfext.h:122
    type LPEXT_BUTTON is access all EXT_BUTTON;             -- wfext.h:139
    type LPFMS_TOOLBARLOAD is access all FMS_TOOLBARLOAD;   -- wfext.h:148
    type LPFMS_HELPSTRINGA is access all FMS_HELPSTRINGA;   -- wfext.h:154
    subtype LPFMS_HELPSTRING is LPFMS_HELPSTRINGA;          -- wfext.h:167
    type LPFMS_HELPSTRINGW is access all FMS_HELPSTRINGW;   -- wfext.h:160

    type FMS_GETFILESELA is                                 -- wfext.h:62
        record
            ftTime: Win32.Winbase.FILETIME;                 -- wfext.h:63
            dwSize: Win32.DWORD;                            -- wfext.h:64
            bAttr : Win32.BYTE;                             -- wfext.h:65
            szName: Win32.CHAR_Array(0..259);               -- wfext.h:66
        end record;

    subtype FMS_GETFILESEL is FMS_GETFILESELA;              -- wfext.h:80

    type FMS_GETFILESELW is                                 -- wfext.h:69
        record
            ftTime: Win32.Winbase.FILETIME;                 -- wfext.h:70
            dwSize: Win32.DWORD;                            -- wfext.h:71
            bAttr : Win32.BYTE;                             -- wfext.h:72
            szName: Win32.WCHAR_Array(0..259);              -- wfext.h:73
        end record;

    type FMS_GETDRIVEINFOA is                               -- wfext.h:85
        record
            dwTotalSpace: Win32.DWORD;                      -- wfext.h:86
            dwFreeSpace : Win32.DWORD;                      -- wfext.h:87
            szPath      : Win32.CHAR_Array(0..259);         -- wfext.h:88
            szVolume    : Win32.CHAR_Array(0..13);          -- wfext.h:89
            szShare     : Win32.CHAR_Array(0..127);         -- wfext.h:90
        end record;

    subtype FMS_GETDRIVEINFO is FMS_GETDRIVEINFOA;          -- wfext.h:105

    type FMS_GETDRIVEINFOW is                               -- wfext.h:93
        record
            dwTotalSpace: Win32.DWORD;                      -- wfext.h:94
            dwFreeSpace : Win32.DWORD;                      -- wfext.h:95
            szPath      : Win32.WCHAR_Array(0..259);        -- wfext.h:96
            szVolume    : Win32.WCHAR_Array(0..13);         -- wfext.h:97
            szShare     : Win32.WCHAR_Array(0..127);        -- wfext.h:98
        end record;

    type FMS_LOADA is                                       -- wfext.h:110
        record
            dwSize    : Win32.DWORD;                        -- wfext.h:111
            szMenuName: Win32.CHAR_Array(0..MENU_TEXT_LEN-1);
                                                            -- wfext.h:112
            hMenu     : Win32.Windef.HMENU;                 -- wfext.h:113
            wMenuDelta: Win32.UINT;                         -- wfext.h:114
        end record;

    subtype FMS_LOAD is FMS_LOADA;                          -- wfext.h:128

    type FMS_LOADW is                                       -- wfext.h:117
        record
            dwSize    : Win32.DWORD;                        -- wfext.h:118
            szMenuName: Win32.WCHAR_Array(0..MENU_TEXT_LEN-1);
                                                            -- wfext.h:119
            hMenu     : Win32.Windef.HMENU;                 -- wfext.h:120
            wMenuDelta: Win32.UINT;                         -- wfext.h:121
        end record;

    type EXT_BUTTON is                                      -- wfext.h:135
        record
            idCommand: Win32.WORD;                          -- wfext.h:136
            idsHelp  : Win32.WORD;                          -- wfext.h:137
            fsStyle  : Win32.WORD;                          -- wfext.h:138
        end record;

    type FMS_TOOLBARLOAD is                                 -- wfext.h:141
        record
            dwSize   : Win32.DWORD;                         -- wfext.h:142
            lpButtons: LPEXT_BUTTON;                        -- wfext.h:143
            cButtons : Win32.WORD;                          -- wfext.h:144
            cBitmaps : Win32.WORD;                          -- wfext.h:145
            idBitmap : Win32.WORD;                          -- wfext.h:146
            hBitmap  : Win32.Windef.HBITMAP;                -- wfext.h:147
        end record;

    type FMS_HELPSTRINGA is                                 -- wfext.h:150
        record
            idCommand: Win32.INT;                           -- wfext.h:151
            hMenu    : Win32.Windef.HMENU;                  -- wfext.h:152
            szHelp   : Win32.CHAR_Array(0..127);            -- wfext.h:153
        end record;

    subtype FMS_HELPSTRING is FMS_HELPSTRINGA;              -- wfext.h:166

    type FMS_HELPSTRINGW is                                 -- wfext.h:156
        record
            idCommand: Win32.INT;                           -- wfext.h:157
            hMenu    : Win32.Windef.HMENU;                  -- wfext.h:158
            szHelp   : Win32.WCHAR_Array(0..127);           -- wfext.h:159
        end record;

    type FM_EXT_PROC is access function (
                hWnd  : Win32.Windef.HWND;
                wMsg  : Win32.WORD;
                lParam: Win32.LONG)
               return Win32.DWORD;                          -- wfext.h:171
    pragma Convention(Stdcall, FM_EXT_PROC);
    type FM_UNDELETE_PROC is access function (
                hWndOwner: Win32.Windef.HWND;
                lpszDir  : Win32.Winnt.LPTSTR)
               return Win32.DWORD;                          -- wfext.h:172
    pragma Convention(Stdcall, FM_UNDELETE_PROC);

    function FMExtensionProc(
                hwnd  : Win32.Windef.HWND;
                wEvent: Win32.WORD;
                lParam: Win32.LONG)
               return Win32.LONG;                           -- wfext.h:177

private

    pragma Convention(C, FMS_GETFILESELA);                  -- wfext.h:62
    pragma Convention(C, FMS_GETFILESELW);                  -- wfext.h:69
    pragma Convention(C, FMS_GETDRIVEINFOA);                -- wfext.h:85
    pragma Convention(C, FMS_GETDRIVEINFOW);                -- wfext.h:93
    pragma Convention(C, FMS_LOADA);                        -- wfext.h:110
    pragma Convention(C, FMS_LOADW);                        -- wfext.h:117
    pragma Convention(C_Pass_By_Copy, EXT_BUTTON);                       -- wfext.h:135
    pragma Convention(C, FMS_TOOLBARLOAD);                  -- wfext.h:141
    pragma Convention(C, FMS_HELPSTRINGA);                  -- wfext.h:150
    pragma Convention(C, FMS_HELPSTRINGW);                  -- wfext.h:156

    pragma Import(Stdcall, FMExtensionProc, "FMExtensionProc");   -- wfext.h:177

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Wfext;
