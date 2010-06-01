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

package Win32.Rpcnterr is

   RPC_S_OK                    : constant := 0;
   RPC_S_INVALID_ARG           : constant := 87;
   RPC_S_OUT_OF_MEMORY         : constant := 14;
   RPC_S_OUT_OF_THREADS        : constant := 164;
   RPC_S_INVALID_LEVEL         : constant := 87;
   RPC_S_BUFFER_TOO_SMALL      : constant := 122;
   RPC_S_INVALID_SECURITY_DESC : constant := 1338;
   RPC_S_ACCESS_DENIED         : constant := 5;
   RPC_S_SERVER_OUT_OF_MEMORY  : constant := 1130;
   RPC_X_NO_MEMORY             : constant := 14;
   RPC_X_INVALID_BOUND         : constant := 1734;
   RPC_X_INVALID_TAG           : constant := 1733;
   RPC_X_ENUM_VALUE_TOO_LARGE  : constant := 1781;
   RPC_X_SS_CONTEXT_MISMATCH   : constant := 6;
   RPC_X_INVALID_BUFFER        : constant := 1784;

end Win32.Rpcnterr;
