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

with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;

package body Win32.crt.Search is

   type AC_Elem is access constant Elem;

   subtype Unsigned is Interfaces.C.unsigned;

   Elem_Size : constant Unsigned :=
      Unsigned (Elem'Size / System.Storage_Unit);

   function Compare (Left, Right : AC_Elem) return Integer;
   pragma Convention (C, Compare);

   function Compare (Left, Right : AC_Elem) return Integer is
   begin
      if Left.all = Right.all then
         return 0;
      elsif Left.all < Right.all then
         return -1;
      else
         return 1;
      end if;
   end Compare;

   type Compare_Func is access function
     (Left, Right : AC_Elem)
      return Integer;
   pragma Convention (C, Compare_Func);

   function c_bsearch
     (key     : AC_Elem;
      base    : AC_Elem;
      num     : Unsigned;
      width   : Unsigned;
      compare : Compare_Func)
      return AC_Elem;

   function c_lsearch
     (key     : AC_Elem;
      base    : access Elem;
      num     : access Unsigned;
      width   : Unsigned;
      compare : Compare_Func)
      return AC_Elem;

   function c_lfind
     (key     : AC_Elem;
      base    : AC_Elem;
      num     : access Unsigned;
      width   : Unsigned;
      compare : Compare_Func)
      return AC_Elem;

   procedure c_qsort
     (base   : access Elem;
      num    : Unsigned;
      width  : Unsigned;
      compar : Compare_Func);

   pragma Import (C, c_bsearch, "bsearch");
   pragma Import (C, c_lsearch, "_lsearch");
   pragma Import (C, c_lfind, "_lfind");
   pragma Import (C, c_qsort, "qsort");

   function "-" (Left, Right : AC_Elem) return Integer;
   function "-" (Left, Right : AC_Elem) return Integer is
      function To_Int is new Ada.Unchecked_Conversion (AC_Elem, Integer);
   begin
      return (To_Int (Left) - To_Int (Right)) / Integer (Elem_Size);
   end "-";

   procedure Bsearch
     (The_Key   : in Elem;
      The_Array : in Array_of_Elem;
      Result    : out Index)
   is
      Local_Copy : aliased constant Elem := The_Key;
      Res        : constant AC_Elem      :=
         c_bsearch
           (Local_Copy'Unchecked_Access,
            The_Array (The_Array'First)'Unchecked_Access,
            The_Array'Length,
            Elem_Size,
            Compare'Access);
   begin
      if Res = null then
         Result := Not_Found;
      else
         Result := The_Array'First +
                   Index (Res -
                          The_Array (The_Array'First)'Unchecked_Access);
      end if;
   end Bsearch;

   procedure LSearch
     (The_Key         : in Elem;
      The_Array       : in out Array_of_Elem;
      Last_Valid_Elem : in Index;
      Result          : out Index)
   is
      Local_Copy : aliased constant Elem := The_Key;
      Res        : AC_Elem;
      Len        : aliased Unsigned      :=
         Unsigned (Last_Valid_Elem - The_Array'First + 1);
   begin
      if Last_Valid_Elem < The_Array'Last then
         Res    :=
            c_lsearch
              (Local_Copy'Unchecked_Access,
               The_Array (The_Array'First)'Unchecked_Access,
               Len'Access,
               Elem_Size,
               Compare'Access);
         Result := The_Array'First +
                   Index (Res -
                          The_Array (The_Array'First)'Unchecked_Access);
      else
         Lfind (The_Key, The_Array, Result);
         if Result = Not_Found then
            raise Constraint_Error;
         end if;
      end if;
   end LSearch;

   procedure Lfind
     (The_Key   : in Elem;
      The_Array : in Array_of_Elem;
      Result    : out Index)
   is

      Local_Copy : aliased constant Elem := The_Key;
      Len        : aliased Unsigned      := The_Array'Length;
      Res        : constant AC_Elem      :=
         c_lfind
           (Local_Copy'Unchecked_Access,
            The_Array (The_Array'First)'Unchecked_Access,
            Len'Access,
            Elem_Size,
            Compare'Access);
   begin
      if Res = null then
         Result := Not_Found;
      else
         Result := The_Array'First +
                   Index (Res -
                          The_Array (The_Array'First)'Unchecked_Access);
      end if;
   end Lfind;

   procedure Qsort (The_Array : in out Array_of_Elem) is
   begin
      c_qsort
        (The_Array (The_Array'First)'Access,
         The_Array'Length,
         Elem_Size,
         Compare'Access);
   end Qsort;

end Win32.crt.Search;
