-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Ada.Unchecked_Conversion;
with Win32;
with Win32.Winnt;

package Win32.Mapi is

    subtype LHANDLE is Win32.Winnt.HANDLE;                 -- mapi.h:35

    lhSessionNull                   : constant LHANDLE;     -- mapi.h:36
    MAPI_MESSAGEID_LENGTH           : constant := 64;       -- mapi.h:39
    MAPI_OLE                        : constant := 16#1#;    -- mapi.h:51
    MAPI_OLE_STATIC                 : constant := 16#2#;    -- mapi.h:52
    MAPI_ORIG                       : constant := 0;        -- mapi.h:68
    MAPI_TO                         : constant := 1;        -- mapi.h:69
    MAPI_CC                         : constant := 2;        -- mapi.h:70
    MAPI_BCC                        : constant := 3;        -- mapi.h:71
    MAPI_UNREAD                     : constant := 16#1#;    -- mapi.h:91
    MAPI_RECEIPT_REQUESTED          : constant := 16#2#;    -- mapi.h:92
    MAPI_SENT                       : constant := 16#4#;    -- mapi.h:93
    MAPI_LOGON_UI                   : constant := 16#1#;    -- mapi.h:103
    MAPI_NEW_SESSION                : constant := 16#2#;    -- mapi.h:104
    MAPI_DIALOG                     : constant := 16#8#;    -- mapi.h:105
    MAPI_UNREAD_ONLY                : constant := 16#20#;   -- mapi.h:106
    MAPI_ENVELOPE_ONLY              : constant := 16#40#;   -- mapi.h:107
    MAPI_PEEK                       : constant := 16#80#;   -- mapi.h:108
    MAPI_GUARANTEE_FIFO             : constant := 16#100#;  -- mapi.h:109
    MAPI_BODY_AS_FILE               : constant := 16#200#;  -- mapi.h:110
    MAPI_AB_NOMODIFY                : constant := 16#400#;  -- mapi.h:111
    MAPI_SUPPRESS_ATTACH            : constant := 16#800#;  -- mapi.h:112
    MAPI_FORCE_DOWNLOAD             : constant := 16#1000#; -- mapi.h:113
    SUCCESS_SUCCESS                 : constant := 0;        -- mapi.h:164
    MAPI_USER_ABORT                 : constant := 1;        -- mapi.h:165
    MAPI_E_FAILURE                  : constant := 2;        -- mapi.h:166
    MAPI_E_LOGIN_FAILURE            : constant := 3;        -- mapi.h:167
    MAPI_E_DISK_FULL                : constant := 4;        -- mapi.h:168
    MAPI_E_INSUFFICIENT_MEMORY      : constant := 5;        -- mapi.h:169
    MAPI_E_ACCESS_DENIED            : constant := 6;        -- mapi.h:170
    MAPI_E_TOO_MANY_SESSIONS        : constant := 8;        -- mapi.h:171
    MAPI_E_TOO_MANY_FILES           : constant := 9;        -- mapi.h:172
    MAPI_E_TOO_MANY_RECIPIENTS      : constant := 10;       -- mapi.h:173
    MAPI_E_ATTACHMENT_NOT_FOUND     : constant := 11;       -- mapi.h:174
    MAPI_E_ATTACHMENT_OPEN_FAILURE  : constant := 12;       -- mapi.h:175
    MAPI_E_ATTACHMENT_WRITE_FAILURE : constant := 13;       -- mapi.h:176
    MAPI_E_UNKNOWN_RECIPIENT        : constant := 14;       -- mapi.h:177
    MAPI_E_BAD_RECIPTYPE            : constant := 15;       -- mapi.h:178
    MAPI_E_NO_MESSAGES              : constant := 16;       -- mapi.h:179
    MAPI_E_INVALID_MESSAGE          : constant := 17;       -- mapi.h:180
    MAPI_E_TEXT_TOO_LARGE           : constant := 18;       -- mapi.h:181
    MAPI_E_INVALID_SESSION          : constant := 19;       -- mapi.h:182
    MAPI_E_TYPE_NOT_SUPPORTED       : constant := 20;       -- mapi.h:183
    MAPI_E_AMBIGUOUS_RECIPIENT      : constant := 21;       -- mapi.h:184
    MAPI_E_MESSAGE_IN_USE           : constant := 22;       -- mapi.h:185
    MAPI_E_NETWORK_FAILURE          : constant := 23;       -- mapi.h:186
    MAPI_E_INVALID_EDITFIELDS       : constant := 24;       -- mapi.h:187
    MAPI_E_INVALID_RECIPS           : constant := 25;       -- mapi.h:188
    MAPI_E_NOT_SUPPORTED            : constant := 26;       -- mapi.h:189

    type FLAGS is new Win32.UINT;                           -- mapi.h:34

    type LPULONG is new Win32.PULONG;                       -- mapi.h:33
    type LPLHANDLE is access all LHANDLE;                   -- mapi.h:35

    type MapiFileDesc;                                      -- mapi.h:49
    type MapiRecipDesc;                                     -- mapi.h:66
    type MapiMessage;                                       -- mapi.h:89

    type lpMapiFileDesc is access all MapiFileDesc;         -- mapi.h:49
    type lpMapiRecipDesc is access all MapiRecipDesc;       -- mapi.h:66
    type lpMapiMessage is access all MapiMessage;           -- mapi.h:89

    type MapiFileDesc is                                    -- mapi.h:49
        record
            ulReserved  : Win32.ULONG;                      -- mapi.h:43
            flFlags     : Win32.ULONG;                      -- mapi.h:44
            nPosition   : Win32.ULONG;                      -- mapi.h:45
            lpszPathName: Win32.LPSTR;                      -- mapi.h:46
            lpszFileName: Win32.LPSTR;                      -- mapi.h:47
            lpFileType  : Win32.LPVOID;                     -- mapi.h:48
        end record;

    type MapiRecipDesc is                                   -- mapi.h:66
        record
            ulReserved  : Win32.ULONG;                      -- mapi.h:59
            ulRecipClass: Win32.ULONG;                      -- mapi.h:60
            lpszName    : Win32.LPSTR;                      -- mapi.h:62
            lpszAddress : Win32.LPSTR;                      -- mapi.h:63
            ulEIDSize   : Win32.ULONG;                      -- mapi.h:64
            lpEntryID   : Win32.LPVOID;                     -- mapi.h:65
        end record;

    type MapiMessage is                                     -- mapi.h:89
        record
            ulReserved        : Win32.ULONG;                -- mapi.h:77
            lpszSubject       : Win32.LPSTR;                -- mapi.h:78
            lpszNoteText      : Win32.LPSTR;                -- mapi.h:79
            lpszMessageType   : Win32.LPSTR;                -- mapi.h:80
            lpszDateReceived  : Win32.LPSTR;                -- mapi.h:81
            lpszConversationID: Win32.LPSTR;                -- mapi.h:82
            flFlags           : FLAGS;                      -- mapi.h:83
            lpOriginator      : lpMapiRecipDesc;            -- mapi.h:84
            nRecipCount       : Win32.ULONG;                -- mapi.h:85
            lpRecips          : lpMapiRecipDesc;            -- mapi.h:86
            nFileCount        : Win32.ULONG;                -- mapi.h:87
            lpFiles           : lpMapiFileDesc;             -- mapi.h:88
        end record;

    function MAPILogon(
                ulUIParam   : Win32.ULONG;
                lpszName    : Win32.LPSTR;
                lpszPassword: Win32.LPSTR;
                flFlags     : FLAGS;
                ulReserved  : Win32.ULONG;
                lplhSession : LPLHANDLE)
               return Win32.ULONG;                          -- mapi.h:115

    function MAPILogoff(
                lhSession : LHANDLE;
                ulUIParam : Win32.ULONG;
                flFlags   : FLAGS;
                ulReserved: Win32.ULONG)
               return Win32.ULONG;                          -- mapi.h:119

    function MAPISendMail(
                lhSession : LHANDLE;
                ulUIParam : Win32.ULONG;
                lpMessage : lpMapiMessage;
                flFlags   : FLAGS;
                ulReserved: Win32.ULONG)
               return Win32.ULONG;                          -- mapi.h:122

    function MAPISendDocuments(
                ulUIParam    : Win32.ULONG;
                lpszDelimChar: Win32.LPSTR;
                lpszFilePaths: Win32.LPSTR;
                lpszFileNames: Win32.LPSTR;
                ulReserved   : Win32.ULONG)
               return Win32.ULONG;                          -- mapi.h:126

    function MAPIFindNext(
                lhSession        : LHANDLE;
                ulUIParam        : Win32.ULONG;
                lpszMessageType  : Win32.LPSTR;
                lpszSeedMessageID: Win32.LPSTR;
                flFlags          : FLAGS;
                ulReserved       : Win32.ULONG;
                lpszMessageID    : Win32.LPSTR)
               return Win32.ULONG;                          -- mapi.h:130

    function MAPIReadMail(
                lhSession    : LHANDLE;
                ulUIParam    : Win32.ULONG;
                lpszMessageID: Win32.LPSTR;
                flFlags      : FLAGS;
                ulReserved   : Win32.ULONG;
                lppMessageOut: access lpMapiMessage)
               return Win32.ULONG;                          -- mapi.h:135

    function MAPISaveMail(
                lhSession    : LHANDLE;
                ulUIParam    : Win32.ULONG;
                pMessage     : lpMapiMessage;
                flFlags      : FLAGS;
                ulReserved   : Win32.ULONG;
                lpszMessageID: Win32.LPSTR)
               return Win32.ULONG;                          -- mapi.h:139

    function MAPIDeleteMail(
                lhSession    : LHANDLE;
                ulUIParam    : Win32.ULONG;
                lpszMessageID: Win32.LPSTR;
                flFlags      : FLAGS;
                ulReserved   : Win32.ULONG)
               return Win32.ULONG;                          -- mapi.h:143

    function MAPIFreeBuffer(
                pv: Win32.LPVOID)
               return Win32.ULONG;                          -- mapi.h:147

    function MAPIAddress(
                lhSession   : LHANDLE;
                ulUIParam   : Win32.ULONG;
                plszCaption : Win32.LPSTR;
                nEditFields : Win32.ULONG;
                lpszLabels  : Win32.LPSTR;
                nRecips     : Win32.ULONG;
                lpRecips    : lpMapiRecipDesc;
                flFlags     : FLAGS;
                ulReserved  : Win32.ULONG;
                lpnNewRecips: LPULONG;
                lppNewRecips: access lpMapiRecipDesc)
               return Win32.ULONG;                          -- mapi.h:149

    function MAPIDetails(
                lhSession : LHANDLE;
                ulUIParam : Win32.ULONG;
                lpRecip   : lpMapiRecipDesc;
                flFlags   : FLAGS;
                ulReserved: Win32.ULONG)
               return Win32.ULONG;                          -- mapi.h:155

    function MAPIResolveName(
                lhSession : LHANDLE;
                ulUIParam : Win32.ULONG;
                lpszName  : Win32.LPSTR;
                flFlags   : FLAGS;
                ulReserved: Win32.ULONG;
                lppRecip  : access lpMapiRecipDesc)
               return Win32.ULONG;                          -- mapi.h:158

