--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-rpcdcep.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
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

with Win32.Rpc;
with Win32.Rpcdce;

package Win32.Rpcdcep is

   RPC_NCA_FLAGS_DEFAULT    : constant := 16#0#;        --  rpcdcep.h :77
   RPC_NCA_FLAGS_IDEMPOTENT : constant := 16#1#;        --  rpcdcep.h :78
   RPC_NCA_FLAGS_BROADCAST  : constant := 16#2#;        --  rpcdcep.h :79
   RPC_NCA_FLAGS_MAYBE      : constant := 16#4#;        --  rpcdcep.h :80
   RPCFLG_ASYNCHRONOUS      : constant := 16#40000000#; --  rpcdcep.h :81
   RPCFLG_INPUT_SYNCHRONOUS : constant := 16#20000000#; --  rpcdcep.h :82
   RPC_FLAGS_VALID_BIT      : constant := 16#8000#;     --  rpcdcep.h :89
   TRANSPORT_TYPE_CN        : constant := 16#1#;        --  rpcdcep.h :259
   TRANSPORT_TYPE_DG        : constant := 16#2#;        --  rpcdcep.h :260
   TRANSPORT_TYPE_LPC       : constant := 16#4#;        --  rpcdcep.h :261

   type I_RPC_MUTEX is new Win32.PVOID;                    --  rpcdcep.h :156

   type RPC_VERSION;                                       --  rpcdcep.h :40
   type RPC_SYNTAX_IDENTIFIER;                             --  rpcdcep.h :45
   type RPC_MESSAGE;                                       --  rpcdcep.h :50
   type RPC_DISPATCH_TABLE;                                --  rpcdcep.h :102
   type RPC_PROTSEQ_ENDPOINT;                              --  rpcdcep.h :104
   type RPC_SERVER_INTERFACE;                              --  rpcdcep.h :115
   type RPC_CLIENT_INTERFACE;                              --  rpcdcep.h :128
   type RPC_TRANSFER_SYNTAX;                               --  rpcdcep.h :269

   type PRPC_SYNTAX_IDENTIFIER is access all RPC_SYNTAX_IDENTIFIER;
   --  rpcdcep.h :48
   type PRPC_MESSAGE is access all RPC_MESSAGE;            --  rpcdcep.h :63
   type PRPC_DISPATCH_TABLE is access all RPC_DISPATCH_TABLE;
   --  rpcdcep.h :102
   type PRPC_PROTSEQ_ENDPOINT is access all RPC_PROTSEQ_ENDPOINT;
   --  rpcdcep.h :108
   type PRPC_SERVER_INTERFACE is access all RPC_SERVER_INTERFACE;
   --  rpcdcep.h :126
   type PRPC_CLIENT_INTERFACE is access all RPC_CLIENT_INTERFACE;
   --  rpcdcep.h :139

   type RPC_VERSION is                                     --  rpcdcep.h :40
      record
         MajorVersion : Win32.USHORT;                     --  rpcdcep.h :41
         MinorVersion : Win32.USHORT;                     --  rpcdcep.h :42
      end record;

   type RPC_SYNTAX_IDENTIFIER is                           --  rpcdcep.h :45
      record
         SyntaxGUID : Win32.Rpcdce.GUID;               --  rpcdcep.h :46
         SyntaxVersion : RPC_VERSION;                     --  rpcdcep.h :47
      end record;

   type PRPC_MGR_EPV is access all Win32.Rpcdce.RPC_MGR_EPV;
   --  rpcdcep.h :60

   type RPC_MESSAGE is                                     --  rpcdcep.h :50
      record
         Handle : Win32.Rpcdce.RPC_BINDING_HANDLE;
         --  rpcdcep.h :52
         DataRepresentation : Win32.ULONG;           --  rpcdcep.h :53
         Buffer : Win32.PVOID;           --  rpcdcep.h :54
         BufferLength : Win32.UINT;            --  rpcdcep.h :55
         ProcNum : Win32.UINT;            --  rpcdcep.h :56
         TransferSyntax : PRPC_SYNTAX_IDENTIFIER; --  rpcdcep.h :57
         RpcInterfaceInformation : Win32.PVOID;           --  rpcdcep.h :58
         ReservedForRuntime : Win32.PVOID;           --  rpcdcep.h :59
         ManagerEpv : PRPC_MGR_EPV;          --  rpcdcep.h :60
         ImportContext : Win32.PVOID;           --  rpcdcep.h :61
         RpcFlags : Win32.ULONG;           --  rpcdcep.h :62
      end record;

   type RPC_FORWARD_FUNCTION is access function
     (InterfaceId : access Win32.Rpcdce.UUID;
      InterfaceVersion : access RPC_VERSION;
      ObjectId : access Win32.Rpcdce.UUID;
      Rpcpro : Win32.PUCHAR;
      ppDestEndpoint : access Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :66
   pragma Convention (Stdcall, RPC_FORWARD_FUNCTION);

   type RPC_DISPATCH_FUNCTION is access procedure
     (Message : PRPC_MESSAGE);                     --  rpcdcep.h :94
   pragma Convention (Stdcall, RPC_DISPATCH_FUNCTION);

   type RPC_DISPATCH_TABLE is                              --  rpcdcep.h :102
      record
         DispatchTableCount : Win32.UINT;                 --  rpcdcep.h :99
         DispatchTable : RPC_DISPATCH_FUNCTION;      --  rpcdcep.h :100
         Reserved : Win32.INT;                  --  rpcdcep.h :101
      end record;

   type RPC_PROTSEQ_ENDPOINT is                            --  rpcdcep.h :104
      record
         RpcProtocolSequence : Win32.PUCHAR;              --  rpcdcep.h :106
         Endpoint : Win32.PUCHAR;              --  rpcdcep.h :107
      end record;

   type RPC_SERVER_INTERFACE is                            --  rpcdcep.h :115
      record
         Length : Win32.UINT;            --  rpcdcep.h :117
         InterfaceId : RPC_SYNTAX_IDENTIFIER; --  rpcdcep.h :118
         TransferSyntax : RPC_SYNTAX_IDENTIFIER; --  rpcdcep.h :119
         DispatchTable : PRPC_DISPATCH_TABLE;   --  rpcdcep.h :120
         RpcProtseqEndpointCount : Win32.UINT;            --  rpcdcep.h :121
         RpcProtseqEndpoint : PRPC_PROTSEQ_ENDPOINT; --  rpcdcep.h :122
         DefaultManagerEpv : PRPC_MGR_EPV;          --  rpcdcep.h :123
         InterpreterInfo : Win32.PVOID;           --  rpcdcep.h :125
      end record;

   type RPC_CLIENT_INTERFACE is                            --  rpcdcep.h :128
      record
         Length : Win32.UINT;            --  rpcdcep.h :130
         InterfaceId : RPC_SYNTAX_IDENTIFIER; --  rpcdcep.h :131
         TransferSyntax : RPC_SYNTAX_IDENTIFIER; --  rpcdcep.h :132
         DispatchTable : PRPC_DISPATCH_TABLE;   --  rpcdcep.h :133
         RpcProtseqEndpointCount : Win32.UINT;            --  rpcdcep.h :134
         RpcProtseqEndpoint : PRPC_PROTSEQ_ENDPOINT; --  rpcdcep.h :135
         Reserved : Win32.ULONG;           --  rpcdcep.h :136
         InterpreterInfo : Win32.PVOID;           --  rpcdcep.h :138
      end record;

   type PRPC_RUNDOWN is access procedure
     (AssociationContext : Win32.PVOID);           --  rpcdcep.h :190
   pragma Convention (Stdcall, PRPC_RUNDOWN);

   type RPC_TRANSFER_SYNTAX is                             --  rpcdcep.h :269
      record
         Uuid : Win32.Rpcdce.UUID;                   --  rpcdcep.h :271
         VersMajor : Win32.USHORT;                        --  rpcdcep.h :272
         VersMinor : Win32.USHORT;                        --  rpcdcep.h :273
      end record;

   function I_RpcGetBuffer
     (Message : access RPC_MESSAGE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :142

   function I_RpcSendReceive
     (Message : access RPC_MESSAGE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :147

   function I_RpcFreeBuffer
     (Message : access RPC_MESSAGE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :152

   procedure I_RpcRequestMutex
     (Mutex : access I_RPC_MUTEX);                 --  rpcdcep.h :159

   procedure I_RpcClearMutex
     (Mutex : I_RPC_MUTEX);                        --  rpcdcep.h :164

   procedure I_RpcDeleteMutex
     (Mutex : I_RPC_MUTEX);                        --  rpcdcep.h :169

   function I_RpcAllocate
     (Size : Win32.UINT)
     return Win32.PVOID;                          --  rpcdcep.h :174

   procedure I_RpcFree
     (Object : Win32.PVOID);                       --  rpcdcep.h :179

   procedure I_RpcPauseExecution
     (Milliseconds : Win32.ULONG);                 --  rpcdcep.h :184

   function I_RpcMonitorAssociation
     (Handle : Win32.Rpcdce.RPC_BINDING_HANDLE;
      RundownRoutine : PRPC_RUNDOWN;
      Context : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :195

   function I_RpcStopMonitorAssociation
     (Handle : Win32.Rpcdce.RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :202

   function I_RpcGetCurrentCallHandle return Win32.Rpcdce.RPC_BINDING_HANDLE;
   --  rpcdcep.h :207

   function I_RpcGetAssociationContext
     (AssociationContext : access Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :212

   function I_RpcSetAssociationContext
     (AssociationContext : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :217

   function I_RpcNsBindingSetEntryName
     (Binding : Win32.Rpcdce.RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName : Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :224

   function I_RpcBindingInqDynamicEndpoint
     (Binding : Win32.Rpcdce.RPC_BINDING_HANDLE;
      DynamicEndpoint : access Win32.PUSHORT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :244

   function I_RpcBindingInqTransportType
     (Binding : Win32.Rpcdce.RPC_BINDING_HANDLE;
      c_Type : access Win32.UINT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :264

   function I_RpcIfInqTransferSyntaxes
     (RpcIfHandle : Win32.Rpcdce.RPC_IF_HANDLE;
      TransferSyntaxes : access RPC_TRANSFER_SYNTAX;
      TransferSyntaxSize : Win32.UINT;
      TransferSyntaxCount : access Win32.UINT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :277

   function I_UuidCreate
     (Uuid : access Win32.Rpcdce.UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :285

   function I_RpcBindingCopy
     (SourceBinding : Win32.Rpcdce.RPC_BINDING_HANDLE;
      DestinationBinding : access Win32.Rpcdce.RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :290

   function I_RpcBindingIsClientLocal
     (BindingHandle : Win32.Rpcdce.RPC_BINDING_HANDLE;
      ClientLocalFlag : access Win32.UINT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :296

   procedure I_RpcSsDontSerializeContext;                  --  rpcdcep.h :302

   function I_RpcServerRegisterForwardFunction
     (pForwardFunction : RPC_FORWARD_FUNCTION)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdcep.h :308

private

   pragma Convention (C_Pass_By_Copy, RPC_VERSION);         --  rpcdcep.h :40
   pragma Convention (C, RPC_SYNTAX_IDENTIFIER);            --  rpcdcep.h :45
   pragma Convention (C, RPC_MESSAGE);                      --  rpcdcep.h :50
   pragma Convention (C_Pass_By_Copy, RPC_DISPATCH_TABLE);   --  rpcdcep.h :102
   pragma Convention (C_Pass_By_Copy, RPC_PROTSEQ_ENDPOINT); --  rpcdcep.h :104
   pragma Convention (C, RPC_SERVER_INTERFACE);             --  rpcdcep.h :115
   pragma Convention (C, RPC_CLIENT_INTERFACE);             --  rpcdcep.h :128
   pragma Convention (C, RPC_TRANSFER_SYNTAX);              --  rpcdcep.h :269

   pragma Import (Stdcall, I_RpcGetBuffer, "I_RpcGetBuffer");
   --  rpcdcep.h :142
   pragma Import (Stdcall, I_RpcSendReceive, "I_RpcSendReceive");
   --  rpcdcep.h :147
   pragma Import (Stdcall, I_RpcFreeBuffer, "I_RpcFreeBuffer");
   --  rpcdcep.h :152
   pragma Import (Stdcall, I_RpcRequestMutex, "I_RpcRequestMutex");
   --  rpcdcep.h :159
   pragma Import (Stdcall, I_RpcClearMutex, "I_RpcClearMutex");
   --  rpcdcep.h :164
   pragma Import (Stdcall, I_RpcDeleteMutex, "I_RpcDeleteMutex");
   --  rpcdcep.h :169
   pragma Import (Stdcall, I_RpcAllocate, "I_RpcAllocate");  --  rpcdcep.h :174
   pragma Import (Stdcall, I_RpcFree, "I_RpcFree");          --  rpcdcep.h :179
   pragma Import (Stdcall, I_RpcPauseExecution, "I_RpcPauseExecution");
   --  rpcdcep.h :184
   pragma Import (Stdcall, I_RpcMonitorAssociation, "I_RpcMonitorAssociation");
   --  rpcdcep.h :195
   pragma Import (Stdcall, I_RpcStopMonitorAssociation,
                    "I_RpcStopMonitorAssociation");        --  rpcdcep.h :202
   pragma Import (Stdcall, I_RpcGetCurrentCallHandle,
                    "I_RpcGetCurrentCallHandle");
   --  rpcdcep.h :207
   pragma Import (Stdcall, I_RpcGetAssociationContext,
                    "I_RpcGetAssociationContext");
   --  rpcdcep.h :212
   pragma Import (Stdcall, I_RpcSetAssociationContext,
                    "I_RpcSetAssociationContext");
   --  rpcdcep.h :217
   pragma Import (Stdcall, I_RpcNsBindingSetEntryName,
                    "I_RpcNsBindingSetEntryName");
   --  rpcdcep.h :224
   pragma Import (Stdcall, I_RpcBindingInqDynamicEndpoint,
                    "I_RpcBindingInqDynamicEndpoint");     --  rpcdcep.h :244
   pragma Import (Stdcall, I_RpcBindingInqTransportType,
                    "I_RpcBindingInqTransportType");       --  rpcdcep.h :264
   pragma Import (Stdcall, I_RpcIfInqTransferSyntaxes,
                    "I_RpcIfInqTransferSyntaxes");
   --  rpcdcep.h :277
   pragma Import (Stdcall, I_UuidCreate, "I_UuidCreate");    --  rpcdcep.h :285
   pragma Import (Stdcall, I_RpcBindingCopy, "I_RpcBindingCopy");
   --  rpcdcep.h :290
   pragma Import (Stdcall, I_RpcBindingIsClientLocal,
                    "I_RpcBindingIsClientLocal");
   --  rpcdcep.h :296
   pragma Import (Stdcall, I_RpcSsDontSerializeContext,
                    "I_RpcSsDontSerializeContext");        --  rpcdcep.h :302
   pragma Import (Stdcall, I_RpcServerRegisterForwardFunction,
                    "I_RpcServerRegisterForwardFunction"); --  rpcdcep.h :308

end Win32.Rpcdcep;


