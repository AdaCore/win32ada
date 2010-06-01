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

with Interfaces.C.Strings;

with Stdarg;
pragma Elaborate (Stdarg);

package Stdarg.Inst is

   function "&" is new Stdarg.Concat (Interfaces.C.char);

   function "&" is new Stdarg.Concat (Interfaces.C.Strings.chars_ptr);
   function "&"
     (Args : ArgList;
      Arg  : Interfaces.C.char_array)
      return ArgList;

   function "&" is new Stdarg.Concat (Interfaces.C.short);
   function "&" is new Stdarg.Concat (Interfaces.C.int);
   function "&" is new Stdarg.Concat (Interfaces.C.long);

   function "&" is new Stdarg.Concat (
      Interfaces.C.unsigned_short,
      T_Is_Modular => True);
   function "&" is new Stdarg.Concat (
      Interfaces.C.unsigned,
      T_Is_Modular => True);
   function "&" is new Stdarg.Concat (
      Interfaces.C.unsigned_long,
      T_Is_Modular => True);

   function "&" is new Stdarg.Concat (
      Interfaces.C.C_float,
      T_Is_Float => True);
   function "&" is new Stdarg.Concat (Interfaces.C.double, T_Is_Float => True);

end Stdarg.Inst;
