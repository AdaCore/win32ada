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



with Win32.Objbase;

with Win32.Shellapi;

with Win32.Windef;

with Win32.Winnt;

with Win32.Winuser;



package Win32.Windowsx is



   WM_CTLCOLOR : constant := 16#19#; --  windowsx.h:1161





   function GetInstanceModule (hInstance : Win32.Windef.HMODULE)

                             return Win32.Windef.HMODULE; --  windowsx.h: 20



   function GlobalPtrHandle (lp : Win32.LPCVOID) return Win32.Windef.HGLOBAL;

   --  windowsx.h: 22



   function GlobalLockPtr (lp : Win32.LPCVOID) return Win32.BOOL;

   --  windowsx.h:25



   function GlobalUnlockPtr (lp : Win32.LPCVOID) return Win32.BOOL;

   --  windowsx.h:27



   function GlobalAllocPtr (flags : Win32.UINT;

                           cb : Win32.DWORD) return Win32.LPVOID;

   --  windowsx.h: 30



   function GlobalReAllocPtr (lp : Win32.LPCVOID;

                             cbNew : Win32.DWORD;

                             flags : Win32.UINT) return Win32.LPVOID;

   --  windowsx.h: 32



   function GlobalFreePtr (lp : Win32.LPCVOID) return Win32.BOOL;

   --  windowsx.h: 34



   function  DeletePen (hpen : Win32.Windef.HPEN) return Win32.BOOL;

   --  windowsx.h:39



   function  SelectPen (hdc : Win32.Windef.HDC;

                       hpen : Win32.Windef.HPEN)

                      return Win32.Windef.HPEN;     --  windowsx.h:40



   function  GetStockPen (i : Win32.INT) return Win32.Windef.HPEN;

   --  windowsx.h:41



   function  DeleteBrush (hbr : Win32.Windef.HBRUSH) return Win32.BOOL;

   --  windowsx.h:43



   function  SelectBrush (hdc : Win32.Windef.HDC;

                         hbr : Win32.Windef.HBRUSH)

                        return Win32.Windef.HBRUSH;   --  windowsx.h:44



   function  GetStockBrush (i : Win32.INT) return Win32.Windef.HBRUSH;

   --  windowsx.h:45



   function  DeleteRgn (hrgn : Win32.Windef.HRGN) return Win32.BOOL;

   --  windowsx.h:47



   function  CopyRgn (hrgnDst : Win32.Windef.HRGN;

                     hrgnSrc : Win32.Windef.HRGN) return Win32.INT;

   --  windowsx.h:49



   function  IntersectRgn (hrgnResult : Win32.Windef.HRGN;

                          hrgnA : Win32.Windef.HRGN;

                          hrgnB : Win32.Windef.HRGN)

                         return Win32.INT;   --  windowsx.h:50



   function  SubtractRgn (hrgnResult : Win32.Windef.HRGN;

                         hrgnA : Win32.Windef.HRGN;

                         hrgnB : Win32.Windef.HRGN)

                        return Win32.INT;    --  windowsx.h:51



   function  UnionRgn (hrgnResult : Win32.Windef.HRGN;

                      hrgnA : Win32.Windef.HRGN;

                      hrgnB : Win32.Windef.HRGN)

                     return Win32.INT;      --  windowsx.h:52



   function  XorRgn (hrgnResult : Win32.Windef.HRGN;

                    hrgnA : Win32.Windef.HRGN;

                    hrgnB : Win32.Windef.HRGN)

                   return Win32.INT;      --  windowsx.h:53



   function  DeletePalette (hpal : Win32.Windef.HPALETTE) return Win32.BOOL;

   --  windowsx.h:55

   function  DeleteFont (hfont : Win32.Windef.HFONT) return Win32.BOOL;

   --  windowsx.h:57



   function  SelectFont (hdc : Win32.Windef.HDC;

                        hfont : Win32.Windef.HFONT)

                       return Win32.Windef.HFONT;    --  windowsx.h:58



   function  GetStockFont (i : Win32.INT) return Win32.Windef.HFONT;

   --  windowsx.h:59



   function  DeleteBitmap (hbm : Win32.Windef.HBITMAP) return Win32.BOOL;

   --  windowsx.h:61



   function  SelectBitmap (hdc : Win32.Windef.HDC;

                          hbm : Win32.Windef.HBITMAP)

                         return Win32.Windef.HBITMAP;  --  windowsx.h:62



   function InsetRect (lprc : Win32.Windef.LPRECT;

                      dx : Win32.INT;

                      dy : Win32.INT)

                     return Win32.BOOL;           --  windowsx.h:64





   function GetWindowInstance (hwnd : Win32.Windef.HWND)

                             return Win32.Windef.HMODULE; --  windowsx.h:68



   function GetWindowStyle (hwnd : Win32.Windef.HWND)

                          return Win32.DWORD;             --  windowsx.h:70



   function GetWindowExStyle (hwnd : Win32.Windef.HWND)

                            return Win32.DWORD;           --  windowsx.h:71





   function GetWindowOwner (hwnd : Win32.Windef.HWND)

                           return Win32.Windef.HWND;

   --  windowsx.h:73



   function GetFirstChild (hwnd : Win32.Windef.HWND) return Win32.Windef.HWND

     renames Win32.Winuser.GetTopWindow;                 --  windowsx.h:75



   function GetFirstSibling (hwnd : Win32.Windef.HWND)

                            return Win32.Windef.HWND;

   --  windowsx.h:76

   function GetLastSibling (hwnd : Win32.Windef.HWND)

                           return Win32.Windef.HWND;

   --  windowsx.h:77

   function GetNextSibling (hwnd : Win32.Windef.HWND)

                           return Win32.Windef.HWND;

   --  windowsx.h:78

   function GetPrevSibling (hwnd : Win32.Windef.HWND)

                           return Win32.Windef.HWND;

   --  windowsx.h:79

   function GetWindowID (hwnd : Win32.Windef.HWND) return Win32.INT

     renames Win32.Winuser.GetDlgCtrlID;                 --  windowsx.h:79



   procedure SetWindowRedraw (hwnd : Win32.Windef.HWND;

                             fRedraw : Win32.BOOL);         --  windowsx.h:83



   function SubclassWindow (hwnd : Win32.Windef.HWND;

                           lpfn : Win32.Windef.FARPROC)

                          return Win32.Winuser.WNDPROC;   --  windowsx.h:86



   function IsMinimized (hwnd : Win32.Windef.HWND) return Win32.BOOL

     renames Win32.Winuser.IsIconic;                     --  windowsx.h:89

   function IsMaximized (hwnd : Win32.Windef.HWND) return Win32.BOOL

     renames Win32.Winuser.IsZoomed;                     --  windowsx.h:90

   function IsRestored (hwnd : Win32.Windef.HWND) return Win32.BOOL;

   --  windowsx.h:91



   function MapWindowRect (hwndFrom : Win32.Windef.HWND;

                          hwndTo : Win32.Windef.HWND;

                          lprc : Win32.Windef.LPPOINT)

                         return Win32.INT;                --  windowsx.h: 97



   function IsLButtonDown return Win32.BOOL;               --  windowsx.h:100

   function IsRButtonDown return Win32.BOOL;               --  windowsx.h:101

   function IsMButtonDown return Win32.BOOL;               --  windowsx.h:102



   function SubclassDialog (hwndDlg : Win32.Windef.HWND;

                           lpfn : Win32.Winuser.DLGPROC)

                          return Win32.Winuser.DLGPROC;   --  windowsx.h:104



   function SetDlgMsgResult (hwnd : Win32.Windef.HWND;

                            msg : Win32.UINT;

                            result : Win32.LRESULT) return Win32.BOOL;

   --  windowsx.h:107



   function DefDlgProcEx (hwnd : Win32.Windef.HWND;

                         msg : Win32.UINT;

                         wParam : Win32.WPARAM;

                         lParam : Win32.LPARAM;

                         pfRecursion : Win32.PBOOL) return Win32.LRESULT;

   --  windowsx.h:122



   --  The CheckDefDlgRecursion(pfRecursion) function cannot be translated

   --  into Ada                                         -- windowsx.h:125



   --  The HANDLE_MSG macro cannot be translated into Ada.-- windowsx.h:130



   type LPDEFFN is access function (hwnd : Win32.Windef.HWND;

                                    uMsg : Win32.UINT;

                                    wparam : Win32.WPARAM;

                                    lParam : Win32.LPARAM)

                                  return Win32.LRESULT;



   pragma Convention (Stdcall, LPDEFFN);



   type LPCOMPACTINGPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             compactRatio : Win32.UINT);



   function HANDLE_WM_COMPACTING (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPCOMPACTINGPROC)

                                return Win32.LRESULT;     --  windowsx.h:134



   procedure FORWARD_WM_COMPACTING (hwnd : Win32.Windef.HWND;

                                   compactRatio : Win32.UINT;

                                   fn : LPDEFFN); --  windowsx.h:136



   type LPWININICHANGEPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      lpszSectionName : Win32.Winnt.LPCTSTR);



   function HANDLE_WM_WININICHANGE (hwnd : Win32.Windef.HWND;

                                   wParam : Win32.WPARAM;

                                   lParam : Win32.LPARAM;

                                   fn : LPWININICHANGEPROC)

                                  return Win32.LRESULT;   --  windowsx.h:140



   procedure FORWARD_WM_WININICHANGE (hwnd : Win32.Windef.HWND;

                                     lpszSectionName : Win32.Winnt.LPCTSTR;

                                     fn : LPDEFFN);

   --  windowsx.h:142



   type LPSYSCOLORCHANGEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_SYSCOLORCHANGE (hwnd : Win32.Windef.HWND;

                                     wParam : Win32.WPARAM;

                                     lParam : Win32.LPARAM;

                                     fn : LPSYSCOLORCHANGEPROC)

                                    return Win32.LRESULT; --  windowsx.h:146



   procedure FORWARD_WM_SYSCOLORCHANGE (hwnd : Win32.Windef.HWND;

                                       fn : LPDEFFN);     --  windowsx.h:148



   type LPQUERYNEWPALETTEFN is access function (hwnd : Win32.Windef.HWND)

                                              return Win32.BOOL;



   function HANDLE_WM_QUERYNEWPALETTE (hwnd : Win32.Windef.HWND;

                                      wParam : Win32.WPARAM;

                                      lParam : Win32.LPARAM;

                                      fn : LPQUERYNEWPALETTEFN)

                                     return Win32.LRESULT; --  windowsx.h:152



   function FORWARD_WM_QUERYNEWPALETTE (hwnd : Win32.Windef.HWND;

                                       fn : LPDEFFN)

                                      return Win32.BOOL;  --  windowsx.h:154



   type LPPALETTEISCHANGINGPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      hwndPaletteChange : Win32.Windef.HWND);



   function HANDLE_WM_PALETTEISCHANGING (hwnd : Win32.Windef.HWND;

                                        wParam : Win32.WPARAM;

                                        lParam : Win32.LPARAM;

                                        fn : LPPALETTEISCHANGINGPROC)

                                       return Win32.LRESULT;

   --  windowsx.h:158



   procedure FORWARD_WM_PALETTEISCHANGING

     (hwnd : Win32.Windef.HWND;

      hwndPaletteChange : Win32.Windef.HWND;

      fn : LPDEFFN);                --  windowsx.h:160



   type LPPALETTECHANGEDPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      hwndPaletteChange : Win32.Windef.HWND);



   function HANDLE_WM_PALETTECHANGED (hwnd : Win32.Windef.HWND;

                                     wParam : Win32.WPARAM;

                                     lParam : Win32.LPARAM;

                                     fn : LPPALETTECHANGEDPROC)

                                    return Win32.LRESULT; --  windowsx.h:164



   procedure FORWARD_WM_PALETTECHANGED (hwnd : Win32.Windef.HWND;

                                       hwndPaletteChange : Win32.Windef.HWND;

                                       fn : LPDEFFN);

   --  windowsx.h:166



   type LPFONTCHANGEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_FONTCHANGE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPFONTCHANGEPROC)

                                return Win32.LRESULT;     --  windowsx.h:170



   procedure FORWARD_WM_FONTCHANGE (hwnd : Win32.Windef.HWND;

                                   fn : LPDEFFN);         --  windowsx.h:172



   type LPSPOOLERSTATUSPROC is access procedure (

                                                hwnd : Win32.Windef.HWND;

                                                status : Win32.UINT;

                                                cJobInQueue : Win32.INT);



   function HANDLE_WM_SPOOLERSTATUS (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPSPOOLERSTATUSPROC)

                                   return Win32.LRESULT;  --  windowsx.h:176



   procedure FORWARD_WM_SPOOLERSTATUS (hwnd : Win32.Windef.HWND;

                                      status : Win32.UINT;

                                      cJobInQueue : Win32.INT;

                                      fn : LPDEFFN);

   --  windowsx.h:178



   type LPDEVMODECHANGEPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      lpszDeviceName : Win32.Winnt.LPCTSTR);



   function HANDLE_WM_DEVMODECHANGE (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPDEVMODECHANGEPROC)

                                   return Win32.LRESULT;  --  windowsx.h:182



   procedure FORWARD_WM_DEVMODECHANGE (hwnd : Win32.Windef.HWND;

                                      lpszDeviceName : Win32.Winnt.LPCTSTR;

                                      fn : LPDEFFN);

   --  windowsx.h:184



   type LPTIMECHANGEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_TIMECHANGE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPTIMECHANGEPROC)

                                return Win32.LRESULT;     --  windowsx.h:188



   procedure FORWARD_WM_TIMECHANGE (hwnd : Win32.Windef.HWND;

                                   fn : LPDEFFN);         --  windowsx.h:190



   type LPPOWERPROC is access procedure (hwnd : Win32.Windef.HWND;

                                        code : Win32.INT);



   function HANDLE_WM_POWER (hwnd : Win32.Windef.HWND;

                            wParam : Win32.WPARAM;

                            lParam : Win32.LPARAM;

                            fn : LPPOWERPROC)

                           return Win32.LRESULT;          --  windowsx.h:194



   procedure FORWARD_WM_POWER (hwnd : Win32.Windef.HWND;

                              code : Win32.INT;

                              fn : LPDEFFN);              --  windowsx.h:196



   type LPQUERYENDSESSIONFN is access function (hwnd : Win32.Windef.HWND)

                                              return Win32.BOOL;



   function HANDLE_WM_QUERYENDSESSION (hwnd : Win32.Windef.HWND;

                                      wParam : Win32.WPARAM;

                                      lParam : Win32.LPARAM;

                                      fn : LPQUERYENDSESSIONFN)

                                     return Win32.LRESULT; --  windowsx.h:200



   function FORWARD_WM_QUERYENDSESSION (hwnd : Win32.Windef.HWND;

                                       fn : LPDEFFN)

                                      return Win32.BOOL;  --  windowsx.h:202



   type LPENDSESSIONPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             fEnding : Win32.BOOL);



   function HANDLE_WM_ENDSESSION (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPENDSESSIONPROC)

                                return Win32.LRESULT;     --  windowsx.h:206



   procedure FORWARD_WM_ENDSESSION (hwnd : Win32.Windef.HWND;

                                   fEnding : Win32.BOOL;

                                   fn : LPDEFFN);      --  windowsx.h:208



   type LPQUITPROC is access procedure (hwnd : Win32.Windef.HWND;

                                       exitCode : Win32.INT);



   function HANDLE_WM_QUIT (hwnd : Win32.Windef.HWND;

                           wParam : Win32.WPARAM;

                           lParam : Win32.LPARAM;

                           fn : LPQUITPROC)

                          return Win32.LRESULT;           --  windowsx.h:212



   procedure FORWARD_WM_QUIT (hwnd : Win32.Windef.HWND;

                             exitCode : Win32.INT;

                             fn : LPDEFFN);           --  windowsx.h:214





   type LPCREATEFN is access function

     (hwnd : Win32.Windef.HWND;

      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT)

     return Win32.BOOL;



   function HANDLE_WM_CREATE (hwnd : Win32.Windef.HWND;

                             wParam : Win32.WPARAM;

                             lParam : Win32.LPARAM;

                             fn : LPCREATEFN)

                            return Win32.LRESULT;         --  windowsx.h:223



   function FORWARD_WM_CREATE (hwnd : Win32.Windef.HWND;

                              lpCreateStruct : Win32.Winuser.LPCREATESTRUCT;

                              fn : LPDEFFN)

                             return Win32.BOOL;           --  windowsx.h:225



   type LPNCCREATEFN is access function

     (hwnd : Win32.Windef.HWND;

      lpCreateStruct : Win32.Winuser.LPCREATESTRUCT)

     return Win32.BOOL;



   function HANDLE_WM_NCCREATE (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPNCCREATEFN)

                              return Win32.LRESULT;       --  windowsx.h:229



   function FORWARD_WM_NCCREATE (hwnd : Win32.Windef.HWND;

                                lpCreateStruct : Win32.Winuser.LPCREATESTRUCT;

                                fn : LPDEFFN)

                               return Win32.BOOL;         --  windowsx.h:231



   type LPDESTROYPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_DESTROY (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPDESTROYPROC)

                             return Win32.LRESULT;        --  windowsx.h:235



   procedure FORWARD_WM_DESTROY (hwnd : Win32.Windef.HWND;

                                fn : LPDEFFN);            --  windowsx.h:237



   type LPNCDESTROYPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_NCDESTROY (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPNCDESTROYPROC)

                               return Win32.LRESULT;      --  windowsx.h:241



   procedure FORWARD_WM_NCDESTROY (hwnd : Win32.Windef.HWND;

                                  fn : LPDEFFN);          --  windowsx.h:243



   type LPSHOWWINDOWPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             fShow : Win32.BOOL;

                                             status : Win32.UINT);



   function HANDLE_WM_SHOWWINDOW (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPSHOWWINDOWPROC)

                                return Win32.LRESULT;     --  windowsx.h:247



   procedure FORWARD_WM_SHOWWINDOW (hwnd : Win32.Windef.HWND;

                                   fShow : Win32.BOOL;

                                   status : Win32.UINT;

                                   fn : LPDEFFN);       --  windowsx.h:249



   type LPSETREDRAWPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            fRedraw : Win32.BOOL);



   function HANDLE_WM_SETREDRAW (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPSETREDRAWPROC)

                               return Win32.LRESULT;      --  windowsx.h:253



   procedure FORWARD_WM_SETREDRAW (hwnd : Win32.Windef.HWND;

                                  fRedraw : Win32.BOOL;

                                  fn : LPDEFFN);       --  windowsx.h:255



   type LPENABLEPROC is access procedure (hwnd : Win32.Windef.HWND;

                                         fEnable : Win32.BOOL);



   function HANDLE_WM_ENABLE (hwnd : Win32.Windef.HWND;

                             wParam : Win32.WPARAM;

                             lParam : Win32.LPARAM;

                             fn : LPENABLEPROC)

                            return Win32.LRESULT;         --  windowsx.h:259



   procedure FORWARD_WM_ENABLE (hwnd : Win32.Windef.HWND;

                               fEnable : Win32.BOOL;

                               fn : LPDEFFN);          --  windowsx.h:261



   type LPSETTEXTPROC is access procedure (hwnd : Win32.Windef.HWND;

                                          lpszText : Win32.Winnt.LPCTSTR);



   function HANDLE_WM_SETTEXT (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPSETTEXTPROC)

                             return Win32.LRESULT;        --  windowsx.h:265



   procedure FORWARD_WM_SETTEXT (hwnd : Win32.Windef.HWND;

                                lpszText : Win32.Winnt.LPCTSTR;

                                fn : LPDEFFN);        --  windowsx.h:267



   type LPGETTEXTFN is access function (hwnd : Win32.Windef.HWND;

                                       cchTextMax : Win32.INT;

                                       lpszText : Win32.Winnt.LPTSTR)

                                      return Win32.INT;



   function HANDLE_WM_GETTEXT (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPGETTEXTFN)

                             return Win32.LRESULT;        --  windowsx.h:271



   function FORWARD_WM_GETTEXT (hwnd : Win32.Windef.HWND;

                               cchTextMax : Win32.INT;

                               lpszText : Win32.Winnt.LPTSTR;

                               fn : LPDEFFN)

                              return Win32.INT;           --  windowsx.h:273



   type LPGETTEXTLENGTHFN is access function (hwnd : Win32.Windef.HWND)

                                            return Win32.INT;



   function HANDLE_WM_GETTEXTLENGTH (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPGETTEXTLENGTHFN)

                                   return Win32.LRESULT;  --  windowsx.h:277



   function FORWARD_WM_GETTEXTLENGTH (hwnd : Win32.Windef.HWND;

                                     fn : LPDEFFN)

                                    return Win32.INT;     --  windowsx.h:279



   type LPWINDOWPOSCHANGINGFN is access function

     (hwnd : Win32.Windef.HWND;

      lpwpos : Win32.Winuser.LPWINDOWPOS)

     return Win32.BOOL;



   function HANDLE_WM_WINDOWPOSCHANGING (hwnd : Win32.Windef.HWND;

                                        wParam : Win32.WPARAM;

                                        lParam : Win32.LPARAM;

                                        fn : LPWINDOWPOSCHANGINGFN)

                                       return Win32.LRESULT;

   --  windowsx.h:283



   function FORWARD_WM_WINDOWPOSCHANGING (hwnd : Win32.Windef.HWND;

                                         lpwpos : Win32.Winuser.LPWINDOWPOS;

                                         fn : LPDEFFN)

                                        return Win32.BOOL; --  windowsx.h:285

   type LPCWINDOWPOS is access all Win32.Winuser.WINDOWPOS;



   type LPWINDOWPOSCHANGEDPROC is access procedure (

                                                   hwnd : Win32.Windef.HWND;

                                                   lpwpos : LPCWINDOWPOS);



   function HANDLE_WM_WINDOWPOSCHANGED (hwnd : Win32.Windef.HWND;

                                       wParam : Win32.WPARAM;

                                       lParam : Win32.LPARAM;

                                       fn : LPWINDOWPOSCHANGEDPROC)

                                      return Win32.LRESULT;

   --  windowsx.h:289



   procedure FORWARD_WM_WINDOWPOSCHANGED (hwnd : Win32.Windef.HWND;

                                         lpwpos : LPCWINDOWPOS;

                                         fn : LPDEFFN); --  windowsx.h:291



   type LPMOVEPROC is access procedure (hwnd : Win32.Windef.HWND;

                                       x : Win32.INT;

                                       y : Win32.INT);



   function HANDLE_WM_MOVE (hwnd : Win32.Windef.HWND;

                           wParam : Win32.WPARAM;

                           lParam : Win32.LPARAM;

                           fn : LPMOVEPROC)

                          return Win32.LRESULT;           --  windowsx.h:295



   procedure FORWARD_WM_MOVE (hwnd : Win32.Windef.HWND;

                             x : Win32.INT;

                             y : Win32.INT;

                             fn : LPDEFFN);               --  windowsx.h:297



   type LPSIZEPROC is access procedure (hwnd : Win32.Windef.HWND;

                                       state : Win32.UINT;

                                       cx : Win32.INT;

                                       cy : Win32.INT);



   function HANDLE_WM_SIZE (hwnd : Win32.Windef.HWND;

                           wParam : Win32.WPARAM;

                           lParam : Win32.LPARAM;

                           fn : LPSIZEPROC)

                          return Win32.LRESULT;           --  windowsx.h:301



   procedure FORWARD_WM_SIZE (hwnd : Win32.Windef.HWND;

                             state : Win32.UINT;

                             cx : Win32.INT;

                             cy : Win32.INT;

                             fn : LPDEFFN);              --  windowsx.h:303



   type LPCLOSEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_CLOSE (hwnd : Win32.Windef.HWND;

                            wParam : Win32.WPARAM;

                            lParam : Win32.LPARAM;

                            fn : LPCLOSEPROC)

                           return Win32.LRESULT;          --  windowsx.h:307



   procedure FORWARD_WM_CLOSE (hwnd : Win32.Windef.HWND;

                              fn : LPDEFFN);              --  windowsx.h:309



   type LPQUERYOPENFN is access function (hwnd : Win32.Windef.HWND)

                                        return Win32.BOOL;



   function HANDLE_WM_QUERYOPEN (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPQUERYOPENFN)

                               return Win32.LRESULT;      --  windowsx.h:313



   function FORWARD_WM_QUERYOPEN (hwnd : Win32.Windef.HWND;

                                 fn : LPDEFFN)

                                return Win32.BOOL;        --  windowsx.h:315



   type LPGETMINMAXINFOPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      lpMinMaxInfo : Win32.Winuser.LPMINMAXINFO);



   function HANDLE_WM_GETMINMAXINFO (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPGETMINMAXINFOPROC)

                                   return Win32.LRESULT;  --  windowsx.h:319



   procedure FORWARD_WM_GETMINMAXINFO

     (hwnd : Win32.Windef.HWND;

      lpMinMaxInfo : Win32.Winuser.LPMINMAXINFO;

      fn : LPDEFFN);                     --  windowsx.h:321



   type LPPAINTPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_PAINT (hwnd : Win32.Windef.HWND;

                            wParam : Win32.WPARAM;

                            lParam : Win32.LPARAM;

                            fn : LPPAINTPROC)

                           return Win32.LRESULT;          --  windowsx.h:325



   procedure FORWARD_WM_PAINT (hwnd : Win32.Windef.HWND;

                              fn : LPDEFFN);              --  windowsx.h:327



   type LPERASEBKGNDFN is access function (hwnd : Win32.Windef.HWND;

                                          hdc : Win32.Windef.HDC)

                                         return Win32.BOOL;



   function HANDLE_WM_ERASEBKGND (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPERASEBKGNDFN)

                                return Win32.LRESULT;     --  windowsx.h:331



   function FORWARD_WM_ERASEBKGND (hwnd : Win32.Windef.HWND;

                                  hdc : Win32.Windef.HDC;

                                  fn : LPDEFFN)

                                 return Win32.BOOL;       --  windowsx.h:333



   type LPICONERASEBKGNDFN is access function (hwnd : Win32.Windef.HWND;

                                              hdc : Win32.Windef.HDC)

                                             return Win32.BOOL;



   function HANDLE_WM_ICONERASEBKGND (hwnd : Win32.Windef.HWND;

                                     wParam : Win32.WPARAM;

                                     lParam : Win32.LPARAM;

                                     fn : LPICONERASEBKGNDFN)

                                    return Win32.LRESULT; --  windowsx.h:337



   function FORWARD_WM_ICONERASEBKGND (hwnd : Win32.Windef.HWND;

                                      hdc : Win32.Windef.HDC;

                                      fn : LPDEFFN)

                                     return Win32.BOOL;   --  windowsx.h:339



   type LPNCPAINTPROC is access procedure (hwnd : Win32.Windef.HWND;

                                          hrgn : Win32.Windef.HRGN);



   function HANDLE_WM_NCPAINT (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPNCPAINTPROC)

                             return Win32.LRESULT;        --  windowsx.h:343



   procedure FORWARD_WM_NCPAINT (hwnd : Win32.Windef.HWND;

                                hrgn : Win32.Windef.HRGN;

                                fn : LPDEFFN);            --  windowsx.h:345



   type LPNCCALCSIZEFN is access function

     (hwnd : Win32.Windef.HWND;

      fCalcValidRects : Win32.BOOL;

      lpcsp : Win32.Winuser.LPNCCALCSIZE_PARAMS)

     return Win32.UINT;



   function HANDLE_WM_NCCALCSIZE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPNCCALCSIZEFN)

                                return Win32.LRESULT;     --  windowsx.h:349



   function FORWARD_WM_NCCALCSIZE

     (hwnd : Win32.Windef.HWND;

      fCalcValidRects : Win32.BOOL;

      lpcsp : Win32.Winuser.LPNCCALCSIZE_PARAMS;

      fn : LPDEFFN)

     return Win32.UINT;                          --  windowsx.h:351



   type LPNCHITTESTFN is access function (hwnd : Win32.Windef.HWND;

                                         x : Win32.INT;

                                         y : Win32.INT)

                                        return Win32.UINT;



   function HANDLE_WM_NCHITTEST (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPNCHITTESTFN)

                               return Win32.LRESULT;      --  windowsx.h:355



   function FORWARD_WM_NCHITTEST (hwnd : Win32.Windef.HWND;

                                 x : Win32.INT;

                                 y : Win32.INT;

                                 fn : LPDEFFN)

                                return Win32.UINT;        --  windowsx.h:357



   type LPQUERYDRAGICONFN is access function (hwnd : Win32.Windef.HWND)

                                            return Win32.Windef.HICON;



   function HANDLE_WM_QUERYDRAGICON (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPQUERYDRAGICONFN)

                                   return Win32.LRESULT;  --  windowsx.h:361



   function FORWARD_WM_QUERYDRAGICON (hwnd : Win32.Windef.HWND;

                                     fn : LPDEFFN)

                                    return Win32.Windef.HICON;

   --  windowsx.h:363



   type LPDROPFILESPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            hdrop : Win32.Shellapi.HDROP);



   function HANDLE_WM_DROPFILES (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPDROPFILESPROC)

                               return Win32.LRESULT;      --  windowsx.h:368



   procedure FORWARD_WM_DROPFILES (hwnd : Win32.Windef.HWND;

                                  hdrop : Win32.Shellapi.HDROP;

                                  fn : LPDEFFN);         --  windowsx.h:370



   type LPACTIVATEPROC is access procedure (hwnd : Win32.Windef.HWND;

                                           state : Win32.UINT;

                                           hwndActDeact : Win32.Windef.HWND;

                                           fMinimized : Win32.BOOL);



   function HANDLE_WM_ACTIVATE (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPACTIVATEPROC)

                              return Win32.LRESULT;       --  windowsx.h:375



   procedure FORWARD_WM_ACTIVATE (hwnd : Win32.Windef.HWND;

                                 state : Win32.UINT;

                                 hwndActDeact : Win32.Windef.HWND;

                                 fMinimized : Win32.BOOL;

                                 fn : LPDEFFN);   --  windowsx.h:377



   type LPACTIVATEAPPPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              fActivate : Win32.BOOL;

                                              dwThreadId : Win32.DWORD);



   function HANDLE_WM_ACTIVATEAPP (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPACTIVATEAPPPROC)

                                 return Win32.LRESULT;    --  windowsx.h:381



   procedure FORWARD_WM_ACTIVATEAPP (hwnd : Win32.Windef.HWND;

                                    fActivate : Win32.BOOL;

                                    dwThreadId : Win32.DWORD;

                                    fn : LPDEFFN);  --  windowsx.h:383



   type LPNCACTIVATEFN is access function (hwnd : Win32.Windef.HWND;

                                          fActive : Win32.BOOL;

                                          hwndActDeact : Win32.Windef.HWND;

                                          fMinimized : Win32.BOOL)

                                         return Win32.BOOL;



   function HANDLE_WM_NCACTIVATE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPNCACTIVATEFN)

                                return Win32.LRESULT;     --  windowsx.h:387



   function FORWARD_WM_NCACTIVATE (hwnd : Win32.Windef.HWND;

                                  fActive : Win32.BOOL;

                                  hwndActDeact : Win32.Windef.HWND;

                                  fMinimized : Win32.BOOL;

                                  fn : LPDEFFN)

                                 return Win32.BOOL;       --  windowsx.h:389



   type LPSETFOCUSPROC is access procedure (hwnd : Win32.Windef.HWND;

                                           hwndOldFocus : Win32.Windef.HWND);



   function HANDLE_WM_SETFOCUS (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPSETFOCUSPROC)

                              return Win32.LRESULT;       --  windowsx.h:393



   procedure FORWARD_WM_SETFOCUS (hwnd : Win32.Windef.HWND;

                                 hwndOldFocus : Win32.Windef.HWND;

                                 fn : LPDEFFN);   --  windowsx.h:395



   type LPKILLFOCUSPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            hwndNewFocus : Win32.Windef.HWND);



   function HANDLE_WM_KILLFOCUS (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPKILLFOCUSPROC)

                               return Win32.LRESULT;      --  windowsx.h:399



   procedure FORWARD_WM_KILLFOCUS (hwnd : Win32.Windef.HWND;

                                  hwndNewFocus : Win32.Windef.HWND;

                                  fn : LPDEFFN);  --  windowsx.h:401



   type LPKEYPROC is access procedure (hwnd : Win32.Windef.HWND;

                                      vk : Win32.UINT;

                                      fDown : Win32.BOOL;

                                      cRepeat : Win32.INT;

                                      flags : Win32.UINT);



   function HANDLE_WM_KEYDOWN (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPKEYPROC)

                             return Win32.LRESULT;        --  windowsx.h:405



   procedure FORWARD_WM_KEYDOWN (hwnd : Win32.Windef.HWND;

                                vk : Win32.UINT;

                                fDown : Win32.BOOL;

                                cRepeat : Win32.INT;

                                flags : Win32.UINT;

                                fn : LPDEFFN);         --  windowsx.h:407



   function HANDLE_WM_KEYUP (hwnd : Win32.Windef.HWND;

                            wParam : Win32.WPARAM;

                            lParam : Win32.LPARAM;

                            fn : LPKEYPROC)

                           return Win32.LRESULT;          --  windowsx.h:411



   procedure FORWARD_WM_KEYUP (hwnd : Win32.Windef.HWND;

                              vk : Win32.UINT;

                              fDown : Win32.BOOL;

                              cRepeat : Win32.INT;

                              flags : Win32.UINT;

                              fn : LPDEFFN);           --  windowsx.h:413



   type LPCHARPROC is access procedure (hwnd : Win32.Windef.HWND;

                                       ch : Win32.TCHAR;

                                       cRepeat : Win32.INT);



   function HANDLE_WM_CHAR (hwnd : Win32.Windef.HWND;

                           wParam : Win32.WPARAM;

                           lParam : Win32.LPARAM;

                           fn : LPCHARPROC)

                          return Win32.LRESULT;           --  windowsx.h:417



   procedure FORWARD_WM_CHAR (hwnd : Win32.Windef.HWND;

                             ch : Win32.TCHAR;

                             cRepeat : Win32.INT;

                             fn : LPDEFFN);            --  windowsx.h:419



   type LPDEADCHARPROC is access procedure (hwnd : Win32.Windef.HWND;

                                           ch : Win32.TCHAR;

                                           cRepeat : Win32.INT);



   function HANDLE_WM_DEADCHAR (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPDEADCHARPROC)

                              return Win32.LRESULT;       --  windowsx.h:423



   procedure FORWARD_WM_DEADCHAR (hwnd : Win32.Windef.HWND;

                                 ch : Win32.TCHAR;

                                 cRepeat : Win32.INT;

                                 fn : LPDEFFN);        --  windowsx.h:425



   type LPSYSKEYPROC is access procedure (hwnd : Win32.Windef.HWND;

                                         vk : Win32.UINT;

                                         fDown : Win32.BOOL;

                                         cRepeat : Win32.INT;

                                         flags : Win32.UINT);



   function HANDLE_WM_SYSKEYDOWN (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPSYSKEYPROC)

                                return Win32.LRESULT;     --  windowsx.h:429



   procedure FORWARD_WM_SYSKEYDOWN (hwnd : Win32.Windef.HWND;

                                   vk : Win32.UINT;

                                   fDown : Win32.BOOL;

                                   cRepeat : Win32.INT;

                                   flags : Win32.UINT;

                                   fn : LPDEFFN);      --  windowsx.h:431





   function HANDLE_WM_SYSKEYUP (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPSYSKEYPROC)

                              return Win32.LRESULT;       --  windowsx.h:435



   procedure FORWARD_WM_SYSKEYUP (hwnd : Win32.Windef.HWND;

                                 vk : Win32.UINT;

                                 fDown : Win32.BOOL;

                                 cRepeat : Win32.INT;

                                 flags : Win32.UINT;

                                 fn : LPDEFFN);        --  windowsx.h:437



   type LPSYSCHARPROC is access procedure (hwnd : Win32.Windef.HWND;

                                          ch : Win32.TCHAR;

                                          cRepeat : Win32.INT);



   function HANDLE_WM_SYSCHAR (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPSYSCHARPROC)

                             return Win32.LRESULT;        --  windowsx.h:441



   procedure FORWARD_WM_SYSCHAR (hwnd : Win32.Windef.HWND;

                                ch : Win32.TCHAR;

                                cRepeat : Win32.INT;

                                fn : LPDEFFN);         --  windowsx.h:443



   type LPSYSDEADCHARPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              ch : Win32.TCHAR;

                                              cRepeat : Win32.INT);



   function HANDLE_WM_SYSDEADCHAR (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPSYSDEADCHARPROC)

                                 return Win32.LRESULT;    --  windowsx.h:447



   procedure FORWARD_WM_SYSDEADCHAR (hwnd : Win32.Windef.HWND;

                                    ch : Win32.TCHAR;

                                    cRepeat : Win32.INT;

                                    fn : LPDEFFN);     --  windowsx.h:449



   type LPMOUSEMOVEPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            x : Win32.INT;

                                            y : Win32.INT;

                                            keyFlags : Win32.UINT);



   function HANDLE_WM_MOUSEMOVE (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPMOUSEMOVEPROC)

                               return Win32.LRESULT;      --  windowsx.h:453



   procedure FORWARD_WM_MOUSEMOVE (hwnd : Win32.Windef.HWND;

                                  x : Win32.INT;

                                  y : Win32.INT;

                                  keyFlags : Win32.UINT;

                                  fn : LPDEFFN);      --  windowsx.h:455



   type LPLBUTTONDOWNPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              fDoubleClick : Win32.BOOL;

                                              x : Win32.INT;

                                              y : Win32.INT;

                                              keyFlags : Win32.UINT);



   function HANDLE_WM_LBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPLBUTTONDOWNPROC)

                                 return Win32.LRESULT;    --  windowsx.h:459



   procedure FORWARD_WM_LBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                    fDoubleClick : Win32.BOOL;

                                    x : Win32.INT;

                                    y : Win32.INT;

                                    keyFlags : Win32.UINT;

                                    fn : LPDEFFN); --  windowsx.h:461



   function HANDLE_WM_LBUTTONDBLCLK (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPLBUTTONDOWNPROC)

                                   return Win32.LRESULT;  --  windowsx.h:465



   type LPLBUTTONUPPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            x : Win32.INT;

                                            y : Win32.INT;

                                            keyFlags : Win32.UINT);



   function HANDLE_WM_LBUTTONUP (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPLBUTTONUPPROC)

                               return Win32.LRESULT;      --  windowsx.h:469



   procedure FORWARD_WM_LBUTTONUP (hwnd : Win32.Windef.HWND;

                                  x : Win32.INT;

                                  y : Win32.INT;

                                  keyFlags : Win32.UINT;

                                  fn : LPDEFFN);      --  windowsx.h:471



   type LPRBUTTONDOWNPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              fDoubleClick : Win32.BOOL;

                                              x : Win32.INT;

                                              y : Win32.INT;

                                              keyFlags : Win32.UINT);



   function HANDLE_WM_RBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPRBUTTONDOWNPROC)

                                 return Win32.LRESULT;    --  windowsx.h:475



   procedure FORWARD_WM_RBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                    fDoubleClick : Win32.BOOL;

                                    x : Win32.INT;

                                    y : Win32.INT;

                                    keyFlags : Win32.UINT;

                                    fn : LPDEFFN); --  windowsx.h:477



   function HANDLE_WM_RBUTTONDBLCLK (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPRBUTTONDOWNPROC)

                                   return Win32.LRESULT;  --  windowsx.h:481



   type LPRBUTTONUPPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            x : Win32.INT;

                                            y : Win32.INT;

                                            flags : Win32.UINT);



   function HANDLE_WM_RBUTTONUP (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPRBUTTONUPPROC)

                               return Win32.LRESULT;      --  windowsx.h:485



   procedure FORWARD_WM_RBUTTONUP (hwnd : Win32.Windef.HWND;

                                  x : Win32.INT;

                                  y : Win32.INT;

                                  keyFlags : Win32.UINT;

                                  fn : LPDEFFN);      --  windowsx.h:487



   type LPMBUTTONDOWNPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              fDoubleClick : Win32.BOOL;

                                              x : Win32.INT;

                                              y : Win32.INT;

                                              keyFlags : Win32.UINT);



   function HANDLE_WM_MBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPMBUTTONDOWNPROC)

                                 return Win32.LRESULT;    --  windowsx.h:491



   procedure FORWARD_WM_MBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                    fDoubleClick : Win32.BOOL;

                                    x : Win32.INT;

                                    y : Win32.INT;

                                    keyFlags : Win32.UINT;

                                    fn : LPDEFFN); --  windowsx.h:493



   function HANDLE_WM_MBUTTONDBLCLK (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPMBUTTONDOWNPROC)

                                   return Win32.LRESULT;  --  windowsx.h:497



   type LPMBUTTONUPPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            x : Win32.INT;

                                            y : Win32.INT;

                                            flags : Win32.UINT);



   function HANDLE_WM_MBUTTONUP (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPMBUTTONUPPROC)

                               return Win32.LRESULT;      --  windowsx.h:501



   procedure FORWARD_WM_MBUTTONUP (hwnd : Win32.Windef.HWND;

                                  x : Win32.INT;

                                  y : Win32.INT;

                                  keyFlags : Win32.UINT;

                                  fn : LPDEFFN);      --  windowsx.h:503



   type LPNCMOUSEMOVEPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              x : Win32.INT;

                                              y : Win32.INT;

                                              codeHitTest : Win32.UINT);



   function HANDLE_WM_NCMOUSEMOVE (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPNCMOUSEMOVEPROC)

                                 return Win32.LRESULT;    --  windowsx.h:507



   procedure FORWARD_WM_NCMOUSEMOVE (hwnd : Win32.Windef.HWND;

                                    x : Win32.INT;

                                    y : Win32.INT;

                                    codeHitTest : Win32.UINT;

                                    fn : LPDEFFN); --  windowsx.h:509



   type LPNCLBUTTONDOWNPROC is access procedure (

                                                hwnd : Win32.Windef.HWND;

                                                fDoubleClick : Win32.BOOL;

                                                x : Win32.INT;

                                                y : Win32.INT;

                                                codeHitTest : Win32.UINT);



   function HANDLE_WM_NCLBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPNCLBUTTONDOWNPROC)

                                   return Win32.LRESULT;  --  windowsx.h:513



   procedure FORWARD_WM_NCLBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                      fDoubleClick : Win32.BOOL;

                                      x : Win32.INT;

                                      y : Win32.INT;

                                      codeHitTest : Win32.UINT;

                                      fn : LPDEFFN);

   --  windowsx.h:515



   function HANDLE_WM_NCLBUTTONDBLCLK (hwnd : Win32.Windef.HWND;

                                      wParam : Win32.WPARAM;

                                      lParam : Win32.LPARAM;

                                      fn : LPNCLBUTTONDOWNPROC)

                                     return Win32.LRESULT; --  windowsx.h:519



   type LPNCLBUTTONUPPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              x : Win32.INT;

                                              y : Win32.INT;

                                              codeHitTest : Win32.UINT);



   function HANDLE_WM_NCLBUTTONUP (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPNCLBUTTONUPPROC)

                                 return Win32.LRESULT;    --  windowsx.h:523



   procedure FORWARD_WM_NCLBUTTONUP (hwnd : Win32.Windef.HWND;

                                    x : Win32.INT;

                                    y : Win32.INT;

                                    codeHitTest : Win32.UINT;

                                    fn : LPDEFFN); --  windowsx.h:525



   type LPNCRBUTTONDOWNPROC is access procedure (

                                                hwnd : Win32.Windef.HWND;

                                                fDoubleClick : Win32.BOOL;

                                                x : Win32.INT;

                                                y : Win32.INT;

                                                codeHitTest : Win32.UINT);



   function HANDLE_WM_NCRBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPNCRBUTTONDOWNPROC)

                                   return Win32.LRESULT;  --  windowsx.h:529



   procedure FORWARD_WM_NCRBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                      fDoubleClick : Win32.BOOL;

                                      x : Win32.INT;

                                      y : Win32.INT;

                                      codeHitTest : Win32.UINT;

                                      fn : LPDEFFN);

   --  windowsx.h:531



   function HANDLE_WM_NCRBUTTONDBLCLK (hwnd : Win32.Windef.HWND;

                                      wParam : Win32.WPARAM;

                                      lParam : Win32.LPARAM;

                                      fn : LPNCRBUTTONDOWNPROC)

                                     return Win32.LRESULT; --  windowsx.h:535



   type LPNCRBUTTONUPPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              x : Win32.INT;

                                              y : Win32.INT;

                                              codeHitTest : Win32.UINT);



   function HANDLE_WM_NCRBUTTONUP (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPNCRBUTTONUPPROC)

                                 return Win32.LRESULT;    --  windowsx.h:539



   procedure FORWARD_WM_NCRBUTTONUP (hwnd : Win32.Windef.HWND;

                                    x : Win32.INT;

                                    y : Win32.INT;

                                    codeHitTest : Win32.UINT;

                                    fn : LPDEFFN); --  windowsx.h:541



   type LPNCMBUTTONDOWNPROC is access procedure (

                                                hwnd : Win32.Windef.HWND;

                                                fDoubleClick : Win32.BOOL;

                                                x : Win32.INT;

                                                y : Win32.INT;

                                                codeHitTest : Win32.UINT);



   function HANDLE_WM_NCMBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPNCMBUTTONDOWNPROC)

                                   return Win32.LRESULT;  --  windowsx.h:545



   procedure FORWARD_WM_NCMBUTTONDOWN (hwnd : Win32.Windef.HWND;

                                      fDoubleClick : Win32.BOOL;

                                      x : Win32.INT;

                                      y : Win32.INT;

                                      codeHitTest : Win32.UINT;

                                      fn : LPDEFFN);

   --  windowsx.h:547



   function HANDLE_WM_NCMBUTTONDBLCLK (hwnd : Win32.Windef.HWND;

                                      wParam : Win32.WPARAM;

                                      lParam : Win32.LPARAM;

                                      fn : LPNCMBUTTONDOWNPROC)

                                     return Win32.LRESULT; --  windowsx.h:551



   type LPNCMBUTTONUPPROC is access procedure (hwnd : Win32.Windef.HWND;

                                              x : Win32.INT;

                                              y : Win32.INT;

                                              codeHitTest : Win32.UINT);



   function HANDLE_WM_NCMBUTTONUP (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPNCMBUTTONUPPROC)

                                 return Win32.LRESULT;    --  windowsx.h:555



   procedure FORWARD_WM_NCMBUTTONUP (hwnd : Win32.Windef.HWND;

                                    x : Win32.INT;

                                    y : Win32.INT;

                                    codeHitTest : Win32.UINT;

                                    fn : LPDEFFN); --  windowsx.h:557



   type LPMOUSEACTIVATEFN is access function (hwnd : Win32.Windef.HWND;

                                             hwndTopLevel : Win32.Windef.HWND;

                                             codeHitTest : Win32.UINT;

                                             msg : Win32.UINT)

                                            return Win32.INT;



   function HANDLE_WM_MOUSEACTIVATE (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPMOUSEACTIVATEFN)

                                   return Win32.LRESULT;  --  windowsx.h:561



   function FORWARD_WM_MOUSEACTIVATE (hwnd : Win32.Windef.HWND;

                                     hwndTopLevel : Win32.Windef.HWND;

                                     codeHitTest : Win32.UINT;

                                     msg : Win32.UINT;

                                     fn : LPDEFFN)

                                    return Win32.INT;     --  windowsx.h:563



   type LPCANCELMODEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_CANCELMODE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPCANCELMODEPROC)

                                return Win32.LRESULT;     --  windowsx.h:567



   procedure FORWARD_WM_CANCELMODE (hwnd : Win32.Windef.HWND;

                                   fn : LPDEFFN);         --  windowsx.h:569



   type LPTIMERPROC is access procedure (hwnd : Win32.Windef.HWND;

                                        id : Win32.UINT);



   function HANDLE_WM_TIMER (hwnd : Win32.Windef.HWND;

                            wParam : Win32.WPARAM;

                            lParam : Win32.LPARAM;

                            fn : LPTIMERPROC)

                           return Win32.LRESULT;          --  windowsx.h:573



   procedure FORWARD_WM_TIMER (hwnd : Win32.Windef.HWND;

                              id : Win32.UINT;

                              fn : LPDEFFN);              --  windowsx.h:575



   type LPINITMENUPROC is access procedure (hwnd : Win32.Windef.HWND;

                                           hMenu : Win32.Windef.HMENU);



   function HANDLE_WM_INITMENU (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPINITMENUPROC)

                              return Win32.LRESULT;       --  windowsx.h:579



   procedure FORWARD_WM_INITMENU (hwnd : Win32.Windef.HWND;

                                 hMenu : Win32.Windef.HMENU;

                                 fn : LPDEFFN);          --  windowsx.h:581



   type LPINITMENUPOPUPPROC is access procedure (

                                                hwnd : Win32.Windef.HWND;

                                                hMenu : Win32.Windef.HMENU;

                                                item : Win32.UINT;

                                                fSystemMenu : Win32.BOOL);



   function HANDLE_WM_INITMENUPOPUP (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPINITMENUPOPUPPROC)

                                   return Win32.LRESULT;  --  windowsx.h:585



   procedure FORWARD_WM_INITMENUPOPUP (hwnd : Win32.Windef.HWND;

                                      hMenu : Win32.Windef.HMENU;

                                      item : Win32.UINT;

                                      fSystemMenu : Win32.BOOL;

                                      fn : LPDEFFN);

   --  windowsx.h:587



   type LPMENUSELECTPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             hmenu : Win32.Windef.HMENU;

                                             item : Win32.INT;

                                             hmenuPopup : Win32.Windef.HMENU;

                                             flags : Win32.UINT);



   function HANDLE_WM_MENUSELECT (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPMENUSELECTPROC)

                                return Win32.LRESULT;     --  windowsx.h:591



   procedure FORWARD_WM_MENUSELECT (hwnd : Win32.Windef.HWND;

                                   hmenu : Win32.Windef.HMENU;

                                   item : Win32.INT;

                                   hmenuPopup : Win32.Windef.HMENU;

                                   flags : Win32.UINT;

                                   fn : LPDEFFN);   --  windowsx.h:596



   type LPMENUCHARFN is access function (hwnd : Win32.Windef.HWND;

                                        ch : Win32.UINT;

                                        flags : Win32.UINT;

                                        hmenu : Win32.Windef.HMENU)

                                       return Win32.DWORD;



   function HANDLE_WM_MENUCHAR (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPMENUCHARFN)

                              return Win32.LRESULT;       --  windowsx.h:600



   function FORWARD_WM_MENUCHAR (hwnd : Win32.Windef.HWND;

                                ch : Win32.UINT;

                                flags : Win32.UINT;

                                hmenu : Win32.Windef.HMENU;

                                fn : LPDEFFN)

                               return Win32.DWORD;        --  windowsx.h:602



   type LPCOMMANDPROC is access procedure (hwnd : Win32.Windef.HWND;

                                          id : Win32.INT;

                                          hwndCtl : Win32.Windef.HWND;

                                          codeNotify : Win32.UINT);



   function HANDLE_WM_COMMAND (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPCOMMANDPROC)

                             return Win32.LRESULT;        --  windowsx.h:606



   procedure FORWARD_WM_COMMAND (hwnd : Win32.Windef.HWND;

                                id : Win32.INT;

                                hwndCtl : Win32.Windef.HWND;

                                codeNotify : Win32.UINT;

                                fn : LPDEFFN);      --  windowsx.h:608



   type LPHSCROLLPROC is access procedure (hwnd : Win32.Windef.HWND;

                                          hwndCtl : Win32.Windef.HWND;

                                          code : Win32.UINT;

                                          pos : Win32.INT);



   function HANDLE_WM_HSCROLL (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPHSCROLLPROC)

                             return Win32.LRESULT;        --  windowsx.h:612



   procedure FORWARD_WM_HSCROLL (hwnd : Win32.Windef.HWND;

                                hwndCtl : Win32.Windef.HWND;

                                code : Win32.UINT;

                                pos : Win32.INT;

                                fn : LPDEFFN);         --  windowsx.h:614



   type LPVSCROLLPROC is access procedure (hwnd : Win32.Windef.HWND;

                                          hwndCtl : Win32.Windef.HWND;

                                          code : Win32.UINT;

                                          pos : Win32.INT);



   function HANDLE_WM_VSCROLL (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPVSCROLLPROC)

                             return Win32.LRESULT;        --  windowsx.h:618



   procedure FORWARD_WM_VSCROLL (hwnd : Win32.Windef.HWND;

                                hwndCtl : Win32.Windef.HWND;

                                code : Win32.UINT;

                                pos : Win32.INT;

                                fn : LPDEFFN);         --  windowsx.h:620



   type LPCUTPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_CUT (hwnd : Win32.Windef.HWND;

                          wParam : Win32.WPARAM;

                          lParam : Win32.LPARAM;

                          fn : LPCUTPROC)

                         return Win32.LRESULT;            --  windowsx.h:624



   procedure FORWARD_WM_CUT (hwnd : Win32.Windef.HWND;

                            fn : LPDEFFN);                --  windowsx.h:626



   type LPCOPYPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_COPY (hwnd : Win32.Windef.HWND;

                           wParam : Win32.WPARAM;

                           lParam : Win32.LPARAM;

                           fn : LPCOPYPROC)

                          return Win32.LRESULT;           --  windowsx.h:630



   procedure FORWARD_WM_COPY (hwnd : Win32.Windef.HWND;

                             fn : LPDEFFN);               --  windowsx.h:632



   type LPPASTEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_PASTE (hwnd : Win32.Windef.HWND;

                            wParam : Win32.WPARAM;

                            lParam : Win32.LPARAM;

                            fn : LPPASTEPROC)

                           return Win32.LRESULT;          --  windowsx.h:636



   procedure FORWARD_WM_PASTE (hwnd : Win32.Windef.HWND;

                              fn : LPDEFFN);              --  windowsx.h:638



   type LPCLEARPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_CLEAR (hwnd : Win32.Windef.HWND;

                            wParam : Win32.WPARAM;

                            lParam : Win32.LPARAM;

                            fn : LPCLEARPROC)

                           return Win32.LRESULT;          --  windowsx.h:642



   procedure FORWARD_WM_CLEAR (hwnd : Win32.Windef.HWND;

                              fn : LPDEFFN);              --  windowsx.h:644



   type LPUNDOPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_UNDO (hwnd : Win32.Windef.HWND;

                           wParam : Win32.WPARAM;

                           lParam : Win32.LPARAM;

                           fn : LPUNDOPROC)

                          return Win32.LRESULT;           --  windowsx.h:648



   procedure FORWARD_WM_UNDO (hwnd : Win32.Windef.HWND;

                             fn : LPDEFFN);               --  windowsx.h:650



   type LPRENDERFORMATFN is access function (hwnd : Win32.Windef.HWND;

                                            fmt : Win32.UINT)

                                           return Win32.Winnt.HANDLE;



   function HANDLE_WM_RENDERFORMAT (hwnd : Win32.Windef.HWND;

                                   wParam : Win32.WPARAM;

                                   lParam : Win32.LPARAM;

                                   fn : LPRENDERFORMATFN)

                                  return Win32.LRESULT;   --  windowsx.h:654



   function FORWARD_WM_RENDERFORMAT (hwnd : Win32.Windef.HWND;

                                    fmt : Win32.UINT;

                                    fn : LPDEFFN)

                                   return Win32.Winnt.HANDLE;

   --  windowsx.h:656



   type LPRENDERALLFORMATSPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_RENDERALLFORMATS (hwnd : Win32.Windef.HWND;

                                       wParam : Win32.WPARAM;

                                       lParam : Win32.LPARAM;

                                       fn : LPRENDERALLFORMATSPROC)

                                      return Win32.LRESULT;

   --  windowsx.h:660



   procedure FORWARD_WM_RENDERALLFORMATS (hwnd : Win32.Windef.HWND;

                                         fn : LPDEFFN);   --  windowsx.h:662



   type LPDESTROYCLIPBOARDPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_DESTROYCLIPBOARD (hwnd : Win32.Windef.HWND;

                                       wParam : Win32.WPARAM;

                                       lParam : Win32.LPARAM;

                                       fn : LPDESTROYCLIPBOARDPROC)

                                      return Win32.LRESULT;

   --  windowsx.h:666



   procedure FORWARD_WM_DESTROYCLIPBOARD (hwnd : Win32.Windef.HWND;

                                         fn : LPDEFFN);   --  windowsx.h:668



   type LPDRAWCLIPBOARDPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_DRAWCLIPBOARD (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPDRAWCLIPBOARDPROC)

                                   return Win32.LRESULT;  --  windowsx.h:672



   procedure FORWARD_WM_DRAWCLIPBOARD (hwnd : Win32.Windef.HWND;

                                      fn : LPDEFFN);      --  windowsx.h:674



   type LPCPAINTSTRUCT is access all Win32.Winuser.PAINTSTRUCT;

   type LPPAINTCLIPBOARDPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      hwndCBViewer : Win32.Windef.HWND;

      lpPaintStruct : LPCPAINTSTRUCT);



   function HANDLE_WM_PAINTCLIPBOARD (hwnd : Win32.Windef.HWND;

                                     wParam : Win32.WPARAM;

                                     lParam : Win32.LPARAM;

                                     fn : LPPAINTCLIPBOARDPROC)

                                    return Win32.LRESULT; --  windowsx.h:678



   procedure FORWARD_WM_PAINTCLIPBOARD (hwnd : Win32.Windef.HWND;

                                       hwndCBViewer : Win32.Windef.HWND;

                                       lpPaintStruct : LPCPAINTSTRUCT;

                                       fn : LPDEFFN);

   --  windowsx.h:680



   type LPSIZECLIPBOARDPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      hwndCBViewer : Win32.Windef.HWND;

      lprc : Win32.Objbase.LPCRECT);



   function HANDLE_WM_SIZECLIPBOARD (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPSIZECLIPBOARDPROC)

                                   return Win32.LRESULT;  --  windowsx.h:684



   procedure FORWARD_WM_SIZECLIPBOARD (hwnd : Win32.Windef.HWND;

                                      hwndCBViewer : Win32.Windef.HWND;

                                      lprc : Win32.Objbase.LPCRECT;

                                      fn : LPDEFFN);

   --  windowsx.h:686

   type LPVSCROLLCLIPBOARDPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      hwndCBViewer : Win32.Windef.HWND;

      code : Win32.UINT;

      pos : Win32.INT);



   function HANDLE_WM_VSCROLLCLIPBOARD (hwnd : Win32.Windef.HWND;

                                       wParam : Win32.WPARAM;

                                       lParam : Win32.LPARAM;

                                       fn : LPVSCROLLCLIPBOARDPROC)

                                      return Win32.LRESULT;

   --  windowsx.h:690



   procedure FORWARD_WM_VSCROLLCLIPBOARD (hwnd : Win32.Windef.HWND;

                                         hwndCBViewer : Win32.Windef.HWND;

                                         code : Win32.UINT;

                                         pos : Win32.INT;

                                         fn : LPDEFFN);

   --  windowsx.h:692



   type LPHSCROLLCLIPBOARDPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      hwndCBViewer : Win32.Windef.HWND;

      code : Win32.UINT;

      pos : Win32.INT);



   function HANDLE_WM_HSCROLLCLIPBOARD (hwnd : Win32.Windef.HWND;

                                       wParam : Win32.WPARAM;

                                       lParam : Win32.LPARAM;

                                       fn : LPHSCROLLCLIPBOARDPROC)

                                      return Win32.LRESULT;

   --  windowsx.h:696



   procedure FORWARD_WM_HSCROLLCLIPBOARD (hwnd : Win32.Windef.HWND;

                                         hwndCBViewer : Win32.Windef.HWND;

                                         code : Win32.UINT;

                                         pos : Win32.INT;

                                         fn : LPDEFFN);

   --  windowsx.h:698



   type LPASKCBFORMATNAMEPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      cchMax : Win32.INT;

      rgchName : Win32.Winnt.LPTSTR);



   function HANDLE_WM_ASKCBFORMATNAME (hwnd : Win32.Windef.HWND;

                                      wParam : Win32.WPARAM;

                                      lParam : Win32.LPARAM;

                                      fn : LPASKCBFORMATNAMEPROC)

                                     return Win32.LRESULT; --  windowsx.h:702



   procedure FORWARD_WM_ASKCBFORMATNAME (hwnd : Win32.Windef.HWND;

                                        cchMax : Win32.INT;

                                        rgchName : Win32.Winnt.LPTSTR;

                                        fn : LPDEFFN); --  windowsx.h:704



   type LPCHANGECBCHAINPROC is access procedure (

                                                hwnd : Win32.Windef.HWND;

                                                hwndRemove : Win32.Windef.HWND;

                                                hwndNext : Win32.Windef.HWND);



   function HANDLE_WM_CHANGECBCHAIN (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPCHANGECBCHAINPROC)

                                   return Win32.LRESULT;  --  windowsx.h:708



   procedure FORWARD_WM_CHANGECBCHAIN (hwnd : Win32.Windef.HWND;

                                      hwndRemove : Win32.Windef.HWND;

                                      hwndNext : Win32.Windef.HWND;

                                      fn : LPDEFFN); --  windowsx.h:710



   type LPSETCURSORFN is access function (hwnd : Win32.Windef.HWND;

                                         hwndCursor : Win32.Windef.HWND;

                                         codeHitTest : Win32.UINT;

                                         msg : Win32.UINT)

                                        return Win32.BOOL;



   function HANDLE_WM_SETCURSOR (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPSETCURSORFN)

                               return Win32.LRESULT;      --  windowsx.h:714



   function FORWARD_WM_SETCURSOR (hwnd : Win32.Windef.HWND;

                                 hwndCursor : Win32.Windef.HWND;

                                 codeHitTest : Win32.UINT;

                                 msg : Win32.UINT;

                                 fn : LPDEFFN)

                                return Win32.BOOL;        --  windowsx.h:716



   type LPSYSCOMMANDPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             cmd : Win32.UINT;

                                             x : Win32.INT;

                                             y : Win32.INT);



   function HANDLE_WM_SYSCOMMAND (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPSYSCOMMANDPROC)

                                return Win32.LRESULT;     --  windowsx.h:720



   procedure FORWARD_WM_SYSCOMMAND (hwnd : Win32.Windef.HWND;

                                   cmd : Win32.UINT;

                                   x : Win32.INT;

                                   y : Win32.INT;

                                   fn : LPDEFFN);         --  windowsx.h:722



   type LPCMDICREATESTRUCT is

     access all Win32.Winuser.MDICREATESTRUCTA;



   type LPMDICREATEFN is access function (hwnd : Win32.Windef.HWND;

                                         lpmcs : LPCMDICREATESTRUCT)

                                        return Win32.Windef.HWND;



   function HANDLE_WM_MDICREATE (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPMDICREATEFN)

                               return Win32.LRESULT;      --  windowsx.h:726



   function FORWARD_WM_MDICREATE (hwnd : Win32.Windef.HWND;

                                 lpmcs : LPCMDICREATESTRUCT;

                                 fn : LPDEFFN)           --  windowsx.h:728

                                return Win32.Windef.HWND;





   type LPMDIDESTROYPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             hwndDestroy : Win32.Windef.HWND);



   function HANDLE_WM_MDIDESTROY (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPMDIDESTROYPROC)

                                return Win32.LRESULT;     --  windowsx.h:732



   procedure FORWARD_WM_MDIDESTROY (hwnd : Win32.Windef.HWND;

                                   hwndDestroy : Win32.Windef.HWND;

                                   fn : LPDEFFN);  --  windowsx.h:734



   type LPMDIACTIVATEPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      fActive : Win32.BOOL;

      hwndActivate : Win32.Windef.HWND;

      hwndDeactivate : Win32.Windef.HWND);



   function HANDLE_WM_MDIACTIVATE (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPMDIACTIVATEPROC)

                                 return Win32.LRESULT;    --  windowsx.h:739



   procedure FORWARD_WM_MDIACTIVATE (hwnd : Win32.Windef.HWND;

                                    fActive : Win32.BOOL;

                                    hwndActivate : Win32.Windef.HWND;

                                    hwndDeactivate : Win32.Windef.HWND;

                                    fn : LPDEFFN);

   --  windowsx.h:741



   type LPMDIRESTOREPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             hwndRestore : Win32.Windef.HWND);



   function HANDLE_WM_MDIRESTORE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPMDIRESTOREPROC)

                                return Win32.LRESULT;     --  windowsx.h:745



   procedure FORWARD_WM_MDIRESTORE (hwnd : Win32.Windef.HWND;

                                   hwndRestore : Win32.Windef.HWND;

                                   fn : LPDEFFN);  --  windowsx.h:747



   type LPMDINEXTFN is access function (hwnd : Win32.Windef.HWND;

                                       hwndCur : Win32.Windef.HWND;

                                       fPrev : Win32.BOOL)

                                      return Win32.Windef.HWND;



   function HANDLE_WM_MDINEXT (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPMDINEXTFN)

                             return Win32.LRESULT;        --  windowsx.h:751



   function FORWARD_WM_MDINEXT (hwnd : Win32.Windef.HWND;

                               hwndCur : Win32.Windef.HWND;

                               fPrev : Win32.BOOL;

                               fn : LPDEFFN)

                              return Win32.Windef.HWND;   --  windowsx.h:753



   type LPMDIMAXIMIZEPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      hwndMaximize : Win32.Windef.HWND);



   function HANDLE_WM_MDIMAXIMIZE (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPMDIMAXIMIZEPROC)

                                 return Win32.LRESULT;    --  windowsx.h:757



   procedure FORWARD_WM_MDIMAXIMIZE (hwnd : Win32.Windef.HWND;

                                    hwndMaximize : Win32.Windef.HWND;

                                    fn : LPDEFFN); --  windowsx.h:759



   type LPMDITILEFN is access function (hwnd : Win32.Windef.HWND;

                                       cmd : Win32.UINT)

                                      return Win32.BOOL;



   function HANDLE_WM_MDITILE (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPMDITILEFN)

                             return Win32.LRESULT;        --  windowsx.h:763



   function FORWARD_WM_MDITILE (hwnd : Win32.Windef.HWND;

                               cmd : Win32.UINT;

                               fn : LPDEFFN)

                              return Win32.BOOL;          --  windowsx.h:765



   type LPMDICASCADEFN is access function (hwnd : Win32.Windef.HWND;

                                          cmd : Win32.UINT)

                                         return Win32.BOOL;



   function HANDLE_WM_MDICASCADE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPMDICASCADEFN)

                                return Win32.LRESULT;     --  windowsx.h:769



   function FORWARD_WM_MDICASCADE (hwnd : Win32.Windef.HWND;

                                  cmd : Win32.UINT;

                                  fn : LPDEFFN)

                                 return Win32.BOOL;       --  windowsx.h:771



   type LPMDIICONARRANGEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_MDIICONARRANGE (hwnd : Win32.Windef.HWND;

                                     wParam : Win32.WPARAM;

                                     lParam : Win32.LPARAM;

                                     fn : LPMDIICONARRANGEPROC)

                                    return Win32.LRESULT; --  windowsx.h:775



   procedure FORWARD_WM_MDIICONARRANGE (hwnd : Win32.Windef.HWND;

                                       fn : LPDEFFN);     --  windowsx.h:777



   type LPMDIGETACTIVEFN is access function (hwnd : Win32.Windef.HWND)

                                           return Win32.Windef.HWND;



   function HANDLE_WM_MDIGETACTIVE (hwnd : Win32.Windef.HWND;

                                   wParam : Win32.WPARAM;

                                   lParam : Win32.LPARAM;

                                   fn : LPMDIGETACTIVEFN)

                                  return Win32.LRESULT;   --  windowsx.h:781



   function FORWARD_WM_MDIGETACTIVE (hwnd : Win32.Windef.HWND;

                                    fn : LPDEFFN)

                                   return Win32.Windef.HWND;

   --  windowsx.h:783



   type LPMDISETMENUFN is access function (hwnd : Win32.Windef.HWND;

                                          fRefresh : Win32.BOOL;

                                          hmenuFrame : Win32.Windef.HMENU;

                                          hmenuWindow : Win32.Windef.HMENU)

                                         return Win32.Windef.HMENU;



   function HANDLE_WM_MDISETMENU (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPMDISETMENUFN)

                                return Win32.LRESULT;     --  windowsx.h:787



   function FORWARD_WM_MDISETMENU (hwnd : Win32.Windef.HWND;

                                  fRefresh : Win32.BOOL;

                                  hmenuFrame : Win32.Windef.HMENU;

                                  hmenuWindow : Win32.Windef.HMENU;

                                  fn : LPDEFFN)

                                 return Win32.Windef.HMENU;

   --  windowsx.h:789







   type LPCHILDACTIVATEPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_CHILDACTIVATE (hwnd : Win32.Windef.HWND;

                                    wParam : Win32.WPARAM;

                                    lParam : Win32.LPARAM;

                                    fn : LPCHILDACTIVATEPROC)

                                   return Win32.LRESULT;  --  windowsx.h:793



   procedure FORWARD_WM_CHILDACTIVATE (hwnd : Win32.Windef.HWND;

                                      fn : LPDEFFN);      --  windowsx.h:795



   type LPINITDIALOGFN is access function (hwnd : Win32.Windef.HWND;

                                          hwndFocus : Win32.Windef.HWND;

                                          lParam : Win32.LPARAM)

                                         return Win32.BOOL;



   function HANDLE_WM_INITDIALOG (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPINITDIALOGFN)

                                return Win32.LRESULT;     --  windowsx.h:799



   function FORWARD_WM_INITDIALOG (hwnd : Win32.Windef.HWND;

                                  hwndFocus : Win32.Windef.HWND;

                                  lParam : Win32.LPARAM;

                                  fn : LPDEFFN)

                                 return Win32.BOOL;       --  windowsx.h:801



   type LPNEXTDLGCTLFN is access function (hwnd : Win32.Windef.HWND;

                                          hwndSetFocus : Win32.Windef.HWND;

                                          fNext : Win32.BOOL)

                                         return Win32.Windef.HWND;



   function HANDLE_WM_NEXTDLGCTL (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPNEXTDLGCTLFN)

                                return Win32.LRESULT;     --  windowsx.h:805



   function FORWARD_WM_NEXTDLGCTL (hwnd : Win32.Windef.HWND;

                                  hwndSetFocus : Win32.Windef.HWND;

                                  fNext : Win32.BOOL;

                                  fn : LPDEFFN)

                                 return Win32.Windef.HWND; --  windowsx.h:807



   type LPPARENTNOTIFYPROC is access procedure (hwnd : Win32.Windef.HWND;

                                               msg : Win32.UINT;

                                               hwndChild : Win32.Windef.HWND;

                                               idChild : Win32.INT);



   function HANDLE_WM_PARENTNOTIFY (hwnd : Win32.Windef.HWND;

                                   wParam : Win32.WPARAM;

                                   lParam : Win32.LPARAM;

                                   fn : LPPARENTNOTIFYPROC)

                                  return Win32.LRESULT;   --  windowsx.h:811



   procedure FORWARD_WM_PARENTNOTIFY (hwnd : Win32.Windef.HWND;

                                     msg : Win32.UINT;

                                     hwndChild : Win32.Windef.HWND;

                                     idChild : Win32.INT;

                                     fn : LPDEFFN);  --  windowsx.h:813



   type LPENTERIDLEPROC is access procedure (hwnd : Win32.Windef.HWND;

                                            source : Win32.UINT;

                                            hwndSource : Win32.Windef.HWND);



   function HANDLE_WM_ENTERIDLE (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPENTERIDLEPROC)

                               return Win32.LRESULT;      --  windowsx.h:817



   procedure FORWARD_WM_ENTERIDLE (hwnd : Win32.Windef.HWND;

                                  source : Win32.UINT;

                                  hwndSource : Win32.Windef.HWND;

                                  fn : LPDEFFN);    --  windowsx.h:819



   type LPGETDLGCODEFN is access function (hwnd : Win32.Windef.HWND;

                                          lpmsg : Win32.Winuser.LPMSG)

                                         return Win32.UINT;



   function HANDLE_WM_GETDLGCODE (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPGETDLGCODEFN)

                                return Win32.LRESULT;     --  windowsx.h:823



   function FORWARD_WM_GETDLGCODE (hwnd : Win32.Windef.HWND;

                                  lpmsg : Win32.Winuser.LPMSG;

                                  fn : LPDEFFN)

                                 return Win32.UINT;       --  windowsx.h:825



   type LPCTLCOLORFN is access function (hwnd : Win32.Windef.HWND;

                                        hdc : Win32.Windef.HDC;

                                        hwndChild : Win32.Windef.HWND;

                                        ctrlType : Win32.INT)

                                       return Win32.Windef.HBRUSH;



   function HANDLE_WM_CTLCOLORMSGBOX (hwnd : Win32.Windef.HWND;

                                     wParam : Win32.WPARAM;

                                     lParam : Win32.LPARAM;

                                     fn : LPCTLCOLORFN)

                                    return Win32.LRESULT; --  windowsx.h:829



   function FORWARD_WM_CTLCOLORMSGBOX

     (hwnd : Win32.Windef.HWND;

      hdc : Win32.Windef.HDC;

      hwndChild : Win32.Windef.HWND;

      ctlType : Win32.INT;

      fn : LPDEFFN)

     return Win32.Windef.HBRUSH; --  windowsx.h:831



   function HANDLE_WM_CTLCOLOREDIT (hwnd : Win32.Windef.HWND;

                                   wParam : Win32.WPARAM;

                                   lParam : Win32.LPARAM;

                                   fn : LPCTLCOLORFN)

                                  return Win32.LRESULT;   --  windowsx.h:834



   function FORWARD_WM_CTLCOLOREDIT (hwnd : Win32.Windef.HWND;

                                    hdc : Win32.Windef.HDC;

                                    hwndChild : Win32.Windef.HWND;

                                    ctlType : Win32.INT;

                                    fn : LPDEFFN)

                                   return Win32.Windef.HBRUSH;

   --  windowsx.h:836



   function HANDLE_WM_CTLCOLORLISTBOX (hwnd : Win32.Windef.HWND;

                                      wParam : Win32.WPARAM;

                                      lParam : Win32.LPARAM;

                                      fn : LPCTLCOLORFN)

                                     return Win32.LRESULT; --  windowsx.h:839



   function FORWARD_WM_CTLCOLORLISTBOX (hwnd : Win32.Windef.HWND;

                                       hdc : Win32.Windef.HDC;

                                       hwndChild : Win32.Windef.HWND;

                                       ctlType : Win32.INT;

                                       fn : LPDEFFN)

                                      return Win32.Windef.HBRUSH;

   --  windowsx.h:841



   function HANDLE_WM_CTLCOLORBTN (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPCTLCOLORFN)

                                 return Win32.LRESULT;    --  windowsx.h:844



   function FORWARD_WM_CTLCOLORBTN (hwnd : Win32.Windef.HWND;

                                   hdc : Win32.Windef.HDC;

                                   hwndChild : Win32.Windef.HWND;

                                   ctlType : Win32.INT;

                                   fn : LPDEFFN)

                                  return Win32.Windef.HBRUSH;

   --  windowsx.h:846



   function HANDLE_WM_CTLCOLORDLG (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPCTLCOLORFN)

                                 return Win32.LRESULT;    --  windowsx.h:849



   function FORWARD_WM_CTLCOLORDLG (hwnd : Win32.Windef.HWND;

                                   hdc : Win32.Windef.HDC;

                                   hwndChild : Win32.Windef.HWND;

                                   ctlType : Win32.INT;

                                   fn : LPDEFFN)

                                  return Win32.Windef.HBRUSH;

   --  windowsx.h:851



   function HANDLE_WM_CTLCOLORSCROLLBAR (hwnd : Win32.Windef.HWND;

                                        wParam : Win32.WPARAM;

                                        lParam : Win32.LPARAM;

                                        fn : LPCTLCOLORFN)

                                       return Win32.LRESULT;

   --  windowsx.h:854



   function FORWARD_WM_CTLCOLORSCROLLBAR

     (hwnd : Win32.Windef.HWND;

      hdc : Win32.Windef.HDC;

      hwndChild : Win32.Windef.HWND;

      ctlType : Win32.INT;

      fn : LPDEFFN)

     return Win32.Windef.HBRUSH; --  windowsx.h:856



   function HANDLE_WM_CTLCOLORSTATIC (hwnd : Win32.Windef.HWND;

                                     wParam : Win32.WPARAM;

                                     lParam : Win32.LPARAM;

                                     fn : LPCTLCOLORFN)

                                    return Win32.LRESULT; --  windowsx.h:859



   function FORWARD_WM_CTLCOLORSTATIC (hwnd : Win32.Windef.HWND;

                                      hdc : Win32.Windef.HDC;

                                      hwndChild : Win32.Windef.HWND;

                                      ctlType : Win32.INT;

                                      fn : LPDEFFN)

                                     return Win32.Windef.HBRUSH;

   --  windowsx.h:861



   type LPSETFONTPROC is access procedure (hwnd : Win32.Windef.HWND;

                                          hfont : Win32.Windef.HFONT;

                                          fRedraw : Win32.BOOL);



   function HANDLE_WM_SETFONT (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPSETFONTPROC)

                             return Win32.LRESULT;        --  windowsx.h:865



   procedure FORWARD_WM_SETFONT (hwnd : Win32.Windef.HWND;

                                hfont : Win32.Windef.HFONT;

                                fRedraw : Win32.BOOL;

                                fn : LPDEFFN);         --  windowsx.h:867



   procedure SetWindowFont (hwnd : Win32.Windef.HWND;

                           hfont : Win32.Windef.HFONT;

                           fRedraw : Win32.BOOL);            --  windowsx.h:91



   type LPGETFONTFN is access function (hwnd : Win32.Windef.HWND)

                                      return Win32.Windef.HFONT;



   function HANDLE_WM_GETFONT (hwnd : Win32.Windef.HWND;

                              wParam : Win32.WPARAM;

                              lParam : Win32.LPARAM;

                              fn : LPGETFONTFN)

                             return Win32.LRESULT;        --  windowsx.h:871



   function FORWARD_WM_GETFONT (hwnd : Win32.Windef.HWND;

                               fn : LPDEFFN)

                              return Win32.Windef.HFONT;  --  windowsx.h:873



   function GetWindowFont (hwnd : Win32.Windef.HWND) return Win32.Windef.HFONT;

   --  windowsx.h:95



   type LPCDRAWITEMSTRUCT is

     access all Win32.Winuser.DRAWITEMSTRUCT;

   type LPDRAWITEMPROC is access procedure (hwnd : Win32.Windef.HWND;

                                           lpDrawItem : LPCDRAWITEMSTRUCT);



   function HANDLE_WM_DRAWITEM (hwnd : Win32.Windef.HWND;

                               wParam : Win32.WPARAM;

                               lParam : Win32.LPARAM;

                               fn : LPDRAWITEMPROC)

                              return Win32.LRESULT;       --  windowsx.h:877



   procedure FORWARD_WM_DRAWITEM (hwnd : Win32.Windef.HWND;

                                 lpDrawItem : LPCDRAWITEMSTRUCT;

                                 fn : LPDEFFN);     --  windowsx.h:879

   type LPMEASUREITEMPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      lpMeasureItem : Win32.Winuser.LPMEASUREITEMSTRUCT);



   function HANDLE_WM_MEASUREITEM (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPMEASUREITEMPROC)

                                 return Win32.LRESULT;    --  windowsx.h:883



   procedure FORWARD_WM_MEASUREITEM

     (hwnd : Win32.Windef.HWND;

      lpMeasureItem : Win32.Winuser.LPMEASUREITEMSTRUCT;

      fn : LPDEFFN);                    --  windowsx.h:885



   type LPCDELETEITEMSTRUCT is access

     constant Win32.Winuser.DELETEITEMSTRUCT;



   type LPDELETEITEMPROC is access procedure

     (hwnd : Win32.Windef.HWND;

      lpDeleteItem : LPCDELETEITEMSTRUCT);



   function HANDLE_WM_DELETEITEM (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPDELETEITEMPROC)

                                return Win32.LRESULT;     --  windowsx.h:889



   procedure FORWARD_WM_DELETEITEM (hwnd : Win32.Windef.HWND;

                                   lpDeleteItem : LPCDELETEITEMSTRUCT;

                                   fn : LPDEFFN); --  windowsx.h:891

   type LPCCOMPAREITEMSTRUCT is

     access all Win32.Winuser.COMPAREITEMSTRUCT;



   type LPCOMPAREITEMFN is access function

     (hwnd : Win32.Windef.HWND;

      lpCompareItem : LPCCOMPAREITEMSTRUCT)

     return Win32.INT;



   function HANDLE_WM_COMPAREITEM (hwnd : Win32.Windef.HWND;

                                  wParam : Win32.WPARAM;

                                  lParam : Win32.LPARAM;

                                  fn : LPCOMPAREITEMFN)

                                 return Win32.LRESULT;    --  windowsx.h:895



   function FORWARD_WM_COMPAREITEM (hwnd : Win32.Windef.HWND;

                                   lpCompareItem : LPCCOMPAREITEMSTRUCT;

                                   fn : LPDEFFN)

                                  return Win32.INT;       --  windowsx.h:897



   type LPVKEYTOITEMFN is access function (hwnd : Win32.Windef.HWND;

                                          vk : Win32.UINT;

                                          hwndListbox : Win32.Windef.HWND;

                                          iCaret : Win32.INT)

                                         return Win32.INT;



   function HANDLE_WM_VKEYTOITEM (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPVKEYTOITEMFN)

                                return Win32.LRESULT;     --  windowsx.h:901



   function FORWARD_WM_VKEYTOITEM (hwnd : Win32.Windef.HWND;

                                  vk : Win32.UINT;

                                  hwndListbox : Win32.Windef.HWND;

                                  iCaret : Win32.INT;

                                  fn : LPDEFFN)

                                 return Win32.INT;        --  windowsx.h:903



   type LPCHARTOITEMFN is access function (hwnd : Win32.Windef.HWND;

                                          ch : Win32.UINT;

                                          hwndListbox : Win32.Windef.HWND;

                                          iCaret : Win32.INT)

                                         return Win32.INT;



   function HANDLE_WM_CHARTOITEM (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPCHARTOITEMFN)

                                return Win32.LRESULT;     --  windowsx.h:907



   function FORWARD_WM_CHARTOITEM (hwnd : Win32.Windef.HWND;

                                  ch : Win32.UINT;

                                  hwndListbox : Win32.Windef.HWND;

                                  iCaret : Win32.INT;

                                  fn : LPDEFFN)

                                 return Win32.INT;        --  windowsx.h:909



   type LPQUEUESYNCPROC is access procedure (hwnd : Win32.Windef.HWND);



   function HANDLE_WM_QUEUESYNC (hwnd : Win32.Windef.HWND;

                                wParam : Win32.WPARAM;

                                lParam : Win32.LPARAM;

                                fn : LPQUEUESYNCPROC)

                               return Win32.LRESULT;      --  windowsx.h:913



   procedure FORWARD_WM_QUEUESYNC (hwnd : Win32.Windef.HWND;

                                  fn : LPDEFFN);          --  windowsx.h:915



   type LPCOMMNOTIFYPROC is access procedure (hwnd : Win32.Windef.HWND;

                                             cid : Win32.INT;

                                             flags : Win32.UINT);



   function HANDLE_WM_COMMNOTIFY (hwnd : Win32.Windef.HWND;

                                 wParam : Win32.WPARAM;

                                 lParam : Win32.LPARAM;

                                 fn : LPCOMMNOTIFYPROC)

                                return Win32.LRESULT;     --  windowsx.h:919



   procedure FORWARD_WM_COMMNOTIFY (hwnd : Win32.Windef.HWND;

                                   cid : Win32.INT;

                                   flags : Win32.UINT;

                                   fn : LPDEFFN);        --  windowsx.h:921







   function Static_Enable (hwndCtl : Win32.Windef.HWND;      --  xwindows.h:926

                          fEnable : Win32.BOOL)

                         return Win32.BOOL

     renames Win32.Winuser.EnableWindow;



   function Static_GetText (hwndCtl : Win32.Windef.HWND;     --  xwindows.h:928

                           lpch : Win32.LPSTR;

                           cchMax : Win32.INT)

                          return Win32.INT

     renames Win32.Winuser.GetWindowText;



   function Static_GetTextLength (hwndCtl : Win32.Windef.HWND)

      --  xwindows.h:929

                                return Win32.INT

     renames Win32.Winuser.GetWindowTextLength;



   function Static_SetText (hwndCtl : Win32.Windef.HWND;     --  xwindows.h:930

                           lpsz : Win32.LPCSTR)

                          return Win32.BOOL

     renames Win32.Winuser.SetWindowText;



   function Static_SetIcon (hwndCtl : Win32.Windef.HWND;     --  xwindows.h:932

                           hIcon : Win32.Windef.HICON)

                          return Win32.Windef.HICON;



   function Static_GetIcon (hwndCtl : Win32.Windef.HWND;     --  xwindows.h:933

                           hIcon : Win32.Windef.HICON)

                          return Win32.Windef.HICON;





   function Button_Enable (hwndCtl : Win32.Windef.HWND;

                          fEnable : Win32.BOOL)

                         return Win32.BOOL

     renames Win32.Winuser.EnableWindow;

   --  windowsx.h:937



   function Button_GetText (hWndCtl : Win32.Windef.HWND;

                           lpch : Win32.LPSTR;

                           cchMax : Win32.INT)

                          return Win32.INT

     renames Win32.Winuser.GetWindowText;

   --  windowsx.h:939



   function Button_GetTextLength (hWndCtl : Win32.Windef.HWND)

                                return Win32.INT

     renames Win32.Winuser.GetWindowTextLength;          --  windowsx.h:940



   function Button_SetText (hWndCtl : Win32.Windef.HWND;

                           lpsz : Win32.LPCSTR)

                          return Win32.BOOL

     renames Win32.Winuser.SetWindowText;

   --  windowsx.h:941



   function Button_GetCheck (hwndCtl : Win32.Windef.HWND)

                           return Win32.INT;              --  windowsx.h:943



   procedure Button_SetCheck (hwndCtl : Win32.Windef.HWND;

                             check : Win32.WPARAM);      --  winuser.h:944



   function Button_GetState (hwndCtl : Win32.Windef.HWND)   --  winuser.h:946

                           return Win32.INT;



   function Button_SetState (hwndCtl : Win32.Windef.HWND;

                            state : Win32.WPARAM)       --  winuser.h:947

                           return Win32.UINT;



   procedure Button_SetStyle (hwndCtl : Win32.Windef.HWND;

                             style : Win32.DWORD;

                             fRedraw : Win32.BOOL);        --  winuser.h:949



   function Edit_Enable (hwndCtl : Win32.Windef.HWND;

                        fEnable : Win32.BOOL)

                       return Win32.BOOL

     renames Win32.Winuser.EnableWindow; --  windowsx.h:953



   function Edit_GetText (hWndCtl : Win32.Windef.HWND;

                         lpch : Win32.LPSTR;

                         cchMax : Win32.INT)

                        return Win32.INT

     renames Win32.Winuser.GetWindowText;

   --  windowsx.h:955



   function Edit_GetTextLength (hWndCtl : Win32.Windef.HWND)

                              return Win32.INT

     renames Win32.Winuser.GetWindowTextLength;          --  windowsx.h:956





   function Edit_SetText (hWndCtl : Win32.Windef.HWND;

                         lpsz : Win32.LPCSTR)

                        return Win32.BOOL

     renames Win32.Winuser.SetWindowText;

   --  windowsx.h:957



   procedure Edit_LimitText (hwndCtl : Win32.Windef.HWND;    --  windowsx.h:959

                            cchMax : Win32.INT);



   function Edit_GetLineCount (hwndCtl : Win32.Windef.HWND)  --  windowsx.h:961

                             return Win32.INT;



   --  function Edit_GetLine(hwndCtl: Win32.Windef.HWND;

   --  line   : Win32.INT;

   --  lpch   : Win32.PCHAR;

   --  cchMax : Win32.size_t)           -- windowsx.h:961

   --  return Win32.INT;

   procedure Edit_GetLine (hwndCtl : Win32.Windef.HWND;

                          line : Win32.INT;

                          lpch : in out Win32.PCHAR;

                          cchMax : Win32.Size_T;           --  windowsx.h:961

                          cch : out Win32.INT);



   procedure Edit_GetRect (hwndCtl : Win32.Windef.HWND;      --  windowsx.h:964

                          lprc : Win32.Windef.LPRECT);





   procedure Edit_SetRect (hwndCtl : Win32.Windef.HWND;      --  windowsx.h:965

                          lprc : Win32.Windef.LPRECT);



   procedure Edit_SetRectNoPaint (hwndCtl : Win32.Windef.HWND;

                                 lprc : Win32.Windef.LPRECT);

   --  windowsx.h:966



   function Edit_GetSel (hwndCtl : Win32.Windef.HWND) return Win32.DWORD;

   --  windowsx.h:968



   procedure Edit_SetSel (hwndCtl : Win32.Windef.HWND;

                         ichStart : Win32.INT;

                         ichEnd : Win32.INT);             --  windowsx.h:969



   procedure Edit_ReplaceSel (hwndCtl : Win32.Windef.HWND;

                             lpszReplace : Win32.Winnt.LPCTSTR);

   --  windowsx.h:970





   function Edit_GetModify (hwndCtl : Win32.Windef.HWND) return Win32.BOOL;

   --  windowsx.h:972

   procedure Edit_SetModify (hwndCtl : Win32.Windef.HWND;

                            fModified : Win32.BOOL);        --  windowsx.h:973

   function Edit_ScrollCaret (hwndCtl : Win32.Windef.HWND) return Win32.BOOL;

   --  windowsx.h:975

   function Edit_LineFromChar (hwndCtl : Win32.Windef.HWND;

                              ich : Win32.INT)

                             return Win32.INT;            --  windowsx.h:977



   function Edit_LineIndex (hwndCtl : Win32.Windef.HWND;

                           line : Win32.INT)

                          return Win32.INT;               --  windowsx.h:978



   function Edit_LineLength (hwndCtl : Win32.Windef.HWND;

                            line : Win32.INT)

                           return Win32.INT;              --  windowsx.h:979



   procedure Edit_Scroll (hwndCtl : Win32.Windef.HWND;

                         dv : Win32.INT;

                         dh : Win32.INT);              --  windowsx.h:981



   function Edit_CanUndo (hwndCtl : Win32.Windef.HWND) return Win32.BOOL;

   --  windowsx.h:983

   function Edit_Undo (hwndCtl : Win32.Windef.HWND) return Win32.BOOL;

   --  windowsx.h:984

   procedure Edit_EmptyUndoBuffer (hwndCtl : Win32.Windef.HWND);

   --  windowsx.h:985



   procedure Edit_SetPasswordChar (hwndCtl : Win32.Windef.HWND;

                                  ch : Win32.CHAR);    --  windowsx.h:987





   procedure Edit_SetTabStops (hwndCtl : Win32.Windef.HWND;

                              cTabs : Win32.INT;

                              lpTabs : Win32.LPWORD);      --  windowsx.h:989



   function Edit_FmtLines (hwndCtl : Win32.Windef.HWND;

                          fAddEOL : Win32.BOOL)

                         return Win32.BOOL;               --  windowsx.h:991



   function Edit_GetHandle (hwndCtl : Win32.Windef.HWND)

                          return Win32.Windef.HLOCAL;     --  windowsx.h:993



   procedure Edit_SetHandle (hwndCtl : Win32.Windef.HWND;

                            h : Win32.Windef.HLOCAL);



   function Edit_GetFirstVisibleLine (hwndCtl : Win32.Windef.HWND)

                                    return Win32.INT;     --  windowsx.h:997



   function Edit_SetReadOnly (hwndCtl : Win32.Windef.HWND;

                             fReadOnly : Win32.BOOL)

                            return Win32.BOOL;            --  windowsx.h:999



   function Edit_GetPasswordChar (hwndCtl : Win32.Windef.HWND)

                                return Win32.TCHAR; --  windowsx.h:1001



   procedure Edit_SetWordBreakProc

     (hwndCtl : Win32.Windef.HWND;

      lpfnWordBreak : Win32.Winuser.EDITWORDBREAKPROC);

   --  windowsx.h:1003





   function Edit_GetWordBreakProc (hwndCtl : Win32.Windef.HWND)

                                 return Win32.Winuser.EDITWORDBREAKPROC;

   --  windowsx.h:1004



   function ScrollBar_Enable (hwndCtl : Win32.Windef.HWND;

                             flags : Win32.UINT)

                            return Win32.BOOL;            --  windowsx.h: 1010



   function ScrollBar_Show (hwndCtl : Win32.Windef.HWND;

                           fShow : Win32.BOOL)

                          return Win32.BOOL;              --  windowsx.h:1012

   nCmdShow : Win32.INT;



   function ScrollBar_SetPos (hwndCtl : Win32.Windef.HWND;

                             pos : Win32.INT;

                             fRedraw : Win32.BOOL)

                            return Win32.INT;             --  windowsx.h:1014



   function ScrollBar_GetPos (hwndCtl : Win32.Windef.HWND)

                            return Win32.INT;             --  windowsx.h:1015



   function ScrollBar_SetRange (hwndCtl : Win32.Windef.HWND;

                               posMin : Win32.INT;

                               posMax : Win32.INT;

                               fRedraw : Win32.BOOL)

                              return Win32.BOOL;          --  windowsx.h:1017





   function ScrollBar_GetRange (hwndCtl : Win32.Windef.HWND;

                               lpposMin : Win32.LPINT;

                               lpposMax : Win32.LPINT)

                              return Win32.BOOL;          --  windowsx.h:1018



   function ListBox_Enable (hwndCtl : Win32.Windef.HWND;

                           fEnable : Win32.BOOL)

                          return Win32.BOOL;              --  windowsx.h:1022



   function ListBox_GetCount (hwndCtl : Win32.Windef.HWND)

                            return Win32.INT;             --  windowsx.h:1024



   function ListBox_ResetContent (hwndCtl : Win32.Windef.HWND)

                                return Win32.BOOL;        --  windowsx.h:1025



   function ListBox_AddString (hwndCtl : Win32.Windef.HWND;

                              lpsz : Win32.Winnt.LPCTSTR)

                             return Win32.INT;            --  windowsx.h:1027



   function ListBox_InsertString (hwndCtl : Win32.Windef.HWND;

                                 index : Win32.INT;

                                 lpsz : Win32.Winnt.LPCTSTR)

                                return Win32.INT;         --  windowsx.h:1028



   function ListBox_AddItemData (hwndCtl : Win32.Windef.HWND;

                                data : Win32.Winnt.LPCTSTR)

                               return Win32.INT;          --  windowsx.h:1030



   function ListBox_InsertItemData (hwndCtl : Win32.Windef.HWND;

                                   index : Win32.INT;

                                   data : Win32.Winnt.LPCTSTR)

                                  return Win32.INT;       --  windowsx.h:1031



   function ListBox_DeleteString (hwndCtl : Win32.Windef.HWND;

                                 index : Win32.INT)

                                return Win32.INT;         --  windowsx.h:1033



   function ListBox_GetTextLen (hwndCtl : Win32.Windef.HWND;

                               index : Win32.INT)

                              return Win32.INT;           --  windowsx.h:1035



   function ListBox_GetText (hwndCtl : Win32.Windef.HWND;

                            index : Win32.INT;

                            lpszBuffer : Win32.Winnt.LPCTSTR)

                           return Win32.INT;              --  windowsx.h:1036



   function ListBox_GetItemData (hwndCtl : Win32.Windef.HWND;

                                index : Win32.INT)

                               return Win32.LRESULT;      --  windowsx.h:1038



   function ListBox_SetItemData (hwndCtl : Win32.Windef.HWND;

                                index : Win32.INT;

                                data : Win32.DWORD)

                               return Win32.INT;          --  windowsx.h:1039



   function ListBox_FindString (hwndCtl : Win32.Windef.HWND;

                               indexStart : Win32.INT;

                               lpszFind : Win32.Winnt.LPCTSTR)

                              return Win32.INT;           --  windowsx.h:1042



   function ListBox_FindItemData (hwndCtl : Win32.Windef.HWND;

                                 indexStart : Win32.INT;

                                 data : Win32.Winnt.LPCTSTR)

                                return Win32.INT;         --  windowsx.h:1043



   function ListBox_SetSel (hwndCtl : Win32.Windef.HWND;

                           fSelect : Win32.BOOL;

                           index : Win32.UINT)

                          return Win32.INT;               --  windowsx.h:1045



   function ListBox_SelItemRange (hwndCtl : Win32.Windef.HWND;

                                 fSelect : Win32.BOOL;

                                 first : Win32.WORD;

                                 last : Win32.WORD)

                                return Win32.INT;         --  windowsx.h:1046



   function ListBox_GetCurSel (hwndCtl : Win32.Windef.HWND)

                             return Win32.INT;            --  windowsx.h:1048



   function ListBox_SetCurSel (hwndCtl : Win32.Windef.HWND;

                              index : Win32.INT)

                             return Win32.INT;            --  windowsx.h:1049



   function ListBox_SelectString (hwndCtl : Win32.Windef.HWND;

                                 indexStart : Win32.INT;

                                 lpszFind : Win32.LPCSTR)

                                return Win32.INT;         --  windowsx.h:1051



   function ListBox_SelectItemData (hwndCtl : Win32.Windef.HWND;

                                   indexStart : Win32.INT;

                                   data : Win32.LPCSTR)

                                  return Win32.INT;       --  windowsx.h:1052



   function ListBox_GetSel (hwndCtl : Win32.Windef.HWND;

                           index : Win32.INT)

                          return Win32.INT;               --  windowsx.h:1054



   function ListBox_GetSelCount (hwndCtl : Win32.Windef.HWND)

                               return Win32.INT;          --  windowsx.h:1055



   function ListBox_GetTopIndex (hwndCtl : Win32.Windef.HWND)

                               return Win32.INT;          --  windowsx.h:1056



   function ListBox_GetSelItems (hwndCtl : Win32.Windef.HWND;

                                cItems : Win32.INT;

                                lpItems : Win32.LPINT)

                               return Win32.INT;          --  windowsx.h:1057



   function ListBox_SetTopIndex (hwndCtl : Win32.Windef.HWND;

                                indexTop : Win32.INT)

                               return Win32.INT;          --  windowsx.h:1059



   procedure ListBox_SetColumnWidth (hwndCtl : Win32.Windef.HWND;

                                    cxColumn : Win32.INT);



   function ListBox_GetHorizontalExtent (hwndCtl : Win32.Windef.HWND)

                                       return Win32.INT;

   --  windowsx.h:1062



   procedure ListBox_SetHorizontalExtent (hwndCtl : Win32.Windef.HWND;

                                         cxExtent : Win32.INT);



   function ListBox_SetTabStops (hwndCtl : Win32.Windef.HWND;

                                cTabs : Win32.INT;

                                lpTabs : Win32.LPINT)

                               return Win32.BOOL;         --  windowsx.h:1065



   function ListBox_GetItemRect (hwndCtl : Win32.Windef.HWND;

                                index : Win32.INT;

                                lprc : Win32.Windef.LPRECT)

                               return Win32.INT;          --  windowsx.h:1067



   function ListBox_SetCaretIndex (hwndCtl : Win32.Windef.HWND;

                                  index : Win32.INT)

                                 return Win32.INT;        --  windowsx.h:1069



   function ListBox_GetCaretIndex (hwndCtl : Win32.Windef.HWND)

                                 return Win32.INT;        --  windowsx.h:1070



   function ListBox_FindStringExact (hwndCtl : Win32.Windef.HWND;

                                    indexStart : Win32.INT;

                                    lpszFind : Win32.Winnt.LPCTSTR)

                                   return Win32.INT;      --  windowsx.h:1072



   function ListBox_SetItemHeight (hwndCtl : Win32.Windef.HWND;

                                  index : Win32.INT;

                                  cy : Win32.INT)

                                 return Win32.INT;        --  windowsx.h:1074



   function ListBox_GetItemHeight (hwndCtl : Win32.Windef.HWND;

                                  index : Win32.INT)

                                 return Win32.INT;        --  windowsx.h:1075



   function ListBox_Dir (hwndCtl : Win32.Windef.HWND;

                        attrs : Win32.UINT;

                        lpszFileSpec : Win32.Winnt.LPCTSTR)

                       return Win32.INT;                  --  windowsx.h:1078



   function ComboBox_Enable (hwndCtl : Win32.Windef.HWND;

                            fEnable : Win32.BOOL)

                           return Win32.BOOL

     renames Win32.Winuser.EnableWindow;

   --  windowsx.h:1082



   function ComboBox_GetText (hWnd : Win32.Windef.HWND;

                             lpString : Win32.LPSTR;

                             nMaxCount : Win32.INT)

                            return Win32.INT

     renames Win32.Winuser.GetWindowText;

   --  windowsx.h:1084





   function ComboBox_GetTextLength (hwndCtl : Win32.Windef.HWND)

                                  return Win32.INT

     renames Win32.Winuser.GetWindowTextLength;

   --  windowsx.h:1085



   function ComboBox_SetText (hwndCtl : Win32.Windef.HWND;

                             lpsz : Win32.LPCSTR)

                            return Win32.BOOL

     renames Win32.Winuser.SetWindowText;

   --  windowsx.h:1086



   function ComboBox_LimitText (hwndCtl : Win32.Windef.HWND;

                               cchLimit : Win32.INT)

                              return Win32.INT;           --  windowsx.h:1088



   function ComboBox_GetEditSel (hwndCtl : Win32.Windef.HWND)

                               return Win32.DWORD;        --  windowsx.h:1090



   function ComboBox_SetEditSel (hwndCtl : Win32.Windef.HWND;

                                ichStart : Win32.INT;

                                ichEnd : Win32.INT)

                               return Win32.INT;          --  windowsx.h:1091



   function ComboBox_GetCount (hwndCtl : Win32.Windef.HWND)

                             return Win32.INT;            --  windowsx.h:1093



   function ComboBox_ResetContent (hwndCtl : Win32.Windef.HWND)

                                 return Win32.INT;        --  windowsx.h:1094



   function ComboBox_AddString (hwndCtl : Win32.Windef.HWND;

                               lpsz : Win32.Winnt.LPCTSTR)

                              return Win32.INT;           --  windowsx.h:1096



   function ComboBox_InsertString (hwndCtl : Win32.Windef.HWND;

                                  index : Win32.INT;

                                  lpsz : Win32.Winnt.LPCTSTR)

                                 return Win32.INT;        --  windowsx.h:1097



   function ComboBox_AddItemData (hwndCtl : Win32.Windef.HWND;

                                 data : Win32.Winnt.LPCTSTR)

                                return Win32.INT;         --  windowsx.h:1099



   function ComboBox_InsertItemData (hwndCtl : Win32.Windef.HWND;

                                    index : Win32.INT;

                                    data : Win32.Winnt.LPCTSTR)

                                   return Win32.INT;      --  windowsx.h:1100



   function ComboBox_DeleteString (hwndCtl : Win32.Windef.HWND;

                                  index : Win32.INT)

                                 return Win32.INT;        --  windowsx.h:1102



   function ComboBox_GetLBTextLen (hwndCtl : Win32.Windef.HWND;

                                  index : Win32.INT)

                                 return Win32.INT;        --  windowsx.h:1104



   function ComboBox_GetLBText (hwndCtl : Win32.Windef.HWND;

                               index : Win32.INT;

                               lpszBuffer : Win32.Winnt.LPCTSTR)

                              return Win32.INT;           --  windowsx.h:1105



   function ComboBox_GetItemData (hwndCtl : Win32.Windef.HWND;

                                 index : Win32.INT)

                                return Win32.LRESULT;     --  windowsx.h:1107



   function ComboBox_SetItemData (hwndCtl : Win32.Windef.HWND;

                                 index : Win32.INT;

                                 data : Win32.DWORD)

                                return Win32.INT;         --  windowsx.h:1108



   function ComboBox_FindString (hwndCtl : Win32.Windef.HWND;

                                indexStart : Win32.INT;

                                lpszFind : Win32.Winnt.LPCTSTR)

                               return Win32.INT;          --  windowsx.h:1110



   function ComboBox_FindItemData (hwndCtl : Win32.Windef.HWND;

                                  indexStart : Win32.INT;

                                  data : Win32.Winnt.LPCTSTR)

                                 return Win32.INT;        --  windowsx.h:1111



   function ComboBox_GetCurSel (hwndCtl : Win32.Windef.HWND)

                              return Win32.INT;           --  windowsx.h:1113



   function ComboBox_SetCurSel (hwndCtl : Win32.Windef.HWND;

                               index : Win32.INT)

                              return Win32.INT;           --  windowsx.h:1114



   function ComboBox_SelectString (hwndCtl : Win32.Windef.HWND;

                                  indexStart : Win32.INT;

                                  lpszSelect : Win32.Winnt.LPCTSTR)

                                 return Win32.INT;        --  windowsx.h:1116



   function ComboBox_SelectItemData (hwndCtl : Win32.Windef.HWND;

                                    indexStart : Win32.INT;

                                    data : Win32.LPCSTR)

                                   return Win32.INT;      --  windowsx.h:1117



   function ComboBox_Dir (hwndCtl : Win32.Windef.HWND;

                         attrs : Win32.UINT;

                         lpszFileSpec : Win32.Winnt.LPCTSTR)

                        return Win32.INT;                 --  windowsx.h:1119



   function ComboBox_ShowDropdown (hwndCtl : Win32.Windef.HWND;

                                  fShow : Win32.BOOL)

                                 return Win32.BOOL;       --  windowsx.h:1121



   function ComboBox_FindStringExact (hwndCtl : Win32.Windef.HWND;

                                     indexStart : Win32.INT;

                                     lpszFind : Win32.LPCSTR)

                                    return Win32.INT;     --  windowsx.h:1124



   function ComboBox_GetDroppedState (hwndCtl : Win32.Windef.HWND)

                                    return Win32.BOOL;    --  windowsx.h:1126



   procedure ComboBox_GetDroppedControlRect (hwndCtl : Win32.Windef.HWND;

                                            lprc : Win32.Windef.LPRECT);



   function ComboBox_GetItemHeight (hwndCtl : Win32.Windef.HWND)

                                  return Win32.INT;       --  windowsx.h:1129



   --  The specification of the ComboBox_SetItemHeight function differs from

   --  windowsx.h spec.  The index parameter was added.

   function ComboBox_SetItemHeight (hwndCtl : Win32.Windef.HWND;

                                   cyItem : Win32.INT;

                                   index : Win32.INT)

                                  return Win32.INT;       --  windowsx.h:1130



   function ComboBox_GetExtendedUI (hwndCtl : Win32.Windef.HWND)

                                  return Win32.UINT;      --  windowsx.h:1132



   function ComboBox_SetExtendedUI (hwndCtl : Win32.Windef.HWND;

                                   flags : Win32.BOOL)

                                  return Win32.INT;       --  windowsx.h:1133



   function GET_WPARAM (wp : Win32.WPARAM;

                       lp : Win32.LPARAM)

                      return Win32.WPARAM;                --  windowsx.h:1140



   function GET_LPARAM (wp : Win32.WPARAM;

                       lp : Win32.LPARAM)

                      return Win32.LPARAM;                --  windowsx.h:1141



   function GET_WM_ACTIVATE_STATE (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM)

                                 return Win32.WORD;       --  windowsx.h:1143



   function GET_WM_ACTIVATE_FMINIMIZED (wp : Win32.WPARAM;

                                       lp : Win32.LPARAM)

                                      return Win32.BOOL;

   --  windowsx.h:1144



   function GET_WM_ACTIVATE_HWND (wp : Win32.WPARAM;

                                 lp : Win32.LPARAM)

                                return Win32.Windef.HWND;

   --  windowsx.h:1145





   function GET_WM_ACTIVATE_MPS (s : Win32.WORD;

                                fmin : Win32.BOOL;

                                hwnd : Win32.Windef.HWND)

                               return Win32.LONG;        --  windowsx.h:1146



   function GET_WM_CHARTOITEM_CHAR (wp : Win32.WPARAM;

                                   lp : Win32.LPARAM)

                                  return Win32.TCHAR;

   --  windowsx.h:1149





   function GET_WM_CHARTOITEM_POS (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM)

                                 return Win32.WORD;       --  windowsx.h:1150



   function GET_WM_CHARTOITEM_HWND (wp : Win32.WPARAM;

                                   lp : Win32.LPARAM)

                                  return Win32.Windef.HWND;

   --  windowsx.h:1151





   function GET_WM_CHARTOITEM_MPS (ch : Win32.TCHAR;

                                  pos : Win32.WORD;

                                  hwnd : Win32.Windef.HWND)

                                 return Win32.LONG;        --  windowsx.h:1152



   function GET_WM_COMMAND_ID (wp : Win32.WPARAM;

                              lp : Win32.LPARAM)

                             return Win32.WORD;           --  windowsx.h:1155



   function GET_WM_COMMAND_HWND (wp : Win32.WPARAM;

                                lp : Win32.LPARAM)

                               return Win32.Windef.HWND;  --  windowsx.h:1156



   function GET_WM_COMMAND_CMD (wp : Win32.WPARAM;

                               lp : Win32.LPARAM)

                              return Win32.WORD;          --  windowsx.h:1157



   function GET_WM_COMMAND_MPS (id : Win32.WORD;

                               hwnd : Win32.Windef.HWND;

                               cmd : Win32.WORD)

                              return Win32.LONG;          --  windowsx.h:1158



   function GET_WM_CTLCOLOR_HDC (wp : Win32.WPARAM;

                                 lp : Win32.LPARAM;

                                 msg : Win32.UINT)

                               return Win32.Windef.HDC;   --  windows.h:1163



   function GET_WM_CTLCOLOR_HWND (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM;

                                  msg : Win32.UINT)

                                return Win32.Windef.HWND;  --  windows.h:1164





   function GET_WM_CTLCOLOR_TYPE (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM;

                                  msg : Win32.UINT)

                                return Win32.WORD;        --  windows.h:1165



   function GET_WM_CTLCOLOR_MSG (the_type : Win32.UINT)

                               return Win32.WORD;         --  windows.h:1166



   function GET_WM_CTLCOLOR_MPS (hdc : Win32.Windef.HDC;

                                hwnd : Win32.Windef.HWND;

                                the_type : Win32.UINT)

                               return Win32.LONG;         --  windows.h:1167





   function GET_WM_MENUSELECT_CMD (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM)

                                 return Win32.WORD;       --  windowsx.h:1171





   function GET_WM_MENUSELECT_FLAGS (wp : Win32.WPARAM;

                                    lp : Win32.LPARAM)

                                   return Win32.UINT;     --  windowsx.h:1172





   function GET_WM_MENUSELECT_HMENU (wp : Win32.WPARAM;

                                    lp : Win32.LPARAM)

                                   return Win32.Windef.HMENU;

   --  windowsx.h:1173



   function GET_WM_MENUSELECT_MPS (cmd : Win32.WORD;

                                  f : Win32.UINT;

                                  hmenu : Win32.Windef.HMENU)

                                 return Win32.LONG;       --  windowsx.h:1174



   function GET_WM_MDIACTIVATE_FACTIVATE (hwnd : Win32.Windef.HWND;

                                         wp : Win32.WPARAM;

                                         lp : Win32.LPARAM)

                                        return Win32.BOOL;

   --  windowsx.h:1178



   function GET_WM_MDIACTIVATE_HWNDDEACT (wp : Win32.WPARAM;

                                         lp : Win32.LPARAM)

                                        return Win32.Windef.HWND;

   --  windowsx.h:1179

   function GET_WM_MDIACTIVATE_HWNDACTIVATE (wp : Win32.WPARAM;

                                            lp : Win32.LPARAM)

                                           return Win32.Windef.HWND;

   --  windowsx.h:1180





   function GET_WM_MDIACTIVATE_MPS (f : Win32.BOOL;

                                   hwndD : Win32.Windef.HWND;

                                   hwndA : Win32.Windef.HWND)

                                  return Win32.LONG;

   --  windowsx.h:1181



   function GET_WM_MDISETMENU_MPS (hmenuF : Win32.Windef.HMENU;

                                  hmenuW : Win32.Windef.HMENU)

                                 return Win32.LONG;       --  windowsx.h:1185



   function GET_WM_MENUCHAR_CHAR (wp : Win32.WPARAM;

                                 lp : Win32.LPARAM)

                                return Win32.TCHAR;

   --  windowsx.h:1187



   function GET_WM_MENUCHAR_HMENU (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM)

                                 return Win32.Windef.HMENU;

   --  windowsx.h:1188



   function GET_WM_MENUCHAR_FMENU (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM) return Win32.BOOL;

   --  windowsx.h:1189

   function GET_WM_MENUCHAR_MPS (ch : Win32.TCHAR;

                                hmenu : Win32.Windef.HMENU;

                                f : Win32.BOOL)

                               return Win32.LONG;           --  windowsx.h:1190



   function GET_WM_PARENTNOTIFY_MSG (wp : Win32.WPARAM;

                                    lp : Win32.LPARAM)

                                   return Win32.WORD;     --  windowsx.h:1193



   function GET_WM_PARENTNOTIFY_ID (wp : Win32.WPARAM;

                                   lp : Win32.LPARAM)

                                  return Win32.WORD;      --  windowsx.h:1194



   function GET_WM_PARENTNOTIFY_HWNDCHILD (wp : Win32.WPARAM;

                                          lp : Win32.LPARAM)

                                         return Win32.Windef.HWND;

   --  windowsx.h:1195



   function GET_WM_PARENTNOTIFY_X (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM)

                                 return Win32.INT;       --  windowsx.h:1196



   function GET_WM_PARENTNOTIFY_Y (wp : Win32.WPARAM;

                                  lp : Win32.LPARAM)

                                 return Win32.INT;       --  windowsx.h:1197



   function GET_WM_PARENTNOTIFY_MPS (msg : Win32.WORD;

                                    id : Win32.WORD;

                                    hwnd : Win32.Windef.HWND)

                                   return Win32.LONG;     --  windowsx.h:1198



   function GET_WM_PARENTNOTIFY2_MPS (msg : Win32.WORD;

                                     x : Win32.INT;

                                     y : Win32.INT)

                                    return Win32.DWORD;

   --  windowsx.h:1200



   function GET_WM_VKEYTOITEM_CODE (wp : Win32.WPARAM;

                                   lp : Win32.LPARAM)

                                  return Win32.INT;

   --  windowsx.h:1203



   function GET_WM_VKEYTOITEM_ITEM (wp : Win32.WPARAM;

                                   lp : Win32.LPARAM)

                                  return Win32.WORD;

   --  windowsx.h:1204



   function GET_WM_VKEYTOITEM_HWND (wp : Win32.WPARAM;

                                   lp : Win32.LPARAM)

                                  return Win32.Windef.HWND;

   --  windowsx.h:1205



   function GET_WM_VKEYTOITEM_MPS (code : Win32.INT;

                                  item : Win32.WORD;

                                  hwnd : Win32.Windef.HWND)

                                 return Win32.LONG;

   --  windowsx.h:1206



   function GET_EM_SETSEL_START (wp : Win32.WPARAM;

                                lp : Win32.LPARAM)

                               return Win32.INT;          --  windowsx.h:1209



   function GET_EM_SETSEL_END (wp : Win32.WPARAM;

                              lp : Win32.LPARAM)

                             return Win32.LPARAM;       --  windowsx.h:1210



   function GET_EM_SETSEL_MPS (iStart : Win32.UINT;

                              iEnd : Win32.UINT)

                             return Win32.LONG;           --  windowsx.h:1211



   function GET_EM_LINESCROLL_MPS (vert : Win32.UINT;

                                  horz : Win32.UINT)

                                 return Win32.LONG;       --  windowsx.h:1214



   function GET_WM_CHANGECBCHAIN_HWNDNEXT (wp : Win32.WPARAM;

                                          lp : Win32.LPARAM)

                                         return Win32.Windef.HWND;

   --  windowsx.h:1217

   function GET_WM_HSCROLL_CODE (wp : Win32.WPARAM;

                                lp : Win32.LPARAM)

                               return Win32.WORD;         --  windowsx.h:1219



   function GET_WM_HSCROLL_POS (wp : Win32.WPARAM;

                               lp : Win32.LPARAM)

                              return Win32.WORD;          --  windowsx.h:1220



   function GET_WM_HSCROLL_HWND (wp : Win32.WPARAM;

                                lp : Win32.LPARAM)

                               return Win32.Windef.HWND;  --  windowsx.h:1221



   function GET_WM_HSCROLL_MPS (code : Win32.WORD;

                               pos : Win32.WORD;

                               hwnd : Win32.Windef.HWND)

                              return Win32.LONG;          --  windowsx.h:1222



   function GET_WM_VSCROLL_CODE (wp : Win32.WPARAM;

                                lp : Win32.LPARAM)

                               return Win32.WORD;         --  windowsx.h:1225



   function GET_WM_VSCROLL_POS (wp : Win32.WPARAM;

                               lp : Win32.LPARAM)

                              return Win32.WORD;          --  windowsx.h:1226



   function GET_WM_VSCROLL_HWND (wp : Win32.WPARAM;

                                lp : Win32.LPARAM)

                               return Win32.Windef.HWND;  --  windowsx.h:1227



   function GET_WM_VSCROLL_MPS (code : Win32.WORD;

                               pos : Win32.WORD;

                               hwnd : Win32.Windef.HWND)

                              return Win32.LONG;          --  windowsx.h:1228





   --  function ncalloc(num : Win32.size_t;

   --  size: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Malloc.calloc;     -- windowsx.h:1233



   --  function nexpand(memblock: Win32.PVOID;

   --  size    : Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Malloc.expand; -- windowsx.h:1234



   --  procedure ffree(memblock: Win32.PVOID)

   --  renames Win32.Malloc.free;    -- windowsx.h:1235



   --  function fmalloc(size: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Malloc.malloc;                        -- windowsx.h:1236



   --  function fmemccpy(dest : Win32.PVOID;

   --  src  : Win32.PCVOID;

   --  ch   : Win32.INT;

   --  count: Win32.UINT)

   --  return Win32.PVOID

   --  renames Win32.Strings.memccpy; -- windowsx.h:1237



   --  function fmemchr(buf  : Win32.PCVOID;

   --  ch   : Win32.INT;

   --  count: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Strings.memchr;   -- windowsx.h:1238



   --  function fmemcmp(buf1 : Win32.PCVOID;

   --  buf2 : Win32.PCVOID;

   --  count: Win32.size_t)

   --  return Win32.INT

   --  renames Win32.Strings.memcmp;   -- windowsx.h:1239



   --  function fmemcpy(dest : Win32.PVOID;

   --  src  : Win32.PCVOID;

   --  count: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Strings.memcpy;       -- windowsx.h:1240



   --  function fmemicmp(buf1 : Win32.PCVOID;

   --  buf2 : Win32.PCVOID;

   --  count: Win32.UINT)

   --  return Win32.INT

   --  renames Win32.Strings.memicmp;     -- windowsx.h:1241





   --  function fmemmove(dest : Win32.PVOID;

   --  src  : Win32.PCVOID;

   --  count: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Strings.memmove;     -- windowsx.h:1242



   --  function fmemset(dest : Win32.PVOID;

   --  c    : Win32.INT;

   --  count: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Strings.memset;      -- windowsx.h:1243



   --  function fmsize(memblock: Win32.PVOID)

   --  return Win32.size_t

   --  renames Win32.Malloc.msize;         -- windowsx.h:1244



   --  function frealloc(memblock: Win32.PVOID;

   --  size    : Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Malloc.realloc;-- windowsx.h:1245



   --  function fstrcat(string1: Win32.PSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.PSTR

   --  renames Win32.Strings.strcat;   -- windowsx.h:1246



   --  function fstrchr(string1: Win32.PCSTR;

   --  c      : Win32.INT)

   --  return Win32.PSTR

   --  renames Win32.Strings.strchr;       -- windowsx.h:1247



   --  function fstrcmp(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.INT

   --  renames Win32.Strings.strcmp;       -- windowsx.h:1248



   --  function fstrcpy(string1: Win32.PSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.PSTR

   --  renames Win32.Strings.strcpy;      -- windowsx.h:1249



   --  function fstrcspn(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.size_t

   --  renames Win32.Strings.strcspn;     -- windowsx.h:1250



   --  function fstrdup(string1: Win32.PCSTR) return Win32.PSTR

   --  renames Win32.Strings.strdup;      -- windowsx.h:1251



   --  function fstricmp(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.INT

   --  renames Win32.Strings.stricmp;     -- windowsx.h:1252



   --  function fstrlen(string1: Win32.PCSTR) return Win32.size_t

   --  renames Win32.Strings.strlen;      -- windowsx.h:1253



   --  function fstrlwr(string1: Win32.PSTR) return Win32.PSTR

   --  renames Win32.Strings.strlwr;      -- windowsx.h:1254



   --  function fstrncat(string1: Win32.PSTR;

   --  string2: Win32.PCSTR;

   --  count  : Win32.size_t)

   --  return Win32.PSTR

   --  renames Win32.Strings.strncat;     -- windowsx.h:1255



   --  function fstrncmp(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR;

   --  count  : Win32.size_t)

   --  return Win32.INT

   --  renames Win32.Strings.strncmp;     -- windowsx.h:1256



   --  function fstrncpy(string1: Win32.PSTR;

   --  string2: Win32.PCSTR;

   --  count  : Win32.size_t)

   --  return Win32.PSTR

   --  renames Win32.Strings.strncpy;     -- windowsx.h:1257

   --

   --  function fstrnicmp(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR;

   --  count  : Win32.size_t)

   --  return Win32.INT

   --  renames Win32.Strings.strnicmp;   -- windowsx.h:1258



   --  function fstrnset(string1: Win32.PSTR;

   --  c      : Win32.INT;

   --  count  : Win32.size_t)

   --  return Win32.PSTR

   --  renames Win32.Strings.strnset;     -- windowsx.h:1259

   --

   --  function fstrpbrk(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.PSTR

   --  renames Win32.Strings.strpbrk;     -- windowsx.h:1260



   --  function fstrrchr(string1: Win32.PCSTR;

   --  c      : Win32.INT)

   --  return Win32.PSTR

   --  renames Win32.Strings.strrchr;     -- windowsx.h:1261



   --  function fstrrev(string1: Win32.PSTR) return Win32.PSTR

   --  renames Win32.Strings.strrev;      -- windowsx.h:1262



   --  function fstrset(string1: Win32.PSTR;

   --  c      : Win32.INT)

   --  return Win32.PSTR

   --  renames Win32.Strings.strset;      -- windowsx.h:1263



   --  function fstrspn(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.size_t

   --  renames Win32.Strings.strspn;       -- windowsx.h:1264



   --  function fstrstr(string1: Win32.PCSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.PSTR

   --  renames Win32.Strings.strstr;      -- windowsx.h:1265



   --  function fstrtok(string1: Win32.PSTR;

   --  string2: Win32.PCSTR)

   --  return Win32.PSTR

   --  renames Win32.Strings.strtok;      -- windowsx.h:1266



   --  function fstrupr(string1: Win32.PSTR) return Win32.PSTR

   --  renames Win32.Strings.strupr;      -- windowsx.h:1267



   --  procedure nfree(memblock: Win32.PVOID)

   --  renames Win32.Malloc.free;    -- windowsx.h:1268



   --  function nmalloc(size: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Malloc.malloc;                        -- windowsx.h:1269



   --  function nmsize(memblock: Win32.PVOID)

   --  return Win32.size_t

   --  renames Win32.Malloc.msize;        -- windowsx.h:1270



   --  function nrealloc(memblock: Win32.PVOID;

   --  size    : Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Malloc.realloc;-- windowsx.h:1271



   --  function nstrdup(string1: Win32.PCSTR) return Win32.PSTR

   --  renames Win32.Strings.strdup;      -- windowsx.h:1272



   --  function hmemcpy(dest : Win32.PVOID;

   --  src  : Win32.PCVOID;

   --  count: Win32.size_t)

   --  return Win32.PVOID

   --  renames Win32.Strings.memcpy;       -- windowsx.h:1273



end Win32.Windowsx;





