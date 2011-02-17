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
--  Copyright (C) 2000-2011, AdaCore
--
-------------------------------------------------------------------------------

with Win32.Windef;
with Win32.Winnt;
with Interfaces.C;

package Win32.Winsock is

   subtype u_long is Win32.ULONG;

   function "not"
     (uOperand : Interfaces.C.unsigned)
      return Interfaces.C.unsigned renames Interfaces.C."not";

   FD_SETSIZE                : constant := 64;
   IOCPARM_MASK              : constant := 16#7f#;
   IOC_VOID                  : constant := 16#20000000#;
   IOC_OUT                   : constant := 16#40000000#;
   IOC_IN                    : constant := 16#80000000#;
   IOC_INOUT                 : constant := 16#c0000000#;
   IPPROTO_IP                : constant := 0;
   IPPROTO_ICMP              : constant := 1;
   IPPROTO_GGP               : constant := 2;
   IPPROTO_TCP               : constant := 6;
   IPPROTO_PUP               : constant := 12;
   IPPROTO_UDP               : constant := 17;
   IPPROTO_IDP               : constant := 22;
   IPPROTO_ND                : constant := 77;
   IPPROTO_RAW               : constant := 255;
   IPPROTO_MAX               : constant := 256;
   IPPORT_ECHO               : constant := 7;
   IPPORT_DISCARD            : constant := 9;
   IPPORT_SYSTAT             : constant := 11;
   IPPORT_DAYTIME            : constant := 13;
   IPPORT_NETSTAT            : constant := 15;
   IPPORT_FTP                : constant := 21;
   IPPORT_TELNET             : constant := 23;
   IPPORT_SMTP               : constant := 25;
   IPPORT_TIMESERVER         : constant := 37;
   IPPORT_NAMESERVER         : constant := 42;
   IPPORT_WHOIS              : constant := 43;
   IPPORT_MTP                : constant := 57;
   IPPORT_TFTP               : constant := 69;
   IPPORT_RJE                : constant := 77;
   IPPORT_FINGER             : constant := 79;
   IPPORT_TTYLINK            : constant := 87;
   IPPORT_SUPDUP             : constant := 95;
   IPPORT_EXECSERVER         : constant := 512;
   IPPORT_LOGINSERVER        : constant := 513;
   IPPORT_CMDSERVER          : constant := 514;
   IPPORT_EFSSERVER          : constant := 520;
   IPPORT_BIFFUDP            : constant := 512;
   IPPORT_WHOSERVER          : constant := 513;
   IPPORT_ROUTESERVER        : constant := 520;
   IPPORT_RESERVED           : constant := 1024;
   IMPLINK_IP                : constant := 155;
   IMPLINK_LOWEXPER          : constant := 156;
   IMPLINK_HIGHEXPER         : constant := 158;
   IN_CLASSA_NET             : constant := 16#ff000000#;
   IN_CLASSA_NSHIFT          : constant := 24;
   IN_CLASSA_HOST            : constant := 16#ffffff#;
   IN_CLASSA_MAX             : constant := 128;
   IN_CLASSB_NET             : constant := 16#ffff0000#;
   IN_CLASSB_NSHIFT          : constant := 16;
   IN_CLASSB_HOST            : constant := 16#ffff#;
   IN_CLASSB_MAX             : constant := 65536;
   IN_CLASSC_NET             : constant := 16#ffffff00#;
   IN_CLASSC_NSHIFT          : constant := 8;
   IN_CLASSC_HOST            : constant := 16#ff#;
   INADDR_ANY                : constant u_long := 16#0#;
   INADDR_LOOPBACK           : constant := 16#7f000001#;
   INADDR_BROADCAST          : constant u_long := 16#ffffffff#;
   INADDR_NONE               : constant := 16#ffffffff#;
   WSADESCRIPTION_LEN        : constant := 256;
   WSASYS_STATUS_LEN         : constant := 128;
   IP_OPTIONS                : constant := 1;
   IP_MULTICAST_IF           : constant := 2;
   IP_MULTICAST_TTL          : constant := 3;
   IP_MULTICAST_LOOP         : constant := 4;
   IP_ADD_MEMBERSHIP         : constant := 5;
   IP_DROP_MEMBERSHIP        : constant := 6;
   IP_DEFAULT_MULTICAST_TTL  : constant := 1;
   IP_DEFAULT_MULTICAST_LOOP : constant := 1;
   IP_MAX_MEMBERSHIPS        : constant := 20;

   INVALID_SOCKET : constant := Win32.UINT'Last;
   SOCKET_ERROR   : constant := -1;
   SOCK_STREAM    : constant := 1;
   SOCK_DGRAM     : constant := 2;
   SOCK_RAW       : constant := 3;
   SOCK_RDM       : constant := 4;
   SOCK_SEQPACKET : constant := 5;
   SO_DEBUG       : constant := 16#1#;
   SO_ACCEPTCONN  : constant := 16#2#;
   SO_REUSEADDR   : constant := 16#4#;
   SO_KEEPALIVE   : constant := 16#8#;
   SO_DONTROUTE   : constant := 16#10#;
   SO_BROADCAST   : constant := 16#20#;
   SO_USELOOPBACK : constant := 16#40#;
   SO_LINGER      : constant := 16#80#;
   SO_OOBINLINE   : constant := 16#100#;

   SO_DONTLINGER           : constant := not Win32.UINT'(SO_LINGER);
   SO_SNDBUF               : constant := 16#1001#;
   SO_RCVBUF               : constant := 16#1002#;
   SO_SNDLOWAT             : constant := 16#1003#;
   SO_RCVLOWAT             : constant := 16#1004#;
   SO_SNDTIMEO             : constant := 16#1005#;
   SO_RCVTIMEO             : constant := 16#1006#;
   SO_ERROR                : constant := 16#1007#;
   SO_TYPE                 : constant := 16#1008#;
   SO_CONNDATA             : constant := 16#7000#;
   SO_CONNOPT              : constant := 16#7001#;
   SO_DISCDATA             : constant := 16#7002#;
   SO_DISCOPT              : constant := 16#7003#;
   SO_CONNDATALEN          : constant := 16#7004#;
   SO_CONNOPTLEN           : constant := 16#7005#;
   SO_DISCDATALEN          : constant := 16#7006#;
   SO_DISCOPTLEN           : constant := 16#7007#;
   SO_OPENTYPE             : constant := 16#7008#;
   SO_SYNCHRONOUS_ALERT    : constant := 16#10#;
   SO_SYNCHRONOUS_NONALERT : constant := 16#20#;
   SO_MAXDG                : constant := 16#7009#;
   SO_MAXPATHDG            : constant := 16#700a#;
   TCP_NODELAY             : constant := 16#1#;
   TCP_BSDURGENT           : constant := 16#7000#;
   AF_UNSPEC               : constant := 0;
   AF_UNIX                 : constant := 1;
   AF_INET                 : constant := 2;
   AF_IMPLINK              : constant := 3;
   AF_PUP                  : constant := 4;
   AF_CHAOS                : constant := 5;
   AF_IPX                  : constant := 6;
   AF_NS                   : constant := 6;
   AF_ISO                  : constant := 7;
   AF_OSI                  : constant := 7;
   AF_ECMA                 : constant := 8;
   AF_DATAKIT              : constant := 9;
   AF_CCITT                : constant := 10;
   AF_SNA                  : constant := 11;
   AF_DECnet               : constant := 12;
   AF_DLI                  : constant := 13;
   AF_LAT                  : constant := 14;
   AF_HYLINK               : constant := 15;
   AF_APPLETALK            : constant := 16;
   AF_NETBIOS              : constant := 17;
   AF_MAX                  : constant := 18;
   PF_UNSPEC               : constant := 0;
   PF_UNIX                 : constant := 1;
   PF_INET                 : constant := 2;
   PF_IMPLINK              : constant := 3;
   PF_PUP                  : constant := 4;
   PF_CHAOS                : constant := 5;
   PF_NS                   : constant := 6;
   PF_IPX                  : constant := 6;
   PF_ISO                  : constant := 7;
   PF_OSI                  : constant := 7;
   PF_ECMA                 : constant := 8;
   PF_DATAKIT              : constant := 9;
   PF_CCITT                : constant := 10;
   PF_SNA                  : constant := 11;
   PF_DECnet               : constant := 12;
   PF_DLI                  : constant := 13;
   PF_LAT                  : constant := 14;
   PF_HYLINK               : constant := 15;
   PF_APPLETALK            : constant := 16;
   PF_MAX                  : constant := 18;
   SOL_SOCKET              : constant := 16#ffff#;
   SOMAXCONN               : constant := 5;
   MSG_OOB                 : constant := 16#1#;
   MSG_PEEK                : constant := 16#2#;
   MSG_DONTROUTE           : constant := 16#4#;
   MSG_MAXIOVLEN           : constant := 16;
   MSG_PARTIAL             : constant := 16#8000#;
   MAXGETHOSTSTRUCT        : constant := 1024;
   FD_READ                 : constant := 16#1#;
   FD_WRITE                : constant := 16#2#;
   FD_OOB                  : constant := 16#4#;
   FD_ACCEPT               : constant := 16#8#;
   FD_CONNECT              : constant := 16#10#;
   FD_CLOSE                : constant := 16#20#;
   WSABASEERR              : constant := 10000;
   WSAEINTR                : constant := 10004;
   WSAEBADF                : constant := 10009;
   WSAEACCES               : constant := 10013;
   WSAEFAULT               : constant := 10014;
   WSAEINVAL               : constant := 10022;
   WSAEMFILE               : constant := 10024;
   WSAEWOULDBLOCK          : constant := 10035;
   WSAEINPROGRESS          : constant := 10036;
   WSAEALREADY             : constant := 10037;
   WSAENOTSOCK             : constant := 10038;
   WSAEDESTADDRREQ         : constant := 10039;
   WSAEMSGSIZE             : constant := 10040;
   WSAEPROTOTYPE           : constant := 10041;
   WSAENOPROTOOPT          : constant := 10042;
   WSAEPROTONOSUPPORT      : constant := 10043;
   WSAESOCKTNOSUPPORT      : constant := 10044;
   WSAEOPNOTSUPP           : constant := 10045;
   WSAEPFNOSUPPORT         : constant := 10046;
   WSAEAFNOSUPPORT         : constant := 10047;
   WSAEADDRINUSE           : constant := 10048;
   WSAEADDRNOTAVAIL        : constant := 10049;
   WSAENETDOWN             : constant := 10050;
   WSAENETUNREACH          : constant := 10051;
   WSAENETRESET            : constant := 10052;
   WSAECONNABORTED         : constant := 10053;
   WSAECONNRESET           : constant := 10054;
   WSAENOBUFS              : constant := 10055;
   WSAEISCONN              : constant := 10056;
   WSAENOTCONN             : constant := 10057;
   WSAESHUTDOWN            : constant := 10058;
   WSAETOOMANYREFS         : constant := 10059;
   WSAETIMEDOUT            : constant := 10060;
   WSAECONNREFUSED         : constant := 10061;
   WSAELOOP                : constant := 10062;
   WSAENAMETOOLONG         : constant := 10063;
   WSAEHOSTDOWN            : constant := 10064;
   WSAEHOSTUNREACH         : constant := 10065;
   WSAENOTEMPTY            : constant := 10066;
   WSAEPROCLIM             : constant := 10067;
   WSAEUSERS               : constant := 10068;
   WSAEDQUOT               : constant := 10069;
   WSAESTALE               : constant := 10070;
   WSAEREMOTE              : constant := 10071;
   WSAEDISCON              : constant := 10101;
   WSASYSNOTREADY          : constant := 10091;
   WSAVERNOTSUPPORTED      : constant := 10092;
   WSANOTINITIALISED       : constant := 10093;
   WSAHOST_NOT_FOUND       : constant := 11001;
   HOST_NOT_FOUND          : constant := 11001;
   WSATRY_AGAIN            : constant := 11002;
   TRY_AGAIN               : constant := 11002;
   WSANO_RECOVERY          : constant := 11003;
   NO_RECOVERY             : constant := 11003;
   WSANO_DATA              : constant := 11004;
   NO_DATA                 : constant := 11004;
   WSANO_ADDRESS           : constant := 11004;
   NO_ADDRESS              : constant := 11004;

   subtype u_char is Win32.UCHAR;
   subtype u_short is Win32.USHORT;
   subtype u_int is Win32.UINT;
   type SOCKET is mod 2 ** Standard'Address_Size;

   type SOCKET_Array is array (Integer range 0 .. FD_SETSIZE - 1) of SOCKET;

   type FD_SET;
   type TIMEVAL;
   type HOSTENT;
   type netent;
   type SERVENT;
   type PROTOENT;
   type struct_anonymous1_t;
   type struct_anonymous2_t;
   type union_anonymous3_t;
   type IN_ADDR;
   type SOCKADDR_IN;
   type WSADATA;
   type ip_mreq;
   type SOCKADDR;
   type sockproto;
   type LINGER;

   type LPWSADATA is access all WSADATA;

   type ac_SOCKADDR_t is access all SOCKADDR;
   type PSOCKADDR is access all SOCKADDR;
   subtype LPSOCKADDR is PSOCKADDR;

   type PSOCKADDR_IN is access all SOCKADDR_IN;
   subtype LPSOCKADDR_IN is PSOCKADDR_IN;

   type PLINGER is access all LINGER;
   subtype LPLINGER is PLINGER;

   type PIN_ADDR is access all IN_ADDR;
   subtype LPIN_ADDR is PIN_ADDR;

   type PFD_SET is access all FD_SET;
   subtype LPFD_SET is PFD_SET;

   type PHOSTENT is access all HOSTENT;
   subtype LPHOSTENT is PHOSTENT;

   type PSERVENT is access all SERVENT;
   subtype LPSERVENT is PSERVENT;

   type PPROTOENT is access all PROTOENT;
   subtype LPPROTOENT is PPROTOENT;

   type ac_TIMEVAL_t is access all TIMEVAL;
   type PTIMEVAL is access all TIMEVAL;
   subtype LPTIMEVAL is PTIMEVAL;

   type FD_SET is record
      fd_count : u_int;
      fd_array : SOCKET_Array;
   end record;

   type TIMEVAL is record
      tv_sec  : Win32.LONG;
      tv_usec : Win32.LONG;
   end record;

   type PPCHAR is access all Win32.PSTR;

   type HOSTENT is record
      h_name      : Win32.PSTR;
      h_aliases   : PPCHAR;
      h_addrtype  : Win32.SHORT;
      h_length    : Win32.SHORT;
      h_addr_list : PPCHAR;
   end record;

   type netent is record
      n_name     : Win32.PSTR;
      n_aliases  : PPCHAR;
      n_addrtype : Win32.SHORT;
      n_net      : u_long;
   end record;

   type SERVENT is record
      s_name    : Win32.PSTR;
      s_aliases : PPCHAR;
      s_port    : Win32.SHORT;
      s_proto   : Win32.PSTR;
   end record;

   type PROTOENT is record
      p_name    : Win32.PSTR;
      p_aliases : PPCHAR;
      p_proto   : Win32.SHORT;
   end record;

   type struct_anonymous1_t is record
      s_b1 : u_char;
      s_b2 : u_char;
      s_b3 : u_char;
      s_b4 : u_char;
   end record;

   type struct_anonymous2_t is record
      s_w1 : u_short;
      s_w2 : u_short;
   end record;

   type union_anonymous3_t_kind is (S_un_b_kind, S_un_w_kind, S_addr_kind);

   type union_anonymous3_t (Which : union_anonymous3_t_kind := S_un_b_kind) is
      record
         case Which is
            when S_un_b_kind =>
               S_un_b : struct_anonymous1_t;
            when S_un_w_kind =>
               S_un_w : struct_anonymous2_t;
            when S_addr_kind =>
               S_addr : u_long;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous3_t);

   pragma Unchecked_Union (union_anonymous3_t);

   type IN_ADDR is record
      S_un : union_anonymous3_t;
   end record;

   type SOCKADDR_IN is record
      sin_family : Win32.SHORT;
      sin_port   : u_short;
      sin_addr   : IN_ADDR;
      sin_zero   : Win32.CHAR_Array (0 .. 7);
   end record;

   type WSADATA is record
      wVersion       : Win32.WORD;
      wHighVersion   : Win32.WORD;
      szDescription  : Win32.CHAR_Array (0 .. WSADESCRIPTION_LEN);
      szSystemStatus : Win32.CHAR_Array (0 .. WSASYS_STATUS_LEN);
      iMaxSockets    : Win32.USHORT;
      iMaxUdpDg      : Win32.USHORT;
      lpVendorInfo   : Win32.PSTR;
   end record;

   type ip_mreq is record
      imr_multiaddr : IN_ADDR;
      imr_interface : IN_ADDR;
   end record;

   type SOCKADDR is record
      sa_family : u_short;
      sa_data   : Win32.CHAR_Array (0 .. 13);
   end record;

   type sockproto is record
      sp_family   : u_short;
      sp_protocol : u_short;
   end record;

   type LINGER is record
      l_onoff  : u_short;
      l_linger : u_short;
   end record;

   function WSAFDIsSet (fd : SOCKET; set : access FD_SET) return Win32.INT;

   procedure FD_CLR (fd : SOCKET; set : access FD_SET);

   procedure FD_SET_PROC (fd : SOCKET; set : access FD_SET);

   function FD_ISSET (fd : SOCKET; set : access FD_SET) return Win32.INT
      renames WSAFDIsSet;

   function timerisset (tvp : access TIMEVAL) return Win32.BOOL;

   type LPCMPFN is access function
     (left, right : Win32.LONG)
      return Boolean;

   function timercmp
     (tvp  : access TIMEVAL;
      uvp  : access TIMEVAL;
      cmp  : LPCMPFN)
      return Win32.BOOL;
   pragma Convention (Stdcall, LPCMPFN);

   procedure timerclear (tvp : access TIMEVAL);

   function FIONREAD return Win32.LONG;
   function FIONBIO return Win32.LONG;
   function FIOASYNC return Win32.LONG;
   function SIOCSHIWAT return Win32.LONG;
   function SIOCGHIWAT return Win32.LONG;
   function SIOCSLOWAT return Win32.LONG;
   function SIOCGLOWAT return Win32.LONG;
   function SIOCATMARK return Win32.LONG;

   function IN_CLASSA (i : Win32.LONG) return Win32.BOOL;

   function IN_CLASSB (i : Win32.LONG) return Win32.BOOL;

   function IN_CLASSC (i : Win32.LONG) return Win32.BOOL;

   function c_accept
     (s       : SOCKET;
      addr    : access SOCKADDR;
      addrlen : access Win32.INT)
      return SOCKET;

   function bind
     (s       : SOCKET;
      addr    : ac_SOCKADDR_t;
      namelen : Win32.INT)
      return Win32.INT;

   function closesocket (s : SOCKET) return Win32.INT;

   function connect
     (s       : SOCKET;
      name    : ac_SOCKADDR_t;
      namelen : Win32.INT)
      return Win32.INT;

   function ioctlsocket
     (s    : SOCKET;
      cmd  : Win32.LONG;
      argp : access Win32.ULONG)
      return Win32.INT;

   function getpeername
     (s       : SOCKET;
      name    : access SOCKADDR;
      namelen : access Win32.INT)
      return Win32.INT;

   function getsockname
     (s       : SOCKET;
      name    : access SOCKADDR;
      namelen : access Win32.INT)
      return Win32.INT;

   function getsockopt
     (s       : SOCKET;
      level   : Win32.INT;
      optname : Win32.INT;
      optval  : Win32.PSTR;
      optlen  : access Win32.INT)
      return Win32.INT;

   function htonl (hostlong : u_long) return u_long;

   function htons (hostshort : u_short) return u_short;

   function inet_addr (cp : Win32.PCSTR) return Win32.ULONG;

   function inet_ntoa (c_in : IN_ADDR) return Win32.PSTR;

   function listen (s : SOCKET; backlog : Win32.INT) return Win32.INT;

   function ntohl (netlong : u_long) return u_long;

   function ntohs (netshort : u_short) return u_short;

   function recv
     (s     : SOCKET;
      buf   : Win32.PSTR;
      len   : Win32.INT;
      flags : Win32.INT)
      return Win32.INT;

   function recvfrom
     (s       : SOCKET;
      buf     : Win32.PSTR;
      len     : Win32.INT;
      flags   : Win32.INT;
      from    : access SOCKADDR;
      fromlen : access Win32.INT)
      return Win32.INT;

   function c_select
     (nfds      : Win32.INT;
      readfds   : access FD_SET;
      writefds  : access FD_SET;
      exceptfds : access FD_SET;
      timeout   : ac_TIMEVAL_t)
      return Win32.INT;

   function send
     (s     : SOCKET;
      buf   : Win32.PCSTR;
      len   : Win32.INT;
      flags : Win32.INT)
      return Win32.INT;

   function sendto
     (s     : SOCKET;
      buf   : Win32.PCSTR;
      len   : Win32.INT;
      flags : Win32.INT;
      to    : ac_SOCKADDR_t;
      tolen : Win32.INT)
      return Win32.INT;

   function setsockopt
     (s       : SOCKET;
      level   : Win32.INT;
      optname : Win32.INT;
      optval  : Win32.PCSTR;
      optlen  : Win32.INT)
      return Win32.INT;

   function shutdown (s : SOCKET; how : Win32.INT) return Win32.INT;

   function socket_func
     (af       : Win32.INT;
      c_type   : Win32.INT;
      protocol : Win32.INT)
      return SOCKET;

   function gethostbyaddr
     (addr   : Win32.PCSTR;
      len    : Win32.INT;
      c_type : Win32.INT)
      return PHOSTENT;

   function gethostbyname (name : Win32.PCSTR) return PHOSTENT;

   function gethostname
     (name    : Win32.PSTR;
      namelen : Win32.INT)
      return Win32.INT;

   function getservbyport
     (port  : Win32.INT;
      proto : Win32.PCSTR)
      return PSERVENT;

   function getservbyname
     (name  : Win32.PCSTR;
      proto : Win32.PCSTR)
      return PSERVENT;

   function getprotobynumber (proto : Win32.INT) return PPROTOENT;

   function getprotobyname (name : Win32.PCSTR) return PPROTOENT;

   function WSAStartup
     (wVersionRequired : Win32.WORD;
      lpWSAData        : Win32.Winsock.LPWSADATA)
      return Win32.INT;

   function WSACleanup return Win32.INT;

   procedure WSASetLastError (iError : Win32.INT);

   function WSAGetLastError return Win32.INT;

   function h_errno return Win32.INT renames WSAGetLastError;

   function WSAIsBlocking return Win32.BOOL;

   function WSAUnhookBlockingHook return Win32.INT;

   function WSASetBlockingHook
     (lpBlockFunc : Win32.Windef.FARPROC)
      return Win32.Windef.FARPROC;

   function WSACancelBlockingCall return Win32.INT;

   function WSAAsyncGetServByName
     (hWnd   : Win32.Windef.HWND;
      wMsg   : u_int;
      name   : Win32.PCSTR;
      proto  : Win32.PCSTR;
      buf    : Win32.PSTR;
      buflen : Win32.INT)
      return Win32.Winnt.HANDLE;

   function WSAAsyncGetServByPort
     (hWnd   : Win32.Windef.HWND;
      wMsg   : u_int;
      port   : Win32.INT;
      proto  : Win32.PCSTR;
      buf    : Win32.PSTR;
      buflen : Win32.INT)
      return Win32.Winnt.HANDLE;

   function WSAAsyncGetProtoByName
     (hWnd   : Win32.Windef.HWND;
      wMsg   : u_int;
      name   : Win32.PCSTR;
      buf    : Win32.PSTR;
      buflen : Win32.INT)
      return Win32.Winnt.HANDLE;

   function WSAAsyncGetProtoByNumber
     (hWnd   : Win32.Windef.HWND;
      wMsg   : u_int;
      number : Win32.INT;
      buf    : Win32.PSTR;
      buflen : Win32.INT)
      return Win32.Winnt.HANDLE;

   function WSAAsyncGetHostByName
     (hWnd   : Win32.Windef.HWND;
      wMsg   : u_int;
      name   : Win32.PCSTR;
      buf    : Win32.PSTR;
      buflen : Win32.INT)
      return Win32.Winnt.HANDLE;

   function WSAAsyncGetHostByAddr
     (hWnd   : Win32.Windef.HWND;
      wMsg   : u_int;
      addr   : Win32.PCSTR;
      len    : Win32.INT;
      c_type : Win32.INT;
      buf    : Win32.PSTR;
      buflen : Win32.INT)
      return Win32.Winnt.HANDLE;

   function WSACancelAsyncRequest
     (hAsyncTaskHandle : Win32.Winnt.HANDLE)
      return Win32.INT;

   function WSAAsyncSelect
     (s      : SOCKET;
      hWnd   : Win32.Windef.HWND;
      wMsg   : u_int;
      lEvent : Win32.LONG)
      return Win32.INT;

   function WSARecvEx
     (s     : SOCKET;
      buf   : Win32.PSTR;
      len   : Win32.INT;
      flags : access Win32.INT)
      return Win32.INT;

