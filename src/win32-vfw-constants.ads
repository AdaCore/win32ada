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

with Win32.Vfw;
pragma Elaborate (Win32.Vfw);

package Win32.Vfw.Constants is

   --  Constants moved here to avoid Access Before Elaboration error

   cktypeDIBbits : constant TWOCC := aviTWOCC ('d', 'b');
   --  vfw.h:1458
   cktypeDIBcompressed : constant TWOCC := aviTWOCC ('d', 'c');
   --  vfw.h:1459
   cktypePALchange : constant TWOCC := aviTWOCC ('p', 'c');
   --  vfw.h:1460
   cktypeWAVEbytes : constant TWOCC := aviTWOCC ('w', 'b');
   --  vfw.h:1461



   AVIERR_UNSUPPORTED : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (101);           --  vfw.h:2397
   AVIERR_BADFORMAT : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (102);           --  vfw.h:2398
   AVIERR_MEMORY : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (103);           --  vfw.h:2399
   AVIERR_INTERNAL : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (104);           --  vfw.h:2400
   AVIERR_BADFLAGS : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (105);           --  vfw.h:2401
   AVIERR_BADPARAM : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (106);           --  vfw.h:2402
   AVIERR_BADSIZE : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (107);           --  vfw.h:2403
   AVIERR_BADHANDLE : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (108);           --  vfw.h:2404
   AVIERR_FILEREAD : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (109);           --  vfw.h:2405
   AVIERR_FILEWRITE : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (110);           --  vfw.h:2406
   AVIERR_FILEOPEN : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (111);           --  vfw.h:2407
   AVIERR_COMPRESSOR : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (112);           --  vfw.h:2408
   AVIERR_NOCOMPRESSOR : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (113);           --  vfw.h:2409
   AVIERR_READONLY : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (114);           --  vfw.h:2410
   AVIERR_NODATA : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (115);           --  vfw.h:2411
   AVIERR_BUFFERTOOSMALL : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (116);           --  vfw.h:2412
   AVIERR_CANTCOMPRESS : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (117);           --  vfw.h:2413
   AVIERR_USERABORT : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (198);           --  vfw.h:2414
   AVIERR_ERROR : constant Win32.Winerror.HRESULT :=
     MAKE_AVIERR (199);           --  vfw.h:2415

end Win32.Vfw.Constants;


