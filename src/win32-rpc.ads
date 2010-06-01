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

with Win32.Winnt;

package Win32.Rpc is

   type RPC_STATUS is new Win32.LONG;

   subtype I_RPC_HANDLE is Win32.Winnt.HANDLE;

   type RPC_BINDING_HANDLE is new I_RPC_HANDLE;

   function RpcImpersonateClient
     (BindingHandle : RPC_BINDING_HANDLE)
      return RPC_STATUS;

   function RpcRevertToSelf return RPC_STATUS;

   function I_RpcMapWin32Status (Status : RPC_STATUS) return Win32.LONG;

private

   pragma Import (Stdcall, RpcImpersonateClient, "RpcImpersonateClient");
   pragma Import (Stdcall, RpcRevertToSelf, "RpcRevertToSelf");
   pragma Import (Stdcall, I_RpcMapWin32Status, "I_RpcMapWin32Status");

end Win32.Rpc;
