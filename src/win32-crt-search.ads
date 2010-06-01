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

generic

   type Elem is private;

   type Index is range <>;

   Not_Found : Index;

   type Array_of_Elem is array (Index range <>) of aliased Elem;

   with function "<" (Left, Right : Elem) return Boolean;

package Win32.crt.Search is

   procedure Bsearch
     (The_Key   : in Elem;
      The_Array : in Array_of_Elem;
      Result    : out Index);

   procedure LSearch
     (The_Key         : in Elem;
      The_Array       : in out Array_of_Elem;
      Last_Valid_Elem : in Index;
      Result          : out Index);

   procedure Lfind
     (The_Key   : in Elem;
      The_Array : in Array_of_Elem;
      Result    : out Index);

   procedure Qsort (The_Array : in out Array_of_Elem);

end Win32.crt.Search;
