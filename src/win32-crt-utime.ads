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

with Win32.crt.Types;

package Win32.crt.Utime is

   type utimbuf is record
      actime  : Win32.crt.Types.time_t;
      modtime : Win32.crt.Types.time_t;
   end record;

   function utime (p1 : Win32.PSTR; p2 : access utimbuf) return Win32.INT;

   function futime (p1 : Win32.INT; p2 : access utimbuf) return Win32.INT;

private

   pragma Convention (C_Pass_By_Copy, utimbuf);

   pragma Import (C, utime, "_utime");
   pragma Import (C, futime, "_futime");

end Win32.crt.Utime;
