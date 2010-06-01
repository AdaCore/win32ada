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

with Win32.Objbase;
with Win32.Shellapi;
with Win32.Windef;
with Win32.Winnt;
with Win32.Winuser;

package Win32.Windowsx is

   WM_CTLCOLOR : constant := 16#19#;

   function GetInstanceModule
     (hInstance : Win32.Windef.HMODULE)
      return Win32.Windef.HMODULE;

   function GlobalPtrHandle
     (lp   : Win32.LPCVOID)
      return Win32.Windef.HGLOBAL;

   function GlobalLockPtr (lp : Win32.LPCVOID) return Win32.BOOL;

   function GlobalUnlockPtr (lp : Win32.LPCVOID) return Win32.BOOL;

   function GlobalAllocPtr
     (flags : Win32.UINT;
      cb    : Win32.DWORD)
      return Win32.LPVOID;

   function GlobalReAllocPtr
     (lp    : Win32.LPCVOID;
      cbNew : Win32.DWORD;
      flags : Win32.UINT)
      return Win32.LPVOID;

   function GlobalFreePtr (lp : Win32.LPCVOID) return Win32.BOOL;

   function DeletePen (hpen : Win32.Windef.HPEN) return Win32.BOOL;

   function SelectPen
     (hdc  : Win32.Windef.HDC;
      hpen : Win32.Windef.HPEN)
      return Win32.Windef.HPEN;

   function GetStockPen (i : Win32.INT) return Win32.Windef.HPEN;

   function DeleteBrush (hbr : Win32.Windef.HBRUSH) return Win32.BOOL;

   function SelectBrush
     (hdc  : Win32.Windef.HDC;
      hbr  : Win32.Windef.HBRUSH)
      return Win32.Windef.HBRUSH;

   function GetStockBrush (i : Win32.INT) return Win32.Windef.HBRUSH;

   function DeleteRgn (hrgn : Win32.Windef.HRGN) return Win32.BOOL;

   function CopyRgn
     (hrgnDst : Win32.Windef.HRGN;
      hrgnSrc : Win32.Windef.HRGN)
      return Win32.INT;

   function IntersectRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT;

   function SubtractRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT;

   function UnionRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT;

   function XorRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT;

   function DeletePalette (hpal : Win32.Windef.HPALETTE) return Win32.BOOL;
   function DeleteFont (hfont : Win32.Windef.HFONT) return Win32.BOOL;

   function SelectFont
     (hdc   : Win32.Windef.HDC;
      hfont : Win32.Windef.HFONT)
      return Win32.Windef.HFONT;

   function GetStockFont (i : Win32.INT) return Win32.Windef.HFONT;

   function DeleteBitmap (hbm : Win32.Windef.HBITMAP) return Win32.BOOL;

   function SelectBitmap
     (hdc  : Win32.Windef.HDC;
      hbm  : Win32.Windef.HBITMAP)
      return Win32.Windef.HBITMAP;

   function InsetRect
     (lprc : Win32.Windef.LPRECT;
      dx   : Win32.INT;
      dy   : Win32.INT)
      return Win32.BOOL;

   function GetWindowInstance
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HMODULE;

   function GetWindowStyle (hwnd : Win32.Windef.HWND) return Win32.DWORD;

   function GetWindowExStyle (hwnd : Win32.Windef.HWND) return Win32.DWORD;

   function GetWindowOwner
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;

   function GetFirstChild
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND renames Win32.Winuser.GetTopWindow;

   function GetFirstSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;
   function GetLastSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;
   function GetNextSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;
   function GetPrevSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;
   function GetWindowID (hwnd : Win32.Windef.HWND) return Win32.INT renames
     Win32.Winuser.GetDlgCtrlID;

   procedure SetWindowRedraw
     (hwnd    : Win32.Windef.HWND;
      fRedraw : Win32.BOOL);

   function SubclassWindow
     (hwnd : Win32.Windef.HWND;
      lpfn : Win32.Windef.FARPROC)
      return Win32.Winuser.WNDPROC;

   function IsMinimized (hwnd : Win32.Windef.HWND) return Win32.BOOL renames
     Win32.Winuser.IsIconic;
   function IsMaximized (hwnd : Win32.Windef.HWND) return Win32.BOOL renames
     Win32.Winuser.IsZoomed;
   function IsRestored (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   function MapWindowRect
     (hwndFrom : Win32.Windef.HWND;
      hwndTo   : Win32.Windef.HWND;
      lprc     : Win32.Windef.LPPOINT)
      return Win32.INT;

   function IsLButtonDown return Win32.BOOL;
   function IsRButtonDown return Win32.BOOL;
   function IsMButtonDown return Win32.BOOL;

   function SubclassDialog
     (hwndDlg : Win32.Windef.HWND;
      lpfn    : Win32.Winuser.DLGPROC)
      return Win32.Winuser.DLGPROC;

   function SetDlgMsgResult
     (hwnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      result : Win32.LRESULT)
      return Win32.BOOL;

   function DefDlgProcEx
     (hwnd        : Win32.Windef.HWND;
      msg         : Win32.UINT;
      wParam      : Win32.WPARAM;
      lParam      : Win32.LPARAM;
      pfRecursion : Win32.PBOOL)
      return Win32.LRESULT;

   type LPDEFFN is access function
     (hwnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wparam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   pragma Convention (Stdcall, LPDEFFN);

   type LPCOMPACTINGPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      compactRatio : Win32.UINT);

   function HANDLE_WM_COMPACTING
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMPACTINGPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_COMPACTING
     (hwnd         : Win32.Windef.HWND;
      compactRatio : Win32.UINT;
      fn           : LPDEFFN);

   type LPWININICHANGEPROC is access procedure
     (hwnd            : Win32.Windef.HWND;
      lpszSectionName : Win32.Winnt.LPCTSTR);

   function HANDLE_WM_WININICHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPWININICHANGEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_WININICHANGE
     (hwnd            : Win32.Windef.HWND;
      lpszSectionName : Win32.Winnt.LPCTSTR;
      fn              : LPDEFFN);

   type LPSYSCOLORCHANGEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_SYSCOLORCHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSCOLORCHANGEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SYSCOLORCHANGE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN);

   type LPQUERYNEWPALETTEFN is access function
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function HANDLE_WM_QUERYNEWPALETTE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYNEWPALETTEFN)
      return Win32.LRESULT;

   function FORWARD_WM_QUERYNEWPALETTE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.BOOL;

   type LPPALETTEISCHANGINGPROC is access procedure
     (hwnd              : Win32.Windef.HWND;
      hwndPaletteChange : Win32.Windef.HWND);

   function HANDLE_WM_PALETTEISCHANGING
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPALETTEISCHANGINGPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_PALETTEISCHANGING
     (hwnd              : Win32.Windef.HWND;
      hwndPaletteChange : Win32.Windef.HWND;
      fn                : LPDEFFN);

   type LPPALETTECHANGEDPROC is access procedure
     (hwnd              : Win32.Windef.HWND;
      hwndPaletteChange : Win32.Windef.HWND);

   function HANDLE_WM_PALETTECHANGED
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPALETTECHANGEDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_PALETTECHANGED
     (hwnd              : Win32.Windef.HWND;
      hwndPaletteChange : Win32.Windef.HWND;
      fn                : LPDEFFN);

   type LPFONTCHANGEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_FONTCHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPFONTCHANGEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_FONTCHANGE (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPSPOOLERSTATUSPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      status      : Win32.UINT;
      cJobInQueue : Win32.INT);

   function HANDLE_WM_SPOOLERSTATUS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSPOOLERSTATUSPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SPOOLERSTATUS
     (hwnd        : Win32.Windef.HWND;
      status      : Win32.UINT;
      cJobInQueue : Win32.INT;
      fn          : LPDEFFN);

   type LPDEVMODECHANGEPROC is access procedure
     (hwnd           : Win32.Windef.HWND;
      lpszDeviceName : Win32.Winnt.LPCTSTR);

   function HANDLE_WM_DEVMODECHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDEVMODECHANGEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DEVMODECHANGE
     (hwnd           : Win32.Windef.HWND;
      lpszDeviceName : Win32.Winnt.LPCTSTR;
      fn             : LPDEFFN);

   type LPTIMECHANGEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_TIMECHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPTIMECHANGEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_TIMECHANGE (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPPOWERPROC is access procedure
     (hwnd : Win32.Windef.HWND;
      code : Win32.INT);

   function HANDLE_WM_POWER
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPOWERPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_POWER
     (hwnd : Win32.Windef.HWND;
      code : Win32.INT;
      fn   : LPDEFFN);

   type LPQUERYENDSESSIONFN is access function
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function HANDLE_WM_QUERYENDSESSION
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYENDSESSIONFN)
      return Win32.LRESULT;

   function FORWARD_WM_QUERYENDSESSION
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.BOOL;

   type LPENDSESSIONPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      fEnding : Win32.BOOL);

   function HANDLE_WM_ENDSESSION
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPENDSESSIONPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_ENDSESSION
     (hwnd    : Win32.Windef.HWND;
      fEnding : Win32.BOOL;
      fn      : LPDEFFN);

   type LPQUITPROC is access procedure
     (hwnd     : Win32.Windef.HWND;
      exitCode : Win32.INT);

   function HANDLE_WM_QUIT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUITPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_QUIT
     (hwnd     : Win32.Windef.HWND;
      exitCode : Win32.INT;
      fn       : LPDEFFN);

   type LPCREATEFN is access function
     (hwnd           : Win32.Windef.HWND;
      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT)
      return Win32.BOOL;

   function HANDLE_WM_CREATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCREATEFN)
      return Win32.LRESULT;

   function FORWARD_WM_CREATE
     (hwnd           : Win32.Windef.HWND;
      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT;
      fn             : LPDEFFN)
      return Win32.BOOL;

   type LPNCCREATEFN is access function
     (hwnd           : Win32.Windef.HWND;
      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT)
      return Win32.BOOL;

   function HANDLE_WM_NCCREATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCCREATEFN)
      return Win32.LRESULT;

   function FORWARD_WM_NCCREATE
     (hwnd           : Win32.Windef.HWND;
      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT;
      fn             : LPDEFFN)
      return Win32.BOOL;

   type LPDESTROYPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_DESTROY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDESTROYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DESTROY (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPNCDESTROYPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_NCDESTROY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCDESTROYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCDESTROY (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPSHOWWINDOWPROC is access procedure
     (hwnd   : Win32.Windef.HWND;
      fShow  : Win32.BOOL;
      status : Win32.UINT);

   function HANDLE_WM_SHOWWINDOW
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSHOWWINDOWPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SHOWWINDOW
     (hwnd   : Win32.Windef.HWND;
      fShow  : Win32.BOOL;
      status : Win32.UINT;
      fn     : LPDEFFN);

   type LPSETREDRAWPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      fRedraw : Win32.BOOL);

   function HANDLE_WM_SETREDRAW
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETREDRAWPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SETREDRAW
     (hwnd    : Win32.Windef.HWND;
      fRedraw : Win32.BOOL;
      fn      : LPDEFFN);

   type LPENABLEPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      fEnable : Win32.BOOL);

   function HANDLE_WM_ENABLE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPENABLEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_ENABLE
     (hwnd    : Win32.Windef.HWND;
      fEnable : Win32.BOOL;
      fn      : LPDEFFN);

   type LPSETTEXTPROC is access procedure
     (hwnd     : Win32.Windef.HWND;
      lpszText : Win32.Winnt.LPCTSTR);

   function HANDLE_WM_SETTEXT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETTEXTPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SETTEXT
     (hwnd     : Win32.Windef.HWND;
      lpszText : Win32.Winnt.LPCTSTR;
      fn       : LPDEFFN);

   type LPGETTEXTFN is access function
     (hwnd       : Win32.Windef.HWND;
      cchTextMax : Win32.INT;
      lpszText   : Win32.Winnt.LPTSTR)
      return Win32.INT;

   function HANDLE_WM_GETTEXT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETTEXTFN)
      return Win32.LRESULT;

   function FORWARD_WM_GETTEXT
     (hwnd       : Win32.Windef.HWND;
      cchTextMax : Win32.INT;
      lpszText   : Win32.Winnt.LPTSTR;
      fn         : LPDEFFN)
      return Win32.INT;

   type LPGETTEXTLENGTHFN is access function
     (hwnd : Win32.Windef.HWND)
      return Win32.INT;

   function HANDLE_WM_GETTEXTLENGTH
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETTEXTLENGTHFN)
      return Win32.LRESULT;

   function FORWARD_WM_GETTEXTLENGTH
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.INT;

   type LPWINDOWPOSCHANGINGFN is access function
     (hwnd   : Win32.Windef.HWND;
      lpwpos : Win32.Winuser.LPWINDOWPOS)
      return Win32.BOOL;

   function HANDLE_WM_WINDOWPOSCHANGING
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPWINDOWPOSCHANGINGFN)
      return Win32.LRESULT;

   function FORWARD_WM_WINDOWPOSCHANGING
     (hwnd   : Win32.Windef.HWND;
      lpwpos : Win32.Winuser.LPWINDOWPOS;
      fn     : LPDEFFN)
      return Win32.BOOL;
   type LPCWINDOWPOS is access all Win32.Winuser.WINDOWPOS;

   type LPWINDOWPOSCHANGEDPROC is access procedure
     (hwnd   : Win32.Windef.HWND;
      lpwpos : LPCWINDOWPOS);

   function HANDLE_WM_WINDOWPOSCHANGED
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPWINDOWPOSCHANGEDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_WINDOWPOSCHANGED
     (hwnd   : Win32.Windef.HWND;
      lpwpos : LPCWINDOWPOS;
      fn     : LPDEFFN);

   type LPMOVEPROC is access procedure
     (hwnd : Win32.Windef.HWND;
      x    : Win32.INT;
      y    : Win32.INT);

   function HANDLE_WM_MOVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMOVEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MOVE
     (hwnd : Win32.Windef.HWND;
      x    : Win32.INT;
      y    : Win32.INT;
      fn   : LPDEFFN);

   type LPSIZEPROC is access procedure
     (hwnd  : Win32.Windef.HWND;
      state : Win32.UINT;
      cx    : Win32.INT;
      cy    : Win32.INT);

   function HANDLE_WM_SIZE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSIZEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SIZE
     (hwnd  : Win32.Windef.HWND;
      state : Win32.UINT;
      cx    : Win32.INT;
      cy    : Win32.INT;
      fn    : LPDEFFN);

   type LPCLOSEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_CLOSE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCLOSEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_CLOSE (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPQUERYOPENFN is access function
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function HANDLE_WM_QUERYOPEN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYOPENFN)
      return Win32.LRESULT;

   function FORWARD_WM_QUERYOPEN
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.BOOL;

   type LPGETMINMAXINFOPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      lpMinMaxInfo : Win32.Winuser.LPMINMAXINFO);

   function HANDLE_WM_GETMINMAXINFO
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETMINMAXINFOPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_GETMINMAXINFO
     (hwnd         : Win32.Windef.HWND;
      lpMinMaxInfo : Win32.Winuser.LPMINMAXINFO;
      fn           : LPDEFFN);

   type LPPAINTPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_PAINT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPAINTPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_PAINT (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPERASEBKGNDFN is access function
     (hwnd : Win32.Windef.HWND;
      hdc  : Win32.Windef.HDC)
      return Win32.BOOL;

   function HANDLE_WM_ERASEBKGND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPERASEBKGNDFN)
      return Win32.LRESULT;

   function FORWARD_WM_ERASEBKGND
     (hwnd : Win32.Windef.HWND;
      hdc  : Win32.Windef.HDC;
      fn   : LPDEFFN)
      return Win32.BOOL;

   type LPICONERASEBKGNDFN is access function
     (hwnd : Win32.Windef.HWND;
      hdc  : Win32.Windef.HDC)
      return Win32.BOOL;

   function HANDLE_WM_ICONERASEBKGND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPICONERASEBKGNDFN)
      return Win32.LRESULT;

   function FORWARD_WM_ICONERASEBKGND
     (hwnd : Win32.Windef.HWND;
      hdc  : Win32.Windef.HDC;
      fn   : LPDEFFN)
      return Win32.BOOL;

   type LPNCPAINTPROC is access procedure
     (hwnd : Win32.Windef.HWND;
      hrgn : Win32.Windef.HRGN);

   function HANDLE_WM_NCPAINT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCPAINTPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCPAINT
     (hwnd : Win32.Windef.HWND;
      hrgn : Win32.Windef.HRGN;
      fn   : LPDEFFN);

   type LPNCCALCSIZEFN is access function
     (hwnd            : Win32.Windef.HWND;
      fCalcValidRects : Win32.BOOL;
      lpcsp           : Win32.Winuser.LPNCCALCSIZE_PARAMS)
      return Win32.UINT;

   function HANDLE_WM_NCCALCSIZE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCCALCSIZEFN)
      return Win32.LRESULT;

   function FORWARD_WM_NCCALCSIZE
     (hwnd            : Win32.Windef.HWND;
      fCalcValidRects : Win32.BOOL;
      lpcsp           : Win32.Winuser.LPNCCALCSIZE_PARAMS;
      fn              : LPDEFFN)
      return Win32.UINT;

   type LPNCHITTESTFN is access function
     (hwnd : Win32.Windef.HWND;
      x    : Win32.INT;
      y    : Win32.INT)
      return Win32.UINT;

   function HANDLE_WM_NCHITTEST
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCHITTESTFN)
      return Win32.LRESULT;

   function FORWARD_WM_NCHITTEST
     (hwnd : Win32.Windef.HWND;
      x    : Win32.INT;
      y    : Win32.INT;
      fn   : LPDEFFN)
      return Win32.UINT;

   type LPQUERYDRAGICONFN is access function
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HICON;

   function HANDLE_WM_QUERYDRAGICON
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYDRAGICONFN)
      return Win32.LRESULT;

   function FORWARD_WM_QUERYDRAGICON
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.Windef.HICON;

   type LPDROPFILESPROC is access procedure
     (hwnd  : Win32.Windef.HWND;
      hdrop : Win32.Shellapi.HDROP);

   function HANDLE_WM_DROPFILES
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDROPFILESPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DROPFILES
     (hwnd  : Win32.Windef.HWND;
      hdrop : Win32.Shellapi.HDROP;
      fn    : LPDEFFN);

   type LPACTIVATEPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      state        : Win32.UINT;
      hwndActDeact : Win32.Windef.HWND;
      fMinimized   : Win32.BOOL);

   function HANDLE_WM_ACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPACTIVATEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_ACTIVATE
     (hwnd         : Win32.Windef.HWND;
      state        : Win32.UINT;
      hwndActDeact : Win32.Windef.HWND;
      fMinimized   : Win32.BOOL;
      fn           : LPDEFFN);

   type LPACTIVATEAPPPROC is access procedure
     (hwnd       : Win32.Windef.HWND;
      fActivate  : Win32.BOOL;
      dwThreadId : Win32.DWORD);

   function HANDLE_WM_ACTIVATEAPP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPACTIVATEAPPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_ACTIVATEAPP
     (hwnd       : Win32.Windef.HWND;
      fActivate  : Win32.BOOL;
      dwThreadId : Win32.DWORD;
      fn         : LPDEFFN);

   type LPNCACTIVATEFN is access function
     (hwnd         : Win32.Windef.HWND;
      fActive      : Win32.BOOL;
      hwndActDeact : Win32.Windef.HWND;
      fMinimized   : Win32.BOOL)
      return Win32.BOOL;

   function HANDLE_WM_NCACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCACTIVATEFN)
      return Win32.LRESULT;

   function FORWARD_WM_NCACTIVATE
     (hwnd         : Win32.Windef.HWND;
      fActive      : Win32.BOOL;
      hwndActDeact : Win32.Windef.HWND;
      fMinimized   : Win32.BOOL;
      fn           : LPDEFFN)
      return Win32.BOOL;

   type LPSETFOCUSPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      hwndOldFocus : Win32.Windef.HWND);

   function HANDLE_WM_SETFOCUS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETFOCUSPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SETFOCUS
     (hwnd         : Win32.Windef.HWND;
      hwndOldFocus : Win32.Windef.HWND;
      fn           : LPDEFFN);

   type LPKILLFOCUSPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      hwndNewFocus : Win32.Windef.HWND);

   function HANDLE_WM_KILLFOCUS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPKILLFOCUSPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_KILLFOCUS
     (hwnd         : Win32.Windef.HWND;
      hwndNewFocus : Win32.Windef.HWND;
      fn           : LPDEFFN);

   type LPKEYPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT);

   function HANDLE_WM_KEYDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPKEYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_KEYDOWN
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN);

   function HANDLE_WM_KEYUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPKEYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_KEYUP
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN);

   type LPCHARPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT);

   function HANDLE_WM_CHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHARPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_CHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN);

   type LPDEADCHARPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT);

   function HANDLE_WM_DEADCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDEADCHARPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DEADCHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN);

   type LPSYSKEYPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT);

   function HANDLE_WM_SYSKEYDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSKEYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SYSKEYDOWN
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN);

   function HANDLE_WM_SYSKEYUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSKEYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SYSKEYUP
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN);

   type LPSYSCHARPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT);

   function HANDLE_WM_SYSCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSCHARPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SYSCHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN);

   type LPSYSDEADCHARPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT);

   function HANDLE_WM_SYSDEADCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSDEADCHARPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SYSDEADCHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN);

   type LPMOUSEMOVEPROC is access procedure
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT);

   function HANDLE_WM_MOUSEMOVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMOUSEMOVEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MOUSEMOVE
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN);

   type LPLBUTTONDOWNPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT);

   function HANDLE_WM_LBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPLBUTTONDOWNPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_LBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT;
      fn           : LPDEFFN);

   function HANDLE_WM_LBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPLBUTTONDOWNPROC)
      return Win32.LRESULT;

   type LPLBUTTONUPPROC is access procedure
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT);

   function HANDLE_WM_LBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPLBUTTONUPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_LBUTTONUP
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN);

   type LPRBUTTONDOWNPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT);

   function HANDLE_WM_RBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRBUTTONDOWNPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_RBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT;
      fn           : LPDEFFN);

   function HANDLE_WM_RBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRBUTTONDOWNPROC)
      return Win32.LRESULT;

   type LPRBUTTONUPPROC is access procedure
     (hwnd  : Win32.Windef.HWND;
      x     : Win32.INT;
      y     : Win32.INT;
      flags : Win32.UINT);

   function HANDLE_WM_RBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRBUTTONUPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_RBUTTONUP
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN);

   type LPMBUTTONDOWNPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT);

   function HANDLE_WM_MBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMBUTTONDOWNPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT;
      fn           : LPDEFFN);

   function HANDLE_WM_MBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMBUTTONDOWNPROC)
      return Win32.LRESULT;

   type LPMBUTTONUPPROC is access procedure
     (hwnd  : Win32.Windef.HWND;
      x     : Win32.INT;
      y     : Win32.INT;
      flags : Win32.UINT);

   function HANDLE_WM_MBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMBUTTONUPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MBUTTONUP
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN);

   type LPNCMOUSEMOVEPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT);

   function HANDLE_WM_NCMOUSEMOVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMOUSEMOVEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCMOUSEMOVE
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN);

   type LPNCLBUTTONDOWNPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT);

   function HANDLE_WM_NCLBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCLBUTTONDOWNPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCLBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT;
      fn           : LPDEFFN);

   function HANDLE_WM_NCLBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCLBUTTONDOWNPROC)
      return Win32.LRESULT;

   type LPNCLBUTTONUPPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT);

   function HANDLE_WM_NCLBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCLBUTTONUPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCLBUTTONUP
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN);

   type LPNCRBUTTONDOWNPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT);

   function HANDLE_WM_NCRBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCRBUTTONDOWNPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCRBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT;
      fn           : LPDEFFN);

   function HANDLE_WM_NCRBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCRBUTTONDOWNPROC)
      return Win32.LRESULT;

   type LPNCRBUTTONUPPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT);

   function HANDLE_WM_NCRBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCRBUTTONUPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCRBUTTONUP
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN);

   type LPNCMBUTTONDOWNPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT);

   function HANDLE_WM_NCMBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMBUTTONDOWNPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCMBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT;
      fn           : LPDEFFN);

   function HANDLE_WM_NCMBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMBUTTONDOWNPROC)
      return Win32.LRESULT;

   type LPNCMBUTTONUPPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT);

   function HANDLE_WM_NCMBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMBUTTONUPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_NCMBUTTONUP
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN);

   type LPMOUSEACTIVATEFN is access function
     (hwnd         : Win32.Windef.HWND;
      hwndTopLevel : Win32.Windef.HWND;
      codeHitTest  : Win32.UINT;
      msg          : Win32.UINT)
      return Win32.INT;

   function HANDLE_WM_MOUSEACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMOUSEACTIVATEFN)
      return Win32.LRESULT;

   function FORWARD_WM_MOUSEACTIVATE
     (hwnd         : Win32.Windef.HWND;
      hwndTopLevel : Win32.Windef.HWND;
      codeHitTest  : Win32.UINT;
      msg          : Win32.UINT;
      fn           : LPDEFFN)
      return Win32.INT;

   type LPCANCELMODEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_CANCELMODE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCANCELMODEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_CANCELMODE (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPTIMERPROC is access procedure
     (hwnd : Win32.Windef.HWND;
      id   : Win32.UINT);

   function HANDLE_WM_TIMER
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPTIMERPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_TIMER
     (hwnd : Win32.Windef.HWND;
      id   : Win32.UINT;
      fn   : LPDEFFN);

   type LPINITMENUPROC is access procedure
     (hwnd  : Win32.Windef.HWND;
      hMenu : Win32.Windef.HMENU);

   function HANDLE_WM_INITMENU
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPINITMENUPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_INITMENU
     (hwnd  : Win32.Windef.HWND;
      hMenu : Win32.Windef.HMENU;
      fn    : LPDEFFN);

   type LPINITMENUPOPUPPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      hMenu       : Win32.Windef.HMENU;
      item        : Win32.UINT;
      fSystemMenu : Win32.BOOL);

   function HANDLE_WM_INITMENUPOPUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPINITMENUPOPUPPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_INITMENUPOPUP
     (hwnd        : Win32.Windef.HWND;
      hMenu       : Win32.Windef.HMENU;
      item        : Win32.UINT;
      fSystemMenu : Win32.BOOL;
      fn          : LPDEFFN);

   type LPMENUSELECTPROC is access procedure
     (hwnd       : Win32.Windef.HWND;
      hmenu      : Win32.Windef.HMENU;
      item       : Win32.INT;
      hmenuPopup : Win32.Windef.HMENU;
      flags      : Win32.UINT);

   function HANDLE_WM_MENUSELECT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMENUSELECTPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MENUSELECT
     (hwnd       : Win32.Windef.HWND;
      hmenu      : Win32.Windef.HMENU;
      item       : Win32.INT;
      hmenuPopup : Win32.Windef.HMENU;
      flags      : Win32.UINT;
      fn         : LPDEFFN);

   type LPMENUCHARFN is access function
     (hwnd  : Win32.Windef.HWND;
      ch    : Win32.UINT;
      flags : Win32.UINT;
      hmenu : Win32.Windef.HMENU)
      return Win32.DWORD;

   function HANDLE_WM_MENUCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMENUCHARFN)
      return Win32.LRESULT;

   function FORWARD_WM_MENUCHAR
     (hwnd  : Win32.Windef.HWND;
      ch    : Win32.UINT;
      flags : Win32.UINT;
      hmenu : Win32.Windef.HMENU;
      fn    : LPDEFFN)
      return Win32.DWORD;

   type LPCOMMANDPROC is access procedure
     (hwnd       : Win32.Windef.HWND;
      id         : Win32.INT;
      hwndCtl    : Win32.Windef.HWND;
      codeNotify : Win32.UINT);

   function HANDLE_WM_COMMAND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMMANDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_COMMAND
     (hwnd       : Win32.Windef.HWND;
      id         : Win32.INT;
      hwndCtl    : Win32.Windef.HWND;
      codeNotify : Win32.UINT;
      fn         : LPDEFFN);

   type LPHSCROLLPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      hwndCtl : Win32.Windef.HWND;
      code    : Win32.UINT;
      pos     : Win32.INT);

   function HANDLE_WM_HSCROLL
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPHSCROLLPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_HSCROLL
     (hwnd    : Win32.Windef.HWND;
      hwndCtl : Win32.Windef.HWND;
      code    : Win32.UINT;
      pos     : Win32.INT;
      fn      : LPDEFFN);

   type LPVSCROLLPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      hwndCtl : Win32.Windef.HWND;
      code    : Win32.UINT;
      pos     : Win32.INT);

   function HANDLE_WM_VSCROLL
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPVSCROLLPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_VSCROLL
     (hwnd    : Win32.Windef.HWND;
      hwndCtl : Win32.Windef.HWND;
      code    : Win32.UINT;
      pos     : Win32.INT;
      fn      : LPDEFFN);

   type LPCUTPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_CUT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCUTPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_CUT (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPCOPYPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_COPY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOPYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_COPY (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPPASTEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_PASTE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPASTEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_PASTE (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPCLEARPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_CLEAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCLEARPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_CLEAR (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPUNDOPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_UNDO
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPUNDOPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_UNDO (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPRENDERFORMATFN is access function
     (hwnd : Win32.Windef.HWND;
      fmt  : Win32.UINT)
      return Win32.Winnt.HANDLE;

   function HANDLE_WM_RENDERFORMAT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRENDERFORMATFN)
      return Win32.LRESULT;

   function FORWARD_WM_RENDERFORMAT
     (hwnd : Win32.Windef.HWND;
      fmt  : Win32.UINT;
      fn   : LPDEFFN)
      return Win32.Winnt.HANDLE;

   type LPRENDERALLFORMATSPROC is access procedure
     (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_RENDERALLFORMATS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRENDERALLFORMATSPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_RENDERALLFORMATS
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN);

   type LPDESTROYCLIPBOARDPROC is access procedure
     (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_DESTROYCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDESTROYCLIPBOARDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DESTROYCLIPBOARD
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN);

   type LPDRAWCLIPBOARDPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_DRAWCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDRAWCLIPBOARDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DRAWCLIPBOARD
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN);

   type LPCPAINTSTRUCT is access all Win32.Winuser.PAINTSTRUCT;
   type LPPAINTCLIPBOARDPROC is access procedure
     (hwnd          : Win32.Windef.HWND;
      hwndCBViewer  : Win32.Windef.HWND;
      lpPaintStruct : LPCPAINTSTRUCT);

   function HANDLE_WM_PAINTCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPAINTCLIPBOARDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_PAINTCLIPBOARD
     (hwnd          : Win32.Windef.HWND;
      hwndCBViewer  : Win32.Windef.HWND;
      lpPaintStruct : LPCPAINTSTRUCT;
      fn            : LPDEFFN);

   type LPSIZECLIPBOARDPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      lprc         : Win32.Objbase.LPCRECT);

   function HANDLE_WM_SIZECLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSIZECLIPBOARDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SIZECLIPBOARD
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      lprc         : Win32.Objbase.LPCRECT;
      fn           : LPDEFFN);
   type LPVSCROLLCLIPBOARDPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      code         : Win32.UINT;
      pos          : Win32.INT);

   function HANDLE_WM_VSCROLLCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPVSCROLLCLIPBOARDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_VSCROLLCLIPBOARD
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      code         : Win32.UINT;
      pos          : Win32.INT;
      fn           : LPDEFFN);

   type LPHSCROLLCLIPBOARDPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      code         : Win32.UINT;
      pos          : Win32.INT);

   function HANDLE_WM_HSCROLLCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPHSCROLLCLIPBOARDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_HSCROLLCLIPBOARD
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      code         : Win32.UINT;
      pos          : Win32.INT;
      fn           : LPDEFFN);

   type LPASKCBFORMATNAMEPROC is access procedure
     (hwnd     : Win32.Windef.HWND;
      cchMax   : Win32.INT;
      rgchName : Win32.Winnt.LPTSTR);

   function HANDLE_WM_ASKCBFORMATNAME
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPASKCBFORMATNAMEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_ASKCBFORMATNAME
     (hwnd     : Win32.Windef.HWND;
      cchMax   : Win32.INT;
      rgchName : Win32.Winnt.LPTSTR;
      fn       : LPDEFFN);

   type LPCHANGECBCHAINPROC is access procedure
     (hwnd       : Win32.Windef.HWND;
      hwndRemove : Win32.Windef.HWND;
      hwndNext   : Win32.Windef.HWND);

   function HANDLE_WM_CHANGECBCHAIN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHANGECBCHAINPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_CHANGECBCHAIN
     (hwnd       : Win32.Windef.HWND;
      hwndRemove : Win32.Windef.HWND;
      hwndNext   : Win32.Windef.HWND;
      fn         : LPDEFFN);

   type LPSETCURSORFN is access function
     (hwnd        : Win32.Windef.HWND;
      hwndCursor  : Win32.Windef.HWND;
      codeHitTest : Win32.UINT;
      msg         : Win32.UINT)
      return Win32.BOOL;

   function HANDLE_WM_SETCURSOR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETCURSORFN)
      return Win32.LRESULT;

   function FORWARD_WM_SETCURSOR
     (hwnd        : Win32.Windef.HWND;
      hwndCursor  : Win32.Windef.HWND;
      codeHitTest : Win32.UINT;
      msg         : Win32.UINT;
      fn          : LPDEFFN)
      return Win32.BOOL;

   type LPSYSCOMMANDPROC is access procedure
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT;
      x    : Win32.INT;
      y    : Win32.INT);

   function HANDLE_WM_SYSCOMMAND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSCOMMANDPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SYSCOMMAND
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT;
      x    : Win32.INT;
      y    : Win32.INT;
      fn   : LPDEFFN);

   type LPCMDICREATESTRUCT is access all Win32.Winuser.MDICREATESTRUCTA;

   type LPMDICREATEFN is access function
     (hwnd  : Win32.Windef.HWND;
      lpmcs : LPCMDICREATESTRUCT)
      return Win32.Windef.HWND;

   function HANDLE_WM_MDICREATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDICREATEFN)
      return Win32.LRESULT;

   function FORWARD_WM_MDICREATE
     (hwnd  : Win32.Windef.HWND;
      lpmcs : LPCMDICREATESTRUCT;
      fn    : LPDEFFN)
      return Win32.Windef.HWND;

   type LPMDIDESTROYPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      hwndDestroy : Win32.Windef.HWND);

   function HANDLE_WM_MDIDESTROY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIDESTROYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MDIDESTROY
     (hwnd        : Win32.Windef.HWND;
      hwndDestroy : Win32.Windef.HWND;
      fn          : LPDEFFN);

   type LPMDIACTIVATEPROC is access procedure
     (hwnd           : Win32.Windef.HWND;
      fActive        : Win32.BOOL;
      hwndActivate   : Win32.Windef.HWND;
      hwndDeactivate : Win32.Windef.HWND);

   function HANDLE_WM_MDIACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIACTIVATEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MDIACTIVATE
     (hwnd           : Win32.Windef.HWND;
      fActive        : Win32.BOOL;
      hwndActivate   : Win32.Windef.HWND;
      hwndDeactivate : Win32.Windef.HWND;
      fn             : LPDEFFN);

   type LPMDIRESTOREPROC is access procedure
     (hwnd        : Win32.Windef.HWND;
      hwndRestore : Win32.Windef.HWND);

   function HANDLE_WM_MDIRESTORE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIRESTOREPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MDIRESTORE
     (hwnd        : Win32.Windef.HWND;
      hwndRestore : Win32.Windef.HWND;
      fn          : LPDEFFN);

   type LPMDINEXTFN is access function
     (hwnd    : Win32.Windef.HWND;
      hwndCur : Win32.Windef.HWND;
      fPrev   : Win32.BOOL)
      return Win32.Windef.HWND;

   function HANDLE_WM_MDINEXT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDINEXTFN)
      return Win32.LRESULT;

   function FORWARD_WM_MDINEXT
     (hwnd    : Win32.Windef.HWND;
      hwndCur : Win32.Windef.HWND;
      fPrev   : Win32.BOOL;
      fn      : LPDEFFN)
      return Win32.Windef.HWND;

   type LPMDIMAXIMIZEPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      hwndMaximize : Win32.Windef.HWND);

   function HANDLE_WM_MDIMAXIMIZE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIMAXIMIZEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MDIMAXIMIZE
     (hwnd         : Win32.Windef.HWND;
      hwndMaximize : Win32.Windef.HWND;
      fn           : LPDEFFN);

   type LPMDITILEFN is access function
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT)
      return Win32.BOOL;

   function HANDLE_WM_MDITILE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDITILEFN)
      return Win32.LRESULT;

   function FORWARD_WM_MDITILE
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT;
      fn   : LPDEFFN)
      return Win32.BOOL;

   type LPMDICASCADEFN is access function
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT)
      return Win32.BOOL;

   function HANDLE_WM_MDICASCADE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDICASCADEFN)
      return Win32.LRESULT;

   function FORWARD_WM_MDICASCADE
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT;
      fn   : LPDEFFN)
      return Win32.BOOL;

   type LPMDIICONARRANGEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_MDIICONARRANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIICONARRANGEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MDIICONARRANGE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN);

   type LPMDIGETACTIVEFN is access function
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;

   function HANDLE_WM_MDIGETACTIVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIGETACTIVEFN)
      return Win32.LRESULT;

   function FORWARD_WM_MDIGETACTIVE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.Windef.HWND;

   type LPMDISETMENUFN is access function
     (hwnd        : Win32.Windef.HWND;
      fRefresh    : Win32.BOOL;
      hmenuFrame  : Win32.Windef.HMENU;
      hmenuWindow : Win32.Windef.HMENU)
      return Win32.Windef.HMENU;

   function HANDLE_WM_MDISETMENU
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDISETMENUFN)
      return Win32.LRESULT;

   function FORWARD_WM_MDISETMENU
     (hwnd        : Win32.Windef.HWND;
      fRefresh    : Win32.BOOL;
      hmenuFrame  : Win32.Windef.HMENU;
      hmenuWindow : Win32.Windef.HMENU;
      fn          : LPDEFFN)
      return Win32.Windef.HMENU;

   type LPCHILDACTIVATEPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_CHILDACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHILDACTIVATEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_CHILDACTIVATE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN);

   type LPINITDIALOGFN is access function
     (hwnd      : Win32.Windef.HWND;
      hwndFocus : Win32.Windef.HWND;
      lParam    : Win32.LPARAM)
      return Win32.BOOL;

   function HANDLE_WM_INITDIALOG
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPINITDIALOGFN)
      return Win32.LRESULT;

   function FORWARD_WM_INITDIALOG
     (hwnd      : Win32.Windef.HWND;
      hwndFocus : Win32.Windef.HWND;
      lParam    : Win32.LPARAM;
      fn        : LPDEFFN)
      return Win32.BOOL;

   type LPNEXTDLGCTLFN is access function
     (hwnd         : Win32.Windef.HWND;
      hwndSetFocus : Win32.Windef.HWND;
      fNext        : Win32.BOOL)
      return Win32.Windef.HWND;

   function HANDLE_WM_NEXTDLGCTL
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNEXTDLGCTLFN)
      return Win32.LRESULT;

   function FORWARD_WM_NEXTDLGCTL
     (hwnd         : Win32.Windef.HWND;
      hwndSetFocus : Win32.Windef.HWND;
      fNext        : Win32.BOOL;
      fn           : LPDEFFN)
      return Win32.Windef.HWND;

   type LPPARENTNOTIFYPROC is access procedure
     (hwnd      : Win32.Windef.HWND;
      msg       : Win32.UINT;
      hwndChild : Win32.Windef.HWND;
      idChild   : Win32.INT);

   function HANDLE_WM_PARENTNOTIFY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPARENTNOTIFYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_PARENTNOTIFY
     (hwnd      : Win32.Windef.HWND;
      msg       : Win32.UINT;
      hwndChild : Win32.Windef.HWND;
      idChild   : Win32.INT;
      fn        : LPDEFFN);

   type LPENTERIDLEPROC is access procedure
     (hwnd       : Win32.Windef.HWND;
      source     : Win32.UINT;
      hwndSource : Win32.Windef.HWND);

   function HANDLE_WM_ENTERIDLE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPENTERIDLEPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_ENTERIDLE
     (hwnd       : Win32.Windef.HWND;
      source     : Win32.UINT;
      hwndSource : Win32.Windef.HWND;
      fn         : LPDEFFN);

   type LPGETDLGCODEFN is access function
     (hwnd  : Win32.Windef.HWND;
      lpmsg : Win32.Winuser.LPMSG)
      return Win32.UINT;

   function HANDLE_WM_GETDLGCODE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETDLGCODEFN)
      return Win32.LRESULT;

   function FORWARD_WM_GETDLGCODE
     (hwnd  : Win32.Windef.HWND;
      lpmsg : Win32.Winuser.LPMSG;
      fn    : LPDEFFN)
      return Win32.UINT;

   type LPCTLCOLORFN is access function
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctrlType  : Win32.INT)
      return Win32.Windef.HBRUSH;

   function HANDLE_WM_CTLCOLORMSGBOX
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT;

   function FORWARD_WM_CTLCOLORMSGBOX
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH;

   function HANDLE_WM_CTLCOLOREDIT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT;

   function FORWARD_WM_CTLCOLOREDIT
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH;

   function HANDLE_WM_CTLCOLORLISTBOX
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT;

   function FORWARD_WM_CTLCOLORLISTBOX
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH;

   function HANDLE_WM_CTLCOLORBTN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT;

   function FORWARD_WM_CTLCOLORBTN
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH;

   function HANDLE_WM_CTLCOLORDLG
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT;

   function FORWARD_WM_CTLCOLORDLG
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH;

   function HANDLE_WM_CTLCOLORSCROLLBAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT;

   function FORWARD_WM_CTLCOLORSCROLLBAR
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH;

   function HANDLE_WM_CTLCOLORSTATIC
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT;

   function FORWARD_WM_CTLCOLORSTATIC
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH;

   type LPSETFONTPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      hfont   : Win32.Windef.HFONT;
      fRedraw : Win32.BOOL);

   function HANDLE_WM_SETFONT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETFONTPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_SETFONT
     (hwnd    : Win32.Windef.HWND;
      hfont   : Win32.Windef.HFONT;
      fRedraw : Win32.BOOL;
      fn      : LPDEFFN);

   procedure SetWindowFont
     (hwnd    : Win32.Windef.HWND;
      hfont   : Win32.Windef.HFONT;
      fRedraw : Win32.BOOL);

   type LPGETFONTFN is access function
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HFONT;

   function HANDLE_WM_GETFONT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETFONTFN)
      return Win32.LRESULT;

   function FORWARD_WM_GETFONT
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.Windef.HFONT;

   function GetWindowFont
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HFONT;

   type LPCDRAWITEMSTRUCT is access all Win32.Winuser.DRAWITEMSTRUCT;
   type LPDRAWITEMPROC is access procedure
     (hwnd       : Win32.Windef.HWND;
      lpDrawItem : LPCDRAWITEMSTRUCT);

   function HANDLE_WM_DRAWITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDRAWITEMPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DRAWITEM
     (hwnd       : Win32.Windef.HWND;
      lpDrawItem : LPCDRAWITEMSTRUCT;
      fn         : LPDEFFN);
   type LPMEASUREITEMPROC is access procedure
     (hwnd          : Win32.Windef.HWND;
      lpMeasureItem : Win32.Winuser.LPMEASUREITEMSTRUCT);

   function HANDLE_WM_MEASUREITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMEASUREITEMPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_MEASUREITEM
     (hwnd          : Win32.Windef.HWND;
      lpMeasureItem : Win32.Winuser.LPMEASUREITEMSTRUCT;
      fn            : LPDEFFN);

   type LPCDELETEITEMSTRUCT is access constant Win32.Winuser.DELETEITEMSTRUCT;

   type LPDELETEITEMPROC is access procedure
     (hwnd         : Win32.Windef.HWND;
      lpDeleteItem : LPCDELETEITEMSTRUCT);

   function HANDLE_WM_DELETEITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDELETEITEMPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_DELETEITEM
     (hwnd         : Win32.Windef.HWND;
      lpDeleteItem : LPCDELETEITEMSTRUCT;
      fn           : LPDEFFN);
   type LPCCOMPAREITEMSTRUCT is access all Win32.Winuser.COMPAREITEMSTRUCT;

   type LPCOMPAREITEMFN is access function
     (hwnd          : Win32.Windef.HWND;
      lpCompareItem : LPCCOMPAREITEMSTRUCT)
      return Win32.INT;

   function HANDLE_WM_COMPAREITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMPAREITEMFN)
      return Win32.LRESULT;

   function FORWARD_WM_COMPAREITEM
     (hwnd          : Win32.Windef.HWND;
      lpCompareItem : LPCCOMPAREITEMSTRUCT;
      fn            : LPDEFFN)
      return Win32.INT;

   type LPVKEYTOITEMFN is access function
     (hwnd        : Win32.Windef.HWND;
      vk          : Win32.UINT;
      hwndListbox : Win32.Windef.HWND;
      iCaret      : Win32.INT)
      return Win32.INT;

   function HANDLE_WM_VKEYTOITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPVKEYTOITEMFN)
      return Win32.LRESULT;

   function FORWARD_WM_VKEYTOITEM
     (hwnd        : Win32.Windef.HWND;
      vk          : Win32.UINT;
      hwndListbox : Win32.Windef.HWND;
      iCaret      : Win32.INT;
      fn          : LPDEFFN)
      return Win32.INT;

   type LPCHARTOITEMFN is access function
     (hwnd        : Win32.Windef.HWND;
      ch          : Win32.UINT;
      hwndListbox : Win32.Windef.HWND;
      iCaret      : Win32.INT)
      return Win32.INT;

   function HANDLE_WM_CHARTOITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHARTOITEMFN)
      return Win32.LRESULT;

   function FORWARD_WM_CHARTOITEM
     (hwnd        : Win32.Windef.HWND;
      ch          : Win32.UINT;
      hwndListbox : Win32.Windef.HWND;
      iCaret      : Win32.INT;
      fn          : LPDEFFN)
      return Win32.INT;

   type LPQUEUESYNCPROC is access procedure (hwnd : Win32.Windef.HWND);

   function HANDLE_WM_QUEUESYNC
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUEUESYNCPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_QUEUESYNC (hwnd : Win32.Windef.HWND; fn : LPDEFFN);

   type LPCOMMNOTIFYPROC is access procedure
     (hwnd  : Win32.Windef.HWND;
      cid   : Win32.INT;
      flags : Win32.UINT);

   function HANDLE_WM_COMMNOTIFY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMMNOTIFYPROC)
      return Win32.LRESULT;

   procedure FORWARD_WM_COMMNOTIFY
     (hwnd  : Win32.Windef.HWND;
      cid   : Win32.INT;
      flags : Win32.UINT;
      fn    : LPDEFFN);

   function Static_Enable
     (hwndCtl : Win32.Windef.HWND;
      fEnable : Win32.BOOL)
      return Win32.BOOL renames Win32.Winuser.EnableWindow;

   function Static_GetText
     (hwndCtl : Win32.Windef.HWND;
      lpch    : Win32.LPSTR;
      cchMax  : Win32.INT)
      return Win32.INT renames Win32.Winuser.GetWindowText;

   function Static_GetTextLength
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT renames Win32.Winuser.GetWindowTextLength;

   function Static_SetText
     (hwndCtl : Win32.Windef.HWND;
      lpsz    : Win32.LPCSTR)
      return Win32.BOOL renames Win32.Winuser.SetWindowText;

   function Static_SetIcon
     (hwndCtl : Win32.Windef.HWND;
      hIcon   : Win32.Windef.HICON)
      return Win32.Windef.HICON;

   function Static_GetIcon
     (hwndCtl : Win32.Windef.HWND;
      hIcon   : Win32.Windef.HICON)
      return Win32.Windef.HICON;

   function Button_Enable
     (hwndCtl : Win32.Windef.HWND;
      fEnable : Win32.BOOL)
      return Win32.BOOL renames Win32.Winuser.EnableWindow;

   function Button_GetText
     (hWndCtl : Win32.Windef.HWND;
      lpch    : Win32.LPSTR;
      cchMax  : Win32.INT)
      return Win32.INT renames Win32.Winuser.GetWindowText;

   function Button_GetTextLength
     (hWndCtl : Win32.Windef.HWND)
      return Win32.INT renames Win32.Winuser.GetWindowTextLength;

   function Button_SetText
     (hWndCtl : Win32.Windef.HWND;
      lpsz    : Win32.LPCSTR)
      return Win32.BOOL renames Win32.Winuser.SetWindowText;

   function Button_GetCheck (hwndCtl : Win32.Windef.HWND) return Win32.INT;

   procedure Button_SetCheck
     (hwndCtl : Win32.Windef.HWND;
      check   : Win32.WPARAM);

   function Button_GetState (hwndCtl : Win32.Windef.HWND) return Win32.INT;

   function Button_SetState
     (hwndCtl : Win32.Windef.HWND;
      state   : Win32.WPARAM)
      return Win32.UINT;

   procedure Button_SetStyle
     (hwndCtl : Win32.Windef.HWND;
      style   : Win32.DWORD;
      fRedraw : Win32.BOOL);

   function Edit_Enable
     (hwndCtl : Win32.Windef.HWND;
      fEnable : Win32.BOOL)
      return Win32.BOOL renames Win32.Winuser.EnableWindow;

   function Edit_GetText
     (hWndCtl : Win32.Windef.HWND;
      lpch    : Win32.LPSTR;
      cchMax  : Win32.INT)
      return Win32.INT renames Win32.Winuser.GetWindowText;

   function Edit_GetTextLength
     (hWndCtl : Win32.Windef.HWND)
      return Win32.INT renames Win32.Winuser.GetWindowTextLength;

   function Edit_SetText
     (hWndCtl : Win32.Windef.HWND;
      lpsz    : Win32.LPCSTR)
      return Win32.BOOL renames Win32.Winuser.SetWindowText;

   procedure Edit_LimitText
     (hwndCtl : Win32.Windef.HWND;
      cchMax  : Win32.INT);

   function Edit_GetLineCount
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   procedure Edit_GetLine
     (hwndCtl : Win32.Windef.HWND;
      line    : Win32.INT;
      lpch    : in out Win32.PCHAR;
      cchMax  : Win32.Size_T;
      cch     : out Win32.INT);

   procedure Edit_GetRect
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT);

   procedure Edit_SetRect
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT);

   procedure Edit_SetRectNoPaint
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT);

   function Edit_GetSel (hwndCtl : Win32.Windef.HWND) return Win32.DWORD;

   procedure Edit_SetSel
     (hwndCtl  : Win32.Windef.HWND;
      ichStart : Win32.INT;
      ichEnd   : Win32.INT);

   procedure Edit_ReplaceSel
     (hwndCtl     : Win32.Windef.HWND;
      lpszReplace : Win32.Winnt.LPCTSTR);

   function Edit_GetModify (hwndCtl : Win32.Windef.HWND) return Win32.BOOL;
   procedure Edit_SetModify
     (hwndCtl   : Win32.Windef.HWND;
      fModified : Win32.BOOL);
   function Edit_ScrollCaret
     (hwndCtl : Win32.Windef.HWND)
      return Win32.BOOL;
   function Edit_LineFromChar
     (hwndCtl : Win32.Windef.HWND;
      ich     : Win32.INT)
      return Win32.INT;

   function Edit_LineIndex
     (hwndCtl : Win32.Windef.HWND;
      line    : Win32.INT)
      return Win32.INT;

   function Edit_LineLength
     (hwndCtl : Win32.Windef.HWND;
      line    : Win32.INT)
      return Win32.INT;

   procedure Edit_Scroll
     (hwndCtl : Win32.Windef.HWND;
      dv      : Win32.INT;
      dh      : Win32.INT);

   function Edit_CanUndo (hwndCtl : Win32.Windef.HWND) return Win32.BOOL;
   function Edit_Undo (hwndCtl : Win32.Windef.HWND) return Win32.BOOL;
   procedure Edit_EmptyUndoBuffer (hwndCtl : Win32.Windef.HWND);

   procedure Edit_SetPasswordChar
     (hwndCtl : Win32.Windef.HWND;
      ch      : Win32.CHAR);

   procedure Edit_SetTabStops
     (hwndCtl : Win32.Windef.HWND;
      cTabs   : Win32.INT;
      lpTabs  : Win32.LPWORD);

   function Edit_FmtLines
     (hwndCtl : Win32.Windef.HWND;
      fAddEOL : Win32.BOOL)
      return Win32.BOOL;

   function Edit_GetHandle
     (hwndCtl : Win32.Windef.HWND)
      return Win32.Windef.HLOCAL;

   procedure Edit_SetHandle
     (hwndCtl : Win32.Windef.HWND;
      h       : Win32.Windef.HLOCAL);

   function Edit_GetFirstVisibleLine
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function Edit_SetReadOnly
     (hwndCtl   : Win32.Windef.HWND;
      fReadOnly : Win32.BOOL)
      return Win32.BOOL;

   function Edit_GetPasswordChar
     (hwndCtl : Win32.Windef.HWND)
      return Win32.TCHAR;

   procedure Edit_SetWordBreakProc
     (hwndCtl       : Win32.Windef.HWND;
      lpfnWordBreak : Win32.Winuser.EDITWORDBREAKPROC);

   function Edit_GetWordBreakProc
     (hwndCtl : Win32.Windef.HWND)
      return Win32.Winuser.EDITWORDBREAKPROC;

   function ScrollBar_Enable
     (hwndCtl : Win32.Windef.HWND;
      flags   : Win32.UINT)
      return Win32.BOOL;

   function ScrollBar_Show
     (hwndCtl : Win32.Windef.HWND;
      fShow   : Win32.BOOL)
      return Win32.BOOL;
   nCmdShow : Win32.INT;

   function ScrollBar_SetPos
     (hwndCtl : Win32.Windef.HWND;
      pos     : Win32.INT;
      fRedraw : Win32.BOOL)
      return Win32.INT;

   function ScrollBar_GetPos (hwndCtl : Win32.Windef.HWND) return Win32.INT;

   function ScrollBar_SetRange
     (hwndCtl : Win32.Windef.HWND;
      posMin  : Win32.INT;
      posMax  : Win32.INT;
      fRedraw : Win32.BOOL)
      return Win32.BOOL;

   function ScrollBar_GetRange
     (hwndCtl  : Win32.Windef.HWND;
      lpposMin : Win32.LPINT;
      lpposMax : Win32.LPINT)
      return Win32.BOOL;

   function ListBox_Enable
     (hwndCtl : Win32.Windef.HWND;
      fEnable : Win32.BOOL)
      return Win32.BOOL;

   function ListBox_GetCount (hwndCtl : Win32.Windef.HWND) return Win32.INT;

   function ListBox_ResetContent
     (hwndCtl : Win32.Windef.HWND)
      return Win32.BOOL;

   function ListBox_AddString
     (hwndCtl : Win32.Windef.HWND;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_InsertString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_AddItemData
     (hwndCtl : Win32.Windef.HWND;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_InsertItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_DeleteString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ListBox_GetTextLen
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ListBox_GetText
     (hwndCtl    : Win32.Windef.HWND;
      index      : Win32.INT;
      lpszBuffer : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_GetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.LRESULT;

   function ListBox_SetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.DWORD)
      return Win32.INT;

   function ListBox_FindString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_FindItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_SetSel
     (hwndCtl : Win32.Windef.HWND;
      fSelect : Win32.BOOL;
      index   : Win32.UINT)
      return Win32.INT;

   function ListBox_SelItemRange
     (hwndCtl : Win32.Windef.HWND;
      fSelect : Win32.BOOL;
      first   : Win32.WORD;
      last    : Win32.WORD)
      return Win32.INT;

   function ListBox_GetCurSel
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ListBox_SetCurSel
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ListBox_SelectString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.LPCSTR)
      return Win32.INT;

   function ListBox_SelectItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.LPCSTR)
      return Win32.INT;

   function ListBox_GetSel
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ListBox_GetSelCount
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ListBox_GetTopIndex
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ListBox_GetSelItems
     (hwndCtl : Win32.Windef.HWND;
      cItems  : Win32.INT;
      lpItems : Win32.LPINT)
      return Win32.INT;

   function ListBox_SetTopIndex
     (hwndCtl  : Win32.Windef.HWND;
      indexTop : Win32.INT)
      return Win32.INT;

   procedure ListBox_SetColumnWidth
     (hwndCtl  : Win32.Windef.HWND;
      cxColumn : Win32.INT);

   function ListBox_GetHorizontalExtent
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   procedure ListBox_SetHorizontalExtent
     (hwndCtl  : Win32.Windef.HWND;
      cxExtent : Win32.INT);

   function ListBox_SetTabStops
     (hwndCtl : Win32.Windef.HWND;
      cTabs   : Win32.INT;
      lpTabs  : Win32.LPINT)
      return Win32.BOOL;

   function ListBox_GetItemRect
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      lprc    : Win32.Windef.LPRECT)
      return Win32.INT;

   function ListBox_SetCaretIndex
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ListBox_GetCaretIndex
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ListBox_FindStringExact
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ListBox_SetItemHeight
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      cy      : Win32.INT)
      return Win32.INT;

   function ListBox_GetItemHeight
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ListBox_Dir
     (hwndCtl      : Win32.Windef.HWND;
      attrs        : Win32.UINT;
      lpszFileSpec : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_Enable
     (hwndCtl : Win32.Windef.HWND;
      fEnable : Win32.BOOL)
      return Win32.BOOL renames Win32.Winuser.EnableWindow;

   function ComboBox_GetText
     (hWnd      : Win32.Windef.HWND;
      lpString  : Win32.LPSTR;
      nMaxCount : Win32.INT)
      return Win32.INT renames Win32.Winuser.GetWindowText;

   function ComboBox_GetTextLength
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT renames Win32.Winuser.GetWindowTextLength;

   function ComboBox_SetText
     (hwndCtl : Win32.Windef.HWND;
      lpsz    : Win32.LPCSTR)
      return Win32.BOOL renames Win32.Winuser.SetWindowText;

   function ComboBox_LimitText
     (hwndCtl  : Win32.Windef.HWND;
      cchLimit : Win32.INT)
      return Win32.INT;

   function ComboBox_GetEditSel
     (hwndCtl : Win32.Windef.HWND)
      return Win32.DWORD;

   function ComboBox_SetEditSel
     (hwndCtl  : Win32.Windef.HWND;
      ichStart : Win32.INT;
      ichEnd   : Win32.INT)
      return Win32.INT;

   function ComboBox_GetCount
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ComboBox_ResetContent
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ComboBox_AddString
     (hwndCtl : Win32.Windef.HWND;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_InsertString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_AddItemData
     (hwndCtl : Win32.Windef.HWND;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_InsertItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_DeleteString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ComboBox_GetLBTextLen
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ComboBox_GetLBText
     (hwndCtl    : Win32.Windef.HWND;
      index      : Win32.INT;
      lpszBuffer : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_GetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.LRESULT;

   function ComboBox_SetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.DWORD)
      return Win32.INT;

   function ComboBox_FindString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_FindItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_GetCurSel
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ComboBox_SetCurSel
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT;

   function ComboBox_SelectString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszSelect : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_SelectItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.LPCSTR)
      return Win32.INT;

   function ComboBox_Dir
     (hwndCtl      : Win32.Windef.HWND;
      attrs        : Win32.UINT;
      lpszFileSpec : Win32.Winnt.LPCTSTR)
      return Win32.INT;

   function ComboBox_ShowDropdown
     (hwndCtl : Win32.Windef.HWND;
      fShow   : Win32.BOOL)
      return Win32.BOOL;

   function ComboBox_FindStringExact
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.LPCSTR)
      return Win32.INT;

   function ComboBox_GetDroppedState
     (hwndCtl : Win32.Windef.HWND)
      return Win32.BOOL;

   procedure ComboBox_GetDroppedControlRect
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT);

   function ComboBox_GetItemHeight
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT;

   function ComboBox_SetItemHeight
     (hwndCtl : Win32.Windef.HWND;
      cyItem  : Win32.INT;
      index   : Win32.INT)
      return Win32.INT;

   function ComboBox_GetExtendedUI
     (hwndCtl : Win32.Windef.HWND)
      return Win32.UINT;

   function ComboBox_SetExtendedUI
     (hwndCtl : Win32.Windef.HWND;
      flags   : Win32.BOOL)
      return Win32.INT;

   function GET_WPARAM
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WPARAM;

   function GET_LPARAM
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.LPARAM;

   function GET_WM_ACTIVATE_STATE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_ACTIVATE_FMINIMIZED
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.BOOL;

   function GET_WM_ACTIVATE_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_ACTIVATE_MPS
     (s    : Win32.WORD;
      fmin : Win32.BOOL;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG;

   function GET_WM_CHARTOITEM_CHAR
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.TCHAR;

   function GET_WM_CHARTOITEM_POS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_CHARTOITEM_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_CHARTOITEM_MPS
     (ch   : Win32.TCHAR;
      pos  : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG;

   function GET_WM_COMMAND_ID
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_COMMAND_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_COMMAND_CMD
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_COMMAND_MPS
     (id   : Win32.WORD;
      hwnd : Win32.Windef.HWND;
      cmd  : Win32.WORD)
      return Win32.LONG;

   function GET_WM_CTLCOLOR_HDC
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM;
      msg  : Win32.UINT)
      return Win32.Windef.HDC;

   function GET_WM_CTLCOLOR_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM;
      msg  : Win32.UINT)
      return Win32.Windef.HWND;

   function GET_WM_CTLCOLOR_TYPE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM;
      msg  : Win32.UINT)
      return Win32.WORD;

   function GET_WM_CTLCOLOR_MSG (the_type : Win32.UINT) return Win32.WORD;

   function GET_WM_CTLCOLOR_MPS
     (hdc      : Win32.Windef.HDC;
      hwnd     : Win32.Windef.HWND;
      the_type : Win32.UINT)
      return Win32.LONG;

   function GET_WM_MENUSELECT_CMD
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_MENUSELECT_FLAGS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.UINT;

   function GET_WM_MENUSELECT_HMENU
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HMENU;

   function GET_WM_MENUSELECT_MPS
     (cmd   : Win32.WORD;
      f     : Win32.UINT;
      hmenu : Win32.Windef.HMENU)
      return Win32.LONG;

   function GET_WM_MDIACTIVATE_FACTIVATE
     (hwnd : Win32.Windef.HWND;
      wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.BOOL;

   function GET_WM_MDIACTIVATE_HWNDDEACT
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;
   function GET_WM_MDIACTIVATE_HWNDACTIVATE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_MDIACTIVATE_MPS
     (f     : Win32.BOOL;
      hwndD : Win32.Windef.HWND;
      hwndA : Win32.Windef.HWND)
      return Win32.LONG;

   function GET_WM_MDISETMENU_MPS
     (hmenuF : Win32.Windef.HMENU;
      hmenuW : Win32.Windef.HMENU)
      return Win32.LONG;

   function GET_WM_MENUCHAR_CHAR
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.TCHAR;

   function GET_WM_MENUCHAR_HMENU
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HMENU;

   function GET_WM_MENUCHAR_FMENU
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.BOOL;
   function GET_WM_MENUCHAR_MPS
     (ch    : Win32.TCHAR;
      hmenu : Win32.Windef.HMENU;
      f     : Win32.BOOL)
      return Win32.LONG;

   function GET_WM_PARENTNOTIFY_MSG
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_PARENTNOTIFY_ID
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_PARENTNOTIFY_HWNDCHILD
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_PARENTNOTIFY_X
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT;

   function GET_WM_PARENTNOTIFY_Y
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT;

   function GET_WM_PARENTNOTIFY_MPS
     (msg  : Win32.WORD;
      id   : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG;

   function GET_WM_PARENTNOTIFY2_MPS
     (msg  : Win32.WORD;
      x    : Win32.INT;
      y    : Win32.INT)
      return Win32.DWORD;

   function GET_WM_VKEYTOITEM_CODE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT;

   function GET_WM_VKEYTOITEM_ITEM
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_VKEYTOITEM_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_VKEYTOITEM_MPS
     (code : Win32.INT;
      item : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG;

   function GET_EM_SETSEL_START
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT;

   function GET_EM_SETSEL_END
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.LPARAM;

   function GET_EM_SETSEL_MPS
     (iStart : Win32.UINT;
      iEnd   : Win32.UINT)
      return Win32.LONG;

   function GET_EM_LINESCROLL_MPS
     (vert : Win32.UINT;
      horz : Win32.UINT)
      return Win32.LONG;

   function GET_WM_CHANGECBCHAIN_HWNDNEXT
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;
   function GET_WM_HSCROLL_CODE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_HSCROLL_POS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_HSCROLL_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_HSCROLL_MPS
     (code : Win32.WORD;
      pos  : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG;

   function GET_WM_VSCROLL_CODE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_VSCROLL_POS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD;

   function GET_WM_VSCROLL_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND;

   function GET_WM_VSCROLL_MPS
     (code : Win32.WORD;
      pos  : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG;

end Win32.Windowsx;
