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
with Win32.Utils;

package body Win32.crt.Tchar is

    use type Interfaces.C.Unsigned_Char;
    use type Interfaces.C.Size_T;
    use type Interfaces.C.Char_Array;

    function To_Int is new Ada.Unchecked_Conversion(Win32.PCCH, integer);
    function To_PCHAR is new Ada.Unchecked_Conversion(integer, Win32.PCHAR);
    function To_UINT is new Ada.Unchecked_Conversion(Win32.PCHAR, Win32.UINT);

    function tclen(cpc: Win32.PCCH) 
                return Win32.size_t is                     -- tchar.h:481
    begin
        return 1;
    end tclen;

    procedure tccpy(pc1 : in out Win32.PCHAR;
                    cpc2: Win32.PCCH) is                   -- tchar.h:482
    begin
        pc1.all := cpc2.all;
    end tccpy;

    function tccmp(cpc1: Win32.PCCH;
                   cpc2: Win32.PCCH) 
                   return Win32.Int is                      -- tchar.h:483
        --function To_UCHAR is new Ada.Unchecked_Conversion(Win32.CHAR,
        --function To_UCHAR is new Ada.Unchecked_Conversion(Win32.PCCH,
        --        Win32.UCHAR);
    begin
        return Win32.Int(To_Int(cpc1) - To_Int(cpc2));
        --return Win32.Int(
        --        Win32.Utils.MAKEWORD(
        --                Win32.BYTE(To_UCHAR(cpc1.all)) - 
        --                Win32.BYTE(To_UCHAR(cpc2.all)), 0));
    end tccmp;


    function strdec(cpc: Win32.PCCH;
                    pc : Win32.PCCH) 
                    return Win32.PCHAR is                   -- tchar.h: 529
    begin
        return To_PCHAR(To_Int(pc)-1); 
    end strdec;


    function strinc(pc : Win32.PCCH) 
                    return Win32.PCHAR is                   -- tchar.h: 530
    begin
        return To_PCHAR(To_Int(pc)+1); 
    end strinc;

    function strnextc(cpc : Win32.PCCH) 
                    return Win32.UINT is                    -- tchar.h: 531
        function To_BYTE is new Ada.Unchecked_Conversion(Win32.CHAR,
                Win32.BYTE);
    begin
        return Win32.UINT(Win32.Utils.MAKEWORD(To_BYTE(cpc.all), 0));
    end strnextc;

    function strninc(pc: Win32.PCCH;
                     sz: Win32.size_t) 
                     return Win32.PCHAR is                  -- tchar.h: 532
    begin
        return To_PCHAR(To_int(pc) + integer(sz));
    end strninc;

    function strncnt(cpc: Win32.PCCH; 
                     sz : Win32.size_t) 
                return Win32.size_t is                      -- tchar.h:533
        len : Win32.size_t;
    begin
        len := Win32.crt.Strings.strlen(cpc); 
        if (len > sz) then return sz; 
        else return len;        
        end if;
    end strncnt;

    procedure strspnp(cpc1: in out Win32.PCCH;
                      cpc2: in Win32.PCCH;
                      crv : out Win32.PCCH) is              -- tchar.h: 534 

        function To_PCCH is new Ada.Unchecked_Conversion(integer, Win32.PCCH);
    begin
        cpc1 := To_PCCH(To_int(cpc1) + 
                        integer(Win32.crt.Strings.strspn(cpc1,cpc2)));
        --if (character(cpc1.all) /= Ascii.nul) then
        if (Interfaces.C.Strings.Value(Win32.To_Chars_Ptr(cpc1))(1) 
        	/= Ascii.nul) then
                crv := cpc1;
        else
                crv := NULL;
        end if; 
    end strspnp;

    function T(x: Win32.PSTR) return Win32.PSTR is          -- tchar.h: 546 
    begin
        return x;
    end T;

end Win32.crt.Tchar;
