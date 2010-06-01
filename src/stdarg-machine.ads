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

with Interfaces.C, System;

package Stdarg.Machine is
   type Arch is (
      I386,
      Sparc,
      HP,
      Mips,
      Alpha,
      PowerPC);

   This_Arch : constant Arch := I386;

   type Stack_Growth_Direction is (Up, Down);

   type Arch_Description_Rec is record
      Int_Param_Alignment, Float_Param_Alignment : Positive;
      Stack_Growth                               : Stack_Growth_Direction;
   end record;

   SU : constant := System.Storage_Unit;

   Arch_Description : constant array (Arch) of Arch_Description_Rec :=
     (I386    => (Int_Param_Alignment   => C_Param'Size / SU,
                  Float_Param_Alignment => C_Param'Size / SU,
                  Stack_Growth          => Up),
      Sparc   => (Int_Param_Alignment   => C_Param'Size / SU,
                  Float_Param_Alignment => C_Param'Size / SU,
                  Stack_Growth          => Up),
      HP      => (Int_Param_Alignment   => C_Param'Size / SU,
                  Float_Param_Alignment => Interfaces.C.double'Size / SU,
                  Stack_Growth          => Down),
      Mips    => (Int_Param_Alignment   => C_Param'Size / SU,
                  Float_Param_Alignment => Interfaces.C.double'Size / SU,
                  Stack_Growth          => Up),
      Alpha   => (Int_Param_Alignment   => C_Param'Size / SU,
                  Float_Param_Alignment => Interfaces.C.double'Size / SU,
                  Stack_Growth          => Up),
      PowerPC => (Int_Param_Alignment   => C_Param'Size / SU,
                  Float_Param_Alignment => C_Param'Size / SU,
                  Stack_Growth          => Up));

   Desc                  : Arch_Description_Rec renames Arch_Description (
     This_Arch);
   Int_Param_Alignment   : Positive renames Desc.Int_Param_Alignment;
   Float_Param_Alignment : Positive renames Desc.Float_Param_Alignment;
   Stack_Growth          : Stack_Growth_Direction renames Desc.Stack_Growth;
   Param_Size            : constant Positive := C_Param'Size / SU;

end Stdarg.Machine;
