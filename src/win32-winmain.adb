-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

package body Win32.Winmain is

   -- **************************************************************
   -- Functions which grab the parameters passed to WinMain by NT.
   -- See also the Ada.Command_Line package, Ada 95 Reference Manual
   -- section A.15.
   --
   -- Note: When using AdaMagic, these functions work when a program is 
   -- a true Windows app (built with switch -w).  They 
   -- don't work with console apps.  The "rts_get_*" functions are part
   -- of the AdaMagic Run-Time Library (rts.lib). 
   -- **************************************************************
   function Get_hInstance return Win32.Windef.HINSTANCE is
   	function Retrieve_hInstance return Win32.Windef.HINSTANCE;
   	pragma Import (C, Retrieve_hInstance, "rts_get_hInstance");
   begin
	return Retrieve_hInstance;
   end Get_hInstance;

   function Get_hPrevInstance return Win32.Windef.HINSTANCE is
   	function Retrieve_hPrevInstance return Win32.Windef.HINSTANCE;
   	pragma Import (C, Retrieve_hPrevInstance, "rts_get_hPrevInstance");
   begin
	return Retrieve_hPrevInstance;
   end Get_hPrevInstance;

   function Get_lpCmdline return Win32.PCSTR is
   	function Retrieve_lpCmdline return Win32.PCSTR;
   	pragma Import (C, Retrieve_lpCmdline,  "rts_get_lpCommandLine");
   begin
	return Retrieve_lpCmdline;
   end Get_lpCmdline;

   function Get_nCmdShow return Win32.INT is
   	function Retrieve_nCmdShow return Win32.INT;
   	pragma Import (C, Retrieve_nCmdShow, "rts_get_nShowCmd");
    begin
	return Retrieve_nCmdShow;
    end Get_nCmdShow;

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

end Win32.Winmain;
