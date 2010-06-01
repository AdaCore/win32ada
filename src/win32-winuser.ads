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
with Stdarg;
with Win32.Winbase;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;
with System.Storage_Elements;  use System.Storage_Elements;

package Win32.Winuser is

   WINVER : constant := 16#30a#;

   function MAKEINTRESOURCEA (wInteger : WORD) return LPSTR;

   function MAKEINTRESOURCEW (wInteger : WORD) return LPWSTR;

   function MAKEINTRESOURCE (wInteger : WORD) return LPSTR renames
     MAKEINTRESOURCEA;

   RT_CURSOR                  : constant LPSTR;
   RT_BITMAP                  : constant LPSTR;
   RT_ICON                    : constant LPSTR;
   RT_MENU                    : constant LPSTR;
   RT_DIALOG                  : constant LPSTR;
   RT_STRING                  : constant LPSTR;
   RT_FONTDIR                 : constant LPSTR;
   RT_FONT                    : constant LPSTR;
   RT_ACCELERATOR             : constant LPSTR;
   RT_RCDATA                  : constant LPSTR;
   RT_MESSAGETABLE            : constant LPSTR;
   RT_GROUP_CURSOR            : constant LPSTR;
   RT_GROUP_ICON              : constant LPSTR;
   RT_VERSION                 : constant LPSTR;
   RT_DLGINCLUDE              : constant LPSTR;
   SB_HORZ                    : constant := 0;
   SB_VERT                    : constant := 1;
   SB_CTL                     : constant := 2;
   SB_BOTH                    : constant := 3;
   SB_LINEUP                  : constant := 0;
   SB_LINELEFT                : constant := 0;
   SB_LINEDOWN                : constant := 1;
   SB_LINERIGHT               : constant := 1;
   SB_PAGEUP                  : constant := 2;
   SB_PAGELEFT                : constant := 2;
   SB_PAGEDOWN                : constant := 3;
   SB_PAGERIGHT               : constant := 3;
   SB_THUMBPOSITION           : constant := 4;
   SB_THUMBTRACK              : constant := 5;
   SB_TOP                     : constant := 6;
   SB_LEFT                    : constant := 6;
   SB_BOTTOM                  : constant := 7;
   SB_RIGHT                   : constant := 7;
   SB_ENDSCROLL               : constant := 8;
   SW_HIDE                    : constant := 0;
   SW_SHOWNORMAL              : constant := 1;
   SW_NORMAL                  : constant := 1;
   SW_SHOWMINIMIZED           : constant := 2;
   SW_SHOWMAXIMIZED           : constant := 3;
   SW_MAXIMIZE                : constant := 3;
   SW_SHOWNOACTIVATE          : constant := 4;
   SW_SHOW                    : constant := 5;
   SW_MINIMIZE                : constant := 6;
   SW_SHOWMINNOACTIVE         : constant := 7;
   SW_SHOWNA                  : constant := 8;
   SW_RESTORE                 : constant := 9;
   SW_SHOWDEFAULT             : constant := 10;
   SW_MAX                     : constant := 10;
   HIDE_WINDOW                : constant := 0;
   SHOW_OPENWINDOW            : constant := 1;
   SHOW_ICONWINDOW            : constant := 2;
   SHOW_FULLSCREEN            : constant := 3;
   SHOW_OPENNOACTIVATE        : constant := 4;
   SW_PARENTCLOSING           : constant := 1;
   SW_OTHERZOOM               : constant := 2;
   SW_PARENTOPENING           : constant := 3;
   SW_OTHERUNZOOM             : constant := 4;
   KF_EXTENDED                : constant := 16#100#;
   KF_DLGMODE                 : constant := 16#800#;
   KF_MENUMODE                : constant := 16#1000#;
   KF_ALTDOWN                 : constant := 16#2000#;
   KF_REPEAT                  : constant := 16#4000#;
   KF_UP                      : constant := 16#8000#;
   VK_LBUTTON                 : constant := 16#1#;
   VK_RBUTTON                 : constant := 16#2#;
   VK_CANCEL                  : constant := 16#3#;
   VK_MBUTTON                 : constant := 16#4#;
   VK_BACK                    : constant := 16#8#;
   VK_TAB                     : constant := 16#9#;
   VK_CLEAR                   : constant := 16#c#;
   VK_RETURN                  : constant := 16#d#;
   VK_SHIFT                   : constant := 16#10#;
   VK_CONTROL                 : constant := 16#11#;
   VK_MENU                    : constant := 16#12#;
   VK_PAUSE                   : constant := 16#13#;
   VK_CAPITAL                 : constant := 16#14#;
   VK_ESCAPE                  : constant := 16#1b#;
   VK_SPACE                   : constant := 16#20#;
   VK_PRIOR                   : constant := 16#21#;
   VK_NEXT                    : constant := 16#22#;
   VK_END                     : constant := 16#23#;
   VK_HOME                    : constant := 16#24#;
   VK_LEFT                    : constant := 16#25#;
   VK_UP                      : constant := 16#26#;
   VK_RIGHT                   : constant := 16#27#;
   VK_DOWN                    : constant := 16#28#;
   VK_SELECT                  : constant := 16#29#;
   VK_PRINT                   : constant := 16#2a#;
   VK_EXECUTE                 : constant := 16#2b#;
   VK_SNAPSHOT                : constant := 16#2c#;
   VK_INSERT                  : constant := 16#2d#;
   VK_DELETE                  : constant := 16#2e#;
   VK_HELP                    : constant := 16#2f#;
   VK_LWIN                    : constant := 16#5b#;
   VK_RWIN                    : constant := 16#5c#;
   VK_APPS                    : constant := 16#5d#;
   VK_NUMPAD0                 : constant := 16#60#;
   VK_NUMPAD1                 : constant := 16#61#;
   VK_NUMPAD2                 : constant := 16#62#;
   VK_NUMPAD3                 : constant := 16#63#;
   VK_NUMPAD4                 : constant := 16#64#;
   VK_NUMPAD5                 : constant := 16#65#;
   VK_NUMPAD6                 : constant := 16#66#;
   VK_NUMPAD7                 : constant := 16#67#;
   VK_NUMPAD8                 : constant := 16#68#;
   VK_NUMPAD9                 : constant := 16#69#;
   VK_MULTIPLY                : constant := 16#6a#;
   VK_ADD                     : constant := 16#6b#;
   VK_SEPARATOR               : constant := 16#6c#;
   VK_SUBTRACT                : constant := 16#6d#;
   VK_DECIMAL                 : constant := 16#6e#;
   VK_DIVIDE                  : constant := 16#6f#;
   VK_F1                      : constant := 16#70#;
   VK_F2                      : constant := 16#71#;
   VK_F3                      : constant := 16#72#;
   VK_F4                      : constant := 16#73#;
   VK_F5                      : constant := 16#74#;
   VK_F6                      : constant := 16#75#;
   VK_F7                      : constant := 16#76#;
   VK_F8                      : constant := 16#77#;
   VK_F9                      : constant := 16#78#;
   VK_F10                     : constant := 16#79#;
   VK_F11                     : constant := 16#7a#;
   VK_F12                     : constant := 16#7b#;
   VK_F13                     : constant := 16#7c#;
   VK_F14                     : constant := 16#7d#;
   VK_F15                     : constant := 16#7e#;
   VK_F16                     : constant := 16#7f#;
   VK_F17                     : constant := 16#80#;
   VK_F18                     : constant := 16#81#;
   VK_F19                     : constant := 16#82#;
   VK_F20                     : constant := 16#83#;
   VK_F21                     : constant := 16#84#;
   VK_F22                     : constant := 16#85#;
   VK_F23                     : constant := 16#86#;
   VK_F24                     : constant := 16#87#;
   VK_NUMLOCK                 : constant := 16#90#;
   VK_SCROLL                  : constant := 16#91#;
   VK_LSHIFT                  : constant := 16#a0#;
   VK_RSHIFT                  : constant := 16#a1#;
   VK_LCONTROL                : constant := 16#a2#;
   VK_RCONTROL                : constant := 16#a3#;
   VK_LMENU                   : constant := 16#a4#;
   VK_RMENU                   : constant := 16#a5#;
   VK_ATTN                    : constant := 16#f6#;
   VK_CRSEL                   : constant := 16#f7#;
   VK_EXSEL                   : constant := 16#f8#;
   VK_EREOF                   : constant := 16#f9#;
   VK_PLAY                    : constant := 16#fa#;
   VK_ZOOM                    : constant := 16#fb#;
   VK_NONAME                  : constant := 16#fc#;
   VK_PA1                     : constant := 16#fd#;
   VK_OEM_CLEAR               : constant := 16#fe#;
   WH_MIN                     : constant := -1;
   WH_MSGFILTER               : constant := -1;
   WH_JOURNALRECORD           : constant := 0;
   WH_JOURNALPLAYBACK         : constant := 1;
   WH_KEYBOARD                : constant := 2;
   WH_GETMESSAGE              : constant := 3;
   WH_CALLWNDPROC             : constant := 4;
   WH_CBT                     : constant := 5;
   WH_SYSMSGFILTER            : constant := 6;
   WH_MOUSE                   : constant := 7;
   WH_HARDWARE                : constant := 8;
   WH_DEBUG                   : constant := 9;
   WH_SHELL                   : constant := 10;
   WH_FOREGROUNDIDLE          : constant := 11;
   WH_MAX                     : constant := 11;
   HC_ACTION                  : constant := 0;
   HC_GETNEXT                 : constant := 1;
   HC_SKIP                    : constant := 2;
   HC_NOREMOVE                : constant := 3;
   HC_NOREM                   : constant := 3;
   HC_SYSMODALON              : constant := 4;
   HC_SYSMODALOFF             : constant := 5;
   HCBT_MOVESIZE              : constant := 0;
   HCBT_MINMAX                : constant := 1;
   HCBT_QS                    : constant := 2;
   HCBT_CREATEWND             : constant := 3;
   HCBT_DESTROYWND            : constant := 4;
   HCBT_ACTIVATE              : constant := 5;
   HCBT_CLICKSKIPPED          : constant := 6;
   HCBT_KEYSKIPPED            : constant := 7;
   HCBT_SYSCOMMAND            : constant := 8;
   HCBT_SETFOCUS              : constant := 9;
   MSGF_DIALOGBOX             : constant := 0;
   MSGF_MESSAGEBOX            : constant := 1;
   MSGF_MENU                  : constant := 2;
   MSGF_MOVE                  : constant := 3;
   MSGF_SIZE                  : constant := 4;
   MSGF_SCROLLBAR             : constant := 5;
   MSGF_NEXTWINDOW            : constant := 6;
   MSGF_MAINLOOP              : constant := 8;
   MSGF_MAX                   : constant := 8;
   MSGF_USER                  : constant := 4096;
   HSHELL_WINDOWCREATED       : constant := 1;
   HSHELL_WINDOWDESTROYED     : constant := 2;
   HSHELL_ACTIVATESHELLWINDOW : constant := 3;
   HKL_PREV                   : constant := 0;
   HKL_NEXT                   : constant := 1;
   KLF_ACTIVATE               : constant := 16#1#;
   KLF_SUBSTITUTE_OK          : constant := 16#2#;
   KLF_UNLOADPREVIOUS         : constant := 16#4#;
   KLF_REORDER                : constant := 16#8#;
   KL_NAMELENGTH              : constant := 9;
   DESKTOP_READOBJECTS        : constant := 16#1#;
   DESKTOP_CREATEWINDOW       : constant := 16#2#;
   DESKTOP_CREATEMENU         : constant := 16#4#;
   DESKTOP_HOOKCONTROL        : constant := 16#8#;
   DESKTOP_JOURNALRECORD      : constant := 16#10#;
   DESKTOP_JOURNALPLAYBACK    : constant := 16#20#;
   DESKTOP_ENUMERATE          : constant := 16#40#;
   DESKTOP_WRITEOBJECTS       : constant := 16#80#;
   WINSTA_ENUMDESKTOPS        : constant := 16#1#;
   WINSTA_READATTRIBUTES      : constant := 16#2#;
   WINSTA_ACCESSCLIPBOARD     : constant := 16#4#;
   WINSTA_CREATEDESKTOP       : constant := 16#8#;
   WINSTA_WRITEATTRIBUTES     : constant := 16#10#;
   WINSTA_ACCESSGLOBALATOMS   : constant := 16#20#;
   WINSTA_EXITWINDOWS         : constant := 16#40#;
   WINSTA_ENUMERATE           : constant := 16#100#;
   WINSTA_READSCREEN          : constant := 16#200#;
   GWL_WNDPROC                : constant := -4;
   GWL_HINSTANCE              : constant := -6;
   GWL_HWNDPARENT             : constant := -8;
   GWL_STYLE                  : constant := -16;
   GWL_EXSTYLE                : constant := -20;
   GWL_USERDATA               : constant := -21;
   GWL_ID                     : constant := -12;
   GCL_MENUNAME               : constant := -8;
   GCL_HBRBACKGROUND          : constant := -10;
   GCL_HCURSOR                : constant := -12;
   GCL_HICON                  : constant := -14;
   GCL_HMODULE                : constant := -16;
   GCL_CBWNDEXTRA             : constant := -18;
   GCL_CBCLSEXTRA             : constant := -20;
   GCL_WNDPROC                : constant := -24;
   GCL_STYLE                  : constant := -26;
   GCW_ATOM                   : constant := -32;
   WM_NULL                    : constant := 16#0#;
   WM_CREATE                  : constant := 16#1#;
   WM_DESTROY                 : constant := 16#2#;
   WM_MOVE                    : constant := 16#3#;
   WM_SIZE                    : constant := 16#5#;
   WM_ACTIVATE                : constant := 16#6#;
   WA_INACTIVE                : constant := 0;
   WA_ACTIVE                  : constant := 1;
   WA_CLICKACTIVE             : constant := 2;
   WM_SETFOCUS                : constant := 16#7#;
   WM_KILLFOCUS               : constant := 16#8#;
   WM_ENABLE                  : constant := 16#a#;
   WM_SETREDRAW               : constant := 16#b#;
   WM_SETTEXT                 : constant := 16#c#;
   WM_GETTEXT                 : constant := 16#d#;
   WM_GETTEXTLENGTH           : constant := 16#e#;
   WM_PAINT                   : constant := 16#f#;
   WM_CLOSE                   : constant := 16#10#;
   WM_QUERYENDSESSION         : constant := 16#11#;
   WM_QUIT                    : constant := 16#12#;
   WM_QUERYOPEN               : constant := 16#13#;
   WM_ERASEBKGND              : constant := 16#14#;
   WM_SYSCOLORCHANGE          : constant := 16#15#;
   WM_ENDSESSION              : constant := 16#16#;
   WM_SHOWWINDOW              : constant := 16#18#;
   WM_WININICHANGE            : constant := 16#1a#;
   WM_DEVMODECHANGE           : constant := 16#1b#;
   WM_ACTIVATEAPP             : constant := 16#1c#;
   WM_FONTCHANGE              : constant := 16#1d#;
   WM_TIMECHANGE              : constant := 16#1e#;
   WM_CANCELMODE              : constant := 16#1f#;
   WM_SETCURSOR               : constant := 16#20#;
   WM_MOUSEACTIVATE           : constant := 16#21#;
   WM_CHILDACTIVATE           : constant := 16#22#;
   WM_QUEUESYNC               : constant := 16#23#;
   WM_GETMINMAXINFO           : constant := 16#24#;
   WM_PAINTICON               : constant := 16#26#;
   WM_ICONERASEBKGND          : constant := 16#27#;
   WM_NEXTDLGCTL              : constant := 16#28#;
   WM_SPOOLERSTATUS           : constant := 16#2a#;
   WM_DRAWITEM                : constant := 16#2b#;
   WM_MEASUREITEM             : constant := 16#2c#;
   WM_DELETEITEM              : constant := 16#2d#;
   WM_VKEYTOITEM              : constant := 16#2e#;
   WM_CHARTOITEM              : constant := 16#2f#;
   WM_SETFONT                 : constant := 16#30#;
   WM_GETFONT                 : constant := 16#31#;
   WM_SETHOTKEY               : constant := 16#32#;
   WM_GETHOTKEY               : constant := 16#33#;
   WM_QUERYDRAGICON           : constant := 16#37#;
   WM_COMPAREITEM             : constant := 16#39#;
   WM_COMPACTING              : constant := 16#41#;
   WM_COMMNOTIFY              : constant := 16#44#;
   WM_WINDOWPOSCHANGING       : constant := 16#46#;
   WM_WINDOWPOSCHANGED        : constant := 16#47#;
   WM_POWER                   : constant := 16#48#;
   PWR_OK                     : constant := 1;
   PWR_FAIL                   : constant := -1;
   PWR_SUSPENDREQUEST         : constant := 1;
   PWR_SUSPENDRESUME          : constant := 2;
   PWR_CRITICALRESUME         : constant := 3;
   WM_COPYDATA                : constant := 16#4a#;
   WM_CANCELJOURNAL           : constant := 16#4b#;
   WM_NCCREATE                : constant := 16#81#;
   WM_NCDESTROY               : constant := 16#82#;
   WM_NCCALCSIZE              : constant := 16#83#;
   WM_NCHITTEST               : constant := 16#84#;
   WM_NCPAINT                 : constant := 16#85#;
   WM_NCACTIVATE              : constant := 16#86#;
   WM_GETDLGCODE              : constant := 16#87#;
   WM_NCMOUSEMOVE             : constant := 16#a0#;
   WM_NCLBUTTONDOWN           : constant := 16#a1#;
   WM_NCLBUTTONUP             : constant := 16#a2#;
   WM_NCLBUTTONDBLCLK         : constant := 16#a3#;
   WM_NCRBUTTONDOWN           : constant := 16#a4#;
   WM_NCRBUTTONUP             : constant := 16#a5#;
   WM_NCRBUTTONDBLCLK         : constant := 16#a6#;
   WM_NCMBUTTONDOWN           : constant := 16#a7#;
   WM_NCMBUTTONUP             : constant := 16#a8#;
   WM_NCMBUTTONDBLCLK         : constant := 16#a9#;
   WM_KEYFIRST                : constant := 16#100#;
   WM_KEYDOWN                 : constant := 16#100#;
   WM_KEYUP                   : constant := 16#101#;
   WM_CHAR                    : constant := 16#102#;
   WM_DEADCHAR                : constant := 16#103#;
   WM_SYSKEYDOWN              : constant := 16#104#;
   WM_SYSKEYUP                : constant := 16#105#;
   WM_SYSCHAR                 : constant := 16#106#;
   WM_SYSDEADCHAR             : constant := 16#107#;
   WM_KEYLAST                 : constant := 16#108#;
   WM_INITDIALOG              : constant := 16#110#;
   WM_COMMAND                 : constant := 16#111#;
   WM_SYSCOMMAND              : constant := 16#112#;
   WM_TIMER                   : constant := 16#113#;
   WM_HSCROLL                 : constant := 16#114#;
   WM_VSCROLL                 : constant := 16#115#;
   WM_INITMENU                : constant := 16#116#;
   WM_INITMENUPOPUP           : constant := 16#117#;
   WM_MENUSELECT              : constant := 16#11f#;
   WM_MENUCHAR                : constant := 16#120#;
   WM_ENTERIDLE               : constant := 16#121#;
   WM_CTLCOLORMSGBOX          : constant := 16#132#;
   WM_CTLCOLOREDIT            : constant := 16#133#;
   WM_CTLCOLORLISTBOX         : constant := 16#134#;
   WM_CTLCOLORBTN             : constant := 16#135#;
   WM_CTLCOLORDLG             : constant := 16#136#;
   WM_CTLCOLORSCROLLBAR       : constant := 16#137#;
   WM_CTLCOLORSTATIC          : constant := 16#138#;
   WM_MOUSEFIRST              : constant := 16#200#;
   WM_MOUSEMOVE               : constant := 16#200#;
   WM_LBUTTONDOWN             : constant := 16#201#;
   WM_LBUTTONUP               : constant := 16#202#;
   WM_LBUTTONDBLCLK           : constant := 16#203#;
   WM_RBUTTONDOWN             : constant := 16#204#;
   WM_RBUTTONUP               : constant := 16#205#;
   WM_RBUTTONDBLCLK           : constant := 16#206#;
   WM_MBUTTONDOWN             : constant := 16#207#;
   WM_MBUTTONUP               : constant := 16#208#;
   WM_MBUTTONDBLCLK           : constant := 16#209#;
   WM_MOUSELAST               : constant := 16#209#;
   WM_PARENTNOTIFY            : constant := 16#210#;
   WM_ENTERMENULOOP           : constant := 16#211#;
   WM_EXITMENULOOP            : constant := 16#212#;
   WM_MDICREATE               : constant := 16#220#;
   WM_MDIDESTROY              : constant := 16#221#;
   WM_MDIACTIVATE             : constant := 16#222#;
   WM_MDIRESTORE              : constant := 16#223#;
   WM_MDINEXT                 : constant := 16#224#;
   WM_MDIMAXIMIZE             : constant := 16#225#;
   WM_MDITILE                 : constant := 16#226#;
   WM_MDICASCADE              : constant := 16#227#;
   WM_MDIICONARRANGE          : constant := 16#228#;
   WM_MDIGETACTIVE            : constant := 16#229#;
   WM_MDISETMENU              : constant := 16#230#;
   WM_DROPFILES               : constant := 16#233#;
   WM_MDIREFRESHMENU          : constant := 16#234#;
   WM_CUT                     : constant := 16#300#;
   WM_COPY                    : constant := 16#301#;
   WM_PASTE                   : constant := 16#302#;
   WM_CLEAR                   : constant := 16#303#;
   WM_UNDO                    : constant := 16#304#;
   WM_RENDERFORMAT            : constant := 16#305#;
   WM_RENDERALLFORMATS        : constant := 16#306#;
   WM_DESTROYCLIPBOARD        : constant := 16#307#;
   WM_DRAWCLIPBOARD           : constant := 16#308#;
   WM_PAINTCLIPBOARD          : constant := 16#309#;
   WM_VSCROLLCLIPBOARD        : constant := 16#30a#;
   WM_SIZECLIPBOARD           : constant := 16#30b#;
   WM_ASKCBFORMATNAME         : constant := 16#30c#;
   WM_CHANGECBCHAIN           : constant := 16#30d#;
   WM_HSCROLLCLIPBOARD        : constant := 16#30e#;
   WM_QUERYNEWPALETTE         : constant := 16#30f#;
   WM_PALETTEISCHANGING       : constant := 16#310#;
   WM_PALETTECHANGED          : constant := 16#311#;
   WM_HOTKEY                  : constant := 16#312#;
   WM_PENWINFIRST             : constant := 16#380#;
   WM_PENWINLAST              : constant := 16#38f#;
   WM_USER                    : constant := 16#400#;
   ST_BEGINSWP                : constant := 0;
   ST_ENDSWP                  : constant := 1;
   HTERROR                    : constant := -2;
   HTTRANSPARENT              : constant := -1;
   HTNOWHERE                  : constant := 0;
   HTCLIENT                   : constant := 1;
   HTCAPTION                  : constant := 2;
   HTSYSMENU                  : constant := 3;
   HTGROWBOX                  : constant := 4;
   HTSIZE                     : constant := 4;
   HTMENU                     : constant := 5;
   HTHSCROLL                  : constant := 6;
   HTVSCROLL                  : constant := 7;
   HTMINBUTTON                : constant := 8;
   HTMAXBUTTON                : constant := 9;
   HTLEFT                     : constant := 10;
   HTRIGHT                    : constant := 11;
   HTTOP                      : constant := 12;
   HTTOPLEFT                  : constant := 13;
   HTTOPRIGHT                 : constant := 14;
   HTBOTTOM                   : constant := 15;
   HTBOTTOMLEFT               : constant := 16;
   HTBOTTOMRIGHT              : constant := 17;
   HTBORDER                   : constant := 18;
   HTREDUCE                   : constant := 8;
   HTZOOM                     : constant := 9;
   HTSIZEFIRST                : constant := 10;
   HTSIZELAST                 : constant := 17;
   SMTO_NORMAL                : constant := 16#0#;
   SMTO_BLOCK                 : constant := 16#1#;
   SMTO_ABORTIFHUNG           : constant := 16#2#;
   MA_ACTIVATE                : constant := 1;
   MA_ACTIVATEANDEAT          : constant := 2;
   MA_NOACTIVATE              : constant := 3;
   MA_NOACTIVATEANDEAT        : constant := 4;
   SIZE_RESTORED              : constant := 0;
   SIZE_MINIMIZED             : constant := 1;
   SIZE_MAXIMIZED             : constant := 2;
   SIZE_MAXSHOW               : constant := 3;
   SIZE_MAXHIDE               : constant := 4;
   SIZENORMAL                 : constant := 0;
   SIZEICONIC                 : constant := 1;
   SIZEFULLSCREEN             : constant := 2;
   SIZEZOOMSHOW               : constant := 3;
   SIZEZOOMHIDE               : constant := 4;
   WVR_ALIGNTOP               : constant := 16#10#;
   WVR_ALIGNLEFT              : constant := 16#20#;
   WVR_ALIGNBOTTOM            : constant := 16#40#;
   WVR_ALIGNRIGHT             : constant := 16#80#;
   WVR_HREDRAW                : constant := 16#100#;
   WVR_VREDRAW                : constant := 16#200#;
   WVR_REDRAW                 : constant := 16#300#;
   WVR_VALIDRECTS             : constant := 16#400#;
   MK_LBUTTON                 : constant := 16#1#;
   MK_RBUTTON                 : constant := 16#2#;
   MK_SHIFT                   : constant := 16#4#;
   MK_CONTROL                 : constant := 16#8#;
   MK_MBUTTON                 : constant := 16#10#;
   WS_OVERLAPPED              : constant := 16#0#;
   WS_POPUP                   : constant := 16#80000000#;
   WS_CHILD                   : constant := 16#40000000#;
   WS_MINIMIZE                : constant := 16#20000000#;
   WS_VISIBLE                 : constant := 16#10000000#;
   WS_DISABLED                : constant := 16#8000000#;
   WS_CLIPSIBLINGS            : constant := 16#4000000#;
   WS_CLIPCHILDREN            : constant := 16#2000000#;
   WS_MAXIMIZE                : constant := 16#1000000#;
   WS_CAPTION                 : constant := 16#c00000#;
   WS_BORDER                  : constant := 16#800000#;
   WS_DLGFRAME                : constant := 16#400000#;
   WS_VSCROLL                 : constant := 16#200000#;
   WS_HSCROLL                 : constant := 16#100000#;
   WS_SYSMENU                 : constant := 16#80000#;
   WS_THICKFRAME              : constant := 16#40000#;
   WS_GROUP                   : constant := 16#20000#;
   WS_TABSTOP                 : constant := 16#10000#;
   WS_MINIMIZEBOX             : constant := 16#20000#;
   WS_MAXIMIZEBOX             : constant := 16#10000#;
   WS_TILED                   : constant := 16#0#;
   WS_ICONIC                  : constant := 16#20000000#;
   WS_SIZEBOX                 : constant := 16#40000#;
   WS_TILEDWINDOW             : constant := 16#cf0000#;
   WS_OVERLAPPEDWINDOW        : constant := 16#cf0000#;
   WS_POPUPWINDOW             : constant := 16#80880000#;
   WS_CHILDWINDOW             : constant := 16#40000000#;
   WS_EX_DLGMODALFRAME        : constant := 16#1#;
   WS_EX_NOPARENTNOTIFY       : constant := 16#4#;
   WS_EX_TOPMOST              : constant := 16#8#;
   WS_EX_ACCEPTFILES          : constant := 16#10#;
   WS_EX_TRANSPARENT          : constant := 16#20#;
   CS_VREDRAW                 : constant := 16#1#;
   CS_HREDRAW                 : constant := 16#2#;
   CS_KEYCVTWINDOW            : constant := 16#4#;
   CS_DBLCLKS                 : constant := 16#8#;
   CS_OWNDC                   : constant := 16#20#;
   CS_CLASSDC                 : constant := 16#40#;
   CS_PARENTDC                : constant := 16#80#;
   CS_NOKEYCVT                : constant := 16#100#;
   CS_NOCLOSE                 : constant := 16#200#;
   CS_SAVEBITS                : constant := 16#800#;
   CS_BYTEALIGNCLIENT         : constant := 16#1000#;
   CS_BYTEALIGNWINDOW         : constant := 16#2000#;
   CS_GLOBALCLASS             : constant := 16#4000#;
   CF_TEXT                    : constant := 1;
   CF_BITMAP                  : constant := 2;
   CF_METAFILEPICT            : constant := 3;
   CF_SYLK                    : constant := 4;
   CF_DIF                     : constant := 5;
   CF_TIFF                    : constant := 6;
   CF_OEMTEXT                 : constant := 7;
   CF_DIB                     : constant := 8;
   CF_PALETTE                 : constant := 9;
   CF_PENDATA                 : constant := 10;
   CF_RIFF                    : constant := 11;
   CF_WAVE                    : constant := 12;
   CF_UNICODETEXT             : constant := 13;
   CF_ENHMETAFILE             : constant := 14;
   CF_OWNERDISPLAY            : constant := 16#80#;
   CF_DSPTEXT                 : constant := 16#81#;
   CF_DSPBITMAP               : constant := 16#82#;
   CF_DSPMETAFILEPICT         : constant := 16#83#;
   CF_DSPENHMETAFILE          : constant := 16#8e#;
   CF_PRIVATEFIRST            : constant := 16#200#;
   CF_PRIVATELAST             : constant := 16#2ff#;
   CF_GDIOBJFIRST             : constant := 16#300#;
   CF_GDIOBJLAST              : constant := 16#3ff#;
   FVIRTKEY                   : constant := 1;
   FNOINVERT                  : constant := 16#2#;
   FSHIFT                     : constant := 16#4#;
   FCONTROL                   : constant := 16#8#;
   FALT                       : constant := 16#10#;
   WPF_SETMINPOSITION         : constant := 16#1#;
   WPF_RESTORETOMAXIMIZED     : constant := 16#2#;
   ODT_MENU                   : constant := 1;
   ODT_LISTBOX                : constant := 2;
   ODT_COMBOBOX               : constant := 3;
   ODT_BUTTON                 : constant := 4;
   ODA_DRAWENTIRE             : constant := 16#1#;
   ODA_SELECT                 : constant := 16#2#;
   ODA_FOCUS                  : constant := 16#4#;
   ODS_SELECTED               : constant := 16#1#;
   ODS_GRAYED                 : constant := 16#2#;
   ODS_DISABLED               : constant := 16#4#;
   ODS_CHECKED                : constant := 16#8#;
   ODS_FOCUS                  : constant := 16#10#;
   PM_NOREMOVE                : constant := 16#0#;
   PM_REMOVE                  : constant := 16#1#;
   PM_NOYIELD                 : constant := 16#2#;
   MOD_ALT                    : constant := 16#1#;
   MOD_CONTROL                : constant := 16#2#;
   MOD_SHIFT                  : constant := 16#4#;
   IDHOT_SNAPWINDOW           : constant := -1;
   IDHOT_SNAPDESKTOP          : constant := -2;
   EWX_LOGOFF                 : constant := 0;
   EWX_SHUTDOWN               : constant := 1;
   EWX_REBOOT                 : constant := 2;
   EWX_FORCE                  : constant := 4;
   EWX_POWEROFF               : constant := 8;
   CW_USEDEFAULT              : constant INT := INT'First;
   HWND_BROADCAST             : constant Win32.Windef.HWND;
   HWND_DESKTOP               : constant Win32.Windef.HWND;
   SWP_NOSIZE                 : constant := 16#1#;
   SWP_NOMOVE                 : constant := 16#2#;
   SWP_NOZORDER               : constant := 16#4#;
   SWP_NOREDRAW               : constant := 16#8#;
   SWP_NOACTIVATE             : constant := 16#10#;
   SWP_FRAMECHANGED           : constant := 16#20#;
   SWP_SHOWWINDOW             : constant := 16#40#;
   SWP_HIDEWINDOW             : constant := 16#80#;
   SWP_NOCOPYBITS             : constant := 16#100#;
   SWP_NOOWNERZORDER          : constant := 16#200#;
   SWP_DRAWFRAME              : constant := 16#20#;
   SWP_NOREPOSITION           : constant := 16#200#;
   HWND_TOP                   : constant Win32.Windef.HWND;
   HWND_BOTTOM                : constant Win32.Windef.HWND;
   HWND_TOPMOST               : constant Win32.Windef.HWND;
   HWND_NOTOPMOST             : constant Win32.Windef.HWND;
   DLGWINDOWEXTRA             : constant := 30;
   KEYEVENTF_EXTENDEDKEY      : constant := 16#1#;
   KEYEVENTF_KEYUP            : constant := 16#2#;
   MOUSEEVENTF_MOVE           : constant := 16#1#;
   MOUSEEVENTF_LEFTDOWN       : constant := 16#2#;
   MOUSEEVENTF_LEFTUP         : constant := 16#4#;
   MOUSEEVENTF_RIGHTDOWN      : constant := 16#8#;
   MOUSEEVENTF_RIGHTUP        : constant := 16#10#;
   MOUSEEVENTF_MIDDLEDOWN     : constant := 16#20#;
   MOUSEEVENTF_MIDDLEUP       : constant := 16#40#;
   MOUSEEVENTF_ABSOLUTE       : constant := 16#8000#;
   QS_KEY                     : constant := 16#1#;
   QS_MOUSEMOVE               : constant := 16#2#;
   QS_MOUSEBUTTON             : constant := 16#4#;
   QS_POSTMESSAGE             : constant := 16#8#;
   QS_TIMER                   : constant := 16#10#;
   QS_PAINT                   : constant := 16#20#;
   QS_SENDMESSAGE             : constant := 16#40#;
   QS_HOTKEY                  : constant := 16#80#;
   QS_MOUSE                   : constant := 16#6#;
   QS_INPUT                   : constant := 16#7#;
   QS_ALLEVENTS               : constant := 16#bf#;
   QS_ALLINPUT                : constant := 16#ff#;
   SM_CXSCREEN                : constant := 0;
   SM_CYSCREEN                : constant := 1;
   SM_CXVSCROLL               : constant := 2;
   SM_CYHSCROLL               : constant := 3;
   SM_CYCAPTION               : constant := 4;
   SM_CXBORDER                : constant := 5;
   SM_CYBORDER                : constant := 6;
   SM_CXDLGFRAME              : constant := 7;
   SM_CYDLGFRAME              : constant := 8;
   SM_CYVTHUMB                : constant := 9;
   SM_CXHTHUMB                : constant := 10;
   SM_CXICON                  : constant := 11;
   SM_CYICON                  : constant := 12;
   SM_CXCURSOR                : constant := 13;
   SM_CYCURSOR                : constant := 14;
   SM_CYMENU                  : constant := 15;
   SM_CXFULLSCREEN            : constant := 16;
   SM_CYFULLSCREEN            : constant := 17;
   SM_CYKANJIWINDOW           : constant := 18;
   SM_MOUSEPRESENT            : constant := 19;
   SM_CYVSCROLL               : constant := 20;
   SM_CXHSCROLL               : constant := 21;
   SM_DEBUG                   : constant := 22;
   SM_SWAPBUTTON              : constant := 23;
   SM_RESERVED1               : constant := 24;
   SM_RESERVED2               : constant := 25;
   SM_RESERVED3               : constant := 26;
   SM_RESERVED4               : constant := 27;
   SM_CXMIN                   : constant := 28;
   SM_CYMIN                   : constant := 29;
   SM_CXSIZE                  : constant := 30;
   SM_CYSIZE                  : constant := 31;
   SM_CXFRAME                 : constant := 32;
   SM_CYFRAME                 : constant := 33;
   SM_CXMINTRACK              : constant := 34;
   SM_CYMINTRACK              : constant := 35;
   SM_CXDOUBLECLK             : constant := 36;
   SM_CYDOUBLECLK             : constant := 37;
   SM_CXICONSPACING           : constant := 38;
   SM_CYICONSPACING           : constant := 39;
   SM_MENUDROPALIGNMENT       : constant := 40;
   SM_PENWINDOWS              : constant := 41;
   SM_DBCSENABLED             : constant := 42;
   SM_CMOUSEBUTTONS           : constant := 43;
   SM_SHOWSOUNDS              : constant := 70;
   SM_CMETRICS                : constant := 71;
   TPM_LEFTBUTTON             : constant := 16#0#;
   TPM_RIGHTBUTTON            : constant := 16#2#;
   TPM_LEFTALIGN              : constant := 16#0#;
   TPM_CENTERALIGN            : constant := 16#4#;
   TPM_RIGHTALIGN             : constant := 16#8#;
   DT_TOP                     : constant := 16#0#;
   DT_LEFT                    : constant := 16#0#;
   DT_CENTER                  : constant := 16#1#;
   DT_RIGHT                   : constant := 16#2#;
   DT_VCENTER                 : constant := 16#4#;
   DT_BOTTOM                  : constant := 16#8#;
   DT_WORDBREAK               : constant := 16#10#;
   DT_SINGLELINE              : constant := 16#20#;
   DT_EXPANDTABS              : constant := 16#40#;
   DT_TABSTOP                 : constant := 16#80#;
   DT_NOCLIP                  : constant := 16#100#;
   DT_EXTERNALLEADING         : constant := 16#200#;
   DT_CALCRECT                : constant := 16#400#;
   DT_NOPREFIX                : constant := 16#800#;
   DT_INTERNAL                : constant := 16#1000#;
   DCX_WINDOW                 : constant := 16#1#;
   DCX_CACHE                  : constant := 16#2#;
   DCX_NORESETATTRS           : constant := 16#4#;
   DCX_CLIPCHILDREN           : constant := 16#8#;
   DCX_CLIPSIBLINGS           : constant := 16#10#;
   DCX_PARENTCLIP             : constant := 16#20#;
   DCX_EXCLUDERGN             : constant := 16#40#;
   DCX_INTERSECTRGN           : constant := 16#80#;
   DCX_EXCLUDEUPDATE          : constant := 16#100#;
   DCX_INTERSECTUPDATE        : constant := 16#200#;
   DCX_LOCKWINDOWUPDATE       : constant := 16#400#;
   DCX_VALIDATE               : constant := 16#200000#;
   RDW_INVALIDATE             : constant := 16#1#;
   RDW_INTERNALPAINT          : constant := 16#2#;
   RDW_ERASE                  : constant := 16#4#;
   RDW_VALIDATE               : constant := 16#8#;
   RDW_NOINTERNALPAINT        : constant := 16#10#;
   RDW_NOERASE                : constant := 16#20#;
   RDW_NOCHILDREN             : constant := 16#40#;
   RDW_ALLCHILDREN            : constant := 16#80#;
   RDW_UPDATENOW              : constant := 16#100#;
   RDW_ERASENOW               : constant := 16#200#;
   RDW_FRAME                  : constant := 16#400#;
   RDW_NOFRAME                : constant := 16#800#;
   SW_SCROLLCHILDREN          : constant := 16#1#;
   SW_INVALIDATE              : constant := 16#2#;
   SW_ERASE                   : constant := 16#4#;
   ESB_ENABLE_BOTH            : constant := 16#0#;
   ESB_DISABLE_BOTH           : constant := 16#3#;
   ESB_DISABLE_LEFT           : constant := 16#1#;
   ESB_DISABLE_RIGHT          : constant := 16#2#;
   ESB_DISABLE_UP             : constant := 16#1#;
   ESB_DISABLE_DOWN           : constant := 16#2#;
   ESB_DISABLE_LTUP           : constant := 16#1#;
   ESB_DISABLE_RTDN           : constant := 16#2#;
   MB_OK                      : constant := 16#0#;
   MB_OKCANCEL                : constant := 16#1#;
   MB_ABORTRETRYIGNORE        : constant := 16#2#;
   MB_YESNOCANCEL             : constant := 16#3#;
   MB_YESNO                   : constant := 16#4#;
   MB_RETRYCANCEL             : constant := 16#5#;
   MB_ICONHAND                : constant := 16#10#;
   MB_ICONQUESTION            : constant := 16#20#;
   MB_ICONEXCLAMATION         : constant := 16#30#;
   MB_ICONASTERISK            : constant := 16#40#;
   MB_ICONINFORMATION         : constant := 16#40#;
   MB_ICONSTOP                : constant := 16#10#;
   MB_DEFBUTTON1              : constant := 16#0#;
   MB_DEFBUTTON2              : constant := 16#100#;
   MB_DEFBUTTON3              : constant := 16#200#;
   MB_APPLMODAL               : constant := 16#0#;
   MB_SYSTEMMODAL             : constant := 16#1000#;
   MB_TASKMODAL               : constant := 16#2000#;
   MB_NOFOCUS                 : constant := 16#8000#;
   MB_SETFOREGROUND           : constant := 16#10000#;
   MB_DEFAULT_DESKTOP_ONLY    : constant := 16#20000#;
   MB_SERVICE_NOTIFICATION    : constant := 16#40000#;
   MB_TYPEMASK                : constant := 16#f#;
   MB_ICONMASK                : constant := 16#f0#;
   MB_DEFMASK                 : constant := 16#f00#;
   MB_MODEMASK                : constant := 16#3000#;
   MB_MISCMASK                : constant := 16#c000#;
   CTLCOLOR_MSGBOX            : constant := 0;
   CTLCOLOR_EDIT              : constant := 1;
   CTLCOLOR_LISTBOX           : constant := 2;
   CTLCOLOR_BTN               : constant := 3;
   CTLCOLOR_DLG               : constant := 4;
   CTLCOLOR_SCROLLBAR         : constant := 5;
   CTLCOLOR_STATIC            : constant := 6;
   CTLCOLOR_MAX               : constant := 7;
   COLOR_SCROLLBAR            : constant := 0;
   COLOR_BACKGROUND           : constant := 1;
   COLOR_ACTIVECAPTION        : constant := 2;
   COLOR_INACTIVECAPTION      : constant := 3;
   COLOR_MENU                 : constant := 4;
   COLOR_WINDOW               : constant := 5;
   COLOR_WINDOWFRAME          : constant := 6;
   COLOR_MENUTEXT             : constant := 7;
   COLOR_WINDOWTEXT           : constant := 8;
   COLOR_CAPTIONTEXT          : constant := 9;
   COLOR_ACTIVEBORDER         : constant := 10;
   COLOR_INACTIVEBORDER       : constant := 11;
   COLOR_APPWORKSPACE         : constant := 12;
   COLOR_HIGHLIGHT            : constant := 13;
   COLOR_HIGHLIGHTTEXT        : constant := 14;
   COLOR_BTNFACE              : constant := 15;
   COLOR_BTNSHADOW            : constant := 16;
   COLOR_GRAYTEXT             : constant := 17;
   COLOR_BTNTEXT              : constant := 18;
   COLOR_INACTIVECAPTIONTEXT  : constant := 19;
   COLOR_BTNHIGHLIGHT         : constant := 20;
   GW_HWNDFIRST               : constant := 0;
   GW_HWNDLAST                : constant := 1;
   GW_HWNDNEXT                : constant := 2;
   GW_HWNDPREV                : constant := 3;
   GW_OWNER                   : constant := 4;
   GW_CHILD                   : constant := 5;
   GW_MAX                     : constant := 5;
   MF_INSERT                  : constant := 16#0#;
   MF_CHANGE                  : constant := 16#80#;
   MF_APPEND                  : constant := 16#100#;
   MF_DELETE                  : constant := 16#200#;
   MF_REMOVE                  : constant := 16#1000#;
   MF_BYCOMMAND               : constant := 16#0#;
   MF_BYPOSITION              : constant := 16#400#;
   MF_SEPARATOR               : constant := 16#800#;
   MF_ENABLED                 : constant := 16#0#;
   MF_GRAYED                  : constant := 16#1#;
   MF_DISABLED                : constant := 16#2#;
   MF_UNCHECKED               : constant := 16#0#;
   MF_CHECKED                 : constant := 16#8#;
   MF_USECHECKBITMAPS         : constant := 16#200#;
   MF_STRING                  : constant := 16#0#;
   MF_BITMAP                  : constant := 16#4#;
   MF_OWNERDRAW               : constant := 16#100#;
   MF_POPUP                   : constant := 16#10#;
   MF_MENUBARBREAK            : constant := 16#20#;
   MF_MENUBREAK               : constant := 16#40#;
   MF_UNHILITE                : constant := 16#0#;
   MF_HILITE                  : constant := 16#80#;
   MF_SYSMENU                 : constant := 16#2000#;
   MF_HELP                    : constant := 16#4000#;
   MF_MOUSESELECT             : constant := 16#8000#;
   MF_END                     : constant := 16#80#;
   SC_SIZE                    : constant := 16#f000#;
   SC_MOVE                    : constant := 16#f010#;
   SC_MINIMIZE                : constant := 16#f020#;
   SC_MAXIMIZE                : constant := 16#f030#;
   SC_NEXTWINDOW              : constant := 16#f040#;
   SC_PREVWINDOW              : constant := 16#f050#;
   SC_CLOSE                   : constant := 16#f060#;
   SC_VSCROLL                 : constant := 16#f070#;
   SC_HSCROLL                 : constant := 16#f080#;
   SC_MOUSEMENU               : constant := 16#f090#;
   SC_KEYMENU                 : constant := 16#f100#;
   SC_ARRANGE                 : constant := 16#f110#;
   SC_RESTORE                 : constant := 16#f120#;
   SC_TASKLIST                : constant := 16#f130#;
   SC_SCREENSAVE              : constant := 16#f140#;
   SC_HOTKEY                  : constant := 16#f150#;
   SC_ICON                    : constant := 16#f020#;
   SC_ZOOM                    : constant := 16#f030#;
   IDC_ARROW                  : constant LPSTR;
   IDC_IBEAM                  : constant LPSTR;
   IDC_WAIT                   : constant LPSTR;
   IDC_CROSS                  : constant LPSTR;
   IDC_UPARROW                : constant LPSTR;
   IDC_SIZE                   : constant LPSTR;
   IDC_ICON                   : constant LPSTR;
   IDC_SIZENWSE               : constant LPSTR;
   IDC_SIZENESW               : constant LPSTR;
   IDC_SIZEWE                 : constant LPSTR;
   IDC_SIZENS                 : constant LPSTR;

   IDC_SIZEALL     : constant LPSTR;
   IDC_NO          : constant LPSTR;
   IDC_APPSTARTING : constant LPSTR;
   ORD_LANGDRIVER  : constant := 1;
   IDI_APPLICATION : constant LPSTR;
   IDI_HAND        : constant LPSTR;
   IDI_QUESTION    : constant LPSTR;
   IDI_EXCLAMATION : constant LPSTR;
   IDI_ASTERISK    : constant LPSTR;

   IDOK                        : constant := 1;
   IDCANCEL                    : constant := 2;
   IDABORT                     : constant := 3;
   IDRETRY                     : constant := 4;
   IDIGNORE                    : constant := 5;
   IDYES                       : constant := 6;
   IDNO                        : constant := 7;
   ES_LEFT                     : constant := 16#0#;
   ES_CENTER                   : constant := 16#1#;
   ES_RIGHT                    : constant := 16#2#;
   ES_MULTILINE                : constant := 16#4#;
   ES_UPPERCASE                : constant := 16#8#;
   ES_LOWERCASE                : constant := 16#10#;
   ES_PASSWORD                 : constant := 16#20#;
   ES_AUTOVSCROLL              : constant := 16#40#;
   ES_AUTOHSCROLL              : constant := 16#80#;
   ES_NOHIDESEL                : constant := 16#100#;
   ES_OEMCONVERT               : constant := 16#400#;
   ES_READONLY                 : constant := 16#800#;
   ES_WANTRETURN               : constant := 16#1000#;
   EN_SETFOCUS                 : constant := 16#100#;
   EN_KILLFOCUS                : constant := 16#200#;
   EN_CHANGE                   : constant := 16#300#;
   EN_UPDATE                   : constant := 16#400#;
   EN_ERRSPACE                 : constant := 16#500#;
   EN_MAXTEXT                  : constant := 16#501#;
   EN_HSCROLL                  : constant := 16#601#;
   EN_VSCROLL                  : constant := 16#602#;
   EM_GETSEL                   : constant := 16#b0#;
   EM_SETSEL                   : constant := 16#b1#;
   EM_GETRECT                  : constant := 16#b2#;
   EM_SETRECT                  : constant := 16#b3#;
   EM_SETRECTNP                : constant := 16#b4#;
   EM_SCROLL                   : constant := 16#b5#;
   EM_LINESCROLL               : constant := 16#b6#;
   EM_SCROLLCARET              : constant := 16#b7#;
   EM_GETMODIFY                : constant := 16#b8#;
   EM_SETMODIFY                : constant := 16#b9#;
   EM_GETLINECOUNT             : constant := 16#ba#;
   EM_LINEINDEX                : constant := 16#bb#;
   EM_SETHANDLE                : constant := 16#bc#;
   EM_GETHANDLE                : constant := 16#bd#;
   EM_GETTHUMB                 : constant := 16#be#;
   EM_LINELENGTH               : constant := 16#c1#;
   EM_REPLACESEL               : constant := 16#c2#;
   EM_GETLINE                  : constant := 16#c4#;
   EM_LIMITTEXT                : constant := 16#c5#;
   EM_CANUNDO                  : constant := 16#c6#;
   EM_UNDO                     : constant := 16#c7#;
   EM_FMTLINES                 : constant := 16#c8#;
   EM_LINEFROMCHAR             : constant := 16#c9#;
   EM_SETTABSTOPS              : constant := 16#cb#;
   EM_SETPASSWORDCHAR          : constant := 16#cc#;
   EM_EMPTYUNDOBUFFER          : constant := 16#cd#;
   EM_GETFIRSTVISIBLELINE      : constant := 16#ce#;
   EM_SETREADONLY              : constant := 16#cf#;
   EM_SETWORDBREAKPROC         : constant := 16#d0#;
   EM_GETWORDBREAKPROC         : constant := 16#d1#;
   EM_GETPASSWORDCHAR          : constant := 16#d2#;
   WB_LEFT                     : constant := 0;
   WB_RIGHT                    : constant := 1;
   WB_ISDELIMITER              : constant := 2;
   BS_PUSHBUTTON               : constant := 16#0#;
   BS_DEFPUSHBUTTON            : constant := 16#1#;
   BS_CHECKBOX                 : constant := 16#2#;
   BS_AUTOCHECKBOX             : constant := 16#3#;
   BS_RADIOBUTTON              : constant := 16#4#;
   BS_3STATE                   : constant := 16#5#;
   BS_AUTO3STATE               : constant := 16#6#;
   BS_GROUPBOX                 : constant := 16#7#;
   BS_USERBUTTON               : constant := 16#8#;
   BS_AUTORADIOBUTTON          : constant := 16#9#;
   BS_OWNERDRAW                : constant := 16#b#;
   BS_LEFTTEXT                 : constant := 16#20#;
   BN_CLICKED                  : constant := 0;
   BN_PAINT                    : constant := 1;
   BN_HILITE                   : constant := 2;
   BN_UNHILITE                 : constant := 3;
   BN_DISABLE                  : constant := 4;
   BN_DOUBLECLICKED            : constant := 5;
   BM_GETCHECK                 : constant := 16#f0#;
   BM_SETCHECK                 : constant := 16#f1#;
   BM_GETSTATE                 : constant := 16#f2#;
   BM_SETSTATE                 : constant := 16#f3#;
   BM_SETSTYLE                 : constant := 16#f4#;
   SS_LEFT                     : constant := 16#0#;
   SS_CENTER                   : constant := 16#1#;
   SS_RIGHT                    : constant := 16#2#;
   SS_ICON                     : constant := 16#3#;
   SS_BLACKRECT                : constant := 16#4#;
   SS_GRAYRECT                 : constant := 16#5#;
   SS_WHITERECT                : constant := 16#6#;
   SS_BLACKFRAME               : constant := 16#7#;
   SS_GRAYFRAME                : constant := 16#8#;
   SS_WHITEFRAME               : constant := 16#9#;
   SS_USERITEM                 : constant := 16#a#;
   SS_SIMPLE                   : constant := 16#b#;
   SS_LEFTNOWORDWRAP           : constant := 16#c#;
   SS_NOPREFIX                 : constant := 16#80#;
   STM_SETICON                 : constant := 16#170#;
   STM_GETICON                 : constant := 16#171#;
   STM_MSGMAX                  : constant := 16#172#;
   WC_DIALOG                   : constant Win32.Winnt.LPTSTR :=
      Win32.Winbase.MAKEINTATOM (16#8002#);
   DWL_MSGRESULT               : constant := 0;
   DWL_DLGPROC                 : constant := 4;
   DWL_USER                    : constant := 8;
   DDL_READWRITE               : constant := 16#0#;
   DDL_READONLY                : constant := 16#1#;
   DDL_HIDDEN                  : constant := 16#2#;
   DDL_SYSTEM                  : constant := 16#4#;
   DDL_DIRECTORY               : constant := 16#10#;
   DDL_ARCHIVE                 : constant := 16#20#;
   DDL_POSTMSGS                : constant := 16#2000#;
   DDL_DRIVES                  : constant := 16#4000#;
   DDL_EXCLUSIVE               : constant := 16#8000#;
   DS_ABSALIGN                 : constant := 16#1#;
   DS_SYSMODAL                 : constant := 16#2#;
   DS_LOCALEDIT                : constant := 16#20#;
   DS_SETFONT                  : constant := 16#40#;
   DS_MODALFRAME               : constant := 16#80#;
   DS_NOIDLEMSG                : constant := 16#100#;
   DS_SETFOREGROUND            : constant := 16#200#;
   DM_GETDEFID                 : constant := 16#400#;
   DM_SETDEFID                 : constant := 16#401#;
   DC_HASDEFID                 : constant := 16#534b#;
   DLGC_WANTARROWS             : constant := 16#1#;
   DLGC_WANTTAB                : constant := 16#2#;
   DLGC_WANTALLKEYS            : constant := 16#4#;
   DLGC_WANTMESSAGE            : constant := 16#4#;
   DLGC_HASSETSEL              : constant := 16#8#;
   DLGC_DEFPUSHBUTTON          : constant := 16#10#;
   DLGC_UNDEFPUSHBUTTON        : constant := 16#20#;
   DLGC_RADIOBUTTON            : constant := 16#40#;
   DLGC_WANTCHARS              : constant := 16#80#;
   DLGC_STATIC                 : constant := 16#100#;
   DLGC_BUTTON                 : constant := 16#2000#;
   LB_CTLCODE                  : constant := 0;
   LB_OKAY                     : constant := 0;
   LB_ERR                      : constant := -1;
   LB_ERRSPACE                 : constant := -2;
   LBN_ERRSPACE                : constant := -2;
   LBN_SELCHANGE               : constant := 1;
   LBN_DBLCLK                  : constant := 2;
   LBN_SELCANCEL               : constant := 3;
   LBN_SETFOCUS                : constant := 4;
   LBN_KILLFOCUS               : constant := 5;
   LB_ADDSTRING                : constant := 16#180#;
   LB_INSERTSTRING             : constant := 16#181#;
   LB_DELETESTRING             : constant := 16#182#;
   LB_SELITEMRANGEEX           : constant := 16#183#;
   LB_RESETCONTENT             : constant := 16#184#;
   LB_SETSEL                   : constant := 16#185#;
   LB_SETCURSEL                : constant := 16#186#;
   LB_GETSEL                   : constant := 16#187#;
   LB_GETCURSEL                : constant := 16#188#;
   LB_GETTEXT                  : constant := 16#189#;
   LB_GETTEXTLEN               : constant := 16#18a#;
   LB_GETCOUNT                 : constant := 16#18b#;
   LB_SELECTSTRING             : constant := 16#18c#;
   LB_DIR                      : constant := 16#18d#;
   LB_GETTOPINDEX              : constant := 16#18e#;
   LB_FINDSTRING               : constant := 16#18f#;
   LB_GETSELCOUNT              : constant := 16#190#;
   LB_GETSELITEMS              : constant := 16#191#;
   LB_SETTABSTOPS              : constant := 16#192#;
   LB_GETHORIZONTALEXTENT      : constant := 16#193#;
   LB_SETHORIZONTALEXTENT      : constant := 16#194#;
   LB_SETCOLUMNWIDTH           : constant := 16#195#;
   LB_ADDFILE                  : constant := 16#196#;
   LB_SETTOPINDEX              : constant := 16#197#;
   LB_GETITEMRECT              : constant := 16#198#;
   LB_GETITEMDATA              : constant := 16#199#;
   LB_SETITEMDATA              : constant := 16#19a#;
   LB_SELITEMRANGE             : constant := 16#19b#;
   LB_SETANCHORINDEX           : constant := 16#19c#;
   LB_GETANCHORINDEX           : constant := 16#19d#;
   LB_SETCARETINDEX            : constant := 16#19e#;
   LB_GETCARETINDEX            : constant := 16#19f#;
   LB_SETITEMHEIGHT            : constant := 16#1a0#;
   LB_GETITEMHEIGHT            : constant := 16#1a1#;
   LB_FINDSTRINGEXACT          : constant := 16#1a2#;
   LB_SETLOCALE                : constant := 16#1a5#;
   LB_GETLOCALE                : constant := 16#1a6#;
   LB_SETCOUNT                 : constant := 16#1a7#;
   LB_MSGMAX                   : constant := 16#1a8#;
   LBS_NOTIFY                  : constant := 16#1#;
   LBS_SORT                    : constant := 16#2#;
   LBS_NOREDRAW                : constant := 16#4#;
   LBS_MULTIPLESEL             : constant := 16#8#;
   LBS_OWNERDRAWFIXED          : constant := 16#10#;
   LBS_OWNERDRAWVARIABLE       : constant := 16#20#;
   LBS_HASSTRINGS              : constant := 16#40#;
   LBS_USETABSTOPS             : constant := 16#80#;
   LBS_NOINTEGRALHEIGHT        : constant := 16#100#;
   LBS_MULTICOLUMN             : constant := 16#200#;
   LBS_WANTKEYBOARDINPUT       : constant := 16#400#;
   LBS_EXTENDEDSEL             : constant := 16#800#;
   LBS_DISABLENOSCROLL         : constant := 16#1000#;
   LBS_NODATA                  : constant := 16#2000#;
   LBS_STANDARD                : constant := 16#a00003#;
   CB_OKAY                     : constant := 0;
   CB_ERR                      : constant := -1;
   CB_ERRSPACE                 : constant := -2;
   CBN_ERRSPACE                : constant := -1;
   CBN_SELCHANGE               : constant := 1;
   CBN_DBLCLK                  : constant := 2;
   CBN_SETFOCUS                : constant := 3;
   CBN_KILLFOCUS               : constant := 4;
   CBN_EDITCHANGE              : constant := 5;
   CBN_EDITUPDATE              : constant := 6;
   CBN_DROPDOWN                : constant := 7;
   CBN_CLOSEUP                 : constant := 8;
   CBN_SELENDOK                : constant := 9;
   CBN_SELENDCANCEL            : constant := 10;
   CBS_SIMPLE                  : constant := 16#1#;
   CBS_DROPDOWN                : constant := 16#2#;
   CBS_DROPDOWNLIST            : constant := 16#3#;
   CBS_OWNERDRAWFIXED          : constant := 16#10#;
   CBS_OWNERDRAWVARIABLE       : constant := 16#20#;
   CBS_AUTOHSCROLL             : constant := 16#40#;
   CBS_OEMCONVERT              : constant := 16#80#;
   CBS_SORT                    : constant := 16#100#;
   CBS_HASSTRINGS              : constant := 16#200#;
   CBS_NOINTEGRALHEIGHT        : constant := 16#400#;
   CBS_DISABLENOSCROLL         : constant := 16#800#;
   CB_GETEDITSEL               : constant := 16#140#;
   CB_LIMITTEXT                : constant := 16#141#;
   CB_SETEDITSEL               : constant := 16#142#;
   CB_ADDSTRING                : constant := 16#143#;
   CB_DELETESTRING             : constant := 16#144#;
   CB_DIR                      : constant := 16#145#;
   CB_GETCOUNT                 : constant := 16#146#;
   CB_GETCURSEL                : constant := 16#147#;
   CB_GETLBTEXT                : constant := 16#148#;
   CB_GETLBTEXTLEN             : constant := 16#149#;
   CB_INSERTSTRING             : constant := 16#14a#;
   CB_RESETCONTENT             : constant := 16#14b#;
   CB_FINDSTRING               : constant := 16#14c#;
   CB_SELECTSTRING             : constant := 16#14d#;
   CB_SETCURSEL                : constant := 16#14e#;
   CB_SHOWDROPDOWN             : constant := 16#14f#;
   CB_GETITEMDATA              : constant := 16#150#;
   CB_SETITEMDATA              : constant := 16#151#;
   CB_GETDROPPEDCONTROLRECT    : constant := 16#152#;
   CB_SETITEMHEIGHT            : constant := 16#153#;
   CB_GETITEMHEIGHT            : constant := 16#154#;
   CB_SETEXTENDEDUI            : constant := 16#155#;
   CB_GETEXTENDEDUI            : constant := 16#156#;
   CB_GETDROPPEDSTATE          : constant := 16#157#;
   CB_FINDSTRINGEXACT          : constant := 16#158#;
   CB_SETLOCALE                : constant := 16#159#;
   CB_GETLOCALE                : constant := 16#15a#;
   CB_MSGMAX                   : constant := 16#15b#;
   SBS_HORZ                    : constant := 16#0#;
   SBS_VERT                    : constant := 16#1#;
   SBS_TOPALIGN                : constant := 16#2#;
   SBS_LEFTALIGN               : constant := 16#2#;
   SBS_BOTTOMALIGN             : constant := 16#4#;
   SBS_RIGHTALIGN              : constant := 16#4#;
   SBS_SIZEBOXTOPLEFTALIGN     : constant := 16#2#;
   SBS_SIZEBOXBOTTOMRIGHTALIGN : constant := 16#4#;
   SBS_SIZEBOX                 : constant := 16#8#;
   SBM_SETPOS                  : constant := 16#e0#;
   SBM_GETPOS                  : constant := 16#e1#;
   SBM_SETRANGE                : constant := 16#e2#;
   SBM_SETRANGEREDRAW          : constant := 16#e6#;
   SBM_GETRANGE                : constant := 16#e3#;
   SBM_ENABLE_ARROWS           : constant := 16#e4#;
   MDIS_ALLCHILDSTYLES         : constant := 16#1#;
   MDITILE_VERTICAL            : constant := 16#0#;
   MDITILE_HORIZONTAL          : constant := 16#1#;
   MDITILE_SKIPDISABLED        : constant := 16#2#;
   HELP_CONTEXT                : constant := 16#1#;
   HELP_QUIT                   : constant := 16#2#;
   HELP_INDEX                  : constant := 16#3#;
   HELP_CONTENTS               : constant := 16#3#;
   HELP_HELPONHELP             : constant := 16#4#;
   HELP_SETINDEX               : constant := 16#5#;
   HELP_SETCONTENTS            : constant := 16#5#;
   HELP_CONTEXTPOPUP           : constant := 16#8#;
   HELP_FORCEFILE              : constant := 16#9#;
   HELP_KEY                    : constant := 16#101#;
   HELP_COMMAND                : constant := 16#102#;
   HELP_PARTIALKEY             : constant := 16#105#;
   HELP_MULTIKEY               : constant := 16#201#;
   HELP_SETWINPOS              : constant := 16#203#;
   SPI_GETBEEP                 : constant := 1;
   SPI_SETBEEP                 : constant := 2;
   SPI_GETMOUSE                : constant := 3;
   SPI_SETMOUSE                : constant := 4;
   SPI_GETBORDER               : constant := 5;
   SPI_SETBORDER               : constant := 6;
   SPI_GETKEYBOARDSPEED        : constant := 10;
   SPI_SETKEYBOARDSPEED        : constant := 11;
   SPI_LANGDRIVER              : constant := 12;
   SPI_ICONHORIZONTALSPACING   : constant := 13;
   SPI_GETSCREENSAVETIMEOUT    : constant := 14;
   SPI_SETSCREENSAVETIMEOUT    : constant := 15;
   SPI_GETSCREENSAVEACTIVE     : constant := 16;
   SPI_SETSCREENSAVEACTIVE     : constant := 17;
   SPI_GETGRIDGRANULARITY      : constant := 18;
   SPI_SETGRIDGRANULARITY      : constant := 19;
   SPI_SETDESKWALLPAPER        : constant := 20;
   SPI_SETDESKPATTERN          : constant := 21;
   SPI_GETKEYBOARDDELAY        : constant := 22;
   SPI_SETKEYBOARDDELAY        : constant := 23;
   SPI_ICONVERTICALSPACING     : constant := 24;
   SPI_GETICONTITLEWRAP        : constant := 25;
   SPI_SETICONTITLEWRAP        : constant := 26;
   SPI_GETMENUDROPALIGNMENT    : constant := 27;
   SPI_SETMENUDROPALIGNMENT    : constant := 28;
   SPI_SETDOUBLECLKWIDTH       : constant := 29;
   SPI_SETDOUBLECLKHEIGHT      : constant := 30;
   SPI_GETICONTITLELOGFONT     : constant := 31;
   SPI_SETDOUBLECLICKTIME      : constant := 32;
   SPI_SETMOUSEBUTTONSWAP      : constant := 33;
   SPI_SETICONTITLELOGFONT     : constant := 34;
   SPI_GETFASTTASKSWITCH       : constant := 35;
   SPI_SETFASTTASKSWITCH       : constant := 36;
   SPI_GETFILTERKEYS           : constant := 50;
   SPI_SETFILTERKEYS           : constant := 51;
   SPI_GETTOGGLEKEYS           : constant := 52;
   SPI_SETTOGGLEKEYS           : constant := 53;
   SPI_GETMOUSEKEYS            : constant := 54;
   SPI_SETMOUSEKEYS            : constant := 55;
   SPI_GETSHOWSOUNDS           : constant := 56;
   SPI_SETSHOWSOUNDS           : constant := 57;
   SPI_GETSTICKYKEYS           : constant := 58;
   SPI_SETSTICKYKEYS           : constant := 59;
   SPI_GETACCESSTIMEOUT        : constant := 60;
   SPI_SETACCESSTIMEOUT        : constant := 61;
   SPI_GETSOUNDSENTRY          : constant := 64;
   SPI_SETSOUNDSENTRY          : constant := 65;
   SPIF_UPDATEINIFILE          : constant := 16#1#;
   SPIF_SENDWININICHANGE       : constant := 16#2#;
   SPIF_SENDCHANGE             : constant := 16#2#;
   SSWF_NONE                   : constant := 0;
   SSWF_TITLE                  : constant := 1;
   SSWF_WINDOW                 : constant := 2;
   SSWF_DISPLAY                : constant := 3;
   SSWF_CUSTOM                 : constant := 4;
   SSGF_NONE                   : constant := 0;
   SSGF_DISPLAY                : constant := 3;
   SSTF_NONE                   : constant := 0;
   SSTF_CHARS                  : constant := 1;
   SSTF_BORDER                 : constant := 2;
   SSTF_DISPLAY                : constant := 3;
   FKF_FILTERKEYSON            : constant := 16#1#;
   FKF_AVAILABLE               : constant := 16#2#;
   FKF_HOTKEYACTIVE            : constant := 16#4#;
   FKF_CONFIRMHOTKEY           : constant := 16#8#;
   FKF_HOTKEYSOUND             : constant := 16#10#;
   FKF_INDICATOR               : constant := 16#20#;
   FKF_CLICKON                 : constant := 16#40#;
   SKF_STICKYKEYSON            : constant := 16#1#;
   SKF_AVAILABLE               : constant := 16#2#;
   SKF_HOTKEYACTIVE            : constant := 16#4#;
   SKF_CONFIRMHOTKEY           : constant := 16#8#;
   SKF_HOTKEYSOUND             : constant := 16#10#;
   SKF_INDICATOR               : constant := 16#20#;
   SKF_AUDIBLEFEEDBACK         : constant := 16#40#;
   SKF_TRISTATE                : constant := 16#80#;
   SKF_TWOKEYSOFF              : constant := 16#100#;
   MKF_MOUSEKEYSON             : constant := 16#1#;
   MKF_AVAILABLE               : constant := 16#2#;
   MKF_HOTKEYACTIVE            : constant := 16#4#;
   MKF_CONFIRMHOTKEY           : constant := 16#8#;
   MKF_HOTKEYSOUND             : constant := 16#10#;
   MKF_INDICATOR               : constant := 16#20#;
   MKF_MODIFIERS               : constant := 16#40#;
   MKF_REPLACENUMBERS          : constant := 16#80#;
   ATF_TIMEOUTON               : constant := 16#1#;
   ATF_ONOFFFEEDBACK           : constant := 16#2#;
   SSF_SOUNDSENTRYON           : constant := 16#1#;
   SSF_AVAILABLE               : constant := 16#2#;
   SSF_INDICATOR               : constant := 16#4#;
   TKF_TOGGLEKEYSON            : constant := 16#1#;
   TKF_AVAILABLE               : constant := 16#2#;
   TKF_HOTKEYACTIVE            : constant := 16#4#;
   TKF_CONFIRMHOTKEY           : constant := 16#8#;
   TKF_HOTKEYSOUND             : constant := 16#10#;
   TKF_INDICATOR               : constant := 16#20#;
   SLE_ERROR                   : constant := 16#1#;
   SLE_MINORERROR              : constant := 16#2#;
   SLE_WARNING                 : constant := 16#3#;

   type MENUTEMPLATEA is new Win32.VOID;
   type MENUTEMPLATEW is new Win32.VOID;
   subtype MENUTEMPLATE is MENUTEMPLATEA;
   type HELPPOLY is new Win32.DWORD;

   subtype HDWP is Win32.Winnt.HANDLE;
   type LPMENUTEMPLATEA is access all MENUTEMPLATEA;
   type LPMENUTEMPLATEW is access all MENUTEMPLATEW;
   subtype LPMENUTEMPLATE is LPMENUTEMPLATEA;

   type CREATESTRUCTA;
   type CBT_CREATEWNDA;
   type CREATESTRUCTW;
   type CBT_CREATEWNDW;
   type CBTACTIVATESTRUCT;
   type EVENTMSG;
   type CWPSTRUCT;
   type DEBUGHOOKINFO;
   type MOUSEHOOKSTRUCT;
   type WNDCLASSA;
   type WNDCLASSW;
   type MSG;
   type MINMAXINFO;
   type COPYDATASTRUCT;
   type WINDOWPOS;
   type NCCALCSIZE_PARAMS;
   type ACCEL;
   type PAINTSTRUCT;
   type WINDOWPLACEMENT;
   type MEASUREITEMSTRUCT;
   type DRAWITEMSTRUCT;
   type DELETEITEMSTRUCT;
   type COMPAREITEMSTRUCT;
   type DLGTEMPLATE;
   type DLGITEMTEMPLATE;
   type MENUITEMTEMPLATEHEADER;
   type MENUITEMTEMPLATE;
   type ICONINFO;
   type MDICREATESTRUCTA;
   type MDICREATESTRUCTW;
   type CLIENTCREATESTRUCT;
   type MULTIKEYHELPA;
   type MULTIKEYHELPW;
   type HELPWININFOA;
   type HELPWININFOW;
   type FILTERKEYS;
   type STICKYKEYS;
   type MOUSEKEYS;
   type ACCESSTIMEOUT;
   type SOUNDSENTRYA;
   type SOUNDSENTRYW;
   type TOGGLEKEYS;

   type LPCBT_CREATEWNDA is access all CBT_CREATEWNDA;
   type LPCBT_CREATEWNDW is access all CBT_CREATEWNDW;
   subtype LPCBT_CREATEWND is LPCBT_CREATEWNDA;
   type LPCBTACTIVATESTRUCT is access all CBTACTIVATESTRUCT;
   type PEVENTMSGMSG is access all EVENTMSG;
   subtype NPEVENTMSGMSG is PEVENTMSGMSG;
   subtype LPEVENTMSGMSG is PEVENTMSGMSG;
   type PEVENTMSG is access all EVENTMSG;
   subtype NPEVENTMSG is PEVENTMSG;
   subtype LPEVENTMSG is PEVENTMSG;
   type PCWPSTRUCT is access all CWPSTRUCT;
   subtype NPCWPSTRUCT is PCWPSTRUCT;
   subtype LPCWPSTRUCT is PCWPSTRUCT;
   type PDEBUGHOOKINFO is access all DEBUGHOOKINFO;
   subtype NPDEBUGHOOKINFO is PDEBUGHOOKINFO;
   subtype LPDEBUGHOOKINFO is PDEBUGHOOKINFO;
   type PMOUSEHOOKSTRUCT is access all MOUSEHOOKSTRUCT;
   subtype LPMOUSEHOOKSTRUCT is PMOUSEHOOKSTRUCT;
   type PWNDCLASSA is access all WNDCLASSA;
   subtype NPWNDCLASSA is PWNDCLASSA;
   subtype LPWNDCLASSA is PWNDCLASSA;
   subtype PWNDCLASS is PWNDCLASSA;
   subtype NPWNDCLASS is PWNDCLASSA;
   subtype LPWNDCLASS is PWNDCLASSA;
   type PWNDCLASSW is access all WNDCLASSW;
   subtype NPWNDCLASSW is PWNDCLASSW;
   subtype LPWNDCLASSW is PWNDCLASSW;
   type PMSG is access all MSG;
   subtype NPMSG is PMSG;
   subtype LPMSG is PMSG;
   type PMINMAXINFO is access all MINMAXINFO;
   subtype LPMINMAXINFO is PMINMAXINFO;
   type PCOPYDATASTRUCT is access all COPYDATASTRUCT;
   type PWINDOWPOS is access all WINDOWPOS;
   subtype LPWINDOWPOS is PWINDOWPOS;
   type LPNCCALCSIZE_PARAMS is access all NCCALCSIZE_PARAMS;
   type LPACCEL is access all ACCEL;
   type PPAINTSTRUCT is access all PAINTSTRUCT;
   subtype NPPAINTSTRUCT is PPAINTSTRUCT;
   subtype LPPAINTSTRUCT is PPAINTSTRUCT;
   type LPCREATESTRUCTA is access all CREATESTRUCTA;
   subtype LPCREATESTRUCT is LPCREATESTRUCTA;
   type LPCREATESTRUCTW is access all CREATESTRUCTW;
   type PWINDOWPLACEMENT is access all WINDOWPLACEMENT;
   subtype LPWINDOWPLACEMENT is PWINDOWPLACEMENT;
   type PMEASUREITEMSTRUCT is access all MEASUREITEMSTRUCT;
   subtype LPMEASUREITEMSTRUCT is PMEASUREITEMSTRUCT;
   type PDRAWITEMSTRUCT is access all DRAWITEMSTRUCT;
   subtype LPDRAWITEMSTRUCT is PDRAWITEMSTRUCT;
   type PDELETEITEMSTRUCT is access all DELETEITEMSTRUCT;
   subtype LPDELETEITEMSTRUCT is PDELETEITEMSTRUCT;
   type PCOMPAREITEMSTRUCT is access all COMPAREITEMSTRUCT;
   subtype LPCOMPAREITEMSTRUCT is PCOMPAREITEMSTRUCT;
   type LPDLGTEMPLATEA is access all DLGTEMPLATE;
   subtype LPDLGTEMPLATE is LPDLGTEMPLATEA;
   type LPDLGTEMPLATEW is access all DLGTEMPLATE;
   type PDLGITEMTEMPLATEA is access all DLGITEMTEMPLATE;
   subtype PDLGITEMTEMPLATE is PDLGITEMTEMPLATEA;
   type PDLGITEMTEMPLATEW is access all DLGITEMTEMPLATE;
   type LPDLGITEMTEMPLATEA is access all DLGITEMTEMPLATE;
   subtype LPDLGITEMTEMPLATE is LPDLGITEMTEMPLATEA;
   type LPDLGITEMTEMPLATEW is access all DLGITEMTEMPLATE;
   type PMENUITEMTEMPLATEHEADER is access all MENUITEMTEMPLATEHEADER;
   type PMENUITEMTEMPLATE is access all MENUITEMTEMPLATE;
   type PICONINFO is access all ICONINFO;
   type LPMDICREATESTRUCTA is access all MDICREATESTRUCTA;
   subtype LPMDICREATESTRUCT is LPMDICREATESTRUCTA;
   type LPMDICREATESTRUCTW is access all MDICREATESTRUCTW;
   type LPCLIENTCREATESTRUCT is access all CLIENTCREATESTRUCT;
   type PMULTIKEYHELPA is access all MULTIKEYHELPA;
   subtype LPMULTIKEYHELPA is PMULTIKEYHELPA;
   subtype PMULTIKEYHELP is PMULTIKEYHELPA;
   subtype LPMULTIKEYHELP is PMULTIKEYHELPA;
   type PMULTIKEYHELPW is access all MULTIKEYHELPW;
   subtype LPMULTIKEYHELPW is PMULTIKEYHELPW;
   type PHELPWININFOA is access all HELPWININFOA;
   subtype LPHELPWININFOA is PHELPWININFOA;
   subtype PHELPWININFO is PHELPWININFOA;
   subtype LPHELPWININFO is PHELPWININFOA;
   type PHELPWININFOW is access all HELPWININFOW;
   subtype LPHELPWININFOW is PHELPWININFOW;
   type LPFILTERKEYS is access all FILTERKEYS;
   type LPSTICKYKEYS is access all STICKYKEYS;
   type LPMOUSEKEYS is access all MOUSEKEYS;
   type LPACCESSTIMEOUT is access all ACCESSTIMEOUT;
   type LPSOUNDSENTRYA is access all SOUNDSENTRYA;
   subtype LPSOUNDSENTRY is LPSOUNDSENTRYA;
   type LPSOUNDSENTRYW is access all SOUNDSENTRYW;
   type LPTOGGLEKEYS is access all TOGGLEKEYS;

   type WNDPROC is access function
     (hwnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, WNDPROC);
   type DLGPROC is access function
     (hwnd   : Win32.Windef.HWND;
      msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.BOOL;
   pragma Convention (Stdcall, DLGPROC);
   type TIMERPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      uMsg    : Win32.UINT;
      idEvent : Win32.UINT;
      dwTime  : Win32.DWORD);
   pragma Convention (Stdcall, TIMERPROC);
   type GRAYSTRINGPROC is access function
     (hdc     : Win32.Windef.HDC;
      lpData  : Win32.LPARAM;
      cchdata : Win32.INT)
      return Win32.BOOL;
   pragma Convention (Stdcall, GRAYSTRINGPROC);
   type WNDENUMPROC is access function
     (hwnd   : Win32.Windef.HWND;
      lParam : Win32.LPARAM)
      return Win32.BOOL;
   pragma Convention (Stdcall, WNDENUMPROC);
   type HOOKPROC is access function
     (code   : Win32.INT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, HOOKPROC);
   type SENDASYNCPROC is access procedure
     (hwnd    : Win32.Windef.HWND;
      uMsg    : Win32.UINT;
      dwData  : Win32.DWORD;
      lResult : Win32.LRESULT);
   pragma Convention (Stdcall, SENDASYNCPROC);
   type PROPENUMPROCA is access function
     (hwnd       : Win32.Windef.HWND;
      lpszString : Win32.LPCSTR;
      hData      : Win32.Winnt.HANDLE)
      return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCA);
   type PROPENUMPROCW is access function
     (hwnd       : Win32.Windef.HWND;
      lpszString : Win32.LPCWSTR;
      hData      : Win32.Winnt.HANDLE)
      return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCW);
   type PROPENUMPROCEXA is access function
     (hwnd       : Win32.Windef.HWND;
      lpszString : Win32.LPSTR;
      hData      : Win32.Winnt.HANDLE;
      dwData     : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCEXA);
   type PROPENUMPROCEXW is access function
     (hwnd       : Win32.Windef.HWND;
      lpszString : Win32.LPWSTR;
      hData      : Win32.Winnt.HANDLE;
      dwData     : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCEXW);
   type EDITWORDBREAKPROCA is access function
     (lpch       : Win32.LPSTR;
      ichCurrent : Win32.INT;
      cch        : Win32.INT;
      code       : Win32.INT)
      return Win32.INT;
   pragma Convention (Stdcall, EDITWORDBREAKPROCA);
   type EDITWORDBREAKPROCW is access function
     (lpch       : Win32.LPWSTR;
      ichCurrent : Win32.INT;
      cch        : Win32.INT;
      code       : Win32.INT)
      return Win32.INT;
   pragma Convention (Stdcall, EDITWORDBREAKPROCW);
   type PROPENUMPROC is access function return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROC);
   type PROPENUMPROCEX is access function return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCEX);
   type EDITWORDBREAKPROC is access function return Win32.INT;
   pragma Convention (Stdcall, EDITWORDBREAKPROC);

   type CREATESTRUCTA is record
      lpCreateParams : Win32.LPVOID;
      hInstance      : Win32.Windef.HINSTANCE;
      hMenu          : Win32.Windef.HMENU;
      hwndParent     : Win32.Windef.HWND;
      cy             : Win32.INT;
      cx             : Win32.INT;
      y              : Win32.INT;
      x              : Win32.INT;
      style          : Win32.LONG;
      lpszName       : Win32.LPCSTR;
      lpszClass      : Win32.LPCSTR;
      dwExStyle      : Win32.DWORD;
   end record;

   type CBT_CREATEWNDA is record
      lpcs            : LPCREATESTRUCTA;
      hwndInsertAfter : Win32.Windef.HWND;
   end record;

   type CREATESTRUCTW is record
      lpCreateParams : Win32.LPVOID;
      hInstance      : Win32.Windef.HINSTANCE;
      hMenu          : Win32.Windef.HMENU;
      hwndParent     : Win32.Windef.HWND;
      cy             : Win32.INT;
      cx             : Win32.INT;
      y              : Win32.INT;
      x              : Win32.INT;
      style          : Win32.LONG;
      lpszName       : Win32.LPCWSTR;
      lpszClass      : Win32.LPCWSTR;
      dwExStyle      : Win32.DWORD;
   end record;

   type CBT_CREATEWNDW is record
      lpcs            : LPCREATESTRUCTW;
      hwndInsertAfter : Win32.Windef.HWND;
   end record;

   subtype CBT_CREATEWND is CBT_CREATEWNDA;

   type CBTACTIVATESTRUCT is record
      fMouse     : Win32.BOOL;
      hWndActive : Win32.Windef.HWND;
   end record;

   type EVENTMSG is record
      message : Win32.UINT;
      paramL  : Win32.UINT;
      paramH  : Win32.UINT;
      time    : Win32.DWORD;
      hwnd    : Win32.Windef.HWND;
   end record;

   type CWPSTRUCT is record
      lParam  : Win32.LPARAM;
      wParam  : Win32.WPARAM;
      message : Win32.UINT;
      hwnd    : Win32.Windef.HWND;
   end record;

   type DEBUGHOOKINFO is record
      idThread          : Win32.DWORD;
      idThreadInstaller : Win32.DWORD;
      lParam            : Win32.LPARAM;
      wParam            : Win32.WPARAM;
      code              : Win32.INT;
   end record;

   type MOUSEHOOKSTRUCT is record
      pt           : Win32.Windef.POINT;
      hwnd         : Win32.Windef.HWND;
      wHitTestCode : Win32.UINT;
      dwExtraInfo  : Win32.DWORD;
   end record;

   type WNDCLASSA is record
      style         : Win32.UINT;
      lpfnWndProc   : WNDPROC;
      cbClsExtra    : Win32.INT;
      cbWndExtra    : Win32.INT;
      hInstance     : Win32.Windef.HINSTANCE;
      hIcon         : Win32.Windef.HICON;
      hCursor       : Win32.Windef.HCURSOR;
      hbrBackground : Win32.Windef.HBRUSH;
      lpszMenuName  : Win32.LPCSTR;
      lpszClassName : Win32.LPCSTR;
   end record;

   type WNDCLASSW is record
      style         : Win32.UINT;
      lpfnWndProc   : WNDPROC;
      cbClsExtra    : Win32.INT;
      cbWndExtra    : Win32.INT;
      hInstance     : Win32.Windef.HINSTANCE;
      hIcon         : Win32.Windef.HICON;
      hCursor       : Win32.Windef.HCURSOR;
      hbrBackground : Win32.Windef.HBRUSH;
      lpszMenuName  : Win32.LPCWSTR;
      lpszClassName : Win32.LPCWSTR;
   end record;

   subtype WNDCLASS is WNDCLASSA;

   type MSG is record
      hwnd    : Win32.Windef.HWND;
      message : Win32.UINT;
      wParam  : Win32.WPARAM;
      lParam  : Win32.LPARAM;
      time    : Win32.DWORD;
      pt      : Win32.Windef.POINT;
   end record;

   type MINMAXINFO is record
      ptReserved     : Win32.Windef.POINT;
      ptMaxSize      : Win32.Windef.POINT;
      ptMaxPosition  : Win32.Windef.POINT;
      ptMinTrackSize : Win32.Windef.POINT;
      ptMaxTrackSize : Win32.Windef.POINT;
   end record;

   type COPYDATASTRUCT is record
      dwData : Win32.DWORD;
      cbData : Win32.DWORD;
      lpData : Win32.PVOID;
   end record;

   type WINDOWPOS is record
      hwnd            : Win32.Windef.HWND;
      hwndInsertAfter : Win32.Windef.HWND;
      x               : Win32.INT;
      y               : Win32.INT;
      cx              : Win32.INT;
      cy              : Win32.INT;
      flags           : Win32.UINT;
   end record;

   type RECT_Array is array (Integer range 0 .. 2) of Win32.Windef.RECT;

   type NCCALCSIZE_PARAMS is record
      rgrc  : RECT_Array;
      lppos : PWINDOWPOS;
   end record;

   type ACCEL is record
      fVirt : Win32.BYTE;
      key   : Win32.WORD;
      cmd   : Win32.WORD;
   end record;

   type PAINTSTRUCT is record
      hdc         : Win32.Windef.HDC;
      fErase      : Win32.BOOL;
      rcPaint     : Win32.Windef.RECT;
      fRestore    : Win32.BOOL;
      fIncUpdate  : Win32.BOOL;
      rgbReserved : Win32.BYTE_Array (0 .. 31);
   end record;

   subtype CREATESTRUCT is CREATESTRUCTA;

   type WINDOWPLACEMENT is record
      length           : Win32.UINT;
      flags            : Win32.UINT;
      showCmd          : Win32.UINT;
      ptMinPosition    : Win32.Windef.POINT;
      ptMaxPosition    : Win32.Windef.POINT;
      rcNormalPosition : Win32.Windef.RECT;
   end record;

   type MEASUREITEMSTRUCT is record
      CtlType    : Win32.UINT;
      CtlID      : Win32.UINT;
      itemID     : Win32.UINT;
      itemWidth  : Win32.UINT;
      itemHeight : Win32.UINT;
      itemData   : Win32.DWORD;
   end record;

   type DRAWITEMSTRUCT is record
      CtlType    : Win32.UINT;
      CtlID      : Win32.UINT;
      itemID     : Win32.UINT;
      itemAction : Win32.UINT;
      itemState  : Win32.UINT;
      hwndItem   : Win32.Windef.HWND;
      hDC        : Win32.Windef.HDC;
      rcItem     : Win32.Windef.RECT;
      itemData   : Win32.DWORD;
   end record;

   type DELETEITEMSTRUCT is record
      CtlType  : Win32.UINT;
      CtlID    : Win32.UINT;
      itemID   : Win32.UINT;
      hwndItem : Win32.Windef.HWND;
      itemData : Win32.UINT;
   end record;

   type COMPAREITEMSTRUCT is record
      CtlType    : Win32.UINT;
      CtlID      : Win32.UINT;
      hwndItem   : Win32.Windef.HWND;
      itemID1    : Win32.UINT;
      itemData1  : Win32.DWORD;
      itemID2    : Win32.UINT;
      itemData2  : Win32.DWORD;
      dwLocaleId : Win32.DWORD;
   end record;

   type DLGTEMPLATE is record
      style           : Win32.DWORD;
      dwExtendedStyle : Win32.DWORD;
      cdit            : Win32.WORD;
      x               : Win32.SHORT;
      y               : Win32.SHORT;
      cx              : Win32.SHORT;
      cy              : Win32.SHORT;
   end record;

   for DLGTEMPLATE use record
      style           at 0 range 0 .. 31;
      dwExtendedStyle at 4 range 0 .. 31;
      cdit            at 8 range 0 .. 15;
      x               at 10 range 0 .. 15;
      y               at 12 range 0 .. 15;
      cx              at 14 range 0 .. 15;
      cy              at 16 range 0 .. 15;
   end record;

   for DLGTEMPLATE'Size use 18 * 8;

   type DLGITEMTEMPLATE is record
      style           : Win32.DWORD;
      dwExtendedStyle : Win32.DWORD;
      x               : Win32.SHORT;
      y               : Win32.SHORT;
      cx              : Win32.SHORT;
      cy              : Win32.SHORT;
      id              : Win32.WORD;
   end record;

   for DLGITEMTEMPLATE use record
      style           at 0 range 0 .. 31;
      dwExtendedStyle at 4 range 0 .. 31;
      x               at 8 range 0 .. 15;
      y               at 10 range 0 .. 15;
      cx              at 12 range 0 .. 15;
      cy              at 14 range 0 .. 15;
      id              at 16 range 0 .. 15;
   end record;

   for DLGITEMTEMPLATE'Size use 18 * 8;

   type MENUITEMTEMPLATEHEADER is record
      versionNumber : Win32.WORD;
      offset        : Win32.WORD;
   end record;

   type MENUITEMTEMPLATE is record
      mtOption : Win32.WORD;
      mtID     : Win32.WORD;
      mtString : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type ICONINFO is record
      fIcon    : Win32.BOOL;
      xHotspot : Win32.DWORD;
      yHotspot : Win32.DWORD;
      hbmMask  : Win32.Windef.HBITMAP;
      hbmColor : Win32.Windef.HBITMAP;
   end record;

   type MDICREATESTRUCTA is record
      szClass : Win32.LPCSTR;
      szTitle : Win32.LPCSTR;
      hOwner  : Win32.Winnt.HANDLE;
      x       : Win32.INT;
      y       : Win32.INT;
      cx      : Win32.INT;
      cy      : Win32.INT;
      style   : Win32.DWORD;
      lParam  : Win32.LPARAM;
   end record;

   type MDICREATESTRUCTW is record
      szClass : Win32.LPCWSTR;
      szTitle : Win32.LPCWSTR;
      hOwner  : Win32.Winnt.HANDLE;
      x       : Win32.INT;
      y       : Win32.INT;
      cx      : Win32.INT;
      cy      : Win32.INT;
      style   : Win32.DWORD;
      lParam  : Win32.LPARAM;
   end record;

   subtype MDICREATESTRUCT is MDICREATESTRUCTA;

   type CLIENTCREATESTRUCT is record
      hWindowMenu  : Win32.Winnt.HANDLE;
      idFirstChild : Win32.UINT;
   end record;

   type MULTIKEYHELPA is record
      mkSize      : Win32.DWORD;
      mkKeylist   : Win32.CHAR;
      szKeyphrase : Win32.CHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type MULTIKEYHELPW is record
      mkSize      : Win32.DWORD;
      mkKeylist   : Win32.WCHAR;
      szKeyphrase : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   subtype MULTIKEYHELP is MULTIKEYHELPA;

   type HELPWININFOA is record
      wStructSize : Win32.INT;
      x           : Win32.INT;
      y           : Win32.INT;
      dx          : Win32.INT;
      dy          : Win32.INT;
      wMax        : Win32.INT;
      rgchMember  : Win32.CHAR_Array (0 .. 1);
   end record;

   type HELPWININFOW is record
      wStructSize : Win32.INT;
      x           : Win32.INT;
      y           : Win32.INT;
      dx          : Win32.INT;
      dy          : Win32.INT;
      wMax        : Win32.INT;
      rgchMember  : Win32.WCHAR_Array (0 .. 1);
   end record;

   subtype HELPWININFO is HELPWININFOA;

   type FILTERKEYS is record
      cbSize      : Win32.DWORD;
      dwFlags     : Win32.DWORD;
      iWaitMSec   : Win32.DWORD;
      iDelayMSec  : Win32.DWORD;
      iRepeatMSec : Win32.DWORD;
      iBounceMSec : Win32.DWORD;
   end record;

   type STICKYKEYS is record
      cbSize  : Win32.DWORD;
      dwFlags : Win32.DWORD;
   end record;

   type MOUSEKEYS is record
      cbSize          : Win32.DWORD;
      dwFlags         : Win32.DWORD;
      iMaxSpeed       : Win32.DWORD;
      iTimeToMaxSpeed : Win32.DWORD;
      iCtrlSpeed      : Win32.DWORD;
      dwReserved1     : Win32.DWORD;
      dwReserved2     : Win32.DWORD;
   end record;

   type ACCESSTIMEOUT is record
      cbSize       : Win32.DWORD;
      dwFlags      : Win32.DWORD;
      iTimeOutMSec : Win32.DWORD;
   end record;

   type SOUNDSENTRYA is record
      cbSize                 : Win32.DWORD;
      dwFlags                : Win32.DWORD;
      iFSTextEffect          : Win32.DWORD;
      iFSTextEffectMSec      : Win32.DWORD;
      iFSTextEffectColorBits : Win32.DWORD;
      iFSGrafEffect          : Win32.DWORD;
      iFSGrafEffectMSec      : Win32.DWORD;
      iFSGrafEffectColor     : Win32.DWORD;
      iWindowsEffect         : Win32.DWORD;
      iWindowsEffectMSec     : Win32.DWORD;
      lpszWindowsEffectDLL   : Win32.LPSTR;
      iWindowsEffectOrdinal  : Win32.DWORD;
   end record;

   type SOUNDSENTRYW is record
      cbSize                 : Win32.DWORD;
      dwFlags                : Win32.DWORD;
      iFSTextEffect          : Win32.DWORD;
      iFSTextEffectMSec      : Win32.DWORD;
      iFSTextEffectColorBits : Win32.DWORD;
      iFSGrafEffect          : Win32.DWORD;
      iFSGrafEffectMSec      : Win32.DWORD;
      iFSGrafEffectColor     : Win32.DWORD;
      iWindowsEffect         : Win32.DWORD;
      iWindowsEffectMSec     : Win32.DWORD;
      lpszWindowsEffectDLL   : Win32.LPWSTR;
      iWindowsEffectOrdinal  : Win32.DWORD;
   end record;

   subtype SOUNDSENTRY is SOUNDSENTRYA;

   type TOGGLEKEYS is record
      cbSize  : Win32.DWORD;
      dwFlags : Win32.DWORD;
   end record;

   type ac_MSG_t is access all MSG;
   type ac_WNDCLASSA_t is access all WNDCLASSA;
   type ac_WNDCLASSW_t is access all WNDCLASSW;
   type ac_WINDOWPLACEMENT_t is access all WINDOWPLACEMENT;
   type LPCDLGTEMPLATEA is access all DLGTEMPLATE;
   type LPCDLGTEMPLATEW is access all DLGTEMPLATE;
   type LPCDLGTEMPLATE is access all DLGTEMPLATE;
   type ac_PAINTt is access all PAINTSTRUCT;

   function wvsprintfA
     (lpOut   : Win32.LPSTR;
      lpFmt   : Win32.LPCSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function wvsprintf
     (lpOut   : Win32.LPSTR;
      lpFmt   : Win32.LPCSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames wvsprintfA;

   function wvsprintfW
     (lpOut   : Win32.LPWSTR;
      lpFmt   : Win32.LPCWSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function wsprintfA
     (lpOut   : LPSTR;
      lpFmt   : LPCSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function wsprintfW
     (lpOut   : LPWSTR;
      lpFmt   : LPCWSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function wsprintf
     (lpOut   : LPSTR;
      lpFmt   : LPCSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT renames wsprintfA;

   function LoadKeyboardLayoutA
     (pwszKLID : Win32.LPCSTR;
      Flags    : Win32.UINT)
      return Win32.Windef.HKL;

   function LoadKeyboardLayout
     (pwszKLID : Win32.LPCSTR;
      Flags    : Win32.UINT)
      return Win32.Windef.HKL renames LoadKeyboardLayoutA;

   function LoadKeyboardLayoutW
     (pwszKLID : Win32.LPCWSTR;
      Flags    : Win32.UINT)
      return Win32.Windef.HKL;

   function ActivateKeyboardLayout
     (hkl   : Win32.Windef.HKL;
      Flags : Win32.UINT)
      return Win32.BOOL;

   function UnloadKeyboardLayout (hkl : Win32.Windef.HKL) return Win32.BOOL;

   function GetKeyboardLayoutNameA
     (pwszKLID : Win32.LPSTR)
      return Win32.BOOL;

   function GetKeyboardLayoutName
     (pwszKLID : Win32.LPSTR)
      return Win32.BOOL renames GetKeyboardLayoutNameA;

   function GetKeyboardLayoutNameW
     (pwszKLID : Win32.LPWSTR)
      return Win32.BOOL;

   function GetThreadDesktop
     (idThread : Win32.DWORD)
      return Win32.Windef.HDESK;

   function GetProcessWindowStation return Win32.Windef.HWINSTA;

   function SetUserObjectSecurity
     (hObj         : Win32.Winnt.HANDLE;
      pSIRequested : Win32.Winnt.PSECURITY_INFORMATION;
      pSID         : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL;

   function GetUserObjectSecurity
     (hObj            : Win32.Winnt.HANDLE;
      pSIRequested    : Win32.Winnt.PSECURITY_INFORMATION;
      pSID            : Win32.Winnt.PSECURITY_DESCRIPTOR;
      nLength         : Win32.DWORD;
      lpnLengthNeeded : Win32.LPDWORD)
      return Win32.BOOL;

   procedure POINTSTOPOINT
     (PT  : out Win32.Windef.POINT;
      PTS : in Win32.Windef.POINTS);

   function POINTTOPOINTS
     (PT   : Win32.Windef.POINT)
      return Win32.Windef.POINTS;

   function MAKEWPARAM (L, H : WORD) return WPARAM;

   function MAKELPARAM (L, H : WORD) return LPARAM;

   function MAKELRESULT (L, H : WORD) return LRESULT;

   function RegisterWindowMessageA
     (lpString : Win32.LPCSTR)
      return Win32.UINT;

   function RegisterWindowMessage
     (lpString : Win32.LPCSTR)
      return Win32.UINT renames RegisterWindowMessageA;

   function RegisterWindowMessageW
     (lpString : Win32.LPCWSTR)
      return Win32.UINT;

   function GetMessageA
     (lpMsg         : access MSG;
      hWnd          : Win32.Windef.HWND;
      wMsgFilterMin : Win32.UINT;
      wMsgFilterMax : Win32.UINT)
      return Win32.BOOL;

   function GetMessage
     (lpMsg         : access MSG;
      hWnd          : Win32.Windef.HWND;
      wMsgFilterMin : Win32.UINT;
      wMsgFilterMax : Win32.UINT)
      return Win32.BOOL renames GetMessageA;

   function GetMessageW
     (lpMsg         : access MSG;
      hWnd          : Win32.Windef.HWND;
      wMsgFilterMin : Win32.UINT;
      wMsgFilterMax : Win32.UINT)
      return Win32.BOOL;

   function TranslateMessage (lpMsg : ac_MSG_t) return Win32.BOOL;

   function DispatchMessageA (lpMsg : ac_MSG_t) return Win32.LONG;

   function DispatchMessage (lpMsg : ac_MSG_t) return Win32.LONG renames
     DispatchMessageA;

   function DispatchMessageW (lpMsg : ac_MSG_t) return Win32.LONG;

   function SetMessageQueue (cMessagesMax : Win32.INT) return Win32.BOOL;

   function PeekMessageA
     (lpMsg         : access MSG;
      hWnd          : Win32.Windef.HWND;
      wMsgFilterMin : Win32.UINT;
      wMsgFilterMax : Win32.UINT;
      wRemoveMsg    : Win32.UINT)
      return Win32.BOOL;

   function PeekMessage
     (lpMsg         : access MSG;
      hWnd          : Win32.Windef.HWND;
      wMsgFilterMin : Win32.UINT;
      wMsgFilterMax : Win32.UINT;
      wRemoveMsg    : Win32.UINT)
      return Win32.BOOL renames PeekMessageA;

   function PeekMessageW
     (lpMsg         : access MSG;
      hWnd          : Win32.Windef.HWND;
      wMsgFilterMin : Win32.UINT;
      wMsgFilterMax : Win32.UINT;
      wRemoveMsg    : Win32.UINT)
      return Win32.BOOL;

   function RegisterHotKey
     (hWnd        : Win32.Windef.HWND;
      id          : Win32.INT;
      fsModifiers : Win32.UINT;
      vk          : Win32.UINT)
      return Win32.BOOL;

   function UnregisterHotKey
     (hWnd : Win32.Windef.HWND;
      id   : Win32.INT)
      return Win32.BOOL;

   function ExitWindows
     (dwReserved  : DWORD;
      uReturnCode : UINT)
      return Win32.BOOL;

   function ExitWindowsEx
     (uFlags     : Win32.UINT;
      dwReserved : Win32.DWORD)
      return Win32.BOOL;

   function SwapMouseButton (fSwap : Win32.BOOL) return Win32.BOOL;

   function GetMessagePos return Win32.DWORD;

   function GetMessageTime return Win32.LONG;

   function GetMessageExtraInfo return Win32.LONG;

   function SendMessageA
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function SendMessage
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT renames SendMessageA;

   function SendMessageW
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function SendMessageTimeoutA
     (hWnd       : Win32.Windef.HWND;
      Msg        : Win32.UINT;
      wParam     : Win32.WPARAM;
      lParam     : Win32.LPARAM;
      fuFlags    : Win32.UINT;
      uTimeout   : Win32.UINT;
      lpdwResult : Win32.LPDWORD)
      return Win32.LRESULT;

   function SendMessageTimeout
     (hWnd       : Win32.Windef.HWND;
      Msg        : Win32.UINT;
      wParam     : Win32.WPARAM;
      lParam     : Win32.LPARAM;
      fuFlags    : Win32.UINT;
      uTimeout   : Win32.UINT;
      lpdwResult : Win32.LPDWORD)
      return Win32.LRESULT renames SendMessageTimeoutA;

   function SendMessageTimeoutW
     (hWnd       : Win32.Windef.HWND;
      Msg        : Win32.UINT;
      wParam     : Win32.WPARAM;
      lParam     : Win32.LPARAM;
      fuFlags    : Win32.UINT;
      uTimeout   : Win32.UINT;
      lpdwResult : Win32.LPDWORD)
      return Win32.LRESULT;

   function SendNotifyMessageA
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.BOOL;

   function SendNotifyMessage
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.BOOL renames SendNotifyMessageA;

   function SendNotifyMessageW
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.BOOL;

   function SendMessageCallbackA
     (hWnd             : Win32.Windef.HWND;
      Msg              : Win32.UINT;
      wParam           : Win32.WPARAM;
      lParam           : Win32.LPARAM;
      lpResultCallBack : SENDASYNCPROC;
      dwData           : Win32.DWORD)
      return Win32.BOOL;

   function SendMessageCallback
     (hWnd             : Win32.Windef.HWND;
      Msg              : Win32.UINT;
      wParam           : Win32.WPARAM;
      lParam           : Win32.LPARAM;
      lpResultCallBack : SENDASYNCPROC;
      dwData           : Win32.DWORD)
      return Win32.BOOL renames SendMessageCallbackA;

   function SendMessageCallbackW
     (hWnd             : Win32.Windef.HWND;
      Msg              : Win32.UINT;
      wParam           : Win32.WPARAM;
      lParam           : Win32.LPARAM;
      lpResultCallBack : SENDASYNCPROC;
      dwData           : Win32.DWORD)
      return Win32.BOOL;

   function PostMessageA
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.BOOL;

   function PostMessage
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.BOOL renames PostMessageA;

   function PostMessageW
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.BOOL;

   function PostThreadMessageA
     (idThread : Win32.DWORD;
      Msg      : Win32.UINT;
      wParam   : Win32.WPARAM;
      lParam   : Win32.LPARAM)
      return Win32.BOOL;

   function PostThreadMessage
     (idThread : Win32.DWORD;
      Msg      : Win32.UINT;
      wParam   : Win32.WPARAM;
      lParam   : Win32.LPARAM)
      return Win32.BOOL renames PostThreadMessageA;

   function PostThreadMessageW
     (idThread : Win32.DWORD;
      Msg      : Win32.UINT;
      wParam   : Win32.WPARAM;
      lParam   : Win32.LPARAM)
      return Win32.BOOL;
   function PostAppMessageA
     (idThread : DWORD;
      Msg      : UINT;
      wParam   : Win32.WPARAM;
      lParam   : Win32.LPARAM)
      return BOOL renames PostThreadMessageA;

   function PostAppMessageW
     (idThread : DWORD;
      Msg      : UINT;
      wParam   : Win32.WPARAM;
      lParam   : Win32.LPARAM)
      return BOOL renames PostThreadMessageW;

   function PostAppMessage
     (idThread : DWORD;
      Msg      : UINT;
      wParam   : Win32.WPARAM;
      lParam   : Win32.LPARAM)
      return BOOL renames PostThreadMessage;

   function AttachThreadInput
     (idAttach   : Win32.DWORD;
      idAttachTo : Win32.DWORD;
      fAttach    : Win32.BOOL)
      return Win32.BOOL;

   function ReplyMessage (lResult : Win32.LRESULT) return Win32.BOOL;

   function WaitMessage return Win32.BOOL;

   function WaitForInputIdle
     (hProcess       : Win32.Winnt.HANDLE;
      dwMilliseconds : Win32.DWORD)
      return Win32.DWORD;

   function DefWindowProcA
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function DefWindowProc
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT renames DefWindowProcA;

   function DefWindowProcW
     (hWnd   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   procedure PostQuitMessage (nExitCode : Win32.INT);

   function CallWindowProcA
     (lpPrevWndFunc : WNDPROC;
      hWnd          : Win32.Windef.HWND;
      Msg           : Win32.UINT;
      wParam        : Win32.WPARAM;
      lParam        : Win32.LPARAM)
      return Win32.LRESULT;

   function CallWindowProc
     (lpPrevWndFunc : WNDPROC;
      hWnd          : Win32.Windef.HWND;
      Msg           : Win32.UINT;
      wParam        : Win32.WPARAM;
      lParam        : Win32.LPARAM)
      return Win32.LRESULT renames CallWindowProcA;

   function CallWindowProcW
     (lpPrevWndFunc : WNDPROC;
      hWnd          : Win32.Windef.HWND;
      Msg           : Win32.UINT;
      wParam        : Win32.WPARAM;
      lParam        : Win32.LPARAM)
      return Win32.LRESULT;

   function InSendMessage return Win32.BOOL;

   function GetDoubleClickTime return Win32.UINT;

   function SetDoubleClickTime (uInterval : Win32.UINT) return Win32.BOOL;

   function RegisterClassA
     (lpWndClass : ac_WNDCLASSA_t)
      return Win32.Windef.ATOM;

   function RegisterClass
     (lpWndClass : ac_WNDCLASSA_t)
      return Win32.Windef.ATOM renames RegisterClassA;

   function RegisterClassW
     (lpWndClass : access WNDCLASSW)
      return Win32.Windef.ATOM;

   function UnregisterClassA
     (lpClassName : Win32.LPCSTR;
      hInstance   : Win32.Windef.HINSTANCE)
      return Win32.BOOL;

   function UnregisterClass
     (lpClassName : Win32.LPCSTR;
      hInstance   : Win32.Windef.HINSTANCE)
      return Win32.BOOL renames UnregisterClassA;

   function UnregisterClassW
     (lpClassName : Win32.LPCWSTR;
      hInstance   : Win32.Windef.HINSTANCE)
      return Win32.BOOL;

   function GetClassInfoA
     (hInstance   : Win32.Windef.HINSTANCE;
      lpClassName : Win32.LPCSTR;
      lpWndClass  : access WNDCLASSA)
      return Win32.BOOL;

   function GetClassInfo
     (hInstance   : Win32.Windef.HINSTANCE;
      lpClassName : Win32.LPCSTR;
      lpWndClass  : access WNDCLASSA)
      return Win32.BOOL renames GetClassInfoA;

   function GetClassInfoW
     (hInstance   : Win32.Windef.HINSTANCE;
      lpClassName : Win32.LPCWSTR;
      lpWndClass  : access WNDCLASSW)
      return Win32.BOOL;

   function CreateWindowExA
     (dwExStyle    : Win32.DWORD;
      lpClassName  : Win32.LPCSTR;
      lpWindowName : Win32.LPCSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hMenu        : Win32.Windef.HMENU;
      hInstance    : Win32.Windef.HINSTANCE;
      lpParam      : Win32.LPVOID)
      return Win32.Windef.HWND;

   function CreateWindowEx
     (dwExStyle    : Win32.DWORD;
      lpClassName  : Win32.LPCSTR;
      lpWindowName : Win32.LPCSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hMenu        : Win32.Windef.HMENU;
      hInstance    : Win32.Windef.HINSTANCE;
      lpParam      : Win32.LPVOID)
      return Win32.Windef.HWND renames CreateWindowExA;

   function CreateWindowExW
     (dwExStyle    : Win32.DWORD;
      lpClassName  : Win32.LPCWSTR;
      lpWindowName : Win32.LPCWSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hMenu        : Win32.Windef.HMENU;
      hInstance    : Win32.Windef.HINSTANCE;
      lpParam      : Win32.LPVOID)
      return Win32.Windef.HWND;

   function CreateWindowA
     (lpClassName  : Win32.LPCSTR;
      lpWindowName : Win32.LPCSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hMenu        : Win32.Windef.HMENU;
      hInstance    : Win32.Windef.HINSTANCE;
      lpParam      : Win32.LPVOID)
      return Win32.Windef.HWND;

   function CreateWindow
     (lpClassName  : Win32.LPCSTR;
      lpWindowName : Win32.LPCSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hMenu        : Win32.Windef.HMENU;
      hInstance    : Win32.Windef.HINSTANCE;
      lpParam      : Win32.LPVOID)
      return Win32.Windef.HWND renames CreateWindowA;

   function CreateWindowW
     (lpClassName  : Win32.LPCWSTR;
      lpWindowName : Win32.LPCWSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hMenu        : Win32.Windef.HMENU;
      hInstance    : Win32.Windef.HINSTANCE;
      lpParam      : Win32.LPVOID)
      return Win32.Windef.HWND;

   function IsWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function IsMenu (hMenu : Win32.Windef.HMENU) return Win32.BOOL;

   function IsChild
     (hWndParent : Win32.Windef.HWND;
      hWnd       : Win32.Windef.HWND)
      return Win32.BOOL;

   function DestroyWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function ShowWindow
     (hWnd     : Win32.Windef.HWND;
      nCmdShow : Win32.INT)
      return Win32.BOOL;

   function FlashWindow
     (hWnd    : Win32.Windef.HWND;
      bInvert : Win32.BOOL)
      return Win32.BOOL;

   function ShowOwnedPopups
     (hWnd  : Win32.Windef.HWND;
      fShow : Win32.BOOL)
      return Win32.BOOL;

   function OpenIcon (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function CloseWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function MoveWindow
     (hWnd     : Win32.Windef.HWND;
      X        : Win32.INT;
      Y        : Win32.INT;
      nWidth   : Win32.INT;
      nHeight  : Win32.INT;
      bRepaint : Win32.BOOL)
      return Win32.BOOL;

   function SetWindowPos
     (hWnd            : Win32.Windef.HWND;
      hWndInsertAfter : Win32.Windef.HWND;
      X               : Win32.INT;
      Y               : Win32.INT;
      cx              : Win32.INT;
      cy              : Win32.INT;
      uFlags          : Win32.UINT)
      return Win32.BOOL;

   function GetWindowPlacement
     (hWnd    : Win32.Windef.HWND;
      lpwndpl : access WINDOWPLACEMENT)
      return Win32.BOOL;

   function SetWindowPlacement
     (hWnd    : Win32.Windef.HWND;
      lpwndpl : ac_WINDOWPLACEMENT_t)
      return Win32.BOOL;

   function BeginDeferWindowPos (nNumWindows : Win32.INT) return HDWP;

   function DeferWindowPos
     (hWinPosInfo     : HDWP;
      hWnd            : Win32.Windef.HWND;
      hWndInsertAfter : Win32.Windef.HWND;
      x               : Win32.INT;
      y               : Win32.INT;
      cx              : Win32.INT;
      cy              : Win32.INT;
      uFlags          : Win32.UINT)
      return HDWP;

   function EndDeferWindowPos (hWinPosInfo : HDWP) return Win32.BOOL;

   function IsWindowVisible (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function IsIconic (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function AnyPopup return Win32.BOOL;

   function BringWindowToTop (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function IsZoomed (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function CreateDialogParamA
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC;
      dwInitParam    : Win32.LPARAM)
      return Win32.Windef.HWND;

   function CreateDialogParam
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC;
      dwInitParam    : Win32.LPARAM)
      return Win32.Windef.HWND renames CreateDialogParamA;

   function CreateDialogParamW
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCWSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC;
      dwInitParam    : Win32.LPARAM)
      return Win32.Windef.HWND;

   function CreateDialogA
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC)
      return Win32.Windef.HWND;

   function CreateDialog
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC)
      return Win32.Windef.HWND renames CreateDialogA;

   function CreateDialogW
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCWSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC)
      return Win32.Windef.HWND;

   function CreateDialogIndirectParamA
     (hInstance    : Win32.Windef.HINSTANCE;
      lpTemplate   : LPCDLGTEMPLATEA;
      hWndParent   : Win32.Windef.HWND;
      lpDialogFunc : DLGPROC;
      dwInitParam  : Win32.LPARAM)
      return Win32.Windef.HWND;

   function CreateDialogIndirectParam
     (hInstance    : Win32.Windef.HINSTANCE;
      lpTemplate   : LPCDLGTEMPLATEA;
      hWndParent   : Win32.Windef.HWND;
      lpDialogFunc : DLGPROC;
      dwInitParam  : Win32.LPARAM)
      return Win32.Windef.HWND renames CreateDialogIndirectParamA;

   function CreateDialogIndirectParamW
     (hInstance    : Win32.Windef.HINSTANCE;
      lpTemplate   : LPCDLGTEMPLATEW;
      hWndParent   : Win32.Windef.HWND;
      lpDialogFunc : DLGPROC;
      dwInitParam  : Win32.LPARAM)
      return Win32.Windef.HWND;

   function CreateDialogIndirectA
     (hInstance    : Win32.Windef.HINSTANCE;
      lpTemplate   : LPCDLGTEMPLATEA;
      hWndParent   : Win32.Windef.HWND;
      lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND;

   function CreateDialogIndirect
     (hInstance    : Win32.Windef.HINSTANCE;
      lpTemplate   : LPCDLGTEMPLATEA;
      hWndParent   : Win32.Windef.HWND;
      lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND renames CreateDialogIndirectA;

   function CreateDialogIndirectW
     (hInstance    : Win32.Windef.HINSTANCE;
      lpTemplate   : LPCDLGTEMPLATEW;
      hWndParent   : Win32.Windef.HWND;
      lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND;

   function DialogBoxParamA
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC;
      dwInitParam    : Win32.LPARAM)
      return Win32.INT;

   function DialogBoxParam
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC;
      dwInitParam    : Win32.LPARAM)
      return Win32.INT renames DialogBoxParamA;

   function DialogBoxParamW
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCWSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC;
      dwInitParam    : Win32.LPARAM)
      return Win32.INT;

   function DialogBoxA
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC)
      return Win32.INT;

   function DialogBox
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC)
      return Win32.INT renames DialogBoxA;

   function DialogBoxW
     (hInstance      : Win32.Windef.HINSTANCE;
      lpTemplateName : Win32.LPCWSTR;
      hWndParent     : Win32.Windef.HWND;
      lpDialogFunc   : DLGPROC)
      return Win32.INT;

   function DialogBoxIndirectParamA
     (hInstance       : Win32.Windef.HINSTANCE;
      hDialogTemplate : LPCDLGTEMPLATEA;
      hWndParent      : Win32.Windef.HWND;
      lpDialogFunc    : DLGPROC;
      dwInitParam     : Win32.LPARAM)
      return Win32.INT;

   function DialogBoxIndirectParam
     (hInstance       : Win32.Windef.HINSTANCE;
      hDialogTemplate : LPCDLGTEMPLATEA;
      hWndParent      : Win32.Windef.HWND;
      lpDialogFunc    : DLGPROC;
      dwInitParam     : Win32.LPARAM)
      return Win32.INT renames DialogBoxIndirectParamA;

   function DialogBoxIndirectParamW
     (hInstance       : Win32.Windef.HINSTANCE;
      hDialogTemplate : LPCDLGTEMPLATEW;
      hWndParent      : Win32.Windef.HWND;
      lpDialogFunc    : DLGPROC;
      dwInitParam     : Win32.LPARAM)
      return Win32.INT;

   function DialogBoxIndirectA
     (hInstance       : Win32.Windef.HINSTANCE;
      hDialogTemplate : LPCDLGTEMPLATEA;
      hWndParent      : Win32.Windef.HWND;
      lpDialogFunc    : DLGPROC)
      return Win32.INT;

   function DialogBoxIndirect
     (hInstance       : Win32.Windef.HINSTANCE;
      hDialogTemplate : LPCDLGTEMPLATEA;
      hWndParent      : Win32.Windef.HWND;
      lpDialogFunc    : DLGPROC)
      return Win32.INT renames DialogBoxIndirectA;

   function DialogBoxIndirectW
     (hInstance       : Win32.Windef.HINSTANCE;
      hDialogTemplate : LPCDLGTEMPLATEW;
      hWndParent      : Win32.Windef.HWND;
      lpDialogFunc    : DLGPROC)
      return Win32.INT;

   function EndDialog
     (hDlg    : Win32.Windef.HWND;
      nResult : Win32.INT)
      return Win32.BOOL;

   function GetDlgItem
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT)
      return Win32.Windef.HWND;

   function SetDlgItemInt
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      uValue     : Win32.UINT;
      bSigned    : Win32.BOOL)
      return Win32.BOOL;

   function GetDlgItemInt
     (hDlg         : Win32.Windef.HWND;
      nIDDlgItem   : Win32.INT;
      lpTranslated : access Win32.BOOL;
      bSigned      : Win32.BOOL)
      return Win32.UINT;

   function SetDlgItemTextA
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      lpString   : Win32.LPCSTR)
      return Win32.BOOL;

   function SetDlgItemText
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      lpString   : Win32.LPCSTR)
      return Win32.BOOL renames SetDlgItemTextA;

   function SetDlgItemTextW
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      lpString   : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetDlgItemTextA
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      lpString   : Win32.LPSTR;
      nMaxCount  : Win32.INT)
      return Win32.UINT;

   function GetDlgItemText
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      lpString   : Win32.LPSTR;
      nMaxCount  : Win32.INT)
      return Win32.UINT renames GetDlgItemTextA;

   function GetDlgItemTextW
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      lpString   : Win32.LPWSTR;
      nMaxCount  : Win32.INT)
      return Win32.UINT;

   function CheckDlgButton
     (hDlg      : Win32.Windef.HWND;
      nIDButton : Win32.INT;
      uCheck    : Win32.UINT)
      return Win32.BOOL;

   function CheckRadioButton
     (hDlg           : Win32.Windef.HWND;
      nIDFirstButton : Win32.INT;
      nIDLastButton  : Win32.INT;
      nIDCheckButton : Win32.INT)
      return Win32.BOOL;

   function IsDlgButtonChecked
     (hDlg      : Win32.Windef.HWND;
      nIDButton : Win32.INT)
      return Win32.UINT;

   function SendDlgItemMessageA
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      Msg        : Win32.UINT;
      wParam     : Win32.WPARAM;
      lParam     : Win32.LPARAM)
      return Win32.LONG;

   function SendDlgItemMessage
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      Msg        : Win32.UINT;
      wParam     : Win32.WPARAM;
      lParam     : Win32.LPARAM)
      return Win32.LONG renames SendDlgItemMessageA;

   function SendDlgItemMessageW
     (hDlg       : Win32.Windef.HWND;
      nIDDlgItem : Win32.INT;
      Msg        : Win32.UINT;
      wParam     : Win32.WPARAM;
      lParam     : Win32.LPARAM)
      return Win32.LONG;

   function GetNextDlgGroupItem
     (hDlg      : Win32.Windef.HWND;
      hCtl      : Win32.Windef.HWND;
      bPrevious : Win32.BOOL)
      return Win32.Windef.HWND;

   function GetNextDlgTabItem
     (hDlg      : Win32.Windef.HWND;
      hCtl      : Win32.Windef.HWND;
      bPrevious : Win32.BOOL)
      return Win32.Windef.HWND;

   function GetDlgCtrlID (hWnd : Win32.Windef.HWND) return Win32.INT;

   function GetDialogBaseUnits return Win32.INT;

   function DefDlgProcA
     (hDlg   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function DefDlgProc
     (hDlg   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT renames DefDlgProcA;

   function DefDlgProcW
     (hDlg   : Win32.Windef.HWND;
      Msg    : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function CallMsgFilterA
     (lpMsg : access MSG;
      nCode : Win32.INT)
      return Win32.BOOL;

   function CallMsgFilter
     (lpMsg : access MSG;
      nCode : Win32.INT)
      return Win32.BOOL renames CallMsgFilterA;

   function CallMsgFilterW
     (lpMsg : access MSG;
      nCode : Win32.INT)
      return Win32.BOOL;

   function OpenClipboard
     (hWndNewOwner : Win32.Windef.HWND)
      return Win32.BOOL;

   function CloseClipboard return Win32.BOOL;

   function GetClipboardOwner return Win32.Windef.HWND;

   function SetClipboardViewer
     (hWndNewViewer : Win32.Windef.HWND)
      return Win32.Windef.HWND;

   function GetClipboardViewer return Win32.Windef.HWND;

   function ChangeClipboardChain
     (hWndRemove  : Win32.Windef.HWND;
      hWndNewNext : Win32.Windef.HWND)
      return Win32.BOOL;

   function SetClipboardData
     (uFormat : Win32.UINT;
      hMem    : Win32.Winnt.HANDLE)
      return Win32.Winnt.HANDLE;

   function GetClipboardData
     (uFormat : Win32.UINT)
      return Win32.Winnt.HANDLE;

   function RegisterClipboardFormatA
     (lpszFormat : Win32.LPCSTR)
      return Win32.UINT;

   function RegisterClipboardFormat
     (lpszFormat : Win32.LPCSTR)
      return Win32.UINT renames RegisterClipboardFormatA;

   function RegisterClipboardFormatW
     (lpszFormat : Win32.LPCWSTR)
      return Win32.UINT;

   function CountClipboardFormats return Win32.INT;

   function EnumClipboardFormats (format : Win32.UINT) return Win32.UINT;

   function GetClipboardFormatNameA
     (format         : Win32.UINT;
      lpszFormatName : Win32.LPSTR;
      cchMaxCount    : Win32.INT)
      return Win32.INT;

   function GetClipboardFormatName
     (format         : Win32.UINT;
      lpszFormatName : Win32.LPSTR;
      cchMaxCount    : Win32.INT)
      return Win32.INT renames GetClipboardFormatNameA;

   function GetClipboardFormatNameW
     (format         : Win32.UINT;
      lpszFormatName : Win32.LPWSTR;
      cchMaxCount    : Win32.INT)
      return Win32.INT;

   function EmptyClipboard return Win32.BOOL;

   function IsClipboardFormatAvailable
     (format : Win32.UINT)
      return Win32.BOOL;

   function GetPriorityClipboardFormat
     (paFormatPriorityList : access Win32.UINT;
      cFormats             : Win32.INT)
      return Win32.INT;

   function GetOpenClipboardWindow return Win32.Windef.HWND;

   function CharToOemA
     (lpszSrc : Win32.LPCSTR;
      lpszDst : Win32.LPSTR)
      return Win32.BOOL;

   function AnsiToOem
     (lpszSrc : Win32.LPCSTR;
      lpszDst : Win32.LPSTR)
      return Win32.BOOL renames CharToOemA;

   function CharToOem
     (lpszSrc : Win32.LPCSTR;
      lpszDst : Win32.LPSTR)
      return Win32.BOOL renames CharToOemA;

   function CharToOemW
     (lpszSrc : Win32.LPCWSTR;
      lpszDst : Win32.LPSTR)
      return Win32.BOOL;

   function OemToCharA
     (lpszSrc : Win32.LPCSTR;
      lpszDst : Win32.LPSTR)
      return Win32.BOOL;

   function OemToAnsi
     (lpszSrc : Win32.LPCSTR;
      lpszDst : Win32.LPSTR)
      return Win32.BOOL renames OemToCharA;

   function OemToChar
     (lpszSrc : Win32.LPCSTR;
      lpszDst : Win32.LPSTR)
      return Win32.BOOL renames OemToCharA;

   function OemToCharW
     (lpszSrc : Win32.LPCSTR;
      lpszDst : Win32.LPWSTR)
      return Win32.BOOL;

   function CharToOemBuffA
     (lpszSrc      : Win32.LPCSTR;
      lpszDst      : Win32.LPSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL;

   function AnsiToOemBuff
     (lpszSrc      : Win32.LPCSTR;
      lpszDst      : Win32.LPSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL renames CharToOemBuffA;

   function CharToOemBuff
     (lpszSrc      : Win32.LPCSTR;
      lpszDst      : Win32.LPSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL renames CharToOemBuffA;

   function CharToOemBuffW
     (lpszSrc      : Win32.LPCWSTR;
      lpszDst      : Win32.LPSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL;

   function OemToCharBuffA
     (lpszSrc      : Win32.LPCSTR;
      lpszDst      : Win32.LPSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL;

   function OemToAnsiBuff
     (lpszSrc      : Win32.LPCSTR;
      lpszDst      : Win32.LPSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL renames OemToCharBuffA;

   function OemToCharBuff
     (lpszSrc      : Win32.LPCSTR;
      lpszDst      : Win32.LPSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL renames OemToCharBuffA;

   function OemToCharBuffW
     (lpszSrc      : Win32.LPCSTR;
      lpszDst      : Win32.LPWSTR;
      cchDstLength : Win32.DWORD)
      return Win32.BOOL;

   function CharUpperA (lpsz : Win32.LPSTR) return Win32.LPSTR;

   function AnsiUpper (lpsz : Win32.LPSTR) return Win32.LPSTR renames
     CharUpperA;

   function CharUpper (lpsz : Win32.LPSTR) return Win32.LPSTR renames
     CharUpperA;

   function CharUpperW (lpsz : Win32.LPWSTR) return Win32.LPWSTR;

   function CharUpperBuffA
     (lpsz      : Win32.LPSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD;

   function AnsiUpperBuff
     (lpsz      : Win32.LPSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD renames CharUpperBuffA;

   function CharUpperBuff
     (lpsz      : Win32.LPSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD renames CharUpperBuffA;

   function CharUpperBuffW
     (lpsz      : Win32.LPWSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD;

   function CharLowerA (lpsz : Win32.LPSTR) return Win32.LPSTR;

   function AnsiLower (lpsz : Win32.LPSTR) return Win32.LPSTR renames
     CharLowerA;

   function CharLower (lpsz : Win32.LPSTR) return Win32.LPSTR renames
     CharLowerA;

   function CharLowerW (lpsz : Win32.LPWSTR) return Win32.LPWSTR;

   function CharLowerBuffA
     (lpsz      : Win32.LPSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD;

   function AnsiLowerBuff
     (lpsz      : Win32.LPSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD renames CharLowerBuffA;

   function CharLowerBuff
     (lpsz      : Win32.LPSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD renames CharLowerBuffA;

   function CharLowerBuffW
     (lpsz      : Win32.LPWSTR;
      cchLength : Win32.DWORD)
      return Win32.DWORD;

   function CharNextA (lpsz : Win32.LPCSTR) return Win32.LPSTR;

   function AnsiNext (lpsz : Win32.LPCSTR) return Win32.LPSTR renames
     CharNextA;

   function CharNext (lpsz : Win32.LPCSTR) return Win32.LPSTR renames
     CharNextA;

   function CharNextW (lpsz : Win32.LPCWSTR) return Win32.LPWSTR;

   function CharPrevA
     (lpszStart   : Win32.LPCSTR;
      lpszCurrent : Win32.LPCSTR)
      return Win32.LPSTR;

   function AnsiPrev
     (lpszStart   : Win32.LPCSTR;
      lpszCurrent : Win32.LPCSTR)
      return Win32.LPSTR renames CharPrevA;

   function CharPrev
     (lpszStart   : Win32.LPCSTR;
      lpszCurrent : Win32.LPCSTR)
      return Win32.LPSTR renames CharPrevA;

   function CharPrevW
     (lpszStart   : Win32.LPCWSTR;
      lpszCurrent : Win32.LPCWSTR)
      return Win32.LPWSTR;

   function IsCharAlphaA (ch : Win32.CHAR) return Win32.BOOL;

   function IsCharAlpha (ch : Win32.CHAR) return Win32.BOOL renames
     IsCharAlphaA;

   function IsCharAlphaW (ch : Win32.WCHAR) return Win32.BOOL;

   function IsCharAlphaNumericA (ch : Win32.CHAR) return Win32.BOOL;

   function IsCharAlphaNumeric (ch : Win32.CHAR) return Win32.BOOL renames
     IsCharAlphaNumericA;

   function IsCharAlphaNumericW (ch : Win32.WCHAR) return Win32.BOOL;

   function IsCharUpperA (ch : Win32.CHAR) return Win32.BOOL;

   function IsCharUpper (ch : Win32.CHAR) return Win32.BOOL renames
     IsCharUpperA;

   function IsCharUpperW (ch : Win32.WCHAR) return Win32.BOOL;

   function IsCharLowerA (ch : Win32.CHAR) return Win32.BOOL;

   function IsCharLower (ch : Win32.CHAR) return Win32.BOOL renames
     IsCharLowerA;

   function IsCharLowerW (ch : Win32.WCHAR) return Win32.BOOL;

   function SetFocus (hWnd : Win32.Windef.HWND) return Win32.Windef.HWND;

   function GetActiveWindow return Win32.Windef.HWND;

   function GetFocus return Win32.Windef.HWND;

   function GetKBCodePage return Win32.UINT;

   function GetKeyState (nVirtKey : Win32.INT) return Win32.SHORT;

   function GetAsyncKeyState (vKey : Win32.INT) return Win32.SHORT;

   function GetKeyboardState (lpKeyState : Win32.PBYTE) return Win32.BOOL;

   function SetKeyboardState (lpKeyState : Win32.LPBYTE) return Win32.BOOL;

   function GetKeyNameTextA
     (lParam   : Win32.LONG;
      lpString : Win32.LPSTR;
      nSize    : Win32.INT)
      return Win32.INT;

   function GetKeyNameText
     (lParam   : Win32.LONG;
      lpString : Win32.LPSTR;
      nSize    : Win32.INT)
      return Win32.INT renames GetKeyNameTextA;

   function GetKeyNameTextW
     (lParam   : Win32.LONG;
      lpString : Win32.LPWSTR;
      nSize    : Win32.INT)
      return Win32.INT;

   function GetKeyboardType (nTypeFlag : Win32.INT) return Win32.INT;

   function ToAscii
     (uVirtKey   : Win32.UINT;
      uScanCode  : Win32.UINT;
      lpKeyState : Win32.PBYTE;
      lpChar     : Win32.LPWORD;
      uFlags     : Win32.UINT)
      return Win32.INT;

   function ToUnicode
     (wVirtKey   : Win32.UINT;
      wScanCode  : Win32.UINT;
      lpKeyState : Win32.PBYTE;
      pwszBuff   : Win32.LPWSTR;
      cchBuff    : Win32.INT;
      wFlags     : Win32.UINT)
      return Win32.INT;

   function OemKeyScan (wOemChar : Win32.WORD) return Win32.DWORD;

   function VkKeyScanA (ch : Win32.CHAR) return Win32.SHORT;

   function VkKeyScan (ch : Win32.CHAR) return Win32.SHORT renames VkKeyScanA;

   function VkKeyScanW (ch : Win32.WCHAR) return Win32.SHORT;

   procedure keybd_event
     (bVk         : Win32.BYTE;
      bScan       : Win32.BYTE;
      dwFlags     : Win32.DWORD;
      dwExtraInfo : Win32.DWORD);

   procedure mouse_event
     (dwFlags     : Win32.DWORD;
      dx          : Win32.DWORD;
      dy          : Win32.DWORD;
      cButtons    : Win32.DWORD;
      dwExtraInfo : Win32.DWORD);

   function MapVirtualKeyA
     (uCode    : Win32.UINT;
      uMapType : Win32.UINT)
      return Win32.UINT;

   function MapVirtualKey
     (uCode    : Win32.UINT;
      uMapType : Win32.UINT)
      return Win32.UINT renames MapVirtualKeyA;

   function MapVirtualKeyW
     (uCode    : Win32.UINT;
      uMapType : Win32.UINT)
      return Win32.UINT;

   function GetInputState return Win32.BOOL;

   function GetQueueStatus (flags : Win32.UINT) return Win32.DWORD;

   function GetCapture return Win32.Windef.HWND;

   function SetCapture (hWnd : Win32.Windef.HWND) return Win32.Windef.HWND;

   function ReleaseCapture return Win32.BOOL;

   function MsgWaitForMultipleObjects
     (nCount         : Win32.DWORD;
      pHandles       : Win32.Windef.LPHANDLE;
      fWaitAll       : Win32.BOOL;
      dwMilliseconds : Win32.DWORD;
      dwWakeMask     : Win32.DWORD)
      return Win32.DWORD;

   function SetTimer
     (hWnd        : Win32.Windef.HWND;
      nIDEvent    : Win32.UINT;
      uElapse     : Win32.UINT;
      lpTimerFunc : TIMERPROC)
      return Win32.UINT;

   function KillTimer
     (hWnd     : Win32.Windef.HWND;
      uIDEvent : Win32.UINT)
      return Win32.BOOL;

   function IsWindowUnicode (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function EnableWindow
     (hWnd    : Win32.Windef.HWND;
      bEnable : Win32.BOOL)
      return Win32.BOOL;

   function IsWindowEnabled (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function LoadAcceleratorsA
     (hInstance   : Win32.Windef.HINSTANCE;
      lpTableName : Win32.LPCSTR)
      return Win32.Windef.HACCEL;

   function LoadAccelerators
     (hInstance   : Win32.Windef.HINSTANCE;
      lpTableName : Win32.LPCSTR)
      return Win32.Windef.HACCEL renames LoadAcceleratorsA;

   function LoadAcceleratorsW
     (hInstance   : Win32.Windef.HINSTANCE;
      lpTableName : Win32.LPCWSTR)
      return Win32.Windef.HACCEL;

   function CreateAcceleratorTableA
     (lpaccl   : LPACCEL;
      cEntries : Win32.INT)
      return Win32.Windef.HACCEL;

   function CreateAcceleratorTable
     (lpaccl   : LPACCEL;
      cEntries : Win32.INT)
      return Win32.Windef.HACCEL renames CreateAcceleratorTableA;

   function CreateAcceleratorTableW
     (lpaccl   : LPACCEL;
      cEntries : Win32.INT)
      return Win32.Windef.HACCEL;

   function DestroyAcceleratorTable
     (hAccel : Win32.Windef.HACCEL)
      return Win32.BOOL;

   function CopyAcceleratorTableA
     (hAccelSrc     : Win32.Windef.HACCEL;
      lpAccelDst    : access ACCEL;
      cAccelEntries : Win32.INT)
      return Win32.INT;

   function CopyAcceleratorTable
     (hAccelSrc     : Win32.Windef.HACCEL;
      lpAccelDst    : access ACCEL;
      cAccelEntries : Win32.INT)
      return Win32.INT renames CopyAcceleratorTableA;

   function CopyAcceleratorTableW
     (hAccelSrc     : Win32.Windef.HACCEL;
      lpAccelDst    : access ACCEL;
      cAccelEntries : Win32.INT)
      return Win32.INT;

   function TranslateAcceleratorA
     (hWnd      : Win32.Windef.HWND;
      hAccTable : Win32.Windef.HACCEL;
      lpMsg     : access MSG)
      return Win32.INT;

   function TranslateAccelerator
     (hWnd      : Win32.Windef.HWND;
      hAccTable : Win32.Windef.HACCEL;
      lpMsg     : access MSG)
      return Win32.INT renames TranslateAcceleratorA;

   function TranslateAcceleratorW
     (hWnd      : Win32.Windef.HWND;
      hAccTable : Win32.Windef.HACCEL;
      lpMsg     : access MSG)
      return Win32.INT;

   function GetSystemMetrics (nIndex : Win32.INT) return Win32.INT;

   function LoadMenuA
     (hInstance  : Win32.Windef.HINSTANCE;
      lpMenuName : Win32.LPCSTR)
      return Win32.Windef.HMENU;

   function LoadMenu
     (hInstance  : Win32.Windef.HINSTANCE;
      lpMenuName : Win32.LPCSTR)
      return Win32.Windef.HMENU renames LoadMenuA;

   function LoadMenuW
     (hInstance  : Win32.Windef.HINSTANCE;
      lpMenuName : Win32.LPCWSTR)
      return Win32.Windef.HMENU;

   function LoadMenuIndirectA
     (lpMenuTemplate : Win32.PCVOID)
      return Win32.Windef.HMENU;

   function LoadMenuIndirect
     (lpMenuTemplate : Win32.PCVOID)
      return Win32.Windef.HMENU renames LoadMenuIndirectA;

   function LoadMenuIndirectW
     (lpMenuTemplate : Win32.PCVOID)
      return Win32.Windef.HMENU;

   function GetMenu (hWnd : Win32.Windef.HWND) return Win32.Windef.HMENU;

   function SetMenu
     (hWnd  : Win32.Windef.HWND;
      hMenu : Win32.Windef.HMENU)
      return Win32.BOOL;

   function ChangeMenuA
     (hMenu       : Win32.Windef.HMENU;
      cmd         : Win32.UINT;
      lpszNewItem : Win32.LPCSTR;
      cmdInsert   : Win32.UINT;
      flags       : Win32.UINT)
      return Win32.BOOL;

   function ChangeMenu
     (hMenu       : Win32.Windef.HMENU;
      cmd         : Win32.UINT;
      lpszNewItem : Win32.LPCSTR;
      cmdInsert   : Win32.UINT;
      flags       : Win32.UINT)
      return Win32.BOOL renames ChangeMenuA;

   function ChangeMenuW
     (hMenu       : Win32.Windef.HMENU;
      cmd         : Win32.UINT;
      lpszNewItem : Win32.LPCWSTR;
      cmdInsert   : Win32.UINT;
      flags       : Win32.UINT)
      return Win32.BOOL;

   function HiliteMenuItem
     (hWnd          : Win32.Windef.HWND;
      hMenu         : Win32.Windef.HMENU;
      uIDHiliteItem : Win32.UINT;
      uHilite       : Win32.UINT)
      return Win32.BOOL;

   function GetMenuStringA
     (hMenu     : Win32.Windef.HMENU;
      uIDItem   : Win32.UINT;
      lpString  : Win32.LPSTR;
      nMaxCount : Win32.INT;
      uFlag     : Win32.UINT)
      return Win32.INT;

   function GetMenuString
     (hMenu     : Win32.Windef.HMENU;
      uIDItem   : Win32.UINT;
      lpString  : Win32.LPSTR;
      nMaxCount : Win32.INT;
      uFlag     : Win32.UINT)
      return Win32.INT renames GetMenuStringA;

   function GetMenuStringW
     (hMenu     : Win32.Windef.HMENU;
      uIDItem   : Win32.UINT;
      lpString  : Win32.LPWSTR;
      nMaxCount : Win32.INT;
      uFlag     : Win32.UINT)
      return Win32.INT;

   function GetMenuState
     (hMenu  : Win32.Windef.HMENU;
      uId    : Win32.UINT;
      uFlags : Win32.UINT)
      return Win32.UINT;

   function DrawMenuBar (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function GetSystemMenu
     (hWnd    : Win32.Windef.HWND;
      bRevert : Win32.BOOL)
      return Win32.Windef.HMENU;

   function CreateMenu return Win32.Windef.HMENU;

   function CreatePopupMenu return Win32.Windef.HMENU;

   function DestroyMenu (hMenu : Win32.Windef.HMENU) return Win32.BOOL;

   function CheckMenuItem
     (hMenu        : Win32.Windef.HMENU;
      uIDCheckItem : Win32.UINT;
      uCheck       : Win32.UINT)
      return Win32.DWORD;

   function EnableMenuItem
     (hMenu         : Win32.Windef.HMENU;
      uIDEnableItem : Win32.UINT;
      uEnable       : Win32.UINT)
      return Win32.BOOL;

   function GetSubMenu
     (hMenu : Win32.Windef.HMENU;
      nPos  : Win32.INT)
      return Win32.Windef.HMENU;

   function GetMenuItemID
     (hMenu : Win32.Windef.HMENU;
      nPos  : Win32.INT)
      return Win32.UINT;

   function GetMenuItemCount (hMenu : Win32.Windef.HMENU) return Win32.INT;

   function InsertMenuA
     (hMenu      : Win32.Windef.HMENU;
      uPosition  : Win32.UINT;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCSTR)
      return Win32.BOOL;

   function InsertMenu
     (hMenu      : Win32.Windef.HMENU;
      uPosition  : Win32.UINT;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCSTR)
      return Win32.BOOL renames InsertMenuA;

   function InsertMenuW
     (hMenu      : Win32.Windef.HMENU;
      uPosition  : Win32.UINT;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCWSTR)
      return Win32.BOOL;

   function AppendMenuA
     (hMenu      : Win32.Windef.HMENU;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCSTR)
      return Win32.BOOL;

   function AppendMenu
     (hMenu      : Win32.Windef.HMENU;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCSTR)
      return Win32.BOOL renames AppendMenuA;

   function AppendMenuW
     (hMenu      : Win32.Windef.HMENU;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCWSTR)
      return Win32.BOOL;

   function ModifyMenuA
     (hMnu       : Win32.Windef.HMENU;
      uPosition  : Win32.UINT;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCSTR)
      return Win32.BOOL;

   function ModifyMenu
     (hMnu       : Win32.Windef.HMENU;
      uPosition  : Win32.UINT;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCSTR)
      return Win32.BOOL renames ModifyMenuA;

   function ModifyMenuW
     (hMnu       : Win32.Windef.HMENU;
      uPosition  : Win32.UINT;
      uFlags     : Win32.UINT;
      uIDNewItem : Win32.UINT;
      lpNewItem  : Win32.LPCWSTR)
      return Win32.BOOL;

   function RemoveMenu
     (hMenu     : Win32.Windef.HMENU;
      uPosition : Win32.UINT;
      uFlags    : Win32.UINT)
      return Win32.BOOL;

   function DeleteMenu
     (hMenu     : Win32.Windef.HMENU;
      uPosition : Win32.UINT;
      uFlags    : Win32.UINT)
      return Win32.BOOL;

   function SetMenuItemBitmaps
     (hMenu            : Win32.Windef.HMENU;
      uPosition        : Win32.UINT;
      uFlags           : Win32.UINT;
      hBitmapUnchecked : Win32.Windef.HBITMAP;
      hBitmapChecked   : Win32.Windef.HBITMAP)
      return Win32.BOOL;

   function GetMenuCheckMarkDimensions return Win32.LONG;

   function TrackPopupMenu
     (hMenu     : Win32.Windef.HMENU;
      uFlags    : Win32.UINT;
      x         : Win32.INT;
      y         : Win32.INT;
      nReserved : Win32.INT;
      hWnd      : Win32.Windef.HWND;
      prcRect   : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function DrawIcon
     (hDC   : Win32.Windef.HDC;
      X     : Win32.INT;
      Y     : Win32.INT;
      hIcon : Win32.Windef.HICON)
      return Win32.BOOL;

   function DrawTextA
     (hDC      : Win32.Windef.HDC;
      lpString : Win32.LPCSTR;
      nCount   : Win32.INT;
      lpRect   : Win32.Windef.LPRECT;
      uFormat  : Win32.UINT)
      return Win32.INT;

   function DrawText
     (hDC      : Win32.Windef.HDC;
      lpString : Win32.LPCSTR;
      nCount   : Win32.INT;
      lpRect   : Win32.Windef.LPRECT;
      uFormat  : Win32.UINT)
      return Win32.INT renames DrawTextA;

   function DrawTextW
     (hDC      : Win32.Windef.HDC;
      lpString : Win32.LPCWSTR;
      nCount   : Win32.INT;
      lpRect   : Win32.Windef.LPRECT;
      uFormat  : Win32.UINT)
      return Win32.INT;

   function GrayStringA
     (hDC          : Win32.Windef.HDC;
      hBrush       : Win32.Windef.HBRUSH;
      lpOutputFunc : GRAYSTRINGPROC;
      lpData       : Win32.LPARAM;
      nCount       : Win32.INT;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT)
      return Win32.BOOL;

   function GrayString
     (hDC          : Win32.Windef.HDC;
      hBrush       : Win32.Windef.HBRUSH;
      lpOutputFunc : GRAYSTRINGPROC;
      lpData       : Win32.LPARAM;
      nCount       : Win32.INT;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT)
      return Win32.BOOL renames GrayStringA;

   function GrayStringW
     (hDC          : Win32.Windef.HDC;
      hBrush       : Win32.Windef.HBRUSH;
      lpOutputFunc : GRAYSTRINGPROC;
      lpData       : Win32.LPARAM;
      nCount       : Win32.INT;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT)
      return Win32.BOOL;

   function TabbedTextOutA
     (hDC                 : Win32.Windef.HDC;
      X                   : Win32.INT;
      Y                   : Win32.INT;
      lpString            : Win32.LPCSTR;
      nCount              : Win32.INT;
      nTabPositions       : Win32.INT;
      lpnTabStopPositions : Win32.LPINT;
      nTabOrigin          : Win32.INT)
      return Win32.LONG;

   function TabbedTextOut
     (hDC                 : Win32.Windef.HDC;
      X                   : Win32.INT;
      Y                   : Win32.INT;
      lpString            : Win32.LPCSTR;
      nCount              : Win32.INT;
      nTabPositions       : Win32.INT;
      lpnTabStopPositions : Win32.LPINT;
      nTabOrigin          : Win32.INT)
      return Win32.LONG renames TabbedTextOutA;

   function TabbedTextOutW
     (hDC                 : Win32.Windef.HDC;
      X                   : Win32.INT;
      Y                   : Win32.INT;
      lpString            : Win32.LPCWSTR;
      nCount              : Win32.INT;
      nTabPositions       : Win32.INT;
      lpnTabStopPositions : Win32.LPINT;
      nTabOrigin          : Win32.INT)
      return Win32.LONG;

   function GetTabbedTextExtentA
     (hDC                 : Win32.Windef.HDC;
      lpString            : Win32.LPCSTR;
      nCount              : Win32.INT;
      nTabPositions       : Win32.INT;
      lpnTabStopPositions : Win32.LPINT)
      return Win32.DWORD;

   function GetTabbedTextExtent
     (hDC                 : Win32.Windef.HDC;
      lpString            : Win32.LPCSTR;
      nCount              : Win32.INT;
      nTabPositions       : Win32.INT;
      lpnTabStopPositions : Win32.LPINT)
      return Win32.DWORD renames GetTabbedTextExtentA;

   function GetTabbedTextExtentW
     (hDC                 : Win32.Windef.HDC;
      lpString            : Win32.LPCWSTR;
      nCount              : Win32.INT;
      nTabPositions       : Win32.INT;
      lpnTabStopPositions : Win32.LPINT)
      return Win32.DWORD;

   function UpdateWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function SetActiveWindow
     (hWnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;

   function GetForegroundWindow return Win32.Windef.HWND;

   function SetForegroundWindow
     (hWnd : Win32.Windef.HWND)
      return Win32.BOOL;

   function WindowFromDC (hDC : Win32.Windef.HDC) return Win32.Windef.HWND;

   function GetDC (hWnd : Win32.Windef.HWND) return Win32.Windef.HDC;

   function GetDCEx
     (hWnd     : Win32.Windef.HWND;
      hrgnClip : Win32.Windef.HRGN;
      flags    : Win32.DWORD)
      return Win32.Windef.HDC;

   function GetWindowDC (hWnd : Win32.Windef.HWND) return Win32.Windef.HDC;

   function ReleaseDC
     (hWnd : Win32.Windef.HWND;
      hDC  : Win32.Windef.HDC)
      return Win32.INT;

   function BeginPaint
     (hWnd    : Win32.Windef.HWND;
      lpPaint : access PAINTSTRUCT)
      return Win32.Windef.HDC;

   function EndPaint
     (hWnd    : Win32.Windef.HWND;
      lpPaint : access PAINTSTRUCT)
      return Win32.BOOL;

   function GetUpdateRect
     (hWnd   : Win32.Windef.HWND;
      lpRect : Win32.Windef.LPRECT;
      bErase : Win32.BOOL)
      return Win32.BOOL;

   function GetUpdateRgn
     (hWnd   : Win32.Windef.HWND;
      hRgn   : Win32.Windef.HRGN;
      bErase : Win32.BOOL)
      return Win32.INT;

   function ExcludeUpdateRgn
     (hDC  : Win32.Windef.HDC;
      hWnd : Win32.Windef.HWND)
      return Win32.INT;

   function InvalidateRect
     (hWnd   : Win32.Windef.HWND;
      lpRect : Win32.Wingdi.ac_RECT_t;
      bErase : Win32.BOOL)
      return Win32.BOOL;

   function ValidateRect
     (hWnd   : Win32.Windef.HWND;
      lpRect : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function InvalidateRgn
     (hWnd   : Win32.Windef.HWND;
      hRgn   : Win32.Windef.HRGN;
      bErase : Win32.BOOL)
      return Win32.BOOL;

   function ValidateRgn
     (hWnd : Win32.Windef.HWND;
      hRgn : Win32.Windef.HRGN)
      return Win32.BOOL;

   function RedrawWindow
     (hWnd       : Win32.Windef.HWND;
      lprcUpdate : Win32.Wingdi.ac_RECT_t;
      hrgnUpdate : Win32.Windef.HRGN;
      flags      : Win32.UINT)
      return Win32.BOOL;

   function LockWindowUpdate
     (hWndLock : Win32.Windef.HWND)
      return Win32.BOOL;

   function ScrollWindow
     (hWnd       : Win32.Windef.HWND;
      XAMOUNT    : Win32.INT;
      YAMOUNT    : Win32.INT;
      lpRect     : Win32.Wingdi.ac_RECT_t;
      lpClipRect : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function ScrollDC
     (hDC        : Win32.Windef.HDC;
      dx         : Win32.INT;
      dy         : Win32.INT;
      lprcScroll : Win32.Wingdi.ac_RECT_t;
      lprcClip   : Win32.Wingdi.ac_RECT_t;
      hrgnUpdate : Win32.Windef.HRGN;
      lprcUpdate : Win32.Windef.LPRECT)
      return Win32.BOOL;

   function ScrollWindowEx
     (hWnd       : Win32.Windef.HWND;
      dx         : Win32.INT;
      dy         : Win32.INT;
      prcScroll  : Win32.Wingdi.ac_RECT_t;
      prcClip    : Win32.Wingdi.ac_RECT_t;
      hrgnUpdate : Win32.Windef.HRGN;
      prcUpdate  : Win32.Windef.LPRECT;
      flags      : Win32.UINT)
      return Win32.INT;

   function SetScrollPos
     (hWnd    : Win32.Windef.HWND;
      nBar    : Win32.INT;
      nPos    : Win32.INT;
      bRedraw : Win32.BOOL)
      return Win32.INT;

   function GetScrollPos
     (hWnd : Win32.Windef.HWND;
      nBar : Win32.INT)
      return Win32.INT;

   function SetScrollRange
     (hWnd    : Win32.Windef.HWND;
      nBar    : Win32.INT;
      nMinPos : Win32.INT;
      nMaxPos : Win32.INT;
      bRedraw : Win32.BOOL)
      return Win32.BOOL;

   function GetScrollRange
     (hWnd     : Win32.Windef.HWND;
      nBar     : Win32.INT;
      lpMinPos : Win32.LPINT;
      lpMaxPos : Win32.LPINT)
      return Win32.BOOL;

   function ShowScrollBar
     (hWnd  : Win32.Windef.HWND;
      wBar  : Win32.INT;
      bShow : Win32.BOOL)
      return Win32.BOOL;

   function EnableScrollBar
     (hWnd     : Win32.Windef.HWND;
      wSBflags : Win32.UINT;
      wArrows  : Win32.UINT)
      return Win32.BOOL;

   function SetPropA
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR;
      hData    : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function SetProp
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR;
      hData    : Win32.Winnt.HANDLE)
      return Win32.BOOL renames SetPropA;

   function SetPropW
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCWSTR;
      hData    : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function GetPropA
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function GetProp
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames GetPropA;

   function GetPropW
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function RemovePropA
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function RemoveProp
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames RemovePropA;

   function RemovePropW
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function EnumPropsExA
     (hWnd       : Win32.Windef.HWND;
      lpEnumFunc : PROPENUMPROCEXA;
      lParam     : Win32.LPARAM)
      return Win32.INT;

   function EnumPropsEx
     (hWnd       : Win32.Windef.HWND;
      lpEnumFunc : PROPENUMPROCEXA;
      lParam     : Win32.LPARAM)
      return Win32.INT renames EnumPropsExA;

   function EnumPropsExW
     (hWnd       : Win32.Windef.HWND;
      lpEnumFunc : PROPENUMPROCEXW;
      lParam     : Win32.LPARAM)
      return Win32.INT;

   function EnumPropsA
     (hWnd       : Win32.Windef.HWND;
      lpEnumFunc : PROPENUMPROCA)
      return Win32.INT;

   function EnumProps
     (hWnd       : Win32.Windef.HWND;
      lpEnumFunc : PROPENUMPROCA)
      return Win32.INT renames EnumPropsA;

   function EnumPropsW
     (hWnd       : Win32.Windef.HWND;
      lpEnumFunc : PROPENUMPROCW)
      return Win32.INT;

   function SetWindowTextA
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR)
      return Win32.BOOL;

   function SetWindowText
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCSTR)
      return Win32.BOOL renames SetWindowTextA;

   function SetWindowTextW
     (hWnd     : Win32.Windef.HWND;
      lpString : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetWindowTextA
     (hWnd      : Win32.Windef.HWND;
      lpString  : Win32.LPSTR;
      nMaxCount : Win32.INT)
      return Win32.INT;

   function GetWindowText
     (hWnd      : Win32.Windef.HWND;
      lpString  : Win32.LPSTR;
      nMaxCount : Win32.INT)
      return Win32.INT renames GetWindowTextA;

   function GetWindowTextW
     (hWnd      : Win32.Windef.HWND;
      lpString  : Win32.LPWSTR;
      nMaxCount : Win32.INT)
      return Win32.INT;

   function GetWindowTextLengthA
     (hWnd : Win32.Windef.HWND)
      return Win32.INT;

   function GetWindowTextLength (hWnd : Win32.Windef.HWND) return Win32.INT
      renames GetWindowTextLengthA;

   function GetWindowTextLengthW
     (hWnd : Win32.Windef.HWND)
      return Win32.INT;

   function GetClientRect
     (hWnd   : Win32.Windef.HWND;
      lpRect : Win32.Windef.LPRECT)
      return Win32.BOOL;

   function GetWindowRect
     (hWnd   : Win32.Windef.HWND;
      lpRect : Win32.Windef.LPRECT)
      return Win32.BOOL;

   function AdjustWindowRect
     (lpRect  : Win32.Windef.LPRECT;
      dwStyle : Win32.DWORD;
      bMenu   : Win32.BOOL)
      return Win32.BOOL;

   function AdjustWindowRectEx
     (lpRect    : Win32.Windef.LPRECT;
      dwStyle   : Win32.DWORD;
      bMenu     : Win32.BOOL;
      dwExStyle : Win32.DWORD)
      return Win32.BOOL;

   function MessageBoxA
     (hWnd      : Win32.Windef.HWND;
      lpText    : Win32.LPCSTR;
      lpCaption : Win32.LPCSTR;
      uType     : Win32.UINT)
      return Win32.INT;

   function MessageBox
     (hWnd      : Win32.Windef.HWND;
      lpText    : Win32.LPCSTR;
      lpCaption : Win32.LPCSTR;
      uType     : Win32.UINT)
      return Win32.INT renames MessageBoxA;

   function MessageBoxW
     (hWnd      : Win32.Windef.HWND;
      lpText    : Win32.LPCWSTR;
      lpCaption : Win32.LPCWSTR;
      uType     : Win32.UINT)
      return Win32.INT;

   function MessageBoxExA
     (hWnd        : Win32.Windef.HWND;
      lpText      : Win32.LPCSTR;
      lpCaption   : Win32.LPCSTR;
      uType       : Win32.UINT;
      wLanguageId : Win32.WORD)
      return Win32.INT;

   function MessageBoxEx
     (hWnd        : Win32.Windef.HWND;
      lpText      : Win32.LPCSTR;
      lpCaption   : Win32.LPCSTR;
      uType       : Win32.UINT;
      wLanguageId : Win32.WORD)
      return Win32.INT renames MessageBoxExA;

   function MessageBoxExW
     (hWnd        : Win32.Windef.HWND;
      lpText      : Win32.LPCWSTR;
      lpCaption   : Win32.LPCWSTR;
      uType       : Win32.UINT;
      wLanguageId : Win32.WORD)
      return Win32.INT;

   function MessageBeep (uType : Win32.UINT) return Win32.BOOL;

   function ShowCursor (bShow : Win32.BOOL) return Win32.INT;

   function SetCursorPos (X : Win32.INT; Y : Win32.INT) return Win32.BOOL;

   function SetCursor
     (hCursor : Win32.Windef.HCURSOR)
      return Win32.Windef.HCURSOR;

   function GetCursorPos (lpPoint : Win32.Windef.LPPOINT) return Win32.BOOL;

   function ClipCursor (lpRect : Win32.Wingdi.ac_RECT_t) return Win32.BOOL;

   function GetClipCursor (lpRect : Win32.Windef.LPRECT) return Win32.BOOL;

   function GetCursor return Win32.Windef.HCURSOR;

   function CreateCaret
     (hWnd    : Win32.Windef.HWND;
      hBitmap : Win32.Windef.HBITMAP;
      nWidth  : Win32.INT;
      nHeight : Win32.INT)
      return Win32.BOOL;

   function GetCaretBlinkTime return Win32.UINT;

   function SetCaretBlinkTime (uMSeconds : Win32.UINT) return Win32.BOOL;

   function DestroyCaret return Win32.BOOL;

   function HideCaret (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function ShowCaret (hWnd : Win32.Windef.HWND) return Win32.BOOL;

   function SetCaretPos (X : Win32.INT; Y : Win32.INT) return Win32.BOOL;

   function GetCaretPos (lpPoint : Win32.Windef.LPPOINT) return Win32.BOOL;

   function ClientToScreen
     (hWnd    : Win32.Windef.HWND;
      lpPoint : Win32.Windef.LPPOINT)
      return Win32.BOOL;

   function ScreenToClient
     (hWnd    : Win32.Windef.HWND;
      lpPoint : Win32.Windef.LPPOINT)
      return Win32.BOOL;

   function MapWindowPoints
     (hWndFrom : Win32.Windef.HWND;
      hWndTo   : Win32.Windef.HWND;
      lpPoints : Win32.Windef.LPPOINT;
      cPoints  : Win32.UINT)
      return Win32.INT;

   function WindowFromPoint
     (Point : Win32.Windef.POINT)
      return Win32.Windef.HWND;

   function ChildWindowFromPoint
     (hWndParent : Win32.Windef.HWND;
      Point      : Win32.Windef.POINT)
      return Win32.Windef.HWND;

   function GetSysColor (nIndex : Win32.INT) return Win32.DWORD;

   function SetSysColors
     (cElements    : Win32.INT;
      lpaElements  : Win32.PCINT;
      lpaRgbValues : Win32.PCDWORD)
      return Win32.BOOL;

   function DrawFocusRect
     (hDC  : Win32.Windef.HDC;
      lprc : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function FillRect
     (hDC  : Win32.Windef.HDC;
      lprc : Win32.Wingdi.ac_RECT_t;
      hbr  : Win32.Windef.HBRUSH)
      return Win32.INT;

   function FrameRect
     (hDC  : Win32.Windef.HDC;
      lprc : Win32.Wingdi.ac_RECT_t;
      hbr  : Win32.Windef.HBRUSH)
      return Win32.INT;

   function InvertRect
     (hDC  : Win32.Windef.HDC;
      lprc : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function SetRect
     (lprc    : Win32.Windef.LPRECT;
      xLeft   : Win32.INT;
      yTop    : Win32.INT;
      xRight  : Win32.INT;
      yBottom : Win32.INT)
      return Win32.BOOL;

   function SetRectEmpty (lprc : Win32.Windef.LPRECT) return Win32.BOOL;

   function CopyRect
     (lprcDst : Win32.Windef.LPRECT;
      lprcSrc : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function InflateRect
     (lprc : Win32.Windef.LPRECT;
      dx   : Win32.INT;
      dy   : Win32.INT)
      return Win32.BOOL;

   function IntersectRect
     (lprcDst  : Win32.Windef.LPRECT;
      lprcSrc1 : Win32.Wingdi.ac_RECT_t;
      lprcSrc2 : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function UnionRect
     (lprcDst  : Win32.Windef.LPRECT;
      lprcSrc1 : Win32.Wingdi.ac_RECT_t;
      lprcSrc2 : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function SubtractRect
     (lprcDst  : Win32.Windef.LPRECT;
      lprcSrc1 : Win32.Wingdi.ac_RECT_t;
      lprcSrc2 : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function OffsetRect
     (lprc : Win32.Windef.LPRECT;
      dx   : Win32.INT;
      dy   : Win32.INT)
      return Win32.BOOL;

   function IsRectEmpty (lprc : Win32.Wingdi.ac_RECT_t) return Win32.BOOL;

   function EqualRect
     (lprc1 : Win32.Wingdi.ac_RECT_t;
      lprc2 : Win32.Wingdi.ac_RECT_t)
      return Win32.BOOL;

   function PtInRect
     (lprc : Win32.Wingdi.ac_RECT_t;
      pt   : Win32.Windef.POINT)
      return Win32.BOOL;

   function GetWindowWord
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.WORD;

   function SetWindowWord
     (hWnd     : Win32.Windef.HWND;
      nIndex   : Win32.INT;
      wNewWord : Win32.WORD)
      return Win32.WORD;

   function GetWindowLongA
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.LONG;

   function GetWindowLong
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.LONG renames GetWindowLongA;

   function GetWindowLongW
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.LONG;

   function SetWindowLongA
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG)
      return Win32.LONG;

   function SetWindowLong
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG)
      return Win32.LONG renames SetWindowLongA;

   function SetWindowLongW
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG)
      return Win32.LONG;

   function GetWindowLongPtrA
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.LONG_PTR;

   function GetWindowLongPtr
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.LONG_PTR renames GetWindowLongPtrA;

   function GetWindowLongPtrW
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.LONG_PTR;

   function SetWindowLongPtrA
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG_PTR)
      return Win32.LONG_PTR;

   function SetWindowLongPtr
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG_PTR)
      return Win32.LONG_PTR renames SetWindowLongPtrA;

   function SetWindowLongPtrW
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG_PTR)
      return Win32.LONG_PTR;

   function GetClassWord
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.WORD;

   function SetClassWord
     (hWnd     : Win32.Windef.HWND;
      nIndex   : Win32.INT;
      wNewWord : Win32.WORD)
      return Win32.WORD;

   function GetClassLongA
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.DWORD;

   function GetClassLong
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.DWORD renames GetClassLongA;

   function GetClassLongW
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.DWORD;

   function SetClassLongA
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG)
      return Win32.DWORD;

   function SetClassLong
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG)
      return Win32.DWORD renames SetClassLongA;

   function SetClassLongW
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG)
      return Win32.DWORD;

   function GetClassLongPtrA
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.ULONG_PTR;

   function GetClassLongPtr
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.ULONG_PTR renames GetClassLongPtrA;

   function GetClassLongPtrW
     (hWnd   : Win32.Windef.HWND;
      nIndex : Win32.INT)
      return Win32.ULONG_PTR;

   function SetClassLongPtrA
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG_PTR)
      return Win32.ULONG_PTR;

   function SetClassLongPtr
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG_PTR)
      return Win32.ULONG_PTR renames SetClassLongPtrA;

   function SetClassLongPtrW
     (hWnd      : Win32.Windef.HWND;
      nIndex    : Win32.INT;
      dwNewLong : Win32.LONG_PTR)
      return Win32.ULONG_PTR;

   function GetDesktopWindow return Win32.Windef.HWND;

   function GetParent (hWnd : Win32.Windef.HWND) return Win32.Windef.HWND;

   function SetParent
     (hWndChild     : Win32.Windef.HWND;
      hWndNewParent : Win32.Windef.HWND)
      return Win32.Windef.HWND;

   function EnumChildWindows
     (hWndParent : Win32.Windef.HWND;
      lpEnumFunc : WNDENUMPROC;
      lParam     : Win32.LPARAM)
      return Win32.BOOL;

   function FindWindowA
     (lpClassName  : Win32.LPCSTR;
      lpWindowName : Win32.LPCSTR)
      return Win32.Windef.HWND;

   function FindWindow
     (lpClassName  : Win32.LPCSTR;
      lpWindowName : Win32.LPCSTR)
      return Win32.Windef.HWND renames FindWindowA;

   function FindWindowW
     (lpClassName  : Win32.LPCWSTR;
      lpWindowName : Win32.LPCWSTR)
      return Win32.Windef.HWND;

   function EnumWindows
     (lpEnumFunc : WNDENUMPROC;
      lParam     : Win32.LPARAM)
      return Win32.BOOL;

   function EnumThreadWindows
     (dwThreadId : Win32.DWORD;
      lpfn       : WNDENUMPROC;
      lParam     : Win32.LPARAM)
      return Win32.BOOL;

   function EnumTaskWindows
     (dwThreadId : Win32.DWORD;
      lpfn       : WNDENUMPROC;
      lParam     : Win32.LPARAM)
      return Win32.BOOL renames EnumThreadWindows;

   function GetClassNameA
     (hWnd        : Win32.Windef.HWND;
      lpClassName : Win32.LPSTR;
      nMaxCount   : Win32.INT)
      return Win32.INT;

   function GetClassName
     (hWnd        : Win32.Windef.HWND;
      lpClassName : Win32.LPSTR;
      nMaxCount   : Win32.INT)
      return Win32.INT renames GetClassNameA;

   function GetClassNameW
     (hWnd        : Win32.Windef.HWND;
      lpClassName : Win32.LPWSTR;
      nMaxCount   : Win32.INT)
      return Win32.INT;

   function GetTopWindow
     (hWnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;

   function GetWindowThreadProcessId
     (hWnd          : Win32.Windef.HWND;
      lpdwProcessId : Win32.LPDWORD)
      return Win32.DWORD;

   function GetWindowTask (H : Win32.Windef.HWND) return Win32.Winnt.HANDLE;

   function GetLastActivePopup
     (hWnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;

   function GetWindow
     (hWnd : Win32.Windef.HWND;
      uCmd : Win32.UINT)
      return Win32.Windef.HWND;

   function GetNextWindow
     (hWnd : Win32.Windef.HWND;
      uCmd : Win32.UINT)
      return Win32.Windef.HWND renames GetWindow;

   function SetWindowsHookA
     (nFilterType   : Win32.INT;
      pfnFilterProc : HOOKPROC)
      return Win32.Windef.HHOOK;

   function SetWindowsHook
     (nFilterType   : Win32.INT;
      pfnFilterProc : HOOKPROC)
      return Win32.Windef.HHOOK renames SetWindowsHookA;

   function SetWindowsHookW
     (nFilterType   : Win32.INT;
      pfnFilterProc : HOOKPROC)
      return Win32.Windef.HHOOK;

   function UnhookWindowsHook
     (nCode         : Win32.INT;
      pfnFilterProc : HOOKPROC)
      return Win32.BOOL;

   function SetWindowsHookExA
     (idHook     : Win32.INT;
      lpfn       : HOOKPROC;
      hmod       : Win32.Windef.HINSTANCE;
      dwThreadId : Win32.DWORD)
      return Win32.Windef.HHOOK;

   function SetWindowsHookEx
     (idHook     : Win32.INT;
      lpfn       : HOOKPROC;
      hmod       : Win32.Windef.HINSTANCE;
      dwThreadId : Win32.DWORD)
      return Win32.Windef.HHOOK renames SetWindowsHookExA;

   function SetWindowsHookExW
     (idHook     : Win32.INT;
      lpfn       : HOOKPROC;
      hmod       : Win32.Windef.HINSTANCE;
      dwThreadId : Win32.DWORD)
      return Win32.Windef.HHOOK;

   function UnhookWindowsHookEx
     (hhk  : Win32.Windef.HHOOK)
      return Win32.BOOL;

   function CallNextHookEx
     (hhk    : Win32.Windef.HHOOK;
      nCode  : Win32.INT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function DefHookProc
     (nCode  : Win32.INT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      phhk   : access Win32.Windef.HHOOK)
      return Win32.LRESULT;

   function LoadBitmapA
     (hInstance    : Win32.Windef.HINSTANCE;
      lpBitmapName : Win32.LPCSTR)
      return Win32.Windef.HBITMAP;

   function LoadBitmap
     (hInstance    : Win32.Windef.HINSTANCE;
      lpBitmapName : Win32.LPCSTR)
      return Win32.Windef.HBITMAP renames LoadBitmapA;

   function LoadBitmapW
     (hInstance    : Win32.Windef.HINSTANCE;
      lpBitmapName : Win32.LPCWSTR)
      return Win32.Windef.HBITMAP;

   function LoadCursorA
     (hInstance    : Win32.Windef.HINSTANCE;
      lpCursorName : Win32.LPCSTR)
      return Win32.Windef.HCURSOR;

   function LoadCursor
     (hInstance    : Win32.Windef.HINSTANCE;
      lpCursorName : Win32.LPCSTR)
      return Win32.Windef.HCURSOR renames LoadCursorA;

   function LoadCursorW
     (hInstance    : Win32.Windef.HINSTANCE;
      lpCursorName : Win32.LPCWSTR)
      return Win32.Windef.HCURSOR;

   function CreateCursor
     (hInst      : Win32.Windef.HINSTANCE;
      xHotSpot   : Win32.INT;
      yHotSpot   : Win32.INT;
      nWidth     : Win32.INT;
      nHeight    : Win32.INT;
      pvANDPlane : Win32.PCVOID;
      pvXORPlane : Win32.PCVOID)
      return Win32.Windef.HCURSOR;

   function DestroyCursor
     (hCursor : Win32.Windef.HCURSOR)
      return Win32.BOOL;

   function LoadIconA
     (hInstance  : Win32.Windef.HINSTANCE;
      lpIconName : Win32.LPCSTR)
      return Win32.Windef.HICON;

   function LoadIcon
     (hInstance  : Win32.Windef.HINSTANCE;
      lpIconName : Win32.LPCSTR)
      return Win32.Windef.HICON renames LoadIconA;

   function LoadIconW
     (hInstance  : Win32.Windef.HINSTANCE;
      lpIconName : Win32.LPCWSTR)
      return Win32.Windef.HICON;

   function CreateIcon
     (hInstance  : Win32.Windef.HINSTANCE;
      nWidth     : Win32.INT;
      nHeight    : Win32.INT;
      cPlanes    : Win32.BYTE;
      cBitsPixel : Win32.BYTE;
      lpbANDbits : Win32.PCBYTE;
      lpbXORbits : Win32.PCBYTE)
      return Win32.Windef.HICON;

   function DestroyIcon (hIcon : Win32.Windef.HICON) return Win32.BOOL;

   function LookupIconIdFromDirectory
     (presbits : Win32.PBYTE;
      fIcon    : Win32.BOOL)
      return Win32.INT;

   function CreateIconFromResource
     (presbits  : Win32.PBYTE;
      dwResSize : Win32.DWORD;
      fIcon     : Win32.BOOL;
      dwVer     : Win32.DWORD)
      return Win32.Windef.HICON;

   function CreateIconIndirect
     (piconinfo : Win32.Winuser.PICONINFO)
      return Win32.Windef.HICON;

   function CopyIcon (hIcon : Win32.Windef.HICON) return Win32.Windef.HICON;

   function CopyCursor
     (hcur : Win32.Windef.HCURSOR)
      return Win32.Windef.HCURSOR;

   function GetIconInfo
     (hIcon     : Win32.Windef.HICON;
      piconinfo : Win32.Winuser.PICONINFO)
      return Win32.BOOL;

   function LoadStringA
     (hInstance  : Win32.Windef.HINSTANCE;
      uID        : Win32.UINT;
      lpBuffer   : Win32.LPSTR;
      nBufferMax : Win32.INT)
      return Win32.INT;

   function LoadString
     (hInstance  : Win32.Windef.HINSTANCE;
      uID        : Win32.UINT;
      lpBuffer   : Win32.LPSTR;
      nBufferMax : Win32.INT)
      return Win32.INT renames LoadStringA;

   function LoadStringW
     (hInstance  : Win32.Windef.HINSTANCE;
      uID        : Win32.UINT;
      lpBuffer   : Win32.LPWSTR;
      nBufferMax : Win32.INT)
      return Win32.INT;

   function IsDialogMessageA
     (hDlg  : Win32.Windef.HWND;
      lpMsg : access MSG)
      return Win32.BOOL;

   function IsDialogMessage
     (hDlg  : Win32.Windef.HWND;
      lpMsg : access MSG)
      return Win32.BOOL renames IsDialogMessageA;

   function IsDialogMessageW
     (hDlg  : Win32.Windef.HWND;
      lpMsg : access MSG)
      return Win32.BOOL;

   function MapDialogRect
     (hDlg   : Win32.Windef.HWND;
      lpRect : Win32.Windef.LPRECT)
      return Win32.BOOL;

   function DlgDirListA
     (hDlg          : Win32.Windef.HWND;
      lpPathSpec    : Win32.LPSTR;
      nIDListBox    : Win32.INT;
      nIDStaticPath : Win32.INT;
      uFileType     : Win32.UINT)
      return Win32.INT;

   function DlgDirList
     (hDlg          : Win32.Windef.HWND;
      lpPathSpec    : Win32.LPSTR;
      nIDListBox    : Win32.INT;
      nIDStaticPath : Win32.INT;
      uFileType     : Win32.UINT)
      return Win32.INT renames DlgDirListA;

   function DlgDirListW
     (hDlg          : Win32.Windef.HWND;
      lpPathSpec    : Win32.LPWSTR;
      nIDListBox    : Win32.INT;
      nIDStaticPath : Win32.INT;
      uFileType     : Win32.UINT)
      return Win32.INT;

   function DlgDirSelectExA
     (hDlg       : Win32.Windef.HWND;
      lpString   : Win32.LPSTR;
      nCount     : Win32.INT;
      nIDListBox : Win32.INT)
      return Win32.BOOL;

   function DlgDirSelectEx
     (hDlg       : Win32.Windef.HWND;
      lpString   : Win32.LPSTR;
      nCount     : Win32.INT;
      nIDListBox : Win32.INT)
      return Win32.BOOL renames DlgDirSelectExA;

   function DlgDirSelectExW
     (hDlg       : Win32.Windef.HWND;
      lpString   : Win32.LPWSTR;
      nCount     : Win32.INT;
      nIDListBox : Win32.INT)
      return Win32.BOOL;

   function DlgDirListComboBoxA
     (hDlg          : Win32.Windef.HWND;
      lpPathSpec    : Win32.LPSTR;
      nIDComboBox   : Win32.INT;
      nIDStaticPath : Win32.INT;
      uFiletype     : Win32.UINT)
      return Win32.INT;

   function DlgDirListComboBox
     (hDlg          : Win32.Windef.HWND;
      lpPathSpec    : Win32.LPSTR;
      nIDComboBox   : Win32.INT;
      nIDStaticPath : Win32.INT;
      uFiletype     : Win32.UINT)
      return Win32.INT renames DlgDirListComboBoxA;

   function DlgDirListComboBoxW
     (hDlg          : Win32.Windef.HWND;
      lpPathSpec    : Win32.LPWSTR;
      nIDComboBox   : Win32.INT;
      nIDStaticPath : Win32.INT;
      uFiletype     : Win32.UINT)
      return Win32.INT;

   function DlgDirSelectComboBoxExA
     (hDlg        : Win32.Windef.HWND;
      lpString    : Win32.LPSTR;
      nCount      : Win32.INT;
      nIDComboBox : Win32.INT)
      return Win32.BOOL;

   function DlgDirSelectComboBoxEx
     (hDlg        : Win32.Windef.HWND;
      lpString    : Win32.LPSTR;
      nCount      : Win32.INT;
      nIDComboBox : Win32.INT)
      return Win32.BOOL renames DlgDirSelectComboBoxExA;

   function DlgDirSelectComboBoxExW
     (hDlg        : Win32.Windef.HWND;
      lpString    : Win32.LPWSTR;
      nCount      : Win32.INT;
      nIDComboBox : Win32.INT)
      return Win32.BOOL;

   function DefFrameProcA
     (hWnd          : Win32.Windef.HWND;
      hWndMDIClient : Win32.Windef.HWND;
      uMsg          : Win32.UINT;
      wParam        : Win32.WPARAM;
      lParam        : Win32.LPARAM)
      return Win32.LRESULT;

   function DefFrameProc
     (hWnd          : Win32.Windef.HWND;
      hWndMDIClient : Win32.Windef.HWND;
      uMsg          : Win32.UINT;
      wParam        : Win32.WPARAM;
      lParam        : Win32.LPARAM)
      return Win32.LRESULT renames DefFrameProcA;

   function DefFrameProcW
     (hWnd          : Win32.Windef.HWND;
      hWndMDIClient : Win32.Windef.HWND;
      uMsg          : Win32.UINT;
      wParam        : Win32.WPARAM;
      lParam        : Win32.LPARAM)
      return Win32.LRESULT;

   function DefMDIChildProcA
     (hWnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function DefMDIChildProc
     (hWnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT renames DefMDIChildProcA;

   function DefMDIChildProcW
     (hWnd   : Win32.Windef.HWND;
      uMsg   : Win32.UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM)
      return Win32.LRESULT;

   function TranslateMDISysAccel
     (hWndClient : Win32.Windef.HWND;
      lpMsg      : access MSG)
      return Win32.BOOL;

   function ArrangeIconicWindows
     (hWnd : Win32.Windef.HWND)
      return Win32.UINT;

   function CreateMDIWindowA
     (lpClassName  : Win32.LPSTR;
      lpWindowName : Win32.LPSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hInstance    : Win32.Windef.HINSTANCE;
      lParam       : Win32.LPARAM)
      return Win32.Windef.HWND;

   function CreateMDIWindow
     (lpClassName  : Win32.LPSTR;
      lpWindowName : Win32.LPSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hInstance    : Win32.Windef.HINSTANCE;
      lParam       : Win32.LPARAM)
      return Win32.Windef.HWND renames CreateMDIWindowA;

   function CreateMDIWindowW
     (lpClassName  : Win32.LPWSTR;
      lpWindowName : Win32.LPWSTR;
      dwStyle      : Win32.DWORD;
      X            : Win32.INT;
      Y            : Win32.INT;
      nWidth       : Win32.INT;
      nHeight      : Win32.INT;
      hWndParent   : Win32.Windef.HWND;
      hInstance    : Win32.Windef.HINSTANCE;
      lParam       : Win32.LPARAM)
      return Win32.Windef.HWND;

   function WinHelpA
     (hWndMain : Win32.Windef.HWND;
      lpszHelp : Win32.LPCSTR;
      uCommand : Win32.UINT;
      dwData   : Win32.DWORD)
      return Win32.BOOL;

   function WinHelp
     (hWndMain : Win32.Windef.HWND;
      lpszHelp : Win32.LPCSTR;
      uCommand : Win32.UINT;
      dwData   : Win32.DWORD)
      return Win32.BOOL renames WinHelpA;

   function WinHelpW
     (hWndMain : Win32.Windef.HWND;
      lpszHelp : Win32.LPCWSTR;
      uCommand : Win32.UINT;
      dwData   : Win32.DWORD)
      return Win32.BOOL;

   function SystemParametersInfoA
     (uiAction : Win32.UINT;
      uiParam  : Win32.UINT;
      pvParam  : Win32.PVOID;
      fWinIni  : Win32.UINT)
      return Win32.BOOL;

   function SystemParametersInfo
     (uiAction : Win32.UINT;
      uiParam  : Win32.UINT;
      pvParam  : Win32.PVOID;
      fWinIni  : Win32.UINT)
      return Win32.BOOL renames SystemParametersInfoA;

   function SystemParametersInfoW
     (uiAction : Win32.UINT;
      uiParam  : Win32.UINT;
      pvParam  : Win32.PVOID;
      fWinIni  : Win32.UINT)
      return Win32.BOOL;

   procedure SetDebugErrorLevel (dwLevel : Win32.DWORD);

   procedure SetLastErrorEx (dwErrCode : Win32.DWORD; dwType : Win32.DWORD);

private
   pragma Convention (C, CREATESTRUCTA);
   pragma Convention (C_Pass_By_Copy, CBT_CREATEWNDA);
   pragma Convention (C, CREATESTRUCTW);
   pragma Convention (C_Pass_By_Copy, CBT_CREATEWNDW);
   pragma Convention (C_Pass_By_Copy, CBTACTIVATESTRUCT);
   pragma Convention (C, EVENTMSG);
   pragma Convention (C_Pass_By_Copy, CWPSTRUCT);
   pragma Convention (C, DEBUGHOOKINFO);
   pragma Convention (C, MOUSEHOOKSTRUCT);
   pragma Convention (C, WNDCLASSA);
   pragma Convention (C, WNDCLASSW);
   pragma Convention (C, MSG);
   pragma Convention (C, MINMAXINFO);
   pragma Convention (C_Pass_By_Copy, COPYDATASTRUCT);
   pragma Convention (C, WINDOWPOS);
   pragma Convention (C, RECT_Array);
   pragma Convention (C, NCCALCSIZE_PARAMS);
   pragma Convention (C_Pass_By_Copy, ACCEL);
   pragma Convention (C, PAINTSTRUCT);
   pragma Convention (C, WINDOWPLACEMENT);
   pragma Convention (C, MEASUREITEMSTRUCT);
   pragma Convention (C, DRAWITEMSTRUCT);
   pragma Convention (C, DELETEITEMSTRUCT);
   pragma Convention (C, COMPAREITEMSTRUCT);
   pragma Convention (C, DLGTEMPLATE);
   pragma Convention (C, DLGITEMTEMPLATE);
   pragma Convention (C_Pass_By_Copy, MENUITEMTEMPLATEHEADER);
   pragma Convention (C_Pass_By_Copy, MENUITEMTEMPLATE);
   pragma Convention (C, ICONINFO);
   pragma Convention (C, MDICREATESTRUCTA);
   pragma Convention (C, MDICREATESTRUCTW);
   pragma Convention (C_Pass_By_Copy, CLIENTCREATESTRUCT);
   pragma Convention (C_Pass_By_Copy, MULTIKEYHELPA);
   pragma Convention (C_Pass_By_Copy, MULTIKEYHELPW);
   pragma Convention (C, HELPWININFOA);
   pragma Convention (C, HELPWININFOW);
   pragma Convention (C, FILTERKEYS);
   pragma Convention (C_Pass_By_Copy, STICKYKEYS);
   pragma Convention (C, MOUSEKEYS);
   pragma Convention (C_Pass_By_Copy, ACCESSTIMEOUT);
   pragma Convention (C, SOUNDSENTRYA);
   pragma Convention (C, SOUNDSENTRYW);
   pragma Convention (C_Pass_By_Copy, TOGGLEKEYS);

   function L is new Ada.Unchecked_Conversion (ULONG_PTR, LPSTR);

   RT_CURSOR_NB : constant := 1;
   RT_ICON_NB   : constant := 3;

   RT_CURSOR       : constant LPSTR := L (RT_CURSOR_NB);
   RT_BITMAP       : constant LPSTR := L (2);
   RT_ICON         : constant LPSTR := L (RT_ICON_NB);
   RT_MENU         : constant LPSTR := L (4);
   RT_DIALOG       : constant LPSTR := L (5);
   RT_STRING       : constant LPSTR := L (6);
   RT_FONTDIR      : constant LPSTR := L (7);
   RT_FONT         : constant LPSTR := L (8);
   RT_ACCELERATOR  : constant LPSTR := L (9);
   RT_RCDATA       : constant LPSTR := L (10);
   RT_MESSAGETABLE : constant LPSTR := L (11);
   DIFFERENCE      : constant := 11;
   use type Win32.WORD;
   RT_GROUP_CURSOR : constant LPSTR := L (RT_CURSOR_NB + DIFFERENCE);
   RT_GROUP_ICON   : constant LPSTR := L (RT_ICON_NB + DIFFERENCE);
   RT_VERSION      : constant LPSTR := L (20);
   RT_DLGINCLUDE   : constant LPSTR := L (17);
   IDC_ARROW       : constant LPSTR := L (32512);
   IDC_IBEAM       : constant LPSTR := L (32513);
   IDC_WAIT        : constant LPSTR := L (32514);
   IDC_CROSS       : constant LPSTR := L (32515);
   IDC_UPARROW     : constant LPSTR := L (32516);
   IDC_SIZE        : constant LPSTR := L (32640);
   IDC_ICON        : constant LPSTR := L (32641);
   IDC_SIZENWSE    : constant LPSTR := L (32642);
   IDC_SIZENESW    : constant LPSTR := L (32643);
   IDC_SIZEWE      : constant LPSTR := L (32644);
   IDC_SIZENS      : constant LPSTR := L (32645);
   IDC_SIZEALL     : constant LPSTR := L (32646);
   IDC_NO          : constant LPSTR := L (32648);
   IDC_APPSTARTING : constant LPSTR := L (32650);
   IDI_APPLICATION : constant LPSTR := L (32512);
   IDI_HAND        : constant LPSTR := L (32513);
   IDI_QUESTION    : constant LPSTR := L (32514);
   IDI_EXCLAMATION : constant LPSTR := L (32515);
   IDI_ASTERISK    : constant LPSTR := L (32516);

   function To_Hwnd is new Ada.Unchecked_Conversion (
      Storage_Offset,
      Win32.Windef.HWND);

   HWND_BROADCAST  : constant Win32.Windef.HWND := To_Hwnd (16#ffff#);
   HWND_DESKTOP    : constant Win32.Windef.HWND := To_Hwnd (8#0#);
   HWND_TOP        : constant Win32.Windef.HWND := To_Hwnd (8#0#);
   HWND_BOTTOM     : constant Win32.Windef.HWND := To_Hwnd (1);
   use type Win32.LONG;
   HWND_TOPMOST    : constant Win32.Windef.HWND := To_Hwnd (-1);
   HWND_NOTOPMOST  : constant Win32.Windef.HWND := To_Hwnd (-2);

   pragma Inline (POINTSTOPOINT);
   pragma Inline (POINTTOPOINTS);
   pragma Inline (MAKEWPARAM);
   pragma Inline (MAKELPARAM);
   pragma Inline (MAKELRESULT);
   pragma Inline (ExitWindows);
   pragma Inline (CreateWindowA);
   pragma Inline (CreateWindowW);
   pragma Inline (CreateDialogA);
   pragma Inline (CreateDialogW);
   pragma Inline (CreateDialogIndirectA);
   pragma Inline (CreateDialogIndirectW);
   pragma Inline (DialogBoxA);
   pragma Inline (DialogBoxW);
   pragma Inline (DialogBoxIndirectA);
   pragma Inline (DialogBoxIndirectW);
   pragma Inline (GetWindowTask);
   pragma Inline (DefHookProc);
   pragma Inline (CopyCursor);

   pragma Import (Stdcall, LoadKeyboardLayoutA, "LoadKeyboardLayoutA");
   pragma Import (Stdcall, LoadKeyboardLayoutW, "LoadKeyboardLayoutW");
   pragma Import (Stdcall, ActivateKeyboardLayout, "ActivateKeyboardLayout");
   pragma Import (Stdcall, UnloadKeyboardLayout, "UnloadKeyboardLayout");
   pragma Import (Stdcall, GetKeyboardLayoutNameA, "GetKeyboardLayoutNameA");
   pragma Import (Stdcall, GetKeyboardLayoutNameW, "GetKeyboardLayoutNameW");
   pragma Import (Stdcall, GetThreadDesktop, "GetThreadDesktop");
   pragma Import
     (Stdcall,
      GetProcessWindowStation,
      "GetProcessWindowStation");
   pragma Import (Stdcall, SetUserObjectSecurity, "SetUserObjectSecurity");
   pragma Import (Stdcall, GetUserObjectSecurity, "GetUserObjectSecurity");
   pragma Import (Stdcall, RegisterWindowMessageA, "RegisterWindowMessageA");
   pragma Import (Stdcall, RegisterWindowMessageW, "RegisterWindowMessageW");
   pragma Import (Stdcall, GetMessageA, "GetMessageA");
   pragma Import (Stdcall, GetMessageW, "GetMessageW");
   pragma Import (Stdcall, TranslateMessage, "TranslateMessage");
   pragma Import (Stdcall, DispatchMessageA, "DispatchMessageA");
   pragma Import (Stdcall, DispatchMessageW, "DispatchMessageW");
   pragma Import (Stdcall, SetMessageQueue, "SetMessageQueue");
   pragma Import (Stdcall, PeekMessageA, "PeekMessageA");
   pragma Import (Stdcall, PeekMessageW, "PeekMessageW");
   pragma Import (Stdcall, RegisterHotKey, "RegisterHotKey");
   pragma Import (Stdcall, UnregisterHotKey, "UnregisterHotKey");
   pragma Import (Stdcall, ExitWindowsEx, "ExitWindowsEx");
   pragma Import (Stdcall, SwapMouseButton, "SwapMouseButton");
   pragma Import (Stdcall, GetMessagePos, "GetMessagePos");
   pragma Import (Stdcall, GetMessageTime, "GetMessageTime");
   pragma Import (Stdcall, GetMessageExtraInfo, "GetMessageExtraInfo");
   pragma Import (Stdcall, SendMessageA, "SendMessageA");
   pragma Import (Stdcall, SendMessageW, "SendMessageW");
   pragma Import (Stdcall, SendMessageTimeoutA, "SendMessageTimeoutA");
   pragma Import (Stdcall, SendMessageTimeoutW, "SendMessageTimeoutW");
   pragma Import (Stdcall, SendNotifyMessageA, "SendNotifyMessageA");
   pragma Import (Stdcall, SendNotifyMessageW, "SendNotifyMessageW");
   pragma Import (Stdcall, SendMessageCallbackA, "SendMessageCallbackA");
   pragma Import (Stdcall, SendMessageCallbackW, "SendMessageCallbackW");
   pragma Import (Stdcall, PostMessageA, "PostMessageA");
   pragma Import (Stdcall, PostMessageW, "PostMessageW");
   pragma Import (Stdcall, PostThreadMessageA, "PostThreadMessageA");
   pragma Import (Stdcall, PostThreadMessageW, "PostThreadMessageW");
   pragma Import (Stdcall, AttachThreadInput, "AttachThreadInput");
   pragma Import (Stdcall, ReplyMessage, "ReplyMessage");
   pragma Import (Stdcall, WaitMessage, "WaitMessage");
   pragma Import (Stdcall, WaitForInputIdle, "WaitForInputIdle");
   pragma Import (Stdcall, DefWindowProcA, "DefWindowProcA");
   pragma Import (Stdcall, DefWindowProcW, "DefWindowProcW");
   pragma Import (Stdcall, PostQuitMessage, "PostQuitMessage");
   pragma Import (Stdcall, CallWindowProcA, "CallWindowProcA");
   pragma Import (Stdcall, CallWindowProcW, "CallWindowProcW");
   pragma Import (Stdcall, InSendMessage, "InSendMessage");
   pragma Import (Stdcall, GetDoubleClickTime, "GetDoubleClickTime");
   pragma Import (Stdcall, SetDoubleClickTime, "SetDoubleClickTime");
   pragma Import (Stdcall, RegisterClassA, "RegisterClassA");
   pragma Import (Stdcall, RegisterClassW, "RegisterClassW");
   pragma Import (Stdcall, UnregisterClassA, "UnregisterClassA");
   pragma Import (Stdcall, UnregisterClassW, "UnregisterClassW");
   pragma Import (Stdcall, GetClassInfoA, "GetClassInfoA");
   pragma Import (Stdcall, GetClassInfoW, "GetClassInfoW");
   pragma Import (Stdcall, CreateWindowExA, "CreateWindowExA");
   pragma Import (Stdcall, CreateWindowExW, "CreateWindowExW");
   pragma Import (Stdcall, IsWindow, "IsWindow");
   pragma Import (Stdcall, IsMenu, "IsMenu");
   pragma Import (Stdcall, IsChild, "IsChild");
   pragma Import (Stdcall, DestroyWindow, "DestroyWindow");
   pragma Import (Stdcall, ShowWindow, "ShowWindow");
   pragma Import (Stdcall, FlashWindow, "FlashWindow");
   pragma Import (Stdcall, ShowOwnedPopups, "ShowOwnedPopups");
   pragma Import (Stdcall, OpenIcon, "OpenIcon");
   pragma Import (Stdcall, CloseWindow, "CloseWindow");
   pragma Import (Stdcall, MoveWindow, "MoveWindow");
   pragma Import (Stdcall, SetWindowPos, "SetWindowPos");
   pragma Import (Stdcall, GetWindowPlacement, "GetWindowPlacement");
   pragma Import (Stdcall, SetWindowPlacement, "SetWindowPlacement");
   pragma Import (Stdcall, BeginDeferWindowPos, "BeginDeferWindowPos");
   pragma Import (Stdcall, DeferWindowPos, "DeferWindowPos");
   pragma Import (Stdcall, EndDeferWindowPos, "EndDeferWindowPos");
   pragma Import (Stdcall, IsWindowVisible, "IsWindowVisible");
   pragma Import (Stdcall, IsIconic, "IsIconic");
   pragma Import (Stdcall, AnyPopup, "AnyPopup");
   pragma Import (Stdcall, BringWindowToTop, "BringWindowToTop");
   pragma Import (Stdcall, IsZoomed, "IsZoomed");
   pragma Import (Stdcall, CreateDialogParamA, "CreateDialogParamA");
   pragma Import (Stdcall, CreateDialogParamW, "CreateDialogParamW");
   pragma Import
     (Stdcall,
      CreateDialogIndirectParamA,
      "CreateDialogIndirectParamA");
   pragma Import
     (Stdcall,
      CreateDialogIndirectParamW,
      "CreateDialogIndirectParamW");
   pragma Import (Stdcall, DialogBoxParamA, "DialogBoxParamA");
   pragma Import (Stdcall, DialogBoxParamW, "DialogBoxParamW");
   pragma Import
     (Stdcall,
      DialogBoxIndirectParamA,
      "DialogBoxIndirectParamA");
   pragma Import
     (Stdcall,
      DialogBoxIndirectParamW,
      "DialogBoxIndirectParamW");
   pragma Import (Stdcall, EndDialog, "EndDialog");
   pragma Import (Stdcall, GetDlgItem, "GetDlgItem");
   pragma Import (Stdcall, SetDlgItemInt, "SetDlgItemInt");
   pragma Import (Stdcall, GetDlgItemInt, "GetDlgItemInt");
   pragma Import (Stdcall, SetDlgItemTextA, "SetDlgItemTextA");
   pragma Import (Stdcall, SetDlgItemTextW, "SetDlgItemTextW");
   pragma Import (Stdcall, GetDlgItemTextA, "GetDlgItemTextA");
   pragma Import (Stdcall, GetDlgItemTextW, "GetDlgItemTextW");
   pragma Import (Stdcall, CheckDlgButton, "CheckDlgButton");
   pragma Import (Stdcall, CheckRadioButton, "CheckRadioButton");
   pragma Import (Stdcall, IsDlgButtonChecked, "IsDlgButtonChecked");
   pragma Import (Stdcall, SendDlgItemMessageA, "SendDlgItemMessageA");
   pragma Import (Stdcall, SendDlgItemMessageW, "SendDlgItemMessageW");
   pragma Import (Stdcall, GetNextDlgGroupItem, "GetNextDlgGroupItem");
   pragma Import (Stdcall, GetNextDlgTabItem, "GetNextDlgTabItem");
   pragma Import (Stdcall, GetDlgCtrlID, "GetDlgCtrlID");
   pragma Import (Stdcall, GetDialogBaseUnits, "GetDialogBaseUnits");
   pragma Import (Stdcall, DefDlgProcA, "DefDlgProcA");
   pragma Import (Stdcall, DefDlgProcW, "DefDlgProcW");
   pragma Import (Stdcall, CallMsgFilterA, "CallMsgFilterA");
   pragma Import (Stdcall, CallMsgFilterW, "CallMsgFilterW");
   pragma Import (Stdcall, OpenClipboard, "OpenClipboard");
   pragma Import (Stdcall, CloseClipboard, "CloseClipboard");
   pragma Import (Stdcall, GetClipboardOwner, "GetClipboardOwner");
   pragma Import (Stdcall, SetClipboardViewer, "SetClipboardViewer");
   pragma Import (Stdcall, GetClipboardViewer, "GetClipboardViewer");
   pragma Import (Stdcall, ChangeClipboardChain, "ChangeClipboardChain");
   pragma Import (Stdcall, SetClipboardData, "SetClipboardData");
   pragma Import (Stdcall, GetClipboardData, "GetClipboardData");
   pragma Import
     (Stdcall,
      RegisterClipboardFormatA,
      "RegisterClipboardFormatA");
   pragma Import
     (Stdcall,
      RegisterClipboardFormatW,
      "RegisterClipboardFormatW");
   pragma Import (Stdcall, CountClipboardFormats, "CountClipboardFormats");
   pragma Import (Stdcall, EnumClipboardFormats, "EnumClipboardFormats");
   pragma Import
     (Stdcall,
      GetClipboardFormatNameA,
      "GetClipboardFormatNameA");
   pragma Import
     (Stdcall,
      GetClipboardFormatNameW,
      "GetClipboardFormatNameW");
   pragma Import (Stdcall, EmptyClipboard, "EmptyClipboard");
   pragma Import
     (Stdcall,
      IsClipboardFormatAvailable,
      "IsClipboardFormatAvailable");
   pragma Import
     (Stdcall,
      GetPriorityClipboardFormat,
      "GetPriorityClipboardFormat");
   pragma Import (Stdcall, GetOpenClipboardWindow, "GetOpenClipboardWindow");
   pragma Import (Stdcall, CharToOemA, "CharToOemA");
   pragma Import (Stdcall, CharToOemW, "CharToOemW");
   pragma Import (Stdcall, OemToCharA, "OemToCharA");
   pragma Import (Stdcall, OemToCharW, "OemToCharW");
   pragma Import (Stdcall, CharToOemBuffA, "CharToOemBuffA");
   pragma Import (Stdcall, CharToOemBuffW, "CharToOemBuffW");
   pragma Import (Stdcall, OemToCharBuffA, "OemToCharBuffA");
   pragma Import (Stdcall, OemToCharBuffW, "OemToCharBuffW");
   pragma Import (Stdcall, CharUpperA, "CharUpperA");
   pragma Import (Stdcall, CharUpperW, "CharUpperW");
   pragma Import (Stdcall, CharUpperBuffA, "CharUpperBuffA");
   pragma Import (Stdcall, CharUpperBuffW, "CharUpperBuffW");
   pragma Import (Stdcall, CharLowerA, "CharLowerA");
   pragma Import (Stdcall, CharLowerW, "CharLowerW");
   pragma Import (Stdcall, CharLowerBuffA, "CharLowerBuffA");
   pragma Import (Stdcall, CharLowerBuffW, "CharLowerBuffW");
   pragma Import (Stdcall, CharNextA, "CharNextA");
   pragma Import (Stdcall, CharNextW, "CharNextW");
   pragma Import (Stdcall, CharPrevA, "CharPrevA");
   pragma Import (Stdcall, CharPrevW, "CharPrevW");
   pragma Import (Stdcall, IsCharAlphaA, "IsCharAlphaA");
   pragma Import (Stdcall, IsCharAlphaW, "IsCharAlphaW");
   pragma Import (Stdcall, IsCharAlphaNumericA, "IsCharAlphaNumericA");
   pragma Import (Stdcall, IsCharAlphaNumericW, "IsCharAlphaNumericW");
   pragma Import (Stdcall, IsCharUpperA, "IsCharUpperA");
   pragma Import (Stdcall, IsCharUpperW, "IsCharUpperW");
   pragma Import (Stdcall, IsCharLowerA, "IsCharLowerA");
   pragma Import (Stdcall, IsCharLowerW, "IsCharLowerW");
   pragma Import (Stdcall, SetFocus, "SetFocus");
   pragma Import (Stdcall, GetActiveWindow, "GetActiveWindow");
   pragma Import (Stdcall, GetFocus, "GetFocus");
   pragma Import (Stdcall, GetKBCodePage, "GetKBCodePage");
   pragma Import (Stdcall, GetKeyState, "GetKeyState");
   pragma Import (Stdcall, GetAsyncKeyState, "GetAsyncKeyState");
   pragma Import (Stdcall, GetKeyboardState, "GetKeyboardState");
   pragma Import (Stdcall, SetKeyboardState, "SetKeyboardState");
   pragma Import (Stdcall, GetKeyNameTextA, "GetKeyNameTextA");
   pragma Import (Stdcall, GetKeyNameTextW, "GetKeyNameTextW");
   pragma Import (Stdcall, GetKeyboardType, "GetKeyboardType");
   pragma Import (Stdcall, ToAscii, "ToAscii");
   pragma Import (Stdcall, ToUnicode, "ToUnicode");
   pragma Import (Stdcall, OemKeyScan, "OemKeyScan");
   pragma Import (Stdcall, VkKeyScanA, "VkKeyScanA");
   pragma Import (Stdcall, VkKeyScanW, "VkKeyScanW");
   pragma Import (Stdcall, keybd_event, "keybd_event");
   pragma Import (Stdcall, mouse_event, "mouse_event");
   pragma Import (Stdcall, MapVirtualKeyA, "MapVirtualKeyA");
   pragma Import (Stdcall, MapVirtualKeyW, "MapVirtualKeyW");
   pragma Import (Stdcall, GetInputState, "GetInputState");
   pragma Import (Stdcall, GetQueueStatus, "GetQueueStatus");
   pragma Import (Stdcall, GetCapture, "GetCapture");
   pragma Import (Stdcall, SetCapture, "SetCapture");
   pragma Import (Stdcall, ReleaseCapture, "ReleaseCapture");
   pragma Import
     (Stdcall,
      MsgWaitForMultipleObjects,
      "MsgWaitForMultipleObjects");
   pragma Import (Stdcall, SetTimer, "SetTimer");
   pragma Import (Stdcall, KillTimer, "KillTimer");
   pragma Import (Stdcall, IsWindowUnicode, "IsWindowUnicode");
   pragma Import (Stdcall, EnableWindow, "EnableWindow");
   pragma Import (Stdcall, IsWindowEnabled, "IsWindowEnabled");
   pragma Import (Stdcall, LoadAcceleratorsA, "LoadAcceleratorsA");
   pragma Import (Stdcall, LoadAcceleratorsW, "LoadAcceleratorsW");
   pragma Import
     (Stdcall,
      CreateAcceleratorTableA,
      "CreateAcceleratorTableA");
   pragma Import
     (Stdcall,
      CreateAcceleratorTableW,
      "CreateAcceleratorTableW");
   pragma Import
     (Stdcall,
      DestroyAcceleratorTable,
      "DestroyAcceleratorTable");
   pragma Import (Stdcall, CopyAcceleratorTableA, "CopyAcceleratorTableA");
   pragma Import (Stdcall, CopyAcceleratorTableW, "CopyAcceleratorTableW");
   pragma Import (Stdcall, TranslateAcceleratorA, "TranslateAcceleratorA");
   pragma Import (Stdcall, TranslateAcceleratorW, "TranslateAcceleratorW");
   pragma Import (Stdcall, GetSystemMetrics, "GetSystemMetrics");
   pragma Import (Stdcall, LoadMenuA, "LoadMenuA");
   pragma Import (Stdcall, LoadMenuW, "LoadMenuW");
   pragma Import (Stdcall, LoadMenuIndirectA, "LoadMenuIndirectA");
   pragma Import (Stdcall, LoadMenuIndirectW, "LoadMenuIndirectW");
   pragma Import (Stdcall, GetMenu, "GetMenu");
   pragma Import (Stdcall, SetMenu, "SetMenu");
   pragma Import (Stdcall, ChangeMenuA, "ChangeMenuA");
   pragma Import (Stdcall, ChangeMenuW, "ChangeMenuW");
   pragma Import (Stdcall, HiliteMenuItem, "HiliteMenuItem");
   pragma Import (Stdcall, GetMenuStringA, "GetMenuStringA");
   pragma Import (Stdcall, GetMenuStringW, "GetMenuStringW");
   pragma Import (Stdcall, GetMenuState, "GetMenuState");
   pragma Import (Stdcall, DrawMenuBar, "DrawMenuBar");
   pragma Import (Stdcall, GetSystemMenu, "GetSystemMenu");
   pragma Import (Stdcall, CreateMenu, "CreateMenu");
   pragma Import (Stdcall, CreatePopupMenu, "CreatePopupMenu");
   pragma Import (Stdcall, DestroyMenu, "DestroyMenu");
   pragma Import (Stdcall, CheckMenuItem, "CheckMenuItem");
   pragma Import (Stdcall, EnableMenuItem, "EnableMenuItem");
   pragma Import (Stdcall, GetSubMenu, "GetSubMenu");
   pragma Import (Stdcall, GetMenuItemID, "GetMenuItemID");
   pragma Import (Stdcall, GetMenuItemCount, "GetMenuItemCount");
   pragma Import (Stdcall, InsertMenuA, "InsertMenuA");
   pragma Import (Stdcall, InsertMenuW, "InsertMenuW");
   pragma Import (Stdcall, AppendMenuA, "AppendMenuA");
   pragma Import (Stdcall, AppendMenuW, "AppendMenuW");
   pragma Import (Stdcall, ModifyMenuA, "ModifyMenuA");
   pragma Import (Stdcall, ModifyMenuW, "ModifyMenuW");
   pragma Import (Stdcall, RemoveMenu, "RemoveMenu");
   pragma Import (Stdcall, DeleteMenu, "DeleteMenu");
   pragma Import (Stdcall, SetMenuItemBitmaps, "SetMenuItemBitmaps");
   pragma Import
     (Stdcall,
      GetMenuCheckMarkDimensions,
      "GetMenuCheckMarkDimensions");
   pragma Import (Stdcall, TrackPopupMenu, "TrackPopupMenu");
   pragma Import (Stdcall, DrawIcon, "DrawIcon");
   pragma Import (Stdcall, DrawTextA, "DrawTextA");
   pragma Import (Stdcall, DrawTextW, "DrawTextW");
   pragma Import (Stdcall, GrayStringA, "GrayStringA");
   pragma Import (Stdcall, GrayStringW, "GrayStringW");
   pragma Import (Stdcall, TabbedTextOutA, "TabbedTextOutA");
   pragma Import (Stdcall, TabbedTextOutW, "TabbedTextOutW");
   pragma Import (Stdcall, GetTabbedTextExtentA, "GetTabbedTextExtentA");
   pragma Import (Stdcall, GetTabbedTextExtentW, "GetTabbedTextExtentW");
   pragma Import (Stdcall, UpdateWindow, "UpdateWindow");
   pragma Import (Stdcall, SetActiveWindow, "SetActiveWindow");
   pragma Import (Stdcall, GetForegroundWindow, "GetForegroundWindow");
   pragma Import (Stdcall, SetForegroundWindow, "SetForegroundWindow");
   pragma Import (Stdcall, WindowFromDC, "WindowFromDC");
   pragma Import (Stdcall, GetDC, "GetDC");
   pragma Import (Stdcall, GetDCEx, "GetDCEx");
   pragma Import (Stdcall, GetWindowDC, "GetWindowDC");
   pragma Import (Stdcall, ReleaseDC, "ReleaseDC");
   pragma Import (Stdcall, BeginPaint, "BeginPaint");
   pragma Import (Stdcall, EndPaint, "EndPaint");
   pragma Import (Stdcall, GetUpdateRect, "GetUpdateRect");
   pragma Import (Stdcall, GetUpdateRgn, "GetUpdateRgn");
   pragma Import (Stdcall, ExcludeUpdateRgn, "ExcludeUpdateRgn");
   pragma Import (Stdcall, InvalidateRect, "InvalidateRect");
   pragma Import (Stdcall, ValidateRect, "ValidateRect");
   pragma Import (Stdcall, InvalidateRgn, "InvalidateRgn");
   pragma Import (Stdcall, ValidateRgn, "ValidateRgn");
   pragma Import (Stdcall, RedrawWindow, "RedrawWindow");
   pragma Import (Stdcall, LockWindowUpdate, "LockWindowUpdate");
   pragma Import (Stdcall, ScrollWindow, "ScrollWindow");
   pragma Import (Stdcall, ScrollDC, "ScrollDC");
   pragma Import (Stdcall, ScrollWindowEx, "ScrollWindowEx");
   pragma Import (Stdcall, SetScrollPos, "SetScrollPos");
   pragma Import (Stdcall, GetScrollPos, "GetScrollPos");
   pragma Import (Stdcall, SetScrollRange, "SetScrollRange");
   pragma Import (Stdcall, GetScrollRange, "GetScrollRange");
   pragma Import (Stdcall, ShowScrollBar, "ShowScrollBar");
   pragma Import (Stdcall, EnableScrollBar, "EnableScrollBar");
   pragma Import (Stdcall, SetPropA, "SetPropA");
   pragma Import (Stdcall, SetPropW, "SetPropW");
   pragma Import (Stdcall, GetPropA, "GetPropA");
   pragma Import (Stdcall, GetPropW, "GetPropW");
   pragma Import (Stdcall, RemovePropA, "RemovePropA");
   pragma Import (Stdcall, RemovePropW, "RemovePropW");
   pragma Import (Stdcall, EnumPropsExA, "EnumPropsExA");
   pragma Import (Stdcall, EnumPropsExW, "EnumPropsExW");
   pragma Import (Stdcall, EnumPropsA, "EnumPropsA");
   pragma Import (Stdcall, EnumPropsW, "EnumPropsW");
   pragma Import (Stdcall, SetWindowTextA, "SetWindowTextA");
   pragma Import (Stdcall, SetWindowTextW, "SetWindowTextW");
   pragma Import (Stdcall, GetWindowTextA, "GetWindowTextA");
   pragma Import (Stdcall, GetWindowTextW, "GetWindowTextW");
   pragma Import (Stdcall, GetWindowTextLengthA, "GetWindowTextLengthA");
   pragma Import (Stdcall, GetWindowTextLengthW, "GetWindowTextLengthW");
   pragma Import (Stdcall, GetClientRect, "GetClientRect");
   pragma Import (Stdcall, GetWindowRect, "GetWindowRect");
   pragma Import (Stdcall, AdjustWindowRect, "AdjustWindowRect");
   pragma Import (Stdcall, AdjustWindowRectEx, "AdjustWindowRectEx");
   pragma Import (Stdcall, MessageBoxA, "MessageBoxA");
   pragma Import (Stdcall, MessageBoxW, "MessageBoxW");
   pragma Import (Stdcall, MessageBoxExA, "MessageBoxExA");
   pragma Import (Stdcall, MessageBoxExW, "MessageBoxExW");
   pragma Import (Stdcall, MessageBeep, "MessageBeep");
   pragma Import (Stdcall, ShowCursor, "ShowCursor");
   pragma Import (Stdcall, SetCursorPos, "SetCursorPos");
   pragma Import (Stdcall, SetCursor, "SetCursor");
   pragma Import (Stdcall, GetCursorPos, "GetCursorPos");
   pragma Import (Stdcall, ClipCursor, "ClipCursor");
   pragma Import (Stdcall, GetClipCursor, "GetClipCursor");
   pragma Import (Stdcall, GetCursor, "GetCursor");
   pragma Import (Stdcall, CreateCaret, "CreateCaret");
   pragma Import (Stdcall, GetCaretBlinkTime, "GetCaretBlinkTime");
   pragma Import (Stdcall, SetCaretBlinkTime, "SetCaretBlinkTime");
   pragma Import (Stdcall, DestroyCaret, "DestroyCaret");
   pragma Import (Stdcall, HideCaret, "HideCaret");
   pragma Import (Stdcall, ShowCaret, "ShowCaret");
   pragma Import (Stdcall, SetCaretPos, "SetCaretPos");
   pragma Import (Stdcall, GetCaretPos, "GetCaretPos");
   pragma Import (Stdcall, ClientToScreen, "ClientToScreen");
   pragma Import (Stdcall, ScreenToClient, "ScreenToClient");
   pragma Import (Stdcall, MapWindowPoints, "MapWindowPoints");
   pragma Import (Stdcall, WindowFromPoint, "WindowFromPoint");
   pragma Import (Stdcall, ChildWindowFromPoint, "ChildWindowFromPoint");
   pragma Import (Stdcall, GetSysColor, "GetSysColor");
   pragma Import (Stdcall, SetSysColors, "SetSysColors");
   pragma Import (Stdcall, DrawFocusRect, "DrawFocusRect");
   pragma Import (Stdcall, FillRect, "FillRect");
   pragma Import (Stdcall, FrameRect, "FrameRect");
   pragma Import (Stdcall, InvertRect, "InvertRect");
   pragma Import (Stdcall, SetRect, "SetRect");
   pragma Import (Stdcall, SetRectEmpty, "SetRectEmpty");
   pragma Import (Stdcall, CopyRect, "CopyRect");
   pragma Import (Stdcall, InflateRect, "InflateRect");
   pragma Import (Stdcall, IntersectRect, "IntersectRect");
   pragma Import (Stdcall, UnionRect, "UnionRect");
   pragma Import (Stdcall, SubtractRect, "SubtractRect");
   pragma Import (Stdcall, OffsetRect, "OffsetRect");
   pragma Import (Stdcall, IsRectEmpty, "IsRectEmpty");
   pragma Import (Stdcall, EqualRect, "EqualRect");
   pragma Import (Stdcall, PtInRect, "PtInRect");
   pragma Import (Stdcall, GetWindowWord, "GetWindowWord");
   pragma Import (Stdcall, SetWindowWord, "SetWindowWord");
   pragma Import (Stdcall, GetWindowLongA, "GetWindowLongA");
   pragma Import (Stdcall, GetWindowLongW, "GetWindowLongW");
   pragma Import (Stdcall, SetWindowLongA, "SetWindowLongA");
   pragma Import (Stdcall, SetWindowLongW, "SetWindowLongW");
   pragma Import (Stdcall, GetWindowLongPtrA, "GetWindowLongPtrA");
   pragma Import (Stdcall, GetWindowLongPtrW, "GetWindowLongPtrW");
   pragma Import (Stdcall, SetWindowLongPtrA, "SetWindowLongPtrA");
   pragma Import (Stdcall, SetWindowLongPtrW, "SetWindowLongPtrW");
   pragma Import (Stdcall, GetClassWord, "GetClassWord");
   pragma Import (Stdcall, SetClassWord, "SetClassWord");
   pragma Import (Stdcall, GetClassLongA, "GetClassLongA");
   pragma Import (Stdcall, GetClassLongW, "GetClassLongW");
   pragma Import (Stdcall, SetClassLongA, "SetClassLongA");
   pragma Import (Stdcall, SetClassLongW, "SetClassLongW");
   pragma Import (Stdcall, GetClassLongPtrA, "GetClassLongPtrA");
   pragma Import (Stdcall, GetClassLongPtrW, "GetClassLongPtrW");
   pragma Import (Stdcall, SetClassLongPtrA, "SetClassLongPtrA");
   pragma Import (Stdcall, SetClassLongPtrW, "SetClassLongPtrW");
   pragma Import (Stdcall, GetDesktopWindow, "GetDesktopWindow");
   pragma Import (Stdcall, GetParent, "GetParent");
   pragma Import (Stdcall, SetParent, "SetParent");
   pragma Import (Stdcall, EnumChildWindows, "EnumChildWindows");
   pragma Import (Stdcall, FindWindowA, "FindWindowA");
   pragma Import (Stdcall, FindWindowW, "FindWindowW");
   pragma Import (Stdcall, EnumWindows, "EnumWindows");
   pragma Import (Stdcall, EnumThreadWindows, "EnumThreadWindows");
   pragma Import (Stdcall, GetClassNameA, "GetClassNameA");
   pragma Import (Stdcall, GetClassNameW, "GetClassNameW");
   pragma Import (Stdcall, GetTopWindow, "GetTopWindow");
   pragma Import
     (Stdcall,
      GetWindowThreadProcessId,
      "GetWindowThreadProcessId");
   pragma Import (Stdcall, GetLastActivePopup, "GetLastActivePopup");
   pragma Import (Stdcall, GetWindow, "GetWindow");
   pragma Import (Stdcall, SetWindowsHookA, "SetWindowsHookA");
   pragma Import (Stdcall, SetWindowsHookW, "SetWindowsHookW");
   pragma Import (Stdcall, UnhookWindowsHook, "UnhookWindowsHook");
   pragma Import (Stdcall, SetWindowsHookExA, "SetWindowsHookExA");
   pragma Import (Stdcall, SetWindowsHookExW, "SetWindowsHookExW");
   pragma Import (Stdcall, UnhookWindowsHookEx, "UnhookWindowsHookEx");
   pragma Import (Stdcall, CallNextHookEx, "CallNextHookEx");
   pragma Import (Stdcall, LoadBitmapA, "LoadBitmapA");
   pragma Import (Stdcall, LoadBitmapW, "LoadBitmapW");
   pragma Import (Stdcall, LoadCursorA, "LoadCursorA");
   pragma Import (Stdcall, LoadCursorW, "LoadCursorW");
   pragma Import (Stdcall, CreateCursor, "CreateCursor");
   pragma Import (Stdcall, DestroyCursor, "DestroyCursor");
   pragma Import (Stdcall, LoadIconA, "LoadIconA");
   pragma Import (Stdcall, LoadIconW, "LoadIconW");
   pragma Import (Stdcall, CreateIcon, "CreateIcon");
   pragma Import (Stdcall, DestroyIcon, "DestroyIcon");
   pragma Import
     (Stdcall,
      LookupIconIdFromDirectory,
      "LookupIconIdFromDirectory");
   pragma Import (Stdcall, CreateIconFromResource, "CreateIconFromResource");
   pragma Import (Stdcall, CreateIconIndirect, "CreateIconIndirect");
   pragma Import (Stdcall, CopyIcon, "CopyIcon");
   pragma Import (Stdcall, GetIconInfo, "GetIconInfo");
   pragma Import (Stdcall, LoadStringA, "LoadStringA");
   pragma Import (Stdcall, LoadStringW, "LoadStringW");
   pragma Import (Stdcall, IsDialogMessageA, "IsDialogMessageA");
   pragma Import (Stdcall, IsDialogMessageW, "IsDialogMessageW");
   pragma Import (Stdcall, MapDialogRect, "MapDialogRect");
   pragma Import (Stdcall, DlgDirListA, "DlgDirListA");
   pragma Import (Stdcall, DlgDirListW, "DlgDirListW");
   pragma Import (Stdcall, DlgDirSelectExA, "DlgDirSelectExA");
   pragma Import (Stdcall, DlgDirSelectExW, "DlgDirSelectExW");
   pragma Import (Stdcall, DlgDirListComboBoxA, "DlgDirListComboBoxA");
   pragma Import (Stdcall, DlgDirListComboBoxW, "DlgDirListComboBoxW");
   pragma Import
     (Stdcall,
      DlgDirSelectComboBoxExA,
      "DlgDirSelectComboBoxExA");
   pragma Import
     (Stdcall,
      DlgDirSelectComboBoxExW,
      "DlgDirSelectComboBoxExW");
   pragma Import (Stdcall, DefFrameProcA, "DefFrameProcA");
   pragma Import (Stdcall, DefFrameProcW, "DefFrameProcW");
   pragma Import (Stdcall, DefMDIChildProcA, "DefMDIChildProcA");
   pragma Import (Stdcall, DefMDIChildProcW, "DefMDIChildProcW");
   pragma Import (Stdcall, TranslateMDISysAccel, "TranslateMDISysAccel");
   pragma Import (Stdcall, ArrangeIconicWindows, "ArrangeIconicWindows");
   pragma Import (Stdcall, CreateMDIWindowA, "CreateMDIWindowA");
   pragma Import (Stdcall, CreateMDIWindowW, "CreateMDIWindowW");
   pragma Import (Stdcall, WinHelpA, "WinHelpA");
   pragma Import (Stdcall, WinHelpW, "WinHelpW");
   pragma Import (Stdcall, SystemParametersInfoA, "SystemParametersInfoA");
   pragma Import (Stdcall, SystemParametersInfoW, "SystemParametersInfoW");
   pragma Import (Stdcall, SetDebugErrorLevel, "SetDebugErrorLevel");
   pragma Import (Stdcall, SetLastErrorEx, "SetLastErrorEx");

end Win32.Winuser;
