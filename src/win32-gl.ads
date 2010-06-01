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

package Win32.Gl is

   GL_ACCUM                         : constant := 16#100#;
   GL_LOAD                          : constant := 16#101#;
   GL_RETURN                        : constant := 16#102#;
   GL_MULT                          : constant := 16#103#;
   GL_ADD                           : constant := 16#104#;
   GL_NEVER                         : constant := 16#200#;
   GL_LESS                          : constant := 16#201#;
   GL_EQUAL                         : constant := 16#202#;
   GL_LEQUAL                        : constant := 16#203#;
   GL_GREATER                       : constant := 16#204#;
   GL_NOTEQUAL                      : constant := 16#205#;
   GL_GEQUAL                        : constant := 16#206#;
   GL_ALWAYS                        : constant := 16#207#;
   GL_CURRENT_BIT                   : constant := 16#1#;
   GL_POINT_BIT                     : constant := 16#2#;
   GL_LINE_BIT                      : constant := 16#4#;
   GL_POLYGON_BIT                   : constant := 16#8#;
   GL_POLYGON_STIPPLE_BIT           : constant := 16#10#;
   GL_PIXEL_MODE_BIT                : constant := 16#20#;
   GL_LIGHTING_BIT                  : constant := 16#40#;
   GL_FOG_BIT                       : constant := 16#80#;
   GL_DEPTH_BUFFER_BIT              : constant := 16#100#;
   GL_ACCUM_BUFFER_BIT              : constant := 16#200#;
   GL_STENCIL_BUFFER_BIT            : constant := 16#400#;
   GL_VIEWPORT_BIT                  : constant := 16#800#;
   GL_TRANSFORM_BIT                 : constant := 16#1000#;
   GL_ENABLE_BIT                    : constant := 16#2000#;
   GL_COLOR_BUFFER_BIT              : constant := 16#4000#;
   GL_HINT_BIT                      : constant := 16#8000#;
   GL_EVAL_BIT                      : constant := 16#10000#;
   GL_LIST_BIT                      : constant := 16#20000#;
   GL_TEXTURE_BIT                   : constant := 16#40000#;
   GL_SCISSOR_BIT                   : constant := 16#80000#;
   GL_ALL_ATTRIB_BITS               : constant := 16#fffff#;
   GL_POINTS                        : constant := 16#0#;
   GL_LINES                         : constant := 16#1#;
   GL_LINE_LOOP                     : constant := 16#2#;
   GL_LINE_STRIP                    : constant := 16#3#;
   GL_TRIANGLES                     : constant := 16#4#;
   GL_TRIANGLE_STRIP                : constant := 16#5#;
   GL_TRIANGLE_FAN                  : constant := 16#6#;
   GL_QUADS                         : constant := 16#7#;
   GL_QUAD_STRIP                    : constant := 16#8#;
   GL_POLYGON                       : constant := 16#9#;
   GL_ZERO                          : constant := 0;
   GL_ONE                           : constant := 1;
   GL_SRC_COLOR                     : constant := 16#300#;
   GL_ONE_MINUS_SRC_COLOR           : constant := 16#301#;
   GL_SRC_ALPHA                     : constant := 16#302#;
   GL_ONE_MINUS_SRC_ALPHA           : constant := 16#303#;
   GL_DST_ALPHA                     : constant := 16#304#;
   GL_ONE_MINUS_DST_ALPHA           : constant := 16#305#;
   GL_DST_COLOR                     : constant := 16#306#;
   GL_ONE_MINUS_DST_COLOR           : constant := 16#307#;
   GL_SRC_ALPHA_SATURATE            : constant := 16#308#;
   GL_TRUE                          : constant := 1;
   GL_FALSE                         : constant := 0;
   GL_CLIP_PLANE0                   : constant := 16#3000#;
   GL_CLIP_PLANE1                   : constant := 16#3001#;
   GL_CLIP_PLANE2                   : constant := 16#3002#;
   GL_CLIP_PLANE3                   : constant := 16#3003#;
   GL_CLIP_PLANE4                   : constant := 16#3004#;
   GL_CLIP_PLANE5                   : constant := 16#3005#;
   GL_NONE                          : constant := 0;
   GL_FRONT_LEFT                    : constant := 16#400#;
   GL_FRONT_RIGHT                   : constant := 16#401#;
   GL_BACK_LEFT                     : constant := 16#402#;
   GL_BACK_RIGHT                    : constant := 16#403#;
   GL_FRONT                         : constant := 16#404#;
   GL_BACK                          : constant := 16#405#;
   GL_LEFT                          : constant := 16#406#;
   GL_RIGHT                         : constant := 16#407#;
   GL_FRONT_AND_BACK                : constant := 16#408#;
   GL_AUX0                          : constant := 16#409#;
   GL_AUX1                          : constant := 16#40a#;
   GL_AUX2                          : constant := 16#40b#;
   GL_AUX3                          : constant := 16#40c#;
   GL_NO_ERROR                      : constant := 0;
   GL_INVALID_ENUM                  : constant := 16#500#;
   GL_INVALID_VALUE                 : constant := 16#501#;
   GL_INVALID_OPERATION             : constant := 16#502#;
   GL_STACK_OVERFLOW                : constant := 16#503#;
   GL_STACK_UNDERFLOW               : constant := 16#504#;
   GL_OUT_OF_MEMORY                 : constant := 16#505#;
   GL_2D                            : constant := 16#600#;
   GL_3D                            : constant := 16#601#;
   GL_3D_COLOR                      : constant := 16#602#;
   GL_3D_COLOR_TEXTURE              : constant := 16#603#;
   GL_4D_COLOR_TEXTURE              : constant := 16#604#;
   GL_PASS_THROUGH_TOKEN            : constant := 16#700#;
   GL_POINT_TOKEN                   : constant := 16#701#;
   GL_LINE_TOKEN                    : constant := 16#702#;
   GL_POLYGON_TOKEN                 : constant := 16#703#;
   GL_BITMAP_TOKEN                  : constant := 16#704#;
   GL_DRAW_PIXEL_TOKEN              : constant := 16#705#;
   GL_COPY_PIXEL_TOKEN              : constant := 16#706#;
   GL_LINE_RESET_TOKEN              : constant := 16#707#;
   GL_EXP                           : constant := 16#800#;
   GL_EXP2                          : constant := 16#801#;
   GL_CW                            : constant := 16#900#;
   GL_CCW                           : constant := 16#901#;
   GL_COEFF                         : constant := 16#a00#;
   GL_ORDER                         : constant := 16#a01#;
   GL_DOMAIN                        : constant := 16#a02#;
   GL_CURRENT_COLOR                 : constant := 16#b00#;
   GL_CURRENT_INDEX                 : constant := 16#b01#;
   GL_CURRENT_NORMAL                : constant := 16#b02#;
   GL_CURRENT_TEXTURE_COORDS        : constant := 16#b03#;
   GL_CURRENT_RASTER_COLOR          : constant := 16#b04#;
   GL_CURRENT_RASTER_INDEX          : constant := 16#b05#;
   GL_CURRENT_RASTER_TEXTURE_COORDS : constant := 16#b06#;
   GL_CURRENT_RASTER_POSITION       : constant := 16#b07#;
   GL_CURRENT_RASTER_POSITION_VALID : constant := 16#b08#;
   GL_CURRENT_RASTER_DISTANCE       : constant := 16#b09#;
   GL_POINT_SMOOTH                  : constant := 16#b10#;
   GL_POINT_SIZE                    : constant := 16#b11#;
   GL_POINT_SIZE_RANGE              : constant := 16#b12#;
   GL_POINT_SIZE_GRANULARITY        : constant := 16#b13#;
   GL_LINE_SMOOTH                   : constant := 16#b20#;
   GL_LINE_WIDTH                    : constant := 16#b21#;
   GL_LINE_WIDTH_RANGE              : constant := 16#b22#;
   GL_LINE_WIDTH_GRANULARITY        : constant := 16#b23#;
   GL_LINE_STIPPLE                  : constant := 16#b24#;
   GL_LINE_STIPPLE_PATTERN          : constant := 16#b25#;
   GL_LINE_STIPPLE_REPEAT           : constant := 16#b26#;
   GL_LIST_MODE                     : constant := 16#b30#;
   GL_MAX_LIST_NESTING              : constant := 16#b31#;
   GL_LIST_BASE                     : constant := 16#b32#;
   GL_LIST_INDEX                    : constant := 16#b33#;
   GL_POLYGON_MODE                  : constant := 16#b40#;
   GL_POLYGON_SMOOTH                : constant := 16#b41#;
   GL_POLYGON_STIPPLE               : constant := 16#b42#;
   GL_EDGE_FLAG                     : constant := 16#b43#;
   GL_CULL_FACE                     : constant := 16#b44#;
   GL_CULL_FACE_MODE                : constant := 16#b45#;
   GL_FRONT_FACE                    : constant := 16#b46#;
   GL_LIGHTING                      : constant := 16#b50#;
   GL_LIGHT_MODEL_LOCAL_VIEWER      : constant := 16#b51#;
   GL_LIGHT_MODEL_TWO_SIDE          : constant := 16#b52#;
   GL_LIGHT_MODEL_AMBIENT           : constant := 16#b53#;
   GL_SHADE_MODEL                   : constant := 16#b54#;
   GL_COLOR_MATERIAL_FACE           : constant := 16#b55#;
   GL_COLOR_MATERIAL_PARAMETER      : constant := 16#b56#;
   GL_COLOR_MATERIAL                : constant := 16#b57#;
   GL_FOG                           : constant := 16#b60#;
   GL_FOG_INDEX                     : constant := 16#b61#;
   GL_FOG_DENSITY                   : constant := 16#b62#;
   GL_FOG_START                     : constant := 16#b63#;
   GL_FOG_END                       : constant := 16#b64#;
   GL_FOG_MODE                      : constant := 16#b65#;
   GL_FOG_COLOR                     : constant := 16#b66#;
   GL_DEPTH_RANGE                   : constant := 16#b70#;
   GL_DEPTH_TEST                    : constant := 16#b71#;
   GL_DEPTH_WRITEMASK               : constant := 16#b72#;
   GL_DEPTH_CLEAR_VALUE             : constant := 16#b73#;
   GL_DEPTH_FUNC                    : constant := 16#b74#;
   GL_ACCUM_CLEAR_VALUE             : constant := 16#b80#;
   GL_STENCIL_TEST                  : constant := 16#b90#;
   GL_STENCIL_CLEAR_VALUE           : constant := 16#b91#;
   GL_STENCIL_FUNC                  : constant := 16#b92#;
   GL_STENCIL_VALUE_MASK            : constant := 16#b93#;
   GL_STENCIL_FAIL                  : constant := 16#b94#;
   GL_STENCIL_PASS_DEPTH_FAIL       : constant := 16#b95#;
   GL_STENCIL_PASS_DEPTH_PASS       : constant := 16#b96#;
   GL_STENCIL_REF                   : constant := 16#b97#;
   GL_STENCIL_WRITEMASK             : constant := 16#b98#;
   GL_MATRIX_MODE                   : constant := 16#ba0#;
   GL_NORMALIZE                     : constant := 16#ba1#;
   GL_VIEWPORT                      : constant := 16#ba2#;
   GL_MODELVIEW_STACK_DEPTH         : constant := 16#ba3#;
   GL_PROJECTION_STACK_DEPTH        : constant := 16#ba4#;
   GL_TEXTURE_STACK_DEPTH           : constant := 16#ba5#;
   GL_MODELVIEW_MATRIX              : constant := 16#ba6#;
   GL_PROJECTION_MATRIX             : constant := 16#ba7#;
   GL_TEXTURE_MATRIX                : constant := 16#ba8#;
   GL_ATTRIB_STACK_DEPTH            : constant := 16#bb0#;
   GL_ALPHA_TEST                    : constant := 16#bc0#;
   GL_ALPHA_TEST_FUNC               : constant := 16#bc1#;
   GL_ALPHA_TEST_REF                : constant := 16#bc2#;
   GL_DITHER                        : constant := 16#bd0#;
   GL_BLEND_DST                     : constant := 16#be0#;
   GL_BLEND_SRC                     : constant := 16#be1#;
   GL_BLEND                         : constant := 16#be2#;
   GL_LOGIC_OP_MODE                 : constant := 16#bf0#;
   GL_LOGIC_OP                      : constant := 16#bf1#;
   GL_AUX_BUFFERS                   : constant := 16#c00#;
   GL_DRAW_BUFFER                   : constant := 16#c01#;
   GL_READ_BUFFER                   : constant := 16#c02#;
   GL_SCISSOR_BOX                   : constant := 16#c10#;
   GL_SCISSOR_TEST                  : constant := 16#c11#;
   GL_INDEX_CLEAR_VALUE             : constant := 16#c20#;
   GL_INDEX_WRITEMASK               : constant := 16#c21#;
   GL_COLOR_CLEAR_VALUE             : constant := 16#c22#;
   GL_COLOR_WRITEMASK               : constant := 16#c23#;
   GL_INDEX_MODE                    : constant := 16#c30#;
   GL_RGBA_MODE                     : constant := 16#c31#;
   GL_DOUBLEBUFFER                  : constant := 16#c32#;
   GL_STEREO                        : constant := 16#c33#;
   GL_RENDER_MODE                   : constant := 16#c40#;
   GL_PERSPECTIVE_CORRECTION_HINT   : constant := 16#c50#;
   GL_POINT_SMOOTH_HINT             : constant := 16#c51#;
   GL_LINE_SMOOTH_HINT              : constant := 16#c52#;
   GL_POLYGON_SMOOTH_HINT           : constant := 16#c53#;
   GL_FOG_HINT                      : constant := 16#c54#;
   GL_TEXTURE_GEN_S                 : constant := 16#c60#;
   GL_TEXTURE_GEN_T                 : constant := 16#c61#;
   GL_TEXTURE_GEN_R                 : constant := 16#c62#;
   GL_TEXTURE_GEN_Q                 : constant := 16#c63#;
   GL_PIXEL_MAP_I_TO_I              : constant := 16#c70#;
   GL_PIXEL_MAP_S_TO_S              : constant := 16#c71#;
   GL_PIXEL_MAP_I_TO_R              : constant := 16#c72#;
   GL_PIXEL_MAP_I_TO_G              : constant := 16#c73#;
   GL_PIXEL_MAP_I_TO_B              : constant := 16#c74#;
   GL_PIXEL_MAP_I_TO_A              : constant := 16#c75#;
   GL_PIXEL_MAP_R_TO_R              : constant := 16#c76#;
   GL_PIXEL_MAP_G_TO_G              : constant := 16#c77#;
   GL_PIXEL_MAP_B_TO_B              : constant := 16#c78#;
   GL_PIXEL_MAP_A_TO_A              : constant := 16#c79#;
   GL_PIXEL_MAP_I_TO_I_SIZE         : constant := 16#cb0#;
   GL_PIXEL_MAP_S_TO_S_SIZE         : constant := 16#cb1#;
   GL_PIXEL_MAP_I_TO_R_SIZE         : constant := 16#cb2#;
   GL_PIXEL_MAP_I_TO_G_SIZE         : constant := 16#cb3#;
   GL_PIXEL_MAP_I_TO_B_SIZE         : constant := 16#cb4#;
   GL_PIXEL_MAP_I_TO_A_SIZE         : constant := 16#cb5#;
   GL_PIXEL_MAP_R_TO_R_SIZE         : constant := 16#cb6#;
   GL_PIXEL_MAP_G_TO_G_SIZE         : constant := 16#cb7#;
   GL_PIXEL_MAP_B_TO_B_SIZE         : constant := 16#cb8#;
   GL_PIXEL_MAP_A_TO_A_SIZE         : constant := 16#cb9#;
   GL_UNPACK_SWAP_BYTES             : constant := 16#cf0#;
   GL_UNPACK_LSB_FIRST              : constant := 16#cf1#;
   GL_UNPACK_ROW_LENGTH             : constant := 16#cf2#;
   GL_UNPACK_SKIP_ROWS              : constant := 16#cf3#;
   GL_UNPACK_SKIP_PIXELS            : constant := 16#cf4#;
   GL_UNPACK_ALIGNMENT              : constant := 16#cf5#;
   GL_PACK_SWAP_BYTES               : constant := 16#d00#;
   GL_PACK_LSB_FIRST                : constant := 16#d01#;
   GL_PACK_ROW_LENGTH               : constant := 16#d02#;
   GL_PACK_SKIP_ROWS                : constant := 16#d03#;
   GL_PACK_SKIP_PIXELS              : constant := 16#d04#;
   GL_PACK_ALIGNMENT                : constant := 16#d05#;
   GL_MAP_COLOR                     : constant := 16#d10#;
   GL_MAP_STENCIL                   : constant := 16#d11#;
   GL_INDEX_SHIFT                   : constant := 16#d12#;
   GL_INDEX_OFFSET                  : constant := 16#d13#;
   GL_RED_SCALE                     : constant := 16#d14#;
   GL_RED_BIAS                      : constant := 16#d15#;
   GL_ZOOM_X                        : constant := 16#d16#;
   GL_ZOOM_Y                        : constant := 16#d17#;
   GL_GREEN_SCALE                   : constant := 16#d18#;
   GL_GREEN_BIAS                    : constant := 16#d19#;
   GL_BLUE_SCALE                    : constant := 16#d1a#;
   GL_BLUE_BIAS                     : constant := 16#d1b#;
   GL_ALPHA_SCALE                   : constant := 16#d1c#;
   GL_ALPHA_BIAS                    : constant := 16#d1d#;
   GL_DEPTH_SCALE                   : constant := 16#d1e#;
   GL_DEPTH_BIAS                    : constant := 16#d1f#;
   GL_MAX_EVAL_ORDER                : constant := 16#d30#;
   GL_MAX_LIGHTS                    : constant := 16#d31#;
   GL_MAX_CLIP_PLANES               : constant := 16#d32#;
   GL_MAX_TEXTURE_SIZE              : constant := 16#d33#;
   GL_MAX_PIXEL_MAP_TABLE           : constant := 16#d34#;
   GL_MAX_ATTRIB_STACK_DEPTH        : constant := 16#d35#;
   GL_MAX_MODELVIEW_STACK_DEPTH     : constant := 16#d36#;
   GL_MAX_NAME_STACK_DEPTH          : constant := 16#d37#;
   GL_MAX_PROJECTION_STACK_DEPTH    : constant := 16#d38#;
   GL_MAX_TEXTURE_STACK_DEPTH       : constant := 16#d39#;
   GL_MAX_VIEWPORT_DIMS             : constant := 16#d3a#;
   GL_SUBPIXEL_BITS                 : constant := 16#d50#;
   GL_INDEX_BITS                    : constant := 16#d51#;
   GL_RED_BITS                      : constant := 16#d52#;
   GL_GREEN_BITS                    : constant := 16#d53#;
   GL_BLUE_BITS                     : constant := 16#d54#;
   GL_ALPHA_BITS                    : constant := 16#d55#;
   GL_DEPTH_BITS                    : constant := 16#d56#;
   GL_STENCIL_BITS                  : constant := 16#d57#;
   GL_ACCUM_RED_BITS                : constant := 16#d58#;
   GL_ACCUM_GREEN_BITS              : constant := 16#d59#;
   GL_ACCUM_BLUE_BITS               : constant := 16#d5a#;
   GL_ACCUM_ALPHA_BITS              : constant := 16#d5b#;
   GL_NAME_STACK_DEPTH              : constant := 16#d70#;
   GL_AUTO_NORMAL                   : constant := 16#d80#;
   GL_MAP1_COLOR_4                  : constant := 16#d90#;
   GL_MAP1_INDEX                    : constant := 16#d91#;
   GL_MAP1_NORMAL                   : constant := 16#d92#;
   GL_MAP1_TEXTURE_COORD_1          : constant := 16#d93#;
   GL_MAP1_TEXTURE_COORD_2          : constant := 16#d94#;
   GL_MAP1_TEXTURE_COORD_3          : constant := 16#d95#;
   GL_MAP1_TEXTURE_COORD_4          : constant := 16#d96#;
   GL_MAP1_VERTEX_3                 : constant := 16#d97#;
   GL_MAP1_VERTEX_4                 : constant := 16#d98#;
   GL_MAP2_COLOR_4                  : constant := 16#db0#;
   GL_MAP2_INDEX                    : constant := 16#db1#;
   GL_MAP2_NORMAL                   : constant := 16#db2#;
   GL_MAP2_TEXTURE_COORD_1          : constant := 16#db3#;
   GL_MAP2_TEXTURE_COORD_2          : constant := 16#db4#;
   GL_MAP2_TEXTURE_COORD_3          : constant := 16#db5#;
   GL_MAP2_TEXTURE_COORD_4          : constant := 16#db6#;
   GL_MAP2_VERTEX_3                 : constant := 16#db7#;
   GL_MAP2_VERTEX_4                 : constant := 16#db8#;
   GL_MAP1_GRID_DOMAIN              : constant := 16#dd0#;
   GL_MAP1_GRID_SEGMENTS            : constant := 16#dd1#;
   GL_MAP2_GRID_DOMAIN              : constant := 16#dd2#;
   GL_MAP2_GRID_SEGMENTS            : constant := 16#dd3#;
   GL_TEXTURE_1D                    : constant := 16#de0#;
   GL_TEXTURE_2D                    : constant := 16#de1#;
   GL_TEXTURE_WIDTH                 : constant := 16#1000#;
   GL_TEXTURE_HEIGHT                : constant := 16#1001#;
   GL_TEXTURE_COMPONENTS            : constant := 16#1003#;
   GL_TEXTURE_BORDER_COLOR          : constant := 16#1004#;
   GL_TEXTURE_BORDER                : constant := 16#1005#;
   GL_DONT_CARE                     : constant := 16#1100#;
   GL_FASTEST                       : constant := 16#1101#;
   GL_NICEST                        : constant := 16#1102#;
   GL_LIGHT0                        : constant := 16#4000#;
   GL_LIGHT1                        : constant := 16#4001#;
   GL_LIGHT2                        : constant := 16#4002#;
   GL_LIGHT3                        : constant := 16#4003#;
   GL_LIGHT4                        : constant := 16#4004#;
   GL_LIGHT5                        : constant := 16#4005#;
   GL_LIGHT6                        : constant := 16#4006#;
   GL_LIGHT7                        : constant := 16#4007#;
   GL_AMBIENT                       : constant := 16#1200#;
   GL_DIFFUSE                       : constant := 16#1201#;
   GL_SPECULAR                      : constant := 16#1202#;
   GL_POSITION                      : constant := 16#1203#;
   GL_SPOT_DIRECTION                : constant := 16#1204#;
   GL_SPOT_EXPONENT                 : constant := 16#1205#;
   GL_SPOT_CUTOFF                   : constant := 16#1206#;
   GL_CONSTANT_ATTENUATION          : constant := 16#1207#;
   GL_LINEAR_ATTENUATION            : constant := 16#1208#;
   GL_QUADRATIC_ATTENUATION         : constant := 16#1209#;
   GL_COMPILE                       : constant := 16#1300#;
   GL_COMPILE_AND_EXECUTE           : constant := 16#1301#;
   GL_BYTE                          : constant := 16#1400#;
   GL_UNSIGNED_BYTE                 : constant := 16#1401#;
   GL_SHORT                         : constant := 16#1402#;
   GL_UNSIGNED_SHORT                : constant := 16#1403#;
   GL_INT                           : constant := 16#1404#;
   GL_UNSIGNED_INT                  : constant := 16#1405#;
   GL_FLOAT                         : constant := 16#1406#;
   GL_2_BYTES                       : constant := 16#1407#;
   GL_3_BYTES                       : constant := 16#1408#;
   GL_4_BYTES                       : constant := 16#1409#;
   GL_CLEAR                         : constant := 16#1500#;
   GL_AND                           : constant := 16#1501#;
   GL_AND_REVERSE                   : constant := 16#1502#;
   GL_COPY                          : constant := 16#1503#;
   GL_AND_INVERTED                  : constant := 16#1504#;
   GL_NOOP                          : constant := 16#1505#;
   GL_XOR                           : constant := 16#1506#;
   GL_OR                            : constant := 16#1507#;
   GL_NOR                           : constant := 16#1508#;
   GL_EQUIV                         : constant := 16#1509#;
   GL_INVERT                        : constant := 16#150a#;
   GL_OR_REVERSE                    : constant := 16#150b#;
   GL_COPY_INVERTED                 : constant := 16#150c#;
   GL_OR_INVERTED                   : constant := 16#150d#;
   GL_NAND                          : constant := 16#150e#;
   GL_SET                           : constant := 16#150f#;
   GL_EMISSION                      : constant := 16#1600#;
   GL_SHININESS                     : constant := 16#1601#;
   GL_AMBIENT_AND_DIFFUSE           : constant := 16#1602#;
   GL_COLOR_INDEXES                 : constant := 16#1603#;
   GL_MODELVIEW                     : constant := 16#1700#;
   GL_PROJECTION                    : constant := 16#1701#;
   GL_TEXTURE                       : constant := 16#1702#;
   GL_COLOR                         : constant := 16#1800#;
   GL_DEPTH                         : constant := 16#1801#;
   GL_STENCIL                       : constant := 16#1802#;
   GL_COLOR_INDEX                   : constant := 16#1900#;
   GL_STENCIL_INDEX                 : constant := 16#1901#;
   GL_DEPTH_COMPONENT               : constant := 16#1902#;
   GL_RED                           : constant := 16#1903#;
   GL_GREEN                         : constant := 16#1904#;
   GL_BLUE                          : constant := 16#1905#;
   GL_ALPHA                         : constant := 16#1906#;
   GL_RGB                           : constant := 16#1907#;
   GL_RGBA                          : constant := 16#1908#;
   GL_LUMINANCE                     : constant := 16#1909#;
   GL_LUMINANCE_ALPHA               : constant := 16#190a#;
   GL_BITMAP                        : constant := 16#1a00#;
   GL_POINT                         : constant := 16#1b00#;
   GL_LINE                          : constant := 16#1b01#;
   GL_FILL                          : constant := 16#1b02#;
   GL_RENDER                        : constant := 16#1c00#;
   GL_FEEDBACK                      : constant := 16#1c01#;
   GL_SELECT                        : constant := 16#1c02#;
   GL_FLAT                          : constant := 16#1d00#;
   GL_SMOOTH                        : constant := 16#1d01#;
   GL_KEEP                          : constant := 16#1e00#;
   GL_REPLACE                       : constant := 16#1e01#;
   GL_INCR                          : constant := 16#1e02#;
   GL_DECR                          : constant := 16#1e03#;
   GL_VENDOR                        : constant := 16#1f00#;
   GL_RENDERER                      : constant := 16#1f01#;
   GL_VERSION                       : constant := 16#1f02#;
   GL_EXTENSIONS                    : constant := 16#1f03#;
   GL_S                             : constant := 16#2000#;
   GL_T                             : constant := 16#2001#;
   GL_R                             : constant := 16#2002#;
   GL_Q                             : constant := 16#2003#;
   GL_MODULATE                      : constant := 16#2100#;
   GL_DECAL                         : constant := 16#2101#;
   GL_TEXTURE_ENV_MODE              : constant := 16#2200#;
   GL_TEXTURE_ENV_COLOR             : constant := 16#2201#;
   GL_TEXTURE_ENV                   : constant := 16#2300#;
   GL_EYE_LINEAR                    : constant := 16#2400#;
   GL_OBJECT_LINEAR                 : constant := 16#2401#;
   GL_SPHERE_MAP                    : constant := 16#2402#;
   GL_TEXTURE_GEN_MODE              : constant := 16#2500#;
   GL_OBJECT_PLANE                  : constant := 16#2501#;
   GL_EYE_PLANE                     : constant := 16#2502#;
   GL_NEAREST                       : constant := 16#2600#;
   GL_LINEAR                        : constant := 16#2601#;
   GL_NEAREST_MIPMAP_NEAREST        : constant := 16#2700#;
   GL_LINEAR_MIPMAP_NEAREST         : constant := 16#2701#;
   GL_NEAREST_MIPMAP_LINEAR         : constant := 16#2702#;
   GL_LINEAR_MIPMAP_LINEAR          : constant := 16#2703#;
   GL_TEXTURE_MAG_FILTER            : constant := 16#2800#;
   GL_TEXTURE_MIN_FILTER            : constant := 16#2801#;
   GL_TEXTURE_WRAP_S                : constant := 16#2802#;
   GL_TEXTURE_WRAP_T                : constant := 16#2803#;
   GL_CLAMP                         : constant := 16#2900#;
   GL_REPEAT                        : constant := 16#2901#;

   type GLenum is new Win32.UINT;
   type GLboolean is new Win32.UCHAR;
   type GLbitfield is new Win32.UINT;
   type GLbyte is new Win32.CHAR;
   type GLshort is new Win32.SHORT;
   type GLint is new Win32.LONG;
   type GLsizei is new Win32.LONG;
   type GLubyte is new Win32.BYTE;
   type GLushort is new Win32.USHORT;
   type GLuint is new Win32.UINT;
   type GLfloat is new Win32.FLOAT;
   type GLclampf is new Win32.FLOAT;
   type GLdouble is new Win32.DOUBLE;
   type GLclampd is new Win32.DOUBLE;
   type GLvoid is new Win32.VOID;
   type PGLvoid is access all GLvoid;
   type a_GLint is access all GLint;
   type a_GLuint is access all GLuint;
   type a_GLdouble is access all GLdouble;
   type a_GLshort is access all GLshort;
   type ac_GLint is access constant GLint;
   type ac_GLuint is access constant GLuint;
   type ac_GLfloat is access constant GLfloat;
   type ac_GLdouble is access constant GLdouble;
   type ac_GLshort is access constant GLshort;

   procedure glAccum (op : GLenum; value : GLfloat);

   procedure glAlphaFunc (func : GLenum; ref : GLclampf);

   procedure glBegin (mode : GLenum);

   procedure glBindTexture (target : GLenum; texture : GLuint);

   procedure glBitmap
     (width  : GLsizei;
      height : GLsizei;
      xorig  : GLfloat;
      yorig  : GLfloat;
      xmove  : GLfloat;
      ymove  : GLfloat;
      bitmap : Win32.PCBYTE);

   procedure glBlendFunc (sfactor : GLenum; dfactor : GLenum);

   procedure glCallList (list : GLuint);

   procedure glCallLists
     (n      : GLsizei;
      c_type : GLenum;
      lists  : Win32.PCVOID);

   procedure glClear (mask : GLbitfield);

   procedure glClearAccum
     (red   : GLfloat;
      green : GLfloat;
      blue  : GLfloat;
      alpha : GLfloat);

   procedure glClearColor
     (red   : GLclampf;
      green : GLclampf;
      blue  : GLclampf;
      alpha : GLclampf);

   procedure glClearDepth (depth : GLclampd);

   procedure glClearIndex (c : GLfloat);

   procedure glClearStencil (s : GLint);

   procedure glClipPlane (plane : GLenum; equation : ac_GLdouble);

   procedure glColor3b (red : GLbyte; green : GLbyte; blue : GLbyte);

   procedure glColor3bv (v : Win32.PCSTR);

   procedure glColor3d (red : GLdouble; green : GLdouble; blue : GLdouble);

   procedure glColor3dv (v : ac_GLdouble);

   procedure glColor3f (red : GLfloat; green : GLfloat; blue : GLfloat);

   procedure glColor3fv (v : ac_GLfloat);

   procedure glColor3i (red : GLint; green : GLint; blue : GLint);

   procedure glColor3iv (v : ac_GLint);

   procedure glColor3s (red : GLshort; green : GLshort; blue : GLshort);

   procedure glColor3sv (v : ac_GLshort);

   procedure glColor3ub (red : GLubyte; green : GLubyte; blue : GLubyte);

   procedure glColor3ubv (v : Win32.PCBYTE);

   procedure glColor3ui (red : GLuint; green : GLuint; blue : GLuint);

   procedure glColor3uiv (v : ac_GLuint);

   procedure glColor3us (red : GLushort; green : GLushort; blue : GLushort);

   procedure glColor3usv (v : Win32.PCWSTR);

   procedure glColor4b
     (red   : GLbyte;
      green : GLbyte;
      blue  : GLbyte;
      alpha : GLbyte);

   procedure glColor4bv (v : Win32.PCSTR);

   procedure glColor4d
     (red   : GLdouble;
      green : GLdouble;
      blue  : GLdouble;
      alpha : GLdouble);

   procedure glColor4dv (v : ac_GLdouble);

   procedure glColor4f
     (red   : GLfloat;
      green : GLfloat;
      blue  : GLfloat;
      alpha : GLfloat);

   procedure glColor4fv (v : ac_GLfloat);

   procedure glColor4i
     (red   : GLint;
      green : GLint;
      blue  : GLint;
      alpha : GLint);

   procedure glColor4iv (v : ac_GLuint);

   procedure glColor4s
     (red   : GLshort;
      green : GLshort;
      blue  : GLshort;
      alpha : GLshort);

   procedure glColor4sv (v : ac_GLshort);

   procedure glColor4ub
     (red   : GLubyte;
      green : GLubyte;
      blue  : GLubyte;
      alpha : GLubyte);

   procedure glColor4ubv (v : Win32.PCBYTE);

   procedure glColor4ui
     (red   : GLuint;
      green : GLuint;
      blue  : GLuint;
      alpha : GLuint);

   procedure glColor4uiv (v : ac_GLint);

   procedure glColor4us
     (red   : GLushort;
      green : GLushort;
      blue  : GLushort;
      alpha : GLushort);

   procedure glColor4usv (v : Win32.PCWSTR);

   procedure glColorMask
     (red   : GLboolean;
      green : GLboolean;
      blue  : GLboolean;
      alpha : GLboolean);

   procedure glColorMaterial (face : GLenum; mode : GLenum);

   procedure glCopyPixels
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei;
      c_type : GLenum);

   procedure glCullFace (mode : GLenum);

   procedure glDeleteLists (list : GLuint; c_range : GLsizei);

   procedure glDepthFunc (func : GLenum);

   procedure glDepthMask (flag : GLboolean);

   procedure glDepthRange (zNear : GLclampd; zFar : GLclampd);

   procedure glDisable (cap : GLenum);

   procedure glDrawBuffer (mode : GLenum);

   procedure glDrawPixels
     (width  : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : Win32.PCVOID);

   procedure glEdgeFlag (flag : GLboolean);

   procedure glEdgeFlagv (flag : Win32.PCBYTE);

   procedure glEnable (cap : GLenum);

   procedure glEnd;

   procedure glEndList;

   procedure glEvalCoord1d (u : GLdouble);

   procedure glEvalCoord1dv (u : ac_GLdouble);

   procedure glEvalCoord1f (u : GLfloat);

   procedure glEvalCoord1fv (u : ac_GLfloat);

   procedure glEvalCoord2d (u : GLdouble; v : GLdouble);

   procedure glEvalCoord2dv (u : ac_GLdouble);

   procedure glEvalCoord2f (u : GLfloat; v : GLfloat);

   procedure glEvalCoord2fv (u : ac_GLfloat);

   procedure glEvalMesh1 (mode : GLenum; i1 : GLint; i2 : GLint);

   procedure glEvalMesh2
     (mode : GLenum;
      i1   : GLint;
      i2   : GLint;
      j1   : GLint;
      j2   : GLint);

   procedure glEvalPoint1 (i : GLint);

   procedure glEvalPoint2 (i : GLint; j : GLint);

   procedure glFeedbackBuffer
     (size   : GLsizei;
      c_type : GLenum;
      buffer : access GLfloat);

   procedure glFinish;

   procedure glFlush;

   procedure glFogf (pname : GLenum; param : GLfloat);

   procedure glFogfv (pname : GLenum; params : ac_GLfloat);

   procedure glFogi (pname : GLenum; param : GLint);

   procedure glFogiv (pname : GLenum; params : ac_GLint);

   procedure glFrontFace (mode : GLenum);

   procedure glFrustum
     (left   : GLdouble;
      right  : GLdouble;
      bottom : GLdouble;
      top    : GLdouble;
      zNear  : GLdouble;
      zFar   : GLdouble);

   function glGenLists (c_range : GLsizei) return GLuint;

   procedure glGetBooleanv (pname : GLenum; params : access GLboolean);

   procedure glGetClipPlane (plane : GLenum; equation : access GLdouble);

   procedure glGetDoublev (pname : GLenum; params : access GLdouble);

   function glGetError return GLenum;

   procedure glGetFloatv (pname : GLenum; params : access GLfloat);

   procedure glGetIntegerv (pname : GLenum; params : access GLint);

   procedure glGetLightfv
     (light  : GLenum;
      pname  : GLenum;
      params : access GLfloat);

   procedure glGetLightiv
     (light  : GLenum;
      pname  : GLenum;
      params : access GLint);

   procedure glGetMapdv
     (target : GLenum;
      query  : GLenum;
      v      : access GLdouble);

   procedure glGetMapfv
     (target : GLenum;
      query  : GLenum;
      v      : access GLfloat);

   procedure glGetMapiv (target : GLenum; query : GLenum; v : access GLint);

   procedure glGetMaterialfv
     (face   : GLenum;
      pname  : GLenum;
      params : access GLfloat);

   procedure glGetMaterialiv
     (face   : GLenum;
      pname  : GLenum;
      params : access GLint);

   procedure glGetPixelMapfv (map : GLenum; values : access GLfloat);

   procedure glGetPixelMapuiv (map : GLenum; values : access GLuint);

   procedure glGetPixelMapusv (map : GLenum; values : Win32.PWSTR);

   procedure GlGetPolygonStipple (mask : access GLubyte);

   function glGetString (name : GLenum) return Win32.PCBYTE;

   procedure glGetTexEnvfv
     (target : GLenum;
      pname  : GLenum;
      params : access GLfloat);

   procedure glGetTexEnviv
     (target : GLenum;
      pname  : GLenum;
      params : access GLint);

   procedure glGetTexGendv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLdouble);

   procedure glGetTexGenfv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLfloat);

   procedure glGetTexGeniv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLint);

   procedure glGetTexImage
     (target : GLenum;
      level  : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : PGLvoid);

   procedure glGetTexLevelParameterfv
     (target : GLenum;
      level  : GLint;
      pname  : GLenum;
      params : access GLfloat);

   procedure glGetTexLevelParameteriv
     (target : GLenum;
      level  : GLint;
      pname  : GLenum;
      params : access GLint);

   procedure glGetTexParameterfv
     (target : GLenum;
      pname  : GLenum;
      params : access GLfloat);

   procedure glGetTexParameteriv
     (target : GLenum;
      pname  : GLenum;
      params : access GLint);

   procedure glHint (target : GLenum; mode : GLenum);

   procedure glIndexMask (mask : GLuint);

   procedure glIndexd (c : GLdouble);

   procedure glIndexdv (c : ac_GLdouble);

   procedure glIndexf (c : GLfloat);

   procedure glIndexfv (c : ac_GLfloat);

   procedure glIndexi (c : GLint);

   procedure glIndexiv (c : ac_GLuint);

   procedure glIndexs (c : GLshort);

   procedure glIndexsv (c : ac_GLshort);

   procedure glInitNames;

   function glIsEnabled (cap : GLenum) return GLboolean;

   function glIsList (list : GLuint) return GLboolean;

   procedure glLightModelf (pname : GLenum; param : GLfloat);

   procedure glLightModelfv (pname : GLenum; params : ac_GLfloat);

   procedure glLightModeli (pname : GLenum; param : GLint);

   procedure glLightModeliv (pname : GLenum; params : ac_GLuint);

   procedure glLightf (light : GLenum; pname : GLenum; param : GLfloat);

   procedure glLightfv
     (light  : GLenum;
      pname  : GLenum;
      params : ac_GLfloat);

   procedure glLighti (light : GLenum; pname : GLenum; param : GLint);

   procedure glLightiv (light : GLenum; pname : GLenum; params : ac_GLuint);

   procedure glLineStipple (factor : GLint; pattern : GLushort);

   procedure glLineWidth (width : GLfloat);

   procedure glListBase (base : GLuint);

   procedure glLoadIdentity;

   procedure glLoadMatrixd (m : ac_GLdouble);

   procedure glLoadMatrixf (m : ac_GLfloat);

   procedure glLoadName (name : GLuint);

   procedure glLogicOp (opcode : GLenum);

   procedure glMap1d
     (target : GLenum;
      u1     : GLdouble;
      u2     : GLdouble;
      stride : GLint;
      order  : GLint;
      points : ac_GLdouble);

   procedure glMap1f
     (target : GLenum;
      u1     : GLfloat;
      u2     : GLfloat;
      stride : GLint;
      order  : GLint;
      points : ac_GLfloat);

   procedure glMap2d
     (target  : GLenum;
      u1      : GLdouble;
      u2      : GLdouble;
      ustride : GLint;
      uorder  : GLint;
      v1      : GLdouble;
      v2      : GLdouble;
      vstride : GLint;
      vorder  : GLint;
      points  : ac_GLdouble);

   procedure glMap2f
     (target  : GLenum;
      u1      : GLfloat;
      u2      : GLfloat;
      ustride : GLint;
      uorder  : GLint;
      v1      : GLfloat;
      v2      : GLfloat;
      vstride : GLint;
      vorder  : GLint;
      points  : ac_GLfloat);

   procedure glMapGrid1d (un : GLint; u1 : GLdouble; u2 : GLdouble);

   procedure glMapGrid1f (un : GLint; u1 : GLfloat; u2 : GLfloat);

   procedure glMapGrid2d
     (un : GLint;
      u1 : GLdouble;
      u2 : GLdouble;
      vn : GLint;
      v1 : GLdouble;
      v2 : GLdouble);

   procedure glMapGrid2f
     (un : GLint;
      u1 : GLfloat;
      u2 : GLfloat;
      vn : GLint;
      v1 : GLfloat;
      v2 : GLfloat);

   procedure glMaterialf (face : GLenum; pname : GLenum; param : GLfloat);

   procedure glMaterialfv
     (face   : GLenum;
      pname  : GLenum;
      params : ac_GLfloat);

   procedure glMateriali (face : GLenum; pname : GLenum; param : GLint);

   procedure glMaterialiv
     (face   : GLenum;
      pname  : GLenum;
      params : ac_GLint);

   procedure glMatrixMode (mode : GLenum);

   procedure glMultMatrixd (m : ac_GLdouble);

   procedure glMultMatrixf (m : ac_GLfloat);

   procedure glNewList (list : GLuint; mode : GLenum);

   procedure glNormal3b (nx : GLbyte; ny : GLbyte; nz : GLbyte);

   procedure glNormal3bv (v : Win32.PCSTR);

   procedure glNormal3d (nx : GLdouble; ny : GLdouble; nz : GLdouble);

   procedure glNormal3dv (v : ac_GLdouble);

   procedure glNormal3f (nx : GLfloat; ny : GLfloat; nz : GLfloat);

   procedure glNormal3fv (v : ac_GLfloat);

   procedure glNormal3i (nx : GLint; ny : GLint; nz : GLint);

   procedure glNormal3iv (v : ac_GLint);

   procedure glNormal3s (nx : GLshort; ny : GLshort; nz : GLshort);

   procedure glNormal3sv (v : ac_GLshort);

   procedure glOrtho
     (left   : GLdouble;
      right  : GLdouble;
      bottom : GLdouble;
      top    : GLdouble;
      zNear  : GLdouble;
      zFar   : GLdouble);

   procedure glPassThrough (token : GLfloat);

   procedure glPixelMapfv
     (map     : GLenum;
      mapsize : GLint;
      values  : ac_GLfloat);

   procedure glPixelMapuiv
     (map     : GLenum;
      mapsize : GLint;
      values  : ac_GLint);

   procedure glPixelMapusv
     (map     : GLenum;
      mapsize : GLint;
      values  : Win32.PCWSTR);

   procedure glPixelStoref (pname : GLenum; param : GLfloat);

   procedure glPixelStorei (pname : GLenum; param : GLint);

   procedure glPixelTransferf (pname : GLenum; param : GLfloat);

   procedure glPixelTransferi (pname : GLenum; param : GLint);

   procedure glPixelZoom (xfactor : GLfloat; yfactor : GLfloat);

   procedure glPointSize (size : GLfloat);

   procedure glPolygonMode (face : GLenum; mode : GLenum);

   procedure glPolygonStipple (mask : Win32.PCBYTE);

   procedure glPopAttrib;

   procedure glPopMatrix;

   procedure glPopName;

   procedure glPushAttrib (mask : GLbitfield);

   procedure glPushMatrix;

   procedure glPushName (name : GLuint);

   procedure glRasterPos2d (x : GLdouble; y : GLdouble);

   procedure glRasterPos2dv (v : ac_GLdouble);

   procedure glRasterPos2f (x : GLfloat; y : GLfloat);

   procedure glRasterPos2fv (v : ac_GLfloat);

   procedure glRasterPos2i (x : GLint; y : GLint);

   procedure glRasterPos2iv (v : ac_GLint);

   procedure glRasterPos2s (x : GLshort; y : GLshort);

   procedure glRasterPos2sv (v : ac_GLshort);

   procedure glRasterPos3d (x : GLdouble; y : GLdouble; z : GLdouble);

   procedure glRasterPos3dv (v : ac_GLdouble);

   procedure glRasterPos3f (x : GLfloat; y : GLfloat; z : GLfloat);

   procedure glRasterPos3fv (v : ac_GLfloat);

   procedure glRasterPos3i (x : GLint; y : GLint; z : GLint);

   procedure glRasterPos3iv (v : ac_GLint);

   procedure glRasterPos3s (x : GLshort; y : GLshort; z : GLshort);

   procedure glRasterPos3sv (v : ac_GLshort);

   procedure glRasterPos4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble);

   procedure glRasterPos4dv (v : ac_GLdouble);

   procedure glRasterPos4f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat;
      w : GLfloat);

   procedure glRasterPos4fv (v : ac_GLfloat);

   procedure glRasterPos4i
     (x : GLint;
      y : GLint;
      z : GLint;
      w : GLint);

   procedure glRasterPos4iv (v : ac_GLint);

   procedure glRasterPos4s
     (x : GLshort;
      y : GLshort;
      z : GLshort;
      w : GLshort);

   procedure glRasterPos4sv (v : ac_GLshort);

   procedure glReadBuffer (mode : GLenum);

   procedure glReadPixels
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : PGLvoid);

   procedure glRectd
     (x1 : GLdouble;
      y1 : GLdouble;
      x2 : GLdouble;
      y2 : GLdouble);

   procedure glRectdv (v1 : ac_GLdouble; v2 : ac_GLdouble);

   procedure glRectf
     (x1 : GLfloat;
      y1 : GLfloat;
      x2 : GLfloat;
      y2 : GLfloat);

   procedure glRectfv (v1 : ac_GLfloat; v2 : ac_GLfloat);

   procedure glRecti
     (x1 : GLint;
      y1 : GLint;
      x2 : GLint;
      y2 : GLint);

   procedure glRectiv (v1 : ac_GLint; v2 : ac_GLint);

   procedure glRects
     (x1 : GLshort;
      y1 : GLshort;
      x2 : GLshort;
      y2 : GLshort);

   procedure glRectsv (v1 : ac_GLshort; v2 : ac_GLshort);

   function glRenderMode (mode : GLenum) return GLint;

   procedure glRotated
     (angle : GLdouble;
      x     : GLdouble;
      y     : GLdouble;
      z     : GLdouble);

   procedure glRotatef
     (angle : GLfloat;
      x     : GLfloat;
      y     : GLfloat;
      z     : GLfloat);

   procedure glScaled (x : GLdouble; y : GLdouble; z : GLdouble);

   procedure glScalef (x : GLfloat; y : GLfloat; z : GLfloat);

   procedure glScissor
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei);

   procedure glSelectBuffer (size : GLsizei; buffer : access GLuint);

   procedure glShadeModel (mode : GLenum);

   procedure glStencilFunc (func : GLenum; ref : GLint; mask : GLuint);

   procedure glStencilMask (mask : GLuint);

   procedure glStencilOp (fail : GLenum; zfail : GLenum; zpass : GLenum);

   procedure glTexCoord1d (s : GLdouble);

   procedure glTexCoord1dv (v : ac_GLdouble);

   procedure glTexCoord1f (s : GLfloat);

   procedure glTexCoord1fv (v : ac_GLfloat);

   procedure glTexCoord1i (s : GLint);

   procedure glTexCoord1iv (v : ac_GLint);

   procedure glTexCoord1s (s : GLshort);

   procedure glTexCoord1sv (v : ac_GLshort);

   procedure glTexCoord2d (s : GLdouble; t : GLdouble);

   procedure glTexCoord2dv (v : ac_GLdouble);

   procedure glTexCoord2f (s : GLfloat; t : GLfloat);

   procedure glTexCoord2fv (v : ac_GLfloat);

   procedure glTexCoord2i (s : GLint; t : GLint);

   procedure glTexCoord2iv (v : ac_GLint);

   procedure glTexCoord2s (s : GLshort; t : GLshort);

   procedure glTexCoord2sv (v : ac_GLshort);

   procedure glTexCoord3d (s : GLdouble; t : GLdouble; r : GLdouble);

   procedure glTexCoord3dv (v : ac_GLdouble);

   procedure glTexCoord3f (s : GLfloat; t : GLfloat; r : GLfloat);

   procedure glTexCoord3fv (v : ac_GLfloat);

   procedure glTexCoord3i (s : GLint; t : GLint; r : GLint);

   procedure glTexCoord3iv (v : ac_GLint);

   procedure glTexCoord3s (s : GLshort; t : GLshort; r : GLshort);

   procedure glTexCoord3sv (v : ac_GLshort);

   procedure glTexCoord4d
     (s : GLdouble;
      t : GLdouble;
      r : GLdouble;
      q : GLdouble);

   procedure glTexCoord4dv (v : ac_GLdouble);

   procedure glTexCoord4f
     (s : GLfloat;
      t : GLfloat;
      r : GLfloat;
      q : GLfloat);

   procedure glTexCoord4fv (v : ac_GLfloat);

   procedure glTexCoord4i
     (s : GLint;
      t : GLint;
      r : GLint;
      q : GLint);

   procedure glTexCoord4iv (v : ac_GLint);

   procedure glTexCoord4s
     (s : GLshort;
      t : GLshort;
      r : GLshort;
      q : GLshort);

   procedure glTexCoord4sv (v : ac_GLshort);

   procedure glTexEnvf (target : GLenum; pname : GLenum; param : GLfloat);

   procedure glTexEnvfv
     (target : GLenum;
      pname  : GLenum;
      params : ac_GLfloat);

   procedure glTexEnvi (target : GLenum; pname : GLenum; param : GLint);

   procedure glTexEnviv
     (target : GLenum;
      pname  : GLenum;
      params : ac_GLint);

   procedure glTexGend (coord : GLenum; pname : GLenum; param : GLdouble);

   procedure glTexGendv
     (coord  : GLenum;
      pname  : GLenum;
      params : ac_GLdouble);

   procedure glTexGenf (coord : GLenum; pname : GLenum; param : GLfloat);

   procedure glTexGenfv
     (coord  : GLenum;
      pname  : GLenum;
      params : ac_GLfloat);

   procedure glTexGeni (coord : GLenum; pname : GLenum; param : GLint);

   procedure glTexGeniv (coord : GLenum; pname : GLenum; params : ac_GLint);

   procedure glTexImage1D
     (target     : GLenum;
      level      : GLint;
      components : GLint;
      width      : GLsizei;
      border     : GLint;
      format     : GLenum;
      c_type     : GLenum;
      pixels     : Win32.PCVOID);

   procedure glTexImage2D
     (target     : GLenum;
      level      : GLint;
      components : GLint;
      width      : GLsizei;
      height     : GLsizei;
      border     : GLint;
      format     : GLenum;
      c_type     : GLenum;
      pixels     : Win32.PCVOID);

   procedure glTexParameterf
     (target : GLenum;
      pname  : GLenum;
      param  : GLfloat);

   procedure glTexParameterfv
     (target : GLenum;
      pname  : GLenum;
      params : ac_GLfloat);

   procedure glTexParameteri
     (target : GLenum;
      pname  : GLenum;
      param  : GLint);

   procedure glTexParameteriv
     (target : GLenum;
      pname  : GLenum;
      params : ac_GLint);

   procedure glTranslated (x : GLdouble; y : GLdouble; z : GLdouble);

   procedure glTranslatef (x : GLfloat; y : GLfloat; z : GLfloat);

   procedure glVertex2d (x : GLdouble; y : GLdouble);

   procedure glVertex2dv (v : ac_GLdouble);

   procedure glVertex2f (x : GLfloat; y : GLfloat);

   procedure glVertex2fv (v : ac_GLfloat);

   procedure glVertex2i (x : GLint; y : GLint);

   procedure glVertex2iv (v : ac_GLint);

   procedure glVertex2s (x : GLshort; y : GLshort);

   procedure glVertex2sv (v : ac_GLshort);

   procedure glVertex3d (x : GLdouble; y : GLdouble; z : GLdouble);

   procedure glVertex3dv (v : ac_GLdouble);

   procedure glVertex3f (x : GLfloat; y : GLfloat; z : GLfloat);

   procedure glVertex3fv (v : ac_GLfloat);

   procedure glVertex3i (x : GLint; y : GLint; z : GLint);

   procedure glVertex3iv (v : ac_GLint);

   procedure glVertex3s (x : GLshort; y : GLshort; z : GLshort);

   procedure glVertex3sv (v : ac_GLshort);

   procedure glVertex4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble);

   procedure glVertex4dv (v : ac_GLdouble);

   procedure glVertex4f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat;
      w : GLfloat);

   procedure glVertex4fv (v : ac_GLfloat);

   procedure glVertex4i
     (x : GLint;
      y : GLint;
      z : GLint;
      w : GLint);

   procedure glVertex4iv (v : ac_GLint);

   procedure glVertex4s
     (x : GLshort;
      y : GLshort;
      z : GLshort;
      w : GLshort);

   procedure glVertex4sv (v : ac_GLshort);

   procedure glViewport
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei);

