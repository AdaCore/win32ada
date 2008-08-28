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

package Win32.Gl is

   GL_ACCUM : constant := 16#100#;  --  gl.h:60
   GL_LOAD : constant := 16#101#;  --  gl.h:61
   GL_RETURN : constant := 16#102#;  --  gl.h:62
   GL_MULT : constant := 16#103#;  --  gl.h:63
   GL_ADD : constant := 16#104#;  --  gl.h:64
   GL_NEVER : constant := 16#200#;  --  gl.h:67
   GL_LESS : constant := 16#201#;  --  gl.h:68
   GL_EQUAL : constant := 16#202#;  --  gl.h:69
   GL_LEQUAL : constant := 16#203#;  --  gl.h:70
   GL_GREATER : constant := 16#204#;  --  gl.h:71
   GL_NOTEQUAL : constant := 16#205#;  --  gl.h:72
   GL_GEQUAL : constant := 16#206#;  --  gl.h:73
   GL_ALWAYS : constant := 16#207#;  --  gl.h:74
   GL_CURRENT_BIT : constant := 16#1#;    --  gl.h:77
   GL_POINT_BIT : constant := 16#2#;    --  gl.h:78
   GL_LINE_BIT : constant := 16#4#;    --  gl.h:79
   GL_POLYGON_BIT : constant := 16#8#;    --  gl.h:80
   GL_POLYGON_STIPPLE_BIT : constant := 16#10#;   --  gl.h:81
   GL_PIXEL_MODE_BIT : constant := 16#20#;   --  gl.h:82
   GL_LIGHTING_BIT : constant := 16#40#;   --  gl.h:83
   GL_FOG_BIT : constant := 16#80#;   --  gl.h:84
   GL_DEPTH_BUFFER_BIT : constant := 16#100#;  --  gl.h:85
   GL_ACCUM_BUFFER_BIT : constant := 16#200#;  --  gl.h:86
   GL_STENCIL_BUFFER_BIT : constant := 16#400#;  --  gl.h:87
   GL_VIEWPORT_BIT : constant := 16#800#;  --  gl.h:88
   GL_TRANSFORM_BIT : constant := 16#1000#; --  gl.h:89
   GL_ENABLE_BIT : constant := 16#2000#; --  gl.h:90
   GL_COLOR_BUFFER_BIT : constant := 16#4000#; --  gl.h:91
   GL_HINT_BIT : constant := 16#8000#; --  gl.h:92
   GL_EVAL_BIT : constant := 16#10000#; --  gl.h:93
   GL_LIST_BIT : constant := 16#20000#; --  gl.h:94
   GL_TEXTURE_BIT : constant := 16#40000#; --  gl.h:95
   GL_SCISSOR_BIT : constant := 16#80000#; --  gl.h:96
   GL_ALL_ATTRIB_BITS : constant := 16#fffff#; --  gl.h:97
   GL_POINTS : constant := 16#0#;    --  gl.h:100
   GL_LINES : constant := 16#1#;    --  gl.h:101
   GL_LINE_LOOP : constant := 16#2#;    --  gl.h:102
   GL_LINE_STRIP : constant := 16#3#;    --  gl.h:103
   GL_TRIANGLES : constant := 16#4#;    --  gl.h:104
   GL_TRIANGLE_STRIP : constant := 16#5#;    --  gl.h:105
   GL_TRIANGLE_FAN : constant := 16#6#;    --  gl.h:106
   GL_QUADS : constant := 16#7#;    --  gl.h:107
   GL_QUAD_STRIP : constant := 16#8#;    --  gl.h:108
   GL_POLYGON : constant := 16#9#;    --  gl.h:109
   GL_ZERO : constant := 0;        --  gl.h:112
   GL_ONE : constant := 1;        --  gl.h:113
   GL_SRC_COLOR : constant := 16#300#;  --  gl.h:114
   GL_ONE_MINUS_SRC_COLOR : constant := 16#301#;  --  gl.h:115
   GL_SRC_ALPHA : constant := 16#302#;  --  gl.h:116
   GL_ONE_MINUS_SRC_ALPHA : constant := 16#303#;  --  gl.h:117
   GL_DST_ALPHA : constant := 16#304#;  --  gl.h:118
   GL_ONE_MINUS_DST_ALPHA : constant := 16#305#;  --  gl.h:119
   GL_DST_COLOR : constant := 16#306#;  --  gl.h:124
   GL_ONE_MINUS_DST_COLOR : constant := 16#307#;  --  gl.h:125
   GL_SRC_ALPHA_SATURATE : constant := 16#308#;  --  gl.h:126
   GL_TRUE : constant := 1;        --  gl.h:133
   GL_FALSE : constant := 0;        --  gl.h:134
   GL_CLIP_PLANE0 : constant := 16#3000#; --  gl.h:143
   GL_CLIP_PLANE1 : constant := 16#3001#; --  gl.h:144
   GL_CLIP_PLANE2 : constant := 16#3002#; --  gl.h:145
   GL_CLIP_PLANE3 : constant := 16#3003#; --  gl.h:146
   GL_CLIP_PLANE4 : constant := 16#3004#; --  gl.h:147
   GL_CLIP_PLANE5 : constant := 16#3005#; --  gl.h:148
   GL_NONE : constant := 0;        --  gl.h:178
   GL_FRONT_LEFT : constant := 16#400#;  --  gl.h:179
   GL_FRONT_RIGHT : constant := 16#401#;  --  gl.h:180
   GL_BACK_LEFT : constant := 16#402#;  --  gl.h:181
   GL_BACK_RIGHT : constant := 16#403#;  --  gl.h:182
   GL_FRONT : constant := 16#404#;  --  gl.h:183
   GL_BACK : constant := 16#405#;  --  gl.h:184
   GL_LEFT : constant := 16#406#;  --  gl.h:185
   GL_RIGHT : constant := 16#407#;  --  gl.h:186
   GL_FRONT_AND_BACK : constant := 16#408#;  --  gl.h:187
   GL_AUX0 : constant := 16#409#;  --  gl.h:188
   GL_AUX1 : constant := 16#40a#;  --  gl.h:189
   GL_AUX2 : constant := 16#40b#;  --  gl.h:190
   GL_AUX3 : constant := 16#40c#;  --  gl.h:191
   GL_NO_ERROR : constant := 0;        --  gl.h:252
   GL_INVALID_ENUM : constant := 16#500#;  --  gl.h:253
   GL_INVALID_VALUE : constant := 16#501#;  --  gl.h:254
   GL_INVALID_OPERATION : constant := 16#502#;  --  gl.h:255
   GL_STACK_OVERFLOW : constant := 16#503#;  --  gl.h:256
   GL_STACK_UNDERFLOW : constant := 16#504#;  --  gl.h:257
   GL_OUT_OF_MEMORY : constant := 16#505#;  --  gl.h:258
   GL_2D : constant := 16#600#;  --  gl.h:261
   GL_3D : constant := 16#601#;  --  gl.h:262
   GL_3D_COLOR : constant := 16#602#;  --  gl.h:263
   GL_3D_COLOR_TEXTURE : constant := 16#603#;  --  gl.h:264
   GL_4D_COLOR_TEXTURE : constant := 16#604#;  --  gl.h:265
   GL_PASS_THROUGH_TOKEN : constant := 16#700#;  --  gl.h:268
   GL_POINT_TOKEN : constant := 16#701#;  --  gl.h:269
   GL_LINE_TOKEN : constant := 16#702#;  --  gl.h:270
   GL_POLYGON_TOKEN : constant := 16#703#;  --  gl.h:271
   GL_BITMAP_TOKEN : constant := 16#704#;  --  gl.h:272
   GL_DRAW_PIXEL_TOKEN : constant := 16#705#;  --  gl.h:273
   GL_COPY_PIXEL_TOKEN : constant := 16#706#;  --  gl.h:274
   GL_LINE_RESET_TOKEN : constant := 16#707#;  --  gl.h:275
   GL_EXP : constant := 16#800#;  --  gl.h:279
   GL_EXP2 : constant := 16#801#;  --  gl.h:280
   GL_CW : constant := 16#900#;  --  gl.h:291
   GL_CCW : constant := 16#901#;  --  gl.h:292
   GL_COEFF : constant := 16#a00#;  --  gl.h:295
   GL_ORDER : constant := 16#a01#;  --  gl.h:296
   GL_DOMAIN : constant := 16#a02#;  --  gl.h:297
   GL_CURRENT_COLOR : constant := 16#b00#;  --  gl.h:312
   GL_CURRENT_INDEX : constant := 16#b01#;  --  gl.h:313
   GL_CURRENT_NORMAL : constant := 16#b02#;  --  gl.h:314
   GL_CURRENT_TEXTURE_COORDS : constant := 16#b03#;  --  gl.h:315
   GL_CURRENT_RASTER_COLOR : constant := 16#b04#;  --  gl.h:316
   GL_CURRENT_RASTER_INDEX : constant := 16#b05#;  --  gl.h:317
   GL_CURRENT_RASTER_TEXTURE_COORDS : constant := 16#b06#;  --  gl.h:318
   GL_CURRENT_RASTER_POSITION : constant := 16#b07#;  --  gl.h:319
   GL_CURRENT_RASTER_POSITION_VALID : constant := 16#b08#;  --  gl.h:320
   GL_CURRENT_RASTER_DISTANCE : constant := 16#b09#;  --  gl.h:321
   GL_POINT_SMOOTH : constant := 16#b10#;  --  gl.h:322
   GL_POINT_SIZE : constant := 16#b11#;  --  gl.h:323
   GL_POINT_SIZE_RANGE : constant := 16#b12#;  --  gl.h:324
   GL_POINT_SIZE_GRANULARITY : constant := 16#b13#;  --  gl.h:325
   GL_LINE_SMOOTH : constant := 16#b20#;  --  gl.h:326
   GL_LINE_WIDTH : constant := 16#b21#;  --  gl.h:327
   GL_LINE_WIDTH_RANGE : constant := 16#b22#;  --  gl.h:328
   GL_LINE_WIDTH_GRANULARITY : constant := 16#b23#;  --  gl.h:329
   GL_LINE_STIPPLE : constant := 16#b24#;  --  gl.h:330
   GL_LINE_STIPPLE_PATTERN : constant := 16#b25#;  --  gl.h:331
   GL_LINE_STIPPLE_REPEAT : constant := 16#b26#;  --  gl.h:332
   GL_LIST_MODE : constant := 16#b30#;  --  gl.h:333
   GL_MAX_LIST_NESTING : constant := 16#b31#;  --  gl.h:334
   GL_LIST_BASE : constant := 16#b32#;  --  gl.h:335
   GL_LIST_INDEX : constant := 16#b33#;  --  gl.h:336
   GL_POLYGON_MODE : constant := 16#b40#;  --  gl.h:337
   GL_POLYGON_SMOOTH : constant := 16#b41#;  --  gl.h:338
   GL_POLYGON_STIPPLE : constant := 16#b42#;  --  gl.h:339
   GL_EDGE_FLAG : constant := 16#b43#;  --  gl.h:340
   GL_CULL_FACE : constant := 16#b44#;  --  gl.h:341
   GL_CULL_FACE_MODE : constant := 16#b45#;  --  gl.h:342
   GL_FRONT_FACE : constant := 16#b46#;  --  gl.h:343
   GL_LIGHTING : constant := 16#b50#;  --  gl.h:344
   GL_LIGHT_MODEL_LOCAL_VIEWER : constant := 16#b51#;  --  gl.h:345
   GL_LIGHT_MODEL_TWO_SIDE : constant := 16#b52#;  --  gl.h:346
   GL_LIGHT_MODEL_AMBIENT : constant := 16#b53#;  --  gl.h:347
   GL_SHADE_MODEL : constant := 16#b54#;  --  gl.h:348
   GL_COLOR_MATERIAL_FACE : constant := 16#b55#;  --  gl.h:349
   GL_COLOR_MATERIAL_PARAMETER : constant := 16#b56#;  --  gl.h:350
   GL_COLOR_MATERIAL : constant := 16#b57#;  --  gl.h:351
   GL_FOG : constant := 16#b60#;  --  gl.h:352
   GL_FOG_INDEX : constant := 16#b61#;  --  gl.h:353
   GL_FOG_DENSITY : constant := 16#b62#;  --  gl.h:354
   GL_FOG_START : constant := 16#b63#;  --  gl.h:355
   GL_FOG_END : constant := 16#b64#;  --  gl.h:356
   GL_FOG_MODE : constant := 16#b65#;  --  gl.h:357
   GL_FOG_COLOR : constant := 16#b66#;  --  gl.h:358
   GL_DEPTH_RANGE : constant := 16#b70#;  --  gl.h:359
   GL_DEPTH_TEST : constant := 16#b71#;  --  gl.h:360
   GL_DEPTH_WRITEMASK : constant := 16#b72#;  --  gl.h:361
   GL_DEPTH_CLEAR_VALUE : constant := 16#b73#;  --  gl.h:362
   GL_DEPTH_FUNC : constant := 16#b74#;  --  gl.h:363
   GL_ACCUM_CLEAR_VALUE : constant := 16#b80#;  --  gl.h:364
   GL_STENCIL_TEST : constant := 16#b90#;  --  gl.h:365
   GL_STENCIL_CLEAR_VALUE : constant := 16#b91#;  --  gl.h:366
   GL_STENCIL_FUNC : constant := 16#b92#;  --  gl.h:367
   GL_STENCIL_VALUE_MASK : constant := 16#b93#;  --  gl.h:368
   GL_STENCIL_FAIL : constant := 16#b94#;  --  gl.h:369
   GL_STENCIL_PASS_DEPTH_FAIL : constant := 16#b95#;  --  gl.h:370
   GL_STENCIL_PASS_DEPTH_PASS : constant := 16#b96#;  --  gl.h:371
   GL_STENCIL_REF : constant := 16#b97#;  --  gl.h:372
   GL_STENCIL_WRITEMASK : constant := 16#b98#;  --  gl.h:373
   GL_MATRIX_MODE : constant := 16#ba0#;  --  gl.h:374
   GL_NORMALIZE : constant := 16#ba1#;  --  gl.h:375
   GL_VIEWPORT : constant := 16#ba2#;  --  gl.h:376
   GL_MODELVIEW_STACK_DEPTH : constant := 16#ba3#;  --  gl.h:377
   GL_PROJECTION_STACK_DEPTH : constant := 16#ba4#;  --  gl.h:378
   GL_TEXTURE_STACK_DEPTH : constant := 16#ba5#;  --  gl.h:379
   GL_MODELVIEW_MATRIX : constant := 16#ba6#;  --  gl.h:380
   GL_PROJECTION_MATRIX : constant := 16#ba7#;  --  gl.h:381
   GL_TEXTURE_MATRIX : constant := 16#ba8#;  --  gl.h:382
   GL_ATTRIB_STACK_DEPTH : constant := 16#bb0#;  --  gl.h:383
   GL_ALPHA_TEST : constant := 16#bc0#;  --  gl.h:384
   GL_ALPHA_TEST_FUNC : constant := 16#bc1#;  --  gl.h:385
   GL_ALPHA_TEST_REF : constant := 16#bc2#;  --  gl.h:386
   GL_DITHER : constant := 16#bd0#;  --  gl.h:387
   GL_BLEND_DST : constant := 16#be0#;  --  gl.h:388
   GL_BLEND_SRC : constant := 16#be1#;  --  gl.h:389
   GL_BLEND : constant := 16#be2#;  --  gl.h:390
   GL_LOGIC_OP_MODE : constant := 16#bf0#;  --  gl.h:391
   GL_LOGIC_OP : constant := 16#bf1#;  --  gl.h:392
   GL_AUX_BUFFERS : constant := 16#c00#;  --  gl.h:393
   GL_DRAW_BUFFER : constant := 16#c01#;  --  gl.h:394
   GL_READ_BUFFER : constant := 16#c02#;  --  gl.h:395
   GL_SCISSOR_BOX : constant := 16#c10#;  --  gl.h:396
   GL_SCISSOR_TEST : constant := 16#c11#;  --  gl.h:397
   GL_INDEX_CLEAR_VALUE : constant := 16#c20#;  --  gl.h:398
   GL_INDEX_WRITEMASK : constant := 16#c21#;  --  gl.h:399
   GL_COLOR_CLEAR_VALUE : constant := 16#c22#;  --  gl.h:400
   GL_COLOR_WRITEMASK : constant := 16#c23#;  --  gl.h:401
   GL_INDEX_MODE : constant := 16#c30#;  --  gl.h:402
   GL_RGBA_MODE : constant := 16#c31#;  --  gl.h:403
   GL_DOUBLEBUFFER : constant := 16#c32#;  --  gl.h:404
   GL_STEREO : constant := 16#c33#;  --  gl.h:405
   GL_RENDER_MODE : constant := 16#c40#;  --  gl.h:406
   GL_PERSPECTIVE_CORRECTION_HINT : constant := 16#c50#;  --  gl.h:407
   GL_POINT_SMOOTH_HINT : constant := 16#c51#;  --  gl.h:408
   GL_LINE_SMOOTH_HINT : constant := 16#c52#;  --  gl.h:409
   GL_POLYGON_SMOOTH_HINT : constant := 16#c53#;  --  gl.h:410
   GL_FOG_HINT : constant := 16#c54#;  --  gl.h:411
   GL_TEXTURE_GEN_S : constant := 16#c60#;  --  gl.h:412
   GL_TEXTURE_GEN_T : constant := 16#c61#;  --  gl.h:413
   GL_TEXTURE_GEN_R : constant := 16#c62#;  --  gl.h:414
   GL_TEXTURE_GEN_Q : constant := 16#c63#;  --  gl.h:415
   GL_PIXEL_MAP_I_TO_I : constant := 16#c70#;  --  gl.h:416
   GL_PIXEL_MAP_S_TO_S : constant := 16#c71#;  --  gl.h:417
   GL_PIXEL_MAP_I_TO_R : constant := 16#c72#;  --  gl.h:418
   GL_PIXEL_MAP_I_TO_G : constant := 16#c73#;  --  gl.h:419
   GL_PIXEL_MAP_I_TO_B : constant := 16#c74#;  --  gl.h:420
   GL_PIXEL_MAP_I_TO_A : constant := 16#c75#;  --  gl.h:421
   GL_PIXEL_MAP_R_TO_R : constant := 16#c76#;  --  gl.h:422
   GL_PIXEL_MAP_G_TO_G : constant := 16#c77#;  --  gl.h:423
   GL_PIXEL_MAP_B_TO_B : constant := 16#c78#;  --  gl.h:424
   GL_PIXEL_MAP_A_TO_A : constant := 16#c79#;  --  gl.h:425
   GL_PIXEL_MAP_I_TO_I_SIZE : constant := 16#cb0#;  --  gl.h:426
   GL_PIXEL_MAP_S_TO_S_SIZE : constant := 16#cb1#;  --  gl.h:427
   GL_PIXEL_MAP_I_TO_R_SIZE : constant := 16#cb2#;  --  gl.h:428
   GL_PIXEL_MAP_I_TO_G_SIZE : constant := 16#cb3#;  --  gl.h:429
   GL_PIXEL_MAP_I_TO_B_SIZE : constant := 16#cb4#;  --  gl.h:430
   GL_PIXEL_MAP_I_TO_A_SIZE : constant := 16#cb5#;  --  gl.h:431
   GL_PIXEL_MAP_R_TO_R_SIZE : constant := 16#cb6#;  --  gl.h:432
   GL_PIXEL_MAP_G_TO_G_SIZE : constant := 16#cb7#;  --  gl.h:433
   GL_PIXEL_MAP_B_TO_B_SIZE : constant := 16#cb8#;  --  gl.h:434
   GL_PIXEL_MAP_A_TO_A_SIZE : constant := 16#cb9#;  --  gl.h:435
   GL_UNPACK_SWAP_BYTES : constant := 16#cf0#;  --  gl.h:436
   GL_UNPACK_LSB_FIRST : constant := 16#cf1#;  --  gl.h:437
   GL_UNPACK_ROW_LENGTH : constant := 16#cf2#;  --  gl.h:438
   GL_UNPACK_SKIP_ROWS : constant := 16#cf3#;  --  gl.h:439
   GL_UNPACK_SKIP_PIXELS : constant := 16#cf4#;  --  gl.h:440
   GL_UNPACK_ALIGNMENT : constant := 16#cf5#;  --  gl.h:441
   GL_PACK_SWAP_BYTES : constant := 16#d00#;  --  gl.h:442
   GL_PACK_LSB_FIRST : constant := 16#d01#;  --  gl.h:443
   GL_PACK_ROW_LENGTH : constant := 16#d02#;  --  gl.h:444
   GL_PACK_SKIP_ROWS : constant := 16#d03#;  --  gl.h:445
   GL_PACK_SKIP_PIXELS : constant := 16#d04#;  --  gl.h:446
   GL_PACK_ALIGNMENT : constant := 16#d05#;  --  gl.h:447
   GL_MAP_COLOR : constant := 16#d10#;  --  gl.h:448
   GL_MAP_STENCIL : constant := 16#d11#;  --  gl.h:449
   GL_INDEX_SHIFT : constant := 16#d12#;  --  gl.h:450
   GL_INDEX_OFFSET : constant := 16#d13#;  --  gl.h:451
   GL_RED_SCALE : constant := 16#d14#;  --  gl.h:452
   GL_RED_BIAS : constant := 16#d15#;  --  gl.h:453
   GL_ZOOM_X : constant := 16#d16#;  --  gl.h:454
   GL_ZOOM_Y : constant := 16#d17#;  --  gl.h:455
   GL_GREEN_SCALE : constant := 16#d18#;  --  gl.h:456
   GL_GREEN_BIAS : constant := 16#d19#;  --  gl.h:457
   GL_BLUE_SCALE : constant := 16#d1a#;  --  gl.h:458
   GL_BLUE_BIAS : constant := 16#d1b#;  --  gl.h:459
   GL_ALPHA_SCALE : constant := 16#d1c#;  --  gl.h:460
   GL_ALPHA_BIAS : constant := 16#d1d#;  --  gl.h:461
   GL_DEPTH_SCALE : constant := 16#d1e#;  --  gl.h:462
   GL_DEPTH_BIAS : constant := 16#d1f#;  --  gl.h:463
   GL_MAX_EVAL_ORDER : constant := 16#d30#;  --  gl.h:464
   GL_MAX_LIGHTS : constant := 16#d31#;  --  gl.h:465
   GL_MAX_CLIP_PLANES : constant := 16#d32#;  --  gl.h:466
   GL_MAX_TEXTURE_SIZE : constant := 16#d33#;  --  gl.h:467
   GL_MAX_PIXEL_MAP_TABLE : constant := 16#d34#;  --  gl.h:468
   GL_MAX_ATTRIB_STACK_DEPTH : constant := 16#d35#;  --  gl.h:469
   GL_MAX_MODELVIEW_STACK_DEPTH : constant := 16#d36#;  --  gl.h:470
   GL_MAX_NAME_STACK_DEPTH : constant := 16#d37#;  --  gl.h:471
   GL_MAX_PROJECTION_STACK_DEPTH : constant := 16#d38#;  --  gl.h:472
   GL_MAX_TEXTURE_STACK_DEPTH : constant := 16#d39#;  --  gl.h:473
   GL_MAX_VIEWPORT_DIMS : constant := 16#d3a#;  --  gl.h:474
   GL_SUBPIXEL_BITS : constant := 16#d50#;  --  gl.h:475
   GL_INDEX_BITS : constant := 16#d51#;  --  gl.h:476
   GL_RED_BITS : constant := 16#d52#;  --  gl.h:477
   GL_GREEN_BITS : constant := 16#d53#;  --  gl.h:478
   GL_BLUE_BITS : constant := 16#d54#;  --  gl.h:479
   GL_ALPHA_BITS : constant := 16#d55#;  --  gl.h:480
   GL_DEPTH_BITS : constant := 16#d56#;  --  gl.h:481
   GL_STENCIL_BITS : constant := 16#d57#;  --  gl.h:482
   GL_ACCUM_RED_BITS : constant := 16#d58#;  --  gl.h:483
   GL_ACCUM_GREEN_BITS : constant := 16#d59#;  --  gl.h:484
   GL_ACCUM_BLUE_BITS : constant := 16#d5a#;  --  gl.h:485
   GL_ACCUM_ALPHA_BITS : constant := 16#d5b#;  --  gl.h:486
   GL_NAME_STACK_DEPTH : constant := 16#d70#;  --  gl.h:487
   GL_AUTO_NORMAL : constant := 16#d80#;  --  gl.h:488
   GL_MAP1_COLOR_4 : constant := 16#d90#;  --  gl.h:489
   GL_MAP1_INDEX : constant := 16#d91#;  --  gl.h:490
   GL_MAP1_NORMAL : constant := 16#d92#;  --  gl.h:491
   GL_MAP1_TEXTURE_COORD_1 : constant := 16#d93#;  --  gl.h:492
   GL_MAP1_TEXTURE_COORD_2 : constant := 16#d94#;  --  gl.h:493
   GL_MAP1_TEXTURE_COORD_3 : constant := 16#d95#;  --  gl.h:494
   GL_MAP1_TEXTURE_COORD_4 : constant := 16#d96#;  --  gl.h:495
   GL_MAP1_VERTEX_3 : constant := 16#d97#;  --  gl.h:496
   GL_MAP1_VERTEX_4 : constant := 16#d98#;  --  gl.h:497
   GL_MAP2_COLOR_4 : constant := 16#db0#;  --  gl.h:498
   GL_MAP2_INDEX : constant := 16#db1#;  --  gl.h:499
   GL_MAP2_NORMAL : constant := 16#db2#;  --  gl.h:500
   GL_MAP2_TEXTURE_COORD_1 : constant := 16#db3#;  --  gl.h:501
   GL_MAP2_TEXTURE_COORD_2 : constant := 16#db4#;  --  gl.h:502
   GL_MAP2_TEXTURE_COORD_3 : constant := 16#db5#;  --  gl.h:503
   GL_MAP2_TEXTURE_COORD_4 : constant := 16#db6#;  --  gl.h:504
   GL_MAP2_VERTEX_3 : constant := 16#db7#;  --  gl.h:505
   GL_MAP2_VERTEX_4 : constant := 16#db8#;  --  gl.h:506
   GL_MAP1_GRID_DOMAIN : constant := 16#dd0#;  --  gl.h:507
   GL_MAP1_GRID_SEGMENTS : constant := 16#dd1#;  --  gl.h:508
   GL_MAP2_GRID_DOMAIN : constant := 16#dd2#;  --  gl.h:509
   GL_MAP2_GRID_SEGMENTS : constant := 16#dd3#;  --  gl.h:510
   GL_TEXTURE_1D : constant := 16#de0#;  --  gl.h:511
   GL_TEXTURE_2D : constant := 16#de1#;  --  gl.h:512
   GL_TEXTURE_WIDTH : constant := 16#1000#; --  gl.h:519
   GL_TEXTURE_HEIGHT : constant := 16#1001#; --  gl.h:520
   GL_TEXTURE_COMPONENTS : constant := 16#1003#; --  gl.h:521
   GL_TEXTURE_BORDER_COLOR : constant := 16#1004#; --  gl.h:522
   GL_TEXTURE_BORDER : constant := 16#1005#; --  gl.h:523
   GL_DONT_CARE : constant := 16#1100#; --  gl.h:526
   GL_FASTEST : constant := 16#1101#; --  gl.h:527
   GL_NICEST : constant := 16#1102#; --  gl.h:528
   GL_LIGHT0 : constant := 16#4000#; --  gl.h:543
   GL_LIGHT1 : constant := 16#4001#; --  gl.h:544
   GL_LIGHT2 : constant := 16#4002#; --  gl.h:545
   GL_LIGHT3 : constant := 16#4003#; --  gl.h:546
   GL_LIGHT4 : constant := 16#4004#; --  gl.h:547
   GL_LIGHT5 : constant := 16#4005#; --  gl.h:548
   GL_LIGHT6 : constant := 16#4006#; --  gl.h:549
   GL_LIGHT7 : constant := 16#4007#; --  gl.h:550
   GL_AMBIENT : constant := 16#1200#; --  gl.h:553
   GL_DIFFUSE : constant := 16#1201#; --  gl.h:554
   GL_SPECULAR : constant := 16#1202#; --  gl.h:555
   GL_POSITION : constant := 16#1203#; --  gl.h:556
   GL_SPOT_DIRECTION : constant := 16#1204#; --  gl.h:557
   GL_SPOT_EXPONENT : constant := 16#1205#; --  gl.h:558
   GL_SPOT_CUTOFF : constant := 16#1206#; --  gl.h:559
   GL_CONSTANT_ATTENUATION : constant := 16#1207#; --  gl.h:560
   GL_LINEAR_ATTENUATION : constant := 16#1208#; --  gl.h:561
   GL_QUADRATIC_ATTENUATION : constant := 16#1209#; --  gl.h:562
   GL_COMPILE : constant := 16#1300#; --  gl.h:565
   GL_COMPILE_AND_EXECUTE : constant := 16#1301#; --  gl.h:566
   GL_BYTE : constant := 16#1400#; --  gl.h:569
   GL_UNSIGNED_BYTE : constant := 16#1401#; --  gl.h:570
   GL_SHORT : constant := 16#1402#; --  gl.h:571
   GL_UNSIGNED_SHORT : constant := 16#1403#; --  gl.h:572
   GL_INT : constant := 16#1404#; --  gl.h:573
   GL_UNSIGNED_INT : constant := 16#1405#; --  gl.h:574
   GL_FLOAT : constant := 16#1406#; --  gl.h:575
   GL_2_BYTES : constant := 16#1407#; --  gl.h:576
   GL_3_BYTES : constant := 16#1408#; --  gl.h:577
   GL_4_BYTES : constant := 16#1409#; --  gl.h:578
   GL_CLEAR : constant := 16#1500#; --  gl.h:581
   GL_AND : constant := 16#1501#; --  gl.h:582
   GL_AND_REVERSE : constant := 16#1502#; --  gl.h:583
   GL_COPY : constant := 16#1503#; --  gl.h:584
   GL_AND_INVERTED : constant := 16#1504#; --  gl.h:585
   GL_NOOP : constant := 16#1505#; --  gl.h:586
   GL_XOR : constant := 16#1506#; --  gl.h:587
   GL_OR : constant := 16#1507#; --  gl.h:588
   GL_NOR : constant := 16#1508#; --  gl.h:589
   GL_EQUIV : constant := 16#1509#; --  gl.h:590
   GL_INVERT : constant := 16#150a#; --  gl.h:591
   GL_OR_REVERSE : constant := 16#150b#; --  gl.h:592
   GL_COPY_INVERTED : constant := 16#150c#; --  gl.h:593
   GL_OR_INVERTED : constant := 16#150d#; --  gl.h:594
   GL_NAND : constant := 16#150e#; --  gl.h:595
   GL_SET : constant := 16#150f#; --  gl.h:596
   GL_EMISSION : constant := 16#1600#; --  gl.h:624
   GL_SHININESS : constant := 16#1601#; --  gl.h:625
   GL_AMBIENT_AND_DIFFUSE : constant := 16#1602#; --  gl.h:626
   GL_COLOR_INDEXES : constant := 16#1603#; --  gl.h:627
   GL_MODELVIEW : constant := 16#1700#; --  gl.h:633
   GL_PROJECTION : constant := 16#1701#; --  gl.h:634
   GL_TEXTURE : constant := 16#1702#; --  gl.h:635
   GL_COLOR : constant := 16#1800#; --  gl.h:647
   GL_DEPTH : constant := 16#1801#; --  gl.h:648
   GL_STENCIL : constant := 16#1802#; --  gl.h:649
   GL_COLOR_INDEX : constant := 16#1900#; --  gl.h:652
   GL_STENCIL_INDEX : constant := 16#1901#; --  gl.h:653
   GL_DEPTH_COMPONENT : constant := 16#1902#; --  gl.h:654
   GL_RED : constant := 16#1903#; --  gl.h:655
   GL_GREEN : constant := 16#1904#; --  gl.h:656
   GL_BLUE : constant := 16#1905#; --  gl.h:657
   GL_ALPHA : constant := 16#1906#; --  gl.h:658
   GL_RGB : constant := 16#1907#; --  gl.h:659
   GL_RGBA : constant := 16#1908#; --  gl.h:660
   GL_LUMINANCE : constant := 16#1909#; --  gl.h:661
   GL_LUMINANCE_ALPHA : constant := 16#190a#; --  gl.h:662
   GL_BITMAP : constant := 16#1a00#; --  gl.h:707
   GL_POINT : constant := 16#1b00#; --  gl.h:717
   GL_LINE : constant := 16#1b01#; --  gl.h:718
   GL_FILL : constant := 16#1b02#; --  gl.h:719
   GL_RENDER : constant := 16#1c00#; --  gl.h:736
   GL_FEEDBACK : constant := 16#1c01#; --  gl.h:737
   GL_SELECT : constant := 16#1c02#; --  gl.h:738
   GL_FLAT : constant := 16#1d00#; --  gl.h:741
   GL_SMOOTH : constant := 16#1d01#; --  gl.h:742
   GL_KEEP : constant := 16#1e00#; --  gl.h:756
   GL_REPLACE : constant := 16#1e01#; --  gl.h:757
   GL_INCR : constant := 16#1e02#; --  gl.h:758
   GL_DECR : constant := 16#1e03#; --  gl.h:759
   GL_VENDOR : constant := 16#1f00#; --  gl.h:763
   GL_RENDERER : constant := 16#1f01#; --  gl.h:764
   GL_VERSION : constant := 16#1f02#; --  gl.h:765
   GL_EXTENSIONS : constant := 16#1f03#; --  gl.h:766
   GL_S : constant := 16#2000#; --  gl.h:769
   GL_T : constant := 16#2001#; --  gl.h:770
   GL_R : constant := 16#2002#; --  gl.h:771
   GL_Q : constant := 16#2003#; --  gl.h:772
   GL_MODULATE : constant := 16#2100#; --  gl.h:775
   GL_DECAL : constant := 16#2101#; --  gl.h:776
   GL_TEXTURE_ENV_MODE : constant := 16#2200#; --  gl.h:780
   GL_TEXTURE_ENV_COLOR : constant := 16#2201#; --  gl.h:781
   GL_TEXTURE_ENV : constant := 16#2300#; --  gl.h:784
   GL_EYE_LINEAR : constant := 16#2400#; --  gl.h:787
   GL_OBJECT_LINEAR : constant := 16#2401#; --  gl.h:788
   GL_SPHERE_MAP : constant := 16#2402#; --  gl.h:789
   GL_TEXTURE_GEN_MODE : constant := 16#2500#; --  gl.h:792
   GL_OBJECT_PLANE : constant := 16#2501#; --  gl.h:793
   GL_EYE_PLANE : constant := 16#2502#; --  gl.h:794
   GL_NEAREST : constant := 16#2600#; --  gl.h:797
   GL_LINEAR : constant := 16#2601#; --  gl.h:798
   GL_NEAREST_MIPMAP_NEAREST : constant := 16#2700#; --  gl.h:803
   GL_LINEAR_MIPMAP_NEAREST : constant := 16#2701#; --  gl.h:804
   GL_NEAREST_MIPMAP_LINEAR : constant := 16#2702#; --  gl.h:805
   GL_LINEAR_MIPMAP_LINEAR : constant := 16#2703#; --  gl.h:806
   GL_TEXTURE_MAG_FILTER : constant := 16#2800#; --  gl.h:809
   GL_TEXTURE_MIN_FILTER : constant := 16#2801#; --  gl.h:810
   GL_TEXTURE_WRAP_S : constant := 16#2802#; --  gl.h:811
   GL_TEXTURE_WRAP_T : constant := 16#2803#; --  gl.h:812
   GL_CLAMP : constant := 16#2900#; --  gl.h:819
   GL_REPEAT : constant := 16#2901#; --  gl.h:820

   type GLenum is new Win32.UINT;                          --  gl.h:40
   type GLboolean is new Win32.UCHAR;                      --  gl.h:41
   type GLbitfield is new Win32.UINT;                      --  gl.h:42
   type GLbyte is new Win32.CHAR;                          --  gl.h:43
   type GLshort is new Win32.SHORT;                        --  gl.h:44
   type GLint is new Win32.LONG;                           --  gl.h:45
   type GLsizei is new Win32.LONG;                         --  gl.h:46
   type GLubyte is new Win32.BYTE;                         --  gl.h:47
   type GLushort is new Win32.USHORT;                      --  gl.h:48
   type GLuint is new Win32.UINT;                          --  gl.h:49
   type GLfloat is new Win32.FLOAT;                        --  gl.h:50
   type GLclampf is new Win32.FLOAT;                       --  gl.h:51
   type GLdouble is new Win32.DOUBLE;                      --  gl.h:52
   type GLclampd is new Win32.DOUBLE;                      --  gl.h:53
   type GLvoid is new Win32.VOID;                          --  gl.h:54
   type PGLvoid is access all GLvoid;                      --  gl.h:932
   type a_GLint is access all GLint;                       --  gl.h:846
   type a_GLuint is access all GLuint;                     --  gl.h:852
   type a_GLdouble is access all GLdouble;                 --  gl.h:838
   type a_GLshort is access all GLshort;                   --  gl.h:848
   type ac_GLint is access constant GLint;                 --  gl.h:846
   type ac_GLuint is access constant GLuint;               --  gl.h:852
   type ac_GLfloat is access constant GLfloat;
   type ac_GLdouble is access constant GLdouble;           --  gl.h:838
   type ac_GLshort is access constant GLshort;             --  gl.h:848

   procedure glAccum
     (op : GLenum;
      value : GLfloat);                            --  gl.h:825

   procedure glAlphaFunc
     (func : GLenum;
      ref : GLclampf);                            --  gl.h:826

   procedure glBegin
     (mode : GLenum);                              --  gl.h:827

   procedure glBindTexture( target: GLenum; texture: GLuint);

   procedure glBitmap
     (width : GLsizei;
      height : GLsizei;
      xorig : GLfloat;
      yorig : GLfloat;
      xmove : GLfloat;
      ymove : GLfloat;
      bitmap : Win32.PCBYTE);                      --  gl.h:828

   procedure glBlendFunc
     (sfactor : GLenum;
      dfactor : GLenum);                           --  gl.h:829

   procedure glCallList
     (list : GLuint);                              --  gl.h:830

   procedure glCallLists
     (n : GLsizei;
      c_type : GLenum;
      lists : Win32.PCVOID);                      --  gl.h:831

   procedure glClear
     (mask : GLbitfield);                          --  gl.h:832

   procedure glClearAccum
     (red : GLfloat;
      green : GLfloat;
      blue : GLfloat;
      alpha : GLfloat);                            --  gl.h:833

   procedure glClearColor
     (red : GLclampf;
      green : GLclampf;
      blue : GLclampf;
      alpha : GLclampf);                           --  gl.h:834

   procedure glClearDepth
     (depth : GLclampd);                           --  gl.h:835

   procedure glClearIndex
     (c : GLfloat);                                --  gl.h:836

   procedure glClearStencil
     (s : GLint);                                  --  gl.h:837

   procedure glClipPlane
     (plane : GLenum;
      equation : ac_GLdouble);                     --  gl.h:838

   procedure glColor3b
     (red : GLbyte;
      green : GLbyte;
      blue : GLbyte);                             --  gl.h:839

   procedure glColor3bv
     (v : Win32.PCSTR);                            --  gl.h:840

   procedure glColor3d
     (red : GLdouble;
      green : GLdouble;
      blue : GLdouble);                           --  gl.h:841

   procedure glColor3dv
     (v : ac_GLdouble);                            --  gl.h:842

   procedure glColor3f
     (red : GLfloat;
      green : GLfloat;
      blue : GLfloat);                            --  gl.h:843

   procedure glColor3fv
     (v : ac_GLfloat);                             --  gl.h:844

   procedure glColor3i
     (red : GLint;
      green : GLint;
      blue : GLint);                              --  gl.h:845

   procedure glColor3iv
     (v : ac_GLint);                               --  gl.h:846

   procedure glColor3s
     (red : GLshort;
      green : GLshort;
      blue : GLshort);                            --  gl.h:847

   procedure glColor3sv
     (v : ac_GLshort);                             --  gl.h:848

   procedure glColor3ub
     (red : GLubyte;
      green : GLubyte;
      blue : GLubyte);                            --  gl.h:849

   procedure glColor3ubv
     (v : Win32.PCBYTE);                           --  gl.h:850

   procedure glColor3ui
     (red : GLuint;
      green : GLuint;
      blue : GLuint);                             --  gl.h:851

   procedure glColor3uiv
     (v : ac_GLuint);                              --  gl.h:852

   procedure glColor3us
     (red : GLushort;
      green : GLushort;
      blue : GLushort);                           --  gl.h:853

   procedure glColor3usv
     (v : Win32.PCWSTR);                           --  gl.h:854

   procedure glColor4b
     (red : GLbyte;
      green : GLbyte;
      blue : GLbyte;
      alpha : GLbyte);                             --  gl.h:855

   procedure glColor4bv
     (v : Win32.PCSTR);                            --  gl.h:856

   procedure glColor4d
     (red : GLdouble;
      green : GLdouble;
      blue : GLdouble;
      alpha : GLdouble);                           --  gl.h:857

   procedure glColor4dv
     (v : ac_GLdouble);                            --  gl.h:858

   procedure glColor4f
     (red : GLfloat;
      green : GLfloat;
      blue : GLfloat;
      alpha : GLfloat);                            --  gl.h:859

   procedure glColor4fv
     (v : ac_GLfloat);                             --  gl.h:860

   procedure glColor4i
     (red : GLint;
      green : GLint;
      blue : GLint;
      alpha : GLint);                              --  gl.h:861

   procedure glColor4iv
     (v : ac_GLuint);                              --  gl.h:862

   procedure glColor4s
     (red : GLshort;
      green : GLshort;
      blue : GLshort;
      alpha : GLshort);                            --  gl.h:863

   procedure glColor4sv
     (v : ac_GLshort);                             --  gl.h:864

   procedure glColor4ub
     (red : GLubyte;
      green : GLubyte;
      blue : GLubyte;
      alpha : GLubyte);                            --  gl.h:865

   procedure glColor4ubv
     (v : Win32.PCBYTE);                           --  gl.h:866

   procedure glColor4ui
     (red : GLuint;
      green : GLuint;
      blue : GLuint;
      alpha : GLuint);                             --  gl.h:867

   procedure glColor4uiv
     (v : ac_GLint);                               --  gl.h:868

   procedure glColor4us
     (red : GLushort;
      green : GLushort;
      blue : GLushort;
      alpha : GLushort);                           --  gl.h:869

   procedure glColor4usv
     (v : Win32.PCWSTR);                           --  gl.h:870

   procedure glColorMask
     (red : GLboolean;
      green : GLboolean;
      blue : GLboolean;
      alpha : GLboolean);                          --  gl.h:871

   procedure glColorMaterial
     (face : GLenum;
      mode : GLenum);                              --  gl.h:872

   procedure glCopyPixels
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei;
      c_type : GLenum);                            --  gl.h:873

   procedure glCullFace
     (mode : GLenum);                              --  gl.h:874

   procedure glDeleteLists
     (list : GLuint;
      c_range : GLsizei);                          --  gl.h:875

   procedure glDepthFunc
     (func : GLenum);                              --  gl.h:876

   procedure glDepthMask
     (flag : GLboolean);                           --  gl.h:877

   procedure glDepthRange
     (zNear : GLclampd;
      zFar : GLclampd);                           --  gl.h:878

   procedure glDisable
     (cap : GLenum);                               --  gl.h:879

   procedure glDrawBuffer
     (mode : GLenum);                              --  gl.h:880

   procedure glDrawPixels
     (width : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : Win32.PCVOID);                      --  gl.h:881

   procedure glEdgeFlag
     (flag : GLboolean);                           --  gl.h:882

   procedure glEdgeFlagv
     (flag : Win32.PCBYTE);                        --  gl.h:883

   procedure glEnable
     (cap : GLenum);                               --  gl.h:884

   procedure glEnd;                                        --  gl.h:885

   procedure glEndList;                                    --  gl.h:886

   procedure glEvalCoord1d
     (u : GLdouble);                               --  gl.h:887

   procedure glEvalCoord1dv
     (u : ac_GLdouble);                            --  gl.h:888

   procedure glEvalCoord1f
     (u : GLfloat);                                --  gl.h:889

   procedure glEvalCoord1fv
     (u : ac_GLfloat);                             --  gl.h:890

   procedure glEvalCoord2d
     (u : GLdouble;
      v : GLdouble);                               --  gl.h:891

   procedure glEvalCoord2dv
     (u : ac_GLdouble);                            --  gl.h:892

   procedure glEvalCoord2f
     (u : GLfloat;
      v : GLfloat);                                --  gl.h:893

   procedure glEvalCoord2fv
     (u : ac_GLfloat);                             --  gl.h:894

   procedure glEvalMesh1
     (mode : GLenum;
      i1 : GLint;
      i2 : GLint);                               --  gl.h:895

   procedure glEvalMesh2
     (mode : GLenum;
      i1 : GLint;
      i2 : GLint;
      j1 : GLint;
      j2 : GLint);                               --  gl.h:896

   procedure glEvalPoint1
     (i : GLint);                                  --  gl.h:897

   procedure glEvalPoint2
     (i : GLint;
      j : GLint);                                  --  gl.h:898

   procedure glFeedbackBuffer
     (size : GLsizei;
      c_type : GLenum;
      buffer : access GLfloat);                    --  gl.h:899

   procedure glFinish;                                     --  gl.h:900

   procedure glFlush;                                      --  gl.h:901

   procedure glFogf
     (pname : GLenum;
      param : GLfloat);                            --  gl.h:902

   procedure glFogfv
     (pname : GLenum;
      params : ac_GLfloat);                        --  gl.h:903

   procedure glFogi
     (pname : GLenum;
      param : GLint);                              --  gl.h:904

   procedure glFogiv
     (pname : GLenum;
      params : ac_GLint);                          --  gl.h:905

   procedure glFrontFace
     (mode : GLenum);                              --  gl.h:906

   procedure glFrustum
     (left : GLdouble;
      right : GLdouble;
      bottom : GLdouble;
      top : GLdouble;
      zNear : GLdouble;
      zFar : GLdouble);                          --  gl.h:907

   function glGenLists
     (c_range : GLsizei)
     return GLuint;                               --  gl.h:908

   procedure glGetBooleanv
     (pname : GLenum;
      params : access GLboolean);                  --  gl.h:909

   procedure glGetClipPlane
     (plane : GLenum;
      equation : access GLdouble);                 --  gl.h:910

   procedure glGetDoublev
     (pname : GLenum;
      params : access GLdouble);                   --  gl.h:911

   function glGetError return GLenum;                      --  gl.h:912

   procedure glGetFloatv
     (pname : GLenum;
      params : access GLfloat);                    --  gl.h:913

   procedure glGetIntegerv
     (pname : GLenum;
      params : access GLint);                      --  gl.h:914

   procedure glGetLightfv
     (light : GLenum;
      pname : GLenum;
      params : access GLfloat);                    --  gl.h:915

   procedure glGetLightiv
     (light : GLenum;
      pname : GLenum;
      params : access GLint);                      --  gl.h:916

   procedure glGetMapdv
     (target : GLenum;
      query : GLenum;
      v : access GLdouble);                   --  gl.h:917

   procedure glGetMapfv
     (target : GLenum;
      query : GLenum;
      v : access GLfloat);                    --  gl.h:918

   procedure glGetMapiv
     (target : GLenum;
      query : GLenum;
      v : access GLint);                      --  gl.h:919

   procedure glGetMaterialfv
     (face : GLenum;
      pname : GLenum;
      params : access GLfloat);                    --  gl.h:920

   procedure glGetMaterialiv
     (face : GLenum;
      pname : GLenum;
      params : access GLint);                      --  gl.h:921

   procedure glGetPixelMapfv
     (map : GLenum;
      values : access GLfloat);                    --  gl.h:922

   procedure glGetPixelMapuiv
     (map : GLenum;
      values : access GLuint);                     --  gl.h:923

   procedure glGetPixelMapusv
     (map : GLenum;
      values : Win32.PWSTR);                       --  gl.h:924

   procedure GlGetPolygonStipple
     (mask : access GLubyte);          --  gl.h:925

   function glGetString (name : GLenum)
                        return Win32.PCBYTE;                       --  gl.h:926

   procedure glGetTexEnvfv (
                            target : GLenum;
                            pname : GLenum;
                            params : access GLfloat);              --  gl.h:927

   procedure glGetTexEnviv
     (target : GLenum;
      pname : GLenum;
      params : access GLint);                      --  gl.h:928

   procedure glGetTexGendv
     (coord : GLenum;
      pname : GLenum;
      params : access GLdouble);                   --  gl.h:929

   procedure glGetTexGenfv
     (coord : GLenum;
      pname : GLenum;
      params : access GLfloat);                    --  gl.h:930

   procedure glGetTexGeniv
     (coord : GLenum;
      pname : GLenum;
      params : access GLint);                      --  gl.h:931

   procedure glGetTexImage
     (target : GLenum;
      level : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : PGLvoid);                           --  gl.h:932

   procedure glGetTexLevelParameterfv
     (target : GLenum;
      level : GLint;
      pname : GLenum;
      params : access GLfloat);                    --  gl.h:933

   procedure glGetTexLevelParameteriv
     (target : GLenum;
      level : GLint;
      pname : GLenum;
      params : access GLint);                      --  gl.h:934

   procedure glGetTexParameterfv
     (target : GLenum;
      pname : GLenum;
      params : access GLfloat);                    --  gl.h:935

   procedure glGetTexParameteriv
     (target : GLenum;
      pname : GLenum;
      params : access GLint);                      --  gl.h:936

   procedure glHint
     (target : GLenum;
      mode : GLenum);                            --  gl.h:937

   procedure glIndexMask
     (mask : GLuint);                              --  gl.h:938

   procedure glIndexd
     (c : GLdouble);                               --  gl.h:939

   procedure glIndexdv
     (c : ac_GLdouble);                            --  gl.h:940

   procedure glIndexf
     (c : GLfloat);                                --  gl.h:941

   procedure glIndexfv
     (c : ac_GLfloat);                             --  gl.h:942

   procedure glIndexi
     (c : GLint);                                  --  gl.h:943

   procedure glIndexiv
     (c : ac_GLuint);                              --  gl.h:944

   procedure glIndexs
     (c : GLshort);                                --  gl.h:945

   procedure glIndexsv
     (c : ac_GLshort);                             --  gl.h:946

   procedure glInitNames;                                  --  gl.h:947

   function glIsEnabled
     (cap : GLenum)
     return GLboolean;                            --  gl.h:948

   function glIsList
     (list : GLuint)
     return GLboolean;                            --  gl.h:949

   procedure glLightModelf
     (pname : GLenum;
      param : GLfloat);                            --  gl.h:950

   procedure glLightModelfv
     (pname : GLenum;
      params : ac_GLfloat);                        --  gl.h:951

   procedure glLightModeli
     (pname : GLenum;
      param : GLint);                              --  gl.h:952

   procedure glLightModeliv
     (pname : GLenum;
      params : ac_GLuint);                         --  gl.h:953

   procedure glLightf
     (light : GLenum;
      pname : GLenum;
      param : GLfloat);                            --  gl.h:954

   procedure glLightfv
     (light : GLenum;
      pname : GLenum;
      params : ac_GLfloat);                        --  gl.h:955

   procedure glLighti
     (light : GLenum;
      pname : GLenum;
      param : GLint);                              --  gl.h:956

   procedure glLightiv
     (light : GLenum;
      pname : GLenum;
      params : ac_GLuint);                         --  gl.h:957

   procedure glLineStipple
     (factor : GLint;
      pattern : GLushort);                         --  gl.h:958

   procedure glLineWidth
     (width : GLfloat);                            --  gl.h:959

   procedure glListBase
     (base : GLuint);                              --  gl.h:960

   procedure glLoadIdentity;                               --  gl.h:961

   procedure glLoadMatrixd
     (m : ac_GLdouble);                            --  gl.h:962

   procedure glLoadMatrixf
     (m : ac_GLfloat);                             --  gl.h:963

   procedure glLoadName
     (name : GLuint);                              --  gl.h:964

   procedure glLogicOp
     (opcode : GLenum);                            --  gl.h:965

   procedure glMap1d
     (target : GLenum;
      u1 : GLdouble;
      u2 : GLdouble;
      stride : GLint;
      order : GLint;
      points : ac_GLdouble);                       --  gl.h:966

   procedure glMap1f
     (target : GLenum;
      u1 : GLfloat;
      u2 : GLfloat;
      stride : GLint;
      order : GLint;
      points : ac_GLfloat);                        --  gl.h:967

   procedure glMap2d
     (target : GLenum;
      u1 : GLdouble;
      u2 : GLdouble;
      ustride : GLint;
      uorder : GLint;
      v1 : GLdouble;
      v2 : GLdouble;
      vstride : GLint;
      vorder : GLint;
      points : ac_GLdouble);                      --  gl.h:968

   procedure glMap2f
     (target : GLenum;
      u1 : GLfloat;
      u2 : GLfloat;
      ustride : GLint;
      uorder : GLint;
      v1 : GLfloat;
      v2 : GLfloat;
      vstride : GLint;
      vorder : GLint;
      points : ac_GLfloat);                       --  gl.h:969

   procedure glMapGrid1d
     (un : GLint;
      u1 : GLdouble;
      u2 : GLdouble);                              --  gl.h:970

   procedure glMapGrid1f
     (un : GLint;
      u1 : GLfloat;
      u2 : GLfloat);                               --  gl.h:971

   procedure glMapGrid2d
     (un : GLint;
      u1 : GLdouble;
      u2 : GLdouble;
      vn : GLint;
      v1 : GLdouble;
      v2 : GLdouble);                              --  gl.h:972

   procedure glMapGrid2f
     (un : GLint;
      u1 : GLfloat;
      u2 : GLfloat;
      vn : GLint;
      v1 : GLfloat;
      v2 : GLfloat);                               --  gl.h:973

   procedure glMaterialf
     (face : GLenum;
      pname : GLenum;
      param : GLfloat);                            --  gl.h:974

   procedure glMaterialfv
     (face : GLenum;
      pname : GLenum;
      params : ac_GLfloat);                        --  gl.h:975

   procedure glMateriali
     (face : GLenum;
      pname : GLenum;
      param : GLint);                              --  gl.h:976

   procedure glMaterialiv
     (face : GLenum;
      pname : GLenum;
      params : ac_GLint);                          --  gl.h:977

   procedure glMatrixMode
     (mode : GLenum);                              --  gl.h:978

   procedure glMultMatrixd
     (m : ac_GLdouble);                            --  gl.h:979

   procedure glMultMatrixf
     (m : ac_GLfloat);                             --  gl.h:980

   procedure glNewList
     (list : GLuint;
      mode : GLenum);                              --  gl.h:981

   procedure glNormal3b
     (nx : GLbyte;
      ny : GLbyte;
      nz : GLbyte);                                --  gl.h:982

   procedure glNormal3bv
     (v : Win32.PCSTR);                            --  gl.h:983

   procedure glNormal3d
     (nx : GLdouble;
      ny : GLdouble;
      nz : GLdouble);                              --  gl.h:984

   procedure glNormal3dv
     (v : ac_GLdouble);                            --  gl.h:985

   procedure glNormal3f
     (nx : GLfloat;
      ny : GLfloat;
      nz : GLfloat);                               --  gl.h:986

   procedure glNormal3fv
     (v : ac_GLfloat);                             --  gl.h:987

   procedure glNormal3i
     (nx : GLint;
      ny : GLint;
      nz : GLint);                                 --  gl.h:988

   procedure glNormal3iv
     (v : ac_GLint);                               --  gl.h:989

   procedure glNormal3s
     (nx : GLshort;
      ny : GLshort;
      nz : GLshort);                               --  gl.h:990

   procedure glNormal3sv
     (v : ac_GLshort);                             --  gl.h:991

   procedure glOrtho
     (left : GLdouble;
      right : GLdouble;
      bottom : GLdouble;
      top : GLdouble;
      zNear : GLdouble;
      zFar : GLdouble);                          --  gl.h:992

   procedure glPassThrough
     (token : GLfloat);                            --  gl.h:993

   procedure glPixelMapfv
     (map : GLenum;
      mapsize : GLint;
      values : ac_GLfloat);                       --  gl.h:994

   procedure glPixelMapuiv
     (map : GLenum;
      mapsize : GLint;
      values : ac_GLint);                         --  gl.h:995

   procedure glPixelMapusv
     (map : GLenum;
      mapsize : GLint;
      values : Win32.PCWSTR);                     --  gl.h:996

   procedure glPixelStoref
     (pname : GLenum;
      param : GLfloat);                            --  gl.h:997

   procedure glPixelStorei
     (pname : GLenum;
      param : GLint);                              --  gl.h:998

   procedure glPixelTransferf
     (pname : GLenum;
      param : GLfloat);                            --  gl.h:999

   procedure glPixelTransferi
     (pname : GLenum;
      param : GLint);                              --  gl.h:1000

   procedure glPixelZoom
     (xfactor : GLfloat;
      yfactor : GLfloat);                          --  gl.h:1001

   procedure glPointSize
     (size : GLfloat);                             --  gl.h:1002

   procedure glPolygonMode
     (face : GLenum;
      mode : GLenum);                              --  gl.h:1003

   procedure glPolygonStipple
     (mask : Win32.PCBYTE);                        --  gl.h:1004

   procedure glPopAttrib;                                  --  gl.h:1005

   procedure glPopMatrix;                                  --  gl.h:1006

   procedure glPopName;                                    --  gl.h:1007

   procedure glPushAttrib
     (mask : GLbitfield);                          --  gl.h:1008

   procedure glPushMatrix;                                 --  gl.h:1009

   procedure glPushName
     (name : GLuint);                              --  gl.h:1010

   procedure glRasterPos2d
     (x : GLdouble;
      y : GLdouble);                               --  gl.h:1011

   procedure glRasterPos2dv
     (v : ac_GLdouble);                            --  gl.h:1012

   procedure glRasterPos2f
     (x : GLfloat;
      y : GLfloat);                                --  gl.h:1013

   procedure glRasterPos2fv
     (v : ac_GLfloat);                             --  gl.h:1014

   procedure glRasterPos2i
     (x : GLint;
      y : GLint);                                  --  gl.h:1015

   procedure glRasterPos2iv
     (v : ac_GLint);                               --  gl.h:1016

   procedure glRasterPos2s
     (x : GLshort;
      y : GLshort);                                --  gl.h:1017

   procedure glRasterPos2sv
     (v : ac_GLshort);                             --  gl.h:1018

   procedure glRasterPos3d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble);                               --  gl.h:1019

   procedure glRasterPos3dv
     (v : ac_GLdouble);                            --  gl.h:1020

   procedure glRasterPos3f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat);                                --  gl.h:1021

   procedure glRasterPos3fv
     (v : ac_GLfloat);                             --  gl.h:1022

   procedure glRasterPos3i
     (x : GLint;
      y : GLint;
      z : GLint);                                  --  gl.h:1023

   procedure glRasterPos3iv
     (v : ac_GLint);                               --  gl.h:1024

   procedure glRasterPos3s
     (x : GLshort;
      y : GLshort;
      z : GLshort);                                --  gl.h:1025

   procedure glRasterPos3sv
     (v : ac_GLshort);                             --  gl.h:1026

   procedure glRasterPos4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble);                               --  gl.h:1027

   procedure glRasterPos4dv
     (v : ac_GLdouble);                            --  gl.h:1028

   procedure glRasterPos4f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat;
      w : GLfloat);                                --  gl.h:1029

   procedure glRasterPos4fv
     (v : ac_GLfloat);                             --  gl.h:1030

   procedure glRasterPos4i
     (x : GLint;
      y : GLint;
      z : GLint;
      w : GLint);                                  --  gl.h:1031

   procedure glRasterPos4iv
     (v : ac_GLint);                               --  gl.h:1032

   procedure glRasterPos4s
     (x : GLshort;
      y : GLshort;
      z : GLshort;
      w : GLshort);                                --  gl.h:1033

   procedure glRasterPos4sv
     (v : ac_GLshort);                             --  gl.h:1034

   procedure glReadBuffer
     (mode : GLenum);                              --  gl.h:1035

   procedure glReadPixels
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : PGLvoid);                           --  gl.h:1036

   procedure glRectd
     (x1 : GLdouble;
      y1 : GLdouble;
      x2 : GLdouble;
      y2 : GLdouble);                              --  gl.h:1037

   procedure glRectdv
     (v1 : ac_GLdouble;
      v2 : ac_GLdouble);                           --  gl.h:1038

   procedure glRectf
     (x1 : GLfloat;
      y1 : GLfloat;
      x2 : GLfloat;
      y2 : GLfloat);                               --  gl.h:1039

   procedure glRectfv
     (v1 : ac_GLfloat;
      v2 : ac_GLfloat);                            --  gl.h:1040

   procedure glRecti
     (x1 : GLint;
      y1 : GLint;
      x2 : GLint;
      y2 : GLint);                                 --  gl.h:1041

   procedure glRectiv
     (v1 : ac_GLint;
      v2 : ac_GLint);                              --  gl.h:1042

   procedure glRects
     (x1 : GLshort;
      y1 : GLshort;
      x2 : GLshort;
      y2 : GLshort);                               --  gl.h:1043

   procedure glRectsv
     (v1 : ac_GLshort;
      v2 : ac_GLshort);                            --  gl.h:1044

   function glRenderMode
     (mode : GLenum)
     return GLint;                                --  gl.h:1045

   procedure glRotated
     (angle : GLdouble;
      x : GLdouble;
      y : GLdouble;
      z : GLdouble);                           --  gl.h:1046

   procedure glRotatef
     (angle : GLfloat;
      x : GLfloat;
      y : GLfloat;
      z : GLfloat);                            --  gl.h:1047

   procedure glScaled
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble);                               --  gl.h:1048

   procedure glScalef
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat);                                --  gl.h:1049

   procedure glScissor
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei);                           --  gl.h:1050

   procedure glSelectBuffer
     (size : GLsizei;
      buffer : access GLuint);                     --  gl.h:1051

   procedure glShadeModel
     (mode : GLenum);                              --  gl.h:1052

   procedure glStencilFunc
     (func : GLenum;
      ref : GLint;
      mask : GLuint);                              --  gl.h:1053

   procedure glStencilMask
     (mask : GLuint);                              --  gl.h:1054

   procedure glStencilOp
     (fail : GLenum;
      zfail : GLenum;
      zpass : GLenum);                             --  gl.h:1055

   procedure glTexCoord1d
     (s : GLdouble);                               --  gl.h:1056

   procedure glTexCoord1dv
     (v : ac_GLdouble);                            --  gl.h:1057

   procedure glTexCoord1f
     (s : GLfloat);                                --  gl.h:1058

   procedure glTexCoord1fv
     (v : ac_GLfloat);                             --  gl.h:1059

   procedure glTexCoord1i
     (s : GLint);                                  --  gl.h:1060

   procedure glTexCoord1iv
     (v : ac_GLint);                               --  gl.h:1061

   procedure glTexCoord1s
     (s : GLshort);                                --  gl.h:1062

   procedure glTexCoord1sv
     (v : ac_GLshort);                             --  gl.h:1063

   procedure glTexCoord2d
     (s : GLdouble;
      t : GLdouble);                               --  gl.h:1064

   procedure glTexCoord2dv
     (v : ac_GLdouble);                            --  gl.h:1065

   procedure glTexCoord2f
     (s : GLfloat;
      t : GLfloat);                                --  gl.h:1066

   procedure glTexCoord2fv
     (v : ac_GLfloat);                             --  gl.h:1067

   procedure glTexCoord2i
     (s : GLint;
      t : GLint);                                  --  gl.h:1068

   procedure glTexCoord2iv
     (v : ac_GLint);                               --  gl.h:1069

   procedure glTexCoord2s
     (s : GLshort;
      t : GLshort);                                --  gl.h:1070

   procedure glTexCoord2sv
     (v : ac_GLshort);                             --  gl.h:1071

   procedure glTexCoord3d
     (s : GLdouble;
      t : GLdouble;
      r : GLdouble);                               --  gl.h:1072

   procedure glTexCoord3dv
     (v : ac_GLdouble);                            --  gl.h:1073

   procedure glTexCoord3f
     (s : GLfloat;
      t : GLfloat;
      r : GLfloat);                                --  gl.h:1074

   procedure glTexCoord3fv
     (v : ac_GLfloat);                             --  gl.h:1075

   procedure glTexCoord3i
     (s : GLint;
      t : GLint;
      r : GLint);                                  --  gl.h:1076

   procedure glTexCoord3iv
     (v : ac_GLint);                               --  gl.h:1077

   procedure glTexCoord3s
     (s : GLshort;
      t : GLshort;
      r : GLshort);                                --  gl.h:1078

   procedure glTexCoord3sv
     (v : ac_GLshort);                             --  gl.h:1079

   procedure glTexCoord4d
     (s : GLdouble;
      t : GLdouble;
      r : GLdouble;
      q : GLdouble);                               --  gl.h:1080

   procedure glTexCoord4dv
     (v : ac_GLdouble);                            --  gl.h:1081

   procedure glTexCoord4f
     (s : GLfloat;
      t : GLfloat;
      r : GLfloat;
      q : GLfloat);                                --  gl.h:1082

   procedure glTexCoord4fv
     (v : ac_GLfloat);                             --  gl.h:1083

   procedure glTexCoord4i
     (s : GLint;
      t : GLint;
      r : GLint;
      q : GLint);                                  --  gl.h:1084

   procedure glTexCoord4iv
     (v : ac_GLint);                               --  gl.h:1085

   procedure glTexCoord4s
     (s : GLshort;
      t : GLshort;
      r : GLshort;
      q : GLshort);                                --  gl.h:1086

   procedure glTexCoord4sv
     (v : ac_GLshort);                             --  gl.h:1087

   procedure glTexEnvf
     (target : GLenum;
      pname : GLenum;
      param : GLfloat);                           --  gl.h:1088

   procedure glTexEnvfv
     (target : GLenum;
      pname : GLenum;
      params : ac_GLfloat);                        --  gl.h:1089

   procedure glTexEnvi
     (target : GLenum;
      pname : GLenum;
      param : GLint);                             --  gl.h:1090

   procedure glTexEnviv
     (target : GLenum;
      pname : GLenum;
      params : ac_GLint);                          --  gl.h:1091

   procedure glTexGend
     (coord : GLenum;
      pname : GLenum;
      param : GLdouble);                           --  gl.h:1092

   procedure glTexGendv
     (coord : GLenum;
      pname : GLenum;
      params : ac_GLdouble);                       --  gl.h:1093

   procedure glTexGenf
     (coord : GLenum;
      pname : GLenum;
      param : GLfloat);                            --  gl.h:1094

   procedure glTexGenfv
     (coord : GLenum;
      pname : GLenum;
      params : ac_GLfloat);                        --  gl.h:1095

   procedure glTexGeni
     (coord : GLenum;
      pname : GLenum;
      param : GLint);                              --  gl.h:1096

   procedure glTexGeniv
     (coord : GLenum;
      pname : GLenum;
      params : ac_GLint);                          --  gl.h:1097

   procedure glTexImage1D
     (target : GLenum;
      level : GLint;
      components : GLint;
      width : GLsizei;
      border : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : Win32.PCVOID);                  --  gl.h:1098

   procedure glTexImage2D
     (target : GLenum;
      level : GLint;
      components : GLint;
      width : GLsizei;
      height : GLsizei;
      border : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : Win32.PCVOID);                  --  gl.h:1099

   procedure glTexParameterf
     (target : GLenum;
      pname : GLenum;
      param : GLfloat);                           --  gl.h:1100

   procedure glTexParameterfv
     (target : GLenum;
      pname : GLenum;
      params : ac_GLfloat);                        --  gl.h:1101

   procedure glTexParameteri
     (target : GLenum;
      pname : GLenum;
      param : GLint);                             --  gl.h:1102

   procedure glTexParameteriv
     (target : GLenum;
      pname : GLenum;
      params : ac_GLint);                          --  gl.h:1103

   procedure glTranslated
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble);                               --  gl.h:1104

   procedure glTranslatef
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat);                                --  gl.h:1105

   procedure glVertex2d
     (x : GLdouble;
      y : GLdouble);                               --  gl.h:1106

   procedure glVertex2dv
     (v : ac_GLdouble);                            --  gl.h:1107

   procedure glVertex2f
     (x : GLfloat;
      y : GLfloat);                                --  gl.h:1108

   procedure glVertex2fv
     (v : ac_GLfloat);                             --  gl.h:1109

   procedure glVertex2i
     (x : GLint;
      y : GLint);                                  --  gl.h:1110

   procedure glVertex2iv
     (v : ac_GLint);                               --  gl.h:1111

   procedure glVertex2s
     (x : GLshort;
      y : GLshort);                                --  gl.h:1112

   procedure glVertex2sv
     (v : ac_GLshort);                             --  gl.h:1113

   procedure glVertex3d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble);                               --  gl.h:1114

   procedure glVertex3dv
     (v : ac_GLdouble);                            --  gl.h:1115

   procedure glVertex3f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat);                                --  gl.h:1116

   procedure glVertex3fv
     (v : ac_GLfloat);                             --  gl.h:1117

   procedure glVertex3i
     (x : GLint;
      y : GLint;
      z : GLint);                                  --  gl.h:1118

   procedure glVertex3iv
     (v : ac_GLint);                               --  gl.h:1119

   procedure glVertex3s
     (x : GLshort;
      y : GLshort;
      z : GLshort);                                --  gl.h:1120

   procedure glVertex3sv
     (v : ac_GLshort);                             --  gl.h:1121

   procedure glVertex4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble);                               --  gl.h:1122

   procedure glVertex4dv
     (v : ac_GLdouble);                            --  gl.h:1123

   procedure glVertex4f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat;
      w : GLfloat);                                --  gl.h:1124

   procedure glVertex4fv
     (v : ac_GLfloat);                             --  gl.h:1125

   procedure glVertex4i
     (x : GLint;
      y : GLint;
      z : GLint;
      w : GLint);                                  --  gl.h:1126

   procedure glVertex4iv
     (v : ac_GLint);                               --  gl.h:1127

   procedure glVertex4s
     (x : GLshort;
      y : GLshort;
      z : GLshort;
      w : GLshort);                                --  gl.h:1128

   procedure glVertex4sv
     (v : ac_GLshort);                             --  gl.h:1129

   procedure glViewport
     (x : GLint;
      y : GLint;
      width : GLsizei;
      height : GLsizei);                           --  gl.h:1130

