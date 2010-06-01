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

package body Win32.Wsnetbs is

   use type Interfaces.C.size_t;

   procedure SET_NETBIOS_SOCKADDR
     (snb      : PSOCKADDR_NB;
      the_type : Win32.Winsock.u_short;
      name     : Win32.PCHAR;
      port     : Win32.CHAR)
   is

      i : Integer;
   begin
      snb.all.snb_family := Win32.Winsock.AF_NETBIOS;
      snb.all.snb_type   := the_type;
      for idx in 0 .. NETBIOS_NAME_LENGTH - 1 loop
         snb.all.snb_name (idx) := ' ';
      end loop;
      i := 0;
      while (Interfaces.C.Strings.Value (Win32.To_Chars_Ptr (name)) (i) /=
             ASCII.NUL) and
            (i < NETBIOS_NAME_LENGTH - 1)
      loop
         snb.all.snb_name (i) :=
           Win32.CHAR (Interfaces.C.Strings.Value
                          (Win32.To_Chars_Ptr (name)) (i));
         i                    := i + 1;
      end loop;
      snb.all.snb_name (NETBIOS_NAME_LENGTH - 1) := port;
   end SET_NETBIOS_SOCKADDR;

end Win32.Wsnetbs;
