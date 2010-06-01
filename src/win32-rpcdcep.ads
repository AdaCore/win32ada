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

with Win32.Rpc;
with Win32.Rpcdce;

package Win32.Rpcdcep is

   RPC_NCA_FLAGS_DEFAULT    : constant := 16#0#;
   RPC_NCA_FLAGS_IDEMPOTENT : constant := 16#1#;
   RPC_NCA_FLAGS_BROADCAST  : constant := 16#2#;
   RPC_NCA_FLAGS_MAYBE      : constant := 16#4#;
   RPCFLG_ASYNCHRONOUS      : constant := 16#40000000#;
   RPCFLG_INPUT_SYNCHRONOUS : constant := 16#20000000#;
   RPC_FLAGS_VALID_BIT      : constant := 16#8000#;
   TRANSPORT_TYPE_CN        : constant := 16#1#;
   TRANSPORT_TYPE_DG        : constant := 16#2#;
   TRANSPORT_TYPE_LPC       : constant := 16#4#;

   type I_RPC_MUTEX is new Win32.PVOID;

   type RPC_VERSION;
   type RPC_SYNTAX_IDENTIFIER;
   type RPC_MESSAGE;
   type RPC_DISPATCH_TABLE;
   type RPC_PROTSEQ_ENDPOINT;
   type RPC_SERVER_INTERFACE;
   type RPC_CLIENT_INTERFACE;
   type RPC_TRANSFER_SYNTAX;

   type PRPC_SYNTAX_IDENTIFIER is access all RPC_SYNTAX_IDENTIFIER;
   type PRPC_MESSAGE is access all RPC_MESSAGE;
   type PRPC_DISPATCH_TABLE is access all RPC_DISPATCH_TABLE;
   type PRPC_PROTSEQ_ENDPOINT is access all RPC_PROTSEQ_ENDPOINT;
   type PRPC_SERVER_INTERFACE is access all RPC_SERVER_INTERFACE;
   type PRPC_CLIENT_INTERFACE is access all RPC_CLIENT_INTERFACE;

   type RPC_VERSION is record
      MajorVersion : Win32.USHORT;
      MinorVersion : Win32.USHORT;
   end record;

   type RPC_SYNTAX_IDENTIFIER is record
      SyntaxGUID    : Win32.Rpcdce.GUID;
      SyntaxVersion : RPC_VERSION;
   end record;

   type PRPC_MGR_EPV is access all Win32.Rpcdce.RPC_MGR_EPV;

   type RPC_MESSAGE is record
      Handle                  : Win32.Rpcdce.RPC_BINDING_HANDLE;
      DataRepresentation      : Win32.ULONG;
      Buffer                  : Win32.PVOID;
      BufferLength            : Win32.UINT;
      ProcNum                 : Win32.UINT;
      TransferSyntax          : PRPC_SYNTAX_IDENTIFIER;
      RpcInterfaceInformation : Win32.PVOID;
      ReservedForRuntime      : Win32.PVOID;
      ManagerEpv              : PRPC_MGR_EPV;
      ImportContext           : Win32.PVOID;
      RpcFlags                : Win32.ULONG;
   end record;

   type RPC_FORWARD_FUNCTION is access function
     (InterfaceId      : access Win32.Rpcdce.UUID;
      InterfaceVersion : access RPC_VERSION;
      ObjectId         : access Win32.Rpcdce.UUID;
      Rpcpro           : Win32.PUCHAR;
      ppDestEndpoint   : access Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;
   pragma Convention (Stdcall, RPC_FORWARD_FUNCTION);

   type RPC_DISPATCH_FUNCTION is access procedure (Message : PRPC_MESSAGE);
   pragma Convention (Stdcall, RPC_DISPATCH_FUNCTION);

   type RPC_DISPATCH_TABLE is record
      DispatchTableCount : Win32.UINT;
      DispatchTable      : RPC_DISPATCH_FUNCTION;
      Reserved           : Win32.INT;
   end record;

   type RPC_PROTSEQ_ENDPOINT is record
      RpcProtocolSequence : Win32.PUCHAR;
      Endpoint            : Win32.PUCHAR;
   end record;

   type RPC_SERVER_INTERFACE is record
      Length                  : Win32.UINT;
      InterfaceId             : RPC_SYNTAX_IDENTIFIER;
      TransferSyntax          : RPC_SYNTAX_IDENTIFIER;
      DispatchTable           : PRPC_DISPATCH_TABLE;
      RpcProtseqEndpointCount : Win32.UINT;
      RpcProtseqEndpoint      : PRPC_PROTSEQ_ENDPOINT;
      DefaultManagerEpv       : PRPC_MGR_EPV;
      InterpreterInfo         : Win32.PVOID;
   end record;

   type RPC_CLIENT_INTERFACE is record
      Length                  : Win32.UINT;
      InterfaceId             : RPC_SYNTAX_IDENTIFIER;
      TransferSyntax          : RPC_SYNTAX_IDENTIFIER;
      DispatchTable           : PRPC_DISPATCH_TABLE;
      RpcProtseqEndpointCount : Win32.UINT;
      RpcProtseqEndpoint      : PRPC_PROTSEQ_ENDPOINT;
      Reserved                : Win32.ULONG;
      InterpreterInfo         : Win32.PVOID;
   end record;

   type PRPC_RUNDOWN is access procedure (AssociationContext : Win32.PVOID);
   pragma Convention (Stdcall, PRPC_RUNDOWN);

   type RPC_TRANSFER_SYNTAX is record
      Uuid      : Win32.Rpcdce.UUID;
      VersMajor : Win32.USHORT;
      VersMinor : Win32.USHORT;
   end record;

   function I_RpcGetBuffer
     (Message : access RPC_MESSAGE)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcSendReceive
     (Message : access RPC_MESSAGE)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcFreeBuffer
     (Message : access RPC_MESSAGE)
      return Win32.Rpc.RPC_STATUS;

   procedure I_RpcRequestMutex (Mutex : access I_RPC_MUTEX);

   procedure I_RpcClearMutex (Mutex : I_RPC_MUTEX);

   procedure I_RpcDeleteMutex (Mutex : I_RPC_MUTEX);

   function I_RpcAllocate (Size : Win32.UINT) return Win32.PVOID;

   procedure I_RpcFree (Object : Win32.PVOID);

   procedure I_RpcPauseExecution (Milliseconds : Win32.ULONG);

   function I_RpcMonitorAssociation
     (Handle         : Win32.Rpcdce.RPC_BINDING_HANDLE;
      RundownRoutine : PRPC_RUNDOWN;
      Context        : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcStopMonitorAssociation
     (Handle : Win32.Rpcdce.RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcGetCurrentCallHandle return Win32.Rpcdce.RPC_BINDING_HANDLE;

   function I_RpcGetAssociationContext
     (AssociationContext : access Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcSetAssociationContext
     (AssociationContext : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcNsBindingSetEntryName
     (Binding         : Win32.Rpcdce.RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcBindingInqDynamicEndpoint
     (Binding         : Win32.Rpcdce.RPC_BINDING_HANDLE;
      DynamicEndpoint : access Win32.PUSHORT)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcBindingInqTransportType
     (Binding : Win32.Rpcdce.RPC_BINDING_HANDLE;
      c_Type  : access Win32.UINT)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcIfInqTransferSyntaxes
     (RpcIfHandle         : Win32.Rpcdce.RPC_IF_HANDLE;
      TransferSyntaxes    : access RPC_TRANSFER_SYNTAX;
      TransferSyntaxSize  : Win32.UINT;
      TransferSyntaxCount : access Win32.UINT)
      return Win32.Rpc.RPC_STATUS;

   function I_UuidCreate
     (Uuid : access Win32.Rpcdce.UUID)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcBindingCopy
     (SourceBinding      : Win32.Rpcdce.RPC_BINDING_HANDLE;
      DestinationBinding : access Win32.Rpcdce.RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcBindingIsClientLocal
     (BindingHandle   : Win32.Rpcdce.RPC_BINDING_HANDLE;
      ClientLocalFlag : access Win32.UINT)
      return Win32.Rpc.RPC_STATUS;

   procedure I_RpcSsDontSerializeContext;

   function I_RpcServerRegisterForwardFunction
     (pForwardFunction : RPC_FORWARD_FUNCTION)
      return Win32.Rpc.RPC_STATUS;

private

   pragma Convention (C_Pass_By_Copy, RPC_VERSION);
   pragma Convention (C, RPC_SYNTAX_IDENTIFIER);
   pragma Convention (C, RPC_MESSAGE);
   pragma Convention (C_Pass_By_Copy, RPC_DISPATCH_TABLE);
   pragma Convention (C_Pass_By_Copy, RPC_PROTSEQ_ENDPOINT);
   pragma Convention (C, RPC_SERVER_INTERFACE);
   pragma Convention (C, RPC_CLIENT_INTERFACE);
   pragma Convention (C, RPC_TRANSFER_SYNTAX);

   pragma Import (Stdcall, I_RpcGetBuffer, "I_RpcGetBuffer");
   pragma Import (Stdcall, I_RpcSendReceive, "I_RpcSendReceive");
   pragma Import (Stdcall, I_RpcFreeBuffer, "I_RpcFreeBuffer");
   pragma Import (Stdcall, I_RpcRequestMutex, "I_RpcRequestMutex");
   pragma Import (Stdcall, I_RpcClearMutex, "I_RpcClearMutex");
   pragma Import (Stdcall, I_RpcDeleteMutex, "I_RpcDeleteMutex");
   pragma Import (Stdcall, I_RpcAllocate, "I_RpcAllocate");
   pragma Import (Stdcall, I_RpcFree, "I_RpcFree");
   pragma Import (Stdcall, I_RpcPauseExecution, "I_RpcPauseExecution");
   pragma Import
     (Stdcall,
      I_RpcMonitorAssociation,
      "I_RpcMonitorAssociation");
   pragma Import
     (Stdcall,
      I_RpcStopMonitorAssociation,
      "I_RpcStopMonitorAssociation");
   pragma Import
     (Stdcall,
      I_RpcGetCurrentCallHandle,
      "I_RpcGetCurrentCallHandle");
   pragma Import
     (Stdcall,
      I_RpcGetAssociationContext,
      "I_RpcGetAssociationContext");
   pragma Import
     (Stdcall,
      I_RpcSetAssociationContext,
      "I_RpcSetAssociationContext");
   pragma Import
     (Stdcall,
      I_RpcNsBindingSetEntryName,
      "I_RpcNsBindingSetEntryName");
   pragma Import
     (Stdcall,
      I_RpcBindingInqDynamicEndpoint,
      "I_RpcBindingInqDynamicEndpoint");
   pragma Import
     (Stdcall,
      I_RpcBindingInqTransportType,
      "I_RpcBindingInqTransportType");
   pragma Import
     (Stdcall,
      I_RpcIfInqTransferSyntaxes,
      "I_RpcIfInqTransferSyntaxes");
   pragma Import (Stdcall, I_UuidCreate, "I_UuidCreate");
   pragma Import (Stdcall, I_RpcBindingCopy, "I_RpcBindingCopy");
   pragma Import
     (Stdcall,
      I_RpcBindingIsClientLocal,
      "I_RpcBindingIsClientLocal");
   pragma Import
     (Stdcall,
      I_RpcSsDontSerializeContext,
      "I_RpcSsDontSerializeContext");
   pragma Import
     (Stdcall,
      I_RpcServerRegisterForwardFunction,
      "I_RpcServerRegisterForwardFunction");

end Win32.Rpcdcep;
