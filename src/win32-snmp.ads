-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.


package Win32.Snmp is

    SNMPAPI_NOERROR                : constant := 1;         -- snmp.h:42
    SNMPAPI_ERROR                  : constant := 0;         -- snmp.h:43
    ASN_UNIVERSAL                  : constant := 16#0#;     -- snmp.h:47
    ASN_APPLICATION                : constant := 16#40#;    -- snmp.h:48
    ASN_CONTEXTSPECIFIC            : constant := 16#80#;    -- snmp.h:49
    ASN_PRIVATE                    : constant := 16#c0#;    -- snmp.h:50
    ASN_PRIMATIVE                  : constant := 16#0#;     -- snmp.h:53
    ASN_CONSTRUCTOR                : constant := 16#20#;    -- snmp.h:54
    ASN_INTEGER                    : constant := 16#2#;     -- snmp.h:58
    ASN_OCTETSTRING                : constant := 16#4#;     -- snmp.h:59
    ASN_NULL                       : constant := 16#5#;     -- snmp.h:60
    ASN_OBJECTIDENTIFIER           : constant := 16#6#;     -- snmp.h:61
    ASN_SEQUENCE                   : constant := 16#30#;    -- snmp.h:64
    ASN_SEQUENCEOF                 : constant := 16#30#;    -- snmp.h:65
    ASN_RFC1155_IPADDRESS          : constant := 16#40#;    -- snmp.h:68
    ASN_RFC1155_COUNTER            : constant := 16#41#;    -- snmp.h:69
    ASN_RFC1155_GAUGE              : constant := 16#42#;    -- snmp.h:70
    ASN_RFC1155_TIMETICKS          : constant := 16#43#;    -- snmp.h:71
    ASN_RFC1155_OPAQUE             : constant := 16#44#;    -- snmp.h:72
    ASN_RFC1213_DISPSTRING         : constant := 16#4#;     -- snmp.h:73
    ASN_RFC1157_GETREQUEST         : constant := 16#a0#;    -- snmp.h:76
    ASN_RFC1157_GETNEXTREQUEST     : constant := 16#a1#;    -- snmp.h:78
    ASN_RFC1157_GETRESPONSE        : constant := 16#a2#;    -- snmp.h:80
    ASN_RFC1157_SETREQUEST         : constant := 16#a3#;    -- snmp.h:82
    ASN_RFC1157_TRAP               : constant := 16#a4#;    -- snmp.h:84
    SNMP_ERRORSTATUS_NOERROR       : constant := 0;         -- snmp.h:89
    SNMP_ERRORSTATUS_TOOBIG        : constant := 1;         -- snmp.h:90
    SNMP_ERRORSTATUS_NOSUCHNAME    : constant := 2;         -- snmp.h:91
    SNMP_ERRORSTATUS_BADVALUE      : constant := 3;         -- snmp.h:92
    SNMP_ERRORSTATUS_READONLY      : constant := 4;         -- snmp.h:93
    SNMP_ERRORSTATUS_GENERR        : constant := 5;         -- snmp.h:94
    SNMP_GENERICTRAP_COLDSTART     : constant := 0;         -- snmp.h:98
    SNMP_GENERICTRAP_WARMSTART     : constant := 1;         -- snmp.h:99
    SNMP_GENERICTRAP_LINKDOWN      : constant := 2;         -- snmp.h:100
    SNMP_GENERICTRAP_LINKUP        : constant := 3;         -- snmp.h:101
    SNMP_GENERICTRAP_AUTHFAILURE   : constant := 4;         -- snmp.h:102
    SNMP_GENERICTRAP_EGPNEIGHLOSS  : constant := 5;         -- snmp.h:103
    SNMP_GENERICTRAP_ENTERSPECIFIC : constant := 6;         -- snmp.h:104
    SNMP_MEM_ALLOC_ERROR           : constant := 1;         -- snmp.h:113
    SNMP_BERAPI_INVALID_LENGTH     : constant := 10;        -- snmp.h:116
    SNMP_BERAPI_INVALID_TAG        : constant := 11;        -- snmp.h:117
    SNMP_BERAPI_OVERFLOW           : constant := 12;        -- snmp.h:118
    SNMP_BERAPI_SHORT_BUFFER       : constant := 13;        -- snmp.h:119
    SNMP_BERAPI_INVALID_OBJELEM    : constant := 14;        -- snmp.h:120
    SNMP_PDUAPI_UNRECOGNIZED_PDU   : constant := 20;        -- snmp.h:123
    SNMP_PDUAPI_INVALID_ES         : constant := 21;        -- snmp.h:124
    SNMP_PDUAPI_INVALID_GT         : constant := 22;        -- snmp.h:125
    SNMP_AUTHAPI_INVALID_VERSION   : constant := 30;        -- snmp.h:128
    SNMP_AUTHAPI_INVALID_MSG_TYPE  : constant := 31;        -- snmp.h:129
    SNMP_AUTHAPI_TRIV_AUTH_FAILED  : constant := 32;        -- snmp.h:130

    type AsnInteger is new Win32.LONG;                      -- snmp.h:138
    type AsnCounter is new Win32.DWORD;                     -- snmp.h:154
    type AsnGauge is new Win32.DWORD;                       -- snmp.h:155
    type AsnTimeticks is new Win32.DWORD;                   -- snmp.h:156

    type AsnOctetString;                                    -- snmp.h:143
    type AsnObjectIdentifier;                               -- snmp.h:147
    type union_anonymous2_t;                                -- snmp.h:176
    type AsnAny;                                            -- snmp.h:177
    type RFC1157VarBind;                                    -- snmp.h:183
    type RFC1157VarBindList;                                -- snmp.h:191
    type RFC1157Pdu;                                        -- snmp.h:199
    type RFC1157TrapPdu;                                    -- snmp.h:208
    type union_anonymous7_t;                                -- snmp.h:215
    type RFC1157Pdus;                                       -- snmp.h:216
    type SnmpMgmtCom;                                       -- snmp.h:223

    type a_RFC1157VarBind_t is access all RFC1157VarBind;   -- snmp.h:189

    type AsnOctetString is                                  -- snmp.h:143
        record
            stream : Win32.PBYTE;                           -- snmp.h:140
            length : Win32.UINT;                            -- snmp.h:141
            dynamic: Win32.BOOL;                            -- snmp.h:142
        end record;

    type AsnObjectIdentifier is                             -- snmp.h:147
        record
            idLength: Win32.UINT;                           -- snmp.h:145
            ids     : Win32.PUINT;                          -- snmp.h:146
        end record;

    subtype AsnSequence is AsnOctetString;                  -- snmp.h:149

    subtype AsnImplicitSequence is AsnSequence;             -- snmp.h:150

    subtype AsnIPAddress is AsnOctetString;                 -- snmp.h:152

    subtype AsnDisplayString is AsnOctetString;             -- snmp.h:153

    subtype AsnOpaque is AsnOctetString;                    -- snmp.h:157

    type union_anonymous2_t_kind is (                       -- snmp.h:176
        number_kind,
        string_kind,
        object_kind,
        sequence_kind,
        address_kind,
        counter_kind,
        gauge_kind,
        ticks_kind,
        arbitrary_kind
    );

    type union_anonymous2_t (Which: union_anonymous2_t_kind := string_kind) is
                                                            -- snmp.h:176
        record
            case Which is
                when number_kind =>
                    number: AsnInteger;                     -- snmp.h:163
                when string_kind =>
                    string: AsnOctetString;                 -- snmp.h:164
                when object_kind =>
                    object: AsnObjectIdentifier;            -- snmp.h:165
                when sequence_kind =>
                    sequence: AsnSequence;                  -- snmp.h:168
                when address_kind =>
                    address: AsnIPAddress;                  -- snmp.h:171
                when counter_kind =>
                    counter: AsnCounter;                    -- snmp.h:172
                when gauge_kind =>
                    gauge: AsnGauge;                        -- snmp.h:173
                when ticks_kind =>
                    ticks: AsnTimeticks;                    -- snmp.h:174
                when arbitrary_kind =>
                    arbitrary: AsnOpaque;                   -- snmp.h:175
            end case;
        end record;

    pragma Convention(c_pass_by_copy, Union_Anonymous2_T);

    pragma Unchecked_Union(union_anonymous2_t);

    type AsnAny is                                          -- snmp.h:177
        record
            asnType : Win32.BYTE;                           -- snmp.h:160
            asnValue: union_anonymous2_t;                   -- snmp.h:176
        end record;

    subtype AsnObjectName is AsnObjectIdentifier;           -- snmp.h:179

    subtype AsnObjectSyntax is AsnAny;                      -- snmp.h:180

    subtype AsnNetworkAddress is AsnIPAddress;              -- snmp.h:181

    type RFC1157VarBind is                                  -- snmp.h:183
        record
            name : AsnObjectName;                           -- snmp.h:184
            value: AsnObjectSyntax;                         -- snmp.h:185
        end record;

    type RFC1157VarBindList is                              -- snmp.h:191
        record
            list: a_RFC1157VarBind_t;                       -- snmp.h:189
            len : Win32.UINT;                               -- snmp.h:190
        end record;

    type RFC1157Pdu is                                      -- snmp.h:199
        record
            varBinds   : RFC1157VarBindList;                -- snmp.h:194
            requestType: AsnInteger;                        -- snmp.h:195
            requestId  : AsnInteger;                        -- snmp.h:196
            errorStatus: AsnInteger;                        -- snmp.h:197
            errorIndex : AsnInteger;                        -- snmp.h:198
        end record;

    type RFC1157TrapPdu is                                  -- snmp.h:208
        record
            varBinds    : RFC1157VarBindList;               -- snmp.h:202
            enterprise  : AsnObjectIdentifier;              -- snmp.h:203
            agentAddr   : AsnNetworkAddress;                -- snmp.h:204
            genericTrap : AsnInteger;                       -- snmp.h:205
            specificTrap: AsnInteger;                       -- snmp.h:206
            timeStamp   : AsnTimeticks;                     -- snmp.h:207
        end record;

    type union_anonymous7_t_kind is (                       -- snmp.h:215
        pdu_kind,
        trap_kind
    );

    type union_anonymous7_t (Which: union_anonymous7_t_kind := trap_kind) is
                                                            -- snmp.h:215
        record
            case Which is
                when pdu_kind =>
                    pdu: RFC1157Pdu;                        -- snmp.h:213
                when trap_kind =>
                    trap: RFC1157TrapPdu;                   -- snmp.h:214
            end case;
        end record;

    pragma Unchecked_Union(union_anonymous7_t);

    type RFC1157Pdus is                                     -- snmp.h:216
        record
            pduType : Win32.BYTE;                           -- snmp.h:211
            pduValue: union_anonymous7_t;                   -- snmp.h:215
        end record;

    type SnmpMgmtCom is                                     -- snmp.h:223
        record
            dstParty : AsnObjectIdentifier;                 -- snmp.h:219
            srcParty : AsnObjectIdentifier;                 -- snmp.h:220
            pdu      : RFC1157Pdus;                         -- snmp.h:221
            community: AsnOctetString;                      -- snmp.h:222
        end record;


    procedure SNMP_DBG_free(
                x   : Win32.PVOID;
                line: Win32.INT;
                file: Win32.PSTR);                          -- snmp.h:262

    function SNMP_DBG_malloc(
                x   : Win32.UINT;
                line: Win32.INT;
                file: Win32.PSTR)
               return Win32.PVOID;                          -- snmp.h:269

    function SNMP_DBG_realloc(
                x   : Win32.PVOID;
                y   : Win32.UINT;
                line: Win32.INT;
                file: Win32.PSTR)
               return Win32.PVOID;                          -- snmp.h:276

    function SNMP_oidcpy(
                DestObjId: access AsnObjectIdentifier;
                SrcObjId : access AsnObjectIdentifier)
               return Win32.INT;                            -- snmp.h:284

    function SnmpUtilOidCpy(
                DestObjId: access AsnObjectIdentifier;
                SrcObjId : access AsnObjectIdentifier)
               return Win32.INT
               renames  SNMP_oidcpy;                        -- snmp.h:234

    function SNMP_oidappend(
                DestObjId: access AsnObjectIdentifier;
                SrcObjId : access AsnObjectIdentifier)
               return Win32.INT;                            -- snmp.h:290

    function SnmpUtilOidAppend(
                DestObjId: access AsnObjectIdentifier;
                SrcObjId : access AsnObjectIdentifier)
                return Win32.INT
                renames  SNMP_oidappend;                    -- snmp.h:235

    -- not in Microsoft OpenTools
    -- function SNMP_oidncmp(
                -- A  : access AsnObjectIdentifier;
                -- B  : access AsnObjectIdentifier;
                -- Len: Win32.UINT)
                -- return Win32.INT;                        -- snmp.h:296

    -- function SnmpUtilOidNCmp(
                -- A  : access AsnObjectIdentifier;
                -- B  : access AsnObjectIdentifier;
                -- Len: Win32.UINT)
                -- return Win32.INT
                -- renames  SNMP_oidncmp;                   -- snmp.h:236

    procedure SNMP_oidfree(
                Obj: access AsnObjectIdentifier);           -- snmp.h:305

    procedure SnmpUtilOidFree(
                Obj: access AsnObjectIdentifier)
                renames SNMP_oidfree;                       -- snmp.h:238

    function SNMP_CopyVarBindList(
                dst: access RFC1157VarBindList;
                src: access RFC1157VarBindList)
               return Win32.INT;                            -- snmp.h:310

    function SnmpUtilVarBindListCpy(
                dst: access RFC1157VarBindList;
                src: access RFC1157VarBindList)
                return Win32.INT
                renames SNMP_CopyVarBindList;               -- snmp.h:240

    function SNMP_CopyVarBind(
                dst: access RFC1157VarBind;
                src: access RFC1157VarBind)
               return Win32.INT;                            -- snmp.h:316

    function SnmpUtilVarBindCpy(
                dst: access RFC1157VarBind;
                src: access RFC1157VarBind)
               return Win32.INT
                renames SNMP_CopyVarBind;                   -- snmp.h:241

    procedure SNMP_FreeVarBindList(
                VarBindList: access RFC1157VarBindList);    -- snmp.h:323

    procedure SnmpUtilVarBindListFree(
                VarBindList: access RFC1157VarBindList)
                renames SNMP_FreeVarBindList;               -- snmp.h:242

    procedure SNMP_FreeVarBind(
                VarBind: access RFC1157VarBind);            -- snmp.h:328

    procedure SnmpUtilVarBindFree(
                VarBind: access RFC1157VarBind)
                renames SNMP_FreeVarBind;                   -- snmp.h:243

    
    -- procedure SNMP_free(memblock: Win32.PVOID)
                -- renames Win32.Malloc.free;                  -- snmp.h:252

    -- function SNMP_malloc(size: Win32.size_t)
                -- return Win32.PVOID
                -- renames Win32.Malloc.malloc;                -- snmp.h:253

    -- function SNMP_realloc(memblock: Win32.PVOID;
                          -- size    : Win32.size_t)
                          -- return Win32.PVOID
                          -- renames Win32.Malloc.realloc;     -- snmp.h:254    
   
    -- not in Microsoft OpenTools
    -- function SNMP_oidcmp(
                -- A  : access AsnObjectIdentifier;
                -- B  : access AsnObjectIdentifier)
                -- return Win32.INT;                        -- snmp.h:302

   
    -- function SnmpUtilOidCmp(
                -- A  : access AsnObjectIdentifier;
                -- B  : access AsnObjectIdentifier)
                -- return Win32.INT
                -- renames SNMP_oidcmp;                     -- snmp.h:237

    procedure SNMP_printany(
                Any: access AsnAny);                        -- snmp.h:334

    procedure SnmpUtilPrintAsnAny(
                Any: access AsnAny)
                renames SNMP_printany;                      -- snmp.h:245

