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

package body Win32.Ole2 is

   procedure DISCARDCACHE_to_xmit
     (pEnum  : PDISCARDCACHE;
      ppLong : Win32.PLONG)
   is
      function To_LONG is new Ada.Unchecked_Conversion (
         DISCARDCACHE,
         Win32.LONG);
   begin
      ppLong.all := To_LONG (pEnum.all);
   end DISCARDCACHE_to_xmit;

   procedure DISCARDCACHE_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PDISCARDCACHE)
   is
      function To_DISCARDCACHE is new Ada.Unchecked_Conversion (
         Win32.LONG,
         DISCARDCACHE);
   begin
      pEnum.all := To_DISCARDCACHE (pLong.all);
   end DISCARDCACHE_from_xmit;

end Win32.Ole2;
