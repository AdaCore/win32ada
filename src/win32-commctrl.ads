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

package Win32.Commctrl is

   use Interfaces;
   use type Interfaces.C.char_array;

   TOOLBARCLASSNAMEW  : constant WCHAR_Array :=
      To_Win (C.To_C ("ToolbarWindow32")) & Wide_Nul;
   TOOLBARCLASSNAMEA  : constant CHAR_Array  := "ToolbarWindow32" & Nul;
   TOOLBARCLASSNAME   : CHAR_Array renames TOOLBARCLASSNAMEA;
   TBSTATE_CHECKED    : constant := 16#1#;
   TBSTATE_PRESSED    : constant := 16#2#;
   TBSTATE_ENABLED    : constant := 16#4#;
   TBSTATE_HIDDEN     : constant := 16#8#;
   TBSTYLE_BUTTON     : constant := 16#0#;
   TBSTYLE_SEP        : constant := 16#1#;
   TBSTYLE_CHECK      : constant := 16#2#;
   TBSTYLE_GROUP      : constant := 16#4#;
   TBSTYLE_CHECKGROUP : constant := 16#6#;
   TB_ENABLEBUTTON    : constant := 16#401#;
   TB_CHECKBUTTON     : constant := 16#402#;
   TB_PRESSBUTTON     : constant := 16#403#;
   TB_HIDEBUTTON      : constant := 16#404#;
   TB_ISBUTTONENABLED : constant := 16#409#;
   TB_ISBUTTONCHECKED : constant := 16#40a#;
   TB_ISBUTTONPRESSED : constant := 16#40b#;
   TB_ISBUTTONHIDDEN  : constant := 16#40c#;
   TB_SETSTATE        : constant := 16#411#;
   TB_GETSTATE        : constant := 16#412#;
   TB_ADDBITMAP       : constant := 16#413#;
   TB_ADDBUTTONS      : constant := 16#414#;
   TB_INSERTBUTTON    : constant := 16#415#;
   TB_DELETEBUTTON    : constant := 16#416#;
   TB_GETBUTTON       : constant := 16#417#;
   TB_BUTTONCOUNT     : constant := 16#418#;
   TB_COMMANDTOINDEX  : constant := 16#419#;
   TB_SAVERESTORE     : constant := 16#41a#;
   TB_CUSTOMIZE       : constant := 16#41b#;
   TB_SETBUTTON       : constant := 16#427#;
   TB_GETBUTTONRECT   : constant := 16#428#;
   STATUSCLASSNAMEW   : constant WCHAR_Array :=
      To_Win (C.To_C ("msctls_statusbar32")) & Wide_Nul;
   STATUSCLASSNAMEA   : constant CHAR_Array  := "msctls_statusbar32" & Nul;
   STATUSCLASSNAME    : CHAR_Array renames STATUSCLASSNAMEA;
   HEADERCLASSNAMEW   : constant WCHAR_Array :=
      To_Win (C.To_C ("msctls_headerbar")) & Wide_Nul;
   HEADERCLASSNAMEA   : constant CHAR_Array  := "msctls_headerbar" & Nul;
   HEADERCLASSNAME    : CHAR_Array renames HEADERCLASSNAMEA;
   SB_SETTEXTA        : constant := 16#401#;
   SB_GETTEXTA        : constant := 16#402#;
   SB_GETTEXTW        : constant := 16#40a#;
   SB_SETTEXTW        : constant := 16#40b#;
   SB_GETTEXT         : constant := 16#402#;
   SB_SETTEXT         : constant := 16#401#;
   SB_GETTEXTLENGTH   : constant := 16#403#;
   SB_SETPARTS        : constant := 16#404#;
   SB_SETBORDERS      : constant := 16#405#;
   SB_GETPARTS        : constant := 16#406#;
   SB_GETBORDERS      : constant := 16#407#;
   SB_SETMINHEIGHT    : constant := 16#408#;
   SB_SIMPLE          : constant := 16#409#;
   HB_SAVERESTORE     : constant := 16#500#;
   HB_ADJUST          : constant := 16#501#;
   HB_SETWIDTHS       : constant := 16#404#;
   HB_GETWIDTHS       : constant := 16#406#;
   HB_GETPARTS        : constant := 16#502#;
   HB_SHOWTOGGLE      : constant := 16#503#;
   SBT_OWNERDRAW      : constant := 16#1000#;
   SBT_NOBORDERS      : constant := 16#100#;
   SBT_POPOUT         : constant := 16#200#;
   HBT_SPRING         : constant := 16#400#;
   MINSYSCOMMAND      : constant := 16#f000#;
   BUTTONLISTBOX      : constant WCHAR_Array :=
      To_Win (C.To_C ("ButtonListBox")) & Wide_Nul;
   BLS_NUMBUTTONS     : constant := 16#ff#;
   BLS_VERTICAL       : constant := 16#100#;
   BLS_NOSCROLL       : constant := 16#200#;
   BL_ADDBUTTONA      : constant := 16#401#;
   BL_DELETEBUTTONA   : constant := 16#402#;
   BL_GETCARETINDEX   : constant := 16#403#;
   BL_GETCOUNT        : constant := 16#404#;
   BL_GETCURSEL       : constant := 16#405#;
   BL_GETITEMDATA     : constant := 16#406#;
   BL_GETITEMRECT     : constant := 16#407#;
   BL_GETTEXTA        : constant := 16#408#;
   BL_GETTEXTLEN      : constant := 16#409#;
   BL_GETTOPINDEX     : constant := 16#40a#;
   BL_INSERTBUTTONA   : constant := 16#40b#;
   BL_RESETCONTENT    : constant := 16#40c#;
   BL_SETCARETINDEX   : constant := 16#40d#;
   BL_SETCURSEL       : constant := 16#40e#;
   BL_SETITEMDATA     : constant := 16#40f#;
   BL_SETTOPINDEX     : constant := 16#410#;
   BL_ADDBUTTONW      : constant := 16#411#;
   BL_DELETEBUTTONW   : constant := 16#412#;
   BL_GETTEXTW        : constant := 16#413#;
   BL_INSERTBUTTONW   : constant := 16#414#;
   BL_MSGMAX          : constant := 16#415#;
   BL_ADDBUTTON       : constant := 16#401#;
   BL_DELETEBUTTON    : constant := 16#402#;
   BL_GETTEXT         : constant := 16#408#;
   BL_INSERTBUTTON    : constant := 16#40b#;
   BL_GETCARETINDEXA  : constant := 16#403#;
   BL_GETCARETINDEXW  : constant := 16#403#;
   BL_GETCOUNTA       : constant := 16#404#;
   BL_GETCOUNTW       : constant := 16#404#;
   BL_GETCURSELA      : constant := 16#405#;
   BL_GETCURSELW      : constant := 16#405#;
   BL_GETITEMDATAA    : constant := 16#406#;
   BL_GETITEMDATAW    : constant := 16#406#;
   BL_GETITEMRECTA    : constant := 16#407#;
   BL_GETITEMRECTW    : constant := 16#407#;
   BL_GETTEXTLENA     : constant := 16#409#;
   BL_GETTEXTLENW     : constant := 16#409#;
   BL_GETTOPINDEXA    : constant := 16#40a#;
   BL_GETTOPINDEXW    : constant := 16#40a#;
   BL_RESETCONTENTA   : constant := 16#40c#;
   BL_RESETCONTENTW   : constant := 16#40c#;
   BL_SETCARETINDEXA  : constant := 16#40d#;
   BL_SETCARETINDEXW  : constant := 16#40d#;
   BL_SETCURSELA      : constant := 16#40e#;
   BL_SETCURSELW      : constant := 16#40e#;
   BL_SETITEMDATAA    : constant := 16#40f#;
   BL_SETITEMDATAW    : constant := 16#40f#;
   BL_SETTOPINDEXA    : constant := 16#410#;
   BL_SETTOPINDEXW    : constant := 16#410#;
   BLN_ERRSPACE       : constant := -2;
   BLN_SELCHANGE      : constant := 1;
   BLN_CLICKED        : constant := 2;
   BLN_SELCANCEL      : constant := 3;
   BLN_SETFOCUS       : constant := 4;
   BLN_KILLFOCUS      : constant := 5;
   BL_OKAY            : constant := 0;
   BL_ERR             : constant := -1;
   BL_ERRSPACE        : constant := -2;
   TRACKBAR_CLASSA    : constant CHAR_Array  := "msctls_trackbar32" & Nul;
   TRACKBAR_CLASSW    : constant WCHAR_Array :=
      To_Win (C.To_C ("msctls_trackbar32")) & Wide_Nul;
   TRACKBAR_CLASS     : CHAR_Array renames TRACKBAR_CLASSA;
   TBS_AUTOTICKS      : constant := 16#1#;
   TBM_GETPOS         : constant := 16#400#;
   TBM_GETRANGEMIN    : constant := 16#401#;
   TBM_GETRANGEMAX    : constant := 16#402#;
   TBM_GETTIC         : constant := 16#403#;
   TBM_SETTIC         : constant := 16#404#;
   TBM_SETPOS         : constant := 16#405#;
   TBM_SETRANGE       : constant := 16#406#;
   TBM_SETRANGEMIN    : constant := 16#407#;
   TBM_SETRANGEMAX    : constant := 16#408#;
   TBM_CLEARTICS      : constant := 16#409#;
   TBM_SETSEL         : constant := 16#40a#;
   TBM_SETSELSTART    : constant := 16#40b#;
   TBM_SETSELEND      : constant := 16#40c#;
   TBM_GETPTICS       : constant := 16#40e#;
   TBM_GETTICPOS      : constant := 16#40f#;
   TBM_GETNUMTICS     : constant := 16#410#;
   TBM_GETSELSTART    : constant := 16#411#;
   TBM_GETSELEND      : constant := 16#412#;
   TBM_CLEARSEL       : constant := 16#413#;
   TB_LINEUP          : constant := 0;
   TB_LINEDOWN        : constant := 1;
   TB_PAGEUP          : constant := 2;
   TB_PAGEDOWN        : constant := 3;
   TB_THUMBPOSITION   : constant := 4;
   TB_THUMBTRACK      : constant := 5;
   TB_TOP             : constant := 6;
   TB_BOTTOM          : constant := 7;
   TB_ENDTRACK        : constant := 8;
   DL_BEGINDRAG       : constant := 16#485#;
   DL_DRAGGING        : constant := 16#486#;
   DL_DROPPED         : constant := 16#487#;
   DL_CANCELDRAG      : constant := 16#488#;
   DL_CURSORSET       : constant := 0;
   DL_STOPCURSOR      : constant := 1;
   DL_COPYCURSOR      : constant := 2;
   DL_MOVECURSOR      : constant := 3;
   DRAGLISTMSGSTRING  : constant WCHAR_Array :=
      To_Win (C.To_C ("commctrl_DragListMsg")) & Wide_Nul;
   UDS_WRAP           : constant := 16#1#;
   UDS_SETBUDDYINT    : constant := 16#2#;
   UDS_ALIGNRIGHT     : constant := 16#4#;
   UDS_ALIGNLEFT      : constant := 16#8#;
   UDS_AUTOBUDDY      : constant := 16#10#;
   UDS_ARROWKEYS      : constant := 16#20#;
   UDM_SETRANGE       : constant := 16#465#;
   UDM_GETRANGE       : constant := 16#466#;
   UDM_SETPOS         : constant := 16#467#;
   UDM_GETPOS         : constant := 16#468#;
   UDM_SETBUDDY       : constant := 16#469#;
   UDM_GETBUDDY       : constant := 16#46a#;
   UDM_SETACCEL       : constant := 16#46b#;
   UDM_GETACCEL       : constant := 16#46c#;
   UDM_SETBASE        : constant := 16#46d#;
   UDM_GETBASE        : constant := 16#46e#;
   UPDOWN_CLASS       : constant WCHAR_Array :=
      To_Win (C.To_C ("msctls_updown")) & Wide_Nul;
   HBN_BEGINDRAG      : constant := 16#101#;
   HBN_DRAGGING       : constant := 16#102#;
   HBN_ENDDRAG        : constant := 16#103#;
   HBN_BEGINADJUST    : constant := 16#111#;
   HBN_ENDADJUST      : constant := 16#112#;
   TBN_BEGINDRAG      : constant := 16#201#;
   TBN_ENDDRAG        : constant := 16#203#;
   TBN_BEGINADJUST    : constant := 16#204#;
   TBN_ADJUSTINFO     : constant := 16#205#;
   TBN_ENDADJUST      : constant := 16#206#;
   TBN_RESET          : constant := 16#207#;
   TBN_QUERYINSERT    : constant := 16#208#;
   TBN_QUERYDELETE    : constant := 16#209#;
   TBN_TOOLBARCHANGE  : constant := 16#20a#;
   TBN_CUSTHELP       : constant := 16#20b#;
   CCS_TOP            : constant := 16#1#;
   CCS_NOMOVEY        : constant := 16#2#;
   CCS_BOTTOM         : constant := 16#3#;
   CCS_NORESIZE       : constant := 16#4#;
   CCS_NOPARENTALIGN  : constant := 16#8#;
   CCS_NOHILITE       : constant := 16#10#;
   CCS_ADJUSTABLE     : constant := 16#20#;
   SST_RESOURCE       : constant := 16#1#;
   SST_FORMAT         : constant := 16#2#;

   type TBBUTTON;
   type ADJUSTINFO;
   type COLORMAP;
   type CREATELISTBUTTONA;
   type CREATELISTBUTTONW;
   type DRAGLISTINFO;
   type UDACCEL;

   type PTBBUTTON is access all TBBUTTON;
   subtype LPTBBUTTON is PTBBUTTON;
   type LPCTBBUTTON is access all TBBUTTON;
   type LPADJUSTINFO is access all ADJUSTINFO;
   type LPCOLORMAP is access all COLORMAP;
   type LPCREATELISTBUTTONA is access all CREATELISTBUTTONA;
   type LPCREATELISTBUTTONW is access all CREATELISTBUTTONW;
   subtype LPCREATELISTBUTTON is LPCREATELISTBUTTONA;
   type LPDRAGLISTINFO is access all DRAGLISTINFO;
   type LPUDACCEL is access all UDACCEL;

   type TBBUTTON is record
      iBitmap   : Win32.INT;
      idCommand : Win32.INT;
      fsState   : Win32.BYTE;
      fsStyle   : Win32.BYTE;
      dwData    : Win32.DWORD;
      iString   : Win32.INT;
   end record;

   type ADJUSTINFO is record
      tbButton      : Win32.Commctrl.TBBUTTON;
      szDescription : Win32.Winnt.TCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type COLORMAP is record
      from : Win32.Windef.COLORREF;
      to   : Win32.Windef.COLORREF;
   end record;

   type CREATELISTBUTTONA is record
      cbSize     : Win32.UINT;
      dwItemData : Win32.DWORD;
      hBitmap    : Win32.Windef.HBITMAP;
      lpszText   : Win32.LPCSTR;
   end record;

   subtype CREATELISTBUTTON is CREATELISTBUTTONA;

   type CREATELISTBUTTONW is record
      cbSize     : Win32.UINT;
      dwItemData : Win32.DWORD;
      hBitmap    : Win32.Windef.HBITMAP;
      lpszText   : Win32.LPCWSTR;
   end record;

   type DRAGLISTINFO is record
      uNotification : Win32.UINT;
      hWnd          : Win32.Windef.HWND;
      ptCursor      : Win32.Windef.POINT;
   end record;

   type UDACCEL is record
      nSec : Win32.UINT;
      nInc : Win32.UINT;
   end record;

   function CreateToolbar
     (hwnd        : Win32.Windef.HWND;
      ws          : Win32.DWORD;
      wID         : Win32.WORD;
      nBitmaps    : Win32.INT;
      hBMInst     : Win32.Windef.HINSTANCE;
      wBMID       : Win32.WORD;
      lpButtons   : LPTBBUTTON;
      iNumButtons : Win32.INT)
      return Win32.Windef.HWND;

   function CreateMappedBitmap
     (hInstance    : Win32.Windef.HINSTANCE;
      idBitmap     : Win32.INT;
      bDiscardable : Win32.BOOL;
      lpColorMap   : Win32.Commctrl.LPCOLORMAP;
      iNumMaps     : Win32.INT)
      return Win32.Windef.HBITMAP;

   procedure DrawStatusTextA
     (hDC    : Win32.Windef.HDC;
      lprc   : Win32.Windef.LPRECT;
      szText : Win32.LPCSTR;
      uFlags : Win32.UINT);

   procedure DrawStatusText
     (hDC    : Win32.Windef.HDC;
      lprc   : Win32.Windef.LPRECT;
      szText : Win32.LPCSTR;
      uFlags : Win32.UINT) renames DrawStatusTextA;

   procedure DrawStatusTextW
     (hDC    : Win32.Windef.HDC;
      lprc   : Win32.Windef.LPRECT;
      szText : Win32.LPCWSTR;
      uFlags : Win32.UINT);

   function CreateStatusWindowA
     (style      : Win32.LONG;
      lpszText   : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID        : Win32.WORD)
      return Win32.Windef.HWND;

   function CreateStatusWindow
     (style      : Win32.LONG;
      lpszText   : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID        : Win32.WORD)
      return Win32.Windef.HWND renames CreateStatusWindowA;

   function CreateStatusWindowW
     (style      : Win32.LONG;
      lpszText   : Win32.LPCWSTR;
      hwndParent : Win32.Windef.HWND;
      wID        : Win32.WORD)
      return Win32.Windef.HWND;

   function CreateHeaderWindowA
     (style      : Win32.LONG;
      lpszText   : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID        : Win32.WORD)
      return Win32.Windef.HWND;

   function CreateHeaderWindow
     (style      : Win32.LONG;
      lpszText   : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID        : Win32.WORD)
      return Win32.Windef.HWND renames CreateHeaderWindowA;

   function CreateHeaderWindowW
     (style      : Win32.LONG;
      lpszText   : Win32.LPCWSTR;
      hwndParent : Win32.Windef.HWND;
      wID        : Win32.WORD)
      return Win32.Windef.HWND;

   function WritePrivateProfileStructA
     (szSection   : Win32.LPCSTR;
      szKey       : Win32.LPCSTR;
      lpStruct    : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile      : Win32.LPCSTR)
      return Win32.BOOL;

   function WritePrivateProfileStruct
     (szSection   : Win32.LPCSTR;
      szKey       : Win32.LPCSTR;
      lpStruct    : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile      : Win32.LPCSTR)
      return Win32.BOOL renames WritePrivateProfileStructA;

   function WritePrivateProfileStructW
     (szSection   : Win32.LPCWSTR;
      szKey       : Win32.LPCWSTR;
      lpStruct    : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile      : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetPrivateProfileStructA
     (szSection   : Win32.LPCSTR;
      szKey       : Win32.LPCSTR;
      lpStruct    : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile      : Win32.LPCSTR)
      return Win32.BOOL;

   function GetPrivateProfileStruct
     (szSection   : Win32.LPCSTR;
      szKey       : Win32.LPCSTR;
      lpStruct    : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile      : Win32.LPCSTR)
      return Win32.BOOL renames GetPrivateProfileStructA;

   function GetPrivateProfileStructW
     (szSection   : Win32.LPCWSTR;
      szKey       : Win32.LPCWSTR;
      lpStruct    : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile      : Win32.LPCWSTR)
      return Win32.BOOL;

   procedure MenuHelp
     (iMessage   : Win32.WORD;
      wParam     : Win32.WPARAM;
      lParam     : Win32.LPARAM;
      hMainMenu  : Win32.Windef.HMENU;
      hInst      : Win32.Windef.HINSTANCE;
      hwndStatus : Win32.Windef.HWND;
      lpdwIDs    : Win32.LPDWORD);

   function ShowHideMenuCtl
     (hWnd   : Win32.Windef.HWND;
      uFlags : Win32.UINT;
      lpInfo : Win32.LPINT)
      return Win32.BOOL;

   procedure GetEffectiveClientRect
     (hWnd   : Win32.Windef.HWND;
      lprc   : Win32.Windef.LPRECT;
      lpInfo : Win32.LPINT);

   function MakeDragList (hLB : Win32.Windef.HWND) return Win32.BOOL;

   function LBItemFromPt
     (hLB         : Win32.Windef.HWND;
      pt          : Win32.Windef.POINT;
      bAutoScroll : Win32.BOOL)
      return Win32.INT;

   procedure DrawInsert
     (handParent : Win32.Windef.HWND;
      hLB        : Win32.Windef.HWND;
      nItem      : Win32.INT);

   function CreateUpDownControl
     (dwStyle : Win32.DWORD;
      x       : Win32.INT;
      y       : Win32.INT;
      cx      : Win32.INT;
      cy      : Win32.INT;
      hParent : Win32.Windef.HWND;
      nID     : Win32.INT;
      hInst   : Win32.Windef.HINSTANCE;
      hBuddy  : Win32.Windef.HWND;
      nUpper  : Win32.INT;
      nLower  : Win32.INT;
      nPos    : Win32.INT)
      return Win32.Windef.HWND;

   procedure InitCommonControls;

private

   pragma Convention (C, TBBUTTON);
   pragma Convention (C, ADJUSTINFO);
   pragma Convention (C_Pass_By_Copy, COLORMAP);
   pragma Convention (C_Pass_By_Copy, CREATELISTBUTTONA);
   pragma Convention (C_Pass_By_Copy, CREATELISTBUTTONW);
   pragma Convention (C_Pass_By_Copy, DRAGLISTINFO);
   pragma Convention (C_Pass_By_Copy, UDACCEL);

   pragma Import (Stdcall, CreateToolbar, "CreateToolbar");
   pragma Import (Stdcall, CreateMappedBitmap, "CreateMappedBitmap");
   pragma Import (Stdcall, DrawStatusTextA, "DrawStatusTextA");
   pragma Import (Stdcall, DrawStatusTextW, "DrawStatusTextW");
   pragma Import (Stdcall, CreateStatusWindowA, "CreateStatusWindowA");
   pragma Import (Stdcall, CreateStatusWindowW, "CreateStatusWindowW");
   pragma Import (Stdcall, CreateHeaderWindowA, "CreateHeaderWindowA");
   pragma Import (Stdcall, CreateHeaderWindowW, "CreateHeaderWindowW");
   pragma Import
     (Stdcall,
      WritePrivateProfileStructA,
      "WritePrivateProfileStructA");
   pragma Import
     (Stdcall,
      WritePrivateProfileStructW,
      "WritePrivateProfileStructW");
   pragma Import
     (Stdcall,
      GetPrivateProfileStructA,
      "GetPrivateProfileStructA");
   pragma Import
     (Stdcall,
      GetPrivateProfileStructW,
      "GetPrivateProfileStructW");
   pragma Import (Stdcall, MenuHelp, "MenuHelp");
   pragma Import (Stdcall, ShowHideMenuCtl, "ShowHideMenuCtl");
   pragma Import (Stdcall, GetEffectiveClientRect, "GetEffectiveClientRect");
   pragma Import (Stdcall, MakeDragList, "MakeDragList");
   pragma Import (Stdcall, LBItemFromPt, "LBItemFromPt");
   pragma Import (Stdcall, DrawInsert, "DrawInsert");
   pragma Import (Stdcall, CreateUpDownControl, "CreateUpDownControl");
   pragma Import (Stdcall, InitCommonControls, "InitCommonControls");

end Win32.Commctrl;
