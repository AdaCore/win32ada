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

with Win32.Windef;
with Win32.Winnt;

package Win32.Dde is

   WM_DDE_FIRST     : constant := 16#3e0#;
   WM_DDE_INITIATE  : constant := 16#3e0#;
   WM_DDE_TERMINATE : constant := 16#3e1#;
   WM_DDE_ADVISE    : constant := 16#3e2#;
   WM_DDE_UNADVISE  : constant := 16#3e3#;
   WM_DDE_ACK       : constant := 16#3e4#;
   WM_DDE_DATA      : constant := 16#3e5#;
   WM_DDE_REQUEST   : constant := 16#3e6#;
   WM_DDE_POKE      : constant := 16#3e7#;
   WM_DDE_EXECUTE   : constant := 16#3e8#;
   WM_DDE_LAST      : constant := 16#3e8#;

   type ac_SECURITY_QUALITY_OF_SERVICE_t is access all
     Win32.Winnt.SECURITY_QUALITY_OF_SERVICE;

   type DDEACK is record
      bAppReturnCode : Win32.Bits8;
      reserved       : Win32.Bits6;
      fBusy          : Win32.Bits1;
      fAck           : Win32.Bits1;
   end record;
   for DDEACK use record
      bAppReturnCode at 0 range 0 .. 7;
      reserved       at 1 range 0 .. 5;
      fBusy          at 1 range 6 .. 6;
      fAck           at 1 range 7 .. 7;
   end record;

   type DDEADVISE is record
      reserved  : Win32.Bits14;
      fDeferUpd : Win32.Bits1;
      fAckReq   : Win32.Bits1;
      cfFormat  : Win32.SHORT;
   end record;
   for DDEADVISE use record
      reserved  at 0 range 0 .. 13;
      fDeferUpd at 1 range 6 .. 6;
      fAckReq   at 1 range 7 .. 7;
      cfFormat  at 2 range 0 .. 15;
   end record;

   type DDEDATA is record
      unused    : Win32.Bits12;
      fResponse : Win32.Bits1;
      fRelease  : Win32.Bits1;
      reserved  : Win32.Bits1;
      fAckReq   : Win32.Bits1;
      cfFormat  : Win32.SHORT;
      Value     : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;
   for DDEDATA use record
      unused    at 0 range  0 .. 11;
      fResponse at 0 range 12 .. 12;
      fRelease  at 0 range 13 .. 13;
      reserved  at 0 range 14 .. 14;
      fAckReq   at 0 range 15 .. 15;
      cfFormat  at 2 range  0 .. 15;
      Value     at 4 range  0 .. 7;
   end record;

   type DDEPOKE is record
      unused    : Win32.Bits13;
      fRelease  : Win32.Bits1;
      fReserved : Win32.Bits2;
      cfFormat  : Win32.SHORT;
      Value     : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;
   for DDEPOKE use record
      unused    at 0 range  0 .. 12;
      fRelease  at 0 range 13 .. 13;
      fReserved at 0 range 14 .. 15;
      cfFormat  at 2 range  0 .. 15;
      Value     at 4 range  0 .. 7;
   end record;

   type DDELN is record
      unused    : Win32.Bits13;
      fRelease  : Win32.Bits1;
      fDeferUpd : Win32.Bits1;
      fAckReq   : Win32.Bits1;
      cfFormat  : Win32.SHORT;
   end record;
   for DDELN use record
      unused    at 0 range 0 .. 12;
      fRelease  at 1 range 5 .. 5;
      fDeferUpd at 1 range 6 .. 6;
      fAckReq   at 1 range 7 .. 7;
      cfFormat  at 2 range 0 .. 15;
   end record;

   type DDEUP is record
      unused    : Win32.Bits12;
      fAck      : Win32.Bits1;
      fRelease  : Win32.Bits1;
      fReserved : Win32.Bits1;
      fAckReq   : Win32.Bits1;
      cfFormat  : Win32.SHORT;
      rgb       : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;
   for DDEUP use record
      unused    at 0 range  0 .. 11;
      fAck      at 0 range 12 .. 12;
      fRelease  at 0 range 13 .. 13;
      fReserved at 0 range 14 .. 14;
      fAckReq   at 0 range 15 .. 15;
      cfFormat  at 2 range  0 .. 15;
      rgb       at 4 range  0 .. 7;
   end record;

   function DdeSetQualityOfService
     (hwndClient : Win32.Windef.HWND;
      pqosNew    : ac_SECURITY_QUALITY_OF_SERVICE_t;
      pqosPrev   : Win32.Winnt.PSECURITY_QUALITY_OF_SERVICE)
      return Win32.BOOL;

   function ImpersonateDdeClientWindow
     (hWndClient : Win32.Windef.HWND;
      hWndServer : Win32.Windef.HWND)
      return Win32.BOOL;

   function PackDDElParam
     (msg  : Win32.UINT;
      uiLo : Win32.UINT;
      uiHi : Win32.UINT)
      return Win32.LONG;

   function UnpackDDElParam
     (msg    : Win32.UINT;
      lParam : Win32.LONG;
      puiLo  : Win32.PUINT;
      puiHi  : Win32.PUINT)
      return Win32.BOOL;

   function FreeDDElParam
     (msg    : Win32.UINT;
      lParam : Win32.LONG)
      return Win32.BOOL;

   function ReuseDDElParam
     (lParam : Win32.LONG;
      msgIn  : Win32.UINT;
      msgOut : Win32.UINT;
      uiLo   : Win32.UINT;
      uiHi   : Win32.UINT)
      return Win32.LONG;

private

   pragma Convention (C_Pass_By_Copy, DDEACK);
   pragma Convention (C_Pass_By_Copy, DDEADVISE);
   pragma Convention (C_Pass_By_Copy, DDEDATA);
   pragma Convention (C_Pass_By_Copy, DDEPOKE);
   pragma Convention (C_Pass_By_Copy, DDELN);
   pragma Convention (C_Pass_By_Copy, DDEUP);

   pragma Import (Stdcall, DdeSetQualityOfService, "DdeSetQualityOfService");
   pragma Import
     (Stdcall,
      ImpersonateDdeClientWindow,
      "ImpersonateDdeClientWindow");
   pragma Import (Stdcall, PackDDElParam, "PackDDElParam");
   pragma Import (Stdcall, UnpackDDElParam, "UnpackDDElParam");
   pragma Import (Stdcall, FreeDDElParam, "FreeDDElParam");
   pragma Import (Stdcall, ReuseDDElParam, "ReuseDDElParam");

end Win32.Dde;
