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

with Win32;        use Win32;
with Win32.Windef;
with Win32.Wingdi;
with Interfaces.C;
with Convert;

package Xform is

   xformclass_str : aliased constant Win32.CHAR_Array := "XFORMDEMO" & Nul;
   xformtitle_str : aliased constant Win32.CHAR_Array :=
      "Transform Demo" & Nul;
   XFORMCLASS     : Win32.LPCSTR                      :=
      Convert.CP (xformclass_str);
   XFORMTITLE     : Win32.LPCSTR                      :=
      Convert.CP (xformtitle_str);

   type pt_array is array (0 .. 3) of aliased Win32.Windef.POINT;
   type XFORMDATA is record
      xForm   : aliased Win32.Wingdi.XFORM;
      pObject : aliased pt_array;
      nObject : Win32.INT;
   end record;
   type PXFORMDATA is access XFORMDATA;

   procedure CreateXFormWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT);

   function XFormProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, XFormProc);

   function XFormCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL;

   procedure XFormDestroyProc (hWnd_p : Win32.Windef.HWND);

   function XFormCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL;

   procedure XFormPaintProc (hWnd_p : Win32.Windef.HWND);

end Xform;
