-- $Source$
-- $Revision$ $Date$ $Author$
-- See end of file for Copyright (c) information.

with Win32.Windef;
with Win32.Wingdi;

package Win32.Commdlg is

    use Interfaces;
    use type Interfaces.C.Char_Array;

    OFN_READONLY               : constant := 16#1#;         -- commdlg.h:111
    OFN_OVERWRITEPROMPT        : constant := 16#2#;         -- commdlg.h:112
    OFN_HIDEREADONLY           : constant := 16#4#;         -- commdlg.h:113
    OFN_NOCHANGEDIR            : constant := 16#8#;         -- commdlg.h:114
    OFN_SHOWHELP               : constant := 16#10#;        -- commdlg.h:115
    OFN_ENABLEHOOK             : constant := 16#20#;        -- commdlg.h:116
    OFN_ENABLETEMPLATE         : constant := 16#40#;        -- commdlg.h:117
    OFN_ENABLETEMPLATEHANDLE   : constant := 16#80#;        -- commdlg.h:118
    OFN_NOVALIDATE             : constant := 16#100#;       -- commdlg.h:119
    OFN_ALLOWMULTISELECT       : constant := 16#200#;       -- commdlg.h:120
    OFN_EXTENSIONDIFFERENT     : constant := 16#400#;       -- commdlg.h:121
    OFN_PATHMUSTEXIST          : constant := 16#800#;       -- commdlg.h:122
    OFN_FILEMUSTEXIST          : constant := 16#1000#;      -- commdlg.h:123
    OFN_CREATEPROMPT           : constant := 16#2000#;      -- commdlg.h:124
    OFN_SHAREAWARE             : constant := 16#4000#;      -- commdlg.h:125
    OFN_NOREADONLYRETURN       : constant := 16#8000#;      -- commdlg.h:126
    OFN_NOTESTFILECREATE       : constant := 16#10000#;     -- commdlg.h:127
    OFN_NONETWORKBUTTON        : constant := 16#20000#;     -- commdlg.h:128
    OFN_NOLONGNAMES            : constant := 16#40000#;     -- commdlg.h:129
    OFN_SHAREFALLTHROUGH       : constant := 2;             -- commdlg.h:141
    OFN_SHARENOWARN            : constant := 1;             -- commdlg.h:142
    OFN_SHAREWARN              : constant := 0;             -- commdlg.h:143
    CC_RGBINIT                 : constant := 16#1#;         -- commdlg.h:190
    CC_FULLOPEN                : constant := 16#2#;         -- commdlg.h:191
    CC_PREVENTFULLOPEN         : constant := 16#4#;         -- commdlg.h:192
    CC_SHOWHELP                : constant := 16#8#;         -- commdlg.h:193
    CC_ENABLEHOOK              : constant := 16#10#;        -- commdlg.h:194
    CC_ENABLETEMPLATE          : constant := 16#20#;        -- commdlg.h:195
    CC_ENABLETEMPLATEHANDLE    : constant := 16#40#;        -- commdlg.h:196
    FR_DOWN                    : constant := 16#1#;         -- commdlg.h:240
    FR_WHOLEWORD               : constant := 16#2#;         -- commdlg.h:241
    FR_MATCHCASE               : constant := 16#4#;         -- commdlg.h:242
    FR_FINDNEXT                : constant := 16#8#;         -- commdlg.h:243
    FR_REPLACE                 : constant := 16#10#;        -- commdlg.h:244
    FR_REPLACEALL              : constant := 16#20#;        -- commdlg.h:245
    FR_DIALOGTERM              : constant := 16#40#;        -- commdlg.h:246
    FR_SHOWHELP                : constant := 16#80#;        -- commdlg.h:247
    FR_ENABLEHOOK              : constant := 16#100#;       -- commdlg.h:248
    FR_ENABLETEMPLATE          : constant := 16#200#;       -- commdlg.h:249
    FR_NOUPDOWN                : constant := 16#400#;       -- commdlg.h:250
    FR_NOMATCHCASE             : constant := 16#800#;       -- commdlg.h:251
    FR_NOWHOLEWORD             : constant := 16#1000#;      -- commdlg.h:252
    FR_ENABLETEMPLATEHANDLE    : constant := 16#2000#;      -- commdlg.h:253
    FR_HIDEUPDOWN              : constant := 16#4000#;      -- commdlg.h:254
    FR_HIDEMATCHCASE           : constant := 16#8000#;      -- commdlg.h:255
    FR_HIDEWHOLEWORD           : constant := 16#10000#;     -- commdlg.h:256
    CF_SCREENFONTS             : constant := 16#1#;         -- commdlg.h:345
    CF_PRINTERFONTS            : constant := 16#2#;         -- commdlg.h:346
    CF_BOTH                    : constant := 16#3#;         -- commdlg.h:347
    CF_SHOWHELP                : constant := 16#4#;         -- commdlg.h:348
    CF_ENABLEHOOK              : constant := 16#8#;         -- commdlg.h:349
    CF_ENABLETEMPLATE          : constant := 16#10#;        -- commdlg.h:350
    CF_ENABLETEMPLATEHANDLE    : constant := 16#20#;        -- commdlg.h:351
    CF_INITTOLOGFONTSTRUCT     : constant := 16#40#;        -- commdlg.h:352
    CF_USESTYLE                : constant := 16#80#;        -- commdlg.h:353
    CF_EFFECTS                 : constant := 16#100#;       -- commdlg.h:354
    CF_APPLY                   : constant := 16#200#;       -- commdlg.h:355
    CF_ANSIONLY                : constant := 16#400#;       -- commdlg.h:356
    CF_NOVECTORFONTS           : constant := 16#800#;       -- commdlg.h:357
    CF_NOOEMFONTS              : constant := 16#800#;       -- commdlg.h:358
    CF_NOSIMULATIONS           : constant := 16#1000#;      -- commdlg.h:359
    CF_LIMITSIZE               : constant := 16#2000#;      -- commdlg.h:360
    CF_FIXEDPITCHONLY          : constant := 16#4000#;      -- commdlg.h:361
    CF_WYSIWYG                 : constant := 16#8000#;      -- commdlg.h:362
    CF_FORCEFONTEXIST          : constant := 16#10000#;     -- commdlg.h:363
    CF_SCALABLEONLY            : constant := 16#20000#;     -- commdlg.h:364
    CF_TTONLY                  : constant := 16#40000#;     -- commdlg.h:365
    CF_NOFACESEL               : constant := 16#80000#;     -- commdlg.h:366
    CF_NOSTYLESEL              : constant := 16#100000#;    -- commdlg.h:367
    CF_NOSIZESEL               : constant := 16#200000#;    -- commdlg.h:368
    SIMULATED_FONTTYPE         : constant := 16#8000#;      -- commdlg.h:373
    PRINTER_FONTTYPE           : constant := 16#4000#;      -- commdlg.h:374
    SCREEN_FONTTYPE            : constant := 16#2000#;      -- commdlg.h:375
    BOLD_FONTTYPE              : constant := 16#100#;       -- commdlg.h:376
    ITALIC_FONTTYPE            : constant := 16#200#;       -- commdlg.h:377
    REGULAR_FONTTYPE           : constant := 16#400#;       -- commdlg.h:378
    WM_CHOOSEFONT_GETLOGFONT   : constant := 16#401#;       -- commdlg.h:380
    LBSELCHSTRINGA             : constant CHAR_Array :=
                                 "commdlg_LBSelChangedNotify" & Nul;
                                                            -- commdlg.h:385
    SHAREVISTRINGA             : constant CHAR_Array :=
                                 "commdlg_ShareViolation" & Nul;
                                                            -- commdlg.h:386
    FILEOKSTRINGA              : constant CHAR_Array :=
                                 "commdlg_FileNameOK" & Nul; -- commdlg.h:387
    COLOROKSTRINGA             : constant CHAR_Array :=
                                 "commdlg_ColorOK" & Nul; -- commdlg.h:388
    SETRGBSTRINGA              : constant CHAR_Array :=
                                 "commdlg_SetRGBColor" & Nul;
                                                            -- commdlg.h:389
    HELPMSGSTRINGA             : constant CHAR_Array := "commdlg_help" & Nul;
                                                            -- commdlg.h:390
    FINDMSGSTRINGA             : constant CHAR_Array :=
                                 "commdlg_FindReplace" & Nul;
                                                            -- commdlg.h:391
    LBSELCHSTRINGW             : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_LBSelChangedNotify")) & Wide_Nul;
                                                            -- commdlg.h:393
    SHAREVISTRINGW             : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_ShareViolation")) & Wide_Nul;
                                                            -- commdlg.h:394
    FILEOKSTRINGW              : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_FileNameOK")) & Wide_Nul;
                                                            -- commdlg.h:395
    COLOROKSTRINGW             : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_ColorOK")) & Wide_Nul; -- commdlg.h:396
    SETRGBSTRINGW              : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_SetRGBColor")) & Wide_Nul;
                                                            -- commdlg.h:397
    HELPMSGSTRINGW             : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_help")) & Wide_Nul; -- commdlg.h:398
    FINDMSGSTRINGW             : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_FindReplace")) & Wide_Nul;
                                                            -- commdlg.h:399
    LBSELCHSTRING              : constant CHAR_Array :=
                                 "commdlg_LBSelChangedNotify" & Nul;
                                                            -- commdlg.h:410
    SHAREVISTRING              : constant CHAR_Array :=
                                 "commdlg_ShareViolation" & Nul;
                                                            -- commdlg.h:411
    FILEOKSTRING               : constant CHAR_Array :=
                                 "commdlg_FileNameOK" & Nul; -- commdlg.h:412
    COLOROKSTRING              : constant CHAR_Array :=
                                 "commdlg_ColorOK" & Nul; -- commdlg.h:413
    SETRGBSTRING               : constant CHAR_Array :=
                                 "commdlg_SetRGBColor" & Nul; -- commdlg.h:414
    HELPMSGSTRING              : constant CHAR_Array := "commdlg_help" & Nul;
                                                            -- commdlg.h:415
    FINDMSGSTRING              : constant CHAR_Array :=
                                 "commdlg_FindReplace" & Nul; -- commdlg.h:416
    CD_LBSELNOITEMS            : constant := -1;            -- commdlg.h:420
    CD_LBSELCHANGE             : constant := 0;             -- commdlg.h:421
    CD_LBSELSUB                : constant := 1;             -- commdlg.h:422
    CD_LBSELADD                : constant := 2;             -- commdlg.h:423
    PD_ALLPAGES                : constant := 16#0#;         -- commdlg.h:491
    PD_SELECTION               : constant := 16#1#;         -- commdlg.h:492
    PD_PAGENUMS                : constant := 16#2#;         -- commdlg.h:493
    PD_NOSELECTION             : constant := 16#4#;         -- commdlg.h:494
    PD_NOPAGENUMS              : constant := 16#8#;         -- commdlg.h:495
    PD_COLLATE                 : constant := 16#10#;        -- commdlg.h:496
    PD_PRINTTOFILE             : constant := 16#20#;        -- commdlg.h:497
    PD_PRINTSETUP              : constant := 16#40#;        -- commdlg.h:498
    PD_NOWARNING               : constant := 16#80#;        -- commdlg.h:499
    PD_RETURNDC                : constant := 16#100#;       -- commdlg.h:500
    PD_RETURNIC                : constant := 16#200#;       -- commdlg.h:501
    PD_RETURNDEFAULT           : constant := 16#400#;       -- commdlg.h:502
    PD_SHOWHELP                : constant := 16#800#;       -- commdlg.h:503
    PD_ENABLEPRINTHOOK         : constant := 16#1000#;      -- commdlg.h:504
    PD_ENABLESETUPHOOK         : constant := 16#2000#;      -- commdlg.h:505
    PD_ENABLEPRINTTEMPLATE     : constant := 16#4000#;      -- commdlg.h:506
    PD_ENABLESETUPTEMPLATE     : constant := 16#8000#;      -- commdlg.h:507
    PD_ENABLEPRINTTEMPLATEHANDLE: constant := 16#10000#;    -- commdlg.h:508
    PD_ENABLESETUPTEMPLATEHANDLE: constant := 16#20000#;    -- commdlg.h:509
    PD_USEDEVMODECOPIES        : constant := 16#40000#;     -- commdlg.h:510
    PD_DISABLEPRINTTOFILE      : constant := 16#80000#;     -- commdlg.h:511
    PD_HIDEPRINTTOFILE         : constant := 16#100000#;    -- commdlg.h:512
    PD_NONETWORKBUTTON         : constant := 16#200000#;    -- commdlg.h:513
    DN_DEFAULTPRN              : constant := 16#1#;         -- commdlg.h:524

    type OPENFILENAMEA;                                     -- commdlg.h:29
    type OPENFILENAMEW;                                     -- commdlg.h:52
    type CHOOSECOLORA;                                      -- commdlg.h:147
    type CHOOSECOLORW;                                      -- commdlg.h:159
    type FINDREPLACEA;                                      -- commdlg.h:200
    type FINDREPLACEW;                                      -- commdlg.h:215
    type CHOOSEFONTA;                                       -- commdlg.h:278
    type CHOOSEFONTW;                                       -- commdlg.h:302
    type PRINTDLGA;                                         -- commdlg.h:428
    type PRINTDLGW;                                         -- commdlg.h:450
    type DEVNAMES;                                          -- commdlg.h:515

    type LPOPENFILENAMEA is access all OPENFILENAMEA;       -- commdlg.h:81
    type LPOPENFILENAMEW is access all OPENFILENAMEW;       -- commdlg.h:82
    subtype LPOPENFILENAME is LPOPENFILENAMEA;              -- commdlg.h:83
    type LPCHOOSECOLORA is access all CHOOSECOLORA;         -- commdlg.h:177
    type LPCHOOSECOLORW is access all CHOOSECOLORW;         -- commdlg.h:178
    subtype LPCHOOSECOLOR is LPCHOOSECOLORA;                -- commdlg.h:179
    type LPFINDREPLACEA is access all FINDREPLACEA;         -- commdlg.h:236
    type LPFINDREPLACEW is access all FINDREPLACEW;         -- commdlg.h:237
    subtype LPFINDREPLACE is LPFINDREPLACEA;                -- commdlg.h:238
    type LPCHOOSEFONTA is access all CHOOSEFONTA;           -- commdlg.h:332
    type LPCHOOSEFONTW is access all CHOOSEFONTW;           -- commdlg.h:333
    subtype LPCHOOSEFONT is LPCHOOSEFONTA;                  -- commdlg.h:334
    type LPPRINTDLGA is access all PRINTDLGA;               -- commdlg.h:478
    type LPPRINTDLGW is access all PRINTDLGW;               -- commdlg.h:479
    subtype LPPRINTDLG is LPPRINTDLGA;                      -- commdlg.h:480
    type LPDEVNAMES is access all DEVNAMES;                 -- commdlg.h:522

    type LPOFNHOOKPROC is access function (
                hWnd  : Win32.Windef.HWND;
                nCode : Win32.UINT;
                wParam: Win32.WPARAM;
                lParam: Win32.LPARAM)
               return Win32.UINT;                           -- commdlg.h:27
    pragma Convention(Stdcall, LPOFNHOOKPROC);

    type OPENFILENAMEA is                                   -- commdlg.h:29
        record
            lStructSize      : Win32.DWORD;                 -- commdlg.h:30
            hwndOwner        : Win32.Windef.HWND;           -- commdlg.h:31
            hInstance        : Win32.Windef.HINSTANCE;      -- commdlg.h:32
            lpstrFilter      : Win32.LPCSTR;                -- commdlg.h:33
            lpstrCustomFilter: Win32.LPSTR;                 -- commdlg.h:34
            nMaxCustFilter   : Win32.DWORD;                 -- commdlg.h:35
            nFilterIndex     : Win32.DWORD;                 -- commdlg.h:36
            lpstrFile        : Win32.LPSTR;                 -- commdlg.h:37
            nMaxFile         : Win32.DWORD;                 -- commdlg.h:38
            lpstrFileTitle   : Win32.LPSTR;                 -- commdlg.h:39
            nMaxFileTitle    : Win32.DWORD;                 -- commdlg.h:40
            lpstrInitialDir  : Win32.LPCSTR;                -- commdlg.h:41
            lpstrTitle       : Win32.LPCSTR;                -- commdlg.h:42
            Flags            : Win32.DWORD;                 -- commdlg.h:43
            nFileOffset      : Win32.WORD;                  -- commdlg.h:44
            nFileExtension   : Win32.WORD;                  -- commdlg.h:45
            lpstrDefExt      : Win32.LPCSTR;                -- commdlg.h:46
            lCustData        : Win32.LPARAM;                -- commdlg.h:47
            lpfnHook         : LPOFNHOOKPROC;               -- commdlg.h:48
            lpTemplateName   : Win32.LPCSTR;                -- commdlg.h:49
        end record;

    subtype OPENFILENAME is OPENFILENAMEA;                  -- commdlg.h:78

    type OPENFILENAMEW is                                   -- commdlg.h:52
        record
            lStructSize      : Win32.DWORD;                 -- commdlg.h:53
            hwndOwner        : Win32.Windef.HWND;           -- commdlg.h:54
            hInstance        : Win32.Windef.HINSTANCE;      -- commdlg.h:55
            lpstrFilter      : Win32.LPCWSTR;               -- commdlg.h:56
            lpstrCustomFilter: Win32.LPWSTR;                -- commdlg.h:57
            nMaxCustFilter   : Win32.DWORD;                 -- commdlg.h:58
            nFilterIndex     : Win32.DWORD;                 -- commdlg.h:59
            lpstrFile        : Win32.LPWSTR;                -- commdlg.h:60
            nMaxFile         : Win32.DWORD;                 -- commdlg.h:61
            lpstrFileTitle   : Win32.LPWSTR;                -- commdlg.h:62
            nMaxFileTitle    : Win32.DWORD;                 -- commdlg.h:63
            lpstrInitialDir  : Win32.LPCWSTR;               -- commdlg.h:64
            lpstrTitle       : Win32.LPCWSTR;               -- commdlg.h:65
            Flags            : Win32.DWORD;                 -- commdlg.h:66
            nFileOffset      : Win32.WORD;                  -- commdlg.h:67
            nFileExtension   : Win32.WORD;                  -- commdlg.h:68
            lpstrDefExt      : Win32.LPCWSTR;               -- commdlg.h:69
            lCustData        : Win32.LPARAM;                -- commdlg.h:70
            lpfnHook         : LPOFNHOOKPROC;               -- commdlg.h:71
            lpTemplateName   : Win32.LPCWSTR;               -- commdlg.h:72
        end record;

    type LPCCHOOKPROC is access function (
                hWnd  : Win32.Windef.HWND;
                nCode : Win32.UINT;
                wParam: Win32.WPARAM;
                lParam: Win32.LPARAM)
               return Win32.UINT;                           -- commdlg.h:145
    pragma Convention(Stdcall, LPCCHOOKPROC);

    type CHOOSECOLORA is                                    -- commdlg.h:147
        record
            lStructSize   : Win32.DWORD;                    -- commdlg.h:148
            hwndOwner     : Win32.Windef.HWND;              -- commdlg.h:149
            hInstance     : Win32.Windef.HWND;              -- commdlg.h:150
            rgbResult     : Win32.Windef.COLORREF;          -- commdlg.h:151
            lpCustColors  : Win32.Windef.LPCOLORREF;        -- commdlg.h:152
            Flags         : Win32.DWORD;                    -- commdlg.h:153
            lCustData     : Win32.LPARAM;                   -- commdlg.h:154
            lpfnHook      : LPCCHOOKPROC;                   -- commdlg.h:155
            lpTemplateName: Win32.LPCSTR;                   -- commdlg.h:156
        end record;

    subtype CHOOSECOLOR is CHOOSECOLORA;                    -- commdlg.h:174

    type CHOOSECOLORW is                                    -- commdlg.h:159
        record
            lStructSize   : Win32.DWORD;                    -- commdlg.h:160
            hwndOwner     : Win32.Windef.HWND;              -- commdlg.h:161
            hInstance     : Win32.Windef.HWND;              -- commdlg.h:162
            rgbResult     : Win32.Windef.COLORREF;          -- commdlg.h:163
            lpCustColors  : Win32.Windef.LPCOLORREF;        -- commdlg.h:164
            Flags         : Win32.DWORD;                    -- commdlg.h:165
            lCustData     : Win32.LPARAM;                   -- commdlg.h:166
            lpfnHook      : LPCCHOOKPROC;                   -- commdlg.h:167
            lpTemplateName: Win32.LPCWSTR;                  -- commdlg.h:168
        end record;

    type LPFRHOOKPROC is access function (
                hWnd  : Win32.Windef.HWND;
                nCode : Win32.UINT;
                wParam: Win32.WPARAM;
                lParam: Win32.LPARAM)
               return Win32.UINT;                           -- commdlg.h:198
    pragma Convention(Stdcall, LPFRHOOKPROC);

    type FINDREPLACEA is                                    -- commdlg.h:200
        record
            lStructSize     : Win32.DWORD;                  -- commdlg.h:201
            hwndOwner       : Win32.Windef.HWND;            -- commdlg.h:202
            hInstance       : Win32.Windef.HINSTANCE;       -- commdlg.h:203
            Flags           : Win32.DWORD;                  -- commdlg.h:205
            lpstrFindWhat   : Win32.LPSTR;                  -- commdlg.h:206
            lpstrReplaceWith: Win32.LPSTR;                  -- commdlg.h:207
            wFindWhatLen    : Win32.WORD;                   -- commdlg.h:208
            wReplaceWithLen : Win32.WORD;                   -- commdlg.h:209
            lCustData       : Win32.LPARAM;                 -- commdlg.h:210
            lpfnHook        : LPFRHOOKPROC;                 -- commdlg.h:211
            lpTemplateName  : Win32.LPCSTR;                 -- commdlg.h:212
        end record;

    subtype FINDREPLACE is FINDREPLACEA;                    -- commdlg.h:233

    type FINDREPLACEW is                                    -- commdlg.h:215
        record
            lStructSize     : Win32.DWORD;                  -- commdlg.h:216
            hwndOwner       : Win32.Windef.HWND;            -- commdlg.h:217
            hInstance       : Win32.Windef.HINSTANCE;       -- commdlg.h:218
            Flags           : Win32.DWORD;                  -- commdlg.h:220
            lpstrFindWhat   : Win32.LPWSTR;                 -- commdlg.h:221
            lpstrReplaceWith: Win32.LPWSTR;                 -- commdlg.h:222
            wFindWhatLen    : Win32.WORD;                   -- commdlg.h:223
            wReplaceWithLen : Win32.WORD;                   -- commdlg.h:224
            lCustData       : Win32.LPARAM;                 -- commdlg.h:225
            lpfnHook        : LPFRHOOKPROC;                 -- commdlg.h:226
            lpTemplateName  : Win32.LPCWSTR;                -- commdlg.h:227
        end record;

    type LPCFHOOKPROC is access function (
                hWnd  : Win32.Windef.HWND;
                nCode : Win32.UINT;
                wParam: Win32.WPARAM;
                lParam: Win32.LPARAM)
               return Win32.UINT;                           -- commdlg.h:276
    pragma Convention(Stdcall, LPCFHOOKPROC);

    type CHOOSEFONTA is                                     -- commdlg.h:278
        record
            lStructSize      : Win32.DWORD;                 -- commdlg.h:279
            hwndOwner        : Win32.Windef.HWND;           -- commdlg.h:280
            hDC              : Win32.Windef.HDC;            -- commdlg.h:281
            lpLogFont        : Win32.Wingdi.LPLOGFONTA;     -- commdlg.h:282
            iPointSize       : Win32.INT;                   -- commdlg.h:283
            Flags            : Win32.DWORD;                 -- commdlg.h:284
            rgbColors        : Win32.Windef.COLORREF;       -- commdlg.h:285
            lCustData        : Win32.LPARAM;                -- commdlg.h:286
            lpfnHook         : LPCFHOOKPROC;                -- commdlg.h:287
            lpTemplateName   : Win32.LPCSTR;                -- commdlg.h:288
            hInstance        : Win32.Windef.HINSTANCE;      -- commdlg.h:289
            lpszStyle        : Win32.LPSTR;                 -- commdlg.h:291
            nFontType        : Win32.WORD;                  -- commdlg.h:293
            MISSING_ALIGNMENT: Win32.WORD;                  -- commdlg.h:296
            nSizeMin         : Win32.INT;                   -- commdlg.h:297
            nSizeMax         : Win32.INT;                   -- commdlg.h:298
        end record;

    subtype CHOOSEFONT is CHOOSEFONTA;                      -- commdlg.h:329

    type CHOOSEFONTW is                                     -- commdlg.h:302
        record
            lStructSize      : Win32.DWORD;                 -- commdlg.h:303
            hwndOwner        : Win32.Windef.HWND;           -- commdlg.h:304
            hDC              : Win32.Windef.HDC;            -- commdlg.h:305
            lpLogFont        : Win32.Wingdi.LPLOGFONTW;     -- commdlg.h:306
            iPointSize       : Win32.INT;                   -- commdlg.h:307
            Flags            : Win32.DWORD;                 -- commdlg.h:308
            rgbColors        : Win32.Windef.COLORREF;       -- commdlg.h:309
            lCustData        : Win32.LPARAM;                -- commdlg.h:310
            lpfnHook         : LPCFHOOKPROC;                -- commdlg.h:311
            lpTemplateName   : Win32.LPCWSTR;               -- commdlg.h:312
            hInstance        : Win32.Windef.HINSTANCE;      -- commdlg.h:313
            lpszStyle        : Win32.LPWSTR;                -- commdlg.h:315
            nFontType        : Win32.WORD;                  -- commdlg.h:317
            MISSING_ALIGNMENT: Win32.WORD;                  -- commdlg.h:320
            nSizeMin         : Win32.INT;                   -- commdlg.h:321
            nSizeMax         : Win32.INT;                   -- commdlg.h:322
        end record;

    type LPPRINTHOOKPROC is access function (
                hWnd  : Win32.Windef.HWND;
                nCode : Win32.UINT;
                wParam: Win32.WPARAM;
                lParam: Win32.LPARAM)
               return Win32.UINT;                           -- commdlg.h:425
    pragma Convention(Stdcall, LPPRINTHOOKPROC);
    type LPSETUPHOOKPROC is access function (
                hWnd  : Win32.Windef.HWND;
                nCode : Win32.UINT;
                wParam: Win32.WPARAM;
                lParam: Win32.LPARAM)
               return Win32.UINT;                           -- commdlg.h:426
    pragma Convention(Stdcall, LPSETUPHOOKPROC);

    type PRINTDLGA is                                       -- commdlg.h:428
        record
            lStructSize        : Win32.DWORD;               -- commdlg.h:429
            hwndOwner          : Win32.Windef.HWND;         -- commdlg.h:430
            hDevMode           : Win32.Windef.HGLOBAL;      -- commdlg.h:431
            hDevNames          : Win32.Windef.HGLOBAL;      -- commdlg.h:432
            hDC                : Win32.Windef.HDC;          -- commdlg.h:433
            Flags              : Win32.DWORD;               -- commdlg.h:434
            nFromPage          : Win32.WORD;                -- commdlg.h:435
            nToPage            : Win32.WORD;                -- commdlg.h:436
            nMinPage           : Win32.WORD;                -- commdlg.h:437
            nMaxPage           : Win32.WORD;                -- commdlg.h:438
            nCopies            : Win32.WORD;                -- commdlg.h:439
            hInstance          : Win32.Windef.HINSTANCE;    -- commdlg.h:440
            lCustData          : Win32.LPARAM;              -- commdlg.h:441
            lpfnPrintHook      : LPPRINTHOOKPROC;           -- commdlg.h:442
            lpfnSetupHook      : LPSETUPHOOKPROC;           -- commdlg.h:443
            lpPrintTemplateName: Win32.LPCSTR;              -- commdlg.h:444
            lpSetupTemplateName: Win32.LPCSTR;              -- commdlg.h:445
            hPrintTemplate     : Win32.Windef.HGLOBAL;      -- commdlg.h:446
            hSetupTemplate     : Win32.Windef.HGLOBAL;      -- commdlg.h:447
        end record;

    subtype PRINTDLG is PRINTDLGA;                          -- commdlg.h:475

    type PRINTDLGW is                                       -- commdlg.h:450
        record
            lStructSize        : Win32.DWORD;               -- commdlg.h:451
            hwndOwner          : Win32.Windef.HWND;         -- commdlg.h:452
            hDevMode           : Win32.Windef.HGLOBAL;      -- commdlg.h:453
            hDevNames          : Win32.Windef.HGLOBAL;      -- commdlg.h:454
            hDC                : Win32.Windef.HDC;          -- commdlg.h:455
            Flags              : Win32.DWORD;               -- commdlg.h:456
            nFromPage          : Win32.WORD;                -- commdlg.h:457
            nToPage            : Win32.WORD;                -- commdlg.h:458
            nMinPage           : Win32.WORD;                -- commdlg.h:459
            nMaxPage           : Win32.WORD;                -- commdlg.h:460
            nCopies            : Win32.WORD;                -- commdlg.h:461
            hInstance          : Win32.Windef.HINSTANCE;    -- commdlg.h:462
            lCustData          : Win32.LPARAM;              -- commdlg.h:463
            lpfnPrintHook      : LPPRINTHOOKPROC;           -- commdlg.h:464
            lpfnSetupHook      : LPSETUPHOOKPROC;           -- commdlg.h:465
            lpPrintTemplateName: Win32.LPCWSTR;             -- commdlg.h:466
            lpSetupTemplateName: Win32.LPCWSTR;             -- commdlg.h:467
            hPrintTemplate     : Win32.Windef.HGLOBAL;      -- commdlg.h:468
            hSetupTemplate     : Win32.Windef.HGLOBAL;      -- commdlg.h:469
        end record;

    type DEVNAMES is                                        -- commdlg.h:515
        record
            wDriverOffset: Win32.WORD;                      -- commdlg.h:516
            wDeviceOffset: Win32.WORD;                      -- commdlg.h:517
            wOutputOffset: Win32.WORD;                      -- commdlg.h:518
            wDefault     : Win32.WORD;                      -- commdlg.h:519
        end record;

    function GetOpenFileNameA(
                lpofn: LPOPENFILENAMEA)
               return Win32.BOOL;                           -- commdlg.h:85

    function GetOpenFileName(
                lpofn: LPOPENFILENAMEA)
               return Win32.BOOL
               renames GetOpenFileNameA;                    -- commdlg.h:85

    function GetOpenFileNameW(
                lpofn: LPOPENFILENAMEW)
               return Win32.BOOL;                           -- commdlg.h:86

    function GetSaveFileNameA(
                lpofn: LPOPENFILENAMEA)
               return Win32.BOOL;                           -- commdlg.h:94

    function GetSaveFileName(
                lpofn: LPOPENFILENAMEA)
               return Win32.BOOL
               renames GetSaveFileNameA;                    -- commdlg.h:94

    function GetSaveFileNameW(
                lpofn: LPOPENFILENAMEW)
               return Win32.BOOL;                           -- commdlg.h:95

    function GetFileTitleA(
                lpszFile : Win32.LPCSTR;
                lpszTitle: Win32.LPSTR;
                cbBuf    : Win32.WORD)
               return Win32.SHORT;                          -- commdlg.h:102

    function GetFileTitle(
                lpszFile : Win32.LPCSTR;
                lpszTitle: Win32.LPSTR;
                cbBuf    : Win32.WORD)
               return Win32.SHORT
               renames GetFileTitleA;                       -- commdlg.h:102

    function GetFileTitleW(
                lpszFile : Win32.LPCWSTR;
                lpszTitle: Win32.LPWSTR;
                cbBuf    : Win32.WORD)
               return Win32.SHORT;                          -- commdlg.h:103

    function ChooseColorA_func(
                lpcc: LPCHOOSECOLORA)
               return Win32.BOOL;                           -- commdlg.h:181

    function ChooseColor_func(
                lpcc: LPCHOOSECOLORA)
               return Win32.BOOL
               renames ChooseColorA_func;                   -- commdlg.h:181

    function ChooseColorW_func(
                lpcc: LPCHOOSECOLORW)
               return Win32.BOOL;                           -- commdlg.h:182

    function FindTextA(
                lpfr: LPFINDREPLACEA)
               return Win32.Windef.HWND;                    -- commdlg.h:258

    function FindText(
                lpfr: LPFINDREPLACEA)
               return Win32.Windef.HWND
               renames FindTextA;                           -- commdlg.h:258

    function FindTextW(
                lpfr: LPFINDREPLACEW)
               return Win32.Windef.HWND;                    -- commdlg.h:259

    function ReplaceTextA(
                lpfr: LPFINDREPLACEA)
               return Win32.Windef.HWND;                    -- commdlg.h:267

    function ReplaceText(
                lpfr: LPFINDREPLACEA)
               return Win32.Windef.HWND
               renames ReplaceTextA;                        -- commdlg.h:267

    function ReplaceTextW(
                lpfr: LPFINDREPLACEW)
               return Win32.Windef.HWND;                    -- commdlg.h:268

    function ChooseFontA_func(
                lpcf: LPCHOOSEFONTA)
               return Win32.BOOL;                           -- commdlg.h:336

    function ChooseFont_func(
                lpcf: LPCHOOSEFONTA)
               return Win32.BOOL
               renames ChooseFontA_func;                    -- commdlg.h:336

    function ChooseFontW_func(
                lpcf: LPCHOOSEFONTW)
               return Win32.BOOL;                           -- commdlg.h:337

    function PrintDlgA_func(
                lppd: LPPRINTDLGA)
               return Win32.BOOL;                           -- commdlg.h:482

    function PrintDlg_func(
                lppd: LPPRINTDLGA)
               return Win32.BOOL
               renames PrintDlgA_func;                      -- commdlg.h:482

    function PrintDlgW_func(
                lppd: LPPRINTDLGW)
               return Win32.BOOL;                           -- commdlg.h:483

    function CommDlgExtendedError return Win32.DWORD;       -- commdlg.h:526

