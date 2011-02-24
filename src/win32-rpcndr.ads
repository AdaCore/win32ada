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
with Win32.Rpc;
with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Winnt;

package Win32.Rpcndr is

   NDR_CHAR_REP_MASK             : constant Win32.ULONG := 16#f#;
   NDR_INT_REP_MASK              : constant Win32.ULONG := 16#f0#;
   NDR_FLOAT_REP_MASK            : constant Win32.ULONG := 16#ff00#;
   NDR_LITTLE_ENDIAN             : constant Win32.ULONG := 16#10#;
   NDR_BIG_ENDIAN                : constant Win32.ULONG := 16#0#;
   NDR_IEEE_FLOAT                : constant Win32.ULONG := 16#0#;
   NDR_VAX_FLOAT                 : constant Win32.ULONG := 16#100#;
   NDR_ASCII_CHAR                : constant Win32.ULONG := 16#0#;
   NDR_EBCDIC_CHAR               : constant Win32.ULONG := 16#1#;
   NDR_LOCAL_DATA_REPRESENTATION : constant Win32.ULONG := 16#10#;
   cbNDRContext                  : constant := 20;

   subtype small is Win32.CHAR;
   type psmall is access small;

   function To_Psmall is new Ada.Unchecked_Conversion (PVOID, psmall);

   subtype byte is Win32.BYTE;
   type boolean is new Win32.UCHAR;
   subtype hyper is Win32.DWORDLONG;

   subtype MIDL_uhyper is Win32.DWORDLONG;
   type error_status_t is new Win32.ULONG;
   type RPC_LENGTH is new Win32.ULONG;

   type XLAT_SIDE is (XLAT_SERVER, XLAT_CLIENT);
   for XLAT_SIDE use (XLAT_SERVER => 1, XLAT_CLIENT => 2);
   for XLAT_SIDE'Size use 32;

   type STUB_PHASE is (
      STUB_UNMARSHAL,
      STUB_CALL_SERVER,
      STUB_MARSHAL,
      STUB_CALL_SERVER_NO_HRESULT);
   for STUB_PHASE'Size use 32;

   type NDR_CCONTEXT is new Win32.PVOID;
   type RPC_BUFPTR is new Win32.PUCHAR;
   type PFORMAT_STRING is new Win32.PCUCHAR;
   type PMIDL_XMIT_TYPE is new Win32.PVOID;
   subtype RPC_SS_THREAD_HANDLE is Win32.Winnt.HANDLE;

   function To_BUFPTR is new Ada.Unchecked_Conversion (ULONG_PTR, RPC_BUFPTR);
   function To_ULONG is new Ada.Unchecked_Conversion (RPC_BUFPTR, ULONG_PTR);

   type struct_anonymous1_t;
   type SCONTEXT_QUEUE;
   type MIDL_STUB_MESSAGE;
   type ARRAY_INFO;
   type GENERIC_BINDING_ROUTINE_PAIR;
   type GENERIC_BINDING_INFO;
   type XMIT_ROUTINE_QUINTUPLE;
   type IMPLICIT_HANDLE_INFO_Union;
   type MIDL_FORMAT_STRING;
   type MIDL_SERVER_INFO;
   type CLIENT_CALL_RETURN;
   type FULL_PTR_TO_REFID_ELEMENT;
   type struct_anonymous10_t;
   type struct_anonymous12_t;
   type MIDL_STUB_DESC;
   type FULL_PTR_XLAT_TABLES;

   type NDR_SCONTEXT is access all struct_anonymous1_t;
   type a_NDR_SCONTEXT_t is access all NDR_SCONTEXT;
   type PSCONTEXT_QUEUE is access all SCONTEXT_QUEUE;
   type PARRAY_INFO is access all ARRAY_INFO;
   type ac_MIDL_STUB_DESC_t is access all MIDL_STUB_DESC;
   type PMIDL_STUB_MESSAGE is access all MIDL_STUB_MESSAGE;
   type PGENERIC_BINDING_ROUTINE_PAIR is access all
     GENERIC_BINDING_ROUTINE_PAIR;
   type PGENERIC_BINDING_INFO is access all GENERIC_BINDING_INFO;
   type PXMIT_ROUTINE_QUINTUPLE is access all XMIT_ROUTINE_QUINTUPLE;
   type ac_GENERIC_BINDING_ROUTINE_PAIR_t is access all
     GENERIC_BINDING_ROUTINE_PAIR;
   type ac_XMIT_ROUTINE_QUINTUPLE_t is access all XMIT_ROUTINE_QUINTUPLE;
   type PMIDL_STUB_DESC is access all MIDL_STUB_DESC;
   type PMIDL_SERVER_INFO is access all MIDL_SERVER_INFO;
   type PFULL_PTR_TO_REFID_ELEMENT is access all FULL_PTR_TO_REFID_ELEMENT;
   type PPVOID is access all Win32.PVOID;
   type a_PFULL_PTR_TO_REFID_ELEMENT is access all PFULL_PTR_TO_REFID_ELEMENT;
   type PFULL_PTR_XLAT_TABLES is access all FULL_PTR_XLAT_TABLES;

   type PVOID_Array is array (Natural range <>) of Win32.PVOID;

   type struct_anonymous1_t is record
      pad         : PVOID_Array (0 .. 1);
      userContext : Win32.PVOID;
   end record;

   type NDR_RUNDOWN is access procedure (context : Win32.PVOID);
   pragma Convention (Stdcall, NDR_RUNDOWN);

   type SCONTEXT_QUEUE is record
      NumberOfObjects : Win32.ULONG;
      ArrayOfObjects  : a_NDR_SCONTEXT_t;
   end record;

   type a_IRpcChannelBuffer is access all Win32.Objbase.IRpcChannelBuffer;

   type Allocate_Func is access function
     (Size : Win32.Size_T)
      return Win32.PVOID;
   pragma Convention (Stdcall, Allocate_Func);

   type Free_Proc is access procedure (Obj : Win32.PVOID);
   pragma Convention (Stdcall, Free_Proc);

   type MIDL_STUB_MESSAGE is record
      RpcMsg                 : Win32.Rpcdcep.PRPC_MESSAGE;
      Buffer                 : Win32.PUCHAR;
      BufferStart            : Win32.PUCHAR;
      BufferEnd              : Win32.PUCHAR;
      BufferMark             : Win32.PUCHAR;
      BufferLength           : Win32.ULONG;
      MemorySize             : Win32.ULONG;
      Memory                 : Win32.PUCHAR;
      IsClient               : Win32.INT;
      ReuseBuffer            : Win32.INT;
      pAllocAllNodesContext  : Win32.PUCHAR;
      pPointerQueueState     : Win32.PUCHAR;
      IgnoreEmbeddedPointers : Win32.INT;
      PointerBufferMark      : Win32.PUCHAR;
      fBufferValid           : Win32.UCHAR;
      uFlags                 : Win32.UCHAR;
      Unused2                : Win32.USHORT;
      MaxCount               : Win32.ULONG_PTR;
      Offset                 : Win32.ULONG;
      ActualCount            : Win32.ULONG;
      pfnAllocate            : Allocate_Func;
      pfnFree                : Free_Proc;
      StackTop               : Win32.PUCHAR;
      pPresentedType         : Win32.PUCHAR;
      pTransmitType          : Win32.PUCHAR;
      SavedHandle            : Win32.Rpcdce.handle_t;
      StubDesc               : ac_MIDL_STUB_DESC_t;
      FullPtrXlatTables      : PMIDL_STUB_MESSAGE;
      FullPtrRefId           : Win32.ULONG;
      fCheckBounds           : Win32.INT;
      fInDontFree            : Win32.Bits1;
      fDontCallFreeInst      : Win32.Bits1;
      fInOnlyParam           : Win32.Bits1;
      fHasReturn             : Win32.Bits1;
      fHasExtensions         : Win32.Bits1;
      fHasNewCorrDesc        : Win32.Bits1;
      fUnused                : Win32.CHAR;
      dwDestContext          : Win32.ULONG;
      pvDestContext          : Win32.PVOID;
      pSavedHContext         : PSCONTEXT_QUEUE;
      ParamNumber            : Win32.LONG;
      pRpcChannelBuffer      : a_IRpcChannelBuffer;
      pArrayInfo             : PARRAY_INFO;
      SizePtrCountArray      : Win32.PULONG;
      SizePtrOffsetArray     : Win32.PULONG;
      SizePtrLengthArray     : Win32.PULONG;
      pArgQueue              : Win32.PVOID;
      dwStubPhase            : Win32.ULONG;
      LowStackMark           : Win32.PVOID;
      pAsyncMsg              : Win32.PVOID;
      pCorrInfo              : Win32.PVOID;
      pCorrMemory            : Win32.PUCHAR;
      pMemoryList            : Win32.PVOID;
      pCSInfo                : Win32.PVOID;
      ConformanceMark        : Win32.PUCHAR;
      VarianceMark           : Win32.PUCHAR;
      BackingStoreLowMark    : Win32.PVOID;
      Unused                 : Win32.INT_PTR;
      pContext               : Win32.PVOID;
      Reserved51_1           : Win32.INT_PTR;
      Reserved51_2           : Win32.INT_PTR;
      Reserved51_3           : Win32.INT_PTR;
      Reserved51_4           : Win32.INT_PTR;
      Reserved51_5           : Win32.INT_PTR;
   end record;

   AS : constant := LONG_PTR'Size - 1;
   WS : constant := LONG_PTR'Size / 8;

   for MIDL_STUB_MESSAGE use record
      RpcMsg                 at 0 * WS range 0 .. AS;
      Buffer                 at 1 * WS range 0 .. AS;
      BufferStart            at 2 * WS range 0 .. AS;
      BufferEnd              at 3 * WS range 0 .. AS;
      BufferMark             at 4 * WS range 0 .. AS;
      BufferLength           at 5 * WS range 0 .. 31;
      MemorySize             at 5 * WS + 1 * 4 range 0 .. 31;
      Memory                 at 5 * WS + 2 * 4 range 0 .. AS;
      IsClient               at 6 * WS + 2 * 4 range 0 .. 31;
      ReuseBuffer            at 6 * WS + 3 * 4 range 0 .. 31;
      pAllocAllNodesContext  at 6 * WS + 4 * 4 range 0 .. AS;
      pPointerQueueState     at 7 * WS + 4 * 4 range 0 .. AS;
      IgnoreEmbeddedPointers at 8 * WS + 4 * 4 range 0 .. 31;
      PointerBufferMark      at 9 * WS + 4 * 4 range 0 .. AS;
      fBufferValid           at 10 * WS + 4 * 4 range 0 .. 7;
      uFlags                 at 10 * WS + 4 * 4 range 8 .. 15;
      Unused2                at 10 * WS + 4 * 4 range 16 .. 31;
      MaxCount               at 11 * WS + 4 * 4 range 0 .. AS;
      Offset                 at 12 * WS + 4 * 4 range 0 .. 31;
      ActualCount            at 12 * WS + 5 * 4 range 0 .. 31;
      pfnAllocate            at 12 * WS + 6 * 4 range 0 .. AS;
      pfnFree                at 13 * WS + 6 * 4 range 0 .. AS;
      StackTop               at 14 * WS + 6 * 4 range 0 .. AS;
      pPresentedType         at 15 * WS + 6 * 4 range 0 .. AS;
      pTransmitType          at 16 * WS + 6 * 4 range 0 .. AS;
      SavedHandle            at 17 * WS + 6 * 4 range 0 .. AS;
      StubDesc               at 18 * WS + 6 * 4 range 0 .. AS;
      FullPtrXlatTables      at 19 * WS + 6 * 4 range 0 .. AS;
      FullPtrRefId           at 20 * WS + 6 * 4 range 0 .. 31;
      fCheckBounds           at 20 * WS + 7 * 4 range 0 .. 31;
      fInDontFree            at 20 * WS + 8 * 4 range 0 .. 0;
      fDontCallFreeInst      at 20 * WS + 8 * 4 range 1 .. 1;
      fInOnlyParam           at 20 * WS + 8 * 4 range 2 .. 2;
      fHasReturn             at 20 * WS + 8 * 4 range 3 .. 3;
      fHasExtensions         at 20 * WS + 8 * 4 range 4 .. 4;
      fHasNewCorrDesc        at 20 * WS + 8 * 4 range 5 .. 5;
      fUnused                at 20 * WS + 8 * 4 range 6 .. 31;
      dwDestContext          at 20 * WS + 9 * 4 range 0 .. 31;
      pvDestContext          at 20 * WS + 10 * 4 range 0 .. AS;
      pSavedHContext         at 21 * WS + 10 * 4 range 0 .. AS;
      ParamNumber            at 22 * WS + 10 * 4 range 0 .. 31;
      pRpcChannelBuffer      at 23 * WS + 10 * 4 range 0 .. AS;
      pArrayInfo             at 24 * WS + 10 * 4 range 0 .. AS;
      SizePtrCountArray      at 25 * WS + 10 * 4 range 0 .. AS;
      SizePtrOffsetArray     at 26 * WS + 10 * 4 range 0 .. AS;
      SizePtrLengthArray     at 27 * WS + 10 * 4 range 0 .. AS;
      pArgQueue              at 28 * WS + 10 * 4 range 0 .. AS;
      dwStubPhase            at 29 * WS + 10 * 4 range 0 .. 31;
      LowStackMark           at 30 * WS + 10 * 4 range 0 .. AS;
      pAsyncMsg              at 31 * WS + 10 * 4 range 0 .. AS;
      pCorrInfo              at 32 * WS + 10 * 4 range 0 .. AS;
      pCorrMemory            at 33 * WS + 10 * 4 range 0 .. AS;
      pMemoryList            at 34 * WS + 10 * 4 range 0 .. AS;
      pCSInfo                at 35 * WS + 10 * 4 range 0 .. AS;
      ConformanceMark        at 36 * WS + 10 * 4 range 0 .. AS;
      VarianceMark           at 37 * WS + 10 * 4 range 0 .. AS;
      BackingStoreLowMark    at 38 * WS + 10 * 4 range 0 .. AS;
      Unused                 at 39 * WS + 10 * 4 range 0 .. AS;
      pContext               at 40 * WS + 10 * 4 range 0 .. AS;
      Reserved51_1           at 41 * WS + 10 * 4 range 0 .. AS;
      Reserved51_2           at 42 * WS + 10 * 4 range 0 .. AS;
      Reserved51_3           at 43 * WS + 10 * 4 range 0 .. AS;
      Reserved51_4           at 44 * WS + 10 * 4 range 0 .. AS;
      Reserved51_5           at 45 * WS + 10 * 4 range 0 .. AS;
   end record;

   type EXPR_EVAL is access procedure (pStubMsg : PMIDL_STUB_MESSAGE);
   pragma Convention (Stdcall, EXPR_EVAL);

   type ARRAY_INFO is record
      Dimension             : Win32.LONG;
      BufferConformanceMark : Win32.PULONG;
      BufferVarianceMark    : Win32.PULONG;
      MaxCountArray         : Win32.PULONG;
      OffsetArray           : Win32.PULONG;
      ActualCountArray      : Win32.PULONG;
   end record;

   type GENERIC_BINDING_ROUTINE is access function
     (p1   : Win32.PVOID)
      return Win32.PVOID;
   pragma Convention (Stdcall, GENERIC_BINDING_ROUTINE);
   type GENERIC_UNBIND_ROUTINE is access procedure
     (p1 : Win32.PVOID;
      p2 : Win32.PUCHAR);
   pragma Convention (Stdcall, GENERIC_UNBIND_ROUTINE);

   type GENERIC_BINDING_ROUTINE_PAIR is record
      pfnBind   : GENERIC_BINDING_ROUTINE;
      pfnUnbind : GENERIC_UNBIND_ROUTINE;
   end record;

   type GENERIC_BINDING_INFO is record
      pObj      : Win32.PVOID;
      Size      : Win32.UINT;
      pfnBind   : GENERIC_BINDING_ROUTINE;
      pfnUnbind : GENERIC_UNBIND_ROUTINE;
   end record;

   type XMIT_HELPER_ROUTINE is access procedure
     (pStubMsg : PMIDL_STUB_MESSAGE);
   pragma Convention (Stdcall, XMIT_HELPER_ROUTINE);

   type XMIT_ROUTINE_QUINTUPLE is record
      pfnTranslateToXmit   : XMIT_HELPER_ROUTINE;
      pfnTranslateFromXmit : XMIT_HELPER_ROUTINE;
      pfnFreeXmit          : XMIT_HELPER_ROUTINE;
      pfnFreeInst          : XMIT_HELPER_ROUTINE;
   end record;

   type IMPLICIT_HANDLE_INFO_Union_Kind is (
      pAutoHandle_kind,
      pPrimitiveHandle_kind,
      pGenericBindingInfo_kind);

   type p_handle_t is access all Win32.Rpcdce.handle_t;

   type IMPLICIT_HANDLE_INFO_Union
     (Which : IMPLICIT_HANDLE_INFO_Union_Kind := pAutoHandle_kind)
   is
      record
         case Which is
            when pAutoHandle_kind =>
               pAutoHandle : p_handle_t;
            when pPrimitiveHandle_kind =>
               pPrimitiveHandle : p_handle_t;
            when pGenericBindingInfo_kind =>
               pGenericBindingInfo : PGENERIC_BINDING_INFO;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, IMPLICIT_HANDLE_INFO_Union);

   pragma Unchecked_Union (IMPLICIT_HANDLE_INFO_Union);

   type ac_NDR_RUNDOWN_t is access all NDR_RUNDOWN;

   type UCHAR_Array_0 is new Win32.UCHAR_Array (1 .. Win32.ANYSIZE_ARRAY);
   pragma Convention (C, UCHAR_Array_0);
   pragma Warnings (Off, UCHAR_Array_0);
   for UCHAR_Array_0'Size use (64 - Standard'Address_Size) / 4;

   type MIDL_FORMAT_STRING is record
      Pad    : Win32.SHORT;
      Format : UCHAR_Array_0;
   end record;

   type STUB_THUNK is access procedure (pStubMessage : PMIDL_STUB_MESSAGE);
   pragma Convention (Stdcall, STUB_THUNK);
   type SERVER_ROUTINE is access function return Win32.INT;
   pragma Convention (Stdcall, SERVER_ROUTINE);
   type ac_SERVER_ROUTINE_t is access all SERVER_ROUTINE;

   type MIDL_SERVER_INFO is record
      pStubDesc       : PMIDL_STUB_DESC;
      DispatchTable   : ac_SERVER_ROUTINE_t;
      ProcString      : PFORMAT_STRING;
      FmtStringOffset : Win32.PCWSTR;
      ThunkTable      : ac_NDR_RUNDOWN_t;
      pTransferSyntax : Rpcdcep.PRPC_SYNTAX_IDENTIFIER;
      nCount          : ULONG_PTR;
      pSyntaxInfo     : Win32.PVOID;
   end record;

   type CLIENT_CALL_RETURN_kind is (Pointer_kind, Simple_kind);

   type CLIENT_CALL_RETURN (Which : CLIENT_CALL_RETURN_kind := Pointer_kind) is
      record
         case Which is
            when Pointer_kind =>
               Pointer : Win32.PVOID;
            when Simple_kind =>
               Simple : Win32.INT;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, CLIENT_CALL_RETURN);

   pragma Unchecked_Union (CLIENT_CALL_RETURN);

   type FULL_PTR_TO_REFID_ELEMENT is record
      Next    : PFULL_PTR_TO_REFID_ELEMENT;
      Pointer : Win32.PVOID;
      RefId   : Win32.ULONG;
      State   : Win32.UCHAR;
   end record;

   type struct_anonymous10_t is record
      XlatTable       : PPVOID;
      StateTable      : Win32.PUCHAR;
      NumberOfEntries : Win32.ULONG;
   end record;

   type struct_anonymous12_t is record
      XlatTable       : a_PFULL_PTR_TO_REFID_ELEMENT;
      NumberOfBuckets : Win32.ULONG;
      HashMask        : Win32.ULONG;
   end record;

   type RPC_CLIENT_ALLOC is access function
     (Size : Win32.Size_T)
      return Win32.PVOID;
   pragma Convention (Stdcall, RPC_CLIENT_ALLOC);
   type RPC_CLIENT_FREE is access procedure (Ptr : Win32.PVOID);
   pragma Convention (Stdcall, RPC_CLIENT_FREE);

   type MIDL_STUB_DESC is record
      RpcInterfaceInformation     : Win32.PVOID;
      pfnAllocate                 : Allocate_Func;
      pfnFree                     : Free_Proc;
      IMPLICIT_HANDLE_INFO        : IMPLICIT_HANDLE_INFO_Union;
      apfnNdrRundownRoutines      : ac_NDR_RUNDOWN_t;
      aGenericBindingRoutinePairs : ac_GENERIC_BINDING_ROUTINE_PAIR_t;
      apfnExprEval                : ac_NDR_RUNDOWN_t;
      aXmitQuintuple              : ac_XMIT_ROUTINE_QUINTUPLE_t;
      pFormatTypes                : Win32.PCBYTE;
      fCheckBounds                : Win32.INT;
      Version                     : Win32.ULONG;
      pMallocFreeStruct           : Win32.PVOID;
      MIDLVersion                 : Win32.LONG;
      CommFaultOffsets            : Win32.PVOID;
      aUserMarshalQuadruple       : Win32.PVOID;
      NotifyRoutineTable          : Win32.PVOID;
      mFlags                      : Win32.ULONG_PTR;
      CsRoutineTables             : Win32.PVOID;
      Reserved4                   : Win32.PVOID;
      Reserved5                   : Win32.ULONG_PTR;
   end record;

   type FULL_PTR_XLAT_TABLES is record
      RefIdToPointer : struct_anonymous10_t;
      PointerToRefId : struct_anonymous12_t;
      NextRefId      : Win32.ULONG;
      XlatSide       : XLAT_SIDE;
   end record;

   function MIDL_user_allocate (p1 : Win32.Size_T) return Win32.PVOID;

   procedure MIDL_user_free (p1 : Win32.PVOID);

   function NDRSContextValue
     (hContext : access NDR_SCONTEXT)
      return System.Address;

   function NDRCContextBinding
     (CContext : NDR_CCONTEXT)
      return Win32.Rpcdce.RPC_BINDING_HANDLE;

   procedure NDRCContextMarshall
     (CContext : NDR_CCONTEXT;
      pBuff    : Win32.PVOID);

   procedure NDRCContextUnmarshall
     (pCContext          : access NDR_CCONTEXT;
      hBinding           : Win32.Rpcdce.RPC_BINDING_HANDLE;
      pBuff              : Win32.PVOID;
      DataRepresentation : Win32.ULONG);

   procedure NDRSContextMarshall
     (CContext      : NDR_SCONTEXT;
      pBuff         : Win32.PVOID;
      userRunDownIn : NDR_RUNDOWN);

   function NDRSContextUnmarshall
     (pBuff              : Win32.PVOID;
      DataRepresentation : Win32.ULONG)
      return NDR_SCONTEXT;

   procedure RpcSsDestroyClientContext (ContextHandle : PPVOID);

   procedure byte_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out Win32.PBYTE);

   procedure byte_array_from_ndr
     (Source     : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target     : Win32.PBYTE);

   procedure boolean_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out Win32.PBOOL);

   procedure boolean_array_from_ndr
     (Source     : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target     : Win32.PBOOL);

   procedure small_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out psmall);

   procedure small_array_from_ndr
     (Source     : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target     : out psmall);

   procedure NDRcopy
     (pTarget : Win32.PVOID;
      pSource : Win32.PVOID;
      size    : Win32.UINT);

   function MIDL_wchar_strlen (s : Win32.PWSTR) return Win32.Size_T;

   procedure MIDL_wchar_strcpy (t : Win32.PVOID; s : Win32.PWSTR);

   procedure char_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target        : Win32.PUCHAR);

   procedure char_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex    : Win32.ULONG;
      UpperIndex    : Win32.ULONG;
      Target        : Win32.PUCHAR);

   procedure short_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : Win32.PWSTR);

   procedure short_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex    : Win32.ULONG;
      UpperIndex    : Win32.ULONG;
      Target        : Win32.PWSTR);

   procedure short_from_ndr_temp
     (source : access Win32.PUCHAR;
      target : Win32.PWSTR;
      format : Win32.ULONG);

   procedure long_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : access Win32.ULONG);

   procedure long_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex    : Win32.ULONG;
      UpperIndex    : Win32.ULONG;
      Target        : access Win32.ULONG);

   procedure long_from_ndr_temp
     (source : access Win32.PUCHAR;
      target : access Win32.ULONG;
      format : Win32.ULONG);

   procedure enum_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target        : access Win32.UINT);

   procedure float_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target        : Win32.PVOID);

   procedure float_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex    : Win32.ULONG;
      UpperIndex    : Win32.ULONG;
      Target        : Win32.PVOID);

   procedure double_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target        : Win32.PVOID);

   procedure double_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex    : Win32.ULONG;
      UpperIndex    : Win32.ULONG;
      Target        : Win32.PVOID);

   procedure hyper_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out hyper);

   procedure hyper_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex    : Win32.ULONG;
      UpperIndex    : Win32.ULONG;
      Target        : out hyper);

   procedure hyper_from_ndr_temp
     (source : access Win32.PUCHAR;
      target : out hyper;
      format : Win32.ULONG);

   procedure data_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : Win32.PVOID;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);

   procedure data_into_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);

   procedure tree_into_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);

   procedure data_size_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);

   procedure tree_size_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);

   procedure tree_peek_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      buffer : access Win32.PUCHAR;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);

   function midl_allocate (size : Win32.Size_T) return Win32.PVOID;

   procedure midl_fa2 (p : in out RPC_BUFPTR);
   procedure midl_fa4 (p : in out RPC_BUFPTR);
   procedure midl_fa8 (p : in out RPC_BUFPTR);

   procedure midl_addp (p : in out Win32.PVOID; n : Win32.ULONG);

   procedure midl_unmarsh_up (p : in out Win32.PVOID);

   procedure NdrMarshConfStringHdr
     (p : in out Win32.PVOID;
      s : Win32.PUCHAR;
      l : Win32.ULONG);

   procedure NdrUnMarshConfStringHdr
     (p : in out Win32.PVOID;
      s : out Win32.PUCHAR;
      l : out Win32.ULONG);

   function NdrMarshCCtxtHdl
     (pc   : NDR_CCONTEXT;
      p    : Win32.PVOID)
      return Win32.ULONG;

   function NdrUnMarshCCtxtHdl
     (pc   : access NDR_CCONTEXT;
      p    : Win32.PVOID;
      h    : Win32.Rpcdce.RPC_BINDING_HANDLE;
      drep : Win32.ULONG)
      return Win32.ULONG;

   procedure NdrUnMarshSCtxtHdl
     (pc   : out NDR_SCONTEXT;
      p    : Win32.PVOID;
      drep : Win32.ULONG);

   procedure NdrMarshSCtxtHdl
     (pc : NDR_SCONTEXT;
      p  : Win32.PVOID;
      rd : NDR_RUNDOWN);

   function NdrFcShort (s : Win32.USHORT) return Win32.UCHAR;

   procedure NdrSimpleTypeMarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      pMemory    : Win32.PUCHAR;
      FormatChar : Win32.UCHAR);

   function NdrPointerMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrSimpleStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrConformantStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrConformantVaryingStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrComplexStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrFixedArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrConformantArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrConformantVaryingArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrVaryingArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrComplexArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrNonConformantStringMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrConformantStringMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrEncapsulatedUnionMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrNonEncapsulatedUnionMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrByteCountPointerMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrXmitOrRepAsMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   function NdrInterfacePointerMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING)
      return Win32.PUCHAR;

   procedure NdrClientContextMarshall
     (pStubMsg      : PMIDL_STUB_MESSAGE;
      ContextHandle : NDR_CCONTEXT;
      fCheck        : Win32.INT);

   procedure NdrServerContextMarshall
     (pStubMsg       : PMIDL_STUB_MESSAGE;
      ContextHandle  : NDR_SCONTEXT;
      RundownRoutine : NDR_RUNDOWN);

   procedure NdrSimpleTypeUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      pMemory    : Win32.PUCHAR;
      FormatChar : Win32.UCHAR);

   function NdrPointerUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrSimpleStructUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrConformantStructUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrConformantVaryingStructUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrComplexStructUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrFixedArrayUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrConformantArrayUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrConformantVaryingArrayUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrVaryingArrayUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrComplexArrayUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrNonConformantStringUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrConformantStringUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrEncapsulatedUnionUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrNonEncapsulatedUnionUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrByteCountPointerUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrXmitOrRepAsUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   function NdrInterfacePointerUnmarshall
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      ppMemory   : access Win32.PUCHAR;
      pFormat    : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
      return Win32.PUCHAR;

   procedure NdrClientContextUnmarshall
     (pStubMsg       : PMIDL_STUB_MESSAGE;
      pContextHandle : access NDR_CCONTEXT;
      BindHandle     : Win32.Rpcdce.RPC_BINDING_HANDLE);

   function NdrServerContextUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE)
      return NDR_SCONTEXT;

   procedure NdrPointerBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrSimpleStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantVaryingStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrComplexStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrFixedArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantVaryingArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrVaryingArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrComplexArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantStringBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrNonConformantStringBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrEncapsulatedUnionBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrNonEncapsulatedUnionBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrByteCountPointerBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrXmitOrRepAsBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrInterfacePointerBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrContextHandleSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   function NdrPointerMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrSimpleStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrConformantStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrConformantVaryingStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrComplexStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrFixedArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrConformantArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrConformantVaryingArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrVaryingArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrComplexArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrConformantStringMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrNonConformantStringMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrEncapsulatedUnionMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrNonEncapsulatedUnionMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrXmitOrRepAsMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   function NdrInterfacePointerMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING)
      return Win32.ULONG;

   procedure NdrPointerFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrSimpleStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantVaryingStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrComplexStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrFixedArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConformantVaryingArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrVaryingArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrComplexArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrEncapsulatedUnionFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrNonEncapsulatedUnionFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrByteCountPointerFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrXmitOrRepAsFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrInterfacePointerFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      pFormat  : PFORMAT_STRING);

   procedure NdrConvert
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING);

   procedure NdrClientInitializeNew
     (pRpcMsg         : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg        : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      ProcNum         : Win32.UINT);

   function NdrServerInitializeNew
     (pRpcMsg         : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg        : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC)
      return Win32.PUCHAR;

   procedure NdrClientInitialize
     (pRpcMsg         : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg        : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      ProcNum         : Win32.UINT);

   function NdrServerInitialize
     (pRpcMsg         : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg        : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC)
      return Win32.PUCHAR;

   function NdrServerInitializeUnmarshall
     (pStubMsg        : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      pRpcMsg         : Win32.Rpcdcep.PRPC_MESSAGE)
      return Win32.PUCHAR;

   procedure NdrServerInitializeMarshall
     (pRpcMsg  : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : PMIDL_STUB_MESSAGE);

   function NdrGetBuffer
     (pStubMsg     : PMIDL_STUB_MESSAGE;
      BufferLength : Win32.ULONG;
      Handle       : Win32.Rpcdce.RPC_BINDING_HANDLE)
      return Win32.PUCHAR;

   function NdrNsGetBuffer
     (pStubMsg     : PMIDL_STUB_MESSAGE;
      BufferLength : Win32.ULONG;
      Handle       : Win32.Rpcdce.RPC_BINDING_HANDLE)
      return Win32.PUCHAR;

   function NdrSendReceive
     (pStubMsg   : PMIDL_STUB_MESSAGE;
      pBufferEnd : Win32.PUCHAR)
      return Win32.PUCHAR;

   function NdrNsSendReceive
     (pStubMsg    : PMIDL_STUB_MESSAGE;
      pBufferEnd  : Win32.PUCHAR;
      pAutoHandle : access Win32.Rpc.RPC_BINDING_HANDLE)
      return Win32.PUCHAR;

   procedure NdrFreeBuffer (pStubMsg : PMIDL_STUB_MESSAGE);

   function NdrStubCall
     (pThis        : access Win32.Objbase.IRpcStubBuffer;
      pChannel     : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMsg      : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : access Win32.ULONG)
      return Win32.LONG;

   procedure NdrServerCall (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE);

   function NdrServerUnmarshall
     (pChannel        : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMsg         : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg        : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      pFormat         : PFORMAT_STRING;
      pParamList      : Win32.PVOID)
      return Win32.INT;

   procedure NdrServerMarshall
     (pThis    : access Win32.Objbase.IRpcStubBuffer;
      pChannel : access Win32.Objbase.IRpcChannelBuffer;
      pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING);

   function NdrMapCommAndFaultStatus
     (pStubMsg     : PMIDL_STUB_MESSAGE;
      pCommStatus  : access Win32.ULONG;
      pFaultStatus : access Win32.ULONG;
      Status       : Win32.Rpc.RPC_STATUS)
      return Win32.Rpc.RPC_STATUS;

   function NdrSH_UPDecision
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      pBuffer   : RPC_BUFPTR)
      return Win32.INT;

   function NdrSH_TLUPDecision
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR)
      return Win32.INT;

   function NdrSH_TLUPDecisionBuffer
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR)
      return Win32.INT;

   function NdrSH_IfAlloc
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count     : Win32.ULONG)
      return Win32.INT;

   function NdrSH_IfAllocRef
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count     : Win32.ULONG)
      return Win32.INT;

   function NdrSH_IfAllocSet
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count     : Win32.ULONG)
      return Win32.INT;

   function NdrSH_IfCopy
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count     : Win32.ULONG)
      return RPC_BUFPTR;

   function NdrSH_IfAllocCopy
     (pStubMsg  : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count     : Win32.ULONG)
      return RPC_BUFPTR;

   function NdrSH_Copy
     (pStubMsg  : Win32.PUCHAR;
      pPtrInMem : Win32.PUCHAR;
      Count     : Win32.ULONG)
      return Win32.ULONG;

   procedure NdrSH_IfFree
     (pMessage : PMIDL_STUB_MESSAGE;
      pPtr     : Win32.PUCHAR);

   function NdrSH_StringMarshall
     (pMessage : PMIDL_STUB_MESSAGE;
      pMemory  : Win32.PUCHAR;
      Count    : Win32.ULONG;
      Size     : Win32.INT)
      return RPC_BUFPTR;

   function NdrSH_StringUnMarshall
     (pMessage : PMIDL_STUB_MESSAGE;
      pMemory  : access Win32.PUCHAR;
      Size     : Win32.INT)
      return RPC_BUFPTR;

   function RpcSsAllocate (Size : Win32.Size_T) return Win32.PVOID;

   procedure RpcSsDisableAllocate;

   procedure RpcSsEnableAllocate;

   procedure RpcSsFree (NodeToFree : Win32.PVOID);

   function RpcSsGetThreadHandle return RPC_SS_THREAD_HANDLE;

   procedure RpcSsSetClientAllocFree
     (ClientAlloc : RPC_CLIENT_ALLOC;
      ClientFree  : RPC_CLIENT_FREE);

   procedure RpcSsSetThreadHandle (Id : RPC_SS_THREAD_HANDLE);

   procedure RpcSsSwapClientAllocFree
     (ClientAlloc    : RPC_CLIENT_ALLOC;
      ClientFree     : RPC_CLIENT_FREE;
      OldClientAlloc : access RPC_CLIENT_ALLOC;
      OldClientFree  : access RPC_CLIENT_FREE);

   function RpcSmAllocate
     (Size    : Win32.Size_T;
      pStatus : access Win32.Rpc.RPC_STATUS)
      return Win32.PVOID;

   function RpcSmClientFree
     (pNodeToFree : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcSmDestroyClientContext
     (ContextHandle : PPVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcSmDisableAllocate return Win32.Rpc.RPC_STATUS;

   function RpcSmEnableAllocate return Win32.Rpc.RPC_STATUS;

   function RpcSmFree
     (NodeToFree : Win32.PVOID)
      return Win32.Rpc.RPC_STATUS;

   function RpcSmGetThreadHandle
     (pStatus : access Win32.Rpc.RPC_STATUS)
      return RPC_SS_THREAD_HANDLE;

   function RpcSmSetClientAllocFree
     (ClientAlloc : RPC_CLIENT_ALLOC;
      ClientFree  : RPC_CLIENT_FREE)
      return Win32.Rpc.RPC_STATUS;

   function RpcSmSetThreadHandle
     (Id   : RPC_SS_THREAD_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcSmSwapClientAllocFree
     (ClientAlloc    : RPC_CLIENT_ALLOC;
      ClientFree     : RPC_CLIENT_FREE;
      OldClientAlloc : access RPC_CLIENT_ALLOC;
      OldClientFree  : access RPC_CLIENT_FREE)
      return Win32.Rpc.RPC_STATUS;

   procedure NdrRpcSsEnableAllocate (pMessage : PMIDL_STUB_MESSAGE);

   procedure NdrRpcSsDisableAllocate (pMessage : PMIDL_STUB_MESSAGE);

   procedure NdrRpcSmSetClientToOsf (pMessage : PMIDL_STUB_MESSAGE);

   function NdrRpcSmClientAllocate (Size : Win32.Size_T) return Win32.PVOID;

   procedure NdrRpcSmClientFree (NodeToFree : Win32.PVOID);

   function NdrRpcSsDefaultAllocate
     (Size : Win32.Size_T)
      return Win32.PVOID;

   procedure NdrRpcSsDefaultFree (NodeToFree : Win32.PVOID);

   function NdrFullPointerXlatInit
     (NumberOfPointers : Win32.ULONG;
      XlatSide         : XLAT_SIDE)
      return PFULL_PTR_XLAT_TABLES;

   procedure NdrFullPointerXlatFree (pXlatTables : PFULL_PTR_XLAT_TABLES);

   function NdrFullPointerQueryPointer
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      pPointer    : Win32.PVOID;
      QueryType   : Win32.UCHAR;
      pRefId      : access Win32.ULONG)
      return Win32.INT;

   function NdrFullPointerQueryRefId
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      RefId       : Win32.ULONG;
      QueryType   : Win32.UCHAR;
      ppPointer   : PPVOID)
      return Win32.INT;

   procedure NdrFullPointerInsertRefId
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      RefId       : Win32.ULONG;
      pPointer    : Win32.PVOID);

   function NdrFullPointerFree
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      Pointer     : Win32.PVOID)
      return Win32.INT;

   function NdrAllocate
     (pStubMsg : PMIDL_STUB_MESSAGE;
      Len      : Win32.Size_T)
      return Win32.PVOID;

   procedure NdrClearOutParameters
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat  : PFORMAT_STRING;
      ArgAddr  : Win32.PVOID);

   function NdrOleAllocate (Size : Win32.Size_T) return Win32.PVOID;

   procedure NdrOleFree (NodeToFree : Win32.PVOID);

