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

package Win32.crt.Timeb is

   type timeb is record
      time     : Win32.crt.Types.time_t;
      millitm  : Win32.USHORT;
      timezone : Win32.SHORT;
      dstflag  : Win32.SHORT;
   end record;

   procedure ftime (result : out timeb);

private

   pragma Convention (C_Pass_By_Copy, timeb);

   pragma Import (C, ftime, "_ftime");

end Win32.crt.Timeb;
