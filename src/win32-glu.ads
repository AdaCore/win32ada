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

package Win32.Glu is

   GLU_INVALID_ENUM       : constant := 100900;
   GLU_INVALID_VALUE      : constant := 100901;
   GLU_OUT_OF_MEMORY      : constant := 100902;
   GLU_TRUE               : constant := 1;
   GLU_FALSE              : constant := 0;
   GLU_SMOOTH             : constant := 100000;
   GLU_FLAT               : constant := 100001;
   GLU_NONE               : constant := 100002;
   GLU_POINT              : constant := 100010;
   GLU_LINE               : constant := 100011;
   GLU_FILL               : constant := 100012;
   GLU_SILHOUETTE         : constant := 100013;
   GLU_OUTSIDE            : constant := 100020;
   GLU_INSIDE             : constant := 100021;
   GLU_BEGIN              : constant := 100100;
   GLU_VERTEX             : constant := 100101;
   GLU_END                : constant := 100102;
   GLU_ERROR              : constant := 100103;
   GLU_EDGE_FLAG          : constant := 100104;
   GLU_CW                 : constant := 100120;
   GLU_CCW                : constant := 100121;
   GLU_INTERIOR           : constant := 100122;
   GLU_EXTERIOR           : constant := 100123;
   GLU_UNKNOWN            : constant := 100124;
   GLU_TESS_ERROR1        : constant := 100151;
   GLU_TESS_ERROR2        : constant := 100152;
   GLU_TESS_ERROR3        : constant := 100153;
   GLU_TESS_ERROR4        : constant := 100154;
   GLU_TESS_ERROR5        : constant := 100155;
   GLU_TESS_ERROR6        : constant := 100156;
   GLU_TESS_ERROR7        : constant := 100157;
   GLU_TESS_ERROR8        : constant := 100158;
   GLU_AUTO_LOAD_MATRIX   : constant := 100200;
   GLU_CULLING            : constant := 100201;
   GLU_SAMPLING_TOLERANCE : constant := 100203;
   GLU_DISPLAY_MODE       : constant := 100204;
   GLU_MAP1_TRIM_2        : constant := 100210;
   GLU_MAP1_TRIM_3        : constant := 100211;
   GLU_OUTLINE_POLYGON    : constant := 100240;
   GLU_OUTLINE_PATCH      : constant := 100241;
   GLU_NURBS_ERROR1       : constant := 100251;
   GLU_NURBS_ERROR2       : constant := 100252;
   GLU_NURBS_ERROR3       : constant := 100253;
   GLU_NURBS_ERROR4       : constant := 100254;
   GLU_NURBS_ERROR5       : constant := 100255;
   GLU_NURBS_ERROR6       : constant := 100256;
   GLU_NURBS_ERROR7       : constant := 100257;
   GLU_NURBS_ERROR8       : constant := 100258;
   GLU_NURBS_ERROR9       : constant := 100259;
   GLU_NURBS_ERROR10      : constant := 100260;
   GLU_NURBS_ERROR11      : constant := 100261;
   GLU_NURBS_ERROR12      : constant := 100262;
   GLU_NURBS_ERROR13      : constant := 100263;
   GLU_NURBS_ERROR14      : constant := 100264;
   GLU_NURBS_ERROR15      : constant := 100265;
   GLU_NURBS_ERROR16      : constant := 100266;
   GLU_NURBS_ERROR17      : constant := 100267;
   GLU_NURBS_ERROR18      : constant := 100268;
   GLU_NURBS_ERROR19      : constant := 100269;
   GLU_NURBS_ERROR20      : constant := 100270;
   GLU_NURBS_ERROR21      : constant := 100271;
   GLU_NURBS_ERROR22      : constant := 100272;
   GLU_NURBS_ERROR23      : constant := 100273;
   GLU_NURBS_ERROR24      : constant := 100274;
   GLU_NURBS_ERROR25      : constant := 100275;
   GLU_NURBS_ERROR26      : constant := 100276;
   GLU_NURBS_ERROR27      : constant := 100277;
   GLU_NURBS_ERROR28      : constant := 100278;
   GLU_NURBS_ERROR29      : constant := 100279;
   GLU_NURBS_ERROR30      : constant := 100280;
   GLU_NURBS_ERROR31      : constant := 100281;
   GLU_NURBS_ERROR32      : constant := 100282;
   GLU_NURBS_ERROR33      : constant := 100283;
   GLU_NURBS_ERROR34      : constant := 100284;
   GLU_NURBS_ERROR35      : constant := 100285;
   GLU_NURBS_ERROR36      : constant := 100286;
   GLU_NURBS_ERROR37      : constant := 100287;

   type GLint_Array is array (Integer range 0 .. 3) of Win32.Gl.GLint;

   type GLdouble_Array_16 is
     array (Integer range 0 .. 15) of Win32.Gl.GLdouble;

   type GLfloat_Array is array (Integer range 0 .. 15) of Win32.Gl.GLfloat;

   type ap_84_fn is access procedure;
   pragma Convention (Stdcall, ap_84_fn);

   type GLdouble_Array_3 is array (Integer range 0 .. 2) of Win32.Gl.GLdouble;

   type GLUquadricObj is private;
   type PGLUquadricObj is access all GLUquadricObj;

   type GLUtriangulatorObj is private;
   type PGLUtriangulatorObj is access all GLUtriangulatorObj;

   type GLUnurbsObj is private;
   type PGLUnurbsObj is access all GLUnurbsObj;

   type GLUquadricErrorProc is access procedure (p1 : Win32.Gl.GLenum);
   pragma Convention (Stdcall, GLUquadricErrorProc);

   type GLUtessBeginProc is access procedure (p1 : Win32.Gl.GLenum);
   pragma Convention (Stdcall, GLUtessBeginProc);

   type GLUtessEdgeFlagProc is access procedure (p1 : Win32.Gl.GLboolean);
   pragma Convention (Stdcall, GLUtessEdgeFlagProc);

   type GLUtessVertexProc is access procedure (p1 : Win32.PVOID);
   pragma Convention (Stdcall, GLUtessVertexProc);

   type GLUtessEndProc is access procedure;
   pragma Convention (Stdcall, GLUtessEndProc);

   type GLUtessErrorProc is access procedure (p1 : Win32.Gl.GLenum);
   pragma Convention (Stdcall, GLUtessErrorProc);

   type GLUnurbsErrorProc is access procedure (p1 : Win32.Gl.GLenum);
   pragma Convention (Stdcall, GLUnurbsErrorProc);

   function gluErrorStringWIN
     (errCode : Win32.Gl.GLenum)
      return Win32.LPCWSTR;

   function gluErrorString (errCode : Win32.Gl.GLenum) return Win32.PCBYTE;

   function gluErrorUnicodeStringEXT
     (errCode : Win32.Gl.GLenum)
      return Win32.PCWSTR;

   procedure gluOrtho2D
     (left   : Win32.Gl.GLdouble;
      right  : Win32.Gl.GLdouble;
      bottom : Win32.Gl.GLdouble;
      top    : Win32.Gl.GLdouble);

   procedure gluPerspective
     (fovy   : Win32.Gl.GLdouble;
      aspect : Win32.Gl.GLdouble;
      zNear  : Win32.Gl.GLdouble;
      zFar   : Win32.Gl.GLdouble);

   procedure gluPickMatrix
     (x        : Win32.Gl.GLdouble;
      y        : Win32.Gl.GLdouble;
      width    : Win32.Gl.GLdouble;
      height   : Win32.Gl.GLdouble;
      viewport : GLint_Array);

   procedure gluLookAt
     (eyex    : Win32.Gl.GLdouble;
      eyey    : Win32.Gl.GLdouble;
      eyez    : Win32.Gl.GLdouble;
      centerx : Win32.Gl.GLdouble;
      centery : Win32.Gl.GLdouble;
      centerz : Win32.Gl.GLdouble;
      upx     : Win32.Gl.GLdouble;
      upy     : Win32.Gl.GLdouble;
      upz     : Win32.Gl.GLdouble);

   function gluProject
     (objx        : Win32.Gl.GLdouble;
      objy        : Win32.Gl.GLdouble;
      objz        : Win32.Gl.GLdouble;
      modelMatrix : GLdouble_Array_16;
      projMatrix  : GLdouble_Array_16;
      viewport    : GLint_Array;
      winx        : access Win32.Gl.GLdouble;
      winy        : access Win32.Gl.GLdouble;
      winz        : access Win32.Gl.GLdouble)
      return Win32.INT;

   function gluUnProject
     (winx        : Win32.Gl.GLdouble;
      winy        : Win32.Gl.GLdouble;
      winz        : Win32.Gl.GLdouble;
      modelMatrix : GLdouble_Array_16;
      projMatrix  : GLdouble_Array_16;
      viewport    : GLint_Array;
      objx        : access Win32.Gl.GLdouble;
      objy        : access Win32.Gl.GLdouble;
      objz        : access Win32.Gl.GLdouble)
      return Win32.INT;

   function gluScaleImage
     (format    : Win32.Gl.GLenum;
      widthin   : Win32.Gl.GLint;
      heightin  : Win32.Gl.GLint;
      typein    : Win32.Gl.GLenum;
      datain    : Win32.PCVOID;
      widthout  : Win32.Gl.GLint;
      heightout : Win32.Gl.GLint;
      typeout   : Win32.Gl.GLenum;
      dataout   : Win32.PVOID)
      return Win32.INT;

   function gluBuild1DMipmaps
     (target     : Win32.Gl.GLenum;
      components : Win32.Gl.GLint;
      width      : Win32.Gl.GLint;
      format     : Win32.Gl.GLenum;
      c_type     : Win32.Gl.GLenum;
      data       : Win32.PCVOID)
      return Win32.INT;

   function gluBuild2DMipmaps
     (target     : Win32.Gl.GLenum;
      components : Win32.Gl.GLint;
      width      : Win32.Gl.GLint;
      height     : Win32.Gl.GLint;
      format     : Win32.Gl.GLenum;
      c_type     : Win32.Gl.GLenum;
      data       : Win32.PCVOID)
      return Win32.INT;

   function gluNewQuadric return PGLUquadricObj;

   procedure gluDeleteQuadric (state : PGLUquadricObj);

   procedure gluQuadricNormals
     (quadObject : PGLUquadricObj;
      normals    : Win32.Gl.GLenum);

   procedure gluQuadricTexture
     (quadObject    : PGLUquadricObj;
      textureCoords : Win32.Gl.GLboolean);

   procedure gluQuadricOrientation
     (quadObject  : PGLUquadricObj;
      orientation : Win32.Gl.GLenum);

   procedure gluQuadricDrawStyle
     (quadObject : PGLUquadricObj;
      drawStyle  : Win32.Gl.GLenum);

   procedure gluCylinder
     (qobj       : PGLUquadricObj;
      baseRadius : Win32.Gl.GLdouble;
      topRadius  : Win32.Gl.GLdouble;
      height     : Win32.Gl.GLdouble;
      slices     : Win32.Gl.GLint;
      stacks     : Win32.Gl.GLint);

   procedure gluDisk
     (qobj        : PGLUquadricObj;
      innerRadius : Win32.Gl.GLdouble;
      outerRadius : Win32.Gl.GLdouble;
      slices      : Win32.Gl.GLint;
      loops       : Win32.Gl.GLint);

   procedure gluPartialDisk
     (qobj        : PGLUquadricObj;
      innerRadius : Win32.Gl.GLdouble;
      outerRadius : Win32.Gl.GLdouble;
      slices      : Win32.Gl.GLint;
      loops       : Win32.Gl.GLint;
      startAngle  : Win32.Gl.GLdouble;
      sweepAngle  : Win32.Gl.GLdouble);

   procedure gluSphere
     (qobj   : PGLUquadricObj;
      radius : Win32.Gl.GLdouble;
      slices : Win32.Gl.GLint;
      stacks : Win32.Gl.GLint);

   procedure gluQuadricCallback
     (qobj  : PGLUquadricObj;
      which : Win32.Gl.GLenum;
      fn    : ap_84_fn);

   function gluNewTess return PGLUtriangulatorObj;

   procedure gluTessCallback
     (tobj  : PGLUtriangulatorObj;
      which : Win32.Gl.GLenum;
      fn    : ap_84_fn);

   procedure gluDeleteTess (tobj : PGLUtriangulatorObj);

   procedure gluBeginPolygon (tobj : PGLUtriangulatorObj);

   procedure gluEndPolygon (tobj : PGLUtriangulatorObj);

   procedure gluNextContour
     (tobj   : PGLUtriangulatorObj;
      c_type : Win32.Gl.GLenum);

   procedure gluTessVertex
     (tobj : PGLUtriangulatorObj;
      v    : GLdouble_Array_3;
      data : Win32.PVOID);

   function gluNewNurbsRenderer return PGLUnurbsObj;

   procedure gluDeleteNurbsRenderer (nobj : PGLUnurbsObj);

   procedure gluBeginSurface (nobj : PGLUnurbsObj);

   procedure gluBeginCurve (nobj : PGLUnurbsObj);

   procedure gluEndCurve (nobj : PGLUnurbsObj);

   procedure gluEndSurface (nobj : PGLUnurbsObj);

   procedure gluBeginTrim (nobj : PGLUnurbsObj);

   procedure gluEndTrim (nobj : PGLUnurbsObj);

   procedure gluPwlCurve
     (nobj    : PGLUnurbsObj;
      count   : Win32.Gl.GLint;
      c_array : access Win32.Gl.GLfloat;
      stride  : Win32.Gl.GLint;
      c_type  : Win32.Gl.GLenum);

   procedure gluNurbsCurve
     (nobj     : PGLUnurbsObj;
      nknots   : Win32.Gl.GLint;
      knot     : access Win32.Gl.GLfloat;
      stride   : Win32.Gl.GLint;
      ctlarray : access Win32.Gl.GLfloat;
      order    : Win32.Gl.GLint;
      c_type   : Win32.Gl.GLenum);

   procedure gluNurbsSurface
     (nobj        : PGLUnurbsObj;
      sknot_count : Win32.Gl.GLint;
      sknot       : access Win32.Gl.GLfloat;
      tknot_count : Win32.Gl.GLint;
      tknot       : access Win32.Gl.GLfloat;
      s_stride    : Win32.Gl.GLint;
      t_stride    : Win32.Gl.GLint;
      ctlarray    : access Win32.Gl.GLfloat;
      sorder      : Win32.Gl.GLint;
      torder      : Win32.Gl.GLint;
      c_type      : Win32.Gl.GLenum);

   procedure gluLoadSamplingMatrices
     (nobj        : PGLUnurbsObj;
      modelMatrix : GLfloat_Array;
      projMatrix  : GLfloat_Array;
      viewport    : GLint_Array);

   procedure gluNurbsProperty
     (nobj     : PGLUnurbsObj;
      property : Win32.Gl.GLenum;
      value    : Win32.Gl.GLfloat);

   procedure gluGetNurbsProperty
     (nobj     : PGLUnurbsObj;
      property : Win32.Gl.GLenum;
      value    : access Win32.Gl.GLfloat);

   procedure gluNurbsCallback
     (nobj  : PGLUnurbsObj;
      which : Win32.Gl.GLenum;
      fn    : ap_84_fn);

