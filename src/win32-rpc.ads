--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-rpc.ads, v $
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

with Win32.Winnt;

package Win32.Rpc is

   type RPC_STATUS is new Win32.LONG;                      --  rpc.h :36

   subtype I_RPC_HANDLE is Win32.Winnt.HANDLE;            --  rpc.h :35

   type RPC_BINDING_HANDLE is new I_RPC_HANDLE;            --  rpcdce.h :36

   --  The C macros RpcEndExcept, RpcEndFinally, RpcExcept, RpcExceptionCode,
   --  RpcFinally, RpcTryExcept, RpcTryFinally, RpcAbnormalTermination, and
   --  RpcExceptionCode have no direct Ada equivalent.
   --  Instead use normal Ada exception handling.

   function RpcImpersonateClient
     (BindingHandle : RPC_BINDING_HANDLE)
     return RPC_STATUS;                           --  rpc.h :103

   function RpcRevertToSelf return RPC_STATUS;             --  rpc.h :108

   function I_RpcMapWin32Status
     (Status : RPC_STATUS)
     return Win32.LONG;                           --  rpc.h :112

private

   pragma Import (Stdcall, RpcImpersonateClient, "RpcImpersonateClient");
   --  rpc.h :103
   pragma Import (Stdcall, RpcRevertToSelf, "RpcRevertToSelf");  --  rpc.h :108
   pragma Import (Stdcall, I_RpcMapWin32Status, "I_RpcMapWin32Status");
   --  rpc.h :112

end Win32.Rpc;


