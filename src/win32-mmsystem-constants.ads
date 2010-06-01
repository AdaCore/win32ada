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

with Win32.Mmsystem;
pragma Elaborate (Win32.Mmsystem);

package Win32.Mmsystem.Constants is

   SND_ALIAS_SYSTEMASTERISK    : constant Win32.DWORD := sndAlias ('S', '*');
   SND_ALIAS_SYSTEMQUESTION    : constant Win32.DWORD := sndAlias ('S', '?');
   SND_ALIAS_SYSTEMHAND        : constant Win32.DWORD := sndAlias ('S', 'H');
   SND_ALIAS_SYSTEMEXIT        : constant Win32.DWORD := sndAlias ('S', 'E');
   SND_ALIAS_SYSTEMSTART       : constant Win32.DWORD := sndAlias ('S', 'S');
   SND_ALIAS_SYSTEMWELCOME     : constant Win32.DWORD := sndAlias ('S', 'W');
   SND_ALIAS_SYSTEMEXCLAMATION : constant Win32.DWORD := sndAlias ('S', '!');
   SND_ALIAS_SYSTEMDEFAULT     : constant Win32.DWORD := sndAlias ('S', 'D');

   FOURCC_RIFF : constant FOURCC := mmioFOURCC ('R', 'I', 'F', 'F');
   FOURCC_LIST : constant FOURCC := mmioFOURCC ('L', 'I', 'S', 'T');

   FOURCC_DOS : constant FOURCC := mmioFOURCC ('D', 'O', 'S', ' ');
   FOURCC_MEM : constant FOURCC := mmioFOURCC ('M', 'E', 'M', ' ');

end Win32.Mmsystem.Constants;
