--  $Source$

--  $Revision$ $Date$ $Author$

-------------------------------------------------------------------------------

--

--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"

--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING

--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY

--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the

--  entire risk as to the accuracy and the use of this file.

--

--  Copyright (c) Intermetrics, Inc. 1995

--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,

--  reproduction and further distribution of this file is permitted.

--

-------------------------------------------------------------------------------





with Ada.Unchecked_Conversion;



package body Win32.Ole2 is



   pragma Warnings (Off);

   procedure DISCARDCACHE_to_xmit (pEnum : in PDISCARDCACHE;

                                   ppLong : out Win32.PLONG) is --  ole2.h:649



      function To_LONG is new Ada.Unchecked_Conversion (DISCARDCACHE,

                                                        Win32.LONG);

   begin

      ppLong.all := To_LONG (pEnum.all);

   end DISCARDCACHE_to_xmit;



   procedure DISCARDCACHE_from_xmit (pLong : in Win32.PLONG;

                                     pEnum : out PDISCARDCACHE) is

      --  ole2.h:650

      function To_DISCARDCACHE is new Ada.Unchecked_Conversion (Win32.LONG,

                                                                DISCARDCACHE);

   begin

      pEnum.all := To_DISCARDCACHE (pLong.all);

   end DISCARDCACHE_from_xmit;

   pragma Warnings (On);



end Win32.Ole2;





