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
with Ada.Unchecked_Deallocation;
with System;
with System.Address_To_Access_Conversions;

package body Extensible is

   type Extended_Rec is new String;

   Bytes_Per_Elem : constant Natural :=
      Extensible_Elem'Size / System.Storage_Unit;

   function Allocate (Actual_Elems : Big_Range) return Extended_Ptr is
      Result : constant Extended_Ptr :=
         new Extended_Rec (
         1 ..
         Position_Of_Extensible_Array +
         Natural (Actual_Elems) * Bytes_Per_Elem);
   begin
      return Result;
   end Allocate;

   procedure Free (Ptr : in out Extended_Ptr) is
      procedure doFree is new Ada.Unchecked_Deallocation (
         Extended_Rec,
         Extended_Ptr);
   begin
      doFree (Ptr);
   end Free;

   function Fixed_Part (Ptr : Extended_Ptr) return Fixed_Ptr is
      function To_Fixed is new Ada.Unchecked_Conversion (
         System.Address,
         Fixed_Ptr);
   begin
      if Ptr = null then
         return null;
      else
         return To_Fixed (Ptr (1)'Address);
      end if;
   end Fixed_Part;

   package Conv is new System.Address_To_Access_Conversions (Big_Array);

   function Array_Part (Ptr : Extended_Ptr) return Big_Array_Ptr is
   begin
      if Ptr = null then
         return null;
      else
         return Big_Array_Ptr (Conv.To_Pointer
                                  (Ptr (Position_Of_Extensible_Array + 1)'
           Address));
      end if;
   end Array_Part;

end Extensible;
