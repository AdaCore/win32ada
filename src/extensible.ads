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
with Interfaces.C;

generic
   type Fixed_Rec is private;
   type Extensible_Elem is private;
   Position_Of_Extensible_Array : Natural;
package Extensible is
   Max : constant := Interfaces.C.unsigned'Last;

   subtype Big_Range is Interfaces.C.unsigned range 0 .. Max;

   type Big_Array is array (Big_Range) of aliased Extensible_Elem;

   type Big_Array_Ptr is access all Big_Array;

   type Fixed_Ptr is access all Fixed_Rec;

   type Extended_Ptr is private;

   function Allocate (Actual_Elems : Big_Range) return Extended_Ptr;

   procedure Free (Ptr : in out Extended_Ptr);

   function Fixed_Part (Ptr : Extended_Ptr) return Fixed_Ptr;

   function Array_Part (Ptr : Extended_Ptr) return Big_Array_Ptr;

private

   type Extended_Rec;
   type Extended_Ptr is access Extended_Rec;

   pragma Inline (Allocate);
   pragma Inline (Free);
   pragma Inline (Fixed_Part);
   pragma Inline (Array_Part);

end Extensible;
