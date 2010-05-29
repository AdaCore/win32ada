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
--  This file is now maintained and made available by AdaCore under
--  the same terms.
--
--  Copyright (c) AdaCore 2000-2010, AdaCore
--
-------------------------------------------------------------------------------

with Win32.Objbase;
with Win32.Rpc;
with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Winnt;

package Win32.Rpcndr is

   NDR_CHAR_REP_MASK : constant Win32.ULONG := 16#f#;    --  rpcndr.h:102
   NDR_INT_REP_MASK : constant Win32.ULONG := 16#f0#;   --  rpcndr.h:103
   NDR_FLOAT_REP_MASK : constant Win32.ULONG := 16#ff00#; --  rpcndr.h:104
   NDR_LITTLE_ENDIAN : constant Win32.ULONG := 16#10#;   --  rpcndr.h:106
   NDR_BIG_ENDIAN : constant Win32.ULONG := 16#0#;    --  rpcndr.h:107
   NDR_IEEE_FLOAT : constant Win32.ULONG := 16#0#;    --  rpcndr.h:109
   NDR_VAX_FLOAT : constant Win32.ULONG := 16#100#;  --  rpcndr.h:110
   NDR_ASCII_CHAR : constant Win32.ULONG := 16#0#;    --  rpcndr.h:112
   NDR_EBCDIC_CHAR : constant Win32.ULONG := 16#1#;    --  rpcndr.h:113
   NDR_LOCAL_DATA_REPRESENTATION : constant Win32.ULONG := 16#10#;
   --  rpcndr.h:115
   cbNDRContext : constant := 20;                   --  rpcndr.h:213

   subtype small is Win32.CHAR;                            --  rpcndr.h:121
   type psmall is access small;

   function To_Psmall is new Ada.Unchecked_Conversion (PVOID, psmall);

   subtype byte is Win32.BYTE;                             --  rpcndr.h:122
   type boolean is new Win32.UCHAR;                        --  rpcndr.h:123
   subtype hyper is Win32.DWORDLONG;                       --  rpcndr.h:129

   subtype MIDL_uhyper is Win32.DWORDLONG;                 --  rpcndr.h:130
   type error_status_t is new Win32.ULONG;                 --  rpcndr.h:541
   type RPC_LENGTH is new Win32.ULONG;                     --  rpcndr.h:605

   type XLAT_SIDE is
     ( --  rpcndr.h:943
       XLAT_SERVER,                                        --  rpcndr.h:941
       XLAT_CLIENT                                         --  rpcndr.h:943
       );
   for XLAT_SIDE use
      ( --  rpcndr.h:943
       XLAT_SERVER => 1,                                   --  rpcndr.h:941
       XLAT_CLIENT => 2                                    --  rpcndr.h:943
       );
   for XLAT_SIDE'Size use 32;                              --  rpcndr.h:943

   type STUB_PHASE is
     ( --  rpcndr.h:1824
      STUB_UNMARSHAL,                                     --  rpcndr.h:1820
      STUB_CALL_SERVER,                                   --  rpcndr.h:1821
      STUB_MARSHAL,                                       --  rpcndr.h:1822
      STUB_CALL_SERVER_NO_HRESULT                         --  rpcndr.h:1824
      );
   for STUB_PHASE'Size use 32;                             --  rpcndr.h:1824

   type NDR_CCONTEXT is new Win32.PVOID;                   --  rpcndr.h:203
   type RPC_BUFPTR is new Win32.PUCHAR;                    --  rpcndr.h:604
   type PFORMAT_STRING is new Win32.PCUCHAR;               --  rpcndr.h:610
   type PMIDL_XMIT_TYPE is new Win32.PVOID;                --  rpcndr.h:890
   subtype RPC_SS_THREAD_HANDLE is Win32.Winnt.HANDLE;    --  rpcndr.h:1954

   function To_BUFPTR is new Ada.Unchecked_Conversion (ULONG, RPC_BUFPTR);
   function To_ULONG is new Ada.Unchecked_Conversion (RPC_BUFPTR, ULONG);

   type struct_anonymous1_t;                               --  rpcndr.h:209
   type SCONTEXT_QUEUE;                                    --  rpcndr.h:217
   type MIDL_STUB_MESSAGE;                                 --  rpcndr.h:600
   type ARRAY_INFO;                                        --  rpcndr.h:632
   type GENERIC_BINDING_ROUTINE_PAIR;                      --  rpcndr.h:821
   type GENERIC_BINDING_INFO;                              --  rpcndr.h:827
   type XMIT_ROUTINE_QUINTUPLE;                            --  rpcndr.h:839
   type IMPLICIT_HANDLE_INFO_Union;                        --  rpcndr.h:863
   type MIDL_FORMAT_STRING;                                --  rpcndr.h:898
   type MIDL_SERVER_INFO;                                  --  rpcndr.h:917
   type CLIENT_CALL_RETURN;                                --  rpcndr.h:929
   type FULL_PTR_TO_REFID_ELEMENT;                         --  rpcndr.h:951
   type struct_anonymous10_t;                              --  rpcndr.h:971
   type struct_anonymous12_t;                              --  rpcndr.h:981
   type MIDL_STUB_DESC;                                    --  rpcndr.h:601
   type FULL_PTR_XLAT_TABLES;                              --  rpcndr.h:602

   type NDR_SCONTEXT is access all struct_anonymous1_t;    --  rpcndr.h:209
   type a_NDR_SCONTEXT_t is access all NDR_SCONTEXT;       --  rpcndr.h:219
   type PSCONTEXT_QUEUE is access all SCONTEXT_QUEUE;
   --  rpcndr.h:220
   type PARRAY_INFO is access all ARRAY_INFO;              --  rpcndr.h:632
   type ac_MIDL_STUB_DESC_t is access all MIDL_STUB_DESC;
   --  rpcndr.h:760
   type PMIDL_STUB_MESSAGE is access all MIDL_STUB_MESSAGE; --  rpcndr.h:804
   type PGENERIC_BINDING_ROUTINE_PAIR is access all
     GENERIC_BINDING_ROUTINE_PAIR;                  --  rpcndr.h:825
   type PGENERIC_BINDING_INFO is access all GENERIC_BINDING_INFO;
   --  rpcndr.h:833
   type PXMIT_ROUTINE_QUINTUPLE is access all XMIT_ROUTINE_QUINTUPLE;
   --  rpcndr.h:845
   type ac_GENERIC_BINDING_ROUTINE_PAIR_t is access all
     GENERIC_BINDING_ROUTINE_PAIR;                  --  rpcndr.h:866
   type ac_XMIT_ROUTINE_QUINTUPLE_t is access all XMIT_ROUTINE_QUINTUPLE;
   --  rpcndr.h:870
   type PMIDL_STUB_DESC is access all MIDL_STUB_DESC; --  rpcndr.h:888
   type PMIDL_SERVER_INFO is access all MIDL_SERVER_INFO;
   --  rpcndr.h:924
   type PFULL_PTR_TO_REFID_ELEMENT is access all FULL_PTR_TO_REFID_ELEMENT;
   --  rpcndr.h:956
   type PPVOID is access all Win32.PVOID;                  --  rpcndr.h:968
   type a_PFULL_PTR_TO_REFID_ELEMENT is access all
     PFULL_PTR_TO_REFID_ELEMENT; --  rpcndr.h:978
   type PFULL_PTR_XLAT_TABLES is access all FULL_PTR_XLAT_TABLES;
   --  rpcndr.h:996

   type PVOID_Array is                                     --  rpcndr.h:207
     array (Natural range <>)
     of Win32.PVOID;

   type struct_anonymous1_t is                             --  rpcndr.h:209
      record
         pad : PVOID_Array (0 .. 1);                 --  rpcndr.h:207
         userContext : Win32.PVOID;                       --  rpcndr.h:208
      end record;

   type NDR_RUNDOWN is access procedure
     (context : Win32.PVOID);                      --  rpcndr.h:215
   pragma Convention (Stdcall, NDR_RUNDOWN);

   type SCONTEXT_QUEUE is                                  --  rpcndr.h:217
      record
         NumberOfObjects : Win32.ULONG;                   --  rpcndr.h:218
         ArrayOfObjects : a_NDR_SCONTEXT_t;              --  rpcndr.h:219
      end record;

   type a_IRpcChannelBuffer is access all Win32.Objbase.IRpcChannelBuffer;
   --  rpcndr.h:786

   type Allocate_Func is access function
     (Size : Win32.Size_T)
     return Win32.PVOID;                              --  rpcndr.h:729
   pragma Convention (Stdcall, Allocate_Func);

   type Free_Proc is access procedure
     (Obj : Win32.PVOID);                              --  rpcndr.h:730
   pragma Convention (Stdcall, Free_Proc);

   type MIDL_STUB_MESSAGE is                               --  rpcndr.h:600
      record
         RpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
         --  rpcndr.h:645
         Buffer : Win32.PUCHAR;           --  rpcndr.h:648
         BufferStart : Win32.PUCHAR;           --  rpcndr.h:654
         BufferEnd : Win32.PUCHAR;           --  rpcndr.h:655
         BufferMark : Win32.PUCHAR;           --  rpcndr.h:664
         BufferLength : Win32.ULONG;            --  rpcndr.h:667
         MemorySize : Win32.ULONG;            --  rpcndr.h:670
         Memory : Win32.PUCHAR;           --  rpcndr.h:673
         IsClient : Win32.INT;              --  rpcndr.h:676
         ReuseBuffer : Win32.INT;              --  rpcndr.h:679
         AllocAllNodesMemory : Win32.PUCHAR;           --  rpcndr.h:682
         AllocAllNodesMemoryEnd : Win32.PUCHAR;           --  rpcndr.h:685
         IgnoreEmbeddedPointers : Win32.INT;              --  rpcndr.h:692
         PointerBufferMark : Win32.PUCHAR;           --  rpcndr.h:698
         fBufferValid : Win32.UCHAR;            --  rpcndr.h:703
         MaxContextHandleNumber : Win32.UCHAR;            --  rpcndr.h:708
         MaxCount : Win32.ULONG;            --  rpcndr.h:714
         Offset : Win32.ULONG;            --  rpcndr.h:720
         ActualCount : Win32.ULONG;            --  rpcndr.h:726
         pfnAllocate : Allocate_Func;          --  rpcndr.h:729
         pfnFree : Free_Proc;              --  rpcndr.h:730
         StackTop : Win32.PUCHAR;           --  rpcndr.h:738
         pPresentedType : Win32.PUCHAR;           --  rpcndr.h:744
         pTransmitType : Win32.PUCHAR;           --  rpcndr.h:745
         SavedHandle : Win32.Rpcdce.handle_t;  --  rpcndr.h:755
         StubDesc : ac_MIDL_STUB_DESC_t;    --  rpcndr.h:760
         FullPtrXlatTables : PMIDL_STUB_MESSAGE;     --  rpcndr.h:765
         FullPtrRefId : Win32.ULONG;            --  rpcndr.h:767
         fCheckBounds : Win32.INT;              --  rpcndr.h:773
         fInDontFree : Win32.Bits1;            --  rpcndr.h:775
         fDontCallFreeInst : Win32.Bits1;            --  rpcndr.h:776
         fInOnlyParam : Win32.Bits1;            --  rpcndr.h:777
         dwDestContext : Win32.ULONG;            --  rpcndr.h:779
         pvDestContext : Win32.PVOID;            --  rpcndr.h:780
         pSavedHContext : PSCONTEXT_QUEUE;        --  rpcndr.h:782
         ParamNumber : Win32.LONG;             --  rpcndr.h:784
         pRpcChannelBuffer : a_IRpcChannelBuffer;    --  rpcndr.h:786
         pArrayInfo : PARRAY_INFO;            --  rpcndr.h:788
         SizePtrCountArray : Win32.PULONG;           --  rpcndr.h:794
         SizePtrOffsetArray : Win32.PULONG;           --  rpcndr.h:795
         SizePtrLengthArray : Win32.PULONG;           --  rpcndr.h:796
