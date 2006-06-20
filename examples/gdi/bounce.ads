-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$


with Win32;
with Win32.Windef;
with Win32.Winnt;
with Convert;
with Interfaces.C;

package Bounce is

  bounceclass_str : aliased constant Win32.CHAR_ARRAY := 
      "BOUNCEDEMO";
  bouncetitle_str : aliased constant Win32.CHAR_ARRAY := 
      "Bouncing Ball Demo (xforms)";
  BOUNCECLASS : Win32.LPCSTR := Convert.CP(bounceclass_str);
  BOUNCETITLE : Win32.LPCSTR := Convert.CP(bouncetitle_str); 

  type xForm_Matrix is array (0 .. 2, 0 .. 2) of aliased Win32.LONG;
  type MYXFORM is record
    xForm : aliased xForm_Matrix; 
  end record;
  type PMYXFORM is access MYXFORM;

  -- ** BALL OBJECT
  type BALLDATA is record
    hWnd          : Win32.WinDef.HWND;
    nWidth        : Win32.LONG;
    nHeight       : Win32.LONG;
    xDirection    : Win32.LONG;
    yDirection    : Win32.LONG;
    bNewPosition  : Win32.BOOL;
    xPosition     : Win32.LONG;
    yPosition     : Win32.LONG;
    crColor       : Win32.WinDef.COLORREF;
    xForm         : MYXFORM;
  end record;
  type PBALLDATA is access BALLDATA;

  type BOUNCEDATA is record
    hBall1 : Win32.Winnt.HANDLE;
    hBall2 : Win32.Winnt.HANDLE;
    hBall3 : Win32.Winnt.HANDLE;
    hBall4 : Win32.Winnt.HANDLE;
  end record;
  type PBOUNCEDATA is access BOUNCEDATA;

  function ballCreate (hWnd_p  : Win32.WinDef.HWND;
                       nWidth  : Win32.LONG;
                       nHeight : Win32.LONG;
                       crColor : Win32.WinDef.COLORREF) return 
                                                        Win32.Winnt.HANDLE;

  function ballDestroy (hBall : Win32.Winnt.HANDLE) return Win32.BOOL;

  procedure ballBounce (hBall : Win32.Winnt.HANDLE);

  procedure ballGetDimensions (hBall      : Win32.Winnt.HANDLE;
                               pDimension : in out Win32.WinDef.POINT); 

  function ballSetDimensions (hBall   : Win32.Winnt.HANDLE;
                              nWidth  : Win32.LONG;
                              nHeight : Win32.LONG) return Win32.BOOL;
  
  procedure ballGetDirection (hBall      : Win32.Winnt.HANDLE;
                              pDirection : in out Win32.WinDef.POINT); 

  procedure ballSetDirection (hBall      : Win32.Winnt.HANDLE;
                              xDirection : Win32.LONG;
                              yDirection : Win32.LONG);

  procedure ballGetPosition (hBall     : Win32.Winnt.HANDLE;
                             pPosition : in out Win32.WinDef.POINT); 

  procedure ballSetPosition (hBall : Win32.Winnt.HANDLE;
                             x     : Win32.LONG;
                             y     : Win32.LONG);

  procedure CreateBounceWindow (hWndClient : Win32.WinDef.HWND;
                                nItem      : Win32.INT);

  function BounceProc (hWnd_p   : Win32.WinDef.HWND;
                       wMsg     : Win32.UINT;
                       wParam_p : Win32.WPARAM;
                       lParam_p : Win32.LPARAM) return Win32.LRESULT;
  pragma Convention (Stdcall, BounceProc);

  function BounceCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL;

  procedure BounceDestroyProc (hWnd_p : Win32.WinDef.HWND);

  function BounceCommandProc (hWnd_p   : Win32.WinDef.HWND;
                              wParam_p : Win32.WPARAM;
                              lParam_p : Win32.LPARAM) return Win32.BOOL;

  procedure BouncePaintProc (hWnd_p : Win32.WinDef.HWND);

  procedure BounceObjects (hWnd_p : Win32.WinDef.HWND);

  procedure BounceRefresh (hWnd_p : Win32.WinDef.HWND);

  procedure CheckEdgePosition (hWnd_p : Win32.WinDef.HWND;
                               hBall  : Win32.Winnt.HANDLE);

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

end Bounce;
