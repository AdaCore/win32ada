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



package Win32.crt.Locking is



   LK_UNLCK  : constant := 0; --  locking.h :16

   LK_LOCK   : constant := 1; --  locking.h :17

   LK_NBLCK  : constant := 2; --  locking.h :18

   LK_RLCK   : constant := 3; --  locking.h :19

   LK_NBRLCK : constant := 4; --  locking.h :20



end Win32.crt.Locking;





