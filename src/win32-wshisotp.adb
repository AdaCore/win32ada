-- $Source$ 
-- $Revision$ $Date$ $Author$ 
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


with Ada.Unchecked_Conversion;
with System;
with Win32.Winsock;

package body Win32.Wshisotp is

    procedure Memcpy(To, From: System.Address; Nbytes: Natural);
    pragma Import(C, Memcpy, "memcpy");

    procedure ISO_SET_TP_ADDR(sa_tp  : out PSOCKADDR_TP; 
			      port   : in Win32.PUCHAR;
			      portlen: in Win32.Winsock.u_short; 
			      node   : in Win32.PUCHAR;
			      nodelen: in Win32.Winsock.u_short) is
							-- wshisotp.h:71
	use type Interfaces.C.unsigned_short;
    begin          
	sa_tp.all.tp_family := Win32.Winsock.AF_ISO;                         
        sa_tp.all.tp_addr_type := ISO_HIERARCHICAL;            
        sa_tp.all.tp_tsel_len := portlen;              
        sa_tp.all.tp_taddr_len := portlen + nodelen; 
        memcpy(sa_tp.all.tp_addr(0)'Address, 
	       port.all'Address, Natural(portlen)); 
        memcpy(sa_tp.all.tp_addr(integer(portlen))'Address, 
	       node'Address, Natural(nodelen));
    end ISO_SET_TP_ADDR;

end Win32.Wshisotp;
