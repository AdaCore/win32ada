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

package Win32.Commctrl is

   use Interfaces;
   use type Interfaces.C.char_array;

   TOOLBARCLASSNAMEW : constant WCHAR_Array :=
     To_Win (C.To_C ("ToolbarWindow32")) & Wide_Nul; --  commctrl.h:27
   TOOLBARCLASSNAMEA : constant CHAR_Array :=
     "ToolbarWindow32" & Nul;    --  commctrl.h:28
   TOOLBARCLASSNAME : CHAR_Array renames TOOLBARCLASSNAMEA;
   --  commctrl.h:33
   TBSTATE_CHECKED : constant := 16#1#;           --  commctrl.h:47
   TBSTATE_PRESSED : constant := 16#2#;           --  commctrl.h:48
   TBSTATE_ENABLED : constant := 16#4#;           --  commctrl.h:49
   TBSTATE_HIDDEN : constant := 16#8#;           --  commctrl.h:50
   TBSTYLE_BUTTON : constant := 16#0#;           --  commctrl.h:52
   TBSTYLE_SEP : constant := 16#1#;           --  commctrl.h:53
   TBSTYLE_CHECK : constant := 16#2#;           --  commctrl.h:54
   TBSTYLE_GROUP : constant := 16#4#;           --  commctrl.h:55
   TBSTYLE_CHECKGROUP : constant := 16#6#;           --  commctrl.h:56
   TB_ENABLEBUTTON : constant := 16#401#;         --  commctrl.h:75
   TB_CHECKBUTTON : constant := 16#402#;         --  commctrl.h:78
   TB_PRESSBUTTON : constant := 16#403#;         --  commctrl.h:81
   TB_HIDEBUTTON : constant := 16#404#;         --  commctrl.h:84
   TB_ISBUTTONENABLED : constant := 16#409#;         --  commctrl.h:90
   TB_ISBUTTONCHECKED : constant := 16#40a#;         --  commctrl.h:93
   TB_ISBUTTONPRESSED : constant := 16#40b#;         --  commctrl.h:96
   TB_ISBUTTONHIDDEN : constant := 16#40c#;         --  commctrl.h:99
   TB_SETSTATE : constant := 16#411#;         --  commctrl.h:102
   TB_GETSTATE : constant := 16#412#;         --  commctrl.h:105
   TB_ADDBITMAP : constant := 16#413#;         --  commctrl.h:112
   TB_ADDBUTTONS : constant := 16#414#;         --  commctrl.h:115
   TB_INSERTBUTTON : constant := 16#415#;         --  commctrl.h:121
   TB_DELETEBUTTON : constant := 16#416#;         --  commctrl.h:125
   TB_GETBUTTON : constant := 16#417#;         --  commctrl.h:130
   TB_BUTTONCOUNT : constant := 16#418#;         --  commctrl.h:135
   TB_COMMANDTOINDEX : constant := 16#419#;         --  commctrl.h:141
   TB_SAVERESTORE : constant := 16#41a#;         --  commctrl.h:148
   TB_CUSTOMIZE : constant := 16#41b#;         --  commctrl.h:156
   TB_SETBUTTON : constant := 16#427#;         --  commctrl.h:165
   TB_GETBUTTONRECT : constant := 16#428#;         --  commctrl.h:170
   STATUSCLASSNAMEW : constant WCHAR_Array :=
     To_Win (C.To_C ("msctls_statusbar32")) & Wide_Nul;
   --  commctrl.h:238
   STATUSCLASSNAMEA : constant CHAR_Array :=
     "msctls_statusbar32" & Nul; --  commctrl.h:239
   STATUSCLASSNAME : CHAR_Array renames STATUSCLASSNAMEA;
   --  commctrl.h:244
   HEADERCLASSNAMEW : constant WCHAR_Array :=
     To_Win (C.To_C ("msctls_headerbar")) & Wide_Nul;
   --  commctrl.h:250
   HEADERCLASSNAMEA : constant CHAR_Array :=
     "msctls_headerbar" & Nul;   --  commctrl.h:251
   HEADERCLASSNAME : CHAR_Array renames HEADERCLASSNAMEA;
   --  commctrl.h:256
   SB_SETTEXTA : constant := 16#401#;         --  commctrl.h:264
   SB_GETTEXTA : constant := 16#402#;         --  commctrl.h:265
   SB_GETTEXTW : constant := 16#40a#;         --  commctrl.h:266
   SB_SETTEXTW : constant := 16#40b#;         --  commctrl.h:267
   SB_GETTEXT : constant := 16#402#;         --  commctrl.h:273
   SB_SETTEXT : constant := 16#401#;         --  commctrl.h:274
   SB_GETTEXTLENGTH : constant := 16#403#;         --  commctrl.h:277
   SB_SETPARTS : constant := 16#404#;         --  commctrl.h:291
   SB_SETBORDERS : constant := 16#405#;         --  commctrl.h:296
   SB_GETPARTS : constant := 16#406#;         --  commctrl.h:300
   SB_GETBORDERS : constant := 16#407#;         --  commctrl.h:306
   SB_SETMINHEIGHT : constant := 16#408#;         --  commctrl.h:310
   SB_SIMPLE : constant := 16#409#;         --  commctrl.h:317
   HB_SAVERESTORE : constant := 16#500#;         --  commctrl.h:328
   HB_ADJUST : constant := 16#501#;         --  commctrl.h:334
   HB_SETWIDTHS : constant := 16#404#;         --  commctrl.h:338
   HB_GETWIDTHS : constant := 16#406#;         --  commctrl.h:343
   HB_GETPARTS : constant := 16#502#;         --  commctrl.h:347
   HB_SHOWTOGGLE : constant := 16#503#;         --  commctrl.h:355
   SBT_OWNERDRAW : constant := 16#1000#;        --  commctrl.h:361
   SBT_NOBORDERS : constant := 16#100#;         --  commctrl.h:367
   SBT_POPOUT : constant := 16#200#;         --  commctrl.h:370
   HBT_SPRING : constant := 16#400#;         --  commctrl.h:373
   MINSYSCOMMAND : constant := 16#f000#;        --  commctrl.h:448
   BUTTONLISTBOX : constant WCHAR_Array :=
     To_Win (C.To_C ("ButtonListBox")) & Wide_Nul; --  commctrl.h:546
   BLS_NUMBUTTONS : constant := 16#ff#;          --  commctrl.h:549
   BLS_VERTICAL : constant := 16#100#;         --  commctrl.h:550
   BLS_NOSCROLL : constant := 16#200#;         --  commctrl.h:551
   BL_ADDBUTTONA : constant := 16#401#;         --  commctrl.h:555
   BL_DELETEBUTTONA : constant := 16#402#;         --  commctrl.h:556
   BL_GETCARETINDEX : constant := 16#403#;         --  commctrl.h:557
   BL_GETCOUNT : constant := 16#404#;         --  commctrl.h:558
   BL_GETCURSEL : constant := 16#405#;         --  commctrl.h:559
   BL_GETITEMDATA : constant := 16#406#;         --  commctrl.h:560
   BL_GETITEMRECT : constant := 16#407#;         --  commctrl.h:561
   BL_GETTEXTA : constant := 16#408#;         --  commctrl.h:562
   BL_GETTEXTLEN : constant := 16#409#;         --  commctrl.h:563
   BL_GETTOPINDEX : constant := 16#40a#;         --  commctrl.h:564
   BL_INSERTBUTTONA : constant := 16#40b#;         --  commctrl.h:565
   BL_RESETCONTENT : constant := 16#40c#;         --  commctrl.h:566
   BL_SETCARETINDEX : constant := 16#40d#;         --  commctrl.h:567
   BL_SETCURSEL : constant := 16#40e#;         --  commctrl.h:568
   BL_SETITEMDATA : constant := 16#40f#;         --  commctrl.h:569
   BL_SETTOPINDEX : constant := 16#410#;         --  commctrl.h:570
   BL_ADDBUTTONW : constant := 16#411#;         --  commctrl.h:572
   BL_DELETEBUTTONW : constant := 16#412#;         --  commctrl.h:573
   BL_GETTEXTW : constant := 16#413#;         --  commctrl.h:574
   BL_INSERTBUTTONW : constant := 16#414#;         --  commctrl.h:575
   BL_MSGMAX : constant := 16#415#;         --  commctrl.h:576
   BL_ADDBUTTON : constant := 16#401#;         --  commctrl.h:585
   BL_DELETEBUTTON : constant := 16#402#;         --  commctrl.h:586
   BL_GETTEXT : constant := 16#408#;         --  commctrl.h:587
   BL_INSERTBUTTON : constant := 16#40b#;         --  commctrl.h:588
   BL_GETCARETINDEXA : constant := 16#403#;         --  commctrl.h:592
   BL_GETCARETINDEXW : constant := 16#403#;         --  commctrl.h:593
   BL_GETCOUNTA : constant := 16#404#;         --  commctrl.h:594
   BL_GETCOUNTW : constant := 16#404#;         --  commctrl.h:595
   BL_GETCURSELA : constant := 16#405#;         --  commctrl.h:596
   BL_GETCURSELW : constant := 16#405#;         --  commctrl.h:597
   BL_GETITEMDATAA : constant := 16#406#;         --  commctrl.h:598
   BL_GETITEMDATAW : constant := 16#406#;         --  commctrl.h:599
   BL_GETITEMRECTA : constant := 16#407#;         --  commctrl.h:600
   BL_GETITEMRECTW : constant := 16#407#;         --  commctrl.h:601
   BL_GETTEXTLENA : constant := 16#409#;         --  commctrl.h:602
   BL_GETTEXTLENW : constant := 16#409#;         --  commctrl.h:603
   BL_GETTOPINDEXA : constant := 16#40a#;         --  commctrl.h:604
   BL_GETTOPINDEXW : constant := 16#40a#;         --  commctrl.h:605
   BL_RESETCONTENTA : constant := 16#40c#;         --  commctrl.h:606
   BL_RESETCONTENTW : constant := 16#40c#;         --  commctrl.h:607
   BL_SETCARETINDEXA : constant := 16#40d#;         --  commctrl.h:608
   BL_SETCARETINDEXW : constant := 16#40d#;         --  commctrl.h:609
   BL_SETCURSELA : constant := 16#40e#;         --  commctrl.h:610
   BL_SETCURSELW : constant := 16#40e#;         --  commctrl.h:611
   BL_SETITEMDATAA : constant := 16#40f#;         --  commctrl.h:612
   BL_SETITEMDATAW : constant := 16#40f#;         --  commctrl.h:613
   BL_SETTOPINDEXA : constant := 16#410#;         --  commctrl.h:614
   BL_SETTOPINDEXW : constant := 16#410#;         --  commctrl.h:615
   BLN_ERRSPACE : constant := -2;              --  commctrl.h:618
   BLN_SELCHANGE : constant := 1;               --  commctrl.h:619
   BLN_CLICKED : constant := 2;               --  commctrl.h:620
   BLN_SELCANCEL : constant := 3;               --  commctrl.h:621
   BLN_SETFOCUS : constant := 4;               --  commctrl.h:622
   BLN_KILLFOCUS : constant := 5;               --  commctrl.h:623
   BL_OKAY : constant := 0;               --  commctrl.h:626
   BL_ERR : constant := -1;              --  commctrl.h:627
   BL_ERRSPACE : constant := -2;              --  commctrl.h:628
   TRACKBAR_CLASSA : constant CHAR_Array :=
     "msctls_trackbar32" & Nul;  --  commctrl.h:688
   TRACKBAR_CLASSW : constant WCHAR_Array :=
     To_Win (C.To_C ("msctls_trackbar32")) & Wide_Nul;
   --  commctrl.h:689
   TRACKBAR_CLASS : CHAR_Array renames TRACKBAR_CLASSA;
   --  commctrl.h:694
   TBS_AUTOTICKS : constant := 16#1#;           --  commctrl.h:700
   TBM_GETPOS : constant := 16#400#;         --  commctrl.h:706
   TBM_GETRANGEMIN : constant := 16#401#;         --  commctrl.h:709
   TBM_GETRANGEMAX : constant := 16#402#;         --  commctrl.h:712
   TBM_GETTIC : constant := 16#403#;         --  commctrl.h:715
   TBM_SETTIC : constant := 16#404#;         --  commctrl.h:718
   TBM_SETPOS : constant := 16#405#;         --  commctrl.h:721
   TBM_SETRANGE : constant := 16#406#;         --  commctrl.h:724
   TBM_SETRANGEMIN : constant := 16#407#;         --  commctrl.h:727
   TBM_SETRANGEMAX : constant := 16#408#;         --  commctrl.h:730
   TBM_CLEARTICS : constant := 16#409#;         --  commctrl.h:733
   TBM_SETSEL : constant := 16#40a#;         --  commctrl.h:736
   TBM_SETSELSTART : constant := 16#40b#;         --  commctrl.h:739
   TBM_SETSELEND : constant := 16#40c#;         --  commctrl.h:740
   TBM_GETPTICS : constant := 16#40e#;         --  commctrl.h:745
   TBM_GETTICPOS : constant := 16#40f#;         --  commctrl.h:748
   TBM_GETNUMTICS : constant := 16#410#;         --  commctrl.h:750
   TBM_GETSELSTART : constant := 16#411#;         --  commctrl.h:753
   TBM_GETSELEND : constant := 16#412#;         --  commctrl.h:754
   TBM_CLEARSEL : constant := 16#413#;         --  commctrl.h:757
   TB_LINEUP : constant := 0;               --  commctrl.h:761
   TB_LINEDOWN : constant := 1;               --  commctrl.h:762
   TB_PAGEUP : constant := 2;               --  commctrl.h:763
   TB_PAGEDOWN : constant := 3;               --  commctrl.h:764
   TB_THUMBPOSITION : constant := 4;               --  commctrl.h:765
   TB_THUMBTRACK : constant := 5;               --  commctrl.h:766
   TB_TOP : constant := 6;               --  commctrl.h:767
   TB_BOTTOM : constant := 7;               --  commctrl.h:768
   TB_ENDTRACK : constant := 8;               --  commctrl.h:769
   DL_BEGINDRAG : constant := 16#485#;         --  commctrl.h:784
   DL_DRAGGING : constant := 16#486#;         --  commctrl.h:785
   DL_DROPPED : constant := 16#487#;         --  commctrl.h:786
   DL_CANCELDRAG : constant := 16#488#;         --  commctrl.h:787
   DL_CURSORSET : constant := 0;               --  commctrl.h:789
   DL_STOPCURSOR : constant := 1;               --  commctrl.h:790
   DL_COPYCURSOR : constant := 2;               --  commctrl.h:791
   DL_MOVECURSOR : constant := 3;               --  commctrl.h:792
   DRAGLISTMSGSTRING : constant WCHAR_Array :=
     To_Win (C.To_C ("commctrl_DragListMsg")) & Wide_Nul;
   --  commctrl.h:794
   UDS_WRAP : constant := 16#1#;           --  commctrl.h:871
   UDS_SETBUDDYINT : constant := 16#2#;           --  commctrl.h:874
   UDS_ALIGNRIGHT : constant := 16#4#;           --  commctrl.h:877
   UDS_ALIGNLEFT : constant := 16#8#;           --  commctrl.h:878
   UDS_AUTOBUDDY : constant := 16#10#;          --  commctrl.h:881
   UDS_ARROWKEYS : constant := 16#20#;          --  commctrl.h:884
   UDM_SETRANGE : constant := 16#465#;         --  commctrl.h:889
   UDM_GETRANGE : constant := 16#466#;         --  commctrl.h:895
   UDM_SETPOS : constant := 16#467#;         --  commctrl.h:901
   UDM_GETPOS : constant := 16#468#;         --  commctrl.h:907
   UDM_SETBUDDY : constant := 16#469#;         --  commctrl.h:913
   UDM_GETBUDDY : constant := 16#46a#;         --  commctrl.h:919
   UDM_SETACCEL : constant := 16#46b#;         --  commctrl.h:925
   UDM_GETACCEL : constant := 16#46c#;         --  commctrl.h:935
   UDM_SETBASE : constant := 16#46d#;         --  commctrl.h:941
   UDM_GETBASE : constant := 16#46e#;         --  commctrl.h:946
   UPDOWN_CLASS : constant WCHAR_Array :=
     To_Win (C.To_C ("msctls_updown")) & Wide_Nul; --  commctrl.h:963
   HBN_BEGINDRAG : constant := 16#101#;         --  commctrl.h:992
   HBN_DRAGGING : constant := 16#102#;         --  commctrl.h:993
   HBN_ENDDRAG : constant := 16#103#;         --  commctrl.h:994
   HBN_BEGINADJUST : constant := 16#111#;         --  commctrl.h:999
   HBN_ENDADJUST : constant := 16#112#;         --  commctrl.h:1000
   TBN_BEGINDRAG : constant := 16#201#;         --  commctrl.h:1007
   TBN_ENDDRAG : constant := 16#203#;         --  commctrl.h:1008
   TBN_BEGINADJUST : constant := 16#204#;         --  commctrl.h:1018
   TBN_ADJUSTINFO : constant := 16#205#;         --  commctrl.h:1019
   TBN_ENDADJUST : constant := 16#206#;         --  commctrl.h:1020
   TBN_RESET : constant := 16#207#;         --  commctrl.h:1021
   TBN_QUERYINSERT : constant := 16#208#;         --  commctrl.h:1031
   TBN_QUERYDELETE : constant := 16#209#;         --  commctrl.h:1032
   TBN_TOOLBARCHANGE : constant := 16#20a#;         --  commctrl.h:1033
   TBN_CUSTHELP : constant := 16#20b#;         --  commctrl.h:1041
   CCS_TOP : constant := 16#1#;           --  commctrl.h:1053
   CCS_NOMOVEY : constant := 16#2#;           --  commctrl.h:1064
   CCS_BOTTOM : constant := 16#3#;           --  commctrl.h:1069
   CCS_NORESIZE : constant := 16#4#;           --  commctrl.h:1072
   CCS_NOPARENTALIGN : constant := 16#8#;           --  commctrl.h:1076
   CCS_NOHILITE : constant := 16#10#;          --  commctrl.h:1080
   CCS_ADJUSTABLE : constant := 16#20#;          --  commctrl.h:1083
   SST_RESOURCE : constant := 16#1#;           --  commctrl.h:1092
   SST_FORMAT : constant := 16#2#;           --  commctrl.h:1093

   type TBBUTTON;                                          --  commctrl.h:44
   type ADJUSTINFO;                                        --  commctrl.h:62
   type COLORMAP;                                          --  commctrl.h:70
   type CREATELISTBUTTONA;                                 --  commctrl.h:635
   type CREATELISTBUTTONW;                                 --  commctrl.h:646
   type DRAGLISTINFO;                                      --  commctrl.h:781
   type UDACCEL;                                           --  commctrl.h:862

   type PTBBUTTON is access all TBBUTTON;                  --  commctrl.h:44
   subtype LPTBBUTTON is PTBBUTTON;                        --  commctrl.h:44
   type LPCTBBUTTON is access all TBBUTTON;           --  commctrl.h:45
   type LPADJUSTINFO is access all ADJUSTINFO;             --  commctrl.h:62
   type LPCOLORMAP is access all COLORMAP;                 --  commctrl.h:70
   type LPCREATELISTBUTTONA is access all CREATELISTBUTTONA;
   --  commctrl.h:644
   type LPCREATELISTBUTTONW is access all CREATELISTBUTTONW;
   --  commctrl.h:654
   subtype LPCREATELISTBUTTON is LPCREATELISTBUTTONA;      --  commctrl.h:662
   type LPDRAGLISTINFO is access all DRAGLISTINFO;         --  commctrl.h:781
   type LPUDACCEL is access all UDACCEL;                   --  commctrl.h:866

   type TBBUTTON is                                        --  commctrl.h:44
      record
         iBitmap : Win32.INT;                           --  commctrl.h:37
         idCommand : Win32.INT;                           --  commctrl.h:38
         fsState : Win32.BYTE;                          --  commctrl.h:39
         fsStyle : Win32.BYTE;                          --  commctrl.h:40
