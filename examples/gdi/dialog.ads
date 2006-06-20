-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  This package spec is a translation of dialog.c which is part of the 
--  Microsoft gdidemo sample application


with Win32;
with Win32.WinDef;
with Win32.WinUser;

package Dialog is

  function AboutDlgProc (hDlg     : Win32.WinDef.HWND;
                         wMsg     : Win32.UINT;
                         wParam_p : Win32.WPARAM;
                         lParam_p : Win32.LPARAM) return Win32.BOOL;
  pragma convention (Stdcall, AboutDlgProc);

  function DisplayDialogBox (hWnd_p       : Win32.WinDef.HWND;
                             lpszTemplate : Win32.LPCSTR;
                             lpfFunction  : Win32.WinUser.DLGPROC;
                             lExtra       : Win32.LONG) return Win32.INT;

  procedure PaintWindow (hWnd_p : Win32.WinDef.HWND;
                         nColor : Win32.INT);

  function CreateColorScalePalette (hDC_p  : Win32.WinDef.HDC;
                                    nColor : Win32.INT) 
                                             return Win32.WinDef.HPALETTE;

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Dialog;
