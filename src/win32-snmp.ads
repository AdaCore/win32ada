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

package Win32.Snmp is

   SNMPAPI_NOERROR                : constant := 1;
   SNMPAPI_ERROR                  : constant := 0;
   ASN_UNIVERSAL                  : constant := 16#0#;
   ASN_APPLICATION                : constant := 16#40#;
   ASN_CONTEXTSPECIFIC            : constant := 16#80#;
   ASN_PRIVATE                    : constant := 16#c0#;
   ASN_PRIMATIVE                  : constant := 16#0#;
   ASN_CONSTRUCTOR                : constant := 16#20#;
   ASN_INTEGER                    : constant := 16#2#;
   ASN_OCTETSTRING                : constant := 16#4#;
   ASN_NULL                       : constant := 16#5#;
   ASN_OBJECTIDENTIFIER           : constant := 16#6#;
   ASN_SEQUENCE                   : constant := 16#30#;
   ASN_SEQUENCEOF                 : constant := 16#30#;
   ASN_RFC1155_IPADDRESS          : constant := 16#40#;
   ASN_RFC1155_COUNTER            : constant := 16#41#;
   ASN_RFC1155_GAUGE              : constant := 16#42#;
   ASN_RFC1155_TIMETICKS          : constant := 16#43#;
   ASN_RFC1155_OPAQUE             : constant := 16#44#;
   ASN_RFC1213_DISPSTRING         : constant := 16#4#;
   ASN_RFC1157_GETREQUEST         : constant := 16#a0#;
   ASN_RFC1157_GETNEXTREQUEST     : constant := 16#a1#;
   ASN_RFC1157_GETRESPONSE        : constant := 16#a2#;
   ASN_RFC1157_SETREQUEST         : constant := 16#a3#;
   ASN_RFC1157_TRAP               : constant := 16#a4#;
   SNMP_ERRORSTATUS_NOERROR       : constant := 0;
   SNMP_ERRORSTATUS_TOOBIG        : constant := 1;
   SNMP_ERRORSTATUS_NOSUCHNAME    : constant := 2;
   SNMP_ERRORSTATUS_BADVALUE      : constant := 3;
   SNMP_ERRORSTATUS_READONLY      : constant := 4;
   SNMP_ERRORSTATUS_GENERR        : constant := 5;
   SNMP_GENERICTRAP_COLDSTART     : constant := 0;
   SNMP_GENERICTRAP_WARMSTART     : constant := 1;
   SNMP_GENERICTRAP_LINKDOWN      : constant := 2;
   SNMP_GENERICTRAP_LINKUP        : constant := 3;
   SNMP_GENERICTRAP_AUTHFAILURE   : constant := 4;
   SNMP_GENERICTRAP_EGPNEIGHLOSS  : constant := 5;
   SNMP_GENERICTRAP_ENTERSPECIFIC : constant := 6;
   SNMP_MEM_ALLOC_ERROR           : constant := 1;
   SNMP_BERAPI_INVALID_LENGTH     : constant := 10;
   SNMP_BERAPI_INVALID_TAG        : constant := 11;
   SNMP_BERAPI_OVERFLOW           : constant := 12;
   SNMP_BERAPI_SHORT_BUFFER       : constant := 13;
   SNMP_BERAPI_INVALID_OBJELEM    : constant := 14;
   SNMP_PDUAPI_UNRECOGNIZED_PDU   : constant := 20;
   SNMP_PDUAPI_INVALID_ES         : constant := 21;
   SNMP_PDUAPI_INVALID_GT         : constant := 22;
   SNMP_AUTHAPI_INVALID_VERSION   : constant := 30;
   SNMP_AUTHAPI_INVALID_MSG_TYPE  : constant := 31;
   SNMP_AUTHAPI_TRIV_AUTH_FAILED  : constant := 32;

   type AsnInteger is new Win32.LONG;
   type AsnCounter is new Win32.DWORD;
   type AsnGauge is new Win32.DWORD;
   type AsnTimeticks is new Win32.DWORD;

   type AsnOctetString;
   type AsnObjectIdentifier;
   type union_anonymous2_t;
   type AsnAny;
   type RFC1157VarBind;
   type RFC1157VarBindList;
   type RFC1157Pdu;
   type RFC1157TrapPdu;
   type union_anonymous7_t;
   type RFC1157Pdus;
   type SnmpMgmtCom;

   type a_RFC1157VarBind_t is access all RFC1157VarBind;

   type AsnOctetString is record
      stream  : Win32.PBYTE;
      length  : Win32.UINT;
      dynamic : Win32.BOOL;
   end record;

   type AsnObjectIdentifier is record
      idLength : Win32.UINT;
      ids      : Win32.PUINT;
   end record;

   subtype AsnSequence is AsnOctetString;

   subtype AsnImplicitSequence is AsnSequence;

   subtype AsnIPAddress is AsnOctetString;

   subtype AsnDisplayString is AsnOctetString;

   subtype AsnOpaque is AsnOctetString;

   type union_anonymous2_t_kind is (
      number_kind,
      string_kind,
      object_kind,
      sequence_kind,
      address_kind,
      counter_kind,
      gauge_kind,
      ticks_kind,
      arbitrary_kind);

   type union_anonymous2_t (Which : union_anonymous2_t_kind := string_kind) is
      record
         case Which is
            when number_kind =>
               number : AsnInteger;
            when string_kind =>
               string : AsnOctetString;
            when object_kind =>
               object : AsnObjectIdentifier;
            when sequence_kind =>
               sequence : AsnSequence;
            when address_kind =>
               address : AsnIPAddress;
            when counter_kind =>
               counter : AsnCounter;
            when gauge_kind =>
               gauge : AsnGauge;
            when ticks_kind =>
               ticks : AsnTimeticks;
            when arbitrary_kind =>
               arbitrary : AsnOpaque;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous2_t);

   pragma Unchecked_Union (union_anonymous2_t);

   type AsnAny is record
      asnType  : Win32.BYTE;
      asnValue : union_anonymous2_t;
   end record;

   subtype AsnObjectName is AsnObjectIdentifier;

   subtype AsnObjectSyntax is AsnAny;

   subtype AsnNetworkAddress is AsnIPAddress;

   type RFC1157VarBind is record
      name  : AsnObjectName;
      value : AsnObjectSyntax;
   end record;

   type RFC1157VarBindList is record
      list : a_RFC1157VarBind_t;
      len  : Win32.UINT;
   end record;

   type RFC1157Pdu is record
      varBinds    : RFC1157VarBindList;
      requestType : AsnInteger;
      requestId   : AsnInteger;
      errorStatus : AsnInteger;
      errorIndex  : AsnInteger;
   end record;

   type RFC1157TrapPdu is record
      varBinds     : RFC1157VarBindList;
      enterprise   : AsnObjectIdentifier;
      agentAddr    : AsnNetworkAddress;
      genericTrap  : AsnInteger;
      specificTrap : AsnInteger;
      timeStamp    : AsnTimeticks;
   end record;

   type union_anonymous7_t_kind is (pdu_kind, trap_kind);

   type union_anonymous7_t (Which : union_anonymous7_t_kind := trap_kind) is
      record
         case Which is
            when pdu_kind =>
               pdu : RFC1157Pdu;
            when trap_kind =>
               trap : RFC1157TrapPdu;
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous7_t);

   type RFC1157Pdus is record
      pduType  : Win32.BYTE;
      pduValue : union_anonymous7_t;
   end record;

   type SnmpMgmtCom is record
      dstParty  : AsnObjectIdentifier;
      srcParty  : AsnObjectIdentifier;
      pdu       : RFC1157Pdus;
      community : AsnOctetString;
   end record;

   procedure SNMP_DBG_free
     (x    : Win32.PVOID;
      line : Win32.INT;
      file : Win32.PSTR);

   function SNMP_DBG_malloc
     (x    : Win32.UINT;
      line : Win32.INT;
      file : Win32.PSTR)
      return Win32.PVOID;

   function SNMP_DBG_realloc
     (x    : Win32.PVOID;
      y    : Win32.UINT;
      line : Win32.INT;
      file : Win32.PSTR)
      return Win32.PVOID;

   function SNMP_oidcpy
     (DestObjId : access AsnObjectIdentifier;
      SrcObjId  : access AsnObjectIdentifier)
      return Win32.INT;

   function SnmpUtilOidCpy
     (DestObjId : access AsnObjectIdentifier;
      SrcObjId  : access AsnObjectIdentifier)
      return Win32.INT renames SNMP_oidcpy;

   function SNMP_oidappend
     (DestObjId : access AsnObjectIdentifier;
      SrcObjId  : access AsnObjectIdentifier)
      return Win32.INT;

   function SnmpUtilOidAppend
     (DestObjId : access AsnObjectIdentifier;
      SrcObjId  : access AsnObjectIdentifier)
      return Win32.INT renames SNMP_oidappend;

   procedure SNMP_oidfree (Obj : access AsnObjectIdentifier);

   procedure SnmpUtilOidFree (Obj : access AsnObjectIdentifier) renames
     SNMP_oidfree;

   function SNMP_CopyVarBindList
     (dst  : access RFC1157VarBindList;
      src  : access RFC1157VarBindList)
      return Win32.INT;

   function SnmpUtilVarBindListCpy
     (dst  : access RFC1157VarBindList;
      src  : access RFC1157VarBindList)
      return Win32.INT renames SNMP_CopyVarBindList;

   function SNMP_CopyVarBind
     (dst  : access RFC1157VarBind;
      src  : access RFC1157VarBind)
      return Win32.INT;

   function SnmpUtilVarBindCpy
     (dst  : access RFC1157VarBind;
      src  : access RFC1157VarBind)
      return Win32.INT renames SNMP_CopyVarBind;

   procedure SNMP_FreeVarBindList (VarBindList : access RFC1157VarBindList);

   procedure SnmpUtilVarBindListFree
     (VarBindList : access RFC1157VarBindList) renames SNMP_FreeVarBindList;

   procedure SNMP_FreeVarBind (VarBind : access RFC1157VarBind);

   procedure SnmpUtilVarBindFree (VarBind : access RFC1157VarBind) renames
     SNMP_FreeVarBind;

   procedure SNMP_printany (Any : access AsnAny);

   procedure SnmpUtilPrintAsnAny (Any : access AsnAny) renames SNMP_printany;

