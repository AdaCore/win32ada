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

with Ada.Unchecked_Conversion;
with Stdarg;
with Win32.Windef;
with Win32.Winnt;

package Win32.Winbase is

   INVALID_HANDLE_VALUE               : constant Win32.Winnt.HANDLE;
   INVALID_FILE_SIZE                  : constant DWORD := 16#ffffffff#;
   FILE_BEGIN                         : constant := 0;
   FILE_CURRENT                       : constant := 1;
   FILE_END                           : constant := 2;
   TIME_ZONE_ID_INVALID               : constant DWORD := 16#ffffffff#;
   WAIT_FAILED                        : constant DWORD := 16#ffffffff#;
   WAIT_OBJECT_0                      : DWORD renames
     Win32.Winnt.STATUS_WAIT_0;
   WAIT_ABANDONED                     : DWORD renames
     Win32.Winnt.STATUS_ABANDONED_WAIT_0;
   WAIT_ABANDONED_0                   : DWORD renames
     Win32.Winnt.STATUS_ABANDONED_WAIT_0;
   WAIT_TIMEOUT                       : DWORD renames
     Win32.Winnt.STATUS_TIMEOUT;
   WAIT_IO_COMPLETION                 : DWORD renames
     Win32.Winnt.STATUS_USER_APC;
   STILL_ACTIVE                       : DWORD renames
     Win32.Winnt.STATUS_PENDING;
   EXCEPTION_ACCESS_VIOLATION         : DWORD renames
     Win32.Winnt.STATUS_ACCESS_VIOLATION;
   EXCEPTION_DATATYPE_MISALIGNMENT    : DWORD renames
     Win32.Winnt.STATUS_DATATYPE_MISALIGNMENT;
   EXCEPTION_BREAKPOINT               : DWORD renames
     Win32.Winnt.STATUS_BREAKPOINT;
   EXCEPTION_SINGLE_STEP              : DWORD renames
     Win32.Winnt.STATUS_SINGLE_STEP;
   EXCEPTION_ARRAY_BOUNDS_EXCEEDED    : DWORD renames
     Win32.Winnt.STATUS_ARRAY_BOUNDS_EXCEEDED;
   EXCEPTION_FLT_DENORMAL_OPERAND     : DWORD renames
     Win32.Winnt.STATUS_FLOAT_DENORMAL_OPERAND;
   EXCEPTION_FLT_DIVIDE_BY_ZERO       : DWORD renames
     Win32.Winnt.STATUS_FLOAT_DIVIDE_BY_ZERO;
   EXCEPTION_FLT_INEXACT_RESULT       : DWORD renames
     Win32.Winnt.STATUS_FLOAT_INEXACT_RESULT;
   EXCEPTION_FLT_INVALID_OPERATION    : DWORD renames
     Win32.Winnt.STATUS_FLOAT_INVALID_OPERATION;
   EXCEPTION_FLT_OVERFLOW             : DWORD renames
     Win32.Winnt.STATUS_FLOAT_OVERFLOW;
   EXCEPTION_FLT_STACK_CHECK          : DWORD renames
     Win32.Winnt.STATUS_FLOAT_STACK_CHECK;
   EXCEPTION_FLT_UNDERFLOW            : DWORD renames
     Win32.Winnt.STATUS_FLOAT_UNDERFLOW;
   EXCEPTION_INT_DIVIDE_BY_ZERO       : DWORD renames
     Win32.Winnt.STATUS_INTEGER_DIVIDE_BY_ZERO;
   EXCEPTION_INT_OVERFLOW             : DWORD renames
     Win32.Winnt.STATUS_INTEGER_OVERFLOW;
   EXCEPTION_PRIV_INSTRUCTION         : DWORD renames
     Win32.Winnt.STATUS_PRIVILEGED_INSTRUCTION;
   EXCEPTION_IN_PAGE_ERROR            : DWORD renames
     Win32.Winnt.STATUS_IN_PAGE_ERROR;
   EXCEPTION_ILLEGAL_INSTRUCTION      : DWORD renames
     Win32.Winnt.STATUS_ILLEGAL_INSTRUCTION;
   EXCEPTION_NONCONTINUABLE_EXCEPTION : DWORD renames
     Win32.Winnt.STATUS_NONCONTINUABLE_EXCEPTION;
   EXCEPTION_STACK_OVERFLOW           : DWORD renames
     Win32.Winnt.STATUS_STACK_OVERFLOW;
   EXCEPTION_INVALID_DISPOSITION      : DWORD renames
     Win32.Winnt.STATUS_INVALID_DISPOSITION;
   EXCEPTION_GUARD_PAGE               : DWORD renames
     Win32.Winnt.STATUS_GUARD_PAGE_VIOLATION;
   CONTROL_C_EXIT                     : DWORD renames
     Win32.Winnt.STATUS_CONTROL_C_EXIT;
   FILE_FLAG_WRITE_THROUGH            : constant := 16#80000000#;
   FILE_FLAG_OVERLAPPED               : constant := 16#40000000#;
   FILE_FLAG_NO_BUFFERING             : constant := 16#20000000#;
   FILE_FLAG_RANDOM_ACCESS            : constant := 16#10000000#;
   FILE_FLAG_SEQUENTIAL_SCAN          : constant := 16#8000000#;
   FILE_FLAG_DELETE_ON_CLOSE          : constant := 16#4000000#;
   FILE_FLAG_BACKUP_SEMANTICS         : constant := 16#2000000#;
   FILE_FLAG_POSIX_SEMANTICS          : constant := 16#1000000#;
   CREATE_NEW                         : constant := 1;
   CREATE_ALWAYS                      : constant := 2;
   OPEN_EXISTING                      : constant := 3;
   OPEN_ALWAYS                        : constant := 4;
   TRUNCATE_EXISTING                  : constant := 5;
   PIPE_ACCESS_INBOUND                : constant := 16#1#;
   PIPE_ACCESS_OUTBOUND               : constant := 16#2#;
   PIPE_ACCESS_DUPLEX                 : constant := 16#3#;
   PIPE_CLIENT_END                    : constant := 16#0#;
   PIPE_SERVER_END                    : constant := 16#1#;
   PIPE_WAIT                          : constant := 16#0#;
   PIPE_NOWAIT                        : constant := 16#1#;
   PIPE_READMODE_BYTE                 : constant := 16#0#;
   PIPE_READMODE_MESSAGE              : constant := 16#2#;
   PIPE_TYPE_BYTE                     : constant := 16#0#;
   PIPE_TYPE_MESSAGE                  : constant := 16#4#;
   PIPE_UNLIMITED_INSTANCES           : constant := 255;
   SECURITY_ANONYMOUS                 : constant :=
     Win32.Winnt.SECURITY_IMPERSONATION_LEVEL'Pos
          (Win32.Winnt.SecurityAnonymous) *
     2 ** 16;
   SECURITY_IDENTIFICATION            : constant :=
     Win32.Winnt.SECURITY_IMPERSONATION_LEVEL'Pos
          (Win32.Winnt.SecurityIdentification) *
     2 ** 16;

   SECURITY_IMPERSONATION : constant :=
     Win32.Winnt.SECURITY_IMPERSONATION_LEVEL'Pos
          (Win32.Winnt.SecurityImpersonation) *
     2 ** 16;

   SECURITY_DELEGATION : constant :=
     Win32.Winnt.SECURITY_IMPERSONATION_LEVEL'Pos
          (Win32.Winnt.SecurityDelegation) *
     2 ** 16;

   SECURITY_CONTEXT_TRACKING     : constant := 16#40000#;
   SECURITY_EFFECTIVE_ONLY       : constant := 16#80000#;
   SECURITY_SQOS_PRESENT         : constant := 16#100000#;
   SECURITY_VALID_SQOS_FLAGS     : constant := 16#1f0000#;
   MUTEX_MODIFY_STATE            : constant := 16#1#;
   MUTEX_ALL_ACCESS              : constant := 16#1f0001#;
   SP_SERIALCOMM                 : constant DWORD := 16#1#;
   PST_UNSPECIFIED               : constant DWORD := 16#0#;
   PST_RS232                     : constant DWORD := 16#1#;
   PST_PARALLELPORT              : constant DWORD := 16#2#;
   PST_RS422                     : constant DWORD := 16#3#;
   PST_RS423                     : constant DWORD := 16#4#;
   PST_RS449                     : constant DWORD := 16#5#;
   PST_MODEM                     : constant DWORD := 16#6#;
   PST_FAX                       : constant DWORD := 16#21#;
   PST_SCANNER                   : constant DWORD := 16#22#;
   PST_NETWORK_BRIDGE            : constant DWORD := 16#100#;
   PST_LAT                       : constant DWORD := 16#101#;
   PST_TCPIP_TELNET              : constant DWORD := 16#102#;
   PST_X25                       : constant DWORD := 16#103#;
   PCF_DTRDSR                    : constant DWORD := 16#1#;
   PCF_RTSCTS                    : constant DWORD := 16#2#;
   PCF_RLSD                      : constant DWORD := 16#4#;
   PCF_PARITY_CHECK              : constant DWORD := 16#8#;
   PCF_XONXOFF                   : constant DWORD := 16#10#;
   PCF_SETXCHAR                  : constant DWORD := 16#20#;
   PCF_TOTALTIMEOUTS             : constant DWORD := 16#40#;
   PCF_INTTIMEOUTS               : constant DWORD := 16#80#;
   PCF_SPECIALCHARS              : constant DWORD := 16#100#;
   PCF_16BITMODE                 : constant DWORD := 16#200#;
   SP_PARITY                     : constant DWORD := 16#1#;
   SP_BAUD                       : constant DWORD := 16#2#;
   SP_DATABITS                   : constant DWORD := 16#4#;
   SP_STOPBITS                   : constant DWORD := 16#8#;
   SP_HANDSHAKING                : constant DWORD := 16#10#;
   SP_PARITY_CHECK               : constant DWORD := 16#20#;
   SP_RLSD                       : constant DWORD := 16#40#;
   BAUD_075                      : constant DWORD := 16#1#;
   BAUD_110                      : constant DWORD := 16#2#;
   BAUD_134_5                    : constant DWORD := 16#4#;
   BAUD_150                      : constant DWORD := 16#8#;
   BAUD_300                      : constant DWORD := 16#10#;
   BAUD_600                      : constant DWORD := 16#20#;
   BAUD_1200                     : constant DWORD := 16#40#;
   BAUD_1800                     : constant DWORD := 16#80#;
   BAUD_2400                     : constant DWORD := 16#100#;
   BAUD_4800                     : constant DWORD := 16#200#;
   BAUD_7200                     : constant DWORD := 16#400#;
   BAUD_9600                     : constant DWORD := 16#800#;
   BAUD_14400                    : constant DWORD := 16#1000#;
   BAUD_19200                    : constant DWORD := 16#2000#;
   BAUD_38400                    : constant DWORD := 16#4000#;
   BAUD_56K                      : constant DWORD := 16#8000#;
   BAUD_128K                     : constant DWORD := 16#10000#;
   BAUD_115200                   : constant DWORD := 16#20000#;
   BAUD_57600                    : constant DWORD := 16#40000#;
   BAUD_USER                     : constant DWORD := 16#10000000#;
   DATABITS_5                    : constant WORD  := 16#1#;
   DATABITS_6                    : constant WORD  := 16#2#;
   DATABITS_7                    : constant WORD  := 16#4#;
   DATABITS_8                    : constant WORD  := 16#8#;
   DATABITS_16                   : constant WORD  := 16#10#;
   DATABITS_16X                  : constant WORD  := 16#20#;
   STOPBITS_10                   : constant WORD  := 16#1#;
   STOPBITS_15                   : constant WORD  := 16#2#;
   STOPBITS_20                   : constant WORD  := 16#4#;
   PARITY_NONE                   : constant WORD  := 16#100#;
   PARITY_ODD                    : constant WORD  := 16#200#;
   PARITY_EVEN                   : constant WORD  := 16#400#;
   PARITY_MARK                   : constant WORD  := 16#800#;
   PARITY_SPACE                  : constant WORD  := 16#1000#;
   COMMPROP_INITIALIZED          : constant DWORD := 16#e73cf52e#;
   DTR_CONTROL_DISABLE           : constant := 16#0#;
   DTR_CONTROL_ENABLE            : constant := 16#1#;
   DTR_CONTROL_HANDSHAKE         : constant := 16#2#;
   RTS_CONTROL_DISABLE           : constant := 16#0#;
   RTS_CONTROL_ENABLE            : constant := 16#1#;
   RTS_CONTROL_HANDSHAKE         : constant := 16#2#;
   RTS_CONTROL_TOGGLE            : constant := 16#3#;
   GMEM_FIXED                    : constant := 16#0#;
   GMEM_MOVEABLE                 : constant := 16#2#;
   GMEM_NOCOMPACT                : constant := 16#10#;
   GMEM_NODISCARD                : constant := 16#20#;
   GMEM_ZEROINIT                 : constant := 16#40#;
   GMEM_MODIFY                   : constant := 16#80#;
   GMEM_DISCARDABLE              : constant := 16#100#;
   GMEM_NOT_BANKED               : constant := 16#1000#;
   GMEM_SHARE                    : constant := 16#2000#;
   GMEM_DDESHARE                 : constant := 16#2000#;
   GMEM_NOTIFY                   : constant := 16#4000#;
   GMEM_LOWER                    : constant := 16#1000#;
   GMEM_VALID_FLAGS              : constant := 16#7f72#;
   GMEM_INVALID_HANDLE           : constant := 16#8000#;
   GHND                          : constant := 16#42#;
   GPTR                          : constant := 16#40#;
   GMEM_DISCARDED                : constant := 16#4000#;
   GMEM_LOCKCOUNT                : constant := 16#ff#;
   LMEM_FIXED                    : constant := 16#0#;
   LMEM_MOVEABLE                 : constant := 16#2#;
   LMEM_NOCOMPACT                : constant := 16#10#;
   LMEM_NODISCARD                : constant := 16#20#;
   LMEM_ZEROINIT                 : constant := 16#40#;
   LMEM_MODIFY                   : constant := 16#80#;
   LMEM_DISCARDABLE              : constant := 16#f00#;
   LMEM_VALID_FLAGS              : constant := 16#f72#;
   LMEM_INVALID_HANDLE           : constant := 16#8000#;
   LHND                          : constant := 16#42#;
   LPTR                          : constant := 16#40#;
   NONZEROLHND                   : constant := 16#2#;
   NONZEROLPTR                   : constant := 16#0#;
   LMEM_DISCARDED                : constant := 16#4000#;
   LMEM_LOCKCOUNT                : constant := 16#ff#;
   DEBUG_PROCESS                 : constant := 16#1#;
   DEBUG_ONLY_THIS_PROCESS       : constant := 16#2#;
   CREATE_SUSPENDED              : constant := 16#4#;
   DETACHED_PROCESS              : constant := 16#8#;
   CREATE_NEW_CONSOLE            : constant := 16#10#;
   NORMAL_PRIORITY_CLASS         : constant := 16#20#;
   IDLE_PRIORITY_CLASS           : constant := 16#40#;
   HIGH_PRIORITY_CLASS           : constant := 16#80#;
   REALTIME_PRIORITY_CLASS       : constant := 16#100#;
   CREATE_NEW_PROCESS_GROUP      : constant := 16#200#;
   CREATE_UNICODE_ENVIRONMENT    : constant := 16#400#;
   CREATE_SEPARATE_WOW_VDM       : constant := 16#800#;
   CREATE_DEFAULT_ERROR_MODE     : constant := 16#4000000#;
   CREATE_NO_WINDOW              : constant := 16#8000000#;
   THREAD_PRIORITY_LOWEST        : constant := -2;
   THREAD_PRIORITY_BELOW_NORMAL  : constant := -1;
   THREAD_PRIORITY_NORMAL        : constant := 0;
   THREAD_PRIORITY_HIGHEST       : constant := 2;
   THREAD_PRIORITY_ABOVE_NORMAL  : constant := 1;
   THREAD_PRIORITY_ERROR_RETURN  : constant := 16#7fffffff#;
   THREAD_PRIORITY_TIME_CRITICAL : constant := 15;
   THREAD_PRIORITY_IDLE          : constant := -15;
   EXCEPTION_DEBUG_EVENT         : constant := 1;
   CREATE_THREAD_DEBUG_EVENT     : constant := 2;
   CREATE_PROCESS_DEBUG_EVENT    : constant := 3;
   EXIT_THREAD_DEBUG_EVENT       : constant := 4;
   EXIT_PROCESS_DEBUG_EVENT      : constant := 5;
   LOAD_DLL_DEBUG_EVENT          : constant := 6;
   UNLOAD_DLL_DEBUG_EVENT        : constant := 7;
   OUTPUT_DEBUG_STRING_EVENT     : constant := 8;
   RIP_EVENT                     : constant := 9;
   DRIVE_UNKNOWN                 : constant := 0;
   DRIVE_NO_ROOT_DIR             : constant := 1;
   DRIVE_REMOVABLE               : constant := 2;
   DRIVE_FIXED                   : constant := 3;
   DRIVE_REMOTE                  : constant := 4;
   DRIVE_CDROM                   : constant := 5;
   DRIVE_RAMDISK                 : constant := 6;
   FILE_TYPE_UNKNOWN             : constant := 16#0#;
   FILE_TYPE_DISK                : constant := 16#1#;
   FILE_TYPE_CHAR                : constant := 16#2#;
   FILE_TYPE_PIPE                : constant := 16#3#;
   FILE_TYPE_REMOTE              : constant := 16#8000#;

   function To_DWORD is new Ada.Unchecked_Conversion (LONG, DWORD);
   use type Interfaces.C.long;
   STD_INPUT_HANDLE  : constant DWORD := To_DWORD (-10);
   STD_OUTPUT_HANDLE : constant DWORD := To_DWORD (-11);
   STD_ERROR_HANDLE  : constant DWORD := To_DWORD (-12);

   NOPARITY                       : constant := 0;
   ODDPARITY                      : constant := 1;
   EVENPARITY                     : constant := 2;
   MARKPARITY                     : constant := 3;
   SPACEPARITY                    : constant := 4;
   ONESTOPBIT                     : constant := 0;
   ONE5STOPBITS                   : constant := 1;
   TWOSTOPBITS                    : constant := 2;
   IGNORE                         : constant := 0;
   INFINITE                       : constant := 16#ffffffff#;
   CBR_110                        : constant := 110;
   CBR_300                        : constant := 300;
   CBR_600                        : constant := 600;
   CBR_1200                       : constant := 1200;
   CBR_2400                       : constant := 2400;
   CBR_4800                       : constant := 4800;
   CBR_9600                       : constant := 9600;
   CBR_14400                      : constant := 14400;
   CBR_19200                      : constant := 19200;
   CBR_38400                      : constant := 38400;
   CBR_56000                      : constant := 56000;
   CBR_57600                      : constant := 57600;
   CBR_115200                     : constant := 115200;
   CBR_128000                     : constant := 128000;
   CBR_256000                     : constant := 256000;
   CE_RXOVER                      : constant := 16#1#;
   CE_OVERRUN                     : constant := 16#2#;
   CE_RXPARITY                    : constant := 16#4#;
   CE_FRAME                       : constant := 16#8#;
   CE_BREAK                       : constant := 16#10#;
   CE_TXFULL                      : constant := 16#100#;
   CE_PTO                         : constant := 16#200#;
   CE_IOE                         : constant := 16#400#;
   CE_DNS                         : constant := 16#800#;
   CE_OOP                         : constant := 16#1000#;
   CE_MODE                        : constant := 16#8000#;
   IE_BADID                       : constant := -1;
   IE_OPEN                        : constant := -2;
   IE_NOPEN                       : constant := -3;
   IE_MEMORY                      : constant := -4;
   IE_DEFAULT                     : constant := -5;
   IE_HARDWARE                    : constant := -10;
   IE_BYTESIZE                    : constant := -11;
   IE_BAUDRATE                    : constant := -12;
   EV_RXCHAR                      : constant := 16#1#;
   EV_RXFLAG                      : constant := 16#2#;
   EV_TXEMPTY                     : constant := 16#4#;
   EV_CTS                         : constant := 16#8#;
   EV_DSR                         : constant := 16#10#;
   EV_RLSD                        : constant := 16#20#;
   EV_BREAK                       : constant := 16#40#;
   EV_ERR                         : constant := 16#80#;
   EV_RING                        : constant := 16#100#;
   EV_PERR                        : constant := 16#200#;
   EV_RX80FULL                    : constant := 16#400#;
   EV_EVENT1                      : constant := 16#800#;
   EV_EVENT2                      : constant := 16#1000#;
   SETXOFF                        : constant := 1;
   SETXON                         : constant := 2;
   SETRTS                         : constant := 3;
   CLRRTS                         : constant := 4;
   SETDTR                         : constant := 5;
   CLRDTR                         : constant := 6;
   RESETDEV                       : constant := 7;
   SETBREAK                       : constant := 8;
   CLRBREAK                       : constant := 9;
   PURGE_TXABORT                  : constant := 16#1#;
   PURGE_RXABORT                  : constant := 16#2#;
   PURGE_TXCLEAR                  : constant := 16#4#;
   PURGE_RXCLEAR                  : constant := 16#8#;
   LPTX                           : constant := 16#80#;
   MS_CTS_ON                      : constant DWORD             := 16#10#;
   MS_DSR_ON                      : constant DWORD             := 16#20#;
   MS_RING_ON                     : constant DWORD             := 16#40#;
   MS_RLSD_ON                     : constant DWORD             := 16#80#;
   S_QUEUEEMPTY                   : constant := 0;
   S_THRESHOLD                    : constant := 1;
   S_ALLTHRESHOLD                 : constant := 2;
   S_NORMAL                       : constant := 0;
   S_LEGATO                       : constant := 1;
   S_STACCATO                     : constant := 2;
   S_PERIOD512                    : constant := 0;
   S_PERIOD1024                   : constant := 1;
   S_PERIOD2048                   : constant := 2;
   S_PERIODVOICE                  : constant := 3;
   S_WHITE512                     : constant := 4;
   S_WHITE1024                    : constant := 5;
   S_WHITE2048                    : constant := 6;
   S_WHITEVOICE                   : constant := 7;
   S_SERDVNA                      : constant := -1;
   S_SEROFM                       : constant := -2;
   S_SERMACT                      : constant := -3;
   S_SERQFUL                      : constant := -4;
   S_SERBDNT                      : constant := -5;
   S_SERDLN                       : constant := -6;
   S_SERDCC                       : constant := -7;
   S_SERDTP                       : constant := -8;
   S_SERDVL                       : constant := -9;
   S_SERDMD                       : constant := -10;
   S_SERDSH                       : constant := -11;
   S_SERDPT                       : constant := -12;
   S_SERDFQ                       : constant := -13;
   S_SERDDR                       : constant := -14;
   S_SERDSR                       : constant := -15;
   S_SERDST                       : constant := -16;
   NMPWAIT_WAIT_FOREVER           : constant := 16#ffffffff#;
   NMPWAIT_NOWAIT                 : constant := 16#1#;
   NMPWAIT_USE_DEFAULT_WAIT       : constant := 16#0#;
   FS_CASE_IS_PRESERVED           : constant := 16#2#;
   FS_CASE_SENSITIVE              : constant := 16#1#;
   FS_UNICODE_STORED_ON_DISK      : constant := 16#4#;
   FS_PERSISTENT_ACLS             : constant := 16#8#;
   FS_VOL_IS_COMPRESSED           : constant := 16#8000#;
   FS_FILE_COMPRESSION            : constant := 16#10#;
   FILE_MAP_COPY                  : constant := 16#1#;
   FILE_MAP_WRITE                 : constant := 16#2#;
   FILE_MAP_READ                  : constant := 16#4#;
   FILE_MAP_ALL_ACCESS            : constant := 16#f001f#;
   OF_READ                        : constant := 16#0#;
   OF_WRITE                       : constant := 16#1#;
   OF_READWRITE                   : constant := 16#2#;
   OF_SHARE_COMPAT                : constant := 16#0#;
   OF_SHARE_EXCLUSIVE             : constant := 16#10#;
   OF_SHARE_DENY_WRITE            : constant := 16#20#;
   OF_SHARE_DENY_READ             : constant := 16#30#;
   OF_SHARE_DENY_NONE             : constant := 16#40#;
   OF_PARSE                       : constant := 16#100#;
   OF_DELETE                      : constant := 16#200#;
   OF_VERIFY                      : constant := 16#400#;
   OF_CANCEL                      : constant := 16#800#;
   OF_CREATE                      : constant := 16#1000#;
   OF_PROMPT                      : constant := 16#2000#;
   OF_EXIST                       : constant := 16#4000#;
   OF_REOPEN                      : constant := 16#8000#;
   OFS_MAXPATHNAME                : constant := 128;
   MAXINTATOM                     : constant := 16#c000#;
   INVALID_ATOM                   : constant Win32.Windef.ATOM := 0;
   PROCESS_HEAP_REGION            : constant := 16#1#;
   PROCESS_HEAP_UNCOMMITTED_RANGE : constant := 16#2#;
   PROCESS_HEAP_ENTRY_BUSY        : constant := 16#4#;
   PROCESS_HEAP_ENTRY_MOVEABLE    : constant := 16#10#;
   PROCESS_HEAP_ENTRY_DDESHARE    : constant := 16#20#;
   SCS_32BIT_BINARY               : constant := 0;
   SCS_DOS_BINARY                 : constant := 1;
   SCS_WOW_BINARY                 : constant := 2;
   SCS_PIF_BINARY                 : constant := 3;
   SCS_POSIX_BINARY               : constant := 4;
   SCS_OS216_BINARY               : constant := 5;
   SEM_FAILCRITICALERRORS         : constant := 16#1#;
   SEM_NOGPFAULTERRORBOX          : constant := 16#2#;
   SEM_NOALIGNMENTFAULTEXCEPT     : constant := 16#4#;
   SEM_NOOPENFILEERRORBOX         : constant := 16#8000#;
   LOCKFILE_FAIL_IMMEDIATELY      : constant := 16#1#;
   LOCKFILE_EXCLUSIVE_LOCK        : constant := 16#2#;
   HANDLE_FLAG_INHERIT            : constant := 16#1#;
   HANDLE_FLAG_PROTECT_FROM_CLOSE : constant := 16#2#;
   HINSTANCE_ERROR                : constant := 32;
   GET_TAPE_MEDIA_INFORMATION     : constant := 0;
   GET_TAPE_DRIVE_INFORMATION     : constant := 1;
   SET_TAPE_MEDIA_INFORMATION     : constant := 0;
   SET_TAPE_DRIVE_INFORMATION     : constant := 1;
   FORMAT_MESSAGE_ALLOCATE_BUFFER : constant := 16#100#;
   FORMAT_MESSAGE_IGNORE_INSERTS  : constant := 16#200#;
   FORMAT_MESSAGE_FROM_STRING     : constant := 16#400#;
   FORMAT_MESSAGE_FROM_HMODULE    : constant := 16#800#;
   FORMAT_MESSAGE_FROM_SYSTEM     : constant := 16#1000#;
   FORMAT_MESSAGE_ARGUMENT_ARRAY  : constant := 16#2000#;
   FORMAT_MESSAGE_MAX_WIDTH_MASK  : constant := 16#ff#;
   TLS_OUT_OF_INDEXES             : constant DWORD             :=
      16#ffffffff#;
   BACKUP_INVALID                 : constant := 16#0#;
   BACKUP_DATA                    : constant := 16#1#;
   BACKUP_EA_DATA                 : constant := 16#2#;
   BACKUP_SECURITY_DATA           : constant := 16#3#;
   BACKUP_ALTERNATE_DATA          : constant := 16#4#;
   BACKUP_LINK                    : constant := 16#5#;
   BACKUP_PROPERTY_DATA           : constant := 16#6#;
   STREAM_NORMAL_ATTRIBUTE        : constant := 16#0#;
   STREAM_MODIFIED_WHEN_READ      : constant := 16#1#;
   STREAM_CONTAINS_SECURITY       : constant := 16#2#;
   STREAM_CONTAINS_PROPERTIES     : constant := 16#4#;
   STARTF_USESHOWWINDOW           : constant := 16#1#;
   STARTF_USESIZE                 : constant := 16#2#;
   STARTF_USEPOSITION             : constant := 16#4#;
   STARTF_USECOUNTCHARS           : constant := 16#8#;
   STARTF_USEFILLATTRIBUTE        : constant := 16#10#;
   STARTF_RUNFULLSCREEN           : constant := 16#20#;
   STARTF_FORCEONFEEDBACK         : constant := 16#40#;
   STARTF_FORCEOFFFEEDBACK        : constant := 16#80#;
   STARTF_USESTDHANDLES           : constant := 16#100#;
   SHUTDOWN_NORETRY               : constant := 16#1#;
   DONT_RESOLVE_DLL_REFERENCES    : constant := 16#1#;
   LOAD_LIBRARY_AS_DATAFILE       : constant := 16#2#;
   LOAD_WITH_ALTERED_SEARCH_PATH  : constant := 16#8#;
   DDD_RAW_TARGET_PATH            : constant := 16#1#;
   DDD_REMOVE_DEFINITION          : constant := 16#2#;
   DDD_EXACT_MATCH_ON_REMOVE      : constant := 16#4#;
   MOVEFILE_REPLACE_EXISTING      : constant := 16#1#;
   MOVEFILE_COPY_ALLOWED          : constant := 16#2#;
   MOVEFILE_DELAY_UNTIL_REBOOT    : constant := 16#4#;
   MAX_COMPUTERNAME_LENGTH        : constant := 15;
   VER_PLATFORM_WIN32S            : constant := 0;
   VER_PLATFORM_WIN32_NT          : constant := 2;
   TC_NORMAL                      : constant := 0;
   TC_HARDERR                     : constant := 1;
   TC_GP_TRAP                     : constant := 2;
   TC_SIGNAL                      : constant := 3;

   type OVERLAPPED;
   type SECURITY_ATTRIBUTES;
   type PROCESS_INFORMATION;
   type FILETIME;
   type SYSTEMTIME;
   type COMMPROP;
   type COMMTIMEOUTS;
   type COMMCONFIG;
   type SYSTEM_INFO;
   type MEMORYSTATUS;
   type EXCEPTION_DEBUG_INFO;
   type CREATE_THREAD_DEBUG_INFO;
   type CREATE_PROCESS_DEBUG_INFO;
   type EXIT_THREAD_DEBUG_INFO;
   type EXIT_PROCESS_DEBUG_INFO;
   type LOAD_DLL_DEBUG_INFO;
   type UNLOAD_DLL_DEBUG_INFO;
   type OUTPUT_DEBUG_STRING_INFO;
   type RIP_INFO;
   type union_anonymous0_t;
   type DEBUG_EVENT;
   type OFSTRUCT;
   type struct_anonymous2_t;
   type struct_anonymous3_t;
   type union_anonymous4_t;
   type PROCESS_HEAP_ENTRY;
   type BY_HANDLE_FILE_INFORMATION;
   type TIME_ZONE_INFORMATION;
   type WIN32_STREAM_ID;
   type STARTUPINFOA;
   type STARTUPINFOW;
   type WIN32_FIND_DATAA;
   type WIN32_FIND_DATAW;
   type OSVERSIONINFOA;
   type OSVERSIONINFOW;

   type LPOVERLAPPED is access all OVERLAPPED;
   type PSECURITY_ATTRIBUTES is access all SECURITY_ATTRIBUTES;
   subtype LPSECURITY_ATTRIBUTES is PSECURITY_ATTRIBUTES;
   type PPROCESS_INFORMATION is access all PROCESS_INFORMATION;
   subtype LPPROCESS_INFORMATION is PPROCESS_INFORMATION;
   type PFILETIME is access all FILETIME;
   subtype LPFILETIME is PFILETIME;
   type PSYSTEMTIME is access all SYSTEMTIME;
   subtype LPSYSTEMTIME is PSYSTEMTIME;
   type PCRITICAL_SECTION is access all Win32.Winnt.RTL_CRITICAL_SECTION;
   subtype LPCRITICAL_SECTION is PCRITICAL_SECTION;
   type PCRITICAL_SECTION_DEBUG is access all
     Win32.Winnt.RTL_CRITICAL_SECTION_DEBUG;
   subtype LPCRITICAL_SECTION_DEBUG is PCRITICAL_SECTION_DEBUG;
   type LPLDT_ENTRY is access all Win32.Winnt.LDT_ENTRY;
   type LPCOMMPROP is access all COMMPROP;
   type PCHANDLE is access all Win32.Winnt.HANDLE;
   type ac_FILETIME_t is access all FILETIME;

   type COMSTAT is record
      fCtsHold  : Win32.Bits1;
      fDsrHold  : Win32.Bits1;
      fRlsdHold : Win32.Bits1;
      fXoffHold : Win32.Bits1;
      fXoffSent : Win32.Bits1;
      fEof      : Win32.Bits1;
      fTxim     : Win32.Bits1;
      fReserved : Win32.Bits25;
      cbInQue   : Win32.DWORD;
      cbOutQue  : Win32.DWORD;
   end record;
   for COMSTAT use record
      fCtsHold  at 0 range 0 .. 0;
      fDsrHold  at 0 range 1 .. 1;
      fRlsdHold at 0 range 2 .. 2;
      fXoffHold at 0 range 3 .. 3;
      fXoffSent at 0 range 4 .. 4;
      fEof      at 0 range 5 .. 5;
      fTxim     at 0 range 6 .. 6;
      fReserved at 0 range 7 .. 31;
      cbInQue   at 4 range 0 .. 31;
      cbOutQue  at 8 range 0 .. 31;
   end record;

   type LPCOMSTAT is access all COMSTAT;

   type DCB is record
      DCBLENGTH         : Win32.DWORD;
      BaudRate          : Win32.DWORD;
      fBinary           : Win32.Bits1;
      fParity           : Win32.Bits1;
      fOutxCtsFlow      : Win32.Bits1;
      fOutxDsrFlow      : Win32.Bits1;
      fDtrControl       : Win32.Bits2;
      fDsrSensitivity   : Win32.Bits1;
      fTXContinueOnXoff : Win32.Bits1;
      fOutX             : Win32.Bits1;
      fInX              : Win32.Bits1;
      fErrorChar        : Win32.Bits1;
      fNull             : Win32.Bits1;
      fRtsControl       : Win32.Bits2;
      fAbortOnError     : Win32.Bits1;
      fDummy2           : Win32.Bits17;
      wReserved         : Win32.WORD;
      XonLim            : Win32.WORD;
      XoffLim           : Win32.WORD;
      ByteSize          : Win32.BYTE;
      Parity            : Win32.BYTE;
      StopBits          : Win32.BYTE;
      XonChar           : Win32.CHAR;
      XoffChar          : Win32.CHAR;
      ErrorChar         : Win32.CHAR;
      EofChar           : Win32.CHAR;
      EvtChar           : Win32.CHAR;
      wReserved1        : Win32.WORD;
   end record;
   for DCB use record
      DCBLENGTH         at 0 range 0 .. 31;
      BaudRate          at 4 range 0 .. 31;
      fBinary           at 8 range 0 .. 0;
      fParity           at 8 range 1 .. 1;
      fOutxCtsFlow      at 8 range 2 .. 2;
      fOutxDsrFlow      at 8 range 3 .. 3;
      fDtrControl       at 8 range 4 .. 5;
      fDsrSensitivity   at 8 range 6 .. 6;
      fTXContinueOnXoff at 8 range 7 .. 7;
      fOutX             at 9 range 0 .. 0;
      fInX              at 9 range 1 .. 1;
      fErrorChar        at 9 range 2 .. 2;
      fNull             at 9 range 3 .. 3;
      fRtsControl       at 9 range 4 .. 5;
      fAbortOnError     at 9 range 6 .. 6;
      fDummy2           at 9 range 7 .. 23;
      wReserved         at 12 range 0 .. 15;
      XonLim            at 14 range 0 .. 15;
      XoffLim           at 16 range 0 .. 15;
      ByteSize          at 18 range 0 .. 7;
      Parity            at 19 range 0 .. 7;
      StopBits          at 20 range 0 .. 7;
      XonChar           at 21 range 0 .. 7;
      XoffChar          at 22 range 0 .. 7;
      ErrorChar         at 23 range 0 .. 7;
      EofChar           at 24 range 0 .. 7;
      EvtChar           at 25 range 0 .. 7;
      wReserved1        at 26 range 0 .. 15;
   end record;

   type LPDCB is access all DCB;
   type LPCOMMTIMEOUTS is access all COMMTIMEOUTS;
   type LPCOMMCONFIG is access all COMMCONFIG;
   type LPSYSTEM_INFO is access all SYSTEM_INFO;
   type LPMEMORYSTATUS is access all MEMORYSTATUS;
   type LPEXCEPTION_DEBUG_INFO is access all EXCEPTION_DEBUG_INFO;
   type LPCREATE_THREAD_DEBUG_INFO is access all CREATE_THREAD_DEBUG_INFO;
   type LPCREATE_PROCESS_DEBUG_INFO is access all CREATE_PROCESS_DEBUG_INFO;
   type LPEXIT_THREAD_DEBUG_INFO is access all EXIT_THREAD_DEBUG_INFO;
   type LPEXIT_PROCESS_DEBUG_INFO is access all EXIT_PROCESS_DEBUG_INFO;
   type LPLOAD_DLL_DEBUG_INFO is access all LOAD_DLL_DEBUG_INFO;
   type LPUNLOAD_DLL_DEBUG_INFO is access all UNLOAD_DLL_DEBUG_INFO;
   type LPOUTPUT_DEBUG_STRING_INFO is access all OUTPUT_DEBUG_STRING_INFO;
   type LPRIP_INFO is access all RIP_INFO;
   type LPDEBUG_EVENT is access all DEBUG_EVENT;
   type LPCONTEXT is access all Win32.Winnt.CONTEXT;
   type LPEXCEPTION_RECORD is access all Win32.Winnt.EXCEPTION_RECORD;
   type LPEXCEPTION_POINTERS is access all Win32.Winnt.EXCEPTION_POINTERS;
   type LPOFSTRUCT is access all OFSTRUCT;
   type POFSTRUCT is access all OFSTRUCT;
   type LPPROCESS_HEAP_ENTRY is access all PROCESS_HEAP_ENTRY;
   type PPROCESS_HEAP_ENTRY is access all PROCESS_HEAP_ENTRY;
   type PBY_HANDLE_FILE_INFORMATION is access all BY_HANDLE_FILE_INFORMATION;
   type LPBY_HANDLE_FILE_INFORMATION is access all BY_HANDLE_FILE_INFORMATION;
   type PTIME_ZONE_INFORMATION is access all TIME_ZONE_INFORMATION;
   type LPTIME_ZONE_INFORMATION is access all TIME_ZONE_INFORMATION;
   type LPWIN32_STREAM_ID is access all WIN32_STREAM_ID;
   type LPSTARTUPINFOA is access all STARTUPINFOA;
   type LPSTARTUPINFOW is access all STARTUPINFOW;
   type LPSTARTUPINFO is access all STARTUPINFOA;
   type PWIN32_FIND_DATAA is access all WIN32_FIND_DATAA;
   type LPWIN32_FIND_DATAA is access all WIN32_FIND_DATAA;
   type PWIN32_FIND_DATAW is access all WIN32_FIND_DATAW;
   type LPWIN32_FIND_DATAW is access all WIN32_FIND_DATAW;
   type PWIN32_FIND_DATA is access all WIN32_FIND_DATAA;
   type LPWIN32_FIND_DATA is access all WIN32_FIND_DATAA;
   type POSVERSIONINFOA is access all OSVERSIONINFOA;
   type LPOSVERSIONINFOA is access all OSVERSIONINFOA;
   type POSVERSIONINFOW is access all OSVERSIONINFOW;
   type LPOSVERSIONINFOW is access all OSVERSIONINFOW;
   type POSVERSIONINFO is access all OSVERSIONINFOA;
   type LPOSVERSIONINFO is access all OSVERSIONINFOA;

   type ac_CONTEXT_t is access all Win32.Winnt.CONTEXT;
   type ac_SYSTEMTIME_t is access all SYSTEMTIME;
   type ac_TIME_ZONE_INFORMATION_t is access all TIME_ZONE_INFORMATION;

   type OVERLAPPED is record
      Internal     : Win32.ULONG_PTR;
      InternalHigh : Win32.ULONG_PTR;
      Offset       : Win32.DWORD;
      OffsetHigh   : Win32.DWORD;
      hEvent       : Win32.Winnt.HANDLE;
   end record;

   type SECURITY_ATTRIBUTES is record
      nLength              : Win32.DWORD;
      lpSecurityDescriptor : Win32.LPVOID;
      bInheritHandle       : Win32.BOOL;
   end record;

   type PROCESS_INFORMATION is record
      hProcess    : Win32.Winnt.HANDLE;
      hThread     : Win32.Winnt.HANDLE;
      dwProcessId : Win32.DWORD;
      dwThreadId  : Win32.DWORD;
   end record;

   type FILETIME is record
      dwLowDateTime  : Win32.DWORD;
      dwHighDateTime : Win32.DWORD;
   end record;

   type SYSTEMTIME is record
      wYear         : Win32.WORD;
      wMonth        : Win32.WORD;
      wDayOfWeek    : Win32.WORD;
      wDay          : Win32.WORD;
      wHour         : Win32.WORD;
      wMinute       : Win32.WORD;
      wSecond       : Win32.WORD;
      wMilliseconds : Win32.WORD;
   end record;

   subtype GET_FILEEX_INFO_LEVELS is DWORD range 0 .. 0;

   GetFileExInfoStandard : constant := 0;

   type WIN32_FILE_ATTRIBUTE_DATA is record
      dwFileAttributes : DWORD;
      ftCreationTime   : FILETIME;
      ftLastAccessTime : FILETIME;
      ftLastWriteTime  : FILETIME;
      nFileSizeHigh    : DWORD;
      nFileSizeLow     : DWORD;
   end record;

   type LPWIN32_FILE_ATTRIBUTE_DATA is access all WIN32_FILE_ATTRIBUTE_DATA;

   type PTHREAD_START_ROUTINE is access function
     (lpThreadParameter : Win32.LPVOID)
      return Win32.DWORD;
   type LPTHREAD_START_ROUTINE is access function return Win32.DWORD;
   pragma Convention (Stdcall, LPTHREAD_START_ROUTINE);

   subtype CRITICAL_SECTION is Win32.Winnt.RTL_CRITICAL_SECTION;

   subtype CRITICAL_SECTION_DEBUG is Win32.Winnt.RTL_CRITICAL_SECTION_DEBUG;

   type COMMPROP is record
      wPacketLength       : Win32.WORD;
      wPacketVersion      : Win32.WORD;
      dwServiceMask       : Win32.DWORD;
      dwReserved1         : Win32.DWORD;
      dwMaxTxQueue        : Win32.DWORD;
      dwMaxRxQueue        : Win32.DWORD;
      dwMaxBaud           : Win32.DWORD;
      dwProvSubType       : Win32.DWORD;
      dwProvCapabilities  : Win32.DWORD;
      dwSettableParams    : Win32.DWORD;
      dwSettableBaud      : Win32.DWORD;
      wSettableData       : Win32.WORD;
      wSettableStopParity : Win32.WORD;
      dwCurrentTxQueue    : Win32.DWORD;
      dwCurrentRxQueue    : Win32.DWORD;
      dwProvSpec1         : Win32.DWORD;
      dwProvSpec2         : Win32.DWORD;
      wcProvChar          : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type COMMTIMEOUTS is record
      ReadIntervalTimeout         : Win32.DWORD;
      ReadTotalTimeoutMultiplier  : Win32.DWORD;
      ReadTotalTimeoutConstant    : Win32.DWORD;
      WriteTotalTimeoutMultiplier : Win32.DWORD;
      WriteTotalTimeoutConstant   : Win32.DWORD;
   end record;

   type COMMCONFIG is record
      dwSize            : Win32.DWORD;
      wVersion          : Win32.WORD;
      wReserved         : Win32.WORD;
      dcb               : Win32.Winbase.DCB;
      dwProviderSubType : Win32.DWORD;
      dwProviderOffset  : Win32.DWORD;
      dwProviderSize    : Win32.DWORD;
      wcProviderData    : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type SYSTEM_INFO is record
      dwOemId                     : Win32.DWORD;
      dwPageSize                  : Win32.DWORD;
      lpMinimumApplicationAddress : Win32.LPVOID;
      lpMaximumApplicationAddress : Win32.LPVOID;
      dwActiveProcessorMask       : Win32.DWORD;
      dwNumberOfProcessors        : Win32.DWORD;
      dwProcessorType             : Win32.DWORD;
      dwAllocationGranularity     : Win32.DWORD;
      dwReserved                  : Win32.DWORD;
   end record;

   type MEMORYSTATUS is record
      dwLength        : Win32.DWORD;
      dwMemoryLoad    : Win32.DWORD;
      dwTotalPhys     : Win32.Size_T;
      dwAvailPhys     : Win32.Size_T;
      dwTotalPageFile : Win32.Size_T;
      dwAvailPageFile : Win32.Size_T;
      dwTotalVirtual  : Win32.Size_T;
      dwAvailVirtual  : Win32.Size_T;
   end record;

   type EXCEPTION_DEBUG_INFO is record
      ExceptionRecord : Win32.Winnt.EXCEPTION_RECORD;
      dwFirstChance   : Win32.DWORD;
   end record;

   type CREATE_THREAD_DEBUG_INFO is record
      hThread           : Win32.Winnt.HANDLE;
      lpThreadLocalBase : Win32.LPVOID;
      lpStartAddress    : LPTHREAD_START_ROUTINE;
   end record;

   type CREATE_PROCESS_DEBUG_INFO is record
      hFile                 : Win32.Winnt.HANDLE;
      hProcess              : Win32.Winnt.HANDLE;
      hThread               : Win32.Winnt.HANDLE;
      lpBaseOfImage         : Win32.LPVOID;
      dwDebugInfoFileOffset : Win32.DWORD;
      nDebugInfoSize        : Win32.DWORD;
      lpThreadLocalBase     : Win32.LPVOID;
      lpStartAddress        : LPTHREAD_START_ROUTINE;
      lpImageName           : Win32.LPVOID;
      fUnicode              : Win32.WORD;
   end record;

   type EXIT_THREAD_DEBUG_INFO is record
      dwExitCode : Win32.DWORD;
   end record;

   type EXIT_PROCESS_DEBUG_INFO is record
      dwExitCode : Win32.DWORD;
   end record;

   type LOAD_DLL_DEBUG_INFO is record
      hFile                 : Win32.Winnt.HANDLE;
      lpBaseOfDll           : Win32.LPVOID;
      dwDebugInfoFileOffset : Win32.DWORD;
      nDebugInfoSize        : Win32.DWORD;
      lpImageName           : Win32.LPVOID;
      fUnicode              : Win32.WORD;
   end record;

   type UNLOAD_DLL_DEBUG_INFO is record
      lpBaseOfDll : Win32.LPVOID;
   end record;

   type OUTPUT_DEBUG_STRING_INFO is record
      lpDebugStringData  : Win32.LPSTR;
      fUnicode           : Win32.WORD;
      nDebugStringLength : Win32.WORD;
   end record;

   type RIP_INFO is record
      dwError : Win32.DWORD;
      dwType  : Win32.DWORD;
   end record;

   type union_anonymous0_t_kind is (
      C_Exception_kind,
      CreateThread_kind,
      CreateProcessInfo_kind,
      ExitThread_kind,
      ExitProcess_kind,
      LoadDll_kind,
      UnloadDll_kind,
      DebugString_kind,
      RipInfo_kind);

   type union_anonymous0_t
     (Which : union_anonymous0_t_kind := C_Exception_kind)
   is
      record
         case Which is
            when C_Exception_kind =>
               C_Exception : EXCEPTION_DEBUG_INFO;
            when CreateThread_kind =>
               CreateThread : CREATE_THREAD_DEBUG_INFO;
            when CreateProcessInfo_kind =>
               CreateProcessInfo : CREATE_PROCESS_DEBUG_INFO;
            when ExitThread_kind =>
               ExitThread : EXIT_THREAD_DEBUG_INFO;
            when ExitProcess_kind =>
               ExitProcess : EXIT_PROCESS_DEBUG_INFO;
            when LoadDll_kind =>
               LoadDll : LOAD_DLL_DEBUG_INFO;
            when UnloadDll_kind =>
               UnloadDll : UNLOAD_DLL_DEBUG_INFO;
            when DebugString_kind =>
               DebugString : OUTPUT_DEBUG_STRING_INFO;
            when RipInfo_kind =>
               RipInfo : RIP_INFO;
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous0_t);

   type DEBUG_EVENT is record
      dwDebugEventCode : Win32.DWORD;
      dwProcessId      : Win32.DWORD;
      dwThreadId       : Win32.DWORD;
      u                : union_anonymous0_t;
   end record;

   type OFSTRUCT is record
      cBytes     : Win32.BYTE;
      fFixedDisk : Win32.BYTE;
      nErrCode   : Win32.WORD;
      Reserved1  : Win32.WORD;
      Reserved2  : Win32.WORD;
      szPathName : Win32.CHAR_Array (0 .. 127);
   end record;

   type struct_anonymous2_t is record
      hMem       : Win32.Winnt.HANDLE;
      dwReserved : Win32.DWORD_Array (0 .. 2);
   end record;

   type struct_anonymous3_t is record
      dwCommittedSize   : Win32.DWORD;
      dwUnCommittedSize : Win32.DWORD;
      lpFirstBlock      : Win32.LPVOID;
      lpLastBlock       : Win32.LPVOID;
   end record;

   type union_anonymous4_t_kind is (Block_kind, Region_kind);

   type union_anonymous4_t (Which : union_anonymous4_t_kind := Block_kind) is
      record
         case Which is
            when Block_kind =>
               Block : struct_anonymous2_t;
            when Region_kind =>
               Region : struct_anonymous3_t;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous4_t);

   pragma Unchecked_Union (union_anonymous4_t);

   type PROCESS_HEAP_ENTRY is record
      lpData       : Win32.PVOID;
      cbData       : Win32.DWORD;
      cbOverhead   : Win32.BYTE;
      iRegionIndex : Win32.BYTE;
      wFlags       : Win32.WORD;
      u            : union_anonymous4_t;
   end record;

   type PTOP_LEVEL_EXCEPTION_FILTER is access function
     (ExceptionInfo : Win32.Winnt.PEXCEPTION_POINTERS)
      return Win32.LONG;
   type LPTOP_LEVEL_EXCEPTION_FILTER is access function return Win32.LONG;
   pragma Convention (Stdcall, LPTOP_LEVEL_EXCEPTION_FILTER);

   type BY_HANDLE_FILE_INFORMATION is record
      dwFileAttributes     : Win32.DWORD;
      ftCreationTime       : FILETIME;
      ftLastAccessTime     : FILETIME;
      ftLastWriteTime      : FILETIME;
      dwVolumeSerialNumber : Win32.DWORD;
      nFileSizeHigh        : Win32.DWORD;
      nFileSizeLow         : Win32.DWORD;
      nNumberOfLinks       : Win32.DWORD;
      nFileIndexHigh       : Win32.DWORD;
      nFileIndexLow        : Win32.DWORD;
   end record;

   type TIME_ZONE_INFORMATION is record
      Bias         : Win32.LONG;
      StandardName : Win32.WCHAR_Array (0 .. 31);
      StandardDate : SYSTEMTIME;
      StandardBias : Win32.LONG;
      DaylightName : Win32.WCHAR_Array (0 .. 31);
      DaylightDate : SYSTEMTIME;
      DaylightBias : Win32.LONG;
   end record;

   type LPOVERLAPPED_COMPLETION_ROUTINE is access procedure
     (dwErrorCode               : Win32.DWORD;
      dwNumberOfBytesTransfered : Win32.DWORD;
      lpOverlapped              : Win32.Winbase.LPOVERLAPPED);

   type WIN32_STREAM_ID is record
      dwStreamId         : Win32.DWORD;
      dwStreamAttributes : Win32.DWORD;
      Size               : Win32.Winnt.LARGE_INTEGER;
      dwStreamNameSize   : Win32.DWORD;
      cStreamName        : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type STARTUPINFOA is record
      cb              : Win32.DWORD;
      lpReserved      : Win32.LPSTR;
      lpDesktop       : Win32.LPSTR;
      lpTitle         : Win32.LPSTR;
      dwX             : Win32.DWORD;
      dwY             : Win32.DWORD;
      dwXSize         : Win32.DWORD;
      dwYSize         : Win32.DWORD;
      dwXCountChars   : Win32.DWORD;
      dwYCountChars   : Win32.DWORD;
      dwFillAttribute : Win32.DWORD;
      dwFlags         : Win32.DWORD;
      wShowWindow     : Win32.WORD;
      cbReserved2     : Win32.WORD;
      lpReserved2     : Win32.LPBYTE;
      hStdInput       : Win32.Winnt.HANDLE;
      hStdOutput      : Win32.Winnt.HANDLE;
      hStdError       : Win32.Winnt.HANDLE;
   end record;

   type STARTUPINFOW is record
      cb              : Win32.DWORD;
      lpReserved      : Win32.LPWSTR;
      lpDesktop       : Win32.LPWSTR;
      lpTitle         : Win32.LPWSTR;
      dwX             : Win32.DWORD;
      dwY             : Win32.DWORD;
      dwXSize         : Win32.DWORD;
      dwYSize         : Win32.DWORD;
      dwXCountChars   : Win32.DWORD;
      dwYCountChars   : Win32.DWORD;
      dwFillAttribute : Win32.DWORD;
      dwFlags         : Win32.DWORD;
      wShowWindow     : Win32.WORD;
      cbReserved2     : Win32.WORD;
      lpReserved2     : Win32.LPBYTE;
      hStdInput       : Win32.Winnt.HANDLE;
      hStdOutput      : Win32.Winnt.HANDLE;
      hStdError       : Win32.Winnt.HANDLE;
   end record;

   subtype STARTUPINFO is STARTUPINFOA;

   type WIN32_FIND_DATAA is record
      dwFileAttributes   : Win32.DWORD;
      ftCreationTime     : FILETIME;
      ftLastAccessTime   : FILETIME;
      ftLastWriteTime    : FILETIME;
      nFileSizeHigh      : Win32.DWORD;
      nFileSizeLow       : Win32.DWORD;
      dwReserved0        : Win32.DWORD;
      dwReserved1        : Win32.DWORD;
      cFileName          : Win32.CHAR_Array (0 .. 259);
      cAlternateFileName : Win32.CHAR_Array (0 .. 13);
   end record;

   type WIN32_FIND_DATAW is record
      dwFileAttributes   : Win32.DWORD;
      ftCreationTime     : FILETIME;
      ftLastAccessTime   : FILETIME;
      ftLastWriteTime    : FILETIME;
      nFileSizeHigh      : Win32.DWORD;
      nFileSizeLow       : Win32.DWORD;
      dwReserved0        : Win32.DWORD;
      dwReserved1        : Win32.DWORD;
      cFileName          : Win32.WCHAR_Array (0 .. 259);
      cAlternateFileName : Win32.WCHAR_Array (0 .. 13);
   end record;

   subtype WIN32_FIND_DATA is WIN32_FIND_DATAA;

   type ENUMRESTYPEPROC is access function
     (hModule : Win32.Windef.HINSTANCE;
      lpType  : Win32.Winnt.LPTSTR;
      lParam  : Win32.LONG)
      return Win32.BOOL;
   pragma Convention (Stdcall, ENUMRESTYPEPROC);

   type ENUMRESNAMEPROC is access function
     (hModule : Win32.Windef.HINSTANCE;
      lpType  : Win32.Winnt.LPCTSTR;
      lpName  : Win32.Winnt.LPTSTR;
      lParam  : Win32.LONG)
      return Win32.BOOL;
   pragma Convention (Stdcall, ENUMRESNAMEPROC);

   type ENUMRESLANGPROC is access function
     (hModule   : Win32.Windef.HINSTANCE;
      lpType    : Win32.Winnt.LPCTSTR;
      lpName    : Win32.Winnt.LPCTSTR;
      wLanguage : Win32.WORD;
      lParam    : Win32.LONG)
      return Win32.BOOL;
   pragma Convention (Stdcall, ENUMRESLANGPROC);

   type OSVERSIONINFOA is record
      dwOSVersionInfoSize : Win32.DWORD;
      dwMajorVersion      : Win32.DWORD;
      dwMinorVersion      : Win32.DWORD;
      dwBuildNumber       : Win32.DWORD;
      dwPlatformId        : Win32.DWORD;
      szCSDVersion        : Win32.CHAR_Array (0 .. 127);
   end record;

   type OSVERSIONINFOW is record
      dwOSVersionInfoSize : Win32.DWORD;
      dwMajorVersion      : Win32.DWORD;
      dwMinorVersion      : Win32.DWORD;
      dwBuildNumber       : Win32.DWORD;
      dwPlatformId        : Win32.DWORD;
      szCSDVersion        : Win32.WCHAR_Array (0 .. 127);
   end record;

   subtype OSVERSIONINFO is OSVERSIONINFOA;

   function InterlockedIncrement
     (lpAddend : access Win32.LONG)
      return Win32.LONG;

   function InterlockedDecrement
     (lpAddend : access Win32.LONG)
      return Win32.LONG;

   function InterlockedExchange
     (Target : access Win32.LONG;
      Value  : Win32.LONG)
      return Win32.LONG;

   function FreeResource
     (hResData : Win32.Windef.HGLOBAL)
      return Win32.BOOL;

   function LockResource
     (hResData : Win32.Windef.HGLOBAL)
      return Win32.LPVOID;

   function MAKEINTATOM (wInteger : WORD) return Win32.Winnt.LPTSTR;

   function WinMain
     (hInstance     : Win32.Windef.HINSTANCE;
      hPrevInstance : Win32.Windef.HINSTANCE;
      lpCmdLine     : Win32.LPSTR;
      nShowCmd      : Win32.INT)
      return Win32.INT;

   function FreeLibrary
     (hLibModule : Win32.Windef.HINSTANCE)
      return Win32.BOOL;

   function FreeModule (hLibModule : Win32.Windef.HINSTANCE) return BOOL
      renames FreeLibrary;

   procedure FreeLibraryAndExitThread
     (hLibModule : Win32.Windef.HMODULE;
      dwExitCode : Win32.DWORD);

   function DisableThreadLibraryCalls
     (hLibModule : Win32.Windef.HMODULE)
      return Win32.BOOL;

   function GetProcAddress
     (hModule    : Win32.Windef.HINSTANCE;
      lpProcName : Win32.LPCSTR)
      return Win32.Windef.FARPROC;

   function GetVersion return Win32.DWORD;

   function GlobalAlloc
     (uFlags  : Win32.UINT;
      dwBytes : Win32.DWORD)
      return Win32.Windef.HGLOBAL;

   function GlobalDiscard
     (hglbMem : Win32.Windef.HGLOBAL)
      return Win32.Windef.HGLOBAL;

   function GlobalReAlloc
     (hMem    : Win32.Windef.HGLOBAL;
      dwBytes : Win32.DWORD;
      uFlags  : Win32.UINT)
      return Win32.Windef.HGLOBAL;

   function GlobalSize (hMem : Win32.Windef.HGLOBAL) return Win32.DWORD;

   function GlobalFlags (hMem : Win32.Windef.HGLOBAL) return Win32.UINT;

   function GlobalLock (hMem : Win32.Windef.HGLOBAL) return Win32.LPVOID;

   function GlobalHandle (pMem : Win32.LPCVOID) return Win32.Windef.HGLOBAL;

   function GlobalUnlock (hMem : Win32.Windef.HGLOBAL) return Win32.BOOL;

   function GlobalFree
     (hMem : Win32.Windef.HGLOBAL)
      return Win32.Windef.HGLOBAL;

   function GlobalCompact (dwMinFree : Win32.DWORD) return Win32.UINT;

   procedure GlobalFix (hMem : Win32.Windef.HGLOBAL);

   procedure GlobalUnfix (hMem : Win32.Windef.HGLOBAL);

   function GlobalWire (hMem : Win32.Windef.HGLOBAL) return Win32.LPVOID;

   function GlobalUnWire (hMem : Win32.Windef.HGLOBAL) return Win32.BOOL;

   procedure GlobalMemoryStatus (lpBuffer : LPMEMORYSTATUS);

   function LocalAlloc
     (uFlags : Win32.UINT;
      uBytes : Win32.Size_T)
      return Win32.Windef.HLOCAL;

   function LocalReAlloc
     (hMem   : Win32.Windef.HLOCAL;
      uBytes : Win32.Size_T;
      uFlags : Win32.UINT)
      return Win32.Windef.HLOCAL;

   function LocalDiscard
     (hlocMem : Win32.Windef.HLOCAL)
      return Win32.Windef.HLOCAL;

   function LocalLock (hMem : Win32.Windef.HLOCAL) return Win32.LPVOID;

   function LocalHandle (pMem : Win32.LPCVOID) return Win32.Windef.HLOCAL;

   function LocalUnlock (hMem : Win32.Windef.HLOCAL) return Win32.BOOL;

   function LocalSize (hMem : Win32.Windef.HLOCAL) return Win32.UINT;

   function LocalFlags (hMem : Win32.Windef.HLOCAL) return Win32.UINT;

   function LocalFree
     (hMem : Win32.Windef.HLOCAL)
      return Win32.Windef.HLOCAL;
   function LocalFree (hMem : Win32.PSTR) return Win32.Windef.HLOCAL;

   function LocalShrink
     (hMem      : Win32.Windef.HLOCAL;
      cbNewSize : Win32.Size_T)
      return Win32.UINT;

   function LocalCompact (uMinFree : Win32.UINT) return Win32.UINT;

   function FlushInstructionCache
     (hProcess      : Win32.Winnt.HANDLE;
      lpBaseAddress : Win32.LPCVOID;
      dwSize        : Win32.Size_T)
      return Win32.BOOL;

   function VirtualAlloc
     (lpAddress        : Win32.LPVOID;
      dwSize           : Win32.Size_T;
      flAllocationType : Win32.DWORD;
      flProtect        : Win32.DWORD)
      return Win32.LPVOID;

   function VirtualFree
     (lpAddress  : Win32.LPVOID;
      dwSize     : Win32.Size_T;
      dwFreeType : Win32.DWORD)
      return Win32.BOOL;

   function VirtualProtect
     (lpAddress      : Win32.LPVOID;
      dwSize         : Win32.Size_T;
      flNewProtect   : Win32.DWORD;
      lpflOldProtect : access Win32.DWORD)
      return Win32.BOOL;

   function VirtualQuery
     (lpAddress : Win32.LPCVOID;
      lpBuffer  : Win32.Winnt.PMEMORY_BASIC_INFORMATION;
      dwLength  : Win32.Size_T)
      return Win32.DWORD;

   function VirtualProtectEx
     (hProcess       : Win32.Winnt.HANDLE;
      lpAddress      : Win32.LPVOID;
      dwSize         : Win32.Size_T;
      flNewProtect   : Win32.DWORD;
      lpflOldProtect : access Win32.DWORD)
      return Win32.BOOL;

   function VirtualQueryEx
     (hProcess  : Win32.Winnt.HANDLE;
      lpAddress : Win32.LPCVOID;
      lpBuffer  : Win32.Winnt.PMEMORY_BASIC_INFORMATION;
      dwLength  : Win32.Size_T)
      return Win32.DWORD;

   function HeapCreate
     (flOptions     : Win32.DWORD;
      dwInitialSize : Win32.Size_T;
      dwMaximumSize : Win32.Size_T)
      return Win32.Winnt.HANDLE;

   function HeapDestroy (hHeap : Win32.Winnt.HANDLE) return Win32.BOOL;

   function HeapAlloc
     (hHeap   : Win32.Winnt.HANDLE;
      dwFlags : Win32.DWORD;
      dwBytes : Win32.Size_T)
      return Win32.LPVOID;

   function HeapReAlloc
     (hHeap   : Win32.Winnt.HANDLE;
      dwFlags : Win32.DWORD;
      lpMem   : Win32.LPVOID;
      dwBytes : Win32.Size_T)
      return Win32.LPVOID;

   function HeapFree
     (hHeap   : Win32.Winnt.HANDLE;
      dwFlags : Win32.DWORD;
      lpMem   : Win32.LPVOID)
      return Win32.BOOL;

   function HeapSize
     (hHeap   : Win32.Winnt.HANDLE;
      dwFlags : Win32.DWORD;
      lpMem   : Win32.LPCVOID)
      return Win32.DWORD;

   function HeapValidate
     (hHeap   : Win32.Winnt.HANDLE;
      dwFlags : Win32.DWORD;
      lpMem   : Win32.LPCVOID)
      return Win32.BOOL;

   function HeapCompact
     (hHeap   : Win32.Winnt.HANDLE;
      dwFlags : Win32.DWORD)
      return Win32.UINT;

   function GetProcessHeap return Win32.Winnt.HANDLE;

   function GetProcessHeaps
     (NumberOfHeaps : Win32.DWORD;
      ProcessHeaps  : Win32.Winnt.PHANDLE)
      return Win32.DWORD;

   function HeapLock (hHeap : Win32.Winnt.HANDLE) return Win32.BOOL;

   function HeapUnlock (hHeap : Win32.Winnt.HANDLE) return Win32.BOOL;

   function HeapWalk
     (hHeap   : Win32.Winnt.HANDLE;
      lpEntry : LPPROCESS_HEAP_ENTRY)
      return Win32.BOOL;

   function GetBinaryTypeA
     (lpApplicationName : Win32.LPCSTR;
      lpBinaryType      : Win32.LPDWORD)
      return Win32.BOOL;

   function GetBinaryType
     (lpApplicationName : Win32.LPCSTR;
      lpBinaryType      : Win32.LPDWORD)
      return Win32.BOOL renames GetBinaryTypeA;

   function GetBinaryTypeW
     (lpApplicationName : Win32.LPCWSTR;
      lpBinaryType      : Win32.LPDWORD)
      return Win32.BOOL;

   function GetShortPathNameA
     (lpszLongPath  : Win32.LPCSTR;
      lpszShortPath : Win32.LPSTR;
      cchBuffer     : Win32.DWORD)
      return Win32.DWORD;

   function GetShortPathName
     (lpszLongPath  : Win32.LPCSTR;
      lpszShortPath : Win32.LPSTR;
      cchBuffer     : Win32.DWORD)
      return Win32.DWORD renames GetShortPathNameA;

   function GetShortPathNameW
     (lpszLongPath  : Win32.LPCWSTR;
      lpszShortPath : Win32.LPWSTR;
      cchBuffer     : Win32.DWORD)
      return Win32.DWORD;

   function GetProcessAffinityMask
     (hProcess              : Win32.Winnt.HANDLE;
      lpProcessAffinityMask : Win32.LPDWORD;
      lpSystemAffinityMask  : Win32.LPDWORD)
      return Win32.BOOL;

   function GetProcessTimes
     (hProcess       : Win32.Winnt.HANDLE;
      lpCreationTime : LPFILETIME;
      lpExitTime     : LPFILETIME;
      lpKernelTime   : LPFILETIME;
      lpUserTime     : LPFILETIME)
      return Win32.BOOL;

   function GetProcessWorkingSetSize
     (hProcess                : Win32.Winnt.HANDLE;
      lpMinimumWorkingSetSize : Win32.Psize_T;
      lpMaximumWorkingSetSize : Win32.Psize_T)
      return Win32.BOOL;

   function SetProcessWorkingSetSize
     (hProcess                : Win32.Winnt.HANDLE;
      dwMinimumWorkingSetSize : Win32.Size_T;
      dwMaximumWorkingSetSize : Win32.Size_T)
      return Win32.BOOL;

   function OpenProcess
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      dwProcessId     : Win32.DWORD)
      return Win32.Winnt.HANDLE;

   function GetCurrentProcess return Win32.Winnt.HANDLE;

   function GetCurrentProcessId return Win32.DWORD;

   procedure ExitProcess (uExitCode : Win32.UINT);

   function TerminateProcess
     (hProcess  : Win32.Winnt.HANDLE;
      uExitCode : Win32.UINT)
      return Win32.BOOL;

   function GetExitCodeProcess
     (hProcess   : Win32.Winnt.HANDLE;
      lpExitCode : Win32.LPDWORD)
      return Win32.BOOL;

   procedure FatalExit (ExitCode : Win32.INT);

   function GetEnvironmentStrings return Win32.LPSTR;

   function GetEnvironmentStringsA return Win32.LPSTR renames
     GetEnvironmentStrings;

   function GetEnvironmentStringsW return Win32.LPWSTR;

   function FreeEnvironmentStringsA
     (lpszEnvironmentBlock : Win32.LPSTR)
      return Win32.BOOL;

   function FreeEnvironmentStrings
     (lpszEnvironmentBlock : Win32.LPSTR)
      return Win32.BOOL renames FreeEnvironmentStringsA;

   function FreeEnvironmentStringsW
     (lpszEnvironmentBlock : Win32.LPWSTR)
      return Win32.BOOL;

   procedure RaiseException
     (dwExceptionCode    : Win32.DWORD;
      dwExceptionFlags   : Win32.DWORD;
      nNumberOfArguments : Win32.DWORD;
      lpArguments        : Win32.PCDWORD);

   function UnhandledExceptionFilter
     (ExceptionInfo : Win32.Winnt.PEXCEPTION_POINTERS)
      return Win32.LONG;

   function SetUnhandledExceptionFilter
     (lpTopLevelExceptionFilter : LPTOP_LEVEL_EXCEPTION_FILTER)
      return LPTOP_LEVEL_EXCEPTION_FILTER;

   function CreateThread
     (lpThreadAttributes : LPSECURITY_ATTRIBUTES;
      dwStackSize        : Win32.DWORD;
      lpStartAddress     : LPTHREAD_START_ROUTINE;
      lpParameter        : Win32.LPVOID;
      dwCreationFlags    : Win32.DWORD;
      lpThreadId         : Win32.LPDWORD)
      return Win32.Winnt.HANDLE;

   function CreateRemoteThread
     (hProcess           : Win32.Winnt.HANDLE;
      lpThreadAttributes : LPSECURITY_ATTRIBUTES;
      dwStackSize        : Win32.DWORD;
      lpStartAddress     : LPTHREAD_START_ROUTINE;
      lpParameter        : Win32.LPVOID;
      dwCreationFlags    : Win32.DWORD;
      lpThreadId         : Win32.LPDWORD)
      return Win32.Winnt.HANDLE;

   function GetCurrentThread return Win32.Winnt.HANDLE;

   function GetCurrentThreadId return Win32.DWORD;

   function SetThreadAffinityMask
     (hThread              : Win32.Winnt.HANDLE;
      dwThreadAffinityMask : Win32.DWORD)
      return Win32.DWORD;

   function SetThreadPriority
     (hThread   : Win32.Winnt.HANDLE;
      nPriority : Win32.INT)
      return Win32.BOOL;

   function GetThreadPriority
     (hThread : Win32.Winnt.HANDLE)
      return Win32.INT;

   function GetThreadTimes
     (hThread        : Win32.Winnt.HANDLE;
      lpCreationTime : LPFILETIME;
      lpExitTime     : LPFILETIME;
      lpKernelTime   : LPFILETIME;
      lpUserTime     : LPFILETIME)
      return Win32.BOOL;

   procedure ExitThread (dwExitCode : Win32.DWORD);

   function TerminateThread
     (hThread    : Win32.Winnt.HANDLE;
      dwExitCode : Win32.DWORD)
      return Win32.BOOL;

   function GetExitCodeThread
     (hThread    : Win32.Winnt.HANDLE;
      lpExitCode : Win32.LPDWORD)
      return Win32.BOOL;

   function GetThreadSelectorEntry
     (hThread         : Win32.Winnt.HANDLE;
      dwSelector      : Win32.DWORD;
      lpSelectorEntry : LPLDT_ENTRY)
      return Win32.BOOL;

   function GetLastError return Win32.DWORD;

   procedure SetLastError (dwErrCode : Win32.DWORD);

   function GetOverlappedResult
     (hFile                      : Win32.Winnt.HANDLE;
      lpOverlapped               : Win32.Winbase.LPOVERLAPPED;
      lpNumberOfBytesTransferred : Win32.LPDWORD;
      bWait                      : Win32.BOOL)
      return Win32.BOOL;

   function CreateIoCompletionPort
     (FileHandle                : Win32.Winnt.HANDLE;
      ExistingCompletionPort    : Win32.Winnt.HANDLE;
      CompletionKey             : Win32.DWORD;
      NumberOfConcurrentThreads : Win32.DWORD)
      return Win32.Winnt.HANDLE;

   function GetQueuedCompletionStatus
     (CompletionPort             : Win32.Winnt.HANDLE;
      lpNumberOfBytesTransferred : Win32.LPDWORD;
      lpCompletionKey            : Win32.LPDWORD;
      lpOverlapped               : access Win32.Winbase.LPOVERLAPPED;
      dwMilliseconds             : Win32.DWORD)
      return Win32.BOOL;

   function SetErrorMode (uMode : Win32.UINT) return Win32.UINT;

   function ReadProcessMemory
     (hProcess            : Win32.Winnt.HANDLE;
      lpBaseAddress       : Win32.LPCVOID;
      lpBuffer            : Win32.LPVOID;
      nSize               : Win32.DWORD;
      lpNumberOfBytesRead : Win32.LPDWORD)
      return Win32.BOOL;

   function WriteProcessMemory
     (hProcess               : Win32.Winnt.HANDLE;
      lpBaseAddress          : Win32.LPVOID;
      lpBuffer               : Win32.LPVOID;
      nSize                  : Win32.DWORD;
      lpNumberOfBytesWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function GetThreadContext
     (hThread   : Win32.Winnt.HANDLE;
      lpContext : Win32.Winbase.LPCONTEXT)
      return Win32.BOOL;

   function SetThreadContext
     (hThread   : Win32.Winnt.HANDLE;
      lpContext : ac_CONTEXT_t)
      return Win32.BOOL;

   function SuspendThread (hThread : Win32.Winnt.HANDLE) return Win32.DWORD;

   function ResumeThread (hThread : Win32.Winnt.HANDLE) return Win32.DWORD;

   procedure DebugBreak;

   function WaitForDebugEvent
     (lpDebugEvent   : LPDEBUG_EVENT;
      dwMilliseconds : Win32.DWORD)
      return Win32.BOOL;

   function ContinueDebugEvent
     (dwProcessId      : Win32.DWORD;
      dwThreadId       : Win32.DWORD;
      dwContinueStatus : Win32.DWORD)
      return Win32.BOOL;

   function DebugActiveProcess
     (dwProcessId : Win32.DWORD)
      return Win32.BOOL;

   procedure InitializeCriticalSection
     (lpCriticalSection : LPCRITICAL_SECTION);

   procedure EnterCriticalSection (lpCriticalSection : LPCRITICAL_SECTION);

   function TryEnterCriticalSection
     (lpCriticalSection : LPCRITICAL_SECTION)
      return Win32.BOOL;

   procedure LeaveCriticalSection (lpCriticalSection : LPCRITICAL_SECTION);

   procedure DeleteCriticalSection (lpCriticalSection : LPCRITICAL_SECTION);

   function SetEvent (hEvent : Win32.Winnt.HANDLE) return Win32.BOOL;

   function ResetEvent (hEvent : Win32.Winnt.HANDLE) return Win32.BOOL;

   function PulseEvent (hEvent : Win32.Winnt.HANDLE) return Win32.BOOL;

   function ReleaseSemaphore
     (hSemaphore      : Win32.Winnt.HANDLE;
      lReleaseCount   : Win32.LONG;
      lpPreviousCount : Win32.PLONG)
      return Win32.BOOL;

   function ReleaseMutex (hMutex : Win32.Winnt.HANDLE) return Win32.BOOL;

   function WaitForSingleObject
     (hHandle        : Win32.Winnt.HANDLE;
      dwMilliseconds : Win32.DWORD)
      return Win32.DWORD;

   function WaitForMultipleObjects
     (nCount         : Win32.DWORD;
      lpHandles      : PCHANDLE;
      bWaitAll       : Win32.BOOL;
      dwMilliseconds : Win32.DWORD)
      return Win32.DWORD;

   procedure Sleep (dwMilliseconds : Win32.DWORD);

   function LoadResource
     (hModule  : Win32.Windef.HINSTANCE;
      hResInfo : Win32.Windef.HRSRC)
      return Win32.Windef.HGLOBAL;

   function SizeofResource
     (hModule  : Win32.Windef.HINSTANCE;
      hResInfo : Win32.Windef.HRSRC)
      return Win32.DWORD;

   function GlobalDeleteAtom
     (nAtom : Win32.Windef.ATOM)
      return Win32.Windef.ATOM;

   function InitAtomTable (nSize : Win32.DWORD) return Win32.BOOL;

   function DeleteAtom (nAtom : Win32.Windef.ATOM) return Win32.Windef.ATOM;

   function SetHandleCount (uNumber : Win32.UINT) return Win32.UINT;

   function GetLogicalDrives return Win32.DWORD;

   function LockFile
     (hFile                    : Win32.Winnt.HANDLE;
      dwFileOffsetLow          : Win32.DWORD;
      dwFileOffsetHigh         : Win32.DWORD;
      nNumberOfBytesToLockLow  : Win32.DWORD;
      nNumberOfBytesToLockHigh : Win32.DWORD)
      return Win32.BOOL;

   function UnlockFile
     (hFile                      : Win32.Winnt.HANDLE;
      dwFileOffsetLow            : Win32.DWORD;
      dwFileOffsetHigh           : Win32.DWORD;
      nNumberOfBytesToUnlockLow  : Win32.DWORD;
      nNumberOfBytesToUnlockHigh : Win32.DWORD)
      return Win32.BOOL;

   function LockFileEx
     (hFile                    : Win32.Winnt.HANDLE;
      dwFlags                  : Win32.DWORD;
      dwReserved               : Win32.DWORD;
      nNumberOfBytesToLockLow  : Win32.DWORD;
      nNumberOfBytesToLockHigh : Win32.DWORD;
      lpOverlapped             : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function UnlockFileEx
     (hFile                      : Win32.Winnt.HANDLE;
      dwReserved                 : Win32.DWORD;
      nNumberOfBytesToUnlockLow  : Win32.DWORD;
      nNumberOfBytesToUnlockHigh : Win32.DWORD;
      lpOverlapped               : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function GetFileInformationByHandle
     (hFile             : Win32.Winnt.HANDLE;
      lpFileInformation : LPBY_HANDLE_FILE_INFORMATION)
      return Win32.BOOL;

   function GetFileType (hFile : Win32.Winnt.HANDLE) return Win32.DWORD;

   function GetFileSize
     (hFile          : Win32.Winnt.HANDLE;
      lpFileSizeHigh : Win32.LPDWORD)
      return Win32.DWORD;

   function GetStdHandle
     (nStdHandle : Win32.DWORD)
      return Win32.Winnt.HANDLE;

   function SetStdHandle
     (nStdHandle : Win32.DWORD;
      hHandle    : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function WriteFile
     (hFile                  : Win32.Winnt.HANDLE;
      lpBuffer               : Win32.LPCVOID;
      nNumberOfBytesToWrite  : Win32.DWORD;
      lpNumberOfBytesWritten : Win32.LPDWORD;
      lpOverlapped           : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function ReadFile
     (hFile                : Win32.Winnt.HANDLE;
      lpBuffer             : Win32.LPVOID;
      nNumberOfBytesToRead : Win32.DWORD;
      lpNumberOfBytesRead  : Win32.LPDWORD;
      lpOverlapped         : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function FlushFileBuffers (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;

   function DeviceIoControl
     (hDevice         : Win32.Winnt.HANDLE;
      dwIoControlCode : Win32.DWORD;
      lpInBuffer      : Win32.LPVOID;
      nInBufferSize   : Win32.DWORD;
      lpOutBuffer     : Win32.LPVOID;
      nOutBufferSize  : Win32.DWORD;
      lpBytesReturned : Win32.LPDWORD;
      lpOverlapped    : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function SetEndOfFile (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;

   function SetFilePointer
     (hFile                : Win32.Winnt.HANDLE;
      lDistanceToMove      : Win32.LONG;
      lpDistanceToMoveHigh : Win32.PLONG;
      dwMoveMethod         : Win32.DWORD)
      return Win32.DWORD;

   function FindClose (hFindFile : Win32.Winnt.HANDLE) return Win32.BOOL;

   function GetFileTime
     (hFile            : Win32.Winnt.HANDLE;
      lpCreationTime   : LPFILETIME;
      lpLastAccessTime : LPFILETIME;
      lpLastWriteTime  : LPFILETIME)
      return Win32.BOOL;

   function SetFileTime
     (hFile            : Win32.Winnt.HANDLE;
      lpCreationTime   : ac_FILETIME_t;
      lpLastAccessTime : ac_FILETIME_t;
      lpLastWriteTime  : ac_FILETIME_t)
      return Win32.BOOL;

   function CloseHandle (hObject : Win32.Winnt.HANDLE) return Win32.BOOL;

   function DuplicateHandle
     (hSourceProcessHandle : Win32.Winnt.HANDLE;
      hSourceHandle        : Win32.Winnt.HANDLE;
      hTargetProcessHandle : Win32.Winnt.HANDLE;
      lpTargetHandle       : Win32.Windef.LPHANDLE;
      dwDesiredAccess      : Win32.DWORD;
      bInheritHandle       : Win32.BOOL;
      dwOptions            : Win32.DWORD)
      return Win32.BOOL;

   function GetHandleInformation
     (hObject   : Win32.Winnt.HANDLE;
      lpdwFlags : Win32.LPDWORD)
      return Win32.BOOL;

   function SetHandleInformation
     (hObject : Win32.Winnt.HANDLE;
      dwMask  : Win32.DWORD;
      dwFlags : Win32.DWORD)
      return Win32.BOOL;

   function LoadModule
     (lpModuleName     : Win32.LPCSTR;
      lpParameterBlock : Win32.LPVOID)
      return Win32.DWORD;

   function WinExec
     (lpCmdLine : Win32.LPCSTR;
      uCmdShow  : Win32.UINT)
      return Win32.UINT;

   function ClearCommBreak (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;

   function ClearCommError
     (hFile    : Win32.Winnt.HANDLE;
      lpErrors : Win32.LPDWORD;
      lpStat   : LPCOMSTAT)
      return Win32.BOOL;

   function SetupComm
     (hFile      : Win32.Winnt.HANDLE;
      dwInQueue  : Win32.DWORD;
      dwOutQueue : Win32.DWORD)
      return Win32.BOOL;

   function EscapeCommFunction
     (hFile  : Win32.Winnt.HANDLE;
      dwFunc : Win32.DWORD)
      return Win32.BOOL;

   function GetCommConfig
     (hCommDev : Win32.Winnt.HANDLE;
      lpCC     : LPCOMMCONFIG;
      lpdwSize : Win32.LPDWORD)
      return Win32.BOOL;

   function GetCommMask
     (hFile     : Win32.Winnt.HANDLE;
      lpEvtMask : Win32.LPDWORD)
      return Win32.BOOL;

   function GetCommProperties
     (hFile      : Win32.Winnt.HANDLE;
      lpCommProp : Win32.Winbase.LPCOMMPROP)
      return Win32.BOOL;

   function GetCommModemStatus
     (hFile       : Win32.Winnt.HANDLE;
      lpModemStat : Win32.LPDWORD)
      return Win32.BOOL;

   function GetCommState
     (hFile : Win32.Winnt.HANDLE;
      lpDCB : Win32.Winbase.LPDCB)
      return Win32.BOOL;

   function GetCommTimeouts
     (hFile          : Win32.Winnt.HANDLE;
      lpCommTimeouts : Win32.Winbase.LPCOMMTIMEOUTS)
      return Win32.BOOL;

   function PurgeComm
     (hFile   : Win32.Winnt.HANDLE;
      dwFlags : Win32.DWORD)
      return Win32.BOOL;

   function SetCommBreak (hFile : Win32.Winnt.HANDLE) return Win32.BOOL;

   function SetCommConfig
     (hCommDev : Win32.Winnt.HANDLE;
      lpCC     : LPCOMMCONFIG;
      dwSize   : Win32.DWORD)
      return Win32.BOOL;

   function SetCommMask
     (hFile     : Win32.Winnt.HANDLE;
      dwEvtMask : Win32.DWORD)
      return Win32.BOOL;

   function SetCommState
     (hFile : Win32.Winnt.HANDLE;
      lpDCB : Win32.Winbase.LPDCB)
      return Win32.BOOL;

   function SetCommTimeouts
     (hFile          : Win32.Winnt.HANDLE;
      lpCommTimeouts : Win32.Winbase.LPCOMMTIMEOUTS)
      return Win32.BOOL;

   function TransmitCommChar
     (hFile : Win32.Winnt.HANDLE;
      cChar : Win32.CHAR)
      return Win32.BOOL;

   function WaitCommEvent
     (hFile        : Win32.Winnt.HANDLE;
      lpEvtMask    : Win32.LPDWORD;
      lpOverlapped : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function SetTapePosition
     (hDevice          : Win32.Winnt.HANDLE;
      dwPositionMethod : Win32.DWORD;
      dwPartition      : Win32.DWORD;
      dwOffsetLow      : Win32.DWORD;
      dwOffsetHigh     : Win32.DWORD;
      bImmediate       : Win32.BOOL)
      return Win32.DWORD;

   function GetTapePosition
     (hDevice        : Win32.Winnt.HANDLE;
      dwPositionType : Win32.DWORD;
      lpdwPartition  : Win32.LPDWORD;
      lpdwOffsetLow  : Win32.LPDWORD;
      lpdwOffsetHigh : Win32.LPDWORD)
      return Win32.DWORD;

   function PrepareTape
     (hDevice     : Win32.Winnt.HANDLE;
      dwOperation : Win32.DWORD;
      bImmediate  : Win32.BOOL)
      return Win32.DWORD;

   function EraseTape
     (hDevice     : Win32.Winnt.HANDLE;
      dwEraseType : Win32.DWORD;
      bImmediate  : Win32.BOOL)
      return Win32.DWORD;

   function CreateTapePartition
     (hDevice           : Win32.Winnt.HANDLE;
      dwPartitionMethod : Win32.DWORD;
      dwCount           : Win32.DWORD;
      dwSize            : Win32.DWORD)
      return Win32.DWORD;

   function WriteTapemark
     (hDevice         : Win32.Winnt.HANDLE;
      dwTapemarkType  : Win32.DWORD;
      dwTapemarkCount : Win32.DWORD;
      bImmediate      : Win32.BOOL)
      return Win32.DWORD;

   function GetTapeStatus (hDevice : Win32.Winnt.HANDLE) return Win32.DWORD;

   function GetTapeParameters
     (hDevice           : Win32.Winnt.HANDLE;
      dwOperation       : Win32.DWORD;
      lpdwSize          : Win32.LPDWORD;
      lpTapeInformation : Win32.LPVOID)
      return Win32.DWORD;

   function SetTapeParameters
     (hDevice           : Win32.Winnt.HANDLE;
      dwOperation       : Win32.DWORD;
      lpTapeInformation : Win32.LPVOID)
      return Win32.DWORD;

   function Beep
     (dwFreq     : Win32.DWORD;
      dwDuration : Win32.DWORD)
      return Win32.BOOL;

   procedure OpenSound;

   procedure CloseSound;

   procedure StartSound;

   procedure StopSound;

   function WaitSoundState (nState : Win32.DWORD) return Win32.DWORD;

   function SyncAllVoices return Win32.DWORD;

   function CountVoiceNotes (nVoice : Win32.DWORD) return Win32.DWORD;

   function GetThresholdEvent return Win32.LPDWORD;

   function GetThresholdStatus return Win32.DWORD;

   function SetSoundNoise
     (nSource   : Win32.DWORD;
      nDuration : Win32.DWORD)
      return Win32.DWORD;

   function SetVoiceAccent
     (nVoice  : Win32.DWORD;
      nTempo  : Win32.DWORD;
      nVolume : Win32.DWORD;
      nMode   : Win32.DWORD;
      nPitch  : Win32.DWORD)
      return Win32.DWORD;

   function SetVoiceEnvelope
     (nVoice  : Win32.DWORD;
      nShape  : Win32.DWORD;
      nRepeat : Win32.DWORD)
      return Win32.DWORD;

   function SetVoiceNote
     (nVoice  : Win32.DWORD;
      nValue  : Win32.DWORD;
      nLength : Win32.DWORD;
      nCdots  : Win32.DWORD)
      return Win32.DWORD;

   function SetVoiceQueueSize
     (nVoice : Win32.DWORD;
      nBytes : Win32.DWORD)
      return Win32.DWORD;

   function SetVoiceSound
     (nVoice    : Win32.DWORD;
      Frequency : Win32.DWORD;
      nDuration : Win32.DWORD)
      return Win32.DWORD;

   function SetVoiceThreshold
     (nVoice : Win32.DWORD;
      nNotes : Win32.DWORD)
      return Win32.DWORD;

   function MulDiv
     (nNumber      : Win32.INT;
      nNumerator   : Win32.INT;
      nDenominator : Win32.INT)
      return Win32.INT;

   procedure GetSystemTime (lpSystemTime : Win32.Winbase.LPSYSTEMTIME);

   function SetSystemTime
     (lpSystemTime : ac_SYSTEMTIME_t)
      return Win32.BOOL;

   procedure GetLocalTime (lpSystemTime : Win32.Winbase.LPSYSTEMTIME);

   function SetLocalTime (lpSystemTime : ac_SYSTEMTIME_t) return Win32.BOOL;

   procedure GetSystemInfo (lpSystemInfo : LPSYSTEM_INFO);

   function SystemTimeToTzSpecificLocalTime
     (lpTimeZoneInformation : LPTIME_ZONE_INFORMATION;
      lpUniversalTime       : LPSYSTEMTIME;
      lpLocalTime           : LPSYSTEMTIME)
      return Win32.BOOL;

   function GetTimeZoneInformation
     (lpTimeZoneInformation : LPTIME_ZONE_INFORMATION)
      return Win32.DWORD;

   function SetTimeZoneInformation
     (lpTimeZoneInformation : ac_TIME_ZONE_INFORMATION_t)
      return Win32.BOOL;

   function SystemTimeToFileTime
     (lpSystemTime : ac_SYSTEMTIME_t;
      lpFileTime   : Win32.Winbase.LPFILETIME)
      return Win32.BOOL;

   function FileTimeToLocalFileTime
     (lpFileTime      : ac_FILETIME_t;
      lpLocalFileTime : Win32.Winbase.LPFILETIME)
      return Win32.BOOL;

   function LocalFileTimeToFileTime
     (lpLocalFileTime : ac_FILETIME_t;
      lpFileTime      : Win32.Winbase.LPFILETIME)
      return Win32.BOOL;

   function FileTimeToSystemTime
     (lpFileTime   : ac_FILETIME_t;
      lpSystemTime : Win32.Winbase.LPSYSTEMTIME)
      return Win32.BOOL;

   function CompareFileTime
     (lpFileTime1 : ac_FILETIME_t;
      lpFileTime2 : ac_FILETIME_t)
      return Win32.LONG;

   function FileTimeToDosDateTime
     (lpFileTime : ac_FILETIME_t;
      lpFatDate  : Win32.LPWORD;
      lpFatTime  : Win32.LPWORD)
      return Win32.BOOL;

   function DosDateTimeToFileTime
     (wFatDate   : Win32.WORD;
      wFatTime   : Win32.WORD;
      lpFileTime : Win32.Winbase.LPFILETIME)
      return Win32.BOOL;

   function GetTickCount return Win32.DWORD;

   function GetCurrentTime return DWORD renames GetTickCount;

   function SetSystemTimeAdjustment
     (dwTimeAdjustment        : Win32.DWORD;
      bTimeAdjustmentDisabled : Win32.BOOL)
      return Win32.BOOL;

   function GetSystemTimeAdjustment
     (lpTimeAdjustment         : access Win32.DWORD;
      lpTimeIncrement          : access Win32.DWORD;
      lpTimeAdjustmentDisabled : Win32.PBOOL)
      return Win32.BOOL;

   function FormatMessageA
     (dwFlags      : Win32.DWORD;
      lpSource     : Win32.LPCVOID;
      dwMessageId  : Win32.DWORD;
      dwLanguageId : Win32.DWORD;
      lpBuffer     : Win32.LPSTR;
      nSize        : Win32.DWORD;
      Arguments    : Stdarg.ArgList := Stdarg.Empty)
      return Win32.DWORD;

   function FormatMessage
     (dwFlags      : Win32.DWORD;
      lpSource     : Win32.LPCVOID;
      dwMessageId  : Win32.DWORD;
      dwLanguageId : Win32.DWORD;
      lpBuffer     : Win32.LPSTR;
      nSize        : Win32.DWORD;
      Arguments    : Stdarg.ArgList := Stdarg.Empty)
      return Win32.DWORD renames FormatMessageA;

   function FormatMessageW
     (dwFlags      : Win32.DWORD;
      lpSource     : Win32.LPCVOID;
      dwMessageId  : Win32.DWORD;
      dwLanguageId : Win32.DWORD;
      lpBuffer     : Win32.LPWSTR;
      nSize        : Win32.DWORD;
      Arguments    : Stdarg.ArgList := Stdarg.Empty)
      return Win32.DWORD;

   function CreatePipe
     (hReadPipe        : Win32.Winnt.PHANDLE;
      hWritePipe       : Win32.Winnt.PHANDLE;
      lpPipeAttributes : LPSECURITY_ATTRIBUTES;
      nSize            : Win32.DWORD)
      return Win32.BOOL;

   function ConnectNamedPipe
     (hNamedPipe   : Win32.Winnt.HANDLE;
      lpOverlapped : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function DisconnectNamedPipe
     (hNamedPipe : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function SetNamedPipeHandleState
     (hNamedPipe           : Win32.Winnt.HANDLE;
      lpMode               : Win32.LPDWORD;
      lpMaxCollectionCount : Win32.LPDWORD;
      lpCollectDataTimeout : Win32.LPDWORD)
      return Win32.BOOL;

   function GetNamedPipeInfo
     (hNamedPipe      : Win32.Winnt.HANDLE;
      lpFlags         : Win32.LPDWORD;
      lpOutBufferSize : Win32.LPDWORD;
      lpInBufferSize  : Win32.LPDWORD;
      lpMaxInstances  : Win32.LPDWORD)
      return Win32.BOOL;

   function PeekNamedPipe
     (hNamedPipe             : Win32.Winnt.HANDLE;
      lpBuffer               : Win32.LPVOID;
      nBufferSize            : Win32.DWORD;
      lpBytesRead            : Win32.LPDWORD;
      lpTotalBytesAvail      : Win32.LPDWORD;
      lpBytesLeftThisMessage : Win32.LPDWORD)
      return Win32.BOOL;

   function TransactNamedPipe
     (hNamedPipe     : Win32.Winnt.HANDLE;
      lpInBuffer     : Win32.LPVOID;
      nInBufferSize  : Win32.DWORD;
      lpOutBuffer    : Win32.LPVOID;
      nOutBufferSize : Win32.DWORD;
      lpBytesRead    : Win32.LPDWORD;
      lpOverlapped   : Win32.Winbase.LPOVERLAPPED)
      return Win32.BOOL;

   function CreateMailslotA
     (lpName               : Win32.LPCSTR;
      nMaxMessageSize      : Win32.DWORD;
      lReadTimeout         : Win32.DWORD;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.Winnt.HANDLE;

   function CreateMailslot
     (lpName               : Win32.LPCSTR;
      nMaxMessageSize      : Win32.DWORD;
      lReadTimeout         : Win32.DWORD;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.Winnt.HANDLE renames CreateMailslotA;

   function CreateMailslotW
     (lpName               : Win32.LPCWSTR;
      nMaxMessageSize      : Win32.DWORD;
      lReadTimeout         : Win32.DWORD;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.Winnt.HANDLE;

   function GetMailslotInfo
     (hMailslot        : Win32.Winnt.HANDLE;
      lpMaxMessageSize : Win32.LPDWORD;
      lpNextSize       : Win32.LPDWORD;
      lpMessageCount   : Win32.LPDWORD;
      lpReadTimeout    : Win32.LPDWORD)
      return Win32.BOOL;

   function SetMailslotInfo
     (hMailslot    : Win32.Winnt.HANDLE;
      lReadTimeout : Win32.DWORD)
      return Win32.BOOL;

   function MapViewOfFile
     (hFileMappingObject   : Win32.Winnt.HANDLE;
      dwDesiredAccess      : Win32.DWORD;
      dwFileOffsetHigh     : Win32.DWORD;
      dwFileOffsetLow      : Win32.DWORD;
      dwNumberOfBytesToMap : Size_T)
      return Win32.LPVOID;

   function FlushViewOfFile
     (lpBaseAddress          : Win32.LPCVOID;
      dwNumberOfBytesToFlush : Win32.DWORD)
      return Win32.BOOL;

   function UnmapViewOfFile
     (lpBaseAddress : Win32.LPVOID)
      return Win32.BOOL;

   function lstrcmpA
     (lpString1 : Win32.LPCSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.INT;

   function lstrcmp
     (lpString1 : Win32.LPCSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.INT renames lstrcmpA;

   function lstrcmpW
     (lpString1 : Win32.LPCWSTR;
      lpString2 : Win32.LPCWSTR)
      return Win32.INT;

   function lstrcmpiA
     (lpString1 : Win32.LPCSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.INT;

   function lstrcmpi
     (lpString1 : Win32.LPCSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.INT renames lstrcmpiA;

   function lstrcmpiW
     (lpString1 : Win32.LPCWSTR;
      lpString2 : Win32.LPCWSTR)
      return Win32.INT;

   function lstrcpynA
     (lpString1  : Win32.LPSTR;
      lpString2  : Win32.LPCSTR;
      iMaxLength : Win32.INT)
      return Win32.LPSTR;

   function lstrcpyn
     (lpString1  : Win32.LPSTR;
      lpString2  : Win32.LPCSTR;
      iMaxLength : Win32.INT)
      return Win32.LPSTR renames lstrcpynA;

   function lstrcpynW
     (lpString1  : Win32.LPWSTR;
      lpString2  : Win32.LPCWSTR;
      iMaxLength : Win32.INT)
      return Win32.LPWSTR;

   function lstrcpyA
     (lpString1 : Win32.LPSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.LPSTR;

   function lstrcpy
     (lpString1 : Win32.LPSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.LPSTR renames lstrcpyA;

   function lstrcpyW
     (lpString1 : Win32.LPWSTR;
      lpString2 : Win32.LPCWSTR)
      return Win32.LPWSTR;

   function lstrcatA
     (lpString1 : Win32.LPSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.LPSTR;

   function lstrcat
     (lpString1 : Win32.LPSTR;
      lpString2 : Win32.LPCSTR)
      return Win32.LPSTR renames lstrcatA;

   function lstrcatW
     (lpString1 : Win32.LPWSTR;
      lpString2 : Win32.LPCWSTR)
      return Win32.LPWSTR;

   function lstrlenA (lpString : Win32.LPCSTR) return Win32.INT;

   function lstrlen (lpString : Win32.LPCSTR) return Win32.INT renames
     lstrlenA;

   function lstrlenW (lpString : Win32.LPCWSTR) return Win32.INT;

   function OpenFile
     (lpFileName   : Win32.LPCSTR;
      lpReOpenBuff : LPOFSTRUCT;
      uStyle       : Win32.UINT)
      return Win32.Windef.HFILE;

   function lopen
     (lpPathName : Win32.LPCSTR;
      iReadWrite : Win32.INT)
      return Win32.Windef.HFILE;

   function lcreat
     (lpPathName : Win32.LPCSTR;
      iAttribute : Win32.INT)
      return Win32.Windef.HFILE;

   function lread
     (hFile    : Win32.Windef.HFILE;
      lpBuffer : Win32.LPVOID;
      uBytes   : Win32.UINT)
      return Win32.UINT;

   function lwrite
     (hFile    : Win32.Windef.HFILE;
      lpBuffer : Win32.LPCSTR;
      uBytes   : Win32.UINT)
      return Win32.UINT;

   function hread
     (hFile    : Win32.Windef.HFILE;
      lpBuffer : Win32.LPVOID;
      lBytes   : Win32.INT)
      return Win32.INT;

   function hwrite
     (hFile    : Win32.Windef.HFILE;
      lpBuffer : Win32.LPCSTR;
      lBytes   : Win32.INT)
      return Win32.INT;

   function lclose (hFile : Win32.Windef.HFILE) return Win32.Windef.HFILE;

   function llseek
     (hFile   : Win32.Windef.HFILE;
      lOffset : Win32.LONG;
      iOrigin : Win32.INT)
      return Win32.LONG;

   function IsTextUnicode
     (lpBuffer : Win32.LPVOID;
      cb       : Win32.INT;
      lpi      : Win32.LPINT)
      return Win32.BOOL;

   function TlsAlloc return Win32.DWORD;

   function TlsGetValue (dwTlsIndex : Win32.DWORD) return Win32.LPVOID;

   function TlsSetValue
     (dwTlsIndex : Win32.DWORD;
      lpTlsValue : Win32.LPVOID)
      return Win32.BOOL;

   function TlsFree (dwTlsIndex : Win32.DWORD) return Win32.BOOL;

   function SleepEx
     (dwMilliseconds : Win32.DWORD;
      bAlertable     : Win32.BOOL)
      return Win32.DWORD;

   function WaitForSingleObjectEx
     (hHandle        : Win32.Winnt.HANDLE;
      dwMilliseconds : Win32.DWORD;
      bAlertable     : Win32.BOOL)
      return Win32.DWORD;

   function WaitForMultipleObjectsEx
     (nCount         : Win32.DWORD;
      lpHandles      : PCHANDLE;
      bWaitAll       : Win32.BOOL;
      dwMilliseconds : Win32.DWORD;
      bAlertable     : Win32.BOOL)
      return Win32.DWORD;

   function ReadFileEx
     (hFile                : Win32.Winnt.HANDLE;
      lpBuffer             : Win32.LPVOID;
      nNumberOfBytesToRead : Win32.DWORD;
      lpOverlapped         : Win32.Winbase.LPOVERLAPPED;
      lpCompletionRoutine  : LPOVERLAPPED_COMPLETION_ROUTINE)
      return Win32.BOOL;

   function WriteFileEx
     (hFile                 : Win32.Winnt.HANDLE;
      lpBuffer              : Win32.LPCVOID;
      nNumberOfBytesToWrite : Win32.DWORD;
      lpOverlapped          : Win32.Winbase.LPOVERLAPPED;
      lpCompletionRoutine   : LPOVERLAPPED_COMPLETION_ROUTINE)
      return Win32.BOOL;

   function BackupRead
     (hFile                : Win32.Winnt.HANDLE;
      lpBuffer             : Win32.LPBYTE;
      nNumberOfBytesToRead : Win32.DWORD;
      lpNumberOfBytesRead  : Win32.LPDWORD;
      bAbort               : Win32.BOOL;
      bProcessSecurity     : Win32.BOOL;
      lpContext            : access Win32.LPVOID)
      return Win32.BOOL;

   function BackupSeek
     (hFile              : Win32.Winnt.HANDLE;
      dwLowBytesToSeek   : Win32.DWORD;
      dwHighBytesToSeek  : Win32.DWORD;
      lpdwLowByteSeeked  : Win32.LPDWORD;
      lpdwHighByteSeeked : Win32.LPDWORD;
      lpContext          : access Win32.LPVOID)
      return Win32.BOOL;

   function BackupWrite
     (hFile                  : Win32.Winnt.HANDLE;
      lpBuffer               : Win32.LPBYTE;
      nNumberOfBytesToWrite  : Win32.DWORD;
      lpNumberOfBytesWritten : Win32.LPDWORD;
      bAbort                 : Win32.BOOL;
      bProcessSecurity       : Win32.BOOL;
      lpContext              : access Win32.LPVOID)
      return Win32.BOOL;

   function CreateMutexA
     (lpMutexAttributes : LPSECURITY_ATTRIBUTES;
      bInitialOwner     : Win32.BOOL;
      lpName            : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function CreateMutex
     (lpMutexAttributes : LPSECURITY_ATTRIBUTES;
      bInitialOwner     : Win32.BOOL;
      lpName            : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames CreateMutexA;

   function CreateMutexW
     (lpMutexAttributes : LPSECURITY_ATTRIBUTES;
      bInitialOwner     : Win32.BOOL;
      lpName            : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function OpenMutexA
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function OpenMutex
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames OpenMutexA;

   function OpenMutexW
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function CreateEventA
     (lpEventAttributes : LPSECURITY_ATTRIBUTES;
      bManualReset      : Win32.BOOL;
      bInitialState     : Win32.BOOL;
      lpName            : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function CreateEvent
     (lpEventAttributes : LPSECURITY_ATTRIBUTES;
      bManualReset      : Win32.BOOL;
      bInitialState     : Win32.BOOL;
      lpName            : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames CreateEventA;

   function CreateEventW
     (lpEventAttributes : LPSECURITY_ATTRIBUTES;
      bManualReset      : Win32.BOOL;
      bInitialState     : Win32.BOOL;
      lpName            : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function OpenEventA
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function OpenEvent
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames OpenEventA;

   function OpenEventW
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function CreateSemaphoreA
     (lpSemaphoreAttributes : LPSECURITY_ATTRIBUTES;
      lInitialCount         : Win32.LONG;
      lMaximumCount         : Win32.LONG;
      lpName                : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function CreateSemaphore
     (lpSemaphoreAttributes : LPSECURITY_ATTRIBUTES;
      lInitialCount         : Win32.LONG;
      lMaximumCount         : Win32.LONG;
      lpName                : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames CreateSemaphoreA;

   function CreateSemaphoreW
     (lpSemaphoreAttributes : LPSECURITY_ATTRIBUTES;
      lInitialCount         : Win32.LONG;
      lMaximumCount         : Win32.LONG;
      lpName                : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function OpenSemaphoreA
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function OpenSemaphore
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames OpenSemaphoreA;

   function OpenSemaphoreW
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function CreateFileMappingA
     (hFile                   : Win32.Winnt.HANDLE;
      lpFileMappingAttributes : LPSECURITY_ATTRIBUTES;
      flProtect               : Win32.DWORD;
      dwMaximumSizeHigh       : Win32.DWORD;
      dwMaximumSizeLow        : Win32.DWORD;
      lpName                  : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function CreateFileMapping
     (hFile                   : Win32.Winnt.HANDLE;
      lpFileMappingAttributes : LPSECURITY_ATTRIBUTES;
      flProtect               : Win32.DWORD;
      dwMaximumSizeHigh       : Win32.DWORD;
      dwMaximumSizeLow        : Win32.DWORD;
      lpName                  : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames CreateFileMappingA;

   function CreateFileMappingW
     (hFile                   : Win32.Winnt.HANDLE;
      lpFileMappingAttributes : LPSECURITY_ATTRIBUTES;
      flProtect               : Win32.DWORD;
      dwMaximumSizeHigh       : Win32.DWORD;
      dwMaximumSizeLow        : Win32.DWORD;
      lpName                  : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function OpenFileMappingA
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function OpenFileMapping
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames OpenFileMappingA;

   function OpenFileMappingW
     (dwDesiredAccess : Win32.DWORD;
      bInheritHandle  : Win32.BOOL;
      lpName          : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function GetLogicalDriveStringsA
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR)
      return Win32.DWORD;

   function GetLogicalDriveStrings
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR)
      return Win32.DWORD renames GetLogicalDriveStringsA;

   function GetLogicalDriveStringsW
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPWSTR)
      return Win32.DWORD;

   function LoadLibraryA
     (lpLibFileName : Win32.LPCSTR)
      return Win32.Windef.HINSTANCE;

   function LoadLibrary
     (lpLibFileName : Win32.LPCSTR)
      return Win32.Windef.HINSTANCE renames LoadLibraryA;

   function LoadLibraryW
     (lpLibFileName : Win32.LPCWSTR)
      return Win32.Windef.HINSTANCE;

   function LoadLibraryExA
     (lpLibFileName : Win32.LPCSTR;
      hFile         : Win32.Winnt.HANDLE;
      dwFlags       : Win32.DWORD)
      return Win32.Windef.HINSTANCE;

   function LoadLibraryEx
     (lpLibFileName : Win32.LPCSTR;
      hFile         : Win32.Winnt.HANDLE;
      dwFlags       : Win32.DWORD)
      return Win32.Windef.HINSTANCE renames LoadLibraryExA;

   function LoadLibraryExW
     (lpLibFileName : Win32.LPCWSTR;
      hFile         : Win32.Winnt.HANDLE;
      dwFlags       : Win32.DWORD)
      return Win32.Windef.HINSTANCE;

   function GetModuleFileNameA
     (hModule    : Win32.Windef.HINSTANCE;
      lpFilename : Win32.LPSTR;
      nSize      : Win32.DWORD)
      return Win32.DWORD;

   function GetModuleFileName
     (hModule    : Win32.Windef.HINSTANCE;
      lpFilename : Win32.LPSTR;
      nSize      : Win32.DWORD)
      return Win32.DWORD renames GetModuleFileNameA;

   function GetModuleFileNameW
     (hModule    : Win32.Windef.HINSTANCE;
      lpFilename : Win32.LPWSTR;
      nSize      : Win32.DWORD)
      return Win32.DWORD;

   function GetModuleHandleA
     (lpModuleName : Win32.LPCSTR)
      return Win32.Windef.HMODULE;

   function GetModuleHandle
     (lpModuleName : Win32.LPCSTR)
      return Win32.Windef.HMODULE renames GetModuleHandleA;

   function GetModuleHandleW
     (lpModuleName : Win32.LPCWSTR)
      return Win32.Windef.HMODULE;

   function CreateProcessA
     (lpApplicationName    : Win32.LPCSTR;
      lpCommandLine        : Win32.LPSTR;
      lpProcessAttributes  : LPSECURITY_ATTRIBUTES;
      lpThreadAttributes   : LPSECURITY_ATTRIBUTES;
      bInheritHandles      : Win32.BOOL;
      dwCreationFlags      : Win32.DWORD;
      lpEnvironment        : Win32.LPVOID;
      lpCurrentDirectory   : Win32.LPCSTR;
      lpStartupInfo        : LPSTARTUPINFOA;
      lpProcessInformation : LPPROCESS_INFORMATION)
      return Win32.BOOL;

   function CreateProcess
     (lpApplicationName    : Win32.LPCSTR;
      lpCommandLine        : Win32.LPSTR;
      lpProcessAttributes  : LPSECURITY_ATTRIBUTES;
      lpThreadAttributes   : LPSECURITY_ATTRIBUTES;
      bInheritHandles      : Win32.BOOL;
      dwCreationFlags      : Win32.DWORD;
      lpEnvironment        : Win32.LPVOID;
      lpCurrentDirectory   : Win32.LPCSTR;
      lpStartupInfo        : LPSTARTUPINFOA;
      lpProcessInformation : LPPROCESS_INFORMATION)
      return Win32.BOOL renames CreateProcessA;

   function CreateProcessW
     (lpApplicationName    : Win32.LPCWSTR;
      lpCommandLine        : Win32.LPWSTR;
      lpProcessAttributes  : LPSECURITY_ATTRIBUTES;
      lpThreadAttributes   : LPSECURITY_ATTRIBUTES;
      bInheritHandles      : Win32.BOOL;
      dwCreationFlags      : Win32.DWORD;
      lpEnvironment        : Win32.LPVOID;
      lpCurrentDirectory   : Win32.LPCWSTR;
      lpStartupInfo        : LPSTARTUPINFOW;
      lpProcessInformation : LPPROCESS_INFORMATION)
      return Win32.BOOL;

   function SetProcessShutdownParameters
     (dwLevel : Win32.DWORD;
      dwFlags : Win32.DWORD)
      return Win32.BOOL;

   function GetProcessShutdownParameters
     (lpdwLevel : Win32.LPDWORD;
      lpdwFlags : Win32.LPDWORD)
      return Win32.BOOL;

   procedure FatalAppExitA
     (uAction       : Win32.UINT;
      lpMessageText : Win32.LPCSTR);

   procedure FatalAppExit
     (uAction       : Win32.UINT;
      lpMessageText : Win32.LPCSTR) renames FatalAppExitA;

   procedure FatalAppExitW
     (uAction       : Win32.UINT;
      lpMessageText : Win32.LPCWSTR);

   procedure GetStartupInfoA (lpStartupInfo : LPSTARTUPINFOA);

   procedure GetStartupInfo (lpStartupInfo : LPSTARTUPINFOA) renames
     GetStartupInfoA;

   procedure GetStartupInfoW (lpStartupInfo : LPSTARTUPINFOW);

   function GetCommandLineA return Win32.LPSTR;

   function GetCommandLine return Win32.LPSTR renames GetCommandLineA;

   function GetCommandLineW return Win32.LPWSTR;

   function GetEnvironmentVariableA
     (lpName   : Win32.LPCSTR;
      lpBuffer : Win32.LPSTR;
      nSize    : Win32.DWORD)
      return Win32.DWORD;

   function GetEnvironmentVariable
     (lpName   : Win32.LPCSTR;
      lpBuffer : Win32.LPSTR;
      nSize    : Win32.DWORD)
      return Win32.DWORD renames GetEnvironmentVariableA;

   function GetEnvironmentVariableW
     (lpName   : Win32.LPCWSTR;
      lpBuffer : Win32.LPWSTR;
      nSize    : Win32.DWORD)
      return Win32.DWORD;

   function SetEnvironmentVariableA
     (lpName  : Win32.LPCSTR;
      lpValue : Win32.LPCSTR)
      return Win32.BOOL;

   function SetEnvironmentVariable
     (lpName  : Win32.LPCSTR;
      lpValue : Win32.LPCSTR)
      return Win32.BOOL renames SetEnvironmentVariableA;

   function SetEnvironmentVariableW
     (lpName  : Win32.LPCWSTR;
      lpValue : Win32.LPCWSTR)
      return Win32.BOOL;

   function ExpandEnvironmentStringsA
     (lpSrc : Win32.LPCSTR;
      lpDst : Win32.LPSTR;
      nSize : Win32.DWORD)
      return Win32.DWORD;

   function ExpandEnvironmentStrings
     (lpSrc : Win32.LPCSTR;
      lpDst : Win32.LPSTR;
      nSize : Win32.DWORD)
      return Win32.DWORD renames ExpandEnvironmentStringsA;

   function ExpandEnvironmentStringsW
     (lpSrc : Win32.LPCWSTR;
      lpDst : Win32.LPWSTR;
      nSize : Win32.DWORD)
      return Win32.DWORD;

   procedure OutputDebugStringA (lpOutputString : Win32.LPCSTR);

   procedure OutputDebugString (lpOutputString : Win32.LPCSTR) renames
     OutputDebugStringA;

   procedure OutputDebugStringW (lpOutputString : Win32.LPCWSTR);

   function FindResourceA
     (hModule : Win32.Windef.HINSTANCE;
      lpName  : Win32.LPCSTR;
      lpType  : Win32.LPCSTR)
      return Win32.Windef.HRSRC;

   function FindResource
     (hModule : Win32.Windef.HINSTANCE;
      lpName  : Win32.LPCSTR;
      lpType  : Win32.LPCSTR)
      return Win32.Windef.HRSRC renames FindResourceA;

   function FindResourceW
     (hModule : Win32.Windef.HINSTANCE;
      lpName  : Win32.LPCWSTR;
      lpType  : Win32.LPCWSTR)
      return Win32.Windef.HRSRC;

   function FindResourceExA
     (hModule   : Win32.Windef.HINSTANCE;
      lpType    : Win32.LPCSTR;
      lpName    : Win32.LPCSTR;
      wLanguage : Win32.WORD)
      return Win32.Windef.HRSRC;

   function FindResourceEx
     (hModule   : Win32.Windef.HINSTANCE;
      lpType    : Win32.LPCSTR;
      lpName    : Win32.LPCSTR;
      wLanguage : Win32.WORD)
      return Win32.Windef.HRSRC renames FindResourceExA;

   function FindResourceExW
     (hModule   : Win32.Windef.HINSTANCE;
      lpType    : Win32.LPCWSTR;
      lpName    : Win32.LPCWSTR;
      wLanguage : Win32.WORD)
      return Win32.Windef.HRSRC;

   function EnumResourceTypesA
     (hModule    : Win32.Windef.HINSTANCE;
      lpEnumFunc : ENUMRESTYPEPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL;

   function EnumResourceTypes
     (hModule    : Win32.Windef.HINSTANCE;
      lpEnumFunc : ENUMRESTYPEPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL renames EnumResourceTypesA;

   function EnumResourceTypesW
     (hModule    : Win32.Windef.HINSTANCE;
      lpEnumFunc : ENUMRESTYPEPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL;

   function EnumResourceNamesA
     (hModule    : Win32.Windef.HINSTANCE;
      lpType     : Win32.LPCSTR;
      lpEnumFunc : ENUMRESNAMEPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL;

   function EnumResourceNames
     (hModule    : Win32.Windef.HINSTANCE;
      lpType     : Win32.LPCSTR;
      lpEnumFunc : ENUMRESNAMEPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL renames EnumResourceNamesA;

   function EnumResourceNamesW
     (hModule    : Win32.Windef.HINSTANCE;
      lpType     : Win32.LPCWSTR;
      lpEnumFunc : ENUMRESNAMEPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL;

   function EnumResourceLanguagesA
     (hModule    : Win32.Windef.HINSTANCE;
      lpType     : Win32.LPCSTR;
      lpName     : Win32.LPCSTR;
      lpEnumFunc : ENUMRESLANGPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL;

   function EnumResourceLanguages
     (hModule    : Win32.Windef.HINSTANCE;
      lpType     : Win32.LPCSTR;
      lpName     : Win32.LPCSTR;
      lpEnumFunc : ENUMRESLANGPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL renames EnumResourceLanguagesA;

   function EnumResourceLanguagesW
     (hModule    : Win32.Windef.HINSTANCE;
      lpType     : Win32.LPCWSTR;
      lpName     : Win32.LPCWSTR;
      lpEnumFunc : ENUMRESLANGPROC;
      lParam     : Win32.LONG)
      return Win32.BOOL;

   function BeginUpdateResourceA
     (pFileName                : Win32.LPCSTR;
      bDeleteExistingResources : Win32.BOOL)
      return Win32.Winnt.HANDLE;

   function BeginUpdateResource
     (pFileName                : Win32.LPCSTR;
      bDeleteExistingResources : Win32.BOOL)
      return Win32.Winnt.HANDLE renames
     BeginUpdateResourceA;

   function BeginUpdateResourceW
     (pFileName                : Win32.LPCWSTR;
      bDeleteExistingResources : Win32.BOOL)
      return Win32.Winnt.HANDLE;

   function UpdateResourceA
     (hUpdate   : Win32.Winnt.HANDLE;
      lpType    : Win32.LPCSTR;
      lpName    : Win32.LPCSTR;
      wLanguage : Win32.WORD;
      lpData    : Win32.LPVOID;
      cbData    : Win32.DWORD)
      return Win32.BOOL;

   function UpdateResource
     (hUpdate   : Win32.Winnt.HANDLE;
      lpType    : Win32.LPCSTR;
      lpName    : Win32.LPCSTR;
      wLanguage : Win32.WORD;
      lpData    : Win32.LPVOID;
      cbData    : Win32.DWORD)
      return Win32.BOOL renames UpdateResourceA;

   function UpdateResourceW
     (hUpdate   : Win32.Winnt.HANDLE;
      lpType    : Win32.LPCWSTR;
      lpName    : Win32.LPCWSTR;
      wLanguage : Win32.WORD;
      lpData    : Win32.LPVOID;
      cbData    : Win32.DWORD)
      return Win32.BOOL;

   function EndUpdateResourceA
     (hUpdate  : Win32.Winnt.HANDLE;
      fDiscard : Win32.BOOL)
      return Win32.BOOL;

   function EndUpdateResource
     (hUpdate  : Win32.Winnt.HANDLE;
      fDiscard : Win32.BOOL)
      return Win32.BOOL renames EndUpdateResourceA;

   function EndUpdateResourceW
     (hUpdate  : Win32.Winnt.HANDLE;
      fDiscard : Win32.BOOL)
      return Win32.BOOL;

   function GlobalAddAtomA
     (lpString : Win32.LPCSTR)
      return Win32.Windef.ATOM;

   function GlobalAddAtom
     (lpString : Win32.LPCSTR)
      return Win32.Windef.ATOM renames GlobalAddAtomA;

   function GlobalAddAtomW
     (lpString : Win32.LPCWSTR)
      return Win32.Windef.ATOM;

   function GlobalFindAtomA
     (lpString : Win32.LPCSTR)
      return Win32.Windef.ATOM;

   function GlobalFindAtom
     (lpString : Win32.LPCSTR)
      return Win32.Windef.ATOM renames GlobalFindAtomA;

   function GlobalFindAtomW
     (lpString : Win32.LPCWSTR)
      return Win32.Windef.ATOM;

   function GlobalGetAtomNameA
     (nAtom    : Win32.Windef.ATOM;
      lpBuffer : Win32.LPSTR;
      nSize    : Win32.INT)
      return Win32.UINT;

   function GlobalGetAtomName
     (nAtom    : Win32.Windef.ATOM;
      lpBuffer : Win32.LPSTR;
      nSize    : Win32.INT)
      return Win32.UINT renames GlobalGetAtomNameA;

   function GlobalGetAtomNameW
     (nAtom    : Win32.Windef.ATOM;
      lpBuffer : Win32.LPWSTR;
      nSize    : Win32.INT)
      return Win32.UINT;

   function AddAtomA (lpString : Win32.LPCSTR) return Win32.Windef.ATOM;

   function AddAtom (lpString : Win32.LPCSTR) return Win32.Windef.ATOM renames
     AddAtomA;

   function AddAtomW (lpString : Win32.LPCWSTR) return Win32.Windef.ATOM;

   function FindAtomA (lpString : Win32.LPCSTR) return Win32.Windef.ATOM;

   function FindAtom (lpString : Win32.LPCSTR) return Win32.Windef.ATOM renames
     FindAtomA;

   function FindAtomW (lpString : Win32.LPCWSTR) return Win32.Windef.ATOM;

   function GetAtomNameA
     (nAtom    : Win32.Windef.ATOM;
      lpBuffer : Win32.LPSTR;
      nSize    : Win32.INT)
      return Win32.UINT;

   function GetAtomName
     (nAtom    : Win32.Windef.ATOM;
      lpBuffer : Win32.LPSTR;
      nSize    : Win32.INT)
      return Win32.UINT renames GetAtomNameA;

   function GetAtomNameW
     (nAtom    : Win32.Windef.ATOM;
      lpBuffer : Win32.LPWSTR;
      nSize    : Win32.INT)
      return Win32.UINT;

   function GetProfileIntA
     (lpAppName : Win32.LPCSTR;
      lpKeyName : Win32.LPCSTR;
      nDefault  : Win32.INT)
      return Win32.UINT;

   function GetProfileInt
     (lpAppName : Win32.LPCSTR;
      lpKeyName : Win32.LPCSTR;
      nDefault  : Win32.INT)
      return Win32.UINT renames GetProfileIntA;

   function GetProfileIntW
     (lpAppName : Win32.LPCWSTR;
      lpKeyName : Win32.LPCWSTR;
      nDefault  : Win32.INT)
      return Win32.UINT;

   function GetProfileStringA
     (lpAppName        : Win32.LPCSTR;
      lpKeyName        : Win32.LPCSTR;
      lpDefault        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD)
      return Win32.DWORD;

   function GetProfileString
     (lpAppName        : Win32.LPCSTR;
      lpKeyName        : Win32.LPCSTR;
      lpDefault        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD)
      return Win32.DWORD renames GetProfileStringA;

   function GetProfileStringW
     (lpAppName        : Win32.LPCWSTR;
      lpKeyName        : Win32.LPCWSTR;
      lpDefault        : Win32.LPCWSTR;
      lpReturnedString : Win32.LPWSTR;
      nSize            : Win32.DWORD)
      return Win32.DWORD;

   function WriteProfileStringA
     (lpAppName : Win32.LPCSTR;
      lpKeyName : Win32.LPCSTR;
      lpString  : Win32.LPCSTR)
      return Win32.BOOL;

   function WriteProfileString
     (lpAppName : Win32.LPCSTR;
      lpKeyName : Win32.LPCSTR;
      lpString  : Win32.LPCSTR)
      return Win32.BOOL renames WriteProfileStringA;

   function WriteProfileStringW
     (lpAppName : Win32.LPCWSTR;
      lpKeyName : Win32.LPCWSTR;
      lpString  : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetProfileSectionA
     (lpAppName        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD)
      return Win32.DWORD;

   function GetProfileSection
     (lpAppName        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD)
      return Win32.DWORD renames GetProfileSectionA;

   function GetProfileSectionW
     (lpAppName        : Win32.LPCWSTR;
      lpReturnedString : Win32.LPWSTR;
      nSize            : Win32.DWORD)
      return Win32.DWORD;

   function WriteProfileSectionA
     (lpAppName : Win32.LPCSTR;
      lpString  : Win32.LPCSTR)
      return Win32.BOOL;

   function WriteProfileSection
     (lpAppName : Win32.LPCSTR;
      lpString  : Win32.LPCSTR)
      return Win32.BOOL renames WriteProfileSectionA;

   function WriteProfileSectionW
     (lpAppName : Win32.LPCWSTR;
      lpString  : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetPrivateProfileIntA
     (lpAppName  : Win32.LPCSTR;
      lpKeyName  : Win32.LPCSTR;
      nDefault   : Win32.INT;
      lpFileName : Win32.LPCSTR)
      return Win32.UINT;

   function GetPrivateProfileInt
     (lpAppName  : Win32.LPCSTR;
      lpKeyName  : Win32.LPCSTR;
      nDefault   : Win32.INT;
      lpFileName : Win32.LPCSTR)
      return Win32.UINT renames GetPrivateProfileIntA;

   function GetPrivateProfileIntW
     (lpAppName  : Win32.LPCWSTR;
      lpKeyName  : Win32.LPCWSTR;
      nDefault   : Win32.INT;
      lpFileName : Win32.LPCWSTR)
      return Win32.UINT;

   function GetPrivateProfileStringA
     (lpAppName        : Win32.LPCSTR;
      lpKeyName        : Win32.LPCSTR;
      lpDefault        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD;
      lpFileName       : Win32.LPCSTR)
      return Win32.DWORD;

   function GetPrivateProfileString
     (lpAppName        : Win32.LPCSTR;
      lpKeyName        : Win32.LPCSTR;
      lpDefault        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD;
      lpFileName       : Win32.LPCSTR)
      return Win32.DWORD renames GetPrivateProfileStringA;

   function GetPrivateProfileStringW
     (lpAppName        : Win32.LPCWSTR;
      lpKeyName        : Win32.LPCWSTR;
      lpDefault        : Win32.LPCWSTR;
      lpReturnedString : Win32.LPWSTR;
      nSize            : Win32.DWORD;
      lpFileName       : Win32.LPCWSTR)
      return Win32.DWORD;

   function WritePrivateProfileStringA
     (lpAppName  : Win32.LPCSTR;
      lpKeyName  : Win32.LPCSTR;
      lpString   : Win32.LPCSTR;
      lpFileName : Win32.LPCSTR)
      return Win32.BOOL;

   function WritePrivateProfileString
     (lpAppName  : Win32.LPCSTR;
      lpKeyName  : Win32.LPCSTR;
      lpString   : Win32.LPCSTR;
      lpFileName : Win32.LPCSTR)
      return Win32.BOOL renames WritePrivateProfileStringA;

   function WritePrivateProfileStringW
     (lpAppName  : Win32.LPCWSTR;
      lpKeyName  : Win32.LPCWSTR;
      lpString   : Win32.LPCWSTR;
      lpFileName : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetPrivateProfileSectionA
     (lpAppName        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD;
      lpFileName       : Win32.LPCSTR)
      return Win32.DWORD;

   function GetPrivateProfileSection
     (lpAppName        : Win32.LPCSTR;
      lpReturnedString : Win32.LPSTR;
      nSize            : Win32.DWORD;
      lpFileName       : Win32.LPCSTR)
      return Win32.DWORD renames GetPrivateProfileSectionA;

   function GetPrivateProfileSectionW
     (lpAppName        : Win32.LPCWSTR;
      lpReturnedString : Win32.LPWSTR;
      nSize            : Win32.DWORD;
      lpFileName       : Win32.LPCWSTR)
      return Win32.DWORD;

   function WritePrivateProfileSectionA
     (lpAppName  : Win32.LPCSTR;
      lpString   : Win32.LPCSTR;
      lpFileName : Win32.LPCSTR)
      return Win32.BOOL;

   function WritePrivateProfileSection
     (lpAppName  : Win32.LPCSTR;
      lpString   : Win32.LPCSTR;
      lpFileName : Win32.LPCSTR)
      return Win32.BOOL renames WritePrivateProfileSectionA;

   function WritePrivateProfileSectionW
     (lpAppName  : Win32.LPCWSTR;
      lpString   : Win32.LPCWSTR;
      lpFileName : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetDriveTypeA (lpRootPathName : Win32.LPCSTR) return Win32.UINT;

   function GetDriveType (lpRootPathName : Win32.LPCSTR) return Win32.UINT
      renames GetDriveTypeA;

   function GetDriveTypeW
     (lpRootPathName : Win32.LPCWSTR)
      return Win32.UINT;

   function GetSystemDirectoryA
     (lpBuffer : Win32.LPSTR;
      uSize    : Win32.UINT)
      return Win32.UINT;

   function GetSystemDirectory
     (lpBuffer : Win32.LPSTR;
      uSize    : Win32.UINT)
      return Win32.UINT renames GetSystemDirectoryA;

   function GetSystemDirectoryW
     (lpBuffer : Win32.LPWSTR;
      uSize    : Win32.UINT)
      return Win32.UINT;

   function GetTempPathA
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR)
      return Win32.DWORD;

   function GetTempPath
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR)
      return Win32.DWORD renames GetTempPathA;

   function GetTempPathW
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPWSTR)
      return Win32.DWORD;

   function GetTempFileNameA
     (lpPathName     : Win32.LPCSTR;
      lpPrefixString : Win32.LPCSTR;
      uUnique        : Win32.UINT;
      lpTempFileName : Win32.LPSTR)
      return Win32.UINT;

   function GetTempFileName
     (lpPathName     : Win32.LPCSTR;
      lpPrefixString : Win32.LPCSTR;
      uUnique        : Win32.UINT;
      lpTempFileName : Win32.LPSTR)
      return Win32.UINT renames GetTempFileNameA;

   function GetTempFileNameW
     (lpPathName     : Win32.LPCWSTR;
      lpPrefixString : Win32.LPCWSTR;
      uUnique        : Win32.UINT;
      lpTempFileName : Win32.LPWSTR)
      return Win32.UINT;

   function GetWindowsDirectoryA
     (lpBuffer : Win32.LPSTR;
      uSize    : Win32.UINT)
      return Win32.UINT;

   function GetWindowsDirectory
     (lpBuffer : Win32.LPSTR;
      uSize    : Win32.UINT)
      return Win32.UINT renames GetWindowsDirectoryA;

   function GetWindowsDirectoryW
     (lpBuffer : Win32.LPWSTR;
      uSize    : Win32.UINT)
      return Win32.UINT;

   function SetCurrentDirectoryA
     (lpPathName : Win32.LPCSTR)
      return Win32.BOOL;

   function SetCurrentDirectory
     (lpPathName : Win32.LPCSTR)
      return Win32.BOOL renames SetCurrentDirectoryA;

   function SetCurrentDirectoryW
     (lpPathName : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetCurrentDirectoryA
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR)
      return Win32.DWORD;

   function GetCurrentDirectory
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR)
      return Win32.DWORD renames GetCurrentDirectoryA;

   function GetCurrentDirectoryW
     (nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPWSTR)
      return Win32.DWORD;

   function GetDiskFreeSpaceA
     (lpRootPathName          : Win32.LPCSTR;
      lpSectorsPerCluster     : Win32.LPDWORD;
      lpBytesPerSector        : Win32.LPDWORD;
      lpNumberOfFreeClusters  : Win32.LPDWORD;
      lpTotalNumberOfClusters : Win32.LPDWORD)
      return Win32.BOOL;

   function GetDiskFreeSpace
     (lpRootPathName          : Win32.LPCSTR;
      lpSectorsPerCluster     : Win32.LPDWORD;
      lpBytesPerSector        : Win32.LPDWORD;
      lpNumberOfFreeClusters  : Win32.LPDWORD;
      lpTotalNumberOfClusters : Win32.LPDWORD)
      return Win32.BOOL renames GetDiskFreeSpaceA;

   function GetDiskFreeSpaceW
     (lpRootPathName          : Win32.LPCWSTR;
      lpSectorsPerCluster     : Win32.LPDWORD;
      lpBytesPerSector        : Win32.LPDWORD;
      lpNumberOfFreeClusters  : Win32.LPDWORD;
      lpTotalNumberOfClusters : Win32.LPDWORD)
      return Win32.BOOL;

   function CreateDirectoryA
     (lpPathName           : Win32.LPCSTR;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.BOOL;

   function CreateDirectory
     (lpPathName           : Win32.LPCSTR;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.BOOL renames CreateDirectoryA;

   function CreateDirectoryW
     (lpPathName           : Win32.LPCWSTR;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.BOOL;

   function CreateDirectoryExA
     (lpTemplateDirectory  : Win32.LPCSTR;
      lpNewDirectory       : Win32.LPCSTR;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.BOOL;

   function CreateDirectoryEx
     (lpTemplateDirectory  : Win32.LPCSTR;
      lpNewDirectory       : Win32.LPCSTR;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.BOOL renames CreateDirectoryExA;

   function CreateDirectoryExW
     (lpTemplateDirectory  : Win32.LPCWSTR;
      lpNewDirectory       : Win32.LPCWSTR;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.BOOL;

   function RemoveDirectoryA (lpPathName : Win32.LPCSTR) return Win32.BOOL;

   function RemoveDirectory (lpPathName : Win32.LPCSTR) return Win32.BOOL
      renames RemoveDirectoryA;

   function RemoveDirectoryW (lpPathName : Win32.LPCWSTR) return Win32.BOOL;

   function GetFullPathNameA
     (lpFileName    : Win32.LPCSTR;
      nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR;
      lpFilePart    : access Win32.LPSTR)
      return Win32.DWORD;

   function GetFullPathName
     (lpFileName    : Win32.LPCSTR;
      nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR;
      lpFilePart    : access Win32.LPSTR)
      return Win32.DWORD renames GetFullPathNameA;

   function GetFullPathNameW
     (lpFileName    : Win32.LPCWSTR;
      nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPWSTR;
      lpFilePart    : access Win32.PWSTR)
      return Win32.DWORD;

   function DefineDosDeviceA
     (dwFlags      : Win32.DWORD;
      lpDeviceName : Win32.LPCSTR;
      lpTargetPath : Win32.LPCSTR)
      return Win32.BOOL;

   function DefineDosDevice
     (dwFlags      : Win32.DWORD;
      lpDeviceName : Win32.LPCSTR;
      lpTargetPath : Win32.LPCSTR)
      return Win32.BOOL renames DefineDosDeviceA;

   function DefineDosDeviceW
     (dwFlags      : Win32.DWORD;
      lpDeviceName : Win32.LPCWSTR;
      lpTargetPath : Win32.LPCWSTR)
      return Win32.BOOL;

   function QueryDosDeviceA
     (lpDeviceName : Win32.LPCSTR;
      lpTargetPath : Win32.LPSTR;
      ucchMax      : Win32.DWORD)
      return Win32.DWORD;

   function QueryDosDevice
     (lpDeviceName : Win32.LPCSTR;
      lpTargetPath : Win32.LPSTR;
      ucchMax      : Win32.DWORD)
      return Win32.DWORD renames QueryDosDeviceA;

   function QueryDosDeviceW
     (lpDeviceName : Win32.LPCWSTR;
      lpTargetPath : Win32.LPWSTR;
      ucchMax      : Win32.DWORD)
      return Win32.DWORD;

   function CreateFileA
     (lpFileName            : Win32.LPCSTR;
      dwDesiredAccess       : Win32.DWORD;
      dwShareMode           : Win32.DWORD;
      lpSecurityAttributes  : LPSECURITY_ATTRIBUTES;
      dwCreationDisposition : Win32.DWORD;
      dwFlagsAndAttributes  : Win32.DWORD;
      hTemplateFile         : Win32.Winnt.HANDLE)
      return Win32.Winnt.HANDLE;

   function CreateFile
     (lpFileName            : Win32.LPCSTR;
      dwDesiredAccess       : Win32.DWORD;
      dwShareMode           : Win32.DWORD;
      lpSecurityAttributes  : LPSECURITY_ATTRIBUTES;
      dwCreationDisposition : Win32.DWORD;
      dwFlagsAndAttributes  : Win32.DWORD;
      hTemplateFile         : Win32.Winnt.HANDLE)
      return Win32.Winnt.HANDLE renames CreateFileA;

   function CreateFileW
     (lpFileName            : Win32.LPCWSTR;
      dwDesiredAccess       : Win32.DWORD;
      dwShareMode           : Win32.DWORD;
      lpSecurityAttributes  : LPSECURITY_ATTRIBUTES;
      dwCreationDisposition : Win32.DWORD;
      dwFlagsAndAttributes  : Win32.DWORD;
      hTemplateFile         : Win32.Winnt.HANDLE)
      return Win32.Winnt.HANDLE;

   function SetFileAttributesA
     (lpFileName       : Win32.LPCSTR;
      dwFileAttributes : Win32.DWORD)
      return Win32.BOOL;

   function SetFileAttributes
     (lpFileName       : Win32.LPCSTR;
      dwFileAttributes : Win32.DWORD)
      return Win32.BOOL renames SetFileAttributesA;

   function SetFileAttributesW
     (lpFileName       : Win32.LPCWSTR;
      dwFileAttributes : Win32.DWORD)
      return Win32.BOOL;

   function GetFileAttributesA
     (lpFileName : Win32.LPCSTR)
      return Win32.DWORD;

   function GetFileAttributes
     (lpFileName : Win32.LPCSTR)
      return Win32.DWORD renames GetFileAttributesA;

   function GetFileAttributesW
     (lpFileName : Win32.LPCWSTR)
      return Win32.DWORD;
   function To_LPVOID is new Ada.Unchecked_Conversion (
      LPWIN32_FILE_ATTRIBUTE_DATA,
      LPVOID);

   function GetFileAttributesExA
     (lpFileName        : Win32.LPCSTR;
      fInfoLevelId      : GET_FILEEX_INFO_LEVELS;
      lpFileInformation : LPVOID)
      return Win32.BOOL;

   function GetFileAttributesExW
     (lpFileName        : Win32.LPCWSTR;
      fInfoLevelId      : GET_FILEEX_INFO_LEVELS;
      lpFileInformation : LPVOID)
      return Win32.BOOL;

   function GetFileAttributesEx
     (lpFileName        : Win32.LPCSTR;
      fInfoLevelId      : GET_FILEEX_INFO_LEVELS;
      lpFileInformation : LPVOID)
      return Win32.BOOL renames GetFileAttributesExA;

   function GetCompressedFileSizeA
     (lpFileName     : Win32.LPCSTR;
      lpFileSizeHigh : Win32.LPDWORD)
      return Win32.DWORD;

   function GetCompressedFileSize
     (lpFileName     : Win32.LPCSTR;
      lpFileSizeHigh : Win32.LPDWORD)
      return Win32.DWORD renames GetCompressedFileSizeA;

   function GetCompressedFileSizeW
     (lpFileName     : Win32.LPCWSTR;
      lpFileSizeHigh : Win32.LPDWORD)
      return Win32.DWORD;

   function DeleteFileA (lpFileName : Win32.LPCSTR) return Win32.BOOL;

   function DeleteFile (lpFileName : Win32.LPCSTR) return Win32.BOOL renames
     DeleteFileA;

   function DeleteFileW (lpFileName : Win32.LPCWSTR) return Win32.BOOL;

   function FindFirstFileA
     (lpFileName     : Win32.LPCSTR;
      lpFindFileData : LPWIN32_FIND_DATAA)
      return Win32.Winnt.HANDLE;

   function FindFirstFile
     (lpFileName     : Win32.LPCSTR;
      lpFindFileData : LPWIN32_FIND_DATAA)
      return Win32.Winnt.HANDLE renames FindFirstFileA;

   function FindFirstFileW
     (lpFileName     : Win32.LPCWSTR;
      lpFindFileData : LPWIN32_FIND_DATAW)
      return Win32.Winnt.HANDLE;

   function FindNextFileA
     (hFindFile      : Win32.Winnt.HANDLE;
      lpFindFileData : LPWIN32_FIND_DATAA)
      return Win32.BOOL;

   function FindNextFile
     (hFindFile      : Win32.Winnt.HANDLE;
      lpFindFileData : LPWIN32_FIND_DATAA)
      return Win32.BOOL renames FindNextFileA;

   function FindNextFileW
     (hFindFile      : Win32.Winnt.HANDLE;
      lpFindFileData : LPWIN32_FIND_DATAW)
      return Win32.BOOL;

   function SearchPathA
     (lpPath        : Win32.LPCSTR;
      lpFileName    : Win32.LPCSTR;
      lpExtension   : Win32.LPCSTR;
      nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR;
      lpFilePart    : access Win32.LPSTR)
      return Win32.DWORD;

   function SearchPath
     (lpPath        : Win32.LPCSTR;
      lpFileName    : Win32.LPCSTR;
      lpExtension   : Win32.LPCSTR;
      nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPSTR;
      lpFilePart    : access Win32.LPSTR)
      return Win32.DWORD renames SearchPathA;

   function SearchPathW
     (lpPath        : Win32.LPCWSTR;
      lpFileName    : Win32.LPCWSTR;
      lpExtension   : Win32.LPCWSTR;
      nBufferLength : Win32.DWORD;
      lpBuffer      : Win32.LPWSTR;
      lpFilePart    : access Win32.PWSTR)
      return Win32.DWORD;

   function CopyFileA
     (lpExistingFileName : Win32.LPCSTR;
      lpNewFileName      : Win32.LPCSTR;
      bFailIfExists      : Win32.BOOL)
      return Win32.BOOL;

   function CopyFile
     (lpExistingFileName : Win32.LPCSTR;
      lpNewFileName      : Win32.LPCSTR;
      bFailIfExists      : Win32.BOOL)
      return Win32.BOOL renames CopyFileA;

   function CopyFileW
     (lpExistingFileName : Win32.LPCWSTR;
      lpNewFileName      : Win32.LPCWSTR;
      bFailIfExists      : Win32.BOOL)
      return Win32.BOOL;

   function MoveFileA
     (lpExistingFileName : Win32.LPCSTR;
      lpNewFileName      : Win32.LPCSTR)
      return Win32.BOOL;

   function MoveFile
     (lpExistingFileName : Win32.LPCSTR;
      lpNewFileName      : Win32.LPCSTR)
      return Win32.BOOL renames MoveFileA;

   function MoveFileW
     (lpExistingFileName : Win32.LPCWSTR;
      lpNewFileName      : Win32.LPCWSTR)
      return Win32.BOOL;

   function MoveFileExA
     (lpExistingFileName : Win32.LPCSTR;
      lpNewFileName      : Win32.LPCSTR;
      dwFlags            : Win32.DWORD)
      return Win32.BOOL;

   function MoveFileEx
     (lpExistingFileName : Win32.LPCSTR;
      lpNewFileName      : Win32.LPCSTR;
      dwFlags            : Win32.DWORD)
      return Win32.BOOL renames MoveFileExA;

   function MoveFileExW
     (lpExistingFileName : Win32.LPCWSTR;
      lpNewFileName      : Win32.LPCWSTR;
      dwFlags            : Win32.DWORD)
      return Win32.BOOL;

   function CreateNamedPipeA
     (lpName               : Win32.LPCSTR;
      dwOpenMode           : Win32.DWORD;
      dwPipeMode           : Win32.DWORD;
      nMaxInstances        : Win32.DWORD;
      nOutBufferSize       : Win32.DWORD;
      nInBufferSize        : Win32.DWORD;
      nDefaultTimeOut      : Win32.DWORD;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.Winnt.HANDLE;

   function CreateNamedPipe
     (lpName               : Win32.LPCSTR;
      dwOpenMode           : Win32.DWORD;
      dwPipeMode           : Win32.DWORD;
      nMaxInstances        : Win32.DWORD;
      nOutBufferSize       : Win32.DWORD;
      nInBufferSize        : Win32.DWORD;
      nDefaultTimeOut      : Win32.DWORD;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.Winnt.HANDLE renames CreateNamedPipeA;

   function CreateNamedPipeW
     (lpName               : Win32.LPCWSTR;
      dwOpenMode           : Win32.DWORD;
      dwPipeMode           : Win32.DWORD;
      nMaxInstances        : Win32.DWORD;
      nOutBufferSize       : Win32.DWORD;
      nInBufferSize        : Win32.DWORD;
      nDefaultTimeOut      : Win32.DWORD;
      lpSecurityAttributes : LPSECURITY_ATTRIBUTES)
      return Win32.Winnt.HANDLE;

   function GetNamedPipeHandleStateA
     (hNamedPipe           : Win32.Winnt.HANDLE;
      lpState              : Win32.LPDWORD;
      lpCurInstances       : Win32.LPDWORD;
      lpMaxCollectionCount : Win32.LPDWORD;
      lpCollectDataTimeout : Win32.LPDWORD;
      lpUserName           : Win32.LPSTR;
      nMaxUserNameSize     : Win32.DWORD)
      return Win32.BOOL;

   function GetNamedPipeHandleState
     (hNamedPipe           : Win32.Winnt.HANDLE;
      lpState              : Win32.LPDWORD;
      lpCurInstances       : Win32.LPDWORD;
      lpMaxCollectionCount : Win32.LPDWORD;
      lpCollectDataTimeout : Win32.LPDWORD;
      lpUserName           : Win32.LPSTR;
      nMaxUserNameSize     : Win32.DWORD)
      return Win32.BOOL renames GetNamedPipeHandleStateA;

   function GetNamedPipeHandleStateW
     (hNamedPipe           : Win32.Winnt.HANDLE;
      lpState              : Win32.LPDWORD;
      lpCurInstances       : Win32.LPDWORD;
      lpMaxCollectionCount : Win32.LPDWORD;
      lpCollectDataTimeout : Win32.LPDWORD;
      lpUserName           : Win32.LPWSTR;
      nMaxUserNameSize     : Win32.DWORD)
      return Win32.BOOL;

   function CallNamedPipeA
     (lpNamedPipeName : Win32.LPCSTR;
      lpInBuffer      : Win32.LPVOID;
      nInBufferSize   : Win32.DWORD;
      lpOutBuffer     : Win32.LPVOID;
      nOutBufferSize  : Win32.DWORD;
      lpBytesRead     : Win32.LPDWORD;
      nTimeOut        : Win32.DWORD)
      return Win32.BOOL;

   function CallNamedPipe
     (lpNamedPipeName : Win32.LPCSTR;
      lpInBuffer      : Win32.LPVOID;
      nInBufferSize   : Win32.DWORD;
      lpOutBuffer     : Win32.LPVOID;
      nOutBufferSize  : Win32.DWORD;
      lpBytesRead     : Win32.LPDWORD;
      nTimeOut        : Win32.DWORD)
      return Win32.BOOL renames CallNamedPipeA;

   function CallNamedPipeW
     (lpNamedPipeName : Win32.LPCWSTR;
      lpInBuffer      : Win32.LPVOID;
      nInBufferSize   : Win32.DWORD;
      lpOutBuffer     : Win32.LPVOID;
      nOutBufferSize  : Win32.DWORD;
      lpBytesRead     : Win32.LPDWORD;
      nTimeOut        : Win32.DWORD)
      return Win32.BOOL;

   function WaitNamedPipeA
     (lpNamedPipeName : Win32.LPCSTR;
      nTimeOut        : Win32.DWORD)
      return Win32.BOOL;

   function WaitNamedPipe
     (lpNamedPipeName : Win32.LPCSTR;
      nTimeOut        : Win32.DWORD)
      return Win32.BOOL renames WaitNamedPipeA;

   function WaitNamedPipeW
     (lpNamedPipeName : Win32.LPCWSTR;
      nTimeOut        : Win32.DWORD)
      return Win32.BOOL;

   function SetVolumeLabelA
     (lpRootPathName : Win32.LPCSTR;
      lpVolumeName   : Win32.LPCSTR)
      return Win32.BOOL;

   function SetVolumeLabel
     (lpRootPathName : Win32.LPCSTR;
      lpVolumeName   : Win32.LPCSTR)
      return Win32.BOOL renames SetVolumeLabelA;

   function SetVolumeLabelW
     (lpRootPathName : Win32.LPCWSTR;
      lpVolumeName   : Win32.LPCWSTR)
      return Win32.BOOL;

   procedure SetFileApisToOEM;

   procedure SetFileApisToANSI;

   function AreFileApisANSI return Win32.BOOL;

   function GetVolumeInformationA
     (lpRootPathName           : Win32.LPCSTR;
      lpVolumeNameBuffer       : Win32.LPSTR;
      nVolumeNameSize          : Win32.DWORD;
      lpVolumeSerialNumber     : Win32.LPDWORD;
      lpMaximumComponentLength : Win32.LPDWORD;
      lpFileSystemFlags        : Win32.LPDWORD;
      lpFileSystemNameBuffer   : Win32.LPSTR;
      nFileSystemNameSize      : Win32.DWORD)
      return Win32.BOOL;

   function GetVolumeInformation
     (lpRootPathName           : Win32.LPCSTR;
      lpVolumeNameBuffer       : Win32.LPSTR;
      nVolumeNameSize          : Win32.DWORD;
      lpVolumeSerialNumber     : Win32.LPDWORD;
      lpMaximumComponentLength : Win32.LPDWORD;
      lpFileSystemFlags        : Win32.LPDWORD;
      lpFileSystemNameBuffer   : Win32.LPSTR;
      nFileSystemNameSize      : Win32.DWORD)
      return Win32.BOOL renames GetVolumeInformationA;

   function GetVolumeInformationW
     (lpRootPathName           : Win32.LPCWSTR;
      lpVolumeNameBuffer       : Win32.LPWSTR;
      nVolumeNameSize          : Win32.DWORD;
      lpVolumeSerialNumber     : Win32.LPDWORD;
      lpMaximumComponentLength : Win32.LPDWORD;
      lpFileSystemFlags        : Win32.LPDWORD;
      lpFileSystemNameBuffer   : Win32.LPWSTR;
      nFileSystemNameSize      : Win32.DWORD)
      return Win32.BOOL;

   function ClearEventLogA
     (hEventLog        : Win32.Winnt.HANDLE;
      lpBackupFileName : Win32.LPCSTR)
      return Win32.BOOL;

   function ClearEventLog
     (hEventLog        : Win32.Winnt.HANDLE;
      lpBackupFileName : Win32.LPCSTR)
      return Win32.BOOL renames ClearEventLogA;

   function ClearEventLogW
     (hEventLog        : Win32.Winnt.HANDLE;
      lpBackupFileName : Win32.LPCWSTR)
      return Win32.BOOL;

   function BackupEventLogA
     (hEventLog        : Win32.Winnt.HANDLE;
      lpBackupFileName : Win32.LPCSTR)
      return Win32.BOOL;

   function BackupEventLog
     (hEventLog        : Win32.Winnt.HANDLE;
      lpBackupFileName : Win32.LPCSTR)
      return Win32.BOOL renames BackupEventLogA;

   function BackupEventLogW
     (hEventLog        : Win32.Winnt.HANDLE;
      lpBackupFileName : Win32.LPCWSTR)
      return Win32.BOOL;

   function CloseEventLog
     (hEventLog : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function DeregisterEventSource
     (hEventLog : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function NotifyChangeEventLog
     (hEventLog : Win32.Winnt.HANDLE;
      hEvent    : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function GetNumberOfEventLogRecords
     (hEventLog       : Win32.Winnt.HANDLE;
      NumberOfRecords : access Win32.DWORD)
      return Win32.BOOL;

   function GetOldestEventLogRecord
     (hEventLog    : Win32.Winnt.HANDLE;
      OldestRecord : access Win32.DWORD)
      return Win32.BOOL;

   function OpenEventLogA
     (lpUNCServerName : Win32.LPCSTR;
      lpSourceName    : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function OpenEventLog
     (lpUNCServerName : Win32.LPCSTR;
      lpSourceName    : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames OpenEventLogA;

   function OpenEventLogW
     (lpUNCServerName : Win32.LPCWSTR;
      lpSourceName    : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function RegisterEventSourceA
     (lpUNCServerName : Win32.LPCSTR;
      lpSourceName    : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function RegisterEventSource
     (lpUNCServerName : Win32.LPCSTR;
      lpSourceName    : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames RegisterEventSourceA;

   function RegisterEventSourceW
     (lpUNCServerName : Win32.LPCWSTR;
      lpSourceName    : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function OpenBackupEventLogA
     (lpUNCServerName : Win32.LPCSTR;
      lpFileName      : Win32.LPCSTR)
      return Win32.Winnt.HANDLE;

   function OpenBackupEventLog
     (lpUNCServerName : Win32.LPCSTR;
      lpFileName      : Win32.LPCSTR)
      return Win32.Winnt.HANDLE renames OpenBackupEventLogA;

   function OpenBackupEventLogW
     (lpUNCServerName : Win32.LPCWSTR;
      lpFileName      : Win32.LPCWSTR)
      return Win32.Winnt.HANDLE;

   function ReadEventLogA
     (hEventLog                : Win32.Winnt.HANDLE;
      dwReadFlags              : Win32.DWORD;
      dwRecordOffset           : Win32.DWORD;
      lpBuffer                 : Win32.LPVOID;
      nNumberOfBytesToRead     : Win32.DWORD;
      pnBytesRead              : access Win32.DWORD;
      pnMinNumberOfBytesNeeded : access Win32.DWORD)
      return Win32.BOOL;

   function ReadEventLog
     (hEventLog                : Win32.Winnt.HANDLE;
      dwReadFlags              : Win32.DWORD;
      dwRecordOffset           : Win32.DWORD;
      lpBuffer                 : Win32.LPVOID;
      nNumberOfBytesToRead     : Win32.DWORD;
      pnBytesRead              : access Win32.DWORD;
      pnMinNumberOfBytesNeeded : access Win32.DWORD)
      return Win32.BOOL renames ReadEventLogA;

   function ReadEventLogW
     (hEventLog                : Win32.Winnt.HANDLE;
      dwReadFlags              : Win32.DWORD;
      dwRecordOffset           : Win32.DWORD;
      lpBuffer                 : Win32.LPVOID;
      nNumberOfBytesToRead     : Win32.DWORD;
      pnBytesRead              : access Win32.DWORD;
      pnMinNumberOfBytesNeeded : access Win32.DWORD)
      return Win32.BOOL;

   function ReportEventA
     (hEventLog   : Win32.Winnt.HANDLE;
      wType       : Win32.WORD;
      wCategory   : Win32.WORD;
      dwEventID   : Win32.DWORD;
      lpUserSid   : Win32.Winnt.PSID;
      wNumStrings : Win32.WORD;
      dwDataSize  : Win32.DWORD;
      lpStrings   : access Win32.LPCSTR;
      lpRawData   : Win32.LPVOID)
      return Win32.BOOL;

   function ReportEvent
     (hEventLog   : Win32.Winnt.HANDLE;
      wType       : Win32.WORD;
      wCategory   : Win32.WORD;
      dwEventID   : Win32.DWORD;
      lpUserSid   : Win32.Winnt.PSID;
      wNumStrings : Win32.WORD;
      dwDataSize  : Win32.DWORD;
      lpStrings   : access Win32.LPCSTR;
      lpRawData   : Win32.LPVOID)
      return Win32.BOOL renames ReportEventA;

   function ReportEventW
     (hEventLog   : Win32.Winnt.HANDLE;
      wType       : Win32.WORD;
      wCategory   : Win32.WORD;
      dwEventID   : Win32.DWORD;
      lpUserSid   : Win32.Winnt.PSID;
      wNumStrings : Win32.WORD;
      dwDataSize  : Win32.DWORD;
      lpStrings   : access Win32.LPCWSTR;
      lpRawData   : Win32.LPVOID)
      return Win32.BOOL;

   function DuplicateToken
     (ExistingTokenHandle  : Win32.Winnt.HANDLE;
      ImpersonationLevel   : Win32.Winnt.SECURITY_IMPERSONATION_LEVEL;
      DuplicateTokenHandle : Win32.Winnt.PHANDLE)
      return Win32.BOOL;

   function GetKernelObjectSecurity
     (Handle               : Win32.Winnt.HANDLE;
      RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR;
      nLength              : Win32.DWORD;
      lpnLengthNeeded      : Win32.LPDWORD)
      return Win32.BOOL;

   function ImpersonateNamedPipeClient
     (hNamedPipe : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function ImpersonateSelf
     (ImpersonationLevel : Win32.Winnt.SECURITY_IMPERSONATION_LEVEL)
      return Win32.BOOL;

   function RevertToSelf return Win32.BOOL;

   function SetThreadToken
     (Thread : Win32.Winnt.PHANDLE;
      Token  : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function AccessCheck
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      ClientToken         : Win32.Winnt.HANDLE;
      DesiredAccess       : Win32.DWORD;
      GenericMapping      : Win32.Winnt.PGENERIC_MAPPING;
      PrivilegeSet        : Win32.Winnt.PPRIVILEGE_SET;
      PrivilegeSetLength  : Win32.LPDWORD;
      GrantedAccess       : Win32.LPDWORD;
      AccessStatus        : Win32.LPBOOL)
      return Win32.BOOL;

   function OpenProcessToken
     (ProcessHandle : Win32.Winnt.HANDLE;
      DesiredAccess : Win32.DWORD;
      TokenHandle   : Win32.Winnt.PHANDLE)
      return Win32.BOOL;

   function OpenThreadToken
     (ThreadHandle  : Win32.Winnt.HANDLE;
      DesiredAccess : Win32.DWORD;
      OpenAsSelf    : Win32.BOOL;
      TokenHandle   : Win32.Winnt.PHANDLE)
      return Win32.BOOL;

   function GetTokenInformation
     (TokenHandle            : Win32.Winnt.HANDLE;
      TokenInformationClass  : Win32.Winnt.TOKEN_INFORMATION_CLASS;
      TokenInformation       : Win32.LPVOID;
      TokenInformationLength : Win32.DWORD;
      ReturnLength           : access Win32.DWORD)
      return Win32.BOOL;

   function SetTokenInformation
     (TokenHandle            : Win32.Winnt.HANDLE;
      TokenInformationClass  : Win32.Winnt.TOKEN_INFORMATION_CLASS;
      TokenInformation       : Win32.LPVOID;
      TokenInformationLength : Win32.DWORD)
      return Win32.BOOL;

   function AdjustTokenPrivileges
     (TokenHandle          : Win32.Winnt.HANDLE;
      DisableAllPrivileges : Win32.BOOL;
      NewState             : Win32.Winnt.PTOKEN_PRIVILEGES;
      BufferLength         : Win32.DWORD;
      PreviousState        : Win32.Winnt.PTOKEN_PRIVILEGES;
      ReturnLength         : access Win32.DWORD)
      return Win32.BOOL;

   function AdjustTokenGroups
     (TokenHandle    : Win32.Winnt.HANDLE;
      ResetToDefault : Win32.BOOL;
      NewState       : Win32.Winnt.PTOKEN_GROUPS;
      BufferLength   : Win32.DWORD;
      PreviousState  : Win32.Winnt.PTOKEN_GROUPS;
      ReturnLength   : access Win32.DWORD)
      return Win32.BOOL;

   function PrivilegeCheck
     (ClientToken        : Win32.Winnt.HANDLE;
      RequiredPrivileges : Win32.Winnt.PPRIVILEGE_SET;
      pfResult           : Win32.LPBOOL)
      return Win32.BOOL;

   function AccessCheckAndAuditAlarmA
     (SubsystemName      : Win32.LPCSTR;
      HandleId           : Win32.LPVOID;
      ObjectTypeName     : Win32.LPSTR;
      ObjectName         : Win32.LPSTR;
      SecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      DesiredAccess      : Win32.DWORD;
      GenericMapping     : Win32.Winnt.PGENERIC_MAPPING;
      ObjectCreation     : Win32.BOOL;
      GrantedAccess      : Win32.LPDWORD;
      AccessStatus       : Win32.LPBOOL;
      pfGenerateOnClose  : Win32.LPBOOL)
      return Win32.BOOL;

   function AccessCheckAndAuditAlarm
     (SubsystemName      : Win32.LPCSTR;
      HandleId           : Win32.LPVOID;
      ObjectTypeName     : Win32.LPSTR;
      ObjectName         : Win32.LPSTR;
      SecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      DesiredAccess      : Win32.DWORD;
      GenericMapping     : Win32.Winnt.PGENERIC_MAPPING;
      ObjectCreation     : Win32.BOOL;
      GrantedAccess      : Win32.LPDWORD;
      AccessStatus       : Win32.LPBOOL;
      pfGenerateOnClose  : Win32.LPBOOL)
      return Win32.BOOL renames AccessCheckAndAuditAlarmA;

   function AccessCheckAndAuditAlarmW
     (SubsystemName      : Win32.LPCWSTR;
      HandleId           : Win32.LPVOID;
      ObjectTypeName     : Win32.LPWSTR;
      ObjectName         : Win32.LPWSTR;
      SecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      DesiredAccess      : Win32.DWORD;
      GenericMapping     : Win32.Winnt.PGENERIC_MAPPING;
      ObjectCreation     : Win32.BOOL;
      GrantedAccess      : Win32.LPDWORD;
      AccessStatus       : Win32.LPBOOL;
      pfGenerateOnClose  : Win32.LPBOOL)
      return Win32.BOOL;

   function ObjectOpenAuditAlarmA
     (SubsystemName       : Win32.LPCSTR;
      HandleId            : Win32.LPVOID;
      ObjectTypeName      : Win32.LPSTR;
      ObjectName          : Win32.LPSTR;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      ClientToken         : Win32.Winnt.HANDLE;
      DesiredAccess       : Win32.DWORD;
      GrantedAccess       : Win32.DWORD;
      Privileges          : Win32.Winnt.PPRIVILEGE_SET;
      ObjectCreation      : Win32.BOOL;
      AccessGranted       : Win32.BOOL;
      GenerateOnClose     : Win32.LPBOOL)
      return Win32.BOOL;

   function ObjectOpenAuditAlarm
     (SubsystemName       : Win32.LPCSTR;
      HandleId            : Win32.LPVOID;
      ObjectTypeName      : Win32.LPSTR;
      ObjectName          : Win32.LPSTR;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      ClientToken         : Win32.Winnt.HANDLE;
      DesiredAccess       : Win32.DWORD;
      GrantedAccess       : Win32.DWORD;
      Privileges          : Win32.Winnt.PPRIVILEGE_SET;
      ObjectCreation      : Win32.BOOL;
      AccessGranted       : Win32.BOOL;
      GenerateOnClose     : Win32.LPBOOL)
      return Win32.BOOL renames ObjectOpenAuditAlarmA;

   function ObjectOpenAuditAlarmW
     (SubsystemName       : Win32.LPCWSTR;
      HandleId            : Win32.LPVOID;
      ObjectTypeName      : Win32.LPWSTR;
      ObjectName          : Win32.LPWSTR;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      ClientToken         : Win32.Winnt.HANDLE;
      DesiredAccess       : Win32.DWORD;
      GrantedAccess       : Win32.DWORD;
      Privileges          : Win32.Winnt.PPRIVILEGE_SET;
      ObjectCreation      : Win32.BOOL;
      AccessGranted       : Win32.BOOL;
      GenerateOnClose     : Win32.LPBOOL)
      return Win32.BOOL;

   function ObjectPrivilegeAuditAlarmA
     (SubsystemName : Win32.LPCSTR;
      HandleId      : Win32.LPVOID;
      ClientToken   : Win32.Winnt.HANDLE;
      DesiredAccess : Win32.DWORD;
      Privileges    : Win32.Winnt.PPRIVILEGE_SET;
      AccessGranted : Win32.BOOL)
      return Win32.BOOL;

   function ObjectPrivilegeAuditAlarm
     (SubsystemName : Win32.LPCSTR;
      HandleId      : Win32.LPVOID;
      ClientToken   : Win32.Winnt.HANDLE;
      DesiredAccess : Win32.DWORD;
      Privileges    : Win32.Winnt.PPRIVILEGE_SET;
      AccessGranted : Win32.BOOL)
      return Win32.BOOL renames ObjectPrivilegeAuditAlarmA;

   function ObjectPrivilegeAuditAlarmW
     (SubsystemName : Win32.LPCWSTR;
      HandleId      : Win32.LPVOID;
      ClientToken   : Win32.Winnt.HANDLE;
      DesiredAccess : Win32.DWORD;
      Privileges    : Win32.Winnt.PPRIVILEGE_SET;
      AccessGranted : Win32.BOOL)
      return Win32.BOOL;

   function ObjectCloseAuditAlarmA
     (SubsystemName   : Win32.LPCSTR;
      HandleId        : Win32.LPVOID;
      GenerateOnClose : Win32.BOOL)
      return Win32.BOOL;

   function ObjectCloseAuditAlarm
     (SubsystemName   : Win32.LPCSTR;
      HandleId        : Win32.LPVOID;
      GenerateOnClose : Win32.BOOL)
      return Win32.BOOL renames ObjectCloseAuditAlarmA;

   function ObjectCloseAuditAlarmW
     (SubsystemName   : Win32.LPCWSTR;
      HandleId        : Win32.LPVOID;
      GenerateOnClose : Win32.BOOL)
      return Win32.BOOL;

   function PrivilegedServiceAuditAlarmA
     (SubsystemName : Win32.LPCSTR;
      ServiceName   : Win32.LPCSTR;
      ClientToken   : Win32.Winnt.HANDLE;
      Privileges    : Win32.Winnt.PPRIVILEGE_SET;
      AccessGranted : Win32.BOOL)
      return Win32.BOOL;

   function PrivilegedServiceAuditAlarm
     (SubsystemName : Win32.LPCSTR;
      ServiceName   : Win32.LPCSTR;
      ClientToken   : Win32.Winnt.HANDLE;
      Privileges    : Win32.Winnt.PPRIVILEGE_SET;
      AccessGranted : Win32.BOOL)
      return Win32.BOOL renames PrivilegedServiceAuditAlarmA;

   function PrivilegedServiceAuditAlarmW
     (SubsystemName : Win32.LPCWSTR;
      ServiceName   : Win32.LPCWSTR;
      ClientToken   : Win32.Winnt.HANDLE;
      Privileges    : Win32.Winnt.PPRIVILEGE_SET;
      AccessGranted : Win32.BOOL)
      return Win32.BOOL;

   function IsValidSid (pSid : Win32.Winnt.PSID) return Win32.BOOL;

   function IsWellKnownSid
     (pSid             : Win32.Winnt.PSID;
      WellKnownSidType : Win32.Winnt.WELL_KNOWN_SID_TYPE)
      return Win32.BOOL;

   function EqualSid
     (pSid1 : Win32.Winnt.PSID;
      pSid2 : Win32.Winnt.PSID)
      return Win32.BOOL;

   function EqualPrefixSid
     (pSid1 : Win32.Winnt.PSID;
      pSid2 : Win32.Winnt.PSID)
      return Win32.BOOL;

   function GetSidLengthRequired
     (nSubAuthorityCount : Win32.UCHAR)
      return Win32.DWORD;

   function AllocateAndInitializeSid
     (pIdentifierAuthority : Win32.Winnt.PSID_IDENTIFIER_AUTHORITY;
      nSubAuthorityCount   : Win32.BYTE;
      nSubAuthority0       : Win32.DWORD;
      nSubAuthority1       : Win32.DWORD;
      nSubAuthority2       : Win32.DWORD;
      nSubAuthority3       : Win32.DWORD;
      nSubAuthority4       : Win32.DWORD;
      nSubAuthority5       : Win32.DWORD;
      nSubAuthority6       : Win32.DWORD;
      nSubAuthority7       : Win32.DWORD;
      pSid                 : access Win32.Winnt.PSID)
      return Win32.BOOL;

   function FreeSid (pSid : Win32.Winnt.PSID) return Win32.PVOID;

   function InitializeSid
     (Sid                  : Win32.Winnt.PSID;
      pIdentifierAuthority : Win32.Winnt.PSID_IDENTIFIER_AUTHORITY;
      nSubAuthorityCount   : Win32.BYTE)
      return Win32.BOOL;

   function GetSidIdentifierAuthority
     (pSid : Win32.Winnt.PSID)
      return Win32.Winnt.PSID_IDENTIFIER_AUTHORITY;

   function GetSidSubAuthority
     (pSid          : Win32.Winnt.PSID;
      nSubAuthority : Win32.DWORD)
      return Win32.PDWORD;

   function GetSidSubAuthorityCount
     (pSid : Win32.Winnt.PSID)
      return Win32.PUCHAR;

   function GetLengthSid (pSid : Win32.Winnt.PSID) return Win32.DWORD;

   function CopySid
     (nDestinationSidLength : Win32.DWORD;
      pDestinationSid       : Win32.Winnt.PSID;
      pSourceSid            : Win32.Winnt.PSID)
      return Win32.BOOL;

   function AreAllAccessesGranted
     (GrantedAccess : Win32.DWORD;
      DesiredAccess : Win32.DWORD)
      return Win32.BOOL;

   function AreAnyAccessesGranted
     (GrantedAccess : Win32.DWORD;
      DesiredAccess : Win32.DWORD)
      return Win32.BOOL;

   procedure MapGenericMask
     (AccessMask     : access Win32.DWORD;
      GenericMapping : Win32.Winnt.PGENERIC_MAPPING);

   function IsValidAcl (pAcl : Win32.Winnt.PACL) return Win32.BOOL;

   function InitializeAcl
     (pAcl          : Win32.Winnt.PACL;
      nAclLength    : Win32.DWORD;
      dwAclRevision : Win32.DWORD)
      return Win32.BOOL;

   function GetAclInformation
     (pAcl                  : Win32.Winnt.PACL;
      pAclInformation       : Win32.LPVOID;
      nAclInformationLength : Win32.DWORD;
      dwAclInformationClass : Win32.Winnt.ACL_INFORMATION_CLASS)
      return Win32.BOOL;

   function SetAclInformation
     (pAcl                  : Win32.Winnt.PACL;
      pAclInformation       : Win32.LPVOID;
      nAclInformationLength : Win32.DWORD;
      dwAclInformationClass : Win32.Winnt.ACL_INFORMATION_CLASS)
      return Win32.BOOL;

   function AddAce
     (pAcl               : Win32.Winnt.PACL;
      dwAceRevision      : Win32.DWORD;
      dwStartingAceIndex : Win32.DWORD;
      pAceList           : Win32.LPVOID;
      nAceListLength     : Win32.DWORD)
      return Win32.BOOL;

   function DeleteAce
     (pAcl       : Win32.Winnt.PACL;
      dwAceIndex : Win32.DWORD)
      return Win32.BOOL;

   function GetAce
     (pAcl       : Win32.Winnt.PACL;
      dwAceIndex : Win32.DWORD;
      pAce       : access Win32.PVOID)
      return Win32.BOOL;

   function AddAccessAllowedAce
     (pAcl          : Win32.Winnt.PACL;
      dwAceRevision : Win32.DWORD;
      AccessMask    : Win32.DWORD;
      pSid          : Win32.Winnt.PSID)
      return Win32.BOOL;

   function AddAccessDeniedAce
     (pAcl          : Win32.Winnt.PACL;
      dwAceRevision : Win32.DWORD;
      AccessMask    : Win32.DWORD;
      pSid          : Win32.Winnt.PSID)
      return Win32.BOOL;

   function AddAuditAccessAce
     (pAcl          : Win32.Winnt.PACL;
      dwAceRevision : Win32.DWORD;
      dwAccessMask  : Win32.DWORD;
      pSid          : Win32.Winnt.PSID;
      bAuditSuccess : Win32.BOOL;
      bAuditFailure : Win32.BOOL)
      return Win32.BOOL;

   function FindFirstFreeAce
     (pAcl : Win32.Winnt.PACL;
      pAce : access Win32.PVOID)
      return Win32.BOOL;

   function InitializeSecurityDescriptor
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      dwRevision          : Win32.DWORD)
      return Win32.BOOL;

   function IsValidSecurityDescriptor
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL;

   function GetSecurityDescriptorLength
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.DWORD;

   function GetSecurityDescriptorControl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pControl            : Win32.Winnt.PSECURITY_DESCRIPTOR_CONTROL;
      lpdwRevision        : Win32.LPDWORD)
      return Win32.BOOL;

   function SetSecurityDescriptorDacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      bDaclPresent        : Win32.BOOL;
      pDacl               : Win32.Winnt.PACL;
      bDaclDefaulted      : Win32.BOOL)
      return Win32.BOOL;

   function GetSecurityDescriptorDacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpbDaclPresent      : Win32.LPBOOL;
      pDacl               : access Win32.Winnt.PACL;
      lpbDaclDefaulted    : Win32.LPBOOL)
      return Win32.BOOL;

   function SetSecurityDescriptorSacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      bSaclPresent        : Win32.BOOL;
      pSacl               : Win32.Winnt.PACL;
      bSaclDefaulted      : Win32.BOOL)
      return Win32.BOOL;

   function GetSecurityDescriptorSacl
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpbSaclPresent      : Win32.LPBOOL;
      pSacl               : access Win32.Winnt.PACL;
      lpbSaclDefaulted    : Win32.LPBOOL)
      return Win32.BOOL;

   function SetSecurityDescriptorOwner
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pOwner              : Win32.Winnt.PSID;
      bOwnerDefaulted     : Win32.BOOL)
      return Win32.BOOL;

   function GetSecurityDescriptorOwner
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pOwner              : access Win32.Winnt.PSID;
      lpbOwnerDefaulted   : Win32.LPBOOL)
      return Win32.BOOL;

   function SetSecurityDescriptorGroup
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pGroup              : Win32.Winnt.PSID;
      bGroupDefaulted     : Win32.BOOL)
      return Win32.BOOL;

   function GetSecurityDescriptorGroup
     (pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pGroup              : access Win32.Winnt.PSID;
      lpbGroupDefaulted   : Win32.LPBOOL)
      return Win32.BOOL;

   function CreatePrivateObjectSecurity
     (ParentDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR;
      CreatorDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      NewDescriptor     : access Win32.Winnt.PSECURITY_DESCRIPTOR;
      IsDirectoryObject : Win32.BOOL;
      Token             : Win32.Winnt.HANDLE;
      GenericMapping    : Win32.Winnt.PGENERIC_MAPPING)
      return Win32.BOOL;

   function SetPrivateObjectSecurity
     (SecurityInformation       : Win32.Winnt.SECURITY_INFORMATION;
      ModificationDescriptor    : Win32.Winnt.PSECURITY_DESCRIPTOR;
      ObjectsSecurityDescriptor : access Win32.Winnt.PSECURITY_DESCRIPTOR;
      GenericMapping            : Win32.Winnt.PGENERIC_MAPPING;
      Token                     : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function GetPrivateObjectSecurity
     (ObjectDescriptor    : Win32.Winnt.PSECURITY_DESCRIPTOR;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      ResultantDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      DescriptorLength    : Win32.DWORD;
      ReturnLength        : access Win32.DWORD)
      return Win32.BOOL;

   function DestroyPrivateObjectSecurity
     (ObjectDescriptor : access Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL;

   function MakeSelfRelativeSD
     (pAbsoluteSecurityDescriptor     : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pSelfRelativeSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpdwBufferLength                : Win32.LPDWORD)
      return Win32.BOOL;

   function MakeAbsoluteSD
     (pSelfRelativeSecurityDescriptor    : Win32.Winnt.PSECURITY_DESCRIPTOR;
      pAbsoluteSecurityDescriptor        : Win32.Winnt.PSECURITY_DESCRIPTOR;
      lpdwAbsoluteSecurityDescriptorSize : Win32.LPDWORD;
      pDacl                              : Win32.Winnt.PACL;
      lpdwDaclSize                       : Win32.LPDWORD;
      pSacl                              : Win32.Winnt.PACL;
      lpdwSaclSize                       : Win32.LPDWORD;
      pOwner                             : Win32.Winnt.PSID;
      lpdwOwnerSize                      : Win32.LPDWORD;
      pPrimaryGroup                      : Win32.Winnt.PSID;
      lpdwPrimaryGroupSize               : Win32.LPDWORD)
      return Win32.BOOL;

   function SetFileSecurityA
     (lpFileName          : Win32.LPCSTR;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL;

   function SetFileSecurity
     (lpFileName          : Win32.LPCSTR;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL renames SetFileSecurityA;

   function SetFileSecurityW
     (lpFileName          : Win32.LPCWSTR;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL;

   function GetFileSecurityA
     (lpFileName           : Win32.LPCSTR;
      RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR;
      nLength              : Win32.DWORD;
      lpnLengthNeeded      : Win32.LPDWORD)
      return Win32.BOOL;

   function GetFileSecurity
     (lpFileName           : Win32.LPCSTR;
      RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR;
      nLength              : Win32.DWORD;
      lpnLengthNeeded      : Win32.LPDWORD)
      return Win32.BOOL renames GetFileSecurityA;

   function GetFileSecurityW
     (lpFileName           : Win32.LPCWSTR;
      RequestedInformation : Win32.Winnt.SECURITY_INFORMATION;
      pSecurityDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR;
      nLength              : Win32.DWORD;
      lpnLengthNeeded      : Win32.LPDWORD)
      return Win32.BOOL;

   function SetKernelObjectSecurity
     (Handle              : Win32.Winnt.HANDLE;
      SecurityInformation : Win32.Winnt.SECURITY_INFORMATION;
      SecurityDescriptor  : Win32.Winnt.PSECURITY_DESCRIPTOR)
      return Win32.BOOL;

   function FindFirstChangeNotificationA
     (lpPathName     : Win32.LPCSTR;
      bWatchSubtree  : Win32.BOOL;
      dwNotifyFilter : Win32.DWORD)
      return Win32.Winnt.HANDLE;

   function FindFirstChangeNotification
     (lpPathName     : Win32.LPCSTR;
      bWatchSubtree  : Win32.BOOL;
      dwNotifyFilter : Win32.DWORD)
      return Win32.Winnt.HANDLE renames FindFirstChangeNotificationA;

   function FindFirstChangeNotificationW
     (lpPathName     : Win32.LPCWSTR;
      bWatchSubtree  : Win32.BOOL;
      dwNotifyFilter : Win32.DWORD)
      return Win32.Winnt.HANDLE;

   function FindNextChangeNotification
     (hChangeHandle : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function FindCloseChangeNotification
     (hChangeHandle : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function VirtualLock
     (lpAddress : Win32.LPVOID;
      dwSize    : Win32.Size_T)
      return Win32.BOOL;

   function VirtualUnlock
     (lpAddress : Win32.LPVOID;
      dwSize    : Win32.Size_T)
      return Win32.BOOL;

   function MapViewOfFileEx
     (hFileMappingObject   : Win32.Winnt.HANDLE;
      dwDesiredAccess      : Win32.DWORD;
      dwFileOffsetHigh     : Win32.DWORD;
      dwFileOffsetLow      : Win32.DWORD;
      dwNumberOfBytesToMap : Win32.Size_T;
      lpBaseAddress        : Win32.LPVOID)
      return Win32.LPVOID;

   function SetPriorityClass
     (hProcess        : Win32.Winnt.HANDLE;
      dwPriorityClass : Win32.DWORD)
      return Win32.BOOL;

   function GetPriorityClass
     (hProcess : Win32.Winnt.HANDLE)
      return Win32.DWORD;

   function IsBadReadPtr
     (lp   : Win32.PCVOID;
      ucb  : Win32.UINT)
      return Win32.BOOL;

   function IsBadWritePtr
     (lp   : Win32.LPVOID;
      ucb  : Win32.UINT)
      return Win32.BOOL;

   function IsBadHugeReadPtr
     (lp   : Win32.PCVOID;
      ucb  : Win32.UINT)
      return Win32.BOOL;

   function IsBadHugeWritePtr
     (lp   : Win32.LPVOID;
      ucb  : Win32.UINT)
      return Win32.BOOL;

   function IsBadCodePtr (lpfn : Win32.Windef.FARPROC) return Win32.BOOL;

   function IsBadStringPtrA
     (lpsz    : Win32.LPCSTR;
      ucchMax : Win32.UINT)
      return Win32.BOOL;

   function IsBadStringPtr
     (lpsz    : Win32.LPCSTR;
      ucchMax : Win32.UINT)
      return Win32.BOOL renames IsBadStringPtrA;

   function IsBadStringPtrW
     (lpsz    : Win32.LPCWSTR;
      ucchMax : Win32.UINT)
      return Win32.BOOL;

   function LookupAccountSidA
     (lpSystemName           : Win32.LPCSTR;
      Sid                    : Win32.Winnt.PSID;
      Name                   : Win32.LPSTR;
      cbName                 : Win32.LPDWORD;
      ReferencedDomainName   : Win32.LPSTR;
      cbReferencedDomainName : Win32.LPDWORD;
      peUse                  : Win32.Winnt.PSID_NAME_USE)
      return Win32.BOOL;

   function LookupAccountSid
     (lpSystemName           : Win32.LPCSTR;
      Sid                    : Win32.Winnt.PSID;
      Name                   : Win32.LPSTR;
      cbName                 : Win32.LPDWORD;
      ReferencedDomainName   : Win32.LPSTR;
      cbReferencedDomainName : Win32.LPDWORD;
      peUse                  : Win32.Winnt.PSID_NAME_USE)
      return Win32.BOOL renames LookupAccountSidA;

   function LookupAccountSidW
     (lpSystemName           : Win32.LPCWSTR;
      Sid                    : Win32.Winnt.PSID;
      Name                   : Win32.LPWSTR;
      cbName                 : Win32.LPDWORD;
      ReferencedDomainName   : Win32.LPWSTR;
      cbReferencedDomainName : Win32.LPDWORD;
      peUse                  : Win32.Winnt.PSID_NAME_USE)
      return Win32.BOOL;

   function LookupAccountNameA
     (lpSystemName           : Win32.LPCSTR;
      lpAccountName          : Win32.LPCSTR;
      Sid                    : Win32.Winnt.PSID;
      cbSid                  : Win32.LPDWORD;
      ReferencedDomainName   : Win32.LPSTR;
      cbReferencedDomainName : Win32.LPDWORD;
      peUse                  : Win32.Winnt.PSID_NAME_USE)
      return Win32.BOOL;

   function LookupAccountName
     (lpSystemName           : Win32.LPCSTR;
      lpAccountName          : Win32.LPCSTR;
      Sid                    : Win32.Winnt.PSID;
      cbSid                  : Win32.LPDWORD;
      ReferencedDomainName   : Win32.LPSTR;
      cbReferencedDomainName : Win32.LPDWORD;
      peUse                  : Win32.Winnt.PSID_NAME_USE)
      return Win32.BOOL renames LookupAccountNameA;

   function LookupAccountNameW
     (lpSystemName           : Win32.LPCWSTR;
      lpAccountName          : Win32.LPCWSTR;
      Sid                    : Win32.Winnt.PSID;
      cbSid                  : Win32.LPDWORD;
      ReferencedDomainName   : Win32.LPWSTR;
      cbReferencedDomainName : Win32.LPDWORD;
      peUse                  : Win32.Winnt.PSID_NAME_USE)
      return Win32.BOOL;

   function LookupPrivilegeValueA
     (lpSystemName : Win32.LPCSTR;
      lpName       : Win32.LPCSTR;
      lpLuid       : Win32.Winnt.PLUID)
      return Win32.BOOL;

   function LookupPrivilegeValue
     (lpSystemName : Win32.LPCSTR;
      lpName       : Win32.LPCSTR;
      lpLuid       : Win32.Winnt.PLUID)
      return Win32.BOOL renames LookupPrivilegeValueA;

   function LookupPrivilegeValueW
     (lpSystemName : Win32.LPCWSTR;
      lpName       : Win32.LPCWSTR;
      lpLuid       : Win32.Winnt.PLUID)
      return Win32.BOOL;

   function LookupPrivilegeNameA
     (lpSystemName : Win32.LPCSTR;
      lpLuid       : Win32.Winnt.PLUID;
      lpName       : Win32.LPSTR;
      cbName       : Win32.LPDWORD)
      return Win32.BOOL;

   function LookupPrivilegeName
     (lpSystemName : Win32.LPCSTR;
      lpLuid       : Win32.Winnt.PLUID;
      lpName       : Win32.LPSTR;
      cbName       : Win32.LPDWORD)
      return Win32.BOOL renames LookupPrivilegeNameA;

   function LookupPrivilegeNameW
     (lpSystemName : Win32.LPCWSTR;
      lpLuid       : Win32.Winnt.PLUID;
      lpName       : Win32.LPWSTR;
      cbName       : Win32.LPDWORD)
      return Win32.BOOL;

   function LookupPrivilegeDisplayNameA
     (lpSystemName  : Win32.LPCSTR;
      lpName        : Win32.LPCSTR;
      lpDisplayName : Win32.LPSTR;
      cbDisplayName : Win32.LPDWORD;
      lpLanguageId  : Win32.LPDWORD)
      return Win32.BOOL;

   function LookupPrivilegeDisplayName
     (lpSystemName  : Win32.LPCSTR;
      lpName        : Win32.LPCSTR;
      lpDisplayName : Win32.LPSTR;
      cbDisplayName : Win32.LPDWORD;
      lpLanguageId  : Win32.LPDWORD)
      return Win32.BOOL renames LookupPrivilegeDisplayNameA;

   function LookupPrivilegeDisplayNameW
     (lpSystemName  : Win32.LPCWSTR;
      lpName        : Win32.LPCWSTR;
      lpDisplayName : Win32.LPWSTR;
      cbDisplayName : Win32.LPDWORD;
      lpLanguageId  : Win32.LPDWORD)
      return Win32.BOOL;

   function AllocateLocallyUniqueId
     (Luid : Win32.Winnt.PLUID)
      return Win32.BOOL;

   function BuildCommDCBA
     (lpDef : Win32.LPCSTR;
      lpDCB : Win32.Winbase.LPDCB)
      return Win32.BOOL;

   function BuildCommDCB
     (lpDef : Win32.LPCSTR;
      lpDCB : Win32.Winbase.LPDCB)
      return Win32.BOOL renames BuildCommDCBA;

   function BuildCommDCBW
     (lpDef : Win32.LPCWSTR;
      lpDCB : Win32.Winbase.LPDCB)
      return Win32.BOOL;

   function BuildCommDCBAndTimeoutsA
     (lpDef          : Win32.LPCSTR;
      lpDCB          : Win32.Winbase.LPDCB;
      lpCommTimeouts : Win32.Winbase.LPCOMMTIMEOUTS)
      return Win32.BOOL;

   function BuildCommDCBAndTimeouts
     (lpDef          : Win32.LPCSTR;
      lpDCB          : Win32.Winbase.LPDCB;
      lpCommTimeouts : Win32.Winbase.LPCOMMTIMEOUTS)
      return Win32.BOOL renames BuildCommDCBAndTimeoutsA;

   function BuildCommDCBAndTimeoutsW
     (lpDef          : Win32.LPCWSTR;
      lpDCB          : Win32.Winbase.LPDCB;
      lpCommTimeouts : Win32.Winbase.LPCOMMTIMEOUTS)
      return Win32.BOOL;

   function CommConfigDialogA
     (lpszName : Win32.LPCSTR;
      hWnd     : Win32.Windef.HWND;
      lpCC     : LPCOMMCONFIG)
      return Win32.BOOL;

   function CommConfigDialog
     (lpszName : Win32.LPCSTR;
      hWnd     : Win32.Windef.HWND;
      lpCC     : LPCOMMCONFIG)
      return Win32.BOOL renames CommConfigDialogA;

   function CommConfigDialogW
     (lpszName : Win32.LPCWSTR;
      hWnd     : Win32.Windef.HWND;
      lpCC     : LPCOMMCONFIG)
      return Win32.BOOL;

   function GetDefaultCommConfigA
     (lpszName : Win32.LPCSTR;
      lpCC     : LPCOMMCONFIG;
      lpdwSize : Win32.LPDWORD)
      return Win32.BOOL;

   function GetDefaultCommConfig
     (lpszName : Win32.LPCSTR;
      lpCC     : LPCOMMCONFIG;
      lpdwSize : Win32.LPDWORD)
      return Win32.BOOL renames GetDefaultCommConfigA;

   function GetDefaultCommConfigW
     (lpszName : Win32.LPCWSTR;
      lpCC     : LPCOMMCONFIG;
      lpdwSize : Win32.LPDWORD)
      return Win32.BOOL;

   function SetDefaultCommConfigA
     (lpszName : Win32.LPCSTR;
      lpCC     : LPCOMMCONFIG;
      dwSize   : Win32.DWORD)
      return Win32.BOOL;

   function SetDefaultCommConfig
     (lpszName : Win32.LPCSTR;
      lpCC     : LPCOMMCONFIG;
      dwSize   : Win32.DWORD)
      return Win32.BOOL renames SetDefaultCommConfigA;

   function SetDefaultCommConfigW
     (lpszName : Win32.LPCWSTR;
      lpCC     : LPCOMMCONFIG;
      dwSize   : Win32.DWORD)
      return Win32.BOOL;

   function GetComputerNameA
     (lpBuffer : Win32.LPSTR;
      nSize    : Win32.LPDWORD)
      return Win32.BOOL;

   function GetComputerName
     (lpBuffer : Win32.LPSTR;
      nSize    : Win32.LPDWORD)
      return Win32.BOOL renames GetComputerNameA;

   function GetComputerNameW
     (lpBuffer : Win32.LPWSTR;
      nSize    : Win32.LPDWORD)
      return Win32.BOOL;

   function SetComputerNameA
     (lpComputerName : Win32.LPCSTR)
      return Win32.BOOL;

   function SetComputerName
     (lpComputerName : Win32.LPCSTR)
      return Win32.BOOL renames SetComputerNameA;

   function SetComputerNameW
     (lpComputerName : Win32.LPCWSTR)
      return Win32.BOOL;

   function GetUserNameA
     (lpBuffer : Win32.LPSTR;
      nSize    : Win32.LPDWORD)
      return Win32.BOOL;

   function GetUserName
     (lpBuffer : Win32.LPSTR;
      nSize    : Win32.LPDWORD)
      return Win32.BOOL renames GetUserNameA;

   function GetUserNameW
     (lpBuffer : Win32.LPWSTR;
      nSize    : Win32.LPDWORD)
      return Win32.BOOL;

   function QueryPerformanceCounter
     (lpPerformanceCount : Win32.Winnt.PLARGE_INTEGER)
      return Win32.BOOL;

   function QueryPerformanceFrequency
     (lpFrequency : Win32.Winnt.PLARGE_INTEGER)
      return Win32.BOOL;

   function GetVersionExA
     (lpVersionInformation : LPOSVERSIONINFOA)
      return Win32.BOOL;

   function GetVersionEx
     (lpVersionInformation : LPOSVERSIONINFOA)
      return Win32.BOOL renames GetVersionExA;

   function GetVersionExW
     (lpVersionInformation : LPOSVERSIONINFOW)
      return Win32.BOOL;

private

   pragma Convention (C_Pass_By_Copy, COMSTAT);
   pragma Convention (C, DCB);
   pragma Convention (C, OVERLAPPED);
   pragma Convention (C_Pass_By_Copy, SECURITY_ATTRIBUTES);
   pragma Convention (C_Pass_By_Copy, PROCESS_INFORMATION);
   pragma Convention (C_Pass_By_Copy, FILETIME);
   pragma Convention (C_Pass_By_Copy, SYSTEMTIME);
   pragma Convention (C, WIN32_FILE_ATTRIBUTE_DATA);
   pragma Convention (C, COMMPROP);
   pragma Convention (C, COMMTIMEOUTS);
   pragma Convention (C, COMMCONFIG);
   pragma Convention (C, SYSTEM_INFO);
   pragma Convention (C, MEMORYSTATUS);
   pragma Convention (C, EXCEPTION_DEBUG_INFO);
   pragma Convention (C_Pass_By_Copy, CREATE_THREAD_DEBUG_INFO);
   pragma Convention (C, CREATE_PROCESS_DEBUG_INFO);
   pragma Convention (C_Pass_By_Copy, EXIT_THREAD_DEBUG_INFO);
   pragma Convention (C_Pass_By_Copy, EXIT_PROCESS_DEBUG_INFO);
   pragma Convention (C, LOAD_DLL_DEBUG_INFO);
   pragma Convention (C_Pass_By_Copy, UNLOAD_DLL_DEBUG_INFO);
   pragma Convention (C_Pass_By_Copy, OUTPUT_DEBUG_STRING_INFO);
   pragma Convention (C_Pass_By_Copy, RIP_INFO);
   pragma Convention (C, DEBUG_EVENT);
   pragma Convention (C, OFSTRUCT);
   pragma Convention (C_Pass_By_Copy, struct_anonymous2_t);
   pragma Convention (C_Pass_By_Copy, struct_anonymous3_t);
   pragma Convention (C, PROCESS_HEAP_ENTRY);
   pragma Convention (C, BY_HANDLE_FILE_INFORMATION);
   pragma Convention (C, TIME_ZONE_INFORMATION);
   pragma Convention (C, WIN32_STREAM_ID);
   pragma Convention (C, STARTUPINFOA);
   pragma Convention (C, STARTUPINFOW);
   pragma Convention (C, WIN32_FIND_DATAA);
   pragma Convention (C, WIN32_FIND_DATAW);
   pragma Convention (C, OSVERSIONINFOA);
   pragma Convention (C, OSVERSIONINFOW);

   type Uns is mod 2 ** Standard'Address_Size;
   function To_Handle is new Ada.Unchecked_Conversion (
      Uns,
      Win32.Winnt.HANDLE);

   INVALID_HANDLE_VALUE : constant Win32.Winnt.HANDLE := To_Handle (Uns'Last);

   pragma Inline (GlobalDiscard);
   pragma Inline (LocalDiscard);
   pragma Inline (MAKEINTATOM);

   pragma Import (Stdcall, InterlockedIncrement, "InterlockedIncrement");
   pragma Import (Stdcall, InterlockedDecrement, "InterlockedDecrement");
   pragma Import (Stdcall, InterlockedExchange, "InterlockedExchange");
   pragma Import (Stdcall, FreeResource, "FreeResource");
   pragma Import (Stdcall, LockResource, "LockResource");
   pragma Import (Stdcall, WinMain, "WinMain");
   pragma Import (Stdcall, FreeLibrary, "FreeLibrary");
   pragma Import
     (Stdcall,
      FreeLibraryAndExitThread,
      "FreeLibraryAndExitThread");
   pragma Import
     (Stdcall,
      DisableThreadLibraryCalls,
      "DisableThreadLibraryCalls");
   pragma Import (Stdcall, GetProcAddress, "GetProcAddress");
   pragma Import (Stdcall, GetVersion, "GetVersion");
   pragma Import (Stdcall, GlobalAlloc, "GlobalAlloc");
   pragma Import (Stdcall, GlobalReAlloc, "GlobalReAlloc");
   pragma Import (Stdcall, GlobalSize, "GlobalSize");
   pragma Import (Stdcall, GlobalFlags, "GlobalFlags");
   pragma Import (Stdcall, GlobalLock, "GlobalLock");
   pragma Import (Stdcall, GlobalHandle, "GlobalHandle");
   pragma Import (Stdcall, GlobalUnlock, "GlobalUnlock");
   pragma Import (Stdcall, GlobalFree, "GlobalFree");
   pragma Import (Stdcall, GlobalCompact, "GlobalCompact");
   pragma Import (Stdcall, GlobalFix, "GlobalFix");
   pragma Import (Stdcall, GlobalUnfix, "GlobalUnfix");
   pragma Import (Stdcall, GlobalWire, "GlobalWire");
   pragma Import (Stdcall, GlobalUnWire, "GlobalUnWire");
   pragma Import (Stdcall, GlobalMemoryStatus, "GlobalMemoryStatus");
   pragma Import (Stdcall, LocalAlloc, "LocalAlloc");
   pragma Import (Stdcall, LocalReAlloc, "LocalReAlloc");
   pragma Import (Stdcall, LocalLock, "LocalLock");
   pragma Import (Stdcall, LocalHandle, "LocalHandle");
   pragma Import (Stdcall, LocalUnlock, "LocalUnlock");
   pragma Import (Stdcall, LocalSize, "LocalSize");
   pragma Import (Stdcall, LocalFlags, "LocalFlags");
   pragma Import (Stdcall, Localfree, "LocalFree");
   pragma Import (Stdcall, LocalShrink, "LocalShrink");
   pragma Import (Stdcall, LocalCompact, "LocalCompact");
   pragma Import (Stdcall, FlushInstructionCache, "FlushInstructionCache");
   pragma Import (Stdcall, VirtualAlloc, "VirtualAlloc");
   pragma Import (Stdcall, VirtualFree, "VirtualFree");
   pragma Import (Stdcall, VirtualProtect, "VirtualProtect");
   pragma Import (Stdcall, VirtualQuery, "VirtualQuery");
   pragma Import (Stdcall, VirtualProtectEx, "VirtualProtectEx");
   pragma Import (Stdcall, VirtualQueryEx, "VirtualQueryEx");
   pragma Import (Stdcall, HeapCreate, "HeapCreate");
   pragma Import (Stdcall, HeapDestroy, "HeapDestroy");
   pragma Import (Stdcall, HeapAlloc, "HeapAlloc");
   pragma Import (Stdcall, HeapReAlloc, "HeapReAlloc");
   pragma Import (Stdcall, HeapFree, "HeapFree");
   pragma Import (Stdcall, HeapSize, "HeapSize");
   pragma Import (Stdcall, HeapValidate, "HeapValidate");
   pragma Import (Stdcall, HeapCompact, "HeapCompact");
   pragma Import (Stdcall, GetProcessHeap, "GetProcessHeap");
   pragma Import (Stdcall, GetProcessHeaps, "GetProcessHeaps");
   pragma Import (Stdcall, HeapLock, "HeapLock");
   pragma Import (Stdcall, HeapUnlock, "HeapUnlock");
   pragma Import (Stdcall, HeapWalk, "HeapWalk");
   pragma Import (Stdcall, GetBinaryTypeA, "GetBinaryTypeA");
   pragma Import (Stdcall, GetBinaryTypeW, "GetBinaryTypeW");
   pragma Import (Stdcall, GetShortPathNameA, "GetShortPathNameA");
   pragma Import (Stdcall, GetShortPathNameW, "GetShortPathNameW");
   pragma Import (Stdcall, GetProcessAffinityMask, "GetProcessAffinityMask");
   pragma Import (Stdcall, GetProcessTimes, "GetProcessTimes");
   pragma Import
     (Stdcall,
      GetProcessWorkingSetSize,
      "GetProcessWorkingSetSize");
   pragma Import
     (Stdcall,
      SetProcessWorkingSetSize,
      "SetProcessWorkingSetSize");
   pragma Import (Stdcall, OpenProcess, "OpenProcess");
   pragma Import (Stdcall, GetCurrentProcess, "GetCurrentProcess");
   pragma Import (Stdcall, GetCurrentProcessId, "GetCurrentProcessId");
   pragma Import (Stdcall, ExitProcess, "ExitProcess");
   pragma Import (Stdcall, TerminateProcess, "TerminateProcess");
   pragma Import (Stdcall, GetExitCodeProcess, "GetExitCodeProcess");
   pragma Import (Stdcall, FatalExit, "FatalExit");
   pragma Import (Stdcall, GetEnvironmentStrings, "GetEnvironmentStrings");
   pragma Import (Stdcall, GetEnvironmentStringsW, "GetEnvironmentStringsW");
   pragma Import
     (Stdcall,
      FreeEnvironmentStringsA,
      "FreeEnvironmentStringsA");
   pragma Import
     (Stdcall,
      FreeEnvironmentStringsW,
      "FreeEnvironmentStringsW");
   pragma Import (Stdcall, RaiseException, "RaiseException");
   pragma Import
     (Stdcall,
      UnhandledExceptionFilter,
      "UnhandledExceptionFilter");
   pragma Import
     (Stdcall,
      SetUnhandledExceptionFilter,
      "SetUnhandledExceptionFilter");
   pragma Import (Stdcall, CreateThread, "CreateThread");
   pragma Import (Stdcall, CreateRemoteThread, "CreateRemoteThread");
   pragma Import (Stdcall, GetCurrentThread, "GetCurrentThread");
   pragma Import (Stdcall, GetCurrentThreadId, "GetCurrentThreadId");
   pragma Import (Stdcall, SetThreadAffinityMask, "SetThreadAffinityMask");
   pragma Import (Stdcall, SetThreadPriority, "SetThreadPriority");
   pragma Import (Stdcall, GetThreadPriority, "GetThreadPriority");
   pragma Import (Stdcall, GetThreadTimes, "GetThreadTimes");
   pragma Import (Stdcall, ExitThread, "ExitThread");
   pragma Import (Stdcall, TerminateThread, "TerminateThread");
   pragma Import (Stdcall, GetExitCodeThread, "GetExitCodeThread");
   pragma Import (Stdcall, GetThreadSelectorEntry, "GetThreadSelectorEntry");
   pragma Import (Stdcall, GetLastError, "GetLastError");
   pragma Import (Stdcall, SetLastError, "SetLastError");
   pragma Import (Stdcall, GetOverlappedResult, "GetOverlappedResult");
   pragma Import (Stdcall, CreateIoCompletionPort, "CreateIoCompletionPort");
   pragma Import
     (Stdcall,
      GetQueuedCompletionStatus,
      "GetQueuedCompletionStatus");
   pragma Import (Stdcall, SetErrorMode, "SetErrorMode");
   pragma Import (Stdcall, ReadProcessMemory, "ReadProcessMemory");
   pragma Import (Stdcall, WriteProcessMemory, "WriteProcessMemory");
   pragma Import (Stdcall, GetThreadContext, "GetThreadContext");
   pragma Import (Stdcall, SetThreadContext, "SetThreadContext");
   pragma Import (Stdcall, SuspendThread, "SuspendThread");
   pragma Import (Stdcall, ResumeThread, "ResumeThread");
   pragma Import (Stdcall, DebugBreak, "DebugBreak");
   pragma Import (Stdcall, WaitForDebugEvent, "WaitForDebugEvent");
   pragma Import (Stdcall, ContinueDebugEvent, "ContinueDebugEvent");
   pragma Import (Stdcall, DebugActiveProcess, "DebugActiveProcess");
   pragma Import
     (Stdcall,
      InitializeCriticalSection,
      "InitializeCriticalSection");
   pragma Import (Stdcall, EnterCriticalSection, "EnterCriticalSection");
   pragma Import
     (Stdcall,
      TryEnterCriticalSection,
      "TryEnterCriticalSection");
   pragma Import (Stdcall, LeaveCriticalSection, "LeaveCriticalSection");
   pragma Import (Stdcall, DeleteCriticalSection, "DeleteCriticalSection");
   pragma Import (Stdcall, SetEvent, "SetEvent");
   pragma Import (Stdcall, ResetEvent, "ResetEvent");
   pragma Import (Stdcall, PulseEvent, "PulseEvent");
   pragma Import (Stdcall, ReleaseSemaphore, "ReleaseSemaphore");
   pragma Import (Stdcall, ReleaseMutex, "ReleaseMutex");
   pragma Import (Stdcall, WaitForSingleObject, "WaitForSingleObject");
   pragma Import (Stdcall, WaitForMultipleObjects, "WaitForMultipleObjects");
   pragma Import (Stdcall, Sleep, "Sleep");
   pragma Import (Stdcall, LoadResource, "LoadResource");
   pragma Import (Stdcall, SizeofResource, "SizeofResource");
   pragma Import (Stdcall, GlobalDeleteAtom, "GlobalDeleteAtom");
   pragma Import (Stdcall, InitAtomTable, "InitAtomTable");
   pragma Import (Stdcall, DeleteAtom, "DeleteAtom");
   pragma Import (Stdcall, SetHandleCount, "SetHandleCount");
   pragma Import (Stdcall, GetLogicalDrives, "GetLogicalDrives");
   pragma Import (Stdcall, LockFile, "LockFile");
   pragma Import (Stdcall, UnlockFile, "UnlockFile");
   pragma Import (Stdcall, LockFileEx, "LockFileEx");
   pragma Import (Stdcall, UnlockFileEx, "UnlockFileEx");

   pragma Import
     (Stdcall,
      GetFileInformationByHandle,
      "GetFileInformationByHandle");

   pragma Import (Stdcall, GetFileType, "GetFileType");
   pragma Import (Stdcall, GetFileSize, "GetFileSize");
   pragma Import (Stdcall, GetStdHandle, "GetStdHandle");
   pragma Import (Stdcall, SetStdHandle, "SetStdHandle");
   pragma Import (Stdcall, WriteFile, "WriteFile");
   pragma Import (Stdcall, ReadFile, "ReadFile");
   pragma Import (Stdcall, FlushFileBuffers, "FlushFileBuffers");
   pragma Import (Stdcall, DeviceIoControl, "DeviceIoControl");
   pragma Import (Stdcall, SetEndOfFile, "SetEndOfFile");
   pragma Import (Stdcall, SetFilePointer, "SetFilePointer");
   pragma Import (Stdcall, FindClose, "FindClose");
   pragma Import (Stdcall, GetFileTime, "GetFileTime");
   pragma Import (Stdcall, SetFileTime, "SetFileTime");
   pragma Import (Stdcall, CloseHandle, "CloseHandle");
   pragma Import (Stdcall, DuplicateHandle, "DuplicateHandle");
   pragma Import (Stdcall, GetHandleInformation, "GetHandleInformation");
   pragma Import (Stdcall, SetHandleInformation, "SetHandleInformation");
   pragma Import (Stdcall, LoadModule, "LoadModule");
   pragma Import (Stdcall, WinExec, "WinExec");
   pragma Import (Stdcall, ClearCommBreak, "ClearCommBreak");
   pragma Import (Stdcall, ClearCommError, "ClearCommError");
   pragma Import (Stdcall, SetupComm, "SetupComm");
   pragma Import (Stdcall, EscapeCommFunction, "EscapeCommFunction");
   pragma Import (Stdcall, GetCommConfig, "GetCommConfig");
   pragma Import (Stdcall, GetCommMask, "GetCommMask");
   pragma Import (Stdcall, GetCommProperties, "GetCommProperties");
   pragma Import (Stdcall, GetCommModemStatus, "GetCommModemStatus");
   pragma Import (Stdcall, GetCommState, "GetCommState");
   pragma Import (Stdcall, GetCommTimeouts, "GetCommTimeouts");
   pragma Import (Stdcall, PurgeComm, "PurgeComm");
   pragma Import (Stdcall, SetCommBreak, "SetCommBreak");
   pragma Import (Stdcall, SetCommConfig, "SetCommConfig");
   pragma Import (Stdcall, SetCommMask, "SetCommMask");
   pragma Import (Stdcall, SetCommState, "SetCommState");
   pragma Import (Stdcall, SetCommTimeouts, "SetCommTimeouts");
   pragma Import (Stdcall, TransmitCommChar, "TransmitCommChar");
   pragma Import (Stdcall, WaitCommEvent, "WaitCommEvent");
   pragma Import (Stdcall, SetTapePosition, "SetTapePosition");
   pragma Import (Stdcall, GetTapePosition, "GetTapePosition");
   pragma Import (Stdcall, PrepareTape, "PrepareTape");
   pragma Import (Stdcall, EraseTape, "EraseTape");
   pragma Import (Stdcall, CreateTapePartition, "CreateTapePartition");
   pragma Import (Stdcall, WriteTapemark, "WriteTapemark");
   pragma Import (Stdcall, GetTapeStatus, "GetTapeStatus");
   pragma Import (Stdcall, GetTapeParameters, "GetTapeParameters");
   pragma Import (Stdcall, SetTapeParameters, "SetTapeParameters");
   pragma Import (Stdcall, Beep, "Beep");
   pragma Import (Stdcall, OpenSound, "OpenSound");
   pragma Import (Stdcall, CloseSound, "CloseSound");
   pragma Import (Stdcall, StartSound, "StartSound");
   pragma Import (Stdcall, StopSound, "StopSound");
   pragma Import (Stdcall, WaitSoundState, "WaitSoundState");
   pragma Import (Stdcall, SyncAllVoices, "SyncAllVoices");
   pragma Import (Stdcall, CountVoiceNotes, "CountVoiceNotes");
   pragma Import (Stdcall, GetThresholdEvent, "GetThresholdEvent");
   pragma Import (Stdcall, GetThresholdStatus, "GetThresholdStatus");
   pragma Import (Stdcall, SetSoundNoise, "SetSoundNoise");
   pragma Import (Stdcall, SetVoiceAccent, "SetVoiceAccent");
   pragma Import (Stdcall, SetVoiceEnvelope, "SetVoiceEnvelope");
   pragma Import (Stdcall, SetVoiceNote, "SetVoiceNote");
   pragma Import (Stdcall, SetVoiceQueueSize, "SetVoiceQueueSize");
   pragma Import (Stdcall, SetVoiceSound, "SetVoiceSound");
   pragma Import (Stdcall, SetVoiceThreshold, "SetVoiceThreshold");
   pragma Import (Stdcall, MulDiv, "MulDiv");
   pragma Import (Stdcall, GetSystemTime, "GetSystemTime");
   pragma Import (Stdcall, SetSystemTime, "SetSystemTime");
   pragma Import (Stdcall, GetLocalTime, "GetLocalTime");
   pragma Import (Stdcall, SetLocalTime, "SetLocalTime");
   pragma Import (Stdcall, GetSystemInfo, "GetSystemInfo");
   pragma Import
     (Stdcall,
      SystemTimeToTzSpecificLocalTime,
      "SystemTimeToTzSpecificLocalTime");
   pragma Import (Stdcall, GetTimeZoneInformation, "GetTimeZoneInformation");
   pragma Import (Stdcall, SetTimeZoneInformation, "SetTimeZoneInformation");
   pragma Import (Stdcall, SystemTimeToFileTime, "SystemTimeToFileTime");
   pragma Import
     (Stdcall,
      FileTimeToLocalFileTime,
      "FileTimeToLocalFileTime");
   pragma Import
     (Stdcall,
      LocalFileTimeToFileTime,
      "LocalFileTimeToFileTime");
   pragma Import (Stdcall, FileTimeToSystemTime, "FileTimeToSystemTime");
   pragma Import (Stdcall, CompareFileTime, "CompareFileTime");
   pragma Import (Stdcall, FileTimeToDosDateTime, "FileTimeToDosDateTime");
   pragma Import (Stdcall, DosDateTimeToFileTime, "DosDateTimeToFileTime");
   pragma Import (Stdcall, GetTickCount, "GetTickCount");
   pragma Import
     (Stdcall,
      SetSystemTimeAdjustment,
      "SetSystemTimeAdjustment");
   pragma Import
     (Stdcall,
      GetSystemTimeAdjustment,
      "GetSystemTimeAdjustment");
   pragma Import (Stdcall, CreatePipe, "CreatePipe");
   pragma Import (Stdcall, ConnectNamedPipe, "ConnectNamedPipe");
   pragma Import (Stdcall, DisconnectNamedPipe, "DisconnectNamedPipe");
   pragma Import
     (Stdcall,
      SetNamedPipeHandleState,
      "SetNamedPipeHandleState");
   pragma Import (Stdcall, GetNamedPipeInfo, "GetNamedPipeInfo");
   pragma Import (Stdcall, PeekNamedPipe, "PeekNamedPipe");
   pragma Import (Stdcall, TransactNamedPipe, "TransactNamedPipe");
   pragma Import (Stdcall, CreateMailslotA, "CreateMailslotA");
   pragma Import (Stdcall, CreateMailslotW, "CreateMailslotW");
   pragma Import (Stdcall, GetMailslotInfo, "GetMailslotInfo");
   pragma Import (Stdcall, SetMailslotInfo, "SetMailslotInfo");
   pragma Import (Stdcall, MapViewOfFile, "MapViewOfFile");
   pragma Import (Stdcall, FlushViewOfFile, "FlushViewOfFile");
   pragma Import (Stdcall, UnmapViewOfFile, "UnmapViewOfFile");
   pragma Import (Stdcall, lstrcmpA, "lstrcmpA");
   pragma Import (Stdcall, lstrcmpW, "lstrcmpW");
   pragma Import (Stdcall, lstrcmpiA, "lstrcmpiA");
   pragma Import (Stdcall, lstrcmpiW, "lstrcmpiW");
   pragma Import (Stdcall, lstrcpynA, "lstrcpynA");
   pragma Import (Stdcall, lstrcpynW, "lstrcpynW");
   pragma Import (Stdcall, lstrcpyA, "lstrcpyA");
   pragma Import (Stdcall, lstrcpyW, "lstrcpyW");
   pragma Import (Stdcall, lstrcatA, "lstrcatA");
   pragma Import (Stdcall, lstrcatW, "lstrcatW");
   pragma Import (Stdcall, lstrlenA, "lstrlenA");
   pragma Import (Stdcall, lstrlenW, "lstrlenW");
   pragma Import (Stdcall, OpenFile, "OpenFile");
   pragma Import (Stdcall, lopen, "_lopen");
   pragma Import (Stdcall, lcreat, "_lcreat");
   pragma Import (Stdcall, lread, "_lread");
   pragma Import (Stdcall, lwrite, "_lwrite");
   pragma Import (Stdcall, hread, "_hread");
   pragma Import (Stdcall, hwrite, "_hwrite");
   pragma Import (Stdcall, lclose, "_lclose");
   pragma Import (Stdcall, llseek, "_llseek");
   pragma Import (Stdcall, IsTextUnicode, "IsTextUnicode");
   pragma Import (Stdcall, TlsAlloc, "TlsAlloc");
   pragma Import (Stdcall, TlsGetValue, "TlsGetValue");
   pragma Import (Stdcall, TlsSetValue, "TlsSetValue");
   pragma Import (Stdcall, TlsFree, "TlsFree");
   pragma Import (Stdcall, SleepEx, "SleepEx");
   pragma Import (Stdcall, WaitForSingleObjectEx, "WaitForSingleObjectEx");
   pragma Import
     (Stdcall,
      WaitForMultipleObjectsEx,
      "WaitForMultipleObjectsEx");
   pragma Import (Stdcall, ReadFileEx, "ReadFileEx");
   pragma Import (Stdcall, WriteFileEx, "WriteFileEx");
   pragma Import (Stdcall, BackupRead, "BackupRead");
   pragma Import (Stdcall, BackupSeek, "BackupSeek");
   pragma Import (Stdcall, BackupWrite, "BackupWrite");
   pragma Import (Stdcall, CreateMutexA, "CreateMutexA");
   pragma Import (Stdcall, CreateMutexW, "CreateMutexW");
   pragma Import (Stdcall, OpenMutexA, "OpenMutexA");
   pragma Import (Stdcall, OpenMutexW, "OpenMutexW");
   pragma Import (Stdcall, CreateEventA, "CreateEventA");
   pragma Import (Stdcall, CreateEventW, "CreateEventW");
   pragma Import (Stdcall, OpenEventA, "OpenEventA");
   pragma Import (Stdcall, OpenEventW, "OpenEventW");
   pragma Import (Stdcall, CreateSemaphoreA, "CreateSemaphoreA");
   pragma Import (Stdcall, CreateSemaphoreW, "CreateSemaphoreW");
   pragma Import (Stdcall, OpenSemaphoreA, "OpenSemaphoreA");
   pragma Import (Stdcall, OpenSemaphoreW, "OpenSemaphoreW");
   pragma Import (Stdcall, CreateFileMappingA, "CreateFileMappingA");
   pragma Import (Stdcall, CreateFileMappingW, "CreateFileMappingW");
   pragma Import (Stdcall, OpenFileMappingA, "OpenFileMappingA");
   pragma Import (Stdcall, OpenFileMappingW, "OpenFileMappingW");
   pragma Import
     (Stdcall,
      GetLogicalDriveStringsA,
      "GetLogicalDriveStringsA");
   pragma Import
     (Stdcall,
      GetLogicalDriveStringsW,
      "GetLogicalDriveStringsW");
   pragma Import (Stdcall, LoadLibraryA, "LoadLibraryA");
   pragma Import (Stdcall, LoadLibraryW, "LoadLibraryW");
   pragma Import (Stdcall, LoadLibraryExA, "LoadLibraryExA");
   pragma Import (Stdcall, LoadLibraryExW, "LoadLibraryExW");
   pragma Import (Stdcall, GetModuleFileNameA, "GetModuleFileNameA");
   pragma Import (Stdcall, GetModuleFileNameW, "GetModuleFileNameW");
   pragma Import (Stdcall, GetModuleHandleA, "GetModuleHandleA");
   pragma Import (Stdcall, GetModuleHandleW, "GetModuleHandleW");
   pragma Import (Stdcall, CreateProcessA, "CreateProcessA");
   pragma Import (Stdcall, CreateProcessW, "CreateProcessW");
   pragma Import
     (Stdcall,
      SetProcessShutdownParameters,
      "SetProcessShutdownParameters");
   pragma Import
     (Stdcall,
      GetProcessShutdownParameters,
      "GetProcessShutdownParameters");
   pragma Import (Stdcall, FatalAppExitA, "FatalAppExitA");
   pragma Import (Stdcall, FatalAppExitW, "FatalAppExitW");
   pragma Import (Stdcall, GetStartupInfoA, "GetStartupInfoA");
   pragma Import (Stdcall, GetStartupInfoW, "GetStartupInfoW");
   pragma Import (Stdcall, GetCommandLineA, "GetCommandLineA");
   pragma Import (Stdcall, GetCommandLineW, "GetCommandLineW");
   pragma Import
     (Stdcall,
      GetEnvironmentVariableA,
      "GetEnvironmentVariableA");
   pragma Import
     (Stdcall,
      GetEnvironmentVariableW,
      "GetEnvironmentVariableW");
   pragma Import
     (Stdcall,
      SetEnvironmentVariableA,
      "SetEnvironmentVariableA");
   pragma Import
     (Stdcall,
      SetEnvironmentVariableW,
      "SetEnvironmentVariableW");
   pragma Import
     (Stdcall,
      ExpandEnvironmentStringsA,
      "ExpandEnvironmentStringsA");
   pragma Import
     (Stdcall,
      ExpandEnvironmentStringsW,
      "ExpandEnvironmentStringsW");
   pragma Import (Stdcall, OutputDebugStringA, "OutputDebugStringA");
   pragma Import (Stdcall, OutputDebugStringW, "OutputDebugStringW");
   pragma Import (Stdcall, FindResourceA, "FindResourceA");
   pragma Import (Stdcall, FindResourceW, "FindResourceW");
   pragma Import (Stdcall, FindResourceExA, "FindResourceExA");
   pragma Import (Stdcall, FindResourceExW, "FindResourceExW");
   pragma Import (Stdcall, EnumResourceTypesA, "EnumResourceTypesA");
   pragma Import (Stdcall, EnumResourceTypesW, "EnumResourceTypesW");
   pragma Import (Stdcall, EnumResourceNamesA, "EnumResourceNamesA");
   pragma Import (Stdcall, EnumResourceNamesW, "EnumResourceNamesW");
   pragma Import (Stdcall, EnumResourceLanguagesA, "EnumResourceLanguagesA");
   pragma Import (Stdcall, EnumResourceLanguagesW, "EnumResourceLanguagesW");
   pragma Import (Stdcall, BeginUpdateResourceA, "BeginUpdateResourceA");
   pragma Import (Stdcall, BeginUpdateResourceW, "BeginUpdateResourceW");
   pragma Import (Stdcall, UpdateResourceA, "UpdateResourceA");
   pragma Import (Stdcall, UpdateResourceW, "UpdateResourceW");
   pragma Import (Stdcall, EndUpdateResourceA, "EndUpdateResourceA");
   pragma Import (Stdcall, EndUpdateResourceW, "EndUpdateResourceW");
   pragma Import (Stdcall, GlobalAddAtomA, "GlobalAddAtomA");
   pragma Import (Stdcall, GlobalAddAtomW, "GlobalAddAtomW");
   pragma Import (Stdcall, GlobalFindAtomA, "GlobalFindAtomA");
   pragma Import (Stdcall, GlobalFindAtomW, "GlobalFindAtomW");
   pragma Import (Stdcall, GlobalGetAtomNameA, "GlobalGetAtomNameA");
   pragma Import (Stdcall, GlobalGetAtomNameW, "GlobalGetAtomNameW");
   pragma Import (Stdcall, AddAtomA, "AddAtomA");
   pragma Import (Stdcall, AddAtomW, "AddAtomW");
   pragma Import (Stdcall, FindAtomA, "FindAtomA");
   pragma Import (Stdcall, FindAtomW, "FindAtomW");
   pragma Import (Stdcall, GetAtomNameA, "GetAtomNameA");
   pragma Import (Stdcall, GetAtomNameW, "GetAtomNameW");
   pragma Import (Stdcall, GetProfileIntA, "GetProfileIntA");
   pragma Import (Stdcall, GetProfileIntW, "GetProfileIntW");
   pragma Import (Stdcall, GetProfileStringA, "GetProfileStringA");
   pragma Import (Stdcall, GetProfileStringW, "GetProfileStringW");
   pragma Import (Stdcall, WriteProfileStringA, "WriteProfileStringA");
   pragma Import (Stdcall, WriteProfileStringW, "WriteProfileStringW");
   pragma Import (Stdcall, GetProfileSectionA, "GetProfileSectionA");
   pragma Import (Stdcall, GetProfileSectionW, "GetProfileSectionW");
   pragma Import (Stdcall, WriteProfileSectionA, "WriteProfileSectionA");
   pragma Import (Stdcall, WriteProfileSectionW, "WriteProfileSectionW");
   pragma Import (Stdcall, GetPrivateProfileIntA, "GetPrivateProfileIntA");
   pragma Import (Stdcall, GetPrivateProfileIntW, "GetPrivateProfileIntW");
   pragma Import
     (Stdcall,
      GetPrivateProfileStringA,
      "GetPrivateProfileStringA");
   pragma Import
     (Stdcall,
      GetPrivateProfileStringW,
      "GetPrivateProfileStringW");
   pragma Import
     (Stdcall,
      WritePrivateProfileStringA,
      "WritePrivateProfileStringA");
   pragma Import
     (Stdcall,
      WritePrivateProfileStringW,
      "WritePrivateProfileStringW");
   pragma Import
     (Stdcall,
      GetPrivateProfileSectionA,
      "GetPrivateProfileSectionA");
   pragma Import
     (Stdcall,
      GetPrivateProfileSectionW,
      "GetPrivateProfileSectionW");
   pragma Import
     (Stdcall,
      WritePrivateProfileSectionA,
      "WritePrivateProfileSectionA");
   pragma Import
     (Stdcall,
      WritePrivateProfileSectionW,
      "WritePrivateProfileSectionW");
   pragma Import (Stdcall, GetDriveTypeA, "GetDriveTypeA");
   pragma Import (Stdcall, GetDriveTypeW, "GetDriveTypeW");
   pragma Import (Stdcall, GetSystemDirectoryA, "GetSystemDirectoryA");
   pragma Import (Stdcall, GetSystemDirectoryW, "GetSystemDirectoryW");
   pragma Import (Stdcall, GetTempPathA, "GetTempPathA");
   pragma Import (Stdcall, GetTempPathW, "GetTempPathW");
   pragma Import (Stdcall, GetTempFileNameA, "GetTempFileNameA");
   pragma Import (Stdcall, GetTempFileNameW, "GetTempFileNameW");
   pragma Import (Stdcall, GetWindowsDirectoryA, "GetWindowsDirectoryA");
   pragma Import (Stdcall, GetWindowsDirectoryW, "GetWindowsDirectoryW");
   pragma Import (Stdcall, SetCurrentDirectoryA, "SetCurrentDirectoryA");
   pragma Import (Stdcall, SetCurrentDirectoryW, "SetCurrentDirectoryW");
   pragma Import (Stdcall, GetCurrentDirectoryA, "GetCurrentDirectoryA");
   pragma Import (Stdcall, GetCurrentDirectoryW, "GetCurrentDirectoryW");
   pragma Import (Stdcall, GetDiskFreeSpaceA, "GetDiskFreeSpaceA");
   pragma Import (Stdcall, GetDiskFreeSpaceW, "GetDiskFreeSpaceW");
   pragma Import (Stdcall, CreateDirectoryA, "CreateDirectoryA");
   pragma Import (Stdcall, CreateDirectoryW, "CreateDirectoryW");
   pragma Import (Stdcall, CreateDirectoryExA, "CreateDirectoryExA");
   pragma Import (Stdcall, CreateDirectoryExW, "CreateDirectoryExW");
   pragma Import (Stdcall, RemoveDirectoryA, "RemoveDirectoryA");
   pragma Import (Stdcall, RemoveDirectoryW, "RemoveDirectoryW");
   pragma Import (Stdcall, GetFullPathNameA, "GetFullPathNameA");
   pragma Import (Stdcall, GetFullPathNameW, "GetFullPathNameW");
   pragma Import (Stdcall, DefineDosDeviceA, "DefineDosDeviceA");
   pragma Import (Stdcall, DefineDosDeviceW, "DefineDosDeviceW");
   pragma Import (Stdcall, QueryDosDeviceA, "QueryDosDeviceA");
   pragma Import (Stdcall, QueryDosDeviceW, "QueryDosDeviceW");
   pragma Import (Stdcall, CreateFileA, "CreateFileA");
   pragma Import (Stdcall, CreateFileW, "CreateFileW");
   pragma Import (Stdcall, SetFileAttributesA, "SetFileAttributesA");
   pragma Import (Stdcall, SetFileAttributesW, "SetFileAttributesW");
   pragma Import (Stdcall, GetFileAttributesA, "GetFileAttributesA");
   pragma Import (Stdcall, GetFileAttributesW, "GetFileAttributesW");

   pragma Import (Stdcall, GetFileAttributesExA, "GetFileAttributesExA");
   pragma Import (Stdcall, GetFileAttributesExW, "GetFileAttributesExW");

   pragma Import (Stdcall, GetCompressedFileSizeA, "GetCompressedFileSizeA");
   pragma Import (Stdcall, GetCompressedFileSizeW, "GetCompressedFileSizeW");
   pragma Import (Stdcall, DeleteFileA, "DeleteFileA");
   pragma Import (Stdcall, DeleteFileW, "DeleteFileW");
   pragma Import (Stdcall, FindFirstFileA, "FindFirstFileA");
   pragma Import (Stdcall, FindFirstFileW, "FindFirstFileW");
   pragma Import (Stdcall, FindNextFileA, "FindNextFileA");
   pragma Import (Stdcall, FindNextFileW, "FindNextFileW");
   pragma Import (Stdcall, SearchPathA, "SearchPathA");
   pragma Import (Stdcall, SearchPathW, "SearchPathW");
   pragma Import (Stdcall, CopyFileA, "CopyFileA");
   pragma Import (Stdcall, CopyFileW, "CopyFileW");
   pragma Import (Stdcall, MoveFileA, "MoveFileA");
   pragma Import (Stdcall, MoveFileW, "MoveFileW");
   pragma Import (Stdcall, MoveFileExA, "MoveFileExA");
   pragma Import (Stdcall, MoveFileExW, "MoveFileExW");
   pragma Import (Stdcall, CreateNamedPipeA, "CreateNamedPipeA");
   pragma Import (Stdcall, CreateNamedPipeW, "CreateNamedPipeW");
   pragma Import
     (Stdcall,
      GetNamedPipeHandleStateA,
      "GetNamedPipeHandleStateA");
   pragma Import
     (Stdcall,
      GetNamedPipeHandleStateW,
      "GetNamedPipeHandleStateW");
   pragma Import (Stdcall, CallNamedPipeA, "CallNamedPipeA");
   pragma Import (Stdcall, CallNamedPipeW, "CallNamedPipeW");
   pragma Import (Stdcall, WaitNamedPipeA, "WaitNamedPipeA");
   pragma Import (Stdcall, WaitNamedPipeW, "WaitNamedPipeW");
   pragma Import (Stdcall, SetVolumeLabelA, "SetVolumeLabelA");
   pragma Import (Stdcall, SetVolumeLabelW, "SetVolumeLabelW");
   pragma Import (Stdcall, SetFileApisToOEM, "SetFileApisToOEM");
   pragma Import (Stdcall, SetFileApisToANSI, "SetFileApisToANSI");
   pragma Import (Stdcall, AreFileApisANSI, "AreFileApisANSI");
   pragma Import (Stdcall, GetVolumeInformationA, "GetVolumeInformationA");
   pragma Import (Stdcall, GetVolumeInformationW, "GetVolumeInformationW");
   pragma Import (Stdcall, ClearEventLogA, "ClearEventLogA");
   pragma Import (Stdcall, ClearEventLogW, "ClearEventLogW");
   pragma Import (Stdcall, BackupEventLogA, "BackupEventLogA");
   pragma Import (Stdcall, BackupEventLogW, "BackupEventLogW");
   pragma Import (Stdcall, CloseEventLog, "CloseEventLog");
   pragma Import (Stdcall, DeregisterEventSource, "DeregisterEventSource");
   pragma Import (Stdcall, NotifyChangeEventLog, "NotifyChangeEventLog");
   pragma Import
     (Stdcall,
      GetNumberOfEventLogRecords,
      "GetNumberOfEventLogRecords");
   pragma Import
     (Stdcall,
      GetOldestEventLogRecord,
      "GetOldestEventLogRecord");
   pragma Import (Stdcall, OpenEventLogA, "OpenEventLogA");
   pragma Import (Stdcall, OpenEventLogW, "OpenEventLogW");
   pragma Import (Stdcall, RegisterEventSourceA, "RegisterEventSourceA");
   pragma Import (Stdcall, RegisterEventSourceW, "RegisterEventSourceW");
   pragma Import (Stdcall, OpenBackupEventLogA, "OpenBackupEventLogA");
   pragma Import (Stdcall, OpenBackupEventLogW, "OpenBackupEventLogW");
   pragma Import (Stdcall, ReadEventLogA, "ReadEventLogA");
   pragma Import (Stdcall, ReadEventLogW, "ReadEventLogW");
   pragma Import (Stdcall, ReportEventA, "ReportEventA");
   pragma Import (Stdcall, ReportEventW, "ReportEventW");
   pragma Import (Stdcall, DuplicateToken, "DuplicateToken");
   pragma Import
     (Stdcall,
      GetKernelObjectSecurity,
      "GetKernelObjectSecurity");
   pragma Import
     (Stdcall,
      ImpersonateNamedPipeClient,
      "ImpersonateNamedPipeClient");
   pragma Import (Stdcall, ImpersonateSelf, "ImpersonateSelf");
   pragma Import (Stdcall, RevertToSelf, "RevertToSelf");
   pragma Import (Stdcall, SetThreadToken, "SetThreadToken");
   pragma Import (Stdcall, AccessCheck, "AccessCheck");
   pragma Import (Stdcall, OpenProcessToken, "OpenProcessToken");
   pragma Import (Stdcall, OpenThreadToken, "OpenThreadToken");
   pragma Import (Stdcall, GetTokenInformation, "GetTokenInformation");
   pragma Import (Stdcall, SetTokenInformation, "SetTokenInformation");
   pragma Import (Stdcall, AdjustTokenPrivileges, "AdjustTokenPrivileges");
   pragma Import (Stdcall, AdjustTokenGroups, "AdjustTokenGroups");
   pragma Import (Stdcall, PrivilegeCheck, "PrivilegeCheck");
   pragma Import
     (Stdcall,
      AccessCheckAndAuditAlarmA,
      "AccessCheckAndAuditAlarmA");
   pragma Import
     (Stdcall,
      AccessCheckAndAuditAlarmW,
      "AccessCheckAndAuditAlarmW");
   pragma Import (Stdcall, ObjectOpenAuditAlarmA, "ObjectOpenAuditAlarmA");
   pragma Import (Stdcall, ObjectOpenAuditAlarmW, "ObjectOpenAuditAlarmW");
   pragma Import
     (Stdcall,
      ObjectPrivilegeAuditAlarmA,
      "ObjectPrivilegeAuditAlarmA");
   pragma Import
     (Stdcall,
      ObjectPrivilegeAuditAlarmW,
      "ObjectPrivilegeAuditAlarmW");
   pragma Import (Stdcall, ObjectCloseAuditAlarmA, "ObjectCloseAuditAlarmA");
   pragma Import (Stdcall, ObjectCloseAuditAlarmW, "ObjectCloseAuditAlarmW");
   pragma Import
     (Stdcall,
      PrivilegedServiceAuditAlarmA,
      "PrivilegedServiceAuditAlarmA");
   pragma Import
     (Stdcall,
      PrivilegedServiceAuditAlarmW,
      "PrivilegedServiceAuditAlarmW");

   pragma Import (Stdcall, IsValidSid, "IsValidSid");
   pragma Import (Stdcall, IsWellKnownSid, "IsWellKnownSid");
   pragma Import (Stdcall, EqualSid, "EqualSid");
   pragma Import (Stdcall, EqualPrefixSid, "EqualPrefixSid");

   pragma Import (Stdcall, GetSidLengthRequired, "GetSidLengthRequired");
   pragma Import
     (Stdcall,
      AllocateAndInitializeSid,
      "AllocateAndInitializeSid");
   pragma Import (Stdcall, FreeSid, "FreeSid");
   pragma Import (Stdcall, InitializeSid, "InitializeSid");
   pragma Import
     (Stdcall,
      GetSidIdentifierAuthority,
      "GetSidIdentifierAuthority");
   pragma Import (Stdcall, GetSidSubAuthority, "GetSidSubAuthority");
   pragma Import
     (Stdcall,
      GetSidSubAuthorityCount,
      "GetSidSubAuthorityCount");
   pragma Import (Stdcall, GetLengthSid, "GetLengthSid");
   pragma Import (Stdcall, CopySid, "CopySid");
   pragma Import (Stdcall, AreAllAccessesGranted, "AreAllAccessesGranted");
   pragma Import (Stdcall, AreAnyAccessesGranted, "AreAnyAccessesGranted");
   pragma Import (Stdcall, MapGenericMask, "MapGenericMask");
   pragma Import (Stdcall, IsValidAcl, "IsValidAcl");
   pragma Import (Stdcall, InitializeAcl, "InitializeAcl");
   pragma Import (Stdcall, GetAclInformation, "GetAclInformation");
   pragma Import (Stdcall, SetAclInformation, "SetAclInformation");
   pragma Import (Stdcall, AddAce, "AddAce");
   pragma Import (Stdcall, DeleteAce, "DeleteAce");
   pragma Import (Stdcall, GetAce, "GetAce");
   pragma Import (Stdcall, AddAccessAllowedAce, "AddAccessAllowedAce");
   pragma Import (Stdcall, AddAccessDeniedAce, "AddAccessDeniedAce");
   pragma Import (Stdcall, AddAuditAccessAce, "AddAuditAccessAce");
   pragma Import (Stdcall, FindFirstFreeAce, "FindFirstFreeAce");
   pragma Import
     (Stdcall,
      InitializeSecurityDescriptor,
      "InitializeSecurityDescriptor");

   pragma Import
     (Stdcall,
      IsValidSecurityDescriptor,
      "IsValidSecurityDescriptor");
   pragma Import
     (Stdcall,
      GetSecurityDescriptorLength,
      "GetSecurityDescriptorLength");

   pragma Import
     (Stdcall,
      GetSecurityDescriptorControl,
      "GetSecurityDescriptorControl");

   pragma Import
     (Stdcall,
      SetSecurityDescriptorDacl,
      "SetSecurityDescriptorDacl");
   pragma Import
     (Stdcall,
      GetSecurityDescriptorDacl,
      "GetSecurityDescriptorDacl");
   pragma Import
     (Stdcall,
      SetSecurityDescriptorSacl,
      "SetSecurityDescriptorSacl");
   pragma Import
     (Stdcall,
      GetSecurityDescriptorSacl,
      "GetSecurityDescriptorSacl");
   pragma Import
     (Stdcall,
      SetSecurityDescriptorOwner,
      "SetSecurityDescriptorOwner");
   pragma Import
     (Stdcall,
      GetSecurityDescriptorOwner,
      "GetSecurityDescriptorOwner");
   pragma Import
     (Stdcall,
      SetSecurityDescriptorGroup,
      "SetSecurityDescriptorGroup");
   pragma Import
     (Stdcall,
      GetSecurityDescriptorGroup,
      "GetSecurityDescriptorGroup");
   pragma Import
     (Stdcall,
      CreatePrivateObjectSecurity,
      "CreatePrivateObjectSecurity");
   pragma Import
     (Stdcall,
      SetPrivateObjectSecurity,
      "SetPrivateObjectSecurity");
   pragma Import
     (Stdcall,
      GetPrivateObjectSecurity,
      "GetPrivateObjectSecurity");
   pragma Import
     (Stdcall,
      DestroyPrivateObjectSecurity,
      "DestroyPrivateObjectSecurity");
   pragma Import (Stdcall, MakeSelfRelativeSD, "MakeSelfRelativeSD");
   pragma Import (Stdcall, MakeAbsoluteSD, "MakeAbsoluteSD");
   pragma Import (Stdcall, SetFileSecurityA, "SetFileSecurityA");
   pragma Import (Stdcall, SetFileSecurityW, "SetFileSecurityW");
   pragma Import (Stdcall, GetFileSecurityA, "GetFileSecurityA");
   pragma Import (Stdcall, GetFileSecurityW, "GetFileSecurityW");
   pragma Import
     (Stdcall,
      SetKernelObjectSecurity,
      "SetKernelObjectSecurity");
   pragma Import
     (Stdcall,
      FindFirstChangeNotificationA,
      "FindFirstChangeNotificationA");
   pragma Import
     (Stdcall,
      FindFirstChangeNotificationW,
      "FindFirstChangeNotificationW");
   pragma Import
     (Stdcall,
      FindNextChangeNotification,
      "FindNextChangeNotification");
   pragma Import
     (Stdcall,
      FindCloseChangeNotification,
      "FindCloseChangeNotification");
   pragma Import (Stdcall, VirtualLock, "VirtualLock");
   pragma Import (Stdcall, VirtualUnlock, "VirtualUnlock");
   pragma Import (Stdcall, MapViewOfFileEx, "MapViewOfFileEx");
   pragma Import (Stdcall, SetPriorityClass, "SetPriorityClass");
   pragma Import (Stdcall, GetPriorityClass, "GetPriorityClass");
   pragma Import (Stdcall, IsBadReadPtr, "IsBadReadPtr");
   pragma Import (Stdcall, IsBadWritePtr, "IsBadWritePtr");
   pragma Import (Stdcall, IsBadHugeReadPtr, "IsBadHugeReadPtr");
   pragma Import (Stdcall, IsBadHugeWritePtr, "IsBadHugeWritePtr");
   pragma Import (Stdcall, IsBadCodePtr, "IsBadCodePtr");
   pragma Import (Stdcall, IsBadStringPtrA, "IsBadStringPtrA");
   pragma Import (Stdcall, IsBadStringPtrW, "IsBadStringPtrW");
   pragma Import (Stdcall, LookupAccountSidA, "LookupAccountSidA");
   pragma Import (Stdcall, LookupAccountSidW, "LookupAccountSidW");
   pragma Import (Stdcall, LookupAccountNameA, "LookupAccountNameA");
   pragma Import (Stdcall, LookupAccountNameW, "LookupAccountNameW");
   pragma Import (Stdcall, LookupPrivilegeValueA, "LookupPrivilegeValueA");
   pragma Import (Stdcall, LookupPrivilegeValueW, "LookupPrivilegeValueW");
   pragma Import (Stdcall, LookupPrivilegeNameA, "LookupPrivilegeNameA");
   pragma Import (Stdcall, LookupPrivilegeNameW, "LookupPrivilegeNameW");
   pragma Import
     (Stdcall,
      LookupPrivilegeDisplayNameA,
      "LookupPrivilegeDisplayNameA");
   pragma Import
     (Stdcall,
      LookupPrivilegeDisplayNameW,
      "LookupPrivilegeDisplayNameW");
   pragma Import
     (Stdcall,
      AllocateLocallyUniqueId,
      "AllocateLocallyUniqueId");
   pragma Import (Stdcall, BuildCommDCBA, "BuildCommDCBA");
   pragma Import (Stdcall, BuildCommDCBW, "BuildCommDCBW");
   pragma Import
     (Stdcall,
      BuildCommDCBAndTimeoutsA,
      "BuildCommDCBAndTimeoutsA");
   pragma Import
     (Stdcall,
      BuildCommDCBAndTimeoutsW,
      "BuildCommDCBAndTimeoutsW");
   pragma Import (Stdcall, CommConfigDialogA, "CommConfigDialogA");
   pragma Import (Stdcall, CommConfigDialogW, "CommConfigDialogW");
   pragma Import (Stdcall, GetDefaultCommConfigA, "GetDefaultCommConfigA");
   pragma Import (Stdcall, GetDefaultCommConfigW, "GetDefaultCommConfigW");
   pragma Import (Stdcall, SetDefaultCommConfigA, "SetDefaultCommConfigA");
   pragma Import (Stdcall, SetDefaultCommConfigW, "SetDefaultCommConfigW");
   pragma Import (Stdcall, GetComputerNameA, "GetComputerNameA");
   pragma Import (Stdcall, GetComputerNameW, "GetComputerNameW");
   pragma Import (Stdcall, SetComputerNameA, "SetComputerNameA");
   pragma Import (Stdcall, SetComputerNameW, "SetComputerNameW");
   pragma Import (Stdcall, GetUserNameA, "GetUserNameA");
   pragma Import (Stdcall, GetUserNameW, "GetUserNameW");
   pragma Import
     (Stdcall,
      QueryPerformanceCounter,
      "QueryPerformanceCounter");
   pragma Import
     (Stdcall,
      QueryPerformanceFrequency,
      "QueryPerformanceFrequency");
   pragma Import (Stdcall, GetVersionExA, "GetVersionExA");
   pragma Import (Stdcall, GetVersionExW, "GetVersionExW");

end Win32.Winbase;
