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

with Ada.Unchecked_Conversion;
with Win32.Windef;
with Win32.Winnt;

package Win32.Wingdi is

   R2_BLACK : constant := 1;             --  wingdi.h:43
   R2_NOTMERGEPEN : constant := 2;             --  wingdi.h:44
   R2_MASKNOTPEN : constant := 3;             --  wingdi.h:45
   R2_NOTCOPYPEN : constant := 4;             --  wingdi.h:46
   R2_MASKPENNOT : constant := 5;             --  wingdi.h:47
   R2_NOT : constant := 6;             --  wingdi.h:48
   R2_XORPEN : constant := 7;             --  wingdi.h:49
   R2_NOTMASKPEN : constant := 8;             --  wingdi.h:50
   R2_MASKPEN : constant := 9;             --  wingdi.h:51
   R2_NOTXORPEN : constant := 10;            --  wingdi.h:52
   R2_NOP : constant := 11;            --  wingdi.h:53
   R2_MERGENOTPEN : constant := 12;            --  wingdi.h:54
   R2_COPYPEN : constant := 13;            --  wingdi.h:55
   R2_MERGEPENNOT : constant := 14;            --  wingdi.h:56
   R2_MERGEPEN : constant := 15;            --  wingdi.h:57
   R2_WHITE : constant := 16;            --  wingdi.h:58
   R2_LAST : constant := 16;            --  wingdi.h:59
   SRCCOPY : constant DWORD := 16#cc0020#;
   --  wingdi.h:62
   SRCPAINT : constant DWORD := 16#ee0086#;
   --  wingdi.h:63
   SRCAND : constant DWORD := 16#8800c6#;
   --  wingdi.h:64
   SRCINVERT : constant DWORD := 16#660046#;
   --  wingdi.h:65
   SRCERASE : constant DWORD := 16#440328#;
   --  wingdi.h:66
   NOTSRCCOPY : constant DWORD := 16#330008#;
   --  wingdi.h:67
   NOTSRCERASE : constant DWORD := 16#1100a6#;
   --  wingdi.h:68
   MERGECOPY : constant DWORD := 16#c000ca#;
   --  wingdi.h:69
   MERGEPAINT : constant DWORD := 16#bb0226#;
   --  wingdi.h:70
   PATCOPY : constant DWORD := 16#f00021#;
   --  wingdi.h:71
   PATPAINT : constant DWORD := 16#fb0a09#;
   --  wingdi.h:72
   PATINVERT : constant DWORD := 16#5a0049#;
   --  wingdi.h:73
   DSTINVERT : constant DWORD := 16#550009#;
   --  wingdi.h:74
   BLACKNESS : constant DWORD := 16#42#;  --  wingdi.h:75
   WHITENESS : constant DWORD := 16#ff0062#;
   --  wingdi.h:76
   GDI_ERROR : constant := 16#ffffffff#;  --  wingdi.h:83
   HGDI_ERROR : constant Win32.Winnt.HANDLE;
   --  wingdi.h:84
   ERROR : constant := 0;             --  wingdi.h:87
   NULLREGION : constant := 1;             --  wingdi.h:88
   SIMPLEREGION : constant := 2;             --  wingdi.h:89
   COMPLEXREGION : constant := 3;             --  wingdi.h:90
   RGN_ERROR : constant := 0;             --  wingdi.h:91
   RGN_AND : constant := 1;             --  wingdi.h:94
   RGN_OR : constant := 2;             --  wingdi.h:95
   RGN_XOR : constant := 3;             --  wingdi.h:96
   RGN_DIFF : constant := 4;             --  wingdi.h:97
   RGN_COPY : constant := 5;             --  wingdi.h:98
   RGN_MIN : constant := 1;             --  wingdi.h:99
   RGN_MAX : constant := 5;             --  wingdi.h:100
   BLACKONWHITE : constant := 1;             --  wingdi.h:103
   WHITEONBLACK : constant := 2;             --  wingdi.h:104
   COLORONCOLOR : constant := 3;             --  wingdi.h:105
   HALFTONE : constant := 4;             --  wingdi.h:106
   MAXSTRETCHBLTMODE : constant := 4;             --  wingdi.h:107
   ALTERNATE : constant := 1;             --  wingdi.h:111
   WINDING : constant := 2;             --  wingdi.h:112
   POLYFILL_LAST : constant := 2;             --  wingdi.h:113
   TA_NOUPDATECP : constant := 0;             --  wingdi.h:116
   TA_UPDATECP : constant := 1;             --  wingdi.h:117
   TA_LEFT : constant := 0;             --  wingdi.h:119
   TA_RIGHT : constant := 2;             --  wingdi.h:120
   TA_CENTER : constant := 6;             --  wingdi.h:121
   TA_TOP : constant := 0;             --  wingdi.h:123
   TA_BOTTOM : constant := 8;             --  wingdi.h:124
   TA_BASELINE : constant := 24;            --  wingdi.h:125
   TA_MASK : constant := 31;            --  wingdi.h:126
   VTA_BASELINE : constant := 24;            --  wingdi.h:128
   VTA_LEFT : constant := 8;             --  wingdi.h:129
   VTA_RIGHT : constant := 0;             --  wingdi.h:130
   VTA_CENTER : constant := 6;             --  wingdi.h:131
   VTA_BOTTOM : constant := 2;             --  wingdi.h:132
   VTA_TOP : constant := 0;             --  wingdi.h:133
   ETO_OPAQUE : constant := 16#2#;         --  wingdi.h:136
   ETO_CLIPPED : constant := 16#4#;         --  wingdi.h:137
   ASPECT_FILTERING : constant := 16#1#;         --  wingdi.h:139
   DCB_RESET : constant := 16#1#;         --  wingdi.h:143
   DCB_ACCUMULATE : constant := 16#2#;         --  wingdi.h:144
   DCB_DIRTY : constant := 16#2#;         --  wingdi.h:145
   DCB_SET : constant := 16#3#;         --  wingdi.h:146
   DCB_ENABLE : constant := 16#4#;         --  wingdi.h:147
   DCB_DISABLE : constant := 16#8#;         --  wingdi.h:148
   META_SETBKCOLOR : constant := 16#201#;       --  wingdi.h:153
   META_SETBKMODE : constant := 16#102#;       --  wingdi.h:154
   META_SETMAPMODE : constant := 16#103#;       --  wingdi.h:155
   META_SETROP2 : constant := 16#104#;       --  wingdi.h:156
   META_SETRELABS : constant := 16#105#;       --  wingdi.h:157
   META_SETPOLYFILLMODE : constant := 16#106#;       --  wingdi.h:158
   META_SETSTRETCHBLTMODE : constant := 16#107#;       --  wingdi.h:159
   META_SETTEXTCHAREXTRA : constant := 16#108#;       --  wingdi.h:160
   META_SETTEXTCOLOR : constant := 16#209#;       --  wingdi.h:161
   META_SETTEXTJUSTIFICATION : constant := 16#20a#;       --  wingdi.h:162
   META_SETWINDOWORG : constant := 16#20b#;       --  wingdi.h:163
   META_SETWINDOWEXT : constant := 16#20c#;       --  wingdi.h:164
   META_SETVIEWPORTORG : constant := 16#20d#;       --  wingdi.h:165
   META_SETVIEWPORTEXT : constant := 16#20e#;       --  wingdi.h:166
   META_OFFSETWINDOWORG : constant := 16#20f#;       --  wingdi.h:167
   META_SCALEWINDOWEXT : constant := 16#410#;       --  wingdi.h:168
   META_OFFSETVIEWPORTORG : constant := 16#211#;       --  wingdi.h:169
   META_SCALEVIEWPORTEXT : constant := 16#412#;       --  wingdi.h:170
   META_LINETO : constant := 16#213#;       --  wingdi.h:171
   META_MOVETO : constant := 16#214#;       --  wingdi.h:172
   META_EXCLUDECLIPRECT : constant := 16#415#;       --  wingdi.h:173
   META_INTERSECTCLIPRECT : constant := 16#416#;       --  wingdi.h:174
   META_ARC : constant := 16#817#;       --  wingdi.h:175
   META_ELLIPSE : constant := 16#418#;       --  wingdi.h:176
   META_FLOODFILL : constant := 16#419#;       --  wingdi.h:177
   META_PIE : constant := 16#81a#;       --  wingdi.h:178
   META_RECTANGLE : constant := 16#41b#;       --  wingdi.h:179
   META_ROUNDRECT : constant := 16#61c#;       --  wingdi.h:180
   META_PATBLT : constant := 16#61d#;       --  wingdi.h:181
   META_SAVEDC : constant := 16#1e#;        --  wingdi.h:182
   META_SETPIXEL : constant := 16#41f#;       --  wingdi.h:183
   META_OFFSETCLIPRGN : constant := 16#220#;       --  wingdi.h:184
   META_TEXTOUT : constant := 16#521#;       --  wingdi.h:185
   META_BITBLT : constant := 16#922#;       --  wingdi.h:186
   META_STRETCHBLT : constant := 16#b23#;       --  wingdi.h:187
   META_POLYGON : constant := 16#324#;       --  wingdi.h:188
   META_POLYLINE : constant := 16#325#;       --  wingdi.h:189
   META_ESCAPE : constant := 16#626#;       --  wingdi.h:190
   META_RESTOREDC : constant := 16#127#;       --  wingdi.h:191
   META_FILLREGION : constant := 16#228#;       --  wingdi.h:192
   META_FRAMEREGION : constant := 16#429#;       --  wingdi.h:193
   META_INVERTREGION : constant := 16#12a#;       --  wingdi.h:194
   META_PAINTREGION : constant := 16#12b#;       --  wingdi.h:195
   META_SELECTCLIPREGION : constant := 16#12c#;       --  wingdi.h:196
   META_SELECTOBJECT : constant := 16#12d#;       --  wingdi.h:197
   META_SETTEXTALIGN : constant := 16#12e#;       --  wingdi.h:198
   META_CHORD : constant := 16#830#;       --  wingdi.h:199
   META_SETMAPPERFLAGS : constant := 16#231#;       --  wingdi.h:200
   META_EXTTEXTOUT : constant := 16#a32#;       --  wingdi.h:201
   META_SETDIBTODEV : constant := 16#d33#;       --  wingdi.h:202
   META_SELECTPALETTE : constant := 16#234#;       --  wingdi.h:203
   META_REALIZEPALETTE : constant := 16#35#;        --  wingdi.h:204
   META_ANIMATEPALETTE : constant := 16#436#;       --  wingdi.h:205
   META_SETPALENTRIES : constant := 16#37#;        --  wingdi.h:206
   META_POLYPOLYGON : constant := 16#538#;       --  wingdi.h:207
   META_RESIZEPALETTE : constant := 16#139#;       --  wingdi.h:208
   META_DIBBITBLT : constant := 16#940#;       --  wingdi.h:209
   META_DIBSTRETCHBLT : constant := 16#b41#;       --  wingdi.h:210
   META_DIBCREATEPATTERNBRUSH : constant := 16#142#;       --  wingdi.h:211
   META_STRETCHDIB : constant := 16#f43#;       --  wingdi.h:212
   META_EXTFLOODFILL : constant := 16#548#;       --  wingdi.h:213
   META_DELETEOBJECT : constant := 16#1f0#;       --  wingdi.h:214
   META_CREATEPALETTE : constant := 16#f7#;        --  wingdi.h:215
   META_CREATEPATTERNBRUSH : constant := 16#1f9#;       --  wingdi.h:216
   META_CREATEPENINDIRECT : constant := 16#2fa#;       --  wingdi.h:217
   META_CREATEFONTINDIRECT : constant := 16#2fb#;       --  wingdi.h:218
   META_CREATEBRUSHINDIRECT : constant := 16#2fc#;       --  wingdi.h:219
   META_CREATEREGION : constant := 16#6ff#;       --  wingdi.h:220
   NEWFRAME : constant := 1;             --  wingdi.h:225
   ABORTDOC_CONST : constant := 2;             --  wingdi.h:226
   NEXTBAND : constant := 3;             --  wingdi.h:227
   SETCOLORTABLE : constant := 4;             --  wingdi.h:228
   GETCOLORTABLE : constant := 5;             --  wingdi.h:229
   FLUSHOUTPUT : constant := 6;             --  wingdi.h:230
   DRAFTMODE : constant := 7;             --  wingdi.h:231
   QUERYESCSUPPORT : constant := 8;             --  wingdi.h:232
   SETABORTPROC_CONST : constant := 9;             --  wingdi.h:233
   STARTDOC_CONST : constant := 10;            --  wingdi.h:234
   ENDDOC_CONST : constant := 11;            --  wingdi.h:235
   GETPHYSPAGESIZE : constant := 12;            --  wingdi.h:236
   GETPRINTINGOFFSET : constant := 13;            --  wingdi.h:237
   GETSCALINGFACTOR : constant := 14;            --  wingdi.h:238
   MFCOMMENT : constant := 15;            --  wingdi.h:239
   GETPENWIDTH : constant := 16;            --  wingdi.h:240
   SETCOPYCOUNT : constant := 17;            --  wingdi.h:241
   SELECTPAPERSOURCE : constant := 18;            --  wingdi.h:242
   DEVICEDATA : constant := 19;            --  wingdi.h:243
   PASSTHROUGH : constant := 19;            --  wingdi.h:244
   GETTECHNOLGY : constant := 20;            --  wingdi.h:245
   GETTECHNOLOGY : constant := 20;            --  wingdi.h:246
   SETLINECAP : constant := 21;            --  wingdi.h:247
   SETLINEJOIN : constant := 22;            --  wingdi.h:248
   SETMITERLIMIT_CONST : constant := 23;            --  wingdi.h:249
   BANDINFO : constant := 24;            --  wingdi.h:250
   DRAWPATTERNRECT : constant := 25;            --  wingdi.h:251
   GETVECTORPENSIZE : constant := 26;            --  wingdi.h:252
   GETVECTORBRUSHSIZE : constant := 27;            --  wingdi.h:253
   ENABLEDUPLEX : constant := 28;            --  wingdi.h:254
   GETSETPAPERBINS : constant := 29;            --  wingdi.h:255
   GETSETPRINTORIENT : constant := 30;            --  wingdi.h:256
   ENUMPAPERBINS : constant := 31;            --  wingdi.h:257
   SETDIBSCALING : constant := 32;            --  wingdi.h:258
   EPSPRINTING : constant := 33;            --  wingdi.h:259
   ENUMPAPERMETRICS : constant := 34;            --  wingdi.h:260
   GETSETPAPERMETRICS : constant := 35;            --  wingdi.h:261
   POSTSCRIPT_DATA : constant := 37;            --  wingdi.h:262
   POSTSCRIPT_IGNORE : constant := 38;            --  wingdi.h:263
   MOUSETRAILS : constant := 39;            --  wingdi.h:264
   GETDEVICEUNITS : constant := 42;            --  wingdi.h:265
   GETEXTENDEDTEXTMETRICS : constant := 256;           --  wingdi.h:267
   GETEXTENTTABLE : constant := 257;           --  wingdi.h:268
   GETPAIRKERNTABLE : constant := 258;           --  wingdi.h:269
   GETTRACKKERNTABLE : constant := 259;           --  wingdi.h:270
   EXTTEXTOUT_CONST : constant := 512;           --  wingdi.h:271
   GETFACENAME : constant := 513;           --  wingdi.h:272
   DOWNLOADFACE : constant := 514;           --  wingdi.h:273
   ENABLERELATIVEWIDTHS : constant := 768;           --  wingdi.h:274
   ENABLEPAIRKERNING : constant := 769;           --  wingdi.h:275
   SETKERNTRACK : constant := 770;           --  wingdi.h:276
   SETALLJUSTVALUES : constant := 771;           --  wingdi.h:277
   SETCHARSET : constant := 772;           --  wingdi.h:278
   STRETCHBLT_CONST : constant := 2048;          --  wingdi.h:280
   GETSETSCREENPARAMS : constant := 3072;          --  wingdi.h:281
   QUERYDIBSUPPORT : constant := 3073;          --  wingdi.h:282
   BEGIN_PATH : constant := 4096;          --  wingdi.h:283
   CLIP_TO_PATH : constant := 4097;          --  wingdi.h:284
   END_PATH : constant := 4098;          --  wingdi.h:285
   EXT_DEVICE_CAPS : constant := 4099;          --  wingdi.h:286
   RESTORE_CTM : constant := 4100;          --  wingdi.h:287
   SAVE_CTM : constant := 4101;          --  wingdi.h:288
   SET_ARC_DIRECTION : constant := 4102;          --  wingdi.h:289
   SET_BACKGROUND_COLOR : constant := 4103;          --  wingdi.h:290
   SET_POLY_MODE : constant := 4104;          --  wingdi.h:291
   SET_SCREEN_ANGLE : constant := 4105;          --  wingdi.h:292
   SET_SPREAD : constant := 4106;          --  wingdi.h:293
   TRANSFORM_CTM : constant := 4107;          --  wingdi.h:294
   SET_CLIP_BOX : constant := 4108;          --  wingdi.h:295
   SET_BOUNDS : constant := 4109;          --  wingdi.h:296
   SET_MIRROR_MODE : constant := 4110;          --  wingdi.h:297
   OPENCHANNEL : constant := 4110;          --  wingdi.h:298
   DOWNLOADHEADER : constant := 4111;          --  wingdi.h:299
   CLOSECHANNEL : constant := 4112;          --  wingdi.h:300
   POSTSCRIPT_PASSTHROUGH : constant := 4115;          --  wingdi.h:301
   ENCAPSULATED_POSTSCRIPT : constant := 4116;          --  wingdi.h:302
   QDI_SETDIBITS : constant := 1;             --  wingdi.h:305
   QDI_GETDIBITS : constant := 2;             --  wingdi.h:306
   QDI_DIBTOSCREEN : constant := 4;             --  wingdi.h:307
   QDI_STRETCHDIB : constant := 8;             --  wingdi.h:308
   SP_NOTREPORTED : constant := 16#4000#;      --  wingdi.h:311
   SP_ERROR : constant := -1;            --  wingdi.h:312
   SP_APPABORT : constant := -2;            --  wingdi.h:313
   SP_USERABORT : constant := -3;            --  wingdi.h:314
   SP_OUTOFDISK : constant := -4;            --  wingdi.h:315
   SP_OUTOFMEMORY : constant := -5;            --  wingdi.h:316
   PR_JOBSTATUS : constant := 16#0#;         --  wingdi.h:318
   OBJ_PEN : constant := 1;             --  wingdi.h:321
   OBJ_BRUSH : constant := 2;             --  wingdi.h:322
   OBJ_DC : constant := 3;             --  wingdi.h:323
   OBJ_METADC : constant := 4;             --  wingdi.h:324
   OBJ_PAL : constant := 5;             --  wingdi.h:325
   OBJ_FONT : constant := 6;             --  wingdi.h:326
   OBJ_BITMAP : constant := 7;             --  wingdi.h:327
   OBJ_REGION : constant := 8;             --  wingdi.h:328
   OBJ_METAFILE : constant := 9;             --  wingdi.h:329
   OBJ_MEMDC : constant := 10;            --  wingdi.h:330
   OBJ_EXTPEN : constant := 11;            --  wingdi.h:331
   OBJ_ENHMETADC : constant := 12;            --  wingdi.h:332
   OBJ_ENHMETAFILE : constant := 13;            --  wingdi.h:333
   MWT_IDENTITY : constant := 1;             --  wingdi.h:336
   MWT_LEFTMULTIPLY : constant := 2;             --  wingdi.h:337
   MWT_RIGHTMULTIPLY : constant := 3;             --  wingdi.h:338
   MWT_MIN : constant := 1;             --  wingdi.h:340
   MWT_MAX : constant := 3;             --  wingdi.h:341
   BI_RGB : constant := 0;             --  wingdi.h:409
   BI_RLE8 : constant := 1;             --  wingdi.h:410
   BI_RLE4 : constant := 2;             --  wingdi.h:411
   BI_BITFIELDS : constant := 3;             --  wingdi.h:412
   TMPF_FIXED_PITCH : constant := 16#1#;         --  wingdi.h:517
   TMPF_VECTOR : constant := 16#2#;         --  wingdi.h:518
   TMPF_DEVICE : constant := 16#8#;         --  wingdi.h:519
   TMPF_TRUETYPE : constant := 16#4#;         --  wingdi.h:520
   NTM_REGULAR : constant := 16#40#;        --  wingdi.h:581
   NTM_BOLD : constant := 16#20#;        --  wingdi.h:582
   NTM_ITALIC : constant := 16#1#;         --  wingdi.h:583
   LF_FACESIZE : constant := 32;            --  wingdi.h:712
   LF_FULLFACESIZE : constant := 64;            --  wingdi.h:760
   OUT_DEFAULT_PRECIS : constant := 0;             --  wingdi.h:785
   OUT_STRING_PRECIS : constant := 1;             --  wingdi.h:786
   OUT_CHARACTER_PRECIS : constant := 2;             --  wingdi.h:787
   OUT_STROKE_PRECIS : constant := 3;             --  wingdi.h:788
   OUT_TT_PRECIS : constant := 4;             --  wingdi.h:789
   OUT_DEVICE_PRECIS : constant := 5;             --  wingdi.h:790
   OUT_RASTER_PRECIS : constant := 6;             --  wingdi.h:791
   OUT_TT_ONLY_PRECIS : constant := 7;             --  wingdi.h:792
   OUT_OUTLINE_PRECIS : constant := 8;             --  wingdi.h:793
   CLIP_DEFAULT_PRECIS : constant := 0;             --  wingdi.h:795
   CLIP_CHARACTER_PRECIS : constant := 1;             --  wingdi.h:796
   CLIP_STROKE_PRECIS : constant := 2;             --  wingdi.h:797
   CLIP_MASK : constant := 16#f#;         --  wingdi.h:798
   CLIP_LH_ANGLES : constant := 16;            --  wingdi.h:799
   CLIP_TT_ALWAYS : constant := 32;            --  wingdi.h:800
   CLIP_EMBEDDED : constant := 128;           --  wingdi.h:801
   DEFAULT_QUALITY : constant := 0;             --  wingdi.h:803
   DRAFT_QUALITY : constant := 1;             --  wingdi.h:804
   PROOF_QUALITY : constant := 2;             --  wingdi.h:805
   DEFAULT_PITCH : constant := 0;             --  wingdi.h:807
   FIXED_PITCH : constant := 1;             --  wingdi.h:808
   VARIABLE_PITCH : constant := 2;             --  wingdi.h:809
   ANSI_CHARSET : constant := 0;             --  wingdi.h:811
   DEFAULT_CHARSET : constant := 1;             --  wingdi.h:812
   SYMBOL_CHARSET : constant := 2;             --  wingdi.h:813
   SHIFTJIS_CHARSET : constant := 128;           --  wingdi.h:814
   HANGEUL_CHARSET : constant := 129;           --  wingdi.h:815
   GB2312_CHARSET : constant := 134;           --  wingdi.h:816
   CHINESEBIG5_CHARSET : constant := 136;           --  wingdi.h:817
   OEM_CHARSET : constant := 255;           --  wingdi.h:818
   FF_DONTCARE : constant := 0;             --  wingdi.h:821
   FF_ROMAN : constant := 16;            --  wingdi.h:822
   FF_SWISS : constant := 32;            --  wingdi.h:824
   FF_MODERN : constant := 48;            --  wingdi.h:826
   FF_SCRIPT : constant := 64;            --  wingdi.h:828
   FF_DECORATIVE : constant := 80;            --  wingdi.h:829
   FW_DONTCARE : constant := 0;             --  wingdi.h:832
   FW_THIN : constant := 100;           --  wingdi.h:833
   FW_EXTRALIGHT : constant := 200;           --  wingdi.h:834
   FW_LIGHT : constant := 300;           --  wingdi.h:835
   FW_NORMAL : constant := 400;           --  wingdi.h:836
   FW_MEDIUM : constant := 500;           --  wingdi.h:837
   FW_SEMIBOLD : constant := 600;           --  wingdi.h:838
   FW_BOLD : constant := 700;           --  wingdi.h:839
   FW_EXTRABOLD : constant := 800;           --  wingdi.h:840
   FW_HEAVY : constant := 900;           --  wingdi.h:841
   FW_ULTRALIGHT : constant := 200;           --  wingdi.h:843
   FW_REGULAR : constant := 400;           --  wingdi.h:844
   FW_DEMIBOLD : constant := 600;           --  wingdi.h:845
   FW_ULTRABOLD : constant := 800;           --  wingdi.h:846
   FW_BLACK : constant := 900;           --  wingdi.h:847
   PANOSE_COUNT : constant := 10;            --  wingdi.h:849
   PAN_FAMILYTYPE_INDEX : constant := 0;             --  wingdi.h:850
   PAN_SERIFSTYLE_INDEX : constant := 1;             --  wingdi.h:851
   PAN_WEIGHT_INDEX : constant := 2;             --  wingdi.h:852
   PAN_PROPORTION_INDEX : constant := 3;             --  wingdi.h:853
   PAN_CONTRAST_INDEX : constant := 4;             --  wingdi.h:854
   PAN_STROKEVARIATION_INDEX : constant := 5;             --  wingdi.h:855
   PAN_ARMSTYLE_INDEX : constant := 6;             --  wingdi.h:856
   PAN_LETTERFORM_INDEX : constant := 7;             --  wingdi.h:857
   PAN_MIDLINE_INDEX : constant := 8;             --  wingdi.h:858
   PAN_XHEIGHT_INDEX : constant := 9;             --  wingdi.h:859
   PAN_CULTURE_LATIN : constant := 0;             --  wingdi.h:861
   PAN_ANY : constant := 0;             --  wingdi.h:877
   PAN_NO_FIT : constant := 1;             --  wingdi.h:878
   PAN_FAMILY_TEXT_DISPLAY : constant := 2;             --  wingdi.h:880
   PAN_FAMILY_SCRIPT : constant := 3;             --  wingdi.h:881
   PAN_FAMILY_DECORATIVE : constant := 4;             --  wingdi.h:882
   PAN_FAMILY_PICTORIAL : constant := 5;             --  wingdi.h:883
   PAN_SERIF_COVE : constant := 2;             --  wingdi.h:885
   PAN_SERIF_OBTUSE_COVE : constant := 3;             --  wingdi.h:886
   PAN_SERIF_SQUARE_COVE : constant := 4;             --  wingdi.h:887
   PAN_SERIF_OBTUSE_SQUARE_COVE : constant := 5;            --  wingdi.h:888
   PAN_SERIF_SQUARE : constant := 6;             --  wingdi.h:889
   PAN_SERIF_THIN : constant := 7;             --  wingdi.h:890
   PAN_SERIF_BONE : constant := 8;             --  wingdi.h:891
   PAN_SERIF_EXAGGERATED : constant := 9;             --  wingdi.h:892
   PAN_SERIF_TRIANGLE : constant := 10;            --  wingdi.h:893
   PAN_SERIF_NORMAL_SANS : constant := 11;            --  wingdi.h:894
   PAN_SERIF_OBTUSE_SANS : constant := 12;            --  wingdi.h:895
   PAN_SERIF_PERP_SANS : constant := 13;            --  wingdi.h:896
   PAN_SERIF_FLARED : constant := 14;            --  wingdi.h:897
   PAN_SERIF_ROUNDED : constant := 15;            --  wingdi.h:898
   PAN_WEIGHT_VERY_LIGHT : constant := 2;             --  wingdi.h:900
   PAN_WEIGHT_LIGHT : constant := 3;             --  wingdi.h:901
   PAN_WEIGHT_THIN : constant := 4;             --  wingdi.h:902
   PAN_WEIGHT_BOOK : constant := 5;             --  wingdi.h:903
   PAN_WEIGHT_MEDIUM : constant := 6;             --  wingdi.h:904
   PAN_WEIGHT_DEMI : constant := 7;             --  wingdi.h:905
   PAN_WEIGHT_BOLD : constant := 8;             --  wingdi.h:906
   PAN_WEIGHT_HEAVY : constant := 9;             --  wingdi.h:907
   PAN_WEIGHT_BLACK : constant := 10;            --  wingdi.h:908
   PAN_WEIGHT_NORD : constant := 11;            --  wingdi.h:909
   PAN_PROP_OLD_STYLE : constant := 2;             --  wingdi.h:911
   PAN_PROP_MODERN : constant := 3;             --  wingdi.h:912
   PAN_PROP_EVEN_WIDTH : constant := 4;             --  wingdi.h:913
   PAN_PROP_EXPANDED : constant := 5;             --  wingdi.h:914
   PAN_PROP_CONDENSED : constant := 6;             --  wingdi.h:915
   PAN_PROP_VERY_EXPANDED : constant := 7;             --  wingdi.h:916
   PAN_PROP_VERY_CONDENSED : constant := 8;             --  wingdi.h:917
   PAN_PROP_MONOSPACED : constant := 9;             --  wingdi.h:918
   PAN_CONTRAST_NONE : constant := 2;             --  wingdi.h:920
   PAN_CONTRAST_VERY_LOW : constant := 3;             --  wingdi.h:921
   PAN_CONTRAST_LOW : constant := 4;             --  wingdi.h:922
   PAN_CONTRAST_MEDIUM_LOW : constant := 5;             --  wingdi.h:923
   PAN_CONTRAST_MEDIUM : constant := 6;             --  wingdi.h:924
   PAN_CONTRAST_MEDIUM_HIGH : constant := 7;             --  wingdi.h:925
   PAN_CONTRAST_HIGH : constant := 8;             --  wingdi.h:926
   PAN_CONTRAST_VERY_HIGH : constant := 9;             --  wingdi.h:927
   PAN_STROKE_GRADUAL_DIAG : constant := 2;             --  wingdi.h:929
   PAN_STROKE_GRADUAL_TRAN : constant := 3;             --  wingdi.h:930
   PAN_STROKE_GRADUAL_VERT : constant := 4;             --  wingdi.h:931
   PAN_STROKE_GRADUAL_HORZ : constant := 5;             --  wingdi.h:932
   PAN_STROKE_RAPID_VERT : constant := 6;             --  wingdi.h:933
   PAN_STROKE_RAPID_HORZ : constant := 7;             --  wingdi.h:934
   PAN_STROKE_INSTANT_VERT : constant := 8;             --  wingdi.h:935
   PAN_STRAIGHT_ARMS_HORZ : constant := 2;             --  wingdi.h:937
   PAN_STRAIGHT_ARMS_WEDGE : constant := 3;             --  wingdi.h:938
   PAN_STRAIGHT_ARMS_VERT : constant := 4;             --  wingdi.h:939
   PAN_STRAIGHT_ARMS_SINGLE_SERIF : constant := 5;          --  wingdi.h:940
   PAN_STRAIGHT_ARMS_DOUBLE_SERIF : constant := 6;          --  wingdi.h:941
   PAN_BENT_ARMS_HORZ : constant := 7;             --  wingdi.h:942
   PAN_BENT_ARMS_WEDGE : constant := 8;             --  wingdi.h:943
   PAN_BENT_ARMS_VERT : constant := 9;             --  wingdi.h:944
   PAN_BENT_ARMS_SINGLE_SERIF : constant := 10;            --  wingdi.h:945
   PAN_BENT_ARMS_DOUBLE_SERIF : constant := 11;            --  wingdi.h:946
   PAN_LETT_NORMAL_CONTACT : constant := 2;             --  wingdi.h:948
   PAN_LETT_NORMAL_WEIGHTED : constant := 3;             --  wingdi.h:949
   PAN_LETT_NORMAL_BOXED : constant := 4;             --  wingdi.h:950
   PAN_LETT_NORMAL_FLATTENED : constant := 5;             --  wingdi.h:951
   PAN_LETT_NORMAL_ROUNDED : constant := 6;             --  wingdi.h:952
   PAN_LETT_NORMAL_OFF_CENTER : constant := 7;             --  wingdi.h:953
   PAN_LETT_NORMAL_SQUARE : constant := 8;             --  wingdi.h:954
   PAN_LETT_OBLIQUE_CONTACT : constant := 9;             --  wingdi.h:955
   PAN_LETT_OBLIQUE_WEIGHTED : constant := 10;            --  wingdi.h:956
   PAN_LETT_OBLIQUE_BOXED : constant := 11;            --  wingdi.h:957
   PAN_LETT_OBLIQUE_FLATTENED : constant := 12;            --  wingdi.h:958
   PAN_LETT_OBLIQUE_ROUNDED : constant := 13;            --  wingdi.h:959
   PAN_LETT_OBLIQUE_OFF_CENTER : constant := 14;            --  wingdi.h:960
   PAN_LETT_OBLIQUE_SQUARE : constant := 15;            --  wingdi.h:961
   PAN_MIDLINE_STANDARD_TRIMMED : constant := 2;            --  wingdi.h:963
   PAN_MIDLINE_STANDARD_POINTED : constant := 3;            --  wingdi.h:964
   PAN_MIDLINE_STANDARD_SERIFED : constant := 4;            --  wingdi.h:965
   PAN_MIDLINE_HIGH_TRIMMED : constant := 5;             --  wingdi.h:966
   PAN_MIDLINE_HIGH_POINTED : constant := 6;             --  wingdi.h:967
   PAN_MIDLINE_HIGH_SERIFED : constant := 7;             --  wingdi.h:968
   PAN_MIDLINE_CONSTANT_TRIMMED : constant := 8;            --  wingdi.h:969
   PAN_MIDLINE_CONSTANT_POINTED : constant := 9;            --  wingdi.h:970
   PAN_MIDLINE_CONSTANT_SERIFED : constant := 10;           --  wingdi.h:971
   PAN_MIDLINE_LOW_TRIMMED : constant := 11;            --  wingdi.h:972
   PAN_MIDLINE_LOW_POINTED : constant := 12;            --  wingdi.h:973
   PAN_MIDLINE_LOW_SERIFED : constant := 13;            --  wingdi.h:974
   PAN_XHEIGHT_CONSTANT_SMALL : constant := 2;             --  wingdi.h:976
   PAN_XHEIGHT_CONSTANT_STD : constant := 3;             --  wingdi.h:977
   PAN_XHEIGHT_CONSTANT_LARGE : constant := 4;             --  wingdi.h:978
   PAN_XHEIGHT_DUCKING_SMALL : constant := 5;             --  wingdi.h:979
   PAN_XHEIGHT_DUCKING_STD : constant := 6;             --  wingdi.h:980
   PAN_XHEIGHT_DUCKING_LARGE : constant := 7;             --  wingdi.h:981
   ELF_VENDOR_SIZE : constant := 4;             --  wingdi.h:984
   ELF_VERSION : constant := 0;             --  wingdi.h:1026
   ELF_CULTURE_LATIN : constant := 0;             --  wingdi.h:1027
   RASTER_FONTTYPE : constant := 16#1#;         --  wingdi.h:1030
   DEVICE_FONTTYPE : constant := 16#2#;         --  wingdi.h:1031
   TRUETYPE_FONTTYPE : constant := 16#4#;         --  wingdi.h:1032
   PC_RESERVED : constant := 16#1#;         --  wingdi.h:1040
   PC_EXPLICIT : constant := 16#2#;         --  wingdi.h:1041
   PC_NOCOLLAPSE : constant := 16#4#;         --  wingdi.h:1042
   TRANSPARENT : constant := 1;             --  wingdi.h:1049
   OPAQUE : constant := 2;             --  wingdi.h:1050
   BKMODE_LAST : constant := 2;             --  wingdi.h:1051
   GM_COMPATIBLE : constant := 1;             --  wingdi.h:1055
   GM_ADVANCED : constant := 2;             --  wingdi.h:1056
   GM_LAST : constant := 2;             --  wingdi.h:1057
   PT_CLOSEFIGURE : constant := 16#1#;         --  wingdi.h:1060
   PT_LINETO : constant := 16#2#;         --  wingdi.h:1061
   PT_BEZIERTO : constant := 16#4#;         --  wingdi.h:1062
   PT_MOVETO : constant := 16#6#;         --  wingdi.h:1063
   MM_TEXT : constant := 1;             --  wingdi.h:1066
   MM_LOMETRIC : constant := 2;             --  wingdi.h:1067
   MM_HIMETRIC : constant := 3;             --  wingdi.h:1068
   MM_LOENGLISH : constant := 4;             --  wingdi.h:1069
   MM_HIENGLISH : constant := 5;             --  wingdi.h:1070
   MM_TWIPS : constant := 6;             --  wingdi.h:1071
   MM_ISOTROPIC : constant := 7;             --  wingdi.h:1072
   MM_ANISOTROPIC : constant := 8;             --  wingdi.h:1073
   MM_MIN : constant := 1;             --  wingdi.h:1076
   MM_MAX : constant := 8;             --  wingdi.h:1077
   MM_MAX_FIXEDSCALE : constant := 6;             --  wingdi.h:1078
   ABSOLUTE : constant := 1;             --  wingdi.h:1081
   RELATIVE : constant := 2;             --  wingdi.h:1082
   WHITE_BRUSH : constant := 0;             --  wingdi.h:1085
   LTGRAY_BRUSH : constant := 1;             --  wingdi.h:1086
   GRAY_BRUSH : constant := 2;             --  wingdi.h:1087
   DKGRAY_BRUSH : constant := 3;             --  wingdi.h:1088
   BLACK_BRUSH : constant := 4;             --  wingdi.h:1089
   NULL_BRUSH : constant := 5;             --  wingdi.h:1090
   HOLLOW_BRUSH : constant := 5;             --  wingdi.h:1091
   WHITE_PEN : constant := 6;             --  wingdi.h:1092
   BLACK_PEN : constant := 7;             --  wingdi.h:1093
   NULL_PEN : constant := 8;             --  wingdi.h:1094
   OEM_FIXED_FONT : constant := 10;            --  wingdi.h:1095
   ANSI_FIXED_FONT : constant := 11;            --  wingdi.h:1096
   ANSI_VAR_FONT : constant := 12;            --  wingdi.h:1097
   SYSTEM_FONT : constant := 13;            --  wingdi.h:1098
   DEVICE_DEFAULT_FONT : constant := 14;            --  wingdi.h:1099
   DEFAULT_PALETTE : constant := 15;            --  wingdi.h:1100
   SYSTEM_FIXED_FONT : constant := 16;            --  wingdi.h:1101
   STOCK_LAST : constant := 16;            --  wingdi.h:1102
   CLR_INVALID : constant := 16#ffffffff#;  --  wingdi.h:1104
   BS_SOLID : constant := 0;             --  wingdi.h:1107
   BS_NULL : constant := 1;             --  wingdi.h:1108
   BS_HOLLOW : constant := 1;             --  wingdi.h:1109
   BS_HATCHED : constant := 2;             --  wingdi.h:1110
   BS_PATTERN : constant := 3;             --  wingdi.h:1111
   BS_INDEXED : constant := 4;             --  wingdi.h:1112
   BS_DIBPATTERN : constant := 5;             --  wingdi.h:1113
   BS_DIBPATTERNPT : constant := 6;             --  wingdi.h:1114
   BS_PATTERN8X8 : constant := 7;             --  wingdi.h:1115
   BS_DIBPATTERN8X8 : constant := 8;             --  wingdi.h:1116
   HS_HORIZONTAL : constant := 0;             --  wingdi.h:1119
   HS_VERTICAL : constant := 1;             --  wingdi.h:1120
   HS_FDIAGONAL : constant := 2;             --  wingdi.h:1121
   HS_BDIAGONAL : constant := 3;             --  wingdi.h:1122
   HS_CROSS : constant := 4;             --  wingdi.h:1123
   HS_DIAGCROSS : constant := 5;             --  wingdi.h:1124
   PS_SOLID : constant := 0;             --  wingdi.h:1127
   PS_DASH : constant := 1;             --  wingdi.h:1128
   PS_DOT : constant := 2;             --  wingdi.h:1129
   PS_DASHDOT : constant := 3;             --  wingdi.h:1130
   PS_DASHDOTDOT : constant := 4;             --  wingdi.h:1131
   PS_NULL : constant := 5;             --  wingdi.h:1132
   PS_INSIDEFRAME : constant := 6;             --  wingdi.h:1133
   PS_USERSTYLE : constant := 7;             --  wingdi.h:1134
   PS_ALTERNATE : constant := 8;             --  wingdi.h:1135
   PS_STYLE_MASK : constant := 16#f#;         --  wingdi.h:1136
   PS_ENDCAP_ROUND : constant := 16#0#;         --  wingdi.h:1138
   PS_ENDCAP_SQUARE : constant := 16#100#;       --  wingdi.h:1139
   PS_ENDCAP_FLAT : constant := 16#200#;       --  wingdi.h:1140
   PS_ENDCAP_MASK : constant := 16#f00#;       --  wingdi.h:1141
   PS_JOIN_ROUND : constant := 16#0#;         --  wingdi.h:1143
   PS_JOIN_BEVEL : constant := 16#1000#;      --  wingdi.h:1144
   PS_JOIN_MITER : constant := 16#2000#;      --  wingdi.h:1145
   PS_JOIN_MASK : constant := 16#f000#;      --  wingdi.h:1146
   PS_COSMETIC : constant := 16#0#;         --  wingdi.h:1148
   PS_GEOMETRIC : constant := 16#10000#;     --  wingdi.h:1149
   PS_TYPE_MASK : constant := 16#f0000#;     --  wingdi.h:1150
   AD_COUNTERCLOCKWISE : constant := 1;             --  wingdi.h:1152
   AD_CLOCKWISE : constant := 2;             --  wingdi.h:1153
   DRIVERVERSION : constant := 0;             --  wingdi.h:1156
   TECHNOLOGY : constant := 2;             --  wingdi.h:1157
   HORZSIZE : constant := 4;             --  wingdi.h:1158
   VERTSIZE : constant := 6;             --  wingdi.h:1159
   HORZRES : constant := 8;             --  wingdi.h:1160
   VERTRES : constant := 10;            --  wingdi.h:1161
   BITSPIXEL : constant := 12;            --  wingdi.h:1162
   PLANES : constant := 14;            --  wingdi.h:1163
   NUMBRUSHES : constant := 16;            --  wingdi.h:1164
   NUMPENS : constant := 18;            --  wingdi.h:1165
   NUMMARKERS : constant := 20;            --  wingdi.h:1166
   NUMFONTS : constant := 22;            --  wingdi.h:1167
   NUMCOLORS : constant := 24;            --  wingdi.h:1168
   PDEVICESIZE : constant := 26;            --  wingdi.h:1169
   CURVECAPS : constant := 28;            --  wingdi.h:1170
   LINECAPS : constant := 30;            --  wingdi.h:1171
   POLYGONALCAPS : constant := 32;            --  wingdi.h:1172
   TEXTCAPS : constant := 34;            --  wingdi.h:1173
   CLIPCAPS : constant := 36;            --  wingdi.h:1174
   RASTERCAPS : constant := 38;            --  wingdi.h:1175
   ASPECTX : constant := 40;            --  wingdi.h:1176
   ASPECTY : constant := 42;            --  wingdi.h:1177
   ASPECTXY : constant := 44;            --  wingdi.h:1178
   LOGPIXELSX : constant := 88;            --  wingdi.h:1180
   LOGPIXELSY : constant := 90;            --  wingdi.h:1181
   SIZEPALETTE : constant := 104;           --  wingdi.h:1183
   NUMRESERVED : constant := 106;           --  wingdi.h:1184
   COLORRES : constant := 108;           --  wingdi.h:1185
   PHYSICALWIDTH : constant := 110;           --  wingdi.h:1190
   PHYSICALHEIGHT : constant := 111;           --  wingdi.h:1191
   PHYSICALOFFSETX : constant := 112;           --  wingdi.h:1192
   PHYSICALOFFSETY : constant := 113;           --  wingdi.h:1193
   SCALINGFACTORX : constant := 114;           --  wingdi.h:1194
   SCALINGFACTORY : constant := 115;           --  wingdi.h:1195
   VREFRESH : constant := 116;           --  wingdi.h:1199
   DESKTOPVERTRES : constant := 117;           --  wingdi.h:1201
   DESKTOPHORZRES : constant := 118;           --  wingdi.h:1203
   BLTALIGNMENT : constant := 119;           --  wingdi.h:1205
   DT_PLOTTER : constant := 0;             --  wingdi.h:1212
   DT_RASDISPLAY : constant := 1;             --  wingdi.h:1213
   DT_RASPRINTER : constant := 2;             --  wingdi.h:1214
   DT_RASCAMERA : constant := 3;             --  wingdi.h:1215
   DT_CHARSTREAM : constant := 4;             --  wingdi.h:1216
   DT_METAFILE : constant := 5;             --  wingdi.h:1217
   DT_DISPFILE : constant := 6;             --  wingdi.h:1218
   CC_NONE : constant := 0;             --  wingdi.h:1221
   CC_CIRCLES : constant := 1;             --  wingdi.h:1222
   CC_PIE : constant := 2;             --  wingdi.h:1223
   CC_CHORD : constant := 4;             --  wingdi.h:1224
   CC_ELLIPSES : constant := 8;             --  wingdi.h:1225
   CC_WIDE : constant := 16;            --  wingdi.h:1226
   CC_STYLED : constant := 32;            --  wingdi.h:1227
   CC_WIDESTYLED : constant := 64;            --  wingdi.h:1228
   CC_INTERIORS : constant := 128;           --  wingdi.h:1229
   CC_ROUNDRECT : constant := 256;           --  wingdi.h:1230
   LC_NONE : constant := 0;             --  wingdi.h:1233
   LC_POLYLINE : constant := 2;             --  wingdi.h:1234
   LC_MARKER : constant := 4;             --  wingdi.h:1235
   LC_POLYMARKER : constant := 8;             --  wingdi.h:1236
   LC_WIDE : constant := 16;            --  wingdi.h:1237
   LC_STYLED : constant := 32;            --  wingdi.h:1238
   LC_WIDESTYLED : constant := 64;            --  wingdi.h:1239
   LC_INTERIORS : constant := 128;           --  wingdi.h:1240
   PC_NONE : constant := 0;             --  wingdi.h:1243
   PC_POLYGON : constant := 1;             --  wingdi.h:1244
   PC_RECTANGLE : constant := 2;             --  wingdi.h:1245
   PC_WINDPOLYGON : constant := 4;             --  wingdi.h:1246
   PC_TRAPEZOID : constant := 4;             --  wingdi.h:1247
   PC_SCANLINE : constant := 8;             --  wingdi.h:1248
   PC_WIDE : constant := 16;            --  wingdi.h:1249
   PC_STYLED : constant := 32;            --  wingdi.h:1250
   PC_WIDESTYLED : constant := 64;            --  wingdi.h:1251
   PC_INTERIORS : constant := 128;           --  wingdi.h:1252
   CP_NONE : constant := 0;             --  wingdi.h:1255
   CP_RECTANGLE : constant := 1;             --  wingdi.h:1256
   CP_REGION : constant := 2;             --  wingdi.h:1257
   TC_OP_CHARACTER : constant := 16#1#;         --  wingdi.h:1260
   TC_OP_STROKE : constant := 16#2#;         --  wingdi.h:1261
   TC_CP_STROKE : constant := 16#4#;         --  wingdi.h:1262
   TC_CR_90 : constant := 16#8#;         --  wingdi.h:1263
   TC_CR_ANY : constant := 16#10#;        --  wingdi.h:1264
   TC_SF_X_YINDEP : constant := 16#20#;        --  wingdi.h:1265
   TC_SA_DOUBLE : constant := 16#40#;        --  wingdi.h:1266
   TC_SA_INTEGER : constant := 16#80#;        --  wingdi.h:1267
   TC_SA_CONTIN : constant := 16#100#;       --  wingdi.h:1268
   TC_EA_DOUBLE : constant := 16#200#;       --  wingdi.h:1269
   TC_IA_ABLE : constant := 16#400#;       --  wingdi.h:1270
   TC_UA_ABLE : constant := 16#800#;       --  wingdi.h:1271
   TC_SO_ABLE : constant := 16#1000#;      --  wingdi.h:1272
   TC_RA_ABLE : constant := 16#2000#;      --  wingdi.h:1273
   TC_VA_ABLE : constant := 16#4000#;      --  wingdi.h:1274
   TC_RESERVED : constant := 16#8000#;      --  wingdi.h:1275
   TC_SCROLLBLT : constant := 16#10000#;     --  wingdi.h:1276
   RC_BITBLT : constant := 1;             --  wingdi.h:1282
   RC_BANDING : constant := 2;             --  wingdi.h:1283
   RC_SCALING : constant := 4;             --  wingdi.h:1284
   RC_BITMAP64 : constant := 8;             --  wingdi.h:1285
   RC_GDI20_OUTPUT : constant := 16#10#;        --  wingdi.h:1286
   RC_GDI20_STATE : constant := 16#20#;        --  wingdi.h:1287
   RC_SAVEBITMAP : constant := 16#40#;        --  wingdi.h:1288
   RC_DI_BITMAP : constant := 16#80#;        --  wingdi.h:1289
   RC_PALETTE : constant := 16#100#;       --  wingdi.h:1290
   RC_DIBTODEV : constant := 16#200#;       --  wingdi.h:1291
   RC_BIGFONT : constant := 16#400#;       --  wingdi.h:1292
   RC_STRETCHBLT : constant := 16#800#;       --  wingdi.h:1293
   RC_FLOODFILL : constant := 16#1000#;      --  wingdi.h:1294
   RC_STRETCHDIB : constant := 16#2000#;      --  wingdi.h:1295
   RC_OP_DX_OUTPUT : constant := 16#4000#;      --  wingdi.h:1296
   RC_DEVBITS : constant := 16#8000#;      --  wingdi.h:1297
   DIB_RGB_COLORS : constant := 0;             --  wingdi.h:1302
   DIB_PAL_COLORS : constant := 1;             --  wingdi.h:1303
   SYSPAL_ERROR : constant := 0;             --  wingdi.h:1307
   SYSPAL_STATIC : constant := 1;             --  wingdi.h:1308
   SYSPAL_NOSTATIC : constant := 2;             --  wingdi.h:1309
   CBM_INIT : constant := 16#4#;         --  wingdi.h:1312
   FLOODFILLBORDER : constant := 0;             --  wingdi.h:1315
   FLOODFILLSURFACE : constant := 1;             --  wingdi.h:1316
   CCHDEVICENAME : constant := 32;            --  wingdi.h:1319
   CCHFORMNAME : constant := 32;            --  wingdi.h:1322
   DM_SPECVERSION : constant := 16#320#;       --  wingdi.h:1394
   DM_ORIENTATION : constant := 16#1#;         --  wingdi.h:1397
   DM_PAPERSIZE : constant := 16#2#;         --  wingdi.h:1398
   DM_PAPERLENGTH : constant := 16#4#;         --  wingdi.h:1399
   DM_PAPERWIDTH : constant := 16#8#;         --  wingdi.h:1400
   DM_SCALE : constant := 16#10#;        --  wingdi.h:1401
   DM_COPIES : constant := 16#100#;       --  wingdi.h:1402
   DM_DEFAULTSOURCE : constant := 16#200#;       --  wingdi.h:1403
   DM_PRINTQUALITY : constant := 16#400#;       --  wingdi.h:1404
   DM_COLOR : constant := 16#800#;       --  wingdi.h:1405
   DM_DUPLEX : constant := 16#1000#;      --  wingdi.h:1406
   DM_YRESOLUTION : constant := 16#2000#;      --  wingdi.h:1407
   DM_TTOPTION : constant := 16#4000#;      --  wingdi.h:1408
   DM_COLLATE : constant := 16#8000#;      --  wingdi.h:1409
   DM_FORMNAME : constant := 16#10000#;     --  wingdi.h:1410
   DMORIENT_PORTRAIT : constant := 1;             --  wingdi.h:1413
   DMORIENT_LANDSCAPE : constant := 2;             --  wingdi.h:1414
   DMPAPER_FIRST : constant := 1;             --  wingdi.h:1417
   DMPAPER_LETTER : constant := 1;             --  wingdi.h:1418
   DMPAPER_LETTERSMALL : constant := 2;             --  wingdi.h:1419
   DMPAPER_TABLOID : constant := 3;             --  wingdi.h:1420
   DMPAPER_LEDGER : constant := 4;             --  wingdi.h:1421
   DMPAPER_LEGAL : constant := 5;             --  wingdi.h:1422
   DMPAPER_STATEMENT : constant := 6;             --  wingdi.h:1423
   DMPAPER_EXECUTIVE : constant := 7;             --  wingdi.h:1424
   DMPAPER_A3 : constant := 8;             --  wingdi.h:1425
   DMPAPER_A4 : constant := 9;             --  wingdi.h:1426
   DMPAPER_A4SMALL : constant := 10;            --  wingdi.h:1427
   DMPAPER_A5 : constant := 11;            --  wingdi.h:1428
   DMPAPER_B4 : constant := 12;            --  wingdi.h:1429
   DMPAPER_B5 : constant := 13;            --  wingdi.h:1430
   DMPAPER_FOLIO : constant := 14;            --  wingdi.h:1431
   DMPAPER_QUARTO : constant := 15;            --  wingdi.h:1432
   DMPAPER_10X14 : constant := 16;            --  wingdi.h:1433
   DMPAPER_11X17 : constant := 17;            --  wingdi.h:1434
   DMPAPER_NOTE : constant := 18;            --  wingdi.h:1435
   DMPAPER_ENV_9 : constant := 19;            --  wingdi.h:1436
   DMPAPER_ENV_10 : constant := 20;            --  wingdi.h:1437
   DMPAPER_ENV_11 : constant := 21;            --  wingdi.h:1438
   DMPAPER_ENV_12 : constant := 22;            --  wingdi.h:1439
   DMPAPER_ENV_14 : constant := 23;            --  wingdi.h:1440
   DMPAPER_CSHEET : constant := 24;            --  wingdi.h:1441
   DMPAPER_DSHEET : constant := 25;            --  wingdi.h:1442
   DMPAPER_ESHEET : constant := 26;            --  wingdi.h:1443
   DMPAPER_ENV_DL : constant := 27;            --  wingdi.h:1444
   DMPAPER_ENV_C5 : constant := 28;            --  wingdi.h:1445
   DMPAPER_ENV_C3 : constant := 29;            --  wingdi.h:1446
   DMPAPER_ENV_C4 : constant := 30;            --  wingdi.h:1447
   DMPAPER_ENV_C6 : constant := 31;            --  wingdi.h:1448
   DMPAPER_ENV_C65 : constant := 32;            --  wingdi.h:1449
   DMPAPER_ENV_B4 : constant := 33;            --  wingdi.h:1450
   DMPAPER_ENV_B5 : constant := 34;            --  wingdi.h:1451
   DMPAPER_ENV_B6 : constant := 35;            --  wingdi.h:1452
   DMPAPER_ENV_ITALY : constant := 36;            --  wingdi.h:1453
   DMPAPER_ENV_MONARCH : constant := 37;            --  wingdi.h:1454
   DMPAPER_ENV_PERSONAL : constant := 38;            --  wingdi.h:1455
   DMPAPER_FANFOLD_US : constant := 39;            --  wingdi.h:1456
   DMPAPER_FANFOLD_STD_GERMAN : constant := 40;            --  wingdi.h:1457
   DMPAPER_FANFOLD_LGL_GERMAN : constant := 41;            --  wingdi.h:1458
   DMPAPER_LAST : constant := 41;            --  wingdi.h:1460
   DMPAPER_USER : constant := 256;           --  wingdi.h:1462
   DMBIN_FIRST : constant := 1;             --  wingdi.h:1465
   DMBIN_UPPER : constant := 1;             --  wingdi.h:1466
   DMBIN_ONLYONE : constant := 1;             --  wingdi.h:1467
   DMBIN_LOWER : constant := 2;             --  wingdi.h:1468
   DMBIN_MIDDLE : constant := 3;             --  wingdi.h:1469
   DMBIN_MANUAL : constant := 4;             --  wingdi.h:1470
   DMBIN_ENVELOPE : constant := 5;             --  wingdi.h:1471
   DMBIN_ENVMANUAL : constant := 6;             --  wingdi.h:1472
   DMBIN_AUTO : constant := 7;             --  wingdi.h:1473
   DMBIN_TRACTOR : constant := 8;             --  wingdi.h:1474
   DMBIN_SMALLFMT : constant := 9;             --  wingdi.h:1475
   DMBIN_LARGEFMT : constant := 10;            --  wingdi.h:1476
   DMBIN_LARGECAPACITY : constant := 11;            --  wingdi.h:1477
   DMBIN_CASSETTE : constant := 14;            --  wingdi.h:1478
   DMBIN_FORMSOURCE : constant := 15;            --  wingdi.h:1479
   DMBIN_LAST : constant := 15;            --  wingdi.h:1480
   DMBIN_USER : constant := 256;           --  wingdi.h:1482
   DMRES_DRAFT : constant := -1;            --  wingdi.h:1485
   DMRES_LOW : constant := -2;            --  wingdi.h:1486
   DMRES_MEDIUM : constant := -3;            --  wingdi.h:1487
   DMRES_HIGH : constant := -4;            --  wingdi.h:1488
   DMCOLOR_MONOCHROME : constant := 1;             --  wingdi.h:1491
   DMCOLOR_COLOR : constant := 2;             --  wingdi.h:1492
   DMDUP_SIMPLEX : constant := 1;             --  wingdi.h:1495
   DMDUP_VERTICAL : constant := 2;             --  wingdi.h:1496
   DMDUP_HORIZONTAL : constant := 3;             --  wingdi.h:1497
   DMTT_BITMAP : constant := 1;             --  wingdi.h:1500
   DMTT_DOWNLOAD : constant := 2;             --  wingdi.h:1501
   DMTT_SUBDEV : constant := 3;             --  wingdi.h:1502
   DMCOLLATE_FALSE : constant := 0;             --  wingdi.h:1505
   DMCOLLATE_TRUE : constant := 1;             --  wingdi.h:1506
   DM_GRAYSCALE : constant := 16#1#;         --  wingdi.h:1510
   DM_INTERLACED : constant := 16#2#;         --  wingdi.h:1511
   RDH_RECTANGLES : constant := 1;             --  wingdi.h:1516
   GGO_METRICS : constant := 0;             --  wingdi.h:1686
   GGO_BITMAP : constant := 1;             --  wingdi.h:1687
   GGO_NATIVE : constant := 2;             --  wingdi.h:1688
   TT_POLYGON_TYPE : constant := 24;            --  wingdi.h:1691
   TT_PRIM_LINE : constant := 1;             --  wingdi.h:1693
   TT_PRIM_QSPLINE : constant := 2;             --  wingdi.h:1694
   TT_AVAILABLE : constant := 16#1#;         --  wingdi.h:1725
   TT_ENABLED : constant := 16#2#;         --  wingdi.h:1726
   PFD_TYPE_RGBA : constant := 0;             --  wingdi.h:1760
   PFD_TYPE_COLORINDEX : constant := 1;             --  wingdi.h:1761
   PFD_MAIN_PLANE : constant := 0;             --  wingdi.h:1764
   PFD_OVERLAY_PLANE : constant := 1;             --  wingdi.h:1765
   PFD_UNDERLAY_PLANE : constant := -1;            --  wingdi.h:1766
   PFD_DOUBLEBUFFER : constant := 16#1#;         --  wingdi.h:1769
   PFD_STEREO : constant := 16#2#;         --  wingdi.h:1770
   PFD_DRAW_TO_WINDOW : constant := 16#4#;         --  wingdi.h:1771
   PFD_DRAW_TO_BITMAP : constant := 16#8#;         --  wingdi.h:1772
   PFD_SUPPORT_GDI : constant := 16#10#;        --  wingdi.h:1773
   PFD_SUPPORT_OPENGL : constant := 16#20#;        --  wingdi.h:1774
   PFD_GENERIC_FORMAT : constant := 16#40#;        --  wingdi.h:1775
   PFD_NEED_PALETTE : constant := 16#80#;        --  wingdi.h:1776
   PFD_NEED_SYSTEM_PALETTE : constant := 16#100#;       --  wingdi.h:1777
   PFD_DOUBLEBUFFER_DONTCARE : constant := 16#40000000#;  --  wingdi.h:1780
   PFD_STEREO_DONTCARE : constant := 16#80000000#;  --  wingdi.h:1781
   DM_UPDATE : constant := 1;             --  wingdi.h:1905
   DM_COPY : constant := 2;             --  wingdi.h:1906
   DM_PROMPT : constant := 4;             --  wingdi.h:1907
   DM_MODIFY : constant := 8;             --  wingdi.h:1908
   DM_IN_BUFFER : constant := 8;             --  wingdi.h:1910
   DM_IN_PROMPT : constant := 4;             --  wingdi.h:1911
   DM_OUT_BUFFER : constant := 2;             --  wingdi.h:1912
   DM_OUT_DEFAULT : constant := 1;             --  wingdi.h:1913
   DC_FIELDS : constant := 1;             --  wingdi.h:1916
   DC_PAPERS : constant := 2;             --  wingdi.h:1917
   DC_PAPERSIZE : constant := 3;             --  wingdi.h:1918
   DC_MINEXTENT : constant := 4;             --  wingdi.h:1919
   DC_MAXEXTENT : constant := 5;             --  wingdi.h:1920
   DC_BINS : constant := 6;             --  wingdi.h:1921
   DC_DUPLEX : constant := 7;             --  wingdi.h:1922
   DC_SIZE : constant := 8;             --  wingdi.h:1923
   DC_EXTRA : constant := 9;             --  wingdi.h:1924
   DC_VERSION : constant := 10;            --  wingdi.h:1925
   DC_DRIVER : constant := 11;            --  wingdi.h:1926
   DC_BINNAMES : constant := 12;            --  wingdi.h:1927
   DC_ENUMRESOLUTIONS : constant := 13;            --  wingdi.h:1928
   DC_FILEDEPENDENCIES : constant := 14;            --  wingdi.h:1929
   DC_TRUETYPE : constant := 15;            --  wingdi.h:1930
   DC_PAPERNAMES : constant := 16;            --  wingdi.h:1931
   DC_ORIENTATION : constant := 17;            --  wingdi.h:1932
   DC_COPIES : constant := 18;            --  wingdi.h:1933
   DCTT_BITMAP : constant := 16#1#;         --  wingdi.h:1936
   DCTT_DOWNLOAD : constant := 16#2#;         --  wingdi.h:1937
   DCTT_SUBDEV : constant := 16#4#;         --  wingdi.h:1938
   CA_NEGATIVE : constant := 16#1#;         --  wingdi.h:2317
   CA_LOG_FILTER : constant := 16#2#;         --  wingdi.h:2318
   ILLUMINANT_DEVICE_DEFAULT : constant := 0;             --  wingdi.h:2321
   ILLUMINANT_A : constant := 1;             --  wingdi.h:2322
   ILLUMINANT_B : constant := 2;             --  wingdi.h:2323
   ILLUMINANT_C : constant := 3;             --  wingdi.h:2324
   ILLUMINANT_D50 : constant := 4;             --  wingdi.h:2325
   ILLUMINANT_D55 : constant := 5;             --  wingdi.h:2326
   ILLUMINANT_D65 : constant := 6;             --  wingdi.h:2327
   ILLUMINANT_D75 : constant := 7;             --  wingdi.h:2328
   ILLUMINANT_F2 : constant := 8;             --  wingdi.h:2329
   ILLUMINANT_MAX_INDEX : constant := 8;             --  wingdi.h:2330
   ILLUMINANT_TUNGSTEN : constant := 1;             --  wingdi.h:2332
   ILLUMINANT_DAYLIGHT : constant := 3;             --  wingdi.h:2333
   ILLUMINANT_FLUORESCENT : constant := 8;             --  wingdi.h:2334
   ILLUMINANT_NTSC : constant := 3;             --  wingdi.h:2335
   RGB_GAMMA_MIN : constant WORD := 8#2500#;  --  wingdi.h:2338
   RGB_GAMMA_MAX : constant WORD := 65000;    --  wingdi.h:2339
   REFERENCE_WHITE_MIN : constant WORD := 6000;     --  wingdi.h:2342
   REFERENCE_WHITE_MAX : constant WORD := 10000;    --  wingdi.h:2343
   REFERENCE_BLACK_MIN : constant WORD := 0;        --  wingdi.h:2344
   REFERENCE_BLACK_MAX : constant WORD := 4000;     --  wingdi.h:2345
   use type SHORT;
   COLOR_ADJ_MIN : constant SHORT := -100;    --  wingdi.h:2348
   COLOR_ADJ_MAX : constant SHORT := 100;     --  wingdi.h:2349
   FONTMAPPER_MAX : constant := 10;            --  wingdi.h:2488
   ENHMETA_SIGNATURE : constant := 16#464d4520#;  --  wingdi.h:2516
   ENHMETA_STOCK_OBJECT : constant := 16#80000000#;  --  wingdi.h:2523
   EMR_HEADER : constant := 1;             --  wingdi.h:2527
   EMR_POLYBEZIER : constant := 2;             --  wingdi.h:2528
   EMR_POLYGON : constant := 3;             --  wingdi.h:2529
   EMR_POLYLINE : constant := 4;             --  wingdi.h:2530
   EMR_POLYBEZIERTO : constant := 5;             --  wingdi.h:2531
   EMR_POLYLINETO : constant := 6;             --  wingdi.h:2532
   EMR_POLYPOLYLINE : constant := 7;             --  wingdi.h:2533
   EMR_POLYPOLYGON : constant := 8;             --  wingdi.h:2534
   EMR_SETWINDOWEXTEX : constant := 9;             --  wingdi.h:2535
   EMR_SETWINDOWORGEX : constant := 10;            --  wingdi.h:2536
   EMR_SETVIEWPORTEXTEX : constant := 11;            --  wingdi.h:2537
   EMR_SETVIEWPORTORGEX : constant := 12;            --  wingdi.h:2538
   EMR_SETBRUSHORGEX : constant := 13;            --  wingdi.h:2539
   EMR_EOF : constant := 14;            --  wingdi.h:2540
   EMR_SETPIXELV : constant := 15;            --  wingdi.h:2541
   EMR_SETMAPPERFLAGS : constant := 16;            --  wingdi.h:2542
   EMR_SETMAPMODE : constant := 17;            --  wingdi.h:2543
   EMR_SETBKMODE : constant := 18;            --  wingdi.h:2544
   EMR_SETPOLYFILLMODE : constant := 19;            --  wingdi.h:2545
   EMR_SETROP2 : constant := 20;            --  wingdi.h:2546
   EMR_SETSTRETCHBLTMODE : constant := 21;            --  wingdi.h:2547
   EMR_SETTEXTALIGN : constant := 22;            --  wingdi.h:2548
   EMR_SETCOLORADJUSTMENT : constant := 23;            --  wingdi.h:2549
   EMR_SETTEXTCOLOR : constant := 24;            --  wingdi.h:2550
   EMR_SETBKCOLOR : constant := 25;            --  wingdi.h:2551
   EMR_OFFSETCLIPRGN : constant := 26;            --  wingdi.h:2552
   EMR_MOVETOEX : constant := 27;            --  wingdi.h:2553
   EMR_SETMETARGN : constant := 28;            --  wingdi.h:2554
   EMR_EXCLUDECLIPRECT : constant := 29;            --  wingdi.h:2555
   EMR_INTERSECTCLIPRECT : constant := 30;            --  wingdi.h:2556
   EMR_SCALEVIEWPORTEXTEX : constant := 31;            --  wingdi.h:2557
   EMR_SCALEWINDOWEXTEX : constant := 32;            --  wingdi.h:2558
   EMR_SAVEDC : constant := 33;            --  wingdi.h:2559
   EMR_RESTOREDC : constant := 34;            --  wingdi.h:2560
   EMR_SETWORLDTRANSFORM : constant := 35;            --  wingdi.h:2561
   EMR_MODIFYWORLDTRANSFORM : constant := 36;            --  wingdi.h:2562
   EMR_SELECTOBJECT : constant := 37;            --  wingdi.h:2563
   EMR_CREATEPEN : constant := 38;            --  wingdi.h:2564
   EMR_CREATEBRUSHINDIRECT : constant := 39;            --  wingdi.h:2565
   EMR_DELETEOBJECT : constant := 40;            --  wingdi.h:2566
   EMR_ANGLEARC : constant := 41;            --  wingdi.h:2567
   EMR_ELLIPSE : constant := 42;            --  wingdi.h:2568
   EMR_RECTANGLE : constant := 43;            --  wingdi.h:2569
   EMR_ROUNDRECT : constant := 44;            --  wingdi.h:2570
   EMR_ARC : constant := 45;            --  wingdi.h:2571
   EMR_CHORD : constant := 46;            --  wingdi.h:2572
   EMR_PIE : constant := 47;            --  wingdi.h:2573
   EMR_SELECTPALETTE : constant := 48;            --  wingdi.h:2574
   EMR_CREATEPALETTE : constant := 49;            --  wingdi.h:2575
   EMR_SETPALETTEENTRIES : constant := 50;            --  wingdi.h:2576
   EMR_RESIZEPALETTE : constant := 51;            --  wingdi.h:2577
   EMR_REALIZEPALETTE : constant := 52;            --  wingdi.h:2578
   EMR_EXTFLOODFILL : constant := 53;            --  wingdi.h:2579
   EMR_LINETO : constant := 54;            --  wingdi.h:2580
   EMR_ARCTO : constant := 55;            --  wingdi.h:2581
   EMR_POLYDRAW : constant := 56;            --  wingdi.h:2582
   EMR_SETARCDIRECTION : constant := 57;            --  wingdi.h:2583
   EMR_SETMITERLIMIT : constant := 58;            --  wingdi.h:2584
   EMR_BEGINPATH : constant := 59;            --  wingdi.h:2585
   EMR_ENDPATH : constant := 60;            --  wingdi.h:2586
   EMR_CLOSEFIGURE : constant := 61;            --  wingdi.h:2587
   EMR_FILLPATH : constant := 62;            --  wingdi.h:2588
   EMR_STROKEANDFILLPATH : constant := 63;            --  wingdi.h:2589
   EMR_STROKEPATH : constant := 64;            --  wingdi.h:2590
   EMR_FLATTENPATH : constant := 65;            --  wingdi.h:2591
   EMR_WIDENPATH : constant := 66;            --  wingdi.h:2592
   EMR_SELECTCLIPPATH : constant := 67;            --  wingdi.h:2593
   EMR_ABORTPATH : constant := 68;            --  wingdi.h:2594
   EMR_GDICOMMENT : constant := 70;            --  wingdi.h:2596
   EMR_FILLRGN : constant := 71;            --  wingdi.h:2597
   EMR_FRAMERGN : constant := 72;            --  wingdi.h:2598
   EMR_INVERTRGN : constant := 73;            --  wingdi.h:2599
   EMR_PAINTRGN : constant := 74;            --  wingdi.h:2600
   EMR_EXTSELECTCLIPRGN : constant := 75;            --  wingdi.h:2601
   EMR_BITBLT : constant := 76;            --  wingdi.h:2602
   EMR_STRETCHBLT : constant := 77;            --  wingdi.h:2603
   EMR_MASKBLT : constant := 78;            --  wingdi.h:2604
   EMR_PLGBLT : constant := 79;            --  wingdi.h:2605
   EMR_SETDIBITSTODEVICE : constant := 80;            --  wingdi.h:2606
   EMR_STRETCHDIBITS : constant := 81;            --  wingdi.h:2607
   EMR_EXTCREATEFONTINDIRECTW : constant := 82;            --  wingdi.h:2608
   EMR_EXTTEXTOUTA : constant := 83;            --  wingdi.h:2609
   EMR_EXTTEXTOUTW : constant := 84;            --  wingdi.h:2610
   EMR_POLYBEZIER16 : constant := 85;            --  wingdi.h:2611
   EMR_POLYGON16 : constant := 86;            --  wingdi.h:2612
   EMR_POLYLINE16 : constant := 87;            --  wingdi.h:2613
   EMR_POLYBEZIERTO16 : constant := 88;            --  wingdi.h:2614
   EMR_POLYLINETO16 : constant := 89;            --  wingdi.h:2615
   EMR_POLYPOLYLINE16 : constant := 90;            --  wingdi.h:2616
   EMR_POLYPOLYGON16 : constant := 91;            --  wingdi.h:2617
   EMR_POLYDRAW16 : constant := 92;            --  wingdi.h:2618
   EMR_CREATEMONOBRUSH : constant := 93;            --  wingdi.h:2619
   EMR_CREATEDIBPATTERNBRUSHPT : constant := 94;            --  wingdi.h:2620
   EMR_EXTCREATEPEN : constant := 95;            --  wingdi.h:2621
   EMR_POLYTEXTOUTA : constant := 96;            --  wingdi.h:2622
   EMR_POLYTEXTOUTW : constant := 97;            --  wingdi.h:2623
   EMR_MIN : constant := 1;             --  wingdi.h:2625
   EMR_MAX : constant := 97;            --  wingdi.h:2626
   GDICOMMENT_IDENTIFIER : constant := 16#43494447#;  --  wingdi.h:3217
   GDICOMMENT_WINDOWS_METAFILE : constant := 16#80000001#;  --  wingdi.h:3218
   GDICOMMENT_BEGINGROUP : constant := 16#2#;         --  wingdi.h:3219
   GDICOMMENT_ENDGROUP : constant := 16#3#;         --  wingdi.h:3220
   GDICOMMENT_MULTIFORMATS : constant := 16#40000004#;  --  wingdi.h:3221
   EPS_SIGNATURE : constant := 16#46535045#;  --  wingdi.h:3222

   type XFORM;                                             --  wingdi.h:344
   type BITMAP;                                            --  wingdi.h:355
   type RGBTRIPLE;                                         --  wingdi.h:366
   type RGBQUAD;                                           --  wingdi.h:372
   type BITMAPCOREHEADER;                                  --  wingdi.h:383
   type BITMAPINFOHEADER;                                  --  wingdi.h:392
   type BITMAPINFO;                                        --  wingdi.h:414
   type BITMAPCOREINFO;                                    --  wingdi.h:419
   type BITMAPFILEHEADER;                                  --  wingdi.h:426
   type HANDLETABLE;                                       --  wingdi.h:441
   type METARECORD;                                        --  wingdi.h:446
   type METAFILEPICT;                                      --  wingdi.h:455
   type METAHEADER;                                        --  wingdi.h:465
   type ENHMETARECORD;                                     --  wingdi.h:482
   type ENHMETAHEADER;                                     --  wingdi.h:489
   type TEXTMETRICA;                                       --  wingdi.h:522
   type TEXTMETRICW;                                       --  wingdi.h:545
   type NEWTEXTMETRICA;                                    --  wingdi.h:585
   type NEWTEXTMETRICW;                                    --  wingdi.h:612
   type PELARRAY;                                          --  wingdi.h:656
   type LOGBRUSH;                                          --  wingdi.h:666
   type LOGPEN;                                            --  wingdi.h:679
   type EXTLOGPEN;                                         --  wingdi.h:686
   type PALETTEENTRY;                                      --  wingdi.h:696
   type LOGPALETTE;                                        --  wingdi.h:704
   type LOGFONTA;                                          --  wingdi.h:714
   type LOGFONTW;                                          --  wingdi.h:731
   type ENUMLOGFONTA;                                      --  wingdi.h:763
   type ENUMLOGFONTW;                                      --  wingdi.h:770
   type PANOSE;                                            --  wingdi.h:863
   type EXTLOGFONTA;                                       --  wingdi.h:989
   type EXTLOGFONTW;                                       --  wingdi.h:1001
   type DEVMODEA;                                          --  wingdi.h:1324
   type DEVMODEW;                                          --  wingdi.h:1352
   type RGNDATAHEADER;                                     --  wingdi.h:1518
   type RGNDATA;                                           --  wingdi.h:1526
   type ABC;                                               --  wingdi.h:1532
   type ABCFLOAT;                                          --  wingdi.h:1538
   type OUTLINETEXTMETRICA;                                --  wingdi.h:1546
   type OUTLINETEXTMETRICW;                                --  wingdi.h:1580
   type POLYTEXTA;                                         --  wingdi.h:1629
   type POLYTEXTW;                                         --  wingdi.h:1639
   type FIXED;                                             --  wingdi.h:1661
   type MAT2;                                              --  wingdi.h:1667
   type GLYPHMETRICS;                                      --  wingdi.h:1676
   type POINTFX;                                           --  wingdi.h:1696
   type TTPOLYCURVE;                                       --  wingdi.h:1702
   type TTPOLYGONHEADER;                                   --  wingdi.h:1709
   type RASTERIZER_STATUS;                                 --  wingdi.h:1718
   type PIXELFORMATDESCRIPTOR;                             --  wingdi.h:1729
   type DIBSECTION;                                        --  wingdi.h:2298
   type COLORADJUSTMENT;                                   --  wingdi.h:2351
   type DOCINFOA;                                          --  wingdi.h:2376
   type DOCINFOW;                                          --  wingdi.h:2381
   type KERNINGPAIR;                                       --  wingdi.h:2490
   type EMR;                                               --  wingdi.h:2630
   type EMRTEXT;                                           --  wingdi.h:2639
   type ABORTPATH;                                         --  wingdi.h:2652
   type EMRSELECTCLIPPATH;                                 --  wingdi.h:2665
   type EMRSETMITERLIMIT;                                  --  wingdi.h:2677
   type EMRRESTOREDC;                                      --  wingdi.h:2683
   type EMRSETARCDIRECTION;                                --  wingdi.h:2689
   type EMRSETMAPPERFLAGS;                                 --  wingdi.h:2696
   type EMRSETTEXTCOLOR;                                   --  wingdi.h:2702
   type EMRSELECTOBJECT;                                   --  wingdi.h:2709
   type EMRSELECTPALETTE;                                  --  wingdi.h:2717
   type EMRRESIZEPALETTE;                                  --  wingdi.h:2723
   type EMRSETPALETTEENTRIES;                              --  wingdi.h:2730
   type EMRSETCOLORADJUSTMENT;                             --  wingdi.h:2739
   type EMRGDICOMMENT;                                     --  wingdi.h:2745
   type EMREOF;                                            --  wingdi.h:2752
   type EMRLINETO;                                         --  wingdi.h:2762
   type EMROFFSETCLIPRGN;                                  --  wingdi.h:2769
   type EMRFILLPATH;                                       --  wingdi.h:2775
   type EMREXCLUDECLIPRECT;                                --  wingdi.h:2783
   type EMRSETVIEWPORTORGEX;                               --  wingdi.h:2790
   type EMRSETVIEWPORTEXTEX;                               --  wingdi.h:2798
   type EMRSCALEVIEWPORTEXTEX;                             --  wingdi.h:2805
   type EMRSETWORLDTRANSFORM;                              --  wingdi.h:2815
   type EMRMODIFYWORLDTRANSFORM;                           --  wingdi.h:2821
   type EMRSETPIXELV;                                      --  wingdi.h:2828
   type EMREXTFLOODFILL;                                   --  wingdi.h:2835
   type EMRELLIPSE;                                        --  wingdi.h:2843
   type EMRROUNDRECT;                                      --  wingdi.h:2850
   type EMRARC;                                            --  wingdi.h:2857
   type EMRANGLEARC;                                       --  wingdi.h:2868
   type EMRPOLYLINE;                                       --  wingdi.h:2877
   type EMRPOLYLINE16;                                     --  wingdi.h:2889
   type EMRPOLYDRAW;                                       --  wingdi.h:2901
   type EMRPOLYDRAW16;                                     --  wingdi.h:2910
   type EMRPOLYPOLYLINE;                                   --  wingdi.h:2919
   type EMRPOLYPOLYLINE16;                                 --  wingdi.h:2930
   type EMRINVERTRGN;                                      --  wingdi.h:2941
   type EMRFILLRGN;                                        --  wingdi.h:2950
   type EMRFRAMERGN;                                       --  wingdi.h:2959
   type EMREXTSELECTCLIPRGN;                               --  wingdi.h:2969
   type EMREXTTEXTOUTA;                                    --  wingdi.h:2977
   type EMRPOLYTEXTOUTA;                                   --  wingdi.h:2989
   type EMRBITBLT;                                         --  wingdi.h:3002
   type EMRSTRETCHBLT;                                     --  wingdi.h:3023
   type EMRMASKBLT;                                        --  wingdi.h:3046
   type EMRPLGBLT;                                         --  wingdi.h:3074
   type EMRSETDIBITSTODEVICE;                              --  wingdi.h:3100
   type EMRSTRETCHDIBITS;                                  --  wingdi.h:3119
   type EMREXTCREATEFONTINDIRECTW;                         --  wingdi.h:3139
   type EMRCREATEPALETTE;                                  --  wingdi.h:3146
   type EMRCREATEPEN;                                      --  wingdi.h:3155
   type EMREXTCREATEPEN;                                   --  wingdi.h:3162
   type EMRCREATEBRUSHINDIRECT;                            --  wingdi.h:3175
   type EMRCREATEMONOBRUSH;                                --  wingdi.h:3183
   type EMRCREATEDIBPATTERNBRUSHPT;                        --  wingdi.h:3194
   type EMRFORMAT;                                         --  wingdi.h:3207

   type PXFORM is access all XFORM;                        --  wingdi.h:352
   subtype LPXFORM is PXFORM;                              --  wingdi.h:352
   type PBITMAP is access all BITMAP;                      --  wingdi.h:364
   subtype NPBITMAP is PBITMAP;                            --  wingdi.h:364
   subtype LPBITMAP is PBITMAP;                            --  wingdi.h:364
   type LPRGBQUAD is access all RGBQUAD;                   --  wingdi.h:378
   type LPBITMAPCOREHEADER is access all BITMAPCOREHEADER; --  wingdi.h:389
   subtype PBITMAPCOREHEADER is LPBITMAPCOREHEADER;        --  wingdi.h:389
   type LPBITMAPINFOHEADER is access all BITMAPINFOHEADER; --  wingdi.h:404
   subtype PBITMAPINFOHEADER is LPBITMAPINFOHEADER;        --  wingdi.h:404
   type LPBITMAPINFO is access all BITMAPINFO;             --  wingdi.h:417
   subtype PBITMAPINFO is LPBITMAPINFO;                    --  wingdi.h:417
   type LPBITMAPCOREINFO is access all BITMAPCOREINFO;     --  wingdi.h:422
   subtype PBITMAPCOREINFO is LPBITMAPCOREINFO;            --  wingdi.h:422
   type LPBITMAPFILEHEADER is access all BITMAPFILEHEADER; --  wingdi.h:432
   subtype PBITMAPFILEHEADER is LPBITMAPFILEHEADER;        --  wingdi.h:432
   type PHANDLETABLE is access all HANDLETABLE;            --  wingdi.h:444
   subtype LPHANDLETABLE is PHANDLETABLE;                  --  wingdi.h:444
   type PMETARECORD is access all METARECORD;              --  wingdi.h:452
   subtype LPMETARECORD is PMETARECORD;                    --  wingdi.h:453
   type LPMETAFILEPICT is access all METAFILEPICT;         --  wingdi.h:461
   type PMETAHEADER is access all METAHEADER;              --  wingdi.h:475
   subtype LPMETAHEADER is PMETAHEADER;                    --  wingdi.h:476
   type PENHMETARECORD is access all ENHMETARECORD;        --  wingdi.h:487
   subtype LPENHMETARECORD is PENHMETARECORD;              --  wingdi.h:487
   type PENHMETAHEADER is access all ENHMETAHEADER;        --  wingdi.h:510
   subtype LPENHMETAHEADER is PENHMETAHEADER;              --  wingdi.h:510
   type PTEXTMETRICA is access all TEXTMETRICA;            --  wingdi.h:544
   subtype NPTEXTMETRICA is PTEXTMETRICA;                  --  wingdi.h:544
   subtype LPTEXTMETRICA is PTEXTMETRICA;                  --  wingdi.h:544
   type PTEXTMETRICW is access all TEXTMETRICW;            --  wingdi.h:567
   subtype NPTEXTMETRICW is PTEXTMETRICW;                  --  wingdi.h:567
   subtype LPTEXTMETRICW is PTEXTMETRICW;                  --  wingdi.h:567
   type PTEXTMETRIC is access all TEXTMETRICA;             --  wingdi.h:575
   subtype NPTEXTMETRIC is PTEXTMETRIC;                    --  wingdi.h:576
   subtype LPTEXTMETRIC is PTEXTMETRIC;                    --  wingdi.h:577
   type PNEWTEXTMETRICA is access all NEWTEXTMETRICA;      --  wingdi.h:611
   subtype NPNEWTEXTMETRICA is PNEWTEXTMETRICA;            --  wingdi.h:611
   subtype LPNEWTEXTMETRICA is PNEWTEXTMETRICA;            --  wingdi.h:611
   type PNEWTEXTMETRICW is access all NEWTEXTMETRICW;      --  wingdi.h:638
   subtype NPNEWTEXTMETRICW is PNEWTEXTMETRICW;            --  wingdi.h:638
   subtype LPNEWTEXTMETRICW is PNEWTEXTMETRICW;            --  wingdi.h:638
   type PNEWTEXTMETRIC is access all NEWTEXTMETRICA;       --  wingdi.h:646
   subtype NPNEWTEXTMETRIC is PNEWTEXTMETRIC;              --  wingdi.h:647
   subtype LPNEWTEXTMETRIC is PNEWTEXTMETRIC;              --  wingdi.h:648
   type PPELARRAY is access all PELARRAY;                  --  wingdi.h:663
   subtype NPPELARRAY is PPELARRAY;                        --  wingdi.h:663
   subtype LPPELARRAY is PPELARRAY;                        --  wingdi.h:663
   type PLOGBRUSH is access all LOGBRUSH;                  --  wingdi.h:671
   subtype NPLOGBRUSH is PLOGBRUSH;                        --  wingdi.h:671
   subtype LPLOGBRUSH is PLOGBRUSH;                        --  wingdi.h:671
   type PPATTERN is access all LOGBRUSH;                   --  wingdi.h:674
   subtype NPPATTERN is PPATTERN;                          --  wingdi.h:675
   subtype LPPATTERN is PPATTERN;                          --  wingdi.h:676
   type PLOGPEN is access all LOGPEN;                      --  wingdi.h:684
   subtype NPLOGPEN is PLOGPEN;                            --  wingdi.h:684
   subtype LPLOGPEN is PLOGPEN;                            --  wingdi.h:684
   type PEXTLOGPEN is access all EXTLOGPEN;                --  wingdi.h:694
   subtype NPEXTLOGPEN is PEXTLOGPEN;                      --  wingdi.h:694
   subtype LPEXTLOGPEN is PEXTLOGPEN;                      --  wingdi.h:694
   type PPALETTEENTRY is access all PALETTEENTRY;          --  wingdi.h:701
   subtype LPPALETTEENTRY is PPALETTEENTRY;                --  wingdi.h:701
   type PLOGPALETTE is access all LOGPALETTE;              --  wingdi.h:708
   subtype NPLOGPALETTE is PLOGPALETTE;                    --  wingdi.h:708
   subtype LPLOGPALETTE is PLOGPALETTE;                    --  wingdi.h:708
   type PLOGFONTA is access all LOGFONTA;                  --  wingdi.h:730
   subtype NPLOGFONTA is PLOGFONTA;                        --  wingdi.h:730
   subtype LPLOGFONTA is PLOGFONTA;                        --  wingdi.h:730
   type PLOGFONTW is access all LOGFONTW;                  --  wingdi.h:747
   subtype NPLOGFONTW is PLOGFONTW;                        --  wingdi.h:747
   subtype LPLOGFONTW is PLOGFONTW;                        --  wingdi.h:747
   type PLOGFONT is access all LOGFONTA;                   --  wingdi.h:755
   subtype NPLOGFONT is PLOGFONT;                          --  wingdi.h:756
   subtype LPLOGFONT is PLOGFONT;                          --  wingdi.h:757
   type LPENUMLOGFONTA is access all ENUMLOGFONTA;         --  wingdi.h:768
   subtype LPENUMLOGFONT is LPENUMLOGFONTA;                --  wingdi.h:781
   type LPENUMLOGFONTW is access all ENUMLOGFONTW;         --  wingdi.h:775
   type LPPANOSE is access all PANOSE;                     --  wingdi.h:875
   type PEXTLOGFONTA is access all EXTLOGFONTA;            --  wingdi.h:1000
   subtype NPEXTLOGFONTA is PEXTLOGFONTA;                  --  wingdi.h:1000
   subtype LPEXTLOGFONTA is PEXTLOGFONTA;                  --  wingdi.h:1000
   subtype PEXTLOGFONT is PEXTLOGFONTA;                    --  wingdi.h:1020
   subtype NPEXTLOGFONT is PEXTLOGFONTA;                   --  wingdi.h:1021
   subtype LPEXTLOGFONT is PEXTLOGFONTA;                   --  wingdi.h:1022
   type PEXTLOGFONTW is access all EXTLOGFONTW;            --  wingdi.h:1012
   subtype NPEXTLOGFONTW is PEXTLOGFONTW;                  --  wingdi.h:1012
   subtype LPEXTLOGFONTW is PEXTLOGFONTW;                  --  wingdi.h:1012
   type PDEVMODEA is access all DEVMODEA;                  --  wingdi.h:1351
   subtype NPDEVMODEA is PDEVMODEA;                        --  wingdi.h:1351
   subtype LPDEVMODEA is PDEVMODEA;                        --  wingdi.h:1351
   subtype PDEVMODE is PDEVMODEA;                          --  wingdi.h:1387
   subtype NPDEVMODE is PDEVMODEA;                         --  wingdi.h:1388
   subtype LPDEVMODE is PDEVMODEA;                         --  wingdi.h:1389
   type PDEVMODEW is access all DEVMODEW;                  --  wingdi.h:1379
   subtype NPDEVMODEW is PDEVMODEW;                        --  wingdi.h:1379
   subtype LPDEVMODEW is PDEVMODEW;                        --  wingdi.h:1379
   type PRGNDATAHEADER is access all RGNDATAHEADER;        --  wingdi.h:1524
   type PRGNDATA is access all RGNDATA;                    --  wingdi.h:1529
   subtype NPRGNDATA is PRGNDATA;                          --  wingdi.h:1529
   subtype LPRGNDATA is PRGNDATA;                          --  wingdi.h:1529
   type PABC is access all ABC;                            --  wingdi.h:1536
   subtype NPABC is PABC;                                  --  wingdi.h:1536
   subtype LPABC is PABC;                                  --  wingdi.h:1536
   type PABCFLOAT is access all ABCFLOAT;                  --  wingdi.h:1542
   subtype NPABCFLOAT is PABCFLOAT;                        --  wingdi.h:1542
   subtype LPABCFLOAT is PABCFLOAT;                        --  wingdi.h:1542
   type POUTLINETEXTMETRICA is access all OUTLINETEXTMETRICA;
   --  wingdi.h:1579
   subtype NPOUTLINETEXTMETRICA is POUTLINETEXTMETRICA;    --  wingdi.h:1579
   subtype LPOUTLINETEXTMETRICA is POUTLINETEXTMETRICA;    --  wingdi.h:1579
   subtype POUTLINETEXTMETRIC is POUTLINETEXTMETRICA;      --  wingdi.h:1621
   subtype NPOUTLINETEXTMETRIC is POUTLINETEXTMETRICA;     --  wingdi.h:1622
   subtype LPOUTLINETEXTMETRIC is POUTLINETEXTMETRICA;     --  wingdi.h:1623
   type POUTLINETEXTMETRICW is access all OUTLINETEXTMETRICW;
   --  wingdi.h:1613
   subtype NPOUTLINETEXTMETRICW is POUTLINETEXTMETRICW;    --  wingdi.h:1613
   subtype LPOUTLINETEXTMETRICW is POUTLINETEXTMETRICW;    --  wingdi.h:1613
   type PPOLYTEXTA is access all POLYTEXTA;                --  wingdi.h:1638
   subtype NPPOLYTEXTA is PPOLYTEXTA;                      --  wingdi.h:1638
   subtype LPPOLYTEXTA is PPOLYTEXTA;                      --  wingdi.h:1638
   subtype PPOLYTEXT is PPOLYTEXTA;                        --  wingdi.h:1656
   subtype NPPOLYTEXT is PPOLYTEXTA;                       --  wingdi.h:1657
   subtype LPPOLYTEXT is PPOLYTEXTA;                       --  wingdi.h:1658
   type PPOLYTEXTW is access all POLYTEXTW;                --  wingdi.h:1648
   subtype NPPOLYTEXTW is PPOLYTEXTW;                      --  wingdi.h:1648
   subtype LPPOLYTEXTW is PPOLYTEXTW;                      --  wingdi.h:1648
   type LPMAT2 is access all MAT2;                         --  wingdi.h:1672
   type LPGLYPHMETRICS is access all GLYPHMETRICS;         --  wingdi.h:1682
   type LPPOINTFX is access all POINTFX;                   --  wingdi.h:1700
   type LPTTPOLYCURVE is access all TTPOLYCURVE;           --  wingdi.h:1707
   type LPTTPOLYGONHEADER is access all TTPOLYGONHEADER;   --  wingdi.h:1714
   type LPRASTERIZER_STATUS is access all RASTERIZER_STATUS;
   --  wingdi.h:1722
   type PPIXELFORMATDESCRIPTOR is access all PIXELFORMATDESCRIPTOR;
   --  wingdi.h:1757
   subtype LPPIXELFORMATDESCRIPTOR is PPIXELFORMATDESCRIPTOR;
   --  wingdi.h:1757
   type LPDIBSECTION is access all DIBSECTION;             --  wingdi.h:2304
   subtype PDIBSECTION is LPDIBSECTION;                    --  wingdi.h:2304
   type PCOLORADJUSTMENT is access all COLORADJUSTMENT;    --  wingdi.h:2364
   subtype LPCOLORADJUSTMENT is PCOLORADJUSTMENT;          --  wingdi.h:2364
   type LPDOCINFOA is access all DOCINFOA;                 --  wingdi.h:2380
   subtype LPDOCINFO is LPDOCINFOA;                        --  wingdi.h:2391
   type LPDOCINFOW is access all DOCINFOW;                 --  wingdi.h:2385
   type LPKERNINGPAIR is access all KERNINGPAIR;           --  wingdi.h:2494
   type PEMR is access all EMR;                            --  wingdi.h:2635
   type PEMRTEXT is access all EMRTEXT;                    --  wingdi.h:2648
   type PEMRABORTPATH is access all ABORTPATH;             --  wingdi.h:2655
   subtype PEMRBEGINPATH is PEMRABORTPATH;                 --  wingdi.h:2656
   subtype PEMRENDPATH is PEMRABORTPATH;                   --  wingdi.h:2657
   subtype PEMRCLOSEFIGURE is PEMRABORTPATH;               --  wingdi.h:2658
   subtype PEMRFLATTENPATH is PEMRABORTPATH;               --  wingdi.h:2659
   subtype PEMRWIDENPATH is PEMRABORTPATH;                 --  wingdi.h:2660
   subtype PEMRSETMETARGN is PEMRABORTPATH;                --  wingdi.h:2661
   subtype PEMRSAVEDC is PEMRABORTPATH;                    --  wingdi.h:2662
   subtype PEMRREALIZEPALETTE is PEMRABORTPATH;            --  wingdi.h:2663
   type PEMRSELECTCLIPPATH is access all EMRSELECTCLIPPATH; --  wingdi.h:2669
   subtype PEMRSETBKMODE is PEMRSELECTCLIPPATH;            --  wingdi.h:2670
   subtype PEMRSETMAPMODE is PEMRSELECTCLIPPATH;           --  wingdi.h:2671
   subtype PEMRSETPOLYFILLMODE is PEMRSELECTCLIPPATH;      --  wingdi.h:2672
   subtype PEMRSETROP2 is PEMRSELECTCLIPPATH;              --  wingdi.h:2673
   subtype PEMRSETSTRETCHBLTMODE is PEMRSELECTCLIPPATH;    --  wingdi.h:2674
   subtype PEMRSETTEXTALIGN is PEMRSELECTCLIPPATH;         --  wingdi.h:2675
   type PEMRSETMITERLIMIT is access all EMRSETMITERLIMIT;  --  wingdi.h:2681
   type PEMRRESTOREDC is access all EMRRESTOREDC;          --  wingdi.h:2687
   type PEMRSETARCDIRECTION is access all EMRSETARCDIRECTION;
   --  wingdi.h:2694
   type PEMRSETMAPPERFLAGS is access all EMRSETMAPPERFLAGS; --  wingdi.h:2700
   type PEMRSETBKCOLOR is access all EMRSETTEXTCOLOR;      --  wingdi.h:2706
   subtype PEMRSETTEXTCOLOR is PEMRSETBKCOLOR;             --  wingdi.h:2707
   type PEMRSELECTOBJECT is access all EMRSELECTOBJECT;    --  wingdi.h:2713
   subtype PEMRDELETEOBJECT is PEMRSELECTOBJECT;           --  wingdi.h:2714
   type PEMRSELECTPALETTE is access all EMRSELECTPALETTE;  --  wingdi.h:2721
   type PEMRRESIZEPALETTE is access all EMRRESIZEPALETTE;  --  wingdi.h:2728
   type PEMRSETPALETTEENTRIES is access all EMRSETPALETTEENTRIES;
   --  wingdi.h:2737
   type PEMRSETCOLORADJUSTMENT is access all EMRSETCOLORADJUSTMENT;
   --  wingdi.h:2743
   type PEMRGDICOMMENT is access all EMRGDICOMMENT;        --  wingdi.h:2750
   type PEMREOF is access all EMREOF;                      --  wingdi.h:2760
   type PEMRLINETO is access all EMRLINETO;                --  wingdi.h:2766
   subtype PEMRMOVETOEX is PEMRLINETO;                     --  wingdi.h:2767
   type PEMROFFSETCLIPRGN is access all EMROFFSETCLIPRGN;  --  wingdi.h:2773
   type PEMRFILLPATH is access all EMRFILLPATH;            --  wingdi.h:2779
   subtype PEMRSTROKEANDFILLPATH is PEMRFILLPATH;          --  wingdi.h:2780
   subtype PEMRSTROKEPATH is PEMRSTROKEANDFILLPATH;        --  wingdi.h:2781
   type PEMREXCLUDECLIPRECT is access all EMREXCLUDECLIPRECT;
   --  wingdi.h:2787
   subtype PEMRINTERSECTCLIPRECT is PEMREXCLUDECLIPRECT;   --  wingdi.h:2788
   type PEMRSETVIEWPORTORGEX is access all EMRSETVIEWPORTORGEX;
   --  wingdi.h:2794
   subtype PEMRSETWINDOWORGEX is PEMRSETVIEWPORTORGEX;     --  wingdi.h:2795
   subtype PEMRSETBRUSHORGEX is PEMRSETVIEWPORTORGEX;      --  wingdi.h:2796
   type PEMRSETVIEWPORTEXTEX is access all EMRSETVIEWPORTEXTEX;
   --  wingdi.h:2802
   subtype PEMRSETWINDOWEXTEX is PEMRSETVIEWPORTEXTEX;     --  wingdi.h:2803
   type PEMRSCALEVIEWPORTEXTEX is access all EMRSCALEVIEWPORTEXTEX;
   --  wingdi.h:2812
   subtype PEMRSCALEWINDOWEXTEX is PEMRSCALEVIEWPORTEXTEX; --  wingdi.h:2813
   type PEMRSETWORLDTRANSFORM is access all EMRSETWORLDTRANSFORM;
   --  wingdi.h:2819
   type PEMRMODIFYWORLDTRANSFORM is access all EMRMODIFYWORLDTRANSFORM;
   --  wingdi.h:2826
   type PEMRSETPIXELV is access all EMRSETPIXELV;          --  wingdi.h:2833
   type PEMREXTFLOODFILL is access all EMREXTFLOODFILL;    --  wingdi.h:2841
   type PEMRELLIPSE is access all EMRELLIPSE;              --  wingdi.h:2847
   subtype PEMRRECTANGLE is PEMRELLIPSE;                   --  wingdi.h:2848
   type PEMRROUNDRECT is access all EMRROUNDRECT;          --  wingdi.h:2855
   type PEMRARC is access all EMRARC;                      --  wingdi.h:2863
   subtype PEMRARCTO is PEMRARC;                           --  wingdi.h:2864
   subtype PEMRCHORD is PEMRARCTO;                         --  wingdi.h:2865
   subtype PEMRPIE is PEMRARCTO;                           --  wingdi.h:2866
   type PEMRANGLEARC is access all EMRANGLEARC;            --  wingdi.h:2875
   type PEMRPOLYLINE is access all EMRPOLYLINE;            --  wingdi.h:2883
   subtype PEMRPOLYBEZIER is PEMRPOLYLINE;                 --  wingdi.h:2884
   subtype PEMRPOLYGON is PEMRPOLYLINE;                    --  wingdi.h:2885
   subtype PEMRPOLYBEZIERTO is PEMRPOLYLINE;               --  wingdi.h:2886
   subtype PEMRPOLYLINETO is PEMRPOLYLINE;                 --  wingdi.h:2887
   type PEMRPOLYLINE16 is access all EMRPOLYLINE16;        --  wingdi.h:2895
   subtype PEMRPOLYBEZIER16 is PEMRPOLYLINE16;             --  wingdi.h:2896
   subtype PEMRPOLYGON16 is PEMRPOLYLINE16;                --  wingdi.h:2897
   subtype PEMRPOLYBEZIERTO16 is PEMRPOLYLINE16;           --  wingdi.h:2898
   subtype PEMRPOLYLINETO16 is PEMRPOLYLINE16;             --  wingdi.h:2899
   type PEMRPOLYDRAW is access all EMRPOLYDRAW;            --  wingdi.h:2908
   type PEMRPOLYDRAW16 is access all EMRPOLYDRAW16;        --  wingdi.h:2917
   type PEMRPOLYPOLYLINE is access all EMRPOLYPOLYLINE;    --  wingdi.h:2927
   subtype PEMRPOLYPOLYGON is PEMRPOLYPOLYLINE;            --  wingdi.h:2928
   type PEMRPOLYPOLYLINE16 is access all EMRPOLYPOLYLINE16; --  wingdi.h:2938
   subtype PEMRPOLYPOLYGON16 is PEMRPOLYPOLYLINE16;        --  wingdi.h:2939
   type PEMRINVERTRGN is access all EMRINVERTRGN;          --  wingdi.h:2947
   subtype PEMRPAINTRGN is PEMRINVERTRGN;                  --  wingdi.h:2948
   type PEMRFILLRGN is access all EMRFILLRGN;              --  wingdi.h:2957
   type PEMRFRAMERGN is access all EMRFRAMERGN;            --  wingdi.h:2967
   type PEMREXTSELECTCLIPRGN is access all EMREXTSELECTCLIPRGN;
   --  wingdi.h:2975
   type PEMREXTTEXTOUTA is access all EMREXTTEXTOUTA;      --  wingdi.h:2986
   subtype PEMREXTTEXTOUTW is PEMREXTTEXTOUTA;             --  wingdi.h:2987
   type PEMRPOLYTEXTOUTA is access all EMRPOLYTEXTOUTA;    --  wingdi.h:2999
   subtype PEMRPOLYTEXTOUTW is PEMRPOLYTEXTOUTA;           --  wingdi.h:3000
   type PEMRBITBLT is access all EMRBITBLT;                --  wingdi.h:3021
   type PEMRSTRETCHBLT is access all EMRSTRETCHBLT;        --  wingdi.h:3044
   type PEMRMASKBLT is access all EMRMASKBLT;              --  wingdi.h:3072
   type PEMRPLGBLT is access all EMRPLGBLT;                --  wingdi.h:3098
   type PEMRSETDIBITSTODEVICE is access all EMRSETDIBITSTODEVICE;
   --  wingdi.h:3117
   type PEMRSTRETCHDIBITS is access all EMRSTRETCHDIBITS;  --  wingdi.h:3137
   type PEMREXTCREATEFONTINDIRECTW is access all EMREXTCREATEFONTINDIRECTW;
   --  wingdi.h:3144
   type PEMRCREATEPALETTE is access all EMRCREATEPALETTE;  --  wingdi.h:3152
   type PEMRCREATEPEN is access all EMRCREATEPEN;          --  wingdi.h:3160
   type PEMREXTCREATEPEN is access all EMREXTCREATEPEN;    --  wingdi.h:3173
   type PEMRCREATEBRUSHINDIRECT is access all EMRCREATEBRUSHINDIRECT;
   --  wingdi.h:3181
   type PEMRCREATEMONOBRUSH is access all EMRCREATEMONOBRUSH;
   --  wingdi.h:3192
   type PEMRCREATEDIBPATTERNBRUSHPT is access all EMRCREATEDIBPATTERNBRUSHPT;
   --  wingdi.h:3205
   type PEMRFORMAT is access all EMRFORMAT;                --  wingdi.h:3214

   type XFORM is                                           --  wingdi.h:344
      record
         eM11 : Win32.FLOAT;                              --  wingdi.h:346
         eM12 : Win32.FLOAT;                              --  wingdi.h:347
         eM21 : Win32.FLOAT;                              --  wingdi.h:348
         eM22 : Win32.FLOAT;                              --  wingdi.h:349
         eDx : Win32.FLOAT;                              --  wingdi.h:350
         eDy : Win32.FLOAT;                              --  wingdi.h:351
      end record;

   type BITMAP is                                          --  wingdi.h:355
      record
         bmType : Win32.LONG;                       --  wingdi.h:357
         bmWidth : Win32.LONG;                       --  wingdi.h:358
         bmHeight : Win32.LONG;                       --  wingdi.h:359
         bmWidthBytes : Win32.LONG;                       --  wingdi.h:360
         bmPlanes : Win32.WORD;                       --  wingdi.h:361
         bmBitsPixel : Win32.WORD;                       --  wingdi.h:362
         bmBits : Win32.LPVOID;                     --  wingdi.h:363
      end record;

   type RGBTRIPLE is                                       --  wingdi.h:366
      record
         rgbtBlue : Win32.BYTE;                          --  wingdi.h:367
         rgbtGreen : Win32.BYTE;                          --  wingdi.h:368
         rgbtRed : Win32.BYTE;                          --  wingdi.h:369
      end record;

   type RGBQUAD is                                         --  wingdi.h:372
      record
         rgbBlue : Win32.BYTE;                        --  wingdi.h:373
         rgbGreen : Win32.BYTE;                        --  wingdi.h:374
         rgbRed : Win32.BYTE;                        --  wingdi.h:375
         rgbReserved : Win32.BYTE;                        --  wingdi.h:376
      end record;

   type BITMAPCOREHEADER is                                --  wingdi.h:383
      record
         bcSize : Win32.DWORD;                        --  wingdi.h:384
         bcWidth : Win32.WORD;                         --  wingdi.h:385
         bcHeight : Win32.WORD;                         --  wingdi.h:386
         bcPlanes : Win32.WORD;                         --  wingdi.h:387
         bcBitCount : Win32.WORD;                         --  wingdi.h:388
      end record;

   type BITMAPINFOHEADER is                                --  wingdi.h:392
      record
         biSize          : Win32.DWORD; --  wingdi.h:393
         biWidth         : Win32.LONG;  --  wingdi.h:394
         biHeight        : Win32.LONG;  --  wingdi.h:395
         biPlanes        : Win32.WORD;  --  wingdi.h:396
         biBitCount      : Win32.WORD;  --  wingdi.h:397
         biCompression   : Win32.DWORD; --  wingdi.h:398
         biSizeImage     : Win32.DWORD; --  wingdi.h:399
         biXPelsPerMeter : Win32.LONG;  --  wingdi.h:400
         biYPelsPerMeter : Win32.LONG;  --  wingdi.h:401
         biClrUsed       : Win32.DWORD; --  wingdi.h:402
         biClrImportant  : Win32.DWORD; --  wingdi.h:403
      end record;

   type RGBQUAD_Array is                                   --  wingdi.h:416
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased RGBQUAD;

   type BITMAPINFO is                                      --  wingdi.h:414
      record
         bmiHeader : BITMAPINFOHEADER;                    --  wingdi.h:415
         bmiColors : RGBQUAD_Array;                       --  wingdi.h:416
      end record;

   type RGBTRIPLE_Array is                                 --  wingdi.h:421
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased RGBTRIPLE;

   type BITMAPCOREINFO is                                  --  wingdi.h:419
      record
         bmciHeader : BITMAPCOREHEADER;                   --  wingdi.h:420
         bmciColors : RGBTRIPLE_Array;                    --  wingdi.h:421
      end record;

   type BITMAPFILEHEADER is                                --  wingdi.h:426
      record
         bfType : Win32.WORD;                        --  wingdi.h:427
         bfSize : Win32.DWORD;                       --  wingdi.h:428
         bfReserved1 : Win32.WORD;                        --  wingdi.h:429
         bfReserved2 : Win32.WORD;                        --  wingdi.h:430
         bfOffBits : Win32.DWORD;                       --  wingdi.h:431
      end record;

   for BITMAPFILEHEADER use
      record
         bfType      at 0 range 0 .. 15;
         bfSize      at 2 range 0 .. 31;
         bfReserved1 at 6 range 0 .. 15;
         bfReserved2 at 8 range 0 .. 15;
         bfOffBits   at 10 range 0 .. 31;
      end record;

   for BITMAPFILEHEADER'Size use 14 * 8;

   type HGDIOBJ_Array is                                   --  wingdi.h:443
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased Win32.Windef.HGDIOBJ;

   type HANDLETABLE is                                     --  wingdi.h:441
      record
         objectHandle : HGDIOBJ_Array;                    --  wingdi.h:443
      end record;

   type METARECORD is                                      --  wingdi.h:446
      record
         rdSize : Win32.DWORD;                        --  wingdi.h:448
         rdFunction : Win32.WORD;                         --  wingdi.h:449
         rdParm : Win32.WORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:450
      end record;

   type METAFILEPICT is                                    --  wingdi.h:455
      record
         mm : Win32.LONG;                               --  wingdi.h:457
         xExt : Win32.LONG;                               --  wingdi.h:458
         yExt : Win32.LONG;                               --  wingdi.h:459
         hMF : Win32.Windef.HMETAFILE;                   --  wingdi.h:460
      end record;

   type METAHEADER is                                      --  wingdi.h:465
      record
         mtType : Win32.WORD;                     --  wingdi.h:467
         mtHeaderSize : Win32.WORD;                     --  wingdi.h:468
         mtVersion : Win32.WORD;                     --  wingdi.h:469
         mtSize : Win32.DWORD;                    --  wingdi.h:470
         mtNoObjects : Win32.WORD;                     --  wingdi.h:471
         mtMaxRecord : Win32.DWORD;                    --  wingdi.h:472
         mtNoParameters : Win32.WORD;                     --  wingdi.h:473
      end record;

   for METAHEADER use
      record
         mtType         at 0 range 0 .. 15;
         mtHeaderSize   at 2 range 0 .. 15;
         mtVersion      at 4 range 0 .. 15;
         mtSize         at 6 range 0 .. 31;
         mtNoObjects    at 10 range 0 .. 15;
         mtMaxRecord    at 12 range 0 .. 31;
         mtNoParameters at 16 range 0 .. 15;
      end record;

   for METAHEADER'Size use 18 * 8;

   type ENHMETARECORD is                                   --  wingdi.h:482
      record
         iType : Win32.DWORD;                             --  wingdi.h:484
         nSize : Win32.DWORD;                             --  wingdi.h:485
         dParm : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:486
      end record;

   type ENHMETAHEADER is                                   --  wingdi.h:489
      record
         iType : Win32.DWORD;                    --  wingdi.h:491
         nSize : Win32.DWORD;                    --  wingdi.h:492
         rclBounds : Win32.Windef.RECTL;             --  wingdi.h:494
         rclFrame : Win32.Windef.RECTL;             --  wingdi.h:495
         dSignature : Win32.DWORD;                    --  wingdi.h:496
         nVersion : Win32.DWORD;                    --  wingdi.h:497
         nBytes : Win32.DWORD;                    --  wingdi.h:498
         nRecords : Win32.DWORD;                    --  wingdi.h:499
         nHandles : Win32.WORD;                     --  wingdi.h:500
         sReserved : Win32.WORD;                     --  wingdi.h:502
         nDescription : Win32.DWORD;                    --  wingdi.h:503
         offDescription : Win32.DWORD;                    --  wingdi.h:505
         nPalEntries : Win32.DWORD;                    --  wingdi.h:507
         szlDevice : Win32.Windef.SIZEL;             --  wingdi.h:508
         szlMillimeters : Win32.Windef.SIZEL;             --  wingdi.h:509
      end record;

   type TEXTMETRICA is                                     --  wingdi.h:522
      record
         tmHeight : Win32.LONG;                 --  wingdi.h:524
         tmAscent : Win32.LONG;                 --  wingdi.h:525
         tmDescent : Win32.LONG;                 --  wingdi.h:526
         tmInternalLeading : Win32.LONG;                 --  wingdi.h:527
         tmExternalLeading : Win32.LONG;                 --  wingdi.h:528
         tmAveCharWidth : Win32.LONG;                 --  wingdi.h:529
         tmMaxCharWidth : Win32.LONG;                 --  wingdi.h:530
         tmWeight : Win32.LONG;                 --  wingdi.h:531
         tmOverhang : Win32.LONG;                 --  wingdi.h:532
         tmDigitizedAspectX : Win32.LONG;                 --  wingdi.h:533
         tmDigitizedAspectY : Win32.LONG;                 --  wingdi.h:534
         tmFirstChar : Win32.BYTE;                 --  wingdi.h:535
         tmLastChar : Win32.BYTE;                 --  wingdi.h:536
         tmDefaultChar : Win32.BYTE;                 --  wingdi.h:537
         tmBreakChar : Win32.BYTE;                 --  wingdi.h:538
         tmItalic : Win32.BYTE;                 --  wingdi.h:539
         tmUnderlined : Win32.BYTE;                 --  wingdi.h:540
         tmStruckOut : Win32.BYTE;                 --  wingdi.h:541
         tmPitchAndFamily : Win32.BYTE;                 --  wingdi.h:542
         tmCharSet : Win32.BYTE;                 --  wingdi.h:543
      end record;

   type TEXTMETRICW is                                     --  wingdi.h:545
      record
         tmHeight : Win32.LONG;                 --  wingdi.h:547
         tmAscent : Win32.LONG;                 --  wingdi.h:548
         tmDescent : Win32.LONG;                 --  wingdi.h:549
         tmInternalLeading : Win32.LONG;                 --  wingdi.h:550
         tmExternalLeading : Win32.LONG;                 --  wingdi.h:551
         tmAveCharWidth : Win32.LONG;                 --  wingdi.h:552
         tmMaxCharWidth : Win32.LONG;                 --  wingdi.h:553
         tmWeight : Win32.LONG;                 --  wingdi.h:554
         tmOverhang : Win32.LONG;                 --  wingdi.h:555
         tmDigitizedAspectX : Win32.LONG;                 --  wingdi.h:556
         tmDigitizedAspectY : Win32.LONG;                 --  wingdi.h:557
         tmFirstChar : Win32.WCHAR;                --  wingdi.h:558
         tmLastChar : Win32.WCHAR;                --  wingdi.h:559
         tmDefaultChar : Win32.WCHAR;                --  wingdi.h:560
         tmBreakChar : Win32.WCHAR;                --  wingdi.h:561
         tmItalic : Win32.BYTE;                 --  wingdi.h:562
         tmUnderlined : Win32.BYTE;                 --  wingdi.h:563
         tmStruckOut : Win32.BYTE;                 --  wingdi.h:564
         tmPitchAndFamily : Win32.BYTE;                 --  wingdi.h:565
         tmCharSet : Win32.BYTE;                 --  wingdi.h:566
      end record;

   subtype TEXTMETRIC is TEXTMETRICA;                      --  wingdi.h:574

   type NEWTEXTMETRICA is                                  --  wingdi.h:585
      record
         tmHeight : Win32.LONG;                 --  wingdi.h:587
         tmAscent : Win32.LONG;                 --  wingdi.h:588
         tmDescent : Win32.LONG;                 --  wingdi.h:589
         tmInternalLeading : Win32.LONG;                 --  wingdi.h:590
         tmExternalLeading : Win32.LONG;                 --  wingdi.h:591
         tmAveCharWidth : Win32.LONG;                 --  wingdi.h:592
         tmMaxCharWidth : Win32.LONG;                 --  wingdi.h:593
         tmWeight : Win32.LONG;                 --  wingdi.h:594
         tmOverhang : Win32.LONG;                 --  wingdi.h:595
         tmDigitizedAspectX : Win32.LONG;                 --  wingdi.h:596
         tmDigitizedAspectY : Win32.LONG;                 --  wingdi.h:597
         tmFirstChar : Win32.BYTE;                 --  wingdi.h:598
         tmLastChar : Win32.BYTE;                 --  wingdi.h:599
         tmDefaultChar : Win32.BYTE;                 --  wingdi.h:600
         tmBreakChar : Win32.BYTE;                 --  wingdi.h:601
         tmItalic : Win32.BYTE;                 --  wingdi.h:602
         tmUnderlined : Win32.BYTE;                 --  wingdi.h:603
         tmStruckOut : Win32.BYTE;                 --  wingdi.h:604
         tmPitchAndFamily : Win32.BYTE;                 --  wingdi.h:605
         tmCharSet : Win32.BYTE;                 --  wingdi.h:606
         ntmFlags : Win32.DWORD;                --  wingdi.h:607
         ntmSizeEM : Win32.UINT;                 --  wingdi.h:608
         ntmCellHeight : Win32.UINT;                 --  wingdi.h:609
         ntmAvgWidth : Win32.UINT;                 --  wingdi.h:610
      end record;

   type NEWTEXTMETRICW is                                  --  wingdi.h:612
      record
         tmHeight : Win32.LONG;                 --  wingdi.h:614
         tmAscent : Win32.LONG;                 --  wingdi.h:615
         tmDescent : Win32.LONG;                 --  wingdi.h:616
         tmInternalLeading : Win32.LONG;                 --  wingdi.h:617
         tmExternalLeading : Win32.LONG;                 --  wingdi.h:618
         tmAveCharWidth : Win32.LONG;                 --  wingdi.h:619
         tmMaxCharWidth : Win32.LONG;                 --  wingdi.h:620
         tmWeight : Win32.LONG;                 --  wingdi.h:621
         tmOverhang : Win32.LONG;                 --  wingdi.h:622
         tmDigitizedAspectX : Win32.LONG;                 --  wingdi.h:623
         tmDigitizedAspectY : Win32.LONG;                 --  wingdi.h:624
         tmFirstChar : Win32.WCHAR;                --  wingdi.h:625
         tmLastChar : Win32.WCHAR;                --  wingdi.h:626
         tmDefaultChar : Win32.WCHAR;                --  wingdi.h:627
         tmBreakChar : Win32.WCHAR;                --  wingdi.h:628
         tmItalic : Win32.BYTE;                 --  wingdi.h:629
         tmUnderlined : Win32.BYTE;                 --  wingdi.h:630
         tmStruckOut : Win32.BYTE;                 --  wingdi.h:631
         tmPitchAndFamily : Win32.BYTE;                 --  wingdi.h:632
         tmCharSet : Win32.BYTE;                 --  wingdi.h:633
         ntmFlags : Win32.DWORD;                --  wingdi.h:634
         ntmSizeEM : Win32.UINT;                 --  wingdi.h:635
         ntmCellHeight : Win32.UINT;                 --  wingdi.h:636
         ntmAvgWidth : Win32.UINT;                 --  wingdi.h:637
      end record;

   subtype NEWTEXTMETRIC is NEWTEXTMETRICA;                --  wingdi.h:645

   type PELARRAY is                                        --  wingdi.h:656
      record
         paXCount : Win32.LONG;                           --  wingdi.h:658
         paYCount : Win32.LONG;                           --  wingdi.h:659
         paXExt : Win32.LONG;                           --  wingdi.h:660
         paYExt : Win32.LONG;                           --  wingdi.h:661
         paRGBs : Win32.BYTE;                           --  wingdi.h:662
      end record;

   type LOGBRUSH is                                        --  wingdi.h:666
      record
         lbStyle : Win32.UINT;                            --  wingdi.h:668
         lbColor : Win32.Windef.COLORREF;                 --  wingdi.h:669
         lbHatch : Win32.LONG;                            --  wingdi.h:670
      end record;

   subtype PATTERN is LOGBRUSH;                            --  wingdi.h:673

   type LOGPEN is                                          --  wingdi.h:679
      record
         lopnStyle : Win32.UINT;                          --  wingdi.h:681
         lopnWidth : Win32.Windef.POINT;                  --  wingdi.h:682
         lopnColor : Win32.Windef.COLORREF;               --  wingdi.h:683
      end record;

   type EXTLOGPEN is                                       --  wingdi.h:686
      record
         elpPenStyle : Win32.DWORD;                     --  wingdi.h:687
         elpWidth : Win32.DWORD;                     --  wingdi.h:688
         elpBrushStyle : Win32.UINT;                      --  wingdi.h:689
         elpColor : Win32.Windef.COLORREF;           --  wingdi.h:690
         elpHatch : Win32.LONG;                      --  wingdi.h:691
         elpNumEntries : Win32.DWORD;                     --  wingdi.h:692
         elpStyleEntry : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:693
      end record;

   type PALETTEENTRY is                                    --  wingdi.h:696
      record
         peRed : Win32.BYTE;                            --  wingdi.h:697
         peGreen : Win32.BYTE;                            --  wingdi.h:698
         peBlue : Win32.BYTE;                            --  wingdi.h:699
         peFlags : Win32.BYTE;                            --  wingdi.h:700
      end record;

   type PALETTEENTRY_Array is                              --  wingdi.h:707
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased PALETTEENTRY;

   type LOGPALETTE is                                      --  wingdi.h:704
      record
         palVersion : Win32.WORD;                      --  wingdi.h:705
         palNumEntries : Win32.WORD;                      --  wingdi.h:706
         palPalEntry : PALETTEENTRY_Array;              --  wingdi.h:707
      end record;

   type LOGFONTA is                                        --  wingdi.h:714
      record
         lfHeight : Win32.LONG;                   --  wingdi.h:716
         lfWidth : Win32.LONG;                   --  wingdi.h:717
         lfEscapement : Win32.LONG;                   --  wingdi.h:718
         lfOrientation : Win32.LONG;                   --  wingdi.h:719
         lfWeight : Win32.LONG;                   --  wingdi.h:720
         lfItalic : Win32.BYTE;                   --  wingdi.h:721
         lfUnderline : Win32.BYTE;                   --  wingdi.h:722
         lfStrikeOut : Win32.BYTE;                   --  wingdi.h:723
         lfCharSet : Win32.BYTE;                   --  wingdi.h:724
         lfOutPrecision : Win32.BYTE;                   --  wingdi.h:725
         lfClipPrecision : Win32.BYTE;                   --  wingdi.h:726
         lfQuality : Win32.BYTE;                   --  wingdi.h:727
         lfPitchAndFamily : Win32.BYTE;                   --  wingdi.h:728
         lfFaceName : Win32.CHAR_Array (0 .. 31);      --  wingdi.h:729
      end record;

   type LOGFONTW is                                        --  wingdi.h:731
      record
         lfHeight : Win32.LONG;                   --  wingdi.h:733
         lfWidth : Win32.LONG;                   --  wingdi.h:734
         lfEscapement : Win32.LONG;                   --  wingdi.h:735
         lfOrientation : Win32.LONG;                   --  wingdi.h:736
         lfWeight : Win32.LONG;                   --  wingdi.h:737
         lfItalic : Win32.BYTE;                   --  wingdi.h:738
         lfUnderline : Win32.BYTE;                   --  wingdi.h:739
         lfStrikeOut : Win32.BYTE;                   --  wingdi.h:740
         lfCharSet : Win32.BYTE;                   --  wingdi.h:741
         lfOutPrecision : Win32.BYTE;                   --  wingdi.h:742
         lfClipPrecision : Win32.BYTE;                   --  wingdi.h:743
         lfQuality : Win32.BYTE;                   --  wingdi.h:744
         lfPitchAndFamily : Win32.BYTE;                   --  wingdi.h:745
         lfFaceName : Win32.WCHAR_Array (0 .. 31);     --  wingdi.h:746
      end record;

   subtype LOGFONT is LOGFONTA;                            --  wingdi.h:754

   type ENUMLOGFONTA is                                    --  wingdi.h:763
      record
         elfLogFont : LOGFONTA;                          --  wingdi.h:765
         elfFullName : Win32.BYTE_Array (0 .. 63);           --  wingdi.h:766
         elfStyle : Win32.BYTE_Array (0 .. 31);           --  wingdi.h:767
      end record;

   type ENUMLOGFONTW is                                    --  wingdi.h:770
      record
         elfLogFont : LOGFONTW;                          --  wingdi.h:772
         elfFullName : Win32.WCHAR_Array (0 .. 63);          --  wingdi.h:773
         elfStyle : Win32.WCHAR_Array (0 .. 31);          --  wingdi.h:774
      end record;

   subtype ENUMLOGFONT is ENUMLOGFONTA;                    --  wingdi.h:780

   type PANOSE is                                          --  wingdi.h:863
      record
         bFamilyType : Win32.BYTE;                   --  wingdi.h:865
         bSerifStyle : Win32.BYTE;                   --  wingdi.h:866
         bWeight : Win32.BYTE;                   --  wingdi.h:867
         bProportion : Win32.BYTE;                   --  wingdi.h:868
         bContrast : Win32.BYTE;                   --  wingdi.h:869
         bStrokeVariation : Win32.BYTE;                   --  wingdi.h:870
         bArmStyle : Win32.BYTE;                   --  wingdi.h:871
         bLetterform : Win32.BYTE;                   --  wingdi.h:872
         bMidline : Win32.BYTE;                   --  wingdi.h:873
         bXHeight : Win32.BYTE;                   --  wingdi.h:874
      end record;

   type EXTLOGFONTA is                                     --  wingdi.h:989
      record
         elfLogFont : LOGFONTA;                         --  wingdi.h:990
         elfFullName : Win32.BYTE_Array (0 .. 63);          --  wingdi.h:991
         elfStyle : Win32.BYTE_Array (0 .. 31);          --  wingdi.h:992
         elfVersion : Win32.DWORD;                      --  wingdi.h:993
         elfStyleSize : Win32.DWORD;                      --  wingdi.h:994
         elfMatch : Win32.DWORD;                      --  wingdi.h:995
         elfReserved : Win32.DWORD;                      --  wingdi.h:996
         elfVendorId : Win32.BYTE_Array (0 .. 3);           --  wingdi.h:997
         elfCulture : Win32.DWORD;                      --  wingdi.h:998
         elfPanose : PANOSE;                           --  wingdi.h:999
      end record;

   type EXTLOGFONTW is                                     --  wingdi.h:1001
      record
         elfLogFont : LOGFONTW;                         --  wingdi.h:1002
         elfFullName : Win32.WCHAR_Array (0 .. 63);         --  wingdi.h:1003
         elfStyle : Win32.WCHAR_Array (0 .. 31);         --  wingdi.h:1004
         elfVersion : Win32.DWORD;                      --  wingdi.h:1005
         elfStyleSize : Win32.DWORD;                      --  wingdi.h:1006
         elfMatch : Win32.DWORD;                      --  wingdi.h:1007
         elfReserved : Win32.DWORD;                      --  wingdi.h:1008
         elfVendorId : Win32.BYTE_Array (0 .. 3);           --  wingdi.h:1009
         elfCulture : Win32.DWORD;                      --  wingdi.h:1010
         elfPanose : PANOSE;                           --  wingdi.h:1011
      end record;

   subtype EXTLOGFONT is EXTLOGFONTA;                      --  wingdi.h:1019

   type DEVMODEA is                                        --  wingdi.h:1324
      record
         dmDeviceName : Win32.BYTE_Array (0 .. 31);    --  wingdi.h:1325
         dmSpecVersion : Win32.WORD;                 --  wingdi.h:1326
         dmDriverVersion : Win32.WORD;                 --  wingdi.h:1327
         dmSize : Win32.WORD;                 --  wingdi.h:1328
         dmDriverExtra : Win32.WORD;                 --  wingdi.h:1329
         dmFields : Win32.DWORD;                --  wingdi.h:1330
         dmOrientation : Win32.SHORT;                --  wingdi.h:1331
         dmPaperSize : Win32.SHORT;                --  wingdi.h:1332
         dmPaperLength : Win32.SHORT;                --  wingdi.h:1333
         dmPaperWidth : Win32.SHORT;                --  wingdi.h:1334
         dmScale : Win32.SHORT;                --  wingdi.h:1335
         dmCopies : Win32.SHORT;                --  wingdi.h:1336
         dmDefaultSource : Win32.SHORT;                --  wingdi.h:1337
         dmPrintQuality : Win32.SHORT;                --  wingdi.h:1338
         dmColor : Win32.SHORT;                --  wingdi.h:1339
         dmDuplex : Win32.SHORT;                --  wingdi.h:1340
         dmYResolution : Win32.SHORT;                --  wingdi.h:1341
         dmTTOption : Win32.SHORT;                --  wingdi.h:1342
         dmCollate : Win32.SHORT;                --  wingdi.h:1343
         dmFormName : Win32.BYTE_Array (0 .. 31);    --  wingdi.h:1344
         dmLogPixels : Win32.WORD;                 --  wingdi.h:1345
         dmBitsPerPel : Win32.DWORD;                --  wingdi.h:1346
         dmPelsWidth : Win32.DWORD;                --  wingdi.h:1347
         dmPelsHeight : Win32.DWORD;                --  wingdi.h:1348
         dmDisplayFlags : Win32.DWORD;                --  wingdi.h:1349
         dmDisplayFrequency : Win32.DWORD;                --  wingdi.h:1350
      end record;

   type DEVMODEW is                                        --  wingdi.h:1352
      record
         dmDeviceName : Win32.WCHAR_Array (0 .. 31);   --  wingdi.h:1353
         dmSpecVersion : Win32.WORD;                 --  wingdi.h:1354
         dmDriverVersion : Win32.WORD;                 --  wingdi.h:1355
         dmSize : Win32.WORD;                 --  wingdi.h:1356
         dmDriverExtra : Win32.WORD;                 --  wingdi.h:1357
         dmFields : Win32.DWORD;                --  wingdi.h:1358
         dmOrientation : Win32.SHORT;                --  wingdi.h:1359
         dmPaperSize : Win32.SHORT;                --  wingdi.h:1360
         dmPaperLength : Win32.SHORT;                --  wingdi.h:1361
         dmPaperWidth : Win32.SHORT;                --  wingdi.h:1362
         dmScale : Win32.SHORT;                --  wingdi.h:1363
         dmCopies : Win32.SHORT;                --  wingdi.h:1364
         dmDefaultSource : Win32.SHORT;                --  wingdi.h:1365
         dmPrintQuality : Win32.SHORT;                --  wingdi.h:1366
         dmColor : Win32.SHORT;                --  wingdi.h:1367
         dmDuplex : Win32.SHORT;                --  wingdi.h:1368
         dmYResolution : Win32.SHORT;                --  wingdi.h:1369
         dmTTOption : Win32.SHORT;                --  wingdi.h:1370
         dmCollate : Win32.SHORT;                --  wingdi.h:1371
         dmFormName : Win32.WCHAR_Array (0 .. 31);   --  wingdi.h:1372
         dmLogPixels : Win32.WORD;                 --  wingdi.h:1373
         dmBitsPerPel : Win32.DWORD;                --  wingdi.h:1374
         dmPelsWidth : Win32.DWORD;                --  wingdi.h:1375
         dmPelsHeight : Win32.DWORD;                --  wingdi.h:1376
         dmDisplayFlags : Win32.DWORD;                --  wingdi.h:1377
         dmDisplayFrequency : Win32.DWORD;                --  wingdi.h:1378
      end record;

   subtype DEVMODE is DEVMODEA;                            --  wingdi.h:1386

   type RGNDATAHEADER is                                   --  wingdi.h:1518
      record
         dwSize : Win32.DWORD;                          --  wingdi.h:1519
         iType : Win32.DWORD;                          --  wingdi.h:1520
         nCount : Win32.DWORD;                          --  wingdi.h:1521
         nRgnSize : Win32.DWORD;                          --  wingdi.h:1522
         rcBound : Win32.Windef.RECT;                    --  wingdi.h:1523
      end record;

   type RGNDATA is                                         --  wingdi.h:1526
      record
         rdh : RGNDATAHEADER;                          --  wingdi.h:1527
         Buffer : Win32.CHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:1528
      end record;

   type ABC is                                             --  wingdi.h:1532
      record
         abcA : Win32.INT;                                --  wingdi.h:1533
         abcB : Win32.UINT;                               --  wingdi.h:1534
         abcC : Win32.INT;                                --  wingdi.h:1535
      end record;

   type ABCFLOAT is                                        --  wingdi.h:1538
      record
         abcfA : Win32.FLOAT;                             --  wingdi.h:1539
         abcfB : Win32.FLOAT;                             --  wingdi.h:1540
         abcfC : Win32.FLOAT;                             --  wingdi.h:1541
      end record;

   type OUTLINETEXTMETRICA is                              --  wingdi.h:1546
      record
         otmSize : Win32.UINT;             --  wingdi.h:1547
         otmTextMetrics : TEXTMETRICA;            --  wingdi.h:1548
         otmFiller : Win32.BYTE;             --  wingdi.h:1549
         otmPanoseNumber : PANOSE;                 --  wingdi.h:1550
         otmfsSelection : Win32.UINT;             --  wingdi.h:1551
         otmfsType : Win32.UINT;             --  wingdi.h:1552
         otmsCharSlopeRise : Win32.INT;              --  wingdi.h:1553
         otmsCharSlopeRun : Win32.INT;              --  wingdi.h:1554
         otmItalicAngle : Win32.INT;              --  wingdi.h:1555
         otmEMSquare : Win32.UINT;             --  wingdi.h:1556
         otmAscent : Win32.INT;              --  wingdi.h:1557
         otmDescent : Win32.INT;              --  wingdi.h:1558
         otmLineGap : Win32.UINT;             --  wingdi.h:1559
         otmsCapEmHeight : Win32.UINT;             --  wingdi.h:1560
         otmsXHeight : Win32.UINT;             --  wingdi.h:1561
         otmrcFontBox : Win32.Windef.RECT;      --  wingdi.h:1562
         otmMacAscent : Win32.INT;              --  wingdi.h:1563
         otmMacDescent : Win32.INT;              --  wingdi.h:1564
         otmMacLineGap : Win32.UINT;             --  wingdi.h:1565
         otmusMinimumPPEM : Win32.UINT;             --  wingdi.h:1566
         otmptSubscriptSize : Win32.Windef.POINT;     --  wingdi.h:1567
         otmptSubscriptOffset : Win32.Windef.POINT;     --  wingdi.h:1568
         otmptSuperscriptSize : Win32.Windef.POINT;     --  wingdi.h:1569
         otmptSuperscriptOffset : Win32.Windef.POINT;     --  wingdi.h:1570
         otmsStrikeoutSize : Win32.UINT;             --  wingdi.h:1571
         otmsStrikeoutPosition : Win32.INT;              --  wingdi.h:1572
         otmsUnderscoreSize : Win32.INT;              --  wingdi.h:1573
         otmsUnderscorePosition : Win32.INT;              --  wingdi.h:1574
         otmpFamilyName : Win32.PSTR;             --  wingdi.h:1575
         otmpFaceName : Win32.PSTR;             --  wingdi.h:1576
         otmpStyleName : Win32.PSTR;             --  wingdi.h:1577
         otmpFullName : Win32.PSTR;             --  wingdi.h:1578
      end record;

   type OUTLINETEXTMETRICW is                              --  wingdi.h:1580
      record
         otmSize : Win32.UINT;             --  wingdi.h:1581
         otmTextMetrics : TEXTMETRICW;            --  wingdi.h:1582
         otmFiller : Win32.BYTE;             --  wingdi.h:1583
         otmPanoseNumber : PANOSE;                 --  wingdi.h:1584
         otmfsSelection : Win32.UINT;             --  wingdi.h:1585
         otmfsType : Win32.UINT;             --  wingdi.h:1586
         otmsCharSlopeRise : Win32.INT;              --  wingdi.h:1587
         otmsCharSlopeRun : Win32.INT;              --  wingdi.h:1588
         otmItalicAngle : Win32.INT;              --  wingdi.h:1589
         otmEMSquare : Win32.UINT;             --  wingdi.h:1590
         otmAscent : Win32.INT;              --  wingdi.h:1591
         otmDescent : Win32.INT;              --  wingdi.h:1592
         otmLineGap : Win32.UINT;             --  wingdi.h:1593
         otmsCapEmHeight : Win32.UINT;             --  wingdi.h:1594
         otmsXHeight : Win32.UINT;             --  wingdi.h:1595
         otmrcFontBox : Win32.Windef.RECT;      --  wingdi.h:1596
         otmMacAscent : Win32.INT;              --  wingdi.h:1597
         otmMacDescent : Win32.INT;              --  wingdi.h:1598
         otmMacLineGap : Win32.UINT;             --  wingdi.h:1599
         otmusMinimumPPEM : Win32.UINT;             --  wingdi.h:1600
         otmptSubscriptSize : Win32.Windef.POINT;     --  wingdi.h:1601
         otmptSubscriptOffset : Win32.Windef.POINT;     --  wingdi.h:1602
         otmptSuperscriptSize : Win32.Windef.POINT;     --  wingdi.h:1603
         otmptSuperscriptOffset : Win32.Windef.POINT;     --  wingdi.h:1604
         otmsStrikeoutSize : Win32.UINT;             --  wingdi.h:1605
         otmsStrikeoutPosition : Win32.INT;              --  wingdi.h:1606
         otmsUnderscoreSize : Win32.INT;              --  wingdi.h:1607
         otmsUnderscorePosition : Win32.INT;              --  wingdi.h:1608
         otmpFamilyName : Win32.PSTR;             --  wingdi.h:1609
         otmpFaceName : Win32.PSTR;             --  wingdi.h:1610
         otmpStyleName : Win32.PSTR;             --  wingdi.h:1611
         otmpFullName : Win32.PSTR;             --  wingdi.h:1612
      end record;

   subtype OUTLINETEXTMETRIC is OUTLINETEXTMETRICA;        --  wingdi.h:1620

   type POLYTEXTA is                                       --  wingdi.h:1629
      record
         x : Win32.INT;                             --  wingdi.h:1631
         y : Win32.INT;                             --  wingdi.h:1632
         n : Win32.UINT;                            --  wingdi.h:1633
         lpstr : Win32.LPCSTR;                          --  wingdi.h:1634
         uiFlags : Win32.UINT;                            --  wingdi.h:1635
         rcl : Win32.Windef.RECT;                     --  wingdi.h:1636
         pdx : Win32.PINT;                            --  wingdi.h:1637
      end record;

   type POLYTEXTW is                                       --  wingdi.h:1639
      record
         x : Win32.INT;                             --  wingdi.h:1641
         y : Win32.INT;                             --  wingdi.h:1642
         n : Win32.UINT;                            --  wingdi.h:1643
         lpstr : Win32.LPCWSTR;                         --  wingdi.h:1644
         uiFlags : Win32.UINT;                            --  wingdi.h:1645
         rcl : Win32.Windef.RECT;                     --  wingdi.h:1646
         pdx : Win32.PINT;                            --  wingdi.h:1647
      end record;

   subtype POLYTEXT is POLYTEXTA;                          --  wingdi.h:1655

   type FIXED is                                           --  wingdi.h:1661
      record
         fract : Win32.WORD;                              --  wingdi.h:1662
         value : Win32.SHORT;                             --  wingdi.h:1663
      end record;

   type MAT2 is                                            --  wingdi.h:1667
      record
         eM11 : FIXED;                                    --  wingdi.h:1668
         eM12 : FIXED;                                    --  wingdi.h:1669
         eM21 : FIXED;                                    --  wingdi.h:1670
         eM22 : FIXED;                                    --  wingdi.h:1671
      end record;

   type GLYPHMETRICS is                                    --  wingdi.h:1676
      record
         gmBlackBoxX : Win32.UINT;                    --  wingdi.h:1677
         gmBlackBoxY : Win32.UINT;                    --  wingdi.h:1678
         gmptGlyphOrigin : Win32.Windef.POINT;            --  wingdi.h:1679
         gmCellIncX : Win32.SHORT;                   --  wingdi.h:1680
         gmCellIncY : Win32.SHORT;                   --  wingdi.h:1681
      end record;

   type POINTFX is                                         --  wingdi.h:1696
      record
         x : FIXED;                                       --  wingdi.h:1698
         y : FIXED;                                       --  wingdi.h:1699
      end record;

   type POINTFX_Array is                                   --  wingdi.h:1706
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased POINTFX;

   type TTPOLYCURVE is                                     --  wingdi.h:1702
      record
         wType : Win32.WORD;                              --  wingdi.h:1704
         cpfx : Win32.WORD;                              --  wingdi.h:1705
         apfx : POINTFX_Array;                           --  wingdi.h:1706
      end record;

   type TTPOLYGONHEADER is                                 --  wingdi.h:1709
      record
         cb : Win32.DWORD;                          --  wingdi.h:1711
         dwType : Win32.DWORD;                          --  wingdi.h:1712
         pfxStart : POINTFX;                              --  wingdi.h:1713
      end record;

   type RASTERIZER_STATUS is                               --  wingdi.h:1718
      record
         nSize : Win32.SHORT;                       --  wingdi.h:1719
         wFlags : Win32.SHORT;                       --  wingdi.h:1720
         nLanguageID : Win32.SHORT;                       --  wingdi.h:1721
      end record;

   type PIXELFORMATDESCRIPTOR is                           --  wingdi.h:1729
      record
         nSize : Win32.WORD;                    --  wingdi.h:1731
         nVersion : Win32.WORD;                    --  wingdi.h:1732
         dwFlags : Win32.DWORD;                   --  wingdi.h:1733
         iPixelType : Win32.BYTE;                    --  wingdi.h:1734
         cColorBits : Win32.BYTE;                    --  wingdi.h:1735
         cRedBits : Win32.BYTE;                    --  wingdi.h:1736
         cRedShift : Win32.BYTE;                    --  wingdi.h:1737
         cGreenBits : Win32.BYTE;                    --  wingdi.h:1738
         cGreenShift : Win32.BYTE;                    --  wingdi.h:1739
         cBlueBits : Win32.BYTE;                    --  wingdi.h:1740
         cBlueShift : Win32.BYTE;                    --  wingdi.h:1741
         cAlphaBits : Win32.BYTE;                    --  wingdi.h:1742
         cAlphaShift : Win32.BYTE;                    --  wingdi.h:1743
         cAccumBits : Win32.BYTE;                    --  wingdi.h:1744
         cAccumRedBits : Win32.BYTE;                    --  wingdi.h:1745
         cAccumGreenBits : Win32.BYTE;                    --  wingdi.h:1746
         cAccumBlueBits : Win32.BYTE;                    --  wingdi.h:1747
         cAccumAlphaBits : Win32.BYTE;                    --  wingdi.h:1748
         cDepthBits : Win32.BYTE;                    --  wingdi.h:1749
         cStencilBits : Win32.BYTE;                    --  wingdi.h:1750
         cAuxBuffers : Win32.BYTE;                    --  wingdi.h:1751
         iLayerType : Win32.BYTE;                    --  wingdi.h:1752
         bReserved : Win32.BYTE;                    --  wingdi.h:1753
         dwLayerMask : Win32.DWORD;                   --  wingdi.h:1754
         dwVisibleMask : Win32.DWORD;                   --  wingdi.h:1755
         dwDamageMask : Win32.DWORD;                   --  wingdi.h:1756
      end record;

   type GOBJENUMPROC is access function (lpLogObject : Win32.LPVOID;
                                         lpData : Win32.LPARAM)
                                        return Win32.INT;
   pragma Convention (Stdcall, GOBJENUMPROC);
   --  wingdi.h:1789

   type LINEDDAPROC is access procedure (X : Win32.INT;
                                         Y : Win32.INT;
                                         lpData : Win32.LPARAM);
   pragma Convention (Stdcall, LINEDDAPROC);
   --  wingdi.h:1790

   type FONTENUMPROC is access function  return Win32.INT; --  wingdi.h:1797
   pragma Convention (Stdcall, FONTENUMPROC);

   type LPFNDEVMODE is access function (p1 : Win32.Windef.HWND;
                                        p2 : Win32.Windef.HMODULE;
                                        p3 : access DEVMODE;
                                        p4 : Win32.LPSTR;
                                        p5 : Win32.LPSTR;
                                        p6 : access DEVMODE;
                                        p7 : Win32.LPSTR;
                                        p8 : Win32.UINT)
                                       return Win32.UINT;
   pragma Convention (Stdcall, LPFNDEVMODE);
   --  wingdi.h:1900

   type LPFNDEVCAPS is access function (pDevice : Win32.LPSTR;
                                        pPort : Win32.LPSTR;
                                        fwCapability : Win32.UINT;
                                        pOutput : Win32.LPSTR;
                                        pDevMode : access DEVMODE)
                                       return Win32.DWORD;
   pragma Convention (Stdcall, LPFNDEVCAPS);
   --  wingdi.h:1902

   type MFENUMPROC is access function (hdc : Win32.Windef.HDC;
                                       lpht : access HANDLETABLE;
                                       lpmr : access METARECORD;
                                       cObj : Win32.INT;
                                       lParam : Win32.LPARAM)
                                      return Win32.INT;
   pragma Convention (Stdcall, MFENUMPROC);
   --  wingdi.h:2233

   type DIBSECTION is                                      --  wingdi.h:2298
      record
         dsBm : BITMAP;                            --  wingdi.h:2299
         dsBmih : BITMAPINFOHEADER;                  --  wingdi.h:2300
         dsBitfields : Win32.DWORD_Array (0 .. 2);           --  wingdi.h:2301
         dshSection : Win32.Winnt.HANDLE;                --  wingdi.h:2302
         dsOffset : Win32.DWORD;                       --  wingdi.h:2303
      end record;

   type COLORADJUSTMENT is                                 --  wingdi.h:2351
      record
         caSize : Win32.WORD;                  --  wingdi.h:2352
         caFlags : Win32.WORD;                  --  wingdi.h:2353
         caIlluminantIndex : Win32.WORD;                  --  wingdi.h:2354
         caRedGamma : Win32.WORD;                  --  wingdi.h:2355
         caGreenGamma : Win32.WORD;                  --  wingdi.h:2356
         caBlueGamma : Win32.WORD;                  --  wingdi.h:2357
         caReferenceBlack : Win32.WORD;                  --  wingdi.h:2358
         caReferenceWhite : Win32.WORD;                  --  wingdi.h:2359
         caContrast : Win32.SHORT;                 --  wingdi.h:2360
         caBrightness : Win32.SHORT;                 --  wingdi.h:2361
         caColorfulness : Win32.SHORT;                 --  wingdi.h:2362
         caRedGreenTint : Win32.SHORT;                 --  wingdi.h:2363
      end record;

   type ABORTPROC is access function (hdc : Win32.Windef.HDC;
                                      error : Win32.INT)
                                     return Win32.BOOL;
   pragma Convention (Stdcall, ABORTPROC);
   --  wingdi.h:2371

   type DOCINFOA is                                        --  wingdi.h:2376
      record
         cbSize : Win32.INT;                         --  wingdi.h:2377
         lpszDocName : Win32.LPCSTR;                      --  wingdi.h:2378
         lpszOutput : Win32.LPCSTR;                      --  wingdi.h:2379
      end record;

   type DOCINFOW is                                        --  wingdi.h:2381
      record
         cbSize : Win32.INT;                         --  wingdi.h:2382
         lpszDocName : Win32.LPCWSTR;                     --  wingdi.h:2383
         lpszOutput : Win32.LPCWSTR;                     --  wingdi.h:2384
      end record;

   subtype DOCINFO is DOCINFOA;                            --  wingdi.h:2390

   type KERNINGPAIR is                                     --  wingdi.h:2490
      record
         wFirst : Win32.WORD;                        --  wingdi.h:2491
         wSecond : Win32.WORD;                        --  wingdi.h:2492
         iKernAmount : Win32.INT;                         --  wingdi.h:2493
      end record;

   type EMR is                                             --  wingdi.h:2630
      record
         iType : Win32.DWORD;                             --  wingdi.h:2632
         nSize : Win32.DWORD;                             --  wingdi.h:2633
      end record;

   type EMRTEXT is                                         --  wingdi.h:2639
      record
         ptlReference : Win32.Windef.POINTL;              --  wingdi.h:2641
         nChars : Win32.DWORD;                      --  wingdi.h:2642
         offString : Win32.DWORD;                      --  wingdi.h:2643
         fOptions : Win32.DWORD;                      --  wingdi.h:2644
         rcl : Win32.Windef.RECTL;               --  wingdi.h:2645
         offDx : Win32.DWORD;                      --  wingdi.h:2646
      end record;

   type ABORTPATH is                                       --  wingdi.h:2652
      record
         emr : Win32.Wingdi.EMR;                          --  wingdi.h:2654
      end record;

   subtype EMRABORTPATH is ABORTPATH;                      --  wingdi.h:2655

   subtype EMRBEGINPATH is ABORTPATH;                      --  wingdi.h:2656

   subtype EMRENDPATH is ABORTPATH;                        --  wingdi.h:2657

   subtype EMRCLOSEFIGURE is ABORTPATH;                    --  wingdi.h:2658

   subtype EMRFLATTENPATH is ABORTPATH;                    --  wingdi.h:2659

   subtype EMRWIDENPATH is ABORTPATH;                      --  wingdi.h:2660

   subtype EMRSETMETARGN is ABORTPATH;                     --  wingdi.h:2661

   subtype EMRSAVEDC is ABORTPATH;                         --  wingdi.h:2662

   subtype EMRREALIZEPALETTE is ABORTPATH;                 --  wingdi.h:2663

   type EMRSELECTCLIPPATH is                               --  wingdi.h:2665
      record
         emr : Win32.Wingdi.EMR;                        --  wingdi.h:2667
         iMode : Win32.DWORD;                             --  wingdi.h:2668
      end record;

   subtype EMRSETBKMODE is EMRSELECTCLIPPATH;              --  wingdi.h:2670

   subtype EMRSETMAPMODE is EMRSELECTCLIPPATH;             --  wingdi.h:2671

   subtype EMRSETPOLYFILLMODE is EMRSELECTCLIPPATH;        --  wingdi.h:2672

   subtype EMRSETROP2 is EMRSELECTCLIPPATH;                --  wingdi.h:2673

   subtype EMRSETSTRETCHBLTMODE is EMRSELECTCLIPPATH;      --  wingdi.h:2674

   subtype EMRSETTEXTALIGN is EMRSELECTCLIPPATH;           --  wingdi.h:2675

   type EMRSETMITERLIMIT is                                --  wingdi.h:2677
      record
         emr : Win32.Wingdi.EMR;                  --  wingdi.h:2679
         eMiterLimit : Win32.FLOAT;                       --  wingdi.h:2680
      end record;

   type EMRRESTOREDC is                                    --  wingdi.h:2683
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2685
         iRelative : Win32.LONG;                          --  wingdi.h:2686
      end record;

   type EMRSETARCDIRECTION is                              --  wingdi.h:2689
      record
         emr : Win32.Wingdi.EMR;                --  wingdi.h:2691
         iArcDirection : Win32.DWORD;                     --  wingdi.h:2692
      end record;

   type EMRSETMAPPERFLAGS is                               --  wingdi.h:2696
      record
         emr : Win32.Wingdi.EMR;                      --  wingdi.h:2698
         dwFlags : Win32.DWORD;                           --  wingdi.h:2699
      end record;

   type EMRSETTEXTCOLOR is                                 --  wingdi.h:2702
      record
         emr : Win32.Wingdi.EMR;                      --  wingdi.h:2704
         crColor : Win32.Windef.COLORREF;                 --  wingdi.h:2705
      end record;

   subtype EMRSETBKCOLOR is EMRSETTEXTCOLOR;               --  wingdi.h:2706

   type EMRSELECTOBJECT is                                 --  wingdi.h:2709
      record
         emr : Win32.Wingdi.EMR;                     --  wingdi.h:2711
         ihObject : Win32.DWORD;                          --  wingdi.h:2712
      end record;

   subtype EMRDELETEOBJECT is EMRSELECTOBJECT;             --  wingdi.h:2714

   type EMRSELECTPALETTE is                                --  wingdi.h:2717
      record
         emr : Win32.Wingdi.EMR;                        --  wingdi.h:2719
         ihPal : Win32.DWORD;                             --  wingdi.h:2720
      end record;

   type EMRRESIZEPALETTE is                                --  wingdi.h:2723
      record
         emr : Win32.Wingdi.EMR;                     --  wingdi.h:2725
         ihPal : Win32.DWORD;                          --  wingdi.h:2726
         cEntries : Win32.DWORD;                          --  wingdi.h:2727
      end record;

   type EMRSETPALETTEENTRIES is                            --  wingdi.h:2730
      record
         emr : Win32.Wingdi.EMR;                  --  wingdi.h:2732
         ihPal : Win32.DWORD;                       --  wingdi.h:2733
         iStart : Win32.DWORD;                       --  wingdi.h:2734
         cEntries : Win32.DWORD;                       --  wingdi.h:2735
         aPalEntries : PALETTEENTRY_Array;                --  wingdi.h:2736
      end record;

   type EMRSETCOLORADJUSTMENT is                           --  wingdi.h:2739
      record
         emr : Win32.Wingdi.EMR;              --  wingdi.h:2741
         ColorAdjustment : Win32.Wingdi.COLORADJUSTMENT;  --  wingdi.h:2742
      end record;

   type EMRGDICOMMENT is                                   --  wingdi.h:2745
      record
         emr : Win32.Wingdi.EMR;                       --  wingdi.h:2747
         cbData : Win32.DWORD;                            --  wingdi.h:2748
         Data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2749
      end record;

   type EMREOF is                                          --  wingdi.h:2752
      record
         emr : Win32.Wingdi.EMR;                --  wingdi.h:2754
         nPalEntries : Win32.DWORD;                     --  wingdi.h:2755
         offPalEntries : Win32.DWORD;                     --  wingdi.h:2756
         nSizeLast : Win32.DWORD;                     --  wingdi.h:2757
      end record;

   type EMRLINETO is                                       --  wingdi.h:2762
      record
         emr : Win32.Wingdi.EMR;                          --  wingdi.h:2764
         ptl : Win32.Windef.POINTL;                       --  wingdi.h:2765
      end record;

   subtype EMRMOVETOEX is EMRLINETO;                       --  wingdi.h:2767

   type EMROFFSETCLIPRGN is                                --  wingdi.h:2769
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2771
         ptlOffset : Win32.Windef.POINTL;                 --  wingdi.h:2772
      end record;

   type EMRFILLPATH is                                     --  wingdi.h:2775
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2777
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2778
      end record;

   subtype EMRSTROKEANDFILLPATH is EMRFILLPATH;            --  wingdi.h:2780

   subtype EMRSTROKEPATH is EMRFILLPATH;                   --  wingdi.h:2781

   type EMREXCLUDECLIPRECT is                              --  wingdi.h:2783
      record
         emr : Win32.Wingdi.EMR;                      --  wingdi.h:2785
         rclClip : Win32.Windef.RECTL;                    --  wingdi.h:2786
      end record;

   subtype EMRINTERSECTCLIPRECT is EMREXCLUDECLIPRECT;     --  wingdi.h:2788

   type EMRSETVIEWPORTORGEX is                             --  wingdi.h:2790
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2792
         ptlOrigin : Win32.Windef.POINTL;                 --  wingdi.h:2793
      end record;

   subtype EMRSETWINDOWORGEX is EMRSETVIEWPORTORGEX;       --  wingdi.h:2795

   subtype EMRSETBRUSHORGEX is EMRSETVIEWPORTORGEX;        --  wingdi.h:2796

   type EMRSETVIEWPORTEXTEX is                             --  wingdi.h:2798
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2800
         szlExtent : Win32.Windef.SIZEL;                  --  wingdi.h:2801
      end record;

   subtype EMRSETWINDOWEXTEX is EMRSETVIEWPORTEXTEX;       --  wingdi.h:2803

   type EMRSCALEVIEWPORTEXTEX is                           --  wingdi.h:2805
      record
         emr : Win32.Wingdi.EMR;                       --  wingdi.h:2807
         xNum : Win32.LONG;                             --  wingdi.h:2808
         xDenom : Win32.LONG;                             --  wingdi.h:2809
         yNum : Win32.LONG;                             --  wingdi.h:2810
         yDenom : Win32.LONG;                             --  wingdi.h:2811
      end record;

   subtype EMRSCALEWINDOWEXTEX is EMRSCALEVIEWPORTEXTEX;   --  wingdi.h:2813

   type EMRSETWORLDTRANSFORM is                            --  wingdi.h:2815
      record
         emr : Win32.Wingdi.EMR;                        --  wingdi.h:2817
         xform : Win32.Wingdi.XFORM;                      --  wingdi.h:2818
      end record;

   type EMRMODIFYWORLDTRANSFORM is                         --  wingdi.h:2821
      record
         emr : Win32.Wingdi.EMR;                        --  wingdi.h:2823
         xform : Win32.Wingdi.XFORM;                      --  wingdi.h:2824
         iMode : Win32.DWORD;                             --  wingdi.h:2825
      end record;

   type EMRSETPIXELV is                                    --  wingdi.h:2828
      record
         emr : Win32.Wingdi.EMR;                     --  wingdi.h:2830
         ptlPixel : Win32.Windef.POINTL;                  --  wingdi.h:2831
         crColor : Win32.Windef.COLORREF;                --  wingdi.h:2832
      end record;

   type EMREXTFLOODFILL is                                 --  wingdi.h:2835
      record
         emr : Win32.Wingdi.EMR;                     --  wingdi.h:2837
         ptlStart : Win32.Windef.POINTL;                  --  wingdi.h:2838
         crColor : Win32.Windef.COLORREF;                --  wingdi.h:2839
         iMode : Win32.DWORD;                          --  wingdi.h:2840
      end record;

   type EMRELLIPSE is                                      --  wingdi.h:2843
      record
         emr : Win32.Wingdi.EMR;                       --  wingdi.h:2845
         rclBox : Win32.Windef.RECTL;                     --  wingdi.h:2846
      end record;

   subtype EMRRECTANGLE is EMRELLIPSE;                     --  wingdi.h:2848

   type EMRROUNDRECT is                                    --  wingdi.h:2850
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2852
         rclBox : Win32.Windef.RECTL;                  --  wingdi.h:2853
         szlCorner : Win32.Windef.SIZEL;                  --  wingdi.h:2854
      end record;

   type EMRARC is                                          --  wingdi.h:2857
      record
         emr : Win32.Wingdi.EMR;                     --  wingdi.h:2859
         rclBox : Win32.Windef.RECTL;                   --  wingdi.h:2860
         ptlStart : Win32.Windef.POINTL;                  --  wingdi.h:2861
         ptlEnd : Win32.Windef.POINTL;                  --  wingdi.h:2862
      end record;

   subtype EMRARCTO is EMRARC;                             --  wingdi.h:2864

   subtype EMRCHORD is EMRARC;                             --  wingdi.h:2865

   subtype EMRPIE is EMRARC;                               --  wingdi.h:2866

   type EMRANGLEARC is                                     --  wingdi.h:2868
      record
         emr : Win32.Wingdi.EMR;                  --  wingdi.h:2870
         ptlCenter : Win32.Windef.POINTL;               --  wingdi.h:2871
         nRadius : Win32.DWORD;                       --  wingdi.h:2872
         eStartAngle : Win32.FLOAT;                       --  wingdi.h:2873
         eSweepAngle : Win32.FLOAT;                       --  wingdi.h:2874
      end record;

   type POINTL_Array is                                    --  wingdi.h:2882
     array (Natural range <>) of Win32.Windef.POINTL;

   type EMRPOLYLINE is                                     --  wingdi.h:2877
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2879
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2880
         cptl : Win32.DWORD;                         --  wingdi.h:2881
         aptl : POINTL_Array (0 .. Win32.ANYSIZE_ARRAY); --  wingdi.h:2882
      end record;

   subtype EMRPOLYBEZIER is EMRPOLYLINE;                   --  wingdi.h:2884

   subtype EMRPOLYGON is EMRPOLYLINE;                      --  wingdi.h:2885

   subtype EMRPOLYBEZIERTO is EMRPOLYLINE;                 --  wingdi.h:2886

   subtype EMRPOLYLINETO is EMRPOLYLINE;                   --  wingdi.h:2887

   type POINTS_Array is                                    --  wingdi.h:2894
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased Win32.Windef.POINTS;

   type EMRPOLYLINE16 is                                   --  wingdi.h:2889
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2891
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2892
         cpts : Win32.DWORD;                         --  wingdi.h:2893
         apts : POINTS_Array;                        --  wingdi.h:2894
      end record;

   subtype EMRPOLYBEZIER16 is EMRPOLYLINE16;               --  wingdi.h:2896

   subtype EMRPOLYGON16 is EMRPOLYLINE16;                  --  wingdi.h:2897

   subtype EMRPOLYBEZIERTO16 is EMRPOLYLINE16;             --  wingdi.h:2898

   subtype EMRPOLYLINETO16 is EMRPOLYLINE16;               --  wingdi.h:2899

   type EMRPOLYDRAW is                                     --  wingdi.h:2901
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2903
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2904
         cptl : Win32.DWORD;                         --  wingdi.h:2905
         aptl : POINTL_Array (0 .. Win32.ANYSIZE_ARRAY); --  wingdi.h:2906
         abTypes : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2907
      end record;

   type EMRPOLYDRAW16 is                                   --  wingdi.h:2910
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2912
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2913
         cpts : Win32.DWORD;                         --  wingdi.h:2914
         apts : POINTS_Array;                        --  wingdi.h:2915
         abTypes : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2916
      end record;

   type EMRPOLYPOLYLINE is                                 --  wingdi.h:2919
      record
         emr : Win32.Wingdi.EMR;                  --  wingdi.h:2921
         rclBounds : Win32.Windef.RECTL;                --  wingdi.h:2922
         nPolys : Win32.DWORD;                       --  wingdi.h:2923
         cptl : Win32.DWORD;                       --  wingdi.h:2924
         aPolyCounts : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2925
         aptl : POINTL_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2926
      end record;

   subtype EMRPOLYPOLYGON is EMRPOLYPOLYLINE;              --  wingdi.h:2928

   type EMRPOLYPOLYLINE16 is                               --  wingdi.h:2930
      record
         emr : Win32.Wingdi.EMR;                  --  wingdi.h:2932
         rclBounds : Win32.Windef.RECTL;                --  wingdi.h:2933
         nPolys : Win32.DWORD;                       --  wingdi.h:2934
         cpts : Win32.DWORD;                       --  wingdi.h:2935
         aPolyCounts : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2936
         apts : POINTS_Array;                      --  wingdi.h:2937
      end record;

   subtype EMRPOLYPOLYGON16 is EMRPOLYPOLYLINE16;          --  wingdi.h:2939

   type EMRINVERTRGN is                                    --  wingdi.h:2941
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2943
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2944
         cbRgnData : Win32.DWORD;                         --  wingdi.h:2945
         RgnData : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2946
      end record;

   subtype EMRPAINTRGN is EMRINVERTRGN;                    --  wingdi.h:2948

   type EMRFILLRGN is                                      --  wingdi.h:2950
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2952
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2953
         cbRgnData : Win32.DWORD;                         --  wingdi.h:2954
         ihBrush : Win32.DWORD;                         --  wingdi.h:2955
         RgnData : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2956
      end record;

   type EMRFRAMERGN is                                     --  wingdi.h:2959
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2961
         rclBounds : Win32.Windef.RECTL;                  --  wingdi.h:2962
         cbRgnData : Win32.DWORD;                         --  wingdi.h:2963
         ihBrush : Win32.DWORD;                         --  wingdi.h:2964
         szlStroke : Win32.Windef.SIZEL;                  --  wingdi.h:2965
         RgnData : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2966
      end record;

   type EMREXTSELECTCLIPRGN is                             --  wingdi.h:2969
      record
         emr : Win32.Wingdi.EMR;                    --  wingdi.h:2971
         cbRgnData : Win32.DWORD;                         --  wingdi.h:2972
         iMode : Win32.DWORD;                         --  wingdi.h:2973
         RgnData : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  wingdi.h:2974
      end record;

   type EMREXTTEXTOUTA is                                  --  wingdi.h:2977
      record
         emr : Win32.Wingdi.EMR;                --  wingdi.h:2979
         rclBounds : Win32.Windef.RECTL;              --  wingdi.h:2980
         iGraphicsMode : Win32.DWORD;                     --  wingdi.h:2981
         exScale : Win32.FLOAT;                     --  wingdi.h:2982
         eyScale : Win32.FLOAT;                     --  wingdi.h:2983
         emrtext : Win32.Wingdi.EMRTEXT;            --  wingdi.h:2984
      end record;

   subtype EMREXTTEXTOUTW is EMREXTTEXTOUTA;               --  wingdi.h:2987

   type EMRTEXT_Array is                                   --  wingdi.h:2997
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased EMRTEXT;

   type EMRPOLYTEXTOUTA is                                 --  wingdi.h:2989
      record
         emr : Win32.Wingdi.EMR;                --  wingdi.h:2991
         rclBounds : Win32.Windef.RECTL;              --  wingdi.h:2992
         iGraphicsMode : Win32.DWORD;                     --  wingdi.h:2993
         exScale : Win32.FLOAT;                     --  wingdi.h:2994
         eyScale : Win32.FLOAT;                     --  wingdi.h:2995
         cStrings : Win32.LONG;                      --  wingdi.h:2996
         aemrtext : EMRTEXT_Array;                   --  wingdi.h:2997
      end record;

   subtype EMRPOLYTEXTOUTW is EMRPOLYTEXTOUTA;             --  wingdi.h:3000

   type EMRBITBLT is                                       --  wingdi.h:3002
      record
         emr : Win32.Wingdi.EMR;                 --  wingdi.h:3004
         rclBounds : Win32.Windef.RECTL;               --  wingdi.h:3005
         xDest : Win32.LONG;                       --  wingdi.h:3006
         yDest : Win32.LONG;                       --  wingdi.h:3007
         cxDest : Win32.LONG;                       --  wingdi.h:3008
         cyDest : Win32.LONG;                       --  wingdi.h:3009
         dwRop : Win32.DWORD;                      --  wingdi.h:3010
         xSrc : Win32.LONG;                       --  wingdi.h:3011
         ySrc : Win32.LONG;                       --  wingdi.h:3012
         xformSrc : XFORM;                            --  wingdi.h:3013
         crBkColorSrc : Win32.Windef.COLORREF;            --  wingdi.h:3014
         iUsageSrc : Win32.DWORD;                      --  wingdi.h:3015
         offBmiSrc : Win32.DWORD;                      --  wingdi.h:3017
         cbBmiSrc : Win32.DWORD;                      --  wingdi.h:3018
         offBitsSrc : Win32.DWORD;                      --  wingdi.h:3019
         cbBitsSrc : Win32.DWORD;                      --  wingdi.h:3020
      end record;

   type EMRSTRETCHBLT is                                   --  wingdi.h:3023
      record
         emr : Win32.Wingdi.EMR;                 --  wingdi.h:3025
         rclBounds : Win32.Windef.RECTL;               --  wingdi.h:3026
         xDest : Win32.LONG;                       --  wingdi.h:3027
         yDest : Win32.LONG;                       --  wingdi.h:3028
         cxDest : Win32.LONG;                       --  wingdi.h:3029
         cyDest : Win32.LONG;                       --  wingdi.h:3030
         dwRop : Win32.DWORD;                      --  wingdi.h:3031
         xSrc : Win32.LONG;                       --  wingdi.h:3032
         ySrc : Win32.LONG;                       --  wingdi.h:3033
         xformSrc : XFORM;                            --  wingdi.h:3034
         crBkColorSrc : Win32.Windef.COLORREF;            --  wingdi.h:3035
         iUsageSrc : Win32.DWORD;                      --  wingdi.h:3036
         offBmiSrc : Win32.DWORD;                      --  wingdi.h:3038
         cbBmiSrc : Win32.DWORD;                      --  wingdi.h:3039
         offBitsSrc : Win32.DWORD;                      --  wingdi.h:3040
         cbBitsSrc : Win32.DWORD;                      --  wingdi.h:3041
         cxSrc : Win32.LONG;                       --  wingdi.h:3042
         cySrc : Win32.LONG;                       --  wingdi.h:3043
      end record;

   type EMRMASKBLT is                                      --  wingdi.h:3046
      record
         emr : Win32.Wingdi.EMR;                 --  wingdi.h:3048
         rclBounds : Win32.Windef.RECTL;               --  wingdi.h:3049
         xDest : Win32.LONG;                       --  wingdi.h:3050
         yDest : Win32.LONG;                       --  wingdi.h:3051
         cxDest : Win32.LONG;                       --  wingdi.h:3052
         cyDest : Win32.LONG;                       --  wingdi.h:3053
         dwRop : Win32.DWORD;                      --  wingdi.h:3054
         xSrc : Win32.LONG;                       --  wingdi.h:3055
         ySrc : Win32.LONG;                       --  wingdi.h:3056
         xformSrc : XFORM;                            --  wingdi.h:3057
         crBkColorSrc : Win32.Windef.COLORREF;            --  wingdi.h:3058
         iUsageSrc : Win32.DWORD;                      --  wingdi.h:3059
         offBmiSrc : Win32.DWORD;                      --  wingdi.h:3061
         cbBmiSrc : Win32.DWORD;                      --  wingdi.h:3062
         offBitsSrc : Win32.DWORD;                      --  wingdi.h:3063
         cbBitsSrc : Win32.DWORD;                      --  wingdi.h:3064
         xMask : Win32.LONG;                       --  wingdi.h:3065
         yMask : Win32.LONG;                       --  wingdi.h:3066
         iUsageMask : Win32.DWORD;                      --  wingdi.h:3067
         offBmiMask : Win32.DWORD;                      --  wingdi.h:3068
         cbBmiMask : Win32.DWORD;                      --  wingdi.h:3069
         offBitsMask : Win32.DWORD;                      --  wingdi.h:3070
         cbBitsMask : Win32.DWORD;                      --  wingdi.h:3071
      end record;

   type EMRPLGBLT is                                       --  wingdi.h:3074
      record
         emr : Win32.Wingdi.EMR;                 --  wingdi.h:3076
         rclBounds : Win32.Windef.RECTL;               --  wingdi.h:3077
         aptlDest : POINTL_Array (0 .. 2);               --  wingdi.h:3078
         xSrc : Win32.LONG;                       --  wingdi.h:3079
         ySrc : Win32.LONG;                       --  wingdi.h:3080
         cxSrc : Win32.LONG;                       --  wingdi.h:3081
         cySrc : Win32.LONG;                       --  wingdi.h:3082
         xformSrc : XFORM;                            --  wingdi.h:3083
         crBkColorSrc : Win32.Windef.COLORREF;            --  wingdi.h:3084
         iUsageSrc : Win32.DWORD;                      --  wingdi.h:3085
         offBmiSrc : Win32.DWORD;                      --  wingdi.h:3087
         cbBmiSrc : Win32.DWORD;                      --  wingdi.h:3088
         offBitsSrc : Win32.DWORD;                      --  wingdi.h:3089
         cbBitsSrc : Win32.DWORD;                      --  wingdi.h:3090
         xMask : Win32.LONG;                       --  wingdi.h:3091
         yMask : Win32.LONG;                       --  wingdi.h:3092
         iUsageMask : Win32.DWORD;                      --  wingdi.h:3093
         offBmiMask : Win32.DWORD;                      --  wingdi.h:3094
         cbBmiMask : Win32.DWORD;                      --  wingdi.h:3095
         offBitsMask : Win32.DWORD;                      --  wingdi.h:3096
         cbBitsMask : Win32.DWORD;                      --  wingdi.h:3097
      end record;

   type EMRSETDIBITSTODEVICE is                            --  wingdi.h:3100
      record
         emr : Win32.Wingdi.EMR;                   --  wingdi.h:3102
         rclBounds : Win32.Windef.RECTL;                 --  wingdi.h:3103
         xDest : Win32.LONG;                         --  wingdi.h:3104
         yDest : Win32.LONG;                         --  wingdi.h:3105
         xSrc : Win32.LONG;                         --  wingdi.h:3106
         ySrc : Win32.LONG;                         --  wingdi.h:3107
         cxSrc : Win32.LONG;                         --  wingdi.h:3108
         cySrc : Win32.LONG;                         --  wingdi.h:3109
         offBmiSrc : Win32.DWORD;                        --  wingdi.h:3110
         cbBmiSrc : Win32.DWORD;                        --  wingdi.h:3111
         offBitsSrc : Win32.DWORD;                        --  wingdi.h:3112
         cbBitsSrc : Win32.DWORD;                        --  wingdi.h:3113
         iUsageSrc : Win32.DWORD;                        --  wingdi.h:3114
         iStartScan : Win32.DWORD;                        --  wingdi.h:3115
         cScans : Win32.DWORD;                        --  wingdi.h:3116
      end record;

   type EMRSTRETCHDIBITS is                                --  wingdi.h:3119
      record
         emr : Win32.Wingdi.EMR;                   --  wingdi.h:3121
         rclBounds : Win32.Windef.RECTL;                 --  wingdi.h:3122
         xDest : Win32.LONG;                         --  wingdi.h:3123
         yDest : Win32.LONG;                         --  wingdi.h:3124
         xSrc : Win32.LONG;                         --  wingdi.h:3125
         ySrc : Win32.LONG;                         --  wingdi.h:3126
         cxSrc : Win32.LONG;                         --  wingdi.h:3127
         cySrc : Win32.LONG;                         --  wingdi.h:3128
         offBmiSrc : Win32.DWORD;                        --  wingdi.h:3129
         cbBmiSrc : Win32.DWORD;                        --  wingdi.h:3130
         offBitsSrc : Win32.DWORD;                        --  wingdi.h:3131
         cbBitsSrc : Win32.DWORD;                        --  wingdi.h:3132
         iUsageSrc : Win32.DWORD;                        --  wingdi.h:3133
         dwRop : Win32.DWORD;                        --  wingdi.h:3134
         cxDest : Win32.LONG;                         --  wingdi.h:3135
         cyDest : Win32.LONG;                         --  wingdi.h:3136
      end record;

   type EMREXTCREATEFONTINDIRECTW is                       --  wingdi.h:3139
      record
         emr : Win32.Wingdi.EMR;                       --  wingdi.h:3141
         ihFont : Win32.DWORD;                            --  wingdi.h:3142
         elfw : EXTLOGFONTW;                            --  wingdi.h:3143
      end record;

   type EMRCREATEPALETTE is                                --  wingdi.h:3146
      record
         emr : Win32.Wingdi.EMR;                        --  wingdi.h:3148
         ihPal : Win32.DWORD;                             --  wingdi.h:3149
         lgpl : LOGPALETTE;                              --  wingdi.h:3150
      end record;

   type EMRCREATEPEN is                                    --  wingdi.h:3155
      record
         emr : Win32.Wingdi.EMR;                        --  wingdi.h:3157
         ihPen : Win32.DWORD;                             --  wingdi.h:3158
         lopn : LOGPEN;                                  --  wingdi.h:3159
      end record;

   type EMREXTCREATEPEN is                                 --  wingdi.h:3162
      record
         emr : Win32.Wingdi.EMR;                      --  wingdi.h:3164
         ihPen : Win32.DWORD;                           --  wingdi.h:3165
         offBmi : Win32.DWORD;                           --  wingdi.h:3166
         cbBmi : Win32.DWORD;                           --  wingdi.h:3167
         offBits : Win32.DWORD;                           --  wingdi.h:3170
         cbBits : Win32.DWORD;                           --  wingdi.h:3171
         elp : EXTLOGPEN;                             --  wingdi.h:3172
      end record;

   type EMRCREATEBRUSHINDIRECT is                          --  wingdi.h:3175
      record
         emr : Win32.Wingdi.EMR;                      --  wingdi.h:3177
         ihBrush : Win32.DWORD;                           --  wingdi.h:3178
         lb : LOGBRUSH;                              --  wingdi.h:3179
      end record;

   type EMRCREATEMONOBRUSH is                              --  wingdi.h:3183
      record
         emr : Win32.Wingdi.EMR;                      --  wingdi.h:3185
         ihBrush : Win32.DWORD;                           --  wingdi.h:3186
         iUsage : Win32.DWORD;                           --  wingdi.h:3187
         offBmi : Win32.DWORD;                           --  wingdi.h:3188
         cbBmi : Win32.DWORD;                           --  wingdi.h:3189
         offBits : Win32.DWORD;                           --  wingdi.h:3190
         cbBits : Win32.DWORD;                           --  wingdi.h:3191
      end record;

   type EMRCREATEDIBPATTERNBRUSHPT is                      --  wingdi.h:3194
      record
         emr : Win32.Wingdi.EMR;                      --  wingdi.h:3196
         ihBrush : Win32.DWORD;                           --  wingdi.h:3197
         iUsage : Win32.DWORD;                           --  wingdi.h:3198
         offBmi : Win32.DWORD;                           --  wingdi.h:3199
         cbBmi : Win32.DWORD;                           --  wingdi.h:3200
         offBits : Win32.DWORD;                           --  wingdi.h:3203
         cbBits : Win32.DWORD;                           --  wingdi.h:3204
      end record;

   type EMRFORMAT is                                       --  wingdi.h:3207
      record
         dSignature : Win32.DWORD;                        --  wingdi.h:3209
         nVersion : Win32.DWORD;                        --  wingdi.h:3210
         cbData : Win32.DWORD;                        --  wingdi.h:3211
         offData : Win32.DWORD;                        --  wingdi.h:3212
      end record;

   type ac_LOGFONT_t is access all LOGFONT;           --  wingdi.h:1785
   type ac_TEXTMETRIC_t is access all TEXTMETRIC;     --  wingdi.h:1785
   type ac_PALETTEENTRY_t is access all PALETTEENTRY; --  wingdi.h:1807
   type ac_PIXELFORMATDESCRIPTOR_t is access all PIXELFORMATDESCRIPTOR;
   --  wingdi.h:1812
   type ac_BITMAP_t is access all BITMAP;             --  wingdi.h:1823
   type ac_LOGBRUSH_t is access all LOGBRUSH;         --  wingdi.h:1824
   type ac_DEVMODEA_t is access all DEVMODEA;         --  wingdi.h:1828
   type ac_DEVMODEW_t is access all DEVMODEW;         --  wingdi.h:1829
   type ac_BITMAPINFOHEADER_t is access all BITMAPINFOHEADER;
   --  wingdi.h:1835
   type ac_BITMAPINFO_t is access all BITMAPINFO;     --  wingdi.h:1835
   type ac_RECT_t is access all Win32.Windef.RECT;    --  wingdi.h:1839
   type ac_LOGFONTW_t is access all LOGFONTW;         --  wingdi.h:1841
   type ac_LOGPALETTE_t is access all LOGPALETTE;     --  wingdi.h:1874
   type ac_LOGPEN_t is access all LOGPEN;             --  wingdi.h:1876
   type ac_POINT_t is access all Win32.Windef.POINT;  --  wingdi.h:1877
   type ac_XFORM_t is access all XFORM;               --  wingdi.h:1980
   type ac_RGNDATA_t is access all RGNDATA;           --  wingdi.h:1980
   type ac_MAT2_t is access all MAT2;                 --  wingdi.h:2040
   type ac_ENHMETARECORD_t is access all ENHMETARECORD;
   --  wingdi.h:2236
   type ac_METAFILEPICT_t is access all METAFILEPICT; --  wingdi.h:2279
   type ac_RGBQUAD_t is access all RGBQUAD;           --  wingdi.h:2314
   type ac_COLORADJUSTMENT_t is access all COLORADJUSTMENT;
   --  wingdi.h:2366
   type ac_DOCINFOA_t is access all DOCINFOA;         --  wingdi.h:2395
   type ac_DOCINFOW_t is access all DOCINFOW;         --  wingdi.h:2396
   type ac_POLYTEXTA_t is access all POLYTEXTA;       --  wingdi.h:2450
   type ac_POLYTEXTW_t is access all POLYTEXTW;       --  wingdi.h:2451

   type OLDFONTENUMPROC is access function (lplf : ac_LOGFONT_t;
                                            lptm : ac_TEXTMETRIC_t;
                                            dwType : Win32.DWORD;
                                            lpData : Win32.LPARAM)
                                           return Win32.INT;
   pragma Convention (Stdcall, OLDFONTENUMPROC);
   --  wingdi.h:1785
   type ENHMFENUMPROC is access function
     (hDC : Win32.Windef.HDC;
      lpHTable : access HANDLETABLE;
      lpMFR : ac_ENHMETARECORD_t;
      nObj : Win32.INT;
      lpClientData : Win32.LPARAM)
     return Win32.INT;                     --  wingdi.h:2236
   pragma Convention (Stdcall, ENHMFENUMPROC);

   function MAKEROP4 (fore, back : DWORD) return DWORD;      --  wingdi.h:79

   function MAKEPOINTS (dwValue : DWORD) return Win32.Windef.POINTS;
   --  wingdi.h:436

   function RGB (bRed, bGreen, bBlue : BYTE)                 --  wingdi.h:1034
                return Win32.Windef.COLORREF;

   function PALETTERGB (bRed, bGreen, bBlue : BYTE)          --  wingdi.h:1035
                       return Win32.Windef.COLORREF;

   function PALETTEINDEX (wPaletteIndex : WORD)              --  wingdi.h:1036
                         return Win32.Windef.COLORREF;

   function GetRValue (rgb : Win32.Windef.COLORREF) return BYTE;
   --  wingdi.h:1044

   function GetGValue (rgb : Win32.Windef.COLORREF) return BYTE;
   --  wingdi.h:1045

   function GetBValue (rgb : Win32.Windef.COLORREF) return BYTE;
   --  wingdi.h:1046

   function AddFontResourceA (lpszFilename : Win32.LPCSTR) return Win32.INT;
   --  wingdi.h:1799

   function AddFontResource (lpszFilename : Win32.LPCSTR) return Win32.INT
     renames AddFontResourceA;
   --  wingdi.h:1799

   function AddFontResourceW (lpszFilename : Win32.LPCWSTR) return Win32.INT;
   --  wingdi.h:1800

   function AnimatePalette (hpal : Win32.Windef.HPALETTE;
                            iStart : Win32.UINT;
                            cEntries : Win32.UINT;
                            lppe : ac_PALETTEENTRY_t)
                           return Win32.BOOL;    --  wingdi.h:1807

   function Arc (hdc : Win32.Windef.HDC;
                 nLeftRect : Win32.INT;
                 nTopRect : Win32.INT;
                 nRightRect : Win32.INT;
                 nBottomRect : Win32.INT;
                 nXStartArc : Win32.INT;
                 nYStartArc : Win32.INT;
                 nXEndArc : Win32.INT;
                 nYEndArc : Win32.INT)
                return Win32.BOOL;            --  wingdi.h:1808

   function BitBlt (hdcDest : Win32.Windef.HDC;
                    nXDest : Win32.INT;
                    nYDest : Win32.INT;
                    nWidth : Win32.INT;
                    nHeight : Win32.INT;
                    hdcSrc : Win32.Windef.HDC;
                    nXSrc : Win32.INT;
                    nYSrc : Win32.INT;
                    dwRop : Win32.DWORD)
                   return Win32.BOOL;                  --  wingdi.h:1809

   function CancelDC (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:1810

   function Chord (hdcDest : Win32.Windef.HDC;
                   nXDest : Win32.INT;
                   nYDest : Win32.INT;
                   nWidth : Win32.INT;
                   nHeight : Win32.INT;
                   hdcSrc : Win32.INT;
                   nXSrc : Win32.INT;
                   nYSrc : Win32.INT;
                   dwRop : Win32.INT)
                  return Win32.BOOL;                   --  wingdi.h:1811

   function ChoosePixelFormat (hdc : Win32.Windef.HDC;
                               ppfd : ac_PIXELFORMATDESCRIPTOR_t)
                              return Win32.INT;        --  wingdi.h:1812

   function CloseMetaFile (hdc : Win32.Windef.HDC)
                          return Win32.Windef.HMETAFILE;
   --  wingdi.h:1813

   function CombineRgn (hrgnDest : Win32.Windef.HRGN;
                        hrgnSrc1 : Win32.Windef.HRGN;
                        hrgnSrc2 : Win32.Windef.HRGN;
                        fCombineMode : Win32.INT)
                       return Win32.INT;               --  wingdi.h:1814

   function CopyMetaFileA (hmfSrc : Win32.Windef.HMETAFILE;
                           lpszFile : Win32.LPCSTR)
                          return Win32.Windef.HMETAFILE;
   --  wingdi.h:1815

   function CopyMetaFile (hmfSr : Win32.Windef.HMETAFILE;
                          lpszFile : Win32.LPCSTR)
                         return Win32.Windef.HMETAFILE
     renames CopyMetaFileA;        --  wingdi.h:1815

   function CopyMetaFileW (hmfSr : Win32.Windef.HMETAFILE;
                           lpszFile : Win32.LPCWSTR)
                          return Win32.Windef.HMETAFILE;
   --  wingdi.h:1816

   function CreateBitmap (nWidth : Win32.INT;
                          nHeight : Win32.INT;
                          cbPlanes : Win32.UINT;
                          cbBits : Win32.UINT;
                          lpvBits : Win32.PCVOID)
                         return Win32.Windef.HBITMAP;  --  wingdi.h:1822

   function CreateBitmapIndirect (lpbm : access BITMAP)
      return Win32.Windef.HBITMAP;                        --  wingdi.h:1823

   function CreateBrushIndirect (lplb : ac_LOGBRUSH_t)
      return Win32.Windef.HBRUSH;                         --  wingdi.h:1824

   function CreateCompatibleBitmap (hdc : Win32.Windef.HDC;
                                    nWidth : Win32.INT;
                                    nHeight : Win32.INT)
      return Win32.Windef.HBITMAP;
   --  wingdi.h:1825

   function CreateDiscardableBitmap (hdc : Win32.Windef.HDC;
                                     nWidth : Win32.INT;
                                     nHeight : Win32.INT)
      return Win32.Windef.HBITMAP;
   --  wingdi.h:1826

   function CreateCompatibleDC (hdc : Win32.Windef.HDC)
                               return Win32.Windef.HDC;
   --  wingdi.h:1827

   function CreateDCA (lpszDriver : Win32.LPCSTR;
                       lpszDevice : Win32.LPCSTR;
                       lpszOutput : Win32.LPCSTR;
                       lpvInitData : ac_DEVMODEA_t)
                      return Win32.Windef.HDC;         --  wingdi.h:1828

   function CreateDC (lpszDriver : Win32.LPCSTR;
                      lpszDevice : Win32.LPCSTR;
                      lpszOutput : Win32.LPCSTR;
                      lpvInitData : ac_DEVMODEA_t)
                     return Win32.Windef.HDC
     renames CreateDCA;                --  wingdi.h:1828

   function CreateDCW (lpszDriver : Win32.LPCWSTR;
                       lpszDevice : Win32.LPCWSTR;
                       lpszOutput : Win32.LPCWSTR;
                       lpvInitData : ac_DEVMODEW_t)
                      return Win32.Windef.HDC;         --  wingdi.h:1829

   function CreateDIBitmap (hdc : Win32.Windef.HDC;
                            lpbmih : ac_BITMAPINFOHEADER_t;
                            dwInit : Win32.DWORD;
                            lpvBits : Win32.PCVOID;
                            lpbmi : ac_BITMAPINFO_t;
                            fnColorUse : Win32.UINT)
                           return Win32.Windef.HBITMAP; --  wingdi.h:1835

   function CreateDIBPatternBrush (hglbDIBPacked : Win32.Windef.HGLOBAL;
                                   fnColorSpec : Win32.UINT)
                                  return Win32.Windef.HBRUSH;
   --  wingdi.h:1836

   function CreateDIBPatternBrushPt (lpPackedDIB : Win32.PCVOID;
                                     iUsage : Win32.UINT)
                                    return Win32.Windef.HBRUSH;
   --  wingdi.h:1837

   function CreateEllipticRgn (nLeftRect : Win32.INT;
                               nTopRect : Win32.INT;
                               nRightRect : Win32.INT;
                               nBottomRect : Win32.INT)
                              return Win32.Windef.HRGN;
   --  wingdi.h:1838

   function CreateEllipticRgnIndirect (lprc : ac_RECT_t)
      return Win32.Windef.HRGN;                           --  wingdi.h:1839

   function CreateFontIndirectA (lplf : ac_TEXTMETRIC_t)
      return Win32.Windef.HFONT;                          --  wingdi.h:1840

   function CreateFontIndirect (lplf : ac_TEXTMETRIC_t)
                               return Win32.Windef.HFONT
     renames CreateFontIndirectA;                        --  wingdi.h:1840

   function CreateFontIndirectW (lplf : access LOGFONTW)
      return Win32.Windef.HFONT;                          --  wingdi.h:1841

   function CreateFontA (nHeight : Win32.INT;
                         nWidth : Win32.INT;
                         nEscapement : Win32.INT;
                         nOrientation : Win32.INT;
                         fnWeight : Win32.INT;
                         fdwItalic : Win32.DWORD;
                         fdwUnderline : Win32.DWORD;
                         fdwStrikeOut : Win32.DWORD;
                         fdwCharSet : Win32.DWORD;
                         fdwOutputPrecision : Win32.DWORD;
                         fdwClipPrecision : Win32.DWORD;
                         fdwQuality : Win32.DWORD;
                         fdwPitchAndFamily : Win32.DWORD;
                         lpszFace : Win32.LPCSTR)
                        return Win32.Windef.HFONT;    --  wingdi.h:1847

   function CreateFont (nHeight : Win32.INT;
                        nWidth : Win32.INT;
                        nEscapement : Win32.INT;
                        nOrientation : Win32.INT;
                        fnWeight : Win32.INT;
                        fdwItalic : Win32.DWORD;
                        fdwUnderline : Win32.DWORD;
                        fdwStrikeOut : Win32.DWORD;
                        fdwCharSet : Win32.DWORD;
                        fdwOutputPrecision : Win32.DWORD;
                        fdwClipPrecision : Win32.DWORD;
                        fdwQuality : Win32.DWORD;
                        fdwPitchAndFamily : Win32.DWORD;
                        lpszFace : Win32.LPCSTR)
                       return Win32.Windef.HFONT
     renames CreateFontA;           --  wingdi.h:1847

   function CreateFontW (nHeight : Win32.INT;
                         nWidth : Win32.INT;
                         nEscapement : Win32.INT;
                         nOrientation : Win32.INT;
                         fnWeight : Win32.INT;
                         fdwItalic : Win32.DWORD;
                         fdwUnderline : Win32.DWORD;
                         fdwStrikeOut : Win32.DWORD;
                         fdwCharSet : Win32.DWORD;
                         fdwOutputPrecision : Win32.DWORD;
                         fdwClipPrecision : Win32.DWORD;
                         fdwQuality : Win32.DWORD;
                         fdwPitchAndFamily : Win32.DWORD;
                         lpszFace : Win32.LPCWSTR)
                        return Win32.Windef.HFONT;    --  wingdi.h:1850

   function CreateHatchBrush (fnStyle : Win32.INT;
                              clrref : Win32.Windef.COLORREF)
                             return Win32.Windef.HBRUSH;
   --  wingdi.h:1859

   function CreateICA (lpszDriver : Win32.LPCSTR;
                       lpszDevice : Win32.LPCSTR;
                       lpszOutput : Win32.LPCSTR;
                       lpvInitData : ac_DEVMODEA_t)
                      return Win32.Windef.HDC;         --  wingdi.h:1860

   function CreateIC (lpszDriver : Win32.LPCSTR;
                      lpszDevice : Win32.LPCSTR;
                      lpszOutput : Win32.LPCSTR;
                      lpvInitData : ac_DEVMODEA_t)
                     return Win32.Windef.HDC
     renames CreateICA;                --  wingdi.h:1860

   function CreateICW (lpszDriver : Win32.LPCWSTR;
                       lpszDevice : Win32.LPCWSTR;
                       lpszOutput : Win32.LPCWSTR;
                       lpvInitData : ac_DEVMODEW_t)
                      return Win32.Windef.HDC;         --  wingdi.h:1861

   function CreateMetaFileA (lpszFile : Win32.LPCSTR) return Win32.Windef.HDC;
   --  wingdi.h:1867

   function CreateMetaFile (lpszFile : Win32.LPCSTR) return Win32.Windef.HDC
     renames CreateMetaFileA;
   --  wingdi.h:1867

   function CreateMetaFileW (lpszFile : Win32.LPCWSTR) return Win32.Windef.HDC;
   --  wingdi.h:1868

   function CreatePalette (lplgpl : access LOGPALETTE)
      return Win32.Windef.HPALETTE;                       --  wingdi.h:1874

   function CreatePen (fnPenStyle : Win32.INT;
                       nWidth : Win32.INT;
                       clrref : Win32.Windef.COLORREF)
      return Win32.Windef.HPEN;        --  wingdi.h:1875

   function CreatePenIndirect (lplgpn : access LOGPEN)
      return Win32.Windef.HPEN;                           --  wingdi.h:1876

   function CreatePolyPolygonRgn (lppt : ac_POINT_t;
                                  lpPolyCounts : Win32.PCINT;
                                  nCount : Win32.INT;
                                  fnPolyFillMode : Win32.INT)
                                 return Win32.Windef.HRGN;
   --  wingdi.h:1877

   function CreatePatternBrush (hbmp : Win32.Windef.HBITMAP)
      return Win32.Windef.HBRUSH;                         --  wingdi.h:1878

   function CreateRectRgn (nLeftRect : Win32.INT;
                           nTopRect : Win32.INT;
                           nRightRect : Win32.INT;
                           nBottomRect : Win32.INT)
                          return Win32.Windef.HRGN;    --  wingdi.h:1879

   function CreateRectRgnIndirect (lprc : ac_RECT_t) return Win32.Windef.HRGN;
   --  wingdi.h:1880

   function CreateRoundRectRgn (nLeftRect : Win32.INT;
                                nTopRect : Win32.INT;
                                nRightRect : Win32.INT;
                                nBottomRect : Win32.INT;
                                nWidthEllipse : Win32.INT;
                                nHeightEllipse : Win32.INT)
                               return Win32.Windef.HRGN;
   --  wingdi.h:1881

   function CreateScalableFontResourceA (fdwHidden : Win32.DWORD;
                                         lpszFontRes : Win32.LPCSTR;
                                         lpszFontFile : Win32.LPCSTR;
                                         lpszCurrentPath : Win32.LPCSTR)
                                        return Win32.BOOL;
   --  wingdi.h:1882

   function CreateScalableFontResource (fdwHidden : Win32.DWORD;
                                        lpszFontRes : Win32.LPCSTR;
                                        lpszFontFile : Win32.LPCSTR;
                                        lpszCurrentPath : Win32.LPCSTR)
                                       return Win32.BOOL
     renames CreateScalableFontResourceA;
   --  wingdi.h:1882

   function CreateScalableFontResourceW (fdwHidden : Win32.DWORD;
                                         lpszFontRes : Win32.LPCWSTR;
                                         lpszFontFile : Win32.LPCWSTR;
                                         lpszCurrentPath : Win32.LPCWSTR)
                                        return Win32.BOOL;
   --  wingdi.h:1883

   function CreateSolidBrush (clrref : Win32.Windef.COLORREF)
      return Win32.Windef.HBRUSH;                         --  wingdi.h:1889

   function DeleteDC (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:1891

   function DeleteMetaFile (hmf : Win32.Windef.HMETAFILE) return Win32.BOOL;
   --  wingdi.h:1892

   function DeleteObject (hgdiobj : Win32.Windef.HGDIOBJ) return Win32.BOOL;
   --  wingdi.h:1893

   function DescribePixelFormat (hdc : Win32.Windef.HDC;
                                 iPixelFormat : Win32.INT;
                                 nBytes : Win32.UINT;
                                 ppfd : access PIXELFORMATDESCRIPTOR)
                                return Win32.INT;      --  wingdi.h:1894

   function DeviceCapabilitiesA (lpszDevice : Win32.LPCSTR;
                                 pPort : Win32.LPCSTR;
                                 fwCapability : Win32.WORD;
                                 pOutput : Win32.LPSTR;
                                 pDevMode : ac_DEVMODEA_t)
                                return Win32.INT;      --  wingdi.h:1940

   function DeviceCapabilities (lpszDevice : Win32.LPCSTR;
                                pPort : Win32.LPCSTR;
                                fwCapability : Win32.WORD;
                                pOutput : Win32.LPSTR;
                                pDevMode : ac_DEVMODEA_t)
                               return Win32.INT
     renames DeviceCapabilitiesA;
   --  wingdi.h:1940

   function DeviceCapabilitiesW (lpszDevice : Win32.LPCWSTR;
                                 pPort : Win32.LPCWSTR;
                                 fwCapability : Win32.WORD;
                                 pOutput : Win32.LPWSTR;
                                 pDevMode : ac_DEVMODEW_t)
                                return Win32.INT;      --  wingdi.h:1942

   function DrawEscape (hdc : Win32.Windef.HDC;
                        nEscape : Win32.INT;
                        cbInput : Win32.INT;
                        lpszInDate : Win32.LPCSTR)
                       return Win32.INT;               --  wingdi.h:1950

   function Ellipse (hdc : Win32.Windef.HDC;
                     nLeftRect : Win32.INT;
                     nTopRect : Win32.INT;
                     nRightRect : Win32.INT;
                     nBottomRect : Win32.INT)
                    return Win32.BOOL;                 --  wingdi.h:1951

   function EnumFontFamiliesA (hdc : Win32.Windef.HDC;
                               lpszFamily : Win32.LPCSTR;
                               fntenmprc : FONTENUMPROC;
                               lParam : Win32.LPARAM)
                              return Win32.INT;        --  wingdi.h:1954

   function EnumFontFamilies (hdc : Win32.Windef.HDC;
                              lpszFamily : Win32.LPCSTR;
                              fntenmprc : FONTENUMPROC;
                              lParam : Win32.LPARAM)
                             return Win32.INT
     renames EnumFontFamiliesA; --  wingdi.h:1954

   function EnumFontFamiliesW (hdc : Win32.Windef.HDC;
                               lpszFamily : Win32.LPCWSTR;
                               fntenmprc : FONTENUMPROC;
                               lParam : Win32.LPARAM)
                              return Win32.INT;        --  wingdi.h:1955

   function EnumFontsA (hdc : Win32.Windef.HDC;
                        lpszFace : Win32.LPCSTR;
                        fntenmprc : FONTENUMPROC;
                        lParam : Win32.LPARAM)
                       return Win32.INT;               --  wingdi.h:1961

   function EnumFonts (hdc : Win32.Windef.HDC;
                       lpszFace : Win32.LPCSTR;
                       fntenmprc : FONTENUMPROC;
                       lParam : Win32.LPARAM)
                      return Win32.INT
     renames EnumFontsA;              --  wingdi.h:1961

   function EnumFontsW (hdc : Win32.Windef.HDC;
                        lpszFace : Win32.LPCWSTR;
                        fntenmprc : FONTENUMPROC;
                        lParam : Win32.LPARAM)
                       return Win32.INT;               --  wingdi.h:1962

   function EnumObjects (hdc : Win32.Windef.HDC;
                         fnObjectType : Win32.INT;
                         goenmprc : GOBJENUMPROC;
                         lParam : Win32.LPARAM)
                        return Win32.INT;              --  wingdi.h:1970

   function EqualRgn (hrgnSrc1 : Win32.Windef.HRGN;
                      hrgnSrc2 : Win32.Windef.HRGN)
                     return Win32.BOOL;                --  wingdi.h:1976

   function Escape (hdc : Win32.Windef.HDC;
                    nEscape : Win32.INT;
                    cbInput : Win32.INT;
                    lpszInData : Win32.LPCSTR;
                    lpvOutData : Win32.LPVOID)
                   return Win32.INT;                   --  wingdi.h:1977

   function ExtEscape (hdc : Win32.Windef.HDC;
                       nEscape : Win32.INT;
                       cbInput : Win32.INT;
                       lpszInData : Win32.LPCSTR;
                       cbOutput : Win32.INT;
                       lpszOutput : Win32.LPSTR)
                      return Win32.INT;                --  wingdi.h:1978

   function ExcludeClipRect (hdc : Win32.Windef.HDC;
                             nLeftRect : Win32.INT;
                             nTopRect : Win32.INT;
                             nRightRect : Win32.INT;
                             nBottomRect : Win32.INT)
                            return Win32.INT;          --  wingdi.h:1979

   function ExtCreateRegion (lpXform : access XFORM;
                             nCount : Win32.DWORD;
                             lpRgnData : access RGNDATA)
                            return Win32.Windef.HRGN;  --  wingdi.h:1980

   function ExtFloodFill (hdc : Win32.Windef.HDC;
                          nXStart : Win32.INT;
                          nYStart : Win32.INT;
                          clrref : Win32.Windef.COLORREF;
                          fuFillType : Win32.UINT)
                         return Win32.BOOL;            --  wingdi.h:1981

   function FillRgn (hdc : Win32.Windef.HDC;
                     hrgn : Win32.Windef.HRGN;
                     hbr : Win32.Windef.HBRUSH)
                    return Win32.BOOL;                 --  wingdi.h:1982

   function FloodFill (hdc : Win32.Windef.HDC;
                       nXStart : Win32.INT;
                       nYStart : Win32.INT;
                       clrref : Win32.Windef.COLORREF)
                      return Win32.BOOL;               --  wingdi.h:1983

   function FrameRgn (hdc : Win32.Windef.HDC;
                      hrgn : Win32.Windef.HRGN;
                      hbr : Win32.Windef.HBRUSH;
                      nWidth : Win32.INT;
                      nHeight : Win32.INT)
                     return Win32.BOOL;                    --  wingdi.h:1984

   function GetROP2 (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:1985

   function GetAspectRatioFilterEx (hdc : Win32.Windef.HDC;
                                    lpAspectRatio : Win32.Windef.LPSIZE)
                                   return Win32.BOOL;      --  wingdi.h:1986

   function GetBkColor (hdc : Win32.Windef.HDC) return Win32.Windef.COLORREF;
   --  wingdi.h:1987

   function GetBkMode (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:1988

   function GetBitmapBits (hbm : Win32.Windef.HBITMAP;
                           cbBuffer : Win32.LONG;
                           lpvBits : Win32.LPVOID)
                          return Win32.LONG;           --  wingdi.h:1989

   function GetBitmapDimensionEx (hBitmap : Win32.Windef.HBITMAP;
                                  lpDimension : Win32.Windef.LPSIZE)
                                 return Win32.BOOL;    --  wingdi.h:1990

   function GetBoundsRect (hdc : Win32.Windef.HDC;
                           lprcBounds : access Win32.Windef.RECT;
                           flags : Win32.UINT)
                          return Win32.UINT;           --  wingdi.h:1991

   function GetBrushOrgEx (hdc : Win32.Windef.HDC;
                           lpPoint : access Win32.Windef.POINT)
                          return Win32.BOOL;           --  wingdi.h:1993

   function GetCharWidthA (hdc : Win32.Windef.HDC;
                           iFirstChar : Win32.UINT;
                           iLastChar : Win32.UINT;
                           lpnWidths : access Win32.INT)
                          return Win32.BOOL;           --  wingdi.h:1995

   function GetCharWidth (hdc : Win32.Windef.HDC;
                          iFirstChar : Win32.UINT;
                          iLastChar : Win32.UINT;
                          lpnWidths : access Win32.INT)
                         return Win32.BOOL
     renames GetCharWidthA;        --  wingdi.h:1995

   function GetCharWidthW (hdc : Win32.Windef.HDC;
                           iFirstChar : Win32.UINT;
                           iLastChar : Win32.UINT;
                           lpnWidths : access Win32.INT)
                          return Win32.BOOL;           --  wingdi.h:1996

   function GetCharWidth32A (hdc : Win32.Windef.HDC;
                             iFirstChar : Win32.UINT;
                             iLastChar : Win32.UINT;
                             lpBuffer : access Win32.INT)
                            return Win32.BOOL;         --  wingdi.h:2002

   function GetCharWidth32 (hdc : Win32.Windef.HDC;
                            iFirstChar : Win32.UINT;
                            iLastChar : Win32.UINT;
                            lpBuffer : access Win32.INT)
                           return Win32.BOOL
     renames GetCharWidth32A;    --  wingdi.h:2002

   function GetCharWidth32W (hdc : Win32.Windef.HDC;
                             iFirstChar : Win32.UINT;
                             iLastChar : Win32.UINT;
                             lpBuffer : access Win32.INT)
                            return Win32.BOOL;         --  wingdi.h:2003

   function GetCharWidthFloatA (hdc : Win32.Windef.HDC;
                                iFirstChar : Win32.UINT;
                                iLastChar : Win32.UINT;
                                pxBuffer : Win32.PFLOAT)
                               return Win32.BOOL;      --  wingdi.h:2009

   function GetCharWidthFloat (hdc : Win32.Windef.HDC;
                               iFirstChar : Win32.UINT;
                               iLastChar : Win32.UINT;
                               pxBuffer : Win32.PFLOAT)
                              return Win32.BOOL
     renames GetCharWidthFloatA;
   --  wingdi.h:2009

   function GetCharWidthFloatW (hdc : Win32.Windef.HDC;
                                iFirstChar : Win32.UINT;
                                iLastChar : Win32.UINT;
                                pxBuffer : Win32.PFLOAT)
                               return Win32.BOOL;      --  wingdi.h:2010

   function GetCharABCWidthsA (hdc : Win32.Windef.HDC;
                               uFirstChar : Win32.UINT;
                               uLastChar : Win32.UINT;
                               lpABCF : access ABC)
                              return Win32.BOOL;       --  wingdi.h:2017

   function GetCharABCWidths (hdc : Win32.Windef.HDC;
                              uFirstChar : Win32.UINT;
                              uLastChar : Win32.UINT;
                              lpABC : access ABC)
                             return Win32.BOOL
     renames GetCharABCWidthsA; --  wingdi.h:2017

   function GetCharABCWidthsW (hdc : Win32.Windef.HDC;
                               uFirstChar : Win32.UINT;
                               uLastChar : Win32.UINT;
                               lpABC : access ABC)
                              return Win32.BOOL;       --  wingdi.h:2018

   function GetCharABCWidthsFloatA (hdc : Win32.Windef.HDC;
                                    iFirstChar : Win32.UINT;
                                    iLastChar : Win32.UINT;
                                    lpABCF : access ABCFLOAT)
                                   return Win32.BOOL;  --  wingdi.h:2024

   function GetCharABCWidthsFloat (hdc : Win32.Windef.HDC;
                                   iFirstChar : Win32.UINT;
                                   iLastChar : Win32.UINT;
                                   lpABCF : access ABCFLOAT)
                                  return Win32.BOOL
     renames GetCharABCWidthsFloatA;
   --  wingdi.h:2024

   function GetCharABCWidthsFloatW (hdc : Win32.Windef.HDC;
                                    iFirstChar : Win32.UINT;
                                    iLastChar : Win32.UINT;
                                    lpABCF : access ABCFLOAT)
                                   return Win32.BOOL;  --  wingdi.h:2025

   function GetClipBox (hdc : Win32.Windef.HDC;
                        lprc : access Win32.Windef.RECT)
                       return Win32.INT;               --  wingdi.h:2032

   function GetClipRgn (hdc : Win32.Windef.HDC;
                        hrgn : Win32.Windef.HRGN)
                       return Win32.INT;               --  wingdi.h:2033

   function GetMetaRgn (hdc : Win32.Windef.HDC;
                        hrgn : Win32.Windef.HRGN)
                       return Win32.INT;               --  wingdi.h:2034

   function GetCurrentObject (hdc : Win32.Windef.HDC;
                              uObjectType : Win32.UINT)
                             return Win32.Windef.HGDIOBJ;
   --  wingdi.h:2035

   function GetCurrentPositionEx (hdc : Win32.Windef.HDC;
                                  lpPoint : access Win32.Windef.POINT)
                                 return Win32.BOOL;    --  wingdi.h:2036

   function GetDeviceCaps (hdc : Win32.Windef.HDC;
                           iCapability : Win32.INT)
                          return Win32.INT;            --  wingdi.h:2037

   function GetDIBits (hdc : Win32.Windef.HDC;
                       hbmp : Win32.Windef.HBITMAP;
                       nStartScan : Win32.UINT;
                       cScanLines : Win32.UINT;
                       lpvBits : Win32.LPVOID;
                       lpbmi : access BITMAPINFO;
                       fuColorUse : Win32.UINT)
                      return Win32.INT;                --  wingdi.h:2038

   function GetFontData (hdc : Win32.Windef.HDC;
                         dwTable : Win32.DWORD;
                         dwOffset : Win32.DWORD;
                         lpvBuffer : Win32.LPVOID;
                         cbData : Win32.DWORD)
                        return Win32.DWORD;            --  wingdi.h:2039

   function GetGlyphOutlineA (hdc : Win32.Windef.HDC;
                              uChar : Win32.UINT;
                              fuFormat : Win32.UINT;
                              lpgm : access GLYPHMETRICS;
                              cbBuffer : Win32.DWORD;
                              lpBuffer : Win32.LPVOID;
                              lpmat2 : access MAT2)
                             return Win32.DWORD;       --  wingdi.h:2040

   function GetGlyphOutline (hdc : Win32.Windef.HDC;
                             uChar : Win32.UINT;
                             fuFormat : Win32.UINT;
                             lpgm : access GLYPHMETRICS;
                             cbBuffer : Win32.DWORD;
                             lpBuffer : Win32.LPVOID;
                             lpmat2 : access MAT2)
                            return Win32.DWORD
     renames GetGlyphOutlineA;  --  wingdi.h:2040

   function GetGlyphOutlineW (hdc : Win32.Windef.HDC;
                              uChar : Win32.UINT;
                              fuFormat : Win32.UINT;
                              lpgm : access GLYPHMETRICS;
                              cbBuffer : Win32.DWORD;
                              lpBuffer : Win32.LPVOID;
                              lpmat2 : access MAT2)
                             return Win32.DWORD;       --  wingdi.h:2041

   function GetGraphicsMode (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2047

   function GetMapMode (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2048

   function GetMetaFileBitsEx (hmf : Win32.Windef.HMETAFILE;
                               nSize : Win32.UINT;
                               lpvData : Win32.LPVOID)
                              return Win32.UINT;       --  wingdi.h:2049

   function GetMetaFileA (lpszFile : Win32.LPCSTR)
                         return Win32.Windef.HMETAFILE;
   --  wingdi.h:2050

   function GetMetaFile (lpszFile : Win32.LPCSTR) return Win32.Windef.HMETAFILE
     renames GetMetaFileA;
   --  wingdi.h:2050

   function GetMetaFileW (lpszFile : Win32.LPCWSTR)
      return Win32.Windef.HMETAFILE;              --  wingdi.h:2051

   function GetNearestColor (hdc : Win32.Windef.HDC;
                             clrref : Win32.Windef.COLORREF)
                            return Win32.Windef.COLORREF;
   --  wingdi.h:2057

   function GetNearestPaletteIndex (hpal : Win32.Windef.HPALETTE;
                                    clrref : Win32.Windef.COLORREF)
                                   return Win32.UINT;  --  wingdi.h:2058

   function GetObjectType (h : Win32.Windef.HGDIOBJ) return Win32.DWORD;
   --  wingdi.h:2059

   function GetOutlineTextMetricsA (hdc : Win32.Windef.HDC;
                                    cbData : Win32.UINT;
                                    lpotm : access OUTLINETEXTMETRICA)
                                   return Win32.UINT;  --  wingdi.h:2063

   function GetOutlineTextMetrics (hdc : Win32.Windef.HDC;
                                   cbData : Win32.UINT;
                                   lpotm : access OUTLINETEXTMETRICA)
                                  return Win32.UINT
     renames GetOutlineTextMetricsA;
   --  wingdi.h:2063

   function GetOutlineTextMetricsW (hdc : Win32.Windef.HDC;
                                    cbData : Win32.UINT;
                                    lpotm : access OUTLINETEXTMETRICW)
                                   return Win32.UINT;  --  wingdi.h:2064

   function GetPaletteEntries (hpal : Win32.Windef.HPALETTE;
                               iStart : Win32.UINT;
                               cEntries : Win32.UINT;
                               lppe : access PALETTEENTRY)
                              return Win32.UINT;       --  wingdi.h:2073

   function GetPixel (hdc : Win32.Windef.HDC;
                      nXPos : Win32.INT;
                      nYPos : Win32.INT)
                     return Win32.Windef.COLORREF;     --  wingdi.h:2074

   function GetPixelFormat (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2075

   function GetPolyFillMode (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2076

   function GetRasterizerCaps (lpraststat : access RASTERIZER_STATUS;
                               cb : Win32.UINT)
                              return Win32.BOOL;       --  wingdi.h:2077

   function GetRegionData (hrgn : Win32.Windef.HRGN;
                           dwCount : Win32.DWORD;
                           lpRgnData : access RGNDATA)
                          return Win32.DWORD;          --  wingdi.h:2078

   function GetRgnBox (hrgn : Win32.Windef.HRGN;
                       lprc : access Win32.Windef.RECT)
                      return Win32.INT;                --  wingdi.h:2079

   function GetStockObject (fnObject : Win32.INT) return Win32.Windef.HGDIOBJ;
   --  wingdi.h:2080

   function GetStretchBltMode (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2081

   function GetSystemPaletteEntries (hdc : Win32.Windef.HDC;
                                     iStart : Win32.UINT;
                                     cEntries : Win32.UINT;
                                     lppe : access PALETTEENTRY)
                                    return Win32.UINT; --  wingdi.h:2082

   function GetSystemPaletteUse (hdc : Win32.Windef.HDC) return Win32.UINT;
   --  wingdi.h:2083

   function GetTextCharacterExtra (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2084

   function GetTextAlign (hdc : Win32.Windef.HDC) return Win32.UINT;
   --  wingdi.h:2085

   function GetTextColor (hdc : Win32.Windef.HDC) return Win32.Windef.COLORREF;
   --  wingdi.h:2086

   function GetTextExtentPointA (hdc : Win32.Windef.HDC;
                                 lpString : Win32.LPCSTR;
                                 cbString : Win32.INT;
                                 lpSize : Win32.Windef.LPSIZE)
                                return Win32.BOOL;     --  wingdi.h:2088

   function GetTextExtentPoint (hdc : Win32.Windef.HDC;
                                lpString : Win32.LPCSTR;
                                cbString : Win32.INT;
                                lpSize : Win32.Windef.LPSIZE)
                               return Win32.BOOL
     renames GetTextExtentPointA;
   --  wingdi.h:2088

   function GetTextExtentPointW (hdc : Win32.Windef.HDC;
                                 lpString : Win32.LPCWSTR;
                                 cbString : Win32.INT;
                                 lpSize : Win32.Windef.LPSIZE)
                                return Win32.BOOL;     --  wingdi.h:2094

   function GetTextExtentPoint32A (hdc : Win32.Windef.HDC;
                                   lpString : Win32.LPCSTR;
                                   cbString : Win32.INT;
                                   lpSize : Win32.Windef.LPSIZE)
                                  return Win32.BOOL;   --  wingdi.h:2106

   function GetTextExtentPoint32 (hdc : Win32.Windef.HDC;
                                  lpString : Win32.LPCSTR;
                                  cbString : Win32.INT;
                                  lpSize : Win32.Windef.LPSIZE)
                                 return Win32.BOOL
     renames GetTextExtentPoint32A;
   --  wingdi.h:2106

   function GetTextExtentPoint32W (hdc : Win32.Windef.HDC;
                                   lpString : Win32.LPCWSTR;
                                   cbString : Win32.INT;
                                   lpSize : Win32.Windef.LPSIZE)
                                  return Win32.BOOL;   --  wingdi.h:2112

   function GetTextExtentExPointA (hdc : Win32.Windef.HDC;
                                   lpszStr : Win32.LPCSTR;
                                   cchString : Win32.INT;
                                   nMaxExtent : Win32.INT;
                                   lpnFit : access Win32.INT;
                                   alpDx : Win32.LPINT;
                                   lpSize : Win32.Windef.LPSIZE)
                                  return Win32.BOOL;   --  wingdi.h:2124

   function GetTextExtentExPoint (hdc : Win32.Windef.HDC;
                                  lpszStr : Win32.LPCSTR;
                                  cchString : Win32.INT;
                                  nMaxExtent : Win32.INT;
                                  lpnFit : access Win32.INT;
                                  alpDx : Win32.LPINT;
                                  lpSize : Win32.Windef.LPSIZE)
                                 return Win32.BOOL
     renames GetTextExtentExPointA;
   --  wingdi.h:2124

   function GetTextExtentExPointW (hdc : Win32.Windef.HDC;
                                   lpszStr : Win32.LPCWSTR;
                                   cchString : Win32.INT;
                                   nMaxExtent : Win32.INT;
                                   lpnFit : access Win32.INT;
                                   alpDx : Win32.LPINT;
                                   lpSize : Win32.Windef.LPSIZE)
                                  return Win32.BOOL;   --  wingdi.h:2133

   function GetViewportExtEx (hdc : Win32.Windef.HDC;
                              lpSize : Win32.Windef.LPSIZE)
                             return Win32.BOOL;        --  wingdi.h:2149

   function GetViewportOrgEx (hdc : Win32.Windef.HDC;
                              lpPoint : access Win32.Windef.POINT)
                             return Win32.BOOL;        --  wingdi.h:2150

   function GetWindowExtEx (hdc : Win32.Windef.HDC;
                            lpSize : Win32.Windef.LPSIZE)
                           return Win32.BOOL;          --  wingdi.h:2151

   function GetWindowOrgEx (hdc : Win32.Windef.HDC;
                            lpPoint : access Win32.Windef.POINT)
                           return Win32.BOOL;          --  wingdi.h:2152

   function IntersectClipRect (hdc : Win32.Windef.HDC;
                               nLeftRect : Win32.INT;
                               nTopRect : Win32.INT;
                               nRightRect : Win32.INT;
                               nBottomRect : Win32.INT)
                              return Win32.INT;        --  wingdi.h:2154

   function InvertRgn (hdc : Win32.Windef.HDC;
                       hrgn : Win32.Windef.HRGN)
                      return Win32.BOOL;               --  wingdi.h:2155

   function LineDDA (nXStart : Win32.INT;
                     nYStart : Win32.INT;
                     nXEnd : Win32.INT;
                     nYEnd : Win32.INT;
                     lnddaprc : LINEDDAPROC;
                     lParam : Win32.LPARAM)
                    return Win32.BOOL;                 --  wingdi.h:2156

   function LineTo (hdc : Win32.Windef.HDC;
                    xEnd : Win32.INT;
                    yEnd : Win32.INT)
                   return Win32.BOOL;                  --  wingdi.h:2157

   function MaskBlt (hdcDest : Win32.Windef.HDC;
                     nXDest : Win32.INT;
                     nYDest : Win32.INT;
                     nWidth : Win32.INT;
                     nHeight : Win32.INT;
                     hdcSrc : Win32.Windef.HDC;
                     nXSrc : Win32.INT;
                     nYSrc : Win32.INT;
                     hbmMask : Win32.Windef.HBITMAP;
                     xMask : Win32.INT;
                     yMask : Win32.INT;
                     dwRop : Win32.DWORD)
                    return Win32.BOOL;                --  wingdi.h:2158

   function PlgBlt (hdcDest : Win32.Windef.HDC;
                    lpPoint : ac_POINT_t;
                    hdcSrc : Win32.Windef.HDC;
                    nXSrc : Win32.INT;
                    nYSrc : Win32.INT;
                    nWidth : Win32.INT;
                    nHeight : Win32.INT;
                    hbmMask : Win32.Windef.HBITMAP;
                    xMask : Win32.INT;
                    yMask : Win32.INT)
                   return Win32.BOOL;                 --  wingdi.h:2160

   function OffsetClipRgn (hdc : Win32.Windef.HDC;
                           nXOffset : Win32.INT;
                           nYOffset : Win32.INT)
                          return Win32.INT;            --  wingdi.h:2163

   function OffsetRgn (hdc : Win32.Windef.HRGN;
                       nXOffset : Win32.INT;
                       nYOffset : Win32.INT)
                      return Win32.INT;                --  wingdi.h:2164

   function PatBlt (hdc : Win32.Windef.HDC;
                    nLeftRect : Win32.INT;
                    nTopRect : Win32.INT;
                    nwidth : Win32.INT;
                    nheight : Win32.INT;
                    fdwRop : Win32.DWORD)
                   return Win32.BOOL;                  --  wingdi.h:2165

   function Pie (hdc : Win32.Windef.HDC;
                 nLeftRect : Win32.INT;
                 nTopRect : Win32.INT;
                 nRightRect : Win32.INT;
                 nBottomRect : Win32.INT;
                 nxStartArc : Win32.INT;
                 nyStartArc : Win32.INT;
                 nxEndArc : Win32.INT;
                 nyEndArc : Win32.INT)
                return Win32.BOOL;                     --  wingdi.h:2166

   function PlayMetaFile (hdc : Win32.Windef.HDC;
                          hmf : Win32.Windef.HMETAFILE)
                         return Win32.BOOL;            --  wingdi.h:2167

   function PaintRgn (hdc : Win32.Windef.HDC;
                      hrgn : Win32.Windef.HRGN)
                     return Win32.BOOL;                --  wingdi.h:2168

   function PolyPolygon (hdc : Win32.Windef.HDC;
                         lpPoints : ac_POINT_t;
                         lpPolyCounts : Win32.PCINT;
                         nCount : Win32.INT)
                        return Win32.BOOL;             --  wingdi.h:2169

   function PtInRegion (hrgn : Win32.Windef.HRGN;
                        nXPos : Win32.INT;
                        nYPos : Win32.INT)
                       return Win32.BOOL;              --  wingdi.h:2170

   function PtVisible (hdc : Win32.Windef.HDC;
                       nXPos : Win32.INT;
                       nYPos : Win32.INT)
                      return Win32.BOOL;               --  wingdi.h:2171

   function RectInRegion (hrgn : Win32.Windef.HRGN;
                          lprc : ac_RECT_t)
                         return Win32.BOOL;            --  wingdi.h:2172

   function RectVisible (hdc : Win32.Windef.HDC;
                         lprc : ac_RECT_t)
                        return Win32.BOOL;             --  wingdi.h:2173

   function Rectangle (hdc : Win32.Windef.HDC;
                       nLeftRect : Win32.INT;
                       nTopRect : Win32.INT;
                       nRightRect : Win32.INT;
                       nBottomRect : Win32.INT)
                      return Win32.BOOL;               --  wingdi.h:2174

   function RestoreDC (hdc : Win32.Windef.HDC;
                       nSavedDC : Win32.INT)
                      return Win32.BOOL;               --  wingdi.h:2175

   function ResetDCA (hdc : Win32.Windef.HDC;
                      lpdm : ac_DEVMODEA_t)
                     return Win32.Windef.HDC;          --  wingdi.h:2176

   function ResetDC (hdc : Win32.Windef.HDC;
                     lpdm : ac_DEVMODEA_t)
                    return Win32.Windef.HDC
     renames ResetDCA;                  --  wingdi.h:2176

   function ResetDCW (hdc : Win32.Windef.HDC;
                      lpdm : ac_DEVMODEW_t)
                     return Win32.Windef.HDC;          --  wingdi.h:2177

   function RealizePalette (hdc : Win32.Windef.HDC) return Win32.UINT;
   --  wingdi.h:2183

   function RemoveFontResourceA (lpFileName : Win32.LPCSTR) return Win32.BOOL;
   --  wingdi.h:2184

   function RemoveFontResource (lpFileName : Win32.LPCSTR) return Win32.BOOL
     renames RemoveFontResourceA;                        --  wingdi.h:2184

   function RemoveFontResourceW (lpFileName : Win32.LPCWSTR) return Win32.BOOL;
   --  wingdi.h:2185

   function RoundRect (hdc : Win32.Windef.HDC;
                       nLeftRect : Win32.INT;
                       nTopRect : Win32.INT;
                       nRightRect : Win32.INT;
                       nBottomRect : Win32.INT;
                       nEllipseWidth : Win32.INT;
                       nEllipseHeight : Win32.INT)
                      return Win32.BOOL;               --  wingdi.h:2191

   function ResizePalette (hpal : Win32.Windef.HPALETTE;
                           cEntries : Win32.UINT)
                          return Win32.BOOL;           --  wingdi.h:2192

   function SaveDC (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2194

   function SelectClipRgn (hdc : Win32.Windef.HDC;
                           hrgn : Win32.Windef.HRGN)
                          return Win32.INT;            --  wingdi.h:2195

   function ExtSelectClipRgn (hdc : Win32.Windef.HDC;
                              hrgn : Win32.Windef.HRGN;
                              fnMode : Win32.INT)
                             return Win32.INT;         --  wingdi.h:2196

   function SetMetaRgn (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2197

   function SelectObject (hdc : Win32.Windef.HDC;
                          hgdiobj : Win32.Windef.HGDIOBJ)
                         return Win32.Windef.HGDIOBJ;  --  wingdi.h:2198

   function SelectPalette (hdc : Win32.Windef.HDC;
                           hpal : Win32.Windef.HPALETTE;
                           bForceBackground : Win32.BOOL)
                          return Win32.Windef.HPALETTE; --  wingdi.h:2199

   function SetBkColor (hdc : Win32.Windef.HDC;
                        clrref : Win32.Windef.COLORREF)
                       return Win32.Windef.COLORREF;   --  wingdi.h:2200

   function SetBkMode (hdc : Win32.Windef.HDC;
                       fnBkMode : Win32.INT)
                      return Win32.INT;                --  wingdi.h:2201

   function SetBitmapBits (hbmp : Win32.Windef.HBITMAP;
                           cBytes : Win32.DWORD;
                           lpBits : Win32.PCVOID)
                          return Win32.LONG;           --  wingdi.h:2202

   function SetBoundsRect (hdc : Win32.Windef.HDC;
                           lprcBounds : ac_RECT_t;
                           flags : Win32.UINT)
                          return Win32.UINT;           --  wingdi.h:2204

   function SetDIBits (hdc : Win32.Windef.HDC;
                       hbmp : Win32.Windef.HBITMAP;
                       uStartScan : Win32.UINT;
                       cScanLines : Win32.UINT;
                       lpvBits : Win32.PCVOID;
                       lpbmi : ac_BITMAPINFO_t;
                       fuColorUse : Win32.UINT)
                      return Win32.INT;                --  wingdi.h:2205

   function SetDIBitsToDevice (hdc : Win32.Windef.HDC;
                               XDest : Win32.INT;
                               YDest : Win32.INT;
                               dwWidth : Win32.DWORD;
                               dwHeight : Win32.DWORD;
                               XSrc : Win32.INT;
                               YSrc : Win32.INT;
                               uStartScan : Win32.UINT;
                               cScanLines : Win32.UINT;
                               lpvBits : Win32.PCVOID;
                               lpbmi : ac_BITMAPINFO_t;
                               fuColorUse : Win32.UINT)
                              return Win32.INT;       --  wingdi.h:2206

   function SetMapperFlags (hdc : Win32.Windef.HDC;
                            dwFlag : Win32.DWORD)
                           return Win32.DWORD;         --  wingdi.h:2208

   function SetGraphicsMode (hdc : Win32.Windef.HDC;
                             iMode : Win32.INT)
                            return Win32.INT;       --  wingdi.h:2209

   function SetMapMode (hdc : Win32.Windef.HDC;
                        fnmapMode : Win32.INT)
                       return Win32.INT;               --  wingdi.h:2210

   function SetMetaFileBitsEx (nSize : Win32.UINT;
                               lpData : Win32.PCBYTE)
                              return Win32.Windef.HMETAFILE;
   --  wingdi.h:2211

   function SetPaletteEntries (hpal : Win32.Windef.HPALETTE;
                               iStart : Win32.UINT;
                               cEntries : Win32.UINT;
                               lppe : ac_PALETTEENTRY_t)
                              return Win32.UINT;       --  wingdi.h:2212

   function SetPixel (hdc : Win32.Windef.HDC;
                      X : Win32.INT;
                      Y : Win32.INT;
                      crColor : Win32.Windef.COLORREF)
                     return Win32.Windef.COLORREF;     --  wingdi.h:2213

   function SetPixelV (hdc : Win32.Windef.HDC;
                       X : Win32.INT;
                       Y : Win32.INT;
                       crColor : Win32.Windef.COLORREF)
                      return Win32.BOOL;               --  wingdi.h:2214

   function SetPixelFormat (hdc : Win32.Windef.HDC;
                            iPixelFormat : Win32.INT;
                            ppfd : ac_PIXELFORMATDESCRIPTOR_t)
                           return Win32.BOOL;          --  wingdi.h:2215

   function SetPolyFillMode (hdc : Win32.Windef.HDC;
                             iPolyFillMode : Win32.INT)
                            return Win32.INT;          --  wingdi.h:2216

   function StretchBlt (hdcDest : Win32.Windef.HDC;
                        nXOriginDes : Win32.INT;
                        nYOriginDes : Win32.INT;
                        nWidthDest : Win32.INT;
                        nHeightDest : Win32.INT;
                        hdcSrc : Win32.Windef.HDC;
                        nXOriginSrc : Win32.INT;
                        nYOriginSrc : Win32.INT;
                        nWidthSrc : Win32.INT;
                        nHeightSrc : Win32.INT;
                        dwRop : Win32.DWORD)
                       return Win32.BOOL;             --  wingdi.h:2217

   function SetRectRgn (hrgn : Win32.Windef.HRGN;
                        nLeftRect : Win32.INT;
                        nTopRect : Win32.INT;
                        nRightRect : Win32.INT;
                        nBottomRect : Win32.INT)
                       return Win32.BOOL;              --  wingdi.h:2218

   function StretchDIBits (hdc : Win32.Windef.HDC;
                           XDest : Win32.INT;
                           YDest : Win32.INT;
                           nDestWidth : Win32.INT;
                           nDestHeight : Win32.INT;
                           XSrc : Win32.INT;
                           YSrc : Win32.INT;
                           nSrcWidth : Win32.INT;
                           nSrcHeight : Win32.INT;
                           lpBits : Win32.PCVOID;
                           lpBitsInfo : ac_BITMAPINFO_t;
                           iUsage : Win32.UINT;
                           dwRop : Win32.DWORD)
                          return Win32.INT;           --  wingdi.h:2219

   function SetROP2 (hdc : Win32.Windef.HDC;
                     fnDrawMode : Win32.INT)
                    return Win32.INT;                  --  wingdi.h:2221

   function SetStretchBltMode (hdc : Win32.Windef.HDC;
                               iStretchMode : Win32.INT)
                              return Win32.INT;        --  wingdi.h:2222

   function SetSystemPaletteUse (hdc : Win32.Windef.HDC;
                                 uUsage : Win32.UINT)
                                return Win32.UINT;     --  wingdi.h:2223

   function SetTextCharacterExtra (hdc : Win32.Windef.HDC;
                                   nCharExtra : Win32.INT)
                                  return Win32.INT;    --  wingdi.h:2224

   function SetTextColor (hdcColor : Win32.Windef.HDC;
                          crColor : Win32.Windef.COLORREF)
                         return Win32.Windef.COLORREF;   --  wingdi.h:2225

   function SetTextAlign (hdc : Win32.Windef.HDC;
                          fMode : Win32.UINT)
                         return Win32.UINT;            --  wingdi.h:2226

   function SetTextJustification (hdc : Win32.Windef.HDC;
                                  nBreakExtra : Win32.INT;
                                  nBreakCount : Win32.INT)
                                 return Win32.BOOL;    --  wingdi.h:2227

   function UpdateColors (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2228

   function PlayMetaFileRecord (hdc : Win32.Windef.HDC;
                                lpHandletable : access HANDLETABLE;
                                lpMetaRecord : access METARECORD;
                                nHandles : Win32.UINT)
                               return Win32.BOOL;      --  wingdi.h:2232

   function EnumMetaFile (hdc : Win32.Windef.HDC;
                          hmf : Win32.Windef.HMETAFILE;
                          lpMetaFunc : MFENUMPROC;
                          lParam : Win32.LPARAM)
                         return Win32.BOOL;            --  wingdi.h:2234

   function CloseEnhMetaFile (hdc : Win32.Windef.HDC)
      return Win32.Windef.HENHMETAFILE;                   --  wingdi.h:2240

   function CopyEnhMetaFileA (hemfSrc : Win32.Windef.HENHMETAFILE;
                              lpszFile : Win32.LPCSTR)
                             return Win32.Windef.HENHMETAFILE;
   --  wingdi.h:2241

   function CopyEnhMetaFile (hemfSrc : Win32.Windef.HENHMETAFILE;
                             lpszFile : Win32.LPCSTR)
                            return Win32.Windef.HENHMETAFILE
     renames CopyEnhMetaFileA;  --  wingdi.h:2241

   function CopyEnhMetaFileW (hemfSrc : Win32.Windef.HENHMETAFILE;
                              lpszFile : Win32.LPCWSTR)
                             return Win32.Windef.HENHMETAFILE;
   --  wingdi.h:2242

   function CreateEnhMetaFileA (hdcRef : Win32.Windef.HDC;
                                lpFilename : Win32.LPCSTR;
                                lpRect : ac_RECT_t;
                                lpDescription : Win32.LPCSTR)
                               return Win32.Windef.HDC; --  wingdi.h:2248

   function CreateEnhMetaFile (hdcRef : Win32.Windef.HDC;
                               lpFilename : Win32.LPCSTR;
                               lpRect : ac_RECT_t;
                               lpDescription : Win32.LPCSTR)
                              return Win32.Windef.HDC
     renames CreateEnhMetaFileA;
   --  wingdi.h:2248

   function CreateEnhMetaFileW (hdcRef : Win32.Windef.HDC;
                                lpFilename : Win32.LPCWSTR;
                                lpRect : ac_RECT_t;
                                lpDescription : Win32.LPCWSTR)
                               return Win32.Windef.HDC; --  wingdi.h:2249

   function DeleteEnhMetaFile (hemf : Win32.Windef.HENHMETAFILE)
                              return Win32.BOOL;
   --  wingdi.h:2255

   function EnumEnhMetaFile (hdc : Win32.Windef.HDC;
                             hemf : Win32.Windef.HENHMETAFILE;
                             lpEnhMetaFunc : ENHMFENUMPROC;
                             lpData : Win32.LPVOID;
                             lpRect : ac_RECT_t)
                            return Win32.BOOL;         --  wingdi.h:2256

   function GetEnhMetaFileA (lpszMetaFile : Win32.LPCSTR)
                            return Win32.Windef.HENHMETAFILE;
   --  wingdi.h:2258

   function GetEnhMetaFile (lpszMetaFile : Win32.LPCSTR)
                           return Win32.Windef.HENHMETAFILE
     renames GetEnhMetaFileA;                            --  wingdi.h:2258

   function GetEnhMetaFileW (lpszMetaFile : Win32.LPCWSTR)
      return Win32.Windef.HENHMETAFILE;                   --  wingdi.h:2259

   function GetEnhMetaFileBits (hemf : Win32.Windef.HENHMETAFILE;
                                cbBuffer : Win32.UINT;
                                lpbBuffer : Win32.LPBYTE)
                               return Win32.UINT;      --  wingdi.h:2265

   function GetEnhMetaFileDescriptionA
     (hemf : Win32.Windef.HENHMETAFILE;
      cchBuffer : Win32.UINT;
      lpszDescription : Win32.LPSTR)
     return Win32.UINT;                 --  wingdi.h:2266

   function GetEnhMetaFileDescription
     (hemf : Win32.Windef.HENHMETAFILE;
      cchBuffer : Win32.UINT;
      lpszDescription : Win32.LPSTR)
     return Win32.UINT
     renames GetEnhMetaFileDescriptionA;
   --  wingdi.h:2266

   function GetEnhMetaFileDescriptionW
     (hemf : Win32.Windef.HENHMETAFILE;
      cchBuffer : Win32.UINT;
      lpszDescription : Win32.LPWSTR)
     return Win32.UINT;                 --  wingdi.h:2267

   function GetEnhMetaFileHeader (hemf : Win32.Windef.HENHMETAFILE;
                                  cbBuffer : Win32.UINT;
                                  lpemh : access ENHMETAHEADER)
                                 return Win32.UINT;    --  wingdi.h:2273

   function GetEnhMetaFilePaletteEntries (hemf : Win32.Windef.HENHMETAFILE;
                                          cEntries : Win32.UINT;
                                          lppe : access PALETTEENTRY)
                                         return Win32.UINT;
   --  wingdi.h:2274

   function GetWinMetaFileBits (hemf : Win32.Windef.HENHMETAFILE;
                                cbBuffer : Win32.UINT;
                                lpbBuffer : Win32.LPBYTE;
                                fnMapMode : Win32.INT;
                                hdcRef : Win32.Windef.HDC)
                               return Win32.UINT;      --  wingdi.h:2275

   function PlayEnhMetaFile (hdc : Win32.Windef.HDC;
                             hemf : Win32.Windef.HENHMETAFILE;
                             lpRect : ac_RECT_t)
                            return Win32.BOOL;         --  wingdi.h:2276

   function PlayEnhMetaFileRecord (hdc : Win32.Windef.HDC;
                                   lpHandletable : access HANDLETABLE;
                                   lpEnhMetaRecord : ac_ENHMETARECORD_t;
                                   nHandles : Win32.UINT)
                                  return Win32.BOOL;   --  wingdi.h:2277

   function SetEnhMetaFileBits (cbBuffer : Win32.UINT;
                                lpData : Win32.PCBYTE)
                               return Win32.Windef.HENHMETAFILE;
   --  wingdi.h:2278

   function SetWinMetaFileBits (cbBuffer : Win32.UINT;
                                lpbBuffer : Win32.PCBYTE;
                                hdcRef : Win32.Windef.HDC;
                                lpmfp : access METAFILEPICT)
                               return Win32.Windef.HENHMETAFILE;
   --  wingdi.h:2279

   function GdiComment (hdc : Win32.Windef.HDC;
                        cbSize : Win32.UINT;
                        lpData : Win32.PCBYTE)
                       return Win32.BOOL;              --  wingdi.h:2280

   function GetTextMetricsA (hdc : Win32.Windef.HDC;
                             lptm : access TEXTMETRICA)
                            return Win32.BOOL;         --  wingdi.h:2286

   function GetTextMetrics (hdc : Win32.Windef.HDC;
                            lptm : access TEXTMETRICA)
                           return Win32.BOOL
     renames GetTextMetricsA;    --  wingdi.h:2286

   function GetTextMetricsW (hdc : Win32.Windef.HDC;
                             lptm : access TEXTMETRICW)
                            return Win32.BOOL;         --  wingdi.h:2287

   function AngleArc (hdc : Win32.Windef.HDC;
                      X : Win32.INT;
                      Y : Win32.INT;
                      dwRadius : Win32.DWORD;
                      eStartAngle : Win32.FLOAT;
                      eSweepAngle : Win32.FLOAT)
                     return Win32.BOOL;                --  wingdi.h:2306

   function PolyPolyline (hdc : Win32.Windef.HDC;
                          lppt : ac_POINT_t;
                          lpdwPolyPoints : Win32.PCDWORD;
                          cCount : Win32.DWORD)
                         return Win32.BOOL;            --  wingdi.h:2307

   function GetWorldTransform (hdc : Win32.Windef.HDC;
                               lpXform : access XFORM)
                              return Win32.BOOL;       --  wingdi.h:2308

   function SetWorldTransform (hdc : Win32.Windef.HDC;
                               lpXform : access XFORM)
                              return Win32.BOOL;       --  wingdi.h:2309

   function ModifyWorldTransform (hdc : Win32.Windef.HDC;
                                  lpXform : access XFORM;
                                  iMode : Win32.DWORD)
                                 return Win32.BOOL;    --  wingdi.h:2310

   function CombineTransform (lpxformResult : access XFORM;
                              lpxform1 : access XFORM;
                              lpxform2 : access XFORM)
                             return Win32.BOOL;        --  wingdi.h:2311

   function CreateDIBSection (hdc : Win32.Windef.HDC;
                              pbmi : ac_BITMAPINFO_t;
                              iUsage : Win32.UINT;
                              ppvBits : access Win32.PVOID;
                              hSection : Win32.Winnt.HANDLE;
                              dwOffset : Win32.DWORD)
                             return Win32.Windef.HBITMAP;
   --  wingdi.h:2312

   function GetDIBColorTable (hdc : Win32.Windef.HDC;
                              uStartIndex : Win32.UINT;
                              cEntries : Win32.UINT;
                              pColors : access RGBQUAD)
                             return Win32.UINT;        --  wingdi.h:2313

   function SetDIBColorTable (hdc : Win32.Windef.HDC;
                              uStartIndex : Win32.UINT;
                              cEntries : Win32.UINT;
                              pColors : ac_RGBQUAD_t)
                             return Win32.UINT;        --  wingdi.h:2314

   function SetColorAdjustment (hdc : Win32.Windef.HDC;
                                lpca : ac_COLORADJUSTMENT_t)
                               return Win32.BOOL;      --  wingdi.h:2366

   function GetColorAdjustment (hdc : Win32.Windef.HDC;
                                lpca : access COLORADJUSTMENT)
                               return Win32.BOOL;      --  wingdi.h:2367

   function CreateHalftonePalette (hdc : Win32.Windef.HDC)
      return Win32.Windef.HPALETTE;                       --  wingdi.h:2368

   function StartDocA (hdc : Win32.Windef.HDC;
                       lpdi : ac_DOCINFOA_t)
                      return Win32.INT;                --  wingdi.h:2395

   function StartDoc (hdc : Win32.Windef.HDC;
                      lpdi : ac_DOCINFOA_t)
                     return Win32.INT
     renames StartDocA;                --  wingdi.h:2395

   function StartDocW (hdc : Win32.Windef.HDC;
                       lpdi : ac_DOCINFOW_t)
                      return Win32.INT;                --  wingdi.h:2396

   function EndDoc (hdc : Win32.Windef.HDC) return Win32.INT; --  wingdi.h:2402

   function StartPage (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2403

   function EndPage (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2404

   function AbortDoc (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2405

   function SetAbortProc (hdc : Win32.Windef.HDC;
                          lpAbortProc : ABORTPROC)
                         return Win32.INT;             --  wingdi.h:2406

   function AbortPath_func (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2408

   function ArcTo (hdc : Win32.Windef.HDC;
                   nLeftRect : Win32.INT;
                   nTopRect : Win32.INT;
                   nRightRect : Win32.INT;
                   nBottomRect : Win32.INT;
                   nXRadial1 : Win32.INT;
                   nYRadial1 : Win32.INT;
                   nXRadial2 : Win32.INT;
                   nYRadial2 : Win32.INT)
                  return Win32.BOOL;                   --  wingdi.h:2409

   function BeginPath (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2410

   function CloseFigure (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2411

   function EndPath (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2412

   function FillPath (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2413

   function FlattenPath (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2414

   function GetPath (hdc : Win32.Windef.HDC;
                     lpPoints : access Win32.Windef.POINT;
                     lpTypes : Win32.LPBYTE;
                     nSize : Win32.INT)
                    return Win32.INT;                  --  wingdi.h:2415

   function PathToRegion (hdc : Win32.Windef.HDC) return Win32.Windef.HRGN;
   --  wingdi.h:2416

   function PolyDraw (hdc : Win32.Windef.HDC;
                      lppt : ac_POINT_t;
                      lpbTypes : Win32.PCBYTE;
                      cCount : Win32.INT)
                     return Win32.BOOL;                --  wingdi.h:2417

   function SelectClipPath (hdc : Win32.Windef.HDC;
                            iMode : Win32.INT)
                           return Win32.BOOL;          --  wingdi.h:2418

   function SetArcDirection (hdc : Win32.Windef.HDC;
                             ArcDirection : Win32.INT)
                            return Win32.INT;          --  wingdi.h:2419

   function SetMiterLimit (hdc : Win32.Windef.HDC;
                           eNewLimit : Win32.FLOAT;
                           peOldLimit : Win32.PFLOAT)
                          return Win32.BOOL;           --  wingdi.h:2420

   function StrokeAndFillPath (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2421

   function StrokePath (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2422

   function WidenPath (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:2423

   function ExtCreatePen (dwPenStyle : Win32.DWORD;
                          dwWidth : Win32.DWORD;
                          lplb : ac_LOGBRUSH_t;
                          dwStyleCount : Win32.DWORD;
                          lpStyle : Win32.PCDWORD)
                         return Win32.Windef.HPEN;     --  wingdi.h:2424

   function GetMiterLimit (hdc : Win32.Windef.HDC;
                           peLimit : Win32.PFLOAT)
                          return Win32.BOOL;           --  wingdi.h:2425

   function GetArcDirection (hdc : Win32.Windef.HDC) return Win32.INT;
   --  wingdi.h:2426

   function GetObjectA (hgdiobj : Win32.Windef.HGDIOBJ;
                        cbBuffer : Win32.INT;
                        lpvObject : Win32.LPVOID)
                       return Win32.INT;               --  wingdi.h:2428

   function GetObject (hgdiobj : Win32.Windef.HGDIOBJ;
                       cbBuffer : Win32.INT;
                       lpvObject : Win32.LPVOID)
                      return Win32.INT
     renames GetObjectA;              --  wingdi.h:2428

   function GetObjectW (hgdiobj : Win32.Windef.HGDIOBJ;
                        cbBuffer : Win32.INT;
                        lpvObject : Win32.LPVOID)
                       return Win32.INT;               --  wingdi.h:2429

   function MoveToEx (hdc : Win32.Windef.HDC;
                      X : Win32.INT;
                      Y : Win32.INT;
                      lpPoint : Win32.Windef.PPOINT)
                     return Win32.BOOL;                --  wingdi.h:2435

   function TextOutA (hdc : Win32.Windef.HDC;
                      nXStart : Win32.INT;
                      nYStart : Win32.INT;
                      lpstring : Win32.LPCSTR;
                      cbString : Win32.INT)
                     return Win32.BOOL;                --  wingdi.h:2436

   function TextOut (hdc : Win32.Windef.HDC;
                     nXStart : Win32.INT;
                     nYStart : Win32.INT;
                     lpstring : Win32.LPCSTR;
                     cbString : Win32.INT)
                    return Win32.BOOL
     renames TextOutA;                  --  wingdi.h:2436

   function TextOutW (hdc : Win32.Windef.HDC;
                      nXStart : Win32.INT;
                      nYStart : Win32.INT;
                      lpstring : Win32.LPCWSTR;
                      cbString : Win32.INT)
                     return Win32.BOOL;                --  wingdi.h:2437

   function ExtTextOutA (hdc : Win32.Windef.HDC;
                         X : Win32.INT;
                         Y : Win32.INT;
                         fuOptions : Win32.UINT;
                         lprc : ac_RECT_t;
                         lpString : Win32.LPCSTR;
                         cbCount : Win32.UINT;
                         lpDx : Win32.PCINT)
                        return Win32.BOOL;             --  wingdi.h:2443

   function ExtTextOut (hdc : Win32.Windef.HDC;
                        X : Win32.INT;
                        Y : Win32.INT;
                        fuOptions : Win32.UINT;
                        lprc : ac_RECT_t;
                        lpString : Win32.LPCSTR;
                        cbCount : Win32.UINT;
                        lpDx : Win32.PCINT)
                       return Win32.BOOL
     renames ExtTextOutA;            --  wingdi.h:2443

   function ExtTextOutW (hdc : Win32.Windef.HDC;
                         X : Win32.INT;
                         Y : Win32.INT;
                         fuOptions : Win32.UINT;
                         lprc : ac_RECT_t;
                         lpString : Win32.LPCWSTR;
                         cbCount : Win32.UINT;
                         lpDx : Win32.PCINT)
                        return Win32.BOOL;             --  wingdi.h:2444

   function PolyTextOutA (hdc : Win32.Windef.HDC;
                          pptxt : ac_POLYTEXTA_t;
                          cStrings : Win32.INT)
                         return Win32.BOOL;            --  wingdi.h:2450

   function PolyTextOut (hdc : Win32.Windef.HDC;
                         pptxt : ac_POLYTEXTA_t;
                         cStrings : Win32.INT)
                        return Win32.BOOL
     renames PolyTextOutA;          --  wingdi.h:2450

   function PolyTextOutW (hdc : Win32.Windef.HDC;
                          pptxt : access POLYTEXTW;
                          cStrings : Win32.INT)
                         return Win32.BOOL;            --  wingdi.h:2451

   function CreatePolygonRgn (lppt : ac_POINT_t;
                              cPoints : Win32.INT;
                              fnPolyFillMode : Win32.INT)
                             return Win32.Windef.HRGN; --  wingdi.h:2458

   function DPTOLP (hdc : Win32.Windef.HDC;
                    lpPoints : access Win32.Windef.POINT;
                    nCount : Win32.INT)
                   return Win32.BOOL;                  --  wingdi.h:2459

   function LPTODP (hdc : Win32.Windef.HDC;
                    lpPoints : access Win32.Windef.POINT;
                    nCount : Win32.INT)
                   return Win32.BOOL;                  --  wingdi.h:2460

   function Polygon (hdc : Win32.Windef.HDC;
                     lpPoints : ac_POINT_t;
                     nCount : Win32.INT)
                    return Win32.BOOL;                 --  wingdi.h:2461

   function Polyline (hdc : Win32.Windef.HDC;
                      lppt : ac_POINT_t;
                      cPoints : Win32.INT)
                     return Win32.BOOL;                --  wingdi.h:2462

   function PolyBezier (hdc : Win32.Windef.HDC;
                        lppt : ac_POINT_t;
                        cPoints : Win32.DWORD)
                       return Win32.BOOL;              --  wingdi.h:2464

   function PolyBezierTo (hdc : Win32.Windef.HDC;
                          lppt : ac_POINT_t;
                          cCount : Win32.DWORD)
                         return Win32.BOOL;            --  wingdi.h:2465

   function PolylineTo (hdc : Win32.Windef.HDC;
                        lppt : ac_POINT_t;
                        cCount : Win32.DWORD)
                       return Win32.BOOL;              --  wingdi.h:2466

   function SetViewportExtEx (hdc : Win32.Windef.HDC;
                              nXExtent : Win32.INT;
                              nYExtent : Win32.INT;
                              lpSize : Win32.Windef.LPSIZE)
                             return Win32.BOOL;        --  wingdi.h:2468

   function SetViewportOrgEx (hdc : Win32.Windef.HDC;
                              X : Win32.INT;
                              Y : Win32.INT;
                              lpPoint : access Win32.Windef.POINT)
                             return Win32.BOOL;        --  wingdi.h:2469

   function SetWindowExtEx (hdc : Win32.Windef.HDC;
                            nXExtent : Win32.INT;
                            nYExtent : Win32.INT;
                            lpSize : Win32.Windef.LPSIZE)
                           return Win32.BOOL;          --  wingdi.h:2470

   function SetWindowOrgEx (hdc : Win32.Windef.HDC;
                            X : Win32.INT;
                            Y : Win32.INT;
                            lpPoint : access Win32.Windef.POINT)
                           return Win32.BOOL;          --  wingdi.h:2471

   function OffsetViewportOrgEx (hdc : Win32.Windef.HDC;
                                 nXOffset : Win32.INT;
                                 nYOffset : Win32.INT;
                                 lpPoint : access Win32.Windef.POINT)
                                return Win32.BOOL;     --  wingdi.h:2473

   function OffsetWindowOrgEx (hdc : Win32.Windef.HDC;
                               nXOffset : Win32.INT;
                               nYOffset : Win32.INT;
                               lpPoint : access Win32.Windef.POINT)
                              return Win32.BOOL;       --  wingdi.h:2474

   function ScaleViewportExtEx (hdc : Win32.Windef.HDC;
                                Xnum : Win32.INT;
                                Xdenom : Win32.INT;
                                Ynum : Win32.INT;
                                Ydenom : Win32.INT;
                                lpSize : Win32.Windef.LPSIZE)
                               return Win32.BOOL;      --  wingdi.h:2475

   function ScaleWindowExtEx (hdc : Win32.Windef.HDC;
                              Xnum : Win32.INT;
                              Xdenom : Win32.INT;
                              Ynum : Win32.INT;
                              Ydenom : Win32.INT;
                              lpSize : Win32.Windef.LPSIZE)
                             return Win32.BOOL;        --  wingdi.h:2476

   function SetBitmapDimensionEx (hBitmap : Win32.Windef.HBITMAP;
                                  nWidth : Win32.INT;
                                  nHeight : Win32.INT;
                                  lpSize : Win32.Windef.PSIZE)
                                 return Win32.BOOL;    --  wingdi.h:2477

   function SetBrushOrgEx (hdc : Win32.Windef.HDC;
                           nXOrg : Win32.INT;
                           nYOrg : Win32.INT;
                           lppt : access Win32.Windef.POINT)
                          return Win32.BOOL;           --  wingdi.h:2478

   function GetTextFaceA (hdc : Win32.Windef.HDC;
                          nCount : Win32.INT;
                          lpFaceName : Win32.LPSTR)
                         return Win32.INT;             --  wingdi.h:2480

   function GetTextFace (hdc : Win32.Windef.HDC;
                         nCount : Win32.INT;
                         lpFaceName : Win32.LPSTR)
                        return Win32.INT
     renames GetTextFaceA;          --  wingdi.h:2480

   function GetTextFaceW (hdc : Win32.Windef.HDC;
                          nCount : Win32.INT;
                          lpFaceName : Win32.LPWSTR)
                         return Win32.INT;             --  wingdi.h:2481

   function GetKerningPairsA (hdc : Win32.Windef.HDC;
                              nNumPairs : Win32.DWORD;
                              lpkrnpair : access KERNINGPAIR)
                             return Win32.DWORD;       --  wingdi.h:2496

   function GetKerningPairs (hdc : Win32.Windef.HDC;
                             nNumPairs : Win32.DWORD;
                             lpkrnpair : access KERNINGPAIR)
                            return Win32.DWORD
     renames GetKerningPairsA;  --  wingdi.h:2496

   function GetKerningPairsW (hdc : Win32.Windef.HDC;
                              nNumPairs : Win32.DWORD;
                              lpkrnpair : access KERNINGPAIR)
                             return Win32.DWORD;       --  wingdi.h:2497

   function GetDCOrgEx (hdc : Win32.Windef.HDC;
                        lpPoint : access Win32.Windef.POINT)
                       return Win32.BOOL;              --  wingdi.h:2504

   --  The following function is not implemented in Win32 API.
   --  It will always return false.
   function FixBrushOrgEx (hdc : Win32.Windef.HDC;
                           nXOrg : Win32.INT;
                           nYOrg : Win32.INT;
                           lppt : access Win32.Windef.POINT)
                          return Win32.BOOL;           --  wingdi.h:2505

   function UnrealizeObject (hgdiobj : Win32.Windef.HGDIOBJ) return Win32.BOOL;
   --  wingdi.h:2506

   function GdiFlush return Win32.BOOL;                    --  wingdi.h:2508

   function GdiSetBatchLimit (dwLimit : Win32.DWORD) return Win32.DWORD;
   --  wingdi.h:2509

   function GdiGetBatchLimit return Win32.DWORD;           --  wingdi.h:2510

   function wglCreateContext (hdc : Win32.Windef.HDC)
                             return Win32.Windef.HGLRC;
   --  wingdi.h:3229

   function wglDeleteContext (hglrc : Win32.Windef.HGLRC) return Win32.BOOL;
   --  wingdi.h:3230

   function wglGetCurrentContext return Win32.Windef.HGLRC;
   --  wingdi.h:3231

   function wglGetCurrentDC return Win32.Windef.HDC;       --  wingdi.h:3232

   function wglMakeCurrent (hdc : Win32.Windef.HDC;
                            hglrc : Win32.Windef.HGLRC)
                           return Win32.BOOL;          --  wingdi.h:3233

   function wglUseFontBitmapsA (hdc : Win32.Windef.HDC;
                                first : Win32.DWORD;
                                count : Win32.DWORD;
                                listBase : Win32.DWORD)
                               return Win32.BOOL;      --  wingdi.h:3234

   function wglUseFontBitmaps (hdc : Win32.Windef.HDC;
                               first : Win32.DWORD;
                               count : Win32.DWORD;
                               listBase : Win32.DWORD)
                              return Win32.BOOL
     renames wglUseFontBitmapsA;
   --  wingdi.h:3234

   function wglUseFontBitmapsW (hdc : Win32.Windef.HDC;
                                first : Win32.DWORD;
                                count : Win32.DWORD;
                                listBase : Win32.DWORD)
                               return Win32.BOOL;      --  wingdi.h:3235

   function SwapBuffers (hdc : Win32.Windef.HDC) return Win32.BOOL;
   --  wingdi.h:3241

private

   pragma Convention (C, XFORM);                            --  wingdi.h:344
   pragma Convention (C, BITMAP);                           --  wingdi.h:355
   pragma Convention (C, RGBTRIPLE);                        --  wingdi.h:366
   pragma Convention (C, RGBQUAD);                          --  wingdi.h:372
   pragma Convention (C, BITMAPCOREHEADER);                 --  wingdi.h:383
   pragma Convention (C, BITMAPINFOHEADER);                 --  wingdi.h:392
   pragma Convention (C, BITMAPINFO);                       --  wingdi.h:414
   pragma Convention (C, BITMAPCOREINFO);                   --  wingdi.h:419
   pragma Convention (C, BITMAPFILEHEADER);                 --  wingdi.h:426
   pragma Convention (C, HANDLETABLE);                      --  wingdi.h:441
   pragma Convention (C, METARECORD);                       --  wingdi.h:446
   pragma Convention (C, METAFILEPICT);                     --  wingdi.h:455
   pragma Convention (C, METAHEADER);                       --  wingdi.h:465
   pragma Convention (C, ENHMETARECORD);                    --  wingdi.h:482
   pragma Convention (C, ENHMETAHEADER);                    --  wingdi.h:489
   pragma Convention (C, TEXTMETRICA);                      --  wingdi.h:522
   pragma Convention (C, TEXTMETRICW);                      --  wingdi.h:545
   pragma Convention (C, NEWTEXTMETRICA);                   --  wingdi.h:585
   pragma Convention (C, NEWTEXTMETRICW);                   --  wingdi.h:612
   pragma Convention (C, PELARRAY);                         --  wingdi.h:656
   pragma Convention (C, LOGBRUSH);                         --  wingdi.h:666
   pragma Convention (C, LOGPEN);                           --  wingdi.h:679
   pragma Convention (C, EXTLOGPEN);                        --  wingdi.h:686
   pragma Convention (C, PALETTEENTRY);                     --  wingdi.h:696
   pragma Convention (C, LOGPALETTE);                       --  wingdi.h:704
   pragma Convention (C, LOGFONTA);                         --  wingdi.h:714
   pragma Convention (C, LOGFONTW);                         --  wingdi.h:731
   pragma Convention (C, ENUMLOGFONTA);                     --  wingdi.h:763
   pragma Convention (C, ENUMLOGFONTW);                     --  wingdi.h:770
   pragma Convention (C, PANOSE);                           --  wingdi.h:863
   pragma Convention (C, EXTLOGFONTA);                      --  wingdi.h:989
   pragma Convention (C, EXTLOGFONTW);                      --  wingdi.h:1001
   pragma Convention (C, DEVMODEA);                         --  wingdi.h:1324
   pragma Convention (C, DEVMODEW);                         --  wingdi.h:1352
   pragma Convention (C, RGNDATAHEADER);                    --  wingdi.h:1518
   pragma Convention (C, RGNDATA);                          --  wingdi.h:1526
   pragma Convention (C, ABC);                              --  wingdi.h:1532
   pragma Convention (C, ABCFLOAT);                         --  wingdi.h:1538
   pragma Convention (C, OUTLINETEXTMETRICA);               --  wingdi.h:1546
   pragma Convention (C, OUTLINETEXTMETRICW);               --  wingdi.h:1580
   pragma Convention (C, POLYTEXTA);                        --  wingdi.h:1629
   pragma Convention (C, POLYTEXTW);                        --  wingdi.h:1639
   pragma Convention (C, FIXED);                            --  wingdi.h:1661
   pragma Convention (C, MAT2);                             --  wingdi.h:1667
   pragma Convention (C, GLYPHMETRICS);                     --  wingdi.h:1676
   pragma Convention (C, POINTFX);                          --  wingdi.h:1696
   pragma Convention (C, TTPOLYCURVE);                      --  wingdi.h:1702
   pragma Convention (C, TTPOLYGONHEADER);                  --  wingdi.h:1709
   pragma Convention (C, RASTERIZER_STATUS);                --  wingdi.h:1718
   pragma Convention (C, PIXELFORMATDESCRIPTOR);            --  wingdi.h:1729
   pragma Convention (C, DIBSECTION);                       --  wingdi.h:2298
   pragma Convention (C, COLORADJUSTMENT);                  --  wingdi.h:2351
   pragma Convention (C, DOCINFOA);                         --  wingdi.h:2376
   pragma Convention (C, DOCINFOW);                         --  wingdi.h:2381
   pragma Convention (C, KERNINGPAIR);                      --  wingdi.h:2490
   pragma Convention (C, EMR);                              --  wingdi.h:2630
   pragma Convention (C, EMRTEXT);                          --  wingdi.h:2639
   pragma Convention (C, ABORTPATH);                        --  wingdi.h:2652
   pragma Convention (C, EMRSELECTCLIPPATH);                --  wingdi.h:2665
   pragma Convention (C, EMRSETMITERLIMIT);                 --  wingdi.h:2677
   pragma Convention (C, EMRRESTOREDC);                     --  wingdi.h:2683
   pragma Convention (C, EMRSETARCDIRECTION);               --  wingdi.h:2689
   pragma Convention (C, EMRSETMAPPERFLAGS);                --  wingdi.h:2696
   pragma Convention (C, EMRSETTEXTCOLOR);                  --  wingdi.h:2702
   pragma Convention (C, EMRSELECTOBJECT);                  --  wingdi.h:2709
   pragma Convention (C, EMRSELECTPALETTE);                 --  wingdi.h:2717
   pragma Convention (C, EMRRESIZEPALETTE);                 --  wingdi.h:2723
   pragma Convention (C, EMRSETPALETTEENTRIES);             --  wingdi.h:2730
   pragma Convention (C, EMRSETCOLORADJUSTMENT);            --  wingdi.h:2739
   pragma Convention (C, EMRGDICOMMENT);                    --  wingdi.h:2745
   pragma Convention (C, EMREOF);                           --  wingdi.h:2752
   pragma Convention (C, EMRLINETO);                        --  wingdi.h:2762
   pragma Convention (C, EMROFFSETCLIPRGN);                 --  wingdi.h:2769
   pragma Convention (C, EMRFILLPATH);                      --  wingdi.h:2775
   pragma Convention (C, EMREXCLUDECLIPRECT);               --  wingdi.h:2783
   pragma Convention (C, EMRSETVIEWPORTORGEX);              --  wingdi.h:2790
   pragma Convention (C, EMRSETVIEWPORTEXTEX);              --  wingdi.h:2798
   pragma Convention (C, EMRSCALEVIEWPORTEXTEX);            --  wingdi.h:2805
   pragma Convention (C, EMRSETWORLDTRANSFORM);             --  wingdi.h:2815
   pragma Convention (C, EMRMODIFYWORLDTRANSFORM);          --  wingdi.h:2821
   pragma Convention (C, EMRSETPIXELV);                     --  wingdi.h:2828
   pragma Convention (C, EMREXTFLOODFILL);                  --  wingdi.h:2835
   pragma Convention (C, EMRELLIPSE);                       --  wingdi.h:2843
   pragma Convention (C, EMRROUNDRECT);                     --  wingdi.h:2850
   pragma Convention (C, EMRARC);                           --  wingdi.h:2857
   pragma Convention (C, EMRANGLEARC);                      --  wingdi.h:2868
   pragma Convention (C, EMRPOLYLINE);                      --  wingdi.h:2877
   pragma Convention (C, EMRPOLYLINE16);                    --  wingdi.h:2889
   pragma Convention (C, EMRPOLYDRAW);                      --  wingdi.h:2901
   pragma Convention (C, EMRPOLYDRAW16);                    --  wingdi.h:2910
   pragma Convention (C, EMRPOLYPOLYLINE);                  --  wingdi.h:2919
   pragma Convention (C, EMRPOLYPOLYLINE16);                --  wingdi.h:2930
   pragma Convention (C, EMRINVERTRGN);                     --  wingdi.h:2941
   pragma Convention (C, EMRFILLRGN);                       --  wingdi.h:2950
   pragma Convention (C, EMRFRAMERGN);                      --  wingdi.h:2959
   pragma Convention (C, EMREXTSELECTCLIPRGN);              --  wingdi.h:2969
   pragma Convention (C, EMREXTTEXTOUTA);                   --  wingdi.h:2977
   pragma Convention (C, EMRPOLYTEXTOUTA);                  --  wingdi.h:2989
   pragma Convention (C, EMRBITBLT);                        --  wingdi.h:3002
   pragma Convention (C, EMRSTRETCHBLT);                    --  wingdi.h:3023
   pragma Convention (C, EMRMASKBLT);                       --  wingdi.h:3046
   pragma Convention (C, EMRPLGBLT);                        --  wingdi.h:3074
   pragma Convention (C, EMRSETDIBITSTODEVICE);             --  wingdi.h:3100
   pragma Convention (C, EMRSTRETCHDIBITS);                 --  wingdi.h:3119
   pragma Convention (C, EMREXTCREATEFONTINDIRECTW);        --  wingdi.h:3139
   pragma Convention (C, EMRCREATEPALETTE);                 --  wingdi.h:3146
   pragma Convention (C, EMRCREATEPEN);                     --  wingdi.h:3155
   pragma Convention (C, EMREXTCREATEPEN);                  --  wingdi.h:3162
   pragma Convention (C, EMRCREATEBRUSHINDIRECT);           --  wingdi.h:3175
   pragma Convention (C, EMRCREATEMONOBRUSH);               --  wingdi.h:3183
   pragma Convention (C, EMRCREATEDIBPATTERNBRUSHPT);       --  wingdi.h:3194
   pragma Convention (C, EMRFORMAT);                        --  wingdi.h:3207

   function To_Handle is new Ada.Unchecked_Conversion
     (DWORD, Win32.Winnt.HANDLE);

   HGDI_ERROR : constant Win32.Winnt.HANDLE := To_Handle (16#ffff_ffff#);
   --  wingdi.h:84

   pragma Inline (MAKEROP4);
   pragma Inline (MAKEPOINTS);
   pragma Inline (RGB);
   pragma Inline (PALETTERGB);
   pragma Inline (PALETTEINDEX);
   pragma Inline (GetRValue);
   pragma Inline (GetGValue);
   pragma Inline (GetBValue);

   pragma Import (Stdcall, AddFontResourceA, "AddFontResourceA");
   --  wingdi.h:1799
   pragma Import (Stdcall, AddFontResourceW, "AddFontResourceW");
   --  wingdi.h:1800
   pragma Import (Stdcall, AnimatePalette, "AnimatePalette");
   --  wingdi.h:1807
   pragma Import (Stdcall, Arc, "Arc");
   --  wingdi.h:1808
   pragma Import (Stdcall, BitBlt, "BitBlt");
   --  wingdi.h:1809
   pragma Import (Stdcall, CancelDC, "CancelDC");
   --  wingdi.h:1810
   pragma Import (Stdcall, Chord, "Chord");
   --  wingdi.h:1811
   pragma Import (Stdcall, ChoosePixelFormat, "ChoosePixelFormat");
   --  wingdi.h:1812
   pragma Import (Stdcall, CloseMetaFile, "CloseMetaFile");
   --  wingdi.h:1813
   pragma Import (Stdcall, CombineRgn, "CombineRgn");
   --  wingdi.h:1814
   pragma Import (Stdcall, CopyMetaFileA, "CopyMetaFileA");
   --  wingdi.h:1815
   pragma Import (Stdcall, CopyMetaFileW, "CopyMetaFileW");
   --  wingdi.h:1816
   pragma Import (Stdcall, CreateBitmap, "CreateBitmap");
   --  wingdi.h:1822
   pragma Import (Stdcall, CreateBitmapIndirect, "CreateBitmapIndirect");
   --  wingdi.h:1823
   pragma Import (Stdcall, CreateBrushIndirect, "CreateBrushIndirect");
   --  wingdi.h:1824
   pragma Import (Stdcall, CreateCompatibleBitmap, "CreateCompatibleBitmap");
   --  wingdi.h:1825
   pragma Import (Stdcall, CreateDiscardableBitmap, "CreateDiscardableBitmap");
   --  wingdi.h:1826
   pragma Import (Stdcall, CreateCompatibleDC, "CreateCompatibleDC");
   --  wingdi.h:1827
   pragma Import (Stdcall, CreateDCA, "CreateDCA");
   --  wingdi.h:1828
   pragma Import (Stdcall, CreateDCW, "CreateDCW");
   --  wingdi.h:1829
   pragma Import (Stdcall, CreateDIBitmap, "CreateDIBitmap");
   --  wingdi.h:1835
   pragma Import (Stdcall, CreateDIBPatternBrush, "CreateDIBPatternBrush");
   --  wingdi.h:1836
   pragma Import (Stdcall, CreateDIBPatternBrushPt, "CreateDIBPatternBrushPt");
   --  wingdi.h:1837
   pragma Import (Stdcall, CreateEllipticRgn, "CreateEllipticRgn");
   --  wingdi.h:1838
   pragma Import (Stdcall, CreateEllipticRgnIndirect,
                    "CreateEllipticRgnIndirect");
   --  wingdi.h:1839
   pragma Import (Stdcall, CreateFontIndirectA, "CreateFontIndirectA");
   --  wingdi.h:1840
   pragma Import (Stdcall, CreateFontIndirectW, "CreateFontIndirectW");
   --  wingdi.h:1841
   pragma Import (Stdcall, CreateFontA, "CreateFontA");
   --  wingdi.h:1847
   pragma Import (Stdcall, CreateFontW, "CreateFontW");
   --  wingdi.h:1850
   pragma Import (Stdcall, CreateHatchBrush, "CreateHatchBrush");
   --  wingdi.h:1859
   pragma Import (Stdcall, CreateICA, "CreateICA");
   --  wingdi.h:1860
   pragma Import (Stdcall, CreateICW, "CreateICW");
   --  wingdi.h:1861
   pragma Import (Stdcall, CreateMetaFileA, "CreateMetaFileA");
   --  wingdi.h:1867
   pragma Import (Stdcall, CreateMetaFileW, "CreateMetaFileW");
   --  wingdi.h:1868
   pragma Import (Stdcall, CreatePalette, "CreatePalette");
   --  wingdi.h:1874
   pragma Import (Stdcall, CreatePen, "CreatePen");
   --  wingdi.h:1875
   pragma Import (Stdcall, CreatePenIndirect, "CreatePenIndirect");
   --  wingdi.h:1876
   pragma Import (Stdcall, CreatePolyPolygonRgn, "CreatePolyPolygonRgn");
   --  wingdi.h:1877
   pragma Import (Stdcall, CreatePatternBrush, "CreatePatternBrush");
   --  wingdi.h:1878
   pragma Import (Stdcall, CreateRectRgn, "CreateRectRgn");
   --  wingdi.h:1879
   pragma Import (Stdcall, CreateRectRgnIndirect, "CreateRectRgnIndirect");
   --  wingdi.h:1880
   pragma Import (Stdcall, CreateRoundRectRgn, "CreateRoundRectRgn");
   --  wingdi.h:1881
   pragma Import (Stdcall, CreateScalableFontResourceA,
                    "CreateScalableFontResourceA");
   --  wingdi.h:1882
   pragma Import (Stdcall, CreateScalableFontResourceW,
                    "CreateScalableFontResourceW");        --  wingdi.h:1883
   pragma Import (Stdcall, CreateSolidBrush, "CreateSolidBrush");
   --  wingdi.h:1889
   pragma Import (Stdcall, DeleteDC, "DeleteDC");
   --  wingdi.h:1891
   pragma Import (Stdcall, DeleteMetaFile, "DeleteMetaFile");
   --  wingdi.h:1892
   pragma Import (Stdcall, DeleteObject, "DeleteObject");
   --  wingdi.h:1893
   pragma Import (Stdcall, DescribePixelFormat, "DescribePixelFormat");
   --  wingdi.h:1894
   pragma Import (Stdcall, DeviceCapabilitiesA, "DeviceCapabilitiesA");
   --  wingdi.h:1940
   pragma Import (Stdcall, DeviceCapabilitiesW, "DeviceCapabilitiesW");
   --  wingdi.h:1942
   pragma Import (Stdcall, DrawEscape, "DrawEscape");
   --  wingdi.h:1950
   pragma Import (Stdcall, Ellipse, "Ellipse");
   --  wingdi.h:1951
   pragma Import (Stdcall, EnumFontFamiliesA, "EnumFontFamiliesA");
   --  wingdi.h:1954
   pragma Import (Stdcall, EnumFontFamiliesW, "EnumFontFamiliesW");
   --  wingdi.h:1955
   pragma Import (Stdcall, EnumFontsA, "EnumFontsA");
   --  wingdi.h:1961
   pragma Import (Stdcall, EnumFontsW, "EnumFontsW");
   --  wingdi.h:1962
   pragma Import (Stdcall, EnumObjects, "EnumObjects");
   --  wingdi.h:1970
   pragma Import (Stdcall, EqualRgn, "EqualRgn");
   --  wingdi.h:1976
   pragma Import (Stdcall, Escape, "Escape");
   --  wingdi.h:1977
   pragma Import (Stdcall, ExtEscape, "ExtEscape");
   --  wingdi.h:1978
   pragma Import (Stdcall, ExcludeClipRect, "ExcludeClipRect");
   --  wingdi.h:1979
   pragma Import (Stdcall, ExtCreateRegion, "ExtCreateRegion");
   --  wingdi.h:1980
   pragma Import (Stdcall, ExtFloodFill, "ExtFloodFill");
   --  wingdi.h:1981
   pragma Import (Stdcall, FillRgn, "FillRgn");
   --  wingdi.h:1982
   pragma Import (Stdcall, FloodFill, "FloodFill");
   --  wingdi.h:1983
   pragma Import (Stdcall, FrameRgn, "FrameRgn");
   --  wingdi.h:1984
   pragma Import (Stdcall, GetROP2, "GetROP2");
   --  wingdi.h:1985
   pragma Import (Stdcall, GetAspectRatioFilterEx, "GetAspectRatioFilterEx");
   --  wingdi.h:1986
   pragma Import (Stdcall, GetBkColor, "GetBkColor");
   --  wingdi.h:1987
   pragma Import (Stdcall, GetBkMode, "GetBkMode");
   --  wingdi.h:1988
   pragma Import (Stdcall, GetBitmapBits, "GetBitmapBits");
   --  wingdi.h:1989
   pragma Import (Stdcall, GetBitmapDimensionEx, "GetBitmapDimensionEx");
   --  wingdi.h:1990
   pragma Import (Stdcall, GetBoundsRect, "GetBoundsRect");
   --  wingdi.h:1991
   pragma Import (Stdcall, GetBrushOrgEx, "GetBrushOrgEx");
   --  wingdi.h:1993
   pragma Import (Stdcall, GetCharWidthA, "GetCharWidthA");
   --  wingdi.h:1995
   pragma Import (Stdcall, GetCharWidthW, "GetCharWidthW");
   --  wingdi.h:1996
   pragma Import (Stdcall, GetCharWidth32A, "GetCharWidth32A");
   --  wingdi.h:2002
   pragma Import (Stdcall, GetCharWidth32W, "GetCharWidth32W");
   --  wingdi.h:2003
   pragma Import (Stdcall, GetCharWidthFloatA, "GetCharWidthFloatA");
   --  wingdi.h:2009
   pragma Import (Stdcall, GetCharWidthFloatW, "GetCharWidthFloatW");
   --  wingdi.h:2010
   pragma Import (Stdcall, GetCharABCWidthsA, "GetCharABCWidthsA");
   --  wingdi.h:2017
   pragma Import (Stdcall, GetCharABCWidthsW, "GetCharABCWidthsW");
   --  wingdi.h:2018
   pragma Import (Stdcall, GetCharABCWidthsFloatA, "GetCharABCWidthsFloatA");
   --  wingdi.h:2024
   pragma Import (Stdcall, GetCharABCWidthsFloatW, "GetCharABCWidthsFloatW");
   --  wingdi.h:2025
   pragma Import (Stdcall, GetClipBox, "GetClipBox");
   --  wingdi.h:2032
   pragma Import (Stdcall, GetClipRgn, "GetClipRgn");
   --  wingdi.h:2033
   pragma Import (Stdcall, GetMetaRgn, "GetMetaRgn");
   --  wingdi.h:2034
   pragma Import (Stdcall, GetCurrentObject, "GetCurrentObject");
   --  wingdi.h:2035
   pragma Import (Stdcall, GetCurrentPositionEx, "GetCurrentPositionEx");
   --  wingdi.h:2036
   pragma Import (Stdcall, GetDeviceCaps, "GetDeviceCaps");
   --  wingdi.h:2037
   pragma Import (Stdcall, GetDIBits, "GetDIBits");
   --  wingdi.h:2038
   pragma Import (Stdcall, GetFontData, "GetFontData");
   --  wingdi.h:2039
   pragma Import (Stdcall, GetGlyphOutlineA, "GetGlyphOutlineA");
   --  wingdi.h:2040
   pragma Import (Stdcall, GetGlyphOutlineW, "GetGlyphOutlineW");
   --  wingdi.h:2041
   pragma Import (Stdcall, GetGraphicsMode, "GetGraphicsMode");
   --  wingdi.h:2047
   pragma Import (Stdcall, GetMapMode, "GetMapMode");
   --  wingdi.h:2048
   pragma Import (Stdcall, GetMetaFileBitsEx, "GetMetaFileBitsEx");
   --  wingdi.h:2049
   pragma Import (Stdcall, GetMetaFileA, "GetMetaFileA");
   --  wingdi.h:2050
   pragma Import (Stdcall, GetMetaFileW, "GetMetaFileW");
   --  wingdi.h:2051
   pragma Import (Stdcall, GetNearestColor, "GetNearestColor");
   --  wingdi.h:2057
   pragma Import (Stdcall, GetNearestPaletteIndex, "GetNearestPaletteIndex");
   --  wingdi.h:2058
   pragma Import (Stdcall, GetObjectType, "GetObjectType");
   --  wingdi.h:2059
   pragma Import (Stdcall, GetOutlineTextMetricsA, "GetOutlineTextMetricsA");
   --  wingdi.h:2063
   pragma Import (Stdcall, GetOutlineTextMetricsW, "GetOutlineTextMetricsW");
   --  wingdi.h:2064
   pragma Import (Stdcall, GetPaletteEntries, "GetPaletteEntries");
   --  wingdi.h:2073
   pragma Import (Stdcall, GetPixel, "GetPixel");
   --  wingdi.h:2074
   pragma Import (Stdcall, GetPixelFormat, "GetPixelFormat");
   --  wingdi.h:2075
   pragma Import (Stdcall, GetPolyFillMode, "GetPolyFillMode");
   --  wingdi.h:2076
   pragma Import (Stdcall, GetRasterizerCaps, "GetRasterizerCaps");
   --  wingdi.h:2077
   pragma Import (Stdcall, GetRegionData, "GetRegionData");
   --  wingdi.h:2078
   pragma Import (Stdcall, GetRgnBox, "GetRgnBox");
   --  wingdi.h:2079
   pragma Import (Stdcall, GetStockObject, "GetStockObject");
   --  wingdi.h:2080
   pragma Import (Stdcall, GetStretchBltMode, "GetStretchBltMode");
   --  wingdi.h:2081
   pragma Import (Stdcall, GetSystemPaletteEntries, "GetSystemPaletteEntries");
   --  wingdi.h:2082
   pragma Import (Stdcall, GetSystemPaletteUse, "GetSystemPaletteUse");
   --  wingdi.h:2083
   pragma Import (Stdcall, GetTextCharacterExtra, "GetTextCharacterExtra");
   --  wingdi.h:2084
   pragma Import (Stdcall, GetTextAlign, "GetTextAlign");
   --  wingdi.h:2085
   pragma Import (Stdcall, GetTextColor, "GetTextColor");
   --  wingdi.h:2086
   pragma Import (Stdcall, GetTextExtentPointA, "GetTextExtentPointA");
   --  wingdi.h:2088
   pragma Import (Stdcall, GetTextExtentPointW, "GetTextExtentPointW");
   --  wingdi.h:2094
   pragma Import (Stdcall, GetTextExtentPoint32A, "GetTextExtentPoint32A");
   --  wingdi.h:2106
   pragma Import (Stdcall, GetTextExtentPoint32W, "GetTextExtentPoint32W");
   --  wingdi.h:2112
   pragma Import (Stdcall, GetTextExtentExPointA, "GetTextExtentExPointA");
   --  wingdi.h:2124
   pragma Import (Stdcall, GetTextExtentExPointW, "GetTextExtentExPointW");
   --  wingdi.h:2133
   pragma Import (Stdcall, GetViewportExtEx, "GetViewportExtEx");
   --  wingdi.h:2149
   pragma Import (Stdcall, GetViewportOrgEx, "GetViewportOrgEx");
   --  wingdi.h:2150
   pragma Import (Stdcall, GetWindowExtEx, "GetWindowExtEx");
   --  wingdi.h:2151
   pragma Import (Stdcall, GetWindowOrgEx, "GetWindowOrgEx");
   --  wingdi.h:2152
   pragma Import (Stdcall, IntersectClipRect, "IntersectClipRect");
   --  wingdi.h:2154
   pragma Import (Stdcall, InvertRgn, "InvertRgn");
   --  wingdi.h:2155
   pragma Import (Stdcall, LineDDA, "LineDDA");
   --  wingdi.h:2156
   pragma Import (Stdcall, LineTo, "LineTo");
   --  wingdi.h:2157
   pragma Import (Stdcall, MaskBlt, "MaskBlt");
   --  wingdi.h:2158
   pragma Import (Stdcall, PlgBlt, "PlgBlt");
   --  wingdi.h:2160
   pragma Import (Stdcall, OffsetClipRgn, "OffsetClipRgn");
   --  wingdi.h:2163
   pragma Import (Stdcall, OffsetRgn, "OffsetRgn");
   --  wingdi.h:2164
   pragma Import (Stdcall, PatBlt, "PatBlt");
   --  wingdi.h:2165
   pragma Import (Stdcall, Pie, "Pie");
   --  wingdi.h:2166
   pragma Import (Stdcall, PlayMetaFile, "PlayMetaFile");
   --  wingdi.h:2167
   pragma Import (Stdcall, PaintRgn, "PaintRgn");
   --  wingdi.h:2168
   pragma Import (Stdcall, PolyPolygon, "PolyPolygon");
   --  wingdi.h:2169
   pragma Import (Stdcall, PtInRegion, "PtInRegion");
   --  wingdi.h:2170
   pragma Import (Stdcall, PtVisible, "PtVisible");
   --  wingdi.h:2171
   pragma Import (Stdcall, RectInRegion, "RectInRegion");
   --  wingdi.h:2172
   pragma Import (Stdcall, RectVisible, "RectVisible");
   --  wingdi.h:2173
   pragma Import (Stdcall, Rectangle, "Rectangle");
   --  wingdi.h:2174
   pragma Import (Stdcall, RestoreDC, "RestoreDC");
   --  wingdi.h:2175
   pragma Import (Stdcall, ResetDCA, "ResetDCA");
   --  wingdi.h:2176
   pragma Import (Stdcall, ResetDCW, "ResetDCW");
   --  wingdi.h:2177
   pragma Import (Stdcall, RealizePalette, "RealizePalette");
   --  wingdi.h:2183
   pragma Import (Stdcall, RemoveFontResourceA, "RemoveFontResourceA");
   --  wingdi.h:2184
   pragma Import (Stdcall, RemoveFontResourceW, "RemoveFontResourceW");
   --  wingdi.h:2185
   pragma Import (Stdcall, RoundRect, "RoundRect");
   --  wingdi.h:2191
   pragma Import (Stdcall, ResizePalette, "ResizePalette");
   --  wingdi.h:2192
   pragma Import (Stdcall, SaveDC, "SaveDC");
   --  wingdi.h:2194
   pragma Import (Stdcall, SelectClipRgn, "SelectClipRgn");
   --  wingdi.h:2195
   pragma Import (Stdcall, ExtSelectClipRgn, "ExtSelectClipRgn");
   --  wingdi.h:2196
   pragma Import (Stdcall, SetMetaRgn, "SetMetaRgn");
   --  wingdi.h:2197
   pragma Import (Stdcall, SelectObject, "SelectObject");
   --  wingdi.h:2198
   pragma Import (Stdcall, SelectPalette, "SelectPalette");
   --  wingdi.h:2199
   pragma Import (Stdcall, SetBkColor, "SetBkColor");
   --  wingdi.h:2200
   pragma Import (Stdcall, SetBkMode, "SetBkMode");
   --  wingdi.h:2201
   pragma Import (Stdcall, SetBitmapBits, "SetBitmapBits");
   --  wingdi.h:2202
   pragma Import (Stdcall, SetBoundsRect, "SetBoundsRect");
   --  wingdi.h:2204
   pragma Import (Stdcall, SetDIBits, "SetDIBits");
   --  wingdi.h:2205
   pragma Import (Stdcall, SetDIBitsToDevice, "SetDIBitsToDevice");
   --  wingdi.h:2206
   pragma Import (Stdcall, SetMapperFlags, "SetMapperFlags");
   --  wingdi.h:2208
   pragma Import (Stdcall, SetGraphicsMode, "SetGraphicsMode");
   --  wingdi.h:2209
   pragma Import (Stdcall, SetMapMode, "SetMapMode");
   --  wingdi.h:2210
   pragma Import (Stdcall, SetMetaFileBitsEx, "SetMetaFileBitsEx");
   --  wingdi.h:2211
   pragma Import (Stdcall, SetPaletteEntries, "SetPaletteEntries");
   --  wingdi.h:2212
   pragma Import (Stdcall, SetPixel, "SetPixel");
   --  wingdi.h:2213
   pragma Import (Stdcall, SetPixelV, "SetPixelV");
   --  wingdi.h:2214
   pragma Import (Stdcall, SetPixelFormat, "SetPixelFormat");
   --  wingdi.h:2215
   pragma Import (Stdcall, SetPolyFillMode, "SetPolyFillMode");
   --  wingdi.h:2216
   pragma Import (Stdcall, StretchBlt, "StretchBlt");
   --  wingdi.h:2217
   pragma Import (Stdcall, SetRectRgn, "SetRectRgn");
   --  wingdi.h:2218
   pragma Import (Stdcall, StretchDIBits, "StretchDIBits");
   --  wingdi.h:2219
   pragma Import (Stdcall, SetROP2, "SetROP2");
   --  wingdi.h:2221
   pragma Import (Stdcall, SetStretchBltMode, "SetStretchBltMode");
   --  wingdi.h:2222
   pragma Import (Stdcall, SetSystemPaletteUse, "SetSystemPaletteUse");
   --  wingdi.h:2223
   pragma Import (Stdcall, SetTextCharacterExtra, "SetTextCharacterExtra");
   --  wingdi.h:2224
   pragma Import (Stdcall, SetTextColor, "SetTextColor");
   --  wingdi.h:2225
   pragma Import (Stdcall, SetTextAlign, "SetTextAlign");
   --  wingdi.h:2226
   pragma Import (Stdcall, SetTextJustification, "SetTextJustification");
   --  wingdi.h:2227
   pragma Import (Stdcall, UpdateColors, "UpdateColors");
   --  wingdi.h:2228
   pragma Import (Stdcall, PlayMetaFileRecord, "PlayMetaFileRecord");
   --  wingdi.h:2232
   pragma Import (Stdcall, EnumMetaFile, "EnumMetaFile");
   --  wingdi.h:2234
   pragma Import (Stdcall, CloseEnhMetaFile, "CloseEnhMetaFile");
   --  wingdi.h:2240
   pragma Import (Stdcall, CopyEnhMetaFileA, "CopyEnhMetaFileA");
   --  wingdi.h:2241
   pragma Import (Stdcall, CopyEnhMetaFileW, "CopyEnhMetaFileW");
   --  wingdi.h:2242
   pragma Import (Stdcall, CreateEnhMetaFileA, "CreateEnhMetaFileA");
   --  wingdi.h:2248
   pragma Import (Stdcall, CreateEnhMetaFileW, "CreateEnhMetaFileW");
   --  wingdi.h:2249
   pragma Import (Stdcall, DeleteEnhMetaFile, "DeleteEnhMetaFile");
   --  wingdi.h:2255
   pragma Import (Stdcall, EnumEnhMetaFile, "EnumEnhMetaFile");
   --  wingdi.h:2256
   pragma Import (Stdcall, GetEnhMetaFileA, "GetEnhMetaFileA");
   --  wingdi.h:2258
   pragma Import (Stdcall, GetEnhMetaFileW, "GetEnhMetaFileW");
   --  wingdi.h:2259
   pragma Import (Stdcall, GetEnhMetaFileBits, "GetEnhMetaFileBits");
   --  wingdi.h:2265
   pragma Import (Stdcall, GetEnhMetaFileDescriptionA,
                    "GetEnhMetaFileDescriptionA");
   --  wingdi.h:2266
   pragma Import (Stdcall, GetEnhMetaFileDescriptionW,
                    "GetEnhMetaFileDescriptionW");
   --  wingdi.h:2267
   pragma Import (Stdcall, GetEnhMetaFileHeader, "GetEnhMetaFileHeader");
   --  wingdi.h:2273
   pragma Import (Stdcall, GetEnhMetaFilePaletteEntries,
                    "GetEnhMetaFilePaletteEntries");       --  wingdi.h:2274
   pragma Import (Stdcall, GetWinMetaFileBits, "GetWinMetaFileBits");
   --  wingdi.h:2275
   pragma Import (Stdcall, PlayEnhMetaFile, "PlayEnhMetaFile");
   --  wingdi.h:2276
   pragma Import (Stdcall, PlayEnhMetaFileRecord, "PlayEnhMetaFileRecord");
   --  wingdi.h:2277
   pragma Import (Stdcall, SetEnhMetaFileBits, "SetEnhMetaFileBits");
   --  wingdi.h:2278
   pragma Import (Stdcall, SetWinMetaFileBits, "SetWinMetaFileBits");
   --  wingdi.h:2279
   pragma Import (Stdcall, GdiComment, "GdiComment");
   --  wingdi.h:2280
   pragma Import (Stdcall, GetTextMetricsA, "GetTextMetricsA");
   --  wingdi.h:2286
   pragma Import (Stdcall, GetTextMetricsW, "GetTextMetricsW");
   --  wingdi.h:2287
   pragma Import (Stdcall, AngleArc, "AngleArc");
   --  wingdi.h:2306
   pragma Import (Stdcall, PolyPolyline, "PolyPolyline");
   --  wingdi.h:2307
   pragma Import (Stdcall, GetWorldTransform, "GetWorldTransform");
   --  wingdi.h:2308
   pragma Import (Stdcall, SetWorldTransform, "SetWorldTransform");
   --  wingdi.h:2309
   pragma Import (Stdcall, ModifyWorldTransform, "ModifyWorldTransform");
   --  wingdi.h:2310
   pragma Import (Stdcall, CombineTransform, "CombineTransform");
   --  wingdi.h:2311
   pragma Import (Stdcall, CreateDIBSection, "CreateDIBSection");
   --  wingdi.h:2312
   pragma Import (Stdcall, GetDIBColorTable, "GetDIBColorTable");
   --  wingdi.h:2313
   pragma Import (Stdcall, SetDIBColorTable, "SetDIBColorTable");
   --  wingdi.h:2314
   pragma Import (Stdcall, SetColorAdjustment, "SetColorAdjustment");
   --  wingdi.h:2366
   pragma Import (Stdcall, GetColorAdjustment, "GetColorAdjustment");
   --  wingdi.h:2367
   pragma Import (Stdcall, CreateHalftonePalette, "CreateHalftonePalette");
   --  wingdi.h:2368
   pragma Import (Stdcall, StartDocA, "StartDocA");
   --  wingdi.h:2395
   pragma Import (Stdcall, StartDocW, "StartDocW");
   --  wingdi.h:2396
   pragma Import (Stdcall, EndDoc, "EndDoc");
   --  wingdi.h:2402
   pragma Import (Stdcall, StartPage, "StartPage");
   --  wingdi.h:2403
   pragma Import (Stdcall, EndPage, "EndPage");
   --  wingdi.h:2404
   pragma Import (Stdcall, AbortDoc, "AbortDoc");
   --  wingdi.h:2405
   pragma Import (Stdcall, SetAbortProc, "SetAbortProc");
   --  wingdi.h:2406
   pragma Import (Stdcall, AbortPath_func, "AbortPath");
   --  wingdi.h:2408
   pragma Import (Stdcall, ArcTo, "ArcTo");
   --  wingdi.h:2409
   pragma Import (Stdcall, BeginPath, "BeginPath");
   --  wingdi.h:2410
   pragma Import (Stdcall, CloseFigure, "CloseFigure");
   --  wingdi.h:2411
   pragma Import (Stdcall, EndPath, "EndPath");
   --  wingdi.h:2412
   pragma Import (Stdcall, FillPath, "FillPath");
   --  wingdi.h:2413
   pragma Import (Stdcall, FlattenPath, "FlattenPath");
   --  wingdi.h:2414
   pragma Import (Stdcall, GetPath, "GetPath");
   --  wingdi.h:2415
   pragma Import (Stdcall, PathToRegion, "PathToRegion");
   --  wingdi.h:2416
   pragma Import (Stdcall, PolyDraw, "PolyDraw");
   --  wingdi.h:2417
   pragma Import (Stdcall, SelectClipPath, "SelectClipPath");
   --  wingdi.h:2418
   pragma Import (Stdcall, SetArcDirection, "SetArcDirection");
   --  wingdi.h:2419
   pragma Import (Stdcall, SetMiterLimit, "SetMiterLimit");
   --  wingdi.h:2420
   pragma Import (Stdcall, StrokeAndFillPath, "StrokeAndFillPath");
   --  wingdi.h:2421
   pragma Import (Stdcall, StrokePath, "StrokePath");
   --  wingdi.h:2422
   pragma Import (Stdcall, WidenPath, "WidenPath");
   --  wingdi.h:2423
   pragma Import (Stdcall, ExtCreatePen, "ExtCreatePen");
   --  wingdi.h:2424
   pragma Import (Stdcall, GetMiterLimit, "GetMiterLimit");
   --  wingdi.h:2425
   pragma Import (Stdcall, GetArcDirection, "GetArcDirection");
   --  wingdi.h:2426
   pragma Import (Stdcall, GetObjectA, "GetObjectA");
   --  wingdi.h:2428
   pragma Import (Stdcall, GetObjectW, "GetObjectW");
   --  wingdi.h:2429
   pragma Import (Stdcall, MoveToEx, "MoveToEx");
   --  wingdi.h:2435
   pragma Import (Stdcall, TextOutA, "TextOutA");
   --  wingdi.h:2436
   pragma Import (Stdcall, TextOutW, "TextOutW");
   --  wingdi.h:2437
   pragma Import (Stdcall, ExtTextOutA, "ExtTextOutA");
   --  wingdi.h:2443
   pragma Import (Stdcall, ExtTextOutW, "ExtTextOutW");
   --  wingdi.h:2444
   pragma Import (Stdcall, PolyTextOutA, "PolyTextOutA");
   --  wingdi.h:2450
   pragma Import (Stdcall, PolyTextOutW, "PolyTextOutW");
   --  wingdi.h:2451
   pragma Import (Stdcall, CreatePolygonRgn, "CreatePolygonRgn");
   --  wingdi.h:2458
   pragma Import (Stdcall, DPTOLP, "DPtoLP");
   --  wingdi.h:2459
   pragma Import (Stdcall, LPTODP, "LPtoDP");
   --  wingdi.h:2460
   pragma Import (Stdcall, Polygon, "Polygon");
   --  wingdi.h:2461
   pragma Import (Stdcall, Polyline, "Polyline");
   --  wingdi.h:2462
   pragma Import (Stdcall, PolyBezier, "PolyBezier");
   --  wingdi.h:2464
   pragma Import (Stdcall, PolyBezierTo, "PolyBezierTo");
   --  wingdi.h:2465
   pragma Import (Stdcall, PolylineTo, "PolylineTo");
   --  wingdi.h:2466
   pragma Import (Stdcall, SetViewportExtEx, "SetViewportExtEx");
   --  wingdi.h:2468
   pragma Import (Stdcall, SetViewportOrgEx, "SetViewportOrgEx");
   --  wingdi.h:2469
   pragma Import (Stdcall, SetWindowExtEx, "SetWindowExtEx");
   --  wingdi.h:2470
   pragma Import (Stdcall, SetWindowOrgEx, "SetWindowOrgEx");
   --  wingdi.h:2471
   pragma Import (Stdcall, OffsetViewportOrgEx, "OffsetViewportOrgEx");
   --  wingdi.h:2473
   pragma Import (Stdcall, OffsetWindowOrgEx, "OffsetWindowOrgEx");
   --  wingdi.h:2474
   pragma Import (Stdcall, ScaleViewportExtEx, "ScaleViewportExtEx");
   --  wingdi.h:2475
   pragma Import (Stdcall, ScaleWindowExtEx, "ScaleWindowExtEx");
   --  wingdi.h:2476
   pragma Import (Stdcall, SetBitmapDimensionEx, "SetBitmapDimensionEx");
   --  wingdi.h:2477
   pragma Import (Stdcall, SetBrushOrgEx, "SetBrushOrgEx");
   --  wingdi.h:2478
   pragma Import (Stdcall, GetTextFaceA, "GetTextFaceA");
   --  wingdi.h:2480
   pragma Import (Stdcall, GetTextFaceW, "GetTextFaceW");
   --  wingdi.h:2481
   pragma Import (Stdcall, GetKerningPairsA, "GetKerningPairsA");
   --  wingdi.h:2496
   pragma Import (Stdcall, GetKerningPairsW, "GetKerningPairsW");
   --  wingdi.h:2497
   pragma Import (Stdcall, GetDCOrgEx, "GetDCOrgEx");
   --  wingdi.h:2504
   pragma Import (Stdcall, FixBrushOrgEx, "FixBrushOrgEx");
   --  wingdi.h:2505
   pragma Import (Stdcall, UnrealizeObject, "UnrealizeObject");
   --  wingdi.h:2506
   pragma Import (Stdcall, GdiFlush, "GdiFlush");
   --  wingdi.h:2508
   pragma Import (Stdcall, GdiSetBatchLimit, "GdiSetBatchLimit");
   --  wingdi.h:2509
   pragma Import (Stdcall, GdiGetBatchLimit, "GdiGetBatchLimit");
   --  wingdi.h:2510
   pragma Import (Stdcall, wglCreateContext, "wglCreateContext");
   --  wingdi.h:3229
   pragma Import (Stdcall, wglDeleteContext, "wglDeleteContext");
   --  wingdi.h:3230
   pragma Import (Stdcall, wglGetCurrentContext, "wglGetCurrentContext");
   --  wingdi.h:3231
   pragma Import (Stdcall, wglGetCurrentDC, "wglGetCurrentDC");
   --  wingdi.h:3232
   pragma Import (Stdcall, wglMakeCurrent, "wglMakeCurrent");
   --  wingdi.h:3233
   pragma Import (Stdcall, wglUseFontBitmapsA, "wglUseFontBitmapsA");
   --  wingdi.h:3234
   pragma Import (Stdcall, wglUseFontBitmapsW, "wglUseFontBitmapsW");
   --  wingdi.h:3235
   pragma Import (Stdcall, SwapBuffers, "SwapBuffers");
   --  wingdi.h:3241

end Win32.Wingdi;


