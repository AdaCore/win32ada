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



package Win32.Glu is



   GLU_INVALID_ENUM : constant := 100900;           --  glu.h:136

   GLU_INVALID_VALUE : constant := 100901;           --  glu.h:137

   GLU_OUT_OF_MEMORY : constant := 100902;           --  glu.h:138

   GLU_TRUE : constant := 1;                --  glu.h:141

   GLU_FALSE : constant := 0;                --  glu.h:142

   GLU_SMOOTH : constant := 100000;           --  glu.h:148

   GLU_FLAT : constant := 100001;           --  glu.h:149

   GLU_NONE : constant := 100002;           --  glu.h:150

   GLU_POINT : constant := 100010;           --  glu.h:153

   GLU_LINE : constant := 100011;           --  glu.h:154

   GLU_FILL : constant := 100012;           --  glu.h:155

   GLU_SILHOUETTE : constant := 100013;           --  glu.h:156

   GLU_OUTSIDE : constant := 100020;           --  glu.h:159

   GLU_INSIDE : constant := 100021;           --  glu.h:160

   GLU_BEGIN : constant := 100100;           --  glu.h:169

   GLU_VERTEX : constant := 100101;           --  glu.h:170

   GLU_END : constant := 100102;           --  glu.h:171

   GLU_ERROR : constant := 100103;           --  glu.h:172

   GLU_EDGE_FLAG : constant := 100104;           --  glu.h:173

   GLU_CW : constant := 100120;           --  glu.h:176

   GLU_CCW : constant := 100121;           --  glu.h:177

   GLU_INTERIOR : constant := 100122;           --  glu.h:178

   GLU_EXTERIOR : constant := 100123;           --  glu.h:179

   GLU_UNKNOWN : constant := 100124;           --  glu.h:180

   GLU_TESS_ERROR1 : constant := 100151;           --  glu.h:182

   GLU_TESS_ERROR2 : constant := 100152;           --  glu.h:183

   GLU_TESS_ERROR3 : constant := 100153;           --  glu.h:184

   GLU_TESS_ERROR4 : constant := 100154;           --  glu.h:185

   GLU_TESS_ERROR5 : constant := 100155;           --  glu.h:186

   GLU_TESS_ERROR6 : constant := 100156;           --  glu.h:187

   GLU_TESS_ERROR7 : constant := 100157;           --  glu.h:188

   GLU_TESS_ERROR8 : constant := 100158;           --  glu.h:189

   GLU_AUTO_LOAD_MATRIX : constant := 100200;           --  glu.h:195

   GLU_CULLING : constant := 100201;           --  glu.h:196

   GLU_SAMPLING_TOLERANCE : constant := 100203;           --  glu.h:197

   GLU_DISPLAY_MODE : constant := 100204;           --  glu.h:198

   GLU_MAP1_TRIM_2 : constant := 100210;           --  glu.h:201

   GLU_MAP1_TRIM_3 : constant := 100211;           --  glu.h:202

   GLU_OUTLINE_POLYGON : constant := 100240;           --  glu.h:206

   GLU_OUTLINE_PATCH : constant := 100241;           --  glu.h:207

   GLU_NURBS_ERROR1 : constant := 100251;           --  glu.h:213

   GLU_NURBS_ERROR2 : constant := 100252;           --  glu.h:214

   GLU_NURBS_ERROR3 : constant := 100253;           --  glu.h:215

   GLU_NURBS_ERROR4 : constant := 100254;           --  glu.h:216

   GLU_NURBS_ERROR5 : constant := 100255;           --  glu.h:217

   GLU_NURBS_ERROR6 : constant := 100256;           --  glu.h:218

   GLU_NURBS_ERROR7 : constant := 100257;           --  glu.h:219

   GLU_NURBS_ERROR8 : constant := 100258;           --  glu.h:220

   GLU_NURBS_ERROR9 : constant := 100259;           --  glu.h:221

   GLU_NURBS_ERROR10 : constant := 100260;           --  glu.h:222

   GLU_NURBS_ERROR11 : constant := 100261;           --  glu.h:223

   GLU_NURBS_ERROR12 : constant := 100262;           --  glu.h:224

   GLU_NURBS_ERROR13 : constant := 100263;           --  glu.h:225

   GLU_NURBS_ERROR14 : constant := 100264;           --  glu.h:226

   GLU_NURBS_ERROR15 : constant := 100265;           --  glu.h:227

   GLU_NURBS_ERROR16 : constant := 100266;           --  glu.h:228

   GLU_NURBS_ERROR17 : constant := 100267;           --  glu.h:229

   GLU_NURBS_ERROR18 : constant := 100268;           --  glu.h:230

   GLU_NURBS_ERROR19 : constant := 100269;           --  glu.h:231

   GLU_NURBS_ERROR20 : constant := 100270;           --  glu.h:232

   GLU_NURBS_ERROR21 : constant := 100271;           --  glu.h:233

   GLU_NURBS_ERROR22 : constant := 100272;           --  glu.h:234

   GLU_NURBS_ERROR23 : constant := 100273;           --  glu.h:235

   GLU_NURBS_ERROR24 : constant := 100274;           --  glu.h:236

   GLU_NURBS_ERROR25 : constant := 100275;           --  glu.h:237

   GLU_NURBS_ERROR26 : constant := 100276;           --  glu.h:238

   GLU_NURBS_ERROR27 : constant := 100277;           --  glu.h:239

   GLU_NURBS_ERROR28 : constant := 100278;           --  glu.h:240

   GLU_NURBS_ERROR29 : constant := 100279;           --  glu.h:241

   GLU_NURBS_ERROR30 : constant := 100280;           --  glu.h:242

   GLU_NURBS_ERROR31 : constant := 100281;           --  glu.h:243

   GLU_NURBS_ERROR32 : constant := 100282;           --  glu.h:244

   GLU_NURBS_ERROR33 : constant := 100283;           --  glu.h:245

   GLU_NURBS_ERROR34 : constant := 100284;           --  glu.h:246

   GLU_NURBS_ERROR35 : constant := 100285;           --  glu.h:247

   GLU_NURBS_ERROR36 : constant := 100286;           --  glu.h:248

   GLU_NURBS_ERROR37 : constant := 100287;           --  glu.h:249



   type GLint_Array is                                     --  glu.h:63

     array (Integer range 0 .. 3)

     of Win32.Gl.GLint;



   type GLdouble_Array_16 is                               --  glu.h:65

     array (Integer range 0 .. 15)

     of Win32.Gl.GLdouble;



   type GLfloat_Array is                                   --  glu.h:111

     array (Integer range 0 .. 15)

     of Win32.Gl.GLfloat;



   type ap_84_fn is access procedure;                     --  glu.h:84

   pragma Convention (Stdcall, ap_84_fn);



   type GLdouble_Array_3 is                                --  glu.h:93

     array (Integer range 0 .. 2)

     of Win32.Gl.GLdouble;



   type GLUquadricObj is private;                          --  glu.h:73

   type PGLUquadricObj is access all GLUquadricObj;        --  glu.h:73



   type GLUtriangulatorObj is private;                     --  glu.h:87

   type PGLUtriangulatorObj is access all GLUtriangulatorObj;

   --  glu.h:86



   type GLUnurbsObj is private;                            --  glu.h:100

   type PGLUnurbsObj is access all GLUnurbsObj;            --  glu.h:100



   type GLUquadricErrorProc is access procedure

     (p1 : Win32.Gl.GLenum);                       --  glu.h:120

   pragma Convention (Stdcall, GLUquadricErrorProc);



   type GLUtessBeginProc is access procedure

     (p1 : Win32.Gl.GLenum);                       --  glu.h:123

   pragma Convention (Stdcall, GLUtessBeginProc);



   type GLUtessEdgeFlagProc is access procedure

     (p1 : Win32.Gl.GLboolean);                    --  glu.h:124

   pragma Convention (Stdcall, GLUtessEdgeFlagProc);



   type GLUtessVertexProc is access procedure

     (p1 : Win32.PVOID);                           --  glu.h:125

   pragma Convention (Stdcall, GLUtessVertexProc);



   type GLUtessEndProc is access procedure;               --  glu.h:126

   pragma Convention (Stdcall, GLUtessEndProc);



   type GLUtessErrorProc is access procedure

     (p1 : Win32.Gl.GLenum);                       --  glu.h:127

   pragma Convention (Stdcall, GLUtessErrorProc);



   type GLUnurbsErrorProc is access procedure

     (p1 : Win32.Gl.GLenum);                       --  glu.h:130

   pragma Convention (Stdcall, GLUnurbsErrorProc);



   function gluErrorStringWIN (errCode : Win32.Gl.GLenum)

                              return Win32.LPCWSTR;                --  glu.h:56



   function gluErrorString

     (errCode : Win32.Gl.GLenum)

     return Win32.PCBYTE;                         --  glu.h:58



   function gluErrorUnicodeStringEXT

     (errCode : Win32.Gl.GLenum)

     return Win32.PCWSTR;                         --  glu.h:59



   procedure gluOrtho2D

     (left : Win32.Gl.GLdouble;

      right : Win32.Gl.GLdouble;

      bottom : Win32.Gl.GLdouble;

      top : Win32.Gl.GLdouble);                 --  glu.h:61



   procedure gluPerspective

     (fovy : Win32.Gl.GLdouble;

      aspect : Win32.Gl.GLdouble;

      zNear : Win32.Gl.GLdouble;

      zFar : Win32.Gl.GLdouble);                 --  glu.h:62



   procedure gluPickMatrix

     (x : Win32.Gl.GLdouble;

      y : Win32.Gl.GLdouble;

      width : Win32.Gl.GLdouble;

      height : Win32.Gl.GLdouble;

      viewport : GLint_Array);                     --  glu.h:63



   procedure gluLookAt

     (eyex : Win32.Gl.GLdouble;

      eyey : Win32.Gl.GLdouble;

      eyez : Win32.Gl.GLdouble;

      centerx : Win32.Gl.GLdouble;

      centery : Win32.Gl.GLdouble;

      centerz : Win32.Gl.GLdouble;

      upx : Win32.Gl.GLdouble;

      upy : Win32.Gl.GLdouble;

      upz : Win32.Gl.GLdouble);                --  glu.h:64



   function gluProject

     (objx : Win32.Gl.GLdouble;

      objy : Win32.Gl.GLdouble;

      objz : Win32.Gl.GLdouble;

      modelMatrix : GLdouble_Array_16;

      projMatrix : GLdouble_Array_16;

      viewport : GLint_Array;

      winx : access Win32.Gl.GLdouble;

      winy : access Win32.Gl.GLdouble;

      winz : access Win32.Gl.GLdouble)

     return Win32.INT;                            --  glu.h:65



   function gluUnProject

     (winx : Win32.Gl.GLdouble;

      winy : Win32.Gl.GLdouble;

      winz : Win32.Gl.GLdouble;

      modelMatrix : GLdouble_Array_16;

      projMatrix : GLdouble_Array_16;

      viewport : GLint_Array;

      objx : access Win32.Gl.GLdouble;

      objy : access Win32.Gl.GLdouble;

      objz : access Win32.Gl.GLdouble)

     return Win32.INT;                            --  glu.h:66



   function gluScaleImage

     (format : Win32.Gl.GLenum;

      widthin : Win32.Gl.GLint;

      heightin : Win32.Gl.GLint;

      typein : Win32.Gl.GLenum;

      datain : Win32.PCVOID;

      widthout : Win32.Gl.GLint;

      heightout : Win32.Gl.GLint;

      typeout : Win32.Gl.GLenum;

      dataout : Win32.PVOID)

     return Win32.INT;                            --  glu.h:68



   function gluBuild1DMipmaps

     (target : Win32.Gl.GLenum;

      components : Win32.Gl.GLint;

      width : Win32.Gl.GLint;

      format : Win32.Gl.GLenum;

      c_type : Win32.Gl.GLenum;

      data : Win32.PCVOID)

     return Win32.INT;                            --  glu.h:70



   function gluBuild2DMipmaps

     (target : Win32.Gl.GLenum;

      components : Win32.Gl.GLint;

      width : Win32.Gl.GLint;

      height : Win32.Gl.GLint;

      format : Win32.Gl.GLenum;

      c_type : Win32.Gl.GLenum;

      data : Win32.PCVOID)

     return Win32.INT;                            --  glu.h:71



   function gluNewQuadric return PGLUquadricObj;           --  glu.h:74



   procedure gluDeleteQuadric

     (state : PGLUquadricObj);                     --  glu.h:75



   procedure gluQuadricNormals

     (quadObject : PGLUquadricObj;

      normals : Win32.Gl.GLenum);               --  glu.h:76



   procedure gluQuadricTexture

     (quadObject : PGLUquadricObj;

      textureCoords : Win32.Gl.GLboolean);         --  glu.h:77



   procedure gluQuadricOrientation

     (quadObject : PGLUquadricObj;

      orientation : Win32.Gl.GLenum);              --  glu.h:78



   procedure gluQuadricDrawStyle

     (quadObject : PGLUquadricObj;

      drawStyle : Win32.Gl.GLenum);               --  glu.h:79



   procedure gluCylinder

     (qobj : PGLUquadricObj;

      baseRadius : Win32.Gl.GLdouble;

      topRadius : Win32.Gl.GLdouble;

      height : Win32.Gl.GLdouble;

      slices : Win32.Gl.GLint;

      stacks : Win32.Gl.GLint);                --  glu.h:80



   procedure gluDisk

     (qobj : PGLUquadricObj;

      innerRadius : Win32.Gl.GLdouble;

      outerRadius : Win32.Gl.GLdouble;

      slices : Win32.Gl.GLint;

      loops : Win32.Gl.GLint);               --  glu.h:81



   procedure gluPartialDisk

     (qobj : PGLUquadricObj;

      innerRadius : Win32.Gl.GLdouble;

      outerRadius : Win32.Gl.GLdouble;

      slices : Win32.Gl.GLint;

      loops : Win32.Gl.GLint;

      startAngle : Win32.Gl.GLdouble;

      sweepAngle : Win32.Gl.GLdouble);            --  glu.h:82



   procedure gluSphere

     (qobj : PGLUquadricObj;

      radius : Win32.Gl.GLdouble;

      slices : Win32.Gl.GLint;

      stacks : Win32.Gl.GLint);                    --  glu.h:83



   procedure gluQuadricCallback

     (qobj : PGLUquadricObj;

      which : Win32.Gl.GLenum;

      fn : ap_84_fn);                           --  glu.h:84



   function gluNewTess return PGLUtriangulatorObj;         --  glu.h:87



   procedure gluTessCallback

     (tobj : PGLUtriangulatorObj;

      which : Win32.Gl.GLenum;

      fn : ap_84_fn);                           --  glu.h:88



   procedure gluDeleteTess

     (tobj : PGLUtriangulatorObj);                 --  glu.h:89



   procedure gluBeginPolygon

     (tobj : PGLUtriangulatorObj);                 --  glu.h:90



   procedure gluEndPolygon

     (tobj : PGLUtriangulatorObj);                 --  glu.h:91



   procedure gluNextContour

     (tobj : PGLUtriangulatorObj;

      c_type : Win32.Gl.GLenum);                   --  glu.h:92



   procedure gluTessVertex

     (tobj : PGLUtriangulatorObj;

      v : GLdouble_Array_3;

      data : Win32.PVOID);                         --  glu.h:93



   function gluNewNurbsRenderer return PGLUnurbsObj;       --  glu.h:100



   procedure gluDeleteNurbsRenderer

     (nobj : PGLUnurbsObj);                        --  glu.h:101



   procedure gluBeginSurface

     (nobj : PGLUnurbsObj);                        --  glu.h:102



   procedure gluBeginCurve

     (nobj : PGLUnurbsObj);                        --  glu.h:103



   procedure gluEndCurve

     (nobj : PGLUnurbsObj);                        --  glu.h:104



   procedure gluEndSurface

     (nobj : PGLUnurbsObj);                        --  glu.h:105



   procedure gluBeginTrim

     (nobj : PGLUnurbsObj);                        --  glu.h:106



   procedure gluEndTrim

     (nobj : PGLUnurbsObj);                        --  glu.h:107



   procedure gluPwlCurve

     (nobj : PGLUnurbsObj;

      count : Win32.Gl.GLint;

      c_array : access Win32.Gl.GLfloat;

      stride : Win32.Gl.GLint;

      c_type : Win32.Gl.GLenum);                  --  glu.h:108



   procedure gluNurbsCurve

     (nobj : PGLUnurbsObj;

      nknots : Win32.Gl.GLint;

      knot : access Win32.Gl.GLfloat;

      stride : Win32.Gl.GLint;

      ctlarray : access Win32.Gl.GLfloat;

      order : Win32.Gl.GLint;

      c_type : Win32.Gl.GLenum);                 --  glu.h:109



   procedure gluNurbsSurface

     (nobj : PGLUnurbsObj;

      sknot_count : Win32.Gl.GLint;

      sknot : access Win32.Gl.GLfloat;

      tknot_count : Win32.Gl.GLint;

      tknot : access Win32.Gl.GLfloat;

      s_stride : Win32.Gl.GLint;

      t_stride : Win32.Gl.GLint;

      ctlarray : access Win32.Gl.GLfloat;

      sorder : Win32.Gl.GLint;

      torder : Win32.Gl.GLint;

      c_type : Win32.Gl.GLenum);              --  glu.h:110



   procedure gluLoadSamplingMatrices

     (nobj : PGLUnurbsObj;

      modelMatrix : GLfloat_Array;

      projMatrix : GLfloat_Array;

      viewport : GLint_Array);                  --  glu.h:111



   procedure gluNurbsProperty

     (nobj : PGLUnurbsObj;

      property : Win32.Gl.GLenum;

      value : Win32.Gl.GLfloat);                --  glu.h:112



   procedure gluGetNurbsProperty

     (nobj : PGLUnurbsObj;

      property : Win32.Gl.GLenum;

      value : access Win32.Gl.GLfloat);         --  glu.h:113



   procedure gluNurbsCallback

     (nobj : PGLUnurbsObj;

      which : Win32.Gl.GLenum;

      fn : ap_84_fn);                           --  glu.h:114



