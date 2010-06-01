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
with Win32.Rpcnsi;

package Win32.Rpcnsip is

   type RPC_IMPORT_CONTEXT_P;

   type PRPC_IMPORT_CONTEXT_P is access all RPC_IMPORT_CONTEXT_P;

   type RPC_IMPORT_CONTEXT_P is record
      LookupContext  : Win32.Rpcnsi.RPC_NS_HANDLE;
      ProposedHandle : Win32.Rpcdce.RPC_BINDING_HANDLE;
      Bindings       : Win32.Rpcdce.a_RPC_BINDING_VECTOR_t;
   end record;

   function I_RpcNsGetBuffer
     (Message : Win32.Rpcdcep.PRPC_MESSAGE)
      return Win32.Rpc.RPC_STATUS;

   function I_RpcNsSendReceive
     (Message : Win32.Rpcdcep.PRPC_MESSAGE;
      Handle  : access Win32.Rpcdce.RPC_BINDING_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   procedure I_RpcNsRaiseException
     (Message : Win32.Rpcdcep.PRPC_MESSAGE;
      Status  : Win32.Rpc.RPC_STATUS);

   function I_RpcReBindBuffer
     (Message : Win32.Rpcdcep.PRPC_MESSAGE)
      return Win32.Rpc.RPC_STATUS;

   function I_NsServerBindSearch return Win32.Rpc.RPC_STATUS;

   function I_NsClientBindSearch return Win32.Rpc.RPC_STATUS;

   procedure I_NsClientBindDone;

private

   pragma Convention (C_Pass_By_Copy, RPC_IMPORT_CONTEXT_P);

   pragma Import (Stdcall, I_RpcNsGetBuffer, "I_RpcNsGetBuffer");
   pragma Import (Stdcall, I_RpcNsSendReceive, "I_RpcNsSendReceive");
   pragma Import (Stdcall, I_RpcNsRaiseException, "I_RpcNsRaiseException");
   pragma Import (Stdcall, I_RpcReBindBuffer, "I_RpcReBindBuffer");
   pragma Import (Stdcall, I_NsServerBindSearch, "I_NsServerBindSearch");
   pragma Import (Stdcall, I_NsClientBindSearch, "I_NsClientBindSearch");
   pragma Import (Stdcall, I_NsClientBindDone, "I_NsClientBindDone");

end Win32.Rpcnsip;
