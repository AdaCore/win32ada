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

with Win32.Winnt;

package Win32.Lmmsg is

   MSGNAME_NOT_FORWARDED  : constant := 0;
   MSGNAME_FORWARDED_TO   : constant := 16#4#;
   MSGNAME_FORWARDED_FROM : constant := 16#10#;

   type MSG_INFO_0;
   type MSG_INFO_1;

   type PMSG_INFO_0 is access all MSG_INFO_0;
   subtype LPMSG_INFO_0 is PMSG_INFO_0;

   type PMSG_INFO_1 is access all MSG_INFO_1;
   subtype LPMSG_INFO_1 is PMSG_INFO_1;

   type MSG_INFO_0 is record
      msgi0_name : Win32.Winnt.LPTSTR;
   end record;

   type MSG_INFO_1 is record
      msgi1_name         : Win32.Winnt.LPTSTR;
      msgi1_forward_flag : Win32.DWORD;
      msgi1_forward      : Win32.Winnt.LPTSTR;
   end record;

   function NetMessageNameAdd
     (servername : Win32.Winnt.LPTSTR;
      msgname    : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetMessageNameEnum
     (servername    : Win32.Winnt.LPTSTR;
      level         : Win32.DWORD;
      bufptr        : access Win32.PBYTE;
      prefmaxlen    : Win32.DWORD;
      entriesread   : Win32.LPDWORD;
      totalentries  : Win32.LPDWORD;
      resume_handle : Win32.LPDWORD)
      return Win32.DWORD;

   function NetMessageNameGetInfo
     (servername : Win32.Winnt.LPTSTR;
      msgname    : Win32.Winnt.LPTSTR;
      level      : Win32.DWORD;
      bufptr     : access Win32.PBYTE)
      return Win32.DWORD;

   function NetMessageNameDel
     (servername : Win32.Winnt.LPTSTR;
      msgname    : Win32.Winnt.LPTSTR)
      return Win32.DWORD;

   function NetMessageBufferSend
     (servername : Win32.Winnt.LPTSTR;
      msgname    : Win32.Winnt.LPTSTR;
      fromname   : Win32.Winnt.LPTSTR;
      buf        : Win32.LPBYTE;
      buflen     : Win32.DWORD)
      return Win32.DWORD;

private

   pragma Convention (C_Pass_By_Copy, MSG_INFO_0);
   pragma Convention (C_Pass_By_Copy, MSG_INFO_1);

   pragma Import (Stdcall, NetMessageNameAdd, "NetMessageNameAdd");
   pragma Import (Stdcall, NetMessageNameEnum, "NetMessageNameEnum");
   pragma Import (Stdcall, NetMessageNameGetInfo, "NetMessageNameGetInfo");
   pragma Import (Stdcall, NetMessageNameDel, "NetMessageNameDel");
   pragma Import (Stdcall, NetMessageBufferSend, "NetMessageBufferSend");

end Win32.Lmmsg;
