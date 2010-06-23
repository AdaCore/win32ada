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

package body Stdarg.Impl is

   function Address_of_Arg
     (Args  : ArgList) return Param_Access;

   function Address_of_Arg
     (Args  : ArgList) return Param_Access
   is
   begin
      if Args.Contents.CurrentArgs = 0 then
         return null;
      end if;

      return Args.Contents.Vector (1)'Access;
   end Address_of_Arg;

   function Address_of_First_Arg (Args : ArgList) return Param_Access is
   begin
      return Address_of_Arg (Args);
   end Address_of_First_Arg;

   function Address_of_Vararg_List (Args : ArgList) return Param_Access is
   begin
      return Address_of_Arg (Args);
   end Address_of_Vararg_List;

   function ArgCount (Args : ArgList) return Int is
   begin
      return Int (Args.Contents.CurrentArgs);
   end ArgCount;

   function "&" (Left, Right : ArgList) return ArgList is
      Incr                    : Integer;
      Left_Index, Right_Index : Positive;

      procedure Do_Incr (Index : in out Natural);
      pragma Inline (Do_Incr);

      procedure Do_Incr (Index : in out Natural) is
      begin
         Index := Index + Incr;
      end Do_Incr;

   begin
      if Left.Contents = null or else Left.Contents.CurrentArgs = 0 then
         return Right;
      elsif Right.Contents = null
        or else Right.Contents.CurrentArgs = 0
      then
         return Left;
      end if;

      Left_Index  := Left.Contents.CurrentArgs + 1;
      Right_Index := 1;
      Incr        := 1;

      for I in 1 .. Right.Contents.CurrentArgs loop
         Left.Contents.Vector (Left_Index) :=
           Right.Contents.Vector (Right_Index);
         Do_Incr (Left_Index);
         Do_Incr (Right_Index);
      end loop;

      Left.Contents.CurrentArgs := Left.Contents.CurrentArgs +
                                   Right.Contents.CurrentArgs;
      return Left;
   end "&";

end Stdarg.Impl;
