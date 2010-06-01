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

with Win32.Winsock;

package Win32.Wsnetbs is

   NETBIOS_NAME_LENGTH     : constant := 16;
   NETBIOS_GROUP_NAME      : constant := 16#80#;
   NETBIOS_UNIQUE_NAME     : constant := 16#0#;
   NETBIOS_REGISTERING     : constant := 16#0#;
   NETBIOS_REGISTERED      : constant := 16#4#;
   NETBIOS_DEREGISTERED    : constant := 16#5#;
   NETBIOS_DUPLICATE       : constant := 16#6#;
   NETBIOS_DUPLICATE_DEREG : constant := 16#7#;
   NBPROTO_NETBEUI         : constant := 17001;

   type SOCKADDR_NB;

   type PSOCKADDR_NB is access all SOCKADDR_NB;
   subtype LPSOCKADDR_NB is PSOCKADDR_NB;

   type SOCKADDR_NB is record
      snb_family : Win32.SHORT;
      snb_type   : Win32.Winsock.u_short;
      snb_name   : Win32.CHAR_Array (0 .. NETBIOS_NAME_LENGTH - 1);
   end record;

   procedure SET_NETBIOS_SOCKADDR
     (snb      : PSOCKADDR_NB;
      the_type : Win32.Winsock.u_short;
      name     : Win32.PCHAR;
      port     : Win32.CHAR);

private

   pragma Convention (C, SOCKADDR_NB);

end Win32.Wsnetbs;
