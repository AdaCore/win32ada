with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with Win32.Winnt;
with Win32.Rpcdce;
package Win32.Winsock.RIO is

   pragma Linker_Options ("-lws2_32");
   pragma Linker_Options ("-lntdll");

   type WSAOVERLAPPED is
      record
         Internal     : DWORD;
         InternalHigh : DWORD;
         Offset       : DWORD;
         OffsetHigh   : DWORD;
         hEvent       : Win32.Winnt.HANDLE;
      end record;
   type LPWSAOVERLAPPED is access WSAOVERLAPPED;
   type LPWSAOVERLAPPED_COMPLETION_ROUTINE is access
      procedure (dwError       : DWORD;
                 cbTransferred : DWORD;
                 lpOverlapped  : LPWSAOVERLAPPED;
                 dwFlags       : DWORD);
   pragma Convention (Stdcall, LPWSAOVERLAPPED_COMPLETION_ROUTINE);

   MAX_PROTOCOL_CHAIN : constant := 7;
   type WSAPROTOCOLCHAIN is
      record
         ChainLen     : Interfaces.C.int;
         ChainEntries : DWORD_Array (1 .. MAX_PROTOCOL_CHAIN);
      end record;

   WSAPROTOCOL_LEN : constant := 255;
   type WSAPROTOCOL_INFOA is
      record
         dwServiceFlags1    : DWORD;
         dwServiceFlags2    : DWORD;
         dwServiceFlags3    : DWORD;
         dwServiceFlags4    : DWORD;
         dwProviderFlags    : DWORD;
         ProviderId         : Win32.Rpcdce.GUID;
         dwCatalogEntryId   : DWORD;
         ProtocolChain      : WSAPROTOCOLCHAIN;
         iVersion           : Interfaces.C.int;
         iAddressFamily     : Interfaces.C.int;
         iMaxSockAddr       : Interfaces.C.int;
         iMinSockAddr       : Interfaces.C.int;
         iSocketType        : Interfaces.C.int;
         iProtocol          : Interfaces.C.int;
         iProtocolMaxOffset : Interfaces.C.int;
         iNetworkByteOrder  : Interfaces.C.int;
         iSecurityScheme    : Interfaces.C.int;
         dwMessageSize      : DWORD;
         dwProviderReserved : DWORD;
         szProtocol         : CHAR_Array (1 .. WSAPROTOCOL_LEN + 1);
      end record;
   type LPWSAPROTOCOL_INFOA is access WSAPROTOCOL_INFOA;

   type WSAPROTOCOL_INFOW is
      record
         dwServiceFlags1    : DWORD;
         dwServiceFlags2    : DWORD;
         dwServiceFlags3    : DWORD;
         dwServiceFlags4    : DWORD;
         dwProviderFlags    : DWORD;
         ProviderId         : Win32.Rpcdce.GUID;
         dwCatalogEntryId   : DWORD;
         ProtocolChain      : WSAPROTOCOLCHAIN;
         iVersion           : Interfaces.C.int;
         iAddressFamily     : Interfaces.C.int;
         iMaxSockAddr       : Interfaces.C.int;
         iMinSockAddr       : Interfaces.C.int;
         iSocketType        : Interfaces.C.int;
         iProtocol          : Interfaces.C.int;
         iProtocolMaxOffset : Interfaces.C.int;
         iNetworkByteOrder  : Interfaces.C.int;
         iSecurityScheme    : Interfaces.C.int;
         dwMessageSize      : DWORD;
         dwProviderReserved : DWORD;
         szProtocol         : WCHAR_Array (1 .. WSAPROTOCOL_LEN + 1);
      end record;
   type LPWSAPROTOCOL_INFOW is access WSAPROTOCOL_INFOW;

