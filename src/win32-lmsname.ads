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

package Win32.Lmsname is

   use type Interfaces.C.char_array;

   subtype TEXT is Win32.Winnt.TEXT;

   SERVICE_WORKSTATION      : constant TEXT := "LanmanWorkstation" & Nul;
   SERVICE_LM20_WORKSTATION : constant TEXT := "WORKSTATION" & Nul;
   WORKSTATION_DISPLAY_NAME : constant TEXT := "Workstation" & Nul;

   SERVICE_SERVER      : constant TEXT := "LanmanServer" & Nul;
   SERVICE_LM20_SERVER : constant TEXT := "SERVER" & Nul;
   SERVER_DISPLAY_NAME : constant TEXT := "Server" & Nul;

   SERVICE_BROWSER          : constant TEXT := "BROWSER" & Nul;
   SERVICE_LM20_BROWSERTEXT : TEXT renames SERVICE_BROWSER;

   SERVICE_MESSENGER          : constant TEXT := "MESSENGER" & Nul;
   SERVICE_LM20_MESSENGERTEXT : TEXT renames SERVICE_MESSENGER;

   SERVICE_NETRUN          : constant TEXT := "NETRUN" & Nul;
   SERVICE_LM20_NETRUNTEXT : TEXT renames SERVICE_NETRUN;

   SERVICE_SPOOLER          : constant TEXT := "SPOOLER" & Nul;
   SERVICE_LM20_SPOOLERTEXT : TEXT renames SERVICE_SPOOLER;

   SERVICE_ALERTER          : constant TEXT := "ALERTER" & Nul;
   SERVICE_LM20_ALERTERTEXT : TEXT renames SERVICE_ALERTER;

   SERVICE_NETLOGON          : constant TEXT := "NETLOGON" & Nul;
   SERVICE_LM20_NETLOGONTEXT : TEXT renames SERVICE_NETLOGON;

   SERVICE_NETPOPUP          : constant TEXT := "NETPOPUP" & Nul;
   SERVICE_LM20_NETPOPUPTEXT : TEXT renames SERVICE_NETPOPUP;

   SERVICE_SQLSERVER          : constant TEXT := "SQLSERVER" & Nul;
   SERVICE_LM20_SQLSERVERTEXT : TEXT renames SERVICE_SQLSERVER;

   SERVICE_REPL          : constant TEXT := "REPLICATOR" & Nul;
   SERVICE_LM20_REPLTEXT : TEXT renames SERVICE_REPL;

   SERVICE_RIPL          : constant TEXT := "REMOTEBOOT" & Nul;
   SERVICE_LM20_RIPLTEXT : TEXT renames SERVICE_RIPL;

   SERVICE_TIMESOURCE          : constant TEXT := "TIMESOURCE" & Nul;
   SERVICE_LM20_TIMESOURCETEXT : TEXT renames SERVICE_TIMESOURCE;

   SERVICE_AFP          : constant TEXT := "AFP" & Nul;
   SERVICE_LM20_AFPTEXT : TEXT renames SERVICE_AFP;

   SERVICE_UPS          : constant TEXT := "UPS" & Nul;
   SERVICE_LM20_UPSTEXT : TEXT renames SERVICE_UPS;

   SERVICE_XACTSRV          : constant TEXT := "XACTSRV" & Nul;
   SERVICE_LM20_XACTSRVTEXT : TEXT renames SERVICE_XACTSRV;

   SERVICE_TCPIP          : constant TEXT := "TCPIP" & Nul;
   SERVICE_LM20_TCPIPTEXT : TEXT renames SERVICE_TCPIP;

   SERVICE_NBT          : constant TEXT := "NBT" & Nul;
   SERVICE_LM20_NBTTEXT : TEXT renames SERVICE_NBT;

   SERVICE_LMHOSTS          : constant TEXT := "LMHOSTS" & Nul;
   SERVICE_LM20_LMHOSTSTEXT : TEXT renames SERVICE_LMHOSTS;

   SERVICE_TELNET          : constant TEXT := "Telnet" & Nul;
   SERVICE_LM20_TELNETTEXT : TEXT renames SERVICE_TELNET;

   SERVICE_SCHEDULE          : constant TEXT := "Schedule" & Nul;
   SERVICE_LM20_SCHEDULETEXT : TEXT renames SERVICE_SCHEDULE;

   SERVICE_NTLMSSP : constant TEXT := "NtLmSsp" & Nul;

   SERVICE_DHCP          : constant TEXT := "DHCP" & Nul;
   SERVICE_LM20_DHCPTEXT : TEXT renames SERVICE_DHCP;

   SERVICE_NWSAP          : constant TEXT := "NwSapAgent" & Nul;
   SERVICE_LM20_NWSAPTEXT : TEXT renames SERVICE_NWSAP;
   NWSAP_DISPLAY_NAME     : constant TEXT := "NW Sap Agent" & Nul;

end Win32.Lmsname;
