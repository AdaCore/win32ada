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

with Win32;
with Win32.Windef;
with Win32.Winuser;

package Dialog is

   function AboutDlgProc
     (hDlg     : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL;
   pragma Convention (Stdcall, AboutDlgProc);

   function DisplayDialogBox
     (hWnd_p       : Win32.Windef.HWND;
      lpszTemplate : Win32.LPCSTR;
      lpfFunction  : Win32.Winuser.DLGPROC;
      lExtra       : Win32.LONG)
      return Win32.INT;

   procedure PaintWindow (hWnd_p : Win32.Windef.HWND; nColor : Win32.INT);

   function CreateColorScalePalette
     (hDC_p  : Win32.Windef.HDC;
      nColor : Win32.INT)
      return Win32.Windef.HPALETTE;

end Dialog;