--       idsHelp  : Win32.INT;                          -- commctrl.h:41
--  removed in April 96 SDK
         dwData : Win32.DWORD;                         --  commctrl.h:42
         iString : Win32.INT;                           --  commctrl.h:43
      end record;

   type ADJUSTINFO is                                      --  commctrl.h:62
      record
         tbButton : Win32.Commctrl.TBBUTTON;         --  commctrl.h:60
         szDescription : Win32.Winnt.TCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  commctrl.h:61
      end record;

   type COLORMAP is                                        --  commctrl.h:70
      record
         from : Win32.Windef.COLORREF;                    --  commctrl.h:68
         to : Win32.Windef.COLORREF;                    --  commctrl.h:69
      end record;

   type CREATELISTBUTTONA is                               --  commctrl.h:635
      record
         cbSize : Win32.UINT;                         --  commctrl.h:637
         dwItemData : Win32.DWORD;                        --  commctrl.h:638
         hBitmap : Win32.Windef.HBITMAP;               --  commctrl.h:640
         lpszText : Win32.LPCSTR;                       --  commctrl.h:641
      end record;

   subtype CREATELISTBUTTON is CREATELISTBUTTONA;          --  commctrl.h:659

   type CREATELISTBUTTONW is                               --  commctrl.h:646
      record
         cbSize : Win32.UINT;                         --  commctrl.h:648
         dwItemData : Win32.DWORD;                        --  commctrl.h:649
         hBitmap : Win32.Windef.HBITMAP;               --  commctrl.h:651
         lpszText : Win32.LPCWSTR;                      --  commctrl.h:652
      end record;

   type DRAGLISTINFO is                                    --  commctrl.h:781
      record
         uNotification : Win32.UINT;                      --  commctrl.h:778
         hWnd : Win32.Windef.HWND;               --  commctrl.h:779
         ptCursor : Win32.Windef.POINT;              --  commctrl.h:780
      end record;

   type UDACCEL is                                         --  commctrl.h:862
      record
         nSec : Win32.UINT;                               --  commctrl.h:864
         nInc : Win32.UINT;                               --  commctrl.h:865
      end record;

   function CreateToolbar
     (hwnd : Win32.Windef.HWND;
      ws : Win32.DWORD;
      wID : Win32.WORD;
      nBitmaps : Win32.INT;
      hBMInst : Win32.Windef.HINSTANCE;
      wBMID : Win32.WORD;
      lpButtons : LPTBBUTTON;
      iNumButtons : Win32.INT)
     return Win32.Windef.HWND;                    --  commctrl.h:65

   function CreateMappedBitmap
     (hInstance : Win32.Windef.HINSTANCE;
      idBitmap : Win32.INT;
      bDiscardable : Win32.BOOL;
      lpColorMap : Win32.Commctrl.LPCOLORMAP;
      iNumMaps : Win32.INT)
     return Win32.Windef.HBITMAP;                 --  commctrl.h:72

   procedure DrawStatusTextA
     (hDC : Win32.Windef.HDC;
      lprc : Win32.Windef.LPRECT;
      szText : Win32.LPCSTR;
      uFlags : Win32.UINT);                        --  commctrl.h:187

   procedure DrawStatusText
     (hDC : Win32.Windef.HDC;
      lprc : Win32.Windef.LPRECT;
      szText : Win32.LPCSTR;
      uFlags : Win32.UINT)
     renames DrawStatusTextA;                     --  commctrl.h:187

   procedure DrawStatusTextW
     (hDC : Win32.Windef.HDC;
      lprc : Win32.Windef.LPRECT;
      szText : Win32.LPCWSTR;
      uFlags : Win32.UINT);                        --  commctrl.h:188

   function CreateStatusWindowA
     (style : Win32.LONG;
      lpszText : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID : Win32.WORD)
     return Win32.Windef.HWND;                    --  commctrl.h:205

   function CreateStatusWindow
     (style : Win32.LONG;
      lpszText : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID : Win32.WORD)
     return Win32.Windef.HWND
     renames CreateStatusWindowA;                 --  commctrl.h:205

   function CreateStatusWindowW
     (style : Win32.LONG;
      lpszText : Win32.LPCWSTR;
      hwndParent : Win32.Windef.HWND;
      wID : Win32.WORD)
     return Win32.Windef.HWND;                    --  commctrl.h:207

   function CreateHeaderWindowA
     (style : Win32.LONG;
      lpszText : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID : Win32.WORD)
     return Win32.Windef.HWND;                    --  commctrl.h:214

   function CreateHeaderWindow
     (style : Win32.LONG;
      lpszText : Win32.LPCSTR;
      hwndParent : Win32.Windef.HWND;
      wID : Win32.WORD)
     return Win32.Windef.HWND
     renames CreateHeaderWindowA;                 --  commctrl.h:214

   function CreateHeaderWindowW
     (style : Win32.LONG;
      lpszText : Win32.LPCWSTR;
      hwndParent : Win32.Windef.HWND;
      wID : Win32.WORD)
     return Win32.Windef.HWND;                    --  commctrl.h:216

   function WritePrivateProfileStructA
     (szSection : Win32.LPCSTR;
      szKey : Win32.LPCSTR;
      lpStruct : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile : Win32.LPCSTR)
     return Win32.BOOL;                           --  commctrl.h:421

   function WritePrivateProfileStruct
     (szSection : Win32.LPCSTR;
      szKey : Win32.LPCSTR;
      lpStruct : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile : Win32.LPCSTR)
     return Win32.BOOL
     renames WritePrivateProfileStructA;          --  commctrl.h:421

   function WritePrivateProfileStructW
     (szSection : Win32.LPCWSTR;
      szKey : Win32.LPCWSTR;
      lpStruct : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile : Win32.LPCWSTR)
     return Win32.BOOL;                           --  commctrl.h:423

   function GetPrivateProfileStructA
     (szSection : Win32.LPCSTR;
      szKey : Win32.LPCSTR;
      lpStruct : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile : Win32.LPCSTR)
     return Win32.BOOL;                           --  commctrl.h:430

   function GetPrivateProfileStruct
     (szSection : Win32.LPCSTR;
      szKey : Win32.LPCSTR;
      lpStruct : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile : Win32.LPCSTR)
     return Win32.BOOL
     renames GetPrivateProfileStructA;            --  commctrl.h:430

   function GetPrivateProfileStructW
     (szSection : Win32.LPCWSTR;
      szKey : Win32.LPCWSTR;
      lpStruct : Win32.LPBYTE;
      uSizeStruct : Win32.UINT;
      szFile : Win32.LPCWSTR)
     return Win32.BOOL;                           --  commctrl.h:432

   procedure MenuHelp
     (iMessage : Win32.WORD;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM;
      hMainMenu : Win32.Windef.HMENU;
      hInst : Win32.Windef.HINSTANCE;
      hwndStatus : Win32.Windef.HWND;
      lpdwIDs : Win32.LPDWORD);                 --  commctrl.h:441

   function ShowHideMenuCtl
     (hWnd : Win32.Windef.HWND;
      uFlags : Win32.UINT;
      lpInfo : Win32.LPINT)
     return Win32.BOOL;                           --  commctrl.h:444

   procedure GetEffectiveClientRect
     (hWnd : Win32.Windef.HWND;
      lprc : Win32.Windef.LPRECT;
      lpInfo : Win32.LPINT);                       --  commctrl.h:446

   function MakeDragList
     (hLB : Win32.Windef.HWND)
     return Win32.BOOL;                           --  commctrl.h:798

   function LBItemFromPt
     (hLB : Win32.Windef.HWND;
      pt : Win32.Windef.POINT;
      bAutoScroll : Win32.BOOL)
     return Win32.INT;                            --  commctrl.h:799

   procedure DrawInsert
     (handParent : Win32.Windef.HWND;
      hLB : Win32.Windef.HWND;
      nItem : Win32.INT);                     --  commctrl.h:800

   function CreateUpDownControl
     (dwStyle : Win32.DWORD;
      x : Win32.INT;
      y : Win32.INT;
      cx : Win32.INT;
      cy : Win32.INT;
      hParent : Win32.Windef.HWND;
      nID : Win32.INT;
      hInst : Win32.Windef.HINSTANCE;
      hBuddy : Win32.Windef.HWND;
      nUpper : Win32.INT;
      nLower : Win32.INT;
      nPos : Win32.INT)
     return Win32.Windef.HWND;                    --  commctrl.h:966

   procedure InitCommonControls;                           --  commctrl.h:1090

