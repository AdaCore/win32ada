-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Rpc;
with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Rpcnsi;

package Win32.Rpcnsip is


    type RPC_IMPORT_CONTEXT_P;                              -- rpcnsip.h:29

    type PRPC_IMPORT_CONTEXT_P is access all RPC_IMPORT_CONTEXT_P;
                                                            -- rpcnsip.h:29

    type RPC_IMPORT_CONTEXT_P is                            -- rpcnsip.h:29
        record
            LookupContext : Win32.Rpcnsi.RPC_NS_HANDLE;     -- rpcnsip.h:25
            ProposedHandle: Win32.Rpcdce.RPC_BINDING_HANDLE;-- rpcnsip.h:26
            Bindings      : Win32.Rpcdce.a_RPC_BINDING_VECTOR_t;
                                                            -- rpcnsip.h:27
        end record;

    function I_RpcNsGetBuffer(
                Message: Win32.Rpcdcep.PRPC_MESSAGE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsip.h:35

    function I_RpcNsSendReceive(
                Message: Win32.Rpcdcep.PRPC_MESSAGE;
                Handle : access Win32.Rpcdce.RPC_BINDING_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsip.h:40

    procedure I_RpcNsRaiseException(
                Message: Win32.Rpcdcep.PRPC_MESSAGE;
                Status : Win32.Rpc.RPC_STATUS);             -- rpcnsip.h:46

    function I_RpcReBindBuffer(
                Message: Win32.Rpcdcep.PRPC_MESSAGE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsip.h:52

    function I_NsServerBindSearch return Win32.Rpc.RPC_STATUS;
                                                            -- rpcnsip.h:57

    function I_NsClientBindSearch return Win32.Rpc.RPC_STATUS;
                                                            -- rpcnsip.h:61

    procedure I_NsClientBindDone;                           -- rpcnsip.h:65

private

    pragma Convention(C_Pass_By_Copy, RPC_IMPORT_CONTEXT_P);             -- rpcnsip.h:29

    pragma Import(Stdcall, I_RpcNsGetBuffer, "I_RpcNsGetBuffer"); -- rpcnsip.h:35
    pragma Import(Stdcall, I_RpcNsSendReceive, "I_RpcNsSendReceive");
                                                            -- rpcnsip.h:40
    pragma Import(Stdcall, I_RpcNsRaiseException, "I_RpcNsRaiseException");
                                                            -- rpcnsip.h:46
    pragma Import(Stdcall, I_RpcReBindBuffer, "I_RpcReBindBuffer");
                                                            -- rpcnsip.h:52
    pragma Import(Stdcall, I_NsServerBindSearch, "I_NsServerBindSearch");
                                                            -- rpcnsip.h:57
    pragma Import(Stdcall, I_NsClientBindSearch, "I_NsClientBindSearch");
                                                            -- rpcnsip.h:61
    pragma Import(Stdcall, I_NsClientBindDone, "I_NsClientBindDone");
                                                            -- rpcnsip.h:65

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Rpcnsip;
