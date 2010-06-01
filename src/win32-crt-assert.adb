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

with Interfaces.C, Interfaces.C.Strings;

package body Win32.crt.Assert is

   procedure Fail
     (Message, Source_File : Interfaces.C.Strings.chars_ptr;
      Line_Number          : Interfaces.C.unsigned);

   pragma Import (C, Fail, "_assert");

   procedure Fail_Assertion
     (Message, Source_File : String;
      Line_Number          : Natural);

   procedure Fail_Assertion
     (Message, Source_File : String;
      Line_Number          : Natural)
   is

   begin
      Fail
        (Interfaces.C.Strings.New_String (Message),
         Interfaces.C.Strings.New_String (Source_File),
         Interfaces.C.unsigned (Line_Number));
   end Fail_Assertion;

   procedure Assert
     (Condition   : Boolean;
      Message     : String  := "(no message)";
      Source_File : String  := "(no source file)";
      Line_Number : Natural := 0)
   is
   begin
      if DEBUG and then not Condition then
         Fail_Assertion (Message, Source_File, Line_Number);
      end if;
   end Assert;

end Win32.crt.Assert;
