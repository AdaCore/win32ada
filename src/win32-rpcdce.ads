--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-rpcdce.ads, v $
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

package Win32.Rpcdce is

   RPC_C_BINDING_INFINITE_TIMEOUT    : constant :=   10;    --  rpcdce.h:89
   RPC_C_BINDING_MIN_TIMEOUT         : constant :=   0;     --  rpcdce.h:90
   RPC_C_BINDING_DEFAULT_TIMEOUT     : constant :=   5;     --  rpcdce.h:91
   RPC_C_BINDING_MAX_TIMEOUT         : constant :=   9;     --  rpcdce.h:92
   RPC_C_CANCEL_INFINITE_TIMEOUT     : constant :=   -1;    --  rpcdce.h:94
   RPC_C_LISTEN_MAX_CALLS_DEFAULT    : constant :=   1234;  --  rpcdce.h:96
   RPC_C_PROTSEQ_MAX_REQS_DEFAULT    : constant :=   10;    --  rpcdce.h:97
   RPC_C_STATS_CALLS_IN              : constant :=   0;     --  rpcdce.h:144
   RPC_C_STATS_CALLS_OUT             : constant :=   1;     --  rpcdce.h:145
   RPC_C_STATS_PKTS_IN               : constant :=   2;     --  rpcdce.h:146
   RPC_C_STATS_PKTS_OUT              : constant :=   3;     --  rpcdce.h:147
   RPC_C_AUTHN_LEVEL_DEFAULT         : constant :=   0;     --  rpcdce.h:819
   RPC_C_AUTHN_LEVEL_NONE            : constant :=   1;     --  rpcdce.h:820
   RPC_C_AUTHN_LEVEL_CONNECT         : constant :=   2;     --  rpcdce.h:821
   RPC_C_AUTHN_LEVEL_CALL            : constant :=   3;     --  rpcdce.h:822
   RPC_C_AUTHN_LEVEL_PKT             : constant :=   4;     --  rpcdce.h:823
   RPC_C_AUTHN_LEVEL_PKT_INTEGRITY   : constant :=   5;     --  rpcdce.h:824
   RPC_C_AUTHN_LEVEL_PKT_PRIVACY     : constant :=   6;     --  rpcdce.h:825
   RPC_C_PROTECT_LEVEL_DEFAULT       : constant :=   0;     --  rpcdce.h:828
   RPC_C_PROTECT_LEVEL_NONE          : constant :=   1;     --  rpcdce.h:829
   RPC_C_PROTECT_LEVEL_CONNECT       : constant :=   2;     --  rpcdce.h:830
   RPC_C_PROTECT_LEVEL_CALL          : constant :=   3;     --  rpcdce.h:831
   RPC_C_PROTECT_LEVEL_PKT           : constant :=   4;     --  rpcdce.h:832
   RPC_C_PROTECT_LEVEL_PKT_INTEGRITY : constant :=   5;     --  rpcdce.h:833
   RPC_C_PROTECT_LEVEL_PKT_PRIVACY   : constant :=   6;     --  rpcdce.h:834
   RPC_C_AUTHN_NONE                  : constant :=   0;     --  rpcdce.h:836
   RPC_C_AUTHN_DCE_PRIVATE           : constant :=   1;     --  rpcdce.h:837
   RPC_C_AUTHN_DCE_PUBLIC            : constant :=   2;     --  rpcdce.h:838
   RPC_C_AUTHN_DEC_PUBLIC            : constant :=   4;     --  rpcdce.h:839
   RPC_C_AUTHN_WINNT                 : constant :=   10;    --  rpcdce.h:840
   RPC_C_AUTHN_DEFAULT               : constant :=   16#ffffffff#;
                                                            --  rpcdce.h:841
   SEC_WINNT_AUTH_IDENTITY_ANSI      : constant :=   16#1#; --  rpcdce.h:853
   SEC_WINNT_AUTH_IDENTITY_UNICODE   : constant :=   16#2#; --  rpcdce.h:854
   RPC_C_AUTHZ_NONE                  : constant :=   0;     --  rpcdce.h:887
   RPC_C_AUTHZ_NAME                  : constant :=   1;     --  rpcdce.h:888
   RPC_C_AUTHZ_DCE                   : constant :=   2;     --  rpcdce.h:889
   DCE_C_ERROR_STRING_LEN            : constant :=   256;   --  rpcdce.h:1261
   RPC_C_EP_ALL_ELTS                 : constant :=   0;     --  rpcdce.h:1265
   RPC_C_EP_MATCH_BY_IF              : constant :=   1;     --  rpcdce.h:1266
   RPC_C_EP_MATCH_BY_OBJ             : constant :=   2;     --  rpcdce.h:1267
   RPC_C_EP_MATCH_BY_BOTH            : constant :=   3;     --  rpcdce.h:1268
   RPC_C_VERS_ALL                    : constant :=   1;     --  rpcdce.h:1270
   RPC_C_VERS_COMPATIBLE             : constant :=   2;     --  rpcdce.h:1271
   RPC_C_VERS_EXACT                  : constant :=   3;     --  rpcdce.h:1272
   RPC_C_VERS_MAJOR_ONLY             : constant :=   4;     --  rpcdce.h:1273
   RPC_C_VERS_UPTO                   : constant :=   5;     --  rpcdce.h:1274
   RPC_C_MGMT_INQ_IF_IDS             : constant :=   0;     --  rpcdce.h:1344
   RPC_C_MGMT_INQ_PRINC_NAME         : constant :=   1;     --  rpcdce.h:1345
   RPC_C_MGMT_INQ_STATS              : constant :=   2;     --  rpcdce.h:1346
   RPC_C_MGMT_IS_SERVER_LISTEN       : constant :=   3;     --  rpcdce.h:1347
   RPC_C_MGMT_STOP_SERVER_LISTEN     : constant :=   4;     --  rpcdce.h:1348

   subtype RPC_BINDING_HANDLE is Win32.Rpc.RPC_BINDING_HANDLE;
   --  rpcdce.h :36
   subtype rpc_binding_handle_t is RPC_BINDING_HANDLE;     --  rpcdce.h :38
   subtype handle_t is RPC_BINDING_HANDLE;                 --  rpcdce.h :37
   type RPC_IF_HANDLE is new RPC_BINDING_HANDLE;           --  rpcdce.h :77
   type RPC_MGR_EPV is new Win32.VOID;                     --  rpcdce.h :136
   type RPC_AUTH_IDENTITY_HANDLE is new RPC_BINDING_HANDLE; --  rpcdce.h :816
   type RPC_AUTHZ_HANDLE is new RPC_BINDING_HANDLE;        --  rpcdce.h :817
   type RPC_EP_INQ_HANDLE is access all Win32.Rpc.I_RPC_HANDLE;
   --  rpcdce.h :1263

   type GUID;                                              --  rpcdce.h :42
   type RPC_BINDING_VECTOR;                                --  rpcdce.h :59
   type RPC_IF_ID;                                         --  rpcdce.h :81
   type RPC_PROTSEQ_VECTORA;                               --  rpcdce.h :101
   type RPC_PROTSEQ_VECTORW;                               --  rpcdce.h :107
   type RPC_STATS_VECTOR;                                  --  rpcdce.h :142
   type RPC_IF_ID_VECTOR;                                  --  rpcdce.h :153
   type SEC_WINNT_AUTH_IDENTITY_W;                         --  rpcdce.h :856
   type SEC_WINNT_AUTH_IDENTITY_A;                         --  rpcdce.h :866
   type RPC_CLIENT_INFORMATION1;                           --  rpcdce.h :1046

   type a_RPC_IF_ID_t is access all RPC_IF_ID;             --  rpcdce.h :152
   type a_RPC_BINDING_VECTOR_t is access all RPC_BINDING_VECTOR;
   --  rpcdce.h :269
   type a_RPC_PROTSEQ_VECTORA_t is access all RPC_PROTSEQ_VECTORA;
   --  rpcdce.h :452
   type a_RPC_PROTSEQ_VECTORW_t is access all RPC_PROTSEQ_VECTORW;
   --  rpcdce.h :457
   type a_RPC_STATS_VECTOR_t is access all RPC_STATS_VECTOR;
   --  rpcdce.h :691
   type PRPC_IF_ID_VECTOR is access all RPC_IF_ID_VECTOR;  --  rpcdce.h :734
   type PSEC_WINNT_AUTH_IDENTITY_W is access all SEC_WINNT_AUTH_IDENTITY_W;
   --  rpcdce.h :864
   type PSEC_WINNT_AUTH_IDENTITY_A is
     access all SEC_WINNT_AUTH_IDENTITY_A;               --  rpcdce.h :874
   subtype PSEC_WINNT_AUTH_IDENTITY is PSEC_WINNT_AUTH_IDENTITY_A;
   --  rpcdce.h :882
   type PRPC_CLIENT_INFORMATION1 is access all RPC_CLIENT_INFORMATION1;
   --  rpcdce.h :1046

   type GUID is                                            --  rpcdce.h :42
      record
         Data1 : Win32.ULONG;                              --  rpcdce.h :44
         Data2 : Win32.USHORT;                             --  rpcdce.h :45
         Data3 : Win32.USHORT;                             --  rpcdce.h :46
         Data4 : Win32.CHAR_Array (0 .. 7);                --  rpcdce.h :47
      end record;

   subtype UUID is GUID;                                   --  rpcdce.h :53
   subtype uuid_t is UUID;                                 --  rpcdce.h :55
   type a_UUID_t is access all UUID;                       --  rpcdce.h :71
   type UUID_VECTOR;                                       --  rpcdce.h :68

   type RPC_BINDING_HANDLE_Array is array (0 .. Win32.ANYSIZE_ARRAY)
     of aliased RPC_BINDING_HANDLE;

   type RPC_BINDING_VECTOR is                              --  rpcdce.h :59
      record
         Count : Win32.ULONG;                              --  rpcdce.h :61
         BindingH : RPC_BINDING_HANDLE_Array;              --  rpcdce.h :62
      end record;

   subtype rpc_binding_vector_t is RPC_BINDING_VECTOR;     --  rpcdce.h :65

   type a_UUID_t_Array is                                  --  rpcdce.h :71
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased a_UUID_t;

   type UUID_VECTOR is                                     --  rpcdce.h :68
      record
         Count : Win32.ULONG;                              --  rpcdce.h :70
         Uuid : a_UUID_t_Array;                            --  rpcdce.h :71
      end record;

   subtype uuid_vector_t is UUID_VECTOR;                   --  rpcdce.h :74

   type RPC_IF_ID is                                       --  rpcdce.h :81
      record
         Uuid : Win32.Rpcdce.UUID;                         --  rpcdce.h :83
         VersMajor : Win32.USHORT;                         --  rpcdce.h :84
         VersMinor : Win32.USHORT;                         --  rpcdce.h :85
      end record;

   type PSTR_Array is                                      --  rpcdce.h :104
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased Win32.PSTR;

   type RPC_PROTSEQ_VECTORA is                             --  rpcdce.h :101
      record
         Count : Win32.UINT;                               --  rpcdce.h :103
         Protseq : PSTR_Array;                             --  rpcdce.h :104
      end record;

   subtype RPC_PROTSEQ_VECTOR is RPC_PROTSEQ_VECTORA;      --  rpcdce.h :116

   type PWSTR_Array is                                     --  rpcdce.h :110
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased Win32.PWSTR;

   type RPC_PROTSEQ_VECTORW is                             --  rpcdce.h :107
      record
         Count : Win32.UINT;                               --  rpcdce.h :109
         Protseq : PWSTR_Array;                            --  rpcdce.h :110
      end record;

   type RPC_OBJECT_INQ_FN is access procedure

     (ObjectUuid : access UUID;
      TypeUuid : access UUID;
      Status : access Win32.Rpc.RPC_STATUS);   --  rpcdce.h :130
   pragma Convention (Stdcall, RPC_OBJECT_INQ_FN);

   type RPC_STATS_VECTOR is                                --  rpcdce.h :142
      record
         Count : Win32.UINT;                              --  rpcdce.h :140
         Stats : Win32.LONG_Array (0 .. Win32.ANYSIZE_ARRAY); --  rpcdce.h :141
      end record;

   type a_RPC_IF_ID_t_Array is                             --  rpcdce.h :152
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased a_RPC_IF_ID_t;

   type RPC_IF_ID_VECTOR is                                --  rpcdce.h :153
      record
         Count : Win32.ULONG;                             --  rpcdce.h :151
         IfId : a_RPC_IF_ID_t_Array;                     --  rpcdce.h :152
      end record;

   type SEC_WINNT_AUTH_IDENTITY_W is                       --  rpcdce.h :856
      record
         User : Win32.PWSTR;                    --  rpcdce.h :857
         UserLength : Win32.ULONG;                    --  rpcdce.h :858
         Domain : Win32.PWSTR;                    --  rpcdce.h :859
         DomainLength : Win32.ULONG;                    --  rpcdce.h :860
         Password : Win32.PWSTR;                    --  rpcdce.h :861
         PasswordLength : Win32.ULONG;                    --  rpcdce.h :862
         Flags : Win32.ULONG;                    --  rpcdce.h :863
      end record;

   type SEC_WINNT_AUTH_IDENTITY_A is                       --  rpcdce.h :866
      record
         User : Win32.PSTR;                     --  rpcdce.h :867
         UserLength : Win32.ULONG;                    --  rpcdce.h :868
         Domain : Win32.PSTR;                     --  rpcdce.h :869
         DomainLength : Win32.ULONG;                    --  rpcdce.h :870
         Password : Win32.PSTR;                     --  rpcdce.h :871
         PasswordLength : Win32.ULONG;                    --  rpcdce.h :872
         Flags : Win32.ULONG;                    --  rpcdce.h :873
      end record;

   subtype SEC_WINNT_AUTH_IDENTITY is SEC_WINNT_AUTH_IDENTITY_A;
   --  rpcdce.h :881

   type RPC_AUTH_KEY_RETRIEVAL_FN is access procedure

     (Arg : Win32.PVOID;
      ServerPrincName : Win32.PWSTR;
      KeyVer : Win32.ULONG;
      Key : access Win32.PVOID;
      Status : access Win32.Rpc.RPC_STATUS);
   pragma Convention (Stdcall, RPC_AUTH_KEY_RETRIEVAL_FN);
   --  rpcdce.h :954

   type RPC_CLIENT_INFORMATION1 is                         --  rpcdce.h :1046
      record
         UserName : Win32.PUCHAR;                     --  rpcdce.h :1042
         ComputerName : Win32.PUCHAR;                     --  rpcdce.h :1043
         Privilege : Win32.USHORT;                     --  rpcdce.h :1044
         AuthFlags : Win32.ULONG;                      --  rpcdce.h :1045
      end record;

   type RPC_MGMT_AUTHORIZATION_FN is access function

     (ClientBinding : RPC_BINDING_HANDLE;
      RequestedMgmtOperation : Win32.ULONG;
      Status : access Win32.Rpc.RPC_STATUS)
     return Win32.INT;                            --  rpcdce.h :1338
   pragma Convention (Stdcall, RPC_MGMT_AUTHORIZATION_FN);

   function RpcBindingCopy

     (SourceBinding : RPC_BINDING_HANDLE;
      DestinationBinding : access RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :157

   function RpcBindingFree

     (Binding : access RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :164

   function RpcBindingFromStringBindingA

     (StringBinding : Win32.PUCHAR;
      Binding : access RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :173

   function RpcBindingFromStringBinding

     (StringBinding : Win32.PUCHAR;
      Binding : access RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS
     renames RpcBindingFromStringBindingA;        --  rpcdce.h :173

   function RpcBindingFromStringBindingW

     (StringBinding : Win32.PWSTR;
      Binding : access RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :179

   function RpcBindingInqObject
     (Binding : RPC_BINDING_HANDLE;
      ObjectUuid : access UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :205

   function RpcBindingReset
     (Binding : RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :212

   function RpcBindingSetObject
     (Binding : RPC_BINDING_HANDLE;
      ObjectUuid : access UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :221

   function RpcMgmtInqDefaultProtectLevel
     (AuthnSvc : Win32.ULONG;
      AuthnLevel : access Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :228

   function RpcBindingToStringBindingA
     (Binding : RPC_BINDING_HANDLE;
      StringBinding : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :238

   function RpcBindingToStringBinding
     (Binding : RPC_BINDING_HANDLE;
      StringBinding : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcBindingToStringBindingA;          --  rpcdce.h :238

   function RpcBindingToStringBindingW
     (Binding : RPC_BINDING_HANDLE;
      StringBinding : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :244

   function RpcBindingVectorFree
     (BindingVector : access a_RPC_BINDING_VECTOR_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :267

   function RpcStringBindingComposeA
     (ObjUuid : Win32.PUCHAR;
      Protseq : Win32.PUCHAR;
      NetworkAddr : Win32.PUCHAR;
      Endpoint : Win32.PUCHAR;
      Options : Win32.PUCHAR;
      StringBinding : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :276

   function RpcStringBindingCompose
     (ObjUuid : Win32.PUCHAR;
      Protseq : Win32.PUCHAR;
      NetworkAddr : Win32.PUCHAR;
      Endpoint : Win32.PUCHAR;
      Options : Win32.PUCHAR;
      StringBinding : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcStringBindingComposeA;            --  rpcdce.h :276

   function RpcStringBindingComposeW
     (ObjUuid : Win32.PWSTR;
      Protseq : Win32.PWSTR;
      NetworkAddr : Win32.PWSTR;
      Endpoint : Win32.PWSTR;
      Options : Win32.PWSTR;
      StringBinding : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :286

   function RpcStringBindingParseA
     (StringBinding : Win32.PUCHAR;
      ObjUuid : access Win32.PUCHAR;
      Protseq : access Win32.PUCHAR;
      NetworkAddr : access Win32.PUCHAR;
      Endpoint : access Win32.PUCHAR;
      NetworkOptions : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :320

   function RpcStringBindingParse
     (StringBinding : Win32.PUCHAR;
      ObjUuid : access Win32.PUCHAR;
      Protseq : access Win32.PUCHAR;
      NetworkAddr : access Win32.PUCHAR;
      Endpoint : access Win32.PUCHAR;
      NetworkOptions : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcStringBindingParseA;              --  rpcdce.h :320

   function RpcStringBindingParseW
     (StringBinding : Win32.PWSTR;
      ObjUuid : access Win32.PWSTR;
      Protseq : access Win32.PWSTR;
      NetworkAddr : access Win32.PWSTR;
      Endpoint : access Win32.PWSTR;
      NetworkOptions : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :330

   function RpcStringFreeA
     (String : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :364

   function RpcStringFree
     (String : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcStringFreeA;                      --  rpcdce.h :364

   function RpcStringFreeW
     (String : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :369

   function RpcIfInqId
     (RpcIfHandle : RPC_IF_HANDLE;
      RpcIfId : access RPC_IF_ID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :390

   function RpcNetworkIsProtseqValidA
     (Protseq : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :400

   function RpcNetworkIsProtseqValid
     (Protseq : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcNetworkIsProtseqValidA;           --  rpcdce.h :400

   function RpcNetworkIsProtseqValidW
     (Protseq : Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :405

   function RpcMgmtInqComTimeout
     (Binding : RPC_BINDING_HANDLE;
      Timeout : access Win32.UINT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :426

   function RpcMgmtSetComTimeout
     (Binding : RPC_BINDING_HANDLE;
      Timeout : Win32.UINT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :433

   function RpcMgmtSetCancelTimeout
     (Timeout : Win32.LONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :440

   function RpcNetworkInqProtseqsA
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :450

   function RpcNetworkInqProtseqs
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
     return Win32.Rpc.RPC_STATUS
     renames RpcNetworkInqProtseqsA;              --  rpcdce.h :450

   function RpcNetworkInqProtseqsW
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORW_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :455

   function RpcObjectInqType
     (ObjUuid : access UUID;
      TypeUuid : access UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :476

   function RpcObjectSetInqFn
     (InquiryFn : RPC_OBJECT_INQ_FN)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :483

   function RpcObjectSetType
     (ObjUuid : access UUID;
      TypeUuid : access UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :489

   function RpcProtseqVectorFreeA
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :499

   function RpcProtseqVectorFree
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORA_t)
     return Win32.Rpc.RPC_STATUS
     renames RpcProtseqVectorFreeA;               --  rpcdce.h :499

   function RpcProtseqVectorFreeW
     (ProtseqVector : access a_RPC_PROTSEQ_VECTORW_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :504

   function RpcServerInqBindings
     (BindingVector : access a_RPC_BINDING_VECTOR_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :525

   function RpcServerInqIf
     (IfSpec : RPC_IF_HANDLE;
      MgrTypeUuid : access UUID;
      MgrEpv : access RPC_MGR_EPV)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :531

   function RpcServerListen
     (MinimumCallThreads : Win32.UINT;
      MaxCalls : Win32.UINT;
      DontWait : Win32.UINT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :539

   function RpcServerRegisterIf
     (IfSpec : RPC_IF_HANDLE;
      MgrTypeUuid : access UUID;
      MgrEpv : access RPC_MGR_EPV)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :547

   function RpcServerUnregisterIf
     (IfSpec : RPC_IF_HANDLE;
      MgrTypeUuid : access UUID;
      WaitForCallsToComplete : Win32.UINT)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :555

   function RpcServerUseAllProtseqs
     (MaxCalls : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :563

   function RpcServerUseAllProtseqsIf
     (MaxCalls : Win32.UINT;
      IfSpec : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :570

   function RpcServerUseProtseqA
     (Protseq : Win32.PUCHAR;
      MaxCalls : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :581

   function RpcServerUseProtseq
     (Protseq : Win32.PUCHAR;
      MaxCalls : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS
     renames RpcServerUseProtseqA;                --  rpcdce.h :581

   function RpcServerUseProtseqW
     (Protseq : Win32.PWSTR;
      MaxCalls : Win32.UINT;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :588

   function RpcServerUseProtseqEpA
     (Protseq : Win32.PUCHAR;
      MaxCalls : Win32.UINT;
      Endpoint : Win32.PUCHAR;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :616

   function RpcServerUseProtseqEp
     (Protseq : Win32.PUCHAR;
      MaxCalls : Win32.UINT;
      Endpoint : Win32.PUCHAR;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS
     renames RpcServerUseProtseqEpA;              --  rpcdce.h :616

   function RpcServerUseProtseqEpW
     (Protseq : Win32.PWSTR;
      MaxCalls : Win32.UINT;
      Endpoint : Win32.PWSTR;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :624

   function RpcServerUseProtseqIfA
     (Protseq : Win32.PUCHAR;
      MaxCalls : Win32.UINT;
      IfSpec : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :654

   function RpcServerUseProtseqIf
     (Protseq : Win32.PUCHAR;
      MaxCalls : Win32.UINT;
      IfSpec : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS
     renames RpcServerUseProtseqIfA;              --  rpcdce.h :654

   function RpcServerUseProtseqIfW
     (Protseq : Win32.PWSTR;
      MaxCalls : Win32.UINT;
      IfSpec : RPC_IF_HANDLE;
      SecurityDescriptor : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :662

   function RpcMgmtStatsVectorFree
     (StatsVector : access a_RPC_STATS_VECTOR_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :689

   function RpcMgmtInqStats
     (Binding : RPC_BINDING_HANDLE;
      Statistics : access a_RPC_STATS_VECTOR_t)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :695

   function RpcMgmtIsServerListening
     (Binding : RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :702

   function RpcMgmtStopServerListening
     (Binding : RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :708

   function RpcMgmtWaitServerListen return Win32.Rpc.RPC_STATUS;
   --  rpcdce.h :714

   function RpcMgmtSetServerStackSize
     (ThreadStackSize : Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :720

   function RpcMgmtEnableIdleCleanup return Win32.Rpc.RPC_STATUS;
   --  rpcdce.h :726

   function RpcMgmtInqIfIds
     (Binding : RPC_BINDING_HANDLE;
      IfIdVector : access PRPC_IF_ID_VECTOR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :731

   function RpcIfIdVectorFree
     (IfIdVector : access PRPC_IF_ID_VECTOR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :737

   function RpcMgmtInqServerPrincNameA
     (Binding : RPC_BINDING_HANDLE;
      AuthnSvc : Win32.ULONG;
      ServerPrincName : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :744

   function RpcMgmtInqServerPrincName
     (Binding : RPC_BINDING_HANDLE;
      AuthnSvc : Win32.ULONG;
      ServerPrincName : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcMgmtInqServerPrincNameA;          --  rpcdce.h :744

   function RpcMgmtInqServerPrincNameW
     (Binding : RPC_BINDING_HANDLE;
      AuthnSvc : Win32.ULONG;
      ServerPrincName : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :751

   function RpcEpResolveBinding
     (Binding : RPC_BINDING_HANDLE;
      IfSpec : RPC_IF_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :776

   function RpcNsBindingInqEntryNameA
     (Binding : RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :786

   function RpcNsBindingInqEntryName
     (Binding : RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcNsBindingInqEntryNameA;           --  rpcdce.h :786

   function RpcNsBindingInqEntryNameW
     (Binding : RPC_BINDING_HANDLE;
      EntryNameSyntax : Win32.ULONG;
      EntryName : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :793

   function RpcBindingInqAuthClientA
     (ClientBinding : RPC_BINDING_HANDLE;
      Privs : access RPC_AUTHZ_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel : access Win32.ULONG;
      AuthnSvc : access Win32.ULONG;
      AuthzSvc : access Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :894

   function RpcBindingInqAuthClient
     (ClientBinding : RPC_BINDING_HANDLE;
      Privs : access RPC_AUTHZ_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel : access Win32.ULONG;
      AuthnSvc : access Win32.ULONG;
      AuthzSvc : access Win32.ULONG)
     return Win32.Rpc.RPC_STATUS
     renames RpcBindingInqAuthClientA;            --  rpcdce.h :894

   function RpcBindingInqAuthClientW
     (ClientBinding : RPC_BINDING_HANDLE;
      Privs : access RPC_AUTHZ_HANDLE;
      ServerPrincName : access Win32.PWSTR;
      AuthnLevel : access Win32.ULONG;
      AuthnSvc : access Win32.ULONG;
      AuthzSvc : access Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :904

   function RpcBindingInqAuthInfoA
     (Binding : RPC_BINDING_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel : access Win32.ULONG;
      AuthnSvc : access Win32.ULONG;
      AuthIdentity : access RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc : access Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :914

   function RpcBindingInqAuthInfo
     (Binding : RPC_BINDING_HANDLE;
      ServerPrincName : access Win32.PUCHAR;
      AuthnLevel : access Win32.ULONG;
      AuthnSvc : access Win32.ULONG;
      AuthIdentity : access RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc : access Win32.ULONG)
     return Win32.Rpc.RPC_STATUS
     renames RpcBindingInqAuthInfoA;              --  rpcdce.h :914

   function RpcBindingInqAuthInfoW
     (Binding : RPC_BINDING_HANDLE;
      ServerPrincName : access Win32.PWSTR;
      AuthnLevel : access Win32.ULONG;
      AuthnSvc : access Win32.ULONG;
      AuthIdentity : access RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc : access Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :924

   function RpcBindingSetAuthInfoA
     (Binding : RPC_BINDING_HANDLE;
      ServerPrincName : Win32.PUCHAR;
      AuthnLevel : Win32.ULONG;
      AuthnSvc : Win32.ULONG;
      AuthIdentity : RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc : Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :934

   function RpcBindingSetAuthInfo
     (Binding : RPC_BINDING_HANDLE;
      ServerPrincName : Win32.PUCHAR;
      AuthnLevel : Win32.ULONG;
      AuthnSvc : Win32.ULONG;
      AuthIdentity : RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc : Win32.ULONG)
     return Win32.Rpc.RPC_STATUS
     renames RpcBindingSetAuthInfoA;              --  rpcdce.h :934

   function RpcBindingSetAuthInfoW
     (Binding : RPC_BINDING_HANDLE;
      ServerPrincName : Win32.PWSTR;
      AuthnLevel : Win32.ULONG;
      AuthnSvc : Win32.ULONG;
      AuthIdentity : RPC_AUTH_IDENTITY_HANDLE;
      AuthzSvc : Win32.ULONG)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :944

   function RpcServerRegisterAuthInfoA
     (ServerPrincName : Win32.PUCHAR;
      AuthnSvc : Win32.ULONG;
      GetKeyFn : RPC_AUTH_KEY_RETRIEVAL_FN;
      Arg : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :963

   function RpcServerRegisterAuthInfo
     (ServerPrincName : Win32.PUCHAR;
      AuthnSvc : Win32.ULONG;
      GetKeyFn : RPC_AUTH_KEY_RETRIEVAL_FN;
      Arg : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS
     renames RpcServerRegisterAuthInfoA;          --  rpcdce.h :963

   function RpcServerRegisterAuthInfoW
     (ServerPrincName : Win32.PWSTR;
      AuthnSvc : Win32.ULONG;
      GetKeyFn : RPC_AUTH_KEY_RETRIEVAL_FN;
      Arg : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :971

   function RpcBindingServerFromClient
     (ClientBinding : RPC_BINDING_HANDLE;
      ServerBinding : access RPC_BINDING_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1049

   procedure RpcRaiseException
     (c_exception : Win32.Rpc.RPC_STATUS);         --  rpcdce.h :1055

   function RpcTestCancel return Win32.Rpc.RPC_STATUS;     --  rpcdce.h :1060

   function RpcCancelThread
     (Thread : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1064

   function UuidCreate
     (Uuid : access Win32.Rpcdce.UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1070

   function UuidToStringA
     (Uuid : access Win32.Rpcdce.UUID;
      StringUuid : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1078

   function UuidToString
     (Uuid : access Win32.Rpcdce.UUID;
      StringUuid : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames UuidToStringA;                       --  rpcdce.h :1078

   function UuidFromStringA
     (StringUuid : Win32.PUCHAR;
      Uuid : access Win32.Rpcdce.UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1085

   function UuidFromString
     (StringUuid : Win32.PUCHAR;
      Uuid : access Win32.Rpcdce.UUID)
     return Win32.Rpc.RPC_STATUS
     renames UuidFromStringA;                     --  rpcdce.h :1085

   function UuidToStringW
     (Uuid : access Win32.Rpcdce.UUID;
      StringUuid : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1092

   function UuidFromStringW
     (StringUuid : Win32.PWSTR;
      Uuid : access Win32.Rpcdce.UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1099

   function UuidCompare
     (Uuid1 : access UUID;
      Uuid2 : access UUID;
      Status : access Win32.Rpc.RPC_STATUS)
     return Win32.INT;                            --  rpcdce.h :1131

   function UuidCreateNil
     (NilUuid : access UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1138

   function UuidEqual
     (Uuid1 : access UUID;
      Uuid2 : access UUID;
      Status : access Win32.Rpc.RPC_STATUS)
     return Win32.INT;                            --  rpcdce.h :1143

   function UuidHash
     (Uuid : access Win32.Rpcdce.UUID;
      Status : access Win32.Rpc.RPC_STATUS)
     return Win32.USHORT;                         --  rpcdce.h :1150

   function UuidIsNil
     (Uuid : access Win32.Rpcdce.UUID;
      Status : access Win32.Rpc.RPC_STATUS)
     return Win32.INT;                            --  rpcdce.h :1156

   function RpcEpRegisterNoReplaceA
     (IfSpec : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector : access UUID_VECTOR;
      Annotation : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1164

   function RpcEpRegisterNoReplace
     (IfSpec : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector : access UUID_VECTOR;
      Annotation : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcEpRegisterNoReplaceA;             --  rpcdce.h :1164

   function RpcEpRegisterNoReplaceW
     (IfSpec : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector : access UUID_VECTOR;
      Annotation : Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1172

   function RpcEpRegisterA
     (IfSpec : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector : access UUID_VECTOR;
      Annotation : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1180

   function RpcEpRegister
     (IfSpec : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector : access UUID_VECTOR;
      Annotation : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcEpRegisterA;                      --  rpcdce.h :1180

   function RpcEpRegisterW
     (IfSpec : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector : access UUID_VECTOR;
      Annotation : Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1188

   function RpcEpUnregister
     (IfSpec : RPC_IF_HANDLE;
      BindingVector : access RPC_BINDING_VECTOR;
      UuidVector : access UUID_VECTOR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1225

   function DceErrorInqTextA
     (RpcStatus : Win32.Rpc.RPC_STATUS;
      ErrorText : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1234

   function DceErrorInqText
     (RpcStatus : Win32.Rpc.RPC_STATUS;
      ErrorText : Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames DceErrorInqTextA;                    --  rpcdce.h :1234

   function DceErrorInqTextW
     (RpcStatus : Win32.Rpc.RPC_STATUS;
      ErrorText : Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1240

   function RpcMgmtEpEltInqBegin
     (EpBinding : RPC_BINDING_HANDLE;
      InquiryType : Win32.ULONG;
      IfId : access RPC_IF_ID;
      VersOption : Win32.ULONG;
      ObjectUuid : access UUID;
      InquiryContext : access RPC_EP_INQ_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1277

   function RpcMgmtEpEltInqDone
     (InquiryContext : access RPC_EP_INQ_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1287

   function RpcMgmtEpEltInqNextA
     (InquiryContext : RPC_EP_INQ_HANDLE;
      IfId : access RPC_IF_ID;
      Binding : access RPC_BINDING_HANDLE;
      ObjectUuid : access UUID;
      Annotation : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1294

   function RpcMgmtEpEltInqNext
     (InquiryContext : RPC_EP_INQ_HANDLE;
      IfId : access RPC_IF_ID;
      Binding : access RPC_BINDING_HANDLE;
      ObjectUuid : access UUID;
      Annotation : access Win32.PUCHAR)
     return Win32.Rpc.RPC_STATUS
     renames RpcMgmtEpEltInqNextA;                --  rpcdce.h :1294

   function RpcMgmtEpEltInqNextW
     (InquiryContext : RPC_EP_INQ_HANDLE;
      IfId : access RPC_IF_ID;
      Binding : access RPC_BINDING_HANDLE;
      ObjectUuid : access UUID;
      Annotation : access Win32.PWSTR)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1303

   function RpcMgmtEpUnregister
     (EpBinding : RPC_BINDING_HANDLE;
      IfId : access RPC_IF_ID;
      Binding : RPC_BINDING_HANDLE;
      ObjectUuid : access UUID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1330

   function RpcMgmtSetAuthorizationFn
     (AuthorizationFn : RPC_MGMT_AUTHORIZATION_FN)
     return Win32.Rpc.RPC_STATUS;                 --  rpcdce.h :1351

private

   pragma Convention (C_Pass_By_Copy, GUID);                --  rpcdce.h :42
   pragma Convention (C_Pass_By_Copy, RPC_BINDING_VECTOR);  --  rpcdce.h :59
   pragma Convention (C_Pass_By_Copy, UUID_VECTOR);         --  rpcdce.h :68
   pragma Convention (C, RPC_IF_ID);                        --  rpcdce.h :81
   pragma Convention (C_Pass_By_Copy, RPC_PROTSEQ_VECTORA); --  rpcdce.h :101
   pragma Convention (C_Pass_By_Copy, RPC_PROTSEQ_VECTORW); --  rpcdce.h :107
   pragma Convention (C_Pass_By_Copy, RPC_STATS_VECTOR);    --  rpcdce.h :142
   pragma Convention (C_Pass_By_Copy, RPC_IF_ID_VECTOR);    --  rpcdce.h :153
   pragma Convention (C, SEC_WINNT_AUTH_IDENTITY_W);        --  rpcdce.h :856
   pragma Convention (C, SEC_WINNT_AUTH_IDENTITY_A);        --  rpcdce.h :866
   pragma Convention (C_Pass_By_Copy, RPC_CLIENT_INFORMATION1);
   --  rpcdce.h :1046

   pragma Import (Stdcall, RpcBindingCopy, "RpcBindingCopy");
   --  rpcdce.h :157
   pragma Import (Stdcall, RpcBindingFree, "RpcBindingFree");
   --  rpcdce.h :164
   pragma Import (Stdcall, RpcBindingFromStringBindingA,
                    "RpcBindingFromStringBindingA");        --  rpcdce.h :173
   pragma Import (Stdcall, RpcBindingFromStringBindingW,
                    "RpcBindingFromStringBindingW");        --  rpcdce.h :179
   pragma Import (Stdcall, RpcBindingInqObject, "RpcBindingInqObject");
   --  rpcdce.h :205
   pragma Import (Stdcall, RpcBindingReset, "RpcBindingReset");
   --  rpcdce.h :212
   pragma Import (Stdcall, RpcBindingSetObject, "RpcBindingSetObject");
   --  rpcdce.h :221
   pragma Import (Stdcall, RpcMgmtInqDefaultProtectLevel,
                    "RpcMgmtInqDefaultProtectLevel");       --  rpcdce.h :228
   pragma Import (Stdcall, RpcBindingToStringBindingA,
                    "RpcBindingToStringBindingA");
   --  rpcdce.h :238
   pragma Import (Stdcall, RpcBindingToStringBindingW,
                    "RpcBindingToStringBindingW");
   --  rpcdce.h :244
   pragma Import (Stdcall, RpcBindingVectorFree,
                    "RpcBindingVectorFree");
   --  rpcdce.h :267
   pragma Import (Stdcall, RpcStringBindingComposeA,
                    "RpcStringBindingComposeA");
   --  rpcdce.h :276
   pragma Import (Stdcall, RpcStringBindingComposeW,
                    "RpcStringBindingComposeW");
   --  rpcdce.h :286
   pragma Import (Stdcall, RpcStringBindingParseA, "RpcStringBindingParseA");
   --  rpcdce.h :320
   pragma Import (Stdcall, RpcStringBindingParseW, "RpcStringBindingParseW");
   --  rpcdce.h :330
   pragma Import (Stdcall, RpcStringFreeA, "RpcStringFreeA"); --  rpcdce.h :364
   pragma Import (Stdcall, RpcStringFreeW, "RpcStringFreeW"); --  rpcdce.h :369
   pragma Import (Stdcall, RpcIfInqId, "RpcIfInqId");         --  rpcdce.h :390
   pragma Import (Stdcall, RpcNetworkIsProtseqValidA,
                    "RpcNetworkIsProtseqValidA");
   --  rpcdce.h :400
   pragma Import (Stdcall, RpcNetworkIsProtseqValidW,
                    "RpcNetworkIsProtseqValidW");
   --  rpcdce.h :405
   pragma Import (Stdcall, RpcMgmtInqComTimeout, "RpcMgmtInqComTimeout");
   --  rpcdce.h :426
   pragma Import (Stdcall, RpcMgmtSetComTimeout, "RpcMgmtSetComTimeout");
   --  rpcdce.h :433
   pragma Import (Stdcall, RpcMgmtSetCancelTimeout, "RpcMgmtSetCancelTimeout");
   --  rpcdce.h :440
   pragma Import (Stdcall, RpcNetworkInqProtseqsA, "RpcNetworkInqProtseqsA");
   --  rpcdce.h :450
   pragma Import (Stdcall, RpcNetworkInqProtseqsW, "RpcNetworkInqProtseqsW");
   --  rpcdce.h :455
   pragma Import (Stdcall, RpcObjectInqType, "RpcObjectInqType");
   --  rpcdce.h :476
   pragma Import (Stdcall, RpcObjectSetInqFn, "RpcObjectSetInqFn");
   --  rpcdce.h :483
   pragma Import (Stdcall, RpcObjectSetType, "RpcObjectSetType");
   --  rpcdce.h :489
   pragma Import (Stdcall, RpcProtseqVectorFreeA, "RpcProtseqVectorFreeA");
   --  rpcdce.h :499
   pragma Import (Stdcall, RpcProtseqVectorFreeW, "RpcProtseqVectorFreeW");
   --  rpcdce.h :504
   pragma Import (Stdcall, RpcServerInqBindings, "RpcServerInqBindings");
   --  rpcdce.h :525
   pragma Import (Stdcall, RpcServerInqIf, "RpcServerInqIf"); --  rpcdce.h :531
   pragma Import (Stdcall, RpcServerListen, "RpcServerListen");
   --  rpcdce.h :539
   pragma Import (Stdcall, RpcServerRegisterIf, "RpcServerRegisterIf");
   --  rpcdce.h :547
   pragma Import (Stdcall, RpcServerUnregisterIf, "RpcServerUnregisterIf");
   --  rpcdce.h :555
   pragma Import (Stdcall, RpcServerUseAllProtseqs, "RpcServerUseAllProtseqs");
   --  rpcdce.h :563
   pragma Import (Stdcall, RpcServerUseAllProtseqsIf,
                    "RpcServerUseAllProtseqsIf");
   --  rpcdce.h :570
   pragma Import (Stdcall, RpcServerUseProtseqA, "RpcServerUseProtseqA");
   --  rpcdce.h :581
   pragma Import (Stdcall, RpcServerUseProtseqW, "RpcServerUseProtseqW");
   --  rpcdce.h :588
   pragma Import (Stdcall, RpcServerUseProtseqEpA, "RpcServerUseProtseqEpA");
   --  rpcdce.h :616
   pragma Import (Stdcall, RpcServerUseProtseqEpW, "RpcServerUseProtseqEpW");
   --  rpcdce.h :624
   pragma Import (Stdcall, RpcServerUseProtseqIfA, "RpcServerUseProtseqIfA");
   --  rpcdce.h :654
   pragma Import (Stdcall, RpcServerUseProtseqIfW, "RpcServerUseProtseqIfW");
   --  rpcdce.h :662
   pragma Import (Stdcall, RpcMgmtStatsVectorFree, "RpcMgmtStatsVectorFree");
   --  rpcdce.h :689
   pragma Import (Stdcall, RpcMgmtInqStats, "RpcMgmtInqStats");
   --  rpcdce.h :695
   pragma Import (Stdcall, RpcMgmtIsServerListening,
                    "RpcMgmtIsServerListening");
   --  rpcdce.h :702
   pragma Import (Stdcall, RpcMgmtStopServerListening,
                    "RpcMgmtStopServerListening");
   --  rpcdce.h :708
   pragma Import (Stdcall, RpcMgmtWaitServerListen, "RpcMgmtWaitServerListen");
   --  rpcdce.h :714
   pragma Import (Stdcall, RpcMgmtSetServerStackSize,
                    "RpcMgmtSetServerStackSize");
   --  rpcdce.h :720
   pragma Import (Stdcall, RpcMgmtEnableIdleCleanup,
                    "RpcMgmtEnableIdleCleanup");
   --  rpcdce.h :726
   pragma Import (Stdcall, RpcMgmtInqIfIds, "RpcMgmtInqIfIds");
   --  rpcdce.h :731
   pragma Import (Stdcall, RpcIfIdVectorFree, "RpcIfIdVectorFree");
   --  rpcdce.h :737
   pragma Import (Stdcall, RpcMgmtInqServerPrincNameA,
                    "RpcMgmtInqServerPrincNameA");
   --  rpcdce.h :744
   pragma Import (Stdcall, RpcMgmtInqServerPrincNameW,
                    "RpcMgmtInqServerPrincNameW");
   --  rpcdce.h :751
   pragma Import (Stdcall, RpcEpResolveBinding, "RpcEpResolveBinding");
   --  rpcdce.h :776
   pragma Import (Stdcall, RpcNsBindingInqEntryNameA,
                    "RpcNsBindingInqEntryNameA");
   --  rpcdce.h :786
   pragma Import (Stdcall, RpcNsBindingInqEntryNameW,
                    "RpcNsBindingInqEntryNameW");
   --  rpcdce.h :793
   pragma Import (Stdcall, RpcBindingInqAuthClientA,
                    "RpcBindingInqAuthClientA");
   --  rpcdce.h :894
   pragma Import (Stdcall, RpcBindingInqAuthClientW,
                    "RpcBindingInqAuthClientW");
   --  rpcdce.h :904
   pragma Import (Stdcall, RpcBindingInqAuthInfoA, "RpcBindingInqAuthInfoA");
   --  rpcdce.h :914
   pragma Import (Stdcall, RpcBindingInqAuthInfoW, "RpcBindingInqAuthInfoW");
   --  rpcdce.h :924
   pragma Import (Stdcall, RpcBindingSetAuthInfoA, "RpcBindingSetAuthInfoA");
   --  rpcdce.h :934
   pragma Import (Stdcall, RpcBindingSetAuthInfoW, "RpcBindingSetAuthInfoW");
   --  rpcdce.h :944
   pragma Import (Stdcall, RpcServerRegisterAuthInfoA,
                    "RpcServerRegisterAuthInfoA");
   --  rpcdce.h :963
   pragma Import (Stdcall, RpcServerRegisterAuthInfoW,
                    "RpcServerRegisterAuthInfoW");
   --  rpcdce.h :971
   pragma Import (Stdcall, RpcBindingServerFromClient,
                    "RpcBindingServerFromClient");
   --  rpcdce.h :1049
   pragma Import (Stdcall, RpcRaiseException, "RpcRaiseException");
   --  rpcdce.h :1055
   pragma Import (Stdcall, RpcTestCancel, "RpcTestCancel");  --  rpcdce.h :1060
   pragma Import (Stdcall, RpcCancelThread, "RpcCancelThread");
   --  rpcdce.h :1064
   pragma Import (Stdcall, UuidCreate, "UuidCreate");        --  rpcdce.h :1070
   pragma Import (Stdcall, UuidToStringA, "UuidToStringA");  --  rpcdce.h :1078
   pragma Import (Stdcall, UuidFromStringA, "UuidFromStringA");
   --  rpcdce.h :1085
   pragma Import (Stdcall, UuidToStringW, "UuidToStringW");  --  rpcdce.h :1092
   pragma Import (Stdcall, UuidFromStringW, "UuidFromStringW");
   --  rpcdce.h :1099
   pragma Import (Stdcall, UuidCompare, "UuidCompare");      --  rpcdce.h :1131
   pragma Import (Stdcall, UuidCreateNil, "UuidCreateNil");  --  rpcdce.h :1138
   pragma Import (Stdcall, UuidEqual, "UuidEqual");          --  rpcdce.h :1143
   pragma Import (Stdcall, UuidHash, "UuidHash");            --  rpcdce.h :1150
   pragma Import (Stdcall, UuidIsNil, "UuidIsNil");          --  rpcdce.h :1156
   pragma Import (Stdcall, RpcEpRegisterNoReplaceA, "RpcEpRegisterNoReplaceA");
   --  rpcdce.h :1164
   pragma Import (Stdcall, RpcEpRegisterNoReplaceW, "RpcEpRegisterNoReplaceW");
   --  rpcdce.h :1172
   pragma Import (Stdcall, RpcEpRegisterA, "RpcEpRegisterA");
   --  rpcdce.h :1180
   pragma Import (Stdcall, RpcEpRegisterW, "RpcEpRegisterW");
   --  rpcdce.h :1188
   pragma Import (Stdcall, RpcEpUnregister, "RpcEpUnregister");
   --  rpcdce.h :1225
   pragma Import (Stdcall, DceErrorInqTextA, "DceErrorInqTextA");
   --  rpcdce.h :1234
   pragma Import (Stdcall, DceErrorInqTextW, "DceErrorInqTextW");
   --  rpcdce.h :1240
   pragma Import (Stdcall, RpcMgmtEpEltInqBegin, "RpcMgmtEpEltInqBegin");
   --  rpcdce.h :1277
   pragma Import (Stdcall, RpcMgmtEpEltInqDone, "RpcMgmtEpEltInqDone");
   --  rpcdce.h :1287
   pragma Import (Stdcall, RpcMgmtEpEltInqNextA, "RpcMgmtEpEltInqNextA");
   --  rpcdce.h :1294
   pragma Import (Stdcall, RpcMgmtEpEltInqNextW, "RpcMgmtEpEltInqNextW");
   --  rpcdce.h :1303
   pragma Import (Stdcall, RpcMgmtEpUnregister, "RpcMgmtEpUnregister");
   --  rpcdce.h :1330
   pragma Import (Stdcall, RpcMgmtSetAuthorizationFn,
                    "RpcMgmtSetAuthorizationFn");
   --  rpcdce.h :1351

end Win32.Rpcdce;


