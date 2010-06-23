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

with Interfaces.C.Pointers, System;

package Stdarg.Impl is

   subtype int is Interfaces.C.int;

   type Param_Access is private;

   function Address_of_First_Arg (Args : ArgList) return Param_Access;

   function Address_of_Vararg_List (Args : ArgList) return Param_Access;

   function ArgCount (Args : ArgList) return int;

   function "&" (Left, Right : ArgList) return ArgList;

   procedure Do_Varargs
     (Proc     : System.Address;
      Nb_Args  : int;
      Arg_Addr : Param_Access);

   function F_Varargs
     (Func     : System.Address;
      Nb_Args  : int;
      Arg_Addr : Param_Access) return int;

private

   package Arith is
     new Interfaces.C.Pointers (Integer, C_Param, Stdarg.ArgVector, 0);

   type Param_Access is new Arith.Pointer;

   pragma Import (C, Do_Varargs, "do_varargs");
   pragma Import (C, F_Varargs, "do_varargs");

end Stdarg.Impl;