private

    pragma Convention(C, MapiFileDesc);                     -- mapi.h:49
    pragma Convention(C, MapiRecipDesc);                    -- mapi.h:66
    pragma Convention(C, MapiMessage);                      -- mapi.h:89

    function To_LHANDLE is new Ada.Unchecked_Conversion (Win32.DWORD, LHANDLE);
    lhSessionNull : constant LHANDLE := To_LHANDLE(0);      -- mapi.h:36

    pragma Import(Stdcall, MAPILogon, "MAPILogon");               -- mapi.h:115
    pragma Import(Stdcall, MAPILogoff, "MAPILogoff");             -- mapi.h:119
    pragma Import(Stdcall, MAPISendMail, "MAPISendMail");         -- mapi.h:122
    pragma Import(Stdcall, MAPISendDocuments, "MAPISendDocuments");
                                                            -- mapi.h:126
    pragma Import(Stdcall, MAPIFindNext, "MAPIFindNext");         -- mapi.h:130
    pragma Import(Stdcall, MAPIReadMail, "MAPIReadMail");         -- mapi.h:135
    pragma Import(Stdcall, MAPISaveMail, "MAPISaveMail");         -- mapi.h:139
    pragma Import(Stdcall, MAPIDeleteMail, "MAPIDeleteMail");     -- mapi.h:143
    pragma Import(Stdcall, MAPIFreeBuffer, "MAPIFreeBuffer");     -- mapi.h:147
    pragma Import(Stdcall, MAPIAddress, "MAPIAddress");           -- mapi.h:149
    pragma Import(Stdcall, MAPIDetails, "MAPIDetails");           -- mapi.h:155
    pragma Import(Stdcall, MAPIResolveName, "MAPIResolveName");   -- mapi.h:158

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

end Win32.Mapi;