private

   pragma Convention (C_Pass_By_Copy, AsnOctetString);
   pragma Convention (C_Pass_By_Copy, AsnObjectIdentifier);
   pragma Convention (C_Pass_By_Copy, AsnAny);
   pragma Convention (C, RFC1157VarBind);
   pragma Convention (C_Pass_By_Copy, RFC1157VarBindList);
   pragma Convention (C, RFC1157Pdu);
   pragma Convention (C, RFC1157TrapPdu);
   pragma Convention (C, RFC1157Pdus);
   pragma Convention (C, SnmpMgmtCom);

   pragma Import (Stdcall, SNMP_DBG_free, "SNMP_DBG_free");
   pragma Import (Stdcall, SNMP_DBG_malloc, "SNMP_DBG_malloc");
   pragma Import (Stdcall, SNMP_DBG_realloc, "SNMP_DBG_realloc");
   pragma Import (Stdcall, SNMP_oidcpy, "SNMP_oidcpy");
   pragma Import (Stdcall, SNMP_oidappend, "SNMP_oidappend");

   pragma Import (Stdcall, SNMP_oidfree, "SNMP_oidfree");
   pragma Import (Stdcall, SNMP_CopyVarBindList, "SNMP_CopyVarBindList");
   pragma Import (Stdcall, SNMP_CopyVarBind, "SNMP_CopyVarBind");
   pragma Import (Stdcall, SNMP_FreeVarBindList, "SNMP_FreeVarBindList");
   pragma Import (Stdcall, SNMP_FreeVarBind, "SNMP_FreeVarBind");
   pragma Import (Stdcall, SNMP_printany, "SNMP_printany");

end Win32.Snmp;
