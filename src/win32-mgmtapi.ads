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

with Win32.Snmp;
with Win32.Winnt;
with Win32.Winsock;

package Win32.Mgmtapi is

   SNMP_MGMTAPI_TIMEOUT : constant := 40;          --  mgmtapi.h:26
   SNMP_MGMTAPI_SELECT_FDERRORS : constant := 41;          --  mgmtapi.h:27
   SNMP_MGMTAPI_TRAP_ERRORS : constant := 42;          --  mgmtapi.h:28
   SNMP_MGMTAPI_TRAP_DUPINIT : constant := 43;          --  mgmtapi.h:29
   SNMP_MGMTAPI_NOTRAPS : constant := 44;          --  mgmtapi.h:30
   SNMP_MGMTAPI_AGAIN : constant := 45;          --  mgmtapi.h:31
   SNMP_MAX_OID_LEN : constant := 16#7f00#;    --  mgmtapi.h:33
   RECVBUFSIZE : constant := 4096;        --  mgmtapi.h:40

   subtype SockDesc is Win32.Winsock.SOCKET;               --  mgmtapi.h:38

   type SNMP_MGR_SESSION;                                  --  mgmtapi.h:42

   type LPSNMP_MGR_SESSION is access all SNMP_MGR_SESSION; --  mgmtapi.h:50

   type SNMP_MGR_SESSION is                                --  mgmtapi.h:42
      record
         fd : SockDesc;                            --  mgmtapi.h:43
         destAddr : Win32.Winsock.SOCKADDR;              --  mgmtapi.h:44
         community : Win32.LPSTR;                         --  mgmtapi.h:45
         timeout : Win32.INT;                           --  mgmtapi.h:46
         retries : Win32.INT;                           --  mgmtapi.h:47
         requestId : Win32.Snmp.AsnInteger;               --  mgmtapi.h:48
         recvBuf : Win32.CHAR_Array (0 .. RECVBUFSIZE - 1);  --  mgmtapi.h:49
      end record;

   function SnmpMgrOpen
     (lpAgentAddress : Win32.LPSTR;
      lpAgentCommunity : Win32.LPSTR;
      nTimeOut : Win32.INT;
      nRetries : Win32.INT)
     return LPSNMP_MGR_SESSION;                   --  mgmtapi.h:60

   function SnmpMgrClose
     (session : LPSNMP_MGR_SESSION)
     return Win32.BOOL;                           --  mgmtapi.h:67

   function SnmpMgrRequest
     (session : LPSNMP_MGR_SESSION;
      requestType : Win32.BYTE;
      variableBindings : access Win32.Snmp.RFC1157VarBindList;
      errorStatus : access Win32.Snmp.AsnInteger;
      errorIndex : access Win32.Snmp.AsnInteger)
     return Win32.INT;                            --  mgmtapi.h:71

   function SnmpMgrStrToOid
     (string : Win32.LPSTR;
      oid : access Win32.Snmp.AsnObjectIdentifier)
     return Win32.BOOL;                           --  mgmtapi.h:80

   function SnmpMgrOidToStr
     (oid : access Win32.Snmp.AsnObjectIdentifier;
      string : access Win32.LPSTR)
     return Win32.BOOL;                           --  mgmtapi.h:85

   function SnmpMgrTrapListen
     (phTrapAvailable : access Win32.Winnt.HANDLE)
     return Win32.BOOL;                           --  mgmtapi.h:91

   function SnmpMgrGetTrap
     (enterprise : access Win32.Snmp.AsnObjectIdentifier;
      IPAddress : access Win32.Snmp.AsnIPAddress;
      genericTrap : access Win32.Snmp.AsnInteger;
      specificTrap : access Win32.Snmp.AsnInteger;
      timeStamp : access Win32.Snmp.AsnTimeticks;
      variableBindings : access Win32.Snmp.RFC1157VarBindList)
     return Win32.BOOL;                           --  mgmtapi.h:95

private

   pragma Convention (C, SNMP_MGR_SESSION);                 --  mgmtapi.h:42

   pragma Import (Stdcall, SnmpMgrOpen, "SnmpMgrOpen");
   --  mgmtapi.h:60
   pragma Import (Stdcall, SnmpMgrClose, "SnmpMgrClose");
   --  mgmtapi.h:67
   pragma Import (Stdcall, SnmpMgrRequest, "SnmpMgrRequest");
   --  mgmtapi.h:71
   pragma Import (Stdcall, SnmpMgrStrToOid, "SnmpMgrStrToOid");
   --  mgmtapi.h:80
   pragma Import (Stdcall, SnmpMgrOidToStr, "SnmpMgrOidToStr");
   --  mgmtapi.h:85
   pragma Import (Stdcall, SnmpMgrTrapListen, "SnmpMgrTrapListen");
   --  mgmtapi.h:91
   pragma Import (Stdcall, SnmpMgrGetTrap, "SnmpMgrGetTrap");
   --  mgmtapi.h:95

end Win32.Mgmtapi;


