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

with Win32.crt.Types;

package Win32.crt.Timeb is

   type timeb is                                           --  timeb.h:52
      record
         time     : Win32.crt.Types.time_t; --  timeb.h :53
         millitm  : Win32.USHORT;           --  timeb.h :54
         timezone : Win32.SHORT;            --  timeb.h :55
         dstflag  : Win32.SHORT;            --  timeb.h :56
      end record;

   procedure ftime (result : out timeb);                     --  timeb.h:70

private

   pragma Convention (C_Pass_By_Copy, timeb);                    --  timeb.h:52

   pragma Import (C, ftime, "_ftime");                      --  timeb.h:70

end Win32.crt.Timeb;
