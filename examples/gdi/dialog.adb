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
with Gdidemo_Util;
with Interfaces.C;             use Interfaces.C;
with Interfaces.C.Strings;
with System;
with Win32;
with Win32.Winbase;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;
with Win32.Winuser;

package body Dialog is

   use type System.Address;

   rect_p : aliased Win32.Windef.RECT;
   ps     : aliased Win32.Winuser.PAINTSTRUCT;

   bResult : Win32.BOOL;
   iResult : Win32.INT;
   hResult : Win32.Windef.HWND;

   function LPVOID_TO_LOGPALETTE_P is new Ada.Unchecked_Conversion (
      Win32.LPVOID,
      Win32.Wingdi.PLOGPALETTE);

   function DisplayDialogBox
     (hWnd_p       : Win32.Windef.HWND;
      lpszTemplate : Win32.LPCSTR;
      lpfFunction  : Win32.Winuser.DLGPROC;
      lExtra       : Win32.LONG)
      return Win32.INT
   is
      hInst : Win32.Winnt.HANDLE;
      nRet  : Win32.INT;
   begin
      nRet  := -1;
      hInst := Gdidemo_Util.GETINSTANCE (hWnd_p);
      nRet  :=
         Win32.Winuser.DialogBoxParam
           (hInstance      => Win32.Windef.HINSTANCE (hInst),
            lpTemplateName => lpszTemplate,
            hWndParent     => hWnd_p,
            lpDialogFunc   => lpfFunction,
            dwInitParam    => Win32.LONG_PTR (lExtra));
      return nRet;
   end DisplayDialogBox;

   function AboutDlgProc
     (hDlg     : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL
   is
   begin

      case wMsg is

         when Win32.Winuser.WM_INITDIALOG =>
            hResult :=
               Win32.Winuser.SetFocus
                 (Win32.Winuser.GetDlgItem (hDlg, Win32.Winuser.IDOK));

         when Win32.Winuser.WM_COMMAND =>

            case wParam_p is
               when Win32.Winuser.IDOK | Win32.Winuser.IDCANCEL =>
                  bResult := Win32.Winuser.EndDialog (hDlg, Win32.TRUE);

               when others =>
                  return Win32.FALSE;

            end case;

         when Win32.Winuser.WM_PAINT =>
            declare
               null_rect : Win32.Wingdi.ac_RECT_t;
            begin
               PaintWindow (hDlg, Gdidemo_Util.COLOR_SCALE_BLUE);
               bResult :=
                  Win32.Winuser.InvalidateRect
                    (Win32.Winuser.GetDlgItem (hDlg, Win32.Winuser.IDOK),
                     null_rect,
                     Win32.TRUE);
            end;

         when others =>
            return Win32.FALSE;

      end case;

      return Win32.TRUE;
   end AboutDlgProc;

   procedure PaintWindow (hWnd_p : Win32.Windef.HWND; nColor : Win32.INT) is
      hDC_p                             : Win32.Windef.HDC;
      hBrush_p                          : Win32.Windef.HBRUSH;
      hPal                              : Win32.Windef.HPALETTE;
      null_size                         : Win32.Windef.LPSIZE;
      null_point                        : Win32.Windef.LPPOINT;
      nMapMode, nSize, nReserved, nLoop : Win32.INT;
      uResult                           : Win32.UINT;
   begin
      hDC_p    := Win32.Winuser.BeginPaint (hWnd_p, ps'Access);
      bResult  := Win32.Winuser.GetClientRect (hWnd_p, rect_p'Access);
      nMapMode :=
         Win32.Wingdi.SetMapMode (hDC_p, Win32.Wingdi.MM_ANISOTROPIC);

      if (Interfaces.C.unsigned (Win32.Wingdi.GetDeviceCaps
                                    (hDC_p,
                                     Win32.Wingdi.RASTERCAPS)) and
          Win32.Wingdi.RC_PALETTE) >
         0
      then
         nReserved :=
            Win32.Wingdi.GetDeviceCaps (hDC_p, Win32.Wingdi.NUMRESERVED);
         nSize     :=
           Win32.Wingdi.GetDeviceCaps (hDC_p, Win32.Wingdi.SIZEPALETTE) -
           nReserved;

         hPal := CreateColorScalePalette (hDC_p, nColor);

         if hPal /= System.Null_Address then
            hPal    := Win32.Wingdi.SelectPalette (hDC_p, hPal, Win32.FALSE);
            uResult := Win32.Wingdi.RealizePalette (hDC_p);

            bResult :=
               Win32.Wingdi.SetWindowExtEx (hDC_p, nSize, nSize, null_size);
            bResult :=
               Win32.Wingdi.SetViewportExtEx
                 (hDC_p,
                  Interfaces.C.int (rect_p.right),
                  (-1) * Interfaces.C.int (rect_p.bottom),
                  null_size);
            bResult :=
               Win32.Wingdi.SetViewportOrgEx
                 (hDC_p,
                  0,
                  Interfaces.C.int (rect_p.bottom),
                  null_point);
            nLoop   := nSize / 2;
            for idx in 0 .. nLoop - 1 loop
               hBrush_p :=
                  Win32.Wingdi.CreateSolidBrush
                    (Win32.Wingdi.PALETTEINDEX (Win32.WORD (idx + nLoop)));
               bResult  :=
                  Win32.Winuser.SetRect
                    (rect_p'Access,
                     idx,
                     idx,
                     (nSize - idx),
                     (nSize - idx));
               iResult  :=
                  Win32.Winuser.FillRect (hDC_p, rect_p'Access, hBrush_p);
               bResult  :=
                  Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hBrush_p));
            end loop;

            bResult :=
               Win32.Wingdi.DeleteObject
                 (Win32.Windef.HGDIOBJ ((Win32.Wingdi.SelectPalette
                                            (hDC_p,
                                             hPal,
                                             Win32.FALSE))));
            uResult := Win32.Wingdi.RealizePalette (hDC_p);
         end if;
      else
         bResult := Win32.Wingdi.SetWindowExtEx (hDC_p, 512, 512, null_size);
         bResult :=
            Win32.Wingdi.SetViewportExtEx
              (hDC_p,
               Interfaces.C.int (rect_p.right),
               (-1) * Interfaces.C.int (rect_p.bottom),
               null_size);
         bResult :=
            Win32.Wingdi.SetViewportOrgEx
              (hDC_p,
               0,
               Interfaces.C.int (rect_p.bottom),
               null_point);

         for idx in 0 .. 255 loop
            hBrush_p :=
               Win32.Wingdi.CreateSolidBrush
                 (Win32.Wingdi.RGB (0, 0, Win32.BYTE (idx)));
            bResult  :=
               Win32.Winuser.SetRect
                 (rect_p'Access,
                  Interfaces.C.int (idx),
                  Interfaces.C.int (idx),
                  Interfaces.C.int (512 - idx),
                  Interfaces.C.int (512 - idx));
            iResult  :=
               Win32.Winuser.FillRect (hDC_p, rect_p'Access, hBrush_p);
            bResult  :=
               Win32.Wingdi.DeleteObject (Win32.Windef.HGDIOBJ (hBrush_p));
         end loop;
      end if;

      iResult := Win32.Wingdi.SetMapMode (hDC_p, nMapMode);
      bResult := Win32.Winuser.EndPaint (hWnd_p, ps'Access);

   end PaintWindow;

   function CreateColorScalePalette
     (hDC_p  : Win32.Windef.HDC;
      nColor : Win32.INT)
      return Win32.Windef.HPALETTE
   is
      hPalette_p       : Win32.Windef.HPALETTE;
      hMem             : Win32.Windef.HGLOBAL;
      lpMem            : Win32.Wingdi.PLOGPALETTE;
      nReserved, nSize : Win32.INT;
      idx              : Integer;
      dummy_handle     : Win32.Windef.HGLOBAL;
      void_result      : Win32.LPVOID;
   begin

      if (Interfaces.C.unsigned (Win32.Wingdi.GetDeviceCaps
                                    (hDC_p,
                                     Win32.Wingdi.RASTERCAPS)) and
          Win32.Wingdi.RC_PALETTE) >
         0
      then
         nReserved :=
            Win32.Wingdi.GetDeviceCaps (hDC_p, Win32.Wingdi.NUMRESERVED);
         nSize     :=
           Win32.Wingdi.GetDeviceCaps (hDC_p, Win32.Wingdi.SIZEPALETTE) -
           nReserved;
         hMem      :=
            Win32.Winbase.GlobalAlloc
              (Win32.Winbase.GHND,
               Win32.DWORD ((Win32.Wingdi.LOGPALETTE'Size +
                             (Win32.Wingdi.PALETTEENTRY'Size * nSize)) /
                            8));

         if hMem /= System.Null_Address then
            void_result := Win32.Winbase.GlobalLock (hMem);
            if void_result /= System.Null_Address then
               lpMem               := LPVOID_TO_LOGPALETTE_P (void_result);
               lpMem.palNumEntries := Win32.WORD (nSize);
               lpMem.palVersion    := Win32.WORD (16#0300#);

               case nColor is

                  when Gdidemo_Util.COLOR_SCALE_RED =>
                     for idx_index in 0 .. (nSize - 1) loop
                        idx                             :=
                          Integer (idx_index);
                        lpMem.palPalEntry (idx).peRed   := Win32.BYTE (idx);
                        lpMem.palPalEntry (idx).peGreen := 0;
                        lpMem.palPalEntry (idx).peBlue  := 0;
                        lpMem.palPalEntry (idx).peFlags :=
                          Win32.Wingdi.PC_RESERVED;
                     end loop;

                  when Gdidemo_Util.COLOR_SCALE_GREEN =>
                     for idx_index in 0 .. (nSize - 1) loop
                        idx                             :=
                          Integer (idx_index);
                        lpMem.palPalEntry (idx).peRed   := 0;
                        lpMem.palPalEntry (idx).peGreen := Win32.BYTE (idx);
                        lpMem.palPalEntry (idx).peBlue  := 0;
                        lpMem.palPalEntry (idx).peFlags :=
                          Win32.Wingdi.PC_RESERVED;
                     end loop;

                  when Gdidemo_Util.COLOR_SCALE_BLUE =>
                     for idx_index in 0 .. (nSize - 1) loop
                        idx                             :=
                          Integer (idx_index);
                        lpMem.palPalEntry (idx).peRed   := Win32.BYTE (0);
                        lpMem.palPalEntry (idx).peGreen := 0;
                        lpMem.palPalEntry (idx).peBlue  := Win32.BYTE (idx);
                        lpMem.palPalEntry (idx).peFlags :=
                          Win32.Wingdi.PC_RESERVED;
                     end loop;

                  when others =>
                     for idx_index in 0 .. (nSize - 1) loop
                        idx                             :=
                          Integer (idx_index);
                        lpMem.palPalEntry (idx).peRed   := Win32.BYTE (idx);
                        lpMem.palPalEntry (idx).peGreen := Win32.BYTE (idx);
                        lpMem.palPalEntry (idx).peBlue  := Win32.BYTE (idx);
                        lpMem.palPalEntry (idx).peFlags :=
                          Win32.Wingdi.PC_RESERVED;
                     end loop;
               end case;
               hPalette_p :=
                  Win32.Wingdi.CreatePalette
                    (Win32.Wingdi.PLOGPALETTE (lpMem));
               bResult    := Win32.Winbase.GlobalUnlock (hMem);
            end if;
            dummy_handle := Win32.Winbase.GlobalFree (hMem);
         end if;
      end if;
      return hPalette_p;

   end CreateColorScalePalette;

end Dialog;
