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
--  Copyright (C) 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Winbase;
with Win32.Windef;
with Win32.Winerror;
with Win32.Winnt;

package Win32.Objbase is

   MARSHALINTERFACE_MIN            : constant := 500;
   CWCSTORAGENAME                  : constant := 32;
   STGM_DIRECT                     : constant := 16#0#;
   STGM_TRANSACTED                 : constant := 16#10000#;
   STGM_READ                       : constant := 16#0#;
   STGM_WRITE                      : constant := 16#1#;
   STGM_READWRITE                  : constant := 16#2#;
   STGM_SHARE_DENY_NONE            : constant := 16#40#;
   STGM_SHARE_DENY_READ            : constant := 16#30#;
   STGM_SHARE_DENY_WRITE           : constant := 16#20#;
   STGM_SHARE_EXCLUSIVE            : constant := 16#10#;
   STGM_PRIORITY                   : constant := 16#40000#;
   STGM_DELETEONRELEASE            : constant := 16#4000000#;
   STGM_CREATE                     : constant := 16#1000#;
   STGM_CONVERT                    : constant := 16#20000#;
   STGM_FAILIFTHERE                : constant := 16#0#;
   ROTFLAGS_REGISTRATIONKEEPSALIVE : constant := 1;

   type REGCLS is (
      REGCLS_SINGLEUSE,
      REGCLS_MULTIPLEUSE,
      REGCLS_MULTI_SEPARATE);
   for REGCLS'Size use 32;

   type OLECHAR is new Win32.WCHAR;
   subtype SCODE is Win32.Winerror.SCODE;
   subtype HRESULT is Win32.Winerror.HRESULT;

   subtype STDAPI is HRESULT;
   subtype STDMETHODIMP is HRESULT;
   subtype STDAPIV is HRESULT;
   subtype STDMETHODIMPV is HRESULT;
   subtype WINOLEAPI is HRESULT;

   type MEMCTX is (
      MEMCTX_SAME,
      MEMCTX_UNKNOWN,
      MEMCTX_TASK,
      MEMCTX_SHARED,
      MEMCTX_MACSYSTEM);
   for MEMCTX use
     (MEMCTX_SAME      => -2,
      MEMCTX_UNKNOWN   => -1,
      MEMCTX_TASK      => 1,
      MEMCTX_SHARED    => 2,
      MEMCTX_MACSYSTEM => 3);
   for MEMCTX'Size use 32;

   type CLSCTX is (
      CLSCTX_INPROC_SERVER,
      CLSCTX_INPROC_HANDLER,
      CLSCTX_LOCAL_SERVER,
      CLSCTX_INPROC_SERVER16);
   for CLSCTX use
     (CLSCTX_INPROC_SERVER   => 1,
      CLSCTX_INPROC_HANDLER  => 2,
      CLSCTX_LOCAL_SERVER    => 4,
      CLSCTX_INPROC_SERVER16 => 8);
   for CLSCTX'Size use 32;
   function "or"
     (l, r : Interfaces.C.unsigned)
      return Interfaces.C.unsigned renames Interfaces.C."or";

   type MSHLFLAGS is (
      MSHLFLAGS_NORMAL,
      MSHLFLAGS_TABLESTRONG,
      MSHLFLAGS_TABLEWEAK);
   for MSHLFLAGS'Size use 32;

   type MSHCTX is (MSHCTX_LOCAL, MSHCTX_NOSHAREDMEM, MSHCTX_DIFFERENTMACHINE);
   for MSHCTX'Size use 32;

   type DVASPECT is (
      DVASPECT_CONTENT,
      DVASPECT_THUMBNAIL,
      DVASPECT_ICON,
      DVASPECT_DOCPRINT);
   for DVASPECT use
     (DVASPECT_CONTENT   => 1,
      DVASPECT_THUMBNAIL => 2,
      DVASPECT_ICON      => 4,
      DVASPECT_DOCPRINT  => 8);
   for DVASPECT'Size use 32;

   type STGC is (
      STGC_DEFAULT,
      STGC_OVERWRITE,
      STGC_ONLYIFCURRENT,
      STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE);
   for STGC use
     (STGC_DEFAULT                            => 0,
      STGC_OVERWRITE                          => 1,
      STGC_ONLYIFCURRENT                      => 2,
      STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE => 4);
   for STGC'Size use 32;

   type STGMOVE is (STGMOVE_MOVE, STGMOVE_COPY);
   for STGMOVE'Size use 32;

   type STATFLAG is (STATFLAG_DEFAULT, STATFLAG_NONAME);
   for STATFLAG'Size use 32;

   type EXTCONN is (EXTCONN_STRONG, EXTCONN_WEAK, EXTCONN_CALLABLE);
   for EXTCONN use
     (EXTCONN_STRONG   => 1,
      EXTCONN_WEAK     => 2,
      EXTCONN_CALLABLE => 4);
   for EXTCONN'Size use 32;

   type BIND_FLAGS is (BIND_MAYBOTHERUSER, BIND_JUSTTESTEXISTENCE);
   for BIND_FLAGS use (BIND_MAYBOTHERUSER => 1, BIND_JUSTTESTEXISTENCE => 2);
   for BIND_FLAGS'Size use 32;

   type MKSYS is (
      MKSYS_NONE,
      MKSYS_GENERICCOMPOSITE,
      MKSYS_FILEMONIKER,
      MKSYS_ANTIMONIKER,
      MKSYS_ITEMMONIKER,
      MKSYS_POINTERMONIKER);
   for MKSYS'Size use 32;

   type MKREDUCE is (
      MKRREDUCE_ALL,
      MKRREDUCE_THROUGHUSER,
      MKRREDUCE_TOUSER,
      MKRREDUCE_ONE);
   for MKREDUCE use
     (MKRREDUCE_ALL         => 0,
      MKRREDUCE_THROUGHUSER => 65536,
      MKRREDUCE_TOUSER      => 131072,
      MKRREDUCE_ONE         => 196608);
   for MKREDUCE'Size use 32;

   type STGTY is (
      STGTY_STORAGE,
      STGTY_STREAM,
      STGTY_LOCKBYTES,
      STGTY_PROPERTY);
   for STGTY use
     (STGTY_STORAGE   => 1,
      STGTY_STREAM    => 2,
      STGTY_LOCKBYTES => 3,
      STGTY_PROPERTY  => 4);
   for STGTY'Size use 32;

   type STREAM_SEEK is (STREAM_SEEK_SET, STREAM_SEEK_CUR, STREAM_SEEK_END);
   for STREAM_SEEK'Size use 32;

   type LOCKTYPE is (LOCK_WRITE, LOCK_EXCLUSIVE, LOCK_ONLYONCE);
   for LOCKTYPE use
     (LOCK_WRITE     => 1,
      LOCK_EXCLUSIVE => 2,
      LOCK_ONLYONCE  => 4);
   for LOCKTYPE'Size use 32;

   type CLIPFORMAT is new Win32.WORD;

   type ADVF is (
      ADVF_NODATA,
      ADVF_PRIMEFIRST,
      ADVF_ONLYONCE,
      ADVFCACHE_NOHANDLER,
      ADVFCACHE_FORCEBUILTIN,
      ADVFCACHE_ONSAVE,
      ADVF_DATAONSTOP);
   for ADVF use
     (ADVF_NODATA            => 1,
      ADVF_PRIMEFIRST        => 2,
      ADVF_ONLYONCE          => 4,
      ADVFCACHE_NOHANDLER    => 8,
      ADVFCACHE_FORCEBUILTIN => 16,
      ADVFCACHE_ONSAVE       => 32,
      ADVF_DATAONSTOP        => 64);
   for ADVF'Size use 32;

   type TYMED is (
      TYMED_NULL,
      TYMED_HGLOBAL,
      TYMED_FILE,
      TYMED_ISTREAM,
      TYMED_ISTORAGE,
      TYMED_GDI,
      TYMED_MFPICT,
      TYMED_ENHMF);
   for TYMED use
     (TYMED_NULL     => 0,
      TYMED_HGLOBAL  => 1,
      TYMED_FILE     => 2,
      TYMED_ISTREAM  => 4,
      TYMED_ISTORAGE => 8,
      TYMED_GDI      => 16,
      TYMED_MFPICT   => 32,
      TYMED_ENHMF    => 64);
   for TYMED'Size use 32;

   type DATADIR is (DATADIR_GET, DATADIR_SET);
   for DATADIR use (DATADIR_GET => 1, DATADIR_SET => 2);
   for DATADIR'Size use 32;

   type CALLTYPE is (
      CALLTYPE_TOPLEVEL,
      CALLTYPE_NESTED,
      CALLTYPE_ASYNC,
      CALLTYPE_TOPLEVEL_CALLPENDING,
      CALLTYPE_ASYNC_CALLPENDING);
   for CALLTYPE use
     (CALLTYPE_TOPLEVEL             => 1,
      CALLTYPE_NESTED               => 2,
      CALLTYPE_ASYNC                => 3,
      CALLTYPE_TOPLEVEL_CALLPENDING => 4,
      CALLTYPE_ASYNC_CALLPENDING    => 5);
   for CALLTYPE'Size use 32;

   type SERVERCALL is (
      SERVERCALL_ISHANDLED,
      SERVERCALL_REJECTED,
      SERVERCALL_RETRYLATER);
   for SERVERCALL'Size use 32;

   type PENDINGTYPE is (PENDINGTYPE_TOPLEVEL, PENDINGTYPE_NESTED);
   for PENDINGTYPE use (PENDINGTYPE_TOPLEVEL => 1, PENDINGTYPE_NESTED => 2);
   for PENDINGTYPE'Size use 32;

   type PENDINGMSG is (
      PENDINGMSG_CANCELCALL,
      PENDINGMSG_WAITNOPROCESS,
      PENDINGMSG_WAITDEFPROCESS);
   for PENDINGMSG'Size use 32;

   type RPCOLEDATAREP is new Win32.UINT;

   subtype HMETAFILEPICT is Win32.Winnt.HANDLE;
   type LPOLESTR is access all OLECHAR;
   type LPCOLESTR is access all OLECHAR;
   type PSCODE is access all SCODE;
   subtype HCONTEXT is Win32.Winnt.HANDLE;
   type SNB_Extra is access all OLECHAR;
   type SNB is access all SNB_Extra;
   type LPCLIPFORMAT is access all CLIPFORMAT;

   type RemHGLOBAL;
   type RemHMETAFILEPICT;
   type RemHENHMETAFILE;
   type RemHBITMAP;
   type RemHPALETTE;
   type RemBRUSH;
   type OBJECTID;
   type IUnknown;
   type IClassFactory;
   type IMarshal;
   type IMalloc;
   type IStdMarshalInfo;
   type IExternalConnection;
   type IWeakRef;
   type IEnumUnknown;
   type IBindCtx;
   type IParseDisplayName;
   type IEnumMoniker;
   type IRunnableObject;
   type IRunningObjectTable;
   type IPersist;
   type IPersistStream;
   type IMoniker;
   type IEnumString;
   type IStream;
   type IEnumSTATSTG;
   type IStorage;
   type IPersistFile;
   type IPersistStorage;
   type ILockBytes;
   type IEnumFORMATETC;
   type IEnumSTATDATA;
   type IRootStorage;
   type IAdviseSink;
   type IAdviseSink2;
   type IDataObject;
   type IDataAdviseHolder;
   type IMessageFilter;
   type IRpcChannelBuffer;
   type IRpcProxyBuffer;
   type IPSFactoryBuffer;
   type IUnknownVtbl;
   type IClassFactoryVtbl;
   type IMarshalVtbl;
   type IMallocVtbl;
   type IStdMarshalInfoVtbl;
   type IExternalConnectionVtbl;
   type IWeakRefVtbl;
   type IEnumUnknownVtbl;
   type BIND_OPTS;
   type IBindCtxVtbl;
   type IParseDisplayNameVtbl;
   type IEnumMonikerVtbl;
   type IRunnableObjectVtbl;
   type IRunningObjectTableVtbl;
   type IPersistVtbl;
   type IPersistStreamVtbl;
   type IMonikerVtbl;
   type IEnumStringVtbl;
   type STATSTG;
   type IStreamVtbl;
   type IEnumSTATSTGVtbl;
   type RemSNB;
   type IStorageVtbl;
   type IPersistFileVtbl;
   type IPersistStorageVtbl;
   type ILockBytesVtbl;
   type DVTARGETDEVICE;
   type FORMATETC;
   type IEnumFORMATETCVtbl;
   type STATDATA;
   type IEnumSTATDATAVtbl;
   type IRootStorageVtbl;
   type RemSTGMEDIUM;
   type union_anonymous7_t;
   type STGMEDIUM;
   type IAdviseSinkVtbl;
   type IAdviseSink2Vtbl;
   type IDataObjectVtbl;
   type IDataAdviseHolderVtbl;
   type INTERFACEINFO;
   type IMessageFilterVtbl;
   type RPCOLEMESSAGE;
   type IRpcChannelBufferVtbl;
   type IRpcProxyBufferVtbl;
   type IRpcStubBufferVtbl;
   type IPSFactoryBufferVtbl;
   type IRpcStubBuffer;

   type ac_RECTL_t is access all Win32.Windef.RECTL;
   type LPCRECTL is access all Win32.Windef.RECTL;
   type LPGUID is access all Win32.Rpcdce.GUID;
   subtype IID is Win32.Rpcdce.GUID;
   type LPIID is access all IID;
   type REFGUID is access all Win32.Rpcdce.GUID;
   type REFIID is access all IID;
   subtype CLSID is Win32.Rpcdce.GUID;
   type LPCLSID is access all CLSID;
   type REFCLSID is access all CLSID;
   type LPCRECT is access all Win32.Windef.RECT;
   type a_RemHGLOBAL_t is access all RemHGLOBAL;
   type a_RemHBITMAP_t is access all RemHBITMAP;
   type a_RemHPALETTE_t is access all RemHPALETTE;
   type a_RemHBRUSH_t is access all RemBRUSH;
   type a_RemHMETAFILEPICT_t is access all RemHMETAFILEPICT;
   type a_RemHENHMETAFILE_t is access all RemHENHMETAFILE;
   type LPUNKNOWN is access all IUnknown;
   type a_IUnknownVtbl_t is access all IUnknownVtbl;
   type a_IClassFactoryVtbl_t is access all IClassFactoryVtbl;
   type LPCLASSFACTORY is access all IClassFactory;
   type LPMARSHAL is access all IMarshal;
   type a_IMarshalVtbl_t is access all IMarshalVtbl;
   type LPMALLOC is access all IMalloc;
   type a_IMallocVtbl_t is access all IMallocVtbl;
   type LPSTDMARSHALINFO is access all IStdMarshalInfo;
   type a_IStdMarshalInfoVtbl_t is access all IStdMarshalInfoVtbl;
   type LPEXTERNALCONNECTION is access all IExternalConnection;
   type a_IExternalConnectionVtbl_t is access all IExternalConnectionVtbl;
   type LPWEAKREF is access all IWeakRef;
   type a_IWeakRefVtbl_t is access all IWeakRefVtbl;
   type LPENUMUNKNOWN is access all IEnumUnknown;
   type a_IEnumUnknownVtbl_t is access all IEnumUnknownVtbl;
   type LPBC is access all IBindCtx;
   type LPBINDCTX is access all IBindCtx;
   type LPBIND_OPTS is access all BIND_OPTS;
   type a_IBindCtxVtbl_t is access all IBindCtxVtbl;
   type LPPARSEDISPLAYNAME is access all IParseDisplayName;
   type a_IParseDisplayNameVtbl_t is access all IParseDisplayNameVtbl;
   type LPENUMMONIKER is access all IEnumMoniker;
   type a_IEnumMonikerVtbl_t is access all IEnumMonikerVtbl;
   type LPRUNNABLEOBJECT is access all IRunnableObject;
   type a_IRunnableObjectVtbl_t is access all IRunnableObjectVtbl;
   type LPRUNNINGOBJECTTABLE is access all IRunningObjectTable;
   type a_IRunningObjectTableVtbl_t is access all IRunningObjectTableVtbl;
   type LPPERSIST is access all IPersist;
   type a_IPersistVtbl_t is access all IPersistVtbl;
   type LPPERSISTSTREAM is access all IPersistStream;
   type a_IPersistStreamVtbl_t is access all IPersistStreamVtbl;
   type LPMONIKER is access all IMoniker;
   type a_IMonikerVtbl_t is access all IMonikerVtbl;
   type LPENUMSTRING is access all IEnumString;
   type a_IEnumStringVtbl_t is access all IEnumStringVtbl;
   type LPSTREAM is access all IStream;
   type a_IStreamVtbl_t is access all IStreamVtbl;
   type LPENUMSTATSTG is access all IEnumSTATSTG;
   type a_IEnumSTATSTGVtbl_t is access all IEnumSTATSTGVtbl;
   type LPSTORAGE is access all IStorage;
   type a_IStorageVtbl_t is access all IStorageVtbl;
   type LPPERSISTFILE is access all IPersistFile;
   type a_IPersistFileVtbl_t is access all IPersistFileVtbl;
   type LPPERSISTSTORAGE is access all IPersistStorage;
   type a_IPersistStorageVtbl_t is access all IPersistStorageVtbl;
   type LPLOCKBYTES is access all ILockBytes;
   type a_ILockBytesVtbl_t is access all ILockBytesVtbl;
   type LPENUMFORMATETC is access all IEnumFORMATETC;
   type a_DVTARGETDEVICE_t is access all DVTARGETDEVICE;
   type LPFORMATETC is access all FORMATETC;
   type a_IEnumFORMATETCVtbl_t is access all IEnumFORMATETCVtbl;
   type LPENUMSTATDATA is access all IEnumSTATDATA;
   type LPSTATDATA is access all STATDATA;
   type a_IEnumSTATDATAVtbl_t is access all IEnumSTATDATAVtbl;
   type LPROOTSTORAGE is access all IRootStorage;
   type a_IRootStorageVtbl_t is access all IRootStorageVtbl;
   type LPADVISESINK is access all IAdviseSink;
   type LPSTGMEDIUM is access all STGMEDIUM;
   type a_IAdviseSinkVtbl_t is access all IAdviseSinkVtbl;
   type a_RemSTGMEDIUM_t is access all RemSTGMEDIUM;
   type LPADVISESINK2 is access all IAdviseSink2;
   type a_IAdviseSink2Vtbl_t is access all IAdviseSink2Vtbl;
   type LPDATAOBJECT is access all IDataObject;
   type a_IDataObjectVtbl_t is access all IDataObjectVtbl;
   type LPDATAADVISEHOLDER is access all IDataAdviseHolder;
   type a_IDataAdviseHolderVtbl_t is access all IDataAdviseHolderVtbl;
   type LPMESSAGEFILTER is access all IMessageFilter;
   type LPINTERFACEINFO is access all INTERFACEINFO;
   type a_IMessageFilterVtbl_t is access all IMessageFilterVtbl;
   type PRPCOLEMESSAGE is access all RPCOLEMESSAGE;
   type a_IRpcChannelBufferVtbl is access all IRpcChannelBufferVtbl;
   type PIRpcProxyBuffer is access all IRpcProxyBuffer;
   type a_IRpcProxyBufferVtbl_t is access all IRpcProxyBufferVtbl;
   type a_IRpcStubBufferVtbl is access all IRpcStubBufferVtbl;
   type a_IRpcStubBuffer_t is access all IRpcStubBuffer;
   type a_IPSFactoryBufferVtbl_t is access all IPSFactoryBufferVtbl;
   type a_RemSNB_t is access all RemSNB;

   type af_1454_QueryInterface is access function
     (This      : access IUnknown;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_1454_QueryInterface);

   type af_1459_AddRef is access function
     (This : access IUnknown)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1459_AddRef);

   type af_1462_Release is access function
     (This : access IUnknown)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1462_Release);

   type af_1569_QueryInterface is access function
     (This      : access IClassFactory;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_1569_QueryInterface);

   type af_1574_AddRef is access function
     (This : access IClassFactory)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1574_AddRef);

   type af_1577_Release is access function
     (This : access IClassFactory)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1577_Release);

   type af_1580_CreateInstance is access function
     (This      : access IClassFactory;
      pUnkOuter : access IUnknown;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_1580_CreateInstance);

   type af_1586_LockServer is access function
     (This  : access IClassFactory;
      fLock : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_1586_LockServer);

   type af_1718_QueryInterface is access function
     (This      : access IMarshal;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_1718_QueryInterface);

   type af_1723_AddRef is access function
     (This : access IMarshal)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1723_AddRef);

   type af_1726_Release is access function
     (This : access IMarshal)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1726_Release);

   type af_1729_GetUnmarshalClass is access function
     (This          : access IMarshal;
      riid          : REFIID;
      pv            : Win32.PVOID;
      dwDestContext : Win32.DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags     : Win32.DWORD;
      pCid          : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_1729_GetUnmarshalClass);

   type af_1738_GetMarshalSizeMax is access function
     (This          : access IMarshal;
      riid          : REFIID;
      pv            : Win32.PVOID;
      dwDestContext : Win32.DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags     : Win32.DWORD;
      pSize         : access Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_1738_GetMarshalSizeMax);

   type af_1747_MarshalInterface is access function
     (This          : access IMarshal;
      pStm          : access IStream;
      riid          : REFIID;
      pv            : Win32.PVOID;
      dwDestContext : Win32.DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags     : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_1747_MarshalInterface);

   type af_1756_UnmarshalInterface is access function
     (This : access IMarshal;
      pStm : access IStream;
      riid : REFIID;
      ppv  : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_1756_UnmarshalInterface);

   type af_1762_ReleaseMarshalData is access function
     (This : access IMarshal;
      pStm : access IStream)
      return HRESULT;
   pragma Convention (Stdcall, af_1762_ReleaseMarshalData);

   type af_1766_DisconnectObject is access function
     (This       : access IMarshal;
      dwReserved : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_1766_DisconnectObject);

   type af_1957_QueryInterface is access function
     (This      : access IMalloc;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_1957_QueryInterface);

   type af_1962_AddRef is access function
     (This : access IMalloc)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1962_AddRef);

   type af_1965_Release is access function
     (This : access IMalloc)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1965_Release);

   type af_1968_Alloc is access function
     (This : access IMalloc;
      cb   : Win32.ULONG)
      return Win32.PVOID;
   pragma Convention (Stdcall, af_1968_Alloc);

   type af_1972_Realloc is access function
     (This : access IMalloc;
      pv   : Win32.PVOID;
      cb   : Win32.ULONG)
      return Win32.PVOID;
   pragma Convention (Stdcall, af_1972_Realloc);

   type ap_1977_Free is access procedure
     (This : access IMalloc;
      pv   : Win32.PVOID);
   pragma Convention (Stdcall, ap_1977_Free);

   type af_1981_GetSize is access function
     (This : access IMalloc;
      pv   : Win32.PVOID)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1981_GetSize);

   type af_1985_DidAlloc is access function
     (This : access IMalloc;
      pv   : Win32.PVOID)
      return Win32.INT;
   pragma Convention (Stdcall, af_1985_DidAlloc);

   type ap_1989_HeapMinimize is access procedure (This : access IMalloc);
   pragma Convention (Stdcall, ap_1989_HeapMinimize);

   type af_2149_QueryInterface is access function
     (This      : access IStdMarshalInfo;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_2149_QueryInterface);

   type af_2154_AddRef is access function
     (This : access IStdMarshalInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2154_AddRef);

   type af_2157_Release is access function
     (This : access IStdMarshalInfo)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2157_Release);

   type af_2160_GetClassForHandler is access function
     (This          : access IStdMarshalInfo;
      dwDestContext : Win32.DWORD;
      pvDestContext : Win32.PVOID;
      pClsid        : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_2160_GetClassForHandler);

   type af_2262_QueryInterface is access function
     (This      : access IExternalConnection;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_2262_QueryInterface);

   type af_2267_AddRef is access function
     (This : access IExternalConnection)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2267_AddRef);

   type af_2270_Release is access function
     (This : access IExternalConnection)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2270_Release);

   type af_2273_AddConnection is access function
     (This     : access IExternalConnection;
      extconn  : Win32.DWORD;
      reserved : Win32.DWORD)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_2273_AddConnection);

   type af_2278_ReleaseConnection is access function
     (This               : access IExternalConnection;
      extconn            : Win32.DWORD;
      reserved           : Win32.DWORD;
      fLastReleaseCloses : Win32.BOOL)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_2278_ReleaseConnection);

   type af_2386_QueryInterface is access function
     (This      : access IWeakRef;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_2386_QueryInterface);

   type af_2391_AddRef is access function
     (This : access IWeakRef)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2391_AddRef);

   type af_2394_Release is access function
     (This : access IWeakRef)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2394_Release);

   type af_2397_ChangeWeakCount is access function
     (This    : access IWeakRef;
      c_delta : Win32.LONG)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2397_ChangeWeakCount);

   type af_2401_ReleaseKeepAlive is access function
     (This         : access IWeakRef;
      pUnkReleased : access IUnknown;
      reserved     : Win32.DWORD)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2401_ReleaseKeepAlive);

   type af_2512_QueryInterface is access function
     (This      : access IEnumUnknown;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_2512_QueryInterface);

   type af_2517_AddRef is access function
     (This : access IEnumUnknown)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2517_AddRef);

   type af_2520_Release is access function
     (This : access IEnumUnknown)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2520_Release);

   type af_2523_Next is access function
     (This         : access IEnumUnknown;
      celt         : Win32.ULONG;
      rgelt        : access LPUNKNOWN;
      pceltFetched : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_2523_Next);

   type af_2529_Skip is access function
     (This : access IEnumUnknown;
      celt : Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_2529_Skip);

   type af_2533_Reset is access function
     (This : access IEnumUnknown)
      return HRESULT;
   pragma Convention (Stdcall, af_2533_Reset);

   type af_2536_Clone is access function
     (This   : access IEnumUnknown;
      ppenum : access LPENUMUNKNOWN)
      return HRESULT;
   pragma Convention (Stdcall, af_2536_Clone);

   type af_2716_QueryInterface is access function
     (This      : access IBindCtx;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_2716_QueryInterface);

   type af_2721_AddRef is access function
     (This : access IBindCtx)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2721_AddRef);

   type af_2724_Release is access function
     (This : access IBindCtx)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2724_Release);

   type af_2727_RegisterObjectBound is access function
     (This : access IBindCtx;
      punk : access IUnknown)
      return HRESULT;
   pragma Convention (Stdcall, af_2727_RegisterObjectBound);

   type af_2731_RevokeObjectBound is access function
     (This : access IBindCtx;
      punk : access IUnknown)
      return HRESULT;
   pragma Convention (Stdcall, af_2731_RevokeObjectBound);

   type af_2735_ReleaseBoundObjects is access function
     (This : access IBindCtx)
      return HRESULT;
   pragma Convention (Stdcall, af_2735_ReleaseBoundObjects);

   type af_2738_SetBindOptions is access function
     (This      : access IBindCtx;
      pbindopts : access BIND_OPTS)
      return HRESULT;
   pragma Convention (Stdcall, af_2738_SetBindOptions);

   type af_2742_GetBindOptions is access function
     (This      : access IBindCtx;
      pbindopts : access BIND_OPTS)
      return HRESULT;
   pragma Convention (Stdcall, af_2742_GetBindOptions);

   type af_2746_GetRunningObjectTable is access function
     (This  : access IBindCtx;
      pprot : access LPRUNNINGOBJECTTABLE)
      return HRESULT;
   pragma Convention (Stdcall, af_2746_GetRunningObjectTable);

   type af_2750_RegisterObjectParam is access function
     (This   : access IBindCtx;
      pszKey : LPOLESTR;
      punk   : access IUnknown)
      return HRESULT;
   pragma Convention (Stdcall, af_2750_RegisterObjectParam);

   type af_2755_GetObjectParam is access function
     (This   : access IBindCtx;
      pszKey : LPOLESTR;
      ppunk  : access LPUNKNOWN)
      return HRESULT;
   pragma Convention (Stdcall, af_2755_GetObjectParam);

   type af_2760_EnumObjectParam is access function
     (This   : access IBindCtx;
      ppenum : access LPENUMSTRING)
      return HRESULT;
   pragma Convention (Stdcall, af_2760_EnumObjectParam);

   type af_2764_RevokeObjectParam is access function
     (This   : access IBindCtx;
      pszKey : LPOLESTR)
      return HRESULT;
   pragma Convention (Stdcall, af_2764_RevokeObjectParam);

   type af_2987_QueryInterface is access function
     (This      : access IParseDisplayName;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_2987_QueryInterface);

   type af_2992_AddRef is access function
     (This : access IParseDisplayName)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2992_AddRef);

   type af_2995_Release is access function
     (This : access IParseDisplayName)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2995_Release);

   type af_2998_ParseDisplayName is access function
     (This           : access IParseDisplayName;
      pbc            : access IBindCtx;
      pszDisplayName : LPOLESTR;
      pchEaten       : access Win32.ULONG;
      ppmkOut        : access LPMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_2998_ParseDisplayName);

   type af_3098_QueryInterface is access function
     (This      : access IEnumMoniker;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_3098_QueryInterface);

   type af_3103_AddRef is access function
     (This : access IEnumMoniker)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3103_AddRef);

   type af_3106_Release is access function
     (This : access IEnumMoniker)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3106_Release);

   type af_3109_Next is access function
     (This         : access IEnumMoniker;
      celt         : Win32.ULONG;
      rgelt        : access LPMONIKER;
      pceltFetched : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_3109_Next);

   type af_3115_Skip is access function
     (This : access IEnumMoniker;
      celt : Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_3115_Skip);

   type af_3119_Reset is access function
     (This : access IEnumMoniker)
      return HRESULT;
   pragma Convention (Stdcall, af_3119_Reset);

   type af_3122_Clone is access function
     (This   : access IEnumMoniker;
      ppenum : access LPENUMMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_3122_Clone);

   type af_3264_QueryInterface is access function
     (This      : access IRunnableObject;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_3264_QueryInterface);

   type af_3269_AddRef is access function
     (This : access IRunnableObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3269_AddRef);

   type af_3272_Release is access function
     (This : access IRunnableObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3272_Release);

   type af_3275_GetRunningClass is access function
     (This    : access IRunnableObject;
      lpClsid : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_3275_GetRunningClass);

   type af_3279_Run is access function
     (This : access IRunnableObject;
      pbc  : LPBINDCTX)
      return HRESULT;
   pragma Convention (Stdcall, af_3279_Run);

   type af_3283_IsRunning is access function
     (This : access IRunnableObject)
      return Win32.BOOL;
   pragma Convention (Stdcall, af_3283_IsRunning);

   type af_3286_LockRunning is access function
     (This              : access IRunnableObject;
      fLock             : Win32.BOOL;
      fLastUnlockCloses : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_3286_LockRunning);

   type af_3291_SetContainedObject is access function
     (This       : access IRunnableObject;
      fContained : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_3291_SetContainedObject);

   type af_3459_QueryInterface is access function
     (This      : access IRunningObjectTable;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_3459_QueryInterface);

   type af_3464_AddRef is access function
     (This : access IRunningObjectTable)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3464_AddRef);

   type af_3467_Release is access function
     (This : access IRunningObjectTable)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3467_Release);

   type af_3470_Register is access function
     (This          : access IRunningObjectTable;
      grfFlags      : Win32.DWORD;
      punkObject    : access IUnknown;
      pmkObjectName : access IMoniker;
      pdwRegister   : access Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_3470_Register);

   type af_3477_Revoke is access function
     (This       : access IRunningObjectTable;
      dwRegister : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_3477_Revoke);

   type af_3481_IsRunning is access function
     (This          : access IRunningObjectTable;
      pmkObjectName : access IMoniker)
      return HRESULT;
   pragma Convention (Stdcall, af_3481_IsRunning);

   type af_3485_GetObjectA is access function
     (This          : access IRunningObjectTable;
      pmkObjectName : access IMoniker;
      ppunkObject   : access LPUNKNOWN)
      return HRESULT;
   pragma Convention (Stdcall, af_3485_GetObjectA);

   type af_3490_NoteChangeTime is access function
     (This       : access IRunningObjectTable;
      dwRegister : Win32.DWORD;
      pfiletime  : access Win32.Winbase.FILETIME)
      return HRESULT;
   pragma Convention (Stdcall, af_3490_NoteChangeTime);

   type af_3495_GetTimeOfLastChange is access function
     (This          : access IRunningObjectTable;
      pmkObjectName : access IMoniker;
      pfiletime     : access Win32.Winbase.FILETIME)
      return HRESULT;
   pragma Convention (Stdcall, af_3495_GetTimeOfLastChange);

   type af_3500_EnumRunning is access function
     (This          : access IRunningObjectTable;
      ppenumMoniker : access LPENUMMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_3500_EnumRunning);

   type af_3680_QueryInterface is access function
     (This      : access IPersist;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_3680_QueryInterface);

   type af_3685_AddRef is access function
     (This : access IPersist)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3685_AddRef);

   type af_3688_Release is access function
     (This : access IPersist)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3688_Release);

   type af_3691_GetClassID is access function
     (This     : access IPersist;
      pClassID : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_3691_GetClassID);

   type af_3784_QueryInterface is access function
     (This      : access IPersistStream;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_3784_QueryInterface);

   type af_3789_AddRef is access function
     (This : access IPersistStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3789_AddRef);

   type af_3792_Release is access function
     (This : access IPersistStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3792_Release);

   type af_3795_GetClassID is access function
     (This     : access IPersistStream;
      pClassID : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_3795_GetClassID);

   type af_3799_IsDirty is access function
     (This : access IPersistStream)
      return HRESULT;
   pragma Convention (Stdcall, af_3799_IsDirty);

   type af_3802_Load is access function
     (This : access IPersistStream;
      pStm : access IStream)
      return HRESULT;
   pragma Convention (Stdcall, af_3802_Load);

   type af_3806_Save is access function
     (This        : access IPersistStream;
      pStm        : access IStream;
      fClearDirty : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_3806_Save);

   type af_3811_GetSizeMax is access function
     (This    : access IPersistStream;
      pcbSize : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;
   pragma Convention (Stdcall, af_3811_GetSizeMax);

   type af_4030_QueryInterface is access function
     (This      : access IMoniker;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_4030_QueryInterface);

   type af_4035_AddRef is access function
     (This : access IMoniker)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4035_AddRef);

   type af_4038_Release is access function
     (This : access IMoniker)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4038_Release);

   type af_4041_GetClassID is access function
     (This     : access IMoniker;
      pClassID : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_4041_GetClassID);

   type af_4045_IsDirty is access function
     (This : access IMoniker)
      return HRESULT;
   pragma Convention (Stdcall, af_4045_IsDirty);

   type af_4048_Load is access function
     (This : access IMoniker;
      pStm : access IStream)
      return HRESULT;
   pragma Convention (Stdcall, af_4048_Load);

   type af_4052_Save is access function
     (This        : access IMoniker;
      pStm        : access IStream;
      fClearDirty : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_4052_Save);

   type af_4057_GetSizeMax is access function
     (This    : access IMoniker;
      pcbSize : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;
   pragma Convention (Stdcall, af_4057_GetSizeMax);

   type af_4061_BindToObject is access function
     (This       : access IMoniker;
      pbc        : access IBindCtx;
      pmkToLeft  : access IMoniker;
      riidResult : access IID;
      ppvResult  : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_4061_BindToObject);

   type af_4068_BindToStorage is access function
     (This      : access IMoniker;
      pbc       : access IBindCtx;
      pmkToLeft : access IMoniker;
      riid      : REFIID;
      ppvObj    : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_4068_BindToStorage);

   type af_4075_Reduce is access function
     (This           : access IMoniker;
      pbc            : access IBindCtx;
      dwReduceHowFar : Win32.DWORD;
      ppmkToLeft     : access LPMONIKER;
      ppmkReduced    : access LPMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_4075_Reduce);

   type af_4082_ComposeWith is access function
     (This              : access IMoniker;
      pmkRight          : access IMoniker;
      fOnlyIfNotGeneric : Win32.BOOL;
      ppmkComposite     : access LPMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_4082_ComposeWith);

   type af_4088_Enum is access function
     (This          : access IMoniker;
      fForward      : Win32.BOOL;
      ppenumMoniker : access LPENUMMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_4088_Enum);

   type af_4093_IsEqual is access function
     (This            : access IMoniker;
      pmkOtherMoniker : access IMoniker)
      return HRESULT;
   pragma Convention (Stdcall, af_4093_IsEqual);

   type af_4097_Hash is access function
     (This    : access IMoniker;
      pdwHash : access Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_4097_Hash);

   type af_4101_IsRunning is access function
     (This            : access IMoniker;
      pbc             : access IBindCtx;
      pmkToLeft       : access IMoniker;
      pmkNewlyRunning : access IMoniker)
      return HRESULT;
   pragma Convention (Stdcall, af_4101_IsRunning);

   type af_4107_GetTimeOfLastChange is access function
     (This      : access IMoniker;
      pbc       : access IBindCtx;
      pmkToLeft : access IMoniker;
      pFileTime : access Win32.Winbase.FILETIME)
      return HRESULT;
   pragma Convention (Stdcall, af_4107_GetTimeOfLastChange);

   type af_4113_Inverse is access function
     (This : access IMoniker;
      ppmk : access LPMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_4113_Inverse);

   type af_4117_CommonPrefixWith is access function
     (This     : access IMoniker;
      pmkOther : access IMoniker;
      ppmkPx   : access LPMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_4117_CommonPrefixWith);

   type af_4122_RelativePathTo is access function
     (This        : access IMoniker;
      pmkOther    : access IMoniker;
      ppmkRelPath : access LPMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_4122_RelativePathTo);

   type af_4127_GetDisplayName is access function
     (This            : access IMoniker;
      pbc             : access IBindCtx;
      pmkToLeft       : access IMoniker;
      ppszDisplayName : access LPOLESTR)
      return HRESULT;
   pragma Convention (Stdcall, af_4127_GetDisplayName);

   type af_4133_ParseDisplayName is access function
     (This           : access IMoniker;
      pbc            : access IBindCtx;
      pmkToLeft      : access IMoniker;
      pszDisplayName : LPOLESTR;
      pchEaten       : access Win32.ULONG;
      ppmkOut        : access LPMONIKER)
      return HRESULT;
   pragma Convention (Stdcall, af_4133_ParseDisplayName);

   type af_4141_IsSystemMoniker is access function
     (This     : access IMoniker;
      pdwMksys : access Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_4141_IsSystemMoniker);

   type af_4486_QueryInterface is access function
     (This      : access IEnumString;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_4486_QueryInterface);

   type af_4491_AddRef is access function
     (This : access IEnumString)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4491_AddRef);

   type af_4494_Release is access function
     (This : access IEnumString)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4494_Release);

   type af_4497_Next is access function
     (This         : access IEnumString;
      celt         : Win32.ULONG;
      rgelt        : access LPOLESTR;
      pceltFetched : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_4497_Next);

   type af_4503_Skip is access function
     (This : access IEnumString;
      celt : Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_4503_Skip);

   type af_4507_Reset is access function
     (This : access IEnumString)
      return HRESULT;
   pragma Convention (Stdcall, af_4507_Reset);

   type af_4510_Clone is access function
     (This   : access IEnumString;
      ppenum : access LPENUMSTRING)
      return HRESULT;
   pragma Convention (Stdcall, af_4510_Clone);

   type af_4724_QueryInterface is access function
     (This      : access IStream;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_4724_QueryInterface);

   type af_4729_AddRef is access function
     (This : access IStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4729_AddRef);

   type af_4732_Release is access function
     (This : access IStream)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4732_Release);

   type af_4735_Read is access function
     (This    : access IStream;
      pv      : Win32.PVOID;
      cb      : Win32.ULONG;
      pcbRead : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_4735_Read);

   type af_4741_Write is access function
     (This       : access IStream;
      pv         : Win32.PVOID;
      cb         : Win32.ULONG;
      pcbWritten : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_4741_Write);

   type af_4747_Seek is access function
     (This            : access IStream;
      dlibMove        : Win32.Winnt.LARGE_INTEGER;
      dwOrigin        : Win32.DWORD;
      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;
   pragma Convention (Stdcall, af_4747_Seek);

   type af_4753_SetSize is access function
     (This       : access IStream;
      libNewSize : Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;
   pragma Convention (Stdcall, af_4753_SetSize);

   type af_4757_CopyTo is access function
     (This       : access IStream;
      pstm       : access IStream;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      pcbRead    : access Win32.Winnt.ULARGE_INTEGER;
      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;
   pragma Convention (Stdcall, af_4757_CopyTo);

   type af_4764_Commit is access function
     (This           : access IStream;
      grfCommitFlags : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_4764_Commit);

   type af_4768_Revert is access function
     (This : access IStream)
      return HRESULT;
   pragma Convention (Stdcall, af_4768_Revert);

   type af_4771_LockRegion is access function
     (This       : access IStream;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_4771_LockRegion);

   type af_4777_UnlockRegion is access function
     (This       : access IStream;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_4777_UnlockRegion);

   type af_4783_Stat is access function
     (This        : access IStream;
      pstatstg    : access STATSTG;
      grfStatFlag : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_4783_Stat);

   type af_4788_Clone is access function
     (This  : access IStream;
      ppstm : access LPSTREAM)
      return HRESULT;
   pragma Convention (Stdcall, af_4788_Clone);

   type af_5045_QueryInterface is access function
     (This      : access IEnumSTATSTG;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_5045_QueryInterface);

   type af_5050_AddRef is access function
     (This : access IEnumSTATSTG)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5050_AddRef);

   type af_5053_Release is access function
     (This : access IEnumSTATSTG)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5053_Release);

   type af_5056_Next is access function
     (This         : access IEnumSTATSTG;
      celt         : Win32.ULONG;
      rgelt        : access STATSTG;
      pceltFetched : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_5056_Next);

   type af_5062_Skip is access function
     (This : access IEnumSTATSTG;
      celt : Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_5062_Skip);

   type af_5066_Reset is access function
     (This : access IEnumSTATSTG)
      return HRESULT;
   pragma Convention (Stdcall, af_5066_Reset);

   type af_5069_Clone is access function
     (This   : access IEnumSTATSTG;
      ppenum : access LPENUMSTATSTG)
      return HRESULT;
   pragma Convention (Stdcall, af_5069_Clone);

   type af_5285_QueryInterface is access function
     (This      : access IStorage;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_5285_QueryInterface);

   type af_5290_AddRef is access function
     (This : access IStorage)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5290_AddRef);

   type af_5293_Release is access function
     (This : access IStorage)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5293_Release);

   type af_5296_CreateStream is access function
     (This      : access IStorage;
      pwcsName  : access OLECHAR;
      grfMode   : Win32.DWORD;
      reserved1 : Win32.DWORD;
      reserved2 : Win32.DWORD;
      ppstm     : access LPSTREAM)
      return HRESULT;
   pragma Convention (Stdcall, af_5296_CreateStream);

   type af_5304_OpenStream is access function
     (This      : access IStorage;
      pwcsName  : access OLECHAR;
      reserved1 : Win32.PVOID;
      grfMode   : Win32.DWORD;
      reserved2 : Win32.DWORD;
      ppstm     : access LPSTREAM)
      return HRESULT;
   pragma Convention (Stdcall, af_5304_OpenStream);

   type af_5312_CreateStorage is access function
     (This      : access IStorage;
      pwcsName  : access OLECHAR;
      grfMode   : Win32.DWORD;
      dwStgFmt  : Win32.DWORD;
      reserved2 : Win32.DWORD;
      ppstg     : access LPSTORAGE)
      return HRESULT;
   pragma Convention (Stdcall, af_5312_CreateStorage);

   type af_5320_OpenStorage is access function
     (This         : access IStorage;
      pwcsName     : access OLECHAR;
      pstgPriority : access IStorage;
      grfMode      : Win32.DWORD;
      snbExclude   : SNB;
      reserved     : Win32.DWORD;
      ppstg        : access LPSTORAGE)
      return HRESULT;
   pragma Convention (Stdcall, af_5320_OpenStorage);

   type af_5329_CopyTo is access function
     (This         : access IStorage;
      ciidExclude  : Win32.DWORD;
      rgiidExclude : access IID;
      snbExclude   : SNB;
      pstgDest     : access IStorage)
      return HRESULT;
   pragma Convention (Stdcall, af_5329_CopyTo);

   type af_5336_MoveElementTo is access function
     (This        : access IStorage;
      pwcsName    : access OLECHAR;
      pstgDest    : access IStorage;
      pwcsNewName : access OLECHAR;
      grfFlags    : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_5336_MoveElementTo);

   type af_5343_Commit is access function
     (This           : access IStorage;
      grfCommitFlags : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_5343_Commit);

   type af_5347_Revert is access function
     (This : access IStorage)
      return HRESULT;
   pragma Convention (Stdcall, af_5347_Revert);

   type af_5350_EnumElements is access function
     (This      : access IStorage;
      reserved1 : Win32.DWORD;
      reserved2 : Win32.PVOID;
      reserved3 : Win32.DWORD;
      ppenum    : access LPENUMSTATSTG)
      return HRESULT;
   pragma Convention (Stdcall, af_5350_EnumElements);

   type af_5357_DestroyElement is access function
     (This     : access IStorage;
      pwcsName : access OLECHAR)
      return HRESULT;
   pragma Convention (Stdcall, af_5357_DestroyElement);

   type af_5361_RenameElement is access function
     (This        : access IStorage;
      pwcsOldName : access OLECHAR;
      pwcsNewName : access OLECHAR)
      return HRESULT;
   pragma Convention (Stdcall, af_5361_RenameElement);

   type af_5366_SetElementTimes is access function
     (This     : access IStorage;
      pwcsName : access OLECHAR;
      pctime   : access Win32.Winbase.FILETIME;
      patime   : access Win32.Winbase.FILETIME;
      pmtime   : access Win32.Winbase.FILETIME)
      return HRESULT;
   pragma Convention (Stdcall, af_5366_SetElementTimes);

   type af_5373_SetClass is access function
     (This  : access IStorage;
      clsid : access Win32.Objbase.CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_5373_SetClass);

   type af_5377_SetStateBits is access function
     (This         : access IStorage;
      grfStateBits : Win32.DWORD;
      grfMask      : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_5377_SetStateBits);

   type af_5382_Stat is access function
     (This        : access IStorage;
      pstatstg    : access STATSTG;
      grfStatFlag : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_5382_Stat);

   type af_5723_QueryInterface is access function
     (This      : access IPersistFile;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_5723_QueryInterface);

   type af_5728_AddRef is access function
     (This : access IPersistFile)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5728_AddRef);

   type af_5731_Release is access function
     (This : access IPersistFile)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5731_Release);

   type af_5734_GetClassID is access function
     (This     : access IPersistFile;
      pClassID : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_5734_GetClassID);

   type af_5738_IsDirty is access function
     (This : access IPersistFile)
      return HRESULT;
   pragma Convention (Stdcall, af_5738_IsDirty);

   type af_5741_Load is access function
     (This        : access IPersistFile;
      pszFileName : LPCOLESTR;
      dwMode      : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_5741_Load);

   type af_5746_Save is access function
     (This        : access IPersistFile;
      pszFileName : LPCOLESTR;
      fRemember   : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_5746_Save);

   type af_5751_SaveCompleted is access function
     (This        : access IPersistFile;
      pszFileName : LPCOLESTR)
      return HRESULT;
   pragma Convention (Stdcall, af_5751_SaveCompleted);

   type af_5755_GetCurFile is access function
     (This         : access IPersistFile;
      ppszFileName : access LPOLESTR)
      return HRESULT;
   pragma Convention (Stdcall, af_5755_GetCurFile);

   type af_5918_QueryInterface is access function
     (This      : access IPersistStorage;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_5918_QueryInterface);

   type af_5923_AddRef is access function
     (This : access IPersistStorage)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5923_AddRef);

   type af_5926_Release is access function
     (This : access IPersistStorage)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_5926_Release);

   type af_5929_GetClassID is access function
     (This     : access IPersistStorage;
      pClassID : access CLSID)
      return HRESULT;
   pragma Convention (Stdcall, af_5929_GetClassID);

   type af_5933_IsDirty is access function
     (This : access IPersistStorage)
      return HRESULT;
   pragma Convention (Stdcall, af_5933_IsDirty);

   type af_5936_InitNew is access function
     (This : access IPersistStorage;
      pStg : access IStorage)
      return HRESULT;
   pragma Convention (Stdcall, af_5936_InitNew);

   type af_5940_Load is access function
     (This : access IPersistStorage;
      pStg : access IStorage)
      return HRESULT;
   pragma Convention (Stdcall, af_5940_Load);

   type af_5944_Save is access function
     (This        : access IPersistStorage;
      pStgSave    : access IStorage;
      fSameAsLoad : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_5944_Save);

   type af_5949_SaveCompleted is access function
     (This    : access IPersistStorage;
      pStgNew : access IStorage)
      return HRESULT;
   pragma Convention (Stdcall, af_5949_SaveCompleted);

   type af_5953_HandsOffStorage is access function
     (This : access IPersistStorage)
      return HRESULT;
   pragma Convention (Stdcall, af_5953_HandsOffStorage);

   type af_6142_QueryInterface is access function
     (This      : access ILockBytes;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_6142_QueryInterface);

   type af_6147_AddRef is access function
     (This : access ILockBytes)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6147_AddRef);

   type af_6150_Release is access function
     (This : access ILockBytes)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6150_Release);

   type af_6153_ReadAt is access function
     (This     : access ILockBytes;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv       : Win32.PVOID;
      cb       : Win32.ULONG;
      pcbRead  : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_6153_ReadAt);

   type af_6160_WriteAt is access function
     (This       : access ILockBytes;
      ulOffset   : Win32.Winnt.ULARGE_INTEGER;
      pv         : Win32.PVOID;
      cb         : Win32.ULONG;
      pcbWritten : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_6160_WriteAt);

   type af_6167_Flush is access function
     (This : access ILockBytes)
      return HRESULT;
   pragma Convention (Stdcall, af_6167_Flush);

   type af_6170_SetSize is access function
     (This : access ILockBytes;
      cb   : Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;
   pragma Convention (Stdcall, af_6170_SetSize);

   type af_6174_LockRegion is access function
     (This       : access ILockBytes;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_6174_LockRegion);

   type af_6180_UnlockRegion is access function
     (This       : access ILockBytes;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_6180_UnlockRegion);

   type af_6186_Stat is access function
     (This        : access ILockBytes;
      pstatstg    : access STATSTG;
      grfStatFlag : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_6186_Stat);

   type af_6411_QueryInterface is access function
     (This      : access IEnumFORMATETC;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_6411_QueryInterface);

   type af_6416_AddRef is access function
     (This : access IEnumFORMATETC)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6416_AddRef);

   type af_6419_Release is access function
     (This : access IEnumFORMATETC)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6419_Release);

   type af_6422_Next is access function
     (This         : access IEnumFORMATETC;
      celt         : Win32.ULONG;
      rgelt        : access FORMATETC;
      pceltFetched : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_6422_Next);

   type af_6428_Skip is access function
     (This : access IEnumFORMATETC;
      celt : Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_6428_Skip);

   type af_6432_Reset is access function
     (This : access IEnumFORMATETC)
      return HRESULT;
   pragma Convention (Stdcall, af_6432_Reset);

   type af_6435_Clone is access function
     (This   : access IEnumFORMATETC;
      ppenum : access LPENUMFORMATETC)
      return HRESULT;
   pragma Convention (Stdcall, af_6435_Clone);

   type af_6599_QueryInterface is access function
     (This      : access IEnumSTATDATA;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_6599_QueryInterface);

   type af_6604_AddRef is access function
     (This : access IEnumSTATDATA)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6604_AddRef);

   type af_6607_Release is access function
     (This : access IEnumSTATDATA)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6607_Release);

   type af_6610_Next is access function
     (This         : access IEnumSTATDATA;
      celt         : Win32.ULONG;
      rgelt        : access STATDATA;
      pceltFetched : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_6610_Next);

   type af_6616_Skip is access function
     (This : access IEnumSTATDATA;
      celt : Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_6616_Skip);

   type af_6620_Reset is access function
     (This : access IEnumSTATDATA)
      return HRESULT;
   pragma Convention (Stdcall, af_6620_Reset);

   type af_6623_Clone is access function
     (This   : access IEnumSTATDATA;
      ppenum : access LPENUMSTATDATA)
      return HRESULT;
   pragma Convention (Stdcall, af_6623_Clone);

   type af_6753_QueryInterface is access function
     (This      : access IRootStorage;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_6753_QueryInterface);

   type af_6758_AddRef is access function
     (This : access IRootStorage)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6758_AddRef);

   type af_6761_Release is access function
     (This : access IRootStorage)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6761_Release);

   type af_6764_SwitchToFile is access function
     (This    : access IRootStorage;
      pszFile : LPOLESTR)
      return HRESULT;
   pragma Convention (Stdcall, af_6764_SwitchToFile);

   type af_6923_QueryInterface is access function
     (This      : access IAdviseSink;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_6923_QueryInterface);

   type af_6928_AddRef is access function
     (This : access IAdviseSink)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6928_AddRef);

   type af_6931_Release is access function
     (This : access IAdviseSink)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_6931_Release);

   type ap_6934_OnDataChange is access procedure
     (This       : access IAdviseSink;
      pFormatetc : access FORMATETC;
      pStgmed    : access STGMEDIUM);
   pragma Convention (Stdcall, ap_6934_OnDataChange);

   type ap_6939_OnViewChange is access procedure
     (This     : access IAdviseSink;
      dwAspect : Win32.DWORD;
      lindex   : Win32.LONG);
   pragma Convention (Stdcall, ap_6939_OnViewChange);

   type ap_6944_OnRename is access procedure
     (This : access IAdviseSink;
      pmk  : access IMoniker);
   pragma Convention (Stdcall, ap_6944_OnRename);

   type ap_6948_OnSave is access procedure (This : access IAdviseSink);
   pragma Convention (Stdcall, ap_6948_OnSave);

   type ap_6951_OnClose is access procedure (This : access IAdviseSink);
   pragma Convention (Stdcall, ap_6951_OnClose);

   type af_7094_QueryInterface is access function
     (This      : access IAdviseSink2;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_7094_QueryInterface);

   type af_7099_AddRef is access function
     (This : access IAdviseSink2)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7099_AddRef);

   type af_7102_Release is access function
     (This : access IAdviseSink2)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7102_Release);

   type ap_7105_OnDataChange is access procedure
     (This       : access IAdviseSink2;
      pFormatetc : access FORMATETC;
      pStgmed    : access STGMEDIUM);
   pragma Convention (Stdcall, ap_7105_OnDataChange);

   type ap_7110_OnViewChange is access procedure
     (This     : access IAdviseSink2;
      dwAspect : Win32.DWORD;
      lindex   : Win32.LONG);
   pragma Convention (Stdcall, ap_7110_OnViewChange);

   type ap_7115_OnRename is access procedure
     (This : access IAdviseSink2;
      pmk  : access IMoniker);
   pragma Convention (Stdcall, ap_7115_OnRename);

   type ap_7119_OnSave is access procedure (This : access IAdviseSink2);
   pragma Convention (Stdcall, ap_7119_OnSave);

   type ap_7122_OnClose is access procedure (This : access IAdviseSink2);
   pragma Convention (Stdcall, ap_7122_OnClose);

   type ap_7125_OnLinkSrcChange is access procedure
     (This : access IAdviseSink2;
      pmk  : access IMoniker);
   pragma Convention (Stdcall, ap_7125_OnLinkSrcChange);

   type af_7265_QueryInterface is access function
     (This      : access IDataObject;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_7265_QueryInterface);

   type af_7270_AddRef is access function
     (This : access IDataObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7270_AddRef);

   type af_7273_Release is access function
     (This : access IDataObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7273_Release);

   type af_7276_GetData is access function
     (This         : access IDataObject;
      pformatetcIn : access FORMATETC;
      pmedium      : access STGMEDIUM)
      return HRESULT;
   pragma Convention (Stdcall, af_7276_GetData);

   type af_7281_GetDataHere is access function
     (This       : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium    : access STGMEDIUM)
      return HRESULT;
   pragma Convention (Stdcall, af_7281_GetDataHere);

   type af_7286_QueryGetData is access function
     (This       : access IDataObject;
      pformatetc : access FORMATETC)
      return HRESULT;
   pragma Convention (Stdcall, af_7286_QueryGetData);

   type af_7290_GetCanonicalFormatEtc is access function
     (This          : access IDataObject;
      pformatectIn  : access FORMATETC;
      pformatetcOut : access FORMATETC)
      return HRESULT;
   pragma Convention (Stdcall, af_7290_GetCanonicalFormatEtc);

   type af_7295_SetData is access function
     (This       : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium    : access STGMEDIUM;
      fRelease   : Win32.BOOL)
      return HRESULT;
   pragma Convention (Stdcall, af_7295_SetData);

   type af_7301_EnumFormatEtc is access function
     (This            : access IDataObject;
      dwDirection     : Win32.DWORD;
      ppenumFormatEtc : access LPENUMFORMATETC)
      return HRESULT;
   pragma Convention (Stdcall, af_7301_EnumFormatEtc);

   type af_7306_DAdvise is access function
     (This          : access IDataObject;
      pformatetc    : access FORMATETC;
      advf          : Win32.DWORD;
      pAdvSink      : access IAdviseSink;
      pdwConnection : access Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_7306_DAdvise);

   type af_7313_DUnadvise is access function
     (This         : access IDataObject;
      dwConnection : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_7313_DUnadvise);

   type af_7317_EnumDAdvise is access function
     (This         : access IDataObject;
      ppenumAdvise : access LPENUMSTATDATA)
      return HRESULT;
   pragma Convention (Stdcall, af_7317_EnumDAdvise);

   type af_7545_QueryInterface is access function
     (This      : access IDataAdviseHolder;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_7545_QueryInterface);

   type af_7550_AddRef is access function
     (This : access IDataAdviseHolder)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7550_AddRef);

   type af_7553_Release is access function
     (This : access IDataAdviseHolder)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7553_Release);

   type af_7556_Advise is access function
     (This          : access IDataAdviseHolder;
      pDataObject   : access IDataObject;
      pFetc         : access FORMATETC;
      advf          : Win32.DWORD;
      pAdvise       : access IAdviseSink;
      pdwConnection : access Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_7556_Advise);

   type af_7564_Unadvise is access function
     (This         : access IDataAdviseHolder;
      dwConnection : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_7564_Unadvise);

   type af_7568_EnumAdvise is access function
     (This         : access IDataAdviseHolder;
      ppenumAdvise : access LPENUMSTATDATA)
      return HRESULT;
   pragma Convention (Stdcall, af_7568_EnumAdvise);

   type af_7572_SendOnDataChange is access function
     (This        : access IDataAdviseHolder;
      pDataObject : access IDataObject;
      dwReserved  : Win32.DWORD;
      advf        : Win32.DWORD)
      return HRESULT;
   pragma Convention (Stdcall, af_7572_SendOnDataChange);

   type af_7766_QueryInterface is access function
     (This      : access IMessageFilter;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_7766_QueryInterface);

   type af_7771_AddRef is access function
     (This : access IMessageFilter)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7771_AddRef);

   type af_7774_Release is access function
     (This : access IMessageFilter)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7774_Release);

   type af_7777_HandleInComingCall is access function
     (This            : access IMessageFilter;
      dwCallType      : Win32.DWORD;
      htaskCaller     : Win32.Windef.HTASK;
      dwTickCount     : Win32.DWORD;
      lpInterfaceInfo : Win32.Objbase.LPINTERFACEINFO)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_7777_HandleInComingCall);

   type af_7784_RetryRejectedCall is access function
     (This         : access IMessageFilter;
      htaskCallee  : Win32.Windef.HTASK;
      dwTickCount  : Win32.DWORD;
      dwRejectType : Win32.DWORD)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_7784_RetryRejectedCall);

   type af_7790_MessagePending is access function
     (This          : access IMessageFilter;
      htaskCallee   : Win32.Windef.HTASK;
      dwTickCount   : Win32.DWORD;
      dwPendingType : Win32.DWORD)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_7790_MessagePending);

   type af_7942_QueryInterface is access function
     (This      : access IRpcChannelBuffer;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_7942_QueryInterface);

   type af_7947_AddRef is access function
     (This : access IRpcChannelBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7947_AddRef);

   type af_7950_Release is access function
     (This : access IRpcChannelBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_7950_Release);

   type af_7953_GetBuffer is access function
     (This     : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE;
      riid     : REFIID)
      return HRESULT;
   pragma Convention (Stdcall, af_7953_GetBuffer);

   type af_7958_SendReceive is access function
     (This     : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE;
      pStatus  : access Win32.ULONG)
      return HRESULT;
   pragma Convention (Stdcall, af_7958_SendReceive);

   type af_7963_FreeBuffer is access function
     (This     : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE)
      return HRESULT;
   pragma Convention (Stdcall, af_7963_FreeBuffer);

   type af_7967_GetDestCtx is access function
     (This           : access IRpcChannelBuffer;
      pdwDestContext : access Win32.DWORD;
      ppvDestContext : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_7967_GetDestCtx);

   type af_7972_IsConnected is access function
     (This : access IRpcChannelBuffer)
      return HRESULT;
   pragma Convention (Stdcall, af_7972_IsConnected);

   type af_8116_QueryInterface is access function
     (This      : access IRpcProxyBuffer;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_8116_QueryInterface);

   type af_8121_AddRef is access function
     (This : access IRpcProxyBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_8121_AddRef);

   type af_8124_Release is access function
     (This : access IRpcProxyBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_8124_Release);

   type af_8127_Connect is access function
     (This              : access IRpcProxyBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer)
      return HRESULT;
   pragma Convention (Stdcall, af_8127_Connect);

   type ap_8131_Disconnect is access procedure
     (This : access IRpcProxyBuffer);
   pragma Convention (Stdcall, ap_8131_Disconnect);

   type af_8242_QueryInterface is access function
     (This      : access IRpcStubBuffer;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_8242_QueryInterface);

   type af_8247_AddRef is access function
     (This : access IRpcStubBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_8247_AddRef);

   type af_8250_Release is access function
     (This : access IRpcStubBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_8250_Release);

   type af_8253_Connect is access function
     (This       : access IRpcStubBuffer;
      pUnkServer : access IUnknown)
      return HRESULT;
   pragma Convention (Stdcall, af_8253_Connect);

   type ap_8257_Disconnect is access procedure
     (This : access IRpcStubBuffer);
   pragma Convention (Stdcall, ap_8257_Disconnect);

   type af_8260_Invoke is access function
     (This              : access IRpcStubBuffer;
      prpcmsg           : access RPCOLEMESSAGE;
      pRpcChannelBuffer : access IRpcChannelBuffer)
      return HRESULT;
   pragma Convention (Stdcall, af_8260_Invoke);

   type af_8265_IsIIDSupported is access function
     (This : access IRpcStubBuffer;
      riid : REFIID)
      return a_IRpcStubBuffer_t;
   pragma Convention (Stdcall, af_8265_IsIIDSupported);

   type af_8269_CountRefs is access function
     (This : access IRpcStubBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_8269_CountRefs);

   type af_8272_DebugServerQueryInterface is access function
     (This : access IRpcStubBuffer;
      ppv  : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_8272_DebugServerQueryInterface);

   type ap_8276_DebugServerRelease is access procedure
     (This : access IRpcStubBuffer;
      pv   : Win32.PVOID);
   pragma Convention (Stdcall, ap_8276_DebugServerRelease);

   type af_8454_QueryInterface is access function
     (This      : access IPSFactoryBuffer;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_8454_QueryInterface);

   type af_8459_AddRef is access function
     (This : access IPSFactoryBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_8459_AddRef);

   type af_8462_Release is access function
     (This : access IPSFactoryBuffer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_8462_Release);

   type af_8465_CreateProxy is access function
     (This      : access IPSFactoryBuffer;
      pUnkOuter : access IUnknown;
      riid      : REFIID;
      ppProxy   : access PIRpcProxyBuffer;
      ppv       : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, af_8465_CreateProxy);

   type af_8472_CreateStub is access function
     (This       : access IPSFactoryBuffer;
      riid       : REFIID;
      pUnkServer : access IUnknown;
      ppStub     : access a_IRpcStubBuffer_t)
      return HRESULT;
   pragma Convention (Stdcall, af_8472_CreateStub);

   type RemHGLOBAL is record
      fNullHGlobal : Win32.INT;
      cbData       : Win32.UINT;
      data         : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type RemHMETAFILEPICT is record
      mm     : Win32.INT;
      xExt   : Win32.INT;
      yExt   : Win32.INT;
      cbData : Win32.UINT;
      data   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type RemHENHMETAFILE is record
      cbData : Win32.UINT;
      data   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type RemHBITMAP is record
      cbData : Win32.UINT;
      data   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type RemHPALETTE is record
      cbData : Win32.UINT;
      data   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type RemBRUSH is record
      cbData : Win32.UINT;
      data   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type OBJECTID is record
      Lineage    : Win32.Rpcdce.GUID;
      Uniquifier : Win32.UINT;
   end record;

   type IUnknown is record
      lpVtbl : a_IUnknownVtbl_t;
   end record;

   type IClassFactory is record
      lpVtbl : a_IClassFactoryVtbl_t;
   end record;

   type IMarshal is record
      lpVtbl : a_IMarshalVtbl_t;
   end record;

   type IMalloc is record
      lpVtbl : a_IMallocVtbl_t;
   end record;

   type IStdMarshalInfo is record
      lpVtbl : a_IStdMarshalInfoVtbl_t;
   end record;

   type IExternalConnection is record
      lpVtbl : a_IExternalConnectionVtbl_t;
   end record;

   type IWeakRef is record
      lpVtbl : a_IWeakRefVtbl_t;
   end record;

   type IEnumUnknown is record
      lpVtbl : a_IEnumUnknownVtbl_t;
   end record;

   type IBindCtx is record
      lpVtbl : a_IBindCtxVtbl_t;
   end record;

   type IParseDisplayName is record
      lpVtbl : a_IParseDisplayNameVtbl_t;
   end record;

   type IEnumMoniker is record
      lpVtbl : a_IEnumMonikerVtbl_t;
   end record;

   type IRunnableObject is record
      lpVtbl : a_IRunnableObjectVtbl_t;
   end record;

   type IRunningObjectTable is record
      lpVtbl : a_IRunningObjectTableVtbl_t;
   end record;

   type IPersist is record
      lpVtbl : a_IPersistVtbl_t;
   end record;

   type IPersistStream is record
      lpVtbl : a_IPersistStreamVtbl_t;
   end record;

   type IMoniker is record
      lpVtbl : a_IMonikerVtbl_t;
   end record;

   type IEnumString is record
      lpVtbl : a_IEnumStringVtbl_t;
   end record;

   type IStream is record
      lpVtbl : a_IStreamVtbl_t;
   end record;

   type IEnumSTATSTG is record
      lpVtbl : a_IEnumSTATSTGVtbl_t;
   end record;

   type IStorage is record
      lpVtbl : a_IStorageVtbl_t;
   end record;

   type IPersistFile is record
      lpVtbl : a_IPersistFileVtbl_t;
   end record;

   type IPersistStorage is record
      lpVtbl : a_IPersistStorageVtbl_t;
   end record;

   type ILockBytes is record
      lpVtbl : a_ILockBytesVtbl_t;
   end record;

   type IEnumFORMATETC is record
      lpVtbl : a_IEnumFORMATETCVtbl_t;
   end record;

   type IEnumSTATDATA is record
      lpVtbl : a_IEnumSTATDATAVtbl_t;
   end record;

   type IRootStorage is record
      lpVtbl : a_IRootStorageVtbl_t;
   end record;

   type IAdviseSink is record
      lpVtbl : a_IAdviseSinkVtbl_t;
   end record;

   type IAdviseSink2 is record
      lpVtbl : a_IAdviseSink2Vtbl_t;
   end record;

   type IDataObject is record
      lpVtbl : a_IDataObjectVtbl_t;
   end record;

   type IDataAdviseHolder is record
      lpVtbl : a_IDataAdviseHolderVtbl_t;
   end record;

   type IMessageFilter is record
      lpVtbl : a_IMessageFilterVtbl_t;
   end record;

   type IRpcProxyBuffer is record
      lpVtbl : a_IRpcProxyBufferVtbl_t;
   end record;

   type IPSFactoryBuffer is record
      lpVtbl : a_IPSFactoryBufferVtbl_t;
   end record;

   type IUnknownVtbl is record
      QueryInterface : af_1454_QueryInterface;
      AddRef         : af_1459_AddRef;
      Release        : af_1462_Release;
   end record;

   type IClassFactoryVtbl is record
      QueryInterface : af_1569_QueryInterface;
      AddRef         : af_1574_AddRef;
      Release        : af_1577_Release;
      CreateInstance : af_1580_CreateInstance;
      LockServer     : af_1586_LockServer;
   end record;

   type IMarshalVtbl is record
      QueryInterface     : af_1718_QueryInterface;
      AddRef             : af_1723_AddRef;
      Release            : af_1726_Release;
      GetUnmarshalClass  : af_1729_GetUnmarshalClass;
      GetMarshalSizeMax  : af_1738_GetMarshalSizeMax;
      MarshalInterface   : af_1747_MarshalInterface;
      UnmarshalInterface : af_1756_UnmarshalInterface;
      ReleaseMarshalData : af_1762_ReleaseMarshalData;
      DisconnectObject   : af_1766_DisconnectObject;
   end record;

   type IMallocVtbl is record
      QueryInterface : af_1957_QueryInterface;
      AddRef         : af_1962_AddRef;
      Release        : af_1965_Release;
      Alloc          : af_1968_Alloc;
      Realloc        : af_1972_Realloc;
      Free           : ap_1977_Free;
      GetSize        : af_1981_GetSize;
      DidAlloc       : af_1985_DidAlloc;
      HeapMinimize   : ap_1989_HeapMinimize;
   end record;

   type IStdMarshalInfoVtbl is record
      QueryInterface     : af_2149_QueryInterface;
      AddRef             : af_2154_AddRef;
      Release            : af_2157_Release;
      GetClassForHandler : af_2160_GetClassForHandler;
   end record;

   type IExternalConnectionVtbl is record
      QueryInterface    : af_2262_QueryInterface;
      AddRef            : af_2267_AddRef;
      Release           : af_2270_Release;
      AddConnection     : af_2273_AddConnection;
      ReleaseConnection : af_2278_ReleaseConnection;
   end record;

   type IWeakRefVtbl is record
      QueryInterface   : af_2386_QueryInterface;
      AddRef           : af_2391_AddRef;
      Release          : af_2394_Release;
      ChangeWeakCount  : af_2397_ChangeWeakCount;
      ReleaseKeepAlive : af_2401_ReleaseKeepAlive;
   end record;

   type IEnumUnknownVtbl is record
      QueryInterface : af_2512_QueryInterface;
      AddRef         : af_2517_AddRef;
      Release        : af_2520_Release;
      Next           : af_2523_Next;
      Skip           : af_2529_Skip;
      Reset          : af_2533_Reset;
      Clone          : af_2536_Clone;
   end record;

   type BIND_OPTS is record
      cbStruct            : DWORD;
      grfFlags            : DWORD;
      grfMode             : DWORD;
      dwTickCountDeadline : DWORD;
   end record;

   type IBindCtxVtbl is record
      QueryInterface        : af_2716_QueryInterface;
      AddRef                : af_2721_AddRef;
      Release               : af_2724_Release;
      RegisterObjectBound   : af_2727_RegisterObjectBound;
      RevokeObjectBound     : af_2731_RevokeObjectBound;
      ReleaseBoundObjects   : af_2735_ReleaseBoundObjects;
      SetBindOptions        : af_2738_SetBindOptions;
      GetBindOptions        : af_2742_GetBindOptions;
      GetRunningObjectTable : af_2746_GetRunningObjectTable;
      RegisterObjectParam   : af_2750_RegisterObjectParam;
      GetObjectParam        : af_2755_GetObjectParam;
      EnumObjectParam       : af_2760_EnumObjectParam;
      RevokeObjectParam     : af_2764_RevokeObjectParam;
   end record;

   type IParseDisplayNameVtbl is record
      QueryInterface   : af_2987_QueryInterface;
      AddRef           : af_2992_AddRef;
      Release          : af_2995_Release;
      ParseDisplayName : af_2998_ParseDisplayName;
   end record;

   type IEnumMonikerVtbl is record
      QueryInterface : af_3098_QueryInterface;
      AddRef         : af_3103_AddRef;
      Release        : af_3106_Release;
      Next           : af_3109_Next;
      Skip           : af_3115_Skip;
      Reset          : af_3119_Reset;
      Clone          : af_3122_Clone;
   end record;

   type IRunnableObjectVtbl is record
      QueryInterface     : af_3264_QueryInterface;
      AddRef             : af_3269_AddRef;
      Release            : af_3272_Release;
      GetRunningClass    : af_3275_GetRunningClass;
      Run                : af_3279_Run;
      IsRunning          : af_3283_IsRunning;
      LockRunning        : af_3286_LockRunning;
      SetContainedObject : af_3291_SetContainedObject;
   end record;

   type IRunningObjectTableVtbl is record
      QueryInterface      : af_3459_QueryInterface;
      AddRef              : af_3464_AddRef;
      Release             : af_3467_Release;
      Register            : af_3470_Register;
      Revoke              : af_3477_Revoke;
      IsRunning           : af_3481_IsRunning;
      GetObjectA          : af_3485_GetObjectA;
      NoteChangeTime      : af_3490_NoteChangeTime;
      GetTimeOfLastChange : af_3495_GetTimeOfLastChange;
      EnumRunning         : af_3500_EnumRunning;
   end record;

   type IPersistVtbl is record
      QueryInterface : af_3680_QueryInterface;
      AddRef         : af_3685_AddRef;
      Release        : af_3688_Release;
      GetClassID     : af_3691_GetClassID;
   end record;

   type IEnumStringVtbl is record
      QueryInterface : af_4486_QueryInterface;
      AddRef         : af_4491_AddRef;
      Release        : af_4494_Release;
      Next           : af_4497_Next;
      Skip           : af_4503_Skip;
      Reset          : af_4507_Reset;
      Clone          : af_4510_Clone;
   end record;

   type STATSTG is record
      pwcsName          : LPOLESTR;
      c_type            : DWORD;
      cbSize            : Win32.Winnt.ULARGE_INTEGER;
      mtime             : Win32.Winbase.FILETIME;
      ctime             : Win32.Winbase.FILETIME;
      atime             : Win32.Winbase.FILETIME;
      grfMode           : DWORD;
      grfLocksSupported : DWORD;
      clsid             : Objbase.CLSID;
      grfStateBits      : DWORD;
      reserved          : DWORD;
   end record;

   type IStreamVtbl is record
      QueryInterface : af_4724_QueryInterface;
      AddRef         : af_4729_AddRef;
      Release        : af_4732_Release;
      Read           : af_4735_Read;
      Write          : af_4741_Write;
      Seek           : af_4747_Seek;
      SetSize        : af_4753_SetSize;
      CopyTo         : af_4757_CopyTo;
      Commit         : af_4764_Commit;
      Revert         : af_4768_Revert;
      LockRegion     : af_4771_LockRegion;
      UnlockRegion   : af_4777_UnlockRegion;
      Stat           : af_4783_Stat;
      Clone          : af_4788_Clone;
   end record;

   type IEnumSTATSTGVtbl is record
      QueryInterface : af_5045_QueryInterface;
      AddRef         : af_5050_AddRef;
      Release        : af_5053_Release;
      Next           : af_5056_Next;
      Skip           : af_5062_Skip;
      Reset          : af_5066_Reset;
      Clone          : af_5069_Clone;
   end record;

   type OLECHAR_Array is array (Natural range <>) of OLECHAR;

   type RemSNB is record
      ulCntStr  : Win32.UINT;
      ulCntChar : Win32.UINT;
      rgString  : OLECHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type IStorageVtbl is record
      QueryInterface  : af_5285_QueryInterface;
      AddRef          : af_5290_AddRef;
      Release         : af_5293_Release;
      CreateStream    : af_5296_CreateStream;
      OpenStream      : af_5304_OpenStream;
      CreateStorage   : af_5312_CreateStorage;
      OpenStorage     : af_5320_OpenStorage;
      CopyTo          : af_5329_CopyTo;
      MoveElementTo   : af_5336_MoveElementTo;
      Commit          : af_5343_Commit;
      Revert          : af_5347_Revert;
      EnumElements    : af_5350_EnumElements;
      DestroyElement  : af_5357_DestroyElement;
      RenameElement   : af_5361_RenameElement;
      SetElementTimes : af_5366_SetElementTimes;
      SetClass        : af_5373_SetClass;
      SetStateBits    : af_5377_SetStateBits;
      Stat            : af_5382_Stat;
   end record;

   type IPersistFileVtbl is record
      QueryInterface : af_5723_QueryInterface;
      AddRef         : af_5728_AddRef;
      Release        : af_5731_Release;
      GetClassID     : af_5734_GetClassID;
      IsDirty        : af_5738_IsDirty;
      Load           : af_5741_Load;
      Save           : af_5746_Save;
      SaveCompleted  : af_5751_SaveCompleted;
      GetCurFile     : af_5755_GetCurFile;
   end record;

   type IPersistStorageVtbl is record
      QueryInterface  : af_5918_QueryInterface;
      AddRef          : af_5923_AddRef;
      Release         : af_5926_Release;
      GetClassID      : af_5929_GetClassID;
      IsDirty         : af_5933_IsDirty;
      InitNew         : af_5936_InitNew;
      Load            : af_5940_Load;
      Save            : af_5944_Save;
      SaveCompleted   : af_5949_SaveCompleted;
      HandsOffStorage : af_5953_HandsOffStorage;
   end record;

   type ILockBytesVtbl is record
      QueryInterface : af_6142_QueryInterface;
      AddRef         : af_6147_AddRef;
      Release        : af_6150_Release;
      ReadAt         : af_6153_ReadAt;
      WriteAt        : af_6160_WriteAt;
      Flush          : af_6167_Flush;
      SetSize        : af_6170_SetSize;
      LockRegion     : af_6174_LockRegion;
      UnlockRegion   : af_6180_UnlockRegion;
      Stat           : af_6186_Stat;
   end record;

   type DVTARGETDEVICE is record
      tdSize             : DWORD;
      tdDriverNameOffset : WORD;
      tdDeviceNameOffset : WORD;
      tdPortNameOffset   : WORD;
      tdExtDevmodeOffset : WORD;
      tdData             : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type FORMATETC is record
      cfFormat : CLIPFORMAT;
      ptd      : a_DVTARGETDEVICE_t;
      dwAspect : DWORD;
      lindex   : LONG;
      tymed    : DWORD;
   end record;

   type IEnumFORMATETCVtbl is record
      QueryInterface : af_6411_QueryInterface;
      AddRef         : af_6416_AddRef;
      Release        : af_6419_Release;
      Next           : af_6422_Next;
      Skip           : af_6428_Skip;
      Reset          : af_6432_Reset;
      Clone          : af_6435_Clone;
   end record;

   type STATDATA is record
      formatetc    : Objbase.FORMATETC;
      advf         : DWORD;
      pAdvSink     : LPADVISESINK;
      dwConnection : DWORD;
   end record;

   type IEnumSTATDATAVtbl is record
      QueryInterface : af_6599_QueryInterface;
      AddRef         : af_6604_AddRef;
      Release        : af_6607_Release;
      Next           : af_6610_Next;
      Skip           : af_6616_Skip;
      Reset          : af_6620_Reset;
      Clone          : af_6623_Clone;
   end record;

   type IRootStorageVtbl is record
      QueryInterface : af_6753_QueryInterface;
      AddRef         : af_6758_AddRef;
      Release        : af_6761_Release;
      SwitchToFile   : af_6764_SwitchToFile;
   end record;

   type RemSTGMEDIUM is record
      tymed          : DWORD;
      dwHandleType   : DWORD;
      pData          : Win32.UINT;
      pUnkForRelease : Win32.UINT;
      cbData         : Win32.UINT;
      data           : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type union_anonymous7_t_kind is (
      hBitmap_kind,
      hMetaFilePict_kind,
      hEnhMetaFile_kind,
      hGlobal_kind,
      lpszFileName_kind,
      pstm_kind,
      pstg_kind);

   type union_anonymous7_t (Which : union_anonymous7_t_kind := hBitmap_kind) is
      record
         case Which is
            when hBitmap_kind =>
               hBitmap : Win32.Windef.HBITMAP;
            when hMetaFilePict_kind =>
               hMetaFilePict : Objbase.HMETAFILEPICT;
            when hEnhMetaFile_kind =>
               hEnhMetaFile : Win32.Windef.HENHMETAFILE;
            when hGlobal_kind =>
               hGlobal : Win32.Windef.HGLOBAL;
            when lpszFileName_kind =>
               lpszFileName : LPOLESTR;
            when pstm_kind =>
               pstm : LPSTREAM;
            when pstg_kind =>
               pstg : LPSTORAGE;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous7_t);

   pragma Unchecked_Union (union_anonymous7_t);

   type STGMEDIUM is record
      tymed          : DWORD;
      u              : union_anonymous7_t;
      pUnkForRelease : LPUNKNOWN;
   end record;

   type IAdviseSinkVtbl is record
      QueryInterface : af_6923_QueryInterface;
      AddRef         : af_6928_AddRef;
      Release        : af_6931_Release;
      OnDataChange   : ap_6934_OnDataChange;
      OnViewChange   : ap_6939_OnViewChange;
      OnRename       : ap_6944_OnRename;
      OnSave         : ap_6948_OnSave;
      OnClose        : ap_6951_OnClose;
   end record;

   type IAdviseSink2Vtbl is record
      QueryInterface  : af_7094_QueryInterface;
      AddRef          : af_7099_AddRef;
      Release         : af_7102_Release;
      OnDataChange    : ap_7105_OnDataChange;
      OnViewChange    : ap_7110_OnViewChange;
      OnRename        : ap_7115_OnRename;
      OnSave          : ap_7119_OnSave;
      OnClose         : ap_7122_OnClose;
      OnLinkSrcChange : ap_7125_OnLinkSrcChange;
   end record;

   type IDataObjectVtbl is record
      QueryInterface        : af_7265_QueryInterface;
      AddRef                : af_7270_AddRef;
      Release               : af_7273_Release;
      GetData               : af_7276_GetData;
      GetDataHere           : af_7281_GetDataHere;
      QueryGetData          : af_7286_QueryGetData;
      GetCanonicalFormatEtc : af_7290_GetCanonicalFormatEtc;
      SetData               : af_7295_SetData;
      EnumFormatEtc         : af_7301_EnumFormatEtc;
      DAdvise               : af_7306_DAdvise;
      DUnadvise             : af_7313_DUnadvise;
      EnumDAdvise           : af_7317_EnumDAdvise;
   end record;

   type IDataAdviseHolderVtbl is record
      QueryInterface   : af_7545_QueryInterface;
      AddRef           : af_7550_AddRef;
      Release          : af_7553_Release;
      Advise           : af_7556_Advise;
      Unadvise         : af_7564_Unadvise;
      EnumAdvise       : af_7568_EnumAdvise;
      SendOnDataChange : af_7572_SendOnDataChange;
   end record;

   type INTERFACEINFO is record
      pUnk    : LPUNKNOWN;
      iid     : Objbase.IID;
      wMethod : WORD;
   end record;

   type IMessageFilterVtbl is record
      QueryInterface     : af_7766_QueryInterface;
      AddRef             : af_7771_AddRef;
      Release            : af_7774_Release;
      HandleInComingCall : af_7777_HandleInComingCall;
      RetryRejectedCall  : af_7784_RetryRejectedCall;
      MessagePending     : af_7790_MessagePending;
   end record;

   type PVOID_Array is array (Natural range <>) of Win32.PVOID;
   type RPCOLEMESSAGE is record
      reserved1          : Win32.PVOID;
      dataRepresentation : RPCOLEDATAREP;
      Buffer             : Win32.PVOID;
      cbBuffer           : Win32.ULONG;
      iMethod            : Win32.ULONG;
      reserved2          : PVOID_Array (0 .. 4);
      rpcFlags           : Win32.ULONG;
   end record;

   type IRpcChannelBufferVtbl is record
      QueryInterface : af_7942_QueryInterface;
      AddRef         : af_7947_AddRef;
      Release        : af_7950_Release;
      GetBuffer      : af_7953_GetBuffer;
      SendReceive    : af_7958_SendReceive;
      FreeBuffer     : af_7963_FreeBuffer;
      GetDestCtx     : af_7967_GetDestCtx;
      IsConnected    : af_7972_IsConnected;
   end record;

   type IRpcChannelBuffer is record
      lpVtbl : a_IRpcChannelBufferVtbl;
   end record;

   type IRpcProxyBufferVtbl is record
      QueryInterface : af_8116_QueryInterface;
      AddRef         : af_8121_AddRef;
      Release        : af_8124_Release;
      Connect        : af_8127_Connect;
      Disconnect     : ap_8131_Disconnect;
   end record;

   type IRpcStubBufferVtbl is record
      QueryInterface : af_8242_QueryInterface;
      AddRef         : af_8247_AddRef;
      Release        : af_8250_Release;
      Connect        : af_8253_Connect;
      Disconnect     : ap_8257_Disconnect;
      Invoke         : af_8260_Invoke;
      IsIIDSupported : af_8265_IsIIDSupported;
      CountRefs      : af_8269_CountRefs;
   end record;

   type IRpcStubBuffer is record
      lpVtbl : a_IRpcStubBufferVtbl;
   end record;

   type IPSFactoryBufferVtbl is record
      QueryInterface : af_8454_QueryInterface;
      AddRef         : af_8459_AddRef;
      Release        : af_8462_Release;
      CreateProxy    : af_8465_CreateProxy;
      CreateStub     : af_8472_CreateStub;
   end record;

   type LPFNGETCLASSOBJECT is access function
     (rclsid : REFCLSID;
      riid   : REFIID;
      ppv    : access Win32.PVOID)
      return HRESULT;
   pragma Convention (Stdcall, LPFNGETCLASSOBJECT);

   type LPFNCANUNLOADNOW is access function return HRESULT;
   pragma Convention (Stdcall, LPFNCANUNLOADNOW);

   IWinTypes_v0_1_c_ifspec      : Win32.Rpcdce.RPC_IF_HANDLE;
   IWinTypes_v0_1_s_ifspec      : Win32.Rpcdce.RPC_IF_HANDLE;
   MIDL_intf_0000_v0_0_c_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;
   MIDL_intf_0000_v0_0_s_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;

   GUID_NULL  : IID;
   IID_NULL   : constant IID := GUID_NULL;
   CLSID_NULL : constant IID := GUID_NULL;

   IID_IUnknown            : IID;
   IID_IClassFactory       : IID;
   IID_IMarshal            : IID;
   IID_IMalloc             : IID;
   IID_IStdMarshalInfo     : IID;
   IID_IExternalConnection : IID;
   IID_IWeakRef            : IID;
   IID_IEnumUnknown        : IID;
   IID_IBindCtx            : IID;
   IID_IParseDisplayName   : IID;
   IID_IEnumMoniker        : IID;
   IID_IRunnableObject     : IID;
   IID_IRunningObjectTable : IID;
   IID_IPersist            : IID;
   IID_IPersistStream      : IID;
   IID_IMoniker            : IID;
   IID_IEnumString         : IID;
   IID_IStream             : IID;
   IID_IEnumSTATSTG        : IID;
   IID_IStorage            : IID;
   IID_IPersistFile        : IID;
   IID_IPersistStorage     : IID;
   IID_ILockBytes          : IID;
   IID_IEnumFORMATETC      : IID;
   IID_IEnumSTATDATA       : IID;
   IID_IRootStorage        : IID;
   IID_IAdviseSink         : IID;
   IID_IAdviseSink2        : IID;
   IID_IDataObject         : IID;
   IID_IDataAdviseHolder   : IID;
   IID_IMessageFilter      : IID;
   IID_IRpcChannelBuffer   : IID;
   IID_IRpcProxyBuffer     : IID;
   IID_IRpcStubBuffer      : IID;
   IID_IPSFactoryBuffer    : IID;

   function CLSCTX_ALL return Win32.UINT;
   function CLSCTX_INPROC return Win32.UINT;
   function CLSCTX_SERVER return Win32.UINT;

   procedure LISet32
     (li : in out Win32.Winnt.anonymous1_t;
      v  : in Win32.DWORD);

   procedure ULISet32
     (li : in out Win32.Winnt.anonymous1_t;
      v  : in Win32.DWORD);

   procedure HGLOBAL_to_xmit
     (phGlobal : access Win32.Windef.HGLOBAL;
      p2       : access a_RemHGLOBAL_t);

   procedure HGLOBAL_from_xmit
     (p1       : a_RemHGLOBAL_t;
      phGlobal : access Win32.Windef.HGLOBAL);

   procedure HGLOBAL_free_inst (phGlobal : access Win32.Windef.HGLOBAL);

   procedure HGLOBAL_free_xmit (p1 : a_RemHGLOBAL_t);

   procedure HBITMAP_to_xmit
     (phBitmap : access Win32.Windef.HBITMAP;
      p2       : access a_RemHBITMAP_t);

   procedure HBITMAP_from_xmit
     (p1       : a_RemHBITMAP_t;
      phBitmap : access Win32.Windef.HBITMAP);

   procedure HBITMAP_free_inst (phBitmap : access Win32.Windef.HBITMAP);

   procedure HBITMAP_free_xmit (p1 : a_RemHBITMAP_t);

   procedure HPALETTE_to_xmit
     (phPalette : access Win32.Windef.HPALETTE;
      p2        : access a_RemHPALETTE_t);

   procedure HPALETTE_from_xmit
     (p1        : a_RemHPALETTE_t;
      phPalette : access Win32.Windef.HPALETTE);

   procedure HPALETTE_free_inst (phPalette : access Win32.Windef.HPALETTE);

   procedure HPALETTE_free_xmit (p1 : a_RemHPALETTE_t);

   procedure HBRUSH_to_xmit
     (phBrush : access Win32.Windef.HBRUSH;
      p2      : access a_RemHBRUSH_t);

   procedure HBRUSH_from_xmit
     (p1      : a_RemHBRUSH_t;
      phBrush : access Win32.Windef.HBRUSH);

   procedure HBRUSH_free_inst (phBrush : access Win32.Windef.HBRUSH);

   procedure HBRUSH_free_xmit (p1 : a_RemHBRUSH_t);

   procedure HMETAFILEPICT_to_xmit
     (phMetaFilePict : access HMETAFILEPICT;
      p2             : access a_RemHMETAFILEPICT_t);

   procedure HMETAFILEPICT_from_xmit
     (p1             : a_RemHMETAFILEPICT_t;
      phMetaFilePict : access HMETAFILEPICT);

   procedure HMETAFILEPICT_free_inst
     (phMetaFilePict : access HMETAFILEPICT);

   procedure HMETAFILEPICT_free_xmit (p1 : a_RemHMETAFILEPICT_t);

   procedure HENHMETAFILE_to_xmit
     (phEnhMetaFile : access Win32.Windef.HENHMETAFILE;
      p2            : access a_RemHENHMETAFILE_t);

   procedure HENHMETAFILE_from_xmit
     (p1            : a_RemHENHMETAFILE_t;
      phEnhMetaFile : access Win32.Windef.HENHMETAFILE);

   procedure HENHMETAFILE_free_inst
     (phEnhMetaFile : access Win32.Windef.HENHMETAFILE);

   procedure HENHMETAFILE_free_xmit (p1 : a_RemHENHMETAFILE_t);

   function IUnknown_QueryInterface_Proxy
     (This      : access IUnknown;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;

   procedure IUnknown_QueryInterface_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IUnknown_AddRef_Proxy (This : access IUnknown) return ULONG;

   procedure IUnknown_AddRef_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IUnknown_Release_Proxy (This : access IUnknown) return ULONG;

   procedure IUnknown_Release_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IClassFactory_RemoteCreateInstance_Proxy
     (This      : access IClassFactory;
      riid      : REFIID;
      ppvObject : access LPUNKNOWN)
      return HRESULT;

   procedure IClassFactory_RemoteCreateInstance_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IClassFactory_LockServer_Proxy
     (This  : access IClassFactory;
      fLock : BOOL)
      return HRESULT;

   procedure IClassFactory_LockServer_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMarshal_GetUnmarshalClass_Proxy
     (This          : access IMarshal;
      riid          : REFIID;
      pv            : Win32.PVOID;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags     : DWORD;
      pCid          : access CLSID)
      return HRESULT;

   procedure IMarshal_GetUnmarshalClass_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMarshal_GetMarshalSizeMax_Proxy
     (This          : access IMarshal;
      riid          : REFIID;
      pv            : Win32.PVOID;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags     : DWORD;
      pSize         : Win32.PDWORD)
      return HRESULT;

   procedure IMarshal_GetMarshalSizeMax_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMarshal_MarshalInterface_Proxy
     (This          : access IMarshal;
      pStm          : access IStream;
      riid          : REFIID;
      pv            : Win32.PVOID;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags     : DWORD)
      return HRESULT;

   procedure IMarshal_MarshalInterface_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMarshal_UnmarshalInterface_Proxy
     (This : access IMarshal;
      pStm : access IStream;
      riid : REFIID;
      ppv  : access Win32.PVOID)
      return HRESULT;

   procedure IMarshal_UnmarshalInterface_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMarshal_ReleaseMarshalData_Proxy
     (This : access IMarshal;
      pStm : access IStream)
      return HRESULT;

   procedure IMarshal_ReleaseMarshalData_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMarshal_DisconnectObject_Proxy
     (This       : access IMarshal;
      dwReserved : DWORD)
      return HRESULT;

   procedure IMarshal_DisconnectObject_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMalloc_Alloc_Proxy
     (This : access IMalloc;
      cb   : Win32.ULONG)
      return Win32.PVOID;

   procedure IMalloc_Alloc_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMalloc_Realloc_Proxy
     (This : access IMalloc;
      pv   : Win32.PVOID;
      cb   : Win32.ULONG)
      return Win32.PVOID;

   procedure IMalloc_Realloc_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IMalloc_Free_Proxy (This : access IMalloc; pv : Win32.PVOID);

   procedure IMalloc_Free_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMalloc_GetSize_Proxy
     (This : access IMalloc;
      pv   : Win32.PVOID)
      return ULONG;

   procedure IMalloc_GetSize_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMalloc_DidAlloc_Proxy
     (This : access IMalloc;
      pv   : Win32.PVOID)
      return Win32.INT;

   procedure IMalloc_DidAlloc_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IMalloc_HeapMinimize_Proxy (This : access IMalloc);

   procedure IMalloc_HeapMinimize_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStdMarshalInfo_GetClassForHandler_Proxy
     (This          : access IStdMarshalInfo;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      pClsid        : access CLSID)
      return HRESULT;

   procedure IStdMarshalInfo_GetClassForHandler_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IExternalConnection_AddConnection_Proxy
     (This     : access IExternalConnection;
      extconn  : DWORD;
      reserved : DWORD)
      return DWORD;

   procedure IExternalConnection_AddConnection_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IExternalConnection_ReleaseConnection_Proxy
     (This               : access IExternalConnection;
      extconn            : DWORD;
      reserved           : DWORD;
      fLastReleaseCloses : BOOL)
      return DWORD;

   procedure IExternalConnection_ReleaseConnection_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IWeakRef_ChangeWeakCount_Proxy
     (This    : access IWeakRef;
      c_delta : LONG)
      return ULONG;

   procedure IWeakRef_ChangeWeakCount_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IWeakRef_ReleaseKeepAlive_Proxy
     (This         : access IWeakRef;
      pUnkReleased : access IUnknown;
      reserved     : DWORD)
      return ULONG;

   procedure IWeakRef_ReleaseKeepAlive_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumUnknown_RemoteNext_Proxy
     (This         : access IEnumUnknown;
      celt         : Win32.ULONG;
      rgelt        : access LPUNKNOWN;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   procedure IEnumUnknown_RemoteNext_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumUnknown_Skip_Proxy
     (This : access IEnumUnknown;
      celt : Win32.ULONG)
      return HRESULT;

   procedure IEnumUnknown_Skip_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumUnknown_Reset_Proxy
     (This : access IEnumUnknown)
      return HRESULT;

   procedure IEnumUnknown_Reset_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumUnknown_Clone_Proxy
     (This   : access IEnumUnknown;
      ppenum : access LPENUMUNKNOWN)
      return HRESULT;

   procedure IEnumUnknown_Clone_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_RegisterObjectBound_Proxy
     (This : access IBindCtx;
      punk : access IUnknown)
      return HRESULT;

   procedure IBindCtx_RegisterObjectBound_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_RevokeObjectBound_Proxy
     (This : access IBindCtx;
      punk : access IUnknown)
      return HRESULT;

   procedure IBindCtx_RevokeObjectBound_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_ReleaseBoundObjects_Proxy
     (This : access IBindCtx)
      return HRESULT;

   procedure IBindCtx_ReleaseBoundObjects_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_SetBindOptions_Proxy
     (This      : access IBindCtx;
      pbindopts : LPBIND_OPTS)
      return HRESULT;

   procedure IBindCtx_SetBindOptions_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_GetBindOptions_Proxy
     (This      : access IBindCtx;
      pbindopts : LPBIND_OPTS)
      return HRESULT;

   procedure IBindCtx_GetBindOptions_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_GetRunningObjectTable_Proxy
     (This  : access IBindCtx;
      pprot : access LPRUNNINGOBJECTTABLE)
      return HRESULT;

   procedure IBindCtx_GetRunningObjectTable_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_RegisterObjectParam_Proxy
     (This   : access IBindCtx;
      pszKey : LPOLESTR;
      punk   : access IUnknown)
      return HRESULT;

   procedure IBindCtx_RegisterObjectParam_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_GetObjectParam_Proxy
     (This   : access IBindCtx;
      pszKey : LPOLESTR;
      ppunk  : access LPUNKNOWN)
      return HRESULT;

   procedure IBindCtx_GetObjectParam_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_EnumObjectParam_Proxy
     (This   : access IBindCtx;
      ppenum : access LPENUMSTRING)
      return HRESULT;

   procedure IBindCtx_EnumObjectParam_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IBindCtx_RevokeObjectParam_Proxy
     (This   : access IBindCtx;
      pszKey : LPOLESTR)
      return HRESULT;

   procedure IBindCtx_RevokeObjectParam_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IParseDisplayName_ParseDisplayName_Proxy
     (This           : access IParseDisplayName;
      pbc            : access IBindCtx;
      pszDisplayName : LPOLESTR;
      pchEaten       : Win32.PDWORD;
      ppmkOut        : access LPMONIKER)
      return HRESULT;

   procedure IParseDisplayName_ParseDisplayName_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumMoniker_RemoteNext_Proxy
     (This         : access IEnumMoniker;
      celt         : Win32.ULONG;
      rgelt        : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   procedure IEnumMoniker_RemoteNext_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumMoniker_Skip_Proxy
     (This : access IEnumMoniker;
      celt : Win32.ULONG)
      return HRESULT;

   procedure IEnumMoniker_Skip_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumMoniker_Reset_Proxy
     (This : access IEnumMoniker)
      return HRESULT;

   procedure IEnumMoniker_Reset_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumMoniker_Clone_Proxy
     (This   : access IEnumMoniker;
      ppenum : access LPENUMMONIKER)
      return HRESULT;

   procedure IEnumMoniker_Clone_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunnableObject_GetRunningClass_Proxy
     (This    : access IRunnableObject;
      lpClsid : access CLSID)
      return HRESULT;

   procedure IRunnableObject_GetRunningClass_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunnableObject_Run_Proxy
     (This : access IRunnableObject;
      pbc  : LPBINDCTX)
      return HRESULT;

   procedure IRunnableObject_Run_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunnableObject_IsRunning_Proxy
     (This : access IRunnableObject)
      return BOOL;

   procedure IRunnableObject_IsRunning_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunnableObject_LockRunning_Proxy
     (This              : access IRunnableObject;
      fLock             : BOOL;
      fLastUnlockCloses : BOOL)
      return HRESULT;

   procedure IRunnableObject_LockRunning_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunnableObject_SetContainedObject_Proxy
     (This       : access IRunnableObject;
      fContained : BOOL)
      return HRESULT;

   procedure IRunnableObject_SetContainedObject_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunningObjectTable_Register_Proxy
     (This          : access IRunningObjectTable;
      grfFlags      : DWORD;
      punkObject    : access IUnknown;
      pmkObjectName : access IMoniker;
      pdwRegister   : Win32.PDWORD)
      return HRESULT;

   procedure IRunningObjectTable_Register_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunningObjectTable_Revoke_Proxy
     (This       : access IRunningObjectTable;
      dwRegister : DWORD)
      return HRESULT;

   procedure IRunningObjectTable_Revoke_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunningObjectTable_IsRunning_Proxy
     (This          : access IRunningObjectTable;
      pmkObjectName : access IMoniker)
      return HRESULT;

   procedure IRunningObjectTable_IsRunning_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunningObjectTable_GetObject_Proxy
     (This          : access IRunningObjectTable;
      pmkObjectName : access IMoniker;
      ppunkObject   : access LPUNKNOWN)
      return HRESULT;

   procedure IRunningObjectTable_GetObject_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunningObjectTable_NoteChangeTime_Proxy
     (This       : access IRunningObjectTable;
      dwRegister : DWORD;
      pfiletime  : access Win32.Winbase.FILETIME)
      return HRESULT;

   procedure IRunningObjectTable_NoteChangeTime_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunningObjectTable_GetTimeOfLastChange_Proxy
     (This          : access IRunningObjectTable;
      pmkObjectName : access IMoniker;
      pfiletime     : access Win32.Winbase.FILETIME)
      return HRESULT;

   procedure IRunningObjectTable_GetTimeOfLastChange_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRunningObjectTable_EnumRunning_Proxy
     (This          : access IRunningObjectTable;
      ppenumMoniker : access LPENUMMONIKER)
      return HRESULT;

   procedure IRunningObjectTable_EnumRunning_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersist_GetClassID_Proxy
     (This     : access IPersist;
      pClassID : access CLSID)
      return HRESULT;

   procedure IPersist_GetClassID_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   type IPersistStreamVtbl is record
      QueryInterface : af_3784_QueryInterface;
      AddRef         : af_3789_AddRef;
      Release        : af_3792_Release;
      GetClassID     : af_3795_GetClassID;
      IsDirty        : af_3799_IsDirty;
      Load           : af_3802_Load;
      Save           : af_3806_Save;
      GetSizeMax     : af_3811_GetSizeMax;
   end record;

   type IMonikerVtbl is record
      QueryInterface      : af_4030_QueryInterface;
      AddRef              : af_4035_AddRef;
      Release             : af_4038_Release;
      GetClassID          : af_4041_GetClassID;
      IsDirty             : af_4045_IsDirty;
      Load                : af_4048_Load;
      Save                : af_4052_Save;
      GetSizeMax          : af_4057_GetSizeMax;
      BindToObject        : af_4061_BindToObject;
      BindToStorage       : af_4068_BindToStorage;
      Reduce              : af_4075_Reduce;
      ComposeWith         : af_4082_ComposeWith;
      Enum                : af_4088_Enum;
      IsEqual             : af_4093_IsEqual;
      Hash                : af_4097_Hash;
      IsRunning           : af_4101_IsRunning;
      GetTimeOfLastChange : af_4107_GetTimeOfLastChange;
      Inverse             : af_4113_Inverse;
      CommonPrefixWith    : af_4117_CommonPrefixWith;
      RelativePathTo      : af_4122_RelativePathTo;
      GetDisplayName      : af_4127_GetDisplayName;
      ParseDisplayName    : af_4133_ParseDisplayName;
      IsSystemMoniker     : af_4141_IsSystemMoniker;
   end record;

   function IPersistStream_IsDirty_Proxy
     (This : access IPersistStream)
      return HRESULT;

   procedure IPersistStream_IsDirty_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStream_Load_Proxy
     (This : access IPersistStream;
      pStm : access IStream)
      return HRESULT;

   procedure IPersistStream_Load_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStream_Save_Proxy
     (This        : access IPersistStream;
      pStm        : access IStream;
      fClearDirty : BOOL)
      return HRESULT;

   procedure IPersistStream_Save_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStream_GetSizeMax_Proxy
     (This    : access IPersistStream;
      pcbSize : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   procedure IPersistStream_GetSizeMax_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_RemoteBindToObject_Proxy
     (This       : access IMoniker;
      pbc        : access IBindCtx;
      pmkToLeft  : access IMoniker;
      riidResult : access IID;
      ppvResult  : access LPUNKNOWN)
      return HRESULT;

   procedure IMoniker_RemoteBindToObject_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_RemoteBindToStorage_Proxy
     (This      : access IMoniker;
      pbc       : access IBindCtx;
      pmkToLeft : access IMoniker;
      riid      : REFIID;
      ppvObj    : access LPUNKNOWN)
      return HRESULT;

   procedure IMoniker_RemoteBindToStorage_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_Reduce_Proxy
     (This           : access IMoniker;
      pbc            : access IBindCtx;
      dwReduceHowFar : DWORD;
      ppmkToLeft     : access LPMONIKER;
      ppmkReduced    : access LPMONIKER)
      return HRESULT;

   procedure IMoniker_Reduce_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_ComposeWith_Proxy
     (This              : access IMoniker;
      pmkRight          : access IMoniker;
      fOnlyIfNotGeneric : BOOL;
      ppmkComposite     : access LPMONIKER)
      return HRESULT;

   procedure IMoniker_ComposeWith_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_Enum_Proxy
     (This          : access IMoniker;
      fForward      : BOOL;
      ppenumMoniker : access LPENUMMONIKER)
      return HRESULT;

   procedure IMoniker_Enum_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_IsEqual_Proxy
     (This            : access IMoniker;
      pmkOtherMoniker : access IMoniker)
      return HRESULT;

   procedure IMoniker_IsEqual_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_Hash_Proxy
     (This    : access IMoniker;
      pdwHash : Win32.PDWORD)
      return HRESULT;

   procedure IMoniker_Hash_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_IsRunning_Proxy
     (This            : access IMoniker;
      pbc             : access IBindCtx;
      pmkToLeft       : access IMoniker;
      pmkNewlyRunning : access IMoniker)
      return HRESULT;

   procedure IMoniker_IsRunning_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_GetTimeOfLastChange_Proxy
     (This      : access IMoniker;
      pbc       : access IBindCtx;
      pmkToLeft : access IMoniker;
      pFileTime : access Win32.Winbase.FILETIME)
      return HRESULT;

   procedure IMoniker_GetTimeOfLastChange_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_Inverse_Proxy
     (This : access IMoniker;
      ppmk : access LPMONIKER)
      return HRESULT;

   procedure IMoniker_Inverse_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_CommonPrefixWith_Proxy
     (This       : access IMoniker;
      pmkOther   : access IMoniker;
      ppmkPrefix : access LPMONIKER)
      return HRESULT;

   procedure IMoniker_CommonPrefixWith_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_RelativePathTo_Proxy
     (This        : access IMoniker;
      pmkOther    : access IMoniker;
      ppmkRelPath : access LPMONIKER)
      return HRESULT;

   procedure IMoniker_RelativePathTo_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_GetDisplayName_Proxy
     (This            : access IMoniker;
      pbc             : access IBindCtx;
      pmkToLeft       : access IMoniker;
      ppszDisplayName : access LPOLESTR)
      return HRESULT;

   procedure IMoniker_GetDisplayName_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_ParseDisplayName_Proxy
     (This           : access IMoniker;
      pbc            : access IBindCtx;
      pmkToLeft      : access IMoniker;
      pszDisplayName : LPOLESTR;
      pchEaten       : Win32.PDWORD;
      ppmkOut        : access LPMONIKER)
      return HRESULT;

   procedure IMoniker_ParseDisplayName_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMoniker_IsSystemMoniker_Proxy
     (This     : access IMoniker;
      pdwMksys : Win32.PDWORD)
      return HRESULT;

   procedure IMoniker_IsSystemMoniker_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumString_RemoteNext_Proxy
     (This         : access IEnumString;
      celt         : Win32.ULONG;
      rgelt        : access LPOLESTR;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   procedure IEnumString_RemoteNext_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumString_Skip_Proxy
     (This : access IEnumString;
      celt : Win32.ULONG)
      return HRESULT;

   procedure IEnumString_Skip_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumString_Reset_Proxy
     (This : access IEnumString)
      return HRESULT;

   procedure IEnumString_Reset_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumString_Clone_Proxy
     (This   : access IEnumString;
      ppenum : access LPENUMSTRING)
      return HRESULT;

   procedure IEnumString_Clone_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_RemoteRead_Proxy
     (This    : access IStream;
      pv      : Win32.PBYTE;
      cb      : Win32.ULONG;
      pcbRead : Win32.PDWORD)
      return HRESULT;

   procedure IStream_RemoteRead_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_RemoteWrite_Proxy
     (This       : access IStream;
      pv         : Win32.PCBYTE;
      cb         : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
      return HRESULT;

   procedure IStream_RemoteWrite_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_RemoteSeek_Proxy
     (This            : access IStream;
      dlibMove        : Win32.Winnt.LARGE_INTEGER;
      dwOrigin        : DWORD;
      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   procedure IStream_RemoteSeek_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_SetSize_Proxy
     (This       : access IStream;
      libNewSize : Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   procedure IStream_SetSize_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_RemoteCopyTo_Proxy
     (This       : access IStream;
      pstm       : access IStream;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      pcbRead    : access Win32.Winnt.ULARGE_INTEGER;
      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   procedure IStream_RemoteCopyTo_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_Commit_Proxy
     (This           : access IStream;
      grfCommitFlags : DWORD)
      return HRESULT;

   procedure IStream_Commit_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_Revert_Proxy (This : access IStream) return HRESULT;

   procedure IStream_Revert_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_LockRegion_Proxy
     (This       : access IStream;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
      return HRESULT;

   procedure IStream_LockRegion_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_UnlockRegion_Proxy
     (This       : access IStream;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
      return HRESULT;

   procedure IStream_UnlockRegion_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_Stat_Proxy
     (This        : access IStream;
      pstatstg    : access STATSTG;
      grfStatFlag : DWORD)
      return HRESULT;

   procedure IStream_Stat_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStream_Clone_Proxy
     (This  : access IStream;
      ppstm : access LPSTREAM)
      return HRESULT;

   procedure IStream_Clone_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATSTG_RemoteNext_Proxy
     (This         : access IEnumSTATSTG;
      celt         : Win32.ULONG;
      rgelt        : access STATSTG;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   procedure IEnumSTATSTG_RemoteNext_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATSTG_Skip_Proxy
     (This : access IEnumSTATSTG;
      celt : Win32.ULONG)
      return HRESULT;

   procedure IEnumSTATSTG_Skip_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATSTG_Reset_Proxy
     (This : access IEnumSTATSTG)
      return HRESULT;

   procedure IEnumSTATSTG_Reset_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATSTG_Clone_Proxy
     (This   : access IEnumSTATSTG;
      ppenum : access LPENUMSTATSTG)
      return HRESULT;

   procedure IEnumSTATSTG_Clone_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_CreateStream_Proxy
     (This      : access IStorage;
      pwcsName  : PCWSTR;
      grfMode   : DWORD;
      reserved1 : DWORD;
      reserved2 : DWORD;
      ppstm     : access LPSTREAM)
      return HRESULT;

   procedure IStorage_CreateStream_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_RemoteOpenStream_Proxy
     (This        : access IStorage;
      pwcsName    : PCWSTR;
      cbReserved1 : Win32.UINT;
      reserved1   : Win32.PBYTE;
      grfMode     : DWORD;
      reserved2   : DWORD;
      ppstm       : access LPSTREAM)
      return HRESULT;

   procedure IStorage_RemoteOpenStream_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_CreateStorage_Proxy
     (This      : access IStorage;
      pwcsName  : PCWSTR;
      grfMode   : DWORD;
      dwStgFmt  : DWORD;
      reserved2 : DWORD;
      ppstg     : access LPSTORAGE)
      return HRESULT;

   procedure IStorage_CreateStorage_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_OpenStorage_Proxy
     (This         : access IStorage;
      pwcsName     : PCWSTR;
      pstgPriority : access IStorage;
      grfMode      : DWORD;
      snbExclude   : SNB;
      reserved     : DWORD;
      ppstg        : access LPSTORAGE)
      return HRESULT;

   procedure IStorage_OpenStorage_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_CopyTo_Proxy
     (This         : access IStorage;
      ciidExclude  : DWORD;
      rgiidExclude : access IID;
      snbExclude   : SNB;
      pstgDest     : access IStorage)
      return HRESULT;

   procedure IStorage_CopyTo_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_MoveElementTo_Proxy
     (This        : access IStorage;
      pwcsName    : PCWSTR;
      pstgDest    : access IStorage;
      pwcsNewName : PCWSTR;
      grfFlags    : DWORD)
      return HRESULT;

   procedure IStorage_MoveElementTo_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_Commit_Proxy
     (This           : access IStorage;
      grfCommitFlags : DWORD)
      return HRESULT;

   procedure IStorage_Commit_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_Revert_Proxy (This : access IStorage) return HRESULT;

   procedure IStorage_Revert_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_RemoteEnumElements_Proxy
     (This        : access IStorage;
      reserved1   : DWORD;
      cbReserved2 : Win32.UINT;
      reserved2   : Win32.PBYTE;
      reserved3   : DWORD;
      ppenum      : access LPENUMSTATSTG)
      return HRESULT;

   procedure IStorage_RemoteEnumElements_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_DestroyElement_Proxy
     (This     : access IStorage;
      pwcsName : PCWSTR)
      return HRESULT;

   procedure IStorage_DestroyElement_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_RenameElement_Proxy
     (This        : access IStorage;
      pwcsOldName : PCWSTR;
      pwcsNewName : PCWSTR)
      return HRESULT;

   procedure IStorage_RenameElement_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_SetElementTimes_Proxy
     (This     : access IStorage;
      pwcsName : PCWSTR;
      pctime   : Win32.Winbase.ac_FILETIME_t;
      patime   : Win32.Winbase.ac_FILETIME_t;
      pmtime   : Win32.Winbase.ac_FILETIME_t)
      return HRESULT;

   procedure IStorage_SetElementTimes_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_SetClass_Proxy
     (This  : access IStorage;
      clsid : REFCLSID)
      return HRESULT;

   procedure IStorage_SetClass_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_SetStateBits_Proxy
     (This         : access IStorage;
      grfStateBits : DWORD;
      grfMask      : DWORD)
      return HRESULT;

   procedure IStorage_SetStateBits_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IStorage_Stat_Proxy
     (This        : access IStorage;
      pstatstg    : access STATSTG;
      grfStatFlag : DWORD)
      return HRESULT;

   procedure IStorage_Stat_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistFile_IsDirty_Proxy
     (This : access IPersistFile)
      return HRESULT;

   procedure IPersistFile_IsDirty_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistFile_Load_Proxy
     (This        : access IPersistFile;
      pszFileName : LPCOLESTR;
      dwMode      : DWORD)
      return HRESULT;

   procedure IPersistFile_Load_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistFile_Save_Proxy
     (This        : access IPersistFile;
      pszFileName : LPCOLESTR;
      fRemember   : BOOL)
      return HRESULT;

   procedure IPersistFile_Save_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistFile_SaveCompleted_Proxy
     (This        : access IPersistFile;
      pszFileName : LPCOLESTR)
      return HRESULT;

   procedure IPersistFile_SaveCompleted_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistFile_GetCurFile_Proxy
     (This         : access IPersistFile;
      ppszFileName : access LPOLESTR)
      return HRESULT;

   procedure IPersistFile_GetCurFile_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStorage_IsDirty_Proxy
     (This : access IPersistStorage)
      return HRESULT;

   procedure IPersistStorage_IsDirty_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStorage_InitNew_Proxy
     (This : access IPersistStorage;
      pStg : access IStorage)
      return HRESULT;

   procedure IPersistStorage_InitNew_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStorage_Load_Proxy
     (This : access IPersistStorage;
      pStg : access IStorage)
      return HRESULT;

   procedure IPersistStorage_Load_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStorage_Save_Proxy
     (This        : access IPersistStorage;
      pStgSave    : access IStorage;
      fSameAsLoad : BOOL)
      return HRESULT;

   procedure IPersistStorage_Save_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStorage_SaveCompleted_Proxy
     (This    : access IPersistStorage;
      pStgNew : access IStorage)
      return HRESULT;

   procedure IPersistStorage_SaveCompleted_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPersistStorage_HandsOffStorage_Proxy
     (This : access IPersistStorage)
      return HRESULT;

   procedure IPersistStorage_HandsOffStorage_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function ILockBytes_RemoteReadAt_Proxy
     (This     : access ILockBytes;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv       : Win32.PBYTE;
      cb       : Win32.ULONG;
      pcbRead  : Win32.PDWORD)
      return HRESULT;

   procedure ILockBytes_RemoteReadAt_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function ILockBytes_RemoteWriteAt_Proxy
     (This       : access ILockBytes;
      ulOffset   : Win32.Winnt.ULARGE_INTEGER;
      pv         : Win32.PCBYTE;
      cb         : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
      return HRESULT;

   procedure ILockBytes_RemoteWriteAt_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function ILockBytes_Flush_Proxy
     (This : access ILockBytes)
      return HRESULT;

   procedure ILockBytes_Flush_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function ILockBytes_SetSize_Proxy
     (This : access ILockBytes;
      cb   : Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   procedure ILockBytes_SetSize_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function ILockBytes_LockRegion_Proxy
     (This       : access ILockBytes;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
      return HRESULT;

   procedure ILockBytes_LockRegion_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function ILockBytes_UnlockRegion_Proxy
     (This       : access ILockBytes;
      libOffset  : Win32.Winnt.ULARGE_INTEGER;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
      return HRESULT;

   procedure ILockBytes_UnlockRegion_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function ILockBytes_Stat_Proxy
     (This        : access ILockBytes;
      pstatstg    : access STATSTG;
      grfStatFlag : DWORD)
      return HRESULT;

   procedure ILockBytes_Stat_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumFORMATETC_RemoteNext_Proxy
     (This         : access IEnumFORMATETC;
      celt         : Win32.ULONG;
      rgelt        : access FORMATETC;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   procedure IEnumFORMATETC_RemoteNext_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumFORMATETC_Skip_Proxy
     (This : access IEnumFORMATETC;
      celt : Win32.ULONG)
      return HRESULT;

   procedure IEnumFORMATETC_Skip_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumFORMATETC_Reset_Proxy
     (This : access IEnumFORMATETC)
      return HRESULT;

   procedure IEnumFORMATETC_Reset_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumFORMATETC_Clone_Proxy
     (This   : access IEnumFORMATETC;
      ppenum : access LPENUMFORMATETC)
      return HRESULT;

   procedure IEnumFORMATETC_Clone_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATDATA_RemoteNext_Proxy
     (This         : access IEnumSTATDATA;
      celt         : Win32.ULONG;
      rgelt        : access STATDATA;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   procedure IEnumSTATDATA_RemoteNext_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATDATA_Skip_Proxy
     (This : access IEnumSTATDATA;
      celt : Win32.ULONG)
      return HRESULT;

   procedure IEnumSTATDATA_Skip_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATDATA_Reset_Proxy
     (This : access IEnumSTATDATA)
      return HRESULT;

   procedure IEnumSTATDATA_Reset_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumSTATDATA_Clone_Proxy
     (This   : access IEnumSTATDATA;
      ppenum : access LPENUMSTATDATA)
      return HRESULT;

   procedure IEnumSTATDATA_Clone_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRootStorage_SwitchToFile_Proxy
     (This    : access IRootStorage;
      pszFile : LPOLESTR)
      return HRESULT;

   procedure IRootStorage_SwitchToFile_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IAdviseSink_RemoteOnDataChange_Proxy
     (This       : access IAdviseSink;
      pFormatetc : access FORMATETC;
      pStgmed    : access RemSTGMEDIUM);

   procedure IAdviseSink_RemoteOnDataChange_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IAdviseSink_RemoteOnViewChange_Proxy
     (This     : access IAdviseSink;
      dwAspect : DWORD;
      lindex   : LONG);

   procedure IAdviseSink_RemoteOnViewChange_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IAdviseSink_RemoteOnRename_Proxy
     (This : access IAdviseSink;
      pmk  : access IMoniker);

   procedure IAdviseSink_RemoteOnRename_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IAdviseSink_RemoteOnSave_Proxy (This : access IAdviseSink);

   procedure IAdviseSink_RemoteOnSave_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IAdviseSink_RemoteOnClose_Proxy (This : access IAdviseSink);

   procedure IAdviseSink_RemoteOnClose_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IAdviseSink2_RemoteOnLinkSrcChange_Proxy
     (This : access IAdviseSink2;
      pmk  : access IMoniker);

   procedure IAdviseSink2_RemoteOnLinkSrcChange_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_RemoteGetData_Proxy
     (This           : access IDataObject;
      pformatetcIn   : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
      return HRESULT;

   procedure IDataObject_RemoteGetData_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_RemoteGetDataHere_Proxy
     (This           : access IDataObject;
      pformatetc     : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
      return HRESULT;

   procedure IDataObject_RemoteGetDataHere_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_QueryGetData_Proxy
     (This       : access IDataObject;
      pformatetc : access FORMATETC)
      return HRESULT;

   procedure IDataObject_QueryGetData_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_GetCanonicalFormatEtc_Proxy
     (This          : access IDataObject;
      pformatectIn  : access FORMATETC;
      pformatetcOut : access FORMATETC)
      return HRESULT;

   procedure IDataObject_GetCanonicalFormatEtc_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_RemoteSetData_Proxy
     (This       : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium    : a_RemSTGMEDIUM_t;
      fRelease   : BOOL)
      return HRESULT;

   procedure IDataObject_RemoteSetData_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_EnumFormatEtc_Proxy
     (This            : access IDataObject;
      dwDirection     : DWORD;
      ppenumFormatEtc : access LPENUMFORMATETC)
      return HRESULT;

   procedure IDataObject_EnumFormatEtc_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_DAdvise_Proxy
     (This          : access IDataObject;
      pformatetc    : access FORMATETC;
      advf          : DWORD;
      pAdvSink      : access IAdviseSink;
      pdwConnection : Win32.PDWORD)
      return HRESULT;

   procedure IDataObject_DAdvise_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_DUnadvise_Proxy
     (This         : access IDataObject;
      dwConnection : DWORD)
      return HRESULT;

   procedure IDataObject_DUnadvise_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataObject_EnumDAdvise_Proxy
     (This         : access IDataObject;
      ppenumAdvise : access LPENUMSTATDATA)
      return HRESULT;

   procedure IDataObject_EnumDAdvise_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataAdviseHolder_Advise_Proxy
     (This          : access IDataAdviseHolder;
      pDataObject   : access IDataObject;
      pFetc         : access FORMATETC;
      advf          : DWORD;
      pAdvise       : access IAdviseSink;
      pdwConnection : Win32.PDWORD)
      return HRESULT;

   procedure IDataAdviseHolder_Advise_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataAdviseHolder_Unadvise_Proxy
     (This         : access IDataAdviseHolder;
      dwConnection : DWORD)
      return HRESULT;

   procedure IDataAdviseHolder_Unadvise_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataAdviseHolder_EnumAdvise_Proxy
     (This         : access IDataAdviseHolder;
      ppenumAdvise : access LPENUMSTATDATA)
      return HRESULT;

   procedure IDataAdviseHolder_EnumAdvise_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDataAdviseHolder_SendOnDataChange_Proxy
     (This        : access IDataAdviseHolder;
      pDataObject : access IDataObject;
      dwReserved  : DWORD;
      advf        : DWORD)
      return HRESULT;

   procedure IDataAdviseHolder_SendOnDataChange_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMessageFilter_HandleInComingCall_Proxy
     (This            : access IMessageFilter;
      dwCallType      : DWORD;
      htaskCaller     : Win32.Windef.HTASK;
      dwTickCount     : DWORD;
      lpInterfaceInfo : Win32.Objbase.LPINTERFACEINFO)
      return DWORD;

   procedure IMessageFilter_HandleInComingCall_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMessageFilter_RetryRejectedCall_Proxy
     (This         : access IMessageFilter;
      htaskCallee  : Win32.Windef.HTASK;
      dwTickCount  : DWORD;
      dwRejectType : DWORD)
      return DWORD;

   procedure IMessageFilter_RetryRejectedCall_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IMessageFilter_MessagePending_Proxy
     (This          : access IMessageFilter;
      htaskCallee   : Win32.Windef.HTASK;
      dwTickCount   : DWORD;
      dwPendingType : DWORD)
      return DWORD;

   procedure IMessageFilter_MessagePending_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcChannelBuffer_GetBuffer_Proxy
     (This     : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE;
      riid     : REFIID)
      return HRESULT;

   procedure IRpcChannelBuffer_GetBuffer_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcChannelBuffer_SendReceive_Proxy
     (This     : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE;
      pStatus  : Win32.PDWORD)
      return HRESULT;

   procedure IRpcChannelBuffer_SendReceive_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcChannelBuffer_FreeBuffer_Proxy
     (This     : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE)
      return HRESULT;

   procedure IRpcChannelBuffer_FreeBuffer_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcChannelBuffer_GetDestCtx_Proxy
     (This           : access IRpcChannelBuffer;
      pdwDestContext : Win32.PDWORD;
      ppvDestContext : access Win32.PVOID)
      return HRESULT;

   procedure IRpcChannelBuffer_GetDestCtx_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcChannelBuffer_IsConnected_Proxy
     (This : access IRpcChannelBuffer)
      return HRESULT;

   procedure IRpcChannelBuffer_IsConnected_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcProxyBuffer_Connect_Proxy
     (This              : access IRpcProxyBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer)
      return HRESULT;

   procedure IRpcProxyBuffer_Connect_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IRpcProxyBuffer_Disconnect_Proxy
     (This : access IRpcProxyBuffer);

   procedure IRpcProxyBuffer_Disconnect_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcStubBuffer_Connect_Proxy
     (This       : access IRpcStubBuffer;
      pUnkServer : access IUnknown)
      return HRESULT;

   procedure IRpcStubBuffer_Connect_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IRpcStubBuffer_Disconnect_Proxy (This : access IRpcStubBuffer);

   procedure IRpcStubBuffer_Disconnect_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcStubBuffer_Invoke_Proxy
     (This              : access IRpcStubBuffer;
      prpcmsg           : access RPCOLEMESSAGE;
      pRpcChannelBuffer : access IRpcChannelBuffer)
      return HRESULT;

   procedure IRpcStubBuffer_Invoke_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcStubBuffer_IsIIDSupported_Proxy
     (This : access IRpcStubBuffer;
      riid : REFIID)
      return a_IRpcStubBuffer_t;

   procedure IRpcStubBuffer_IsIIDSupported_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcStubBuffer_CountRefs_Proxy
     (This : access IRpcStubBuffer)
      return ULONG;

   procedure IRpcStubBuffer_CountRefs_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IRpcStubBuffer_DebugServerQueryInterface_Proxy
     (This : access IRpcStubBuffer;
      ppv  : access Win32.PVOID)
      return HRESULT;

   procedure IRpcStubBuffer_DebugServerQueryInterface_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure IRpcStubBuffer_DebugServerRelease_Proxy
     (This : access IRpcStubBuffer;
      pv   : Win32.PVOID);

   procedure IRpcStubBuffer_DebugServerRelease_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPSFactoryBuffer_CreateProxy_Proxy
     (This      : access IPSFactoryBuffer;
      pUnkOuter : access IUnknown;
      riid      : REFIID;
      ppProxy   : access PIRpcProxyBuffer;
      ppv       : access Win32.PVOID)
      return HRESULT;

   procedure IPSFactoryBuffer_CreateProxy_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IPSFactoryBuffer_CreateStub_Proxy
     (This       : access IPSFactoryBuffer;
      riid       : REFIID;
      pUnkServer : access IUnknown;
      ppStub     : access a_IRpcStubBuffer_t)
      return HRESULT;

   procedure IPSFactoryBuffer_CreateStub_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure SNB_to_xmit (p1 : access SNB; p2 : access a_RemSNB_t);

   procedure SNB_from_xmit (p1 : a_RemSNB_t; p2 : access SNB);

   procedure SNB_free_inst (p1 : access SNB);

   procedure SNB_free_xmit (p1 : a_RemSNB_t);

   function IClassFactory_CreateInstance_Proxy
     (This      : access IClassFactory;
      pUnkOuter : access IUnknown;
      riid      : REFIID;
      ppvObject : access Win32.PVOID)
      return HRESULT;

   function IClassFactory_CreateInstance_Stub
     (This      : access IRpcStubBuffer;
      riid      : REFIID;
      ppvObject : access LPUNKNOWN)
      return HRESULT;

   function IEnumUnknown_Next_Proxy
     (This         : access IEnumUnknown;
      celt         : Win32.ULONG;
      rgelt        : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumUnknown_Next_Stub
     (This         : access IRpcStubBuffer;
      celt         : Win32.ULONG;
      rgelt        : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumMoniker_Next_Proxy
     (This         : access IEnumMoniker;
      celt         : Win32.ULONG;
      rgelt        : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumMoniker_Next_Stub
     (This         : access IRpcStubBuffer;
      celt         : Win32.ULONG;
      rgelt        : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IMoniker_BindToObject_Proxy
     (This       : access IMoniker;
      pbc        : access IBindCtx;
      pmkToLeft  : access IMoniker;
      riidResult : access IID;
      ppvResult  : access Win32.PVOID)
      return HRESULT;

   function IMoniker_BindToObject_Stub
     (This       : access IRpcStubBuffer;
      pbc        : access IBindCtx;
      pmkToLeft  : access IMoniker;
      riidResult : access IID;
      ppvResult  : access LPUNKNOWN)
      return HRESULT;

   function IMoniker_BindToStorage_Proxy
     (This      : access IMoniker;
      pbc       : access IBindCtx;
      pmkToLeft : access IMoniker;
      riid      : REFIID;
      ppvObj    : access Win32.PVOID)
      return HRESULT;

   function IMoniker_BindToStorage_Stub
     (This      : access IRpcStubBuffer;
      pbc       : access IBindCtx;
      pmkToLeft : access IMoniker;
      riid      : REFIID;
      ppvObj    : access LPUNKNOWN)
      return HRESULT;

   function IEnumString_Next_Proxy
     (This         : access IEnumString;
      celt         : Win32.ULONG;
      rgelt        : access LPOLESTR;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumString_Next_Stub
     (This         : access IRpcStubBuffer;
      celt         : Win32.ULONG;
      rgelt        : access LPOLESTR;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IStream_Read_Proxy
     (This    : access IStream;
      pv      : Win32.PVOID;
      cb      : Win32.ULONG;
      pcbRead : Win32.PDWORD)
      return HRESULT;

   function IStream_Read_Stub
     (This    : access IRpcStubBuffer;
      pv      : Win32.PBYTE;
      cb      : Win32.ULONG;
      pcbRead : Win32.PDWORD)
      return HRESULT;

   function IStream_Write_Proxy
     (This       : access IStream;
      pv         : PCVOID;
      cb         : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
      return HRESULT;

   function IStream_Write_Stub
     (This       : access IRpcStubBuffer;
      pv         : Win32.PCBYTE;
      cb         : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
      return HRESULT;

   function IStream_Seek_Proxy
     (This            : access IStream;
      dlibMove        : Win32.Winnt.LARGE_INTEGER;
      dwOrigin        : DWORD;
      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   function IStream_Seek_Stub
     (This            : access IRpcStubBuffer;
      dlibMove        : Win32.Winnt.LARGE_INTEGER;
      dwOrigin        : DWORD;
      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   function IStream_CopyTo_Proxy
     (This       : access IStream;
      pstm       : access IStream;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      pcbRead    : access Win32.Winnt.ULARGE_INTEGER;
      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   function IStream_CopyTo_Stub
     (This       : access IRpcStubBuffer;
      pstm       : access IStream;
      cb         : Win32.Winnt.ULARGE_INTEGER;
      pcbRead    : access Win32.Winnt.ULARGE_INTEGER;
      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
      return HRESULT;

   function IEnumSTATSTG_Next_Proxy
     (This         : access IEnumSTATSTG;
      celt         : Win32.ULONG;
      rgelt        : access STATSTG;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumSTATSTG_Next_Stub
     (This         : access IRpcStubBuffer;
      celt         : Win32.ULONG;
      rgelt        : access STATSTG;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IStorage_OpenStream_Proxy
     (This      : access IStorage;
      pwcsName  : PCWSTR;
      reserved1 : Win32.PVOID;
      grfMode   : DWORD;
      reserved2 : DWORD;
      ppstm     : access LPSTREAM)
      return HRESULT;

   function IStorage_OpenStream_Stub
     (This        : access IRpcStubBuffer;
      pwcsName    : PCWSTR;
      cbReserved1 : Win32.UINT;
      reserved1   : Win32.PBYTE;
      grfMode     : DWORD;
      reserved2   : DWORD;
      ppstm       : access LPSTREAM)
      return HRESULT;

   function IStorage_EnumElements_Proxy
     (This      : access IStorage;
      reserved1 : DWORD;
      reserved2 : Win32.PVOID;
      reserved3 : DWORD;
      ppenum    : access LPENUMSTATSTG)
      return HRESULT;

   function IStorage_EnumElements_Stub
     (This        : access IRpcStubBuffer;
      reserved1   : DWORD;
      cbReserved2 : Win32.UINT;
      reserved2   : Win32.PBYTE;
      reserved3   : DWORD;
      ppenum      : access LPENUMSTATSTG)
      return HRESULT;

   function ILockBytes_ReadAt_Proxy
     (This     : access ILockBytes;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv       : Win32.PVOID;
      cb       : Win32.ULONG;
      pcbRead  : Win32.PDWORD)
      return HRESULT;

   function ILockBytes_ReadAt_Stub
     (This     : access IRpcStubBuffer;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv       : Win32.PBYTE;
      cb       : Win32.ULONG;
      pcbRead  : Win32.PDWORD)
      return HRESULT;

   function ILockBytes_WriteAt_Proxy
     (This       : access ILockBytes;
      ulOffset   : Win32.Winnt.ULARGE_INTEGER;
      pv         : PCVOID;
      cb         : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
      return HRESULT;

   function ILockBytes_WriteAt_Stub
     (This       : access IRpcStubBuffer;
      ulOffset   : Win32.Winnt.ULARGE_INTEGER;
      pv         : Win32.PCBYTE;
      cb         : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
      return HRESULT;

   function IEnumFORMATETC_Next_Proxy
     (This         : access IEnumFORMATETC;
      celt         : Win32.ULONG;
      rgelt        : access FORMATETC;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumFORMATETC_Next_Stub
     (This         : access IRpcStubBuffer;
      celt         : Win32.ULONG;
      rgelt        : access FORMATETC;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumSTATDATA_Next_Proxy
     (This         : access IEnumSTATDATA;
      celt         : Win32.ULONG;
      rgelt        : access STATDATA;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   function IEnumSTATDATA_Next_Stub
     (This         : access IRpcStubBuffer;
      celt         : Win32.ULONG;
      rgelt        : access STATDATA;
      pceltFetched : Win32.PDWORD)
      return HRESULT;

   procedure IAdviseSink_OnDataChange_Proxy
     (This       : access IAdviseSink;
      pFormatetc : access FORMATETC;
      pStgmed    : access STGMEDIUM);

   procedure IAdviseSink_OnDataChange_Stub
     (This       : access IRpcStubBuffer;
      pFormatetc : access FORMATETC;
      pStgmed    : access RemSTGMEDIUM);

   procedure IAdviseSink_OnViewChange_Proxy
     (This     : access IAdviseSink;
      dwAspect : DWORD;
      lindex   : LONG);

   procedure IAdviseSink_OnViewChange_Stub
     (This     : access IRpcStubBuffer;
      dwAspect : DWORD;
      lindex   : LONG);

   procedure IAdviseSink_OnRename_Proxy
     (This : access IAdviseSink;
      pmk  : access IMoniker);

   procedure IAdviseSink_OnRename_Stub
     (This : access IRpcStubBuffer;
      pmk  : access IMoniker);

   procedure IAdviseSink_OnSave_Proxy (This : access IAdviseSink);

   procedure IAdviseSink_OnSave_Stub (This : access IRpcStubBuffer);

   procedure IAdviseSink_OnClose_Proxy (This : access IAdviseSink);

   procedure IAdviseSink_OnClose_Stub (This : access IRpcStubBuffer);

   procedure IAdviseSink2_OnLinkSrcChange_Proxy
     (This : access IAdviseSink2;
      pmk  : access IMoniker);

   procedure IAdviseSink2_OnLinkSrcChange_Stub
     (This : access IRpcStubBuffer;
      pmk  : access IMoniker);

   function IDataObject_GetData_Proxy
     (This         : access IDataObject;
      pformatetcIn : access FORMATETC;
      pmedium      : access STGMEDIUM)
      return HRESULT;

   function IDataObject_GetData_Stub
     (This           : access IRpcStubBuffer;
      pformatetcIn   : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
      return HRESULT;

   function IDataObject_GetDataHere_Proxy
     (This       : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium    : access STGMEDIUM)
      return HRESULT;

   function IDataObject_GetDataHere_Stub
     (This           : access IRpcStubBuffer;
      pformatetc     : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
      return HRESULT;

   function IDataObject_SetData_Proxy
     (This       : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium    : access STGMEDIUM;
      fRelease   : BOOL)
      return HRESULT;

   function IDataObject_SetData_Stub
     (This       : access IRpcStubBuffer;
      pformatetc : access FORMATETC;
      pmedium    : a_RemSTGMEDIUM_t;
      fRelease   : BOOL)
      return HRESULT;

   function IsEqualGUID
     (rguid1 : REFGUID;
      rguid2 : REFGUID)
      return Win32.BOOL;

   function IsEqualIID (riid1 : REFGUID; riid2 : REFGUID) return Win32.BOOL
      renames IsEqualGUID;

   function IsEqualCLSID
     (rclsid1 : REFCLSID;
      rclsid2 : REFCLSID)
      return Win32.BOOL;

   function CoBuildVersion return DWORD;

   function CoInitialize (pvReserved : Win32.LPVOID) return HRESULT;

   procedure CoUninitialize;

   function CoGetMalloc
     (dwMemContext : DWORD;
      ppMalloc     : access LPMALLOC)
      return HRESULT;

   function CoGetCurrentProcess return DWORD;

   function CoCreateStandardMalloc
     (memctx   : DWORD;
      ppMalloc : access LPMALLOC)
      return HRESULT;

   function CoGetClassObject
     (rclsid       : REFCLSID;
      dwClsContext : DWORD;
      pvReserved   : Win32.LPVOID;
      riid         : REFIID;
      ppv          : access Win32.PVOID)
      return HRESULT;

   function CoRegisterClassObject
     (rclsid       : REFCLSID;
      pUnk         : LPUNKNOWN;
      dwClsContext : DWORD;
      flags        : DWORD;
      lpdwRegister : LPDWORD)
      return HRESULT;

   function CoRevokeClassObject (dwRegister : DWORD) return HRESULT;

   function CoGetMarshalSizeMax
     (pulSize       : Win32.PDWORD;
      riid          : REFIID;
      pUnk          : LPUNKNOWN;
      dwDestContext : DWORD;
      pvDestContext : Win32.LPVOID;
      mshlflags     : DWORD)
      return HRESULT;

   function CoMarshalInterface
     (pStm          : access IStream;
      riid          : REFIID;
      pUnk          : LPUNKNOWN;
      dwDestContext : DWORD;
      pvDestContext : Win32.LPVOID;
      mshlflags     : DWORD)
      return HRESULT;

   function CoUnmarshalInterface
     (pStm : access IStream;
      riid : REFIID;
      ppv  : access Win32.PVOID)
      return HRESULT;

   function CoMarshalHresult
     (pstm    : access IStream;
      hresult : Win32.Objbase.HRESULT)
      return Win32.Objbase.HRESULT;

   function CoUnmarshalHresult
     (pstm     : access IStream;
      phresult : access Win32.Objbase.HRESULT)
      return HRESULT;

   function CoReleaseMarshalData (pStm : access IStream) return HRESULT;

   function CoDisconnectObject
     (pUnk       : LPUNKNOWN;
      dwReserved : DWORD)
      return HRESULT;

   function CoLockObjectExternal
     (pUnk                : LPUNKNOWN;
      fLock               : BOOL;
      fLastUnlockReleases : BOOL)
      return HRESULT;

   function CoGetStandardMarshal
     (riid          : REFIID;
      pUnk          : LPUNKNOWN;
      dwDestContext : DWORD;
      pvDestContext : Win32.LPVOID;
      mshlflags     : DWORD;
      ppMarshal     : access LPMARSHAL)
      return HRESULT;

   function CoIsHandlerConnected (pUnk : LPUNKNOWN) return BOOL;

   function CoHasStrongExternalConnections (pUnk : LPUNKNOWN) return BOOL;

   function CoLoadLibrary
     (lpszLibName : LPOLESTR;
      bAutoFree   : BOOL)
      return Win32.Windef.HINSTANCE;

   procedure CoFreeLibrary (hInst : Win32.Windef.HINSTANCE);

   procedure CoFreeAllLibraries;

   procedure CoFreeUnusedLibraries;

   function CoCreateInstance
     (rclsid       : REFCLSID;
      pUnkOuter    : LPUNKNOWN;
      dwClsContext : DWORD;
      riid         : REFIID;
      ppv          : access Win32.PVOID)
      return HRESULT;

   function StringFromCLSID
     (rclsid : REFCLSID;
      lplpsz : access LPOLESTR)
      return HRESULT;

   function CLSIDFromString
     (lpsz   : LPOLESTR;
      pclsid : access CLSID)
      return HRESULT;

   function StringFromIID
     (rclsid : REFIID;
      lplpsz : access LPOLESTR)
      return HRESULT;

   function IIDFromString
     (lpsz  : LPOLESTR;
      lpiid : Win32.Objbase.LPIID)
      return HRESULT;

   function CoIsOle1Class (rclsid : REFCLSID) return BOOL;

   function ProgIDFromCLSID
     (clsid        : REFCLSID;
      lplpszProgID : access LPOLESTR)
      return HRESULT;

   function CLSIDFromProgID
     (lpszProgID : LPCOLESTR;
      lpclsid    : access CLSID)
      return HRESULT;

   function StringFromGUID2
     (rguid : access IID;
      lpsz  : LPOLESTR;
      cbMax : Win32.INT)
      return Win32.INT;

   function CoCreateGuid (pguid : access Win32.Rpcdce.GUID) return HRESULT;

   function CoFileTimeToDosDateTime
     (lpFileTime : access Win32.Winbase.FILETIME;
      lpDosDate  : LPWORD;
      lpDosTime  : LPWORD)
      return BOOL;

   function CoDosDateTimeToFileTime
     (nDosDate   : WORD;
      nDosTime   : WORD;
      lpFileTime : access Win32.Winbase.FILETIME)
      return BOOL;

   function CoFileTimeNow
     (lpFileTime : access Win32.Winbase.FILETIME)
      return HRESULT;

   function CoRegisterMessageFilter
     (lpMessageFilter   : Win32.Objbase.LPMESSAGEFILTER;
      lplpMessageFilter : access Win32.Objbase.LPMESSAGEFILTER)
      return HRESULT;

   function CoGetTreatAsClass
     (clsidOld  : REFCLSID;
      pClsidNew : access CLSID)
      return HRESULT;

   function CoTreatAsClass
     (clsidOld : REFCLSID;
      clsidNew : access IID)
      return HRESULT;

   function DllGetClassObject
     (rclsid : REFCLSID;
      riid   : REFIID;
      ppv    : access Win32.PVOID)
      return HRESULT;

   function DllCanUnloadNow return HRESULT;

   function CoTaskMemAlloc (cb : Win32.ULONG) return LPVOID;

   function CoTaskMemRealloc
     (pv   : Win32.LPVOID;
      cb   : Win32.ULONG)
      return LPVOID;

   procedure CoTaskMemFree (pv : Win32.LPVOID);

   function CreateDataAdviseHolder
     (ppDAHolder : access LPDATAADVISEHOLDER)
      return HRESULT;

   function CreateDataCache
     (pUnkOuter : LPUNKNOWN;
      rclsid    : REFCLSID;
      iid       : access Win32.Objbase.IID;
      ppv       : access Win32.PVOID)
      return HRESULT;

   function StgCreateDocfile
     (pwcsName  : PCWSTR;
      grfMode   : DWORD;
      reserved  : DWORD;
      ppstgOpen : access LPSTORAGE)
      return HRESULT;

   function StgCreateDocfileOnILockBytes
     (plkbyt    : access ILockBytes;
      grfMode   : DWORD;
      reserved  : DWORD;
      ppstgOpen : access LPSTORAGE)
      return HRESULT;

   function StgOpenStorage
     (pwcsName     : PCWSTR;
      pstgPriority : access IStorage;
      grfMode      : DWORD;
      snbExclude   : SNB;
      reserved     : DWORD;
      ppstgOpen    : access LPSTORAGE)
      return HRESULT;

   function StgOpenStorageOnILockBytes
     (plkbyt       : access ILockBytes;
      pstgPriority : access IStorage;
      grfMode      : DWORD;
      snbExclude   : SNB;
      reserved     : DWORD;
      ppstgOpen    : access LPSTORAGE)
      return HRESULT;

   function StgIsStorageFile (pwcsName : PCWSTR) return HRESULT;

   function StgIsStorageILockBytes
     (plkbyt : access ILockBytes)
      return HRESULT;

   function StgSetTimes
     (lpszName : PCWSTR;
      pctime   : Win32.Winbase.ac_FILETIME_t;
      patime   : Win32.Winbase.ac_FILETIME_t;
      pmtime   : Win32.Winbase.ac_FILETIME_t)
      return HRESULT;

   function BindMoniker
     (pmk       : LPMONIKER;
      grfOpt    : DWORD;
      iidResult : access IID;
      ppvResult : access Win32.PVOID)
      return HRESULT;

   function MkParseDisplayName
     (pbc        : LPBC;
      szUserName : LPCOLESTR;
      pchEaten   : Win32.PDWORD;
      ppmk       : access LPMONIKER)
      return HRESULT;

   function MonikerRelativePathTo
     (pmkSrc            : LPMONIKER;
      pmkDest           : LPMONIKER;
      ppmkRelPath       : access LPMONIKER;
      fCalledFromMethod : BOOL)
      return HRESULT;

   function MonikerCommonPrefixWith
     (pmkThis    : LPMONIKER;
      pmkOther   : LPMONIKER;
      ppmkCommon : access LPMONIKER)
      return HRESULT;

   function CreateBindCtx
     (reserved : DWORD;
      ppbc     : access LPBC)
      return HRESULT;

   function CreateGenericComposite
     (pmkFirst      : LPMONIKER;
      pmkRest       : LPMONIKER;
      ppmkComposite : access LPMONIKER)
      return HRESULT;

   function GetClassFile
     (szFilename : LPCOLESTR;
      pclsid     : access CLSID)
      return HRESULT;

   function CreateFileMoniker
     (lpszPathName : LPCOLESTR;
      ppmk         : access LPMONIKER)
      return HRESULT;

   function CreateItemMoniker
     (lpszDelim : LPCOLESTR;
      lpszItem  : LPCOLESTR;
      ppmk      : access LPMONIKER)
      return HRESULT;

   function CreateAntiMoniker (ppmk : access LPMONIKER) return HRESULT;

   function CreatePointerMoniker
     (punk : LPUNKNOWN;
      ppmk : access LPMONIKER)
      return HRESULT;

   function GetRunningObjectTable
     (reserved : DWORD;
      pprot    : access LPRUNNINGOBJECTTABLE)
      return HRESULT;

private

   pragma Convention (C_Pass_By_Copy, RemHGLOBAL);
   pragma Convention (C, RemHMETAFILEPICT);
   pragma Convention (C_Pass_By_Copy, RemHENHMETAFILE);
   pragma Convention (C_Pass_By_Copy, RemHBITMAP);
   pragma Convention (C_Pass_By_Copy, RemHPALETTE);
   pragma Convention (C_Pass_By_Copy, RemBRUSH);
   pragma Convention (C, OBJECTID);
   pragma Convention (C_Pass_By_Copy, IUnknown);
   pragma Convention (C_Pass_By_Copy, IClassFactory);
   pragma Convention (C_Pass_By_Copy, IMarshal);
   pragma Convention (C_Pass_By_Copy, IMalloc);
   pragma Convention (C_Pass_By_Copy, IStdMarshalInfo);
   pragma Convention (C_Pass_By_Copy, IExternalConnection);
   pragma Convention (C_Pass_By_Copy, IWeakRef);
   pragma Convention (C_Pass_By_Copy, IEnumUnknown);
   pragma Convention (C_Pass_By_Copy, IBindCtx);
   pragma Convention (C_Pass_By_Copy, IParseDisplayName);
   pragma Convention (C_Pass_By_Copy, IEnumMoniker);
   pragma Convention (C_Pass_By_Copy, IRunnableObject);
   pragma Convention (C_Pass_By_Copy, IRunningObjectTable);
   pragma Convention (C_Pass_By_Copy, IPersist);
   pragma Convention (C_Pass_By_Copy, IPersistStream);
   pragma Convention (C_Pass_By_Copy, IMoniker);
   pragma Convention (C_Pass_By_Copy, IEnumString);
   pragma Convention (C_Pass_By_Copy, IStream);
   pragma Convention (C_Pass_By_Copy, IEnumSTATSTG);
   pragma Convention (C_Pass_By_Copy, IStorage);
   pragma Convention (C_Pass_By_Copy, IPersistFile);
   pragma Convention (C_Pass_By_Copy, IPersistStorage);
   pragma Convention (C_Pass_By_Copy, ILockBytes);
   pragma Convention (C_Pass_By_Copy, IEnumFORMATETC);
   pragma Convention (C_Pass_By_Copy, IEnumSTATDATA);
   pragma Convention (C_Pass_By_Copy, IRootStorage);
   pragma Convention (C_Pass_By_Copy, IAdviseSink);
   pragma Convention (C_Pass_By_Copy, IAdviseSink2);
   pragma Convention (C_Pass_By_Copy, IDataObject);
   pragma Convention (C_Pass_By_Copy, IDataAdviseHolder);
   pragma Convention (C_Pass_By_Copy, IMessageFilter);
   pragma Convention (C_Pass_By_Copy, IRpcProxyBuffer);
   pragma Convention (C_Pass_By_Copy, IPSFactoryBuffer);
   pragma Convention (C_Pass_By_Copy, IUnknownVtbl);
   pragma Convention (C, IClassFactoryVtbl);
   pragma Convention (C, IMarshalVtbl);
   pragma Convention (C, IMallocVtbl);
   pragma Convention (C_Pass_By_Copy, IStdMarshalInfoVtbl);
   pragma Convention (C, IExternalConnectionVtbl);
   pragma Convention (C, IWeakRefVtbl);
   pragma Convention (C, IEnumUnknownVtbl);
   pragma Convention (C_Pass_By_Copy, BIND_OPTS);
   pragma Convention (C, IBindCtxVtbl);
   pragma Convention (C_Pass_By_Copy, IParseDisplayNameVtbl);
   pragma Convention (C, IEnumMonikerVtbl);
   pragma Convention (C, IRunnableObjectVtbl);
   pragma Convention (C, IRunningObjectTableVtbl);
   pragma Convention (C_Pass_By_Copy, IPersistVtbl);
   pragma Convention (C, IEnumStringVtbl);
   pragma Convention (C, STATSTG);
   pragma Convention (C, IStreamVtbl);
   pragma Convention (C, IEnumSTATSTGVtbl);
   pragma Convention (C_Pass_By_Copy, RemSNB);
   pragma Convention (C, IStorageVtbl);
   pragma Convention (C, IPersistFileVtbl);
   pragma Convention (C, IPersistStorageVtbl);
   pragma Convention (C, ILockBytesVtbl);
   pragma Convention (C_Pass_By_Copy, DVTARGETDEVICE);
   pragma Convention (C, FORMATETC);
   pragma Convention (C, IEnumFORMATETCVtbl);
   pragma Convention (C, STATDATA);
   pragma Convention (C, IEnumSTATDATAVtbl);
   pragma Convention (C_Pass_By_Copy, IRootStorageVtbl);
   pragma Convention (C_Pass_By_Copy, RemSTGMEDIUM);
   pragma Convention (C_Pass_By_Copy, STGMEDIUM);
   pragma Convention (C, IAdviseSinkVtbl);
   pragma Convention (C, IAdviseSink2Vtbl);
   pragma Convention (C, IDataObjectVtbl);
   pragma Convention (C, IDataAdviseHolderVtbl);
   pragma Convention (C, INTERFACEINFO);
   pragma Convention (C, IMessageFilterVtbl);
   pragma Convention (C, RPCOLEMESSAGE);
   pragma Convention (C_Pass_By_Copy, IRpcChannelBufferVtbl);
   pragma Convention (C_Pass_By_Copy, IRpcChannelBuffer);
   pragma Convention (C, IRpcProxyBufferVtbl);
   pragma Convention (C_Pass_By_Copy, IRpcStubBufferVtbl);
   pragma Convention (C_Pass_By_Copy, IRpcStubBuffer);
   pragma Convention (C, IPSFactoryBufferVtbl);
   pragma Convention (C, IPersistStreamVtbl);
   pragma Convention (C, IMonikerVtbl);

   pragma Import
     (Stdcall,
      IWinTypes_v0_1_c_ifspec,
      "IWinTypes_v0_1_c_ifspec");
   pragma Import
     (Stdcall,
      IWinTypes_v0_1_s_ifspec,
      "IWinTypes_v0_1_s_ifspec");
   pragma Import
     (Stdcall,
      MIDL_intf_0000_v0_0_c_ifspec,
      "__MIDL__intf_0000_v0_0_c_ifspec");
   pragma Import
     (Stdcall,
      MIDL_intf_0000_v0_0_s_ifspec,
      "__MIDL__intf_0000_v0_0_s_ifspec");
   pragma Import (Stdcall, IID_IUnknown, "IID_IUnknown");
   pragma Import (Stdcall, IID_IClassFactory, "IID_IClassFactory");
   pragma Import (Stdcall, IID_IMarshal, "IID_IMarshal");
   pragma Import (Stdcall, IID_IMalloc, "IID_IMalloc");
   pragma Import (Stdcall, IID_IStdMarshalInfo, "IID_IStdMarshalInfo");
   pragma Import
     (Stdcall,
      IID_IExternalConnection,
      "IID_IExternalConnection");
   pragma Import (Stdcall, IID_IWeakRef, "IID_IWeakRef");
   pragma Import (Stdcall, IID_IEnumUnknown, "IID_IEnumUnknown");
   pragma Import (Stdcall, IID_IBindCtx, "IID_IBindCtx");
   pragma Import (Stdcall, IID_IParseDisplayName, "IID_IParseDisplayName");
   pragma Import (Stdcall, IID_IEnumMoniker, "IID_IEnumMoniker");
   pragma Import (Stdcall, IID_IRunnableObject, "IID_IRunnableObject");
   pragma Import
     (Stdcall,
      IID_IRunningObjectTable,
      "IID_IRunningObjectTable");
   pragma Import (Stdcall, IID_IPersist, "IID_IPersist");
   pragma Import (Stdcall, IID_IPersistStream, "IID_IPersistStream");
   pragma Import (Stdcall, IID_IMoniker, "IID_IMoniker");
   pragma Import (Stdcall, IID_IEnumString, "IID_IEnumString");
   pragma Import (Stdcall, IID_IStream, "IID_IStream");
   pragma Import (Stdcall, IID_IEnumSTATSTG, "IID_IEnumSTATSTG");
   pragma Import (Stdcall, IID_IStorage, "IID_IStorage");
   pragma Import (Stdcall, IID_IPersistFile, "IID_IPersistFile");
   pragma Import (Stdcall, IID_IPersistStorage, "IID_IPersistStorage");
   pragma Import (Stdcall, IID_ILockBytes, "IID_ILockBytes");
   pragma Import (Stdcall, IID_IEnumFORMATETC, "IID_IEnumFORMATETC");
   pragma Import (Stdcall, IID_IEnumSTATDATA, "IID_IEnumSTATDATA");
   pragma Import (Stdcall, IID_IRootStorage, "IID_IRootStorage");
   pragma Import (Stdcall, IID_IAdviseSink, "IID_IAdviseSink");
   pragma Import (Stdcall, IID_IAdviseSink2, "IID_IAdviseSink2");
   pragma Import (Stdcall, IID_IDataObject, "IID_IDataObject");
   pragma Import (Stdcall, IID_IDataAdviseHolder, "IID_IDataAdviseHolder");
   pragma Import (Stdcall, IID_IMessageFilter, "IID_IMessageFilter");
   pragma Import (Stdcall, IID_IRpcChannelBuffer, "IID_IRpcChannelBuffer");
   pragma Import (Stdcall, IID_IRpcProxyBuffer, "IID_IRpcProxyBuffer");
   pragma Import (Stdcall, IID_IRpcStubBuffer, "IID_IRpcStubBuffer");
   pragma Import (Stdcall, IID_IPSFactoryBuffer, "IID_IPSFactoryBuffer");
   pragma Import (Stdcall, HGLOBAL_to_xmit, "HGLOBAL_to_xmit");
   pragma Import (Stdcall, HGLOBAL_from_xmit, "HGLOBAL_from_xmit");
   pragma Import (Stdcall, HGLOBAL_free_inst, "HGLOBAL_free_inst");
   pragma Import (Stdcall, HGLOBAL_free_xmit, "HGLOBAL_free_xmit");
   pragma Import (Stdcall, HBITMAP_to_xmit, "HBITMAP_to_xmit");
   pragma Import (Stdcall, HBITMAP_from_xmit, "HBITMAP_from_xmit");
   pragma Import (Stdcall, HBITMAP_free_inst, "HBITMAP_free_inst");
   pragma Import (Stdcall, HBITMAP_free_xmit, "HBITMAP_free_xmit");
   pragma Import (Stdcall, HPALETTE_to_xmit, "HPALETTE_to_xmit");
   pragma Import (Stdcall, HPALETTE_from_xmit, "HPALETTE_from_xmit");
   pragma Import (Stdcall, HPALETTE_free_inst, "HPALETTE_free_inst");
   pragma Import (Stdcall, HPALETTE_free_xmit, "HPALETTE_free_xmit");
   pragma Import (Stdcall, HBRUSH_to_xmit, "HBRUSH_to_xmit");
   pragma Import (Stdcall, HBRUSH_from_xmit, "HBRUSH_from_xmit");
   pragma Import (Stdcall, HBRUSH_free_inst, "HBRUSH_free_inst");
   pragma Import (Stdcall, HBRUSH_free_xmit, "HBRUSH_free_xmit");
   pragma Import (Stdcall, HMETAFILEPICT_to_xmit, "HMETAFILEPICT_to_xmit");
   pragma Import
     (Stdcall,
      HMETAFILEPICT_from_xmit,
      "HMETAFILEPICT_from_xmit");
   pragma Import
     (Stdcall,
      HMETAFILEPICT_free_inst,
      "HMETAFILEPICT_free_inst");
   pragma Import
     (Stdcall,
      HMETAFILEPICT_free_xmit,
      "HMETAFILEPICT_free_xmit");
   pragma Import (Stdcall, HENHMETAFILE_to_xmit, "HENHMETAFILE_to_xmit");
   pragma Import (Stdcall, HENHMETAFILE_from_xmit, "HENHMETAFILE_from_xmit");
   pragma Import (Stdcall, HENHMETAFILE_free_inst, "HENHMETAFILE_free_inst");
   pragma Import (Stdcall, HENHMETAFILE_free_xmit, "HENHMETAFILE_free_xmit");
   pragma Import
     (Stdcall,
      IUnknown_QueryInterface_Proxy,
      "IUnknown_QueryInterface_Proxy");
   pragma Import
     (Stdcall,
      IUnknown_QueryInterface_Stub,
      "IUnknown_QueryInterface_Stub");
   pragma Import (Stdcall, IUnknown_AddRef_Proxy, "IUnknown_AddRef_Proxy");
   pragma Import (Stdcall, IUnknown_AddRef_Stub, "IUnknown_AddRef_Stub");
   pragma Import (Stdcall, IUnknown_Release_Proxy, "IUnknown_Release_Proxy");
   pragma Import (Stdcall, IUnknown_Release_Stub, "IUnknown_Release_Stub");
   pragma Import
     (Stdcall,
      IClassFactory_RemoteCreateInstance_Proxy,
      "IClassFactory_RemoteCreateInstance_Proxy");
   pragma Import
     (Stdcall,
      IClassFactory_RemoteCreateInstance_Stub,
      "IClassFactory_RemoteCreateInstance_Stub");
   pragma Import
     (Stdcall,
      IClassFactory_LockServer_Proxy,
      "IClassFactory_LockServer_Proxy");
   pragma Import
     (Stdcall,
      IClassFactory_LockServer_Stub,
      "IClassFactory_LockServer_Stub");
   pragma Import
     (Stdcall,
      IMarshal_GetUnmarshalClass_Proxy,
      "IMarshal_GetUnmarshalClass_Proxy");
   pragma Import
     (Stdcall,
      IMarshal_GetUnmarshalClass_Stub,
      "IMarshal_GetUnmarshalClass_Stub");
   pragma Import
     (Stdcall,
      IMarshal_GetMarshalSizeMax_Proxy,
      "IMarshal_GetMarshalSizeMax_Proxy");
   pragma Import
     (Stdcall,
      IMarshal_GetMarshalSizeMax_Stub,
      "IMarshal_GetMarshalSizeMax_Stub");
   pragma Import
     (Stdcall,
      IMarshal_MarshalInterface_Proxy,
      "IMarshal_MarshalInterface_Proxy");
   pragma Import
     (Stdcall,
      IMarshal_MarshalInterface_Stub,
      "IMarshal_MarshalInterface_Stub");
   pragma Import
     (Stdcall,
      IMarshal_UnmarshalInterface_Proxy,
      "IMarshal_UnmarshalInterface_Proxy");
   pragma Import
     (Stdcall,
      IMarshal_UnmarshalInterface_Stub,
      "IMarshal_UnmarshalInterface_Stub");
   pragma Import
     (Stdcall,
      IMarshal_ReleaseMarshalData_Proxy,
      "IMarshal_ReleaseMarshalData_Proxy");
   pragma Import
     (Stdcall,
      IMarshal_ReleaseMarshalData_Stub,
      "IMarshal_ReleaseMarshalData_Stub");
   pragma Import
     (Stdcall,
      IMarshal_DisconnectObject_Proxy,
      "IMarshal_DisconnectObject_Proxy");
   pragma Import
     (Stdcall,
      IMarshal_DisconnectObject_Stub,
      "IMarshal_DisconnectObject_Stub");
   pragma Import (Stdcall, IMalloc_Alloc_Proxy, "IMalloc_Alloc_Proxy");
   pragma Import (Stdcall, IMalloc_Alloc_Stub, "IMalloc_Alloc_Stub");
   pragma Import (Stdcall, IMalloc_Realloc_Proxy, "IMalloc_Realloc_Proxy");
   pragma Import (Stdcall, IMalloc_Realloc_Stub, "IMalloc_Realloc_Stub");
   pragma Import (Stdcall, IMalloc_Free_Proxy, "IMalloc_Free_Proxy");
   pragma Import (Stdcall, IMalloc_Free_Stub, "IMalloc_Free_Stub");
   pragma Import (Stdcall, IMalloc_GetSize_Proxy, "IMalloc_GetSize_Proxy");
   pragma Import (Stdcall, IMalloc_GetSize_Stub, "IMalloc_GetSize_Stub");
   pragma Import (Stdcall, IMalloc_DidAlloc_Proxy, "IMalloc_DidAlloc_Proxy");
   pragma Import (Stdcall, IMalloc_DidAlloc_Stub, "IMalloc_DidAlloc_Stub");
   pragma Import
     (Stdcall,
      IMalloc_HeapMinimize_Proxy,
      "IMalloc_HeapMinimize_Proxy");
   pragma Import
     (Stdcall,
      IMalloc_HeapMinimize_Stub,
      "IMalloc_HeapMinimize_Stub");
   pragma Import
     (Stdcall,
      IStdMarshalInfo_GetClassForHandler_Proxy,
      "IStdMarshalInfo_GetClassForHandler_Proxy");
   pragma Import
     (Stdcall,
      IStdMarshalInfo_GetClassForHandler_Stub,
      "IStdMarshalInfo_GetClassForHandler_Stub");
   pragma Import
     (Stdcall,
      IExternalConnection_AddConnection_Proxy,
      "IExternalConnection_AddConnection_Proxy");
   pragma Import
     (Stdcall,
      IExternalConnection_AddConnection_Stub,
      "IExternalConnection_AddConnection_Stub");
   pragma Import
     (Stdcall,
      IExternalConnection_ReleaseConnection_Proxy,
      "IExternalConnection_ReleaseConnection_Proxy");
   pragma Import
     (Stdcall,
      IExternalConnection_ReleaseConnection_Stub,
      "IExternalConnection_ReleaseConnection_Stub");
   pragma Import
     (Stdcall,
      IWeakRef_ChangeWeakCount_Proxy,
      "IWeakRef_ChangeWeakCount_Proxy");
   pragma Import
     (Stdcall,
      IWeakRef_ChangeWeakCount_Stub,
      "IWeakRef_ChangeWeakCount_Stub");
   pragma Import
     (Stdcall,
      IWeakRef_ReleaseKeepAlive_Proxy,
      "IWeakRef_ReleaseKeepAlive_Proxy");
   pragma Import
     (Stdcall,
      IWeakRef_ReleaseKeepAlive_Stub,
      "IWeakRef_ReleaseKeepAlive_Stub");
   pragma Import
     (Stdcall,
      IEnumUnknown_RemoteNext_Proxy,
      "IEnumUnknown_RemoteNext_Proxy");
   pragma Import
     (Stdcall,
      IEnumUnknown_RemoteNext_Stub,
      "IEnumUnknown_RemoteNext_Stub");
   pragma Import
     (Stdcall,
      IEnumUnknown_Skip_Proxy,
      "IEnumUnknown_Skip_Proxy");
   pragma Import (Stdcall, IEnumUnknown_Skip_Stub, "IEnumUnknown_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumUnknown_Reset_Proxy,
      "IEnumUnknown_Reset_Proxy");
   pragma Import
     (Stdcall,
      IEnumUnknown_Reset_Stub,
      "IEnumUnknown_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumUnknown_Clone_Proxy,
      "IEnumUnknown_Clone_Proxy");
   pragma Import
     (Stdcall,
      IEnumUnknown_Clone_Stub,
      "IEnumUnknown_Clone_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_RegisterObjectBound_Proxy,
      "IBindCtx_RegisterObjectBound_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_RegisterObjectBound_Stub,
      "IBindCtx_RegisterObjectBound_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_RevokeObjectBound_Proxy,
      "IBindCtx_RevokeObjectBound_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_RevokeObjectBound_Stub,
      "IBindCtx_RevokeObjectBound_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_ReleaseBoundObjects_Proxy,
      "IBindCtx_ReleaseBoundObjects_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_ReleaseBoundObjects_Stub,
      "IBindCtx_ReleaseBoundObjects_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_SetBindOptions_Proxy,
      "IBindCtx_SetBindOptions_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_SetBindOptions_Stub,
      "IBindCtx_SetBindOptions_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_GetBindOptions_Proxy,
      "IBindCtx_GetBindOptions_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_GetBindOptions_Stub,
      "IBindCtx_GetBindOptions_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_GetRunningObjectTable_Proxy,
      "IBindCtx_GetRunningObjectTable_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_GetRunningObjectTable_Stub,
      "IBindCtx_GetRunningObjectTable_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_RegisterObjectParam_Proxy,
      "IBindCtx_RegisterObjectParam_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_RegisterObjectParam_Stub,
      "IBindCtx_RegisterObjectParam_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_GetObjectParam_Proxy,
      "IBindCtx_GetObjectParam_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_GetObjectParam_Stub,
      "IBindCtx_GetObjectParam_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_EnumObjectParam_Proxy,
      "IBindCtx_EnumObjectParam_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_EnumObjectParam_Stub,
      "IBindCtx_EnumObjectParam_Stub");
   pragma Import
     (Stdcall,
      IBindCtx_RevokeObjectParam_Proxy,
      "IBindCtx_RevokeObjectParam_Proxy");
   pragma Import
     (Stdcall,
      IBindCtx_RevokeObjectParam_Stub,
      "IBindCtx_RevokeObjectParam_Stub");
   pragma Import
     (Stdcall,
      IParseDisplayName_ParseDisplayName_Proxy,
      "IParseDisplayName_ParseDisplayName_Proxy");
   pragma Import
     (Stdcall,
      IParseDisplayName_ParseDisplayName_Stub,
      "IParseDisplayName_ParseDisplayName_Stub");
   pragma Import
     (Stdcall,
      IEnumMoniker_RemoteNext_Proxy,
      "IEnumMoniker_RemoteNext_Proxy");
   pragma Import
     (Stdcall,
      IEnumMoniker_RemoteNext_Stub,
      "IEnumMoniker_RemoteNext_Stub");
   pragma Import
     (Stdcall,
      IEnumMoniker_Skip_Proxy,
      "IEnumMoniker_Skip_Proxy");
   pragma Import (Stdcall, IEnumMoniker_Skip_Stub, "IEnumMoniker_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumMoniker_Reset_Proxy,
      "IEnumMoniker_Reset_Proxy");
   pragma Import
     (Stdcall,
      IEnumMoniker_Reset_Stub,
      "IEnumMoniker_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumMoniker_Clone_Proxy,
      "IEnumMoniker_Clone_Proxy");
   pragma Import
     (Stdcall,
      IEnumMoniker_Clone_Stub,
      "IEnumMoniker_Clone_Stub");
   pragma Import
     (Stdcall,
      IRunnableObject_GetRunningClass_Proxy,
      "IRunnableObject_GetRunningClass_Proxy");
   pragma Import
     (Stdcall,
      IRunnableObject_GetRunningClass_Stub,
      "IRunnableObject_GetRunningClass_Stub");
   pragma Import
     (Stdcall,
      IRunnableObject_Run_Proxy,
      "IRunnableObject_Run_Proxy");
   pragma Import
     (Stdcall,
      IRunnableObject_Run_Stub,
      "IRunnableObject_Run_Stub");
   pragma Import
     (Stdcall,
      IRunnableObject_IsRunning_Proxy,
      "IRunnableObject_IsRunning_Proxy");
   pragma Import
     (Stdcall,
      IRunnableObject_IsRunning_Stub,
      "IRunnableObject_IsRunning_Stub");
   pragma Import
     (Stdcall,
      IRunnableObject_LockRunning_Proxy,
      "IRunnableObject_LockRunning_Proxy");
   pragma Import
     (Stdcall,
      IRunnableObject_LockRunning_Stub,
      "IRunnableObject_LockRunning_Stub");
   pragma Import
     (Stdcall,
      IRunnableObject_SetContainedObject_Proxy,
      "IRunnableObject_SetContainedObject_Proxy");
   pragma Import
     (Stdcall,
      IRunnableObject_SetContainedObject_Stub,
      "IRunnableObject_SetContainedObject_Stub");
   pragma Import
     (Stdcall,
      IRunningObjectTable_Register_Proxy,
      "IRunningObjectTable_Register_Proxy");
   pragma Import
     (Stdcall,
      IRunningObjectTable_Register_Stub,
      "IRunningObjectTable_Register_Stub");
   pragma Import
     (Stdcall,
      IRunningObjectTable_Revoke_Proxy,
      "IRunningObjectTable_Revoke_Proxy");
   pragma Import
     (Stdcall,
      IRunningObjectTable_Revoke_Stub,
      "IRunningObjectTable_Revoke_Stub");
   pragma Import
     (Stdcall,
      IRunningObjectTable_IsRunning_Proxy,
      "IRunningObjectTable_IsRunning_Proxy");
   pragma Import
     (Stdcall,
      IRunningObjectTable_IsRunning_Stub,
      "IRunningObjectTable_IsRunning_Stub");
   pragma Import
     (Stdcall,
      IRunningObjectTable_GetObject_Proxy,
      "IRunningObjectTable_GetObject_Proxy");
   pragma Import
     (Stdcall,
      IRunningObjectTable_GetObject_Stub,
      "IRunningObjectTable_GetObject_Stub");
   pragma Import
     (Stdcall,
      IRunningObjectTable_NoteChangeTime_Proxy,
      "IRunningObjectTable_NoteChangeTime_Proxy");
   pragma Import
     (Stdcall,
      IRunningObjectTable_NoteChangeTime_Stub,
      "IRunningObjectTable_NoteChangeTime_Stub");
   pragma Import
     (Stdcall,
      IRunningObjectTable_GetTimeOfLastChange_Proxy,
      "IRunningObjectTable_GetTimeOfLastChange_Proxy");
   pragma Import
     (Stdcall,
      IRunningObjectTable_GetTimeOfLastChange_Stub,
      "IRunningObjectTable_GetTimeOfLastChange_Stub");
   pragma Import
     (Stdcall,
      IRunningObjectTable_EnumRunning_Proxy,
      "IRunningObjectTable_EnumRunning_Proxy");
   pragma Import
     (Stdcall,
      IRunningObjectTable_EnumRunning_Stub,
      "IRunningObjectTable_EnumRunning_Stub");
   pragma Import
     (Stdcall,
      IPersist_GetClassID_Proxy,
      "IPersist_GetClassID_Proxy");
   pragma Import
     (Stdcall,
      IPersist_GetClassID_Stub,
      "IPersist_GetClassID_Stub");
   pragma Import
     (Stdcall,
      IPersistStream_IsDirty_Proxy,
      "IPersistStream_IsDirty_Proxy");
   pragma Import
     (Stdcall,
      IPersistStream_IsDirty_Stub,
      "IPersistStream_IsDirty_Stub");
   pragma Import
     (Stdcall,
      IPersistStream_Load_Proxy,
      "IPersistStream_Load_Proxy");
   pragma Import
     (Stdcall,
      IPersistStream_Load_Stub,
      "IPersistStream_Load_Stub");
   pragma Import
     (Stdcall,
      IPersistStream_Save_Proxy,
      "IPersistStream_Save_Proxy");
   pragma Import
     (Stdcall,
      IPersistStream_Save_Stub,
      "IPersistStream_Save_Stub");
   pragma Import
     (Stdcall,
      IPersistStream_GetSizeMax_Proxy,
      "IPersistStream_GetSizeMax_Proxy");
   pragma Import
     (Stdcall,
      IPersistStream_GetSizeMax_Stub,
      "IPersistStream_GetSizeMax_Stub");
   pragma Import
     (Stdcall,
      IMoniker_RemoteBindToObject_Proxy,
      "IMoniker_RemoteBindToObject_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_RemoteBindToObject_Stub,
      "IMoniker_RemoteBindToObject_Stub");
   pragma Import
     (Stdcall,
      IMoniker_RemoteBindToStorage_Proxy,
      "IMoniker_RemoteBindToStorage_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_RemoteBindToStorage_Stub,
      "IMoniker_RemoteBindToStorage_Stub");
   pragma Import (Stdcall, IMoniker_Reduce_Proxy, "IMoniker_Reduce_Proxy");
   pragma Import (Stdcall, IMoniker_Reduce_Stub, "IMoniker_Reduce_Stub");
   pragma Import
     (Stdcall,
      IMoniker_ComposeWith_Proxy,
      "IMoniker_ComposeWith_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_ComposeWith_Stub,
      "IMoniker_ComposeWith_Stub");
   pragma Import (Stdcall, IMoniker_Enum_Proxy, "IMoniker_Enum_Proxy");
   pragma Import (Stdcall, IMoniker_Enum_Stub, "IMoniker_Enum_Stub");
   pragma Import (Stdcall, IMoniker_IsEqual_Proxy, "IMoniker_IsEqual_Proxy");
   pragma Import (Stdcall, IMoniker_IsEqual_Stub, "IMoniker_IsEqual_Stub");
   pragma Import (Stdcall, IMoniker_Hash_Proxy, "IMoniker_Hash_Proxy");
   pragma Import (Stdcall, IMoniker_Hash_Stub, "IMoniker_Hash_Stub");
   pragma Import
     (Stdcall,
      IMoniker_IsRunning_Proxy,
      "IMoniker_IsRunning_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_IsRunning_Stub,
      "IMoniker_IsRunning_Stub");
   pragma Import
     (Stdcall,
      IMoniker_GetTimeOfLastChange_Proxy,
      "IMoniker_GetTimeOfLastChange_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_GetTimeOfLastChange_Stub,
      "IMoniker_GetTimeOfLastChange_Stub");
   pragma Import (Stdcall, IMoniker_Inverse_Proxy, "IMoniker_Inverse_Proxy");
   pragma Import (Stdcall, IMoniker_Inverse_Stub, "IMoniker_Inverse_Stub");
   pragma Import
     (Stdcall,
      IMoniker_CommonPrefixWith_Proxy,
      "IMoniker_CommonPrefixWith_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_CommonPrefixWith_Stub,
      "IMoniker_CommonPrefixWith_Stub");
   pragma Import
     (Stdcall,
      IMoniker_RelativePathTo_Proxy,
      "IMoniker_RelativePathTo_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_RelativePathTo_Stub,
      "IMoniker_RelativePathTo_Stub");
   pragma Import
     (Stdcall,
      IMoniker_GetDisplayName_Proxy,
      "IMoniker_GetDisplayName_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_GetDisplayName_Stub,
      "IMoniker_GetDisplayName_Stub");
   pragma Import
     (Stdcall,
      IMoniker_ParseDisplayName_Proxy,
      "IMoniker_ParseDisplayName_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_ParseDisplayName_Stub,
      "IMoniker_ParseDisplayName_Stub");
   pragma Import
     (Stdcall,
      IMoniker_IsSystemMoniker_Proxy,
      "IMoniker_IsSystemMoniker_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_IsSystemMoniker_Stub,
      "IMoniker_IsSystemMoniker_Stub");
   pragma Import
     (Stdcall,
      IEnumString_RemoteNext_Proxy,
      "IEnumString_RemoteNext_Proxy");
   pragma Import
     (Stdcall,
      IEnumString_RemoteNext_Stub,
      "IEnumString_RemoteNext_Stub");
   pragma Import (Stdcall, IEnumString_Skip_Proxy, "IEnumString_Skip_Proxy");
   pragma Import (Stdcall, IEnumString_Skip_Stub, "IEnumString_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumString_Reset_Proxy,
      "IEnumString_Reset_Proxy");
   pragma Import (Stdcall, IEnumString_Reset_Stub, "IEnumString_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumString_Clone_Proxy,
      "IEnumString_Clone_Proxy");
   pragma Import (Stdcall, IEnumString_Clone_Stub, "IEnumString_Clone_Stub");
   pragma Import
     (Stdcall,
      IStream_RemoteRead_Proxy,
      "IStream_RemoteRead_Proxy");
   pragma Import
     (Stdcall,
      IStream_RemoteRead_Stub,
      "IStream_RemoteRead_Stub");
   pragma Import
     (Stdcall,
      IStream_RemoteWrite_Proxy,
      "IStream_RemoteWrite_Proxy");
   pragma Import
     (Stdcall,
      IStream_RemoteWrite_Stub,
      "IStream_RemoteWrite_Stub");
   pragma Import
     (Stdcall,
      IStream_RemoteSeek_Proxy,
      "IStream_RemoteSeek_Proxy");
   pragma Import
     (Stdcall,
      IStream_RemoteSeek_Stub,
      "IStream_RemoteSeek_Stub");
   pragma Import (Stdcall, IStream_SetSize_Proxy, "IStream_SetSize_Proxy");
   pragma Import (Stdcall, IStream_SetSize_Stub, "IStream_SetSize_Stub");
   pragma Import
     (Stdcall,
      IStream_RemoteCopyTo_Proxy,
      "IStream_RemoteCopyTo_Proxy");
   pragma Import
     (Stdcall,
      IStream_RemoteCopyTo_Stub,
      "IStream_RemoteCopyTo_Stub");
   pragma Import (Stdcall, IStream_Commit_Proxy, "IStream_Commit_Proxy");
   pragma Import (Stdcall, IStream_Commit_Stub, "IStream_Commit_Stub");
   pragma Import (Stdcall, IStream_Revert_Proxy, "IStream_Revert_Proxy");
   pragma Import (Stdcall, IStream_Revert_Stub, "IStream_Revert_Stub");
   pragma Import
     (Stdcall,
      IStream_LockRegion_Proxy,
      "IStream_LockRegion_Proxy");
   pragma Import
     (Stdcall,
      IStream_LockRegion_Stub,
      "IStream_LockRegion_Stub");
   pragma Import
     (Stdcall,
      IStream_UnlockRegion_Proxy,
      "IStream_UnlockRegion_Proxy");
   pragma Import
     (Stdcall,
      IStream_UnlockRegion_Stub,
      "IStream_UnlockRegion_Stub");
   pragma Import (Stdcall, IStream_Stat_Proxy, "IStream_Stat_Proxy");
   pragma Import (Stdcall, IStream_Stat_Stub, "IStream_Stat_Stub");
   pragma Import (Stdcall, IStream_Clone_Proxy, "IStream_Clone_Proxy");
   pragma Import (Stdcall, IStream_Clone_Stub, "IStream_Clone_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_RemoteNext_Proxy,
      "IEnumSTATSTG_RemoteNext_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_RemoteNext_Stub,
      "IEnumSTATSTG_RemoteNext_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_Skip_Proxy,
      "IEnumSTATSTG_Skip_Proxy");
   pragma Import (Stdcall, IEnumSTATSTG_Skip_Stub, "IEnumSTATSTG_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_Reset_Proxy,
      "IEnumSTATSTG_Reset_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_Reset_Stub,
      "IEnumSTATSTG_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_Clone_Proxy,
      "IEnumSTATSTG_Clone_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_Clone_Stub,
      "IEnumSTATSTG_Clone_Stub");
   pragma Import
     (Stdcall,
      IStorage_CreateStream_Proxy,
      "IStorage_CreateStream_Proxy");
   pragma Import
     (Stdcall,
      IStorage_CreateStream_Stub,
      "IStorage_CreateStream_Stub");
   pragma Import
     (Stdcall,
      IStorage_RemoteOpenStream_Proxy,
      "IStorage_RemoteOpenStream_Proxy");
   pragma Import
     (Stdcall,
      IStorage_RemoteOpenStream_Stub,
      "IStorage_RemoteOpenStream_Stub");
   pragma Import
     (Stdcall,
      IStorage_CreateStorage_Proxy,
      "IStorage_CreateStorage_Proxy");
   pragma Import
     (Stdcall,
      IStorage_CreateStorage_Stub,
      "IStorage_CreateStorage_Stub");
   pragma Import
     (Stdcall,
      IStorage_OpenStorage_Proxy,
      "IStorage_OpenStorage_Proxy");
   pragma Import
     (Stdcall,
      IStorage_OpenStorage_Stub,
      "IStorage_OpenStorage_Stub");
   pragma Import (Stdcall, IStorage_CopyTo_Proxy, "IStorage_CopyTo_Proxy");
   pragma Import (Stdcall, IStorage_CopyTo_Stub, "IStorage_CopyTo_Stub");
   pragma Import
     (Stdcall,
      IStorage_MoveElementTo_Proxy,
      "IStorage_MoveElementTo_Proxy");
   pragma Import
     (Stdcall,
      IStorage_MoveElementTo_Stub,
      "IStorage_MoveElementTo_Stub");
   pragma Import (Stdcall, IStorage_Commit_Proxy, "IStorage_Commit_Proxy");
   pragma Import (Stdcall, IStorage_Commit_Stub, "IStorage_Commit_Stub");
   pragma Import (Stdcall, IStorage_Revert_Proxy, "IStorage_Revert_Proxy");
   pragma Import (Stdcall, IStorage_Revert_Stub, "IStorage_Revert_Stub");
   pragma Import
     (Stdcall,
      IStorage_RemoteEnumElements_Proxy,
      "IStorage_RemoteEnumElements_Proxy");
   pragma Import
     (Stdcall,
      IStorage_RemoteEnumElements_Stub,
      "IStorage_RemoteEnumElements_Stub");
   pragma Import
     (Stdcall,
      IStorage_DestroyElement_Proxy,
      "IStorage_DestroyElement_Proxy");
   pragma Import
     (Stdcall,
      IStorage_DestroyElement_Stub,
      "IStorage_DestroyElement_Stub");
   pragma Import
     (Stdcall,
      IStorage_RenameElement_Proxy,
      "IStorage_RenameElement_Proxy");
   pragma Import
     (Stdcall,
      IStorage_RenameElement_Stub,
      "IStorage_RenameElement_Stub");
   pragma Import
     (Stdcall,
      IStorage_SetElementTimes_Proxy,
      "IStorage_SetElementTimes_Proxy");
   pragma Import
     (Stdcall,
      IStorage_SetElementTimes_Stub,
      "IStorage_SetElementTimes_Stub");
   pragma Import
     (Stdcall,
      IStorage_SetClass_Proxy,
      "IStorage_SetClass_Proxy");
   pragma Import (Stdcall, IStorage_SetClass_Stub, "IStorage_SetClass_Stub");
   pragma Import
     (Stdcall,
      IStorage_SetStateBits_Proxy,
      "IStorage_SetStateBits_Proxy");
   pragma Import
     (Stdcall,
      IStorage_SetStateBits_Stub,
      "IStorage_SetStateBits_Stub");
   pragma Import (Stdcall, IStorage_Stat_Proxy, "IStorage_Stat_Proxy");
   pragma Import (Stdcall, IStorage_Stat_Stub, "IStorage_Stat_Stub");
   pragma Import
     (Stdcall,
      IPersistFile_IsDirty_Proxy,
      "IPersistFile_IsDirty_Proxy");
   pragma Import
     (Stdcall,
      IPersistFile_IsDirty_Stub,
      "IPersistFile_IsDirty_Stub");
   pragma Import
     (Stdcall,
      IPersistFile_Load_Proxy,
      "IPersistFile_Load_Proxy");
   pragma Import (Stdcall, IPersistFile_Load_Stub, "IPersistFile_Load_Stub");
   pragma Import
     (Stdcall,
      IPersistFile_Save_Proxy,
      "IPersistFile_Save_Proxy");
   pragma Import (Stdcall, IPersistFile_Save_Stub, "IPersistFile_Save_Stub");
   pragma Import
     (Stdcall,
      IPersistFile_SaveCompleted_Proxy,
      "IPersistFile_SaveCompleted_Proxy");
   pragma Import
     (Stdcall,
      IPersistFile_SaveCompleted_Stub,
      "IPersistFile_SaveCompleted_Stub");
   pragma Import
     (Stdcall,
      IPersistFile_GetCurFile_Proxy,
      "IPersistFile_GetCurFile_Proxy");
   pragma Import
     (Stdcall,
      IPersistFile_GetCurFile_Stub,
      "IPersistFile_GetCurFile_Stub");
   pragma Import
     (Stdcall,
      IPersistStorage_IsDirty_Proxy,
      "IPersistStorage_IsDirty_Proxy");
   pragma Import
     (Stdcall,
      IPersistStorage_IsDirty_Stub,
      "IPersistStorage_IsDirty_Stub");
   pragma Import
     (Stdcall,
      IPersistStorage_InitNew_Proxy,
      "IPersistStorage_InitNew_Proxy");
   pragma Import
     (Stdcall,
      IPersistStorage_InitNew_Stub,
      "IPersistStorage_InitNew_Stub");
   pragma Import
     (Stdcall,
      IPersistStorage_Load_Proxy,
      "IPersistStorage_Load_Proxy");
   pragma Import
     (Stdcall,
      IPersistStorage_Load_Stub,
      "IPersistStorage_Load_Stub");
   pragma Import
     (Stdcall,
      IPersistStorage_Save_Proxy,
      "IPersistStorage_Save_Proxy");
   pragma Import
     (Stdcall,
      IPersistStorage_Save_Stub,
      "IPersistStorage_Save_Stub");
   pragma Import
     (Stdcall,
      IPersistStorage_SaveCompleted_Proxy,
      "IPersistStorage_SaveCompleted_Proxy");
   pragma Import
     (Stdcall,
      IPersistStorage_SaveCompleted_Stub,
      "IPersistStorage_SaveCompleted_Stub");
   pragma Import
     (Stdcall,
      IPersistStorage_HandsOffStorage_Proxy,
      "IPersistStorage_HandsOffStorage_Proxy");
   pragma Import
     (Stdcall,
      IPersistStorage_HandsOffStorage_Stub,
      "IPersistStorage_HandsOffStorage_Stub");
   pragma Import
     (Stdcall,
      ILockBytes_RemoteReadAt_Proxy,
      "ILockBytes_RemoteReadAt_Proxy");
   pragma Import
     (Stdcall,
      ILockBytes_RemoteReadAt_Stub,
      "ILockBytes_RemoteReadAt_Stub");
   pragma Import
     (Stdcall,
      ILockBytes_RemoteWriteAt_Proxy,
      "ILockBytes_RemoteWriteAt_Proxy");
   pragma Import
     (Stdcall,
      ILockBytes_RemoteWriteAt_Stub,
      "ILockBytes_RemoteWriteAt_Stub");
   pragma Import (Stdcall, ILockBytes_Flush_Proxy, "ILockBytes_Flush_Proxy");
   pragma Import (Stdcall, ILockBytes_Flush_Stub, "ILockBytes_Flush_Stub");
   pragma Import
     (Stdcall,
      ILockBytes_SetSize_Proxy,
      "ILockBytes_SetSize_Proxy");
   pragma Import
     (Stdcall,
      ILockBytes_SetSize_Stub,
      "ILockBytes_SetSize_Stub");
   pragma Import
     (Stdcall,
      ILockBytes_LockRegion_Proxy,
      "ILockBytes_LockRegion_Proxy");
   pragma Import
     (Stdcall,
      ILockBytes_LockRegion_Stub,
      "ILockBytes_LockRegion_Stub");
   pragma Import
     (Stdcall,
      ILockBytes_UnlockRegion_Proxy,
      "ILockBytes_UnlockRegion_Proxy");
   pragma Import
     (Stdcall,
      ILockBytes_UnlockRegion_Stub,
      "ILockBytes_UnlockRegion_Stub");
   pragma Import (Stdcall, ILockBytes_Stat_Proxy, "ILockBytes_Stat_Proxy");
   pragma Import (Stdcall, ILockBytes_Stat_Stub, "ILockBytes_Stat_Stub");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_RemoteNext_Proxy,
      "IEnumFORMATETC_RemoteNext_Proxy");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_RemoteNext_Stub,
      "IEnumFORMATETC_RemoteNext_Stub");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Skip_Proxy,
      "IEnumFORMATETC_Skip_Proxy");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Skip_Stub,
      "IEnumFORMATETC_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Reset_Proxy,
      "IEnumFORMATETC_Reset_Proxy");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Reset_Stub,
      "IEnumFORMATETC_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Clone_Proxy,
      "IEnumFORMATETC_Clone_Proxy");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Clone_Stub,
      "IEnumFORMATETC_Clone_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_RemoteNext_Proxy,
      "IEnumSTATDATA_RemoteNext_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_RemoteNext_Stub,
      "IEnumSTATDATA_RemoteNext_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Skip_Proxy,
      "IEnumSTATDATA_Skip_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Skip_Stub,
      "IEnumSTATDATA_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Reset_Proxy,
      "IEnumSTATDATA_Reset_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Reset_Stub,
      "IEnumSTATDATA_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Clone_Proxy,
      "IEnumSTATDATA_Clone_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Clone_Stub,
      "IEnumSTATDATA_Clone_Stub");
   pragma Import
     (Stdcall,
      IRootStorage_SwitchToFile_Proxy,
      "IRootStorage_SwitchToFile_Proxy");
   pragma Import
     (Stdcall,
      IRootStorage_SwitchToFile_Stub,
      "IRootStorage_SwitchToFile_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnDataChange_Proxy,
      "IAdviseSink_RemoteOnDataChange_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnDataChange_Stub,
      "IAdviseSink_RemoteOnDataChange_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnViewChange_Proxy,
      "IAdviseSink_RemoteOnViewChange_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnViewChange_Stub,
      "IAdviseSink_RemoteOnViewChange_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnRename_Proxy,
      "IAdviseSink_RemoteOnRename_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnRename_Stub,
      "IAdviseSink_RemoteOnRename_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnSave_Proxy,
      "IAdviseSink_RemoteOnSave_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnSave_Stub,
      "IAdviseSink_RemoteOnSave_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnClose_Proxy,
      "IAdviseSink_RemoteOnClose_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_RemoteOnClose_Stub,
      "IAdviseSink_RemoteOnClose_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink2_RemoteOnLinkSrcChange_Proxy,
      "IAdviseSink2_RemoteOnLinkSrcChange_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink2_RemoteOnLinkSrcChange_Stub,
      "IAdviseSink2_RemoteOnLinkSrcChange_Stub");
   pragma Import
     (Stdcall,
      IDataObject_RemoteGetData_Proxy,
      "IDataObject_RemoteGetData_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_RemoteGetData_Stub,
      "IDataObject_RemoteGetData_Stub");
   pragma Import
     (Stdcall,
      IDataObject_RemoteGetDataHere_Proxy,
      "IDataObject_RemoteGetDataHere_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_RemoteGetDataHere_Stub,
      "IDataObject_RemoteGetDataHere_Stub");
   pragma Import
     (Stdcall,
      IDataObject_QueryGetData_Proxy,
      "IDataObject_QueryGetData_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_QueryGetData_Stub,
      "IDataObject_QueryGetData_Stub");
   pragma Import
     (Stdcall,
      IDataObject_GetCanonicalFormatEtc_Proxy,
      "IDataObject_GetCanonicalFormatEtc_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_GetCanonicalFormatEtc_Stub,
      "IDataObject_GetCanonicalFormatEtc_Stub");
   pragma Import
     (Stdcall,
      IDataObject_RemoteSetData_Proxy,
      "IDataObject_RemoteSetData_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_RemoteSetData_Stub,
      "IDataObject_RemoteSetData_Stub");
   pragma Import
     (Stdcall,
      IDataObject_EnumFormatEtc_Proxy,
      "IDataObject_EnumFormatEtc_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_EnumFormatEtc_Stub,
      "IDataObject_EnumFormatEtc_Stub");
   pragma Import
     (Stdcall,
      IDataObject_DAdvise_Proxy,
      "IDataObject_DAdvise_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_DAdvise_Stub,
      "IDataObject_DAdvise_Stub");
   pragma Import
     (Stdcall,
      IDataObject_DUnadvise_Proxy,
      "IDataObject_DUnadvise_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_DUnadvise_Stub,
      "IDataObject_DUnadvise_Stub");
   pragma Import
     (Stdcall,
      IDataObject_EnumDAdvise_Proxy,
      "IDataObject_EnumDAdvise_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_EnumDAdvise_Stub,
      "IDataObject_EnumDAdvise_Stub");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_Advise_Proxy,
      "IDataAdviseHolder_Advise_Proxy");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_Advise_Stub,
      "IDataAdviseHolder_Advise_Stub");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_Unadvise_Proxy,
      "IDataAdviseHolder_Unadvise_Proxy");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_Unadvise_Stub,
      "IDataAdviseHolder_Unadvise_Stub");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_EnumAdvise_Proxy,
      "IDataAdviseHolder_EnumAdvise_Proxy");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_EnumAdvise_Stub,
      "IDataAdviseHolder_EnumAdvise_Stub");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_SendOnDataChange_Proxy,
      "IDataAdviseHolder_SendOnDataChange_Proxy");
   pragma Import
     (Stdcall,
      IDataAdviseHolder_SendOnDataChange_Stub,
      "IDataAdviseHolder_SendOnDataChange_Stub");
   pragma Import
     (Stdcall,
      IMessageFilter_HandleInComingCall_Proxy,
      "IMessageFilter_HandleInComingCall_Proxy");
   pragma Import
     (Stdcall,
      IMessageFilter_HandleInComingCall_Stub,
      "IMessageFilter_HandleInComingCall_Stub");
   pragma Import
     (Stdcall,
      IMessageFilter_RetryRejectedCall_Proxy,
      "IMessageFilter_RetryRejectedCall_Proxy");
   pragma Import
     (Stdcall,
      IMessageFilter_RetryRejectedCall_Stub,
      "IMessageFilter_RetryRejectedCall_Stub");
   pragma Import
     (Stdcall,
      IMessageFilter_MessagePending_Proxy,
      "IMessageFilter_MessagePending_Proxy");
   pragma Import
     (Stdcall,
      IMessageFilter_MessagePending_Stub,
      "IMessageFilter_MessagePending_Stub");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_GetBuffer_Proxy,
      "IRpcChannelBuffer_GetBuffer_Proxy");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_GetBuffer_Stub,
      "IRpcChannelBuffer_GetBuffer_Stub");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_SendReceive_Proxy,
      "IRpcChannelBuffer_SendReceive_Proxy");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_SendReceive_Stub,
      "IRpcChannelBuffer_SendReceive_Stub");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_FreeBuffer_Proxy,
      "IRpcChannelBuffer_FreeBuffer_Proxy");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_FreeBuffer_Stub,
      "IRpcChannelBuffer_FreeBuffer_Stub");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_GetDestCtx_Proxy,
      "IRpcChannelBuffer_GetDestCtx_Proxy");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_GetDestCtx_Stub,
      "IRpcChannelBuffer_GetDestCtx_Stub");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_IsConnected_Proxy,
      "IRpcChannelBuffer_IsConnected_Proxy");
   pragma Import
     (Stdcall,
      IRpcChannelBuffer_IsConnected_Stub,
      "IRpcChannelBuffer_IsConnected_Stub");
   pragma Import
     (Stdcall,
      IRpcProxyBuffer_Connect_Proxy,
      "IRpcProxyBuffer_Connect_Proxy");
   pragma Import
     (Stdcall,
      IRpcProxyBuffer_Connect_Stub,
      "IRpcProxyBuffer_Connect_Stub");
   pragma Import
     (Stdcall,
      IRpcProxyBuffer_Disconnect_Proxy,
      "IRpcProxyBuffer_Disconnect_Proxy");
   pragma Import
     (Stdcall,
      IRpcProxyBuffer_Disconnect_Stub,
      "IRpcProxyBuffer_Disconnect_Stub");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_Connect_Proxy,
      "IRpcStubBuffer_Connect_Proxy");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_Connect_Stub,
      "IRpcStubBuffer_Connect_Stub");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_Disconnect_Proxy,
      "IRpcStubBuffer_Disconnect_Proxy");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_Disconnect_Stub,
      "IRpcStubBuffer_Disconnect_Stub");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_Invoke_Proxy,
      "IRpcStubBuffer_Invoke_Proxy");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_Invoke_Stub,
      "IRpcStubBuffer_Invoke_Stub");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_IsIIDSupported_Proxy,
      "IRpcStubBuffer_IsIIDSupported_Proxy");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_IsIIDSupported_Stub,
      "IRpcStubBuffer_IsIIDSupported_Stub");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_CountRefs_Proxy,
      "IRpcStubBuffer_CountRefs_Proxy");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_CountRefs_Stub,
      "IRpcStubBuffer_CountRefs_Stub");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_DebugServerQueryInterface_Proxy,
      "IRpcStubBuffer_DebugServerQueryInterface_Proxy");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_DebugServerQueryInterface_Stub,
      "IRpcStubBuffer_DebugServerQueryInterface_Stub");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_DebugServerRelease_Proxy,
      "IRpcStubBuffer_DebugServerRelease_Proxy");
   pragma Import
     (Stdcall,
      IRpcStubBuffer_DebugServerRelease_Stub,
      "IRpcStubBuffer_DebugServerRelease_Stub");
   pragma Import
     (Stdcall,
      IPSFactoryBuffer_CreateProxy_Proxy,
      "IPSFactoryBuffer_CreateProxy_Proxy");
   pragma Import
     (Stdcall,
      IPSFactoryBuffer_CreateProxy_Stub,
      "IPSFactoryBuffer_CreateProxy_Stub");
   pragma Import
     (Stdcall,
      IPSFactoryBuffer_CreateStub_Proxy,
      "IPSFactoryBuffer_CreateStub_Proxy");
   pragma Import
     (Stdcall,
      IPSFactoryBuffer_CreateStub_Stub,
      "IPSFactoryBuffer_CreateStub_Stub");
   pragma Import (Stdcall, SNB_to_xmit, "SNB_to_xmit");
   pragma Import (Stdcall, SNB_from_xmit, "SNB_from_xmit");
   pragma Import (Stdcall, SNB_free_inst, "SNB_free_inst");
   pragma Import (Stdcall, SNB_free_xmit, "SNB_free_xmit");
   pragma Import
     (Stdcall,
      IClassFactory_CreateInstance_Proxy,
      "IClassFactory_CreateInstance_Proxy");
   pragma Import
     (Stdcall,
      IClassFactory_CreateInstance_Stub,
      "IClassFactory_CreateInstance_Stub");
   pragma Import
     (Stdcall,
      IEnumUnknown_Next_Proxy,
      "IEnumUnknown_Next_Proxy");
   pragma Import (Stdcall, IEnumUnknown_Next_Stub, "IEnumUnknown_Next_Stub");
   pragma Import
     (Stdcall,
      IEnumMoniker_Next_Proxy,
      "IEnumMoniker_Next_Proxy");
   pragma Import (Stdcall, IEnumMoniker_Next_Stub, "IEnumMoniker_Next_Stub");
   pragma Import
     (Stdcall,
      IMoniker_BindToObject_Proxy,
      "IMoniker_BindToObject_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_BindToObject_Stub,
      "IMoniker_BindToObject_Stub");
   pragma Import
     (Stdcall,
      IMoniker_BindToStorage_Proxy,
      "IMoniker_BindToStorage_Proxy");
   pragma Import
     (Stdcall,
      IMoniker_BindToStorage_Stub,
      "IMoniker_BindToStorage_Stub");
   pragma Import (Stdcall, IEnumString_Next_Proxy, "IEnumString_Next_Proxy");
   pragma Import (Stdcall, IEnumString_Next_Stub, "IEnumString_Next_Stub");
   pragma Import (Stdcall, IStream_Read_Proxy, "IStream_Read_Proxy");
   pragma Import (Stdcall, IStream_Read_Stub, "IStream_Read_Stub");
   pragma Import (Stdcall, IStream_Write_Proxy, "IStream_Write_Proxy");
   pragma Import (Stdcall, IStream_Write_Stub, "IStream_Write_Stub");
   pragma Import (Stdcall, IStream_Seek_Proxy, "IStream_Seek_Proxy");
   pragma Import (Stdcall, IStream_Seek_Stub, "IStream_Seek_Stub");
   pragma Import (Stdcall, IStream_CopyTo_Proxy, "IStream_CopyTo_Proxy");
   pragma Import (Stdcall, IStream_CopyTo_Stub, "IStream_CopyTo_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATSTG_Next_Proxy,
      "IEnumSTATSTG_Next_Proxy");
   pragma Import (Stdcall, IEnumSTATSTG_Next_Stub, "IEnumSTATSTG_Next_Stub");
   pragma Import
     (Stdcall,
      IStorage_OpenStream_Proxy,
      "IStorage_OpenStream_Proxy");
   pragma Import
     (Stdcall,
      IStorage_OpenStream_Stub,
      "IStorage_OpenStream_Stub");
   pragma Import
     (Stdcall,
      IStorage_EnumElements_Proxy,
      "IStorage_EnumElements_Proxy");
   pragma Import
     (Stdcall,
      IStorage_EnumElements_Stub,
      "IStorage_EnumElements_Stub");
   pragma Import
     (Stdcall,
      ILockBytes_ReadAt_Proxy,
      "ILockBytes_ReadAt_Proxy");
   pragma Import (Stdcall, ILockBytes_ReadAt_Stub, "ILockBytes_ReadAt_Stub");
   pragma Import
     (Stdcall,
      ILockBytes_WriteAt_Proxy,
      "ILockBytes_WriteAt_Proxy");
   pragma Import
     (Stdcall,
      ILockBytes_WriteAt_Stub,
      "ILockBytes_WriteAt_Stub");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Next_Proxy,
      "IEnumFORMATETC_Next_Proxy");
   pragma Import
     (Stdcall,
      IEnumFORMATETC_Next_Stub,
      "IEnumFORMATETC_Next_Stub");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Next_Proxy,
      "IEnumSTATDATA_Next_Proxy");
   pragma Import
     (Stdcall,
      IEnumSTATDATA_Next_Stub,
      "IEnumSTATDATA_Next_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_OnDataChange_Proxy,
      "IAdviseSink_OnDataChange_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_OnDataChange_Stub,
      "IAdviseSink_OnDataChange_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_OnViewChange_Proxy,
      "IAdviseSink_OnViewChange_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_OnViewChange_Stub,
      "IAdviseSink_OnViewChange_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_OnRename_Proxy,
      "IAdviseSink_OnRename_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_OnRename_Stub,
      "IAdviseSink_OnRename_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_OnSave_Proxy,
      "IAdviseSink_OnSave_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_OnSave_Stub,
      "IAdviseSink_OnSave_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink_OnClose_Proxy,
      "IAdviseSink_OnClose_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink_OnClose_Stub,
      "IAdviseSink_OnClose_Stub");
   pragma Import
     (Stdcall,
      IAdviseSink2_OnLinkSrcChange_Proxy,
      "IAdviseSink2_OnLinkSrcChange_Proxy");
   pragma Import
     (Stdcall,
      IAdviseSink2_OnLinkSrcChange_Stub,
      "IAdviseSink2_OnLinkSrcChange_Stub");
   pragma Import
     (Stdcall,
      IDataObject_GetData_Proxy,
      "IDataObject_GetData_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_GetData_Stub,
      "IDataObject_GetData_Stub");
   pragma Import
     (Stdcall,
      IDataObject_GetDataHere_Proxy,
      "IDataObject_GetDataHere_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_GetDataHere_Stub,
      "IDataObject_GetDataHere_Stub");
   pragma Import
     (Stdcall,
      IDataObject_SetData_Proxy,
      "IDataObject_SetData_Proxy");
   pragma Import
     (Stdcall,
      IDataObject_SetData_Stub,
      "IDataObject_SetData_Stub");
   pragma Import (Stdcall, CoBuildVersion, "CoBuildVersion");
   pragma Import (Stdcall, CoInitialize, "CoInitialize");
   pragma Import (Stdcall, CoUninitialize, "CoUninitialize");
   pragma Import (Stdcall, CoGetMalloc, "CoGetMalloc");
   pragma Import (Stdcall, CoGetCurrentProcess, "CoGetCurrentProcess");
   pragma Import (Stdcall, CoCreateStandardMalloc, "CoCreateStandardMalloc");
   pragma Import (Stdcall, CoGetClassObject, "CoGetClassObject");
   pragma Import (Stdcall, CoRegisterClassObject, "CoRegisterClassObject");
   pragma Import (Stdcall, CoRevokeClassObject, "CoRevokeClassObject");
   pragma Import (Stdcall, CoGetMarshalSizeMax, "CoGetMarshalSizeMax");
   pragma Import (Stdcall, CoMarshalInterface, "CoMarshalInterface");
   pragma Import (Stdcall, CoUnmarshalInterface, "CoUnmarshalInterface");
   pragma Import (Stdcall, CoMarshalHresult, "CoMarshalHresult");
   pragma Import (Stdcall, CoUnmarshalHresult, "CoUnmarshalHresult");
   pragma Import (Stdcall, CoReleaseMarshalData, "CoReleaseMarshalData");
   pragma Import (Stdcall, CoDisconnectObject, "CoDisconnectObject");
   pragma Import (Stdcall, CoLockObjectExternal, "CoLockObjectExternal");
   pragma Import (Stdcall, CoGetStandardMarshal, "CoGetStandardMarshal");
   pragma Import (Stdcall, CoIsHandlerConnected, "CoIsHandlerConnected");
   pragma Import
     (Stdcall,
      CoHasStrongExternalConnections,
      "CoHasStrongExternalConnections");
   pragma Import (Stdcall, CoLoadLibrary, "CoLoadLibrary");
   pragma Import (Stdcall, CoFreeLibrary, "CoFreeLibrary");
   pragma Import (Stdcall, CoFreeAllLibraries, "CoFreeAllLibraries");
   pragma Import (Stdcall, CoFreeUnusedLibraries, "CoFreeUnusedLibraries");
   pragma Import (Stdcall, CoCreateInstance, "CoCreateInstance");
   pragma Import (Stdcall, StringFromCLSID, "StringFromCLSID");
   pragma Import (Stdcall, CLSIDFromString, "CLSIDFromString");
   pragma Import (Stdcall, StringFromIID, "StringFromIID");
   pragma Import (Stdcall, IIDFromString, "IIDFromString");
   pragma Import (Stdcall, CoIsOle1Class, "CoIsOle1Class");
   pragma Import (Stdcall, ProgIDFromCLSID, "ProgIDFromCLSID");
   pragma Import (Stdcall, CLSIDFromProgID, "CLSIDFromProgID");
   pragma Import (Stdcall, StringFromGUID2, "StringFromGUID2");
   pragma Import (Stdcall, CoCreateGuid, "CoCreateGuid");
   pragma Import
     (Stdcall,
      CoFileTimeToDosDateTime,
      "CoFileTimeToDosDateTime");
   pragma Import
     (Stdcall,
      CoDosDateTimeToFileTime,
      "CoDosDateTimeToFileTime");
   pragma Import (Stdcall, CoFileTimeNow, "CoFileTimeNow");
   pragma Import
     (Stdcall,
      CoRegisterMessageFilter,
      "CoRegisterMessageFilter");
   pragma Import (Stdcall, CoGetTreatAsClass, "CoGetTreatAsClass");
   pragma Import (Stdcall, CoTreatAsClass, "CoTreatAsClass");
   pragma Import (Stdcall, DllGetClassObject, "DllGetClassObject");
   pragma Import (Stdcall, DllCanUnloadNow, "DllCanUnloadNow");
   pragma Import (Stdcall, CoTaskMemAlloc, "CoTaskMemAlloc");
   pragma Import (Stdcall, CoTaskMemRealloc, "CoTaskMemRealloc");
   pragma Import (Stdcall, CoTaskMemFree, "CoTaskMemFree");
   pragma Import (Stdcall, CreateDataAdviseHolder, "CreateDataAdviseHolder");
   pragma Import (Stdcall, CreateDataCache, "CreateDataCache");
   pragma Import (Stdcall, StgCreateDocfile, "StgCreateDocfile");
   pragma Import
     (Stdcall,
      StgCreateDocfileOnILockBytes,
      "StgCreateDocfileOnILockBytes");
   pragma Import (Stdcall, StgOpenStorage, "StgOpenStorage");
   pragma Import
     (Stdcall,
      StgOpenStorageOnILockBytes,
      "StgOpenStorageOnILockBytes");
   pragma Import (Stdcall, StgIsStorageFile, "StgIsStorageFile");
   pragma Import (Stdcall, StgIsStorageILockBytes, "StgIsStorageILockBytes");
   pragma Import (Stdcall, StgSetTimes, "StgSetTimes");
   pragma Import (Stdcall, BindMoniker, "BindMoniker");
   pragma Import (Stdcall, MkParseDisplayName, "MkParseDisplayName");
   pragma Import (Stdcall, MonikerRelativePathTo, "MonikerRelativePathTo");
   pragma Import
     (Stdcall,
      MonikerCommonPrefixWith,
      "MonikerCommonPrefixWith");
   pragma Import (Stdcall, CreateBindCtx, "CreateBindCtx");
   pragma Import (Stdcall, CreateGenericComposite, "CreateGenericComposite");
   pragma Import (Stdcall, GetClassFile, "GetClassFile");
   pragma Import (Stdcall, CreateFileMoniker, "CreateFileMoniker");
   pragma Import (Stdcall, CreateItemMoniker, "CreateItemMoniker");
   pragma Import (Stdcall, CreateAntiMoniker, "CreateAntiMoniker");
   pragma Import (Stdcall, CreatePointerMoniker, "CreatePointerMoniker");
   pragma Import (Stdcall, GetRunningObjectTable, "GetRunningObjectTable");

end Win32.Objbase;
