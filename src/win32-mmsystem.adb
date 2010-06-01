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

with Ada.Unchecked_Conversion;
with Win32.Utils;
with Interfaces.C;

package body Win32.Mmsystem is

   function To_BYTE is new Ada.Unchecked_Conversion (Win32.CHAR, Win32.BYTE);

   function sndAlias
     (ch0  : Win32.CHAR;
      ch1  : Win32.CHAR)
      return Win32.DWORD
   is
      use type Interfaces.C.unsigned_long;
   begin
      return Win32.DWORD ((Win32.Utils.MAKELONG
                              (Win32.Utils.MAKEWORD (To_BYTE (ch0), 0),
                               0) +
                           SND_ALIAS_START) or
                          Win32.Utils.MAKELONG
                             (Win32.Utils.MAKEWORD (0, To_BYTE (ch1)),
                              0));
   end sndAlias;

   function mmioFOURCC
     (ch0  : Win32.CHAR;
      ch1  : Win32.CHAR;
      ch2  : Win32.CHAR;
      ch3  : Win32.CHAR)
      return FOURCC
   is
   begin
      return FOURCC (Win32.Utils.MAKELONG
                        (Win32.Utils.MAKEWORD (To_BYTE (ch0), To_BYTE (ch1)),
                         Win32.Utils.MAKEWORD (To_BYTE (ch2), To_BYTE (ch3))));
   end mmioFOURCC;

   function MCI_MSF_MINUTE (dwMSF : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.LOBYTE (Win32.Utils.LOWORD (dwMSF));
   end MCI_MSF_MINUTE;

   function MCI_MSF_SECOND (dwMSF : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.HIBYTE (Win32.Utils.LOWORD (dwMSF));
   end MCI_MSF_SECOND;

   function MCI_MSF_FRAME (dwMSF : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.LOBYTE (Win32.Utils.HIWORD (dwMSF));
   end MCI_MSF_FRAME;

   function MCI_MAKE_MSF
     (minutes : Win32.BYTE;
      seconds : Win32.BYTE;
      frames  : Win32.BYTE)
      return Win32.DWORD
   is
   begin
      return Win32.Utils.MAKELONG
               (Win32.Utils.MAKEWORD (minutes, seconds),
                Win32.Utils.MAKEWORD (frames, 0));
   end MCI_MAKE_MSF;

   function MCI_TMSF_TRACK (dwTMSF : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.BYTE (dwTMSF);
   end MCI_TMSF_TRACK;

   function MCI_TMSF_MINUTE (dwTMSF : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.HIBYTE (Win32.Utils.LOWORD (dwTMSF));
   end MCI_TMSF_MINUTE;

   function MCI_TMSF_SECOND (dwTMSF : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.LOBYTE (Win32.Utils.HIWORD (dwTMSF));
   end MCI_TMSF_SECOND;

   function MCI_TMSF_FRAME (dwTMSF : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.HIBYTE (Win32.Utils.HIWORD (dwTMSF));
   end MCI_TMSF_FRAME;

   function MCI_MAKE_TMSF
     (tracks  : Win32.BYTE;
      minutes : Win32.BYTE;
      seconds : Win32.BYTE;
      frames  : Win32.BYTE)
      return Win32.DWORD
   is
   begin
      return Win32.Utils.MAKELONG
               (Win32.Utils.MAKEWORD (tracks, minutes),
                Win32.Utils.MAKEWORD (seconds, frames));
   end MCI_MAKE_TMSF;

   function MCI_HMS_HOUR (dwHMS : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.BYTE (dwHMS);
   end MCI_HMS_HOUR;

   function MCI_HMS_MINUTE (dwHMS : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.HIBYTE (Win32.Utils.LOWORD (dwHMS));
   end MCI_HMS_MINUTE;

   function MCI_HMS_SECOND (dwHMS : Win32.DWORD) return Win32.BYTE is
   begin
      return Win32.Utils.LOBYTE (Win32.Utils.HIWORD (dwHMS));
   end MCI_HMS_SECOND;

   function MCI_MAKE_HMS
     (hours   : Win32.BYTE;
      minutes : Win32.BYTE;
      seconds : Win32.BYTE)
      return Win32.DWORD
   is
   begin
      return Win32.Utils.MAKELONG
               (Win32.Utils.MAKEWORD (hours, minutes),
                Win32.Utils.MAKEWORD (seconds, 0));
   end MCI_MAKE_HMS;

   function DIBINDEX (n : Win32.WORD) return Win32.DWORD is
   begin
      return Win32.Utils.MAKELONG (n, 16#10ff#);
   end DIBINDEX;

end Win32.Mmsystem;
