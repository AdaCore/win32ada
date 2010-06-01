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

package Win32.crt.Signal is

   NSIG     : constant := 23;
   SIGINT   : constant := 2;
   SIGILL   : constant := 4;
   SIGFPE   : constant := 8;
   SIGSEGV  : constant := 11;
   SIGTERM  : constant := 15;
   SIGBREAK : constant := 21;
   SIGABRT  : constant := 22;

   type Handler is access procedure
     (sig     : in Win32.INT;
      subcode : in Win32.INT := 0);
   pragma Convention (Stdcall, Handler);

   SIG_DFL : constant Handler;
   SIG_IGN : constant Handler;
   SIG_SGE : constant Handler;
   SIG_ACK : constant Handler;
   SIG_ERR : constant Handler;

   type sig_atomic_t is new Win32.INT;

   function signal (sig : Win32.INT; func : Handler) return Handler;

   function c_raise (sig : Win32.INT) return Win32.INT;

private

   function To_Handler is new Ada.Unchecked_Conversion (LONG_PTR, Handler);

   SIG_DFL : constant Handler := To_Handler (0);
   SIG_IGN : constant Handler := To_Handler (1);
   SIG_SGE : constant Handler := To_Handler (3);
   SIG_ACK : constant Handler := To_Handler (4);
   SIG_ERR : constant Handler := To_Handler (LONG_PTR'Last);

   pragma Import (C, signal, "signal");
   pragma Import (C, c_raise, "raise");

end Win32.crt.Signal;
