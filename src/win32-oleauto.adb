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
with Interfaces.C;

package body Win32.Oleauto is

    use type Interfaces.C.Unsigned_Long;

    procedure TYPEKIND_to_xmit(pEnum : in  PTYPEKIND; 
                               ppLong: out Win32.Oleauto.PPLONG) is 
			       -- oleauto.h:643

        function To_PLONG is new Ada.Unchecked_Conversion(PTYPEKIND, 
                Win32.PLONG);
    begin
         ppLong.all := To_PLONG(pEnum);
    end TYPEKIND_to_xmit;

    procedure TYPEKIND_from_xmit(pLong: in  Win32.PLONG;
                                 pEnum: out PTYPEKIND) is   -- oleauto.h:644

        function To_TYPEKIND is new Ada.Unchecked_Conversion(Win32.LONG, 
                        TYPEKIND);
    begin
        pEnum.all := To_TYPEKIND(pLong.all);
    end TYPEKIND_from_xmit;

    procedure CALLCONV_to_xmit(pEnum : in  PCALLCONV; 
                               ppLong: out Win32.Oleauto.PPLONG) is 
			       -- oleauto.h:643

        function To_PLONG is new Ada.Unchecked_Conversion(PCALLCONV, 
                Win32.PLONG);
    begin
         ppLong.all := To_PLONG(pEnum);
    end CALLCONV_to_xmit;

    procedure CALLCONV_from_xmit(pLong: in  Win32.PLONG;
                                 pEnum: out PCALLCONV) is   -- oleauto.h:644

        function To_CALLCONV is new Ada.Unchecked_Conversion(Win32.LONG, 
                        CALLCONV);
    begin
        pEnum.all := To_CALLCONV(pLong.all);
    end CALLCONV_from_xmit;

    procedure FUNCKIND_to_xmit(pEnum : in  PFUNCKIND; 
                               ppLong: out Win32.Oleauto.PPLONG) is 
			       -- oleauto.h:842

        function To_PLONG is new Ada.Unchecked_Conversion(PFUNCKIND, 
                Win32.PLONG);
    begin
         ppLong.all := To_PLONG(pEnum);
    end FUNCKIND_to_xmit;

    procedure FUNCKIND_from_xmit(pLong: in  Win32.PLONG;
                                 pEnum: out PFUNCKIND) is   -- oleauto.h:843

        function To_FUNCKIND is new Ada.Unchecked_Conversion(Win32.LONG, 
                        FUNCKIND);
    begin
        pEnum.all := To_FUNCKIND(pLong.all);
    end FUNCKIND_from_xmit;

    procedure INVOKEKIND_to_xmit(pEnum : in  PINVOKEKIND; 
                                 ppLong: out Win32.Oleauto.PPLONG) is
                                                            -- oleauto.h:855

        function To_PLONG is new Ada.Unchecked_Conversion(PINVOKEKIND, 
                Win32.PLONG);
    begin
         ppLong.all := To_PLONG(pEnum);
    end INVOKEKIND_to_xmit;

    procedure INVOKEKIND_from_xmit(pLong: in  Win32.PLONG;
                                   pEnum: out PINVOKEKIND) is
                                                            -- oleauto.h:856

        function To_INVOKEKIND is new Ada.Unchecked_Conversion(Win32.LONG, 
                        INVOKEKIND);
    begin
        pEnum.all := To_INVOKEKIND(pLong.all);
    end INVOKEKIND_from_xmit;

    procedure VARKIND_to_xmit(pEnum : in  PVARKIND; 
                              ppLong: out Win32.Oleauto.PPLONG) is  
                                                              -- oleauto.h:888

        function To_PLONG is new Ada.Unchecked_Conversion(PVARKIND, 
                Win32.PLONG);
    begin
         ppLong.all := To_PLONG(pEnum);
    end VARKIND_to_xmit;

    procedure VARKIND_from_xmit(pLong: in  Win32.PLONG;
                                pEnum: out PVARKIND) is     -- oleauto.h:889

        function To_VARKIND is new Ada.Unchecked_Conversion(Win32.LONG, 
                        VARKIND);
    begin
        pEnum.all := To_VARKIND(pLong.all);
    end VARKIND_from_xmit;

    procedure DESCKIND_to_xmit(pEnum : in  PDESCKIND; 
                              ppLong: out Win32.Oleauto.PPLONG) is  
			      -- oleauto.h:2316

        function To_PLONG is new Ada.Unchecked_Conversion(PDESCKIND, 
                Win32.PLONG);
    begin
         ppLong.all := To_PLONG(pEnum);
    end DESCKIND_to_xmit;

    procedure DESCKIND_from_xmit(pLong: in  Win32.PLONG;
                                pEnum: out PDESCKIND) is    -- oleauto.h:2317

        function To_DESCKIND is new Ada.Unchecked_Conversion(Win32.LONG, 
                        DESCKIND);
    begin
        pEnum.all := To_DESCKIND(pLong.all);
    end DESCKIND_from_xmit;

    procedure SYSKIND_to_xmit(pEnum : in  PSYSKIND; 
                              ppLong: out Win32.Oleauto.PPLONG) is  
			      -- oleauto.h:3066

        function To_PLONG is new Ada.Unchecked_Conversion(PSYSKIND, 
                Win32.PLONG);
    begin
         ppLong.all := To_PLONG(pEnum);
    end SYSKIND_to_xmit;

    procedure SYSKIND_from_xmit(pLong: in  Win32.PLONG;
                                pEnum: out PSYSKIND) is     -- oleauto.h:3067

        function To_SYSKIND is new Ada.Unchecked_Conversion(Win32.LONG, 
                        SYSKIND);
    begin
        pEnum.all := To_SYSKIND(pLong.all);
    end SYSKIND_from_xmit;

    function LHashValOfName(lcid  : Win32.Winnt.LCID;       -- oleauto.h:4196
                            szName: Win32.PCWSTR) 
                            return Win32.ULONG is                   
    begin
        return LHashValOfNameSys(SYS_WIN32, lcid, szName);
    end LHashValOfName;

    function "and"(l,r: Interfaces.C.unsigned_long)
                        return Interfaces.C.unsigned_long
                        renames Interfaces.C."and";


    function IsHashValCompatible(lhashval1: Win32.ULONG;
                                 lhashval2: Win32.ULONG)
                                 return Win32.BOOL is       -- oleauto.h:4202

    begin
        if ((16#00ff0000# and lhashval1) = (16#00ff0000# and lhashval2)) then
            return Win32.TRUE;
        end if;
        return Win32.FALSE;

    end IsHashValCompatible;

    function  WHashValOfLHashVal(lhashval: Win32.ULONG) 
                                return Win32.USHORT is      -- oleauto.h:4199
    begin
        return Win32.USHORT(16#0000ffff# and lhashval);
    end WHashValOfLHashVal;


    function V_VT(X: access VARIANT) return VARTYPE is
                                                            -- oleauto.h:4385
    begin
        return X.all.vt;
    end V_VT;

    function V_ISBYREF(X: access VARIANT) return VARTYPE is -- oleauto.h:4386
    begin
        return (V_VT(X) and VT_BYREF);
    end V_ISBYREF;

    function V_ISARRAY(X: access VARIANT) return  VARTYPE is-- oleauto.h:4387
    begin
        return (V_VT(X) and VT_ARRAY);
    end V_ISARRAY;

    function V_ISVECTOR(X: access VARIANT) return  VARTYPE is
                                                            -- oleauto.h:4388
    begin
        return (V_VT(X) and VT_VECTOR);
    end V_ISVECTOR;

    function V_I2(X: access VARIANT) return Win32.SHORT is  -- oleauto.h:4395
    begin          
        return X.all.u.iVal;
    end V_I2;

    function V_NONE(X: access VARIANT) return Win32.SHORT is-- oleauto.h:4390
    begin        
        return V_I2(X);
    end V_NONE;

    function V_UI1(X: access VARIANT) return Win32.UCHAR is -- oleauto.h:4392
    begin  
        return  X.all.u.bVal;
    end V_UI1;

    function V_UI1REF(X: access VARIANT) return Win32.PUCHAR is
                                                            -- oleauto.h:4393
    begin      
        return X.all.u.pbVal;
    end  V_UI1REF;

    function V_I2REF(X: access VARIANT) return Win32.PSHORT is
                                                            -- oleauto.h:4396
    begin       
        return X.all.u.piVal;
    end V_I2REF;

    function V_I4(X: access VARIANT) return Win32.LONG is   -- oleauto.h:4398
    begin          
        return X.all.u.lVal;
    end V_I4;

    function V_I4REF(X: access VARIANT) return Win32.PLONG is
                                                            -- oleauto.h:4390
    begin       
        return X.all.u.plVal;
    end V_I4REF;

    function V_R4(X: access VARIANT) return Win32.FLOAT is  -- oleauto.h:4404
    begin          
        return X.all.u.fltVal;
    end V_R4;

    function V_R4REF(X: access VARIANT) return Win32.PFLOAT is
                                                            -- oleauto.h:4405
    begin       
        return X.all.u.pfltVal;
    end V_R4REF;

    function V_R8(X: access VARIANT) return Win32.DOUBLE is -- oleauto.h:4407
    begin          
        return X.all.u.dblVal;
    end V_R8;

    function V_R8REF(X: access VARIANT) return Win32.PDOUBLE is
                                                            -- oleauto.h:4408
    begin       
        return X.all.u.pdblVal;
    end V_R8REF;

    function V_CY(X: access VARIANT) return CY is           -- oleauto.h:4410
    begin          
        return X.all.u.cyVal;
    end V_CY;

    function V_CYREF(X: access VARIANT) return PCY is       -- oleauto.h:4411
    begin       
        return X.all.u.pcyVal;
    end V_CYREF;

    function V_DATE(X: access VARIANT) return Win32.Oleauto.DATE is
                                                            -- oleauto.h:4413
    begin        
        return X.all.u.date;
    end V_DATE;

    function V_DATEREF(X: access VARIANT) return Win32.Oleauto.PDATE is 
                                                            -- oleauto.h:4414
    begin     
        return X.all.u.pdate;
    end V_DATEREF;

    function V_BSTR(X: access VARIANT) return BSTR is       -- oleauto.h:4416
    begin        
        return X.all.u.bstrVal;
    end V_BSTR;

    function V_BSTRREF(X: access VARIANT) return LPBSTR is  -- oleauto.h:4417
    begin     
        return X.all.u.pbstrVal;
    end V_BSTRREF;
  
    function V_DISPATCH(X: access VARIANT) return LPDISPATCH is
                                                            -- oleauto.h:4419
    begin    
        return X.all.u.pdispVal;
    end V_DISPATCH;

    function V_DISPATCHREF(X: access VARIANT) return a_LPDISPATCH_t is          
                                                            -- oleauto.h:4420
    begin 
        return X.all.u.ppdispVal;
    end V_DISPATCHREF;

    function V_ERROR(X: access VARIANT) return Win32.Objbase.SCODE is   
                                                            -- oleauto.h:4422
    begin       
        return X.all.u.scode;
    end  V_ERROR;

    function V_ERRORREF(X: access VARIANT) return Win32.Objbase.PSCODE is               
                                                            -- oleauto.h:4423
    begin    
        return X.all.u.pscode;
    end V_ERRORREF;

    function V_BOOL(X: access VARIANT) return VARIANT_BOOL is   
                                                            -- oleauto.h:4425
    begin        
        return X.all.u.bool;
    end V_BOOL;

    function V_BOOLREF(X: access VARIANT) return PVARIANT_BOOL is
                                                            -- oleauto.h:4426
    begin     
        return X.all.u.pbool;
    end V_BOOLREF;

    function V_UNKNOWN(X: access VARIANT) return Win32.Objbase.LPUNKNOWN is     
                                                            -- oleauto.h:4428
    begin     
        return X.all.u.punkVal;
    end V_UNKNOWN;

    function V_UNKNOWNREF(X: access VARIANT) return a_a_IUnknown is          
							    -- oleauto.h:4429
    begin  
        return X.all.u.ppunkVal;
    end V_UNKNOWNREF;

    function V_VARIANTREF(X: access VARIANT) return  LPVARIANT is            
							    -- oleauto.h:4432
    begin  
        return X.all.u.pvarVal;
    end V_VARIANTREF;

    function V_ARRAY(X: access VARIANT) return LPSAFEARRAY is
                                                            -- oleauto.h:4448
    begin       
        return X.all.u.parray;
    end V_ARRAY;

    function V_ARRAYREF(X: access VARIANT) return PLPSAFEARRAY is             
                                                            -- oleauto.h:4449
    begin    
        return X.all.u.pparray;
    end V_ARRAYREF;

    function V_BYREF(X: access VARIANT) return Win32.PVOID is
                                                            -- oleauto.h:4451
    begin       
        return X.all.u.byref;
    end V_BYREF;

end Win32.Oleauto;