private

   type GLUquadricObj is null record;
   type GLUtriangulatorObj is null record;
   type GLUnurbsObj is null record;

   pragma Import (Stdcall, gluErrorString, "gluErrorString");
   pragma Import
     (Stdcall,
      gluErrorUnicodeStringEXT,
      "gluErrorUnicodeStringEXT");
   pragma Import (Stdcall, gluOrtho2D, "gluOrtho2D");
   pragma Import (Stdcall, gluPerspective, "gluPerspective");
   pragma Import (Stdcall, gluPickMatrix, "gluPickMatrix");
   pragma Import (Stdcall, gluLookAt, "gluLookAt");
   pragma Import (Stdcall, gluProject, "gluProject");
   pragma Import (Stdcall, gluUnProject, "gluUnProject");
   pragma Import (Stdcall, gluScaleImage, "gluScaleImage");
   pragma Import (Stdcall, gluBuild1DMipmaps, "gluBuild1DMipmaps");
   pragma Import (Stdcall, gluBuild2DMipmaps, "gluBuild2DMipmaps");
   pragma Import (Stdcall, gluNewQuadric, "gluNewQuadric");
   pragma Import (Stdcall, gluDeleteQuadric, "gluDeleteQuadric");
   pragma Import (Stdcall, gluQuadricNormals, "gluQuadricNormals");
   pragma Import (Stdcall, gluQuadricTexture, "gluQuadricTexture");
   pragma Import (Stdcall, gluQuadricOrientation, "gluQuadricOrientation");
   pragma Import (Stdcall, gluQuadricDrawStyle, "gluQuadricDrawStyle");
   pragma Import (Stdcall, gluCylinder, "gluCylinder");
   pragma Import (Stdcall, gluDisk, "gluDisk");
   pragma Import (Stdcall, gluPartialDisk, "gluPartialDisk");
   pragma Import (Stdcall, gluSphere, "gluSphere");
   pragma Import (Stdcall, gluQuadricCallback, "gluQuadricCallback");
   pragma Import (Stdcall, gluNewTess, "gluNewTess");
   pragma Import (Stdcall, gluTessCallback, "gluTessCallback");
   pragma Import (Stdcall, gluDeleteTess, "gluDeleteTess");
   pragma Import (Stdcall, gluBeginPolygon, "gluBeginPolygon");
   pragma Import (Stdcall, gluEndPolygon, "gluEndPolygon");
   pragma Import (Stdcall, gluNextContour, "gluNextContour");
   pragma Import (Stdcall, gluTessVertex, "gluTessVertex");
   pragma Import (Stdcall, gluNewNurbsRenderer, "gluNewNurbsRenderer");
   pragma Import (Stdcall, gluDeleteNurbsRenderer, "gluDeleteNurbsRenderer");
   pragma Import (Stdcall, gluBeginSurface, "gluBeginSurface");
   pragma Import (Stdcall, gluBeginCurve, "gluBeginCurve");
   pragma Import (Stdcall, gluEndCurve, "gluEndCurve");
   pragma Import (Stdcall, gluEndSurface, "gluEndSurface");
   pragma Import (Stdcall, gluBeginTrim, "gluBeginTrim");
   pragma Import (Stdcall, gluEndTrim, "gluEndTrim");
   pragma Import (Stdcall, gluPwlCurve, "gluPwlCurve");
   pragma Import (Stdcall, gluNurbsCurve, "gluNurbsCurve");
   pragma Import (Stdcall, gluNurbsSurface, "gluNurbsSurface");
   pragma Import
     (Stdcall,
      gluLoadSamplingMatrices,
      "gluLoadSamplingMatrices");
   pragma Import (Stdcall, gluNurbsProperty, "gluNurbsProperty");
   pragma Import (Stdcall, gluGetNurbsProperty, "gluGetNurbsProperty");
   pragma Import (Stdcall, gluNurbsCallback, "gluNurbsCallback");

end Win32.Glu;
