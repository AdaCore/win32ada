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
--  Copyright (C) 2000-2011, AdaCore
--
-------------------------------------------------------------------------------

with Win32.Windef;
with Win32.Wingdi;

package Win32.Commdlg is

   use Interfaces;
   use type Interfaces.C.char_array;

   OFN_READONLY                 : constant := 16#1#;
   OFN_OVERWRITEPROMPT          : constant := 16#2#;
   OFN_HIDEREADONLY             : constant := 16#4#;
   OFN_NOCHANGEDIR              : constant := 16#8#;
   OFN_SHOWHELP                 : constant := 16#10#;
   OFN_ENABLEHOOK               : constant := 16#20#;
   OFN_ENABLETEMPLATE           : constant := 16#40#;
   OFN_ENABLETEMPLATEHANDLE     : constant := 16#80#;
   OFN_NOVALIDATE               : constant := 16#100#;
   OFN_ALLOWMULTISELECT         : constant := 16#200#;
   OFN_EXTENSIONDIFFERENT       : constant := 16#400#;
   OFN_PATHMUSTEXIST            : constant := 16#800#;
   OFN_FILEMUSTEXIST            : constant := 16#1000#;
   OFN_CREATEPROMPT             : constant := 16#2000#;
   OFN_SHAREAWARE               : constant := 16#4000#;
   OFN_NOREADONLYRETURN         : constant := 16#8000#;
   OFN_NOTESTFILECREATE         : constant := 16#10000#;
   OFN_NONETWORKBUTTON          : constant := 16#20000#;
   OFN_NOLONGNAMES              : constant := 16#40000#;
   OFN_SHAREFALLTHROUGH         : constant := 2;
   OFN_SHARENOWARN              : constant := 1;
   OFN_SHAREWARN                : constant := 0;
   CC_RGBINIT                   : constant := 16#1#;
   CC_FULLOPEN                  : constant := 16#2#;
   CC_PREVENTFULLOPEN           : constant := 16#4#;
   CC_SHOWHELP                  : constant := 16#8#;
   CC_ENABLEHOOK                : constant := 16#10#;
   CC_ENABLETEMPLATE            : constant := 16#20#;
   CC_ENABLETEMPLATEHANDLE      : constant := 16#40#;
   FR_DOWN                      : constant := 16#1#;
   FR_WHOLEWORD                 : constant := 16#2#;
   FR_MATCHCASE                 : constant := 16#4#;
   FR_FINDNEXT                  : constant := 16#8#;
   FR_REPLACE                   : constant := 16#10#;
   FR_REPLACEALL                : constant := 16#20#;
   FR_DIALOGTERM                : constant := 16#40#;
   FR_SHOWHELP                  : constant := 16#80#;
   FR_ENABLEHOOK                : constant := 16#100#;
   FR_ENABLETEMPLATE            : constant := 16#200#;
   FR_NOUPDOWN                  : constant := 16#400#;
   FR_NOMATCHCASE               : constant := 16#800#;
   FR_NOWHOLEWORD               : constant := 16#1000#;
   FR_ENABLETEMPLATEHANDLE      : constant := 16#2000#;
   FR_HIDEUPDOWN                : constant := 16#4000#;
   FR_HIDEMATCHCASE             : constant := 16#8000#;
   FR_HIDEWHOLEWORD             : constant := 16#10000#;
   CF_SCREENFONTS               : constant := 16#1#;
   CF_PRINTERFONTS              : constant := 16#2#;
   CF_BOTH                      : constant := 16#3#;
   CF_SHOWHELP                  : constant := 16#4#;
   CF_ENABLEHOOK                : constant := 16#8#;
   CF_ENABLETEMPLATE            : constant := 16#10#;
   CF_ENABLETEMPLATEHANDLE      : constant := 16#20#;
   CF_INITTOLOGFONTSTRUCT       : constant := 16#40#;
   CF_USESTYLE                  : constant := 16#80#;
   CF_EFFECTS                   : constant := 16#100#;
   CF_APPLY                     : constant := 16#200#;
   CF_ANSIONLY                  : constant := 16#400#;
   CF_NOVECTORFONTS             : constant := 16#800#;
   CF_NOOEMFONTS                : constant := 16#800#;
   CF_NOSIMULATIONS             : constant := 16#1000#;
   CF_LIMITSIZE                 : constant := 16#2000#;
   CF_FIXEDPITCHONLY            : constant := 16#4000#;
   CF_WYSIWYG                   : constant := 16#8000#;
   CF_FORCEFONTEXIST            : constant := 16#10000#;
   CF_SCALABLEONLY              : constant := 16#20000#;
   CF_TTONLY                    : constant := 16#40000#;
   CF_NOFACESEL                 : constant := 16#80000#;
   CF_NOSTYLESEL                : constant := 16#100000#;
   CF_NOSIZESEL                 : constant := 16#200000#;
   SIMULATED_FONTTYPE           : constant := 16#8000#;
   PRINTER_FONTTYPE             : constant := 16#4000#;
   SCREEN_FONTTYPE              : constant := 16#2000#;
   BOLD_FONTTYPE                : constant := 16#100#;
   ITALIC_FONTTYPE              : constant := 16#200#;
   REGULAR_FONTTYPE             : constant := 16#400#;
   WM_CHOOSEFONT_GETLOGFONT     : constant := 16#401#;
   LBSELCHSTRINGA               : constant CHAR_Array  :=
      "commdlg_LBSelChangedNotify" & Nul;
   SHAREVISTRINGA               : constant CHAR_Array  :=
      "commdlg_ShareViolation" & Nul;
   FILEOKSTRINGA                : constant CHAR_Array  :=
      "commdlg_FileNameOK" & Nul;
   COLOROKSTRINGA               : constant CHAR_Array  :=
      "commdlg_ColorOK" & Nul;
   SETRGBSTRINGA                : constant CHAR_Array  :=
      "commdlg_SetRGBColor" & Nul;
   HELPMSGSTRINGA               : constant CHAR_Array  :=
      "commdlg_help" & Nul;
   FINDMSGSTRINGA               : constant CHAR_Array  :=
      "commdlg_FindReplace" & Nul;
   LBSELCHSTRINGW               : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_LBSelChangedNotify")) & Wide_Nul;
   SHAREVISTRINGW               : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_ShareViolation")) & Wide_Nul;
   FILEOKSTRINGW                : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_FileNameOK")) & Wide_Nul;
   COLOROKSTRINGW               : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_ColorOK")) & Wide_Nul;
   SETRGBSTRINGW                : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_SetRGBColor")) & Wide_Nul;
   HELPMSGSTRINGW               : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_help")) & Wide_Nul;
   FINDMSGSTRINGW               : constant WCHAR_Array :=
      To_Win (C.To_C ("commdlg_FindReplace")) & Wide_Nul;
   LBSELCHSTRING                : constant CHAR_Array  :=
      "commdlg_LBSelChangedNotify" & Nul;
   SHAREVISTRING                : constant CHAR_Array  :=
      "commdlg_ShareViolation" & Nul;
   FILEOKSTRING                 : constant CHAR_Array  :=
      "commdlg_FileNameOK" & Nul;
   COLOROKSTRING                : constant CHAR_Array  :=
      "commdlg_ColorOK" & Nul;
   SETRGBSTRING                 : constant CHAR_Array  :=
      "commdlg_SetRGBColor" & Nul;
   HELPMSGSTRING                : constant CHAR_Array  :=
      "commdlg_help" & Nul;
   FINDMSGSTRING                : constant CHAR_Array  :=
      "commdlg_FindReplace" & Nul;
   CD_LBSELNOITEMS              : constant := -1;
   CD_LBSELCHANGE               : constant := 0;
   CD_LBSELSUB                  : constant := 1;
   CD_LBSELADD                  : constant := 2;
   PD_ALLPAGES                  : constant := 16#0#;
   PD_SELECTION                 : constant := 16#1#;
   PD_PAGENUMS                  : constant := 16#2#;
   PD_NOSELECTION               : constant := 16#4#;
   PD_NOPAGENUMS                : constant := 16#8#;
   PD_COLLATE                   : constant := 16#10#;
   PD_PRINTTOFILE               : constant := 16#20#;
   PD_PRINTSETUP                : constant := 16#40#;
   PD_NOWARNING                 : constant := 16#80#;
   PD_RETURNDC                  : constant := 16#100#;
   PD_RETURNIC                  : constant := 16#200#;
   PD_RETURNDEFAULT             : constant := 16#400#;
   PD_SHOWHELP                  : constant := 16#800#;
   PD_ENABLEPRINTHOOK           : constant := 16#1000#;
   PD_ENABLESETUPHOOK           : constant := 16#2000#;
   PD_ENABLEPRINTTEMPLATE       : constant := 16#4000#;
   PD_ENABLESETUPTEMPLATE       : constant := 16#8000#;
   PD_ENABLEPRINTTEMPLATEHANDLE : constant := 16#10000#;
   PD_ENABLESETUPTEMPLATEHANDLE : constant := 16#20000#;
   PD_USEDEVMODECOPIES          : constant := 16#40000#;
   PD_DISABLEPRINTTOFILE        : constant := 16#80000#;
   PD_HIDEPRINTTOFILE           : constant := 16#100000#;
   PD_NONETWORKBUTTON           : constant := 16#200000#;
   DN_DEFAULTPRN                : constant := 16#1#;

   type OPENFILENAMEA;
   type OPENFILENAMEW;
   type CHOOSECOLORA;
   type CHOOSECOLORW;
   type FINDREPLACEA;
   type FINDREPLACEW;
   type CHOOSEFONTA;
   type CHOOSEFONTW;
   type PRINTDLGA;
   type PRINTDLGW;
   type DEVNAMES;

   type LPOPENFILENAMEA is access all OPENFILENAMEA;
   type LPOPENFILENAMEW is access all OPENFILENAMEW;
   subtype LPOPENFILENAME is LPOPENFILENAMEA;
   type LPCHOOSECOLORA is access all CHOOSECOLORA;
   type LPCHOOSECOLORW is access all CHOOSECOLORW;
   subtype LPCHOOSECOLOR is LPCHOOSECOLORA;
   type LPFINDREPLACEA is access all FINDREPLACEA;
   type LPFINDREPLACEW is access all FINDREPLACEW;
   subtype LPFINDREPLACE is LPFINDREPLACEA;
   type LPCHOOSEFONTA is access all CHOOSEFONTA;
   type LPCHOOSEFONTW is access all CHOOSEFONTW;
   subtype LPCHOOSEFONT is LPCHOOSEFONTA;
   type LPPRINTDLGA is access all PRINTDLGA;
   type LPPRINTDLGW is access all PRINTDLGW;
   subtype LPPRINTDLG is LPPRINTDLGA;
   type LPDEVNAMES is access all DEVNAMES;

   type LPOFNHOOKPROC is access function
     (hWnd   : Win32.Windef.HWND;
      nCode  : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, LPOFNHOOKPROC);

   type OPENFILENAMEA is record
      lStructSize       : Win32.DWORD;
      hwndOwner         : Win32.Windef.HWND;
      hInstance         : Win32.Windef.HINSTANCE;
      lpstrFilter       : Win32.LPCSTR;
      lpstrCustomFilter : Win32.LPSTR;
      nMaxCustFilter    : Win32.DWORD;
      nFilterIndex      : Win32.DWORD;
      lpstrFile         : Win32.LPSTR;
      nMaxFile          : Win32.DWORD;
      lpstrFileTitle    : Win32.LPSTR;
      nMaxFileTitle     : Win32.DWORD;
      lpstrInitialDir   : Win32.LPCSTR;
      lpstrTitle        : Win32.LPCSTR;
      Flags             : Win32.DWORD;
      nFileOffset       : Win32.WORD;
      nFileExtension    : Win32.WORD;
      lpstrDefExt       : Win32.LPCSTR;
      lCustData         : Win32.LPARAM;
      lpfnHook          : LPOFNHOOKPROC;
      lpTemplateName    : Win32.LPCSTR;
   end record;

   subtype OPENFILENAME is OPENFILENAMEA;

   type OPENFILENAMEW is record
      lStructSize       : Win32.DWORD;
      hwndOwner         : Win32.Windef.HWND;
      hInstance         : Win32.Windef.HINSTANCE;
      lpstrFilter       : Win32.LPCWSTR;
      lpstrCustomFilter : Win32.LPWSTR;
      nMaxCustFilter    : Win32.DWORD;
      nFilterIndex      : Win32.DWORD;
      lpstrFile         : Win32.LPWSTR;
      nMaxFile          : Win32.DWORD;
      lpstrFileTitle    : Win32.LPWSTR;
      nMaxFileTitle     : Win32.DWORD;
      lpstrInitialDir   : Win32.LPCWSTR;
      lpstrTitle        : Win32.LPCWSTR;
      Flags             : Win32.DWORD;
      nFileOffset       : Win32.WORD;
      nFileExtension    : Win32.WORD;
      lpstrDefExt       : Win32.LPCWSTR;
      lCustData         : Win32.LPARAM;
      lpfnHook          : LPOFNHOOKPROC;
      lpTemplateName    : Win32.LPCWSTR;
   end record;

   type LPCCHOOKPROC is access function
     (hWnd   : Win32.Windef.HWND;
      nCode  : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, LPCCHOOKPROC);

   type CHOOSECOLORA is record
      lStructSize    : Win32.DWORD;
      hwndOwner      : Win32.Windef.HWND;
      hInstance      : Win32.Windef.HWND;
      rgbResult      : Win32.Windef.COLORREF;
      lpCustColors   : Win32.Windef.LPCOLORREF;
      Flags          : Win32.DWORD;
      lCustData      : Win32.LPARAM;
      lpfnHook       : LPCCHOOKPROC;
      lpTemplateName : Win32.LPCSTR;
   end record;

   subtype CHOOSECOLOR is CHOOSECOLORA;

   type CHOOSECOLORW is record
      lStructSize    : Win32.DWORD;
      hwndOwner      : Win32.Windef.HWND;
      hInstance      : Win32.Windef.HWND;
      rgbResult      : Win32.Windef.COLORREF;
      lpCustColors   : Win32.Windef.LPCOLORREF;
      Flags          : Win32.DWORD;
      lCustData      : Win32.LPARAM;
      lpfnHook       : LPCCHOOKPROC;
      lpTemplateName : Win32.LPCWSTR;
   end record;

   type LPFRHOOKPROC is access function
     (hWnd   : Win32.Windef.HWND;
      nCode  : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, LPFRHOOKPROC);

   type FINDREPLACEA is record
      lStructSize      : Win32.DWORD;
      hwndOwner        : Win32.Windef.HWND;
      hInstance        : Win32.Windef.HINSTANCE;
      Flags            : Win32.DWORD;
      lpstrFindWhat    : Win32.LPSTR;
      lpstrReplaceWith : Win32.LPSTR;
      wFindWhatLen     : Win32.WORD;
      wReplaceWithLen  : Win32.WORD;
      lCustData        : Win32.LPARAM;
      lpfnHook         : LPFRHOOKPROC;
      lpTemplateName   : Win32.LPCSTR;
   end record;

   subtype FINDREPLACE is FINDREPLACEA;

   type FINDREPLACEW is record
      lStructSize      : Win32.DWORD;
      hwndOwner        : Win32.Windef.HWND;
      hInstance        : Win32.Windef.HINSTANCE;
      Flags            : Win32.DWORD;
      lpstrFindWhat    : Win32.LPWSTR;
      lpstrReplaceWith : Win32.LPWSTR;
      wFindWhatLen     : Win32.WORD;
      wReplaceWithLen  : Win32.WORD;
      lCustData        : Win32.LPARAM;
      lpfnHook         : LPFRHOOKPROC;
      lpTemplateName   : Win32.LPCWSTR;
   end record;

   type LPCFHOOKPROC is access function
     (hWnd   : Win32.Windef.HWND;
      nCode  : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, LPCFHOOKPROC);

   type CHOOSEFONTA is record
      lStructSize       : Win32.DWORD;
      hwndOwner         : Win32.Windef.HWND;
      hDC               : Win32.Windef.HDC;
      lpLogFont         : Win32.Wingdi.LPLOGFONTA;
      iPointSize        : Win32.INT;
      Flags             : Win32.DWORD;
      rgbColors         : Win32.Windef.COLORREF;
      lCustData         : Win32.LPARAM;
      lpfnHook          : LPCFHOOKPROC;
      lpTemplateName    : Win32.LPCSTR;
      hInstance         : Win32.Windef.HINSTANCE;
      lpszStyle         : Win32.LPSTR;
      nFontType         : Win32.WORD;
      MISSING_ALIGNMENT : Win32.WORD;
      nSizeMin          : Win32.INT;
      nSizeMax          : Win32.INT;
   end record;

   subtype CHOOSEFONT is CHOOSEFONTA;

   type CHOOSEFONTW is record
      lStructSize       : Win32.DWORD;
      hwndOwner         : Win32.Windef.HWND;
      hDC               : Win32.Windef.HDC;
      lpLogFont         : Win32.Wingdi.LPLOGFONTW;
      iPointSize        : Win32.INT;
      Flags             : Win32.DWORD;
      rgbColors         : Win32.Windef.COLORREF;
      lCustData         : Win32.LPARAM;
      lpfnHook          : LPCFHOOKPROC;
      lpTemplateName    : Win32.LPCWSTR;
      hInstance         : Win32.Windef.HINSTANCE;
      lpszStyle         : Win32.LPWSTR;
      nFontType         : Win32.WORD;
      MISSING_ALIGNMENT : Win32.WORD;
      nSizeMin          : Win32.INT;
      nSizeMax          : Win32.INT;
   end record;

   type LPPRINTHOOKPROC is access function
     (hWnd   : Win32.Windef.HWND;
      nCode  : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, LPPRINTHOOKPROC);
   type LPSETUPHOOKPROC is access function
     (hWnd   : Win32.Windef.HWND;
      nCode  : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.UINT;
   pragma Convention (Stdcall, LPSETUPHOOKPROC);

   type PRINTDLGA is record
      lStructSize         : Win32.DWORD;
      hwndOwner           : Win32.Windef.HWND;
      hDevMode            : Win32.Windef.HGLOBAL;
      hDevNames           : Win32.Windef.HGLOBAL;
      hDC                 : Win32.Windef.HDC;
      Flags               : Win32.DWORD;
      nFromPage           : Win32.WORD;
      nToPage             : Win32.WORD;
      nMinPage            : Win32.WORD;
      nMaxPage            : Win32.WORD;
      nCopies             : Win32.WORD;
      hInstance           : Win32.Windef.HINSTANCE;
      lCustData           : Win32.LPARAM;
      lpfnPrintHook       : LPPRINTHOOKPROC;
      lpfnSetupHook       : LPSETUPHOOKPROC;
      lpPrintTemplateName : Win32.LPCSTR;
      lpSetupTemplateName : Win32.LPCSTR;
      hPrintTemplate      : Win32.Windef.HGLOBAL;
      hSetupTemplate      : Win32.Windef.HGLOBAL;
   end record;

   subtype PRINTDLG is PRINTDLGA;

   type PRINTDLGW is record
      lStructSize         : Win32.DWORD;
      hwndOwner           : Win32.Windef.HWND;
      hDevMode            : Win32.Windef.HGLOBAL;
      hDevNames           : Win32.Windef.HGLOBAL;
      hDC                 : Win32.Windef.HDC;
      Flags               : Win32.DWORD;
      nFromPage           : Win32.WORD;
      nToPage             : Win32.WORD;
      nMinPage            : Win32.WORD;
      nMaxPage            : Win32.WORD;
      nCopies             : Win32.WORD;
      hInstance           : Win32.Windef.HINSTANCE;
      lCustData           : Win32.LPARAM;
      lpfnPrintHook       : LPPRINTHOOKPROC;
      lpfnSetupHook       : LPSETUPHOOKPROC;
      lpPrintTemplateName : Win32.LPCWSTR;
      lpSetupTemplateName : Win32.LPCWSTR;
      hPrintTemplate      : Win32.Windef.HGLOBAL;
      hSetupTemplate      : Win32.Windef.HGLOBAL;
   end record;

   type DEVNAMES is record
      wDriverOffset : Win32.WORD;
      wDeviceOffset : Win32.WORD;
      wOutputOffset : Win32.WORD;
      wDefault      : Win32.WORD;
   end record;

   function GetOpenFileNameA (lpofn : LPOPENFILENAMEA) return Win32.BOOL;

   function GetOpenFileName (lpofn : LPOPENFILENAMEA) return Win32.BOOL renames
     GetOpenFileNameA;

   function GetOpenFileNameW (lpofn : LPOPENFILENAMEW) return Win32.BOOL;

   function GetSaveFileNameA (lpofn : LPOPENFILENAMEA) return Win32.BOOL;

   function GetSaveFileName (lpofn : LPOPENFILENAMEA) return Win32.BOOL renames
     GetSaveFileNameA;

   function GetSaveFileNameW (lpofn : LPOPENFILENAMEW) return Win32.BOOL;

   function GetFileTitleA
     (lpszFile  : Win32.LPCSTR;
      lpszTitle : Win32.LPSTR;
      cbBuf     : Win32.WORD)
      return Win32.SHORT;

   function GetFileTitle
     (lpszFile  : Win32.LPCSTR;
      lpszTitle : Win32.LPSTR;
      cbBuf     : Win32.WORD)
      return Win32.SHORT renames GetFileTitleA;

   function GetFileTitleW
     (lpszFile  : Win32.LPCWSTR;
      lpszTitle : Win32.LPWSTR;
      cbBuf     : Win32.WORD)
      return Win32.SHORT;

   function ChooseColorA_func (lpcc : LPCHOOSECOLORA) return Win32.BOOL;

   function ChooseColor_func (lpcc : LPCHOOSECOLORA) return Win32.BOOL renames
     ChooseColorA_func;

   function ChooseColorW_func (lpcc : LPCHOOSECOLORW) return Win32.BOOL;

   function FindTextA (lpfr : LPFINDREPLACEA) return Win32.Windef.HWND;

   function FindText (lpfr : LPFINDREPLACEA) return Win32.Windef.HWND renames
     FindTextA;

   function FindTextW (lpfr : LPFINDREPLACEW) return Win32.Windef.HWND;

   function ReplaceTextA (lpfr : LPFINDREPLACEA) return Win32.Windef.HWND;

   function ReplaceText (lpfr : LPFINDREPLACEA) return Win32.Windef.HWND
      renames ReplaceTextA;

   function ReplaceTextW (lpfr : LPFINDREPLACEW) return Win32.Windef.HWND;

   function ChooseFontA_func (lpcf : LPCHOOSEFONTA) return Win32.BOOL;

   function ChooseFont_func (lpcf : LPCHOOSEFONTA) return Win32.BOOL renames
     ChooseFontA_func;

   function ChooseFontW_func (lpcf : LPCHOOSEFONTW) return Win32.BOOL;

   function PrintDlgA_func (lppd : LPPRINTDLGA) return Win32.BOOL;

   function PrintDlg_func (lppd : LPPRINTDLGA) return Win32.BOOL renames
     PrintDlgA_func;

   function PrintDlgW_func (lppd : LPPRINTDLGW) return Win32.BOOL;

   function CommDlgExtendedError return Win32.DWORD;

private

   pragma Convention (C, OPENFILENAMEA);
   pragma Convention (C, OPENFILENAMEW);
   pragma Convention (C, CHOOSECOLORA);
   pragma Convention (C, CHOOSECOLORW);
   pragma Convention (C, FINDREPLACEA);
   pragma Convention (C, FINDREPLACEW);
   pragma Convention (C, CHOOSEFONTA);
   pragma Convention (C, CHOOSEFONTW);
   pragma Convention (C, PRINTDLGA);
   pragma Convention (C, PRINTDLGW);
   pragma Convention (C_Pass_By_Copy, DEVNAMES);

   pragma Import (Stdcall, GetOpenFileNameA, "GetOpenFileNameA");
   pragma Import (Stdcall, GetOpenFileNameW, "GetOpenFileNameW");
   pragma Import (Stdcall, GetSaveFileNameA, "GetSaveFileNameA");
   pragma Import (Stdcall, GetSaveFileNameW, "GetSaveFileNameW");
   pragma Import (Stdcall, GetFileTitleA, "GetFileTitleA");
   pragma Import (Stdcall, GetFileTitleW, "GetFileTitleW");
   pragma Import (Stdcall, ChooseColorA_func, "ChooseColorA");
   pragma Import (Stdcall, ChooseColorW_func, "ChooseColorW");
   pragma Import (Stdcall, FindTextA, "FindTextA");
   pragma Import (Stdcall, FindTextW, "FindTextW");
   pragma Import (Stdcall, ReplaceTextA, "ReplaceTextA");
   pragma Import (Stdcall, ReplaceTextW, "ReplaceTextW");
   pragma Import (Stdcall, ChooseFontA_func, "ChooseFontA");
   pragma Import (Stdcall, ChooseFontW_func, "ChooseFontW");
   pragma Import (Stdcall, PrintDlgA_func, "PrintDlgA");
   pragma Import (Stdcall, PrintDlgW_func, "PrintDlgW");
   pragma Import (Stdcall, CommDlgExtendedError, "CommDlgExtendedError");

end Win32.Commdlg;