--  #define WSAID_MULTIPLE_RIO /* 8509e081-96dd-4005-b165-9e2ee8c79e3f */ \
--     {0x8509e081,0x96dd,0x4005,{0xb1,0x65,0x9e,0x2e,0xe8,0xc7,0x9e,0x3f}}
   WSAID_MULTIPLE_RIO : constant Win32.Rpcdce.GUID :=
      (16#8509e081#, 16#96dd#, 16#4005#,
       (CHAR'Val (16#b1#), CHAR'Val (16#65#),
        CHAR'Val (16#9e#), CHAR'Val (16#2e#),
        CHAR'Val (16#e8#), CHAR'Val (16#c7#),
        CHAR'Val (16#9e#), CHAR'Val (16#3f#)));
   IOC_OUT : constant := 16#40000000#;
   IOC_IN : constant := 16#80000000#;
   IOC_INOUT : constant := IOC_IN + IOC_OUT;
   IOC_WS2 : constant := 16#08000000#;
   SIO_GET_MULTIPLE_EXTENSION_FUNCTION_POINTER : constant DWORD :=
     IOC_INOUT or IOC_WS2 or 36;
   WSA_FLAG_OVERLAPPED : constant := 1;
   WSA_FLAG_REGISTERED_IO : constant := 16#100#;
   WSA_IO_PENDING : constant := 997;

   type RIO_RQ is new Win32.Winnt.HANDLE;
   type RIO_CQ is new Win32.Winnt.HANDLE;
   type RIO_BUFFERID is new Win32.Winnt.HANDLE;
   function To_Handle is
     new Ada.Unchecked_Conversion (ULONG_PTR, Win32.Winnt.HANDLE);
   RIO_INVALID_BUFFERID : constant RIO_BUFFERID :=
     RIO_BUFFERID (To_Handle (16#FFFFFFFF#));
   RIO_INVALID_CQ : constant RIO_CQ := RIO_CQ (To_Handle (0));
   RIO_INVALID_RQ : constant RIO_RQ := RIO_RQ (To_Handle (0));
   RIO_CORRUPT_CQ : constant ULONG := 16#FFFFFFFF#;

   SIZEOF_sin_family    : constant := 16;
   type sa_family_t is mod 2 ** SIZEOF_sin_family;
   for sa_family_t'Size use SIZEOF_sin_family;

   type In6_Addr is array (1 .. 8) of Interfaces.Unsigned_16;
   pragma Convention (C, In6_Addr);

   type SOCKADDR_IN6 is record
      Family   : sa_family_t := 0;
      Port     : Interfaces.C.unsigned_short := 0;
      FlowInfo : Interfaces.Unsigned_32 := 0;
      Addr     : In6_Addr := (others => 0);
      Scope_Id : Interfaces.Unsigned_32 := 0;
   end record;
   pragma Convention (C, SOCKADDR_IN6);

   type SOCKADDR_INET (Unkind : Integer := 1) is
      record
         case Unkind is
            when 1 => Ipv4 : SOCKADDR_IN;
            when 2 => Ipv6 : SOCKADDR_IN6;
            when others => si_family : Win32.SHORT;
         end case;
      end record;
   pragma Unchecked_Union (SOCKADDR_INET);

   type RIO_BUF is
      record
         BufferId : RIO_BUFFERID;
         Offset   : Integer;
         Length   : Integer;
      end record;
   type PRIO_BUF is access RIO_BUF;
   type RIO_NOTIFICATION_COMPLETION_TYPE is
      (RIO_INVALID, RIO_EVENT_COMPLETION, RIO_IOCP_COMPLETION) with Size => 32;
   type RIO_NOTIFICATION_COMPLETION
     (Typ : RIO_NOTIFICATION_COMPLETION_TYPE :=
        RIO_NOTIFICATION_COMPLETION_TYPE'First) is
      record
         case Typ is
            when RIO_INVALID | RIO_EVENT_COMPLETION =>
               EventHandle   : Win32.Winnt.HANDLE;
               NotifyReset   : BOOL;
            when RIO_IOCP_COMPLETION =>
               IocpHandle    : Win32.Winnt.HANDLE;
               CompletionKey : PVOID;
               Overlapped    : PVOID;
         end case;
      end record;
   type PRIO_NOTIFICATION_COMPLETION is access RIO_NOTIFICATION_COMPLETION;

   type RIORESULT is
      record
         Status           : LONG;
         BytesTransferred : Integer;
         SocketContext    : ULONGLONG;
         RequestContext   : ULONGLONG;
      end record;
   type PRIORESULT is access RIORESULT;

   type LPFN_RIOCREATEREQUESTQUEUE is access
      function (Sockt                 : SOCKET;
                MaxOutstandingReceive : ULONG;
                MaxReceiveDataBuffers : ULONG;
                MaxOutstandingSend    : ULONG;
                MaxSendDataBuffers    : ULONG;
                ReceiveCQ             : RIO_CQ;
                SendCQ                : RIO_CQ;
                SocketContext         : PVOID) return RIO_RQ;
   pragma Convention (Stdcall, LPFN_RIOCREATEREQUESTQUEUE);

   function RtlIpv4StringToAddressExA
     (AddressString  : PCSTR;
      Strict         : BOOL;
      Address        : access IN_ADDR;
      Port           : access USHORT) return NTSTATUS;
   pragma Import (Stdcall, RtlIpv4StringToAddressExA,
                  "RtlIpv4StringToAddressExA");

   function WSAEnumProtocolsA (lpiProtocols     : LPINT;
                               lpProtocolBuffer : LPWSAPROTOCOL_INFOA;
                               lpdwBufferLength : LPDWORD)
                               return Interfaces.C.int;
   pragma Import (Stdcall, WSAEnumProtocolsA, "WSAEnumProtocolsA");

   function WSCEnumProtocols (lpiProtocols     : LPINT;
                              lpProtocolBuffer : LPWSAPROTOCOL_INFOW;
                              lpdwBufferLength : LPDWORD;
                              lpErrno          : LPINT)
                              return Interfaces.C.int;
   pragma Import (Stdcall, WSCEnumProtocols, "WSCEnumProtocols");

   function WSASocketA (af             : Win32.INT;
                        typ            : Win32.INT;
                        protocol       : INT;
                        lpProtocolInfo : LPWSAPROTOCOL_INFOA;
                        g              : DWORD;
                        dwFlags        : DWORD) return SOCKET;
   pragma Import (Stdcall, WSASocketA, "WSASocketA");

   function WSAIoctl (s : SOCKET;
                      dwIoControlCode : DWORD;
                      lpvInBuffer : LPVOID;
                      cbInBuffer : DWORD;
                      lpvOutBuffer : LPVOID;
                      cbOutBuffer : DWORD;
                      lpcbBytesReturned : access DWORD;
                      lpOverlapped : LPWSAOVERLAPPED;
                      lpCompletionRoutine : LPWSAOVERLAPPED_COMPLETION_ROUTINE)
                      return Interfaces.C.int;
   pragma Import (Stdcall, WSAIoctl, "WSAIoctl");

   type WSABUF is
      record
         Len : ULONG;
         Buf : PCHAR;
      end record;
   pragma Convention (C, WSABUF);
   type LPWSABUF is access WSABUF;

   function WSASendTo
     (s                   : SOCKET;
      lpBuffers           : LPWSABUF;
      dwBufferCount       : DWORD;
      lpNumberOfBytesSent : LPDWORD;
      dwFlags             : DWORD;
      lpTo                : access SOCKADDR;
      iTolen              : Interfaces.C.int;
      lpOverlapped        : LPWSAOVERLAPPED;
      lpCompletionRoutine : LPWSAOVERLAPPED_COMPLETION_ROUTINE)
      return Interfaces.C.int;
   pragma Import (Stdcall, WSASendTo, "WSASendTo");

   type LPFN_RIORECEIVE is access function (SocketQueue     : RIO_RQ;
                                            pData           : PRIO_BUF;
                                            DataBufferCount : ULONG;
                                            Flags           : DWORD;
                                            RequestContext  : PVOID)
                                            return BOOL;
   pragma Convention (Stdcall, LPFN_RIORECEIVE);

   type LPFN_RIORECEIVEEX is access function (SocketQueue     : RIO_RQ;
                                              pData           : PRIO_BUF;
                                              DataBufferCount : ULONG;
                                              pLocalAddress   : PRIO_BUF;
                                              pRemoteAddress  : PRIO_BUF;
                                              pControlContext : PRIO_BUF;
                                              pFlags          : PRIO_BUF;
                                              Flags           : DWORD;
                                              RequestContext  : PVOID)
                                              return Integer;
   pragma Convention (Stdcall, LPFN_RIORECEIVEEX);

   type LPFN_RIOSEND is access function (SocketQueue     : RIO_RQ;
                                         pData           : PRIO_BUF;
                                         DataBufferCount : ULONG;
                                         Flags           : DWORD;
                                         RequestContext  : PVOID) return BOOL;
   pragma Convention (Stdcall, LPFN_RIOSEND);

   type LPFN_RIOSENDEX is access function (SocketQueue     : RIO_RQ;
                                           pData           : PRIO_BUF;
                                           DataBufferCount : ULONG;
                                           pLocalAddress   : PRIO_BUF;
                                           pRemoteAddress  : PRIO_BUF;
                                           pControlContext : PRIO_BUF;
                                           pFlags          : PRIO_BUF;
                                           Flags           : DWORD;
                                           RequestContext  : PVOID)
                                           return BOOL;
   pragma Convention (Stdcall, LPFN_RIOSENDEX);

   type LPFN_RIODEQUEUECOMPLETION is access function (CQ        : RIO_CQ;
                                                      Arry      : PRIORESULT;
                                                      ArraySize : ULONG)
                                                      return ULONG;
   pragma Convention (Stdcall, LPFN_RIODEQUEUECOMPLETION);

   type LPFN_RIOCLOSECOMPLETIONQUEUE is access procedure (CQ : RIO_CQ);
   pragma Convention (Stdcall, LPFN_RIOCLOSECOMPLETIONQUEUE);

   type LPFN_RIOCREATECOMPLETIONQUEUE is access
      function (QueueSize              : DWORD;
                NotificationCompletion : PRIO_NOTIFICATION_COMPLETION)
                return RIO_CQ;
   pragma Convention (Stdcall, LPFN_RIOCREATECOMPLETIONQUEUE);

   type LPFN_RIODEREGISTERBUFFER is access function (DataBuffer : PCHAR;
                                                     DataLength : DWORD)
                                                     return RIO_BUFFERID;

   pragma Convention (Stdcall, LPFN_RIODEREGISTERBUFFER);

   type LPFN_RIONOTIFY is access function (CQ : RIO_CQ) return Integer;
   pragma Convention (Stdcall, LPFN_RIONOTIFY);

   type LPFN_RIOREGISTERBUFFER is access function (DataBuffer : PCHAR;
                                                   DataLength : DWORD)
                                                   return RIO_BUFFERID;
   pragma Convention (Stdcall, LPFN_RIOREGISTERBUFFER);

   type LPFN_RIORESIZECOMPLETIONQUEUE is access function (CQ        : RIO_CQ;
                                                          QueueSize : DWORD)
                                                          return BOOL;
   pragma Convention (Stdcall, LPFN_RIORESIZECOMPLETIONQUEUE);

   type LPFN_RIORESIZEREQUESTQUEUE is
     access function (RQ                    : RIO_RQ;
                      MaxOutstandingReceive : DWORD;
                      MaxOutstandingSend    : DWORD) return BOOL;
   pragma Convention (Stdcall, LPFN_RIORESIZEREQUESTQUEUE);

   type RIO_EXTENSION_FUNCTION_TABLE is
      record
         cbSize                   : DWORD :=
           RIO_EXTENSION_FUNCTION_TABLE'Size / 8;
         RIOReceive               : LPFN_RIORECEIVE;
         RIOReceiveEx             : LPFN_RIORECEIVEEX;
         RIOSend                  : LPFN_RIOSEND;
         RIOSendEx                : LPFN_RIOSENDEX;
         RIOCloseCompletionQueue  : LPFN_RIOCLOSECOMPLETIONQUEUE;
         RIOCreateCompletionQueue : LPFN_RIOCREATECOMPLETIONQUEUE;
         RIOCreateRequestQueue    : LPFN_RIOCREATEREQUESTQUEUE;
         RIODequeueCompletion     : LPFN_RIODEQUEUECOMPLETION;
         RIODeregisterBuffer      : LPFN_RIODEREGISTERBUFFER;
         RIONotify                : LPFN_RIONOTIFY;
         RIORegisterBuffer        : LPFN_RIOREGISTERBUFFER;
         RIOResizeCompletionQueue : LPFN_RIORESIZECOMPLETIONQUEUE;
         RIOResizeRequestQueue    : LPFN_RIORESIZEREQUESTQUEUE;
      end record;
   pragma Convention (C, RIO_EXTENSION_FUNCTION_TABLE);
   type PRIO_EXTENSION_FUNCTION_TABLE is access RIO_EXTENSION_FUNCTION_TABLE;

end Win32.Winsock.RIO;
