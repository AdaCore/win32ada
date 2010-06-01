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

with Win32.Vfw;
pragma Elaborate (Win32.Vfw);

package Win32.Vfw.Constants is

   cktypeDIBbits       : constant TWOCC := aviTWOCC ('d', 'b');
   cktypeDIBcompressed : constant TWOCC := aviTWOCC ('d', 'c');
   cktypePALchange     : constant TWOCC := aviTWOCC ('p', 'c');
   cktypeWAVEbytes     : constant TWOCC := aviTWOCC ('w', 'b');

   AVIERR_UNSUPPORTED    : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (101);
   AVIERR_BADFORMAT      : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (102);
   AVIERR_MEMORY         : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (103);
   AVIERR_INTERNAL       : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (104);
   AVIERR_BADFLAGS       : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (105);
   AVIERR_BADPARAM       : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (106);
   AVIERR_BADSIZE        : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (107);
   AVIERR_BADHANDLE      : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (108);
   AVIERR_FILEREAD       : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (109);
   AVIERR_FILEWRITE      : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (110);
   AVIERR_FILEOPEN       : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (111);
   AVIERR_COMPRESSOR     : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (112);
   AVIERR_NOCOMPRESSOR   : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (113);
   AVIERR_READONLY       : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (114);
   AVIERR_NODATA         : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (115);
   AVIERR_BUFFERTOOSMALL : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (116);
   AVIERR_CANTCOMPRESS   : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (117);
   AVIERR_USERABORT      : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (198);
   AVIERR_ERROR          : constant Win32.Winerror.HRESULT :=
      MAKE_AVIERR (199);

end Win32.Vfw.Constants;
