--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-atalkwsh.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
--  "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
--  FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
--  the accuracy and the use of this file.  This file may be used, copied,
--  modified and distributed only by licensees of Microsoft Corporation's
--  WIN32 Software Development Kit in accordance with the terms of the
--  licensee's End-User License Agreement for Microsoft Software for the
--  WIN32 Development Kit.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Portions (c) 1985-1994 Microsoft Corporation with permission.
--  Microsoft is a registered trademark and Windows and Windows NT are
--  trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

package Win32.Atalkwsh is

   DECIMAL_BASE                : constant :=  10;       --  atalkwsh.h :32
   ATPROTO_BASE                : constant :=  16000;    --  atalkwsh.h :38
   SOL_APPLETALK               : constant :=  16000;    --  atalkwsh.h :39
   DDPPROTO_RTMP               : constant :=  16001;    --  atalkwsh.h :41
   DDPPROTO_NBP                : constant :=  16002;    --  atalkwsh.h :42
   DDPPROTO_ATP                : constant :=  16003;    --  atalkwsh.h :43
   DDPPROTO_AEP                : constant :=  16004;    --  atalkwsh.h :44
   DDPPROTO_RTMPRQ             : constant :=  16005;    --  atalkwsh.h :45
   DDPPROTO_ZIP                : constant :=  16006;    --  atalkwsh.h :46
   DDPPROTO_ADSP               : constant :=  16007;    --  atalkwsh.h :47
   DDPPROTO_MAX                : constant :=  16255;    --  atalkwsh.h :49
   ATPROTO_ADSP                : constant :=  16256;    --  atalkwsh.h :55
   ATPROTO_ATP                 : constant :=  16257;    --  atalkwsh.h :56
   ATPROTO_ASP                 : constant :=  16258;    --  atalkwsh.h :57
   ATPROTO_PAP                 : constant :=  16259;    --  atalkwsh.h :58
   SO_REGISTER_NAME            : constant :=  16#a000#; --  atalkwsh.h :60
   SO_DEREGISTER_NAME          : constant :=  16#a001#; --  atalkwsh.h :61
   SO_REMOVE_NAME              : constant :=  16#a001#; --  atalkwsh.h :62
   SO_LOOKUP_NAME              : constant :=  16#a002#; --  atalkwsh.h :63
   SO_CONFIRM_NAME             : constant :=  16#a003#; --  atalkwsh.h :64
   SO_LOOKUP_MYZONE            : constant :=  16#a004#; --  atalkwsh.h :65
   SO_GETMYZONE                : constant :=  16#a004#; --  atalkwsh.h :66
   SO_LOOKUP_ZONES             : constant :=  16#a005#; --  atalkwsh.h :67
   SO_GETZONELIST              : constant :=  16#a005#; --  atalkwsh.h :68
   SO_LOOKUP_ZONES_ON_ADAPTER  : constant :=  16#a006#; --  atalkwsh.h :69
   SO_GETLOCALZONES            : constant :=  16#a006#; --  atalkwsh.h :70
   SO_LOOKUP_NETDEF_ON_ADAPTER : constant :=  16#a007#; --  atalkwsh.h :71
   SO_GETNETINFO               : constant :=  16#a007#; --  atalkwsh.h :72
   SO_PAP_SET_SERVER_STATUS    : constant :=  16#a007#; --  atalkwsh.h :78
   SO_PAP_GET_SERVER_STATUS    : constant :=  16#a008#; --  atalkwsh.h :79
   SO_PAP_PRIME_READ           : constant :=  16#a009#; --  atalkwsh.h :80
   ATADDR_ANY                  : constant :=  0;        --  atalkwsh.h :83
   ATADDR_BROADCAST            : constant :=  16#ff#;   --  atalkwsh.h :84
   WSAEMSGPARTIAL              : constant :=  10100;    --  atalkwsh.h :90
   MAX_PAP_STATUS_SIZE         : constant :=  255;      --  atalkwsh.h :94
   MIN_PAP_READ_BUF_SIZE       : constant :=  4096;     --  atalkwsh.h :95
   PAP_UNUSED_STATUS_BYTES     : constant :=  4;        --  atalkwsh.h :99
   MAX_ENTITY                  : constant :=  32;       --  atalkwsh.h :141

   type SOCKADDR_AT;                                       --  atalkwsh.h :106
   type WSH_ATALK_ADDRESS;                                 --  atalkwsh.h :130
   type WSH_NBP_NAME;                                      --  atalkwsh.h :150
   type WSH_NBP_TUPLE;                                     --  atalkwsh.h :157
   type WSH_LOOKUP_ZONES;                                  --  atalkwsh.h :163
   type WSH_LOOKUP_NETDEF_ON_ADAPTER;                      --  atalkwsh.h :173
   type WSH_LOOKUP_NAME;                                   --  atalkwsh.h :183
   type WSH_PAP_GET_SERVER_STATUS;                         --  atalkwsh.h :194

   type PSOCKADDR_AT is access all SOCKADDR_AT;            --  atalkwsh.h :112
   type PWSH_ATALK_ADDRESS is access all WSH_ATALK_ADDRESS; --  atalkwsh.h :130
   type PWSH_NBP_NAME is access all WSH_NBP_NAME;          --  atalkwsh.h :150
   type PWSH_NBP_TUPLE is access all WSH_NBP_TUPLE;        --  atalkwsh.h :157
   type PWSH_REGISTER_NAME is access all WSH_NBP_NAME;     --  atalkwsh.h :159
   type PWSH_DEREGISTER_NAME is access all WSH_NBP_NAME;   --  atalkwsh.h :160
   type PWSH_REMOVE_NAME is access all WSH_NBP_NAME;       --  atalkwsh.h :161
   type PWSH_LOOKUP_ZONES is access all WSH_LOOKUP_ZONES;  --  atalkwsh.h :171
   type PWSH_LOOKUP_NETDEF_ON_ADAPTER is
     access all WSH_LOOKUP_NETDEF_ON_ADAPTER;            --  atalkwsh.h :181
   type PWSH_LOOKUP_NAME is access all WSH_LOOKUP_NAME;    --  atalkwsh.h :192
   type PWSH_PAP_GET_SERVER_STATUS is access all WSH_PAP_GET_SERVER_STATUS;
   --  atalkwsh.h :200

   type SOCKADDR_AT is                                     --  atalkwsh.h :106
      record
         sat_family : Win32.USHORT; --  atalkwsh.h :108
         sat_net    : Win32.USHORT; --  atalkwsh.h :109
         sat_node   : Win32.UCHAR;  --  atalkwsh.h :110
         sat_socket : Win32.UCHAR;  --  atalkwsh.h :111
      end record;

   type struct_anonymous0_t is                             --  atalkwsh.h :128
      record
         Network : Win32.USHORT; --  atalkwsh.h :125
         Node    : Win32.UCHAR;  --  atalkwsh.h :126
         Socket  : Win32.UCHAR;  --  atalkwsh.h :127
      end record;

   type WSH_ATALK_ADDRESS_kind is ( --  atalkwsh.h :130
     ATALK_ADDRESS_PIECES_kind,
     Address_kind);

   type WSH_ATALK_ADDRESS
     (Which : WSH_ATALK_ADDRESS_kind :=  ATALK_ADDRESS_PIECES_kind) is
      --  atalkwsh.h :130
      record
         case Which is
            when ATALK_ADDRESS_PIECES_kind =>
               ATALK_ADDRESS_PIECES : struct_anonymous0_t;
               --  atalkwsh.h :128
            when Address_kind =>
               Address : Win32.ULONG;              --  atalkwsh.h :129
         end case;
      end record;

   pragma Convention (C, WSH_ATALK_ADDRESS);

   pragma Unchecked_Union (WSH_ATALK_ADDRESS);

   type WSH_NBP_NAME is                                    --  atalkwsh.h :150
      record
         ObjectNameLen : Win32.CHAR;                 --  atalkwsh.h    :144
         ObjectName    : Win32.CHAR_Array (0 .. 31); --  atalkwsh.h :145
         TypeNameLen   : Win32.CHAR;                 --  atalkwsh.h    :146
         TypeName      : Win32.CHAR_Array (0 .. 31); --  atalkwsh.h :147
         ZoneNameLen   : Win32.CHAR;                 --  atalkwsh.h    :148
         ZoneName      : Win32.CHAR_Array (0 .. 31); --  atalkwsh.h :149
      end record;

   type WSH_NBP_TUPLE is                                   --  atalkwsh.h :157
      record
         Address    : WSH_ATALK_ADDRESS; --  atalkwsh.h :154
         Enumerator : Win32.USHORT;      --  atalkwsh.h :155
         NbpName    : WSH_NBP_NAME;      --  atalkwsh.h :156
      end record;

   subtype WSH_REGISTER_NAME is WSH_NBP_NAME;              --  atalkwsh.h :159

   subtype WSH_DEREGISTER_NAME is WSH_NBP_NAME;            --  atalkwsh.h :160

   subtype WSH_REMOVE_NAME is WSH_NBP_NAME;                --  atalkwsh.h :161

   type WSH_LOOKUP_ZONES is                                --  atalkwsh.h :163
      record
         NoZones : Win32.ULONG;                           --  atalkwsh.h :165
      end record;

   type WSH_LOOKUP_NETDEF_ON_ADAPTER is                    --  atalkwsh.h :173
      record
         NetworkRangeLowerEnd : Win32.USHORT;             --  atalkwsh.h :175
         NetworkRangeUpperEnd : Win32.USHORT;             --  atalkwsh.h :176
      end record;

   type WSH_LOOKUP_NAME is                                 --  atalkwsh.h :183
      record
         LookupTuple : WSH_NBP_TUPLE;                     --  atalkwsh.h :185
         NoTuples : Win32.ULONG;                       --  atalkwsh.h :186
      end record;

   type WSH_PAP_GET_SERVER_STATUS is                       --  atalkwsh.h :194
      record
         ServerAddr : SOCKADDR_AT;                      --  atalkwsh.h :196
         Reserved : Win32.UCHAR_Array (0 .. PAP_UNUSED_STATUS_BYTES - 1);
         --  atalkwsh.h :197
         ServerStatus : Win32.UCHAR_Array (0 .. MAX_PAP_STATUS_SIZE);
         --  atalkwsh.h :198
      end record;

private

   pragma Convention (C, SOCKADDR_AT);                      --  atalkwsh.h :106
   pragma Convention (C, struct_anonymous0_t);              --  atalkwsh.h :128
   pragma Convention (C, WSH_NBP_NAME);                     --  atalkwsh.h :150
   pragma Convention (C, WSH_NBP_TUPLE);                    --  atalkwsh.h :157
   pragma Convention (C, WSH_LOOKUP_ZONES);                 --  atalkwsh.h :163
   pragma Convention (C, WSH_LOOKUP_NETDEF_ON_ADAPTER);     --  atalkwsh.h :173
   pragma Convention (C, WSH_LOOKUP_NAME);                  --  atalkwsh.h :183
   pragma Convention (C, WSH_PAP_GET_SERVER_STATUS);        --  atalkwsh.h :194

end Win32.Atalkwsh;


