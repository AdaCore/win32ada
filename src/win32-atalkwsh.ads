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

package Win32.Atalkwsh is

   DECIMAL_BASE                : constant := 10;
   ATPROTO_BASE                : constant := 16000;
   SOL_APPLETALK               : constant := 16000;
   DDPPROTO_RTMP               : constant := 16001;
   DDPPROTO_NBP                : constant := 16002;
   DDPPROTO_ATP                : constant := 16003;
   DDPPROTO_AEP                : constant := 16004;
   DDPPROTO_RTMPRQ             : constant := 16005;
   DDPPROTO_ZIP                : constant := 16006;
   DDPPROTO_ADSP               : constant := 16007;
   DDPPROTO_MAX                : constant := 16255;
   ATPROTO_ADSP                : constant := 16256;
   ATPROTO_ATP                 : constant := 16257;
   ATPROTO_ASP                 : constant := 16258;
   ATPROTO_PAP                 : constant := 16259;
   SO_REGISTER_NAME            : constant := 16#a000#;
   SO_DEREGISTER_NAME          : constant := 16#a001#;
   SO_REMOVE_NAME              : constant := 16#a001#;
   SO_LOOKUP_NAME              : constant := 16#a002#;
   SO_CONFIRM_NAME             : constant := 16#a003#;
   SO_LOOKUP_MYZONE            : constant := 16#a004#;
   SO_GETMYZONE                : constant := 16#a004#;
   SO_LOOKUP_ZONES             : constant := 16#a005#;
   SO_GETZONELIST              : constant := 16#a005#;
   SO_LOOKUP_ZONES_ON_ADAPTER  : constant := 16#a006#;
   SO_GETLOCALZONES            : constant := 16#a006#;
   SO_LOOKUP_NETDEF_ON_ADAPTER : constant := 16#a007#;
   SO_GETNETINFO               : constant := 16#a007#;
   SO_PAP_SET_SERVER_STATUS    : constant := 16#a007#;
   SO_PAP_GET_SERVER_STATUS    : constant := 16#a008#;
   SO_PAP_PRIME_READ           : constant := 16#a009#;
   ATADDR_ANY                  : constant := 0;
   ATADDR_BROADCAST            : constant := 16#ff#;
   WSAEMSGPARTIAL              : constant := 10100;
   MAX_PAP_STATUS_SIZE         : constant := 255;
   MIN_PAP_READ_BUF_SIZE       : constant := 4096;
   PAP_UNUSED_STATUS_BYTES     : constant := 4;
   MAX_ENTITY                  : constant := 32;

   type SOCKADDR_AT;
   type WSH_ATALK_ADDRESS;
   type WSH_NBP_NAME;
   type WSH_NBP_TUPLE;
   type WSH_LOOKUP_ZONES;
   type WSH_LOOKUP_NETDEF_ON_ADAPTER;
   type WSH_LOOKUP_NAME;
   type WSH_PAP_GET_SERVER_STATUS;

   type PSOCKADDR_AT is access all SOCKADDR_AT;
   type PWSH_ATALK_ADDRESS is access all WSH_ATALK_ADDRESS;
   type PWSH_NBP_NAME is access all WSH_NBP_NAME;
   type PWSH_NBP_TUPLE is access all WSH_NBP_TUPLE;
   type PWSH_REGISTER_NAME is access all WSH_NBP_NAME;
   type PWSH_DEREGISTER_NAME is access all WSH_NBP_NAME;
   type PWSH_REMOVE_NAME is access all WSH_NBP_NAME;
   type PWSH_LOOKUP_ZONES is access all WSH_LOOKUP_ZONES;
   type PWSH_LOOKUP_NETDEF_ON_ADAPTER is access all
     WSH_LOOKUP_NETDEF_ON_ADAPTER;
   type PWSH_LOOKUP_NAME is access all WSH_LOOKUP_NAME;
   type PWSH_PAP_GET_SERVER_STATUS is access all WSH_PAP_GET_SERVER_STATUS;

   type SOCKADDR_AT is record
      sat_family : Win32.USHORT;
      sat_net    : Win32.USHORT;
      sat_node   : Win32.UCHAR;
      sat_socket : Win32.UCHAR;
   end record;

   type struct_anonymous0_t is record
      Network : Win32.USHORT;
      Node    : Win32.UCHAR;
      Socket  : Win32.UCHAR;
   end record;

   type WSH_ATALK_ADDRESS_kind is (ATALK_ADDRESS_PIECES_kind, Address_kind);

   type WSH_ATALK_ADDRESS
     (Which : WSH_ATALK_ADDRESS_kind := ATALK_ADDRESS_PIECES_kind)
   is
      record
         case Which is
            when ATALK_ADDRESS_PIECES_kind =>
               ATALK_ADDRESS_PIECES : struct_anonymous0_t;
            when Address_kind =>
               Address : Win32.ULONG;
         end case;
      end record;

   pragma Convention (C, WSH_ATALK_ADDRESS);

   pragma Unchecked_Union (WSH_ATALK_ADDRESS);

   type WSH_NBP_NAME is record
      ObjectNameLen : Win32.CHAR;
      ObjectName    : Win32.CHAR_Array (0 .. 31);
      TypeNameLen   : Win32.CHAR;
      TypeName      : Win32.CHAR_Array (0 .. 31);
      ZoneNameLen   : Win32.CHAR;
      ZoneName      : Win32.CHAR_Array (0 .. 31);
   end record;

   type WSH_NBP_TUPLE is record
      Address    : WSH_ATALK_ADDRESS;
      Enumerator : Win32.USHORT;
      NbpName    : WSH_NBP_NAME;
   end record;

   subtype WSH_REGISTER_NAME is WSH_NBP_NAME;

   subtype WSH_DEREGISTER_NAME is WSH_NBP_NAME;

   subtype WSH_REMOVE_NAME is WSH_NBP_NAME;

   type WSH_LOOKUP_ZONES is record
      NoZones : Win32.ULONG;
   end record;

   type WSH_LOOKUP_NETDEF_ON_ADAPTER is record
      NetworkRangeLowerEnd : Win32.USHORT;
      NetworkRangeUpperEnd : Win32.USHORT;
   end record;

   type WSH_LOOKUP_NAME is record
      LookupTuple : WSH_NBP_TUPLE;
      NoTuples    : Win32.ULONG;
   end record;

   type WSH_PAP_GET_SERVER_STATUS is record
      ServerAddr   : SOCKADDR_AT;
      Reserved     : Win32.UCHAR_Array (0 .. PAP_UNUSED_STATUS_BYTES - 1);
      ServerStatus : Win32.UCHAR_Array (0 .. MAX_PAP_STATUS_SIZE);
   end record;

private

   pragma Convention (C, SOCKADDR_AT);
   pragma Convention (C, struct_anonymous0_t);
   pragma Convention (C, WSH_NBP_NAME);
   pragma Convention (C, WSH_NBP_TUPLE);
   pragma Convention (C, WSH_LOOKUP_ZONES);
   pragma Convention (C, WSH_LOOKUP_NETDEF_ON_ADAPTER);
   pragma Convention (C, WSH_LOOKUP_NAME);
   pragma Convention (C, WSH_PAP_GET_SERVER_STATUS);

end Win32.Atalkwsh;
