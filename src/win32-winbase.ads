--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-winbase.ads, v $
--  $Revision : 1.1 $ $Date : 1998/12/22 22 :48 :53 $ $Author : obry $
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

with Ada.Unchecked_Conversion;
with Stdarg;
with Win32.Windef;
with Win32.Winnt;

package Win32.Winbase is

   INVALID_HANDLE_VALUE : constant Win32.Winnt.HANDLE;
   --  winbase.h :57
   INVALID_FILE_SIZE : constant DWORD :=   16#ffffffff#;
   --  winbase.h :58
   FILE_BEGIN : constant :=   0;          --  winbase.h :60
   FILE_CURRENT : constant :=   1;          --  winbase.h :61
   FILE_END : constant :=   2;          --  winbase.h :62
   TIME_ZONE_ID_INVALID : constant DWORD :=   16#ffffffff#;
   --  winbase.h :64
   WAIT_FAILED : constant DWORD :=   16#ffffffff#;
   --  winbase.h :66
   WAIT_OBJECT_0 : DWORD renames Win32.Winnt.STATUS_WAIT_0;
   --  winbase.h :67
   WAIT_ABANDONED : DWORD renames
     Win32.Winnt.STATUS_ABANDONED_WAIT_0;
   --  winbase.h :79
   WAIT_ABANDONED_0 : DWORD renames
     Win32.Winnt.STATUS_ABANDONED_WAIT_0;
   --  winbase.h :80
   WAIT_TIMEOUT : DWORD renames
     Win32.Winnt.STATUS_TIMEOUT;
   --  winbase.h :72
   WAIT_IO_COMPLETION : DWORD renames
     Win32.Winnt.STATUS_USER_APC;
   --  winbase.h :73
   STILL_ACTIVE : DWORD renames
     Win32.Winnt.STATUS_PENDING;
   --  winbase.h :74
   EXCEPTION_ACCESS_VIOLATION : DWORD renames
     Win32.Winnt.STATUS_ACCESS_VIOLATION;
   --  winbase.h :75
   EXCEPTION_DATATYPE_MISALIGNMENT : DWORD renames Win32.Winnt.
     STATUS_DATATYPE_MISALIGNMENT;
   --  winbase.h :76
   EXCEPTION_BREAKPOINT : DWORD renames Win32.Winnt.
     STATUS_BREAKPOINT;
   --  winbase.h :77
   EXCEPTION_SINGLE_STEP : DWORD renames
     Win32.Winnt.STATUS_SINGLE_STEP;
   --  winbase.h :78
   EXCEPTION_ARRAY_BOUNDS_EXCEEDED : DWORD renames Win32.Winnt.
     STATUS_ARRAY_BOUNDS_EXCEEDED;
   --  winbase.h :79
   EXCEPTION_FLT_DENORMAL_OPERAND : DWORD renames Win32.Winnt.
     STATUS_FLOAT_DENORMAL_OPERAND;
   --  winbase.h :80
   EXCEPTION_FLT_DIVIDE_BY_ZERO : DWORD renames
     Win32.Winnt.STATUS_FLOAT_DIVIDE_BY_ZERO;
   --  winbase.h :81
   EXCEPTION_FLT_INEXACT_RESULT : DWORD renames
     Win32.Winnt.STATUS_FLOAT_INEXACT_RESULT;
   --  winbase.h :82
   EXCEPTION_FLT_INVALID_OPERATION : DWORD renames Win32.Winnt.
     STATUS_FLOAT_INVALID_OPERATION;
   --  winbase.h :83
   EXCEPTION_FLT_OVERFLOW : DWORD renames
     Win32.Winnt.STATUS_FLOAT_OVERFLOW;
   --  winbase.h :84
   EXCEPTION_FLT_STACK_CHECK : DWORD renames
     Win32.Winnt.STATUS_FLOAT_STACK_CHECK;
   --  winbase.h :85
   EXCEPTION_FLT_UNDERFLOW : DWORD renames
     Win32.Winnt.STATUS_FLOAT_UNDERFLOW;
   --  winbase.h :86
   EXCEPTION_INT_DIVIDE_BY_ZERO : DWORD renames Win32.Winnt.
     STATUS_INTEGER_DIVIDE_BY_ZERO;
   --  winbase.h :87
   EXCEPTION_INT_OVERFLOW : DWORD renames
     Win32.Winnt.STATUS_INTEGER_OVERFLOW;
   --  winbase.h :88
   EXCEPTION_PRIV_INSTRUCTION : DWORD renames Win32.Winnt.
     STATUS_PRIVILEGED_INSTRUCTION;
   --  winbase.h :89
   EXCEPTION_IN_PAGE_ERROR : DWORD renames
     Win32.Winnt.STATUS_IN_PAGE_ERROR;
   --  winbase.h :90
   EXCEPTION_ILLEGAL_INSTRUCTION : DWORD renames
     Win32.Winnt.STATUS_ILLEGAL_INSTRUCTION;
   --  winbase.h :91
   EXCEPTION_NONCONTINUABLE_EXCEPTION : DWORD renames Win32.Winnt.
     STATUS_NONCONTINUABLE_EXCEPTION;
   --  winbase.h :92
   EXCEPTION_STACK_OVERFLOW : DWORD renames
     Win32.Winnt.STATUS_STACK_OVERFLOW;
   --  winbase.h :93
   EXCEPTION_INVALID_DISPOSITION : DWORD renames
     Win32.Winnt.STATUS_INVALID_DISPOSITION;
   --  winbase.h :94
   EXCEPTION_GUARD_PAGE : DWORD renames
     Win32.Winnt.STATUS_GUARD_PAGE_VIOLATION;
   --  winbase.h :95
   CONTROL_C_EXIT : DWORD renames
     Win32.Winnt.STATUS_CONTROL_C_EXIT;
   --  winbase.h :96
   FILE_FLAG_WRITE_THROUGH : constant :=   16#80000000#;
   --  winbase.h :107
   FILE_FLAG_OVERLAPPED : constant :=   16#40000000#;
   --  winbase.h :108
   FILE_FLAG_NO_BUFFERING : constant :=   16#20000000#;
   --  winbase.h :109
   FILE_FLAG_RANDOM_ACCESS : constant :=   16#10000000#;
   --  winbase.h :110
   FILE_FLAG_SEQUENTIAL_SCAN : constant :=   16#8000000#; --  winbase.h :111
   FILE_FLAG_DELETE_ON_CLOSE : constant :=   16#4000000#; --  winbase.h :112
   FILE_FLAG_BACKUP_SEMANTICS : constant :=   16#2000000#; --  winbase.h :113
   FILE_FLAG_POSIX_SEMANTICS : constant :=   16#1000000#; --  winbase.h :114
   CREATE_NEW : constant :=   1;          --  winbase.h :116
   CREATE_ALWAYS : constant :=   2;          --  winbase.h :117
   OPEN_EXISTING : constant :=   3;          --  winbase.h :118
   OPEN_ALWAYS : constant :=   4;          --  winbase.h :119
   TRUNCATE_EXISTING : constant :=   5;          --  winbase.h :120
   PIPE_ACCESS_INBOUND : constant :=   16#1#;      --  winbase.h :131
   PIPE_ACCESS_OUTBOUND : constant :=   16#2#;      --  winbase.h :132
   PIPE_ACCESS_DUPLEX : constant :=   16#3#;      --  winbase.h :133
   PIPE_CLIENT_END : constant :=   16#0#;      --  winbase.h :139
   PIPE_SERVER_END : constant :=   16#1#;      --  winbase.h :140
   PIPE_WAIT : constant :=   16#0#;      --  winbase.h :146
   PIPE_NOWAIT : constant :=   16#1#;      --  winbase.h :147
   PIPE_READMODE_BYTE : constant :=   16#0#;      --  winbase.h :148
   PIPE_READMODE_MESSAGE : constant :=   16#2#;      --  winbase.h :149
   PIPE_TYPE_BYTE : constant :=   16#0#;      --  winbase.h :150
   PIPE_TYPE_MESSAGE : constant :=   16#4#;      --  winbase.h :151
   PIPE_UNLIMITED_INSTANCES : constant :=   255;        --  winbase.h :157
   SECURITY_ANONYMOUS : constant :=   Win32.Winnt.
     SECURITY_IMPERSONATION_LEVEL'Pos
     (Win32.Winnt.SecurityAnonymous) * 2 ** 16;
   --  winbase.h :164
   SECURITY_IDENTIFICATION : constant :=   Win32.Winnt.
     SECURITY_IMPERSONATION_LEVEL'Pos
     (Win32.Winnt.SecurityIdentification) *
     2 ** 16;              --  winbase.h :165

   SECURITY_IMPERSONATION : constant :=   Win32.Winnt.
     SECURITY_IMPERSONATION_LEVEL'Pos
     (Win32.Winnt.SecurityImpersonation) *
     2 ** 16;              --  winbase.h :166

   SECURITY_DELEGATION : constant :=   Win32.Winnt.
     SECURITY_IMPERSONATION_LEVEL'Pos
     (Win32.Winnt.SecurityDelegation) * 2 ** 16;
   --  winbase.h :167

   SECURITY_CONTEXT_TRACKING : constant :=   16#40000#;  --  winbase.h :169
   SECURITY_EFFECTIVE_ONLY : constant :=   16#80000#;  --  winbase.h :170
   SECURITY_SQOS_PRESENT : constant :=   16#100000#; --  winbase.h :172
   SECURITY_VALID_SQOS_FLAGS : constant :=   16#1f0000#; --  winbase.h :173
   MUTEX_MODIFY_STATE : constant :=   16#1#;      --  winbase.h :243
   MUTEX_ALL_ACCESS : constant :=   16#1f0001#; --  winbase.h :244
   SP_SERIALCOMM : constant DWORD :=   16#1#; --  winbase.h :250
   PST_UNSPECIFIED : constant DWORD :=   16#0#; --  winbase.h :256
   PST_RS232 : constant DWORD :=   16#1#; --  winbase.h :257
   PST_PARALLELPORT : constant DWORD :=   16#2#; --  winbase.h :258
   PST_RS422 : constant DWORD :=   16#3#; --  winbase.h :259
   PST_RS423 : constant DWORD :=   16#4#; --  winbase.h :260
   PST_RS449 : constant DWORD :=   16#5#; --  winbase.h :261
   PST_MODEM : constant DWORD :=   16#6#; --  winbase.h :262
   PST_FAX : constant DWORD :=   16#21#;
   --  winbase.h :263
   PST_SCANNER : constant DWORD :=   16#22#;
   --  winbase.h :264
   PST_NETWORK_BRIDGE : constant DWORD :=   16#100#;
   --  winbase.h :265
   PST_LAT : constant DWORD :=   16#101#;
   --  winbase.h :266
   PST_TCPIP_TELNET : constant DWORD :=   16#102#;
   --  winbase.h :267
   PST_X25 : constant DWORD :=   16#103#;
   --  winbase.h :268
   PCF_DTRDSR : constant DWORD :=   16#1#; --  winbase.h :275
   PCF_RTSCTS : constant DWORD :=   16#2#; --  winbase.h :276
   PCF_RLSD : constant DWORD :=   16#4#; --  winbase.h :277
   PCF_PARITY_CHECK : constant DWORD :=   16#8#; --  winbase.h :278
   PCF_XONXOFF : constant DWORD :=   16#10#;
   --  winbase.h :279
   PCF_SETXCHAR : constant DWORD :=   16#20#;
   --  winbase.h :280
   PCF_TOTALTIMEOUTS : constant DWORD :=   16#40#;
   --  winbase.h :281
   PCF_INTTIMEOUTS : constant DWORD :=   16#80#;
   --  winbase.h :282
   PCF_SPECIALCHARS : constant DWORD :=   16#100#;
   --  winbase.h :283
   PCF_16BITMODE : constant DWORD :=   16#200#;
   --  winbase.h :284
   SP_PARITY : constant DWORD :=   16#1#; --  winbase.h :290
   SP_BAUD : constant DWORD :=   16#2#; --  winbase.h :291
   SP_DATABITS : constant DWORD :=   16#4#; --  winbase.h :292
   SP_STOPBITS : constant DWORD :=   16#8#; --  winbase.h :293
   SP_HANDSHAKING : constant DWORD :=   16#10#;
   --  winbase.h :294
   SP_PARITY_CHECK : constant DWORD :=   16#20#;
   --  winbase.h :295
   SP_RLSD : constant DWORD :=   16#40#;
   --  winbase.h :296
   BAUD_075 : constant DWORD :=   16#1#; --  winbase.h :302
   BAUD_110 : constant DWORD :=   16#2#; --  winbase.h :303
   BAUD_134_5 : constant DWORD :=   16#4#; --  winbase.h :304
   BAUD_150 : constant DWORD :=   16#8#; --  winbase.h :305
   BAUD_300 : constant DWORD :=   16#10#;
   --  winbase.h :306
   BAUD_600 : constant DWORD :=   16#20#;
   --  winbase.h :307
   BAUD_1200 : constant DWORD :=   16#40#;
   --  winbase.h :308
   BAUD_1800 : constant DWORD :=   16#80#;
   --  winbase.h :309
   BAUD_2400 : constant DWORD :=   16#100#;
   --  winbase.h :310
   BAUD_4800 : constant DWORD :=   16#200#;
   --  winbase.h :311
   BAUD_7200 : constant DWORD :=   16#400#;
   --  winbase.h :312
   BAUD_9600 : constant DWORD :=   16#800#;
   --  winbase.h :313
   BAUD_14400 : constant DWORD :=   16#1000#;
   --  winbase.h :314
   BAUD_19200 : constant DWORD :=   16#2000#;
   --  winbase.h :315
   BAUD_38400 : constant DWORD :=   16#4000#;
   --  winbase.h :316
   BAUD_56K : constant DWORD :=   16#8000#;
   --  winbase.h :317
   BAUD_128K : constant DWORD :=   16#10000#;
   --  winbase.h :318
   BAUD_115200 : constant DWORD :=   16#20000#;
   --  winbase.h :319
   BAUD_57600 : constant DWORD :=   16#40000#;
   --  winbase.h :320
   BAUD_USER : constant DWORD :=   16#10000000#;
   --  winbase.h :321
   DATABITS_5 : constant WORD :=   16#1#; --  winbase.h :327
   DATABITS_6 : constant WORD :=   16#2#; --  winbase.h :328
   DATABITS_7 : constant WORD :=   16#4#; --  winbase.h :329
   DATABITS_8 : constant WORD :=   16#8#; --  winbase.h :330
   DATABITS_16 : constant WORD :=   16#10#; --  winbase.h :331
   DATABITS_16X : constant WORD :=   16#20#; --  winbase.h :332
   STOPBITS_10 : constant WORD :=   16#1#; --  winbase.h :338
   STOPBITS_15 : constant WORD :=   16#2#; --  winbase.h :339
   STOPBITS_20 : constant WORD :=   16#4#; --  winbase.h :340
   PARITY_NONE : constant WORD :=   16#100#;
   --  winbase.h :341
   PARITY_ODD : constant WORD :=   16#200#;
   --  winbase.h :342
   PARITY_EVEN : constant WORD :=   16#400#;
   --  winbase.h :343
   PARITY_MARK : constant WORD :=   16#800#;
   --  winbase.h :344
   PARITY_SPACE : constant WORD :=   16#1000#;
   --  winbase.h :345
   COMMPROP_INITIALIZED : constant DWORD :=   16#e73cf52e#;
   --  winbase.h :372
   DTR_CONTROL_DISABLE : constant :=   16#0#;      --  winbase.h :390
   DTR_CONTROL_ENABLE : constant :=   16#1#;      --  winbase.h :391
   DTR_CONTROL_HANDSHAKE : constant :=   16#2#;      --  winbase.h :392
   RTS_CONTROL_DISABLE : constant :=   16#0#;      --  winbase.h :397
   RTS_CONTROL_ENABLE : constant :=   16#1#;      --  winbase.h :398
   RTS_CONTROL_HANDSHAKE : constant :=   16#2#;      --  winbase.h :399
   RTS_CONTROL_TOGGLE : constant :=   16#3#;      --  winbase.h :400
   GMEM_FIXED : constant :=   16#0#;      --  winbase.h :471
   GMEM_MOVEABLE : constant :=   16#2#;      --  winbase.h :472
   GMEM_NOCOMPACT : constant :=   16#10#;     --  winbase.h :473
   GMEM_NODISCARD : constant :=   16#20#;     --  winbase.h :474
   GMEM_ZEROINIT : constant :=   16#40#;     --  winbase.h :475
   GMEM_MODIFY : constant :=   16#80#;     --  winbase.h :476
   GMEM_DISCARDABLE : constant :=   16#100#;    --  winbase.h :477
   GMEM_NOT_BANKED : constant :=   16#1000#;   --  winbase.h :478
   GMEM_SHARE : constant :=   16#2000#;   --  winbase.h :479
   GMEM_DDESHARE : constant :=   16#2000#;   --  winbase.h :480
   GMEM_NOTIFY : constant :=   16#4000#;   --  winbase.h :481
   GMEM_LOWER : constant :=   16#1000#;   --  winbase.h :482
   GMEM_VALID_FLAGS : constant :=   16#7f72#;   --  winbase.h :483
   GMEM_INVALID_HANDLE : constant :=   16#8000#;   --  winbase.h :484
   GHND : constant :=   16#42#;     --  winbase.h :486
   GPTR : constant :=   16#40#;     --  winbase.h :487
   GMEM_DISCARDED : constant :=   16#4000#;   --  winbase.h :494
   GMEM_LOCKCOUNT : constant :=   16#ff#;     --  winbase.h :495
   LMEM_FIXED : constant :=   16#0#;      --  winbase.h :509
   LMEM_MOVEABLE : constant :=   16#2#;      --  winbase.h :510
   LMEM_NOCOMPACT : constant :=   16#10#;     --  winbase.h :511
   LMEM_NODISCARD : constant :=   16#20#;     --  winbase.h :512
   LMEM_ZEROINIT : constant :=   16#40#;     --  winbase.h :513
   LMEM_MODIFY : constant :=   16#80#;     --  winbase.h :514
   LMEM_DISCARDABLE : constant :=   16#f00#;    --  winbase.h :515
   LMEM_VALID_FLAGS : constant :=   16#f72#;    --  winbase.h :516
   LMEM_INVALID_HANDLE : constant :=   16#8000#;   --  winbase.h :517
   LHND : constant :=   16#42#;     --  winbase.h :519
   LPTR : constant :=   16#40#;     --  winbase.h :520
   NONZEROLHND : constant :=   16#2#;      --  winbase.h :522
   NONZEROLPTR : constant :=   16#0#;      --  winbase.h :523
   LMEM_DISCARDED : constant :=   16#4000#;   --  winbase.h :528
   LMEM_LOCKCOUNT : constant :=   16#ff#;     --  winbase.h :529
   DEBUG_PROCESS : constant :=   16#1#;      --  winbase.h :535
   DEBUG_ONLY_THIS_PROCESS : constant :=   16#2#;      --  winbase.h :536
   CREATE_SUSPENDED : constant :=   16#4#;      --  winbase.h :538
   DETACHED_PROCESS : constant :=   16#8#;      --  winbase.h :540
   CREATE_NEW_CONSOLE : constant :=   16#10#;     --  winbase.h :542
   NORMAL_PRIORITY_CLASS : constant :=   16#20#;     --  winbase.h :544
   IDLE_PRIORITY_CLASS : constant :=   16#40#;     --  winbase.h :545
   HIGH_PRIORITY_CLASS : constant :=   16#80#;     --  winbase.h :546
   REALTIME_PRIORITY_CLASS : constant :=   16#100#;    --  winbase.h :547
   CREATE_NEW_PROCESS_GROUP : constant :=   16#200#;    --  winbase.h :549
   CREATE_UNICODE_ENVIRONMENT : constant :=   16#400#;    --  winbase.h :550
   CREATE_SEPARATE_WOW_VDM : constant :=   16#800#;    --  winbase.h :552
   CREATE_DEFAULT_ERROR_MODE : constant :=   16#4000000#; --  winbase.h :554
   CREATE_NO_WINDOW : constant :=   16#8000000#; --  winbase.h :555
   THREAD_PRIORITY_LOWEST : constant :=    -2;         --  winbase.h :557
   THREAD_PRIORITY_BELOW_NORMAL : constant :=    -1;         --  winbase.h :558
   THREAD_PRIORITY_NORMAL : constant :=   0;          --  winbase.h :559
   THREAD_PRIORITY_HIGHEST : constant :=   2;          --  winbase.h :560
   THREAD_PRIORITY_ABOVE_NORMAL : constant :=   1;          --  winbase.h :561
   THREAD_PRIORITY_ERROR_RETURN : constant :=   16#7fffffff#;
   --  winbase.h :562
   THREAD_PRIORITY_TIME_CRITICAL : constant :=   15;         --  winbase.h :564
   THREAD_PRIORITY_IDLE : constant :=    -15;        --  winbase.h :565
   EXCEPTION_DEBUG_EVENT : constant :=   1;          --  winbase.h :570
   CREATE_THREAD_DEBUG_EVENT : constant :=   2;          --  winbase.h :571
   CREATE_PROCESS_DEBUG_EVENT : constant :=   3;          --  winbase.h :572
   EXIT_THREAD_DEBUG_EVENT : constant :=   4;          --  winbase.h :573
   EXIT_PROCESS_DEBUG_EVENT : constant :=   5;          --  winbase.h :574
   LOAD_DLL_DEBUG_EVENT : constant :=   6;          --  winbase.h :575
   UNLOAD_DLL_DEBUG_EVENT : constant :=   7;          --  winbase.h :576
   OUTPUT_DEBUG_STRING_EVENT : constant :=   8;          --  winbase.h :577
   RIP_EVENT : constant :=   9;          --  winbase.h :578
   DRIVE_UNKNOWN : constant :=   0;          --  winbase.h :658
   DRIVE_NO_ROOT_DIR : constant :=   1;          --  winbase.h :659
   DRIVE_REMOVABLE : constant :=   2;          --  winbase.h :660
   DRIVE_FIXED : constant :=   3;          --  winbase.h :661
   DRIVE_REMOTE : constant :=   4;          --  winbase.h :662
   DRIVE_CDROM : constant :=   5;          --  winbase.h :663
   DRIVE_RAMDISK : constant :=   6;          --  winbase.h :664
   FILE_TYPE_UNKNOWN : constant :=   16#0#;      --  winbase.h :670
   FILE_TYPE_DISK : constant :=   16#1#;      --  winbase.h :671
   FILE_TYPE_CHAR : constant :=   16#2#;      --  winbase.h :672
   FILE_TYPE_PIPE : constant :=   16#3#;      --  winbase.h :673
   FILE_TYPE_REMOTE : constant :=   16#8000#;   --  winbase.h :674

   function To_DWORD is new Ada.Unchecked_Conversion (LONG, DWORD);
   use type Interfaces.C.long;
   STD_INPUT_HANDLE : constant DWORD :=   To_DWORD (-10);
   --  winbase.h :677
   STD_OUTPUT_HANDLE : constant DWORD :=   To_DWORD (-11);
   --  winbase.h :678
   STD_ERROR_HANDLE : constant DWORD :=   To_DWORD (-12);
   --  winbase.h :679

   NOPARITY     : constant :=   0; --  winbase.h :681
   ODDPARITY    : constant :=   1; --  winbase.h :682
   EVENPARITY   : constant :=   2; --  winbase.h :683
   MARKPARITY   : constant :=   3; --  winbase.h :684
   SPACEPARITY  : constant :=   4; --  winbase.h :685
   ONESTOPBIT   : constant :=   0; --  winbase.h :687
   ONE5STOPBITS : constant :=   1; --  winbase.h :688
   TWOSTOPBITS  : constant :=   2; --  winbase.h :689
   IGNORE       : constant :=   0; --  winbase.h :691
   INFINITE : constant :=   16#ffffffff#;
   --  winbase.h :692
   CBR_110     : constant :=   110;      --  winbase.h   :698
   CBR_300     : constant :=   300;      --  winbase.h   :699
   CBR_600     : constant :=   600;      --  winbase.h   :700
   CBR_1200    : constant :=   1200;     --  winbase.h   :701
   CBR_2400    : constant :=   2400;     --  winbase.h   :702
   CBR_4800    : constant :=   4800;     --  winbase.h   :703
   CBR_9600    : constant :=   9600;     --  winbase.h   :704
   CBR_14400   : constant :=   14400;    --  winbase.h   :705
   CBR_19200   : constant :=   19200;    --  winbase.h   :706
   CBR_38400   : constant :=   38400;    --  winbase.h   :707
   CBR_56000   : constant :=   56000;    --  winbase.h   :708
   CBR_57600   : constant :=   57600;    --  winbase.h   :709
   CBR_115200  : constant :=   115200;   --  winbase.h   :710
   CBR_128000  : constant :=   128000;   --  winbase.h   :711
   CBR_256000  : constant :=   256000;   --  winbase.h   :712
   CE_RXOVER   : constant :=   16#1#;    --  winbase.h   :718
   CE_OVERRUN  : constant :=   16#2#;    --  winbase.h   :719
   CE_RXPARITY : constant :=   16#4#;    --  winbase.h   :720
   CE_FRAME    : constant :=   16#8#;    --  winbase.h   :721
   CE_BREAK    : constant :=   16#10#;   --  winbase.h   :722
   CE_TXFULL   : constant :=   16#100#;  --  winbase.h   :723
   CE_PTO      : constant :=   16#200#;  --  winbase.h   :724
   CE_IOE      : constant :=   16#400#;  --  winbase.h   :725
   CE_DNS      : constant :=   16#800#;  --  winbase.h   :726
   CE_OOP      : constant :=   16#1000#; --  winbase.h   :727
   CE_MODE     : constant :=   16#8000#; --  winbase.h   :728
   IE_BADID    : constant := -1;         --  winbase.h :730
   IE_OPEN     : constant := -2;         --  winbase.h :731
   IE_NOPEN    : constant := -3;         --  winbase.h :732
   IE_MEMORY   : constant := -4;         --  winbase.h :733
   IE_DEFAULT  : constant := -5;         --  winbase.h :734
   IE_HARDWARE : constant := -10;        --  winbase.h :735
   IE_BYTESIZE : constant := -11;        --  winbase.h :736
   IE_BAUDRATE : constant := -12;        --  winbase.h :737
   EV_RXCHAR   : constant :=   16#1#;    --  winbase.h   :743
   EV_RXFLAG   : constant :=   16#2#;    --  winbase.h   :744
   EV_TXEMPTY  : constant :=   16#4#;    --  winbase.h   :745
   EV_CTS      : constant :=   16#8#;    --  winbase.h   :746
   EV_DSR      : constant :=   16#10#;   --  winbase.h   :747
   EV_RLSD     : constant :=   16#20#;   --  winbase.h   :748
   EV_BREAK    : constant :=   16#40#;   --  winbase.h   :749
   EV_ERR      : constant :=   16#80#;   --  winbase.h   :750
   EV_RING     : constant :=   16#100#;  --  winbase.h   :751
   EV_PERR     : constant :=   16#200#;  --  winbase.h   :752
   EV_RX80FULL : constant :=   16#400#;  --  winbase.h   :753
   EV_EVENT1   : constant :=   16#800#;  --  winbase.h   :754
   EV_EVENT2   : constant :=   16#1000#; --  winbase.h   :755
   SETXOFF     : constant :=   1;        --  winbase.h   :761
   SETXON      : constant :=   2;        --  winbase.h   :762
   SETRTS      : constant :=   3;        --  winbase.h   :763
   CLRRTS      : constant :=   4;        --  winbase.h   :764
   SETDTR      : constant :=   5;        --  winbase.h   :765
   CLRDTR      : constant :=   6;        --  winbase.h   :766
   RESETDEV    : constant :=   7;        --  winbase.h   :767
   SETBREAK    : constant :=   8;        --  winbase.h   :768
   CLRBREAK    : constant :=   9;        --  winbase.h   :769
   PURGE_TXABORT : constant :=   16#1#;      --  winbase.h :774
   PURGE_RXABORT : constant :=   16#2#;      --  winbase.h :775
   PURGE_TXCLEAR : constant :=   16#4#;      --  winbase.h :776
   PURGE_RXCLEAR : constant :=   16#8#;      --  winbase.h :777
   LPTX : constant :=   16#80#;     --  winbase.h :779
   MS_CTS_ON : constant DWORD :=   16#10#;
   --  winbase.h :784
   MS_DSR_ON : constant DWORD :=   16#20#;
   --  winbase.h :785
   MS_RING_ON : constant DWORD :=   16#40#;
   --  winbase.h :786
   MS_RLSD_ON : constant DWORD :=   16#80#;
   --  winbase.h :787
   S_QUEUEEMPTY : constant :=   0;          --  winbase.h :793
   S_THRESHOLD : constant :=   1;          --  winbase.h :794
   S_ALLTHRESHOLD : constant :=   2;          --  winbase.h :795
   S_NORMAL : constant :=   0;          --  winbase.h :801
   S_LEGATO : constant :=   1;          --  winbase.h :802
   S_STACCATO : constant :=   2;          --  winbase.h :803
   S_PERIOD512 : constant :=   0;          --  winbase.h :809
   S_PERIOD1024 : constant :=   1;          --  winbase.h :810
   S_PERIOD2048 : constant :=   2;          --  winbase.h :811
   S_PERIODVOICE : constant :=   3;          --  winbase.h :812
   S_WHITE512 : constant :=   4;          --  winbase.h :813
   S_WHITE1024 : constant :=   5;          --  winbase.h :814
   S_WHITE2048 : constant :=   6;          --  winbase.h :815
   S_WHITEVOICE : constant :=   7;          --  winbase.h :816
   S_SERDVNA : constant :=    -1;         --  winbase.h :818
   S_SEROFM : constant :=    -2;         --  winbase.h :819
   S_SERMACT : constant :=    -3;         --  winbase.h :820
   S_SERQFUL : constant :=    -4;         --  winbase.h :821
   S_SERBDNT : constant :=    -5;         --  winbase.h :822
   S_SERDLN : constant :=    -6;         --  winbase.h :823
   S_SERDCC : constant :=    -7;         --  winbase.h :824
   S_SERDTP : constant :=    -8;         --  winbase.h :825
   S_SERDVL : constant :=    -9;         --  winbase.h :826
   S_SERDMD : constant :=    -10;        --  winbase.h :827
   S_SERDSH : constant :=    -11;        --  winbase.h :828
   S_SERDPT : constant :=    -12;        --  winbase.h :829
   S_SERDFQ : constant :=    -13;        --  winbase.h :830
   S_SERDDR : constant :=    -14;        --  winbase.h :831
   S_SERDSR : constant :=    -15;        --  winbase.h :832
   S_SERDST : constant :=    -16;        --  winbase.h :833
   NMPWAIT_WAIT_FOREVER : constant :=   16#ffffffff#;
   --  winbase.h :835
   NMPWAIT_NOWAIT : constant :=   16#1#;      --  winbase.h :836
   NMPWAIT_USE_DEFAULT_WAIT : constant :=   16#0#;      --  winbase.h :837
   FS_CASE_IS_PRESERVED : constant :=   16#2#;      --  winbase.h :839
   FS_CASE_SENSITIVE : constant :=   16#1#;      --  winbase.h :840
   FS_UNICODE_STORED_ON_DISK : constant :=   16#4#;      --  winbase.h :841
   FS_PERSISTENT_ACLS : constant :=   16#8#;      --  winbase.h :842
   FS_VOL_IS_COMPRESSED : constant :=   16#8000#;   --  winbase.h :843
   FS_FILE_COMPRESSION : constant :=   16#10#;     --  winbase.h :844
   FILE_MAP_COPY : constant :=   16#1#;      --  winbase.h :851
   FILE_MAP_WRITE : constant :=   16#2#;      --  winbase.h :852
   FILE_MAP_READ : constant :=   16#4#;      --  winbase.h :853
   FILE_MAP_ALL_ACCESS : constant :=   16#f001f#;  --  winbase.h :854
   OF_READ : constant :=   16#0#;      --  winbase.h :856
   OF_WRITE : constant :=   16#1#;      --  winbase.h :857
   OF_READWRITE : constant :=   16#2#;      --  winbase.h :858
   OF_SHARE_COMPAT : constant :=   16#0#;      --  winbase.h :859
   OF_SHARE_EXCLUSIVE : constant :=   16#10#;     --  winbase.h :860
   OF_SHARE_DENY_WRITE : constant :=   16#20#;     --  winbase.h :861
   OF_SHARE_DENY_READ : constant :=   16#30#;     --  winbase.h :862
   OF_SHARE_DENY_NONE : constant :=   16#40#;     --  winbase.h :863
   OF_PARSE : constant :=   16#100#;    --  winbase.h :864
   OF_DELETE : constant :=   16#200#;    --  winbase.h :865
   OF_VERIFY : constant :=   16#400#;    --  winbase.h :866
   OF_CANCEL : constant :=   16#800#;    --  winbase.h :867
   OF_CREATE : constant :=   16#1000#;   --  winbase.h :868
   OF_PROMPT : constant :=   16#2000#;   --  winbase.h :869
   OF_EXIST : constant :=   16#4000#;   --  winbase.h :870
   OF_REOPEN : constant :=   16#8000#;   --  winbase.h :871
   OFS_MAXPATHNAME : constant :=   128;        --  winbase.h :873
   MAXINTATOM : constant :=   16#c000#;   --  winbase.h :958
   INVALID_ATOM : constant Win32.Windef.ATOM :=   0;
   --  winbase.h :960
   PROCESS_HEAP_REGION : constant :=   16#1#;      --  winbase.h :1357
   PROCESS_HEAP_UNCOMMITTED_RANGE : constant :=   16#2#;    --  winbase.h :1358
   PROCESS_HEAP_ENTRY_BUSY : constant :=   16#4#;      --  winbase.h :1359
   PROCESS_HEAP_ENTRY_MOVEABLE : constant :=   16#10#;     --  winbase.h :1360
   PROCESS_HEAP_ENTRY_DDESHARE : constant :=   16#20#;     --  winbase.h :1361
   SCS_32BIT_BINARY : constant :=   0;          --  winbase.h :1387
   SCS_DOS_BINARY : constant :=   1;          --  winbase.h :1388
   SCS_WOW_BINARY : constant :=   2;          --  winbase.h :1389
   SCS_PIF_BINARY : constant :=   3;          --  winbase.h :1390
   SCS_POSIX_BINARY : constant :=   4;          --  winbase.h :1391
   SCS_OS216_BINARY : constant :=   5;          --  winbase.h :1392
   SEM_FAILCRITICALERRORS : constant :=   16#1#;      --  winbase.h :1745
   SEM_NOGPFAULTERRORBOX : constant :=   16#2#;      --  winbase.h :1746
   SEM_NOALIGNMENTFAULTEXCEPT : constant :=   16#4#;      --  winbase.h :1747
   SEM_NOOPENFILEERRORBOX : constant :=   16#8000#;
   --  winbase.h :1748
   LOCKFILE_FAIL_IMMEDIATELY : constant :=   16#1#;      --  winbase.h :2016
   LOCKFILE_EXCLUSIVE_LOCK : constant :=   16#2#;      --  winbase.h :2017
   HANDLE_FLAG_INHERIT : constant :=   16#1#;      --  winbase.h :2205
   HANDLE_FLAG_PROTECT_FROM_CLOSE : constant :=   16#2#;    --  winbase.h :2206
   HINSTANCE_ERROR : constant :=   32;         --  winbase.h :2208
   GET_TAPE_MEDIA_INFORMATION : constant :=   0;          --  winbase.h :2452
   GET_TAPE_DRIVE_INFORMATION : constant :=   1;          --  winbase.h :2453
   SET_TAPE_MEDIA_INFORMATION : constant :=   0;          --  winbase.h :2464
   SET_TAPE_DRIVE_INFORMATION : constant :=   1;          --  winbase.h :2465
   FORMAT_MESSAGE_ALLOCATE_BUFFER : constant :=   16#100#;
   --  winbase.h :2794
   FORMAT_MESSAGE_IGNORE_INSERTS : constant :=   16#200#;
   --  winbase.h :2795
   FORMAT_MESSAGE_FROM_STRING : constant :=   16#400#;
   --  winbase.h :2796
   FORMAT_MESSAGE_FROM_HMODULE : constant :=   16#800#;
   --  winbase.h :2797
   FORMAT_MESSAGE_FROM_SYSTEM : constant :=   16#1000#;
   --  winbase.h :2798
   FORMAT_MESSAGE_ARGUMENT_ARRAY : constant :=   16#2000#;
   --  winbase.h :2799
   FORMAT_MESSAGE_MAX_WIDTH_MASK : constant :=   16#ff#;   --  winbase.h :2800
   TLS_OUT_OF_INDEXES : constant DWORD :=   16#ffffffff#;
   --  winbase.h :3160
   BACKUP_INVALID : constant :=   16#0#;      --  winbase.h :3295
   BACKUP_DATA : constant :=   16#1#;      --  winbase.h :3296
   BACKUP_EA_DATA : constant :=   16#2#;      --  winbase.h :3297
   BACKUP_SECURITY_DATA : constant :=   16#3#;      --  winbase.h :3298
   BACKUP_ALTERNATE_DATA : constant :=   16#4#;      --  winbase.h :3299
   BACKUP_LINK : constant :=   16#5#;      --  winbase.h :3300
   BACKUP_PROPERTY_DATA : constant :=   16#6#;      --  winbase.h :3301
   STREAM_NORMAL_ATTRIBUTE : constant :=   16#0#;      --  winbase.h :3307
   STREAM_MODIFIED_WHEN_READ : constant :=   16#1#;      --  winbase.h :3308
   STREAM_CONTAINS_SECURITY : constant :=   16#2#;      --  winbase.h :3309
   STREAM_CONTAINS_PROPERTIES : constant :=   16#4#;      --  winbase.h :3310
   STARTF_USESHOWWINDOW : constant :=   16#1#;      --  winbase.h :3316
   STARTF_USESIZE : constant :=   16#2#;      --  winbase.h :3317
   STARTF_USEPOSITION : constant :=   16#4#;      --  winbase.h :3318
   STARTF_USECOUNTCHARS : constant :=   16#8#;      --  winbase.h :3319
   STARTF_USEFILLATTRIBUTE : constant :=   16#10#;     --  winbase.h :3320
   STARTF_RUNFULLSCREEN : constant :=   16#20#;     --  winbase.h :3321
   STARTF_FORCEONFEEDBACK : constant :=   16#40#;     --  winbase.h :3322
   STARTF_FORCEOFFFEEDBACK : constant :=   16#80#;     --  winbase.h :3323
   STARTF_USESTDHANDLES : constant :=   16#100#;
   --  winbase.h :3324
   SHUTDOWN_NORETRY : constant :=   16#1#;      --  winbase.h :3374
   DONT_RESOLVE_DLL_REFERENCES : constant :=   16#1#;      --  winbase.h :3656
   LOAD_LIBRARY_AS_DATAFILE : constant :=   16#2#;      --  winbase.h :3657
   LOAD_WITH_ALTERED_SEARCH_PATH : constant :=   16#8#;     --  winbase.h :3658
   DDD_RAW_TARGET_PATH : constant :=   16#1#;      --  winbase.h :4692
   DDD_REMOVE_DEFINITION : constant :=   16#2#;      --  winbase.h :4693
   DDD_EXACT_MATCH_ON_REMOVE : constant :=   16#4#;      --  winbase.h :4694
   MOVEFILE_REPLACE_EXISTING : constant :=   16#1#;      --  winbase.h :4980
   MOVEFILE_COPY_ALLOWED : constant :=   16#2#;      --  winbase.h :4981
   MOVEFILE_DELAY_UNTIL_REBOOT : constant :=   16#4#;      --  winbase.h :4982
   MAX_COMPUTERNAME_LENGTH : constant :=   15;         --  winbase.h :6571
   VER_PLATFORM_WIN32S : constant :=   0;          --  winbase.h :6679
   VER_PLATFORM_WIN32_NT : constant :=   2;          --  winbase.h :6680
   TC_NORMAL : constant :=   0;          --  winbase.h :6710
   TC_HARDERR : constant :=   1;          --  winbase.h :6711
   TC_GP_TRAP : constant :=   2;          --  winbase.h :6712
   TC_SIGNAL : constant :=   3;          --  winbase.h :6713

   type OVERLAPPED;                                        --  winbase.h :179
   type SECURITY_ATTRIBUTES;                               --  winbase.h :187
   type PROCESS_INFORMATION;                               --  winbase.h :193
   type FILETIME;                                          --  winbase.h :204
   type SYSTEMTIME;                                        --  winbase.h :213
   type COMMPROP;                                          --  winbase.h :347
   type COMMTIMEOUTS;                                      --  winbase.h :433
   type COMMCONFIG;                                        --  winbase.h :441
   type SYSTEM_INFO;                                       --  winbase.h :454
   type MEMORYSTATUS;                                      --  winbase.h :497
   type EXCEPTION_DEBUG_INFO;                              --  winbase.h :580
   type CREATE_THREAD_DEBUG_INFO;                          --  winbase.h :585
   type CREATE_PROCESS_DEBUG_INFO;                         --  winbase.h :591
   type EXIT_THREAD_DEBUG_INFO;                            --  winbase.h :604
   type EXIT_PROCESS_DEBUG_INFO;                           --  winbase.h :608
   type LOAD_DLL_DEBUG_INFO;                               --  winbase.h :612
   type UNLOAD_DLL_DEBUG_INFO;                             --  winbase.h :621
   type OUTPUT_DEBUG_STRING_INFO;                          --  winbase.h :625
   type RIP_INFO;                                          --  winbase.h :631
   type union_anonymous0_t;                                --  winbase.h :651
   type DEBUG_EVENT;                                       --  winbase.h :637
   type OFSTRUCT;                                          --  winbase.h :874
   type struct_anonymous2_t;                               --  winbase.h :1347
   type struct_anonymous3_t;                               --  winbase.h :1353
   type union_anonymous4_t;                                --  winbase.h :1354
   type PROCESS_HEAP_ENTRY;                                --  winbase.h :1337
   type BY_HANDLE_FILE_INFORMATION;                        --  winbase.h :2030
   type TIME_ZONE_INFORMATION;                             --  winbase.h :2645
   type WIN32_STREAM_ID;                                   --  winbase.h :3283
   type STARTUPINFOA;                                      --  winbase.h :3326
   type STARTUPINFOW;                                      --  winbase.h :3346
   type WIN32_FIND_DATAA;                                  --  winbase.h :3376
   type WIN32_FIND_DATAW;                                  --  winbase.h :3388
   type OSVERSIONINFOA;                                    --  winbase.h :6649
   type OSVERSIONINFOW;                                    --  winbase.h :6657

   type LPOVERLAPPED is access all OVERLAPPED;             --  winbase.h :185
   type PSECURITY_ATTRIBUTES is access all SECURITY_ATTRIBUTES;
   --  winbase.h :191
   subtype LPSECURITY_ATTRIBUTES is PSECURITY_ATTRIBUTES;
   --  winbase.h :191
   type PPROCESS_INFORMATION is access all PROCESS_INFORMATION;
   --  winbase.h :198
   subtype LPPROCESS_INFORMATION is PPROCESS_INFORMATION;
   --  winbase.h :198
   type PFILETIME is access all FILETIME;                  --  winbase.h :207
   subtype LPFILETIME is PFILETIME;                        --  winbase.h :207
   type PSYSTEMTIME is access all SYSTEMTIME;              --  winbase.h :222
   subtype LPSYSTEMTIME is PSYSTEMTIME;                    --  winbase.h :222
   type PCRITICAL_SECTION is access all Win32.Winnt.RTL_CRITICAL_SECTION;
   --  winbase.h :230
   subtype LPCRITICAL_SECTION is PCRITICAL_SECTION;
   --  winbase.h :231
   type PCRITICAL_SECTION_DEBUG is access all
     Win32.Winnt.RTL_CRITICAL_SECTION_DEBUG;          --  winbase.h :234
   subtype LPCRITICAL_SECTION_DEBUG is PCRITICAL_SECTION_DEBUG;
   --  winbase.h :235
   type LPLDT_ENTRY is access all Win32.Winnt.LDT_ENTRY;   --  winbase.h :238
   type LPCOMMPROP is access all COMMPROP;                 --  winbase.h :366
   type PCHANDLE is access all Win32.Winnt.HANDLE;    --  winbase.h :1921
   type ac_FILETIME_t is access all FILETIME;         --  winbase.h :2166

   type COMSTAT is                                         --  winbase.h :374
      record
         fCtsHold : Win32.Bits1;                         --  winbase.h :375
         fDsrHold : Win32.Bits1;                         --  winbase.h :376
         fRlsdHold : Win32.Bits1;                         --  winbase.h :377
         fXoffHold : Win32.Bits1;                         --  winbase.h :378
         fXoffSent : Win32.Bits1;                         --  winbase.h :379
         fEof : Win32.Bits1;                         --  winbase.h :380
         fTxim : Win32.Bits1;                         --  winbase.h :381
         fReserved : Win32.Bits25;                        --  winbase.h :382
         cbInQue : Win32.DWORD;                         --  winbase.h :383
         cbOutQue : Win32.DWORD;                         --  winbase.h :384
      end record;
   for COMSTAT use record
      fCtsHold  at 0 range 0 .. 0;                      --  winbase.h :375
      fDsrHold  at 0 range 1 .. 1;                      --  winbase.h :376
      fRlsdHold at 0 range 2 .. 2;                      --  winbase.h :377
      fXoffHold at 0 range 3 .. 3;                      --  winbase.h :378
      fXoffSent at 0 range 4 .. 4;                      --  winbase.h :379
      fEof      at 0 range 5 .. 5;                      --  winbase.h :380
      fTxim     at 0 range 6 .. 6;                      --  winbase.h :381
      fReserved at 0 range 7 .. 31;                     --  winbase.h :382
      cbInQue   at 4 range 0 .. 31;                     --  winbase.h :383
      cbOutQue  at 8 range 0 .. 31;                     --  winbase.h :384
   end record;
   --  pragma pack (COMSTAT);

   type LPCOMSTAT is access all COMSTAT;                   --  winbase.h :385

   type DCB is                                             --  winbase.h :402
      record
         DCBLENGTH : Win32.DWORD;                 --  winbase.h :403
         BaudRate : Win32.DWORD;                 --  winbase.h :404
         fBinary : Win32.Bits1;                 --  winbase.h :405
         fParity : Win32.Bits1;                 --  winbase.h :406
         fOutxCtsFlow : Win32.Bits1;                 --  winbase.h :407
         fOutxDsrFlow : Win32.Bits1;                 --  winbase.h :408
         fDtrControl : Win32.Bits2;                 --  winbase.h :409
         fDsrSensitivity : Win32.Bits1;                 --  winbase.h :410
         fTXContinueOnXoff : Win32.Bits1;                 --  winbase.h :411
         fOutX : Win32.Bits1;                 --  winbase.h :412
         fInX : Win32.Bits1;                 --  winbase.h :413
         fErrorChar : Win32.Bits1;                 --  winbase.h :414
         fNull : Win32.Bits1;                 --  winbase.h :415
         fRtsControl : Win32.Bits2;                 --  winbase.h :416
         fAbortOnError : Win32.Bits1;                 --  winbase.h :417
         fDummy2 : Win32.Bits17;                --  winbase.h :418
         wReserved : Win32.WORD;                  --  winbase.h :419
         XonLim : Win32.WORD;                  --  winbase.h :420
         XoffLim : Win32.WORD;                  --  winbase.h :421
         ByteSize : Win32.BYTE;                  --  winbase.h :422
         Parity : Win32.BYTE;                  --  winbase.h :423
         StopBits : Win32.BYTE;                  --  winbase.h :424
         XonChar : Win32.CHAR;                  --  winbase.h :425
         XoffChar : Win32.CHAR;                  --  winbase.h :426
         ErrorChar : Win32.CHAR;                  --  winbase.h :427
         EofChar : Win32.CHAR;                  --  winbase.h :428
         EvtChar : Win32.CHAR;                  --  winbase.h :429
         wReserved1 : Win32.WORD;                  --  winbase.h :430
      end record;
   for DCB use record
      DCBLENGTH         at 0 range 0 .. 31;             --  winbase.h :403
      BaudRate          at 4 range 0 .. 31;             --  winbase.h :404
      fBinary           at 8 range 0 .. 0;              --  winbase.h :405
      fParity           at 8 range 1 .. 1;              --  winbase.h :406
      fOutxCtsFlow      at 8 range 2 .. 2;              --  winbase.h :407
      fOutxDsrFlow      at 8 range 3 .. 3;              --  winbase.h :408
      fDtrControl       at 8 range 4 .. 5;              --  winbase.h :409
      fDsrSensitivity   at 8 range 6 .. 6;              --  winbase.h :410
      fTXContinueOnXoff at 8 range 7 .. 7;              --  winbase.h :411
      fOutX             at 9 range 0 .. 0;              --  winbase.h :412
      fInX              at 9 range 1 .. 1;              --  winbase.h :413
      fErrorChar        at 9 range 2 .. 2;              --  winbase.h :414
      fNull             at 9 range 3 .. 3;              --  winbase.h :415
      fRtsControl       at 9 range 4 .. 5;              --  winbase.h :416
      fAbortOnError     at 9 range 6 .. 6;              --  winbase.h :417
      fDummy2           at 9 range 7 .. 23;             --  winbase.h :418
      wReserved         at 12 range 0 .. 15;            --  winbase.h :419
      XonLim            at 14 range 0 .. 15;            --  winbase.h :420
      XoffLim           at 16 range 0 .. 15;            --  winbase.h :421
      ByteSize          at 18 range 0 .. 7;             --  winbase.h :422
      Parity            at 19 range 0 .. 7;             --  winbase.h :423
      StopBits          at 20 range 0 .. 7;             --  winbase.h :424
      XonChar           at 21 range 0 .. 7;             --  winbase.h :425
      XoffChar          at 22 range 0 .. 7;             --  winbase.h :426
      ErrorChar         at 23 range 0 .. 7;             --  winbase.h :427
      EofChar           at 24 range 0 .. 7;             --  winbase.h :428
      EvtChar           at 25 range 0 .. 7;             --  winbase.h :429
      wReserved1        at 26 range 0 .. 15;            --  winbase.h :430
   end record;
   --  pragma pack (DCB);

   type LPDCB is access all DCB;                           --  winbase.h :431
   type LPCOMMTIMEOUTS is access all COMMTIMEOUTS;         --  winbase.h :439
   type LPCOMMCONFIG is access all COMMCONFIG;             --  winbase.h :452
   type LPSYSTEM_INFO is access all SYSTEM_INFO;           --  winbase.h :464
   type LPMEMORYSTATUS is access all MEMORYSTATUS;         --  winbase.h :506
   type LPEXCEPTION_DEBUG_INFO is access all EXCEPTION_DEBUG_INFO;
   --  winbase.h :583
   type LPCREATE_THREAD_DEBUG_INFO is
     access all CREATE_THREAD_DEBUG_INFO;               --  winbase.h :589
   type LPCREATE_PROCESS_DEBUG_INFO is
     access all CREATE_PROCESS_DEBUG_INFO;              --  winbase.h :602
   type LPEXIT_THREAD_DEBUG_INFO is
     access all EXIT_THREAD_DEBUG_INFO;                 --  winbase.h :606
   type LPEXIT_PROCESS_DEBUG_INFO is
     access all EXIT_PROCESS_DEBUG_INFO;                --  winbase.h :610
   type LPLOAD_DLL_DEBUG_INFO is
     access all LOAD_DLL_DEBUG_INFO;                    --  winbase.h :619
   type LPUNLOAD_DLL_DEBUG_INFO is
     access all UNLOAD_DLL_DEBUG_INFO;                  --  winbase.h :623
   type LPOUTPUT_DEBUG_STRING_INFO is
     access all OUTPUT_DEBUG_STRING_INFO;               --  winbase.h :629
   type LPRIP_INFO is access all RIP_INFO;                 --  winbase.h :634
   type LPDEBUG_EVENT is access all DEBUG_EVENT;           --  winbase.h :652
   type LPCONTEXT is access all Win32.Winnt.CONTEXT;       --  winbase.h :654
   type LPEXCEPTION_RECORD is access all Win32.Winnt.EXCEPTION_RECORD;
   --  winbase.h :655
   type LPEXCEPTION_POINTERS is access all Win32.Winnt.EXCEPTION_POINTERS;
   --  winbase.h :656
   type LPOFSTRUCT is access all OFSTRUCT;                 --  winbase.h :881
   type POFSTRUCT is access all OFSTRUCT;                  --  winbase.h :881
   type LPPROCESS_HEAP_ENTRY is
     access all PROCESS_HEAP_ENTRY;                     --  winbase.h :1355
   type PPROCESS_HEAP_ENTRY is
     access all PROCESS_HEAP_ENTRY;                     --  winbase.h :1355
   type PBY_HANDLE_FILE_INFORMATION is
     access all BY_HANDLE_FILE_INFORMATION;             --  winbase.h :2041
   type LPBY_HANDLE_FILE_INFORMATION is
     access all BY_HANDLE_FILE_INFORMATION;             --  winbase.h :2041
   type PTIME_ZONE_INFORMATION is
     access all TIME_ZONE_INFORMATION;                  --  winbase.h :2653
   type LPTIME_ZONE_INFORMATION is
     access all TIME_ZONE_INFORMATION;                  --  winbase.h :2653
   type LPWIN32_STREAM_ID is access all WIN32_STREAM_ID;
   --  winbase.h :3289
   type LPSTARTUPINFOA is access all STARTUPINFOA;         --  winbase.h :3345
   type LPSTARTUPINFOW is access all STARTUPINFOW;         --  winbase.h :3365
   type LPSTARTUPINFO is access all STARTUPINFOA;          --  winbase.h :3371
   type PWIN32_FIND_DATAA is access all WIN32_FIND_DATAA;  --  winbase.h :3387
   type LPWIN32_FIND_DATAA is access all WIN32_FIND_DATAA; --  winbase.h :3387
   type PWIN32_FIND_DATAW is access all WIN32_FIND_DATAW;  --  winbase.h :3399
   type LPWIN32_FIND_DATAW is access all WIN32_FIND_DATAW; --  winbase.h :3399
   type PWIN32_FIND_DATA is access all WIN32_FIND_DATAA;   --  winbase.h :3406
   type LPWIN32_FIND_DATA is access all WIN32_FIND_DATAA;  --  winbase.h :3407
   type POSVERSIONINFOA is access all OSVERSIONINFOA;      --  winbase.h :6656
   type LPOSVERSIONINFOA is access all OSVERSIONINFOA;     --  winbase.h :6656
   type POSVERSIONINFOW is access all OSVERSIONINFOW;      --  winbase.h :6664
   type LPOSVERSIONINFOW is access all OSVERSIONINFOW;     --  winbase.h :6664
   type POSVERSIONINFO is access all OSVERSIONINFOA;       --  winbase.h :6671
   type LPOSVERSIONINFO is access all OSVERSIONINFOA;      --  winbase.h :6672

   type ac_CONTEXT_t is access all Win32.Winnt.CONTEXT;
   --  winbase.h :1793
   type ac_SYSTEMTIME_t is access all SYSTEMTIME;     --  winbase.h :2622
   type ac_TIME_ZONE_INFORMATION_t is access all TIME_ZONE_INFORMATION;

   type OVERLAPPED is                                      --  winbase.h :179
      record
         Internal : Win32.DWORD;                      --  winbase.h :180
         InternalHigh : Win32.DWORD;                      --  winbase.h :181
         Offset : Win32.DWORD;                      --  winbase.h :182
         OffsetHigh : Win32.DWORD;                      --  winbase.h :183
         hEvent : Win32.Winnt.HANDLE;               --  winbase.h :184
      end record;

   type SECURITY_ATTRIBUTES is                             --  winbase.h :187
      record
         nLength : Win32.DWORD;              --  winbase.h :188
         lpSecurityDescriptor : Win32.LPVOID;             --  winbase.h :189
         bInheritHandle : Win32.BOOL;               --  winbase.h :190
      end record;

   type PROCESS_INFORMATION is                             --  winbase.h :193
      record
         hProcess : Win32.Winnt.HANDLE;                --  winbase.h :194
         hThread : Win32.Winnt.HANDLE;                --  winbase.h :195
         dwProcessId : Win32.DWORD;                       --  winbase.h :196
         dwThreadId : Win32.DWORD;                       --  winbase.h :197
      end record;

   type FILETIME is                                        --  winbase.h :204
      record
         dwLowDateTime : Win32.DWORD;                    --  winbase.h :205
         dwHighDateTime : Win32.DWORD;                    --  winbase.h :206
      end record;

   type SYSTEMTIME is                                      --  winbase.h :213
      record
         wYear : Win32.WORD;                      --  winbase.h :214
         wMonth : Win32.WORD;                      --  winbase.h :215
         wDayOfWeek : Win32.WORD;                      --  winbase.h :216
         wDay : Win32.WORD;                      --  winbase.h :217
         wHour : Win32.WORD;                      --  winbase.h :218
         wMinute : Win32.WORD;                      --  winbase.h :219
         wSecond : Win32.WORD;                      --  winbase.h :220
         wMilliseconds : Win32.WORD;                      --  winbase.h :221
      end record;

   subtype GET_FILEEX_INFO_LEVELS is DWORD range 0 .. 0;

   GetFileExInfoStandard : constant :=   0;

   type WIN32_FILE_ATTRIBUTE_DATA is
      record
         dwFileAttributes : DWORD;
         ftCreationTime : FILETIME;
         ftLastAccessTime : FILETIME;
         ftLastWriteTime : FILETIME;
         nFileSizeHigh : DWORD;
         nFileSizeLow : DWORD;
      end record;

   type LPWIN32_FILE_ATTRIBUTE_DATA is access all WIN32_FILE_ATTRIBUTE_DATA;

   type PTHREAD_START_ROUTINE is
     access function (lpThreadParameter : Win32.LPVOID) return Win32.DWORD;
   --  winbase.h :224
   type LPTHREAD_START_ROUTINE is access function  return Win32.DWORD;
   pragma Convention (Stdcall, LPTHREAD_START_ROUTINE);
   --  winbase.h :227

   subtype CRITICAL_SECTION is Win32.Winnt.RTL_CRITICAL_SECTION;
   --  winbase.h :229

   subtype CRITICAL_SECTION_DEBUG is Win32.Winnt.RTL_CRITICAL_SECTION_DEBUG;
   --  winbase.h :233

   type COMMPROP is                                        --  winbase.h :347
      record
         wPacketLength : Win32.WORD;                --  winbase.h :348
         wPacketVersion : Win32.WORD;                --  winbase.h :349
         dwServiceMask : Win32.DWORD;               --  winbase.h :350
         dwReserved1 : Win32.DWORD;               --  winbase.h :351
         dwMaxTxQueue : Win32.DWORD;               --  winbase.h :352
         dwMaxRxQueue : Win32.DWORD;               --  winbase.h :353
         dwMaxBaud : Win32.DWORD;               --  winbase.h :354
         dwProvSubType : Win32.DWORD;               --  winbase.h :355
         dwProvCapabilities : Win32.DWORD;               --  winbase.h :356
         dwSettableParams : Win32.DWORD;               --  winbase.h :357
         dwSettableBaud : Win32.DWORD;               --  winbase.h :358
         wSettableData : Win32.WORD;                --  winbase.h :359
         wSettableStopParity : Win32.WORD;                --  winbase.h :360
         dwCurrentTxQueue : Win32.DWORD;               --  winbase.h :361
         dwCurrentRxQueue : Win32.DWORD;               --  winbase.h :362
         dwProvSpec1 : Win32.DWORD;               --  winbase.h :363
         dwProvSpec2 : Win32.DWORD;               --  winbase.h :364
         wcProvChar : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winbase.h :365
      end record;

   type COMMTIMEOUTS is                                    --  winbase.h :433
      record
         ReadIntervalTimeout : Win32.DWORD;       --  winbase.h :434
         ReadTotalTimeoutMultiplier : Win32.DWORD;       --  winbase.h :435
         ReadTotalTimeoutConstant : Win32.DWORD;       --  winbase.h :436
         WriteTotalTimeoutMultiplier : Win32.DWORD;       --  winbase.h :437
         WriteTotalTimeoutConstant : Win32.DWORD;       --  winbase.h :438
      end record;

   type COMMCONFIG is                                      --  winbase.h :441
      record
         dwSize : Win32.DWORD;                 --  winbase.h :442
         wVersion : Win32.WORD;                  --  winbase.h :443
         wReserved : Win32.WORD;                  --  winbase.h :444
         dcb : Win32.Winbase.DCB;           --  winbase.h :445
         dwProviderSubType : Win32.DWORD;                 --  winbase.h :446
         dwProviderOffset : Win32.DWORD;                 --  winbase.h :448
         dwProviderSize : Win32.DWORD;                 --  winbase.h :450
         wcProviderData : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winbase.h :451
      end record;

   type SYSTEM_INFO is                                     --  winbase.h :454
      record
         dwOemId : Win32.DWORD;       --  winbase.h :455
         dwPageSize : Win32.DWORD;       --  winbase.h :456
         lpMinimumApplicationAddress : Win32.LPVOID;      --  winbase.h :457
         lpMaximumApplicationAddress : Win32.LPVOID;      --  winbase.h :458
         dwActiveProcessorMask : Win32.DWORD;       --  winbase.h :459
         dwNumberOfProcessors : Win32.DWORD;       --  winbase.h :460
         dwProcessorType : Win32.DWORD;       --  winbase.h :461
         dwAllocationGranularity : Win32.DWORD;       --  winbase.h :462
         dwReserved : Win32.DWORD;       --  winbase.h :463
      end record;

   type MEMORYSTATUS is                                    --  winbase.h :497
      record
         dwLength : Win32.DWORD;                   --  winbase.h :498
         dwMemoryLoad : Win32.DWORD;                   --  winbase.h :499
         dwTotalPhys : Win32.DWORD;                   --  winbase.h :500
         dwAvailPhys : Win32.DWORD;                   --  winbase.h :501
         dwTotalPageFile : Win32.DWORD;                   --  winbase.h :502
         dwAvailPageFile : Win32.DWORD;                   --  winbase.h :503
         dwTotalVirtual : Win32.DWORD;                   --  winbase.h :504
         dwAvailVirtual : Win32.DWORD;                   --  winbase.h :505
      end record;

   type EXCEPTION_DEBUG_INFO is                            --  winbase.h :580
      record
         ExceptionRecord : Win32.Winnt.EXCEPTION_RECORD;  --  winbase.h :581
         dwFirstChance : Win32.DWORD;                   --  winbase.h :582
      end record;

   type CREATE_THREAD_DEBUG_INFO is                        --  winbase.h :585
      record
         hThread : Win32.Winnt.HANDLE;          --  winbase.h :586
         lpThreadLocalBase : Win32.LPVOID;                --  winbase.h :587
         lpStartAddress : LPTHREAD_START_ROUTINE;      --  winbase.h :588
      end record;

   type CREATE_PROCESS_DEBUG_INFO is                       --  winbase.h :591
      record
         hFile : Win32.Winnt.HANDLE;      --  winbase.h :592
         hProcess : Win32.Winnt.HANDLE;      --  winbase.h :593
         hThread : Win32.Winnt.HANDLE;      --  winbase.h :594
         lpBaseOfImage : Win32.LPVOID;            --  winbase.h :595
         dwDebugInfoFileOffset : Win32.DWORD;             --  winbase.h :596
         nDebugInfoSize : Win32.DWORD;             --  winbase.h :597
         lpThreadLocalBase : Win32.LPVOID;            --  winbase.h :598
         lpStartAddress : LPTHREAD_START_ROUTINE;  --  winbase.h :599
         lpImageName : Win32.LPVOID;            --  winbase.h :600
         fUnicode : Win32.WORD;              --  winbase.h :601
      end record;

   type EXIT_THREAD_DEBUG_INFO is                          --  winbase.h :604
      record
         dwExitCode : Win32.DWORD;                        --  winbase.h :605
      end record;

   type EXIT_PROCESS_DEBUG_INFO is                         --  winbase.h :608
      record
         dwExitCode : Win32.DWORD;                        --  winbase.h :609
      end record;

   type LOAD_DLL_DEBUG_INFO is                             --  winbase.h :612
      record
         hFile : Win32.Winnt.HANDLE;      --  winbase.h :613
         lpBaseOfDll : Win32.LPVOID;            --  winbase.h :614
         dwDebugInfoFileOffset : Win32.DWORD;             --  winbase.h :615
         nDebugInfoSize : Win32.DWORD;             --  winbase.h :616
         lpImageName : Win32.LPVOID;            --  winbase.h :617
         fUnicode : Win32.WORD;              --  winbase.h :618
      end record;

   type UNLOAD_DLL_DEBUG_INFO is                           --  winbase.h :621
      record
         lpBaseOfDll : Win32.LPVOID;                      --  winbase.h :622
      end record;

   type OUTPUT_DEBUG_STRING_INFO is                        --  winbase.h :625
      record
         lpDebugStringData : Win32.LPSTR;                --  winbase.h :626
         fUnicode : Win32.WORD;                 --  winbase.h :627
         nDebugStringLength : Win32.WORD;                 --  winbase.h :628
      end record;

   type RIP_INFO is                                        --  winbase.h :631
      record
         dwError : Win32.DWORD;                           --  winbase.h :632
         dwType : Win32.DWORD;                           --  winbase.h :633
      end record;

   type union_anonymous0_t_kind is ( --  winbase.h :651
     C_Exception_kind,
     CreateThread_kind,
     CreateProcessInfo_kind,
     ExitThread_kind,
     ExitProcess_kind,
     LoadDll_kind,
     UnloadDll_kind,
     DebugString_kind,
     RipInfo_kind
                                   );

   type union_anonymous0_t
     (Which : union_anonymous0_t_kind :=   C_Exception_kind) is
      --  winbase.h :651
      record
         case Which is
            when C_Exception_kind =>
               C_Exception : EXCEPTION_DEBUG_INFO;      --  winbase.h :642
            when CreateThread_kind =>
               CreateThread : CREATE_THREAD_DEBUG_INFO; --  winbase.h :643
            when CreateProcessInfo_kind =>
               CreateProcessInfo : CREATE_PROCESS_DEBUG_INFO;
               --  winbase.h :644
            when ExitThread_kind =>
               ExitThread : EXIT_THREAD_DEBUG_INFO;     --  winbase.h :645
            when ExitProcess_kind =>
               ExitProcess : EXIT_PROCESS_DEBUG_INFO;    --  winbase.h :646
            when LoadDll_kind =>
               LoadDll : LOAD_DLL_DEBUG_INFO;         --  winbase.h :647
            when UnloadDll_kind =>
               UnloadDll : UNLOAD_DLL_DEBUG_INFO;       --  winbase.h :648
            when DebugString_kind =>
               DebugString : OUTPUT_DEBUG_STRING_INFO;  --  winbase.h :649
            when RipInfo_kind =>
               RipInfo : RIP_INFO;                    --  winbase.h :650
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous0_t);

   type DEBUG_EVENT is                                     --  winbase.h :637
      record
         dwDebugEventCode : Win32.DWORD;                  --  winbase.h :638
         dwProcessId : Win32.DWORD;                  --  winbase.h :639
         dwThreadId : Win32.DWORD;                  --  winbase.h :640
         u : union_anonymous0_t;           --  winbase.h :651
      end record;

   type OFSTRUCT is                                        --  winbase.h :874
      record
         cBytes : Win32.BYTE;                         --  winbase.h :875
         fFixedDisk : Win32.BYTE;                         --  winbase.h :876
         nErrCode : Win32.WORD;                         --  winbase.h :877
         Reserved1 : Win32.WORD;                         --  winbase.h :878
         Reserved2 : Win32.WORD;                         --  winbase.h :879
         szPathName : Win32.CHAR_Array (0 .. 127);           --  winbase.h :880
      end record;

   type struct_anonymous2_t is                             --  winbase.h :1347
      record
         hMem : Win32.Winnt.HANDLE;                 --  winbase.h :1345
         dwReserved : Win32.DWORD_Array (0 .. 2);           --  winbase.h :1346
      end record;

   type struct_anonymous3_t is                             --  winbase.h :1353
      record
         dwCommittedSize : Win32.DWORD;                 --  winbase.h :1349
         dwUnCommittedSize : Win32.DWORD;                 --  winbase.h :1350
         lpFirstBlock : Win32.LPVOID;                --  winbase.h :1351
         lpLastBlock : Win32.LPVOID;                --  winbase.h :1352
      end record;

   type union_anonymous4_t_kind is ( --  winbase.h :1354
     Block_kind,
     Region_kind
                                   );

   type union_anonymous4_t (Which : union_anonymous4_t_kind :=   Block_kind) is
      --  winbase.h :1354
      record
         case Which is
            when Block_kind =>
               Block : struct_anonymous2_t;             --  winbase.h :1347
            when Region_kind =>
               Region : struct_anonymous3_t;            --  winbase.h :1353
         end case;
      end record;

   pragma Convention (c_pass_by_copy, union_anonymous4_t);

   pragma Unchecked_Union (union_anonymous4_t);

   type PROCESS_HEAP_ENTRY is                              --  winbase.h :1337
      record
         lpData : Win32.PVOID;                      --  winbase.h :1338
         cbData : Win32.DWORD;                      --  winbase.h :1339
         cbOverhead : Win32.BYTE;                       --  winbase.h :1340
         iRegionIndex : Win32.BYTE;                       --  winbase.h :1341
         wFlags : Win32.WORD;                       --  winbase.h :1342
         u : union_anonymous4_t;               --  winbase.h :1354
      end record;

   type PTOP_LEVEL_EXCEPTION_FILTER is
     access function (ExceptionInfo : Win32.Winnt.PEXCEPTION_POINTERS)
                     return Win32.LONG;                     --  winbase.h :1583
   type LPTOP_LEVEL_EXCEPTION_FILTER is access function  return Win32.LONG;
   pragma Convention (Stdcall, LPTOP_LEVEL_EXCEPTION_FILTER);
   --  winbase.h :1586

   type BY_HANDLE_FILE_INFORMATION is                      --  winbase.h :2030
      record
         dwFileAttributes : Win32.DWORD;              --  winbase.h :2031
         ftCreationTime : FILETIME;                 --  winbase.h :2032
         ftLastAccessTime : FILETIME;                 --  winbase.h :2033
         ftLastWriteTime : FILETIME;                 --  winbase.h :2034
         dwVolumeSerialNumber : Win32.DWORD;              --  winbase.h :2035
         nFileSizeHigh : Win32.DWORD;              --  winbase.h :2036
         nFileSizeLow : Win32.DWORD;              --  winbase.h :2037
         nNumberOfLinks : Win32.DWORD;              --  winbase.h :2038
         nFileIndexHigh : Win32.DWORD;              --  winbase.h :2039
         nFileIndexLow : Win32.DWORD;              --  winbase.h :2040
      end record;

   type TIME_ZONE_INFORMATION is                           --  winbase.h :2645
      record
         Bias : Win32.LONG;                       --  winbase.h :2646
         StandardName : Win32.WCHAR_Array (0 .. 31);       --  winbase.h :2647
         StandardDate : SYSTEMTIME;                       --  winbase.h :2648
         StandardBias : Win32.LONG;                       --  winbase.h :2649
         DaylightName : Win32.WCHAR_Array (0 .. 31);       --  winbase.h :2650
         DaylightDate : SYSTEMTIME;                       --  winbase.h :2651
         DaylightBias : Win32.LONG;                       --  winbase.h :2652
      end record;

   type LPOVERLAPPED_COMPLETION_ROUTINE is
     access procedure (dwErrorCode : Win32.DWORD;
                       dwNumberOfBytesTransfered : Win32.DWORD;
                       lpOverlapped : Win32.Winbase.LPOVERLAPPED);
   --  winbase.h :3186

   type WIN32_STREAM_ID is                                 --  winbase.h :3283
      record
         dwStreamId : Win32.DWORD;                --  winbase.h :3284
         dwStreamAttributes : Win32.DWORD;                --  winbase.h :3285
         Size : Win32.Winnt.LARGE_INTEGER;  --  winbase.h :3286
         dwStreamNameSize : Win32.DWORD;                --  winbase.h :3287
         cStreamName : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winbase.h :3288
      end record;

   type STARTUPINFOA is                                    --  winbase.h :3326
      record
         cb : Win32.DWORD;                   --  winbase.h :3327
         lpReserved : Win32.LPSTR;                   --  winbase.h :3328
         lpDesktop : Win32.LPSTR;                   --  winbase.h :3329
         lpTitle : Win32.LPSTR;                   --  winbase.h :3330
         dwX : Win32.DWORD;                   --  winbase.h :3331
         dwY : Win32.DWORD;                   --  winbase.h :3332
         dwXSize : Win32.DWORD;                   --  winbase.h :3333
         dwYSize : Win32.DWORD;                   --  winbase.h :3334
         dwXCountChars : Win32.DWORD;                   --  winbase.h :3335
         dwYCountChars : Win32.DWORD;                   --  winbase.h :3336
         dwFillAttribute : Win32.DWORD;                   --  winbase.h :3337
         dwFlags : Win32.DWORD;                   --  winbase.h :3338
         wShowWindow : Win32.WORD;                    --  winbase.h :3339
         cbReserved2 : Win32.WORD;                    --  winbase.h :3340
         lpReserved2 : Win32.LPBYTE;                  --  winbase.h :3341
         hStdInput : Win32.Winnt.HANDLE;            --  winbase.h :3342
         hStdOutput : Win32.Winnt.HANDLE;            --  winbase.h :3343
         hStdError : Win32.Winnt.HANDLE;            --  winbase.h :3344
      end record;

   type STARTUPINFOW is                                    --  winbase.h :3346
      record
         cb : Win32.DWORD;                   --  winbase.h :3347
         lpReserved : Win32.LPWSTR;                  --  winbase.h :3348
         lpDesktop : Win32.LPWSTR;                  --  winbase.h :3349
         lpTitle : Win32.LPWSTR;                  --  winbase.h :3350
         dwX : Win32.DWORD;                   --  winbase.h :3351
         dwY : Win32.DWORD;                   --  winbase.h :3352
         dwXSize : Win32.DWORD;                   --  winbase.h :3353
         dwYSize : Win32.DWORD;                   --  winbase.h :3354
         dwXCountChars : Win32.DWORD;                   --  winbase.h :3355
         dwYCountChars : Win32.DWORD;                   --  winbase.h :3356
         dwFillAttribute : Win32.DWORD;                   --  winbase.h :3357
         dwFlags : Win32.DWORD;                   --  winbase.h :3358
         wShowWindow : Win32.WORD;                    --  winbase.h :3359
         cbReserved2 : Win32.WORD;                    --  winbase.h :3360
         lpReserved2 : Win32.LPBYTE;                  --  winbase.h :3361
         hStdInput : Win32.Winnt.HANDLE;            --  winbase.h :3362
         hStdOutput : Win32.Winnt.HANDLE;            --  winbase.h :3363
         hStdError : Win32.Winnt.HANDLE;            --  winbase.h :3364
      end record;

   subtype STARTUPINFO is STARTUPINFOA;                    --  winbase.h :3370

   type WIN32_FIND_DATAA is                                --  winbase.h :3376
      record
         dwFileAttributes : Win32.DWORD;                --  winbase.h :3377
         ftCreationTime : FILETIME;                   --  winbase.h :3378
         ftLastAccessTime : FILETIME;                   --  winbase.h :3379
         ftLastWriteTime : FILETIME;                   --  winbase.h :3380
         nFileSizeHigh : Win32.DWORD;                --  winbase.h :3381
         nFileSizeLow : Win32.DWORD;                --  winbase.h :3382
         dwReserved0 : Win32.DWORD;                --  winbase.h :3383
         dwReserved1 : Win32.DWORD;                --  winbase.h :3384
         cFileName : Win32.CHAR_Array (0 .. 259);   --  winbase.h :3385
         cAlternateFileName : Win32.CHAR_Array (0 .. 13);   --  winbase.h :3386
      end record;

   type WIN32_FIND_DATAW is                                --  winbase.h :3388
      record
         dwFileAttributes : Win32.DWORD;                --  winbase.h :3389
         ftCreationTime : FILETIME;                   --  winbase.h :3390
         ftLastAccessTime : FILETIME;                   --  winbase.h :3391
         ftLastWriteTime : FILETIME;                   --  winbase.h :3392
         nFileSizeHigh : Win32.DWORD;                --  winbase.h :3393
         nFileSizeLow : Win32.DWORD;                --  winbase.h :3394
         dwReserved0 : Win32.DWORD;                --  winbase.h :3395
         dwReserved1 : Win32.DWORD;                --  winbase.h :3396
         cFileName : Win32.WCHAR_Array (0 .. 259);  --  winbase.h :3397
         cAlternateFileName : Win32.WCHAR_Array (0 .. 13);  --  winbase.h :3398
      end record;

   subtype WIN32_FIND_DATA is WIN32_FIND_DATAA;            --  winbase.h :3405

   type ENUMRESTYPEPROC is access function (hModule : Win32.Windef.HINSTANCE;
                                            lpType : Win32.Winnt.LPTSTR;
                                            lParam : Win32.LONG)
                                           return Win32.BOOL;
   pragma Convention (Stdcall, ENUMRESTYPEPROC);
   --  winbase.h :3938

   type ENUMRESNAMEPROC is access function (hModule : Win32.Windef.HINSTANCE;
                                            lpType : Win32.Winnt.LPCTSTR;
                                            lpName : Win32.Winnt.LPTSTR;
                                            lParam : Win32.LONG)
                                           return Win32.BOOL;
   pragma Convention (Stdcall, ENUMRESNAMEPROC);
   --  winbase.h :3940

   type ENUMRESLANGPROC is access function (hModule : Win32.Windef.HINSTANCE;
                                            lpType : Win32.Winnt.LPCTSTR;
                                            lpName : Win32.Winnt.LPCTSTR;
                                            wLanguage : Win32.WORD;
                                            lParam : Win32.LONG)
                                           return Win32.BOOL;
   pragma Convention (Stdcall, ENUMRESLANGPROC);
   --  winbase.h :3942

   type OSVERSIONINFOA is                                  --  winbase.h :6649
      record
         dwOSVersionInfoSize : Win32.DWORD;               --  winbase.h :6650
         dwMajorVersion : Win32.DWORD;               --  winbase.h :6651
         dwMinorVersion : Win32.DWORD;               --  winbase.h :6652
         dwBuildNumber : Win32.DWORD;               --  winbase.h :6653
         dwPlatformId : Win32.DWORD;               --  winbase.h :6654
         szCSDVersion : Win32.CHAR_Array (0 .. 127);  --  winbase.h :6655
      end record;

   type OSVERSIONINFOW is                                  --  winbase.h :6657
      record
         dwOSVersionInfoSize : Win32.DWORD;               --  winbase.h :6658
         dwMajorVersion : Win32.DWORD;               --  winbase.h :6659
         dwMinorVersion : Win32.DWORD;               --  winbase.h :6660
         dwBuildNumber : Win32.DWORD;               --  winbase.h :6661
         dwPlatformId : Win32.DWORD;               --  winbase.h :6662
         szCSDVersion : Win32.WCHAR_Array (0 .. 127); --  winbase.h :6663
      end record;

   subtype OSVERSIONINFO is OSVERSIONINFOA;                --  winbase.h :6670

   --  function MoveMemory
   --  (Destination : in Win32.pvoid;
   --  Source      : in Win32.pcvoid;
   --  Length      : in size_t) return Win32.pvoid
   --  renames Win32.Winnt.RtlMoveMemory;                    --  winbase.h :97

   --  function CopyMemory
   --  (Destination : in Win32.pvoid;
   --  Source      : in Win32.pcvoid;
   --  Length      : in size_t) return Win32.pvoid
   --  renames Win32.Winnt.RtlCopyMemory;                    --  winbase.h :98

   --  function FillMemory
   --  (Destination : in Win32.PVOID;
   --  Length      : in size_t;
   --  Fill        : in Win32.BYTE) return Win32.pvoid
   --  renames Win32.Winnt.RtlFillMemory;                  --  winbase.h :99

   --  function ZeroMemory
   --  (Destination : in Win32.pvoid;
   --  Length      : in size_t) return Win32.pvoid
   --  renames Win32.Winnt.RtlZeroMemory;                  --  winbase.h :100

   function InterlockedIncrement (lpAddend : access Win32.LONG)
                                 return Win32.LONG;          --  winbase.h :922

   function InterlockedDecrement (lpAddend : access Win32.LONG)
                                 return Win32.LONG;          --  winbase.h :929

   function InterlockedExchange (Target : access Win32.LONG;
                                 Value : Win32.LONG)
                                return Win32.LONG; --  winbase.h :936

   function FreeResource (hResData : Win32.Windef.HGLOBAL) return Win32.BOOL;
   --  winbase.h :946

   function LockResource (hResData : Win32.Windef.HGLOBAL) return Win32.LPVOID;
   --  winbase.h :953

   function MAKEINTATOM (wInteger : WORD) return Win32.Winnt.LPTSTR;
   --  winbase.h :959

   function WinMain (hInstance : Win32.Windef.HINSTANCE;
                     hPrevInstance : Win32.Windef.HINSTANCE;
                     lpCmdLine : Win32.LPSTR;
                     nShowCmd : Win32.INT)
                    return Win32.INT;       --  winbase.h :964

   function FreeLibrary (hLibModule : Win32.Windef.HINSTANCE)
                        return Win32.BOOL;   --  winbase.h :974

   function FreeModule (hLibModule : Win32.Windef.HINSTANCE) return BOOL
     renames FreeLibrary;                                --  winbase.h :466


   procedure FreeLibraryAndExitThread (hLibModule : Win32.Windef.HMODULE;
                                       dwExitCode : Win32.DWORD);
   --  winbase.h :982

   function DisableThreadLibraryCalls (hLibModule : Win32.Windef.HMODULE)
                                      return Win32.BOOL;     --  winbase.h :990

   function GetProcAddress (hModule : Win32.Windef.HINSTANCE;
                            lpProcName : Win32.LPCSTR)
                           return Win32.Windef.FARPROC;
   --  winbase.h :997

   function GetVersion return Win32.DWORD;                 --  winbase.h :1005

   function GlobalAlloc (uFlags : Win32.UINT;
                         dwBytes : Win32.DWORD)
                        return Win32.Windef.HGLOBAL;
   --  winbase.h :1010

   function GlobalDiscard (hglbMem : Win32.Windef.HGLOBAL)   --  winbase.h :491
                          return Win32.Windef.HGLOBAL;

   function GlobalReAlloc (hMem : Win32.Windef.HGLOBAL;
                           dwBytes : Win32.DWORD;
                           uFlags : Win32.UINT)
                          return Win32.Windef.HGLOBAL;
   --  winbase.h :1018

   function GlobalSize (hMem : Win32.Windef.HGLOBAL) return Win32.DWORD;
   --  winbase.h :1027

   function GlobalFlags (hMem : Win32.Windef.HGLOBAL) return Win32.UINT;
   --  winbase.h :1034

   function GlobalLock (hMem : Win32.Windef.HGLOBAL) return Win32.LPVOID;
   --  winbase.h :1042

   function GlobalHandle (pMem : Win32.LPCVOID) return Win32.Windef.HGLOBAL;
   --  winbase.h :1050

   function GlobalUnlock (hMem : Win32.Windef.HGLOBAL) return Win32.BOOL;
   --  winbase.h :1058

   function GlobalFree (hMem : Win32.Windef.HGLOBAL)
                       return Win32.Windef.HGLOBAL;  --  winbase.h :1066

   function GlobalCompact (dwMinFree : Win32.DWORD) return Win32.UINT;
   --  winbase.h :1073

   procedure GlobalFix (hMem : Win32.Windef.HGLOBAL);       --  winbase.h :1080

   procedure GlobalUnfix (hMem : Win32.Windef.HGLOBAL);     --  winbase.h :1087

   function GlobalWire (hMem : Win32.Windef.HGLOBAL) return Win32.LPVOID;
   --  winbase.h :1094

   function GlobalUnWire (hMem : Win32.Windef.HGLOBAL) return Win32.BOOL;
   --  winbase.h :1101

   procedure GlobalMemoryStatus (lpBuffer : LPMEMORYSTATUS);
   --  winbase.h :1108

   function LocalAlloc (uFlags : Win32.UINT;
                        uBytes : Win32.UINT)
                       return Win32.Windef.HLOCAL; --  winbase.h :1115

   function LocalReAlloc (hMem : Win32.Windef.HLOCAL;
                          uBytes : Win32.UINT;
                          uFlags : Win32.UINT)
                         return Win32.Windef.HLOCAL;
   --  winbase.h :1123

   function LocalDiscard (hlocMem : Win32.Windef.HLOCAL)
                         return Win32.Windef.HLOCAL;         --  winbase.h :525

   function LocalLock (hMem : Win32.Windef.HLOCAL) return Win32.LPVOID;
   --  winbase.h :1132

   function LocalHandle (pMem : Win32.LPCVOID) return Win32.Windef.HLOCAL;
   --  winbase.h :1139

   function LocalUnlock (hMem : Win32.Windef.HLOCAL) return Win32.BOOL;
   --  winbase.h :1146

   function LocalSize (hMem : Win32.Windef.HLOCAL) return Win32.UINT;
   --  winbase.h :1153

   function LocalFlags (hMem : Win32.Windef.HLOCAL) return Win32.UINT;
   --  winbase.h :1160

   function LocalFree (hMem : Win32.Windef.HLOCAL) return Win32.Windef.HLOCAL;
   --  winbase.h :1167

   function LocalShrink (hMem : Win32.Windef.HLOCAL;
                         cbNewSize : Win32.UINT)
                        return Win32.UINT;      --  winbase.h :1174

   function LocalCompact (uMinFree : Win32.UINT) return Win32.UINT;
   --  winbase.h :1182

   function FlushInstructionCache (hProcess : Win32.Winnt.HANDLE;
                                   lpBaseAddress : Win32.LPCVOID;
                                   dwSize : Win32.DWORD)
                                  return Win32.BOOL;
   --  winbase.h :1189

   function VirtualAlloc (lpAddress : Win32.LPVOID;
                          dwSize : Win32.DWORD;
                          flAllocationType : Win32.DWORD;
                          flProtect : Win32.DWORD)
                         return Win32.LPVOID;
   --  winbase.h :1198

   function VirtualFree (lpAddress : Win32.LPVOID;
                         dwSize : Win32.DWORD;
                         dwFreeType : Win32.DWORD)
                        return Win32.BOOL;     --  winbase.h :1208

   function VirtualProtect (lpAddress : Win32.LPVOID;
                            dwSize : Win32.DWORD;
                            flNewProtect : Win32.DWORD;
                            lpflOldProtect : access Win32.DWORD)
                           return Win32.BOOL;
   --  winbase.h :1217

   function VirtualQuery (lpAddress : Win32.LPCVOID;
                          lpBuffer : Win32.Winnt.PMEMORY_BASIC_INFORMATION;
                          dwLength : Win32.DWORD)
                         return Win32.DWORD;    --  winbase.h :1227

   function VirtualProtectEx (hProcess : Win32.Winnt.HANDLE;
                              lpAddress : Win32.LPVOID;
                              dwSize : Win32.DWORD;
                              flNewProtect : Win32.DWORD;
                              lpflOldProtect : access Win32.DWORD)
                             return Win32.BOOL;
   --  winbase.h :1236

   function VirtualQueryEx (hProcess : Win32.Winnt.HANDLE;
                            lpAddress : Win32.LPCVOID;
                            lpBuffer : Win32.Winnt.PMEMORY_BASIC_INFORMATION;
                            dwLength : Win32.DWORD)
                           return Win32.DWORD;  --  winbase.h :1247

   function HeapCreate (flOptions : Win32.DWORD;
                        dwInitialSize : Win32.DWORD;
                        dwMaximumSize : Win32.DWORD)
                       return Win32.Winnt.HANDLE;
   --  winbase.h :1257

   function HeapDestroy (hHeap : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :1266

   function HeapAlloc (hHeap : Win32.Winnt.HANDLE;
                       dwFlags : Win32.DWORD;
                       dwBytes : Win32.DWORD)
                      return Win32.LPVOID;        --  winbase.h :1273

   function HeapReAlloc (hHeap : Win32.Winnt.HANDLE;
                         dwFlags : Win32.DWORD;
                         lpMem : Win32.LPVOID;
                         dwBytes : Win32.DWORD)
                        return Win32.LPVOID;      --  winbase.h :1282

   function HeapFree (hHeap : Win32.Winnt.HANDLE;
                      dwFlags : Win32.DWORD;
                      lpMem : Win32.LPVOID)
                     return Win32.BOOL;           --  winbase.h :1292

   function HeapSize (hHeap : Win32.Winnt.HANDLE;
                      dwFlags : Win32.DWORD;
                      lpMem : Win32.LPCVOID)
                     return Win32.DWORD;          --  winbase.h :1301

   function HeapValidate (hHeap : Win32.Winnt.HANDLE;
                          dwFlags : Win32.DWORD;
                          lpMem : Win32.LPCVOID)
                         return Win32.BOOL;       --  winbase.h :1310

   function HeapCompact (hHeap : Win32.Winnt.HANDLE;
                         dwFlags : Win32.DWORD)
                        return Win32.UINT;        --  winbase.h :1319

   function GetProcessHeap return Win32.Winnt.HANDLE;      --  winbase.h :1327

   function GetProcessHeaps (NumberOfHeaps : Win32.DWORD;
                             ProcessHeaps : Win32.Winnt.PHANDLE)
                            return Win32.DWORD;
   --  winbase.h :1332

   function HeapLock (hHeap : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :1366

   function HeapUnlock (hHeap : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :1373

   function HeapWalk (hHeap : Win32.Winnt.HANDLE;
                      lpEntry : LPPROCESS_HEAP_ENTRY)
                     return Win32.BOOL;           --  winbase.h :1380

   function GetBinaryTypeA (lpApplicationName : Win32.LPCSTR;
                            lpBinaryType : Win32.LPDWORD)
                           return Win32.BOOL;
   --  winbase.h :1397

   function GetBinaryType (lpApplicationName : Win32.LPCSTR;
                           lpBinaryType : Win32.LPDWORD)
                          return Win32.BOOL
     renames GetBinaryTypeA;
   --  winbase.h :1397

   function GetBinaryTypeW (lpApplicationName : Win32.LPCWSTR;
                            lpBinaryType : Win32.LPDWORD)
                           return Win32.BOOL;
   --  winbase.h :1404

   function GetShortPathNameA (lpszLongPath : Win32.LPCSTR;
                               lpszShortPath : Win32.LPSTR;
                               cchBuffer : Win32.DWORD)
                              return Win32.DWORD;
   --  winbase.h :1417

   function GetShortPathName (lpszLongPath : Win32.LPCSTR;
                              lpszShortPath : Win32.LPSTR;
                              cchBuffer : Win32.DWORD)
                             return Win32.DWORD
     renames GetShortPathNameA;
   --  winbase.h :1417

   function GetShortPathNameW (lpszLongPath : Win32.LPCWSTR;
                               lpszShortPath : Win32.LPWSTR;
                               cchBuffer : Win32.DWORD)
                              return Win32.DWORD;
   --  winbase.h :1425

   function GetProcessAffinityMask (hProcess : Win32.Winnt.HANDLE;
                                    lpProcessAffinityMask : Win32.LPDWORD;
                                    lpSystemAffinityMask : Win32.LPDWORD)
                                   return Win32.BOOL;
   --  winbase.h :1439

   function GetProcessTimes (hProcess : Win32.Winnt.HANDLE;
                             lpCreationTime : LPFILETIME;
                             lpExitTime : LPFILETIME;
                             lpKernelTime : LPFILETIME;
                             lpUserTime : LPFILETIME)
                            return Win32.BOOL;
   --  winbase.h :1448

   function GetProcessWorkingSetSize (hProcess : Win32.Winnt.HANDLE;
                                      lpMinimumWorkingSetSize : Win32.LPDWORD;
                                      lpMaximumWorkingSetSize : Win32.LPDWORD)
                                     return Win32.BOOL;    --  winbase.h :1459

   function SetProcessWorkingSetSize (hProcess : Win32.Winnt.HANDLE;
                                      dwMinimumWorkingSetSize : Win32.DWORD;
                                      dwMaximumWorkingSetSize : Win32.DWORD)
                                     return Win32.BOOL;    --  winbase.h :1468

   function OpenProcess (dwDesiredAccess : Win32.DWORD;
                         bInheritHandle : Win32.BOOL;
                         dwProcessId : Win32.DWORD)
                        return Win32.Winnt.HANDLE;
   --  winbase.h :1477

   function GetCurrentProcess return Win32.Winnt.HANDLE;   --  winbase.h :1486

   function GetCurrentProcessId return Win32.DWORD;        --  winbase.h :1493

   procedure ExitProcess (uExitCode : Win32.UINT);         --  winbase.h :1500

   function TerminateProcess (hProcess : Win32.Winnt.HANDLE;
                              uExitCode : Win32.UINT)
                             return Win32.BOOL; --  winbase.h :1507

   function GetExitCodeProcess (hProcess : Win32.Winnt.HANDLE;
                                lpExitCode : Win32.LPDWORD)
                               return Win32.BOOL;
   --  winbase.h :1515

   procedure FatalExit (ExitCode : Win32.INT);              --  winbase.h :1524

   function GetEnvironmentStrings return Win32.LPSTR;      --  winbase.h :1531

   function GetEnvironmentStringsA return Win32.LPSTR
     renames GetEnvironmentStrings;
   --  winbase.h :1531

   function GetEnvironmentStringsW return Win32.LPWSTR;    --  winbase.h :1538

   function FreeEnvironmentStringsA (lpszEnvironmentBlock : Win32.LPSTR)
                                    return Win32.BOOL;      --  winbase.h :1551

   function FreeEnvironmentStrings (lpszEnvironmentBlock : Win32.LPSTR)
                                   return Win32.BOOL
     renames FreeEnvironmentStringsA;                    --  winbase.h :1551

   function FreeEnvironmentStringsW (lpszEnvironmentBlock : Win32.LPWSTR)
                                    return Win32.BOOL;
   --  winbase.h :1557

   procedure RaiseException (dwExceptionCode : Win32.DWORD;
                             dwExceptionFlags : Win32.DWORD;
                             nNumberOfArguments : Win32.DWORD;
                             lpArguments : Win32.PCDWORD);
   --  winbase.h :1569

   function UnhandledExceptionFilter
     (ExceptionInfo : Win32.Winnt.PEXCEPTION_POINTERS)
     return Win32.LONG;                                  --  winbase.h :1579

   function SetUnhandledExceptionFilter
     (lpTopLevelExceptionFilter : LPTOP_LEVEL_EXCEPTION_FILTER)
     return LPTOP_LEVEL_EXCEPTION_FILTER;                --  winbase.h :1591

   function CreateThread (lpThreadAttributes : LPSECURITY_ATTRIBUTES;
                          dwStackSize : Win32.DWORD;
                          lpStartAddress : LPTHREAD_START_ROUTINE;
                          lpParameter : Win32.LPVOID;
                          dwCreationFlags : Win32.DWORD;
                          lpThreadId : Win32.LPDWORD)
                         return Win32.Winnt.HANDLE;
   --  winbase.h :1598

   function CreateRemoteThread (hProcess : Win32.Winnt.HANDLE;
                                lpThreadAttributes : LPSECURITY_ATTRIBUTES;
                                dwStackSize : Win32.DWORD;
                                lpStartAddress : LPTHREAD_START_ROUTINE;
                                lpParameter : Win32.LPVOID;
                                dwCreationFlags : Win32.DWORD;
                                lpThreadId : Win32.LPDWORD)
                               return Win32.Winnt.HANDLE;
   --  winbase.h :1610

   function GetCurrentThread return Win32.Winnt.HANDLE;    --  winbase.h :1623

   function GetCurrentThreadId return Win32.DWORD;         --  winbase.h :1630

   function SetThreadAffinityMask (hThread : Win32.Winnt.HANDLE;
                                   dwThreadAffinityMask : Win32.DWORD)
                                  return Win32.DWORD;
   --  winbase.h :1637

   function SetThreadPriority (hThread : Win32.Winnt.HANDLE;
                               nPriority : Win32.INT)
                              return Win32.BOOL; --  winbase.h :1645

   function GetThreadPriority (hThread : Win32.Winnt.HANDLE) return Win32.INT;
   --  winbase.h :1653

   function GetThreadTimes (hThread : Win32.Winnt.HANDLE;
                            lpCreationTime : LPFILETIME;
                            lpExitTime : LPFILETIME;
                            lpKernelTime : LPFILETIME;
                            lpUserTime : LPFILETIME)
                           return Win32.BOOL;
   --  winbase.h :1660

   procedure ExitThread (dwExitCode : Win32.DWORD);         --  winbase.h :1671

   function TerminateThread (hThread : Win32.Winnt.HANDLE;
                             dwExitCode : Win32.DWORD)
                            return Win32.BOOL; --  winbase.h :1678

   function GetExitCodeThread (hThread : Win32.Winnt.HANDLE;
                               lpExitCode : Win32.LPDWORD)
                              return Win32.BOOL;
   --  winbase.h :1686

   function GetThreadSelectorEntry (hThread : Win32.Winnt.HANDLE;
                                    dwSelector : Win32.DWORD;
                                    lpSelectorEntry : LPLDT_ENTRY)
                                   return Win32.BOOL;
   --  winbase.h :1694

   function GetLastError return Win32.DWORD;               --  winbase.h :1703

   procedure SetLastError (dwErrCode : Win32.DWORD);        --  winbase.h :1710

   function GetOverlappedResult (hFile : Win32.Winnt.HANDLE;
                                 lpOverlapped : Win32.Winbase.LPOVERLAPPED;
                                 lpNumberOfBytesTransferred : Win32.LPDWORD;
                                 bWait : Win32.BOOL)
                                return Win32.BOOL;
   --  winbase.h :1717

   function CreateIoCompletionPort
     (FileHandle : Win32.Winnt.HANDLE;
              ExistingCompletionPort : Win32.Winnt.HANDLE;
              CompletionKey : Win32.DWORD;
              NumberOfConcurrentThreads : Win32.DWORD)
     return Win32.Winnt.HANDLE;
   --  winbase.h :1727

   function GetQueuedCompletionStatus
     (CompletionPort : Win32.Winnt.HANDLE;
              lpNumberOfBytesTransferred : Win32.LPDWORD;
              lpCompletionKey : Win32.LPDWORD;
              lpOverlapped : access Win32.Winbase.LPOVERLAPPED;
              dwMilliseconds : Win32.DWORD)
     return Win32.BOOL;      --  winbase.h :1737

   function SetErrorMode (uMode : Win32.UINT) return Win32.UINT;
   --  winbase.h :1753

   function ReadProcessMemory (hProcess : Win32.Winnt.HANDLE;
                               lpBaseAddress : Win32.LPCVOID;
                               lpBuffer : Win32.LPVOID;
                               nSize : Win32.DWORD;
                               lpNumberOfBytesRead : Win32.LPDWORD)
                              return Win32.BOOL;
   --  winbase.h :1760

   function WriteProcessMemory (hProcess : Win32.Winnt.HANDLE;
                                lpBaseAddress : Win32.LPVOID;
                                lpBuffer : Win32.LPVOID;
                                nSize : Win32.DWORD;
                                lpNumberOfBytesWritten : Win32.LPDWORD)
                               return Win32.BOOL;
   --  winbase.h :1771

   function GetThreadContext (hThread : Win32.Winnt.HANDLE;
                              lpContext : Win32.Winbase.LPCONTEXT)
                             return Win32.BOOL; --  winbase.h :1782

   function SetThreadContext (hThread : Win32.Winnt.HANDLE;
                              lpContext : ac_CONTEXT_t)
                             return Win32.BOOL; --  winbase.h :1790

   function SuspendThread (hThread : Win32.Winnt.HANDLE) return Win32.DWORD;
   --  winbase.h :1798

   function ResumeThread (hThread : Win32.Winnt.HANDLE) return Win32.DWORD;
   --  winbase.h :1805

   procedure DebugBreak;                                   --  winbase.h :1812

   function WaitForDebugEvent (lpDebugEvent : LPDEBUG_EVENT;
                               dwMilliseconds : Win32.DWORD)
                              return Win32.BOOL;
   --  winbase.h :1819

   function ContinueDebugEvent (dwProcessId : Win32.DWORD;
                                dwThreadId : Win32.DWORD;
                                dwContinueStatus : Win32.DWORD)
                               return Win32.BOOL;
   --  winbase.h :1827

   function DebugActiveProcess (dwProcessId : Win32.DWORD) return Win32.BOOL;
   --  winbase.h :1836

   procedure InitializeCriticalSection
     (lpCriticalSection : LPCRITICAL_SECTION);
   --  winbase.h :1843

   procedure EnterCriticalSection (lpCriticalSection : LPCRITICAL_SECTION);
   --  winbase.h :1850

   procedure LeaveCriticalSection (lpCriticalSection : LPCRITICAL_SECTION);
   --  winbase.h :1857

   procedure DeleteCriticalSection (lpCriticalSection : LPCRITICAL_SECTION);
   --  winbase.h :1864

   function SetEvent (hEvent : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :1871

   function ResetEvent (hEvent : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :1878

   function PulseEvent (hEvent : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :1885

   function ReleaseSemaphore (hSemaphore : Win32.Winnt.HANDLE;
                              lReleaseCount : Win32.LONG;
                              lpPreviousCount : Win32.PLONG)
                             return Win32.BOOL;
   --  winbase.h :1892

   function ReleaseMutex (hMutex : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :1901

   function WaitForSingleObject (hHandle : Win32.Winnt.HANDLE;
                                 dwMilliseconds : Win32.DWORD)
                                return Win32.DWORD;
   --  winbase.h :1908

   function WaitForMultipleObjects (nCount : Win32.DWORD;
                                    lpHandles : PCHANDLE;
                                    bWaitAll : Win32.BOOL;
                                    dwMilliseconds : Win32.DWORD)
                                   return Win32.DWORD;
   --  winbase.h :1916

   procedure Sleep (dwMilliseconds : Win32.DWORD);          --  winbase.h :1926

   function LoadResource (hModule : Win32.Windef.HINSTANCE;
                          hResInfo : Win32.Windef.HRSRC)
                         return Win32.Windef.HGLOBAL;
   --  winbase.h :1933

   function SizeofResource (hModule : Win32.Windef.HINSTANCE;
                            hResInfo : Win32.Windef.HRSRC)
                           return Win32.DWORD;   --  winbase.h :1941

   function GlobalDeleteAtom (nAtom : Win32.Windef.ATOM)
                             return Win32.Windef.ATOM;      --  winbase.h :1950

   function InitAtomTable (nSize : Win32.DWORD) return Win32.BOOL;
   --  winbase.h :1957

   function DeleteAtom (nAtom : Win32.Windef.ATOM) return Win32.Windef.ATOM;
   --  winbase.h :1964

   function SetHandleCount (uNumber : Win32.UINT) return Win32.UINT;
   --  winbase.h :1971

   function GetLogicalDrives return Win32.DWORD;           --  winbase.h :1978

   function LockFile (hFile : Win32.Winnt.HANDLE;
                      dwFileOffsetLow : Win32.DWORD;
                      dwFileOffsetHigh : Win32.DWORD;
                      nNumberOfBytesToLockLow : Win32.DWORD;
                      nNumberOfBytesToLockHigh : Win32.DWORD)
                     return Win32.BOOL;
   --  winbase.h :1985

   function UnlockFile (hFile : Win32.Winnt.HANDLE;
                        dwFileOffsetLow : Win32.DWORD;
                        dwFileOffsetHigh : Win32.DWORD;
                        nNumberOfBytesToUnlockLow : Win32.DWORD;
                        nNumberOfBytesToUnlockHigh : Win32.DWORD)
                       return Win32.BOOL;
   --  winbase.h :1996

   function LockFileEx (hFile : Win32.Winnt.HANDLE;
                        dwFlags : Win32.DWORD;
                        dwReserved : Win32.DWORD;
                        nNumberOfBytesToLockLow : Win32.DWORD;
                        nNumberOfBytesToLockHigh : Win32.DWORD;
                        lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                       return Win32.BOOL;
   --  winbase.h :2007

   function UnlockFileEx (hFile : Win32.Winnt.HANDLE;
                          dwReserved : Win32.DWORD;
                          nNumberOfBytesToUnlockLow : Win32.DWORD;
                          nNumberOfBytesToUnlockHigh : Win32.DWORD;
                          lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                         return Win32.BOOL;
   --  winbase.h :2022

   function GetFileInformationByHandle
     (hFile : Win32.Winnt.HANDLE;
              lpFileInformation : LPBY_HANDLE_FILE_INFORMATION)
     return Win32.BOOL;               --  winbase.h :2046

   function GetFileType (hFile : Win32.Winnt.HANDLE) return Win32.DWORD;
   --  winbase.h :2054

   function GetFileSize (hFile : Win32.Winnt.HANDLE;
                         lpFileSizeHigh : Win32.LPDWORD)
                        return Win32.DWORD; --  winbase.h :2061

   function GetStdHandle (nStdHandle : Win32.DWORD) return Win32.Winnt.HANDLE;
   --  winbase.h :2069

   function SetStdHandle (nStdHandle : Win32.DWORD;
                          hHandle : Win32.Winnt.HANDLE)
                         return Win32.BOOL;    --  winbase.h :2076

   function WriteFile (hFile : Win32.Winnt.HANDLE;
                       lpBuffer : Win32.LPCVOID;
                       nNumberOfBytesToWrite : Win32.DWORD;
                       lpNumberOfBytesWritten : Win32.LPDWORD;
                       lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                      return Win32.BOOL;
   --  winbase.h :2084

   function ReadFile (hFile : Win32.Winnt.HANDLE;
                      lpBuffer : Win32.LPVOID;
                      nNumberOfBytesToRead : Win32.DWORD;
                      lpNumberOfBytesRead : Win32.LPDWORD;
                      lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                     return Win32.BOOL;
   --  winbase.h :2095

   function FlushFileBuffers (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :2106

   function DeviceIoControl (hDevice : Win32.Winnt.HANDLE;
                             dwIoControlCode : Win32.DWORD;
                             lpInBuffer : Win32.LPVOID;
                             nInBufferSize : Win32.DWORD;
                             lpOutBuffer : Win32.LPVOID;
                             nOutBufferSize : Win32.DWORD;
                             lpBytesReturned : Win32.LPDWORD;
                             lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                            return Win32.BOOL;
   --  winbase.h :2113

   function SetEndOfFile (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :2127

   function SetFilePointer (hFile : Win32.Winnt.HANDLE;
                            lDistanceToMove : Win32.LONG;
                            lpDistanceToMoveHigh : Win32.PLONG;
                            dwMoveMethod : Win32.DWORD)
                           return Win32.DWORD;
   --  winbase.h :2134

   function FindClose (hFindFile : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :2144

   function GetFileTime (hFile : Win32.Winnt.HANDLE;
                         lpCreationTime : LPFILETIME;
                         lpLastAccessTime : LPFILETIME;
                         lpLastWriteTime : LPFILETIME)
                        return Win32.BOOL;
   --  winbase.h :2151

   function SetFileTime (hFile : Win32.Winnt.HANDLE;
                         lpCreationTime : ac_FILETIME_t;
                         lpLastAccessTime : ac_FILETIME_t;
                         lpLastWriteTime : ac_FILETIME_t)
                        return Win32.BOOL;
   --  winbase.h :2161

   function CloseHandle (hObject : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :2171

   function DuplicateHandle (hSourceProcessHandle : Win32.Winnt.HANDLE;
                             hSourceHandle : Win32.Winnt.HANDLE;
                             hTargetProcessHandle : Win32.Winnt.HANDLE;
                             lpTargetHandle : Win32.Windef.LPHANDLE;
                             dwDesiredAccess : Win32.DWORD;
                             bInheritHandle : Win32.BOOL;
                             dwOptions : Win32.DWORD)
                            return Win32.BOOL;
   --  winbase.h :2178

   function GetHandleInformation (hObject : Win32.Winnt.HANDLE;
                                  lpdwFlags : Win32.LPDWORD)
                                 return Win32.BOOL;
   --  winbase.h :2191

   function SetHandleInformation (hObject : Win32.Winnt.HANDLE;
                                  dwMask : Win32.DWORD;
                                  dwFlags : Win32.DWORD)
                                 return Win32.BOOL;
   --  winbase.h :2199

   function LoadModule (lpModuleName : Win32.LPCSTR;
                        lpParameterBlock : Win32.LPVOID)
                       return Win32.DWORD;
   --  winbase.h :2213

   function WinExec (lpCmdLine : Win32.LPCSTR;
                     uCmdShow : Win32.UINT)
                    return Win32.UINT;          --  winbase.h :2221

   function ClearCommBreak (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :2229

   function ClearCommError (hFile : Win32.Winnt.HANDLE;
                            lpErrors : Win32.LPDWORD;
                            lpStat : LPCOMSTAT)
                           return Win32.BOOL;    --  winbase.h :2236

   function SetupComm (hFile : Win32.Winnt.HANDLE;
                       dwInQueue : Win32.DWORD;
                       dwOutQueue : Win32.DWORD)
                      return Win32.BOOL;       --  winbase.h :2245

   function EscapeCommFunction (hFile : Win32.Winnt.HANDLE;
                                dwFunc : Win32.DWORD)
                               return Win32.BOOL;  --  winbase.h :2254

   function GetCommConfig (hCommDev : Win32.Winnt.HANDLE;
                           lpCC : LPCOMMCONFIG;
                           lpdwSize : Win32.LPDWORD)
                          return Win32.BOOL;     --  winbase.h :2262

   function GetCommMask (hFile : Win32.Winnt.HANDLE;
                         lpEvtMask : Win32.LPDWORD)
                        return Win32.BOOL;      --  winbase.h :2271

   function GetCommProperties (hFile : Win32.Winnt.HANDLE;
                               lpCommProp : Win32.Winbase.LPCOMMPROP)
                              return Win32.BOOL;
   --  winbase.h :2279

   function GetCommModemStatus (hFile : Win32.Winnt.HANDLE;
                                lpModemStat : Win32.LPDWORD)
                               return Win32.BOOL;
   --  winbase.h :2287

   function GetCommState (hFile : Win32.Winnt.HANDLE;
                          lpDCB : Win32.Winbase.LPDCB)
                         return Win32.BOOL;         --  winbase.h :2295

   function GetCommTimeouts (hFile : Win32.Winnt.HANDLE;
                             lpCommTimeouts : Win32.Winbase.LPCOMMTIMEOUTS)
                            return Win32.BOOL;
   --  winbase.h :2303

   function PurgeComm (hFile : Win32.Winnt.HANDLE;
                       dwFlags : Win32.DWORD)
                      return Win32.BOOL;          --  winbase.h :2311

   function SetCommBreak (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :2319

   function SetCommConfig (hCommDev : Win32.Winnt.HANDLE;
                           lpCC : LPCOMMCONFIG;
                           dwSize : Win32.DWORD)
                          return Win32.BOOL;     --  winbase.h :2326

   function SetCommMask (hFile : Win32.Winnt.HANDLE;
                         dwEvtMask : Win32.DWORD)
                        return Win32.BOOL;      --  winbase.h :2335

   function SetCommState (hFile : Win32.Winnt.HANDLE;
                          lpDCB : Win32.Winbase.LPDCB)
                         return Win32.BOOL;         --  winbase.h :2343

   function SetCommTimeouts (hFile : Win32.Winnt.HANDLE;
                             lpCommTimeouts : Win32.Winbase.LPCOMMTIMEOUTS)
                            return Win32.BOOL;
   --  winbase.h :2351

   function TransmitCommChar (hFile : Win32.Winnt.HANDLE;
                              cChar : Win32.CHAR)
                             return Win32.BOOL;     --  winbase.h :2359

   function WaitCommEvent (hFile : Win32.Winnt.HANDLE;
                           lpEvtMask : Win32.LPDWORD;
                           lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                          return Win32.BOOL; --  winbase.h :2367

   function SetTapePosition (hDevice : Win32.Winnt.HANDLE;
                             dwPositionMethod : Win32.DWORD;
                             dwPartition : Win32.DWORD;
                             dwOffsetLow : Win32.DWORD;
                             dwOffsetHigh : Win32.DWORD;
                             bImmediate : Win32.BOOL)
                            return Win32.DWORD;
   --  winbase.h :2377

   function GetTapePosition (hDevice : Win32.Winnt.HANDLE;
                             dwPositionType : Win32.DWORD;
                             lpdwPartition : Win32.LPDWORD;
                             lpdwOffsetLow : Win32.LPDWORD;
                             lpdwOffsetHigh : Win32.LPDWORD)
                            return Win32.DWORD;
   --  winbase.h :2389

   function PrepareTape (hDevice : Win32.Winnt.HANDLE;
                         dwOperation : Win32.DWORD;
                         bImmediate : Win32.BOOL)
                        return Win32.DWORD;   --  winbase.h :2400

   function EraseTape (hDevice : Win32.Winnt.HANDLE;
                       dwEraseType : Win32.DWORD;
                       bImmediate : Win32.BOOL)
                      return Win32.DWORD;     --  winbase.h :2409

   function CreateTapePartition (hDevice : Win32.Winnt.HANDLE;
                                 dwPartitionMethod : Win32.DWORD;
                                 dwCount : Win32.DWORD;
                                 dwSize : Win32.DWORD)
                                return Win32.DWORD;
   --  winbase.h :2418

   function WriteTapemark (hDevice : Win32.Winnt.HANDLE;
                           dwTapemarkType : Win32.DWORD;
                           dwTapemarkCount : Win32.DWORD;
                           bImmediate : Win32.BOOL)
                          return Win32.DWORD;
   --  winbase.h :2428

   function GetTapeStatus (hDevice : Win32.Winnt.HANDLE) return Win32.DWORD;
   --  winbase.h :2438

   function GetTapeParameters (hDevice : Win32.Winnt.HANDLE;
                               dwOperation : Win32.DWORD;
                               lpdwSize : Win32.LPDWORD;
                               lpTapeInformation : Win32.LPVOID)
                              return Win32.DWORD;
   --  winbase.h :2445

   function SetTapeParameters (hDevice : Win32.Winnt.HANDLE;
                               dwOperation : Win32.DWORD;
                               lpTapeInformation : Win32.LPVOID)
                              return Win32.DWORD;
   --  winbase.h :2458

   function Beep (dwFreq : Win32.DWORD;
                  dwDuration : Win32.DWORD)
                 return Win32.BOOL;            --  winbase.h :2470

   procedure OpenSound;                                    --  winbase.h :2478

   procedure CloseSound;                                   --  winbase.h :2485

   procedure StartSound;                                   --  winbase.h :2492

   procedure StopSound;                                    --  winbase.h :2499

   function WaitSoundState (nState : Win32.DWORD) return Win32.DWORD;
   --  winbase.h :2506

   function SyncAllVoices return Win32.DWORD;              --  winbase.h :2513

   function CountVoiceNotes (nVoice : Win32.DWORD) return Win32.DWORD;
   --  winbase.h :2520

   function GetThresholdEvent return Win32.LPDWORD;        --  winbase.h :2527

   function GetThresholdStatus return Win32.DWORD;         --  winbase.h :2534

   function SetSoundNoise (nSource : Win32.DWORD;
                           nDuration : Win32.DWORD)
                          return Win32.DWORD;   --  winbase.h :2541

   function SetVoiceAccent (nVoice : Win32.DWORD;
                            nTempo : Win32.DWORD;
                            nVolume : Win32.DWORD;
                            nMode : Win32.DWORD;
                            nPitch : Win32.DWORD)
                           return Win32.DWORD;    --  winbase.h :2549

   function SetVoiceEnvelope (nVoice : Win32.DWORD;
                              nShape : Win32.DWORD;
                              nRepeat : Win32.DWORD)
                             return Win32.DWORD;  --  winbase.h :2560

   function SetVoiceNote (nVoice : Win32.DWORD;
                          nValue : Win32.DWORD;
                          nLength : Win32.DWORD;
                          nCdots : Win32.DWORD)
                         return Win32.DWORD;      --  winbase.h :2569

   function SetVoiceQueueSize (nVoice : Win32.DWORD;
                               nBytes : Win32.DWORD)
                              return Win32.DWORD;  --  winbase.h :2579

   function SetVoiceSound (nVoice : Win32.DWORD;
                           Frequency : Win32.DWORD;
                           nDuration : Win32.DWORD)
                          return Win32.DWORD;   --  winbase.h :2587

   function SetVoiceThreshold (nVoice : Win32.DWORD;
                               nNotes : Win32.DWORD)
                              return Win32.DWORD;  --  winbase.h :2596

   function MulDiv (nNumber : Win32.INT;
                    nNumerator : Win32.INT;
                    nDenominator : Win32.INT)
                   return Win32.INT;         --  winbase.h :2604

   procedure GetSystemTime (lpSystemTime : Win32.Winbase.LPSYSTEMTIME);
   --  winbase.h :2613

   function SetSystemTime (lpSystemTime : ac_SYSTEMTIME_t) return Win32.BOOL;
   --  winbase.h :2620

   procedure GetLocalTime (lpSystemTime : Win32.Winbase.LPSYSTEMTIME);
   --  winbase.h :2627

   function SetLocalTime (lpSystemTime : ac_SYSTEMTIME_t) return Win32.BOOL;
   --  winbase.h :2634

   procedure GetSystemInfo (lpSystemInfo : LPSYSTEM_INFO);  --  winbase.h :2641

   function SystemTimeToTzSpecificLocalTime
     (lpTimeZoneInformation : LPTIME_ZONE_INFORMATION;
              lpUniversalTime : LPSYSTEMTIME;
              lpLocalTime : LPSYSTEMTIME)
     return Win32.BOOL;           --  winbase.h :2658

   function GetTimeZoneInformation
     (lpTimeZoneInformation : LPTIME_ZONE_INFORMATION)
     return Win32.DWORD;          --  winbase.h :2667

   function SetTimeZoneInformation
     (lpTimeZoneInformation : ac_TIME_ZONE_INFORMATION_t)
     return Win32.BOOL;                                  --  winbase.h :2674

   function SystemTimeToFileTime (lpSystemTime : ac_SYSTEMTIME_t;
                                  lpFileTime : Win32.Winbase.LPFILETIME)
                                 return Win32.BOOL;
   --  winbase.h :2685

   function FileTimeToLocalFileTime
     (lpFileTime : ac_FILETIME_t;
      lpLocalFileTime : Win32.Winbase.LPFILETIME)
     return Win32.BOOL;
   --  winbase.h :2693

   function LocalFileTimeToFileTime (lpLocalFileTime : ac_FILETIME_t;
                                     lpFileTime : Win32.Winbase.LPFILETIME)
                                    return Win32.BOOL;
   --  winbase.h :2701

   function FileTimeToSystemTime (lpFileTime : ac_FILETIME_t;
                                  lpSystemTime : Win32.Winbase.LPSYSTEMTIME)
                                 return Win32.BOOL;
   --  winbase.h :2709

   function CompareFileTime (lpFileTime1 : ac_FILETIME_t;
                             lpFileTime2 : ac_FILETIME_t)
                            return Win32.LONG; --  winbase.h :2717

   function FileTimeToDosDateTime (lpFileTime : ac_FILETIME_t;
                                   lpFatDate : Win32.LPWORD;
                                   lpFatTime : Win32.LPWORD)
                                  return Win32.BOOL;
   --  winbase.h :2725

   function DosDateTimeToFileTime (wFatDate : Win32.WORD;
                                   wFatTime : Win32.WORD;
                                   lpFileTime : Win32.Winbase.LPFILETIME)
                                  return Win32.BOOL;
   --  winbase.h :2734

   function GetTickCount return Win32.DWORD;               --  winbase.h :2743

   function GetCurrentTime return DWORD renames GetTickCount;
   --  winbase.h :53

   function SetSystemTimeAdjustment (dwTimeAdjustment : Win32.DWORD;
                                     bTimeAdjustmentDisabled : Win32.BOOL)
                                    return Win32.BOOL;
   --  winbase.h :2750

   function GetSystemTimeAdjustment
     (lpTimeAdjustment : access Win32.DWORD;
              lpTimeIncrement : access Win32.DWORD;
              lpTimeAdjustmentDisabled : Win32.PBOOL)
     return Win32.BOOL;     --  winbase.h :2758

   function FormatMessageA (dwFlags : Win32.DWORD;
                            lpSource : Win32.LPCVOID;
                            dwMessageId : Win32.DWORD;
                            dwLanguageId : Win32.DWORD;
                            lpBuffer : Win32.LPSTR;
                            nSize : Win32.DWORD;
                            Arguments : Stdarg.ArgList :=   Stdarg.Empty)
                           return Win32.DWORD;
   --  winbase.h :2767

   function FormatMessage (dwFlags : Win32.DWORD;
                           lpSource : Win32.LPCVOID;
                           dwMessageId : Win32.DWORD;
                           dwLanguageId : Win32.DWORD;
                           lpBuffer : Win32.LPSTR;
                           nSize : Win32.DWORD;
                           Arguments : Stdarg.ArgList :=   Stdarg.Empty)
                          return Win32.DWORD
     renames FormatMessageA;
   --  winbase.h :2767

   function FormatMessageW (dwFlags : Win32.DWORD;
                            lpSource : Win32.LPCVOID;
                            dwMessageId : Win32.DWORD;
                            dwLanguageId : Win32.DWORD;
                            lpBuffer : Win32.LPWSTR;
                            nSize : Win32.DWORD;
                            Arguments : Stdarg.ArgList :=   Stdarg.Empty)
                           return Win32.DWORD;
   --  winbase.h :2779

   function CreatePipe (hReadPipe : Win32.Winnt.PHANDLE;
                        hWritePipe : Win32.Winnt.PHANDLE;
                        lpPipeAttributes : LPSECURITY_ATTRIBUTES;
                        nSize : Win32.DWORD)
                       return Win32.BOOL; --  winbase.h :2806

   function ConnectNamedPipe (hNamedPipe : Win32.Winnt.HANDLE;
                              lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                             return Win32.BOOL;
   --  winbase.h :2816

   function DisconnectNamedPipe (hNamedPipe : Win32.Winnt.HANDLE)
                                return Win32.BOOL;          --  winbase.h :2824

   function SetNamedPipeHandleState (hNamedPipe : Win32.Winnt.HANDLE;
                                     lpMode : Win32.LPDWORD;
                                     lpMaxCollectionCount : Win32.LPDWORD;
                                     lpCollectDataTimeout : Win32.LPDWORD)
                                    return Win32.BOOL;
   --  winbase.h :2831

   function GetNamedPipeInfo (hNamedPipe : Win32.Winnt.HANDLE;
                              lpFlags : Win32.LPDWORD;
                              lpOutBufferSize : Win32.LPDWORD;
                              lpInBufferSize : Win32.LPDWORD;
                              lpMaxInstances : Win32.LPDWORD)
                             return Win32.BOOL;
   --  winbase.h :2841

   function PeekNamedPipe (hNamedPipe : Win32.Winnt.HANDLE;
                           lpBuffer : Win32.LPVOID;
                           nBufferSize : Win32.DWORD;
                           lpBytesRead : Win32.LPDWORD;
                           lpTotalBytesAvail : Win32.LPDWORD;
                           lpBytesLeftThisMessage : Win32.LPDWORD)
                          return Win32.BOOL;
   --  winbase.h :2852

   function TransactNamedPipe (hNamedPipe : Win32.Winnt.HANDLE;
                               lpInBuffer : Win32.LPVOID;
                               nInBufferSize : Win32.DWORD;
                               lpOutBuffer : Win32.LPVOID;
                               nOutBufferSize : Win32.DWORD;
                               lpBytesRead : Win32.LPDWORD;
                               lpOverlapped : Win32.Winbase.LPOVERLAPPED)
                              return Win32.BOOL;
   --  winbase.h :2864

   function CreateMailslotA (lpName : Win32.LPCSTR;
                             nMaxMessageSize : Win32.DWORD;
                             lReadTimeout : Win32.DWORD;
                             lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                            return Win32.Winnt.HANDLE;
   --  winbase.h :2877

   function CreateMailslot (lpName : Win32.LPCSTR;
                            nMaxMessageSize : Win32.DWORD;
                            lReadTimeout : Win32.DWORD;
                            lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                           return Win32.Winnt.HANDLE
     renames CreateMailslotA;
   --  winbase.h :2877

   function CreateMailslotW (lpName : Win32.LPCWSTR;
                             nMaxMessageSize : Win32.DWORD;
                             lReadTimeout : Win32.DWORD;
                             lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                            return Win32.Winnt.HANDLE;
   --  winbase.h :2886

   function GetMailslotInfo (hMailslot : Win32.Winnt.HANDLE;
                             lpMaxMessageSize : Win32.LPDWORD;
                             lpNextSize : Win32.LPDWORD;
                             lpMessageCount : Win32.LPDWORD;
                             lpReadTimeout : Win32.LPDWORD)
                            return Win32.BOOL;
   --  winbase.h :2901

   function SetMailslotInfo (hMailslot : Win32.Winnt.HANDLE;
                             lReadTimeout : Win32.DWORD)
                            return Win32.BOOL;
   --  winbase.h :2912

   function MapViewOfFile (hFileMappingObject : Win32.Winnt.HANDLE;
                           dwDesiredAccess : Win32.DWORD;
                           dwFileOffsetHigh : Win32.DWORD;
                           dwFileOffsetLow : Win32.DWORD;
                           dwNumberOfBytesToMap : Win32.DWORD)
                          return Win32.LPVOID;
   --  winbase.h :2920

   function FlushViewOfFile (lpBaseAddress : Win32.LPCVOID;
                             dwNumberOfBytesToFlush : Win32.DWORD)
                            return Win32.BOOL;
   --  winbase.h :2931

   function UnmapViewOfFile (lpBaseAddress : Win32.LPVOID) return Win32.BOOL;
   --  winbase.h :2939

   function lstrcmpA (lpString1 : Win32.LPCSTR;
                      lpString2 : Win32.LPCSTR)
                     return Win32.INT;          --  winbase.h :2950

   function lstrcmp (lpString1 : Win32.LPCSTR;
                     lpString2 : Win32.LPCSTR)
                    return Win32.INT
     renames lstrcmpA;           --  winbase.h :2950

   function lstrcmpW (lpString1 : Win32.LPCWSTR;
                      lpString2 : Win32.LPCWSTR)
                     return Win32.INT;          --  winbase.h :2957

   function lstrcmpiA (lpString1 : Win32.LPCSTR;
                       lpString2 : Win32.LPCSTR)
                      return Win32.INT;         --  winbase.h :2970

   function lstrcmpi (lpString1 : Win32.LPCSTR;
                      lpString2 : Win32.LPCSTR)
                     return Win32.INT
     renames lstrcmpiA;         --  winbase.h :2970

   function lstrcmpiW (lpString1 : Win32.LPCWSTR;
                       lpString2 : Win32.LPCWSTR)
                      return Win32.INT;         --  winbase.h :2977

   function lstrcpynA (lpString1 : Win32.LPSTR;
                       lpString2 : Win32.LPCSTR;
                       iMaxLength : Win32.INT)
                      return Win32.LPSTR;      --  winbase.h :2990

   function lstrcpyn (lpString1 : Win32.LPSTR;
                      lpString2 : Win32.LPCSTR;
                      iMaxLength : Win32.INT)
                     return Win32.LPSTR
     renames lstrcpynA;        --  winbase.h :2990

   function lstrcpynW (lpString1 : Win32.LPWSTR;
                       lpString2 : Win32.LPCWSTR;
                       iMaxLength : Win32.INT)
                      return Win32.LPWSTR;     --  winbase.h :2998

   function lstrcpyA (lpString1 : Win32.LPSTR;
                      lpString2 : Win32.LPCSTR)
                     return Win32.LPSTR;        --  winbase.h :3012

   function lstrcpy (lpString1 : Win32.LPSTR;
                     lpString2 : Win32.LPCSTR)
                    return Win32.LPSTR
     renames lstrcpyA;           --  winbase.h :3012

   function lstrcpyW (lpString1 : Win32.LPWSTR;
                      lpString2 : Win32.LPCWSTR)
                     return Win32.LPWSTR;       --  winbase.h :3019

   function lstrcatA (lpString1 : Win32.LPSTR;
                      lpString2 : Win32.LPCSTR)
                     return Win32.LPSTR;        --  winbase.h :3032

   function lstrcat (lpString1 : Win32.LPSTR;
                     lpString2 : Win32.LPCSTR)
                    return Win32.LPSTR
     renames lstrcatA;           --  winbase.h :3032

   function lstrcatW (lpString1 : Win32.LPWSTR;
                      lpString2 : Win32.LPCWSTR)
                     return Win32.LPWSTR;       --  winbase.h :3039

   function lstrlenA (lpString : Win32.LPCSTR) return Win32.INT;
   --  winbase.h :3052

   function lstrlen (lpString : Win32.LPCSTR) return Win32.INT
     renames lstrlenA;
   --  winbase.h :3052

   function lstrlenW (lpString : Win32.LPCWSTR) return Win32.INT;
   --  winbase.h :3058

   function OpenFile (lpFileName : Win32.LPCSTR;
                      lpReOpenBuff : LPOFSTRUCT;
                      uStyle : Win32.UINT)
                     return Win32.Windef.HFILE;
   --  winbase.h :3070

   function lopen (lpPathName : Win32.LPCSTR;
                   iReadWrite : Win32.INT)
                  return Win32.Windef.HFILE;
   --  winbase.h :3079

   function lcreat (lpPathName : Win32.LPCSTR;
                    iAttribute : Win32.INT)
                   return Win32.Windef.HFILE;  --  winbase.h :3087

   function lread (hFile : Win32.Windef.HFILE;
                   lpBuffer : Win32.LPVOID;
                   uBytes : Win32.UINT)
                  return Win32.UINT;             --  winbase.h :3095

   function lwrite (hFile : Win32.Windef.HFILE;
                    lpBuffer : Win32.LPCSTR;
                    uBytes : Win32.UINT)
                   return Win32.UINT;            --  winbase.h :3104

   function hread (hFile : Win32.Windef.HFILE;
                   lpBuffer : Win32.LPVOID;
                   lBytes : Win32.INT)
                  return Win32.INT;              --  winbase.h :3113

   function hwrite (hFile : Win32.Windef.HFILE;
                    lpBuffer : Win32.LPCSTR;
                    lBytes : Win32.INT)
                   return Win32.INT;             --  winbase.h :3122

   function lclose (hFile : Win32.Windef.HFILE) return Win32.Windef.HFILE;
   --  winbase.h :3131

   function llseek (hFile : Win32.Windef.HFILE;
                    lOffset : Win32.LONG;
                    iOrigin : Win32.INT)
                   return Win32.LONG;             --  winbase.h :3138

   function IsTextUnicode (lpBuffer : Win32.LPVOID;
                           cb : Win32.INT;
                           lpi : Win32.LPINT)
                          return Win32.BOOL;     --  winbase.h :3147

   function TlsAlloc return Win32.DWORD;                   --  winbase.h :3156

   function TlsGetValue (dwTlsIndex : Win32.DWORD) return Win32.LPVOID;
   --  winbase.h :3165

   function TlsSetValue (dwTlsIndex : Win32.DWORD;
                         lpTlsValue : Win32.LPVOID)
                        return Win32.BOOL;     --  winbase.h :3172

   function TlsFree (dwTlsIndex : Win32.DWORD) return Win32.BOOL;
   --  winbase.h :3180

   function SleepEx (dwMilliseconds : Win32.DWORD;
                     bAlertable : Win32.BOOL)
                    return Win32.DWORD;    --  winbase.h :3195

   function WaitForSingleObjectEx (hHandle : Win32.Winnt.HANDLE;
                                   dwMilliseconds : Win32.DWORD;
                                   bAlertable : Win32.BOOL)
                                  return Win32.DWORD;
   --  winbase.h :3203

   function WaitForMultipleObjectsEx (nCount : Win32.DWORD;
                                      lpHandles : PCHANDLE;
                                      bWaitAll : Win32.BOOL;
                                      dwMilliseconds : Win32.DWORD;
                                      bAlertable : Win32.BOOL)
                                     return Win32.DWORD;
   --  winbase.h :3212

   function ReadFileEx (hFile : Win32.Winnt.HANDLE;
                        lpBuffer : Win32.LPVOID;
                        nNumberOfBytesToRead : Win32.DWORD;
                        lpOverlapped : Win32.Winbase.LPOVERLAPPED;
                        lpCompletionRoutine : LPOVERLAPPED_COMPLETION_ROUTINE)
                       return Win32.BOOL;
   --  winbase.h :3223

   function WriteFileEx (hFile : Win32.Winnt.HANDLE;
                         lpBuffer : Win32.LPCVOID;
                         nNumberOfBytesToWrite : Win32.DWORD;
                         lpOverlapped : Win32.Winbase.LPOVERLAPPED;
                         lpCompletionRoutine : LPOVERLAPPED_COMPLETION_ROUTINE)
                        return Win32.BOOL;
   --  winbase.h :3234

   function BackupRead (hFile : Win32.Winnt.HANDLE;
                        lpBuffer : Win32.LPBYTE;
                        nNumberOfBytesToRead : Win32.DWORD;
                        lpNumberOfBytesRead : Win32.LPDWORD;
                        bAbort : Win32.BOOL;
                        bProcessSecurity : Win32.BOOL;
                        lpContext : access Win32.LPVOID)
                       return Win32.BOOL;
   --  winbase.h :3245

   function BackupSeek (hFile : Win32.Winnt.HANDLE;
                        dwLowBytesToSeek : Win32.DWORD;
                        dwHighBytesToSeek : Win32.DWORD;
                        lpdwLowByteSeeked : Win32.LPDWORD;
                        lpdwHighByteSeeked : Win32.LPDWORD;
                        lpContext : access Win32.LPVOID)
                       return Win32.BOOL;
   --  winbase.h :3258

   function BackupWrite (hFile : Win32.Winnt.HANDLE;
                         lpBuffer : Win32.LPBYTE;
                         nNumberOfBytesToWrite : Win32.DWORD;
                         lpNumberOfBytesWritten : Win32.LPDWORD;
                         bAbort : Win32.BOOL;
                         bProcessSecurity : Win32.BOOL;
                         lpContext : access Win32.LPVOID)
                        return Win32.BOOL;
   --  winbase.h :3270

   function CreateMutexA (lpMutexAttributes : LPSECURITY_ATTRIBUTES;
                          bInitialOwner : Win32.BOOL;
                          lpName : Win32.LPCSTR)
                         return Win32.Winnt.HANDLE;
   --  winbase.h :3413

   function CreateMutex (lpMutexAttributes : LPSECURITY_ATTRIBUTES;
                         bInitialOwner : Win32.BOOL;
                         lpName : Win32.LPCSTR)
                        return Win32.Winnt.HANDLE
     renames CreateMutexA;
   --  winbase.h :3413

   function CreateMutexW (lpMutexAttributes : LPSECURITY_ATTRIBUTES;
                          bInitialOwner : Win32.BOOL;
                          lpName : Win32.LPCWSTR)
                         return Win32.Winnt.HANDLE;
   --  winbase.h :3421

   function OpenMutexA (dwDesiredAccess : Win32.DWORD;
                        bInheritHandle : Win32.BOOL;
                        lpName : Win32.LPCSTR)
                       return Win32.Winnt.HANDLE;
   --  winbase.h :3435

   function OpenMutex (dwDesiredAccess : Win32.DWORD;
                       bInheritHandle : Win32.BOOL;
                       lpName : Win32.LPCSTR)
                      return Win32.Winnt.HANDLE
     renames OpenMutexA;
   --  winbase.h :3435

   function OpenMutexW (dwDesiredAccess : Win32.DWORD;
                        bInheritHandle : Win32.BOOL;
                        lpName : Win32.LPCWSTR)
                       return Win32.Winnt.HANDLE;
   --  winbase.h :3443

   function CreateEventA (lpEventAttributes : LPSECURITY_ATTRIBUTES;
                          bManualReset : Win32.BOOL;
                          bInitialState : Win32.BOOL;
                          lpName : Win32.LPCSTR)
                         return Win32.Winnt.HANDLE;
   --  winbase.h :3457

   function CreateEvent (lpEventAttributes : LPSECURITY_ATTRIBUTES;
                         bManualReset : Win32.BOOL;
                         bInitialState : Win32.BOOL;
                         lpName : Win32.LPCSTR)
                        return Win32.Winnt.HANDLE
     renames CreateEventA;
   --  winbase.h :3457

   function CreateEventW (lpEventAttributes : LPSECURITY_ATTRIBUTES;
                          bManualReset : Win32.BOOL;
                          bInitialState : Win32.BOOL;
                          lpName : Win32.LPCWSTR)
                         return Win32.Winnt.HANDLE;
   --  winbase.h :3466

   function OpenEventA (dwDesiredAccess : Win32.DWORD;
                        bInheritHandle : Win32.BOOL;
                        lpName : Win32.LPCSTR)
                       return Win32.Winnt.HANDLE;
   --  winbase.h :3481

   function OpenEvent (dwDesiredAccess : Win32.DWORD;
                       bInheritHandle : Win32.BOOL;
                       lpName : Win32.LPCSTR)
                      return Win32.Winnt.HANDLE
     renames OpenEventA;
   --  winbase.h :3481

   function OpenEventW (dwDesiredAccess : Win32.DWORD;
                        bInheritHandle : Win32.BOOL;
                        lpName : Win32.LPCWSTR)
                       return Win32.Winnt.HANDLE;
   --  winbase.h :3489

   function CreateSemaphoreA (lpSemaphoreAttributes : LPSECURITY_ATTRIBUTES;
                              lInitialCount : Win32.LONG;
                              lMaximumCount : Win32.LONG;
                              lpName : Win32.LPCSTR)
                             return Win32.Winnt.HANDLE;
   --  winbase.h :3503

   function CreateSemaphore (lpSemaphoreAttributes : LPSECURITY_ATTRIBUTES;
                             lInitialCount : Win32.LONG;
                             lMaximumCount : Win32.LONG;
                             lpName : Win32.LPCSTR)
                            return Win32.Winnt.HANDLE
     renames CreateSemaphoreA;
   --  winbase.h :3503

   function CreateSemaphoreW (lpSemaphoreAttributes : LPSECURITY_ATTRIBUTES;
                              lInitialCount : Win32.LONG;
                              lMaximumCount : Win32.LONG;
                              lpName : Win32.LPCWSTR)
                             return Win32.Winnt.HANDLE;
   --  winbase.h :3512

   function OpenSemaphoreA (dwDesiredAccess : Win32.DWORD;
                            bInheritHandle : Win32.BOOL;
                            lpName : Win32.LPCSTR)
                           return Win32.Winnt.HANDLE;
   --  winbase.h :3527

   function OpenSemaphore (dwDesiredAccess : Win32.DWORD;
                           bInheritHandle : Win32.BOOL;
                           lpName : Win32.LPCSTR)
                          return Win32.Winnt.HANDLE
     renames OpenSemaphoreA;
   --  winbase.h :3527

   function OpenSemaphoreW (dwDesiredAccess : Win32.DWORD;
                            bInheritHandle : Win32.BOOL;
                            lpName : Win32.LPCWSTR)
                           return Win32.Winnt.HANDLE;
   --  winbase.h :3535

   function CreateFileMappingA (hFile : Win32.Winnt.HANDLE;
                                lpFileMappingAttributes :
                                  LPSECURITY_ATTRIBUTES;
                                flProtect : Win32.DWORD;
                                dwMaximumSizeHigh : Win32.DWORD;
                                dwMaximumSizeLow : Win32.DWORD;
                                lpName : Win32.LPCSTR)
                               return Win32.Winnt.HANDLE;
   --  winbase.h :3549

   function CreateFileMapping (hFile : Win32.Winnt.HANDLE;
                               lpFileMappingAttributes : LPSECURITY_ATTRIBUTES;
                               flProtect : Win32.DWORD;
                               dwMaximumSizeHigh : Win32.DWORD;
                               dwMaximumSizeLow : Win32.DWORD;
                               lpName : Win32.LPCSTR)
                              return Win32.Winnt.HANDLE
     renames CreateFileMappingA;
   --  winbase.h :3549

   function CreateFileMappingW (hFile : Win32.Winnt.HANDLE;
                                lpFileMappingAttributes :
                                  LPSECURITY_ATTRIBUTES;
                                flProtect : Win32.DWORD;
                                dwMaximumSizeHigh : Win32.DWORD;
                                dwMaximumSizeLow : Win32.DWORD;
                                lpName : Win32.LPCWSTR)
                               return Win32.Winnt.HANDLE;
   --  winbase.h :3560

   function OpenFileMappingA (dwDesiredAccess : Win32.DWORD;
                              bInheritHandle : Win32.BOOL;
                              lpName : Win32.LPCSTR)
                             return Win32.Winnt.HANDLE;
   --  winbase.h :3577

   function OpenFileMapping (dwDesiredAccess : Win32.DWORD;
                             bInheritHandle : Win32.BOOL;
                             lpName : Win32.LPCSTR)
                            return Win32.Winnt.HANDLE
     renames OpenFileMappingA;
   --  winbase.h :3577

   function OpenFileMappingW (dwDesiredAccess : Win32.DWORD;
                              bInheritHandle : Win32.BOOL;
                              lpName : Win32.LPCWSTR)
                             return Win32.Winnt.HANDLE;
   --  winbase.h :3585

   function GetLogicalDriveStringsA (nBufferLength : Win32.DWORD;
                                     lpBuffer : Win32.LPSTR)
                                    return Win32.DWORD;
   --  winbase.h :3599

   function GetLogicalDriveStrings (nBufferLength : Win32.DWORD;
                                    lpBuffer : Win32.LPSTR)
                                   return Win32.DWORD
     renames GetLogicalDriveStringsA;               --  winbase.h :3599

   function GetLogicalDriveStringsW (nBufferLength : Win32.DWORD;
                                     lpBuffer : Win32.LPWSTR)
                                    return Win32.DWORD;
   --  winbase.h :3606

   function LoadLibraryA (lpLibFileName : Win32.LPCSTR)
                         return Win32.Windef.HINSTANCE;
   --  winbase.h :3619

   function LoadLibrary (lpLibFileName : Win32.LPCSTR)
                        return Win32.Windef.HINSTANCE
     renames LoadLibraryA;                          --  winbase.h :3619

   function LoadLibraryW (lpLibFileName : Win32.LPCWSTR)
                         return Win32.Windef.HINSTANCE;     --  winbase.h :3625

   function LoadLibraryExA (lpLibFileName : Win32.LPCSTR;
                            hFile : Win32.Winnt.HANDLE;
                            dwFlags : Win32.DWORD)
                           return Win32.Windef.HINSTANCE;
   --  winbase.h :3637

   function LoadLibraryEx (lpLibFileName : Win32.LPCSTR;
                           hFile : Win32.Winnt.HANDLE;
                           dwFlags : Win32.DWORD)
                          return Win32.Windef.HINSTANCE
     renames LoadLibraryExA;
   --  winbase.h :3637

   function LoadLibraryExW (lpLibFileName : Win32.LPCWSTR;
                            hFile : Win32.Winnt.HANDLE;
                            dwFlags : Win32.DWORD)
                           return Win32.Windef.HINSTANCE;
   --  winbase.h :3645

   function GetModuleFileNameA (hModule : Win32.Windef.HINSTANCE;
                                lpFilename : Win32.LPSTR;
                                nSize : Win32.DWORD)
                               return Win32.DWORD;
   --  winbase.h :3664

   function GetModuleFileName (hModule : Win32.Windef.HINSTANCE;
                               lpFilename : Win32.LPSTR;
                               nSize : Win32.DWORD)
                              return Win32.DWORD
     renames GetModuleFileNameA;
   --  winbase.h :3664

   function GetModuleFileNameW (hModule : Win32.Windef.HINSTANCE;
                                lpFilename : Win32.LPWSTR;
                                nSize : Win32.DWORD)
                               return Win32.DWORD;
   --  winbase.h :3672

   function GetModuleHandleA (lpModuleName : Win32.LPCSTR)
                             return Win32.Windef.HMODULE;   --  winbase.h :3686

   function GetModuleHandle (lpModuleName : Win32.LPCSTR)
                            return Win32.Windef.HMODULE
     renames GetModuleHandleA;                      --  winbase.h :3686

   function GetModuleHandleW (lpModuleName : Win32.LPCWSTR)
                             return Win32.Windef.HMODULE;   --  winbase.h :3692

   function CreateProcessA (lpApplicationName : Win32.LPCSTR;
                            lpCommandLine : Win32.LPSTR;
                            lpProcessAttributes : LPSECURITY_ATTRIBUTES;
                            lpThreadAttributes : LPSECURITY_ATTRIBUTES;
                            bInheritHandles : Win32.BOOL;
                            dwCreationFlags : Win32.DWORD;
                            lpEnvironment : Win32.LPVOID;
                            lpCurrentDirectory : Win32.LPCSTR;
                            lpStartupInfo : LPSTARTUPINFOA;
                            lpProcessInformation : LPPROCESS_INFORMATION)
                           return Win32.BOOL;
   --  winbase.h :3704

   function CreateProcess (lpApplicationName : Win32.LPCSTR;
                           lpCommandLine : Win32.LPSTR;
                           lpProcessAttributes : LPSECURITY_ATTRIBUTES;
                           lpThreadAttributes : LPSECURITY_ATTRIBUTES;
                           bInheritHandles : Win32.BOOL;
                           dwCreationFlags : Win32.DWORD;
                           lpEnvironment : Win32.LPVOID;
                           lpCurrentDirectory : Win32.LPCSTR;
                           lpStartupInfo : LPSTARTUPINFOA;
                           lpProcessInformation : LPPROCESS_INFORMATION)
                          return Win32.BOOL
     renames CreateProcessA;
   --  winbase.h :3704

   function CreateProcessW (lpApplicationName : Win32.LPCWSTR;
                            lpCommandLine : Win32.LPWSTR;
                            lpProcessAttributes : LPSECURITY_ATTRIBUTES;
                            lpThreadAttributes : LPSECURITY_ATTRIBUTES;
                            bInheritHandles : Win32.BOOL;
                            dwCreationFlags : Win32.DWORD;
                            lpEnvironment : Win32.LPVOID;
                            lpCurrentDirectory : Win32.LPCWSTR;
                            lpStartupInfo : LPSTARTUPINFOW;
                            lpProcessInformation : LPPROCESS_INFORMATION)
                           return Win32.BOOL;
   --  winbase.h :3719

   function SetProcessShutdownParameters (dwLevel : Win32.DWORD;
                                          dwFlags : Win32.DWORD)
                                         return Win32.BOOL;
   --  winbase.h :3740

   function GetProcessShutdownParameters (lpdwLevel : Win32.LPDWORD;
                                          lpdwFlags : Win32.LPDWORD)
                                         return Win32.BOOL;
   --  winbase.h :3748

   procedure FatalAppExitA (uAction : Win32.UINT;
                            lpMessageText : Win32.LPCSTR);  --  winbase.h :3756

   procedure FatalAppExit (uAction : Win32.UINT;
                           lpMessageText : Win32.LPCSTR)
     renames FatalAppExitA;
   --  winbase.h :3756

   procedure FatalAppExitW (uAction : Win32.UINT;
                            lpMessageText : Win32.LPCWSTR); --  winbase.h :3763

   procedure GetStartupInfoA (lpStartupInfo : LPSTARTUPINFOA);
   --  winbase.h :3776

   procedure GetStartupInfo (lpStartupInfo : LPSTARTUPINFOA)
     renames GetStartupInfoA;                      --  winbase.h :3776

   procedure GetStartupInfoW (lpStartupInfo : LPSTARTUPINFOW);
   --  winbase.h :3782

   function GetCommandLineA return Win32.LPSTR;            --  winbase.h :3794

   function GetCommandLine return Win32.LPSTR
     renames GetCommandLineA;
   --  winbase.h :3794

   function GetCommandLineW return Win32.LPWSTR;           --  winbase.h :3800

   function GetEnvironmentVariableA (lpName : Win32.LPCSTR;
                                     lpBuffer : Win32.LPSTR;
                                     nSize : Win32.DWORD)
                                    return Win32.DWORD;
   --  winbase.h :3812

   function GetEnvironmentVariable (lpName : Win32.LPCSTR;
                                    lpBuffer : Win32.LPSTR;
                                    nSize : Win32.DWORD)
                                   return Win32.DWORD
     renames GetEnvironmentVariableA;
   --  winbase.h :3812

   function GetEnvironmentVariableW (lpName : Win32.LPCWSTR;
                                     lpBuffer : Win32.LPWSTR;
                                     nSize : Win32.DWORD)
                                    return Win32.DWORD;
   --  winbase.h :3820

   function SetEnvironmentVariableA (lpName : Win32.LPCSTR;
                                     lpValue : Win32.LPCSTR)
                                    return Win32.BOOL;
   --  winbase.h :3834

   function SetEnvironmentVariable (lpName : Win32.LPCSTR;
                                    lpValue : Win32.LPCSTR)
                                   return Win32.BOOL
     renames SetEnvironmentVariableA;
   --  winbase.h :3834

   function SetEnvironmentVariableW (lpName : Win32.LPCWSTR;
                                     lpValue : Win32.LPCWSTR)
                                    return Win32.BOOL;
   --  winbase.h :3841

   function ExpandEnvironmentStringsA (lpSrc : Win32.LPCSTR;
                                       lpDst : Win32.LPSTR;
                                       nSize : Win32.DWORD)
                                      return Win32.DWORD;
   --  winbase.h :3854

   function ExpandEnvironmentStrings (lpSrc : Win32.LPCSTR;
                                      lpDst : Win32.LPSTR;
                                      nSize : Win32.DWORD)
                                     return Win32.DWORD
     renames ExpandEnvironmentStringsA;
   --  winbase.h :3854

   function ExpandEnvironmentStringsW (lpSrc : Win32.LPCWSTR;
                                       lpDst : Win32.LPWSTR;
                                       nSize : Win32.DWORD)
                                      return Win32.DWORD;
   --  winbase.h :3862

   procedure OutputDebugStringA (lpOutputString : Win32.LPCSTR);
   --  winbase.h :3876

   procedure OutputDebugString (lpOutputString : Win32.LPCSTR)
     renames OutputDebugStringA;                   --  winbase.h :3876

   procedure OutputDebugStringW (lpOutputString : Win32.LPCWSTR);
   --  winbase.h :3882

   function FindResourceA (hModule : Win32.Windef.HINSTANCE;
                           lpName : Win32.LPCSTR;
                           lpType : Win32.LPCSTR)
                          return Win32.Windef.HRSRC;
   --  winbase.h :3894

   function FindResource (hModule : Win32.Windef.HINSTANCE;
                          lpName : Win32.LPCSTR;
                          lpType : Win32.LPCSTR)
                         return Win32.Windef.HRSRC
     renames FindResourceA;
   --  winbase.h :3894

   function FindResourceW (hModule : Win32.Windef.HINSTANCE;
                           lpName : Win32.LPCWSTR;
                           lpType : Win32.LPCWSTR)
                          return Win32.Windef.HRSRC;
   --  winbase.h :3902

   function FindResourceExA (hModule : Win32.Windef.HINSTANCE;
                             lpType : Win32.LPCSTR;
                             lpName : Win32.LPCSTR;
                             wLanguage : Win32.WORD)
                            return Win32.Windef.HRSRC;
   --  winbase.h :3916

   function FindResourceEx (hModule : Win32.Windef.HINSTANCE;
                            lpType : Win32.LPCSTR;
                            lpName : Win32.LPCSTR;
                            wLanguage : Win32.WORD)
                           return Win32.Windef.HRSRC
     renames FindResourceExA;
   --  winbase.h :3916

   function FindResourceExW (hModule : Win32.Windef.HINSTANCE;
                             lpType : Win32.LPCWSTR;
                             lpName : Win32.LPCWSTR;
                             wLanguage : Win32.WORD)
                            return Win32.Windef.HRSRC;
   --  winbase.h :3925

   function EnumResourceTypesA (hModule : Win32.Windef.HINSTANCE;
                                lpEnumFunc : ENUMRESTYPEPROC;
                                lParam : Win32.LONG)
                               return Win32.BOOL;
   --  winbase.h :3953

   function EnumResourceTypes (hModule : Win32.Windef.HINSTANCE;
                               lpEnumFunc : ENUMRESTYPEPROC;
                               lParam : Win32.LONG)
                              return Win32.BOOL
     renames EnumResourceTypesA;
   --  winbase.h :3953

   function EnumResourceTypesW (hModule : Win32.Windef.HINSTANCE;
                                lpEnumFunc : ENUMRESTYPEPROC;
                                lParam : Win32.LONG)
                               return Win32.BOOL;
   --  winbase.h :3961

   function EnumResourceNamesA (hModule : Win32.Windef.HINSTANCE;
                                lpType : Win32.LPCSTR;
                                lpEnumFunc : ENUMRESNAMEPROC;
                                lParam : Win32.LONG)
                               return Win32.BOOL;
   --  winbase.h :3976

   function EnumResourceNames (hModule : Win32.Windef.HINSTANCE;
                               lpType : Win32.LPCSTR;
                               lpEnumFunc : ENUMRESNAMEPROC;
                               lParam : Win32.LONG)
                              return Win32.BOOL
     renames EnumResourceNamesA;
   --  winbase.h :3976

   function EnumResourceNamesW (hModule : Win32.Windef.HINSTANCE;
                                lpType : Win32.LPCWSTR;
                                lpEnumFunc : ENUMRESNAMEPROC;
                                lParam : Win32.LONG)
                               return Win32.BOOL;
   --  winbase.h :3985

   function EnumResourceLanguagesA (hModule : Win32.Windef.HINSTANCE;
                                    lpType : Win32.LPCSTR;
                                    lpName : Win32.LPCSTR;
                                    lpEnumFunc : ENUMRESLANGPROC;
                                    lParam : Win32.LONG)
                                   return Win32.BOOL;
   --  winbase.h :4000

   function EnumResourceLanguages (hModule : Win32.Windef.HINSTANCE;
                                   lpType : Win32.LPCSTR;
                                   lpName : Win32.LPCSTR;
                                   lpEnumFunc : ENUMRESLANGPROC;
                                   lParam : Win32.LONG)
                                  return Win32.BOOL
     renames EnumResourceLanguagesA;
   --  winbase.h :4000

   function EnumResourceLanguagesW (hModule : Win32.Windef.HINSTANCE;
                                    lpType : Win32.LPCWSTR;
                                    lpName : Win32.LPCWSTR;
                                    lpEnumFunc : ENUMRESLANGPROC;
                                    lParam : Win32.LONG)
                                   return Win32.BOOL;
   --  winbase.h :4010

   function BeginUpdateResourceA (pFileName : Win32.LPCSTR;
                                  bDeleteExistingResources : Win32.BOOL)
                                 return Win32.Winnt.HANDLE;
   --  winbase.h :4026

   function BeginUpdateResource (pFileName : Win32.LPCSTR;
                                 bDeleteExistingResources : Win32.BOOL)
                                return Win32.Winnt.HANDLE
     renames BeginUpdateResourceA;                  --  winbase.h :4026

   function BeginUpdateResourceW (pFileName : Win32.LPCWSTR;
                                  bDeleteExistingResources : Win32.BOOL)
                                 return Win32.Winnt.HANDLE; --  winbase.h :4033

   function UpdateResourceA (hUpdate : Win32.Winnt.HANDLE;
                             lpType : Win32.LPCSTR;
                             lpName : Win32.LPCSTR;
                             wLanguage : Win32.WORD;
                             lpData : Win32.LPVOID;
                             cbData : Win32.DWORD)
                            return Win32.BOOL;  --  winbase.h :4046

   function UpdateResource (hUpdate : Win32.Winnt.HANDLE;
                            lpType : Win32.LPCSTR;
                            lpName : Win32.LPCSTR;
                            wLanguage : Win32.WORD;
                            lpData : Win32.LPVOID;
                            cbData : Win32.DWORD)
                           return Win32.BOOL
     renames UpdateResourceA;
   --  winbase.h :4046

   function UpdateResourceW (hUpdate : Win32.Winnt.HANDLE;
                             lpType : Win32.LPCWSTR;
                             lpName : Win32.LPCWSTR;
                             wLanguage : Win32.WORD;
                             lpData : Win32.LPVOID;
                             cbData : Win32.DWORD)
                            return Win32.BOOL;  --  winbase.h :4057

   function EndUpdateResourceA (hUpdate : Win32.Winnt.HANDLE;
                                fDiscard : Win32.BOOL)
                               return Win32.BOOL; --  winbase.h :4074

   function EndUpdateResource (hUpdate : Win32.Winnt.HANDLE;
                               fDiscard : Win32.BOOL)
                              return Win32.BOOL
     renames EndUpdateResourceA;
   --  winbase.h :4074

   function EndUpdateResourceW (hUpdate : Win32.Winnt.HANDLE;
                                fDiscard : Win32.BOOL)
                               return Win32.BOOL; --  winbase.h :4081

   function GlobalAddAtomA (lpString : Win32.LPCSTR) return Win32.Windef.ATOM;
   --  winbase.h :4094

   function GlobalAddAtom (lpString : Win32.LPCSTR) return Win32.Windef.ATOM
     renames GlobalAddAtomA;                        --  winbase.h :4094

   function GlobalAddAtomW (lpString : Win32.LPCWSTR) return Win32.Windef.ATOM;
   --  winbase.h :4100

   function GlobalFindAtomA (lpString : Win32.LPCSTR) return Win32.Windef.ATOM;
   --  winbase.h :4112

   function GlobalFindAtom (lpString : Win32.LPCSTR) return Win32.Windef.ATOM
     renames GlobalFindAtomA;                       --  winbase.h :4112

   function GlobalFindAtomW (lpString : Win32.LPCWSTR)
                            return Win32.Windef.ATOM;
   --  winbase.h :4118

   function GlobalGetAtomNameA (nAtom : Win32.Windef.ATOM;
                                lpBuffer : Win32.LPSTR;
                                nSize : Win32.INT)
                               return Win32.UINT;
   --  winbase.h :4130

   function GlobalGetAtomName (nAtom : Win32.Windef.ATOM;
                               lpBuffer : Win32.LPSTR;
                               nSize : Win32.INT)
                              return Win32.UINT
     renames GlobalGetAtomNameA;
   --  winbase.h :4130

   function GlobalGetAtomNameW (nAtom : Win32.Windef.ATOM;
                                lpBuffer : Win32.LPWSTR;
                                nSize : Win32.INT)
                               return Win32.UINT;
   --  winbase.h :4138

   function AddAtomA (lpString : Win32.LPCSTR) return Win32.Windef.ATOM;
   --  winbase.h :4152

   function AddAtom (lpString : Win32.LPCSTR) return Win32.Windef.ATOM
     renames AddAtomA;
   --  winbase.h :4152

   function AddAtomW (lpString : Win32.LPCWSTR) return Win32.Windef.ATOM;
   --  winbase.h :4158

   function FindAtomA (lpString : Win32.LPCSTR) return Win32.Windef.ATOM;
   --  winbase.h :4170

   function FindAtom (lpString : Win32.LPCSTR) return Win32.Windef.ATOM
     renames FindAtomA;
   --  winbase.h :4170

   function FindAtomW (lpString : Win32.LPCWSTR) return Win32.Windef.ATOM;
   --  winbase.h :4176

   function GetAtomNameA (nAtom : Win32.Windef.ATOM;
                          lpBuffer : Win32.LPSTR;
                          nSize : Win32.INT)
                         return Win32.UINT;      --  winbase.h :4188

   function GetAtomName (nAtom : Win32.Windef.ATOM;
                         lpBuffer : Win32.LPSTR;
                         nSize : Win32.INT)
                        return Win32.UINT
     renames GetAtomNameA;    --  winbase.h :4188

   function GetAtomNameW (nAtom : Win32.Windef.ATOM;
                          lpBuffer : Win32.LPWSTR;
                          nSize : Win32.INT)
                         return Win32.UINT;      --  winbase.h :4196

   function GetProfileIntA (lpAppName : Win32.LPCSTR;
                            lpKeyName : Win32.LPCSTR;
                            nDefault : Win32.INT)
                           return Win32.UINT;   --  winbase.h :4210

   function GetProfileInt (lpAppName : Win32.LPCSTR;
                           lpKeyName : Win32.LPCSTR;
                           nDefault : Win32.INT)
                          return Win32.UINT
     renames GetProfileIntA;
   --  winbase.h :4210

   function GetProfileIntW (lpAppName : Win32.LPCWSTR;
                            lpKeyName : Win32.LPCWSTR;
                            nDefault : Win32.INT)
                           return Win32.UINT;   --  winbase.h :4218

   function GetProfileStringA (lpAppName : Win32.LPCSTR;
                               lpKeyName : Win32.LPCSTR;
                               lpDefault : Win32.LPCSTR;
                               lpReturnedString : Win32.LPSTR;
                               nSize : Win32.DWORD)
                              return Win32.DWORD;
   --  winbase.h :4232

   function GetProfileString (lpAppName : Win32.LPCSTR;
                              lpKeyName : Win32.LPCSTR;
                              lpDefault : Win32.LPCSTR;
                              lpReturnedString : Win32.LPSTR;
                              nSize : Win32.DWORD)
                             return Win32.DWORD
     renames GetProfileStringA;
   --  winbase.h :4232

   function GetProfileStringW (lpAppName : Win32.LPCWSTR;
                               lpKeyName : Win32.LPCWSTR;
                               lpDefault : Win32.LPCWSTR;
                               lpReturnedString : Win32.LPWSTR;
                               nSize : Win32.DWORD)
                              return Win32.DWORD;
   --  winbase.h :4242

   function WriteProfileStringA (lpAppName : Win32.LPCSTR;
                                 lpKeyName : Win32.LPCSTR;
                                 lpString : Win32.LPCSTR)
                                return Win32.BOOL;
   --  winbase.h :4258

   function WriteProfileString (lpAppName : Win32.LPCSTR;
                                lpKeyName : Win32.LPCSTR;
                                lpString : Win32.LPCSTR)
                               return Win32.BOOL
     renames WriteProfileStringA;
   --  winbase.h :4258

   function WriteProfileStringW (lpAppName : Win32.LPCWSTR;
                                 lpKeyName : Win32.LPCWSTR;
                                 lpString : Win32.LPCWSTR)
                                return Win32.BOOL;
   --  winbase.h :4266

   function GetProfileSectionA (lpAppName : Win32.LPCSTR;
                                lpReturnedString : Win32.LPSTR;
                                nSize : Win32.DWORD)
                               return Win32.DWORD;
   --  winbase.h :4280

   function GetProfileSection (lpAppName : Win32.LPCSTR;
                               lpReturnedString : Win32.LPSTR;
                               nSize : Win32.DWORD)
                              return Win32.DWORD
     renames GetProfileSectionA;
   --  winbase.h :4280

   function GetProfileSectionW (lpAppName : Win32.LPCWSTR;
                                lpReturnedString : Win32.LPWSTR;
                                nSize : Win32.DWORD)
                               return Win32.DWORD;
   --  winbase.h :4288

   function WriteProfileSectionA (lpAppName : Win32.LPCSTR;
                                  lpString : Win32.LPCSTR)
                                 return Win32.BOOL;
   --  winbase.h :4302

   function WriteProfileSection (lpAppName : Win32.LPCSTR;
                                 lpString : Win32.LPCSTR)
                                return Win32.BOOL
     renames WriteProfileSectionA;
   --  winbase.h :4302

   function WriteProfileSectionW (lpAppName : Win32.LPCWSTR;
                                  lpString : Win32.LPCWSTR)
                                 return Win32.BOOL;
   --  winbase.h :4309

   function GetPrivateProfileIntA (lpAppName : Win32.LPCSTR;
                                   lpKeyName : Win32.LPCSTR;
                                   nDefault : Win32.INT;
                                   lpFileName : Win32.LPCSTR)
                                  return Win32.UINT;
   --  winbase.h :4322

   function GetPrivateProfileInt (lpAppName : Win32.LPCSTR;
                                  lpKeyName : Win32.LPCSTR;
                                  nDefault : Win32.INT;
                                  lpFileName : Win32.LPCSTR)
                                 return Win32.UINT
     renames GetPrivateProfileIntA;
   --  winbase.h :4322

   function GetPrivateProfileIntW (lpAppName : Win32.LPCWSTR;
                                   lpKeyName : Win32.LPCWSTR;
                                   nDefault : Win32.INT;
                                   lpFileName : Win32.LPCWSTR)
                                  return Win32.UINT;
   --  winbase.h :4331

   function GetPrivateProfileStringA (lpAppName : Win32.LPCSTR;
                                      lpKeyName : Win32.LPCSTR;
                                      lpDefault : Win32.LPCSTR;
                                      lpReturnedString : Win32.LPSTR;
                                      nSize : Win32.DWORD;
                                      lpFileName : Win32.LPCSTR)
                                     return Win32.DWORD;
   --  winbase.h :4346

   function GetPrivateProfileString (lpAppName : Win32.LPCSTR;
                                     lpKeyName : Win32.LPCSTR;
                                     lpDefault : Win32.LPCSTR;
                                     lpReturnedString : Win32.LPSTR;
                                     nSize : Win32.DWORD;
                                     lpFileName : Win32.LPCSTR)
                                    return Win32.DWORD
     renames GetPrivateProfileStringA;              --  winbase.h :4346

   function GetPrivateProfileStringW (lpAppName : Win32.LPCWSTR;
                                      lpKeyName : Win32.LPCWSTR;
                                      lpDefault : Win32.LPCWSTR;
                                      lpReturnedString : Win32.LPWSTR;
                                      nSize : Win32.DWORD;
                                      lpFileName : Win32.LPCWSTR)
                                     return Win32.DWORD;
   --  winbase.h :4357

   function WritePrivateProfileStringA (lpAppName : Win32.LPCSTR;
                                        lpKeyName : Win32.LPCSTR;
                                        lpString : Win32.LPCSTR;
                                        lpFileName : Win32.LPCSTR)
                                       return Win32.BOOL;
   --  winbase.h :4374

   function WritePrivateProfileString (lpAppName : Win32.LPCSTR;
                                       lpKeyName : Win32.LPCSTR;
                                       lpString : Win32.LPCSTR;
                                       lpFileName : Win32.LPCSTR)
                                      return Win32.BOOL
     renames WritePrivateProfileStringA;            --  winbase.h :4374

   function WritePrivateProfileStringW (lpAppName : Win32.LPCWSTR;
                                        lpKeyName : Win32.LPCWSTR;
                                        lpString : Win32.LPCWSTR;
                                        lpFileName : Win32.LPCWSTR)
                                       return Win32.BOOL;
   --  winbase.h :4383

   function GetPrivateProfileSectionA (lpAppName : Win32.LPCSTR;
                                       lpReturnedString : Win32.LPSTR;
                                       nSize : Win32.DWORD;
                                       lpFileName : Win32.LPCSTR)
                                      return Win32.DWORD;
   --  winbase.h :4398

   function GetPrivateProfileSection (lpAppName : Win32.LPCSTR;
                                      lpReturnedString : Win32.LPSTR;
                                      nSize : Win32.DWORD;
                                      lpFileName : Win32.LPCSTR)
                                     return Win32.DWORD
     renames GetPrivateProfileSectionA;            --  winbase.h :4398

   function GetPrivateProfileSectionW (lpAppName : Win32.LPCWSTR;
                                       lpReturnedString : Win32.LPWSTR;
                                       nSize : Win32.DWORD;
                                       lpFileName : Win32.LPCWSTR)
                                      return Win32.DWORD;
   --  winbase.h :4407

   function WritePrivateProfileSectionA (lpAppName : Win32.LPCSTR;
                                         lpString : Win32.LPCSTR;
                                         lpFileName : Win32.LPCSTR)
                                        return Win32.BOOL;
   --  winbase.h :4422

   function WritePrivateProfileSection (lpAppName : Win32.LPCSTR;
                                        lpString : Win32.LPCSTR;
                                        lpFileName : Win32.LPCSTR)
                                       return Win32.BOOL
     renames WritePrivateProfileSectionA;           --  winbase.h :4422

   function WritePrivateProfileSectionW (lpAppName : Win32.LPCWSTR;
                                         lpString : Win32.LPCWSTR;
                                         lpFileName : Win32.LPCWSTR)
                                        return Win32.BOOL;
   --  winbase.h :4430

   function GetDriveTypeA (lpRootPathName : Win32.LPCSTR) return Win32.UINT;
   --  winbase.h :4444

   function GetDriveType (lpRootPathName : Win32.LPCSTR) return Win32.UINT
     renames GetDriveTypeA;                         --  winbase.h :4444

   function GetDriveTypeW (lpRootPathName : Win32.LPCWSTR) return Win32.UINT;
   --  winbase.h :4450

   function GetSystemDirectoryA (lpBuffer : Win32.LPSTR;
                                 uSize : Win32.UINT)
                                return Win32.UINT;
   --  winbase.h :4462

   function GetSystemDirectory (lpBuffer : Win32.LPSTR;
                                uSize : Win32.UINT)
                               return Win32.UINT
     renames GetSystemDirectoryA;
   --  winbase.h :4462

   function GetSystemDirectoryW (lpBuffer : Win32.LPWSTR;
                                 uSize : Win32.UINT)
                                return Win32.UINT;
   --  winbase.h :4469

   function GetTempPathA (nBufferLength : Win32.DWORD;
                          lpBuffer : Win32.LPSTR)
                         return Win32.DWORD; --  winbase.h :4482

   function GetTempPath (nBufferLength : Win32.DWORD;
                         lpBuffer : Win32.LPSTR)
                        return Win32.DWORD
     renames GetTempPathA;
   --  winbase.h :4482

   function GetTempPathW (nBufferLength : Win32.DWORD;
                          lpBuffer : Win32.LPWSTR)
                         return Win32.DWORD; --  winbase.h :4489

   function GetTempFileNameA (lpPathName : Win32.LPCSTR;
                              lpPrefixString : Win32.LPCSTR;
                              uUnique : Win32.UINT;
                              lpTempFileName : Win32.LPSTR)
                             return Win32.UINT;
   --  winbase.h :4502

   function GetTempFileName (lpPathName : Win32.LPCSTR;
                             lpPrefixString : Win32.LPCSTR;
                             uUnique : Win32.UINT;
                             lpTempFileName : Win32.LPSTR)
                            return Win32.UINT
     renames GetTempFileNameA;
   --  winbase.h :4502

   function GetTempFileNameW (lpPathName : Win32.LPCWSTR;
                              lpPrefixString : Win32.LPCWSTR;
                              uUnique : Win32.UINT;
                              lpTempFileName : Win32.LPWSTR)
                             return Win32.UINT;
   --  winbase.h :4511

   function GetWindowsDirectoryA (lpBuffer : Win32.LPSTR;
                                  uSize : Win32.UINT)
                                 return Win32.UINT;
   --  winbase.h :4526

   function GetWindowsDirectory (lpBuffer : Win32.LPSTR;
                                 uSize : Win32.UINT)
                                return Win32.UINT
     renames GetWindowsDirectoryA;
   --  winbase.h :4526

   function GetWindowsDirectoryW (lpBuffer : Win32.LPWSTR;
                                  uSize : Win32.UINT)
                                 return Win32.UINT;
   --  winbase.h :4533

   function SetCurrentDirectoryA (lpPathName : Win32.LPCSTR) return Win32.BOOL;
   --  winbase.h :4546

   function SetCurrentDirectory (lpPathName : Win32.LPCSTR) return Win32.BOOL
     renames SetCurrentDirectoryA;                  --  winbase.h :4546

   function SetCurrentDirectoryW (lpPathName : Win32.LPCWSTR)
                                 return Win32.BOOL;
   --  winbase.h :4552

   function GetCurrentDirectoryA (nBufferLength : Win32.DWORD;
                                  lpBuffer : Win32.LPSTR)
                                 return Win32.DWORD;
   --  winbase.h :4564

   function GetCurrentDirectory (nBufferLength : Win32.DWORD;
                                 lpBuffer : Win32.LPSTR)
                                return Win32.DWORD
     renames GetCurrentDirectoryA;
   --  winbase.h :4564

   function GetCurrentDirectoryW (nBufferLength : Win32.DWORD;
                                  lpBuffer : Win32.LPWSTR)
                                 return Win32.DWORD;
   --  winbase.h :4571

   function GetDiskFreeSpaceA (lpRootPathName : Win32.LPCSTR;
                               lpSectorsPerCluster : Win32.LPDWORD;
                               lpBytesPerSector : Win32.LPDWORD;
                               lpNumberOfFreeClusters : Win32.LPDWORD;
                               lpTotalNumberOfClusters : Win32.LPDWORD)
                              return Win32.BOOL;
   --  winbase.h :4584

   function GetDiskFreeSpace (lpRootPathName : Win32.LPCSTR;
                              lpSectorsPerCluster : Win32.LPDWORD;
                              lpBytesPerSector : Win32.LPDWORD;
                              lpNumberOfFreeClusters : Win32.LPDWORD;
                              lpTotalNumberOfClusters : Win32.LPDWORD)
                             return Win32.BOOL
     renames GetDiskFreeSpaceA;                     --  winbase.h :4584

   function GetDiskFreeSpaceW (lpRootPathName : Win32.LPCWSTR;
                               lpSectorsPerCluster : Win32.LPDWORD;
                               lpBytesPerSector : Win32.LPDWORD;
                               lpNumberOfFreeClusters : Win32.LPDWORD;
                               lpTotalNumberOfClusters : Win32.LPDWORD)
                              return Win32.BOOL;
   --  winbase.h :4594

   function CreateDirectoryA (lpPathName : Win32.LPCSTR;
                              lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                             return Win32.BOOL;
   --  winbase.h :4610

   function CreateDirectory (lpPathName : Win32.LPCSTR;
                             lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                            return Win32.BOOL
     renames CreateDirectoryA;
   --  winbase.h :4610

   function CreateDirectoryW (lpPathName : Win32.LPCWSTR;
                              lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                             return Win32.BOOL;
   --  winbase.h :4617

   function CreateDirectoryExA (lpTemplateDirectory : Win32.LPCSTR;
                                lpNewDirectory : Win32.LPCSTR;
                                lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                               return Win32.BOOL;
   --  winbase.h :4630

   function CreateDirectoryEx (lpTemplateDirectory : Win32.LPCSTR;
                               lpNewDirectory : Win32.LPCSTR;
                               lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                              return Win32.BOOL
     renames CreateDirectoryExA;
   --  winbase.h :4630

   function CreateDirectoryExW (lpTemplateDirectory : Win32.LPCWSTR;
                                lpNewDirectory : Win32.LPCWSTR;
                                lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                               return Win32.BOOL;
   --  winbase.h :4638

   function RemoveDirectoryA (lpPathName : Win32.LPCSTR) return Win32.BOOL;
   --  winbase.h :4652

   function RemoveDirectory (lpPathName : Win32.LPCSTR) return Win32.BOOL
     renames RemoveDirectoryA;                      --  winbase.h :4652

   function RemoveDirectoryW (lpPathName : Win32.LPCWSTR) return Win32.BOOL;
   --  winbase.h :4658

   function GetFullPathNameA (lpFileName : Win32.LPCSTR;
                              nBufferLength : Win32.DWORD;
                              lpBuffer : Win32.LPSTR;
                              lpFilePart : access Win32.LPSTR)
                             return Win32.DWORD;
   --  winbase.h :4670

   function GetFullPathName (lpFileName : Win32.LPCSTR;
                             nBufferLength : Win32.DWORD;
                             lpBuffer : Win32.LPSTR;
                             lpFilePart : access Win32.LPSTR)
                            return Win32.DWORD
     renames GetFullPathNameA;
   --  winbase.h :4670

   function GetFullPathNameW (lpFileName : Win32.LPCWSTR;
                              nBufferLength : Win32.DWORD;
                              lpBuffer : Win32.LPWSTR;
                              lpFilePart : access Win32.PWSTR)
                             return Win32.DWORD;
   --  winbase.h :4679

   function DefineDosDeviceA (dwFlags : Win32.DWORD;
                              lpDeviceName : Win32.LPCSTR;
                              lpTargetPath : Win32.LPCSTR)
                             return Win32.BOOL;
   --  winbase.h :4699

   function DefineDosDevice (dwFlags : Win32.DWORD;
                             lpDeviceName : Win32.LPCSTR;
                             lpTargetPath : Win32.LPCSTR)
                            return Win32.BOOL
     renames DefineDosDeviceA;
   --  winbase.h :4699

   function DefineDosDeviceW (dwFlags : Win32.DWORD;
                              lpDeviceName : Win32.LPCWSTR;
                              lpTargetPath : Win32.LPCWSTR)
                             return Win32.BOOL;
   --  winbase.h :4707

   function QueryDosDeviceA (lpDeviceName : Win32.LPCSTR;
                             lpTargetPath : Win32.LPSTR;
                             ucchMax : Win32.DWORD)
                            return Win32.DWORD;
   --  winbase.h :4721

   function QueryDosDevice (lpDeviceName : Win32.LPCSTR;
                            lpTargetPath : Win32.LPSTR;
                            ucchMax : Win32.DWORD)
                           return Win32.DWORD
     renames QueryDosDeviceA;
   --  winbase.h :4721

   function QueryDosDeviceW (lpDeviceName : Win32.LPCWSTR;
                             lpTargetPath : Win32.LPWSTR;
                             ucchMax : Win32.DWORD)
                            return Win32.DWORD;
   --  winbase.h :4729

   function CreateFileA (lpFileName : Win32.LPCSTR;
                         dwDesiredAccess : Win32.DWORD;
                         dwShareMode : Win32.DWORD;
                         lpSecurityAttributes : LPSECURITY_ATTRIBUTES;
                         dwCreationDisposition : Win32.DWORD;
                         dwFlagsAndAttributes : Win32.DWORD;
                         hTemplateFile : Win32.Winnt.HANDLE)
                        return Win32.Winnt.HANDLE;
   --  winbase.h :4745

   function CreateFile (lpFileName : Win32.LPCSTR;
                        dwDesiredAccess : Win32.DWORD;
                        dwShareMode : Win32.DWORD;
                        lpSecurityAttributes : LPSECURITY_ATTRIBUTES;
                        dwCreationDisposition : Win32.DWORD;
                        dwFlagsAndAttributes : Win32.DWORD;
                        hTemplateFile : Win32.Winnt.HANDLE)
                       return Win32.Winnt.HANDLE
     renames CreateFileA;
   --  winbase.h :4745

   function CreateFileW (lpFileName : Win32.LPCWSTR;
                         dwDesiredAccess : Win32.DWORD;
                         dwShareMode : Win32.DWORD;
                         lpSecurityAttributes : LPSECURITY_ATTRIBUTES;
                         dwCreationDisposition : Win32.DWORD;
                         dwFlagsAndAttributes : Win32.DWORD;
                         hTemplateFile : Win32.Winnt.HANDLE)
                        return Win32.Winnt.HANDLE;
   --  winbase.h :4757

   function SetFileAttributesA (lpFileName : Win32.LPCSTR;
                                dwFileAttributes : Win32.DWORD)
                               return Win32.BOOL;
   --  winbase.h :4775

   function SetFileAttributes (lpFileName : Win32.LPCSTR;
                               dwFileAttributes : Win32.DWORD)
                              return Win32.BOOL
     renames SetFileAttributesA;
   --  winbase.h :4775

   function SetFileAttributesW (lpFileName : Win32.LPCWSTR;
                                dwFileAttributes : Win32.DWORD)
                               return Win32.BOOL;
   --  winbase.h :4782

   function GetFileAttributesA (lpFileName : Win32.LPCSTR) return Win32.DWORD;
   --  winbase.h :4795

   function GetFileAttributes (lpFileName : Win32.LPCSTR) return Win32.DWORD
     renames GetFileAttributesA;                    --  winbase.h :4795

   function GetFileAttributesW (lpFileName : Win32.LPCWSTR) return Win32.DWORD;
   --  winbase.h :4801
   function To_LPVOID is
      new Ada.Unchecked_Conversion (LPWIN32_FILE_ATTRIBUTE_DATA, LPVOID);

   function GetFileAttributesExA (lpFileName : Win32.LPCSTR;
                                  fInfoLevelId : GET_FILEEX_INFO_LEVELS;
                                  lpFileInformation : LPVOID)
     return Win32.BOOL;

   function GetFileAttributesExW (lpFileName : Win32.LPCWSTR;
                                  fInfoLevelId : GET_FILEEX_INFO_LEVELS;
                                  lpFileInformation : LPVOID)
                                 return Win32.BOOL;

   function GetFileAttributesEx  (lpFileName : Win32.LPCSTR;
                                  fInfoLevelId : GET_FILEEX_INFO_LEVELS;
                                  lpFileInformation : LPVOID)
                                 return Win32.BOOL
     renames GetFileAttributesExA;

   function GetCompressedFileSizeA (lpFileName : Win32.LPCSTR;
                                    lpFileSizeHigh : Win32.LPDWORD)
                                   return Win32.DWORD;
   --  winbase.h :4813

   function GetCompressedFileSize (lpFileName : Win32.LPCSTR;
                                   lpFileSizeHigh : Win32.LPDWORD)
                                  return Win32.DWORD
     renames GetCompressedFileSizeA;                --  winbase.h :4813

   function GetCompressedFileSizeW (lpFileName : Win32.LPCWSTR;
                                    lpFileSizeHigh : Win32.LPDWORD)
                                   return Win32.DWORD;
   --  winbase.h :4820

   function DeleteFileA (lpFileName : Win32.LPCSTR) return Win32.BOOL;
   --  winbase.h :4833

   function DeleteFile (lpFileName : Win32.LPCSTR) return Win32.BOOL
     renames DeleteFileA;
   --  winbase.h :4833

   function DeleteFileW (lpFileName : Win32.LPCWSTR) return Win32.BOOL;
   --  winbase.h :4839

   function FindFirstFileA (lpFileName : Win32.LPCSTR;
                            lpFindFileData : LPWIN32_FIND_DATAA)
                           return Win32.Winnt.HANDLE;
   --  winbase.h :4851

   function FindFirstFile (lpFileName : Win32.LPCSTR;
                           lpFindFileData : LPWIN32_FIND_DATAA)
                          return Win32.Winnt.HANDLE
     renames FindFirstFileA;
   --  winbase.h :4851

   function FindFirstFileW (lpFileName : Win32.LPCWSTR;
                            lpFindFileData : LPWIN32_FIND_DATAW)
                           return Win32.Winnt.HANDLE;
   --  winbase.h :4858

   function FindNextFileA (hFindFile : Win32.Winnt.HANDLE;
                           lpFindFileData : LPWIN32_FIND_DATAA)
                          return Win32.BOOL;
   --  winbase.h :4871

   function FindNextFile (hFindFile : Win32.Winnt.HANDLE;
                          lpFindFileData : LPWIN32_FIND_DATAA)
                         return Win32.BOOL
     renames FindNextFileA;
   --  winbase.h :4871

   function FindNextFileW (hFindFile : Win32.Winnt.HANDLE;
                           lpFindFileData : LPWIN32_FIND_DATAW)
                          return Win32.BOOL;
   --  winbase.h :4878

   function SearchPathA (lpPath : Win32.LPCSTR;
                         lpFileName : Win32.LPCSTR;
                         lpExtension : Win32.LPCSTR;
                         nBufferLength : Win32.DWORD;
                         lpBuffer : Win32.LPSTR;
                         lpFilePart : access Win32.LPSTR)
                        return Win32.DWORD; --  winbase.h :4891

   function SearchPath (lpPath : Win32.LPCSTR;
                        lpFileName : Win32.LPCSTR;
                        lpExtension : Win32.LPCSTR;
                        nBufferLength : Win32.DWORD;
                        lpBuffer : Win32.LPSTR;
                        lpFilePart : access Win32.LPSTR)
                       return Win32.DWORD
     renames SearchPathA;
   --  winbase.h :4891

   function SearchPathW (lpPath : Win32.LPCWSTR;
                         lpFileName : Win32.LPCWSTR;
                         lpExtension : Win32.LPCWSTR;
                         nBufferLength : Win32.DWORD;
                         lpBuffer : Win32.LPWSTR;
                         lpFilePart : access Win32.PWSTR)
                        return Win32.DWORD; --  winbase.h :4902

   function CopyFileA (lpExistingFileName : Win32.LPCSTR;
                       lpNewFileName : Win32.LPCSTR;
                       bFailIfExists : Win32.BOOL)
                      return Win32.BOOL;
   --  winbase.h :4919

   function CopyFile (lpExistingFileName : Win32.LPCSTR;
                      lpNewFileName : Win32.LPCSTR;
                      bFailIfExists : Win32.BOOL)
                     return Win32.BOOL
     renames CopyFileA; --  winbase.h :4919

   function CopyFileW (lpExistingFileName : Win32.LPCWSTR;
                       lpNewFileName : Win32.LPCWSTR;
                       bFailIfExists : Win32.BOOL)
                      return Win32.BOOL;
   --  winbase.h :4927

   function MoveFileA (lpExistingFileName : Win32.LPCSTR;
                       lpNewFileName : Win32.LPCSTR)
                      return Win32.BOOL;
   --  winbase.h :4941

   function MoveFile (lpExistingFileName : Win32.LPCSTR;
                      lpNewFileName : Win32.LPCSTR)
                     return Win32.BOOL
     renames MoveFileA; --  winbase.h :4941

   function MoveFileW (lpExistingFileName : Win32.LPCWSTR;
                       lpNewFileName : Win32.LPCWSTR)
                      return Win32.BOOL;
   --  winbase.h :4948

   function MoveFileExA (lpExistingFileName : Win32.LPCSTR;
                         lpNewFileName : Win32.LPCSTR;
                         dwFlags : Win32.DWORD)
                        return Win32.BOOL;
   --  winbase.h :4961

   function MoveFileEx (lpExistingFileName : Win32.LPCSTR;
                        lpNewFileName : Win32.LPCSTR;
                        dwFlags : Win32.DWORD)
                       return Win32.BOOL
     renames MoveFileExA;
   --  winbase.h :4961

   function MoveFileExW (lpExistingFileName : Win32.LPCWSTR;
                         lpNewFileName : Win32.LPCWSTR;
                         dwFlags : Win32.DWORD)
                        return Win32.BOOL;
   --  winbase.h :4969

   function CreateNamedPipeA (lpName : Win32.LPCSTR;
                              dwOpenMode : Win32.DWORD;
                              dwPipeMode : Win32.DWORD;
                              nMaxInstances : Win32.DWORD;
                              nOutBufferSize : Win32.DWORD;
                              nInBufferSize : Win32.DWORD;
                              nDefaultTimeOut : Win32.DWORD;
                              lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                             return Win32.Winnt.HANDLE;
   --  winbase.h :4987

   function CreateNamedPipe (lpName : Win32.LPCSTR;
                             dwOpenMode : Win32.DWORD;
                             dwPipeMode : Win32.DWORD;
                             nMaxInstances : Win32.DWORD;
                             nOutBufferSize : Win32.DWORD;
                             nInBufferSize : Win32.DWORD;
                             nDefaultTimeOut : Win32.DWORD;
                             lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                            return Win32.Winnt.HANDLE
     renames CreateNamedPipeA;
   --  winbase.h :4987

   function CreateNamedPipeW (lpName : Win32.LPCWSTR;
                              dwOpenMode : Win32.DWORD;
                              dwPipeMode : Win32.DWORD;
                              nMaxInstances : Win32.DWORD;
                              nOutBufferSize : Win32.DWORD;
                              nInBufferSize : Win32.DWORD;
                              nDefaultTimeOut : Win32.DWORD;
                              lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
                             return Win32.Winnt.HANDLE;
   --  winbase.h :5000

   function GetNamedPipeHandleStateA (hNamedPipe : Win32.Winnt.HANDLE;
                                      lpState : Win32.LPDWORD;
                                      lpCurInstances : Win32.LPDWORD;
                                      lpMaxCollectionCount : Win32.LPDWORD;
                                      lpCollectDataTimeout : Win32.LPDWORD;
                                      lpUserName : Win32.LPSTR;
                                      nMaxUserNameSize : Win32.DWORD)
                                     return Win32.BOOL;
   --  winbase.h :5019

   function GetNamedPipeHandleState (hNamedPipe : Win32.Winnt.HANDLE;
                                     lpState : Win32.LPDWORD;
                                     lpCurInstances : Win32.LPDWORD;
                                     lpMaxCollectionCount : Win32.LPDWORD;
                                     lpCollectDataTimeout : Win32.LPDWORD;
                                     lpUserName : Win32.LPSTR;
                                     nMaxUserNameSize : Win32.DWORD)
                                    return Win32.BOOL
     renames GetNamedPipeHandleStateA;             --  winbase.h :5019

   function GetNamedPipeHandleStateW (hNamedPipe : Win32.Winnt.HANDLE;
                                      lpState : Win32.LPDWORD;
                                      lpCurInstances : Win32.LPDWORD;
                                      lpMaxCollectionCount : Win32.LPDWORD;
                                      lpCollectDataTimeout : Win32.LPDWORD;
                                      lpUserName : Win32.LPWSTR;
                                      nMaxUserNameSize : Win32.DWORD)
                                     return Win32.BOOL;
   --  winbase.h :5031

   function CallNamedPipeA (lpNamedPipeName : Win32.LPCSTR;
                            lpInBuffer : Win32.LPVOID;
                            nInBufferSize : Win32.DWORD;
                            lpOutBuffer : Win32.LPVOID;
                            nOutBufferSize : Win32.DWORD;
                            lpBytesRead : Win32.LPDWORD;
                            nTimeOut : Win32.DWORD)
                           return Win32.BOOL;
   --  winbase.h :5049

   function CallNamedPipe (lpNamedPipeName : Win32.LPCSTR;
                           lpInBuffer : Win32.LPVOID;
                           nInBufferSize : Win32.DWORD;
                           lpOutBuffer : Win32.LPVOID;
                           nOutBufferSize : Win32.DWORD;
                           lpBytesRead : Win32.LPDWORD;
                           nTimeOut : Win32.DWORD)
                          return Win32.BOOL
     renames CallNamedPipeA;
   --  winbase.h :5049

   function CallNamedPipeW (lpNamedPipeName : Win32.LPCWSTR;
                            lpInBuffer : Win32.LPVOID;
                            nInBufferSize : Win32.DWORD;
                            lpOutBuffer : Win32.LPVOID;
                            nOutBufferSize : Win32.DWORD;
                            lpBytesRead : Win32.LPDWORD;
                            nTimeOut : Win32.DWORD)
                           return Win32.BOOL;
   --  winbase.h :5061

   function WaitNamedPipeA (lpNamedPipeName : Win32.LPCSTR;
                            nTimeOut : Win32.DWORD)
                           return Win32.BOOL;
   --  winbase.h :5079

   function WaitNamedPipe (lpNamedPipeName : Win32.LPCSTR;
                           nTimeOut : Win32.DWORD)
                          return Win32.BOOL
     renames WaitNamedPipeA;
   --  winbase.h :5079

   function WaitNamedPipeW (lpNamedPipeName : Win32.LPCWSTR;
                            nTimeOut : Win32.DWORD)
                           return Win32.BOOL;
   --  winbase.h :5086

   function SetVolumeLabelA (lpRootPathName : Win32.LPCSTR;
                             lpVolumeName : Win32.LPCSTR)
                            return Win32.BOOL;
   --  winbase.h :5099

   function SetVolumeLabel (lpRootPathName : Win32.LPCSTR;
                            lpVolumeName : Win32.LPCSTR)
                           return Win32.BOOL
     renames SetVolumeLabelA;
   --  winbase.h :5099

   function SetVolumeLabelW (lpRootPathName : Win32.LPCWSTR;
                             lpVolumeName : Win32.LPCWSTR)
                            return Win32.BOOL;
   --  winbase.h :5106

   procedure SetFileApisToOEM;                             --  winbase.h :5119

   procedure SetFileApisToANSI;                            --  winbase.h :5124

   function AreFileApisANSI return Win32.BOOL;             --  winbase.h :5129

   function GetVolumeInformationA (lpRootPathName : Win32.LPCSTR;
                                   lpVolumeNameBuffer : Win32.LPSTR;
                                   nVolumeNameSize : Win32.DWORD;
                                   lpVolumeSerialNumber : Win32.LPDWORD;
                                   lpMaximumComponentLength : Win32.LPDWORD;
                                   lpFileSystemFlags : Win32.LPDWORD;
                                   lpFileSystemNameBuffer : Win32.LPSTR;
                                   nFileSystemNameSize : Win32.DWORD)
                                  return Win32.BOOL;
   --  winbase.h :5134

   function GetVolumeInformation (lpRootPathName : Win32.LPCSTR;
                                  lpVolumeNameBuffer : Win32.LPSTR;
                                  nVolumeNameSize : Win32.DWORD;
                                  lpVolumeSerialNumber : Win32.LPDWORD;
                                  lpMaximumComponentLength : Win32.LPDWORD;
                                  lpFileSystemFlags : Win32.LPDWORD;
                                  lpFileSystemNameBuffer : Win32.LPSTR;
                                  nFileSystemNameSize : Win32.DWORD)
                                 return Win32.BOOL
     renames GetVolumeInformationA;                 --  winbase.h :5134

   function GetVolumeInformationW (lpRootPathName : Win32.LPCWSTR;
                                   lpVolumeNameBuffer : Win32.LPWSTR;
                                   nVolumeNameSize : Win32.DWORD;
                                   lpVolumeSerialNumber : Win32.LPDWORD;
                                   lpMaximumComponentLength : Win32.LPDWORD;
                                   lpFileSystemFlags : Win32.LPDWORD;
                                   lpFileSystemNameBuffer : Win32.LPWSTR;
                                   nFileSystemNameSize : Win32.DWORD)
                                  return Win32.BOOL;
   --  winbase.h :5147

   function ClearEventLogA (hEventLog : Win32.Winnt.HANDLE;
                            lpBackupFileName : Win32.LPCSTR)
                           return Win32.BOOL;
   --  winbase.h :5170

   function ClearEventLog (hEventLog : Win32.Winnt.HANDLE;
                           lpBackupFileName : Win32.LPCSTR)
                          return Win32.BOOL
     renames ClearEventLogA;
   --  winbase.h :5170

   function ClearEventLogW (hEventLog : Win32.Winnt.HANDLE;
                            lpBackupFileName : Win32.LPCWSTR)
                           return Win32.BOOL;
   --  winbase.h :5177

   function BackupEventLogA (hEventLog : Win32.Winnt.HANDLE;
                             lpBackupFileName : Win32.LPCSTR)
                            return Win32.BOOL;
   --  winbase.h :5190

   function BackupEventLog (hEventLog : Win32.Winnt.HANDLE;
                            lpBackupFileName : Win32.LPCSTR)
                           return Win32.BOOL
     renames BackupEventLogA;
   --  winbase.h :5190

   function BackupEventLogW (hEventLog : Win32.Winnt.HANDLE;
                             lpBackupFileName : Win32.LPCWSTR)
                            return Win32.BOOL;
   --  winbase.h :5197

   function CloseEventLog (hEventLog : Win32.Winnt.HANDLE) return Win32.BOOL;
   --  winbase.h :5210

   function DeregisterEventSource (hEventLog : Win32.Winnt.HANDLE)
                                  return Win32.BOOL;        --  winbase.h :5217

   function NotifyChangeEventLog (hEventLog : Win32.Winnt.HANDLE;
                                  hEvent : Win32.Winnt.HANDLE)
                                 return Win32.BOOL;
   --  winbase.h :5224

   function GetNumberOfEventLogRecords (hEventLog : Win32.Winnt.HANDLE;
                                        NumberOfRecords : access Win32.DWORD)
                                       return Win32.BOOL;
   --  winbase.h :5232

   function GetOldestEventLogRecord (hEventLog : Win32.Winnt.HANDLE;
                                     OldestRecord : access Win32.DWORD)
                                    return Win32.BOOL;
   --  winbase.h :5240

   function OpenEventLogA (lpUNCServerName : Win32.LPCSTR;
                           lpSourceName : Win32.LPCSTR)
                          return Win32.Winnt.HANDLE;
   --  winbase.h :5248

   function OpenEventLog (lpUNCServerName : Win32.LPCSTR;
                          lpSourceName : Win32.LPCSTR)
                         return Win32.Winnt.HANDLE
     renames OpenEventLogA;
   --  winbase.h :5248

   function OpenEventLogW (lpUNCServerName : Win32.LPCWSTR;
                           lpSourceName : Win32.LPCWSTR)
                          return Win32.Winnt.HANDLE;
   --  winbase.h :5255

   function RegisterEventSourceA (lpUNCServerName : Win32.LPCSTR;
                                  lpSourceName : Win32.LPCSTR)
                                 return Win32.Winnt.HANDLE;
   --  winbase.h :5268

   function RegisterEventSource (lpUNCServerName : Win32.LPCSTR;
                                 lpSourceName : Win32.LPCSTR)
                                return Win32.Winnt.HANDLE
     renames RegisterEventSourceA;
   --  winbase.h :5268

   function RegisterEventSourceW (lpUNCServerName : Win32.LPCWSTR;
                                  lpSourceName : Win32.LPCWSTR)
                                 return Win32.Winnt.HANDLE;
   --  winbase.h :5275

   function OpenBackupEventLogA (lpUNCServerName : Win32.LPCSTR;
                                 lpFileName : Win32.LPCSTR)
                                return Win32.Winnt.HANDLE;
   --  winbase.h :5288

   function OpenBackupEventLog (lpUNCServerName : Win32.LPCSTR;
                                lpFileName : Win32.LPCSTR)
                               return Win32.Winnt.HANDLE
     renames OpenBackupEventLogA;
   --  winbase.h :5288

   function OpenBackupEventLogW (lpUNCServerName : Win32.LPCWSTR;
                                 lpFileName : Win32.LPCWSTR)
                                return Win32.Winnt.HANDLE;
   --  winbase.h :5295

   function ReadEventLogA (hEventLog : Win32.Winnt.HANDLE;
                           dwReadFlags : Win32.DWORD;
                           dwRecordOffset : Win32.DWORD;
                           lpBuffer : Win32.LPVOID;
                           nNumberOfBytesToRead : Win32.DWORD;
                           pnBytesRead : access Win32.DWORD;
                           pnMinNumberOfBytesNeeded : access Win32.DWORD)
                          return Win32.BOOL;
   --  winbase.h :5308

   function ReadEventLog (hEventLog : Win32.Winnt.HANDLE;
                          dwReadFlags : Win32.DWORD;
                          dwRecordOffset : Win32.DWORD;
                          lpBuffer : Win32.LPVOID;
                          nNumberOfBytesToRead : Win32.DWORD;
                          pnBytesRead : access Win32.DWORD;
                          pnMinNumberOfBytesNeeded : access Win32.DWORD)
                         return Win32.BOOL
     renames ReadEventLogA;
   --  winbase.h :5308

   function ReadEventLogW (hEventLog : Win32.Winnt.HANDLE;
                           dwReadFlags : Win32.DWORD;
                           dwRecordOffset : Win32.DWORD;
                           lpBuffer : Win32.LPVOID;
                           nNumberOfBytesToRead : Win32.DWORD;
                           pnBytesRead : access Win32.DWORD;
                           pnMinNumberOfBytesNeeded : access Win32.DWORD)
                          return Win32.BOOL;
   --  winbase.h :5320

   function ReportEventA (hEventLog : Win32.Winnt.HANDLE;
                          wType : Win32.WORD;
                          wCategory : Win32.WORD;
                          dwEventID : Win32.DWORD;
                          lpUserSid : Win32.Winnt.PSID;
                          wNumStrings : Win32.WORD;
                          dwDataSize : Win32.DWORD;
                          lpStrings : access Win32.LPCSTR;
                          lpRawData : Win32.LPVOID)
                         return Win32.BOOL;   --  winbase.h :5338

   function ReportEvent (hEventLog : Win32.Winnt.HANDLE;
                         wType : Win32.WORD;
                         wCategory : Win32.WORD;
                         dwEventID : Win32.DWORD;
                         lpUserSid : Win32.Winnt.PSID;
                         wNumStrings : Win32.WORD;
                         dwDataSize : Win32.DWORD;
                         lpStrings : access Win32.LPCSTR;
                         lpRawData : Win32.LPVOID)
                        return Win32.BOOL
     renames ReportEventA;
   --  winbase.h :5338

   function ReportEventW (hEventLog : Win32.Winnt.HANDLE;
                          wType : Win32.WORD;
                          wCategory : Win32.WORD;
                          dwEventID : Win32.DWORD;
                          lpUserSid : Win32.Winnt.PSID;
                          wNumStrings : Win32.WORD;
                          dwDataSize : Win32.DWORD;
                          lpStrings : access Win32.LPCWSTR;
                          lpRawData : Win32.LPVOID)
                         return Win32.BOOL;   --  winbase.h :5352

   function DuplicateToken
     (ExistingTokenHandle : Win32.Winnt.HANDLE;
              ImpersonationLevel : Win32.Winnt.SECURITY_IMPERSONATION_LEVEL;
              DuplicateTokenHandle : Win32.Winnt.PHANDLE)
     return Win32.BOOL;            --  winbase.h :5378

   function GetKernelObjectSecurity
     (Handle : Win32.Winnt.HANDLE;
              RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              nLength : Win32.DWORD;
              lpnLengthNeeded : Win32.LPDWORD)
     return Win32.BOOL;            --  winbase.h :5387

   function ImpersonateNamedPipeClient (hNamedPipe : Win32.Winnt.HANDLE)
                                       return Win32.BOOL;   --  winbase.h :5398

   function ImpersonateSelf
     (ImpersonationLevel : Win32.Winnt.SECURITY_IMPERSONATION_LEVEL)
     return Win32.BOOL;              --  winbase.h :5405

   function RevertToSelf return Win32.BOOL;                --  winbase.h :5413

   function SetThreadToken (Thread : Win32.Winnt.PHANDLE;
                            Token : Win32.Winnt.HANDLE)
                           return Win32.BOOL;      --  winbase.h :5420

   function AccessCheck (pSecurityDescriptor :
                           Win32.Winnt.PSECURITY_DESCRIPTOR;
                         ClientToken : Win32.Winnt.HANDLE;
                         DesiredAccess : Win32.DWORD;
                         GenericMapping : Win32.Winnt.PGENERIC_MAPPING;
                         PrivilegeSet : Win32.Winnt.PPRIVILEGE_SET;
                         PrivilegeSetLength : Win32.LPDWORD;
                         GrantedAccess : Win32.LPDWORD;
                         AccessStatus : Win32.LPBOOL)
                        return Win32.BOOL;
   --  winbase.h :5428

   function OpenProcessToken (ProcessHandle : Win32.Winnt.HANDLE;
                              DesiredAccess : Win32.DWORD;
                              TokenHandle : Win32.Winnt.PHANDLE)
                             return Win32.BOOL;
   --  winbase.h :5443

   function OpenThreadToken (ThreadHandle : Win32.Winnt.HANDLE;
                             DesiredAccess : Win32.DWORD;
                             OpenAsSelf : Win32.BOOL;
                             TokenHandle : Win32.Winnt.PHANDLE)
                            return Win32.BOOL;
   --  winbase.h :5453

   function GetTokenInformation
     (TokenHandle : Win32.Winnt.HANDLE;
              TokenInformationClass : Win32.Winnt.TOKEN_INFORMATION_CLASS;
              TokenInformation : Win32.LPVOID;
              TokenInformationLength : Win32.DWORD;
              ReturnLength : access Win32.DWORD)
     return Win32.BOOL;
   --  winbase.h :5464

   function SetTokenInformation
     (TokenHandle : Win32.Winnt.HANDLE;
              TokenInformationClass : Win32.Winnt.TOKEN_INFORMATION_CLASS;
              TokenInformation : Win32.LPVOID;
              TokenInformationLength : Win32.DWORD)
     return Win32.BOOL;
   --  winbase.h :5476

   function AdjustTokenPrivileges
     (TokenHandle : Win32.Winnt.HANDLE;
              DisableAllPrivileges : Win32.BOOL;
              NewState : Win32.Winnt.PTOKEN_PRIVILEGES;
              BufferLength : Win32.DWORD;
              PreviousState : Win32.Winnt.PTOKEN_PRIVILEGES;
              ReturnLength : access Win32.DWORD)
     return Win32.BOOL;
   --  winbase.h :5487

   function AdjustTokenGroups (TokenHandle : Win32.Winnt.HANDLE;
                               ResetToDefault : Win32.BOOL;
                               NewState : Win32.Winnt.PTOKEN_GROUPS;
                               BufferLength : Win32.DWORD;
                               PreviousState : Win32.Winnt.PTOKEN_GROUPS;
                               ReturnLength : access Win32.DWORD)
                              return Win32.BOOL;
   --  winbase.h :5500

   function PrivilegeCheck (ClientToken : Win32.Winnt.HANDLE;
                            RequiredPrivileges : Win32.Winnt.PPRIVILEGE_SET;
                            pfResult : Win32.LPBOOL)
                           return Win32.BOOL;
   --  winbase.h :5513

   function AccessCheckAndAuditAlarmA
     (SubsystemName : Win32.LPCSTR;
              HandleId : Win32.LPVOID;
              ObjectTypeName : Win32.LPSTR;
              ObjectName : Win32.LPSTR;
              SecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              DesiredAccess : Win32.DWORD;
              GenericMapping : Win32.Winnt.PGENERIC_MAPPING;
              ObjectCreation : Win32.BOOL;
              GrantedAccess : Win32.LPDWORD;
              AccessStatus : Win32.LPBOOL;
              pfGenerateOnClose : Win32.LPBOOL)
     return Win32.BOOL;
   --  winbase.h :5523

   function AccessCheckAndAuditAlarm
     (SubsystemName : Win32.LPCSTR;
              HandleId : Win32.LPVOID;
              ObjectTypeName : Win32.LPSTR;
              ObjectName : Win32.LPSTR;
              SecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              DesiredAccess : Win32.DWORD;
              GenericMapping : Win32.Winnt.PGENERIC_MAPPING;
              ObjectCreation : Win32.BOOL;
              GrantedAccess : Win32.LPDWORD;
              AccessStatus : Win32.LPBOOL;
              pfGenerateOnClose : Win32.LPBOOL)
     return Win32.BOOL
     renames AccessCheckAndAuditAlarmA;             --  winbase.h :5523

   function AccessCheckAndAuditAlarmW
     (SubsystemName : Win32.LPCWSTR;
              HandleId : Win32.LPVOID;
              ObjectTypeName : Win32.LPWSTR;
              ObjectName : Win32.LPWSTR;
              SecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              DesiredAccess : Win32.DWORD;
              GenericMapping : Win32.Winnt.PGENERIC_MAPPING;
              ObjectCreation : Win32.BOOL;
              GrantedAccess : Win32.LPDWORD;
              AccessStatus : Win32.LPBOOL;
              pfGenerateOnClose : Win32.LPBOOL)
     return Win32.BOOL;
   --  winbase.h :5539

   function ObjectOpenAuditAlarmA
     (SubsystemName : Win32.LPCSTR;
              HandleId : Win32.LPVOID;
              ObjectTypeName : Win32.LPSTR;
              ObjectName : Win32.LPSTR;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              ClientToken : Win32.Winnt.HANDLE;
              DesiredAccess : Win32.DWORD;
              GrantedAccess : Win32.DWORD;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              ObjectCreation : Win32.BOOL;
              AccessGranted : Win32.BOOL;
              GenerateOnClose : Win32.LPBOOL)
     return Win32.BOOL;             --  winbase.h :5562

   function ObjectOpenAuditAlarm
     (SubsystemName : Win32.LPCSTR;
              HandleId : Win32.LPVOID;
              ObjectTypeName : Win32.LPSTR;
              ObjectName : Win32.LPSTR;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              ClientToken : Win32.Winnt.HANDLE;
              DesiredAccess : Win32.DWORD;
              GrantedAccess : Win32.DWORD;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              ObjectCreation : Win32.BOOL;
              AccessGranted : Win32.BOOL;
              GenerateOnClose : Win32.LPBOOL)
     return Win32.BOOL
     renames ObjectOpenAuditAlarmA; --  winbase.h :5562

   function ObjectOpenAuditAlarmW
     (SubsystemName : Win32.LPCWSTR;
              HandleId : Win32.LPVOID;
              ObjectTypeName : Win32.LPWSTR;
              ObjectName : Win32.LPWSTR;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              ClientToken : Win32.Winnt.HANDLE;
              DesiredAccess : Win32.DWORD;
              GrantedAccess : Win32.DWORD;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              ObjectCreation : Win32.BOOL;
              AccessGranted : Win32.BOOL;
              GenerateOnClose : Win32.LPBOOL)
     return Win32.BOOL;             --  winbase.h :5579

   function ObjectPrivilegeAuditAlarmA
     (SubsystemName : Win32.LPCSTR;
              HandleId : Win32.LPVOID;
              ClientToken : Win32.Winnt.HANDLE;
              DesiredAccess : Win32.DWORD;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              AccessGranted : Win32.BOOL)
     return Win32.BOOL;
   --  winbase.h :5603

   function ObjectPrivilegeAuditAlarm
     (SubsystemName : Win32.LPCSTR;
              HandleId : Win32.LPVOID;
              ClientToken : Win32.Winnt.HANDLE;
              DesiredAccess : Win32.DWORD;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              AccessGranted : Win32.BOOL)
     return Win32.BOOL
     renames ObjectPrivilegeAuditAlarmA;  --  winbase.h :5603

   function ObjectPrivilegeAuditAlarmW
     (SubsystemName : Win32.LPCWSTR;
              HandleId : Win32.LPVOID;
              ClientToken : Win32.Winnt.HANDLE;
              DesiredAccess : Win32.DWORD;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              AccessGranted : Win32.BOOL)
     return Win32.BOOL;                   --  winbase.h :5614

   function ObjectCloseAuditAlarmA (SubsystemName : Win32.LPCSTR;
                                    HandleId : Win32.LPVOID;
                                    GenerateOnClose : Win32.BOOL)
                                   return Win32.BOOL;
   --  winbase.h :5632

   function ObjectCloseAuditAlarm (SubsystemName : Win32.LPCSTR;
                                   HandleId : Win32.LPVOID;
                                   GenerateOnClose : Win32.BOOL)
                                  return Win32.BOOL
     renames ObjectCloseAuditAlarmA;                --  winbase.h :5632

   function ObjectCloseAuditAlarmW (SubsystemName : Win32.LPCWSTR;
                                    HandleId : Win32.LPVOID;
                                    GenerateOnClose : Win32.BOOL)
                                   return Win32.BOOL;
   --  winbase.h :5640

   function PrivilegedServiceAuditAlarmA
     (SubsystemName : Win32.LPCSTR;
              ServiceName : Win32.LPCSTR;
              ClientToken : Win32.Winnt.HANDLE;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              AccessGranted : Win32.BOOL)
     return Win32.BOOL;                   --  winbase.h :5655

   function PrivilegedServiceAuditAlarm
     (SubsystemName : Win32.LPCSTR;
              ServiceName : Win32.LPCSTR;
              ClientToken : Win32.Winnt.HANDLE;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              AccessGranted : Win32.BOOL)
     return Win32.BOOL
     renames PrivilegedServiceAuditAlarmA; --  winbase.h :5655

   function PrivilegedServiceAuditAlarmW
     (SubsystemName : Win32.LPCWSTR;
              ServiceName : Win32.LPCWSTR;
              ClientToken : Win32.Winnt.HANDLE;
              Privileges : Win32.Winnt.PPRIVILEGE_SET;
              AccessGranted : Win32.BOOL)
     return Win32.BOOL;                   --  winbase.h :5665

   function IsValidSid (pSid : Win32.Winnt.PSID) return Win32.BOOL;
   --  winbase.h :5682

   function EqualSid (pSid1 : Win32.Winnt.PSID;
                      pSid2 : Win32.Winnt.PSID)
                     return Win32.BOOL;             --  winbase.h :5690

   function EqualPrefixSid (pSid1 : Win32.Winnt.PSID;
                            pSid2 : Win32.Winnt.PSID)
                           return Win32.BOOL;       --  winbase.h :5699

   function GetSidLengthRequired (nSubAuthorityCount : Win32.UCHAR)
                                 return Win32.DWORD;        --  winbase.h :5708

   function AllocateAndInitializeSid
     (pIdentifierAuthority : Win32.Winnt.PSID_IDENTIFIER_AUTHORITY;
              nSubAuthorityCount : Win32.BYTE;
              nSubAuthority0 : Win32.DWORD;
              nSubAuthority1 : Win32.DWORD;
              nSubAuthority2 : Win32.DWORD;
              nSubAuthority3 : Win32.DWORD;
              nSubAuthority4 : Win32.DWORD;
              nSubAuthority5 : Win32.DWORD;
              nSubAuthority6 : Win32.DWORD;
              nSubAuthority7 : Win32.DWORD;
              pSid : access Win32.Winnt.PSID)
     return Win32.BOOL;            --  winbase.h :5716

   function FreeSid (pSid : Win32.Winnt.PSID) return Win32.PVOID;
   --  winbase.h :5733

   function InitializeSid
     (Sid : Win32.Winnt.PSID;
              pIdentifierAuthority : Win32.Winnt.PSID_IDENTIFIER_AUTHORITY;
              nSubAuthorityCount : Win32.BYTE)
     return Win32.BOOL;
   --  winbase.h :5740

   function GetSidIdentifierAuthority (pSid : Win32.Winnt.PSID)
     return Win32.Winnt.PSID_IDENTIFIER_AUTHORITY;
   --  winbase.h :5750

   function GetSidSubAuthority (pSid : Win32.Winnt.PSID;
                                nSubAuthority : Win32.DWORD)
                               return Win32.PDWORD;
   --  winbase.h :5758

   function GetSidSubAuthorityCount (pSid : Win32.Winnt.PSID)
                                    return Win32.PUCHAR;    --  winbase.h :5767

   function GetLengthSid (pSid : Win32.Winnt.PSID) return Win32.DWORD;
   --  winbase.h :5775

   function CopySid (nDestinationSidLength : Win32.DWORD;
                     pDestinationSid : Win32.Winnt.PSID;
                     pSourceSid : Win32.Winnt.PSID)
                    return Win32.BOOL;
   --  winbase.h :5783

   function AreAllAccessesGranted (GrantedAccess : Win32.DWORD;
                                   DesiredAccess : Win32.DWORD)
                                  return Win32.BOOL;
   --  winbase.h :5793

   function AreAnyAccessesGranted (GrantedAccess : Win32.DWORD;
                                   DesiredAccess : Win32.DWORD)
                                  return Win32.BOOL;
   --  winbase.h :5802

   procedure MapGenericMask (AccessMask : access Win32.DWORD;
                             GenericMapping : Win32.Winnt.PGENERIC_MAPPING);
   --  winbase.h :5811

   function IsValidAcl (pAcl : Win32.Winnt.PACL) return Win32.BOOL;
   --  winbase.h :5820

   function InitializeAcl (pAcl : Win32.Winnt.PACL;
                           nAclLength : Win32.DWORD;
                           dwAclRevision : Win32.DWORD)
                          return Win32.BOOL;
   --  winbase.h :5828

   function GetAclInformation
     (pAcl : Win32.Winnt.PACL;
              pAclInformation : Win32.LPVOID;
              nAclInformationLength : Win32.DWORD;
              dwAclInformationClass : Win32.Winnt.ACL_INFORMATION_CLASS)
     return Win32.BOOL;           --  winbase.h :5838

   function SetAclInformation
     (pAcl : Win32.Winnt.PACL;
              pAclInformation : Win32.LPVOID;
              nAclInformationLength : Win32.DWORD;
              dwAclInformationClass : Win32.Winnt.ACL_INFORMATION_CLASS)
     return Win32.BOOL;
   --  winbase.h :5849

   function AddAce (pAcl : Win32.Winnt.PACL;
                    dwAceRevision : Win32.DWORD;
                    dwStartingAceIndex : Win32.DWORD;
                    pAceList : Win32.LPVOID;
                    nAceListLength : Win32.DWORD)
                   return Win32.BOOL;  --  winbase.h :5860

   function DeleteAce (pAcl : Win32.Winnt.PACL;
                       dwAceIndex : Win32.DWORD)
                      return Win32.BOOL;       --  winbase.h :5872

   function GetAce (pAcl : Win32.Winnt.PACL;
                    dwAceIndex : Win32.DWORD;
                    pAce : access Win32.PVOID)
                   return Win32.BOOL;          --  winbase.h :5881

   function AddAccessAllowedAce (pAcl : Win32.Winnt.PACL;
                                 dwAceRevision : Win32.DWORD;
                                 AccessMask : Win32.DWORD;
                                 pSid : Win32.Winnt.PSID)
                                return Win32.BOOL;
   --  winbase.h :5891

   function AddAccessDeniedAce (pAcl : Win32.Winnt.PACL;
                                dwAceRevision : Win32.DWORD;
                                AccessMask : Win32.DWORD;
                                pSid : Win32.Winnt.PSID)
                               return Win32.BOOL;
   --  winbase.h :5902

   function AddAuditAccessAce (pAcl : Win32.Winnt.PACL;
                               dwAceRevision : Win32.DWORD;
                               dwAccessMask : Win32.DWORD;
                               pSid : Win32.Winnt.PSID;
                               bAuditSuccess : Win32.BOOL;
                               bAuditFailure : Win32.BOOL)
                              return Win32.BOOL;
   --  winbase.h :5913

   function FindFirstFreeAce (pAcl : Win32.Winnt.PACL;
                              pAce : access Win32.PVOID)
                             return Win32.BOOL;      --  winbase.h :5926

   function InitializeSecurityDescriptor
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              dwRevision : Win32.DWORD)
     return Win32.BOOL;             --  winbase.h :5935

   function IsValidSecurityDescriptor
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL;             --  winbase.h :5944

   function GetSecurityDescriptorLength
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.DWORD;            --  winbase.h :5952

   function GetSecurityDescriptorControl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              pControl : Win32.Winnt.PSECURITY_DESCRIPTOR_CONTROL;
              lpdwRevision : Win32.LPDWORD)
     return Win32.BOOL;             --  winbase.h :5960

   function SetSecurityDescriptorDacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              bDaclPresent : Win32.BOOL;
              pDacl : Win32.Winnt.PACL;
              bDaclDefaulted : Win32.BOOL)
     return Win32.BOOL;             --  winbase.h :5970

   function GetSecurityDescriptorDacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              lpbDaclPresent : Win32.LPBOOL;
              pDacl : access Win32.Winnt.PACL;
              lpbDaclDefaulted : Win32.LPBOOL)
     return Win32.BOOL;
   --  winbase.h :5981

   function SetSecurityDescriptorSacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              bSaclPresent : Win32.BOOL;
              pSacl : Win32.Winnt.PACL;
              bSaclDefaulted : Win32.BOOL)
     return Win32.BOOL;
   --  winbase.h :5992

   function GetSecurityDescriptorSacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              lpbSaclPresent : Win32.LPBOOL;
              pSacl : access Win32.Winnt.PACL;
              lpbSaclDefaulted : Win32.LPBOOL)
     return Win32.BOOL;             --  winbase.h :6003

   function SetSecurityDescriptorOwner
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              pOwner : Win32.Winnt.PSID;
              bOwnerDefaulted : Win32.BOOL)
     return Win32.BOOL;             --  winbase.h :6014

   function GetSecurityDescriptorOwner
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              pOwner : access Win32.Winnt.PSID;
              lpbOwnerDefaulted : Win32.LPBOOL)
     return Win32.BOOL;             --  winbase.h :6024

   function SetSecurityDescriptorGroup
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              pGroup : Win32.Winnt.PSID;
              bGroupDefaulted : Win32.BOOL)
     return Win32.BOOL;
   --  winbase.h :6034

   function GetSecurityDescriptorGroup
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              pGroup : access Win32.Winnt.PSID;
              lpbGroupDefaulted : Win32.LPBOOL)
     return Win32.BOOL;
   --  winbase.h :6044

   function CreatePrivateObjectSecurity
     (ParentDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              CreatorDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              NewDescriptor : access Win32.Winnt.PSECURITY_DESCRIPTOR;
              IsDirectoryObject : Win32.BOOL;
              Token : Win32.Winnt.HANDLE;
              GenericMapping : Win32.Winnt.PGENERIC_MAPPING)
     return Win32.BOOL;
   --  winbase.h :6054

   function SetPrivateObjectSecurity
     (SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
              ModificationDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              ObjectsSecurityDescriptor :
                access Win32.Winnt.PSECURITY_DESCRIPTOR;
              GenericMapping : Win32.Winnt.PGENERIC_MAPPING;
              Token : Win32.Winnt.HANDLE)
     return Win32.BOOL;       --  winbase.h :6067

   function GetPrivateObjectSecurity
     (ObjectDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
              ResultantDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              DescriptorLength : Win32.DWORD;
              ReturnLength : access Win32.DWORD)
     return Win32.BOOL;
   --  winbase.h :6079

   function DestroyPrivateObjectSecurity
     (ObjectDescriptor : access Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL;                --  winbase.h :6091

   function MakeSelfRelativeSD
     (pAbsoluteSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pSelfRelativeSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpdwBufferLength : Win32.LPDWORD)
     return Win32.BOOL;          --  winbase.h :6099

   function MakeAbsoluteSD
     (pSelfRelativeSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pAbsoluteSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpdwAbsoluteSecurityDescriptorSize : Win32.LPDWORD;
      pDacl : Win32.Winnt.PACL;
      lpdwDaclSize : Win32.LPDWORD;
      pSacl : Win32.Winnt.PACL;
      lpdwSaclSize : Win32.LPDWORD;
      pOwner : Win32.Winnt.PSID;
      lpdwOwnerSize : Win32.LPDWORD;
      pPrimaryGroup : Win32.Winnt.PSID;
      lpdwPrimaryGroupSize : Win32.LPDWORD)
     return Win32.BOOL;
   --  winbase.h :6109

   function SetFileSecurityA
     (lpFileName : Win32.LPCSTR;
              SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL;
   --  winbase.h :6127

   function SetFileSecurity
     (lpFileName : Win32.LPCSTR;
              SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL
     renames SetFileSecurityA;
   --  winbase.h :6127

   function SetFileSecurityW
     (lpFileName : Win32.LPCWSTR;
              SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL;
   --  winbase.h :6135

   function GetFileSecurityA
     (lpFileName : Win32.LPCSTR;
              RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              nLength : Win32.DWORD;
              lpnLengthNeeded : Win32.LPDWORD)
     return Win32.BOOL;
   --  winbase.h :6150

   function GetFileSecurity
     (lpFileName : Win32.LPCSTR;
              RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              nLength : Win32.DWORD;
              lpnLengthNeeded : Win32.LPDWORD)
     return Win32.BOOL
     renames GetFileSecurityA;
   --  winbase.h :6150

   function GetFileSecurityW
     (lpFileName : Win32.LPCWSTR;
              RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
              pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
              nLength : Win32.DWORD;
              lpnLengthNeeded : Win32.LPDWORD)
     return Win32.BOOL;
   --  winbase.h :6160

   function SetKernelObjectSecurity
     (Handle : Win32.Winnt.HANDLE;
              SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
              SecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
     return Win32.BOOL;
   --  winbase.h :6177

   function FindFirstChangeNotificationA (lpPathName : Win32.LPCSTR;
                                          bWatchSubtree : Win32.BOOL;
                                          dwNotifyFilter : Win32.DWORD)
                                         return Win32.Winnt.HANDLE;
   --  winbase.h :6188

   function FindFirstChangeNotification (lpPathName : Win32.LPCSTR;
                                         bWatchSubtree : Win32.BOOL;
                                         dwNotifyFilter : Win32.DWORD)
                                        return Win32.Winnt.HANDLE
     renames FindFirstChangeNotificationA;
   --  winbase.h :6188

   function FindFirstChangeNotificationW (lpPathName : Win32.LPCWSTR;
                                          bWatchSubtree : Win32.BOOL;
                                          dwNotifyFilter : Win32.DWORD)
                                         return Win32.Winnt.HANDLE;
   --  winbase.h :6196

   function FindNextChangeNotification (hChangeHandle : Win32.Winnt.HANDLE)
                                       return Win32.BOOL;  --  winbase.h :6210

   function FindCloseChangeNotification (hChangeHandle : Win32.Winnt.HANDLE)
                                        return Win32.BOOL; --  winbase.h :6217

   function VirtualLock (lpAddress : Win32.LPVOID;
                         dwSize : Win32.DWORD)
                        return Win32.BOOL;      --  winbase.h :6224

   function VirtualUnlock (lpAddress : Win32.LPVOID;
                           dwSize : Win32.DWORD)
                          return Win32.BOOL;    --  winbase.h :6232

   function MapViewOfFileEx (hFileMappingObject : Win32.Winnt.HANDLE;
                             dwDesiredAccess : Win32.DWORD;
                             dwFileOffsetHigh : Win32.DWORD;
                             dwFileOffsetLow : Win32.DWORD;
                             dwNumberOfBytesToMap : Win32.DWORD;
                             lpBaseAddress : Win32.LPVOID)
                            return Win32.LPVOID;
   --  winbase.h :6240

   function SetPriorityClass (hProcess : Win32.Winnt.HANDLE;
                              dwPriorityClass : Win32.DWORD)
                             return Win32.BOOL;
   --  winbase.h :6252

   function GetPriorityClass (hProcess : Win32.Winnt.HANDLE)
                             return Win32.DWORD;
   --  winbase.h :6260

   function IsBadReadPtr (lp : Win32.PCVOID;
                          ucb : Win32.UINT)
                         return Win32.BOOL;           --  winbase.h :6267

   function IsBadWritePtr (lp : Win32.LPVOID;
                           ucb : Win32.UINT)
                          return Win32.BOOL;          --  winbase.h :6275

   function IsBadHugeReadPtr (lp : Win32.PCVOID;
                              ucb : Win32.UINT)
                             return Win32.BOOL;       --  winbase.h :6283

   function IsBadHugeWritePtr (lp : Win32.LPVOID;
                               ucb : Win32.UINT)
                              return Win32.BOOL;      --  winbase.h :6291

   function IsBadCodePtr (lpfn : Win32.Windef.FARPROC) return Win32.BOOL;
   --  winbase.h :6299

   function IsBadStringPtrA (lpsz : Win32.LPCSTR;
                             ucchMax : Win32.UINT)
                            return Win32.BOOL;    --  winbase.h :6306

   function IsBadStringPtr (lpsz : Win32.LPCSTR;
                            ucchMax : Win32.UINT)
                           return Win32.BOOL
     renames IsBadStringPtrA;
   --  winbase.h :6306

   function IsBadStringPtrW (lpsz : Win32.LPCWSTR;
                             ucchMax : Win32.UINT)
                            return Win32.BOOL;    --  winbase.h :6313

   function LookupAccountSidA
     (lpSystemName : Win32.LPCSTR;
              Sid : Win32.Winnt.PSID;
              Name : Win32.LPSTR;
              cbName : Win32.LPDWORD;
              ReferencedDomainName : Win32.LPSTR;
              cbReferencedDomainName : Win32.LPDWORD;
              peUse : Win32.Winnt.PSID_NAME_USE)
     return Win32.BOOL;
   --  winbase.h :6326

   function LookupAccountSid (lpSystemName : Win32.LPCSTR;
                              Sid : Win32.Winnt.PSID;
                              Name : Win32.LPSTR;
                              cbName : Win32.LPDWORD;
                              ReferencedDomainName : Win32.LPSTR;
                              cbReferencedDomainName : Win32.LPDWORD;
                              peUse : Win32.Winnt.PSID_NAME_USE)
                             return Win32.BOOL
     renames LookupAccountSidA;
   --  winbase.h :6326

   function LookupAccountSidW
     (lpSystemName : Win32.LPCWSTR;
              Sid : Win32.Winnt.PSID;
              Name : Win32.LPWSTR;
              cbName : Win32.LPDWORD;
              ReferencedDomainName : Win32.LPWSTR;
              cbReferencedDomainName : Win32.LPDWORD;
              peUse : Win32.Winnt.PSID_NAME_USE)
     return Win32.BOOL;
   --  winbase.h :6338

   function LookupAccountNameA
     (lpSystemName : Win32.LPCSTR;
              lpAccountName : Win32.LPCSTR;
              Sid : Win32.Winnt.PSID;
              cbSid : Win32.LPDWORD;
              ReferencedDomainName : Win32.LPSTR;
              cbReferencedDomainName : Win32.LPDWORD;
              peUse : Win32.Winnt.PSID_NAME_USE)
     return Win32.BOOL;
   --  winbase.h :6356

   function LookupAccountName
     (lpSystemName : Win32.LPCSTR;
              lpAccountName : Win32.LPCSTR;
              Sid : Win32.Winnt.PSID;
              cbSid : Win32.LPDWORD;
              ReferencedDomainName : Win32.LPSTR;
              cbReferencedDomainName : Win32.LPDWORD;
              peUse : Win32.Winnt.PSID_NAME_USE)
     return Win32.BOOL
     renames LookupAccountNameA; --  winbase.h :6356

   function LookupAccountNameW
     (lpSystemName : Win32.LPCWSTR;
              lpAccountName : Win32.LPCWSTR;
              Sid : Win32.Winnt.PSID;
              cbSid : Win32.LPDWORD;
              ReferencedDomainName : Win32.LPWSTR;
              cbReferencedDomainName : Win32.LPDWORD;
              peUse : Win32.Winnt.PSID_NAME_USE)
     return Win32.BOOL;
   --  winbase.h :6368

   function LookupPrivilegeValueA (lpSystemName : Win32.LPCSTR;
                                   lpName : Win32.LPCSTR;
                                   lpLuid : Win32.Winnt.PLUID)
                                  return Win32.BOOL;
   --  winbase.h :6386

   function LookupPrivilegeValue (lpSystemName : Win32.LPCSTR;
                                  lpName : Win32.LPCSTR;
                                  lpLuid : Win32.Winnt.PLUID)
                                 return Win32.BOOL
     renames LookupPrivilegeValueA;
   --  winbase.h :6386

   function LookupPrivilegeValueW (lpSystemName : Win32.LPCWSTR;
                                   lpName : Win32.LPCWSTR;
                                   lpLuid : Win32.Winnt.PLUID)
                                  return Win32.BOOL;
   --  winbase.h :6394

   function LookupPrivilegeNameA (lpSystemName : Win32.LPCSTR;
                                  lpLuid : Win32.Winnt.PLUID;
                                  lpName : Win32.LPSTR;
                                  cbName : Win32.LPDWORD)
                                 return Win32.BOOL;
   --  winbase.h :6408

   function LookupPrivilegeName (lpSystemName : Win32.LPCSTR;
                                 lpLuid : Win32.Winnt.PLUID;
                                 lpName : Win32.LPSTR;
                                 cbName : Win32.LPDWORD)
                                return Win32.BOOL
     renames LookupPrivilegeNameA;
   --  winbase.h :6408

   function LookupPrivilegeNameW (lpSystemName : Win32.LPCWSTR;
                                  lpLuid : Win32.Winnt.PLUID;
                                  lpName : Win32.LPWSTR;
                                  cbName : Win32.LPDWORD)
                                 return Win32.BOOL;
   --  winbase.h :6417

   function LookupPrivilegeDisplayNameA (lpSystemName : Win32.LPCSTR;
                                         lpName : Win32.LPCSTR;
                                         lpDisplayName : Win32.LPSTR;
                                         cbDisplayName : Win32.LPDWORD;
                                         lpLanguageId : Win32.LPDWORD)
                                        return Win32.BOOL;
   --  winbase.h :6432

   function LookupPrivilegeDisplayName (lpSystemName : Win32.LPCSTR;
                                        lpName : Win32.LPCSTR;
                                        lpDisplayName : Win32.LPSTR;
                                        cbDisplayName : Win32.LPDWORD;
                                        lpLanguageId : Win32.LPDWORD)
                                       return Win32.BOOL
     renames LookupPrivilegeDisplayNameA;           --  winbase.h :6432

   function LookupPrivilegeDisplayNameW (lpSystemName : Win32.LPCWSTR;
                                         lpName : Win32.LPCWSTR;
                                         lpDisplayName : Win32.LPWSTR;
                                         cbDisplayName : Win32.LPDWORD;
                                         lpLanguageId : Win32.LPDWORD)
                                        return Win32.BOOL;
   --  winbase.h :6442

   function AllocateLocallyUniqueId (Luid : Win32.Winnt.PLUID)
                                    return Win32.BOOL;
   --  winbase.h :6458

   function BuildCommDCBA (lpDef : Win32.LPCSTR;
                           lpDCB : Win32.Winbase.LPDCB)
                          return Win32.BOOL;        --  winbase.h :6465

   function BuildCommDCB (lpDef : Win32.LPCSTR;
                          lpDCB : Win32.Winbase.LPDCB)
                         return Win32.BOOL
     renames BuildCommDCBA;     --  winbase.h :6465

   function BuildCommDCBW (lpDef : Win32.LPCWSTR;
                           lpDCB : Win32.Winbase.LPDCB)
                          return Win32.BOOL;        --  winbase.h :6472

   function BuildCommDCBAndTimeoutsA (lpDef : Win32.LPCSTR;
                                      lpDCB : Win32.Winbase.LPDCB;
                                      lpCommTimeouts :
                                        Win32.Winbase.LPCOMMTIMEOUTS)
                                     return Win32.BOOL;
   --  winbase.h :6485

   function BuildCommDCBAndTimeouts (lpDef : Win32.LPCSTR;
                                     lpDCB : Win32.Winbase.LPDCB;
                                     lpCommTimeouts :
                                       Win32.Winbase.LPCOMMTIMEOUTS)
                                    return Win32.BOOL
     renames BuildCommDCBAndTimeoutsA;              --  winbase.h :6485

   function BuildCommDCBAndTimeoutsW (lpDef : Win32.LPCWSTR;
                                      lpDCB : Win32.Winbase.LPDCB;
                                      lpCommTimeouts :
                                        Win32.Winbase.LPCOMMTIMEOUTS)
                                     return Win32.BOOL;
   --  winbase.h :6493

   function CommConfigDialogA (lpszName : Win32.LPCSTR;
                               hWnd : Win32.Windef.HWND;
                               lpCC : LPCOMMCONFIG)
                              return Win32.BOOL; --  winbase.h :6507

   function CommConfigDialog (lpszName : Win32.LPCSTR;
                              hWnd : Win32.Windef.HWND;
                              lpCC : LPCOMMCONFIG)
                             return Win32.BOOL
     renames CommConfigDialogA;
   --  winbase.h :6507

   function CommConfigDialogW (lpszName : Win32.LPCWSTR;
                               hWnd : Win32.Windef.HWND;
                               lpCC : LPCOMMCONFIG)
                              return Win32.BOOL; --  winbase.h :6515

   function GetDefaultCommConfigA (lpszName : Win32.LPCSTR;
                                   lpCC : LPCOMMCONFIG;
                                   lpdwSize : Win32.LPDWORD)
                                  return Win32.BOOL;
   --  winbase.h :6529

   function GetDefaultCommConfig (lpszName : Win32.LPCSTR;
                                  lpCC : LPCOMMCONFIG;
                                  lpdwSize : Win32.LPDWORD)
                                 return Win32.BOOL
     renames GetDefaultCommConfigA;
   --  winbase.h :6529

   function GetDefaultCommConfigW (lpszName : Win32.LPCWSTR;
                                   lpCC : LPCOMMCONFIG;
                                   lpdwSize : Win32.LPDWORD)
                                  return Win32.BOOL;
   --  winbase.h :6537

   function SetDefaultCommConfigA (lpszName : Win32.LPCSTR;
                                   lpCC : LPCOMMCONFIG;
                                   dwSize : Win32.DWORD)
                                  return Win32.BOOL;
   --  winbase.h :6551

   function SetDefaultCommConfig (lpszName : Win32.LPCSTR;
                                  lpCC : LPCOMMCONFIG;
                                  dwSize : Win32.DWORD)
                                 return Win32.BOOL
     renames SetDefaultCommConfigA;
   --  winbase.h :6551

   function SetDefaultCommConfigW (lpszName : Win32.LPCWSTR;
                                   lpCC : LPCOMMCONFIG;
                                   dwSize : Win32.DWORD)
                                  return Win32.BOOL;
   --  winbase.h :6559

   function GetComputerNameA (lpBuffer : Win32.LPSTR;
                              nSize : Win32.LPDWORD)
                             return Win32.BOOL;  --  winbase.h :6576

   function GetComputerName (lpBuffer : Win32.LPSTR;
                             nSize : Win32.LPDWORD)
                            return Win32.BOOL
     renames GetComputerNameA;
   --  winbase.h :6576

   function GetComputerNameW (lpBuffer : Win32.LPWSTR;
                              nSize : Win32.LPDWORD)
                             return Win32.BOOL;  --  winbase.h :6583

   function SetComputerNameA (lpComputerName : Win32.LPCSTR) return Win32.BOOL;
   --  winbase.h :6596

   function SetComputerName (lpComputerName : Win32.LPCSTR) return Win32.BOOL
     renames SetComputerNameA;                      --  winbase.h :6596

   function SetComputerNameW (lpComputerName : Win32.LPCWSTR)
                             return Win32.BOOL;
   --  winbase.h :6602

   function GetUserNameA (lpBuffer : Win32.LPSTR;
                          nSize : Win32.LPDWORD)
                         return Win32.BOOL;      --  winbase.h :6614

   function GetUserName (lpBuffer : Win32.LPSTR;
                         nSize : Win32.LPDWORD)
                        return Win32.BOOL
     renames GetUserNameA;
   --  winbase.h :6614

   function GetUserNameW (lpBuffer : Win32.LPWSTR;
                          nSize : Win32.LPDWORD)
                         return Win32.BOOL;      --  winbase.h :6621

   function QueryPerformanceCounter
     (lpPerformanceCount : Win32.Winnt.PLARGE_INTEGER)
     return Win32.BOOL;              --  winbase.h :6638

   function QueryPerformanceFrequency
     (lpFrequency : Win32.Winnt.PLARGE_INTEGER)
     return Win32.BOOL;                     --  winbase.h :6645

   function GetVersionExA (lpVersionInformation : LPOSVERSIONINFOA)
                          return Win32.BOOL;                --  winbase.h :6686

   function GetVersionEx (lpVersionInformation : LPOSVERSIONINFOA)
                         return Win32.BOOL renames GetVersionExA;
   --  winbase.h :6686

   function GetVersionExW (lpVersionInformation : LPOSVERSIONINFOW)
                          return Win32.BOOL;
   --  winbase.h :6692

private

   pragma Convention (c_pass_by_copy, COMSTAT);             --  winbase.h :374
   pragma Convention (C, DCB);                              --  winbase.h :402
   pragma Convention (C, OVERLAPPED);                       --  winbase.h :179
   pragma Convention (c_pass_by_copy, SECURITY_ATTRIBUTES); --  winbase.h :187
   pragma Convention (c_pass_by_copy, PROCESS_INFORMATION); --  winbase.h :193
   pragma Convention (c_pass_by_copy, FILETIME);            --  winbase.h :204
   pragma Convention (c_pass_by_copy, SYSTEMTIME);          --  winbase.h :213
   pragma Convention (C, WIN32_FILE_ATTRIBUTE_DATA);
   pragma Convention (C, COMMPROP);                         --  winbase.h :347
   pragma Convention (C, COMMTIMEOUTS);                     --  winbase.h :433
   pragma Convention (C, COMMCONFIG);                       --  winbase.h :441
   pragma Convention (C, SYSTEM_INFO);                      --  winbase.h :454
   pragma Convention (C, MEMORYSTATUS);                     --  winbase.h :497
   pragma Convention (C, EXCEPTION_DEBUG_INFO);             --  winbase.h :580
   pragma Convention (c_pass_by_copy, CREATE_THREAD_DEBUG_INFO);
   --  winbase.h :585
   pragma Convention (C, CREATE_PROCESS_DEBUG_INFO);        --  winbase.h :591
   pragma Convention (c_pass_by_copy, EXIT_THREAD_DEBUG_INFO);
   --  winbase.h :604
   pragma Convention (c_pass_by_copy, EXIT_PROCESS_DEBUG_INFO);
   --  winbase.h :608
   pragma Convention (C, LOAD_DLL_DEBUG_INFO);              --  winbase.h :612
   pragma Convention (c_pass_by_copy, UNLOAD_DLL_DEBUG_INFO);
   --  winbase.h :621
   pragma Convention (c_pass_by_copy, OUTPUT_DEBUG_STRING_INFO);
   --  winbase.h :625
   pragma Convention (c_pass_by_copy, RIP_INFO);            --  winbase.h :631
   pragma Convention (C, DEBUG_EVENT);                      --  winbase.h :637
   pragma Convention (C, OFSTRUCT);                         --  winbase.h :874
   pragma Convention (c_pass_by_copy, struct_anonymous2_t); --  winbase.h :1347
   pragma Convention (c_pass_by_copy, struct_anonymous3_t); --  winbase.h :1353
   pragma Convention (C, PROCESS_HEAP_ENTRY);               --  winbase.h :1337
   pragma Convention (C, BY_HANDLE_FILE_INFORMATION);       --  winbase.h :2030
   pragma Convention (C, TIME_ZONE_INFORMATION);            --  winbase.h :2645
   pragma Convention (C, WIN32_STREAM_ID);                  --  winbase.h :3283
   pragma Convention (C, STARTUPINFOA);                     --  winbase.h :3326
   pragma Convention (C, STARTUPINFOW);                     --  winbase.h :3346
   pragma Convention (C, WIN32_FIND_DATAA);                 --  winbase.h :3376
   pragma Convention (C, WIN32_FIND_DATAW);                 --  winbase.h :3388
   pragma Convention (C, OSVERSIONINFOA);                   --  winbase.h :6649
   pragma Convention (C, OSVERSIONINFOW);                   --  winbase.h :6657

   function To_Handle is new Ada.Unchecked_Conversion
     (Integer, Win32.Winnt.HANDLE);

   INVALID_HANDLE_VALUE : constant Win32.Winnt.HANDLE :=   To_Handle (-1);
   --  winbase.h :57

   pragma Inline (GlobalDiscard);
   pragma Inline (LocalDiscard);
   pragma Inline (MAKEINTATOM);

   pragma Import (Stdcall, InterlockedIncrement, "InterlockedIncrement");
   --  winbase.h :922
   pragma Import (Stdcall, InterlockedDecrement, "InterlockedDecrement");
   --  winbase.h :929
   pragma Import (Stdcall, InterlockedExchange, "InterlockedExchange");
   --  winbase.h :936
   pragma Import (Stdcall, FreeResource, "FreeResource");    --  winbase.h :946
   pragma Import (Stdcall, LockResource, "LockResource");    --  winbase.h :953
   pragma Import (Stdcall, WinMain, "WinMain");              --  winbase.h :964
   pragma Import (Stdcall, FreeLibrary, "FreeLibrary");      --  winbase.h :974
   pragma Import (Stdcall, FreeLibraryAndExitThread,
                    "FreeLibraryAndExitThread");
   --  winbase.h :982
   pragma Import (Stdcall, DisableThreadLibraryCalls,
                    "DisableThreadLibraryCalls");
   --  winbase.h :990
   pragma Import (Stdcall, GetProcAddress, "GetProcAddress");
   --  winbase.h :997
   pragma Import (Stdcall, GetVersion, "GetVersion");       --  winbase.h :1005
   pragma Import (Stdcall, GlobalAlloc, "GlobalAlloc");     --  winbase.h :1010
   pragma Import (Stdcall, GlobalReAlloc, "GlobalReAlloc"); --  winbase.h :1018
   pragma Import (Stdcall, GlobalSize, "GlobalSize");       --  winbase.h :1027
   pragma Import (Stdcall, GlobalFlags, "GlobalFlags");     --  winbase.h :1034
   pragma Import (Stdcall, GlobalLock, "GlobalLock");       --  winbase.h :1042
   pragma Import (Stdcall, GlobalHandle, "GlobalHandle");   --  winbase.h :1050
   pragma Import (Stdcall, GlobalUnlock, "GlobalUnlock");   --  winbase.h :1058
   pragma Import (Stdcall, GlobalFree, "GlobalFree");       --  winbase.h :1066
   pragma Import (Stdcall, GlobalCompact, "GlobalCompact"); --  winbase.h :1073
   pragma Import (Stdcall, GlobalFix, "GlobalFix");         --  winbase.h :1080
   pragma Import (Stdcall, GlobalUnfix, "GlobalUnfix");     --  winbase.h :1087
   pragma Import (Stdcall, GlobalWire, "GlobalWire");       --  winbase.h :1094
   pragma Import (Stdcall, GlobalUnWire, "GlobalUnWire");   --  winbase.h :1101
   pragma Import (Stdcall, GlobalMemoryStatus, "GlobalMemoryStatus");
   --  winbase.h :1108
   pragma Import (Stdcall, LocalAlloc, "LocalAlloc");       --  winbase.h :1115
   pragma Import (Stdcall, LocalReAlloc, "LocalReAlloc");   --  winbase.h :1123
   pragma Import (Stdcall, LocalLock, "LocalLock");         --  winbase.h :1132
   pragma Import (Stdcall, LocalHandle, "LocalHandle");     --  winbase.h :1139
   pragma Import (Stdcall, LocalUnlock, "LocalUnlock");     --  winbase.h :1146
   pragma Import (Stdcall, LocalSize, "LocalSize");         --  winbase.h :1153
   pragma Import (Stdcall, LocalFlags, "LocalFlags");       --  winbase.h :1160
   pragma Import (Stdcall, LocalFree, "LocalFree");         --  winbase.h :1167
   pragma Import (Stdcall, LocalShrink, "LocalShrink");     --  winbase.h :1174
   pragma Import (Stdcall, LocalCompact, "LocalCompact");   --  winbase.h :1182
   pragma Import (Stdcall, FlushInstructionCache, "FlushInstructionCache");
   --  winbase.h :1189
   pragma Import (Stdcall, VirtualAlloc, "VirtualAlloc");   --  winbase.h :1198
   pragma Import (Stdcall, VirtualFree, "VirtualFree");     --  winbase.h :1208
   pragma Import (Stdcall, VirtualProtect, "VirtualProtect");
   --  winbase.h :1217
   pragma Import (Stdcall, VirtualQuery, "VirtualQuery");   --  winbase.h :1227
   pragma Import (Stdcall, VirtualProtectEx, "VirtualProtectEx");
   --  winbase.h :1236
   pragma Import (Stdcall, VirtualQueryEx, "VirtualQueryEx");
   --  winbase.h :1247
   pragma Import (Stdcall, HeapCreate, "HeapCreate");       --  winbase.h :1257
   pragma Import (Stdcall, HeapDestroy, "HeapDestroy");     --  winbase.h :1266
   pragma Import (Stdcall, HeapAlloc, "HeapAlloc");         --  winbase.h :1273
   pragma Import (Stdcall, HeapReAlloc, "HeapReAlloc");     --  winbase.h :1282
   pragma Import (Stdcall, HeapFree, "HeapFree");           --  winbase.h :1292
   pragma Import (Stdcall, HeapSize, "HeapSize");           --  winbase.h :1301
   pragma Import (Stdcall, HeapValidate, "HeapValidate");   --  winbase.h :1310
   pragma Import (Stdcall, HeapCompact, "HeapCompact");     --  winbase.h :1319
   pragma Import (Stdcall, GetProcessHeap, "GetProcessHeap");
   --  winbase.h :1327
   pragma Import (Stdcall, GetProcessHeaps, "GetProcessHeaps");
   --  winbase.h :1332
   pragma Import (Stdcall, HeapLock, "HeapLock");           --  winbase.h :1366
   pragma Import (Stdcall, HeapUnlock, "HeapUnlock");       --  winbase.h :1373
   pragma Import (Stdcall, HeapWalk, "HeapWalk");           --  winbase.h :1380
   pragma Import (Stdcall, GetBinaryTypeA, "GetBinaryTypeA");
   --  winbase.h :1397
   pragma Import (Stdcall, GetBinaryTypeW, "GetBinaryTypeW");
   --  winbase.h :1404
   pragma Import (Stdcall, GetShortPathNameA, "GetShortPathNameA");
   --  winbase.h :1417
   pragma Import (Stdcall, GetShortPathNameW, "GetShortPathNameW");
   --  winbase.h :1425
   pragma Import (Stdcall, GetProcessAffinityMask, "GetProcessAffinityMask");
   --  winbase.h :1439
   pragma Import (Stdcall, GetProcessTimes, "GetProcessTimes");
   --  winbase.h :1448
   pragma Import (Stdcall, GetProcessWorkingSetSize,
                    "GetProcessWorkingSetSize");
   --  winbase.h :1459
   pragma Import (Stdcall, SetProcessWorkingSetSize,
                    "SetProcessWorkingSetSize");
   --  winbase.h :1468
   pragma Import (Stdcall, OpenProcess, "OpenProcess");     --  winbase.h :1477
   pragma Import (Stdcall, GetCurrentProcess, "GetCurrentProcess");
   --  winbase.h :1486
   pragma Import (Stdcall, GetCurrentProcessId, "GetCurrentProcessId");
   --  winbase.h :1493
   pragma Import (Stdcall, ExitProcess, "ExitProcess");     --  winbase.h :1500
   pragma Import (Stdcall, TerminateProcess, "TerminateProcess");
   --  winbase.h :1507
   pragma Import (Stdcall, GetExitCodeProcess, "GetExitCodeProcess");
   --  winbase.h :1515
   pragma Import (Stdcall, FatalExit, "FatalExit");         --  winbase.h :1524
   pragma Import (Stdcall, GetEnvironmentStrings, "GetEnvironmentStrings");
   --  winbase.h :1531
   pragma Import (Stdcall, GetEnvironmentStringsW, "GetEnvironmentStringsW");
   --  winbase.h :1538
   pragma Import (Stdcall, FreeEnvironmentStringsA, "FreeEnvironmentStringsA");
   --  winbase.h :1551
   pragma Import (Stdcall, FreeEnvironmentStringsW, "FreeEnvironmentStringsW");
   --  winbase.h :1557
   pragma Import (Stdcall, RaiseException, "RaiseException");
   --  winbase.h :1569
   pragma Import (Stdcall, UnhandledExceptionFilter,
                    "UnhandledExceptionFilter");
   --  winbase.h :1579
   pragma Import (Stdcall, SetUnhandledExceptionFilter,
                    "SetUnhandledExceptionFilter");
   --  winbase.h :1591
   pragma Import (Stdcall, CreateThread, "CreateThread");   --  winbase.h :1598
   pragma Import (Stdcall, CreateRemoteThread, "CreateRemoteThread");
   --  winbase.h :1610
   pragma Import (Stdcall, GetCurrentThread, "GetCurrentThread");
   --  winbase.h :1623
   pragma Import (Stdcall, GetCurrentThreadId, "GetCurrentThreadId");
   --  winbase.h :1630
   pragma Import (Stdcall, SetThreadAffinityMask, "SetThreadAffinityMask");
   --  winbase.h :1637
   pragma Import (Stdcall, SetThreadPriority, "SetThreadPriority");
   --  winbase.h :1645
   pragma Import (Stdcall, GetThreadPriority, "GetThreadPriority");
   --  winbase.h :1653
   pragma Import (Stdcall, GetThreadTimes, "GetThreadTimes");
   --  winbase.h :1660
   pragma Import (Stdcall, ExitThread, "ExitThread");       --  winbase.h :1671
   pragma Import (Stdcall, TerminateThread, "TerminateThread");
   --  winbase.h :1678
   pragma Import (Stdcall, GetExitCodeThread, "GetExitCodeThread");
   --  winbase.h :1686
   pragma Import (Stdcall, GetThreadSelectorEntry, "GetThreadSelectorEntry");
   --  winbase.h :1694
   pragma Import (Stdcall, GetLastError, "GetLastError");
   --  winbase.h :1703
   pragma Import (Stdcall, SetLastError, "SetLastError");   --  winbase.h :1710
   pragma Import (Stdcall, GetOverlappedResult, "GetOverlappedResult");
   --  winbase.h :1717
   pragma Import (Stdcall, CreateIoCompletionPort, "CreateIoCompletionPort");
   --  winbase.h :1727
   pragma Import (Stdcall, GetQueuedCompletionStatus,
                    "GetQueuedCompletionStatus");
   --  winbase.h :1737
   pragma Import (Stdcall, SetErrorMode, "SetErrorMode");   --  winbase.h :1753
   pragma Import (Stdcall, ReadProcessMemory, "ReadProcessMemory");
   --  winbase.h :1760
   pragma Import (Stdcall, WriteProcessMemory, "WriteProcessMemory");
   --  winbase.h :1771
   pragma Import (Stdcall, GetThreadContext, "GetThreadContext");
   --  winbase.h :1782
   pragma Import (Stdcall, SetThreadContext, "SetThreadContext");
   --  winbase.h :1790
   pragma Import (Stdcall, SuspendThread, "SuspendThread"); --  winbase.h :1798
   pragma Import (Stdcall, ResumeThread, "ResumeThread");   --  winbase.h :1805
   pragma Import (Stdcall, DebugBreak, "DebugBreak");       --  winbase.h :1812
   pragma Import (Stdcall, WaitForDebugEvent, "WaitForDebugEvent");
   --  winbase.h :1819
   pragma Import (Stdcall, ContinueDebugEvent, "ContinueDebugEvent");
   --  winbase.h :1827
   pragma Import (Stdcall, DebugActiveProcess, "DebugActiveProcess");
   --  winbase.h :1836
   pragma Import (Stdcall, InitializeCriticalSection,
                    "InitializeCriticalSection");
   --  winbase.h :1843
   pragma Import (Stdcall, EnterCriticalSection, "EnterCriticalSection");
   --  winbase.h :1850
   pragma Import (Stdcall, LeaveCriticalSection, "LeaveCriticalSection");
   --  winbase.h :1857
   pragma Import (Stdcall, DeleteCriticalSection, "DeleteCriticalSection");
   --  winbase.h :1864
   pragma Import (Stdcall, SetEvent, "SetEvent");           --  winbase.h :1871
   pragma Import (Stdcall, ResetEvent, "ResetEvent");       --  winbase.h :1878
   pragma Import (Stdcall, PulseEvent, "PulseEvent");       --  winbase.h :1885
   pragma Import (Stdcall, ReleaseSemaphore, "ReleaseSemaphore");
   --  winbase.h :1892
   pragma Import (Stdcall, ReleaseMutex, "ReleaseMutex");   --  winbase.h :1901
   pragma Import (Stdcall, WaitForSingleObject, "WaitForSingleObject");
   --  winbase.h :1908
   pragma Import (Stdcall, WaitForMultipleObjects, "WaitForMultipleObjects");
   --  winbase.h :1916
   pragma Import (Stdcall, Sleep, "Sleep");                 --  winbase.h :1926
   pragma Import (Stdcall, LoadResource, "LoadResource");   --  winbase.h :1933
   pragma Import (Stdcall, SizeofResource, "SizeofResource");
   --  winbase.h :1941
   pragma Import (Stdcall, GlobalDeleteAtom, "GlobalDeleteAtom");
   --  winbase.h :1950
   pragma Import (Stdcall, InitAtomTable, "InitAtomTable"); --  winbase.h :1957
   pragma Import (Stdcall, DeleteAtom, "DeleteAtom");       --  winbase.h :1964
   pragma Import (Stdcall, SetHandleCount, "SetHandleCount");
   --  winbase.h :1971
   pragma Import (Stdcall, GetLogicalDrives, "GetLogicalDrives");
   --  winbase.h :1978
   pragma Import (Stdcall, LockFile, "LockFile");           --  winbase.h :1985
   pragma Import (Stdcall, UnlockFile, "UnlockFile");       --  winbase.h :1996
   pragma Import (Stdcall, LockFileEx, "LockFileEx");       --  winbase.h :2007
   pragma Import (Stdcall, UnlockFileEx, "UnlockFileEx");   --  winbase.h :2022

   pragma Import (Stdcall, GetFileInformationByHandle,
                    "GetFileInformationByHandle");
   --  winbase.h :2046

   pragma Import (Stdcall, GetFileType, "GetFileType");     --  winbase.h :2054
   pragma Import (Stdcall, GetFileSize, "GetFileSize");     --  winbase.h :2061
   pragma Import (Stdcall, GetStdHandle, "GetStdHandle");   --  winbase.h :2069
   pragma Import (Stdcall, SetStdHandle, "SetStdHandle");   --  winbase.h :2076
   pragma Import (Stdcall, WriteFile, "WriteFile");         --  winbase.h :2084
   pragma Import (Stdcall, ReadFile, "ReadFile");           --  winbase.h :2095
   pragma Import (Stdcall, FlushFileBuffers, "FlushFileBuffers");
   --  winbase.h :2106
   pragma Import (Stdcall, DeviceIoControl, "DeviceIoControl");
   --  winbase.h :2113
   pragma Import (Stdcall, SetEndOfFile, "SetEndOfFile");
   --  winbase.h :2127
   pragma Import (Stdcall, SetFilePointer, "SetFilePointer");
   --  winbase.h :2134
   pragma Import (Stdcall, FindClose, "FindClose");         --  winbase.h :2144
   pragma Import (Stdcall, GetFileTime, "GetFileTime");     --  winbase.h :2151
   pragma Import (Stdcall, SetFileTime, "SetFileTime");     --  winbase.h :2161
   pragma Import (Stdcall, CloseHandle, "CloseHandle");     --  winbase.h :2171
   pragma Import (Stdcall, DuplicateHandle, "DuplicateHandle");
   --  winbase.h :2178
   pragma Import (Stdcall, GetHandleInformation, "GetHandleInformation");
   --  winbase.h :2191
   pragma Import (Stdcall, SetHandleInformation, "SetHandleInformation");
   --  winbase.h :2199
   pragma Import (Stdcall, LoadModule, "LoadModule");       --  winbase.h :2213
   pragma Import (Stdcall, WinExec, "WinExec");             --  winbase.h :2221
   pragma Import (Stdcall, ClearCommBreak, "ClearCommBreak");
   --  winbase.h :2229
   pragma Import (Stdcall, ClearCommError, "ClearCommError");
   --  winbase.h :2236
   pragma Import (Stdcall, SetupComm, "SetupComm");
   --  winbase.h :2245
   pragma Import (Stdcall, EscapeCommFunction, "EscapeCommFunction");
   --  winbase.h :2254
   pragma Import (Stdcall, GetCommConfig, "GetCommConfig"); --  winbase.h :2262
   pragma Import (Stdcall, GetCommMask, "GetCommMask");     --  winbase.h :2271
   pragma Import (Stdcall, GetCommProperties, "GetCommProperties");
   --  winbase.h :2279
   pragma Import (Stdcall, GetCommModemStatus, "GetCommModemStatus");
   --  winbase.h :2287
   pragma Import (Stdcall, GetCommState, "GetCommState");   --  winbase.h :2295
   pragma Import (Stdcall, GetCommTimeouts, "GetCommTimeouts");
   --  winbase.h :2303
   pragma Import (Stdcall, PurgeComm, "PurgeComm");         --  winbase.h :2311
   pragma Import (Stdcall, SetCommBreak, "SetCommBreak");
   --  winbase.h :2319
   pragma Import (Stdcall, SetCommConfig, "SetCommConfig");
   --  winbase.h :2326
   pragma Import (Stdcall, SetCommMask, "SetCommMask");
   --  winbase.h :2335
   pragma Import (Stdcall, SetCommState, "SetCommState");
   --  winbase.h :2343
   pragma Import (Stdcall, SetCommTimeouts, "SetCommTimeouts");
   --  winbase.h :2351
   pragma Import (Stdcall, TransmitCommChar, "TransmitCommChar");
   --  winbase.h :2359
   pragma Import (Stdcall, WaitCommEvent, "WaitCommEvent"); --  winbase.h :2367
   pragma Import (Stdcall, SetTapePosition, "SetTapePosition");
   --  winbase.h :2377
   pragma Import (Stdcall, GetTapePosition, "GetTapePosition");
   --  winbase.h :2389
   pragma Import (Stdcall, PrepareTape, "PrepareTape");     --  winbase.h :2400
   pragma Import (Stdcall, EraseTape, "EraseTape");         --  winbase.h :2409
   pragma Import (Stdcall, CreateTapePartition, "CreateTapePartition");
   --  winbase.h :2418
   pragma Import (Stdcall, WriteTapemark, "WriteTapemark"); --  winbase.h :2428
   pragma Import (Stdcall, GetTapeStatus, "GetTapeStatus"); --  winbase.h :2438
   pragma Import (Stdcall, GetTapeParameters, "GetTapeParameters");
   --  winbase.h :2445
   pragma Import (Stdcall, SetTapeParameters, "SetTapeParameters");
   --  winbase.h :2458
   pragma Import (Stdcall, Beep, "Beep");                   --  winbase.h :2470
   pragma Import (Stdcall, OpenSound, "OpenSound");         --  winbase.h :2478
   pragma Import (Stdcall, CloseSound, "CloseSound");       --  winbase.h :2485
   pragma Import (Stdcall, StartSound, "StartSound");       --  winbase.h :2492
   pragma Import (Stdcall, StopSound, "StopSound");         --  winbase.h :2499
   pragma Import (Stdcall, WaitSoundState, "WaitSoundState");
   --  winbase.h :2506
   pragma Import (Stdcall, SyncAllVoices, "SyncAllVoices");
   --  winbase.h :2513
   pragma Import (Stdcall, CountVoiceNotes, "CountVoiceNotes");
   --  winbase.h :2520
   pragma Import (Stdcall, GetThresholdEvent, "GetThresholdEvent");
   --  winbase.h :2527
   pragma Import (Stdcall, GetThresholdStatus, "GetThresholdStatus");
   --  winbase.h :2534
   pragma Import (Stdcall, SetSoundNoise, "SetSoundNoise"); --  winbase.h :2541
   pragma Import (Stdcall, SetVoiceAccent, "SetVoiceAccent");
   --  winbase.h :2549
   pragma Import (Stdcall, SetVoiceEnvelope, "SetVoiceEnvelope");
   --  winbase.h :2560
   pragma Import (Stdcall, SetVoiceNote, "SetVoiceNote");   --  winbase.h :2569
   pragma Import (Stdcall, SetVoiceQueueSize, "SetVoiceQueueSize");
   --  winbase.h :2579
   pragma Import (Stdcall, SetVoiceSound, "SetVoiceSound"); --  winbase.h :2587
   pragma Import (Stdcall, SetVoiceThreshold, "SetVoiceThreshold");
   --  winbase.h :2596
   pragma Import (Stdcall, MulDiv, "MulDiv");               --  winbase.h :2604
   pragma Import (Stdcall, GetSystemTime, "GetSystemTime"); --  winbase.h :2613
   pragma Import (Stdcall, SetSystemTime, "SetSystemTime"); --  winbase.h :2620
   pragma Import (Stdcall, GetLocalTime, "GetLocalTime");   --  winbase.h :2627
   pragma Import (Stdcall, SetLocalTime, "SetLocalTime");   --  winbase.h :2634
   pragma Import (Stdcall, GetSystemInfo, "GetSystemInfo"); --  winbase.h :2641
   pragma Import (Stdcall, SystemTimeToTzSpecificLocalTime,
                    "SystemTimeToTzSpecificLocalTime");
   --  winbase.h :2658
   pragma Import (Stdcall, GetTimeZoneInformation, "GetTimeZoneInformation");
   --  winbase.h :2667
   pragma Import (Stdcall, SetTimeZoneInformation, "SetTimeZoneInformation");
   --  winbase.h :2674
   pragma Import (Stdcall, SystemTimeToFileTime, "SystemTimeToFileTime");
   --  winbase.h :2685
   pragma Import (Stdcall, FileTimeToLocalFileTime, "FileTimeToLocalFileTime");
   --  winbase.h :2693
   pragma Import (Stdcall, LocalFileTimeToFileTime, "LocalFileTimeToFileTime");
   --  winbase.h :2701
   pragma Import (Stdcall, FileTimeToSystemTime, "FileTimeToSystemTime");
   --  winbase.h :2709
   pragma Import (Stdcall, CompareFileTime, "CompareFileTime");
   --  winbase.h :2717
   pragma Import (Stdcall, FileTimeToDosDateTime, "FileTimeToDosDateTime");
   --  winbase.h :2725
   pragma Import (Stdcall, DosDateTimeToFileTime, "DosDateTimeToFileTime");
   --  winbase.h :2734
   pragma Import (Stdcall, GetTickCount, "GetTickCount");
   --  winbase.h :2743
   pragma Import (Stdcall, SetSystemTimeAdjustment, "SetSystemTimeAdjustment");
   --  winbase.h :2750
   pragma Import (Stdcall, GetSystemTimeAdjustment, "GetSystemTimeAdjustment");
   --  winbase.h :2758
   pragma Import (Stdcall, CreatePipe, "CreatePipe");
   --  winbase.h :2806
   pragma Import (Stdcall, ConnectNamedPipe, "ConnectNamedPipe");
   --  winbase.h :2816
   pragma Import (Stdcall, DisconnectNamedPipe, "DisconnectNamedPipe");
   --  winbase.h :2824
   pragma Import (Stdcall, SetNamedPipeHandleState, "SetNamedPipeHandleState");
   --  winbase.h :2831
   pragma Import (Stdcall, GetNamedPipeInfo, "GetNamedPipeInfo");
   --  winbase.h :2841
   pragma Import (Stdcall, PeekNamedPipe, "PeekNamedPipe");
   --  winbase.h :2852
   pragma Import (Stdcall, TransactNamedPipe, "TransactNamedPipe");
   --  winbase.h :2864
   pragma Import (Stdcall, CreateMailslotA, "CreateMailslotA");
   --  winbase.h :2877
   pragma Import (Stdcall, CreateMailslotW, "CreateMailslotW");
   --  winbase.h :2886
   pragma Import (Stdcall, GetMailslotInfo, "GetMailslotInfo");
   --  winbase.h :2901
   pragma Import (Stdcall, SetMailslotInfo, "SetMailslotInfo");
   --  winbase.h :2912
   pragma Import (Stdcall, MapViewOfFile, "MapViewOfFile");
   --  winbase.h :2920
   pragma Import (Stdcall, FlushViewOfFile, "FlushViewOfFile");
   --  winbase.h :2931
   pragma Import (Stdcall, UnmapViewOfFile, "UnmapViewOfFile");
   --  winbase.h :2939
   pragma Import (Stdcall, lstrcmpA, "lstrcmpA");
   --  winbase.h :2950
   pragma Import (Stdcall, lstrcmpW, "lstrcmpW");
   --  winbase.h :2957
   pragma Import (Stdcall, lstrcmpiA, "lstrcmpiA");
   --  winbase.h :2970
   pragma Import (Stdcall, lstrcmpiW, "lstrcmpiW");
   --  winbase.h :2977
   pragma Import (Stdcall, lstrcpynA, "lstrcpynA");
   --  winbase.h :2990
   pragma Import (Stdcall, lstrcpynW, "lstrcpynW");
   --  winbase.h :2998
   pragma Import (Stdcall, lstrcpyA, "lstrcpyA");
   --  winbase.h :3012
   pragma Import (Stdcall, lstrcpyW, "lstrcpyW");
   --  winbase.h :3019
   pragma Import (Stdcall, lstrcatA, "lstrcatA");
   --  winbase.h :3032
   pragma Import (Stdcall, lstrcatW, "lstrcatW");
   --  winbase.h :3039
   pragma Import (Stdcall, lstrlenA, "lstrlenA");
   --  winbase.h :3052
   pragma Import (Stdcall, lstrlenW, "lstrlenW");
   --  winbase.h :3058
   pragma Import (Stdcall, OpenFile, "OpenFile"); --  winbase.h         :3070
   pragma Import (Stdcall, lopen, "_lopen");      --  winbase.h :3079
   pragma Import (Stdcall, lcreat, "_lcreat");    --  winbase.h :3087
   pragma Import (Stdcall, lread, "_lread");      --  winbase.h :3095
   pragma Import (Stdcall, lwrite, "_lwrite");    --  winbase.h :3104
   pragma Import (Stdcall, hread, "_hread");      --  winbase.h :3113
   pragma Import (Stdcall, hwrite, "_hwrite");    --  winbase.h :3122
   pragma Import (Stdcall, lclose, "_lclose");    --  winbase.h :3131
   pragma Import (Stdcall, llseek, "_llseek");    --  winbase.h :3138
   pragma Import (Stdcall, IsTextUnicode, "IsTextUnicode");  --  winbase.h:3147
   pragma Import (Stdcall, TlsAlloc, "TlsAlloc");           --  winbase.h :3156
   pragma Import (Stdcall, TlsGetValue, "TlsGetValue");     --  winbase.h :3165
   pragma Import (Stdcall, TlsSetValue, "TlsSetValue");     --  winbase.h :3172
   pragma Import (Stdcall, TlsFree, "TlsFree");             --  winbase.h :3180
   pragma Import (Stdcall, SleepEx, "SleepEx");             --  winbase.h :3195
   pragma Import (Stdcall, WaitForSingleObjectEx, "WaitForSingleObjectEx");
   --  winbase.h :3203
   pragma Import (Stdcall, WaitForMultipleObjectsEx,
                    "WaitForMultipleObjectsEx");
   --  winbase.h :3212
   pragma Import (Stdcall, ReadFileEx, "ReadFileEx");       --  winbase.h :3223
   pragma Import (Stdcall, WriteFileEx, "WriteFileEx");     --  winbase.h :3234
   pragma Import (Stdcall, BackupRead, "BackupRead");       --  winbase.h :3245
   pragma Import (Stdcall, BackupSeek, "BackupSeek");       --  winbase.h :3258
   pragma Import (Stdcall, BackupWrite, "BackupWrite");     --  winbase.h :3270
   pragma Import (Stdcall, CreateMutexA, "CreateMutexA");   --  winbase.h :3413
   pragma Import (Stdcall, CreateMutexW, "CreateMutexW");   --  winbase.h :3421
   pragma Import (Stdcall, OpenMutexA, "OpenMutexA");       --  winbase.h :3435
   pragma Import (Stdcall, OpenMutexW, "OpenMutexW");       --  winbase.h :3443
   pragma Import (Stdcall, CreateEventA, "CreateEventA");   --  winbase.h :3457
   pragma Import (Stdcall, CreateEventW, "CreateEventW");   --  winbase.h :3466
   pragma Import (Stdcall, OpenEventA, "OpenEventA");       --  winbase.h :3481
   pragma Import (Stdcall, OpenEventW, "OpenEventW");       --  winbase.h :3489
   pragma Import (Stdcall, CreateSemaphoreA, "CreateSemaphoreA");
   --  winbase.h :3503
   pragma Import (Stdcall, CreateSemaphoreW, "CreateSemaphoreW");
   --  winbase.h :3512
   pragma Import (Stdcall, OpenSemaphoreA, "OpenSemaphoreA");
   --  winbase.h :3527
   pragma Import (Stdcall, OpenSemaphoreW, "OpenSemaphoreW");
   --  winbase.h :3535
   pragma Import (Stdcall, CreateFileMappingA, "CreateFileMappingA");
   --  winbase.h :3549
   pragma Import (Stdcall, CreateFileMappingW, "CreateFileMappingW");
   --  winbase.h :3560
   pragma Import (Stdcall, OpenFileMappingA, "OpenFileMappingA");
   --  winbase.h :3577
   pragma Import (Stdcall, OpenFileMappingW, "OpenFileMappingW");
   --  winbase.h :3585
   pragma Import (Stdcall, GetLogicalDriveStringsA, "GetLogicalDriveStringsA");
   --  winbase.h :3599
   pragma Import (Stdcall, GetLogicalDriveStringsW, "GetLogicalDriveStringsW");
   --  winbase.h :3606
   pragma Import (Stdcall, LoadLibraryA, "LoadLibraryA");   --  winbase.h :3619
   pragma Import (Stdcall, LoadLibraryW, "LoadLibraryW");   --  winbase.h :3625
   pragma Import (Stdcall, LoadLibraryExA, "LoadLibraryExA");
   --  winbase.h :3637
   pragma Import (Stdcall, LoadLibraryExW, "LoadLibraryExW");
   --  winbase.h :3645
   pragma Import (Stdcall, GetModuleFileNameA, "GetModuleFileNameA");
   --  winbase.h :3664
   pragma Import (Stdcall, GetModuleFileNameW, "GetModuleFileNameW");
   --  winbase.h :3672
   pragma Import (Stdcall, GetModuleHandleA, "GetModuleHandleA");
   --  winbase.h :3686
   pragma Import (Stdcall, GetModuleHandleW, "GetModuleHandleW");
   --  winbase.h :3692
   pragma Import (Stdcall, CreateProcessA, "CreateProcessA");
   --  winbase.h :3704
   pragma Import (Stdcall, CreateProcessW, "CreateProcessW");
   --  winbase.h :3719
   pragma Import (Stdcall, SetProcessShutdownParameters,
                    "SetProcessShutdownParameters");        --  winbase.h :3740
   pragma Import (Stdcall, GetProcessShutdownParameters,
                    "GetProcessShutdownParameters");        --  winbase.h :3748
   pragma Import (Stdcall, FatalAppExitA, "FatalAppExitA"); --  winbase.h :3756
   pragma Import (Stdcall, FatalAppExitW, "FatalAppExitW"); --  winbase.h :3763
   pragma Import (Stdcall, GetStartupInfoA, "GetStartupInfoA");
   --  winbase.h :3776
   pragma Import (Stdcall, GetStartupInfoW, "GetStartupInfoW");
   --  winbase.h :3782
   pragma Import (Stdcall, GetCommandLineA, "GetCommandLineA");
   --  winbase.h :3794
   pragma Import (Stdcall, GetCommandLineW, "GetCommandLineW");
   --  winbase.h :3800
   pragma Import (Stdcall, GetEnvironmentVariableA, "GetEnvironmentVariableA");
   --  winbase.h :3812
   pragma Import (Stdcall, GetEnvironmentVariableW, "GetEnvironmentVariableW");
   --  winbase.h :3820
   pragma Import (Stdcall, SetEnvironmentVariableA, "SetEnvironmentVariableA");
   --  winbase.h :3834
   pragma Import (Stdcall, SetEnvironmentVariableW, "SetEnvironmentVariableW");
   --  winbase.h :3841
   pragma Import (Stdcall, ExpandEnvironmentStringsA,
                    "ExpandEnvironmentStringsA");
   --  winbase.h :3854
   pragma Import (Stdcall, ExpandEnvironmentStringsW,
                    "ExpandEnvironmentStringsW");
   --  winbase.h :3862
   pragma Import (Stdcall, OutputDebugStringA, "OutputDebugStringA");
   --  winbase.h :3876
   pragma Import (Stdcall, OutputDebugStringW, "OutputDebugStringW");
   --  winbase.h :3882
   pragma Import (Stdcall, FindResourceA, "FindResourceA"); --  winbase.h :3894
   pragma Import (Stdcall, FindResourceW, "FindResourceW"); --  winbase.h :3902
   pragma Import (Stdcall, FindResourceExA, "FindResourceExA");
   --  winbase.h :3916
   pragma Import (Stdcall, FindResourceExW, "FindResourceExW");
   --  winbase.h :3925
   pragma Import (Stdcall, EnumResourceTypesA, "EnumResourceTypesA");
   --  winbase.h :3953
   pragma Import (Stdcall, EnumResourceTypesW, "EnumResourceTypesW");
   --  winbase.h :3961
   pragma Import (Stdcall, EnumResourceNamesA, "EnumResourceNamesA");
   --  winbase.h :3976
   pragma Import (Stdcall, EnumResourceNamesW, "EnumResourceNamesW");
   --  winbase.h :3985
   pragma Import (Stdcall, EnumResourceLanguagesA, "EnumResourceLanguagesA");
   --  winbase.h :4000
   pragma Import (Stdcall, EnumResourceLanguagesW, "EnumResourceLanguagesW");
   --  winbase.h :4010
   pragma Import (Stdcall, BeginUpdateResourceA, "BeginUpdateResourceA");
   --  winbase.h :4026
   pragma Import (Stdcall, BeginUpdateResourceW, "BeginUpdateResourceW");
   --  winbase.h :4033
   pragma Import (Stdcall, UpdateResourceA, "UpdateResourceA");
   --  winbase.h :4046
   pragma Import (Stdcall, UpdateResourceW, "UpdateResourceW");
   --  winbase.h :4057
   pragma Import (Stdcall, EndUpdateResourceA, "EndUpdateResourceA");
   --  winbase.h :4074
   pragma Import (Stdcall, EndUpdateResourceW, "EndUpdateResourceW");
   --  winbase.h :4081
   pragma Import (Stdcall, GlobalAddAtomA, "GlobalAddAtomA");
   --  winbase.h :4094
   pragma Import (Stdcall, GlobalAddAtomW, "GlobalAddAtomW");
   --  winbase.h :4100
   pragma Import (Stdcall, GlobalFindAtomA, "GlobalFindAtomA");
   --  winbase.h :4112
   pragma Import (Stdcall, GlobalFindAtomW, "GlobalFindAtomW");
   --  winbase.h :4118
   pragma Import (Stdcall, GlobalGetAtomNameA, "GlobalGetAtomNameA");
   --  winbase.h :4130
   pragma Import (Stdcall, GlobalGetAtomNameW, "GlobalGetAtomNameW");
   --  winbase.h :4138
   pragma Import (Stdcall, AddAtomA, "AddAtomA");           --  winbase.h :4152
   pragma Import (Stdcall, AddAtomW, "AddAtomW");           --  winbase.h :4158
   pragma Import (Stdcall, FindAtomA, "FindAtomA");         --  winbase.h :4170
   pragma Import (Stdcall, FindAtomW, "FindAtomW");         --  winbase.h :4176
   pragma Import (Stdcall, GetAtomNameA, "GetAtomNameA");   --  winbase.h :4188
   pragma Import (Stdcall, GetAtomNameW, "GetAtomNameW");   --  winbase.h :4196
   pragma Import (Stdcall, GetProfileIntA, "GetProfileIntA");
   --  winbase.h :4210
   pragma Import (Stdcall, GetProfileIntW, "GetProfileIntW");
   --  winbase.h :4218
   pragma Import (Stdcall, GetProfileStringA, "GetProfileStringA");
   --  winbase.h :4232
   pragma Import (Stdcall, GetProfileStringW, "GetProfileStringW");
   --  winbase.h :4242
   pragma Import (Stdcall, WriteProfileStringA, "WriteProfileStringA");
   --  winbase.h :4258
   pragma Import (Stdcall, WriteProfileStringW, "WriteProfileStringW");
   --  winbase.h :4266
   pragma Import (Stdcall, GetProfileSectionA, "GetProfileSectionA");
   --  winbase.h :4280
   pragma Import (Stdcall, GetProfileSectionW, "GetProfileSectionW");
   --  winbase.h :4288
   pragma Import (Stdcall, WriteProfileSectionA, "WriteProfileSectionA");
   --  winbase.h :4302
   pragma Import (Stdcall, WriteProfileSectionW, "WriteProfileSectionW");
   --  winbase.h :4309
   pragma Import (Stdcall, GetPrivateProfileIntA, "GetPrivateProfileIntA");
   --  winbase.h :4322
   pragma Import (Stdcall, GetPrivateProfileIntW, "GetPrivateProfileIntW");
   --  winbase.h :4331
   pragma Import (Stdcall, GetPrivateProfileStringA,
                    "GetPrivateProfileStringA");
   --  winbase.h :4346
   pragma Import (Stdcall, GetPrivateProfileStringW,
                    "GetPrivateProfileStringW");
   --  winbase.h :4357
   pragma Import (Stdcall, WritePrivateProfileStringA,
                    "WritePrivateProfileStringA");
   --  winbase.h :4374
   pragma Import (Stdcall, WritePrivateProfileStringW,
                    "WritePrivateProfileStringW");
   --  winbase.h :4383
   pragma Import (Stdcall, GetPrivateProfileSectionA,
                    "GetPrivateProfileSectionA");
   --  winbase.h :4398
   pragma Import (Stdcall, GetPrivateProfileSectionW,
                    "GetPrivateProfileSectionW");
   --  winbase.h :4407
   pragma Import (Stdcall, WritePrivateProfileSectionA,
                    "WritePrivateProfileSectionA");        --  winbase.h :4422
   pragma Import (Stdcall, WritePrivateProfileSectionW,
                    "WritePrivateProfileSectionW");        --  winbase.h :4430
   pragma Import (Stdcall, GetDriveTypeA, "GetDriveTypeA"); --  winbase.h :4444
   pragma Import (Stdcall, GetDriveTypeW, "GetDriveTypeW"); --  winbase.h :4450
   pragma Import (Stdcall, GetSystemDirectoryA, "GetSystemDirectoryA");
   --  winbase.h :4462
   pragma Import (Stdcall, GetSystemDirectoryW, "GetSystemDirectoryW");
   --  winbase.h :4469
   pragma Import (Stdcall, GetTempPathA, "GetTempPathA");   --  winbase.h :4482
   pragma Import (Stdcall, GetTempPathW, "GetTempPathW");   --  winbase.h :4489
   pragma Import (Stdcall, GetTempFileNameA, "GetTempFileNameA");
   --  winbase.h :4502
   pragma Import (Stdcall, GetTempFileNameW, "GetTempFileNameW");
   --  winbase.h :4511
   pragma Import (Stdcall, GetWindowsDirectoryA, "GetWindowsDirectoryA");
   --  winbase.h :4526
   pragma Import (Stdcall, GetWindowsDirectoryW, "GetWindowsDirectoryW");
   --  winbase.h :4533
   pragma Import (Stdcall, SetCurrentDirectoryA, "SetCurrentDirectoryA");
   --  winbase.h :4546
   pragma Import (Stdcall, SetCurrentDirectoryW, "SetCurrentDirectoryW");
   --  winbase.h :4552
   pragma Import (Stdcall, GetCurrentDirectoryA, "GetCurrentDirectoryA");
   --  winbase.h :4564
   pragma Import (Stdcall, GetCurrentDirectoryW, "GetCurrentDirectoryW");
   --  winbase.h :4571
   pragma Import (Stdcall, GetDiskFreeSpaceA, "GetDiskFreeSpaceA");
   --  winbase.h :4584
   pragma Import (Stdcall, GetDiskFreeSpaceW, "GetDiskFreeSpaceW");
   --  winbase.h :4594
   pragma Import (Stdcall, CreateDirectoryA, "CreateDirectoryA");
   --  winbase.h :4610
   pragma Import (Stdcall, CreateDirectoryW, "CreateDirectoryW");
   --  winbase.h :4617
   pragma Import (Stdcall, CreateDirectoryExA, "CreateDirectoryExA");
   --  winbase.h :4630
   pragma Import (Stdcall, CreateDirectoryExW, "CreateDirectoryExW");
   --  winbase.h :4638
   pragma Import (Stdcall, RemoveDirectoryA, "RemoveDirectoryA");
   --  winbase.h :4652
   pragma Import (Stdcall, RemoveDirectoryW, "RemoveDirectoryW");
   --  winbase.h :4658
   pragma Import (Stdcall, GetFullPathNameA, "GetFullPathNameA");
   --  winbase.h :4670
   pragma Import (Stdcall, GetFullPathNameW, "GetFullPathNameW");
   --  winbase.h :4679
   pragma Import (Stdcall, DefineDosDeviceA, "DefineDosDeviceA");
   --  winbase.h :4699
   pragma Import (Stdcall, DefineDosDeviceW, "DefineDosDeviceW");
   --  winbase.h :4707
   pragma Import (Stdcall, QueryDosDeviceA, "QueryDosDeviceA");
   --  winbase.h :4721
   pragma Import (Stdcall, QueryDosDeviceW, "QueryDosDeviceW");
   --  winbase.h :4729
   pragma Import (Stdcall, CreateFileA, "CreateFileA");     --  winbase.h :4745
   pragma Import (Stdcall, CreateFileW, "CreateFileW");     --  winbase.h :4757
   pragma Import (Stdcall, SetFileAttributesA, "SetFileAttributesA");
   --  winbase.h :4775
   pragma Import (Stdcall, SetFileAttributesW, "SetFileAttributesW");
   --  winbase.h :4782
   pragma Import (Stdcall, GetFileAttributesA, "GetFileAttributesA");
   --  winbase.h :4795
   pragma Import (Stdcall, GetFileAttributesW, "GetFileAttributesW");
   --  winbase.h :4801

   pragma Import (Stdcall, GetFileAttributesExA, "GetFileAttributesExA");
   pragma Import (Stdcall, GetFileAttributesExW, "GetFileAttributesExW");

   pragma Import (Stdcall, GetCompressedFileSizeA, "GetCompressedFileSizeA");
   --  winbase.h :4813
   pragma Import (Stdcall, GetCompressedFileSizeW, "GetCompressedFileSizeW");
   --  winbase.h :4820
   pragma Import (Stdcall, DeleteFileA, "DeleteFileA");     --  winbase.h :4833
   pragma Import (Stdcall, DeleteFileW, "DeleteFileW");     --  winbase.h :4839
   pragma Import (Stdcall, FindFirstFileA, "FindFirstFileA");
   --  winbase.h :4851
   pragma Import (Stdcall, FindFirstFileW, "FindFirstFileW");
   --  winbase.h :4858
   pragma Import (Stdcall, FindNextFileA, "FindNextFileA"); --  winbase.h :4871
   pragma Import (Stdcall, FindNextFileW, "FindNextFileW"); --  winbase.h :4878
   pragma Import (Stdcall, SearchPathA, "SearchPathA");     --  winbase.h :4891
   pragma Import (Stdcall, SearchPathW, "SearchPathW");     --  winbase.h :4902
   pragma Import (Stdcall, CopyFileA, "CopyFileA");         --  winbase.h :4919
   pragma Import (Stdcall, CopyFileW, "CopyFileW");         --  winbase.h :4927
   pragma Import (Stdcall, MoveFileA, "MoveFileA");         --  winbase.h :4941
   pragma Import (Stdcall, MoveFileW, "MoveFileW");         --  winbase.h :4948
   pragma Import (Stdcall, MoveFileExA, "MoveFileExA");     --  winbase.h :4961
   pragma Import (Stdcall, MoveFileExW, "MoveFileExW");     --  winbase.h :4969
   pragma Import (Stdcall, CreateNamedPipeA, "CreateNamedPipeA");
   --  winbase.h :4987
   pragma Import (Stdcall, CreateNamedPipeW, "CreateNamedPipeW");
   --  winbase.h :5000
   pragma Import (Stdcall, GetNamedPipeHandleStateA,
                    "GetNamedPipeHandleStateA");
   --  winbase.h :5019
   pragma Import (Stdcall, GetNamedPipeHandleStateW,
                    "GetNamedPipeHandleStateW");
   --  winbase.h :5031
   pragma Import (Stdcall, CallNamedPipeA, "CallNamedPipeA");
   --  winbase.h :5049
   pragma Import (Stdcall, CallNamedPipeW, "CallNamedPipeW");
   --  winbase.h :5061
   pragma Import (Stdcall, WaitNamedPipeA, "WaitNamedPipeA");
   --  winbase.h :5079
   pragma Import (Stdcall, WaitNamedPipeW, "WaitNamedPipeW");
   --  winbase.h :5086
   pragma Import (Stdcall, SetVolumeLabelA, "SetVolumeLabelA");
   --  winbase.h :5099
   pragma Import (Stdcall, SetVolumeLabelW, "SetVolumeLabelW");
   --  winbase.h :5106
   pragma Import (Stdcall, SetFileApisToOEM, "SetFileApisToOEM");
   --  winbase.h :5119
   pragma Import (Stdcall, SetFileApisToANSI, "SetFileApisToANSI");
   --  winbase.h :5124
   pragma Import (Stdcall, AreFileApisANSI, "AreFileApisANSI");
   --  winbase.h :5129
   pragma Import (Stdcall, GetVolumeInformationA, "GetVolumeInformationA");
   --  winbase.h :5134
   pragma Import (Stdcall, GetVolumeInformationW, "GetVolumeInformationW");
   --  winbase.h :5147
   pragma Import (Stdcall, ClearEventLogA, "ClearEventLogA");
   --  winbase.h :5170
   pragma Import (Stdcall, ClearEventLogW, "ClearEventLogW");
   --  winbase.h :5177
   pragma Import (Stdcall, BackupEventLogA, "BackupEventLogA");
   --  winbase.h :5190
   pragma Import (Stdcall, BackupEventLogW, "BackupEventLogW");
   --  winbase.h :5197
   pragma Import (Stdcall, CloseEventLog, "CloseEventLog");
   --  winbase.h :5210
   pragma Import (Stdcall, DeregisterEventSource, "DeregisterEventSource");
   --  winbase.h :5217
   pragma Import (Stdcall, NotifyChangeEventLog, "NotifyChangeEventLog");
   --  winbase.h :5224
   pragma Import (Stdcall, GetNumberOfEventLogRecords,
                    "GetNumberOfEventLogRecords");
   --  winbase.h :5232
   pragma Import (Stdcall, GetOldestEventLogRecord, "GetOldestEventLogRecord");
   --  winbase.h :5240
   pragma Import (Stdcall, OpenEventLogA, "OpenEventLogA"); --  winbase.h :5248
   pragma Import (Stdcall, OpenEventLogW, "OpenEventLogW"); --  winbase.h :5255
   pragma Import (Stdcall, RegisterEventSourceA, "RegisterEventSourceA");
   --  winbase.h :5268
   pragma Import (Stdcall, RegisterEventSourceW, "RegisterEventSourceW");
   --  winbase.h :5275
   pragma Import (Stdcall, OpenBackupEventLogA, "OpenBackupEventLogA");
   --  winbase.h :5288
   pragma Import (Stdcall, OpenBackupEventLogW, "OpenBackupEventLogW");
   --  winbase.h :5295
   pragma Import (Stdcall, ReadEventLogA, "ReadEventLogA"); --  winbase.h :5308
   pragma Import (Stdcall, ReadEventLogW, "ReadEventLogW"); --  winbase.h :5320
   pragma Import (Stdcall, ReportEventA, "ReportEventA");   --  winbase.h :5338
   pragma Import (Stdcall, ReportEventW, "ReportEventW");   --  winbase.h :5352
   pragma Import (Stdcall, DuplicateToken, "DuplicateToken");
   --  winbase.h :5378
   pragma Import (Stdcall, GetKernelObjectSecurity, "GetKernelObjectSecurity");
   --  winbase.h :5387
   pragma Import (Stdcall, ImpersonateNamedPipeClient,
                    "ImpersonateNamedPipeClient");
   --  winbase.h :5398
   pragma Import (Stdcall, ImpersonateSelf, "ImpersonateSelf");
   --  winbase.h :5405
   pragma Import (Stdcall, RevertToSelf, "RevertToSelf");   --  winbase.h :5413
   pragma Import (Stdcall, SetThreadToken, "SetThreadToken");
   --  winbase.h :5420
   pragma Import (Stdcall, AccessCheck, "AccessCheck");     --  winbase.h :5428
   pragma Import (Stdcall, OpenProcessToken, "OpenProcessToken");
   --  winbase.h :5443
   pragma Import (Stdcall, OpenThreadToken, "OpenThreadToken");
   --  winbase.h :5453
   pragma Import (Stdcall, GetTokenInformation, "GetTokenInformation");
   --  winbase.h :5464
   pragma Import (Stdcall, SetTokenInformation, "SetTokenInformation");
   --  winbase.h :5476
   pragma Import (Stdcall, AdjustTokenPrivileges, "AdjustTokenPrivileges");
   --  winbase.h :5487
   pragma Import (Stdcall, AdjustTokenGroups, "AdjustTokenGroups");
   --  winbase.h :5500
   pragma Import (Stdcall, PrivilegeCheck, "PrivilegeCheck");
   --  winbase.h :5513
   pragma Import (Stdcall, AccessCheckAndAuditAlarmA,
                    "AccessCheckAndAuditAlarmA");
   --  winbase.h :5523
   pragma Import (Stdcall, AccessCheckAndAuditAlarmW,
                    "AccessCheckAndAuditAlarmW");
   --  winbase.h :5539
   pragma Import (Stdcall, ObjectOpenAuditAlarmA, "ObjectOpenAuditAlarmA");
   --  winbase.h :5562
   pragma Import (Stdcall, ObjectOpenAuditAlarmW, "ObjectOpenAuditAlarmW");
   --  winbase.h :5579
   pragma Import (Stdcall, ObjectPrivilegeAuditAlarmA,
                    "ObjectPrivilegeAuditAlarmA");
   --  winbase.h :5603
   pragma Import (Stdcall, ObjectPrivilegeAuditAlarmW,
                    "ObjectPrivilegeAuditAlarmW");
   --  winbase.h :5614
   pragma Import (Stdcall, ObjectCloseAuditAlarmA, "ObjectCloseAuditAlarmA");
   --  winbase.h :5632
   pragma Import (Stdcall, ObjectCloseAuditAlarmW, "ObjectCloseAuditAlarmW");
   --  winbase.h :5640
   pragma Import (Stdcall, PrivilegedServiceAuditAlarmA,
                    "PrivilegedServiceAuditAlarmA");        --  winbase.h :5655
   pragma Import (Stdcall, PrivilegedServiceAuditAlarmW,
                    "PrivilegedServiceAuditAlarmW");        --  winbase.h :5665

   pragma Import (Stdcall, IsValidSid, "IsValidSid");       --  winbase.h :5682
   pragma Import (Stdcall, EqualSid, "EqualSid");           --  winbase.h :5690
   pragma Import (Stdcall, EqualPrefixSid, "EqualPrefixSid");
   --  winbase.h :5699

   pragma Import (Stdcall, GetSidLengthRequired, "GetSidLengthRequired");
   --  winbase.h :5708
   pragma Import (Stdcall, AllocateAndInitializeSid,
                    "AllocateAndInitializeSid");
   --  winbase.h :5716
   pragma Import (Stdcall, FreeSid, "FreeSid");             --  winbase.h :5733
   pragma Import (Stdcall, InitializeSid, "InitializeSid"); --  winbase.h :5740
   pragma Import (Stdcall, GetSidIdentifierAuthority,
                    "GetSidIdentifierAuthority");
   --  winbase.h :5750
   pragma Import (Stdcall, GetSidSubAuthority, "GetSidSubAuthority");
   --  winbase.h :5758
   pragma Import (Stdcall, GetSidSubAuthorityCount, "GetSidSubAuthorityCount");
   --  winbase.h :5767
   pragma Import (Stdcall, GetLengthSid, "GetLengthSid");   --  winbase.h :5775
   pragma Import (Stdcall, CopySid, "CopySid");             --  winbase.h :5783
   pragma Import (Stdcall, AreAllAccessesGranted, "AreAllAccessesGranted");
   --  winbase.h :5793
   pragma Import (Stdcall, AreAnyAccessesGranted, "AreAnyAccessesGranted");
   --  winbase.h :5802
   pragma Import (Stdcall, MapGenericMask, "MapGenericMask");
   --  winbase.h :5811
   pragma Import (Stdcall, IsValidAcl, "IsValidAcl");       --  winbase.h :5820
   pragma Import (Stdcall, InitializeAcl, "InitializeAcl"); --  winbase.h :5828
   pragma Import (Stdcall, GetAclInformation, "GetAclInformation");
   --  winbase.h :5838
   pragma Import (Stdcall, SetAclInformation, "SetAclInformation");
   --  winbase.h :5849
   pragma Import (Stdcall, AddAce, "AddAce");               --  winbase.h :5860
   pragma Import (Stdcall, DeleteAce, "DeleteAce");         --  winbase.h :5872
   pragma Import (Stdcall, GetAce, "GetAce");               --  winbase.h :5881
   pragma Import (Stdcall, AddAccessAllowedAce, "AddAccessAllowedAce");
   --  winbase.h :5891
   pragma Import (Stdcall, AddAccessDeniedAce, "AddAccessDeniedAce");
   --  winbase.h :5902
   pragma Import (Stdcall, AddAuditAccessAce, "AddAuditAccessAce");
   --  winbase.h :5913
   pragma Import (Stdcall, FindFirstFreeAce, "FindFirstFreeAce");
   --  winbase.h :5926
   pragma Import (Stdcall, InitializeSecurityDescriptor,
                    "InitializeSecurityDescriptor");       --  winbase.h :5935

   pragma Import (Stdcall, IsValidSecurityDescriptor,
                    "IsValidSecurityDescriptor");
   --  winbase.h :5944
   pragma Import (Stdcall, GetSecurityDescriptorLength,
                    "GetSecurityDescriptorLength");        --  winbase.h :5952

   pragma Import (Stdcall, GetSecurityDescriptorControl,
                    "GetSecurityDescriptorControl");       --  winbase.h :5960

   pragma Import (Stdcall, SetSecurityDescriptorDacl,
                    "SetSecurityDescriptorDacl");
   --  winbase.h :5970
   pragma Import (Stdcall, GetSecurityDescriptorDacl,
                    "GetSecurityDescriptorDacl");
   --  winbase.h :5981
   pragma Import (Stdcall, SetSecurityDescriptorSacl,
                    "SetSecurityDescriptorSacl");
   --  winbase.h :5992
   pragma Import (Stdcall, GetSecurityDescriptorSacl,
                    "GetSecurityDescriptorSacl");
   --  winbase.h :6003
   pragma Import (Stdcall, SetSecurityDescriptorOwner,
                    "SetSecurityDescriptorOwner");
   --  winbase.h :6014
   pragma Import (Stdcall, GetSecurityDescriptorOwner,
                    "GetSecurityDescriptorOwner");
   --  winbase.h :6024
   pragma Import (Stdcall, SetSecurityDescriptorGroup,
                    "SetSecurityDescriptorGroup");
   --  winbase.h :6034
   pragma Import (Stdcall, GetSecurityDescriptorGroup,
                    "GetSecurityDescriptorGroup");
   --  winbase.h :6044
   pragma Import (Stdcall, CreatePrivateObjectSecurity,
                    "CreatePrivateObjectSecurity");        --  winbase.h :6054
   pragma Import (Stdcall, SetPrivateObjectSecurity,
                    "SetPrivateObjectSecurity");
   --  winbase.h :6067
   pragma Import (Stdcall, GetPrivateObjectSecurity,
                    "GetPrivateObjectSecurity");
   --  winbase.h :6079
   pragma Import (Stdcall, DestroyPrivateObjectSecurity,
                    "DestroyPrivateObjectSecurity");       --  winbase.h :6091
   pragma Import (Stdcall, MakeSelfRelativeSD, "MakeSelfRelativeSD");
   --  winbase.h :6099
   pragma Import (Stdcall, MakeAbsoluteSD, "MakeAbsoluteSD");
   --  winbase.h :6109
   pragma Import (Stdcall, SetFileSecurityA, "SetFileSecurityA");
   --  winbase.h :6127
   pragma Import (Stdcall, SetFileSecurityW, "SetFileSecurityW");
   --  winbase.h :6135
   pragma Import (Stdcall, GetFileSecurityA, "GetFileSecurityA");
   --  winbase.h :6150
   pragma Import (Stdcall, GetFileSecurityW, "GetFileSecurityW");
   --  winbase.h :6160
   pragma Import (Stdcall, SetKernelObjectSecurity, "SetKernelObjectSecurity");
   --  winbase.h :6177
   pragma Import (Stdcall, FindFirstChangeNotificationA,
                    "FindFirstChangeNotificationA");       --  winbase.h :6188
   pragma Import (Stdcall, FindFirstChangeNotificationW,
                    "FindFirstChangeNotificationW");       --  winbase.h :6196
   pragma Import (Stdcall, FindNextChangeNotification,
                    "FindNextChangeNotification");
   --  winbase.h :6210
   pragma Import (Stdcall, FindCloseChangeNotification,
                    "FindCloseChangeNotification");         --  winbase.h :6217
   pragma Import (Stdcall, VirtualLock, "VirtualLock");     --  winbase.h :6224
   pragma Import (Stdcall, VirtualUnlock, "VirtualUnlock"); --  winbase.h :6232
   pragma Import (Stdcall, MapViewOfFileEx, "MapViewOfFileEx");
   --  winbase.h :6240
   pragma Import (Stdcall, SetPriorityClass, "SetPriorityClass");
   --  winbase.h :6252
   pragma Import (Stdcall, GetPriorityClass, "GetPriorityClass");
   --  winbase.h :6260
   pragma Import (Stdcall, IsBadReadPtr, "IsBadReadPtr");   --  winbase.h :6267
   pragma Import (Stdcall, IsBadWritePtr, "IsBadWritePtr"); --  winbase.h :6275
   pragma Import (Stdcall, IsBadHugeReadPtr, "IsBadHugeReadPtr");
   --  winbase.h :6283
   pragma Import (Stdcall, IsBadHugeWritePtr, "IsBadHugeWritePtr");
   --  winbase.h :6291
   pragma Import (Stdcall, IsBadCodePtr, "IsBadCodePtr");   --  winbase.h :6299
   pragma Import (Stdcall, IsBadStringPtrA, "IsBadStringPtrA");
   --  winbase.h :6306
   pragma Import (Stdcall, IsBadStringPtrW, "IsBadStringPtrW");
   --  winbase.h :6313
   pragma Import (Stdcall, LookupAccountSidA, "LookupAccountSidA");
   --  winbase.h :6326
   pragma Import (Stdcall, LookupAccountSidW, "LookupAccountSidW");
   --  winbase.h :6338
   pragma Import (Stdcall, LookupAccountNameA, "LookupAccountNameA");
   --  winbase.h :6356
   pragma Import (Stdcall, LookupAccountNameW, "LookupAccountNameW");
   --  winbase.h :6368
   pragma Import (Stdcall, LookupPrivilegeValueA, "LookupPrivilegeValueA");
   --  winbase.h :6386
   pragma Import (Stdcall, LookupPrivilegeValueW, "LookupPrivilegeValueW");
   --  winbase.h :6394
   pragma Import (Stdcall, LookupPrivilegeNameA, "LookupPrivilegeNameA");
   --  winbase.h :6408
   pragma Import (Stdcall, LookupPrivilegeNameW, "LookupPrivilegeNameW");
   --  winbase.h :6417
   pragma Import (Stdcall, LookupPrivilegeDisplayNameA,
                    "LookupPrivilegeDisplayNameA");        --  winbase.h :6432
   pragma Import (Stdcall, LookupPrivilegeDisplayNameW,
                    "LookupPrivilegeDisplayNameW");        --  winbase.h :6442
   pragma Import (Stdcall, AllocateLocallyUniqueId, "AllocateLocallyUniqueId");
   --  winbase.h :6458
   pragma Import (Stdcall, BuildCommDCBA, "BuildCommDCBA"); --  winbase.h :6465
   pragma Import (Stdcall, BuildCommDCBW, "BuildCommDCBW"); --  winbase.h :6472
   pragma Import (Stdcall, BuildCommDCBAndTimeoutsA,
                    "BuildCommDCBAndTimeoutsA");
   --  winbase.h :6485
   pragma Import (Stdcall, BuildCommDCBAndTimeoutsW,
                    "BuildCommDCBAndTimeoutsW");
   --  winbase.h :6493
   pragma Import (Stdcall, CommConfigDialogA, "CommConfigDialogA");
   --  winbase.h :6507
   pragma Import (Stdcall, CommConfigDialogW, "CommConfigDialogW");
   --  winbase.h :6515
   pragma Import (Stdcall, GetDefaultCommConfigA, "GetDefaultCommConfigA");
   --  winbase.h :6529
   pragma Import (Stdcall, GetDefaultCommConfigW, "GetDefaultCommConfigW");
   --  winbase.h :6537
   pragma Import (Stdcall, SetDefaultCommConfigA, "SetDefaultCommConfigA");
   --  winbase.h :6551
   pragma Import (Stdcall, SetDefaultCommConfigW, "SetDefaultCommConfigW");
   --  winbase.h :6559
   pragma Import (Stdcall, GetComputerNameA, "GetComputerNameA");
   --  winbase.h :6576
   pragma Import (Stdcall, GetComputerNameW, "GetComputerNameW");
   --  winbase.h :6583
   pragma Import (Stdcall, SetComputerNameA, "SetComputerNameA");
   --  winbase.h :6596
   pragma Import (Stdcall, SetComputerNameW, "SetComputerNameW");
   --  winbase.h :6602
   pragma Import (Stdcall, GetUserNameA, "GetUserNameA");  --  winbase.h :6614
   pragma Import (Stdcall, GetUserNameW, "GetUserNameW");  --  winbase.h :6621
   pragma Import (Stdcall, QueryPerformanceCounter, "QueryPerformanceCounter");
   --  winbase.h :6638
   pragma Import (Stdcall, QueryPerformanceFrequency,
                    "QueryPerformanceFrequency");
   --  winbase.h :6645
   pragma Import (Stdcall, GetVersionExA, "GetVersionExA"); --  winbase.h :6686
   pragma Import (Stdcall, GetVersionExW, "GetVersionExW"); --  winbase.h :6692

end Win32.Winbase;
