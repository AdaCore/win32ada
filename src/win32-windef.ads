--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-windef.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
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

with Win32.Utils;
with Win32.Winnt;

package Win32.Windef is

   MAX_PATH : constant :=  260;                  --  windef.h :37
   DM_UPDATE : constant :=  1;                    --  windef.h :263
   DM_COPY : constant :=  2;                    --  windef.h :264
   DM_PROMPT : constant :=  4;                    --  windef.h :265
   DM_MODIFY : constant :=  8;                    --  windef.h :266
   DM_IN_BUFFER : constant :=  8;                    --  windef.h :268
   DM_IN_PROMPT : constant :=  4;                    --  windef.h :269
   DM_OUT_BUFFER : constant :=  2;                    --  windef.h :270
   DM_OUT_DEFAULT : constant :=  1;                    --  windef.h :271
   DC_FIELDS : constant :=  1;                    --  windef.h :274
   DC_PAPERS : constant :=  2;                    --  windef.h :275
   DC_PAPERSIZE : constant :=  3;                    --  windef.h :276
   DC_MINEXTENT : constant :=  4;                    --  windef.h :277
   DC_MAXEXTENT : constant :=  5;                    --  windef.h :278
   DC_BINS : constant :=  6;                    --  windef.h :279
   DC_DUPLEX : constant :=  7;                    --  windef.h :280
   DC_SIZE : constant :=  8;                    --  windef.h :281
   DC_EXTRA : constant :=  9;                    --  windef.h :282
   DC_VERSION : constant :=  10;                   --  windef.h :283
   DC_DRIVER : constant :=  11;                   --  windef.h :284
   DC_BINNAMES : constant :=  12;                   --  windef.h :285
   DC_ENUMRESOLUTIONS : constant :=  13;                   --  windef.h :286
   DC_FILEDEPENDENCIES : constant :=  14;                   --  windef.h :287
   DC_TRUETYPE : constant :=  15;                   --  windef.h :288
   DC_PAPERNAMES : constant :=  16;                   --  windef.h :289
   DC_ORIENTATION : constant :=  17;                   --  windef.h :290
   DC_COPIES : constant :=  18;                   --  windef.h :291

   type HFILE is new Win32.INT;                            --  windef.h :211
   HFILE_ERROR : constant HFILE :=  -1;             --  windef.h :217

   type ATOM is new Win32.WORD;                            --  windef.h :165
   type COLORREF is new Win32.DWORD;                       --  windef.h :214

   subtype SPHANDLE is Win32.Winnt.PHANDLE;               --  windef.h :167
   subtype LPHANDLE is SPHANDLE;                           --  windef.h :168
   subtype HGLOBAL is Win32.Winnt.HANDLE;                 --  windef.h :169
   subtype HLOCAL is Win32.Winnt.HANDLE;                  --  windef.h :170
   subtype GLOBALHANDLE is Win32.Winnt.HANDLE;            --  windef.h :171
   subtype LOCALHANDLE is Win32.Winnt.HANDLE;             --  windef.h :172
   subtype HWND is Win32.Winnt.HANDLE;                    --  windef.h :178
   subtype HHOOK is Win32.Winnt.HANDLE;                   --  windef.h :179
   subtype HGDIOBJ is Win32.Winnt.HANDLE;                 --  windef.h :183
   subtype HACCEL is Win32.Winnt.HANDLE;                  --  windef.h :188
   subtype HBITMAP is Win32.Winnt.HANDLE;                 --  windef.h :189
   subtype HBRUSH is Win32.Winnt.HANDLE;                  --  windef.h :190
   subtype HDC is Win32.Winnt.HANDLE;                     --  windef.h :191
   subtype HGLRC is Win32.Winnt.HANDLE;                   --  windef.h :192
   subtype HDESK is Win32.Winnt.HANDLE;                   --  windef.h :193
   subtype HENHMETAFILE is Win32.Winnt.HANDLE;            --  windef.h :194
   subtype HFONT is Win32.Winnt.HANDLE;                   --  windef.h :195
   subtype HICON is Win32.Winnt.HANDLE;                   --  windef.h :196
   subtype HMENU is Win32.Winnt.HANDLE;                   --  windef.h :197
   subtype HMETAFILE is Win32.Winnt.HANDLE;               --  windef.h :198
   subtype HINSTANCE is Win32.Winnt.HANDLE;               --  windef.h :199
   subtype HPALETTE is Win32.Winnt.HANDLE;                --  windef.h :200
   subtype HPEN is Win32.Winnt.HANDLE;                    --  windef.h :201
   subtype HRGN is Win32.Winnt.HANDLE;                    --  windef.h :202
   subtype HRSRC is Win32.Winnt.HANDLE;                   --  windef.h :203
   subtype HSTR is Win32.Winnt.HANDLE;                    --  windef.h :204
   subtype HTASK is Win32.Winnt.HANDLE;                   --  windef.h :205
   subtype HWINSTA is Win32.Winnt.HANDLE;                 --  windef.h :206
   subtype HKL is Win32.Winnt.HANDLE;                     --  windef.h :207
   subtype HMODULE is Win32.Winnt.HANDLE;                 --  windef.h :209
   subtype HCURSOR is Win32.Winnt.HANDLE;                 --  windef.h :212
   type LPCOLORREF is access all COLORREF;                 --  windef.h :215

   type RECT;                                              --  windef.h :219
   type RECTL;                                             --  windef.h :227
   type POINT;                                             --  windef.h :235
   type POINTL;                                            --  windef.h :241
   type SIZE;                                              --  windef.h :247
   type POINTS;                                            --  windef.h :256

   type PRECT is access all RECT;                          --  windef.h :225
   subtype NPRECT is PRECT;                                --  windef.h :225
   subtype LPRECT is PRECT;                                --  windef.h :225
   type PRECTL is access all RECTL;                        --  windef.h :233
   subtype LPRECTL is PRECTL;                              --  windef.h :233
   type PPOINT is access all POINT;                        --  windef.h :239
   subtype NPPOINT is PPOINT;                              --  windef.h :239
   subtype LPPOINT is PPOINT;                              --  windef.h :239
   type PPOINTL is access all POINTL;                      --  windef.h :245
   type PSIZE is access all SIZE;                          --  windef.h :251
   subtype LPSIZE is PSIZE;                                --  windef.h :251
   subtype PSIZEL is PSIZE;                                --  windef.h :254
   subtype LPSIZEL is PSIZE;                               --  windef.h :254
   type PPOINTS is access all POINTS;                      --  windef.h :260
   subtype LPPOINTS is PPOINTS;                            --  windef.h :260

   type PROC is access function return Win32.INT;          --  windef.h :175
   pragma Convention (Stdcall, PROC);
   subtype FARPROC is PROC;                                --  windef.h :173
   subtype NEARPROC is PROC;                               --  windef.h :174

   type RECT is                                            --  windef.h :219
      record
         left : Win32.LONG;                             --  windef.h :221
         top : Win32.LONG;                             --  windef.h :222
         right : Win32.LONG;                             --  windef.h :223
         bottom : Win32.LONG;                             --  windef.h :224
      end record;

   type RECTL is                                           --  windef.h :227
      record
         left : Win32.LONG;                             --  windef.h :229
         top : Win32.LONG;                             --  windef.h :230
         right : Win32.LONG;                             --  windef.h :231
         bottom : Win32.LONG;                             --  windef.h :232
      end record;

   type POINT is                                           --  windef.h :235
      record
         x : Win32.LONG;                                  --  windef.h :237
         y : Win32.LONG;                                  --  windef.h :238
      end record;

   type POINTL is                                          --  windef.h :241
      record
         x : Win32.LONG;                                  --  windef.h :243
         y : Win32.LONG;                                  --  windef.h :244
      end record;

   type SIZE is                                            --  windef.h :247
      record
         cx : Win32.LONG;                                 --  windef.h :249
         cy : Win32.LONG;                                 --  windef.h :250
      end record;

   subtype SIZEL is SIZE;                                  --  windef.h :253

   type POINTS is                                          --  windef.h :256
      record
         x : Win32.SHORT;                                 --  windef.h :258
         y : Win32.SHORT;                                 --  windef.h :259
      end record;

   function MAKEWORD (Low, High : BYTE) return WORD          --  windef.h :158
     renames Win32.Utils.MAKEWORD;

   function MAKELONG (Low, High : WORD) return DWORD         --  windef.h :159
     renames Win32.Utils.MAKELONG;

   function LOWORD (L : DWORD) return WORD                   --  windef.h :160
     renames Win32.Utils.LOWORD;

   function HIWORD (L : DWORD) return WORD                   --  windef.h :161
     renames Win32.Utils.HIWORD;

   function LOBYTE (W : WORD) return BYTE                    --  windef.h :162
     renames Win32.Utils.LOBYTE;

   function HIBYTE (W : WORD) return BYTE                    --  windef.h :163
     renames Win32.Utils.HIBYTE;

   generic
      type T is private;
      with function ">"(A, B : T) return Boolean;
   function Max (A, B : T) return T;

   generic
      type T is private;
      with function "<"(A, B : T) return Boolean;
   function Min (A, B : T) return T;

private

   pragma Convention (C_Pass_By_Copy, RECT);                  --  windef.h :219
   pragma Convention (C_Pass_By_Copy, RECTL);                 --  windef.h :227
   pragma Convention (C_Pass_By_Copy, POINT);
   pragma Convention (C_Pass_By_Copy, POINTL);                --  windef.h :241
   pragma Convention (C_Pass_By_Copy, SIZE);                  --  windef.h :247
   pragma Convention (C_Pass_By_Copy, POINTS);                --  windef.h :256

   pragma Inline (Max);
   pragma Inline (Min);

end Win32.Windef;


