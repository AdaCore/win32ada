--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-excpt.ads, v $
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

with Win32.Winnt;

package Win32.crt.Excpt is

   EXCEPTION_EXECUTE_HANDLER : constant := 1;           --  excpt.h :143
   EXCEPTION_CONTINUE_SEARCH : constant := 0;           --  excpt.h :144
   EXCEPTION_CONTINUE_EXECUTION : constant := -1;          --  excpt.h :145

   type EXCEPTION_DISPOSITION is ( --  excpt.h :46
     ExceptionContinueExecution,                         --  excpt.h :47
     ExceptionContinueSearch,                            --  excpt.h :48
     ExceptionNestedException,                           --  excpt.h :49
     ExceptionCollidedUnwind                             --  excpt.h :51
                                 );
   for EXCEPTION_DISPOSITION'Size use 32;                  --  excpt.h :46

   function except_handler (ExceptionRecord : Win32.Winnt.PEXCEPTION_RECORD;
                            EstablisherFrame : Win32.PVOID;
                            ContextRecord : Win32.Winnt.PCONTEXT;
                            DispatcherContext : Win32.PVOID)
                           return EXCEPTION_DISPOSITION;        --  excpt.h :66

private

   pragma Import (C, except_handler, "_except_handler");    --  excpt.h :66

end Win32.crt.Excpt;


