-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Objbase;
with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Winnt;

package Win32.Oleauto is

    STDOLE_MAJORVERNUM       : constant := 16#1#;           -- oleauto.h:91
    STDOLE_MINORVERNUM       : constant := 16#0#;           -- oleauto.h:92
    STDOLE_LCID              : constant := 16#0#;           -- oleauto.h:93
    FADF_AUTO                : constant := 16#1#;           -- oleauto.h:303
    FADF_STATIC              : constant := 16#2#;           -- oleauto.h:306
    FADF_EMBEDDED            : constant := 16#4#;           -- oleauto.h:309
    FADF_FIXEDSIZE           : constant := 16#10#;          -- oleauto.h:312
    FADF_BSTR                : constant := 16#100#;         -- oleauto.h:315
    FADF_UNKNOWN             : constant := 16#200#;         -- oleauto.h:318
    FADF_DISPATCH            : constant := 16#400#;         -- oleauto.h:321
    FADF_VARIANT             : constant := 16#800#;         -- oleauto.h:324
    FADF_RESERVED            : constant := 16#f0e8#;        -- oleauto.h:327
    VT_VECTOR                : constant := 16#1000#;        -- oleauto.h:448
    VT_ARRAY                 : constant := 16#2000#;        -- oleauto.h:451
    VT_BYREF                 : constant := 16#4000#;        -- oleauto.h:454
    VT_RESERVED              : constant := 16#8000#;        -- oleauto.h:457
    IMPLTYPEFLAG_FDEFAULT    : constant := 16#1#;           -- oleauto.h:893
    IMPLTYPEFLAG_FSOURCE     : constant := 16#2#;           -- oleauto.h:896
    IMPLTYPEFLAG_FRESTRICTED : constant := 16#4#;           -- oleauto.h:899
    DISPID_UNKNOWN           : constant := -1;              -- oleauto.h:1915
    DISPID_VALUE             : constant := 0;               -- oleauto.h:1919
    DISPID_PROPERTYPUT       : constant := -3;              -- oleauto.h:1925
    DISPID_NEWENUM           : constant := -4;              -- oleauto.h:1929
    DISPID_EVALUATE          : constant := -5;              -- oleauto.h:1933
    DISPID_CONSTRUCTOR       : constant := -6;              -- oleauto.h:1936
    DISPID_DESTRUCTOR        : constant := -7;              -- oleauto.h:1939
    VARIANT_NOVALUEPROP      : constant := 1;               -- oleauto.h:4004
    VAR_TIMEVALUEONLY        : constant := 16#1#;           -- oleauto.h:4027
    VAR_DATEVALUEONLY        : constant := 16#2#;           -- oleauto.h:4028
    MEMBERID_NIL             : constant := -1;              -- oleauto.h:4145
    ID_DEFAULTINST           : constant := -2;              -- oleauto.h:4146
    IDLFLAG_NONE             : constant := 0;               -- oleauto.h:4149
    IDLFLAG_FIN              : constant := 16#1#;           -- oleauto.h:4150
    IDLFLAG_FOUT             : constant := 16#2#;           -- oleauto.h:4151
    IDLFLAG_FLCID            : constant := 16#4#;           -- oleauto.h:4152
    IDLFLAG_FRETVAL          : constant := 16#8#;           -- oleauto.h:4153
    DISPATCH_METHOD          : constant := 16#1#;           -- oleauto.h:4157
    DISPATCH_PROPERTYGET     : constant := 16#2#;           -- oleauto.h:4158
    DISPATCH_PROPERTYPUT     : constant := 16#4#;           -- oleauto.h:4159
    DISPATCH_PROPERTYPUTREF  : constant := 16#8#;           -- oleauto.h:4160
    ACTIVEOBJECT_STRONG      : constant := 16#0#;           -- oleauto.h:4339
    ACTIVEOBJECT_WEAK        : constant := 16#1#;           -- oleauto.h:4340

    type DATE is new Win32.DOUBLE;                          -- oleauto.h:330
    type PDATE is access all DATE;
    type VARIANT_BOOL is new Win32.SHORT;                   -- oleauto.h:347
    type PVARIANT_BOOL is access all VARIANT_BOOL;

    type VARENUM is (                                       -- oleauto.h:405
        VT_EMPTY,                                           -- oleauto.h:406
        VT_NULL,                                            -- oleauto.h:407
        VT_I2,                                              -- oleauto.h:408
        VT_I4,                                              -- oleauto.h:409
        VT_R4,                                              -- oleauto.h:410
        VT_R8,                                              -- oleauto.h:411
        VT_CY,                                              -- oleauto.h:412
        VT_DATE,                                            -- oleauto.h:413
        VT_BSTR,                                            -- oleauto.h:414
        VT_DISPATCH,                                        -- oleauto.h:415
        VT_ERROR,                                           -- oleauto.h:416
        VT_BOOL,                                            -- oleauto.h:417
        VT_VARIANT,                                         -- oleauto.h:418
        VT_UNKNOWN,                                         -- oleauto.h:419
        VT_I1,                                              -- oleauto.h:420
        VT_UI1,                                             -- oleauto.h:421
        VT_UI2,                                             -- oleauto.h:422
        VT_UI4,                                             -- oleauto.h:423
        VT_I8,                                              -- oleauto.h:424
        VT_UI8,                                             -- oleauto.h:425
        VT_INT,                                             -- oleauto.h:426
        VT_UINT,                                            -- oleauto.h:427
        VT_VOID,                                            -- oleauto.h:428
        VT_HRESULT,                                         -- oleauto.h:429
        VT_PTR,                                             -- oleauto.h:430
        VT_SAFEARRAY,                                       -- oleauto.h:431
        VT_CARRAY,                                          -- oleauto.h:432
        VT_USERDEFINED,                                     -- oleauto.h:433
        VT_LPSTR,                                           -- oleauto.h:434
        VT_LPWSTR,                                          -- oleauto.h:435
        VT_FILETIME,                                        -- oleauto.h:436
        VT_BLOB,                                            -- oleauto.h:437
        VT_STREAM,                                          -- oleauto.h:438
        VT_STORAGE,                                         -- oleauto.h:439
        VT_STREAMED_OBJECT,                                 -- oleauto.h:440
        VT_STORED_OBJECT,                                   -- oleauto.h:441
        VT_BLOB_OBJECT,                                     -- oleauto.h:442
        VT_CF,                                              -- oleauto.h:443
        VT_CLSID                                            -- oleauto.h:445
    );
    for VARENUM use (                                       -- oleauto.h:405
        VT_EMPTY => 0,                                      -- oleauto.h:406
        VT_NULL => 1,                                       -- oleauto.h:407
        VT_I2 => 2,                                         -- oleauto.h:408
        VT_I4 => 3,                                         -- oleauto.h:409
        VT_R4 => 4,                                         -- oleauto.h:410
        VT_R8 => 5,                                         -- oleauto.h:411
        VT_CY => 6,                                         -- oleauto.h:412
        VT_DATE => 7,                                       -- oleauto.h:413
        VT_BSTR => 8,                                       -- oleauto.h:414
        VT_DISPATCH => 9,                                   -- oleauto.h:415
        VT_ERROR => 10,                                     -- oleauto.h:416
        VT_BOOL => 11,                                      -- oleauto.h:417
        VT_VARIANT => 12,                                   -- oleauto.h:418
        VT_UNKNOWN => 13,                                   -- oleauto.h:419
        VT_I1 => 16,                                        -- oleauto.h:420
        VT_UI1 => 17,                                       -- oleauto.h:421
        VT_UI2 => 18,                                       -- oleauto.h:422
        VT_UI4 => 19,                                       -- oleauto.h:423
        VT_I8 => 20,                                        -- oleauto.h:424
        VT_UI8 => 21,                                       -- oleauto.h:425
        VT_INT => 22,                                       -- oleauto.h:426
        VT_UINT => 23,                                      -- oleauto.h:427
        VT_VOID => 24,                                      -- oleauto.h:428
        VT_HRESULT => 25,                                   -- oleauto.h:429
        VT_PTR => 26,                                       -- oleauto.h:430
        VT_SAFEARRAY => 27,                                 -- oleauto.h:431
        VT_CARRAY => 28,                                    -- oleauto.h:432
        VT_USERDEFINED => 29,                               -- oleauto.h:433
        VT_LPSTR => 30,                                     -- oleauto.h:434
        VT_LPWSTR => 31,                                    -- oleauto.h:435
        VT_FILETIME => 64,                                  -- oleauto.h:436
        VT_BLOB => 65,                                      -- oleauto.h:437
        VT_STREAM => 66,                                    -- oleauto.h:438
        VT_STORAGE => 67,                                   -- oleauto.h:439
        VT_STREAMED_OBJECT => 68,                           -- oleauto.h:440
        VT_STORED_OBJECT => 69,                             -- oleauto.h:441
        VT_BLOB_OBJECT => 70,                               -- oleauto.h:442
        VT_CF => 71,                                        -- oleauto.h:443
        VT_CLSID => 72                                      -- oleauto.h:445
    );
    for VARENUM'size use 32;                                -- oleauto.h:405

    type VARTYPE is new Win32.USHORT;                       -- oleauto.h:462
    type DISPID is new Win32.LONG;                          -- oleauto.h:611
    type MEMBERID is new Win32.LONG;                        -- oleauto.h:617
    type HREFTYPE is new Win32.DWORD;                       -- oleauto.h:623
    type PROPID is new Win32.ULONG;                         -- oleauto.h:627

    type TYPEKIND is (                                      -- oleauto.h:631
        TKIND_ENUM,                                         -- oleauto.h:632
        TKIND_RECORD,                                       -- oleauto.h:633
        TKIND_MODULE,                                       -- oleauto.h:634
        TKIND_INTERFACE,                                    -- oleauto.h:635
        TKIND_DISPATCH,                                     -- oleauto.h:636
        TKIND_COCLASS,                                      -- oleauto.h:637
        TKIND_ALIAS,                                        -- oleauto.h:638
        TKIND_UNION,                                        -- oleauto.h:639
        TKIND_MAX                                           -- oleauto.h:641
    );
    for TYPEKIND'size use 32;                               -- oleauto.h:631

    type PTYPEKIND is access TYPEKIND;

    type CALLCONV is (                                      -- oleauto.h:815
        CC_CDECL,                                           -- oleauto.h:816
        CC_MSCPASCAL,                                       -- oleauto.h:817
        CC_PASCAL,                                          -- oleauto.h:818
        CC_MACPASCAL,                                       -- oleauto.h:819
        CC_STDCALL,                                         -- oleauto.h:820
        CC_RESERVED,                                        -- oleauto.h:821
        CC_SYSCALL,                                         -- oleauto.h:822
        CC_MPWCDECL,                                        -- oleauto.h:823
        CC_MPWPASCAL,                                       -- oleauto.h:824
        CC_MAX                                              -- oleauto.h:826
    );
    for CALLCONV use (                                      -- oleauto.h:815
        CC_CDECL => 1,                                      -- oleauto.h:816
        CC_MSCPASCAL => 2,                                  -- oleauto.h:817
        CC_PASCAL => 3,                                     -- oleauto.h:818
        CC_MACPASCAL => 4,                                  -- oleauto.h:819
        CC_STDCALL => 5,                                    -- oleauto.h:820
        CC_RESERVED => 6,                                   -- oleauto.h:821
        CC_SYSCALL => 7,                                    -- oleauto.h:822
        CC_MPWCDECL => 8,                                   -- oleauto.h:823
        CC_MPWPASCAL => 9,                                  -- oleauto.h:824
        CC_MAX => 10                                        -- oleauto.h:826
    );
    for CALLCONV'size use 32;                               -- oleauto.h:815

    type PCALLCONV is access CALLCONV;

    type FUNCKIND is (                                      -- oleauto.h:834
        FUNC_VIRTUAL,                                       -- oleauto.h:835
        FUNC_PUREVIRTUAL,                                   -- oleauto.h:836
        FUNC_NONVIRTUAL,                                    -- oleauto.h:837
        FUNC_STATIC,                                        -- oleauto.h:838
        FUNC_DISPATCH                                       -- oleauto.h:840
    );
    for FUNCKIND'size use 32;                               -- oleauto.h:834
  
    type PFUNCKIND is access FUNCKIND;

    type INVOKEKIND is (                                    -- oleauto.h:848
        INVOKE_FUNC,                                        -- oleauto.h:849
        INVOKE_PROPERTYGET,                                 -- oleauto.h:850
        INVOKE_PROPERTYPUT,                                 -- oleauto.h:851
        INVOKE_PROPERTYPUTREF                               -- oleauto.h:853
    );
    for INVOKEKIND use (                                    -- oleauto.h:848
        INVOKE_FUNC => 1,                                   -- oleauto.h:849
        INVOKE_PROPERTYGET => 2,                            -- oleauto.h:850
        INVOKE_PROPERTYPUT => 4,                            -- oleauto.h:851
        INVOKE_PROPERTYPUTREF => 8                          -- oleauto.h:853
    );
    for INVOKEKIND'size use 32;                             -- oleauto.h:848

    type PINVOKEKIND is access INVOKEKIND;

    type VARKIND is (                                       -- oleauto.h:881
        VAR_PERINSTANCE,                                    -- oleauto.h:882
        VAR_STATIC,                                         -- oleauto.h:883
        VAR_CONST,                                          -- oleauto.h:884
        VAR_DISPATCH                                        -- oleauto.h:886
    );
    for VARKIND'size use 32;                                -- oleauto.h:881

    type PVARKIND is access VARKIND;

    type TYPEFLAGS is (                                     -- oleauto.h:924
        TYPEFLAG_FAPPOBJECT,                                -- oleauto.h:925
        TYPEFLAG_FCANCREATE,                                -- oleauto.h:926
        TYPEFLAG_FLICENSED,                                 -- oleauto.h:927
        TYPEFLAG_FPREDECLID,                                -- oleauto.h:928
        TYPEFLAG_FHIDDEN,                                   -- oleauto.h:929
        TYPEFLAG_FCONTROL,                                  -- oleauto.h:930
        TYPEFLAG_FDUAL,                                     -- oleauto.h:931
        TYPEFLAG_FNONEXTENSIBLE,                            -- oleauto.h:932
        TYPEFLAG_FOLEAUTOMATION                             -- oleauto.h:934
    );
    for TYPEFLAGS use (                                     -- oleauto.h:924
        TYPEFLAG_FAPPOBJECT => 1,                           -- oleauto.h:925
        TYPEFLAG_FCANCREATE => 2,                           -- oleauto.h:926
        TYPEFLAG_FLICENSED => 4,                            -- oleauto.h:927
        TYPEFLAG_FPREDECLID => 8,                           -- oleauto.h:928
        TYPEFLAG_FHIDDEN => 16,                             -- oleauto.h:929
        TYPEFLAG_FCONTROL => 32,                            -- oleauto.h:930
        TYPEFLAG_FDUAL => 64,                               -- oleauto.h:931
        TYPEFLAG_FNONEXTENSIBLE => 128,                     -- oleauto.h:932
        TYPEFLAG_FOLEAUTOMATION => 256                      -- oleauto.h:934
    );
    for TYPEFLAGS'size use 32;                              -- oleauto.h:924

    type FUNCFLAGS is (                                     -- oleauto.h:942
        FUNCFLAG_FRESTRICTED,                               -- oleauto.h:943
        FUNCFLAG_FSOURCE,                                   -- oleauto.h:944
        FUNCFLAG_FBINDABLE,                                 -- oleauto.h:945
        FUNCFLAG_FREQUESTEDIT,                              -- oleauto.h:946
        FUNCFLAG_FDISPLAYBIND,                              -- oleauto.h:947
        FUNCFLAG_FDEFAULTBIND,                              -- oleauto.h:948
        FUNCFLAG_FHIDDEN                                    -- oleauto.h:950
    );
    for FUNCFLAGS use (                                     -- oleauto.h:942
        FUNCFLAG_FRESTRICTED => 1,                          -- oleauto.h:943
        FUNCFLAG_FSOURCE => 2,                              -- oleauto.h:944
        FUNCFLAG_FBINDABLE => 4,                            -- oleauto.h:945
        FUNCFLAG_FREQUESTEDIT => 8,                         -- oleauto.h:946
        FUNCFLAG_FDISPLAYBIND => 16,                        -- oleauto.h:947
        FUNCFLAG_FDEFAULTBIND => 32,                        -- oleauto.h:948
        FUNCFLAG_FHIDDEN => 64                              -- oleauto.h:950
    );
    for FUNCFLAGS'size use 32;                              -- oleauto.h:942

    type VARFLAGS is (                                      -- oleauto.h:958
        VARFLAG_FREADONLY,                                  -- oleauto.h:959
        VARFLAG_FSOURCE,                                    -- oleauto.h:960
        VARFLAG_FBINDABLE,                                  -- oleauto.h:961
        VARFLAG_FREQUESTEDIT,                               -- oleauto.h:962
        VARFLAG_FDISPLAYBIND,                               -- oleauto.h:963
        VARFLAG_FDEFAULTBIND,                               -- oleauto.h:964
        VARFLAG_FHIDDEN                                     -- oleauto.h:966
    );
    for VARFLAGS use (                                      -- oleauto.h:958
        VARFLAG_FREADONLY => 1,                             -- oleauto.h:959
        VARFLAG_FSOURCE => 2,                               -- oleauto.h:960
        VARFLAG_FBINDABLE => 4,                             -- oleauto.h:961
        VARFLAG_FREQUESTEDIT => 8,                          -- oleauto.h:962
        VARFLAG_FDISPLAYBIND => 16,                         -- oleauto.h:963
        VARFLAG_FDEFAULTBIND => 32,                         -- oleauto.h:964
        VARFLAG_FHIDDEN => 64                               -- oleauto.h:966
    );
    for VARFLAGS'size use 32;                               -- oleauto.h:958

    type DESCKIND is (                                      -- oleauto.h:2307
        DESCKIND_NONE,                                      -- oleauto.h:2308
        DESCKIND_FUNCDESC,                                  -- oleauto.h:2309
        DESCKIND_VARDESC,                                   -- oleauto.h:2310
        DESCKIND_TYPECOMP,                                  -- oleauto.h:2311
        DESCKIND_IMPLICITAPPOBJ,                            -- oleauto.h:2312
        DESCKIND_MAX                                        -- oleauto.h:2314
    );
    for DESCKIND'size use 32;                               -- oleauto.h:2307

    type PDESCKIND is access DESCKIND;

    type SYSKIND is (                                       -- oleauto.h:3052
        SYS_WIN16,                                          -- oleauto.h:3053
        SYS_WIN32,                                          -- oleauto.h:3054
        SYS_MAC                                             -- oleauto.h:3056
    );
    for SYSKIND'size use 32;                                -- oleauto.h:3052

    type PSYSKIND is access SYSKIND;

    type LIBFLAGS is (                                      -- oleauto.h:3060
        LIBFLAG_FRESTRICTED,                                -- oleauto.h:3061
        LIBFLAG_FCONTROL,                                   -- oleauto.h:3062
        LIBFLAG_FHIDDEN                                     -- oleauto.h:3064
    );
    for LIBFLAGS use (                                      -- oleauto.h:3060
        LIBFLAG_FRESTRICTED => 1,                           -- oleauto.h:3061
        LIBFLAG_FCONTROL => 2,                              -- oleauto.h:3062
        LIBFLAG_FHIDDEN => 4                                -- oleauto.h:3064
    );
    for LIBFLAGS'size use 32;                               -- oleauto.h:3060

    type BSTR is access all Win32.Objbase.OLECHAR;          -- oleauto.h:218
    type LPBSTR is access all BSTR;                         -- oleauto.h:221

    type ICreateTypeInfo;                                   -- oleauto.h:114
    type ICreateTypeLib;                                    -- oleauto.h:120
    type IDispatch;                                         -- oleauto.h:126
    type IEnumVARIANT;                                      -- oleauto.h:132
    type ITypeComp;                                         -- oleauto.h:138
    type ITypeInfo;                                         -- oleauto.h:144
    type ITypeLib;                                          -- oleauto.h:150
    type IErrorInfo;                                        -- oleauto.h:156
    type ICreateErrorInfo;                                  -- oleauto.h:162
    type ISupportErrorInfo;                                 -- oleauto.h:168
    type XBSTR;                                             -- oleauto.h:211
    type BLOB;                                              -- oleauto.h:228
    type CLIPDATA;                                          -- oleauto.h:242
    type SAFEARRAYBOUND;                                    -- oleauto.h:255
    type SAFEARRAY;                                         -- oleauto.h:286
    type CY;                                                -- oleauto.h:336
    type union_anonymous4_t;                                -- oleauto.h:582
    type union_anonymous5_t;                                -- oleauto.h:661
    type IDLDESC;                                           -- oleauto.h:692
    type DISPPARAMS;                                        -- oleauto.h:760
    type RemEXCEPINFO;                                      -- oleauto.h:769
    type EXCEPINFO;                                         -- oleauto.h:809
    type union_anonymous6_t;                                -- oleauto.h:910
    type ICreateTypeInfoVtbl;                               -- oleauto.h:1085
    type ICreateTypeLibVtbl;                                -- oleauto.h:1657
    type IDispatchVtbl;                                     -- oleauto.h:1978
    type IEnumVARIANTVtbl;                                  -- oleauto.h:2166
    type BINDPTR;                                           -- oleauto.h:2321
    type ITypeCompVtbl;                                     -- oleauto.h:2360
    type ITypeInfoVtbl;                                     -- oleauto.h:2574
    type TLIBATTR;                                          -- oleauto.h:3074
    type ITypeLibVtbl;                                      -- oleauto.h:3141
    type IErrorInfoVtbl;                                    -- oleauto.h:3443
    type ICreateErrorInfoVtbl;                              -- oleauto.h:3626
    type ISupportErrorInfoVtbl;                             -- oleauto.h:3797
    type PARAMDATA;                                         -- oleauto.h:4259
    type METHODDATA;                                        -- oleauto.h:4264
    type INTERFACEDATA;                                     -- oleauto.h:4275
    type VARIANT;                                           -- oleauto.h:467
    type TYPEDESC;                                          -- oleauto.h:658
    type ELEMDESC;                                          -- oleauto.h:718
    type TYPEATTR;                                          -- oleauto.h:733
    type FUNCDESC;                                          -- oleauto.h:860
    type VARDESC;                                           -- oleauto.h:902
    type ARRAYDESC;                                         -- oleauto.h:659

    type LPBLOB is access all BLOB;                         -- oleauto.h:235
    type LPSAFEARRAYBOUND is access all SAFEARRAYBOUND;     -- oleauto.h:262
    type a_TYPEDESC_T is access all TYPEDESC;               -- oleauto.h:658
    type a_ARRAYDESC_T is access all ARRAYDESC;             -- oleauto.h:659
    type LPSAFEARRAY is access all SAFEARRAY;               -- oleauto.h:299
    type PCY is access all CY;                              -- oleauto.h:574
    type PLPSAFEARRAY is access all LPSAFEARRAY;            -- oleauto.h:579
    type LPVARIANT is access all VARIANT;                   -- oleauto.h:593
    subtype LPVARIANTARG is LPVARIANT;                      -- oleauto.h:605
    type LPIDLDESC is access all IDLDESC;                   -- oleauto.h:699
    type LPELEMDESC is access all ELEMDESC;                 -- oleauto.h:725
    type LPTYPEATTR is access all TYPEATTR;                 -- oleauto.h:756
    type LPEXCEPINFO is access all EXCEPINFO;               -- oleauto.h:811
    type LPFUNCDESC is access all FUNCDESC;                 -- oleauto.h:877
    type LPVARDESC is access all VARDESC;                   -- oleauto.h:917
    type LPCREATETYPEINFO is access all ICreateTypeInfo;    -- oleauto.h:987
    type a_ICreateTypeInfoVtbl_t is access all ICreateTypeInfoVtbl;
                                                            -- oleauto.h:1210
    type LPCREATETYPELIB is access all ICreateTypeLib;      -- oleauto.h:1611
    type a_ICreateTypeLibVtbl_t is access all ICreateTypeLibVtbl;
                                                            -- oleauto.h:1717
    type LPDISPATCH is access all IDispatch;                -- oleauto.h:1910
    type a_LPDISPATCH_t is access all LPDISPATCH;           -- oleauto.h:578
    type a_IDispatchVtbl_t is access all IDispatchVtbl;     -- oleauto.h:2025
    type LPENUMVARIANT is access all IEnumVARIANT;          -- oleauto.h:2139
    type a_IEnumVARIANTVtbl_t is access all IEnumVARIANTVtbl;
                                                            -- oleauto.h:2201
    type LPTYPECOMP is access all ITypeComp;                -- oleauto.h:2303
    type LPBINDPTR is access all BINDPTR;                   -- oleauto.h:2332
    type a_ITypeCompVtbl_t is access all ITypeCompVtbl;     -- oleauto.h:2394
    type LPTYPEINFO is access all ITypeInfo;                -- oleauto.h:2473
    type a_ITypeInfoVtbl_t is access all ITypeInfoVtbl;     -- oleauto.h:2698
    type LPTYPELIB is access all ITypeLib;                  -- oleauto.h:3071
    type LPTLIBATTR is access all TLIBATTR;                 -- oleauto.h:3085
    type a_ITypeLibVtbl_t is access all ITypeLibVtbl;       -- oleauto.h:3211
    type LPERRORINFO is access all IErrorInfo;              -- oleauto.h:3414
    type a_IErrorInfoVtbl_t is access all IErrorInfoVtbl;   -- oleauto.h:3481
    type LPCREATEERRORINFO is access all ICreateErrorInfo;  -- oleauto.h:3597
    type a_ICreateErrorInfoVtbl_t is access all ICreateErrorInfoVtbl;
                                                            -- oleauto.h:3664
    type LPSUPPORTERRORINFO is access all ISupportErrorInfo;-- oleauto.h:3780
    type a_ISupportErrorInfoVtbl_t is access all ISupportErrorInfoVtbl;
                                                            -- oleauto.h:3819
    type LPPARAMDATA is access all PARAMDATA;               -- oleauto.h:4262
    type LPMETHODDATA is access all METHODDATA;             -- oleauto.h:4273
    type LPINTERFACEDATA is access all INTERFACEDATA;       -- oleauto.h:4278


    type af_809_pfnDeferredFillIn is access function (
                p1: access EXCEPINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:809
    pragma Convention(Stdcall, af_809_pfnDeferredFillIn);

    type af_1088_QueryInterface is access function (
                This     : access ICreateTypeInfo;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1088
    pragma Convention(Stdcall, af_1088_QueryInterface);

    type af_1093_AddRef is access function (
                This: access ICreateTypeInfo)
               return Win32.ULONG;                          -- oleauto.h:1093
    pragma Convention(Stdcall, af_1093_AddRef);

    type af_1096_Release is access function (
                This: access ICreateTypeInfo)
               return Win32.ULONG;                          -- oleauto.h:1096
    pragma Convention(Stdcall, af_1096_Release);

    type af_1099_SetGuid is access function (
                This: access ICreateTypeInfo;
                guid: access Win32.Rpcdce.GUID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1099
    pragma Convention(Stdcall, af_1099_SetGuid);

    type af_1103_SetTypeFlags is access function (
                This      : access ICreateTypeInfo;
                uTypeFlags: Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1103
    pragma Convention(Stdcall, af_1103_SetTypeFlags);

    type af_1107_SetDocString is access function (
                This    : access ICreateTypeInfo;
                lpstrDoc: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1107
    pragma Convention(Stdcall, af_1107_SetDocString);

    type af_1111_SetHelpContext is access function (
                This         : access ICreateTypeInfo;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1111
    pragma Convention(Stdcall, af_1111_SetHelpContext);

    type af_1115_SetVersion is access function (
                This        : access ICreateTypeInfo;
                wMajorVerNum: Win32.WORD;
                wMinorVerNum: Win32.WORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1115
    pragma Convention(Stdcall, af_1115_SetVersion);

    type af_1120_AddRefTypeInfo is access function (
                This     : access ICreateTypeInfo;
                ptinfo   : access ITypeInfo;
                phreftype: access HREFTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1120
    pragma Convention(Stdcall, af_1120_AddRefTypeInfo);

    type af_1125_AddFuncDesc is access function (
                This     : access ICreateTypeInfo;
                index    : Win32.UINT;
                pfuncdesc: access FUNCDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1125
    pragma Convention(Stdcall, af_1125_AddFuncDesc);

    type af_1130_AddImplType is access function (
                This    : access ICreateTypeInfo;
                index   : Win32.UINT;
                hreftype: Win32.Oleauto.HREFTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1130
    pragma Convention(Stdcall, af_1130_AddImplType);

    type af_1135_SetImplTypeFlags is access function (
                This         : access ICreateTypeInfo;
                index        : Win32.UINT;
                impltypeflags: Win32.INT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1135
    pragma Convention(Stdcall, af_1135_SetImplTypeFlags);

    type af_1140_SetAlignment is access function (
                This       : access ICreateTypeInfo;
                cbAlignment: Win32.WORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1140
    pragma Convention(Stdcall, af_1140_SetAlignment);

    type af_1144_SetSchema is access function (
                This       : access ICreateTypeInfo;
                lpstrSchema: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1144
    pragma Convention(Stdcall, af_1144_SetSchema);

    type af_1148_AddVarDesc is access function (
                This    : access ICreateTypeInfo;
                index   : Win32.UINT;
                pvardesc: access VARDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1148
    pragma Convention(Stdcall, af_1148_AddVarDesc);

    type af_1153_SetFuncAndParamNames is access function (
                This     : access ICreateTypeInfo;
                index    : Win32.UINT;
                rgszNames: access Win32.Objbase.LPOLESTR;
                cNames   : Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1153
    pragma Convention(Stdcall, af_1153_SetFuncAndParamNames);

    type af_1159_SetVarName is access function (
                This  : access ICreateTypeInfo;
                index : Win32.UINT;
                szName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1159
    pragma Convention(Stdcall, af_1159_SetVarName);

    type af_1164_SetTypeDescAlias is access function (
                This       : access ICreateTypeInfo;
                ptdescAlias: access TYPEDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1164
    pragma Convention(Stdcall, af_1164_SetTypeDescAlias);

    type af_1168_DefineFuncAsDllEntry is access function (
                This      : access ICreateTypeInfo;
                index     : Win32.UINT;
                szDllName : Win32.Objbase.LPOLESTR;
                szProcName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1168
    pragma Convention(Stdcall, af_1168_DefineFuncAsDllEntry);

    type af_1174_SetFuncDocString is access function (
                This       : access ICreateTypeInfo;
                index      : Win32.UINT;
                szDocString: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1174
    pragma Convention(Stdcall, af_1174_SetFuncDocString);

    type af_1179_SetVarDocString is access function (
                This       : access ICreateTypeInfo;
                index      : Win32.UINT;
                szDocString: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1179
    pragma Convention(Stdcall, af_1179_SetVarDocString);

    type af_1184_SetFuncHelpContext is access function (
                This         : access ICreateTypeInfo;
                index        : Win32.UINT;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1184
    pragma Convention(Stdcall, af_1184_SetFuncHelpContext);

    type af_1189_SetVarHelpContext is access function (
                This         : access ICreateTypeInfo;
                index        : Win32.UINT;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1189
    pragma Convention(Stdcall, af_1189_SetVarHelpContext);

    type af_1194_SetMops is access function (
                This    : access ICreateTypeInfo;
                index   : Win32.UINT;
                bstrMops: BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1194
    pragma Convention(Stdcall, af_1194_SetMops);

    type af_1199_SetTypeIdldesc is access function (
                This    : access ICreateTypeInfo;
                pidldesc: access IDLDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1199
    pragma Convention(Stdcall, af_1199_SetTypeIdldesc);

    type af_1203_LayOut is access function (
                This: access ICreateTypeInfo)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1203
    pragma Convention(Stdcall, af_1203_LayOut);

    type af_1660_QueryInterface is access function (
                This     : access ICreateTypeLib;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1660
    pragma Convention(Stdcall, af_1660_QueryInterface);

    type af_1665_AddRef is access function (
                This: access ICreateTypeLib)
               return Win32.ULONG;                          -- oleauto.h:1665
    pragma Convention(Stdcall, af_1665_AddRef);

    type af_1668_Release is access function (
                This: access ICreateTypeLib)
               return Win32.ULONG;                          -- oleauto.h:1668
    pragma Convention(Stdcall, af_1668_Release);

    type af_1671_CreateTypeInfo is access function (
                This       : access ICreateTypeLib;
                szName     : Win32.Objbase.LPOLESTR;
                tkind      : TYPEKIND;
                lplpictinfo: access LPCREATETYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1671
    pragma Convention(Stdcall, af_1671_CreateTypeInfo);

    type af_1677_SetName is access function (
                This  : access ICreateTypeLib;
                szName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1677
    pragma Convention(Stdcall, af_1677_SetName);

    type af_1681_SetVersion is access function (
                This        : access ICreateTypeLib;
                wMajorVerNum: Win32.WORD;
                wMinorVerNum: Win32.WORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1681
    pragma Convention(Stdcall, af_1681_SetVersion);

    type af_1686_SetGuid is access function (
                This: access ICreateTypeLib;
                guid: access Win32.Rpcdce.GUID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1686
    pragma Convention(Stdcall, af_1686_SetGuid);

    type af_1690_SetDocString is access function (
                This : access ICreateTypeLib;
                szDoc: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1690
    pragma Convention(Stdcall, af_1690_SetDocString);

    type af_1694_SetHelpFileName is access function (
                This          : access ICreateTypeLib;
                szHelpFileName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1694
    pragma Convention(Stdcall, af_1694_SetHelpFileName);

    type af_1698_SetHelpContext is access function (
                This         : access ICreateTypeLib;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1698
    pragma Convention(Stdcall, af_1698_SetHelpContext);

    type af_1702_SetLcid is access function (
                This: access ICreateTypeLib;
                lcid: Win32.Winnt.LCID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1702
    pragma Convention(Stdcall, af_1702_SetLcid);

    type af_1706_SetLibFlags is access function (
                This     : access ICreateTypeLib;
                uLibFlags: Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1706
    pragma Convention(Stdcall, af_1706_SetLibFlags);

    type af_1710_SaveAllChanges is access function (
                This: access ICreateTypeLib)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1710
    pragma Convention(Stdcall, af_1710_SaveAllChanges);

    type af_1981_QueryInterface is access function (
                This     : access IDispatch;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1981
    pragma Convention(Stdcall, af_1981_QueryInterface);

    type af_1986_AddRef is access function (
                This: access IDispatch)
               return Win32.ULONG;                          -- oleauto.h:1986
    pragma Convention(Stdcall, af_1986_AddRef);

    type af_1989_Release is access function (
                This: access IDispatch)
               return Win32.ULONG;                          -- oleauto.h:1989
    pragma Convention(Stdcall, af_1989_Release);

    type af_1992_GetTypeInfoCount is access function (
                This   : access IDispatch;
                pctinfo: access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1992
    pragma Convention(Stdcall, af_1992_GetTypeInfoCount);

    type af_1996_GetTypeInfo is access function (
                This   : access IDispatch;
                itinfo : Win32.UINT;
                lcid   : Win32.Winnt.LCID;
                pptinfo: access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1996
    pragma Convention(Stdcall, af_1996_GetTypeInfo);

    type af_2002_GetIDsOfNames is access function (
                This     : access IDispatch;
                riid     : access Win32.Objbase.IID;
                rgszNames: access Win32.Objbase.LPOLESTR;
                cNames   : Win32.UINT;
                lcid     : Win32.Winnt.LCID;
                rgdispid : access DISPID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2002
    pragma Convention(Stdcall, af_2002_GetIDsOfNames);

    type af_2010_Invoke is access function (
                This        : access IDispatch;
                dispidMember: DISPID;
                riid        : access Win32.Objbase.IID;
                lcid        : Win32.Winnt.LCID;
                wFlags      : Win32.WORD;
                pdispparams : access DISPPARAMS;
                pvarResult  : access VARIANT;
                pexcepinfo  : access EXCEPINFO;
                puArgErr    : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2010
    pragma Convention(Stdcall, af_2010_Invoke);

    type af_2169_QueryInterface is access function (
                This     : access IEnumVARIANT;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2169
    pragma Convention(Stdcall, af_2169_QueryInterface);

    type af_2174_AddRef is access function (
                This: access IEnumVARIANT)
               return Win32.ULONG;                          -- oleauto.h:2174
    pragma Convention(Stdcall, af_2174_AddRef);

    type af_2177_Release is access function (
                This: access IEnumVARIANT)
               return Win32.ULONG;                          -- oleauto.h:2177
    pragma Convention(Stdcall, af_2177_Release);

    type af_2180_Next is access function (
                This        : access IEnumVARIANT;
                celt        : Win32.ULONG;
                rgvar       : access VARIANT;
                pceltFetched: access Win32.ULONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2180
    pragma Convention(Stdcall, af_2180_Next);

    type af_2186_Skip is access function (
                This: access IEnumVARIANT;
                celt: Win32.ULONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2186
    pragma Convention(Stdcall, af_2186_Skip);

    type af_2190_Reset is access function (
                This: access IEnumVARIANT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2190
    pragma Convention(Stdcall, af_2190_Reset);

    type af_2193_Clone is access function (
                This  : access IEnumVARIANT;
                ppenum: access LPENUMVARIANT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2193
    pragma Convention(Stdcall, af_2193_Clone);

    type af_2363_QueryInterface is access function (
                This     : access ITypeComp;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2363
    pragma Convention(Stdcall, af_2363_QueryInterface);

    type af_2368_AddRef is access function (
                This: access ITypeComp)
               return Win32.ULONG;                          -- oleauto.h:2368
    pragma Convention(Stdcall, af_2368_AddRef);

    type af_2371_Release is access function (
                This: access ITypeComp)
               return Win32.ULONG;                          -- oleauto.h:2371
    pragma Convention(Stdcall, af_2371_Release);

    type af_2374_Bind is access function (
                This     : access ITypeComp;
                szName   : Win32.Objbase.LPOLESTR;
                lHashVal : Win32.ULONG;
                fFlags   : Win32.WORD;
                pptinfo  : access LPTYPEINFO;
                pdesckind: access DESCKIND;
                pbindptr : access BINDPTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2374
    pragma Convention(Stdcall, af_2374_Bind);

    type af_2383_BindType is access function (
                This    : access ITypeComp;
                szName  : Win32.Objbase.LPOLESTR;
                lHashVal: Win32.ULONG;
                pptinfo : access LPTYPEINFO;
                pptcomp : access LPTYPECOMP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2383
    pragma Convention(Stdcall, af_2383_BindType);

    type af_2577_QueryInterface is access function (
                This     : access ITypeInfo;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2577
    pragma Convention(Stdcall, af_2577_QueryInterface);

    type af_2582_AddRef is access function (
                This: access ITypeInfo)
               return Win32.ULONG;                          -- oleauto.h:2582
    pragma Convention(Stdcall, af_2582_AddRef);

    type af_2585_Release is access function (
                This: access ITypeInfo)
               return Win32.ULONG;                          -- oleauto.h:2585
    pragma Convention(Stdcall, af_2585_Release);

    type af_2588_GetTypeAttr is access function (
                This      : access ITypeInfo;
                pptypeattr: access LPTYPEATTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2588
    pragma Convention(Stdcall, af_2588_GetTypeAttr);

    type af_2592_GetTypeComp is access function (
                This   : access ITypeInfo;
                pptcomp: access LPTYPECOMP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2592
    pragma Convention(Stdcall, af_2592_GetTypeComp);

    type af_2596_GetFuncDesc is access function (
                This       : access ITypeInfo;
                index      : Win32.UINT;
                pppfuncdesc: access FUNCDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2596
    pragma Convention(Stdcall, af_2596_GetFuncDesc);

    type af_2601_GetVarDesc is access function (
                This     : access ITypeInfo;
                index    : Win32.UINT;
                ppvardesc: access LPVARDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2601
    pragma Convention(Stdcall, af_2601_GetVarDesc);

    type af_2606_GetNames is access function (
                This       : access ITypeInfo;
                memid      : MEMBERID;
                rgbstrNames: access BSTR;
                cMaxNames  : Win32.UINT;
                pcNames    : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2606
    pragma Convention(Stdcall, af_2606_GetNames);

    type af_2613_GetRefTypeOfImplType is access function (
                This     : access ITypeInfo;
                index    : Win32.UINT;
                hpreftype: access HREFTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2613
    pragma Convention(Stdcall, af_2613_GetRefTypeOfImplType);

    type af_2618_GetImplTypeFlags is access function (
                This          : access ITypeInfo;
                index         : Win32.UINT;
                pimpltypeflags: access Win32.INT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2618
    pragma Convention(Stdcall, af_2618_GetImplTypeFlags);

    type af_2623_GetIDsOfNames is access function (
                This       : access ITypeInfo;
                rglpszNames: access Win32.PWSTR;
                cNames     : Win32.UINT;
                rgmemid    : access MEMBERID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2623
    pragma Convention(Stdcall, af_2623_GetIDsOfNames);

    type af_2629_Invoke is access function (
                This       : access ITypeInfo;
                pvInstance : Win32.PVOID;
                memid      : MEMBERID;
                wFlags     : Win32.WORD;
                pdispparams: access DISPPARAMS;
                pvarResult : access VARIANT;
                pexcepinfo : access EXCEPINFO;
                puArgErr   : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2629
    pragma Convention(Stdcall, af_2629_Invoke);

    type af_2639_GetDocumentation is access function (
                This          : access ITypeInfo;
                memid         : MEMBERID;
                pbstrName     : access BSTR;
                pbstrDocString: access BSTR;
                pdwHelpContext: access Win32.DWORD;
                pbstrHelpFile : access BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2639
    pragma Convention(Stdcall, af_2639_GetDocumentation);

    type af_2647_GetDllEntry is access function (
                This        : access ITypeInfo;
                memid       : MEMBERID;
                invkind     : INVOKEKIND;
                pbstrDllName: access BSTR;
                pbstrName   : access BSTR;
                pwOrdinal   : access Win32.WORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2647
    pragma Convention(Stdcall, af_2647_GetDllEntry);

    type af_2655_GetRefTypeInfo is access function (
                This    : access ITypeInfo;
                hreftype: Win32.Oleauto.HREFTYPE;
                pptinfo : access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2655
    pragma Convention(Stdcall, af_2655_GetRefTypeInfo);

    type af_2660_AddressOfMember is access function (
                This   : access ITypeInfo;
                memid  : MEMBERID;
                invkind: INVOKEKIND;
                ppv    : access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2660
    pragma Convention(Stdcall, af_2660_AddressOfMember);

    type af_2666_CreateInstance is access function (
                This     : access ITypeInfo;
                puncOuter: access Win32.Objbase.IUnknown;
                riid     : access Win32.Objbase.IID;
                ppvObj   : access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2666
    pragma Convention(Stdcall, af_2666_CreateInstance);

    type af_2672_GetMops is access function (
                This     : access ITypeInfo;
                memid    : MEMBERID;
                pbstrMops: access BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2672
    pragma Convention(Stdcall, af_2672_GetMops);

    type af_2677_GetContainingTypeLib is access function (
                This  : access ITypeInfo;
                pptlib: access LPTYPELIB;
                pindex: access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2677
    pragma Convention(Stdcall, af_2677_GetContainingTypeLib);

    type ap_2682_ReleaseTypeAttr is access procedure (
                This     : access ITypeInfo;
                ptypeattr: access TYPEATTR);                -- oleauto.h:2682
    pragma Convention(Stdcall, ap_2682_ReleaseTypeAttr);

    type ap_2686_ReleaseFuncDesc is access procedure (
                This     : access ITypeInfo;
                pfuncdesc: access FUNCDESC);                -- oleauto.h:2686
    pragma Convention(Stdcall, ap_2686_ReleaseFuncDesc);

    type ap_2690_ReleaseVarDesc is access procedure (
                This    : access ITypeInfo;
                pvardesc: access VARDESC);                  -- oleauto.h:2690
    pragma Convention(Stdcall, ap_2690_ReleaseVarDesc);

    type af_3144_QueryInterface is access function (
                This     : access ITypeLib;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3144
    pragma Convention(Stdcall, af_3144_QueryInterface);

    type af_3149_AddRef is access function (
                This: access ITypeLib)
               return Win32.ULONG;                          -- oleauto.h:3149
    pragma Convention(Stdcall, af_3149_AddRef);

    type af_3152_Release is access function (
                This: access ITypeLib)
               return Win32.ULONG;                          -- oleauto.h:3152
    pragma Convention(Stdcall, af_3152_Release);

    type af_3155_GetTypeInfoCount is access function (
                This: access ITypeLib)
               return Win32.UINT;                           -- oleauto.h:3155
    pragma Convention(Stdcall, af_3155_GetTypeInfoCount);

    type af_3158_GetTypeInfo is access function (
                This    : access ITypeLib;
                index   : Win32.UINT;
                ppitinfo: access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3158
    pragma Convention(Stdcall, af_3158_GetTypeInfo);

    type af_3163_GetTypeInfoType is access function (
                This  : access ITypeLib;
                index : Win32.UINT;
                ptkind: access TYPEKIND)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3163
    pragma Convention(Stdcall, af_3163_GetTypeInfoType);

    type af_3168_GetTypeInfoOfGuid is access function (
                This   : access ITypeLib;
                guid   : access Win32.Rpcdce.GUID;
                pptinfo: access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3168
    pragma Convention(Stdcall, af_3168_GetTypeInfoOfGuid);

    type af_3173_GetLibAttr is access function (
                This      : access ITypeLib;
                pptlibattr: access LPTLIBATTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3173
    pragma Convention(Stdcall, af_3173_GetLibAttr);

    type af_3177_GetTypeComp is access function (
                This   : access ITypeLib;
                pptcomp: access LPTYPECOMP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3177
    pragma Convention(Stdcall, af_3177_GetTypeComp);

    type af_3181_GetDocumentation is access function (
                This          : access ITypeLib;
                index         : Win32.INT;
                pbstrName     : access BSTR;
                pbstrDocString: access BSTR;
                pdwHelpContext: access Win32.DWORD;
                pbstrHelpFile : access BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3181
    pragma Convention(Stdcall, af_3181_GetDocumentation);

    type af_3189_IsName is access function (
                This     : access ITypeLib;
                szNameBuf: Win32.Objbase.LPOLESTR;
                lHashVal : Win32.ULONG;
                pfName   : access Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3189
    pragma Convention(Stdcall, af_3189_IsName);

    type af_3195_FindName is access function (
                This     : access ITypeLib;
                szNameBuf: Win32.Objbase.LPOLESTR;
                lHashVal : Win32.ULONG;
                rgptinfo : access LPTYPEINFO;
                rgmemid  : access MEMBERID;
                pcFound  : access Win32.USHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3195
    pragma Convention(Stdcall, af_3195_FindName);

    type ap_3203_ReleaseTLibAttr is access procedure (
                This     : access ITypeLib;
                ptlibattr: access TLIBATTR);                -- oleauto.h:3203
    pragma Convention(Stdcall, ap_3203_ReleaseTLibAttr);

    type af_3446_QueryInterface is access function (
                This     : access IErrorInfo;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3446
    pragma Convention(Stdcall, af_3446_QueryInterface);

    type af_3451_AddRef is access function (
                This: access IErrorInfo)
               return Win32.ULONG;                          -- oleauto.h:3451
    pragma Convention(Stdcall, af_3451_AddRef);

    type af_3454_Release is access function (
                This: access IErrorInfo)
               return Win32.ULONG;                          -- oleauto.h:3454
    pragma Convention(Stdcall, af_3454_Release);

    type af_3457_GetGUID is access function (
                This : access IErrorInfo;
                pguid: access Win32.Rpcdce.GUID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3457
    pragma Convention(Stdcall, af_3457_GetGUID);

    type af_3461_GetSource is access function (
                This       : access IErrorInfo;
                pbstrSource: access BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3461
    pragma Convention(Stdcall, af_3461_GetSource);

    type af_3465_GetDescription is access function (
                This            : access IErrorInfo;
                pbstrDescription: access BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3465
    pragma Convention(Stdcall, af_3465_GetDescription);

    type af_3469_GetHelpFile is access function (
                This         : access IErrorInfo;
                pbstrHelpFile: access BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3469
    pragma Convention(Stdcall, af_3469_GetHelpFile);

    type af_3473_GetHelpContext is access function (
                This          : access IErrorInfo;
                pdwHelpContext: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3473
    pragma Convention(Stdcall, af_3473_GetHelpContext);

    type af_3629_QueryInterface is access function (
                This     : access ICreateErrorInfo;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3629
    pragma Convention(Stdcall, af_3629_QueryInterface);

    type af_3634_AddRef is access function (
                This: access ICreateErrorInfo)
               return Win32.ULONG;                          -- oleauto.h:3634
    pragma Convention(Stdcall, af_3634_AddRef);

    type af_3637_Release is access function (
                This: access ICreateErrorInfo)
               return Win32.ULONG;                          -- oleauto.h:3637
    pragma Convention(Stdcall, af_3637_Release);

    type af_3640_SetGUID is access function (
                This : access ICreateErrorInfo;
                rguid: access Win32.Rpcdce.GUID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3640
    pragma Convention(Stdcall, af_3640_SetGUID);

    type af_3644_SetSource is access function (
                This    : access ICreateErrorInfo;
                szSource: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3644
    pragma Convention(Stdcall, af_3644_SetSource);

    type af_3648_SetDescription is access function (
                This         : access ICreateErrorInfo;
                szDescription: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3648
    pragma Convention(Stdcall, af_3648_SetDescription);

    type af_3652_SetHelpFile is access function (
                This      : access ICreateErrorInfo;
                szHelpFile: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3652
    pragma Convention(Stdcall, af_3652_SetHelpFile);

    type af_3656_SetHelpContext is access function (
                This         : access ICreateErrorInfo;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3656
    pragma Convention(Stdcall, af_3656_SetHelpContext);

    type af_3800_QueryInterface is access function (
                This     : access ISupportErrorInfo;
                riid     : access Win32.Objbase.IID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3800
    pragma Convention(Stdcall, af_3800_QueryInterface);

    type af_3805_AddRef is access function (
                This: access ISupportErrorInfo)
               return Win32.ULONG;                          -- oleauto.h:3805
    pragma Convention(Stdcall, af_3805_AddRef);

    type af_3808_Release is access function (
                This: access ISupportErrorInfo)
               return Win32.ULONG;                          -- oleauto.h:3808
    pragma Convention(Stdcall, af_3808_Release);

    type af_3811_InterfaceSupportsErrorInfo is access function (
                This: access ISupportErrorInfo;
                riid: access Win32.Objbase.IID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3811
    pragma Convention(Stdcall, af_3811_InterfaceSupportsErrorInfo);

    type ICreateTypeInfo is                                 -- oleauto.h:114
        record
            lpVtbl: a_ICreateTypeInfoVtbl_t;                -- oleauto.h:1210
        end record;

    type ICreateTypeLib is                                  -- oleauto.h:120
        record
            lpVtbl: a_ICreateTypeLibVtbl_t;                 -- oleauto.h:1717
        end record;

    type IDispatch is                                       -- oleauto.h:126
        record
            lpVtbl: a_IDispatchVtbl_t;                      -- oleauto.h:2025
        end record;

    type IEnumVARIANT is                                    -- oleauto.h:132
        record
            lpVtbl: a_IEnumVARIANTVtbl_t;                   -- oleauto.h:2201
        end record;

    type ITypeComp is                                       -- oleauto.h:138
        record
            lpVtbl: a_ITypeCompVtbl_t;                      -- oleauto.h:2394
        end record;

    type ITypeInfo is                                       -- oleauto.h:144
        record
            lpVtbl: a_ITypeInfoVtbl_t;                      -- oleauto.h:2698
        end record;

    type ITypeLib is                                        -- oleauto.h:150
        record
            lpVtbl: a_ITypeLibVtbl_t;                       -- oleauto.h:3211
        end record;

    type IErrorInfo is                                      -- oleauto.h:156
        record
            lpVtbl: a_IErrorInfoVtbl_t;                     -- oleauto.h:3481
        end record;

    type ICreateErrorInfo is                                -- oleauto.h:162
        record
            lpVtbl: a_ICreateErrorInfoVtbl_t;               -- oleauto.h:3664
        end record;

    type ISupportErrorInfo is                               -- oleauto.h:168
        record
            lpVtbl: a_ISupportErrorInfoVtbl_t;              -- oleauto.h:3819
        end record;

    subtype OLECHAR_Array is Win32.Objbase.OLECHAR_Array;

    type XBSTR is                                           -- oleauto.h:211
        record
            cbSize    : Win32.ULONG;                        -- oleauto.h:213
            rgBstrData: OLECHAR_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- oleauto.h:214
        end record;

    type BLOB is                                            -- oleauto.h:228
        record
            cbSize   : Win32.ULONG;                         -- oleauto.h:230
            pBlobData: Win32.PBYTE;                         -- oleauto.h:231
        end record;

    type CLIPDATA is                                        -- oleauto.h:242
        record
            cbSize   : Win32.ULONG;                         -- oleauto.h:244
            ulClipFmt: Win32.LONG;                          -- oleauto.h:245
            pClipData: Win32.PBYTE;                         -- oleauto.h:246
        end record;

    type SAFEARRAYBOUND is                                  -- oleauto.h:255
        record
            cElements: Win32.ULONG;                         -- oleauto.h:257
            lLbound  : Win32.LONG;                          -- oleauto.h:258
        end record;

    type SAFEARRAYBOUND_Array is                            -- oleauto.h:298
        array(integer range 0..Win32.ANYSIZE_Array)
        of aliased SAFEARRAYBOUND;

    type SAFEARRAY is                                       -- oleauto.h:286
        record
            cDims     : Win32.USHORT;                       -- oleauto.h:287
            fFeatures : Win32.USHORT;                       -- oleauto.h:288
            cbElements: Win32.ULONG;                        -- oleauto.h:290
            cLocks    : Win32.ULONG;                        -- oleauto.h:291
            pvData    : Win32.PBYTE;                        -- oleauto.h:297
            rgsabound : SAFEARRAYBOUND_Array;               -- oleauto.h:298
        end record;

    type CY is                                              -- oleauto.h:336
        record
            Lo: Win32.ULONG;                                -- oleauto.h:338
            Hi: Win32.LONG;                                 -- oleauto.h:339
        end record;


    subtype CURRENCY is CY;                                 -- oleauto.h:344

    type union_anonymous4_t_kind is (                       -- oleauto.h:582
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
        byref_kind
    );

    type a_a_IUnknown is access all Win32.Objbase.LPUNKNOWN;

    type union_anonymous4_t (Which: union_anonymous4_t_kind := cyVal_kind) is
                                                            -- oleauto.h:582
        record
            case Which is
                when bVal_kind =>
                    bVal: Win32.UCHAR;                      -- oleauto.h:554
                when iVal_kind =>
                    iVal: Win32.SHORT;                      -- oleauto.h:555
                when lVal_kind =>
                    lVal: Win32.LONG;                       -- oleauto.h:556
                when fltVal_kind =>
                    fltVal: Win32.FLOAT;                    -- oleauto.h:557
                when dblVal_kind =>
                    dblVal: Win32.DOUBLE;                   -- oleauto.h:558
                when bool_kind =>
                    bool: VARIANT_BOOL;                     -- oleauto.h:559
                when scode_kind =>
                    scode: Win32.Objbase.SCODE;             -- oleauto.h:560
                when cyVal_kind =>
                    cyVal: CY;                              -- oleauto.h:561
                when date_kind =>
                    date: Win32.Oleauto.DATE;               -- oleauto.h:562
                when bstrVal_kind =>
                    bstrVal: BSTR;                          -- oleauto.h:563
                when punkVal_kind =>
                    punkVal: Win32.Objbase.LPUNKNOWN;       -- oleauto.h:564
                when pdispVal_kind =>
                    pdispVal: LPDISPATCH;                   -- oleauto.h:565
                when parray_kind =>
                    parray: LPSAFEARRAY;                    -- oleauto.h:566
                when pbVal_kind =>
                    pbVal: Win32.PUCHAR;                    -- oleauto.h:567
                when piVal_kind =>
                    piVal: Win32.PSHORT;                    -- oleauto.h:568
                when plVal_kind =>
                    plVal: Win32.PLONG;                     -- oleauto.h:569
                when pfltVal_kind =>
                    pfltVal: Win32.PFLOAT;                  -- oleauto.h:570
                when pdblVal_kind =>
                    pdblVal: Win32.PDOUBLE;                 -- oleauto.h:571
                when pbool_kind =>
                    pbool: PVARIANT_BOOL;                   -- oleauto.h:572
                when pscode_kind =>
                    pscode: Win32.Objbase.PSCODE;           -- oleauto.h:573
                when pcyVal_kind =>
                    pcyVal: PCY;                            -- oleauto.h:574
                when pdate_kind =>
                    pdate: Win32.Oleauto.PDATE;             -- oleauto.h:575
                when pbstrVal_kind =>
                    pbstrVal: LPBSTR;                       -- oleauto.h:576
                when ppunkVal_kind =>
                    ppunkVal: a_a_IUnknown;                 -- oleauto.h:577
                when ppdispVal_kind =>
                    ppdispVal: a_LPDISPATCH_t;              -- oleauto.h:578
                when pparray_kind =>
                    pparray: PLPSAFEARRAY;                  -- oleauto.h:579
                when pvarVal_kind =>
                    pvarVal: LPVARIANT;
                                                            -- oleauto.h:580
                when byref_kind =>
                    byref: Win32.PVOID;                     -- oleauto.h:581
            end case;
        end record;

	  pragma Convention(C_Pass_By_Copy, Union_Anonymous4_T);

    pragma Unchecked_Union(union_anonymous4_t);

    type union_anonymous5_t_kind is (                       -- oleauto.h:661
        lptdesc_kind,
        lpadesc_kind,
        hreftype_kind
    );

    type union_anonymous5_t (Which: union_anonymous5_t_kind := lptdesc_kind) is
                                                            -- oleauto.h:661
        record
            case Which is
                when lptdesc_kind =>
                    lptdesc: a_TYPEDESC_t;                  -- oleauto.h:658
                when lpadesc_kind =>
                    lpadesc: a_ARRAYDESC_t;                 -- oleauto.h:659
                when hreftype_kind =>
                    hreftype: Win32.Oleauto.HREFTYPE;       -- oleauto.h:660
            end case;
        end record;

	  pragma Convention(C_Pass_By_Copy, Union_Anonymous5_T);

    pragma Unchecked_Union(union_anonymous5_t);

    type IDLDESC is                                         -- oleauto.h:692
        record
            dwReserved: Win32.ULONG;                        -- oleauto.h:694
            wIDLFlags : Win32.USHORT;                       -- oleauto.h:695
        end record;

    type PDISPID is access all Win32.Oleauto.DISPID;       -- oleauto.h:763

    type DISPPARAMS is                                      -- oleauto.h:760
        record
            rgvarg           : LPVARIANT;                   -- oleauto.h:762
            rgdispidNamedArgs: PDISPID;                     -- oleauto.h:763
            cArgs            : Win32.UINT;                  -- oleauto.h:764
            cNamedArgs       : Win32.UINT;                  -- oleauto.h:765
        end record;

    type RemEXCEPINFO is                                    -- oleauto.h:769
        record
            wCode        : Win32.WORD;                      -- oleauto.h:771
            wReserved    : Win32.WORD;                      -- oleauto.h:772
            dwHelpContext: Win32.DWORD;                     -- oleauto.h:773
            scode        : Win32.DWORD;                     -- oleauto.h:774
            cSource      : Win32.DWORD;                     -- oleauto.h:775
            cDescription : Win32.DWORD;                     -- oleauto.h:776
            cHelpFile    : Win32.DWORD;                     -- oleauto.h:777
            strings      : OLECHAR_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- oleauto.h:778
        end record;

    type EXCEPINFO is                                       -- oleauto.h:809
        record
            wCode            : Win32.WORD;                  -- oleauto.h:802
            wReserved        : Win32.WORD;                  -- oleauto.h:803
            bstrSource       : BSTR;                        -- oleauto.h:804
            bstrDescription  : BSTR;                        -- oleauto.h:805
            bstrHelpFile     : BSTR;                        -- oleauto.h:806
            dwHelpContext    : Win32.DWORD;                 -- oleauto.h:807
            pvReserved       : Win32.PVOID;                 -- oleauto.h:808
            pfnDeferredFillIn: af_809_pfnDeferredFillIn;    -- oleauto.h:809
            scode            : Win32.Objbase.SCODE;         -- oleauto.h:810
        end record;

    type union_anonymous6_t_kind is (                       -- oleauto.h:910
        oInst_kind,
        lpvarValue_kind
    );

    type union_anonymous6_t (Which: union_anonymous6_t_kind := oInst_kind) is
                                                            -- oleauto.h:910
        record
            case Which is
                when oInst_kind =>
                    oInst: Win32.ULONG;                     -- oleauto.h:908
                when lpvarValue_kind =>
                    lpvarValue: LPVARIANT;   
                                                            -- oleauto.h:909
            end case;
        end record;

	  pragma Convention(C_Pass_By_Copy, Union_Anonymous6_T);

    pragma Unchecked_Union(union_anonymous6_t);

    type ICreateTypeInfoVtbl is                             -- oleauto.h:1085
        record
            QueryInterface      : af_1088_QueryInterface;   -- oleauto.h:1088
            AddRef              : af_1093_AddRef;           -- oleauto.h:1093
            Release             : af_1096_Release;          -- oleauto.h:1096
            SetGuid             : af_1099_SetGuid;          -- oleauto.h:1099
            SetTypeFlags        : af_1103_SetTypeFlags;     -- oleauto.h:1103
            SetDocString        : af_1107_SetDocString;     -- oleauto.h:1107
            SetHelpContext      : af_1111_SetHelpContext;   -- oleauto.h:1111
            SetVersion          : af_1115_SetVersion;       -- oleauto.h:1115
            AddRefTypeInfo      : af_1120_AddRefTypeInfo;   -- oleauto.h:1120
            AddFuncDesc         : af_1125_AddFuncDesc;      -- oleauto.h:1125
            AddImplType         : af_1130_AddImplType;      -- oleauto.h:1130
            SetImplTypeFlags    : af_1135_SetImplTypeFlags; -- oleauto.h:1135
            SetAlignment        : af_1140_SetAlignment;     -- oleauto.h:1140
            SetSchema           : af_1144_SetSchema;        -- oleauto.h:1144
            AddVarDesc          : af_1148_AddVarDesc;       -- oleauto.h:1148
            SetFuncAndParamNames: af_1153_SetFuncAndParamNames;
                                                            -- oleauto.h:1153
            SetVarName          : af_1159_SetVarName;       -- oleauto.h:1159
            SetTypeDescAlias    : af_1164_SetTypeDescAlias; -- oleauto.h:1164
            DefineFuncAsDllEntry: af_1168_DefineFuncAsDllEntry;
                                                            -- oleauto.h:1168
            SetFuncDocString    : af_1174_SetFuncDocString; -- oleauto.h:1174
            SetVarDocString     : af_1179_SetVarDocString;  -- oleauto.h:1179
            SetFuncHelpContext  : af_1184_SetFuncHelpContext;
                                                            -- oleauto.h:1184
            SetVarHelpContext   : af_1189_SetVarHelpContext;-- oleauto.h:1189
            SetMops             : af_1194_SetMops;          -- oleauto.h:1194
            SetTypeIdldesc      : af_1199_SetTypeIdldesc;   -- oleauto.h:1199
            LayOut              : af_1203_LayOut;           -- oleauto.h:1203
        end record;

    type ICreateTypeLibVtbl is                              -- oleauto.h:1657
        record
            QueryInterface : af_1660_QueryInterface;        -- oleauto.h:1660
            AddRef         : af_1665_AddRef;                -- oleauto.h:1665
            Release        : af_1668_Release;               -- oleauto.h:1668
            CreateTypeInfo : af_1671_CreateTypeInfo;        -- oleauto.h:1671
            SetName        : af_1677_SetName;               -- oleauto.h:1677
            SetVersion     : af_1681_SetVersion;            -- oleauto.h:1681
            SetGuid        : af_1686_SetGuid;               -- oleauto.h:1686
            SetDocString   : af_1690_SetDocString;          -- oleauto.h:1690
            SetHelpFileName: af_1694_SetHelpFileName;       -- oleauto.h:1694
            SetHelpContext : af_1698_SetHelpContext;        -- oleauto.h:1698
            SetLcid        : af_1702_SetLcid;               -- oleauto.h:1702
            SetLibFlags    : af_1706_SetLibFlags;           -- oleauto.h:1706
            SaveAllChanges : af_1710_SaveAllChanges;        -- oleauto.h:1710
        end record;

    type IDispatchVtbl is                                   -- oleauto.h:1978
        record
            QueryInterface  : af_1981_QueryInterface;       -- oleauto.h:1981
            AddRef          : af_1986_AddRef;               -- oleauto.h:1986
            Release         : af_1989_Release;              -- oleauto.h:1989
            GetTypeInfoCount: af_1992_GetTypeInfoCount;     -- oleauto.h:1992
            GetTypeInfo     : af_1996_GetTypeInfo;          -- oleauto.h:1996
            GetIDsOfNames   : af_2002_GetIDsOfNames;        -- oleauto.h:2002
            Invoke          : af_2010_Invoke;               -- oleauto.h:2010
        end record;

    type IEnumVARIANTVtbl is                                -- oleauto.h:2166
        record
            QueryInterface: af_2169_QueryInterface;         -- oleauto.h:2169
            AddRef        : af_2174_AddRef;                 -- oleauto.h:2174
            Release       : af_2177_Release;                -- oleauto.h:2177
            Next          : af_2180_Next;                   -- oleauto.h:2180
            Skip          : af_2186_Skip;                   -- oleauto.h:2186
            Reset         : af_2190_Reset;                  -- oleauto.h:2190
            Clone         : af_2193_Clone;                  -- oleauto.h:2193
        end record;

    type BINDPTR_kind is (                                  -- oleauto.h:2321
        lpfuncdesc_kind,
        lpvardesc_kind,
        lptcomp_kind
    );

    type BINDPTR (Which: BINDPTR_kind := lpfuncdesc_kind) is-- oleauto.h:2321
        record
            case Which is
                when lpfuncdesc_kind =>
                    lpfuncdesc: Win32.Oleauto.LPFUNCDESC;   -- oleauto.h:2323
                when lpvardesc_kind =>
                    lpvardesc: Win32.Oleauto.LPVARDESC;     -- oleauto.h:2324
                when lptcomp_kind =>
                    lptcomp: LPTYPECOMP;                    -- oleauto.h:2325
            end case;
        end record;

	  pragma Convention(C_Pass_By_Copy, BINDPTR);

    pragma Unchecked_Union(BINDPTR);

    type ITypeCompVtbl is                                   -- oleauto.h:2360
        record
            QueryInterface: af_2363_QueryInterface;         -- oleauto.h:2363
            AddRef        : af_2368_AddRef;                 -- oleauto.h:2368
            Release       : af_2371_Release;                -- oleauto.h:2371
            Bind          : af_2374_Bind;                   -- oleauto.h:2374
            BindType      : af_2383_BindType;               -- oleauto.h:2383
        end record;

    type ITypeInfoVtbl is                                   -- oleauto.h:2574
        record
            QueryInterface      : af_2577_QueryInterface;   -- oleauto.h:2577
            AddRef              : af_2582_AddRef;           -- oleauto.h:2582
            Release             : af_2585_Release;          -- oleauto.h:2585
            GetTypeAttr         : af_2588_GetTypeAttr;      -- oleauto.h:2588
            GetTypeComp         : af_2592_GetTypeComp;      -- oleauto.h:2592
            GetFuncDesc         : af_2596_GetFuncDesc;      -- oleauto.h:2596
            GetVarDesc          : af_2601_GetVarDesc;       -- oleauto.h:2601
            GetNames            : af_2606_GetNames;         -- oleauto.h:2606
            GetRefTypeOfImplType: af_2613_GetRefTypeOfImplType;
                                                            -- oleauto.h:2613
            GetImplTypeFlags    : af_2618_GetImplTypeFlags; -- oleauto.h:2618
            GetIDsOfNames       : af_2623_GetIDsOfNames;    -- oleauto.h:2623
            Invoke              : af_2629_Invoke;           -- oleauto.h:2629
            GetDocumentation    : af_2639_GetDocumentation; -- oleauto.h:2639
            GetDllEntry         : af_2647_GetDllEntry;      -- oleauto.h:2647
            GetRefTypeInfo      : af_2655_GetRefTypeInfo;   -- oleauto.h:2655
            AddressOfMember     : af_2660_AddressOfMember;  -- oleauto.h:2660
            CreateInstance      : af_2666_CreateInstance;   -- oleauto.h:2666
            GetMops             : af_2672_GetMops;          -- oleauto.h:2672
            GetContainingTypeLib: af_2677_GetContainingTypeLib;
                                                            -- oleauto.h:2677
            ReleaseTypeAttr     : ap_2682_ReleaseTypeAttr;  -- oleauto.h:2682
            ReleaseFuncDesc     : ap_2686_ReleaseFuncDesc;  -- oleauto.h:2686
            ReleaseVarDesc      : ap_2690_ReleaseVarDesc;   -- oleauto.h:2690
        end record;

    type TLIBATTR is                                        -- oleauto.h:3074
        record
            guid        : Win32.Rpcdce.GUID;                -- oleauto.h:3076
            lcid        : Win32.Winnt.LCID;                 -- oleauto.h:3077
            syskind     : Win32.Oleauto.SYSKIND;            -- oleauto.h:3078
            wMajorVerNum: Win32.WORD;                       -- oleauto.h:3079
            wMinorVerNum: Win32.WORD;                       -- oleauto.h:3080
            wLibFlags   : Win32.WORD;                       -- oleauto.h:3081
        end record;

    type ITypeLibVtbl is                                    -- oleauto.h:3141
        record
            QueryInterface   : af_3144_QueryInterface;      -- oleauto.h:3144
            AddRef           : af_3149_AddRef;              -- oleauto.h:3149
            Release          : af_3152_Release;             -- oleauto.h:3152
            GetTypeInfoCount : af_3155_GetTypeInfoCount;    -- oleauto.h:3155
            GetTypeInfo      : af_3158_GetTypeInfo;         -- oleauto.h:3158
            GetTypeInfoType  : af_3163_GetTypeInfoType;     -- oleauto.h:3163
            GetTypeInfoOfGuid: af_3168_GetTypeInfoOfGuid;   -- oleauto.h:3168
            GetLibAttr       : af_3173_GetLibAttr;          -- oleauto.h:3173
            GetTypeComp      : af_3177_GetTypeComp;         -- oleauto.h:3177
            GetDocumentation : af_3181_GetDocumentation;    -- oleauto.h:3181
            IsName           : af_3189_IsName;              -- oleauto.h:3189
            FindName         : af_3195_FindName;            -- oleauto.h:3195
            ReleaseTLibAttr  : ap_3203_ReleaseTLibAttr;     -- oleauto.h:3203
        end record;

    type IErrorInfoVtbl is                                  -- oleauto.h:3443
        record
            QueryInterface: af_3446_QueryInterface;         -- oleauto.h:3446
            AddRef        : af_3451_AddRef;                 -- oleauto.h:3451
            Release       : af_3454_Release;                -- oleauto.h:3454
            GetGUID       : af_3457_GetGUID;                -- oleauto.h:3457
            GetSource     : af_3461_GetSource;              -- oleauto.h:3461
            GetDescription: af_3465_GetDescription;         -- oleauto.h:3465
            GetHelpFile   : af_3469_GetHelpFile;            -- oleauto.h:3469
            GetHelpContext: af_3473_GetHelpContext;         -- oleauto.h:3473
        end record;

    type ICreateErrorInfoVtbl is                            -- oleauto.h:3626
        record
            QueryInterface: af_3629_QueryInterface;         -- oleauto.h:3629
            AddRef        : af_3634_AddRef;                 -- oleauto.h:3634
            Release       : af_3637_Release;                -- oleauto.h:3637
            SetGUID       : af_3640_SetGUID;                -- oleauto.h:3640
            SetSource     : af_3644_SetSource;              -- oleauto.h:3644
            SetDescription: af_3648_SetDescription;         -- oleauto.h:3648
            SetHelpFile   : af_3652_SetHelpFile;            -- oleauto.h:3652
            SetHelpContext: af_3656_SetHelpContext;         -- oleauto.h:3656
        end record;

    type ISupportErrorInfoVtbl is                           -- oleauto.h:3797
        record
            QueryInterface            : af_3800_QueryInterface;
                                                            -- oleauto.h:3800
            AddRef                    : af_3805_AddRef;     -- oleauto.h:3805
            Release                   : af_3808_Release;    -- oleauto.h:3808
            InterfaceSupportsErrorInfo: af_3811_InterfaceSupportsErrorInfo;
                                                            -- oleauto.h:3811
        end record;

    type PARAMDATA is                                       -- oleauto.h:4259
        record
            szName: Win32.PWSTR;                            -- oleauto.h:4260
            vt    : VARTYPE;                                -- oleauto.h:4261
        end record;

    type METHODDATA is                                      -- oleauto.h:4264
        record
            szName  : Win32.PWSTR;                          -- oleauto.h:4265
            ppdata  : LPPARAMDATA;                          -- oleauto.h:4266
            dispid  : Win32.Oleauto.DISPID;                 -- oleauto.h:4267
            iMeth   : Win32.UINT;                           -- oleauto.h:4268
            cc      : CALLCONV;                             -- oleauto.h:4269
            cArgs   : Win32.UINT;                           -- oleauto.h:4270
            wFlags  : Win32.WORD;                           -- oleauto.h:4271
            vtReturn: VARTYPE;                              -- oleauto.h:4272
        end record;

    type INTERFACEDATA is                                   -- oleauto.h:4275
        record
            pmethdata: LPMETHODDATA;                        -- oleauto.h:4276
            cMembers : Win32.UINT;                          -- oleauto.h:4277
        end record;

    type VARIANT is                                         -- oleauto.h:467
        record
            vt        : VARTYPE;                            -- oleauto.h:548
            wReserved1: Win32.WORD;                         -- oleauto.h:549
            wReserved2: Win32.WORD;                         -- oleauto.h:550
            wReserved3: Win32.WORD;                         -- oleauto.h:551
            u         : union_anonymous4_t;                 -- oleauto.h:584
        end record;

    subtype VARIANTARG is VARIANT;                          -- oleauto.h:599

    type TYPEDESC is                                        -- oleauto.h:658
        record
            typedesc_u: union_anonymous5_t;                 -- oleauto.h:661
            vt        : VARTYPE;                            -- oleauto.h:662
        end record;

    type ELEMDESC is                                        -- oleauto.h:718
        record
            tdesc  : TYPEDESC;                              -- oleauto.h:720
            idldesc: Win32.Oleauto.IDLDESC;                 -- oleauto.h:721
        end record;

    type TYPEATTR is                                        -- oleauto.h:733
        record
            guid            : Win32.Rpcdce.GUID;            -- oleauto.h:735
            lcid            : Win32.Winnt.LCID;             -- oleauto.h:736
            dwReserved      : Win32.DWORD;                  -- oleauto.h:737
            memidConstructor: MEMBERID;                     -- oleauto.h:738
            memidDestructor : MEMBERID;                     -- oleauto.h:739
            lpstrSchema     : Win32.Objbase.LPOLESTR;       -- oleauto.h:740
            cbSizeInstance  : Win32.ULONG;                  -- oleauto.h:741
            typekind        : Win32.Oleauto.TYPEKIND;       -- oleauto.h:742
            cFuncs          : Win32.WORD;                   -- oleauto.h:743
            cVars           : Win32.WORD;                   -- oleauto.h:744
            cImplTypes      : Win32.WORD;                   -- oleauto.h:745
            cbSizeVft       : Win32.WORD;                   -- oleauto.h:746
            cbAlignment     : Win32.WORD;                   -- oleauto.h:747
            wTypeFlags      : Win32.WORD;                   -- oleauto.h:748
            wMajorVerNum    : Win32.WORD;                   -- oleauto.h:749
            wMinorVerNum    : Win32.WORD;                   -- oleauto.h:750
            tdescAlias      : TYPEDESC;                     -- oleauto.h:751
            idldescType     : IDLDESC;                      -- oleauto.h:752
        end record;

    type FUNCDESC is                                        -- oleauto.h:860
        record
            memid            : MEMBERID;                    -- oleauto.h:862
            lprgscode        : Win32.Objbase.PSCODE;        -- oleauto.h:863
            lprgelemdescParam: LPELEMDESC;                  -- oleauto.h:864
            funckind         : Win32.Oleauto.FUNCKIND;      -- oleauto.h:865
            invkind          : INVOKEKIND;                  -- oleauto.h:866
            callconv         : Win32.Oleauto.CALLCONV;      -- oleauto.h:867
            cParams          : Win32.SHORT;                 -- oleauto.h:868
            cParamsOpt       : Win32.SHORT;                 -- oleauto.h:869
            oVft             : Win32.SHORT;                 -- oleauto.h:870
            cScodes          : Win32.SHORT;                 -- oleauto.h:871
            elemdescFunc     : ELEMDESC;                    -- oleauto.h:872
            wFuncFlags       : Win32.WORD;                  -- oleauto.h:873
        end record;

    type VARDESC is                                         -- oleauto.h:902
        record
            memid      : MEMBERID;                          -- oleauto.h:904
            lpstrSchema: Win32.Objbase.LPOLESTR;            -- oleauto.h:905
            vardesc_u  : union_anonymous6_t;                -- oleauto.h:910
            elemdescVar: ELEMDESC;                          -- oleauto.h:911
            wVarFlags  : Win32.WORD;                        -- oleauto.h:912
            varkind    : Win32.Oleauto.VARKIND;             -- oleauto.h:913
        end record;

    type ARRAYDESC is                                       -- oleauto.h:659
        record
            tdescElem: TYPEDESC;                            -- oleauto.h:680
            cDims    : Win32.USHORT;                        -- oleauto.h:681
            rgbounds : SAFEARRAYBOUND_Array;                -- oleauto.h:682
        end record;

    RemVariant_v0_1_c_ifspec: Win32.Rpcdce.RPC_IF_HANDLE;   -- oleauto.h:971
    RemVariant_v0_1_s_ifspec: Win32.Rpcdce.RPC_IF_HANDLE;   -- oleauto.h:972
    IID_ICreateTypeInfo     : Win32.Objbase.IID;            -- oleauto.h:990
    IID_ICreateTypeLib      : Win32.Objbase.IID;            -- oleauto.h:1614
    IID_IDispatch           : Win32.Objbase.IID;            -- oleauto.h:1942
    IID_IEnumVARIANT        : Win32.Objbase.IID;            -- oleauto.h:2142
    IID_ITypeComp           : Win32.Objbase.IID;            -- oleauto.h:2335
    IID_ITypeInfo           : Win32.Objbase.IID;            -- oleauto.h:2476
    IID_ITypeLib            : Win32.Objbase.IID;            -- oleauto.h:3088
    IID_IErrorInfo          : Win32.Objbase.IID;            -- oleauto.h:3417
    IID_ICreateErrorInfo    : Win32.Objbase.IID;            -- oleauto.h:3600
    IID_ISupportErrorInfo   : Win32.Objbase.IID;            -- oleauto.h:3783

    type PPLONG is access Win32.PLONG;

    procedure TYPEKIND_to_xmit(pEnum : in  PTYPEKIND; 
                               ppLong: out Win32.Oleauto.PPLONG);   
			                                    -- oleauto.h:643

    procedure TYPEKIND_from_xmit(pLong: in  Win32.PLONG;
                                 pEnum: out PTYPEKIND);     -- oleauto.h:644

    procedure CALLCONV_to_xmit(pEnum : in  PCALLCONV; 
                               ppLong: out Win32.Oleauto.PPLONG);   
			                                    -- oleauto.h:828

    procedure CALLCONV_from_xmit(pLong: in  Win32.PLONG;
                                 pEnum: out PCALLCONV);     -- oleauto.h:829

    procedure FUNCKIND_to_xmit(pEnum : in  PFUNCKIND; 
                               ppLong: out Win32.Oleauto.PPLONG);   
			                                    -- oleauto.h:842

    procedure FUNCKIND_from_xmit(pLong: in  Win32.PLONG;
                                 pEnum: out PFUNCKIND);     -- oleauto.h:843

    procedure INVOKEKIND_to_xmit(pEnum : in  PINVOKEKIND; 
                                 ppLong: out Win32.Oleauto.PPLONG); 
				                            -- oleauto.h:855

    procedure INVOKEKIND_from_xmit(pLong: in  Win32.PLONG;
                                   pEnum: out PINVOKEKIND); -- oleauto.h:856

    procedure VARKIND_to_xmit(pEnum : in  PVARKIND; 
                              ppLong: out Win32.Oleauto.PPLONG);    
			                                    -- oleauto.h:888

    procedure VARKIND_from_xmit(pLong: in  Win32.PLONG;
                                pEnum: out PVARKIND);       -- oleauto.h:889

    procedure DESCKIND_to_xmit(pEnum : in  PDESCKIND; 
                              ppLong: out Win32.Oleauto.PPLONG);    
			                                    -- oleauto.h:2316

    procedure DESCKIND_from_xmit(pLong: in  Win32.PLONG;
                                pEnum: out PDESCKIND);      -- oleauto.h:2317

    procedure SYSKIND_to_xmit(pEnum : in  PSYSKIND; 
                              ppLong: out Win32.Oleauto.PPLONG);    
			                                    -- oleauto.h:3066

    procedure SYSKIND_from_xmit(pLong: in  Win32.PLONG;
                                pEnum: out PSYSKIND);       -- oleauto.h:3067

    function ICreateTypeInfo_SetGuid_Proxy(
                This: access ICreateTypeInfo;
                guid: access Win32.Objbase.IID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1304

    procedure ICreateTypeInfo_SetGuid_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1309

    function ICreateTypeInfo_SetTypeFlags_Proxy(
                This      : access ICreateTypeInfo;
                uTypeFlags: Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1316

    procedure ICreateTypeInfo_SetTypeFlags_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1321

    function ICreateTypeInfo_SetDocString_Proxy(
                This    : access ICreateTypeInfo;
                lpstrDoc: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1328

    procedure ICreateTypeInfo_SetDocString_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1333

    function ICreateTypeInfo_SetHelpContext_Proxy(
                This         : access ICreateTypeInfo;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1340

    procedure ICreateTypeInfo_SetHelpContext_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1345

    function ICreateTypeInfo_SetVersion_Proxy(
                This        : access ICreateTypeInfo;
                wMajorVerNum: Win32.WORD;
                wMinorVerNum: Win32.WORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1352

    procedure ICreateTypeInfo_SetVersion_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1358

    function ICreateTypeInfo_AddRefTypeInfo_Proxy(
                This     : access ICreateTypeInfo;
                ptinfo   : access ICreateTypeInfo;
                phreftype: access HREFTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1365

    procedure ICreateTypeInfo_AddRefTypeInfo_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1371

    function ICreateTypeInfo_AddFuncDesc_Proxy(
                This     : access ICreateTypeInfo;
                index    : Win32.UINT;
                pfuncdesc: access FUNCDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1378

    procedure ICreateTypeInfo_AddFuncDesc_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1384

    function ICreateTypeInfo_AddImplType_Proxy(
                This    : access ICreateTypeInfo;
                index   : Win32.UINT;
                hreftype: Win32.Oleauto.HREFTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1391

    procedure ICreateTypeInfo_AddImplType_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1397

    function ICreateTypeInfo_SetImplTypeFlags_Proxy(
                This         : access ICreateTypeInfo;
                index        : Win32.UINT;
                impltypeflags: Win32.INT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1404

    procedure ICreateTypeInfo_SetImplTypeFlags_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1410

    function ICreateTypeInfo_SetAlignment_Proxy(
                This       : access ICreateTypeInfo;
                cbAlignment: Win32.WORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1417

    procedure ICreateTypeInfo_SetAlignment_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1422

    function ICreateTypeInfo_SetSchema_Proxy(
                This       : access ICreateTypeInfo;
                lpstrSchema: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1429

    procedure ICreateTypeInfo_SetSchema_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1434

    function ICreateTypeInfo_AddVarDesc_Proxy(
                This    : access ICreateTypeInfo;
                index   : Win32.UINT;
                pvardesc: access VARDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1441

    procedure ICreateTypeInfo_AddVarDesc_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1447

    function ICreateTypeInfo_SetFuncAndParamNames_Proxy(
                This     : access ICreateTypeInfo;
                index    : Win32.UINT;
                rgszNames: access Win32.Objbase.LPOLESTR;
                cNames   : Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1454

    procedure ICreateTypeInfo_SetFuncAndParamNames_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1461

    function ICreateTypeInfo_SetVarName_Proxy(
                This  : access ICreateTypeInfo;
                index : Win32.UINT;
                szName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1468

    procedure ICreateTypeInfo_SetVarName_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1474

    function ICreateTypeInfo_SetTypeDescAlias_Proxy(
                This       : access ICreateTypeInfo;
                ptdescAlias: access TYPEDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1481

    procedure ICreateTypeInfo_SetTypeDescAlias_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1486

    function ICreateTypeInfo_DefineFuncAsDllEntry_Proxy(
                This      : access ICreateTypeInfo;
                index     : Win32.UINT;
                szDllName : Win32.Objbase.LPOLESTR;
                szProcName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1493

    procedure ICreateTypeInfo_DefineFuncAsDllEntry_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1500

    function ICreateTypeInfo_SetFuncDocString_Proxy(
                This       : access ICreateTypeInfo;
                index      : Win32.UINT;
                szDocString: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1507

    procedure ICreateTypeInfo_SetFuncDocString_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1513

    function ICreateTypeInfo_SetVarDocString_Proxy(
                This       : access ICreateTypeInfo;
                index      : Win32.UINT;
                szDocString: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1520

    procedure ICreateTypeInfo_SetVarDocString_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1526

    function ICreateTypeInfo_SetFuncHelpContext_Proxy(
                This         : access ICreateTypeInfo;
                index        : Win32.UINT;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1533

    procedure ICreateTypeInfo_SetFuncHelpContext_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1539

    function ICreateTypeInfo_SetVarHelpContext_Proxy(
                This         : access ICreateTypeInfo;
                index        : Win32.UINT;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1546

    procedure ICreateTypeInfo_SetVarHelpContext_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1552

    function ICreateTypeInfo_SetMops_Proxy(
                This    : access ICreateTypeInfo;
                index   : Win32.UINT;
                bstrMops: BSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1559

    procedure ICreateTypeInfo_SetMops_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1565

    function ICreateTypeInfo_SetTypeIdldesc_Proxy(
                This    : access ICreateTypeInfo;
                pidldesc: access IDLDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1572

    procedure ICreateTypeInfo_SetTypeIdldesc_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1577

    function ICreateTypeInfo_LayOut_Proxy(
                This: access ICreateTypeInfo)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1584

    procedure ICreateTypeInfo_LayOut_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1588

    function ICreateTypeLib_CreateTypeInfo_Proxy(
                This       : access ICreateTypeLib;
                szName     : Win32.Objbase.LPOLESTR;
                tkind      : TYPEKIND;
                lplpictinfo: access LPCREATETYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1772

    procedure ICreateTypeLib_CreateTypeInfo_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1779

    function ICreateTypeLib_SetName_Proxy(
                This  : access ICreateTypeLib;
                szName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1786

    procedure ICreateTypeLib_SetName_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1791

    function ICreateTypeLib_SetVersion_Proxy(
                This        : access ICreateTypeLib;
                wMajorVerNum: Win32.WORD;
                wMinorVerNum: Win32.WORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1798

    procedure ICreateTypeLib_SetVersion_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1804

    function ICreateTypeLib_SetGuid_Proxy(
                This: access ICreateTypeLib;
                guid: access Win32.Objbase.IID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1811

    procedure ICreateTypeLib_SetGuid_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1816

    function ICreateTypeLib_SetDocString_Proxy(
                This : access ICreateTypeLib;
                szDoc: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1823

    procedure ICreateTypeLib_SetDocString_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1828

    function ICreateTypeLib_SetHelpFileName_Proxy(
                This          : access ICreateTypeLib;
                szHelpFileName: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1835

    procedure ICreateTypeLib_SetHelpFileName_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1840

    function ICreateTypeLib_SetHelpContext_Proxy(
                This         : access ICreateTypeLib;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1847

    procedure ICreateTypeLib_SetHelpContext_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1852

    function ICreateTypeLib_SetLcid_Proxy(
                This: access ICreateTypeLib;
                lcid: Win32.Winnt.LCID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1859

    procedure ICreateTypeLib_SetLcid_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1864

    function ICreateTypeLib_SetLibFlags_Proxy(
                This     : access ICreateTypeLib;
                uLibFlags: Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1871

    procedure ICreateTypeLib_SetLibFlags_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1876

    function ICreateTypeLib_SaveAllChanges_Proxy(
                This: access ICreateTypeLib)
               return Win32.Objbase.HRESULT;                -- oleauto.h:1883

    procedure ICreateTypeLib_SaveAllChanges_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:1887

    function IDispatch_GetTypeInfoCount_Proxy(
                This   : access IDispatch;
                pctinfo: access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2062

    procedure IDispatch_GetTypeInfoCount_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2067

    function IDispatch_GetTypeInfo_Proxy(
                This   : access IDispatch;
                itinfo : Win32.UINT;
                lcid   : Win32.Winnt.LCID;
                pptinfo: access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2074

    procedure IDispatch_GetTypeInfo_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2081

    function IDispatch_GetIDsOfNames_Proxy(
                This     : access IDispatch;
                riid     : access Win32.Objbase.IID;
                rgszNames: access Win32.Objbase.LPOLESTR;
                cNames   : Win32.UINT;
                lcid     : Win32.Winnt.LCID;
                rgdispid : access DISPID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2088

    procedure IDispatch_GetIDsOfNames_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2097

    function IDispatch_Invoke_Proxy(
                This        : access IDispatch;
                dispidMember: DISPID;
                riid        : access Win32.Objbase.IID;
                lcid        : Win32.Winnt.LCID;
                wFlags      : Win32.WORD;
                pdispparams : access DISPPARAMS;
                pvarResult  : access VARIANT;
                pexcepinfo  : access EXCEPINFO;
                puArgErr    : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2104

    procedure IDispatch_Invoke_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2116

    function IEnumVARIANT_Next_Proxy(
                This        : access IEnumVARIANT;
                celt        : Win32.ULONG;
                rgvar       : access VARIANT;
                pceltFetched: access Win32.ULONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2238

    procedure IEnumVARIANT_Next_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2245

    function IEnumVARIANT_Skip_Proxy(
                This: access IEnumVARIANT;
                celt: Win32.ULONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2252

    procedure IEnumVARIANT_Skip_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2257

    function IEnumVARIANT_Reset_Proxy(
                This: access IEnumVARIANT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2264

    procedure IEnumVARIANT_Reset_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2268

    function IEnumVARIANT_Clone_Proxy(
                This  : access IEnumVARIANT;
                ppenum: access LPENUMVARIANT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2275

    procedure IEnumVARIANT_Clone_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2280

    function ITypeComp_Bind_Proxy(
                This     : access ITypeComp;
                szName   : Win32.Objbase.LPOLESTR;
                lHashVal : Win32.ULONG;
                fFlags   : Win32.WORD;
                pptinfo  : access LPTYPEINFO;
                pdesckind: access DESCKIND;
                pbindptr : access BINDPTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2425

    procedure ITypeComp_Bind_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2435

    function ITypeComp_BindType_Proxy(
                This    : access ITypeComp;
                szName  : Win32.Objbase.LPOLESTR;
                lHashVal: Win32.ULONG;
                pptinfo : access LPTYPEINFO;
                pptcomp : access LPTYPECOMP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2442

    procedure ITypeComp_BindType_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2450

    function ITypeInfo_GetTypeAttr_Proxy(
                This      : access ITypeInfo;
                pptypeattr: access LPTYPEATTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2780

    procedure ITypeInfo_GetTypeAttr_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2785

    function ITypeInfo_GetTypeComp_Proxy(
                This   : access ITypeInfo;
                pptcomp: access LPTYPECOMP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2792

    procedure ITypeInfo_GetTypeComp_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2797

    function ITypeInfo_GetFuncDesc_Proxy(
                This       : access ITypeInfo;
                index      : Win32.UINT;
                pppfuncdesc: access LPFUNCDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2804

    procedure ITypeInfo_GetFuncDesc_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2810

    function ITypeInfo_GetVarDesc_Proxy(
                This     : access ITypeInfo;
                index    : Win32.UINT;
                ppvardesc: access LPVARDESC)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2817

    procedure ITypeInfo_GetVarDesc_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2823

    function ITypeInfo_GetNames_Proxy(
                This       : access ITypeInfo;
                memid      : MEMBERID;
                rgbstrNames: LPBSTR;
                cMaxNames  : Win32.UINT;
                pcNames    : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2830

    procedure ITypeInfo_GetNames_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2838

    function ITypeInfo_GetRefTypeOfImplType_Proxy(
                This     : access ITypeInfo;
                index    : Win32.UINT;
                hpreftype: access HREFTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2845

    procedure ITypeInfo_GetRefTypeOfImplType_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2851

    function ITypeInfo_GetImplTypeFlags_Proxy(
                This          : access ITypeInfo;
                index         : Win32.UINT;
                pimpltypeflags: access Win32.INT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2858

    procedure ITypeInfo_GetImplTypeFlags_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2864

    function ITypeInfo_GetIDsOfNames_Proxy(
                This       : access ITypeInfo;
                rglpszNames: access Win32.Objbase.LPOLESTR;
                cNames     : Win32.UINT;
                rgmemid    : access MEMBERID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2871

    procedure ITypeInfo_GetIDsOfNames_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2878

    function ITypeInfo_Invoke_Proxy(
                This       : access ITypeInfo;
                pvInstance : Win32.PVOID;
                memid      : MEMBERID;
                wFlags     : Win32.WORD;
                pdispparams: access DISPPARAMS;
                pvarResult : access VARIANT;
                pexcepinfo : access EXCEPINFO;
                puArgErr   : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2885

    procedure ITypeInfo_Invoke_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2896

    function ITypeInfo_GetDocumentation_Proxy(
                This          : access ITypeInfo;
                memid         : MEMBERID;
                pbstrName     : access LPBSTR;
                pbstrDocString: access LPBSTR;
                pdwHelpContext: access Win32.DWORD;
                pbstrHelpFile : access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2903

    procedure ITypeInfo_GetDocumentation_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2912

    function ITypeInfo_GetDllEntry_Proxy(
                This        : access ITypeInfo;
                memid       : MEMBERID;
                invkind     : INVOKEKIND;
                pbstrDllName: access LPBSTR;
                pbstrName   : access LPBSTR;
                pwOrdinal   : Win32.PWSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2919

    procedure ITypeInfo_GetDllEntry_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2928

    function ITypeInfo_GetRefTypeInfo_Proxy(
                This    : access ITypeInfo;
                hreftype: Win32.Oleauto.HREFTYPE;
                pptinfo : access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2935

    procedure ITypeInfo_GetRefTypeInfo_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2941

    function ITypeInfo_RemoteAddressOfMember_Proxy(
                This: access ITypeInfo)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2948

    procedure ITypeInfo_RemoteAddressOfMember_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2952

    function ITypeInfo_CreateInstance_Proxy(
                This     : access ITypeInfo;
                puncOuter: access Win32.Objbase.IUnknown;
                riid     : access Win32.Objbase.IID;
                ppvObj   : access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2959

    procedure ITypeInfo_CreateInstance_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2966

    function ITypeInfo_GetMops_Proxy(
                This     : access ITypeInfo;
                memid    : MEMBERID;
                pbstrMops: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2973

    procedure ITypeInfo_GetMops_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2979

    function ITypeInfo_GetContainingTypeLib_Proxy(
                This  : access ITypeInfo;
                pptlib: access LPTYPELIB;
                pindex: access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:2986

    procedure ITypeInfo_GetContainingTypeLib_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:2992

    procedure ITypeInfo_ReleaseTypeAttr_Proxy(
                This     : access ITypeInfo;
                ptypeattr: LPTYPEATTR);                     -- oleauto.h:2999

    procedure ITypeInfo_ReleaseTypeAttr_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3004

    procedure ITypeInfo_ReleaseFuncDesc_Proxy(
                This     : access ITypeInfo;
                pfuncdesc: access FUNCDESC);                -- oleauto.h:3011

    procedure ITypeInfo_ReleaseFuncDesc_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3016

    procedure ITypeInfo_ReleaseVarDesc_Proxy(
                This    : access ITypeInfo;
                pvardesc: access VARDESC);                  -- oleauto.h:3023

    procedure ITypeInfo_ReleaseVarDesc_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3028

    function ITypeLib_GetTypeInfoCount_Proxy(
                This: access ITypeLib)
               return Win32.UINT;                           -- oleauto.h:3266

    procedure ITypeLib_GetTypeInfoCount_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3270

    function ITypeLib_GetTypeInfo_Proxy(
                This    : access ITypeLib;
                index   : Win32.UINT;
                ppitinfo: access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3277

    procedure ITypeLib_GetTypeInfo_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3283

    function ITypeLib_GetTypeInfoType_Proxy(
                This  : access ITypeLib;
                index : Win32.UINT;
                ptkind: access TYPEKIND)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3290

    procedure ITypeLib_GetTypeInfoType_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);     -- oleauto.h:3296

    function ITypeLib_GetTypeInfoOfGuid_Proxy(
                This   : access ITypeLib;
                guid   : access Win32.Objbase.IID;
                pptinfo: access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3303

    procedure ITypeLib_GetTypeInfoOfGuid_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3309

    function ITypeLib_GetLibAttr_Proxy(
                This      : access ITypeLib;
                pptlibattr: access LPTLIBATTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3316

    procedure ITypeLib_GetLibAttr_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3321

    function ITypeLib_GetTypeComp_Proxy(
                This   : access ITypeLib;
                pptcomp: access LPTYPECOMP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3328

    procedure ITypeLib_GetTypeComp_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3333

    function ITypeLib_GetDocumentation_Proxy(
                This          : access ITypeLib;
                index         : Win32.INT;
                pbstrName     : access LPBSTR;
                pbstrDocString: access LPBSTR;
                pdwHelpContext: access Win32.DWORD;
                pbstrHelpFile : access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3340

    procedure ITypeLib_GetDocumentation_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3349

    function ITypeLib_IsName_Proxy(
                This     : access ITypeLib;
                szNameBuf: Win32.Objbase.LPOLESTR;
                lHashVal : Win32.ULONG;
                pfName   : access Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3356

    procedure ITypeLib_IsName_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3363

    function ITypeLib_FindName_Proxy(
                This     : access ITypeLib;
                szNameBuf: Win32.Objbase.LPOLESTR;
                lHashVal : Win32.ULONG;
                rgptinfo : access LPTYPEINFO;
                rgmemid  : access Win32.USHORT;
                pcFound  : Win32.PWSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3370

    procedure ITypeLib_FindName_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3379

    procedure ITypeLib_ReleaseTLibAttr_Proxy(
                This     : access ITypeLib;
                ptlibattr: access TLIBATTR);                -- oleauto.h:3386

    procedure ITypeLib_ReleaseTLibAttr_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3391

    function IErrorInfo_GetGUID_Proxy(
                This : access IErrorInfo;
                pguid: access Win32.Objbase.IID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3521

    procedure IErrorInfo_GetGUID_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3526

    function IErrorInfo_GetSource_Proxy(
                This       : access IErrorInfo;
                pbstrSource: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3533

    procedure IErrorInfo_GetSource_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3538

    function IErrorInfo_GetDescription_Proxy(
                This            : access IErrorInfo;
                pbstrDescription: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3545

    procedure IErrorInfo_GetDescription_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3550

    function IErrorInfo_GetHelpFile_Proxy(
                This         : access IErrorInfo;
                pbstrHelpFile: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3557

    procedure IErrorInfo_GetHelpFile_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3562

    function IErrorInfo_GetHelpContext_Proxy(
                This          : access IErrorInfo;
                pdwHelpContext: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3569

    procedure IErrorInfo_GetHelpContext_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3574

    function ICreateErrorInfo_SetGUID_Proxy(
                This : access ICreateErrorInfo;
                rguid: access Win32.Objbase.IID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3704

    procedure ICreateErrorInfo_SetGUID_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3709

    function ICreateErrorInfo_SetSource_Proxy(
                This    : access ICreateErrorInfo;
                szSource: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3716

    procedure ICreateErrorInfo_SetSource_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3721

    function ICreateErrorInfo_SetDescription_Proxy(
                This         : access ICreateErrorInfo;
                szDescription: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3728

    procedure ICreateErrorInfo_SetDescription_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3733

    function ICreateErrorInfo_SetHelpFile_Proxy(
                This      : access ICreateErrorInfo;
                szHelpFile: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3740

    procedure ICreateErrorInfo_SetHelpFile_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3745

    function ICreateErrorInfo_SetHelpContext_Proxy(
                This         : access ICreateErrorInfo;
                dwHelpContext: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3752

    procedure ICreateErrorInfo_SetHelpContext_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3757

    function ISupportErrorInfo_InterfaceSupportsErrorInfo_Proxy(
                This: access ISupportErrorInfo;
                riid: access Win32.Objbase.IID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3847

    procedure ISupportErrorInfo_InterfaceSupportsErrorInfo_Stub(
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : access Win32.DWORD);
                                                            -- oleauto.h:3852

    function SysAllocString(
                sz: Win32.PCWSTR)
               return BSTR;                                 -- oleauto.h:3876

    function SysReAllocString(
                pbstr: access LPBSTR;
                sz   : Win32.PCWSTR)
               return Win32.INT;                            -- oleauto.h:3877

    function SysAllocStringLen(
                pch: Win32.PCWSTR;
                cch: Win32.UINT)
               return BSTR;                                 -- oleauto.h:3878

    function SysReAllocStringLen(
                pbstr: access LPBSTR;
                pch  : Win32.PCWSTR;
                cch  : Win32.UINT)
               return Win32.INT;                            -- oleauto.h:3879

    procedure SysFreeString(
                bstr: Win32.Oleauto.BSTR);                  -- oleauto.h:3880

    function SysStringLen(
                bstr: Win32.Oleauto.BSTR)
               return Win32.UINT;                           -- oleauto.h:3881

    function SysStringByteLen(
                bstr: Win32.Oleauto.BSTR)
               return Win32.UINT;                           -- oleauto.h:3884

    function SysAllocStringByteLen(
                psz: Win32.PCSTR;
                len: Win32.UINT)
               return BSTR;                                 -- oleauto.h:3885

    function DosDateTimeToVariantTime(
                wDosDate: Win32.USHORT;
                wDosTime: Win32.USHORT;
                pvtime  : access Win32.DOUBLE)
               return Win32.INT;                            -- oleauto.h:3893

    function VariantTimeToDosDateTime(
                vtime    : Win32.DOUBLE;
                pwDosDate: Win32.PWSTR;
                pwDosTime: Win32.PWSTR)
               return Win32.INT;                            -- oleauto.h:3899

    function SafeArrayAllocDescriptor(
                cDims  : Win32.UINT;
                ppsaOut: access LPSAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3909

    function SafeArrayAllocData(
                psa: access SAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3911

    function SafeArrayCreate(
                vt       : VARTYPE;
                cDims    : Win32.UINT;
                rgsabound: access SAFEARRAYBOUND)
               return LPSAFEARRAY;                          -- oleauto.h:3914

    function SafeArrayDestroyDescriptor(
                psa: access SAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3919

    function SafeArrayDestroyData(
                psa: access SAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3921

    function SafeArrayDestroy(
                psa: access SAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3923

    function SafeArrayRedim(
                psa        : access SAFEARRAY;
                psaboundNew: access SAFEARRAYBOUND)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3925

    function SafeArrayGetDim(
                psa: access SAFEARRAY)
               return Win32.UINT;                           -- oleauto.h:3927

    function SafeArrayGetElemsize(
                psa: access SAFEARRAY)
               return Win32.UINT;                           -- oleauto.h:3929

    function SafeArrayGetUBound(
                psa     : access SAFEARRAY;
                nDim    : Win32.UINT;
                plUbound: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3932

    function SafeArrayGetLBound(
                psa     : access SAFEARRAY;
                nDim    : Win32.UINT;
                plLbound: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3935

    function SafeArrayLock(
                psa: access SAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3937

    function SafeArrayUnlock(
                psa: access SAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3939

    subtype HUGE is Win32.VOID;                             -- oleauto.h:3941
    type HUGEP is access all HUGE;

    function SafeArrayAccessData(
                psa    : access SAFEARRAY;
                ppvData: access HUGEP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3941

    function SafeArrayUnaccessData(
                psa: access SAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3943

    function SafeArrayGetElement(
                psa      : access SAFEARRAY;
                rgIndices: access Win32.LONG;
                pv       : Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3946

    function SafeArrayPutElement(
                psa      : access SAFEARRAY;
                rgIndices: access Win32.LONG;
                pv       : Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3952

    function SafeArrayCopy(
                psa    : access SAFEARRAY;
                ppsaOut: access LPSAFEARRAY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3958

    function SafeArrayPtrOfIndex(
                psa      : access SAFEARRAY;
                rgIndices: access Win32.LONG;
                ppvData  : access HUGEP)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3963

    procedure VariantInit(
                pvarg: access VARIANT);                     -- oleauto.h:3974

    function VariantClear(
                pvarg: access VARIANT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3977

    function VariantCopy(
                pvargDest: access VARIANT;
                pvargSrc : access VARIANT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3980

    function VariantCopyInd(
                pvarDest: access VARIANT;
                pvargSrc: access VARIANT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3985

    function VariantChangeType(
                pvargDest: access VARIANT;
                pvarSrc  : access VARIANT;
                wFlags   : Win32.USHORT;
                vt       : VARTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3990

    function VariantChangeTypeEx(
                pvargDest: access VARIANT;
                pvarSrc  : access VARIANT;
                lcid     : Win32.Winnt.LCID;
                wFlags   : Win32.USHORT;
                vt       : VARTYPE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:3997

    function VarUI1FromI2(
                sIn  : Win32.SHORT;
                pbOut: Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4031

    function VarUI1FromI4(
                lIn  : Win32.LONG;
                pbOut: Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4032

    function VarUI1FromR4(
                fltIn: Win32.FLOAT;
                pbOut: Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4033

    function VarUI1FromR8(
                dblIn: Win32.DOUBLE;
                pbOut: Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4034

    function VarUI1FromCy(
                cyIn : CY;
                pbOut: Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4035

    function VarUI1FromDate(
                dateIn: DATE;
                pbOut : Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4036

    function VarUI1FromStr(
                strIn  : Win32.PWSTR;
                lcid   : Win32.Winnt.LCID;
                dwFlags: Win32.ULONG;
                pbOut  : Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4037

    function VarUI1FromDisp(
                pdispIn: access IDispatch;
                lcid   : Win32.Winnt.LCID;
                pbOut  : Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4038

    function VarUI1FromBool(
                boolIn: VARIANT_BOOL;
                pbOut : Win32.PUCHAR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4039

    function VarI2FromUI1(
                bIn  : Win32.UCHAR;
                psOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4041

    function VarI2FromI4(
                lIn  : Win32.LONG;
                psOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4042

    function VarI2FromR4(
                fltIn: Win32.FLOAT;
                psOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4043

    function VarI2FromR8(
                dblIn: Win32.DOUBLE;
                psOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4044

    function VarI2FromCy(
                cyIn : CY;
                psOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4045

    function VarI2FromDate(
                dateIn: DATE;
                psOut : access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4046

    function VarI2FromStr(
                strIn  : Win32.PWSTR;
                lcid   : Win32.Winnt.LCID;
                dwFlags: Win32.ULONG;
                psOut  : access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4047

    function VarI2FromDisp(
                pdispIn: access IDispatch;
                lcid   : Win32.Winnt.LCID;
                psOut  : access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4048

    function VarI2FromBool(
                boolIn: VARIANT_BOOL;
                psOut : access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4049

    function VarI4FromUI1(
                bIn  : Win32.UCHAR;
                plOut: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4051

    function VarI4FromI2(
                sIn  : Win32.SHORT;
                plOut: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4052

    function VarI4FromR4(
                fltIn: Win32.FLOAT;
                plOut: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4053

    function VarI4FromR8(
                dblIn: Win32.DOUBLE;
                plOut: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4054

    function VarI4FromCy(
                cyIn : CY;
                plOut: access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4055

    function VarI4FromDate(
                dateIn: DATE;
                plOut : access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4056

    function VarI4FromStr(
                strIn  : Win32.PWSTR;
                lcid   : Win32.Winnt.LCID;
                dwFlags: Win32.ULONG;
                plOut  : access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4057

    function VarI4FromDisp(
                pdispIn: access IDispatch;
                lcid   : Win32.Winnt.LCID;
                plOut  : access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4058

    function VarI4FromBool(
                boolIn: VARIANT_BOOL;
                plOut : access Win32.LONG)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4059

    function VarR4FromUI1(
                bIn    : Win32.UCHAR;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4061

    function VarR4FromI2(
                sIn    : Win32.SHORT;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4062

    function VarR4FromI4(
                lIn    : Win32.LONG;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4063

    function VarR4FromR8(
                dblIn  : Win32.DOUBLE;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4064

    function VarR4FromCy(
                cyIn   : CY;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4065

    function VarR4FromDate(
                dateIn : DATE;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4066

    function VarR4FromStr(
                strIn  : Win32.PWSTR;
                lcid   : Win32.Winnt.LCID;
                dwFlags: Win32.ULONG;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4067

    function VarR4FromDisp(
                pdispIn: access IDispatch;
                lcid   : Win32.Winnt.LCID;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4068

    function VarR4FromBool(
                boolIn : VARIANT_BOOL;
                pfltOut: access Win32.FLOAT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4069

    function VarR8FromUI1(
                bIn    : Win32.UCHAR;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4071

    function VarR8FromI2(
                sIn    : Win32.SHORT;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4072

    function VarR8FromI4(
                lIn    : Win32.LONG;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4073

    function VarR8FromR4(
                fltIn  : Win32.FLOAT;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4074

    function VarR8FromCy(
                cyIn   : CY;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4075

    function VarR8FromDate(
                dateIn : DATE;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4076

    function VarR8FromStr(
                strIn  : Win32.PWSTR;
                lcid   : Win32.Winnt.LCID;
                dwFlags: Win32.ULONG;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4077

    function VarR8FromDisp(
                pdispIn: access IDispatch;
                lcid   : Win32.Winnt.LCID;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4078

    function VarR8FromBool(
                boolIn : VARIANT_BOOL;
                pdblOut: access Win32.DOUBLE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4079

    function VarDateFromUI1(
                bIn     : Win32.UCHAR;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4081

    function VarDateFromI2(
                sIn     : Win32.SHORT;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4082

    function VarDateFromI4(
                lIn     : Win32.LONG;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4083

    function VarDateFromR4(
                fltIn   : Win32.FLOAT;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4084

    function VarDateFromR8(
                dblIn   : Win32.DOUBLE;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4085

    function VarDateFromCy(
                cyIn    : CY;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4086

    function VarDateFromStr(
                strIn   : Win32.PWSTR;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4087

    function VarDateFromDisp(
                pdispIn : access IDispatch;
                lcid    : Win32.Winnt.LCID;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4088

    function VarDateFromBool(
                boolIn  : VARIANT_BOOL;
                pdateOut: access DATE)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4089

    function VarCyFromUI1(
                bIn   : Win32.UCHAR;
                pcyOut: access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4091

    function VarCyFromI2(
                sIn   : Win32.SHORT;
                pcyOut: access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4092

    function VarCyFromI4(
                lIn   : Win32.LONG;
                pcyOut: access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4093

    function VarCyFromR4(
                fltIn : Win32.FLOAT;
                pcyOut: access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4094

    function VarCyFromR8(
                dblIn : Win32.DOUBLE;
                pcyOut: access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4095

    function VarCyFromDate(
                dateIn: DATE;
                pcyOut: access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4096

    function VarCyFromStr(
                strIn  : Win32.PWSTR;
                lcid   : Win32.Winnt.LCID;
                dwFlags: Win32.ULONG;
                pcyOut : access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4097

    function VarCyFromDisp(
                pdispIn: access IDispatch;
                lcid   : Win32.Winnt.LCID;
                pcyOut : access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4098

    function VarCyFromBool(
                boolIn: VARIANT_BOOL;
                pcyOut: access CY)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4099

    function VarBstrFromUI1(
                bVal    : Win32.UCHAR;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4101

    function VarBstrFromI2(
                iVal    : Win32.SHORT;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4102

    function VarBstrFromI4(
                lIn     : Win32.LONG;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4103

    function VarBstrFromR4(
                fltIn   : Win32.FLOAT;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4104

    function VarBstrFromR8(
                dblIn   : Win32.DOUBLE;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4105

    function VarBstrFromCy(
                cyIn    : CY;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4106

    function VarBstrFromDate(
                dateIn  : DATE;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4107

    function VarBstrFromDisp(
                pdispIn : access IDispatch;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4108

    function VarBstrFromBool(
                boolIn  : VARIANT_BOOL;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pbstrOut: access LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4109

    function VarBoolFromUI1(
                bIn     : Win32.UCHAR;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4111

    function VarBoolFromI2(
                sIn     : Win32.SHORT;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4112

    function VarBoolFromI4(
                lIn     : Win32.LONG;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4113

    function VarBoolFromR4(
                fltIn   : Win32.FLOAT;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4114

    function VarBoolFromR8(
                dblIn   : Win32.DOUBLE;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4115

    function VarBoolFromDate(
                dateIn  : DATE;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4116

    function VarBoolFromCy(
                cyIn    : CY;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4117

    function VarBoolFromStr(
                strIn   : Win32.PWSTR;
                lcid    : Win32.Winnt.LCID;
                dwFlags : Win32.ULONG;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4118

    function VarBoolFromDisp(
                pdispIn : access IDispatch;
                lcid    : Win32.Winnt.LCID;
                pboolOut: access Win32.SHORT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4119

    function LHashValOfNameSysA(
                syskind: Win32.Oleauto.SYSKIND;
                lcid   : Win32.Winnt.LCID;
                szName : Win32.PCSTR)
               return Win32.ULONG;                          -- oleauto.h:4190

    function LHashValOfNameSys(
                syskind: Win32.Oleauto.SYSKIND;
                lcid   : Win32.Winnt.LCID;
                szName : Win32.PCWSTR)
               return Win32.ULONG;                          -- oleauto.h:4194

   function LHashValOfName(lcid  : Win32.Winnt.LCID;        -- oleauto.h:4196
                           szName: Win32.PCWSTR) 
                            return Win32.ULONG;             

    function WHashValOfLHashVal(lhashval: Win32.ULONG) 
                                return Win32.USHORT;        -- oleauto.h:4199
 
    function IsHashValCompatible(lhashval1: Win32.ULONG;
                                 lhashval2: Win32.ULONG)
                                 return Win32.BOOL;         -- oleauto.h:4202

    function LoadTypeLib(
                szFile: Win32.PCWSTR;
                pptlib: access LPTYPELIB)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4208

    function LoadRegTypeLib(
                rguid    : access Win32.Objbase.IID;
                wVerMajor: Win32.WORD;
                wVerMinor: Win32.WORD;
                lcid     : Win32.Winnt.LCID;
                pptlib   : access LPTYPELIB)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4213

    function QueryPathOfRegTypeLib(
                guid          : access Win32.Objbase.IID;
                wMaj          : Win32.USHORT;
                wMin          : Win32.USHORT;
                lcid          : Win32.Winnt.LCID;
                lpbstrPathName: LPBSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4223

    function RegisterTypeLib(
                ptlib     : access ITypeLib;
                szFullPath: Win32.PWSTR;
                szHelpDir : Win32.PWSTR)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4233

    function DeregisterTypeLib(
                rguid    : access Win32.Objbase.IID;
                wVerMajor: Win32.WORD;
                wVerMinor: Win32.WORD;
                lcid     : Win32.Winnt.LCID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4239

    function CreateTypeLib(
                syskind: Win32.Oleauto.SYSKIND;
                szFile : Win32.PCWSTR;
                ppctlib: access LPCREATETYPELIB)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4242

    function DispGetParam(
                pdispparams: access DISPPARAMS;
                position   : Win32.UINT;
                vtTarg     : VARTYPE;
                pvarResult : access VARIANT;
                puArgErr   : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4286

    function DispGetIDsOfNames(
                ptinfo   : access ITypeInfo;
                rgszNames: access Win32.Objbase.LPOLESTR;
                cNames   : Win32.UINT;
                rgdispid : access DISPID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4296

    function DispInvoke(
                this        : Win32.PVOID;
                ptinfo      : access ITypeInfo;
                dispidMember: DISPID;
                wFlags      : Win32.WORD;
                pparams     : access DISPPARAMS;
                pvarResult  : access VARIANT;
                pexcepinfo  : access EXCEPINFO;
                puArgErr    : access Win32.UINT)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4305

    function CreateDispTypeInfo(
                pidata : LPINTERFACEDATA;
                lcid   : Win32.Winnt.LCID;
                pptinfo: access LPTYPEINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4318

    function CreateStdDispatch(
                punkOuter   : access Win32.Objbase.IUnknown;
                pvThis      : Win32.PVOID;
                ptinfo      : access ITypeInfo;
                ppunkStdDisp: access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4327

    function RegisterActiveObject(
                punk       : Win32.Objbase.IUnknown;
                rclsid     : access Win32.Objbase.IID;
                dwFlags    : Win32.DWORD;
                pdwRegister: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4343

    function RevokeActiveObject(
                dwRegister: Win32.DWORD;
                pvReserved: Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4350

    function GetActiveObject(
                rclsid    : access Win32.Objbase.IID;
                pvReserved: Win32.PVOID;
                ppunk     : access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4355

    function SetErrorInfo(
                dwReserved: Win32.ULONG;
                perrinfo  : access IErrorInfo)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4364

    function GetErrorInfo(
                dwReserved: Win32.ULONG;
                pperrinfo : access LPERRORINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4365

    function CreateErrorInfo(
                pperrinfo: access LPERRORINFO)
               return Win32.Objbase.HRESULT;                -- oleauto.h:4366

    function OaBuildVersion return Win32.ULONG;             -- oleauto.h:4372

    function V_VT(X: access VARIANT) return VARTYPE;        -- oleauto.h:4385
    function V_ISBYREF(X: access VARIANT) return VARTYPE;   -- oleauto.h:4386
    function V_ISARRAY(X: access VARIANT) return  VARTYPE;  -- oleauto.h:4387
    function V_ISVECTOR(X: access VARIANT) return  VARTYPE; -- oleauto.h:4388
    function V_I2(X: access VARIANT) return Win32.SHORT;    -- oleauto.h:4395
    function V_NONE(X: access VARIANT) return Win32.SHORT;  -- oleauto.h:4390
    function V_UI1(X: access VARIANT) return Win32.UCHAR;   -- oleauto.h:4392
    function V_UI1REF(X: access VARIANT) return Win32.PUCHAR;
                                                            -- oleauto.h:4393
    function V_I2REF(X: access VARIANT) return Win32.PSHORT;-- oleauto.h:4396
    function V_I4(X: access VARIANT) return Win32.LONG;     -- oleauto.h:4398
    function V_I4REF(X: access VARIANT) return Win32.PLONG; -- oleauto.h:4390
    function V_R4(X: access VARIANT) return Win32.FLOAT;    -- oleauto.h:4404
    function V_R4REF(X: access VARIANT) return Win32.PFLOAT;-- oleauto.h:4405
    function V_R8(X: access VARIANT) return Win32.DOUBLE;   -- oleauto.h:4407
    function V_R8REF(X: access VARIANT) return Win32.PDOUBLE;
                                                            -- oleauto.h:4408
    function V_CY(X: access VARIANT) return CY;             -- oleauto.h:4410
    function V_CYREF(X: access VARIANT) return PCY;         -- oleauto.h:4411
    function V_DATE(X: access VARIANT) return Win32.Oleauto.DATE;
                                                            -- oleauto.h:4413
    function V_DATEREF(X: access VARIANT) return Win32.Oleauto.PDATE; 
    function V_BSTR(X: access VARIANT) return BSTR;         -- oleauto.h:4416
                                                            -- oleauto.h:4414
    function V_BSTRREF(X: access VARIANT) return LPBSTR;    -- oleauto.h:4417
    function V_DISPATCH(X: access VARIANT) return LPDISPATCH;
                                                            -- oleauto.h:4419
    function V_DISPATCHREF(X: access VARIANT) return a_LPDISPATCH_t;            
                                                            -- oleauto.h:4420

    function V_ERROR(X: access VARIANT) return Win32.Objbase.SCODE;     
                                                            -- oleauto.h:4422
    function V_ERRORREF(X: access VARIANT) return Win32.Objbase.PSCODE;         
                                                            -- oleauto.h:4423
    function V_BOOL(X: access VARIANT) return VARIANT_BOOL;     
                                                            -- oleauto.h:4425
    function V_BOOLREF(X: access VARIANT) return PVARIANT_BOOL;
                                                            -- oleauto.h:4426
    function V_UNKNOWN(X: access VARIANT) return Win32.Objbase.LPUNKNOWN;     
                                                            -- oleauto.h:4428
    function V_UNKNOWNREF(X: access VARIANT) return a_a_IUnknown;            
                                                -- oleauto.h:4429
    function V_VARIANTREF(X: access VARIANT) return  LPVARIANT;         
                                                -- oleauto.h:4432
    function V_ARRAY(X: access VARIANT) return LPSAFEARRAY; -- oleauto.h:4448

    function V_ARRAYREF(X: access VARIANT) return PLPSAFEARRAY;         
                                                            -- oleauto.h:4449
    function V_BYREF(X: access VARIANT) return Win32.PVOID; -- oleauto.h:4451
     
private

    pragma Convention(C_Pass_By_Copy, ICreateTypeInfo);                  -- oleauto.h:114
    pragma Convention(C_Pass_By_Copy, ICreateTypeLib);                   -- oleauto.h:120
    pragma Convention(C_Pass_By_Copy, IDispatch);                        -- oleauto.h:126
    pragma Convention(C_Pass_By_Copy, IEnumVARIANT);                     -- oleauto.h:132
    pragma Convention(C_Pass_By_Copy, ITypeComp);                        -- oleauto.h:138
    pragma Convention(C_Pass_By_Copy, ITypeInfo);                        -- oleauto.h:144
    pragma Convention(C_Pass_By_Copy, ITypeLib);                         -- oleauto.h:150
    pragma Convention(C_Pass_By_Copy, IErrorInfo);                       -- oleauto.h:156
    pragma Convention(C_Pass_By_Copy, ICreateErrorInfo);                 -- oleauto.h:162
    pragma Convention(C_Pass_By_Copy, ISupportErrorInfo);                -- oleauto.h:168
    pragma Convention(C_Pass_By_Copy, BLOB);                             -- oleauto.h:228
    pragma Convention(C_Pass_By_Copy, CLIPDATA);                         -- oleauto.h:242
    pragma Convention(C_Pass_By_Copy, SAFEARRAYBOUND);                   -- oleauto.h:255
    pragma Convention(C, SAFEARRAY);                        -- oleauto.h:286
    pragma Convention(C_Pass_By_Copy, CY);                               -- oleauto.h:336
    pragma Convention(C_Pass_By_Copy, IDLDESC);                          -- oleauto.h:692
    pragma Convention(C_Pass_By_Copy, DISPPARAMS);                       -- oleauto.h:760
    pragma Convention(C, RemEXCEPINFO);                     -- oleauto.h:769
    pragma Convention(C, EXCEPINFO);                        -- oleauto.h:809
    pragma Convention(C, ICreateTypeInfoVtbl);              -- oleauto.h:1085
    pragma Convention(C, ICreateTypeLibVtbl);               -- oleauto.h:1657
    pragma Convention(C, IDispatchVtbl);                    -- oleauto.h:1978
    pragma Convention(C, IEnumVARIANTVtbl);                 -- oleauto.h:2166
    pragma Convention(C, ITypeCompVtbl);                    -- oleauto.h:2360
    pragma Convention(C, ITypeInfoVtbl);                    -- oleauto.h:2574
    pragma Convention(C, TLIBATTR);                         -- oleauto.h:3074
    pragma Convention(C, ITypeLibVtbl);                     -- oleauto.h:3141
    pragma Convention(C, IErrorInfoVtbl);                   -- oleauto.h:3443
    pragma Convention(C, ICreateErrorInfoVtbl);             -- oleauto.h:3626
    pragma Convention(C_Pass_By_Copy, ISupportErrorInfoVtbl);            -- oleauto.h:3797
    pragma Convention(C_Pass_By_Copy, PARAMDATA);                        -- oleauto.h:4259
    pragma Convention(C, METHODDATA);                       -- oleauto.h:4264
    pragma Convention(C_Pass_By_Copy, INTERFACEDATA);                    -- oleauto.h:4275
    pragma Convention(C_Pass_By_Copy, VARIANT);                          -- oleauto.h:467
    pragma Convention(C_Pass_By_Copy, TYPEDESC);                         -- oleauto.h:658
    pragma Convention(C_Pass_By_Copy, ELEMDESC);                         -- oleauto.h:718
    pragma Convention(C, TYPEATTR);                         -- oleauto.h:733
    pragma Convention(C, FUNCDESC);                         -- oleauto.h:860
    pragma Convention(C, VARDESC);                          -- oleauto.h:902
    pragma Convention(C, ARRAYDESC);                        -- oleauto.h:659

    pragma Import(Stdcall, RemVariant_v0_1_c_ifspec, "RemVariant_v0_1_c_ifspec");
                                                            -- oleauto.h:971
    pragma Import(Stdcall, RemVariant_v0_1_s_ifspec, "RemVariant_v0_1_s_ifspec");
                                                            -- oleauto.h:972
    pragma Import(Stdcall, IID_ICreateTypeInfo, "IID_ICreateTypeInfo");
                                                            -- oleauto.h:990 
    pragma Import(Stdcall, IID_ICreateTypeLib, "IID_ICreateTypeLib"); 
                                                            -- oleauto.h:1614
    pragma Import(Stdcall, IID_IDispatch, "IID_IDispatch");       -- oleauto.h:1942 
    pragma Import(Stdcall, IID_IEnumVARIANT, "IID_IEnumVARIANT"); -- oleauto.h:2142
    pragma Import(Stdcall, IID_ITypeComp, "IID_ITypeComp");       -- oleauto.h:2335 
    pragma Import(Stdcall, IID_ITypeInfo, "IID_ITypeInfo");       -- oleauto.h:2476
    pragma Import(Stdcall, IID_ITypeLib, "IID_ITypeLib");         -- oleauto.h:3088 
    pragma Import(Stdcall, IID_IErrorInfo, "IID_IErrorInfo");     -- oleauto.h:3417
    pragma Import(Stdcall, IID_ICreateErrorInfo, "IID_ICreateErrorInfo");
                                                            -- oleauto.h:360 0
    pragma Import(Stdcall, IID_ISupportErrorInfo, "IID_ISupportErrorInfo");
                                                            -- oleauto.h:3 783

    pragma Import(Stdcall, ICreateTypeInfo_SetGuid_Proxy, 
                     "ICreateTypeInfo_SetGuid_Proxy");      -- oleauto.h:1304
    pragma Import(Stdcall, ICreateTypeInfo_SetGuid_Stub, 
                     "ICreateTypeInfo_SetGuid_Stub");       -- oleauto.h:1309
    pragma Import(Stdcall, ICreateTypeInfo_SetTypeFlags_Proxy, 
                     "ICreateTypeInfo_SetTypeFlags_Proxy"); -- oleauto.h:1316
    pragma Import(Stdcall, ICreateTypeInfo_SetTypeFlags_Stub, 
                     "ICreateTypeInfo_SetTypeFlags_Stub");  -- oleauto.h:1321
    pragma Import(Stdcall, ICreateTypeInfo_SetDocString_Proxy, 
                     "ICreateTypeInfo_SetDocString_Proxy"); -- oleauto.h:1328
    pragma Import(Stdcall, ICreateTypeInfo_SetDocString_Stub, 
                     "ICreateTypeInfo_SetDocString_Stub");  -- oleauto.h:1333
    pragma Import(Stdcall, ICreateTypeInfo_SetHelpContext_Proxy, 
                     "ICreateTypeInfo_SetHelpContext_Proxy");
                                                            -- oleauto.h:1340
    pragma Import(Stdcall, ICreateTypeInfo_SetHelpContext_Stub, 
                     "ICreateTypeInfo_SetHelpContext_Stub");-- oleauto.h:1345
    pragma Import(Stdcall, ICreateTypeInfo_SetVersion_Proxy, 
                     "ICreateTypeInfo_SetVersion_Proxy");   -- oleauto.h:1352
    pragma Import(Stdcall, ICreateTypeInfo_SetVersion_Stub, 
                     "ICreateTypeInfo_SetVersion_Stub");    -- oleauto.h:1358
    pragma Import(Stdcall, ICreateTypeInfo_AddRefTypeInfo_Proxy, 
                     "ICreateTypeInfo_AddRefTypeInfo_Proxy");
                                                            -- oleauto.h:1365
    pragma Import(Stdcall, ICreateTypeInfo_AddRefTypeInfo_Stub, 
                     "ICreateTypeInfo_AddRefTypeInfo_Stub");-- oleauto.h:1371
    pragma Import(Stdcall, ICreateTypeInfo_AddFuncDesc_Proxy, 
                     "ICreateTypeInfo_AddFuncDesc_Proxy");  -- oleauto.h:1378
    pragma Import(Stdcall, ICreateTypeInfo_AddFuncDesc_Stub, 
                     "ICreateTypeInfo_AddFuncDesc_Stub");   -- oleauto.h:1384
    pragma Import(Stdcall, ICreateTypeInfo_AddImplType_Proxy, 
                     "ICreateTypeInfo_AddImplType_Proxy");  -- oleauto.h:1391
    pragma Import(Stdcall, ICreateTypeInfo_AddImplType_Stub, 
                     "ICreateTypeInfo_AddImplType_Stub");   -- oleauto.h:1397
    pragma Import(Stdcall, ICreateTypeInfo_SetImplTypeFlags_Proxy, 
                     "ICreateTypeInfo_SetImplTypeFlags_Proxy");
                                                            -- oleauto.h:1404
    pragma Import(Stdcall, ICreateTypeInfo_SetImplTypeFlags_Stub, 
                     "ICreateTypeInfo_SetImplTypeFlags_Stub");
                                                            -- oleauto.h:1410
    pragma Import(Stdcall, ICreateTypeInfo_SetAlignment_Proxy, 
                     "ICreateTypeInfo_SetAlignment_Proxy"); -- oleauto.h:1417
    pragma Import(Stdcall, ICreateTypeInfo_SetAlignment_Stub, 
                     "ICreateTypeInfo_SetAlignment_Stub");  -- oleauto.h:1422
    pragma Import(Stdcall, ICreateTypeInfo_SetSchema_Proxy, 
                     "ICreateTypeInfo_SetSchema_Proxy");    -- oleauto.h:1429
    pragma Import(Stdcall, ICreateTypeInfo_SetSchema_Stub, 
                     "ICreateTypeInfo_SetSchema_Stub");     -- oleauto.h:1434
    pragma Import(Stdcall, ICreateTypeInfo_AddVarDesc_Proxy, 
                     "ICreateTypeInfo_AddVarDesc_Proxy");   -- oleauto.h:1441
    pragma Import(Stdcall, ICreateTypeInfo_AddVarDesc_Stub, 
                     "ICreateTypeInfo_AddVarDesc_Stub");    -- oleauto.h:1447
    pragma Import(Stdcall, ICreateTypeInfo_SetFuncAndParamNames_Proxy, 
                     "ICreateTypeInfo_SetFuncAndParamNames_Proxy");
                                                            -- oleauto.h:1454
    pragma Import(Stdcall, ICreateTypeInfo_SetFuncAndParamNames_Stub, 
                     "ICreateTypeInfo_SetFuncAndParamNames_Stub");
                                                            -- oleauto.h:1461
    pragma Import(Stdcall, ICreateTypeInfo_SetVarName_Proxy, 
                     "ICreateTypeInfo_SetVarName_Proxy");   -- oleauto.h:1468
    pragma Import(Stdcall, ICreateTypeInfo_SetVarName_Stub, 
                     "ICreateTypeInfo_SetVarName_Stub");    -- oleauto.h:1474
    pragma Import(Stdcall, ICreateTypeInfo_SetTypeDescAlias_Proxy, 
                     "ICreateTypeInfo_SetTypeDescAlias_Proxy");
                                                            -- oleauto.h:1481
    pragma Import(Stdcall, ICreateTypeInfo_SetTypeDescAlias_Stub, 
                     "ICreateTypeInfo_SetTypeDescAlias_Stub");
                                                            -- oleauto.h:1486
    pragma Import(Stdcall, ICreateTypeInfo_DefineFuncAsDllEntry_Proxy, 
                     "ICreateTypeInfo_DefineFuncAsDllEntry_Proxy");
                                                            -- oleauto.h:1493
    pragma Import(Stdcall, ICreateTypeInfo_DefineFuncAsDllEntry_Stub, 
                     "ICreateTypeInfo_DefineFuncAsDllEntry_Stub");
                                                            -- oleauto.h:1500
    pragma Import(Stdcall, ICreateTypeInfo_SetFuncDocString_Proxy, 
                     "ICreateTypeInfo_SetFuncDocString_Proxy");
                                                            -- oleauto.h:1507
    pragma Import(Stdcall, ICreateTypeInfo_SetFuncDocString_Stub, 
                     "ICreateTypeInfo_SetFuncDocString_Stub");
                                                            -- oleauto.h:1513
    pragma Import(Stdcall, ICreateTypeInfo_SetVarDocString_Proxy, 
                     "ICreateTypeInfo_SetVarDocString_Proxy");
                                                            -- oleauto.h:1520
    pragma Import(Stdcall, ICreateTypeInfo_SetVarDocString_Stub, 
                     "ICreateTypeInfo_SetVarDocString_Stub");
                                                            -- oleauto.h:1526
    pragma Import(Stdcall, ICreateTypeInfo_SetFuncHelpContext_Proxy, 
                     "ICreateTypeInfo_SetFuncHelpContext_Proxy");
                                                            -- oleauto.h:1533
    pragma Import(Stdcall, ICreateTypeInfo_SetFuncHelpContext_Stub, 
                     "ICreateTypeInfo_SetFuncHelpContext_Stub");
                                                            -- oleauto.h:1539
    pragma Import(Stdcall, ICreateTypeInfo_SetVarHelpContext_Proxy, 
                     "ICreateTypeInfo_SetVarHelpContext_Proxy");
                                                            -- oleauto.h:1546
    pragma Import(Stdcall, ICreateTypeInfo_SetVarHelpContext_Stub, 
                     "ICreateTypeInfo_SetVarHelpContext_Stub");
                                                            -- oleauto.h:1552
    pragma Import(Stdcall, ICreateTypeInfo_SetMops_Proxy, 
                     "ICreateTypeInfo_SetMops_Proxy");      -- oleauto.h:1559
    pragma Import(Stdcall, ICreateTypeInfo_SetMops_Stub, 
                     "ICreateTypeInfo_SetMops_Stub");       -- oleauto.h:1565
    pragma Import(Stdcall, ICreateTypeInfo_SetTypeIdldesc_Proxy, 
                     "ICreateTypeInfo_SetTypeIdldesc_Proxy");
                                                            -- oleauto.h:1572
    pragma Import(Stdcall, ICreateTypeInfo_SetTypeIdldesc_Stub, 
                     "ICreateTypeInfo_SetTypeIdldesc_Stub");-- oleauto.h:1577
    pragma Import(Stdcall, ICreateTypeInfo_LayOut_Proxy, 
                     "ICreateTypeInfo_LayOut_Proxy");       -- oleauto.h:1584
    pragma Import(Stdcall, ICreateTypeInfo_LayOut_Stub, 
                     "ICreateTypeInfo_LayOut_Stub");        -- oleauto.h:1588
    pragma Import(Stdcall, ICreateTypeLib_CreateTypeInfo_Proxy, 
                     "ICreateTypeLib_CreateTypeInfo_Proxy");-- oleauto.h:1772
    pragma Import(Stdcall, ICreateTypeLib_CreateTypeInfo_Stub, 
                     "ICreateTypeLib_CreateTypeInfo_Stub"); -- oleauto.h:1779
    pragma Import(Stdcall, ICreateTypeLib_SetName_Proxy, 
                     "ICreateTypeLib_SetName_Proxy");       -- oleauto.h:1786
    pragma Import(Stdcall, ICreateTypeLib_SetName_Stub, 
                     "ICreateTypeLib_SetName_Stub");        -- oleauto.h:1791
    pragma Import(Stdcall, ICreateTypeLib_SetVersion_Proxy, 
                     "ICreateTypeLib_SetVersion_Proxy");    -- oleauto.h:1798
    pragma Import(Stdcall, ICreateTypeLib_SetVersion_Stub, 
                     "ICreateTypeLib_SetVersion_Stub");     -- oleauto.h:1804
    pragma Import(Stdcall, ICreateTypeLib_SetGuid_Proxy, 
                     "ICreateTypeLib_SetGuid_Proxy");       -- oleauto.h:1811
    pragma Import(Stdcall, ICreateTypeLib_SetGuid_Stub, 
                     "ICreateTypeLib_SetGuid_Stub");        -- oleauto.h:1816
    pragma Import(Stdcall, ICreateTypeLib_SetDocString_Proxy, 
                     "ICreateTypeLib_SetDocString_Proxy");  -- oleauto.h:1823
    pragma Import(Stdcall, ICreateTypeLib_SetDocString_Stub, 
                     "ICreateTypeLib_SetDocString_Stub");   -- oleauto.h:1828
    pragma Import(Stdcall, ICreateTypeLib_SetHelpFileName_Proxy, 
                     "ICreateTypeLib_SetHelpFileName_Proxy");
                                                            -- oleauto.h:1835
    pragma Import(Stdcall, ICreateTypeLib_SetHelpFileName_Stub, 
                     "ICreateTypeLib_SetHelpFileName_Stub");-- oleauto.h:1840
    pragma Import(Stdcall, ICreateTypeLib_SetHelpContext_Proxy, 
                     "ICreateTypeLib_SetHelpContext_Proxy");-- oleauto.h:1847
    pragma Import(Stdcall, ICreateTypeLib_SetHelpContext_Stub, 
                     "ICreateTypeLib_SetHelpContext_Stub"); -- oleauto.h:1852
    pragma Import(Stdcall, ICreateTypeLib_SetLcid_Proxy, 
                     "ICreateTypeLib_SetLcid_Proxy");       -- oleauto.h:1859
    pragma Import(Stdcall, ICreateTypeLib_SetLcid_Stub, 
                     "ICreateTypeLib_SetLcid_Stub");        -- oleauto.h:1864
    pragma Import(Stdcall, ICreateTypeLib_SetLibFlags_Proxy, 
                     "ICreateTypeLib_SetLibFlags_Proxy");   -- oleauto.h:1871
    pragma Import(Stdcall, ICreateTypeLib_SetLibFlags_Stub, 
                     "ICreateTypeLib_SetLibFlags_Stub");    -- oleauto.h:1876
    pragma Import(Stdcall, ICreateTypeLib_SaveAllChanges_Proxy, 
                     "ICreateTypeLib_SaveAllChanges_Proxy");-- oleauto.h:1883
    pragma Import(Stdcall, ICreateTypeLib_SaveAllChanges_Stub, 
                     "ICreateTypeLib_SaveAllChanges_Stub"); -- oleauto.h:1887
    pragma Import(Stdcall, IDispatch_GetTypeInfoCount_Proxy,
                     "IDispatch_GetTypeInfoCount_Proxy");   -- oleauto.h:2062
    pragma Import(Stdcall, IDispatch_GetTypeInfoCount_Stub,
                     "IDispatch_GetTypeInfoCount_Stub");    -- oleauto.h:2067
    pragma Import(Stdcall, IDispatch_GetTypeInfo_Proxy,
                     "IDispatch_GetTypeInfo_Proxy");        -- oleauto.h:2074
    pragma Import(Stdcall, IDispatch_GetTypeInfo_Stub,
                     "IDispatch_GetTypeInfo_Stub");         -- oleauto.h:2081
    pragma Import(Stdcall, IDispatch_GetIDsOfNames_Proxy,
                     "IDispatch_GetIDsOfNames_Proxy");      -- oleauto.h:2088
    pragma Import(Stdcall, IDispatch_GetIDsOfNames_Stub,
                     "IDispatch_GetIDsOfNames_Stub");       -- oleauto.h:2097
    pragma Import(Stdcall, IDispatch_Invoke_Proxy,
                     "IDispatch_Invoke_Proxy");             -- oleauto.h:2104
    pragma Import(Stdcall, IDispatch_Invoke_Stub,
                     "IDispatch_Invoke_Stub");              -- oleauto.h:2116
    pragma Import(Stdcall, IEnumVARIANT_Next_Proxy,
                     "IEnumVARIANT_Next_Proxy");            -- oleauto.h:2238
    pragma Import(Stdcall, IEnumVARIANT_Next_Stub,
                     "IEnumVARIANT_Next_Stub");             -- oleauto.h:2245
    pragma Import(Stdcall, IEnumVARIANT_Skip_Proxy,
                     "IEnumVARIANT_Skip_Proxy");            -- oleauto.h:2252
    pragma Import(Stdcall, IEnumVARIANT_Skip_Stub,
                     "IEnumVARIANT_Skip_Stub");             -- oleauto.h:2257
    pragma Import(Stdcall, IEnumVARIANT_Reset_Proxy,
                     "IEnumVARIANT_Reset_Proxy");           -- oleauto.h:2264
    pragma Import(Stdcall, IEnumVARIANT_Reset_Stub,
                     "IEnumVARIANT_Reset_Stub");            -- oleauto.h:2268
    pragma Import(Stdcall, IEnumVARIANT_Clone_Proxy,
                     "IEnumVARIANT_Clone_Proxy");           -- oleauto.h:2275
    pragma Import(Stdcall, IEnumVARIANT_Clone_Stub,
                     "IEnumVARIANT_Clone_Stub");            -- oleauto.h:2280
    pragma Import(Stdcall, ITypeComp_Bind_Proxy,
                     "ITypeComp_Bind_Proxy");               -- oleauto.h:2425
    pragma Import(Stdcall, ITypeComp_Bind_Stub,
                     "ITypeComp_Bind_Stub");                -- oleauto.h:2435
    pragma Import(Stdcall, ITypeComp_BindType_Proxy,
                     "ITypeComp_BindType_Proxy");           -- oleauto.h:2442
    pragma Import(Stdcall, ITypeComp_BindType_Stub,
                     "ITypeComp_BindType_Stub");            -- oleauto.h:2450
    pragma Import(Stdcall, ITypeInfo_GetTypeAttr_Proxy,
                     "ITypeInfo_GetTypeAttr_Proxy");        -- oleauto.h:2780
    pragma Import(Stdcall, ITypeInfo_GetTypeAttr_Stub,
                     "ITypeInfo_GetTypeAttr_Stub");         -- oleauto.h:2785
    pragma Import(Stdcall, ITypeInfo_GetTypeComp_Proxy,
                     "ITypeInfo_GetTypeComp_Proxy");        -- oleauto.h:2792
    pragma Import(Stdcall, ITypeInfo_GetTypeComp_Stub,
                     "ITypeInfo_GetTypeComp_Stub");         -- oleauto.h:2797
    pragma Import(Stdcall, ITypeInfo_GetFuncDesc_Proxy,
                     "ITypeInfo_GetFuncDesc_Proxy");        -- oleauto.h:2804
    pragma Import(Stdcall, ITypeInfo_GetFuncDesc_Stub,
                     "ITypeInfo_GetFuncDesc_Stub");         -- oleauto.h:2810
    pragma Import(Stdcall, ITypeInfo_GetVarDesc_Proxy,
                     "ITypeInfo_GetVarDesc_Proxy");         -- oleauto.h:2817
    pragma Import(Stdcall, ITypeInfo_GetVarDesc_Stub,
                     "ITypeInfo_GetVarDesc_Stub");          -- oleauto.h:2823
    pragma Import(Stdcall, ITypeInfo_GetNames_Proxy,
                     "ITypeInfo_GetNames_Proxy");           -- oleauto.h:2830
    pragma Import(Stdcall, ITypeInfo_GetNames_Stub,
                     "ITypeInfo_GetNames_Stub");            -- oleauto.h:2838
    pragma Import(Stdcall, ITypeInfo_GetRefTypeOfImplType_Proxy,
                     "ITypeInfo_GetRefTypeOfImplType_Proxy");
                                                            -- oleauto.h:2845
    pragma Import(Stdcall, ITypeInfo_GetRefTypeOfImplType_Stub,
                     "ITypeInfo_GetRefTypeOfImplType_Stub");-- oleauto.h:2851
    pragma Import(Stdcall, ITypeInfo_GetImplTypeFlags_Proxy,
                     "ITypeInfo_GetImplTypeFlags_Proxy");   -- oleauto.h:2858
    pragma Import(Stdcall, ITypeInfo_GetImplTypeFlags_Stub,
                     "ITypeInfo_GetImplTypeFlags_Stub");    -- oleauto.h:2864
    pragma Import(Stdcall, ITypeInfo_GetIDsOfNames_Proxy,
                     "ITypeInfo_GetIDsOfNames_Proxy");      -- oleauto.h:2871
    pragma Import(Stdcall, ITypeInfo_GetIDsOfNames_Stub,
                     "ITypeInfo_GetIDsOfNames_Stub");       -- oleauto.h:2878
    pragma Import(Stdcall, ITypeInfo_Invoke_Proxy,
                     "ITypeInfo_Invoke_Proxy");             -- oleauto.h:2885
    pragma Import(Stdcall, ITypeInfo_Invoke_Stub,
                     "ITypeInfo_Invoke_Stub");              -- oleauto.h:2896
    pragma Import(Stdcall, ITypeInfo_GetDocumentation_Proxy,
                     "ITypeInfo_GetDocumentation_Proxy");   -- oleauto.h:2903
    pragma Import(Stdcall, ITypeInfo_GetDocumentation_Stub,
                     "ITypeInfo_GetDocumentation_Stub");    -- oleauto.h:2912
    pragma Import(Stdcall, ITypeInfo_GetDllEntry_Proxy,
                     "ITypeInfo_GetDllEntry_Proxy");        -- oleauto.h:2919
    pragma Import(Stdcall, ITypeInfo_GetDllEntry_Stub,
                     "ITypeInfo_GetDllEntry_Stub");         -- oleauto.h:2928
    pragma Import(Stdcall, ITypeInfo_GetRefTypeInfo_Proxy,
                     "ITypeInfo_GetRefTypeInfo_Proxy");     -- oleauto.h:2935
    pragma Import(Stdcall, ITypeInfo_GetRefTypeInfo_Stub,
                     "ITypeInfo_GetRefTypeInfo_Stub");      -- oleauto.h:2941
    pragma Import(Stdcall, ITypeInfo_RemoteAddressOfMember_Proxy,
                     "ITypeInfo_RemoteAddressOfMember_Proxy");
                                                            -- oleauto.h:2948
    pragma Import(Stdcall, ITypeInfo_RemoteAddressOfMember_Stub,
                     "ITypeInfo_RemoteAddressOfMember_Stub");
                                                            -- oleauto.h:2952
    pragma Import(Stdcall, ITypeInfo_CreateInstance_Proxy,
                     "ITypeInfo_CreateInstance_Proxy");     -- oleauto.h:2959
    pragma Import(Stdcall, ITypeInfo_CreateInstance_Stub,
                     "ITypeInfo_CreateInstance_Stub");      -- oleauto.h:2966
    pragma Import(Stdcall, ITypeInfo_GetMops_Proxy,
                     "ITypeInfo_GetMops_Proxy");            -- oleauto.h:2973
    pragma Import(Stdcall, ITypeInfo_GetMops_Stub,
                     "ITypeInfo_GetMops_Stub");             -- oleauto.h:2979
    pragma Import(Stdcall, ITypeInfo_GetContainingTypeLib_Proxy,
                     "ITypeInfo_GetContainingTypeLib_Proxy");
                                                            -- oleauto.h:2986
    pragma Import(Stdcall, ITypeInfo_GetContainingTypeLib_Stub,
                     "ITypeInfo_GetContainingTypeLib_Stub");-- oleauto.h:2992
    pragma Import(Stdcall, ITypeInfo_ReleaseTypeAttr_Proxy,
                     "ITypeInfo_ReleaseTypeAttr_Proxy");    -- oleauto.h:2999
    pragma Import(Stdcall, ITypeInfo_ReleaseTypeAttr_Stub,
                     "ITypeInfo_ReleaseTypeAttr_Stub");     -- oleauto.h:3004
    pragma Import(Stdcall, ITypeInfo_ReleaseFuncDesc_Proxy,
                     "ITypeInfo_ReleaseFuncDesc_Proxy");    -- oleauto.h:3011
    pragma Import(Stdcall, ITypeInfo_ReleaseFuncDesc_Stub,
                     "ITypeInfo_ReleaseFuncDesc_Stub");     -- oleauto.h:3016
    pragma Import(Stdcall, ITypeInfo_ReleaseVarDesc_Proxy,
                     "ITypeInfo_ReleaseVarDesc_Proxy");     -- oleauto.h:3023
    pragma Import(Stdcall, ITypeInfo_ReleaseVarDesc_Stub,
                     "ITypeInfo_ReleaseVarDesc_Stub");      -- oleauto.h:3028
    pragma Import(Stdcall, ITypeLib_GetTypeInfoCount_Proxy,
                     "ITypeLib_GetTypeInfoCount_Proxy");    -- oleauto.h:3266
    pragma Import(Stdcall, ITypeLib_GetTypeInfoCount_Stub,
                     "ITypeLib_GetTypeInfoCount_Stub");     -- oleauto.h:3270
    pragma Import(Stdcall, ITypeLib_GetTypeInfo_Proxy,
                     "ITypeLib_GetTypeInfo_Proxy");         -- oleauto.h:3277
    pragma Import(Stdcall, ITypeLib_GetTypeInfo_Stub,
                     "ITypeLib_GetTypeInfo_Stub");          -- oleauto.h:3283
    pragma Import(Stdcall, ITypeLib_GetTypeInfoType_Proxy,
                     "ITypeLib_GetTypeInfoType_Proxy");     -- oleauto.h:3290
    pragma Import(Stdcall, ITypeLib_GetTypeInfoType_Stub,
                     "ITypeLib_GetTypeInfoType_Stub");      -- oleauto.h:3296
    pragma Import(Stdcall, ITypeLib_GetTypeInfoOfGuid_Proxy,
                     "ITypeLib_GetTypeInfoOfGuid_Proxy");   -- oleauto.h:3303
    pragma Import(Stdcall, ITypeLib_GetTypeInfoOfGuid_Stub,
                     "ITypeLib_GetTypeInfoOfGuid_Stub");    -- oleauto.h:3309
    pragma Import(Stdcall, ITypeLib_GetLibAttr_Proxy,
                     "ITypeLib_GetLibAttr_Proxy");          -- oleauto.h:3316
    pragma Import(Stdcall, ITypeLib_GetLibAttr_Stub,
                     "ITypeLib_GetLibAttr_Stub");           -- oleauto.h:3321
    pragma Import(Stdcall, ITypeLib_GetTypeComp_Proxy,
                     "ITypeLib_GetTypeComp_Proxy");         -- oleauto.h:3328
    pragma Import(Stdcall, ITypeLib_GetTypeComp_Stub,
                     "ITypeLib_GetTypeComp_Stub");          -- oleauto.h:3333
    pragma Import(Stdcall, ITypeLib_GetDocumentation_Proxy,
                     "ITypeLib_GetDocumentation_Proxy");    -- oleauto.h:3340
    pragma Import(Stdcall, ITypeLib_GetDocumentation_Stub,
                     "ITypeLib_GetDocumentation_Stub");     -- oleauto.h:3349
    pragma Import(Stdcall, ITypeLib_IsName_Proxy,
                     "ITypeLib_IsName_Proxy");              -- oleauto.h:3356
    pragma Import(Stdcall, ITypeLib_IsName_Stub,
                     "ITypeLib_IsName_Stub");               -- oleauto.h:3363
    pragma Import(Stdcall, ITypeLib_FindName_Proxy,
                     "ITypeLib_FindName_Proxy");            -- oleauto.h:3370
    pragma Import(Stdcall, ITypeLib_FindName_Stub,
                     "ITypeLib_FindName_Stub");             -- oleauto.h:3379
    pragma Import(Stdcall, ITypeLib_ReleaseTLibAttr_Proxy,
                     "ITypeLib_ReleaseTLibAttr_Proxy");     -- oleauto.h:3386
    pragma Import(Stdcall, ITypeLib_ReleaseTLibAttr_Stub,
                     "ITypeLib_ReleaseTLibAttr_Stub");      -- oleauto.h:3391
    pragma Import(Stdcall, IErrorInfo_GetGUID_Proxy,
                     "IErrorInfo_GetGUID_Proxy");           -- oleauto.h:3521
    pragma Import(Stdcall, IErrorInfo_GetGUID_Stub,
                     "IErrorInfo_GetGUID_Stub");            -- oleauto.h:3526
    pragma Import(Stdcall, IErrorInfo_GetSource_Proxy,
                     "IErrorInfo_GetSource_Proxy");         -- oleauto.h:3533
    pragma Import(Stdcall, IErrorInfo_GetSource_Stub,
                     "IErrorInfo_GetSource_Stub");          -- oleauto.h:3538
    pragma Import(Stdcall, IErrorInfo_GetDescription_Proxy,
                     "IErrorInfo_GetDescription_Proxy");    -- oleauto.h:3545
    pragma Import(Stdcall, IErrorInfo_GetDescription_Stub,
                     "IErrorInfo_GetDescription_Stub");     -- oleauto.h:3550
    pragma Import(Stdcall, IErrorInfo_GetHelpFile_Proxy,
                     "IErrorInfo_GetHelpFile_Proxy");       -- oleauto.h:3557
    pragma Import(Stdcall, IErrorInfo_GetHelpFile_Stub,
                     "IErrorInfo_GetHelpFile_Stub");        -- oleauto.h:3562
    pragma Import(Stdcall, IErrorInfo_GetHelpContext_Proxy,
                     "IErrorInfo_GetHelpContext_Proxy");    -- oleauto.h:3569
    pragma Import(Stdcall, IErrorInfo_GetHelpContext_Stub,
                     "IErrorInfo_GetHelpContext_Stub");     -- oleauto.h:3574
    pragma Import(Stdcall, ICreateErrorInfo_SetGUID_Proxy,
                     "ICreateErrorInfo_SetGUID_Proxy");     -- oleauto.h:3704
    pragma Import(Stdcall, ICreateErrorInfo_SetGUID_Stub,
                     "ICreateErrorInfo_SetGUID_Stub");      -- oleauto.h:3709
    pragma Import(Stdcall, ICreateErrorInfo_SetSource_Proxy,
                     "ICreateErrorInfo_SetSource_Proxy");   -- oleauto.h:3716
    pragma Import(Stdcall, ICreateErrorInfo_SetSource_Stub,
                     "ICreateErrorInfo_SetSource_Stub");    -- oleauto.h:3721
    pragma Import(Stdcall, ICreateErrorInfo_SetDescription_Proxy,
                     "ICreateErrorInfo_SetDescription_Proxy");
                                                            -- oleauto.h:3728
    pragma Import(Stdcall, ICreateErrorInfo_SetDescription_Stub,
                     "ICreateErrorInfo_SetDescription_Stub");
                                                            -- oleauto.h:3733
    pragma Import(Stdcall, ICreateErrorInfo_SetHelpFile_Proxy,
                     "ICreateErrorInfo_SetHelpFile_Proxy"); -- oleauto.h:3740
    pragma Import(Stdcall, ICreateErrorInfo_SetHelpFile_Stub,
                     "ICreateErrorInfo_SetHelpFile_Stub");  -- oleauto.h:3745
    pragma Import(Stdcall, ICreateErrorInfo_SetHelpContext_Proxy,
                     "ICreateErrorInfo_SetHelpContext_Proxy");
                                                            -- oleauto.h:3752
    pragma Import(Stdcall, ICreateErrorInfo_SetHelpContext_Stub,
                     "ICreateErrorInfo_SetHelpContext_Stub");
                                                            -- oleauto.h:3757
    pragma Import(Stdcall, ISupportErrorInfo_InterfaceSupportsErrorInfo_Proxy,
                     "ISupportErrorInfo_InterfaceSupportsErrorInfo_Proxy");
                                                            -- oleauto.h:3847
    pragma Import(Stdcall, ISupportErrorInfo_InterfaceSupportsErrorInfo_Stub,
                     "ISupportErrorInfo_InterfaceSupportsErrorInfo_Stub");
                                                            -- oleauto.h:3852
    pragma Import(Stdcall, SysAllocString, "SysAllocString");     -- oleauto.h:3876
    pragma Import(Stdcall, SysReAllocString, "SysReAllocString"); -- oleauto.h:3877
    pragma Import(Stdcall, SysAllocStringLen, "SysAllocStringLen");
                                                            -- oleauto.h:3878
    pragma Import(Stdcall, SysReAllocStringLen, "SysReAllocStringLen");
                                                            -- oleauto.h:3879
    pragma Import(Stdcall, SysFreeString, "SysFreeString");       -- oleauto.h:3880
    pragma Import(Stdcall, SysStringLen, "SysStringLen");         -- oleauto.h:3881
    pragma Import(Stdcall, SysStringByteLen, "SysStringByteLen"); -- oleauto.h:3884
    pragma Import(Stdcall, SysAllocStringByteLen, "SysAllocStringByteLen");
                                                            -- oleauto.h:3885
    pragma Import(Stdcall, DosDateTimeToVariantTime, "DosDateTimeToVariantTime");
                                                            -- oleauto.h:3893
    pragma Import(Stdcall, VariantTimeToDosDateTime, "VariantTimeToDosDateTime");
                                                            -- oleauto.h:3899
    pragma Import(Stdcall, SafeArrayAllocDescriptor, "SafeArrayAllocDescriptor");
                                                            -- oleauto.h:3909
    pragma Import(Stdcall, SafeArrayAllocData, "SafeArrayAllocData");
                                                            -- oleauto.h:3911
    pragma Import(Stdcall, SafeArrayCreate, "SafeArrayCreate");   -- oleauto.h:3914
    pragma Import(Stdcall, SafeArrayDestroyDescriptor, "SafeArrayDestroyDescriptor");
                                                            -- oleauto.h:3919
    pragma Import(Stdcall, SafeArrayDestroyData, "SafeArrayDestroyData");
                                                            -- oleauto.h:3921
    pragma Import(Stdcall, SafeArrayDestroy, "SafeArrayDestroy"); -- oleauto.h:3923
    pragma Import(Stdcall, SafeArrayRedim, "SafeArrayRedim");     -- oleauto.h:3925
    pragma Import(Stdcall, SafeArrayGetDim, "SafeArrayGetDim");   -- oleauto.h:3927
    pragma Import(Stdcall, SafeArrayGetElemsize, "SafeArrayGetElemsize");
                                                            -- oleauto.h:3929
    pragma Import(Stdcall, SafeArrayGetUBound, "SafeArrayGetUBound");
                                                            -- oleauto.h:3932
    pragma Import(Stdcall, SafeArrayGetLBound, "SafeArrayGetLBound");
                                                            -- oleauto.h:3935
    pragma Import(Stdcall, SafeArrayLock, "SafeArrayLock");       -- oleauto.h:3937
    pragma Import(Stdcall, SafeArrayUnlock, "SafeArrayUnlock");   -- oleauto.h:3939
    pragma Import(Stdcall, SafeArrayAccessData, "SafeArrayAccessData");
                                                            -- oleauto.h:3941
    pragma Import(Stdcall, SafeArrayUnaccessData, "SafeArrayUnaccessData");
                                                            -- oleauto.h:3943
    pragma Import(Stdcall, SafeArrayGetElement, "SafeArrayGetElement");
                                                            -- oleauto.h:3946
    pragma Import(Stdcall, SafeArrayPutElement, "SafeArrayPutElement");
                                                            -- oleauto.h:3952
    pragma Import(Stdcall, SafeArrayCopy, "SafeArrayCopy");       -- oleauto.h:3958
    pragma Import(Stdcall, SafeArrayPtrOfIndex, "SafeArrayPtrOfIndex");
                                                            -- oleauto.h:3963
    pragma Import(Stdcall, VariantInit, "VariantInit");           -- oleauto.h:3974
    pragma Import(Stdcall, VariantClear, "VariantClear");         -- oleauto.h:3977
    pragma Import(Stdcall, VariantCopy, "VariantCopy");           -- oleauto.h:3980
    pragma Import(Stdcall, VariantCopyInd, "VariantCopyInd");     -- oleauto.h:3985
    pragma Import(Stdcall, VariantChangeType, "VariantChangeType");
                                                            -- oleauto.h:3990
    pragma Import(Stdcall, VariantChangeTypeEx, "VariantChangeTypeEx");
                                                            -- oleauto.h:3997
    pragma Import(Stdcall, VarUI1FromI2, "VarUI1FromI2");         -- oleauto.h:4031
    pragma Import(Stdcall, VarUI1FromI4, "VarUI1FromI4");         -- oleauto.h:4032
    pragma Import(Stdcall, VarUI1FromR4, "VarUI1FromR4");         -- oleauto.h:4033
    pragma Import(Stdcall, VarUI1FromR8, "VarUI1FromR8");         -- oleauto.h:4034
    pragma Import(Stdcall, VarUI1FromCy, "VarUI1FromCy");         -- oleauto.h:4035
    pragma Import(Stdcall, VarUI1FromDate, "VarUI1FromDate");     -- oleauto.h:4036
    pragma Import(Stdcall, VarUI1FromStr, "VarUI1FromStr");       -- oleauto.h:4037
    pragma Import(Stdcall, VarUI1FromDisp, "VarUI1FromDisp");     -- oleauto.h:4038
    pragma Import(Stdcall, VarUI1FromBool, "VarUI1FromBool");     -- oleauto.h:4039
    pragma Import(Stdcall, VarI2FromUI1, "VarI2FromUI1");         -- oleauto.h:4041
    pragma Import(Stdcall, VarI2FromI4, "VarI2FromI4");           -- oleauto.h:4042
    pragma Import(Stdcall, VarI2FromR4, "VarI2FromR4");           -- oleauto.h:4043
    pragma Import(Stdcall, VarI2FromR8, "VarI2FromR8");           -- oleauto.h:4044
    pragma Import(Stdcall, VarI2FromCy, "VarI2FromCy");           -- oleauto.h:4045
    pragma Import(Stdcall, VarI2FromDate, "VarI2FromDate");       -- oleauto.h:4046
    pragma Import(Stdcall, VarI2FromStr, "VarI2FromStr");         -- oleauto.h:4047
    pragma Import(Stdcall, VarI2FromDisp, "VarI2FromDisp");       -- oleauto.h:4048
    pragma Import(Stdcall, VarI2FromBool, "VarI2FromBool");       -- oleauto.h:4049
    pragma Import(Stdcall, VarI4FromUI1, "VarI4FromUI1");         -- oleauto.h:4051
    pragma Import(Stdcall, VarI4FromI2, "VarI4FromI2");           -- oleauto.h:4052
    pragma Import(Stdcall, VarI4FromR4, "VarI4FromR4");           -- oleauto.h:4053
    pragma Import(Stdcall, VarI4FromR8, "VarI4FromR8");           -- oleauto.h:4054
    pragma Import(Stdcall, VarI4FromCy, "VarI4FromCy");           -- oleauto.h:4055
    pragma Import(Stdcall, VarI4FromDate, "VarI4FromDate");       -- oleauto.h:4056
    pragma Import(Stdcall, VarI4FromStr, "VarI4FromStr");         -- oleauto.h:4057
    pragma Import(Stdcall, VarI4FromDisp, "VarI4FromDisp");       -- oleauto.h:4058
    pragma Import(Stdcall, VarI4FromBool, "VarI4FromBool");       -- oleauto.h:4059
    pragma Import(Stdcall, VarR4FromUI1, "VarR4FromUI1");         -- oleauto.h:4061
    pragma Import(Stdcall, VarR4FromI2, "VarR4FromI2");           -- oleauto.h:4062
    pragma Import(Stdcall, VarR4FromI4, "VarR4FromI4");           -- oleauto.h:4063
    pragma Import(Stdcall, VarR4FromR8, "VarR4FromR8");           -- oleauto.h:4064
    pragma Import(Stdcall, VarR4FromCy, "VarR4FromCy");           -- oleauto.h:4065
    pragma Import(Stdcall, VarR4FromDate, "VarR4FromDate");       -- oleauto.h:4066
    pragma Import(Stdcall, VarR4FromStr, "VarR4FromStr");         -- oleauto.h:4067
    pragma Import(Stdcall, VarR4FromDisp, "VarR4FromDisp");       -- oleauto.h:4068
    pragma Import(Stdcall, VarR4FromBool, "VarR4FromBool");       -- oleauto.h:4069
    pragma Import(Stdcall, VarR8FromUI1, "VarR8FromUI1");         -- oleauto.h:4071
    pragma Import(Stdcall, VarR8FromI2, "VarR8FromI2");           -- oleauto.h:4072
    pragma Import(Stdcall, VarR8FromI4, "VarR8FromI4");           -- oleauto.h:4073
    pragma Import(Stdcall, VarR8FromR4, "VarR8FromR4");           -- oleauto.h:4074
    pragma Import(Stdcall, VarR8FromCy, "VarR8FromCy");           -- oleauto.h:4075
    pragma Import(Stdcall, VarR8FromDate, "VarR8FromDate");       -- oleauto.h:4076
    pragma Import(Stdcall, VarR8FromStr, "VarR8FromStr");         -- oleauto.h:4077
    pragma Import(Stdcall, VarR8FromDisp, "VarR8FromDisp");       -- oleauto.h:4078
    pragma Import(Stdcall, VarR8FromBool, "VarR8FromBool");       -- oleauto.h:4079
    pragma Import(Stdcall, VarDateFromUI1, "VarDateFromUI1");     -- oleauto.h:4081
    pragma Import(Stdcall, VarDateFromI2, "VarDateFromI2");       -- oleauto.h:4082
    pragma Import(Stdcall, VarDateFromI4, "VarDateFromI4");       -- oleauto.h:4083
    pragma Import(Stdcall, VarDateFromR4, "VarDateFromR4");       -- oleauto.h:4084
    pragma Import(Stdcall, VarDateFromR8, "VarDateFromR8");       -- oleauto.h:4085
    pragma Import(Stdcall, VarDateFromCy, "VarDateFromCy");       -- oleauto.h:4086
    pragma Import(Stdcall, VarDateFromStr, "VarDateFromStr");     -- oleauto.h:4087
    pragma Import(Stdcall, VarDateFromDisp, "VarDateFromDisp");   -- oleauto.h:4088
    pragma Import(Stdcall, VarDateFromBool, "VarDateFromBool");   -- oleauto.h:4089
    pragma Import(Stdcall, VarCyFromUI1, "VarCyFromUI1");         -- oleauto.h:4091
    pragma Import(Stdcall, VarCyFromI2, "VarCyFromI2");           -- oleauto.h:4092
    pragma Import(Stdcall, VarCyFromI4, "VarCyFromI4");           -- oleauto.h:4093
    pragma Import(Stdcall, VarCyFromR4, "VarCyFromR4");           -- oleauto.h:4094
    pragma Import(Stdcall, VarCyFromR8, "VarCyFromR8");           -- oleauto.h:4095
    pragma Import(Stdcall, VarCyFromDate, "VarCyFromDate");       -- oleauto.h:4096
    pragma Import(Stdcall, VarCyFromStr, "VarCyFromStr");         -- oleauto.h:4097
    pragma Import(Stdcall, VarCyFromDisp, "VarCyFromDisp");       -- oleauto.h:4098
    pragma Import(Stdcall, VarCyFromBool, "VarCyFromBool");       -- oleauto.h:4099
    pragma Import(Stdcall, VarBstrFromUI1, "VarBstrFromUI1");     -- oleauto.h:4101
    pragma Import(Stdcall, VarBstrFromI2, "VarBstrFromI2");       -- oleauto.h:4102
    pragma Import(Stdcall, VarBstrFromI4, "VarBstrFromI4");       -- oleauto.h:4103
    pragma Import(Stdcall, VarBstrFromR4, "VarBstrFromR4");       -- oleauto.h:4104
    pragma Import(Stdcall, VarBstrFromR8, "VarBstrFromR8");       -- oleauto.h:4105
    pragma Import(Stdcall, VarBstrFromCy, "VarBstrFromCy");       -- oleauto.h:4106
    pragma Import(Stdcall, VarBstrFromDate, "VarBstrFromDate");   -- oleauto.h:4107
    pragma Import(Stdcall, VarBstrFromDisp, "VarBstrFromDisp");   -- oleauto.h:4108
    pragma Import(Stdcall, VarBstrFromBool, "VarBstrFromBool");   -- oleauto.h:4109
    pragma Import(Stdcall, VarBoolFromUI1, "VarBoolFromUI1");     -- oleauto.h:4111
    pragma Import(Stdcall, VarBoolFromI2, "VarBoolFromI2");       -- oleauto.h:4112
    pragma Import(Stdcall, VarBoolFromI4, "VarBoolFromI4");       -- oleauto.h:4113
    pragma Import(Stdcall, VarBoolFromR4, "VarBoolFromR4");       -- oleauto.h:4114
    pragma Import(Stdcall, VarBoolFromR8, "VarBoolFromR8");       -- oleauto.h:4115
    pragma Import(Stdcall, VarBoolFromDate, "VarBoolFromDate");   -- oleauto.h:4116
    pragma Import(Stdcall, VarBoolFromCy, "VarBoolFromCy");       -- oleauto.h:4117
    pragma Import(Stdcall, VarBoolFromStr, "VarBoolFromStr");     -- oleauto.h:4118
    pragma Import(Stdcall, VarBoolFromDisp, "VarBoolFromDisp");   -- oleauto.h:4119
    pragma Import(Stdcall, LHashValOfNameSysA, "LHashValOfNameSysA");
                                                            -- oleauto.h:4190
    pragma Import(Stdcall, LHashValOfNameSys, "LHashValOfNameSys");
                                                            -- oleauto.h:4194
    pragma Import(Stdcall, LoadTypeLib, "LoadTypeLib");           -- oleauto.h:4208
    pragma Import(Stdcall, LoadRegTypeLib, "LoadRegTypeLib");     -- oleauto.h:4213
    pragma Import(Stdcall, QueryPathOfRegTypeLib, "QueryPathOfRegTypeLib");
                                                            -- oleauto.h:4223
    pragma Import(Stdcall, RegisterTypeLib, "RegisterTypeLib");   -- oleauto.h:4233
    pragma Import(Stdcall, DeregisterTypeLib, "DeregisterTypeLib");
                                                            -- oleauto.h:4239
    pragma Import(Stdcall, CreateTypeLib, "CreateTypeLib");       -- oleauto.h:4242
    pragma Import(Stdcall, DispGetParam, "DispGetParam");         -- oleauto.h:4286
    pragma Import(Stdcall, DispGetIDsOfNames, "DispGetIDsOfNames");
                                                            -- oleauto.h:4296
    pragma Import(Stdcall, DispInvoke, "DispInvoke");             -- oleauto.h:4305
    pragma Import(Stdcall, CreateDispTypeInfo, "CreateDispTypeInfo");
                                                            -- oleauto.h:4318
    pragma Import(Stdcall, CreateStdDispatch, "CreateStdDispatch");
                                                            -- oleauto.h:4327
    pragma Import(Stdcall, RegisterActiveObject, "RegisterActiveObject");
                                                            -- oleauto.h:4343
    pragma Import(Stdcall, RevokeActiveObject, "RevokeActiveObject");
                                                            -- oleauto.h:4350
    pragma Import(Stdcall, GetActiveObject, "GetActiveObject");   -- oleauto.h:4355
    pragma Import(Stdcall, SetErrorInfo, "SetErrorInfo");         -- oleauto.h:4364
    pragma Import(Stdcall, GetErrorInfo, "GetErrorInfo");         -- oleauto.h:4365
    pragma Import(Stdcall, CreateErrorInfo, "CreateErrorInfo");   -- oleauto.h:4366
    pragma Import(Stdcall, OaBuildVersion, "OaBuildVersion");     -- oleauto.h:4372

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

end Win32.Oleauto;
