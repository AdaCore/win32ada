-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Windef;
with Win32.Winnt;

package Win32.Dde is

    WM_DDE_FIRST           : constant := 16#3e0#;           -- dde.h:14
    WM_DDE_INITIATE        : constant := 16#3e0#;           -- dde.h:15
    WM_DDE_TERMINATE       : constant := 16#3e1#;           -- dde.h:16
    WM_DDE_ADVISE          : constant := 16#3e2#;           -- dde.h:17
    WM_DDE_UNADVISE        : constant := 16#3e3#;           -- dde.h:18
    WM_DDE_ACK             : constant := 16#3e4#;           -- dde.h:19
    WM_DDE_DATA            : constant := 16#3e5#;           -- dde.h:20
    WM_DDE_REQUEST         : constant := 16#3e6#;           -- dde.h:21
    WM_DDE_POKE            : constant := 16#3e7#;           -- dde.h:22
    WM_DDE_EXECUTE         : constant := 16#3e8#;           -- dde.h:23
    WM_DDE_LAST            : constant := 16#3e8#;           -- dde.h:24

    type ac_SECURITY_QUALITY_OF_SERVICE_t is access all
        Win32.Winnt.SECURITY_QUALITY_OF_SERVICE;            -- dde.h:136

    type DDEACK is                                          -- dde.h:40
        record
            bAppReturnCode: Win32.bits8;                    -- dde.h:36
            reserved      : Win32.bits6;                    -- dde.h:37
            fBusy         : Win32.bits1;                    -- dde.h:38
            fAck          : Win32.bits1;                    -- dde.h:39
        end record;
    for DDEACK use 
        record
            bAppReturnCode at 0 range 0..7;                 -- dde.h:36
            reserved       at 1 range 0..5;                 -- dde.h:37
            fBusy          at 1 range 6..6;                 -- dde.h:38
            fAck           at 1 range 7..7;                 -- dde.h:39
        end record;
    -- pragma pack(DDEACK);

    type DDEADVISE is                                       -- dde.h:55
        record
            reserved : Win32.bits14;                        -- dde.h:51
            fDeferUpd: Win32.bits1;                         -- dde.h:52
            fAckReq  : Win32.bits1;                         -- dde.h:53
            cfFormat : Win32.SHORT;                         -- dde.h:54
        end record;
    for DDEADVISE use
        record                               
            reserved  at 0 range 0..13;                     -- dde.h:51
            fDeferUpd at 1 range 6..6;                      -- dde.h:52
            fAckReq   at 1 range 7..7;                      -- dde.h:53
            cfFormat  at 2 range 0..15;                     -- dde.h:54
        end record;
    -- pragma pack(DDEADVISE);

    type DDEDATA is                                         -- dde.h:75
        record
            unused   : Win32.bits12;                        -- dde.h:68
            fResponse: Win32.bits1;                         -- dde.h:69
            fRelease : Win32.bits1;                         -- dde.h:70
            reserved : Win32.bits1;                         -- dde.h:71
            fAckReq  : Win32.bits1;                         -- dde.h:72
            cfFormat : Win32.SHORT;                         -- dde.h:73
            Value    : Win32.BYTE_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- dde.h:74
        end record;
    -- ANYSIZE_ARRAY prevents size clause
    --for DDEDATA use
    --    record
    --        unused    at 0 range 0..11;                     -- dde.h:68
    --        fResponse at 1 range 4..4;                      -- dde.h:69
    --        fRelease  at 1 range 5..5;                      -- dde.h:70
    --        reserved  at 1 range 6..6;                      -- dde.h:71
    --        fAckReq   at 1 range 7..7;                      -- dde.h:72
    --        cfFormat  at 2 range 0..15;                     -- dde.h:73
    --        Value     at 4 range 0..7;                      -- dde.h:74
    --    end record;
    -- pragma pack(DDEDATA);

    type DDEPOKE is                                         -- dde.h:96
        record
            unused   : Win32.bits13;                        -- dde.h:88
            fRelease : Win32.bits1;                         -- dde.h:90
            fReserved: Win32.bits2;                         -- dde.h:91
            cfFormat : Win32.SHORT;                         -- dde.h:92
            Value    : Win32.BYTE_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- dde.h:93
        end record;
    -- ANYSIZE_ARRAY prevents size clause
    --for DDEPOKE use
    --    record
    --        unused    at 0 range 0..12;                     -- dde.h:88
    --        fRelease  at 1 range 5..5;                      -- dde.h:90
    --        fReserved at 1 range 6..7;                      -- dde.h:91
    --        cfFormat  at 2 range 0..15;                     -- dde.h:92
    --        Value     at 4 range 0..7;                      -- dde.h:93
    --    end record;
    -- pragma pack(DDEPOKE);

    type DDELN is                                           -- dde.h:114
        record
            unused   : Win32.bits13;                        -- dde.h:109
            fRelease : Win32.bits1;                         -- dde.h:110
            fDeferUpd: Win32.bits1;                         -- dde.h:111
            fAckReq  : Win32.bits1;                         -- dde.h:112
            cfFormat : Win32.SHORT;                         -- dde.h:113
        end record;
    for DDELN use
        record
            unused    at 0 range 0..12;                     -- dde.h:109
            fRelease  at 1 range 5..5;                      -- dde.h:110
            fDeferUpd at 1 range 6..6;                      -- dde.h:111
            fAckReq   at 1 range 7..7;                      -- dde.h:112
            cfFormat  at 2 range 0..15;
        end record;
    -- pragma pack(DDELN);

    type DDEUP is                                           -- dde.h:124
        record       
            unused   : Win32.bits12;                        -- dde.h:117
            fAck     : Win32.bits1;                         -- dde.h:118
            fRelease : Win32.bits1;                         -- dde.h:119
            fReserved: Win32.bits1;                         -- dde.h:120
            fAckReq  : Win32.bits1;                         -- dde.h:121
            cfFormat : Win32.SHORT;                         -- dde.h:122
            rgb      : Win32.BYTE_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- dde.h:123
        end record;
    -- ANYSIZE_ARRAY prevents size clause
    --for DDEUP use
    --    record       
    --        unused    at 0 range 0..11;                     -- dde.h:117
    --        fAck      at 1 range 4..4;                      -- dde.h:118
    --        fRelease  at 1 range 5..5;                      -- dde.h:119
    --        fReserved at 1 range 6..6;                      -- dde.h:120
    --        fAckReq   at 1 range 7..7;                      -- dde.h:121
    --        cfFormat  at 2 range 0..15;                     -- dde.h:122
    --        rgb       at 4 range 0..7;                      -- dde.h:123
    --    end record;
    -- pragma pack(DDEUP);

    function DdeSetQualityOfService(
        hwndClient: Win32.Windef.HWND;
        pqosNew   : ac_SECURITY_QUALITY_OF_SERVICE_t;
        pqosPrev  : Win32.Winnt.PSECURITY_QUALITY_OF_SERVICE)
        return Win32.BOOL;                                  -- dde.h:133

    function ImpersonateDdeClientWindow(
        hWndClient: Win32.Windef.HWND;
        hWndServer: Win32.Windef.HWND)
        return Win32.BOOL;                                  -- dde.h:140

    function PackDDElParam(msg : Win32.UINT;
                           uiLo: Win32.UINT;
                           uiHi: Win32.UINT)
                                 return Win32.LONG;         -- dde.h:147

    function UnpackDDElParam(msg   : Win32.UINT;
                             lParam: Win32.LONG;
                             puiLo : Win32.PUINT;
                             puiHi : Win32.PUINT)
                                     return Win32.BOOL;     -- dde.h:148

    function FreeDDElParam(msg   : Win32.UINT;
                           lParam: Win32.LONG)
                                   return Win32.BOOL;       -- dde.h:149

    function ReuseDDElParam(lParam: Win32.LONG;
                            msgIn : Win32.UINT;
                            msgOut: Win32.UINT;
                            uiLo  : Win32.UINT;
                            uiHi  : Win32.UINT)
                                    return Win32.LONG;      -- dde.h:150