--  Reserved              : Win32.ULONG_Array(0..6);  -- rpcndr.h:802
--  @@ with GNAT the type ULONG_Array must be aligned at a storage
--  unit boundary. So I decided for now to declare Reserved<1..7>
--  instead.
         Reserved1 : Win32.ULONG;
         Reserved2 : Win32.ULONG;
         Reserved3 : Win32.ULONG;
         Reserved4 : Win32.ULONG;
         Reserved5 : Win32.ULONG;
         Reserved6 : Win32.ULONG;
         Reserved7 : Win32.ULONG;
      end record;

   --  @@ The Reserved component could be wrong.
   for  MIDL_STUB_MESSAGE use                                --  rpcndr.h:600
      record
         RpcMsg                 at 0 range 0 .. 31;          --  rpcndr.h:645
         Buffer                 at 4 range 0 .. 31;          --  rpcndr.h:648
         BufferStart            at 8 range 0 .. 31;          --  rpcndr.h:654
         BufferEnd              at 12 range 0 .. 31;         --  rpcndr.h:655
         BufferMark             at 16 range 0 .. 31;         --  rpcndr.h:664
         BufferLength           at 20 range 0 .. 31;         --  rpcndr.h:667
         MemorySize             at 24 range 0 .. 31;         --  rpcndr.h:670
         Memory                 at 28 range 0 .. 31;         --  rpcndr.h:673
         IsClient               at 32 range 0 .. 31;         --  rpcndr.h:676
         ReuseBuffer            at 36 range 0 .. 31;         --  rpcndr.h:679
         AllocAllNodesMemory    at 40 range 0 .. 31;         --  rpcndr.h:682
         AllocAllNodesMemoryEnd at 44 range 0 .. 31;         --  rpcndr.h:685
         IgnoreEmbeddedPointers at 48 range 0 .. 31;         --  rpcndr.h:692
         PointerBufferMark      at 52 range 0 .. 31;         --  rpcndr.h:698
         fBufferValid           at 56 range 0 .. 7;          --  rpcndr.h:703
         MaxContextHandleNumber at 57 range 0 .. 7;          --  rpcndr.h:708
         MaxCount               at 58 range 0 .. 31;         --  rpcndr.h:714
         Offset                 at 62 range 0 .. 31;         --  rpcndr.h:720
         ActualCount            at 66 range 0 .. 31;         --  rpcndr.h:726
         pfnAllocate            at 70 range 0 .. 31;         --  rpcndr.h:729
         pfnFree                at 74 range 0 .. 31;         --  rpcndr.h:730
         StackTop               at 78 range 0 .. 31;         --  rpcndr.h:738
         pPresentedType         at 82 range 0 .. 31;         --  rpcndr.h:744
         pTransmitType          at 86 range 0 .. 31;         --  rpcndr.h:745
         SavedHandle            at 90 range 0 .. 31;         --  rpcndr.h:755
         StubDesc               at 94 range 0 .. 31;         --  rpcndr.h:760
         FullPtrXlatTables      at 98 range 0 .. 31;         --  rpcndr.h:765
         FullPtrRefId           at 102 range 0 .. 31;        --  rpcndr.h:767
         fCheckBounds           at 106 range 0 .. 31;        --  rpcndr.h:773
         fInDontFree            at 110 range 0 .. 0;         --  rpcndr.h:775
         fDontCallFreeInst      at 110 range 1 .. 1;         --  rpcndr.h:776
         fInOnlyParam           at 110 range 2 .. 2;         --  rpcndr.h:777
         dwDestContext          at 110 range 3 .. 34;        --  rpcndr.h:779
         pvDestContext          at 114 range 3 .. 34;        --  rpcndr.h:780
         pSavedHContext         at 118 range 3 .. 34;        --  rpcndr.h:782
         ParamNumber            at 122 range 3 .. 34;        --  rpcndr.h:784
         pRpcChannelBuffer      at 126 range 3 .. 34;        --  rpcndr.h:786
         pArrayInfo             at 130 range 3 .. 34;        --  rpcndr.h:788
         SizePtrCountArray      at 136 range 3 .. 34;        --  rpcndr.h:794
         SizePtrOffsetArray     at 140 range 3 .. 34;        --  rpcndr.h:795
         SizePtrLengthArray     at 144 range 3 .. 34;        --  rpcndr.h:796
