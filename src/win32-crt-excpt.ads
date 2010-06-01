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

with Win32.Winnt;

package Win32.crt.Excpt is

   EXCEPTION_EXECUTE_HANDLER    : constant := 1;
   EXCEPTION_CONTINUE_SEARCH    : constant := 0;
   EXCEPTION_CONTINUE_EXECUTION : constant := -1;

   type EXCEPTION_DISPOSITION is (
      ExceptionContinueExecution,
      ExceptionContinueSearch,
      ExceptionNestedException,
      ExceptionCollidedUnwind);
   for EXCEPTION_DISPOSITION'Size use 32;

   function except_handler
     (ExceptionRecord   : Win32.Winnt.PEXCEPTION_RECORD;
      EstablisherFrame  : Win32.PVOID;
      ContextRecord     : Win32.Winnt.PCONTEXT;
      DispatcherContext : Win32.PVOID)
      return EXCEPTION_DISPOSITION;

private

   pragma Import (C, except_handler, "_except_handler");

end Win32.crt.Excpt;
