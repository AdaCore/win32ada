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

package Win32.Wsnwlink is

   IPX_PTYPE                  : constant := 16#4000#;
   IPX_FILTERPTYPE            : constant := 16#4001#;
   IPX_STOPFILTERPTYPE        : constant := 16#4003#;
   IPX_DSTYPE                 : constant := 16#4002#;
   IPX_EXTENDED_ADDRESS       : constant := 16#4004#;
   IPX_RECVHDR                : constant := 16#4005#;
   IPX_MAXSIZE                : constant := 16#4006#;
   IPX_ADDRESS                : constant := 16#4007#;
   IPX_GETNETINFO             : constant := 16#4008#;
   IPX_GETNETINFO_NORIP       : constant := 16#4009#;
   IPX_SPXGETCONNECTIONSTATUS : constant := 16#400b#;
   IPX_ADDRESS_NOTIFY         : constant := 16#400c#;
   IPX_MAX_ADAPTER_NUM        : constant := 16#400d#;
   IPX_RERIPNETNUMBER         : constant := 16#400e#;
   IPX_RECEIVE_BROADCAST      : constant := 16#400f#;
   IPX_IMMEDIATESPXACK        : constant := 16#4010#;

   type IPX_ADDRESS_DATA;
   type IPX_NETNUM_DATA;
   type IPX_SPXCONNSTATUS_DATA;

   type PIPX_ADDRESS_DATA is access all IPX_ADDRESS_DATA;
   type PIPX_NETNUM_DATA is access all IPX_NETNUM_DATA;
   type PIPX_SPXCONNSTATUS_DATA is access all IPX_SPXCONNSTATUS_DATA;

   type IPX_ADDRESS_DATA is record
      adapternum : Win32.INT;
      netnum     : Win32.UCHAR_Array (0 .. 3);
      nodenum    : Win32.UCHAR_Array (0 .. 5);
      wan        : Win32.Winnt.BOOLEAN;
      status     : Win32.Winnt.BOOLEAN;
      maxpkt     : Win32.INT;
      linkspeed  : Win32.ULONG;
   end record;

   type IPX_NETNUM_DATA is record
      netnum   : Win32.BYTE_Array (0 .. 3);
      hopcount : Win32.USHORT;
      netdelay : Win32.USHORT;
      cardnum  : Win32.INT;
      router   : Win32.UCHAR_Array (0 .. 5);
   end record;

   type IPX_SPXCONNSTATUS_DATA is record
      ConnectionState         : Win32.UCHAR;
      WatchDogActive          : Win32.UCHAR;
      LocalConnectionId       : Win32.USHORT;
      RemoteConnectionId      : Win32.USHORT;
      LocalSequenceNumber     : Win32.USHORT;
      LocalAckNumber          : Win32.USHORT;
      LocalAllocNumber        : Win32.USHORT;
      RemoteAckNumber         : Win32.USHORT;
      RemoteAllocNumber       : Win32.USHORT;
      LocalSocket             : Win32.USHORT;
      ImmediateAddress        : Win32.UCHAR_Array (0 .. 6);
      RemoteNetwork           : Win32.UCHAR_Array (0 .. 3);
      RemoteNode              : Win32.UCHAR_Array (0 .. 6);
      RemoteSocket            : Win32.USHORT;
      RetransmissionCount     : Win32.USHORT;
      EstimatedRoundTripDelay : Win32.USHORT;
      RetransmittedPackets    : Win32.USHORT;
      SuppressedPacket        : Win32.USHORT;
   end record;

private

   pragma Convention (C, IPX_ADDRESS_DATA);
   pragma Convention (C, IPX_NETNUM_DATA);
   pragma Convention (C, IPX_SPXCONNSTATUS_DATA);

end Win32.Wsnwlink;
