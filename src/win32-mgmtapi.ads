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

with Win32.Snmp;
with Win32.Winnt;
with Win32.Winsock;

package Win32.Mgmtapi is

   SNMP_MGMTAPI_TIMEOUT         : constant := 40;
   SNMP_MGMTAPI_SELECT_FDERRORS : constant := 41;
   SNMP_MGMTAPI_TRAP_ERRORS     : constant := 42;
   SNMP_MGMTAPI_TRAP_DUPINIT    : constant := 43;
   SNMP_MGMTAPI_NOTRAPS         : constant := 44;
   SNMP_MGMTAPI_AGAIN           : constant := 45;
   SNMP_MAX_OID_LEN             : constant := 16#7f00#;
   RECVBUFSIZE                  : constant := 4096;

   subtype SockDesc is Win32.Winsock.SOCKET;

   type SNMP_MGR_SESSION;

   type LPSNMP_MGR_SESSION is access all SNMP_MGR_SESSION;

   type SNMP_MGR_SESSION is record
      fd        : SockDesc;
      destAddr  : Win32.Winsock.SOCKADDR;
      community : Win32.LPSTR;
      timeout   : Win32.INT;
      retries   : Win32.INT;
      requestId : Win32.Snmp.AsnInteger;
      recvBuf   : Win32.CHAR_Array (0 .. RECVBUFSIZE - 1);
   end record;

   function SnmpMgrOpen
     (lpAgentAddress   : Win32.LPSTR;
      lpAgentCommunity : Win32.LPSTR;
      nTimeOut         : Win32.INT;
      nRetries         : Win32.INT)
      return LPSNMP_MGR_SESSION;

   function SnmpMgrClose (session : LPSNMP_MGR_SESSION) return Win32.BOOL;

   function SnmpMgrRequest
     (session          : LPSNMP_MGR_SESSION;
      requestType      : Win32.BYTE;
      variableBindings : access Win32.Snmp.RFC1157VarBindList;
      errorStatus      : access Win32.Snmp.AsnInteger;
      errorIndex       : access Win32.Snmp.AsnInteger)
      return Win32.INT;

   function SnmpMgrStrToOid
     (string : Win32.LPSTR;
      oid    : access Win32.Snmp.AsnObjectIdentifier)
      return Win32.BOOL;

   function SnmpMgrOidToStr
     (oid    : access Win32.Snmp.AsnObjectIdentifier;
      string : access Win32.LPSTR)
      return Win32.BOOL;

   function SnmpMgrTrapListen
     (phTrapAvailable : access Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function SnmpMgrGetTrap
     (enterprise       : access Win32.Snmp.AsnObjectIdentifier;
      IPAddress        : access Win32.Snmp.AsnIPAddress;
      genericTrap      : access Win32.Snmp.AsnInteger;
      specificTrap     : access Win32.Snmp.AsnInteger;
      timeStamp        : access Win32.Snmp.AsnTimeticks;
      variableBindings : access Win32.Snmp.RFC1157VarBindList)
      return Win32.BOOL;

private

   pragma Convention (C, SNMP_MGR_SESSION);

   pragma Import (Stdcall, SnmpMgrOpen, "SnmpMgrOpen");
   pragma Import (Stdcall, SnmpMgrClose, "SnmpMgrClose");
   pragma Import (Stdcall, SnmpMgrRequest, "SnmpMgrRequest");
   pragma Import (Stdcall, SnmpMgrStrToOid, "SnmpMgrStrToOid");
   pragma Import (Stdcall, SnmpMgrOidToStr, "SnmpMgrOidToStr");
   pragma Import (Stdcall, SnmpMgrTrapListen, "SnmpMgrTrapListen");
   pragma Import (Stdcall, SnmpMgrGetTrap, "SnmpMgrGetTrap");

end Win32.Mgmtapi;
