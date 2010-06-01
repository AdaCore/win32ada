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

with Win32.Utils;
with Win32.Winnt;

package Win32.Windef is

   MAX_PATH            : constant := 260;
   DM_UPDATE           : constant := 1;
   DM_COPY             : constant := 2;
   DM_PROMPT           : constant := 4;
   DM_MODIFY           : constant := 8;
   DM_IN_BUFFER        : constant := 8;
   DM_IN_PROMPT        : constant := 4;
   DM_OUT_BUFFER       : constant := 2;
   DM_OUT_DEFAULT      : constant := 1;
   DC_FIELDS           : constant := 1;
   DC_PAPERS           : constant := 2;
   DC_PAPERSIZE        : constant := 3;
   DC_MINEXTENT        : constant := 4;
   DC_MAXEXTENT        : constant := 5;
   DC_BINS             : constant := 6;
   DC_DUPLEX           : constant := 7;
   DC_SIZE             : constant := 8;
   DC_EXTRA            : constant := 9;
   DC_VERSION          : constant := 10;
   DC_DRIVER           : constant := 11;
   DC_BINNAMES         : constant := 12;
   DC_ENUMRESOLUTIONS  : constant := 13;
   DC_FILEDEPENDENCIES : constant := 14;
   DC_TRUETYPE         : constant := 15;
   DC_PAPERNAMES       : constant := 16;
   DC_ORIENTATION      : constant := 17;
   DC_COPIES           : constant := 18;

   type HFILE is new Win32.INT;
   HFILE_ERROR : constant HFILE := -1;

   type ATOM is new Win32.WORD;
   type COLORREF is new Win32.DWORD;

   subtype SPHANDLE is Win32.Winnt.PHANDLE;
   subtype LPHANDLE is SPHANDLE;
   subtype HGLOBAL is Win32.Winnt.HANDLE;
   subtype HLOCAL is Win32.Winnt.HANDLE;
   subtype GLOBALHANDLE is Win32.Winnt.HANDLE;
   subtype LOCALHANDLE is Win32.Winnt.HANDLE;
   subtype HWND is Win32.Winnt.HANDLE;
   subtype HHOOK is Win32.Winnt.HANDLE;
   subtype HGDIOBJ is Win32.Winnt.HANDLE;
   subtype HACCEL is Win32.Winnt.HANDLE;
   subtype HBITMAP is Win32.Winnt.HANDLE;
   subtype HBRUSH is Win32.Winnt.HANDLE;
   subtype HDC is Win32.Winnt.HANDLE;
   subtype HGLRC is Win32.Winnt.HANDLE;
   subtype HDESK is Win32.Winnt.HANDLE;
   subtype HENHMETAFILE is Win32.Winnt.HANDLE;
   subtype HFONT is Win32.Winnt.HANDLE;
   subtype HICON is Win32.Winnt.HANDLE;
   subtype HMENU is Win32.Winnt.HANDLE;
   subtype HMETAFILE is Win32.Winnt.HANDLE;
   subtype HINSTANCE is Win32.Winnt.HANDLE;
   subtype HPALETTE is Win32.Winnt.HANDLE;
   subtype HPEN is Win32.Winnt.HANDLE;
   subtype HRGN is Win32.Winnt.HANDLE;
   subtype HRSRC is Win32.Winnt.HANDLE;
   subtype HSTR is Win32.Winnt.HANDLE;
   subtype HTASK is Win32.Winnt.HANDLE;
   subtype HWINSTA is Win32.Winnt.HANDLE;
   subtype HKL is Win32.Winnt.HANDLE;
   subtype HMODULE is Win32.Winnt.HANDLE;
   subtype HCURSOR is Win32.Winnt.HANDLE;
   type LPCOLORREF is access all COLORREF;

   type RECT;
   type RECTL;
   type POINT;
   type POINTL;
   type SIZE;
   type POINTS;

   type PRECT is access all RECT;
   subtype NPRECT is PRECT;
   subtype LPRECT is PRECT;
   type PRECTL is access all RECTL;
   subtype LPRECTL is PRECTL;
   type PPOINT is access all POINT;
   subtype NPPOINT is PPOINT;
   subtype LPPOINT is PPOINT;
   type PPOINTL is access all POINTL;
   type PSIZE is access all SIZE;
   subtype LPSIZE is PSIZE;
   subtype PSIZEL is PSIZE;
   subtype LPSIZEL is PSIZE;
   type PPOINTS is access all POINTS;
   subtype LPPOINTS is PPOINTS;

   type PROC is access function return Win32.INT;
   pragma Convention (Stdcall, PROC);
   subtype FARPROC is PROC;
   subtype NEARPROC is PROC;

   type RECT is record
      left   : Win32.LONG;
      top    : Win32.LONG;
      right  : Win32.LONG;
      bottom : Win32.LONG;
   end record;

   type RECTL is record
      left   : Win32.LONG;
      top    : Win32.LONG;
      right  : Win32.LONG;
      bottom : Win32.LONG;
   end record;

   type POINT is record
      x : Win32.LONG;
      y : Win32.LONG;
   end record;

   type POINTL is record
      x : Win32.LONG;
      y : Win32.LONG;
   end record;

   type SIZE is record
      cx : Win32.LONG;
      cy : Win32.LONG;
   end record;

   subtype SIZEL is SIZE;

   type POINTS is record
      x : Win32.SHORT;
      y : Win32.SHORT;
   end record;

   function MAKEWORD (Low, High : BYTE) return WORD renames
     Win32.Utils.MAKEWORD;

   function MAKELONG (Low, High : WORD) return DWORD renames
     Win32.Utils.MAKELONG;

   function LOWORD (L : DWORD) return WORD renames Win32.Utils.LOWORD;

   function HIWORD (L : DWORD) return WORD renames Win32.Utils.HIWORD;

   function LOBYTE (W : WORD) return BYTE renames Win32.Utils.LOBYTE;

   function HIBYTE (W : WORD) return BYTE renames Win32.Utils.HIBYTE;

   generic
      type T is private;
      with function ">" (A, B : T) return Boolean;
   function Max (A, B : T) return T;

   generic
      type T is private;
      with function "<" (A, B : T) return Boolean;
   function Min (A, B : T) return T;

private

   pragma Convention (C_Pass_By_Copy, RECT);
   pragma Convention (C_Pass_By_Copy, RECTL);
   pragma Convention (C_Pass_By_Copy, POINT);
   pragma Convention (C_Pass_By_Copy, POINTL);
   pragma Convention (C_Pass_By_Copy, SIZE);
   pragma Convention (C_Pass_By_Copy, POINTS);

   pragma Inline (Max);
   pragma Inline (Min);

end Win32.Windef;