private

   pragma Convention (C, TBBUTTON);                         --  commctrl.h:44
   pragma Convention (C, ADJUSTINFO);                       --  commctrl.h:62
   pragma Convention (C_Pass_By_Copy, COLORMAP);             --  commctrl.h:70
   pragma Convention (C_Pass_By_Copy, CREATELISTBUTTONA);    --  commctrl.h:635
   pragma Convention (C_Pass_By_Copy, CREATELISTBUTTONW);    --  commctrl.h:646
   pragma Convention (C_Pass_By_Copy, DRAGLISTINFO);         --  commctrl.h:781
   pragma Convention (C_Pass_By_Copy, UDACCEL);              --  commctrl.h:862

   pragma Import (Stdcall, CreateToolbar, "CreateToolbar");  --  commctrl.h:65
   pragma Import (Stdcall, CreateMappedBitmap, "CreateMappedBitmap");
   --  commctrl.h:72
   pragma Import (Stdcall, DrawStatusTextA, "DrawStatusTextA");
   --  commctrl.h:187
   pragma Import (Stdcall, DrawStatusTextW, "DrawStatusTextW");
   --  commctrl.h:188
   pragma Import (Stdcall, CreateStatusWindowA, "CreateStatusWindowA");
   --  commctrl.h:205
   pragma Import (Stdcall, CreateStatusWindowW, "CreateStatusWindowW");
   --  commctrl.h:207
   pragma Import (Stdcall, CreateHeaderWindowA, "CreateHeaderWindowA");
   --  commctrl.h:214
   pragma Import (Stdcall, CreateHeaderWindowW, "CreateHeaderWindowW");
   --  commctrl.h:216
   pragma Import (Stdcall, WritePrivateProfileStructA,
                    "WritePrivateProfileStructA");
   --  commctrl.h:421
   pragma Import (Stdcall, WritePrivateProfileStructW,
                    "WritePrivateProfileStructW");
   --  commctrl.h:423
   pragma Import (Stdcall, GetPrivateProfileStructA,
                    "GetPrivateProfileStructA");
   --  commctrl.h:430
   pragma Import (Stdcall, GetPrivateProfileStructW,
                    "GetPrivateProfileStructW");
   --  commctrl.h:432
   pragma Import (Stdcall, MenuHelp, "MenuHelp");
   --  commctrl.h:441
   pragma Import (Stdcall, ShowHideMenuCtl, "ShowHideMenuCtl");
   --  commctrl.h:444
   pragma Import (Stdcall, GetEffectiveClientRect, "GetEffectiveClientRect");
   --  commctrl.h:446
   pragma Import (Stdcall, MakeDragList, "MakeDragList");
   --  commctrl.h:798
   pragma Import (Stdcall, LBItemFromPt, "LBItemFromPt");
   --  commctrl.h:799
   pragma Import (Stdcall, DrawInsert, "DrawInsert");
   --  commctrl.h:800
   pragma Import (Stdcall, CreateUpDownControl, "CreateUpDownControl");
   --  commctrl.h:966
   pragma Import (Stdcall, InitCommonControls, "InitCommonControls");
   --  commctrl.h:1090

end Win32.Commctrl;


