-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

package Win32.crt.Ctype is

    UPPER             : constant := 16#1#;                  -- ctype.h:84
    LOWER             : constant := 16#2#;                  -- ctype.h:85
    DIGIT             : constant := 16#4#;                  -- ctype.h:86
    SPACE             : constant := 16#8#;                  -- ctype.h:87
    PUNCT             : constant := 16#10#;                 -- ctype.h:89
    CONTROL           : constant := 16#20#;                 -- ctype.h:90
    BLANK             : constant := 16#40#;                 -- ctype.h:91
    HEX               : constant := 16#80#;                 -- ctype.h:92
    LEADBYTE          : constant := 16#8000#;               -- ctype.h:94
    ALPHA             : constant := 16#103#;                -- ctype.h:95

    subtype wint_t is Win32.wchar_t;                        -- ctype.h:48
    subtype wctype_t is Win32.wchar_t;                      -- ctype.h:49
    subtype char is Win32.UCHAR;

    WEOF : constant wint_t := wint_t'val(16#ffff#);         -- ctype.h:54

    function isalpha(c: Char) return Win32.INT;             -- ctype.h:101

    function isupper(c: Char) return Win32.INT;             -- ctype.h:102

    function islower(c: Char) return Win32.INT;             -- ctype.h:103

    function isdigit(c: Char) return Win32.INT;             -- ctype.h:104

    function isxdigit(c: Char) return Win32.INT;            -- ctype.h:105

    function isspace(c: Char) return Win32.INT;             -- ctype.h:106

    function ispunct(c: Char) return Win32.INT;             -- ctype.h:107

    function isalnum(c: Char) return Win32.INT;             -- ctype.h:108

    function isprint(c: Char) return Win32.INT;             -- ctype.h:109

    function isgraph(c: Char) return Win32.INT;             -- ctype.h:110

    function iscntrl(c: Char) return Win32.INT;             -- ctype.h:111

    function toupper(c: Char) return Char;                  -- ctype.h:112

    function tolower(c: Char) return Char;                  -- ctype.h:113

    function tolower_c0(c: Char) return Char;               -- ctype.h:114

    function toupper_c0(c: Char) return Char;               -- ctype.h:115

    function isascii(c: Char) return Win32.INT;             -- ctype.h:116

    function toascii(c: Char) return Char;                  -- ctype.h:117

    function iscsymf(c: Char) return Win32.INT;             -- ctype.h:118

    function iscsym(c: Char) return Win32.INT;              -- ctype.h:119

    function iswalpha(c: wint_t) return Win32.INT;          -- ctype.h:128

    function iswupper(c: wint_t) return Win32.INT;          -- ctype.h:129

    function iswlower(c: wint_t) return Win32.INT;          -- ctype.h:130

    function iswdigit(c: wint_t) return Win32.INT;          -- ctype.h:131

    function iswxdigit(c: wint_t) return Win32.INT;         -- ctype.h:132

    function iswspace(c: wint_t) return Win32.INT;          -- ctype.h:133

    function iswpunct(c: wint_t) return Win32.INT;          -- ctype.h:134

    function iswalnum(c: wint_t) return Win32.INT;          -- ctype.h:135

    function iswprint(c: wint_t) return Win32.INT;          -- ctype.h:136

    function iswgraph(c: wint_t) return Win32.INT;          -- ctype.h:137

    function iswcntrl(c: wint_t) return Win32.INT;          -- ctype.h:138

    function iswascii(c: wint_t) return Win32.INT;          -- ctype.h:139

    function isleadbyte(c: Char) return Win32.INT;          -- ctype.h:140

    function towupper(c: Win32.wchar_t) return Win32.wchar_t;
                                                            -- ctype.h:142

    function towlower(c: Win32.wchar_t) return Win32.wchar_t;
                                                            -- ctype.h:143

    function iswctype(c   : wint_t;
                      desc: wctype_t)
                          return Win32.INT;                 -- ctype.h:145

    function isctype(ch  : Char;
                     desc: Win32.INT)
                         return Win32.INT;                  -- ctype.h:147

private

    pragma Import(C, isalpha, "isalpha");                   -- ctype.h:101
    pragma Import(C, isupper, "isupper");                   -- ctype.h:102
    pragma Import(C, islower, "islower");                   -- ctype.h:103
    pragma Import(C, isdigit, "isdigit");                   -- ctype.h:104
    pragma Import(C, isxdigit, "isxdigit");                 -- ctype.h:105
    pragma Import(C, isspace, "isspace");                   -- ctype.h:106
    pragma Import(C, ispunct, "ispunct");                   -- ctype.h:107
    pragma Import(C, isalnum, "isalnum");                   -- ctype.h:108
    pragma Import(C, isprint, "isprint");                   -- ctype.h:109
    pragma Import(C, isgraph, "isgraph");                   -- ctype.h:110
    pragma Import(C, iscntrl, "iscntrl");                   -- ctype.h:111
    pragma Import(C, toupper, "toupper");                   -- ctype.h:112
    pragma Import(C, tolower, "tolower");                   -- ctype.h:113
    pragma Import(C, tolower_c0, "_tolower");               -- ctype.h:114
    pragma Import(C, toupper_c0, "_toupper");               -- ctype.h:115
    pragma Import(C, isascii, "__isascii");                 -- ctype.h:116
    pragma Import(C, toascii, "__toascii");                 -- ctype.h:117
    pragma Import(C, iscsymf, "__iscsymf");                 -- ctype.h:118
    pragma Import(C, iscsym, "__iscsym");                   -- ctype.h:119
    pragma Import(C, iswalpha, "iswalpha");                 -- ctype.h:128
    pragma Import(C, iswupper, "iswupper");                 -- ctype.h:129
    pragma Import(C, iswlower, "iswlower");                 -- ctype.h:130
    pragma Import(C, iswdigit, "iswdigit");                 -- ctype.h:131
    pragma Import(C, iswxdigit, "iswxdigit");               -- ctype.h:132
    pragma Import(C, iswspace, "iswspace");                 -- ctype.h:133
    pragma Import(C, iswpunct, "iswpunct");                 -- ctype.h:134
    pragma Import(C, iswalnum, "iswalnum");                 -- ctype.h:135
    pragma Import(C, iswprint, "iswprint");                 -- ctype.h:136
    pragma Import(C, iswgraph, "iswgraph");                 -- ctype.h:137
    pragma Import(C, iswcntrl, "iswcntrl");                 -- ctype.h:138
    pragma Import(C, iswascii, "iswascii");                 -- ctype.h:139
    pragma Import(C, isleadbyte, "isleadbyte");             -- ctype.h:140
    pragma Import(C, towupper, "towupper");                 -- ctype.h:142
    pragma Import(C, towlower, "towlower");                 -- ctype.h:143
    pragma Import(C, iswctype, "iswctype");                 -- ctype.h:145
    pragma Import(C, isctype, "_isctype");                  -- ctype.h:147

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

end Win32.crt.Ctype;
