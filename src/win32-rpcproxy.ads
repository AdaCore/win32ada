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

with Win32.Objbase;
with Win32.Rpcdcep;
with Win32.Rpcndr;

package Win32.Rpcproxy is

   type PCInterfaceName is new Win32.PCCHAR;
   type ac_PCInterfaceName_t is access all PCInterfaceName;

   type ProxyFileInfo;
   type CInterfaceProxyHeader;
   type CInterfaceStubHeader;
   type CStdStubBuffer;
   type CStdPSFactoryBuffer;
   type CStdProxyBuffer;
   type CInterfaceStubVtbl;
   type CInterfaceProxyVtbl;

   type PCInterfaceStubVtblList is access all CInterfaceStubVtbl;
   type PCInterfaceProxyVtblList is access all CInterfaceProxyVtbl;
   type ac_PCInterfaceProxyVtblList_t is access all PCInterfaceProxyVtblList;
   type ac_MIDL_SERVER_INFO_t is access all Win32.Rpcndr.MIDL_SERVER_INFO;
   type ac_IRpcStubBufferVtbl_t is access all Win32.Objbase.IRpcStubBufferVtbl;
   type ac_IPSFactoryBufferVtbl_t is access all
     Win32.Objbase.IPSFactoryBufferVtbl;
   type ac_ProxyFileInfo_t is access all ProxyFileInfo;
   type ac_ac_ProxyFileInfo_t is access all ac_ProxyFileInfo_t;
   type ac_IRpcProxyBufferVtbl_t is access all
     Win32.Objbase.IRpcProxyBufferVtbl;
   type a_CStdPSFactoryBuffer_t is access all CStdPSFactoryBuffer;
   type a_CStdProxyBuffer_t is access all CStdProxyBuffer;
   type a_ProxyFileInfo_t is access all ProxyFileInfo;
   type a_a_ProxyFileInfo_t is access all a_ProxyFileInfo_t;
   type ac_ac_ac_ProxyFileInfo_t is access all ac_ac_ProxyFileInfo_t;

   type ProxyFileInfo is record
      pProxyVtblList : ac_PCInterfaceProxyVtblList_t;
      pStubVtblList  : ac_PCInterfaceProxyVtblList_t;
      pNamesArray    : ac_PCInterfaceName_t;
      Filler1        : Win32.ULONG;
      Filler2        : Win32.ULONG;
      Filler3        : Win32.ULONG;
   end record;

   subtype ExtendedProxyFileInfo is ProxyFileInfo;

   type CInterfaceProxyHeader is record
      piid : Win32.Objbase.LPIID;
   end record;

   type PRPC_STUB_FUNCTION is access procedure
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : access Win32.DWORD);
   pragma Convention (Stdcall, PRPC_STUB_FUNCTION);

   type ac_PRPC_STUB_FUNCTION_t is access all PRPC_STUB_FUNCTION;

   type CInterfaceStubHeader is record
      piid               : Win32.Objbase.LPIID;
      pServerInfo        : ac_MIDL_SERVER_INFO_t;
      DispatchTableCount : Win32.ULONG;
      pDispatchTable     : ac_PRPC_STUB_FUNCTION_t;
   end record;

   type CStdStubBuffer is record
      lpVtbl         : ac_IRpcStubBufferVtbl_t;
      RefCount       : Win32.LONG;
      pvServerObject : Win32.Objbase.LPUNKNOWN;
   end record;

   type CStdPSFactoryBuffer is record
      lpVtbl                 : ac_IPSFactoryBufferVtbl_t;
      RefCount               : Win32.LONG;
      pProxyFileList         : ac_ac_ProxyFileInfo_t;
      pCLSID_PSFactoryBuffer : Win32.Objbase.LPIID;
   end record;

   type a_IRpcChannelBuffer_t is access all Win32.Objbase.IRpcChannelBuffer;

   type CStdProxyBuffer is record
      lpVtbl     : ac_IRpcProxyBufferVtbl_t;
      RefCount   : Win32.LONG;
      punkOuter  : Win32.Objbase.LPUNKNOWN;
      pChannel   : a_IRpcChannelBuffer_t;
      pProxyVtbl : Win32.PCVOID;
      pPSFactory : a_CStdPSFactoryBuffer_t;
   end record;

   type CInterfaceStubVtbl is record
      header : CInterfaceStubHeader;
      Vtbl   : Win32.Objbase.IRpcStubBufferVtbl;
   end record;

   type CInterfaceProxyVtbl is record
      header : CInterfaceProxyHeader;
      Vtbl   : Win32.PVOID_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   CLSID_PSFactoryBuffer : Win32.Objbase.CLSID;
   pProxyFileList        : a_a_ProxyFileInfo_t;

   function NdrGetProxyBuffer
     (pThis : Win32.PVOID)
      return a_CStdProxyBuffer_t;

   function NdrGetProxyIID (pThis : Win32.PVOID) return Win32.Objbase.LPIID;

   procedure NdrProxyInitialize
     (pThis           : Win32.PVOID;
      pRpcMsg         : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg        : Win32.Rpcndr.PMIDL_STUB_MESSAGE;
      pStubDescriptor : Win32.Rpcndr.PMIDL_STUB_DESC;
      ProcNum         : Win32.UINT);

   procedure NdrProxyGetBuffer
     (pThis    : Win32.PVOID;
      pStubMsg : Win32.Rpcndr.PMIDL_STUB_MESSAGE);

   function NdrGetStubIID (pThis : Win32.PVOID) return Win32.Objbase.LPIID;

   procedure NdrProxySendReceive
     (pThis    : Win32.PVOID;
      pStubMsg : access Win32.Rpcndr.MIDL_STUB_MESSAGE);

   procedure NdrProxyFreeBuffer
     (pThis    : Win32.PVOID;
      pStubMsg : access Win32.Rpcndr.MIDL_STUB_MESSAGE);

   function NdrProxyErrorHandler
     (dwExceptionCode : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure NdrStubInitialize
     (pRpcMsg           : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg          : Win32.Rpcndr.PMIDL_STUB_MESSAGE;
      pStubDescriptor   : Win32.Rpcndr.PMIDL_STUB_DESC;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer);

   procedure NdrStubGetBuffer
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pStubMsg          : Win32.Rpcndr.PMIDL_STUB_MESSAGE);

   function NdrStubErrorHandler
     (dwExceptionCode : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   function CStdProxyBuffer_QueryInterface
     (pThis : access Win32.Objbase.IRpcProxyBuffer;
      riid  : Win32.Objbase.REFIID;
      ppv   : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function CStdProxyBuffer_AddRef
     (pThis : access Win32.Objbase.IRpcProxyBuffer)
      return Win32.ULONG;

   function CStdProxyBuffer_Release
     (pThis : access Win32.Objbase.IRpcProxyBuffer)
      return Win32.ULONG;

   function CStdProxyBuffer_Connect
     (pThis    : access Win32.Objbase.IRpcProxyBuffer;
      pChannel : access Win32.Objbase.IRpcChannelBuffer)
      return Win32.Objbase.HRESULT;

   procedure CStdProxyBuffer_Disconnect
     (pThis : access Win32.Objbase.IRpcProxyBuffer);

   function CStdStubBuffer_QueryInterface
     (pthis     : access Win32.Objbase.IRpcStubBuffer;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function CStdStubBuffer_AddRef
     (pthis : access Win32.Objbase.IRpcStubBuffer)
      return Win32.ULONG;

   function CStdStubBuffer_Release
     (pthis : access Win32.Objbase.IRpcStubBuffer)
      return Win32.ULONG;

   function NdrCStdStubBuffer_Release
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      pPSF  : access Win32.Objbase.IPSFactoryBuffer)
      return Win32.ULONG;

   function CStdStubBuffer_Connect
     (pthis      : access Win32.Objbase.IRpcStubBuffer;
      pUnkServer : access Win32.Objbase.IUnknown)
      return Win32.Objbase.HRESULT;

   procedure CStdStubBuffer_Disconnect
     (pthis : access Win32.Objbase.IRpcStubBuffer);

   function CStdStubBuffer_Invoke
     (pthis             : access Win32.Objbase.IRpcStubBuffer;
      prpcmsg           : access Win32.Objbase.RPCOLEMESSAGE;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer)
      return Win32.Objbase.HRESULT;

   function CStdStubBuffer_IsIIDSupported
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      riid  : Win32.Objbase.REFIID)
      return Win32.Objbase.a_IRpcStubBuffer_t;

   function CStdStubBuffer_CountRefs
     (pthis : access Win32.Objbase.IRpcStubBuffer)
      return Win32.ULONG;

   function CStdStubBuffer_DebugServerQueryInterface
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      ppv   : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   procedure CStdStubBuffer_DebugServerRelease
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      pv    : Win32.PVOID);

   function CStdPSFactoryBuffer_QueryInterface
     (This : access Win32.Objbase.IPSFactoryBuffer;
      iid  : access Win32.Objbase.IID;
      ppv  : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function CStdPSFactoryBuffer_AddRef
     (This : access Win32.Objbase.IPSFactoryBuffer)
      return Win32.ULONG;

   function CStdPSFactoryBuffer_Release
     (This : access Win32.Objbase.IPSFactoryBuffer)
      return Win32.ULONG;

   function CStdPSFactoryBuffer_CreateProxy
     (This      : access Win32.Objbase.IPSFactoryBuffer;
      punkOuter : access Win32.Objbase.IUnknown;
      riid      : Win32.Objbase.REFIID;
      ppProxy   : access Win32.Objbase.PIRpcProxyBuffer;
      ppv       : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function CStdPSFactoryBuffer_CreateStub
     (This       : access Win32.Objbase.IPSFactoryBuffer;
      riid       : Win32.Objbase.REFIID;
      punkServer : access Win32.Objbase.IUnknown;
      ppStub     : access Win32.Objbase.IRpcStubBuffer)
      return Win32.Objbase.HRESULT;

   procedure GetProxyDllInfo
     (ppProxyFileList : ac_ac_ac_ProxyFileInfo_t;
      lpclsid         : access Win32.Objbase.LPCLSID);

   function NdrDllGetClassObject
     (rclsid         : Win32.Objbase.REFCLSID;
      riid           : Win32.Objbase.REFIID;
      ppv            : access Win32.LPVOID;
      pProxyFileList : ac_ac_ProxyFileInfo_t;
      piid           : access Win32.Objbase.IID;
      pPSFactory     : a_CStdPSFactoryBuffer_t)
      return Win32.Objbase.HRESULT;

   function NdrDllCanUnloadNow
     (pPSFactory : a_CStdPSFactoryBuffer_t)
      return Win32.Objbase.HRESULT;

private

   pragma Convention (C, ProxyFileInfo);
   pragma Convention (C_Pass_By_Copy, CInterfaceProxyHeader);
   pragma Convention (C_Pass_By_Copy, CInterfaceStubHeader);
   pragma Convention (C_Pass_By_Copy, CStdStubBuffer);
   pragma Convention (C_Pass_By_Copy, CStdPSFactoryBuffer);
   pragma Convention (C, CStdProxyBuffer);
   pragma Convention (C, CInterfaceStubVtbl);
   pragma Convention (C_Pass_By_Copy, CInterfaceProxyVtbl);

   pragma Import (Stdcall, CLSID_PSFactoryBuffer, "CLSID_PSFactoryBuffer");
   pragma Import (Stdcall, pProxyFileList, "pProxyFileList");

   pragma Import (Stdcall, NdrGetProxyBuffer, "NdrGetProxyBuffer");
   pragma Import (Stdcall, NdrGetProxyIID, "NdrGetProxyIID");
   pragma Import (Stdcall, NdrProxyInitialize, "NdrProxyInitialize");
   pragma Import (Stdcall, NdrProxyGetBuffer, "NdrProxyGetBuffer");
   pragma Import (Stdcall, NdrGetStubIID, "NdrGetStubIID");
   pragma Import (Stdcall, NdrProxySendReceive, "NdrProxySendReceive");
   pragma Import (Stdcall, NdrProxyFreeBuffer, "NdrProxyFreeBuffer");
   pragma Import (Stdcall, NdrProxyErrorHandler, "NdrProxyErrorHandler");
   pragma Import (Stdcall, NdrStubInitialize, "NdrStubInitialize");
   pragma Import (Stdcall, NdrStubGetBuffer, "NdrStubGetBuffer");
   pragma Import (Stdcall, NdrStubErrorHandler, "NdrStubErrorHandler");
   pragma Import
     (Stdcall,
      CStdProxyBuffer_QueryInterface,
      "CStdProxyBuffer_QueryInterface");
   pragma Import (Stdcall, CStdProxyBuffer_AddRef, "CStdProxyBuffer_AddRef");
   pragma Import
     (Stdcall,
      CStdProxyBuffer_Release,
      "CStdProxyBuffer_Release");
   pragma Import
     (Stdcall,
      CStdProxyBuffer_Connect,
      "CStdProxyBuffer_Connect");
   pragma Import
     (Stdcall,
      CStdProxyBuffer_Disconnect,
      "CStdProxyBuffer_Disconnect");
   pragma Import
     (Stdcall,
      CStdStubBuffer_QueryInterface,
      "CStdStubBuffer_QueryInterface");
   pragma Import (Stdcall, CStdStubBuffer_AddRef, "CStdStubBuffer_AddRef");
   pragma Import (Stdcall, CStdStubBuffer_Release, "CStdStubBuffer_Release");
   pragma Import
     (Stdcall,
      NdrCStdStubBuffer_Release,
      "NdrCStdStubBuffer_Release");
   pragma Import (Stdcall, CStdStubBuffer_Connect, "CStdStubBuffer_Connect");
   pragma Import
     (Stdcall,
      CStdStubBuffer_Disconnect,
      "CStdStubBuffer_Disconnect");
   pragma Import (Stdcall, CStdStubBuffer_Invoke, "CStdStubBuffer_Invoke");
   pragma Import
     (Stdcall,
      CStdStubBuffer_IsIIDSupported,
      "CStdStubBuffer_IsIIDSupported");
   pragma Import
     (Stdcall,
      CStdStubBuffer_CountRefs,
      "CStdStubBuffer_CountRefs");
   pragma Import
     (Stdcall,
      CStdStubBuffer_DebugServerQueryInterface,
      "CStdStubBuffer_DebugServerQueryInterface");
   pragma Import
     (Stdcall,
      CStdStubBuffer_DebugServerRelease,
      "CStdStubBuffer_DebugServerRelease");
   pragma Import
     (Stdcall,
      CStdPSFactoryBuffer_QueryInterface,
      "CStdPSFactoryBuffer_QueryInterface");
   pragma Import
     (Stdcall,
      CStdPSFactoryBuffer_AddRef,
      "CStdPSFactoryBuffer_AddRef");
   pragma Import
     (Stdcall,
      CStdPSFactoryBuffer_Release,
      "CStdPSFactoryBuffer_Release");
   pragma Import
     (Stdcall,
      CStdPSFactoryBuffer_CreateProxy,
      "CStdPSFactoryBuffer_CreateProxy");
   pragma Import
     (Stdcall,
      CStdPSFactoryBuffer_CreateStub,
      "CStdPSFactoryBuffer_CreateStub");
   pragma Import (Stdcall, GetProxyDllInfo, "GetProxyDllInfo");
   pragma Import (Stdcall, NdrDllGetClassObject, "NdrDllGetClassObject");
   pragma Import (Stdcall, NdrDllCanUnloadNow, "NdrDllCanUnloadNow");

end Win32.Rpcproxy;