private

    pragma Convention(c_pass_by_copy, AsnOctetString);      -- snmp.h:143
    pragma Convention(c_pass_by_copy, AsnObjectIdentifier); -- snmp.h:147
    pragma Convention(c_pass_by_copy, AsnAny);              -- snmp.h:177
    pragma Convention(C, RFC1157VarBind);                   -- snmp.h:183
    pragma Convention(c_pass_by_copy, RFC1157VarBindList);  -- snmp.h:191
    pragma Convention(C, RFC1157Pdu);                       -- snmp.h:199
    pragma Convention(C, RFC1157TrapPdu);                   -- snmp.h:208
    pragma Convention(C, RFC1157Pdus);                      -- snmp.h:216
    pragma Convention(C, SnmpMgmtCom);                      -- snmp.h:223

    pragma Import(Stdcall, SNMP_DBG_free, "SNMP_DBG_free");       -- snmp.h:262
    pragma Import(Stdcall, SNMP_DBG_malloc, "SNMP_DBG_malloc");   -- snmp.h:269
    pragma Import(Stdcall, SNMP_DBG_realloc, "SNMP_DBG_realloc"); -- snmp.h:276
    pragma Import(Stdcall, SNMP_oidcpy, "SNMP_oidcpy");           -- snmp.h:284
    pragma Import(Stdcall, SNMP_oidappend, "SNMP_oidappend");     -- snmp.h:290
    -- pragma Import(Stdcall, SNMP_oidncmp, "SNMP_oidncmp");      -- snmp.h:296
    pragma Import(Stdcall, SNMP_oidfree, "SNMP_oidfree");         -- snmp.h:305
    pragma Import(Stdcall, SNMP_CopyVarBindList, "SNMP_CopyVarBindList");
                                                            -- snmp.h:310
    pragma Import(Stdcall, SNMP_CopyVarBind, "SNMP_CopyVarBind"); -- snmp.h:316
    pragma Import(Stdcall, SNMP_FreeVarBindList, "SNMP_FreeVarBindList");
                                                            -- snmp.h:323
    pragma Import(Stdcall, SNMP_FreeVarBind, "SNMP_FreeVarBind"); -- snmp.h:328
    pragma Import(Stdcall, SNMP_printany, "SNMP_printany");       -- snmp.h:334

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

end Win32.Snmp;

