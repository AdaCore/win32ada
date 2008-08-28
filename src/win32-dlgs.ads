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

package Win32.Dlgs is

   ctlFirst : constant := 16#400#;        --  dlgs.h:13
   ctlLast : constant := 16#4ff#;        --  dlgs.h:14
   psh1 : constant := 16#400#;        --  dlgs.h:16
   psh2 : constant := 16#401#;        --  dlgs.h:17
   psh3 : constant := 16#402#;        --  dlgs.h:18
   psh4 : constant := 16#403#;        --  dlgs.h:19
   psh5 : constant := 16#404#;        --  dlgs.h:20
   psh6 : constant := 16#405#;        --  dlgs.h:21
   psh7 : constant := 16#406#;        --  dlgs.h:22
   psh8 : constant := 16#407#;        --  dlgs.h:23
   psh9 : constant := 16#408#;        --  dlgs.h:24
   psh10 : constant := 16#409#;        --  dlgs.h:25
   psh11 : constant := 16#40a#;        --  dlgs.h:26
   psh12 : constant := 16#40b#;        --  dlgs.h:27
   psh13 : constant := 16#40c#;        --  dlgs.h:28
   psh14 : constant := 16#40d#;        --  dlgs.h:29
   psh15 : constant := 16#40e#;        --  dlgs.h:30
   pshHelp : constant := 16#40e#;        --  dlgs.h:31
   psh16 : constant := 16#40f#;        --  dlgs.h:32
   chx1 : constant := 16#410#;        --  dlgs.h:34
   chx2 : constant := 16#411#;        --  dlgs.h:35
   chx3 : constant := 16#412#;        --  dlgs.h:36
   chx4 : constant := 16#413#;        --  dlgs.h:37
   chx5 : constant := 16#414#;        --  dlgs.h:38
   chx6 : constant := 16#415#;        --  dlgs.h:39
   chx7 : constant := 16#416#;        --  dlgs.h:40
   chx8 : constant := 16#417#;        --  dlgs.h:41
   chx9 : constant := 16#418#;        --  dlgs.h:42
   chx10 : constant := 16#419#;        --  dlgs.h:43
   chx11 : constant := 16#41a#;        --  dlgs.h:44
   chx12 : constant := 16#41b#;        --  dlgs.h:45
   chx13 : constant := 16#41c#;        --  dlgs.h:46
   chx14 : constant := 16#41d#;        --  dlgs.h:47
   chx15 : constant := 16#41e#;        --  dlgs.h:48
   chx16 : constant := 16#41d#;        --  dlgs.h:49
   rad1 : constant := 16#420#;        --  dlgs.h:51
   rad2 : constant := 16#421#;        --  dlgs.h:52
   rad3 : constant := 16#422#;        --  dlgs.h:53
   rad4 : constant := 16#423#;        --  dlgs.h:54
   rad5 : constant := 16#424#;        --  dlgs.h:55
   rad6 : constant := 16#425#;        --  dlgs.h:56
   rad7 : constant := 16#426#;        --  dlgs.h:57
   rad8 : constant := 16#427#;        --  dlgs.h:58
   rad9 : constant := 16#428#;        --  dlgs.h:59
   rad10 : constant := 16#429#;        --  dlgs.h:60
   rad11 : constant := 16#42a#;        --  dlgs.h:61
   rad12 : constant := 16#42b#;        --  dlgs.h:62
   rad13 : constant := 16#42c#;        --  dlgs.h:63
   rad14 : constant := 16#42d#;        --  dlgs.h:64
   rad15 : constant := 16#42e#;        --  dlgs.h:65
   rad16 : constant := 16#42f#;        --  dlgs.h:66
   grp1 : constant := 16#430#;        --  dlgs.h:68
   grp2 : constant := 16#431#;        --  dlgs.h:69
   grp3 : constant := 16#432#;        --  dlgs.h:70
   grp4 : constant := 16#433#;        --  dlgs.h:71
   frm1 : constant := 16#434#;        --  dlgs.h:72
   frm2 : constant := 16#435#;        --  dlgs.h:73
   frm3 : constant := 16#436#;        --  dlgs.h:74
   frm4 : constant := 16#437#;        --  dlgs.h:75
   rct1 : constant := 16#438#;        --  dlgs.h:76
   rct2 : constant := 16#439#;        --  dlgs.h:77
   rct3 : constant := 16#43a#;        --  dlgs.h:78
   rct4 : constant := 16#43b#;        --  dlgs.h:79
   ico1 : constant := 16#43c#;        --  dlgs.h:80
   ico2 : constant := 16#43d#;        --  dlgs.h:81
   ico3 : constant := 16#43e#;        --  dlgs.h:82
   ico4 : constant := 16#43f#;        --  dlgs.h:83
   stc1 : constant := 16#440#;        --  dlgs.h:85
   stc2 : constant := 16#441#;        --  dlgs.h:86
   stc3 : constant := 16#442#;        --  dlgs.h:87
   stc4 : constant := 16#443#;        --  dlgs.h:88
   stc5 : constant := 16#444#;        --  dlgs.h:89
   stc6 : constant := 16#445#;        --  dlgs.h:90
   stc7 : constant := 16#446#;        --  dlgs.h:91
   stc8 : constant := 16#447#;        --  dlgs.h:92
   stc9 : constant := 16#448#;        --  dlgs.h:93
   stc10 : constant := 16#449#;        --  dlgs.h:94
   stc11 : constant := 16#44a#;        --  dlgs.h:95
   stc12 : constant := 16#44b#;        --  dlgs.h:96
   stc13 : constant := 16#44c#;        --  dlgs.h:97
   stc14 : constant := 16#44d#;        --  dlgs.h:98
   stc15 : constant := 16#44e#;        --  dlgs.h:99
   stc16 : constant := 16#44f#;        --  dlgs.h:100
   stc17 : constant := 16#450#;        --  dlgs.h:101
   stc18 : constant := 16#451#;        --  dlgs.h:102
   stc19 : constant := 16#452#;        --  dlgs.h:103
   stc20 : constant := 16#453#;        --  dlgs.h:104
   stc21 : constant := 16#454#;        --  dlgs.h:105
   stc22 : constant := 16#455#;        --  dlgs.h:106
   stc23 : constant := 16#456#;        --  dlgs.h:107
   stc24 : constant := 16#457#;        --  dlgs.h:108
   stc25 : constant := 16#458#;        --  dlgs.h:109
   stc26 : constant := 16#459#;        --  dlgs.h:110
   stc27 : constant := 16#45a#;        --  dlgs.h:111
   stc28 : constant := 16#45b#;        --  dlgs.h:112
   stc29 : constant := 16#45c#;        --  dlgs.h:113
   stc30 : constant := 16#45d#;        --  dlgs.h:114
   stc31 : constant := 16#45e#;        --  dlgs.h:115
   stc32 : constant := 16#45f#;        --  dlgs.h:116
   lst1 : constant := 16#460#;        --  dlgs.h:118
   lst2 : constant := 16#461#;        --  dlgs.h:119
   lst3 : constant := 16#462#;        --  dlgs.h:120
   lst4 : constant := 16#463#;        --  dlgs.h:121
   lst5 : constant := 16#464#;        --  dlgs.h:122
   lst6 : constant := 16#465#;        --  dlgs.h:123
   lst7 : constant := 16#466#;        --  dlgs.h:124
   lst8 : constant := 16#467#;        --  dlgs.h:125
   lst9 : constant := 16#468#;        --  dlgs.h:126
   lst10 : constant := 16#469#;        --  dlgs.h:127
   lst11 : constant := 16#46a#;        --  dlgs.h:128
   lst12 : constant := 16#46b#;        --  dlgs.h:129
   lst13 : constant := 16#46c#;        --  dlgs.h:130
   lst14 : constant := 16#46d#;        --  dlgs.h:131
   lst15 : constant := 16#46e#;        --  dlgs.h:132
   lst16 : constant := 16#46f#;        --  dlgs.h:133
   cmb1 : constant := 16#470#;        --  dlgs.h:135
   cmb2 : constant := 16#471#;        --  dlgs.h:136
   cmb3 : constant := 16#472#;        --  dlgs.h:137
   cmb4 : constant := 16#473#;        --  dlgs.h:138
   cmb5 : constant := 16#474#;        --  dlgs.h:139
   cmb6 : constant := 16#475#;        --  dlgs.h:140
   cmb7 : constant := 16#476#;        --  dlgs.h:141
   cmb8 : constant := 16#477#;        --  dlgs.h:142
   cmb9 : constant := 16#478#;        --  dlgs.h:143
   cmb10 : constant := 16#479#;        --  dlgs.h:144
   cmb11 : constant := 16#47a#;        --  dlgs.h:145
   cmb12 : constant := 16#47b#;        --  dlgs.h:146
   cmb13 : constant := 16#47c#;        --  dlgs.h:147
   cmb14 : constant := 16#47d#;        --  dlgs.h:148
   cmb15 : constant := 16#47e#;        --  dlgs.h:149
   cmb16 : constant := 16#47f#;        --  dlgs.h:150
   edt1 : constant := 16#480#;        --  dlgs.h:152
   edt2 : constant := 16#481#;        --  dlgs.h:153
   edt3 : constant := 16#482#;        --  dlgs.h:154
   edt4 : constant := 16#483#;        --  dlgs.h:155
   edt5 : constant := 16#484#;        --  dlgs.h:156
   edt6 : constant := 16#485#;        --  dlgs.h:157
   edt7 : constant := 16#486#;        --  dlgs.h:158
   edt8 : constant := 16#487#;        --  dlgs.h:159
   edt9 : constant := 16#488#;        --  dlgs.h:160
   edt10 : constant := 16#489#;        --  dlgs.h:161
   edt11 : constant := 16#48a#;        --  dlgs.h:162
   edt12 : constant := 16#48b#;        --  dlgs.h:163
   edt13 : constant := 16#48c#;        --  dlgs.h:164
   edt14 : constant := 16#48d#;        --  dlgs.h:165
   edt15 : constant := 16#48e#;        --  dlgs.h:166
   edt16 : constant := 16#48f#;        --  dlgs.h:167
   scr1 : constant := 16#490#;        --  dlgs.h:169
   scr2 : constant := 16#491#;        --  dlgs.h:170
   scr3 : constant := 16#492#;        --  dlgs.h:171
   scr4 : constant := 16#493#;        --  dlgs.h:172
   scr5 : constant := 16#494#;        --  dlgs.h:173
   scr6 : constant := 16#495#;        --  dlgs.h:174
   scr7 : constant := 16#496#;        --  dlgs.h:175
   scr8 : constant := 16#497#;        --  dlgs.h:176
   FILEOPENORD : constant := 1536;           --  dlgs.h:182
   MULTIFILEOPENORD : constant := 1537;           --  dlgs.h:183
   PRINTDLGORD : constant := 1538;           --  dlgs.h:184
   PRNSETUPDLGORD : constant := 1539;           --  dlgs.h:185
   FINDDLGORD : constant := 1540;           --  dlgs.h:186
   REPLACEDLGORD : constant := 1541;           --  dlgs.h:187
   FONTDLGORD : constant := 1542;           --  dlgs.h:188
   FORMATDLGORD31 : constant := 1543;           --  dlgs.h:189
   FORMATDLGORD30 : constant := 1544;           --  dlgs.h:190

   type CRGB is                                            --  dlgs.h:193
      record
         bRed : Win32.BYTE;                             --  dlgs.h:195
         bGreen : Win32.BYTE;                             --  dlgs.h:196
         bBlue : Win32.BYTE;                             --  dlgs.h:197
         bExtra : Win32.BYTE;                             --  dlgs.h:198
      end record;

private

   pragma Convention (C_Pass_By_Copy, CRGB);                     --  dlgs.h:193

end Win32.Dlgs;
