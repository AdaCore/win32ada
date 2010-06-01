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

package Win32.Nb30 is

   use type Interfaces.C.char_array;

   NCBNAMSZ            : constant := 16;
   MAX_LANA            : constant := 254;
   NAME_FLAGS_MASK     : constant := 16#87#;
   GROUP_NAME          : constant := 16#80#;
   UNIQUE_NAME         : constant := 16#0#;
   REGISTERING         : constant := 16#0#;
   REGISTERED          : constant := 16#4#;
   DEREGISTERED        : constant := 16#5#;
   DUPLICATE           : constant := 16#6#;
   DUPLICATE_DEREG     : constant := 16#7#;
   LISTEN_OUTSTANDING  : constant := 16#1#;
   CALL_PENDING        : constant := 16#2#;
   SESSION_ESTABLISHED : constant := 16#3#;
   HANGUP_PENDING      : constant := 16#4#;
   HANGUP_COMPLETE     : constant := 16#5#;
   SESSION_ABORTED     : constant := 16#6#;
   ALL_TRANSPORTS      : constant CHAR_Array := "M000" & Nul;
   MS_NBF              : constant CHAR_Array := "MNBF" & Nul;
   NCBCALL             : constant := 16#10#;
   NCBLISTEN           : constant := 16#11#;
   NCBHANGUP           : constant := 16#12#;
   NCBSEND             : constant := 16#14#;
   NCBRECV             : constant := 16#15#;
   NCBRECVANY          : constant := 16#16#;
   NCBCHAINSEND        : constant := 16#17#;
   NCBDGSEND           : constant := 16#20#;
   NCBDGRECV           : constant := 16#21#;
   NCBDGSENDBC         : constant := 16#22#;
   NCBDGRECVBC         : constant := 16#23#;
   NCBADDNAME          : constant := 16#30#;
   NCBDELNAME          : constant := 16#31#;
   NCBRESET            : constant := 16#32#;
   NCBASTAT            : constant := 16#33#;
   NCBSSTAT            : constant := 16#34#;
   NCBCANCEL           : constant := 16#35#;
   NCBADDGRNAME        : constant := 16#36#;
   NCBENUM             : constant := 16#37#;
   NCBUNLINK           : constant := 16#70#;
   NCBSENDNA           : constant := 16#71#;
   NCBCHAINSENDNA      : constant := 16#72#;
   NCBLANSTALERT       : constant := 16#73#;
   NCBACTION           : constant := 16#77#;
   NCBFINDNAME         : constant := 16#78#;
   NCBTRACE            : constant := 16#79#;
   ASYNCH              : constant := 16#80#;
   NRC_GOODRET         : constant := 16#0#;
   NRC_BUFLEN          : constant := 16#1#;
   NRC_ILLCMD          : constant := 16#3#;
   NRC_CMDTMO          : constant := 16#5#;
   NRC_INCOMP          : constant := 16#6#;
   NRC_BADDR           : constant := 16#7#;
   NRC_SNUMOUT         : constant := 16#8#;
   NRC_NORES           : constant := 16#9#;
   NRC_SCLOSED         : constant := 16#a#;
   NRC_CMDCAN          : constant := 16#b#;
   NRC_DUPNAME         : constant := 16#d#;
   NRC_NAMTFUL         : constant := 16#e#;
   NRC_ACTSES          : constant := 16#f#;
   NRC_LOCTFUL         : constant := 16#11#;
   NRC_REMTFUL         : constant := 16#12#;
   NRC_ILLNN           : constant := 16#13#;
   NRC_NOCALL          : constant := 16#14#;
   NRC_NOWILD          : constant := 16#15#;
   NRC_INUSE           : constant := 16#16#;
   NRC_NAMERR          : constant := 16#17#;
   NRC_SABORT          : constant := 16#18#;
   NRC_NAMCONF         : constant := 16#19#;
   NRC_IFBUSY          : constant := 16#21#;
   NRC_TOOMANY         : constant := 16#22#;
   NRC_BRIDGE          : constant := 16#23#;
   NRC_CANOCCR         : constant := 16#24#;
   NRC_CANCEL          : constant := 16#26#;
   NRC_DUPENV          : constant := 16#30#;
   NRC_ENVNOTDEF       : constant := 16#34#;
   NRC_OSRESNOTAV      : constant := 16#35#;
   NRC_MAXAPPS         : constant := 16#36#;
   NRC_NOSAPS          : constant := 16#37#;
   NRC_NORESOURCES     : constant := 16#38#;
   NRC_INVADDRESS      : constant := 16#39#;
   NRC_INVDDID         : constant := 16#3b#;
   NRC_LOCKFAIL        : constant := 16#3c#;
   NRC_OPENERR         : constant := 16#3f#;
   NRC_SYSTEM          : constant := 16#40#;
   NRC_PENDING         : constant := 16#ff#;

   type NCB;
   type ADAPTER_STATUS;
   type NAME_BUFFER;
   type SESSION_HEADER;
   type SESSION_BUFFER;
   type LANA_ENUM;
   type FIND_NAME_HEADER;
   type FIND_NAME_BUFFER;
   type ACTION_HEADER;

   type PNCB is access all NCB;
   type PADAPTER_STATUS is access all ADAPTER_STATUS;
   type PNAME_BUFFER is access all NAME_BUFFER;
   type PSESSION_HEADER is access all SESSION_HEADER;
   type PSESSION_BUFFER is access all SESSION_BUFFER;
   type PLANA_ENUM is access all LANA_ENUM;
   type PFIND_NAME_HEADER is access all FIND_NAME_HEADER;
   type PFIND_NAME_BUFFER is access all FIND_NAME_BUFFER;
   type PACTION_HEADER is access all ACTION_HEADER;

   type ncb_post_func is access procedure (p1 : access NCB);

   type NCB is record
      ncb_command  : Win32.UCHAR;
      ncb_retcode  : Win32.UCHAR;
      ncb_lsn      : Win32.UCHAR;
      ncb_num      : Win32.UCHAR;
      ncb_buffer   : Win32.PUCHAR;
      ncb_length   : Win32.WORD;
      ncb_callname : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);
      ncb_name     : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);
      ncb_rto      : Win32.UCHAR;
      ncb_sto      : Win32.UCHAR;
      ncb_post     : ncb_post_func;
      ncb_lana_num : Win32.UCHAR;
      ncb_cmd_cplt : Win32.UCHAR;
      ncb_reserve  : Win32.UCHAR_Array (0 .. 9);
      ncb_event    : Win32.Winnt.HANDLE;
   end record;

   type ADAPTER_STATUS is record
      adapter_address   : Win32.UCHAR_Array (0 .. 5);
      rev_major         : Win32.UCHAR;
      reserved0         : Win32.UCHAR;
      adapter_type      : Win32.UCHAR;
      rev_minor         : Win32.UCHAR;
      duration          : Win32.WORD;
      frmr_recv         : Win32.WORD;
      frmr_xmit         : Win32.WORD;
      iframe_recv_err   : Win32.WORD;
      xmit_aborts       : Win32.WORD;
      xmit_success      : Win32.DWORD;
      recv_success      : Win32.DWORD;
      iframe_xmit_err   : Win32.WORD;
      recv_buff_unavail : Win32.WORD;
      t1_timeouts       : Win32.WORD;
      ti_timeouts       : Win32.WORD;
      reserved1         : Win32.DWORD;
      free_ncbs         : Win32.WORD;
      max_cfg_ncbs      : Win32.WORD;
      max_ncbs          : Win32.WORD;
      xmit_buf_unavail  : Win32.WORD;
      max_dgram_size    : Win32.WORD;
      pending_sess      : Win32.WORD;
      max_cfg_sess      : Win32.WORD;
      max_sess          : Win32.WORD;
      max_sess_pkt_size : Win32.WORD;
      name_count        : Win32.WORD;
   end record;

   type NAME_BUFFER is record
      name       : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);
      name_num   : Win32.UCHAR;
      name_flags : Win32.UCHAR;
   end record;

   type SESSION_HEADER is record
      sess_name           : Win32.UCHAR;
      num_sess            : Win32.UCHAR;
      rcv_dg_outstanding  : Win32.UCHAR;
      rcv_any_outstanding : Win32.UCHAR;
   end record;

   type SESSION_BUFFER is record
      lsn               : Win32.UCHAR;
      state             : Win32.UCHAR;
      local_name        : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);
      remote_name       : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);
      rcvs_outstanding  : Win32.UCHAR;
      sends_outstanding : Win32.UCHAR;
   end record;

   type LANA_ENUM is record
      length : Win32.UCHAR;
      lana   : UCHAR_Array (0 .. MAX_LANA);
   end record;

   type FIND_NAME_HEADER is record
      node_count   : Win32.WORD;
      reserved     : Win32.UCHAR;
      unique_group : Win32.UCHAR;
   end record;

   type FIND_NAME_BUFFER is record
      length           : Win32.UCHAR;
      access_control   : Win32.UCHAR;
      frame_control    : Win32.UCHAR;
      destination_addr : Win32.UCHAR_Array (0 .. 5);
      source_addr      : Win32.UCHAR_Array (0 .. 5);
      routing_info     : Win32.UCHAR_Array (0 .. 17);
   end record;

   type ACTION_HEADER is record
      transport_id : Win32.ULONG;
      action_code  : Win32.USHORT;
      reserved     : Win32.USHORT;
   end record;

   function Netbios (pncb : access NCB) return Win32.UCHAR;

private

   pragma Convention (C, NCB);
   pragma Convention (C, ADAPTER_STATUS);
   pragma Convention (C, NAME_BUFFER);
   pragma Convention (C_Pass_By_Copy, SESSION_HEADER);
   pragma Convention (C, SESSION_BUFFER);
   pragma Convention (C, LANA_ENUM);
   pragma Convention (C_Pass_By_Copy, FIND_NAME_HEADER);
   pragma Convention (C, FIND_NAME_BUFFER);
   pragma Convention (C_Pass_By_Copy, ACTION_HEADER);

   pragma Import (Stdcall, Netbios, "Netbios");

end Win32.Nb30;
