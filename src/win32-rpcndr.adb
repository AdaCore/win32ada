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


with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;

package body Win32.Rpcndr is

   function NDRSContextValue (hContext : access NDR_SCONTEXT)
                            return System.Address is      --  rpcndr.h:211
   begin
      return hContext.all.userContext'Address;
   end NDRSContextValue;

   function To_Int is new Ada.Unchecked_Conversion (Win32.PVOID, Integer);
   function To_PVOID is new Ada.Unchecked_Conversion
     (Integer, Win32.PVOID);

   su : Integer := System.Storage_Unit;

   procedure byte_from_ndr (source : in out Win32.Rpcdcep.PRPC_MESSAGE;
                           target : out    Win32.PBYTE) is  --  rpcndr.h: 264

      function To_PBYTE is new Ada.Unchecked_Conversion (Win32.PVOID,
                                                        Win32.PBYTE);
   begin
      target := To_PBYTE (source.Buffer);
      source.all.Buffer := To_PVOID (To_Int (source.all.Buffer) +
                                    Win32.PCHAR'Size / su);
   end byte_from_ndr;

   function "-"(l, r : Interfaces.C.unsigned)
               return Interfaces.C.unsigned
     renames Interfaces.C."-";

   procedure byte_array_from_ndr
     (
      Source : in out Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : in Win32.UINT;
      UpperIndex : in Win32.UINT;
      Target : Win32.PBYTE) is                 --  rpcndr.h:269

      function To_Int is new Ada.Unchecked_Conversion (Win32.PBYTE, Integer);
   begin
      NDRcopy (To_PVOID (To_Int (Target) + Integer (LowerIndex)),
               Source.all.Buffer,
               UpperIndex - LowerIndex);
      Source.all.Buffer := To_PVOID (
                                    To_Int (Source.all.Buffer) +
                                    (Integer (UpperIndex - LowerIndex) *
                                     Win32.PULONG'Size / su));
   end byte_array_from_ndr;


   procedure boolean_from_ndr
     (source : in out Win32.Rpcdcep.PRPC_MESSAGE;
      target : out    Win32.PBOOL) is              --  rpcndr.h:278

      function To_PBOOL is new Ada.Unchecked_Conversion
        (Win32.PVOID,
         Win32.PBOOL);
   begin
      target := To_PBOOL (source.all.Buffer);
      source.all.Buffer := To_PVOID (To_Int (source.all.Buffer) +
                                    Win32.PCHAR'Size / su);
   end boolean_from_ndr;

   procedure boolean_array_from_ndr
     (Source : in out Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target : Win32.PBOOL) is
      --  rpcndr.h:283
      function To_Int is new Ada.Unchecked_Conversion (Win32.PBOOL, Integer);
   begin
      NDRcopy (To_PVOID (To_Int (Target) + Integer (LowerIndex)),
               Source.all.Buffer,
               UpperIndex - LowerIndex);
      Source.all.Buffer := To_PVOID
        (To_Int (Source.all.Buffer) +
         (Integer (UpperIndex - LowerIndex) * Win32.PULONG'Size / su));
   end boolean_array_from_ndr;

   procedure small_from_ndr (source : in out Win32.Rpcdcep.PRPC_MESSAGE;
                             target : out    psmall) is      --  rpcndr.h:292
      function to_psmall is new Ada.Unchecked_Conversion
        (Win32.PVOID, psmall);
   begin
      target := to_psmall (source.all.Buffer);
      source.all.Buffer := To_PVOID (To_Int (source.all.Buffer) +
                                     Win32.PCHAR'Size / su);
   end small_from_ndr;

   pragma Warnings (Off);
   procedure small_array_from_ndr
     (Source : in out Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : in Win32.UINT;
      UpperIndex : in Win32.UINT;
      Target : out psmall) is                  --  rpcndr.h:302
   pragma Warnings (On);

      function To_Int is new Ada.Unchecked_Conversion (psmall, Integer);

   begin
      NDRcopy (To_PVOID (To_Int (Target) + Integer (LowerIndex)),
               Source.all.Buffer,
               UpperIndex - LowerIndex);

      Source.all.Buffer := To_PVOID
        (To_Int (Source.all.Buffer) +
         (Integer (UpperIndex - LowerIndex) * Win32.PULONG'Size / su));
   end small_array_from_ndr;

   function To_ULONG is new Ada.Unchecked_Conversion (Win32.PVOID,
                                                      Win32.ULONG);
   function To_PVOID is new Ada.Unchecked_Conversion (Win32.ULONG,
                                                      Win32.PVOID);

   function "+"(l, r : Interfaces.C.unsigned_long)
               return Interfaces.C.unsigned_long
     renames Interfaces.C."+";
   function "*"(l, r : Interfaces.C.unsigned_long)
               return Interfaces.C.unsigned_long
     renames Interfaces.C."*";
   function "/"(l, r : Interfaces.C.unsigned_long)
               return Interfaces.C.unsigned_long
     renames Interfaces.C."/";
   --  function "and"(l,r: Interfaces.C.unsigned)
   --  return Interfaces.C.unsigned
   --  renames Interfaces.C."and";
   function "and"(l, r : Interfaces.C.unsigned_long)
                 return Interfaces.C.unsigned_long
     renames Interfaces.C."and";

   function To_BUFPTR is new Ada.Unchecked_Conversion (Win32.ULONG,
                                                       RPC_BUFPTR);
   function To_ULONG is new Ada.Unchecked_Conversion (RPC_BUFPTR,
                                                      Win32.ULONG);

   procedure midl_fa2 (p : in out RPC_BUFPTR) is            --  rpcndr.h:556
   begin
      p := To_BUFPTR ((To_ULONG (p) + Win32.ULONG (Win32.ULONG'Size / su))
                      and  16#fffffffe#);
   end midl_fa2;

   procedure midl_fa4 (p : in out RPC_BUFPTR) is            --  rpcndr.h:557
   begin
      p := To_BUFPTR ((To_ULONG (p) + 3 * Win32.ULONG (Win32.ULONG'Size / su))
                      and  16#fffffffc#);
   end midl_fa4;

   procedure midl_fa8 (p : in out RPC_BUFPTR) is            --  rpcndr.h:558
   begin
      p := To_BUFPTR ((To_ULONG (p) + 7 * Win32.ULONG (Win32.ULONG'Size / su))
                      and 16#fffffff8#);
   end midl_fa8;

   procedure midl_addp (p : in out Win32.PVOID;
                        n : in Win32.ULONG) is              --  rpcndr.h:560
   begin
      p := To_PVOID (To_ULONG (p) + n * Win32.ULONG (Win32.ULONG'Size / su));
   end midl_addp;

   type PPULONG is access all Win32.PULONG;

   procedure midl_unmarsh_up (p : in out Win32.PVOID) is     --  rpcndr.h:564
   begin
      p := To_PVOID (To_ULONG (p) + Win32.ULONG (Win32.ULONG'Size / su));
   end midl_unmarsh_up;


   function midl_ma4_ulong (p : Win32.PVOID) return Win32.PVOID;
   function midl_ma4_ulong (p : Win32.PVOID) return Win32.PVOID is
      pcopy : Win32.PVOID := p;
   begin
      pcopy := To_PVOID (To_ULONG (p) + Win32.ULONG (Win32.ULONG'Size / su));
      return pcopy;
   end midl_ma4_ulong;

   procedure NdrMarshConfStringHdr (p : in out Win32.PVOID;
                                    s : in Win32.PUCHAR;
                                    l : in Win32.ULONG) is  --  rpcndr.h:574
      function PUCHAR_To_PVOID is new Ada.Unchecked_Conversion (Win32.PUCHAR,
                                                                Win32.PVOID);
      function Int_To_PVOID is new Ada.Unchecked_Conversion (Integer,
                                                             Win32.PVOID);
   begin
      p := midl_ma4_ulong (p);
      p := PUCHAR_To_PVOID (s);
      p := midl_ma4_ulong (p);
      p := Int_To_PVOID (0);
      p := midl_ma4_ulong (p);
      p := To_PVOID (l);
   end NdrMarshConfStringHdr;

   procedure NdrUnMarshConfStringHdr (p : in out Win32.PVOID;
                                      s : out Win32.PUCHAR;
                                      l : out Win32.ULONG) is
      --  rpcndr.h:578
      function To_PUCHAR is new Ada.Unchecked_Conversion (Win32.PVOID,
                                                          Win32.PUCHAR);
   begin
      s := To_PUCHAR (midl_ma4_ulong (p));
      midl_addp (p, 4);
      l := To_ULONG (midl_ma4_ulong (p));
   end NdrUnMarshConfStringHdr;

   function NdrMarshCCtxtHdl (pc : NDR_CCONTEXT;
                              p : Win32.PVOID)
                             return Win32.ULONG is         --  rpcndr.h:582
   begin
      NDRCContextMarshall (pc, p);
      return (To_ULONG (p) + 20);
   end NdrMarshCCtxtHdl;

   function NdrUnMarshCCtxtHdl (pc : access NDR_CCONTEXT;
                                p : Win32.PVOID;
                                h : Win32.Rpcdce.RPC_BINDING_HANDLE;
                                drep : Win32.ULONG)
                               return Win32.ULONG is       --  rpcndr.h:584
   begin
      NDRCContextUnmarshall (pc, h, p, drep);
      return (To_ULONG (p) + 20);
   end NdrUnMarshCCtxtHdl;

   procedure NdrUnMarshSCtxtHdl (pc : out NDR_SCONTEXT;
                                 p : Win32.PVOID;
                                 drep : Win32.ULONG) is      --  rpcndr.h:587
   begin
      pc := NDRSContextUnmarshall (p, drep);
   end NdrUnMarshSCtxtHdl;

   procedure NdrMarshSCtxtHdl (pc : NDR_SCONTEXT;
                               p : Win32.PVOID;
                               rd : NDR_RUNDOWN) is          --  rpcndr.h:590
   begin
      NDRSContextMarshall (pc, p, rd);
   end NdrMarshSCtxtHdl;


   function NdrFcShort (s : Win32.USHORT) return Win32.UCHAR is
      --  rpcndr.h:595
      function "/"(l, r : Interfaces.C.unsigned_short)
                  return Interfaces.C.unsigned_short
        renames Interfaces.C."/";
      function "**"(l : Interfaces.C.unsigned_short;
                    r : Natural)
                   return Interfaces.C.unsigned_short
        renames Interfaces.C."**";
   begin
      return  Win32.UCHAR (s / 2 ** 8);
   end NdrFcShort;

   --  not in Microsoft OpenTools
   --  function NdrClientCall(
   --  pStubDescriptor: PMIDL_STUB_DESC;
   --  pFormat        : PFORMAT_STRING;
   --  Args           : Stdarg.ArgList := Stdarg.Empty)
   --  return CLIENT_CALL_RETURN is                 -- rpcndr.h:1812
   --
   --  function "&" is new Stdarg.Concat(PMIDL_STUB_DESC);
   --  function "&" is new Stdarg.Concat(PFORMAT_STRING);
   --
   --  use Stdarg, Stdarg.Impl;
   --
   --  Complete_Args: Stdarg.Arglist :=
   --  Stdarg.Empty & pStubDescriptor & pFormat & Args;
   --
   --  procedure C_NdrClientCall;
   --  pragma Import(Stdcall, C_NdrClientCall, "NdrClientCall");
   --
   --  function To_CLIENT_CALL_RETURN is new Ada.Unchecked_Conversion (
   --  Stdarg.C_Param, CLIENT_CALL_RETURN);
   --
   --  begin
   --  return To_CLIENT_CALL_RETURN(F_Varargs(
   --  C_NdrClientCall'Address,
   --  ArgCount(Complete_Args),
   --  Address_of_First_Arg(Complete_Args)));
   --
   --  end NdrClientCall;

end Win32.Rpcndr;


