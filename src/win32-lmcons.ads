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

with Win32.Lmerr;
with Win32.Winnt;

package Win32.Lmcons is

   use type Interfaces.C.char_array;

   CNLEN                  : constant := 15;
   LM20_CNLEN             : constant := 15;
   DNLEN                  : constant := 15;
   LM20_DNLEN             : constant := 15;
   UNCLEN                 : constant := 17;
   LM20_UNCLEN            : constant := 17;
   NNLEN                  : constant := 80;
   LM20_NNLEN             : constant := 12;
   RMLEN                  : constant := 98;
   LM20_RMLEN             : constant := 30;
   SNLEN                  : constant := 80;
   LM20_SNLEN             : constant := 15;
   STXTLEN                : constant := 256;
   LM20_STXTLEN           : constant := 63;
   PATHLEN                : constant := 256;
   LM20_PATHLEN           : constant := 256;
   DEVLEN                 : constant := 80;
   LM20_DEVLEN            : constant := 8;
   EVLEN                  : constant := 16;
   UNLEN                  : constant := 256;
   LM20_UNLEN             : constant := 20;
   GNLEN                  : constant := 256;
   LM20_GNLEN             : constant := 20;
   PWLEN                  : constant := 256;
   LM20_PWLEN             : constant := 14;
   SHPWLEN                : constant := 8;
   CLTYPE_LEN             : constant := 12;
   MAXCOMMENTSZ           : constant := 256;
   LM20_MAXCOMMENTSZ      : constant := 48;
   QNLEN                  : constant := 80;
   LM20_QNLEN             : constant := 12;
   ALERTSZ                : constant := 128;
   MAXDEVENTRIES          : constant := Win32.INT'Size;
   NETBIOS_NAME_LEN       : constant := 16;
   MAX_PREFERRED_LENGTH   : constant Win32.DWORD := Win32.DWORD'Last;
   CRYPT_KEY_LEN          : constant := 7;
   CRYPT_TXT_LEN          : constant := 8;
   ENCRYPTED_PWLEN        : constant := 16;
   SESSION_PWLEN          : constant := 24;
   SESSION_CRYPT_KLEN     : constant := 21;
   PARMNUM_ALL            : constant := 0;
   PARM_ERROR_UNKNOWN     : constant Win32.DWORD := 16#ffff_ffff#;
   PARM_ERROR_NONE        : constant := 0;
   PARMNUM_BASE_INFOLEVEL : constant := 1000;
   PLATFORM_ID_DOS        : constant := 300;
   PLATFORM_ID_OS2        : constant := 400;
   PLATFORM_ID_NT         : constant := 500;
   PLATFORM_ID_OSF        : constant := 600;
   PLATFORM_ID_VMS        : constant := 700;
   MIN_LANMAN_MESSAGE_ID  : constant := Win32.Lmerr.NERR_BASE;
   MAX_LANMAN_MESSAGE_ID  : constant := 5799;

   subtype TEXT is Win32.Winnt.TEXT;

   MESSAGE_FILENAME    : constant TEXT := "NETMSG" & Nul;
   OS2MSG_FILENAME     : constant TEXT := "BASE" & Nul;
   HELP_MSG_FILENAME   : constant TEXT := "NETH" & Nul;
   BACKUP_MSG_FILENAME : constant TEXT := "BAK.MSG" & Nul;

   type NET_API_STATUS is new Win32.DWORD;
   subtype API_RET_TYPE is NET_API_STATUS;

end Win32.Lmcons;
