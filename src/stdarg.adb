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

with Ada.Unchecked_Deallocation;
with System.Storage_Elements;

package body Stdarg is

   Int_Param_Alignment : constant Positive :=
                           C_Param'Size / System.Storage_Unit;
   Param_Size          : Positive renames Int_Param_Alignment;

   function RoundUp (Siz : Natural) return Natural;

   function RoundUp (Siz : Natural) return Natural is
      Slop : constant Natural := Siz mod Int_Param_Alignment;
      Res  : Natural;
   begin
      if Slop = 0 then
         Res := Siz;
      else
         Res := Siz + (Int_Param_Alignment - Slop);
      end if;
      return Res / Param_Size;
   end RoundUp;

   procedure Initialize (A : in out ArgList) is
   begin
      A.Contents := new ArgBlock;
   end Initialize;

   procedure Adjust (A : in out ArgList) is
   begin
      A.Contents.RefCount := A.Contents.RefCount + 1;
   end Adjust;

   procedure Finalize (A : in out ArgList) is
      procedure Free is new Ada.Unchecked_Deallocation (ArgBlock, ArgBlockP);
   begin
      if A.Contents = null then
         null;
      else
         A.Contents.RefCount := A.Contents.RefCount - 1;
         if A.Contents.RefCount = 0 then
            Free (A.Contents);
         end if;
      end if;
   end Finalize;

   function Concat (Args : ArgList; Arg : T) return ArgList is
      Nb_Int         : Natural := RoundUp (T'Size / System.Storage_Unit);
      Uncopied_Bytes : Natural :=
         (Nb_Int * Param_Size) - (T'Size / System.Storage_Unit);
      use System.Storage_Elements;
      Arg_Addr       : System.Address :=
         Arg'Address -
         (Arg'Address mod Storage_Offset (Int_Param_Alignment));
      Buf_Addr       : System.Address;

      procedure Memcpy (To, From : System.Address; Nbytes : Natural);
      pragma Import (C, Memcpy, "memcpy");

      Double_Arg: Interfaces.C.double;
      Long_Arg : C_Param;

      function To_Double
        (Arg_Addr : System.Address;
         Arg_Size : Interfaces.C.int)
         return Interfaces.C.double;
      pragma Import (C, To_Double, "to_double");

      function To_Param_T
        (Arg_Addr   : System.Address;
         Arg_Size   : Interfaces.C.int;
         Is_Modular : Interfaces.C.int)
         return C_Param;
      pragma Import (C, To_Param_T, "to_param_t");

   begin
      if T_Is_Float then
         Double_Arg     := To_Double (Arg'Address, Arg'Size);
         Arg_Addr       := Double_Arg'Address;
         Nb_Int         := RoundUp (Double_Arg'Size / System.Storage_Unit);
         Uncopied_Bytes := 0;
      elsif T'Size < C_Param'Size then
         Long_Arg       :=
            To_Param_T (Arg'Address, Arg'Size, Boolean'Pos (T_Is_Modular));
         Arg_Addr       := Long_Arg'Address;
         Nb_Int         := RoundUp (Long_Arg'Size / System.Storage_Unit);
         Uncopied_Bytes := 0;
      end if;

      if (Nb_Int + Args.Contents.CurrentArgs > MaxArguments) then
         raise Constraint_Error;
      end if;

      Buf_Addr :=
        Args.Contents.Vector (Args.Contents.CurrentArgs + 1)'Address;
      Memcpy
        (Buf_Addr,
         Arg_Addr,
         (Nb_Int * Param_Size) - Uncopied_Bytes);

      Args.Contents.CurrentArgs := Args.Contents.CurrentArgs + Nb_Int;
      return Args;
   end Concat;

   function Empty return ArgList is
      Res : ArgList;
   begin
      Res.Contents.RefCount := 2;
      return Res;
   end Empty;

end Stdarg;
