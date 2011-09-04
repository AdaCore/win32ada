-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (C) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (C) 2000-2011, AdaCore
--
-------------------------------------------------------------------------------

with Win32.Objbase;
with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Winnt;

package Win32.Oleauto is

   STDOLE_MAJORVERNUM       : constant := 16#1#;
   STDOLE_MINORVERNUM       : constant := 16#0#;
   STDOLE_LCID              : constant := 16#0#;
   FADF_AUTO                : constant := 16#1#;
   FADF_STATIC              : constant := 16#2#;
   FADF_EMBEDDED            : constant := 16#4#;
   FADF_FIXEDSIZE           : constant := 16#10#;
   FADF_BSTR                : constant := 16#100#;
   FADF_UNKNOWN             : constant := 16#200#;
   FADF_DISPATCH            : constant := 16#400#;
   FADF_VARIANT             : constant := 16#800#;
   FADF_RESERVED            : constant := 16#f0e8#;
   VT_VECTOR                : constant := 16#1000#;
   VT_ARRAY                 : constant := 16#2000#;
   VT_BYREF                 : constant := 16#4000#;
   VT_RESERVED              : constant := 16#8000#;
   IMPLTYPEFLAG_FDEFAULT    : constant := 16#1#;
   IMPLTYPEFLAG_FSOURCE     : constant := 16#2#;
   IMPLTYPEFLAG_FRESTRICTED : constant := 16#4#;
   DISPID_UNKNOWN           : constant := -1;
   DISPID_VALUE             : constant := 0;
   DISPID_PROPERTYPUT       : constant := -3;
   DISPID_NEWENUM           : constant := -4;
   DISPID_EVALUATE          : constant := -5;
   DISPID_CONSTRUCTOR       : constant := -6;
   DISPID_DESTRUCTOR        : constant := -7;
   VARIANT_NOVALUEPROP      : constant := 1;
   VAR_TIMEVALUEONLY        : constant := 16#1#;
   VAR_DATEVALUEONLY        : constant := 16#2#;
   MEMBERID_NIL             : constant := -1;
   ID_DEFAULTINST           : constant := -2;
   IDLFLAG_NONE             : constant := 0;
   IDLFLAG_FIN              : constant := 16#1#;
   IDLFLAG_FOUT             : constant := 16#2#;
   IDLFLAG_FLCID            : constant := 16#4#;
   IDLFLAG_FRETVAL          : constant := 16#8#;
   DISPATCH_METHOD          : constant := 16#1#;
   DISPATCH_PROPERTYGET     : constant := 16#2#;
   DISPATCH_PROPERTYPUT     : constant := 16#4#;
   DISPATCH_PROPERTYPUTREF  : constant := 16#8#;
   ACTIVEOBJECT_STRONG      : constant := 16#0#;
   ACTIVEOBJECT_WEAK        : constant := 16#1#;

   type DATE is new Win32.DOUBLE;
   type PDATE is access all DATE;
   type VARIANT_BOOL is new Win32.SHORT;
   type PVARIANT_BOOL is access all VARIANT_BOOL;

   type VARENUM is (
      VT_EMPTY,
      VT_NULL,
      VT_I2,
      VT_I4,
      VT_R4,
      VT_R8,
      VT_CY,
      VT_DATE,
      VT_BSTR,
      VT_DISPATCH,
      VT_ERROR,
      VT_BOOL,
      VT_VARIANT,
      VT_UNKNOWN,
      VT_I1,
      VT_UI1,
      VT_UI2,
      VT_UI4,
      VT_I8,
      VT_UI8,
      VT_INT,
      VT_UINT,
      VT_VOID,
      VT_HRESULT,
      VT_PTR,
      VT_SAFEARRAY,
      VT_CARRAY,
      VT_USERDEFINED,
      VT_LPSTR,
      VT_LPWSTR,
      VT_FILETIME,
      VT_BLOB,
      VT_STREAM,
      VT_STORAGE,
      VT_STREAMED_OBJECT,
      VT_STORED_OBJECT,
      VT_BLOB_OBJECT,
      VT_CF,
      VT_CLSID);
   for VARENUM use
     (VT_EMPTY           => 0,
      VT_NULL            => 1,
      VT_I2              => 2,
      VT_I4              => 3,
      VT_R4              => 4,
      VT_R8              => 5,
      VT_CY              => 6,
      VT_DATE            => 7,
      VT_BSTR            => 8,
      VT_DISPATCH        => 9,
      VT_ERROR           => 10,
      VT_BOOL            => 11,
      VT_VARIANT         => 12,
      VT_UNKNOWN         => 13,
      VT_I1              => 16,
      VT_UI1             => 17,
      VT_UI2             => 18,
      VT_UI4             => 19,
      VT_I8              => 20,
      VT_UI8             => 21,
      VT_INT             => 22,
      VT_UINT            => 23,
      VT_VOID            => 24,
      VT_HRESULT         => 25,
      VT_PTR             => 26,
      VT_SAFEARRAY       => 27,
      VT_CARRAY          => 28,
      VT_USERDEFINED     => 29,
      VT_LPSTR           => 30,
      VT_LPWSTR          => 31,
      VT_FILETIME        => 64,
      VT_BLOB            => 65,
      VT_STREAM          => 66,
      VT_STORAGE         => 67,
      VT_STREAMED_OBJECT => 68,
      VT_STORED_OBJECT   => 69,
      VT_BLOB_OBJECT     => 70,
      VT_CF              => 71,
      VT_CLSID           => 72);
   for VARENUM'Size use 32;

   type VARTYPE is new Win32.USHORT;
   type DISPID is new Win32.LONG;
   type MEMBERID is new Win32.LONG;
   type HREFTYPE is new Win32.DWORD;
   type PROPID is new Win32.ULONG;

   type TYPEKIND is (
      TKIND_ENUM,
      TKIND_RECORD,
      TKIND_MODULE,
      TKIND_INTERFACE,
      TKIND_DISPATCH,
      TKIND_COCLASS,
      TKIND_ALIAS,
      TKIND_UNION,
      TKIND_MAX);
   for TYPEKIND'Size use 32;

   type PTYPEKIND is access TYPEKIND;

   type CALLCONV is (
      CC_FASTCALL,
      CC_CDECL,
      CC_PASCAL,
      CC_MACPASCAL,
      CC_STDCALL,
      CC_FPFASTCALL,
      CC_SYSCALL,
      CC_MPWCDECL,
      CC_MPWPASCAL,
      CC_MAX);
   for CALLCONV use
     (CC_FASTCALL   => 0,
      CC_CDECL      => 1,
      CC_PASCAL     => 2,
      CC_MACPASCAL  => 3,
      CC_STDCALL    => 4,
      CC_FPFASTCALL => 5,
      CC_SYSCALL    => 6,
      CC_MPWCDECL   => 7,
      CC_MPWPASCAL  => 8,
      CC_MAX        => 9);
   for CALLCONV'Size use 32;

   type PCALLCONV is access CALLCONV;

   type FUNCKIND is (
      FUNC_VIRTUAL,
      FUNC_PUREVIRTUAL,
      FUNC_NONVIRTUAL,
      FUNC_STATIC,
      FUNC_DISPATCH);
   for FUNCKIND'Size use 32;

   type PFUNCKIND is access FUNCKIND;

   type INVOKEKIND is (
      INVOKE_FUNC,
      INVOKE_PROPERTYGET,
      INVOKE_PROPERTYPUT,
      INVOKE_PROPERTYPUTREF);
   for INVOKEKIND use
     (INVOKE_FUNC           => 1,
      INVOKE_PROPERTYGET    => 2,
      INVOKE_PROPERTYPUT    => 4,
      INVOKE_PROPERTYPUTREF => 8);
   for INVOKEKIND'Size use 32;

   type PINVOKEKIND is access INVOKEKIND;

   type VARKIND is (VAR_PERINSTANCE, VAR_STATIC, VAR_CONST, VAR_DISPATCH);
   for VARKIND'Size use 32;

   type PVARKIND is access VARKIND;

   type TYPEFLAGS is (
      TYPEFLAG_FAPPOBJECT,
      TYPEFLAG_FCANCREATE,
      TYPEFLAG_FLICENSED,
      TYPEFLAG_FPREDECLID,
      TYPEFLAG_FHIDDEN,
      TYPEFLAG_FCONTROL,
      TYPEFLAG_FDUAL,
      TYPEFLAG_FNONEXTENSIBLE,
      TYPEFLAG_FOLEAUTOMATION);
   for TYPEFLAGS use
     (TYPEFLAG_FAPPOBJECT     => 1,
      TYPEFLAG_FCANCREATE     => 2,
      TYPEFLAG_FLICENSED      => 4,
      TYPEFLAG_FPREDECLID     => 8,
      TYPEFLAG_FHIDDEN        => 16,
      TYPEFLAG_FCONTROL       => 32,
      TYPEFLAG_FDUAL          => 64,
      TYPEFLAG_FNONEXTENSIBLE => 128,
      TYPEFLAG_FOLEAUTOMATION => 256);
   for TYPEFLAGS'Size use 32;

   type FUNCFLAGS is (
      FUNCFLAG_FRESTRICTED,
      FUNCFLAG_FSOURCE,
      FUNCFLAG_FBINDABLE,
      FUNCFLAG_FREQUESTEDIT,
      FUNCFLAG_FDISPLAYBIND,
      FUNCFLAG_FDEFAULTBIND,
      FUNCFLAG_FHIDDEN);
   for FUNCFLAGS use
     (FUNCFLAG_FRESTRICTED  => 1,
      FUNCFLAG_FSOURCE      => 2,
      FUNCFLAG_FBINDABLE    => 4,
      FUNCFLAG_FREQUESTEDIT => 8,
      FUNCFLAG_FDISPLAYBIND => 16,
      FUNCFLAG_FDEFAULTBIND => 32,
      FUNCFLAG_FHIDDEN      => 64);
   for FUNCFLAGS'Size use 32;

   type VARFLAGS is (
      VARFLAG_FREADONLY,
      VARFLAG_FSOURCE,
      VARFLAG_FBINDABLE,
      VARFLAG_FREQUESTEDIT,
      VARFLAG_FDISPLAYBIND,
      VARFLAG_FDEFAULTBIND,
      VARFLAG_FHIDDEN);
   for VARFLAGS use
     (VARFLAG_FREADONLY    => 1,
      VARFLAG_FSOURCE      => 2,
      VARFLAG_FBINDABLE    => 4,
      VARFLAG_FREQUESTEDIT => 8,
      VARFLAG_FDISPLAYBIND => 16,
      VARFLAG_FDEFAULTBIND => 32,
      VARFLAG_FHIDDEN      => 64);
   for VARFLAGS'Size use 32;

   type DESCKIND is (
      DESCKIND_NONE,
      DESCKIND_FUNCDESC,
      DESCKIND_VARDESC,
      DESCKIND_TYPECOMP,
      DESCKIND_IMPLICITAPPOBJ,
      DESCKIND_MAX);
   for DESCKIND'Size use 32;

   type PDESCKIND is access DESCKIND;

   type SYSKIND is (SYS_WIN16, SYS_WIN32, SYS_MAC);
   for SYSKIND'Size use 32;

   type PSYSKIND is access SYSKIND;

   type LIBFLAGS is (LIBFLAG_FRESTRICTED, LIBFLAG_FCONTROL, LIBFLAG_FHIDDEN);
   for LIBFLAGS use
     (LIBFLAG_FRESTRICTED => 1,
      LIBFLAG_FCONTROL    => 2,
      LIBFLAG_FHIDDEN     => 4);
   for LIBFLAGS'Size use 32;

   type BSTR is access all Win32.Objbase.OLECHAR;
   type LPBSTR is access all BSTR;

   type ICreateTypeInfo;
   type ICreateTypeLib;
   type IDispatch;
   type IEnumVARIANT;
   type ITypeComp;
   type ITypeInfo;
   type ITypeLib;
   type IErrorInfo;
   type ICreateErrorInfo;
   type ISupportErrorInfo;
   type XBSTR;
   type BLOB;
   type CLIPDATA;
   type SAFEARRAYBOUND;
   type SAFEARRAY;
   type CY;
   type union_anonymous4_t;
   type union_anonymous5_t;
   type IDLDESC;
   type DISPPARAMS;
   type RemEXCEPINFO;
   type EXCEPINFO;
   type union_anonymous6_t;
   type ICreateTypeInfoVtbl;
   type ICreateTypeLibVtbl;
   type IDispatchVtbl;
   type IEnumVARIANTVtbl;
   type BINDPTR;
   type ITypeCompVtbl;
   type ITypeInfoVtbl;
   type TLIBATTR;
   type ITypeLibVtbl;
   type IErrorInfoVtbl;
   type ICreateErrorInfoVtbl;
   type ISupportErrorInfoVtbl;
   type PARAMDATA;
   type METHODDATA;
   type INTERFACEDATA;
   type VARIANT;
   type TYPEDESC;
   type ELEMDESC;
   type TYPEATTR;
   type FUNCDESC;
   type VARDESC;
   type ARRAYDESC;

   type LPBLOB is access all BLOB;
   type LPSAFEARRAYBOUND is access all SAFEARRAYBOUND;
   type a_TYPEDESC_T is access all TYPEDESC;
   type a_ARRAYDESC_T is access all ARRAYDESC;
   type LPSAFEARRAY is access all SAFEARRAY;
   type PCY is access all CY;
   type PLPSAFEARRAY is access all LPSAFEARRAY;
   type LPVARIANT is access all VARIANT;
   subtype LPVARIANTARG is LPVARIANT;
   type LPIDLDESC is access all IDLDESC;
   type LPELEMDESC is access all ELEMDESC;
   type LPTYPEATTR is access all TYPEATTR;
   type LPEXCEPINFO is access all EXCEPINFO;
   type LPFUNCDESC is access all FUNCDESC;
   type LPVARDESC is access all VARDESC;
   type LPCREATETYPEINFO is access all ICreateTypeInfo;
   type a_ICreateTypeInfoVtbl_t is access all ICreateTypeInfoVtbl;
   type LPCREATETYPELIB is access all ICreateTypeLib;
   type a_ICreateTypeLibVtbl_t is access all ICreateTypeLibVtbl;
   type LPDISPATCH is access all IDispatch;
   type a_LPDISPATCH_t is access all LPDISPATCH;
   type a_IDispatchVtbl_t is access all IDispatchVtbl;
   type LPENUMVARIANT is access all IEnumVARIANT;
   type a_IEnumVARIANTVtbl_t is access all IEnumVARIANTVtbl;
   type LPTYPECOMP is access all ITypeComp;
   type LPBINDPTR is access all BINDPTR;
   type a_ITypeCompVtbl_t is access all ITypeCompVtbl;
   type LPTYPEINFO is access all ITypeInfo;
   type a_ITypeInfoVtbl_t is access all ITypeInfoVtbl;
   type LPTYPELIB is access all ITypeLib;
   type LPTLIBATTR is access all TLIBATTR;
   type a_ITypeLibVtbl_t is access all ITypeLibVtbl;
   type LPERRORINFO is access all IErrorInfo;
   type a_IErrorInfoVtbl_t is access all IErrorInfoVtbl;
   type LPCREATEERRORINFO is access all ICreateErrorInfo;
   type a_ICreateErrorInfoVtbl_t is access all ICreateErrorInfoVtbl;
   type LPSUPPORTERRORINFO is access all ISupportErrorInfo;
   type a_ISupportErrorInfoVtbl_t is access all ISupportErrorInfoVtbl;
   type LPPARAMDATA is access all PARAMDATA;
   type LPMETHODDATA is access all METHODDATA;
   type LPINTERFACEDATA is access all INTERFACEDATA;

   type af_809_pfnDeferredFillIn is access function
     (p1   : access EXCEPINFO)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_809_pfnDeferredFillIn);

   type af_1088_QueryInterface is access function
     (This      : access ICreateTypeInfo;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1088_QueryInterface);

   type af_1093_AddRef is access function
     (This : access ICreateTypeInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1093_AddRef);

   type af_1096_Release is access function
     (This : access ICreateTypeInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1096_Release);

   type af_1099_SetGuid is access function
     (This : access ICreateTypeInfo;
      guid : access Win32.Rpcdce.GUID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1099_SetGuid);

   type af_1103_SetTypeFlags is access function
     (This       : access ICreateTypeInfo;
      uTypeFlags : Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1103_SetTypeFlags);

   type af_1107_SetDocString is access function
     (This     : access ICreateTypeInfo;
      lpstrDoc : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1107_SetDocString);

   type af_1111_SetHelpContext is access function
     (This          : access ICreateTypeInfo;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1111_SetHelpContext);

   type af_1115_SetVersion is access function
     (This         : access ICreateTypeInfo;
      wMajorVerNum : Win32.WORD;
      wMinorVerNum : Win32.WORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1115_SetVersion);

   type af_1120_AddRefTypeInfo is access function
     (This      : access ICreateTypeInfo;
      ptinfo    : access ITypeInfo;
      phreftype : access HREFTYPE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1120_AddRefTypeInfo);

   type af_1125_AddFuncDesc is access function
     (This      : access ICreateTypeInfo;
      index     : Win32.UINT;
      pfuncdesc : access FUNCDESC)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1125_AddFuncDesc);

   type af_1130_AddImplType is access function
     (This     : access ICreateTypeInfo;
      index    : Win32.UINT;
      hreftype : Win32.Oleauto.HREFTYPE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1130_AddImplType);

   type af_1135_SetImplTypeFlags is access function
     (This          : access ICreateTypeInfo;
      index         : Win32.UINT;
      impltypeflags : Win32.INT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1135_SetImplTypeFlags);

   type af_1140_SetAlignment is access function
     (This        : access ICreateTypeInfo;
      cbAlignment : Win32.WORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1140_SetAlignment);

   type af_1144_SetSchema is access function
     (This        : access ICreateTypeInfo;
      lpstrSchema : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1144_SetSchema);

   type af_1148_AddVarDesc is access function
     (This     : access ICreateTypeInfo;
      index    : Win32.UINT;
      pvardesc : access VARDESC)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1148_AddVarDesc);

   type af_1153_SetFuncAndParamNames is access function
     (This      : access ICreateTypeInfo;
      index     : Win32.UINT;
      rgszNames : access Win32.Objbase.LPOLESTR;
      cNames    : Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1153_SetFuncAndParamNames);

   type af_1159_SetVarName is access function
     (This   : access ICreateTypeInfo;
      index  : Win32.UINT;
      szName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1159_SetVarName);

   type af_1164_SetTypeDescAlias is access function
     (This        : access ICreateTypeInfo;
      ptdescAlias : access TYPEDESC)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1164_SetTypeDescAlias);

   type af_1168_DefineFuncAsDllEntry is access function
     (This       : access ICreateTypeInfo;
      index      : Win32.UINT;
      szDllName  : Win32.Objbase.LPOLESTR;
      szProcName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1168_DefineFuncAsDllEntry);

   type af_1174_SetFuncDocString is access function
     (This        : access ICreateTypeInfo;
      index       : Win32.UINT;
      szDocString : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1174_SetFuncDocString);

   type af_1179_SetVarDocString is access function
     (This        : access ICreateTypeInfo;
      index       : Win32.UINT;
      szDocString : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1179_SetVarDocString);

   type af_1184_SetFuncHelpContext is access function
     (This          : access ICreateTypeInfo;
      index         : Win32.UINT;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1184_SetFuncHelpContext);

   type af_1189_SetVarHelpContext is access function
     (This          : access ICreateTypeInfo;
      index         : Win32.UINT;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1189_SetVarHelpContext);

   type af_1194_SetMops is access function
     (This     : access ICreateTypeInfo;
      index    : Win32.UINT;
      bstrMops : BSTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1194_SetMops);

   type af_1199_SetTypeIdldesc is access function
     (This     : access ICreateTypeInfo;
      pidldesc : access IDLDESC)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1199_SetTypeIdldesc);

   type af_1203_LayOut is access function
     (This : access ICreateTypeInfo)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1203_LayOut);

   type af_1660_QueryInterface is access function
     (This      : access ICreateTypeLib;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1660_QueryInterface);

   type af_1665_AddRef is access function
     (This : access ICreateTypeLib)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1665_AddRef);

   type af_1668_Release is access function
     (This : access ICreateTypeLib)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1668_Release);

   type af_1671_CreateTypeInfo is access function
     (This        : access ICreateTypeLib;
      szName      : Win32.Objbase.LPOLESTR;
      tkind       : TYPEKIND;
      lplpictinfo : access LPCREATETYPEINFO)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1671_CreateTypeInfo);

   type af_1677_SetName is access function
     (This   : access ICreateTypeLib;
      szName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1677_SetName);

   type af_1681_SetVersion is access function
     (This         : access ICreateTypeLib;
      wMajorVerNum : Win32.WORD;
      wMinorVerNum : Win32.WORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1681_SetVersion);

   type af_1686_SetGuid is access function
     (This : access ICreateTypeLib;
      guid : access Win32.Rpcdce.GUID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1686_SetGuid);

   type af_1690_SetDocString is access function
     (This  : access ICreateTypeLib;
      szDoc : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1690_SetDocString);

   type af_1694_SetHelpFileName is access function
     (This           : access ICreateTypeLib;
      szHelpFileName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1694_SetHelpFileName);

   type af_1698_SetHelpContext is access function
     (This          : access ICreateTypeLib;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1698_SetHelpContext);

   type af_1702_SetLcid is access function
     (This : access ICreateTypeLib;
      lcid : Win32.Winnt.LCID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1702_SetLcid);

   type af_1706_SetLibFlags is access function
     (This      : access ICreateTypeLib;
      uLibFlags : Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1706_SetLibFlags);

   type af_1710_SaveAllChanges is access function
     (This : access ICreateTypeLib)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1710_SaveAllChanges);

   type af_1981_QueryInterface is access function
     (This      : access IDispatch;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1981_QueryInterface);

   type af_1986_AddRef is access function
     (This : access IDispatch)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1986_AddRef);

   type af_1989_Release is access function
     (This : access IDispatch)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1989_Release);

   type af_1992_GetTypeInfoCount is access function
     (This    : access IDispatch;
      pctinfo : access Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1992_GetTypeInfoCount);

   type af_1996_GetTypeInfo is access function
     (This    : access IDispatch;
      itinfo  : Win32.UINT;
      lcid    : Win32.Winnt.LCID;
      pptinfo : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1996_GetTypeInfo);

   type af_2002_GetIDsOfNames is access function
     (This      : access IDispatch;
      riid      : access Win32.Objbase.IID;
      rgszNames : access Win32.Objbase.LPOLESTR;
      cNames    : Win32.UINT;
      lcid      : Win32.Winnt.LCID;
      rgdispid  : access DISPID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2002_GetIDsOfNames);

   type af_2010_Invoke is access function
     (This         : access IDispatch;
      dispidMember : DISPID;
      riid         : access Win32.Objbase.IID;
      lcid         : Win32.Winnt.LCID;
      wFlags       : Win32.WORD;
      pdispparams  : access DISPPARAMS;
      pvarResult   : access VARIANT;
      pexcepinfo   : access EXCEPINFO;
      puArgErr     : access Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2010_Invoke);

   type af_2169_QueryInterface is access function
     (This      : access IEnumVARIANT;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2169_QueryInterface);

   type af_2174_AddRef is access function
     (This : access IEnumVARIANT)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2174_AddRef);

   type af_2177_Release is access function
     (This : access IEnumVARIANT)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2177_Release);

   type af_2180_Next is access function
     (This         : access IEnumVARIANT;
      celt         : Win32.ULONG;
      rgvar        : access VARIANT;
      pceltFetched : access Win32.ULONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2180_Next);

   type af_2186_Skip is access function
     (This : access IEnumVARIANT;
      celt : Win32.ULONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2186_Skip);

   type af_2190_Reset is access function
     (This : access IEnumVARIANT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2190_Reset);

   type af_2193_Clone is access function
     (This   : access IEnumVARIANT;
      ppenum : access LPENUMVARIANT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2193_Clone);

   type af_2363_QueryInterface is access function
     (This      : access ITypeComp;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2363_QueryInterface);

   type af_2368_AddRef is access function
     (This : access ITypeComp)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2368_AddRef);

   type af_2371_Release is access function
     (This : access ITypeComp)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2371_Release);

   type af_2374_Bind is access function
     (This      : access ITypeComp;
      szName    : Win32.Objbase.LPOLESTR;
      lHashVal  : Win32.ULONG;
      fFlags    : Win32.WORD;
      pptinfo   : access LPTYPEINFO;
      pdesckind : access DESCKIND;
      pbindptr  : access BINDPTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2374_Bind);

   type af_2383_BindType is access function
     (This     : access ITypeComp;
      szName   : Win32.Objbase.LPOLESTR;
      lHashVal : Win32.ULONG;
      pptinfo  : access LPTYPEINFO;
      pptcomp  : access LPTYPECOMP)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2383_BindType);

   type af_2577_QueryInterface is access function
     (This      : access ITypeInfo;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2577_QueryInterface);

   type af_2582_AddRef is access function
     (This : access ITypeInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2582_AddRef);

   type af_2585_Release is access function
     (This : access ITypeInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2585_Release);

   type af_2588_GetTypeAttr is access function
     (This       : access ITypeInfo;
      pptypeattr : access LPTYPEATTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2588_GetTypeAttr);

   type af_2592_GetTypeComp is access function
     (This    : access ITypeInfo;
      pptcomp : access LPTYPECOMP)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2592_GetTypeComp);

   type af_2596_GetFuncDesc is access function
     (This        : access ITypeInfo;
      index       : Win32.UINT;
      pppfuncdesc : access LPFUNCDESC)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2596_GetFuncDesc);

   type af_2601_GetVarDesc is access function
     (This      : access ITypeInfo;
      index     : Win32.UINT;
      ppvardesc : access LPVARDESC)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2601_GetVarDesc);

   type af_2606_GetNames is access function
     (This        : access ITypeInfo;
      memid       : MEMBERID;
      rgbstrNames : access BSTR;
      cMaxNames   : Win32.UINT;
      pcNames     : access Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2606_GetNames);

   type af_2613_GetRefTypeOfImplType is access function
     (This      : access ITypeInfo;
      index     : Win32.UINT;
      hpreftype : access HREFTYPE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2613_GetRefTypeOfImplType);

   type af_2618_GetImplTypeFlags is access function
     (This           : access ITypeInfo;
      index          : Win32.UINT;
      pimpltypeflags : access Win32.INT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2618_GetImplTypeFlags);

   type af_2623_GetIDsOfNames is access function
     (This        : access ITypeInfo;
      rglpszNames : access Win32.PWSTR;
      cNames      : Win32.UINT;
      rgmemid     : access MEMBERID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2623_GetIDsOfNames);

   type af_2629_Invoke is access function
     (This        : access ITypeInfo;
      pvInstance  : Win32.PVOID;
      memid       : MEMBERID;
      wFlags      : Win32.WORD;
      pdispparams : access DISPPARAMS;
      pvarResult  : access VARIANT;
      pexcepinfo  : access EXCEPINFO;
      puArgErr    : access Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2629_Invoke);

   type af_2639_GetDocumentation is access function
     (This           : access ITypeInfo;
      memid          : MEMBERID;
      pbstrName      : access BSTR;
      pbstrDocString : access BSTR;
      pdwHelpContext : access Win32.DWORD;
      pbstrHelpFile  : access BSTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2639_GetDocumentation);

   type af_2647_GetDllEntry is access function
     (This         : access ITypeInfo;
      memid        : MEMBERID;
      invkind      : INVOKEKIND;
      pbstrDllName : access BSTR;
      pbstrName    : access BSTR;
      pwOrdinal    : access Win32.WORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2647_GetDllEntry);

   type af_2655_GetRefTypeInfo is access function
     (This     : access ITypeInfo;
      hreftype : Win32.Oleauto.HREFTYPE;
      pptinfo  : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2655_GetRefTypeInfo);

   type af_2660_AddressOfMember is access function
     (This    : access ITypeInfo;
      memid   : MEMBERID;
      invkind : INVOKEKIND;
      ppv     : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2660_AddressOfMember);

   type af_2666_CreateInstance is access function
     (This      : access ITypeInfo;
      puncOuter : access Win32.Objbase.IUnknown;
      riid      : access Win32.Objbase.IID;
      ppvObj    : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2666_CreateInstance);

   type af_2672_GetMops is access function
     (This      : access ITypeInfo;
      memid     : MEMBERID;
      pbstrMops : access BSTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2672_GetMops);

   type af_2677_GetContainingTypeLib is access function
     (This   : access ITypeInfo;
      pptlib : access LPTYPELIB;
      pindex : access Win32.UINT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2677_GetContainingTypeLib);

   type ap_2682_ReleaseTypeAttr is access procedure
     (This      : access ITypeInfo;
      ptypeattr : access TYPEATTR);
   pragma Convention (Stdcall, ap_2682_ReleaseTypeAttr);

   type ap_2686_ReleaseFuncDesc is access procedure
     (This      : access ITypeInfo;
      pfuncdesc : access FUNCDESC);
   pragma Convention (Stdcall, ap_2686_ReleaseFuncDesc);

   type ap_2690_ReleaseVarDesc is access procedure
     (This     : access ITypeInfo;
      pvardesc : access VARDESC);
   pragma Convention (Stdcall, ap_2690_ReleaseVarDesc);

   type af_3144_QueryInterface is access function
     (This      : access ITypeLib;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3144_QueryInterface);

   type af_3149_AddRef is access function
     (This : access ITypeLib)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3149_AddRef);

   type af_3152_Release is access function
     (This : access ITypeLib)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3152_Release);

   type af_3155_GetTypeInfoCount is access function
     (This : access ITypeLib)
      return Win32.UINT;
   pragma Convention (Stdcall, af_3155_GetTypeInfoCount);

   type af_3158_GetTypeInfo is access function
     (This     : access ITypeLib;
      index    : Win32.UINT;
      ppitinfo : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3158_GetTypeInfo);

   type af_3163_GetTypeInfoType is access function
     (This   : access ITypeLib;
      index  : Win32.UINT;
      ptkind : access TYPEKIND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3163_GetTypeInfoType);

   type af_3168_GetTypeInfoOfGuid is access function
     (This    : access ITypeLib;
      guid    : access Win32.Rpcdce.GUID;
      pptinfo : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3168_GetTypeInfoOfGuid);

   type af_3173_GetLibAttr is access function
     (This       : access ITypeLib;
      pptlibattr : access LPTLIBATTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3173_GetLibAttr);

   type af_3177_GetTypeComp is access function
     (This    : access ITypeLib;
      pptcomp : access LPTYPECOMP)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3177_GetTypeComp);

   type af_3181_GetDocumentation is access function
     (This           : access ITypeLib;
      index          : Win32.INT;
      pbstrName      : access BSTR;
      pbstrDocString : access BSTR;
      pdwHelpContext : access Win32.DWORD;
      pbstrHelpFile  : access BSTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3181_GetDocumentation);

   type af_3189_IsName is access function
     (This      : access ITypeLib;
      szNameBuf : Win32.Objbase.LPOLESTR;
      lHashVal  : Win32.ULONG;
      pfName    : access Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3189_IsName);

   type af_3195_FindName is access function
     (This      : access ITypeLib;
      szNameBuf : Win32.Objbase.LPOLESTR;
      lHashVal  : Win32.ULONG;
      rgptinfo  : access LPTYPEINFO;
      rgmemid   : access MEMBERID;
      pcFound   : access Win32.USHORT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3195_FindName);

   type ap_3203_ReleaseTLibAttr is access procedure
     (This      : access ITypeLib;
      ptlibattr : access TLIBATTR);
   pragma Convention (Stdcall, ap_3203_ReleaseTLibAttr);

   type af_3446_QueryInterface is access function
     (This      : access IErrorInfo;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3446_QueryInterface);

   type af_3451_AddRef is access function
     (This : access IErrorInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3451_AddRef);

   type af_3454_Release is access function
     (This : access IErrorInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3454_Release);

   type af_3457_GetGUID is access function
     (This  : access IErrorInfo;
      pguid : access Win32.Rpcdce.GUID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3457_GetGUID);

   type af_3461_GetSource is access function
     (This        : access IErrorInfo;
      pbstrSource : access BSTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3461_GetSource);

   type af_3465_GetDescription is access function
     (This             : access IErrorInfo;
      pbstrDescription : access BSTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3465_GetDescription);

   type af_3469_GetHelpFile is access function
     (This          : access IErrorInfo;
      pbstrHelpFile : access BSTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3469_GetHelpFile);

   type af_3473_GetHelpContext is access function
     (This           : access IErrorInfo;
      pdwHelpContext : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3473_GetHelpContext);

   type af_3629_QueryInterface is access function
     (This      : access ICreateErrorInfo;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3629_QueryInterface);

   type af_3634_AddRef is access function
     (This : access ICreateErrorInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3634_AddRef);

   type af_3637_Release is access function
     (This : access ICreateErrorInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3637_Release);

   type af_3640_SetGUID is access function
     (This  : access ICreateErrorInfo;
      rguid : access Win32.Rpcdce.GUID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3640_SetGUID);

   type af_3644_SetSource is access function
     (This     : access ICreateErrorInfo;
      szSource : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3644_SetSource);

   type af_3648_SetDescription is access function
     (This          : access ICreateErrorInfo;
      szDescription : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3648_SetDescription);

   type af_3652_SetHelpFile is access function
     (This       : access ICreateErrorInfo;
      szHelpFile : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3652_SetHelpFile);

   type af_3656_SetHelpContext is access function
     (This          : access ICreateErrorInfo;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3656_SetHelpContext);

   type af_3800_QueryInterface is access function
     (This      : access ISupportErrorInfo;
      riid      : access Win32.Objbase.IID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3800_QueryInterface);

   type af_3805_AddRef is access function
     (This : access ISupportErrorInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3805_AddRef);

   type af_3808_Release is access function
     (This : access ISupportErrorInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3808_Release);

   type af_3811_InterfaceSupportsErrorInfo is access function
     (This : access ISupportErrorInfo;
      riid : access Win32.Objbase.IID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3811_InterfaceSupportsErrorInfo);

   type ICreateTypeInfo is record
      lpVtbl : a_ICreateTypeInfoVtbl_t;
   end record;

   type ICreateTypeLib is record
      lpVtbl : a_ICreateTypeLibVtbl_t;
   end record;

   type IDispatch is record
      lpVtbl : a_IDispatchVtbl_t;
   end record;

   type IEnumVARIANT is record
      lpVtbl : a_IEnumVARIANTVtbl_t;
   end record;

   type ITypeComp is record
      lpVtbl : a_ITypeCompVtbl_t;
   end record;

   type ITypeInfo is record
      lpVtbl : a_ITypeInfoVtbl_t;
   end record;

   type ITypeLib is record
      lpVtbl : a_ITypeLibVtbl_t;
   end record;

   type IErrorInfo is record
      lpVtbl : a_IErrorInfoVtbl_t;
   end record;

   type ICreateErrorInfo is record
      lpVtbl : a_ICreateErrorInfoVtbl_t;
   end record;

   type ISupportErrorInfo is record
      lpVtbl : a_ISupportErrorInfoVtbl_t;
   end record;

   subtype OLECHAR_Array is Win32.Objbase.OLECHAR_Array;

   type XBSTR is record
      cbSize     : Win32.ULONG;
      rgBstrData : OLECHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type BLOB is record
      cbSize    : Win32.ULONG;
      pBlobData : Win32.PBYTE;
   end record;

   type CLIPDATA is record
      cbSize    : Win32.ULONG;
      ulClipFmt : Win32.LONG;
      pClipData : Win32.PBYTE;
   end record;

   type SAFEARRAYBOUND is record
      cElements : Win32.ULONG;
      lLbound   : Win32.LONG;
   end record;

   type SAFEARRAYBOUND_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased SAFEARRAYBOUND;

   type SAFEARRAY is record
      cDims      : Win32.USHORT;
      fFeatures  : Win32.USHORT;
      cbElements : Win32.ULONG;
      cLocks     : Win32.ULONG;
      pvData     : Win32.PBYTE;
      rgsabound  : SAFEARRAYBOUND_Array;
   end record;

   type CY is record
      Lo : Win32.ULONG;
      Hi : Win32.LONG;
   end record;

   subtype CURRENCY is CY;

   type union_anonymous4_t_kind is (
      bVal_kind,
      iVal_kind,
      lVal_kind,
      fltVal_kind,
      dblVal_kind,
      bool_kind,
      scode_kind,
      cyVal_kind,
      date_kind,
      bstrVal_kind,
      punkVal_kind,
      pdispVal_kind,
      parray_kind,
      pbVal_kind,
      piVal_kind,
      plVal_kind,
      pfltVal_kind,
      pdblVal_kind,
      pbool_kind,
      pscode_kind,
      pcyVal_kind,
      pdate_kind,
      pbstrVal_kind,
      ppunkVal_kind,
      ppdispVal_kind,
      pparray_kind,
      pvarVal_kind,
      byref_kind);

   type a_a_IUnknown is access all Win32.Objbase.LPUNKNOWN;

   type union_anonymous4_t (Which : union_anonymous4_t_kind := cyVal_kind) is
      record
         case Which is
         when bVal_kind =>
            bVal : Win32.UCHAR;
         when iVal_kind =>
            iVal : Win32.SHORT;
         when lVal_kind =>
            lVal : Win32.LONG;
         when fltVal_kind =>
            fltVal : Win32.FLOAT;
         when dblVal_kind =>
            dblVal : Win32.DOUBLE;
         when bool_kind =>
            bool : VARIANT_BOOL;
         when scode_kind =>
            scode : Win32.Objbase.SCODE;
         when cyVal_kind =>
            cyVal : CY;
         when date_kind =>
            date : Win32.Oleauto.DATE;
         when bstrVal_kind =>
            bstrVal : BSTR;
         when punkVal_kind =>
            punkVal : Win32.Objbase.LPUNKNOWN;
         when pdispVal_kind =>
            pdispVal : LPDISPATCH;
         when parray_kind =>
            parray : LPSAFEARRAY;
         when pbVal_kind =>
            pbVal : Win32.PUCHAR;
         when piVal_kind =>
            piVal : Win32.PSHORT;
         when plVal_kind =>
            plVal : Win32.PLONG;
         when pfltVal_kind =>
            pfltVal : Win32.PFLOAT;
         when pdblVal_kind =>
            pdblVal : Win32.PDOUBLE;
         when pbool_kind =>
            pbool : PVARIANT_BOOL;
         when pscode_kind =>
            pscode : Win32.Objbase.PSCODE;
         when pcyVal_kind =>
            pcyVal : PCY;
         when pdate_kind =>
            pdate : Win32.Oleauto.PDATE;
         when pbstrVal_kind =>
            pbstrVal : LPBSTR;
         when ppunkVal_kind =>
            ppunkVal : a_a_IUnknown;
         when ppdispVal_kind =>
            ppdispVal : a_LPDISPATCH_t;
         when pparray_kind =>
            pparray : PLPSAFEARRAY;
         when pvarVal_kind =>
            pvarVal : LPVARIANT;
         when byref_kind =>
            byref : Win32.PVOID;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous4_t);

   pragma Unchecked_Union (union_anonymous4_t);

   type union_anonymous5_t_kind is (
      lptdesc_kind,
      lpadesc_kind,
      hreftype_kind);

   type union_anonymous5_t (Which : union_anonymous5_t_kind := lptdesc_kind) is
      record
         case Which is
            when lptdesc_kind =>
               lptdesc : a_TYPEDESC_T;
            when lpadesc_kind =>
               lpadesc : a_ARRAYDESC_T;
            when hreftype_kind =>
               hreftype : Win32.Oleauto.HREFTYPE;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous5_t);

   pragma Unchecked_Union (union_anonymous5_t);

   type IDLDESC is record
      dwReserved : Win32.ULONG;
      wIDLFlags  : Win32.USHORT;
   end record;

   type PDISPID is access all Win32.Oleauto.DISPID;

   type DISPPARAMS is record
      rgvarg            : LPVARIANT;
      rgdispidNamedArgs : PDISPID;
      cArgs             : Win32.UINT;
      cNamedArgs        : Win32.UINT;
   end record;

   type RemEXCEPINFO is record
      wCode         : Win32.WORD;
      wReserved     : Win32.WORD;
      dwHelpContext : Win32.DWORD;
      scode         : Win32.DWORD;
      cSource       : Win32.DWORD;
      cDescription  : Win32.DWORD;
      cHelpFile     : Win32.DWORD;
      strings       : OLECHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type EXCEPINFO is record
      wCode             : Win32.WORD;
      wReserved         : Win32.WORD;
      bstrSource        : BSTR;
      bstrDescription   : BSTR;
      bstrHelpFile      : BSTR;
      dwHelpContext     : Win32.DWORD;
      pvReserved        : Win32.PVOID;
      pfnDeferredFillIn : af_809_pfnDeferredFillIn;
      scode             : Win32.Objbase.SCODE;
   end record;

   type union_anonymous6_t_kind is (oInst_kind, lpvarValue_kind);

   type union_anonymous6_t (Which : union_anonymous6_t_kind := oInst_kind) is
      record
         case Which is
            when oInst_kind =>
               oInst : Win32.ULONG;
            when lpvarValue_kind =>
               lpvarValue : LPVARIANT;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous6_t);

   pragma Unchecked_Union (union_anonymous6_t);

   type ICreateTypeInfoVtbl is record
      QueryInterface       : af_1088_QueryInterface;
      AddRef               : af_1093_AddRef;
      Release              : af_1096_Release;
      SetGuid              : af_1099_SetGuid;
      SetTypeFlags         : af_1103_SetTypeFlags;
      SetDocString         : af_1107_SetDocString;
      SetHelpContext       : af_1111_SetHelpContext;
      SetVersion           : af_1115_SetVersion;
      AddRefTypeInfo       : af_1120_AddRefTypeInfo;
      AddFuncDesc          : af_1125_AddFuncDesc;
      AddImplType          : af_1130_AddImplType;
      SetImplTypeFlags     : af_1135_SetImplTypeFlags;
      SetAlignment         : af_1140_SetAlignment;
      SetSchema            : af_1144_SetSchema;
      AddVarDesc           : af_1148_AddVarDesc;
      SetFuncAndParamNames : af_1153_SetFuncAndParamNames;
      SetVarName           : af_1159_SetVarName;
      SetTypeDescAlias     : af_1164_SetTypeDescAlias;
      DefineFuncAsDllEntry : af_1168_DefineFuncAsDllEntry;
      SetFuncDocString     : af_1174_SetFuncDocString;
      SetVarDocString      : af_1179_SetVarDocString;
      SetFuncHelpContext   : af_1184_SetFuncHelpContext;
      SetVarHelpContext    : af_1189_SetVarHelpContext;
      SetMops              : af_1194_SetMops;
      SetTypeIdldesc       : af_1199_SetTypeIdldesc;
      LayOut               : af_1203_LayOut;
   end record;

   type ICreateTypeLibVtbl is record
      QueryInterface  : af_1660_QueryInterface;
      AddRef          : af_1665_AddRef;
      Release         : af_1668_Release;
      CreateTypeInfo  : af_1671_CreateTypeInfo;
      SetName         : af_1677_SetName;
      SetVersion      : af_1681_SetVersion;
      SetGuid         : af_1686_SetGuid;
      SetDocString    : af_1690_SetDocString;
      SetHelpFileName : af_1694_SetHelpFileName;
      SetHelpContext  : af_1698_SetHelpContext;
      SetLcid         : af_1702_SetLcid;
      SetLibFlags     : af_1706_SetLibFlags;
      SaveAllChanges  : af_1710_SaveAllChanges;
   end record;

   type IDispatchVtbl is record
      QueryInterface   : af_1981_QueryInterface;
      AddRef           : af_1986_AddRef;
      Release          : af_1989_Release;
      GetTypeInfoCount : af_1992_GetTypeInfoCount;
      GetTypeInfo      : af_1996_GetTypeInfo;
      GetIDsOfNames    : af_2002_GetIDsOfNames;
      Invoke           : af_2010_Invoke;
   end record;

   type IEnumVARIANTVtbl is record
      QueryInterface : af_2169_QueryInterface;
      AddRef         : af_2174_AddRef;
      Release        : af_2177_Release;
      Next           : af_2180_Next;
      Skip           : af_2186_Skip;
      Reset          : af_2190_Reset;
      Clone          : af_2193_Clone;
   end record;

   type BINDPTR_kind is (lpfuncdesc_kind, lpvardesc_kind, lptcomp_kind);

   type BINDPTR (Which : BINDPTR_kind := lpfuncdesc_kind) is record
      case Which is
         when lpfuncdesc_kind =>
            lpfuncdesc : Win32.Oleauto.LPFUNCDESC;
         when lpvardesc_kind =>
            lpvardesc : Win32.Oleauto.LPVARDESC;
         when lptcomp_kind =>
            lptcomp : LPTYPECOMP;
      end case;
   end record;

   pragma Convention (C_Pass_By_Copy, BINDPTR);

   pragma Unchecked_Union (BINDPTR);

   type ITypeCompVtbl is record
      QueryInterface : af_2363_QueryInterface;
      AddRef         : af_2368_AddRef;
      Release        : af_2371_Release;
      Bind           : af_2374_Bind;
      BindType       : af_2383_BindType;
   end record;

   type ITypeInfoVtbl is record
      QueryInterface       : af_2577_QueryInterface;
      AddRef               : af_2582_AddRef;
      Release              : af_2585_Release;
      GetTypeAttr          : af_2588_GetTypeAttr;
      GetTypeComp          : af_2592_GetTypeComp;
      GetFuncDesc          : af_2596_GetFuncDesc;
      GetVarDesc           : af_2601_GetVarDesc;
      GetNames             : af_2606_GetNames;
      GetRefTypeOfImplType : af_2613_GetRefTypeOfImplType;
      GetImplTypeFlags     : af_2618_GetImplTypeFlags;
      GetIDsOfNames        : af_2623_GetIDsOfNames;
      Invoke               : af_2629_Invoke;
      GetDocumentation     : af_2639_GetDocumentation;
      GetDllEntry          : af_2647_GetDllEntry;
      GetRefTypeInfo       : af_2655_GetRefTypeInfo;
      AddressOfMember      : af_2660_AddressOfMember;
      CreateInstance       : af_2666_CreateInstance;
      GetMops              : af_2672_GetMops;
      GetContainingTypeLib : af_2677_GetContainingTypeLib;
      ReleaseTypeAttr      : ap_2682_ReleaseTypeAttr;
      ReleaseFuncDesc      : ap_2686_ReleaseFuncDesc;
      ReleaseVarDesc       : ap_2690_ReleaseVarDesc;
   end record;

   type TLIBATTR is record
      guid         : Win32.Rpcdce.GUID;
      lcid         : Win32.Winnt.LCID;
      syskind      : Win32.Oleauto.SYSKIND;
      wMajorVerNum : Win32.WORD;
      wMinorVerNum : Win32.WORD;
      wLibFlags    : Win32.WORD;
   end record;

   type ITypeLibVtbl is record
      QueryInterface    : af_3144_QueryInterface;
      AddRef            : af_3149_AddRef;
      Release           : af_3152_Release;
      GetTypeInfoCount  : af_3155_GetTypeInfoCount;
      GetTypeInfo       : af_3158_GetTypeInfo;
      GetTypeInfoType   : af_3163_GetTypeInfoType;
      GetTypeInfoOfGuid : af_3168_GetTypeInfoOfGuid;
      GetLibAttr        : af_3173_GetLibAttr;
      GetTypeComp       : af_3177_GetTypeComp;
      GetDocumentation  : af_3181_GetDocumentation;
      IsName            : af_3189_IsName;
      FindName          : af_3195_FindName;
      ReleaseTLibAttr   : ap_3203_ReleaseTLibAttr;
   end record;

   type IErrorInfoVtbl is record
      QueryInterface : af_3446_QueryInterface;
      AddRef         : af_3451_AddRef;
      Release        : af_3454_Release;
      GetGUID        : af_3457_GetGUID;
      GetSource      : af_3461_GetSource;
      GetDescription : af_3465_GetDescription;
      GetHelpFile    : af_3469_GetHelpFile;
      GetHelpContext : af_3473_GetHelpContext;
   end record;

   type ICreateErrorInfoVtbl is record
      QueryInterface : af_3629_QueryInterface;
      AddRef         : af_3634_AddRef;
      Release        : af_3637_Release;
      SetGUID        : af_3640_SetGUID;
      SetSource      : af_3644_SetSource;
      SetDescription : af_3648_SetDescription;
      SetHelpFile    : af_3652_SetHelpFile;
      SetHelpContext : af_3656_SetHelpContext;
   end record;

   type ISupportErrorInfoVtbl is record
      QueryInterface             : af_3800_QueryInterface;
      AddRef                     : af_3805_AddRef;
      Release                    : af_3808_Release;
      InterfaceSupportsErrorInfo : af_3811_InterfaceSupportsErrorInfo;
   end record;

   type PARAMDATA is record
      szName : Win32.PWSTR;
      vt     : VARTYPE;
   end record;

   type METHODDATA is record
      szName   : Win32.PWSTR;
      ppdata   : LPPARAMDATA;
      dispid   : Win32.Oleauto.DISPID;
      iMeth    : Win32.UINT;
      cc       : CALLCONV;
      cArgs    : Win32.UINT;
      wFlags   : Win32.WORD;
      vtReturn : VARTYPE;
   end record;

   type INTERFACEDATA is record
      pmethdata : LPMETHODDATA;
      cMembers  : Win32.UINT;
   end record;

   type VARIANT is record
      vt         : VARTYPE;
      wReserved1 : Win32.WORD;
      wReserved2 : Win32.WORD;
      wReserved3 : Win32.WORD;
      u          : union_anonymous4_t;
   end record;

   subtype VARIANTARG is VARIANT;

   type TYPEDESC is record
      typedesc_u : union_anonymous5_t;
      vt         : VARTYPE;
   end record;

   type ELEMDESC is record
      tdesc   : TYPEDESC;
      idldesc : Win32.Oleauto.IDLDESC;
   end record;

   type TYPEATTR is record
      guid             : Win32.Rpcdce.GUID;
      lcid             : Win32.Winnt.LCID;
      dwReserved       : Win32.DWORD;
      memidConstructor : MEMBERID;
      memidDestructor  : MEMBERID;
      lpstrSchema      : Win32.Objbase.LPOLESTR;
      cbSizeInstance   : Win32.ULONG;
      typekind         : Win32.Oleauto.TYPEKIND;
      cFuncs           : Win32.WORD;
      cVars            : Win32.WORD;
      cImplTypes       : Win32.WORD;
      cbSizeVft        : Win32.WORD;
      cbAlignment      : Win32.WORD;
      wTypeFlags       : Win32.WORD;
      wMajorVerNum     : Win32.WORD;
      wMinorVerNum     : Win32.WORD;
      tdescAlias       : TYPEDESC;
      idldescType      : IDLDESC;
   end record;

   type FUNCDESC is record
      memid             : MEMBERID;
      lprgscode         : Win32.Objbase.PSCODE;
      lprgelemdescParam : LPELEMDESC;
      funckind          : Win32.Oleauto.FUNCKIND;
      invkind           : INVOKEKIND;
      callconv          : Win32.Oleauto.CALLCONV;
      cParams           : Win32.SHORT;
      cParamsOpt        : Win32.SHORT;
      oVft              : Win32.SHORT;
      cScodes           : Win32.SHORT;
      elemdescFunc      : ELEMDESC;
      wFuncFlags        : Win32.WORD;
   end record;

   type VARDESC is record
      memid       : MEMBERID;
      lpstrSchema : Win32.Objbase.LPOLESTR;
      vardesc_u   : union_anonymous6_t;
      elemdescVar : ELEMDESC;
      wVarFlags   : Win32.WORD;
      varkind     : Win32.Oleauto.VARKIND;
   end record;

   type ARRAYDESC is record
      tdescElem : TYPEDESC;
      cDims     : Win32.USHORT;
      rgbounds  : SAFEARRAYBOUND_Array;
   end record;

   RemVariant_v0_1_c_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;
   RemVariant_v0_1_s_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;
   IID_ICreateTypeInfo      : Win32.Objbase.IID;
   IID_ICreateTypeLib       : Win32.Objbase.IID;
   IID_IDispatch            : Win32.Objbase.IID;
   IID_IEnumVARIANT         : Win32.Objbase.IID;
   IID_ITypeComp            : Win32.Objbase.IID;
   IID_ITypeInfo            : Win32.Objbase.IID;
   IID_ITypeLib             : Win32.Objbase.IID;
   IID_IErrorInfo           : Win32.Objbase.IID;
   IID_ICreateErrorInfo     : Win32.Objbase.IID;
   IID_ISupportErrorInfo    : Win32.Objbase.IID;

   type PPLONG is access Win32.PLONG;

   procedure TYPEKIND_to_xmit
     (pEnum  : PTYPEKIND;
      ppLong : Win32.Oleauto.PPLONG);

   procedure TYPEKIND_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PTYPEKIND);

   procedure CALLCONV_to_xmit
     (pEnum  : PCALLCONV;
      ppLong : Win32.Oleauto.PPLONG);

   procedure CALLCONV_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PCALLCONV);

   procedure FUNCKIND_to_xmit
     (pEnum  : PFUNCKIND;
      ppLong : Win32.Oleauto.PPLONG);

   procedure FUNCKIND_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PFUNCKIND);

   procedure INVOKEKIND_to_xmit
     (pEnum  : PINVOKEKIND;
      ppLong : Win32.Oleauto.PPLONG);

   procedure INVOKEKIND_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PINVOKEKIND);

   procedure VARKIND_to_xmit
     (pEnum  : PVARKIND;
      ppLong : Win32.Oleauto.PPLONG);

   procedure VARKIND_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PVARKIND);

   procedure DESCKIND_to_xmit
     (pEnum  : PDESCKIND;
      ppLong : Win32.Oleauto.PPLONG);

   procedure DESCKIND_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PDESCKIND);

   procedure SYSKIND_to_xmit
     (pEnum  : PSYSKIND;
      ppLong : Win32.Oleauto.PPLONG);

   procedure SYSKIND_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PSYSKIND);

   function ICreateTypeInfo_SetGuid_Proxy
     (This : access ICreateTypeInfo;
      guid : access Win32.Objbase.IID)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetGuid_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetTypeFlags_Proxy
     (This       : access ICreateTypeInfo;
      uTypeFlags : Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetTypeFlags_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetDocString_Proxy
     (This     : access ICreateTypeInfo;
      lpstrDoc : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetDocString_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetHelpContext_Proxy
     (This          : access ICreateTypeInfo;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetHelpContext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetVersion_Proxy
     (This         : access ICreateTypeInfo;
      wMajorVerNum : Win32.WORD;
      wMinorVerNum : Win32.WORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetVersion_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_AddRefTypeInfo_Proxy
     (This      : access ICreateTypeInfo;
      ptinfo    : access ICreateTypeInfo;
      phreftype : access HREFTYPE)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_AddRefTypeInfo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_AddFuncDesc_Proxy
     (This      : access ICreateTypeInfo;
      index     : Win32.UINT;
      pfuncdesc : access FUNCDESC)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_AddFuncDesc_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_AddImplType_Proxy
     (This     : access ICreateTypeInfo;
      index    : Win32.UINT;
      hreftype : Win32.Oleauto.HREFTYPE)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_AddImplType_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetImplTypeFlags_Proxy
     (This          : access ICreateTypeInfo;
      index         : Win32.UINT;
      impltypeflags : Win32.INT)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetImplTypeFlags_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetAlignment_Proxy
     (This        : access ICreateTypeInfo;
      cbAlignment : Win32.WORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetAlignment_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetSchema_Proxy
     (This        : access ICreateTypeInfo;
      lpstrSchema : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetSchema_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_AddVarDesc_Proxy
     (This     : access ICreateTypeInfo;
      index    : Win32.UINT;
      pvardesc : access VARDESC)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_AddVarDesc_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetFuncAndParamNames_Proxy
     (This      : access ICreateTypeInfo;
      index     : Win32.UINT;
      rgszNames : access Win32.Objbase.LPOLESTR;
      cNames    : Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetFuncAndParamNames_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetVarName_Proxy
     (This   : access ICreateTypeInfo;
      index  : Win32.UINT;
      szName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetVarName_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetTypeDescAlias_Proxy
     (This        : access ICreateTypeInfo;
      ptdescAlias : access TYPEDESC)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetTypeDescAlias_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_DefineFuncAsDllEntry_Proxy
     (This       : access ICreateTypeInfo;
      index      : Win32.UINT;
      szDllName  : Win32.Objbase.LPOLESTR;
      szProcName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_DefineFuncAsDllEntry_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetFuncDocString_Proxy
     (This        : access ICreateTypeInfo;
      index       : Win32.UINT;
      szDocString : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetFuncDocString_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetVarDocString_Proxy
     (This        : access ICreateTypeInfo;
      index       : Win32.UINT;
      szDocString : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetVarDocString_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetFuncHelpContext_Proxy
     (This          : access ICreateTypeInfo;
      index         : Win32.UINT;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetFuncHelpContext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetVarHelpContext_Proxy
     (This          : access ICreateTypeInfo;
      index         : Win32.UINT;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetVarHelpContext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetMops_Proxy
     (This     : access ICreateTypeInfo;
      index    : Win32.UINT;
      bstrMops : BSTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetMops_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_SetTypeIdldesc_Proxy
     (This     : access ICreateTypeInfo;
      pidldesc : access IDLDESC)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_SetTypeIdldesc_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeInfo_LayOut_Proxy
     (This : access ICreateTypeInfo)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeInfo_LayOut_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_CreateTypeInfo_Proxy
     (This        : access ICreateTypeLib;
      szName      : Win32.Objbase.LPOLESTR;
      tkind       : TYPEKIND;
      lplpictinfo : access LPCREATETYPEINFO)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_CreateTypeInfo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetName_Proxy
     (This   : access ICreateTypeLib;
      szName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetName_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetVersion_Proxy
     (This         : access ICreateTypeLib;
      wMajorVerNum : Win32.WORD;
      wMinorVerNum : Win32.WORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetVersion_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetGuid_Proxy
     (This : access ICreateTypeLib;
      guid : access Win32.Objbase.IID)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetGuid_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetDocString_Proxy
     (This  : access ICreateTypeLib;
      szDoc : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetDocString_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetHelpFileName_Proxy
     (This           : access ICreateTypeLib;
      szHelpFileName : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetHelpFileName_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetHelpContext_Proxy
     (This          : access ICreateTypeLib;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetHelpContext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetLcid_Proxy
     (This : access ICreateTypeLib;
      lcid : Win32.Winnt.LCID)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetLcid_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SetLibFlags_Proxy
     (This      : access ICreateTypeLib;
      uLibFlags : Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SetLibFlags_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateTypeLib_SaveAllChanges_Proxy
     (This : access ICreateTypeLib)
      return Win32.Objbase.HRESULT;

   procedure ICreateTypeLib_SaveAllChanges_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IDispatch_GetTypeInfoCount_Proxy
     (This    : access IDispatch;
      pctinfo : access Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure IDispatch_GetTypeInfoCount_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IDispatch_GetTypeInfo_Proxy
     (This    : access IDispatch;
      itinfo  : Win32.UINT;
      lcid    : Win32.Winnt.LCID;
      pptinfo : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;

   procedure IDispatch_GetTypeInfo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IDispatch_GetIDsOfNames_Proxy
     (This      : access IDispatch;
      riid      : access Win32.Objbase.IID;
      rgszNames : access Win32.Objbase.LPOLESTR;
      cNames    : Win32.UINT;
      lcid      : Win32.Winnt.LCID;
      rgdispid  : access DISPID)
      return Win32.Objbase.HRESULT;

   procedure IDispatch_GetIDsOfNames_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IDispatch_Invoke_Proxy
     (This         : access IDispatch;
      dispidMember : DISPID;
      riid         : access Win32.Objbase.IID;
      lcid         : Win32.Winnt.LCID;
      wFlags       : Win32.WORD;
      pdispparams  : access DISPPARAMS;
      pvarResult   : access VARIANT;
      pexcepinfo   : access EXCEPINFO;
      puArgErr     : access Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure IDispatch_Invoke_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IEnumVARIANT_Next_Proxy
     (This         : access IEnumVARIANT;
      celt         : Win32.ULONG;
      rgvar        : access VARIANT;
      pceltFetched : access Win32.ULONG)
      return Win32.Objbase.HRESULT;

   procedure IEnumVARIANT_Next_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IEnumVARIANT_Skip_Proxy
     (This : access IEnumVARIANT;
      celt : Win32.ULONG)
      return Win32.Objbase.HRESULT;

   procedure IEnumVARIANT_Skip_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IEnumVARIANT_Reset_Proxy
     (This : access IEnumVARIANT)
      return Win32.Objbase.HRESULT;

   procedure IEnumVARIANT_Reset_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IEnumVARIANT_Clone_Proxy
     (This   : access IEnumVARIANT;
      ppenum : access LPENUMVARIANT)
      return Win32.Objbase.HRESULT;

   procedure IEnumVARIANT_Clone_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeComp_Bind_Proxy
     (This      : access ITypeComp;
      szName    : Win32.Objbase.LPOLESTR;
      lHashVal  : Win32.ULONG;
      fFlags    : Win32.WORD;
      pptinfo   : access LPTYPEINFO;
      pdesckind : access DESCKIND;
      pbindptr  : access BINDPTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeComp_Bind_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeComp_BindType_Proxy
     (This     : access ITypeComp;
      szName   : Win32.Objbase.LPOLESTR;
      lHashVal : Win32.ULONG;
      pptinfo  : access LPTYPEINFO;
      pptcomp  : access LPTYPECOMP)
      return Win32.Objbase.HRESULT;

   procedure ITypeComp_BindType_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetTypeAttr_Proxy
     (This       : access ITypeInfo;
      pptypeattr : access LPTYPEATTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetTypeAttr_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetTypeComp_Proxy
     (This    : access ITypeInfo;
      pptcomp : access LPTYPECOMP)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetTypeComp_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetFuncDesc_Proxy
     (This        : access ITypeInfo;
      index       : Win32.UINT;
      pppfuncdesc : access LPFUNCDESC)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetFuncDesc_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetVarDesc_Proxy
     (This      : access ITypeInfo;
      index     : Win32.UINT;
      ppvardesc : access LPVARDESC)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetVarDesc_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetNames_Proxy
     (This        : access ITypeInfo;
      memid       : MEMBERID;
      rgbstrNames : LPBSTR;
      cMaxNames   : Win32.UINT;
      pcNames     : access Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetNames_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetRefTypeOfImplType_Proxy
     (This      : access ITypeInfo;
      index     : Win32.UINT;
      hpreftype : access HREFTYPE)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetRefTypeOfImplType_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetImplTypeFlags_Proxy
     (This           : access ITypeInfo;
      index          : Win32.UINT;
      pimpltypeflags : access Win32.INT)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetImplTypeFlags_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetIDsOfNames_Proxy
     (This        : access ITypeInfo;
      rglpszNames : access Win32.Objbase.LPOLESTR;
      cNames      : Win32.UINT;
      rgmemid     : access MEMBERID)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetIDsOfNames_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_Invoke_Proxy
     (This        : access ITypeInfo;
      pvInstance  : Win32.PVOID;
      memid       : MEMBERID;
      wFlags      : Win32.WORD;
      pdispparams : access DISPPARAMS;
      pvarResult  : access VARIANT;
      pexcepinfo  : access EXCEPINFO;
      puArgErr    : access Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_Invoke_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetDocumentation_Proxy
     (This           : access ITypeInfo;
      memid          : MEMBERID;
      pbstrName      : access LPBSTR;
      pbstrDocString : access LPBSTR;
      pdwHelpContext : access Win32.DWORD;
      pbstrHelpFile  : access LPBSTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetDocumentation_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetDllEntry_Proxy
     (This         : access ITypeInfo;
      memid        : MEMBERID;
      invkind      : INVOKEKIND;
      pbstrDllName : access LPBSTR;
      pbstrName    : access LPBSTR;
      pwOrdinal    : Win32.PWSTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetDllEntry_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetRefTypeInfo_Proxy
     (This     : access ITypeInfo;
      hreftype : Win32.Oleauto.HREFTYPE;
      pptinfo  : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetRefTypeInfo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_RemoteAddressOfMember_Proxy
     (This : access ITypeInfo)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_RemoteAddressOfMember_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_CreateInstance_Proxy
     (This      : access ITypeInfo;
      puncOuter : access Win32.Objbase.IUnknown;
      riid      : access Win32.Objbase.IID;
      ppvObj    : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_CreateInstance_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetMops_Proxy
     (This      : access ITypeInfo;
      memid     : MEMBERID;
      pbstrMops : access LPBSTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetMops_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeInfo_GetContainingTypeLib_Proxy
     (This   : access ITypeInfo;
      pptlib : access LPTYPELIB;
      pindex : access Win32.UINT)
      return Win32.Objbase.HRESULT;

   procedure ITypeInfo_GetContainingTypeLib_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   procedure ITypeInfo_ReleaseTypeAttr_Proxy
     (This      : access ITypeInfo;
      ptypeattr : LPTYPEATTR);

   procedure ITypeInfo_ReleaseTypeAttr_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   procedure ITypeInfo_ReleaseFuncDesc_Proxy
     (This      : access ITypeInfo;
      pfuncdesc : access FUNCDESC);

   procedure ITypeInfo_ReleaseFuncDesc_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   procedure ITypeInfo_ReleaseVarDesc_Proxy
     (This     : access ITypeInfo;
      pvardesc : access VARDESC);

   procedure ITypeInfo_ReleaseVarDesc_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_GetTypeInfoCount_Proxy
     (This : access ITypeLib)
      return Win32.UINT;

   procedure ITypeLib_GetTypeInfoCount_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_GetTypeInfo_Proxy
     (This     : access ITypeLib;
      index    : Win32.UINT;
      ppitinfo : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_GetTypeInfo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_GetTypeInfoType_Proxy
     (This   : access ITypeLib;
      index  : Win32.UINT;
      ptkind : access TYPEKIND)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_GetTypeInfoType_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_GetTypeInfoOfGuid_Proxy
     (This    : access ITypeLib;
      guid    : access Win32.Objbase.IID;
      pptinfo : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_GetTypeInfoOfGuid_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_GetLibAttr_Proxy
     (This       : access ITypeLib;
      pptlibattr : access LPTLIBATTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_GetLibAttr_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_GetTypeComp_Proxy
     (This    : access ITypeLib;
      pptcomp : access LPTYPECOMP)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_GetTypeComp_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_GetDocumentation_Proxy
     (This           : access ITypeLib;
      index          : Win32.INT;
      pbstrName      : access LPBSTR;
      pbstrDocString : access LPBSTR;
      pdwHelpContext : access Win32.DWORD;
      pbstrHelpFile  : access LPBSTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_GetDocumentation_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_IsName_Proxy
     (This      : access ITypeLib;
      szNameBuf : Win32.Objbase.LPOLESTR;
      lHashVal  : Win32.ULONG;
      pfName    : access Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_IsName_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ITypeLib_FindName_Proxy
     (This      : access ITypeLib;
      szNameBuf : Win32.Objbase.LPOLESTR;
      lHashVal  : Win32.ULONG;
      rgptinfo  : access LPTYPEINFO;
      rgmemid   : access Win32.USHORT;
      pcFound   : Win32.PWSTR)
      return Win32.Objbase.HRESULT;

   procedure ITypeLib_FindName_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   procedure ITypeLib_ReleaseTLibAttr_Proxy
     (This      : access ITypeLib;
      ptlibattr : access TLIBATTR);

   procedure ITypeLib_ReleaseTLibAttr_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IErrorInfo_GetGUID_Proxy
     (This  : access IErrorInfo;
      pguid : access Win32.Objbase.IID)
      return Win32.Objbase.HRESULT;

   procedure IErrorInfo_GetGUID_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IErrorInfo_GetSource_Proxy
     (This        : access IErrorInfo;
      pbstrSource : access LPBSTR)
      return Win32.Objbase.HRESULT;

   procedure IErrorInfo_GetSource_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IErrorInfo_GetDescription_Proxy
     (This             : access IErrorInfo;
      pbstrDescription : access LPBSTR)
      return Win32.Objbase.HRESULT;

   procedure IErrorInfo_GetDescription_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IErrorInfo_GetHelpFile_Proxy
     (This          : access IErrorInfo;
      pbstrHelpFile : access LPBSTR)
      return Win32.Objbase.HRESULT;

   procedure IErrorInfo_GetHelpFile_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function IErrorInfo_GetHelpContext_Proxy
     (This           : access IErrorInfo;
      pdwHelpContext : access Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IErrorInfo_GetHelpContext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateErrorInfo_SetGUID_Proxy
     (This  : access ICreateErrorInfo;
      rguid : access Win32.Objbase.IID)
      return Win32.Objbase.HRESULT;

   procedure ICreateErrorInfo_SetGUID_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateErrorInfo_SetSource_Proxy
     (This     : access ICreateErrorInfo;
      szSource : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateErrorInfo_SetSource_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateErrorInfo_SetDescription_Proxy
     (This          : access ICreateErrorInfo;
      szDescription : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateErrorInfo_SetDescription_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateErrorInfo_SetHelpFile_Proxy
     (This       : access ICreateErrorInfo;
      szHelpFile : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure ICreateErrorInfo_SetHelpFile_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ICreateErrorInfo_SetHelpContext_Proxy
     (This          : access ICreateErrorInfo;
      dwHelpContext : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure ICreateErrorInfo_SetHelpContext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function ISupportErrorInfo_InterfaceSupportsErrorInfo_Proxy
     (This : access ISupportErrorInfo;
      riid : access Win32.Objbase.IID)
      return Win32.Objbase.HRESULT;

   procedure ISupportErrorInfo_InterfaceSupportsErrorInfo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);

   function SysAllocString (sz : Win32.PCWSTR) return BSTR;

   function SysReAllocString
     (pbstr : access LPBSTR;
      sz    : Win32.PCWSTR)
      return Win32.INT;

   function SysAllocStringLen
     (pch  : Win32.PCWSTR;
      cch  : Win32.UINT)
      return BSTR;

   function SysReAllocStringLen
     (pbstr : access LPBSTR;
      pch   : Win32.PCWSTR;
      cch   : Win32.UINT)
      return Win32.INT;

   procedure SysFreeString (bstr : Win32.Oleauto.BSTR);

   function SysStringLen (bstr : Win32.Oleauto.BSTR) return Win32.UINT;

   function SysStringByteLen (bstr : Win32.Oleauto.BSTR) return Win32.UINT;

   function SysAllocStringByteLen
     (psz  : Win32.PCSTR;
      len  : Win32.UINT)
      return BSTR;

   function DosDateTimeToVariantTime
     (wDosDate : Win32.USHORT;
      wDosTime : Win32.USHORT;
      pvtime   : access Win32.DOUBLE)
      return Win32.INT;

   function VariantTimeToDosDateTime
     (vtime     : Win32.DOUBLE;
      pwDosDate : Win32.PWSTR;
      pwDosTime : Win32.PWSTR)
      return Win32.INT;

   function SafeArrayAllocDescriptor
     (cDims   : Win32.UINT;
      ppsaOut : access LPSAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayAllocData
     (psa  : access SAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayCreate
     (vt        : VARTYPE;
      cDims     : Win32.UINT;
      rgsabound : access SAFEARRAYBOUND)
      return LPSAFEARRAY;

   function SafeArrayDestroyDescriptor
     (psa  : access SAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayDestroyData
     (psa  : access SAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayDestroy
     (psa  : access SAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayRedim
     (psa         : access SAFEARRAY;
      psaboundNew : access SAFEARRAYBOUND)
      return Win32.Objbase.HRESULT;

   function SafeArrayGetDim (psa : access SAFEARRAY) return Win32.UINT;

   function SafeArrayGetElemsize (psa : access SAFEARRAY) return Win32.UINT;

   function SafeArrayGetUBound
     (psa      : access SAFEARRAY;
      nDim     : Win32.UINT;
      plUbound : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function SafeArrayGetLBound
     (psa      : access SAFEARRAY;
      nDim     : Win32.UINT;
      plLbound : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function SafeArrayLock
     (psa  : access SAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayUnlock
     (psa  : access SAFEARRAY)
      return Win32.Objbase.HRESULT;

   subtype HUGE is Win32.VOID;
   type HUGEP is access all HUGE;

   function SafeArrayAccessData
     (psa     : access SAFEARRAY;
      ppvData : access HUGEP)
      return Win32.Objbase.HRESULT;

   function SafeArrayUnaccessData
     (psa  : access SAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayGetElement
     (psa       : access SAFEARRAY;
      rgIndices : access Win32.LONG;
      pv        : Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function SafeArrayPutElement
     (psa       : access SAFEARRAY;
      rgIndices : access Win32.LONG;
      pv        : Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function SafeArrayCopy
     (psa     : access SAFEARRAY;
      ppsaOut : access LPSAFEARRAY)
      return Win32.Objbase.HRESULT;

   function SafeArrayPtrOfIndex
     (psa       : access SAFEARRAY;
      rgIndices : access Win32.LONG;
      ppvData   : access HUGEP)
      return Win32.Objbase.HRESULT;

   procedure VariantInit (pvarg : access VARIANT);

   function VariantClear
     (pvarg : access VARIANT)
      return Win32.Objbase.HRESULT;

   function VariantCopy
     (pvargDest : access VARIANT;
      pvargSrc  : access VARIANT)
      return Win32.Objbase.HRESULT;

   function VariantCopyInd
     (pvarDest : access VARIANT;
      pvargSrc : access VARIANT)
      return Win32.Objbase.HRESULT;

   function VariantChangeType
     (pvargDest : access VARIANT;
      pvarSrc   : access VARIANT;
      wFlags    : Win32.USHORT;
      vt        : VARTYPE)
      return Win32.Objbase.HRESULT;

   function VariantChangeTypeEx
     (pvargDest : access VARIANT;
      pvarSrc   : access VARIANT;
      lcid      : Win32.Winnt.LCID;
      wFlags    : Win32.USHORT;
      vt        : VARTYPE)
      return Win32.Objbase.HRESULT;

   function VarUI1FromI2
     (sIn   : Win32.SHORT;
      pbOut : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromI4
     (lIn   : Win32.LONG;
      pbOut : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromR4
     (fltIn : Win32.FLOAT;
      pbOut : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromR8
     (dblIn : Win32.DOUBLE;
      pbOut : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromCy
     (cyIn  : CY;
      pbOut : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromDate
     (dateIn : DATE;
      pbOut  : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromStr
     (strIn   : Win32.PWSTR;
      lcid    : Win32.Winnt.LCID;
      dwFlags : Win32.ULONG;
      pbOut   : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromDisp
     (pdispIn : access IDispatch;
      lcid    : Win32.Winnt.LCID;
      pbOut   : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarUI1FromBool
     (boolIn : VARIANT_BOOL;
      pbOut  : Win32.PUCHAR)
      return Win32.Objbase.HRESULT;

   function VarI2FromUI1
     (bIn   : Win32.UCHAR;
      psOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromI4
     (lIn   : Win32.LONG;
      psOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromR4
     (fltIn : Win32.FLOAT;
      psOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromR8
     (dblIn : Win32.DOUBLE;
      psOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromCy
     (cyIn  : CY;
      psOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromDate
     (dateIn : DATE;
      psOut  : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromStr
     (strIn   : Win32.PWSTR;
      lcid    : Win32.Winnt.LCID;
      dwFlags : Win32.ULONG;
      psOut   : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromDisp
     (pdispIn : access IDispatch;
      lcid    : Win32.Winnt.LCID;
      psOut   : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI2FromBool
     (boolIn : VARIANT_BOOL;
      psOut  : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarI4FromUI1
     (bIn   : Win32.UCHAR;
      plOut : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromI2
     (sIn   : Win32.SHORT;
      plOut : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromR4
     (fltIn : Win32.FLOAT;
      plOut : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromR8
     (dblIn : Win32.DOUBLE;
      plOut : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromCy
     (cyIn  : CY;
      plOut : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromDate
     (dateIn : DATE;
      plOut  : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromStr
     (strIn   : Win32.PWSTR;
      lcid    : Win32.Winnt.LCID;
      dwFlags : Win32.ULONG;
      plOut   : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromDisp
     (pdispIn : access IDispatch;
      lcid    : Win32.Winnt.LCID;
      plOut   : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarI4FromBool
     (boolIn : VARIANT_BOOL;
      plOut  : access Win32.LONG)
      return Win32.Objbase.HRESULT;

   function VarR4FromUI1
     (bIn     : Win32.UCHAR;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromI2
     (sIn     : Win32.SHORT;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromI4
     (lIn     : Win32.LONG;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromR8
     (dblIn   : Win32.DOUBLE;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromCy
     (cyIn    : CY;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromDate
     (dateIn  : DATE;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromStr
     (strIn   : Win32.PWSTR;
      lcid    : Win32.Winnt.LCID;
      dwFlags : Win32.ULONG;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromDisp
     (pdispIn : access IDispatch;
      lcid    : Win32.Winnt.LCID;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR4FromBool
     (boolIn  : VARIANT_BOOL;
      pfltOut : access Win32.FLOAT)
      return Win32.Objbase.HRESULT;

   function VarR8FromUI1
     (bIn     : Win32.UCHAR;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromI2
     (sIn     : Win32.SHORT;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromI4
     (lIn     : Win32.LONG;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromR4
     (fltIn   : Win32.FLOAT;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromCy
     (cyIn    : CY;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromDate
     (dateIn  : DATE;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromStr
     (strIn   : Win32.PWSTR;
      lcid    : Win32.Winnt.LCID;
      dwFlags : Win32.ULONG;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromDisp
     (pdispIn : access IDispatch;
      lcid    : Win32.Winnt.LCID;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarR8FromBool
     (boolIn  : VARIANT_BOOL;
      pdblOut : access Win32.DOUBLE)
      return Win32.Objbase.HRESULT;

   function VarDateFromUI1
     (bIn      : Win32.UCHAR;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromI2
     (sIn      : Win32.SHORT;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromI4
     (lIn      : Win32.LONG;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromR4
     (fltIn    : Win32.FLOAT;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromR8
     (dblIn    : Win32.DOUBLE;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromCy
     (cyIn     : CY;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromStr
     (strIn    : Win32.PWSTR;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromDisp
     (pdispIn  : access IDispatch;
      lcid     : Win32.Winnt.LCID;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarDateFromBool
     (boolIn   : VARIANT_BOOL;
      pdateOut : access DATE)
      return Win32.Objbase.HRESULT;

   function VarCyFromUI1
     (bIn    : Win32.UCHAR;
      pcyOut : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromI2
     (sIn    : Win32.SHORT;
      pcyOut : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromI4
     (lIn    : Win32.LONG;
      pcyOut : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromR4
     (fltIn  : Win32.FLOAT;
      pcyOut : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromR8
     (dblIn  : Win32.DOUBLE;
      pcyOut : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromDate
     (dateIn : DATE;
      pcyOut : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromStr
     (strIn   : Win32.PWSTR;
      lcid    : Win32.Winnt.LCID;
      dwFlags : Win32.ULONG;
      pcyOut  : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromDisp
     (pdispIn : access IDispatch;
      lcid    : Win32.Winnt.LCID;
      pcyOut  : access CY)
      return Win32.Objbase.HRESULT;

   function VarCyFromBool
     (boolIn : VARIANT_BOOL;
      pcyOut : access CY)
      return Win32.Objbase.HRESULT;

   function VarBstrFromUI1
     (bVal     : Win32.UCHAR;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromI2
     (iVal     : Win32.SHORT;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromI4
     (lIn      : Win32.LONG;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromR4
     (fltIn    : Win32.FLOAT;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromR8
     (dblIn    : Win32.DOUBLE;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromCy
     (cyIn     : CY;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromDate
     (dateIn   : DATE;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromDisp
     (pdispIn  : access IDispatch;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBstrFromBool
     (boolIn   : VARIANT_BOOL;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pbstrOut : access LPBSTR)
      return Win32.Objbase.HRESULT;

   function VarBoolFromUI1
     (bIn      : Win32.UCHAR;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromI2
     (sIn      : Win32.SHORT;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromI4
     (lIn      : Win32.LONG;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromR4
     (fltIn    : Win32.FLOAT;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromR8
     (dblIn    : Win32.DOUBLE;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromDate
     (dateIn   : DATE;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromCy
     (cyIn     : CY;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromStr
     (strIn    : Win32.PWSTR;
      lcid     : Win32.Winnt.LCID;
      dwFlags  : Win32.ULONG;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function VarBoolFromDisp
     (pdispIn  : access IDispatch;
      lcid     : Win32.Winnt.LCID;
      pboolOut : access Win32.SHORT)
      return Win32.Objbase.HRESULT;

   function LHashValOfNameSysA
     (syskind : Win32.Oleauto.SYSKIND;
      lcid    : Win32.Winnt.LCID;
      szName  : Win32.PCSTR)
      return Win32.ULONG;

   function LHashValOfNameSys
     (syskind : Win32.Oleauto.SYSKIND;
      lcid    : Win32.Winnt.LCID;
      szName  : Win32.PCWSTR)
      return Win32.ULONG;

   function LHashValOfName
     (lcid   : Win32.Winnt.LCID;
      szName : Win32.PCWSTR)
      return Win32.ULONG;

   function WHashValOfLHashVal (lhashval : Win32.ULONG) return Win32.USHORT;

   function IsHashValCompatible
     (lhashval1 : Win32.ULONG;
      lhashval2 : Win32.ULONG)
      return Win32.BOOL;

   function LoadTypeLib
     (szFile : Win32.PCWSTR;
      pptlib : access LPTYPELIB)
      return Win32.Objbase.HRESULT;

   function LoadRegTypeLib
     (rguid     : access Win32.Objbase.IID;
      wVerMajor : Win32.WORD;
      wVerMinor : Win32.WORD;
      lcid      : Win32.Winnt.LCID;
      pptlib    : access LPTYPELIB)
      return Win32.Objbase.HRESULT;

   function QueryPathOfRegTypeLib
     (guid           : access Win32.Objbase.IID;
      wMaj           : Win32.USHORT;
      wMin           : Win32.USHORT;
      lcid           : Win32.Winnt.LCID;
      lpbstrPathName : LPBSTR)
      return Win32.Objbase.HRESULT;

   function RegisterTypeLib
     (ptlib      : access ITypeLib;
      szFullPath : Win32.PWSTR;
      szHelpDir  : Win32.PWSTR)
      return Win32.Objbase.HRESULT;

   function UnRegisterTypeLib
     (libID     : Win32.Objbase.REFGUID;
      wVerMajor : Win32.WORD;
      wVerMinor : Win32.WORD;
      lcid      : Win32.Winnt.LCID;
      syskind   : Win32.Oleauto.SYSKIND)
      return Win32.Objbase.HRESULT;

   function DeregisterTypeLib
     (rguid     : access Win32.Objbase.IID;
      wVerMajor : Win32.WORD;
      wVerMinor : Win32.WORD;
      lcid      : Win32.Winnt.LCID)
      return Win32.Objbase.HRESULT;

   function CreateTypeLib
     (syskind : Win32.Oleauto.SYSKIND;
      szFile  : Win32.PCWSTR;
      ppctlib : access LPCREATETYPELIB)
      return Win32.Objbase.HRESULT;

   function DispGetParam
     (pdispparams : access DISPPARAMS;
      position    : Win32.UINT;
      vtTarg      : VARTYPE;
      pvarResult  : access VARIANT;
      puArgErr    : access Win32.UINT)
      return Win32.Objbase.HRESULT;

   function DispGetIDsOfNames
     (ptinfo    : access ITypeInfo;
      rgszNames : access Win32.Objbase.LPOLESTR;
      cNames    : Win32.UINT;
      rgdispid  : access DISPID)
      return Win32.Objbase.HRESULT;

   function DispInvoke
     (this         : Win32.PVOID;
      ptinfo       : access ITypeInfo;
      dispidMember : DISPID;
      wFlags       : Win32.WORD;
      pparams      : access DISPPARAMS;
      pvarResult   : access VARIANT;
      pexcepinfo   : access EXCEPINFO;
      puArgErr     : access Win32.UINT)
      return Win32.Objbase.HRESULT;

   function CreateDispTypeInfo
     (pidata  : LPINTERFACEDATA;
      lcid    : Win32.Winnt.LCID;
      pptinfo : access LPTYPEINFO)
      return Win32.Objbase.HRESULT;

   function CreateStdDispatch
     (punkOuter    : access Win32.Objbase.IUnknown;
      pvThis       : Win32.PVOID;
      ptinfo       : access ITypeInfo;
      ppunkStdDisp : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   function RegisterActiveObject
     (punk        : Win32.Objbase.IUnknown;
      rclsid      : access Win32.Objbase.IID;
      dwFlags     : Win32.DWORD;
      pdwRegister : access Win32.DWORD)
      return Win32.Objbase.HRESULT;

   function RevokeActiveObject
     (dwRegister : Win32.DWORD;
      pvReserved : Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function GetActiveObject
     (rclsid     : access Win32.Objbase.IID;
      pvReserved : Win32.PVOID;
      ppunk      : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   function SetErrorInfo
     (dwReserved : Win32.ULONG;
      perrinfo   : access IErrorInfo)
      return Win32.Objbase.HRESULT;

   function GetErrorInfo
     (dwReserved : Win32.ULONG;
      pperrinfo  : access LPERRORINFO)
      return Win32.Objbase.HRESULT;

   function CreateErrorInfo
     (pperrinfo : access LPCREATEERRORINFO)
      return Win32.Objbase.HRESULT;

   function OaBuildVersion return Win32.ULONG;

   function V_VT (X : access VARIANT) return VARTYPE;
   function V_ISBYREF (X : access VARIANT) return VARTYPE;
   function V_ISARRAY (X : access VARIANT) return VARTYPE;
   function V_ISVECTOR (X : access VARIANT) return VARTYPE;
   function V_I2 (X : access VARIANT) return Win32.SHORT;
   function V_NONE (X : access VARIANT) return Win32.SHORT;
   function V_UI1 (X : access VARIANT) return Win32.UCHAR;
   function V_UI1REF (X : access VARIANT) return Win32.PUCHAR;
   function V_I2REF (X : access VARIANT) return Win32.PSHORT;
   function V_I4 (X : access VARIANT) return Win32.LONG;
   function V_I4REF (X : access VARIANT) return Win32.PLONG;
   function V_R4 (X : access VARIANT) return Win32.FLOAT;
   function V_R4REF (X : access VARIANT) return Win32.PFLOAT;
   function V_R8 (X : access VARIANT) return Win32.DOUBLE;
   function V_R8REF (X : access VARIANT) return Win32.PDOUBLE;
   function V_CY (X : access VARIANT) return CY;
   function V_CYREF (X : access VARIANT) return PCY;
   function V_DATE (X : access VARIANT) return Win32.Oleauto.DATE;
   function V_DATEREF (X : access VARIANT) return Win32.Oleauto.PDATE;
   function V_BSTR (X : access VARIANT) return BSTR;
   function V_BSTRREF (X : access VARIANT) return LPBSTR;
   function V_DISPATCH (X : access VARIANT) return LPDISPATCH;
   function V_DISPATCHREF (X : access VARIANT) return a_LPDISPATCH_t;

   function V_ERROR (X : access VARIANT) return Win32.Objbase.SCODE;
   function V_ERRORREF (X : access VARIANT) return Win32.Objbase.PSCODE;
   function V_BOOL (X : access VARIANT) return VARIANT_BOOL;
   function V_BOOLREF (X : access VARIANT) return PVARIANT_BOOL;
   function V_UNKNOWN (X : access VARIANT) return Win32.Objbase.LPUNKNOWN;
   function V_UNKNOWNREF (X : access VARIANT) return a_a_IUnknown;
   function V_VARIANTREF (X : access VARIANT) return LPVARIANT;
   function V_ARRAY (X : access VARIANT) return LPSAFEARRAY;

   function V_ARRAYREF (X : access VARIANT) return PLPSAFEARRAY;
   function V_BYREF (X : access VARIANT) return Win32.PVOID;

private

   pragma Convention (C_Pass_By_Copy, ICreateTypeInfo);
   pragma Convention (C_Pass_By_Copy, ICreateTypeLib);
   pragma Convention (C_Pass_By_Copy, IDispatch);
   pragma Convention (C_Pass_By_Copy, IEnumVARIANT);
   pragma Convention (C_Pass_By_Copy, ITypeComp);
   pragma Convention (C_Pass_By_Copy, ITypeInfo);
   pragma Convention (C_Pass_By_Copy, ITypeLib);
   pragma Convention (C_Pass_By_Copy, IErrorInfo);
   pragma Convention (C_Pass_By_Copy, ICreateErrorInfo);
   pragma Convention (C_Pass_By_Copy, ISupportErrorInfo);
   pragma Convention (C_Pass_By_Copy, BLOB);
   pragma Convention (C_Pass_By_Copy, CLIPDATA);
   pragma Convention (C_Pass_By_Copy, SAFEARRAYBOUND);
   pragma Convention (C, SAFEARRAY);
   pragma Convention (C_Pass_By_Copy, CY);
   pragma Convention (C_Pass_By_Copy, IDLDESC);
   pragma Convention (C_Pass_By_Copy, DISPPARAMS);
   pragma Convention (C, RemEXCEPINFO);
   pragma Convention (C, EXCEPINFO);
   pragma Convention (C, ICreateTypeInfoVtbl);
   pragma Convention (C, ICreateTypeLibVtbl);
   pragma Convention (C, IDispatchVtbl);
   pragma Convention (C, IEnumVARIANTVtbl);
   pragma Convention (C, ITypeCompVtbl);
   pragma Convention (C, ITypeInfoVtbl);
   pragma Convention (C, TLIBATTR);
   pragma Convention (C, ITypeLibVtbl);
   pragma Convention (C, IErrorInfoVtbl);
   pragma Convention (C, ICreateErrorInfoVtbl);
   pragma Convention (C_Pass_By_Copy, ISupportErrorInfoVtbl);
   pragma Convention (C_Pass_By_Copy, PARAMDATA);
   pragma Convention (C, METHODDATA);
   pragma Convention (C_Pass_By_Copy, INTERFACEDATA);
   pragma Convention (C_Pass_By_Copy, VARIANT);
   pragma Convention (C_Pass_By_Copy, TYPEDESC);
   pragma Convention (C_Pass_By_Copy, ELEMDESC);
   pragma Convention (C, TYPEATTR);
   pragma Convention (C, FUNCDESC);
   pragma Convention (C, VARDESC);
   pragma Convention (C, ARRAYDESC);

   pragma Import
     (Stdcall,
      RemVariant_v0_1_c_ifspec,
      "RemVariant_v0_1_c_ifspec");
   pragma Import
     (Stdcall,
      RemVariant_v0_1_s_ifspec,
      "RemVariant_v0_1_s_ifspec");
   pragma Import (Stdcall, IID_ICreateTypeInfo, "IID_ICreateTypeInfo");
   pragma Import (Stdcall, IID_ICreateTypeLib, "IID_ICreateTypeLib");
   pragma Import (Stdcall, IID_IDispatch, "IID_IDispatch");
   pragma Import (Stdcall, IID_IEnumVARIANT, "IID_IEnumVARIANT");
   pragma Import (Stdcall, IID_ITypeComp, "IID_ITypeComp");
   pragma Import (Stdcall, IID_ITypeInfo, "IID_ITypeInfo");
   pragma Import (Stdcall, IID_ITypeLib, "IID_ITypeLib");
   pragma Import (Stdcall, IID_IErrorInfo, "IID_IErrorInfo");
   pragma Import (Stdcall, IID_ICreateErrorInfo, "IID_ICreateErrorInfo");
   pragma Import (Stdcall, IID_ISupportErrorInfo, "IID_ISupportErrorInfo");

   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetGuid_Proxy,
      "ICreateTypeInfo_SetGuid_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetGuid_Stub,
      "ICreateTypeInfo_SetGuid_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetTypeFlags_Proxy,
      "ICreateTypeInfo_SetTypeFlags_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetTypeFlags_Stub,
      "ICreateTypeInfo_SetTypeFlags_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetDocString_Proxy,
      "ICreateTypeInfo_SetDocString_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetDocString_Stub,
      "ICreateTypeInfo_SetDocString_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetHelpContext_Proxy,
      "ICreateTypeInfo_SetHelpContext_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetHelpContext_Stub,
      "ICreateTypeInfo_SetHelpContext_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVersion_Proxy,
      "ICreateTypeInfo_SetVersion_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVersion_Stub,
      "ICreateTypeInfo_SetVersion_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddRefTypeInfo_Proxy,
      "ICreateTypeInfo_AddRefTypeInfo_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddRefTypeInfo_Stub,
      "ICreateTypeInfo_AddRefTypeInfo_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddFuncDesc_Proxy,
      "ICreateTypeInfo_AddFuncDesc_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddFuncDesc_Stub,
      "ICreateTypeInfo_AddFuncDesc_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddImplType_Proxy,
      "ICreateTypeInfo_AddImplType_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddImplType_Stub,
      "ICreateTypeInfo_AddImplType_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetImplTypeFlags_Proxy,
      "ICreateTypeInfo_SetImplTypeFlags_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetImplTypeFlags_Stub,
      "ICreateTypeInfo_SetImplTypeFlags_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetAlignment_Proxy,
      "ICreateTypeInfo_SetAlignment_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetAlignment_Stub,
      "ICreateTypeInfo_SetAlignment_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetSchema_Proxy,
      "ICreateTypeInfo_SetSchema_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetSchema_Stub,
      "ICreateTypeInfo_SetSchema_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddVarDesc_Proxy,
      "ICreateTypeInfo_AddVarDesc_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_AddVarDesc_Stub,
      "ICreateTypeInfo_AddVarDesc_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetFuncAndParamNames_Proxy,
      "ICreateTypeInfo_SetFuncAndParamNames_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetFuncAndParamNames_Stub,
      "ICreateTypeInfo_SetFuncAndParamNames_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVarName_Proxy,
      "ICreateTypeInfo_SetVarName_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVarName_Stub,
      "ICreateTypeInfo_SetVarName_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetTypeDescAlias_Proxy,
      "ICreateTypeInfo_SetTypeDescAlias_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetTypeDescAlias_Stub,
      "ICreateTypeInfo_SetTypeDescAlias_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_DefineFuncAsDllEntry_Proxy,
      "ICreateTypeInfo_DefineFuncAsDllEntry_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_DefineFuncAsDllEntry_Stub,
      "ICreateTypeInfo_DefineFuncAsDllEntry_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetFuncDocString_Proxy,
      "ICreateTypeInfo_SetFuncDocString_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetFuncDocString_Stub,
      "ICreateTypeInfo_SetFuncDocString_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVarDocString_Proxy,
      "ICreateTypeInfo_SetVarDocString_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVarDocString_Stub,
      "ICreateTypeInfo_SetVarDocString_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetFuncHelpContext_Proxy,
      "ICreateTypeInfo_SetFuncHelpContext_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetFuncHelpContext_Stub,
      "ICreateTypeInfo_SetFuncHelpContext_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVarHelpContext_Proxy,
      "ICreateTypeInfo_SetVarHelpContext_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetVarHelpContext_Stub,
      "ICreateTypeInfo_SetVarHelpContext_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetMops_Proxy,
      "ICreateTypeInfo_SetMops_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetMops_Stub,
      "ICreateTypeInfo_SetMops_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetTypeIdldesc_Proxy,
      "ICreateTypeInfo_SetTypeIdldesc_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_SetTypeIdldesc_Stub,
      "ICreateTypeInfo_SetTypeIdldesc_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_LayOut_Proxy,
      "ICreateTypeInfo_LayOut_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeInfo_LayOut_Stub,
      "ICreateTypeInfo_LayOut_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_CreateTypeInfo_Proxy,
      "ICreateTypeLib_CreateTypeInfo_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_CreateTypeInfo_Stub,
      "ICreateTypeLib_CreateTypeInfo_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetName_Proxy,
      "ICreateTypeLib_SetName_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetName_Stub,
      "ICreateTypeLib_SetName_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetVersion_Proxy,
      "ICreateTypeLib_SetVersion_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetVersion_Stub,
      "ICreateTypeLib_SetVersion_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetGuid_Proxy,
      "ICreateTypeLib_SetGuid_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetGuid_Stub,
      "ICreateTypeLib_SetGuid_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetDocString_Proxy,
      "ICreateTypeLib_SetDocString_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetDocString_Stub,
      "ICreateTypeLib_SetDocString_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetHelpFileName_Proxy,
      "ICreateTypeLib_SetHelpFileName_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetHelpFileName_Stub,
      "ICreateTypeLib_SetHelpFileName_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetHelpContext_Proxy,
      "ICreateTypeLib_SetHelpContext_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetHelpContext_Stub,
      "ICreateTypeLib_SetHelpContext_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetLcid_Proxy,
      "ICreateTypeLib_SetLcid_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetLcid_Stub,
      "ICreateTypeLib_SetLcid_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetLibFlags_Proxy,
      "ICreateTypeLib_SetLibFlags_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SetLibFlags_Stub,
      "ICreateTypeLib_SetLibFlags_Stub");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SaveAllChanges_Proxy,
      "ICreateTypeLib_SaveAllChanges_Proxy");
   pragma Import
     (Stdcall,
      ICreateTypeLib_SaveAllChanges_Stub,
      "ICreateTypeLib_SaveAllChanges_Stub");
   pragma Import
     (Stdcall,
      IDispatch_GetTypeInfoCount_Proxy,
      "IDispatch_GetTypeInfoCount_Proxy");
   pragma Import
     (Stdcall,
      IDispatch_GetTypeInfoCount_Stub,
      "IDispatch_GetTypeInfoCount_Stub");
   pragma Import
     (Stdcall,
      IDispatch_GetTypeInfo_Proxy,
      "IDispatch_GetTypeInfo_Proxy");
   pragma Import
     (Stdcall,
      IDispatch_GetTypeInfo_Stub,
      "IDispatch_GetTypeInfo_Stub");
   pragma Import
     (Stdcall,
      IDispatch_GetIDsOfNames_Proxy,
      "IDispatch_GetIDsOfNames_Proxy");
   pragma Import
     (Stdcall,
      IDispatch_GetIDsOfNames_Stub,
      "IDispatch_GetIDsOfNames_Stub");
   pragma Import (Stdcall, IDispatch_Invoke_Proxy, "IDispatch_Invoke_Proxy");
   pragma Import (Stdcall, IDispatch_Invoke_Stub, "IDispatch_Invoke_Stub");
   pragma Import
     (Stdcall,
      IEnumVARIANT_Next_Proxy,
      "IEnumVARIANT_Next_Proxy");
   pragma Import (Stdcall, IEnumVARIANT_Next_Stub, "IEnumVARIANT_Next_Stub");
   pragma Import
     (Stdcall,
      IEnumVARIANT_Skip_Proxy,
      "IEnumVARIANT_Skip_Proxy");
   pragma Import (Stdcall, IEnumVARIANT_Skip_Stub, "IEnumVARIANT_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumVARIANT_Reset_Proxy,
      "IEnumVARIANT_Reset_Proxy");
   pragma Import
     (Stdcall,
      IEnumVARIANT_Reset_Stub,
      "IEnumVARIANT_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumVARIANT_Clone_Proxy,
      "IEnumVARIANT_Clone_Proxy");
   pragma Import
     (Stdcall,
      IEnumVARIANT_Clone_Stub,
      "IEnumVARIANT_Clone_Stub");
   pragma Import (Stdcall, ITypeComp_Bind_Proxy, "ITypeComp_Bind_Proxy");
   pragma Import (Stdcall, ITypeComp_Bind_Stub, "ITypeComp_Bind_Stub");
   pragma Import
     (Stdcall,
      ITypeComp_BindType_Proxy,
      "ITypeComp_BindType_Proxy");
   pragma Import
     (Stdcall,
      ITypeComp_BindType_Stub,
      "ITypeComp_BindType_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetTypeAttr_Proxy,
      "ITypeInfo_GetTypeAttr_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetTypeAttr_Stub,
      "ITypeInfo_GetTypeAttr_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetTypeComp_Proxy,
      "ITypeInfo_GetTypeComp_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetTypeComp_Stub,
      "ITypeInfo_GetTypeComp_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetFuncDesc_Proxy,
      "ITypeInfo_GetFuncDesc_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetFuncDesc_Stub,
      "ITypeInfo_GetFuncDesc_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetVarDesc_Proxy,
      "ITypeInfo_GetVarDesc_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetVarDesc_Stub,
      "ITypeInfo_GetVarDesc_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetNames_Proxy,
      "ITypeInfo_GetNames_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetNames_Stub,
      "ITypeInfo_GetNames_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetRefTypeOfImplType_Proxy,
      "ITypeInfo_GetRefTypeOfImplType_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetRefTypeOfImplType_Stub,
      "ITypeInfo_GetRefTypeOfImplType_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetImplTypeFlags_Proxy,
      "ITypeInfo_GetImplTypeFlags_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetImplTypeFlags_Stub,
      "ITypeInfo_GetImplTypeFlags_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetIDsOfNames_Proxy,
      "ITypeInfo_GetIDsOfNames_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetIDsOfNames_Stub,
      "ITypeInfo_GetIDsOfNames_Stub");
   pragma Import (Stdcall, ITypeInfo_Invoke_Proxy, "ITypeInfo_Invoke_Proxy");
   pragma Import (Stdcall, ITypeInfo_Invoke_Stub, "ITypeInfo_Invoke_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetDocumentation_Proxy,
      "ITypeInfo_GetDocumentation_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetDocumentation_Stub,
      "ITypeInfo_GetDocumentation_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetDllEntry_Proxy,
      "ITypeInfo_GetDllEntry_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetDllEntry_Stub,
      "ITypeInfo_GetDllEntry_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetRefTypeInfo_Proxy,
      "ITypeInfo_GetRefTypeInfo_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetRefTypeInfo_Stub,
      "ITypeInfo_GetRefTypeInfo_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_RemoteAddressOfMember_Proxy,
      "ITypeInfo_RemoteAddressOfMember_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_RemoteAddressOfMember_Stub,
      "ITypeInfo_RemoteAddressOfMember_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_CreateInstance_Proxy,
      "ITypeInfo_CreateInstance_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_CreateInstance_Stub,
      "ITypeInfo_CreateInstance_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetMops_Proxy,
      "ITypeInfo_GetMops_Proxy");
   pragma Import (Stdcall, ITypeInfo_GetMops_Stub, "ITypeInfo_GetMops_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_GetContainingTypeLib_Proxy,
      "ITypeInfo_GetContainingTypeLib_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_GetContainingTypeLib_Stub,
      "ITypeInfo_GetContainingTypeLib_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_ReleaseTypeAttr_Proxy,
      "ITypeInfo_ReleaseTypeAttr_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_ReleaseTypeAttr_Stub,
      "ITypeInfo_ReleaseTypeAttr_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_ReleaseFuncDesc_Proxy,
      "ITypeInfo_ReleaseFuncDesc_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_ReleaseFuncDesc_Stub,
      "ITypeInfo_ReleaseFuncDesc_Stub");
   pragma Import
     (Stdcall,
      ITypeInfo_ReleaseVarDesc_Proxy,
      "ITypeInfo_ReleaseVarDesc_Proxy");
   pragma Import
     (Stdcall,
      ITypeInfo_ReleaseVarDesc_Stub,
      "ITypeInfo_ReleaseVarDesc_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfoCount_Proxy,
      "ITypeLib_GetTypeInfoCount_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfoCount_Stub,
      "ITypeLib_GetTypeInfoCount_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfo_Proxy,
      "ITypeLib_GetTypeInfo_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfo_Stub,
      "ITypeLib_GetTypeInfo_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfoType_Proxy,
      "ITypeLib_GetTypeInfoType_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfoType_Stub,
      "ITypeLib_GetTypeInfoType_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfoOfGuid_Proxy,
      "ITypeLib_GetTypeInfoOfGuid_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeInfoOfGuid_Stub,
      "ITypeLib_GetTypeInfoOfGuid_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_GetLibAttr_Proxy,
      "ITypeLib_GetLibAttr_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_GetLibAttr_Stub,
      "ITypeLib_GetLibAttr_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeComp_Proxy,
      "ITypeLib_GetTypeComp_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_GetTypeComp_Stub,
      "ITypeLib_GetTypeComp_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_GetDocumentation_Proxy,
      "ITypeLib_GetDocumentation_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_GetDocumentation_Stub,
      "ITypeLib_GetDocumentation_Stub");
   pragma Import (Stdcall, ITypeLib_IsName_Proxy, "ITypeLib_IsName_Proxy");
   pragma Import (Stdcall, ITypeLib_IsName_Stub, "ITypeLib_IsName_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_FindName_Proxy,
      "ITypeLib_FindName_Proxy");
   pragma Import (Stdcall, ITypeLib_FindName_Stub, "ITypeLib_FindName_Stub");
   pragma Import
     (Stdcall,
      ITypeLib_ReleaseTLibAttr_Proxy,
      "ITypeLib_ReleaseTLibAttr_Proxy");
   pragma Import
     (Stdcall,
      ITypeLib_ReleaseTLibAttr_Stub,
      "ITypeLib_ReleaseTLibAttr_Stub");
   pragma Import
     (Stdcall,
      IErrorInfo_GetGUID_Proxy,
      "IErrorInfo_GetGUID_Proxy");
   pragma Import
     (Stdcall,
      IErrorInfo_GetGUID_Stub,
      "IErrorInfo_GetGUID_Stub");
   pragma Import
     (Stdcall,
      IErrorInfo_GetSource_Proxy,
      "IErrorInfo_GetSource_Proxy");
   pragma Import
     (Stdcall,
      IErrorInfo_GetSource_Stub,
      "IErrorInfo_GetSource_Stub");
   pragma Import
     (Stdcall,
      IErrorInfo_GetDescription_Proxy,
      "IErrorInfo_GetDescription_Proxy");
   pragma Import
     (Stdcall,
      IErrorInfo_GetDescription_Stub,
      "IErrorInfo_GetDescription_Stub");
   pragma Import
     (Stdcall,
      IErrorInfo_GetHelpFile_Proxy,
      "IErrorInfo_GetHelpFile_Proxy");
   pragma Import
     (Stdcall,
      IErrorInfo_GetHelpFile_Stub,
      "IErrorInfo_GetHelpFile_Stub");
   pragma Import
     (Stdcall,
      IErrorInfo_GetHelpContext_Proxy,
      "IErrorInfo_GetHelpContext_Proxy");
   pragma Import
     (Stdcall,
      IErrorInfo_GetHelpContext_Stub,
      "IErrorInfo_GetHelpContext_Stub");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetGUID_Proxy,
      "ICreateErrorInfo_SetGUID_Proxy");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetGUID_Stub,
      "ICreateErrorInfo_SetGUID_Stub");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetSource_Proxy,
      "ICreateErrorInfo_SetSource_Proxy");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetSource_Stub,
      "ICreateErrorInfo_SetSource_Stub");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetDescription_Proxy,
      "ICreateErrorInfo_SetDescription_Proxy");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetDescription_Stub,
      "ICreateErrorInfo_SetDescription_Stub");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetHelpFile_Proxy,
      "ICreateErrorInfo_SetHelpFile_Proxy");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetHelpFile_Stub,
      "ICreateErrorInfo_SetHelpFile_Stub");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetHelpContext_Proxy,
      "ICreateErrorInfo_SetHelpContext_Proxy");
   pragma Import
     (Stdcall,
      ICreateErrorInfo_SetHelpContext_Stub,
      "ICreateErrorInfo_SetHelpContext_Stub");
   pragma Import
     (Stdcall,
      ISupportErrorInfo_InterfaceSupportsErrorInfo_Proxy,
      "ISupportErrorInfo_InterfaceSupportsErrorInfo_Proxy");
   pragma Import
     (Stdcall,
      ISupportErrorInfo_InterfaceSupportsErrorInfo_Stub,
      "ISupportErrorInfo_InterfaceSupportsErrorInfo_Stub");
   pragma Import (Stdcall, SysAllocString, "SysAllocString");
   pragma Import (Stdcall, SysReAllocString, "SysReAllocString");
   pragma Import (Stdcall, SysAllocStringLen, "SysAllocStringLen");
   pragma Import (Stdcall, SysReAllocStringLen, "SysReAllocStringLen");
   pragma Import (Stdcall, SysFreeString, "SysFreeString");
   pragma Import (Stdcall, SysStringLen, "SysStringLen");
   pragma Import (Stdcall, SysStringByteLen, "SysStringByteLen");
   pragma Import (Stdcall, SysAllocStringByteLen, "SysAllocStringByteLen");
   pragma Import
     (Stdcall,
      DosDateTimeToVariantTime,
      "DosDateTimeToVariantTime");
   pragma Import
     (Stdcall,
      VariantTimeToDosDateTime,
      "VariantTimeToDosDateTime");
   pragma Import
     (Stdcall,
      SafeArrayAllocDescriptor,
      "SafeArrayAllocDescriptor");
   pragma Import (Stdcall, SafeArrayAllocData, "SafeArrayAllocData");
   pragma Import (Stdcall, SafeArrayCreate, "SafeArrayCreate");
   pragma Import
     (Stdcall,
      SafeArrayDestroyDescriptor,
      "SafeArrayDestroyDescriptor");
   pragma Import (Stdcall, SafeArrayDestroyData, "SafeArrayDestroyData");
   pragma Import (Stdcall, SafeArrayDestroy, "SafeArrayDestroy");
   pragma Import (Stdcall, SafeArrayRedim, "SafeArrayRedim");
   pragma Import (Stdcall, SafeArrayGetDim, "SafeArrayGetDim");
   pragma Import (Stdcall, SafeArrayGetElemsize, "SafeArrayGetElemsize");
   pragma Import (Stdcall, SafeArrayGetUBound, "SafeArrayGetUBound");
   pragma Import (Stdcall, SafeArrayGetLBound, "SafeArrayGetLBound");
   pragma Import (Stdcall, SafeArrayLock, "SafeArrayLock");
   pragma Import (Stdcall, SafeArrayUnlock, "SafeArrayUnlock");
   pragma Import (Stdcall, SafeArrayAccessData, "SafeArrayAccessData");
   pragma Import (Stdcall, SafeArrayUnaccessData, "SafeArrayUnaccessData");
   pragma Import (Stdcall, SafeArrayGetElement, "SafeArrayGetElement");
   pragma Import (Stdcall, SafeArrayPutElement, "SafeArrayPutElement");
   pragma Import (Stdcall, SafeArrayCopy, "SafeArrayCopy");
   pragma Import (Stdcall, SafeArrayPtrOfIndex, "SafeArrayPtrOfIndex");
   pragma Import (Stdcall, VariantInit, "VariantInit");
   pragma Import (Stdcall, VariantClear, "VariantClear");
   pragma Import (Stdcall, VariantCopy, "VariantCopy");
   pragma Import (Stdcall, VariantCopyInd, "VariantCopyInd");
   pragma Import (Stdcall, VariantChangeType, "VariantChangeType");
   pragma Import (Stdcall, VariantChangeTypeEx, "VariantChangeTypeEx");
   pragma Import (Stdcall, VarUI1FromI2, "VarUI1FromI2");
   pragma Import (Stdcall, VarUI1FromI4, "VarUI1FromI4");
   pragma Import (Stdcall, VarUI1FromR4, "VarUI1FromR4");
   pragma Import (Stdcall, VarUI1FromR8, "VarUI1FromR8");
   pragma Import (Stdcall, VarUI1FromCy, "VarUI1FromCy");
   pragma Import (Stdcall, VarUI1FromDate, "VarUI1FromDate");
   pragma Import (Stdcall, VarUI1FromStr, "VarUI1FromStr");
   pragma Import (Stdcall, VarUI1FromDisp, "VarUI1FromDisp");
   pragma Import (Stdcall, VarUI1FromBool, "VarUI1FromBool");
   pragma Import (Stdcall, VarI2FromUI1, "VarI2FromUI1");
   pragma Import (Stdcall, VarI2FromI4, "VarI2FromI4");
   pragma Import (Stdcall, VarI2FromR4, "VarI2FromR4");
   pragma Import (Stdcall, VarI2FromR8, "VarI2FromR8");
   pragma Import (Stdcall, VarI2FromCy, "VarI2FromCy");
   pragma Import (Stdcall, VarI2FromDate, "VarI2FromDate");
   pragma Import (Stdcall, VarI2FromStr, "VarI2FromStr");
   pragma Import (Stdcall, VarI2FromDisp, "VarI2FromDisp");
   pragma Import (Stdcall, VarI2FromBool, "VarI2FromBool");
   pragma Import (Stdcall, VarI4FromUI1, "VarI4FromUI1");
   pragma Import (Stdcall, VarI4FromI2, "VarI4FromI2");
   pragma Import (Stdcall, VarI4FromR4, "VarI4FromR4");
   pragma Import (Stdcall, VarI4FromR8, "VarI4FromR8");
   pragma Import (Stdcall, VarI4FromCy, "VarI4FromCy");
   pragma Import (Stdcall, VarI4FromDate, "VarI4FromDate");
   pragma Import (Stdcall, VarI4FromStr, "VarI4FromStr");
   pragma Import (Stdcall, VarI4FromDisp, "VarI4FromDisp");
   pragma Import (Stdcall, VarI4FromBool, "VarI4FromBool");
   pragma Import (Stdcall, VarR4FromUI1, "VarR4FromUI1");
   pragma Import (Stdcall, VarR4FromI2, "VarR4FromI2");
   pragma Import (Stdcall, VarR4FromI4, "VarR4FromI4");
   pragma Import (Stdcall, VarR4FromR8, "VarR4FromR8");
   pragma Import (Stdcall, VarR4FromCy, "VarR4FromCy");
   pragma Import (Stdcall, VarR4FromDate, "VarR4FromDate");
   pragma Import (Stdcall, VarR4FromStr, "VarR4FromStr");
   pragma Import (Stdcall, VarR4FromDisp, "VarR4FromDisp");
   pragma Import (Stdcall, VarR4FromBool, "VarR4FromBool");
   pragma Import (Stdcall, VarR8FromUI1, "VarR8FromUI1");
   pragma Import (Stdcall, VarR8FromI2, "VarR8FromI2");
   pragma Import (Stdcall, VarR8FromI4, "VarR8FromI4");
   pragma Import (Stdcall, VarR8FromR4, "VarR8FromR4");
   pragma Import (Stdcall, VarR8FromCy, "VarR8FromCy");
   pragma Import (Stdcall, VarR8FromDate, "VarR8FromDate");
   pragma Import (Stdcall, VarR8FromStr, "VarR8FromStr");
   pragma Import (Stdcall, VarR8FromDisp, "VarR8FromDisp");
   pragma Import (Stdcall, VarR8FromBool, "VarR8FromBool");
   pragma Import (Stdcall, VarDateFromUI1, "VarDateFromUI1");
   pragma Import (Stdcall, VarDateFromI2, "VarDateFromI2");
   pragma Import (Stdcall, VarDateFromI4, "VarDateFromI4");
   pragma Import (Stdcall, VarDateFromR4, "VarDateFromR4");
   pragma Import (Stdcall, VarDateFromR8, "VarDateFromR8");
   pragma Import (Stdcall, VarDateFromCy, "VarDateFromCy");
   pragma Import (Stdcall, VarDateFromStr, "VarDateFromStr");
   pragma Import (Stdcall, VarDateFromDisp, "VarDateFromDisp");
   pragma Import (Stdcall, VarDateFromBool, "VarDateFromBool");
   pragma Import (Stdcall, VarCyFromUI1, "VarCyFromUI1");
   pragma Import (Stdcall, VarCyFromI2, "VarCyFromI2");
   pragma Import (Stdcall, VarCyFromI4, "VarCyFromI4");
   pragma Import (Stdcall, VarCyFromR4, "VarCyFromR4");
   pragma Import (Stdcall, VarCyFromR8, "VarCyFromR8");
   pragma Import (Stdcall, VarCyFromDate, "VarCyFromDate");
   pragma Import (Stdcall, VarCyFromStr, "VarCyFromStr");
   pragma Import (Stdcall, VarCyFromDisp, "VarCyFromDisp");
   pragma Import (Stdcall, VarCyFromBool, "VarCyFromBool");
   pragma Import (Stdcall, VarBstrFromUI1, "VarBstrFromUI1");
   pragma Import (Stdcall, VarBstrFromI2, "VarBstrFromI2");
   pragma Import (Stdcall, VarBstrFromI4, "VarBstrFromI4");
   pragma Import (Stdcall, VarBstrFromR4, "VarBstrFromR4");
   pragma Import (Stdcall, VarBstrFromR8, "VarBstrFromR8");
   pragma Import (Stdcall, VarBstrFromCy, "VarBstrFromCy");
   pragma Import (Stdcall, VarBstrFromDate, "VarBstrFromDate");
   pragma Import (Stdcall, VarBstrFromDisp, "VarBstrFromDisp");
   pragma Import (Stdcall, VarBstrFromBool, "VarBstrFromBool");
   pragma Import (Stdcall, VarBoolFromUI1, "VarBoolFromUI1");
   pragma Import (Stdcall, VarBoolFromI2, "VarBoolFromI2");
   pragma Import (Stdcall, VarBoolFromI4, "VarBoolFromI4");
   pragma Import (Stdcall, VarBoolFromR4, "VarBoolFromR4");
   pragma Import (Stdcall, VarBoolFromR8, "VarBoolFromR8");
   pragma Import (Stdcall, VarBoolFromDate, "VarBoolFromDate");
   pragma Import (Stdcall, VarBoolFromCy, "VarBoolFromCy");
   pragma Import (Stdcall, VarBoolFromStr, "VarBoolFromStr");
   pragma Import (Stdcall, VarBoolFromDisp, "VarBoolFromDisp");
   pragma Import (Stdcall, LHashValOfNameSysA, "LHashValOfNameSysA");
   pragma Import (Stdcall, LHashValOfNameSys, "LHashValOfNameSys");
   pragma Import (Stdcall, LoadTypeLib, "LoadTypeLib");
   pragma Import (Stdcall, LoadRegTypeLib, "LoadRegTypeLib");
   pragma Import (Stdcall, QueryPathOfRegTypeLib, "QueryPathOfRegTypeLib");
   pragma Import (Stdcall, RegisterTypeLib, "RegisterTypeLib");
   pragma Import (Stdcall, UnRegisterTypeLib, "UnRegisterTypeLib");
   pragma Import (Stdcall, DeregisterTypeLib, "DeregisterTypeLib");
   pragma Import (Stdcall, CreateTypeLib, "CreateTypeLib");
   pragma Import (Stdcall, DispGetParam, "DispGetParam");
   pragma Import (Stdcall, DispGetIDsOfNames, "DispGetIDsOfNames");
   pragma Import (Stdcall, DispInvoke, "DispInvoke");
   pragma Import (Stdcall, CreateDispTypeInfo, "CreateDispTypeInfo");
   pragma Import (Stdcall, CreateStdDispatch, "CreateStdDispatch");
   pragma Import (Stdcall, RegisterActiveObject, "RegisterActiveObject");
   pragma Import (Stdcall, RevokeActiveObject, "RevokeActiveObject");
   pragma Import (Stdcall, GetActiveObject, "GetActiveObject");
   pragma Import (Stdcall, SetErrorInfo, "SetErrorInfo");
   pragma Import (Stdcall, GetErrorInfo, "GetErrorInfo");
   pragma Import (Stdcall, CreateErrorInfo, "CreateErrorInfo");
   pragma Import (Stdcall, OaBuildVersion, "OaBuildVersion");

end Win32.Oleauto;
