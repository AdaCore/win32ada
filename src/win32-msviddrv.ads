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

package Win32.Msviddrv is

   INC_MSVIDDRV                 : constant := 50;          -- msviddrv.h:12
   DVM_START                    : constant := 16#4000#;    -- msviddrv.h:25
   DVM_GETERRORTEXT             : constant := 16#4000#;    -- msviddrv.h:26
   DVM_GETVIDEOAPIVER           : constant := 16#4001#;    -- msviddrv.h:27
   VIDEOAPIVERSION              : constant := 3;           -- msviddrv.h:31
   DVM_DIALOG                   : constant := 16#4064#;    -- msviddrv.h:34
   DVM_CONFIGURESTORAGE         : constant := 16#4065#;    -- msviddrv.h:35
   DVM_GET_CHANNEL_CAPS         : constant := 16#4066#;    -- msviddrv.h:36
   DVM_UPDATE                   : constant := 16#4067#;    -- msviddrv.h:37
   DVM_FRAME                    : constant := 16#40c8#;    -- msviddrv.h:40
   DVM_STREAM_MSG_START         : constant := 16#412c#;    -- msviddrv.h:43
   DVM_STREAM_MSG_END           : constant := 16#418f#;    -- msviddrv.h:44
   DVM_STREAM_ADDBUFFER         : constant := 16#412c#;    -- msviddrv.h:46
   DVM_STREAM_FINI              : constant := 16#412d#;    -- msviddrv.h:47
   DVM_STREAM_GETERROR          : constant := 16#412e#;    -- msviddrv.h:48
   DVM_STREAM_GETPOSITION       : constant := 16#412f#;    -- msviddrv.h:49
   DVM_STREAM_INIT              : constant := 16#4130#;    -- msviddrv.h:50
   DVM_STREAM_PREPAREHEADER     : constant := 16#4131#;    -- msviddrv.h:51
   DVM_STREAM_RESET             : constant := 16#4132#;    -- msviddrv.h:52
   DVM_STREAM_START             : constant := 16#4133#;    -- msviddrv.h:53
   DVM_STREAM_STOP              : constant := 16#4134#;    -- msviddrv.h:54
   DVM_STREAM_UNPREPAREHEADER   : constant := 16#4135#;    -- msviddrv.h:55
   DVM_STREAM_ALLOCHDRANDBUFFER : constant := 16#4136#;    -- msviddrv.h:58
   DVM_STREAM_FREEHDRANDBUFFER  : constant := 16#4137#;    -- msviddrv.h:59

   OPEN_TYPE_VCAP : constant Win32.Mmsystem.FOURCC :=
     Win32.Mmsystem.mmioFOURCC ('v', 'c', 'a', 'p'); -- msviddrv.h:69

   type VIDEO_OPEN_PARMS;                                  -- msviddrv.h:75
   type VIDEO_GETERRORTEXT_PARMS;                          -- msviddrv.h:84
   type VIDEO_STREAM_INIT_PARMS;                           -- msviddrv.h:94
   type VIDEOCONFIGPARMS;                                  -- msviddrv.h:102

   type LPVIDEO_OPEN_PARMS is access all VIDEO_OPEN_PARMS; -- msviddrv.h:82
   type LPVIDEO_GETERRORTEXT_PARMS is access all VIDEO_GETERRORTEXT_PARMS;
   --  msviddrv.h:92
   type LPVIDEO_STREAM_INIT_PARMS is access all VIDEO_STREAM_INIT_PARMS;
   --  msviddrv.h:100
   type LPVIDEOCONFIGPARMS is access all VIDEOCONFIGPARMS; -- msviddrv.h:108

   type VIDEO_OPEN_PARMS is                                -- msviddrv.h:75
      record
         dwSize    : Win32.DWORD;           -- msviddrv.h:76
         fccType   : Win32.Mmsystem.FOURCC; -- msviddrv.h:77
         fccComp   : Win32.Mmsystem.FOURCC; -- msviddrv.h:78
         DwVersion : Win32.DWORD;           -- msviddrv.h:79
         dwFlags   : Win32.DWORD;           -- msviddrv.h:80
         dwError   : Win32.DWORD;           -- msviddrv.h:81
      end record;

   type VIDEO_GETERRORTEXT_PARMS is                        -- msviddrv.h:84
      record
         dwError  : Win32.DWORD;  -- msviddrv.h:85
         lpText   : Win32.LPWSTR; -- msviddrv.h:87
         DwLength : Win32.DWORD;  -- msviddrv.h:91
      end record;

   type VIDEO_STREAM_INIT_PARMS is                         -- msviddrv.h:94
      record
         dwMicroSecPerFrame : Win32.DWORD; -- msviddrv.h:95
         dwCallback         : Win32.DWORD; -- msviddrv.h:96
         dwCallbackInst     : Win32.DWORD; -- msviddrv.h:97
         dwFlags            : Win32.DWORD; -- msviddrv.h:98
         hVideo             : Win32.DWORD; -- msviddrv.h:99
      end record;

   type VIDEOCONFIGPARMS is                                -- msviddrv.h:102
      record
         lpdwReturn : Win32.LPDWORD; -- msviddrv.h:103
         lpData1    : Win32.LPVOID;  -- msviddrv.h:104
         dwSize1    : Win32.DWORD;   -- msviddrv.h:105
         lpData2    : Win32.LPVOID;  -- msviddrv.h:106
         dwSize2    : Win32.DWORD;   -- msviddrv.h:107
      end record;

private

   pragma Convention (C, VIDEO_OPEN_PARMS);                 -- msviddrv.h:75
   pragma Convention (C_Pass_By_Copy, VIDEO_GETERRORTEXT_PARMS);
   --  msviddrv.h:84
   pragma Convention (C, VIDEO_STREAM_INIT_PARMS);          -- msviddrv.h:94
   pragma Convention (C, VIDEOCONFIGPARMS);                 -- msviddrv.h:102

end Win32.Msviddrv;
