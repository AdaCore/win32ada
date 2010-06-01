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
with Win32.Winnt;
with Convert;
with Interfaces.C;

package Bounce is

   bounceclass_str : aliased constant Win32.CHAR_Array := "BOUNCEDEMO";
   bouncetitle_str : aliased constant Win32.CHAR_Array :=
      "Bouncing Ball Demo (xforms)";
   BOUNCECLASS     : Win32.LPCSTR                      :=
      Convert.CP (bounceclass_str);
   BOUNCETITLE     : Win32.LPCSTR                      :=
      Convert.CP (bouncetitle_str);

   type xForm_Matrix is array (0 .. 2, 0 .. 2) of aliased Win32.LONG;
   type MYXFORM is record
      xForm : aliased xForm_Matrix;
   end record;
   type PMYXFORM is access MYXFORM;

   type BALLDATA is record
      hWnd         : Win32.Windef.HWND;
      nWidth       : Win32.LONG;
      nHeight      : Win32.LONG;
      xDirection   : Win32.LONG;
      yDirection   : Win32.LONG;
      bNewPosition : Win32.BOOL;
      xPosition    : Win32.LONG;
      yPosition    : Win32.LONG;
      crColor      : Win32.Windef.COLORREF;
      xForm        : MYXFORM;
   end record;
   type PBALLDATA is access BALLDATA;

   type BOUNCEDATA is record
      hBall1 : Win32.Winnt.HANDLE;
      hBall2 : Win32.Winnt.HANDLE;
      hBall3 : Win32.Winnt.HANDLE;
      hBall4 : Win32.Winnt.HANDLE;
   end record;
   type PBOUNCEDATA is access BOUNCEDATA;

   function ballCreate
     (hWnd_p  : Win32.Windef.HWND;
      nWidth  : Win32.LONG;
      nHeight : Win32.LONG;
      crColor : Win32.Windef.COLORREF)
      return Win32.Winnt.HANDLE;

   function ballDestroy (hBall : Win32.Winnt.HANDLE) return Win32.BOOL;

   procedure ballBounce (hBall : Win32.Winnt.HANDLE);

   procedure ballGetDimensions
     (hBall      : Win32.Winnt.HANDLE;
      pDimension : in out Win32.Windef.POINT);

   function ballSetDimensions
     (hBall   : Win32.Winnt.HANDLE;
      nWidth  : Win32.LONG;
      nHeight : Win32.LONG)
      return Win32.BOOL;

   procedure ballGetDirection
     (hBall      : Win32.Winnt.HANDLE;
      pDirection : in out Win32.Windef.POINT);

   procedure ballSetDirection
     (hBall      : Win32.Winnt.HANDLE;
      xDirection : Win32.LONG;
      yDirection : Win32.LONG);

   procedure ballGetPosition
     (hBall     : Win32.Winnt.HANDLE;
      pPosition : in out Win32.Windef.POINT);

   procedure ballSetPosition
     (hBall : Win32.Winnt.HANDLE;
      x     : Win32.LONG;
      y     : Win32.LONG);

   procedure CreateBounceWindow
     (hWndClient : Win32.Windef.HWND;
      nItem      : Win32.INT);

   function BounceProc
     (hWnd_p   : Win32.Windef.HWND;
      wMsg     : Win32.UINT;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.LRESULT;
   pragma Convention (Stdcall, BounceProc);

   function BounceCreateProc (hWnd_p : Win32.Windef.HWND) return Win32.BOOL;

   procedure BounceDestroyProc (hWnd_p : Win32.Windef.HWND);

   function BounceCommandProc
     (hWnd_p   : Win32.Windef.HWND;
      wParam_p : Win32.WPARAM;
      lParam_p : Win32.LPARAM)
      return Win32.BOOL;

   procedure BouncePaintProc (hWnd_p : Win32.Windef.HWND);

   procedure BounceObjects (hWnd_p : Win32.Windef.HWND);

   procedure BounceRefresh (hWnd_p : Win32.Windef.HWND);

   procedure CheckEdgePosition
     (hWnd_p : Win32.Windef.HWND;
      hBall  : Win32.Winnt.HANDLE);

end Bounce;
