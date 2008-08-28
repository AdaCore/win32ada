--  $Source$
--  $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
--  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
--  FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
--  the accuracy and the use of this file.  This file may be used, copied,
--  modified and distributed only by licensees of Microsoft Corporation's
--  WIN32 Software Development Kit in accordance with the terms of the
--  licensee's End-User License Agreement for Microsoft Software for the
--  WIN32 Development Kit.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Portions (c) 1985-1994 Microsoft Corporation with permission.
--  Microsoft is a registered trademark and Windows and Windows NT are
--  trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

with Win32.Winsock;

package Win32.Wsnetbs is

   NETBIOS_NAME_LENGTH : constant := 16;               --  wsnetbs.h:18
   NETBIOS_GROUP_NAME : constant := 16#80#;           --  wsnetbs.h:31
   NETBIOS_UNIQUE_NAME : constant := 16#0#;            --  wsnetbs.h:32
   NETBIOS_REGISTERING : constant := 16#0#;            --  wsnetbs.h:33
   NETBIOS_REGISTERED : constant := 16#4#;            --  wsnetbs.h:34
   NETBIOS_DEREGISTERED : constant := 16#5#;            --  wsnetbs.h:35
   NETBIOS_DUPLICATE : constant := 16#6#;            --  wsnetbs.h:36
   NETBIOS_DUPLICATE_DEREG : constant := 16#7#;            --  wsnetbs.h:37
   NBPROTO_NETBEUI : constant := 17001;            --  wsnetbs.h:63

   type SOCKADDR_NB;                                       --  wsnetbs.h:20

   type PSOCKADDR_NB is access all SOCKADDR_NB;            --  wsnetbs.h:24
   subtype LPSOCKADDR_NB is PSOCKADDR_NB;                  --  wsnetbs.h:24

   type SOCKADDR_NB is                                     --  wsnetbs.h:20
      record
         snb_family : Win32.SHORT;                        --  wsnetbs.h:21
         snb_type : Win32.Winsock.u_short;              --  wsnetbs.h:22
         snb_name : Win32.CHAR_Array (0 .. NETBIOS_NAME_LENGTH - 1);
         --  wsnetbs.h:23
      end record;

   procedure SET_NETBIOS_SOCKADDR (snb : PSOCKADDR_NB;
                                   the_type : Win32.Winsock.u_short;
                                   name : Win32.PCHAR;
                                   port : Win32.CHAR);   --  wsnetbs.h:44

private

   pragma Convention (C, SOCKADDR_NB);                      --  wsnetbs.h:20

end Win32.Wsnetbs;
