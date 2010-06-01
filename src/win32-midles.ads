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
with Win32.Rpcdcep;
with Win32.Rpcndr;

package Win32.Midles is

   type MIDL_ES_CODE is (MES_ENCODE, MES_DECODE);
   for MIDL_ES_CODE'Size use 32;

   type MIDL_ES_HANDLE_STYLE is (
      MES_INCREMENTAL_HANDLE,
      MES_FIXED_BUFFER_HANDLE,
      MES_DYNAMIC_BUFFER_HANDLE);
   for MIDL_ES_HANDLE_STYLE'Size use 32;

   type MIDL_ES_MESSAGE;

   type PMIDL_ES_MESSAGE is access all MIDL_ES_MESSAGE;
   type MIDL_ES_HANDLE is new PMIDL_ES_MESSAGE;

   type MIDL_ES_ALLOC is access procedure
     (state   : Win32.PVOID;
      pbuffer : access Win32.PCHAR;
      psize   : access Win32.UINT);
   pragma Convention (Stdcall, MIDL_ES_ALLOC);

   type MIDL_ES_WRITE is access procedure
     (state  : Win32.PVOID;
      buffer : Win32.PCHAR;
      size   : Win32.UINT);
   pragma Convention (Stdcall, MIDL_ES_WRITE);

   type MIDL_ES_READ is access procedure
     (state   : Win32.PVOID;
      pbuffer : access Win32.PCHAR;
      psize   : access Win32.UINT);
   pragma Convention (Stdcall, MIDL_ES_READ);

   type PPUCHAR is access all Win32.PUCHAR;

   type MIDL_ES_MESSAGE is record
      StubMsg      : Win32.Rpcndr.MIDL_STUB_MESSAGE;
      Operation    : MIDL_ES_CODE;
      UserState    : Win32.PVOID;
      MesVersion   : Win32.Bits8;
      HandleStyle  : Win32.Bits8;
      HandleFlags  : Win32.Bits8;
      Reserve      : Win32.Bits8;
      Alloc        : MIDL_ES_ALLOC;
      Write        : MIDL_ES_WRITE;
      Read         : MIDL_ES_READ;
      Buffer       : Win32.PUCHAR;
      BufferSize   : Win32.ULONG;
      pDynBuffer   : PPUCHAR;
      pEncodedSize : Win32.PULONG;
      InterfaceId  : Win32.Rpcdcep.RPC_SYNTAX_IDENTIFIER;
      ProcNumber   : Win32.ULONG;
      AlienDataRep : Win32.ULONG;
      IncrDataSize : Win32.ULONG;
      ByteCount    : Win32.ULONG;
   end record;

   function MesEncodeIncrementalHandleCreate
     (UserState : Win32.PVOID;
      AllocFn   : MIDL_ES_ALLOC;
      WriteFn   : MIDL_ES_WRITE;
      pHandle   : access Win32.Rpcdce.handle_t)
      return Win32.Rpc.RPC_STATUS;

   function MesDecodeIncrementalHandleCreate
     (UserState : Win32.PVOID;
      ReadFn    : MIDL_ES_READ;
      pHandle   : access Win32.Rpcdce.handle_t)
      return Win32.Rpc.RPC_STATUS;

   function MesIncrementalHandleReset
     (Handle    : Win32.Rpcdce.handle_t;
      UserState : Win32.PVOID;
      AllocFn   : MIDL_ES_ALLOC;
      WriteFn   : MIDL_ES_WRITE;
      ReadFn    : MIDL_ES_READ;
      Operation : MIDL_ES_CODE)
      return Win32.Rpc.RPC_STATUS;

   function MesEncodeFixedBufferHandleCreate
     (pBuffer      : Win32.PCHAR;
      BufferSize   : Win32.ULONG;
      pEncodedSize : access Win32.ULONG;
      pHandle      : access Win32.Rpcdce.handle_t)
      return Win32.Rpc.RPC_STATUS;

   function MesEncodeDynBufferHandleCreate
     (pBuffer      : access Win32.PCHAR;
      pEncodedSize : access Win32.ULONG;
      pHandle      : access Win32.Rpcdce.handle_t)
      return Win32.Rpc.RPC_STATUS;

   function MesDecodeBufferHandleCreate
     (pBuffer    : Win32.PCHAR;
      BufferSize : Win32.ULONG;
      pHandle    : access Win32.Rpcdce.handle_t)
      return Win32.Rpc.RPC_STATUS;

   function MesBufferHandleReset
     (Handle       : Win32.Rpcdce.handle_t;
      HandleStyle  : Win32.ULONG;
      Operation    : MIDL_ES_CODE;
      pBuffer      : access Win32.PCHAR;
      BufferSize   : Win32.ULONG;
      pEncodedSize : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function MesHandleFree
     (Handle : Win32.Rpcdce.handle_t)
      return Win32.Rpc.RPC_STATUS;

   function MesInqProcEncodingId
     (Handle       : Win32.Rpcdce.handle_t;
      pInterfaceId : Win32.Rpcdcep.PRPC_SYNTAX_IDENTIFIER;
      pProcNum     : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   procedure I_NdrMesMessageInit
     (pStubMsg : Win32.Rpcndr.PMIDL_STUB_MESSAGE);

   function NdrMesSimpleTypeAlignSize
     (Handle : Win32.Rpcdce.handle_t)
      return Win32.Size_T;

   procedure NdrMesSimpleTypeDecode
     (Handle  : Win32.Rpcdce.handle_t;
      pObject : Win32.PVOID;
      Size    : Win32.SHORT);

   procedure NdrMesSimpleTypeEncode
     (Handle    : Win32.Rpcdce.handle_t;
      pStubDesc : Win32.Rpcndr.PMIDL_STUB_DESC;
      pObject   : Win32.PVOID;
      Size      : Win32.SHORT);

   function NdrMesTypeAlignSize
     (Handle        : Win32.Rpcdce.handle_t;
      pStubDesc     : Win32.Rpcndr.PMIDL_STUB_DESC;
      pFormatString : Win32.Rpcndr.PFORMAT_STRING;
      pObject       : Win32.PVOID)
      return Win32.Size_T;

   procedure NdrMesTypeEncode
     (Handle        : Win32.Rpcdce.handle_t;
      pStubDesc     : Win32.Rpcndr.PMIDL_STUB_DESC;
      pFormatString : Win32.Rpcndr.PFORMAT_STRING;
      pObject       : Win32.PVOID);

   procedure NdrMesTypeDecode
     (Handle        : Win32.Rpcdce.handle_t;
      pStubDesc     : Win32.Rpcndr.PMIDL_STUB_DESC;
      pFormatString : Win32.Rpcndr.PFORMAT_STRING;
      pObject       : Win32.PVOID);

private

   pragma Convention (C, MIDL_ES_MESSAGE);

   pragma Import
     (Stdcall,
      MesEncodeIncrementalHandleCreate,
      "MesEncodeIncrementalHandleCreate");
   pragma Import
     (Stdcall,
      MesDecodeIncrementalHandleCreate,
      "MesDecodeIncrementalHandleCreate");
   pragma Import
     (Stdcall,
      MesIncrementalHandleReset,
      "MesIncrementalHandleReset");
   pragma Import
     (Stdcall,
      MesEncodeFixedBufferHandleCreate,
      "MesEncodeFixedBufferHandleCreate");
   pragma Import
     (Stdcall,
      MesEncodeDynBufferHandleCreate,
      "MesEncodeDynBufferHandleCreate");
   pragma Import
     (Stdcall,
      MesDecodeBufferHandleCreate,
      "MesDecodeBufferHandleCreate");
   pragma Import (Stdcall, MesBufferHandleReset, "MesBufferHandleReset");
   pragma Import (Stdcall, MesHandleFree, "MesHandleFree");
   pragma Import (Stdcall, MesInqProcEncodingId, "MesInqProcEncodingId");
   pragma Import (Stdcall, I_NdrMesMessageInit, "I_NdrMesMessageInit");
   pragma Import
     (Stdcall,
      NdrMesSimpleTypeAlignSize,
      "NdrMesSimpleTypeAlignSize");
   pragma Import (Stdcall, NdrMesSimpleTypeDecode, "NdrMesSimpleTypeDecode");
   pragma Import (Stdcall, NdrMesSimpleTypeEncode, "NdrMesSimpleTypeEncode");
   pragma Import (Stdcall, NdrMesTypeAlignSize, "NdrMesTypeAlignSize");
   pragma Import (Stdcall, NdrMesTypeEncode, "NdrMesTypeEncode");
   pragma Import (Stdcall, NdrMesTypeDecode, "NdrMesTypeDecode");

end Win32.Midles;
