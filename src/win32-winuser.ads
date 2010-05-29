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
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (c) AdaCore 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with Stdarg;
with Win32.Winbase;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;
with System.Storage_Elements; use System.Storage_Elements;

package Win32.Winuser is

   WINVER : constant := 16#30a#;             --  winuser.h:28

   function MAKEINTRESOURCEA (wInteger : WORD) return LPSTR; --  winuser.h:102

   function MAKEINTRESOURCEW (wInteger : WORD) return LPWSTR;
   --  winuser.h:103

   function MAKEINTRESOURCE (wInteger : WORD) return LPSTR  --  winuser.h:107
     renames MAKEINTRESOURCEA;

   RT_CURSOR : constant LPSTR;                --  winuser.h:115
   RT_BITMAP : constant LPSTR;                --  winuser.h:116
   RT_ICON : constant LPSTR;                --  winuser.h:117
   RT_MENU : constant LPSTR;                --  winuser.h:118
   RT_DIALOG : constant LPSTR;                --  winuser.h:119
   RT_STRING : constant LPSTR;                --  winuser.h:120
   RT_FONTDIR : constant LPSTR;                --  winuser.h:121
   RT_FONT : constant LPSTR;                --  winuser.h:122
   RT_ACCELERATOR : constant LPSTR;                --  winuser.h:123
   RT_RCDATA : constant LPSTR;                --  winuser.h:124
   RT_MESSAGETABLE : constant LPSTR;                --  winuser.h:125
   RT_GROUP_CURSOR : constant LPSTR;                --  winuser.h:128
   RT_GROUP_ICON : constant LPSTR;                --  winuser.h:129
   RT_VERSION : constant LPSTR;                --  winuser.h:130
   RT_DLGINCLUDE : constant LPSTR;                --  winuser.h:131
   SB_HORZ : constant := 0;                 --  winuser.h:168
   SB_VERT : constant := 1;                 --  winuser.h:169
   SB_CTL : constant := 2;                 --  winuser.h:170
   SB_BOTH : constant := 3;                 --  winuser.h:171
   SB_LINEUP : constant := 0;                 --  winuser.h:176
   SB_LINELEFT : constant := 0;                 --  winuser.h:177
   SB_LINEDOWN : constant := 1;                 --  winuser.h:178
   SB_LINERIGHT : constant := 1;                 --  winuser.h:179
   SB_PAGEUP : constant := 2;                 --  winuser.h:180
   SB_PAGELEFT : constant := 2;                 --  winuser.h:181
   SB_PAGEDOWN : constant := 3;                 --  winuser.h:182
   SB_PAGERIGHT : constant := 3;                 --  winuser.h:183
   SB_THUMBPOSITION : constant := 4;                 --  winuser.h:184
   SB_THUMBTRACK : constant := 5;                 --  winuser.h:185
   SB_TOP : constant := 6;                 --  winuser.h:186
   SB_LEFT : constant := 6;                 --  winuser.h:187
   SB_BOTTOM : constant := 7;                 --  winuser.h:188
   SB_RIGHT : constant := 7;                 --  winuser.h:189
   SB_ENDSCROLL : constant := 8;                 --  winuser.h:190
   SW_HIDE : constant := 0;                 --  winuser.h:199
   SW_SHOWNORMAL : constant := 1;                 --  winuser.h:200
   SW_NORMAL : constant := 1;                 --  winuser.h:201
   SW_SHOWMINIMIZED : constant := 2;                 --  winuser.h:202
   SW_SHOWMAXIMIZED : constant := 3;                 --  winuser.h:203
   SW_MAXIMIZE : constant := 3;                 --  winuser.h:204
   SW_SHOWNOACTIVATE : constant := 4;                 --  winuser.h:205
   SW_SHOW : constant := 5;                 --  winuser.h:206
   SW_MINIMIZE : constant := 6;                 --  winuser.h:207
   SW_SHOWMINNOACTIVE : constant := 7;                 --  winuser.h:208
   SW_SHOWNA : constant := 8;                 --  winuser.h:209
   SW_RESTORE : constant := 9;                 --  winuser.h:210
   SW_SHOWDEFAULT : constant := 10;                --  winuser.h:211
   SW_MAX : constant := 10;                --  winuser.h:212
   HIDE_WINDOW : constant := 0;                 --  winuser.h:217
   SHOW_OPENWINDOW : constant := 1;                 --  winuser.h:218
   SHOW_ICONWINDOW : constant := 2;                 --  winuser.h:219
   SHOW_FULLSCREEN : constant := 3;                 --  winuser.h:220
   SHOW_OPENNOACTIVATE : constant := 4;                 --  winuser.h:221
   SW_PARENTCLOSING : constant := 1;                 --  winuser.h:226
   SW_OTHERZOOM : constant := 2;                 --  winuser.h:227
   SW_PARENTOPENING : constant := 3;                 --  winuser.h:228
   SW_OTHERUNZOOM : constant := 4;                 --  winuser.h:229
   KF_EXTENDED : constant := 16#100#;           --  winuser.h:236
   KF_DLGMODE : constant := 16#800#;           --  winuser.h:237
   KF_MENUMODE : constant := 16#1000#;          --  winuser.h:238
   KF_ALTDOWN : constant := 16#2000#;          --  winuser.h:239
   KF_REPEAT : constant := 16#4000#;          --  winuser.h:240
   KF_UP : constant := 16#8000#;          --  winuser.h:241
   VK_LBUTTON : constant := 16#1#;             --  winuser.h:248
   VK_RBUTTON : constant := 16#2#;             --  winuser.h:249
   VK_CANCEL : constant := 16#3#;             --  winuser.h:250
   VK_MBUTTON : constant := 16#4#;             --  winuser.h:251
   VK_BACK : constant := 16#8#;             --  winuser.h:253
   VK_TAB : constant := 16#9#;             --  winuser.h:254
   VK_CLEAR : constant := 16#c#;             --  winuser.h:256
   VK_RETURN : constant := 16#d#;             --  winuser.h:257
   VK_SHIFT : constant := 16#10#;            --  winuser.h:259
   VK_CONTROL : constant := 16#11#;            --  winuser.h:260
   VK_MENU : constant := 16#12#;            --  winuser.h:261
   VK_PAUSE : constant := 16#13#;            --  winuser.h:262
   VK_CAPITAL : constant := 16#14#;            --  winuser.h:263
   VK_ESCAPE : constant := 16#1b#;            --  winuser.h:265
   VK_SPACE : constant := 16#20#;            --  winuser.h:267
   VK_PRIOR : constant := 16#21#;            --  winuser.h:268
   VK_NEXT : constant := 16#22#;            --  winuser.h:269
   VK_END : constant := 16#23#;            --  winuser.h:270
   VK_HOME : constant := 16#24#;            --  winuser.h:271
   VK_LEFT : constant := 16#25#;            --  winuser.h:272
   VK_UP : constant := 16#26#;            --  winuser.h:273
   VK_RIGHT : constant := 16#27#;            --  winuser.h:274
   VK_DOWN : constant := 16#28#;            --  winuser.h:275
   VK_SELECT : constant := 16#29#;            --  winuser.h:276
   VK_PRINT : constant := 16#2a#;            --  winuser.h:277
   VK_EXECUTE : constant := 16#2b#;            --  winuser.h:278
   VK_SNAPSHOT : constant := 16#2c#;            --  winuser.h:279
   VK_INSERT : constant := 16#2d#;            --  winuser.h:280
   VK_DELETE : constant := 16#2e#;            --  winuser.h:281
   VK_HELP : constant := 16#2f#;            --  winuser.h:282
   VK_LWIN : constant := 16#5b#;            --  winuser.h:287
   VK_RWIN : constant := 16#5c#;            --  winuser.h:288
   VK_APPS : constant := 16#5d#;            --  winuser.h:289
   VK_NUMPAD0 : constant := 16#60#;            --  winuser.h:291
   VK_NUMPAD1 : constant := 16#61#;            --  winuser.h:292
   VK_NUMPAD2 : constant := 16#62#;            --  winuser.h:293
   VK_NUMPAD3 : constant := 16#63#;            --  winuser.h:294
   VK_NUMPAD4 : constant := 16#64#;            --  winuser.h:295
   VK_NUMPAD5 : constant := 16#65#;            --  winuser.h:296
   VK_NUMPAD6 : constant := 16#66#;            --  winuser.h:297
   VK_NUMPAD7 : constant := 16#67#;            --  winuser.h:298
   VK_NUMPAD8 : constant := 16#68#;            --  winuser.h:299
   VK_NUMPAD9 : constant := 16#69#;            --  winuser.h:300
   VK_MULTIPLY : constant := 16#6a#;            --  winuser.h:301
   VK_ADD : constant := 16#6b#;            --  winuser.h:302
   VK_SEPARATOR : constant := 16#6c#;            --  winuser.h:303
   VK_SUBTRACT : constant := 16#6d#;            --  winuser.h:304
   VK_DECIMAL : constant := 16#6e#;            --  winuser.h:305
   VK_DIVIDE : constant := 16#6f#;            --  winuser.h:306
   VK_F1 : constant := 16#70#;            --  winuser.h:307
   VK_F2 : constant := 16#71#;            --  winuser.h:308
   VK_F3 : constant := 16#72#;            --  winuser.h:309
   VK_F4 : constant := 16#73#;            --  winuser.h:310
   VK_F5 : constant := 16#74#;            --  winuser.h:311
   VK_F6 : constant := 16#75#;            --  winuser.h:312
   VK_F7 : constant := 16#76#;            --  winuser.h:313
   VK_F8 : constant := 16#77#;            --  winuser.h:314
   VK_F9 : constant := 16#78#;            --  winuser.h:315
   VK_F10 : constant := 16#79#;            --  winuser.h:316
   VK_F11 : constant := 16#7a#;            --  winuser.h:317
   VK_F12 : constant := 16#7b#;            --  winuser.h:318
   VK_F13 : constant := 16#7c#;            --  winuser.h:319
   VK_F14 : constant := 16#7d#;            --  winuser.h:320
   VK_F15 : constant := 16#7e#;            --  winuser.h:321
   VK_F16 : constant := 16#7f#;            --  winuser.h:322
   VK_F17 : constant := 16#80#;            --  winuser.h:323
   VK_F18 : constant := 16#81#;            --  winuser.h:324
   VK_F19 : constant := 16#82#;            --  winuser.h:325
   VK_F20 : constant := 16#83#;            --  winuser.h:326
   VK_F21 : constant := 16#84#;            --  winuser.h:327
   VK_F22 : constant := 16#85#;            --  winuser.h:328
   VK_F23 : constant := 16#86#;            --  winuser.h:329
   VK_F24 : constant := 16#87#;            --  winuser.h:330
   VK_NUMLOCK : constant := 16#90#;            --  winuser.h:332
   VK_SCROLL : constant := 16#91#;            --  winuser.h:333
   VK_LSHIFT : constant := 16#a0#;            --  winuser.h:340
   VK_RSHIFT : constant := 16#a1#;            --  winuser.h:341
   VK_LCONTROL : constant := 16#a2#;            --  winuser.h:342
   VK_RCONTROL : constant := 16#a3#;            --  winuser.h:343
   VK_LMENU : constant := 16#a4#;            --  winuser.h:344
   VK_RMENU : constant := 16#a5#;            --  winuser.h:345
   VK_ATTN : constant := 16#f6#;            --  winuser.h:347
   VK_CRSEL : constant := 16#f7#;            --  winuser.h:348
   VK_EXSEL : constant := 16#f8#;            --  winuser.h:349
   VK_EREOF : constant := 16#f9#;            --  winuser.h:350
   VK_PLAY : constant := 16#fa#;            --  winuser.h:351
   VK_ZOOM : constant := 16#fb#;            --  winuser.h:352
   VK_NONAME : constant := 16#fc#;            --  winuser.h:353
   VK_PA1 : constant := 16#fd#;            --  winuser.h:354
   VK_OEM_CLEAR : constant := 16#fe#;            --  winuser.h:355
   WH_MIN : constant := -1;                --  winuser.h:364
   WH_MSGFILTER : constant := -1;                --  winuser.h:365
   WH_JOURNALRECORD : constant := 0;                 --  winuser.h:366
   WH_JOURNALPLAYBACK : constant := 1;                 --  winuser.h:367
   WH_KEYBOARD : constant := 2;                 --  winuser.h:368
   WH_GETMESSAGE : constant := 3;                 --  winuser.h:369
   WH_CALLWNDPROC : constant := 4;                 --  winuser.h:370
   WH_CBT : constant := 5;                 --  winuser.h:371
   WH_SYSMSGFILTER : constant := 6;                 --  winuser.h:372
   WH_MOUSE : constant := 7;                 --  winuser.h:373
   WH_HARDWARE : constant := 8;                 --  winuser.h:374
   WH_DEBUG : constant := 9;                 --  winuser.h:375
   WH_SHELL : constant := 10;                --  winuser.h:376
   WH_FOREGROUNDIDLE : constant := 11;                --  winuser.h:377
   WH_MAX : constant := 11;                --  winuser.h:378
   HC_ACTION : constant := 0;                 --  winuser.h:383
   HC_GETNEXT : constant := 1;                 --  winuser.h:384
   HC_SKIP : constant := 2;                 --  winuser.h:385
   HC_NOREMOVE : constant := 3;                 --  winuser.h:386
   HC_NOREM : constant := 3;                 --  winuser.h:387
   HC_SYSMODALON : constant := 4;                 --  winuser.h:388
   HC_SYSMODALOFF : constant := 5;                 --  winuser.h:389
   HCBT_MOVESIZE : constant := 0;                 --  winuser.h:394
   HCBT_MINMAX : constant := 1;                 --  winuser.h:395
   HCBT_QS : constant := 2;                 --  winuser.h:396
   HCBT_CREATEWND : constant := 3;                 --  winuser.h:397
   HCBT_DESTROYWND : constant := 4;                 --  winuser.h:398
   HCBT_ACTIVATE : constant := 5;                 --  winuser.h:399
   HCBT_CLICKSKIPPED : constant := 6;                 --  winuser.h:400
   HCBT_KEYSKIPPED : constant := 7;                 --  winuser.h:401
   HCBT_SYSCOMMAND : constant := 8;                 --  winuser.h:402
   HCBT_SETFOCUS : constant := 9;                 --  winuser.h:403
   MSGF_DIALOGBOX : constant := 0;                 --  winuser.h:441
   MSGF_MESSAGEBOX : constant := 1;                 --  winuser.h:442
   MSGF_MENU : constant := 2;                 --  winuser.h:443
   MSGF_MOVE : constant := 3;                 --  winuser.h:444
   MSGF_SIZE : constant := 4;                 --  winuser.h:445
   MSGF_SCROLLBAR : constant := 5;                 --  winuser.h:446
   MSGF_NEXTWINDOW : constant := 6;                 --  winuser.h:447
   MSGF_MAINLOOP : constant := 8;                 --  winuser.h:448
   MSGF_MAX : constant := 8;                 --  winuser.h:449
   MSGF_USER : constant := 4096;              --  winuser.h:450
   HSHELL_WINDOWCREATED : constant := 1;                 --  winuser.h:455
   HSHELL_WINDOWDESTROYED : constant := 2;                 --  winuser.h:456
   HSHELL_ACTIVATESHELLWINDOW : constant := 3;              --  winuser.h:457
   HKL_PREV : constant := 0;                 --  winuser.h:510
   HKL_NEXT : constant := 1;                 --  winuser.h:511
   KLF_ACTIVATE : constant := 16#1#;             --  winuser.h:513
   KLF_SUBSTITUTE_OK : constant := 16#2#;             --  winuser.h:514
   KLF_UNLOADPREVIOUS : constant := 16#4#;             --  winuser.h:515
   KLF_REORDER : constant := 16#8#;             --  winuser.h:516
   KL_NAMELENGTH : constant := 9;                 --  winuser.h:521
   DESKTOP_READOBJECTS : constant := 16#1#;             --  winuser.h:575
   DESKTOP_CREATEWINDOW : constant := 16#2#;             --  winuser.h:576
   DESKTOP_CREATEMENU : constant := 16#4#;             --  winuser.h:577
   DESKTOP_HOOKCONTROL : constant := 16#8#;             --  winuser.h:578
   DESKTOP_JOURNALRECORD : constant := 16#10#;            --  winuser.h:579
   DESKTOP_JOURNALPLAYBACK : constant := 16#20#;            --  winuser.h:580
   DESKTOP_ENUMERATE : constant := 16#40#;            --  winuser.h:581
   DESKTOP_WRITEOBJECTS : constant := 16#80#;            --  winuser.h:582
   WINSTA_ENUMDESKTOPS : constant := 16#1#;             --  winuser.h:596
   WINSTA_READATTRIBUTES : constant := 16#2#;             --  winuser.h:597
   WINSTA_ACCESSCLIPBOARD : constant := 16#4#;             --  winuser.h:598
   WINSTA_CREATEDESKTOP : constant := 16#8#;             --  winuser.h:599
   WINSTA_WRITEATTRIBUTES : constant := 16#10#;            --  winuser.h:600
   WINSTA_ACCESSGLOBALATOMS : constant := 16#20#;           --  winuser.h:601
   WINSTA_EXITWINDOWS : constant := 16#40#;            --  winuser.h:602
   WINSTA_ENUMERATE : constant := 16#100#;           --  winuser.h:603
   WINSTA_READSCREEN : constant := 16#200#;           --  winuser.h:604
   GWL_WNDPROC : constant := -4;                --  winuser.h:706
   GWL_HINSTANCE : constant := -6;                --  winuser.h:707
   GWL_HWNDPARENT : constant := -8;                --  winuser.h:708
   GWL_STYLE : constant := -16;               --  winuser.h:709
   GWL_EXSTYLE : constant := -20;               --  winuser.h:710
   GWL_USERDATA : constant := -21;               --  winuser.h:711
   GWL_ID : constant := -12;               --  winuser.h:712
   GCL_MENUNAME : constant := -8;                --  winuser.h:717
   GCL_HBRBACKGROUND : constant := -10;               --  winuser.h:718
   GCL_HCURSOR : constant := -12;               --  winuser.h:719
   GCL_HICON : constant := -14;               --  winuser.h:720
   GCL_HMODULE : constant := -16;               --  winuser.h:721
   GCL_CBWNDEXTRA : constant := -18;               --  winuser.h:722
   GCL_CBCLSEXTRA : constant := -20;               --  winuser.h:723
   GCL_WNDPROC : constant := -24;               --  winuser.h:724
   GCL_STYLE : constant := -26;               --  winuser.h:725
   GCW_ATOM : constant := -32;               --  winuser.h:726
   WM_NULL : constant := 16#0#;             --  winuser.h:737
   WM_CREATE : constant := 16#1#;             --  winuser.h:738
   WM_DESTROY : constant := 16#2#;             --  winuser.h:739
   WM_MOVE : constant := 16#3#;             --  winuser.h:740
   WM_SIZE : constant := 16#5#;             --  winuser.h:741
   WM_ACTIVATE : constant := 16#6#;             --  winuser.h:743
   WA_INACTIVE : constant := 0;                 --  winuser.h:747
   WA_ACTIVE : constant := 1;                 --  winuser.h:748
   WA_CLICKACTIVE : constant := 2;                 --  winuser.h:749
   WM_SETFOCUS : constant := 16#7#;             --  winuser.h:751
   WM_KILLFOCUS : constant := 16#8#;             --  winuser.h:752
   WM_ENABLE : constant := 16#a#;             --  winuser.h:753
   WM_SETREDRAW : constant := 16#b#;             --  winuser.h:754
   WM_SETTEXT : constant := 16#c#;             --  winuser.h:755
   WM_GETTEXT : constant := 16#d#;             --  winuser.h:756
   WM_GETTEXTLENGTH : constant := 16#e#;             --  winuser.h:757
   WM_PAINT : constant := 16#f#;             --  winuser.h:758
   WM_CLOSE : constant := 16#10#;            --  winuser.h:759
   WM_QUERYENDSESSION : constant := 16#11#;            --  winuser.h:760
   WM_QUIT : constant := 16#12#;            --  winuser.h:761
   WM_QUERYOPEN : constant := 16#13#;            --  winuser.h:762
   WM_ERASEBKGND : constant := 16#14#;            --  winuser.h:763
   WM_SYSCOLORCHANGE : constant := 16#15#;            --  winuser.h:764
   WM_ENDSESSION : constant := 16#16#;            --  winuser.h:765
   WM_SHOWWINDOW : constant := 16#18#;            --  winuser.h:766
   WM_WININICHANGE : constant := 16#1a#;            --  winuser.h:767
   WM_DEVMODECHANGE : constant := 16#1b#;            --  winuser.h:771
   WM_ACTIVATEAPP : constant := 16#1c#;            --  winuser.h:772
   WM_FONTCHANGE : constant := 16#1d#;            --  winuser.h:773
   WM_TIMECHANGE : constant := 16#1e#;            --  winuser.h:774
   WM_CANCELMODE : constant := 16#1f#;            --  winuser.h:775
   WM_SETCURSOR : constant := 16#20#;            --  winuser.h:776
   WM_MOUSEACTIVATE : constant := 16#21#;            --  winuser.h:777
   WM_CHILDACTIVATE : constant := 16#22#;            --  winuser.h:778
   WM_QUEUESYNC : constant := 16#23#;            --  winuser.h:779
   WM_GETMINMAXINFO : constant := 16#24#;            --  winuser.h:781
   WM_PAINTICON : constant := 16#26#;            --  winuser.h:794
   WM_ICONERASEBKGND : constant := 16#27#;            --  winuser.h:795
   WM_NEXTDLGCTL : constant := 16#28#;            --  winuser.h:796
   WM_SPOOLERSTATUS : constant := 16#2a#;            --  winuser.h:797
   WM_DRAWITEM : constant := 16#2b#;            --  winuser.h:798
   WM_MEASUREITEM : constant := 16#2c#;            --  winuser.h:799
   WM_DELETEITEM : constant := 16#2d#;            --  winuser.h:800
   WM_VKEYTOITEM : constant := 16#2e#;            --  winuser.h:801
   WM_CHARTOITEM : constant := 16#2f#;            --  winuser.h:802
   WM_SETFONT : constant := 16#30#;            --  winuser.h:803
   WM_GETFONT : constant := 16#31#;            --  winuser.h:804
   WM_SETHOTKEY : constant := 16#32#;            --  winuser.h:805
   WM_GETHOTKEY : constant := 16#33#;            --  winuser.h:806
   WM_QUERYDRAGICON : constant := 16#37#;            --  winuser.h:807
   WM_COMPAREITEM : constant := 16#39#;            --  winuser.h:808
   WM_COMPACTING : constant := 16#41#;            --  winuser.h:810
   WM_COMMNOTIFY : constant := 16#44#;            --  winuser.h:811
   WM_WINDOWPOSCHANGING : constant := 16#46#;            --  winuser.h:812
   WM_WINDOWPOSCHANGED : constant := 16#47#;            --  winuser.h:813
   WM_POWER : constant := 16#48#;            --  winuser.h:815
   PWR_OK : constant := 1;                 --  winuser.h:819
   PWR_FAIL : constant := -1;                --  winuser.h:820
   PWR_SUSPENDREQUEST : constant := 1;                 --  winuser.h:821
   PWR_SUSPENDRESUME : constant := 2;                 --  winuser.h:822
   PWR_CRITICALRESUME : constant := 3;                 --  winuser.h:823
   WM_COPYDATA : constant := 16#4a#;            --  winuser.h:825
   WM_CANCELJOURNAL : constant := 16#4b#;            --  winuser.h:826
   WM_NCCREATE : constant := 16#81#;            --  winuser.h:838
   WM_NCDESTROY : constant := 16#82#;            --  winuser.h:839
   WM_NCCALCSIZE : constant := 16#83#;            --  winuser.h:840
   WM_NCHITTEST : constant := 16#84#;            --  winuser.h:841
   WM_NCPAINT : constant := 16#85#;            --  winuser.h:842
   WM_NCACTIVATE : constant := 16#86#;            --  winuser.h:843
   WM_GETDLGCODE : constant := 16#87#;            --  winuser.h:844
   WM_NCMOUSEMOVE : constant := 16#a0#;            --  winuser.h:846
   WM_NCLBUTTONDOWN : constant := 16#a1#;            --  winuser.h:847
   WM_NCLBUTTONUP : constant := 16#a2#;            --  winuser.h:848
   WM_NCLBUTTONDBLCLK : constant := 16#a3#;            --  winuser.h:849
   WM_NCRBUTTONDOWN : constant := 16#a4#;            --  winuser.h:850
   WM_NCRBUTTONUP : constant := 16#a5#;            --  winuser.h:851
   WM_NCRBUTTONDBLCLK : constant := 16#a6#;            --  winuser.h:852
   WM_NCMBUTTONDOWN : constant := 16#a7#;            --  winuser.h:853
   WM_NCMBUTTONUP : constant := 16#a8#;            --  winuser.h:854
   WM_NCMBUTTONDBLCLK : constant := 16#a9#;            --  winuser.h:855
   WM_KEYFIRST : constant := 16#100#;           --  winuser.h:857
   WM_KEYDOWN : constant := 16#100#;           --  winuser.h:858
   WM_KEYUP : constant := 16#101#;           --  winuser.h:859
   WM_CHAR : constant := 16#102#;           --  winuser.h:860
   WM_DEADCHAR : constant := 16#103#;           --  winuser.h:861
   WM_SYSKEYDOWN : constant := 16#104#;           --  winuser.h:862
   WM_SYSKEYUP : constant := 16#105#;           --  winuser.h:863
   WM_SYSCHAR : constant := 16#106#;           --  winuser.h:864
   WM_SYSDEADCHAR : constant := 16#107#;           --  winuser.h:865
   WM_KEYLAST : constant := 16#108#;           --  winuser.h:866
   WM_INITDIALOG : constant := 16#110#;           --  winuser.h:868
   WM_COMMAND : constant := 16#111#;           --  winuser.h:869
   WM_SYSCOMMAND : constant := 16#112#;           --  winuser.h:870
   WM_TIMER : constant := 16#113#;           --  winuser.h:871
   WM_HSCROLL : constant := 16#114#;           --  winuser.h:872
   WM_VSCROLL : constant := 16#115#;           --  winuser.h:873
   WM_INITMENU : constant := 16#116#;           --  winuser.h:874
   WM_INITMENUPOPUP : constant := 16#117#;           --  winuser.h:875
   WM_MENUSELECT : constant := 16#11f#;           --  winuser.h:876
   WM_MENUCHAR : constant := 16#120#;           --  winuser.h:877
   WM_ENTERIDLE : constant := 16#121#;           --  winuser.h:878
   WM_CTLCOLORMSGBOX : constant := 16#132#;           --  winuser.h:880
   WM_CTLCOLOREDIT : constant := 16#133#;           --  winuser.h:881
   WM_CTLCOLORLISTBOX : constant := 16#134#;           --  winuser.h:882
   WM_CTLCOLORBTN : constant := 16#135#;           --  winuser.h:883
   WM_CTLCOLORDLG : constant := 16#136#;           --  winuser.h:884
   WM_CTLCOLORSCROLLBAR : constant := 16#137#;           --  winuser.h:885
   WM_CTLCOLORSTATIC : constant := 16#138#;           --  winuser.h:886
   WM_MOUSEFIRST : constant := 16#200#;           --  winuser.h:890
   WM_MOUSEMOVE : constant := 16#200#;           --  winuser.h:891
   WM_LBUTTONDOWN : constant := 16#201#;           --  winuser.h:892
   WM_LBUTTONUP : constant := 16#202#;           --  winuser.h:893
   WM_LBUTTONDBLCLK : constant := 16#203#;           --  winuser.h:894
   WM_RBUTTONDOWN : constant := 16#204#;           --  winuser.h:895
   WM_RBUTTONUP : constant := 16#205#;           --  winuser.h:896
   WM_RBUTTONDBLCLK : constant := 16#206#;           --  winuser.h:897
   WM_MBUTTONDOWN : constant := 16#207#;           --  winuser.h:898
   WM_MBUTTONUP : constant := 16#208#;           --  winuser.h:899
   WM_MBUTTONDBLCLK : constant := 16#209#;           --  winuser.h:900
   WM_MOUSELAST : constant := 16#209#;           --  winuser.h:901
   WM_PARENTNOTIFY : constant := 16#210#;           --  winuser.h:903
   WM_ENTERMENULOOP : constant := 16#211#;           --  winuser.h:904
   WM_EXITMENULOOP : constant := 16#212#;           --  winuser.h:905
   WM_MDICREATE : constant := 16#220#;           --  winuser.h:908
   WM_MDIDESTROY : constant := 16#221#;           --  winuser.h:909
   WM_MDIACTIVATE : constant := 16#222#;           --  winuser.h:910
   WM_MDIRESTORE : constant := 16#223#;           --  winuser.h:911
   WM_MDINEXT : constant := 16#224#;           --  winuser.h:912
   WM_MDIMAXIMIZE : constant := 16#225#;           --  winuser.h:913
   WM_MDITILE : constant := 16#226#;           --  winuser.h:914
   WM_MDICASCADE : constant := 16#227#;           --  winuser.h:915
   WM_MDIICONARRANGE : constant := 16#228#;           --  winuser.h:916
   WM_MDIGETACTIVE : constant := 16#229#;           --  winuser.h:917
   WM_MDISETMENU : constant := 16#230#;           --  winuser.h:921
   WM_DROPFILES : constant := 16#233#;           --  winuser.h:922
   WM_MDIREFRESHMENU : constant := 16#234#;           --  winuser.h:923
   WM_CUT : constant := 16#300#;           --  winuser.h:926
   WM_COPY : constant := 16#301#;           --  winuser.h:927
   WM_PASTE : constant := 16#302#;           --  winuser.h:928
   WM_CLEAR : constant := 16#303#;           --  winuser.h:929
   WM_UNDO : constant := 16#304#;           --  winuser.h:930
   WM_RENDERFORMAT : constant := 16#305#;           --  winuser.h:931
   WM_RENDERALLFORMATS : constant := 16#306#;           --  winuser.h:932
   WM_DESTROYCLIPBOARD : constant := 16#307#;           --  winuser.h:933
   WM_DRAWCLIPBOARD : constant := 16#308#;           --  winuser.h:934
   WM_PAINTCLIPBOARD : constant := 16#309#;           --  winuser.h:935
   WM_VSCROLLCLIPBOARD : constant := 16#30a#;           --  winuser.h:936
   WM_SIZECLIPBOARD : constant := 16#30b#;           --  winuser.h:937
   WM_ASKCBFORMATNAME : constant := 16#30c#;           --  winuser.h:938
   WM_CHANGECBCHAIN : constant := 16#30d#;           --  winuser.h:939
   WM_HSCROLLCLIPBOARD : constant := 16#30e#;           --  winuser.h:940
   WM_QUERYNEWPALETTE : constant := 16#30f#;           --  winuser.h:941
   WM_PALETTEISCHANGING : constant := 16#310#;           --  winuser.h:942
   WM_PALETTECHANGED : constant := 16#311#;           --  winuser.h:943
   WM_HOTKEY : constant := 16#312#;           --  winuser.h:944
   WM_PENWINFIRST : constant := 16#380#;           --  winuser.h:947
   WM_PENWINLAST : constant := 16#38f#;           --  winuser.h:948
   WM_USER : constant := 16#400#;           --  winuser.h:964
   ST_BEGINSWP : constant := 0;                 --  winuser.h:972
   ST_ENDSWP : constant := 1;                 --  winuser.h:973
   HTERROR : constant := -2;                --  winuser.h:978
   HTTRANSPARENT : constant := -1;                --  winuser.h:979
   HTNOWHERE : constant := 0;                 --  winuser.h:980
   HTCLIENT : constant := 1;                 --  winuser.h:981
   HTCAPTION : constant := 2;                 --  winuser.h:982
   HTSYSMENU : constant := 3;                 --  winuser.h:983
   HTGROWBOX : constant := 4;                 --  winuser.h:984
   HTSIZE : constant := 4;                 --  winuser.h:985
   HTMENU : constant := 5;                 --  winuser.h:986
   HTHSCROLL : constant := 6;                 --  winuser.h:987
   HTVSCROLL : constant := 7;                 --  winuser.h:988
   HTMINBUTTON : constant := 8;                 --  winuser.h:989
   HTMAXBUTTON : constant := 9;                 --  winuser.h:990
   HTLEFT : constant := 10;                --  winuser.h:991
   HTRIGHT : constant := 11;                --  winuser.h:992
   HTTOP : constant := 12;                --  winuser.h:993
   HTTOPLEFT : constant := 13;                --  winuser.h:994
   HTTOPRIGHT : constant := 14;                --  winuser.h:995
   HTBOTTOM : constant := 15;                --  winuser.h:996
   HTBOTTOMLEFT : constant := 16;                --  winuser.h:997
   HTBOTTOMRIGHT : constant := 17;                --  winuser.h:998
   HTBORDER : constant := 18;                --  winuser.h:999
   HTREDUCE : constant := 8;                 --  winuser.h:1000
   HTZOOM : constant := 9;                 --  winuser.h:1001
   HTSIZEFIRST : constant := 10;                --  winuser.h:1002
   HTSIZELAST : constant := 17;                --  winuser.h:1003
   SMTO_NORMAL : constant := 16#0#;             --  winuser.h:1008
   SMTO_BLOCK : constant := 16#1#;             --  winuser.h:1009
   SMTO_ABORTIFHUNG : constant := 16#2#;             --  winuser.h:1010
   MA_ACTIVATE : constant := 1;                 --  winuser.h:1017
   MA_ACTIVATEANDEAT : constant := 2;                 --  winuser.h:1018
   MA_NOACTIVATE : constant := 3;                 --  winuser.h:1019
   MA_NOACTIVATEANDEAT : constant := 4;                 --  winuser.h:1020
   SIZE_RESTORED : constant := 0;                 --  winuser.h:1041
   SIZE_MINIMIZED : constant := 1;                 --  winuser.h:1042
   SIZE_MAXIMIZED : constant := 2;                 --  winuser.h:1043
   SIZE_MAXSHOW : constant := 3;                 --  winuser.h:1044
   SIZE_MAXHIDE : constant := 4;                 --  winuser.h:1045
   SIZENORMAL : constant := 0;                 --  winuser.h:1050
   SIZEICONIC : constant := 1;                 --  winuser.h:1051
   SIZEFULLSCREEN : constant := 2;                 --  winuser.h:1052
   SIZEZOOMSHOW : constant := 3;                 --  winuser.h:1053
   SIZEZOOMHIDE : constant := 4;                 --  winuser.h:1054
   WVR_ALIGNTOP : constant := 16#10#;            --  winuser.h:1080
   WVR_ALIGNLEFT : constant := 16#20#;            --  winuser.h:1081
   WVR_ALIGNBOTTOM : constant := 16#40#;            --  winuser.h:1082
   WVR_ALIGNRIGHT : constant := 16#80#;            --  winuser.h:1083
   WVR_HREDRAW : constant := 16#100#;           --  winuser.h:1084
   WVR_VREDRAW : constant := 16#200#;           --  winuser.h:1085
   WVR_REDRAW : constant := 16#300#;           --  winuser.h:1086
   WVR_VALIDRECTS : constant := 16#400#;           --  winuser.h:1088
   MK_LBUTTON : constant := 16#1#;             --  winuser.h:1096
   MK_RBUTTON : constant := 16#2#;             --  winuser.h:1097
   MK_SHIFT : constant := 16#4#;             --  winuser.h:1098
   MK_CONTROL : constant := 16#8#;             --  winuser.h:1099
   MK_MBUTTON : constant := 16#10#;            --  winuser.h:1100
   WS_OVERLAPPED : constant := 16#0#;             --  winuser.h:1111
   WS_POPUP : constant := 16#80000000#;      --  winuser.h:1112
   WS_CHILD : constant := 16#40000000#;      --  winuser.h:1113
   WS_MINIMIZE : constant := 16#20000000#;      --  winuser.h:1114
   WS_VISIBLE : constant := 16#10000000#;      --  winuser.h:1115
   WS_DISABLED : constant := 16#8000000#;       --  winuser.h:1116
   WS_CLIPSIBLINGS : constant := 16#4000000#;       --  winuser.h:1117
   WS_CLIPCHILDREN : constant := 16#2000000#;       --  winuser.h:1118
   WS_MAXIMIZE : constant := 16#1000000#;       --  winuser.h:1119
   WS_CAPTION : constant := 16#c00000#;        --  winuser.h:1120
   WS_BORDER : constant := 16#800000#;        --  winuser.h:1121
   WS_DLGFRAME : constant := 16#400000#;        --  winuser.h:1122
   WS_VSCROLL : constant := 16#200000#;        --  winuser.h:1123
   WS_HSCROLL : constant := 16#100000#;        --  winuser.h:1124
   WS_SYSMENU : constant := 16#80000#;         --  winuser.h:1125
   WS_THICKFRAME : constant := 16#40000#;         --  winuser.h:1126
   WS_GROUP : constant := 16#20000#;         --  winuser.h:1127
   WS_TABSTOP : constant := 16#10000#;         --  winuser.h:1128
   WS_MINIMIZEBOX : constant := 16#20000#;         --  winuser.h:1130
   WS_MAXIMIZEBOX : constant := 16#10000#;         --  winuser.h:1131
   WS_TILED : constant := 16#0#;             --  winuser.h:1133
   WS_ICONIC : constant := 16#20000000#;      --  winuser.h:1134
   WS_SIZEBOX : constant := 16#40000#;         --  winuser.h:1135
   WS_TILEDWINDOW : constant := 16#cf0000#;        --  winuser.h:1136
   WS_OVERLAPPEDWINDOW : constant := 16#cf0000#;        --  winuser.h:1141
   WS_POPUPWINDOW : constant := 16#80880000#;      --  winuser.h:1148
   WS_CHILDWINDOW : constant := 16#40000000#;      --  winuser.h:1152
   WS_EX_DLGMODALFRAME : constant := 16#1#;             --  winuser.h:1157
   WS_EX_NOPARENTNOTIFY : constant := 16#4#;             --  winuser.h:1158
   WS_EX_TOPMOST : constant := 16#8#;             --  winuser.h:1159
   WS_EX_ACCEPTFILES : constant := 16#10#;            --  winuser.h:1160
   WS_EX_TRANSPARENT : constant := 16#20#;            --  winuser.h:1161
   CS_VREDRAW : constant := 16#1#;             --  winuser.h:1167
   CS_HREDRAW : constant := 16#2#;             --  winuser.h:1168
   CS_KEYCVTWINDOW : constant := 16#4#;             --  winuser.h:1169
   CS_DBLCLKS : constant := 16#8#;             --  winuser.h:1170
   CS_OWNDC : constant := 16#20#;            --  winuser.h:1171
   CS_CLASSDC : constant := 16#40#;            --  winuser.h:1172
   CS_PARENTDC : constant := 16#80#;            --  winuser.h:1173
   CS_NOKEYCVT : constant := 16#100#;           --  winuser.h:1174
   CS_NOCLOSE : constant := 16#200#;           --  winuser.h:1175
   CS_SAVEBITS : constant := 16#800#;           --  winuser.h:1176
   CS_BYTEALIGNCLIENT : constant := 16#1000#;          --  winuser.h:1177
   CS_BYTEALIGNWINDOW : constant := 16#2000#;          --  winuser.h:1178
   CS_GLOBALCLASS : constant := 16#4000#;          --  winuser.h:1179
   CF_TEXT : constant := 1;                 --  winuser.h:1189
   CF_BITMAP : constant := 2;                 --  winuser.h:1190
   CF_METAFILEPICT : constant := 3;                 --  winuser.h:1191
   CF_SYLK : constant := 4;                 --  winuser.h:1192
   CF_DIF : constant := 5;                 --  winuser.h:1193
   CF_TIFF : constant := 6;                 --  winuser.h:1194
   CF_OEMTEXT : constant := 7;                 --  winuser.h:1195
   CF_DIB : constant := 8;                 --  winuser.h:1196
   CF_PALETTE : constant := 9;                 --  winuser.h:1197
   CF_PENDATA : constant := 10;                --  winuser.h:1198
   CF_RIFF : constant := 11;                --  winuser.h:1199
   CF_WAVE : constant := 12;                --  winuser.h:1200
   CF_UNICODETEXT : constant := 13;                --  winuser.h:1201
   CF_ENHMETAFILE : constant := 14;                --  winuser.h:1202
   CF_OWNERDISPLAY : constant := 16#80#;            --  winuser.h:1204
   CF_DSPTEXT : constant := 16#81#;            --  winuser.h:1205
   CF_DSPBITMAP : constant := 16#82#;            --  winuser.h:1206
   CF_DSPMETAFILEPICT : constant := 16#83#;            --  winuser.h:1207
   CF_DSPENHMETAFILE : constant := 16#8e#;            --  winuser.h:1208
   CF_PRIVATEFIRST : constant := 16#200#;           --  winuser.h:1213
   CF_PRIVATELAST : constant := 16#2ff#;           --  winuser.h:1214
   CF_GDIOBJFIRST : constant := 16#300#;           --  winuser.h:1219
   CF_GDIOBJLAST : constant := 16#3ff#;           --  winuser.h:1220
   FVIRTKEY : constant := 1;                 --  winuser.h:1227
   FNOINVERT : constant := 16#2#;             --  winuser.h:1228
   FSHIFT : constant := 16#4#;             --  winuser.h:1229
   FCONTROL : constant := 16#8#;             --  winuser.h:1230
   FALT : constant := 16#10#;            --  winuser.h:1231
   WPF_SETMINPOSITION : constant := 16#1#;             --  winuser.h:1294
   WPF_RESTORETOMAXIMIZED : constant := 16#2#;             --  winuser.h:1295
   ODT_MENU : constant := 1;                 --  winuser.h:1301
   ODT_LISTBOX : constant := 2;                 --  winuser.h:1302
   ODT_COMBOBOX : constant := 3;                 --  winuser.h:1303
   ODT_BUTTON : constant := 4;                 --  winuser.h:1304
   ODA_DRAWENTIRE : constant := 16#1#;             --  winuser.h:1309
   ODA_SELECT : constant := 16#2#;             --  winuser.h:1310
   ODA_FOCUS : constant := 16#4#;             --  winuser.h:1311
   ODS_SELECTED : constant := 16#1#;             --  winuser.h:1316
   ODS_GRAYED : constant := 16#2#;             --  winuser.h:1317
   ODS_DISABLED : constant := 16#4#;             --  winuser.h:1318
   ODS_CHECKED : constant := 16#8#;             --  winuser.h:1319
   ODS_FOCUS : constant := 16#10#;            --  winuser.h:1320
   PM_NOREMOVE : constant := 16#0#;             --  winuser.h:1460
   PM_REMOVE : constant := 16#1#;             --  winuser.h:1461
   PM_NOYIELD : constant := 16#2#;             --  winuser.h:1462
   MOD_ALT : constant := 16#1#;             --  winuser.h:1482
   MOD_CONTROL : constant := 16#2#;             --  winuser.h:1483
   MOD_SHIFT : constant := 16#4#;             --  winuser.h:1484
   IDHOT_SNAPWINDOW : constant := -1;                --  winuser.h:1486
   IDHOT_SNAPDESKTOP : constant := -2;                --  winuser.h:1487
   EWX_LOGOFF : constant := 0;                 --  winuser.h:1499
   EWX_SHUTDOWN : constant := 1;                 --  winuser.h:1500
   EWX_REBOOT : constant := 2;                 --  winuser.h:1501
   EWX_FORCE : constant := 4;                 --  winuser.h:1502
   EWX_POWEROFF : constant := 8;                 --  winuser.h:1503
   CW_USEDEFAULT : constant INT := INT'First;     --  winuser.h:1881
   HWND_BROADCAST : constant Win32.Windef.HWND;    --  winuser.h:1696
   HWND_DESKTOP : constant Win32.Windef.HWND;    --  winuser.h:1886
   SWP_NOSIZE : constant := 16#1#;             --  winuser.h:2098
   SWP_NOMOVE : constant := 16#2#;             --  winuser.h:2099
   SWP_NOZORDER : constant := 16#4#;             --  winuser.h:2100
   SWP_NOREDRAW : constant := 16#8#;             --  winuser.h:2101
   SWP_NOACTIVATE : constant := 16#10#;            --  winuser.h:2102
   SWP_FRAMECHANGED : constant := 16#20#;            --  winuser.h:2103
   SWP_SHOWWINDOW : constant := 16#40#;            --  winuser.h:2104
   SWP_HIDEWINDOW : constant := 16#80#;            --  winuser.h:2105
   SWP_NOCOPYBITS : constant := 16#100#;           --  winuser.h:2106
   SWP_NOOWNERZORDER : constant := 16#200#;           --  winuser.h:2107
   SWP_DRAWFRAME : constant := 16#20#;            --  winuser.h:2109
   SWP_NOREPOSITION : constant := 16#200#;           --  winuser.h:2110
   HWND_TOP : constant Win32.Windef.HWND;    --  winuser.h:2116
   HWND_BOTTOM : constant Win32.Windef.HWND;    --  winuser.h:2117
   HWND_TOPMOST : constant Win32.Windef.HWND;    --  winuser.h:2118
   HWND_NOTOPMOST : constant Win32.Windef.HWND;    --  winuser.h:2119
   DLGWINDOWEXTRA : constant := 30;                --  winuser.h:2500
   KEYEVENTF_EXTENDEDKEY : constant := 16#1#;             --  winuser.h:3044
   KEYEVENTF_KEYUP : constant := 16#2#;             --  winuser.h:3045
   MOUSEEVENTF_MOVE : constant := 16#1#;             --  winuser.h:3056
   MOUSEEVENTF_LEFTDOWN : constant := 16#2#;             --  winuser.h:3057
   MOUSEEVENTF_LEFTUP : constant := 16#4#;             --  winuser.h:3058
   MOUSEEVENTF_RIGHTDOWN : constant := 16#8#;             --  winuser.h:3059
   MOUSEEVENTF_RIGHTUP : constant := 16#10#;            --  winuser.h:3060
   MOUSEEVENTF_MIDDLEDOWN : constant := 16#20#;            --  winuser.h:3061
   MOUSEEVENTF_MIDDLEUP : constant := 16#40#;            --  winuser.h:3062
   MOUSEEVENTF_ABSOLUTE : constant := 16#8000#;          --  winuser.h:3063
   QS_KEY : constant := 16#1#;             --  winuser.h:3137
   QS_MOUSEMOVE : constant := 16#2#;             --  winuser.h:3138
   QS_MOUSEBUTTON : constant := 16#4#;             --  winuser.h:3139
   QS_POSTMESSAGE : constant := 16#8#;             --  winuser.h:3140
   QS_TIMER : constant := 16#10#;            --  winuser.h:3141
   QS_PAINT : constant := 16#20#;            --  winuser.h:3142
   QS_SENDMESSAGE : constant := 16#40#;            --  winuser.h:3143
   QS_HOTKEY : constant := 16#80#;            --  winuser.h:3144
   QS_MOUSE : constant := 16#6#;             --  winuser.h:3146
   QS_INPUT : constant := 16#7#;             --  winuser.h:3149
   QS_ALLEVENTS : constant := 16#bf#;            --  winuser.h:3152
   QS_ALLINPUT : constant := 16#ff#;            --  winuser.h:3158
   SM_CXSCREEN : constant := 0;                 --  winuser.h:3296
   SM_CYSCREEN : constant := 1;                 --  winuser.h:3297
   SM_CXVSCROLL : constant := 2;                 --  winuser.h:3298
   SM_CYHSCROLL : constant := 3;                 --  winuser.h:3299
   SM_CYCAPTION : constant := 4;                 --  winuser.h:3300
   SM_CXBORDER : constant := 5;                 --  winuser.h:3301
   SM_CYBORDER : constant := 6;                 --  winuser.h:3302
   SM_CXDLGFRAME : constant := 7;                 --  winuser.h:3303
   SM_CYDLGFRAME : constant := 8;                 --  winuser.h:3304
   SM_CYVTHUMB : constant := 9;                 --  winuser.h:3305
   SM_CXHTHUMB : constant := 10;                --  winuser.h:3306
   SM_CXICON : constant := 11;                --  winuser.h:3307
   SM_CYICON : constant := 12;                --  winuser.h:3308
   SM_CXCURSOR : constant := 13;                --  winuser.h:3309
   SM_CYCURSOR : constant := 14;                --  winuser.h:3310
   SM_CYMENU : constant := 15;                --  winuser.h:3311
   SM_CXFULLSCREEN : constant := 16;                --  winuser.h:3312
   SM_CYFULLSCREEN : constant := 17;                --  winuser.h:3313
   SM_CYKANJIWINDOW : constant := 18;                --  winuser.h:3314
   SM_MOUSEPRESENT : constant := 19;                --  winuser.h:3315
   SM_CYVSCROLL : constant := 20;                --  winuser.h:3316
   SM_CXHSCROLL : constant := 21;                --  winuser.h:3317
   SM_DEBUG : constant := 22;                --  winuser.h:3318
   SM_SWAPBUTTON : constant := 23;                --  winuser.h:3319
   SM_RESERVED1 : constant := 24;                --  winuser.h:3320
   SM_RESERVED2 : constant := 25;                --  winuser.h:3321
   SM_RESERVED3 : constant := 26;                --  winuser.h:3322
   SM_RESERVED4 : constant := 27;                --  winuser.h:3323
   SM_CXMIN : constant := 28;                --  winuser.h:3324
   SM_CYMIN : constant := 29;                --  winuser.h:3325
   SM_CXSIZE : constant := 30;                --  winuser.h:3326
   SM_CYSIZE : constant := 31;                --  winuser.h:3327
   SM_CXFRAME : constant := 32;                --  winuser.h:3328
   SM_CYFRAME : constant := 33;                --  winuser.h:3329
   SM_CXMINTRACK : constant := 34;                --  winuser.h:3330
   SM_CYMINTRACK : constant := 35;                --  winuser.h:3331
   SM_CXDOUBLECLK : constant := 36;                --  winuser.h:3332
   SM_CYDOUBLECLK : constant := 37;                --  winuser.h:3333
   SM_CXICONSPACING : constant := 38;                --  winuser.h:3334
   SM_CYICONSPACING : constant := 39;                --  winuser.h:3335
   SM_MENUDROPALIGNMENT : constant := 40;                --  winuser.h:3336
   SM_PENWINDOWS : constant := 41;                --  winuser.h:3337
   SM_DBCSENABLED : constant := 42;                --  winuser.h:3338
   SM_CMOUSEBUTTONS : constant := 43;                --  winuser.h:3339
   SM_SHOWSOUNDS : constant := 70;                --  winuser.h:3341
   SM_CMETRICS : constant := 71;                --  winuser.h:3343
   TPM_LEFTBUTTON : constant := 16#0#;             --  winuser.h:3659
   TPM_RIGHTBUTTON : constant := 16#2#;             --  winuser.h:3660
   TPM_LEFTALIGN : constant := 16#0#;             --  winuser.h:3661
   TPM_CENTERALIGN : constant := 16#4#;             --  winuser.h:3662
   TPM_RIGHTALIGN : constant := 16#8#;             --  winuser.h:3663
   DT_TOP : constant := 16#0#;             --  winuser.h:3683
   DT_LEFT : constant := 16#0#;             --  winuser.h:3684
   DT_CENTER : constant := 16#1#;             --  winuser.h:3685
   DT_RIGHT : constant := 16#2#;             --  winuser.h:3686
   DT_VCENTER : constant := 16#4#;             --  winuser.h:3687
   DT_BOTTOM : constant := 16#8#;             --  winuser.h:3688
   DT_WORDBREAK : constant := 16#10#;            --  winuser.h:3689
   DT_SINGLELINE : constant := 16#20#;            --  winuser.h:3690
   DT_EXPANDTABS : constant := 16#40#;            --  winuser.h:3691
   DT_TABSTOP : constant := 16#80#;            --  winuser.h:3692
   DT_NOCLIP : constant := 16#100#;           --  winuser.h:3693
   DT_EXTERNALLEADING : constant := 16#200#;           --  winuser.h:3694
   DT_CALCRECT : constant := 16#400#;           --  winuser.h:3695
   DT_NOPREFIX : constant := 16#800#;           --  winuser.h:3696
   DT_INTERNAL : constant := 16#1000#;          --  winuser.h:3697
   DCX_WINDOW : constant := 16#1#;             --  winuser.h:3868
   DCX_CACHE : constant := 16#2#;             --  winuser.h:3869
   DCX_NORESETATTRS : constant := 16#4#;             --  winuser.h:3870
   DCX_CLIPCHILDREN : constant := 16#8#;             --  winuser.h:3871
   DCX_CLIPSIBLINGS : constant := 16#10#;            --  winuser.h:3872
   DCX_PARENTCLIP : constant := 16#20#;            --  winuser.h:3873
   DCX_EXCLUDERGN : constant := 16#40#;            --  winuser.h:3875
   DCX_INTERSECTRGN : constant := 16#80#;            --  winuser.h:3876
   DCX_EXCLUDEUPDATE : constant := 16#100#;           --  winuser.h:3878
   DCX_INTERSECTUPDATE : constant := 16#200#;           --  winuser.h:3879
   DCX_LOCKWINDOWUPDATE : constant := 16#400#;           --  winuser.h:3881
   DCX_VALIDATE : constant := 16#200000#;        --  winuser.h:3883
   RDW_INVALIDATE : constant := 16#1#;             --  winuser.h:3981
   RDW_INTERNALPAINT : constant := 16#2#;             --  winuser.h:3982
   RDW_ERASE : constant := 16#4#;             --  winuser.h:3983
   RDW_VALIDATE : constant := 16#8#;             --  winuser.h:3985
   RDW_NOINTERNALPAINT : constant := 16#10#;            --  winuser.h:3986
   RDW_NOERASE : constant := 16#20#;            --  winuser.h:3987
   RDW_NOCHILDREN : constant := 16#40#;            --  winuser.h:3989
   RDW_ALLCHILDREN : constant := 16#80#;            --  winuser.h:3990
   RDW_UPDATENOW : constant := 16#100#;           --  winuser.h:3992
   RDW_ERASENOW : constant := 16#200#;           --  winuser.h:3993
   RDW_FRAME : constant := 16#400#;           --  winuser.h:3995
   RDW_NOFRAME : constant := 16#800#;           --  winuser.h:3996
   SW_SCROLLCHILDREN : constant := 16#1#;             --  winuser.h:4045
   SW_INVALIDATE : constant := 16#2#;             --  winuser.h:4046
   SW_ERASE : constant := 16#4#;             --  winuser.h:4047
   ESB_ENABLE_BOTH : constant := 16#0#;             --  winuser.h:4109
   ESB_DISABLE_BOTH : constant := 16#3#;             --  winuser.h:4110
   ESB_DISABLE_LEFT : constant := 16#1#;             --  winuser.h:4112
   ESB_DISABLE_RIGHT : constant := 16#2#;             --  winuser.h:4113
   ESB_DISABLE_UP : constant := 16#1#;             --  winuser.h:4115
   ESB_DISABLE_DOWN : constant := 16#2#;             --  winuser.h:4116
   ESB_DISABLE_LTUP : constant := 16#1#;             --  winuser.h:4118
   ESB_DISABLE_RTDN : constant := 16#2#;             --  winuser.h:4119
   MB_OK : constant := 16#0#;             --  winuser.h:4311
   MB_OKCANCEL : constant := 16#1#;             --  winuser.h:4312
   MB_ABORTRETRYIGNORE : constant := 16#2#;             --  winuser.h:4313
   MB_YESNOCANCEL : constant := 16#3#;             --  winuser.h:4314
   MB_YESNO : constant := 16#4#;             --  winuser.h:4315
   MB_RETRYCANCEL : constant := 16#5#;             --  winuser.h:4316
   MB_ICONHAND : constant := 16#10#;            --  winuser.h:4318
   MB_ICONQUESTION : constant := 16#20#;            --  winuser.h:4319
   MB_ICONEXCLAMATION : constant := 16#30#;            --  winuser.h:4320
   MB_ICONASTERISK : constant := 16#40#;            --  winuser.h:4321
   MB_ICONINFORMATION : constant := 16#40#;            --  winuser.h:4323
   MB_ICONSTOP : constant := 16#10#;            --  winuser.h:4324
   MB_DEFBUTTON1 : constant := 16#0#;             --  winuser.h:4326
   MB_DEFBUTTON2 : constant := 16#100#;           --  winuser.h:4327
   MB_DEFBUTTON3 : constant := 16#200#;           --  winuser.h:4328
   MB_APPLMODAL : constant := 16#0#;             --  winuser.h:4330
   MB_SYSTEMMODAL : constant := 16#1000#;          --  winuser.h:4331
   MB_TASKMODAL : constant := 16#2000#;          --  winuser.h:4332
   MB_NOFOCUS : constant := 16#8000#;          --  winuser.h:4334
   MB_SETFOREGROUND : constant := 16#10000#;         --  winuser.h:4335
   MB_DEFAULT_DESKTOP_ONLY : constant := 16#20000#;         --  winuser.h:4336
   MB_SERVICE_NOTIFICATION : constant := 16#40000#;         --  winuser.h:4337
   MB_TYPEMASK : constant := 16#f#;             --  winuser.h:4339
   MB_ICONMASK : constant := 16#f0#;            --  winuser.h:4340
   MB_DEFMASK : constant := 16#f00#;           --  winuser.h:4341
   MB_MODEMASK : constant := 16#3000#;          --  winuser.h:4342
   MB_MISCMASK : constant := 16#c000#;          --  winuser.h:4343
   CTLCOLOR_MSGBOX : constant := 0;                 --  winuser.h:4539
   CTLCOLOR_EDIT : constant := 1;                 --  winuser.h:4540
   CTLCOLOR_LISTBOX : constant := 2;                 --  winuser.h:4541
   CTLCOLOR_BTN : constant := 3;                 --  winuser.h:4542
   CTLCOLOR_DLG : constant := 4;                 --  winuser.h:4543
   CTLCOLOR_SCROLLBAR : constant := 5;                 --  winuser.h:4544
   CTLCOLOR_STATIC : constant := 6;                 --  winuser.h:4545
   CTLCOLOR_MAX : constant := 7;                 --  winuser.h:4546
   COLOR_SCROLLBAR : constant := 0;                 --  winuser.h:4548
   COLOR_BACKGROUND : constant := 1;                 --  winuser.h:4549
   COLOR_ACTIVECAPTION : constant := 2;                 --  winuser.h:4550
   COLOR_INACTIVECAPTION : constant := 3;                 --  winuser.h:4551
   COLOR_MENU : constant := 4;                 --  winuser.h:4552
   COLOR_WINDOW : constant := 5;                 --  winuser.h:4553
   COLOR_WINDOWFRAME : constant := 6;                 --  winuser.h:4554
   COLOR_MENUTEXT : constant := 7;                 --  winuser.h:4555
   COLOR_WINDOWTEXT : constant := 8;                 --  winuser.h:4556
   COLOR_CAPTIONTEXT : constant := 9;                 --  winuser.h:4557
   COLOR_ACTIVEBORDER : constant := 10;                --  winuser.h:4558
   COLOR_INACTIVEBORDER : constant := 11;                --  winuser.h:4559
   COLOR_APPWORKSPACE : constant := 12;                --  winuser.h:4560
   COLOR_HIGHLIGHT : constant := 13;                --  winuser.h:4561
   COLOR_HIGHLIGHTTEXT : constant := 14;                --  winuser.h:4562
   COLOR_BTNFACE : constant := 15;                --  winuser.h:4563
   COLOR_BTNSHADOW : constant := 16;                --  winuser.h:4564
   COLOR_GRAYTEXT : constant := 17;                --  winuser.h:4565
   COLOR_BTNTEXT : constant := 18;                --  winuser.h:4566
   COLOR_INACTIVECAPTIONTEXT : constant := 19;              --  winuser.h:4567
   COLOR_BTNHIGHLIGHT : constant := 20;                --  winuser.h:4568
   GW_HWNDFIRST : constant := 0;                 --  winuser.h:4926
   GW_HWNDLAST : constant := 1;                 --  winuser.h:4927
   GW_HWNDNEXT : constant := 2;                 --  winuser.h:4928
   GW_HWNDPREV : constant := 3;                 --  winuser.h:4929
   GW_OWNER : constant := 4;                 --  winuser.h:4930
   GW_CHILD : constant := 5;                 --  winuser.h:4931
   GW_MAX : constant := 5;                 --  winuser.h:4932
   MF_INSERT : constant := 16#0#;             --  winuser.h:5050
   MF_CHANGE : constant := 16#80#;            --  winuser.h:5051
   MF_APPEND : constant := 16#100#;           --  winuser.h:5052
   MF_DELETE : constant := 16#200#;           --  winuser.h:5053
   MF_REMOVE : constant := 16#1000#;          --  winuser.h:5054
   MF_BYCOMMAND : constant := 16#0#;             --  winuser.h:5056
   MF_BYPOSITION : constant := 16#400#;           --  winuser.h:5057
   MF_SEPARATOR : constant := 16#800#;           --  winuser.h:5059
   MF_ENABLED : constant := 16#0#;             --  winuser.h:5061
   MF_GRAYED : constant := 16#1#;             --  winuser.h:5062
   MF_DISABLED : constant := 16#2#;             --  winuser.h:5063
   MF_UNCHECKED : constant := 16#0#;             --  winuser.h:5065
   MF_CHECKED : constant := 16#8#;             --  winuser.h:5066
   MF_USECHECKBITMAPS : constant := 16#200#;           --  winuser.h:5067
   MF_STRING : constant := 16#0#;             --  winuser.h:5069
   MF_BITMAP : constant := 16#4#;             --  winuser.h:5070
   MF_OWNERDRAW : constant := 16#100#;           --  winuser.h:5071
   MF_POPUP : constant := 16#10#;            --  winuser.h:5073
   MF_MENUBARBREAK : constant := 16#20#;            --  winuser.h:5074
   MF_MENUBREAK : constant := 16#40#;            --  winuser.h:5075
   MF_UNHILITE : constant := 16#0#;             --  winuser.h:5077
   MF_HILITE : constant := 16#80#;            --  winuser.h:5078
   MF_SYSMENU : constant := 16#2000#;          --  winuser.h:5080
   MF_HELP : constant := 16#4000#;          --  winuser.h:5081
   MF_MOUSESELECT : constant := 16#8000#;          --  winuser.h:5082
   MF_END : constant := 16#80#;            --  winuser.h:5115
   SC_SIZE : constant := 16#f000#;          --  winuser.h:5124
   SC_MOVE : constant := 16#f010#;          --  winuser.h:5125
   SC_MINIMIZE : constant := 16#f020#;          --  winuser.h:5126
   SC_MAXIMIZE : constant := 16#f030#;          --  winuser.h:5127
   SC_NEXTWINDOW : constant := 16#f040#;          --  winuser.h:5128
   SC_PREVWINDOW : constant := 16#f050#;          --  winuser.h:5129
   SC_CLOSE : constant := 16#f060#;          --  winuser.h:5130
   SC_VSCROLL : constant := 16#f070#;          --  winuser.h:5131
   SC_HSCROLL : constant := 16#f080#;          --  winuser.h:5132
   SC_MOUSEMENU : constant := 16#f090#;          --  winuser.h:5133
   SC_KEYMENU : constant := 16#f100#;          --  winuser.h:5134
   SC_ARRANGE : constant := 16#f110#;          --  winuser.h:5135
   SC_RESTORE : constant := 16#f120#;          --  winuser.h:5136
   SC_TASKLIST : constant := 16#f130#;          --  winuser.h:5137
   SC_SCREENSAVE : constant := 16#f140#;          --  winuser.h:5138
   SC_HOTKEY : constant := 16#f150#;          --  winuser.h:5139
   SC_ICON : constant := 16#f020#;          --  winuser.h:5144
   SC_ZOOM : constant := 16#f030#;          --  winuser.h:5145
   IDC_ARROW : constant LPSTR;                --  winuser.h:5213
   IDC_IBEAM : constant LPSTR;                --  winuser.h:5214
   IDC_WAIT : constant LPSTR;                --  winuser.h:5215
   IDC_CROSS : constant LPSTR;                --  winuser.h:5216
   IDC_UPARROW : constant LPSTR;                --  winuser.h:5217
   IDC_SIZE : constant LPSTR;                --  winuser.h:5218
   IDC_ICON : constant LPSTR;                --  winuser.h:5219
   IDC_SIZENWSE : constant LPSTR;                --  winuser.h:5220
   IDC_SIZENESW : constant LPSTR;                --  winuser.h:5221
   IDC_SIZEWE : constant LPSTR;                --  winuser.h:5222
   IDC_SIZENS : constant LPSTR;                --  winuser.h:5223

   --  the following are not in win3.1
   IDC_SIZEALL : constant LPSTR;                --  winuser.h:5224
   IDC_NO : constant LPSTR;                --  winuser.h:5225
   IDC_APPSTARTING : constant LPSTR;                --  winuser.h:5226
   ORD_LANGDRIVER : constant := 1;                 --  winuser.h:5378
   IDI_APPLICATION : constant LPSTR;                --  winuser.h:5394
   IDI_HAND : constant LPSTR;                --  winuser.h:5395
   IDI_QUESTION : constant LPSTR;                --  winuser.h:5396
   IDI_EXCLAMATION : constant LPSTR;                --  winuser.h:5397
   IDI_ASTERISK : constant LPSTR;                --  winuser.h:5398

   IDOK : constant := 1;                 --  winuser.h:5428
   IDCANCEL : constant := 2;                 --  winuser.h:5429
   IDABORT : constant := 3;                 --  winuser.h:5430
   IDRETRY : constant := 4;                 --  winuser.h:5431
   IDIGNORE : constant := 5;                 --  winuser.h:5432
   IDYES : constant := 6;                 --  winuser.h:5433
   IDNO : constant := 7;                 --  winuser.h:5434
   ES_LEFT : constant := 16#0#;             --  winuser.h:5447
   ES_CENTER : constant := 16#1#;             --  winuser.h:5448
   ES_RIGHT : constant := 16#2#;             --  winuser.h:5449
   ES_MULTILINE : constant := 16#4#;             --  winuser.h:5450
   ES_UPPERCASE : constant := 16#8#;             --  winuser.h:5451
   ES_LOWERCASE : constant := 16#10#;            --  winuser.h:5452
   ES_PASSWORD : constant := 16#20#;            --  winuser.h:5453
   ES_AUTOVSCROLL : constant := 16#40#;            --  winuser.h:5454
   ES_AUTOHSCROLL : constant := 16#80#;            --  winuser.h:5455
   ES_NOHIDESEL : constant := 16#100#;           --  winuser.h:5456
   ES_OEMCONVERT : constant := 16#400#;           --  winuser.h:5457
   ES_READONLY : constant := 16#800#;           --  winuser.h:5458
   ES_WANTRETURN : constant := 16#1000#;          --  winuser.h:5459
   EN_SETFOCUS : constant := 16#100#;           --  winuser.h:5467
   EN_KILLFOCUS : constant := 16#200#;           --  winuser.h:5468
   EN_CHANGE : constant := 16#300#;           --  winuser.h:5469
   EN_UPDATE : constant := 16#400#;           --  winuser.h:5470
   EN_ERRSPACE : constant := 16#500#;           --  winuser.h:5471
   EN_MAXTEXT : constant := 16#501#;           --  winuser.h:5472
   EN_HSCROLL : constant := 16#601#;           --  winuser.h:5473
   EN_VSCROLL : constant := 16#602#;           --  winuser.h:5474
   EM_GETSEL : constant := 16#b0#;            --  winuser.h:5482
   EM_SETSEL : constant := 16#b1#;            --  winuser.h:5483
   EM_GETRECT : constant := 16#b2#;            --  winuser.h:5484
   EM_SETRECT : constant := 16#b3#;            --  winuser.h:5485
   EM_SETRECTNP : constant := 16#b4#;            --  winuser.h:5486
   EM_SCROLL : constant := 16#b5#;            --  winuser.h:5487
   EM_LINESCROLL : constant := 16#b6#;            --  winuser.h:5488
   EM_SCROLLCARET : constant := 16#b7#;            --  winuser.h:5489
   EM_GETMODIFY : constant := 16#b8#;            --  winuser.h:5490
   EM_SETMODIFY : constant := 16#b9#;            --  winuser.h:5491
   EM_GETLINECOUNT : constant := 16#ba#;            --  winuser.h:5492
   EM_LINEINDEX : constant := 16#bb#;            --  winuser.h:5493
   EM_SETHANDLE : constant := 16#bc#;            --  winuser.h:5494
   EM_GETHANDLE : constant := 16#bd#;            --  winuser.h:5495
   EM_GETTHUMB : constant := 16#be#;            --  winuser.h:5496
   EM_LINELENGTH : constant := 16#c1#;            --  winuser.h:5497
   EM_REPLACESEL : constant := 16#c2#;            --  winuser.h:5498
   EM_GETLINE : constant := 16#c4#;            --  winuser.h:5499
   EM_LIMITTEXT : constant := 16#c5#;            --  winuser.h:5500
   EM_CANUNDO : constant := 16#c6#;            --  winuser.h:5501
   EM_UNDO : constant := 16#c7#;            --  winuser.h:5502
   EM_FMTLINES : constant := 16#c8#;            --  winuser.h:5503
   EM_LINEFROMCHAR : constant := 16#c9#;            --  winuser.h:5504
   EM_SETTABSTOPS : constant := 16#cb#;            --  winuser.h:5505
   EM_SETPASSWORDCHAR : constant := 16#cc#;            --  winuser.h:5506
   EM_EMPTYUNDOBUFFER : constant := 16#cd#;            --  winuser.h:5507
   EM_GETFIRSTVISIBLELINE : constant := 16#ce#;            --  winuser.h:5508
   EM_SETREADONLY : constant := 16#cf#;            --  winuser.h:5509
   EM_SETWORDBREAKPROC : constant := 16#d0#;            --  winuser.h:5510
   EM_GETWORDBREAKPROC : constant := 16#d1#;            --  winuser.h:5511
   EM_GETPASSWORDCHAR : constant := 16#d2#;            --  winuser.h:5512
   WB_LEFT : constant := 0;                 --  winuser.h:5520
   WB_RIGHT : constant := 1;                 --  winuser.h:5521
   WB_ISDELIMITER : constant := 2;                 --  winuser.h:5522
   BS_PUSHBUTTON : constant := 16#0#;             --  winuser.h:5527
   BS_DEFPUSHBUTTON : constant := 16#1#;             --  winuser.h:5528
   BS_CHECKBOX : constant := 16#2#;             --  winuser.h:5529
   BS_AUTOCHECKBOX : constant := 16#3#;             --  winuser.h:5530
   BS_RADIOBUTTON : constant := 16#4#;             --  winuser.h:5531
   BS_3STATE : constant := 16#5#;             --  winuser.h:5532
   BS_AUTO3STATE : constant := 16#6#;             --  winuser.h:5533
   BS_GROUPBOX : constant := 16#7#;             --  winuser.h:5534
   BS_USERBUTTON : constant := 16#8#;             --  winuser.h:5535
   BS_AUTORADIOBUTTON : constant := 16#9#;             --  winuser.h:5536
   BS_OWNERDRAW : constant := 16#b#;             --  winuser.h:5537
   BS_LEFTTEXT : constant := 16#20#;            --  winuser.h:5538
   BN_CLICKED : constant := 0;                 --  winuser.h:5544
   BN_PAINT : constant := 1;                 --  winuser.h:5545
   BN_HILITE : constant := 2;                 --  winuser.h:5546
   BN_UNHILITE : constant := 3;                 --  winuser.h:5547
   BN_DISABLE : constant := 4;                 --  winuser.h:5548
   BN_DOUBLECLICKED : constant := 5;                 --  winuser.h:5549
   BM_GETCHECK : constant := 16#f0#;            --  winuser.h:5554
   BM_SETCHECK : constant := 16#f1#;            --  winuser.h:5555
   BM_GETSTATE : constant := 16#f2#;            --  winuser.h:5556
   BM_SETSTATE : constant := 16#f3#;            --  winuser.h:5557
   BM_SETSTYLE : constant := 16#f4#;            --  winuser.h:5558
   SS_LEFT : constant := 16#0#;             --  winuser.h:5563
   SS_CENTER : constant := 16#1#;             --  winuser.h:5564
   SS_RIGHT : constant := 16#2#;             --  winuser.h:5565
   SS_ICON : constant := 16#3#;             --  winuser.h:5566
   SS_BLACKRECT : constant := 16#4#;             --  winuser.h:5567
   SS_GRAYRECT : constant := 16#5#;             --  winuser.h:5568
   SS_WHITERECT : constant := 16#6#;             --  winuser.h:5569
   SS_BLACKFRAME : constant := 16#7#;             --  winuser.h:5570
   SS_GRAYFRAME : constant := 16#8#;             --  winuser.h:5571
   SS_WHITEFRAME : constant := 16#9#;             --  winuser.h:5572
   SS_USERITEM : constant := 16#a#;             --  winuser.h:5573
   SS_SIMPLE : constant := 16#b#;             --  winuser.h:5574
   SS_LEFTNOWORDWRAP : constant := 16#c#;             --  winuser.h:5575
   SS_NOPREFIX : constant := 16#80#;            --  winuser.h:5576
   STM_SETICON : constant := 16#170#;           --  winuser.h:5582
   STM_GETICON : constant := 16#171#;           --  winuser.h:5583
   STM_MSGMAX : constant := 16#172#;           --  winuser.h:5584
   WC_DIALOG : constant Win32.Winnt.LPTSTR :=
     Win32.Winbase.MAKEINTATOM (16#8002#);
   --  winuser.h:5591
   DWL_MSGRESULT : constant := 0;                 --  winuser.h:5596
   DWL_DLGPROC : constant := 4;                 --  winuser.h:5597
   DWL_USER : constant := 8;                 --  winuser.h:5598
   DDL_READWRITE : constant := 16#0#;             --  winuser.h:5660
   DDL_READONLY : constant := 16#1#;             --  winuser.h:5661
   DDL_HIDDEN : constant := 16#2#;             --  winuser.h:5662
   DDL_SYSTEM : constant := 16#4#;             --  winuser.h:5663
   DDL_DIRECTORY : constant := 16#10#;            --  winuser.h:5664
   DDL_ARCHIVE : constant := 16#20#;            --  winuser.h:5665
   DDL_POSTMSGS : constant := 16#2000#;          --  winuser.h:5667
   DDL_DRIVES : constant := 16#4000#;          --  winuser.h:5668
   DDL_EXCLUSIVE : constant := 16#8000#;          --  winuser.h:5669
   DS_ABSALIGN : constant := 16#1#;             --  winuser.h:5744
   DS_SYSMODAL : constant := 16#2#;             --  winuser.h:5745
   DS_LOCALEDIT : constant := 16#20#;            --  winuser.h:5746
   DS_SETFONT : constant := 16#40#;            --  winuser.h:5747
   DS_MODALFRAME : constant := 16#80#;            --  winuser.h:5748
   DS_NOIDLEMSG : constant := 16#100#;           --  winuser.h:5749
   DS_SETFOREGROUND : constant := 16#200#;           --  winuser.h:5750
   DM_GETDEFID : constant := 16#400#;           --  winuser.h:5755
   DM_SETDEFID : constant := 16#401#;           --  winuser.h:5756
   DC_HASDEFID : constant := 16#534b#;          --  winuser.h:5761
   DLGC_WANTARROWS : constant := 16#1#;             --  winuser.h:5766
   DLGC_WANTTAB : constant := 16#2#;             --  winuser.h:5767
   DLGC_WANTALLKEYS : constant := 16#4#;             --  winuser.h:5768
   DLGC_WANTMESSAGE : constant := 16#4#;             --  winuser.h:5769
   DLGC_HASSETSEL : constant := 16#8#;             --  winuser.h:5770
   DLGC_DEFPUSHBUTTON : constant := 16#10#;            --  winuser.h:5771
   DLGC_UNDEFPUSHBUTTON : constant := 16#20#;            --  winuser.h:5772
   DLGC_RADIOBUTTON : constant := 16#40#;            --  winuser.h:5773
   DLGC_WANTCHARS : constant := 16#80#;            --  winuser.h:5774
   DLGC_STATIC : constant := 16#100#;           --  winuser.h:5775
   DLGC_BUTTON : constant := 16#2000#;          --  winuser.h:5776
   LB_CTLCODE : constant := 0;                 --  winuser.h:5778
   LB_OKAY : constant := 0;                 --  winuser.h:5783
   LB_ERR : constant := -1;                --  winuser.h:5784
   LB_ERRSPACE : constant := -2;                --  winuser.h:5785
   LBN_ERRSPACE : constant := -2;                --  winuser.h:5798
   LBN_SELCHANGE : constant := 1;                 --  winuser.h:5799
   LBN_DBLCLK : constant := 2;                 --  winuser.h:5800
   LBN_SELCANCEL : constant := 3;                 --  winuser.h:5801
   LBN_SETFOCUS : constant := 4;                 --  winuser.h:5802
   LBN_KILLFOCUS : constant := 5;                 --  winuser.h:5803
   LB_ADDSTRING : constant := 16#180#;           --  winuser.h:5812
   LB_INSERTSTRING : constant := 16#181#;           --  winuser.h:5813
   LB_DELETESTRING : constant := 16#182#;           --  winuser.h:5814
   LB_SELITEMRANGEEX : constant := 16#183#;           --  winuser.h:5815
   LB_RESETCONTENT : constant := 16#184#;           --  winuser.h:5816
   LB_SETSEL : constant := 16#185#;           --  winuser.h:5817
   LB_SETCURSEL : constant := 16#186#;           --  winuser.h:5818
   LB_GETSEL : constant := 16#187#;           --  winuser.h:5819
   LB_GETCURSEL : constant := 16#188#;           --  winuser.h:5820
   LB_GETTEXT : constant := 16#189#;           --  winuser.h:5821
   LB_GETTEXTLEN : constant := 16#18a#;           --  winuser.h:5822
   LB_GETCOUNT : constant := 16#18b#;           --  winuser.h:5823
   LB_SELECTSTRING : constant := 16#18c#;           --  winuser.h:5824
   LB_DIR : constant := 16#18d#;           --  winuser.h:5825
   LB_GETTOPINDEX : constant := 16#18e#;           --  winuser.h:5826
   LB_FINDSTRING : constant := 16#18f#;           --  winuser.h:5827
   LB_GETSELCOUNT : constant := 16#190#;           --  winuser.h:5828
   LB_GETSELITEMS : constant := 16#191#;           --  winuser.h:5829
   LB_SETTABSTOPS : constant := 16#192#;           --  winuser.h:5830
   LB_GETHORIZONTALEXTENT : constant := 16#193#;           --  winuser.h:5831
   LB_SETHORIZONTALEXTENT : constant := 16#194#;           --  winuser.h:5832
   LB_SETCOLUMNWIDTH : constant := 16#195#;           --  winuser.h:5833
   LB_ADDFILE : constant := 16#196#;           --  winuser.h:5834
   LB_SETTOPINDEX : constant := 16#197#;           --  winuser.h:5835
   LB_GETITEMRECT : constant := 16#198#;           --  winuser.h:5836
   LB_GETITEMDATA : constant := 16#199#;           --  winuser.h:5837
   LB_SETITEMDATA : constant := 16#19a#;           --  winuser.h:5838
   LB_SELITEMRANGE : constant := 16#19b#;           --  winuser.h:5839
   LB_SETANCHORINDEX : constant := 16#19c#;           --  winuser.h:5840
   LB_GETANCHORINDEX : constant := 16#19d#;           --  winuser.h:5841
   LB_SETCARETINDEX : constant := 16#19e#;           --  winuser.h:5842
   LB_GETCARETINDEX : constant := 16#19f#;           --  winuser.h:5843
   LB_SETITEMHEIGHT : constant := 16#1a0#;           --  winuser.h:5844
   LB_GETITEMHEIGHT : constant := 16#1a1#;           --  winuser.h:5845
   LB_FINDSTRINGEXACT : constant := 16#1a2#;           --  winuser.h:5846
   LB_SETLOCALE : constant := 16#1a5#;           --  winuser.h:5847
   LB_GETLOCALE : constant := 16#1a6#;           --  winuser.h:5848
   LB_SETCOUNT : constant := 16#1a7#;           --  winuser.h:5849
   LB_MSGMAX : constant := 16#1a8#;           --  winuser.h:5851
   LBS_NOTIFY : constant := 16#1#;             --  winuser.h:5860
   LBS_SORT : constant := 16#2#;             --  winuser.h:5861
   LBS_NOREDRAW : constant := 16#4#;             --  winuser.h:5862
   LBS_MULTIPLESEL : constant := 16#8#;             --  winuser.h:5863
   LBS_OWNERDRAWFIXED : constant := 16#10#;            --  winuser.h:5864
   LBS_OWNERDRAWVARIABLE : constant := 16#20#;            --  winuser.h:5865
   LBS_HASSTRINGS : constant := 16#40#;            --  winuser.h:5866
   LBS_USETABSTOPS : constant := 16#80#;            --  winuser.h:5867
   LBS_NOINTEGRALHEIGHT : constant := 16#100#;           --  winuser.h:5868
   LBS_MULTICOLUMN : constant := 16#200#;           --  winuser.h:5869
   LBS_WANTKEYBOARDINPUT : constant := 16#400#;           --  winuser.h:5870
   LBS_EXTENDEDSEL : constant := 16#800#;           --  winuser.h:5871
   LBS_DISABLENOSCROLL : constant := 16#1000#;          --  winuser.h:5872
   LBS_NODATA : constant := 16#2000#;          --  winuser.h:5873
   LBS_STANDARD : constant := 16#a00003#;        --  winuser.h:5874
   CB_OKAY : constant := 0;                 --  winuser.h:5882
   CB_ERR : constant := -1;                --  winuser.h:5883
   CB_ERRSPACE : constant := -2;                --  winuser.h:5884
   CBN_ERRSPACE : constant := -1;                --  winuser.h:5890
   CBN_SELCHANGE : constant := 1;                 --  winuser.h:5891
   CBN_DBLCLK : constant := 2;                 --  winuser.h:5892
   CBN_SETFOCUS : constant := 3;                 --  winuser.h:5893
   CBN_KILLFOCUS : constant := 4;                 --  winuser.h:5894
   CBN_EDITCHANGE : constant := 5;                 --  winuser.h:5895
   CBN_EDITUPDATE : constant := 6;                 --  winuser.h:5896
   CBN_DROPDOWN : constant := 7;                 --  winuser.h:5897
   CBN_CLOSEUP : constant := 8;                 --  winuser.h:5898
   CBN_SELENDOK : constant := 9;                 --  winuser.h:5899
   CBN_SELENDCANCEL : constant := 10;                --  winuser.h:5900
   CBS_SIMPLE : constant := 16#1#;             --  winuser.h:5906
   CBS_DROPDOWN : constant := 16#2#;             --  winuser.h:5907
   CBS_DROPDOWNLIST : constant := 16#3#;             --  winuser.h:5908
   CBS_OWNERDRAWFIXED : constant := 16#10#;            --  winuser.h:5909
   CBS_OWNERDRAWVARIABLE : constant := 16#20#;            --  winuser.h:5910
   CBS_AUTOHSCROLL : constant := 16#40#;            --  winuser.h:5911
   CBS_OEMCONVERT : constant := 16#80#;            --  winuser.h:5912
   CBS_SORT : constant := 16#100#;           --  winuser.h:5913
   CBS_HASSTRINGS : constant := 16#200#;           --  winuser.h:5914
   CBS_NOINTEGRALHEIGHT : constant := 16#400#;           --  winuser.h:5915
   CBS_DISABLENOSCROLL : constant := 16#800#;           --  winuser.h:5916
   CB_GETEDITSEL : constant := 16#140#;           --  winuser.h:5924
   CB_LIMITTEXT : constant := 16#141#;           --  winuser.h:5925
   CB_SETEDITSEL : constant := 16#142#;           --  winuser.h:5926
   CB_ADDSTRING : constant := 16#143#;           --  winuser.h:5927
   CB_DELETESTRING : constant := 16#144#;           --  winuser.h:5928
   CB_DIR : constant := 16#145#;           --  winuser.h:5929
   CB_GETCOUNT : constant := 16#146#;           --  winuser.h:5930
   CB_GETCURSEL : constant := 16#147#;           --  winuser.h:5931
   CB_GETLBTEXT : constant := 16#148#;           --  winuser.h:5932
   CB_GETLBTEXTLEN : constant := 16#149#;           --  winuser.h:5933
   CB_INSERTSTRING : constant := 16#14a#;           --  winuser.h:5934
   CB_RESETCONTENT : constant := 16#14b#;           --  winuser.h:5935
   CB_FINDSTRING : constant := 16#14c#;           --  winuser.h:5936
   CB_SELECTSTRING : constant := 16#14d#;           --  winuser.h:5937
   CB_SETCURSEL : constant := 16#14e#;           --  winuser.h:5938
   CB_SHOWDROPDOWN : constant := 16#14f#;           --  winuser.h:5939
   CB_GETITEMDATA : constant := 16#150#;           --  winuser.h:5940
   CB_SETITEMDATA : constant := 16#151#;           --  winuser.h:5941
   CB_GETDROPPEDCONTROLRECT : constant := 16#152#;          --  winuser.h:5942
   CB_SETITEMHEIGHT : constant := 16#153#;           --  winuser.h:5943
   CB_GETITEMHEIGHT : constant := 16#154#;           --  winuser.h:5944
   CB_SETEXTENDEDUI : constant := 16#155#;           --  winuser.h:5945
   CB_GETEXTENDEDUI : constant := 16#156#;           --  winuser.h:5946
   CB_GETDROPPEDSTATE : constant := 16#157#;           --  winuser.h:5947
   CB_FINDSTRINGEXACT : constant := 16#158#;           --  winuser.h:5948
   CB_SETLOCALE : constant := 16#159#;           --  winuser.h:5949
   CB_GETLOCALE : constant := 16#15a#;           --  winuser.h:5950
   CB_MSGMAX : constant := 16#15b#;           --  winuser.h:5951
   SBS_HORZ : constant := 16#0#;             --  winuser.h:5961
   SBS_VERT : constant := 16#1#;             --  winuser.h:5962
   SBS_TOPALIGN : constant := 16#2#;             --  winuser.h:5963
   SBS_LEFTALIGN : constant := 16#2#;             --  winuser.h:5964
   SBS_BOTTOMALIGN : constant := 16#4#;             --  winuser.h:5965
   SBS_RIGHTALIGN : constant := 16#4#;             --  winuser.h:5966
   SBS_SIZEBOXTOPLEFTALIGN : constant := 16#2#;             --  winuser.h:5967
   SBS_SIZEBOXBOTTOMRIGHTALIGN : constant := 16#4#;         --  winuser.h:5968
   SBS_SIZEBOX : constant := 16#8#;             --  winuser.h:5969
   SBM_SETPOS : constant := 16#e0#;            --  winuser.h:5976
   SBM_GETPOS : constant := 16#e1#;            --  winuser.h:5977
   SBM_SETRANGE : constant := 16#e2#;            --  winuser.h:5978
   SBM_SETRANGEREDRAW : constant := 16#e6#;            --  winuser.h:5979
   SBM_GETRANGE : constant := 16#e3#;            --  winuser.h:5980
   SBM_ENABLE_ARROWS : constant := 16#e4#;            --  winuser.h:5981
   MDIS_ALLCHILDSTYLES : constant := 16#1#;             --  winuser.h:5990
   MDITILE_VERTICAL : constant := 16#0#;             --  winuser.h:5995
   MDITILE_HORIZONTAL : constant := 16#1#;             --  winuser.h:5996
   MDITILE_SKIPDISABLED : constant := 16#2#;             --  winuser.h:5997
   HELP_CONTEXT : constant := 16#1#;             --  winuser.h:6193
   HELP_QUIT : constant := 16#2#;             --  winuser.h:6194
   HELP_INDEX : constant := 16#3#;             --  winuser.h:6195
   HELP_CONTENTS : constant := 16#3#;             --  winuser.h:6196
   HELP_HELPONHELP : constant := 16#4#;             --  winuser.h:6197
   HELP_SETINDEX : constant := 16#5#;             --  winuser.h:6198
   HELP_SETCONTENTS : constant := 16#5#;             --  winuser.h:6199
   HELP_CONTEXTPOPUP : constant := 16#8#;             --  winuser.h:6200
   HELP_FORCEFILE : constant := 16#9#;             --  winuser.h:6201
   HELP_KEY : constant := 16#101#;           --  winuser.h:6202
   HELP_COMMAND : constant := 16#102#;           --  winuser.h:6203
   HELP_PARTIALKEY : constant := 16#105#;           --  winuser.h:6204
   HELP_MULTIKEY : constant := 16#201#;           --  winuser.h:6205
   HELP_SETWINPOS : constant := 16#203#;           --  winuser.h:6206
   SPI_GETBEEP : constant := 1;                 --  winuser.h:6243
   SPI_SETBEEP : constant := 2;                 --  winuser.h:6244
   SPI_GETMOUSE : constant := 3;                 --  winuser.h:6245
   SPI_SETMOUSE : constant := 4;                 --  winuser.h:6246
   SPI_GETBORDER : constant := 5;                 --  winuser.h:6247
   SPI_SETBORDER : constant := 6;                 --  winuser.h:6248
   SPI_GETKEYBOARDSPEED : constant := 10;                --  winuser.h:6249
   SPI_SETKEYBOARDSPEED : constant := 11;                --  winuser.h:6250
   SPI_LANGDRIVER : constant := 12;                --  winuser.h:6251
   SPI_ICONHORIZONTALSPACING : constant := 13;              --  winuser.h:6252
   SPI_GETSCREENSAVETIMEOUT : constant := 14;               --  winuser.h:6253
   SPI_SETSCREENSAVETIMEOUT : constant := 15;               --  winuser.h:6254
   SPI_GETSCREENSAVEACTIVE : constant := 16;                --  winuser.h:6255
   SPI_SETSCREENSAVEACTIVE : constant := 17;                --  winuser.h:6256
   SPI_GETGRIDGRANULARITY : constant := 18;                --  winuser.h:6257
   SPI_SETGRIDGRANULARITY : constant := 19;                --  winuser.h:6258
   SPI_SETDESKWALLPAPER : constant := 20;                --  winuser.h:6259
   SPI_SETDESKPATTERN : constant := 21;                --  winuser.h:6260
   SPI_GETKEYBOARDDELAY : constant := 22;                --  winuser.h:6261
   SPI_SETKEYBOARDDELAY : constant := 23;                --  winuser.h:6262
   SPI_ICONVERTICALSPACING : constant := 24;                --  winuser.h:6263
   SPI_GETICONTITLEWRAP : constant := 25;                --  winuser.h:6264
   SPI_SETICONTITLEWRAP : constant := 26;                --  winuser.h:6265
   SPI_GETMENUDROPALIGNMENT : constant := 27;               --  winuser.h:6266
   SPI_SETMENUDROPALIGNMENT : constant := 28;               --  winuser.h:6267
   SPI_SETDOUBLECLKWIDTH : constant := 29;                --  winuser.h:6268
   SPI_SETDOUBLECLKHEIGHT : constant := 30;                --  winuser.h:6269
   SPI_GETICONTITLELOGFONT : constant := 31;                --  winuser.h:6270
   SPI_SETDOUBLECLICKTIME : constant := 32;                --  winuser.h:6271
   SPI_SETMOUSEBUTTONSWAP : constant := 33;                --  winuser.h:6272
   SPI_SETICONTITLELOGFONT : constant := 34;                --  winuser.h:6273
   SPI_GETFASTTASKSWITCH : constant := 35;                --  winuser.h:6274
   SPI_SETFASTTASKSWITCH : constant := 36;                --  winuser.h:6275
   SPI_GETFILTERKEYS : constant := 50;                --  winuser.h:6276
   SPI_SETFILTERKEYS : constant := 51;                --  winuser.h:6277
   SPI_GETTOGGLEKEYS : constant := 52;                --  winuser.h:6278
   SPI_SETTOGGLEKEYS : constant := 53;                --  winuser.h:6279
   SPI_GETMOUSEKEYS : constant := 54;                --  winuser.h:6280
   SPI_SETMOUSEKEYS : constant := 55;                --  winuser.h:6281
   SPI_GETSHOWSOUNDS : constant := 56;                --  winuser.h:6282
   SPI_SETSHOWSOUNDS : constant := 57;                --  winuser.h:6283
   SPI_GETSTICKYKEYS : constant := 58;                --  winuser.h:6284
   SPI_SETSTICKYKEYS : constant := 59;                --  winuser.h:6285
   SPI_GETACCESSTIMEOUT : constant := 60;                --  winuser.h:6286
   SPI_SETACCESSTIMEOUT : constant := 61;                --  winuser.h:6287
   SPI_GETSOUNDSENTRY : constant := 64;                --  winuser.h:6288
   SPI_SETSOUNDSENTRY : constant := 65;                --  winuser.h:6289
   SPIF_UPDATEINIFILE : constant := 16#1#;             --  winuser.h:6294
   SPIF_SENDWININICHANGE : constant := 16#2#;             --  winuser.h:6295
   SPIF_SENDCHANGE : constant := 16#2#;             --  winuser.h:6296
   SSWF_NONE : constant := 0;                 --  winuser.h:6300
   SSWF_TITLE : constant := 1;                 --  winuser.h:6301
   SSWF_WINDOW : constant := 2;                 --  winuser.h:6302
   SSWF_DISPLAY : constant := 3;                 --  winuser.h:6303
   SSWF_CUSTOM : constant := 4;                 --  winuser.h:6304
   SSGF_NONE : constant := 0;                 --  winuser.h:6307
   SSGF_DISPLAY : constant := 3;                 --  winuser.h:6308
   SSTF_NONE : constant := 0;                 --  winuser.h:6311
   SSTF_CHARS : constant := 1;                 --  winuser.h:6312
   SSTF_BORDER : constant := 2;                 --  winuser.h:6313
   SSTF_DISPLAY : constant := 3;                 --  winuser.h:6314
   FKF_FILTERKEYSON : constant := 16#1#;             --  winuser.h:6359
   FKF_AVAILABLE : constant := 16#2#;             --  winuser.h:6360
   FKF_HOTKEYACTIVE : constant := 16#4#;             --  winuser.h:6361
   FKF_CONFIRMHOTKEY : constant := 16#8#;             --  winuser.h:6362
   FKF_HOTKEYSOUND : constant := 16#10#;            --  winuser.h:6363
   FKF_INDICATOR : constant := 16#20#;            --  winuser.h:6364
   FKF_CLICKON : constant := 16#40#;            --  winuser.h:6365
   SKF_STICKYKEYSON : constant := 16#1#;             --  winuser.h:6376
   SKF_AVAILABLE : constant := 16#2#;             --  winuser.h:6377
   SKF_HOTKEYACTIVE : constant := 16#4#;             --  winuser.h:6378
   SKF_CONFIRMHOTKEY : constant := 16#8#;             --  winuser.h:6379
   SKF_HOTKEYSOUND : constant := 16#10#;            --  winuser.h:6380
   SKF_INDICATOR : constant := 16#20#;            --  winuser.h:6381
   SKF_AUDIBLEFEEDBACK : constant := 16#40#;            --  winuser.h:6382
   SKF_TRISTATE : constant := 16#80#;            --  winuser.h:6383
   SKF_TWOKEYSOFF : constant := 16#100#;           --  winuser.h:6384
   MKF_MOUSEKEYSON : constant := 16#1#;             --  winuser.h:6400
   MKF_AVAILABLE : constant := 16#2#;             --  winuser.h:6401
   MKF_HOTKEYACTIVE : constant := 16#4#;             --  winuser.h:6402
   MKF_CONFIRMHOTKEY : constant := 16#8#;             --  winuser.h:6403
   MKF_HOTKEYSOUND : constant := 16#10#;            --  winuser.h:6404
   MKF_INDICATOR : constant := 16#20#;            --  winuser.h:6405
   MKF_MODIFIERS : constant := 16#40#;            --  winuser.h:6406
   MKF_REPLACENUMBERS : constant := 16#80#;            --  winuser.h:6407
   ATF_TIMEOUTON : constant := 16#1#;             --  winuser.h:6419
   ATF_ONOFFFEEDBACK : constant := 16#2#;             --  winuser.h:6420
--  SSWF_NONE           : constant := 0; -- winuser.h:6425
--  SSWF_TITLE          : constant := 1; -- winuser.h:6426
--  SSWF_WINDOW         : constant := 2; -- winuser.h:6427
--  SSWF_DISPLAY        : constant := 3; -- winuser.h:6428
--  SSWF_CUSTOM         : constant := 4; -- winuser.h:6429
   SSF_SOUNDSENTRYON : constant := 16#1#;             --  winuser.h:6472
   SSF_AVAILABLE : constant := 16#2#;             --  winuser.h:6473
   SSF_INDICATOR : constant := 16#4#;             --  winuser.h:6474
   TKF_TOGGLEKEYSON : constant := 16#1#;             --  winuser.h:6485
   TKF_AVAILABLE : constant := 16#2#;             --  winuser.h:6486
   TKF_HOTKEYACTIVE : constant := 16#4#;             --  winuser.h:6487
   TKF_CONFIRMHOTKEY : constant := 16#8#;             --  winuser.h:6488
   TKF_HOTKEYSOUND : constant := 16#10#;            --  winuser.h:6489
   TKF_INDICATOR : constant := 16#20#;            --  winuser.h:6490
   SLE_ERROR : constant := 16#1#;             --  winuser.h:6511
   SLE_MINORERROR : constant := 16#2#;             --  winuser.h:6512
   SLE_WARNING : constant := 16#3#;             --  winuser.h:6513

   type MENUTEMPLATEA is new Win32.VOID;                   --  winuser.h:36
   type MENUTEMPLATEW is new Win32.VOID;                   --  winuser.h:37
   subtype MENUTEMPLATE is MENUTEMPLATEA;                  --  winuser.h:41
   type HELPPOLY is new Win32.DWORD;                       --  winuser.h:6141

   subtype HDWP is Win32.Winnt.HANDLE;                    --  winuser.h:35
   type LPMENUTEMPLATEA is access all MENUTEMPLATEA;       --  winuser.h:43
   type LPMENUTEMPLATEW is access all MENUTEMPLATEW;       --  winuser.h:44
   subtype LPMENUTEMPLATE is LPMENUTEMPLATEA;              --  winuser.h:48

   type CREATESTRUCTA;                                     --  winuser.h:410
   type CBT_CREATEWNDA;                                    --  winuser.h:408
   type CREATESTRUCTW;                                     --  winuser.h:418
   type CBT_CREATEWNDW;                                    --  winuser.h:416
   type CBTACTIVATESTRUCT;                                 --  winuser.h:432
   type EVENTMSG;                                          --  winuser.h:462
   type CWPSTRUCT;                                         --  winuser.h:475
   type DEBUGHOOKINFO;                                     --  winuser.h:486
   type MOUSEHOOKSTRUCT;                                   --  winuser.h:498
   type WNDCLASSA;                                         --  winuser.h:636
   type WNDCLASSW;                                         --  winuser.h:648
   type MSG;                                               --  winuser.h:680
   type MINMAXINFO;                                        --  winuser.h:785
   type COPYDATASTRUCT;                                    --  winuser.h:830
   type WINDOWPOS;                                         --  winuser.h:1059
   type NCCALCSIZE_PARAMS;                                 --  winuser.h:1072
   type ACCEL;                                             --  winuser.h:1233
   type PAINTSTRUCT;                                       --  winuser.h:1239
   type WINDOWPLACEMENT;                                   --  winuser.h:1284
   type MEASUREITEMSTRUCT;                                 --  winuser.h:1325
   type DRAWITEMSTRUCT;                                    --  winuser.h:1339
   type DELETEITEMSTRUCT;                                  --  winuser.h:1354
   type COMPAREITEMSTRUCT;                                 --  winuser.h:1365
   type DLGTEMPLATE;                                       --  winuser.h:2143
   type DLGITEMTEMPLATE;                                   --  winuser.h:2170
   type MENUITEMTEMPLATEHEADER;                            --  winuser.h:5108
   type MENUITEMTEMPLATE;                                  --  winuser.h:5114
   type ICONINFO;                                          --  winuser.h:5228
   type MDICREATESTRUCTA;                                  --  winuser.h:6000
   type MDICREATESTRUCTW;                                  --  winuser.h:6011
   type CLIENTCREATESTRUCT;                                --  winuser.h:6030
   type MULTIKEYHELPA;                                     --  winuser.h:6142
   type MULTIKEYHELPW;                                     --  winuser.h:6147
   type HELPWININFOA;                                      --  winuser.h:6162
   type HELPWININFOW;                                      --  winuser.h:6171
   type FILTERKEYS;                                        --  winuser.h:6346
   type STICKYKEYS;                                        --  winuser.h:6367
   type MOUSEKEYS;                                         --  winuser.h:6386
   type ACCESSTIMEOUT;                                     --  winuser.h:6409
   type SOUNDSENTRYA;                                      --  winuser.h:6431
   type SOUNDSENTRYW;                                      --  winuser.h:6446
   type TOGGLEKEYS;                                        --  winuser.h:6476

   type LPCBT_CREATEWNDA is access all CBT_CREATEWNDA;     --  winuser.h:412
   type LPCBT_CREATEWNDW is access all CBT_CREATEWNDW;     --  winuser.h:420
   subtype LPCBT_CREATEWND is LPCBT_CREATEWNDA;            --  winuser.h:426
   type LPCBTACTIVATESTRUCT is access all CBTACTIVATESTRUCT;
   --  winuser.h:436
   type PEVENTMSGMSG is access all EVENTMSG;               --  winuser.h:468
   subtype NPEVENTMSGMSG is PEVENTMSGMSG;                  --  winuser.h:468
   subtype LPEVENTMSGMSG is PEVENTMSGMSG;                  --  winuser.h:468
   type PEVENTMSG is access all EVENTMSG;                  --  winuser.h:470
   subtype NPEVENTMSG is PEVENTMSG;                        --  winuser.h:470
   subtype LPEVENTMSG is PEVENTMSG;                        --  winuser.h:470
   type PCWPSTRUCT is access all CWPSTRUCT;                --  winuser.h:480
   subtype NPCWPSTRUCT is PCWPSTRUCT;                      --  winuser.h:480
   subtype LPCWPSTRUCT is PCWPSTRUCT;                      --  winuser.h:480
   type PDEBUGHOOKINFO is access all DEBUGHOOKINFO;        --  winuser.h:493
   subtype NPDEBUGHOOKINFO is PDEBUGHOOKINFO;              --  winuser.h:493
   subtype LPDEBUGHOOKINFO is PDEBUGHOOKINFO;              --  winuser.h:493
   type PMOUSEHOOKSTRUCT is access all MOUSEHOOKSTRUCT;    --  winuser.h:503
   subtype LPMOUSEHOOKSTRUCT is PMOUSEHOOKSTRUCT;          --  winuser.h:503
   type PWNDCLASSA is access all WNDCLASSA;                --  winuser.h:647
   subtype NPWNDCLASSA is PWNDCLASSA;                      --  winuser.h:647
   subtype LPWNDCLASSA is PWNDCLASSA;                      --  winuser.h:647
   subtype PWNDCLASS is PWNDCLASSA;                        --  winuser.h:667
   subtype NPWNDCLASS is PWNDCLASSA;                       --  winuser.h:668
   subtype LPWNDCLASS is PWNDCLASSA;                       --  winuser.h:669
   type PWNDCLASSW is access all WNDCLASSW;                --  winuser.h:659
   subtype NPWNDCLASSW is PWNDCLASSW;                      --  winuser.h:659
   subtype LPWNDCLASSW is PWNDCLASSW;                      --  winuser.h:659
   type PMSG is access all MSG;                            --  winuser.h:687
   subtype NPMSG is PMSG;                                  --  winuser.h:687
   subtype LPMSG is PMSG;                                  --  winuser.h:687
   type PMINMAXINFO is access all MINMAXINFO;              --  winuser.h:791
   subtype LPMINMAXINFO is PMINMAXINFO;                    --  winuser.h:791
   type PCOPYDATASTRUCT is access all COPYDATASTRUCT;      --  winuser.h:834
   type PWINDOWPOS is access all WINDOWPOS;                --  winuser.h:1067
   subtype LPWINDOWPOS is PWINDOWPOS;                      --  winuser.h:1067
   type LPNCCALCSIZE_PARAMS is access all NCCALCSIZE_PARAMS;
   --  winuser.h:1075
   type LPACCEL is access all ACCEL;                       --  winuser.h:1237
   type PPAINTSTRUCT is access all PAINTSTRUCT;            --  winuser.h:1246
   subtype NPPAINTSTRUCT is PPAINTSTRUCT;                  --  winuser.h:1246
   subtype LPPAINTSTRUCT is PPAINTSTRUCT;                  --  winuser.h:1246
   type LPCREATESTRUCTA is access all CREATESTRUCTA;       --  winuser.h:1261
   subtype LPCREATESTRUCT is LPCREATESTRUCTA;              --  winuser.h:1281
   type LPCREATESTRUCTW is access all CREATESTRUCTW;       --  winuser.h:1275
   type PWINDOWPLACEMENT is access all WINDOWPLACEMENT;    --  winuser.h:1292
   subtype LPWINDOWPLACEMENT is PWINDOWPLACEMENT;          --  winuser.h:1292
   type PMEASUREITEMSTRUCT is access all MEASUREITEMSTRUCT; --  winuser.h:1332
   subtype LPMEASUREITEMSTRUCT is PMEASUREITEMSTRUCT;      --  winuser.h:1332
   type PDRAWITEMSTRUCT is access all DRAWITEMSTRUCT;      --  winuser.h:1349
   subtype LPDRAWITEMSTRUCT is PDRAWITEMSTRUCT;            --  winuser.h:1349
   type PDELETEITEMSTRUCT is access all DELETEITEMSTRUCT;  --  winuser.h:1360
   subtype LPDELETEITEMSTRUCT is PDELETEITEMSTRUCT;        --  winuser.h:1360
   type PCOMPAREITEMSTRUCT is access all COMPAREITEMSTRUCT; --  winuser.h:1374
   subtype LPCOMPAREITEMSTRUCT is PCOMPAREITEMSTRUCT;      --  winuser.h:1374
   type LPDLGTEMPLATEA is access all DLGTEMPLATE;          --  winuser.h:2144
   subtype LPDLGTEMPLATE is LPDLGTEMPLATEA;                --  winuser.h:2149
   type LPDLGTEMPLATEW is access all DLGTEMPLATE;          --  winuser.h:2145
   type PDLGITEMTEMPLATEA is access all DLGITEMTEMPLATE;   --  winuser.h:2171
   subtype PDLGITEMTEMPLATE is PDLGITEMTEMPLATEA;          --  winuser.h:2176
   type PDLGITEMTEMPLATEW is access all DLGITEMTEMPLATE;   --  winuser.h:2172
   type LPDLGITEMTEMPLATEA is access all DLGITEMTEMPLATE;  --  winuser.h:2178
   subtype LPDLGITEMTEMPLATE is LPDLGITEMTEMPLATEA;        --  winuser.h:2183
   type LPDLGITEMTEMPLATEW is access all DLGITEMTEMPLATE;  --  winuser.h:2179
   type PMENUITEMTEMPLATEHEADER is access all MENUITEMTEMPLATEHEADER;
   --  winuser.h:5108
   type PMENUITEMTEMPLATE is access all MENUITEMTEMPLATE;  --  winuser.h:5114
   type PICONINFO is access all ICONINFO;                  --  winuser.h:5235
   type LPMDICREATESTRUCTA is access all MDICREATESTRUCTA; --  winuser.h:6010
   subtype LPMDICREATESTRUCT is LPMDICREATESTRUCTA;        --  winuser.h:6027
   type LPMDICREATESTRUCTW is access all MDICREATESTRUCTW; --  winuser.h:6021
   type LPCLIENTCREATESTRUCT is access all CLIENTCREATESTRUCT;
   --  winuser.h:6033
   type PMULTIKEYHELPA is access all MULTIKEYHELPA;        --  winuser.h:6146
   subtype LPMULTIKEYHELPA is PMULTIKEYHELPA;              --  winuser.h:6146
   subtype PMULTIKEYHELP is PMULTIKEYHELPA;                --  winuser.h:6158
   subtype LPMULTIKEYHELP is PMULTIKEYHELPA;               --  winuser.h:6159
   type PMULTIKEYHELPW is access all MULTIKEYHELPW;        --  winuser.h:6151
   subtype LPMULTIKEYHELPW is PMULTIKEYHELPW;              --  winuser.h:6151
   type PHELPWININFOA is access all HELPWININFOA;          --  winuser.h:6170
   subtype LPHELPWININFOA is PHELPWININFOA;                --  winuser.h:6170
   subtype PHELPWININFO is PHELPWININFOA;                  --  winuser.h:6186
   subtype LPHELPWININFO is PHELPWININFOA;                 --  winuser.h:6187
   type PHELPWININFOW is access all HELPWININFOW;          --  winuser.h:6179
   subtype LPHELPWININFOW is PHELPWININFOW;                --  winuser.h:6179
   type LPFILTERKEYS is access all FILTERKEYS;             --  winuser.h:6354
   type LPSTICKYKEYS is access all STICKYKEYS;             --  winuser.h:6371
   type LPMOUSEKEYS is access all MOUSEKEYS;               --  winuser.h:6395
   type LPACCESSTIMEOUT is access all ACCESSTIMEOUT;       --  winuser.h:6414
   type LPSOUNDSENTRYA is access all SOUNDSENTRYA;         --  winuser.h:6445
   subtype LPSOUNDSENTRY is LPSOUNDSENTRYA;                --  winuser.h:6466
   type LPSOUNDSENTRYW is access all SOUNDSENTRYW;         --  winuser.h:6460
   type LPTOGGLEKEYS is access all TOGGLEKEYS;             --  winuser.h:6480

   --  ************************************************************
   --  On Windows NT, on Intel platforms, be sure to declare
   --  WndProc functions as    pragma Convention(Stdcall, WndProc);
   --  ************************************************************

   type WNDPROC is access function (hwnd : Win32.Windef.HWND;
                                    msg : Win32.UINT;
                                    wParam : Win32.WPARAM;
                                    lParam : Win32.LPARAM)
                                   return Win32.LRESULT;
   pragma Convention (Stdcall, WNDPROC);
   --  winuser.h:51
   type DLGPROC is access function (hwnd : Win32.Windef.HWND;
                                    msg : Win32.UINT;
                                    wParam : Win32.WPARAM;
                                    lParam : Win32.LPARAM)
                                   return Win32.BOOL; --  winuser.h:55
   pragma Convention (Stdcall, DLGPROC);
   type TIMERPROC is access procedure (hwnd : Win32.Windef.HWND;
                                       uMsg : Win32.UINT;
                                       idEvent : Win32.UINT;
                                       dwTime : Win32.DWORD);
   pragma Convention (Stdcall, TIMERPROC);
   --  winuser.h:56
   type GRAYSTRINGPROC is access function (hdc : Win32.Windef.HDC;
                                           lpData : Win32.LPARAM;
                                           cchdata : Win32.INT)
                                          return Win32.BOOL;
   pragma Convention (Stdcall, GRAYSTRINGPROC);
   --  winuser.h:57
   type WNDENUMPROC is access function (hwnd : Win32.Windef.HWND;
                                        lParam : Win32.LPARAM)
                                       return Win32.BOOL;
   pragma Convention (Stdcall, WNDENUMPROC);
   --  winuser.h:58
   type HOOKPROC is access function (code : Win32.INT;
                                     wParam : Win32.WPARAM;
                                     lParam : Win32.LPARAM)
                                    return Win32.LRESULT;
   pragma Convention (Stdcall, HOOKPROC);
   --  winuser.h:59
   type SENDASYNCPROC is access procedure (hwnd : Win32.Windef.HWND;
                                           uMsg : Win32.UINT;
                                           dwData : Win32.DWORD;
                                           lResult : Win32.LRESULT);
   pragma Convention (Stdcall, SENDASYNCPROC);
   --  winuser.h:60
   type PROPENUMPROCA is access function (hwnd : Win32.Windef.HWND;
                                          lpszString : Win32.LPCSTR;
                                          hData : Win32.Winnt.HANDLE)
                                         return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCA);
   --  winuser.h:62
   type PROPENUMPROCW is access function (hwnd : Win32.Windef.HWND;
                                          lpszString : Win32.LPCWSTR;
                                          hData : Win32.Winnt.HANDLE)
                                         return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCW);
   --  winuser.h:63
   type PROPENUMPROCEXA is access function (hwnd : Win32.Windef.HWND;
                                            lpszString : Win32.LPSTR;
                                            hData : Win32.Winnt.HANDLE;
                                            dwData : Win32.DWORD)
                                           return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCEXA);
   --  winuser.h:65
   type PROPENUMPROCEXW is access function (hwnd : Win32.Windef.HWND;
                                            lpszString : Win32.LPWSTR;
                                            hData : Win32.Winnt.HANDLE;
                                            dwData : Win32.DWORD)
                                           return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCEXW);
   --  winuser.h:66
   type EDITWORDBREAKPROCA is access function (lpch : Win32.LPSTR;
                                               ichCurrent : Win32.INT;
                                               cch : Win32.INT;
                                               code : Win32.INT)
                                              return Win32.INT;
   pragma Convention (Stdcall, EDITWORDBREAKPROCA);
   --  winuser.h:68
   type EDITWORDBREAKPROCW is access function (lpch : Win32.LPWSTR;
                                               ichCurrent : Win32.INT;
                                               cch : Win32.INT;
                                               code : Win32.INT)
                                              return Win32.INT;
   pragma Convention (Stdcall, EDITWORDBREAKPROCW);
   --  winuser.h:69
   type PROPENUMPROC is access function  return Win32.BOOL; --  winuser.h:96
   pragma Convention (Stdcall, PROPENUMPROC);
   type PROPENUMPROCEX is access function  return Win32.BOOL;
   pragma Convention (Stdcall, PROPENUMPROCEX);
   --  winuser.h:97
   type EDITWORDBREAKPROC is access function  return Win32.INT;
   pragma Convention (Stdcall, EDITWORDBREAKPROC);
   --  winuser.h:98

   type CREATESTRUCTA is                                   --  winuser.h:410
      record
         lpCreateParams : Win32.LPVOID;
         --  winuser.h:1249
         hInstance : Win32.Windef.HINSTANCE;         --  winuser.h:1250
         hMenu : Win32.Windef.HMENU;             --  winuser.h:1251
         hwndParent : Win32.Windef.HWND;              --  winuser.h:1252
         cy : Win32.INT;                      --  winuser.h:1253
         cx : Win32.INT;                      --  winuser.h:1254
         y : Win32.INT;                      --  winuser.h:1255
         x : Win32.INT;                      --  winuser.h:1256
         style : Win32.LONG;                     --  winuser.h:1257
         lpszName : Win32.LPCSTR;                   --  winuser.h:1258
         lpszClass : Win32.LPCSTR;                   --  winuser.h:1259
         dwExStyle : Win32.DWORD;                    --  winuser.h:1260
      end record;

   type CBT_CREATEWNDA is                                  --  winuser.h:408
      record
         lpcs : LPCREATESTRUCTA;               --  winuser.h:410
         hwndInsertAfter : Win32.Windef.HWND;             --  winuser.h:411
      end record;

   type CREATESTRUCTW is                                   --  winuser.h:418
      record
         lpCreateParams : Win32.LPVOID;
         --  winuser.h:1263
         hInstance : Win32.Windef.HINSTANCE;         --  winuser.h:1264
         hMenu : Win32.Windef.HMENU;             --  winuser.h:1265
         hwndParent : Win32.Windef.HWND;              --  winuser.h:1266
         cy : Win32.INT;                      --  winuser.h:1267
         cx : Win32.INT;                      --  winuser.h:1268
         y : Win32.INT;                      --  winuser.h:1269
         x : Win32.INT;                      --  winuser.h:1270
         style : Win32.LONG;                     --  winuser.h:1271
         lpszName : Win32.LPCWSTR;                  --  winuser.h:1272
         lpszClass : Win32.LPCWSTR;                  --  winuser.h:1273
         dwExStyle : Win32.DWORD;                    --  winuser.h:1274
      end record;

   type CBT_CREATEWNDW is                                  --  winuser.h:416
      record
         lpcs : LPCREATESTRUCTW;               --  winuser.h:418
         hwndInsertAfter : Win32.Windef.HWND;             --  winuser.h:419
      end record;

   subtype CBT_CREATEWND is CBT_CREATEWNDA;                --  winuser.h:425

   type CBTACTIVATESTRUCT is                               --  winuser.h:432
      record
         fMouse : Win32.BOOL;                         --  winuser.h:434
         hWndActive : Win32.Windef.HWND;
         --  winuser.h:435
      end record;

   type EVENTMSG is                                        --  winuser.h:462
      record
         message : Win32.UINT;                            --  winuser.h:463
         paramL : Win32.UINT;                            --  winuser.h:464
         paramH : Win32.UINT;                            --  winuser.h:465
         time : Win32.DWORD;                           --  winuser.h:466
         hwnd : Win32.Windef.HWND;
         --  winuser.h:467
      end record;

   type CWPSTRUCT is                                       --  winuser.h:475
      record
         lParam : Win32.LPARAM;                          --  winuser.h:476
         wParam : Win32.WPARAM;                          --  winuser.h:477
         message : Win32.UINT;                            --  winuser.h:478
         hwnd : Win32.Windef.HWND;
         --  winuser.h:479
      end record;

   type DEBUGHOOKINFO is                                   --  winuser.h:486
      record
         idThread : Win32.DWORD;                 --  winuser.h:488
         idThreadInstaller : Win32.DWORD;                 --  winuser.h:489
         lParam : Win32.LPARAM;                --  winuser.h:490
         wParam : Win32.WPARAM;                --  winuser.h:491
         code : Win32.INT;                   --  winuser.h:492
      end record;

   type MOUSEHOOKSTRUCT is                                 --  winuser.h:498
      record
         pt : Win32.Windef.POINT;
         --  winuser.h:499
         hwnd : Win32.Windef.HWND;
         --  winuser.h:500
         wHitTestCode : Win32.UINT;                       --  winuser.h:501
         dwExtraInfo : Win32.DWORD;                      --  winuser.h:502
      end record;

   type WNDCLASSA is                                       --  winuser.h:636
      record
         style : Win32.UINT;                      --  winuser.h:637
         lpfnWndProc : WNDPROC;                         --  winuser.h:638
         cbClsExtra : Win32.INT;                       --  winuser.h:639
         cbWndExtra : Win32.INT;                       --  winuser.h:640
         hInstance : Win32.Windef.HINSTANCE;          --  winuser.h:641
         hIcon : Win32.Windef.HICON;              --  winuser.h:642
         hCursor : Win32.Windef.HCURSOR;            --  winuser.h:643
         hbrBackground : Win32.Windef.HBRUSH;             --  winuser.h:644
         lpszMenuName : Win32.LPCSTR;                    --  winuser.h:645
         lpszClassName : Win32.LPCSTR;                    --  winuser.h:646
      end record;

   type WNDCLASSW is                                       --  winuser.h:648
      record
         style : Win32.UINT;                      --  winuser.h:649
         lpfnWndProc : WNDPROC;                         --  winuser.h:650
         cbClsExtra : Win32.INT;                       --  winuser.h:651
         cbWndExtra : Win32.INT;                       --  winuser.h:652
         hInstance : Win32.Windef.HINSTANCE;          --  winuser.h:653
         hIcon : Win32.Windef.HICON;              --  winuser.h:654
         hCursor : Win32.Windef.HCURSOR;            --  winuser.h:655
         hbrBackground : Win32.Windef.HBRUSH;             --  winuser.h:656
         lpszMenuName : Win32.LPCWSTR;                   --  winuser.h:657
         lpszClassName : Win32.LPCWSTR;                   --  winuser.h:658
      end record;

   subtype WNDCLASS is WNDCLASSA;                          --  winuser.h:666

   type MSG is                                             --  winuser.h:680
      record
         hwnd : Win32.Windef.HWND;                     --  winuser.h:681
         message : Win32.UINT;                            --  winuser.h:682
         wParam : Win32.WPARAM;                          --  winuser.h:683
         lParam : Win32.LPARAM;                          --  winuser.h:684
         time : Win32.DWORD;                           --  winuser.h:685
         pt : Win32.Windef.POINT;                    --  winuser.h:686
      end record;

   type MINMAXINFO is                                      --  winuser.h:785
      record
         ptReserved : Win32.Windef.POINT;             --  winuser.h:786
         ptMaxSize : Win32.Windef.POINT;             --  winuser.h:787
         ptMaxPosition : Win32.Windef.POINT;             --  winuser.h:788
         ptMinTrackSize : Win32.Windef.POINT;             --  winuser.h:789
         ptMaxTrackSize : Win32.Windef.POINT;             --  winuser.h:790
      end record;

   type COPYDATASTRUCT is                                  --  winuser.h:830
      record
         dwData : Win32.DWORD;                            --  winuser.h:831
         cbData : Win32.DWORD;                            --  winuser.h:832
         lpData : Win32.PVOID;                            --  winuser.h:833
      end record;

   type WINDOWPOS is                                       --  winuser.h:1059
      record
         hwnd : Win32.Windef.HWND;             --  winuser.h:1060
         hwndInsertAfter : Win32.Windef.HWND;             --  winuser.h:1061
         x : Win32.INT;                     --  winuser.h:1062
         y : Win32.INT;                     --  winuser.h:1063
         cx : Win32.INT;                     --  winuser.h:1064
         cy : Win32.INT;                     --  winuser.h:1065
         flags : Win32.UINT;
         --  winuser.h:1066
      end record;

   type RECT_Array is                                      --  winuser.h:1073
     array (Integer range 0 .. 2)
     of Win32.Windef.RECT;

   type NCCALCSIZE_PARAMS is                               --  winuser.h:1072
      record
         rgrc : RECT_Array;                              --  winuser.h:1073
         lppos : PWINDOWPOS;                              --  winuser.h:1074
      end record;

   type ACCEL is                                           --  winuser.h:1233
      record
         fVirt : Win32.BYTE;
         --  winuser.h:1234
         key : Win32.WORD;                              --  winuser.h:1235
         cmd : Win32.WORD;                              --  winuser.h:1236
      end record;

   type PAINTSTRUCT is                                     --  winuser.h:1239
      record
         hdc : Win32.Windef.HDC;                  --  winuser.h:1240
         fErase : Win32.BOOL;                        --  winuser.h:1241
         rcPaint : Win32.Windef.RECT;                 --  winuser.h:1242
         fRestore : Win32.BOOL;                        --  winuser.h:1243
         fIncUpdate : Win32.BOOL;                        --  winuser.h:1244
         rgbReserved : Win32.BYTE_Array (0 .. 31);           --  winuser.h:1245
      end record;

   subtype CREATESTRUCT is CREATESTRUCTA;                  --  winuser.h:1280

   type WINDOWPLACEMENT is                                 --  winuser.h:1284
      record
         length : Win32.UINT;                   --  winuser.h:1285
         flags : Win32.UINT;                   --  winuser.h:1286
         showCmd : Win32.UINT;                   --  winuser.h:1287
         ptMinPosition : Win32.Windef.POINT;           --  winuser.h:1288
         ptMaxPosition : Win32.Windef.POINT;           --  winuser.h:1289
         rcNormalPosition : Win32.Windef.RECT;            --  winuser.h:1290
      end record;

   type MEASUREITEMSTRUCT is                               --  winuser.h:1325
      record
         CtlType : Win32.UINT;                         --  winuser.h:1326
         CtlID : Win32.UINT;                         --  winuser.h:1327
         itemID : Win32.UINT;                         --  winuser.h:1328
         itemWidth : Win32.UINT;                         --  winuser.h:1329
         itemHeight : Win32.UINT;                         --  winuser.h:1330
         itemData : Win32.DWORD;                        --  winuser.h:1331
      end record;

   type DRAWITEMSTRUCT is                                  --  winuser.h:1339
      record
         CtlType : Win32.UINT;                         --  winuser.h:1340
         CtlID : Win32.UINT;                         --  winuser.h:1341
         itemID : Win32.UINT;                         --  winuser.h:1342
         itemAction : Win32.UINT;                         --  winuser.h:1343
         itemState : Win32.UINT;                         --  winuser.h:1344
         hwndItem : Win32.Windef.HWND;                  --  winuser.h:1345
         hDC : Win32.Windef.HDC;                   --  winuser.h:1346
         rcItem : Win32.Windef.RECT;                  --  winuser.h:1347
         itemData : Win32.DWORD;                        --  winuser.h:1348
      end record;

   type DELETEITEMSTRUCT is                                --  winuser.h:1354
      record
         CtlType : Win32.UINT;                           --  winuser.h:1355
         CtlID : Win32.UINT;                           --  winuser.h:1356
         itemID : Win32.UINT;                           --  winuser.h:1357
         hwndItem : Win32.Windef.HWND;                    --  winuser.h:1358
         itemData : Win32.UINT;                           --  winuser.h:1359
      end record;

   type COMPAREITEMSTRUCT is                               --  winuser.h:1365
      record
         CtlType : Win32.UINT;                         --  winuser.h:1366
         CtlID : Win32.UINT;                         --  winuser.h:1367
         hwndItem : Win32.Windef.HWND;                  --  winuser.h:1368
         itemID1 : Win32.UINT;                         --  winuser.h:1369
         itemData1 : Win32.DWORD;                        --  winuser.h:1370
         itemID2 : Win32.UINT;                         --  winuser.h:1371
         itemData2 : Win32.DWORD;                        --  winuser.h:1372
         dwLocaleId : Win32.DWORD;                        --  winuser.h:1373
      end record;

   type DLGTEMPLATE is                                     --  winuser.h:2143
      record
         style : Win32.DWORD;                   --  winuser.h:2136
         dwExtendedStyle : Win32.DWORD;                   --  winuser.h:2137
         cdit : Win32.WORD;                    --  winuser.h:2138
         x : Win32.SHORT;                   --  winuser.h:2139
         y : Win32.SHORT;                   --  winuser.h:2140
         cx : Win32.SHORT;                   --  winuser.h:2141
         cy : Win32.SHORT;                   --  winuser.h:2142
      end record;

   for DLGTEMPLATE use
      record
         style           at 0 range 0 .. 31;
         dwExtendedStyle at 4 range 0 .. 31;
         cdit            at 8 range 0 .. 15;
         x               at 10 range 0 .. 15;
         y               at 12 range 0 .. 15;
         cx              at 14 range 0 .. 15;
         cy              at 16 range 0 .. 15;
      end record;

   for DLGTEMPLATE'Size use 18 * 8;

   type DLGITEMTEMPLATE is
      record
         style : Win32.DWORD;                   --  winuser.h:2163
         dwExtendedStyle : Win32.DWORD;                   --  winuser.h:2164
         x : Win32.SHORT;                   --  winuser.h:2165
         y : Win32.SHORT;                   --  winuser.h:2166
         cx : Win32.SHORT;                   --  winuser.h:2167
         cy : Win32.SHORT;                   --  winuser.h:2168
         id : Win32.WORD;                    --  winuser.h:2169
      end record;

   for DLGITEMTEMPLATE use
      record
         style           at 0 range 0 .. 31;
         dwExtendedStyle at 4 range 0 .. 31;
         x               at 8 range 0 .. 15;
         y               at 10 range 0 .. 15;
         cx              at 12 range 0 .. 15;
         cy              at 14 range 0 .. 15;
         id              at 16 range 0 .. 15;
      end record;

   for DLGITEMTEMPLATE'Size use 18 * 8;

   type MENUITEMTEMPLATEHEADER is                          --  winuser.h:5108
      record
         versionNumber : Win32.WORD;                      --  winuser.h:5106
         offset : Win32.WORD;                      --  winuser.h:5107
      end record;

   type MENUITEMTEMPLATE is                                --  winuser.h:5114
      record
         mtOption : Win32.WORD;                           --  winuser.h:5111
         mtID : Win32.WORD;                           --  winuser.h:5112
         mtString : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winuser.h:5113
      end record;

   type ICONINFO is                                        --  winuser.h:5228
      record
         fIcon : Win32.BOOL;                           --  winuser.h:5229
         xHotspot : Win32.DWORD;                          --  winuser.h:5230
         yHotspot : Win32.DWORD;                          --  winuser.h:5231
         hbmMask : Win32.Windef.HBITMAP;                 --  winuser.h:5232
         hbmColor : Win32.Windef.HBITMAP;                 --  winuser.h:5233
      end record;

   type MDICREATESTRUCTA is                                --  winuser.h:6000
      record
         szClass : Win32.LPCSTR;                          --  winuser.h:6001
         szTitle : Win32.LPCSTR;                          --  winuser.h:6002
         hOwner : Win32.Winnt.HANDLE;                    --  winuser.h:6003
         x : Win32.INT;                             --  winuser.h:6004
         y : Win32.INT;                             --  winuser.h:6005
         cx : Win32.INT;                             --  winuser.h:6006
         cy : Win32.INT;                             --  winuser.h:6007
         style : Win32.DWORD;                           --  winuser.h:6008
         lParam : Win32.LPARAM;                          --  winuser.h:6009
      end record;

   type MDICREATESTRUCTW is                                --  winuser.h:6011
      record
         szClass : Win32.LPCWSTR;                         --  winuser.h:6012
         szTitle : Win32.LPCWSTR;                         --  winuser.h:6013
         hOwner : Win32.Winnt.HANDLE;                    --  winuser.h:6014
         x : Win32.INT;                             --  winuser.h:6015
         y : Win32.INT;                             --  winuser.h:6016
         cx : Win32.INT;                             --  winuser.h:6017
         cy : Win32.INT;                             --  winuser.h:6018
         style : Win32.DWORD;                           --  winuser.h:6019
         lParam : Win32.LPARAM;                          --  winuser.h:6020
      end record;

   subtype MDICREATESTRUCT is MDICREATESTRUCTA;            --  winuser.h:6026

   type CLIENTCREATESTRUCT is                              --  winuser.h:6030
      record
         hWindowMenu : Win32.Winnt.HANDLE;               --  winuser.h:6031
         idFirstChild : Win32.UINT;                       --  winuser.h:6032
      end record;

   type MULTIKEYHELPA is                                   --  winuser.h:6142
      record
         mkSize : Win32.DWORD;                       --  winuser.h:6143
         mkKeylist : Win32.CHAR;                        --  winuser.h:6144
         szKeyphrase : Win32.CHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winuser.h:6145
      end record;

   type MULTIKEYHELPW is                                   --  winuser.h:6147
      record
         mkSize : Win32.DWORD;                       --  winuser.h:6148
         mkKeylist : Win32.WCHAR;                       --  winuser.h:6149
         szKeyphrase : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winuser.h:6150
      end record;

   subtype MULTIKEYHELP is MULTIKEYHELPA;                  --  winuser.h:6157

   type HELPWININFOA is                                    --  winuser.h:6162
      record
         wStructSize : Win32.INT;                         --  winuser.h:6163
         x : Win32.INT;                         --  winuser.h:6164
         y : Win32.INT;                         --  winuser.h:6165
         dx : Win32.INT;                         --  winuser.h:6166
         dy : Win32.INT;                         --  winuser.h:6167
         wMax : Win32.INT;                         --  winuser.h:6168
         rgchMember : Win32.CHAR_Array (0 .. 1);            --  winuser.h:6169
      end record;

   type HELPWININFOW is                                    --  winuser.h:6171
      record
         wStructSize : Win32.INT;                         --  winuser.h:6172
         x : Win32.INT;                         --  winuser.h:6173
         y : Win32.INT;                         --  winuser.h:6174
         dx : Win32.INT;                         --  winuser.h:6175
         dy : Win32.INT;                         --  winuser.h:6176
         wMax : Win32.INT;                         --  winuser.h:6177
         rgchMember : Win32.WCHAR_Array (0 .. 1);           --  winuser.h:6178
      end record;

   subtype HELPWININFO is HELPWININFOA;                    --  winuser.h:6185

   type FILTERKEYS is                                      --  winuser.h:6346
      record
         cbSize : Win32.DWORD;                       --  winuser.h:6348
         dwFlags : Win32.DWORD;                       --  winuser.h:6349
         iWaitMSec : Win32.DWORD;                       --  winuser.h:6350
         iDelayMSec : Win32.DWORD;                       --  winuser.h:6351
         iRepeatMSec : Win32.DWORD;                       --  winuser.h:6352
         iBounceMSec : Win32.DWORD;                       --  winuser.h:6353
      end record;

   type STICKYKEYS is                                      --  winuser.h:6367
      record
         cbSize : Win32.DWORD;                           --  winuser.h:6369
         dwFlags : Win32.DWORD;                           --  winuser.h:6370
      end record;

   type MOUSEKEYS is                                       --  winuser.h:6386
      record
         cbSize : Win32.DWORD;                   --  winuser.h:6388
         dwFlags : Win32.DWORD;                   --  winuser.h:6389
         iMaxSpeed : Win32.DWORD;                   --  winuser.h:6390
         iTimeToMaxSpeed : Win32.DWORD;                   --  winuser.h:6391
         iCtrlSpeed : Win32.DWORD;                   --  winuser.h:6392
         dwReserved1 : Win32.DWORD;                   --  winuser.h:6393
         dwReserved2 : Win32.DWORD;                   --  winuser.h:6394
      end record;

   type ACCESSTIMEOUT is                                   --  winuser.h:6409
      record
         cbSize : Win32.DWORD;                      --  winuser.h:6411
         dwFlags : Win32.DWORD;                      --  winuser.h:6412
         iTimeOutMSec : Win32.DWORD;                      --  winuser.h:6413
      end record;

   type SOUNDSENTRYA is                                    --  winuser.h:6431
      record
         cbSize : Win32.DWORD;            --  winuser.h:6433
         dwFlags : Win32.DWORD;            --  winuser.h:6434
         iFSTextEffect : Win32.DWORD;            --  winuser.h:6435
         iFSTextEffectMSec : Win32.DWORD;            --  winuser.h:6436
         iFSTextEffectColorBits : Win32.DWORD;            --  winuser.h:6437
         iFSGrafEffect : Win32.DWORD;            --  winuser.h:6438
         iFSGrafEffectMSec : Win32.DWORD;            --  winuser.h:6439
         iFSGrafEffectColor : Win32.DWORD;            --  winuser.h:6440
         iWindowsEffect : Win32.DWORD;            --  winuser.h:6441
         iWindowsEffectMSec : Win32.DWORD;            --  winuser.h:6442
         lpszWindowsEffectDLL : Win32.LPSTR;            --  winuser.h:6443
         iWindowsEffectOrdinal : Win32.DWORD;            --  winuser.h:6444
      end record;

   type SOUNDSENTRYW is                                    --  winuser.h:6446
      record
         cbSize : Win32.DWORD;            --  winuser.h:6448
         dwFlags : Win32.DWORD;            --  winuser.h:6449
         iFSTextEffect : Win32.DWORD;            --  winuser.h:6450
         iFSTextEffectMSec : Win32.DWORD;            --  winuser.h:6451
         iFSTextEffectColorBits : Win32.DWORD;            --  winuser.h:6452
         iFSGrafEffect : Win32.DWORD;            --  winuser.h:6453
         iFSGrafEffectMSec : Win32.DWORD;            --  winuser.h:6454
         iFSGrafEffectColor : Win32.DWORD;            --  winuser.h:6455
         iWindowsEffect : Win32.DWORD;            --  winuser.h:6456
         iWindowsEffectMSec : Win32.DWORD;            --  winuser.h:6457
         lpszWindowsEffectDLL : Win32.LPWSTR;           --  winuser.h:6458
         iWindowsEffectOrdinal : Win32.DWORD;            --  winuser.h:6459
      end record;

   subtype SOUNDSENTRY is SOUNDSENTRYA;                    --  winuser.h:6465

   type TOGGLEKEYS is                                      --  winuser.h:6476
      record
         cbSize : Win32.DWORD;                           --  winuser.h:6478
         dwFlags : Win32.DWORD;                           --  winuser.h:6479
      end record;

   type ac_MSG_t is access all MSG;                   --  winuser.h:1408
   type ac_WNDCLASSA_t is access all WNDCLASSA;       --  winuser.h:1830
   type ac_WNDCLASSW_t is access all WNDCLASSW;       --  winuser.h:1835
   type ac_WINDOWPLACEMENT_t is access all WINDOWPLACEMENT;
   --  winuser.h:2033
   type LPCDLGTEMPLATEA is access all DLGTEMPLATE;    --  winuser.h:2151
   type LPCDLGTEMPLATEW is access all DLGTEMPLATE;    --  winuser.h:2152
   type LPCDLGTEMPLATE is access all DLGTEMPLATE;     --  winuser.h:2156
   type ac_PAINTt is access all PAINTSTRUCT;
   --  winuser.h:3913

   function wvsprintfA (lpOut : Win32.LPSTR;
                        lpFmt : Win32.LPCSTR;
                        arglist : Stdarg.ArgList := Stdarg.Empty)
                       return Win32.INT;          --  winuser.h:138

   function wvsprintf (lpOut : Win32.LPSTR;
                       lpFmt : Win32.LPCSTR;
                       arglist : Stdarg.ArgList := Stdarg.Empty)
                      return Win32.INT
     renames wvsprintfA;         --  winuser.h:138

   function wvsprintfW (lpOut : Win32.LPWSTR;
                        lpFmt : Win32.LPCWSTR;
                        arglist : Stdarg.ArgList := Stdarg.Empty)
                       return Win32.INT;          --  winuser.h:145

   function wsprintfA
     (lpOut : LPSTR;
      lpFmt : LPCSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;
   --  winuser.h:155

   function wsprintfW
     (lpOut : LPWSTR;
      lpFmt : LPCWSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty) return Win32.INT;
   --  winuser.h:156

   function wsprintf
     (lpOut : LPSTR;
      lpFmt : LPCSTR;
      arglist : Stdarg.ArgList := Stdarg.Empty) return Win32.INT
      --  winuser.h:158
     renames wsprintfA;

   function LoadKeyboardLayoutA (pwszKLID : Win32.LPCSTR;
                                 Flags : Win32.UINT)
                                return Win32.Windef.HKL;
   --  winuser.h:526

   function LoadKeyboardLayout (pwszKLID : Win32.LPCSTR;
                                Flags : Win32.UINT)
                               return Win32.Windef.HKL
     renames LoadKeyboardLayoutA;
   --  winuser.h:526

   function LoadKeyboardLayoutW (pwszKLID : Win32.LPCWSTR;
                                 Flags : Win32.UINT)
                                return Win32.Windef.HKL;
   --  winuser.h:532

   function ActivateKeyboardLayout (hkl : Win32.Windef.HKL;
                                    Flags : Win32.UINT)
                                   return Win32.BOOL;
   --  winuser.h:544

   function UnloadKeyboardLayout (hkl : Win32.Windef.HKL) return Win32.BOOL;
   --  winuser.h:551

   function GetKeyboardLayoutNameA (pwszKLID : Win32.LPSTR)
                                   return Win32.BOOL;
   --  winuser.h:557

   function GetKeyboardLayoutName (pwszKLID : Win32.LPSTR)
      return Win32.BOOL renames GetKeyboardLayoutNameA;   --  winuser.h:557

   function GetKeyboardLayoutNameW (pwszKLID : Win32.LPWSTR)
      return Win32.BOOL;                                  --  winuser.h:562

   function GetThreadDesktop (idThread : Win32.DWORD)
      return Win32.Windef.HDESK;                          --  winuser.h:587

   function GetProcessWindowStation return Win32.Windef.HWINSTA;
   --  winuser.h:609

   function SetUserObjectSecurity
     (hObj : Win32.Winnt.HANDLE;
      pSIRequested : Win32.Winnt.PSECURITY_INFORMATION;
      pSID : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL;                    --  winuser.h:618

   function GetUserObjectSecurity
     (hObj : Win32.Winnt.HANDLE;
      pSIRequested : Win32.Winnt.PSECURITY_INFORMATION;
      pSID : Win32.Winnt.PSECURITY_DESCRIPTOR;
      nLength : Win32.DWORD;
      lpnLengthNeeded : Win32.LPDWORD)
     return Win32.BOOL;
   --  winuser.h:626

   procedure POINTSTOPOINT (PT : out Win32.Windef.POINT;
                            PTS : in  Win32.Windef.POINTS);  --  winuser.h:693

   function POINTTOPOINTS (PT : Win32.Windef.POINT)
      return Win32.Windef.POINTS;                         --  winuser.h:693

   function MAKEWPARAM (L, H : WORD) return WPARAM;          --  winuser.h:694

   function MAKELPARAM (L, H : WORD) return LPARAM;          --  winuser.h:695

   function MAKELRESULT (L, H : WORD) return LRESULT;        --  winuser.h:696

   function RegisterWindowMessageA (lpString : Win32.LPCSTR)
      return Win32.UINT;                                  --  winuser.h:1025

   function RegisterWindowMessage (lpString : Win32.LPCSTR)
      return Win32.UINT renames RegisterWindowMessageA;   --  winuser.h:1025

   function RegisterWindowMessageW (lpString : Win32.LPCWSTR)
      return Win32.UINT;                                  --  winuser.h:1030

   function GetMessageA (lpMsg : access MSG;
                         hWnd : Win32.Windef.HWND;
                         wMsgFilterMin : Win32.UINT;
                         wMsgFilterMax : Win32.UINT)
                        return Win32.BOOL;
   --  winuser.h:1385

   function GetMessage (lpMsg : access MSG;
                        hWnd : Win32.Windef.HWND;
                        wMsgFilterMin : Win32.UINT;
                        wMsgFilterMax : Win32.UINT)
                       return Win32.BOOL
     renames GetMessageA;
   --  winuser.h:1385

   function GetMessageW (lpMsg : access MSG;
                         hWnd : Win32.Windef.HWND;
                         wMsgFilterMin : Win32.UINT;
                         wMsgFilterMax : Win32.UINT)
                        return Win32.BOOL;
   --  winuser.h:1393

   function TranslateMessage (lpMsg : ac_MSG_t) return Win32.BOOL;
   --  winuser.h:1407

   function DispatchMessageA (lpMsg : ac_MSG_t) return Win32.LONG;
   --  winuser.h:1413

   function DispatchMessage (lpMsg : ac_MSG_t) return Win32.LONG
     renames DispatchMessageA;
   --  winuser.h:1413

   function DispatchMessageW (lpMsg : ac_MSG_t) return Win32.LONG;
   --  winuser.h:1418

   function SetMessageQueue (cMessagesMax : Win32.INT) return Win32.BOOL;
   --  winuser.h:1430

   function PeekMessageA (lpMsg : access MSG;
                          hWnd : Win32.Windef.HWND;
                          wMsgFilterMin : Win32.UINT;
                          wMsgFilterMax : Win32.UINT;
                          wRemoveMsg : Win32.UINT)
                         return Win32.BOOL;
   --  winuser.h:1436

   function PeekMessage (lpMsg : access MSG;
                         hWnd : Win32.Windef.HWND;
                         wMsgFilterMin : Win32.UINT;
                         wMsgFilterMax : Win32.UINT;
                         wRemoveMsg : Win32.UINT)
                        return Win32.BOOL
     renames PeekMessageA;
   --  winuser.h:1436

   function PeekMessageW (lpMsg : access MSG;
                          hWnd : Win32.Windef.HWND;
                          wMsgFilterMin : Win32.UINT;
                          wMsgFilterMax : Win32.UINT;
                          wRemoveMsg : Win32.UINT)
                         return Win32.BOOL;
   --  winuser.h:1445

   function RegisterHotKey (hWnd : Win32.Windef.HWND;
                            id : Win32.INT;
                            fsModifiers : Win32.UINT;
                            vk : Win32.UINT)
                           return Win32.BOOL;
   --  winuser.h:1469

   function UnregisterHotKey (hWnd : Win32.Windef.HWND;
                              id : Win32.INT)
                             return Win32.BOOL;      --  winuser.h:1478

   function ExitWindows (dwReserved : DWORD;
                         uReturnCode : UINT)
      return Win32.BOOL;                                  --  winuser.h:1506

   function ExitWindowsEx (uFlags : Win32.UINT;
                           dwReserved : Win32.DWORD)
                          return Win32.BOOL;
   --  winuser.h:1511

   function SwapMouseButton (fSwap : Win32.BOOL) return Win32.BOOL;
   --  winuser.h:1518

   function GetMessagePos return Win32.DWORD;              --  winuser.h:1524

   function GetMessageTime return Win32.LONG;              --  winuser.h:1530

   function GetMessageExtraInfo return Win32.LONG;         --  winuser.h:1536

   function SendMessageA (hWnd : Win32.Windef.HWND;
                          Msg : Win32.UINT;
                          wParam : Win32.WPARAM;
                          lParam : Win32.LPARAM)
                         return Win32.LRESULT;     --  winuser.h:1543

   function SendMessage (hWnd : Win32.Windef.HWND;
                         Msg : Win32.UINT;
                         wParam : Win32.WPARAM;
                         lParam : Win32.LPARAM)
                        return Win32.LRESULT
     renames SendMessageA;      --  winuser.h:1543

   function SendMessageW (hWnd : Win32.Windef.HWND;
                          Msg : Win32.UINT;
                          wParam : Win32.WPARAM;
                          lParam : Win32.LPARAM)
                         return Win32.LRESULT;     --  winuser.h:1551

   function SendMessageTimeoutA (hWnd : Win32.Windef.HWND;
                                 Msg : Win32.UINT;
                                 wParam : Win32.WPARAM;
                                 lParam : Win32.LPARAM;
                                 fuFlags : Win32.UINT;
                                 uTimeout : Win32.UINT;
                                 lpdwResult : Win32.LPDWORD)
                                return Win32.LRESULT;
   --  winuser.h:1565

   function SendMessageTimeout (hWnd : Win32.Windef.HWND;
                                Msg : Win32.UINT;
                                wParam : Win32.WPARAM;
                                lParam : Win32.LPARAM;
                                fuFlags : Win32.UINT;
                                uTimeout : Win32.UINT;
                                lpdwResult : Win32.LPDWORD)
                               return Win32.LRESULT
     renames SendMessageTimeoutA;
   --  winuser.h:1565

   function SendMessageTimeoutW (hWnd : Win32.Windef.HWND;
                                 Msg : Win32.UINT;
                                 wParam : Win32.WPARAM;
                                 lParam : Win32.LPARAM;
                                 fuFlags : Win32.UINT;
                                 uTimeout : Win32.UINT;
                                 lpdwResult : Win32.LPDWORD)
                                return Win32.LRESULT;
   --  winuser.h:1576

   function SendNotifyMessageA (hWnd : Win32.Windef.HWND;
                                Msg : Win32.UINT;
                                wParam : Win32.WPARAM;
                                lParam : Win32.LPARAM)
                               return Win32.BOOL;
   --  winuser.h:1593

   function SendNotifyMessage (hWnd : Win32.Windef.HWND;
                               Msg : Win32.UINT;
                               wParam : Win32.WPARAM;
                               lParam : Win32.LPARAM)
                              return Win32.BOOL
     renames SendNotifyMessageA;
   --  winuser.h:1593

   function SendNotifyMessageW (hWnd : Win32.Windef.HWND;
                                Msg : Win32.UINT;
                                wParam : Win32.WPARAM;
                                lParam : Win32.LPARAM)
                               return Win32.BOOL;
   --  winuser.h:1601

   function SendMessageCallbackA (hWnd : Win32.Windef.HWND;
                                  Msg : Win32.UINT;
                                  wParam : Win32.WPARAM;
                                  lParam : Win32.LPARAM;
                                  lpResultCallBack : SENDASYNCPROC;
                                  dwData : Win32.DWORD)
                                 return Win32.BOOL;
   --  winuser.h:1615

   function SendMessageCallback (hWnd : Win32.Windef.HWND;
                                 Msg : Win32.UINT;
                                 wParam : Win32.WPARAM;
                                 lParam : Win32.LPARAM;
                                 lpResultCallBack : SENDASYNCPROC;
                                 dwData : Win32.DWORD)
                                return Win32.BOOL
     renames SendMessageCallbackA;
   --  winuser.h:1615

   function SendMessageCallbackW (hWnd : Win32.Windef.HWND;
                                  Msg : Win32.UINT;
                                  wParam : Win32.WPARAM;
                                  lParam : Win32.LPARAM;
                                  lpResultCallBack : SENDASYNCPROC;
                                  dwData : Win32.DWORD)
                                 return Win32.BOOL;
   --  winuser.h:1625

   function PostMessageA (hWnd : Win32.Windef.HWND;
                          Msg : Win32.UINT;
                          wParam : Win32.WPARAM;
                          lParam : Win32.LPARAM)
                         return Win32.BOOL;        --  winuser.h:1642

   function PostMessage (hWnd : Win32.Windef.HWND;
                         Msg : Win32.UINT;
                         wParam : Win32.WPARAM;
                         lParam : Win32.LPARAM)
                        return Win32.BOOL
     renames PostMessageA;      --  winuser.h:1642

   function PostMessageW (hWnd : Win32.Windef.HWND;
                          Msg : Win32.UINT;
                          wParam : Win32.WPARAM;
                          lParam : Win32.LPARAM)
                         return Win32.BOOL;        --  winuser.h:1650

   function PostThreadMessageA (idThread : Win32.DWORD;
                                Msg : Win32.UINT;
                                wParam : Win32.WPARAM;
                                lParam : Win32.LPARAM)
                               return Win32.BOOL;
   --  winuser.h:1664

   function PostThreadMessage (idThread : Win32.DWORD;
                               Msg : Win32.UINT;
                               wParam : Win32.WPARAM;
                               lParam : Win32.LPARAM)
                              return Win32.BOOL
     renames PostThreadMessageA;
   --  winuser.h:1664

   function PostThreadMessageW (idThread : Win32.DWORD;
                                Msg : Win32.UINT;
                                wParam : Win32.WPARAM;
                                lParam : Win32.LPARAM)
                               return Win32.BOOL;
   --  winuser.h:1672
   function PostAppMessageA
     (idThread : DWORD;
      Msg : UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM) return BOOL renames PostThreadMessageA;
   --  winuser.h:1683

   function PostAppMessageW
     (idThread : DWORD;
      Msg : UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM) return BOOL renames PostThreadMessageW;
   --  winuser.h:1685

   function PostAppMessage
     (idThread : DWORD;
      Msg : UINT;
      wParam : Win32.WPARAM;
      lParam : Win32.LPARAM) return BOOL renames PostThreadMessage;
   --  winuser.h:1690

   function AttachThreadInput (idAttach : Win32.DWORD;
                               idAttachTo : Win32.DWORD;
                               fAttach : Win32.BOOL)
                              return Win32.BOOL;
   --  winuser.h:1701

   function ReplyMessage (lResult : Win32.LRESULT) return Win32.BOOL;
   --  winuser.h:1710

   function WaitMessage return Win32.BOOL;                 --  winuser.h:1716

   function WaitForInputIdle (hProcess : Win32.Winnt.HANDLE;
                              dwMilliseconds : Win32.DWORD)
                             return Win32.DWORD;
   --  winuser.h:1722

   function DefWindowProcA (hWnd : Win32.Windef.HWND;
                            Msg : Win32.UINT;
                            wParam : Win32.WPARAM;
                            lParam : Win32.LPARAM)
                           return Win32.LRESULT;
   --  winuser.h:1729

   function DefWindowProc (hWnd : Win32.Windef.HWND;
                           Msg : Win32.UINT;
                           wParam : Win32.WPARAM;
                           lParam : Win32.LPARAM)
                          return Win32.LRESULT
     renames DefWindowProcA;  --  winuser.h:1729

   function DefWindowProcW (hWnd : Win32.Windef.HWND;
                            Msg : Win32.UINT;
                            wParam : Win32.WPARAM;
                            lParam : Win32.LPARAM)
                           return Win32.LRESULT;
   --  winuser.h:1737

   procedure PostQuitMessage (nExitCode : Win32.INT);        --  winuser.h:1751

   function CallWindowProcA (lpPrevWndFunc : WNDPROC;
                             hWnd : Win32.Windef.HWND;
                             Msg : Win32.UINT;
                             wParam : Win32.WPARAM;
                             lParam : Win32.LPARAM)
                            return Win32.LRESULT;
   --  winuser.h:1759

   function CallWindowProc (lpPrevWndFunc : WNDPROC;
                            hWnd : Win32.Windef.HWND;
                            Msg : Win32.UINT;
                            wParam : Win32.WPARAM;
                            lParam : Win32.LPARAM)
                           return Win32.LRESULT
     renames CallWindowProcA;
   --  winuser.h:1759

   function CallWindowProcW (lpPrevWndFunc : WNDPROC;
                             hWnd : Win32.Windef.HWND;
                             Msg : Win32.UINT;
                             wParam : Win32.WPARAM;
                             lParam : Win32.LPARAM)
                            return Win32.LRESULT;
   --  winuser.h:1768

   function InSendMessage return Win32.BOOL;               --  winuser.h:1811

   function GetDoubleClickTime return Win32.UINT;          --  winuser.h:1817

   function SetDoubleClickTime (uInterval : Win32.UINT) return Win32.BOOL;
   --  winuser.h:1823

   function RegisterClassA (lpWndClass : ac_WNDCLASSA_t)
      return Win32.Windef.ATOM;                           --  winuser.h:1829

   function RegisterClass (lpWndClass : ac_WNDCLASSA_t)
                          return Win32.Windef.ATOM
     renames RegisterClassA;
   --  winuser.h:1829

   function RegisterClassW (lpWndClass : access WNDCLASSW)
      return Win32.Windef.ATOM;                           --  winuser.h:1834

   function UnregisterClassA (lpClassName : Win32.LPCSTR;
                              hInstance : Win32.Windef.HINSTANCE)
                             return Win32.BOOL;
   --  winuser.h:1845

   function UnregisterClass (lpClassName : Win32.LPCSTR;
                             hInstance : Win32.Windef.HINSTANCE)
                            return Win32.BOOL
     renames UnregisterClassA;
   --  winuser.h:1845

   function UnregisterClassW (lpClassName : Win32.LPCWSTR;
                              hInstance : Win32.Windef.HINSTANCE)
                             return Win32.BOOL;
   --  winuser.h:1851

   function GetClassInfoA (hInstance : Win32.Windef.HINSTANCE;
                           lpClassName : Win32.LPCSTR;
                           lpWndClass : access WNDCLASSA)
                          return Win32.BOOL;
   --  winuser.h:1863

   function GetClassInfo (hInstance : Win32.Windef.HINSTANCE;
                          lpClassName : Win32.LPCSTR;
                          lpWndClass : access WNDCLASSA)
                         return Win32.BOOL
     renames GetClassInfoA;
   --  winuser.h:1863

   function GetClassInfoW (hInstance : Win32.Windef.HINSTANCE;
                           lpClassName : Win32.LPCWSTR;
                           lpWndClass : access WNDCLASSW)
                          return Win32.BOOL;
   --  winuser.h:1870

   function CreateWindowExA (dwExStyle : Win32.DWORD;
                             lpClassName : Win32.LPCSTR;
                             lpWindowName : Win32.LPCSTR;
                             dwStyle : Win32.DWORD;
                             X : Win32.INT;
                             Y : Win32.INT;
                             nWidth : Win32.INT;
                             nHeight : Win32.INT;
                             hWndParent : Win32.Windef.HWND;
                             hMenu : Win32.Windef.HMENU;
                             hInstance : Win32.Windef.HINSTANCE;
                             lpParam : Win32.LPVOID)
                            return Win32.Windef.HWND;
   --  winuser.h:1891

   function CreateWindowEx (dwExStyle : Win32.DWORD;
                            lpClassName : Win32.LPCSTR;
                            lpWindowName : Win32.LPCSTR;
                            dwStyle : Win32.DWORD;
                            X : Win32.INT;
                            Y : Win32.INT;
                            nWidth : Win32.INT;
                            nHeight : Win32.INT;
                            hWndParent : Win32.Windef.HWND;
                            hMenu : Win32.Windef.HMENU;
                            hInstance : Win32.Windef.HINSTANCE;
                            lpParam : Win32.LPVOID)
                           return Win32.Windef.HWND
     renames CreateWindowExA;
   --  winuser.h:1891

   function CreateWindowExW (dwExStyle : Win32.DWORD;
                             lpClassName : Win32.LPCWSTR;
                             lpWindowName : Win32.LPCWSTR;
                             dwStyle : Win32.DWORD;
                             X : Win32.INT;
                             Y : Win32.INT;
                             nWidth : Win32.INT;
                             nHeight : Win32.INT;
                             hWndParent : Win32.Windef.HWND;
                             hMenu : Win32.Windef.HMENU;
                             hInstance : Win32.Windef.HINSTANCE;
                             lpParam : Win32.LPVOID)
                            return Win32.Windef.HWND;
   --  winuser.h:1907

   function CreateWindowA (lpClassName : Win32.LPCSTR;
                           lpWindowName : Win32.LPCSTR;
                           dwStyle : Win32.DWORD;
                           X : Win32.INT;
                           Y : Win32.INT;
                           nWidth : Win32.INT;
                           nHeight : Win32.INT;
                           hWndParent : Win32.Windef.HWND;
                           hMenu : Win32.Windef.HMENU;
                           hInstance : Win32.Windef.HINSTANCE;
                           lpParam : Win32.LPVOID)
                          return Win32.Windef.HWND;
   --  winuser.h:1891

   function CreateWindow (lpClassName : Win32.LPCSTR;
                          lpWindowName : Win32.LPCSTR;
                          dwStyle : Win32.DWORD;
                          X : Win32.INT;
                          Y : Win32.INT;
                          nWidth : Win32.INT;
                          nHeight : Win32.INT;
                          hWndParent : Win32.Windef.HWND;
                          hMenu : Win32.Windef.HMENU;
                          hInstance : Win32.Windef.HINSTANCE;
                          lpParam : Win32.LPVOID)
      return Win32.Windef.HWND renames CreateWindowA;     --  winuser.h:1891

   function CreateWindowW (lpClassName : Win32.LPCWSTR;
                           lpWindowName : Win32.LPCWSTR;
                           dwStyle : Win32.DWORD;
                           X : Win32.INT;
                           Y : Win32.INT;
                           nWidth : Win32.INT;
                           nHeight : Win32.INT;
                           hWndParent : Win32.Windef.HWND;
                           hMenu : Win32.Windef.HMENU;
                           hInstance : Win32.Windef.HINSTANCE;
                           lpParam : Win32.LPVOID)
                          return Win32.Windef.HWND;
   --  winuser.h:1907

   function IsWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:1941

   function IsMenu (hMenu : Win32.Windef.HMENU) return Win32.BOOL;
   --  winuser.h:1947

   function IsChild (hWndParent : Win32.Windef.HWND;
                     hWnd : Win32.Windef.HWND)
                    return Win32.BOOL;         --  winuser.h:1953

   function DestroyWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:1960

   function ShowWindow (hWnd : Win32.Windef.HWND;
                        nCmdShow : Win32.INT)
                       return Win32.BOOL;        --  winuser.h:1966

   function FlashWindow (hWnd : Win32.Windef.HWND;
                         bInvert : Win32.BOOL)
                        return Win32.BOOL;        --  winuser.h:1974

   function ShowOwnedPopups (hWnd : Win32.Windef.HWND;
                             fShow : Win32.BOOL)
                            return Win32.BOOL;      --  winuser.h:1981

   function OpenIcon (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:1988

   function CloseWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:1994

   function MoveWindow (hWnd : Win32.Windef.HWND;
                        X : Win32.INT;
                        Y : Win32.INT;
                        nWidth : Win32.INT;
                        nHeight : Win32.INT;
                        bRepaint : Win32.BOOL)
                       return Win32.BOOL;        --  winuser.h:2000

   function SetWindowPos (hWnd : Win32.Windef.HWND;
                          hWndInsertAfter : Win32.Windef.HWND;
                          X : Win32.INT;
                          Y : Win32.INT;
                          cx : Win32.INT;
                          cy : Win32.INT;
                          uFlags : Win32.UINT)
                         return Win32.BOOL;
   --  winuser.h:2012

   function GetWindowPlacement (hWnd : Win32.Windef.HWND;
                                lpwndpl : access WINDOWPLACEMENT)
                               return Win32.BOOL;
   --  winuser.h:2024

   function SetWindowPlacement (hWnd : Win32.Windef.HWND;
                                lpwndpl : ac_WINDOWPLACEMENT_t)
                               return Win32.BOOL;
   --  winuser.h:2031

   function BeginDeferWindowPos (nNumWindows : Win32.INT) return HDWP;
   --  winuser.h:2041

   function DeferWindowPos (hWinPosInfo : HDWP;
                            hWnd : Win32.Windef.HWND;
                            hWndInsertAfter : Win32.Windef.HWND;
                            x : Win32.INT;
                            y : Win32.INT;
                            cx : Win32.INT;
                            cy : Win32.INT;
                            uFlags : Win32.UINT)
                           return HDWP;   --  winuser.h:2047

   function EndDeferWindowPos (hWinPosInfo : HDWP) return Win32.BOOL;
   --  winuser.h:2060

   function IsWindowVisible (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:2068

   function IsIconic (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:2074

   function AnyPopup return Win32.BOOL;                    --  winuser.h:2080

   function BringWindowToTop (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:2086

   function IsZoomed (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:2092

   function CreateDialogParamA (hInstance : Win32.Windef.HINSTANCE;
                                lpTemplateName : Win32.LPCSTR;
                                hWndParent : Win32.Windef.HWND;
                                lpDialogFunc : DLGPROC;
                                dwInitParam : Win32.LPARAM)
      return Win32.Windef.HWND;                           --  winuser.h:2193

   function CreateDialogParam (hInstance : Win32.Windef.HINSTANCE;
                               lpTemplateName : Win32.LPCSTR;
                               hWndParent : Win32.Windef.HWND;
                               lpDialogFunc : DLGPROC;
                               dwInitParam : Win32.LPARAM)
      return Win32.Windef.HWND renames CreateDialogParamA;
   --  winuser.h:2193

   function CreateDialogParamW (hInstance : Win32.Windef.HINSTANCE;
                                lpTemplateName : Win32.LPCWSTR;
                                hWndParent : Win32.Windef.HWND;
                                lpDialogFunc : DLGPROC;
                                dwInitParam : Win32.LPARAM)
      return Win32.Windef.HWND;                           --  winuser.h:2202

   function CreateDialogA (hInstance : Win32.Windef.HINSTANCE;
                           lpTemplateName : Win32.LPCSTR;
                           hWndParent : Win32.Windef.HWND;
                           lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND;                           --  winuser.h:2238

   function CreateDialog (hInstance : Win32.Windef.HINSTANCE;
                          lpTemplateName : Win32.LPCSTR;
                          hWndParent : Win32.Windef.HWND;
                          lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND renames CreateDialogA;     --  winuser.h:2238

   function CreateDialogW (hInstance : Win32.Windef.HINSTANCE;
                           lpTemplateName : Win32.LPCWSTR;
                           hWndParent : Win32.Windef.HWND;
                           lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND;                           --  winuser.h:2245

   function CreateDialogIndirectParamA (hInstance : Win32.Windef.HINSTANCE;
                                        lpTemplate : LPCDLGTEMPLATEA;
                                        hWndParent : Win32.Windef.HWND;
                                        lpDialogFunc : DLGPROC;
                                        dwInitParam : Win32.LPARAM)
      return Win32.Windef.HWND;                           --  winuser.h:2217

   function CreateDialogIndirectParam (hInstance : Win32.Windef.HINSTANCE;
                                       lpTemplate : LPCDLGTEMPLATEA;
                                       hWndParent : Win32.Windef.HWND;
                                       lpDialogFunc : DLGPROC;
                                       dwInitParam : Win32.LPARAM)
      return Win32.Windef.HWND renames CreateDialogIndirectParamA;
   --  winuser.h:2217

   function CreateDialogIndirectParamW (hInstance : Win32.Windef.HINSTANCE;
                                        lpTemplate : LPCDLGTEMPLATEW;
                                        hWndParent : Win32.Windef.HWND;
                                        lpDialogFunc : DLGPROC;
                                        dwInitParam : Win32.LPARAM)
      return Win32.Windef.HWND;                           --  winuser.h:2226

   function CreateDialogIndirectA (hInstance : Win32.Windef.HINSTANCE;
                                   lpTemplate : LPCDLGTEMPLATEA;
                                   hWndParent : Win32.Windef.HWND;
                                   lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND;                           --  winuser.h:2248

   function CreateDialogIndirect (hInstance : Win32.Windef.HINSTANCE;
                                  lpTemplate : LPCDLGTEMPLATEA;
                                  hWndParent : Win32.Windef.HWND;
                                  lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND renames CreateDialogIndirectA;
   --  winuser.h:2255

   function CreateDialogIndirectW (hInstance : Win32.Windef.HINSTANCE;
                                   lpTemplate : LPCDLGTEMPLATEW;
                                   hWndParent : Win32.Windef.HWND;
                                   lpDialogFunc : DLGPROC)
      return Win32.Windef.HWND;                           --  winuser.h:2250

   function DialogBoxParamA (hInstance : Win32.Windef.HINSTANCE;
                             lpTemplateName : Win32.LPCSTR;
                             hWndParent : Win32.Windef.HWND;
                             lpDialogFunc : DLGPROC;
                             dwInitParam : Win32.LPARAM)
      return Win32.INT;                                   --  winuser.h:2261

   function DialogBoxParam (hInstance : Win32.Windef.HINSTANCE;
                            lpTemplateName : Win32.LPCSTR;
                            hWndParent : Win32.Windef.HWND;
                            lpDialogFunc : DLGPROC;
                            dwInitParam : Win32.LPARAM)
      return Win32.INT renames DialogBoxParamA;           --  winuser.h:2261

   function DialogBoxParamW (hInstance : Win32.Windef.HINSTANCE;
                             lpTemplateName : Win32.LPCWSTR;
                             hWndParent : Win32.Windef.HWND;
                             lpDialogFunc : DLGPROC;
                             dwInitParam : Win32.LPARAM)
      return Win32.INT;                                   --  winuser.h:2270

   function DialogBoxA (hInstance : Win32.Windef.HINSTANCE;
                        lpTemplateName : Win32.LPCSTR;
                        hWndParent : Win32.Windef.HWND;
                        lpDialogFunc : DLGPROC)
      return Win32.INT;                                   --  winuser.h:2306

   function DialogBox (hInstance : Win32.Windef.HINSTANCE;
                       lpTemplateName : Win32.LPCSTR;
                       hWndParent : Win32.Windef.HWND;
                       lpDialogFunc : DLGPROC)
      return Win32.INT renames DialogBoxA;                --  winuser.h:2313

   function DialogBoxW (hInstance : Win32.Windef.HINSTANCE;
                        lpTemplateName : Win32.LPCWSTR;
                        hWndParent : Win32.Windef.HWND;
                        lpDialogFunc : DLGPROC)
      return Win32.INT;                                   --  winuser.h:2308

   function DialogBoxIndirectParamA (hInstance : Win32.Windef.HINSTANCE;
                                     hDialogTemplate : LPCDLGTEMPLATEA;
                                     hWndParent : Win32.Windef.HWND;
                                     lpDialogFunc : DLGPROC;
                                     dwInitParam : Win32.LPARAM)
      return Win32.INT;                                   --  winuser.h:2285

   function DialogBoxIndirectParam (hInstance : Win32.Windef.HINSTANCE;
                                    hDialogTemplate : LPCDLGTEMPLATEA;
                                    hWndParent : Win32.Windef.HWND;
                                    lpDialogFunc : DLGPROC;
                                    dwInitParam : Win32.LPARAM)
      return Win32.INT renames DialogBoxIndirectParamA;
   --  winuser.h:2285

   function DialogBoxIndirectParamW (hInstance : Win32.Windef.HINSTANCE;
                                     hDialogTemplate : LPCDLGTEMPLATEW;
                                     hWndParent : Win32.Windef.HWND;
                                     lpDialogFunc : DLGPROC;
                                     dwInitParam : Win32.LPARAM)
      return Win32.INT;                                 --  winuser.h:2294

   function DialogBoxIndirectA (hInstance : Win32.Windef.HINSTANCE;
                                hDialogTemplate : LPCDLGTEMPLATEA;
                                hWndParent : Win32.Windef.HWND;
                                lpDialogFunc : DLGPROC)
      return Win32.INT;                                   --  winuser.h:2316

   function DialogBoxIndirect (hInstance : Win32.Windef.HINSTANCE;
                               hDialogTemplate : LPCDLGTEMPLATEA;
                               hWndParent : Win32.Windef.HWND;
                               lpDialogFunc : DLGPROC)
      return Win32.INT renames DialogBoxIndirectA;       --  winuser.h:2323

   function DialogBoxIndirectW (hInstance : Win32.Windef.HINSTANCE;
                                hDialogTemplate : LPCDLGTEMPLATEW;
                                hWndParent : Win32.Windef.HWND;
                                lpDialogFunc : DLGPROC)
      return Win32.INT;                                 --  winuser.h:2318

   function EndDialog (hDlg : Win32.Windef.HWND;
                       nResult : Win32.INT)
                      return Win32.BOOL;          --  winuser.h:2329

   function GetDlgItem (hDlg : Win32.Windef.HWND;
                        nIDDlgItem : Win32.INT)
                       return Win32.Windef.HWND;
   --  winuser.h:2336

   function SetDlgItemInt (hDlg : Win32.Windef.HWND;
                           nIDDlgItem : Win32.INT;
                           uValue : Win32.UINT;
                           bSigned : Win32.BOOL)
                          return Win32.BOOL;
   --  winuser.h:2343

   function GetDlgItemInt (hDlg : Win32.Windef.HWND;
                           nIDDlgItem : Win32.INT;
                           lpTranslated : access Win32.BOOL;
                           bSigned : Win32.BOOL)
                          return Win32.UINT;
   --  winuser.h:2352

   function SetDlgItemTextA (hDlg : Win32.Windef.HWND;
                             nIDDlgItem : Win32.INT;
                             lpString : Win32.LPCSTR)
                            return Win32.BOOL;
   --  winuser.h:2361

   function SetDlgItemText (hDlg : Win32.Windef.HWND;
                            nIDDlgItem : Win32.INT;
                            lpString : Win32.LPCSTR)
                           return Win32.BOOL
     renames SetDlgItemTextA;
   --  winuser.h:2361

   function SetDlgItemTextW (hDlg : Win32.Windef.HWND;
                             nIDDlgItem : Win32.INT;
                             lpString : Win32.LPCWSTR)
                            return Win32.BOOL;
   --  winuser.h:2368

   function GetDlgItemTextA (hDlg : Win32.Windef.HWND;
                             nIDDlgItem : Win32.INT;
                             lpString : Win32.LPSTR;
                             nMaxCount : Win32.INT)
                            return Win32.UINT;
   --  winuser.h:2381

   function GetDlgItemText (hDlg : Win32.Windef.HWND;
                            nIDDlgItem : Win32.INT;
                            lpString : Win32.LPSTR;
                            nMaxCount : Win32.INT)
                           return Win32.UINT
     renames GetDlgItemTextA;
   --  winuser.h:2381

   function GetDlgItemTextW (hDlg : Win32.Windef.HWND;
                             nIDDlgItem : Win32.INT;
                             lpString : Win32.LPWSTR;
                             nMaxCount : Win32.INT)
                            return Win32.UINT;
   --  winuser.h:2389

   function CheckDlgButton (hDlg : Win32.Windef.HWND;
                            nIDButton : Win32.INT;
                            uCheck : Win32.UINT)
                           return Win32.BOOL;
   --  winuser.h:2403

   function CheckRadioButton (hDlg : Win32.Windef.HWND;
                              nIDFirstButton : Win32.INT;
                              nIDLastButton : Win32.INT;
                              nIDCheckButton : Win32.INT)
                             return Win32.BOOL;
   --  winuser.h:2411

   function IsDlgButtonChecked (hDlg : Win32.Windef.HWND;
                                nIDButton : Win32.INT)
                               return Win32.UINT;
   --  winuser.h:2420

   function SendDlgItemMessageA (hDlg : Win32.Windef.HWND;
                                 nIDDlgItem : Win32.INT;
                                 Msg : Win32.UINT;
                                 wParam : Win32.WPARAM;
                                 lParam : Win32.LPARAM)
                                return Win32.LONG;
   --  winuser.h:2427

   function SendDlgItemMessage (hDlg : Win32.Windef.HWND;
                                nIDDlgItem : Win32.INT;
                                Msg : Win32.UINT;
                                wParam : Win32.WPARAM;
                                lParam : Win32.LPARAM)
                               return Win32.LONG
     renames SendDlgItemMessageA;
   --  winuser.h:2427

   function SendDlgItemMessageW (hDlg : Win32.Windef.HWND;
                                 nIDDlgItem : Win32.INT;
                                 Msg : Win32.UINT;
                                 wParam : Win32.WPARAM;
                                 lParam : Win32.LPARAM)
                                return Win32.LONG;
   --  winuser.h:2436

   function GetNextDlgGroupItem (hDlg : Win32.Windef.HWND;
                                 hCtl : Win32.Windef.HWND;
                                 bPrevious : Win32.BOOL)
                                return Win32.Windef.HWND;
   --  winuser.h:2451

   function GetNextDlgTabItem (hDlg : Win32.Windef.HWND;
                               hCtl : Win32.Windef.HWND;
                               bPrevious : Win32.BOOL)
                              return Win32.Windef.HWND;
   --  winuser.h:2459

   function GetDlgCtrlID (hWnd : Win32.Windef.HWND) return Win32.INT;
   --  winuser.h:2467

   function GetDialogBaseUnits return Win32.INT;           --  winuser.h:2473

   function DefDlgProcA (hDlg : Win32.Windef.HWND;
                         Msg : Win32.UINT;
                         wParam : Win32.WPARAM;
                         lParam : Win32.LPARAM)
                        return Win32.LRESULT;      --  winuser.h:2478

   function DefDlgProc (hDlg : Win32.Windef.HWND;
                        Msg : Win32.UINT;
                        wParam : Win32.WPARAM;
                        lParam : Win32.LPARAM)
                       return Win32.LRESULT
     renames DefDlgProcA;        --  winuser.h:2478

   function DefDlgProcW (hDlg : Win32.Windef.HWND;
                         Msg : Win32.UINT;
                         wParam : Win32.WPARAM;
                         lParam : Win32.LPARAM)
                        return Win32.LRESULT;      --  winuser.h:2486

   function CallMsgFilterA (lpMsg : access MSG;
                            nCode : Win32.INT)
                           return Win32.BOOL;       --  winuser.h:2509

   function CallMsgFilter (lpMsg : access MSG;
                           nCode : Win32.INT)
                          return Win32.BOOL
     renames CallMsgFilterA;   --  winuser.h:2509

   function CallMsgFilterW (lpMsg : access MSG;
                            nCode : Win32.INT)
                           return Win32.BOOL;       --  winuser.h:2515

   function OpenClipboard (hWndNewOwner : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:2535

   function CloseClipboard return Win32.BOOL;              --  winuser.h:2541

   function GetClipboardOwner return Win32.Windef.HWND;    --  winuser.h:2547

   function SetClipboardViewer (hWndNewViewer : Win32.Windef.HWND)
      return Win32.Windef.HWND;                           --  winuser.h:2553

   function GetClipboardViewer return Win32.Windef.HWND;   --  winuser.h:2559

   function ChangeClipboardChain (hWndRemove : Win32.Windef.HWND;
                                  hWndNewNext : Win32.Windef.HWND)
                                 return Win32.BOOL;
   --  winuser.h:2565

   function SetClipboardData (uFormat : Win32.UINT;
                              hMem : Win32.Winnt.HANDLE)
                             return Win32.Winnt.HANDLE;
   --  winuser.h:2572

   function GetClipboardData (uFormat : Win32.UINT) return Win32.Winnt.HANDLE;
   --  winuser.h:2579

   function RegisterClipboardFormatA (lpszFormat : Win32.LPCSTR)
      return Win32.UINT;                                  --  winuser.h:2585

   function RegisterClipboardFormat (lpszFormat : Win32.LPCSTR)
                                    return Win32.UINT
     renames RegisterClipboardFormatA;                   --  winuser.h:2585

   function RegisterClipboardFormatW (lpszFormat : Win32.LPCWSTR)
                                     return Win32.UINT;
   --  winuser.h:2590

   function CountClipboardFormats return Win32.INT;        --  winuser.h:2601

   function EnumClipboardFormats (format : Win32.UINT) return Win32.UINT;
   --  winuser.h:2607

   function GetClipboardFormatNameA (format : Win32.UINT;
                                     lpszFormatName : Win32.LPSTR;
                                     cchMaxCount : Win32.INT)
                                    return Win32.INT;
   --  winuser.h:2613

   function GetClipboardFormatName
     (format : Win32.UINT;
      lpszFormatName : Win32.LPSTR;
      cchMaxCount : Win32.INT)
     return Win32.INT
     renames GetClipboardFormatNameA;
   --  winuser.h:2613

   function GetClipboardFormatNameW (format : Win32.UINT;
                                     lpszFormatName : Win32.LPWSTR;
                                     cchMaxCount : Win32.INT)
                                    return Win32.INT;
   --  winuser.h:2620

   function EmptyClipboard return Win32.BOOL;              --  winuser.h:2633

   function IsClipboardFormatAvailable (format : Win32.UINT) return Win32.BOOL;
   --  winuser.h:2639

   function GetPriorityClipboardFormat
     (paFormatPriorityList : access Win32.UINT;
      cFormats : Win32.INT)
     return Win32.INT;                                   --  winuser.h:2645

   function GetOpenClipboardWindow return Win32.Windef.HWND;
   --  winuser.h:2652

   function CharToOemA (lpszSrc : Win32.LPCSTR;
                        lpszDst : Win32.LPSTR)
                       return Win32.BOOL;         --  winuser.h:2664

   function AnsiToOem (lpszSrc : Win32.LPCSTR;
                       lpszDst : Win32.LPSTR)
                      return Win32.BOOL
     renames CharToOemA;         --  winuser.h:2664

   function CharToOem (lpszSrc : Win32.LPCSTR;
                       lpszDst : Win32.LPSTR)
                      return Win32.BOOL
     renames CharToOemA;         --  winuser.h:2664

   function CharToOemW (lpszSrc : Win32.LPCWSTR;
                        lpszDst : Win32.LPSTR)
                       return Win32.BOOL;         --  winuser.h:2670

   function OemToCharA (lpszSrc : Win32.LPCSTR;
                        lpszDst : Win32.LPSTR)
                       return Win32.BOOL;         --  winuser.h:2682

   function OemToAnsi (lpszSrc : Win32.LPCSTR;
                       lpszDst : Win32.LPSTR)
                      return Win32.BOOL
     renames OemToCharA;         --  winuser.h:2682

   function OemToChar (lpszSrc : Win32.LPCSTR;
                       lpszDst : Win32.LPSTR)
                      return Win32.BOOL
     renames OemToCharA;         --  winuser.h:2682

   function OemToCharW (lpszSrc : Win32.LPCSTR;
                        lpszDst : Win32.LPWSTR)
                       return Win32.BOOL;         --  winuser.h:2688

   function CharToOemBuffA (lpszSrc : Win32.LPCSTR;
                            lpszDst : Win32.LPSTR;
                            cchDstLength : Win32.DWORD)
                           return Win32.BOOL;
   --  winuser.h:2700

   function AnsiToOemBuff (lpszSrc : Win32.LPCSTR;
                           lpszDst : Win32.LPSTR;
                           cchDstLength : Win32.DWORD)
                          return Win32.BOOL
     renames CharToOemBuffA;
   --  winuser.h:2700

   function CharToOemBuff (lpszSrc : Win32.LPCSTR;
                           lpszDst : Win32.LPSTR;
                           cchDstLength : Win32.DWORD)
                          return Win32.BOOL
     renames CharToOemBuffA;
   --  winuser.h:2700

   function CharToOemBuffW (lpszSrc : Win32.LPCWSTR;
                            lpszDst : Win32.LPSTR;
                            cchDstLength : Win32.DWORD)
                           return Win32.BOOL;
   --  winuser.h:2707

   function OemToCharBuffA (lpszSrc : Win32.LPCSTR;
                            lpszDst : Win32.LPSTR;
                            cchDstLength : Win32.DWORD)
                           return Win32.BOOL;
   --  winuser.h:2720

   function OemToAnsiBuff (lpszSrc : Win32.LPCSTR;
                           lpszDst : Win32.LPSTR;
                           cchDstLength : Win32.DWORD)
                          return Win32.BOOL
     renames OemToCharBuffA;
   --  winuser.h:2720

   function OemToCharBuff (lpszSrc : Win32.LPCSTR;
                           lpszDst : Win32.LPSTR;
                           cchDstLength : Win32.DWORD)
                          return Win32.BOOL
     renames OemToCharBuffA;
   --  winuser.h:2720

   function OemToCharBuffW (lpszSrc : Win32.LPCSTR;
                            lpszDst : Win32.LPWSTR;
                            cchDstLength : Win32.DWORD)
                           return Win32.BOOL;
   --  winuser.h:2727

   function CharUpperA (lpsz : Win32.LPSTR) return Win32.LPSTR;
   --  winuser.h:2740

   function AnsiUpper (lpsz : Win32.LPSTR) return Win32.LPSTR
     renames CharUpperA;
   --  winuser.h:2740

   function CharUpper (lpsz : Win32.LPSTR) return Win32.LPSTR
     renames CharUpperA;
   --  winuser.h:2740

   function CharUpperW (lpsz : Win32.LPWSTR) return Win32.LPWSTR;
   --  winuser.h:2745

   function CharUpperBuffA (lpsz : Win32.LPSTR;
                            cchLength : Win32.DWORD)
                           return Win32.DWORD;
   --  winuser.h:2756

   function AnsiUpperBuff (lpsz : Win32.LPSTR;
                           cchLength : Win32.DWORD)
                          return Win32.DWORD
     renames CharUpperBuffA;
   --  winuser.h:2756

   function CharUpperBuff (lpsz : Win32.LPSTR;
                           cchLength : Win32.DWORD)
                          return Win32.DWORD
     renames CharUpperBuffA;
   --  winuser.h:2756

   function CharUpperBuffW (lpsz : Win32.LPWSTR;
                            cchLength : Win32.DWORD)
                           return Win32.DWORD;
   --  winuser.h:2762

   function CharLowerA (lpsz : Win32.LPSTR) return Win32.LPSTR;
   --  winuser.h:2774

   function AnsiLower (lpsz : Win32.LPSTR) return Win32.LPSTR
     renames CharLowerA;
   --  winuser.h:2774

   function CharLower (lpsz : Win32.LPSTR) return Win32.LPSTR
     renames CharLowerA;
   --  winuser.h:2774

   function CharLowerW (lpsz : Win32.LPWSTR) return Win32.LPWSTR;
   --  winuser.h:2779

   function CharLowerBuffA (lpsz : Win32.LPSTR;
                            cchLength : Win32.DWORD)
                           return Win32.DWORD;
   --  winuser.h:2790

   function AnsiLowerBuff (lpsz : Win32.LPSTR;
                           cchLength : Win32.DWORD)
                          return Win32.DWORD
     renames CharLowerBuffA;
   --  winuser.h:2790

   function CharLowerBuff (lpsz : Win32.LPSTR;
                           cchLength : Win32.DWORD)
                          return Win32.DWORD
     renames CharLowerBuffA;
   --  winuser.h:2790

   function CharLowerBuffW (lpsz : Win32.LPWSTR;
                            cchLength : Win32.DWORD)
                           return Win32.DWORD;
   --  winuser.h:2796

   function CharNextA (lpsz : Win32.LPCSTR) return Win32.LPSTR;
   --  winuser.h:2808

   function AnsiNext (lpsz : Win32.LPCSTR) return Win32.LPSTR
     renames CharNextA;
   --  winuser.h:2808

   function CharNext (lpsz : Win32.LPCSTR) return Win32.LPSTR
     renames CharNextA;
   --  winuser.h:2808

   function CharNextW (lpsz : Win32.LPCWSTR) return Win32.LPWSTR;
   --  winuser.h:2813

   function CharPrevA (lpszStart : Win32.LPCSTR;
                       lpszCurrent : Win32.LPCSTR)
                      return Win32.LPSTR;     --  winuser.h:2824

   function AnsiPrev (lpszStart : Win32.LPCSTR;
                      lpszCurrent : Win32.LPCSTR)
                     return Win32.LPSTR
     renames CharPrevA;       --  winuser.h:2824

   function CharPrev (lpszStart : Win32.LPCSTR;
                      lpszCurrent : Win32.LPCSTR)
                     return Win32.LPSTR
     renames CharPrevA;       --  winuser.h:2824

   function CharPrevW (lpszStart : Win32.LPCWSTR;
                       lpszCurrent : Win32.LPCWSTR)
                      return Win32.LPWSTR;    --  winuser.h:2830

   function IsCharAlphaA (ch : Win32.CHAR) return Win32.BOOL;
   --  winuser.h:2861

   function IsCharAlpha (ch : Win32.CHAR) return Win32.BOOL
     renames IsCharAlphaA;
   --  winuser.h:2861

   function IsCharAlphaW (ch : Win32.WCHAR) return Win32.BOOL;
   --  winuser.h:2866

   function IsCharAlphaNumericA (ch : Win32.CHAR) return Win32.BOOL;
   --  winuser.h:2877

   function IsCharAlphaNumeric (ch : Win32.CHAR) return Win32.BOOL
     renames IsCharAlphaNumericA;                        --  winuser.h:2877

   function IsCharAlphaNumericW (ch : Win32.WCHAR) return Win32.BOOL;
   --  winuser.h:2882

   function IsCharUpperA (ch : Win32.CHAR) return Win32.BOOL;
   --  winuser.h:2893

   function IsCharUpper (ch : Win32.CHAR) return Win32.BOOL
     renames IsCharUpperA;
   --  winuser.h:2893

   function IsCharUpperW (ch : Win32.WCHAR) return Win32.BOOL;
   --  winuser.h:2898

   function IsCharLowerA (ch : Win32.CHAR) return Win32.BOOL;
   --  winuser.h:2909

   function IsCharLower (ch : Win32.CHAR) return Win32.BOOL
     renames IsCharLowerA;
   --  winuser.h:2909

   function IsCharLowerW (ch : Win32.WCHAR) return Win32.BOOL;
   --  winuser.h:2914

   function SetFocus (hWnd : Win32.Windef.HWND) return Win32.Windef.HWND;
   --  winuser.h:2927

   function GetActiveWindow return Win32.Windef.HWND;      --  winuser.h:2933

   function GetFocus return Win32.Windef.HWND;             --  winuser.h:2939

   function GetKBCodePage return Win32.UINT;               --  winuser.h:2945

   function GetKeyState (nVirtKey : Win32.INT) return Win32.SHORT;
   --  winuser.h:2951

   function GetAsyncKeyState (vKey : Win32.INT) return Win32.SHORT;
   --  winuser.h:2957

   function GetKeyboardState (lpKeyState : Win32.PBYTE) return Win32.BOOL;
   --  winuser.h:2963

   function SetKeyboardState (lpKeyState : Win32.LPBYTE) return Win32.BOOL;
   --  winuser.h:2969

   function GetKeyNameTextA (lParam : Win32.LONG;
                             lpString : Win32.LPSTR;
                             nSize : Win32.INT)
                            return Win32.INT;
   --  winuser.h:2975

   function GetKeyNameText (lParam : Win32.LONG;
                            lpString : Win32.LPSTR;
                            nSize : Win32.INT)
                           return Win32.INT
     renames GetKeyNameTextA;
   --  winuser.h:2975

   function GetKeyNameTextW (lParam : Win32.LONG;
                             lpString : Win32.LPWSTR;
                             nSize : Win32.INT)
                            return Win32.INT;
   --  winuser.h:2983

   function GetKeyboardType (nTypeFlag : Win32.INT) return Win32.INT;
   --  winuser.h:2997

   function ToAscii (uVirtKey : Win32.UINT;
                     uScanCode : Win32.UINT;
                     lpKeyState : Win32.PBYTE;
                     lpChar : Win32.LPWORD;
                     uFlags : Win32.UINT)
                    return Win32.INT;          --  winuser.h:3003

   function ToUnicode (wVirtKey : Win32.UINT;
                       wScanCode : Win32.UINT;
                       lpKeyState : Win32.PBYTE;
                       pwszBuff : Win32.LPWSTR;
                       cchBuff : Win32.INT;
                       wFlags : Win32.UINT)
                      return Win32.INT;        --  winuser.h:3014

   function OemKeyScan (wOemChar : Win32.WORD) return Win32.DWORD;
   --  winuser.h:3025

   function VkKeyScanA (ch : Win32.CHAR) return Win32.SHORT;
   --  winuser.h:3031

   function VkKeyScan (ch : Win32.CHAR) return Win32.SHORT
     renames VkKeyScanA;
   --  winuser.h:3031

   function VkKeyScanW (ch : Win32.WCHAR) return Win32.SHORT;
   --  winuser.h:3036

   procedure keybd_event (bVk : Win32.BYTE;
                          bScan : Win32.BYTE;
                          dwFlags : Win32.DWORD;
                          dwExtraInfo : Win32.DWORD);        --  winuser.h:3050

   procedure mouse_event (dwFlags : Win32.DWORD;
                          dx : Win32.DWORD;
                          dy : Win32.DWORD;
                          cButtons : Win32.DWORD;
                          dwExtraInfo : Win32.DWORD);        --  winuser.h:3068

   function MapVirtualKeyA (uCode : Win32.UINT;
                            uMapType : Win32.UINT)
                           return Win32.UINT;    --  winuser.h:3078

   function MapVirtualKey (uCode : Win32.UINT;
                           uMapType : Win32.UINT)
                          return Win32.UINT
     renames MapVirtualKeyA;
   --  winuser.h:3078

   function MapVirtualKeyW (uCode : Win32.UINT;
                            uMapType : Win32.UINT)
                           return Win32.UINT;    --  winuser.h:3084

   function GetInputState return Win32.BOOL;               --  winuser.h:3097

   function GetQueueStatus (flags : Win32.UINT) return Win32.DWORD;
   --  winuser.h:3103

   function GetCapture return Win32.Windef.HWND;           --  winuser.h:3109

   function SetCapture (hWnd : Win32.Windef.HWND) return Win32.Windef.HWND;
   --  winuser.h:3115

   function ReleaseCapture return Win32.BOOL;              --  winuser.h:3121

   function MsgWaitForMultipleObjects (nCount : Win32.DWORD;
                                       pHandles : Win32.Windef.LPHANDLE;
                                       fWaitAll : Win32.BOOL;
                                       dwMilliseconds : Win32.DWORD;
                                       dwWakeMask : Win32.DWORD)
                                      return Win32.DWORD;
   --  winuser.h:3127

   function SetTimer (hWnd : Win32.Windef.HWND;
                      nIDEvent : Win32.UINT;
                      uElapse : Win32.UINT;
                      lpTimerFunc : TIMERPROC)
                     return Win32.UINT;       --  winuser.h:3175

   function KillTimer (hWnd : Win32.Windef.HWND;
                       uIDEvent : Win32.UINT)
                      return Win32.BOOL;         --  winuser.h:3184

   function IsWindowUnicode (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:3191

   function EnableWindow (hWnd : Win32.Windef.HWND;
                          bEnable : Win32.BOOL)
                         return Win32.BOOL;       --  winuser.h:3197

   function IsWindowEnabled (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:3204

   function LoadAcceleratorsA (hInstance : Win32.Windef.HINSTANCE;
                               lpTableName : Win32.LPCSTR)
                              return Win32.Windef.HACCEL;
   --  winuser.h:3210

   function LoadAccelerators (hInstance : Win32.Windef.HINSTANCE;
                              lpTableName : Win32.LPCSTR)
                             return Win32.Windef.HACCEL
     renames LoadAcceleratorsA;
   --  winuser.h:3210

   function LoadAcceleratorsW (hInstance : Win32.Windef.HINSTANCE;
                               lpTableName : Win32.LPCWSTR)
                              return Win32.Windef.HACCEL;
   --  winuser.h:3216

   function CreateAcceleratorTableA (lpaccl : LPACCEL;
                                     cEntries : Win32.INT)
                                    return Win32.Windef.HACCEL;
   --  winuser.h:3228

   function CreateAcceleratorTable (lpaccl : LPACCEL;
                                    cEntries : Win32.INT)
                                   return Win32.Windef.HACCEL
     renames CreateAcceleratorTableA;
   --  winuser.h:3228

   function CreateAcceleratorTableW (lpaccl : LPACCEL;
                                     cEntries : Win32.INT)
                                    return Win32.Windef.HACCEL;
   --  winuser.h:3233

   function DestroyAcceleratorTable (hAccel : Win32.Windef.HACCEL)
      return Win32.BOOL;                                  --  winuser.h:3244

   function CopyAcceleratorTableA (hAccelSrc : Win32.Windef.HACCEL;
                                   lpAccelDst : access ACCEL;
                                   cAccelEntries : Win32.INT)
      return Win32.INT;
   --  winuser.h:3250

   function CopyAcceleratorTable (hAccelSrc : Win32.Windef.HACCEL;
                                  lpAccelDst : access ACCEL;
                                  cAccelEntries : Win32.INT)
                                 return Win32.INT
     renames CopyAcceleratorTableA;
   --  winuser.h:3250

   function CopyAcceleratorTableW (hAccelSrc : Win32.Windef.HACCEL;
                                   lpAccelDst : access ACCEL;
                                   cAccelEntries : Win32.INT)
                                  return Win32.INT;
   --  winuser.h:3257

   function TranslateAcceleratorA (hWnd : Win32.Windef.HWND;
                                   hAccTable : Win32.Windef.HACCEL;
                                   lpMsg : access MSG)
                                  return Win32.INT;
   --  winuser.h:3272

   function TranslateAccelerator (hWnd : Win32.Windef.HWND;
                                  hAccTable : Win32.Windef.HACCEL;
                                  lpMsg : access MSG)
                                 return Win32.INT
     renames TranslateAcceleratorA;
   --  winuser.h:3272

   function TranslateAcceleratorW (hWnd : Win32.Windef.HWND;
                                   hAccTable : Win32.Windef.HACCEL;
                                   lpMsg : access MSG)
                                  return Win32.INT;
   --  winuser.h:3279

   function GetSystemMetrics (nIndex : Win32.INT) return Win32.INT;
   --  winuser.h:3348

   function LoadMenuA (hInstance : Win32.Windef.HINSTANCE;
                       lpMenuName : Win32.LPCSTR)
                      return Win32.Windef.HMENU;
   --  winuser.h:3358

   function LoadMenu (hInstance : Win32.Windef.HINSTANCE;
                      lpMenuName : Win32.LPCSTR)
                     return Win32.Windef.HMENU
     renames LoadMenuA;        --  winuser.h:3358

   function LoadMenuW (hInstance : Win32.Windef.HINSTANCE;
                       lpMenuName : Win32.LPCWSTR)
                      return Win32.Windef.HMENU;
   --  winuser.h:3364

   function LoadMenuIndirectA (lpMenuTemplate : Win32.PCVOID)
      return Win32.Windef.HMENU;                          --  winuser.h:3376

   function LoadMenuIndirect (lpMenuTemplate : Win32.PCVOID)
                             return Win32.Windef.HMENU
     renames LoadMenuIndirectA;                          --  winuser.h:3376

   function LoadMenuIndirectW (lpMenuTemplate : Win32.PCVOID)
      return Win32.Windef.HMENU;                          --  winuser.h:3381

   function GetMenu (hWnd : Win32.Windef.HWND) return Win32.Windef.HMENU;
   --  winuser.h:3392

   function SetMenu (hWnd : Win32.Windef.HWND;
                     hMenu : Win32.Windef.HMENU)
                    return Win32.BOOL;              --  winuser.h:3398

   function ChangeMenuA (hMenu : Win32.Windef.HMENU;
                         cmd : Win32.UINT;
                         lpszNewItem : Win32.LPCSTR;
                         cmdInsert : Win32.UINT;
                         flags : Win32.UINT)
                        return Win32.BOOL;    --  winuser.h:3405

   function ChangeMenu (hMenu : Win32.Windef.HMENU;
                        cmd : Win32.UINT;
                        lpszNewItem : Win32.LPCSTR;
                        cmdInsert : Win32.UINT;
                        flags : Win32.UINT)
                       return Win32.BOOL
     renames ChangeMenuA;   --  winuser.h:3405

   function ChangeMenuW (hMenu : Win32.Windef.HMENU;
                         cmd : Win32.UINT;
                         lpszNewItem : Win32.LPCWSTR;
                         cmdInsert : Win32.UINT;
                         flags : Win32.UINT)
                        return Win32.BOOL;    --  winuser.h:3414

   function HiliteMenuItem (hWnd : Win32.Windef.HWND;
                            hMenu : Win32.Windef.HMENU;
                            uIDHiliteItem : Win32.UINT;
                            uHilite : Win32.UINT)
                           return Win32.BOOL;
   --  winuser.h:3429

   function GetMenuStringA (hMenu : Win32.Windef.HMENU;
                            uIDItem : Win32.UINT;
                            lpString : Win32.LPSTR;
                            nMaxCount : Win32.INT;
                            uFlag : Win32.UINT)
                           return Win32.INT;
   --  winuser.h:3438

   function GetMenuString (hMenu : Win32.Windef.HMENU;
                           uIDItem : Win32.UINT;
                           lpString : Win32.LPSTR;
                           nMaxCount : Win32.INT;
                           uFlag : Win32.UINT)
                          return Win32.INT
     renames GetMenuStringA;
   --  winuser.h:3438

   function GetMenuStringW (hMenu : Win32.Windef.HMENU;
                            uIDItem : Win32.UINT;
                            lpString : Win32.LPWSTR;
                            nMaxCount : Win32.INT;
                            uFlag : Win32.UINT)
                           return Win32.INT;
   --  winuser.h:3447

   function GetMenuState (hMenu : Win32.Windef.HMENU;
                          uId : Win32.UINT;
                          uFlags : Win32.UINT)
                         return Win32.UINT;        --  winuser.h:3462

   function DrawMenuBar (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:3470

   function GetSystemMenu (hWnd : Win32.Windef.HWND;
                           bRevert : Win32.BOOL)
                          return Win32.Windef.HMENU;
   --  winuser.h:3477

   function CreateMenu return Win32.Windef.HMENU;          --  winuser.h:3486

   function CreatePopupMenu return Win32.Windef.HMENU;     --  winuser.h:3492

   function DestroyMenu (hMenu : Win32.Windef.HMENU) return Win32.BOOL;
   --  winuser.h:3498

   function CheckMenuItem (hMenu : Win32.Windef.HMENU;
                           uIDCheckItem : Win32.UINT;
                           uCheck : Win32.UINT)
                          return Win32.DWORD;
   --  winuser.h:3504

   function EnableMenuItem (hMenu : Win32.Windef.HMENU;
                            uIDEnableItem : Win32.UINT;
                            uEnable : Win32.UINT)
                           return Win32.BOOL;
   --  winuser.h:3512

   function GetSubMenu (hMenu : Win32.Windef.HMENU;
                        nPos : Win32.INT)
                       return Win32.Windef.HMENU;   --  winuser.h:3520

   function GetMenuItemID (hMenu : Win32.Windef.HMENU;
                           nPos : Win32.INT)
                          return Win32.UINT;        --  winuser.h:3527

   function GetMenuItemCount (hMenu : Win32.Windef.HMENU) return Win32.INT;
   --  winuser.h:3534

   function InsertMenuA (hMenu : Win32.Windef.HMENU;
                         uPosition : Win32.UINT;
                         uFlags : Win32.UINT;
                         uIDNewItem : Win32.UINT;
                         lpNewItem : Win32.LPCSTR)
                        return Win32.BOOL;     --  winuser.h:3540

   function InsertMenu (hMenu : Win32.Windef.HMENU;
                        uPosition : Win32.UINT;
                        uFlags : Win32.UINT;
                        uIDNewItem : Win32.UINT;
                        lpNewItem : Win32.LPCSTR)
                       return Win32.BOOL
     renames InsertMenuA;    --  winuser.h:3540

   function InsertMenuW (hMenu : Win32.Windef.HMENU;
                         uPosition : Win32.UINT;
                         uFlags : Win32.UINT;
                         uIDNewItem : Win32.UINT;
                         lpNewItem : Win32.LPCWSTR)
                        return Win32.BOOL;     --  winuser.h:3550

   function AppendMenuA (hMenu : Win32.Windef.HMENU;
                         uFlags : Win32.UINT;
                         uIDNewItem : Win32.UINT;
                         lpNewItem : Win32.LPCSTR)
                        return Win32.BOOL;     --  winuser.h:3566

   function AppendMenu (hMenu : Win32.Windef.HMENU;
                        uFlags : Win32.UINT;
                        uIDNewItem : Win32.UINT;
                        lpNewItem : Win32.LPCSTR)
                       return Win32.BOOL
     renames AppendMenuA;    --  winuser.h:3566

   function AppendMenuW (hMenu : Win32.Windef.HMENU;
                         uFlags : Win32.UINT;
                         uIDNewItem : Win32.UINT;
                         lpNewItem : Win32.LPCWSTR)
                        return Win32.BOOL;     --  winuser.h:3575

   function ModifyMenuA (hMnu : Win32.Windef.HMENU;
                         uPosition : Win32.UINT;
                         uFlags : Win32.UINT;
                         uIDNewItem : Win32.UINT;
                         lpNewItem : Win32.LPCSTR)
                        return Win32.BOOL;     --  winuser.h:3590

   function ModifyMenu (hMnu : Win32.Windef.HMENU;
                        uPosition : Win32.UINT;
                        uFlags : Win32.UINT;
                        uIDNewItem : Win32.UINT;
                        lpNewItem : Win32.LPCSTR)
                       return Win32.BOOL
     renames ModifyMenuA;    --  winuser.h:3590

   function ModifyMenuW (hMnu : Win32.Windef.HMENU;
                         uPosition : Win32.UINT;
                         uFlags : Win32.UINT;
                         uIDNewItem : Win32.UINT;
                         lpNewItem : Win32.LPCWSTR)
                        return Win32.BOOL;     --  winuser.h:3600

   function RemoveMenu (hMenu : Win32.Windef.HMENU;
                        uPosition : Win32.UINT;
                        uFlags : Win32.UINT)
                       return Win32.BOOL;       --  winuser.h:3615

   function DeleteMenu (hMenu : Win32.Windef.HMENU;
                        uPosition : Win32.UINT;
                        uFlags : Win32.UINT)
                       return Win32.BOOL;       --  winuser.h:3623

   function SetMenuItemBitmaps (hMenu : Win32.Windef.HMENU;
                                uPosition : Win32.UINT;
                                uFlags : Win32.UINT;
                                hBitmapUnchecked : Win32.Windef.HBITMAP;
                                hBitmapChecked : Win32.Windef.HBITMAP)
                               return Win32.BOOL;
   --  winuser.h:3631

   function GetMenuCheckMarkDimensions return Win32.LONG;
   --  winuser.h:3641

   function TrackPopupMenu (hMenu : Win32.Windef.HMENU;
                            uFlags : Win32.UINT;
                            x : Win32.INT;
                            y : Win32.INT;
                            nReserved : Win32.INT;
                            hWnd : Win32.Windef.HWND;
                            prcRect : Win32.Wingdi.ac_RECT_t)
                           return Win32.BOOL;
   --  winuser.h:3647

   function DrawIcon (hDC : Win32.Windef.HDC;
                      X : Win32.INT;
                      Y : Win32.INT;
                      hIcon : Win32.Windef.HICON)
                     return Win32.BOOL;             --  winuser.h:3672

   function DrawTextA (hDC : Win32.Windef.HDC;
                       lpString : Win32.LPCSTR;
                       nCount : Win32.INT;
                       lpRect : Win32.Windef.LPRECT;
                       uFormat : Win32.UINT)
                      return Win32.INT;          --  winuser.h:3707

   function DrawText (hDC : Win32.Windef.HDC;
                      lpString : Win32.LPCSTR;
                      nCount : Win32.INT;
                      lpRect : Win32.Windef.LPRECT;
                      uFormat : Win32.UINT)
                     return Win32.INT
     renames DrawTextA;          --  winuser.h:3707

   function DrawTextW (hDC : Win32.Windef.HDC;
                       lpString : Win32.LPCWSTR;
                       nCount : Win32.INT;
                       lpRect : Win32.Windef.LPRECT;
                       uFormat : Win32.UINT)
                      return Win32.INT;          --  winuser.h:3716

   function GrayStringA (hDC : Win32.Windef.HDC;
                         hBrush : Win32.Windef.HBRUSH;
                         lpOutputFunc : GRAYSTRINGPROC;
                         lpData : Win32.LPARAM;
                         nCount : Win32.INT;
                         X : Win32.INT;
                         Y : Win32.INT;
                         nWidth : Win32.INT;
                         nHeight : Win32.INT)
                        return Win32.BOOL;
   --  winuser.h:3735

   function GrayString (hDC : Win32.Windef.HDC;
                        hBrush : Win32.Windef.HBRUSH;
                        lpOutputFunc : GRAYSTRINGPROC;
                        lpData : Win32.LPARAM;
                        nCount : Win32.INT;
                        X : Win32.INT;
                        Y : Win32.INT;
                        nWidth : Win32.INT;
                        nHeight : Win32.INT)
                       return Win32.BOOL
     renames GrayStringA;  --  winuser.h:3735

   function GrayStringW (hDC : Win32.Windef.HDC;
                         hBrush : Win32.Windef.HBRUSH;
                         lpOutputFunc : GRAYSTRINGPROC;
                         lpData : Win32.LPARAM;
                         nCount : Win32.INT;
                         X : Win32.INT;
                         Y : Win32.INT;
                         nWidth : Win32.INT;
                         nHeight : Win32.INT)
                        return Win32.BOOL;
   --  winuser.h:3748

   function TabbedTextOutA (hDC : Win32.Windef.HDC;
                            X : Win32.INT;
                            Y : Win32.INT;
                            lpString : Win32.LPCSTR;
                            nCount : Win32.INT;
                            nTabPositions : Win32.INT;
                            lpnTabStopPositions : Win32.LPINT;
                            nTabOrigin : Win32.INT)
                           return Win32.LONG;
   --  winuser.h:3769

   function TabbedTextOut (hDC : Win32.Windef.HDC;
                           X : Win32.INT;
                           Y : Win32.INT;
                           lpString : Win32.LPCSTR;
                           nCount : Win32.INT;
                           nTabPositions : Win32.INT;
                           lpnTabStopPositions : Win32.LPINT;
                           nTabOrigin : Win32.INT)
                          return Win32.LONG
     renames TabbedTextOutA;
   --  winuser.h:3769

   function TabbedTextOutW (hDC : Win32.Windef.HDC;
                            X : Win32.INT;
                            Y : Win32.INT;
                            lpString : Win32.LPCWSTR;
                            nCount : Win32.INT;
                            nTabPositions : Win32.INT;
                            lpnTabStopPositions : Win32.LPINT;
                            nTabOrigin : Win32.INT)
                           return Win32.LONG;
   --  winuser.h:3781

   function GetTabbedTextExtentA (hDC : Win32.Windef.HDC;
                                  lpString : Win32.LPCSTR;
                                  nCount : Win32.INT;
                                  nTabPositions : Win32.INT;
                                  lpnTabStopPositions : Win32.LPINT)
                                 return Win32.DWORD;
   --  winuser.h:3799

   function GetTabbedTextExtent
     (hDC : Win32.Windef.HDC;
      lpString : Win32.LPCSTR;
      nCount : Win32.INT;
      nTabPositions : Win32.INT;
      lpnTabStopPositions : Win32.LPINT)
     return Win32.DWORD
     renames GetTabbedTextExtentA;
   --  winuser.h:3799

   function GetTabbedTextExtentW (hDC : Win32.Windef.HDC;
                                  lpString : Win32.LPCWSTR;
                                  nCount : Win32.INT;
                                  nTabPositions : Win32.INT;
                                  lpnTabStopPositions : Win32.LPINT)
                                 return Win32.DWORD;
   --  winuser.h:3808

   function UpdateWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:3823

   function SetActiveWindow (hWnd : Win32.Windef.HWND)
                            return Win32.Windef.HWND;
   --  winuser.h:3829

   function GetForegroundWindow return Win32.Windef.HWND;  --  winuser.h:3835

   function SetForegroundWindow (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:3842

   function WindowFromDC (hDC : Win32.Windef.HDC) return Win32.Windef.HWND;
   --  winuser.h:3848

   function GetDC (hWnd : Win32.Windef.HWND) return Win32.Windef.HDC;
   --  winuser.h:3854

   function GetDCEx (hWnd : Win32.Windef.HWND;
                     hrgnClip : Win32.Windef.HRGN;
                     flags : Win32.DWORD)
                    return Win32.Windef.HDC;     --  winuser.h:3860

   function GetWindowDC (hWnd : Win32.Windef.HWND) return Win32.Windef.HDC;
   --  winuser.h:3891

   function ReleaseDC (hWnd : Win32.Windef.HWND;
                       hDC : Win32.Windef.HDC)
                      return Win32.INT;              --  winuser.h:3897

   function BeginPaint (hWnd : Win32.Windef.HWND;
                        lpPaint : access PAINTSTRUCT)
                       return Win32.Windef.HDC;   --  winuser.h:3904

   function EndPaint (hWnd : Win32.Windef.HWND;
                      lpPaint : access PAINTSTRUCT)
                     return Win32.BOOL;           --  winuser.h:3911

   function GetUpdateRect (hWnd : Win32.Windef.HWND;
                           lpRect : Win32.Windef.LPRECT;
                           bErase : Win32.BOOL)
                          return Win32.BOOL;       --  winuser.h:3918

   function GetUpdateRgn (hWnd : Win32.Windef.HWND;
                          hRgn : Win32.Windef.HRGN;
                          bErase : Win32.BOOL)
                         return Win32.INT;         --  winuser.h:3926

   function ExcludeUpdateRgn (hDC : Win32.Windef.HDC;
                              hWnd : Win32.Windef.HWND)
                             return Win32.INT;       --  winuser.h:3934

   function InvalidateRect (hWnd : Win32.Windef.HWND;
                            lpRect : Win32.Wingdi.ac_RECT_t;
                            bErase : Win32.BOOL)
                           return Win32.BOOL;      --  winuser.h:3941

   function ValidateRect (hWnd : Win32.Windef.HWND;
                          lpRect : Win32.Wingdi.ac_RECT_t)
                         return Win32.BOOL;        --  winuser.h:3949

   function InvalidateRgn (hWnd : Win32.Windef.HWND;
                           hRgn : Win32.Windef.HRGN;
                           bErase : Win32.BOOL)
                          return Win32.BOOL;       --  winuser.h:3956

   function ValidateRgn (hWnd : Win32.Windef.HWND;
                         hRgn : Win32.Windef.HRGN)
                        return Win32.BOOL;           --  winuser.h:3964

   function RedrawWindow (hWnd : Win32.Windef.HWND;
                          lprcUpdate : Win32.Wingdi.ac_RECT_t;
                          hrgnUpdate : Win32.Windef.HRGN;
                          flags : Win32.UINT)
                         return Win32.BOOL;    --  winuser.h:3972

   function LockWindowUpdate (hWndLock : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:4007

   function ScrollWindow (hWnd : Win32.Windef.HWND;
                          XAMOUNT : Win32.INT;
                          YAMOUNT : Win32.INT;
                          lpRect : Win32.Wingdi.ac_RECT_t;
                          lpClipRect : Win32.Wingdi.ac_RECT_t)
                         return Win32.BOOL;    --  winuser.h:4013

   function ScrollDC (hDC : Win32.Windef.HDC;
                      dx : Win32.INT;
                      dy : Win32.INT;
                      lprcScroll : Win32.Wingdi.ac_RECT_t;
                      lprcClip : Win32.Wingdi.ac_RECT_t;
                      hrgnUpdate : Win32.Windef.HRGN;
                      lprcUpdate : Win32.Windef.LPRECT)
                     return Win32.BOOL;        --  winuser.h:4023

   function ScrollWindowEx (hWnd : Win32.Windef.HWND;
                            dx : Win32.INT;
                            dy : Win32.INT;
                            prcScroll : Win32.Wingdi.ac_RECT_t;
                            prcClip : Win32.Wingdi.ac_RECT_t;
                            hrgnUpdate : Win32.Windef.HRGN;
                            prcUpdate : Win32.Windef.LPRECT;
                            flags : Win32.UINT)
                           return Win32.INT;
   --  winuser.h:4035

   function SetScrollPos (hWnd : Win32.Windef.HWND;
                          nBar : Win32.INT;
                          nPos : Win32.INT;
                          bRedraw : Win32.BOOL)
                         return Win32.INT;        --  winuser.h:4056

   function GetScrollPos (hWnd : Win32.Windef.HWND;
                          nBar : Win32.INT)
                         return Win32.INT;           --  winuser.h:4065

   function SetScrollRange (hWnd : Win32.Windef.HWND;
                            nBar : Win32.INT;
                            nMinPos : Win32.INT;
                            nMaxPos : Win32.INT;
                            bRedraw : Win32.BOOL)
                           return Win32.BOOL;     --  winuser.h:4072

   function GetScrollRange (hWnd : Win32.Windef.HWND;
                            nBar : Win32.INT;
                            lpMinPos : Win32.LPINT;
                            lpMaxPos : Win32.LPINT)
                           return Win32.BOOL;    --  winuser.h:4082

   function ShowScrollBar (hWnd : Win32.Windef.HWND;
                           wBar : Win32.INT;
                           bShow : Win32.BOOL)
                          return Win32.BOOL;        --  winuser.h:4092

   function EnableScrollBar (hWnd : Win32.Windef.HWND;
                             wSBflags : Win32.UINT;
                             wArrows : Win32.UINT)
                            return Win32.BOOL;
   --  winuser.h:4100

   function SetPropA (hWnd : Win32.Windef.HWND;
                      lpString : Win32.LPCSTR;
                      hData : Win32.Winnt.HANDLE)
                     return Win32.BOOL;          --  winuser.h:4127

   function SetProp (hWnd : Win32.Windef.HWND;
                     lpString : Win32.LPCSTR;
                     hData : Win32.Winnt.HANDLE)
                    return Win32.BOOL
     renames SetPropA;            --  winuser.h:4127

   function SetPropW (hWnd : Win32.Windef.HWND;
                      lpString : Win32.LPCWSTR;
                      hData : Win32.Winnt.HANDLE)
                     return Win32.BOOL;          --  winuser.h:4134

   function GetPropA (hWnd : Win32.Windef.HWND;
                      lpString : Win32.LPCSTR)
                     return Win32.Winnt.HANDLE;
   --  winuser.h:4147

   function GetProp (hWnd : Win32.Windef.HWND;
                     lpString : Win32.LPCSTR)
                    return Win32.Winnt.HANDLE
     renames GetPropA;            --  winuser.h:4147

   function GetPropW (hWnd : Win32.Windef.HWND;
                      lpString : Win32.LPCWSTR)
                     return Win32.Winnt.HANDLE;
   --  winuser.h:4153

   function RemovePropA (hWnd : Win32.Windef.HWND;
                         lpString : Win32.LPCSTR)
                        return Win32.Winnt.HANDLE;
   --  winuser.h:4165

   function RemoveProp (hWnd : Win32.Windef.HWND;
                        lpString : Win32.LPCSTR)
                       return Win32.Winnt.HANDLE
     renames RemovePropA;      --  winuser.h:4165

   function RemovePropW (hWnd : Win32.Windef.HWND;
                         lpString : Win32.LPCWSTR)
                        return Win32.Winnt.HANDLE;
   --  winuser.h:4171

   function EnumPropsExA (hWnd : Win32.Windef.HWND;
                          lpEnumFunc : PROPENUMPROCEXA;
                          lParam : Win32.LPARAM)
                         return Win32.INT;
   --  winuser.h:4183

   function EnumPropsEx (hWnd : Win32.Windef.HWND;
                         lpEnumFunc : PROPENUMPROCEXA;
                         lParam : Win32.LPARAM)
                        return Win32.INT
     renames EnumPropsExA;
   --  winuser.h:4183

   function EnumPropsExW (hWnd : Win32.Windef.HWND;
                          lpEnumFunc : PROPENUMPROCEXW;
                          lParam : Win32.LPARAM)
                         return Win32.INT;
   --  winuser.h:4190

   function EnumPropsA (hWnd : Win32.Windef.HWND;
                        lpEnumFunc : PROPENUMPROCA)
                       return Win32.INT;       --  winuser.h:4203

   function EnumProps (hWnd : Win32.Windef.HWND;
                       lpEnumFunc : PROPENUMPROCA)
                      return Win32.INT
     renames EnumPropsA;      --  winuser.h:4203

   function EnumPropsW (hWnd : Win32.Windef.HWND;
                        lpEnumFunc : PROPENUMPROCW)
                       return Win32.INT;       --  winuser.h:4209

   function SetWindowTextA (hWnd : Win32.Windef.HWND;
                            lpString : Win32.LPCSTR)
                           return Win32.BOOL;    --  winuser.h:4221

   function SetWindowText (hWnd : Win32.Windef.HWND;
                           lpString : Win32.LPCSTR)
                          return Win32.BOOL
     renames SetWindowTextA;
   --  winuser.h:4221

   function SetWindowTextW (hWnd : Win32.Windef.HWND;
                            lpString : Win32.LPCWSTR)
                           return Win32.BOOL;    --  winuser.h:4227

   function GetWindowTextA (hWnd : Win32.Windef.HWND;
                            lpString : Win32.LPSTR;
                            nMaxCount : Win32.INT)
                           return Win32.INT;
   --  winuser.h:4239

   function GetWindowText (hWnd : Win32.Windef.HWND;
                           lpString : Win32.LPSTR;
                           nMaxCount : Win32.INT)
                          return Win32.INT
     renames GetWindowTextA;
   --  winuser.h:4239

   function GetWindowTextW (hWnd : Win32.Windef.HWND;
                            lpString : Win32.LPWSTR;
                            nMaxCount : Win32.INT)
                           return Win32.INT;
   --  winuser.h:4246

   function GetWindowTextLengthA (hWnd : Win32.Windef.HWND) return Win32.INT;
   --  winuser.h:4259

   function GetWindowTextLength (hWnd : Win32.Windef.HWND) return Win32.INT
     renames GetWindowTextLengthA;                       --  winuser.h:4259

   function GetWindowTextLengthW (hWnd : Win32.Windef.HWND) return Win32.INT;
   --  winuser.h:4264

   function GetClientRect (hWnd : Win32.Windef.HWND;
                           lpRect : Win32.Windef.LPRECT)
                          return Win32.BOOL;       --  winuser.h:4275

   function GetWindowRect (hWnd : Win32.Windef.HWND;
                           lpRect : Win32.Windef.LPRECT)
                          return Win32.BOOL;       --  winuser.h:4282

   function AdjustWindowRect (lpRect : Win32.Windef.LPRECT;
                              dwStyle : Win32.DWORD;
                              bMenu : Win32.BOOL)
                             return Win32.BOOL;
   --  winuser.h:4289

   function AdjustWindowRectEx (lpRect : Win32.Windef.LPRECT;
                                dwStyle : Win32.DWORD;
                                bMenu : Win32.BOOL;
                                dwExStyle : Win32.DWORD)
                               return Win32.BOOL;
   --  winuser.h:4297

   function MessageBoxA (hWnd : Win32.Windef.HWND;
                         lpText : Win32.LPCSTR;
                         lpCaption : Win32.LPCSTR;
                         uType : Win32.UINT)
                        return Win32.INT;       --  winuser.h:4348

   function MessageBox (hWnd : Win32.Windef.HWND;
                        lpText : Win32.LPCSTR;
                        lpCaption : Win32.LPCSTR;
                        uType : Win32.UINT)
                       return Win32.INT
     renames MessageBoxA;     --  winuser.h:4348

   function MessageBoxW (hWnd : Win32.Windef.HWND;
                         lpText : Win32.LPCWSTR;
                         lpCaption : Win32.LPCWSTR;
                         uType : Win32.UINT)
                        return Win32.INT;       --  winuser.h:4356

   function MessageBoxExA (hWnd : Win32.Windef.HWND;
                           lpText : Win32.LPCSTR;
                           lpCaption : Win32.LPCSTR;
                           uType : Win32.UINT;
                           wLanguageId : Win32.WORD)
                          return Win32.INT;
   --  winuser.h:4370

   function MessageBoxEx (hWnd : Win32.Windef.HWND;
                          lpText : Win32.LPCSTR;
                          lpCaption : Win32.LPCSTR;
                          uType : Win32.UINT;
                          wLanguageId : Win32.WORD)
                         return Win32.INT
     renames MessageBoxExA;
   --  winuser.h:4370

   function MessageBoxExW (hWnd : Win32.Windef.HWND;
                           lpText : Win32.LPCWSTR;
                           lpCaption : Win32.LPCWSTR;
                           uType : Win32.UINT;
                           wLanguageId : Win32.WORD)
                          return Win32.INT;
   --  winuser.h:4379

   function MessageBeep (uType : Win32.UINT) return Win32.BOOL;
   --  winuser.h:4397

   function ShowCursor (bShow : Win32.BOOL) return Win32.INT;
   --  winuser.h:4405

   function SetCursorPos (X : Win32.INT;
                          Y : Win32.INT)
                         return Win32.BOOL;             --  winuser.h:4411

   function SetCursor (hCursor : Win32.Windef.HCURSOR)
      return Win32.Windef.HCURSOR;                        --  winuser.h:4418

   function GetCursorPos (lpPoint : Win32.Windef.LPPOINT) return Win32.BOOL;
   --  winuser.h:4424

   function ClipCursor (lpRect : Win32.Wingdi.ac_RECT_t) return Win32.BOOL;
   --  winuser.h:4430

   function GetClipCursor (lpRect : Win32.Windef.LPRECT) return Win32.BOOL;
   --  winuser.h:4436

   function GetCursor return Win32.Windef.HCURSOR;         --  winuser.h:4442

   function CreateCaret (hWnd : Win32.Windef.HWND;
                         hBitmap : Win32.Windef.HBITMAP;
                         nWidth : Win32.INT;
                         nHeight : Win32.INT)
                        return Win32.BOOL;        --  winuser.h:4448

   function GetCaretBlinkTime return Win32.UINT;           --  winuser.h:4457

   function SetCaretBlinkTime (uMSeconds : Win32.UINT) return Win32.BOOL;
   --  winuser.h:4463

   function DestroyCaret return Win32.BOOL;                --  winuser.h:4469

   function HideCaret (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:4475

   function ShowCaret (hWnd : Win32.Windef.HWND) return Win32.BOOL;
   --  winuser.h:4481

   function SetCaretPos (X : Win32.INT;
                         Y : Win32.INT)
                        return Win32.BOOL;              --  winuser.h:4487

   function GetCaretPos (lpPoint : Win32.Windef.LPPOINT) return Win32.BOOL;
   --  winuser.h:4494

   function ClientToScreen (hWnd : Win32.Windef.HWND;
                            lpPoint : Win32.Windef.LPPOINT)
                           return Win32.BOOL;     --  winuser.h:4500

   function ScreenToClient (hWnd : Win32.Windef.HWND;
                            lpPoint : Win32.Windef.LPPOINT)
                           return Win32.BOOL;     --  winuser.h:4507

   function MapWindowPoints (hWndFrom : Win32.Windef.HWND;
                             hWndTo : Win32.Windef.HWND;
                             lpPoints : Win32.Windef.LPPOINT;
                             cPoints : Win32.UINT)
                            return Win32.INT;
   --  winuser.h:4514

   function WindowFromPoint (Point : Win32.Windef.POINT)
      return Win32.Windef.HWND;                           --  winuser.h:4523

   function ChildWindowFromPoint (hWndParent : Win32.Windef.HWND;
                                  Point : Win32.Windef.POINT)
                                 return Win32.Windef.HWND;
   --  winuser.h:4529

   function GetSysColor (nIndex : Win32.INT) return Win32.DWORD;
   --  winuser.h:4576

   function SetSysColors (cElements : Win32.INT;
                          lpaElements : Win32.PCINT;
                          lpaRgbValues : Win32.PCDWORD)
                         return Win32.BOOL;
   --  winuser.h:4583

   function DrawFocusRect (hDC : Win32.Windef.HDC;
                           lprc : Win32.Wingdi.ac_RECT_t)
                          return Win32.BOOL;         --  winuser.h:4593

   function FillRect (hDC : Win32.Windef.HDC;
                      lprc : Win32.Wingdi.ac_RECT_t;
                      hbr : Win32.Windef.HBRUSH)
                     return Win32.INT;               --  winuser.h:4600

   function FrameRect (hDC : Win32.Windef.HDC;
                       lprc : Win32.Wingdi.ac_RECT_t;
                       hbr : Win32.Windef.HBRUSH)
                      return Win32.INT;              --  winuser.h:4608

   function InvertRect (hDC : Win32.Windef.HDC;
                        lprc : Win32.Wingdi.ac_RECT_t)
                       return Win32.BOOL;            --  winuser.h:4616

   function SetRect (lprc : Win32.Windef.LPRECT;
                     xLeft : Win32.INT;
                     yTop : Win32.INT;
                     xRight : Win32.INT;
                     yBottom : Win32.INT)
                    return Win32.BOOL;            --  winuser.h:4623

   function SetRectEmpty (lprc : Win32.Windef.LPRECT) return Win32.BOOL;
   --  winuser.h:4633

   function CopyRect (lprcDst : Win32.Windef.LPRECT;
                      lprcSrc : Win32.Wingdi.ac_RECT_t)
                     return Win32.BOOL;           --  winuser.h:4639

   function InflateRect (lprc : Win32.Windef.LPRECT;
                         dx : Win32.INT;
                         dy : Win32.INT)
                        return Win32.BOOL;           --  winuser.h:4646

   function IntersectRect (lprcDst : Win32.Windef.LPRECT;
                           lprcSrc1 : Win32.Wingdi.ac_RECT_t;
                           lprcSrc2 : Win32.Wingdi.ac_RECT_t)
                          return Win32.BOOL;     --  winuser.h:4654

   function UnionRect (lprcDst : Win32.Windef.LPRECT;
                       lprcSrc1 : Win32.Wingdi.ac_RECT_t;
                       lprcSrc2 : Win32.Wingdi.ac_RECT_t)
                      return Win32.BOOL;         --  winuser.h:4662

   function SubtractRect (lprcDst : Win32.Windef.LPRECT;
                          lprcSrc1 : Win32.Wingdi.ac_RECT_t;
                          lprcSrc2 : Win32.Wingdi.ac_RECT_t)
                         return Win32.BOOL;      --  winuser.h:4670

   function OffsetRect (lprc : Win32.Windef.LPRECT;
                        dx : Win32.INT;
                        dy : Win32.INT)
                       return Win32.BOOL;            --  winuser.h:4678

   function IsRectEmpty (lprc : Win32.Wingdi.ac_RECT_t) return Win32.BOOL;
   --  winuser.h:4686

   function EqualRect (lprc1 : Win32.Wingdi.ac_RECT_t;
                       lprc2 : Win32.Wingdi.ac_RECT_t)
                      return Win32.BOOL;            --  winuser.h:4692

   function PtInRect (lprc : Win32.Wingdi.ac_RECT_t;
                      pt : Win32.Windef.POINT)
                     return Win32.BOOL;              --  winuser.h:4699

   function GetWindowWord (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT)
                          return Win32.WORD;       --  winuser.h:4708

   function SetWindowWord (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT;
                           wNewWord : Win32.WORD)
                          return Win32.WORD;     --  winuser.h:4715

   function GetWindowLongA (hWnd : Win32.Windef.HWND;
                            nIndex : Win32.INT)
                           return Win32.LONG;      --  winuser.h:4723

   function GetWindowLong (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT)
                          return Win32.LONG
     renames GetWindowLongA;
   --  winuser.h:4723

   function GetWindowLongW (hWnd : Win32.Windef.HWND;
                            nIndex : Win32.INT)
                           return Win32.LONG;      --  winuser.h:4729

   function SetWindowLongA (hWnd : Win32.Windef.HWND;
                            nIndex : Win32.INT;
                            dwNewLong : Win32.LONG)
                           return Win32.LONG;
   --  winuser.h:4741

   function SetWindowLong (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT;
                           dwNewLong : Win32.LONG)
                          return Win32.LONG
     renames SetWindowLongA;
   --  winuser.h:4741

   function SetWindowLongW (hWnd : Win32.Windef.HWND;
                            nIndex : Win32.INT;
                            dwNewLong : Win32.LONG)
                           return Win32.LONG;
   --  winuser.h:4748

   function GetWindowLongPtrA (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT)
                          return Win32.LONG_PTR;

   function GetWindowLongPtr (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT)
                          return Win32.LONG_PTR
     renames GetWindowLongPtrA;

   function GetWindowLongPtrW (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT)
                          return Win32.LONG_PTR;

   function SetWindowLongPtrA (hWnd : Win32.Windef.HWND;
                            nIndex : Win32.INT;
                            dwNewLong : Win32.LONG_PTR)
                              return Win32.LONG_PTR;

   function SetWindowLongPtr (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT;
                           dwNewLong : Win32.LONG_PTR)
                          return Win32.LONG_PTR
     renames SetWindowLongPtrA;

   function SetWindowLongPtrW (hWnd : Win32.Windef.HWND;
                            nIndex : Win32.INT;
                            dwNewLong : Win32.LONG_PTR)
                           return Win32.LONG_PTR;

   function GetClassWord (hWnd : Win32.Windef.HWND;
                          nIndex : Win32.INT)
                         return Win32.WORD;        --  winuser.h:4761

   function SetClassWord (hWnd : Win32.Windef.HWND;
                          nIndex : Win32.INT;
                          wNewWord : Win32.WORD)
                         return Win32.WORD;      --  winuser.h:4768

   function GetClassLongA (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT)
                          return Win32.DWORD;      --  winuser.h:4776

   function GetClassLong (hWnd : Win32.Windef.HWND;
                          nIndex : Win32.INT)
                         return Win32.DWORD
     renames GetClassLongA;    --  winuser.h:4776

   function GetClassLongW (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT)
                          return Win32.DWORD;      --  winuser.h:4782

   function SetClassLongA (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT;
                           dwNewLong : Win32.LONG)
                          return Win32.DWORD;
   --  winuser.h:4794

   function SetClassLong (hWnd : Win32.Windef.HWND;
                          nIndex : Win32.INT;
                          dwNewLong : Win32.LONG)
                         return Win32.DWORD
     renames SetClassLongA;
   --  winuser.h:4794

   function SetClassLongW (hWnd : Win32.Windef.HWND;
                           nIndex : Win32.INT;
                           dwNewLong : Win32.LONG)
                          return Win32.DWORD;
   --  winuser.h:4801

   function GetDesktopWindow return Win32.Windef.HWND;     --  winuser.h:4816

   function GetParent (hWnd : Win32.Windef.HWND) return Win32.Windef.HWND;
   --  winuser.h:4823

   function SetParent (hWndChild : Win32.Windef.HWND;
                       hWndNewParent : Win32.Windef.HWND)
                      return Win32.Windef.HWND;
   --  winuser.h:4829

   function EnumChildWindows (hWndParent : Win32.Windef.HWND;
                              lpEnumFunc : WNDENUMPROC;
                              lParam : Win32.LPARAM)
                             return Win32.BOOL;
   --  winuser.h:4836

   function FindWindowA (lpClassName : Win32.LPCSTR;
                         lpWindowName : Win32.LPCSTR)
                        return Win32.Windef.HWND;
   --  winuser.h:4844

   function FindWindow (lpClassName : Win32.LPCSTR;
                        lpWindowName : Win32.LPCSTR)
                       return Win32.Windef.HWND
     renames FindWindowA;  --  winuser.h:4844

   function FindWindowW (lpClassName : Win32.LPCWSTR;
                         lpWindowName : Win32.LPCWSTR)
                        return Win32.Windef.HWND;
   --  winuser.h:4850

   function EnumWindows (lpEnumFunc : WNDENUMPROC;
                         lParam : Win32.LPARAM)
                        return Win32.BOOL;     --  winuser.h:4863

   function EnumThreadWindows (dwThreadId : Win32.DWORD;
                               lpfn : WNDENUMPROC;
                               lParam : Win32.LPARAM)
      return Win32.BOOL;                                  --  winuser.h:4870

   function EnumTaskWindows (dwThreadId : Win32.DWORD;
                             lpfn : WNDENUMPROC;
                             lParam : Win32.LPARAM)
      return Win32.BOOL renames EnumThreadWindows;        --  winuser.h:4870

   function GetClassNameA (hWnd : Win32.Windef.HWND;
                           lpClassName : Win32.LPSTR;
                           nMaxCount : Win32.INT)
                          return Win32.INT;
   --  winuser.h:4880

   function GetClassName (hWnd : Win32.Windef.HWND;
                          lpClassName : Win32.LPSTR;
                          nMaxCount : Win32.INT)
                         return Win32.INT
     renames GetClassNameA;
   --  winuser.h:4880

   function GetClassNameW (hWnd : Win32.Windef.HWND;
                           lpClassName : Win32.LPWSTR;
                           nMaxCount : Win32.INT)
                          return Win32.INT;
   --  winuser.h:4887

   function GetTopWindow (hWnd : Win32.Windef.HWND) return Win32.Windef.HWND;
   --  winuser.h:4900

   function GetWindowThreadProcessId (hWnd : Win32.Windef.HWND;
                                      lpdwProcessId : Win32.LPDWORD)
                                     return Win32.DWORD;
   --  winuser.h:4910

   function GetWindowTask (H : Win32.Windef.HWND) return Win32.Winnt.HANDLE;
   --  winuser.h:4914

   function GetLastActivePopup (hWnd : Win32.Windef.HWND)
      return Win32.Windef.HWND;                           --  winuser.h:4919

   function GetWindow (hWnd : Win32.Windef.HWND;
                       uCmd : Win32.UINT)
                      return Win32.Windef.HWND;      --  winuser.h:4937

   function GetNextWindow (hWnd : Win32.Windef.HWND;
                           uCmd : Win32.UINT)
                          return Win32.Windef.HWND renames GetWindow;
   --  winuser.h:4903

   function SetWindowsHookA (nFilterType : Win32.INT;
                             pfnFilterProc : HOOKPROC)
                            return Win32.Windef.HHOOK;
   --  winuser.h:4950

   function SetWindowsHook (nFilterType : Win32.INT;
                            pfnFilterProc : HOOKPROC)
                           return Win32.Windef.HHOOK
     renames SetWindowsHookA;
   --  winuser.h:4950

   function SetWindowsHookW (nFilterType : Win32.INT;
                             pfnFilterProc : HOOKPROC)
                            return Win32.Windef.HHOOK;
   --  winuser.h:4956

   function UnhookWindowsHook (nCode : Win32.INT;
                               pfnFilterProc : HOOKPROC)
                              return Win32.BOOL;
   --  winuser.h:4990

   function SetWindowsHookExA (idHook : Win32.INT;
                               lpfn : HOOKPROC;
                               hmod : Win32.Windef.HINSTANCE;
                               dwThreadId : Win32.DWORD)
                              return Win32.Windef.HHOOK;
   --  winuser.h:4997

   function SetWindowsHookEx (idHook : Win32.INT;
                              lpfn : HOOKPROC;
                              hmod : Win32.Windef.HINSTANCE;
                              dwThreadId : Win32.DWORD)
                             return Win32.Windef.HHOOK
     renames SetWindowsHookExA;
   --  winuser.h:4997

   function SetWindowsHookExW (idHook : Win32.INT;
                               lpfn : HOOKPROC;
                               hmod : Win32.Windef.HINSTANCE;
                               dwThreadId : Win32.DWORD)
                              return Win32.Windef.HHOOK;
   --  winuser.h:5005

   function UnhookWindowsHookEx (hhk : Win32.Windef.HHOOK) return Win32.BOOL;
   --  winuser.h:5019

   function CallNextHookEx (hhk : Win32.Windef.HHOOK;
                            nCode : Win32.INT;
                            wParam : Win32.WPARAM;
                            lParam : Win32.LPARAM)
                           return Win32.LRESULT;
   --  winuser.h:5025

   function DefHookProc (nCode : Win32.INT;
                         wParam : Win32.WPARAM;
                         lParam : Win32.LPARAM;
                         phhk : access Win32.Windef.HHOOK)
                        return Win32.LRESULT;
   --  winuser.h:5038

   function LoadBitmapA (hInstance : Win32.Windef.HINSTANCE;
                         lpBitmapName : Win32.LPCSTR)
                        return Win32.Windef.HBITMAP;
   --  winuser.h:5156

   function LoadBitmap (hInstance : Win32.Windef.HINSTANCE;
                        lpBitmapName : Win32.LPCSTR)
                       return Win32.Windef.HBITMAP
     renames LoadBitmapA;  --  winuser.h:5156

   function LoadBitmapW (hInstance : Win32.Windef.HINSTANCE;
                         lpBitmapName : Win32.LPCWSTR)
                        return Win32.Windef.HBITMAP;
   --  winuser.h:5162

   function LoadCursorA (hInstance : Win32.Windef.HINSTANCE;
                         lpCursorName : Win32.LPCSTR)
                        return Win32.Windef.HCURSOR;
   --  winuser.h:5174

   function LoadCursor (hInstance : Win32.Windef.HINSTANCE;
                        lpCursorName : Win32.LPCSTR)
                       return Win32.Windef.HCURSOR
     renames LoadCursorA;  --  winuser.h:5174

   function LoadCursorW (hInstance : Win32.Windef.HINSTANCE;
                         lpCursorName : Win32.LPCWSTR)
                        return Win32.Windef.HCURSOR;
   --  winuser.h:5180

   function CreateCursor (hInst : Win32.Windef.HINSTANCE;
                          xHotSpot : Win32.INT;
                          yHotSpot : Win32.INT;
                          nWidth : Win32.INT;
                          nHeight : Win32.INT;
                          pvANDPlane : Win32.PCVOID;
                          pvXORPlane : Win32.PCVOID)
                         return Win32.Windef.HCURSOR;
   --  winuser.h:5193

   function DestroyCursor (hCursor : Win32.Windef.HCURSOR) return Win32.BOOL;
   --  winuser.h:5205

   function LoadIconA (hInstance : Win32.Windef.HINSTANCE;
                       lpIconName : Win32.LPCSTR)
                      return Win32.Windef.HICON;
   --  winuser.h:5240

   function LoadIcon (hInstance : Win32.Windef.HINSTANCE;
                      lpIconName : Win32.LPCSTR)
                     return Win32.Windef.HICON
     renames LoadIconA;        --  winuser.h:5240

   function LoadIconW (hInstance : Win32.Windef.HINSTANCE;
                       lpIconName : Win32.LPCWSTR)
                      return Win32.Windef.HICON;
   --  winuser.h:5246

   function CreateIcon (hInstance : Win32.Windef.HINSTANCE;
                        nWidth : Win32.INT;
                        nHeight : Win32.INT;
                        cPlanes : Win32.BYTE;
                        cBitsPixel : Win32.BYTE;
                        lpbANDbits : Win32.PCBYTE;
                        lpbXORbits : Win32.PCBYTE)
                       return Win32.Windef.HICON;
   --  winuser.h:5258

   function DestroyIcon (hIcon : Win32.Windef.HICON) return Win32.BOOL;
   --  winuser.h:5270

   function LookupIconIdFromDirectory (presbits : Win32.PBYTE;
                                       fIcon : Win32.BOOL)
                                      return Win32.INT;
   --  winuser.h:5276

   function CreateIconFromResource (presbits : Win32.PBYTE;
                                    dwResSize : Win32.DWORD;
                                    fIcon : Win32.BOOL;
                                    dwVer : Win32.DWORD)
                                   return Win32.Windef.HICON;
   --  winuser.h:5284

   function CreateIconIndirect (piconinfo : Win32.Winuser.PICONINFO)
      return Win32.Windef.HICON;                          --  winuser.h:5294

   function CopyIcon (hIcon : Win32.Windef.HICON) return Win32.Windef.HICON;
   --  winuser.h:5300

   function CopyCursor (hcur : Win32.Windef.HCURSOR)
      return Win32.Windef.HCURSOR;                        --  winuser.h:5208

   function GetIconInfo (hIcon : Win32.Windef.HICON;
                         piconinfo : Win32.Winuser.PICONINFO)
                        return Win32.BOOL;      --  winuser.h:5306

   function LoadStringA (hInstance : Win32.Windef.HINSTANCE;
                         uID : Win32.UINT;
                         lpBuffer : Win32.LPSTR;
                         nBufferMax : Win32.INT)
                        return Win32.INT;      --  winuser.h:5406

   function LoadString (hInstance : Win32.Windef.HINSTANCE;
                        uID : Win32.UINT;
                        lpBuffer : Win32.LPSTR;
                        nBufferMax : Win32.INT)
                       return Win32.INT
     renames LoadStringA;    --  winuser.h:5406

   function LoadStringW (hInstance : Win32.Windef.HINSTANCE;
                         uID : Win32.UINT;
                         lpBuffer : Win32.LPWSTR;
                         nBufferMax : Win32.INT)
                        return Win32.INT;      --  winuser.h:5414

   function IsDialogMessageA (hDlg : Win32.Windef.HWND;
                              lpMsg : access MSG)
                             return Win32.BOOL;     --  winuser.h:5609

   function IsDialogMessage (hDlg : Win32.Windef.HWND;
                             lpMsg : access MSG)
                            return Win32.BOOL
     renames IsDialogMessageA;
   --  winuser.h:5609

   function IsDialogMessageW (hDlg : Win32.Windef.HWND;
                              lpMsg : access MSG)
                             return Win32.BOOL;     --  winuser.h:5615

   function MapDialogRect (hDlg : Win32.Windef.HWND;
                           lpRect : Win32.Windef.LPRECT)
                          return Win32.BOOL;       --  winuser.h:5629

   function DlgDirListA (hDlg : Win32.Windef.HWND;
                         lpPathSpec : Win32.LPSTR;
                         nIDListBox : Win32.INT;
                         nIDStaticPath : Win32.INT;
                         uFileType : Win32.UINT)
                        return Win32.INT;
   --  winuser.h:5636

   function DlgDirList (hDlg : Win32.Windef.HWND;
                        lpPathSpec : Win32.LPSTR;
                        nIDListBox : Win32.INT;
                        nIDStaticPath : Win32.INT;
                        uFileType : Win32.UINT)
                       return Win32.INT
     renames DlgDirListA;
   --  winuser.h:5636

   function DlgDirListW (hDlg : Win32.Windef.HWND;
                         lpPathSpec : Win32.LPWSTR;
                         nIDListBox : Win32.INT;
                         nIDStaticPath : Win32.INT;
                         uFileType : Win32.UINT)
                        return Win32.INT;
   --  winuser.h:5645

   function DlgDirSelectExA (hDlg : Win32.Windef.HWND;
                             lpString : Win32.LPSTR;
                             nCount : Win32.INT;
                             nIDListBox : Win32.INT)
                            return Win32.BOOL;
   --  winuser.h:5674

   function DlgDirSelectEx (hDlg : Win32.Windef.HWND;
                            lpString : Win32.LPSTR;
                            nCount : Win32.INT;
                            nIDListBox : Win32.INT)
                           return Win32.BOOL
     renames DlgDirSelectExA;
   --  winuser.h:5674

   function DlgDirSelectExW (hDlg : Win32.Windef.HWND;
                             lpString : Win32.LPWSTR;
                             nCount : Win32.INT;
                             nIDListBox : Win32.INT)
                            return Win32.BOOL;
   --  winuser.h:5682

   function DlgDirListComboBoxA (hDlg : Win32.Windef.HWND;
                                 lpPathSpec : Win32.LPSTR;
                                 nIDComboBox : Win32.INT;
                                 nIDStaticPath : Win32.INT;
                                 uFiletype : Win32.UINT)
                                return Win32.INT;
   --  winuser.h:5696

   function DlgDirListComboBox (hDlg : Win32.Windef.HWND;
                                lpPathSpec : Win32.LPSTR;
                                nIDComboBox : Win32.INT;
                                nIDStaticPath : Win32.INT;
                                uFiletype : Win32.UINT)
                               return Win32.INT
     renames DlgDirListComboBoxA;
   --  winuser.h:5696

   function DlgDirListComboBoxW (hDlg : Win32.Windef.HWND;
                                 lpPathSpec : Win32.LPWSTR;
                                 nIDComboBox : Win32.INT;
                                 nIDStaticPath : Win32.INT;
                                 uFiletype : Win32.UINT)
                                return Win32.INT;
   --  winuser.h:5705

   function DlgDirSelectComboBoxExA (hDlg : Win32.Windef.HWND;
                                     lpString : Win32.LPSTR;
                                     nCount : Win32.INT;
                                     nIDComboBox : Win32.INT)
                                    return Win32.BOOL;
   --  winuser.h:5720

   function DlgDirSelectComboBoxEx
     (hDlg : Win32.Windef.HWND;
      lpString : Win32.LPSTR;
      nCount : Win32.INT;
      nIDComboBox : Win32.INT)
     return Win32.BOOL
     renames DlgDirSelectComboBoxExA;       --  winuser.h:5720

   function DlgDirSelectComboBoxExW (hDlg : Win32.Windef.HWND;
                                     lpString : Win32.LPWSTR;
                                     nCount : Win32.INT;
                                     nIDComboBox : Win32.INT)
                                    return Win32.BOOL;
   --  winuser.h:5728

   function DefFrameProcA (hWnd : Win32.Windef.HWND;
                           hWndMDIClient : Win32.Windef.HWND;
                           uMsg : Win32.UINT;
                           wParam : Win32.WPARAM;
                           lParam : Win32.LPARAM)
                          return Win32.LRESULT;
   --  winuser.h:6038

   function DefFrameProc (hWnd : Win32.Windef.HWND;
                          hWndMDIClient : Win32.Windef.HWND;
                          uMsg : Win32.UINT;
                          wParam : Win32.WPARAM;
                          lParam : Win32.LPARAM)
                         return Win32.LRESULT
     renames DefFrameProcA;
   --  winuser.h:6038

   function DefFrameProcW (hWnd : Win32.Windef.HWND;
                           hWndMDIClient : Win32.Windef.HWND;
                           uMsg : Win32.UINT;
                           wParam : Win32.WPARAM;
                           lParam : Win32.LPARAM)
                          return Win32.LRESULT;
   --  winuser.h:6047

   function DefMDIChildProcA (hWnd : Win32.Windef.HWND;
                              uMsg : Win32.UINT;
                              wParam : Win32.WPARAM;
                              lParam : Win32.LPARAM)
                             return Win32.LRESULT;
   --  winuser.h:6062

   function DefMDIChildProc (hWnd : Win32.Windef.HWND;
                             uMsg : Win32.UINT;
                             wParam : Win32.WPARAM;
                             lParam : Win32.LPARAM)
                            return Win32.LRESULT
     renames DefMDIChildProcA;
   --  winuser.h:6062

   function DefMDIChildProcW (hWnd : Win32.Windef.HWND;
                              uMsg : Win32.UINT;
                              wParam : Win32.WPARAM;
                              lParam : Win32.LPARAM)
                             return Win32.LRESULT;
   --  winuser.h:6070

   function TranslateMDISysAccel (hWndClient : Win32.Windef.HWND;
                                  lpMsg : access MSG)
                                 return Win32.BOOL;
   --  winuser.h:6086

   function ArrangeIconicWindows (hWnd : Win32.Windef.HWND) return Win32.UINT;
   --  winuser.h:6095

   function CreateMDIWindowA (lpClassName : Win32.LPSTR;
                              lpWindowName : Win32.LPSTR;
                              dwStyle : Win32.DWORD;
                              X : Win32.INT;
                              Y : Win32.INT;
                              nWidth : Win32.INT;
                              nHeight : Win32.INT;
                              hWndParent : Win32.Windef.HWND;
                              hInstance : Win32.Windef.HINSTANCE;
                              lParam : Win32.LPARAM)
                             return Win32.Windef.HWND;
   --  winuser.h:6101

   function CreateMDIWindow (lpClassName : Win32.LPSTR;
                             lpWindowName : Win32.LPSTR;
                             dwStyle : Win32.DWORD;
                             X : Win32.INT;
                             Y : Win32.INT;
                             nWidth : Win32.INT;
                             nHeight : Win32.INT;
                             hWndParent : Win32.Windef.HWND;
                             hInstance : Win32.Windef.HINSTANCE;
                             lParam : Win32.LPARAM)
                            return Win32.Windef.HWND
     renames CreateMDIWindowA;
   --  winuser.h:6101

   function CreateMDIWindowW (lpClassName : Win32.LPWSTR;
                              lpWindowName : Win32.LPWSTR;
                              dwStyle : Win32.DWORD;
                              X : Win32.INT;
                              Y : Win32.INT;
                              nWidth : Win32.INT;
                              nHeight : Win32.INT;
                              hWndParent : Win32.Windef.HWND;
                              hInstance : Win32.Windef.HINSTANCE;
                              lParam : Win32.LPARAM)
                             return Win32.Windef.HWND;
   --  winuser.h:6116

   function WinHelpA (hWndMain : Win32.Windef.HWND;
                      lpszHelp : Win32.LPCSTR;
                      uCommand : Win32.UINT;
                      dwData : Win32.DWORD)
                     return Win32.BOOL;          --  winuser.h:6213

   function WinHelp (hWndMain : Win32.Windef.HWND;
                     lpszHelp : Win32.LPCSTR;
                     uCommand : Win32.UINT;
                     dwData : Win32.DWORD)
                    return Win32.BOOL
     renames WinHelpA;            --  winuser.h:6213

   function WinHelpW (hWndMain : Win32.Windef.HWND;
                      lpszHelp : Win32.LPCWSTR;
                      uCommand : Win32.UINT;
                      dwData : Win32.DWORD)
                     return Win32.BOOL;          --  winuser.h:6222

   function SystemParametersInfoA (uiAction : Win32.UINT;
                                   uiParam : Win32.UINT;
                                   pvParam : Win32.PVOID;
                                   fWinIni : Win32.UINT)
                                  return Win32.BOOL;
   --  winuser.h:6322

   function SystemParametersInfo (uiAction : Win32.UINT;
                                  uiParam : Win32.UINT;
                                  pvParam : Win32.PVOID;
                                  fWinIni : Win32.UINT)
                                 return Win32.BOOL
     renames SystemParametersInfoA;
   --  winuser.h:6322

   function SystemParametersInfoW (uiAction : Win32.UINT;
                                   uiParam : Win32.UINT;
                                   pvParam : Win32.PVOID;
                                   fWinIni : Win32.UINT)
                                  return Win32.BOOL;
   --  winuser.h:6330

   procedure SetDebugErrorLevel (dwLevel : Win32.DWORD);     --  winuser.h:6503

   procedure SetLastErrorEx (dwErrCode : Win32.DWORD;
                             dwType : Win32.DWORD);       --  winuser.h:6518

private
   pragma Convention (C, CREATESTRUCTA);                    --  winuser.h:410
   pragma Convention (C_Pass_By_Copy, CBT_CREATEWNDA);      --  winuser.h:408
   pragma Convention (C, CREATESTRUCTW);                    --  winuser.h:418
   pragma Convention (C_Pass_By_Copy, CBT_CREATEWNDW);      --  winuser.h:416
   pragma Convention (C_Pass_By_Copy, CBTACTIVATESTRUCT);   --  winuser.h:432
   pragma Convention (C, EVENTMSG);                         --  winuser.h:462
   pragma Convention (C_Pass_By_Copy, CWPSTRUCT);           --  winuser.h:475
   pragma Convention (C, DEBUGHOOKINFO);                    --  winuser.h:486
   pragma Convention (C, MOUSEHOOKSTRUCT);                  --  winuser.h:498
   pragma Convention (C, WNDCLASSA);                        --  winuser.h:636
   pragma Convention (C, WNDCLASSW);                        --  winuser.h:648
   pragma Convention (C, MSG);                              --  winuser.h:680
   pragma Convention (C, MINMAXINFO);                       --  winuser.h:785
   pragma Convention (C_Pass_By_Copy, COPYDATASTRUCT);      --  winuser.h:830
   pragma Convention (C, WINDOWPOS);                        --  winuser.h:1059
   pragma Convention (C, RECT_Array);                       --  winuser.h:1073
   pragma Convention (C, NCCALCSIZE_PARAMS);                --  winuser.h:1072
   pragma Convention (C_Pass_By_Copy, ACCEL);               --  winuser.h:1233
   pragma Convention (C, PAINTSTRUCT);                      --  winuser.h:1239
   pragma Convention (C, WINDOWPLACEMENT);                  --  winuser.h:1284
   pragma Convention (C, MEASUREITEMSTRUCT);                --  winuser.h:1325
   pragma Convention (C, DRAWITEMSTRUCT);                   --  winuser.h:1339
   pragma Convention (C, DELETEITEMSTRUCT);                 --  winuser.h:1354
   pragma Convention (C, COMPAREITEMSTRUCT);                --  winuser.h:1365
   pragma Convention (C, DLGTEMPLATE);                      --  winuser.h:2143
   pragma Convention (C, DLGITEMTEMPLATE);                  --  winuser.h:2170
   pragma Convention (C_Pass_By_Copy, MENUITEMTEMPLATEHEADER);
   --  winuser.h:5108
   pragma Convention (C_Pass_By_Copy, MENUITEMTEMPLATE);    --  winuser.h:5114
   pragma Convention (C, ICONINFO);                         --  winuser.h:5228
   pragma Convention (C, MDICREATESTRUCTA);                 --  winuser.h:6000
   pragma Convention (C, MDICREATESTRUCTW);                 --  winuser.h:6011
   pragma Convention (C_Pass_By_Copy, CLIENTCREATESTRUCT);  --  winuser.h:6030
   pragma Convention (C_Pass_By_Copy, MULTIKEYHELPA);       --  winuser.h:6142
   pragma Convention (C_Pass_By_Copy, MULTIKEYHELPW);       --  winuser.h:6147
   pragma Convention (C, HELPWININFOA);                     --  winuser.h:6162
   pragma Convention (C, HELPWININFOW);                     --  winuser.h:6171
   pragma Convention (C, FILTERKEYS);                       --  winuser.h:6346
   pragma Convention (C_Pass_By_Copy, STICKYKEYS);          --  winuser.h:6367
   pragma Convention (C, MOUSEKEYS);                        --  winuser.h:6386
   pragma Convention (C_Pass_By_Copy, ACCESSTIMEOUT);       --  winuser.h:6409
   pragma Convention (C, SOUNDSENTRYA);                     --  winuser.h:6431
   pragma Convention (C, SOUNDSENTRYW);                     --  winuser.h:6446
   pragma Convention (C_Pass_By_Copy, TOGGLEKEYS);          --  winuser.h:6476

   function L is new Ada.Unchecked_Conversion (ULONG_PTR, LPSTR);

   RT_CURSOR_NB : constant := 1;
   RT_ICON_NB : constant := 3;

   RT_CURSOR : constant LPSTR := L (RT_CURSOR_NB);
   --  winuser.h:115
   RT_BITMAP : constant LPSTR := L (2);
   --  winuser.h:116
   RT_ICON : constant LPSTR := L (RT_ICON_NB);
   --  winuser.h:117
   RT_MENU : constant LPSTR := L (4);
   --  winuser.h:118
   RT_DIALOG : constant LPSTR := L (5);
   --  winuser.h:119
   RT_STRING : constant LPSTR := L (6);
   --  winuser.h:120
   RT_FONTDIR : constant LPSTR := L (7);
   --  winuser.h:121
   RT_FONT : constant LPSTR := L (8);
   --  winuser.h:122
   RT_ACCELERATOR : constant LPSTR := L (9);
   --  winuser.h:123
   RT_RCDATA : constant LPSTR := L (10);
   --  winuser.h:124
   RT_MESSAGETABLE : constant LPSTR := L (11);
   --  winuser.h:125
   DIFFERENCE : constant := 11;                        --  winuser.h:127
   use type Win32.WORD;
   RT_GROUP_CURSOR : constant LPSTR := L (RT_CURSOR_NB + DIFFERENCE);
   --  winuser.h:128
   RT_GROUP_ICON : constant LPSTR := L (RT_ICON_NB + DIFFERENCE);
   --  winuser.h:129
   RT_VERSION : constant LPSTR := L (20);
   --  winuser.h:130
   RT_DLGINCLUDE : constant LPSTR := L (17);
   --  winuser.h:131
   IDC_ARROW : constant LPSTR := L (32512);
   --  winuser.h:5213
   IDC_IBEAM : constant LPSTR := L (32513);
   --  winuser.h:5214
   IDC_WAIT : constant LPSTR := L (32514);
   --  winuser.h:5215
   IDC_CROSS : constant LPSTR := L (32515);
   --  winuser.h:5216
   IDC_UPARROW : constant LPSTR := L (32516);
   --  winuser.h:5217
   IDC_SIZE : constant LPSTR := L (32640);
   --  winuser.h:5218
   IDC_ICON : constant LPSTR := L (32641);
   --  winuser.h:5219
   IDC_SIZENWSE : constant LPSTR := L (32642);
   --  winuser.h:5220
   IDC_SIZENESW : constant LPSTR := L (32643);
   --  winuser.h:5221
   IDC_SIZEWE : constant LPSTR := L (32644);
   --  winuser.h:5222
   IDC_SIZENS : constant LPSTR := L (32645);
   --  winuser.h:5223
   --  the following are not in win3.1
   IDC_SIZEALL : constant LPSTR := L (32646);
   --  winuser.h:5224
   IDC_NO : constant LPSTR := L (32648);
   --  winuser.h:5225
   IDC_APPSTARTING : constant LPSTR := L (32650);
   --  winuser.h:5226
   IDI_APPLICATION : constant LPSTR := L (32512);
   --  winuser.h:5394
   IDI_HAND : constant LPSTR := L (32513);
   --  winuser.h:5395
   IDI_QUESTION : constant LPSTR := L (32514);
   --  winuser.h:5396
   IDI_EXCLAMATION : constant LPSTR := L (32515);
   --  winuser.h:5397
   IDI_ASTERISK : constant LPSTR := L (32516);
   --  winuser.h:5398

   function To_Hwnd is new
      Ada.Unchecked_Conversion (Storage_Offset, Win32.Windef.HWND);

   HWND_BROADCAST : constant Win32.Windef.HWND := To_Hwnd (16#ffff#);
   --  winuser.h:1696
   HWND_DESKTOP : constant Win32.Windef.HWND := To_Hwnd (8#0#);
   --  winuser.h:1886
   HWND_TOP : constant Win32.Windef.HWND := To_Hwnd (8#0#);
   --  winuser.h:2116
   HWND_BOTTOM : constant Win32.Windef.HWND := To_Hwnd (1);
   --  winuser.h:2117
   use type Win32.LONG;
   HWND_TOPMOST : constant Win32.Windef.HWND := To_Hwnd (-1);
   --  winuser.h:2118
   HWND_NOTOPMOST : constant Win32.Windef.HWND := To_Hwnd (-2);
   --  winuser.h:2119

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
   --  winuser.h:526
   pragma Import (Stdcall, LoadKeyboardLayoutW, "LoadKeyboardLayoutW");
   --  winuser.h:532
   pragma Import (Stdcall, ActivateKeyboardLayout, "ActivateKeyboardLayout");
   --  winuser.h:544
   pragma Import (Stdcall, UnloadKeyboardLayout, "UnloadKeyboardLayout");
   --  winuser.h:551
   pragma Import (Stdcall, GetKeyboardLayoutNameA, "GetKeyboardLayoutNameA");
   --  winuser.h:557
   pragma Import (Stdcall, GetKeyboardLayoutNameW, "GetKeyboardLayoutNameW");
   --  winuser.h:562
   pragma Import (Stdcall, GetThreadDesktop, "GetThreadDesktop");
   --  winuser.h:587
   pragma Import (Stdcall, GetProcessWindowStation, "GetProcessWindowStation");
   --  winuser.h:609
   pragma Import (Stdcall, SetUserObjectSecurity, "SetUserObjectSecurity");
   --  winuser.h:618
   pragma Import (Stdcall, GetUserObjectSecurity, "GetUserObjectSecurity");
   --  winuser.h:626
   pragma Import (Stdcall, RegisterWindowMessageA, "RegisterWindowMessageA");
   --  winuser.h:1025
   pragma Import (Stdcall, RegisterWindowMessageW, "RegisterWindowMessageW");
   --  winuser.h:1030
   pragma Import (Stdcall, GetMessageA, "GetMessageA");     --  winuser.h:1385
   pragma Import (Stdcall, GetMessageW, "GetMessageW");     --  winuser.h:1393
   pragma Import (Stdcall, TranslateMessage, "TranslateMessage");
   --  winuser.h:1407
   pragma Import (Stdcall, DispatchMessageA, "DispatchMessageA");
   --  winuser.h:1413
   pragma Import (Stdcall, DispatchMessageW, "DispatchMessageW");
   --  winuser.h:1418
   pragma Import (Stdcall, SetMessageQueue, "SetMessageQueue");
   --  winuser.h:1430
   pragma Import (Stdcall, PeekMessageA, "PeekMessageA");    --  winuser.h:1436
   pragma Import (Stdcall, PeekMessageW, "PeekMessageW");    --  winuser.h:1445
   pragma Import (Stdcall, RegisterHotKey, "RegisterHotKey");
   --  winuser.h:1469
   pragma Import (Stdcall, UnregisterHotKey, "UnregisterHotKey");
   --  winuser.h:1478
   pragma Import (Stdcall, ExitWindowsEx, "ExitWindowsEx");  --  winuser.h:1511
   pragma Import (Stdcall, SwapMouseButton, "SwapMouseButton");
   --  winuser.h:1518
   pragma Import (Stdcall, GetMessagePos, "GetMessagePos");  --  winuser.h:1524
   pragma Import (Stdcall, GetMessageTime, "GetMessageTime");
   --  winuser.h:1530
   pragma Import (Stdcall, GetMessageExtraInfo, "GetMessageExtraInfo");
   --  winuser.h:1536
   pragma Import (Stdcall, SendMessageA, "SendMessageA");    --  winuser.h:1543
   pragma Import (Stdcall, SendMessageW, "SendMessageW");    --  winuser.h:1551
   pragma Import (Stdcall, SendMessageTimeoutA, "SendMessageTimeoutA");
   --  winuser.h:1565
   pragma Import (Stdcall, SendMessageTimeoutW, "SendMessageTimeoutW");
   --  winuser.h:1576
   pragma Import (Stdcall, SendNotifyMessageA, "SendNotifyMessageA");
   --  winuser.h:1593
   pragma Import (Stdcall, SendNotifyMessageW, "SendNotifyMessageW");
   --  winuser.h:1601
   pragma Import (Stdcall, SendMessageCallbackA, "SendMessageCallbackA");
   --  winuser.h:1615
   pragma Import (Stdcall, SendMessageCallbackW, "SendMessageCallbackW");
   --  winuser.h:1625
   pragma Import (Stdcall, PostMessageA, "PostMessageA");    --  winuser.h:1642
   pragma Import (Stdcall, PostMessageW, "PostMessageW");    --  winuser.h:1650
   pragma Import (Stdcall, PostThreadMessageA, "PostThreadMessageA");
   --  winuser.h:1664
   pragma Import (Stdcall, PostThreadMessageW, "PostThreadMessageW");
   --  winuser.h:1672
   pragma Import (Stdcall, AttachThreadInput, "AttachThreadInput");
   --  winuser.h:1701
   pragma Import (Stdcall, ReplyMessage, "ReplyMessage");    --  winuser.h:1710
   pragma Import (Stdcall, WaitMessage, "WaitMessage");      --  winuser.h:1716
   pragma Import (Stdcall, WaitForInputIdle, "WaitForInputIdle");
   --  winuser.h:1722
   pragma Import (Stdcall, DefWindowProcA, "DefWindowProcA");
   --  winuser.h:1729
   pragma Import (Stdcall, DefWindowProcW, "DefWindowProcW");
   --  winuser.h:1737
   pragma Import (Stdcall, PostQuitMessage, "PostQuitMessage");
   --  winuser.h:1751
   pragma Import (Stdcall, CallWindowProcA, "CallWindowProcA");
   --  winuser.h:1759
   pragma Import (Stdcall, CallWindowProcW, "CallWindowProcW");
   --  winuser.h:1768
   pragma Import (Stdcall, InSendMessage, "InSendMessage");
   --  winuser.h:1811
   pragma Import (Stdcall, GetDoubleClickTime, "GetDoubleClickTime");
   --  winuser.h:1817
   pragma Import (Stdcall, SetDoubleClickTime, "SetDoubleClickTime");
   --  winuser.h:1823
   pragma Import (Stdcall, RegisterClassA, "RegisterClassA");
   --  winuser.h:1829
   pragma Import (Stdcall, RegisterClassW, "RegisterClassW");
   --  winuser.h:1834
   pragma Import (Stdcall, UnregisterClassA, "UnregisterClassA");
   --  winuser.h:1845
   pragma Import (Stdcall, UnregisterClassW, "UnregisterClassW");
   --  winuser.h:1851
   pragma Import (Stdcall, GetClassInfoA, "GetClassInfoA");
   --  winuser.h:1863
   pragma Import (Stdcall, GetClassInfoW, "GetClassInfoW");
   --  winuser.h:1870
   pragma Import (Stdcall, CreateWindowExA, "CreateWindowExA");
   --  winuser.h:1891
   pragma Import (Stdcall, CreateWindowExW, "CreateWindowExW");
   --  winuser.h:1907
   pragma Import (Stdcall, IsWindow, "IsWindow");
   --  winuser.h:1941
   pragma Import (Stdcall, IsMenu, "IsMenu");
   --  winuser.h:1947
   pragma Import (Stdcall, IsChild, "IsChild");
   --  winuser.h:1953
   pragma Import (Stdcall, DestroyWindow, "DestroyWindow");
   --  winuser.h:1960
   pragma Import (Stdcall, ShowWindow, "ShowWindow");
   --  winuser.h:1966
   pragma Import (Stdcall, FlashWindow, "FlashWindow");
   --  winuser.h:1974
   pragma Import (Stdcall, ShowOwnedPopups, "ShowOwnedPopups");
   --  winuser.h:1981
   pragma Import (Stdcall, OpenIcon, "OpenIcon");
   --  winuser.h:1988
   pragma Import (Stdcall, CloseWindow, "CloseWindow");
   --  winuser.h:1994
   pragma Import (Stdcall, MoveWindow, "MoveWindow");
   --  winuser.h:2000
   pragma Import (Stdcall, SetWindowPos, "SetWindowPos");
   --  winuser.h:2012
   pragma Import (Stdcall, GetWindowPlacement, "GetWindowPlacement");
   --  winuser.h:2024
   pragma Import (Stdcall, SetWindowPlacement, "SetWindowPlacement");
   --  winuser.h:2031
   pragma Import (Stdcall, BeginDeferWindowPos, "BeginDeferWindowPos");
   --  winuser.h:2041
   pragma Import (Stdcall, DeferWindowPos, "DeferWindowPos");
   --  winuser.h:2047
   pragma Import (Stdcall, EndDeferWindowPos, "EndDeferWindowPos");
   --  winuser.h:2060
   pragma Import (Stdcall, IsWindowVisible, "IsWindowVisible");
   --  winuser.h:2068
   pragma Import (Stdcall, IsIconic, "IsIconic");
   --  winuser.h:2074
   pragma Import (Stdcall, AnyPopup, "AnyPopup");
   --  winuser.h:2080
   pragma Import (Stdcall, BringWindowToTop, "BringWindowToTop");
   --  winuser.h:2086
   pragma Import (Stdcall, IsZoomed, "IsZoomed");
   --  winuser.h:2092
   pragma Import (Stdcall, CreateDialogParamA, "CreateDialogParamA");
   --  winuser.h:2193
   pragma Import (Stdcall, CreateDialogParamW, "CreateDialogParamW");
   --  winuser.h:2202
   pragma Import (Stdcall, CreateDialogIndirectParamA,
                    "CreateDialogIndirectParamA");
   --  winuser.h:2217
   pragma Import (Stdcall, CreateDialogIndirectParamW,
                    "CreateDialogIndirectParamW");
   --  winuser.h:2226
   pragma Import (Stdcall, DialogBoxParamA, "DialogBoxParamA");
   --  winuser.h:2261
   pragma Import (Stdcall, DialogBoxParamW, "DialogBoxParamW");
   --  winuser.h:2270
   pragma Import (Stdcall, DialogBoxIndirectParamA, "DialogBoxIndirectParamA");
   --  winuser.h:2285
   pragma Import (Stdcall, DialogBoxIndirectParamW, "DialogBoxIndirectParamW");
   --  winuser.h:2294
   pragma Import (Stdcall, EndDialog, "EndDialog");
   --  winuser.h:2329
   pragma Import (Stdcall, GetDlgItem, "GetDlgItem");
   --  winuser.h:2336
   pragma Import (Stdcall, SetDlgItemInt, "SetDlgItemInt");
   --  winuser.h:2343
   pragma Import (Stdcall, GetDlgItemInt, "GetDlgItemInt");
   --  winuser.h:2352
   pragma Import (Stdcall, SetDlgItemTextA, "SetDlgItemTextA");
   --  winuser.h:2361
   pragma Import (Stdcall, SetDlgItemTextW, "SetDlgItemTextW");
   --  winuser.h:2368
   pragma Import (Stdcall, GetDlgItemTextA, "GetDlgItemTextA");
   --  winuser.h:2381
   pragma Import (Stdcall, GetDlgItemTextW, "GetDlgItemTextW");
   --  winuser.h:2389
   pragma Import (Stdcall, CheckDlgButton, "CheckDlgButton");
   --  winuser.h:2403
   pragma Import (Stdcall, CheckRadioButton, "CheckRadioButton");
   --  winuser.h:2411
   pragma Import (Stdcall, IsDlgButtonChecked, "IsDlgButtonChecked");
   --  winuser.h:2420
   pragma Import (Stdcall, SendDlgItemMessageA, "SendDlgItemMessageA");
   --  winuser.h:2427
   pragma Import (Stdcall, SendDlgItemMessageW, "SendDlgItemMessageW");
   --  winuser.h:2436
   pragma Import (Stdcall, GetNextDlgGroupItem, "GetNextDlgGroupItem");
   --  winuser.h:2451
   pragma Import (Stdcall, GetNextDlgTabItem, "GetNextDlgTabItem");
   --  winuser.h:2459
   pragma Import (Stdcall, GetDlgCtrlID, "GetDlgCtrlID");
   --  winuser.h:2467
   pragma Import (Stdcall, GetDialogBaseUnits, "GetDialogBaseUnits");
   --  winuser.h:2473
   pragma Import (Stdcall, DefDlgProcA, "DefDlgProcA");
   --  winuser.h:2478
   pragma Import (Stdcall, DefDlgProcW, "DefDlgProcW");
   --  winuser.h:2486
   pragma Import (Stdcall, CallMsgFilterA, "CallMsgFilterA");
   --  winuser.h:2509
   pragma Import (Stdcall, CallMsgFilterW, "CallMsgFilterW");
   --  winuser.h:2515
   pragma Import (Stdcall, OpenClipboard, "OpenClipboard");
   --  winuser.h:2535
   pragma Import (Stdcall, CloseClipboard, "CloseClipboard");
   --  winuser.h:2541
   pragma Import (Stdcall, GetClipboardOwner, "GetClipboardOwner");
   --  winuser.h:2547
   pragma Import (Stdcall, SetClipboardViewer, "SetClipboardViewer");
   --  winuser.h:2553
   pragma Import (Stdcall, GetClipboardViewer, "GetClipboardViewer");
   --  winuser.h:2559
   pragma Import (Stdcall, ChangeClipboardChain, "ChangeClipboardChain");
   --  winuser.h:2565
   pragma Import (Stdcall, SetClipboardData, "SetClipboardData");
   --  winuser.h:2572
   pragma Import (Stdcall, GetClipboardData, "GetClipboardData");
   --  winuser.h:2579
   pragma Import (Stdcall, RegisterClipboardFormatA,
                    "RegisterClipboardFormatA");
   --  winuser.h:2585
   pragma Import (Stdcall, RegisterClipboardFormatW,
                    "RegisterClipboardFormatW");
   --  winuser.h:2590
   pragma Import (Stdcall, CountClipboardFormats, "CountClipboardFormats");
   --  winuser.h:2601
   pragma Import (Stdcall, EnumClipboardFormats, "EnumClipboardFormats");
   --  winuser.h:2607
   pragma Import (Stdcall, GetClipboardFormatNameA, "GetClipboardFormatNameA");
   --  winuser.h:2613
   pragma Import (Stdcall, GetClipboardFormatNameW, "GetClipboardFormatNameW");
   --  winuser.h:2620
   pragma Import (Stdcall, EmptyClipboard, "EmptyClipboard");
   --  winuser.h:2633
   pragma Import (Stdcall, IsClipboardFormatAvailable,
                    "IsClipboardFormatAvailable");
   --  winuser.h:2639
   pragma Import (Stdcall, GetPriorityClipboardFormat,
                    "GetPriorityClipboardFormat");
   --  winuser.h:2645
   pragma Import (Stdcall, GetOpenClipboardWindow, "GetOpenClipboardWindow");
   --  winuser.h:2652
   pragma Import (Stdcall, CharToOemA, "CharToOemA");
   --  winuser.h:2664
   pragma Import (Stdcall, CharToOemW, "CharToOemW");
   --  winuser.h:2670
   pragma Import (Stdcall, OemToCharA, "OemToCharA");
   --  winuser.h:2682
   pragma Import (Stdcall, OemToCharW, "OemToCharW");
   --  winuser.h:2688
   pragma Import (Stdcall, CharToOemBuffA, "CharToOemBuffA");
   --  winuser.h:2700
   pragma Import (Stdcall, CharToOemBuffW, "CharToOemBuffW");
   --  winuser.h:2707
   pragma Import (Stdcall, OemToCharBuffA, "OemToCharBuffA");
   --  winuser.h:2720
   pragma Import (Stdcall, OemToCharBuffW, "OemToCharBuffW");
   --  winuser.h:2727
   pragma Import (Stdcall, CharUpperA, "CharUpperA");
   --  winuser.h:2740
   pragma Import (Stdcall, CharUpperW, "CharUpperW");
   --  winuser.h:2745
   pragma Import (Stdcall, CharUpperBuffA, "CharUpperBuffA");
   --  winuser.h:2756
   pragma Import (Stdcall, CharUpperBuffW, "CharUpperBuffW");
   --  winuser.h:2762
   pragma Import (Stdcall, CharLowerA, "CharLowerA");
   --  winuser.h:2774
   pragma Import (Stdcall, CharLowerW, "CharLowerW");
   --  winuser.h:2779
   pragma Import (Stdcall, CharLowerBuffA, "CharLowerBuffA");
   --  winuser.h:2790
   pragma Import (Stdcall, CharLowerBuffW, "CharLowerBuffW");
   --  winuser.h:2796
   pragma Import (Stdcall, CharNextA, "CharNextA");
   --  winuser.h:2808
   pragma Import (Stdcall, CharNextW, "CharNextW");
   --  winuser.h:2813
   pragma Import (Stdcall, CharPrevA, "CharPrevA");
   --  winuser.h:2824
   pragma Import (Stdcall, CharPrevW, "CharPrevW");
   --  winuser.h:2830
   pragma Import (Stdcall, IsCharAlphaA, "IsCharAlphaA");
   --  winuser.h:2861
   pragma Import (Stdcall, IsCharAlphaW, "IsCharAlphaW");
   --  winuser.h:2866
   pragma Import (Stdcall, IsCharAlphaNumericA, "IsCharAlphaNumericA");
   --  winuser.h:2877
   pragma Import (Stdcall, IsCharAlphaNumericW, "IsCharAlphaNumericW");
   --  winuser.h:2882
   pragma Import (Stdcall, IsCharUpperA, "IsCharUpperA");
   --  winuser.h:2893
   pragma Import (Stdcall, IsCharUpperW, "IsCharUpperW");
   --  winuser.h:2898
   pragma Import (Stdcall, IsCharLowerA, "IsCharLowerA");
   --  winuser.h:2909
   pragma Import (Stdcall, IsCharLowerW, "IsCharLowerW");
   --  winuser.h:2914
   pragma Import (Stdcall, SetFocus, "SetFocus");
   --  winuser.h:2927
   pragma Import (Stdcall, GetActiveWindow, "GetActiveWindow");
   --  winuser.h:2933
   pragma Import (Stdcall, GetFocus, "GetFocus");
   --  winuser.h:2939
   pragma Import (Stdcall, GetKBCodePage, "GetKBCodePage");
   --  winuser.h:2945
   pragma Import (Stdcall, GetKeyState, "GetKeyState");
   --  winuser.h:2951
   pragma Import (Stdcall, GetAsyncKeyState, "GetAsyncKeyState");
   --  winuser.h:2957
   pragma Import (Stdcall, GetKeyboardState, "GetKeyboardState");
   --  winuser.h:2963
   pragma Import (Stdcall, SetKeyboardState, "SetKeyboardState");
   --  winuser.h:2969
   pragma Import (Stdcall, GetKeyNameTextA, "GetKeyNameTextA");
   --  winuser.h:2975
   pragma Import (Stdcall, GetKeyNameTextW, "GetKeyNameTextW");
   --  winuser.h:2983
   pragma Import (Stdcall, GetKeyboardType, "GetKeyboardType");
   --  winuser.h:2997
   pragma Import (Stdcall, ToAscii, "ToAscii");
   --  winuser.h:3003
   pragma Import (Stdcall, ToUnicode, "ToUnicode");
   --  winuser.h:3014
   pragma Import (Stdcall, OemKeyScan, "OemKeyScan");
   --  winuser.h:3025
   pragma Import (Stdcall, VkKeyScanA, "VkKeyScanA");
   --  winuser.h:3031
   pragma Import (Stdcall, VkKeyScanW, "VkKeyScanW");
   --  winuser.h:3036
   pragma Import (Stdcall, keybd_event, "keybd_event");
   --  winuser.h:3050
   pragma Import (Stdcall, mouse_event, "mouse_event");
   --  winuser.h:3068
   pragma Import (Stdcall, MapVirtualKeyA, "MapVirtualKeyA");
   --  winuser.h:3078
   pragma Import (Stdcall, MapVirtualKeyW, "MapVirtualKeyW");
   --  winuser.h:3084
   pragma Import (Stdcall, GetInputState, "GetInputState");
   --  winuser.h:3097
   pragma Import (Stdcall, GetQueueStatus, "GetQueueStatus");
   --  winuser.h:3103
   pragma Import (Stdcall, GetCapture, "GetCapture");
   --  winuser.h:3109
   pragma Import (Stdcall, SetCapture, "SetCapture");
   --  winuser.h:3115
   pragma Import (Stdcall, ReleaseCapture, "ReleaseCapture");
   --  winuser.h:3121
   pragma Import (Stdcall, MsgWaitForMultipleObjects,
                    "MsgWaitForMultipleObjects");
   --  winuser.h:3127
   pragma Import (Stdcall, SetTimer, "SetTimer");
   --  winuser.h:3175
   pragma Import (Stdcall, KillTimer, "KillTimer");
   --  winuser.h:3184
   pragma Import (Stdcall, IsWindowUnicode, "IsWindowUnicode");
   --  winuser.h:3191
   pragma Import (Stdcall, EnableWindow, "EnableWindow");
   --  winuser.h:3197
   pragma Import (Stdcall, IsWindowEnabled, "IsWindowEnabled");
   --  winuser.h:3204
   pragma Import (Stdcall, LoadAcceleratorsA, "LoadAcceleratorsA");
   --  winuser.h:3210
   pragma Import (Stdcall, LoadAcceleratorsW, "LoadAcceleratorsW");
   --  winuser.h:3216
   pragma Import (Stdcall, CreateAcceleratorTableA, "CreateAcceleratorTableA");
   --  winuser.h:3228
   pragma Import (Stdcall, CreateAcceleratorTableW, "CreateAcceleratorTableW");
   --  winuser.h:3233
   pragma Import (Stdcall, DestroyAcceleratorTable, "DestroyAcceleratorTable");
   --  winuser.h:3244
   pragma Import (Stdcall, CopyAcceleratorTableA, "CopyAcceleratorTableA");
   --  winuser.h:3250
   pragma Import (Stdcall, CopyAcceleratorTableW, "CopyAcceleratorTableW");
   --  winuser.h:3257
   pragma Import (Stdcall, TranslateAcceleratorA, "TranslateAcceleratorA");
   --  winuser.h:3272
   pragma Import (Stdcall, TranslateAcceleratorW, "TranslateAcceleratorW");
   --  winuser.h:3279
   pragma Import (Stdcall, GetSystemMetrics, "GetSystemMetrics");
   --  winuser.h:3348
   pragma Import (Stdcall, LoadMenuA, "LoadMenuA");          --  winuser.h:3358
   pragma Import (Stdcall, LoadMenuW, "LoadMenuW");          --  winuser.h:3364
   pragma Import (Stdcall, LoadMenuIndirectA, "LoadMenuIndirectA");
   --  winuser.h:3376
   pragma Import (Stdcall, LoadMenuIndirectW, "LoadMenuIndirectW");
   --  winuser.h:3381
   pragma Import (Stdcall, GetMenu, "GetMenu");              --  winuser.h:3392
   pragma Import (Stdcall, SetMenu, "SetMenu");              --  winuser.h:3398
   pragma Import (Stdcall, ChangeMenuA, "ChangeMenuA");      --  winuser.h:3405
   pragma Import (Stdcall, ChangeMenuW, "ChangeMenuW");      --  winuser.h:3414
   pragma Import (Stdcall, HiliteMenuItem, "HiliteMenuItem");
   --  winuser.h:3429
   pragma Import (Stdcall, GetMenuStringA, "GetMenuStringA");
   --  winuser.h:3438
   pragma Import (Stdcall, GetMenuStringW, "GetMenuStringW");
   --  winuser.h:3447
   pragma Import (Stdcall, GetMenuState, "GetMenuState");    --  winuser.h:3462
   pragma Import (Stdcall, DrawMenuBar, "DrawMenuBar");      --  winuser.h:3470
   pragma Import (Stdcall, GetSystemMenu, "GetSystemMenu");  --  winuser.h:3477
   pragma Import (Stdcall, CreateMenu, "CreateMenu");        --  winuser.h:3486
   pragma Import (Stdcall, CreatePopupMenu, "CreatePopupMenu");
   --  winuser.h:3492
   pragma Import (Stdcall, DestroyMenu, "DestroyMenu");      --  winuser.h:3498
   pragma Import (Stdcall, CheckMenuItem, "CheckMenuItem");  --  winuser.h:3504
   pragma Import (Stdcall, EnableMenuItem, "EnableMenuItem");
   --  winuser.h:3512
   pragma Import (Stdcall, GetSubMenu, "GetSubMenu");        --  winuser.h:3520
   pragma Import (Stdcall, GetMenuItemID, "GetMenuItemID");  --  winuser.h:3527
   pragma Import (Stdcall, GetMenuItemCount, "GetMenuItemCount");
   --  winuser.h:3534
   pragma Import (Stdcall, InsertMenuA, "InsertMenuA");      --  winuser.h:3540
   pragma Import (Stdcall, InsertMenuW, "InsertMenuW");      --  winuser.h:3550
   pragma Import (Stdcall, AppendMenuA, "AppendMenuA");      --  winuser.h:3566
   pragma Import (Stdcall, AppendMenuW, "AppendMenuW");      --  winuser.h:3575
   pragma Import (Stdcall, ModifyMenuA, "ModifyMenuA");      --  winuser.h:3590
   pragma Import (Stdcall, ModifyMenuW, "ModifyMenuW");      --  winuser.h:3600
   pragma Import (Stdcall, RemoveMenu, "RemoveMenu");        --  winuser.h:3615
   pragma Import (Stdcall, DeleteMenu, "DeleteMenu");        --  winuser.h:3623
   pragma Import (Stdcall, SetMenuItemBitmaps, "SetMenuItemBitmaps");
   --  winuser.h:3631
   pragma Import (Stdcall, GetMenuCheckMarkDimensions,
                    "GetMenuCheckMarkDimensions");
   --  winuser.h:3641
   pragma Import (Stdcall, TrackPopupMenu, "TrackPopupMenu");
   --  winuser.h:3647
   pragma Import (Stdcall, DrawIcon, "DrawIcon");            --  winuser.h:3672
   pragma Import (Stdcall, DrawTextA, "DrawTextA");          --  winuser.h:3707
   pragma Import (Stdcall, DrawTextW, "DrawTextW");          --  winuser.h:3716
   pragma Import (Stdcall, GrayStringA, "GrayStringA");      --  winuser.h:3735
   pragma Import (Stdcall, GrayStringW, "GrayStringW");      --  winuser.h:3748
   pragma Import (Stdcall, TabbedTextOutA, "TabbedTextOutA");
   --  winuser.h:3769
   pragma Import (Stdcall, TabbedTextOutW, "TabbedTextOutW");
   --  winuser.h:3781
   pragma Import (Stdcall, GetTabbedTextExtentA, "GetTabbedTextExtentA");
   --  winuser.h:3799
   pragma Import (Stdcall, GetTabbedTextExtentW, "GetTabbedTextExtentW");
   --  winuser.h:3808
   pragma Import (Stdcall, UpdateWindow, "UpdateWindow");    --  winuser.h:3823
   pragma Import (Stdcall, SetActiveWindow, "SetActiveWindow");
   --  winuser.h:3829
   pragma Import (Stdcall, GetForegroundWindow, "GetForegroundWindow");
   --  winuser.h:3835
   pragma Import (Stdcall, SetForegroundWindow, "SetForegroundWindow");
   --  winuser.h:3842
   pragma Import (Stdcall, WindowFromDC, "WindowFromDC");    --  winuser.h:3848
   pragma Import (Stdcall, GetDC, "GetDC");                  --  winuser.h:3854
   pragma Import (Stdcall, GetDCEx, "GetDCEx");              --  winuser.h:3860
   pragma Import (Stdcall, GetWindowDC, "GetWindowDC");      --  winuser.h:3891
   pragma Import (Stdcall, ReleaseDC, "ReleaseDC");          --  winuser.h:3897
   pragma Import (Stdcall, BeginPaint, "BeginPaint");        --  winuser.h:3904
   pragma Import (Stdcall, EndPaint, "EndPaint");            --  winuser.h:3911
   pragma Import (Stdcall, GetUpdateRect, "GetUpdateRect");  --  winuser.h:3918
   pragma Import (Stdcall, GetUpdateRgn, "GetUpdateRgn");    --  winuser.h:3926
   pragma Import (Stdcall, ExcludeUpdateRgn, "ExcludeUpdateRgn");
   --  winuser.h:3934
   pragma Import (Stdcall, InvalidateRect, "InvalidateRect");
   --  winuser.h:3941
   pragma Import (Stdcall, ValidateRect, "ValidateRect");    --  winuser.h:3949
   pragma Import (Stdcall, InvalidateRgn, "InvalidateRgn");  --  winuser.h:3956
   pragma Import (Stdcall, ValidateRgn, "ValidateRgn");      --  winuser.h:3964
   pragma Import (Stdcall, RedrawWindow, "RedrawWindow");    --  winuser.h:3972
   pragma Import (Stdcall, LockWindowUpdate, "LockWindowUpdate");
   --  winuser.h:4007
   pragma Import (Stdcall, ScrollWindow, "ScrollWindow");    --  winuser.h:4013
   pragma Import (Stdcall, ScrollDC, "ScrollDC");            --  winuser.h:4023
   pragma Import (Stdcall, ScrollWindowEx, "ScrollWindowEx");
   --  winuser.h:4035
   pragma Import (Stdcall, SetScrollPos, "SetScrollPos");    --  winuser.h:4056
   pragma Import (Stdcall, GetScrollPos, "GetScrollPos");    --  winuser.h:4065
   pragma Import (Stdcall, SetScrollRange, "SetScrollRange");
   --  winuser.h:4072
   pragma Import (Stdcall, GetScrollRange, "GetScrollRange");
   --  winuser.h:4082
   pragma Import (Stdcall, ShowScrollBar, "ShowScrollBar");
   --  winuser.h:4092
   pragma Import (Stdcall, EnableScrollBar, "EnableScrollBar");
   --  winuser.h:4100
   pragma Import (Stdcall, SetPropA, "SetPropA");            --  winuser.h:4127
   pragma Import (Stdcall, SetPropW, "SetPropW");            --  winuser.h:4134
   pragma Import (Stdcall, GetPropA, "GetPropA");            --  winuser.h:4147
   pragma Import (Stdcall, GetPropW, "GetPropW");            --  winuser.h:4153
   pragma Import (Stdcall, RemovePropA, "RemovePropA");      --  winuser.h:4165
   pragma Import (Stdcall, RemovePropW, "RemovePropW");      --  winuser.h:4171
   pragma Import (Stdcall, EnumPropsExA, "EnumPropsExA");    --  winuser.h:4183
   pragma Import (Stdcall, EnumPropsExW, "EnumPropsExW");    --  winuser.h:4190
   pragma Import (Stdcall, EnumPropsA, "EnumPropsA");        --  winuser.h:4203
   pragma Import (Stdcall, EnumPropsW, "EnumPropsW");        --  winuser.h:4209
   pragma Import (Stdcall, SetWindowTextA, "SetWindowTextA");
   --  winuser.h:4221
   pragma Import (Stdcall, SetWindowTextW, "SetWindowTextW");
   --  winuser.h:4227
   pragma Import (Stdcall, GetWindowTextA, "GetWindowTextA");
   --  winuser.h:4239
   pragma Import (Stdcall, GetWindowTextW, "GetWindowTextW");
   --  winuser.h:4246
   pragma Import (Stdcall, GetWindowTextLengthA, "GetWindowTextLengthA");
   --  winuser.h:4259
   pragma Import (Stdcall, GetWindowTextLengthW, "GetWindowTextLengthW");
   --  winuser.h:4264
   pragma Import (Stdcall, GetClientRect, "GetClientRect");  --  winuser.h:4275
   pragma Import (Stdcall, GetWindowRect, "GetWindowRect");  --  winuser.h:4282
   pragma Import (Stdcall, AdjustWindowRect, "AdjustWindowRect");
   --  winuser.h:4289
   pragma Import (Stdcall, AdjustWindowRectEx, "AdjustWindowRectEx");
   --  winuser.h:4297
   pragma Import (Stdcall, MessageBoxA, "MessageBoxA");      --  winuser.h:4348
   pragma Import (Stdcall, MessageBoxW, "MessageBoxW");      --  winuser.h:4356
   pragma Import (Stdcall, MessageBoxExA, "MessageBoxExA");  --  winuser.h:4370
   pragma Import (Stdcall, MessageBoxExW, "MessageBoxExW");  --  winuser.h:4379
   pragma Import (Stdcall, MessageBeep, "MessageBeep");      --  winuser.h:4397
   pragma Import (Stdcall, ShowCursor, "ShowCursor");        --  winuser.h:4405
   pragma Import (Stdcall, SetCursorPos, "SetCursorPos");    --  winuser.h:4411
   pragma Import (Stdcall, SetCursor, "SetCursor");          --  winuser.h:4418
   pragma Import (Stdcall, GetCursorPos, "GetCursorPos");    --  winuser.h:4424
   pragma Import (Stdcall, ClipCursor, "ClipCursor");        --  winuser.h:4430
   pragma Import (Stdcall, GetClipCursor, "GetClipCursor");
   --  winuser.h:4436
   pragma Import (Stdcall, GetCursor, "GetCursor");          --  winuser.h:4442
   pragma Import (Stdcall, CreateCaret, "CreateCaret");      --  winuser.h:4448
   pragma Import (Stdcall, GetCaretBlinkTime, "GetCaretBlinkTime");
   --  winuser.h:4457
   pragma Import (Stdcall, SetCaretBlinkTime, "SetCaretBlinkTime");
   --  winuser.h:4463
   pragma Import (Stdcall, DestroyCaret, "DestroyCaret");    --  winuser.h:4469
   pragma Import (Stdcall, HideCaret, "HideCaret");          --  winuser.h:4475
   pragma Import (Stdcall, ShowCaret, "ShowCaret");          --  winuser.h:4481
   pragma Import (Stdcall, SetCaretPos, "SetCaretPos");      --  winuser.h:4487
   pragma Import (Stdcall, GetCaretPos, "GetCaretPos");      --  winuser.h:4494
   pragma Import (Stdcall, ClientToScreen, "ClientToScreen");
   --  winuser.h:4500
   pragma Import (Stdcall, ScreenToClient, "ScreenToClient");
   --  winuser.h:4507
   pragma Import (Stdcall, MapWindowPoints, "MapWindowPoints");
   --  winuser.h:4514
   pragma Import (Stdcall, WindowFromPoint, "WindowFromPoint");
   --  winuser.h:4523
   pragma Import (Stdcall, ChildWindowFromPoint, "ChildWindowFromPoint");
   --  winuser.h:4529
   pragma Import (Stdcall, GetSysColor, "GetSysColor");      --  winuser.h:4576
   pragma Import (Stdcall, SetSysColors, "SetSysColors");    --  winuser.h:4583
   pragma Import (Stdcall, DrawFocusRect, "DrawFocusRect");  --  winuser.h:4593
   pragma Import (Stdcall, FillRect, "FillRect");            --  winuser.h:4600
   pragma Import (Stdcall, FrameRect, "FrameRect");          --  winuser.h:4608
   pragma Import (Stdcall, InvertRect, "InvertRect");        --  winuser.h:4616
   pragma Import (Stdcall, SetRect, "SetRect");              --  winuser.h:4623
   pragma Import (Stdcall, SetRectEmpty, "SetRectEmpty");    --  winuser.h:4633
   pragma Import (Stdcall, CopyRect, "CopyRect");            --  winuser.h:4639
   pragma Import (Stdcall, InflateRect, "InflateRect");      --  winuser.h:4646
   pragma Import (Stdcall, IntersectRect, "IntersectRect");  --  winuser.h:4654
   pragma Import (Stdcall, UnionRect, "UnionRect");          --  winuser.h:4662
   pragma Import (Stdcall, SubtractRect, "SubtractRect");    --  winuser.h:4670
   pragma Import (Stdcall, OffsetRect, "OffsetRect");        --  winuser.h:4678
   pragma Import (Stdcall, IsRectEmpty, "IsRectEmpty");      --  winuser.h:4686
   pragma Import (Stdcall, EqualRect, "EqualRect");          --  winuser.h:4692
   pragma Import (Stdcall, PtInRect, "PtInRect");            --  winuser.h:4699
   pragma Import (Stdcall, GetWindowWord, "GetWindowWord");  --  winuser.h:4708
   pragma Import (Stdcall, SetWindowWord, "SetWindowWord");
   --  winuser.h:4715
   pragma Import (Stdcall, GetWindowLongA, "GetWindowLongA");
   --  winuser.h:4723
   pragma Import (Stdcall, GetWindowLongW, "GetWindowLongW");
   --  winuser.h:4729
   pragma Import (Stdcall, SetWindowLongA, "SetWindowLongA");
   --  winuser.h:4741
   pragma Import (Stdcall, SetWindowLongW, "SetWindowLongW");
   --
   pragma Import (Stdcall, GetWindowLongPtrA, "GetWindowLongPtrA");
   pragma Import (Stdcall, GetWindowLongPtrW, "GetWindowLongPtrW");
   pragma Import (Stdcall, SetWindowLongPtrA, "SetWindowLongPtrA");
   pragma Import (Stdcall, SetWindowLongPtrW, "SetWindowLongPtrW");
   --  winuser.h:4748
   pragma Import (Stdcall, GetClassWord, "GetClassWord");    --  winuser.h:4761
   pragma Import (Stdcall, SetClassWord, "SetClassWord");    --  winuser.h:4768
   pragma Import (Stdcall, GetClassLongA, "GetClassLongA");  --  winuser.h:4776
   pragma Import (Stdcall, GetClassLongW, "GetClassLongW");  --  winuser.h:4782
   pragma Import (Stdcall, SetClassLongA, "SetClassLongA");  --  winuser.h:4794
   pragma Import (Stdcall, SetClassLongW, "SetClassLongW");  --  winuser.h:4801
   pragma Import (Stdcall, GetDesktopWindow, "GetDesktopWindow");
   --  winuser.h:4816
   pragma Import (Stdcall, GetParent, "GetParent");          --  winuser.h:4823
   pragma Import (Stdcall, SetParent, "SetParent");          --  winuser.h:4829
   pragma Import (Stdcall, EnumChildWindows, "EnumChildWindows");
   --  winuser.h:4836
   pragma Import (Stdcall, FindWindowA, "FindWindowA");      --  winuser.h:4844
   pragma Import (Stdcall, FindWindowW, "FindWindowW");      --  winuser.h:4850
   pragma Import (Stdcall, EnumWindows, "EnumWindows");      --  winuser.h:4863
   pragma Import (Stdcall, EnumThreadWindows, "EnumThreadWindows");
   --  winuser.h:4870
   pragma Import (Stdcall, GetClassNameA, "GetClassNameA");  --  winuser.h:4880
   pragma Import (Stdcall, GetClassNameW, "GetClassNameW");  --  winuser.h:4887
   pragma Import (Stdcall, GetTopWindow, "GetTopWindow");    --  winuser.h:4900
   pragma Import (Stdcall, GetWindowThreadProcessId,
                    "GetWindowThreadProcessId");
   --  winuser.h:4910
   pragma Import (Stdcall, GetLastActivePopup, "GetLastActivePopup");
   --  winuser.h:4919
   pragma Import (Stdcall, GetWindow, "GetWindow");          --  winuser.h:4937
   pragma Import (Stdcall, SetWindowsHookA, "SetWindowsHookA");
   --  winuser.h:4950
   pragma Import (Stdcall, SetWindowsHookW, "SetWindowsHookW");
   --  winuser.h:4956
   pragma Import (Stdcall, UnhookWindowsHook, "UnhookWindowsHook");
   --  winuser.h:4990
   pragma Import (Stdcall, SetWindowsHookExA, "SetWindowsHookExA");
   --  winuser.h:4997
   pragma Import (Stdcall, SetWindowsHookExW, "SetWindowsHookExW");
   --  winuser.h:5005
   pragma Import (Stdcall, UnhookWindowsHookEx, "UnhookWindowsHookEx");
   --  winuser.h:5019
   pragma Import (Stdcall, CallNextHookEx, "CallNextHookEx");
   --  winuser.h:5025
   pragma Import (Stdcall, LoadBitmapA, "LoadBitmapA");      --  winuser.h:5156
   pragma Import (Stdcall, LoadBitmapW, "LoadBitmapW");      --  winuser.h:5162
   pragma Import (Stdcall, LoadCursorA, "LoadCursorA");      --  winuser.h:5174
   pragma Import (Stdcall, LoadCursorW, "LoadCursorW");      --  winuser.h:5180
   pragma Import (Stdcall, CreateCursor, "CreateCursor");    --  winuser.h:5193
   pragma Import (Stdcall, DestroyCursor, "DestroyCursor");  --  winuser.h:5205
   pragma Import (Stdcall, LoadIconA, "LoadIconA");          --  winuser.h:5240
   pragma Import (Stdcall, LoadIconW, "LoadIconW");          --  winuser.h:5246
   pragma Import (Stdcall, CreateIcon, "CreateIcon");        --  winuser.h:5258
   pragma Import (Stdcall, DestroyIcon, "DestroyIcon");      --  winuser.h:5270
   pragma Import (Stdcall, LookupIconIdFromDirectory,
                    "LookupIconIdFromDirectory");
   --  winuser.h:5276
   pragma Import (Stdcall, CreateIconFromResource, "CreateIconFromResource");
   --  winuser.h:5284
   pragma Import (Stdcall, CreateIconIndirect, "CreateIconIndirect");
   --  winuser.h:5294
   pragma Import (Stdcall, CopyIcon, "CopyIcon");            --  winuser.h:5300
   pragma Import (Stdcall, GetIconInfo, "GetIconInfo");      --  winuser.h:5306
   pragma Import (Stdcall, LoadStringA, "LoadStringA");      --  winuser.h:5406
   pragma Import (Stdcall, LoadStringW, "LoadStringW");      --  winuser.h:5414
   pragma Import (Stdcall, IsDialogMessageA, "IsDialogMessageA");
   --  winuser.h:5609
   pragma Import (Stdcall, IsDialogMessageW, "IsDialogMessageW");
   --  winuser.h:5615
   pragma Import (Stdcall, MapDialogRect, "MapDialogRect");  --  winuser.h:5629
   pragma Import (Stdcall, DlgDirListA, "DlgDirListA");      --  winuser.h:5636
   pragma Import (Stdcall, DlgDirListW, "DlgDirListW");      --  winuser.h:5645
   pragma Import (Stdcall, DlgDirSelectExA, "DlgDirSelectExA");
   --  winuser.h:5674
   pragma Import (Stdcall, DlgDirSelectExW, "DlgDirSelectExW");
   --  winuser.h:5682
   pragma Import (Stdcall, DlgDirListComboBoxA, "DlgDirListComboBoxA");
   --  winuser.h:5696
   pragma Import (Stdcall, DlgDirListComboBoxW, "DlgDirListComboBoxW");
   --  winuser.h:5705
   pragma Import (Stdcall, DlgDirSelectComboBoxExA, "DlgDirSelectComboBoxExA");
   --  winuser.h:5720
   pragma Import (Stdcall, DlgDirSelectComboBoxExW, "DlgDirSelectComboBoxExW");
   --  winuser.h:5728
   pragma Import (Stdcall, DefFrameProcA, "DefFrameProcA");
   --  winuser.h:6038
   pragma Import (Stdcall, DefFrameProcW, "DefFrameProcW");
   --  winuser.h:6047
   pragma Import (Stdcall, DefMDIChildProcA, "DefMDIChildProcA");
   --  winuser.h:6062
   pragma Import (Stdcall, DefMDIChildProcW, "DefMDIChildProcW");
   --  winuser.h:6070
   pragma Import (Stdcall, TranslateMDISysAccel, "TranslateMDISysAccel");
   --  winuser.h:6086
   pragma Import (Stdcall, ArrangeIconicWindows, "ArrangeIconicWindows");
   --  winuser.h:6095
   pragma Import (Stdcall, CreateMDIWindowA, "CreateMDIWindowA");
   --  winuser.h:6101
   pragma Import (Stdcall, CreateMDIWindowW, "CreateMDIWindowW");
   --  winuser.h:6116
   pragma Import (Stdcall, WinHelpA, "WinHelpA");
   --  winuser.h:6213
   pragma Import (Stdcall, WinHelpW, "WinHelpW");
   --  winuser.h:6222
   pragma Import (Stdcall, SystemParametersInfoA, "SystemParametersInfoA");
   --  winuser.h:6322
   pragma Import (Stdcall, SystemParametersInfoW, "SystemParametersInfoW");
   --  winuser.h:6330
   pragma Import (Stdcall, SetDebugErrorLevel, "SetDebugErrorLevel");
   --  winuser.h:6503
   pragma Import (Stdcall, SetLastErrorEx, "SetLastErrorEx");
   --  winuser.h:6518

end Win32.Winuser;
