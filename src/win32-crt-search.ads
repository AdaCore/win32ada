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



generic



   type Elem is private;



   type Index is range <>;



   Not_Found : Index;



   type Array_of_Elem is array (Index range <>) of aliased Elem;



   --  User-supplied function that compares 2 elements

   with function "<" (Left, Right : Elem) return Boolean;



package Win32.crt.Search is



   --   --------------------------------------------------------------

   --  Binary search of an array, which is supposed to be sorted.

   --  If The_Key is found, its index is returned in Result,

   --  otherwise Not_Found is returned in Result.



   procedure Bsearch (The_Key : in Elem;

                      The_Array : in Array_of_Elem;

                      Result : out Index);



   --   --------------------------------------------------------------

   --  Linear search of an array, which is supposed to be sorted.

   --  If The_Key is found in the elements from 'First to Last_Valid_Elem,

   --  its index is returned in Result.  Otherwise Elem is inserted at

   --  The_Array(Last_Valid_Elem+1) and Last_Valid_Elem+1 is returned.

   --  If The_Key is not found and Last_Valid_Elem=The_Array'Last,

   --  Constraint_Error is raised.



   procedure LSearch (The_Key : in Elem;

                      The_Array : in out Array_of_Elem;

                      Last_Valid_Elem : in Index;

                      Result : out Index);



   --   --------------------------------------------------------------

   --  Linear search of an array, which is supposed to be sorted.

   --  If The_Key is found, its index is returned in Result, otherwise

   --  Not_Found is returned in Result.



   procedure Lfind (The_Key : in Elem;

                    The_Array : in Array_of_Elem;

                    Result : out Index);



   --   --------------------------------------------------------------

   --  Sort of the elements of an array into ascending order.



   procedure Qsort (The_Array : in out Array_of_Elem);



end Win32.crt.Search;





