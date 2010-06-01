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

package Win32.Msviddrv is

   INC_MSVIDDRV                 : constant := 50;
   DVM_START                    : constant := 16#4000#;
   DVM_GETERRORTEXT             : constant := 16#4000#;
   DVM_GETVIDEOAPIVER           : constant := 16#4001#;
   VIDEOAPIVERSION              : constant := 3;
   DVM_DIALOG                   : constant := 16#4064#;
   DVM_CONFIGURESTORAGE         : constant := 16#4065#;
   DVM_GET_CHANNEL_CAPS         : constant := 16#4066#;
   DVM_UPDATE                   : constant := 16#4067#;
   DVM_FRAME                    : constant := 16#40c8#;
   DVM_STREAM_MSG_START         : constant := 16#412c#;
   DVM_STREAM_MSG_END           : constant := 16#418f#;
   DVM_STREAM_ADDBUFFER         : constant := 16#412c#;
   DVM_STREAM_FINI              : constant := 16#412d#;
   DVM_STREAM_GETERROR          : constant := 16#412e#;
   DVM_STREAM_GETPOSITION       : constant := 16#412f#;
   DVM_STREAM_INIT              : constant := 16#4130#;
   DVM_STREAM_PREPAREHEADER     : constant := 16#4131#;
   DVM_STREAM_RESET             : constant := 16#4132#;
   DVM_STREAM_START             : constant := 16#4133#;
   DVM_STREAM_STOP              : constant := 16#4134#;
   DVM_STREAM_UNPREPAREHEADER   : constant := 16#4135#;
   DVM_STREAM_ALLOCHDRANDBUFFER : constant := 16#4136#;
   DVM_STREAM_FREEHDRANDBUFFER  : constant := 16#4137#;

   OPEN_TYPE_VCAP : constant Win32.Mmsystem.FOURCC :=
      Win32.Mmsystem.mmioFOURCC ('v', 'c', 'a', 'p');

   type VIDEO_OPEN_PARMS;
   type VIDEO_GETERRORTEXT_PARMS;
   type VIDEO_STREAM_INIT_PARMS;
   type VIDEOCONFIGPARMS;

   type LPVIDEO_OPEN_PARMS is access all VIDEO_OPEN_PARMS;
   type LPVIDEO_GETERRORTEXT_PARMS is access all VIDEO_GETERRORTEXT_PARMS;
   type LPVIDEO_STREAM_INIT_PARMS is access all VIDEO_STREAM_INIT_PARMS;
   type LPVIDEOCONFIGPARMS is access all VIDEOCONFIGPARMS;

   type VIDEO_OPEN_PARMS is record
      dwSize    : Win32.DWORD;
      fccType   : Win32.Mmsystem.FOURCC;
      fccComp   : Win32.Mmsystem.FOURCC;
      DwVersion : Win32.DWORD;
      dwFlags   : Win32.DWORD;
      dwError   : Win32.DWORD;
   end record;

   type VIDEO_GETERRORTEXT_PARMS is record
      dwError  : Win32.DWORD;
      lpText   : Win32.LPWSTR;
      DwLength : Win32.DWORD;
   end record;

   type VIDEO_STREAM_INIT_PARMS is record
      dwMicroSecPerFrame : Win32.DWORD;
      dwCallback         : Win32.DWORD;
      dwCallbackInst     : Win32.DWORD;
      dwFlags            : Win32.DWORD;
      hVideo             : Win32.DWORD;
   end record;

   type VIDEOCONFIGPARMS is record
      lpdwReturn : Win32.LPDWORD;
      lpData1    : Win32.LPVOID;
      dwSize1    : Win32.DWORD;
      lpData2    : Win32.LPVOID;
      dwSize2    : Win32.DWORD;
   end record;

private

   pragma Convention (C, VIDEO_OPEN_PARMS);
   pragma Convention (C_Pass_By_Copy, VIDEO_GETERRORTEXT_PARMS);
   pragma Convention (C, VIDEO_STREAM_INIT_PARMS);
   pragma Convention (C, VIDEOCONFIGPARMS);

end Win32.Msviddrv;
