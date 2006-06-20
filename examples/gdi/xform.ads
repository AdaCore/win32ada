-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- $Id$
--
--  This is a translation of xform.h which is a member of the Microsoft
--  gdidemo sample application.  The c version was not completed or used
--  as part of the sample application.


with Win32;  use Win32;
with Win32.WinDef;
with Win32.WinGdi;
with Interfaces.C;
with Convert;

package Xform is

  xformclass_str : aliased constant Win32.CHAR_ARRAY := "XFORMDEMO" & Nul;
  xformtitle_str : aliased constant Win32.CHAR_ARRAY := "Transform Demo" & Nul;
  XFORMCLASS     : Win32.LPCSTR := Convert.CP(xformclass_str);
  XFORMTITLE     : Win32.LPCSTR := Convert.CP(xformtitle_str); 

  --  typedef struct _XFORMDATA
  --  {
  --  #ifndef NOT_IMPLEMENTED
  --      XFORM xForm;
  --  #endif
  --      POINT pObject[4];
  --      int   nObject;
  --  } XFORMDATA;
  type pt_array is array (0 .. 3) of aliased Win32.WinDef.POINT;
  type XFORMDATA is record
    xForm   : aliased Win32.WinGdi.XFORM;
    pObject : aliased pt_array;
    nObject : Win32.INT;
  end record;
  type PXFORMDATA is access XFORMDATA;

  -- /*
  -- ** XFORM WINDOW ROUTINES (xform.c)
  -- */
  procedure CreateXFormWindow (hWndClient : Win32.WinDef.HWND;
                               nItem      : Win32.INT);

  function XFormProc (hWnd_p   : Win32.WinDef.HWND;
                      wMsg     : Win32.UINT;
                      wParam_p : Win32.WPARAM;
                      lParam_p : Win32.LPARAM) return Win32.LRESULT;
  pragma Convention (Stdcall, XFormProc);

  function XFormCreateProc (hWnd_p : Win32.WinDef.HWND) return Win32.BOOL;

  procedure XFormDestroyProc (hWnd_p : Win32.WinDef.HWND);

  function XFormCommandProc (hWnd_p   : Win32.WinDef.HWND;
                             wParam_p : Win32.WPARAM;
                             lParam_p : Win32.LPARAM) return Win32.BOOL;

  procedure XFormPaintProc (hWnd_p : Win32.WinDef.HWND);

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

end Xform;
