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

package Win32.Rpcdce is

   RPC_C_BINDING_INFINITE_TIMEOUT    : constant := 10;
   RPC_C_BINDING_MIN_TIMEOUT         : constant := 0;
   RPC_C_BINDING_DEFAULT_TIMEOUT     : constant := 5;
   RPC_C_BINDING_MAX_TIMEOUT         : constant := 9;
   RPC_C_CANCEL_INFINITE_TIMEOUT     : constant := -1;
   RPC_C_LISTEN_MAX_CALLS_DEFAULT    : constant := 1234;
   RPC_C_PROTSEQ_MAX_REQS_DEFAULT    : constant := 10;
   RPC_C_STATS_CALLS_IN              : constant := 0;
   RPC_C_STATS_CALLS_OUT             : constant := 1;
   RPC_C_STATS_PKTS_IN               : constant := 2;
   RPC_C_STATS_PKTS_OUT              : constant := 3;
   RPC_C_AUTHN_LEVEL_DEFAULT         : constant := 0;
   RPC_C_AUTHN_LEVEL_NONE            : constant := 1;
   RPC_C_AUTHN_LEVEL_CONNECT         : constant := 2;
   RPC_C_AUTHN_LEVEL_CALL            : constant := 3;
   RPC_C_AUTHN_LEVEL_PKT             : constant := 4;
   RPC_C_AUTHN_LEVEL_PKT_INTEGRITY   : constant := 5;
   RPC_C_AUTHN_LEVEL_PKT_PRIVACY     : constant := 6;
   RPC_C_PROTECT_LEVEL_DEFAULT       : constant := 0;
   RPC_C_PROTECT_LEVEL_NONE          : constant := 1;
   RPC_C_PROTECT_LEVEL_CONNECT       : constant := 2;
   RPC_C_PROTECT_LEVEL_CALL          : constant := 3;
   RPC_C_PROTECT_LEVEL_PKT           : constant := 4;
   RPC_C_PROTECT_LEVEL_PKT_INTEGRITY : constant := 5;
   RPC_C_PROTECT_LEVEL_PKT_PRIVACY   : constant := 6;
   RPC_C_AUTHN_NONE                  : constant := 0;
   RPC_C_AUTHN_DCE_PRIVATE           : constant := 1;
   RPC_C_AUTHN_DCE_PUBLIC            : constant := 2;
   RPC_C_AUTHN_DEC_PUBLIC            : constant := 4;
   RPC_C_AUTHN_WINNT                 : constant := 10;
   RPC_C_AUTHN_DEFAULT               : constant := 16#ffffffff#;
   SEC_WINNT_AUTH_IDENTITY_ANSI      : constant := 16#1#;
   SEC_WINNT_AUTH_IDENTITY_UNICODE   : constant := 16#2#;
   RPC_C_AUTHZ_NONE                  : constant := 0;
   RPC_C_AUTHZ_NAME                  : constant := 1;
   RPC_C_AUTHZ_DCE                   : constant := 2;
   DCE_C_ERROR_STRING_LEN            : constant := 256;
   RPC_C_EP_ALL_ELTS                 : constant := 0;
   RPC_C_EP_MATCH_BY_IF              : constant := 1;
   RPC_C_EP_MATCH_BY_OBJ             : constant := 2;
   RPC_C_EP_MATCH_BY_BOTH            : constant := 3;
   RPC_C_VERS_ALL                    : constant := 1;
   RPC_C_VERS_COMPATIBLE             : constant := 2;
   RPC_C_VERS_EXACT                  : constant := 3;
   RPC_C_VERS_MAJOR_ONLY             : constant := 4;
   RPC_C_VERS_UPTO                   : constant := 5;
   RPC_C_MGMT_INQ_IF_IDS             : constant := 0;
   RPC_C_MGMT_INQ_PRINC_NAME         : constant := 1;
   RPC_C_MGMT_INQ_STATS              : constant := 2;
   RPC_C_MGMT_IS_SERVER_LISTEN       : constant := 3;
   RPC_C_MGMT_STOP_SERVER_LISTEN     : constant := 4;

   subtype RPC_BINDING_HANDLE is Win32.Rpc.RPC_BINDING_HANDLE;
   subtype rpc_binding_handle_t is RPC_BINDING_HANDLE;
   subtype handle_t is RPC_BINDING_HANDLE;
   type RPC_IF_HANDLE is new RPC_BINDING_HANDLE;
   type RPC_MGR_EPV is new Win32.VOID;
   type RPC_AUTH_IDENTITY_HANDLE is new RPC_BINDING_HANDLE;
   type RPC_AUTHZ_HANDLE is new RPC_BINDING_HANDLE;
   type RPC_EP_INQ_HANDLE is access all Win32.Rpc.I_RPC_HANDLE;

   type GUID;
   type RPC_BINDING_VECTOR;
   type RPC_IF_ID;
   type RPC_PROTSEQ_VECTORA;
   type RPC_PROTSEQ_VECTORW;
   type RPC_STATS_VECTOR;
   type RPC_IF_ID_VECTOR;
   type SEC_WINNT_AUTH_IDENTITY_W;
   type SEC_WINNT_AUTH_IDENTITY_A;
   type RPC_CLIENT_INFORMATION1;

   type a_RPC_IF_ID_t is access all RPC_IF_ID;
   type a_RPC_BINDING_VECTOR_t is access all RPC_BINDING_VECTOR;
   type a_RPC_PROTSEQ_VECTORA_t is access all RPC_PROTSEQ_VECTORA;
   type a_RPC_PROTSEQ_VECTORW_t is access all RPC_PROTSEQ_VECTORW;
   type a_RPC_STATS_VECTOR_t is access all RPC_STATS_VECTOR;
   type PRPC_IF_ID_VECTOR is access all RPC_IF_ID_VECTOR;
   type PSEC_WINNT_AUTH_IDENTITY_W is access all SEC_WINNT_AUTH_IDENTITY_W;
   type PSEC_WINNT_AUTH_IDENTITY_A is access all SEC_WINNT_AUTH_IDENTITY_A;
   subtype PSEC_WINNT_AUTH_IDENTITY is PSEC_WINNT_AUTH_IDENTITY_A;
   type PRPC_CLIENT_INFORMATION1 is access all RPC_CLIENT_INFORMATION1;

   type GUID is record
      Data1 : Win32.ULONG;
      Data2 : Win32.USHORT;
      Data3 : Win32.USHORT;
      Data4 : Win32.CHAR_Array (0 .. 7);
   end record;

   subtype UUID is GUID;
   subtype uuid_t is UUID;
   type a_UUID_t is access all UUID;
   type UUID_VECTOR;

   type RPC_BINDING_HANDLE_Array is
     array (0 .. Win32.ANYSIZE_ARRAY) of aliased RPC_BINDING_HANDLE;

   type RPC_BINDING_VECTOR is record
      Count    : Win32.ULONG;
      BindingH : RPC_BINDING_HANDLE_Array;
   end record;

   subtype rpc_binding_vector_t is RPC_BINDING_VECTOR;

   type a_UUID_t_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased a_UUID_t;

   type UUID_VECTOR is record
      Count : Win32.ULONG;
      Uuid  : a_UUID_t_Array;
   end record;

   subtype uuid_vector_t is UUID_VECTOR;

   type RPC_IF_ID is record
      Uuid      : Win32.Rpcdce.UUID;
      VersMajor : Win32.USHORT;
      VersMinor : Win32.USHORT;
   end record;

   type PSTR_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased Win32.PSTR;

   type RPC_PROTSEQ_VECTORA is record
      Count   : Win32.UINT;
      Protseq : PSTR_Array;
   end record;

   subtype RPC_PROTSEQ_VECTOR is RPC_PROTSEQ_VECTORA;

   type PWSTR_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased Win32.PWSTR;

   type RPC_PROTSEQ_VECTORW is record
      Count   : Win32.UINT;
      Protseq : PWSTR_Array;
   end record;

   type RPC_OBJECT_INQ_FN is access procedure
     (ObjectUuid : access UUID;
      TypeUuid   : access UUID;
      Status     : access Win32.Rpc.RPC_STATUS);
   pragma Convention (Stdcall, RPC_OBJECT_INQ_FN);

   type RPC_STATS_VECTOR is record
      Count : Win32.UINT;
      Stats : Win32.LONG_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type a_RPC_IF_ID_t_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased a_RPC_IF_ID_t;

   type RPC_IF_ID_VECTOR is record
      Count : Win32.ULONG;
      IfId  : a_RPC_IF_ID_t_Array;
   end record;

   type SEC_WINNT_AUTH_IDENTITY_W is record
      User           : Win32.PWSTR;
      UserLength     : Win32.ULONG;
      Domain         : Win32.PWSTR;
      DomainLength   : Win32.ULONG;
      Password       : Win32.PWSTR;
      PasswordLength : Win32.ULONG;
      Flags          : Win32.ULONG;
   end record;

   type SEC_WINNT_AUTH_IDENTITY_A is record
      User           : Win32.PSTR;
      UserLength     : Win32.ULONG;
      Domain         : Win32.PSTR;
      DomainLength   : Win32.ULONG;
      Password       : Win32.PSTR;
      PasswordLength : Win32.ULONG;
      Flags          : Win32.ULONG;
   end record;

   subtype SEC_WINNT_AUTH_IDENTITY is SEC_WINNT_AUTH_IDENTITY_A;

   type RPC_AUTH_KEY_RETRIEVAL_FN is access procedure
     (Arg             : Win32.PVOID;
      ServerPrincName : Win32.PWSTR;
      KeyVer          : Win32.ULONG;
      Key             : access Win32.PVOID;
      Status          : access Win32.Rpc.RPC_STATUS);
   pragma Convention (Stdcall, RPC_AUTH_KEY_RETRIEVAL_FN);

   type RPC_CLIENT_INFORMATION1 is record
      UserName     : Win32.PUCHAR;
      ComputerName : Win32.PUCHAR;
      Privilege    : Win32.USHORT;
      AuthFlags    : Win32.ULONG;
   end record;

   type RPC_MGMT_AUTHORIZATION_FN is access function
     (ClientBinding          : RPC_BINDING_HANDLE;
      RequestedMgmtOperation : Win32.ULONG;
      Status                 : access Win32.Rpc.RPC_STATUS)
      return Win32.INT;
   pragma Convention (Stdcall, RPC_MGMT_AUTHORIZATION_FN);

   function RpcBindingCopy
     (SourceBinding      : RPC_BINDING_HANDLE;
      DestinationBinding : access RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingFree
     (Binding : access RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingFromStringBindingA
     (StringBinding : Win32.PUCHAR;
      Binding       : access RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingFromStringBinding
     (StringBinding : Win32.PUCHAR;
      Binding       : access RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS renames
     RpcBindingFromStringBindingA;

   function RpcBindingFromStringBindingW
     (StringBinding : Win32.PWSTR;
      Binding       : access RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingInqObject
     (Binding    : RPC_BINDING_HANDLE;
      ObjectUuid : access UUID)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingReset
     (Binding : RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingSetObject
     (Binding    : RPC_BINDING_HANDLE;
      ObjectUuid : access UUID)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtInqDefaultProtectLevel
     (AuthnSvc   : Win32.ULONG;
      AuthnLevel : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingToStringBindingA
     (Binding       : RPC_BINDING_HANDLE;
      StringBinding : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingToStringBinding
     (Binding       : RPC_BINDING_HANDLE;
      StringBinding : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcBindingToStringBindingA;

   function RpcBindingToStringBindingW
     (Binding       : RPC_BINDING_HANDLE;
      StringBinding : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingVectorFree
     (BindingVector : access a_RPC_BINDING_VECTOR_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcStringBindingComposeA
     (ObjUuid       : Win32.PUCHAR;
      Protseq       : Win32.PUCHAR;
      NetworkAddr   : Win32.PUCHAR;
      Endpoint      : Win32.PUCHAR;
      Options       : Win32.PUCHAR;
      StringBinding : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcStringBindingCompose
     (ObjUuid       : Win32.PUCHAR;
      Protseq       : Win32.PUCHAR;
      NetworkAddr   : Win32.PUCHAR;
      Endpoint      : Win32.PUCHAR;
      Options       : Win32.PUCHAR;
      StringBinding : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcStringBindingComposeA;

   function RpcStringBindingComposeW
     (ObjUuid       : Win32.PWSTR;
      Protseq       : Win32.PWSTR;
      NetworkAddr   : Win32.PWSTR;
      Endpoint      : Win32.PWSTR;
      Options       : Win32.PWSTR;
      StringBinding : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcStringBindingParseA
     (StringBinding  : Win32.PUCHAR;
      ObjUuid        : access Win32.PUCHAR;
      Protseq        : access Win32.PUCHAR;
      NetworkAddr    : access Win32.PUCHAR;
      Endpoint       : access Win32.PUCHAR;
      NetworkOptions : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcStringBindingParse
     (StringBinding  : Win32.PUCHAR;
      ObjUuid        : access Win32.PUCHAR;
      Protseq        : access Win32.PUCHAR;
      NetworkAddr    : access Win32.PUCHAR;
      Endpoint       : access Win32.PUCHAR;
      NetworkOptions : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcStringBindingParseA;

   function RpcStringBindingParseW
     (StringBinding  : Win32.PWSTR;
      ObjUuid        : access Win32.PWSTR;
      Protseq        : access Win32.PWSTR;
      NetworkAddr    : access Win32.PWSTR;
      Endpoint       : access Win32.PWSTR;
      NetworkOptions : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcStringFreeA
     (String : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcStringFree
     (String : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcStringFreeA;

   function RpcStringFreeW
     (String : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcIfInqId
     (RpcIfHandle : RPC_IF_HANDLE;
      RpcIfId     : access RPC_IF_ID)
      return Win32.Rpc.RPC_STATUS;

   function RpcNetworkIsProtseqValidA
     (Protseq : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNetworkIsProtseqValid
     (Protseq : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNetworkIsProtseqValidA;

   function RpcNetworkIsProtseqValidW
     (Protseq : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtInqComTimeout
     (Binding : RPC_BINDING_HANDLE;
      Timeout : access Win32.UINT)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtSetComTimeout
     (Binding : RPC_BINDING_HANDLE;
      Timeout : Win32.UINT)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtSetCancelTimeout
     (Timeout : Win32.LONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcNetworkInqProtseqsA
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcNetworkInqProtseqs
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
      return Win32.Rpc.RPC_STATUS renames RpcNetworkInqProtseqsA;

   function RpcNetworkInqProtseqsW
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORW_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcObjectInqType
     (ObjUuid  : access UUID;
      TypeUuid : access UUID)
      return Win32.Rpc.RPC_STATUS;

   function RpcObjectSetInqFn
     (InquiryFn : RPC_OBJECT_INQ_FN)
      return Win32.Rpc.RPC_STATUS;

   function RpcObjectSetType
     (ObjUuid  : access UUID;
      TypeUuid : access UUID)
      return Win32.Rpc.RPC_STATUS;

   function RpcProtseqVectorFreeA
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcProtseqVectorFree
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
      return Win32.Rpc.RPC_STATUS renames RpcProtseqVectorFreeA;

   function RpcProtseqVectorFreeW
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORW_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerInqBindings
     (BindingVector : access a_RPC_BINDING_VECTOR_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerInqIf
     (IfSpec      : RPC_IF_HANDLE;
      MgrTypeUuid : access UUID;
      MgrEpv      : access RPC_MGR_EPV)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerListen
     (MinimumCallThreads : Win32.UINT;
      MaxCalls           : Win32.UINT;
      DontWait           : Win32.UINT)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerRegisterIf
     (IfSpec      : RPC_IF_HANDLE;
      MgrTypeUuid : access UUID;
      MgrEpv      : access RPC_MGR_EPV)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUnregisterIf
     (IfSpec                 : RPC_IF_HANDLE;
      MgrTypeUuid            : access UUID;
      WaitForCallsToComplete : Win32.UINT)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseAllProtseqs
     (MaxCalls           : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseAllProtseqsIf
     (MaxCalls           : Win32.UINT;
      IfSpec             : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseProtseqA
     (Protseq            : Win32.PUCHAR;
      MaxCalls           : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseProtseq
     (Protseq            : Win32.PUCHAR;
      MaxCalls           : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS renames RpcServerUseProtseqA;

   function RpcServerUseProtseqW
     (Protseq            : Win32.PWSTR;
      MaxCalls           : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseProtseqEpA
     (Protseq            : Win32.PUCHAR;
      MaxCalls           : Win32.UINT;
      Endpoint           : Win32.PUCHAR;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseProtseqEp
     (Protseq            : Win32.PUCHAR;
      MaxCalls           : Win32.UINT;
      Endpoint           : Win32.PUCHAR;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS renames RpcServerUseProtseqEpA;

   function RpcServerUseProtseqEpW
     (Protseq            : Win32.PWSTR;
      MaxCalls           : Win32.UINT;
      Endpoint           : Win32.PWSTR;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseProtseqIfA
     (Protseq            : Win32.PUCHAR;
      MaxCalls           : Win32.UINT;
      IfSpec             : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerUseProtseqIf
     (Protseq            : Win32.PUCHAR;
      MaxCalls           : Win32.UINT;
      IfSpec             : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS renames RpcServerUseProtseqIfA;

   function RpcServerUseProtseqIfW
     (Protseq            : Win32.PWSTR;
      MaxCalls           : Win32.UINT;
      IfSpec             : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtStatsVectorFree
     (StatsVector : access a_RPC_STATS_VECTOR_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtInqStats
     (Binding    : RPC_BINDING_HANDLE;
      Statistics : access a_RPC_STATS_VECTOR_t)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtIsServerListening
     (Binding : RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtStopServerListening
     (Binding : RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtWaitServerListen return Win32.Rpc.RPC_STATUS;

   function RpcMgmtSetServerStackSize
     (ThreadStackSize : Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtEnableIdleCleanup return Win32.Rpc.RPC_STATUS;

   function RpcMgmtInqIfIds
     (Binding    : RPC_BINDING_HANDLE;
      IfIdVector : access PRPC_IF_ID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcIfIdVectorFree
     (IfIdVector : access PRPC_IF_ID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtInqServerPrincNameA
     (Binding         : RPC_BINDING_HANDLE;
      AuthnSvc        : Win32.ULONG;
      ServerPrincName : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtInqServerPrincName
     (Binding         : RPC_BINDING_HANDLE;
      AuthnSvc        : Win32.ULONG;
      ServerPrincName : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames
     RpcMgmtInqServerPrincNameA;

   function RpcMgmtInqServerPrincNameW
     (Binding         : RPC_BINDING_HANDLE;
      AuthnSvc        : Win32.ULONG;
      ServerPrincName : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcEpResolveBinding
     (Binding : RPC_BINDING_HANDLE;
      IfSpec  : RPC_IF_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingInqEntryNameA
     (Binding         : RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName       : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingInqEntryName
     (Binding         : RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName       : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsBindingInqEntryNameA;

   function RpcNsBindingInqEntryNameW
     (Binding         : RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName       : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingInqAuthClientA
     (ClientBinding   : RPC_BINDING_HANDLE;
      Privs           : access RPC_AUTHZ_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel      : access Win32.ULONG;
      AuthnSvc        : access Win32.ULONG;
      AuthzSvc        : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingInqAuthClient
     (ClientBinding   : RPC_BINDING_HANDLE;
      Privs           : access RPC_AUTHZ_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel      : access Win32.ULONG;
      AuthnSvc        : access Win32.ULONG;
      AuthzSvc        : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS renames RpcBindingInqAuthClientA;

   function RpcBindingInqAuthClientW
     (ClientBinding   : RPC_BINDING_HANDLE;
      Privs           : access RPC_AUTHZ_HANDLE;
      ServerPrincName : access Win32.PWSTR;
      AuthnLevel      : access Win32.ULONG;
      AuthnSvc        : access Win32.ULONG;
      AuthzSvc        : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingInqAuthInfoA
     (Binding         : RPC_BINDING_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel      : access Win32.ULONG;
      AuthnSvc        : access Win32.ULONG;
      AuthIdentity    : access RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc        : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingInqAuthInfo
     (Binding         : RPC_BINDING_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel      : access Win32.ULONG;
      AuthnSvc        : access Win32.ULONG;
      AuthIdentity    : access RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc        : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS renames RpcBindingInqAuthInfoA;

   function RpcBindingInqAuthInfoW
     (Binding         : RPC_BINDING_HANDLE;
      ServerPrincName : access Win32.PWSTR;
      AuthnLevel      : access Win32.ULONG;
      AuthnSvc        : access Win32.ULONG;
      AuthIdentity    : access RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc        : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingSetAuthInfoA
     (Binding         : RPC_BINDING_HANDLE;
      ServerPrincName : Win32.PUCHAR;
      AuthnLevel      : Win32.ULONG;
      AuthnSvc        : Win32.ULONG;
      AuthIdentity    : RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc        : Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingSetAuthInfo
     (Binding         : RPC_BINDING_HANDLE;
      ServerPrincName : Win32.PUCHAR;
      AuthnLevel      : Win32.ULONG;
      AuthnSvc        : Win32.ULONG;
      AuthIdentity    : RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc        : Win32.ULONG)
      return Win32.Rpc.RPC_STATUS renames RpcBindingSetAuthInfoA;

   function RpcBindingSetAuthInfoW
     (Binding         : RPC_BINDING_HANDLE;
      ServerPrincName : Win32.PWSTR;
      AuthnLevel      : Win32.ULONG;
      AuthnSvc        : Win32.ULONG;
      AuthIdentity    : RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc        : Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerRegisterAuthInfoA
     (ServerPrincName : Win32.PUCHAR;
      AuthnSvc        : Win32.ULONG;
      GetKeyFn        : RPC_AUTH_KEY_RETRIEVAL_FN;
      Arg             : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcServerRegisterAuthInfo
     (ServerPrincName : Win32.PUCHAR;
      AuthnSvc        : Win32.ULONG;
      GetKeyFn        : RPC_AUTH_KEY_RETRIEVAL_FN;
      Arg             : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS renames
     RpcServerRegisterAuthInfoA;

   function RpcServerRegisterAuthInfoW
     (ServerPrincName : Win32.PWSTR;
      AuthnSvc        : Win32.ULONG;
      GetKeyFn        : RPC_AUTH_KEY_RETRIEVAL_FN;
      Arg             : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcBindingServerFromClient
     (ClientBinding : RPC_BINDING_HANDLE;
      ServerBinding : access RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   procedure RpcRaiseException (c_exception : Win32.Rpc.RPC_STATUS);

   function RpcTestCancel return Win32.Rpc.RPC_STATUS;

   function RpcCancelThread
     (Thread : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function UuidCreate
     (Uuid : access Win32.Rpcdce.UUID)
      return Win32.Rpc.RPC_STATUS;

   function UuidToStringA
     (Uuid       : access Win32.Rpcdce.UUID;
      StringUuid : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function UuidToString
     (Uuid       : access Win32.Rpcdce.UUID;
      StringUuid : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames UuidToStringA;

   function UuidFromStringA
     (StringUuid : Win32.PUCHAR;
      Uuid       : access Win32.Rpcdce.UUID)
      return Win32.Rpc.RPC_STATUS;

   function UuidFromString
     (StringUuid : Win32.PUCHAR;
      Uuid       : access Win32.Rpcdce.UUID)
      return Win32.Rpc.RPC_STATUS renames UuidFromStringA;

   function UuidToStringW
     (Uuid       : access Win32.Rpcdce.UUID;
      StringUuid : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function UuidFromStringW
     (StringUuid : Win32.PWSTR;
      Uuid       : access Win32.Rpcdce.UUID)
      return Win32.Rpc.RPC_STATUS;

   function UuidCompare
     (Uuid1  : access UUID;
      Uuid2  : access UUID;
      Status : access Win32.Rpc.RPC_STATUS)
      return Win32.INT;

   function UuidCreateNil
     (NilUuid : access UUID)
      return Win32.Rpc.RPC_STATUS;

   function UuidEqual
     (Uuid1  : access UUID;
      Uuid2  : access UUID;
      Status : access Win32.Rpc.RPC_STATUS)
      return Win32.INT;

   function UuidHash
     (Uuid   : access Win32.Rpcdce.UUID;
      Status : access Win32.Rpc.RPC_STATUS)
      return Win32.USHORT;

   function UuidIsNil
     (Uuid   : access Win32.Rpcdce.UUID;
      Status : access Win32.Rpc.RPC_STATUS)
      return Win32.INT;

   function RpcEpRegisterNoReplaceA
     (IfSpec        : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector    : access UUID_VECTOR;
      Annotation    : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcEpRegisterNoReplace
     (IfSpec        : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector    : access UUID_VECTOR;
      Annotation    : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcEpRegisterNoReplaceA;

   function RpcEpRegisterNoReplaceW
     (IfSpec        : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector    : access UUID_VECTOR;
      Annotation    : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcEpRegisterA
     (IfSpec        : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector    : access UUID_VECTOR;
      Annotation    : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcEpRegister
     (IfSpec        : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector    : access UUID_VECTOR;
      Annotation    : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcEpRegisterA;

   function RpcEpRegisterW
     (IfSpec        : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector    : access UUID_VECTOR;
      Annotation    : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcEpUnregister
     (IfSpec        : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector    : access UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function DceErrorInqTextA
     (RpcStatus : Win32.Rpc.RPC_STATUS;
      ErrorText : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function DceErrorInqText
     (RpcStatus : Win32.Rpc.RPC_STATUS;
      ErrorText : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames DceErrorInqTextA;

   function DceErrorInqTextW
     (RpcStatus : Win32.Rpc.RPC_STATUS;
      ErrorText : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtEpEltInqBegin
     (EpBinding      : RPC_BINDING_HANDLE;
      InquiryType    : Win32.ULONG;
      IfId           : access RPC_IF_ID;
      VersOption     : Win32.ULONG;
      ObjectUuid     : access UUID;
      InquiryContext : access RPC_EP_INQ_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtEpEltInqDone
     (InquiryContext : access RPC_EP_INQ_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtEpEltInqNextA
     (InquiryContext : RPC_EP_INQ_HANDLE;
      IfId           : access RPC_IF_ID;
      Binding        : access RPC_BINDING_HANDLE;
      ObjectUuid     : access UUID;
      Annotation     : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtEpEltInqNext
     (InquiryContext : RPC_EP_INQ_HANDLE;
      IfId           : access RPC_IF_ID;
      Binding        : access RPC_BINDING_HANDLE;
      ObjectUuid     : access UUID;
      Annotation     : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcMgmtEpEltInqNextA;

   function RpcMgmtEpEltInqNextW
     (InquiryContext : RPC_EP_INQ_HANDLE;
      IfId           : access RPC_IF_ID;
      Binding        : access RPC_BINDING_HANDLE;
      ObjectUuid     : access UUID;
      Annotation     : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtEpUnregister
     (EpBinding  : RPC_BINDING_HANDLE;
      IfId       : access RPC_IF_ID;
      Binding    : RPC_BINDING_HANDLE;
      ObjectUuid : access UUID)
      return Win32.Rpc.RPC_STATUS;

   function RpcMgmtSetAuthorizationFn
     (AuthorizationFn : RPC_MGMT_AUTHORIZATION_FN)
      return Win32.Rpc.RPC_STATUS;

private

   pragma Convention (C_Pass_By_Copy, GUID);
   pragma Convention (C_Pass_By_Copy, RPC_BINDING_VECTOR);
   pragma Convention (C_Pass_By_Copy, UUID_VECTOR);
   pragma Convention (C, RPC_IF_ID);
   pragma Convention (C_Pass_By_Copy, RPC_PROTSEQ_VECTORA);
   pragma Convention (C_Pass_By_Copy, RPC_PROTSEQ_VECTORW);
   pragma Convention (C_Pass_By_Copy, RPC_STATS_VECTOR);
   pragma Convention (C_Pass_By_Copy, RPC_IF_ID_VECTOR);
   pragma Convention (C, SEC_WINNT_AUTH_IDENTITY_W);
   pragma Convention (C, SEC_WINNT_AUTH_IDENTITY_A);
   pragma Convention (C_Pass_By_Copy, RPC_CLIENT_INFORMATION1);

   pragma Import (Stdcall, RpcBindingCopy, "RpcBindingCopy");
   pragma Import (Stdcall, RpcBindingFree, "RpcBindingFree");
   pragma Import
     (Stdcall,
      RpcBindingFromStringBindingA,
      "RpcBindingFromStringBindingA");
   pragma Import
     (Stdcall,
      RpcBindingFromStringBindingW,
      "RpcBindingFromStringBindingW");
   pragma Import (Stdcall, RpcBindingInqObject, "RpcBindingInqObject");
   pragma Import (Stdcall, RpcBindingReset, "RpcBindingReset");
   pragma Import (Stdcall, RpcBindingSetObject, "RpcBindingSetObject");
   pragma Import
     (Stdcall,
      RpcMgmtInqDefaultProtectLevel,
      "RpcMgmtInqDefaultProtectLevel");
   pragma Import
     (Stdcall,
      RpcBindingToStringBindingA,
      "RpcBindingToStringBindingA");
   pragma Import
     (Stdcall,
      RpcBindingToStringBindingW,
      "RpcBindingToStringBindingW");
   pragma Import (Stdcall, RpcBindingVectorFree, "RpcBindingVectorFree");
   pragma Import
     (Stdcall,
      RpcStringBindingComposeA,
      "RpcStringBindingComposeA");
   pragma Import
     (Stdcall,
      RpcStringBindingComposeW,
      "RpcStringBindingComposeW");
   pragma Import (Stdcall, RpcStringBindingParseA, "RpcStringBindingParseA");
   pragma Import (Stdcall, RpcStringBindingParseW, "RpcStringBindingParseW");
   pragma Import (Stdcall, RpcStringFreeA, "RpcStringFreeA");
   pragma Import (Stdcall, RpcStringFreeW, "RpcStringFreeW");
   pragma Import (Stdcall, RpcIfInqId, "RpcIfInqId");
   pragma Import
     (Stdcall,
      RpcNetworkIsProtseqValidA,
      "RpcNetworkIsProtseqValidA");
   pragma Import
     (Stdcall,
      RpcNetworkIsProtseqValidW,
      "RpcNetworkIsProtseqValidW");
   pragma Import (Stdcall, RpcMgmtInqComTimeout, "RpcMgmtInqComTimeout");
   pragma Import (Stdcall, RpcMgmtSetComTimeout, "RpcMgmtSetComTimeout");
   pragma Import
     (Stdcall,
      RpcMgmtSetCancelTimeout,
      "RpcMgmtSetCancelTimeout");
   pragma Import (Stdcall, RpcNetworkInqProtseqsA, "RpcNetworkInqProtseqsA");
   pragma Import (Stdcall, RpcNetworkInqProtseqsW, "RpcNetworkInqProtseqsW");
   pragma Import (Stdcall, RpcObjectInqType, "RpcObjectInqType");
   pragma Import (Stdcall, RpcObjectSetInqFn, "RpcObjectSetInqFn");
   pragma Import (Stdcall, RpcObjectSetType, "RpcObjectSetType");
   pragma Import (Stdcall, RpcProtseqVectorFreeA, "RpcProtseqVectorFreeA");
   pragma Import (Stdcall, RpcProtseqVectorFreeW, "RpcProtseqVectorFreeW");
   pragma Import (Stdcall, RpcServerInqBindings, "RpcServerInqBindings");
   pragma Import (Stdcall, RpcServerInqIf, "RpcServerInqIf");
   pragma Import (Stdcall, RpcServerListen, "RpcServerListen");
   pragma Import (Stdcall, RpcServerRegisterIf, "RpcServerRegisterIf");
   pragma Import (Stdcall, RpcServerUnregisterIf, "RpcServerUnregisterIf");
   pragma Import
     (Stdcall,
      RpcServerUseAllProtseqs,
      "RpcServerUseAllProtseqs");
   pragma Import
     (Stdcall,
      RpcServerUseAllProtseqsIf,
      "RpcServerUseAllProtseqsIf");
   pragma Import (Stdcall, RpcServerUseProtseqA, "RpcServerUseProtseqA");
   pragma Import (Stdcall, RpcServerUseProtseqW, "RpcServerUseProtseqW");
   pragma Import (Stdcall, RpcServerUseProtseqEpA, "RpcServerUseProtseqEpA");
   pragma Import (Stdcall, RpcServerUseProtseqEpW, "RpcServerUseProtseqEpW");
   pragma Import (Stdcall, RpcServerUseProtseqIfA, "RpcServerUseProtseqIfA");
   pragma Import (Stdcall, RpcServerUseProtseqIfW, "RpcServerUseProtseqIfW");
   pragma Import (Stdcall, RpcMgmtStatsVectorFree, "RpcMgmtStatsVectorFree");
   pragma Import (Stdcall, RpcMgmtInqStats, "RpcMgmtInqStats");
   pragma Import
     (Stdcall,
      RpcMgmtIsServerListening,
      "RpcMgmtIsServerListening");
   pragma Import
     (Stdcall,
      RpcMgmtStopServerListening,
      "RpcMgmtStopServerListening");
   pragma Import
     (Stdcall,
      RpcMgmtWaitServerListen,
      "RpcMgmtWaitServerListen");
   pragma Import
     (Stdcall,
      RpcMgmtSetServerStackSize,
      "RpcMgmtSetServerStackSize");
   pragma Import
     (Stdcall,
      RpcMgmtEnableIdleCleanup,
      "RpcMgmtEnableIdleCleanup");
   pragma Import (Stdcall, RpcMgmtInqIfIds, "RpcMgmtInqIfIds");
   pragma Import (Stdcall, RpcIfIdVectorFree, "RpcIfIdVectorFree");
   pragma Import
     (Stdcall,
      RpcMgmtInqServerPrincNameA,
      "RpcMgmtInqServerPrincNameA");
   pragma Import
     (Stdcall,
      RpcMgmtInqServerPrincNameW,
      "RpcMgmtInqServerPrincNameW");
   pragma Import (Stdcall, RpcEpResolveBinding, "RpcEpResolveBinding");
   pragma Import
     (Stdcall,
      RpcNsBindingInqEntryNameA,
      "RpcNsBindingInqEntryNameA");
   pragma Import
     (Stdcall,
      RpcNsBindingInqEntryNameW,
      "RpcNsBindingInqEntryNameW");
   pragma Import
     (Stdcall,
      RpcBindingInqAuthClientA,
      "RpcBindingInqAuthClientA");
   pragma Import
     (Stdcall,
      RpcBindingInqAuthClientW,
      "RpcBindingInqAuthClientW");
   pragma Import (Stdcall, RpcBindingInqAuthInfoA, "RpcBindingInqAuthInfoA");
   pragma Import (Stdcall, RpcBindingInqAuthInfoW, "RpcBindingInqAuthInfoW");
   pragma Import (Stdcall, RpcBindingSetAuthInfoA, "RpcBindingSetAuthInfoA");
   pragma Import (Stdcall, RpcBindingSetAuthInfoW, "RpcBindingSetAuthInfoW");
   pragma Import
     (Stdcall,
      RpcServerRegisterAuthInfoA,
      "RpcServerRegisterAuthInfoA");
   pragma Import
     (Stdcall,
      RpcServerRegisterAuthInfoW,
      "RpcServerRegisterAuthInfoW");
   pragma Import
     (Stdcall,
      RpcBindingServerFromClient,
      "RpcBindingServerFromClient");
   pragma Import (Stdcall, RpcRaiseException, "RpcRaiseException");
   pragma Import (Stdcall, RpcTestCancel, "RpcTestCancel");
   pragma Import (Stdcall, RpcCancelThread, "RpcCancelThread");
   pragma Import (Stdcall, UuidCreate, "UuidCreate");
   pragma Import (Stdcall, UuidToStringA, "UuidToStringA");
   pragma Import (Stdcall, UuidFromStringA, "UuidFromStringA");
   pragma Import (Stdcall, UuidToStringW, "UuidToStringW");
   pragma Import (Stdcall, UuidFromStringW, "UuidFromStringW");
   pragma Import (Stdcall, UuidCompare, "UuidCompare");
   pragma Import (Stdcall, UuidCreateNil, "UuidCreateNil");
   pragma Import (Stdcall, UuidEqual, "UuidEqual");
   pragma Import (Stdcall, UuidHash, "UuidHash");
   pragma Import (Stdcall, UuidIsNil, "UuidIsNil");
   pragma Import
     (Stdcall,
      RpcEpRegisterNoReplaceA,
      "RpcEpRegisterNoReplaceA");
   pragma Import
     (Stdcall,
      RpcEpRegisterNoReplaceW,
      "RpcEpRegisterNoReplaceW");
   pragma Import (Stdcall, RpcEpRegisterA, "RpcEpRegisterA");
   pragma Import (Stdcall, RpcEpRegisterW, "RpcEpRegisterW");
   pragma Import (Stdcall, RpcEpUnregister, "RpcEpUnregister");
   pragma Import (Stdcall, DceErrorInqTextA, "DceErrorInqTextA");
   pragma Import (Stdcall, DceErrorInqTextW, "DceErrorInqTextW");
   pragma Import (Stdcall, RpcMgmtEpEltInqBegin, "RpcMgmtEpEltInqBegin");
   pragma Import (Stdcall, RpcMgmtEpEltInqDone, "RpcMgmtEpEltInqDone");
   pragma Import (Stdcall, RpcMgmtEpEltInqNextA, "RpcMgmtEpEltInqNextA");
   pragma Import (Stdcall, RpcMgmtEpEltInqNextW, "RpcMgmtEpEltInqNextW");
   pragma Import (Stdcall, RpcMgmtEpUnregister, "RpcMgmtEpUnregister");
   pragma Import
     (Stdcall,
      RpcMgmtSetAuthorizationFn,
      "RpcMgmtSetAuthorizationFn");

end Win32.Rpcdce;
