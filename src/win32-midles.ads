--  $Source$

--  $Revision$ $Date$ $Author$

-------------------------------------------------------------------------------

--

--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"

--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING

--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY

--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the

--  entire risk as to the accuracy and the use of this file.

--

--  Copyright (c) Intermetrics, Inc. 1995

--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,

--  reproduction and further distribution of this file is permitted.

--

-------------------------------------------------------------------------------



with Win32.Rpc;

with Win32.Rpcdce;

with Win32.Rpcdcep;

with Win32.Rpcndr;



package Win32.Midles is



   type MIDL_ES_CODE is ( --  midles.h:48

     MES_ENCODE,                                         --  midles.h:46

     MES_DECODE                                          --  midles.h:48

                        );

   for MIDL_ES_CODE'Size use 32;                           --  midles.h:48



   type MIDL_ES_HANDLE_STYLE is ( --  midles.h:55

     MES_INCREMENTAL_HANDLE,                             --  midles.h:52

     MES_FIXED_BUFFER_HANDLE,                            --  midles.h:53

     MES_DYNAMIC_BUFFER_HANDLE                           --  midles.h:55

                                );

   for MIDL_ES_HANDLE_STYLE'Size use 32;                   --  midles.h:55



   type MIDL_ES_MESSAGE;                                   --  midles.h:73



   type PMIDL_ES_MESSAGE is access all MIDL_ES_MESSAGE;    --  midles.h:94

   type MIDL_ES_HANDLE is new PMIDL_ES_MESSAGE;            --  midles.h:96



   type MIDL_ES_ALLOC is access procedure

     (state : Win32.PVOID;

      pbuffer : access Win32.PCHAR;

      psize : access Win32.UINT);                --  midles.h:58

   pragma Convention (Stdcall, MIDL_ES_ALLOC);



   type MIDL_ES_WRITE is access procedure

     (state : Win32.PVOID;

      buffer : Win32.PCHAR;

      size : Win32.UINT);                        --  midles.h:63

   pragma Convention (Stdcall, MIDL_ES_WRITE);



   type MIDL_ES_READ is access procedure

     (state : Win32.PVOID;

      pbuffer : access Win32.PCHAR;

      psize : access Win32.UINT);                --  midles.h:68

   pragma Convention (Stdcall, MIDL_ES_READ);



   type PPUCHAR is access all Win32.PUCHAR;                --  midles.h:87



   type MIDL_ES_MESSAGE is                                 --  midles.h:73

      record

         StubMsg : Win32.Rpcndr.MIDL_STUB_MESSAGE;   --  midles.h:75

         Operation : MIDL_ES_CODE;                     --  midles.h:76

         UserState : Win32.PVOID;                      --  midles.h:77

         MesVersion : Win32.Bits8;                      --  midles.h:78

         HandleStyle : Win32.Bits8;                      --  midles.h:79

         HandleFlags : Win32.Bits8;                      --  midles.h:80

         Reserve : Win32.Bits8;                      --  midles.h:81

         Alloc : MIDL_ES_ALLOC;                    --  midles.h:82

         Write : MIDL_ES_WRITE;                    --  midles.h:83

         Read : MIDL_ES_READ;                     --  midles.h:84

         Buffer : Win32.PUCHAR;                     --  midles.h:85

         BufferSize : Win32.ULONG;                      --  midles.h:86

         pDynBuffer : PPUCHAR;                          --  midles.h:87

         pEncodedSize : Win32.PULONG;                     --  midles.h:88

         InterfaceId : Win32.Rpcdcep.RPC_SYNTAX_IDENTIFIER;

         --  midles.h:89

         ProcNumber : Win32.ULONG;                      --  midles.h:90

         AlienDataRep : Win32.ULONG;                      --  midles.h:91

         IncrDataSize : Win32.ULONG;                      --  midles.h:92

         ByteCount : Win32.ULONG;                      --  midles.h:93

      end record;



   function MesEncodeIncrementalHandleCreate

     (UserState : Win32.PVOID;

      AllocFn : MIDL_ES_ALLOC;

      WriteFn : MIDL_ES_WRITE;

      pHandle : access Win32.Rpcdce.handle_t)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:99



   function MesDecodeIncrementalHandleCreate

     (UserState : Win32.PVOID;

      ReadFn : MIDL_ES_READ;

      pHandle : access Win32.Rpcdce.handle_t)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:106



   function MesIncrementalHandleReset

     (Handle : Win32.Rpcdce.handle_t;

      UserState : Win32.PVOID;

      AllocFn : MIDL_ES_ALLOC;

      WriteFn : MIDL_ES_WRITE;

      ReadFn : MIDL_ES_READ;

      Operation : MIDL_ES_CODE)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:113



   function MesEncodeFixedBufferHandleCreate

     (pBuffer : Win32.PCHAR;

      BufferSize : Win32.ULONG;

      pEncodedSize : access Win32.ULONG;

      pHandle : access Win32.Rpcdce.handle_t)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:123



   function MesEncodeDynBufferHandleCreate

     (pBuffer : access Win32.PCHAR;

      pEncodedSize : access Win32.ULONG;

      pHandle : access Win32.Rpcdce.handle_t)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:130



   function MesDecodeBufferHandleCreate

     (pBuffer : Win32.PCHAR;

      BufferSize : Win32.ULONG;

      pHandle : access Win32.Rpcdce.handle_t)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:136



   function MesBufferHandleReset

     (Handle : Win32.Rpcdce.handle_t;

      HandleStyle : Win32.ULONG;

      Operation : MIDL_ES_CODE;

      pBuffer : access Win32.PCHAR;

      BufferSize : Win32.ULONG;

      pEncodedSize : access Win32.ULONG)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:143



   function MesHandleFree

     (Handle : Win32.Rpcdce.handle_t)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:153



   function MesInqProcEncodingId

     (Handle : Win32.Rpcdce.handle_t;

      pInterfaceId : Win32.Rpcdcep.PRPC_SYNTAX_IDENTIFIER;

      pProcNum : access Win32.ULONG)

     return Win32.Rpc.RPC_STATUS;                 --  midles.h:156



   procedure I_NdrMesMessageInit

     (pStubMsg : Win32.Rpcndr.PMIDL_STUB_MESSAGE); --  midles.h:168



   function NdrMesSimpleTypeAlignSize

     (Handle : Win32.Rpcdce.handle_t)

     return Win32.Size_T;                           --  midles.h:171



   procedure NdrMesSimpleTypeDecode

     (Handle : Win32.Rpcdce.handle_t;

      pObject : Win32.PVOID;

      Size : Win32.SHORT);                      --  midles.h:174



   procedure NdrMesSimpleTypeEncode

     (Handle : Win32.Rpcdce.handle_t;

      pStubDesc : Win32.Rpcndr.PMIDL_STUB_DESC;

      pObject : Win32.PVOID;

      Size : Win32.SHORT);                    --  midles.h:180



   function NdrMesTypeAlignSize

     (Handle : Win32.Rpcdce.handle_t;

      pStubDesc : Win32.Rpcndr.PMIDL_STUB_DESC;

      pFormatString : Win32.Rpcndr.PFORMAT_STRING;

      pObject : Win32.PVOID)

     return Win32.Size_T;                           --  midles.h:188



   procedure NdrMesTypeEncode

     (Handle : Win32.Rpcdce.handle_t;

      pStubDesc : Win32.Rpcndr.PMIDL_STUB_DESC;

      pFormatString : Win32.Rpcndr.PFORMAT_STRING;

      pObject : Win32.PVOID);                --  midles.h:195



   procedure NdrMesTypeDecode

     (Handle : Win32.Rpcdce.handle_t;

      pStubDesc : Win32.Rpcndr.PMIDL_STUB_DESC;

      pFormatString : Win32.Rpcndr.PFORMAT_STRING;

      pObject : Win32.PVOID);                --  midles.h:202



   --  not in Microsoft OpenTools

   --  procedure NdrMesProcEncodeDecode(

   --  Handle       : Win32.Rpcdce.handle_t;

   --  pStubDesc    : Win32.Rpcndr.PMIDL_STUB_DESC;

   --  pFormatString: Win32.Rpcndr.PFORMAT_STRING;

   --  Args         : Stdarg.ArgList := Stdarg.Empty);

   --  midles.h:209



