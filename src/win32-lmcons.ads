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

with Win32.Lmerr;
with Win32.Winnt;

package Win32.Lmcons is

   use type Interfaces.C.char_array;

   CNLEN             : constant := 15;             --  lmcons.h :76
   LM20_CNLEN        : constant := 15;             --  lmcons.h :77
   DNLEN             : constant := 15;             --  lmcons.h :78
   LM20_DNLEN        : constant := 15;             --  lmcons.h :79
   UNCLEN            : constant := 17;             --  lmcons.h :85
   LM20_UNCLEN       : constant := 17;             --  lmcons.h :86
   NNLEN             : constant := 80;             --  lmcons.h :88
   LM20_NNLEN        : constant := 12;             --  lmcons.h :89
   RMLEN             : constant := 98;             --  lmcons.h :91
   LM20_RMLEN        : constant := 30;             --  lmcons.h :92
   SNLEN             : constant := 80;             --  lmcons.h :94
   LM20_SNLEN        : constant := 15;             --  lmcons.h :95
   STXTLEN           : constant := 256;            --  lmcons.h :96
   LM20_STXTLEN      : constant := 63;             --  lmcons.h :97
   PATHLEN           : constant := 256;            --  lmcons.h :99
   LM20_PATHLEN      : constant := 256;            --  lmcons.h :100
   DEVLEN            : constant := 80;             --  lmcons.h :102
   LM20_DEVLEN       : constant := 8;              --  lmcons.h :103
   EVLEN             : constant := 16;             --  lmcons.h :105
   UNLEN             : constant := 256;            --  lmcons.h :111
   LM20_UNLEN        : constant := 20;             --  lmcons.h :112
   GNLEN             : constant := 256;            --  lmcons.h :114
   LM20_GNLEN        : constant := 20;             --  lmcons.h :115
   PWLEN             : constant := 256;            --  lmcons.h :117
   LM20_PWLEN        : constant := 14;             --  lmcons.h :118
   SHPWLEN           : constant := 8;              --  lmcons.h :120
   CLTYPE_LEN        : constant := 12;             --  lmcons.h :123
   MAXCOMMENTSZ      : constant := 256;            --  lmcons.h :126
   LM20_MAXCOMMENTSZ : constant := 48;             --  lmcons.h :127
   QNLEN             : constant := 80;             --  lmcons.h :129
   LM20_QNLEN        : constant := 12;             --  lmcons.h :130
   ALERTSZ           : constant := 128;            --  lmcons.h :140
   MAXDEVENTRIES     : constant := Win32.INT'Size; --  lmcons.h :141
   NETBIOS_NAME_LEN  : constant := 16;             --  lmcons.h :147
   MAX_PREFERRED_LENGTH : constant Win32.DWORD := Win32.DWORD'Last;
   --  lmcons.h:155
   CRYPT_KEY_LEN      : constant := 7;  --  lmcons.h :161
   CRYPT_TXT_LEN      : constant := 8;  --  lmcons.h :162
   ENCRYPTED_PWLEN    : constant := 16; --  lmcons.h :163
   SESSION_PWLEN      : constant := 24; --  lmcons.h :164
   SESSION_CRYPT_KLEN : constant := 21; --  lmcons.h :165
   PARMNUM_ALL        : constant := 0;  --  lmcons.h :172
   PARM_ERROR_UNKNOWN : constant Win32.DWORD := 16#ffff_ffff#;
   --  lmcons.h:175
   PARM_ERROR_NONE        : constant := 0;    --  lmcons.h      :176
   PARMNUM_BASE_INFOLEVEL : constant := 1000; --  lmcons.h      :177
   PLATFORM_ID_DOS        : constant := 300;  --  lmcons.h      :242
   PLATFORM_ID_OS2        : constant := 400;  --  lmcons.h      :243
   PLATFORM_ID_NT         : constant := 500;  --  lmcons.h      :244
   PLATFORM_ID_OSF        : constant := 600;  --  lmcons.h      :245
   PLATFORM_ID_VMS        : constant := 700;  --  lmcons.h      :246
   MIN_LANMAN_MESSAGE_ID : constant := Win32.Lmerr.NERR_BASE;
   --  lmcons :266
   MAX_LANMAN_MESSAGE_ID : constant := 5799;              --  lmcons.h:267

   subtype TEXT is Win32.Winnt.TEXT;

   MESSAGE_FILENAME    : constant TEXT := "NETMSG" & Nul;  --  lmcons.h :183
   OS2MSG_FILENAME     : constant TEXT := "BASE" & Nul;    --  lmcons.h :184
   HELP_MSG_FILENAME   : constant TEXT := "NETH" & Nul;    --  lmcons.h :185
   BACKUP_MSG_FILENAME : constant TEXT := "BAK.MSG" & Nul; --  lmcons.h :197

   type NET_API_STATUS is new Win32.DWORD;                 --  lmcons.h:213
   subtype API_RET_TYPE is NET_API_STATUS;                 --  lmcons.h:214

end Win32.Lmcons;


