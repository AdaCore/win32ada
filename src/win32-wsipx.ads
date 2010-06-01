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

package Win32.Wsipx is

   NSPROTO_IPX   : constant := 1000;
   NSPROTO_SPX   : constant := 1256;
   NSPROTO_SPXII : constant := 1257;

   type SOCKADDR_IPX;

   type PSOCKADDR_IPX is access all SOCKADDR_IPX;
   subtype LPSOCKADDR_IPX is PSOCKADDR_IPX;

   type SOCKADDR_IPX is record
      sa_family  : Win32.SHORT;
      sa_netnum  : Win32.CHAR_Array (0 .. 3);
      sa_nodenum : Win32.CHAR_Array (0 .. 5);
      sa_socket  : Win32.USHORT;
   end record;

private

   pragma Convention (C_Pass_By_Copy, SOCKADDR_IPX);

end Win32.Wsipx;
