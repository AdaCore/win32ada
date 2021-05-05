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
--  Copyright (C) 2000-2019, AdaCore
--
-------------------------------------------------------------------------------

with Win32.Winnt;

package Win32.Iphlpapi is
   pragma Linker_Options ("-lIphlpapi");

   use Win32.Winnt;

   subtype IPAddr is ULONG;
   subtype IP_STATUS is ULONG;

   type IP_OPTION_INFORMATION is record
      Ttl         : UCHAR;
      Tos         : UCHAR;
      Flags       : UCHAR;
      OptionsSize : UCHAR;
      OptionsData : PUCHAR;
   end record;

   type PIP_OPTION_INFORMATION is access all IP_OPTION_INFORMATION;

   type ICMP_ECHO_REPLY is record
      Address       : IPAddr;
      Status        : ULONG;
      RoundTripTime : ULONG;
      DataSize      : USHORT;
      Reserved      : USHORT;
      Data          : PVOID;
      Options       : IP_OPTION_INFORMATION;
   end record;

   type PICMP_ECHO_REPLY is access all ICMP_ECHO_REPLY;

   function IcmpCreateFile
      return HANDLE;

   function IcmpSendEcho
     (IcmpHandle         : HANDLE;
      DestinationAddress : IPAddr;
      RequestData        : LPVOID;
      RequestSize        : WORD;
      RequestOptions     : PIP_OPTION_INFORMATION;
      ReplyBuffer        : LPVOID;
      ReplySize          : DWORD;
      Timeout            : DWORD)
      return DWORD;

   function IcmpCloseHandle
     (IcmpHandle : HANDLE)
      return BOOL;

   function GetIpErrorString
     (ErrorCode : IP_STATUS;
      Buffer    : PWSTR;
      Size      : PDWORD)
      return DWORD;

private
   pragma Convention (C, IP_OPTION_INFORMATION);
   pragma Convention (C, ICMP_ECHO_REPLY);

   pragma Import (Stdcall, IcmpCreateFile, "IcmpCreateFile");
   pragma Import (Stdcall, IcmpSendEcho, "IcmpSendEcho");
   pragma Import (Stdcall, IcmpCloseHandle, "IcmpCloseHandle");
   pragma Import (Stdcall, GetIpErrorString, "GetIpErrorString");

end Win32.Iphlpapi;
