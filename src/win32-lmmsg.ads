-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winnt;

package Win32.Lmmsg is

    MSGNAME_NOT_FORWARDED  : constant := 0;                 -- lmmsg.h:107
    MSGNAME_FORWARDED_TO   : constant := 16#4#;             -- lmmsg.h:108
    MSGNAME_FORWARDED_FROM : constant := 16#10#;            -- lmmsg.h:109

    type MSG_INFO_0;                                        -- lmmsg.h:89
    type MSG_INFO_1;                                        -- lmmsg.h:93

    type PMSG_INFO_0 is access all MSG_INFO_0;              -- lmmsg.h:91
    subtype LPMSG_INFO_0 is PMSG_INFO_0;                    -- lmmsg.h:91

    type PMSG_INFO_1 is access all MSG_INFO_1;              -- lmmsg.h:97
    subtype LPMSG_INFO_1 is PMSG_INFO_1;                    -- lmmsg.h:97

    type MSG_INFO_0 is                                      -- lmmsg.h:89
        record
            msgi0_name: Win32.Winnt.LPTSTR;                 -- lmmsg.h:90
        end record;

    type MSG_INFO_1 is                                      -- lmmsg.h:93
        record
            msgi1_name        : Win32.Winnt.LPTSTR;         -- lmmsg.h:94
            msgi1_forward_flag: Win32.DWORD;                -- lmmsg.h:95
            msgi1_forward     : Win32.Winnt.LPTSTR;         -- lmmsg.h:96
        end record;

    function NetMessageNameAdd(
                servername: Win32.Winnt.LPTSTR;
                msgname   : Win32.Winnt.LPTSTR)
               return Win32.DWORD;                          -- lmmsg.h:46

    function NetMessageNameEnum(
                servername   : Win32.Winnt.LPTSTR;
                level        : Win32.DWORD;
                bufptr       : access Win32.PBYTE;
                prefmaxlen   : Win32.DWORD;
                entriesread  : Win32.LPDWORD;
                totalentries : Win32.LPDWORD;
                resume_handle: Win32.LPDWORD)
               return Win32.DWORD;                          -- lmmsg.h:52

    function NetMessageNameGetInfo(
                servername: Win32.Winnt.LPTSTR;
                msgname   : Win32.Winnt.LPTSTR;
                level     : Win32.DWORD;
                bufptr    : access Win32.PBYTE)
               return Win32.DWORD;                          -- lmmsg.h:63
     
    function NetMessageNameDel(     
                servername: Win32.Winnt.LPTSTR;     
                msgname   : Win32.Winnt.LPTSTR)     
               return Win32.DWORD;                          -- lmmsg.h:71
     
    function NetMessageBufferSend(     
                servername: Win32.Winnt.LPTSTR;     
                msgname   : Win32.Winnt.LPTSTR;     
                fromname  : Win32.Winnt.LPTSTR;     
                buf       : Win32.LPBYTE;     
                buflen    : Win32.DWORD)     
               return Win32.DWORD;                          -- lmmsg.h:77

private

    pragma Convention(C_Pass_By_Copy, MSG_INFO_0);                       -- lmmsg.h:89
    pragma Convention(C_Pass_By_Copy, MSG_INFO_1);                       -- lmmsg.h:93

    pragma Import(Stdcall, NetMessageNameAdd, "NetMessageNameAdd");
                                                            -- lmmsg.h:46
    pragma Import(Stdcall, NetMessageNameEnum, "NetMessageNameEnum");
                                                            -- lmmsg.h:52
    pragma Import(Stdcall, NetMessageNameGetInfo, "NetMessageNameGetInfo");
                                                            -- lmmsg.h:63
    pragma Import(Stdcall, NetMessageNameDel, "NetMessageNameDel");
                                                            -- lmmsg.h:71
    pragma Import(Stdcall, NetMessageBufferSend, "NetMessageBufferSend");
                                                            -- lmmsg.h:77

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

end Win32.Lmmsg;