private

   pragma Convention (C, FD_SET);
   pragma Convention (C_Pass_By_Copy, TIMEVAL);
   pragma Convention (C_Pass_By_Copy, HOSTENT);
   pragma Convention (C_Pass_By_Copy, netent);
   pragma Convention (C_Pass_By_Copy, SERVENT);
   pragma Convention (C_Pass_By_Copy, PROTOENT);
   pragma Convention (C_Pass_By_Copy, struct_anonymous1_t);
   pragma Convention (C_Pass_By_Copy, struct_anonymous2_t);
   pragma Convention (C_Pass_By_Copy, IN_ADDR);

   pragma Convention (C_Pass_By_Copy, SOCKADDR_IN);
   pragma Convention (C, WSADATA);
   pragma Convention (C_Pass_By_Copy, ip_mreq);
   pragma Convention (C_Pass_By_Copy, SOCKADDR);
   pragma Convention (C_Pass_By_Copy, sockproto);
   pragma Convention (C_Pass_By_Copy, LINGER);

   pragma Import (Stdcall, WSAFDIsSet, "__WSAFDIsSet");
   pragma Import (Stdcall, c_accept, "accept");
   pragma Import (Stdcall, bind, "bind");
   pragma Import (Stdcall, closesocket, "closesocket");
   pragma Import (Stdcall, connect, "connect");
   pragma Import (Stdcall, ioctlsocket, "ioctlsocket");
   pragma Import (Stdcall, getpeername, "getpeername");
   pragma Import (Stdcall, getsockname, "getsockname");
   pragma Import (Stdcall, getsockopt, "getsockopt");
   pragma Import (Stdcall, htonl, "htonl");
   pragma Import (Stdcall, htons, "htons");
   pragma Import (Stdcall, inet_addr, "inet_addr");
   pragma Import (Stdcall, inet_ntoa, "inet_ntoa");
   pragma Import (Stdcall, listen, "listen");
   pragma Import (Stdcall, ntohl, "ntohl");
   pragma Import (Stdcall, ntohs, "ntohs");
   pragma Import (Stdcall, recv, "recv");
   pragma Import (Stdcall, recvfrom, "recvfrom");
   pragma Import (Stdcall, c_select, "select");
   pragma Import (Stdcall, send, "send");
   pragma Import (Stdcall, sendto, "sendto");
   pragma Import (Stdcall, setsockopt, "setsockopt");
   pragma Import (Stdcall, shutdown, "shutdown");
   pragma Import (Stdcall, socket_func, "socket");
   pragma Import (Stdcall, gethostbyaddr, "gethostbyaddr");
   pragma Import (Stdcall, gethostbyname, "gethostbyname");
   pragma Import (Stdcall, gethostname, "gethostname");
   pragma Import (Stdcall, getservbyport, "getservbyport");
   pragma Import (Stdcall, getservbyname, "getservbyname");
   pragma Import (Stdcall, getprotobynumber, "getprotobynumber");
   pragma Import (Stdcall, getprotobyname, "getprotobyname");
   pragma Import (Stdcall, WSAStartup, "WSAStartup");
   pragma Import (Stdcall, WSACleanup, "WSACleanup");
   pragma Import (Stdcall, WSASetLastError, "WSASetLastError");
   pragma Import (Stdcall, WSAGetLastError, "WSAGetLastError");
   pragma Import (Stdcall, WSAIsBlocking, "WSAIsBlocking");
   pragma Import (Stdcall, WSAUnhookBlockingHook, "WSAUnhookBlockingHook");
   pragma Import (Stdcall, WSASetBlockingHook, "WSASetBlockingHook");
   pragma Import (Stdcall, WSACancelBlockingCall, "WSACancelBlockingCall");
   pragma Import (Stdcall, WSAAsyncGetServByName, "WSAAsyncGetServByName");
   pragma Import (Stdcall, WSAAsyncGetServByPort, "WSAAsyncGetServByPort");
   pragma Import (Stdcall, WSAAsyncGetProtoByName, "WSAAsyncGetProtoByName");
   pragma Import
     (Stdcall,
      WSAAsyncGetProtoByNumber,
      "WSAAsyncGetProtoByNumber");
   pragma Import (Stdcall, WSAAsyncGetHostByName, "WSAAsyncGetHostByName");
   pragma Import (Stdcall, WSAAsyncGetHostByAddr, "WSAAsyncGetHostByAddr");
   pragma Import (Stdcall, WSACancelAsyncRequest, "WSACancelAsyncRequest");
   pragma Import (Stdcall, WSAAsyncSelect, "WSAAsyncSelect");
   pragma Import (Stdcall, WSARecvEx, "WSARecvEx");

end Win32.Winsock;
