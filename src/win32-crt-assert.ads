--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-assert.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT
--  WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
--  TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
--  PARTICULAR PURPOSE.  The user assumes the entire risk as to the accuracy
--  and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------

package Win32.crt.Assert is

   --  to turn off assertions, make this False, or make
   --  it a variable and change it during program execution.
   DEBUG : constant Boolean := Standard.True;

   procedure Assert
     (Condition : Boolean;
      Message : String := "(no message)";
      Source_File : String := "(no source file)";
      Line_Number : Natural := 0);

   pragma Inline (Assert);

end Win32.crt.Assert;


