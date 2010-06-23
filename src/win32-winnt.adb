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
with Interfaces;
with System.Storage_Elements;  use System.Storage_Elements;

package body Win32.Winnt is

   function MAKELANGID (P, S : WORD) return WORD is
      use Interfaces;
   begin
      return WORD (Unsigned_32 (P) or
                   Interfaces.Shift_Left (Unsigned_32 (S), 10));
   end MAKELANGID;

   function PRIMARYLANGID (LGID : WORD) return WORD is
      use Interfaces;
   begin
      return WORD (Unsigned_32 (LGID) and 16#3ff#);
   end PRIMARYLANGID;

   function SUBLANGID (LGID : WORD) return WORD is
      use Interfaces;
   begin
      return WORD (Interfaces.Shift_Right (Unsigned_32 (LGID), 10));
   end SUBLANGID;

   function MAKELCID (Lgid, Srtid : WORD) return DWORD is
      use Interfaces;
   begin
      return DWORD (Shift_Left (Unsigned_32 (Srtid), 16) or
                    Unsigned_32 (Lgid));
   end MAKELCID;

   function LANGIDFROMLCID (Lcid : DWORD) return WORD is
      use Interfaces;
   begin
      return WORD (Unsigned_32 (Lcid) and 16#ffff#);
   end LANGIDFROMLCID;

   function SORTIDFROMLCID (Lcid : DWORD) return WORD is
      use Interfaces;
   begin
      return WORD (Shift_Right
                      ((Unsigned_32 (Lcid) and NLS_VALID_LOCALE_MASK),
                       16));
   end SORTIDFROMLCID;

   function IMAGE_FIRST_SECTION
     (NTHeader : PIMAGE_NT_HEADERS)
      return PIMAGE_DATA_DIRECTORY
   is
      Dummy : IMAGE_NT_HEADERS;
      pragma Warnings (Off, Dummy);

   begin
      return To_PIMAGE
               (NTHeader.all'Address +
                Storage_Offset (Dummy.OptionalHeader'Position) +
                Storage_Offset (NTHeader.FileHeader.SizeOfOptionalHeader));
   end IMAGE_FIRST_SECTION;

   function BTYPE (X : BYTE) return BYTE is
      use Interfaces;
   begin
      return BYTE (Unsigned_32 (X) and N_BTMASK);
   end BTYPE;

   function ISPTR (X : BYTE) return Standard.Boolean is
      use Interfaces;
   begin
      return (Unsigned_32 (X) and N_TMASK) =
             Shift_Left (Unsigned_32 (IMAGE_SYM_DTYPE_POINTER), N_BTSHFT);
   end ISPTR;

   function ISFCN (X : BYTE) return Standard.Boolean is
      use Interfaces;
   begin
      return (Unsigned_32 (X) and N_TMASK) =
             Shift_Left (Unsigned_32 (IMAGE_SYM_DTYPE_FUNCTION), N_BTSHFT);
   end ISFCN;

   function ISARY (X : BYTE) return Standard.Boolean is
      use Interfaces;
   begin
      return (Unsigned_32 (X) and N_TMASK) =
             Shift_Left (Unsigned_32 (IMAGE_SYM_DTYPE_ARRAY), N_BTSHFT);
   end ISARY;

   function ISTAG (X : BYTE) return Standard.Boolean is
      use Interfaces;
   begin
      return X = IMAGE_SYM_CLASS_STRUCT_TAG or
             X = IMAGE_SYM_CLASS_UNION_TAG or
             X = IMAGE_SYM_CLASS_ENUM_TAG;
   end ISTAG;

   function INCREF (X : BYTE) return BYTE is
      use Interfaces;
      U8X : constant Unsigned_32 := Unsigned_32 (X);
   begin
      return BYTE ((Shift_Left (U8X and not N_BTMASK, N_TSHIFT)) or
                   (Shift_Left
                       (Unsigned_32 (IMAGE_SYM_DTYPE_POINTER),
                        N_BTSHFT)) or
                   (U8X and N_BTMASK));
   end INCREF;

   function DECREF (X : BYTE) return BYTE is
      use Interfaces;
   begin
      return BYTE ((Shift_Right (Unsigned_32 (X), N_TSHIFT) and
                    not N_BTMASK) or
                   (Unsigned_32 (X) and N_BTMASK));
   end DECREF;

   function IMAGE_SNAP_BY_ORDINAL (Ordinal : DWORD) return Standard.Boolean is
      function To_Int is new Ada.Unchecked_Conversion (DWORD, Integer);
   begin
      return To_Int (Ordinal) < 0;
   end IMAGE_SNAP_BY_ORDINAL;

   function IMAGE_ORDINAL (Ordinal : DWORD) return WORD is
      use Interfaces;
   begin
      return WORD (Interfaces.Unsigned_32 (Ordinal) and 16#FFFF#);
   end IMAGE_ORDINAL;

begin

   SYSTEM_LUID.Luid.u.LowPart  := 16#3E7#;
   SYSTEM_LUID.Luid.u.HighPart := 0;
   SYSTEM_LUID.Attributes      := 0;

end Win32.Winnt;
