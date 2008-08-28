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

package Win32.Wsipx is

   NSPROTO_IPX : constant := 1000;                       --  wsipx.h:50
   NSPROTO_SPX : constant := 1256;                       --  wsipx.h:51
   NSPROTO_SPXII : constant := 1257;                       --  wsipx.h:52

   type SOCKADDR_IPX;                                      --  wsipx.h:38

   type PSOCKADDR_IPX is access all SOCKADDR_IPX;          --  wsipx.h:43
   subtype LPSOCKADDR_IPX is PSOCKADDR_IPX;                --  wsipx.h:43

   type SOCKADDR_IPX is                                    --  wsipx.h:38
      record
         sa_family  : Win32.SHORT;               --  wsipx.h:39
         sa_netnum  : Win32.CHAR_Array (0 .. 3); --  wsipx.h:40
         sa_nodenum : Win32.CHAR_Array (0 .. 5); --  wsipx.h:41
         sa_socket  : Win32.USHORT;              --  wsipx.h:42
      end record;

private

   pragma Convention (C_Pass_By_Copy, SOCKADDR_IPX);          --  wsipx.h:38

end Win32.Wsipx;