private

   pragma Import (Stdcall, glAccum, "glAccum");
   pragma Import (Stdcall, glAlphaFunc, "glAlphaFunc");
   pragma Import (Stdcall, glBegin, "glBegin");
   pragma Import (Stdcall, glBindTexture, "glBindTexture");
   pragma Import (Stdcall, glBitmap, "glBitmap");
   pragma Import (Stdcall, glBlendFunc, "glBlendFunc");
   pragma Import (Stdcall, glCallList, "glCallList");
   pragma Import (Stdcall, glCallLists, "glCallLists");
   pragma Import (Stdcall, glClear, "glClear");
   pragma Import (Stdcall, glClearAccum, "glClearAccum");
   pragma Import (Stdcall, glClearColor, "glClearColor");
   pragma Import (Stdcall, glClearDepth, "glClearDepth");
   pragma Import (Stdcall, glClearIndex, "glClearIndex");
   pragma Import (Stdcall, glClearStencil, "glClearStencil");
   pragma Import (Stdcall, glClipPlane, "glClipPlane");
   pragma Import (Stdcall, glColor3b, "glColor3b");
   pragma Import (Stdcall, glColor3bv, "glColor3bv");
   pragma Import (Stdcall, glColor3d, "glColor3d");
   pragma Import (Stdcall, glColor3dv, "glColor3dv");
   pragma Import (Stdcall, glColor3f, "glColor3f");
   pragma Import (Stdcall, glColor3fv, "glColor3fv");
   pragma Import (Stdcall, glColor3i, "glColor3i");
   pragma Import (Stdcall, glColor3iv, "glColor3iv");
   pragma Import (Stdcall, glColor3s, "glColor3s");
   pragma Import (Stdcall, glColor3sv, "glColor3sv");
   pragma Import (Stdcall, glColor3ub, "glColor3ub");
   pragma Import (Stdcall, glColor3ubv, "glColor3ubv");
   pragma Import (Stdcall, glColor3ui, "glColor3ui");
   pragma Import (Stdcall, glColor3uiv, "glColor3uiv");
   pragma Import (Stdcall, glColor3us, "glColor3us");
   pragma Import (Stdcall, glColor3usv, "glColor3usv");
   pragma Import (Stdcall, glColor4b, "glColor4b");
   pragma Import (Stdcall, glColor4bv, "glColor4bv");
   pragma Import (Stdcall, glColor4d, "glColor4d");
   pragma Import (Stdcall, glColor4dv, "glColor4dv");
   pragma Import (Stdcall, glColor4f, "glColor4f");
   pragma Import (Stdcall, glColor4fv, "glColor4fv");
   pragma Import (Stdcall, glColor4i, "glColor4i");
   pragma Import (Stdcall, glColor4iv, "glColor4iv");
   pragma Import (Stdcall, glColor4s, "glColor4s");
   pragma Import (Stdcall, glColor4sv, "glColor4sv");
   pragma Import (Stdcall, glColor4ub, "glColor4ub");
   pragma Import (Stdcall, glColor4ubv, "glColor4ubv");
   pragma Import (Stdcall, glColor4ui, "glColor4ui");
   pragma Import (Stdcall, glColor4uiv, "glColor4uiv");
   pragma Import (Stdcall, glColor4us, "glColor4us");
   pragma Import (Stdcall, glColor4usv, "glColor4usv");
   pragma Import (Stdcall, glColorMask, "glColorMask");
   pragma Import (Stdcall, glColorMaterial, "glColorMaterial");
   pragma Import (Stdcall, glCopyPixels, "glCopyPixels");
   pragma Import (Stdcall, glCullFace, "glCullFace");
   pragma Import (Stdcall, glDeleteLists, "glDeleteLists");
   pragma Import (Stdcall, glDepthFunc, "glDepthFunc");
   pragma Import (Stdcall, glDepthMask, "glDepthMask");
   pragma Import (Stdcall, glDepthRange, "glDepthRange");
   pragma Import (Stdcall, glDisable, "glDisable");
   pragma Import (Stdcall, glDrawBuffer, "glDrawBuffer");
   pragma Import (Stdcall, glDrawPixels, "glDrawPixels");
   pragma Import (Stdcall, glEdgeFlag, "glEdgeFlag");
   pragma Import (Stdcall, glEdgeFlagv, "glEdgeFlagv");
   pragma Import (Stdcall, glEnable, "glEnable");
   pragma Import (Stdcall, glEnd, "glEnd");
   pragma Import (Stdcall, glEndList, "glEndList");
   pragma Import (Stdcall, glEvalCoord1d, "glEvalCoord1d");
   pragma Import (Stdcall, glEvalCoord1dv, "glEvalCoord1dv");
   pragma Import (Stdcall, glEvalCoord1f, "glEvalCoord1f");
   pragma Import (Stdcall, glEvalCoord1fv, "glEvalCoord1fv");
   pragma Import (Stdcall, glEvalCoord2d, "glEvalCoord2d");
   pragma Import (Stdcall, glEvalCoord2dv, "glEvalCoord2dv");
   pragma Import (Stdcall, glEvalCoord2f, "glEvalCoord2f");
   pragma Import (Stdcall, glEvalCoord2fv, "glEvalCoord2fv");
   pragma Import (Stdcall, glEvalMesh1, "glEvalMesh1");
   pragma Import (Stdcall, glEvalMesh2, "glEvalMesh2");
   pragma Import (Stdcall, glEvalPoint1, "glEvalPoint1");
   pragma Import (Stdcall, glEvalPoint2, "glEvalPoint2");
   pragma Import (Stdcall, glFeedbackBuffer, "glFeedbackBuffer");
   pragma Import (Stdcall, glFinish, "glFinish");
   pragma Import (Stdcall, glFlush, "glFlush");
   pragma Import (Stdcall, glFogf, "glFogf");
   pragma Import (Stdcall, glFogfv, "glFogfv");
   pragma Import (Stdcall, glFogi, "glFogi");
   pragma Import (Stdcall, glFogiv, "glFogiv");
   pragma Import (Stdcall, glFrontFace, "glFrontFace");
   pragma Import (Stdcall, glFrustum, "glFrustum");
   pragma Import (Stdcall, glGenLists, "glGenLists");
   pragma Import (Stdcall, glGetBooleanv, "glGetBooleanv");
   pragma Import (Stdcall, glGetClipPlane, "glGetClipPlane");
   pragma Import (Stdcall, glGetDoublev, "glGetDoublev");
   pragma Import (Stdcall, glGetError, "glGetError");
   pragma Import (Stdcall, glGetFloatv, "glGetFloatv");
   pragma Import (Stdcall, glGetIntegerv, "glGetIntegerv");
   pragma Import (Stdcall, glGetLightfv, "glGetLightfv");
   pragma Import (Stdcall, glGetLightiv, "glGetLightiv");
   pragma Import (Stdcall, glGetMapdv, "glGetMapdv");
   pragma Import (Stdcall, glGetMapfv, "glGetMapfv");
   pragma Import (Stdcall, glGetMapiv, "glGetMapiv");
   pragma Import (Stdcall, glGetMaterialfv, "glGetMaterialfv");
   pragma Import (Stdcall, glGetMaterialiv, "glGetMaterialiv");
   pragma Import (Stdcall, glGetPixelMapfv, "glGetPixelMapfv");
   pragma Import (Stdcall, glGetPixelMapuiv, "glGetPixelMapuiv");
   pragma Import (Stdcall, glGetPixelMapusv, "glGetPixelMapusv");
   pragma Import (Stdcall, GlGetPolygonStipple, "glGetPolygonStipple");
   pragma Import (Stdcall, glGetString, "glGetString");
   pragma Import (Stdcall, glGetTexEnvfv, "glGetTexEnvfv");
   pragma Import (Stdcall, glGetTexEnviv, "glGetTexEnviv");
   pragma Import (Stdcall, glGetTexGendv, "glGetTexGendv");
   pragma Import (Stdcall, glGetTexGenfv, "glGetTexGenfv");
   pragma Import (Stdcall, glGetTexGeniv, "glGetTexGeniv");
   pragma Import (Stdcall, glGetTexImage, "glGetTexImage");
   pragma Import
     (Stdcall,
      glGetTexLevelParameterfv,
      "glGetTexLevelParameterfv");
   pragma Import
     (Stdcall,
      glGetTexLevelParameteriv,
      "glGetTexLevelParameteriv");
   pragma Import (Stdcall, glGetTexParameterfv, "glGetTexParameterfv");
   pragma Import (Stdcall, glGetTexParameteriv, "glGetTexParameteriv");
   pragma Import (Stdcall, glHint, "glHint");
   pragma Import (Stdcall, glIndexMask, "glIndexMask");
   pragma Import (Stdcall, glIndexd, "glIndexd");
   pragma Import (Stdcall, glIndexdv, "glIndexdv");
   pragma Import (Stdcall, glIndexf, "glIndexf");
   pragma Import (Stdcall, glIndexfv, "glIndexfv");
   pragma Import (Stdcall, glIndexi, "glIndexi");
   pragma Import (Stdcall, glIndexiv, "glIndexiv");
   pragma Import (Stdcall, glIndexs, "glIndexs");
   pragma Import (Stdcall, glIndexsv, "glIndexsv");
   pragma Import (Stdcall, glInitNames, "glInitNames");
   pragma Import (Stdcall, glIsEnabled, "glIsEnabled");
   pragma Import (Stdcall, glIsList, "glIsList");
   pragma Import (Stdcall, glLightModelf, "glLightModelf");
   pragma Import (Stdcall, glLightModelfv, "glLightModelfv");
   pragma Import (Stdcall, glLightModeli, "glLightModeli");
   pragma Import (Stdcall, glLightModeliv, "glLightModeliv");
   pragma Import (Stdcall, glLightf, "glLightf");
   pragma Import (Stdcall, glLightfv, "glLightfv");
   pragma Import (Stdcall, glLighti, "glLighti");
   pragma Import (Stdcall, glLightiv, "glLightiv");
   pragma Import (Stdcall, glLineStipple, "glLineStipple");
   pragma Import (Stdcall, glLineWidth, "glLineWidth");
   pragma Import (Stdcall, glListBase, "glListBase");
   pragma Import (Stdcall, glLoadIdentity, "glLoadIdentity");
   pragma Import (Stdcall, glLoadMatrixd, "glLoadMatrixd");
   pragma Import (Stdcall, glLoadMatrixf, "glLoadMatrixf");
   pragma Import (Stdcall, glLoadName, "glLoadName");
   pragma Import (Stdcall, glLogicOp, "glLogicOp");
   pragma Import (Stdcall, glMap1d, "glMap1d");
   pragma Import (Stdcall, glMap1f, "glMap1f");
   pragma Import (Stdcall, glMap2d, "glMap2d");
   pragma Import (Stdcall, glMap2f, "glMap2f");
   pragma Import (Stdcall, glMapGrid1d, "glMapGrid1d");
   pragma Import (Stdcall, glMapGrid1f, "glMapGrid1f");
   pragma Import (Stdcall, glMapGrid2d, "glMapGrid2d");
   pragma Import (Stdcall, glMapGrid2f, "glMapGrid2f");
   pragma Import (Stdcall, glMaterialf, "glMaterialf");
   pragma Import (Stdcall, glMaterialfv, "glMaterialfv");
   pragma Import (Stdcall, glMateriali, "glMateriali");
   pragma Import (Stdcall, glMaterialiv, "glMaterialiv");
   pragma Import (Stdcall, glMatrixMode, "glMatrixMode");
   pragma Import (Stdcall, glMultMatrixd, "glMultMatrixd");
   pragma Import (Stdcall, glMultMatrixf, "glMultMatrixf");
   pragma Import (Stdcall, glNewList, "glNewList");
   pragma Import (Stdcall, glNormal3b, "glNormal3b");
   pragma Import (Stdcall, glNormal3bv, "glNormal3bv");
   pragma Import (Stdcall, glNormal3d, "glNormal3d");
   pragma Import (Stdcall, glNormal3dv, "glNormal3dv");
   pragma Import (Stdcall, glNormal3f, "glNormal3f");
   pragma Import (Stdcall, glNormal3fv, "glNormal3fv");
   pragma Import (Stdcall, glNormal3i, "glNormal3i");
   pragma Import (Stdcall, glNormal3iv, "glNormal3iv");
   pragma Import (Stdcall, glNormal3s, "glNormal3s");
   pragma Import (Stdcall, glNormal3sv, "glNormal3sv");
   pragma Import (Stdcall, glOrtho, "glOrtho");
   pragma Import (Stdcall, glPassThrough, "glPassThrough");
   pragma Import (Stdcall, glPixelMapfv, "glPixelMapfv");
   pragma Import (Stdcall, glPixelMapuiv, "glPixelMapuiv");
   pragma Import (Stdcall, glPixelMapusv, "glPixelMapusv");
   pragma Import (Stdcall, glPixelStoref, "glPixelStoref");
   pragma Import (Stdcall, glPixelStorei, "glPixelStorei");
   pragma Import (Stdcall, glPixelTransferf, "glPixelTransferf");
   pragma Import (Stdcall, glPixelTransferi, "glPixelTransferi");
   pragma Import (Stdcall, glPixelZoom, "glPixelZoom");
   pragma Import (Stdcall, glPointSize, "glPointSize");
   pragma Import (Stdcall, glPolygonMode, "glPolygonMode");
   pragma Import (Stdcall, glPolygonStipple, "glPolygonStipple");
   pragma Import (Stdcall, glPopAttrib, "glPopAttrib");
   pragma Import (Stdcall, glPopMatrix, "glPopMatrix");
   pragma Import (Stdcall, glPopName, "glPopName");
   pragma Import (Stdcall, glPushAttrib, "glPushAttrib");
   pragma Import (Stdcall, glPushMatrix, "glPushMatrix");
   pragma Import (Stdcall, glPushName, "glPushName");
   pragma Import (Stdcall, glRasterPos2d, "glRasterPos2d");
   pragma Import (Stdcall, glRasterPos2dv, "glRasterPos2dv");
   pragma Import (Stdcall, glRasterPos2f, "glRasterPos2f");
   pragma Import (Stdcall, glRasterPos2fv, "glRasterPos2fv");
   pragma Import (Stdcall, glRasterPos2i, "glRasterPos2i");
   pragma Import (Stdcall, glRasterPos2iv, "glRasterPos2iv");
   pragma Import (Stdcall, glRasterPos2s, "glRasterPos2s");
   pragma Import (Stdcall, glRasterPos2sv, "glRasterPos2sv");
   pragma Import (Stdcall, glRasterPos3d, "glRasterPos3d");
   pragma Import (Stdcall, glRasterPos3dv, "glRasterPos3dv");
   pragma Import (Stdcall, glRasterPos3f, "glRasterPos3f");
   pragma Import (Stdcall, glRasterPos3fv, "glRasterPos3fv");
   pragma Import (Stdcall, glRasterPos3i, "glRasterPos3i");
   pragma Import (Stdcall, glRasterPos3iv, "glRasterPos3iv");
   pragma Import (Stdcall, glRasterPos3s, "glRasterPos3s");
   pragma Import (Stdcall, glRasterPos3sv, "glRasterPos3sv");
   pragma Import (Stdcall, glRasterPos4d, "glRasterPos4d");
   pragma Import (Stdcall, glRasterPos4dv, "glRasterPos4dv");
   pragma Import (Stdcall, glRasterPos4f, "glRasterPos4f");
   pragma Import (Stdcall, glRasterPos4fv, "glRasterPos4fv");
   pragma Import (Stdcall, glRasterPos4i, "glRasterPos4i");
   pragma Import (Stdcall, glRasterPos4iv, "glRasterPos4iv");
   pragma Import (Stdcall, glRasterPos4s, "glRasterPos4s");
   pragma Import (Stdcall, glRasterPos4sv, "glRasterPos4sv");
   pragma Import (Stdcall, glReadBuffer, "glReadBuffer");
   pragma Import (Stdcall, glReadPixels, "glReadPixels");
   pragma Import (Stdcall, glRectd, "glRectd");
   pragma Import (Stdcall, glRectdv, "glRectdv");
   pragma Import (Stdcall, glRectf, "glRectf");
   pragma Import (Stdcall, glRectfv, "glRectfv");
   pragma Import (Stdcall, glRecti, "glRecti");
   pragma Import (Stdcall, glRectiv, "glRectiv");
   pragma Import (Stdcall, glRects, "glRects");
   pragma Import (Stdcall, glRectsv, "glRectsv");
   pragma Import (Stdcall, glRenderMode, "glRenderMode");
   pragma Import (Stdcall, glRotated, "glRotated");
   pragma Import (Stdcall, glRotatef, "glRotatef");
   pragma Import (Stdcall, glScaled, "glScaled");
   pragma Import (Stdcall, glScalef, "glScalef");
   pragma Import (Stdcall, glScissor, "glScissor");
   pragma Import (Stdcall, glSelectBuffer, "glSelectBuffer");
   pragma Import (Stdcall, glShadeModel, "glShadeModel");
   pragma Import (Stdcall, glStencilFunc, "glStencilFunc");
   pragma Import (Stdcall, glStencilMask, "glStencilMask");
   pragma Import (Stdcall, glStencilOp, "glStencilOp");
   pragma Import (Stdcall, glTexCoord1d, "glTexCoord1d");
   pragma Import (Stdcall, glTexCoord1dv, "glTexCoord1dv");
   pragma Import (Stdcall, glTexCoord1f, "glTexCoord1f");
   pragma Import (Stdcall, glTexCoord1fv, "glTexCoord1fv");
   pragma Import (Stdcall, glTexCoord1i, "glTexCoord1i");
   pragma Import (Stdcall, glTexCoord1iv, "glTexCoord1iv");
   pragma Import (Stdcall, glTexCoord1s, "glTexCoord1s");
   pragma Import (Stdcall, glTexCoord1sv, "glTexCoord1sv");
   pragma Import (Stdcall, glTexCoord2d, "glTexCoord2d");
   pragma Import (Stdcall, glTexCoord2dv, "glTexCoord2dv");
   pragma Import (Stdcall, glTexCoord2f, "glTexCoord2f");
   pragma Import (Stdcall, glTexCoord2fv, "glTexCoord2fv");
   pragma Import (Stdcall, glTexCoord2i, "glTexCoord2i");
   pragma Import (Stdcall, glTexCoord2iv, "glTexCoord2iv");
   pragma Import (Stdcall, glTexCoord2s, "glTexCoord2s");
   pragma Import (Stdcall, glTexCoord2sv, "glTexCoord2sv");
   pragma Import (Stdcall, glTexCoord3d, "glTexCoord3d");
   pragma Import (Stdcall, glTexCoord3dv, "glTexCoord3dv");
   pragma Import (Stdcall, glTexCoord3f, "glTexCoord3f");
   pragma Import (Stdcall, glTexCoord3fv, "glTexCoord3fv");
   pragma Import (Stdcall, glTexCoord3i, "glTexCoord3i");
   pragma Import (Stdcall, glTexCoord3iv, "glTexCoord3iv");
   pragma Import (Stdcall, glTexCoord3s, "glTexCoord3s");
   pragma Import (Stdcall, glTexCoord3sv, "glTexCoord3sv");
   pragma Import (Stdcall, glTexCoord4d, "glTexCoord4d");
   pragma Import (Stdcall, glTexCoord4dv, "glTexCoord4dv");
   pragma Import (Stdcall, glTexCoord4f, "glTexCoord4f");
   pragma Import (Stdcall, glTexCoord4fv, "glTexCoord4fv");
   pragma Import (Stdcall, glTexCoord4i, "glTexCoord4i");
   pragma Import (Stdcall, glTexCoord4iv, "glTexCoord4iv");
   pragma Import (Stdcall, glTexCoord4s, "glTexCoord4s");
   pragma Import (Stdcall, glTexCoord4sv, "glTexCoord4sv");
   pragma Import (Stdcall, glTexEnvf, "glTexEnvf");
   pragma Import (Stdcall, glTexEnvfv, "glTexEnvfv");
   pragma Import (Stdcall, glTexEnvi, "glTexEnvi");
   pragma Import (Stdcall, glTexEnviv, "glTexEnviv");
   pragma Import (Stdcall, glTexGend, "glTexGend");
   pragma Import (Stdcall, glTexGendv, "glTexGendv");
   pragma Import (Stdcall, glTexGenf, "glTexGenf");
   pragma Import (Stdcall, glTexGenfv, "glTexGenfv");
   pragma Import (Stdcall, glTexGeni, "glTexGeni");
   pragma Import (Stdcall, glTexGeniv, "glTexGeniv");
   pragma Import (Stdcall, glTexImage1D, "glTexImage1D");
   pragma Import (Stdcall, glTexImage2D, "glTexImage2D");
   pragma Import (Stdcall, glTexParameterf, "glTexParameterf");
   pragma Import (Stdcall, glTexParameterfv, "glTexParameterfv");
   pragma Import (Stdcall, glTexParameteri, "glTexParameteri");
   pragma Import (Stdcall, glTexParameteriv, "glTexParameteriv");
   pragma Import (Stdcall, glTranslated, "glTranslated");
   pragma Import (Stdcall, glTranslatef, "glTranslatef");
   pragma Import (Stdcall, glVertex2d, "glVertex2d");
   pragma Import (Stdcall, glVertex2dv, "glVertex2dv");
   pragma Import (Stdcall, glVertex2f, "glVertex2f");
   pragma Import (Stdcall, glVertex2fv, "glVertex2fv");
   pragma Import (Stdcall, glVertex2i, "glVertex2i");
   pragma Import (Stdcall, glVertex2iv, "glVertex2iv");
   pragma Import (Stdcall, glVertex2s, "glVertex2s");
   pragma Import (Stdcall, glVertex2sv, "glVertex2sv");
   pragma Import (Stdcall, glVertex3d, "glVertex3d");
   pragma Import (Stdcall, glVertex3dv, "glVertex3dv");
   pragma Import (Stdcall, glVertex3f, "glVertex3f");
   pragma Import (Stdcall, glVertex3fv, "glVertex3fv");
   pragma Import (Stdcall, glVertex3i, "glVertex3i");
   pragma Import (Stdcall, glVertex3iv, "glVertex3iv");
   pragma Import (Stdcall, glVertex3s, "glVertex3s");
   pragma Import (Stdcall, glVertex3sv, "glVertex3sv");
   pragma Import (Stdcall, glVertex4d, "glVertex4d");
   pragma Import (Stdcall, glVertex4dv, "glVertex4dv");
   pragma Import (Stdcall, glVertex4f, "glVertex4f");
   pragma Import (Stdcall, glVertex4fv, "glVertex4fv");
   pragma Import (Stdcall, glVertex4i, "glVertex4i");
   pragma Import (Stdcall, glVertex4iv, "glVertex4iv");
   pragma Import (Stdcall, glVertex4s, "glVertex4s");
   pragma Import (Stdcall, glVertex4sv, "glVertex4sv");
   pragma Import (Stdcall, glViewport, "glViewport");

end Win32.Gl;
