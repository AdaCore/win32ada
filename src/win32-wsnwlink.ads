--  $Source$

--  $Revision$ $Date$ $Author$

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



with Win32.Winnt;



package Win32.Wsnwlink is



   IPX_PTYPE : constant := 16#4000#;      --  wsnwlink.h:39

   IPX_FILTERPTYPE : constant := 16#4001#;      --  wsnwlink.h:50

   IPX_STOPFILTERPTYPE : constant := 16#4003#;      --  wsnwlink.h:58

   IPX_DSTYPE : constant := 16#4002#;      --  wsnwlink.h:67

   IPX_EXTENDED_ADDRESS : constant := 16#4004#;      --  wsnwlink.h:85

   IPX_RECVHDR : constant := 16#4005#;      --  wsnwlink.h:94

   IPX_MAXSIZE : constant := 16#4006#;      --  wsnwlink.h:104

   IPX_ADDRESS : constant := 16#4007#;      --  wsnwlink.h:118

   IPX_GETNETINFO : constant := 16#4008#;      --  wsnwlink.h:140

   IPX_GETNETINFO_NORIP : constant := 16#4009#;      --  wsnwlink.h:162

   IPX_SPXGETCONNECTIONSTATUS : constant := 16#400b#;      --  wsnwlink.h:173

   IPX_ADDRESS_NOTIFY : constant := 16#400c#;      --  wsnwlink.h:227

   IPX_MAX_ADAPTER_NUM : constant := 16#400d#;      --  wsnwlink.h:238

   IPX_RERIPNETNUMBER : constant := 16#400e#;      --  wsnwlink.h:249

   IPX_RECEIVE_BROADCAST : constant := 16#400f#;      --  wsnwlink.h:262

   IPX_IMMEDIATESPXACK : constant := 16#4010#;      --  wsnwlink.h:273



   type IPX_ADDRESS_DATA;                                  --  wsnwlink.h:120

   type IPX_NETNUM_DATA;                                   --  wsnwlink.h:142

   type IPX_SPXCONNSTATUS_DATA;                            --  wsnwlink.h:175



   type PIPX_ADDRESS_DATA is access all IPX_ADDRESS_DATA;  --  wsnwlink.h:128

   type PIPX_NETNUM_DATA is access all IPX_NETNUM_DATA;    --  wsnwlink.h:150

   type PIPX_SPXCONNSTATUS_DATA is access all IPX_SPXCONNSTATUS_DATA;

   --  wsnwlink.h:194



   type IPX_ADDRESS_DATA is                                --  wsnwlink.h:120

      record

         adapternum : Win32.INT;                          --  wsnwlink.h:121

         netnum : Win32.UCHAR_Array (0 .. 3);            --  wsnwlink.h:122

         nodenum : Win32.UCHAR_Array (0 .. 5);            --  wsnwlink.h:123

         wan : Win32.Winnt.BOOLEAN;                --  wsnwlink.h:124

         status : Win32.Winnt.BOOLEAN;                --  wsnwlink.h:125

         maxpkt : Win32.INT;                          --  wsnwlink.h:126

         linkspeed : Win32.ULONG;                        --  wsnwlink.h:127

      end record;



   type IPX_NETNUM_DATA is                                 --  wsnwlink.h:142

      record

         netnum : Win32.BYTE_Array (0 .. 3);               --  wsnwlink.h:143

         hopcount : Win32.USHORT;                         --  wsnwlink.h:144

         netdelay : Win32.USHORT;                         --  wsnwlink.h:145

         cardnum : Win32.INT;                            --  wsnwlink.h:146

         router : Win32.UCHAR_Array (0 .. 5);              --  wsnwlink.h:148

      end record;



   type IPX_SPXCONNSTATUS_DATA is                          --  wsnwlink.h:175

      record

         ConnectionState : Win32.UCHAR;           --  wsnwlink.h:176

         WatchDogActive : Win32.UCHAR;           --  wsnwlink.h:177

         LocalConnectionId : Win32.USHORT;          --  wsnwlink.h:178

         RemoteConnectionId : Win32.USHORT;          --  wsnwlink.h:179

         LocalSequenceNumber : Win32.USHORT;          --  wsnwlink.h:180

         LocalAckNumber : Win32.USHORT;          --  wsnwlink.h:181

         LocalAllocNumber : Win32.USHORT;          --  wsnwlink.h:182

         RemoteAckNumber : Win32.USHORT;          --  wsnwlink.h:183

         RemoteAllocNumber : Win32.USHORT;          --  wsnwlink.h:184

         LocalSocket : Win32.USHORT;          --  wsnwlink.h:185

         ImmediateAddress : Win32.UCHAR_Array (0 .. 6);

         --  wsnwlink.h:186

         RemoteNetwork : Win32.UCHAR_Array (0 .. 3);

         --  wsnwlink.h:187

         RemoteNode : Win32.UCHAR_Array (0 .. 6);

         --  wsnwlink.h:188

         RemoteSocket : Win32.USHORT;          --  wsnwlink.h:189

         RetransmissionCount : Win32.USHORT;          --  wsnwlink.h:190

         EstimatedRoundTripDelay : Win32.USHORT;          --  wsnwlink.h:191

         RetransmittedPackets : Win32.USHORT;          --  wsnwlink.h:192

         SuppressedPacket : Win32.USHORT;          --  wsnwlink.h:193

      end record;



private



   pragma Convention (C, IPX_ADDRESS_DATA);                 --  wsnwlink.h:120

   pragma Convention (C, IPX_NETNUM_DATA);                  --  wsnwlink.h:142

   pragma Convention (C, IPX_SPXCONNSTATUS_DATA);           --  wsnwlink.h:175



end Win32.Wsnwlink;





