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

with Ada.Unchecked_Conversion;
with Win32.Windef;
with Win32.Winnt;

package Win32.Wingdi is

   R2_BLACK                       : constant := 1;
   R2_NOTMERGEPEN                 : constant := 2;
   R2_MASKNOTPEN                  : constant := 3;
   R2_NOTCOPYPEN                  : constant := 4;
   R2_MASKPENNOT                  : constant := 5;
   R2_NOT                         : constant := 6;
   R2_XORPEN                      : constant := 7;
   R2_NOTMASKPEN                  : constant := 8;
   R2_MASKPEN                     : constant := 9;
   R2_NOTXORPEN                   : constant := 10;
   R2_NOP                         : constant := 11;
   R2_MERGENOTPEN                 : constant := 12;
   R2_COPYPEN                     : constant := 13;
   R2_MERGEPENNOT                 : constant := 14;
   R2_MERGEPEN                    : constant := 15;
   R2_WHITE                       : constant := 16;
   R2_LAST                        : constant := 16;
   SRCCOPY                        : constant DWORD := 16#cc0020#;
   SRCPAINT                       : constant DWORD := 16#ee0086#;
   SRCAND                         : constant DWORD := 16#8800c6#;
   SRCINVERT                      : constant DWORD := 16#660046#;
   SRCERASE                       : constant DWORD := 16#440328#;
   NOTSRCCOPY                     : constant DWORD := 16#330008#;
   NOTSRCERASE                    : constant DWORD := 16#1100a6#;
   MERGECOPY                      : constant DWORD := 16#c000ca#;
   MERGEPAINT                     : constant DWORD := 16#bb0226#;
   PATCOPY                        : constant DWORD := 16#f00021#;
   PATPAINT                       : constant DWORD := 16#fb0a09#;
   PATINVERT                      : constant DWORD := 16#5a0049#;
   DSTINVERT                      : constant DWORD := 16#550009#;
   BLACKNESS                      : constant DWORD := 16#42#;
   WHITENESS                      : constant DWORD := 16#ff0062#;
   GDI_ERROR                      : constant := 16#ffffffff#;
   HGDI_ERROR                     : constant Win32.Winnt.HANDLE;
   ERROR                          : constant := 0;
   NULLREGION                     : constant := 1;
   SIMPLEREGION                   : constant := 2;
   COMPLEXREGION                  : constant := 3;
   RGN_ERROR                      : constant := 0;
   RGN_AND                        : constant := 1;
   RGN_OR                         : constant := 2;
   RGN_XOR                        : constant := 3;
   RGN_DIFF                       : constant := 4;
   RGN_COPY                       : constant := 5;
   RGN_MIN                        : constant := 1;
   RGN_MAX                        : constant := 5;
   BLACKONWHITE                   : constant := 1;
   WHITEONBLACK                   : constant := 2;
   COLORONCOLOR                   : constant := 3;
   HALFTONE                       : constant := 4;
   MAXSTRETCHBLTMODE              : constant := 4;
   ALTERNATE                      : constant := 1;
   WINDING                        : constant := 2;
   POLYFILL_LAST                  : constant := 2;
   TA_NOUPDATECP                  : constant := 0;
   TA_UPDATECP                    : constant := 1;
   TA_LEFT                        : constant := 0;
   TA_RIGHT                       : constant := 2;
   TA_CENTER                      : constant := 6;
   TA_TOP                         : constant := 0;
   TA_BOTTOM                      : constant := 8;
   TA_BASELINE                    : constant := 24;
   TA_MASK                        : constant := 31;
   VTA_BASELINE                   : constant := 24;
   VTA_LEFT                       : constant := 8;
   VTA_RIGHT                      : constant := 0;
   VTA_CENTER                     : constant := 6;
   VTA_BOTTOM                     : constant := 2;
   VTA_TOP                        : constant := 0;
   ETO_OPAQUE                     : constant := 16#2#;
   ETO_CLIPPED                    : constant := 16#4#;
   ASPECT_FILTERING               : constant := 16#1#;
   DCB_RESET                      : constant := 16#1#;
   DCB_ACCUMULATE                 : constant := 16#2#;
   DCB_DIRTY                      : constant := 16#2#;
   DCB_SET                        : constant := 16#3#;
   DCB_ENABLE                     : constant := 16#4#;
   DCB_DISABLE                    : constant := 16#8#;
   META_SETBKCOLOR                : constant := 16#201#;
   META_SETBKMODE                 : constant := 16#102#;
   META_SETMAPMODE                : constant := 16#103#;
   META_SETROP2                   : constant := 16#104#;
   META_SETRELABS                 : constant := 16#105#;
   META_SETPOLYFILLMODE           : constant := 16#106#;
   META_SETSTRETCHBLTMODE         : constant := 16#107#;
   META_SETTEXTCHAREXTRA          : constant := 16#108#;
   META_SETTEXTCOLOR              : constant := 16#209#;
   META_SETTEXTJUSTIFICATION      : constant := 16#20a#;
   META_SETWINDOWORG              : constant := 16#20b#;
   META_SETWINDOWEXT              : constant := 16#20c#;
   META_SETVIEWPORTORG            : constant := 16#20d#;
   META_SETVIEWPORTEXT            : constant := 16#20e#;
   META_OFFSETWINDOWORG           : constant := 16#20f#;
   META_SCALEWINDOWEXT            : constant := 16#410#;
   META_OFFSETVIEWPORTORG         : constant := 16#211#;
   META_SCALEVIEWPORTEXT          : constant := 16#412#;
   META_LINETO                    : constant := 16#213#;
   META_MOVETO                    : constant := 16#214#;
   META_EXCLUDECLIPRECT           : constant := 16#415#;
   META_INTERSECTCLIPRECT         : constant := 16#416#;
   META_ARC                       : constant := 16#817#;
   META_ELLIPSE                   : constant := 16#418#;
   META_FLOODFILL                 : constant := 16#419#;
   META_PIE                       : constant := 16#81a#;
   META_RECTANGLE                 : constant := 16#41b#;
   META_ROUNDRECT                 : constant := 16#61c#;
   META_PATBLT                    : constant := 16#61d#;
   META_SAVEDC                    : constant := 16#1e#;
   META_SETPIXEL                  : constant := 16#41f#;
   META_OFFSETCLIPRGN             : constant := 16#220#;
   META_TEXTOUT                   : constant := 16#521#;
   META_BITBLT                    : constant := 16#922#;
   META_STRETCHBLT                : constant := 16#b23#;
   META_POLYGON                   : constant := 16#324#;
   META_POLYLINE                  : constant := 16#325#;
   META_ESCAPE                    : constant := 16#626#;
   META_RESTOREDC                 : constant := 16#127#;
   META_FILLREGION                : constant := 16#228#;
   META_FRAMEREGION               : constant := 16#429#;
   META_INVERTREGION              : constant := 16#12a#;
   META_PAINTREGION               : constant := 16#12b#;
   META_SELECTCLIPREGION          : constant := 16#12c#;
   META_SELECTOBJECT              : constant := 16#12d#;
   META_SETTEXTALIGN              : constant := 16#12e#;
   META_CHORD                     : constant := 16#830#;
   META_SETMAPPERFLAGS            : constant := 16#231#;
   META_EXTTEXTOUT                : constant := 16#a32#;
   META_SETDIBTODEV               : constant := 16#d33#;
   META_SELECTPALETTE             : constant := 16#234#;
   META_REALIZEPALETTE            : constant := 16#35#;
   META_ANIMATEPALETTE            : constant := 16#436#;
   META_SETPALENTRIES             : constant := 16#37#;
   META_POLYPOLYGON               : constant := 16#538#;
   META_RESIZEPALETTE             : constant := 16#139#;
   META_DIBBITBLT                 : constant := 16#940#;
   META_DIBSTRETCHBLT             : constant := 16#b41#;
   META_DIBCREATEPATTERNBRUSH     : constant := 16#142#;
   META_STRETCHDIB                : constant := 16#f43#;
   META_EXTFLOODFILL              : constant := 16#548#;
   META_DELETEOBJECT              : constant := 16#1f0#;
   META_CREATEPALETTE             : constant := 16#f7#;
   META_CREATEPATTERNBRUSH        : constant := 16#1f9#;
   META_CREATEPENINDIRECT         : constant := 16#2fa#;
   META_CREATEFONTINDIRECT        : constant := 16#2fb#;
   META_CREATEBRUSHINDIRECT       : constant := 16#2fc#;
   META_CREATEREGION              : constant := 16#6ff#;
   NEWFRAME                       : constant := 1;
   ABORTDOC_CONST                 : constant := 2;
   NEXTBAND                       : constant := 3;
   SETCOLORTABLE                  : constant := 4;
   GETCOLORTABLE                  : constant := 5;
   FLUSHOUTPUT                    : constant := 6;
   DRAFTMODE                      : constant := 7;
   QUERYESCSUPPORT                : constant := 8;
   SETABORTPROC_CONST             : constant := 9;
   STARTDOC_CONST                 : constant := 10;
   ENDDOC_CONST                   : constant := 11;
   GETPHYSPAGESIZE                : constant := 12;
   GETPRINTINGOFFSET              : constant := 13;
   GETSCALINGFACTOR               : constant := 14;
   MFCOMMENT                      : constant := 15;
   GETPENWIDTH                    : constant := 16;
   SETCOPYCOUNT                   : constant := 17;
   SELECTPAPERSOURCE              : constant := 18;
   DEVICEDATA                     : constant := 19;
   PASSTHROUGH                    : constant := 19;
   GETTECHNOLGY                   : constant := 20;
   GETTECHNOLOGY                  : constant := 20;
   SETLINECAP                     : constant := 21;
   SETLINEJOIN                    : constant := 22;
   SETMITERLIMIT_CONST            : constant := 23;
   BANDINFO                       : constant := 24;
   DRAWPATTERNRECT                : constant := 25;
   GETVECTORPENSIZE               : constant := 26;
   GETVECTORBRUSHSIZE             : constant := 27;
   ENABLEDUPLEX                   : constant := 28;
   GETSETPAPERBINS                : constant := 29;
   GETSETPRINTORIENT              : constant := 30;
   ENUMPAPERBINS                  : constant := 31;
   SETDIBSCALING                  : constant := 32;
   EPSPRINTING                    : constant := 33;
   ENUMPAPERMETRICS               : constant := 34;
   GETSETPAPERMETRICS             : constant := 35;
   POSTSCRIPT_DATA                : constant := 37;
   POSTSCRIPT_IGNORE              : constant := 38;
   MOUSETRAILS                    : constant := 39;
   GETDEVICEUNITS                 : constant := 42;
   GETEXTENDEDTEXTMETRICS         : constant := 256;
   GETEXTENTTABLE                 : constant := 257;
   GETPAIRKERNTABLE               : constant := 258;
   GETTRACKKERNTABLE              : constant := 259;
   EXTTEXTOUT_CONST               : constant := 512;
   GETFACENAME                    : constant := 513;
   DOWNLOADFACE                   : constant := 514;
   ENABLERELATIVEWIDTHS           : constant := 768;
   ENABLEPAIRKERNING              : constant := 769;
   SETKERNTRACK                   : constant := 770;
   SETALLJUSTVALUES               : constant := 771;
   SETCHARSET                     : constant := 772;
   STRETCHBLT_CONST               : constant := 2048;
   GETSETSCREENPARAMS             : constant := 3072;
   QUERYDIBSUPPORT                : constant := 3073;
   BEGIN_PATH                     : constant := 4096;
   CLIP_TO_PATH                   : constant := 4097;
   END_PATH                       : constant := 4098;
   EXT_DEVICE_CAPS                : constant := 4099;
   RESTORE_CTM                    : constant := 4100;
   SAVE_CTM                       : constant := 4101;
   SET_ARC_DIRECTION              : constant := 4102;
   SET_BACKGROUND_COLOR           : constant := 4103;
   SET_POLY_MODE                  : constant := 4104;
   SET_SCREEN_ANGLE               : constant := 4105;
   SET_SPREAD                     : constant := 4106;
   TRANSFORM_CTM                  : constant := 4107;
   SET_CLIP_BOX                   : constant := 4108;
   SET_BOUNDS                     : constant := 4109;
   SET_MIRROR_MODE                : constant := 4110;
   OPENCHANNEL                    : constant := 4110;
   DOWNLOADHEADER                 : constant := 4111;
   CLOSECHANNEL                   : constant := 4112;
   POSTSCRIPT_PASSTHROUGH         : constant := 4115;
   ENCAPSULATED_POSTSCRIPT        : constant := 4116;
   QDI_SETDIBITS                  : constant := 1;
   QDI_GETDIBITS                  : constant := 2;
   QDI_DIBTOSCREEN                : constant := 4;
   QDI_STRETCHDIB                 : constant := 8;
   SP_NOTREPORTED                 : constant := 16#4000#;
   SP_ERROR                       : constant := -1;
   SP_APPABORT                    : constant := -2;
   SP_USERABORT                   : constant := -3;
   SP_OUTOFDISK                   : constant := -4;
   SP_OUTOFMEMORY                 : constant := -5;
   PR_JOBSTATUS                   : constant := 16#0#;
   OBJ_PEN                        : constant := 1;
   OBJ_BRUSH                      : constant := 2;
   OBJ_DC                         : constant := 3;
   OBJ_METADC                     : constant := 4;
   OBJ_PAL                        : constant := 5;
   OBJ_FONT                       : constant := 6;
   OBJ_BITMAP                     : constant := 7;
   OBJ_REGION                     : constant := 8;
   OBJ_METAFILE                   : constant := 9;
   OBJ_MEMDC                      : constant := 10;
   OBJ_EXTPEN                     : constant := 11;
   OBJ_ENHMETADC                  : constant := 12;
   OBJ_ENHMETAFILE                : constant := 13;
   MWT_IDENTITY                   : constant := 1;
   MWT_LEFTMULTIPLY               : constant := 2;
   MWT_RIGHTMULTIPLY              : constant := 3;
   MWT_MIN                        : constant := 1;
   MWT_MAX                        : constant := 3;
   BI_RGB                         : constant := 0;
   BI_RLE8                        : constant := 1;
   BI_RLE4                        : constant := 2;
   BI_BITFIELDS                   : constant := 3;
   TMPF_FIXED_PITCH               : constant := 16#1#;
   TMPF_VECTOR                    : constant := 16#2#;
   TMPF_DEVICE                    : constant := 16#8#;
   TMPF_TRUETYPE                  : constant := 16#4#;
   NTM_REGULAR                    : constant := 16#40#;
   NTM_BOLD                       : constant := 16#20#;
   NTM_ITALIC                     : constant := 16#1#;
   LF_FACESIZE                    : constant := 32;
   LF_FULLFACESIZE                : constant := 64;
   OUT_DEFAULT_PRECIS             : constant := 0;
   OUT_STRING_PRECIS              : constant := 1;
   OUT_CHARACTER_PRECIS           : constant := 2;
   OUT_STROKE_PRECIS              : constant := 3;
   OUT_TT_PRECIS                  : constant := 4;
   OUT_DEVICE_PRECIS              : constant := 5;
   OUT_RASTER_PRECIS              : constant := 6;
   OUT_TT_ONLY_PRECIS             : constant := 7;
   OUT_OUTLINE_PRECIS             : constant := 8;
   CLIP_DEFAULT_PRECIS            : constant := 0;
   CLIP_CHARACTER_PRECIS          : constant := 1;
   CLIP_STROKE_PRECIS             : constant := 2;
   CLIP_MASK                      : constant := 16#f#;
   CLIP_LH_ANGLES                 : constant := 16;
   CLIP_TT_ALWAYS                 : constant := 32;
   CLIP_EMBEDDED                  : constant := 128;
   DEFAULT_QUALITY                : constant := 0;
   DRAFT_QUALITY                  : constant := 1;
   PROOF_QUALITY                  : constant := 2;
   DEFAULT_PITCH                  : constant := 0;
   FIXED_PITCH                    : constant := 1;
   VARIABLE_PITCH                 : constant := 2;
   ANSI_CHARSET                   : constant := 0;
   DEFAULT_CHARSET                : constant := 1;
   SYMBOL_CHARSET                 : constant := 2;
   SHIFTJIS_CHARSET               : constant := 128;
   HANGEUL_CHARSET                : constant := 129;
   GB2312_CHARSET                 : constant := 134;
   CHINESEBIG5_CHARSET            : constant := 136;
   OEM_CHARSET                    : constant := 255;
   FF_DONTCARE                    : constant := 0;
   FF_ROMAN                       : constant := 16;
   FF_SWISS                       : constant := 32;
   FF_MODERN                      : constant := 48;
   FF_SCRIPT                      : constant := 64;
   FF_DECORATIVE                  : constant := 80;
   FW_DONTCARE                    : constant := 0;
   FW_THIN                        : constant := 100;
   FW_EXTRALIGHT                  : constant := 200;
   FW_LIGHT                       : constant := 300;
   FW_NORMAL                      : constant := 400;
   FW_MEDIUM                      : constant := 500;
   FW_SEMIBOLD                    : constant := 600;
   FW_BOLD                        : constant := 700;
   FW_EXTRABOLD                   : constant := 800;
   FW_HEAVY                       : constant := 900;
   FW_ULTRALIGHT                  : constant := 200;
   FW_REGULAR                     : constant := 400;
   FW_DEMIBOLD                    : constant := 600;
   FW_ULTRABOLD                   : constant := 800;
   FW_BLACK                       : constant := 900;
   PANOSE_COUNT                   : constant := 10;
   PAN_FAMILYTYPE_INDEX           : constant := 0;
   PAN_SERIFSTYLE_INDEX           : constant := 1;
   PAN_WEIGHT_INDEX               : constant := 2;
   PAN_PROPORTION_INDEX           : constant := 3;
   PAN_CONTRAST_INDEX             : constant := 4;
   PAN_STROKEVARIATION_INDEX      : constant := 5;
   PAN_ARMSTYLE_INDEX             : constant := 6;
   PAN_LETTERFORM_INDEX           : constant := 7;
   PAN_MIDLINE_INDEX              : constant := 8;
   PAN_XHEIGHT_INDEX              : constant := 9;
   PAN_CULTURE_LATIN              : constant := 0;
   PAN_ANY                        : constant := 0;
   PAN_NO_FIT                     : constant := 1;
   PAN_FAMILY_TEXT_DISPLAY        : constant := 2;
   PAN_FAMILY_SCRIPT              : constant := 3;
   PAN_FAMILY_DECORATIVE          : constant := 4;
   PAN_FAMILY_PICTORIAL           : constant := 5;
   PAN_SERIF_COVE                 : constant := 2;
   PAN_SERIF_OBTUSE_COVE          : constant := 3;
   PAN_SERIF_SQUARE_COVE          : constant := 4;
   PAN_SERIF_OBTUSE_SQUARE_COVE   : constant := 5;
   PAN_SERIF_SQUARE               : constant := 6;
   PAN_SERIF_THIN                 : constant := 7;
   PAN_SERIF_BONE                 : constant := 8;
   PAN_SERIF_EXAGGERATED          : constant := 9;
   PAN_SERIF_TRIANGLE             : constant := 10;
   PAN_SERIF_NORMAL_SANS          : constant := 11;
   PAN_SERIF_OBTUSE_SANS          : constant := 12;
   PAN_SERIF_PERP_SANS            : constant := 13;
   PAN_SERIF_FLARED               : constant := 14;
   PAN_SERIF_ROUNDED              : constant := 15;
   PAN_WEIGHT_VERY_LIGHT          : constant := 2;
   PAN_WEIGHT_LIGHT               : constant := 3;
   PAN_WEIGHT_THIN                : constant := 4;
   PAN_WEIGHT_BOOK                : constant := 5;
   PAN_WEIGHT_MEDIUM              : constant := 6;
   PAN_WEIGHT_DEMI                : constant := 7;
   PAN_WEIGHT_BOLD                : constant := 8;
   PAN_WEIGHT_HEAVY               : constant := 9;
   PAN_WEIGHT_BLACK               : constant := 10;
   PAN_WEIGHT_NORD                : constant := 11;
   PAN_PROP_OLD_STYLE             : constant := 2;
   PAN_PROP_MODERN                : constant := 3;
   PAN_PROP_EVEN_WIDTH            : constant := 4;
   PAN_PROP_EXPANDED              : constant := 5;
   PAN_PROP_CONDENSED             : constant := 6;
   PAN_PROP_VERY_EXPANDED         : constant := 7;
   PAN_PROP_VERY_CONDENSED        : constant := 8;
   PAN_PROP_MONOSPACED            : constant := 9;
   PAN_CONTRAST_NONE              : constant := 2;
   PAN_CONTRAST_VERY_LOW          : constant := 3;
   PAN_CONTRAST_LOW               : constant := 4;
   PAN_CONTRAST_MEDIUM_LOW        : constant := 5;
   PAN_CONTRAST_MEDIUM            : constant := 6;
   PAN_CONTRAST_MEDIUM_HIGH       : constant := 7;
   PAN_CONTRAST_HIGH              : constant := 8;
   PAN_CONTRAST_VERY_HIGH         : constant := 9;
   PAN_STROKE_GRADUAL_DIAG        : constant := 2;
   PAN_STROKE_GRADUAL_TRAN        : constant := 3;
   PAN_STROKE_GRADUAL_VERT        : constant := 4;
   PAN_STROKE_GRADUAL_HORZ        : constant := 5;
   PAN_STROKE_RAPID_VERT          : constant := 6;
   PAN_STROKE_RAPID_HORZ          : constant := 7;
   PAN_STROKE_INSTANT_VERT        : constant := 8;
   PAN_STRAIGHT_ARMS_HORZ         : constant := 2;
   PAN_STRAIGHT_ARMS_WEDGE        : constant := 3;
   PAN_STRAIGHT_ARMS_VERT         : constant := 4;
   PAN_STRAIGHT_ARMS_SINGLE_SERIF : constant := 5;
   PAN_STRAIGHT_ARMS_DOUBLE_SERIF : constant := 6;
   PAN_BENT_ARMS_HORZ             : constant := 7;
   PAN_BENT_ARMS_WEDGE            : constant := 8;
   PAN_BENT_ARMS_VERT             : constant := 9;
   PAN_BENT_ARMS_SINGLE_SERIF     : constant := 10;
   PAN_BENT_ARMS_DOUBLE_SERIF     : constant := 11;
   PAN_LETT_NORMAL_CONTACT        : constant := 2;
   PAN_LETT_NORMAL_WEIGHTED       : constant := 3;
   PAN_LETT_NORMAL_BOXED          : constant := 4;
   PAN_LETT_NORMAL_FLATTENED      : constant := 5;
   PAN_LETT_NORMAL_ROUNDED        : constant := 6;
   PAN_LETT_NORMAL_OFF_CENTER     : constant := 7;
   PAN_LETT_NORMAL_SQUARE         : constant := 8;
   PAN_LETT_OBLIQUE_CONTACT       : constant := 9;
   PAN_LETT_OBLIQUE_WEIGHTED      : constant := 10;
   PAN_LETT_OBLIQUE_BOXED         : constant := 11;
   PAN_LETT_OBLIQUE_FLATTENED     : constant := 12;
   PAN_LETT_OBLIQUE_ROUNDED       : constant := 13;
   PAN_LETT_OBLIQUE_OFF_CENTER    : constant := 14;
   PAN_LETT_OBLIQUE_SQUARE        : constant := 15;
   PAN_MIDLINE_STANDARD_TRIMMED   : constant := 2;
   PAN_MIDLINE_STANDARD_POINTED   : constant := 3;
   PAN_MIDLINE_STANDARD_SERIFED   : constant := 4;
   PAN_MIDLINE_HIGH_TRIMMED       : constant := 5;
   PAN_MIDLINE_HIGH_POINTED       : constant := 6;
   PAN_MIDLINE_HIGH_SERIFED       : constant := 7;
   PAN_MIDLINE_CONSTANT_TRIMMED   : constant := 8;
   PAN_MIDLINE_CONSTANT_POINTED   : constant := 9;
   PAN_MIDLINE_CONSTANT_SERIFED   : constant := 10;
   PAN_MIDLINE_LOW_TRIMMED        : constant := 11;
   PAN_MIDLINE_LOW_POINTED        : constant := 12;
   PAN_MIDLINE_LOW_SERIFED        : constant := 13;
   PAN_XHEIGHT_CONSTANT_SMALL     : constant := 2;
   PAN_XHEIGHT_CONSTANT_STD       : constant := 3;
   PAN_XHEIGHT_CONSTANT_LARGE     : constant := 4;
   PAN_XHEIGHT_DUCKING_SMALL      : constant := 5;
   PAN_XHEIGHT_DUCKING_STD        : constant := 6;
   PAN_XHEIGHT_DUCKING_LARGE      : constant := 7;
   ELF_VENDOR_SIZE                : constant := 4;
   ELF_VERSION                    : constant := 0;
   ELF_CULTURE_LATIN              : constant := 0;
   RASTER_FONTTYPE                : constant := 16#1#;
   DEVICE_FONTTYPE                : constant := 16#2#;
   TRUETYPE_FONTTYPE              : constant := 16#4#;
   PC_RESERVED                    : constant := 16#1#;
   PC_EXPLICIT                    : constant := 16#2#;
   PC_NOCOLLAPSE                  : constant := 16#4#;
   TRANSPARENT                    : constant := 1;
   OPAQUE                         : constant := 2;
   BKMODE_LAST                    : constant := 2;
   GM_COMPATIBLE                  : constant := 1;
   GM_ADVANCED                    : constant := 2;
   GM_LAST                        : constant := 2;
   PT_CLOSEFIGURE                 : constant := 16#1#;
   PT_LINETO                      : constant := 16#2#;
   PT_BEZIERTO                    : constant := 16#4#;
   PT_MOVETO                      : constant := 16#6#;
   MM_TEXT                        : constant := 1;
   MM_LOMETRIC                    : constant := 2;
   MM_HIMETRIC                    : constant := 3;
   MM_LOENGLISH                   : constant := 4;
   MM_HIENGLISH                   : constant := 5;
   MM_TWIPS                       : constant := 6;
   MM_ISOTROPIC                   : constant := 7;
   MM_ANISOTROPIC                 : constant := 8;
   MM_MIN                         : constant := 1;
   MM_MAX                         : constant := 8;
   MM_MAX_FIXEDSCALE              : constant := 6;
   ABSOLUTE                       : constant := 1;
   RELATIVE                       : constant := 2;
   WHITE_BRUSH                    : constant := 0;
   LTGRAY_BRUSH                   : constant := 1;
   GRAY_BRUSH                     : constant := 2;
   DKGRAY_BRUSH                   : constant := 3;
   BLACK_BRUSH                    : constant := 4;
   NULL_BRUSH                     : constant := 5;
   HOLLOW_BRUSH                   : constant := 5;
   WHITE_PEN                      : constant := 6;
   BLACK_PEN                      : constant := 7;
   NULL_PEN                       : constant := 8;
   OEM_FIXED_FONT                 : constant := 10;
   ANSI_FIXED_FONT                : constant := 11;
   ANSI_VAR_FONT                  : constant := 12;
   SYSTEM_FONT                    : constant := 13;
   DEVICE_DEFAULT_FONT            : constant := 14;
   DEFAULT_PALETTE                : constant := 15;
   SYSTEM_FIXED_FONT              : constant := 16;
   STOCK_LAST                     : constant := 16;
   CLR_INVALID                    : constant := 16#ffffffff#;
   BS_SOLID                       : constant := 0;
   BS_NULL                        : constant := 1;
   BS_HOLLOW                      : constant := 1;
   BS_HATCHED                     : constant := 2;
   BS_PATTERN                     : constant := 3;
   BS_INDEXED                     : constant := 4;
   BS_DIBPATTERN                  : constant := 5;
   BS_DIBPATTERNPT                : constant := 6;
   BS_PATTERN8X8                  : constant := 7;
   BS_DIBPATTERN8X8               : constant := 8;
   HS_HORIZONTAL                  : constant := 0;
   HS_VERTICAL                    : constant := 1;
   HS_FDIAGONAL                   : constant := 2;
   HS_BDIAGONAL                   : constant := 3;
   HS_CROSS                       : constant := 4;
   HS_DIAGCROSS                   : constant := 5;
   PS_SOLID                       : constant := 0;
   PS_DASH                        : constant := 1;
   PS_DOT                         : constant := 2;
   PS_DASHDOT                     : constant := 3;
   PS_DASHDOTDOT                  : constant := 4;
   PS_NULL                        : constant := 5;
   PS_INSIDEFRAME                 : constant := 6;
   PS_USERSTYLE                   : constant := 7;
   PS_ALTERNATE                   : constant := 8;
   PS_STYLE_MASK                  : constant := 16#f#;
   PS_ENDCAP_ROUND                : constant := 16#0#;
   PS_ENDCAP_SQUARE               : constant := 16#100#;
   PS_ENDCAP_FLAT                 : constant := 16#200#;
   PS_ENDCAP_MASK                 : constant := 16#f00#;
   PS_JOIN_ROUND                  : constant := 16#0#;
   PS_JOIN_BEVEL                  : constant := 16#1000#;
   PS_JOIN_MITER                  : constant := 16#2000#;
   PS_JOIN_MASK                   : constant := 16#f000#;
   PS_COSMETIC                    : constant := 16#0#;
   PS_GEOMETRIC                   : constant := 16#10000#;
   PS_TYPE_MASK                   : constant := 16#f0000#;
   AD_COUNTERCLOCKWISE            : constant := 1;
   AD_CLOCKWISE                   : constant := 2;
   DRIVERVERSION                  : constant := 0;
   TECHNOLOGY                     : constant := 2;
   HORZSIZE                       : constant := 4;
   VERTSIZE                       : constant := 6;
   HORZRES                        : constant := 8;
   VERTRES                        : constant := 10;
   BITSPIXEL                      : constant := 12;
   PLANES                         : constant := 14;
   NUMBRUSHES                     : constant := 16;
   NUMPENS                        : constant := 18;
   NUMMARKERS                     : constant := 20;
   NUMFONTS                       : constant := 22;
   NUMCOLORS                      : constant := 24;
   PDEVICESIZE                    : constant := 26;
   CURVECAPS                      : constant := 28;
   LINECAPS                       : constant := 30;
   POLYGONALCAPS                  : constant := 32;
   TEXTCAPS                       : constant := 34;
   CLIPCAPS                       : constant := 36;
   RASTERCAPS                     : constant := 38;
   ASPECTX                        : constant := 40;
   ASPECTY                        : constant := 42;
   ASPECTXY                       : constant := 44;
   LOGPIXELSX                     : constant := 88;
   LOGPIXELSY                     : constant := 90;
   SIZEPALETTE                    : constant := 104;
   NUMRESERVED                    : constant := 106;
   COLORRES                       : constant := 108;
   PHYSICALWIDTH                  : constant := 110;
   PHYSICALHEIGHT                 : constant := 111;
   PHYSICALOFFSETX                : constant := 112;
   PHYSICALOFFSETY                : constant := 113;
   SCALINGFACTORX                 : constant := 114;
   SCALINGFACTORY                 : constant := 115;
   VREFRESH                       : constant := 116;
   DESKTOPVERTRES                 : constant := 117;
   DESKTOPHORZRES                 : constant := 118;
   BLTALIGNMENT                   : constant := 119;
   DT_PLOTTER                     : constant := 0;
   DT_RASDISPLAY                  : constant := 1;
   DT_RASPRINTER                  : constant := 2;
   DT_RASCAMERA                   : constant := 3;
   DT_CHARSTREAM                  : constant := 4;
   DT_METAFILE                    : constant := 5;
   DT_DISPFILE                    : constant := 6;
   CC_NONE                        : constant := 0;
   CC_CIRCLES                     : constant := 1;
   CC_PIE                         : constant := 2;
   CC_CHORD                       : constant := 4;
   CC_ELLIPSES                    : constant := 8;
   CC_WIDE                        : constant := 16;
   CC_STYLED                      : constant := 32;
   CC_WIDESTYLED                  : constant := 64;
   CC_INTERIORS                   : constant := 128;
   CC_ROUNDRECT                   : constant := 256;
   LC_NONE                        : constant := 0;
   LC_POLYLINE                    : constant := 2;
   LC_MARKER                      : constant := 4;
   LC_POLYMARKER                  : constant := 8;
   LC_WIDE                        : constant := 16;
   LC_STYLED                      : constant := 32;
   LC_WIDESTYLED                  : constant := 64;
   LC_INTERIORS                   : constant := 128;
   PC_NONE                        : constant := 0;
   PC_POLYGON                     : constant := 1;
   PC_RECTANGLE                   : constant := 2;
   PC_WINDPOLYGON                 : constant := 4;
   PC_TRAPEZOID                   : constant := 4;
   PC_SCANLINE                    : constant := 8;
   PC_WIDE                        : constant := 16;
   PC_STYLED                      : constant := 32;
   PC_WIDESTYLED                  : constant := 64;
   PC_INTERIORS                   : constant := 128;
   CP_NONE                        : constant := 0;
   CP_RECTANGLE                   : constant := 1;
   CP_REGION                      : constant := 2;
   TC_OP_CHARACTER                : constant := 16#1#;
   TC_OP_STROKE                   : constant := 16#2#;
   TC_CP_STROKE                   : constant := 16#4#;
   TC_CR_90                       : constant := 16#8#;
   TC_CR_ANY                      : constant := 16#10#;
   TC_SF_X_YINDEP                 : constant := 16#20#;
   TC_SA_DOUBLE                   : constant := 16#40#;
   TC_SA_INTEGER                  : constant := 16#80#;
   TC_SA_CONTIN                   : constant := 16#100#;
   TC_EA_DOUBLE                   : constant := 16#200#;
   TC_IA_ABLE                     : constant := 16#400#;
   TC_UA_ABLE                     : constant := 16#800#;
   TC_SO_ABLE                     : constant := 16#1000#;
   TC_RA_ABLE                     : constant := 16#2000#;
   TC_VA_ABLE                     : constant := 16#4000#;
   TC_RESERVED                    : constant := 16#8000#;
   TC_SCROLLBLT                   : constant := 16#10000#;
   RC_BITBLT                      : constant := 1;
   RC_BANDING                     : constant := 2;
   RC_SCALING                     : constant := 4;
   RC_BITMAP64                    : constant := 8;
   RC_GDI20_OUTPUT                : constant := 16#10#;
   RC_GDI20_STATE                 : constant := 16#20#;
   RC_SAVEBITMAP                  : constant := 16#40#;
   RC_DI_BITMAP                   : constant := 16#80#;
   RC_PALETTE                     : constant := 16#100#;
   RC_DIBTODEV                    : constant := 16#200#;
   RC_BIGFONT                     : constant := 16#400#;
   RC_STRETCHBLT                  : constant := 16#800#;
   RC_FLOODFILL                   : constant := 16#1000#;
   RC_STRETCHDIB                  : constant := 16#2000#;
   RC_OP_DX_OUTPUT                : constant := 16#4000#;
   RC_DEVBITS                     : constant := 16#8000#;
   DIB_RGB_COLORS                 : constant := 0;
   DIB_PAL_COLORS                 : constant := 1;
   SYSPAL_ERROR                   : constant := 0;
   SYSPAL_STATIC                  : constant := 1;
   SYSPAL_NOSTATIC                : constant := 2;
   CBM_INIT                       : constant := 16#4#;
   FLOODFILLBORDER                : constant := 0;
   FLOODFILLSURFACE               : constant := 1;
   CCHDEVICENAME                  : constant := 32;
   CCHFORMNAME                    : constant := 32;
   DM_SPECVERSION                 : constant := 16#320#;
   DM_ORIENTATION                 : constant := 16#1#;
   DM_PAPERSIZE                   : constant := 16#2#;
   DM_PAPERLENGTH                 : constant := 16#4#;
   DM_PAPERWIDTH                  : constant := 16#8#;
   DM_SCALE                       : constant := 16#10#;
   DM_COPIES                      : constant := 16#100#;
   DM_DEFAULTSOURCE               : constant := 16#200#;
   DM_PRINTQUALITY                : constant := 16#400#;
   DM_COLOR                       : constant := 16#800#;
   DM_DUPLEX                      : constant := 16#1000#;
   DM_YRESOLUTION                 : constant := 16#2000#;
   DM_TTOPTION                    : constant := 16#4000#;
   DM_COLLATE                     : constant := 16#8000#;
   DM_FORMNAME                    : constant := 16#10000#;
   DMORIENT_PORTRAIT              : constant := 1;
   DMORIENT_LANDSCAPE             : constant := 2;
   DMPAPER_FIRST                  : constant := 1;
   DMPAPER_LETTER                 : constant := 1;
   DMPAPER_LETTERSMALL            : constant := 2;
   DMPAPER_TABLOID                : constant := 3;
   DMPAPER_LEDGER                 : constant := 4;
   DMPAPER_LEGAL                  : constant := 5;
   DMPAPER_STATEMENT              : constant := 6;
   DMPAPER_EXECUTIVE              : constant := 7;
   DMPAPER_A3                     : constant := 8;
   DMPAPER_A4                     : constant := 9;
   DMPAPER_A4SMALL                : constant := 10;
   DMPAPER_A5                     : constant := 11;
   DMPAPER_B4                     : constant := 12;
   DMPAPER_B5                     : constant := 13;
   DMPAPER_FOLIO                  : constant := 14;
   DMPAPER_QUARTO                 : constant := 15;
   DMPAPER_10X14                  : constant := 16;
   DMPAPER_11X17                  : constant := 17;
   DMPAPER_NOTE                   : constant := 18;
   DMPAPER_ENV_9                  : constant := 19;
   DMPAPER_ENV_10                 : constant := 20;
   DMPAPER_ENV_11                 : constant := 21;
   DMPAPER_ENV_12                 : constant := 22;
   DMPAPER_ENV_14                 : constant := 23;
   DMPAPER_CSHEET                 : constant := 24;
   DMPAPER_DSHEET                 : constant := 25;
   DMPAPER_ESHEET                 : constant := 26;
   DMPAPER_ENV_DL                 : constant := 27;
   DMPAPER_ENV_C5                 : constant := 28;
   DMPAPER_ENV_C3                 : constant := 29;
   DMPAPER_ENV_C4                 : constant := 30;
   DMPAPER_ENV_C6                 : constant := 31;
   DMPAPER_ENV_C65                : constant := 32;
   DMPAPER_ENV_B4                 : constant := 33;
   DMPAPER_ENV_B5                 : constant := 34;
   DMPAPER_ENV_B6                 : constant := 35;
   DMPAPER_ENV_ITALY              : constant := 36;
   DMPAPER_ENV_MONARCH            : constant := 37;
   DMPAPER_ENV_PERSONAL           : constant := 38;
   DMPAPER_FANFOLD_US             : constant := 39;
   DMPAPER_FANFOLD_STD_GERMAN     : constant := 40;
   DMPAPER_FANFOLD_LGL_GERMAN     : constant := 41;
   DMPAPER_LAST                   : constant := 41;
   DMPAPER_USER                   : constant := 256;
   DMBIN_FIRST                    : constant := 1;
   DMBIN_UPPER                    : constant := 1;
   DMBIN_ONLYONE                  : constant := 1;
   DMBIN_LOWER                    : constant := 2;
   DMBIN_MIDDLE                   : constant := 3;
   DMBIN_MANUAL                   : constant := 4;
   DMBIN_ENVELOPE                 : constant := 5;
   DMBIN_ENVMANUAL                : constant := 6;
   DMBIN_AUTO                     : constant := 7;
   DMBIN_TRACTOR                  : constant := 8;
   DMBIN_SMALLFMT                 : constant := 9;
   DMBIN_LARGEFMT                 : constant := 10;
   DMBIN_LARGECAPACITY            : constant := 11;
   DMBIN_CASSETTE                 : constant := 14;
   DMBIN_FORMSOURCE               : constant := 15;
   DMBIN_LAST                     : constant := 15;
   DMBIN_USER                     : constant := 256;
   DMRES_DRAFT                    : constant := -1;
   DMRES_LOW                      : constant := -2;
   DMRES_MEDIUM                   : constant := -3;
   DMRES_HIGH                     : constant := -4;
   DMCOLOR_MONOCHROME             : constant := 1;
   DMCOLOR_COLOR                  : constant := 2;
   DMDUP_SIMPLEX                  : constant := 1;
   DMDUP_VERTICAL                 : constant := 2;
   DMDUP_HORIZONTAL               : constant := 3;
   DMTT_BITMAP                    : constant := 1;
   DMTT_DOWNLOAD                  : constant := 2;
   DMTT_SUBDEV                    : constant := 3;
   DMCOLLATE_FALSE                : constant := 0;
   DMCOLLATE_TRUE                 : constant := 1;
   DM_GRAYSCALE                   : constant := 16#1#;
   DM_INTERLACED                  : constant := 16#2#;
   RDH_RECTANGLES                 : constant := 1;
   GGO_METRICS                    : constant := 0;
   GGO_BITMAP                     : constant := 1;
   GGO_NATIVE                     : constant := 2;
   TT_POLYGON_TYPE                : constant := 24;
   TT_PRIM_LINE                   : constant := 1;
   TT_PRIM_QSPLINE                : constant := 2;
   TT_AVAILABLE                   : constant := 16#1#;
   TT_ENABLED                     : constant := 16#2#;
   PFD_TYPE_RGBA                  : constant := 0;
   PFD_TYPE_COLORINDEX            : constant := 1;
   PFD_MAIN_PLANE                 : constant := 0;
   PFD_OVERLAY_PLANE              : constant := 1;
   PFD_UNDERLAY_PLANE             : constant := -1;
   PFD_DOUBLEBUFFER               : constant := 16#1#;
   PFD_STEREO                     : constant := 16#2#;
   PFD_DRAW_TO_WINDOW             : constant := 16#4#;
   PFD_DRAW_TO_BITMAP             : constant := 16#8#;
   PFD_SUPPORT_GDI                : constant := 16#10#;
   PFD_SUPPORT_OPENGL             : constant := 16#20#;
   PFD_GENERIC_FORMAT             : constant := 16#40#;
   PFD_NEED_PALETTE               : constant := 16#80#;
   PFD_NEED_SYSTEM_PALETTE        : constant := 16#100#;
   PFD_DOUBLEBUFFER_DONTCARE      : constant := 16#40000000#;
   PFD_STEREO_DONTCARE            : constant := 16#80000000#;
   DM_UPDATE                      : constant := 1;
   DM_COPY                        : constant := 2;
   DM_PROMPT                      : constant := 4;
   DM_MODIFY                      : constant := 8;
   DM_IN_BUFFER                   : constant := 8;
   DM_IN_PROMPT                   : constant := 4;
   DM_OUT_BUFFER                  : constant := 2;
   DM_OUT_DEFAULT                 : constant := 1;
   DC_FIELDS                      : constant := 1;
   DC_PAPERS                      : constant := 2;
   DC_PAPERSIZE                   : constant := 3;
   DC_MINEXTENT                   : constant := 4;
   DC_MAXEXTENT                   : constant := 5;
   DC_BINS                        : constant := 6;
   DC_DUPLEX                      : constant := 7;
   DC_SIZE                        : constant := 8;
   DC_EXTRA                       : constant := 9;
   DC_VERSION                     : constant := 10;
   DC_DRIVER                      : constant := 11;
   DC_BINNAMES                    : constant := 12;
   DC_ENUMRESOLUTIONS             : constant := 13;
   DC_FILEDEPENDENCIES            : constant := 14;
   DC_TRUETYPE                    : constant := 15;
   DC_PAPERNAMES                  : constant := 16;
   DC_ORIENTATION                 : constant := 17;
   DC_COPIES                      : constant := 18;
   DCTT_BITMAP                    : constant := 16#1#;
   DCTT_DOWNLOAD                  : constant := 16#2#;
   DCTT_SUBDEV                    : constant := 16#4#;
   CA_NEGATIVE                    : constant := 16#1#;
   CA_LOG_FILTER                  : constant := 16#2#;
   ILLUMINANT_DEVICE_DEFAULT      : constant := 0;
   ILLUMINANT_A                   : constant := 1;
   ILLUMINANT_B                   : constant := 2;
   ILLUMINANT_C                   : constant := 3;
   ILLUMINANT_D50                 : constant := 4;
   ILLUMINANT_D55                 : constant := 5;
   ILLUMINANT_D65                 : constant := 6;
   ILLUMINANT_D75                 : constant := 7;
   ILLUMINANT_F2                  : constant := 8;
   ILLUMINANT_MAX_INDEX           : constant := 8;
   ILLUMINANT_TUNGSTEN            : constant := 1;
   ILLUMINANT_DAYLIGHT            : constant := 3;
   ILLUMINANT_FLUORESCENT         : constant := 8;
   ILLUMINANT_NTSC                : constant := 3;
   RGB_GAMMA_MIN                  : constant WORD  := 8#2500#;
   RGB_GAMMA_MAX                  : constant WORD  := 65000;
   REFERENCE_WHITE_MIN            : constant WORD  := 6000;
   REFERENCE_WHITE_MAX            : constant WORD  := 10000;
   REFERENCE_BLACK_MIN            : constant WORD  := 0;
   REFERENCE_BLACK_MAX            : constant WORD  := 4000;
   use type SHORT;
   COLOR_ADJ_MIN                  : constant SHORT := -100;
   COLOR_ADJ_MAX                  : constant SHORT := 100;
   FONTMAPPER_MAX                 : constant := 10;
   ENHMETA_SIGNATURE              : constant := 16#464d4520#;
   ENHMETA_STOCK_OBJECT           : constant := 16#80000000#;
   EMR_HEADER                     : constant := 1;
   EMR_POLYBEZIER                 : constant := 2;
   EMR_POLYGON                    : constant := 3;
   EMR_POLYLINE                   : constant := 4;
   EMR_POLYBEZIERTO               : constant := 5;
   EMR_POLYLINETO                 : constant := 6;
   EMR_POLYPOLYLINE               : constant := 7;
   EMR_POLYPOLYGON                : constant := 8;
   EMR_SETWINDOWEXTEX             : constant := 9;
   EMR_SETWINDOWORGEX             : constant := 10;
   EMR_SETVIEWPORTEXTEX           : constant := 11;
   EMR_SETVIEWPORTORGEX           : constant := 12;
   EMR_SETBRUSHORGEX              : constant := 13;
   EMR_EOF                        : constant := 14;
   EMR_SETPIXELV                  : constant := 15;
   EMR_SETMAPPERFLAGS             : constant := 16;
   EMR_SETMAPMODE                 : constant := 17;
   EMR_SETBKMODE                  : constant := 18;
   EMR_SETPOLYFILLMODE            : constant := 19;
   EMR_SETROP2                    : constant := 20;
   EMR_SETSTRETCHBLTMODE          : constant := 21;
   EMR_SETTEXTALIGN               : constant := 22;
   EMR_SETCOLORADJUSTMENT         : constant := 23;
   EMR_SETTEXTCOLOR               : constant := 24;
   EMR_SETBKCOLOR                 : constant := 25;
   EMR_OFFSETCLIPRGN              : constant := 26;
   EMR_MOVETOEX                   : constant := 27;
   EMR_SETMETARGN                 : constant := 28;
   EMR_EXCLUDECLIPRECT            : constant := 29;
   EMR_INTERSECTCLIPRECT          : constant := 30;
   EMR_SCALEVIEWPORTEXTEX         : constant := 31;
   EMR_SCALEWINDOWEXTEX           : constant := 32;
   EMR_SAVEDC                     : constant := 33;
   EMR_RESTOREDC                  : constant := 34;
   EMR_SETWORLDTRANSFORM          : constant := 35;
   EMR_MODIFYWORLDTRANSFORM       : constant := 36;
   EMR_SELECTOBJECT               : constant := 37;
   EMR_CREATEPEN                  : constant := 38;
   EMR_CREATEBRUSHINDIRECT        : constant := 39;
   EMR_DELETEOBJECT               : constant := 40;
   EMR_ANGLEARC                   : constant := 41;
   EMR_ELLIPSE                    : constant := 42;
   EMR_RECTANGLE                  : constant := 43;
   EMR_ROUNDRECT                  : constant := 44;
   EMR_ARC                        : constant := 45;
   EMR_CHORD                      : constant := 46;
   EMR_PIE                        : constant := 47;
   EMR_SELECTPALETTE              : constant := 48;
   EMR_CREATEPALETTE              : constant := 49;
   EMR_SETPALETTEENTRIES          : constant := 50;
   EMR_RESIZEPALETTE              : constant := 51;
   EMR_REALIZEPALETTE             : constant := 52;
   EMR_EXTFLOODFILL               : constant := 53;
   EMR_LINETO                     : constant := 54;
   EMR_ARCTO                      : constant := 55;
   EMR_POLYDRAW                   : constant := 56;
   EMR_SETARCDIRECTION            : constant := 57;
   EMR_SETMITERLIMIT              : constant := 58;
   EMR_BEGINPATH                  : constant := 59;
   EMR_ENDPATH                    : constant := 60;
   EMR_CLOSEFIGURE                : constant := 61;
   EMR_FILLPATH                   : constant := 62;
   EMR_STROKEANDFILLPATH          : constant := 63;
   EMR_STROKEPATH                 : constant := 64;
   EMR_FLATTENPATH                : constant := 65;
   EMR_WIDENPATH                  : constant := 66;
   EMR_SELECTCLIPPATH             : constant := 67;
   EMR_ABORTPATH                  : constant := 68;
   EMR_GDICOMMENT                 : constant := 70;
   EMR_FILLRGN                    : constant := 71;
   EMR_FRAMERGN                   : constant := 72;
   EMR_INVERTRGN                  : constant := 73;
   EMR_PAINTRGN                   : constant := 74;
   EMR_EXTSELECTCLIPRGN           : constant := 75;
   EMR_BITBLT                     : constant := 76;
   EMR_STRETCHBLT                 : constant := 77;
   EMR_MASKBLT                    : constant := 78;
   EMR_PLGBLT                     : constant := 79;
   EMR_SETDIBITSTODEVICE          : constant := 80;
   EMR_STRETCHDIBITS              : constant := 81;
   EMR_EXTCREATEFONTINDIRECTW     : constant := 82;
   EMR_EXTTEXTOUTA                : constant := 83;
   EMR_EXTTEXTOUTW                : constant := 84;
   EMR_POLYBEZIER16               : constant := 85;
   EMR_POLYGON16                  : constant := 86;
   EMR_POLYLINE16                 : constant := 87;
   EMR_POLYBEZIERTO16             : constant := 88;
   EMR_POLYLINETO16               : constant := 89;
   EMR_POLYPOLYLINE16             : constant := 90;
   EMR_POLYPOLYGON16              : constant := 91;
   EMR_POLYDRAW16                 : constant := 92;
   EMR_CREATEMONOBRUSH            : constant := 93;
   EMR_CREATEDIBPATTERNBRUSHPT    : constant := 94;
   EMR_EXTCREATEPEN               : constant := 95;
   EMR_POLYTEXTOUTA               : constant := 96;
   EMR_POLYTEXTOUTW               : constant := 97;
   EMR_MIN                        : constant := 1;
   EMR_MAX                        : constant := 97;
   GDICOMMENT_IDENTIFIER          : constant := 16#43494447#;
   GDICOMMENT_WINDOWS_METAFILE    : constant := 16#80000001#;
   GDICOMMENT_BEGINGROUP          : constant := 16#2#;
   GDICOMMENT_ENDGROUP            : constant := 16#3#;
   GDICOMMENT_MULTIFORMATS        : constant := 16#40000004#;
   EPS_SIGNATURE                  : constant := 16#46535045#;

   type XFORM;
   type BITMAP;
   type RGBTRIPLE;
   type RGBQUAD;
   type BITMAPCOREHEADER;
   type BITMAPINFOHEADER;
   type BITMAPINFO;
   type BITMAPCOREINFO;
   type BITMAPFILEHEADER;
   type HANDLETABLE;
   type METARECORD;
   type METAFILEPICT;
   type METAHEADER;
   type ENHMETARECORD;
   type ENHMETAHEADER;
   type TEXTMETRICA;
   type TEXTMETRICW;
   type NEWTEXTMETRICA;
   type NEWTEXTMETRICW;
   type PELARRAY;
   type LOGBRUSH;
   type LOGPEN;
   type EXTLOGPEN;
   type PALETTEENTRY;
   type LOGPALETTE;
   type LOGFONTA;
   type LOGFONTW;
   type ENUMLOGFONTA;
   type ENUMLOGFONTW;
   type PANOSE;
   type EXTLOGFONTA;
   type EXTLOGFONTW;
   type DEVMODEA;
   type DEVMODEW;
   type RGNDATAHEADER;
   type RGNDATA;
   type ABC;
   type ABCFLOAT;
   type OUTLINETEXTMETRICA;
   type OUTLINETEXTMETRICW;
   type POLYTEXTA;
   type POLYTEXTW;
   type FIXED;
   type MAT2;
   type GLYPHMETRICS;
   type POINTFX;
   type TTPOLYCURVE;
   type TTPOLYGONHEADER;
   type RASTERIZER_STATUS;
   type PIXELFORMATDESCRIPTOR;
   type DIBSECTION;
   type COLORADJUSTMENT;
   type DOCINFOA;
   type DOCINFOW;
   type KERNINGPAIR;
   type EMR;
   type EMRTEXT;
   type ABORTPATH;
   type EMRSELECTCLIPPATH;
   type EMRSETMITERLIMIT;
   type EMRRESTOREDC;
   type EMRSETARCDIRECTION;
   type EMRSETMAPPERFLAGS;
   type EMRSETTEXTCOLOR;
   type EMRSELECTOBJECT;
   type EMRSELECTPALETTE;
   type EMRRESIZEPALETTE;
   type EMRSETPALETTEENTRIES;
   type EMRSETCOLORADJUSTMENT;
   type EMRGDICOMMENT;
   type EMREOF;
   type EMRLINETO;
   type EMROFFSETCLIPRGN;
   type EMRFILLPATH;
   type EMREXCLUDECLIPRECT;
   type EMRSETVIEWPORTORGEX;
   type EMRSETVIEWPORTEXTEX;
   type EMRSCALEVIEWPORTEXTEX;
   type EMRSETWORLDTRANSFORM;
   type EMRMODIFYWORLDTRANSFORM;
   type EMRSETPIXELV;
   type EMREXTFLOODFILL;
   type EMRELLIPSE;
   type EMRROUNDRECT;
   type EMRARC;
   type EMRANGLEARC;
   type EMRPOLYLINE;
   type EMRPOLYLINE16;
   type EMRPOLYDRAW;
   type EMRPOLYDRAW16;
   type EMRPOLYPOLYLINE;
   type EMRPOLYPOLYLINE16;
   type EMRINVERTRGN;
   type EMRFILLRGN;
   type EMRFRAMERGN;
   type EMREXTSELECTCLIPRGN;
   type EMREXTTEXTOUTA;
   type EMRPOLYTEXTOUTA;
   type EMRBITBLT;
   type EMRSTRETCHBLT;
   type EMRMASKBLT;
   type EMRPLGBLT;
   type EMRSETDIBITSTODEVICE;
   type EMRSTRETCHDIBITS;
   type EMREXTCREATEFONTINDIRECTW;
   type EMRCREATEPALETTE;
   type EMRCREATEPEN;
   type EMREXTCREATEPEN;
   type EMRCREATEBRUSHINDIRECT;
   type EMRCREATEMONOBRUSH;
   type EMRCREATEDIBPATTERNBRUSHPT;
   type EMRFORMAT;

   type PXFORM is access all XFORM;
   subtype LPXFORM is PXFORM;
   type PBITMAP is access all BITMAP;
   subtype NPBITMAP is PBITMAP;
   subtype LPBITMAP is PBITMAP;
   type LPRGBQUAD is access all RGBQUAD;
   type LPBITMAPCOREHEADER is access all BITMAPCOREHEADER;
   subtype PBITMAPCOREHEADER is LPBITMAPCOREHEADER;
   type LPBITMAPINFOHEADER is access all BITMAPINFOHEADER;
   subtype PBITMAPINFOHEADER is LPBITMAPINFOHEADER;
   type LPBITMAPINFO is access all BITMAPINFO;
   subtype PBITMAPINFO is LPBITMAPINFO;
   type LPBITMAPCOREINFO is access all BITMAPCOREINFO;
   subtype PBITMAPCOREINFO is LPBITMAPCOREINFO;
   type LPBITMAPFILEHEADER is access all BITMAPFILEHEADER;
   subtype PBITMAPFILEHEADER is LPBITMAPFILEHEADER;
   type PHANDLETABLE is access all HANDLETABLE;
   subtype LPHANDLETABLE is PHANDLETABLE;
   type PMETARECORD is access all METARECORD;
   subtype LPMETARECORD is PMETARECORD;
   type LPMETAFILEPICT is access all METAFILEPICT;
   type PMETAHEADER is access all METAHEADER;
   subtype LPMETAHEADER is PMETAHEADER;
   type PENHMETARECORD is access all ENHMETARECORD;
   subtype LPENHMETARECORD is PENHMETARECORD;
   type PENHMETAHEADER is access all ENHMETAHEADER;
   subtype LPENHMETAHEADER is PENHMETAHEADER;
   type PTEXTMETRICA is access all TEXTMETRICA;
   subtype NPTEXTMETRICA is PTEXTMETRICA;
   subtype LPTEXTMETRICA is PTEXTMETRICA;
   type PTEXTMETRICW is access all TEXTMETRICW;
   subtype NPTEXTMETRICW is PTEXTMETRICW;
   subtype LPTEXTMETRICW is PTEXTMETRICW;
   type PTEXTMETRIC is access all TEXTMETRICA;
   subtype NPTEXTMETRIC is PTEXTMETRIC;
   subtype LPTEXTMETRIC is PTEXTMETRIC;
   type PNEWTEXTMETRICA is access all NEWTEXTMETRICA;
   subtype NPNEWTEXTMETRICA is PNEWTEXTMETRICA;
   subtype LPNEWTEXTMETRICA is PNEWTEXTMETRICA;
   type PNEWTEXTMETRICW is access all NEWTEXTMETRICW;
   subtype NPNEWTEXTMETRICW is PNEWTEXTMETRICW;
   subtype LPNEWTEXTMETRICW is PNEWTEXTMETRICW;
   type PNEWTEXTMETRIC is access all NEWTEXTMETRICA;
   subtype NPNEWTEXTMETRIC is PNEWTEXTMETRIC;
   subtype LPNEWTEXTMETRIC is PNEWTEXTMETRIC;
   type PPELARRAY is access all PELARRAY;
   subtype NPPELARRAY is PPELARRAY;
   subtype LPPELARRAY is PPELARRAY;
   type PLOGBRUSH is access all LOGBRUSH;
   subtype NPLOGBRUSH is PLOGBRUSH;
   subtype LPLOGBRUSH is PLOGBRUSH;
   type PPATTERN is access all LOGBRUSH;
   subtype NPPATTERN is PPATTERN;
   subtype LPPATTERN is PPATTERN;
   type PLOGPEN is access all LOGPEN;
   subtype NPLOGPEN is PLOGPEN;
   subtype LPLOGPEN is PLOGPEN;
   type PEXTLOGPEN is access all EXTLOGPEN;
   subtype NPEXTLOGPEN is PEXTLOGPEN;
   subtype LPEXTLOGPEN is PEXTLOGPEN;
   type PPALETTEENTRY is access all PALETTEENTRY;
   subtype LPPALETTEENTRY is PPALETTEENTRY;
   type PLOGPALETTE is access all LOGPALETTE;
   subtype NPLOGPALETTE is PLOGPALETTE;
   subtype LPLOGPALETTE is PLOGPALETTE;
   type PLOGFONTA is access all LOGFONTA;
   subtype NPLOGFONTA is PLOGFONTA;
   subtype LPLOGFONTA is PLOGFONTA;
   type PLOGFONTW is access all LOGFONTW;
   subtype NPLOGFONTW is PLOGFONTW;
   subtype LPLOGFONTW is PLOGFONTW;
   type PLOGFONT is access all LOGFONTA;
   subtype NPLOGFONT is PLOGFONT;
   subtype LPLOGFONT is PLOGFONT;
   type LPENUMLOGFONTA is access all ENUMLOGFONTA;
   subtype LPENUMLOGFONT is LPENUMLOGFONTA;
   type LPENUMLOGFONTW is access all ENUMLOGFONTW;
   type LPPANOSE is access all PANOSE;
   type PEXTLOGFONTA is access all EXTLOGFONTA;
   subtype NPEXTLOGFONTA is PEXTLOGFONTA;
   subtype LPEXTLOGFONTA is PEXTLOGFONTA;
   subtype PEXTLOGFONT is PEXTLOGFONTA;
   subtype NPEXTLOGFONT is PEXTLOGFONTA;
   subtype LPEXTLOGFONT is PEXTLOGFONTA;
   type PEXTLOGFONTW is access all EXTLOGFONTW;
   subtype NPEXTLOGFONTW is PEXTLOGFONTW;
   subtype LPEXTLOGFONTW is PEXTLOGFONTW;
   type PDEVMODEA is access all DEVMODEA;
   subtype NPDEVMODEA is PDEVMODEA;
   subtype LPDEVMODEA is PDEVMODEA;
   subtype PDEVMODE is PDEVMODEA;
   subtype NPDEVMODE is PDEVMODEA;
   subtype LPDEVMODE is PDEVMODEA;
   type PDEVMODEW is access all DEVMODEW;
   subtype NPDEVMODEW is PDEVMODEW;
   subtype LPDEVMODEW is PDEVMODEW;
   type PRGNDATAHEADER is access all RGNDATAHEADER;
   type PRGNDATA is access all RGNDATA;
   subtype NPRGNDATA is PRGNDATA;
   subtype LPRGNDATA is PRGNDATA;
   type PABC is access all ABC;
   subtype NPABC is PABC;
   subtype LPABC is PABC;
   type PABCFLOAT is access all ABCFLOAT;
   subtype NPABCFLOAT is PABCFLOAT;
   subtype LPABCFLOAT is PABCFLOAT;
   type POUTLINETEXTMETRICA is access all OUTLINETEXTMETRICA;
   subtype NPOUTLINETEXTMETRICA is POUTLINETEXTMETRICA;
   subtype LPOUTLINETEXTMETRICA is POUTLINETEXTMETRICA;
   subtype POUTLINETEXTMETRIC is POUTLINETEXTMETRICA;
   subtype NPOUTLINETEXTMETRIC is POUTLINETEXTMETRICA;
   subtype LPOUTLINETEXTMETRIC is POUTLINETEXTMETRICA;
   type POUTLINETEXTMETRICW is access all OUTLINETEXTMETRICW;
   subtype NPOUTLINETEXTMETRICW is POUTLINETEXTMETRICW;
   subtype LPOUTLINETEXTMETRICW is POUTLINETEXTMETRICW;
   type PPOLYTEXTA is access all POLYTEXTA;
   subtype NPPOLYTEXTA is PPOLYTEXTA;
   subtype LPPOLYTEXTA is PPOLYTEXTA;
   subtype PPOLYTEXT is PPOLYTEXTA;
   subtype NPPOLYTEXT is PPOLYTEXTA;
   subtype LPPOLYTEXT is PPOLYTEXTA;
   type PPOLYTEXTW is access all POLYTEXTW;
   subtype NPPOLYTEXTW is PPOLYTEXTW;
   subtype LPPOLYTEXTW is PPOLYTEXTW;
   type LPMAT2 is access all MAT2;
   type LPGLYPHMETRICS is access all GLYPHMETRICS;
   type LPPOINTFX is access all POINTFX;
   type LPTTPOLYCURVE is access all TTPOLYCURVE;
   type LPTTPOLYGONHEADER is access all TTPOLYGONHEADER;
   type LPRASTERIZER_STATUS is access all RASTERIZER_STATUS;
   type PPIXELFORMATDESCRIPTOR is access all PIXELFORMATDESCRIPTOR;
   subtype LPPIXELFORMATDESCRIPTOR is PPIXELFORMATDESCRIPTOR;
   type LPDIBSECTION is access all DIBSECTION;
   subtype PDIBSECTION is LPDIBSECTION;
   type PCOLORADJUSTMENT is access all COLORADJUSTMENT;
   subtype LPCOLORADJUSTMENT is PCOLORADJUSTMENT;
   type LPDOCINFOA is access all DOCINFOA;
   subtype LPDOCINFO is LPDOCINFOA;
   type LPDOCINFOW is access all DOCINFOW;
   type LPKERNINGPAIR is access all KERNINGPAIR;
   type PEMR is access all EMR;
   type PEMRTEXT is access all EMRTEXT;
   type PEMRABORTPATH is access all ABORTPATH;
   subtype PEMRBEGINPATH is PEMRABORTPATH;
   subtype PEMRENDPATH is PEMRABORTPATH;
   subtype PEMRCLOSEFIGURE is PEMRABORTPATH;
   subtype PEMRFLATTENPATH is PEMRABORTPATH;
   subtype PEMRWIDENPATH is PEMRABORTPATH;
   subtype PEMRSETMETARGN is PEMRABORTPATH;
   subtype PEMRSAVEDC is PEMRABORTPATH;
   subtype PEMRREALIZEPALETTE is PEMRABORTPATH;
   type PEMRSELECTCLIPPATH is access all EMRSELECTCLIPPATH;
   subtype PEMRSETBKMODE is PEMRSELECTCLIPPATH;
   subtype PEMRSETMAPMODE is PEMRSELECTCLIPPATH;
   subtype PEMRSETPOLYFILLMODE is PEMRSELECTCLIPPATH;
   subtype PEMRSETROP2 is PEMRSELECTCLIPPATH;
   subtype PEMRSETSTRETCHBLTMODE is PEMRSELECTCLIPPATH;
   subtype PEMRSETTEXTALIGN is PEMRSELECTCLIPPATH;
   type PEMRSETMITERLIMIT is access all EMRSETMITERLIMIT;
   type PEMRRESTOREDC is access all EMRRESTOREDC;
   type PEMRSETARCDIRECTION is access all EMRSETARCDIRECTION;
   type PEMRSETMAPPERFLAGS is access all EMRSETMAPPERFLAGS;
   type PEMRSETBKCOLOR is access all EMRSETTEXTCOLOR;
   subtype PEMRSETTEXTCOLOR is PEMRSETBKCOLOR;
   type PEMRSELECTOBJECT is access all EMRSELECTOBJECT;
   subtype PEMRDELETEOBJECT is PEMRSELECTOBJECT;
   type PEMRSELECTPALETTE is access all EMRSELECTPALETTE;
   type PEMRRESIZEPALETTE is access all EMRRESIZEPALETTE;
   type PEMRSETPALETTEENTRIES is access all EMRSETPALETTEENTRIES;
   type PEMRSETCOLORADJUSTMENT is access all EMRSETCOLORADJUSTMENT;
   type PEMRGDICOMMENT is access all EMRGDICOMMENT;
   type PEMREOF is access all EMREOF;
   type PEMRLINETO is access all EMRLINETO;
   subtype PEMRMOVETOEX is PEMRLINETO;
   type PEMROFFSETCLIPRGN is access all EMROFFSETCLIPRGN;
   type PEMRFILLPATH is access all EMRFILLPATH;
   subtype PEMRSTROKEANDFILLPATH is PEMRFILLPATH;
   subtype PEMRSTROKEPATH is PEMRSTROKEANDFILLPATH;
   type PEMREXCLUDECLIPRECT is access all EMREXCLUDECLIPRECT;
   subtype PEMRINTERSECTCLIPRECT is PEMREXCLUDECLIPRECT;
   type PEMRSETVIEWPORTORGEX is access all EMRSETVIEWPORTORGEX;
   subtype PEMRSETWINDOWORGEX is PEMRSETVIEWPORTORGEX;
   subtype PEMRSETBRUSHORGEX is PEMRSETVIEWPORTORGEX;
   type PEMRSETVIEWPORTEXTEX is access all EMRSETVIEWPORTEXTEX;
   subtype PEMRSETWINDOWEXTEX is PEMRSETVIEWPORTEXTEX;
   type PEMRSCALEVIEWPORTEXTEX is access all EMRSCALEVIEWPORTEXTEX;
   subtype PEMRSCALEWINDOWEXTEX is PEMRSCALEVIEWPORTEXTEX;
   type PEMRSETWORLDTRANSFORM is access all EMRSETWORLDTRANSFORM;
   type PEMRMODIFYWORLDTRANSFORM is access all EMRMODIFYWORLDTRANSFORM;
   type PEMRSETPIXELV is access all EMRSETPIXELV;
   type PEMREXTFLOODFILL is access all EMREXTFLOODFILL;
   type PEMRELLIPSE is access all EMRELLIPSE;
   subtype PEMRRECTANGLE is PEMRELLIPSE;
   type PEMRROUNDRECT is access all EMRROUNDRECT;
   type PEMRARC is access all EMRARC;
   subtype PEMRARCTO is PEMRARC;
   subtype PEMRCHORD is PEMRARCTO;
   subtype PEMRPIE is PEMRARCTO;
   type PEMRANGLEARC is access all EMRANGLEARC;
   type PEMRPOLYLINE is access all EMRPOLYLINE;
   subtype PEMRPOLYBEZIER is PEMRPOLYLINE;
   subtype PEMRPOLYGON is PEMRPOLYLINE;
   subtype PEMRPOLYBEZIERTO is PEMRPOLYLINE;
   subtype PEMRPOLYLINETO is PEMRPOLYLINE;
   type PEMRPOLYLINE16 is access all EMRPOLYLINE16;
   subtype PEMRPOLYBEZIER16 is PEMRPOLYLINE16;
   subtype PEMRPOLYGON16 is PEMRPOLYLINE16;
   subtype PEMRPOLYBEZIERTO16 is PEMRPOLYLINE16;
   subtype PEMRPOLYLINETO16 is PEMRPOLYLINE16;
   type PEMRPOLYDRAW is access all EMRPOLYDRAW;
   type PEMRPOLYDRAW16 is access all EMRPOLYDRAW16;
   type PEMRPOLYPOLYLINE is access all EMRPOLYPOLYLINE;
   subtype PEMRPOLYPOLYGON is PEMRPOLYPOLYLINE;
   type PEMRPOLYPOLYLINE16 is access all EMRPOLYPOLYLINE16;
   subtype PEMRPOLYPOLYGON16 is PEMRPOLYPOLYLINE16;
   type PEMRINVERTRGN is access all EMRINVERTRGN;
   subtype PEMRPAINTRGN is PEMRINVERTRGN;
   type PEMRFILLRGN is access all EMRFILLRGN;
   type PEMRFRAMERGN is access all EMRFRAMERGN;
   type PEMREXTSELECTCLIPRGN is access all EMREXTSELECTCLIPRGN;
   type PEMREXTTEXTOUTA is access all EMREXTTEXTOUTA;
   subtype PEMREXTTEXTOUTW is PEMREXTTEXTOUTA;
   type PEMRPOLYTEXTOUTA is access all EMRPOLYTEXTOUTA;
   subtype PEMRPOLYTEXTOUTW is PEMRPOLYTEXTOUTA;
   type PEMRBITBLT is access all EMRBITBLT;
   type PEMRSTRETCHBLT is access all EMRSTRETCHBLT;
   type PEMRMASKBLT is access all EMRMASKBLT;
   type PEMRPLGBLT is access all EMRPLGBLT;
   type PEMRSETDIBITSTODEVICE is access all EMRSETDIBITSTODEVICE;
   type PEMRSTRETCHDIBITS is access all EMRSTRETCHDIBITS;
   type PEMREXTCREATEFONTINDIRECTW is access all EMREXTCREATEFONTINDIRECTW;
   type PEMRCREATEPALETTE is access all EMRCREATEPALETTE;
   type PEMRCREATEPEN is access all EMRCREATEPEN;
   type PEMREXTCREATEPEN is access all EMREXTCREATEPEN;
   type PEMRCREATEBRUSHINDIRECT is access all EMRCREATEBRUSHINDIRECT;
   type PEMRCREATEMONOBRUSH is access all EMRCREATEMONOBRUSH;
   type PEMRCREATEDIBPATTERNBRUSHPT is access all EMRCREATEDIBPATTERNBRUSHPT;
   type PEMRFORMAT is access all EMRFORMAT;

   type XFORM is record
      eM11 : Win32.FLOAT;
      eM12 : Win32.FLOAT;
      eM21 : Win32.FLOAT;
      eM22 : Win32.FLOAT;
      eDx  : Win32.FLOAT;
      eDy  : Win32.FLOAT;
   end record;

   type BITMAP is record
      bmType       : Win32.LONG;
      bmWidth      : Win32.LONG;
      bmHeight     : Win32.LONG;
      bmWidthBytes : Win32.LONG;
      bmPlanes     : Win32.WORD;
      bmBitsPixel  : Win32.WORD;
      bmBits       : Win32.LPVOID;
   end record;

   type RGBTRIPLE is record
      rgbtBlue  : Win32.BYTE;
      rgbtGreen : Win32.BYTE;
      rgbtRed   : Win32.BYTE;
   end record;

   type RGBQUAD is record
      rgbBlue     : Win32.BYTE;
      rgbGreen    : Win32.BYTE;
      rgbRed      : Win32.BYTE;
      rgbReserved : Win32.BYTE;
   end record;

   type BITMAPCOREHEADER is record
      bcSize     : Win32.DWORD;
      bcWidth    : Win32.WORD;
      bcHeight   : Win32.WORD;
      bcPlanes   : Win32.WORD;
      bcBitCount : Win32.WORD;
   end record;

   type BITMAPINFOHEADER is record
      biSize          : Win32.DWORD;
      biWidth         : Win32.LONG;
      biHeight        : Win32.LONG;
      biPlanes        : Win32.WORD;
      biBitCount      : Win32.WORD;
      biCompression   : Win32.DWORD;
      biSizeImage     : Win32.DWORD;
      biXPelsPerMeter : Win32.LONG;
      biYPelsPerMeter : Win32.LONG;
      biClrUsed       : Win32.DWORD;
      biClrImportant  : Win32.DWORD;
   end record;

   type RGBQUAD_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased RGBQUAD;

   type BITMAPINFO is record
      bmiHeader : BITMAPINFOHEADER;
      bmiColors : RGBQUAD_Array;
   end record;

   type RGBTRIPLE_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased RGBTRIPLE;

   type BITMAPCOREINFO is record
      bmciHeader : BITMAPCOREHEADER;
      bmciColors : RGBTRIPLE_Array;
   end record;

   type BITMAPFILEHEADER is record
      bfType      : Win32.WORD;
      bfSize      : Win32.DWORD;
      bfReserved1 : Win32.WORD;
      bfReserved2 : Win32.WORD;
      bfOffBits   : Win32.DWORD;
   end record;

   for BITMAPFILEHEADER use record
      bfType      at 0 range 0 .. 15;
      bfSize      at 2 range 0 .. 31;
      bfReserved1 at 6 range 0 .. 15;
      bfReserved2 at 8 range 0 .. 15;
      bfOffBits   at 10 range 0 .. 31;
   end record;

   for BITMAPFILEHEADER'Size use 14 * 8;

   type HGDIOBJ_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased Win32.Windef.HGDIOBJ;

   type HANDLETABLE is record
      objectHandle : HGDIOBJ_Array;
   end record;

   type METARECORD is record
      rdSize     : Win32.DWORD;
      rdFunction : Win32.WORD;
      rdParm     : Win32.WORD_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type METAFILEPICT is record
      mm   : Win32.LONG;
      xExt : Win32.LONG;
      yExt : Win32.LONG;
      hMF  : Win32.Windef.HMETAFILE;
   end record;

   type METAHEADER is record
      mtType         : Win32.WORD;
      mtHeaderSize   : Win32.WORD;
      mtVersion      : Win32.WORD;
      mtSize         : Win32.DWORD;
      mtNoObjects    : Win32.WORD;
      mtMaxRecord    : Win32.DWORD;
      mtNoParameters : Win32.WORD;
   end record;

   for METAHEADER use record
      mtType         at 0 range 0 .. 15;
      mtHeaderSize   at 2 range 0 .. 15;
      mtVersion      at 4 range 0 .. 15;
      mtSize         at 6 range 0 .. 31;
      mtNoObjects    at 10 range 0 .. 15;
      mtMaxRecord    at 12 range 0 .. 31;
      mtNoParameters at 16 range 0 .. 15;
   end record;

   for METAHEADER'Size use 18 * 8;

   type ENHMETARECORD is record
      iType : Win32.DWORD;
      nSize : Win32.DWORD;
      dParm : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type ENHMETAHEADER is record
      iType          : Win32.DWORD;
      nSize          : Win32.DWORD;
      rclBounds      : Win32.Windef.RECTL;
      rclFrame       : Win32.Windef.RECTL;
      dSignature     : Win32.DWORD;
      nVersion       : Win32.DWORD;
      nBytes         : Win32.DWORD;
      nRecords       : Win32.DWORD;
      nHandles       : Win32.WORD;
      sReserved      : Win32.WORD;
      nDescription   : Win32.DWORD;
      offDescription : Win32.DWORD;
      nPalEntries    : Win32.DWORD;
      szlDevice      : Win32.Windef.SIZEL;
      szlMillimeters : Win32.Windef.SIZEL;
      cbPixelFormat  : Win32.DWORD;
      offPixelFormat : Win32.DWORD;
      bOpenGL        : Win32.DWORD;
      szlMicrometers : Win32.Windef.SIZEL;
   end record;

   type TEXTMETRICA is record
      tmHeight           : Win32.LONG;
      tmAscent           : Win32.LONG;
      tmDescent          : Win32.LONG;
      tmInternalLeading  : Win32.LONG;
      tmExternalLeading  : Win32.LONG;
      tmAveCharWidth     : Win32.LONG;
      tmMaxCharWidth     : Win32.LONG;
      tmWeight           : Win32.LONG;
      tmOverhang         : Win32.LONG;
      tmDigitizedAspectX : Win32.LONG;
      tmDigitizedAspectY : Win32.LONG;
      tmFirstChar        : Win32.BYTE;
      tmLastChar         : Win32.BYTE;
      tmDefaultChar      : Win32.BYTE;
      tmBreakChar        : Win32.BYTE;
      tmItalic           : Win32.BYTE;
      tmUnderlined       : Win32.BYTE;
      tmStruckOut        : Win32.BYTE;
      tmPitchAndFamily   : Win32.BYTE;
      tmCharSet          : Win32.BYTE;
   end record;

   type TEXTMETRICW is record
      tmHeight           : Win32.LONG;
      tmAscent           : Win32.LONG;
      tmDescent          : Win32.LONG;
      tmInternalLeading  : Win32.LONG;
      tmExternalLeading  : Win32.LONG;
      tmAveCharWidth     : Win32.LONG;
      tmMaxCharWidth     : Win32.LONG;
      tmWeight           : Win32.LONG;
      tmOverhang         : Win32.LONG;
      tmDigitizedAspectX : Win32.LONG;
      tmDigitizedAspectY : Win32.LONG;
      tmFirstChar        : Win32.WCHAR;
      tmLastChar         : Win32.WCHAR;
      tmDefaultChar      : Win32.WCHAR;
      tmBreakChar        : Win32.WCHAR;
      tmItalic           : Win32.BYTE;
      tmUnderlined       : Win32.BYTE;
      tmStruckOut        : Win32.BYTE;
      tmPitchAndFamily   : Win32.BYTE;
      tmCharSet          : Win32.BYTE;
   end record;

   subtype TEXTMETRIC is TEXTMETRICA;

   type NEWTEXTMETRICA is record
      tmHeight           : Win32.LONG;
      tmAscent           : Win32.LONG;
      tmDescent          : Win32.LONG;
      tmInternalLeading  : Win32.LONG;
      tmExternalLeading  : Win32.LONG;
      tmAveCharWidth     : Win32.LONG;
      tmMaxCharWidth     : Win32.LONG;
      tmWeight           : Win32.LONG;
      tmOverhang         : Win32.LONG;
      tmDigitizedAspectX : Win32.LONG;
      tmDigitizedAspectY : Win32.LONG;
      tmFirstChar        : Win32.BYTE;
      tmLastChar         : Win32.BYTE;
      tmDefaultChar      : Win32.BYTE;
      tmBreakChar        : Win32.BYTE;
      tmItalic           : Win32.BYTE;
      tmUnderlined       : Win32.BYTE;
      tmStruckOut        : Win32.BYTE;
      tmPitchAndFamily   : Win32.BYTE;
      tmCharSet          : Win32.BYTE;
      ntmFlags           : Win32.DWORD;
      ntmSizeEM          : Win32.UINT;
      ntmCellHeight      : Win32.UINT;
      ntmAvgWidth        : Win32.UINT;
   end record;

   type NEWTEXTMETRICW is record
      tmHeight           : Win32.LONG;
      tmAscent           : Win32.LONG;
      tmDescent          : Win32.LONG;
      tmInternalLeading  : Win32.LONG;
      tmExternalLeading  : Win32.LONG;
      tmAveCharWidth     : Win32.LONG;
      tmMaxCharWidth     : Win32.LONG;
      tmWeight           : Win32.LONG;
      tmOverhang         : Win32.LONG;
      tmDigitizedAspectX : Win32.LONG;
      tmDigitizedAspectY : Win32.LONG;
      tmFirstChar        : Win32.WCHAR;
      tmLastChar         : Win32.WCHAR;
      tmDefaultChar      : Win32.WCHAR;
      tmBreakChar        : Win32.WCHAR;
      tmItalic           : Win32.BYTE;
      tmUnderlined       : Win32.BYTE;
      tmStruckOut        : Win32.BYTE;
      tmPitchAndFamily   : Win32.BYTE;
      tmCharSet          : Win32.BYTE;
      ntmFlags           : Win32.DWORD;
      ntmSizeEM          : Win32.UINT;
      ntmCellHeight      : Win32.UINT;
      ntmAvgWidth        : Win32.UINT;
   end record;

   subtype NEWTEXTMETRIC is NEWTEXTMETRICA;

   type PELARRAY is record
      paXCount : Win32.LONG;
      paYCount : Win32.LONG;
      paXExt   : Win32.LONG;
      paYExt   : Win32.LONG;
      paRGBs   : Win32.BYTE;
   end record;

   type LOGBRUSH is record
      lbStyle : Win32.UINT;
      lbColor : Win32.Windef.COLORREF;
      lbHatch : Win32.ULONG_PTR;
   end record;

   type LOGBRUSH32 is record
      lbStyle : Win32.UINT;
      lbColor : Win32.Windef.COLORREF;
      lbHatch : Win32.LONG;
   end record;

   subtype PATTERN is LOGBRUSH;

   type LOGPEN is record
      lopnStyle : Win32.UINT;
      lopnWidth : Win32.Windef.POINT;
      lopnColor : Win32.Windef.COLORREF;
   end record;

   type EXTLOGPEN is record
      elpPenStyle   : Win32.DWORD;
      elpWidth      : Win32.DWORD;
      elpBrushStyle : Win32.UINT;
      elpColor      : Win32.Windef.COLORREF;
      elpHatch      : Win32.ULONG_PTR;
      elpNumEntries : Win32.DWORD;
      elpStyleEntry : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type PALETTEENTRY is record
      peRed   : Win32.BYTE;
      peGreen : Win32.BYTE;
      peBlue  : Win32.BYTE;
      peFlags : Win32.BYTE;
   end record;

   type PALETTEENTRY_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased PALETTEENTRY;

   type LOGPALETTE is record
      palVersion    : Win32.WORD;
      palNumEntries : Win32.WORD;
      palPalEntry   : PALETTEENTRY_Array;
   end record;

   type LOGFONTA is record
      lfHeight         : Win32.LONG;
      lfWidth          : Win32.LONG;
      lfEscapement     : Win32.LONG;
      lfOrientation    : Win32.LONG;
      lfWeight         : Win32.LONG;
      lfItalic         : Win32.BYTE;
      lfUnderline      : Win32.BYTE;
      lfStrikeOut      : Win32.BYTE;
      lfCharSet        : Win32.BYTE;
      lfOutPrecision   : Win32.BYTE;
      lfClipPrecision  : Win32.BYTE;
      lfQuality        : Win32.BYTE;
      lfPitchAndFamily : Win32.BYTE;
      lfFaceName       : Win32.CHAR_Array (0 .. 31);
   end record;

   type LOGFONTW is record
      lfHeight         : Win32.LONG;
      lfWidth          : Win32.LONG;
      lfEscapement     : Win32.LONG;
      lfOrientation    : Win32.LONG;
      lfWeight         : Win32.LONG;
      lfItalic         : Win32.BYTE;
      lfUnderline      : Win32.BYTE;
      lfStrikeOut      : Win32.BYTE;
      lfCharSet        : Win32.BYTE;
      lfOutPrecision   : Win32.BYTE;
      lfClipPrecision  : Win32.BYTE;
      lfQuality        : Win32.BYTE;
      lfPitchAndFamily : Win32.BYTE;
      lfFaceName       : Win32.WCHAR_Array (0 .. 31);
   end record;

   subtype LOGFONT is LOGFONTA;

   type ENUMLOGFONTA is record
      elfLogFont  : LOGFONTA;
      elfFullName : Win32.BYTE_Array (0 .. 63);
      elfStyle    : Win32.BYTE_Array (0 .. 31);
   end record;

   type ENUMLOGFONTW is record
      elfLogFont  : LOGFONTW;
      elfFullName : Win32.WCHAR_Array (0 .. 63);
      elfStyle    : Win32.WCHAR_Array (0 .. 31);
   end record;

   subtype ENUMLOGFONT is ENUMLOGFONTA;

   type PANOSE is record
      bFamilyType      : Win32.BYTE;
      bSerifStyle      : Win32.BYTE;
      bWeight          : Win32.BYTE;
      bProportion      : Win32.BYTE;
      bContrast        : Win32.BYTE;
      bStrokeVariation : Win32.BYTE;
      bArmStyle        : Win32.BYTE;
      bLetterform      : Win32.BYTE;
      bMidline         : Win32.BYTE;
      bXHeight         : Win32.BYTE;
   end record;

   type EXTLOGFONTA is record
      elfLogFont   : LOGFONTA;
      elfFullName  : Win32.BYTE_Array (0 .. 63);
      elfStyle     : Win32.BYTE_Array (0 .. 31);
      elfVersion   : Win32.DWORD;
      elfStyleSize : Win32.DWORD;
      elfMatch     : Win32.DWORD;
      elfReserved  : Win32.DWORD;
      elfVendorId  : Win32.BYTE_Array (0 .. 3);
      elfCulture   : Win32.DWORD;
      elfPanose    : PANOSE;
   end record;

   type EXTLOGFONTW is record
      elfLogFont   : LOGFONTW;
      elfFullName  : Win32.WCHAR_Array (0 .. 63);
      elfStyle     : Win32.WCHAR_Array (0 .. 31);
      elfVersion   : Win32.DWORD;
      elfStyleSize : Win32.DWORD;
      elfMatch     : Win32.DWORD;
      elfReserved  : Win32.DWORD;
      elfVendorId  : Win32.BYTE_Array (0 .. 3);
      elfCulture   : Win32.DWORD;
      elfPanose    : PANOSE;
   end record;

   subtype EXTLOGFONT is EXTLOGFONTA;

   type struct_anonymous37_t is record
      dmOrientation   : Win32.SHORT;
      dmPaperSize     : Win32.SHORT;
      dmPaperLength   : Win32.SHORT;
      dmPaperWidth    : Win32.SHORT;
      dmScale         : Win32.SHORT;
      dmCopies        : Win32.SHORT;
      dmDefaultSource : Win32.SHORT;
      dmPrintQuality  : Win32.SHORT;
   end record;
   pragma Convention (C, struct_anonymous37_t);

   type struct_anonymous38_t is record
      dmPosition           : Win32.Windef.POINTL;
      dmDisplayOrientation : Win32.DWORD;
      dmDisplayFixedOutput : Win32.DWORD;
   end record;
   pragma Convention (C, struct_anonymous38_t);

   type union_anonymous43_t_kind is (Short_Kind, Pointl_Kind);

   type union_anonymous43_t
     (Which : union_anonymous43_t_kind := Short_Kind)
   is record
      case Which is
         when Short_Kind =>
            Short : struct_anonymous37_t;
         when Pointl_Kind =>
            Pointl : struct_anonymous38_t;
      end case;
   end record;
   pragma Unchecked_Union (union_anonymous43_t);

   type DEVMODEA is record
      dmDeviceName       : Win32.BYTE_Array (0 .. 31);
      dmSpecVersion      : Win32.WORD;
      dmDriverVersion    : Win32.WORD;
      dmSize             : Win32.WORD;
      dmDriverExtra      : Win32.WORD;
      dmFields           : Win32.DWORD;
      dmPaper            : union_anonymous43_t;
      dmColor            : Win32.SHORT;
      dmDuplex           : Win32.SHORT;
      dmYResolution      : Win32.SHORT;
      dmTTOption         : Win32.SHORT;
      dmCollate          : Win32.SHORT;
      dmFormName         : Win32.BYTE_Array (0 .. 31);
      dmLogPixels        : Win32.WORD;
      dmBitsPerPel       : Win32.DWORD;
      dmPelsWidth        : Win32.DWORD;
      dmPelsHeight       : Win32.DWORD;
      dmDisplayFlags     : Win32.DWORD;
      dmDisplayFrequency : Win32.DWORD;
      dmICMMethod        : Win32.DWORD;
      dmICMIntent        : Win32.DWORD;
      dmMediaType        : Win32.DWORD;
      dmDitherType       : Win32.DWORD;
      dmReserved1        : Win32.DWORD;
      dmReserved2        : Win32.DWORD;
      dmPanningWidth     : Win32.DWORD;
      dmPanningHeight    : Win32.DWORD;
   end record;

   type DEVMODEW is record
      dmDeviceName       : Win32.WCHAR_Array (0 .. 31);
      dmSpecVersion      : Win32.WORD;
      dmDriverVersion    : Win32.WORD;
      dmSize             : Win32.WORD;
      dmDriverExtra      : Win32.WORD;
      dmFields           : Win32.DWORD;
      dmPaper            : union_anonymous43_t;
      dmColor            : Win32.SHORT;
      dmDuplex           : Win32.SHORT;
      dmYResolution      : Win32.SHORT;
      dmTTOption         : Win32.SHORT;
      dmCollate          : Win32.SHORT;
      dmFormName         : Win32.WCHAR_Array (0 .. 31);
      dmLogPixels        : Win32.WORD;
      dmBitsPerPel       : Win32.DWORD;
      dmPelsWidth        : Win32.DWORD;
      dmPelsHeight       : Win32.DWORD;
      dmDisplayFlags     : Win32.DWORD;
      dmDisplayFrequency : Win32.DWORD;
      dmICMMethod        : Win32.DWORD;
      dmICMIntent        : Win32.DWORD;
      dmMediaType        : Win32.DWORD;
      dmDitherType       : Win32.DWORD;
      dmReserved1        : Win32.DWORD;
      dmReserved2        : Win32.DWORD;
      dmPanningWidth     : Win32.DWORD;
      dmPanningHeight    : Win32.DWORD;
   end record;

   subtype DEVMODE is DEVMODEA;

   type RGNDATAHEADER is record
      dwSize   : Win32.DWORD;
      iType    : Win32.DWORD;
      nCount   : Win32.DWORD;
      nRgnSize : Win32.DWORD;
      rcBound  : Win32.Windef.RECT;
   end record;

   type RGNDATA is record
      rdh    : RGNDATAHEADER;
      Buffer : Win32.CHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type ABC is record
      abcA : Win32.INT;
      abcB : Win32.UINT;
      abcC : Win32.INT;
   end record;

   type ABCFLOAT is record
      abcfA : Win32.FLOAT;
      abcfB : Win32.FLOAT;
      abcfC : Win32.FLOAT;
   end record;

   type OUTLINETEXTMETRICA is record
      otmSize                : Win32.UINT;
      otmTextMetrics         : TEXTMETRICA;
      otmFiller              : Win32.BYTE;
      otmPanoseNumber        : PANOSE;
      otmfsSelection         : Win32.UINT;
      otmfsType              : Win32.UINT;
      otmsCharSlopeRise      : Win32.INT;
      otmsCharSlopeRun       : Win32.INT;
      otmItalicAngle         : Win32.INT;
      otmEMSquare            : Win32.UINT;
      otmAscent              : Win32.INT;
      otmDescent             : Win32.INT;
      otmLineGap             : Win32.UINT;
      otmsCapEmHeight        : Win32.UINT;
      otmsXHeight            : Win32.UINT;
      otmrcFontBox           : Win32.Windef.RECT;
      otmMacAscent           : Win32.INT;
      otmMacDescent          : Win32.INT;
      otmMacLineGap          : Win32.UINT;
      otmusMinimumPPEM       : Win32.UINT;
      otmptSubscriptSize     : Win32.Windef.POINT;
      otmptSubscriptOffset   : Win32.Windef.POINT;
      otmptSuperscriptSize   : Win32.Windef.POINT;
      otmptSuperscriptOffset : Win32.Windef.POINT;
      otmsStrikeoutSize      : Win32.UINT;
      otmsStrikeoutPosition  : Win32.INT;
      otmsUnderscoreSize     : Win32.INT;
      otmsUnderscorePosition : Win32.INT;
      otmpFamilyName         : Win32.PSTR;
      otmpFaceName           : Win32.PSTR;
      otmpStyleName          : Win32.PSTR;
      otmpFullName           : Win32.PSTR;
   end record;

   type OUTLINETEXTMETRICW is record
      otmSize                : Win32.UINT;
      otmTextMetrics         : TEXTMETRICW;
      otmFiller              : Win32.BYTE;
      otmPanoseNumber        : PANOSE;
      otmfsSelection         : Win32.UINT;
      otmfsType              : Win32.UINT;
      otmsCharSlopeRise      : Win32.INT;
      otmsCharSlopeRun       : Win32.INT;
      otmItalicAngle         : Win32.INT;
      otmEMSquare            : Win32.UINT;
      otmAscent              : Win32.INT;
      otmDescent             : Win32.INT;
      otmLineGap             : Win32.UINT;
      otmsCapEmHeight        : Win32.UINT;
      otmsXHeight            : Win32.UINT;
      otmrcFontBox           : Win32.Windef.RECT;
      otmMacAscent           : Win32.INT;
      otmMacDescent          : Win32.INT;
      otmMacLineGap          : Win32.UINT;
      otmusMinimumPPEM       : Win32.UINT;
      otmptSubscriptSize     : Win32.Windef.POINT;
      otmptSubscriptOffset   : Win32.Windef.POINT;
      otmptSuperscriptSize   : Win32.Windef.POINT;
      otmptSuperscriptOffset : Win32.Windef.POINT;
      otmsStrikeoutSize      : Win32.UINT;
      otmsStrikeoutPosition  : Win32.INT;
      otmsUnderscoreSize     : Win32.INT;
      otmsUnderscorePosition : Win32.INT;
      otmpFamilyName         : Win32.PSTR;
      otmpFaceName           : Win32.PSTR;
      otmpStyleName          : Win32.PSTR;
      otmpFullName           : Win32.PSTR;
   end record;

   subtype OUTLINETEXTMETRIC is OUTLINETEXTMETRICA;

   type POLYTEXTA is record
      x       : Win32.INT;
      y       : Win32.INT;
      n       : Win32.UINT;
      lpstr   : Win32.LPCSTR;
      uiFlags : Win32.UINT;
      rcl     : Win32.Windef.RECT;
      pdx     : Win32.PINT;
   end record;

   type POLYTEXTW is record
      x       : Win32.INT;
      y       : Win32.INT;
      n       : Win32.UINT;
      lpstr   : Win32.LPCWSTR;
      uiFlags : Win32.UINT;
      rcl     : Win32.Windef.RECT;
      pdx     : Win32.PINT;
   end record;

   subtype POLYTEXT is POLYTEXTA;

   type FIXED is record
      fract : Win32.WORD;
      value : Win32.SHORT;
   end record;

   type MAT2 is record
      eM11 : FIXED;
      eM12 : FIXED;
      eM21 : FIXED;
      eM22 : FIXED;
   end record;

   type GLYPHMETRICS is record
      gmBlackBoxX     : Win32.UINT;
      gmBlackBoxY     : Win32.UINT;
      gmptGlyphOrigin : Win32.Windef.POINT;
      gmCellIncX      : Win32.SHORT;
      gmCellIncY      : Win32.SHORT;
   end record;

   type POINTFX is record
      x : FIXED;
      y : FIXED;
   end record;

   type POINTFX_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased POINTFX;

   type TTPOLYCURVE is record
      wType : Win32.WORD;
      cpfx  : Win32.WORD;
      apfx  : POINTFX_Array;
   end record;

   type TTPOLYGONHEADER is record
      cb       : Win32.DWORD;
      dwType   : Win32.DWORD;
      pfxStart : POINTFX;
   end record;

   type RASTERIZER_STATUS is record
      nSize       : Win32.SHORT;
      wFlags      : Win32.SHORT;
      nLanguageID : Win32.SHORT;
   end record;

   type PIXELFORMATDESCRIPTOR is record
      nSize           : Win32.WORD;
      nVersion        : Win32.WORD;
      dwFlags         : Win32.DWORD;
      iPixelType      : Win32.BYTE;
      cColorBits      : Win32.BYTE;
      cRedBits        : Win32.BYTE;
      cRedShift       : Win32.BYTE;
      cGreenBits      : Win32.BYTE;
      cGreenShift     : Win32.BYTE;
      cBlueBits       : Win32.BYTE;
      cBlueShift      : Win32.BYTE;
      cAlphaBits      : Win32.BYTE;
      cAlphaShift     : Win32.BYTE;
      cAccumBits      : Win32.BYTE;
      cAccumRedBits   : Win32.BYTE;
      cAccumGreenBits : Win32.BYTE;
      cAccumBlueBits  : Win32.BYTE;
      cAccumAlphaBits : Win32.BYTE;
      cDepthBits      : Win32.BYTE;
      cStencilBits    : Win32.BYTE;
      cAuxBuffers     : Win32.BYTE;
      iLayerType      : Win32.BYTE;
      bReserved       : Win32.BYTE;
      dwLayerMask     : Win32.DWORD;
      dwVisibleMask   : Win32.DWORD;
      dwDamageMask    : Win32.DWORD;
   end record;

   type GOBJENUMPROC is access function
     (lpLogObject : Win32.LPVOID;
      lpData      : Win32.LPARAM)
      return Win32.INT;
   pragma Convention (Stdcall, GOBJENUMPROC);

   type LINEDDAPROC is access procedure
     (X      : Win32.INT;
      Y      : Win32.INT;
      lpData : Win32.LPARAM);
   pragma Convention (Stdcall, LINEDDAPROC);

   type LPFNDEVMODE is access function
     (p1   : Win32.Windef.HWND;
      p2   : Win32.Windef.HMODULE;
      p3   : access DEVMODE;
      p4   : Win32.LPSTR;
      p5   : Win32.LPSTR;
      p6   : access DEVMODE;
      p7   : Win32.LPSTR;
      p8   : Win32.UINT)
      return Win32.UINT;
   pragma Convention (Stdcall, LPFNDEVMODE);

   type LPFNDEVCAPS is access function
     (pDevice      : Win32.LPSTR;
      pPort        : Win32.LPSTR;
      fwCapability : Win32.UINT;
      pOutput      : Win32.LPSTR;
      pDevMode     : access DEVMODE)
      return Win32.DWORD;
   pragma Convention (Stdcall, LPFNDEVCAPS);

   type MFENUMPROC is access function
     (hdc    : Win32.Windef.HDC;
      lpht   : access HANDLETABLE;
      lpmr   : access METARECORD;
      cObj   : Win32.INT;
      lParam : Win32.LPARAM)
      return Win32.INT;
   pragma Convention (Stdcall, MFENUMPROC);

   type DIBSECTION is record
      dsBm        : BITMAP;
      dsBmih      : BITMAPINFOHEADER;
      dsBitfields : Win32.DWORD_Array (0 .. 2);
      dshSection  : Win32.Winnt.HANDLE;
      dsOffset    : Win32.DWORD;
   end record;

   type COLORADJUSTMENT is record
      caSize            : Win32.WORD;
      caFlags           : Win32.WORD;
      caIlluminantIndex : Win32.WORD;
      caRedGamma        : Win32.WORD;
      caGreenGamma      : Win32.WORD;
      caBlueGamma       : Win32.WORD;
      caReferenceBlack  : Win32.WORD;
      caReferenceWhite  : Win32.WORD;
      caContrast        : Win32.SHORT;
      caBrightness      : Win32.SHORT;
      caColorfulness    : Win32.SHORT;
      caRedGreenTint    : Win32.SHORT;
   end record;

   type ABORTPROC is access function
     (hdc   : Win32.Windef.HDC;
      error : Win32.INT)
      return Win32.BOOL;
   pragma Convention (Stdcall, ABORTPROC);

   type DOCINFOA is record
      cbSize       : Win32.INT;
      lpszDocName  : Win32.LPCSTR;
      lpszOutput   : Win32.LPCSTR;
      lpszDatatype : Win32.LPCSTR;
      fwType       : Win32.DWORD;
   end record;

   type DOCINFOW is record
      cbSize       : Win32.INT;
      lpszDocName  : Win32.LPCWSTR;
      lpszOutput   : Win32.LPCWSTR;
      lpszDatatype : Win32.LPCSTR;
      fwType       : Win32.DWORD;
   end record;

   subtype DOCINFO is DOCINFOA;

   type KERNINGPAIR is record
      wFirst      : Win32.WORD;
      wSecond     : Win32.WORD;
      iKernAmount : Win32.INT;
   end record;

   type EMR is record
      iType : Win32.DWORD;
      nSize : Win32.DWORD;
   end record;

   type EMRTEXT is record
      ptlReference : Win32.Windef.POINTL;
      nChars       : Win32.DWORD;
      offString    : Win32.DWORD;
      fOptions     : Win32.DWORD;
      rcl          : Win32.Windef.RECTL;
      offDx        : Win32.DWORD;
   end record;

   type ABORTPATH is record
      emr : Win32.Wingdi.EMR;
   end record;

   subtype EMRABORTPATH is ABORTPATH;

   subtype EMRBEGINPATH is ABORTPATH;

   subtype EMRENDPATH is ABORTPATH;

   subtype EMRCLOSEFIGURE is ABORTPATH;

   subtype EMRFLATTENPATH is ABORTPATH;

   subtype EMRWIDENPATH is ABORTPATH;

   subtype EMRSETMETARGN is ABORTPATH;

   subtype EMRSAVEDC is ABORTPATH;

   subtype EMRREALIZEPALETTE is ABORTPATH;

   type EMRSELECTCLIPPATH is record
      emr   : Win32.Wingdi.EMR;
      iMode : Win32.DWORD;
   end record;

   subtype EMRSETBKMODE is EMRSELECTCLIPPATH;

   subtype EMRSETMAPMODE is EMRSELECTCLIPPATH;

   subtype EMRSETPOLYFILLMODE is EMRSELECTCLIPPATH;

   subtype EMRSETROP2 is EMRSELECTCLIPPATH;

   subtype EMRSETSTRETCHBLTMODE is EMRSELECTCLIPPATH;

   subtype EMRSETTEXTALIGN is EMRSELECTCLIPPATH;

   type EMRSETMITERLIMIT is record
      emr         : Win32.Wingdi.EMR;
      eMiterLimit : Win32.FLOAT;
   end record;

   type EMRRESTOREDC is record
      emr       : Win32.Wingdi.EMR;
      iRelative : Win32.LONG;
   end record;

   type EMRSETARCDIRECTION is record
      emr           : Win32.Wingdi.EMR;
      iArcDirection : Win32.DWORD;
   end record;

   type EMRSETMAPPERFLAGS is record
      emr     : Win32.Wingdi.EMR;
      dwFlags : Win32.DWORD;
   end record;

   type EMRSETTEXTCOLOR is record
      emr     : Win32.Wingdi.EMR;
      crColor : Win32.Windef.COLORREF;
   end record;

   subtype EMRSETBKCOLOR is EMRSETTEXTCOLOR;

   type EMRSELECTOBJECT is record
      emr      : Win32.Wingdi.EMR;
      ihObject : Win32.DWORD;
   end record;

   subtype EMRDELETEOBJECT is EMRSELECTOBJECT;

   type EMRSELECTPALETTE is record
      emr   : Win32.Wingdi.EMR;
      ihPal : Win32.DWORD;
   end record;

   type EMRRESIZEPALETTE is record
      emr      : Win32.Wingdi.EMR;
      ihPal    : Win32.DWORD;
      cEntries : Win32.DWORD;
   end record;

   type EMRSETPALETTEENTRIES is record
      emr         : Win32.Wingdi.EMR;
      ihPal       : Win32.DWORD;
      iStart      : Win32.DWORD;
      cEntries    : Win32.DWORD;
      aPalEntries : PALETTEENTRY_Array;
   end record;

   type EMRSETCOLORADJUSTMENT is record
      emr             : Win32.Wingdi.EMR;
      ColorAdjustment : Win32.Wingdi.COLORADJUSTMENT;
   end record;

   type EMRGDICOMMENT is record
      emr    : Win32.Wingdi.EMR;
      cbData : Win32.DWORD;
      Data   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type EMREOF is record
      emr           : Win32.Wingdi.EMR;
      nPalEntries   : Win32.DWORD;
      offPalEntries : Win32.DWORD;
      nSizeLast     : Win32.DWORD;
   end record;

   type EMRLINETO is record
      emr : Win32.Wingdi.EMR;
      ptl : Win32.Windef.POINTL;
   end record;

   subtype EMRMOVETOEX is EMRLINETO;

   type EMROFFSETCLIPRGN is record
      emr       : Win32.Wingdi.EMR;
      ptlOffset : Win32.Windef.POINTL;
   end record;

   type EMRFILLPATH is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
   end record;

   subtype EMRSTROKEANDFILLPATH is EMRFILLPATH;

   subtype EMRSTROKEPATH is EMRFILLPATH;

   type EMREXCLUDECLIPRECT is record
      emr     : Win32.Wingdi.EMR;
      rclClip : Win32.Windef.RECTL;
   end record;

   subtype EMRINTERSECTCLIPRECT is EMREXCLUDECLIPRECT;

   type EMRSETVIEWPORTORGEX is record
      emr       : Win32.Wingdi.EMR;
      ptlOrigin : Win32.Windef.POINTL;
   end record;

   subtype EMRSETWINDOWORGEX is EMRSETVIEWPORTORGEX;

   subtype EMRSETBRUSHORGEX is EMRSETVIEWPORTORGEX;

   type EMRSETVIEWPORTEXTEX is record
      emr       : Win32.Wingdi.EMR;
      szlExtent : Win32.Windef.SIZEL;
   end record;

   subtype EMRSETWINDOWEXTEX is EMRSETVIEWPORTEXTEX;

   type EMRSCALEVIEWPORTEXTEX is record
      emr    : Win32.Wingdi.EMR;
      xNum   : Win32.LONG;
      xDenom : Win32.LONG;
      yNum   : Win32.LONG;
      yDenom : Win32.LONG;
   end record;

   subtype EMRSCALEWINDOWEXTEX is EMRSCALEVIEWPORTEXTEX;

   type EMRSETWORLDTRANSFORM is record
      emr   : Win32.Wingdi.EMR;
      xform : Win32.Wingdi.XFORM;
   end record;

   type EMRMODIFYWORLDTRANSFORM is record
      emr   : Win32.Wingdi.EMR;
      xform : Win32.Wingdi.XFORM;
      iMode : Win32.DWORD;
   end record;

   type EMRSETPIXELV is record
      emr      : Win32.Wingdi.EMR;
      ptlPixel : Win32.Windef.POINTL;
      crColor  : Win32.Windef.COLORREF;
   end record;

   type EMREXTFLOODFILL is record
      emr      : Win32.Wingdi.EMR;
      ptlStart : Win32.Windef.POINTL;
      crColor  : Win32.Windef.COLORREF;
      iMode    : Win32.DWORD;
   end record;

   type EMRELLIPSE is record
      emr    : Win32.Wingdi.EMR;
      rclBox : Win32.Windef.RECTL;
   end record;

   subtype EMRRECTANGLE is EMRELLIPSE;

   type EMRROUNDRECT is record
      emr       : Win32.Wingdi.EMR;
      rclBox    : Win32.Windef.RECTL;
      szlCorner : Win32.Windef.SIZEL;
   end record;

   type EMRARC is record
      emr      : Win32.Wingdi.EMR;
      rclBox   : Win32.Windef.RECTL;
      ptlStart : Win32.Windef.POINTL;
      ptlEnd   : Win32.Windef.POINTL;
   end record;

   subtype EMRARCTO is EMRARC;

   subtype EMRCHORD is EMRARC;

   subtype EMRPIE is EMRARC;

   type EMRANGLEARC is record
      emr         : Win32.Wingdi.EMR;
      ptlCenter   : Win32.Windef.POINTL;
      nRadius     : Win32.DWORD;
      eStartAngle : Win32.FLOAT;
      eSweepAngle : Win32.FLOAT;
   end record;

   type POINTL_Array is array (Natural range <>) of Win32.Windef.POINTL;

   type EMRPOLYLINE is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
      cptl      : Win32.DWORD;
      aptl      : POINTL_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   subtype EMRPOLYBEZIER is EMRPOLYLINE;

   subtype EMRPOLYGON is EMRPOLYLINE;

   subtype EMRPOLYBEZIERTO is EMRPOLYLINE;

   subtype EMRPOLYLINETO is EMRPOLYLINE;

   type POINTS_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased Win32.Windef.POINTS;

   type EMRPOLYLINE16 is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
      cpts      : Win32.DWORD;
      apts      : POINTS_Array;
   end record;

   subtype EMRPOLYBEZIER16 is EMRPOLYLINE16;

   subtype EMRPOLYGON16 is EMRPOLYLINE16;

   subtype EMRPOLYBEZIERTO16 is EMRPOLYLINE16;

   subtype EMRPOLYLINETO16 is EMRPOLYLINE16;

   type EMRPOLYDRAW is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
      cptl      : Win32.DWORD;
      aptl      : POINTL_Array (0 .. Win32.ANYSIZE_ARRAY);
      abTypes   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type EMRPOLYDRAW16 is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
      cpts      : Win32.DWORD;
      apts      : POINTS_Array;
      abTypes   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type EMRPOLYPOLYLINE is record
      emr         : Win32.Wingdi.EMR;
      rclBounds   : Win32.Windef.RECTL;
      nPolys      : Win32.DWORD;
      cptl        : Win32.DWORD;
      aPolyCounts : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
      aptl        : POINTL_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   subtype EMRPOLYPOLYGON is EMRPOLYPOLYLINE;

   type EMRPOLYPOLYLINE16 is record
      emr         : Win32.Wingdi.EMR;
      rclBounds   : Win32.Windef.RECTL;
      nPolys      : Win32.DWORD;
      cpts        : Win32.DWORD;
      aPolyCounts : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
      apts        : POINTS_Array;
   end record;

   subtype EMRPOLYPOLYGON16 is EMRPOLYPOLYLINE16;

   type EMRINVERTRGN is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
      cbRgnData : Win32.DWORD;
      RgnData   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   subtype EMRPAINTRGN is EMRINVERTRGN;

   type EMRFILLRGN is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
      cbRgnData : Win32.DWORD;
      ihBrush   : Win32.DWORD;
      RgnData   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type EMRFRAMERGN is record
      emr       : Win32.Wingdi.EMR;
      rclBounds : Win32.Windef.RECTL;
      cbRgnData : Win32.DWORD;
      ihBrush   : Win32.DWORD;
      szlStroke : Win32.Windef.SIZEL;
      RgnData   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type EMREXTSELECTCLIPRGN is record
      emr       : Win32.Wingdi.EMR;
      cbRgnData : Win32.DWORD;
      iMode     : Win32.DWORD;
      RgnData   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type EMREXTTEXTOUTA is record
      emr           : Win32.Wingdi.EMR;
      rclBounds     : Win32.Windef.RECTL;
      iGraphicsMode : Win32.DWORD;
      exScale       : Win32.FLOAT;
      eyScale       : Win32.FLOAT;
      emrtext       : Win32.Wingdi.EMRTEXT;
   end record;

   subtype EMREXTTEXTOUTW is EMREXTTEXTOUTA;

   type EMRTEXT_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased EMRTEXT;

   type EMRPOLYTEXTOUTA is record
      emr           : Win32.Wingdi.EMR;
      rclBounds     : Win32.Windef.RECTL;
      iGraphicsMode : Win32.DWORD;
      exScale       : Win32.FLOAT;
      eyScale       : Win32.FLOAT;
      cStrings      : Win32.LONG;
      aemrtext      : EMRTEXT_Array;
   end record;

   subtype EMRPOLYTEXTOUTW is EMRPOLYTEXTOUTA;

   type EMRBITBLT is record
      emr          : Win32.Wingdi.EMR;
      rclBounds    : Win32.Windef.RECTL;
      xDest        : Win32.LONG;
      yDest        : Win32.LONG;
      cxDest       : Win32.LONG;
      cyDest       : Win32.LONG;
      dwRop        : Win32.DWORD;
      xSrc         : Win32.LONG;
      ySrc         : Win32.LONG;
      xformSrc     : XFORM;
      crBkColorSrc : Win32.Windef.COLORREF;
      iUsageSrc    : Win32.DWORD;
      offBmiSrc    : Win32.DWORD;
      cbBmiSrc     : Win32.DWORD;
      offBitsSrc   : Win32.DWORD;
      cbBitsSrc    : Win32.DWORD;
   end record;

   type EMRSTRETCHBLT is record
      emr          : Win32.Wingdi.EMR;
      rclBounds    : Win32.Windef.RECTL;
      xDest        : Win32.LONG;
      yDest        : Win32.LONG;
      cxDest       : Win32.LONG;
      cyDest       : Win32.LONG;
      dwRop        : Win32.DWORD;
      xSrc         : Win32.LONG;
      ySrc         : Win32.LONG;
      xformSrc     : XFORM;
      crBkColorSrc : Win32.Windef.COLORREF;
      iUsageSrc    : Win32.DWORD;
      offBmiSrc    : Win32.DWORD;
      cbBmiSrc     : Win32.DWORD;
      offBitsSrc   : Win32.DWORD;
      cbBitsSrc    : Win32.DWORD;
      cxSrc        : Win32.LONG;
      cySrc        : Win32.LONG;
   end record;

   type EMRMASKBLT is record
      emr          : Win32.Wingdi.EMR;
      rclBounds    : Win32.Windef.RECTL;
      xDest        : Win32.LONG;
      yDest        : Win32.LONG;
      cxDest       : Win32.LONG;
      cyDest       : Win32.LONG;
      dwRop        : Win32.DWORD;
      xSrc         : Win32.LONG;
      ySrc         : Win32.LONG;
      xformSrc     : XFORM;
      crBkColorSrc : Win32.Windef.COLORREF;
      iUsageSrc    : Win32.DWORD;
      offBmiSrc    : Win32.DWORD;
      cbBmiSrc     : Win32.DWORD;
      offBitsSrc   : Win32.DWORD;
      cbBitsSrc    : Win32.DWORD;
      xMask        : Win32.LONG;
      yMask        : Win32.LONG;
      iUsageMask   : Win32.DWORD;
      offBmiMask   : Win32.DWORD;
      cbBmiMask    : Win32.DWORD;
      offBitsMask  : Win32.DWORD;
      cbBitsMask   : Win32.DWORD;
   end record;

   type EMRPLGBLT is record
      emr          : Win32.Wingdi.EMR;
      rclBounds    : Win32.Windef.RECTL;
      aptlDest     : POINTL_Array (0 .. 2);
      xSrc         : Win32.LONG;
      ySrc         : Win32.LONG;
      cxSrc        : Win32.LONG;
      cySrc        : Win32.LONG;
      xformSrc     : XFORM;
      crBkColorSrc : Win32.Windef.COLORREF;
      iUsageSrc    : Win32.DWORD;
      offBmiSrc    : Win32.DWORD;
      cbBmiSrc     : Win32.DWORD;
      offBitsSrc   : Win32.DWORD;
      cbBitsSrc    : Win32.DWORD;
      xMask        : Win32.LONG;
      yMask        : Win32.LONG;
      iUsageMask   : Win32.DWORD;
      offBmiMask   : Win32.DWORD;
      cbBmiMask    : Win32.DWORD;
      offBitsMask  : Win32.DWORD;
      cbBitsMask   : Win32.DWORD;
   end record;

   type EMRSETDIBITSTODEVICE is record
      emr        : Win32.Wingdi.EMR;
      rclBounds  : Win32.Windef.RECTL;
      xDest      : Win32.LONG;
      yDest      : Win32.LONG;
      xSrc       : Win32.LONG;
      ySrc       : Win32.LONG;
      cxSrc      : Win32.LONG;
      cySrc      : Win32.LONG;
      offBmiSrc  : Win32.DWORD;
      cbBmiSrc   : Win32.DWORD;
      offBitsSrc : Win32.DWORD;
      cbBitsSrc  : Win32.DWORD;
      iUsageSrc  : Win32.DWORD;
      iStartScan : Win32.DWORD;
      cScans     : Win32.DWORD;
   end record;

   type EMRSTRETCHDIBITS is record
      emr        : Win32.Wingdi.EMR;
      rclBounds  : Win32.Windef.RECTL;
      xDest      : Win32.LONG;
      yDest      : Win32.LONG;
      xSrc       : Win32.LONG;
      ySrc       : Win32.LONG;
      cxSrc      : Win32.LONG;
      cySrc      : Win32.LONG;
      offBmiSrc  : Win32.DWORD;
      cbBmiSrc   : Win32.DWORD;
      offBitsSrc : Win32.DWORD;
      cbBitsSrc  : Win32.DWORD;
      iUsageSrc  : Win32.DWORD;
      dwRop      : Win32.DWORD;
      cxDest     : Win32.LONG;
      cyDest     : Win32.LONG;
   end record;

   type EMREXTCREATEFONTINDIRECTW is record
      emr    : Win32.Wingdi.EMR;
      ihFont : Win32.DWORD;
      elfw   : EXTLOGFONTW;
   end record;

   type EMRCREATEPALETTE is record
      emr   : Win32.Wingdi.EMR;
      ihPal : Win32.DWORD;
      lgpl  : LOGPALETTE;
   end record;

   type EMRCREATEPEN is record
      emr   : Win32.Wingdi.EMR;
      ihPen : Win32.DWORD;
      lopn  : LOGPEN;
   end record;

   type EMREXTCREATEPEN is record
      emr     : Win32.Wingdi.EMR;
      ihPen   : Win32.DWORD;
      offBmi  : Win32.DWORD;
      cbBmi   : Win32.DWORD;
      offBits : Win32.DWORD;
      cbBits  : Win32.DWORD;
      elp     : EXTLOGPEN;
   end record;

   type EMRCREATEBRUSHINDIRECT is record
      emr     : Win32.Wingdi.EMR;
      ihBrush : Win32.DWORD;
      lb      : LOGBRUSH32;
   end record;

   type EMRCREATEMONOBRUSH is record
      emr     : Win32.Wingdi.EMR;
      ihBrush : Win32.DWORD;
      iUsage  : Win32.DWORD;
      offBmi  : Win32.DWORD;
      cbBmi   : Win32.DWORD;
      offBits : Win32.DWORD;
      cbBits  : Win32.DWORD;
   end record;

   type EMRCREATEDIBPATTERNBRUSHPT is record
      emr     : Win32.Wingdi.EMR;
      ihBrush : Win32.DWORD;
      iUsage  : Win32.DWORD;
      offBmi  : Win32.DWORD;
      cbBmi   : Win32.DWORD;
      offBits : Win32.DWORD;
      cbBits  : Win32.DWORD;
   end record;

   type EMRFORMAT is record
      dSignature : Win32.DWORD;
      nVersion   : Win32.DWORD;
      cbData     : Win32.DWORD;
      offData    : Win32.DWORD;
   end record;

   type ac_LOGFONT_t is access all LOGFONT;
   type ac_TEXTMETRIC_t is access all TEXTMETRIC;
   type ac_PALETTEENTRY_t is access all PALETTEENTRY;
   type ac_PIXELFORMATDESCRIPTOR_t is access all PIXELFORMATDESCRIPTOR;
   type ac_BITMAP_t is access all BITMAP;
   type ac_LOGBRUSH_t is access all LOGBRUSH;
   type ac_DEVMODEA_t is access all DEVMODEA;
   type ac_DEVMODEW_t is access all DEVMODEW;
   type ac_BITMAPINFOHEADER_t is access all BITMAPINFOHEADER;
   type ac_BITMAPINFO_t is access all BITMAPINFO;
   type ac_RECT_t is access all Win32.Windef.RECT;
   type ac_LOGFONTW_t is access all LOGFONTW;
   type ac_LOGPALETTE_t is access all LOGPALETTE;
   type ac_LOGPEN_t is access all LOGPEN;
   type ac_POINT_t is access all Win32.Windef.POINT;
   type ac_XFORM_t is access all XFORM;
   type ac_RGNDATA_t is access all RGNDATA;
   type ac_MAT2_t is access all MAT2;
   type ac_ENHMETARECORD_t is access all ENHMETARECORD;
   type ac_METAFILEPICT_t is access all METAFILEPICT;
   type ac_RGBQUAD_t is access all RGBQUAD;
   type ac_COLORADJUSTMENT_t is access all COLORADJUSTMENT;
   type ac_DOCINFOA_t is access all DOCINFOA;
   type ac_DOCINFOW_t is access all DOCINFOW;
   type ac_POLYTEXTA_t is access all POLYTEXTA;
   type ac_POLYTEXTW_t is access all POLYTEXTW;

   type FONTENUMPROC is access function
     (lplf   : ac_LOGFONT_t;
      lptm   : ac_TEXTMETRIC_t;
      dwType : Win32.DWORD;
      lpData : Win32.LPARAM)
      return Win32.INT;
   pragma Convention (Stdcall, FONTENUMPROC);
   type FONTENUMFAMPROC is access function
     (lplf   : LPENUMLOGFONT;
      lptm   : LPNEWTEXTMETRIC;
      dwType : Win32.DWORD;
      lpData : Win32.LPARAM)
      return Win32.INT;
   pragma Convention (Stdcall, FONTENUMFAMPROC);
   type ENHMFENUMPROC is access function
     (hDC          : Win32.Windef.HDC;
      lpHTable     : access HANDLETABLE;
      lpMFR        : ac_ENHMETARECORD_t;
      nObj         : Win32.INT;
      lpClientData : Win32.LPARAM)
      return Win32.INT;
   pragma Convention (Stdcall, ENHMFENUMPROC);

   function MAKEROP4 (fore, back : DWORD) return DWORD;

   function MAKEPOINTS (dwValue : DWORD) return Win32.Windef.POINTS;

   function RGB (bRed, bGreen, bBlue : BYTE) return Win32.Windef.COLORREF;

   function PALETTERGB
     (bRed, bGreen, bBlue : BYTE)
      return Win32.Windef.COLORREF;

   function PALETTEINDEX
     (wPaletteIndex : WORD)
      return Win32.Windef.COLORREF;

   function GetRValue (rgb : Win32.Windef.COLORREF) return BYTE;

   function GetGValue (rgb : Win32.Windef.COLORREF) return BYTE;

   function GetBValue (rgb : Win32.Windef.COLORREF) return BYTE;

   function AddFontResourceA (lpszFilename : Win32.LPCSTR) return Win32.INT;

   function AddFontResource (lpszFilename : Win32.LPCSTR) return Win32.INT
      renames AddFontResourceA;

   function AddFontResourceW
     (lpszFilename : Win32.LPCWSTR)
      return Win32.INT;

   function AnimatePalette
     (hpal     : Win32.Windef.HPALETTE;
      iStart   : Win32.UINT;
      cEntries : Win32.UINT;
      lppe     : ac_PALETTEENTRY_t)
      return Win32.BOOL;

   function Arc
     (hdc         : Win32.Windef.HDC;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT;
      nXStartArc  : Win32.INT;
      nYStartArc  : Win32.INT;
      nXEndArc    : Win32.INT;
      nYEndArc    : Win32.INT)
      return Win32.BOOL;

   function BitBlt
     (hdcDest : Win32.Windef.HDC;
      nXDest  : Win32.INT;
      nYDest  : Win32.INT;
      nWidth  : Win32.INT;
      nHeight : Win32.INT;
      hdcSrc  : Win32.Windef.HDC;
      nXSrc   : Win32.INT;
      nYSrc   : Win32.INT;
      dwRop   : Win32.DWORD)
      return Win32.BOOL;

   function CancelDC (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function Chord
     (hdcDest : Win32.Windef.HDC;
      nXDest  : Win32.INT;
      nYDest  : Win32.INT;
      nWidth  : Win32.INT;
      nHeight : Win32.INT;
      hdcSrc  : Win32.INT;
      nXSrc   : Win32.INT;
      nYSrc   : Win32.INT;
      dwRop   : Win32.INT)
      return Win32.BOOL;

   function ChoosePixelFormat
     (hdc  : Win32.Windef.HDC;
      ppfd : ac_PIXELFORMATDESCRIPTOR_t)
      return Win32.INT;

   function CloseMetaFile
     (hdc  : Win32.Windef.HDC)
      return Win32.Windef.HMETAFILE;

   function CombineRgn
     (hrgnDest     : Win32.Windef.HRGN;
      hrgnSrc1     : Win32.Windef.HRGN;
      hrgnSrc2     : Win32.Windef.HRGN;
      fCombineMode : Win32.INT)
      return Win32.INT;

   function CopyMetaFileA
     (hmfSrc   : Win32.Windef.HMETAFILE;
      lpszFile : Win32.LPCSTR)
      return Win32.Windef.HMETAFILE;

   function CopyMetaFile
     (hmfSr    : Win32.Windef.HMETAFILE;
      lpszFile : Win32.LPCSTR)
      return Win32.Windef.HMETAFILE renames CopyMetaFileA;

   function CopyMetaFileW
     (hmfSr    : Win32.Windef.HMETAFILE;
      lpszFile : Win32.LPCWSTR)
      return Win32.Windef.HMETAFILE;

   function CreateBitmap
     (nWidth   : Win32.INT;
      nHeight  : Win32.INT;
      cbPlanes : Win32.UINT;
      cbBits   : Win32.UINT;
      lpvBits  : Win32.PCVOID)
      return Win32.Windef.HBITMAP;

   function CreateBitmapIndirect
     (lpbm : access BITMAP)
      return Win32.Windef.HBITMAP;

   function CreateBrushIndirect
     (lplb : ac_LOGBRUSH_t)
      return Win32.Windef.HBRUSH;

   function CreateCompatibleBitmap
     (hdc     : Win32.Windef.HDC;
      nWidth  : Win32.INT;
      nHeight : Win32.INT)
      return Win32.Windef.HBITMAP;

   function CreateDiscardableBitmap
     (hdc     : Win32.Windef.HDC;
      nWidth  : Win32.INT;
      nHeight : Win32.INT)
      return Win32.Windef.HBITMAP;

   function CreateCompatibleDC
     (hdc  : Win32.Windef.HDC)
      return Win32.Windef.HDC;

   function CreateDCA
     (lpszDriver  : Win32.LPCSTR;
      lpszDevice  : Win32.LPCSTR;
      lpszOutput  : Win32.LPCSTR;
      lpvInitData : ac_DEVMODEA_t)
      return Win32.Windef.HDC;

   function CreateDC
     (lpszDriver  : Win32.LPCSTR;
      lpszDevice  : Win32.LPCSTR;
      lpszOutput  : Win32.LPCSTR;
      lpvInitData : ac_DEVMODEA_t)
      return Win32.Windef.HDC renames CreateDCA;

   function CreateDCW
     (lpszDriver  : Win32.LPCWSTR;
      lpszDevice  : Win32.LPCWSTR;
      lpszOutput  : Win32.LPCWSTR;
      lpvInitData : ac_DEVMODEW_t)
      return Win32.Windef.HDC;

   function CreateDIBitmap
     (hdc        : Win32.Windef.HDC;
      lpbmih     : ac_BITMAPINFOHEADER_t;
      dwInit     : Win32.DWORD;
      lpvBits    : Win32.PCVOID;
      lpbmi      : ac_BITMAPINFO_t;
      fnColorUse : Win32.UINT)
      return Win32.Windef.HBITMAP;

   function CreateDIBPatternBrush
     (hglbDIBPacked : Win32.Windef.HGLOBAL;
      fnColorSpec   : Win32.UINT)
      return Win32.Windef.HBRUSH;

   function CreateDIBPatternBrushPt
     (lpPackedDIB : Win32.PCVOID;
      iUsage      : Win32.UINT)
      return Win32.Windef.HBRUSH;

   function CreateEllipticRgn
     (nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT)
      return Win32.Windef.HRGN;

   function CreateEllipticRgnIndirect
     (lprc : ac_RECT_t)
      return Win32.Windef.HRGN;

   function CreateFontIndirectA
     (lplf : ac_TEXTMETRIC_t)
      return Win32.Windef.HFONT;

   function CreateFontIndirect
     (lplf : ac_TEXTMETRIC_t)
      return Win32.Windef.HFONT renames CreateFontIndirectA;

   function CreateFontIndirectW
     (lplf : access LOGFONTW)
      return Win32.Windef.HFONT;

   function CreateFontA
     (nHeight            : Win32.INT;
      nWidth             : Win32.INT;
      nEscapement        : Win32.INT;
      nOrientation       : Win32.INT;
      fnWeight           : Win32.INT;
      fdwItalic          : Win32.DWORD;
      fdwUnderline       : Win32.DWORD;
      fdwStrikeOut       : Win32.DWORD;
      fdwCharSet         : Win32.DWORD;
      fdwOutputPrecision : Win32.DWORD;
      fdwClipPrecision   : Win32.DWORD;
      fdwQuality         : Win32.DWORD;
      fdwPitchAndFamily  : Win32.DWORD;
      lpszFace           : Win32.LPCSTR)
      return Win32.Windef.HFONT;

   function CreateFont
     (nHeight            : Win32.INT;
      nWidth             : Win32.INT;
      nEscapement        : Win32.INT;
      nOrientation       : Win32.INT;
      fnWeight           : Win32.INT;
      fdwItalic          : Win32.DWORD;
      fdwUnderline       : Win32.DWORD;
      fdwStrikeOut       : Win32.DWORD;
      fdwCharSet         : Win32.DWORD;
      fdwOutputPrecision : Win32.DWORD;
      fdwClipPrecision   : Win32.DWORD;
      fdwQuality         : Win32.DWORD;
      fdwPitchAndFamily  : Win32.DWORD;
      lpszFace           : Win32.LPCSTR)
      return Win32.Windef.HFONT renames CreateFontA;

   function CreateFontW
     (nHeight            : Win32.INT;
      nWidth             : Win32.INT;
      nEscapement        : Win32.INT;
      nOrientation       : Win32.INT;
      fnWeight           : Win32.INT;
      fdwItalic          : Win32.DWORD;
      fdwUnderline       : Win32.DWORD;
      fdwStrikeOut       : Win32.DWORD;
      fdwCharSet         : Win32.DWORD;
      fdwOutputPrecision : Win32.DWORD;
      fdwClipPrecision   : Win32.DWORD;
      fdwQuality         : Win32.DWORD;
      fdwPitchAndFamily  : Win32.DWORD;
      lpszFace           : Win32.LPCWSTR)
      return Win32.Windef.HFONT;

   function CreateHatchBrush
     (fnStyle : Win32.INT;
      clrref  : Win32.Windef.COLORREF)
      return Win32.Windef.HBRUSH;

   function CreateICA
     (lpszDriver  : Win32.LPCSTR;
      lpszDevice  : Win32.LPCSTR;
      lpszOutput  : Win32.LPCSTR;
      lpvInitData : ac_DEVMODEA_t)
      return Win32.Windef.HDC;

   function CreateIC
     (lpszDriver  : Win32.LPCSTR;
      lpszDevice  : Win32.LPCSTR;
      lpszOutput  : Win32.LPCSTR;
      lpvInitData : ac_DEVMODEA_t)
      return Win32.Windef.HDC renames CreateICA;

   function CreateICW
     (lpszDriver  : Win32.LPCWSTR;
      lpszDevice  : Win32.LPCWSTR;
      lpszOutput  : Win32.LPCWSTR;
      lpvInitData : ac_DEVMODEW_t)
      return Win32.Windef.HDC;

   function CreateMetaFileA
     (lpszFile : Win32.LPCSTR)
      return Win32.Windef.HDC;

   function CreateMetaFile
     (lpszFile : Win32.LPCSTR)
      return Win32.Windef.HDC renames CreateMetaFileA;

   function CreateMetaFileW
     (lpszFile : Win32.LPCWSTR)
      return Win32.Windef.HDC;

   function CreatePalette
     (lplgpl : access LOGPALETTE)
      return Win32.Windef.HPALETTE;

   function CreatePen
     (fnPenStyle : Win32.INT;
      nWidth     : Win32.INT;
      clrref     : Win32.Windef.COLORREF)
      return Win32.Windef.HPEN;

   function CreatePenIndirect
     (lplgpn : access LOGPEN)
      return Win32.Windef.HPEN;

   function CreatePolyPolygonRgn
     (lppt           : ac_POINT_t;
      lpPolyCounts   : Win32.PCINT;
      nCount         : Win32.INT;
      fnPolyFillMode : Win32.INT)
      return Win32.Windef.HRGN;

   function CreatePatternBrush
     (hbmp : Win32.Windef.HBITMAP)
      return Win32.Windef.HBRUSH;

   function CreateRectRgn
     (nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT)
      return Win32.Windef.HRGN;

   function CreateRectRgnIndirect
     (lprc : ac_RECT_t)
      return Win32.Windef.HRGN;

   function CreateRoundRectRgn
     (nLeftRect      : Win32.INT;
      nTopRect       : Win32.INT;
      nRightRect     : Win32.INT;
      nBottomRect    : Win32.INT;
      nWidthEllipse  : Win32.INT;
      nHeightEllipse : Win32.INT)
      return Win32.Windef.HRGN;

   function CreateScalableFontResourceA
     (fdwHidden       : Win32.DWORD;
      lpszFontRes     : Win32.LPCSTR;
      lpszFontFile    : Win32.LPCSTR;
      lpszCurrentPath : Win32.LPCSTR)
      return Win32.BOOL;

   function CreateScalableFontResource
     (fdwHidden       : Win32.DWORD;
      lpszFontRes     : Win32.LPCSTR;
      lpszFontFile    : Win32.LPCSTR;
      lpszCurrentPath : Win32.LPCSTR)
      return Win32.BOOL renames CreateScalableFontResourceA;

   function CreateScalableFontResourceW
     (fdwHidden       : Win32.DWORD;
      lpszFontRes     : Win32.LPCWSTR;
      lpszFontFile    : Win32.LPCWSTR;
      lpszCurrentPath : Win32.LPCWSTR)
      return Win32.BOOL;

   function CreateSolidBrush
     (clrref : Win32.Windef.COLORREF)
      return Win32.Windef.HBRUSH;

   function DeleteDC (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function DeleteMetaFile (hmf : Win32.Windef.HMETAFILE) return Win32.BOOL;

   function DeleteObject (hgdiobj : Win32.Windef.HGDIOBJ) return Win32.BOOL;

   function DescribePixelFormat
     (hdc          : Win32.Windef.HDC;
      iPixelFormat : Win32.INT;
      nBytes       : Win32.UINT;
      ppfd         : access PIXELFORMATDESCRIPTOR)
      return Win32.INT;

   function DeviceCapabilitiesA
     (lpszDevice   : Win32.LPCSTR;
      pPort        : Win32.LPCSTR;
      fwCapability : Win32.WORD;
      pOutput      : Win32.LPSTR;
      pDevMode     : ac_DEVMODEA_t)
      return Win32.INT;

   function DeviceCapabilities
     (lpszDevice   : Win32.LPCSTR;
      pPort        : Win32.LPCSTR;
      fwCapability : Win32.WORD;
      pOutput      : Win32.LPSTR;
      pDevMode     : ac_DEVMODEA_t)
      return Win32.INT renames DeviceCapabilitiesA;

   function DeviceCapabilitiesW
     (lpszDevice   : Win32.LPCWSTR;
      pPort        : Win32.LPCWSTR;
      fwCapability : Win32.WORD;
      pOutput      : Win32.LPWSTR;
      pDevMode     : ac_DEVMODEW_t)
      return Win32.INT;

   function DrawEscape
     (hdc        : Win32.Windef.HDC;
      nEscape    : Win32.INT;
      cbInput    : Win32.INT;
      lpszInDate : Win32.LPCSTR)
      return Win32.INT;

   function Ellipse
     (hdc         : Win32.Windef.HDC;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT)
      return Win32.BOOL;

   function EnumFontFamiliesA
     (hdc        : Win32.Windef.HDC;
      lpszFamily : Win32.LPCSTR;
      fntenmprc  : FONTENUMFAMPROC;
      lParam     : Win32.LPARAM)
      return Win32.INT;

   function EnumFontFamilies
     (hdc        : Win32.Windef.HDC;
      lpszFamily : Win32.LPCSTR;
      fntenmprc  : FONTENUMFAMPROC;
      lParam     : Win32.LPARAM)
      return Win32.INT renames EnumFontFamiliesA;

   function EnumFontFamiliesW
     (hdc        : Win32.Windef.HDC;
      lpszFamily : Win32.LPCWSTR;
      fntenmprc  : FONTENUMFAMPROC;
      lParam     : Win32.LPARAM)
      return Win32.INT;

   function EnumFontsA
     (hdc       : Win32.Windef.HDC;
      lpszFace  : Win32.LPCSTR;
      fntenmprc : FONTENUMPROC;
      lParam    : Win32.LPARAM)
      return Win32.INT;

   function EnumFonts
     (hdc       : Win32.Windef.HDC;
      lpszFace  : Win32.LPCSTR;
      fntenmprc : FONTENUMPROC;
      lParam    : Win32.LPARAM)
      return Win32.INT renames EnumFontsA;

   function EnumFontsW
     (hdc       : Win32.Windef.HDC;
      lpszFace  : Win32.LPCWSTR;
      fntenmprc : FONTENUMPROC;
      lParam    : Win32.LPARAM)
      return Win32.INT;

   function EnumObjects
     (hdc          : Win32.Windef.HDC;
      fnObjectType : Win32.INT;
      goenmprc     : GOBJENUMPROC;
      lParam       : Win32.LPARAM)
      return Win32.INT;

   function EqualRgn
     (hrgnSrc1 : Win32.Windef.HRGN;
      hrgnSrc2 : Win32.Windef.HRGN)
      return Win32.BOOL;

   function Escape
     (hdc        : Win32.Windef.HDC;
      nEscape    : Win32.INT;
      cbInput    : Win32.INT;
      lpszInData : Win32.LPCSTR;
      lpvOutData : Win32.LPVOID)
      return Win32.INT;

   function ExtEscape
     (hdc        : Win32.Windef.HDC;
      nEscape    : Win32.INT;
      cbInput    : Win32.INT;
      lpszInData : Win32.LPCSTR;
      cbOutput   : Win32.INT;
      lpszOutput : Win32.LPSTR)
      return Win32.INT;

   function ExcludeClipRect
     (hdc         : Win32.Windef.HDC;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT)
      return Win32.INT;

   function ExtCreateRegion
     (lpXform   : access XFORM;
      nCount    : Win32.DWORD;
      lpRgnData : access RGNDATA)
      return Win32.Windef.HRGN;

   function ExtFloodFill
     (hdc        : Win32.Windef.HDC;
      nXStart    : Win32.INT;
      nYStart    : Win32.INT;
      clrref     : Win32.Windef.COLORREF;
      fuFillType : Win32.UINT)
      return Win32.BOOL;

   function FillRgn
     (hdc  : Win32.Windef.HDC;
      hrgn : Win32.Windef.HRGN;
      hbr  : Win32.Windef.HBRUSH)
      return Win32.BOOL;

   function FloodFill
     (hdc     : Win32.Windef.HDC;
      nXStart : Win32.INT;
      nYStart : Win32.INT;
      clrref  : Win32.Windef.COLORREF)
      return Win32.BOOL;

   function FrameRgn
     (hdc     : Win32.Windef.HDC;
      hrgn    : Win32.Windef.HRGN;
      hbr     : Win32.Windef.HBRUSH;
      nWidth  : Win32.INT;
      nHeight : Win32.INT)
      return Win32.BOOL;

   function GetROP2 (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetAspectRatioFilterEx
     (hdc           : Win32.Windef.HDC;
      lpAspectRatio : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetBkColor
     (hdc  : Win32.Windef.HDC)
      return Win32.Windef.COLORREF;

   function GetBkMode (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetBitmapBits
     (hbm      : Win32.Windef.HBITMAP;
      cbBuffer : Win32.LONG;
      lpvBits  : Win32.LPVOID)
      return Win32.LONG;

   function GetBitmapDimensionEx
     (hBitmap     : Win32.Windef.HBITMAP;
      lpDimension : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetBoundsRect
     (hdc        : Win32.Windef.HDC;
      lprcBounds : access Win32.Windef.RECT;
      flags      : Win32.UINT)
      return Win32.UINT;

   function GetBrushOrgEx
     (hdc     : Win32.Windef.HDC;
      lpPoint : access Win32.Windef.POINT)
      return Win32.BOOL;

   function GetCharWidthA
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpnWidths  : access Win32.INT)
      return Win32.BOOL;

   function GetCharWidth
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpnWidths  : access Win32.INT)
      return Win32.BOOL renames GetCharWidthA;

   function GetCharWidthW
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpnWidths  : access Win32.INT)
      return Win32.BOOL;

   function GetCharWidth32A
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpBuffer   : access Win32.INT)
      return Win32.BOOL;

   function GetCharWidth32
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpBuffer   : access Win32.INT)
      return Win32.BOOL renames GetCharWidth32A;

   function GetCharWidth32W
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpBuffer   : access Win32.INT)
      return Win32.BOOL;

   function GetCharWidthFloatA
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      pxBuffer   : Win32.PFLOAT)
      return Win32.BOOL;

   function GetCharWidthFloat
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      pxBuffer   : Win32.PFLOAT)
      return Win32.BOOL renames GetCharWidthFloatA;

   function GetCharWidthFloatW
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      pxBuffer   : Win32.PFLOAT)
      return Win32.BOOL;

   function GetCharABCWidthsA
     (hdc        : Win32.Windef.HDC;
      uFirstChar : Win32.UINT;
      uLastChar  : Win32.UINT;
      lpABCF     : access ABC)
      return Win32.BOOL;

   function GetCharABCWidths
     (hdc        : Win32.Windef.HDC;
      uFirstChar : Win32.UINT;
      uLastChar  : Win32.UINT;
      lpABC      : access ABC)
      return Win32.BOOL renames GetCharABCWidthsA;

   function GetCharABCWidthsW
     (hdc        : Win32.Windef.HDC;
      uFirstChar : Win32.UINT;
      uLastChar  : Win32.UINT;
      lpABC      : access ABC)
      return Win32.BOOL;

   function GetCharABCWidthsFloatA
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpABCF     : access ABCFLOAT)
      return Win32.BOOL;

   function GetCharABCWidthsFloat
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpABCF     : access ABCFLOAT)
      return Win32.BOOL renames GetCharABCWidthsFloatA;

   function GetCharABCWidthsFloatW
     (hdc        : Win32.Windef.HDC;
      iFirstChar : Win32.UINT;
      iLastChar  : Win32.UINT;
      lpABCF     : access ABCFLOAT)
      return Win32.BOOL;

   function GetClipBox
     (hdc  : Win32.Windef.HDC;
      lprc : access Win32.Windef.RECT)
      return Win32.INT;

   function GetClipRgn
     (hdc  : Win32.Windef.HDC;
      hrgn : Win32.Windef.HRGN)
      return Win32.INT;

   function GetMetaRgn
     (hdc  : Win32.Windef.HDC;
      hrgn : Win32.Windef.HRGN)
      return Win32.INT;

   function GetCurrentObject
     (hdc         : Win32.Windef.HDC;
      uObjectType : Win32.UINT)
      return Win32.Windef.HGDIOBJ;

   function GetCurrentPositionEx
     (hdc     : Win32.Windef.HDC;
      lpPoint : access Win32.Windef.POINT)
      return Win32.BOOL;

   function GetDeviceCaps
     (hdc         : Win32.Windef.HDC;
      iCapability : Win32.INT)
      return Win32.INT;

   function GetDIBits
     (hdc        : Win32.Windef.HDC;
      hbmp       : Win32.Windef.HBITMAP;
      nStartScan : Win32.UINT;
      cScanLines : Win32.UINT;
      lpvBits    : Win32.LPVOID;
      lpbmi      : access BITMAPINFO;
      fuColorUse : Win32.UINT)
      return Win32.INT;

   function GetFontData
     (hdc       : Win32.Windef.HDC;
      dwTable   : Win32.DWORD;
      dwOffset  : Win32.DWORD;
      lpvBuffer : Win32.LPVOID;
      cbData    : Win32.DWORD)
      return Win32.DWORD;

   function GetGlyphOutlineA
     (hdc      : Win32.Windef.HDC;
      uChar    : Win32.UINT;
      fuFormat : Win32.UINT;
      lpgm     : access GLYPHMETRICS;
      cbBuffer : Win32.DWORD;
      lpBuffer : Win32.LPVOID;
      lpmat2   : access MAT2)
      return Win32.DWORD;

   function GetGlyphOutline
     (hdc      : Win32.Windef.HDC;
      uChar    : Win32.UINT;
      fuFormat : Win32.UINT;
      lpgm     : access GLYPHMETRICS;
      cbBuffer : Win32.DWORD;
      lpBuffer : Win32.LPVOID;
      lpmat2   : access MAT2)
      return Win32.DWORD renames GetGlyphOutlineA;

   function GetGlyphOutlineW
     (hdc      : Win32.Windef.HDC;
      uChar    : Win32.UINT;
      fuFormat : Win32.UINT;
      lpgm     : access GLYPHMETRICS;
      cbBuffer : Win32.DWORD;
      lpBuffer : Win32.LPVOID;
      lpmat2   : access MAT2)
      return Win32.DWORD;

   function GetGraphicsMode (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetMapMode (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetMetaFileBitsEx
     (hmf     : Win32.Windef.HMETAFILE;
      nSize   : Win32.UINT;
      lpvData : Win32.LPVOID)
      return Win32.UINT;

   function GetMetaFileA
     (lpszFile : Win32.LPCSTR)
      return Win32.Windef.HMETAFILE;

   function GetMetaFile
     (lpszFile : Win32.LPCSTR)
      return Win32.Windef.HMETAFILE renames GetMetaFileA;

   function GetMetaFileW
     (lpszFile : Win32.LPCWSTR)
      return Win32.Windef.HMETAFILE;

   function GetNearestColor
     (hdc    : Win32.Windef.HDC;
      clrref : Win32.Windef.COLORREF)
      return Win32.Windef.COLORREF;

   function GetNearestPaletteIndex
     (hpal   : Win32.Windef.HPALETTE;
      clrref : Win32.Windef.COLORREF)
      return Win32.UINT;

   function GetObjectType (h : Win32.Windef.HGDIOBJ) return Win32.DWORD;

   function GetOutlineTextMetricsA
     (hdc    : Win32.Windef.HDC;
      cbData : Win32.UINT;
      lpotm  : access OUTLINETEXTMETRICA)
      return Win32.UINT;

   function GetOutlineTextMetrics
     (hdc    : Win32.Windef.HDC;
      cbData : Win32.UINT;
      lpotm  : access OUTLINETEXTMETRICA)
      return Win32.UINT renames GetOutlineTextMetricsA;

   function GetOutlineTextMetricsW
     (hdc    : Win32.Windef.HDC;
      cbData : Win32.UINT;
      lpotm  : access OUTLINETEXTMETRICW)
      return Win32.UINT;

   function GetPaletteEntries
     (hpal     : Win32.Windef.HPALETTE;
      iStart   : Win32.UINT;
      cEntries : Win32.UINT;
      lppe     : access PALETTEENTRY)
      return Win32.UINT;

   function GetPixel
     (hdc   : Win32.Windef.HDC;
      nXPos : Win32.INT;
      nYPos : Win32.INT)
      return Win32.Windef.COLORREF;

   function GetPixelFormat (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetPolyFillMode (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetRasterizerCaps
     (lpraststat : access RASTERIZER_STATUS;
      cb         : Win32.UINT)
      return Win32.BOOL;

   function GetRegionData
     (hrgn      : Win32.Windef.HRGN;
      dwCount   : Win32.DWORD;
      lpRgnData : access RGNDATA)
      return Win32.DWORD;

   function GetRgnBox
     (hrgn : Win32.Windef.HRGN;
      lprc : access Win32.Windef.RECT)
      return Win32.INT;

   function GetStockObject
     (fnObject : Win32.INT)
      return Win32.Windef.HGDIOBJ;

   function GetStretchBltMode (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetSystemPaletteEntries
     (hdc      : Win32.Windef.HDC;
      iStart   : Win32.UINT;
      cEntries : Win32.UINT;
      lppe     : access PALETTEENTRY)
      return Win32.UINT;

   function GetSystemPaletteUse (hdc : Win32.Windef.HDC) return Win32.UINT;

   function GetTextCharacterExtra (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetTextAlign (hdc : Win32.Windef.HDC) return Win32.UINT;

   function GetTextColor
     (hdc  : Win32.Windef.HDC)
      return Win32.Windef.COLORREF;

   function GetTextExtentPointA
     (hdc      : Win32.Windef.HDC;
      lpString : Win32.LPCSTR;
      cbString : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetTextExtentPoint
     (hdc      : Win32.Windef.HDC;
      lpString : Win32.LPCSTR;
      cbString : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL renames GetTextExtentPointA;

   function GetTextExtentPointW
     (hdc      : Win32.Windef.HDC;
      lpString : Win32.LPCWSTR;
      cbString : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetTextExtentPoint32A
     (hdc      : Win32.Windef.HDC;
      lpString : Win32.LPCSTR;
      cbString : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetTextExtentPoint32
     (hdc      : Win32.Windef.HDC;
      lpString : Win32.LPCSTR;
      cbString : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL renames GetTextExtentPoint32A;

   function GetTextExtentPoint32W
     (hdc      : Win32.Windef.HDC;
      lpString : Win32.LPCWSTR;
      cbString : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetTextExtentExPointA
     (hdc        : Win32.Windef.HDC;
      lpszStr    : Win32.LPCSTR;
      cchString  : Win32.INT;
      nMaxExtent : Win32.INT;
      lpnFit     : access Win32.INT;
      alpDx      : Win32.LPINT;
      lpSize     : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetTextExtentExPoint
     (hdc        : Win32.Windef.HDC;
      lpszStr    : Win32.LPCSTR;
      cchString  : Win32.INT;
      nMaxExtent : Win32.INT;
      lpnFit     : access Win32.INT;
      alpDx      : Win32.LPINT;
      lpSize     : Win32.Windef.LPSIZE)
      return Win32.BOOL renames GetTextExtentExPointA;

   function GetTextExtentExPointW
     (hdc        : Win32.Windef.HDC;
      lpszStr    : Win32.LPCWSTR;
      cchString  : Win32.INT;
      nMaxExtent : Win32.INT;
      lpnFit     : access Win32.INT;
      alpDx      : Win32.LPINT;
      lpSize     : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetViewportExtEx
     (hdc    : Win32.Windef.HDC;
      lpSize : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetViewportOrgEx
     (hdc     : Win32.Windef.HDC;
      lpPoint : access Win32.Windef.POINT)
      return Win32.BOOL;

   function GetWindowExtEx
     (hdc    : Win32.Windef.HDC;
      lpSize : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function GetWindowOrgEx
     (hdc     : Win32.Windef.HDC;
      lpPoint : access Win32.Windef.POINT)
      return Win32.BOOL;

   function IntersectClipRect
     (hdc         : Win32.Windef.HDC;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT)
      return Win32.INT;

   function InvertRgn
     (hdc  : Win32.Windef.HDC;
      hrgn : Win32.Windef.HRGN)
      return Win32.BOOL;

   function LineDDA
     (nXStart  : Win32.INT;
      nYStart  : Win32.INT;
      nXEnd    : Win32.INT;
      nYEnd    : Win32.INT;
      lnddaprc : LINEDDAPROC;
      lParam   : Win32.LPARAM)
      return Win32.BOOL;

   function LineTo
     (hdc  : Win32.Windef.HDC;
      xEnd : Win32.INT;
      yEnd : Win32.INT)
      return Win32.BOOL;

   function MaskBlt
     (hdcDest : Win32.Windef.HDC;
      nXDest  : Win32.INT;
      nYDest  : Win32.INT;
      nWidth  : Win32.INT;
      nHeight : Win32.INT;
      hdcSrc  : Win32.Windef.HDC;
      nXSrc   : Win32.INT;
      nYSrc   : Win32.INT;
      hbmMask : Win32.Windef.HBITMAP;
      xMask   : Win32.INT;
      yMask   : Win32.INT;
      dwRop   : Win32.DWORD)
      return Win32.BOOL;

   function PlgBlt
     (hdcDest : Win32.Windef.HDC;
      lpPoint : ac_POINT_t;
      hdcSrc  : Win32.Windef.HDC;
      nXSrc   : Win32.INT;
      nYSrc   : Win32.INT;
      nWidth  : Win32.INT;
      nHeight : Win32.INT;
      hbmMask : Win32.Windef.HBITMAP;
      xMask   : Win32.INT;
      yMask   : Win32.INT)
      return Win32.BOOL;

   function OffsetClipRgn
     (hdc      : Win32.Windef.HDC;
      nXOffset : Win32.INT;
      nYOffset : Win32.INT)
      return Win32.INT;

   function OffsetRgn
     (hdc      : Win32.Windef.HRGN;
      nXOffset : Win32.INT;
      nYOffset : Win32.INT)
      return Win32.INT;

   function PatBlt
     (hdc       : Win32.Windef.HDC;
      nLeftRect : Win32.INT;
      nTopRect  : Win32.INT;
      nwidth    : Win32.INT;
      nheight   : Win32.INT;
      fdwRop    : Win32.DWORD)
      return Win32.BOOL;

   function Pie
     (hdc         : Win32.Windef.HDC;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT;
      nxStartArc  : Win32.INT;
      nyStartArc  : Win32.INT;
      nxEndArc    : Win32.INT;
      nyEndArc    : Win32.INT)
      return Win32.BOOL;

   function PlayMetaFile
     (hdc  : Win32.Windef.HDC;
      hmf  : Win32.Windef.HMETAFILE)
      return Win32.BOOL;

   function PaintRgn
     (hdc  : Win32.Windef.HDC;
      hrgn : Win32.Windef.HRGN)
      return Win32.BOOL;

   function PolyPolygon
     (hdc          : Win32.Windef.HDC;
      lpPoints     : ac_POINT_t;
      lpPolyCounts : Win32.PCINT;
      nCount       : Win32.INT)
      return Win32.BOOL;

   function PtInRegion
     (hrgn  : Win32.Windef.HRGN;
      nXPos : Win32.INT;
      nYPos : Win32.INT)
      return Win32.BOOL;

   function PtVisible
     (hdc   : Win32.Windef.HDC;
      nXPos : Win32.INT;
      nYPos : Win32.INT)
      return Win32.BOOL;

   function RectInRegion
     (hrgn : Win32.Windef.HRGN;
      lprc : ac_RECT_t)
      return Win32.BOOL;

   function RectVisible
     (hdc  : Win32.Windef.HDC;
      lprc : ac_RECT_t)
      return Win32.BOOL;

   function Rectangle
     (hdc         : Win32.Windef.HDC;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT)
      return Win32.BOOL;

   function RestoreDC
     (hdc      : Win32.Windef.HDC;
      nSavedDC : Win32.INT)
      return Win32.BOOL;

   function ResetDCA
     (hdc  : Win32.Windef.HDC;
      lpdm : ac_DEVMODEA_t)
      return Win32.Windef.HDC;

   function ResetDC
     (hdc  : Win32.Windef.HDC;
      lpdm : ac_DEVMODEA_t)
      return Win32.Windef.HDC renames ResetDCA;

   function ResetDCW
     (hdc  : Win32.Windef.HDC;
      lpdm : ac_DEVMODEW_t)
      return Win32.Windef.HDC;

   function RealizePalette (hdc : Win32.Windef.HDC) return Win32.UINT;

   function RemoveFontResourceA
     (lpFileName : Win32.LPCSTR)
      return Win32.BOOL;

   function RemoveFontResource
     (lpFileName : Win32.LPCSTR)
      return Win32.BOOL renames RemoveFontResourceA;

   function RemoveFontResourceW
     (lpFileName : Win32.LPCWSTR)
      return Win32.BOOL;

   function RoundRect
     (hdc            : Win32.Windef.HDC;
      nLeftRect      : Win32.INT;
      nTopRect       : Win32.INT;
      nRightRect     : Win32.INT;
      nBottomRect    : Win32.INT;
      nEllipseWidth  : Win32.INT;
      nEllipseHeight : Win32.INT)
      return Win32.BOOL;

   function ResizePalette
     (hpal     : Win32.Windef.HPALETTE;
      cEntries : Win32.UINT)
      return Win32.BOOL;

   function SaveDC (hdc : Win32.Windef.HDC) return Win32.INT;

   function SelectClipRgn
     (hdc  : Win32.Windef.HDC;
      hrgn : Win32.Windef.HRGN)
      return Win32.INT;

   function ExtSelectClipRgn
     (hdc    : Win32.Windef.HDC;
      hrgn   : Win32.Windef.HRGN;
      fnMode : Win32.INT)
      return Win32.INT;

   function SetMetaRgn (hdc : Win32.Windef.HDC) return Win32.INT;

   function SelectObject
     (hdc     : Win32.Windef.HDC;
      hgdiobj : Win32.Windef.HGDIOBJ)
      return Win32.Windef.HGDIOBJ;

   function SelectPalette
     (hdc              : Win32.Windef.HDC;
      hpal             : Win32.Windef.HPALETTE;
      bForceBackground : Win32.BOOL)
      return Win32.Windef.HPALETTE;

   function SetBkColor
     (hdc    : Win32.Windef.HDC;
      clrref : Win32.Windef.COLORREF)
      return Win32.Windef.COLORREF;

   function SetBkMode
     (hdc      : Win32.Windef.HDC;
      fnBkMode : Win32.INT)
      return Win32.INT;

   function SetBitmapBits
     (hbmp   : Win32.Windef.HBITMAP;
      cBytes : Win32.DWORD;
      lpBits : Win32.PCVOID)
      return Win32.LONG;

   function SetBoundsRect
     (hdc        : Win32.Windef.HDC;
      lprcBounds : ac_RECT_t;
      flags      : Win32.UINT)
      return Win32.UINT;

   function SetDIBits
     (hdc        : Win32.Windef.HDC;
      hbmp       : Win32.Windef.HBITMAP;
      uStartScan : Win32.UINT;
      cScanLines : Win32.UINT;
      lpvBits    : Win32.PCVOID;
      lpbmi      : ac_BITMAPINFO_t;
      fuColorUse : Win32.UINT)
      return Win32.INT;

   function SetDIBitsToDevice
     (hdc        : Win32.Windef.HDC;
      XDest      : Win32.INT;
      YDest      : Win32.INT;
      dwWidth    : Win32.DWORD;
      dwHeight   : Win32.DWORD;
      XSrc       : Win32.INT;
      YSrc       : Win32.INT;
      uStartScan : Win32.UINT;
      cScanLines : Win32.UINT;
      lpvBits    : Win32.PCVOID;
      lpbmi      : ac_BITMAPINFO_t;
      fuColorUse : Win32.UINT)
      return Win32.INT;

   function SetMapperFlags
     (hdc    : Win32.Windef.HDC;
      dwFlag : Win32.DWORD)
      return Win32.DWORD;

   function SetGraphicsMode
     (hdc   : Win32.Windef.HDC;
      iMode : Win32.INT)
      return Win32.INT;

   function SetMapMode
     (hdc       : Win32.Windef.HDC;
      fnmapMode : Win32.INT)
      return Win32.INT;

   function SetMetaFileBitsEx
     (nSize  : Win32.UINT;
      lpData : Win32.PCBYTE)
      return Win32.Windef.HMETAFILE;

   function SetPaletteEntries
     (hpal     : Win32.Windef.HPALETTE;
      iStart   : Win32.UINT;
      cEntries : Win32.UINT;
      lppe     : ac_PALETTEENTRY_t)
      return Win32.UINT;

   function SetPixel
     (hdc     : Win32.Windef.HDC;
      X       : Win32.INT;
      Y       : Win32.INT;
      crColor : Win32.Windef.COLORREF)
      return Win32.Windef.COLORREF;

   function SetPixelV
     (hdc     : Win32.Windef.HDC;
      X       : Win32.INT;
      Y       : Win32.INT;
      crColor : Win32.Windef.COLORREF)
      return Win32.BOOL;

   function SetPixelFormat
     (hdc          : Win32.Windef.HDC;
      iPixelFormat : Win32.INT;
      ppfd         : ac_PIXELFORMATDESCRIPTOR_t)
      return Win32.BOOL;

   function SetPolyFillMode
     (hdc           : Win32.Windef.HDC;
      iPolyFillMode : Win32.INT)
      return Win32.INT;

   function StretchBlt
     (hdcDest     : Win32.Windef.HDC;
      nXOriginDes : Win32.INT;
      nYOriginDes : Win32.INT;
      nWidthDest  : Win32.INT;
      nHeightDest : Win32.INT;
      hdcSrc      : Win32.Windef.HDC;
      nXOriginSrc : Win32.INT;
      nYOriginSrc : Win32.INT;
      nWidthSrc   : Win32.INT;
      nHeightSrc  : Win32.INT;
      dwRop       : Win32.DWORD)
      return Win32.BOOL;

   function SetRectRgn
     (hrgn        : Win32.Windef.HRGN;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT)
      return Win32.BOOL;

   function StretchDIBits
     (hdc         : Win32.Windef.HDC;
      XDest       : Win32.INT;
      YDest       : Win32.INT;
      nDestWidth  : Win32.INT;
      nDestHeight : Win32.INT;
      XSrc        : Win32.INT;
      YSrc        : Win32.INT;
      nSrcWidth   : Win32.INT;
      nSrcHeight  : Win32.INT;
      lpBits      : Win32.PCVOID;
      lpBitsInfo  : ac_BITMAPINFO_t;
      iUsage      : Win32.UINT;
      dwRop       : Win32.DWORD)
      return Win32.INT;

   function SetROP2
     (hdc        : Win32.Windef.HDC;
      fnDrawMode : Win32.INT)
      return Win32.INT;

   function SetStretchBltMode
     (hdc          : Win32.Windef.HDC;
      iStretchMode : Win32.INT)
      return Win32.INT;

   function SetSystemPaletteUse
     (hdc    : Win32.Windef.HDC;
      uUsage : Win32.UINT)
      return Win32.UINT;

   function SetTextCharacterExtra
     (hdc        : Win32.Windef.HDC;
      nCharExtra : Win32.INT)
      return Win32.INT;

   function SetTextColor
     (hdcColor : Win32.Windef.HDC;
      crColor  : Win32.Windef.COLORREF)
      return Win32.Windef.COLORREF;

   function SetTextAlign
     (hdc   : Win32.Windef.HDC;
      fMode : Win32.UINT)
      return Win32.UINT;

   function SetTextJustification
     (hdc         : Win32.Windef.HDC;
      nBreakExtra : Win32.INT;
      nBreakCount : Win32.INT)
      return Win32.BOOL;

   function UpdateColors (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function PlayMetaFileRecord
     (hdc           : Win32.Windef.HDC;
      lpHandletable : access HANDLETABLE;
      lpMetaRecord  : access METARECORD;
      nHandles      : Win32.UINT)
      return Win32.BOOL;

   function EnumMetaFile
     (hdc        : Win32.Windef.HDC;
      hmf        : Win32.Windef.HMETAFILE;
      lpMetaFunc : MFENUMPROC;
      lParam     : Win32.LPARAM)
      return Win32.BOOL;

   function CloseEnhMetaFile
     (hdc  : Win32.Windef.HDC)
      return Win32.Windef.HENHMETAFILE;

   function CopyEnhMetaFileA
     (hemfSrc  : Win32.Windef.HENHMETAFILE;
      lpszFile : Win32.LPCSTR)
      return Win32.Windef.HENHMETAFILE;

   function CopyEnhMetaFile
     (hemfSrc  : Win32.Windef.HENHMETAFILE;
      lpszFile : Win32.LPCSTR)
      return Win32.Windef.HENHMETAFILE renames CopyEnhMetaFileA;

   function CopyEnhMetaFileW
     (hemfSrc  : Win32.Windef.HENHMETAFILE;
      lpszFile : Win32.LPCWSTR)
      return Win32.Windef.HENHMETAFILE;

   function CreateEnhMetaFileA
     (hdcRef        : Win32.Windef.HDC;
      lpFilename    : Win32.LPCSTR;
      lpRect        : ac_RECT_t;
      lpDescription : Win32.LPCSTR)
      return Win32.Windef.HDC;

   function CreateEnhMetaFile
     (hdcRef        : Win32.Windef.HDC;
      lpFilename    : Win32.LPCSTR;
      lpRect        : ac_RECT_t;
      lpDescription : Win32.LPCSTR)
      return Win32.Windef.HDC renames CreateEnhMetaFileA;

   function CreateEnhMetaFileW
     (hdcRef        : Win32.Windef.HDC;
      lpFilename    : Win32.LPCWSTR;
      lpRect        : ac_RECT_t;
      lpDescription : Win32.LPCWSTR)
      return Win32.Windef.HDC;

   function DeleteEnhMetaFile
     (hemf : Win32.Windef.HENHMETAFILE)
      return Win32.BOOL;

   function EnumEnhMetaFile
     (hdc           : Win32.Windef.HDC;
      hemf          : Win32.Windef.HENHMETAFILE;
      lpEnhMetaFunc : ENHMFENUMPROC;
      lpData        : Win32.LPVOID;
      lpRect        : ac_RECT_t)
      return Win32.BOOL;

   function GetEnhMetaFileA
     (lpszMetaFile : Win32.LPCSTR)
      return Win32.Windef.HENHMETAFILE;

   function GetEnhMetaFile
     (lpszMetaFile : Win32.LPCSTR)
      return Win32.Windef.HENHMETAFILE renames GetEnhMetaFileA;

   function GetEnhMetaFileW
     (lpszMetaFile : Win32.LPCWSTR)
      return Win32.Windef.HENHMETAFILE;

   function GetEnhMetaFileBits
     (hemf      : Win32.Windef.HENHMETAFILE;
      cbBuffer  : Win32.UINT;
      lpbBuffer : Win32.LPBYTE)
      return Win32.UINT;

   function GetEnhMetaFileDescriptionA
     (hemf            : Win32.Windef.HENHMETAFILE;
      cchBuffer       : Win32.UINT;
      lpszDescription : Win32.LPSTR)
      return Win32.UINT;

   function GetEnhMetaFileDescription
     (hemf            : Win32.Windef.HENHMETAFILE;
      cchBuffer       : Win32.UINT;
      lpszDescription : Win32.LPSTR)
      return Win32.UINT renames GetEnhMetaFileDescriptionA;

   function GetEnhMetaFileDescriptionW
     (hemf            : Win32.Windef.HENHMETAFILE;
      cchBuffer       : Win32.UINT;
      lpszDescription : Win32.LPWSTR)
      return Win32.UINT;

   function GetEnhMetaFileHeader
     (hemf     : Win32.Windef.HENHMETAFILE;
      cbBuffer : Win32.UINT;
      lpemh    : access ENHMETAHEADER)
      return Win32.UINT;

   function GetEnhMetaFilePaletteEntries
     (hemf     : Win32.Windef.HENHMETAFILE;
      cEntries : Win32.UINT;
      lppe     : access PALETTEENTRY)
      return Win32.UINT;

   function GetWinMetaFileBits
     (hemf      : Win32.Windef.HENHMETAFILE;
      cbBuffer  : Win32.UINT;
      lpbBuffer : Win32.LPBYTE;
      fnMapMode : Win32.INT;
      hdcRef    : Win32.Windef.HDC)
      return Win32.UINT;

   function PlayEnhMetaFile
     (hdc    : Win32.Windef.HDC;
      hemf   : Win32.Windef.HENHMETAFILE;
      lpRect : ac_RECT_t)
      return Win32.BOOL;

   function PlayEnhMetaFileRecord
     (hdc             : Win32.Windef.HDC;
      lpHandletable   : access HANDLETABLE;
      lpEnhMetaRecord : ac_ENHMETARECORD_t;
      nHandles        : Win32.UINT)
      return Win32.BOOL;

   function SetEnhMetaFileBits
     (cbBuffer : Win32.UINT;
      lpData   : Win32.PCBYTE)
      return Win32.Windef.HENHMETAFILE;

   function SetWinMetaFileBits
     (cbBuffer  : Win32.UINT;
      lpbBuffer : Win32.PCBYTE;
      hdcRef    : Win32.Windef.HDC;
      lpmfp     : access METAFILEPICT)
      return Win32.Windef.HENHMETAFILE;

   function GdiComment
     (hdc    : Win32.Windef.HDC;
      cbSize : Win32.UINT;
      lpData : Win32.PCBYTE)
      return Win32.BOOL;

   function GetTextMetricsA
     (hdc  : Win32.Windef.HDC;
      lptm : access TEXTMETRICA)
      return Win32.BOOL;

   function GetTextMetrics
     (hdc  : Win32.Windef.HDC;
      lptm : access TEXTMETRICA)
      return Win32.BOOL renames GetTextMetricsA;

   function GetTextMetricsW
     (hdc  : Win32.Windef.HDC;
      lptm : access TEXTMETRICW)
      return Win32.BOOL;

   function AngleArc
     (hdc         : Win32.Windef.HDC;
      X           : Win32.INT;
      Y           : Win32.INT;
      dwRadius    : Win32.DWORD;
      eStartAngle : Win32.FLOAT;
      eSweepAngle : Win32.FLOAT)
      return Win32.BOOL;

   function PolyPolyline
     (hdc            : Win32.Windef.HDC;
      lppt           : ac_POINT_t;
      lpdwPolyPoints : Win32.PCDWORD;
      cCount         : Win32.DWORD)
      return Win32.BOOL;

   function GetWorldTransform
     (hdc     : Win32.Windef.HDC;
      lpXform : access XFORM)
      return Win32.BOOL;

   function SetWorldTransform
     (hdc     : Win32.Windef.HDC;
      lpXform : access XFORM)
      return Win32.BOOL;

   function ModifyWorldTransform
     (hdc     : Win32.Windef.HDC;
      lpXform : access XFORM;
      iMode   : Win32.DWORD)
      return Win32.BOOL;

   function CombineTransform
     (lpxformResult : access XFORM;
      lpxform1      : access XFORM;
      lpxform2      : access XFORM)
      return Win32.BOOL;

   function CreateDIBSection
     (hdc      : Win32.Windef.HDC;
      pbmi     : ac_BITMAPINFO_t;
      iUsage   : Win32.UINT;
      ppvBits  : access Win32.PVOID;
      hSection : Win32.Winnt.HANDLE;
      dwOffset : Win32.DWORD)
      return Win32.Windef.HBITMAP;

   function GetDIBColorTable
     (hdc         : Win32.Windef.HDC;
      uStartIndex : Win32.UINT;
      cEntries    : Win32.UINT;
      pColors     : access RGBQUAD)
      return Win32.UINT;

   function SetDIBColorTable
     (hdc         : Win32.Windef.HDC;
      uStartIndex : Win32.UINT;
      cEntries    : Win32.UINT;
      pColors     : ac_RGBQUAD_t)
      return Win32.UINT;

   function SetColorAdjustment
     (hdc  : Win32.Windef.HDC;
      lpca : ac_COLORADJUSTMENT_t)
      return Win32.BOOL;

   function GetColorAdjustment
     (hdc  : Win32.Windef.HDC;
      lpca : access COLORADJUSTMENT)
      return Win32.BOOL;

   function CreateHalftonePalette
     (hdc  : Win32.Windef.HDC)
      return Win32.Windef.HPALETTE;

   function StartDocA
     (hdc  : Win32.Windef.HDC;
      lpdi : ac_DOCINFOA_t)
      return Win32.INT;

   function StartDoc
     (hdc  : Win32.Windef.HDC;
      lpdi : ac_DOCINFOA_t)
      return Win32.INT renames StartDocA;

   function StartDocW
     (hdc  : Win32.Windef.HDC;
      lpdi : ac_DOCINFOW_t)
      return Win32.INT;

   function EndDoc (hdc : Win32.Windef.HDC) return Win32.INT;

   function StartPage (hdc : Win32.Windef.HDC) return Win32.INT;

   function EndPage (hdc : Win32.Windef.HDC) return Win32.INT;

   function AbortDoc (hdc : Win32.Windef.HDC) return Win32.INT;

   function SetAbortProc
     (hdc         : Win32.Windef.HDC;
      lpAbortProc : ABORTPROC)
      return Win32.INT;

   function AbortPath_func (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function ArcTo
     (hdc         : Win32.Windef.HDC;
      nLeftRect   : Win32.INT;
      nTopRect    : Win32.INT;
      nRightRect  : Win32.INT;
      nBottomRect : Win32.INT;
      nXRadial1   : Win32.INT;
      nYRadial1   : Win32.INT;
      nXRadial2   : Win32.INT;
      nYRadial2   : Win32.INT)
      return Win32.BOOL;

   function BeginPath (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function CloseFigure (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function EndPath (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function FillPath (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function FlattenPath (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function GetPath
     (hdc      : Win32.Windef.HDC;
      lpPoints : access Win32.Windef.POINT;
      lpTypes  : Win32.LPBYTE;
      nSize    : Win32.INT)
      return Win32.INT;

   function PathToRegion (hdc : Win32.Windef.HDC) return Win32.Windef.HRGN;

   function PolyDraw
     (hdc      : Win32.Windef.HDC;
      lppt     : ac_POINT_t;
      lpbTypes : Win32.PCBYTE;
      cCount   : Win32.INT)
      return Win32.BOOL;

   function SelectClipPath
     (hdc   : Win32.Windef.HDC;
      iMode : Win32.INT)
      return Win32.BOOL;

   function SetArcDirection
     (hdc          : Win32.Windef.HDC;
      ArcDirection : Win32.INT)
      return Win32.INT;

   function SetMiterLimit
     (hdc        : Win32.Windef.HDC;
      eNewLimit  : Win32.FLOAT;
      peOldLimit : Win32.PFLOAT)
      return Win32.BOOL;

   function StrokeAndFillPath (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function StrokePath (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function WidenPath (hdc : Win32.Windef.HDC) return Win32.BOOL;

   function ExtCreatePen
     (dwPenStyle   : Win32.DWORD;
      dwWidth      : Win32.DWORD;
      lplb         : ac_LOGBRUSH_t;
      dwStyleCount : Win32.DWORD;
      lpStyle      : Win32.PCDWORD)
      return Win32.Windef.HPEN;

   function GetMiterLimit
     (hdc     : Win32.Windef.HDC;
      peLimit : Win32.PFLOAT)
      return Win32.BOOL;

   function GetArcDirection (hdc : Win32.Windef.HDC) return Win32.INT;

   function GetObjectA
     (hgdiobj   : Win32.Windef.HGDIOBJ;
      cbBuffer  : Win32.INT;
      lpvObject : Win32.LPVOID)
      return Win32.INT;

   function GetObject
     (hgdiobj   : Win32.Windef.HGDIOBJ;
      cbBuffer  : Win32.INT;
      lpvObject : Win32.LPVOID)
      return Win32.INT renames GetObjectA;

   function GetObjectW
     (hgdiobj   : Win32.Windef.HGDIOBJ;
      cbBuffer  : Win32.INT;
      lpvObject : Win32.LPVOID)
      return Win32.INT;

   function MoveToEx
     (hdc     : Win32.Windef.HDC;
      X       : Win32.INT;
      Y       : Win32.INT;
      lpPoint : Win32.Windef.PPOINT)
      return Win32.BOOL;

   function TextOutA
     (hdc      : Win32.Windef.HDC;
      nXStart  : Win32.INT;
      nYStart  : Win32.INT;
      lpstring : Win32.LPCSTR;
      cbString : Win32.INT)
      return Win32.BOOL;

   function TextOut
     (hdc      : Win32.Windef.HDC;
      nXStart  : Win32.INT;
      nYStart  : Win32.INT;
      lpstring : Win32.LPCSTR;
      cbString : Win32.INT)
      return Win32.BOOL renames TextOutA;

   function TextOutW
     (hdc      : Win32.Windef.HDC;
      nXStart  : Win32.INT;
      nYStart  : Win32.INT;
      lpstring : Win32.LPCWSTR;
      cbString : Win32.INT)
      return Win32.BOOL;

   function ExtTextOutA
     (hdc       : Win32.Windef.HDC;
      X         : Win32.INT;
      Y         : Win32.INT;
      fuOptions : Win32.UINT;
      lprc      : ac_RECT_t;
      lpString  : Win32.LPCSTR;
      cbCount   : Win32.UINT;
      lpDx      : Win32.PCINT)
      return Win32.BOOL;

   function ExtTextOut
     (hdc       : Win32.Windef.HDC;
      X         : Win32.INT;
      Y         : Win32.INT;
      fuOptions : Win32.UINT;
      lprc      : ac_RECT_t;
      lpString  : Win32.LPCSTR;
      cbCount   : Win32.UINT;
      lpDx      : Win32.PCINT)
      return Win32.BOOL renames ExtTextOutA;

   function ExtTextOutW
     (hdc       : Win32.Windef.HDC;
      X         : Win32.INT;
      Y         : Win32.INT;
      fuOptions : Win32.UINT;
      lprc      : ac_RECT_t;
      lpString  : Win32.LPCWSTR;
      cbCount   : Win32.UINT;
      lpDx      : Win32.PCINT)
      return Win32.BOOL;

   function PolyTextOutA
     (hdc      : Win32.Windef.HDC;
      pptxt    : ac_POLYTEXTA_t;
      cStrings : Win32.INT)
      return Win32.BOOL;

   function PolyTextOut
     (hdc      : Win32.Windef.HDC;
      pptxt    : ac_POLYTEXTA_t;
      cStrings : Win32.INT)
      return Win32.BOOL renames PolyTextOutA;

   function PolyTextOutW
     (hdc      : Win32.Windef.HDC;
      pptxt    : access POLYTEXTW;
      cStrings : Win32.INT)
      return Win32.BOOL;

   function CreatePolygonRgn
     (lppt           : ac_POINT_t;
      cPoints        : Win32.INT;
      fnPolyFillMode : Win32.INT)
      return Win32.Windef.HRGN;

   function DPTOLP
     (hdc      : Win32.Windef.HDC;
      lpPoints : access Win32.Windef.POINT;
      nCount   : Win32.INT)
      return Win32.BOOL;

   function LPTODP
     (hdc      : Win32.Windef.HDC;
      lpPoints : access Win32.Windef.POINT;
      nCount   : Win32.INT)
      return Win32.BOOL;

   function Polygon
     (hdc      : Win32.Windef.HDC;
      lpPoints : ac_POINT_t;
      nCount   : Win32.INT)
      return Win32.BOOL;

   function Polyline
     (hdc     : Win32.Windef.HDC;
      lppt    : ac_POINT_t;
      cPoints : Win32.INT)
      return Win32.BOOL;

   function PolyBezier
     (hdc     : Win32.Windef.HDC;
      lppt    : ac_POINT_t;
      cPoints : Win32.DWORD)
      return Win32.BOOL;

   function PolyBezierTo
     (hdc    : Win32.Windef.HDC;
      lppt   : ac_POINT_t;
      cCount : Win32.DWORD)
      return Win32.BOOL;

   function PolylineTo
     (hdc    : Win32.Windef.HDC;
      lppt   : ac_POINT_t;
      cCount : Win32.DWORD)
      return Win32.BOOL;

   function SetViewportExtEx
     (hdc      : Win32.Windef.HDC;
      nXExtent : Win32.INT;
      nYExtent : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function SetViewportOrgEx
     (hdc     : Win32.Windef.HDC;
      X       : Win32.INT;
      Y       : Win32.INT;
      lpPoint : access Win32.Windef.POINT)
      return Win32.BOOL;

   function SetWindowExtEx
     (hdc      : Win32.Windef.HDC;
      nXExtent : Win32.INT;
      nYExtent : Win32.INT;
      lpSize   : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function SetWindowOrgEx
     (hdc     : Win32.Windef.HDC;
      X       : Win32.INT;
      Y       : Win32.INT;
      lpPoint : access Win32.Windef.POINT)
      return Win32.BOOL;

   function OffsetViewportOrgEx
     (hdc      : Win32.Windef.HDC;
      nXOffset : Win32.INT;
      nYOffset : Win32.INT;
      lpPoint  : access Win32.Windef.POINT)
      return Win32.BOOL;

   function OffsetWindowOrgEx
     (hdc      : Win32.Windef.HDC;
      nXOffset : Win32.INT;
      nYOffset : Win32.INT;
      lpPoint  : access Win32.Windef.POINT)
      return Win32.BOOL;

   function ScaleViewportExtEx
     (hdc    : Win32.Windef.HDC;
      Xnum   : Win32.INT;
      Xdenom : Win32.INT;
      Ynum   : Win32.INT;
      Ydenom : Win32.INT;
      lpSize : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function ScaleWindowExtEx
     (hdc    : Win32.Windef.HDC;
      Xnum   : Win32.INT;
      Xdenom : Win32.INT;
      Ynum   : Win32.INT;
      Ydenom : Win32.INT;
      lpSize : Win32.Windef.LPSIZE)
      return Win32.BOOL;

   function SetBitmapDimensionEx
     (hBitmap : Win32.Windef.HBITMAP;
      nWidth  : Win32.INT;
      nHeight : Win32.INT;
      lpSize  : Win32.Windef.PSIZE)
      return Win32.BOOL;

   function SetBrushOrgEx
     (hdc   : Win32.Windef.HDC;
      nXOrg : Win32.INT;
      nYOrg : Win32.INT;
      lppt  : access Win32.Windef.POINT)
      return Win32.BOOL;

   function GetTextFaceA
     (hdc        : Win32.Windef.HDC;
      nCount     : Win32.INT;
      lpFaceName : Win32.LPSTR)
      return Win32.INT;

   function GetTextFace
     (hdc        : Win32.Windef.HDC;
      nCount     : Win32.INT;
      lpFaceName : Win32.LPSTR)
      return Win32.INT renames GetTextFaceA;

   function GetTextFaceW
     (hdc        : Win32.Windef.HDC;
      nCount     : Win32.INT;
      lpFaceName : Win32.LPWSTR)
      return Win32.INT;

   function GetKerningPairsA
     (hdc       : Win32.Windef.HDC;
      nNumPairs : Win32.DWORD;
      lpkrnpair : access KERNINGPAIR)
      return Win32.DWORD;

   function GetKerningPairs
     (hdc       : Win32.Windef.HDC;
      nNumPairs : Win32.DWORD;
      lpkrnpair : access KERNINGPAIR)
      return Win32.DWORD renames GetKerningPairsA;

   function GetKerningPairsW
     (hdc       : Win32.Windef.HDC;
      nNumPairs : Win32.DWORD;
      lpkrnpair : access KERNINGPAIR)
      return Win32.DWORD;

   function GetDCOrgEx
     (hdc     : Win32.Windef.HDC;
      lpPoint : access Win32.Windef.POINT)
      return Win32.BOOL;

   function FixBrushOrgEx
     (hdc   : Win32.Windef.HDC;
      nXOrg : Win32.INT;
      nYOrg : Win32.INT;
      lppt  : access Win32.Windef.POINT)
      return Win32.BOOL;

   function UnrealizeObject
     (hgdiobj : Win32.Windef.HGDIOBJ)
      return Win32.BOOL;

   function GdiFlush return Win32.BOOL;

   function GdiSetBatchLimit (dwLimit : Win32.DWORD) return Win32.DWORD;

   function GdiGetBatchLimit return Win32.DWORD;

   function wglCreateContext
     (hdc  : Win32.Windef.HDC)
      return Win32.Windef.HGLRC;

   function wglDeleteContext (hglrc : Win32.Windef.HGLRC) return Win32.BOOL;

   function wglGetCurrentContext return Win32.Windef.HGLRC;

   function wglGetCurrentDC return Win32.Windef.HDC;

   function wglMakeCurrent
     (hdc   : Win32.Windef.HDC;
      hglrc : Win32.Windef.HGLRC)
      return Win32.BOOL;

   function wglUseFontBitmapsA
     (hdc      : Win32.Windef.HDC;
      first    : Win32.DWORD;
      count    : Win32.DWORD;
      listBase : Win32.DWORD)
      return Win32.BOOL;

   function wglUseFontBitmaps
     (hdc      : Win32.Windef.HDC;
      first    : Win32.DWORD;
      count    : Win32.DWORD;
      listBase : Win32.DWORD)
      return Win32.BOOL renames wglUseFontBitmapsA;

   function wglUseFontBitmapsW
     (hdc      : Win32.Windef.HDC;
      first    : Win32.DWORD;
      count    : Win32.DWORD;
      listBase : Win32.DWORD)
      return Win32.BOOL;

   function SwapBuffers (hdc : Win32.Windef.HDC) return Win32.BOOL;

private

   pragma Convention (C, XFORM);
   pragma Convention (C, BITMAP);
   pragma Convention (C, RGBTRIPLE);
   pragma Convention (C, RGBQUAD);
   pragma Convention (C, BITMAPCOREHEADER);
   pragma Convention (C, BITMAPINFOHEADER);
   pragma Convention (C, BITMAPINFO);
   pragma Convention (C, BITMAPCOREINFO);
   pragma Convention (C, BITMAPFILEHEADER);
   pragma Convention (C, HANDLETABLE);
   pragma Convention (C, METARECORD);
   pragma Convention (C, METAFILEPICT);
   pragma Convention (C, METAHEADER);
   pragma Convention (C, ENHMETARECORD);
   pragma Convention (C, ENHMETAHEADER);
   pragma Convention (C, TEXTMETRICA);
   pragma Convention (C, TEXTMETRICW);
   pragma Convention (C, NEWTEXTMETRICA);
   pragma Convention (C, NEWTEXTMETRICW);
   pragma Convention (C, PELARRAY);
   pragma Convention (C, LOGBRUSH);
   pragma Convention (C, LOGBRUSH32);
   pragma Convention (C, LOGPEN);
   pragma Convention (C, EXTLOGPEN);
   pragma Convention (C, PALETTEENTRY);
   pragma Convention (C, LOGPALETTE);
   pragma Convention (C, LOGFONTA);
   pragma Convention (C, LOGFONTW);
   pragma Convention (C, ENUMLOGFONTA);
   pragma Convention (C, ENUMLOGFONTW);
   pragma Convention (C, PANOSE);
   pragma Convention (C, EXTLOGFONTA);
   pragma Convention (C, EXTLOGFONTW);
   pragma Convention (C, DEVMODEA);
   pragma Convention (C, DEVMODEW);
   pragma Convention (C, RGNDATAHEADER);
   pragma Convention (C, RGNDATA);
   pragma Convention (C, ABC);
   pragma Convention (C, ABCFLOAT);
   pragma Convention (C, OUTLINETEXTMETRICA);
   pragma Convention (C, OUTLINETEXTMETRICW);
   pragma Convention (C, POLYTEXTA);
   pragma Convention (C, POLYTEXTW);
   pragma Convention (C, FIXED);
   pragma Convention (C, MAT2);
   pragma Convention (C, GLYPHMETRICS);
   pragma Convention (C, POINTFX);
   pragma Convention (C, TTPOLYCURVE);
   pragma Convention (C, TTPOLYGONHEADER);
   pragma Convention (C, RASTERIZER_STATUS);
   pragma Convention (C, PIXELFORMATDESCRIPTOR);
   pragma Convention (C, DIBSECTION);
   pragma Convention (C, COLORADJUSTMENT);
   pragma Convention (C, DOCINFOA);
   pragma Convention (C, DOCINFOW);
   pragma Convention (C, KERNINGPAIR);
   pragma Convention (C, EMR);
   pragma Convention (C, EMRTEXT);
   pragma Convention (C, ABORTPATH);
   pragma Convention (C, EMRSELECTCLIPPATH);
   pragma Convention (C, EMRSETMITERLIMIT);
   pragma Convention (C, EMRRESTOREDC);
   pragma Convention (C, EMRSETARCDIRECTION);
   pragma Convention (C, EMRSETMAPPERFLAGS);
   pragma Convention (C, EMRSETTEXTCOLOR);
   pragma Convention (C, EMRSELECTOBJECT);
   pragma Convention (C, EMRSELECTPALETTE);
   pragma Convention (C, EMRRESIZEPALETTE);
   pragma Convention (C, EMRSETPALETTEENTRIES);
   pragma Convention (C, EMRSETCOLORADJUSTMENT);
   pragma Convention (C, EMRGDICOMMENT);
   pragma Convention (C, EMREOF);
   pragma Convention (C, EMRLINETO);
   pragma Convention (C, EMROFFSETCLIPRGN);
   pragma Convention (C, EMRFILLPATH);
   pragma Convention (C, EMREXCLUDECLIPRECT);
   pragma Convention (C, EMRSETVIEWPORTORGEX);
   pragma Convention (C, EMRSETVIEWPORTEXTEX);
   pragma Convention (C, EMRSCALEVIEWPORTEXTEX);
   pragma Convention (C, EMRSETWORLDTRANSFORM);
   pragma Convention (C, EMRMODIFYWORLDTRANSFORM);
   pragma Convention (C, EMRSETPIXELV);
   pragma Convention (C, EMREXTFLOODFILL);
   pragma Convention (C, EMRELLIPSE);
   pragma Convention (C, EMRROUNDRECT);
   pragma Convention (C, EMRARC);
   pragma Convention (C, EMRANGLEARC);
   pragma Convention (C, EMRPOLYLINE);
   pragma Convention (C, EMRPOLYLINE16);
   pragma Convention (C, EMRPOLYDRAW);
   pragma Convention (C, EMRPOLYDRAW16);
   pragma Convention (C, EMRPOLYPOLYLINE);
   pragma Convention (C, EMRPOLYPOLYLINE16);
   pragma Convention (C, EMRINVERTRGN);
   pragma Convention (C, EMRFILLRGN);
   pragma Convention (C, EMRFRAMERGN);
   pragma Convention (C, EMREXTSELECTCLIPRGN);
   pragma Convention (C, EMREXTTEXTOUTA);
   pragma Convention (C, EMRPOLYTEXTOUTA);
   pragma Convention (C, EMRBITBLT);
   pragma Convention (C, EMRSTRETCHBLT);
   pragma Convention (C, EMRMASKBLT);
   pragma Convention (C, EMRPLGBLT);
   pragma Convention (C, EMRSETDIBITSTODEVICE);
   pragma Convention (C, EMRSTRETCHDIBITS);
   pragma Convention (C, EMREXTCREATEFONTINDIRECTW);
   pragma Convention (C, EMRCREATEPALETTE);
   pragma Convention (C, EMRCREATEPEN);
   pragma Convention (C, EMREXTCREATEPEN);
   pragma Convention (C, EMRCREATEBRUSHINDIRECT);
   pragma Convention (C, EMRCREATEMONOBRUSH);
   pragma Convention (C, EMRCREATEDIBPATTERNBRUSHPT);
   pragma Convention (C, EMRFORMAT);

   function To_Handle is new Ada.Unchecked_Conversion (
      ULONG_PTR,
      Win32.Winnt.HANDLE);

   HGDI_ERROR                  : constant Win32.Winnt.HANDLE :=
      To_Handle (ULONG_PTR'Last);

   pragma Inline (MAKEROP4);
   pragma Inline (MAKEPOINTS);
   pragma Inline (RGB);
   pragma Inline (PALETTERGB);
   pragma Inline (PALETTEINDEX);
   pragma Inline (GetRValue);
   pragma Inline (GetGValue);
   pragma Inline (GetBValue);

   pragma Import (Stdcall, AddFontResourceA, "AddFontResourceA");
   pragma Import (Stdcall, AddFontResourceW, "AddFontResourceW");
   pragma Import (Stdcall, AnimatePalette, "AnimatePalette");
   pragma Import (Stdcall, Arc, "Arc");
   pragma Import (Stdcall, BitBlt, "BitBlt");
   pragma Import (Stdcall, CancelDC, "CancelDC");
   pragma Import (Stdcall, Chord, "Chord");
   pragma Import (Stdcall, ChoosePixelFormat, "ChoosePixelFormat");
   pragma Import (Stdcall, CloseMetaFile, "CloseMetaFile");
   pragma Import (Stdcall, CombineRgn, "CombineRgn");
   pragma Import (Stdcall, CopyMetaFileA, "CopyMetaFileA");
   pragma Import (Stdcall, CopyMetaFileW, "CopyMetaFileW");
   pragma Import (Stdcall, CreateBitmap, "CreateBitmap");
   pragma Import (Stdcall, CreateBitmapIndirect, "CreateBitmapIndirect");
   pragma Import (Stdcall, CreateBrushIndirect, "CreateBrushIndirect");
   pragma Import (Stdcall, CreateCompatibleBitmap, "CreateCompatibleBitmap");
   pragma Import
     (Stdcall,
      CreateDiscardableBitmap,
      "CreateDiscardableBitmap");
   pragma Import (Stdcall, CreateCompatibleDC, "CreateCompatibleDC");
   pragma Import (Stdcall, CreateDCA, "CreateDCA");
   pragma Import (Stdcall, CreateDCW, "CreateDCW");
   pragma Import (Stdcall, CreateDIBitmap, "CreateDIBitmap");
   pragma Import (Stdcall, CreateDIBPatternBrush, "CreateDIBPatternBrush");
   pragma Import
     (Stdcall,
      CreateDIBPatternBrushPt,
      "CreateDIBPatternBrushPt");
   pragma Import (Stdcall, CreateEllipticRgn, "CreateEllipticRgn");
   pragma Import
     (Stdcall,
      CreateEllipticRgnIndirect,
      "CreateEllipticRgnIndirect");
   pragma Import (Stdcall, CreateFontIndirectA, "CreateFontIndirectA");
   pragma Import (Stdcall, CreateFontIndirectW, "CreateFontIndirectW");
   pragma Import (Stdcall, CreateFontA, "CreateFontA");
   pragma Import (Stdcall, CreateFontW, "CreateFontW");
   pragma Import (Stdcall, CreateHatchBrush, "CreateHatchBrush");
   pragma Import (Stdcall, CreateICA, "CreateICA");
   pragma Import (Stdcall, CreateICW, "CreateICW");
   pragma Import (Stdcall, CreateMetaFileA, "CreateMetaFileA");
   pragma Import (Stdcall, CreateMetaFileW, "CreateMetaFileW");
   pragma Import (Stdcall, CreatePalette, "CreatePalette");
   pragma Import (Stdcall, CreatePen, "CreatePen");
   pragma Import (Stdcall, CreatePenIndirect, "CreatePenIndirect");
   pragma Import (Stdcall, CreatePolyPolygonRgn, "CreatePolyPolygonRgn");
   pragma Import (Stdcall, CreatePatternBrush, "CreatePatternBrush");
   pragma Import (Stdcall, CreateRectRgn, "CreateRectRgn");
   pragma Import (Stdcall, CreateRectRgnIndirect, "CreateRectRgnIndirect");
   pragma Import (Stdcall, CreateRoundRectRgn, "CreateRoundRectRgn");
   pragma Import
     (Stdcall,
      CreateScalableFontResourceA,
      "CreateScalableFontResourceA");
   pragma Import
     (Stdcall,
      CreateScalableFontResourceW,
      "CreateScalableFontResourceW");
   pragma Import (Stdcall, CreateSolidBrush, "CreateSolidBrush");
   pragma Import (Stdcall, DeleteDC, "DeleteDC");
   pragma Import (Stdcall, DeleteMetaFile, "DeleteMetaFile");
   pragma Import (Stdcall, DeleteObject, "DeleteObject");
   pragma Import (Stdcall, DescribePixelFormat, "DescribePixelFormat");
   pragma Import (Stdcall, DeviceCapabilitiesA, "DeviceCapabilitiesA");
   pragma Import (Stdcall, DeviceCapabilitiesW, "DeviceCapabilitiesW");
   pragma Import (Stdcall, DrawEscape, "DrawEscape");
   pragma Import (Stdcall, Ellipse, "Ellipse");
   pragma Import (Stdcall, EnumFontFamiliesA, "EnumFontFamiliesA");
   pragma Import (Stdcall, EnumFontFamiliesW, "EnumFontFamiliesW");
   pragma Import (Stdcall, EnumFontsA, "EnumFontsA");
   pragma Import (Stdcall, EnumFontsW, "EnumFontsW");
   pragma Import (Stdcall, EnumObjects, "EnumObjects");
   pragma Import (Stdcall, EqualRgn, "EqualRgn");
   pragma Import (Stdcall, Escape, "Escape");
   pragma Import (Stdcall, ExtEscape, "ExtEscape");
   pragma Import (Stdcall, ExcludeClipRect, "ExcludeClipRect");
   pragma Import (Stdcall, ExtCreateRegion, "ExtCreateRegion");
   pragma Import (Stdcall, ExtFloodFill, "ExtFloodFill");
   pragma Import (Stdcall, FillRgn, "FillRgn");
   pragma Import (Stdcall, FloodFill, "FloodFill");
   pragma Import (Stdcall, FrameRgn, "FrameRgn");
   pragma Import (Stdcall, GetROP2, "GetROP2");
   pragma Import (Stdcall, GetAspectRatioFilterEx, "GetAspectRatioFilterEx");
   pragma Import (Stdcall, GetBkColor, "GetBkColor");
   pragma Import (Stdcall, GetBkMode, "GetBkMode");
   pragma Import (Stdcall, GetBitmapBits, "GetBitmapBits");
   pragma Import (Stdcall, GetBitmapDimensionEx, "GetBitmapDimensionEx");
   pragma Import (Stdcall, GetBoundsRect, "GetBoundsRect");
   pragma Import (Stdcall, GetBrushOrgEx, "GetBrushOrgEx");
   pragma Import (Stdcall, GetCharWidthA, "GetCharWidthA");
   pragma Import (Stdcall, GetCharWidthW, "GetCharWidthW");
   pragma Import (Stdcall, GetCharWidth32A, "GetCharWidth32A");
   pragma Import (Stdcall, GetCharWidth32W, "GetCharWidth32W");
   pragma Import (Stdcall, GetCharWidthFloatA, "GetCharWidthFloatA");
   pragma Import (Stdcall, GetCharWidthFloatW, "GetCharWidthFloatW");
   pragma Import (Stdcall, GetCharABCWidthsA, "GetCharABCWidthsA");
   pragma Import (Stdcall, GetCharABCWidthsW, "GetCharABCWidthsW");
   pragma Import (Stdcall, GetCharABCWidthsFloatA, "GetCharABCWidthsFloatA");
   pragma Import (Stdcall, GetCharABCWidthsFloatW, "GetCharABCWidthsFloatW");
   pragma Import (Stdcall, GetClipBox, "GetClipBox");
   pragma Import (Stdcall, GetClipRgn, "GetClipRgn");
   pragma Import (Stdcall, GetMetaRgn, "GetMetaRgn");
   pragma Import (Stdcall, GetCurrentObject, "GetCurrentObject");
   pragma Import (Stdcall, GetCurrentPositionEx, "GetCurrentPositionEx");
   pragma Import (Stdcall, GetDeviceCaps, "GetDeviceCaps");
   pragma Import (Stdcall, GetDIBits, "GetDIBits");
   pragma Import (Stdcall, GetFontData, "GetFontData");
   pragma Import (Stdcall, GetGlyphOutlineA, "GetGlyphOutlineA");
   pragma Import (Stdcall, GetGlyphOutlineW, "GetGlyphOutlineW");
   pragma Import (Stdcall, GetGraphicsMode, "GetGraphicsMode");
   pragma Import (Stdcall, GetMapMode, "GetMapMode");
   pragma Import (Stdcall, GetMetaFileBitsEx, "GetMetaFileBitsEx");
   pragma Import (Stdcall, GetMetaFileA, "GetMetaFileA");
   pragma Import (Stdcall, GetMetaFileW, "GetMetaFileW");
   pragma Import (Stdcall, GetNearestColor, "GetNearestColor");
   pragma Import (Stdcall, GetNearestPaletteIndex, "GetNearestPaletteIndex");
   pragma Import (Stdcall, GetObjectType, "GetObjectType");
   pragma Import (Stdcall, GetOutlineTextMetricsA, "GetOutlineTextMetricsA");
   pragma Import (Stdcall, GetOutlineTextMetricsW, "GetOutlineTextMetricsW");
   pragma Import (Stdcall, GetPaletteEntries, "GetPaletteEntries");
   pragma Import (Stdcall, GetPixel, "GetPixel");
   pragma Import (Stdcall, GetPixelFormat, "GetPixelFormat");
   pragma Import (Stdcall, GetPolyFillMode, "GetPolyFillMode");
   pragma Import (Stdcall, GetRasterizerCaps, "GetRasterizerCaps");
   pragma Import (Stdcall, GetRegionData, "GetRegionData");
   pragma Import (Stdcall, GetRgnBox, "GetRgnBox");
   pragma Import (Stdcall, GetStockObject, "GetStockObject");
   pragma Import (Stdcall, GetStretchBltMode, "GetStretchBltMode");
   pragma Import
     (Stdcall,
      GetSystemPaletteEntries,
      "GetSystemPaletteEntries");
   pragma Import (Stdcall, GetSystemPaletteUse, "GetSystemPaletteUse");
   pragma Import (Stdcall, GetTextCharacterExtra, "GetTextCharacterExtra");
   pragma Import (Stdcall, GetTextAlign, "GetTextAlign");
   pragma Import (Stdcall, GetTextColor, "GetTextColor");
   pragma Import (Stdcall, GetTextExtentPointA, "GetTextExtentPointA");
   pragma Import (Stdcall, GetTextExtentPointW, "GetTextExtentPointW");
   pragma Import (Stdcall, GetTextExtentPoint32A, "GetTextExtentPoint32A");
   pragma Import (Stdcall, GetTextExtentPoint32W, "GetTextExtentPoint32W");
   pragma Import (Stdcall, GetTextExtentExPointA, "GetTextExtentExPointA");
   pragma Import (Stdcall, GetTextExtentExPointW, "GetTextExtentExPointW");
   pragma Import (Stdcall, GetViewportExtEx, "GetViewportExtEx");
   pragma Import (Stdcall, GetViewportOrgEx, "GetViewportOrgEx");
   pragma Import (Stdcall, GetWindowExtEx, "GetWindowExtEx");
   pragma Import (Stdcall, GetWindowOrgEx, "GetWindowOrgEx");
   pragma Import (Stdcall, IntersectClipRect, "IntersectClipRect");
   pragma Import (Stdcall, InvertRgn, "InvertRgn");
   pragma Import (Stdcall, LineDDA, "LineDDA");
   pragma Import (Stdcall, LineTo, "LineTo");
   pragma Import (Stdcall, MaskBlt, "MaskBlt");
   pragma Import (Stdcall, PlgBlt, "PlgBlt");
   pragma Import (Stdcall, OffsetClipRgn, "OffsetClipRgn");
   pragma Import (Stdcall, OffsetRgn, "OffsetRgn");
   pragma Import (Stdcall, PatBlt, "PatBlt");
   pragma Import (Stdcall, Pie, "Pie");
   pragma Import (Stdcall, PlayMetaFile, "PlayMetaFile");
   pragma Import (Stdcall, PaintRgn, "PaintRgn");
   pragma Import (Stdcall, PolyPolygon, "PolyPolygon");
   pragma Import (Stdcall, PtInRegion, "PtInRegion");
   pragma Import (Stdcall, PtVisible, "PtVisible");
   pragma Import (Stdcall, RectInRegion, "RectInRegion");
   pragma Import (Stdcall, RectVisible, "RectVisible");
   pragma Import (Stdcall, Rectangle, "Rectangle");
   pragma Import (Stdcall, RestoreDC, "RestoreDC");
   pragma Import (Stdcall, ResetDCA, "ResetDCA");
   pragma Import (Stdcall, ResetDCW, "ResetDCW");
   pragma Import (Stdcall, RealizePalette, "RealizePalette");
   pragma Import (Stdcall, RemoveFontResourceA, "RemoveFontResourceA");
   pragma Import (Stdcall, RemoveFontResourceW, "RemoveFontResourceW");
   pragma Import (Stdcall, RoundRect, "RoundRect");
   pragma Import (Stdcall, ResizePalette, "ResizePalette");
   pragma Import (Stdcall, SaveDC, "SaveDC");
   pragma Import (Stdcall, SelectClipRgn, "SelectClipRgn");
   pragma Import (Stdcall, ExtSelectClipRgn, "ExtSelectClipRgn");
   pragma Import (Stdcall, SetMetaRgn, "SetMetaRgn");
   pragma Import (Stdcall, SelectObject, "SelectObject");
   pragma Import (Stdcall, SelectPalette, "SelectPalette");
   pragma Import (Stdcall, SetBkColor, "SetBkColor");
   pragma Import (Stdcall, SetBkMode, "SetBkMode");
   pragma Import (Stdcall, SetBitmapBits, "SetBitmapBits");
   pragma Import (Stdcall, SetBoundsRect, "SetBoundsRect");
   pragma Import (Stdcall, SetDIBits, "SetDIBits");
   pragma Import (Stdcall, SetDIBitsToDevice, "SetDIBitsToDevice");
   pragma Import (Stdcall, SetMapperFlags, "SetMapperFlags");
   pragma Import (Stdcall, SetGraphicsMode, "SetGraphicsMode");
   pragma Import (Stdcall, SetMapMode, "SetMapMode");
   pragma Import (Stdcall, SetMetaFileBitsEx, "SetMetaFileBitsEx");
   pragma Import (Stdcall, SetPaletteEntries, "SetPaletteEntries");
   pragma Import (Stdcall, SetPixel, "SetPixel");
   pragma Import (Stdcall, SetPixelV, "SetPixelV");
   pragma Import (Stdcall, SetPixelFormat, "SetPixelFormat");
   pragma Import (Stdcall, SetPolyFillMode, "SetPolyFillMode");
   pragma Import (Stdcall, StretchBlt, "StretchBlt");
   pragma Import (Stdcall, SetRectRgn, "SetRectRgn");
   pragma Import (Stdcall, StretchDIBits, "StretchDIBits");
   pragma Import (Stdcall, SetROP2, "SetROP2");
   pragma Import (Stdcall, SetStretchBltMode, "SetStretchBltMode");
   pragma Import (Stdcall, SetSystemPaletteUse, "SetSystemPaletteUse");
   pragma Import (Stdcall, SetTextCharacterExtra, "SetTextCharacterExtra");
   pragma Import (Stdcall, SetTextColor, "SetTextColor");
   pragma Import (Stdcall, SetTextAlign, "SetTextAlign");
   pragma Import (Stdcall, SetTextJustification, "SetTextJustification");
   pragma Import (Stdcall, UpdateColors, "UpdateColors");
   pragma Import (Stdcall, PlayMetaFileRecord, "PlayMetaFileRecord");
   pragma Import (Stdcall, EnumMetaFile, "EnumMetaFile");
   pragma Import (Stdcall, CloseEnhMetaFile, "CloseEnhMetaFile");
   pragma Import (Stdcall, CopyEnhMetaFileA, "CopyEnhMetaFileA");
   pragma Import (Stdcall, CopyEnhMetaFileW, "CopyEnhMetaFileW");
   pragma Import (Stdcall, CreateEnhMetaFileA, "CreateEnhMetaFileA");
   pragma Import (Stdcall, CreateEnhMetaFileW, "CreateEnhMetaFileW");
   pragma Import (Stdcall, DeleteEnhMetaFile, "DeleteEnhMetaFile");
   pragma Import (Stdcall, EnumEnhMetaFile, "EnumEnhMetaFile");
   pragma Import (Stdcall, GetEnhMetaFileA, "GetEnhMetaFileA");
   pragma Import (Stdcall, GetEnhMetaFileW, "GetEnhMetaFileW");
   pragma Import (Stdcall, GetEnhMetaFileBits, "GetEnhMetaFileBits");
   pragma Import
     (Stdcall,
      GetEnhMetaFileDescriptionA,
      "GetEnhMetaFileDescriptionA");
   pragma Import
     (Stdcall,
      GetEnhMetaFileDescriptionW,
      "GetEnhMetaFileDescriptionW");
   pragma Import (Stdcall, GetEnhMetaFileHeader, "GetEnhMetaFileHeader");
   pragma Import
     (Stdcall,
      GetEnhMetaFilePaletteEntries,
      "GetEnhMetaFilePaletteEntries");
   pragma Import (Stdcall, GetWinMetaFileBits, "GetWinMetaFileBits");
   pragma Import (Stdcall, PlayEnhMetaFile, "PlayEnhMetaFile");
   pragma Import (Stdcall, PlayEnhMetaFileRecord, "PlayEnhMetaFileRecord");
   pragma Import (Stdcall, SetEnhMetaFileBits, "SetEnhMetaFileBits");
   pragma Import (Stdcall, SetWinMetaFileBits, "SetWinMetaFileBits");
   pragma Import (Stdcall, GdiComment, "GdiComment");
   pragma Import (Stdcall, GetTextMetricsA, "GetTextMetricsA");
   pragma Import (Stdcall, GetTextMetricsW, "GetTextMetricsW");
   pragma Import (Stdcall, AngleArc, "AngleArc");
   pragma Import (Stdcall, PolyPolyline, "PolyPolyline");
   pragma Import (Stdcall, GetWorldTransform, "GetWorldTransform");
   pragma Import (Stdcall, SetWorldTransform, "SetWorldTransform");
   pragma Import (Stdcall, ModifyWorldTransform, "ModifyWorldTransform");
   pragma Import (Stdcall, CombineTransform, "CombineTransform");
   pragma Import (Stdcall, CreateDIBSection, "CreateDIBSection");
   pragma Import (Stdcall, GetDIBColorTable, "GetDIBColorTable");
   pragma Import (Stdcall, SetDIBColorTable, "SetDIBColorTable");
   pragma Import (Stdcall, SetColorAdjustment, "SetColorAdjustment");
   pragma Import (Stdcall, GetColorAdjustment, "GetColorAdjustment");
   pragma Import (Stdcall, CreateHalftonePalette, "CreateHalftonePalette");
   pragma Import (Stdcall, StartDocA, "StartDocA");
   pragma Import (Stdcall, StartDocW, "StartDocW");
   pragma Import (Stdcall, EndDoc, "EndDoc");
   pragma Import (Stdcall, StartPage, "StartPage");
   pragma Import (Stdcall, EndPage, "EndPage");
   pragma Import (Stdcall, AbortDoc, "AbortDoc");
   pragma Import (Stdcall, SetAbortProc, "SetAbortProc");
   pragma Import (Stdcall, AbortPath_func, "AbortPath");
   pragma Import (Stdcall, ArcTo, "ArcTo");
   pragma Import (Stdcall, BeginPath, "BeginPath");
   pragma Import (Stdcall, CloseFigure, "CloseFigure");
   pragma Import (Stdcall, EndPath, "EndPath");
   pragma Import (Stdcall, FillPath, "FillPath");
   pragma Import (Stdcall, FlattenPath, "FlattenPath");
   pragma Import (Stdcall, GetPath, "GetPath");
   pragma Import (Stdcall, PathToRegion, "PathToRegion");
   pragma Import (Stdcall, PolyDraw, "PolyDraw");
   pragma Import (Stdcall, SelectClipPath, "SelectClipPath");
   pragma Import (Stdcall, SetArcDirection, "SetArcDirection");
   pragma Import (Stdcall, SetMiterLimit, "SetMiterLimit");
   pragma Import (Stdcall, StrokeAndFillPath, "StrokeAndFillPath");
   pragma Import (Stdcall, StrokePath, "StrokePath");
   pragma Import (Stdcall, WidenPath, "WidenPath");
   pragma Import (Stdcall, ExtCreatePen, "ExtCreatePen");
   pragma Import (Stdcall, GetMiterLimit, "GetMiterLimit");
   pragma Import (Stdcall, GetArcDirection, "GetArcDirection");
   pragma Import (Stdcall, GetObjectA, "GetObjectA");
   pragma Import (Stdcall, GetObjectW, "GetObjectW");
   pragma Import (Stdcall, MoveToEx, "MoveToEx");
   pragma Import (Stdcall, TextOutA, "TextOutA");
   pragma Import (Stdcall, TextOutW, "TextOutW");
   pragma Import (Stdcall, ExtTextOutA, "ExtTextOutA");
   pragma Import (Stdcall, ExtTextOutW, "ExtTextOutW");
   pragma Import (Stdcall, PolyTextOutA, "PolyTextOutA");
   pragma Import (Stdcall, PolyTextOutW, "PolyTextOutW");
   pragma Import (Stdcall, CreatePolygonRgn, "CreatePolygonRgn");
   pragma Import (Stdcall, DPTOLP, "DPtoLP");
   pragma Import (Stdcall, LPTODP, "LPtoDP");
   pragma Import (Stdcall, Polygon, "Polygon");
   pragma Import (Stdcall, Polyline, "Polyline");
   pragma Import (Stdcall, PolyBezier, "PolyBezier");
   pragma Import (Stdcall, PolyBezierTo, "PolyBezierTo");
   pragma Import (Stdcall, PolylineTo, "PolylineTo");
   pragma Import (Stdcall, SetViewportExtEx, "SetViewportExtEx");
   pragma Import (Stdcall, SetViewportOrgEx, "SetViewportOrgEx");
   pragma Import (Stdcall, SetWindowExtEx, "SetWindowExtEx");
   pragma Import (Stdcall, SetWindowOrgEx, "SetWindowOrgEx");
   pragma Import (Stdcall, OffsetViewportOrgEx, "OffsetViewportOrgEx");
   pragma Import (Stdcall, OffsetWindowOrgEx, "OffsetWindowOrgEx");
   pragma Import (Stdcall, ScaleViewportExtEx, "ScaleViewportExtEx");
   pragma Import (Stdcall, ScaleWindowExtEx, "ScaleWindowExtEx");
   pragma Import (Stdcall, SetBitmapDimensionEx, "SetBitmapDimensionEx");
   pragma Import (Stdcall, SetBrushOrgEx, "SetBrushOrgEx");
   pragma Import (Stdcall, GetTextFaceA, "GetTextFaceA");
   pragma Import (Stdcall, GetTextFaceW, "GetTextFaceW");
   pragma Import (Stdcall, GetKerningPairsA, "GetKerningPairsA");
   pragma Import (Stdcall, GetKerningPairsW, "GetKerningPairsW");
   pragma Import (Stdcall, GetDCOrgEx, "GetDCOrgEx");
   pragma Import (Stdcall, FixBrushOrgEx, "FixBrushOrgEx");
   pragma Import (Stdcall, UnrealizeObject, "UnrealizeObject");
   pragma Import (Stdcall, GdiFlush, "GdiFlush");
   pragma Import (Stdcall, GdiSetBatchLimit, "GdiSetBatchLimit");
   pragma Import (Stdcall, GdiGetBatchLimit, "GdiGetBatchLimit");
   pragma Import (Stdcall, wglCreateContext, "wglCreateContext");
   pragma Import (Stdcall, wglDeleteContext, "wglDeleteContext");
   pragma Import (Stdcall, wglGetCurrentContext, "wglGetCurrentContext");
   pragma Import (Stdcall, wglGetCurrentDC, "wglGetCurrentDC");
   pragma Import (Stdcall, wglMakeCurrent, "wglMakeCurrent");
   pragma Import (Stdcall, wglUseFontBitmapsA, "wglUseFontBitmapsA");
   pragma Import (Stdcall, wglUseFontBitmapsW, "wglUseFontBitmapsW");
   pragma Import (Stdcall, SwapBuffers, "SwapBuffers");

end Win32.Wingdi;