private

   pragma Convention (C_Pass_By_Copy, struct_anonymous1_t);
   pragma Convention (C_Pass_By_Copy, SCONTEXT_QUEUE);
   pragma Convention (C, MIDL_STUB_MESSAGE);
   pragma Convention (C, ARRAY_INFO);
   pragma Convention (C_Pass_By_Copy, GENERIC_BINDING_ROUTINE_PAIR);
   pragma Convention (C_Pass_By_Copy, GENERIC_BINDING_INFO);
   pragma Convention (C_Pass_By_Copy, XMIT_ROUTINE_QUINTUPLE);
   pragma Convention (C_Pass_By_Copy, MIDL_FORMAT_STRING);
   pragma Convention (C, MIDL_SERVER_INFO);
   pragma Convention (C_Pass_By_Copy, FULL_PTR_TO_REFID_ELEMENT);
   pragma Convention (C_Pass_By_Copy, struct_anonymous10_t);
   pragma Convention (C_Pass_By_Copy, struct_anonymous12_t);
   pragma Convention (C, MIDL_STUB_DESC);
   pragma Convention (C, FULL_PTR_XLAT_TABLES);

   pragma Import (Stdcall, MIDL_user_allocate, "MIDL_user_allocate");
   pragma Import (Stdcall, MIDL_user_free, "MIDL_user_free");
   pragma Import (Stdcall, NDRCContextBinding, "NDRCContextBinding");
   pragma Import (Stdcall, NDRCContextMarshall, "NDRCContextMarshall");
   pragma Import (Stdcall, NDRCContextUnmarshall, "NDRCContextUnmarshall");
   pragma Import (Stdcall, NDRSContextMarshall, "NDRSContextMarshall");
   pragma Import (Stdcall, NDRSContextUnmarshall, "NDRSContextUnmarshall");
   pragma Import
     (Stdcall,
      RpcSsDestroyClientContext,
      "RpcSsDestroyClientContext");
   pragma Import (Stdcall, NDRcopy, "NDRcopy");
   pragma Import (Stdcall, MIDL_wchar_strlen, "MIDL_wchar_strlen");
   pragma Import (Stdcall, MIDL_wchar_strcpy, "MIDL_wchar_strcpy");
   pragma Import (Stdcall, char_from_ndr, "char_from_ndr");
   pragma Import (Stdcall, char_array_from_ndr, "char_array_from_ndr");
   pragma Import (Stdcall, short_from_ndr, "short_from_ndr");
   pragma Import (Stdcall, short_array_from_ndr, "short_array_from_ndr");
   pragma Import (Stdcall, short_from_ndr_temp, "short_from_ndr_temp");
   pragma Import (Stdcall, long_from_ndr, "long_from_ndr");
   pragma Import (Stdcall, long_array_from_ndr, "long_array_from_ndr");
   pragma Import (Stdcall, long_from_ndr_temp, "long_from_ndr_temp");
   pragma Import (Stdcall, enum_from_ndr, "enum_from_ndr");
   pragma Import (Stdcall, float_from_ndr, "float_from_ndr");
   pragma Import (Stdcall, float_array_from_ndr, "float_array_from_ndr");
   pragma Import (Stdcall, double_from_ndr, "double_from_ndr");
   pragma Import (Stdcall, double_array_from_ndr, "double_array_from_ndr");
   pragma Import (Stdcall, hyper_from_ndr, "hyper_from_ndr");
   pragma Import (Stdcall, hyper_array_from_ndr, "hyper_array_from_ndr");
   pragma Import (Stdcall, hyper_from_ndr_temp, "hyper_from_ndr_temp");
   pragma Import (Stdcall, data_from_ndr, "data_from_ndr");
   pragma Import (Stdcall, data_into_ndr, "data_into_ndr");
   pragma Import (Stdcall, tree_into_ndr, "tree_into_ndr");
   pragma Import (Stdcall, data_size_ndr, "data_size_ndr");
   pragma Import (Stdcall, tree_size_ndr, "tree_size_ndr");
   pragma Import (Stdcall, tree_peek_ndr, "tree_peek_ndr");
   pragma Import (Stdcall, midl_allocate, "midl_allocate");
   pragma Import (Stdcall, NdrSimpleTypeMarshall, "NdrSimpleTypeMarshall");
   pragma Import (Stdcall, NdrPointerMarshall, "NdrPointerMarshall");
   pragma Import
     (Stdcall,
      NdrSimpleStructMarshall,
      "NdrSimpleStructMarshall");
   pragma Import
     (Stdcall,
      NdrConformantStructMarshall,
      "NdrConformantStructMarshall");
   pragma Import
     (Stdcall,
      NdrConformantVaryingStructMarshall,
      "NdrConformantVaryingStructMarshall");
   pragma Import
     (Stdcall,
      NdrComplexStructMarshall,
      "NdrComplexStructMarshall");
   pragma Import (Stdcall, NdrFixedArrayMarshall, "NdrFixedArrayMarshall");
   pragma Import
     (Stdcall,
      NdrConformantArrayMarshall,
      "NdrConformantArrayMarshall");
   pragma Import
     (Stdcall,
      NdrConformantVaryingArrayMarshall,
      "NdrConformantVaryingArrayMarshall");
   pragma Import
     (Stdcall,
      NdrVaryingArrayMarshall,
      "NdrVaryingArrayMarshall");
   pragma Import
     (Stdcall,
      NdrComplexArrayMarshall,
      "NdrComplexArrayMarshall");
   pragma Import
     (Stdcall,
      NdrNonConformantStringMarshall,
      "NdrNonConformantStringMarshall");
   pragma Import
     (Stdcall,
      NdrConformantStringMarshall,
      "NdrConformantStringMarshall");
   pragma Import
     (Stdcall,
      NdrEncapsulatedUnionMarshall,
      "NdrEncapsulatedUnionMarshall");
   pragma Import
     (Stdcall,
      NdrNonEncapsulatedUnionMarshall,
      "NdrNonEncapsulatedUnionMarshall");
   pragma Import
     (Stdcall,
      NdrByteCountPointerMarshall,
      "NdrByteCountPointerMarshall");
   pragma Import (Stdcall, NdrXmitOrRepAsMarshall, "NdrXmitOrRepAsMarshall");
   pragma Import
     (Stdcall,
      NdrInterfacePointerMarshall,
      "NdrInterfacePointerMarshall");
   pragma Import
     (Stdcall,
      NdrClientContextMarshall,
      "NdrClientContextMarshall");
   pragma Import
     (Stdcall,
      NdrServerContextMarshall,
      "NdrServerContextMarshall");
   pragma Import
     (Stdcall,
      NdrSimpleTypeUnmarshall,
      "NdrSimpleTypeUnmarshall");
   pragma Import (Stdcall, NdrPointerUnmarshall, "NdrPointerUnmarshall");
   pragma Import
     (Stdcall,
      NdrSimpleStructUnmarshall,
      "NdrSimpleStructUnmarshall");
   pragma Import
     (Stdcall,
      NdrConformantStructUnmarshall,
      "NdrConformantStructUnmarshall");
   pragma Import
     (Stdcall,
      NdrConformantVaryingStructUnmarshall,
      "NdrConformantVaryingStructUnmarshall");
   pragma Import
     (Stdcall,
      NdrComplexStructUnmarshall,
      "NdrComplexStructUnmarshall");
   pragma Import
     (Stdcall,
      NdrFixedArrayUnmarshall,
      "NdrFixedArrayUnmarshall");
   pragma Import
     (Stdcall,
      NdrConformantArrayUnmarshall,
      "NdrConformantArrayUnmarshall");
   pragma Import
     (Stdcall,
      NdrConformantVaryingArrayUnmarshall,
      "NdrConformantVaryingArrayUnmarshall");
   pragma Import
     (Stdcall,
      NdrVaryingArrayUnmarshall,
      "NdrVaryingArrayUnmarshall");
   pragma Import
     (Stdcall,
      NdrComplexArrayUnmarshall,
      "NdrComplexArrayUnmarshall");
   pragma Import
     (Stdcall,
      NdrNonConformantStringUnmarshall,
      "NdrNonConformantStringUnmarshall");
   pragma Import
     (Stdcall,
      NdrConformantStringUnmarshall,
      "NdrConformantStringUnmarshall");
   pragma Import
     (Stdcall,
      NdrEncapsulatedUnionUnmarshall,
      "NdrEncapsulatedUnionUnmarshall");
   pragma Import
     (Stdcall,
      NdrNonEncapsulatedUnionUnmarshall,
      "NdrNonEncapsulatedUnionUnmarshall");
   pragma Import
     (Stdcall,
      NdrByteCountPointerUnmarshall,
      "NdrByteCountPointerUnmarshall");
   pragma Import
     (Stdcall,
      NdrXmitOrRepAsUnmarshall,
      "NdrXmitOrRepAsUnmarshall");
   pragma Import
     (Stdcall,
      NdrInterfacePointerUnmarshall,
      "NdrInterfacePointerUnmarshall");
   pragma Import
     (Stdcall,
      NdrClientContextUnmarshall,
      "NdrClientContextUnmarshall");
   pragma Import
     (Stdcall,
      NdrServerContextUnmarshall,
      "NdrServerContextUnmarshall");
   pragma Import (Stdcall, NdrPointerBufferSize, "NdrPointerBufferSize");
   pragma Import
     (Stdcall,
      NdrSimpleStructBufferSize,
      "NdrSimpleStructBufferSize");
   pragma Import
     (Stdcall,
      NdrConformantStructBufferSize,
      "NdrConformantStructBufferSize");
   pragma Import
     (Stdcall,
      NdrConformantVaryingStructBufferSize,
      "NdrConformantVaryingStructBufferSize");
   pragma Import
     (Stdcall,
      NdrComplexStructBufferSize,
      "NdrComplexStructBufferSize");
   pragma Import
     (Stdcall,
      NdrFixedArrayBufferSize,
      "NdrFixedArrayBufferSize");
   pragma Import
     (Stdcall,
      NdrConformantArrayBufferSize,
      "NdrConformantArrayBufferSize");
   pragma Import
     (Stdcall,
      NdrConformantVaryingArrayBufferSize,
      "NdrConformantVaryingArrayBufferSize");
   pragma Import
     (Stdcall,
      NdrVaryingArrayBufferSize,
      "NdrVaryingArrayBufferSize");
   pragma Import
     (Stdcall,
      NdrComplexArrayBufferSize,
      "NdrComplexArrayBufferSize");
   pragma Import
     (Stdcall,
      NdrConformantStringBufferSize,
      "NdrConformantStringBufferSize");
   pragma Import
     (Stdcall,
      NdrNonConformantStringBufferSize,
      "NdrNonConformantStringBufferSize");
   pragma Import
     (Stdcall,
      NdrEncapsulatedUnionBufferSize,
      "NdrEncapsulatedUnionBufferSize");
   pragma Import
     (Stdcall,
      NdrNonEncapsulatedUnionBufferSize,
      "NdrNonEncapsulatedUnionBufferSize");
   pragma Import
     (Stdcall,
      NdrByteCountPointerBufferSize,
      "NdrByteCountPointerBufferSize");
   pragma Import
     (Stdcall,
      NdrXmitOrRepAsBufferSize,
      "NdrXmitOrRepAsBufferSize");
   pragma Import
     (Stdcall,
      NdrInterfacePointerBufferSize,
      "NdrInterfacePointerBufferSize");
   pragma Import (Stdcall, NdrContextHandleSize, "NdrContextHandleSize");
   pragma Import (Stdcall, NdrPointerMemorySize, "NdrPointerMemorySize");
   pragma Import
     (Stdcall,
      NdrSimpleStructMemorySize,
      "NdrSimpleStructMemorySize");
   pragma Import
     (Stdcall,
      NdrConformantStructMemorySize,
      "NdrConformantStructMemorySize");
   pragma Import
     (Stdcall,
      NdrConformantVaryingStructMemorySize,
      "NdrConformantVaryingStructMemorySize");
   pragma Import
     (Stdcall,
      NdrComplexStructMemorySize,
      "NdrComplexStructMemorySize");
   pragma Import
     (Stdcall,
      NdrFixedArrayMemorySize,
      "NdrFixedArrayMemorySize");
   pragma Import
     (Stdcall,
      NdrConformantArrayMemorySize,
      "NdrConformantArrayMemorySize");
   pragma Import
     (Stdcall,
      NdrConformantVaryingArrayMemorySize,
      "NdrConformantVaryingArrayMemorySize");
   pragma Import
     (Stdcall,
      NdrVaryingArrayMemorySize,
      "NdrVaryingArrayMemorySize");
   pragma Import
     (Stdcall,
      NdrComplexArrayMemorySize,
      "NdrComplexArrayMemorySize");
   pragma Import
     (Stdcall,
      NdrConformantStringMemorySize,
      "NdrConformantStringMemorySize");
   pragma Import
     (Stdcall,
      NdrNonConformantStringMemorySize,
      "NdrNonConformantStringMemorySize");
   pragma Import
     (Stdcall,
      NdrEncapsulatedUnionMemorySize,
      "NdrEncapsulatedUnionMemorySize");
   pragma Import
     (Stdcall,
      NdrNonEncapsulatedUnionMemorySize,
      "NdrNonEncapsulatedUnionMemorySize");
   pragma Import
     (Stdcall,
      NdrXmitOrRepAsMemorySize,
      "NdrXmitOrRepAsMemorySize");
   pragma Import
     (Stdcall,
      NdrInterfacePointerMemorySize,
      "NdrInterfacePointerMemorySize");
   pragma Import (Stdcall, NdrPointerFree, "NdrPointerFree");
   pragma Import (Stdcall, NdrSimpleStructFree, "NdrSimpleStructFree");
   pragma Import
     (Stdcall,
      NdrConformantStructFree,
      "NdrConformantStructFree");
   pragma Import
     (Stdcall,
      NdrConformantVaryingStructFree,
      "NdrConformantVaryingStructFree");
   pragma Import (Stdcall, NdrComplexStructFree, "NdrComplexStructFree");
   pragma Import (Stdcall, NdrFixedArrayFree, "NdrFixedArrayFree");
   pragma Import (Stdcall, NdrConformantArrayFree, "NdrConformantArrayFree");
   pragma Import
     (Stdcall,
      NdrConformantVaryingArrayFree,
      "NdrConformantVaryingArrayFree");
   pragma Import (Stdcall, NdrVaryingArrayFree, "NdrVaryingArrayFree");
   pragma Import (Stdcall, NdrComplexArrayFree, "NdrComplexArrayFree");
   pragma Import
     (Stdcall,
      NdrEncapsulatedUnionFree,
      "NdrEncapsulatedUnionFree");
   pragma Import
     (Stdcall,
      NdrNonEncapsulatedUnionFree,
      "NdrNonEncapsulatedUnionFree");
   pragma Import
     (Stdcall,
      NdrByteCountPointerFree,
      "NdrByteCountPointerFree");
   pragma Import (Stdcall, NdrXmitOrRepAsFree, "NdrXmitOrRepAsFree");
   pragma Import
     (Stdcall,
      NdrInterfacePointerFree,
      "NdrInterfacePointerFree");
   pragma Import (Stdcall, NdrConvert, "NdrConvert");
   pragma Import (Stdcall, NdrClientInitializeNew, "NdrClientInitializeNew");
   pragma Import (Stdcall, NdrServerInitializeNew, "NdrServerInitializeNew");
   pragma Import (Stdcall, NdrClientInitialize, "NdrClientInitialize");
   pragma Import (Stdcall, NdrServerInitialize, "NdrServerInitialize");
   pragma Import
     (Stdcall,
      NdrServerInitializeUnmarshall,
      "NdrServerInitializeUnmarshall");
   pragma Import
     (Stdcall,
      NdrServerInitializeMarshall,
      "NdrServerInitializeMarshall");
   pragma Import (Stdcall, NdrGetBuffer, "NdrGetBuffer");
   pragma Import (Stdcall, NdrNsGetBuffer, "NdrNsGetBuffer");
   pragma Import (Stdcall, NdrSendReceive, "NdrSendReceive");
   pragma Import (Stdcall, NdrNsSendReceive, "NdrNsSendReceive");
   pragma Import (Stdcall, NdrFreeBuffer, "NdrFreeBuffer");
   pragma Import (Stdcall, NdrStubCall, "NdrStubCall");
   pragma Import (Stdcall, NdrServerCall, "NdrServerCall");
   pragma Import (Stdcall, NdrServerUnmarshall, "NdrServerUnmarshall");
   pragma Import (Stdcall, NdrServerMarshall, "NdrServerMarshall");
   pragma Import
     (Stdcall,
      NdrMapCommAndFaultStatus,
      "NdrMapCommAndFaultStatus");
   pragma Import (Stdcall, NdrSH_UPDecision, "NdrSH_UPDecision");
   pragma Import (Stdcall, NdrSH_TLUPDecision, "NdrSH_TLUPDecision");
   pragma Import
     (Stdcall,
      NdrSH_TLUPDecisionBuffer,
      "NdrSH_TLUPDecisionBuffer");
   pragma Import (Stdcall, NdrSH_IfAlloc, "NdrSH_IfAlloc");
   pragma Import (Stdcall, NdrSH_IfAllocRef, "NdrSH_IfAllocRef");
   pragma Import (Stdcall, NdrSH_IfAllocSet, "NdrSH_IfAllocSet");
   pragma Import (Stdcall, NdrSH_IfCopy, "NdrSH_IfCopy");
   pragma Import (Stdcall, NdrSH_IfAllocCopy, "NdrSH_IfAllocCopy");
   pragma Import (Stdcall, NdrSH_Copy, "NdrSH_Copy");
   pragma Import (Stdcall, NdrSH_IfFree, "NdrSH_IfFree");
   pragma Import (Stdcall, NdrSH_StringMarshall, "NdrSH_StringMarshall");
   pragma Import (Stdcall, NdrSH_StringUnMarshall, "NdrSH_StringUnMarshall");
   pragma Import (Stdcall, RpcSsAllocate, "RpcSsAllocate");
   pragma Import (Stdcall, RpcSsDisableAllocate, "RpcSsDisableAllocate");
   pragma Import (Stdcall, RpcSsEnableAllocate, "RpcSsEnableAllocate");
   pragma Import (Stdcall, RpcSsFree, "RpcSsFree");
   pragma Import (Stdcall, RpcSsGetThreadHandle, "RpcSsGetThreadHandle");
   pragma Import
     (Stdcall,
      RpcSsSetClientAllocFree,
      "RpcSsSetClientAllocFree");
   pragma Import (Stdcall, RpcSsSetThreadHandle, "RpcSsSetThreadHandle");
   pragma Import
     (Stdcall,
      RpcSsSwapClientAllocFree,
      "RpcSsSwapClientAllocFree");
   pragma Import (Stdcall, RpcSmAllocate, "RpcSmAllocate");
   pragma Import (Stdcall, RpcSmClientFree, "RpcSmClientFree");
   pragma Import
     (Stdcall,
      RpcSmDestroyClientContext,
      "RpcSmDestroyClientContext");
   pragma Import (Stdcall, RpcSmDisableAllocate, "RpcSmDisableAllocate");
   pragma Import (Stdcall, RpcSmEnableAllocate, "RpcSmEnableAllocate");
   pragma Import (Stdcall, RpcSmFree, "RpcSmFree");
   pragma Import (Stdcall, RpcSmGetThreadHandle, "RpcSmGetThreadHandle");
   pragma Import
     (Stdcall,
      RpcSmSetClientAllocFree,
      "RpcSmSetClientAllocFree");
   pragma Import (Stdcall, RpcSmSetThreadHandle, "RpcSmSetThreadHandle");
   pragma Import
     (Stdcall,
      RpcSmSwapClientAllocFree,
      "RpcSmSwapClientAllocFree");
   pragma Import (Stdcall, NdrRpcSsEnableAllocate, "NdrRpcSsEnableAllocate");
   pragma Import
     (Stdcall,
      NdrRpcSsDisableAllocate,
      "NdrRpcSsDisableAllocate");
   pragma Import (Stdcall, NdrRpcSmSetClientToOsf, "NdrRpcSmSetClientToOsf");
   pragma Import (Stdcall, NdrRpcSmClientAllocate, "NdrRpcSmClientAllocate");
   pragma Import (Stdcall, NdrRpcSmClientFree, "NdrRpcSmClientFree");
   pragma Import
     (Stdcall,
      NdrRpcSsDefaultAllocate,
      "NdrRpcSsDefaultAllocate");
   pragma Import (Stdcall, NdrRpcSsDefaultFree, "NdrRpcSsDefaultFree");
   pragma Import (Stdcall, NdrFullPointerXlatInit, "NdrFullPointerXlatInit");
   pragma Import (Stdcall, NdrFullPointerXlatFree, "NdrFullPointerXlatFree");
   pragma Import
     (Stdcall,
      NdrFullPointerQueryPointer,
      "NdrFullPointerQueryPointer");
   pragma Import
     (Stdcall,
      NdrFullPointerQueryRefId,
      "NdrFullPointerQueryRefId");
   pragma Import
     (Stdcall,
      NdrFullPointerInsertRefId,
      "NdrFullPointerInsertRefId");
   pragma Import (Stdcall, NdrFullPointerFree, "NdrFullPointerFree");
   pragma Import (Stdcall, NdrAllocate, "NdrAllocate");
   pragma Import (Stdcall, NdrClearOutParameters, "NdrClearOutParameters");
   pragma Import (Stdcall, NdrOleAllocate, "NdrOleAllocate");
   pragma Import (Stdcall, NdrOleFree, "NdrOleFree");

   pragma Inline (byte_from_ndr);
   pragma Inline (byte_array_from_ndr);
   pragma Inline (boolean_from_ndr);
   pragma Inline (boolean_array_from_ndr);
   pragma Inline (small_from_ndr);
   pragma Inline (small_array_from_ndr);

end Win32.Rpcndr;