private

   pragma Import (Stdcall, glAccum, "glAccum");                   --  gl.h:825
   pragma Import (Stdcall, glAlphaFunc, "glAlphaFunc");           --  gl.h:826
   pragma Import (Stdcall, glBegin, "glBegin");                   --  gl.h:827
   pragma Import (Stdcall, glBindTexture, "glBindTexture");       --  new
   pragma Import (Stdcall, glBitmap, "glBitmap");                 --  gl.h:828
   pragma Import (Stdcall, glBlendFunc, "glBlendFunc");           --  gl.h:829
   pragma Import (Stdcall, glCallList, "glCallList");             --  gl.h:830
   pragma Import (Stdcall, glCallLists, "glCallLists");           --  gl.h:831
   pragma Import (Stdcall, glClear, "glClear");                   --  gl.h:832
   pragma Import (Stdcall, glClearAccum, "glClearAccum");         --  gl.h:833
   pragma Import (Stdcall, glClearColor, "glClearColor");         --  gl.h:834
   pragma Import (Stdcall, glClearDepth, "glClearDepth");         --  gl.h:835
   pragma Import (Stdcall, glClearIndex, "glClearIndex");         --  gl.h:836
   pragma Import (Stdcall, glClearStencil, "glClearStencil");     --  gl.h:837
   pragma Import (Stdcall, glClipPlane, "glClipPlane");           --  gl.h:838
   pragma Import (Stdcall, glColor3b, "glColor3b");               --  gl.h:839
   pragma Import (Stdcall, glColor3bv, "glColor3bv");             --  gl.h:840
   pragma Import (Stdcall, glColor3d, "glColor3d");               --  gl.h:841
   pragma Import (Stdcall, glColor3dv, "glColor3dv");             --  gl.h:842
   pragma Import (Stdcall, glColor3f, "glColor3f");               --  gl.h:843
   pragma Import (Stdcall, glColor3fv, "glColor3fv");             --  gl.h:844
   pragma Import (Stdcall, glColor3i, "glColor3i");               --  gl.h:845
   pragma Import (Stdcall, glColor3iv, "glColor3iv");             --  gl.h:846
   pragma Import (Stdcall, glColor3s, "glColor3s");               --  gl.h:847
   pragma Import (Stdcall, glColor3sv, "glColor3sv");             --  gl.h:848
   pragma Import (Stdcall, glColor3ub, "glColor3ub");             --  gl.h:849
   pragma Import (Stdcall, glColor3ubv, "glColor3ubv");           --  gl.h:850
   pragma Import (Stdcall, glColor3ui, "glColor3ui");             --  gl.h:851
   pragma Import (Stdcall, glColor3uiv, "glColor3uiv");           --  gl.h:852
   pragma Import (Stdcall, glColor3us, "glColor3us");             --  gl.h:853
   pragma Import (Stdcall, glColor3usv, "glColor3usv");           --  gl.h:854
   pragma Import (Stdcall, glColor4b, "glColor4b");               --  gl.h:855
   pragma Import (Stdcall, glColor4bv, "glColor4bv");             --  gl.h:856
   pragma Import (Stdcall, glColor4d, "glColor4d");               --  gl.h:857
   pragma Import (Stdcall, glColor4dv, "glColor4dv");             --  gl.h:858
   pragma Import (Stdcall, glColor4f, "glColor4f");               --  gl.h:859
   pragma Import (Stdcall, glColor4fv, "glColor4fv");             --  gl.h:860
   pragma Import (Stdcall, glColor4i, "glColor4i");               --  gl.h:861
   pragma Import (Stdcall, glColor4iv, "glColor4iv");             --  gl.h:862
   pragma Import (Stdcall, glColor4s, "glColor4s");               --  gl.h:863
   pragma Import (Stdcall, glColor4sv, "glColor4sv");             --  gl.h:864
   pragma Import (Stdcall, glColor4ub, "glColor4ub");             --  gl.h:865
   pragma Import (Stdcall, glColor4ubv, "glColor4ubv");           --  gl.h:866
   pragma Import (Stdcall, glColor4ui, "glColor4ui");             --  gl.h:867
   pragma Import (Stdcall, glColor4uiv, "glColor4uiv");           --  gl.h:868
   pragma Import (Stdcall, glColor4us, "glColor4us");             --  gl.h:869
   pragma Import (Stdcall, glColor4usv, "glColor4usv");           --  gl.h:870
   pragma Import (Stdcall, glColorMask, "glColorMask");           --  gl.h:871
   pragma Import (Stdcall, glColorMaterial, "glColorMaterial");   --  gl.h:872
   pragma Import (Stdcall, glCopyPixels, "glCopyPixels");         --  gl.h:873
   pragma Import (Stdcall, glCullFace, "glCullFace");             --  gl.h:874
   pragma Import (Stdcall, glDeleteLists, "glDeleteLists");       --  gl.h:875
   pragma Import (Stdcall, glDepthFunc, "glDepthFunc");           --  gl.h:876
   pragma Import (Stdcall, glDepthMask, "glDepthMask");           --  gl.h:877
   pragma Import (Stdcall, glDepthRange, "glDepthRange");         --  gl.h:878
   pragma Import (Stdcall, glDisable, "glDisable");               --  gl.h:879
   pragma Import (Stdcall, glDrawBuffer, "glDrawBuffer");         --  gl.h:880
   pragma Import (Stdcall, glDrawPixels, "glDrawPixels");         --  gl.h:881
   pragma Import (Stdcall, glEdgeFlag, "glEdgeFlag");             --  gl.h:882
   pragma Import (Stdcall, glEdgeFlagv, "glEdgeFlagv");           --  gl.h:883
   pragma Import (Stdcall, glEnable, "glEnable");                 --  gl.h:884
   pragma Import (Stdcall, glEnd, "glEnd");                       --  gl.h:885
   pragma Import (Stdcall, glEndList, "glEndList");               --  gl.h:886
   pragma Import (Stdcall, glEvalCoord1d, "glEvalCoord1d");       --  gl.h:887
   pragma Import (Stdcall, glEvalCoord1dv, "glEvalCoord1dv");     --  gl.h:888
   pragma Import (Stdcall, glEvalCoord1f, "glEvalCoord1f");       --  gl.h:889
   pragma Import (Stdcall, glEvalCoord1fv, "glEvalCoord1fv");     --  gl.h:890
   pragma Import (Stdcall, glEvalCoord2d, "glEvalCoord2d");       --  gl.h:891
   pragma Import (Stdcall, glEvalCoord2dv, "glEvalCoord2dv");     --  gl.h:892
   pragma Import (Stdcall, glEvalCoord2f, "glEvalCoord2f");       --  gl.h:893
   pragma Import (Stdcall, glEvalCoord2fv, "glEvalCoord2fv");     --  gl.h:894
   pragma Import (Stdcall, glEvalMesh1, "glEvalMesh1");           --  gl.h:895
   pragma Import (Stdcall, glEvalMesh2, "glEvalMesh2");           --  gl.h:896
   pragma Import (Stdcall, glEvalPoint1, "glEvalPoint1");         --  gl.h:897
   pragma Import (Stdcall, glEvalPoint2, "glEvalPoint2");         --  gl.h:898
   pragma Import (Stdcall, glFeedbackBuffer, "glFeedbackBuffer"); --  gl.h:899
   pragma Import (Stdcall, glFinish, "glFinish");                 --  gl.h:900
   pragma Import (Stdcall, glFlush, "glFlush");                   --  gl.h:901
   pragma Import (Stdcall, glFogf, "glFogf");                     --  gl.h:902
   pragma Import (Stdcall, glFogfv, "glFogfv");                   --  gl.h:903
   pragma Import (Stdcall, glFogi, "glFogi");                     --  gl.h:904
   pragma Import (Stdcall, glFogiv, "glFogiv");                   --  gl.h:905
   pragma Import (Stdcall, glFrontFace, "glFrontFace");           --  gl.h:906
   pragma Import (Stdcall, glFrustum, "glFrustum");               --  gl.h:907
   pragma Import (Stdcall, glGenLists, "glGenLists");             --  gl.h:908
   pragma Import (Stdcall, glGetBooleanv, "glGetBooleanv");       --  gl.h:909
   pragma Import (Stdcall, glGetClipPlane, "glGetClipPlane");     --  gl.h:910
   pragma Import (Stdcall, glGetDoublev, "glGetDoublev");         --  gl.h:911
   pragma Import (Stdcall, glGetError, "glGetError");             --  gl.h:912
   pragma Import (Stdcall, glGetFloatv, "glGetFloatv");           --  gl.h:913
   pragma Import (Stdcall, glGetIntegerv, "glGetIntegerv");       --  gl.h:914
   pragma Import (Stdcall, glGetLightfv, "glGetLightfv");         --  gl.h:915
   pragma Import (Stdcall, glGetLightiv, "glGetLightiv");         --  gl.h:916
   pragma Import (Stdcall, glGetMapdv, "glGetMapdv");             --  gl.h:917
   pragma Import (Stdcall, glGetMapfv, "glGetMapfv");             --  gl.h:918
   pragma Import (Stdcall, glGetMapiv, "glGetMapiv");             --  gl.h:919
   pragma Import (Stdcall, glGetMaterialfv, "glGetMaterialfv");   --  gl.h:920
   pragma Import (Stdcall, glGetMaterialiv, "glGetMaterialiv");   --  gl.h:921
   pragma Import (Stdcall, glGetPixelMapfv, "glGetPixelMapfv");   --  gl.h:922
   pragma Import (Stdcall, glGetPixelMapuiv, "glGetPixelMapuiv"); --  gl.h:923
   pragma Import (Stdcall, glGetPixelMapusv, "glGetPixelMapusv"); --  gl.h:924
   pragma Import (Stdcall, GlGetPolygonStipple, "glGetPolygonStipple");
   --  gl.h:925
   pragma Import (Stdcall, glGetString, "glGetString");           --  gl.h:926
   pragma Import (Stdcall, glGetTexEnvfv, "glGetTexEnvfv");       --  gl.h:927
   pragma Import (Stdcall, glGetTexEnviv, "glGetTexEnviv");       --  gl.h:928
   pragma Import (Stdcall, glGetTexGendv, "glGetTexGendv");       --  gl.h:929
   pragma Import (Stdcall, glGetTexGenfv, "glGetTexGenfv");       --  gl.h:930
   pragma Import (Stdcall, glGetTexGeniv, "glGetTexGeniv");       --  gl.h:931
   pragma Import (Stdcall, glGetTexImage, "glGetTexImage");       --  gl.h:932
   pragma Import (Stdcall, glGetTexLevelParameterfv,
                    "glGetTexLevelParameterfv");
   --  gl.h:933
   pragma Import (Stdcall, glGetTexLevelParameteriv,
                    "glGetTexLevelParameteriv");
   --  gl.h:934
   pragma Import (Stdcall, glGetTexParameterfv, "glGetTexParameterfv");
   --  gl.h:935
   pragma Import (Stdcall, glGetTexParameteriv, "glGetTexParameteriv");
   --  gl.h:936
   pragma Import (Stdcall, glHint, "glHint");                     --  gl.h:937
   pragma Import (Stdcall, glIndexMask, "glIndexMask");           --  gl.h:938
   pragma Import (Stdcall, glIndexd, "glIndexd");                 --  gl.h:939
   pragma Import (Stdcall, glIndexdv, "glIndexdv");               --  gl.h:940
   pragma Import (Stdcall, glIndexf, "glIndexf");                 --  gl.h:941
   pragma Import (Stdcall, glIndexfv, "glIndexfv");               --  gl.h:942
   pragma Import (Stdcall, glIndexi, "glIndexi");                 --  gl.h:943
   pragma Import (Stdcall, glIndexiv, "glIndexiv");               --  gl.h:944
   pragma Import (Stdcall, glIndexs, "glIndexs");                 --  gl.h:945
   pragma Import (Stdcall, glIndexsv, "glIndexsv");               --  gl.h:946
   pragma Import (Stdcall, glInitNames, "glInitNames");           --  gl.h:947
   pragma Import (Stdcall, glIsEnabled, "glIsEnabled");           --  gl.h:948
   pragma Import (Stdcall, glIsList, "glIsList");                 --  gl.h:949
   pragma Import (Stdcall, glLightModelf, "glLightModelf");       --  gl.h:950
   pragma Import (Stdcall, glLightModelfv, "glLightModelfv");     --  gl.h:951
   pragma Import (Stdcall, glLightModeli, "glLightModeli");       --  gl.h:952
   pragma Import (Stdcall, glLightModeliv, "glLightModeliv");     --  gl.h:953
   pragma Import (Stdcall, glLightf, "glLightf");                 --  gl.h:954
   pragma Import (Stdcall, glLightfv, "glLightfv");               --  gl.h:955
   pragma Import (Stdcall, glLighti, "glLighti");                 --  gl.h:956
   pragma Import (Stdcall, glLightiv, "glLightiv");               --  gl.h:957
   pragma Import (Stdcall, glLineStipple, "glLineStipple");       --  gl.h:958
   pragma Import (Stdcall, glLineWidth, "glLineWidth");           --  gl.h:959
   pragma Import (Stdcall, glListBase, "glListBase");             --  gl.h:960
   pragma Import (Stdcall, glLoadIdentity, "glLoadIdentity");     --  gl.h:961
   pragma Import (Stdcall, glLoadMatrixd, "glLoadMatrixd");       --  gl.h:962
   pragma Import (Stdcall, glLoadMatrixf, "glLoadMatrixf");       --  gl.h:963
   pragma Import (Stdcall, glLoadName, "glLoadName");             --  gl.h:964
   pragma Import (Stdcall, glLogicOp, "glLogicOp");               --  gl.h:965
   pragma Import (Stdcall, glMap1d, "glMap1d");                   --  gl.h:966
   pragma Import (Stdcall, glMap1f, "glMap1f");                   --  gl.h:967
   pragma Import (Stdcall, glMap2d, "glMap2d");                   --  gl.h:968
   pragma Import (Stdcall, glMap2f, "glMap2f");                   --  gl.h:969
   pragma Import (Stdcall, glMapGrid1d, "glMapGrid1d");           --  gl.h:970
   pragma Import (Stdcall, glMapGrid1f, "glMapGrid1f");           --  gl.h:971
   pragma Import (Stdcall, glMapGrid2d, "glMapGrid2d");           --  gl.h:972
   pragma Import (Stdcall, glMapGrid2f, "glMapGrid2f");           --  gl.h:973
   pragma Import (Stdcall, glMaterialf, "glMaterialf");           --  gl.h:974
   pragma Import (Stdcall, glMaterialfv, "glMaterialfv");         --  gl.h:975
   pragma Import (Stdcall, glMateriali, "glMateriali");           --  gl.h:976
   pragma Import (Stdcall, glMaterialiv, "glMaterialiv");         --  gl.h:977
   pragma Import (Stdcall, glMatrixMode, "glMatrixMode");         --  gl.h:978
   pragma Import (Stdcall, glMultMatrixd, "glMultMatrixd");       --  gl.h:979
   pragma Import (Stdcall, glMultMatrixf, "glMultMatrixf");       --  gl.h:980
   pragma Import (Stdcall, glNewList, "glNewList");               --  gl.h:981
   pragma Import (Stdcall, glNormal3b, "glNormal3b");             --  gl.h:982
   pragma Import (Stdcall, glNormal3bv, "glNormal3bv");           --  gl.h:983
   pragma Import (Stdcall, glNormal3d, "glNormal3d");             --  gl.h:984
   pragma Import (Stdcall, glNormal3dv, "glNormal3dv");           --  gl.h:985
   pragma Import (Stdcall, glNormal3f, "glNormal3f");             --  gl.h:986
   pragma Import (Stdcall, glNormal3fv, "glNormal3fv");           --  gl.h:987
   pragma Import (Stdcall, glNormal3i, "glNormal3i");             --  gl.h:988
   pragma Import (Stdcall, glNormal3iv, "glNormal3iv");           --  gl.h:989
   pragma Import (Stdcall, glNormal3s, "glNormal3s");             --  gl.h:990
   pragma Import (Stdcall, glNormal3sv, "glNormal3sv");           --  gl.h:991
   pragma Import (Stdcall, glOrtho, "glOrtho");                   --  gl.h:992
   pragma Import (Stdcall, glPassThrough, "glPassThrough");       --  gl.h:993
   pragma Import (Stdcall, glPixelMapfv, "glPixelMapfv");         --  gl.h:994
   pragma Import (Stdcall, glPixelMapuiv, "glPixelMapuiv");       --  gl.h:995
   pragma Import (Stdcall, glPixelMapusv, "glPixelMapusv");       --  gl.h:996
   pragma Import (Stdcall, glPixelStoref, "glPixelStoref");       --  gl.h:997
   pragma Import (Stdcall, glPixelStorei, "glPixelStorei");       --  gl.h:998
   pragma Import (Stdcall, glPixelTransferf, "glPixelTransferf"); --  gl.h:999
   pragma Import (Stdcall, glPixelTransferi, "glPixelTransferi"); --  gl.h:1000
   pragma Import (Stdcall, glPixelZoom, "glPixelZoom");           --  gl.h:1001
   pragma Import (Stdcall, glPointSize, "glPointSize");           --  gl.h:1002
   pragma Import (Stdcall, glPolygonMode, "glPolygonMode");       --  gl.h:1003
   pragma Import (Stdcall, glPolygonStipple, "glPolygonStipple"); --  gl.h:1004
   pragma Import (Stdcall, glPopAttrib, "glPopAttrib");           --  gl.h:1005
   pragma Import (Stdcall, glPopMatrix, "glPopMatrix");           --  gl.h:1006
   pragma Import (Stdcall, glPopName, "glPopName");               --  gl.h:1007
   pragma Import (Stdcall, glPushAttrib, "glPushAttrib");         --  gl.h:1008
   pragma Import (Stdcall, glPushMatrix, "glPushMatrix");         --  gl.h:1009
   pragma Import (Stdcall, glPushName, "glPushName");             --  gl.h:1010
   pragma Import (Stdcall, glRasterPos2d, "glRasterPos2d");       --  gl.h:1011
   pragma Import (Stdcall, glRasterPos2dv, "glRasterPos2dv");     --  gl.h:1012
   pragma Import (Stdcall, glRasterPos2f, "glRasterPos2f");       --  gl.h:1013
   pragma Import (Stdcall, glRasterPos2fv, "glRasterPos2fv");     --  gl.h:1014
   pragma Import (Stdcall, glRasterPos2i, "glRasterPos2i");       --  gl.h:1015
   pragma Import (Stdcall, glRasterPos2iv, "glRasterPos2iv");     --  gl.h:1016
   pragma Import (Stdcall, glRasterPos2s, "glRasterPos2s");       --  gl.h:1017
   pragma Import (Stdcall, glRasterPos2sv, "glRasterPos2sv");     --  gl.h:1018
   pragma Import (Stdcall, glRasterPos3d, "glRasterPos3d");       --  gl.h:1019
   pragma Import (Stdcall, glRasterPos3dv, "glRasterPos3dv");     --  gl.h:1020
   pragma Import (Stdcall, glRasterPos3f, "glRasterPos3f");       --  gl.h:1021
   pragma Import (Stdcall, glRasterPos3fv, "glRasterPos3fv");     --  gl.h:1022
   pragma Import (Stdcall, glRasterPos3i, "glRasterPos3i");       --  gl.h:1023
   pragma Import (Stdcall, glRasterPos3iv, "glRasterPos3iv");     --  gl.h:1024
   pragma Import (Stdcall, glRasterPos3s, "glRasterPos3s");       --  gl.h:1025
   pragma Import (Stdcall, glRasterPos3sv, "glRasterPos3sv");     --  gl.h:1026
   pragma Import (Stdcall, glRasterPos4d, "glRasterPos4d");       --  gl.h:1027
   pragma Import (Stdcall, glRasterPos4dv, "glRasterPos4dv");     --  gl.h:1028
   pragma Import (Stdcall, glRasterPos4f, "glRasterPos4f");       --  gl.h:1029
   pragma Import (Stdcall, glRasterPos4fv, "glRasterPos4fv");     --  gl.h:1030
   pragma Import (Stdcall, glRasterPos4i, "glRasterPos4i");       --  gl.h:1031
   pragma Import (Stdcall, glRasterPos4iv, "glRasterPos4iv");     --  gl.h:1032
   pragma Import (Stdcall, glRasterPos4s, "glRasterPos4s");       --  gl.h:1033
   pragma Import (Stdcall, glRasterPos4sv, "glRasterPos4sv");     --  gl.h:1034
   pragma Import (Stdcall, glReadBuffer, "glReadBuffer");         --  gl.h:1035
   pragma Import (Stdcall, glReadPixels, "glReadPixels");         --  gl.h:1036
   pragma Import (Stdcall, glRectd, "glRectd");                   --  gl.h:1037
   pragma Import (Stdcall, glRectdv, "glRectdv");                 --  gl.h:1038
   pragma Import (Stdcall, glRectf, "glRectf");                   --  gl.h:1039
   pragma Import (Stdcall, glRectfv, "glRectfv");                 --  gl.h:1040
   pragma Import (Stdcall, glRecti, "glRecti");                   --  gl.h:1041
   pragma Import (Stdcall, glRectiv, "glRectiv");                 --  gl.h:1042
   pragma Import (Stdcall, glRects, "glRects");                   --  gl.h:1043
   pragma Import (Stdcall, glRectsv, "glRectsv");                 --  gl.h:1044
   pragma Import (Stdcall, glRenderMode, "glRenderMode");         --  gl.h:1045
   pragma Import (Stdcall, glRotated, "glRotated");               --  gl.h:1046
   pragma Import (Stdcall, glRotatef, "glRotatef");               --  gl.h:1047
   pragma Import (Stdcall, glScaled, "glScaled");                 --  gl.h:1048
   pragma Import (Stdcall, glScalef, "glScalef");                 --  gl.h:1049
   pragma Import (Stdcall, glScissor, "glScissor");               --  gl.h:1050
   pragma Import (Stdcall, glSelectBuffer, "glSelectBuffer");     --  gl.h:1051
   pragma Import (Stdcall, glShadeModel, "glShadeModel");         --  gl.h:1052
   pragma Import (Stdcall, glStencilFunc, "glStencilFunc");       --  gl.h:1053
   pragma Import (Stdcall, glStencilMask, "glStencilMask");       --  gl.h:1054
   pragma Import (Stdcall, glStencilOp, "glStencilOp");           --  gl.h:1055
   pragma Import (Stdcall, glTexCoord1d, "glTexCoord1d");         --  gl.h:1056
   pragma Import (Stdcall, glTexCoord1dv, "glTexCoord1dv");       --  gl.h:1057
   pragma Import (Stdcall, glTexCoord1f, "glTexCoord1f");         --  gl.h:1058
   pragma Import (Stdcall, glTexCoord1fv, "glTexCoord1fv");       --  gl.h:1059
   pragma Import (Stdcall, glTexCoord1i, "glTexCoord1i");         --  gl.h:1060
   pragma Import (Stdcall, glTexCoord1iv, "glTexCoord1iv");       --  gl.h:1061
   pragma Import (Stdcall, glTexCoord1s, "glTexCoord1s");         --  gl.h:1062
   pragma Import (Stdcall, glTexCoord1sv, "glTexCoord1sv");       --  gl.h:1063
   pragma Import (Stdcall, glTexCoord2d, "glTexCoord2d");         --  gl.h:1064
   pragma Import (Stdcall, glTexCoord2dv, "glTexCoord2dv");       --  gl.h:1065
   pragma Import (Stdcall, glTexCoord2f, "glTexCoord2f");         --  gl.h:1066
   pragma Import (Stdcall, glTexCoord2fv, "glTexCoord2fv");       --  gl.h:1067
   pragma Import (Stdcall, glTexCoord2i, "glTexCoord2i");         --  gl.h:1068
   pragma Import (Stdcall, glTexCoord2iv, "glTexCoord2iv");       --  gl.h:1069
   pragma Import (Stdcall, glTexCoord2s, "glTexCoord2s");         --  gl.h:1070
   pragma Import (Stdcall, glTexCoord2sv, "glTexCoord2sv");       --  gl.h:1071
   pragma Import (Stdcall, glTexCoord3d, "glTexCoord3d");         --  gl.h:1072
   pragma Import (Stdcall, glTexCoord3dv, "glTexCoord3dv");       --  gl.h:1073
   pragma Import (Stdcall, glTexCoord3f, "glTexCoord3f");         --  gl.h:1074
   pragma Import (Stdcall, glTexCoord3fv, "glTexCoord3fv");       --  gl.h:1075
   pragma Import (Stdcall, glTexCoord3i, "glTexCoord3i");         --  gl.h:1076
   pragma Import (Stdcall, glTexCoord3iv, "glTexCoord3iv");       --  gl.h:1077
   pragma Import (Stdcall, glTexCoord3s, "glTexCoord3s");         --  gl.h:1078
   pragma Import (Stdcall, glTexCoord3sv, "glTexCoord3sv");       --  gl.h:1079
   pragma Import (Stdcall, glTexCoord4d, "glTexCoord4d");         --  gl.h:1080
   pragma Import (Stdcall, glTexCoord4dv, "glTexCoord4dv");       --  gl.h:1081
   pragma Import (Stdcall, glTexCoord4f, "glTexCoord4f");         --  gl.h:1082
   pragma Import (Stdcall, glTexCoord4fv, "glTexCoord4fv");       --  gl.h:1083
   pragma Import (Stdcall, glTexCoord4i, "glTexCoord4i");         --  gl.h:1084
   pragma Import (Stdcall, glTexCoord4iv, "glTexCoord4iv");       --  gl.h:1085
   pragma Import (Stdcall, glTexCoord4s, "glTexCoord4s");         --  gl.h:1086
   pragma Import (Stdcall, glTexCoord4sv, "glTexCoord4sv");       --  gl.h:1087
   pragma Import (Stdcall, glTexEnvf, "glTexEnvf");               --  gl.h:1088
   pragma Import (Stdcall, glTexEnvfv, "glTexEnvfv");             --  gl.h:1089
   pragma Import (Stdcall, glTexEnvi, "glTexEnvi");               --  gl.h:1090
   pragma Import (Stdcall, glTexEnviv, "glTexEnviv");             --  gl.h:1091
   pragma Import (Stdcall, glTexGend, "glTexGend");               --  gl.h:1092
   pragma Import (Stdcall, glTexGendv, "glTexGendv");             --  gl.h:1093
   pragma Import (Stdcall, glTexGenf, "glTexGenf");               --  gl.h:1094
   pragma Import (Stdcall, glTexGenfv, "glTexGenfv");             --  gl.h:1095
   pragma Import (Stdcall, glTexGeni, "glTexGeni");               --  gl.h:1096
   pragma Import (Stdcall, glTexGeniv, "glTexGeniv");             --  gl.h:1097
   pragma Import (Stdcall, glTexImage1D, "glTexImage1D");         --  gl.h:1098
   pragma Import (Stdcall, glTexImage2D, "glTexImage2D");         --  gl.h:1099
   pragma Import (Stdcall, glTexParameterf, "glTexParameterf");   --  gl.h:1100
   pragma Import (Stdcall, glTexParameterfv, "glTexParameterfv"); --  gl.h:1101
   pragma Import (Stdcall, glTexParameteri, "glTexParameteri");   --  gl.h:1102
   pragma Import (Stdcall, glTexParameteriv, "glTexParameteriv"); --  gl.h:1103
   pragma Import (Stdcall, glTranslated, "glTranslated");         --  gl.h:1104
   pragma Import (Stdcall, glTranslatef, "glTranslatef");         --  gl.h:1105
   pragma Import (Stdcall, glVertex2d, "glVertex2d");             --  gl.h:1106
   pragma Import (Stdcall, glVertex2dv, "glVertex2dv");           --  gl.h:1107
   pragma Import (Stdcall, glVertex2f, "glVertex2f");             --  gl.h:1108
   pragma Import (Stdcall, glVertex2fv, "glVertex2fv");           --  gl.h:1109
   pragma Import (Stdcall, glVertex2i, "glVertex2i");             --  gl.h:1110
   pragma Import (Stdcall, glVertex2iv, "glVertex2iv");           --  gl.h:1111
   pragma Import (Stdcall, glVertex2s, "glVertex2s");             --  gl.h:1112
   pragma Import (Stdcall, glVertex2sv, "glVertex2sv");           --  gl.h:1113
   pragma Import (Stdcall, glVertex3d, "glVertex3d");             --  gl.h:1114
   pragma Import (Stdcall, glVertex3dv, "glVertex3dv");           --  gl.h:1115
   pragma Import (Stdcall, glVertex3f, "glVertex3f");             --  gl.h:1116
   pragma Import (Stdcall, glVertex3fv, "glVertex3fv");           --  gl.h:1117
   pragma Import (Stdcall, glVertex3i, "glVertex3i");             --  gl.h:1118
   pragma Import (Stdcall, glVertex3iv, "glVertex3iv");           --  gl.h:1119
   pragma Import (Stdcall, glVertex3s, "glVertex3s");             --  gl.h:1120
   pragma Import (Stdcall, glVertex3sv, "glVertex3sv");           --  gl.h:1121
   pragma Import (Stdcall, glVertex4d, "glVertex4d");             --  gl.h:1122
   pragma Import (Stdcall, glVertex4dv, "glVertex4dv");           --  gl.h:1123
   pragma Import (Stdcall, glVertex4f, "glVertex4f");             --  gl.h:1124
   pragma Import (Stdcall, glVertex4fv, "glVertex4fv");           --  gl.h:1125
   pragma Import (Stdcall, glVertex4i, "glVertex4i");             --  gl.h:1126
   pragma Import (Stdcall, glVertex4iv, "glVertex4iv");           --  gl.h:1127
   pragma Import (Stdcall, glVertex4s, "glVertex4s");             --  gl.h:1128
   pragma Import (Stdcall, glVertex4sv, "glVertex4sv");           --  gl.h:1129
   pragma Import (Stdcall, glViewport, "glViewport");             --  gl.h:1130

end Win32.Gl;
