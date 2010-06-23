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

with Interfaces.C; use Interfaces.C;

package body Win32.Glaux is

   function AUX_WIND_IS_RGB (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_INDEX) = 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_IS_RGB;

   function AUX_WIND_IS_INDEX (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_INDEX) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_IS_INDEX;

   function AUX_WIND_IS_SINGLE (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_DOUBLE) = 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_IS_SINGLE;

   function AUX_WIND_IS_DOUBLE (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_DOUBLE) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_IS_DOUBLE;

   function AUX_WIND_IS_INDIRECT (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_INDIRECT) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_IS_INDIRECT;

   function AUX_WIND_IS_DIRECT (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_INDIRECT) = 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_IS_DIRECT;

   function AUX_WIND_HAS_ACCUM (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_ACCUM) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_HAS_ACCUM;

   function AUX_WIND_HAS_ALPHA (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_ALPHA) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_HAS_ALPHA;

   function AUX_WIND_HAS_DEPTH (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and (AUX_DEPTH or AUX_DEPTH16)) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_HAS_DEPTH;

   function AUX_WIND_HAS_STENCIL (x : Win32.INT) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_STENCIL) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_HAS_STENCIL;

   function AUX_WIND_USES_FIXED_332_PAL (x : Win32.WORD) return Win32.BOOL is
   begin
      if ((Win32.UINT (x) and AUX_FIXED_332_PAL) /= 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end AUX_WIND_USES_FIXED_332_PAL;

end Win32.Glaux;
