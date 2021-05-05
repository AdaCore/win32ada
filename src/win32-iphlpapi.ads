with Win32.Winnt; use Win32.Winnt;

package Win32.Iphlpapi is

   pragma Linker_Options ("-lIphlpapi");

   subtype IPAddr is ULONG;
   subtype IP_STATUS is ULONG;

   type IP_OPTION_INFORMATION is
      record
         Ttl         : UCHAR;
         Tos         : UCHAR;
         Flags       : UCHAR;
         OptionsSize : UCHAR;
         OptionsData : PUCHAR;
      end record;
   pragma Convention (C, IP_OPTION_INFORMATION);

   type PIP_OPTION_INFORMATION is access all IP_OPTION_INFORMATION;

   type ICMP_ECHO_REPLY is
      record
         Address       : IPAddr;
         Status        : ULONG;
         RoundTripTime : ULONG;
         DataSize      : USHORT;
         Reserved      : USHORT;
         Data          : PVOID;
         Options       : IP_OPTION_INFORMATION;
      end record;
   pragma Convention (C, ICMP_ECHO_REPLY);

   type PICMP_ECHO_REPLY is access all ICMP_ECHO_REPLY;

   function IcmpCreateFile
      return HANDLE with
      Import,
      Convention => Stdcall,
      Link_Name  => "IcmpCreateFile";

   function IcmpSendEcho
     (IcmpHandle         : HANDLE;
      DestinationAddress : IPAddr;
      RequestData        : LPVOID;
      RequestSize        : WORD;
      RequestOptions     : PIP_OPTION_INFORMATION;
      ReplyBuffer        : LPVOID;
      ReplySize          : DWORD;
      Timeout            : DWORD)
      return DWORD with
      Import,
      Convention => Stdcall,
      Link_Name  => "IcmpSendEcho";

   function IcmpCloseHandle
     (IcmpHandle : HANDLE)
      return BOOL with
      Import,
      Convention => Stdcall,
      Link_Name  => "IcmpCloseHandle";

   function GetIpErrorString
     (ErrorCode : IP_STATUS;
      Buffer    : PWSTR;
      Size      : PDWORD)
      return DWORD with
      Import,
      Convention => Stdcall,
      Link_Name  => "GetIpErrorString";

end Win32.Iphlpapi;
