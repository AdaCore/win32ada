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

with Ada.Finalization, Interfaces.C;

package Stdarg is

   MaxArguments : constant := 50;

   type ArgList is private;

   function Empty return ArgList;

   generic
      type T is private;
      T_Is_Modular : Boolean := False;
      T_Is_Float : Boolean := False;
   function Concat (Args : ArgList; Arg : T) return ArgList;

   subtype C_Param is Interfaces.C.size_t;

private

   type ArgVector is array (Integer range <>) of aliased C_Param;

   type ArgBlock is record
      Vector      : ArgVector (1 .. MaxArguments) := (others => 0);
      RefCount    : Natural                       := 1;
      CurrentArgs : Natural                       := 0;
      FirstHole   : Natural                       := 0;
   end record;

   type ArgBlockP is access ArgBlock;

   type ArgList is new Ada.Finalization.Controlled with record
      Contents : ArgBlockP;
   end record;

   procedure Initialize (A : in out ArgList);
   procedure Adjust (A : in out ArgList);
   procedure Finalize (A : in out ArgList);

end Stdarg;
