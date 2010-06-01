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

with Win32.Gl;
with Win32.Windef;

package Win32.Glaux is

   AUX_RGB           : constant := 0;
   AUX_RGBA          : constant := 0;
   AUX_INDEX         : constant := 1;
   AUX_SINGLE        : constant := 0;
   AUX_DOUBLE        : constant := 2;
   AUX_DIRECT        : constant := 0;
   AUX_INDIRECT      : constant := 4;
   AUX_ACCUM         : constant := 8;
   AUX_ALPHA         : constant := 16;
   AUX_DEPTH         : constant := 32;
   AUX_STENCIL       : constant := 64;
   AUX_AUX           : constant := 128;
   AUX_DEPTH16       : constant := 256;
   AUX_FIXED_332_PAL : constant := 512;
   AUX_EXPOSE        : constant := 1;
   AUX_CONFIG        : constant := 2;
   AUX_DRAW          : constant := 4;
   AUX_KEYEVENT      : constant := 8;
   AUX_MOUSEDOWN     : constant := 16;
   AUX_MOUSEUP       : constant := 32;
   AUX_MOUSELOC      : constant := 64;
   AUX_WINDOWX       : constant := 0;
   AUX_WINDOWY       : constant := 1;
   AUX_MOUSEX        : constant := 0;
   AUX_MOUSEY        : constant := 1;
   AUX_MOUSESTATUS   : constant := 3;
   AUX_KEY           : constant := 0;
   AUX_KEYSTATUS     : constant := 1;
   AUX_LEFTBUTTON    : constant := 1;
   AUX_RIGHTBUTTON   : constant := 2;
   AUX_MIDDLEBUTTON  : constant := 4;
   AUX_SHIFT         : constant := 1;
   AUX_CONTROL       : constant := 2;
   AUX_RETURN        : constant := 16#d#;
   AUX_ESCAPE        : constant := 16#1b#;
   AUX_SPACE         : constant := 16#20#;
   AUX_LEFT          : constant := 16#25#;
   AUX_UP            : constant := 16#26#;
   AUX_RIGHT         : constant := 16#27#;
   AUX_DOWN          : constant := 16#28#;
   AUX_UC_A          : constant := 65;
   AUX_UC_B          : constant := 66;
   AUX_UC_C          : constant := 67;
   AUX_UC_D          : constant := 68;
   AUX_UC_E          : constant := 69;
   AUX_UC_F          : constant := 70;
   AUX_UC_G          : constant := 71;
   AUX_UC_H          : constant := 72;
   AUX_UC_I          : constant := 73;
   AUX_UC_J          : constant := 74;
   AUX_UC_K          : constant := 75;
   AUX_UC_L          : constant := 76;
   AUX_UC_M          : constant := 77;
   AUX_UC_N          : constant := 78;
   AUX_UC_O          : constant := 79;
   AUX_UC_P          : constant := 80;
   AUX_UC_Q          : constant := 81;
   AUX_UC_R          : constant := 82;
   AUX_UC_S          : constant := 83;
   AUX_UC_T          : constant := 84;
   AUX_UC_U          : constant := 85;
   AUX_UC_V          : constant := 86;
   AUX_UC_W          : constant := 87;
   AUX_UC_X          : constant := 88;
   AUX_UC_Y          : constant := 89;
   AUX_UC_Z          : constant := 90;
   AUX_a             : constant := 97;
   AUX_b             : constant := 98;
   AUX_c             : constant := 99;
   AUX_d             : constant := 100;
   AUX_e             : constant := 101;
   AUX_f             : constant := 102;
   AUX_g             : constant := 103;
   AUX_h             : constant := 104;
   AUX_i             : constant := 105;
   AUX_j             : constant := 106;
   AUX_k             : constant := 107;
   AUX_l             : constant := 108;
   AUX_m             : constant := 109;
   AUX_n             : constant := 110;
   AUX_o             : constant := 111;
   AUX_p             : constant := 112;
   AUX_q             : constant := 113;
   AUX_r             : constant := 114;
   AUX_s             : constant := 115;
   AUX_t             : constant := 116;
   AUX_u             : constant := 117;
   AUX_v             : constant := 118;
   AUX_w             : constant := 119;
   AUX_x             : constant := 120;
   AUX_y             : constant := 121;
   AUX_z             : constant := 122;
   AUX_0             : constant := 48;
   AUX_1             : constant := 49;
   AUX_2             : constant := 50;
   AUX_3             : constant := 51;
   AUX_4             : constant := 52;
   AUX_5             : constant := 53;
   AUX_6             : constant := 54;
   AUX_7             : constant := 55;
   AUX_8             : constant := 56;
   AUX_9             : constant := 57;
   AUX_FD            : constant := 1;
   AUX_COLORMAP      : constant := 3;
   AUX_GREYSCALEMAP  : constant := 4;
   AUX_FOGMAP        : constant := 5;
   AUX_ONECOLOR      : constant := 6;
   AUX_BLACK         : constant := 0;
   AUX_RED           : constant := 13;
   AUX_GREEN         : constant := 14;
   AUX_YELLOW        : constant := 15;
   AUX_BLUE          : constant := 16;
   AUX_MAGENTA       : constant := 17;
   AUX_CYAN          : constant := 18;
   AUX_WHITE         : constant := 19;

   type enum_anonymous2_t is (
      AUX_USE_ID,
      AUX_EXACT_MATCH,
      AUX_MINIMUM_CRITERIA);
   for enum_anonymous2_t use
     (AUX_USE_ID           => 1,
      AUX_EXACT_MATCH      => 2,
      AUX_MINIMUM_CRITERIA => 3);
   for enum_anonymous2_t'Size use 32;

   type AUX_EVENTREC;
   type AUX_RGBImageRec;

   type a_AUX_RGBImageRec_t is access all AUX_RGBImageRec;

   type AUX_EVENTREC is record
      event : Win32.Gl.GLint;
      data  : Win32.INT_Array (0 .. 3);
   end record;

   type AUX_RGBImageRec is record
      sizeX : Win32.Gl.GLint;
      sizeY : Win32.Gl.GLint;
      data  : Win32.PUCHAR;
   end record;

   type AUXMAINPROC is access procedure;
   pragma Convention (Stdcall, AUXMAINPROC);
   type AUXEXPOSEPROC is access procedure (p1 : Win32.INT; p2 : Win32.INT);
   pragma Convention (Stdcall, AUXEXPOSEPROC);
   type AUXRESHAPEPROC is access procedure
     (p1 : Win32.Gl.GLsizei;
      p2 : Win32.Gl.GLsizei);
   pragma Convention (Stdcall, AUXRESHAPEPROC);
   type AUXIDLEPROC is access procedure;
   pragma Convention (Stdcall, AUXIDLEPROC);
   type AUXKEYPROC is access procedure;
   pragma Convention (Stdcall, AUXKEYPROC);
   type AUXMOUSEPROC is access procedure (p1 : access AUX_EVENTREC);
   pragma Convention (Stdcall, AUXMOUSEPROC);

   function AUX_WIND_IS_RGB (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_IS_INDEX (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_IS_SINGLE (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_IS_DOUBLE (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_IS_INDIRECT (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_IS_DIRECT (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_HAS_ACCUM (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_HAS_ALPHA (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_HAS_DEPTH (x : Win32.INT) return Win32.BOOL;
   function AUX_WIND_HAS_STENCIL (x : Win32.INT) return Win32.BOOL;

   function AUX_WIND_USES_FIXED_332_PAL (x : Win32.WORD) return Win32.BOOL;

   procedure auxInitDisplayMode (p1 : Win32.Gl.GLenum);

   procedure auxInitPosition
     (p1 : Win32.INT;
      p2 : Win32.INT;
      p3 : Win32.INT;
      p4 : Win32.INT);

   function auxInitWindowA (p1 : Win32.LPCSTR) return Win32.Gl.GLenum;

   function auxInitWindow (p1 : Win32.LPCSTR) return Win32.Gl.GLenum renames
     auxInitWindowA;

   function auxInitWindowW (p1 : Win32.LPCWSTR) return Win32.Gl.GLenum;

   procedure auxCloseWindow;

   procedure auxQuit;

   procedure auxSwapBuffers;

   procedure auxMainLoop (p1 : AUXMAINPROC);

   procedure auxExposeFunc (p1 : AUXEXPOSEPROC);

   procedure auxReshapeFunc (p1 : AUXRESHAPEPROC);

   procedure auxIdleFunc (p1 : AUXIDLEPROC);

   procedure auxKeyFunc (p1 : Win32.INT; p2 : AUXKEYPROC);

   procedure auxMouseFunc
     (p1 : Win32.INT;
      p2 : Win32.INT;
      p3 : AUXMOUSEPROC);

   function auxGetColorMapSize return Win32.INT;

   procedure auxGetMouseLoc (p1 : access Win32.INT; p2 : access Win32.INT);

   procedure auxSetOneColor
     (p1 : Win32.INT;
      p2 : Win32.FLOAT;
      p3 : Win32.FLOAT;
      p4 : Win32.FLOAT);

   procedure auxSetFogRamp (p1 : Win32.INT; p2 : Win32.INT);

   procedure auxSetGreyRamp;

   procedure auxSetRGBMap (p1 : Win32.INT; p2 : access Win32.FLOAT);

   function auxRGBImageLoadA (p1 : Win32.LPCSTR) return a_AUX_RGBImageRec_t;

   function auxRGBImageLoad (p1 : Win32.LPCSTR) return a_AUX_RGBImageRec_t
      renames auxRGBImageLoadA;

   function auxRGBImageLoadW
     (p1   : Win32.LPCWSTR)
      return a_AUX_RGBImageRec_t;

   function auxDIBImageLoadA (p1 : Win32.LPCSTR) return a_AUX_RGBImageRec_t;

   function auxDIBImageLoad (p1 : Win32.LPCSTR) return a_AUX_RGBImageRec_t
      renames auxDIBImageLoadA;

   function auxDIBImageLoadW
     (p1   : Win32.LPCWSTR)
      return a_AUX_RGBImageRec_t;

   procedure auxCreateFont;

   procedure auxDrawStrA (p1 : Win32.LPCSTR);

   procedure auxDrawStr (p1 : Win32.LPCSTR) renames auxDrawStrA;

   procedure auxDrawStrW (p1 : Win32.LPCWSTR);

   procedure auxWireSphere (p1 : Win32.Gl.GLdouble);

   procedure auxSolidSphere (p1 : Win32.Gl.GLdouble);

   procedure auxWireCube (p1 : Win32.Gl.GLdouble);

   procedure auxSolidCube (p1 : Win32.Gl.GLdouble);

   procedure auxWireBox
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble;
      p3 : Win32.Gl.GLdouble);

   procedure auxSolidBox
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble;
      p3 : Win32.Gl.GLdouble);

   procedure auxWireTorus (p1 : Win32.Gl.GLdouble; p2 : Win32.Gl.GLdouble);

   procedure auxSolidTorus (p1 : Win32.Gl.GLdouble; p2 : Win32.Gl.GLdouble);

   procedure auxWireCylinder
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);

   procedure auxSolidCylinder
     (p1 : Win32.Gl.GLdouble;
      p2 : Win32.Gl.GLdouble);

   procedure auxWireIcosahedron (p1 : Win32.Gl.GLdouble);

   procedure auxSolidIcosahedron (p1 : Win32.Gl.GLdouble);

   procedure auxWireOctahedron (p1 : Win32.Gl.GLdouble);

   procedure auxSolidOctahedron (p1 : Win32.Gl.GLdouble);

   procedure auxWireTetrahedron (p1 : Win32.Gl.GLdouble);

   procedure auxSolidTetrahedron (p1 : Win32.Gl.GLdouble);

   procedure auxWireDodecahedron (p1 : Win32.Gl.GLdouble);

   procedure auxSolidDodecahedron (p1 : Win32.Gl.GLdouble);

   procedure auxWireCone (p1 : Win32.Gl.GLdouble; p2 : Win32.Gl.GLdouble);

   procedure auxSolidCone (p1 : Win32.Gl.GLdouble; p2 : Win32.Gl.GLdouble);

   procedure auxWireTeapot (p1 : Win32.Gl.GLdouble);

   procedure auxSolidTeapot (p1 : Win32.Gl.GLdouble);

   function auxGetHWND return Win32.Windef.HWND;

   function auxGetHDC return Win32.Windef.HDC;

   function auxGetHGLRC return Win32.Windef.HGLRC;

   procedure auxInitDisplayModePolicy (p1 : Win32.Gl.GLenum);

   function auxInitDisplayModeID
     (p1   : Win32.Gl.GLint)
      return Win32.Gl.GLenum;

   function auxGetDisplayModePolicy return Win32.Gl.GLenum;

   function auxGetDisplayModeID return Win32.Gl.GLint;

   function auxGetDisplayMode return Win32.Gl.GLenum;

private
   pragma Convention (C, AUX_EVENTREC);
   pragma Convention (C_Pass_By_Copy, AUX_RGBImageRec);

   pragma Import (Stdcall, auxInitDisplayMode, "auxInitDisplayMode");
   pragma Import (Stdcall, auxInitPosition, "auxInitPosition");
   pragma Import (Stdcall, auxInitWindowA, "auxInitWindowA");
   pragma Import (Stdcall, auxInitWindowW, "auxInitWindowW");
   pragma Import (Stdcall, auxCloseWindow, "auxCloseWindow");
   pragma Import (Stdcall, auxQuit, "auxQuit");
   pragma Import (Stdcall, auxSwapBuffers, "auxSwapBuffers");
   pragma Import (Stdcall, auxMainLoop, "auxMainLoop");
   pragma Import (Stdcall, auxExposeFunc, "auxExposeFunc");
   pragma Import (Stdcall, auxReshapeFunc, "auxReshapeFunc");
   pragma Import (Stdcall, auxIdleFunc, "auxIdleFunc");
   pragma Import (Stdcall, auxKeyFunc, "auxKeyFunc");
   pragma Import (Stdcall, auxMouseFunc, "auxMouseFunc");
   pragma Import (Stdcall, auxGetColorMapSize, "auxGetColorMapSize");
   pragma Import (Stdcall, auxGetMouseLoc, "auxGetMouseLoc");
   pragma Import (Stdcall, auxSetOneColor, "auxSetOneColor");
   pragma Import (Stdcall, auxSetFogRamp, "auxSetFogRamp");
   pragma Import (Stdcall, auxSetGreyRamp, "auxSetGreyRamp");
   pragma Import (Stdcall, auxSetRGBMap, "auxSetRGBMap");
   pragma Import (Stdcall, auxRGBImageLoadA, "auxRGBImageLoadA");
   pragma Import (Stdcall, auxRGBImageLoadW, "auxRGBImageLoadW");
   pragma Import (Stdcall, auxDIBImageLoadA, "auxDIBImageLoadA");
   pragma Import (Stdcall, auxDIBImageLoadW, "auxDIBImageLoadW");
   pragma Import (Stdcall, auxCreateFont, "auxCreateFont");
   pragma Import (Stdcall, auxDrawStrA, "auxDrawStrA");
   pragma Import (Stdcall, auxDrawStrW, "auxDrawStrW");
   pragma Import (Stdcall, auxWireSphere, "auxWireSphere");
   pragma Import (Stdcall, auxSolidSphere, "auxSolidSphere");
   pragma Import (Stdcall, auxWireCube, "auxWireCube");
   pragma Import (Stdcall, auxSolidCube, "auxSolidCube");
   pragma Import (Stdcall, auxWireBox, "auxWireBox");
   pragma Import (Stdcall, auxSolidBox, "auxSolidBox");
   pragma Import (Stdcall, auxWireTorus, "auxWireTorus");
   pragma Import (Stdcall, auxSolidTorus, "auxSolidTorus");
   pragma Import (Stdcall, auxWireCylinder, "auxWireCylinder");
   pragma Import (Stdcall, auxSolidCylinder, "auxSolidCylinder");
   pragma Import (Stdcall, auxWireIcosahedron, "auxWireIcosahedron");
   pragma Import (Stdcall, auxSolidIcosahedron, "auxSolidIcosahedron");
   pragma Import (Stdcall, auxWireOctahedron, "auxWireOctahedron");
   pragma Import (Stdcall, auxSolidOctahedron, "auxSolidOctahedron");
   pragma Import (Stdcall, auxWireTetrahedron, "auxWireTetrahedron");
   pragma Import (Stdcall, auxSolidTetrahedron, "auxSolidTetrahedron");
   pragma Import (Stdcall, auxWireDodecahedron, "auxWireDodecahedron");
   pragma Import (Stdcall, auxSolidDodecahedron, "auxSolidDodecahedron");
   pragma Import (Stdcall, auxWireCone, "auxWireCone");
   pragma Import (Stdcall, auxSolidCone, "auxSolidCone");
   pragma Import (Stdcall, auxWireTeapot, "auxWireTeapot");
   pragma Import (Stdcall, auxSolidTeapot, "auxSolidTeapot");
   pragma Import (Stdcall, auxGetHWND, "auxGetHWND");
   pragma Import (Stdcall, auxGetHDC, "auxGetHDC");
   pragma Import (Stdcall, auxGetHGLRC, "auxGetHGLRC");
   pragma Import
     (Stdcall,
      auxInitDisplayModePolicy,
      "auxInitDisplayModePolicy");
   pragma Import (Stdcall, auxInitDisplayModeID, "auxInitDisplayModeID");
   pragma Import
     (Stdcall,
      auxGetDisplayModePolicy,
      "auxGetDisplayModePolicy");
   pragma Import (Stdcall, auxGetDisplayModeID, "auxGetDisplayModeID");
   pragma Import (Stdcall, auxGetDisplayMode, "auxGetDisplayMode");

end Win32.Glaux;
