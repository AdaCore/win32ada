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
--  Copyright (C) 2000-2011, AdaCore
--
-------------------------------------------------------------------------------

package body Win32.crt.Math is

   type AD is access Win32.DOUBLE;

   package HUGE_Constant is
      huge_addr : constant AD;
#if HOST = "Win32" then
      pragma Import (C, huge_addr, "_imp___HUGE");
#else
      pragma Import (C, huge_addr, "__imp__HUGE");
#end if;
   end HUGE_Constant;

   function HUGE return Win32.DOUBLE is
   begin
      return HUGE_Constant.huge_addr.all;
   end HUGE;

end Win32.crt.Math;
