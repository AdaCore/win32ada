-- $Source$
-- $Revision$ $Date$ $Author$

-- **************************************************************
-- Parent package for other Win32 interfaces.
-- The packages are organized into one library package with child
-- packages to avoid library level namespace pollution.
-- Some types are moved up here from winnt, winbase, and windefs,
-- to remove circular dependencies between those packages.
-- Also some common types, e.g. CHAR_Array, are put here so they
-- will not be replicated in many other packages.
-- **************************************************************

with Ada.Unchecked_Conversion;
with Interfaces;
with Interfaces.C;
with Interfaces.C.Strings;
with System;

package Win32 is

    pragma Linker_Options ("-lwin32ada");
    pragma Linker_Options ("-luser32");
    pragma Linker_Options ("-lgdi32");
    pragma Linker_Options ("-lcomdlg32");

    -- *****************************************************
    -- Built-in C types, their Win32 names,
    -- pointers to "all" and "constant" values of the types,
    -- and arrays of the types.
    -- *****************************************************

    -- C pointer to "void", a pointer to anything that must
    -- be converted to another pointer to be useful
    type    VOID    is null record;
    subtype PVOID   is System.Address;                      -- winnt.h
    subtype LPVOID  is PVOID;                               -- windef.h
    subtype PCVOID  is PVOID;
    subtype LPCVOID is PCVOID;                              -- windef.h
    type    PVOID_Array is array(Natural range <>) of aliased PVOID;
                                                            -- rpcproxy.h

    -- 8 bit signed chars
    subtype CHAR       is Interfaces.C.Char;                -- winnt.h
    type    PCHAR      is access all CHAR;                  -- winnt.h
    subtype LPCH       is PCHAR;                            -- winnt.h
    subtype PCH        is PCHAR;                            -- winnt.h
    subtype NPSTR      is PCHAR;                            -- winnt.h
    subtype LPSTR      is PCHAR;                            -- winnt.h
    subtype PSTR       is PCHAR;                            -- winnt.h
    subtype PSZ        is PCHAR;                            -- windef.h
    type    PCCH       is access constant CHAR;             -- winnt.h
    subtype PCCHAR     is PCCH;                             -- rpcproxy.h
    subtype LPCCH      is PCCH;                             -- winnt.h
    subtype LPCSTR     is PCCH;                             -- winnt.h
    subtype PCSTR      is PCCH;                             -- winnt.h
    type    CHAR_Array is array(Natural range <>) of aliased CHAR;
    Nul     : constant CHAR := CHAR'First;
    type    TCHAR      is new CHAR;                         -- tchar.h:409

    -- 8 bit unsigned chars
    subtype UCHAR       is Interfaces.C.Unsigned_Char;      -- windef.h
    type    BYTE        is new Interfaces.C.Unsigned_Char;  -- windef.h
    type    PBYTE       is access all BYTE;                 -- windef.h
    subtype LPBYTE      is PBYTE;                           -- windef.h
    type    PCBYTE      is access constant BYTE;
    type    PCUCHAR     is access constant UCHAR;           -- rpcndr.h
    type    PUCHAR      is access all UCHAR;                -- windef.h
    type    BYTE_Array  is array(Natural range <>) of aliased BYTE;
    type    UCHAR_Array is array(Natural range <>) of aliased UCHAR;

    -- 16 bit wide chars
    subtype wchar_t     is Interfaces.C.wchar_t;            -- ctype.h
    subtype WCHAR       is wchar_t;                         -- winnt.h
    type    PWCH        is access all WCHAR;                -- winnt.h
    subtype LPWCH       is PWCH;                            -- winnt.h
    subtype PWCHAR      is PWCH;                            -- winnt.h
    subtype NWPSTR      is PWCH;                            -- winnt.h
    subtype LPWSTR      is PWCH;                            -- winnt.h
    subtype PWSTR       is PWCH;                            -- winnt.h
    type    PCWCH       is access constant WCHAR;           -- winnt.h
    subtype LPCWCH      is PCWCH;                           -- winnt.h
    subtype PCWSTR      is PCWCH;                           -- winnt.h
    subtype LPCWSTR     is PCWCH;                           -- winnt.h
    type    WCHAR_Array is array(Natural range <>) of aliased WCHAR;
    Wide_Nul : constant WCHAR := WCHAR'First;

    -- 16 bit signed integers
    subtype SHORT       is Interfaces.C.Short;              -- winnt.h
    type    PSHORT      is access all SHORT;                -- windef.h
    type    PCSHORT     is access constant SHORT;
    type    SHORT_Array is array(Natural range <>) of aliased SHORT;

    -- 16 bit unsigned integers
    subtype USHORT     is Interfaces.C.Unsigned_Short;      -- windef.h
    subtype WORD       is USHORT;                           -- windef.h
    type    PUSHORT    is access all USHORT;                -- windef.h
    type    PWORD      is new PUSHORT;                      -- windef.h
    type    PCWORD     is access constant WORD;
    subtype LPWORD     is PWORD;                            -- windef.h
    type    WORD_Array is array(Natural range <>) of aliased WORD;

    -- "int" types, signed, 32 bits on Intel
    subtype INT       is Interfaces.C.Int;                  -- windef.h
    type    BOOL      is new INT;                           -- windef.h
    type    PBOOL     is access all BOOL;                   -- windef.h
    subtype LPBOOL    is PBOOL;                             -- windef.h
    type    PINT      is access all INT;                    -- windef.h
    subtype LPINT     is PINT;                              -- windef.h
    type    PCINT     is access constant INT;
    type    INT_Array is array(Natural range <>) of aliased INT;

    -- "unsigned" or "unsigned int" types, unsigned, 32 bits on Intel
    subtype UINT       is Interfaces.C.Unsigned;            -- windef.h
    subtype WPARAM     is UINT;                             -- windef.h
    type    PUINT      is access all UINT;                  -- windef.h
    type    PCUINT     is access constant UINT;
    type    UINT_Array is array(Natural range <>) of aliased UINT;
    subtype size_t     is Interfaces.C.size_t;

    -- "long" 32 bit signed integers
    subtype LONG       is Interfaces.C.Long;                -- winnt.h
    subtype LPARAM     is LONG;                             -- windef.h
    subtype LRESULT    is LONG;                             -- windef.h
    type    PLONG      is access all LONG;
    subtype LPLONG     is PLONG;                            -- windef.h
    type    PCLONG     is access constant LONG;
    type    LONG_Array is array(Natural range <>) of aliased LONG;

    -- "unsigned long" 32 bit unsigned integers
    subtype ULONG       is Interfaces.C.Unsigned_Long;      -- windef.h
    subtype DWORD       is ULONG;                           -- windef.h
    type    PULONG      is access all ULONG;                -- windef.h
    subtype PDWORD      is PULONG;                          -- windef.h
    subtype LPDWORD     is PDWORD;                          -- windef.h
    type    PCDWORD     is access constant DWORD;
    type    ULONG_Array is array(Natural range <>) of aliased ULONG;
    subtype DWORD_Array is ULONG_Array;

    -- builtin C "float", 32 bits on Intel
    subtype FLOAT  is Interfaces.C.C_Float;                 -- windef.h
    type    PFLOAT is access all FLOAT;                     -- windef.h

    -- builtin C "double", also 64 bits on Intel
    subtype DOUBLE  is Interfaces.C.double;
    type    PDOUBLE is access all DOUBLE;

    -- 64 bit signed integer
    type LONGLONG is private;
    type PLONGLONG is access all LONGLONG;                  -- winnt.h
    type PCLONGLONG is access constant LONGLONG;

    -- 64 bit unsigned integer
    type DWORDLONG is private;
    type PDWORDLONG is access all DWORDLONG;                -- winnt.h
    type PCDWORDLONG is access constant DWORDLONG;

    -- ************************************************************
    -- True and False constants.
    -- Warning: when you get a value back from Windows, comparing
    -- Value /= FALSE is safe, comparing Value = TRUE is not safe,
    -- since Windows sometimes returns any non-zero value for TRUE.
    -- ************************************************************

    FALSE : constant := 0;                                  -- windef.h
    TRUE  : constant := 1;                                  -- windef.h

    -- ********************************************************
    -- so Interfaces.C and Windows strings can be used together
    -- ********************************************************

    function To_Chars_Ptr (STR: PSTR) return Interfaces.C.Strings.Chars_Ptr;

    function To_Chars_Ptr (STR: PCSTR) return Interfaces.C.Strings.Chars_Ptr;

    function To_PSTR (CP: Interfaces.C.Strings.Chars_Ptr) return PSTR;

    function To_PCSTR (CP: Interfaces.C.Strings.Chars_Ptr) return PCSTR;

    function To_C (S: CHAR_Array) return Interfaces.C.CHAR_Array;

    function To_Win (S: Interfaces.C.CHAR_Array) return CHAR_Array;

    function To_Win (S: Interfaces.C.WCHAR_Array) return WCHAR_Array;

    -- ********************************************************************
    -- These could be useful with a Standard.String that is NUL-terminated.
    -- They return the address of the first element.
    -- See also the conversion functions in Interfaces.C.
    -- ********************************************************************

    function Addr (S: String) return PSTR;

    function Addr (S: String) return PCSTR;

    function Addr (S: Wide_String) return PWSTR;

    function Addr (S: Wide_String) return PCWSTR;

    function Addr (S: CHAR_Array) return PSTR;

    function Addr (S: CHAR_Array) return PCSTR;

    function Addr (S: WCHAR_Array) return PWSTR;

    function Addr (S: WCHAR_Array) return PCWSTR;

    -- **************************************************************
    -- Special string-catenation functions that will trim a trailing
    -- nul from the left string, if present, and will add a trailing nul
    -- to the result, if not present at the end of the right string.
    -- The easiest way to use this is with a local renaming, e.g.
    --   function "&" (Left, Right: String) return String renames Win32.Cat;
    -- **************************************************************

    function Cat (Left, Right: String) return String;

    function Cat (Left, Right: Wide_String) return Wide_String;

    function Cat (Left, Right: CHAR_Array) return CHAR_Array;

    function Cat (Left, Right: WCHAR_Array) return WCHAR_Array;

    -- ********************************************************
    -- In C, a variable-size array is declared as a[1] or
    -- a[ANYSIZE_ARRAY], where ANYSIZE_ARRAY is defined as 1.
    -- Then it is used as if it were bigger.
    -- In Ada we declare it as array(0..ANYSIZE_ARRAY) and then
    -- use the extensible array package.
    -- In C ANYSIZE_ARRAY is 1 and in Ada it is 0.
    -- ********************************************************

    ANYSIZE_ARRAY: constant := 0;                           -- winnt.h:26

    -- ********************************************************
    -- String vectors.
    -- Use the extensible-arrays package to get one of these that is bigger.
    -- Be sure to put a null pointer as the last array element.
    -- ********************************************************
    type String_Vector is array(0..Win32.ANYSIZE_ARRAY) of aliased Win32.PSTR;
    type String_Vector_Access is access all String_Vector;


    -- *******************************************
    -- Bit fields inside C structs and Ada records
    -- *******************************************

    type bits1  is range 0 .. 2**1-1;
    type bits2  is range 0 .. 2**2-1;
    type bits3  is range 0 .. 2**3-1;
    type bits4  is range 0 .. 2**4-1;
    type bits5  is range 0 .. 2**5-1;
    type bits6  is range 0 .. 2**6-1;
    type bits7  is range 0 .. 2**7-1;
    type bits8  is range 0 .. 2**8-1;
    type bits9  is range 0 .. 2**9-1;
    type bits10 is range 0 .. 2**10-1;
    type bits11 is range 0 .. 2**11-1;
    type bits12 is range 0 .. 2**12-1;
    type bits13 is range 0 .. 2**13-1;
    type bits14 is range 0 .. 2**14-1;
    type bits15 is range 0 .. 2**15-1;
    type bits16 is range 0 .. 2**16-1;
    type bits17 is range 0 .. 2**17-1;
    type bits18 is range 0 .. 2**18-1;
    type bits19 is range 0 .. 2**19-1;
    type bits20 is range 0 .. 2**20-1;
    type bits21 is range 0 .. 2**21-1;
    type bits22 is range 0 .. 2**22-1;
    type bits23 is range 0 .. 2**23-1;
    type bits24 is range 0 .. 2**24-1;
    type bits25 is range 0 .. 2**25-1;
    type bits26 is range 0 .. 2**26-1;
    type bits27 is range 0 .. 2**27-1;
    type bits28 is range 0 .. 2**28-1;
    type bits29 is range 0 .. 2**29-1;
    type bits30 is range 0 .. 2**30-1;
    type bits31 is range 0 .. 2**31-1;

    for bits1'size use 1;
    for bits2'size use 2;
    for bits3'size use 3;
    for bits4'size use 4;
    for bits5'size use 5;
    for bits6'size use 6;
    for bits7'size use 7;
    for bits8'size use 8;
    for bits9'size use 9;
    for bits10'size use 10;
    for bits11'size use 11;
    for bits12'size use 12;
    for bits13'size use 13;
    for bits14'size use 14;
    for bits15'size use 15;
    for bits16'size use 16;
    for bits17'size use 17;
    for bits18'size use 18;
    for bits19'size use 19;
    for bits20'size use 20;
    for bits21'size use 21;
    for bits22'size use 22;
    for bits23'size use 23;
    for bits24'size use 24;
    for bits25'size use 25;
    for bits26'size use 26;
    for bits27'size use 27;
    for bits28'size use 28;
    for bits29'size use 29;
    for bits30'size use 30;
    for bits31'size use 31;

private

    pragma Inline(To_C);
    pragma Inline(To_Win);
    pragma Inline(To_Chars_Ptr);
    pragma Inline(To_Chars_Ptr);
    pragma Inline(To_PSTR);
    pragma Inline(To_PCSTR);

    -- Warning: it is endian dependent to assume which word is least significant
    type LONGLONG is record
        A, B : INT;
    end record;

    type DWORDLONG is record
        A, B : UINT;
    end record;

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED "AS IS" WITHOUT
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR
-- A PARTICULAR PURPOSE.  The user assumes the entire risk as to the accuracy
-- and the use of this file.  This file may be used only by licensees of
-- Microsoft Corporation's WIN32 Software Development Kit in accordance with
-- the terms of the licensee's End-User License Agreement for Microsoft
-- Software for the WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32;