private



   type GLUquadricObj is null record;                      --  glu.h:73

   type GLUtriangulatorObj is null record;                 --  glu.h:86

   type GLUnurbsObj is null record;                        --  glu.h:98



   pragma Import (Stdcall, gluErrorString, "gluErrorString");     --  glu.h:58

   pragma Import (Stdcall, gluErrorUnicodeStringEXT,

                    "gluErrorUnicodeStringEXT");

   --  glu.h:59

   pragma Import (Stdcall, gluOrtho2D, "gluOrtho2D");             --  glu.h:61

   pragma Import (Stdcall, gluPerspective, "gluPerspective");     --  glu.h:62

   pragma Import (Stdcall, gluPickMatrix, "gluPickMatrix");       --  glu.h:63

   pragma Import (Stdcall, gluLookAt, "gluLookAt");               --  glu.h:64

   pragma Import (Stdcall, gluProject, "gluProject");             --  glu.h:65

   pragma Import (Stdcall, gluUnProject, "gluUnProject");         --  glu.h:66

   pragma Import (Stdcall, gluScaleImage, "gluScaleImage");       --  glu.h:68

   pragma Import (Stdcall, gluBuild1DMipmaps, "gluBuild1DMipmaps");

   --  glu.h:70

   pragma Import (Stdcall, gluBuild2DMipmaps, "gluBuild2DMipmaps");

   --  glu.h:71

   pragma Import (Stdcall, gluNewQuadric, "gluNewQuadric");       --  glu.h:74

   pragma Import (Stdcall, gluDeleteQuadric, "gluDeleteQuadric"); --  glu.h:75

   pragma Import (Stdcall, gluQuadricNormals, "gluQuadricNormals");

   --  glu.h:76

   pragma Import (Stdcall, gluQuadricTexture, "gluQuadricTexture");

   --  glu.h:77

   pragma Import (Stdcall, gluQuadricOrientation, "gluQuadricOrientation");

   --  glu.h:78

   pragma Import (Stdcall, gluQuadricDrawStyle, "gluQuadricDrawStyle");

   --  glu.h:79

   pragma Import (Stdcall, gluCylinder, "gluCylinder");           --  glu.h:80

   pragma Import (Stdcall, gluDisk, "gluDisk");                   --  glu.h:81

   pragma Import (Stdcall, gluPartialDisk, "gluPartialDisk");     --  glu.h:82

   pragma Import (Stdcall, gluSphere, "gluSphere");               --  glu.h:83

   pragma Import (Stdcall, gluQuadricCallback, "gluQuadricCallback");

   --  glu.h:84

   pragma Import (Stdcall, gluNewTess, "gluNewTess");             --  glu.h:87

   pragma Import (Stdcall, gluTessCallback, "gluTessCallback");   --  glu.h:88

   pragma Import (Stdcall, gluDeleteTess, "gluDeleteTess");       --  glu.h:89

   pragma Import (Stdcall, gluBeginPolygon, "gluBeginPolygon");   --  glu.h:90

   pragma Import (Stdcall, gluEndPolygon, "gluEndPolygon");       --  glu.h:91

   pragma Import (Stdcall, gluNextContour, "gluNextContour");     --  glu.h:92

   pragma Import (Stdcall, gluTessVertex, "gluTessVertex");       --  glu.h:93

   pragma Import (Stdcall, gluNewNurbsRenderer, "gluNewNurbsRenderer");

   --  glu.h:100

   pragma Import (Stdcall, gluDeleteNurbsRenderer, "gluDeleteNurbsRenderer");

   --  glu.h:101

   pragma Import (Stdcall, gluBeginSurface, "gluBeginSurface");   --  glu.h:102

   pragma Import (Stdcall, gluBeginCurve, "gluBeginCurve");       --  glu.h:103

   pragma Import (Stdcall, gluEndCurve, "gluEndCurve");           --  glu.h:104

   pragma Import (Stdcall, gluEndSurface, "gluEndSurface");       --  glu.h:105

   pragma Import (Stdcall, gluBeginTrim, "gluBeginTrim");         --  glu.h:106

   pragma Import (Stdcall, gluEndTrim, "gluEndTrim");             --  glu.h:107

   pragma Import (Stdcall, gluPwlCurve, "gluPwlCurve");           --  glu.h:108

   pragma Import (Stdcall, gluNurbsCurve, "gluNurbsCurve");       --  glu.h:109

   pragma Import (Stdcall, gluNurbsSurface, "gluNurbsSurface");   --  glu.h:110

   pragma Import (Stdcall, gluLoadSamplingMatrices, "gluLoadSamplingMatrices");

   --  glu.h:111

   pragma Import (Stdcall, gluNurbsProperty, "gluNurbsProperty"); --  glu.h:112

   pragma Import (Stdcall, gluGetNurbsProperty, "gluGetNurbsProperty");

   --  glu.h:113

   pragma Import (Stdcall, gluNurbsCallback, "gluNurbsCallback"); --  glu.h:114



end Win32.Glu;





