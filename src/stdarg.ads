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



with Ada.Finalization, Interfaces.C;



package Stdarg is



   --  *****************************************

   --  Setting up variable-length argument lists

   --  *****************************************



   MaxArguments : constant := 50;

   --  "&" and Concat functions raise Constraint_Error if more than

   --  MaxArguments integer paramters are catenated.

   --  If you change this, change it in var.c also.



   type ArgList is private;



   --  An empty arglist, to be used in constructors :

   function Empty return ArgList;



   generic

      type T is private;

      T_Is_Modular : Boolean := False;

      T_Is_Float  : Boolean := False;

   function Concat (Args : ArgList; Arg : T) return ArgList;



   subtype C_Param is Interfaces.C.long;



private



   type ArgVector is array (Integer range <>) of aliased C_Param;



   type ArgBlock is record

      Vector      : ArgVector (1 .. MaxArguments) := (others => 0);

      RefCount    : Natural := 1;

      CurrentArgs : Natural := 0;

      FirstHole   : Natural := 0;

   end record;



   AS : constant := MaxArguments * C_Param'Size;

   NS : constant := Natural'Size;



   --  On HP target this record must be aligned at mod 8, like a double.

   --  Maybe on Alpha too, not sure.

   --  On other targets the 8 could be changed to 4.

   --  For i386 / NT 4 is the size to use

   for ArgBlock use record at mod 4;

   Vector      at 0        range 0 .. AS - 1;

   RefCount    at AS       range 0 .. NS - 1;

   CurrentArgs at AS + NS    range 0 .. NS - 1;

   FirstHole   at AS + NS + NS range 0 .. NS - 1;

   end record;



   type ArgBlockP is access ArgBlock;



   type ArgList is

     new Ada.Finalization.Controlled with

      record

         Contents : ArgBlockP;

      end record;



   --  **************

   --  Memory Control

   --  **************



   procedure Initialize (A : in out ArgList);

   procedure Adjust (A : in out ArgList);

   procedure Finalize (A : in out ArgList);



end Stdarg;





