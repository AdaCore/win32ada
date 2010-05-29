-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED "AS IS" WITHOUT
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR
-- A PARTICULAR PURPOSE.  The user assumes the entire risk as to the accuracy
-- and the use of this file.  This file may be used only by licensees of
-- Microsoft Corporation's WIN32 Software Development Kit in accordance with
-- the terms of the licensee's End-User License Agreement for Microsoft
-- Software for the WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (c) AdaCore 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

--  package Dialog body
--
--  This package body is a translation of dialog.c which is part of the
--  Microsoft gdidemo sample application
--

with Ada.Unchecked_Conversion;
with Gdidemo_Util;
with Interfaces.C;          use Interfaces.C;
with Interfaces.C.Strings;
with System;
with Win32;
with Win32.WinBase;
with Win32.WinDef;
with Win32.WinGdi;
with Win32.Winnt;
with Win32.WinUser;

package body Dialog is

  use type System.Address;

  -- Used in PaintWindow
  rect_p   : aliased Win32.WinDef.RECT;
  ps       : aliased Win32.WinUser.PAINTSTRUCT;

  -- dummy function return values,
  bResult : Win32.BOOL;
  iResult : Win32.INT;
  hResult : Win32.Windef.HWND;

  function LPVOID_TO_LOGPALETTE_P is new Ada.Unchecked_Conversion
                     (Win32.LPVOID, Win32.WinGdi.PLOGPALETTE);

-- | DISPLAY DIALOG BOX
-- |   This is a routine to display a generic modal-dialog box.
-- |
function DisplayDialogBox (hWnd_p       : Win32.WinDef.HWND;
                           lpszTemplate : Win32.LPCSTR;
                           lpfFunction  : Win32.WinUser.DLGPROC;
                           lExtra       : Win32.LONG) return Win32.INT is
  hInst : Win32.Winnt.HANDLE;
  nRet  : Win32.INT;
begin
  nRet  := -1;
  hInst := Gdidemo_Util.GETINSTANCE (hWnd_p);
  nRet  := Win32.WinUser.DialogBoxParam (
             hInstance      => Win32.Windef.HINSTANCE (hInst),
             lpTemplateName => lpszTemplate,
             hWndParent     => hWnd_p,
             lpDialogFunc   => lpfFunction,
             dwInitParam    => Win32.LONG_PTR (lExtra));
  return nRet;
end DisplayDialogBox;

-- | ABOUT DIALOG PROCEDURE
-- |   This is the main dialog box routine for the HELPABOUT template.
function AboutDlgProc (hDlg     : Win32.WinDef.HWND;
                       wMsg     : Win32.UINT;
                       wParam_p : Win32.WPARAM;
                       lParam_p : Win32.LPARAM) return Win32.BOOL is
begin

  case wMsg is

    -- /*
    -- ** Set the focus to the OK button.
    -- */
    when Win32.WinUser.WM_INITDIALOG =>
      hResult := Win32.WinUser.SetFocus (
                   Win32.WinUser.GetDlgItem (hDlg,Win32.WinUser.IDOK));

    -- /*
    -- ** Look for an ESC or RETURN event.
    -- */
    when Win32.WinUser.WM_COMMAND =>

      case wParam_p is
        when Win32.WinUser.IDOK | Win32.WinUser.IDCANCEL =>
          bResult := Win32.WinUser.EndDialog (hDlg, Win32.TRUE);

        when others =>
          return Win32.FALSE;

      end case;

    -- /*
    -- ** Wash the background of the aboutbox to give it a nice blue-scaling
    -- ** effect.  Invalidate the OK button to force it to the top.  This
    -- ** seems to be necessary since the OK button gets overwritten during
    -- ** the washing.
    -- */
    when Win32.WinUser.WM_PAINT =>
    declare
      null_rect : Win32.WinGdi.ac_RECT_t;
    begin
      PaintWindow (hDlg, Gdidemo_Util.COLOR_SCALE_BLUE);
      bResult := Win32.WinUser.InvalidateRect (
                   Win32.WinUser.GetDlgItem (hDlg, Win32.WinUser.IDOK),
                   null_rect,
                   Win32.TRUE);
    end;

    -- ** Default handler
    when others =>
      return Win32.FALSE;

  end case;

  return Win32.TRUE;
end AboutDlgProc;