private



   pragma Convention (C, MIDL_ES_MESSAGE);                  --  midles.h:73



   pragma Import (Stdcall, MesEncodeIncrementalHandleCreate,

                    "MesEncodeIncrementalHandleCreate");   --  midles.h:99

   pragma Import (Stdcall, MesDecodeIncrementalHandleCreate,

                    "MesDecodeIncrementalHandleCreate");   --  midles.h:106

   pragma Import (Stdcall, MesIncrementalHandleReset,

                    "MesIncrementalHandleReset");

   --  midles.h:113

   pragma Import (Stdcall, MesEncodeFixedBufferHandleCreate,

                    "MesEncodeFixedBufferHandleCreate");   --  midles.h:123

   pragma Import (Stdcall, MesEncodeDynBufferHandleCreate,

                    "MesEncodeDynBufferHandleCreate");     --  midles.h:130

   pragma Import (Stdcall, MesDecodeBufferHandleCreate,

                    "MesDecodeBufferHandleCreate");        --  midles.h:136

   pragma Import (Stdcall, MesBufferHandleReset, "MesBufferHandleReset");

   --  midles.h:143

   pragma Import (Stdcall, MesHandleFree, "MesHandleFree");    --  midles.h:153

   pragma Import (Stdcall, MesInqProcEncodingId, "MesInqProcEncodingId");

   --  midles.h:156

   pragma Import (Stdcall, I_NdrMesMessageInit, "I_NdrMesMessageInit");

   --  midles.h:168

   pragma Import (Stdcall, NdrMesSimpleTypeAlignSize,

                    "NdrMesSimpleTypeAlignSize");

   --  midles.h:171

   pragma Import (Stdcall, NdrMesSimpleTypeDecode, "NdrMesSimpleTypeDecode");

   --  midles.h:174

   pragma Import (Stdcall, NdrMesSimpleTypeEncode, "NdrMesSimpleTypeEncode");

   --  midles.h:180

   pragma Import (Stdcall, NdrMesTypeAlignSize, "NdrMesTypeAlignSize");

   --  midles.h:188

   pragma Import (Stdcall, NdrMesTypeEncode, "NdrMesTypeEncode");

   --  midles.h:195

   pragma Import (Stdcall, NdrMesTypeDecode, "NdrMesTypeDecode");

   --  midles.h:202



end Win32.Midles;





