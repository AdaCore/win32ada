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

package body Win32.crt.PerThread is

   function Get_Address (Which : Per_Thread_Object) return System.Address is
      function Errno_Addr return System.Address;
      pragma Import (C, Errno_Addr, "_errno");

      function DOSErrno_Addr return System.Address;
      pragma Import (C, DOSErrno_Addr, "__doserrno");

   begin
      case Which is
         when Errno =>
            return Errno_Addr;
         when Doserrno =>
            return DOSErrno_Addr;
      end case;
   end Get_Address;

end Win32.crt.PerThread;