private

    pragma Convention(C_Pass_By_Copy, DDEACK);                           -- dde.h:40
    pragma Convention(C_Pass_By_Copy, DDEADVISE);                        -- dde.h:55
    pragma Convention(C_Pass_By_Copy, DDEDATA);                          -- dde.h:75
    pragma Convention(C_Pass_By_Copy, DDEPOKE);                          -- dde.h:96
    pragma Convention(C_Pass_By_Copy, DDELN);                            -- dde.h:114
    pragma Convention(C_Pass_By_Copy, DDEUP);                            -- dde.h:124

    pragma Import(Stdcall, DdeSetQualityOfService, "DdeSetQualityOfService");
                                                            -- dde.h:133
    pragma Import(Stdcall, ImpersonateDdeClientWindow,"ImpersonateDdeClientWindow");
                                                            -- dde.h:140
    pragma Import(Stdcall, PackDDElParam, "PackDDElParam");       -- dde.h:147
    pragma Import(Stdcall, UnpackDDElParam, "UnpackDDElParam");   -- dde.h:148
    pragma Import(Stdcall, FreeDDElParam, "FreeDDElParam");       -- dde.h:149
    pragma Import(Stdcall, ReuseDDElParam, "ReuseDDElParam");     -- dde.h:150

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

end Win32.Dde;
