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

with Win32.Mmsystem;
pragma Elaborate (Win32.Mmsystem);

package Win32.Mmsystem.Constants is


   SND_ALIAS_SYSTEMASTERISK : constant Win32.DWORD := sndAlias ('S', '*');
   --  mmsystem.h:369
   SND_ALIAS_SYSTEMQUESTION : constant Win32.DWORD := sndAlias ('S', '?');
   --  mmsystem.h:370
   SND_ALIAS_SYSTEMHAND : constant Win32.DWORD := sndAlias ('S', 'H');
   --  mmsystem.h:371
   SND_ALIAS_SYSTEMEXIT : constant Win32.DWORD := sndAlias ('S', 'E');
   --  mmsystem.h:372
   SND_ALIAS_SYSTEMSTART : constant Win32.DWORD := sndAlias ('S', 'S');
   --  mmsystem.h:373
   SND_ALIAS_SYSTEMWELCOME : constant Win32.DWORD := sndAlias ('S', 'W');
   --  mmsystem.h:374
   SND_ALIAS_SYSTEMEXCLAMATION : constant Win32.DWORD := sndAlias ('S', '!');
   --  mmsystem.h:375
   SND_ALIAS_SYSTEMDEFAULT : constant Win32.DWORD := sndAlias ('S', 'D');
   --  mmsystem.h:376



   FOURCC_RIFF : constant FOURCC := mmioFOURCC ('R', 'I', 'F', 'F');
   --  mmsystem.h:1926
   FOURCC_LIST : constant FOURCC := mmioFOURCC ('L', 'I', 'S', 'T');
   --  mmsystem.h:1927

   FOURCC_DOS : constant FOURCC := mmioFOURCC ('D', 'O', 'S', ' ');
   --  mmsystem.h:1930
   FOURCC_MEM : constant FOURCC := mmioFOURCC ('M', 'E', 'M', ' ');
   --  mmsystem.h:1931

end Win32.Mmsystem.Constants;


