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


package body Win32.wsnetbs is

   use type Interfaces.C.size_t;

   procedure SET_NETBIOS_SOCKADDR (snb : PSOCKADDR_NB;
                                   the_type : Win32.Winsock.u_short;
                                   name : Win32.PCHAR;
                                   port : Win32.CHAR)  is    --  wsnetbs.h:44

--        function To_PChar is new Ada.Unchecked_Conversion
--          (Integer, Win32.PCHAR);
--        function To_Int is new Ada.Unchecked_Conversion
--          (Win32.PCHAR, Integer);
--        function To_char is new Ada.Unchecked_Conversion
--          (Win32.CHAR, Character);

      i : Integer;
      --  name_next: Win32.PCHAR;
   begin
      snb.all.snb_family := Win32.Winsock.AF_NETBIOS;
      snb.all.snb_type := the_type;
      for idx in 0 .. NETBIOS_NAME_LENGTH - 1 loop
         snb.all.snb_name (idx) := ' ';
      end loop;
      i := 0;
      --  name_next := To_PCHAR(To_Int(name) + i);
      --  while (To_char(name_next.all) /= Ascii.nul and
      --  i < NETBIOS_NAME_LENGTH-1) loop
      --  snb.all.snb_name(i) := name_next.all;
      while ((Interfaces.C.Strings.Value (Win32.To_Chars_Ptr (name))(i)
        /= ASCII.NUL) and (i < NETBIOS_NAME_LENGTH - 1)) loop
         snb.all.snb_name (i) := Win32.CHAR (Interfaces.C.Strings.Value
           (Win32.To_Chars_Ptr (name))(i));
         i := i + 1;
         --  name_next := To_PCHAR(To_Int(name) + i);
      end loop;
      snb.all.snb_name (NETBIOS_NAME_LENGTH - 1) := port;
   end SET_NETBIOS_SOCKADDR;

end Win32.wsnetbs;


