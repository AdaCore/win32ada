------------------------------------------------------------------------------
--                               Win32Ada                                   --
--                                                                          --
--                    Copyright (C) 2010-2014, AdaCore                      --
--                                                                          --
--  This library is free software; you can redistribute it and/or modify    --
--  it under the terms of the GNU General Public License as published by    --
--  the Free Software Foundation; either version 2 of the License, or (at   --
--  your option) any later version.                                         --
--                                                                          --
--  This library is distributed in the hope that it will be useful, but     --
--  WITHOUT ANY WARRANTY; without even the implied warranty of              --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU       --
--  General Public License for more details.                                --
--                                                                          --
--  You should have received a copy of the GNU General Public License       --
--  along with this library; if not, write to the Free Software Foundation, --
--  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.          --
--                                                                          --
--  As a special exception, if other files instantiate generics from this   --
--  unit, or you link this unit with other files to produce an executable,  --
--  this  unit  does not  by itself cause  the resulting executable to be   --
--  covered by the GNU General Public License. This exception does not      --
--  however invalidate any other reasons why the executable file  might be  --
--  covered by the  GNU Public License.                                     --
------------------------------------------------------------------------------

with Ada.Command_Line;
with Ada.Strings.Fixed;
with Ada.Text_IO;

procedure Driver is
   use Ada;
   use Ada.Strings;

   type Mode_Kind is (Default, Error_Only, Sizes);

   A_File, C_File : Text_IO.File_Type;
   Mode           : Mode_Kind := Default;

   procedure Gen_Init;
   --  Initialize generation

   procedure Gen_Final;
   --  Finalize generation

   procedure Gen_Size_Check (Name : String);
   --  Generate a code to check the size of the given type Name

   procedure Gen_Offset_Check (Name : String);
   --  Generate a check for a field offset

   function Prefix (Str : String; Sep : Character := '.') return String;
   function Suffix (Str : String; Sep : Character := '.') return String;
   --  Simple name, remove leading prefix before Sep is any

   ------------
   -- Prefix --
   ------------

   function Prefix (Str : String; Sep : Character := '.') return String is
      I : constant Natural := Strings.Fixed.Index (Str, String'(1 => Sep));
   begin
      if I = 0 then
         return Str;
      else
         return Str (Str'First .. I - 1);
      end if;
   end Prefix;

   ------------
   -- Suffix --
   ------------

   function Suffix (Str : String; Sep : Character := '.') return String is
      I : constant Natural := Strings.Fixed.Index (Str, String'(1 => Sep));
   begin
      if I = 0 then
         return Str;
      else
         return Str (I + 1 .. Str'Last);
      end if;
   end Suffix;

   --------------
   -- Gen_Init --
   --------------

   procedure Gen_Init is
   begin
      Text_IO.Create (A_File, Text_IO.Out_File, "runcheck.adb");
      Text_IO.Create (C_File, Text_IO.Out_File, "csupport.c");

      --  Ada

      Text_IO.Put_Line (A_File, "with Ada.Text_IO;");
      Text_IO.Put_Line (A_File, "with Ada.Strings.Unbounded;");
      Text_IO.Put_Line (A_File, "with Win32;");
      Text_IO.Put_Line (A_File, "with Win32.Winbase;");
      Text_IO.Put_Line (A_File, "with Win32.Windef;");
      Text_IO.Put_Line (A_File, "with Win32.Winnt;");
      Text_IO.Put_Line (A_File, "with Win32.Winuser;");
      Text_IO.Put_Line (A_File, "with Win32.Rpcndr;");
      Text_IO.Put_Line (A_File, "with Win32.Wingdi;");
      Text_IO.Put_Line (A_File, "with Win32.Ddeml;");
      Text_IO.Put_Line (A_File, "with Win32.Dde;");
      Text_IO.Put_Line (A_File, "with Win32.Accctrl;");
      Text_IO.Put_Line (A_File, "procedure RunCheck is");
      Text_IO.Put_Line (A_File, "   use Ada;");
      Text_IO.Put_Line (A_File, "   use Ada.Strings.Unbounded;");
      Text_IO.Put_Line (A_File, "   use Win32;");
      Text_IO.Put_Line (A_File, "   use Win32.Winbase;");
      Text_IO.Put_Line (A_File, "   use Win32.Windef;");
      Text_IO.Put_Line (A_File, "   use Win32.Winnt;");
      Text_IO.Put_Line (A_File, "   use Win32.Winuser;");
      Text_IO.Put_Line (A_File, "   use Win32.Rpcndr;");
      Text_IO.Put_Line (A_File, "   use Win32.Wingdi;");
      Text_IO.Put_Line (A_File, "   use Win32.Ddeml;");
      Text_IO.Put_Line (A_File, "   use Win32.Dde;");
      Text_IO.Put_Line (A_File, "   use Win32.Accctrl;");
      Text_IO.Put_Line (A_File, "   Errors : Natural := 0;");
      Text_IO.Put_Line (A_File, "   Checks : Natural := 0;");
      Text_IO.Put_Line (A_File, "   Xfail  : Unbounded_String;");
      Text_IO.Put_Line (A_File, "begin");

      --  C

      Text_IO.Put_Line (C_File, "#include <windows.h>");
      Text_IO.Put_Line (C_File, "#include <aclapi.h>");
   end Gen_Init;

   ---------------
   -- Gen_Final --
   ---------------

   procedure Gen_Final is
   begin
      --  Ada
      Text_IO.Put_Line (A_File, "   Text_IO.New_Line;");
      Text_IO.Put_Line
        (A_File, "   Text_IO.Put_Line (""Checks ="" & Checks'Img);");
      Text_IO.Put_Line
        (A_File, "   Text_IO.Put_Line (""Errors ="" & Errors'Img);");
      Text_IO.Put_Line (A_File, "end RunCheck;");

      Text_IO.Close (A_File);
      Text_IO.Close (C_File);
   end Gen_Final;

   --------------------
   -- Gen_Size_Check --
   --------------------

   procedure Gen_Size_Check (Name : String) is
      SN : constant String := Suffix (Name);
   begin
      --  Ada

      Text_IO.Put_Line (A_File, "   declare");
      Text_IO.Put_Line
        (A_File,
         "      function size_of_" & SN & " return Natural;");
      Text_IO.Put_Line
        (A_File,
         "      pragma Import (C, size_of_"
           & SN & ", ""size_of_" & SN & """);");
      Text_IO.Put_Line (A_File, "      A_Size : constant Natural :=");
      Text_IO.Put_Line
        (A_File, "                 " & Name & "'Object_Size / 8;");
      Text_IO.Put_Line (A_File, "      C_Size : constant Natural :=");
      Text_IO.Put_Line (A_File, "                 size_of_" & SN & ";");
      Text_IO.Put_Line (A_File, "   begin");
      Text_IO.Put_Line (A_File, "      if C_Size = A_Size then");
      if Mode = Error_Only then
         Text_IO.Put_Line (A_File, "         null;");
      else
         Text_IO.Put_Line
           (A_File, "         Text_IO.Put (""OK " & Name & """);");
         if Mode = Sizes then
            Text_IO.Put_Line (A_File, "         Text_IO.Set_Col (40);");
            Text_IO.Put_Line
              (A_File, "         Text_IO.Put_Line (A_Size'Img);");
         else
            Text_IO.Put_Line (A_File, "         Text_IO.New_Line;");
         end if;
      end if;
      Text_IO.Put_Line (A_File, "      else");
      Text_IO.Put_Line
        (A_File, "         if Xfail = Null_Unbounded_String then");
      Text_IO.Put_Line
        (A_File, "            Text_IO.Put (""NOK   "");");
      Text_IO.Put_Line (A_File, "            Errors := Errors + 1;");
      Text_IO.Put_Line
        (A_File, "         else");
      Text_IO.Put_Line
        (A_File, "            Text_IO.Put (""XFAIL "");");
      Text_IO.Put_Line
        (A_File, "         end if;");
      Text_IO.Put_Line
        (A_File, "         Text_IO.Put (""" & Name & ": "");");
      Text_IO.Put_Line (A_File, "         Text_IO.Set_Col (40);");
      Text_IO.Put_Line
        (A_File, "         Text_IO.Put (""sizes, C ="" & C_Size'Img);");
      Text_IO.Put_Line
        (A_File,
         "         Text_IO.Put ("" and Ada ="" & A_Size'Img);");
      Text_IO.Put_Line
        (A_File,
         "         Text_IO.Put_Line ("" "" & To_String (Xfail));");
      Text_IO.Put_Line (A_File, "      end if;");
      Text_IO.Put_Line (A_File, "      Checks := Checks + 1;");
      Text_IO.Put_Line (A_File, "   end;");

      --  C

      Text_IO.Put_Line (C_File, "int size_of_" & SN & " (void)");
      Text_IO.Put_Line (C_File, "{");
      Text_IO.Put_Line (C_File, "   return sizeof(" & SN & ");");
      Text_IO.Put_Line (C_File, "}");
   end Gen_Size_Check;

   ----------------------
   -- Gen_Offset_Check --
   ----------------------

   procedure Gen_Offset_Check (Name : String) is
      Struct : constant String := Prefix (Name, '-');
      Field  : constant String := Suffix (Name, '-');
      R      : constant String := Struct & "_" & Field; -- Routine name
      E      : constant String := Struct & "." & Field; -- Entity
   begin
      --  Ada

      Text_IO.Put_Line (A_File, "   declare");
      Text_IO.Put_Line
        (A_File,
         "      function offset_of_" & R & " return Natural;");
      Text_IO.Put_Line
        (A_File,
         "      pragma Import (C, offset_of_"
           & R & ", ""offset_of_" & R & """);");
      Text_IO.Put_Line (A_File, "      V : " & Struct & " := (others => <>);");
      Text_IO.Put_Line (A_File, "      A_Off : constant Natural :=");
      Text_IO.Put_Line
        (A_File, "                 V." & Field & "'Bit_Position / 8;");
      Text_IO.Put_Line (A_File, "      C_Off : constant Natural :=");
      Text_IO.Put_Line
        (A_File, "                 offset_of_" & R & ";");
      Text_IO.Put_Line (A_File, "   begin");
      Text_IO.Put_Line (A_File, "      if C_Off = A_Off then");
      if Mode = Error_Only then
         Text_IO.Put_Line (A_File, "         null;");
      else
         Text_IO.Put_Line
           (A_File, "         Text_IO.Put (""OK " & Field & """);");
         if Mode = Sizes then
            Text_IO.Put_Line (A_File, "         Text_IO.Set_Col (40);");
            Text_IO.Put_Line
              (A_File, "         Text_IO.Put_Line (A_Off'Img);");
         else
            Text_IO.Put_Line (A_File, "         Text_IO.New_Line;");
         end if;
      end if;
      Text_IO.Put_Line (A_File, "      else");
      Text_IO.Put_Line
        (A_File, "         if Xfail = Null_Unbounded_String then");
      Text_IO.Put_Line
        (A_File, "            Text_IO.Put (""NOK   "");");
      Text_IO.Put_Line (A_File, "            Errors := Errors + 1;");
      Text_IO.Put_Line
        (A_File, "         else");
      Text_IO.Put_Line
        (A_File, "            Text_IO.Put (""XFAIL "");");
      Text_IO.Put_Line
        (A_File, "         end if;");
      Text_IO.Put_Line
        (A_File, "         Text_IO.Put (""" & Field & ": "");");
      Text_IO.Put_Line (A_File, "         Text_IO.Set_Col (40);");
      Text_IO.Put_Line
        (A_File, "         Text_IO.Put (""offsets, C ="" & C_Off'Img);");
      Text_IO.Put_Line
        (A_File,
         "         Text_IO.Put ("" and Ada ="" & A_Off'Img);");
      Text_IO.Put_Line
        (A_File,
         "         Text_IO.Put_Line ("" "" & To_String (Xfail));");
      Text_IO.Put_Line (A_File, "      end if;");
      Text_IO.Put_Line (A_File, "      Checks := Checks + 1;");
      Text_IO.Put_Line (A_File, "   end;");

      --  C

      Text_IO.Put_Line
        (C_File, "int offset_of_" & Struct & "_" & Field & " (void)");
      Text_IO.Put_Line (C_File, "{");
      Text_IO.Put_Line (C_File, "   " & Struct & " v;");
      Text_IO.Put_Line
        (C_File, "   return (void*)&(v." & Field & ") - (void*)&v;");
      Text_IO.Put_Line (C_File, "}");
   end Gen_Offset_Check;

   File    : Text_IO.File_Type;
   Buffer  : String (1 .. 256);
   Last, L : Natural;
   FI      : Positive := 1;

begin
   if Command_Line.Argument_Count = 0 then
      Text_IO.Put_Line ("Usage: driver [-es] <type_file>");
      Text_IO.Put_Line ("       -e : report only errors");
      Text_IO.Put_Line ("       -s : report all sizes");

   else
      if Command_Line.Argument (1) = "-e" then
         Mode := Error_Only;
         Fi := FI + 1;
      elsif Command_Line.Argument (1) = "-s" then
         Mode := Sizes;
         Fi := FI + 1;
      end if;

      Gen_Init;

      Text_IO.Open (File, Text_IO.In_File, Command_Line.Argument (FI));

      while not Text_IO.End_Of_File (File) loop
         Text_IO.Get_Line (File, Buffer, Last);

         if Last /= 0 then
            if Buffer (1) = '#' then
               null;

            else
               L := Strings.Fixed.Index (Buffer (1 .. Last), "^");
               if  L /= 0 then
                  Text_IO.Put_Line
                    (A_File,
                     "   Xfail := To_Unbounded_String ("""
                       & Strings.Fixed.Trim
                         (Buffer (L + 1 .. Last), Strings.Both) & """);");
                  Last := L - 1;
                  while Buffer (Last) = ' ' loop
                     Last := Last - 1;
                  end loop;

               else
                  Text_IO.Put_Line
                    (A_File,
                     "   Xfail := Null_Unbounded_String;");
               end if;

               if Strings.Fixed.Index (Buffer (1 .. Last), "-") = 0 then
                  Gen_Size_Check (Buffer (1 .. Last));
               else
                  Gen_Offset_Check (Buffer (1 .. Last));
               end if;
            end if;
         end if;
      end loop;

      Gen_Final;
   end if;
end Driver;
