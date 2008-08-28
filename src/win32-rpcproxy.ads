--  $Source$
--  $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
--  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
--  FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
--  the accuracy and the use of this file.  This file may be used, copied,
--  modified and distributed only by licensees of Microsoft Corporation's
--  WIN32 Software Development Kit in accordance with the terms of the
--  licensee's End-User License Agreement for Microsoft Software for the
--  WIN32 Development Kit.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Portions (c) 1985-1994 Microsoft Corporation with permission.
--  Microsoft is a registered trademark and Windows and Windows NT are
--  trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

with Win32.Objbase;
with Win32.Rpcdcep;
with Win32.Rpcndr;

package Win32.Rpcproxy is

   type PCInterfaceName is new Win32.PCCHAR;               --  rpcproxy.h:33
   type ac_PCInterfaceName_t is access all PCInterfaceName;
   --  rpcproxy.h:40

   type ProxyFileInfo;                                     --  rpcproxy.h:36
   type CInterfaceProxyHeader;                             --  rpcproxy.h:96
   type CInterfaceStubHeader;                              --  rpcproxy.h:117
   type CStdStubBuffer;                                    --  rpcproxy.h:131
   type CStdPSFactoryBuffer;                               --  rpcproxy.h:138
   type CStdProxyBuffer;                                   --  rpcproxy.h:146
   type CInterfaceStubVtbl;                                --  rpcproxy.h:28
   type CInterfaceProxyVtbl;                               --  rpcproxy.h:29

   type PCInterfaceStubVtblList is access all CInterfaceStubVtbl;
   --  rpcproxy.h:31
   type PCInterfaceProxyVtblList is access all CInterfaceProxyVtbl;
   --  rpcproxy.h:32
   type ac_PCInterfaceProxyVtblList_t is
     access all PCInterfaceProxyVtblList;        --  rpcproxy.h:38
   type ac_MIDL_SERVER_INFO_t is access all Win32.Rpcndr.MIDL_SERVER_INFO;
   --  rpcproxy.h:120
   type ac_IRpcStubBufferVtbl_t is
     access all Win32.Objbase.IRpcStubBufferVtbl; --  rpcproxy.h:133
   type ac_IPSFactoryBufferVtbl_t is
     access all Win32.Objbase.IPSFactoryBufferVtbl;
   --  rpcproxy.h:140
   type ac_ProxyFileInfo_t is access all ProxyFileInfo;
   --  rpcproxy.h:142
   type ac_ac_ProxyFileInfo_t is access all ac_ProxyFileInfo_t;
   --  rpcproxy.h:142
   type ac_IRpcProxyBufferVtbl_t is
     access all Win32.Objbase.IRpcProxyBufferVtbl;
   --  rpcproxy.h:148
   type a_CStdPSFactoryBuffer_t is access all CStdPSFactoryBuffer;
   --  rpcproxy.h:153
   type a_CStdProxyBuffer_t is access all CStdProxyBuffer;
   --  rpcproxy.h:158
   type a_ProxyFileInfo_t is access all ProxyFileInfo;     --  rpcproxy.h:142
   type a_a_ProxyFileInfo_t is access all a_ProxyFileInfo_t;
   --  rpcproxy.h:300
   type ac_ac_ac_ProxyFileInfo_t is access all ac_ac_ProxyFileInfo_t;
   --  rpcproxy.h:309

   type ProxyFileInfo is                                   --  rpcproxy.h:36
      record
         pProxyVtblList : ac_PCInterfaceProxyVtblList_t;  --  rpcproxy.h:38
         pStubVtblList : ac_PCInterfaceProxyVtblList_t;  --  rpcproxy.h:39
         pNamesArray : ac_PCInterfaceName_t;           --  rpcproxy.h:40
         Filler1 : Win32.ULONG;                    --  rpcproxy.h:41
         Filler2 : Win32.ULONG;                    --  rpcproxy.h:42
         Filler3 : Win32.ULONG;                    --  rpcproxy.h:43
      end record;

   subtype ExtendedProxyFileInfo is ProxyFileInfo;         --  rpcproxy.h:47

   type CInterfaceProxyHeader is                           --  rpcproxy.h:96
      record
         piid : Win32.Objbase.LPIID;                      --  rpcproxy.h:98
      end record;

   type PRPC_STUB_FUNCTION is access procedure
     (This : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : access Win32.DWORD);     --  rpcproxy.h:111
   pragma Convention (Stdcall, PRPC_STUB_FUNCTION);

   type ac_PRPC_STUB_FUNCTION_t is access all PRPC_STUB_FUNCTION;

   type CInterfaceStubHeader is                            --  rpcproxy.h:117
      record
         piid : Win32.Objbase.LPIID;        --  rpcproxy.h:119
         pServerInfo : ac_MIDL_SERVER_INFO_t;      --  rpcproxy.h:120
         DispatchTableCount : Win32.ULONG;                --  rpcproxy.h:121
         pDispatchTable : ac_PRPC_STUB_FUNCTION_t;    --  rpcproxy.h:122
      end record;

   type CStdStubBuffer is                                  --  rpcproxy.h:131
      record
         lpVtbl : ac_IRpcStubBufferVtbl_t;        --  rpcproxy.h:133
         RefCount : Win32.LONG;                     --  rpcproxy.h:134
         pvServerObject : Win32.Objbase.LPUNKNOWN;
         --  rpcproxy.h:135
      end record;

   type CStdPSFactoryBuffer is                             --  rpcproxy.h:138
      record
         lpVtbl : ac_IPSFactoryBufferVtbl_t;
         --  rpcproxy.h:140
         RefCount : Win32.LONG;             --  rpcproxy.h:141
         pProxyFileList : ac_ac_ProxyFileInfo_t;  --  rpcproxy.h:142
         pCLSID_PSFactoryBuffer : Win32.Objbase.LPIID;    --  rpcproxy.h:143
      end record;

   type a_IRpcChannelBuffer_t is access all Win32.Objbase.IRpcChannelBuffer;
   --  rpcproxy.h:151

   type CStdProxyBuffer is                                 --  rpcproxy.h:146
      record
         lpVtbl : ac_IRpcProxyBufferVtbl_t;           --  rpcproxy.h:148
         RefCount : Win32.LONG;                         --  rpcproxy.h:149
         punkOuter : Win32.Objbase.LPUNKNOWN;            --  rpcproxy.h:150
         pChannel : a_IRpcChannelBuffer_t;              --  rpcproxy.h:151
         pProxyVtbl : Win32.PCVOID;                       --  rpcproxy.h:152
         pPSFactory : a_CStdPSFactoryBuffer_t;            --  rpcproxy.h:153
      end record;

   type CInterfaceStubVtbl is                              --  rpcproxy.h:28
      record
         header : CInterfaceStubHeader;                   --  rpcproxy.h:127
         Vtbl : Win32.Objbase.IRpcStubBufferVtbl;       --  rpcproxy.h:128
      end record;

   type CInterfaceProxyVtbl is                             --  rpcproxy.h:29
      record
         header : CInterfaceProxyHeader;                  --  rpcproxy.h:104
         Vtbl : Win32.PVOID_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  rpcproxy.h:105
      end record;

   CLSID_PSFactoryBuffer : Win32.Objbase.CLSID;             --  rpcproxy.h:298
   pProxyFileList : a_a_ProxyFileInfo_t;             --  rpcproxy.h:300

   function NdrGetProxyBuffer
     (pThis : Win32.PVOID)
     return a_CStdProxyBuffer_t;                  --  rpcproxy.h:158

   function NdrGetProxyIID
     (pThis : Win32.PVOID)
     return Win32.Objbase.LPIID;                  --  rpcproxy.h:161

   procedure NdrProxyInitialize
     (pThis : Win32.PVOID;
      pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : Win32.Rpcndr.PMIDL_STUB_MESSAGE;
      pStubDescriptor : Win32.Rpcndr.PMIDL_STUB_DESC;
      ProcNum : Win32.UINT);               --  rpcproxy.h:164

   procedure NdrProxyGetBuffer
     (pThis : Win32.PVOID;
      pStubMsg : Win32.Rpcndr.PMIDL_STUB_MESSAGE); --  rpcproxy.h:172

   function NdrGetStubIID
     (pThis : Win32.PVOID)
     return Win32.Objbase.LPIID;                  --  rpcproxy.h:177

   procedure NdrProxySendReceive
     (pThis : Win32.PVOID;
      pStubMsg : access Win32.Rpcndr.MIDL_STUB_MESSAGE);
   --  rpcproxy.h:181

   procedure NdrProxyFreeBuffer
     (pThis : Win32.PVOID;
      pStubMsg : access Win32.Rpcndr.MIDL_STUB_MESSAGE);
   --  rpcproxy.h:186

   function NdrProxyErrorHandler
     (dwExceptionCode : Win32.DWORD)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:191

   procedure NdrStubInitialize
     (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : Win32.Rpcndr.PMIDL_STUB_MESSAGE;
      pStubDescriptor : Win32.Rpcndr.PMIDL_STUB_DESC;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer);
   --  rpcproxy.h:195

   procedure NdrStubGetBuffer
     (This : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pStubMsg : Win32.Rpcndr.PMIDL_STUB_MESSAGE);
   --  rpcproxy.h:202

   function NdrStubErrorHandler
     (dwExceptionCode : Win32.DWORD)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:208

   function CStdProxyBuffer_QueryInterface
     (pThis : access Win32.Objbase.IRpcProxyBuffer;
      riid : Win32.Objbase.REFIID;
      ppv : access Win32.PVOID)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:212

   function CStdProxyBuffer_AddRef
     (pThis : access Win32.Objbase.IRpcProxyBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:215

   function CStdProxyBuffer_Release
     (pThis : access Win32.Objbase.IRpcProxyBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:218

   function CStdProxyBuffer_Connect
     (pThis : access Win32.Objbase.IRpcProxyBuffer;
      pChannel : access Win32.Objbase.IRpcChannelBuffer)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:221

   procedure CStdProxyBuffer_Disconnect
     (pThis : access Win32.Objbase.IRpcProxyBuffer);
   --  rpcproxy.h:224

   function CStdStubBuffer_QueryInterface
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      riid : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:227

   function CStdStubBuffer_AddRef
     (pthis : access Win32.Objbase.IRpcStubBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:230

   function CStdStubBuffer_Release
     (pthis : access Win32.Objbase.IRpcStubBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:233

   function NdrCStdStubBuffer_Release
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      pPSF : access Win32.Objbase.IPSFactoryBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:236

   function CStdStubBuffer_Connect
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      pUnkServer : access Win32.Objbase.IUnknown)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:239

   procedure CStdStubBuffer_Disconnect
     (pthis : access Win32.Objbase.IRpcStubBuffer); --  rpcproxy.h:242

   function CStdStubBuffer_Invoke
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      prpcmsg : access Win32.Objbase.RPCOLEMESSAGE;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:245

   function CStdStubBuffer_IsIIDSupported
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      riid : Win32.Objbase.REFIID)
     return Win32.Objbase.a_IRpcStubBuffer_t;     --  rpcproxy.h:248

   function CStdStubBuffer_CountRefs
     (pthis : access Win32.Objbase.IRpcStubBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:251

   function CStdStubBuffer_DebugServerQueryInterface
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      ppv : access Win32.PVOID)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:254

   procedure CStdStubBuffer_DebugServerRelease
     (pthis : access Win32.Objbase.IRpcStubBuffer;
      pv : Win32.PVOID);                        --  rpcproxy.h:257

   function CStdPSFactoryBuffer_QueryInterface
     (This : access Win32.Objbase.IPSFactoryBuffer;
      iid : access Win32.Objbase.IID;
      ppv : access Win32.PVOID)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:260

   function CStdPSFactoryBuffer_AddRef
     (This : access Win32.Objbase.IPSFactoryBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:266

   function CStdPSFactoryBuffer_Release
     (This : access Win32.Objbase.IPSFactoryBuffer)
     return Win32.ULONG;                          --  rpcproxy.h:270

   function CStdPSFactoryBuffer_CreateProxy
     (This : access Win32.Objbase.IPSFactoryBuffer;
      punkOuter : access Win32.Objbase.IUnknown;
      riid : Win32.Objbase.REFIID;
      ppProxy : access Win32.Objbase.PIRpcProxyBuffer;
      ppv : access Win32.PVOID)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:274

   function CStdPSFactoryBuffer_CreateStub
     (This : access Win32.Objbase.IPSFactoryBuffer;
      riid : Win32.Objbase.REFIID;
      punkServer : access Win32.Objbase.IUnknown;
      ppStub : access Win32.Objbase.IRpcStubBuffer)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:284

   procedure GetProxyDllInfo
     (ppProxyFileList : ac_ac_ac_ProxyFileInfo_t;
      lpclsid : access Win32.Objbase.LPCLSID);
   --  rpcproxy.h:309

   function NdrDllGetClassObject
     (rclsid : Win32.Objbase.REFCLSID;
      riid : Win32.Objbase.REFIID;
      ppv : access Win32.LPVOID;
      pProxyFileList : ac_ac_ProxyFileInfo_t;
      piid : access Win32.Objbase.IID;
      pPSFactory : a_CStdPSFactoryBuffer_t)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:315

   function NdrDllCanUnloadNow
     (pPSFactory : a_CStdPSFactoryBuffer_t)
     return Win32.Objbase.HRESULT;                --  rpcproxy.h:317

private

   pragma Convention (C, ProxyFileInfo);                    --  rpcproxy.h:36
   pragma Convention (C_Pass_By_Copy, CInterfaceProxyHeader);
   --  rpcproxy.h:96
   pragma Convention (C_Pass_By_Copy, CInterfaceStubHeader);
   --  rpcproxy.h:117
   pragma Convention (C_Pass_By_Copy, CStdStubBuffer);
   --  rpcproxy.h:131
   pragma Convention (C_Pass_By_Copy, CStdPSFactoryBuffer);
   --  rpcproxy.h:138
   pragma Convention (C, CStdProxyBuffer);                  --  rpcproxy.h:146
   pragma Convention (C, CInterfaceStubVtbl);               --  rpcproxy.h:28
   pragma Convention (C_Pass_By_Copy, CInterfaceProxyVtbl);
   --  rpcproxy.h:29

   pragma Import (Stdcall, CLSID_PSFactoryBuffer, "CLSID_PSFactoryBuffer");
   --  rpcproxy.h:298
   pragma Import (Stdcall, pProxyFileList, "pProxyFileList");
   --  rpcproxy.h:300

   pragma Import (Stdcall, NdrGetProxyBuffer, "NdrGetProxyBuffer");
   --  rpcproxy.h:158
   pragma Import (Stdcall, NdrGetProxyIID, "NdrGetProxyIID");
   --  rpcproxy.h:161
   pragma Import (Stdcall, NdrProxyInitialize, "NdrProxyInitialize");
   --  rpcproxy.h:164
   pragma Import (Stdcall, NdrProxyGetBuffer, "NdrProxyGetBuffer");
   --  rpcproxy.h:172
   pragma Import (Stdcall, NdrGetStubIID, "NdrGetStubIID");
   --  rpcproxy.h:177
   pragma Import (Stdcall, NdrProxySendReceive, "NdrProxySendReceive");
   --  rpcproxy.h:181
   pragma Import (Stdcall, NdrProxyFreeBuffer, "NdrProxyFreeBuffer");
   --  rpcproxy.h:186
   pragma Import (Stdcall, NdrProxyErrorHandler, "NdrProxyErrorHandler");
   --  rpcproxy.h:191
   pragma Import (Stdcall, NdrStubInitialize, "NdrStubInitialize");
   --  rpcproxy.h:195
   pragma Import (Stdcall, NdrStubGetBuffer, "NdrStubGetBuffer");
   --  rpcproxy.h:202
   pragma Import (Stdcall, NdrStubErrorHandler, "NdrStubErrorHandler");
   --  rpcproxy.h:208
   pragma Import (Stdcall, CStdProxyBuffer_QueryInterface,
                    "CStdProxyBuffer_QueryInterface");     --  rpcproxy.h:212
   pragma Import (Stdcall, CStdProxyBuffer_AddRef, "CStdProxyBuffer_AddRef");
   --  rpcproxy.h:215
   pragma Import (Stdcall, CStdProxyBuffer_Release, "CStdProxyBuffer_Release");
   --  rpcproxy.h:218
   pragma Import (Stdcall, CStdProxyBuffer_Connect, "CStdProxyBuffer_Connect");
   --  rpcproxy.h:221
   pragma Import (Stdcall, CStdProxyBuffer_Disconnect,
                    "CStdProxyBuffer_Disconnect");
   --  rpcproxy.h:224
   pragma Import (Stdcall, CStdStubBuffer_QueryInterface,
                    "CStdStubBuffer_QueryInterface");      --  rpcproxy.h:227
   pragma Import (Stdcall, CStdStubBuffer_AddRef, "CStdStubBuffer_AddRef");
   --  rpcproxy.h:230
   pragma Import (Stdcall, CStdStubBuffer_Release, "CStdStubBuffer_Release");
   --  rpcproxy.h:233
   pragma Import (Stdcall, NdrCStdStubBuffer_Release,
                    "NdrCStdStubBuffer_Release");
   --  rpcproxy.h:236
   pragma Import (Stdcall, CStdStubBuffer_Connect, "CStdStubBuffer_Connect");
   --  rpcproxy.h:239
   pragma Import (Stdcall, CStdStubBuffer_Disconnect,
                    "CStdStubBuffer_Disconnect");
   --  rpcproxy.h:242
   pragma Import (Stdcall, CStdStubBuffer_Invoke, "CStdStubBuffer_Invoke");
   --  rpcproxy.h:245
   pragma Import (Stdcall, CStdStubBuffer_IsIIDSupported,
                    "CStdStubBuffer_IsIIDSupported");      --  rpcproxy.h:248
   pragma Import (Stdcall, CStdStubBuffer_CountRefs,
                    "CStdStubBuffer_CountRefs");
   --  rpcproxy.h:251
   pragma Import (Stdcall, CStdStubBuffer_DebugServerQueryInterface,
                    "CStdStubBuffer_DebugServerQueryInterface");
   --  rpcproxy.h:254
   pragma Import (Stdcall, CStdStubBuffer_DebugServerRelease,
                    "CStdStubBuffer_DebugServerRelease");  --  rpcproxy.h:257
   pragma Import (Stdcall, CStdPSFactoryBuffer_QueryInterface,
                    "CStdPSFactoryBuffer_QueryInterface"); --  rpcproxy.h:260
   pragma Import (Stdcall, CStdPSFactoryBuffer_AddRef,
                    "CStdPSFactoryBuffer_AddRef");
   --  rpcproxy.h:266
   pragma Import (Stdcall, CStdPSFactoryBuffer_Release,
                    "CStdPSFactoryBuffer_Release");        --  rpcproxy.h:270
   pragma Import (Stdcall, CStdPSFactoryBuffer_CreateProxy,
                    "CStdPSFactoryBuffer_CreateProxy");    --  rpcproxy.h:274
   pragma Import (Stdcall, CStdPSFactoryBuffer_CreateStub,
                    "CStdPSFactoryBuffer_CreateStub");     --  rpcproxy.h:284
   pragma Import (Stdcall, GetProxyDllInfo, "GetProxyDllInfo");
   --  rpcproxy.h:309
   pragma Import (Stdcall, NdrDllGetClassObject, "NdrDllGetClassObject");
   --  rpcproxy.h:315
   pragma Import (Stdcall, NdrDllCanUnloadNow, "NdrDllCanUnloadNow");
   --  rpcproxy.h:317

end Win32.Rpcproxy;
