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

with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;

package body Win32.Rpcndr is

   use Interfaces;
   use type Interfaces.C.ptrdiff_t;

   function NDRSContextValue
     (hContext : access NDR_SCONTEXT)
      return System.Address
   is
   begin
      return hContext.all.userContext'Address;
   end NDRSContextValue;

   su : constant Integer     := System.Storage_Unit;
   bp : constant C.ptrdiff_t := System.Address'Size / C.ptrdiff_t (su);

   generic
      type Pointer is private;
   package P_Arith is
      procedure Increment (P : in out Pointer; Val : C.ptrdiff_t := 1);
      function "+" (P : Pointer; Val : C.ptrdiff_t) return Pointer;
      function Incr_Void
        (P    : Pointer;
         Val  : C.ptrdiff_t)
         return Win32.PVOID;
   end P_Arith;

   package body P_Arith is

      function To_Int is new Ada.Unchecked_Conversion (Pointer, LONG_PTR);
      function To_Ptr is new Ada.Unchecked_Conversion (LONG_PTR, Pointer);

      procedure Increment (P : in out Pointer; Val : C.ptrdiff_t := 1) is
      begin
         P := To_Ptr (To_Int (P) + LONG_PTR (Val));
      end Increment;

      function "+" (P : Pointer; Val : C.ptrdiff_t) return Pointer is
      begin
         return To_Ptr (To_Int (P) + LONG_PTR (Val));
      end "+";

      function Incr_Void
        (P    : Pointer;
         Val  : C.ptrdiff_t)
         return Win32.PVOID
      is
         function To_PVOID is new Ada.Unchecked_Conversion (
            Pointer,
            Win32.PVOID);
      begin
         return To_PVOID (Pointer'(P + Val));
      end Incr_Void;

   end P_Arith;

   function To_Pint is new Ada.Unchecked_Conversion (Win32.PVOID, LONG_PTR);
   function To_PVOID is new Ada.Unchecked_Conversion (LONG_PTR, Win32.PVOID);

   package P_Void is new P_Arith (Win32.PVOID);
   use P_Void;
   package P_Byte is new P_Arith (Win32.PBYTE);
   use P_Byte;
   package P_Bool is new P_Arith (Win32.PBOOL);
   use P_Bool;
   package P_Small is new P_Arith (psmall);
   use P_Small;
   package P_RPCB is new P_Arith (RPC_BUFPTR);
   use P_RPCB;

   procedure byte_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out Win32.PBYTE)
   is
   begin
      target := To_PBYTE (source.Buffer);
      P_Void.Increment (source.all.Buffer, bp);
   end byte_from_ndr;

   function "-" (l, r : Interfaces.C.unsigned) return Interfaces.C.unsigned
      renames Interfaces.C."-";

   procedure byte_array_from_ndr
     (Source     : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target     : Win32.PBYTE)
   is

   begin
      NDRcopy
        (P_Byte.Incr_Void (Target, C.ptrdiff_t (LowerIndex)),
         Source.all.Buffer,
         UpperIndex - LowerIndex);
      P_Void.Increment
        (Source.all.Buffer,
         C.ptrdiff_t (UpperIndex - LowerIndex) * bp);
   end byte_array_from_ndr;

   procedure boolean_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out Win32.PBOOL)
   is
   begin
      target := To_PBOOL (source.all.Buffer);
      P_Void.Increment (source.all.Buffer, bp);
   end boolean_from_ndr;

   procedure boolean_array_from_ndr
     (Source     : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target     : Win32.PBOOL)
   is
   begin
      NDRcopy
        (P_Bool.Incr_Void (Target, C.ptrdiff_t (LowerIndex)),
         Source.all.Buffer,
         UpperIndex - LowerIndex);
      P_Void.Increment
        (Source.all.Buffer,
         C.ptrdiff_t (UpperIndex - LowerIndex) * bp);
   end boolean_array_from_ndr;

   procedure small_from_ndr
     (source : Win32.Rpcdcep.PRPC_MESSAGE;
      target : out psmall)
   is
   begin
      target := To_Psmall (source.all.Buffer);
      P_Void.Increment (source.all.Buffer, +bp);
   end small_from_ndr;

   procedure small_array_from_ndr
     (Source     : Win32.Rpcdcep.PRPC_MESSAGE;
      LowerIndex : Win32.UINT;
      UpperIndex : Win32.UINT;
      Target     : out psmall)
   is
      pragma Unmodified (Target);
   begin
      NDRcopy
        (P_Small.Incr_Void (Target, C.ptrdiff_t (LowerIndex)),
         Source.all.Buffer,
         UpperIndex - LowerIndex);

      P_Void.Increment
        (Source.all.Buffer,
         C.ptrdiff_t (UpperIndex - LowerIndex) * bp);
   end small_array_from_ndr;

   function "*"
     (l, r : Interfaces.C.unsigned_long)
      return Interfaces.C.unsigned_long renames Interfaces.C."*";

   procedure midl_fa2 (p : in out RPC_BUFPTR) is
   begin
      p :=
        To_BUFPTR
          ((To_ULONG (P) + ULONG_PTR (Win32.ULONG'Size / Su))
           and 16#fffffffe#);
   end midl_fa2;

   procedure midl_fa4 (p : in out RPC_BUFPTR) is
   begin
      p :=
        To_BUFPTR
          ((To_ULONG (P) + 3 * ULONG_PTR (Win32.ULONG'Size / Su))
           and 16#fffffffc#);
   end midl_fa4;

   procedure midl_fa8 (p : in out RPC_BUFPTR) is
   begin
      p :=
        To_BUFPTR
          ((To_ULONG (P) + 7 * ULONG_PTR (Win32.ULONG'Size / Su))
           and 16#fffffff8#);
   end midl_fa8;

   procedure midl_addp (p : in out Win32.PVOID; n : Win32.ULONG) is
   begin
      P_Void.Increment
        (p,
         C.ptrdiff_t (n * Win32.ULONG (Win32.ULONG'Size / su)));
   end midl_addp;

   procedure midl_unmarsh_up (p : in out Win32.PVOID) is
   begin
      P_Void.Increment (p, C.ptrdiff_t (Win32.ULONG'Size / su));
   end midl_unmarsh_up;

   function midl_ma4_ulong (p : Win32.PVOID) return Win32.PVOID;
   function midl_ma4_ulong (p : Win32.PVOID) return Win32.PVOID is
   begin
      return Win32.PVOID'(P_Void."+"
                             (p,
                              C.ptrdiff_t (Win32.ULONG'Size / su)));
   end midl_ma4_ulong;

   procedure NdrMarshConfStringHdr
     (p : in out Win32.PVOID;
      s : Win32.PUCHAR;
      l : Win32.ULONG)
   is
      function PUCHAR_To_PVOID is new Ada.Unchecked_Conversion (
         Win32.PUCHAR,
         Win32.PVOID);
      function Int_To_PVOID is new Ada.Unchecked_Conversion (
         LONG_PTR,
         Win32.PVOID);
   begin
      p := midl_ma4_ulong (p);
      p := PUCHAR_To_PVOID (s);
      p := midl_ma4_ulong (p);
      p := Int_To_PVOID (0);
      p := midl_ma4_ulong (p);
      p := To_PVOID (LONG_PTR (l));
   end NdrMarshConfStringHdr;

   procedure NdrUnMarshConfStringHdr
     (p : in out Win32.PVOID;
      s : out Win32.PUCHAR;
      l : out Win32.ULONG)
   is
   begin
      s := To_PUCHAR (midl_ma4_ulong (p));
      midl_addp (p, 4);
      l := Win32.ULONG (Rpcndr.To_Pint (midl_ma4_ulong (p)));
   end NdrUnMarshConfStringHdr;

   function NdrMarshCCtxtHdl
     (pc   : NDR_CCONTEXT;
      p    : Win32.PVOID)
      return Win32.ULONG
   is
   begin
      NDRCContextMarshall (pc, p);
      return Win32.ULONG (Rpcndr.To_Pint (P_Void.Incr_Void (p, 20)));
   end NdrMarshCCtxtHdl;

   function NdrUnMarshCCtxtHdl
     (pc   : access NDR_CCONTEXT;
      p    : Win32.PVOID;
      h    : Win32.Rpcdce.RPC_BINDING_HANDLE;
      drep : Win32.ULONG)
      return Win32.ULONG
   is
   begin
      NDRCContextUnmarshall (pc, h, p, drep);
      return Win32.ULONG (Rpcndr.To_Pint (P_Void.Incr_Void (p, 20)));
   end NdrUnMarshCCtxtHdl;

   procedure NdrUnMarshSCtxtHdl
     (pc   : out NDR_SCONTEXT;
      p    : Win32.PVOID;
      drep : Win32.ULONG)
   is
   begin
      pc := NDRSContextUnmarshall (p, drep);
   end NdrUnMarshSCtxtHdl;

   procedure NdrMarshSCtxtHdl
     (pc : NDR_SCONTEXT;
      p  : Win32.PVOID;
      rd : NDR_RUNDOWN)
   is
   begin
      NDRSContextMarshall (pc, p, rd);
   end NdrMarshSCtxtHdl;

   function NdrFcShort (s : Win32.USHORT) return Win32.UCHAR is
      function "/"
        (l, r : Interfaces.C.unsigned_short)
         return Interfaces.C.unsigned_short renames Interfaces.C."/";
      function "**"
        (l    : Interfaces.C.unsigned_short;
         r    : Natural)
         return Interfaces.C.unsigned_short renames Interfaces.C."**";
   begin
      return Win32.UCHAR (s / 2 ** 8);
   end NdrFcShort;

end Win32.Rpcndr;
