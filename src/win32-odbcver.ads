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

package Win32.Odbcver is

   use type Interfaces.C.char_array;

   VER_FILEVERSION_STR    : constant CHAR_Array := " 2.00.15100" & Nul;
   VER_PRODUCTVERSION_STR : constant CHAR_Array := " 2.00.15100" & Nul;
   VER_FILEFLAGSMASK      : constant := 16#3#;
   VER_FILEFLAGS          : constant := 0;
   VER_FILEOS             : constant := 16#40004#;
   VER_COMPANYNAME_STR    : constant CHAR_Array :=
      "Microsoft Corporation" & Nul;
   VER_PRODUCTNAME_STR    : constant CHAR_Array :=
      "Microsoft Open Database Connectivity" & Nul;

end Win32.Odbcver;