-- | PAINT WND BACKGROUND
-- |   This routine is used to wash the background of a window.
-- |
procedure PaintWindow (hWnd_p : Win32.WinDef.HWND;
                       nColor : Win32.INT) is
  hDC_p    : Win32.WinDef.HDC;
  hBrush_p : Win32.WinDef.HBRUSH;
  hPal     : Win32.WinDef.HPALETTE;
  null_size  : Win32.WinDef.LPSIZE;
  null_point : Win32.WinDef.LPPOINT;
  nMapMode,nSize,nReserved,nLoop : Win32.INT;
  uResult    : Win32.UINT;
begin
  hDC_p := Win32.WinUser.BeginPaint (hWnd_p, ps'Access);
  bResult := Win32.WinUser.GetClientRect (hWnd_p,rect_p'Access);
  nMapMode := Win32.WinGdi.SetMapMode (hDC_p, Win32.WinGdi.MM_ANISOTROPIC);

  if (Interfaces.C.Unsigned (Win32.Wingdi.GetDeviceCaps
                      (hDC_p, Win32.WinGdi.RASTERCAPS)) and
      Win32.WinGdi.RC_PALETTE) > 0 then
    nReserved := Win32.WinGdi.GetDeviceCaps (hDC_p, Win32.WinGdi.NUMRESERVED);
    nSize     := Win32.WinGdi.GetDeviceCaps (hDC_p, Win32.WinGdi.SIZEPALETTE)
                 - nReserved;

    hPal := CreateColorScalePalette (hDC_p, nColor);

    if hPal /= System.Null_Address then
      hPal := Win32.WinGdi.SelectPalette (hDC_p,hPal,Win32.FALSE);
      uResult := Win32.WinGdi.RealizePalette (hDC_p);

      bResult := Win32.WinGdi.SetWindowExtEx (hDC_p,nSize,nSize,null_size);
      bResult := Win32.WinGdi.SetViewportExtEx
                 (hDC_p,Interfaces.C.Int (rect_p.right),
                  (-1)*Interfaces.C.Int (rect_p.bottom),
                  null_size);
      bResult := Win32.WinGdi.SetViewportOrgEx
                 (hDC_p, 0, Interfaces.C.Int (rect_p.bottom), null_point);
      nLoop := nSize / 2;
      for idx in 0 .. nLoop - 1 loop
        hBrush_p := Win32.WinGdi.CreateSolidBrush (
                      Win32.WinGdi.PALETTEINDEX (
                      Win32.WORD (idx + nLoop)));
        bResult := Win32.WinUser.SetRect
                   (rect_p'Access, idx, idx, (nSize - idx), (nSize - idx));
        iResult := Win32.WinUser.FillRect (hDC_p, rect_p'Access, hBrush_p);
        bResult := Win32.WinGdi.DeleteObject (Win32.Windef.HGDIOBJ (hBrush_p));
      end loop;

      bResult := Win32.WinGdi.DeleteObject (Win32.Windef.HGDIOBJ (
                 (Win32.WinGdi.SelectPalette(hDC_p,hPal,Win32.FALSE))));
      uResult := Win32.WinGdi.RealizePalette(hDC_p);
    end if;
  else
    bResult := Win32.WinGdi.SetWindowExtEx(hDC_p,512,512,null_size);
    bResult := Win32.WinGdi.SetViewportExtEx
                            (hDC_p, Interfaces.C.Int (rect_p.right),
                             (-1)*Interfaces.C.Int (rect_p.bottom),null_size);
    bResult := Win32.WinGdi.SetViewportOrgEx(hDC_p,0,
                     Interfaces.C.Int (rect_p.bottom),null_point);

    for idx in 0 .. 255 loop
      hBrush_p := Win32.WinGdi.CreateSolidBrush(
                  Win32.WinGdi.RGB(0,0,Win32.BYTE(idx)));
      bResult := Win32.WinUser.SetRect
                 (rect_p'Access,Interfaces.C.Int (idx),
                  Interfaces.C.Int (idx),
                  Interfaces.C.Int (512-idx),
                  Interfaces.C.Int (512-idx));
      iResult := Win32.WinUser.FillRect(hDC_p,rect_p'Access,hBrush_p);
      bResult := Win32.WinGdi.DeleteObject (Win32.Windef.HGDIOBJ (hBrush_p));
    end loop;
  end if;

  iResult := Win32.WinGdi.SetMapMode(hDC_p,nMapMode);
  bResult := Win32.WinUser.EndPaint(hWnd_p,ps'Access);

end PaintWindow;

-- | CREATE COLOR SCALE PALETTE
-- |   This routine creates a palette representing the scale values of a
-- |   particular RGB color.  A gray-scale palette can also be created.
-- |
function CreateColorScalePalette (hDC_p  : Win32.WinDef.HDC;
                                  nColor : Win32.INT)
                                           return Win32.WinDef.HPALETTE is
  hPalette_p : Win32.WinDef.HPALETTE;
  hMem     : Win32.WinDef.HGLOBAL;
  lpMem    : Win32.WinGdi.PLOGPALETTE;
  nReserved,nSize : Win32.INT;
  idx : integer;
  dummy_handle : Win32.WinDef.HGLOBAL;
  void_result : Win32.LPVOID;
begin

  if (Interfaces.C.Unsigned (
        Win32.WinGdi.GetDeviceCaps (hDC_p, Win32.WinGdi.RASTERCAPS)) and
      Win32.WinGdi.RC_PALETTE) > 0
  then
    nReserved := Win32.WinGdi.GetDeviceCaps(hDC_p,Win32.WinGdi.NUMRESERVED);
    nSize     := Win32.WinGdi.GetDeviceCaps(hDC_p,Win32.WinGdi.SIZEPALETTE)
                 - nReserved;
    --  remember to divide by 8 to get the size in bytes
    hMem      := Win32.WinBase.GlobalAlloc (Win32.WinBase.GHND,
                 Win32.DWORD ((Win32.WinGdi.LOGPALETTE'size +
                              (Win32.WinGdi.PALETTEENTRY'size * nSize)) / 8));

    if hMem /= System.Null_Address then
      void_result := Win32.WinBase.GlobalLock (hMem);
      if void_result /= System.Null_Address then
        lpMem := LPVOID_TO_LOGPALETTE_P (void_result);
        lpMem.palNumEntries := Win32.WORD (nSize);
        lpMem.palVersion    := Win32.WORD (16#0300#);

        case nColor is

          when Gdidemo_Util.COLOR_SCALE_RED =>
            for idx_index in 0 .. (nSize - 1) loop
              idx := integer (idx_index);
              lpMem.palPalEntry(idx).peRed   := Win32.BYTE (idx);
              lpMem.palPalEntry(idx).peGreen := 0;
              lpMem.palPalEntry(idx).peBlue  := 0;
              lpMem.palPalEntry(idx).peFlags := Win32.WinGdi.PC_RESERVED;
            end loop;

          when Gdidemo_Util.COLOR_SCALE_GREEN =>
            for idx_index in 0 .. (nSize - 1) loop
              idx := integer (idx_index);
              lpMem.palPalEntry(idx).peRed   := 0;
              lpMem.palPalEntry(idx).peGreen := Win32.BYTE (idx);
              lpMem.palPalEntry(idx).peBlue  := 0;
              lpMem.palPalEntry(idx).peFlags := Win32.WinGdi.PC_RESERVED;
            end loop;

          when Gdidemo_Util.COLOR_SCALE_BLUE =>
            for idx_index in 0 .. (nSize - 1) loop
              idx := integer (idx_index);
              lpMem.palPalEntry(idx).peRed   := Win32.BYTE (0);
              lpMem.palPalEntry(idx).peGreen := 0;
              lpMem.palPalEntry(idx).peBlue  := Win32.BYTE (idx);
              lpMem.palPalEntry(idx).peFlags := Win32.WinGdi.PC_RESERVED;
            end loop;

          when others =>   -- COLOR_SCALE_GRAY
            for idx_index in 0 .. (nSize - 1) loop
              idx := integer (idx_index);
              lpMem.palPalEntry(idx).peRed   := Win32.BYTE (idx);
              lpMem.palPalEntry(idx).peGreen := Win32.BYTE (idx);
              lpMem.palPalEntry(idx).peBlue  := Win32.BYTE (idx);
              lpMem.palPalEntry(idx).peFlags := Win32.WinGdi.PC_RESERVED;
            end loop;
        end case;
        hPalette_p := Win32.WinGdi.CreatePalette (
                      Win32.Wingdi.PLOGPALETTE(lpMem));
        bResult    := Win32.WinBase.GlobalUnlock (hMem);
      end if;
      dummy_handle := Win32.WinBase.GlobalFree (hMem);
    end if;
  end if;
  return hPalette_p;

end CreateColorScalePalette;

end Dialog;
