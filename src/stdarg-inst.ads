-- $Source$ 
-- $Revision$ $Date$ $Author$ 

with Interfaces.C;

with Stdarg;
pragma Elaborate(Stdarg); 

package Stdarg.Inst is

    -- Some useful instantiations of Stdarg.Concat.

    function "&" is new Stdarg.Concat(Interfaces.C.Char);

    function "&" is new Stdarg.Concat(Interfaces.C.Strings.Chars_Ptr);
    function "&" (Args: ArgList; Arg: Interfaces.C.Char_Array) return ArgList;

    function "&" is new Stdarg.Concat(Interfaces.C.Short);
    function "&" is new Stdarg.Concat(Interfaces.C.Int);
    function "&" is new Stdarg.Concat(Interfaces.C.Long);

    function "&" is new Stdarg.Concat(Interfaces.C.Unsigned_Short, 
				      T_Is_Modular => True);
    function "&" is new Stdarg.Concat(Interfaces.C.Unsigned, 
				      T_Is_Modular => True);
    function "&" is new Stdarg.Concat(Interfaces.C.Unsigned_Long, 
				      T_Is_Modular => True);

    function "&" is new Stdarg.Concat(Interfaces.C.C_Float, 
				      T_Is_Float => True);
    function "&" is new Stdarg.Concat(Interfaces.C.Double, 
				      T_Is_Float => True);

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT 
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
-- TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR 
-- PURPOSE.  The user assumes the entire risk as to the accuracy and the 
-- use of this file.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Royalty-free, unlimited, worldwide, non-exclusive use, modification, 
-- reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------


end Stdarg.Inst;
