-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winsock;

package Win32.Wshisotp is

    ISOPROTO_TP0         : constant := 25;                  -- wshisotp.h:20
    ISOPROTO_TP1         : constant := 26;                  -- wshisotp.h:21
    ISOPROTO_TP2         : constant := 27;                  -- wshisotp.h:22
    ISOPROTO_TP3         : constant := 28;                  -- wshisotp.h:23
    ISOPROTO_TP4         : constant := 29;                  -- wshisotp.h:24
    ISOPROTO_TP          : constant := 29;                  -- wshisotp.h:25
    ISOPROTO_CLTP        : constant := 30;                  -- wshisotp.h:26
    ISOPROTO_CLNP        : constant := 31;                  -- wshisotp.h:27
    ISOPROTO_X25         : constant := 32;                  -- wshisotp.h:28
    ISOPROTO_INACT_NL    : constant := 33;                  -- wshisotp.h:29
    ISOPROTO_ESIS        : constant := 34;                  -- wshisotp.h:30
    ISOPROTO_INTRAISIS   : constant := 35;                  -- wshisotp.h:31
    IPPROTO_RAW          : constant := 255;                 -- wshisotp.h:33
    IPPROTO_MAX          : constant := 256;                 -- wshisotp.h:34
    ISO_MAX_ADDR_LENGTH  : constant := 64;                  -- wshisotp.h:41
    ISO_HIERARCHICAL     : constant := 0;                   -- wshisotp.h:52
    ISO_NON_HIERARCHICAL : constant := 1;                   -- wshisotp.h:53
    ISO_EXP_DATA_USE     : constant := 8#0#;                -- wshisotp.h:86
    ISO_EXP_DATA_NUSE    : constant := 8#1#;                -- wshisotp.h:87

    type SOCKADDR_TP;                                       -- wshisotp.h:61

    type PSOCKADDR_TP is access all SOCKADDR_TP;            -- wshisotp.h:69
    subtype LPSOCKADDR_TP is PSOCKADDR_TP;                  -- wshisotp.h:69

    type SOCKADDR_TP is                                     -- wshisotp.h:61
        record
            tp_family   : Win32.Winsock.u_short;            -- wshisotp.h:62
            tp_addr_type: Win32.Winsock.u_short;            -- wshisotp.h:63
            tp_taddr_len: Win32.Winsock.u_short;            -- wshisotp.h:65
            tp_tsel_len : Win32.Winsock.u_short;            -- wshisotp.h:66
            tp_addr     : Win32.UCHAR_Array(0..ISO_MAX_ADDR_LENGTH-1);
                                                            -- wshisotp.h:68
        end record;

    procedure ISO_SET_TP_ADDR(sa_tp  : out PSOCKADDR_TP; 
			      port   : in Win32.PUCHAR;
			      portlen: in Win32.Winsock.u_short; 
			      node   : in Win32.PUCHAR;
			      nodelen: in Win32.Winsock.u_short);
							-- wshisotp.h:71
private

    pragma Convention(C, SOCKADDR_TP);                      -- wshisotp.h:61

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Wshisotp;