--  Reserved               at 148 range 3..226;       -- rpcndr.h:802
         Reserved1              at 148 range 3 .. 34;
         Reserved2              at 152 range 3 .. 34;
         Reserved3              at 156 range 3 .. 34;
         Reserved4              at 160 range 3 .. 34;
         Reserved5              at 164 range 3 .. 34;
         Reserved6              at 168 range 3 .. 34;
         Reserved7              at 172 range 3 .. 34;
      end record;

   type EXPR_EVAL is access procedure
     (pStubMsg : PMIDL_STUB_MESSAGE);              --  rpcndr.h:608
   pragma Convention (Stdcall, EXPR_EVAL);

   type ARRAY_INFO is                                      --  rpcndr.h:632
      record
         Dimension : Win32.LONG;              --  rpcndr.h:622
         BufferConformanceMark : Win32.PULONG;            --  rpcndr.h:625
         BufferVarianceMark : Win32.PULONG;            --  rpcndr.h:626
         MaxCountArray : Win32.PULONG;            --  rpcndr.h:629
         OffsetArray : Win32.PULONG;            --  rpcndr.h:630
         ActualCountArray : Win32.PULONG;            --  rpcndr.h:631
      end record;

   type GENERIC_BINDING_ROUTINE is access function
     (p1 : Win32.PVOID)
     return  Win32.PVOID;                         --  rpcndr.h:815
   pragma Convention (Stdcall, GENERIC_BINDING_ROUTINE);
   type GENERIC_UNBIND_ROUTINE is access procedure
     (p1 : Win32.PVOID;
      p2 : Win32.PUCHAR);                          --  rpcndr.h:818
   pragma Convention (Stdcall, GENERIC_UNBIND_ROUTINE);

   type GENERIC_BINDING_ROUTINE_PAIR is                    --  rpcndr.h:821
      record
         pfnBind : GENERIC_BINDING_ROUTINE;             --  rpcndr.h:823
         pfnUnbind : GENERIC_UNBIND_ROUTINE;              --  rpcndr.h:824
      end record;

   type GENERIC_BINDING_INFO is                            --  rpcndr.h:827
      record
         pObj : Win32.PVOID;                         --  rpcndr.h:829
         Size : Win32.UINT;                          --  rpcndr.h:830
         pfnBind : GENERIC_BINDING_ROUTINE;             --  rpcndr.h:831
         pfnUnbind : GENERIC_UNBIND_ROUTINE;              --  rpcndr.h:832
      end record;

   type XMIT_HELPER_ROUTINE is access procedure
     (pStubMsg : PMIDL_STUB_MESSAGE);              --  rpcndr.h:837
   pragma Convention (Stdcall, XMIT_HELPER_ROUTINE);

   type XMIT_ROUTINE_QUINTUPLE is                          --  rpcndr.h:839
      record
         pfnTranslateToXmit : XMIT_HELPER_ROUTINE;      --  rpcndr.h:841
         pfnTranslateFromXmit : XMIT_HELPER_ROUTINE;      --  rpcndr.h:842
         pfnFreeXmit : XMIT_HELPER_ROUTINE;      --  rpcndr.h:843
         pfnFreeInst : XMIT_HELPER_ROUTINE;      --  rpcndr.h:844
      end record;

   type IMPLICIT_HANDLE_INFO_Union_Kind is
     ( --  rpcndr.h:863
       pAutoHandle_kind,
       pPrimitiveHandle_kind,
       pGenericBindingInfo_kind
       );

   type p_handle_t is access all Win32.Rpcdce.handle_t;

   type IMPLICIT_HANDLE_INFO_Union
     (Which : IMPLICIT_HANDLE_INFO_Union_Kind := pAutoHandle_kind) is
      --  rpcndr.h:863
      record
         case Which is
            when pAutoHandle_kind =>
               pAutoHandle : p_handle_t;                --  rpcndr.h:860
            when pPrimitiveHandle_kind =>
               pPrimitiveHandle : p_handle_t;           --  rpcndr.h:861
            when pGenericBindingInfo_kind =>
               pGenericBindingInfo : PGENERIC_BINDING_INFO;
               --  rpcndr.h:862
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, IMPLICIT_HANDLE_INFO_Union);

   pragma Unchecked_Union (IMPLICIT_HANDLE_INFO_Union);

   type ac_NDR_RUNDOWN_t is access all NDR_RUNDOWN;   --  rpcndr.h:865

   type MIDL_FORMAT_STRING is                              --  rpcndr.h:898
      record
         Pad : Win32.SHORT;                            --  rpcndr.h:900
         Format : Win32.UCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  rpcndr.h:901
      end record;

   type STUB_THUNK is access procedure
     (pStubMessage : PMIDL_STUB_MESSAGE);          --  rpcndr.h:910
   pragma Convention (Stdcall, STUB_THUNK);
   type SERVER_ROUTINE is access function  return Win32.INT;
   pragma Convention (Stdcall, SERVER_ROUTINE);
   --  rpcndr.h:912
   type ac_SERVER_ROUTINE_t is access all SERVER_ROUTINE;
   --  rpcndr.h:920

   type MIDL_SERVER_INFO is                                --  rpcndr.h:917
      record
         pStubDesc : PMIDL_STUB_DESC;               --  rpcndr.h:919
         DispatchTable : ac_SERVER_ROUTINE_t;           --  rpcndr.h:920
         ProcString : PFORMAT_STRING;                --  rpcndr.h:921
         FmtStringOffset : Win32.PCWSTR;                  --  rpcndr.h:922
         ThunkTable : ac_NDR_RUNDOWN_t;              --  rpcndr.h:923
      end record;

   type CLIENT_CALL_RETURN_kind is
     ( --  rpcndr.h:929
       Pointer_kind,
       Simple_kind
       );

   type CLIENT_CALL_RETURN
     (Which : CLIENT_CALL_RETURN_kind := Pointer_kind) is
      --  rpcndr.h:929
      record
         case Which is
            when Pointer_kind =>
               Pointer : Win32.PVOID;                   --  rpcndr.h:931
            when Simple_kind =>
               Simple : Win32.INT;                      --  rpcndr.h:932
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, CLIENT_CALL_RETURN);

   pragma Unchecked_Union (CLIENT_CALL_RETURN);

   type FULL_PTR_TO_REFID_ELEMENT is                       --  rpcndr.h:951
      record
         Next : PFULL_PTR_TO_REFID_ELEMENT;            --  rpcndr.h:951
         Pointer : Win32.PVOID;                           --  rpcndr.h:953
         RefId : Win32.ULONG;                           --  rpcndr.h:954
         State : Win32.UCHAR;                           --  rpcndr.h:955
      end record;

   type struct_anonymous10_t is                            --  rpcndr.h:971
      record
         XlatTable : PPVOID;                        --  rpcndr.h:968
         StateTable : Win32.PUCHAR;                  --  rpcndr.h:969
         NumberOfEntries : Win32.ULONG;                   --  rpcndr.h:970
      end record;

   type struct_anonymous12_t is                            --  rpcndr.h:981
      record
         XlatTable : a_PFULL_PTR_TO_REFID_ELEMENT;  --  rpcndr.h:978
         NumberOfBuckets : Win32.ULONG;                   --  rpcndr.h:979
         HashMask : Win32.ULONG;                   --  rpcndr.h:980
      end record;

   type RPC_CLIENT_ALLOC is access function
     (Size : Win32.Size_T)
     return  Win32.PVOID;                         --  rpcndr.h:1957
   pragma Convention (Stdcall, RPC_CLIENT_ALLOC);
   type RPC_CLIENT_FREE is access procedure
     (Ptr : Win32.PVOID);                          --  rpcndr.h:1962
   pragma Convention (Stdcall, RPC_CLIENT_FREE);

   type MIDL_STUB_DESC is                                  --  rpcndr.h:601
      record
         RpcInterfaceInformation : Win32.PVOID;       --  rpcndr.h:853
         pfnAllocate : Allocate_Func;     --  rpcndr.h:855
         pfnFree : Free_Proc;         --  rpcndr.h:856
         IMPLICIT_HANDLE_INFO : IMPLICIT_HANDLE_INFO_Union;
         --  rpcndr.h:863
         apfnNdrRundownRoutines : ac_NDR_RUNDOWN_t;  --  rpcndr.h:865
         aGenericBindingRoutinePairs : ac_GENERIC_BINDING_ROUTINE_PAIR_t;
         --  rpcndr.h:866
         apfnExprEval : ac_NDR_RUNDOWN_t;  --  rpcndr.h:868
         aXmitQuintuple : ac_XMIT_ROUTINE_QUINTUPLE_t;
         --  rpcndr.h:870
         pFormatTypes : Win32.PCBYTE;      --  rpcndr.h:872
         fCheckBounds : Win32.INT;         --  rpcndr.h:874
         Version : Win32.ULONG;       --  rpcndr.h:877
         Reserved1 : Win32.INT;         --  rpcndr.h:882
         Reserved2 : Win32.INT;         --  rpcndr.h:883
         Reserved3 : Win32.INT;         --  rpcndr.h:884
      end record;

   type FULL_PTR_XLAT_TABLES is                            --  rpcndr.h:602
      record
         RefIdToPointer : struct_anonymous10_t;           --  rpcndr.h:971
         PointerToRefId : struct_anonymous12_t;           --  rpcndr.h:981
         NextRefId : Win32.ULONG;                    --  rpcndr.h:986
         XlatSide : XLAT_SIDE;                      --  rpcndr.h:995
      end record;

   function MIDL_user_allocate
     (p1 : Win32.Size_T)
     return Win32.PVOID;                          --  rpcndr.h:177

   procedure MIDL_user_free
     (p1 : Win32.PVOID);                           --  rpcndr.h:178

   function NDRSContextValue (hContext : access NDR_SCONTEXT)
                             return System.Address;        --  rpcndr.h:211

   function NDRCContextBinding
     (CContext : NDR_CCONTEXT)
     return Win32.Rpcdce.RPC_BINDING_HANDLE;      --  rpcndr.h:223

   procedure NDRCContextMarshall
     (CContext : NDR_CCONTEXT;
      pBuff : Win32.PVOID);                     --  rpcndr.h:228

   procedure NDRCContextUnmarshall
     (pCContext : access NDR_CCONTEXT;
      hBinding : Win32.Rpcdce.RPC_BINDING_HANDLE;
      pBuff : Win32.PVOID;
      DataRepresentation : Win32.ULONG);           --  rpcndr.h:234

   procedure NDRSContextMarshall
     (CContext : NDR_SCONTEXT;
      pBuff : Win32.PVOID;
      userRunDownIn : NDR_RUNDOWN);                --  rpcndr.h:242

   function NDRSContextUnmarshall
     (pBuff : Win32.PVOID;
      DataRepresentation : Win32.ULONG)
     return NDR_SCONTEXT;                         --  rpcndr.h:249

   procedure RpcSsDestroyClientContext
     (ContextHandle : PPVOID);                     --  rpcndr.h:255

   procedure byte_from_ndr (source : in out Win32.Rpcdcep.PRPC_MESSAGE;
                            target : out    Win32.PBYTE);    --  rpcndr.h: 264

   procedure byte_array_from_ndr
     (Source : in out Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : in Win32.UINT;
      UpperIndex : in Win32.UINT;
      Target : Win32.PBYTE);                   --  rpcndr.h:269

   procedure boolean_from_ndr (source : in out Win32.Rpcdcep.PRPC_MESSAGE;
                               target : out    Win32.PBOOL); --  rpcndr.h:278

   procedure boolean_array_from_ndr
     (Source : in out Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target : Win32.PBOOL);                   --  rpcndr.h:283

   procedure small_from_ndr (source : in out Win32.Rpcdcep.PRPC_MESSAGE;
                             target : out    psmall);        --  rpcndr.h:292

   procedure small_array_from_ndr
     (Source : in out Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : in Win32.UINT;
      UpperIndex : in Win32.UINT;
      Target : out psmall);                    --  rpcndr.h:302

   --  function MIDL_ascii_strlen(string1 : Win32.PCSTR)
   --  return Win32.Size_T
   --  renames Win32.Strings.strlen;-- rpcndr.h:334

   --  function MIDL_ascii_strcpy(target: Win32.PSTR;
   --  source: Win32.PCSTR)
   --  return Win32.PSTR
   --  renames Win32.Strings.strcpy;-- rpcndr.h:336

   --  function MIDL_memset(s: Win32.PVOID;
   --  c: Win32.INT;
   --  n: Win32.Size_T)
   --  return Win32.PVOID
   --  renames Win32.Strings.memset;      -- rpcndr.h:338

   procedure NDRcopy
     (pTarget : Win32.PVOID;
      pSource : Win32.PVOID;
      size : Win32.UINT);                       --  rpcndr.h:356

   function MIDL_wchar_strlen
     (s : Win32.PWSTR)
     return Win32.Size_T;                         --  rpcndr.h:363

   procedure MIDL_wchar_strcpy
     (t : Win32.PVOID;
      s : Win32.PWSTR);                            --  rpcndr.h:368

   procedure char_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target : Win32.PUCHAR);               --  rpcndr.h:374

   procedure char_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.ULONG;
      UpperIndex : Win32.ULONG;
      Target : Win32.PUCHAR);               --  rpcndr.h:380

   procedure short_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : Win32.PWSTR);                       --  rpcndr.h:388

   procedure short_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.ULONG;
      UpperIndex : Win32.ULONG;
      Target : Win32.PWSTR);                --  rpcndr.h:394

   procedure short_from_ndr_temp
     (source : access Win32.PUCHAR;
      target : Win32.PWSTR;
      format : Win32.ULONG);                       --  rpcndr.h:402

   procedure long_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : access Win32.ULONG);                --  rpcndr.h:409

   procedure long_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.ULONG;
      UpperIndex : Win32.ULONG;
      Target : access Win32.ULONG);         --  rpcndr.h:415

   procedure long_from_ndr_temp
     (source : access Win32.PUCHAR;
      target : access Win32.ULONG;
      format : Win32.ULONG);                       --  rpcndr.h:423

   procedure enum_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target : access Win32.UINT);          --  rpcndr.h:430

   procedure float_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target : Win32.PVOID);                --  rpcndr.h:436

   procedure float_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.ULONG;
      UpperIndex : Win32.ULONG;
      Target : Win32.PVOID);                --  rpcndr.h:442

   procedure double_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      Target : Win32.PVOID);                --  rpcndr.h:450

   procedure double_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.ULONG;
      UpperIndex : Win32.ULONG;
      Target : Win32.PVOID);                --  rpcndr.h:456

   procedure hyper_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out hyper);                         --  rpcndr.h:464

   procedure hyper_array_from_ndr
     (SourceMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.ULONG;
      UpperIndex : Win32.ULONG;
      Target : out hyper);                  --  rpcndr.h:470

   procedure hyper_from_ndr_temp
     (source : access Win32.PUCHAR;
      target : out hyper;
      format : Win32.ULONG);                       --  rpcndr.h:478

   procedure data_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : Win32.PVOID;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);                       --  rpcndr.h:485

   procedure data_into_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);                       --  rpcndr.h:493

   procedure tree_into_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);                       --  rpcndr.h:501

   procedure data_size_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);                       --  rpcndr.h:509

   procedure tree_size_ndr
     (source : Win32.PVOID;
      target : Win32.Rpcdcep.PRPC_MESSAGE;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);                       --  rpcndr.h:517

   procedure tree_peek_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      buffer : access Win32.PUCHAR;
      format : Win32.PSTR;
      MscPak : Win32.UCHAR);                       --  rpcndr.h:525

   function midl_allocate
     (size : Win32.Size_T)
     return Win32.PVOID;                          --  rpcndr.h:533

   --  The macros midl_ma1, midl_ma2, midl_ma4, midl_ma8, midl_unma1,
   --  midl_unma2, midl_unma4, midl_unma8, and midl_marsh_lhs could not be
   --  translated into Ada.

   procedure midl_fa2 (p : in out RPC_BUFPTR);              --  rpcndr.h:556
   procedure midl_fa4 (p : in out RPC_BUFPTR);              --  rpcndr.h:557
   procedure midl_fa8 (p : in out RPC_BUFPTR);              --  rpcndr.h:558

   procedure midl_addp (p : in out Win32.PVOID;
                        n : in Win32.ULONG);                --  rpcndr.h:560

   procedure midl_unmarsh_up (p : in out Win32.PVOID);       --  rpcndr.h:567

   procedure NdrMarshConfStringHdr (p : in out Win32.PVOID;
                                    s : in Win32.PUCHAR;
                                    l : in Win32.ULONG);    --  rpcndr.h:574

   procedure NdrUnMarshConfStringHdr (p : in out Win32.PVOID;
                                      s : out Win32.PUCHAR;
                                      l : out Win32.ULONG); --  rpcndr.h:578

   function NdrMarshCCtxtHdl (pc : NDR_CCONTEXT;
                              p : Win32.PVOID)
                             return Win32.ULONG;           --  rpcndr.h:582

   function NdrUnMarshCCtxtHdl (pc : access NDR_CCONTEXT;
                                p : Win32.PVOID;
                                h : Win32.Rpcdce.RPC_BINDING_HANDLE;
                                drep : Win32.ULONG)
                               return Win32.ULONG;         --  rpcndr.h:584

   procedure NdrUnMarshSCtxtHdl (pc : out NDR_SCONTEXT;
                                 p : Win32.PVOID;
                                 drep : Win32.ULONG);        --  rpcndr.h:587

   procedure NdrMarshSCtxtHdl (pc : NDR_SCONTEXT;
                               p : Win32.PVOID;
                               rd : NDR_RUNDOWN);            --  rpcndr.h:590

   function NdrFcShort (s : Win32.USHORT) return Win32.UCHAR; --  rpcndr.h:595

   procedure NdrSimpleTypeMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      FormatChar : Win32.UCHAR);                   --  rpcndr.h:1007

   function NdrPointerMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1014

   function NdrSimpleStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1023

   function NdrConformantStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1030

   function NdrConformantVaryingStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1037

   function NdrComplexStructMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1044

   function NdrFixedArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1053

   function NdrConformantArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1060

   function NdrConformantVaryingArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1067

   function NdrVaryingArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1074

   function NdrComplexArrayMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1081

   function NdrNonConformantStringMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1090

   function NdrConformantStringMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1097

   function NdrEncapsulatedUnionMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1106

   function NdrNonEncapsulatedUnionMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1113

   function NdrByteCountPointerMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1122

   function NdrXmitOrRepAsMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1131

   function NdrInterfacePointerMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING)
     return Win32.PUCHAR;                         --  rpcndr.h:1140

   procedure NdrClientContextMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ContextHandle : NDR_CCONTEXT;
      fCheck : Win32.INT);                  --  rpcndr.h:1149

   procedure NdrServerContextMarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ContextHandle : NDR_SCONTEXT;
      RundownRoutine : NDR_RUNDOWN);               --  rpcndr.h:1156

   procedure NdrSimpleTypeUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      FormatChar : Win32.UCHAR);                   --  rpcndr.h:1167

   function NdrPointerUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1174

   function NdrSimpleStructUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1184

   function NdrConformantStructUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1192

   function NdrConformantVaryingStructUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1200

   function NdrComplexStructUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1208

   function NdrFixedArrayUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1218

   function NdrConformantArrayUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1226

   function NdrConformantVaryingArrayUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1234

   function NdrVaryingArrayUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1242

   function NdrComplexArrayUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1250

   function NdrNonConformantStringUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1260

   function NdrConformantStringUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1268

   function NdrEncapsulatedUnionUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1278

   function NdrNonEncapsulatedUnionUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1286

   function NdrByteCountPointerUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1296

   function NdrXmitOrRepAsUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1306

   function NdrInterfacePointerUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      ppMemory : access Win32.PUCHAR;
      pFormat : PFORMAT_STRING;
      fMustAlloc : Win32.UCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1316

   procedure NdrClientContextUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pContextHandle : access NDR_CCONTEXT;
      BindHandle : Win32.Rpcdce.RPC_BINDING_HANDLE);
   --  rpcndr.h:1326

   function NdrServerContextUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE)
     return NDR_SCONTEXT;                         --  rpcndr.h:1333

   procedure NdrPointerBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1342

   procedure NdrSimpleStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1351

   procedure NdrConformantStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1358

   procedure NdrConformantVaryingStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1365

   procedure NdrComplexStructBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1372

   procedure NdrFixedArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1381

   procedure NdrConformantArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1388

   procedure NdrConformantVaryingArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1395

   procedure NdrVaryingArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1402

   procedure NdrComplexArrayBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1409

   procedure NdrConformantStringBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1418

   procedure NdrNonConformantStringBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1425

   procedure NdrEncapsulatedUnionBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1434

   procedure NdrNonEncapsulatedUnionBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1441

   procedure NdrByteCountPointerBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1450

   procedure NdrXmitOrRepAsBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1459

   procedure NdrInterfacePointerBufferSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1468

   procedure NdrContextHandleSize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1477

   function NdrPointerMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1488

   function NdrSimpleStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1496

   function NdrConformantStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1502

   function NdrConformantVaryingStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1508

   function NdrComplexStructMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1514

   function NdrFixedArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1522

   function NdrConformantArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1528

   function NdrConformantVaryingArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1534

   function NdrVaryingArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1540

   function NdrComplexArrayMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1546

   function NdrConformantStringMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1554

   function NdrNonConformantStringMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1560

   function NdrEncapsulatedUnionMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1568

   function NdrNonEncapsulatedUnionMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1574

   function NdrXmitOrRepAsMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1582

   function NdrInterfacePointerMemorySize
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING)
     return Win32.ULONG;                          --  rpcndr.h:1590

   procedure NdrPointerFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1600

   procedure NdrSimpleStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1609

   procedure NdrConformantStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1616

   procedure NdrConformantVaryingStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1623

   procedure NdrComplexStructFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1630

   procedure NdrFixedArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1639

   procedure NdrConformantArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1646

   procedure NdrConformantVaryingArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1653

   procedure NdrVaryingArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1660

   procedure NdrComplexArrayFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1667

   procedure NdrEncapsulatedUnionFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1676

   procedure NdrNonEncapsulatedUnionFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1683

   procedure NdrByteCountPointerFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1692

   procedure NdrXmitOrRepAsFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1701

   procedure NdrInterfacePointerFree
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1710

   procedure NdrConvert
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1721

   procedure NdrClientInitializeNew
     (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      ProcNum : Win32.UINT);               --  rpcndr.h:1731

   function NdrServerInitializeNew
     (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC)
     return Win32.PUCHAR;                         --  rpcndr.h:1739

   procedure NdrClientInitialize
     (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      ProcNum : Win32.UINT);               --  rpcndr.h:1746

   function NdrServerInitialize
     (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC)
     return Win32.PUCHAR;                         --  rpcndr.h:1754

   function NdrServerInitializeUnmarshall
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE)
     return Win32.PUCHAR;                         --  rpcndr.h:1761

   procedure NdrServerInitializeMarshall
     (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : PMIDL_STUB_MESSAGE);              --  rpcndr.h:1768

   function NdrGetBuffer
     (pStubMsg : PMIDL_STUB_MESSAGE;
      BufferLength : Win32.ULONG;
      Handle : Win32.Rpcdce.RPC_BINDING_HANDLE)
     return Win32.PUCHAR;                         --  rpcndr.h:1774

   function NdrNsGetBuffer
     (pStubMsg : PMIDL_STUB_MESSAGE;
      BufferLength : Win32.ULONG;
      Handle : Win32.Rpcdce.RPC_BINDING_HANDLE)
     return Win32.PUCHAR;                         --  rpcndr.h:1781

   function NdrSendReceive
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pBufferEnd : Win32.PUCHAR)
     return Win32.PUCHAR;                         --  rpcndr.h:1788

   function NdrNsSendReceive
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pBufferEnd : Win32.PUCHAR;
      pAutoHandle : access Win32.Rpc.RPC_BINDING_HANDLE)
     return Win32.PUCHAR;                         --  rpcndr.h:1794

   procedure NdrFreeBuffer
     (pStubMsg : PMIDL_STUB_MESSAGE);              --  rpcndr.h:1801

   --  not in Microsoft OpenTools
   --  function NdrClientCall (
   --  pStubDescriptor: PMIDL_STUB_DESC;
   --  pFormat        : PFORMAT_STRING;
   --  Args           : Stdarg.ArgList := Stdarg.Empty)
   --  return CLIENT_CALL_RETURN;                -- rpcndr.h:1812

   function NdrStubCall
     (pThis : access Win32.Objbase.IRpcStubBuffer;
      pChannel : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : access Win32.ULONG)
     return Win32.LONG;                           --  rpcndr.h:1828

   procedure NdrServerCall
     (pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE);       --  rpcndr.h:1836

   function NdrServerUnmarshall
     (pChannel : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMsg : Win32.Rpcdcep.PRPC_MESSAGE;
      pStubMsg : PMIDL_STUB_MESSAGE;
      pStubDescriptor : PMIDL_STUB_DESC;
      pFormat : PFORMAT_STRING;
      pParamList : Win32.PVOID)
     return Win32.INT;                            --  rpcndr.h:1841

   procedure NdrServerMarshall
     (pThis : access Win32.Objbase.IRpcStubBuffer;
      pChannel : access Win32.Objbase.IRpcChannelBuffer;
      pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING);                  --  rpcndr.h:1851

   function NdrMapCommAndFaultStatus
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pCommStatus : access Win32.ULONG;
      pFaultStatus : access Win32.ULONG;
      Status : Win32.Rpc.RPC_STATUS)
     return Win32.Rpc.RPC_STATUS;                 --  rpcndr.h:1861

   function NdrSH_UPDecision
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      pBuffer : RPC_BUFPTR)
     return Win32.INT;                            --  rpcndr.h:1871

   function NdrSH_TLUPDecision
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR)
     return Win32.INT;                            --  rpcndr.h:1878

   function NdrSH_TLUPDecisionBuffer
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR)
     return Win32.INT;                            --  rpcndr.h:1884

   function NdrSH_IfAlloc
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count : Win32.ULONG)
     return Win32.INT;                            --  rpcndr.h:1890

   function NdrSH_IfAllocRef
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count : Win32.ULONG)
     return Win32.INT;                            --  rpcndr.h:1897

   function NdrSH_IfAllocSet
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count : Win32.ULONG)
     return Win32.INT;                            --  rpcndr.h:1904

   function NdrSH_IfCopy
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count : Win32.ULONG)
     return RPC_BUFPTR;                           --  rpcndr.h:1911

   function NdrSH_IfAllocCopy
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pPtrInMem : access Win32.PUCHAR;
      Count : Win32.ULONG)
     return RPC_BUFPTR;                           --  rpcndr.h:1918

   function NdrSH_Copy
     (pStubMsg : Win32.PUCHAR;
      pPtrInMem : Win32.PUCHAR;
      Count : Win32.ULONG)
     return Win32.ULONG;                          --  rpcndr.h:1925

   procedure NdrSH_IfFree
     (pMessage : PMIDL_STUB_MESSAGE;
      pPtr : Win32.PUCHAR);                    --  rpcndr.h:1932

   function NdrSH_StringMarshall
     (pMessage : PMIDL_STUB_MESSAGE;
      pMemory : Win32.PUCHAR;
      Count : Win32.ULONG;
      Size : Win32.INT)
     return RPC_BUFPTR;                           --  rpcndr.h:1938

   function NdrSH_StringUnMarshall
     (pMessage : PMIDL_STUB_MESSAGE;
      pMemory : access Win32.PUCHAR;
      Size : Win32.INT)
     return RPC_BUFPTR;                           --  rpcndr.h:1945

   function RpcSsAllocate
     (Size : Win32.Size_T)
     return Win32.PVOID;                          --  rpcndr.h:1971

   procedure RpcSsDisableAllocate;                         --  rpcndr.h:1976

   procedure RpcSsEnableAllocate;                          --  rpcndr.h:1981

   procedure RpcSsFree
     (NodeToFree : Win32.PVOID);                   --  rpcndr.h:1986

   function RpcSsGetThreadHandle return RPC_SS_THREAD_HANDLE;
   --  rpcndr.h:1991

   procedure RpcSsSetClientAllocFree
     (ClientAlloc : RPC_CLIENT_ALLOC;
      ClientFree : RPC_CLIENT_FREE);              --  rpcndr.h:1996

   procedure RpcSsSetThreadHandle
     (Id : RPC_SS_THREAD_HANDLE);                  --  rpcndr.h:2002

   procedure RpcSsSwapClientAllocFree
     (ClientAlloc : RPC_CLIENT_ALLOC;
      ClientFree : RPC_CLIENT_FREE;
      OldClientAlloc : access RPC_CLIENT_ALLOC;
      OldClientFree : access RPC_CLIENT_FREE);    --  rpcndr.h:2007

   function RpcSmAllocate
     (Size : Win32.Size_T;
      pStatus : access Win32.Rpc.RPC_STATUS)
     return Win32.PVOID;                          --  rpcndr.h:2019

   function RpcSmClientFree
     (pNodeToFree : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcndr.h:2025

   function RpcSmDestroyClientContext
     (ContextHandle : PPVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcndr.h:2030

   function RpcSmDisableAllocate return Win32.Rpc.RPC_STATUS;
   --  rpcndr.h:2035

   function RpcSmEnableAllocate return Win32.Rpc.RPC_STATUS;
   --  rpcndr.h:2040

   function RpcSmFree
     (NodeToFree : Win32.PVOID)
     return Win32.Rpc.RPC_STATUS;                 --  rpcndr.h:2045

   function RpcSmGetThreadHandle
     (pStatus : access Win32.Rpc.RPC_STATUS)
     return RPC_SS_THREAD_HANDLE;                 --  rpcndr.h:2050

   function RpcSmSetClientAllocFree
     (ClientAlloc : RPC_CLIENT_ALLOC;
      ClientFree : RPC_CLIENT_FREE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcndr.h:2055

   function RpcSmSetThreadHandle
     (Id : RPC_SS_THREAD_HANDLE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcndr.h:2061

   function RpcSmSwapClientAllocFree
     (ClientAlloc : RPC_CLIENT_ALLOC;
      ClientFree : RPC_CLIENT_FREE;
      OldClientAlloc : access RPC_CLIENT_ALLOC;
      OldClientFree : access RPC_CLIENT_FREE)
     return Win32.Rpc.RPC_STATUS;                 --  rpcndr.h:2066

   procedure NdrRpcSsEnableAllocate
     (pMessage : PMIDL_STUB_MESSAGE);              --  rpcndr.h:2078

   procedure NdrRpcSsDisableAllocate
     (pMessage : PMIDL_STUB_MESSAGE);              --  rpcndr.h:2082

   procedure NdrRpcSmSetClientToOsf
     (pMessage : PMIDL_STUB_MESSAGE);              --  rpcndr.h:2086

   function NdrRpcSmClientAllocate
     (Size : Win32.Size_T)
     return Win32.PVOID;                          --  rpcndr.h:2090

   procedure NdrRpcSmClientFree
     (NodeToFree : Win32.PVOID);                   --  rpcndr.h:2095

   function NdrRpcSsDefaultAllocate
     (Size : Win32.Size_T)
     return Win32.PVOID;                          --  rpcndr.h:2100

   procedure NdrRpcSsDefaultFree
     (NodeToFree : Win32.PVOID);                   --  rpcndr.h:2105

   function NdrFullPointerXlatInit
     (NumberOfPointers : Win32.ULONG;
      XlatSide : XLAT_SIDE)
     return PFULL_PTR_XLAT_TABLES;                --  rpcndr.h:2118

   procedure NdrFullPointerXlatFree
     (pXlatTables : PFULL_PTR_XLAT_TABLES);        --  rpcndr.h:2124

   function NdrFullPointerQueryPointer
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      pPointer : Win32.PVOID;
      QueryType : Win32.UCHAR;
      pRefId : access Win32.ULONG)
     return Win32.INT;                            --  rpcndr.h:2129

   function NdrFullPointerQueryRefId
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      RefId : Win32.ULONG;
      QueryType : Win32.UCHAR;
      ppPointer : PPVOID)
     return Win32.INT;                            --  rpcndr.h:2137

   procedure NdrFullPointerInsertRefId
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      RefId : Win32.ULONG;
      pPointer : Win32.PVOID);                  --  rpcndr.h:2145

   function NdrFullPointerFree
     (pXlatTables : PFULL_PTR_XLAT_TABLES;
      Pointer : Win32.PVOID)
     return Win32.INT;                            --  rpcndr.h:2152

   function NdrAllocate
     (pStubMsg : PMIDL_STUB_MESSAGE;
      Len : Win32.Size_T)
     return Win32.PVOID;                          --  rpcndr.h:2158

   procedure NdrClearOutParameters
     (pStubMsg : PMIDL_STUB_MESSAGE;
      pFormat : PFORMAT_STRING;
      ArgAddr : Win32.PVOID);                     --  rpcndr.h:2164

   function NdrOleAllocate
     (Size : Win32.Size_T)
     return Win32.PVOID;                          --  rpcndr.h:2176

   procedure NdrOleFree
     (NodeToFree : Win32.PVOID);                   --  rpcndr.h:2181

private

   pragma Convention (c_pass_by_copy, struct_anonymous1_t); --  rpcndr.h:209
   pragma Convention (c_pass_by_copy, SCONTEXT_QUEUE);      --  rpcndr.h:217
   pragma Convention (C, MIDL_STUB_MESSAGE);                --  rpcndr.h:600
   pragma Convention (C, ARRAY_INFO);                       --  rpcndr.h:632
   pragma Convention (c_pass_by_copy, GENERIC_BINDING_ROUTINE_PAIR);
   --  rpcndr.h:821
   pragma Convention (c_pass_by_copy, GENERIC_BINDING_INFO); --  rpcndr.h:827
   pragma Convention (c_pass_by_copy, XMIT_ROUTINE_QUINTUPLE);
   --  rpcndr.h:839
   pragma Convention (c_pass_by_copy, MIDL_FORMAT_STRING);  --  rpcndr.h:898
   pragma Convention (C, MIDL_SERVER_INFO);                 --  rpcndr.h:917
   pragma Convention (c_pass_by_copy, FULL_PTR_TO_REFID_ELEMENT);
   --  rpcndr.h:951
   pragma Convention (c_pass_by_copy, struct_anonymous10_t); --  rpcndr.h:971
   pragma Convention (c_pass_by_copy, struct_anonymous12_t); --  rpcndr.h:981
   pragma Convention (C, MIDL_STUB_DESC);                   --  rpcndr.h:601
   pragma Convention (C, FULL_PTR_XLAT_TABLES);             --  rpcndr.h:602

   pragma Import (Stdcall, MIDL_user_allocate, "MIDL_user_allocate");
   --  rpcndr.h:177
   pragma Import (Stdcall, MIDL_user_free, "MIDL_user_free");
   --  rpcndr.h:178
   pragma Import (Stdcall, NDRCContextBinding, "NDRCContextBinding");
   --  rpcndr.h:223
   pragma Import (Stdcall, NDRCContextMarshall, "NDRCContextMarshall");
   --  rpcndr.h:228
   pragma Import (Stdcall, NDRCContextUnmarshall, "NDRCContextUnmarshall");
   --  rpcndr.h:234
   pragma Import (Stdcall, NDRSContextMarshall, "NDRSContextMarshall");
   --  rpcndr.h:242
   pragma Import (Stdcall, NDRSContextUnmarshall, "NDRSContextUnmarshall");
   --  rpcndr.h:249
   pragma Import (Stdcall, RpcSsDestroyClientContext,
                    "RpcSsDestroyClientContext");
   --  rpcndr.h:255
   pragma Import (Stdcall, NDRcopy, "NDRcopy");
   --  rpcndr.h:356
   pragma Import (Stdcall, MIDL_wchar_strlen, "MIDL_wchar_strlen");
   --  rpcndr.h:363
   pragma Import (Stdcall, MIDL_wchar_strcpy, "MIDL_wchar_strcpy");
   --  rpcndr.h:368
   pragma Import (Stdcall, char_from_ndr, "char_from_ndr");
   --  rpcndr.h:374
   pragma Import (Stdcall, char_array_from_ndr, "char_array_from_ndr");
   --  rpcndr.h:380
   pragma Import (Stdcall, short_from_ndr, "short_from_ndr");
   --  rpcndr.h:388
   pragma Import (Stdcall, short_array_from_ndr, "short_array_from_ndr");
   --  rpcndr.h:394
   pragma Import (Stdcall, short_from_ndr_temp, "short_from_ndr_temp");
   --  rpcndr.h:402
   pragma Import (Stdcall, long_from_ndr, "long_from_ndr");
   --  rpcndr.h:409
   pragma Import (Stdcall, long_array_from_ndr, "long_array_from_ndr");
   --  rpcndr.h:415
   pragma Import (Stdcall, long_from_ndr_temp, "long_from_ndr_temp");
   --  rpcndr.h:423
   pragma Import (Stdcall, enum_from_ndr, "enum_from_ndr");
   --  rpcndr.h:430
   pragma Import (Stdcall, float_from_ndr, "float_from_ndr");
   --  rpcndr.h:436
   pragma Import (Stdcall, float_array_from_ndr, "float_array_from_ndr");
   --  rpcndr.h:442
   pragma Import (Stdcall, double_from_ndr, "double_from_ndr");
   --  rpcndr.h:450
   pragma Import (Stdcall, double_array_from_ndr, "double_array_from_ndr");
   --  rpcndr.h:456
   pragma Import (Stdcall, hyper_from_ndr, "hyper_from_ndr");
   --  rpcndr.h:464
   pragma Import (Stdcall, hyper_array_from_ndr, "hyper_array_from_ndr");
   --  rpcndr.h:470
   pragma Import (Stdcall, hyper_from_ndr_temp, "hyper_from_ndr_temp");
   --  rpcndr.h:478
   pragma Import (Stdcall, data_from_ndr, "data_from_ndr");
   --  rpcndr.h:485
   pragma Import (Stdcall, data_into_ndr, "data_into_ndr");
   --  rpcndr.h:493
   pragma Import (Stdcall, tree_into_ndr, "tree_into_ndr");
   --  rpcndr.h:501
   pragma Import (Stdcall, data_size_ndr, "data_size_ndr");
   --  rpcndr.h:509
   pragma Import (Stdcall, tree_size_ndr, "tree_size_ndr");
   --  rpcndr.h:517
   pragma Import (Stdcall, tree_peek_ndr, "tree_peek_ndr");
   --  rpcndr.h:525
   pragma Import (Stdcall, midl_allocate, "midl_allocate");
   --  rpcndr.h:533
   pragma Import (Stdcall, NdrSimpleTypeMarshall, "NdrSimpleTypeMarshall");
   --  rpcndr.h:1007
   pragma Import (Stdcall, NdrPointerMarshall, "NdrPointerMarshall");
   --  rpcndr.h:1014
   pragma Import (Stdcall, NdrSimpleStructMarshall, "NdrSimpleStructMarshall");
   --  rpcndr.h:1023
   pragma Import (Stdcall, NdrConformantStructMarshall,
                    "NdrConformantStructMarshall");        --  rpcndr.h:1030
   pragma Import (Stdcall, NdrConformantVaryingStructMarshall,
                    "NdrConformantVaryingStructMarshall"); --  rpcndr.h:1037
   pragma Import (Stdcall, NdrComplexStructMarshall,
                    "NdrComplexStructMarshall");
   --  rpcndr.h:1044
   pragma Import (Stdcall, NdrFixedArrayMarshall, "NdrFixedArrayMarshall");
   --  rpcndr.h:1053
   pragma Import (Stdcall, NdrConformantArrayMarshall,
                    "NdrConformantArrayMarshall");
   --  rpcndr.h:1060
   pragma Import (Stdcall, NdrConformantVaryingArrayMarshall,
                    "NdrConformantVaryingArrayMarshall");  --  rpcndr.h:1067
   pragma Import (Stdcall, NdrVaryingArrayMarshall, "NdrVaryingArrayMarshall");
   --  rpcndr.h:1074
   pragma Import (Stdcall, NdrComplexArrayMarshall, "NdrComplexArrayMarshall");
   --  rpcndr.h:1081
   pragma Import (Stdcall, NdrNonConformantStringMarshall,
                    "NdrNonConformantStringMarshall");     --  rpcndr.h:1090
   pragma Import (Stdcall, NdrConformantStringMarshall,
                    "NdrConformantStringMarshall");        --  rpcndr.h:1097
   pragma Import (Stdcall, NdrEncapsulatedUnionMarshall,
                    "NdrEncapsulatedUnionMarshall");       --  rpcndr.h:1106
   pragma Import (Stdcall, NdrNonEncapsulatedUnionMarshall,
                    "NdrNonEncapsulatedUnionMarshall");    --  rpcndr.h:1113
   pragma Import (Stdcall, NdrByteCountPointerMarshall,
                    "NdrByteCountPointerMarshall");        --  rpcndr.h:1122
   pragma Import (Stdcall, NdrXmitOrRepAsMarshall, "NdrXmitOrRepAsMarshall");
   --  rpcndr.h:1131
   pragma Import (Stdcall, NdrInterfacePointerMarshall,
                    "NdrInterfacePointerMarshall");        --  rpcndr.h:1140
   pragma Import (Stdcall, NdrClientContextMarshall,
                    "NdrClientContextMarshall");
   --  rpcndr.h:1149
   pragma Import (Stdcall, NdrServerContextMarshall,
                    "NdrServerContextMarshall");
   --  rpcndr.h:1156
   pragma Import (Stdcall, NdrSimpleTypeUnmarshall, "NdrSimpleTypeUnmarshall");
   --  rpcndr.h:1167
   pragma Import (Stdcall, NdrPointerUnmarshall, "NdrPointerUnmarshall");
   --  rpcndr.h:1174
   pragma Import (Stdcall, NdrSimpleStructUnmarshall,
                    "NdrSimpleStructUnmarshall");
   --  rpcndr.h:1184
   pragma Import (Stdcall, NdrConformantStructUnmarshall,
                    "NdrConformantStructUnmarshall");      --  rpcndr.h:1192
   pragma Import (Stdcall, NdrConformantVaryingStructUnmarshall,
                    "NdrConformantVaryingStructUnmarshall");
   --  rpcndr.h:1200
   pragma Import (Stdcall, NdrComplexStructUnmarshall,
                    "NdrComplexStructUnmarshall");
   --  rpcndr.h:1208
   pragma Import (Stdcall, NdrFixedArrayUnmarshall, "NdrFixedArrayUnmarshall");
   --  rpcndr.h:1218
   pragma Import (Stdcall, NdrConformantArrayUnmarshall,
                    "NdrConformantArrayUnmarshall");       --  rpcndr.h:1226
   pragma Import (Stdcall, NdrConformantVaryingArrayUnmarshall,
                    "NdrConformantVaryingArrayUnmarshall"); --  rpcndr.h:1234
   pragma Import (Stdcall, NdrVaryingArrayUnmarshall,
                    "NdrVaryingArrayUnmarshall");
   --  rpcndr.h:1242
   pragma Import (Stdcall, NdrComplexArrayUnmarshall,
                    "NdrComplexArrayUnmarshall");
   --  rpcndr.h:1250
   pragma Import (Stdcall, NdrNonConformantStringUnmarshall,
                    "NdrNonConformantStringUnmarshall");   --  rpcndr.h:1260
   pragma Import (Stdcall, NdrConformantStringUnmarshall,
                    "NdrConformantStringUnmarshall");      --  rpcndr.h:1268
   pragma Import (Stdcall, NdrEncapsulatedUnionUnmarshall,
                    "NdrEncapsulatedUnionUnmarshall");     --  rpcndr.h:1278
   pragma Import (Stdcall, NdrNonEncapsulatedUnionUnmarshall,
                    "NdrNonEncapsulatedUnionUnmarshall");  --  rpcndr.h:1286
   pragma Import (Stdcall, NdrByteCountPointerUnmarshall,
                    "NdrByteCountPointerUnmarshall");      --  rpcndr.h:1296
   pragma Import (Stdcall, NdrXmitOrRepAsUnmarshall,
                    "NdrXmitOrRepAsUnmarshall");
   --  rpcndr.h:1306
   pragma Import (Stdcall, NdrInterfacePointerUnmarshall,
                    "NdrInterfacePointerUnmarshall");      --  rpcndr.h:1316
   pragma Import (Stdcall, NdrClientContextUnmarshall,
                    "NdrClientContextUnmarshall");
   --  rpcndr.h:1326
   pragma Import (Stdcall, NdrServerContextUnmarshall,
                    "NdrServerContextUnmarshall");
   --  rpcndr.h:1333
   pragma Import (Stdcall, NdrPointerBufferSize, "NdrPointerBufferSize");
   --  rpcndr.h:1342
   pragma Import (Stdcall, NdrSimpleStructBufferSize,
                    "NdrSimpleStructBufferSize");
   --  rpcndr.h:1351
   pragma Import (Stdcall, NdrConformantStructBufferSize,
                    "NdrConformantStructBufferSize");      --  rpcndr.h:1358
   pragma Import (Stdcall, NdrConformantVaryingStructBufferSize,
                    "NdrConformantVaryingStructBufferSize");
   --  rpcndr.h:1365
   pragma Import (Stdcall, NdrComplexStructBufferSize,
                    "NdrComplexStructBufferSize");
   --  rpcndr.h:1372
   pragma Import (Stdcall, NdrFixedArrayBufferSize, "NdrFixedArrayBufferSize");
   --  rpcndr.h:1381
   pragma Import (Stdcall, NdrConformantArrayBufferSize,
                    "NdrConformantArrayBufferSize");       --  rpcndr.h:1388
   pragma Import (Stdcall, NdrConformantVaryingArrayBufferSize,
                    "NdrConformantVaryingArrayBufferSize"); --  rpcndr.h:1395
   pragma Import (Stdcall, NdrVaryingArrayBufferSize,
                    "NdrVaryingArrayBufferSize");
   --  rpcndr.h:1402
   pragma Import (Stdcall, NdrComplexArrayBufferSize,
                    "NdrComplexArrayBufferSize");
   --  rpcndr.h:1409
   pragma Import (Stdcall, NdrConformantStringBufferSize,
                    "NdrConformantStringBufferSize");      --  rpcndr.h:1418
   pragma Import (Stdcall, NdrNonConformantStringBufferSize,
                    "NdrNonConformantStringBufferSize");   --  rpcndr.h:1425
   pragma Import (Stdcall, NdrEncapsulatedUnionBufferSize,
                    "NdrEncapsulatedUnionBufferSize");     --  rpcndr.h:1434
   pragma Import (Stdcall, NdrNonEncapsulatedUnionBufferSize,
                    "NdrNonEncapsulatedUnionBufferSize");  --  rpcndr.h:1441
   pragma Import (Stdcall, NdrByteCountPointerBufferSize,
                    "NdrByteCountPointerBufferSize");      --  rpcndr.h:1450
   pragma Import (Stdcall, NdrXmitOrRepAsBufferSize,
                    "NdrXmitOrRepAsBufferSize");
   --  rpcndr.h:1459
   pragma Import (Stdcall, NdrInterfacePointerBufferSize,
                    "NdrInterfacePointerBufferSize");      --  rpcndr.h:1468
   pragma Import (Stdcall, NdrContextHandleSize, "NdrContextHandleSize");
   --  rpcndr.h:1477
   pragma Import (Stdcall, NdrPointerMemorySize, "NdrPointerMemorySize");
   --  rpcndr.h:1488
   pragma Import (Stdcall, NdrSimpleStructMemorySize,
                    "NdrSimpleStructMemorySize");
   --  rpcndr.h:1496
   pragma Import (Stdcall, NdrConformantStructMemorySize,
                    "NdrConformantStructMemorySize");      --  rpcndr.h:1502
   pragma Import (Stdcall, NdrConformantVaryingStructMemorySize,
                    "NdrConformantVaryingStructMemorySize");
   --  rpcndr.h:1508
   pragma Import (Stdcall, NdrComplexStructMemorySize,
                    "NdrComplexStructMemorySize");
   --  rpcndr.h:1514
   pragma Import (Stdcall, NdrFixedArrayMemorySize, "NdrFixedArrayMemorySize");
   --  rpcndr.h:1522
   pragma Import (Stdcall, NdrConformantArrayMemorySize,
                    "NdrConformantArrayMemorySize");       --  rpcndr.h:1528
   pragma Import (Stdcall, NdrConformantVaryingArrayMemorySize,
                    "NdrConformantVaryingArrayMemorySize"); --  rpcndr.h:1534
   pragma Import (Stdcall, NdrVaryingArrayMemorySize,
                    "NdrVaryingArrayMemorySize");
   --  rpcndr.h:1540
   pragma Import (Stdcall, NdrComplexArrayMemorySize,
                    "NdrComplexArrayMemorySize");
   --  rpcndr.h:1546
   pragma Import (Stdcall, NdrConformantStringMemorySize,
                    "NdrConformantStringMemorySize");      --  rpcndr.h:1554
   pragma Import (Stdcall, NdrNonConformantStringMemorySize,
                    "NdrNonConformantStringMemorySize");   --  rpcndr.h:1560
   pragma Import (Stdcall, NdrEncapsulatedUnionMemorySize,
                    "NdrEncapsulatedUnionMemorySize");     --  rpcndr.h:1568
   pragma Import (Stdcall, NdrNonEncapsulatedUnionMemorySize,
                    "NdrNonEncapsulatedUnionMemorySize");  --  rpcndr.h:1574
   pragma Import (Stdcall, NdrXmitOrRepAsMemorySize,
                    "NdrXmitOrRepAsMemorySize");
   --  rpcndr.h:1582
   pragma Import (Stdcall, NdrInterfacePointerMemorySize,
                    "NdrInterfacePointerMemorySize");      --  rpcndr.h:1590
   pragma Import (Stdcall, NdrPointerFree, "NdrPointerFree"); --  rpcndr.h:1600
   pragma Import (Stdcall, NdrSimpleStructFree, "NdrSimpleStructFree");
   --  rpcndr.h:1609
   pragma Import (Stdcall, NdrConformantStructFree, "NdrConformantStructFree");
   --  rpcndr.h:1616
   pragma Import (Stdcall, NdrConformantVaryingStructFree,
                    "NdrConformantVaryingStructFree");     --  rpcndr.h:1623
   pragma Import (Stdcall, NdrComplexStructFree, "NdrComplexStructFree");
   --  rpcndr.h:1630
   pragma Import (Stdcall, NdrFixedArrayFree, "NdrFixedArrayFree");
   --  rpcndr.h:1639
   pragma Import (Stdcall, NdrConformantArrayFree, "NdrConformantArrayFree");
   --  rpcndr.h:1646
   pragma Import (Stdcall, NdrConformantVaryingArrayFree,
                    "NdrConformantVaryingArrayFree");      --  rpcndr.h:1653
   pragma Import (Stdcall, NdrVaryingArrayFree, "NdrVaryingArrayFree");
   --  rpcndr.h:1660
   pragma Import (Stdcall, NdrComplexArrayFree, "NdrComplexArrayFree");
   --  rpcndr.h:1667
   pragma Import (Stdcall, NdrEncapsulatedUnionFree,
                    "NdrEncapsulatedUnionFree");
   --  rpcndr.h:1676
   pragma Import (Stdcall, NdrNonEncapsulatedUnionFree,
                    "NdrNonEncapsulatedUnionFree");        --  rpcndr.h:1683
   pragma Import (Stdcall, NdrByteCountPointerFree, "NdrByteCountPointerFree");
   --  rpcndr.h:1692
   pragma Import (Stdcall, NdrXmitOrRepAsFree, "NdrXmitOrRepAsFree");
   --  rpcndr.h:1701
   pragma Import (Stdcall, NdrInterfacePointerFree, "NdrInterfacePointerFree");
   --  rpcndr.h:1710
   pragma Import (Stdcall, NdrConvert, "NdrConvert");
   --  rpcndr.h:1721
   pragma Import (Stdcall, NdrClientInitializeNew, "NdrClientInitializeNew");
   --  rpcndr.h:1731
   pragma Import (Stdcall, NdrServerInitializeNew, "NdrServerInitializeNew");
   --  rpcndr.h:1739
   pragma Import (Stdcall, NdrClientInitialize, "NdrClientInitialize");
   --  rpcndr.h:1746
   pragma Import (Stdcall, NdrServerInitialize, "NdrServerInitialize");
   --  rpcndr.h:1754
   pragma Import (Stdcall, NdrServerInitializeUnmarshall,
                    "NdrServerInitializeUnmarshall");      --  rpcndr.h:1761
   pragma Import (Stdcall, NdrServerInitializeMarshall,
                    "NdrServerInitializeMarshall");        --  rpcndr.h:1768
   pragma Import (Stdcall, NdrGetBuffer, "NdrGetBuffer");
   --  rpcndr.h:1774
   pragma Import (Stdcall, NdrNsGetBuffer, "NdrNsGetBuffer");
   --  rpcndr.h:1781
   pragma Import (Stdcall, NdrSendReceive, "NdrSendReceive");
   --  rpcndr.h:1788
   pragma Import (Stdcall, NdrNsSendReceive, "NdrNsSendReceive");
   --  rpcndr.h:1794
   pragma Import (Stdcall, NdrFreeBuffer, "NdrFreeBuffer");
   --  rpcndr.h:1801
   pragma Import (Stdcall, NdrStubCall, "NdrStubCall");
   --  rpcndr.h:1828
   pragma Import (Stdcall, NdrServerCall, "NdrServerCall");
   --  rpcndr.h:1836
   pragma Import (Stdcall, NdrServerUnmarshall, "NdrServerUnmarshall");
   --  rpcndr.h:1841
   pragma Import (Stdcall, NdrServerMarshall, "NdrServerMarshall");
   --  rpcndr.h:1851
   pragma Import (Stdcall, NdrMapCommAndFaultStatus,
                    "NdrMapCommAndFaultStatus");
   --  rpcndr.h:1861
   pragma Import (Stdcall, NdrSH_UPDecision, "NdrSH_UPDecision");
   --  rpcndr.h:1871
   pragma Import (Stdcall, NdrSH_TLUPDecision, "NdrSH_TLUPDecision");
   --  rpcndr.h:1878
   pragma Import (Stdcall, NdrSH_TLUPDecisionBuffer,
                    "NdrSH_TLUPDecisionBuffer");
   --  rpcndr.h:1884
   pragma Import (Stdcall, NdrSH_IfAlloc, "NdrSH_IfAlloc");
   --  rpcndr.h:1890
   pragma Import (Stdcall, NdrSH_IfAllocRef, "NdrSH_IfAllocRef");
   --  rpcndr.h:1897
   pragma Import (Stdcall, NdrSH_IfAllocSet, "NdrSH_IfAllocSet");
   --  rpcndr.h:1904
   pragma Import (Stdcall, NdrSH_IfCopy, "NdrSH_IfCopy");
   --  rpcndr.h:1911
   pragma Import (Stdcall, NdrSH_IfAllocCopy, "NdrSH_IfAllocCopy");
   --  rpcndr.h:1918
   pragma Import (Stdcall, NdrSH_Copy, "NdrSH_Copy");
   --  rpcndr.h:1925
   pragma Import (Stdcall, NdrSH_IfFree, "NdrSH_IfFree");
   --  rpcndr.h:1932
   pragma Import (Stdcall, NdrSH_StringMarshall, "NdrSH_StringMarshall");
   --  rpcndr.h:1938
   pragma Import (Stdcall, NdrSH_StringUnMarshall, "NdrSH_StringUnMarshall");
   --  rpcndr.h:1945
   pragma Import (Stdcall, RpcSsAllocate, "RpcSsAllocate");
   --  rpcndr.h:1971
   pragma Import (Stdcall, RpcSsDisableAllocate, "RpcSsDisableAllocate");
   --  rpcndr.h:1976
   pragma Import (Stdcall, RpcSsEnableAllocate, "RpcSsEnableAllocate");
   --  rpcndr.h:1981
   pragma Import (Stdcall, RpcSsFree, "RpcSsFree");
   --  rpcndr.h:1986
   pragma Import (Stdcall, RpcSsGetThreadHandle, "RpcSsGetThreadHandle");
   --  rpcndr.h:1991
   pragma Import (Stdcall, RpcSsSetClientAllocFree,
                    "RpcSsSetClientAllocFree");
   --  rpcndr.h:1996
   pragma Import (Stdcall, RpcSsSetThreadHandle, "RpcSsSetThreadHandle");
   --  rpcndr.h:2002
   pragma Import (Stdcall, RpcSsSwapClientAllocFree,
                    "RpcSsSwapClientAllocFree");
   --  rpcndr.h:2007
   pragma Import (Stdcall, RpcSmAllocate, "RpcSmAllocate");
   --  rpcndr.h:2019
   pragma Import (Stdcall, RpcSmClientFree, "RpcSmClientFree");
   --  rpcndr.h:2025
   pragma Import (Stdcall, RpcSmDestroyClientContext,
                    "RpcSmDestroyClientContext");
   --  rpcndr.h:2030
   pragma Import (Stdcall, RpcSmDisableAllocate, "RpcSmDisableAllocate");
   --  rpcndr.h:2035
   pragma Import (Stdcall, RpcSmEnableAllocate, "RpcSmEnableAllocate");
   --  rpcndr.h:2040
   pragma Import (Stdcall, RpcSmFree, "RpcSmFree");
   --  rpcndr.h:2045
   pragma Import (Stdcall, RpcSmGetThreadHandle, "RpcSmGetThreadHandle");
   --  rpcndr.h:2050
   pragma Import (Stdcall, RpcSmSetClientAllocFree,
                    "RpcSmSetClientAllocFree");
   --  rpcndr.h:2055
   pragma Import (Stdcall, RpcSmSetThreadHandle, "RpcSmSetThreadHandle");
   --  rpcndr.h:2061
   pragma Import (Stdcall, RpcSmSwapClientAllocFree,
                    "RpcSmSwapClientAllocFree");
   --  rpcndr.h:2066
   pragma Import (Stdcall, NdrRpcSsEnableAllocate, "NdrRpcSsEnableAllocate");
   --  rpcndr.h:2078
   pragma Import (Stdcall, NdrRpcSsDisableAllocate,
                    "NdrRpcSsDisableAllocate");
   --  rpcndr.h:2082
   pragma Import (Stdcall, NdrRpcSmSetClientToOsf, "NdrRpcSmSetClientToOsf");
   --  rpcndr.h:2086
   pragma Import (Stdcall, NdrRpcSmClientAllocate, "NdrRpcSmClientAllocate");
   --  rpcndr.h:2090
   pragma Import (Stdcall, NdrRpcSmClientFree, "NdrRpcSmClientFree");
   --  rpcndr.h:2095
   pragma Import (Stdcall, NdrRpcSsDefaultAllocate,
                    "NdrRpcSsDefaultAllocate");
   --  rpcndr.h:2100
   pragma Import (Stdcall, NdrRpcSsDefaultFree, "NdrRpcSsDefaultFree");
   --  rpcndr.h:2105
   pragma Import (Stdcall, NdrFullPointerXlatInit, "NdrFullPointerXlatInit");
   --  rpcndr.h:2118
   pragma Import (Stdcall, NdrFullPointerXlatFree, "NdrFullPointerXlatFree");
   --  rpcndr.h:2124
   pragma Import (Stdcall, NdrFullPointerQueryPointer,
                    "NdrFullPointerQueryPointer");
   --  rpcndr.h:2129
   pragma Import (Stdcall, NdrFullPointerQueryRefId,
                    "NdrFullPointerQueryRefId");
   --  rpcndr.h:2137
   pragma Import (Stdcall, NdrFullPointerInsertRefId,
                    "NdrFullPointerInsertRefId");
   --  rpcndr.h:2145
   pragma Import (Stdcall, NdrFullPointerFree, "NdrFullPointerFree");
   --  rpcndr.h:2152
   pragma Import (Stdcall, NdrAllocate, "NdrAllocate");
   --  rpcndr.h:2158
   pragma Import (Stdcall, NdrClearOutParameters, "NdrClearOutParameters");
   --  rpcndr.h:2164
   pragma Import (Stdcall, NdrOleAllocate, "NdrOleAllocate");
   --  rpcndr.h:2176
   pragma Import (Stdcall, NdrOleFree, "NdrOleFree");
   --  rpcndr.h:2181

   pragma Inline (byte_from_ndr);
   pragma Inline (byte_array_from_ndr);
   pragma Inline (boolean_from_ndr);
   pragma Inline (boolean_array_from_ndr);
   pragma Inline (small_from_ndr);
   pragma Inline (small_array_from_ndr);

end Win32.Rpcndr;
