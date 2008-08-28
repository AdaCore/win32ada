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

with Win32.Gl;
with Win32.Windef;

package Win32.Glaux is

   AUX_RGB : constant := 0;                --  glaux.h:71
   AUX_RGBA : constant := 0;                --  glaux.h:72
   AUX_INDEX : constant := 1;                --  glaux.h:73
   AUX_SINGLE : constant := 0;                --  glaux.h:74
   AUX_DOUBLE : constant := 2;                --  glaux.h:75
   AUX_DIRECT : constant := 0;                --  glaux.h:76
   AUX_INDIRECT : constant := 4;                --  glaux.h:77
   AUX_ACCUM : constant := 8;                --  glaux.h:79
   AUX_ALPHA : constant := 16;               --  glaux.h:80
   AUX_DEPTH : constant := 32;               --  glaux.h:81
   AUX_STENCIL : constant := 64;               --  glaux.h:82
   AUX_AUX : constant := 128;              --  glaux.h:83
   AUX_DEPTH16 : constant := 256;              --  glaux.h:84
   AUX_FIXED_332_PAL : constant := 512;              --  glaux.h:85
   AUX_EXPOSE : constant := 1;                --  glaux.h:115
   AUX_CONFIG : constant := 2;                --  glaux.h:116
   AUX_DRAW : constant := 4;                --  glaux.h:117
   AUX_KEYEVENT : constant := 8;                --  glaux.h:118
   AUX_MOUSEDOWN : constant := 16;               --  glaux.h:119
   AUX_MOUSEUP : constant := 32;               --  glaux.h:120
   AUX_MOUSELOC : constant := 64;               --  glaux.h:121
   AUX_WINDOWX : constant := 0;                --  glaux.h:126
   AUX_WINDOWY : constant := 1;                --  glaux.h:127
   AUX_MOUSEX : constant := 0;                --  glaux.h:128
   AUX_MOUSEY : constant := 1;                --  glaux.h:129
   AUX_MOUSESTATUS : constant := 3;                --  glaux.h:130
   AUX_KEY : constant := 0;                --  glaux.h:131
   AUX_KEYSTATUS : constant := 1;                --  glaux.h:132
   AUX_LEFTBUTTON : constant := 1;                --  glaux.h:137
   AUX_RIGHTBUTTON : constant := 2;                --  glaux.h:138
   AUX_MIDDLEBUTTON : constant := 4;                --  glaux.h:139
   AUX_SHIFT : constant := 1;                --  glaux.h:140
   AUX_CONTROL : constant := 2;                --  glaux.h:141
   AUX_RETURN : constant := 16#d#;            --  glaux.h:146
   AUX_ESCAPE : constant := 16#1b#;           --  glaux.h:147
   AUX_SPACE : constant := 16#20#;           --  glaux.h:148
   AUX_LEFT : constant := 16#25#;           --  glaux.h:149
   AUX_UP : constant := 16#26#;           --  glaux.h:150
   AUX_RIGHT : constant := 16#27#;           --  glaux.h:151
   AUX_DOWN : constant := 16#28#;           --  glaux.h:152
   AUX_UC_A : constant := 65;               --  glaux.h:153
   AUX_UC_B : constant := 66;               --  glaux.h:154
   AUX_UC_C : constant := 67;               --  glaux.h:155
   AUX_UC_D : constant := 68;               --  glaux.h:156
   AUX_UC_E : constant := 69;               --  glaux.h:157
   AUX_UC_F : constant := 70;               --  glaux.h:158
   AUX_UC_G : constant := 71;               --  glaux.h:159
   AUX_UC_H : constant := 72;               --  glaux.h:160
   AUX_UC_I : constant := 73;               --  glaux.h:161
   AUX_UC_J : constant := 74;               --  glaux.h:162
   AUX_UC_K : constant := 75;               --  glaux.h:163
   AUX_UC_L : constant := 76;               --  glaux.h:164
   AUX_UC_M : constant := 77;               --  glaux.h:165
   AUX_UC_N : constant := 78;               --  glaux.h:166
   AUX_UC_O : constant := 79;               --  glaux.h:167
   AUX_UC_P : constant := 80;               --  glaux.h:168
   AUX_UC_Q : constant := 81;               --  glaux.h:169
   AUX_UC_R : constant := 82;               --  glaux.h:170
   AUX_UC_S : constant := 83;               --  glaux.h:171
   AUX_UC_T : constant := 84;               --  glaux.h:172
   AUX_UC_U : constant := 85;               --  glaux.h:173
   AUX_UC_V : constant := 86;               --  glaux.h:174
   AUX_UC_W : constant := 87;               --  glaux.h:175
   AUX_UC_X : constant := 88;               --  glaux.h:176
   AUX_UC_Y : constant := 89;               --  glaux.h:177
   AUX_UC_Z : constant := 90;               --  glaux.h:178
   AUX_a : constant := 97;               --  glaux.h:179
   AUX_b : constant := 98;               --  glaux.h:180
   AUX_c : constant := 99;               --  glaux.h:181
   AUX_d : constant := 100;              --  glaux.h:182
   AUX_e : constant := 101;              --  glaux.h:183
   AUX_f : constant := 102;              --  glaux.h:184
   AUX_g : constant := 103;              --  glaux.h:185
   AUX_h : constant := 104;              --  glaux.h:186
   AUX_i : constant := 105;              --  glaux.h:187
   AUX_j : constant := 106;              --  glaux.h:188
   AUX_k : constant := 107;              --  glaux.h:189
   AUX_l : constant := 108;              --  glaux.h:190
   AUX_m : constant := 109;              --  glaux.h:191
   AUX_n : constant := 110;              --  glaux.h:192
   AUX_o : constant := 111;              --  glaux.h:193
   AUX_p : constant := 112;              --  glaux.h:194
   AUX_q : constant := 113;              --  glaux.h:195
   AUX_r : constant := 114;              --  glaux.h:196
   AUX_s : constant := 115;              --  glaux.h:197
   AUX_t : constant := 116;              --  glaux.h:198
   AUX_u : constant := 117;              --  glaux.h:199
   AUX_v : constant := 118;              --  glaux.h:200
   AUX_w : constant := 119;              --  glaux.h:201
   AUX_x : constant := 120;              --  glaux.h:202
   AUX_y : constant := 121;              --  glaux.h:203
   AUX_z : constant := 122;              --  glaux.h:204
   AUX_0 : constant := 48;               --  glaux.h:205
   AUX_1 : constant := 49;               --  glaux.h:206
   AUX_2 : constant := 50;               --  glaux.h:207
   AUX_3 : constant := 51;               --  glaux.h:208
   AUX_4 : constant := 52;               --  glaux.h:209
   AUX_5 : constant := 53;               --  glaux.h:210
   AUX_6 : constant := 54;               --  glaux.h:211
   AUX_7 : constant := 55;               --  glaux.h:212
   AUX_8 : constant := 56;               --  glaux.h:213
   AUX_9 : constant := 57;               --  glaux.h:214
   AUX_FD : constant := 1;                --  glaux.h:219
   AUX_COLORMAP : constant := 3;                --  glaux.h:220
   AUX_GREYSCALEMAP : constant := 4;                --  glaux.h:221
   AUX_FOGMAP : constant := 5;                --  glaux.h:222
   AUX_ONECOLOR : constant := 6;                --  glaux.h:223
   AUX_BLACK : constant := 0;                --  glaux.h:229
   AUX_RED : constant := 13;               --  glaux.h:230
   AUX_GREEN : constant := 14;               --  glaux.h:231
   AUX_YELLOW : constant := 15;               --  glaux.h:232
   AUX_BLUE : constant := 16;               --  glaux.h:233
   AUX_MAGENTA : constant := 17;               --  glaux.h:234
   AUX_CYAN : constant := 18;               --  glaux.h:235
   AUX_WHITE : constant := 19;               --  glaux.h:236

   type enum_anonymous2_t is ( --  glaux.h:363
     AUX_USE_ID,                                         --  glaux.h:360
     AUX_EXACT_MATCH,                                    --  glaux.h:361
     AUX_MINIMUM_CRITERIA                                --  glaux.h:363
                             );
   for enum_anonymous2_t use ( --  glaux.h:363
      AUX_USE_ID => 1,                                    --  glaux.h:360
      AUX_EXACT_MATCH => 2,                               --  glaux.h:361
      AUX_MINIMUM_CRITERIA => 3                           --  glaux.h:363
                             );
   for enum_anonymous2_t'Size use 32;                      --  glaux.h:363

   type AUX_EVENTREC;                                      --  glaux.h:107
   type AUX_RGBImageRec;                                   --  glaux.h:247

   type a_AUX_RGBImageRec_t is access all AUX_RGBImageRec; --  glaux.h:303

   type AUX_EVENTREC is                                    --  glaux.h:107
      record
         event : Win32.Gl.GLint;                          --  glaux.h:108
         data : Win32.INT_Array (0 .. 3);                   --  glaux.h:109
      end record;

   type AUX_RGBImageRec is                                 --  glaux.h:247
      record
         sizeX : Win32.Gl.GLint;                          --  glaux.h:248
         sizeY : Win32.Gl.GLint;                          --  glaux.h:248
         data : Win32.PUCHAR;                            --  glaux.h:249
      end record;

   type AUXMAINPROC is access procedure;                  --  glaux.h:272
   pragma Convention (Stdcall, AUXMAINPROC);
   type AUXEXPOSEPROC is access procedure
     (p1 : Win32.INT;
      p2 : Win32.INT);                             --  glaux.h:275
   pragma Convention (Stdcall, AUXEXPOSEPROC);
   type AUXRESHAPEPROC is access procedure
     (p1 : Win32.Gl.GLsizei;
      p2 : Win32.Gl.GLsizei);                      --  glaux.h:278
   pragma Convention (Stdcall, AUXRESHAPEPROC);
   type AUXIDLEPROC is access procedure;                  --  glaux.h:281
   pragma Convention (Stdcall, AUXIDLEPROC);
   type AUXKEYPROC is access procedure;                   --  glaux.h:284
   pragma Convention (Stdcall, AUXKEYPROC);
   type AUXMOUSEPROC is access procedure
     (p1 : access AUX_EVENTREC);                   --  glaux.h:287
   pragma Convention (Stdcall, AUXMOUSEPROC);

   --  not in Microsoft OpenTools
   --  type auxRGBMap_array is array(0..19, 0..2) of Win32.FLOAT;
   --  glaux.h:238

   --  auxRGBMap: auxRGBMap_array;                          -- glaux.h:238

   function AUX_WIND_IS_RGB (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:91
   function AUX_WIND_IS_INDEX (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:92
   function AUX_WIND_IS_SINGLE (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:93
   function AUX_WIND_IS_DOUBLE (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:94
   function AUX_WIND_IS_INDIRECT (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:95
   function AUX_WIND_IS_DIRECT (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:96
   function AUX_WIND_HAS_ACCUM (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:97
   function AUX_WIND_HAS_ALPHA (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:98
   function AUX_WIND_HAS_DEPTH (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:99
   function AUX_WIND_HAS_STENCIL (x : Win32.INT) return Win32.BOOL;
   --  glaux.h:100

   function AUX_WIND_USES_FIXED_332_PAL (x : Win32.WORD) return Win32.BOOL;
   --  glaux.h:101

   --  not in Microsoft OpenTools
   --  procedure AUX_SETCOLOR(x: Win32.INT;
   --  y: Win32.INT);                -- glaux.h:240

   procedure auxInitDisplayMode
     (p1 : Win32.Gl.GLenum);                       --  glaux.h:256

   procedure auxInitPosition
     (p1 : Win32.INT;
      p2 : Win32.INT;
      p3 : Win32.INT;
      p4 : Win32.INT);                             --  glaux.h:257

   function auxInitWindowA
     (p1 : Win32.LPCSTR)
     return Win32.Gl.GLenum;                      --  glaux.h:265

   function auxInitWindow
     (p1 : Win32.LPCSTR)
     return Win32.Gl.GLenum
     renames auxInitWindowA;                      --  glaux.h:265

   function auxInitWindowW
     (p1 : Win32.LPCWSTR)
     return Win32.Gl.GLenum;                      --  glaux.h:266

   procedure auxCloseWindow;                               --  glaux.h:268

   procedure auxQuit;                                      --  glaux.h:269

   procedure auxSwapBuffers;                               --  glaux.h:270

   procedure auxMainLoop
     (p1 : AUXMAINPROC);                           --  glaux.h:273

   procedure auxExposeFunc
     (p1 : AUXEXPOSEPROC);                         --  glaux.h:276

   procedure auxReshapeFunc
     (p1 : AUXRESHAPEPROC);                        --  glaux.h:279

   procedure auxIdleFunc
     (p1 : AUXIDLEPROC);                           --  glaux.h:282

   procedure auxKeyFunc
     (p1 : Win32.INT;
      p2 : AUXKEYPROC);                            --  glaux.h:285

   procedure auxMouseFunc
     (p1 : Win32.INT;
      p2 : Win32.INT;
      p3 : AUXMOUSEPROC);                          --  glaux.h:288

   function auxGetColorMapSize return Win32.INT;           --  glaux.h:290

   procedure auxGetMouseLoc
     (p1 : access Win32.INT;
      p2 : access Win32.INT);                      --  glaux.h:291

   procedure auxSetOneColor
     (p1 : Win32.INT;
      p2 : Win32.FLOAT;
      p3 : Win32.FLOAT;
      p4 : Win32.FLOAT);                           --  glaux.h:292

   procedure auxSetFogRamp
     (p1 : Win32.INT;
      p2 : Win32.INT);                             --  glaux.h:293

   procedure auxSetGreyRamp;                               --  glaux.h:294

   procedure auxSetRGBMap
     (p1 : Win32.INT;
      p2 : access Win32.FLOAT);                    --  glaux.h:295

   function auxRGBImageLoadA
     (p1 : Win32.LPCSTR)
     return a_AUX_RGBImageRec_t;                  --  glaux.h:303

   function auxRGBImageLoad
     (p1 : Win32.LPCSTR)
     return a_AUX_RGBImageRec_t
     renames auxRGBImageLoadA;                    --  glaux.h:303

   function auxRGBImageLoadW
     (p1 : Win32.LPCWSTR)
     return a_AUX_RGBImageRec_t;                  --  glaux.h:304

   function auxDIBImageLoadA
     (p1 : Win32.LPCSTR)
     return a_AUX_RGBImageRec_t;                  --  glaux.h:311

   function auxDIBImageLoad
     (p1 : Win32.LPCSTR)
     return a_AUX_RGBImageRec_t
     renames auxDIBImageLoadA;                    --  glaux.h:311

   function auxDIBImageLoadW
     (p1 : Win32.LPCWSTR)
     return a_AUX_RGBImageRec_t;                  --  glaux.h:312

   procedure auxCreateFont;                                --  glaux.h:314

   procedure auxDrawStrA
     (p1 : Win32.LPCSTR);                          --  glaux.h:321

   procedure auxDrawStr
     (p1 : Win32.LPCSTR)
     renames auxDrawStrA;                         --  glaux.h:321

   procedure auxDrawStrW
     (p1 : Win32.LPCWSTR);                         --  glaux.h:322

   procedure auxWireSphere
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:324

   procedure auxSolidSphere
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:325

   procedure auxWireCube
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:326

   procedure auxSolidCube
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:327

   procedure auxWireBox
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble;
      p3 : Win32.Gl.GLdouble);                     --  glaux.h:328

   procedure auxSolidBox
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble;
      p3 : Win32.Gl.GLdouble);                     --  glaux.h:329

   procedure auxWireTorus
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);                     --  glaux.h:330

   procedure auxSolidTorus
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);                     --  glaux.h:331

   procedure auxWireCylinder
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);                     --  glaux.h:332

   procedure auxSolidCylinder
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);                     --  glaux.h:333

   procedure auxWireIcosahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:334

   procedure auxSolidIcosahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:335

   procedure auxWireOctahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:336

   procedure auxSolidOctahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:337

   procedure auxWireTetrahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:338

   procedure auxSolidTetrahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:339

   procedure auxWireDodecahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:340

   procedure auxSolidDodecahedron
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:341

   procedure auxWireCone
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);                     --  glaux.h:342

   procedure auxSolidCone
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);                     --  glaux.h:343

   procedure auxWireTeapot
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:344

   procedure auxSolidTeapot
     (p1 : Win32.Gl.GLdouble);                     --  glaux.h:345

   function auxGetHWND return Win32.Windef.HWND;           --  glaux.h:351

   function auxGetHDC return Win32.Windef.HDC;             --  glaux.h:352

   function auxGetHGLRC return Win32.Windef.HGLRC;         --  glaux.h:353

   procedure auxInitDisplayModePolicy
     (p1 : Win32.Gl.GLenum);                       --  glaux.h:364

   function auxInitDisplayModeID
     (p1 : Win32.Gl.GLint)
     return Win32.Gl.GLenum;                      --  glaux.h:365

   function auxGetDisplayModePolicy return Win32.Gl.GLenum; --  glaux.h:366

   function auxGetDisplayModeID return Win32.Gl.GLint;     --  glaux.h:367

   function auxGetDisplayMode return Win32.Gl.GLenum;      --  glaux.h:368

private
   pragma Convention (C, AUX_EVENTREC);                     --  glaux.h:107
   pragma Convention (C_Pass_By_Copy, AUX_RGBImageRec);     --  glaux.h:247

   --  not in Microsoft OpenTools
   --  pragma Import(C, auxRGBMap, "auxRGBMap");            -- glaux.h:238
   pragma Import (Stdcall, auxInitDisplayMode, "auxInitDisplayMode");
   --  glaux.h:256
   pragma Import (Stdcall, auxInitPosition, "auxInitPosition"); --  glaux.h:257
   pragma Import (Stdcall, auxInitWindowA, "auxInitWindowA");   --  glaux.h:265
   pragma Import (Stdcall, auxInitWindowW, "auxInitWindowW");   --  glaux.h:266
   pragma Import (Stdcall, auxCloseWindow, "auxCloseWindow");   --  glaux.h:268
   pragma Import (Stdcall, auxQuit, "auxQuit");                 --  glaux.h:269
   pragma Import (Stdcall, auxSwapBuffers, "auxSwapBuffers");   --  glaux.h:270
   pragma Import (Stdcall, auxMainLoop, "auxMainLoop");         --  glaux.h:273
   pragma Import (Stdcall, auxExposeFunc, "auxExposeFunc");     --  glaux.h:276
   pragma Import (Stdcall, auxReshapeFunc, "auxReshapeFunc");   --  glaux.h:279
   pragma Import (Stdcall, auxIdleFunc, "auxIdleFunc");         --  glaux.h:282
   pragma Import (Stdcall, auxKeyFunc, "auxKeyFunc");           --  glaux.h:285
   pragma Import (Stdcall, auxMouseFunc, "auxMouseFunc");       --  glaux.h:288
   pragma Import (Stdcall, auxGetColorMapSize, "auxGetColorMapSize");
   --  glaux.h:290
   pragma Import (Stdcall, auxGetMouseLoc, "auxGetMouseLoc");   --  glaux.h:291
   pragma Import (Stdcall, auxSetOneColor, "auxSetOneColor");   --  glaux.h:292
   pragma Import (Stdcall, auxSetFogRamp, "auxSetFogRamp");     --  glaux.h:293
   pragma Import (Stdcall, auxSetGreyRamp, "auxSetGreyRamp");   --  glaux.h:294
   pragma Import (Stdcall, auxSetRGBMap, "auxSetRGBMap");       --  glaux.h:295
   pragma Import (Stdcall, auxRGBImageLoadA, "auxRGBImageLoadA");
   --  glaux.h:303
   pragma Import (Stdcall, auxRGBImageLoadW, "auxRGBImageLoadW");
   --  glaux.h:304
   pragma Import (Stdcall, auxDIBImageLoadA, "auxDIBImageLoadA");
   --  glaux.h:311
   pragma Import (Stdcall, auxDIBImageLoadW, "auxDIBImageLoadW");
   --  glaux.h:312
   pragma Import (Stdcall, auxCreateFont, "auxCreateFont");     --  glaux.h:314
   pragma Import (Stdcall, auxDrawStrA, "auxDrawStrA");         --  glaux.h:321
   pragma Import (Stdcall, auxDrawStrW, "auxDrawStrW");         --  glaux.h:322
   pragma Import (Stdcall, auxWireSphere, "auxWireSphere");     --  glaux.h:324
   pragma Import (Stdcall, auxSolidSphere, "auxSolidSphere");   --  glaux.h:325
   pragma Import (Stdcall, auxWireCube, "auxWireCube");         --  glaux.h:326
   pragma Import (Stdcall, auxSolidCube, "auxSolidCube");       --  glaux.h:327
   pragma Import (Stdcall, auxWireBox, "auxWireBox");           --  glaux.h:328
   pragma Import (Stdcall, auxSolidBox, "auxSolidBox");         --  glaux.h:329
   pragma Import (Stdcall, auxWireTorus, "auxWireTorus");       --  glaux.h:330
   pragma Import (Stdcall, auxSolidTorus, "auxSolidTorus");     --  glaux.h:331
   pragma Import (Stdcall, auxWireCylinder, "auxWireCylinder"); --  glaux.h:332
   pragma Import (Stdcall, auxSolidCylinder, "auxSolidCylinder");
   --  glaux.h:333
   pragma Import (Stdcall, auxWireIcosahedron, "auxWireIcosahedron");
   --  glaux.h:334
   pragma Import (Stdcall, auxSolidIcosahedron, "auxSolidIcosahedron");
   --  glaux.h:335
   pragma Import (Stdcall, auxWireOctahedron, "auxWireOctahedron");
   --  glaux.h:336
   pragma Import (Stdcall, auxSolidOctahedron, "auxSolidOctahedron");
   --  glaux.h:337
   pragma Import (Stdcall, auxWireTetrahedron, "auxWireTetrahedron");
   --  glaux.h:338
   pragma Import (Stdcall, auxSolidTetrahedron, "auxSolidTetrahedron");
   --  glaux.h:339
   pragma Import (Stdcall, auxWireDodecahedron, "auxWireDodecahedron");
   --  glaux.h:340
   pragma Import (Stdcall, auxSolidDodecahedron, "auxSolidDodecahedron");
   --  glaux.h:341
   pragma Import (Stdcall, auxWireCone, "auxWireCone");         --  glaux.h:342
   pragma Import (Stdcall, auxSolidCone, "auxSolidCone");       --  glaux.h:343
   pragma Import (Stdcall, auxWireTeapot, "auxWireTeapot");     --  glaux.h:344
   pragma Import (Stdcall, auxSolidTeapot, "auxSolidTeapot");   --  glaux.h:345
   pragma Import (Stdcall, auxGetHWND, "auxGetHWND");           --  glaux.h:351
   pragma Import (Stdcall, auxGetHDC, "auxGetHDC");             --  glaux.h:352
   pragma Import (Stdcall, auxGetHGLRC, "auxGetHGLRC");         --  glaux.h:353
   pragma Import (Stdcall, auxInitDisplayModePolicy,
                    "auxInitDisplayModePolicy");
   --  glaux.h:364
   pragma Import (Stdcall, auxInitDisplayModeID, "auxInitDisplayModeID");
   --  glaux.h:365
   pragma Import (Stdcall, auxGetDisplayModePolicy, "auxGetDisplayModePolicy");
   --  glaux.h:366
   pragma Import (Stdcall, auxGetDisplayModeID, "auxGetDisplayModeID");
   --  glaux.h:367
   pragma Import (Stdcall, auxGetDisplayMode, "auxGetDisplayMode");
   --  glaux.h:368

end Win32.Glaux;