private

    pragma Convention(C, OPENFILENAMEA);                    -- commdlg.h:29
    pragma Convention(C, OPENFILENAMEW);                    -- commdlg.h:52
    pragma Convention(C, CHOOSECOLORA);                     -- commdlg.h:147
    pragma Convention(C, CHOOSECOLORW);                     -- commdlg.h:159
    pragma Convention(C, FINDREPLACEA);                     -- commdlg.h:200
    pragma Convention(C, FINDREPLACEW);                     -- commdlg.h:215
    pragma Convention(C, CHOOSEFONTA);                      -- commdlg.h:278
    pragma Convention(C, CHOOSEFONTW);                      -- commdlg.h:302
    pragma Convention(C, PRINTDLGA);                        -- commdlg.h:428
    pragma Convention(C, PRINTDLGW);                        -- commdlg.h:450
    pragma Convention(C_Pass_By_Copy, DEVNAMES);                         -- commdlg.h:515

    pragma Import(Stdcall, GetOpenFileNameA, "GetOpenFileNameA"); -- commdlg.h:85
    pragma Import(Stdcall, GetOpenFileNameW, "GetOpenFileNameW"); -- commdlg.h:86
    pragma Import(Stdcall, GetSaveFileNameA, "GetSaveFileNameA"); -- commdlg.h:94
    pragma Import(Stdcall, GetSaveFileNameW, "GetSaveFileNameW"); -- commdlg.h:95
    pragma Import(Stdcall, GetFileTitleA, "GetFileTitleA");       -- commdlg.h:102
    pragma Import(Stdcall, GetFileTitleW, "GetFileTitleW");       -- commdlg.h:103
    pragma Import(Stdcall, ChooseColorA_func, "ChooseColorA");    -- commdlg.h:181
    pragma Import(Stdcall, ChooseColorW_func, "ChooseColorW");    -- commdlg.h:182
    pragma Import(Stdcall, FindTextA, "FindTextA");               -- commdlg.h:258
    pragma Import(Stdcall, FindTextW, "FindTextW");               -- commdlg.h:259
    pragma Import(Stdcall, ReplaceTextA, "ReplaceTextA");         -- commdlg.h:267
    pragma Import(Stdcall, ReplaceTextW, "ReplaceTextW");         -- commdlg.h:268
    pragma Import(Stdcall, ChooseFontA_func, "ChooseFontA");      -- commdlg.h:336
    pragma Import(Stdcall, ChooseFontW_func, "ChooseFontW");      -- commdlg.h:337
    pragma Import(Stdcall, PrintDlgA_func, "PrintDlgA");          -- commdlg.h:482
    pragma Import(Stdcall, PrintDlgW_func, "PrintDlgW");          -- commdlg.h:483
    pragma Import(Stdcall, CommDlgExtendedError, "CommDlgExtendedError");
                                                            -- commdlg.h:526

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

end Win32.Commdlg;
