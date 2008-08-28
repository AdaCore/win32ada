-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------


with Ada.Unchecked_Conversion;

package body Win32.Objbase is

   use type Interfaces.C.unsigned_long;
   use type Interfaces.C.int;

   procedure LISet32 (li : in out Win32.Winnt.anonymous1_t;
                      v : in Win32.DWORD) is            --  objbase.h: 245
      use type Win32.DWORD;
      use type Win32.LONG;
   begin
      if v > DWORD'Last / 2 then
         li.HighPart := -1;
      else
         li.HighPart := 0;
      end if;
      li.LowPart := v;
   end LISet32;

   procedure ULISet32 (li : in out Win32.Winnt.anonymous1_t;
                       v : in Win32.DWORD) is           --  objbase.h: 247
   begin
      li.HighPart := 0;
      li.LowPart := v;
   end ULISet32;

   function To_UINT is new Ada.Unchecked_Conversion (CLSCTX, Win32.UINT);

   function CLSCTX_ALL return Win32.UINT is                 --  objbase.h:254
   begin
      return To_UINT (CLSCTX_INPROC_SERVER) or
        To_UINT (CLSCTX_INPROC_HANDLER) or To_UINT (CLSCTX_LOCAL_SERVER);

   end CLSCTX_ALL;

   function CLSCTX_INPROC return Win32.UINT is              --  objbase.h:258
   begin
      return To_UINT (CLSCTX_INPROC_SERVER) or To_UINT (CLSCTX_INPROC_HANDLER);
   end CLSCTX_INPROC;

   function CLSCTX_SERVER return Win32.UINT is              --  objbase.h:260
   begin
      return To_UINT (CLSCTX_INPROC_SERVER) or To_UINT (CLSCTX_LOCAL_SERVER);
   end CLSCTX_SERVER;

   function IsEqualGUID (rguid1 : REFGUID;
                         rguid2 : REFGUID)
                        return Win32.BOOL is               --  objbase.h:8923
--      function To_PCVOID is new Ada.Unchecked_Conversion (REFGUID,
--                                                          Win32.PCVOID);
   begin
      if rguid1 = rguid2 then
         return Win32.TRUE;
      else
         return Win32.FALSE;
      end if;
   end IsEqualGUID;

   function IsEqualCLSID (rclsid1 : REFCLSID;
                          rclsid2 : REFCLSID)
                         return Win32.BOOL is          --  objbase.h:953,8926
   begin
      return IsEqualGUID (REFGUID (rclsid1), REFGUID (rclsid2));
   end IsEqualCLSID;


end Win32.Objbase;


