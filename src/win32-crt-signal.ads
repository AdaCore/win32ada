-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Ada.Unchecked_Conversion;

package Win32.crt.Signal is

    NSIG     : constant := 23;                              -- signal.h:49
    SIGINT   : constant := 2;                               -- signal.h:53
    SIGILL   : constant := 4;                               -- signal.h:54
    SIGFPE   : constant := 8;                               -- signal.h:55
    SIGSEGV  : constant := 11;                              -- signal.h:56
    SIGTERM  : constant := 15;                              -- signal.h:57
    SIGBREAK : constant := 21;                              -- signal.h:58
    SIGABRT  : constant := 22;                              -- signal.h:59

    type Handler is access procedure (
        sig    : in Win32.INT;
        subcode: in Win32.INT := 0);
    pragma Convention(Stdcall, Handler);

    SIG_DFL: constant Handler;                              -- signal.h:64
    SIG_IGN: constant Handler;                              -- signal.h:65
    SIG_SGE: constant Handler;                              -- signal.h:66
    SIG_ACK: constant Handler;                              -- signal.h:67
    SIG_ERR: constant Handler;                              -- signal.h:72

    type sig_atomic_t is new Win32.INT;                     -- signal.h:45

    -- function pxcptinfoptrs return Win32.PVOID;           -- signal.h:77
    -- not in Microsoft OpenTools, see win32-extras.ads

    function signal(sig : Win32.INT;
                    func: Handler)
                        return Handler;                     -- signal.h:85

    function c_raise(sig: Win32.INT) return Win32.INT;      -- signal.h:86

private

    function To_Handler is new Ada.Unchecked_Conversion(Win32.DWORD, Handler);

    SIG_DFL: constant Handler := To_Handler(0);             -- signal.h:64
    SIG_IGN: constant Handler := To_Handler(1);             -- signal.h:65
    SIG_SGE: constant Handler := To_Handler(3);             -- signal.h:66
    SIG_ACK: constant Handler := To_Handler(4);             -- signal.h:67
    SIG_ERR: constant Handler := To_Handler(Win32.DWORD'Last); -- signal.h:72

    -- pragma Inline(pxcptinfoptrs);

    pragma Import(C, signal, "signal");                     -- signal.h:85
    pragma Import(C, c_raise, "raise");                     -- signal.h:86

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

end Win32.crt.Signal;
