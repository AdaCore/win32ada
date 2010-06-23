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

package Win32.Wshisotp is

   ISOPROTO_TP0         : constant := 25;
   ISOPROTO_TP1         : constant := 26;
   ISOPROTO_TP2         : constant := 27;
   ISOPROTO_TP3         : constant := 28;
   ISOPROTO_TP4         : constant := 29;
   ISOPROTO_TP          : constant := 29;
   ISOPROTO_CLTP        : constant := 30;
   ISOPROTO_CLNP        : constant := 31;
   ISOPROTO_X25         : constant := 32;
   ISOPROTO_INACT_NL    : constant := 33;
   ISOPROTO_ESIS        : constant := 34;
   ISOPROTO_INTRAISIS   : constant := 35;
   IPPROTO_RAW          : constant := 255;
   IPPROTO_MAX          : constant := 256;
   ISO_MAX_ADDR_LENGTH  : constant := 64;
   ISO_HIERARCHICAL     : constant := 0;
   ISO_NON_HIERARCHICAL : constant := 1;
   ISO_EXP_DATA_USE     : constant := 8#0#;
   ISO_EXP_DATA_NUSE    : constant := 8#1#;

   type SOCKADDR_TP;

   type PSOCKADDR_TP is access all SOCKADDR_TP;
   subtype LPSOCKADDR_TP is PSOCKADDR_TP;

   type SOCKADDR_TP is record
      tp_family    : Win32.Winsock.u_short;
      tp_addr_type : Win32.Winsock.u_short;
      tp_taddr_len : Win32.Winsock.u_short;
      tp_tsel_len  : Win32.Winsock.u_short;
      tp_addr      : Win32.UCHAR_Array (0 .. ISO_MAX_ADDR_LENGTH - 1);
   end record;

   procedure ISO_SET_TP_ADDR
     (sa_tp   : PSOCKADDR_TP;
      port    : Win32.PUCHAR;
      portlen : Win32.Winsock.u_short;
      node    : Win32.PUCHAR;
      nodelen : Win32.Winsock.u_short);
private

   pragma Convention (C, SOCKADDR_TP);

end Win32.Wshisotp;
