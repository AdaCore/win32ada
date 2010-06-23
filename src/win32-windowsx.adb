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

with Ada.Unchecked_Conversion;
with Interfaces.C;
with Win32.Utils;
with Win32.Winbase;
with Win32.Wingdi;

package body Win32.Windowsx is

   pragma Warnings (Off);

   use type Interfaces.C.int;
   use type Interfaces.C.long;
   use type Interfaces.C.short;

   function LOCHAR (wp : Win32.WPARAM) return Win32.TCHAR;
   function LOCHAR (wp : Win32.WPARAM) return Win32.TCHAR is
      function To_TCHAR is new Ada.Unchecked_Conversion (
         Win32.BYTE,
         Win32.TCHAR);
   begin
      return To_TCHAR
               (Win32.Utils.LOBYTE (Win32.Utils.LOWORD (Win32.DWORD (wp))));
   end LOCHAR;

   function GetInstanceModule
     (hInstance : Win32.Windef.HMODULE)
      return Win32.Windef.HMODULE
   is
   begin
      return Win32.Windef.HMODULE (hInstance);
   end GetInstanceModule;

   function GlobalPtrHandle
     (lp   : Win32.LPCVOID)
      return Win32.Windef.HGLOBAL
   is
   begin
      return Win32.Winbase.GlobalHandle (lp);
   end GlobalPtrHandle;

   function GlobalLockPtr (lp : Win32.LPCVOID) return Win32.BOOL is
      function To_BOOL is new Ada.Unchecked_Conversion (
         Win32.LPVOID,
         Win32.BOOL);
   begin
      return To_BOOL (Win32.Winbase.GlobalLock (GlobalPtrHandle (lp)));
   end GlobalLockPtr;

   function GlobalUnlockPtr (lp : Win32.LPCVOID) return Win32.BOOL is
   begin
      return Win32.Winbase.GlobalUnlock (GlobalPtrHandle (lp));
   end GlobalUnlockPtr;

   function GlobalAllocPtr
     (flags : Win32.UINT;
      cb    : Win32.DWORD)
      return Win32.LPVOID
   is
   begin
      return Win32.Winbase.GlobalLock (Win32.Winbase.GlobalAlloc (flags, cb));
   end GlobalAllocPtr;

   function GlobalReAllocPtr
     (lp    : Win32.LPCVOID;
      cbNew : Win32.DWORD;
      flags : Win32.UINT)
      return Win32.LPVOID
   is
      garbage : Win32.BOOL;
   begin
      garbage := GlobalUnlockPtr (lp);
      return Win32.Winbase.GlobalLock
               (Win32.Winbase.GlobalReAlloc
                   (GlobalPtrHandle (lp),
                    cbNew,
                    flags));
   end GlobalReAllocPtr;

   function GlobalFreePtr (lp : Win32.LPCVOID) return Win32.BOOL is
      function To_BOOL is new Ada.Unchecked_Conversion (
         Win32.Windef.HGLOBAL,
         Win32.BOOL);
      garbage : Win32.BOOL;
   begin
      garbage := GlobalUnlockPtr (lp);
      return To_BOOL (Win32.Winbase.GlobalFree (GlobalPtrHandle (lp)));
   end GlobalFreePtr;

   function DeletePen (hpen : Win32.Windef.HPEN) return Win32.BOOL is
   begin
      return Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hpen));
   end DeletePen;

   function SelectPen
     (hdc  : Win32.Windef.HDC;
      hpen : Win32.Windef.HPEN)
      return Win32.Windef.HPEN
   is
   begin
      return Win32.Windef.HPEN (Win32.Wingdi.SelectObject
                                   (hdc,
                                    Win32.Windef.HGDIOBJ (hpen)));
   end SelectPen;

   function GetStockPen (i : Win32.INT) return Win32.Windef.HPEN is
   begin
      return Win32.Windef.HPEN (Win32.Wingdi.GetStockObject (i));
   end GetStockPen;

   function DeleteBrush (hbr : Win32.Windef.HBRUSH) return Win32.BOOL is
   begin
      return Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hbr));
   end DeleteBrush;

   function SelectBrush
     (hdc  : Win32.Windef.HDC;
      hbr  : Win32.Windef.HBRUSH)
      return Win32.Windef.HBRUSH
   is
   begin
      return Win32.Windef.HBRUSH (Win32.Wingdi.SelectObject
                                     (hdc,
                                      Win32.Windef.HGDIOBJ (hbr)));
   end SelectBrush;

   function GetStockBrush (i : Win32.INT) return Win32.Windef.HBRUSH is
   begin
      return Win32.Windef.HBRUSH (Win32.Wingdi.GetStockObject (i));
   end GetStockBrush;

   function DeleteRgn (hrgn : Win32.Windef.HRGN) return Win32.BOOL is
   begin
      return Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hrgn));
   end DeleteRgn;

   function CopyRgn
     (hrgnDst : Win32.Windef.HRGN;
      hrgnSrc : Win32.Windef.HRGN)
      return Win32.INT
   is
      function To_HRGN is new Ada.Unchecked_Conversion (
         Integer,
         Win32.Windef.HRGN);
   begin
      return Win32.Wingdi.CombineRgn
               (hrgnDst,
                hrgnSrc,
                To_HRGN (0),
                Win32.Wingdi.RGN_COPY);
   end CopyRgn;

   function IntersectRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT
   is
   begin
      return Win32.Wingdi.CombineRgn
               (hrgnResult,
                hrgnA,
                hrgnB,
                Win32.Wingdi.RGN_AND);
   end IntersectRgn;

   function SubtractRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT
   is
   begin
      return Win32.Wingdi.CombineRgn
               (hrgnResult,
                hrgnA,
                hrgnB,
                Win32.Wingdi.RGN_DIFF);
   end SubtractRgn;

   function UnionRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT
   is
   begin
      return Win32.Wingdi.CombineRgn
               (hrgnResult,
                hrgnA,
                hrgnB,
                Win32.Wingdi.RGN_OR);
   end UnionRgn;

   function XorRgn
     (hrgnResult : Win32.Windef.HRGN;
      hrgnA      : Win32.Windef.HRGN;
      hrgnB      : Win32.Windef.HRGN)
      return Win32.INT
   is
   begin
      return Win32.Wingdi.CombineRgn
               (hrgnResult,
                hrgnA,
                hrgnB,
                Win32.Wingdi.RGN_XOR);
   end XorRgn;

   function DeletePalette (hpal : Win32.Windef.HPALETTE) return Win32.BOOL is
   begin
      return Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hpal));
   end DeletePalette;

   function DeleteFont (hfont : Win32.Windef.HFONT) return Win32.BOOL is
   begin
      return Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hfont));
   end DeleteFont;

   function SelectFont
     (hdc   : Win32.Windef.HDC;
      hfont : Win32.Windef.HFONT)
      return Win32.Windef.HFONT
   is
   begin
      return Win32.Windef.HFONT (Win32.Wingdi.SelectObject
                                    (hdc,
                                     Win32.Windef.HGDIOBJ (hfont)));
   end SelectFont;

   function GetStockFont (i : Win32.INT) return Win32.Windef.HFONT is
   begin
      return Win32.Windef.HFONT (Win32.Wingdi.GetStockObject (i));
   end GetStockFont;

   function DeleteBitmap (hbm : Win32.Windef.HBITMAP) return Win32.BOOL is
   begin
      return Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hbm));
   end DeleteBitmap;

   function SelectBitmap
     (hdc  : Win32.Windef.HDC;
      hbm  : Win32.Windef.HBITMAP)
      return Win32.Windef.HBITMAP
   is
   begin
      return Win32.Windef.HBITMAP (Win32.Wingdi.SelectObject
                                      (hdc,
                                       Win32.Windef.HGDIOBJ (hbm)));
   end SelectBitmap;

   function InsetRect
     (lprc : Win32.Windef.LPRECT;
      dx   : Win32.INT;
      dy   : Win32.INT)
      return Win32.BOOL
   is
      use Interfaces.C;
   begin
      return Win32.Winuser.InflateRect (lprc, -dx, -dy);
   end InsetRect;

   function GetWindowInstance
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HMODULE
   is
      function To_HMODULE is new Ada.Unchecked_Conversion (
         Win32.LONG,
         Win32.Windef.HMODULE);
   begin
      return To_HMODULE
               (Win32.Winuser.GetWindowLong
                   (hwnd,
                    Win32.Winuser.GWL_HINSTANCE));
   end GetWindowInstance;

   function GetWindowStyle (hwnd : Win32.Windef.HWND) return Win32.DWORD is
   begin
      return Win32.DWORD (Win32.Winuser.GetWindowLong
                             (hwnd,
                              Win32.Winuser.GWL_STYLE));
   end GetWindowStyle;

   function GetWindowExStyle (hwnd : Win32.Windef.HWND) return Win32.DWORD is
   begin
      return Win32.DWORD (Win32.Winuser.GetWindowLong
                             (hwnd,
                              Win32.Winuser.GWL_EXSTYLE));
   end GetWindowExStyle;

   function GetWindowOwner
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND
   is
   begin
      return Win32.Winuser.GetWindow (hwnd, Win32.Winuser.GW_OWNER);
   end GetWindowOwner;

   function GetFirstSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND
   is
   begin
      return Win32.Winuser.GetWindow (hwnd, Win32.Winuser.GW_HWNDFIRST);
   end GetFirstSibling;

   function GetLastSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND
   is
   begin
      return Win32.Winuser.GetWindow (hwnd, Win32.Winuser.GW_HWNDLAST);
   end GetLastSibling;

   function GetNextSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND
   is
   begin
      return Win32.Winuser.GetWindow (hwnd, Win32.Winuser.GW_HWNDNEXT);
   end GetNextSibling;

   function GetPrevSibling
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HWND
   is
   begin
      return Win32.Winuser.GetWindow (hwnd, Win32.Winuser.GW_HWNDPREV);
   end GetPrevSibling;

   procedure SetWindowRedraw
     (hwnd    : Win32.Windef.HWND;
      fRedraw : Win32.BOOL)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwnd,
            Win32.Winuser.WM_SETREDRAW,
            Win32.WPARAM (fRedraw),
            0);
   end SetWindowRedraw;

   function SubclassWindow
     (hwnd : Win32.Windef.HWND;
      lpfn : Win32.Windef.FARPROC)
      return Win32.Winuser.WNDPROC
   is
      function To_WNDPROC is new Ada.Unchecked_Conversion (
         Win32.LONG_PTR,
         Win32.Winuser.WNDPROC);
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Windef.FARPROC,
         Win32.LPARAM);
   begin
      return To_WNDPROC
               (Win32.Winuser.SetWindowLongPtr
                   (hwnd,
                    Win32.Winuser.GWL_WNDPROC,
                    To_LPARAM (lpfn)));
   end SubclassWindow;

   function IsRestored (hwnd : Win32.Windef.HWND) return Win32.BOOL is
      use Interfaces.C;
   begin
      if ((GetWindowStyle (hwnd) and
           (Win32.Winuser.WS_MINIMIZE or Win32.Winuser.WS_MAXIMIZE)) =
          0)
      then
         return Win32.TRUE;
      else
         return Win32.FALSE;
      end if;
   end IsRestored;

   function MapWindowRect
     (hwndFrom : Win32.Windef.HWND;
      hwndTo   : Win32.Windef.HWND;
      lprc     : Win32.Windef.LPPOINT)
      return Win32.INT
   is
   begin
      return Win32.Winuser.MapWindowPoints (hwndFrom, hwndTo, lprc, 2);
   end MapWindowRect;

   function IsLButtonDown return Win32.BOOL is
   begin
      if (Win32.Winuser.GetKeyState (Win32.Winuser.VK_LBUTTON) < 0) then
         return 1;
      else
         return 0;
      end if;
   end IsLButtonDown;

   function IsRButtonDown return Win32.BOOL is
   begin
      if (Win32.Winuser.GetKeyState (Win32.Winuser.VK_RBUTTON) < 0) then
         return 1;
      else
         return 0;
      end if;
   end IsRButtonDown;

   function IsMButtonDown return Win32.BOOL is
   begin
      if (Win32.Winuser.GetKeyState (Win32.Winuser.VK_MBUTTON) < 0) then
         return 1;
      else
         return 0;
      end if;
   end IsMButtonDown;

   function SubclassDialog
     (hwndDlg : Win32.Windef.HWND;
      lpfn    : Win32.Winuser.DLGPROC)
      return Win32.Winuser.DLGPROC
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winuser.DLGPROC,
         Win32.LPARAM);
      function To_DLGPROC is new Ada.Unchecked_Conversion (
         Win32.LONG_PTR,
         Win32.Winuser.DLGPROC);
   begin
      return To_DLGPROC
               (Win32.Winuser.SetWindowLongPtr
                   (hwndDlg,
                    Win32.Winuser.DWL_DLGPROC,
                    To_LPARAM (lpfn)));
   end SubclassDialog;

   function SetDlgMsgResult
     (hwnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      result : Win32.LRESULT)
      return Win32.BOOL
   is
      use Win32.Winuser;
      garbage : Win32.LONG_PTR;
   begin
      case msg is
         when WM_CTLCOLORMSGBOX    |
              WM_CTLCOLOREDIT      |
              WM_CTLCOLORLISTBOX   |
              WM_CTLCOLORBTN       |
              WM_CTLCOLORDLG       |
              WM_CTLCOLORSCROLLBAR |
              WM_CTLCOLORSTATIC    |
              WM_COMPAREITEM       |
              WM_VKEYTOITEM        |
              WM_CHARTOITEM        |
              WM_QUERYDRAGICON     |
              WM_INITDIALOG        =>
            return Win32.BOOL (result);
         when others =>
            garbage :=
               SetWindowLongPtr
                 (hwnd,
                  DWL_MSGRESULT,
                  Win32.LPARAM (Win32.LRESULT (result)));
            return Win32.TRUE;
      end case;
   end SetDlgMsgResult;

   function DefDlgProcEx
     (hwnd        : Win32.Windef.HWND;
      msg         : Win32.UINT;
      wParam      : Win32.WPARAM;
      lParam      : Win32.LPARAM;
      pfRecursion : Win32.LPBOOL)
      return Win32.LRESULT
   is
   begin
      pfRecursion.all := Win32.TRUE;
      return Win32.Winuser.DefDlgProc (hwnd, msg, wParam, lParam);
   end DefDlgProcEx;

   function To_LRESULT is new Ada.Unchecked_Conversion (
      Win32.UINT,
      Win32.LRESULT);
   function To_LRESULT is new Ada.Unchecked_Conversion (
      Win32.DWORD,
      Win32.LRESULT);

   function To_HDC is new Ada.Unchecked_Conversion (
      Win32.WPARAM,
      Win32.Windef.HDC);
   function HDC_To_DWORD is new Ada.Unchecked_Conversion (
      Win32.Windef.HDC,
      Win32.DWORD);

   function To_HWND is new Ada.Unchecked_Conversion (
      Win32.WPARAM,
      Win32.Windef.HWND);
   function To_HWND is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.Windef.HWND);
   function To_HWND is new Ada.Unchecked_Conversion (
      Win32.DWORD,
      Win32.Windef.HWND);

   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.Windef.HWND,
      LPARAM);
   function HMENU_To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.Windef.HMENU,
      LPARAM);

   function HANDLE_WM_COMPACTING
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMPACTINGPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_COMPACTING;

   procedure FORWARD_WM_COMPACTING
     (hwnd         : Win32.Windef.HWND;
      compactRatio : Win32.UINT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_COMPACTING,
            Win32.WPARAM (compactRatio),
            0);
   end FORWARD_WM_COMPACTING;

   function To_LPCTSTR is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.Winnt.LPCTSTR);

   function HANDLE_WM_WININICHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPWININICHANGEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_LPCTSTR (lParam));
      return 0;
   end HANDLE_WM_WININICHANGE;

   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.LPCSTR,
      Win32.LPARAM);

   procedure FORWARD_WM_WININICHANGE
     (hwnd            : Win32.Windef.HWND;
      lpszSectionName : Win32.Winnt.LPCTSTR;
      fn              : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_WININICHANGE,
            0,
            To_LPARAM (lpszSectionName));
   end FORWARD_WM_WININICHANGE;

   function HANDLE_WM_SYSCOLORCHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSCOLORCHANGEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_SYSCOLORCHANGE;

   procedure FORWARD_WM_SYSCOLORCHANGE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_SYSCOLORCHANGE, 0, 0);
   end FORWARD_WM_SYSCOLORCHANGE;

   function HANDLE_WM_QUERYNEWPALETTE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYNEWPALETTEFN)
      return Win32.LRESULT
   is
   begin
      return Win32.Winuser.MAKELRESULT (Win32.WORD (fn (hwnd)), 0);
   end HANDLE_WM_QUERYNEWPALETTE;

   function FORWARD_WM_QUERYNEWPALETTE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_QUERYNEWPALETTE,
                                          0,
                                          0)));
   end FORWARD_WM_QUERYNEWPALETTE;

   function To_DWORD is new Ada.Unchecked_Conversion (
      Win32.Windef.HWND,
      Win32.DWORD);

   function HANDLE_WM_PALETTEISCHANGING
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPALETTEISCHANGINGPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam));
      return 0;
   end HANDLE_WM_PALETTEISCHANGING;

   procedure FORWARD_WM_PALETTEISCHANGING
     (hwnd              : Win32.Windef.HWND;
      hwndPaletteChange : Win32.Windef.HWND;
      fn                : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_PALETTEISCHANGING,
            Win32.WPARAM (To_DWORD (hwndPaletteChange)),
            0);
   end FORWARD_WM_PALETTEISCHANGING;

   function HANDLE_WM_PALETTECHANGED
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPALETTECHANGEDPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam));
      return 0;
   end HANDLE_WM_PALETTECHANGED;

   procedure FORWARD_WM_PALETTECHANGED
     (hwnd              : Win32.Windef.HWND;
      hwndPaletteChange : Win32.Windef.HWND;
      fn                : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_PALETTECHANGED,
            Win32.WPARAM (To_DWORD (hwndPaletteChange)),
            0);
   end FORWARD_WM_PALETTECHANGED;

   function HANDLE_WM_FONTCHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPFONTCHANGEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_FONTCHANGE;

   procedure FORWARD_WM_FONTCHANGE (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_FONTCHANGE, 0, 0);
   end FORWARD_WM_FONTCHANGE;

   function HANDLE_WM_SPOOLERSTATUS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSPOOLERSTATUSPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (wParam),
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_SPOOLERSTATUS;

   procedure FORWARD_WM_SPOOLERSTATUS
     (hwnd        : Win32.Windef.HWND;
      status      : Win32.UINT;
      cJobInQueue : Win32.INT;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SPOOLERSTATUS,
            Win32.WPARAM (status),
            Win32.Winuser.MAKELPARAM (Win32.WORD (cJobInQueue), 0));
   end FORWARD_WM_SPOOLERSTATUS;

   function HANDLE_WM_DEVMODECHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDEVMODECHANGEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_LPCTSTR (lParam));
      return 0;
   end HANDLE_WM_DEVMODECHANGE;

   procedure FORWARD_WM_DEVMODECHANGE
     (hwnd           : Win32.Windef.HWND;
      lpszDeviceName : Win32.Winnt.LPCTSTR;
      fn             : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_DEVMODECHANGE,
            0,
            To_LPARAM (lpszDeviceName));
   end FORWARD_WM_DEVMODECHANGE;

   function HANDLE_WM_TIMECHANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPTIMECHANGEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_TIMECHANGE;

   procedure FORWARD_WM_TIMECHANGE (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_TIMECHANGE, 0, 0);
   end FORWARD_WM_TIMECHANGE;

   function HANDLE_WM_POWER
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPOWERPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.INT (wParam));
      return 0;
   end HANDLE_WM_POWER;

   procedure FORWARD_WM_POWER
     (hwnd : Win32.Windef.HWND;
      code : Win32.INT;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_POWER, Win32.WPARAM (code), 0);
   end FORWARD_WM_POWER;

   function HANDLE_WM_QUERYENDSESSION
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYENDSESSIONFN)
      return Win32.LRESULT
   is
   begin
      return Win32.Winuser.MAKELRESULT
               (Win32.WORD (Win32.BOOL (fn (hwnd))),
                0);
   end HANDLE_WM_QUERYENDSESSION;

   function FORWARD_WM_QUERYENDSESSION
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_QUERYENDSESSION,
                                          0,
                                          0)));
   end FORWARD_WM_QUERYENDSESSION;

   function HANDLE_WM_ENDSESSION
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPENDSESSIONPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.BOOL (wParam));
      return 0;
   end HANDLE_WM_ENDSESSION;

   procedure FORWARD_WM_ENDSESSION
     (hwnd    : Win32.Windef.HWND;
      fEnding : Win32.BOOL;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn (hwnd, Win32.Winuser.WM_ENDSESSION, Win32.WPARAM (fEnding), 0);
   end FORWARD_WM_ENDSESSION;

   function HANDLE_WM_QUIT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUITPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.INT (wParam));
      return 0;
   end HANDLE_WM_QUIT;

   procedure FORWARD_WM_QUIT
     (hwnd     : Win32.Windef.HWND;
      exitCode : Win32.INT;
      fn       : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn (hwnd, Win32.Winuser.WM_QUIT, Win32.WPARAM (exitCode), 0);
   end FORWARD_WM_QUIT;

   function To_LPCREATESTRUCT is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.Winuser.LPCREATESTRUCT);

   function HANDLE_WM_CREATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCREATEFN)
      return Win32.LRESULT
   is
      use type Interfaces.C.ptrdiff_t;
      function To_LRESULT is new Ada.Unchecked_Conversion (
         Interfaces.C.ptrdiff_t,
         LRESULT);
      res : Win32.BOOL;
      mone : constant Interfaces.C.ptrdiff_t := -1;
   begin
      res := fn (hwnd, To_LPCREATESTRUCT (lParam));
      if (res = 0) then
         return 0;
      else
         return To_LRESULT (mone);
      end if;
   end HANDLE_WM_CREATE;

   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.Winuser.LPCREATESTRUCT,
      Win32.LPARAM);

   function FORWARD_WM_CREATE
     (hwnd           : Win32.Windef.HWND;
      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT;
      fn             : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_CREATE,
                                          0,
                                          To_LPARAM (lpCreateStruct))));
   end FORWARD_WM_CREATE;

   function HANDLE_WM_NCCREATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCCREATEFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (fn (hwnd, To_LPCREATESTRUCT (lParam))));
   end HANDLE_WM_NCCREATE;

   function FORWARD_WM_NCCREATE
     (hwnd           : Win32.Windef.HWND;
      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT;
      fn             : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_NCCREATE,
                                          0,
                                          To_LPARAM (lpCreateStruct))));
   end FORWARD_WM_NCCREATE;

   function HANDLE_WM_DESTROY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDESTROYPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_DESTROY;

   procedure FORWARD_WM_DESTROY (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_DESTROY, 0, 0);
   end FORWARD_WM_DESTROY;

   function HANDLE_WM_NCDESTROY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCDESTROYPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_NCDESTROY;

   procedure FORWARD_WM_NCDESTROY (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_NCDESTROY, 0, 0);
   end FORWARD_WM_NCDESTROY;

   function HANDLE_WM_SHOWWINDOW
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSHOWWINDOWPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.BOOL (wParam), Win32.UINT (lParam));
      return 0;
   end HANDLE_WM_SHOWWINDOW;

   procedure FORWARD_WM_SHOWWINDOW
     (hwnd   : Win32.Windef.HWND;
      fShow  : Win32.BOOL;
      status : Win32.UINT;
      fn     : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SHOWWINDOW,
            Win32.WPARAM (fShow),
            Win32.LPARAM (status));
   end FORWARD_WM_SHOWWINDOW;

   function HANDLE_WM_SETREDRAW
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETREDRAWPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, BOOL (wParam));
      return 0;
   end HANDLE_WM_SETREDRAW;

   procedure FORWARD_WM_SETREDRAW
     (hwnd    : Win32.Windef.HWND;
      fRedraw : Win32.BOOL;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn (hwnd, Win32.Winuser.WM_SETREDRAW, Win32.WPARAM (fRedraw), 0);
   end FORWARD_WM_SETREDRAW;

   function HANDLE_WM_ENABLE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPENABLEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, BOOL (wParam));
      return 0;
   end HANDLE_WM_ENABLE;

   procedure FORWARD_WM_ENABLE
     (hwnd    : Win32.Windef.HWND;
      fEnable : Win32.BOOL;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn (hwnd, Win32.Winuser.WM_ENABLE, Win32.WPARAM (fEnable), 0);
   end FORWARD_WM_ENABLE;

   function To_LPTSTR is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.Winnt.LPTSTR);

   function HANDLE_WM_SETTEXT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETTEXTPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_LPCTSTR (lParam));
      return 0;
   end HANDLE_WM_SETTEXT;

   procedure FORWARD_WM_SETTEXT
     (hwnd     : Win32.Windef.HWND;
      lpszText : Win32.Winnt.LPCTSTR;
      fn       : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn (hwnd, Win32.Winuser.WM_SETTEXT, 0, To_LPARAM (lpszText));
   end FORWARD_WM_SETTEXT;

   function HANDLE_WM_GETTEXT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETTEXTFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (fn
                                (hwnd,
                                 Win32.INT (wParam),
                                 To_LPTSTR (lParam))));
   end HANDLE_WM_GETTEXT;

   function FORWARD_WM_GETTEXT
     (hwnd       : Win32.Windef.HWND;
      cchTextMax : Win32.INT;
      lpszText   : Win32.Winnt.LPTSTR;
      fn         : LPDEFFN)
      return Win32.INT
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winnt.LPTSTR,
         Win32.LPARAM);
   begin
      return Win32.INT (fn
                           (hwnd,
                            Win32.Winuser.WM_GETTEXT,
                            Win32.WPARAM (cchTextMax),
                            To_LPARAM (lpszText)));
   end FORWARD_WM_GETTEXT;

   function HANDLE_WM_GETTEXTLENGTH
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETTEXTLENGTHFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT (Win32.DWORD (fn (hwnd)));
   end HANDLE_WM_GETTEXTLENGTH;

   function FORWARD_WM_GETTEXTLENGTH
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (fn
                                        (hwnd,
                                         Win32.Winuser.WM_GETTEXTLENGTH,
                                         0,
                                         0)));
   end FORWARD_WM_GETTEXTLENGTH;

   function To_LPWINDOWPOS is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.Winuser.LPWINDOWPOS);
   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.Winuser.LPWINDOWPOS,
      Win32.LPARAM);

   function HANDLE_WM_WINDOWPOSCHANGING
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPWINDOWPOSCHANGINGFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT (Win32.DWORD (fn (hwnd, To_LPWINDOWPOS (lParam))));
   end HANDLE_WM_WINDOWPOSCHANGING;

   function FORWARD_WM_WINDOWPOSCHANGING
     (hwnd   : Win32.Windef.HWND;
      lpwpos : Win32.Winuser.LPWINDOWPOS;
      fn     : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_WINDOWPOSCHANGING,
                                          0,
                                          To_LPARAM (lpwpos))));
   end FORWARD_WM_WINDOWPOSCHANGING;

   function To_LPCWINDOWPOS is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      LPCWINDOWPOS);
   function To_LPARAM is new Ada.Unchecked_Conversion (
      LPCWINDOWPOS,
      Win32.LPARAM);

   function HANDLE_WM_WINDOWPOSCHANGED
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPWINDOWPOSCHANGEDPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_LPCWINDOWPOS (lParam));
      return 0;
   end HANDLE_WM_WINDOWPOSCHANGED;

   procedure FORWARD_WM_WINDOWPOSCHANGED
     (hwnd   : Win32.Windef.HWND;
      lpwpos : LPCWINDOWPOS;
      fn     : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn (hwnd, Win32.Winuser.WM_WINDOWPOSCHANGED, 0, To_LPARAM (lpwpos));
   end FORWARD_WM_WINDOWPOSCHANGED;

   function HANDLE_WM_MOVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMOVEPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_MOVE;

   procedure FORWARD_WM_MOVE
     (hwnd : Win32.Windef.HWND;
      x    : Win32.INT;
      y    : Win32.INT;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MOVE,
            0,
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_MOVE;

   function HANDLE_WM_SIZE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSIZEPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (wParam),
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_SIZE;

   procedure FORWARD_WM_SIZE
     (hwnd  : Win32.Windef.HWND;
      state : Win32.UINT;
      cx    : Win32.INT;
      cy    : Win32.INT;
      fn    : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SIZE,
            Win32.WPARAM (state),
            Win32.Winuser.MAKELPARAM (WORD (cx), Win32.WORD (cy)));
   end FORWARD_WM_SIZE;

   function HANDLE_WM_CLOSE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCLOSEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_CLOSE;

   procedure FORWARD_WM_CLOSE (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_CLOSE, 0, 0);
   end FORWARD_WM_CLOSE;

   function HANDLE_WM_QUERYOPEN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYOPENFN)
      return Win32.LRESULT
   is
   begin
      return Win32.Winuser.MAKELRESULT (Win32.WORD (fn (hwnd)), 0);
   end HANDLE_WM_QUERYOPEN;

   function FORWARD_WM_QUERYOPEN
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_QUERYOPEN,
                                          0,
                                          0)));
   end FORWARD_WM_QUERYOPEN;

   function HANDLE_WM_GETMINMAXINFO
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETMINMAXINFOPROC)
      return Win32.LRESULT
   is
      function To_LPMINMAXINFO is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         Win32.Winuser.LPMINMAXINFO);
   begin
      fn (hwnd, To_LPMINMAXINFO (lParam));
      return 0;
   end HANDLE_WM_GETMINMAXINFO;

   procedure FORWARD_WM_GETMINMAXINFO
     (hwnd         : Win32.Windef.HWND;
      lpMinMaxInfo : Win32.Winuser.LPMINMAXINFO;
      fn           : LPDEFFN)
   is

      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winuser.LPMINMAXINFO,
         Win32.LPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_GETMINMAXINFO,
            0,
            To_LPARAM (lpMinMaxInfo));
   end FORWARD_WM_GETMINMAXINFO;

   function HANDLE_WM_PAINT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPAINTPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_PAINT;

   procedure FORWARD_WM_PAINT (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_PAINT, 0, 0);
   end FORWARD_WM_PAINT;

   function HANDLE_WM_ERASEBKGND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPERASEBKGNDFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT (Win32.DWORD (fn (hwnd, To_HDC (wParam))));
   end HANDLE_WM_ERASEBKGND;

   function FORWARD_WM_ERASEBKGND
     (hwnd : Win32.Windef.HWND;
      hdc  : Win32.Windef.HDC;
      fn   : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_ERASEBKGND,
                                          Win32.WPARAM (HDC_To_DWORD (hdc)),
                                          0)));
   end FORWARD_WM_ERASEBKGND;

   function HANDLE_WM_ICONERASEBKGND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPICONERASEBKGNDFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT (Win32.DWORD (fn (hwnd, To_HDC (wParam))));
   end HANDLE_WM_ICONERASEBKGND;

   function FORWARD_WM_ICONERASEBKGND
     (hwnd : Win32.Windef.HWND;
      hdc  : Win32.Windef.HDC;
      fn   : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_ICONERASEBKGND,
                                          Win32.WPARAM (HDC_To_DWORD (hdc)),
                                          0)));
   end FORWARD_WM_ICONERASEBKGND;

   function HANDLE_WM_NCPAINT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCPAINTPROC)
      return Win32.LRESULT
   is
      function To_HRGN is new Ada.Unchecked_Conversion (
         Win32.WPARAM,
         Win32.Windef.HRGN);
   begin
      fn (hwnd, To_HRGN (wParam));
      return 0;
   end HANDLE_WM_NCPAINT;

   procedure FORWARD_WM_NCPAINT
     (hwnd : Win32.Windef.HWND;
      hrgn : Win32.Windef.HRGN;
      fn   : LPDEFFN)
   is

      function To_DWORD is new Ada.Unchecked_Conversion (
         Win32.Windef.HRGN,
         Win32.DWORD);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_NCPAINT,
            Win32.WPARAM (To_DWORD (hrgn)),
            0);
   end FORWARD_WM_NCPAINT;

   function HANDLE_WM_NCCALCSIZE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCCALCSIZEFN)
      return Win32.LRESULT
   is
      function To_LPNCCALCSIZE is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         Win32.Winuser.LPNCCALCSIZE_PARAMS);
   begin
      return To_LRESULT
               (Win32.DWORD (fn (hwnd, 0, To_LPNCCALCSIZE (lParam))));
   end HANDLE_WM_NCCALCSIZE;

   function FORWARD_WM_NCCALCSIZE
     (hwnd            : Win32.Windef.HWND;
      fCalcValidRects : Win32.BOOL;
      lpcsp           : Win32.Winuser.LPNCCALCSIZE_PARAMS;
      fn              : LPDEFFN)
      return Win32.UINT
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winuser.LPNCCALCSIZE_PARAMS,
         Win32.LPARAM);
   begin
      return Win32.UINT (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_NCCALCSIZE,
                                          0,
                                          To_LPARAM (lpcsp))));
   end FORWARD_WM_NCCALCSIZE;

   function HANDLE_WM_NCHITTEST
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCHITTESTFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (fn
                                (hwnd,
                                 Win32.INT (Win32.SHORT (Win32.Utils.LOWORD
                                                            (Win32.DWORD (
        lParam)))),
                                 Win32.INT (Win32.SHORT (Win32.Utils.HIWORD
                                                            (Win32.DWORD (
        lParam)))))));
   end HANDLE_WM_NCHITTEST;

   function FORWARD_WM_NCHITTEST
     (hwnd : Win32.Windef.HWND;
      x    : Win32.INT;
      y    : Win32.INT;
      fn   : LPDEFFN)
      return Win32.UINT
   is
   begin
      return Win32.UINT (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_NCHITTEST,
                                          0,
                                          Win32.Winuser.MAKELPARAM
                                             (WORD (x),
                                              Win32.WORD (y)))));
   end FORWARD_WM_NCHITTEST;

   function HANDLE_WM_QUERYDRAGICON
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUERYDRAGICONFN)
      return Win32.LRESULT
   is
      function To_UINT is new Ada.Unchecked_Conversion (
         Win32.Windef.HICON,
         Win32.UINT);
   begin
      return To_LRESULT (Win32.DWORD (To_UINT (fn (hwnd))));
   end HANDLE_WM_QUERYDRAGICON;

   function FORWARD_WM_QUERYDRAGICON
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.Windef.HICON
   is
      function To_HICON is new Ada.Unchecked_Conversion (
         Win32.UINT,
         Win32.Windef.HICON);
   begin
      return To_HICON
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_QUERYDRAGICON,
                                             0,
                                             0))));
   end FORWARD_WM_QUERYDRAGICON;

   function HANDLE_WM_DROPFILES
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDROPFILESPROC)
      return Win32.LRESULT
   is
      function To_HDROP is new Ada.Unchecked_Conversion (
         Win32.WPARAM,
         Win32.Shellapi.HDROP);
   begin
      fn (hwnd, To_HDROP (wParam));
      return 0;
   end HANDLE_WM_DROPFILES;

   procedure FORWARD_WM_DROPFILES
     (hwnd  : Win32.Windef.HWND;
      hdrop : Win32.Shellapi.HDROP;
      fn    : LPDEFFN)
   is

      function To_WPARAM is new Ada.Unchecked_Conversion (
         Win32.Shellapi.HDROP,
         Win32.WPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_DROPFILES, To_WPARAM (hdrop), 0);
   end FORWARD_WM_DROPFILES;

   function HANDLE_WM_ACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPACTIVATEPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (wParam))),
         To_HWND (lParam),
         Win32.BOOL (Win32.Utils.HIWORD (Win32.DWORD (wParam))));
      return 0;
   end HANDLE_WM_ACTIVATE;

   procedure FORWARD_WM_ACTIVATE
     (hwnd         : Win32.Windef.HWND;
      state        : Win32.UINT;
      hwndActDeact : Win32.Windef.HWND;
      fMinimized   : Win32.BOOL;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_ACTIVATE,
            Win32.Winuser.MAKEWPARAM (WORD (state), Win32.WORD (fMinimized)),
            To_LPARAM (hwndActDeact));
   end FORWARD_WM_ACTIVATE;

   function HANDLE_WM_ACTIVATEAPP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPACTIVATEAPPPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.BOOL (wParam), Win32.DWORD (lParam));
      return 0;
   end HANDLE_WM_ACTIVATEAPP;

   procedure FORWARD_WM_ACTIVATEAPP
     (hwnd       : Win32.Windef.HWND;
      fActivate  : Win32.BOOL;
      dwThreadId : Win32.DWORD;
      fn         : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_ACTIVATEAPP,
            Win32.WPARAM (fActivate),
            Win32.LPARAM (dwThreadId));
   end FORWARD_WM_ACTIVATEAPP;

   function HANDLE_WM_NCACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCACTIVATEFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (fn
                                (hwnd,
                                 Win32.BOOL (wParam),
                                 To_HWND (Win32.LPARAM'(0)),
                                 0)));
   end HANDLE_WM_NCACTIVATE;

   function FORWARD_WM_NCACTIVATE
     (hwnd         : Win32.Windef.HWND;
      fActive      : Win32.BOOL;
      hwndActDeact : Win32.Windef.HWND;
      fMinimized   : Win32.BOOL;
      fn           : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_NCACTIVATE,
                                          Win32.WPARAM (fActive),
                                          0)));
   end FORWARD_WM_NCACTIVATE;

   function HANDLE_WM_SETFOCUS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETFOCUSPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam));
      return 0;
   end HANDLE_WM_SETFOCUS;

   procedure FORWARD_WM_SETFOCUS
     (hwnd         : Win32.Windef.HWND;
      hwndOldFocus : Win32.Windef.HWND;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SETFOCUS,
            Win32.WPARAM (To_DWORD (hwndOldFocus)),
            0);
   end FORWARD_WM_SETFOCUS;

   function HANDLE_WM_KILLFOCUS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPKILLFOCUSPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam));
      return 0;
   end HANDLE_WM_KILLFOCUS;

   procedure FORWARD_WM_KILLFOCUS
     (hwnd         : Win32.Windef.HWND;
      hwndNewFocus : Win32.Windef.HWND;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_KILLFOCUS,
            Win32.WPARAM (To_DWORD (hwndNewFocus)),
            0);
   end FORWARD_WM_KILLFOCUS;

   function HANDLE_WM_KEYDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPKEYPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (wParam),
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.UINT (Win32.Utils.HIWORD (Win32.DWORD (lParam))));
      return 0;
   end HANDLE_WM_KEYDOWN;

   procedure FORWARD_WM_KEYDOWN
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_KEYDOWN,
            Win32.WPARAM (vk),
            Win32.Winuser.MAKELPARAM
               (Win32.WORD (cRepeat),
                Win32.WORD (flags)));
   end FORWARD_WM_KEYDOWN;

   function HANDLE_WM_KEYUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPKEYPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (wParam),
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.UINT (Win32.Utils.HIWORD (Win32.DWORD (lParam))));
      return 0;
   end HANDLE_WM_KEYUP;

   procedure FORWARD_WM_KEYUP
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_KEYUP,
            Win32.WPARAM (vk),
            Win32.Winuser.MAKELPARAM
               (Win32.WORD (cRepeat),
                Win32.WORD (flags)));
   end FORWARD_WM_KEYUP;

   function To_BYTE is new Ada.Unchecked_Conversion (
      Win32.TCHAR,
      Win32.BYTE);

   function HANDLE_WM_CHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHARPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         LOCHAR (wParam),
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_CHAR;

   procedure FORWARD_WM_CHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_CHAR,
            Win32.WPARAM (Win32.Utils.MAKEWORD (To_BYTE (ch), 0)),
            Win32.Winuser.MAKELPARAM (WORD (cRepeat), 0));
   end FORWARD_WM_CHAR;

   function HANDLE_WM_DEADCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDEADCHARPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         LOCHAR (wParam),
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_DEADCHAR;

   procedure FORWARD_WM_DEADCHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_DEADCHAR,
            Win32.WPARAM (Win32.Utils.MAKEWORD (To_BYTE (ch), 0)),
            Win32.Winuser.MAKELPARAM (Win32.WORD (cRepeat), 0));
   end FORWARD_WM_DEADCHAR;

   function HANDLE_WM_SYSKEYDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSKEYPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (wParam),
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.UINT (Win32.Utils.HIWORD (Win32.DWORD (lParam))));
      return 0;
   end HANDLE_WM_SYSKEYDOWN;

   procedure FORWARD_WM_SYSKEYDOWN
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SYSKEYDOWN,
            Win32.WPARAM (vk),
            Win32.Winuser.MAKELPARAM
               (Win32.WORD (cRepeat),
                Win32.WORD (flags)));
   end FORWARD_WM_SYSKEYDOWN;

   function HANDLE_WM_SYSKEYUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSKEYPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (wParam),
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.UINT (Win32.Utils.HIWORD (Win32.DWORD (lParam))));
      return 0;
   end HANDLE_WM_SYSKEYUP;

   procedure FORWARD_WM_SYSKEYUP
     (hwnd    : Win32.Windef.HWND;
      vk      : Win32.UINT;
      fDown   : Win32.BOOL;
      cRepeat : Win32.INT;
      flags   : Win32.UINT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SYSKEYUP,
            Win32.WPARAM (vk),
            Win32.Winuser.MAKELPARAM
               (Win32.WORD (cRepeat),
                Win32.WORD (flags)));
   end FORWARD_WM_SYSKEYUP;

   function HANDLE_WM_SYSCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSCHARPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         LOCHAR (wParam),
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_SYSCHAR;

   procedure FORWARD_WM_SYSCHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SYSCHAR,
            Win32.WPARAM (Win32.Utils.MAKEWORD (To_BYTE (ch), 0)),
            Win32.Winuser.MAKELPARAM (Win32.WORD (cRepeat), 0));
   end FORWARD_WM_SYSCHAR;

   function HANDLE_WM_SYSDEADCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSDEADCHARPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         LOCHAR (wParam),
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_SYSDEADCHAR;

   procedure FORWARD_WM_SYSDEADCHAR
     (hwnd    : Win32.Windef.HWND;
      ch      : Win32.TCHAR;
      cRepeat : Win32.INT;
      fn      : LPDEFFN)
   is

      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SYSDEADCHAR,
            Win32.WPARAM (Win32.Utils.MAKEWORD (To_BYTE (ch), 0)),
            Win32.Winuser.MAKELPARAM (Win32.WORD (cRepeat), 0));
   end FORWARD_WM_SYSDEADCHAR;

   function HANDLE_WM_MOUSEMOVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMOUSEMOVEPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_MOUSEMOVE;

   procedure FORWARD_WM_MOUSEMOVE
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MOUSEMOVE,
            Win32.WPARAM (keyFlags),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_MOUSEMOVE;

   function HANDLE_WM_LBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPLBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_LBUTTONDOWN;

   procedure FORWARD_WM_LBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
      uMsg    : Win32.UINT;
   begin
      if (fDoubleClick = Win32.FALSE) then
         uMsg := Win32.Winuser.WM_LBUTTONDOWN;
      else
         uMsg := Win32.Winuser.WM_LBUTTONDBLCLK;
      end if;
      garbage :=
         fn
           (hwnd,
            uMsg,
            Win32.WPARAM (keyFlags),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_LBUTTONDOWN;

   function HANDLE_WM_LBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPLBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_LBUTTONDBLCLK;

   function HANDLE_WM_LBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPLBUTTONUPPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_LBUTTONUP;

   procedure FORWARD_WM_LBUTTONUP
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_LBUTTONUP,
            Win32.WPARAM (keyFlags),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_LBUTTONUP;

   function HANDLE_WM_RBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_RBUTTONDOWN;

   procedure FORWARD_WM_RBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
      uMsg    : Win32.UINT;
   begin
      if (fDoubleClick = Win32.FALSE) then
         uMsg := Win32.Winuser.WM_RBUTTONDOWN;
      else
         uMsg := Win32.Winuser.WM_RBUTTONDBLCLK;
      end if;
      garbage :=
         fn
           (hwnd,
            uMsg,
            Win32.WPARAM (keyFlags),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_RBUTTONDOWN;

   function HANDLE_WM_RBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_RBUTTONDBLCLK;

   function HANDLE_WM_RBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRBUTTONUPPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_RBUTTONUP;

   procedure FORWARD_WM_RBUTTONUP
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_RBUTTONUP,
            Win32.WPARAM (keyFlags),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_RBUTTONUP;

   function HANDLE_WM_MBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_MBUTTONDOWN;

   procedure FORWARD_WM_MBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      keyFlags     : Win32.UINT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
      uMsg    : Win32.UINT;
   begin
      if (fDoubleClick = Win32.FALSE) then
         uMsg := Win32.Winuser.WM_MBUTTONDOWN;
      else
         uMsg := Win32.Winuser.WM_MBUTTONDBLCLK;
      end if;
      garbage :=
         fn
           (hwnd,
            uMsg,
            Win32.WPARAM (keyFlags),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_MBUTTONDOWN;

   function HANDLE_WM_MBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_MBUTTONDBLCLK;

   function HANDLE_WM_MBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMBUTTONUPPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_MBUTTONUP;

   procedure FORWARD_WM_MBUTTONUP
     (hwnd     : Win32.Windef.HWND;
      x        : Win32.INT;
      y        : Win32.INT;
      keyFlags : Win32.UINT;
      fn       : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MBUTTONUP,
            Win32.WPARAM (keyFlags),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_MBUTTONUP;

   function HANDLE_WM_NCMOUSEMOVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMOUSEMOVEPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCMOUSEMOVE;

   procedure FORWARD_WM_NCMOUSEMOVE
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_NCMOUSEMOVE,
            Win32.WPARAM (codeHitTest),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_NCMOUSEMOVE;

   function HANDLE_WM_NCLBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCLBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCLBUTTONDOWN;

   procedure FORWARD_WM_NCLBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
      uMsg    : Win32.UINT;
   begin
      if (fDoubleClick = Win32.FALSE) then
         uMsg := Win32.Winuser.WM_NCLBUTTONDOWN;
      else
         uMsg := Win32.Winuser.WM_NCLBUTTONDBLCLK;
      end if;
      garbage :=
         fn
           (hwnd,
            uMsg,
            Win32.WPARAM (codeHitTest),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_NCLBUTTONDOWN;

   function HANDLE_WM_NCLBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCLBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCLBUTTONDBLCLK;

   function HANDLE_WM_NCLBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCLBUTTONUPPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCLBUTTONUP;

   procedure FORWARD_WM_NCLBUTTONUP
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_NCLBUTTONUP,
            Win32.WPARAM (codeHitTest),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_NCLBUTTONUP;

   function HANDLE_WM_NCRBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCRBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCRBUTTONDOWN;

   procedure FORWARD_WM_NCRBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
      uMsg    : Win32.UINT;
   begin
      if (fDoubleClick = Win32.FALSE) then
         uMsg := Win32.Winuser.WM_NCRBUTTONDOWN;
      else
         uMsg := Win32.Winuser.WM_NCRBUTTONDBLCLK;
      end if;
      garbage :=
         fn
           (hwnd,
            uMsg,
            Win32.WPARAM (codeHitTest),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_NCRBUTTONDOWN;

   function HANDLE_WM_NCRBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCRBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCRBUTTONDBLCLK;

   function HANDLE_WM_NCRBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCRBUTTONUPPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCRBUTTONUP;

   procedure FORWARD_WM_NCRBUTTONUP
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_NCRBUTTONUP,
            Win32.WPARAM (codeHitTest),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_NCRBUTTONUP;

   function HANDLE_WM_NCMBUTTONDOWN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.FALSE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCMBUTTONDOWN;

   procedure FORWARD_WM_NCMBUTTONDOWN
     (hwnd         : Win32.Windef.HWND;
      fDoubleClick : Win32.BOOL;
      x            : Win32.INT;
      y            : Win32.INT;
      codeHitTest  : Win32.UINT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
      uMsg    : Win32.UINT;
   begin
      if (fDoubleClick = Win32.FALSE) then
         uMsg := Win32.Winuser.WM_NCMBUTTONDOWN;
      else
         uMsg := Win32.Winuser.WM_NCMBUTTONDBLCLK;
      end if;
      garbage :=
         fn
           (hwnd,
            uMsg,
            Win32.WPARAM (codeHitTest),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_NCMBUTTONDOWN;

   function HANDLE_WM_NCMBUTTONDBLCLK
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMBUTTONDOWNPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.TRUE,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCMBUTTONDBLCLK;

   function HANDLE_WM_NCMBUTTONUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNCMBUTTONUPPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))),
         Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_NCMBUTTONUP;

   procedure FORWARD_WM_NCMBUTTONUP
     (hwnd        : Win32.Windef.HWND;
      x           : Win32.INT;
      y           : Win32.INT;
      codeHitTest : Win32.UINT;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_NCMBUTTONUP,
            Win32.WPARAM (codeHitTest),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_NCMBUTTONUP;

   function HANDLE_WM_MOUSEACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMOUSEACTIVATEFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (fn
                                (hwnd,
                                 To_HWND (wParam),
                                 Win32.UINT (Win32.Utils.LOWORD
                                                (Win32.DWORD (lParam))),
                                 Win32.UINT (Win32.Utils.HIWORD
                                                (Win32.DWORD (lParam))))));
   end HANDLE_WM_MOUSEACTIVATE;

   function FORWARD_WM_MOUSEACTIVATE
     (hwnd         : Win32.Windef.HWND;
      hwndTopLevel : Win32.Windef.HWND;
      codeHitTest  : Win32.UINT;
      msg          : Win32.UINT;
      fn           : LPDEFFN)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (fn
                                        (hwnd,
                                         Win32.Winuser.WM_MOUSEACTIVATE,
                                         Win32.WPARAM (To_DWORD
                                                          (hwndTopLevel)),
                                         Win32.Winuser.MAKELPARAM
                                            (Win32.WORD (codeHitTest),
                                             Win32.WORD (msg)))));
   end FORWARD_WM_MOUSEACTIVATE;

   function HANDLE_WM_CANCELMODE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCANCELMODEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_CANCELMODE;

   procedure FORWARD_WM_CANCELMODE (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_CANCELMODE, 0, 0);
   end FORWARD_WM_CANCELMODE;

   function HANDLE_WM_TIMER
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPTIMERPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.UINT (wParam));
      return 0;
   end HANDLE_WM_TIMER;

   procedure FORWARD_WM_TIMER
     (hwnd : Win32.Windef.HWND;
      id   : Win32.UINT;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_TIMER, Win32.WPARAM (id), 0);
   end FORWARD_WM_TIMER;

   function To_HMENU is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.Windef.HMENU);
   function To_HMENU is new Ada.Unchecked_Conversion (
      Win32.WPARAM,
      Win32.Windef.HMENU);

   function HANDLE_WM_INITMENU
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPINITMENUPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HMENU (wParam));
      return 0;
   end HANDLE_WM_INITMENU;

   procedure FORWARD_WM_INITMENU
     (hwnd  : Win32.Windef.HWND;
      hMenu : Win32.Windef.HMENU;
      fn    : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_INITMENU,
            Win32.WPARAM (To_DWORD (hMenu)),
            0);
   end FORWARD_WM_INITMENU;

   function HANDLE_WM_INITMENUPOPUP
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPINITMENUPOPUPPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         To_HMENU (wParam),
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (lParam))),
         Win32.BOOL (Win32.Utils.HIWORD (Win32.DWORD (lParam))));
      return 0;
   end HANDLE_WM_INITMENUPOPUP;

   procedure FORWARD_WM_INITMENUPOPUP
     (hwnd        : Win32.Windef.HWND;
      hMenu       : Win32.Windef.HMENU;
      item        : Win32.UINT;
      fSystemMenu : Win32.BOOL;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_INITMENUPOPUP,
            Win32.WPARAM (To_DWORD (hMenu)),
            Win32.Winuser.MAKELPARAM
               (Win32.WORD (item),
                Win32.WORD (fSystemMenu)));
   end FORWARD_WM_INITMENUPOPUP;

   function HANDLE_WM_MENUSELECT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMENUSELECTPROC)
      return Win32.LRESULT
   is
      use Interfaces.C;
      item       : Win32.INT;
      hMenuPopup : Win32.Windef.HMENU := To_HMENU (Win32.LPARAM'(0));
      flags      : Win32.UINT;
   begin
      if ((Win32.Utils.HIWORD (DWORD (wParam)) and Win32.Winuser.MF_POPUP) =
          Win32.FALSE)
      then
         item := Win32.INT (Win32.Utils.LOWORD (DWORD (wParam)));
      else
         item := 0;
      end if;

      if ((Win32.Utils.HIWORD (DWORD (wParam)) and Win32.Winuser.MF_POPUP) /=
          Win32.FALSE)
      then
         hMenuPopup :=
            Win32.Winuser.GetSubMenu
              (To_HMENU (lParam),
               Win32.INT (Win32.Utils.LOWORD (DWORD (wParam))));
      end if;

      if (Win32.SHORT (Win32.Utils.HIWORD (DWORD (wParam))) = -1) then
         flags := 16#FFFFFFFF#;
      else
         flags := UINT (Win32.Utils.HIWORD (DWORD (wParam)));
      end if;

      fn (hwnd, To_HMENU (lParam), item, hMenuPopup, flags);
      return 0;
   end HANDLE_WM_MENUSELECT;

   procedure FORWARD_WM_MENUSELECT
     (hwnd       : Win32.Windef.HWND;
      hmenu      : Win32.Windef.HMENU;
      item       : Win32.INT;
      hmenuPopup : Win32.Windef.HMENU;
      flags      : Win32.UINT;
      fn         : LPDEFFN)
   is
      function To_BOOL is new Ada.Unchecked_Conversion (
         Win32.Windef.HMENU,
         Win32.BOOL);
      garbage : Win32.LRESULT;
      lParam  : Win32.LPARAM;
   begin
      if (To_BOOL (hmenu) /= Win32.FALSE) then
         lParam := HMENU_To_LPARAM (hmenu);
      else
         lParam := HMENU_To_LPARAM (hmenuPopup);
      end if;
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MENUSELECT,
            Win32.Winuser.MAKEWPARAM (Win32.WORD (item), Win32.WORD (flags)),
            lParam);
   end FORWARD_WM_MENUSELECT;

   function HANDLE_WM_MENUCHAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMENUCHARFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (fn
                                (hwnd,
                                 Win32.UINT (Win32.Utils.LOWORD
                                                (DWORD (wParam))),
                                 Win32.UINT (Win32.Utils.HIWORD
                                                (DWORD (wParam))),
                                 To_HMENU (lParam))));
   end HANDLE_WM_MENUCHAR;

   function To_DWORD is new Ada.Unchecked_Conversion (
      Win32.LRESULT,
      Win32.DWORD);

   function FORWARD_WM_MENUCHAR
     (hwnd  : Win32.Windef.HWND;
      ch    : Win32.UINT;
      flags : Win32.UINT;
      hmenu : Win32.Windef.HMENU;
      fn    : LPDEFFN)
      return Win32.DWORD
   is
   begin
      return To_DWORD
               (fn
                   (hwnd,
                    Win32.Winuser.WM_MENUCHAR,
                    Win32.Winuser.MAKEWPARAM
                       (Win32.WORD (flags),
                        Win32.WORD (ch)),
                    HMENU_To_LPARAM (hmenu)));
   end FORWARD_WM_MENUCHAR;

   function HANDLE_WM_COMMAND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMMANDPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (Win32.Utils.LOWORD (Win32.DWORD (wParam))),
         To_HWND (lParam),
         Win32.UINT (Win32.Utils.HIWORD (Win32.DWORD (wParam))));
      return 0;
   end HANDLE_WM_COMMAND;

   procedure FORWARD_WM_COMMAND
     (hwnd       : Win32.Windef.HWND;
      id         : Win32.INT;
      hwndCtl    : Win32.Windef.HWND;
      codeNotify : Win32.UINT;
      fn         : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_COMMAND,
            Win32.Winuser.MAKEWPARAM
               (Win32.WORD (Win32.UINT (id)),
                Win32.WORD (codeNotify)),
            To_LPARAM (hwndCtl));
   end FORWARD_WM_COMMAND;

   function HANDLE_WM_HSCROLL
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPHSCROLLPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         To_HWND (lParam),
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (wParam))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (wParam)))));
      return 0;
   end HANDLE_WM_HSCROLL;

   function To_UINT is new Ada.Unchecked_Conversion (
      Win32.Windef.HWND,
      Win32.UINT);

   procedure FORWARD_WM_HSCROLL
     (hwnd    : Win32.Windef.HWND;
      hwndCtl : Win32.Windef.HWND;
      code    : Win32.UINT;
      pos     : Win32.INT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_HSCROLL,
            Win32.Winuser.MAKEWPARAM
               (Win32.WORD (code),
                Win32.WORD (Win32.UINT (pos))),
            Win32.LPARAM (To_UINT (hwndCtl)));
   end FORWARD_WM_HSCROLL;

   function HANDLE_WM_VSCROLL
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPVSCROLLPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         To_HWND (lParam),
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (wParam))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (DWORD (wParam)))));
      return 0;
   end HANDLE_WM_VSCROLL;

   procedure FORWARD_WM_VSCROLL
     (hwnd    : Win32.Windef.HWND;
      hwndCtl : Win32.Windef.HWND;
      code    : Win32.UINT;
      pos     : Win32.INT;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_VSCROLL,
            Win32.Winuser.MAKEWPARAM
               (Win32.WORD (code),
                Win32.WORD (Win32.UINT (pos))),
            To_LPARAM (hwndCtl));
   end FORWARD_WM_VSCROLL;

   function HANDLE_WM_CUT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCUTPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_CUT;

   procedure FORWARD_WM_CUT (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_CUT, 0, 0);
   end FORWARD_WM_CUT;

   function HANDLE_WM_COPY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOPYPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_COPY;

   procedure FORWARD_WM_COPY (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_COPY, 0, 0);
   end FORWARD_WM_COPY;

   function HANDLE_WM_PASTE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPASTEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_PASTE;

   procedure FORWARD_WM_PASTE (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_PASTE, 0, 0);
   end FORWARD_WM_PASTE;

   function HANDLE_WM_CLEAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCLEARPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_CLEAR;

   procedure FORWARD_WM_CLEAR (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_CLEAR, 0, 0);
   end FORWARD_WM_CLEAR;

   function HANDLE_WM_UNDO
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPUNDOPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_UNDO;

   procedure FORWARD_WM_UNDO (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_UNDO, 0, 0);
   end FORWARD_WM_UNDO;

   function HANDLE_WM_RENDERFORMAT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRENDERFORMATFN)
      return Win32.LRESULT
   is
      function To_UINT is new Ada.Unchecked_Conversion (
         Win32.Winnt.HANDLE,
         Win32.UINT);
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT (fn (hwnd, Win32.UINT (wParam)))));
   end HANDLE_WM_RENDERFORMAT;

   function FORWARD_WM_RENDERFORMAT
     (hwnd : Win32.Windef.HWND;
      fmt  : Win32.UINT;
      fn   : LPDEFFN)
      return Win32.Winnt.HANDLE
   is
      function To_HANDLE is new Ada.Unchecked_Conversion (
         Win32.UINT,
         Win32.Winnt.HANDLE);
   begin
      return To_HANDLE
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_RENDERFORMAT,
                                             Win32.WPARAM (Win32.UINT (fmt)),
                                             0))));
   end FORWARD_WM_RENDERFORMAT;

   function HANDLE_WM_RENDERALLFORMATS
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPRENDERALLFORMATSPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_RENDERALLFORMATS;

   procedure FORWARD_WM_RENDERALLFORMATS
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_RENDERALLFORMATS, 0, 0);
   end FORWARD_WM_RENDERALLFORMATS;

   function HANDLE_WM_DESTROYCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDESTROYCLIPBOARDPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_DESTROYCLIPBOARD;

   procedure FORWARD_WM_DESTROYCLIPBOARD
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_DESTROYCLIPBOARD, 0, 0);
   end FORWARD_WM_DESTROYCLIPBOARD;

   function HANDLE_WM_DRAWCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDRAWCLIPBOARDPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_DRAWCLIPBOARD;

   procedure FORWARD_WM_DRAWCLIPBOARD
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_DRAWCLIPBOARD, 0, 0);
   end FORWARD_WM_DRAWCLIPBOARD;

   function To_HGLOBAL is new Ada.Unchecked_Conversion (
      Win32.LPARAM,
      Win32.Windef.HGLOBAL);

   function HANDLE_WM_PAINTCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPAINTCLIPBOARDPROC)
      return Win32.LRESULT
   is
      function To_LPCPAINTSTRUCT is new Ada.Unchecked_Conversion (
         Win32.LPVOID,
         LPCPAINTSTRUCT);
      garbage : Win32.BOOL;
   begin
      fn
        (hwnd,
         To_HWND (wParam),
         To_LPCPAINTSTRUCT (Win32.Winbase.GlobalLock (To_HGLOBAL (lParam))));
      garbage := Win32.Winbase.GlobalUnlock (To_HGLOBAL (lParam));
      return 0;
   end HANDLE_WM_PAINTCLIPBOARD;

   procedure FORWARD_WM_PAINTCLIPBOARD
     (hwnd          : Win32.Windef.HWND;
      hwndCBViewer  : Win32.Windef.HWND;
      lpPaintStruct : LPCPAINTSTRUCT;
      fn            : LPDEFFN)
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         LPCPAINTSTRUCT,
         Win32.LPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_PAINTCLIPBOARD,
            Win32.WPARAM (To_DWORD (hwndCBViewer)),
            To_LPARAM (lpPaintStruct));
   end FORWARD_WM_PAINTCLIPBOARD;

   function HANDLE_WM_SIZECLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSIZECLIPBOARDPROC)
      return Win32.LRESULT
   is
      function To_LPCRECT is new Ada.Unchecked_Conversion (
         Win32.PVOID,
         Win32.Objbase.LPCRECT);
      garbage : Win32.BOOL;
   begin
      fn
        (hwnd,
         To_HWND (wParam),
         To_LPCRECT (Win32.Winbase.GlobalLock (To_HGLOBAL (lParam))));
      garbage := Win32.Winbase.GlobalUnlock (To_HGLOBAL (lParam));
      return 0;
   end HANDLE_WM_SIZECLIPBOARD;

   procedure FORWARD_WM_SIZECLIPBOARD
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      lprc         : Win32.Objbase.LPCRECT;
      fn           : LPDEFFN)
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Objbase.LPCRECT,
         Win32.LPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SIZECLIPBOARD,
            Win32.WPARAM (To_DWORD (hwndCBViewer)),
            To_LPARAM (lprc));
   end FORWARD_WM_SIZECLIPBOARD;

   function HANDLE_WM_VSCROLLCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPVSCROLLCLIPBOARDPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         To_HWND (wParam),
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (lParam))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_VSCROLLCLIPBOARD;

   procedure FORWARD_WM_VSCROLLCLIPBOARD
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      code         : Win32.UINT;
      pos          : Win32.INT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_VSCROLLCLIPBOARD,
            Win32.WPARAM (To_DWORD (hwndCBViewer)),
            Win32.Winuser.MAKELPARAM (Win32.WORD (code), Win32.WORD (pos)));
   end FORWARD_WM_VSCROLLCLIPBOARD;

   function HANDLE_WM_HSCROLLCLIPBOARD
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPHSCROLLCLIPBOARDPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         To_HWND (wParam),
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (lParam))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_HSCROLLCLIPBOARD;

   procedure FORWARD_WM_HSCROLLCLIPBOARD
     (hwnd         : Win32.Windef.HWND;
      hwndCBViewer : Win32.Windef.HWND;
      code         : Win32.UINT;
      pos          : Win32.INT;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_HSCROLLCLIPBOARD,
            Win32.WPARAM (To_DWORD (hwndCBViewer)),
            Win32.Winuser.MAKELPARAM (Win32.WORD (code), Win32.WORD (pos)));
   end FORWARD_WM_HSCROLLCLIPBOARD;

   function HANDLE_WM_ASKCBFORMATNAME
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPASKCBFORMATNAMEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.INT (wParam), To_LPTSTR (lParam));
      return 0;
   end HANDLE_WM_ASKCBFORMATNAME;

   procedure FORWARD_WM_ASKCBFORMATNAME
     (hwnd     : Win32.Windef.HWND;
      cchMax   : Win32.INT;
      rgchName : Win32.Winnt.LPTSTR;
      fn       : LPDEFFN)
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winnt.LPTSTR,
         Win32.LPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_ASKCBFORMATNAME,
            Win32.WPARAM (cchMax),
            To_LPARAM (rgchName));
   end FORWARD_WM_ASKCBFORMATNAME;

   function HANDLE_WM_CHANGECBCHAIN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHANGECBCHAINPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam), To_HWND (lParam));
      return 0;
   end HANDLE_WM_CHANGECBCHAIN;

   procedure FORWARD_WM_CHANGECBCHAIN
     (hwnd       : Win32.Windef.HWND;
      hwndRemove : Win32.Windef.HWND;
      hwndNext   : Win32.Windef.HWND;
      fn         : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_CHANGECBCHAIN,
            Win32.WPARAM (To_DWORD (hwndRemove)),
            To_LPARAM (hwndNext));
   end FORWARD_WM_CHANGECBCHAIN;

   function HANDLE_WM_SETCURSOR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETCURSORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (fn
                                (hwnd,
                                 To_HWND (wParam),
                                 Win32.UINT (Win32.Utils.LOWORD
                                                (Win32.DWORD (lParam))),
                                 Win32.UINT (Win32.Utils.HIWORD
                                                (Win32.DWORD (lParam))))));
   end HANDLE_WM_SETCURSOR;

   function FORWARD_WM_SETCURSOR
     (hwnd        : Win32.Windef.HWND;
      hwndCursor  : Win32.Windef.HWND;
      codeHitTest : Win32.UINT;
      msg         : Win32.UINT;
      fn          : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_SETCURSOR,
                                          Win32.WPARAM (To_DWORD
                                                           (hwndCursor)),
                                          Win32.Winuser.MAKELPARAM
                                             (Win32.WORD (codeHitTest),
                                              Win32.WORD (msg)))));
   end FORWARD_WM_SETCURSOR;

   function HANDLE_WM_SYSCOMMAND
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSYSCOMMANDPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (wParam),
         Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (lParam)))),
         Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (lParam)))));
      return 0;
   end HANDLE_WM_SYSCOMMAND;

   procedure FORWARD_WM_SYSCOMMAND
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT;
      x    : Win32.INT;
      y    : Win32.INT;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SYSCOMMAND,
            Win32.WPARAM (cmd),
            Win32.Winuser.MAKELPARAM (Win32.WORD (x), Win32.WORD (y)));
   end FORWARD_WM_SYSCOMMAND;

   function HANDLE_WM_MDICREATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDICREATEFN)
      return Win32.LRESULT
   is
      function To_LPCMDICREATESTRUCT is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         LPCMDICREATESTRUCT);
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn (hwnd, To_LPCMDICREATESTRUCT (lParam)))));
   end HANDLE_WM_MDICREATE;

   function FORWARD_WM_MDICREATE
     (hwnd  : Win32.Windef.HWND;
      lpmcs : LPCMDICREATESTRUCT;
      fn    : LPDEFFN)
      return Win32.Windef.HWND
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         LPCMDICREATESTRUCT,
         Win32.LPARAM);
   begin
      return To_HWND
               (Win32.DWORD (fn
                                (hwnd,
                                 Win32.Winuser.WM_MDICREATE,
                                 0,
                                 To_LPARAM (lpmcs))));
   end FORWARD_WM_MDICREATE;

   function HANDLE_WM_MDIDESTROY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIDESTROYPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam));
      return 0;
   end HANDLE_WM_MDIDESTROY;

   procedure FORWARD_WM_MDIDESTROY
     (hwnd        : Win32.Windef.HWND;
      hwndDestroy : Win32.Windef.HWND;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MDIDESTROY,
            Win32.WPARAM (To_DWORD (hwndDestroy)),
            0);
   end FORWARD_WM_MDIDESTROY;

   function HANDLE_WM_MDIACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIACTIVATEPROC)
      return Win32.LRESULT
   is
      fActive : Win32.BOOL := Win32.FALSE;
   begin
      if (lParam = To_LPARAM (hwnd)) then
         fActive := Win32.TRUE;
      end if;
      fn (hwnd, fActive, To_HWND (lParam), To_HWND (wParam));
      return 0;
   end HANDLE_WM_MDIACTIVATE;

   procedure FORWARD_WM_MDIACTIVATE
     (hwnd           : Win32.Windef.HWND;
      fActive        : Win32.BOOL;
      hwndActivate   : Win32.Windef.HWND;
      hwndDeactivate : Win32.Windef.HWND;
      fn             : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Winuser.WM_MDIACTIVATE,
            Win32.WPARAM (To_DWORD (hwndDeactivate)),
            To_LPARAM (hwndActivate));
   end FORWARD_WM_MDIACTIVATE;

   function HANDLE_WM_MDIRESTORE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIRESTOREPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam));
      return 0;
   end HANDLE_WM_MDIRESTORE;

   procedure FORWARD_WM_MDIRESTORE
     (hwnd        : Win32.Windef.HWND;
      hwndRestore : Win32.Windef.HWND;
      fn          : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MDIRESTORE,
            Win32.WPARAM (To_DWORD (hwndRestore)),
            0);
   end FORWARD_WM_MDIRESTORE;

   function HANDLE_WM_MDINEXT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDINEXTFN)
      return Win32.LRESULT
   is
      function To_LRESULT is new Ada.Unchecked_Conversion (
         Win32.Windef.HWND,
         Win32.LRESULT);
   begin
      return To_LRESULT (fn (hwnd, To_HWND (wParam), Win32.BOOL (lParam)));
   end HANDLE_WM_MDINEXT;

   function FORWARD_WM_MDINEXT
     (hwnd    : Win32.Windef.HWND;
      hwndCur : Win32.Windef.HWND;
      fPrev   : Win32.BOOL;
      fn      : LPDEFFN)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND
               (Win32.DWORD (fn
                                (hwnd,
                                 Win32.Winuser.WM_MDINEXT,
                                 Win32.WPARAM (To_DWORD (hwndCur)),
                                 Win32.LPARAM (fPrev))));
   end FORWARD_WM_MDINEXT;

   function HANDLE_WM_MDIMAXIMIZE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIMAXIMIZEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, To_HWND (wParam));
      return 0;
   end HANDLE_WM_MDIMAXIMIZE;

   procedure FORWARD_WM_MDIMAXIMIZE
     (hwnd         : Win32.Windef.HWND;
      hwndMaximize : Win32.Windef.HWND;
      fn           : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MDIMAXIMIZE,
            Win32.WPARAM (To_DWORD (hwndMaximize)),
            0);
   end FORWARD_WM_MDIMAXIMIZE;

   function HANDLE_WM_MDITILE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDITILEFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT (Win32.DWORD (fn (hwnd, Win32.UINT (wParam))));
   end HANDLE_WM_MDITILE;

   function FORWARD_WM_MDITILE
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT;
      fn   : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_MDITILE,
                                          Win32.WPARAM (cmd),
                                          0)));
   end FORWARD_WM_MDITILE;

   function HANDLE_WM_MDICASCADE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDICASCADEFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT (Win32.DWORD (fn (hwnd, Win32.UINT (wParam))));
   end HANDLE_WM_MDICASCADE;

   function FORWARD_WM_MDICASCADE
     (hwnd : Win32.Windef.HWND;
      cmd  : Win32.UINT;
      fn   : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_MDICASCADE,
                                          Win32.WPARAM (cmd),
                                          0)));
   end FORWARD_WM_MDICASCADE;

   function HANDLE_WM_MDIICONARRANGE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIICONARRANGEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_MDIICONARRANGE;

   procedure FORWARD_WM_MDIICONARRANGE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_MDIICONARRANGE, 0, 0);
   end FORWARD_WM_MDIICONARRANGE;

   function HANDLE_WM_MDIGETACTIVE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDIGETACTIVEFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT (Win32.DWORD (To_UINT (fn (hwnd))));
   end HANDLE_WM_MDIGETACTIVE;

   function FORWARD_WM_MDIGETACTIVE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND
               (Win32.DWORD (fn (hwnd, Win32.Winuser.WM_MDIGETACTIVE, 0, 0)));
   end FORWARD_WM_MDIGETACTIVE;

   function HANDLE_WM_MDISETMENU
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMDISETMENUFN)
      return Win32.LRESULT
   is
      function To_UINT is new Ada.Unchecked_Conversion (
         Win32.Windef.HMENU,
         Win32.UINT);

   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     Win32.BOOL (wParam),
                                     To_HMENU (wParam),
                                     To_HMENU (lParam)))));
   end HANDLE_WM_MDISETMENU;

   function FORWARD_WM_MDISETMENU
     (hwnd        : Win32.Windef.HWND;
      fRefresh    : Win32.BOOL;
      hmenuFrame  : Win32.Windef.HMENU;
      hmenuWindow : Win32.Windef.HMENU;
      fn          : LPDEFFN)
      return Win32.Windef.HMENU
   is
      wParam : Win32.WPARAM := 0;
   begin
      if (fRefresh /= Win32.FALSE) then
         wParam := Win32.WPARAM (To_DWORD (hmenuFrame));
      end if;
      return To_HMENU
               (UINT_PTR (fn
                             (hwnd,
                              Win32.Winuser.WM_MDISETMENU,
                              wParam,
                              HMENU_To_LPARAM (hmenuWindow))));
   end FORWARD_WM_MDISETMENU;

   function HANDLE_WM_CHILDACTIVATE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHILDACTIVATEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_CHILDACTIVATE;

   procedure FORWARD_WM_CHILDACTIVATE
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_CHILDACTIVATE, 0, 0);
   end FORWARD_WM_CHILDACTIVATE;

   function HANDLE_WM_INITDIALOG
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPINITDIALOGFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (Win32.UINT (fn (hwnd, To_HWND (wParam), lParam))))
;
   end HANDLE_WM_INITDIALOG;

   function FORWARD_WM_INITDIALOG
     (hwnd      : Win32.Windef.HWND;
      hwndFocus : Win32.Windef.HWND;
      lParam    : Win32.LPARAM;
      fn        : LPDEFFN)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_INITDIALOG,
                                          Win32.WPARAM (To_DWORD (hwndFocus)),
                                          lParam)));
   end FORWARD_WM_INITDIALOG;

   function HANDLE_WM_NEXTDLGCTL
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPNEXTDLGCTLFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HWND (wParam),
                                     Win32.BOOL (lParam)))));
   end HANDLE_WM_NEXTDLGCTL;

   function FORWARD_WM_NEXTDLGCTL
     (hwnd         : Win32.Windef.HWND;
      hwndSetFocus : Win32.Windef.HWND;
      fNext        : Win32.BOOL;
      fn           : LPDEFFN)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND
               (Win32.DWORD (fn
                                (hwnd,
                                 Win32.Winuser.WM_NEXTDLGCTL,
                                 Win32.WPARAM (To_DWORD (hwndSetFocus)),
                                 Win32.LPARAM (fNext))));
   end FORWARD_WM_NEXTDLGCTL;

   function HANDLE_WM_PARENTNOTIFY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPPARENTNOTIFYPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (wParam))),
         To_HWND (lParam),
         Win32.INT (Win32.UINT (Win32.Utils.HIWORD (Win32.DWORD (wParam)))));
      return 0;
   end HANDLE_WM_PARENTNOTIFY;

   procedure FORWARD_WM_PARENTNOTIFY
     (hwnd      : Win32.Windef.HWND;
      msg       : Win32.UINT;
      hwndChild : Win32.Windef.HWND;
      idChild   : Win32.INT;
      fn        : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_PARENTNOTIFY,
            Win32.Winuser.MAKEWPARAM (Win32.WORD (msg), Win32.WORD (idChild)),
            To_LPARAM (hwndChild));
   end FORWARD_WM_PARENTNOTIFY;

   function HANDLE_WM_ENTERIDLE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPENTERIDLEPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd, Win32.UINT (wParam), To_HWND (lParam));
      return 0;
   end HANDLE_WM_ENTERIDLE;

   procedure FORWARD_WM_ENTERIDLE
     (hwnd       : Win32.Windef.HWND;
      source     : Win32.UINT;
      hwndSource : Win32.Windef.HWND;
      fn         : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_ENTERIDLE,
            Win32.WPARAM (source),
            To_LPARAM (hwndSource));
   end FORWARD_WM_ENTERIDLE;

   function HANDLE_WM_GETDLGCODE
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETDLGCODEFN)
      return Win32.LRESULT
   is
      function To_LPMSG is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         Win32.Winuser.LPMSG);
   begin
      return To_LRESULT (Win32.DWORD (fn (hwnd, To_LPMSG (lParam))));
   end HANDLE_WM_GETDLGCODE;

   function FORWARD_WM_GETDLGCODE
     (hwnd  : Win32.Windef.HWND;
      lpmsg : Win32.Winuser.LPMSG;
      fn    : LPDEFFN)
      return Win32.UINT
   is
      function To_BOOL is new Ada.Unchecked_Conversion (
         Win32.Winuser.LPMSG,
         Win32.BOOL);
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winuser.LPMSG,
         Win32.LPARAM);
      wParam : Win32.WPARAM := 0;
   begin
      if (To_BOOL (lpmsg) /= Win32.FALSE) then
         wParam := lpmsg.all.wParam;
      end if;
      return Win32.UINT (Win32.DWORD (fn
                                         (hwnd,
                                          Win32.Winuser.WM_GETDLGCODE,
                                          wParam,
                                          To_LPARAM (lpmsg))));
   end FORWARD_WM_GETDLGCODE;

   function To_HBRUSH is new Ada.Unchecked_Conversion (
      Win32.UINT,
      Win32.Windef.HBRUSH);

   function HANDLE_WM_CTLCOLORMSGBOX
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HDC (wParam),
                                     To_HWND (lParam),
                                     Win32.Winuser.CTLCOLOR_MSGBOX))));
   end HANDLE_WM_CTLCOLORMSGBOX;

   function FORWARD_WM_CTLCOLORMSGBOX
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH
   is
   begin
      return To_HBRUSH
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_CTLCOLORMSGBOX,
                                             Win32.WPARAM (HDC_To_DWORD
                                                              (hdc)),
                                             To_LPARAM (hwndChild)))));
   end FORWARD_WM_CTLCOLORMSGBOX;

   function HANDLE_WM_CTLCOLOREDIT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HDC (wParam),
                                     To_HWND (lParam),
                                     Win32.Winuser.CTLCOLOR_EDIT))));
   end HANDLE_WM_CTLCOLOREDIT;

   function FORWARD_WM_CTLCOLOREDIT
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH
   is
   begin
      return To_HBRUSH
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_CTLCOLOREDIT,
                                             Win32.WPARAM (
        Win32.Utils.LOWORD (HDC_To_DWORD (hdc))),
                                             To_LPARAM (hwndChild)))));
   end FORWARD_WM_CTLCOLOREDIT;

   function HANDLE_WM_CTLCOLORLISTBOX
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HDC (wParam),
                                     To_HWND (lParam),
                                     Win32.Winuser.CTLCOLOR_LISTBOX))));
   end HANDLE_WM_CTLCOLORLISTBOX;

   function FORWARD_WM_CTLCOLORLISTBOX
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH
   is
   begin
      return To_HBRUSH
               (Win32.UINT (To_DWORD
                               (fn
                                   (hwnd,
                                    Win32.Winuser.WM_CTLCOLORLISTBOX,
                                    Win32.WPARAM (Win32.Utils.LOWORD
                                                     (HDC_To_DWORD (hdc))),
                                    To_LPARAM (hwndChild)))));
   end FORWARD_WM_CTLCOLORLISTBOX;

   function HANDLE_WM_CTLCOLORBTN
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HDC (wParam),
                                     To_HWND (lParam),
                                     Win32.Winuser.CTLCOLOR_BTN))));
   end HANDLE_WM_CTLCOLORBTN;

   function FORWARD_WM_CTLCOLORBTN
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH
   is
   begin
      return To_HBRUSH
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_CTLCOLORBTN,
                                             Win32.WPARAM (
        Win32.Utils.LOWORD (HDC_To_DWORD (hdc))),
                                             To_LPARAM (hwndChild)))));
   end FORWARD_WM_CTLCOLORBTN;

   function HANDLE_WM_CTLCOLORDLG
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HDC (wParam),
                                     To_HWND (lParam),
                                     Win32.Winuser.CTLCOLOR_DLG))));
   end HANDLE_WM_CTLCOLORDLG;

   function FORWARD_WM_CTLCOLORDLG
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH
   is
   begin
      return To_HBRUSH
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_CTLCOLORDLG,
                                             Win32.WPARAM (
        Win32.Utils.LOWORD (HDC_To_DWORD (hdc))),
                                             To_LPARAM (hwndChild)))));
   end FORWARD_WM_CTLCOLORDLG;

   function HANDLE_WM_CTLCOLORSCROLLBAR
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HDC (wParam),
                                     To_HWND (lParam),
                                     Win32.Winuser.CTLCOLOR_SCROLLBAR))));
   end HANDLE_WM_CTLCOLORSCROLLBAR;

   function FORWARD_WM_CTLCOLORSCROLLBAR
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH
   is
   begin
      return To_HBRUSH
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.
        WM_CTLCOLORSCROLLBAR,
                                             Win32.WPARAM (
        Win32.Utils.LOWORD (HDC_To_DWORD (hdc))),
                                             To_LPARAM (hwndChild)))));
   end FORWARD_WM_CTLCOLORSCROLLBAR;

   function HANDLE_WM_CTLCOLORSTATIC
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCTLCOLORFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (To_UINT
                                (fn
                                    (hwnd,
                                     To_HDC (wParam),
                                     To_HWND (lParam),
                                     Win32.Winuser.CTLCOLOR_STATIC))));
   end HANDLE_WM_CTLCOLORSTATIC;

   function FORWARD_WM_CTLCOLORSTATIC
     (hwnd      : Win32.Windef.HWND;
      hdc       : Win32.Windef.HDC;
      hwndChild : Win32.Windef.HWND;
      ctlType   : Win32.INT;
      fn        : LPDEFFN)
      return Win32.Windef.HBRUSH
   is
   begin
      return To_HBRUSH
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_CTLCOLORSTATIC,
                                             Win32.WPARAM (
        Win32.Utils.LOWORD (HDC_To_DWORD (hdc))),
                                             To_LPARAM (hwndChild)))));
   end FORWARD_WM_CTLCOLORSTATIC;

   function To_HFONT is new Ada.Unchecked_Conversion (
      Win32.DWORD,
      Win32.Windef.HFONT);

   function HANDLE_WM_SETFONT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPSETFONTPROC)
      return Win32.LRESULT
   is
      function To_HFONT is new Ada.Unchecked_Conversion (
         Win32.WPARAM,
         Win32.Windef.HFONT);
   begin
      fn (hwnd, To_HFONT (wParam), Win32.BOOL (lParam));
      return 0;
   end HANDLE_WM_SETFONT;

   procedure FORWARD_WM_SETFONT
     (hwnd    : Win32.Windef.HWND;
      hfont   : Win32.Windef.HFONT;
      fRedraw : Win32.BOOL;
      fn      : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_SETFONT,
            Win32.WPARAM (To_DWORD (hfont)),
            Win32.LPARAM (fRedraw));
   end FORWARD_WM_SETFONT;

   function SendMessage
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT renames Win32.Winuser.SendMessageA;

   procedure SetWindowFont
     (hwnd    : Win32.Windef.HWND;
      hfont   : Win32.Windef.HFONT;
      fRedraw : Win32.BOOL)
   is
   begin
      FORWARD_WM_SETFONT (hwnd, hfont, fRedraw, SendMessage'Access);
   end SetWindowFont;

   function HANDLE_WM_GETFONT
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPGETFONTFN)
      return Win32.LRESULT
   is
      function To_UINT is new Ada.Unchecked_Conversion (
         Win32.Windef.HFONT,
         Win32.UINT);

   begin
      return To_LRESULT (Win32.DWORD (To_UINT (fn (hwnd))));
   end HANDLE_WM_GETFONT;

   function FORWARD_WM_GETFONT
     (hwnd : Win32.Windef.HWND;
      fn   : LPDEFFN)
      return Win32.Windef.HFONT
   is
      function To_HFONT is new Ada.Unchecked_Conversion (
         Win32.UINT,
         Win32.Windef.HFONT);
   begin
      return To_HFONT
               (Win32.UINT (Win32.DWORD (fn
                                            (hwnd,
                                             Win32.Winuser.WM_GETFONT,
                                             0,
                                             0))));
   end FORWARD_WM_GETFONT;

   function GetWindowFont
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HFONT
   is
   begin
      return FORWARD_WM_GETFONT (hwnd, SendMessage'Access);
   end GetWindowFont;

   function HANDLE_WM_DRAWITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDRAWITEMPROC)
      return Win32.LRESULT
   is
      function To_LPCDRAWITEMSTRUCT is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         LPCDRAWITEMSTRUCT);
   begin
      fn (hwnd, To_LPCDRAWITEMSTRUCT (lParam));
      return 0;
   end HANDLE_WM_DRAWITEM;

   procedure FORWARD_WM_DRAWITEM
     (hwnd       : Win32.Windef.HWND;
      lpDrawItem : LPCDRAWITEMSTRUCT;
      fn         : LPDEFFN)
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         LPCDRAWITEMSTRUCT,
         Win32.LPARAM);

      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_DRAWITEM,
            Win32.WPARAM (lpDrawItem.all.CtlID),
            To_LPARAM (lpDrawItem));
   end FORWARD_WM_DRAWITEM;

   function HANDLE_WM_MEASUREITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPMEASUREITEMPROC)
      return Win32.LRESULT
   is
      function To_LPMEASUREITEMSTRUCT is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         Win32.Winuser.LPMEASUREITEMSTRUCT);
   begin
      fn (hwnd, To_LPMEASUREITEMSTRUCT (lParam));
      return 0;
   end HANDLE_WM_MEASUREITEM;

   procedure FORWARD_WM_MEASUREITEM
     (hwnd          : Win32.Windef.HWND;
      lpMeasureItem : Win32.Winuser.LPMEASUREITEMSTRUCT;
      fn            : LPDEFFN)
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winuser.LPMEASUREITEMSTRUCT,
         Win32.LPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_MEASUREITEM,
            Win32.WPARAM (lpMeasureItem.all.CtlID),
            To_LPARAM (lpMeasureItem));
   end FORWARD_WM_MEASUREITEM;

   function HANDLE_WM_DELETEITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPDELETEITEMPROC)
      return Win32.LRESULT
   is
      function To_LPCDELETEITEMSTRUCT is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         LPCDELETEITEMSTRUCT);
   begin
      fn (hwnd, To_LPCDELETEITEMSTRUCT (lParam));
      return 0;
   end HANDLE_WM_DELETEITEM;

   procedure FORWARD_WM_DELETEITEM
     (hwnd         : Win32.Windef.HWND;
      lpDeleteItem : LPCDELETEITEMSTRUCT;
      fn           : LPDEFFN)
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         LPCDELETEITEMSTRUCT,
         Win32.LPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_DELETEITEM,
            Win32.WPARAM (lpDeleteItem.all.CtlID),
            To_LPARAM (lpDeleteItem));
   end FORWARD_WM_DELETEITEM;

   function HANDLE_WM_COMPAREITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMPAREITEMFN)
      return Win32.LRESULT
   is
      function To_LPCCOMPAREITEMSTRUCT is new Ada.Unchecked_Conversion (
         Win32.LPARAM,
         LPCCOMPAREITEMSTRUCT);
   begin
      return To_LRESULT
               (Win32.DWORD (fn (hwnd, To_LPCCOMPAREITEMSTRUCT (lParam))));
   end HANDLE_WM_COMPAREITEM;

   function FORWARD_WM_COMPAREITEM
     (hwnd          : Win32.Windef.HWND;
      lpCompareItem : LPCCOMPAREITEMSTRUCT;
      fn            : LPDEFFN)
      return Win32.INT
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         LPCCOMPAREITEMSTRUCT,
         Win32.LPARAM);
   begin
      return Win32.INT (Win32.DWORD (fn
                                        (hwnd,
                                         Win32.Winuser.WM_COMPAREITEM,
                                         Win32.WPARAM (lpCompareItem.all.CtlID)
,
                                         To_LPARAM (lpCompareItem))));
   end FORWARD_WM_COMPAREITEM;

   function HANDLE_WM_VKEYTOITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPVKEYTOITEMFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (Win32.INT (fn
                                           (hwnd,
                                            Win32.UINT (Win32.Utils.LOWORD
                                                           (Win32.DWORD (
        wParam))),
                                            To_HWND (lParam),
                                            Win32.INT (Win32.SHORT (
        Win32.Utils.HIWORD (Win32.DWORD (wParam))))))));
   end HANDLE_WM_VKEYTOITEM;

   function FORWARD_WM_VKEYTOITEM
     (hwnd        : Win32.Windef.HWND;
      vk          : Win32.UINT;
      hwndListbox : Win32.Windef.HWND;
      iCaret      : Win32.INT;
      fn          : LPDEFFN)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (fn
                                        (hwnd,
                                         Win32.Winuser.WM_VKEYTOITEM,
                                         Win32.Winuser.MAKEWPARAM
                                            (Win32.WORD (vk),
                                             Win32.WORD (iCaret)),
                                         To_LPARAM (hwndListbox))));
   end FORWARD_WM_VKEYTOITEM;

   function HANDLE_WM_CHARTOITEM
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCHARTOITEMFN)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (Win32.INT (fn
                                           (hwnd,
                                            Win32.UINT (Win32.Utils.LOWORD
                                                           (Win32.DWORD (
        wParam))),
                                            To_HWND (lParam),
                                            Win32.INT (Win32.SHORT (
        Win32.Utils.HIWORD (Win32.DWORD (wParam))))))));
   end HANDLE_WM_CHARTOITEM;

   function FORWARD_WM_CHARTOITEM
     (hwnd        : Win32.Windef.HWND;
      ch          : Win32.UINT;
      hwndListbox : Win32.Windef.HWND;
      iCaret      : Win32.INT;
      fn          : LPDEFFN)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (fn
                                        (hwnd,
                                         Win32.Winuser.WM_CHARTOITEM,
                                         Win32.Winuser.MAKEWPARAM
                                            (Win32.WORD (iCaret),
                                             Win32.WORD (Win32.UINT (ch))),
                                         To_LPARAM (hwndListbox))));
   end FORWARD_WM_CHARTOITEM;

   function HANDLE_WM_QUEUESYNC
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPQUEUESYNCPROC)
      return Win32.LRESULT
   is
   begin
      fn (hwnd);
      return 0;
   end HANDLE_WM_QUEUESYNC;

   procedure FORWARD_WM_QUEUESYNC (hwnd : Win32.Windef.HWND; fn : LPDEFFN) is
      garbage : Win32.LRESULT;
   begin
      garbage := fn (hwnd, Win32.Winuser.WM_QUEUESYNC, 0, 0);
   end FORWARD_WM_QUEUESYNC;

   function HANDLE_WM_COMMNOTIFY
     (hwnd   : Win32.Windef.HWND;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      fn     : LPCOMMNOTIFYPROC)
      return Win32.LRESULT
   is
   begin
      fn
        (hwnd,
         Win32.INT (wParam),
         Win32.UINT (Win32.Utils.LOWORD (Win32.DWORD (lParam))));
      return 0;
   end HANDLE_WM_COMMNOTIFY;

   procedure FORWARD_WM_COMMNOTIFY
     (hwnd  : Win32.Windef.HWND;
      cid   : Win32.INT;
      flags : Win32.UINT;
      fn    : LPDEFFN)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         fn
           (hwnd,
            Win32.Winuser.WM_COMMNOTIFY,
            Win32.WPARAM (cid),
            Win32.Winuser.MAKELPARAM (Win32.WORD (flags), 0));
   end FORWARD_WM_COMMNOTIFY;

   function To_HICON is new Ada.Unchecked_Conversion (
      Win32.UINT,
      Win32.Windef.HICON);

   function Static_SetIcon
     (hwndCtl : Win32.Windef.HWND;
      hIcon   : Win32.Windef.HICON)
      return Win32.Windef.HICON
   is
      function To_DWORD is new Ada.Unchecked_Conversion (
         Win32.Windef.HICON,
         Win32.DWORD);
   begin
      return To_HICON
               (Win32.UINT (Win32.DWORD (Win32.Winuser.SendMessage
                                            (hwndCtl,
                                             Win32.Winuser.STM_GETICON,
                                             Win32.WPARAM (To_DWORD (hIcon)),
                                             0))));
   end Static_SetIcon;

   function Static_GetIcon
     (hwndCtl : Win32.Windef.HWND;
      hIcon   : Win32.Windef.HICON)
      return Win32.Windef.HICON
   is
   begin
      return To_HICON
               (Win32.UINT (Win32.DWORD (Win32.Winuser.SendMessage
                                            (hwndCtl,
                                             Win32.Winuser.STM_GETICON,
                                             0,
                                             0))));
   end Static_GetIcon;

   function Button_GetCheck (hwndCtl : Win32.Windef.HWND) return Win32.INT is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.BM_GETCHECK,
                                         0,
                                         0)));
   end Button_GetCheck;

   procedure Button_SetCheck
     (hwndCtl : Win32.Windef.HWND;
      check   : Win32.WPARAM)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.BM_SETCHECK,
            Win32.WPARAM (Win32.INT (check)),
            0);
   end Button_SetCheck;

   function Button_GetState (hwndCtl : Win32.Windef.HWND) return Win32.INT is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.BM_GETSTATE,
                                         0,
                                         0)));
   end Button_GetState;

   function Button_SetState
     (hwndCtl : Win32.Windef.HWND;
      state   : Win32.WPARAM)
      return Win32.UINT
   is
   begin
      return Win32.UINT (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.BM_SETSTATE,
                                          Win32.WPARAM (Win32.INT (state)),
                                          0)));
   end Button_SetState;

   procedure Button_SetStyle
     (hwndCtl : Win32.Windef.HWND;
      style   : Win32.DWORD;
      fRedraw : Win32.BOOL)
   is
      garbage : Win32.LRESULT;
      wRedraw : Win32.LPARAM;
   begin
      if (fRedraw = Win32.FALSE) then
         wRedraw := Win32.LPARAM (Win32.FALSE);
      else
         wRedraw := Win32.LPARAM (Win32.TRUE);
      end if;
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.BM_SETSTYLE,
            Win32.WPARAM (Win32.Utils.LOWORD (style)),
            wRedraw);
   end Button_SetStyle;

   procedure Edit_LimitText
     (hwndCtl : Win32.Windef.HWND;
      cchMax  : Win32.INT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_LIMITTEXT,
            Win32.WPARAM (cchMax),
            0);
   end Edit_LimitText;

   function Edit_GetLineCount
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.EM_GETLINECOUNT,
                                         0,
                                         0)));

   end Edit_GetLineCount;

   procedure Edit_GetLine
     (hwndCtl : Win32.Windef.HWND;
      line    : Win32.INT;
      lpch    : in out Win32.PCHAR;
      cchMax  : Win32.Size_T;
      cch     : out Win32.INT)
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winnt.LPTSTR,
         Win32.LPARAM);
   begin
      Interfaces.C.Strings.Update
        (Item   => Win32.To_Chars_Ptr (lpch),
         Offset => 0,
         Str    => Win32.Size_T'Image (cchMax));
      cch :=
        Win32.INT (Win32.Winuser.SendMessage
                      (hwndCtl,
                       Win32.Winuser.EM_GETLINE,
                       Win32.WPARAM (line),
                       To_LPARAM (Win32.Winnt.LPTSTR (lpch))));
   end Edit_GetLine;

   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.Windef.LPRECT,
      Win32.LPARAM);

   procedure Edit_GetRect
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_GETRECT,
            0,
            To_LPARAM (lprc));
   end Edit_GetRect;

   procedure Edit_SetRect
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETRECT,
            0,
            To_LPARAM (lprc));
   end Edit_SetRect;

   procedure Edit_SetRectNoPaint
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETRECTNP,
            0,
            To_LPARAM (lprc));
   end Edit_SetRectNoPaint;

   function Edit_GetSel (hwndCtl : Win32.Windef.HWND) return Win32.DWORD is
   begin
      return Win32.DWORD (Win32.Winuser.SendMessage
                             (hwndCtl,
                              Win32.Winuser.EM_GETSEL,
                              0,
                              0));
   end Edit_GetSel;

   procedure Edit_SetSel
     (hwndCtl  : Win32.Windef.HWND;
      ichStart : Win32.INT;
      ichEnd   : Win32.INT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETSEL,
            Win32.WPARAM (ichStart),
            Win32.LPARAM (ichEnd));
   end Edit_SetSel;

   procedure Edit_ReplaceSel
     (hwndCtl     : Win32.Windef.HWND;
      lpszReplace : Win32.Winnt.LPCTSTR)
   is

      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_REPLACESEL,
            0,
            To_LPARAM (lpszReplace));
   end Edit_ReplaceSel;

   function Edit_GetModify (hwndCtl : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.EM_GETMODIFY,
                                          0,
                                          0)));
   end Edit_GetModify;

   procedure Edit_SetModify
     (hwndCtl   : Win32.Windef.HWND;
      fModified : Win32.BOOL)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETMODIFY,
            Win32.WPARAM (Win32.UINT (fModified)),
            0);
   end Edit_SetModify;

   function Edit_ScrollCaret
     (hwndCtl : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.EM_SCROLLCARET,
                                          0,
                                          0)));
   end Edit_ScrollCaret;

   function Edit_LineFromChar
     (hwndCtl : Win32.Windef.HWND;
      ich     : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.EM_LINEFROMCHAR,
                                         Win32.WPARAM (ich),
                                         0)));
   end Edit_LineFromChar;

   function Edit_LineIndex
     (hwndCtl : Win32.Windef.HWND;
      line    : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.EM_LINEINDEX,
                                         Win32.WPARAM (line),
                                         0)));
   end Edit_LineIndex;

   function Edit_LineLength
     (hwndCtl : Win32.Windef.HWND;
      line    : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.EM_LINELENGTH,
                                         Win32.WPARAM (line),
                                         0)));
   end Edit_LineLength;

   procedure Edit_Scroll
     (hwndCtl : Win32.Windef.HWND;
      dv      : Win32.INT;
      dh      : Win32.INT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_LINESCROLL,
            Win32.WPARAM (dh),
            Win32.LPARAM (dv));
   end Edit_Scroll;

   function Edit_CanUndo (hwndCtl : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.EM_CANUNDO,
                                          0,
                                          0)));
   end Edit_CanUndo;

   function Edit_Undo (hwndCtl : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.EM_UNDO,
                                          0,
                                          0)));
   end Edit_Undo;

   procedure Edit_EmptyUndoBuffer (hwndCtl : Win32.Windef.HWND) is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_EMPTYUNDOBUFFER,
            0,
            0);
   end Edit_EmptyUndoBuffer;

   procedure Edit_SetPasswordChar
     (hwndCtl : Win32.Windef.HWND;
      ch      : Win32.CHAR)
   is

      function To_BYTE is new Ada.Unchecked_Conversion (
         Win32.CHAR,
         Win32.BYTE);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETPASSWORDCHAR,
            Win32.WPARAM (Win32.UINT (Win32.Utils.MAKELONG
                                         (Win32.Utils.MAKEWORD
                                             (To_BYTE (ch),
                                              0),
                                          0))),
            0);
   end Edit_SetPasswordChar;

   procedure Edit_SetTabStops
     (hwndCtl : Win32.Windef.HWND;
      cTabs   : Win32.INT;
      lpTabs  : Win32.LPWORD)
   is

      type LPCINT is access constant Win32.INT;
      function To_LPARAM is new Ada.Unchecked_Conversion (
         LPCINT,
         Win32.LPARAM);
      function To_LPCINT is new Ada.Unchecked_Conversion (
         Win32.LPWORD,
         LPCINT);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETTABSTOPS,
            Win32.WPARAM (cTabs),
            To_LPARAM (To_LPCINT (lpTabs)));
   end Edit_SetTabStops;

   function Edit_FmtLines
     (hwndCtl : Win32.Windef.HWND;
      fAddEOL : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.EM_FMTLINES,
                                          Win32.WPARAM (fAddEOL),
                                          0)));
   end Edit_FmtLines;

   function Edit_GetHandle
     (hwndCtl : Win32.Windef.HWND)
      return Win32.Windef.HLOCAL
   is
      function To_HLOCAL is new Ada.Unchecked_Conversion (
         Win32.UINT,
         Win32.Windef.HLOCAL);
   begin
      return To_HLOCAL
               (Win32.UINT (Win32.DWORD (Win32.Winuser.SendMessage
                                            (hwndCtl,
                                             Win32.Winuser.EM_GETHANDLE,
                                             0,
                                             0))));
   end Edit_GetHandle;

   procedure Edit_SetHandle
     (hwndCtl : Win32.Windef.HWND;
      h       : Win32.Windef.HLOCAL)
   is
      function To_UINT is new Ada.Unchecked_Conversion (
         Win32.Windef.HLOCAL,
         Win32.UINT);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETHANDLE,
            Win32.WPARAM (To_UINT (h)),
            0);
   end Edit_SetHandle;

   function Edit_GetFirstVisibleLine
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.EM_GETFIRSTVISIBLELINE,
                                         0,
                                         0)));
   end Edit_GetFirstVisibleLine;

   function Edit_SetReadOnly
     (hwndCtl   : Win32.Windef.HWND;
      fReadOnly : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.EM_SETREADONLY,
                                          Win32.WPARAM (fReadOnly),
                                          0)));
   end Edit_SetReadOnly;

   function Edit_GetPasswordChar
     (hwndCtl : Win32.Windef.HWND)
      return Win32.TCHAR
   is
   begin
      return LOCHAR
               (Win32.WPARAM (Win32.Winuser.SendMessage
                                 (hwndCtl,
                                  Win32.Winuser.EM_GETPASSWORDCHAR,
                                  0,
                                  0)));
   end Edit_GetPasswordChar;

   procedure Edit_SetWordBreakProc
     (hwndCtl       : Win32.Windef.HWND;
      lpfnWordBreak : Win32.Winuser.EDITWORDBREAKPROC)
   is

      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Winuser.EDITWORDBREAKPROC,
         Win32.LPARAM);
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.EM_SETWORDBREAKPROC,
            0,
            To_LPARAM (lpfnWordBreak));
   end Edit_SetWordBreakProc;

   function Edit_GetWordBreakProc
     (hwndCtl : Win32.Windef.HWND)
      return Win32.Winuser.EDITWORDBREAKPROC
   is
      function To_EDITWORDBREAKPROC is new Ada.Unchecked_Conversion (
         Win32.LRESULT,
         Win32.Winuser.EDITWORDBREAKPROC);
   begin
      return To_EDITWORDBREAKPROC
               (Win32.Winuser.SendMessage
                   (hwndCtl,
                    Win32.Winuser.EM_GETWORDBREAKPROC,
                    0,
                    0));
   end Edit_GetWordBreakProc;

   function ScrollBar_Enable
     (hwndCtl : Win32.Windef.HWND;
      flags   : Win32.UINT)
      return Win32.BOOL
   is
   begin
      return Win32.Winuser.EnableScrollBar
               (hwndCtl,
                Win32.Winuser.SB_CTL,
                flags);
   end ScrollBar_Enable;

   function ScrollBar_Show
     (hwndCtl : Win32.Windef.HWND;
      fShow   : Win32.BOOL)
      return Win32.BOOL
   is
      nCmdShow : Win32.INT;
   begin
      if (fShow = Win32.FALSE) then
         nCmdShow := Win32.Winuser.SW_HIDE;
      else
         nCmdShow := Win32.Winuser.SW_SHOWNORMAL;
      end if;
      return Win32.Winuser.ShowWindow (hwndCtl, nCmdShow);
   end ScrollBar_Show;

   function ScrollBar_SetPos
     (hwndCtl : Win32.Windef.HWND;
      pos     : Win32.INT;
      fRedraw : Win32.BOOL)
      return Win32.INT
   is
   begin
      return Win32.Winuser.SetScrollPos
               (hwndCtl,
                Win32.Winuser.SB_CTL,
                pos,
                fRedraw);
   end ScrollBar_SetPos;

   function ScrollBar_GetPos (hwndCtl : Win32.Windef.HWND) return Win32.INT is
   begin
      return Win32.Winuser.GetScrollPos (hwndCtl, Win32.Winuser.SB_CTL);
   end ScrollBar_GetPos;

   function ScrollBar_SetRange
     (hwndCtl : Win32.Windef.HWND;
      posMin  : Win32.INT;
      posMax  : Win32.INT;
      fRedraw : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.Winuser.SetScrollRange
               (hwndCtl,
                Win32.Winuser.SB_CTL,
                posMin,
                posMax,
                fRedraw);
   end ScrollBar_SetRange;

   function ScrollBar_GetRange
     (hwndCtl  : Win32.Windef.HWND;
      lpposMin : Win32.LPINT;
      lpposMax : Win32.LPINT)
      return Win32.BOOL
   is
   begin
      return Win32.Winuser.GetScrollRange
               (hwndCtl,
                Win32.Winuser.SB_CTL,
                lpposMin,
                lpposMax);
   end ScrollBar_GetRange;

   function ListBox_Enable
     (hwndCtl : Win32.Windef.HWND;
      fEnable : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.Winuser.EnableWindow (hwndCtl, fEnable);
   end ListBox_Enable;

   function ListBox_GetCount (hwndCtl : Win32.Windef.HWND) return Win32.INT is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETCOUNT,
                                         0,
                                         0)));
   end ListBox_GetCount;

   function ListBox_ResetContent
     (hwndCtl : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.LB_RESETCONTENT,
                                          0,
                                          0)));
   end ListBox_ResetContent;

   function ListBox_AddString
     (hwndCtl : Win32.Windef.HWND;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_ADDSTRING,
                                         0,
                                         To_LPARAM (lpsz))));
   end ListBox_AddString;

   function ListBox_InsertString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_INSERTSTRING,
                                         Win32.WPARAM (index),
                                         To_LPARAM (lpsz))));
   end ListBox_InsertString;

   function ListBox_AddItemData
     (hwndCtl : Win32.Windef.HWND;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_ADDSTRING,
                                         0,
                                         To_LPARAM (data))));
   end ListBox_AddItemData;

   function ListBox_InsertItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_INSERTSTRING,
                                         Win32.WPARAM (index),
                                         To_LPARAM (data))));
   end ListBox_InsertItemData;

   function ListBox_DeleteString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_DELETESTRING,
                                         Win32.WPARAM (index),
                                         0)));
   end ListBox_DeleteString;

   function ListBox_GetTextLen
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETTEXTLEN,
                                         Win32.WPARAM (index),
                                         0)));
   end ListBox_GetTextLen;

   function ListBox_GetText
     (hwndCtl    : Win32.Windef.HWND;
      index      : Win32.INT;
      lpszBuffer : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETTEXT,
                                         Win32.WPARAM (index),
                                         To_LPARAM (lpszBuffer))));
   end ListBox_GetText;

   function ListBox_GetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.LRESULT
   is
   begin
      return Win32.LRESULT (Win32.DWORD (Win32.Winuser.SendMessage
                                            (hwndCtl,
                                             Win32.Winuser.LB_GETITEMDATA,
                                             Win32.WPARAM (index),
                                             0)));
   end ListBox_GetItemData;

   function ListBox_SetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.DWORD)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SETITEMDATA,
                                         Win32.WPARAM (index),
                                         Win32.LPARAM (data))));
   end ListBox_SetItemData;

   function ListBox_FindString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_FINDSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (lpszFind))));
   end ListBox_FindString;

   function ListBox_FindItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_FINDSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (data))));
   end ListBox_FindItemData;

   function ListBox_SetSel
     (hwndCtl : Win32.Windef.HWND;
      fSelect : Win32.BOOL;
      index   : Win32.UINT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SETSEL,
                                         Win32.WPARAM (fSelect),
                                         Win32.LPARAM (index))));
   end ListBox_SetSel;

   function ListBox_SelItemRange
     (hwndCtl : Win32.Windef.HWND;
      fSelect : Win32.BOOL;
      first   : Win32.WORD;
      last    : Win32.WORD)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SELITEMRANGE,
                                         Win32.WPARAM (fSelect),
                                         Win32.Winuser.MAKELPARAM
                                            (first,
                                             last))));
   end ListBox_SelItemRange;

   function ListBox_GetCurSel
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETCURSEL,
                                         0,
                                         0)));
   end ListBox_GetCurSel;

   function ListBox_SetCurSel
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SETCURSEL,
                                         Win32.WPARAM (index),
                                         0)));
   end ListBox_SetCurSel;

   function ListBox_SelectString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.LPCSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SELECTSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (lpszFind))));
   end ListBox_SelectString;

   function ListBox_SelectItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.LPCSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SELECTSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (data))));
   end ListBox_SelectItemData;

   function ListBox_GetSel
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETSEL,
                                         Win32.WPARAM (index),
                                         0)));
   end ListBox_GetSel;

   function ListBox_GetSelCount
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETSELCOUNT,
                                         0,
                                         0)));
   end ListBox_GetSelCount;

   function ListBox_GetTopIndex
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETTOPINDEX,
                                         0,
                                         0)));
   end ListBox_GetTopIndex;

   function ListBox_GetSelItems
     (hwndCtl : Win32.Windef.HWND;
      cItems  : Win32.INT;
      lpItems : Win32.LPINT)
      return Win32.INT
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.LPINT,
         Win32.LPARAM);
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETSELITEMS,
                                         Win32.WPARAM (cItems),
                                         To_LPARAM (lpItems))));
   end ListBox_GetSelItems;

   function ListBox_SetTopIndex
     (hwndCtl  : Win32.Windef.HWND;
      indexTop : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SETTOPINDEX,
                                         Win32.WPARAM (indexTop),
                                         0)));
   end ListBox_SetTopIndex;

   procedure ListBox_SetColumnWidth
     (hwndCtl  : Win32.Windef.HWND;
      cxColumn : Win32.INT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.LB_SETCOLUMNWIDTH,
            Win32.WPARAM (cxColumn),
            0);
   end ListBox_SetColumnWidth;

   function ListBox_GetHorizontalExtent
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETHORIZONTALEXTENT,
                                         0,
                                         0)));
   end ListBox_GetHorizontalExtent;

   procedure ListBox_SetHorizontalExtent
     (hwndCtl  : Win32.Windef.HWND;
      cxExtent : Win32.INT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.LB_SETHORIZONTALEXTENT,
            Win32.WPARAM (cxExtent),
            0);
   end ListBox_SetHorizontalExtent;

   function ListBox_SetTabStops
     (hwndCtl : Win32.Windef.HWND;
      cTabs   : Win32.INT;
      lpTabs  : Win32.LPINT)
      return Win32.BOOL
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.LPINT,
         Win32.LPARAM);
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.LB_SETTABSTOPS,
                                          Win32.WPARAM (cTabs),
                                          To_LPARAM (lpTabs))));
   end ListBox_SetTabStops;

   function ListBox_GetItemRect
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      lprc    : Win32.Windef.LPRECT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETITEMRECT,
                                         Win32.WPARAM (index),
                                         To_LPARAM (lprc))));
   end ListBox_GetItemRect;

   function ListBox_SetCaretIndex
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SETCARETINDEX,
                                         Win32.WPARAM (index),
                                         0)));
   end ListBox_SetCaretIndex;

   function ListBox_GetCaretIndex
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETCARETINDEX,
                                         0,
                                         0)));
   end ListBox_GetCaretIndex;

   function ListBox_FindStringExact
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_FINDSTRINGEXACT,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (lpszFind))));
   end ListBox_FindStringExact;

   function ListBox_SetItemHeight
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      cy      : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_SETITEMHEIGHT,
                                         Win32.WPARAM (index),
                                         Win32.Winuser.MAKELPARAM
                                            (Win32.WORD (cy),
                                             0))));
   end ListBox_SetItemHeight;

   function ListBox_GetItemHeight
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_GETITEMHEIGHT,
                                         Win32.WPARAM (index),
                                         0)));
   end ListBox_GetItemHeight;

   function ListBox_Dir
     (hwndCtl      : Win32.Windef.HWND;
      attrs        : Win32.UINT;
      lpszFileSpec : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.LB_DIR,
                                         Win32.WPARAM (attrs),
                                         To_LPARAM (lpszFileSpec))));
   end ListBox_Dir;

   function ComboBox_LimitText
     (hwndCtl  : Win32.Windef.HWND;
      cchLimit : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_LIMITTEXT,
                                         Win32.WPARAM (cchLimit),
                                         0)));
   end ComboBox_LimitText;

   function ComboBox_GetEditSel
     (hwndCtl : Win32.Windef.HWND)
      return Win32.DWORD
   is
   begin
      return To_DWORD
               (Win32.Winuser.SendMessage
                   (hwndCtl,
                    Win32.Winuser.CB_GETEDITSEL,
                    0,
                    0));
   end ComboBox_GetEditSel;

   function ComboBox_SetEditSel
     (hwndCtl  : Win32.Windef.HWND;
      ichStart : Win32.INT;
      ichEnd   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_SETEDITSEL,
                                         0,
                                         Win32.Winuser.MAKELPARAM
                                            (Win32.WORD (ichStart),
                                             Win32.WORD (ichEnd)))));
   end ComboBox_SetEditSel;

   function ComboBox_GetCount
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_GETCOUNT,
                                         0,
                                         0)));
   end ComboBox_GetCount;

   function ComboBox_ResetContent
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_RESETCONTENT,
                                         0,
                                         0)));
   end ComboBox_ResetContent;

   function ComboBox_AddString
     (hwndCtl : Win32.Windef.HWND;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_ADDSTRING,
                                         0,
                                         To_LPARAM (lpsz))));
   end ComboBox_AddString;

   function ComboBox_InsertString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      lpsz    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_INSERTSTRING,
                                         Win32.WPARAM (index),
                                         To_LPARAM (lpsz))));
   end ComboBox_InsertString;

   function ComboBox_AddItemData
     (hwndCtl : Win32.Windef.HWND;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_ADDSTRING,
                                         0,
                                         To_LPARAM (data))));
   end ComboBox_AddItemData;

   function ComboBox_InsertItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_INSERTSTRING,
                                         Win32.WPARAM (index),
                                         To_LPARAM (data))));
   end ComboBox_InsertItemData;

   function ComboBox_DeleteString
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_DELETESTRING,
                                         Win32.WPARAM (index),
                                         0)));
   end ComboBox_DeleteString;

   function ComboBox_GetLBTextLen
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_GETLBTEXTLEN,
                                         Win32.WPARAM (index),
                                         0)));
   end ComboBox_GetLBTextLen;

   function ComboBox_GetLBText
     (hwndCtl    : Win32.Windef.HWND;
      index      : Win32.INT;
      lpszBuffer : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_GETLBTEXT,
                                         Win32.WPARAM (index),
                                         To_LPARAM (lpszBuffer))));
   end ComboBox_GetLBText;

   function ComboBox_GetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.LRESULT
   is
   begin
      return To_LRESULT
               (Win32.DWORD (Win32.Winuser.SendMessage
                                (hwndCtl,
                                 Win32.Winuser.CB_GETITEMDATA,
                                 Win32.WPARAM (index),
                                 0)));
   end ComboBox_GetItemData;

   function ComboBox_SetItemData
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT;
      data    : Win32.DWORD)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_SETITEMDATA,
                                         Win32.WPARAM (index),
                                         Win32.LPARAM (data))));
   end ComboBox_SetItemData;

   function ComboBox_FindString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_FINDSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (lpszFind))));
   end ComboBox_FindString;

   function ComboBox_FindItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_FINDSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (data))));
   end ComboBox_FindItemData;

   function ComboBox_GetCurSel
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_GETCURSEL,
                                         0,
                                         0)));
   end ComboBox_GetCurSel;

   function ComboBox_SetCurSel
     (hwndCtl : Win32.Windef.HWND;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_SETCURSEL,
                                         Win32.WPARAM (index),
                                         0)));
   end ComboBox_SetCurSel;

   function ComboBox_SelectString
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszSelect : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_SELECTSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (lpszSelect))));
   end ComboBox_SelectString;

   function ComboBox_SelectItemData
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      data       : Win32.LPCSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_SELECTSTRING,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (data))));
   end ComboBox_SelectItemData;

   function ComboBox_Dir
     (hwndCtl      : Win32.Windef.HWND;
      attrs        : Win32.UINT;
      lpszFileSpec : Win32.Winnt.LPCTSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_DIR,
                                         Win32.WPARAM (attrs),
                                         To_LPARAM (lpszFileSpec))));
   end ComboBox_Dir;

   function ComboBox_ShowDropdown
     (hwndCtl : Win32.Windef.HWND;
      fShow   : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.CB_SHOWDROPDOWN,
                                          Win32.WPARAM (fShow),
                                          0)));
   end ComboBox_ShowDropdown;

   function ComboBox_FindStringExact
     (hwndCtl    : Win32.Windef.HWND;
      indexStart : Win32.INT;
      lpszFind   : Win32.LPCSTR)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_FINDSTRINGEXACT,
                                         Win32.WPARAM (indexStart),
                                         To_LPARAM (lpszFind))));
   end ComboBox_FindStringExact;

   function ComboBox_GetDroppedState
     (hwndCtl : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.CB_GETDROPPEDSTATE,
                                          0,
                                          0)));
   end ComboBox_GetDroppedState;

   procedure ComboBox_GetDroppedControlRect
     (hwndCtl : Win32.Windef.HWND;
      lprc    : Win32.Windef.LPRECT)
   is
      garbage : Win32.LRESULT;
   begin
      garbage :=
         Win32.Winuser.SendMessage
           (hwndCtl,
            Win32.Winuser.CB_GETDROPPEDCONTROLRECT,
            0,
            To_LPARAM (lprc));
   end ComboBox_GetDroppedControlRect;

   function ComboBox_GetItemHeight
     (hwndCtl : Win32.Windef.HWND)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_GETITEMHEIGHT,
                                         0,
                                         0)));
   end ComboBox_GetItemHeight;

   function ComboBox_SetItemHeight
     (hwndCtl : Win32.Windef.HWND;
      cyItem  : Win32.INT;
      index   : Win32.INT)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_SETITEMHEIGHT,
                                         Win32.WPARAM (index),
                                         Win32.LPARAM (cyItem))));
   end ComboBox_SetItemHeight;

   function ComboBox_GetExtendedUI
     (hwndCtl : Win32.Windef.HWND)
      return Win32.UINT
   is
   begin
      return Win32.UINT (Win32.DWORD (Win32.Winuser.SendMessage
                                         (hwndCtl,
                                          Win32.Winuser.CB_GETEXTENDEDUI,
                                          0,
                                          0)));
   end ComboBox_GetExtendedUI;

   function ComboBox_SetExtendedUI
     (hwndCtl : Win32.Windef.HWND;
      flags   : Win32.BOOL)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.DWORD (Win32.Winuser.SendMessage
                                        (hwndCtl,
                                         Win32.Winuser.CB_SETEXTENDEDUI,
                                         Win32.WPARAM (Win32.UINT (flags)),
                                         0)));
   end ComboBox_SetExtendedUI;

   function GET_WPARAM
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WPARAM
   is
   begin
      return wp;
   end GET_WPARAM;

   function GET_LPARAM
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.LPARAM
   is
   begin
      return lp;
   end GET_LPARAM;

   function GET_WM_ACTIVATE_STATE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.Utils.LOWORD (Win32.DWORD (wp));
   end GET_WM_ACTIVATE_STATE;

   function GET_WM_ACTIVATE_FMINIMIZED
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.Utils.HIWORD (Win32.DWORD (wp)));
   end GET_WM_ACTIVATE_FMINIMIZED;

   function GET_WM_ACTIVATE_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_ACTIVATE_HWND;

   function To_LONG is new Ada.Unchecked_Conversion (
      Win32.Windef.HWND,
      Win32.LONG);

   function GET_WM_ACTIVATE_MPS
     (s    : Win32.WORD;
      fmin : Win32.BOOL;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_ACTIVATE_MPS;

   function GET_WM_CHARTOITEM_CHAR
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.TCHAR
   is
   begin
      return LOCHAR (wp);
   end GET_WM_CHARTOITEM_CHAR;

   function GET_WM_CHARTOITEM_POS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.WORD (wp);
   end GET_WM_CHARTOITEM_POS;

   function GET_WM_CHARTOITEM_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_CHARTOITEM_HWND;

   function GET_WM_CHARTOITEM_MPS
     (ch   : Win32.TCHAR;
      pos  : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_CHARTOITEM_MPS;

   function GET_WM_COMMAND_ID
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.Utils.LOWORD (Win32.DWORD (wp));
   end GET_WM_COMMAND_ID;

   function GET_WM_COMMAND_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_COMMAND_HWND;

   function GET_WM_COMMAND_CMD
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.Utils.HIWORD (Win32.DWORD (lp));
   end GET_WM_COMMAND_CMD;

   function GET_WM_COMMAND_MPS
     (id   : Win32.WORD;
      hwnd : Win32.Windef.HWND;
      cmd  : Win32.WORD)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_COMMAND_MPS;

   function GET_WM_CTLCOLOR_HDC
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM;
      msg  : Win32.UINT)
      return Win32.Windef.HDC
   is
   begin
      return To_HDC (wp);
   end GET_WM_CTLCOLOR_HDC;

   function GET_WM_CTLCOLOR_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM;
      msg  : Win32.UINT)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_CTLCOLOR_HWND;

   function GET_WM_CTLCOLOR_TYPE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM;
      msg  : Win32.UINT)
      return Win32.WORD
   is
      use Interfaces.C;
   begin
      return Win32.WORD (msg - Win32.Winuser.WM_CTLCOLORMSGBOX);
   end GET_WM_CTLCOLOR_TYPE;

   function GET_WM_CTLCOLOR_MSG (the_type : Win32.UINT) return Win32.WORD is
      use Interfaces.C;
   begin
      return Win32.WORD (Win32.Winuser.WM_CTLCOLORMSGBOX + the_type);
   end GET_WM_CTLCOLOR_MSG;

   function GET_WM_CTLCOLOR_MPS
     (hdc      : Win32.Windef.HDC;
      hwnd     : Win32.Windef.HWND;
      the_type : Win32.UINT)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_CTLCOLOR_MPS;

   function GET_WM_MENUSELECT_CMD
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.Utils.LOWORD (Win32.DWORD (wp));
   end GET_WM_MENUSELECT_CMD;

   function GET_WM_MENUSELECT_FLAGS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.UINT
   is
   begin
      return Win32.UINT (Win32.INT (Win32.SHORT (Win32.Utils.HIWORD
                                                    (Win32.DWORD (wp)))));
   end GET_WM_MENUSELECT_FLAGS;

   function GET_WM_MENUSELECT_HMENU
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HMENU
   is
   begin
      return To_HMENU (lp);
   end GET_WM_MENUSELECT_HMENU;

   function GET_WM_MENUSELECT_MPS
     (cmd   : Win32.WORD;
      f     : Win32.UINT;
      hmenu : Win32.Windef.HMENU)
      return Win32.LONG
   is
   begin
      return To_LONG (hmenu);
   end GET_WM_MENUSELECT_MPS;

   function GET_WM_MDIACTIVATE_FACTIVATE
     (hwnd : Win32.Windef.HWND;
      wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.BOOL
   is
      use type Win32.Windef.HWND;
   begin
      if To_HWND (lp) = hwnd then
         return Win32.TRUE;
      else
         return Win32.FALSE;
      end if;
   end GET_WM_MDIACTIVATE_FACTIVATE;

   function GET_WM_MDIACTIVATE_HWNDDEACT
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (wp);
   end GET_WM_MDIACTIVATE_HWNDDEACT;

   function GET_WM_MDIACTIVATE_HWNDACTIVATE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_MDIACTIVATE_HWNDACTIVATE;

   function GET_WM_MDIACTIVATE_MPS
     (f     : Win32.BOOL;
      hwndD : Win32.Windef.HWND;
      hwndA : Win32.Windef.HWND)
      return Win32.LONG
   is
   begin
      return 0;
   end GET_WM_MDIACTIVATE_MPS;

   function GET_WM_MDISETMENU_MPS
     (hmenuF : Win32.Windef.HMENU;
      hmenuW : Win32.Windef.HMENU)
      return Win32.LONG
   is
   begin
      return To_LONG (hmenuW);
   end GET_WM_MDISETMENU_MPS;

   function GET_WM_MENUCHAR_CHAR
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.TCHAR
   is
   begin
      return LOCHAR (wp);
   end GET_WM_MENUCHAR_CHAR;

   function GET_WM_MENUCHAR_HMENU
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HMENU
   is
   begin
      return To_HMENU (lp);
   end GET_WM_MENUCHAR_HMENU;

   function GET_WM_MENUCHAR_FMENU
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (Win32.Utils.HIWORD (Win32.DWORD (wp)));
   end GET_WM_MENUCHAR_FMENU;

   function GET_WM_MENUCHAR_MPS
     (ch    : Win32.TCHAR;
      hmenu : Win32.Windef.HMENU;
      f     : Win32.BOOL)
      return Win32.LONG
   is
   begin
      return To_LONG (hmenu);
   end GET_WM_MENUCHAR_MPS;

   function GET_WM_PARENTNOTIFY_MSG
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.WORD (wp);
   end GET_WM_PARENTNOTIFY_MSG;

   function GET_WM_PARENTNOTIFY_ID
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.Utils.HIWORD (Win32.DWORD (wp));
   end GET_WM_PARENTNOTIFY_ID;

   function GET_WM_PARENTNOTIFY_HWNDCHILD
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_PARENTNOTIFY_HWNDCHILD;

   function GET_WM_PARENTNOTIFY_X
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (wp))));
   end GET_WM_PARENTNOTIFY_X;

   function GET_WM_PARENTNOTIFY_Y
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.SHORT (Win32.Utils.HIWORD (Win32.DWORD (wp))));
   end GET_WM_PARENTNOTIFY_Y;

   function GET_WM_PARENTNOTIFY_MPS
     (msg  : Win32.WORD;
      id   : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_PARENTNOTIFY_MPS;

   function GET_WM_PARENTNOTIFY2_MPS
     (msg  : Win32.WORD;
      x    : Win32.INT;
      y    : Win32.INT)
      return Win32.DWORD
   is
   begin
      return Win32.Utils.MAKELONG (Win32.WORD (x), Win32.WORD (y));
   end GET_WM_PARENTNOTIFY2_MPS;

   function GET_WM_VKEYTOITEM_CODE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT
   is
   begin
      return Win32.INT (Win32.SHORT (Win32.Utils.LOWORD (Win32.DWORD (wp))));
   end GET_WM_VKEYTOITEM_CODE;

   function GET_WM_VKEYTOITEM_ITEM
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.WORD (wp);
   end GET_WM_VKEYTOITEM_ITEM;

   function GET_WM_VKEYTOITEM_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_VKEYTOITEM_HWND;

   function GET_WM_VKEYTOITEM_MPS
     (code : Win32.INT;
      item : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_VKEYTOITEM_MPS;

   function GET_EM_SETSEL_START
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.INT
   is
   begin
      return Win32.INT (wp);
   end GET_EM_SETSEL_START;

   function GET_EM_SETSEL_END
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.LPARAM
   is
   begin
      return lp;
   end GET_EM_SETSEL_END;

   function GET_EM_SETSEL_MPS
     (iStart : Win32.UINT;
      iEnd   : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (iEnd);
   end GET_EM_SETSEL_MPS;

   function GET_EM_LINESCROLL_MPS
     (vert : Win32.UINT;
      horz : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (vert);
   end GET_EM_LINESCROLL_MPS;

   function GET_WM_CHANGECBCHAIN_HWNDNEXT
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_CHANGECBCHAIN_HWNDNEXT;

   function GET_WM_HSCROLL_CODE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.WORD (wp);
   end GET_WM_HSCROLL_CODE;

   function GET_WM_HSCROLL_POS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.WORD (wp);
   end GET_WM_HSCROLL_POS;

   function GET_WM_HSCROLL_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_HSCROLL_HWND;

   function GET_WM_HSCROLL_MPS
     (code : Win32.WORD;
      pos  : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_HSCROLL_MPS;

   function GET_WM_VSCROLL_CODE
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.WORD (wp);
   end GET_WM_VSCROLL_CODE;

   function GET_WM_VSCROLL_POS
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.WORD
   is
   begin
      return Win32.WORD (wp);
   end GET_WM_VSCROLL_POS;

   function GET_WM_VSCROLL_HWND
     (wp   : Win32.WPARAM;
      lp   : Win32.LPARAM)
      return Win32.Windef.HWND
   is
   begin
      return To_HWND (lp);
   end GET_WM_VSCROLL_HWND;

   function GET_WM_VSCROLL_MPS
     (code : Win32.WORD;
      pos  : Win32.WORD;
      hwnd : Win32.Windef.HWND)
      return Win32.LONG
   is
   begin
      return To_LONG (hwnd);
   end GET_WM_VSCROLL_MPS;

end Win32.Windowsx;
