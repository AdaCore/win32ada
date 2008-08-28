--  $Source$
--  $Revision$ $Date$ $Author$
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

package Win32.Rpcnterr is

   RPC_S_OK                    : constant := 0;    --  rpcnterr.h:16
   RPC_S_INVALID_ARG           : constant := 87;   --  rpcnterr.h:17
   RPC_S_OUT_OF_MEMORY         : constant := 14;   --  rpcnterr.h:18
   RPC_S_OUT_OF_THREADS        : constant := 164;  --  rpcnterr.h:19
   RPC_S_INVALID_LEVEL         : constant := 87;   --  rpcnterr.h:20
   RPC_S_BUFFER_TOO_SMALL      : constant := 122;  --  rpcnterr.h:21
   RPC_S_INVALID_SECURITY_DESC : constant := 1338; --  rpcnterr.h:22
   RPC_S_ACCESS_DENIED         : constant := 5;    --  rpcnterr.h:23
   RPC_S_SERVER_OUT_OF_MEMORY  : constant := 1130; --  rpcnterr.h:24
   RPC_X_NO_MEMORY             : constant := 14;   --  rpcnterr.h:26
   RPC_X_INVALID_BOUND         : constant := 1734; --  rpcnterr.h:27
   RPC_X_INVALID_TAG           : constant := 1733; --  rpcnterr.h:28
   RPC_X_ENUM_VALUE_TOO_LARGE  : constant := 1781; --  rpcnterr.h:29
   RPC_X_SS_CONTEXT_MISMATCH   : constant := 6;    --  rpcnterr.h:30
   RPC_X_INVALID_BUFFER        : constant := 1784; --  rpcnterr.h:31

end Win32.Rpcnterr;
