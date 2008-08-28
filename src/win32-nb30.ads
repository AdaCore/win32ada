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

package Win32.Nb30 is

   use type Interfaces.C.char_array;

   NCBNAMSZ : constant := 16;                --  nb30.h:35
   MAX_LANA : constant := 254;               --  nb30.h:36
   NAME_FLAGS_MASK : constant := 16#87#;            --  nb30.h:110
   GROUP_NAME : constant := 16#80#;            --  nb30.h:112
   UNIQUE_NAME : constant := 16#0#;             --  nb30.h:113
   REGISTERING : constant := 16#0#;             --  nb30.h:115
   REGISTERED : constant := 16#4#;             --  nb30.h:116
   DEREGISTERED : constant := 16#5#;             --  nb30.h:117
   DUPLICATE : constant := 16#6#;             --  nb30.h:118
   DUPLICATE_DEREG : constant := 16#7#;             --  nb30.h:119
   LISTEN_OUTSTANDING : constant := 16#1#;             --  nb30.h:146
   CALL_PENDING : constant := 16#2#;             --  nb30.h:147
   SESSION_ESTABLISHED : constant := 16#3#;             --  nb30.h:148
   HANGUP_PENDING : constant := 16#4#;             --  nb30.h:149
   HANGUP_COMPLETE : constant := 16#5#;             --  nb30.h:150
   SESSION_ABORTED : constant := 16#6#;             --  nb30.h:151
   ALL_TRANSPORTS : constant CHAR_Array := "M000" & Nul;
   --  nb30.h:198
   MS_NBF : constant CHAR_Array := "MNBF" & Nul;
   --  nb30.h:199
   NCBCALL : constant := 16#10#;            --  nb30.h:212
   NCBLISTEN : constant := 16#11#;            --  nb30.h:213
   NCBHANGUP : constant := 16#12#;            --  nb30.h:214
   NCBSEND : constant := 16#14#;            --  nb30.h:215
   NCBRECV : constant := 16#15#;            --  nb30.h:216
   NCBRECVANY : constant := 16#16#;            --  nb30.h:217
   NCBCHAINSEND : constant := 16#17#;            --  nb30.h:218
   NCBDGSEND : constant := 16#20#;            --  nb30.h:219
   NCBDGRECV : constant := 16#21#;            --  nb30.h:220
   NCBDGSENDBC : constant := 16#22#;            --  nb30.h:221
   NCBDGRECVBC : constant := 16#23#;            --  nb30.h:222
   NCBADDNAME : constant := 16#30#;            --  nb30.h:223
   NCBDELNAME : constant := 16#31#;            --  nb30.h:224
   NCBRESET : constant := 16#32#;            --  nb30.h:225
   NCBASTAT : constant := 16#33#;            --  nb30.h:226
   NCBSSTAT : constant := 16#34#;            --  nb30.h:227
   NCBCANCEL : constant := 16#35#;            --  nb30.h:228
   NCBADDGRNAME : constant := 16#36#;            --  nb30.h:229
   NCBENUM : constant := 16#37#;            --  nb30.h:230
   NCBUNLINK : constant := 16#70#;            --  nb30.h:231
   NCBSENDNA : constant := 16#71#;            --  nb30.h:232
   NCBCHAINSENDNA : constant := 16#72#;            --  nb30.h:233
   NCBLANSTALERT : constant := 16#73#;            --  nb30.h:234
   NCBACTION : constant := 16#77#;            --  nb30.h:235
   NCBFINDNAME : constant := 16#78#;            --  nb30.h:236
   NCBTRACE : constant := 16#79#;            --  nb30.h:237
   ASYNCH : constant := 16#80#;            --  nb30.h:240
   NRC_GOODRET : constant := 16#0#;             --  nb30.h:246
   NRC_BUFLEN : constant := 16#1#;             --  nb30.h:248
   NRC_ILLCMD : constant := 16#3#;             --  nb30.h:249
   NRC_CMDTMO : constant := 16#5#;             --  nb30.h:250
   NRC_INCOMP : constant := 16#6#;             --  nb30.h:251
   NRC_BADDR : constant := 16#7#;             --  nb30.h:252
   NRC_SNUMOUT : constant := 16#8#;             --  nb30.h:253
   NRC_NORES : constant := 16#9#;             --  nb30.h:254
   NRC_SCLOSED : constant := 16#a#;             --  nb30.h:255
   NRC_CMDCAN : constant := 16#b#;             --  nb30.h:256
   NRC_DUPNAME : constant := 16#d#;             --  nb30.h:257
   NRC_NAMTFUL : constant := 16#e#;             --  nb30.h:258
   NRC_ACTSES : constant := 16#f#;             --  nb30.h:259
   NRC_LOCTFUL : constant := 16#11#;            --  nb30.h:260
   NRC_REMTFUL : constant := 16#12#;            --  nb30.h:261
   NRC_ILLNN : constant := 16#13#;            --  nb30.h:262
   NRC_NOCALL : constant := 16#14#;            --  nb30.h:263
   NRC_NOWILD : constant := 16#15#;            --  nb30.h:264
   NRC_INUSE : constant := 16#16#;            --  nb30.h:265
   NRC_NAMERR : constant := 16#17#;            --  nb30.h:266
   NRC_SABORT : constant := 16#18#;            --  nb30.h:267
   NRC_NAMCONF : constant := 16#19#;            --  nb30.h:268
   NRC_IFBUSY : constant := 16#21#;            --  nb30.h:269
   NRC_TOOMANY : constant := 16#22#;            --  nb30.h:270
   NRC_BRIDGE : constant := 16#23#;            --  nb30.h:271
   NRC_CANOCCR : constant := 16#24#;            --  nb30.h:272
   NRC_CANCEL : constant := 16#26#;            --  nb30.h:273
   NRC_DUPENV : constant := 16#30#;            --  nb30.h:274
   NRC_ENVNOTDEF : constant := 16#34#;            --  nb30.h:275
   NRC_OSRESNOTAV : constant := 16#35#;            --  nb30.h:276
   NRC_MAXAPPS : constant := 16#36#;            --  nb30.h:277
   NRC_NOSAPS : constant := 16#37#;            --  nb30.h:278
   NRC_NORESOURCES : constant := 16#38#;            --  nb30.h:279
   NRC_INVADDRESS : constant := 16#39#;            --  nb30.h:280
   NRC_INVDDID : constant := 16#3b#;            --  nb30.h:281
   NRC_LOCKFAIL : constant := 16#3c#;            --  nb30.h:282
   NRC_OPENERR : constant := 16#3f#;            --  nb30.h:283
   NRC_SYSTEM : constant := 16#40#;            --  nb30.h:284
   NRC_PENDING : constant := 16#ff#;            --  nb30.h:286

   type NCB;                                               --  nb30.h:53
   type ADAPTER_STATUS;                                    --  nb30.h:68
   type NAME_BUFFER;                                       --  nb30.h:102
   type SESSION_HEADER;                                    --  nb30.h:128
   type SESSION_BUFFER;                                    --  nb30.h:135
   type LANA_ENUM;                                         --  nb30.h:160
   type FIND_NAME_HEADER;                                  --  nb30.h:170
   type FIND_NAME_BUFFER;                                  --  nb30.h:176
   type ACTION_HEADER;                                     --  nb30.h:190

   type PNCB is access all NCB;                            --  nb30.h:61
   type PADAPTER_STATUS is access all ADAPTER_STATUS;      --  nb30.h:100
   type PNAME_BUFFER is access all NAME_BUFFER;            --  nb30.h:106
   type PSESSION_HEADER is access all SESSION_HEADER;      --  nb30.h:133
   type PSESSION_BUFFER is access all SESSION_BUFFER;      --  nb30.h:142
   type PLANA_ENUM is access all LANA_ENUM;                --  nb30.h:163
   type PFIND_NAME_HEADER is access all FIND_NAME_HEADER;  --  nb30.h:174
   type PFIND_NAME_BUFFER is access all FIND_NAME_BUFFER;  --  nb30.h:183
   type PACTION_HEADER is access all ACTION_HEADER;        --  nb30.h:194

   type ncb_post_func is access procedure (p1 : access NCB);

   type NCB is                                             --  nb30.h:53
      record
         ncb_command : Win32.UCHAR;                      --  nb30.h:43
         ncb_retcode : Win32.UCHAR;                      --  nb30.h:44
         ncb_lsn : Win32.UCHAR;                      --  nb30.h:45
         ncb_num : Win32.UCHAR;                      --  nb30.h:46
         ncb_buffer : Win32.PUCHAR;                     --  nb30.h:47
         ncb_length : Win32.WORD;                       --  nb30.h:48
         ncb_callname : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1); --  nb30.h:49
         ncb_name : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1); --  nb30.h:50
         ncb_rto : Win32.UCHAR;                      --  nb30.h:51
         ncb_sto : Win32.UCHAR;                      --  nb30.h:52
         ncb_post : ncb_post_func;                    --  nb30.h:53
         ncb_lana_num : Win32.UCHAR;                      --  nb30.h:54
         ncb_cmd_cplt : Win32.UCHAR;                      --  nb30.h:55
         ncb_reserve : Win32.UCHAR_Array (0 .. 9);          --  nb30.h:56
         ncb_event : Win32.Winnt.HANDLE;               --  nb30.h:57
      end record;

   type ADAPTER_STATUS is                                  --  nb30.h:68
      record
         adapter_address : Win32.UCHAR_Array (0 .. 5);     --  nb30.h:69
         rev_major : Win32.UCHAR;                 --  nb30.h:70
         reserved0 : Win32.UCHAR;                 --  nb30.h:71
         adapter_type : Win32.UCHAR;                 --  nb30.h:72
         rev_minor : Win32.UCHAR;                 --  nb30.h:73
         duration : Win32.WORD;                  --  nb30.h:74
         frmr_recv : Win32.WORD;                  --  nb30.h:75
         frmr_xmit : Win32.WORD;                  --  nb30.h:76
         iframe_recv_err : Win32.WORD;                  --  nb30.h:78
         xmit_aborts : Win32.WORD;                  --  nb30.h:80
         xmit_success : Win32.DWORD;                 --  nb30.h:81
         recv_success : Win32.DWORD;                 --  nb30.h:82
         iframe_xmit_err : Win32.WORD;                  --  nb30.h:84
         recv_buff_unavail : Win32.WORD;                  --  nb30.h:86
         t1_timeouts : Win32.WORD;                  --  nb30.h:87
         ti_timeouts : Win32.WORD;                  --  nb30.h:88
         reserved1 : Win32.DWORD;                 --  nb30.h:89
         free_ncbs : Win32.WORD;                  --  nb30.h:90
         max_cfg_ncbs : Win32.WORD;                  --  nb30.h:91
         max_ncbs : Win32.WORD;                  --  nb30.h:92
         xmit_buf_unavail : Win32.WORD;                  --  nb30.h:93
         max_dgram_size : Win32.WORD;                  --  nb30.h:94
         pending_sess : Win32.WORD;                  --  nb30.h:95
         max_cfg_sess : Win32.WORD;                  --  nb30.h:96
         max_sess : Win32.WORD;                  --  nb30.h:97
         max_sess_pkt_size : Win32.WORD;                  --  nb30.h:98
         name_count : Win32.WORD;                  --  nb30.h:99
      end record;

   type NAME_BUFFER is                                     --  nb30.h:102
      record
         name : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);   --  nb30.h:103
         name_num : Win32.UCHAR;                        --  nb30.h:104
         name_flags : Win32.UCHAR;                        --  nb30.h:105
      end record;

   type SESSION_HEADER is                                  --  nb30.h:128
      record
         sess_name : Win32.UCHAR;               --  nb30.h:129
         num_sess : Win32.UCHAR;               --  nb30.h:130
         rcv_dg_outstanding : Win32.UCHAR;               --  nb30.h:131
         rcv_any_outstanding : Win32.UCHAR;               --  nb30.h:132
      end record;

   type SESSION_BUFFER is                                  --  nb30.h:135
      record
         lsn : Win32.UCHAR;                 --  nb30.h:136
         state : Win32.UCHAR;                 --  nb30.h:137
         local_name : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);
         --  nb30.h:138
         remote_name : Win32.UCHAR_Array (0 .. NCBNAMSZ - 1);
         --  nb30.h:139
         rcvs_outstanding : Win32.UCHAR;                 --  nb30.h:140
         sends_outstanding : Win32.UCHAR;                 --  nb30.h:141
      end record;

   type LANA_ENUM is                                       --  nb30.h:160
      record
         length : Win32.UCHAR;                            --  nb30.h:161
         lana : UCHAR_Array (0 .. MAX_LANA);               --  nb30.h:162
      end record;

   type FIND_NAME_HEADER is                                --  nb30.h:170
      record
         node_count : Win32.WORD;                       --  nb30.h:171
         reserved : Win32.UCHAR;                      --  nb30.h:172
         unique_group : Win32.UCHAR;                      --  nb30.h:173
      end record;

   type FIND_NAME_BUFFER is                                --  nb30.h:176
      record
         length : Win32.UCHAR;                  --  nb30.h:177
         access_control : Win32.UCHAR;                  --  nb30.h:178
         frame_control : Win32.UCHAR;                  --  nb30.h:179
         destination_addr : Win32.UCHAR_Array (0 .. 5);      --  nb30.h:180
         source_addr : Win32.UCHAR_Array (0 .. 5);      --  nb30.h:181
         routing_info : Win32.UCHAR_Array (0 .. 17);     --  nb30.h:182
      end record;

   type ACTION_HEADER is                                   --  nb30.h:190
      record
         transport_id : Win32.ULONG;                      --  nb30.h:191
         action_code : Win32.USHORT;                     --  nb30.h:192
         reserved : Win32.USHORT;                     --  nb30.h:193
      end record;

   function Netbios
     (pncb : access NCB)
     return Win32.UCHAR;                          --  nb30.h:297

private

   pragma Convention (C, NCB);                              --  nb30.h:53
   pragma Convention (C, ADAPTER_STATUS);                   --  nb30.h:68
   pragma Convention (C, NAME_BUFFER);                      --  nb30.h:102
   pragma Convention (C_Pass_By_Copy, SESSION_HEADER);      --  nb30.h:128
   pragma Convention (C, SESSION_BUFFER);                   --  nb30.h:135
   pragma Convention (C, LANA_ENUM);                        --  nb30.h:160
   pragma Convention (C_Pass_By_Copy, FIND_NAME_HEADER);    --  nb30.h:170
   pragma Convention (C, FIND_NAME_BUFFER);                 --  nb30.h:176
   pragma Convention (C_Pass_By_Copy, ACTION_HEADER);       --  nb30.h:190

   pragma Import (Stdcall, Netbios, "Netbios");             --  nb30.h:297

end Win32.Nb30;
