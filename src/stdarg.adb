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

with Ada.Unchecked_Deallocation, Stdarg.Machine, System,
  System.Storage_Elements;

pragma Warnings (Off);

package body Stdarg is

   use Stdarg.Machine;

   function RoundUp (Siz : Natural) return Natural;
   procedure put (s : String; a : System.Address);

   function RoundUp (Siz : Natural) return Natural is
      Slop : constant Natural := Siz mod Int_Param_Alignment;
      Res  : Natural;
   begin
      if Slop = 0 then
         Res := Siz;
      else
         Res := Siz + (Int_Param_Alignment - Slop);
      end if;
      return Res / Stdarg.Machine.Param_Size;
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
         if A.Contents.RefCount <= 0 then
            Free (A.Contents);
         end if;
      end if;
   end Finalize;

   procedure put (s : String; a : System.Address) is
   begin
      null;
   end put;

   function Concat (Args : ArgList; Arg : T) return ArgList is
      Nb_Int         : Natural := RoundUp (T'Size / System.Storage_Unit);
      Uncopied_Bytes : Natural :=
         (Nb_Int * Param_Size) - (T'Size / System.Storage_Unit);
      use System.Storage_Elements;
      Arg_Addr       : System.Address :=
         Arg'Address -
         (Arg'Address mod Storage_Offset (Int_Param_Alignment));
      Buf_Addr       : System.Address;
      Arg_Size       : Integer := Arg'Size;
      Index          : Integer;

      procedure Memcpy (To, From : System.Address; Nbytes : Natural);
      pragma Import (C, Memcpy, "memcpy");

      Double_Arg: Interfaces.C.double;
      Long_Arg : C_Param;

      function To_Double
        (Arg_Addr : System.Address;
         Arg_Size : Interfaces.C.int)
         return Interfaces.C.double;
      pragma Import (C, To_Double, "to_double");

      function To_Long
        (Arg_Addr   : System.Address;
         Arg_Size   : Interfaces.C.int;
         Is_Modular : Interfaces.C.int)
         return C_Param;
      pragma Import (C, To_Long, "to_long");

   begin
      if T_Is_Float then
         Double_Arg     := To_Double (Arg'Address, Arg'Size);
         Arg_Addr       := Double_Arg'Address;
         Nb_Int         := RoundUp (Double_Arg'Size / System.Storage_Unit);
         Uncopied_Bytes := 0;
         Arg_Size       := Double_Arg'Size;
      elsif T'Size < C_Param'Size then
         Long_Arg       :=
            To_Long (Arg'Address, Arg'Size, Boolean'Pos (T_Is_Modular));
         Arg_Addr       := Long_Arg'Address;
         Nb_Int         := RoundUp (Long_Arg'Size / System.Storage_Unit);
         Uncopied_Bytes := 0;
         Arg_Size       := Long_Arg'Size;
      end if;

      if (Nb_Int + Args.Contents.CurrentArgs > MaxArguments) then
         raise Constraint_Error;
      end if;

      case This_Arch is
         when Stdarg.Machine.I386 =>
            Buf_Addr :=
              Args.Contents.Vector (Args.Contents.CurrentArgs + 1)'Address;
            Memcpy
              (Buf_Addr,
               Arg_Addr,
               (Nb_Int * Param_Size) - Uncopied_Bytes);

         when Stdarg.Machine.Alpha =>
            if Args.Contents.CurrentArgs = 0 then
               Args.Contents.CurrentArgs := 6;
            end if;
            if T_Is_Float then
               Index := Args.Contents.CurrentArgs - 6 + 1;
            else
               Index := Args.Contents.CurrentArgs + 1;
            end if;
            Buf_Addr := Args.Contents.Vector (Index)'Address;
            Memcpy
              (Buf_Addr,
               Arg_Addr,
               (Nb_Int * Param_Size) - Uncopied_Bytes);

         when Stdarg.Machine.Sparc | Stdarg.Machine.PowerPC =>
            Buf_Addr :=
              Args.Contents.Vector (Args.Contents.CurrentArgs + 1)'Address;
            Memcpy
              (Buf_Addr + Storage_Offset (Uncopied_Bytes),
               Arg_Addr + Storage_Offset (Uncopied_Bytes),
               Nb_Int * Param_Size - Uncopied_Bytes);

         when Stdarg.Machine.Mips =>
            Buf_Addr :=
              Args.Contents.Vector (Args.Contents.CurrentArgs + 1)'Address;
            if (Arg_Size in 33 .. 64) then
               if Args.Contents.FirstHole = 0 then
                  Args.Contents.FirstHole := Args.Contents.CurrentArgs + 1;
               end if;
               if (Args.Contents.CurrentArgs mod 2 /= 0) then
                  Args.Contents.CurrentArgs := Args.Contents.CurrentArgs + 1;
                  Buf_Addr                  := Buf_Addr +
                                               Storage_Offset (Param_Size);
               end if;
            end if;
            Memcpy
              (Buf_Addr + Storage_Offset (Uncopied_Bytes),
               Arg_Addr + Storage_Offset (Uncopied_Bytes),
               Nb_Int * Param_Size - Uncopied_Bytes);

         when Stdarg.Machine.HP =>
            Buf_Addr :=
              Args.Contents.Vector (MaxArguments -
                                    Args.Contents.CurrentArgs -
                                    Nb_Int +
                                    1)'Address;
            if (Arg_Size in 33 .. 64) then
               if Args.Contents.FirstHole = 0 then
                  Args.Contents.FirstHole := Args.Contents.CurrentArgs + 1;
               end if;
               if (Args.Contents.CurrentArgs mod 2 /= 0) then
                  Args.Contents.CurrentArgs := Args.Contents.CurrentArgs + 1;
                  Buf_Addr                  := Buf_Addr -
                                               Storage_Offset (Param_Size);
               end if;
            end if;
            Memcpy
              (Buf_Addr + Storage_Offset (Uncopied_Bytes),
               Arg_Addr,
               Nb_Int * Param_Size - Uncopied_Bytes);

      end case;

      Args.Contents.CurrentArgs := Args.Contents.CurrentArgs + Nb_Int;
      put ("arg_addr", Arg_Addr);
      put ("buf_addr", Buf_Addr);
      put ("param addr", Arg'Address);
      return Args;
   end Concat;

   function Empty return ArgList is
      Res : ArgList;
   begin
      Res.Contents.RefCount := 2;
      return Res;
   end Empty;

end Stdarg;
