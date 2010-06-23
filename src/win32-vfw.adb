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
with Interfaces.C;
with Stdarg.Impl;
with Stdarg.Inst;
with Win32.Utils;

package body Win32.Vfw is

   use type Interfaces.C.unsigned_char;

   function To_BYTE is new Ada.Unchecked_Conversion (Win32.CHAR, Win32.BYTE);

   function MKFOURCC
     (ch0  : Win32.CHAR;
      ch1  : Win32.CHAR;
      ch2  : Win32.CHAR;
      ch3  : Win32.CHAR)
      return Win32.Mmsystem.FOURCC
   is
   begin
      return Win32.Mmsystem.FOURCC (Win32.Utils.MAKELONG
                                       (Win32.Utils.MAKEWORD
                                           (To_BYTE (ch0),
                                            To_BYTE (ch1)),
                                        Win32.Utils.MAKEWORD
                                           (To_BYTE (ch2),
                                            To_BYTE (ch3))));
   end MKFOURCC;

   function aviTWOCC (ch0 : Win32.CHAR; ch1 : Win32.CHAR) return TWOCC is
   begin
      return TWOCC (Win32.Utils.MAKEWORD (To_BYTE (ch0), To_BYTE (ch1)));
   end aviTWOCC;

   function DrawDibUpdate
     (hdd  : HDRAWDIB;
      hdc  : Win32.Windef.HDC;
      x    : Win32.INT;
      y    : Win32.INT)
      return Win32.BOOL
   is
   begin
      return DrawDibDraw
               (hdd,
                hdc,
                x,
                y,
                0,
                0,
                null,
                System.Null_Address,
                0,
                0,
                0,
                0,
                DDF_UPDATE);
   end DrawDibUpdate;

   function FromHex (n : Win32.BYTE) return Win32.BYTE is
   begin
      if (n >= To_BYTE ('A')) then
         return (n + 10 - To_BYTE ('A'));
      else
         return (n - To_BYTE ('0'));
      end if;
   end FromHex;

   function StreamFromFOURCC
     (fcc  : Win32.Mmsystem.FOURCC)
      return Win32.WORD
   is
   begin
      return Win32.WORD ((FromHex
                             (Win32.Utils.LOBYTE
                                 (Win32.Utils.LOWORD (Win32.DWORD (fcc)))) *
                          16) +
                         FromHex
                            (Win32.Utils.HIBYTE
                                (Win32.Utils.LOWORD (Win32.DWORD (fcc)))));
   end StreamFromFOURCC;

   function TWOCCFromFOURCC (fcc : Win32.Mmsystem.FOURCC) return TWOCC is
   begin
      return TWOCC (Win32.Utils.HIWORD (Win32.DWORD (fcc)));
   end TWOCCFromFOURCC;

   function ToHex (n : Win32.BYTE) return Win32.BYTE is
   begin
      if (n > 9) then
         return (n - 10 + To_BYTE ('A'));
      else
         return (n + To_BYTE ('0'));
      end if;
   end ToHex;

   function MAKEAVICKID
     (tcc    : TWOCC;
      stream : Win32.WORD)
      return Win32.DWORD
   is
      use type Interfaces.C.unsigned_short;
   begin
      return Win32.DWORD (Win32.Utils.MAKELONG
                             (Win32.Utils.MAKEWORD
                                 (ToHex
                                     (Win32.Utils.HIBYTE (stream and 16#f0#)),
                                  ToHex
                                     (Win32.BYTE ((stream and 16#0f#) / 16))),
                              Win32.WORD (tcc)));
   end MAKEAVICKID;

   function AVIStreamSampleToSample
     (pavi1 : PAVISTREAM;
      pavi2 : PAVISTREAM;
      l     : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamTimeToSample (pavi1, AVIStreamSampleToTime (pavi2, l));
   end AVIStreamSampleToSample;

   use type Interfaces.C.long'Base;
   use type Interfaces.C.unsigned_long;

   function AVIStreamNextSample
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamFindSample
               (pavi,
                l + 1,
                Win32.LONG (Win32.ULONG (FIND_NEXT) or
                            Win32.ULONG (FIND_ANY)));
   end AVIStreamNextSample;

   function AVIStreamPrevSample
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamFindSample
               (pavi,
                l - 1,
                Win32.LONG (Win32.ULONG (FIND_PREV) or
                            Win32.ULONG (FIND_ANY)));
   end AVIStreamPrevSample;

   function AVIStreamNearestSample
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamFindSample
               (pavi,
                l,
                Win32.LONG (Win32.ULONG (FIND_PREV) or
                            Win32.ULONG (FIND_ANY)));
   end AVIStreamNearestSample;

   function AVIStreamNextKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamFindSample
               (pavi,
                l + 1,
                Win32.LONG (Win32.ULONG (FIND_NEXT) or
                            Win32.ULONG (FIND_KEY)));
   end AVIStreamNextKeyFrame;

   function AVIStreamPrevKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamFindSample
               (pavi,
                l - 1,
                Win32.LONG (Win32.ULONG (FIND_NEXT) or
                            Win32.ULONG (FIND_KEY)));
   end AVIStreamPrevKeyFrame;

   function AVIStreamNearestKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamFindSample
               (pavi,
                l,
                Win32.LONG (Win32.ULONG (FIND_NEXT) or
                            Win32.ULONG (FIND_KEY)));
   end AVIStreamNearestKeyFrame;

   function AVIStreamIsKeyFrame
     (pavi : PAVISTREAM;
      l    : Win32.LONG)
      return Win32.BOOL
   is
   begin
      if (AVIStreamNearestKeyFrame (pavi, l) = l) then
         return Win32.TRUE;
      else
         return Win32.FALSE;
      end if;
   end AVIStreamIsKeyFrame;

   function AVIStreamPrevSampleTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamSampleToTime
               (pavi,
                AVIStreamPrevSample (pavi, AVIStreamTimeToSample (pavi, t)));
   end AVIStreamPrevSampleTime;

   function AVIStreamNextSampleTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamSampleToTime
               (pavi,
                AVIStreamNextSample (pavi, AVIStreamTimeToSample (pavi, t)));
   end AVIStreamNextSampleTime;

   function AVIStreamNearestSampleTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamSampleToTime
               (pavi,
                AVIStreamNearestSample
                   (pavi,
                    AVIStreamTimeToSample (pavi, t)));
   end AVIStreamNearestSampleTime;

   function AVIStreamNextKeyFrameTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamSampleToTime
               (pavi,
                AVIStreamNextKeyFrame (pavi, AVIStreamTimeToSample (pavi, t)));
   end AVIStreamNextKeyFrameTime;

   function AVIStreamPrevKeyFrameTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamSampleToTime
               (pavi,
                AVIStreamPrevKeyFrame (pavi, AVIStreamTimeToSample (pavi, t)));
   end AVIStreamPrevKeyFrameTime;

   function AVIStreamNearestKeyFrameTime
     (pavi : PAVISTREAM;
      t    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return AVIStreamSampleToTime
               (pavi,
                AVIStreamNearestKeyFrame
                   (pavi,
                    AVIStreamTimeToSample (pavi, t)));
   end AVIStreamNearestKeyFrameTime;

   function AVIStreamStartTime (pavi : PAVISTREAM) return Win32.LONG is
   begin
      return AVIStreamSampleToTime (pavi, AVIStreamStart (pavi));
   end AVIStreamStartTime;

   function AVIStreamLengthTime (pavi : PAVISTREAM) return Win32.LONG is
   begin
      return AVIStreamSampleToTime (pavi, AVIStreamLength (pavi));
   end AVIStreamLengthTime;

   function AVIStreamEnd (pavi : PAVISTREAM) return Win32.LONG is
   begin
      return (AVIStreamStart (pavi) + AVIStreamLength (pavi));
   end AVIStreamEnd;

   function AVIStreamEndTime (pavi : PAVISTREAM) return Win32.LONG is
   begin
      return AVIStreamSampleToTime (pavi, AVIStreamEnd (pavi));
   end AVIStreamEndTime;

   function AVIStreamSampleSize
     (pavi   : PAVISTREAM;
      lPos   : Win32.LONG;
      plSize : access Win32.LONG)
      return Win32.Objbase.HRESULT
   is
   begin
      return AVIStreamRead
               (pavi,
                lPos,
                1,
                System.Null_Address,
                0,
                Win32.PLONG (plSize),
                null);
   end AVIStreamSampleSize;

   function AVIStreamFormatSize
     (pavi   : PAVISTREAM;
      lPos   : Win32.LONG;
      plSize : access Win32.LONG)
      return Win32.Objbase.HRESULT
   is
   begin
      return AVIStreamReadFormat
               (pavi,
                lPos,
                System.Null_Address,
                Win32.PLONG (plSize));
   end AVIStreamFormatSize;

   function AVIStreamDataSize
     (pavi   : PAVISTREAM;
      fcc    : Win32.DWORD;
      plSize : access Win32.LONG)
      return Win32.Objbase.HRESULT
   is
   begin
      return AVIStreamReadData
               (pavi,
                fcc,
                System.Null_Address,
                Win32.PLONG (plSize));
   end AVIStreamDataSize;

   use Stdarg, Stdarg.Impl, Stdarg.Inst;

   function "&" is new Stdarg.Concat (Win32.LPCSTR);
   function "&" is new Stdarg.Concat (Win32.LPCWSTR);
   function "&" is new Stdarg.Concat (Win32.Objbase.LPCLSID);
   function "&" is new Stdarg.Concat (AVISAVECALLBACK);
   function "&" is new Stdarg.Concat (PAVISTREAM);
   function "&" is new Stdarg.Concat (LPAVICOMPRESSOPTIONS);

   function AVISaveA
     (szFile        : Win32.LPCSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      pfile         : PAVISTREAM;
      lpOptions     : LPAVICOMPRESSOPTIONS;
      Args          : Stdarg.ArgList := Stdarg.Empty)
      return Win32.Objbase.HRESULT
   is
      Complete_Args : constant Stdarg.ArgList :=
         Stdarg.Empty &
         szFile &
         Win32.Objbase.LPCLSID (pclsidHandler) &
         lpfnCallback &
         nStreams &
         pfile &
         lpOptions &
         Args;

      procedure C_AVISaveA;
      pragma Import (C, C_AVISaveA, "AVISaveA");

   begin
      return Win32.Objbase.HRESULT (F_Varargs
                                       (C_AVISaveA'Address,
                                        ArgCount (Complete_Args),
                                        Address_of_First_Arg (Complete_Args)));
   end AVISaveA;

   function AVISaveW
     (szFile        : Win32.LPCWSTR;
      pclsidHandler : access Win32.Objbase.CLSID;
      lpfnCallback  : AVISAVECALLBACK;
      nStreams      : Win32.INT;
      pfile         : PAVISTREAM;
      lpOptions     : LPAVICOMPRESSOPTIONS;
      Args          : Stdarg.ArgList := Stdarg.Empty)
      return Win32.Objbase.HRESULT
   is
      Complete_Args : constant Stdarg.ArgList :=
         Stdarg.Empty &
         szFile &
         Win32.Objbase.LPCLSID (pclsidHandler) &
         lpfnCallback &
         nStreams &
         pfile &
         lpOptions &
         Args;

      procedure C_AVISaveW;
      pragma Import (C, C_AVISaveW, "AVISaveW");

   begin
      return Win32.Objbase.HRESULT (F_Varargs
                                       (C_AVISaveW'Address,
                                        ArgCount (Complete_Args),
                                        Address_of_First_Arg (Complete_Args)));

   end AVISaveW;

   function MAKE_AVIERR (error : Win32.WORD) return Win32.Winerror.HRESULT is
      use type Interfaces.C.unsigned_short;
   begin
      return Win32.Winerror.MAKE_SCODE
               (Win32.Winerror.SEVERITY_ERROR,
                Win32.Winerror.FACILITY_ITF,
                16#4000# + error);
   end MAKE_AVIERR;

   function MCIWndCanPlay (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_CAN_PLAY, 0, 0));
   end MCIWndCanPlay;

   function MCIWndCanRecord (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_CAN_RECORD, 0, 0));
   end MCIWndCanRecord;

   function MCIWndCanSave (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_CAN_SAVE, 0, 0));
   end MCIWndCanSave;

   function MCIWndCanWindow (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_CAN_WINDOW, 0, 0));
   end MCIWndCanWindow;

   function MCIWndCanEject (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_CAN_EJECT, 0, 0));
   end MCIWndCanEject;

   function MCIWndCanConfig (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_CAN_CONFIG, 0, 0));
   end MCIWndCanConfig;

   function MCIWndPaletteKick (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_PALETTEKICK, 0, 0));
   end MCIWndPaletteKick;

   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.LPVOID,
      Win32.LPARAM);
   function To_LPVOID is new Ada.Unchecked_Conversion (
      Win32.Winnt.LPTSTR,
      Win32.LPVOID);

   function MCIWndSave
     (hwnd   : Win32.Windef.HWND;
      szFile : Win32.LPVOID)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             Win32.Mmsystem.MCI_SAVE,
                             0,
                             To_LPARAM (szFile)));
   end MCIWndSave;

   function MCIWndSaveDialog (hwnd : Win32.Windef.HWND) return Win32.LONG is
      function To_LPVOID is new Ada.Unchecked_Conversion (
         LONG_PTR,
         Win32.LPVOID);
   begin
      return MCIWndSave (hwnd, To_LPVOID (-1));
   end MCIWndSaveDialog;

   function MCIWndNew
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_NEW, 0, To_LPARAM (lp)));
   end MCIWndNew;

   function MCIWndRecord (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, Win32.Mmsystem.MCI_RECORD, 0, 0));
   end MCIWndRecord;

   function MCIWndOpen
     (hwnd : Win32.Windef.HWND;
      sz   : Win32.LPVOID;
      f    : Win32.BOOL)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_OPEN,
                             Win32.WPARAM (Win32.UINT (f)),
                             To_LPARAM (sz)));
   end MCIWndOpen;

   function MCIWndOpenDialog (hwnd : Win32.Windef.HWND) return Win32.LONG is
      function To_LPVOID is new Ada.Unchecked_Conversion (
         LONG_PTR,
         Win32.LPVOID);
   begin
      return MCIWndOpen (hwnd, To_LPVOID (-1), 0);
   end MCIWndOpenDialog;

   function MCIWndClose (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, Win32.Mmsystem.MCI_CLOSE, 0, 0));
   end MCIWndClose;

   function MCIWndPlay (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, Win32.Mmsystem.MCI_PLAY, 0, 0));
   end MCIWndPlay;

   function MCIWndStop (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, Win32.Mmsystem.MCI_STOP, 0, 0));
   end MCIWndStop;

   function MCIWndPause (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, Win32.Mmsystem.MCI_PAUSE, 0, 0));
   end MCIWndPause;

   function MCIWndResume (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, Win32.Mmsystem.MCI_RESUME, 0, 0));
   end MCIWndResume;

   function MCIWndSeek
     (hwnd : Win32.Windef.HWND;
      lPos : Win32.LONG)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             Win32.Mmsystem.MCI_SEEK,
                             0,
                             Win32.LPARAM (lPos)));
   end MCIWndSeek;

   function MCIWndEject (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_EJECT, 0, 0));
   end MCIWndEject;

   function MCIWndHome (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return MCIWndSeek (hwnd, MCIWND_START);
   end MCIWndHome;

   function MCIWndEnd (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return MCIWndSeek (hwnd, MCIWND_END);
   end MCIWndEnd;

   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.Windef.LPRECT,
      Win32.LPARAM);

   function MCIWndGetSource
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GET_SOURCE,
                             0,
                             To_LPARAM (prc)));
   end MCIWndGetSource;

   function MCIWndPutSource
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_PUT_SOURCE,
                             0,
                             To_LPARAM (prc)));
   end MCIWndPutSource;

   function MCIWndGetDest
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GET_DEST,
                             0,
                             To_LPARAM (prc)));
   end MCIWndGetDest;

   function MCIWndPutDest
     (hwnd : Win32.Windef.HWND;
      prc  : Win32.Windef.LPRECT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_PUT_DEST,
                             0,
                             To_LPARAM (prc)));
   end MCIWndPutDest;

   function MCIWndPlayReverse (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_PLAYREVERSE, 0, 0));
   end MCIWndPlayReverse;

   function MCIWndPlayFrom
     (hwnd : Win32.Windef.HWND;
      lPos : Win32.LONG)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_PLAYFROM, 0, LPARAM (lPos)));
   end MCIWndPlayFrom;

   function MCIWndPlayTo
     (hwnd : Win32.Windef.HWND;
      lPos : Win32.LONG)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_PLAYTO, 0, LPARAM (lPos)));
   end MCIWndPlayTo;

   function MCIWndPlayFromTo
     (hwnd   : Win32.Windef.HWND;
      lStart : Win32.LONG;
      lEnd   : Win32.LONG)
      return Win32.LONG
   is
      garbage : Win32.LONG;
      pragma Unreferenced (garbage);
   begin
      garbage := MCIWndSeek (hwnd, lStart);
      return MCIWndPlayTo (hwnd, lEnd);
   end MCIWndPlayFromTo;

   function MCIWndGetDeviceID (hwnd : Win32.Windef.HWND) return Win32.UINT is
   begin
      return Win32.UINT (MCIWndSM (hwnd, MCIWNDM_GETDEVICEID, 0, 0));
   end MCIWndGetDeviceID;

   function MCIWndGetAlias (hwnd : Win32.Windef.HWND) return Win32.UINT is
   begin
      return UINT (MCIWndSM (hwnd, MCIWNDM_GETALIAS, 0, 0));
   end MCIWndGetAlias;

   function To_LPARAM is new Ada.Unchecked_Conversion (
      Win32.Winnt.LPTSTR,
      Win32.LPARAM);

   function MCIWndGetMode
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR;
      len  : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GETMODE,
                             Win32.WPARAM (len),
                             To_LPARAM (lp)));
   end MCIWndGetMode;

   function MCIWndGetPosition (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_GETPOSITION, 0, 0));
   end MCIWndGetPosition;

   function MCIWndGetPositionString
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR;
      len  : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GETPOSITION,
                             Win32.WPARAM (len),
                             To_LPARAM (lp)));
   end MCIWndGetPositionString;

   function MCIWndGetStart (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_GETSTART, 0, 0));
   end MCIWndGetStart;

   function MCIWndGetLength (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_GETLENGTH, 0, 0));
   end MCIWndGetLength;

   function MCIWndGetEnd (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_GETEND, 0, 0));
   end MCIWndGetEnd;

   function MCIWndStep
     (hwnd : Win32.Windef.HWND;
      n    : Win32.LONG)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             Win32.Mmsystem.MCI_STEP,
                             0,
                             Win32.LPARAM (n)));
   end MCIWndStep;

   procedure MCIWndDestroy (hwnd : Win32.Windef.HWND) is
      garbage : Win32.LRESULT;
      pragma Unreferenced (garbage);
   begin
      garbage := MCIWndSM (hwnd, Win32.Winuser.WM_CLOSE, 0, 0);
   end MCIWndDestroy;

   procedure MCIWndSetZoom (hwnd : Win32.Windef.HWND; iZoom : Win32.UINT) is
      garbage : Win32.LRESULT;
      pragma Unreferenced (garbage);
   begin
      garbage := MCIWndSM (hwnd, MCIWNDM_SETZOOM, 0, LPARAM (iZoom));
   end MCIWndSetZoom;

   function MCIWndGetZoom (hwnd : Win32.Windef.HWND) return Win32.UINT is
   begin
      return Win32.UINT (MCIWndSM (hwnd, MCIWNDM_GETZOOM, 0, 0));
   end MCIWndGetZoom;

   function MCIWndSetVolume
     (hwnd : Win32.Windef.HWND;
      iVol : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_SETVOLUME,
                             0,
                             Win32.LPARAM (iVol)));
   end MCIWndSetVolume;

   function MCIWndGetVolume (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_GETVOLUME, 0, 0));
   end MCIWndGetVolume;

   function MCIWndSetSpeed
     (hwnd   : Win32.Windef.HWND;
      iSpeed : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_SETSPEED,
                             0,
                             LPARAM (iSpeed)));
   end MCIWndSetSpeed;

   function MCIWndGetSpeed (hwnd : Win32.Windef.HWND) return Win32.LONG is
   begin
      return Win32.LONG (MCIWndSM (hwnd, MCIWNDM_GETSPEED, 0, 0));
   end MCIWndGetSpeed;

   function MCIWndSetTimeFormat
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_SETTIMEFORMAT,
                             0,
                             To_LPARAM (lp)));
   end MCIWndSetTimeFormat;

   function MCIWndGetTimeFormat
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.Winnt.LPTSTR;
      len  : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GETTIMEFORMAT,
                             WPARAM (len),
                             To_LPARAM (lp)));
   end MCIWndGetTimeFormat;

   procedure MCIWndValidateMedia (hwnd : Win32.Windef.HWND) is
      garbage : Win32.LRESULT;
      pragma Unreferenced (garbage);
   begin
      garbage := MCIWndSM (hwnd, MCIWNDM_VALIDATEMEDIA, 0, 0);
   end MCIWndValidateMedia;

   procedure MCIWndSetRepeat (hwnd : Win32.Windef.HWND; f : Win32.BOOL) is
      garbage : Win32.LRESULT;
      pragma Unreferenced (garbage);
   begin
      garbage := MCIWndSM (hwnd, MCIWNDM_SETREPEAT, 0, Win32.LPARAM (f));
   end MCIWndSetRepeat;

   function MCIWndGetRepeat (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (MCIWndSM (hwnd, MCIWNDM_GETREPEAT, 0, 0));
   end MCIWndGetRepeat;

   procedure MCIWndSetActiveTimer
     (hwnd   : Win32.Windef.HWND;
      active : Win32.UINT)
   is
      garbage : Win32.LRESULT;
      pragma Unreferenced (garbage);
   begin
      garbage :=
         MCIWndSM (hwnd, MCIWNDM_SETACTIVETIMER, Win32.WPARAM (active), 0);
   end MCIWndSetActiveTimer;

   procedure MCIWndSetInactiveTimer
     (hwnd     : Win32.Windef.HWND;
      inactive : Win32.UINT)
   is
      garbage : Win32.LRESULT;
      pragma Unreferenced (garbage);
   begin
      garbage :=
         MCIWndSM
           (hwnd,
            MCIWNDM_SETINACTIVETIMER,
            Win32.WPARAM (inactive),
            0);
   end MCIWndSetInactiveTimer;

   procedure MCIWndSetTimers
     (hwnd     : Win32.Windef.HWND;
      active   : Win32.UINT;
      inactive : Win32.UINT)
   is
      garbage : Win32.LRESULT;
      pragma Unreferenced (garbage);
   begin
      garbage :=
         MCIWndSM
           (hwnd,
            MCIWNDM_SETTIMERS,
            Win32.WPARAM (active),
            Win32.LPARAM (inactive));
   end MCIWndSetTimers;

   function MCIWndGetActiveTimer
     (hwnd : Win32.Windef.HWND)
      return Win32.UINT
   is
   begin
      return Win32.UINT (MCIWndSM (hwnd, MCIWNDM_GETACTIVETIMER, 0, 0));
   end MCIWndGetActiveTimer;

   function MCIWndGetInactiveTimer
     (hwnd : Win32.Windef.HWND)
      return Win32.UINT
   is
   begin
      return Win32.UINT (MCIWndSM (hwnd, MCIWNDM_GETINACTIVETIMER, 0, 0));
   end MCIWndGetInactiveTimer;

   function MCIWndRealize
     (hwnd   : Win32.Windef.HWND;
      fBkgnd : Win32.BOOL)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_REALIZE,
                             Win32.WPARAM (fBkgnd),
                             0));
   end MCIWndRealize;

   function MCIWndSendString
     (hwnd : Win32.Windef.HWND;
      sz   : Win32.Winnt.LPTSTR)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_SENDSTRING,
                             0,
                             To_LPARAM (sz)));
   end MCIWndSendString;

   function MCIWndReturnString
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_RETURNSTRING,
                             Win32.WPARAM (len),
                             To_LPARAM (lp)));
   end MCIWndReturnString;

   function MCIWndGetError
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GETERROR,
                             Win32.WPARAM (len),
                             To_LPARAM (lp)));
   end MCIWndGetError;

   function MCIWndGetPalette
     (hwnd : Win32.Windef.HWND)
      return Win32.Windef.HPALETTE
   is
      function To_HPALETTE is new Ada.Unchecked_Conversion (
         Win32.LRESULT,
         Win32.Windef.HPALETTE);
   begin
      return To_HPALETTE (MCIWndSM (hwnd, MCIWNDM_GETPALETTE, 0, 0));
   end MCIWndGetPalette;

   function MCIWndSetPalette
     (hwnd : Win32.Windef.HWND;
      hpal : Win32.Windef.HPALETTE)
      return Win32.LONG
   is
      function To_WPARAM is new Ada.Unchecked_Conversion (
         Win32.Windef.HPALETTE,
         Win32.WPARAM);
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_SETPALETTE,
                             To_WPARAM (hpal),
                             0));
   end MCIWndSetPalette;

   function MCIWndGetFileName
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GETFILENAME,
                             Win32.WPARAM (len),
                             To_LPARAM (lp)));
   end MCIWndGetFileName;

   function MCIWndGetDevice
     (hwnd : Win32.Windef.HWND;
      lp   : Win32.LPVOID;
      len  : Win32.UINT)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_GETDEVICE,
                             Win32.WPARAM (len),
                             To_LPARAM (lp)));
   end MCIWndGetDevice;

   function MCIWndGetStyles (hwnd : Win32.Windef.HWND) return Win32.UINT is
   begin
      return Win32.UINT (MCIWndSM (hwnd, MCIWNDM_GETSTYLES, 0, 0));
   end MCIWndGetStyles;

   function MCIWndChangeStyles
     (hwnd  : Win32.Windef.HWND;
      mask  : Win32.UINT;
      value : Win32.LONG)
      return Win32.LONG
   is
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_CHANGESTYLES,
                             Win32.WPARAM (mask),
                             Win32.LPARAM (value)));
   end MCIWndChangeStyles;

   function MCIWndOpenInterface
     (hwnd : Win32.Windef.HWND;
      pUnk : Win32.Objbase.LPUNKNOWN)
      return Win32.LONG
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Objbase.LPUNKNOWN,
         Win32.LPARAM);
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_OPENINTERFACE,
                             0,
                             To_LPARAM (pUnk)));
   end MCIWndOpenInterface;

   function MCIWndSetOwner
     (hwnd  : Win32.Windef.HWND;
      hwndP : Win32.Windef.HWND)
      return Win32.LONG
   is
      function To_WPARAM is new Ada.Unchecked_Conversion (
         Win32.Windef.HWND,
         Win32.WPARAM);
   begin
      return Win32.LONG (MCIWndSM
                            (hwnd,
                             MCIWNDM_SETOWNER,
                             To_WPARAM (hwndP),
                             0));
   end MCIWndSetOwner;

   function capSetCallbackOnError
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_CALLBACK_ERROR,
                             0,
                             To_LPARAM (fpProc)));
   end capSetCallbackOnError;

   function capSetCallbackOnStatus
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_CALLBACK_STATUS,
                             0,
                             To_LPARAM (fpProc)));
   end capSetCallbackOnStatus;

   function capSetCallbackOnYield
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_CALLBACK_YIELD,
                             0,
                             To_LPARAM (fpProc)));
   end capSetCallbackOnYield;

   function capSetCallbackOnFrame
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_CALLBACK_FRAME,
                             0,
                             To_LPARAM (fpProc)));
   end capSetCallbackOnFrame;

   function capSetCallbackOnVideoStream
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_CALLBACK_VIDEOSTREAM,
                             0,
                             To_LPARAM (fpProc)));
   end capSetCallbackOnVideoStream;

   function capSetCallbackOnWaveStream
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_CALLBACK_WAVESTREAM,
                             0,
                             To_LPARAM (fpProc)));
   end capSetCallbackOnWaveStream;

   function capSetCallbackOnCapControl
     (hwnd   : Win32.Windef.HWND;
      fpProc : Win32.LPVOID)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_CALLBACK_CAPCONTROL,
                             0,
                             To_LPARAM (fpProc)));
   end capSetCallbackOnCapControl;

   function capSetUserData
     (hwnd  : Win32.Windef.HWND;
      lUser : Win32.LONG)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_USER_DATA,
                             0,
                             LPARAM (lUser)));
   end capSetUserData;

   function capGetUserData (hwnd : Win32.Windef.HWND) return Win32.LRESULT is
   begin
      return AVICapSM (hwnd, WM_CAP_GET_USER_DATA, 0, 0);
   end capGetUserData;

   function capDriverConnect
     (hwnd : Win32.Windef.HWND;
      i    : Win32.INT)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_DRIVER_CONNECT,
                             WPARAM (i),
                             0));
   end capDriverConnect;

   function capDriverDisconnect
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_DRIVER_DISCONNECT, 0, 0));
   end capDriverDisconnect;

   function capDriverGetName
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR;
      wSize  : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_DRIVER_GET_NAME,
                             WPARAM (wSize),
                             (To_LPARAM (To_LPVOID (szName)))));
   end capDriverGetName;

   function capDriverGetVersion
     (hwnd  : Win32.Windef.HWND;
      szVer : Win32.Winnt.LPTSTR;
      wSize : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_DRIVER_GET_VERSION,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (szVer))));
   end capDriverGetVersion;

   function capDriverGetCaps
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPDRIVERCAPS;
      wSize : Win32.WORD)
      return Win32.BOOL
   is
      function To_LPVOID is new Ada.Unchecked_Conversion (
         LPCAPDRIVERCAPS,
         Win32.LPVOID);
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_DRIVER_GET_CAPS,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (s))));
   end capDriverGetCaps;

   function capFileSetCaptureFile
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_FILE_SET_CAPTURE_FILE,
                             0,
                             To_LPARAM (To_LPVOID (szName))));
   end capFileSetCaptureFile;

   function capFileGetCaptureFile
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR;
      wSize  : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_FILE_GET_CAPTURE_FILE,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (szName))));
   end capFileGetCaptureFile;

   function capFileAlloc
     (hwnd   : Win32.Windef.HWND;
      dwSize : Win32.DWORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_FILE_ALLOCATE,
                             0,
                             LPARAM (dwSize)));
   end capFileAlloc;

   function capFileSaveAs
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_FILE_SAVEAS,
                             0,
                             To_LPARAM (To_LPVOID (szName))));
   end capFileSaveAs;

   function capFileSetInfoChunk
     (hwnd        : Win32.Windef.HWND;
      lpInfoChunk : LPCAPINFOCHUNK)
      return Win32.BOOL
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         LPCAPINFOCHUNK,
         Win32.LPARAM);
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_FILE_SET_INFOCHUNK,
                             0,
                             To_LPARAM (lpInfoChunk)));
   end capFileSetInfoChunk;

   function capFileSaveDIB
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_FILE_SAVEDIB,
                             0,
                             To_LPARAM (To_LPVOID (szName))));
   end capFileSaveDIB;

   function capEditCopy (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_EDIT_COPY, 0, 0));
   end capEditCopy;

   function capSetAudioFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.Mmsystem.LPWAVEFORMATEX;
      wSize : Win32.WORD)
      return Win32.BOOL
   is
      function To_LPVOID is new Ada.Unchecked_Conversion (
         Win32.Mmsystem.LPWAVEFORMATEX,
         Win32.LPVOID);

   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_AUDIOFORMAT,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (s))));
   end capSetAudioFormat;

   function capGetAudioFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.Mmsystem.LPWAVEFORMATEX;
      wSize : Win32.WORD)
      return Win32.DWORD
   is
      function To_LPVOID is new Ada.Unchecked_Conversion (
         Win32.Mmsystem.LPWAVEFORMATEX,
         Win32.LPVOID);
   begin
      return Win32.DWORD (AVICapSM
                             (hwnd,
                              WM_CAP_GET_AUDIOFORMAT,
                              Win32.WPARAM (wSize),
                              To_LPARAM (To_LPVOID (s))));
   end capGetAudioFormat;

   function capGetAudioFormatSize
     (hwnd : Win32.Windef.HWND)
      return Win32.DWORD
   is
   begin
      return Win32.DWORD (AVICapSM (hwnd, WM_CAP_GET_AUDIOFORMAT, 0, 0));
   end capGetAudioFormatSize;

   function capDlgVideoFormat (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_DLG_VIDEOFORMAT, 0, 0));
   end capDlgVideoFormat;

   function capDlgVideoSource (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_DLG_VIDEOSOURCE, 0, 0));
   end capDlgVideoSource;

   function capDlgVideoDisplay (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_DLG_VIDEODISPLAY, 0, 0));
   end capDlgVideoDisplay;

   function capDlgVideoCompression
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_DLG_VIDEOCOMPRESSION, 0, 0));
   end capDlgVideoCompression;

   function capGetVideoFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.LPVOID;
      wSize : Win32.WORD)
      return Win32.DWORD
   is
   begin
      return Win32.DWORD (AVICapSM
                             (hwnd,
                              WM_CAP_GET_VIDEOFORMAT,
                              Win32.WPARAM (wSize),
                              To_LPARAM (s)));
   end capGetVideoFormat;

   function capGetVideoFormatSize
     (hwnd : Win32.Windef.HWND)
      return Win32.DWORD
   is
   begin
      return Win32.DWORD (AVICapSM (hwnd, WM_CAP_GET_VIDEOFORMAT, 0, 0));
   end capGetVideoFormatSize;

   function capSetVideoFormat
     (hwnd  : Win32.Windef.HWND;
      s     : Win32.LPVOID;
      wSize : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_VIDEOFORMAT,
                             WPARAM (wSize),
                             To_LPARAM (s)));
   end capSetVideoFormat;

   function capPreview
     (hwnd : Win32.Windef.HWND;
      f    : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SET_PREVIEW, WPARAM (f), 0));
   end capPreview;

   function capPreviewRate
     (hwnd : Win32.Windef.HWND;
      wMS  : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_PREVIEWRATE,
                             WPARAM (wMS),
                             0));
   end capPreviewRate;

   function capOverlay
     (hwnd : Win32.Windef.HWND;
      f    : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SET_OVERLAY, WPARAM (f), 0));
   end capOverlay;

   function capPreviewScale
     (hwnd : Win32.Windef.HWND;
      f    : Win32.BOOL)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SET_SCALE, WPARAM (f), 0));
   end capPreviewScale;

   function capGetStatus
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPSTATUS;
      wSize : Win32.WORD)
      return Win32.BOOL
   is
      function To_LPVOID is new Ada.Unchecked_Conversion (
         LPCAPSTATUS,
         Win32.LPVOID);
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_GET_STATUS,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (s))));
   end capGetStatus;

   function capSetScrollPos
     (hwnd : Win32.Windef.HWND;
      lpP  : Win32.Windef.LPPOINT)
      return Win32.BOOL
   is
      function To_LPARAM is new Ada.Unchecked_Conversion (
         Win32.Windef.LPPOINT,
         Win32.LPARAM);
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_SCROLL,
                             0,
                             To_LPARAM (lpP)));
   end capSetScrollPos;

   function capGrabFrame (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_GRAB_FRAME, 0, 0));
   end capGrabFrame;

   function capGrabFrameNoStop (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_GRAB_FRAME_NOSTOP, 0, 0));
   end capGrabFrameNoStop;

   function capCaptureSequence (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SEQUENCE, 0, 0));
   end capCaptureSequence;

   function capCaptureSequenceNoFile
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SEQUENCE_NOFILE, 0, 0));
   end capCaptureSequenceNoFile;

   function capCaptureStop (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_STOP, 0, 0));
   end capCaptureStop;

   function capCaptureAbort (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_ABORT, 0, 0));
   end capCaptureAbort;

   function capCaptureSingleFrameOpen
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SINGLE_FRAME_OPEN, 0, 0));
   end capCaptureSingleFrameOpen;

   function capCaptureSingleFrameClose
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SINGLE_FRAME_CLOSE, 0, 0));
   end capCaptureSingleFrameClose;

   function capCaptureSingleFrame
     (hwnd : Win32.Windef.HWND)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_SINGLE_FRAME, 0, 0));
   end capCaptureSingleFrame;

   function To_LPVOID is new Ada.Unchecked_Conversion (
      LPCAPTUREPARMS,
      Win32.LPVOID);

   function capCaptureGetSetup
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPTUREPARMS;
      wSize : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_GET_SEQUENCE_SETUP,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (s))));
   end capCaptureGetSetup;

   function capCaptureSetSetup
     (hwnd  : Win32.Windef.HWND;
      s     : LPCAPTUREPARMS;
      wSize : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_SEQUENCE_SETUP,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (s))));
   end capCaptureSetSetup;

   function capSetMCIDeviceName
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_SET_MCI_DEVICE,
                             0,
                             To_LPARAM (To_LPVOID (szName))));
   end capSetMCIDeviceName;

   function capGetMCIDeviceName
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR;
      wSize  : Win32.WORD)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_GET_MCI_DEVICE,
                             WPARAM (wSize),
                             To_LPARAM (To_LPVOID (szName))));
   end capGetMCIDeviceName;

   function capPaletteOpen
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_PAL_OPEN,
                             0,
                             To_LPARAM (To_LPVOID (szName))));
   end capPaletteOpen;

   function capPaletteSave
     (hwnd   : Win32.Windef.HWND;
      szName : Win32.Winnt.LPTSTR)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_PAL_SAVE,
                             0,
                             To_LPARAM (To_LPVOID (szName))));
   end capPaletteSave;

   function capPalettePaste (hwnd : Win32.Windef.HWND) return Win32.BOOL is
   begin
      return Win32.BOOL (AVICapSM (hwnd, WM_CAP_PAL_PASTE, 0, 0));
   end capPalettePaste;

   function capPaletteAuto
     (hwnd    : Win32.Windef.HWND;
      iFrames : Win32.INT;
      iColors : Win32.INT)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_PAL_AUTOCREATE,
                             Win32.WPARAM (iFrames),
                             Win32.LPARAM (iColors)));
   end capPaletteAuto;

   function capPaletteManual
     (hwnd    : Win32.Windef.HWND;
      fGrab   : Win32.BOOL;
      iColors : Win32.INT)
      return Win32.BOOL
   is
   begin
      return Win32.BOOL (AVICapSM
                            (hwnd,
                             WM_CAP_PAL_MANUALCREATE,
                             Win32.WPARAM (fGrab),
                             Win32.LPARAM (iColors)));
   end capPaletteManual;

end Win32.Vfw;
