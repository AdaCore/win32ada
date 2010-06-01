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

package Win32.Dlcapi is

   LLC_DIR_INTERRUPT                 : constant := 16#0#;
   LLC_DIR_OPEN_ADAPTER              : constant := 16#3#;
   LLC_DIR_CLOSE_ADAPTER             : constant := 16#4#;
   LLC_DIR_SET_MULTICAST_ADDRESS     : constant := 16#5#;
   LLC_DIR_SET_GROUP_ADDRESS         : constant := 16#6#;
   LLC_DIR_SET_FUNCTIONAL_ADDRESS    : constant := 16#7#;
   LLC_DIR_READ_LOG                  : constant := 16#8#;
   LLC_TRANSMIT_FRAMES               : constant := 16#9#;
   LLC_TRANSMIT_DIR_FRAME            : constant := 16#a#;
   LLC_TRANSMIT_I_FRAME              : constant := 16#b#;
   LLC_TRANSMIT_UI_FRAME             : constant := 16#d#;
   LLC_TRANSMIT_XID_CMD              : constant := 16#e#;
   LLC_TRANSMIT_XID_RESP_FINAL       : constant := 16#f#;
   LLC_TRANSMIT_XID_RESP_NOT_FINAL   : constant := 16#10#;
   LLC_TRANSMIT_TEST_CMD             : constant := 16#11#;
   LLC_DLC_RESET                     : constant := 16#14#;
   LLC_DLC_OPEN_SAP                  : constant := 16#15#;
   LLC_DLC_CLOSE_SAP                 : constant := 16#16#;
   LLC_DLC_REALLOCATE_STATIONS       : constant := 16#17#;
   LLC_DLC_OPEN_STATION              : constant := 16#19#;
   LLC_DLC_CLOSE_STATION             : constant := 16#1a#;
   LLC_DLC_CONNECT_STATION           : constant := 16#1b#;
   LLC_DLC_MODIFY                    : constant := 16#1c#;
   LLC_DLC_FLOW_CONTROL              : constant := 16#1d#;
   LLC_DLC_STATISTICS                : constant := 16#1e#;
   LLC_DIR_INITIALIZE                : constant := 16#20#;
   LLC_DIR_STATUS                    : constant := 16#21#;
   LLC_DIR_TIMER_SET                 : constant := 16#22#;
   LLC_DIR_TIMER_CANCEL              : constant := 16#23#;
   LLC_BUFFER_GET                    : constant := 16#26#;
   LLC_BUFFER_FREE                   : constant := 16#27#;
   LLC_RECEIVE                       : constant := 16#28#;
   LLC_RECEIVE_CANCEL                : constant := 16#29#;
   LLC_RECEIVE_MODIFY                : constant := 16#2a#;
   LLC_DIR_TIMER_CANCEL_GROUP        : constant := 16#2c#;
   LLC_DIR_SET_EXCEPTION_FLAGS       : constant := 16#2d#;
   LLC_BUFFER_CREATE                 : constant := 16#30#;
   LLC_READ                          : constant := 16#31#;
   LLC_READ_CANCEL                   : constant := 16#32#;
   LLC_DLC_SET_THRESHOLD             : constant := 16#33#;
   LLC_DIR_CLOSE_DIRECT              : constant := 16#34#;
   LLC_DIR_OPEN_DIRECT               : constant := 16#35#;
   LLC_MAX_DLC_COMMAND               : constant := 16#37#;
   LLC_RESET_LOCAL_BUSY_USER         : constant := 16#80#;
   LLC_RESET_LOCAL_BUSY_BUFFER       : constant := 16#c0#;
   LLC_SET_LOCAL_BUSY_USER           : constant := 0;
   LLC_XID_HANDLING_IN_APPLICATION   : constant := 16#8#;
   LLC_XID_HANDLING_IN_DLC           : constant := 0;
   LLC_INDIVIDUAL_SAP                : constant := 16#4#;
   LLC_GROUP_SAP                     : constant := 16#2#;
   LLC_MEMBER_OF_GROUP_SAP           : constant := 16#1#;
   LLC_INCREASE_LINK_STATIONS        : constant := 0;
   LLC_DECREASE_LINK_STATIONS        : constant := 16#80#;
   LLC_DLC_RESET_STATISTICS          : constant := 16#80#;
   LLC_DLC_READ_STATISTICS           : constant := 0;
   LLC_DIRECT_OPTIONS_ALL_MACS       : constant := 16#1880#;
   LLC_DIR_READ_LOG_ADAPTER          : constant := 0;
   LLC_DIR_READ_LOG_DIRECT           : constant := 1;
   LLC_DIR_READ_LOG_BOTH             : constant := 2;
   LLC_ADAPTER_ETHERNET              : constant := 16#10#;
   LLC_ADAPTER_TOKEN_RING            : constant := 16#40#;
   LLC_OPTION_READ_STATION           : constant := 0;
   LLC_OPTION_READ_SAP               : constant := 1;
   LLC_OPTION_READ_ALL               : constant := 2;
   LLC_EVENT_SYSTEM_ACTION           : constant := 16#40#;
   LLC_EVENT_NETWORK_STATUS          : constant := 16#20#;
   LLC_EVENT_CRITICAL_EXCEPTION      : constant := 16#10#;
   LLC_EVENT_STATUS_CHANGE           : constant := 16#8#;
   LLC_EVENT_RECEIVE_DATA            : constant := 16#4#;
   LLC_EVENT_TRANSMIT_COMPLETION     : constant := 16#2#;
   LLC_EVENT_COMMAND_COMPLETION      : constant := 16#1#;
   LLC_READ_ALL_EVENTS               : constant := 16#7f#;
   LLC_INDICATE_LINK_LOST            : constant := 16#8000#;
   LLC_INDICATE_DM_DISC_RECEIVED     : constant := 16#4000#;
   LLC_INDICATE_FRMR_RECEIVED        : constant := 16#2000#;
   LLC_INDICATE_FRMR_SENT            : constant := 16#1000#;
   LLC_INDICATE_RESET                : constant := 16#800#;
   LLC_INDICATE_CONNECT_REQUEST      : constant := 16#400#;
   LLC_INDICATE_REMOTE_BUSY          : constant := 16#200#;
   LLC_INDICATE_REMOTE_READY         : constant := 16#100#;
   LLC_INDICATE_TI_TIMER_EXPIRED     : constant := 16#80#;
   LLC_INDICATE_DLC_COUNTER_OVERFLOW : constant := 16#40#;
   LLC_INDICATE_ACCESS_PRTY_LOWERED  : constant := 16#20#;
   LLC_INDICATE_LOCAL_STATION_BUSY   : constant := 16#1#;
   LLC_DIR_RCV_ALL_TR_FRAMES         : constant := 0;
   LLC_DIR_RCV_ALL_MAC_FRAMES        : constant := 1;
   LLC_DIR_RCV_ALL_8022_FRAMES       : constant := 2;
   LLC_DIR_RCV_ALL_FRAMES            : constant := 4;
   LLC_DIR_RCV_ALL_ETHERNET_TYPES    : constant := 5;
   LLC_CONTIGUOUS_MAC                : constant := 16#80#;
   LLC_CONTIGUOUS_DATA               : constant := 16#40#;
   LLC_NOT_CONTIGUOUS_DATA           : constant := 16#0#;
   LLC_RCV_READ_INDIVIDUAL_FRAMES    : constant := 0;
   LLC_RCV_CHAIN_FRAMES_ON_LINK      : constant := 1;
   LLC_RCV_CHAIN_FRAMES_ON_SAP       : constant := 2;
   LLC_CHAIN_XMIT_COMMANDS_ON_LINK   : constant := 0;
   LLC_COMPLETE_SINGLE_XMIT_FRAME    : constant := 1;
   LLC_CHAIN_XMIT_COMMANDS_ON_SAP    : constant := 2;
   LLC_FIRST_DATA_SEGMENT            : constant := 16#1#;
   LLC_NEXT_DATA_SEGMENT             : constant := 16#2#;
   LLC_STATUS_MAX_ERROR              : constant := 16#ff#;

   type LLC_ETHERNET_TYPE is (
      LLC_ETHERNET_TYPE_DEFAULT,
      LLC_ETHERNET_TYPE_AUTO,
      LLC_ETHERNET_TYPE_802_3,
      LLC_ETHERNET_TYPE_DIX);
   for LLC_ETHERNET_TYPE'Size use 32;

   type enum_LLC_FRAME_TYPES is (
      LLC_DIRECT_TRANSMIT,
      LLC_DIRECT_MAC,
      LLC_I_FRAME,
      LLC_UI_FRAME,
      LLC_XID_COMMAND_POLL,
      LLC_XID_COMMAND_NOT_POLL,
      LLC_XID_RESPONSE_FINAL,
      LLC_XID_RESPONSE_NOT_FINAL,
      LLC_TEST_RESPONSE_FINAL,
      LLC_TEST_RESPONSE_NOT_FINAL,
      LLC_DIRECT_8022,
      LLC_TEST_COMMAND_POLL,
      LLC_DIRECT_ETHERNET_TYPE,
      LLC_LAST_FRAME_TYPE,
      LLC_FIRST_ETHERNET_TYPE);
   for enum_LLC_FRAME_TYPES use
     (LLC_DIRECT_TRANSMIT         => 0,
      LLC_DIRECT_MAC              => 2,
      LLC_I_FRAME                 => 4,
      LLC_UI_FRAME                => 6,
      LLC_XID_COMMAND_POLL        => 8,
      LLC_XID_COMMAND_NOT_POLL    => 10,
      LLC_XID_RESPONSE_FINAL      => 12,
      LLC_XID_RESPONSE_NOT_FINAL  => 14,
      LLC_TEST_RESPONSE_FINAL     => 16,
      LLC_TEST_RESPONSE_NOT_FINAL => 18,
      LLC_DIRECT_8022             => 20,
      LLC_TEST_COMMAND_POLL       => 22,
      LLC_DIRECT_ETHERNET_TYPE    => 24,
      LLC_LAST_FRAME_TYPE         => 26,
      LLC_FIRST_ETHERNET_TYPE     => 1501);
   for enum_LLC_FRAME_TYPES'Size use 32;

   type LLC_STATUS is (
      LLC_STATUS_SUCCESS,
      LLC_STATUS_INVALID_COMMAND,
      LLC_STATUS_DUPLICATE_COMMAND,
      LLC_STATUS_ADAPTER_OPEN,
      LLC_STATUS_ADAPTER_CLOSED,
      LLC_STATUS_PARAMETER_MISSING,
      LLC_STATUS_INVALID_OPTION,
      LLC_STATUS_COMMAND_CANCELLED_FAILURE,
      LLC_STATUS_ACCESS_DENIED,
      LLC_STATUS_ADAPTER_NOT_INITIALIZED,
      LLC_STATUS_CANCELLED_BY_USER,
      LLC_STATUS_COMMAND_CANCELLED_CLOSED,
      LLC_STATUS_SUCCESS_NOT_OPEN,
      LLC_STATUS_TIMER_ERROR,
      LLC_STATUS_NO_MEMORY,
      LLC_STATUS_INVALID_LOG_ID,
      LLC_STATUS_LOST_LOG_DATA,
      LLC_STATUS_BUFFER_SIZE_EXCEEDED,
      LLC_STATUS_INVALID_BUFFER_LENGTH,
      LLC_STATUS_INADEQUATE_BUFFERS,
      LLC_STATUS_USER_LENGTH_TOO_LARGE,
      LLC_STATUS_INVALID_PARAMETER_TABLE,
      LLC_STATUS_INVALID_POINTER_IN_CCB,
      LLC_STATUS_INVALID_ADAPTER,
      LLC_STATUS_LOST_DATA_NO_BUFFERS,
      LLC_STATUS_LOST_DATA_INADEQUATE_SPACE,
      LLC_STATUS_TRANSMIT_ERROR_FS,
      LLC_STATUS_TRANSMIT_ERROR,
      LLC_STATUS_UNAUTHORIZED_MAC,
      LLC_STATUS_MAX_COMMANDS_EXCEEDED,
      LLC_STATUS_LINK_NOT_TRANSMITTING,
      LLC_STATUS_INVALID_FRAME_LENGTH,
      LLC_STATUS_INADEQUATE_RECEIVE,
      LLC_STATUS_INVALID_NODE_ADDRESS,
      LLC_STATUS_INVALID_RCV_BUFFER_LENGTH,
      LLC_STATUS_INVALID_XMIT_BUFFER_LENGTH,
      LLC_STATUS_INVALID_STATION_ID,
      LLC_STATUS_LINK_PROTOCOL_ERROR,
      LLC_STATUS_PARMETERS_EXCEEDED_MAX,
      LLC_STATUS_INVALID_SAP_VALUE,
      LLC_STATUS_INVALID_ROUTING_INFO,
      LLC_STATUS_RESOURCES_NOT_AVAILABLE,
      LLC_STATUS_LINK_STATIONS_OPEN,
      LLC_STATUS_INCOMPATIBLE_COMMANDS,
      LLC_STATUS_OUTSTANDING_COMMANDS,
      LLC_STATUS_CONNECT_FAILED,
      LLC_STATUS_INVALID_REMOTE_ADDRESS,
      LLC_STATUS_CCB_POINTER_FIELD,
      LLC_STATUS_INVALID_APPLICATION_ID,
      LLC_STATUS_NO_SYSTEM_PROCESS,
      LLC_STATUS_INADEQUATE_LINKS,
      LLC_STATUS_INVALID_PARAMETER_1,
      LLC_STATUS_DIRECT_STATIONS_NOT_ASSIGNED,
      LLC_STATUS_DEVICE_DRIVER_NOT_INSTALLED,
      LLC_STATUS_ADAPTER_NOT_INSTALLED,
      LLC_STATUS_CHAINED_DIFFERENT_ADAPTERS,
      LLC_STATUS_INIT_COMMAND_STARTED,
      LLC_STATUS_TOO_MANY_USERS,
      LLC_STATUS_CANCELLED_BY_SYSTEM_ACTION,
      LLC_STATUS_DIR_STATIONS_NOT_AVAILABLE,
      LLC_STATUS_NO_GDT_SELECTORS,
      LLC_STATUS_MEMORY_LOCK_FAILED,
      LLC_STATUS_INVALID_BUFFER_ADDRESS,
      LLC_STATUS_BUFFER_ALREADY_RELEASED,
      LLC_STATUS_BIND_ERROR,
      LLC_STATUS_INVALID_VERSION,
      LLC_STATUS_NT_ERROR_STATUS,
      LLC_STATUS_PENDING);
   for LLC_STATUS use
     (LLC_STATUS_SUCCESS                      => 0,
      LLC_STATUS_INVALID_COMMAND              => 1,
      LLC_STATUS_DUPLICATE_COMMAND            => 2,
      LLC_STATUS_ADAPTER_OPEN                 => 3,
      LLC_STATUS_ADAPTER_CLOSED               => 4,
      LLC_STATUS_PARAMETER_MISSING            => 5,
      LLC_STATUS_INVALID_OPTION               => 6,
      LLC_STATUS_COMMAND_CANCELLED_FAILURE    => 7,
      LLC_STATUS_ACCESS_DENIED                => 8,
      LLC_STATUS_ADAPTER_NOT_INITIALIZED      => 9,
      LLC_STATUS_CANCELLED_BY_USER            => 10,
      LLC_STATUS_COMMAND_CANCELLED_CLOSED     => 11,
      LLC_STATUS_SUCCESS_NOT_OPEN             => 12,
      LLC_STATUS_TIMER_ERROR                  => 17,
      LLC_STATUS_NO_MEMORY                    => 18,
      LLC_STATUS_INVALID_LOG_ID               => 19,
      LLC_STATUS_LOST_LOG_DATA                => 21,
      LLC_STATUS_BUFFER_SIZE_EXCEEDED         => 22,
      LLC_STATUS_INVALID_BUFFER_LENGTH        => 24,
      LLC_STATUS_INADEQUATE_BUFFERS           => 25,
      LLC_STATUS_USER_LENGTH_TOO_LARGE        => 26,
      LLC_STATUS_INVALID_PARAMETER_TABLE      => 27,
      LLC_STATUS_INVALID_POINTER_IN_CCB       => 28,
      LLC_STATUS_INVALID_ADAPTER              => 29,
      LLC_STATUS_LOST_DATA_NO_BUFFERS         => 32,
      LLC_STATUS_LOST_DATA_INADEQUATE_SPACE   => 33,
      LLC_STATUS_TRANSMIT_ERROR_FS            => 34,
      LLC_STATUS_TRANSMIT_ERROR               => 35,
      LLC_STATUS_UNAUTHORIZED_MAC             => 36,
      LLC_STATUS_MAX_COMMANDS_EXCEEDED        => 37,
      LLC_STATUS_LINK_NOT_TRANSMITTING        => 39,
      LLC_STATUS_INVALID_FRAME_LENGTH         => 40,
      LLC_STATUS_INADEQUATE_RECEIVE           => 48,
      LLC_STATUS_INVALID_NODE_ADDRESS         => 50,
      LLC_STATUS_INVALID_RCV_BUFFER_LENGTH    => 51,
      LLC_STATUS_INVALID_XMIT_BUFFER_LENGTH   => 52,
      LLC_STATUS_INVALID_STATION_ID           => 64,
      LLC_STATUS_LINK_PROTOCOL_ERROR          => 65,
      LLC_STATUS_PARMETERS_EXCEEDED_MAX       => 66,
      LLC_STATUS_INVALID_SAP_VALUE            => 67,
      LLC_STATUS_INVALID_ROUTING_INFO         => 68,
      LLC_STATUS_RESOURCES_NOT_AVAILABLE      => 70,
      LLC_STATUS_LINK_STATIONS_OPEN           => 71,
      LLC_STATUS_INCOMPATIBLE_COMMANDS        => 74,
      LLC_STATUS_OUTSTANDING_COMMANDS         => 76,
      LLC_STATUS_CONNECT_FAILED               => 77,
      LLC_STATUS_INVALID_REMOTE_ADDRESS       => 79,
      LLC_STATUS_CCB_POINTER_FIELD            => 80,
      LLC_STATUS_INVALID_APPLICATION_ID       => 82,
      LLC_STATUS_NO_SYSTEM_PROCESS            => 86,
      LLC_STATUS_INADEQUATE_LINKS             => 87,
      LLC_STATUS_INVALID_PARAMETER_1          => 88,
      LLC_STATUS_DIRECT_STATIONS_NOT_ASSIGNED => 92,
      LLC_STATUS_DEVICE_DRIVER_NOT_INSTALLED  => 93,
      LLC_STATUS_ADAPTER_NOT_INSTALLED        => 94,
      LLC_STATUS_CHAINED_DIFFERENT_ADAPTERS   => 95,
      LLC_STATUS_INIT_COMMAND_STARTED         => 96,
      LLC_STATUS_TOO_MANY_USERS               => 97,
      LLC_STATUS_CANCELLED_BY_SYSTEM_ACTION   => 98,
      LLC_STATUS_DIR_STATIONS_NOT_AVAILABLE   => 99,
      LLC_STATUS_NO_GDT_SELECTORS             => 101,
      LLC_STATUS_MEMORY_LOCK_FAILED           => 105,
      LLC_STATUS_INVALID_BUFFER_ADDRESS       => 128,
      LLC_STATUS_BUFFER_ALREADY_RELEASED      => 129,
      LLC_STATUS_BIND_ERROR                   => 160,
      LLC_STATUS_INVALID_VERSION              => 161,
      LLC_STATUS_NT_ERROR_STATUS              => 162,
      LLC_STATUS_PENDING                      => 255);
   for LLC_STATUS'Size use 32;

   type ACSLAN_STATUS is (
      ACSLAN_STATUS_COMMAND_ACCEPTED,
      ACSLAN_STATUS_INVALID_CCB_POINTER,
      ACSLAN_STATUS_CCB_IN_ERROR,
      ACSLAN_STATUS_CHAINED_CCB_IN_ERROR,
      ACSLAN_STATUS_SYSTEM_ERROR,
      ACSLAN_STATUS_SYSTEM_STATUS,
      ACSLAN_STATUS_INVALID_COMMAND);
   for ACSLAN_STATUS'Size use 32;

   type struct_anonymous0_t;
   type struct_anonymous1_t;
   type CCB_PARMS;
   type LLC_CCB;
   type LLC_NEXT_BUFFER;
   type LLC_NOT_CONTIGUOUS_BUFFER;
   type LLC_CONTIGUOUS_BUFFER;
   type LlcNextBuffer;
   type struct_anonymous6_t;
   type struct_anonymous7_t;
   type LLC_XMIT_BUFFER;
   type LLC_BUFFER_CREATE_PARMS;
   type LLC_BUFFER_FREE_PARMS;
   type LLC_BUFFER_GET_PARMS;
   type LLC_DLC_CONNECT_PARMS;
   type LLC_DLC_MODIFY_PARMS;
   type LLC_DLC_OPEN_SAP_PARMS;
   type LLC_DLC_OPEN_STATION_PARMS;
   type LLC_DLC_REALLOCATE_PARMS;
   type LLC_DLC_SET_THRESHOLD_PARMS;
   type LLC_TRACE_INITIALIZE_PARMS;
   type DLC_SAP_LOG;
   type DLC_LINK_LOG;
   type LLC_DLC_LOG_BUFFER;
   type LLC_DLC_STATISTICS_PARMS;
   type LLC_DIR_INITIALIZE_PARMS;
   type LLC_ADAPTER_OPEN_PARMS;
   type LLC_DLC_PARMS;
   type LLC_EXTENDED_ADAPTER_PARMS;
   type LLC_DIR_OPEN_ADAPTER_PARMS;
   type LLC_DIR_MULTICAST_ADDRESS;
   type LLC_DIR_OPEN_DIRECT_PARMS;
   type LLC_ADAPTER_LOG_TR;
   type LLC_ADAPTER_LOG_ETH;
   type LLC_ADAPTER_LOG;
   type LLC_DIRECT_LOG;
   type struct_anonymous36_t;
   type LLC_DIR_READ_LOG_BUFFER;
   type LLC_DIR_READ_LOG_PARMS;
   type LLC_DIR_SET_EFLAG_PARMS;
   type LLC_DIR_STATUS_PARMS;
   type struct_anonymous41_t;
   type struct_anonymous43_t;
   type union_anonymous44_t;
   type LLC_READ_PARMS;
   type LLC_READ_COMMAND;
   type LLC_RECEIVE_PARMS;
   type LLC_TRANSMIT_PARMS;
   type LLC_TRANSMIT_DESCRIPTOR;
   type LLC_TRANSMIT2_COMMAND;
   type LLC_PARMS;
   type LLC_BUFFER;

   type PLLC_PARMS is access all LLC_PARMS;
   type PLLC_CCB is access all LLC_CCB;
   type PLLC_BUFFER is access all LLC_BUFFER;
   type PLLC_XMIT_BUFFER is access all LLC_XMIT_BUFFER;
   type PLLC_BUFFER_CREATE_PARMS is access all LLC_BUFFER_CREATE_PARMS;
   type PLLC_BUFFER_FREE_PARMS is access all LLC_BUFFER_FREE_PARMS;
   type PLLC_BUFFER_GET_PARMS is access all LLC_BUFFER_GET_PARMS;
   type PLLC_DLC_CONNECT_PARMS is access all LLC_DLC_CONNECT_PARMS;
   type PLLC_DLC_MODIFY_PARMS is access all LLC_DLC_MODIFY_PARMS;
   type PLLC_DLC_OPEN_SAP_PARMS is access all LLC_DLC_OPEN_SAP_PARMS;
   type PLLC_DLC_OPEN_STATION_PARMS is access all LLC_DLC_OPEN_STATION_PARMS;
   type PLLC_DLC_REALLOCATE_PARMS is access all LLC_DLC_REALLOCATE_PARMS;
   type PLLC_DLC_SET_THRESHOLD_PARMS is access all LLC_DLC_SET_THRESHOLD_PARMS;
   type PLLC_TRACE_INITIALIZE_PARMS is access all LLC_TRACE_INITIALIZE_PARMS;
   type PDLC_SAP_LOG is access all DLC_SAP_LOG;
   type PDLC_LINK_LOG is access all DLC_LINK_LOG;
   type PLLC_DLC_LOG_BUFFER is access all LLC_DLC_LOG_BUFFER;
   type PLLC_DLC_STATISTICS_PARMS is access all LLC_DLC_STATISTICS_PARMS;
   type PLLC_DIR_INITIALIZE_PARMS is access all LLC_DIR_INITIALIZE_PARMS;
   type PLLC_ADAPTER_OPEN_PARMS is access all LLC_ADAPTER_OPEN_PARMS;
   type PLLC_DLC_PARMS is access all LLC_DLC_PARMS;
   type PLLC_ETHERNET_TYPE is access all LLC_ETHERNET_TYPE;

   type PLLC_EXTENDED_ADAPTER_PARMS is access all LLC_EXTENDED_ADAPTER_PARMS;
   type PLLC_DIR_OPEN_ADAPTER_PARMS is access all LLC_DIR_OPEN_ADAPTER_PARMS;
   type PLLC_DIR_MULTICAST_ADDRESS is access all LLC_DIR_MULTICAST_ADDRESS;
   type PLLC_DIR_OPEN_DIRECT_PARMS is access all LLC_DIR_OPEN_DIRECT_PARMS;
   type PLLC_ADAPTER_LOG_TR is access all LLC_ADAPTER_LOG_TR;
   type PLLC_ADAPTER_LOG_ETH is access all LLC_ADAPTER_LOG_ETH;
   type PLLC_ADAPTER_LOG is access all LLC_ADAPTER_LOG;
   type PLLC_DIRECT_LOG is access all LLC_DIRECT_LOG;
   type PLLC_DIR_READ_LOG_BUFFER is access all LLC_DIR_READ_LOG_BUFFER;
   type PLLC_DIR_READ_LOG_PARMS is access all LLC_DIR_READ_LOG_PARMS;
   type PLLC_DIR_SET_EFLAG_PARMS is access all LLC_DIR_SET_EFLAG_PARMS;
   type PLLC_DIR_STATUS_PARMS is access all LLC_DIR_STATUS_PARMS;
   type PLLC_READ_PARMS is access all LLC_READ_PARMS;
   type PLLC_READ_COMMAND is access all LLC_READ_COMMAND;
   type PLLC_RECEIVE_PARMS is access all LLC_RECEIVE_PARMS;
   type PLLC_TRANSMIT_PARMS is access all LLC_TRANSMIT_PARMS;
   type PLLC_TRANSMIT_DESCRIPTOR is access all LLC_TRANSMIT_DESCRIPTOR;
   type PLLC_TRANSMIT2_COMMAND is access all LLC_TRANSMIT2_COMMAND;

   type struct_anonymous0_t is record
      usStationId : Win32.USHORT;
      usParameter : Win32.USHORT;
   end record;

   type struct_anonymous1_t is record
      usParameter0 : Win32.USHORT;
      usParameter1 : Win32.USHORT;
   end record;

   type CCB_PARMS_kind is (
      pParameterTable_kind,
      dlc_kind,
      dir_kind,
      auchBuffer_kind,
      ulParameter_kind);

   type CCB_PARMS (Which : CCB_PARMS_kind := pParameterTable_kind) is record
      case Which is
         when pParameterTable_kind =>
            pParameterTable : PLLC_PARMS;
         when dlc_kind =>
            dlc : struct_anonymous0_t;
         when dir_kind =>
            dir : struct_anonymous1_t;
         when auchBuffer_kind =>
            auchBuffer : Win32.BYTE_Array (0 .. 3);
         when ulParameter_kind =>
            ulParameter : Win32.ULONG;
      end case;
   end record;

   pragma Convention (C_Pass_By_Copy, CCB_PARMS);

   pragma Unchecked_Union (CCB_PARMS);

   type LLC_CCB is record
      uchAdapterNumber : Win32.UCHAR;
      uchDlcCommand    : Win32.UCHAR;
      uchDlcStatus     : Win32.UCHAR;
      uchReserved1     : Win32.UCHAR;
      pNext            : PLLC_CCB;
      ulCompletionFlag : Win32.ULONG;
      u                : CCB_PARMS;
      hCompletionEvent : Win32.Winnt.HANDLE;
      uchReserved2     : Win32.UCHAR;
      uchReadFlag      : Win32.UCHAR;
      usReserved3      : Win32.USHORT;
   end record;

   type LLC_NEXT_BUFFER is record
      pNextBuffer : PLLC_BUFFER;
      cbFrame     : Win32.USHORT;
      cbBuffer    : Win32.USHORT;
      offUserData : Win32.USHORT;
      cbUserData  : Win32.USHORT;
   end record;

   type LLC_NOT_CONTIGUOUS_BUFFER is record
      pNextBuffer      : PLLC_BUFFER;
      cbFrame          : Win32.USHORT;
      cbBuffer         : Win32.USHORT;
      offUserData      : Win32.USHORT;
      cbUserData       : Win32.USHORT;
      usStationId      : Win32.USHORT;
      uchOptions       : Win32.UCHAR;
      uchMsgType       : Win32.UCHAR;
      cBuffersLeft     : Win32.USHORT;
      uchRcvFS         : Win32.UCHAR;
      uchAdapterNumber : Win32.UCHAR;
      pNextFrame       : PLLC_BUFFER;
      cbLanHeader      : Win32.UCHAR;
      cbDlcHeader      : Win32.UCHAR;
      auchLanHeader    : Win32.BYTE_Array (0 .. 31);
      auchDlcHeader    : Win32.BYTE_Array (0 .. 3);
      usPadding        : Win32.USHORT;
   end record;

   type LLC_CONTIGUOUS_BUFFER is record
      pNextBuffer      : PLLC_BUFFER;
      cbFrame          : Win32.USHORT;
      cbBuffer         : Win32.USHORT;
      offUserData      : Win32.USHORT;
      cbUserData       : Win32.USHORT;
      usStationId      : Win32.USHORT;
      uchOptions       : Win32.UCHAR;
      uchMsgType       : Win32.UCHAR;
      cBuffersLeft     : Win32.USHORT;
      uchRcvFS         : Win32.UCHAR;
      uchAdapterNumber : Win32.UCHAR;
      pNextFrame       : PLLC_BUFFER;
   end record;

   type LlcNextBuffer is record
      Header   : LLC_NEXT_BUFFER;
      auchData : Win32.UCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type struct_anonymous6_t is record
      Header   : LLC_NOT_CONTIGUOUS_BUFFER;
      auchData : Win32.UCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type struct_anonymous7_t is record
      Header   : LLC_CONTIGUOUS_BUFFER;
      auchData : Win32.UCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type LLC_XMIT_BUFFER is record
      pNext       : PLLC_XMIT_BUFFER;
      usReserved1 : Win32.USHORT;
      cbBuffer    : Win32.USHORT;
      usReserved2 : Win32.USHORT;
      cbUserData  : Win32.USHORT;
      auchData    : Win32.UCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type LLC_BUFFER_CREATE_PARMS is record
      hBufferPool            : Win32.Winnt.HANDLE;
      pBuffer                : Win32.PVOID;
      cbBufferSize           : Win32.ULONG;
      cbMinimumSizeThreshold : Win32.ULONG;
   end record;

   type LLC_BUFFER_FREE_PARMS is record
      usReserved1  : Win32.USHORT;
      cBuffersLeft : Win32.USHORT;
      ulReserved   : Win32.ULONG;
      pFirstBuffer : PLLC_XMIT_BUFFER;
   end record;

   type LLC_BUFFER_GET_PARMS is record
      usReserved1   : Win32.USHORT;
      cBuffersLeft  : Win32.USHORT;
      cBuffersToGet : Win32.USHORT;
      cbBufferSize  : Win32.USHORT;
      pFirstBuffer  : PLLC_XMIT_BUFFER;
   end record;

   type LLC_DLC_CONNECT_PARMS is record
      usStationId  : Win32.USHORT;
      usReserved   : Win32.USHORT;
      pRoutingInfo : Win32.PUCHAR;
   end record;

   type LLC_DLC_MODIFY_PARMS is record
      usRes                : Win32.USHORT;
      usStationId          : Win32.USHORT;
      uchT1                : Win32.UCHAR;
      uchT2                : Win32.UCHAR;
      uchTi                : Win32.UCHAR;
      uchMaxOut            : Win32.UCHAR;
      uchMaxIn             : Win32.UCHAR;
      uchMaxOutIncr        : Win32.UCHAR;
      uchMaxRetryCnt       : Win32.UCHAR;
      uchReserved1         : Win32.UCHAR;
      usMaxInfoFieldLength : Win32.USHORT;
      uchAccessPriority    : Win32.UCHAR;
      auchReserved3        : Win32.BYTE_Array (0 .. 3);
      cGroupCount          : Win32.UCHAR;
      pGroupList           : Win32.PUCHAR;
   end record;

   type LLC_DLC_OPEN_SAP_PARMS is record
      usStationId        : Win32.USHORT;
      usUserStatValue    : Win32.USHORT;
      uchT1              : Win32.UCHAR;
      uchT2              : Win32.UCHAR;
      uchTi              : Win32.UCHAR;
      uchMaxOut          : Win32.UCHAR;
      uchMaxIn           : Win32.UCHAR;
      uchMaxOutIncr      : Win32.UCHAR;
      uchMaxRetryCnt     : Win32.UCHAR;
      uchMaxMembers      : Win32.UCHAR;
      usMaxI_Field       : Win32.USHORT;
      uchSapValue        : Win32.UCHAR;
      uchOptionsPriority : Win32.UCHAR;
      uchcStationCount   : Win32.UCHAR;
      uchReserved2       : Win32.BYTE_Array (0 .. 1);
      cGroupCount        : Win32.UCHAR;
      pGroupList         : Win32.PUCHAR;
      DlcStatusFlags     : Win32.ULONG;
      uchReserved3       : Win32.BYTE_Array (0 .. 7);
      cLinkStationsAvail : Win32.UCHAR;
   end record;

   type LLC_DLC_OPEN_STATION_PARMS is record
      usSapStationId     : Win32.USHORT;
      usLinkStationId    : Win32.USHORT;
      uchT1              : Win32.UCHAR;
      uchT2              : Win32.UCHAR;
      uchTi              : Win32.UCHAR;
      uchMaxOut          : Win32.UCHAR;
      uchMaxIn           : Win32.UCHAR;
      uchMaxOutIncr      : Win32.UCHAR;
      uchMaxRetryCnt     : Win32.UCHAR;
      uchRemoteSap       : Win32.UCHAR;
      usMaxI_Field       : Win32.USHORT;
      uchAccessPriority  : Win32.UCHAR;
      pRemoteNodeAddress : Win32.PVOID;
   end record;

   type LLC_DLC_REALLOCATE_PARMS is record
      usStationId               : Win32.USHORT;
      uchOption                 : Win32.UCHAR;
      uchStationCount           : Win32.UCHAR;
      uchStationsAvailOnAdapter : Win32.UCHAR;
      uchStationsAvailOnSap     : Win32.UCHAR;
      uchTotalStationsOnAdapter : Win32.UCHAR;
      uchTotalStationsOnSap     : Win32.UCHAR;
   end record;

   type LLC_DLC_SET_THRESHOLD_PARMS is record
      usStationId      : Win32.USHORT;
      cBufferThreshold : Win32.USHORT;
      AlertEvent       : Win32.PVOID;
   end record;

   type LLC_TRACE_INITIALIZE_PARMS is record
      TraceBuffer     : Win32.PVOID;
      TraceBufferSize : Win32.ULONG;
      TraceFlags      : Win32.ULONG;
   end record;

   type DLC_SAP_LOG is record
      cTransmittedFrames : Win32.ULONG;
      cReceivedFrames    : Win32.ULONG;
      cDiscardedFrames   : Win32.ULONG;
      cDataLost          : Win32.ULONG;
      cBuffersAvailable  : Win32.USHORT;
   end record;

   type DLC_LINK_LOG is record
      cI_FramesTransmitted       : Win32.USHORT;
      cI_FramesReceived          : Win32.USHORT;
      cI_FrameReceiveErrors      : Win32.UCHAR;
      cI_FrameTransmissionErrors : Win32.UCHAR;
      cT1_ExpirationCount        : Win32.USHORT;
      uchLastCmdRespReceived     : Win32.UCHAR;
      uchLastCmdRespTransmitted  : Win32.UCHAR;
      uchPrimaryState            : Win32.UCHAR;
      uchSecondaryState          : Win32.UCHAR;
      uchSendStateVariable       : Win32.UCHAR;
      uchReceiveStateVariable    : Win32.UCHAR;
      uchLastNr                  : Win32.UCHAR;
      cbLanHeader                : Win32.UCHAR;
      auchLanHeader              : Win32.BYTE_Array (0 .. 31);
   end record;

   type LLC_DLC_LOG_BUFFER_kind is (Sap_kind, Link_kind);

   type LLC_DLC_LOG_BUFFER (Which : LLC_DLC_LOG_BUFFER_kind := Link_kind) is
      record
         case Which is
            when Sap_kind =>
               Sap : DLC_SAP_LOG;
            when Link_kind =>
               Link : DLC_LINK_LOG;
         end case;
      end record;

   pragma Unchecked_Union (LLC_DLC_LOG_BUFFER);

   type LLC_DLC_STATISTICS_PARMS is record
      usStationId    : Win32.USHORT;
      cbLogBufSize   : Win32.USHORT;
      pLogBuf        : PLLC_DLC_LOG_BUFFER;
      usActLogLength : Win32.USHORT;
      uchOptions     : Win32.UCHAR;
   end record;

   type LLC_DIR_INITIALIZE_PARMS is record
      usBringUps : Win32.USHORT;
      Reserved   : Win32.UCHAR_Array (0 .. 29);
   end record;

   type LLC_ADAPTER_OPEN_PARMS is record
      usOpenErrorCode       : Win32.USHORT;
      usOpenOptions         : Win32.USHORT;
      auchNodeAddress       : Win32.BYTE_Array (0 .. 5);
      auchGroupAddress      : Win32.BYTE_Array (0 .. 3);
      auchFunctionalAddress : Win32.BYTE_Array (0 .. 3);
      usReserved1           : Win32.USHORT;
      usReserved2           : Win32.USHORT;
      usMaxFrameSize        : Win32.USHORT;
      usReserved3           : Win32.WORD_Array (0 .. 3);
      usBringUps            : Win32.USHORT;
      InitWarnings          : Win32.USHORT;
      usReserved4           : Win32.WORD_Array (0 .. 2);
   end record;

   type LLC_DLC_PARMS is record
      uchDlcMaxSaps         : Win32.UCHAR;
      uchDlcMaxStations     : Win32.UCHAR;
      uchDlcMaxGroupSaps    : Win32.UCHAR;
      uchDlcMaxGroupMembers : Win32.UCHAR;
      uchT1_TickOne         : Win32.UCHAR;
      uchT2_TickOne         : Win32.UCHAR;
      uchTi_TickOne         : Win32.UCHAR;
      uchT1_TickTwo         : Win32.UCHAR;
      uchT2_TickTwo         : Win32.UCHAR;
      uchTi_TickTwo         : Win32.UCHAR;
   end record;

   type LLC_EXTENDED_ADAPTER_PARMS is record
      hBufferPool         : Win32.PVOID;
      pSecurityDescriptor : Win32.PVOID;
      LlcEthernetType     : LLC_ETHERNET_TYPE;
   end record;

   type LLC_DIR_OPEN_ADAPTER_PARMS is record
      pAdapterParms  : PLLC_ADAPTER_OPEN_PARMS;
      pExtendedParms : PLLC_EXTENDED_ADAPTER_PARMS;
      pDlcParms      : PLLC_DLC_PARMS;
      pReserved1     : Win32.PVOID;
   end record;

   type LLC_DIR_MULTICAST_ADDRESS is record
      auchMulticastAddress : Win32.UCHAR_Array (0 .. 5);
   end record;

   type LLC_DIR_OPEN_DIRECT_PARMS is record
      Reserved             : Win32.BYTE_Array (0 .. 3);
      usOpenOptions        : Win32.USHORT;
      usEthernetType       : Win32.USHORT;
      ulProtocolTypeMask   : Win32.ULONG;
      ulProtocolTypeMatch  : Win32.ULONG;
      usProtocolTypeOffset : Win32.USHORT;
   end record;

   type LLC_ADAPTER_LOG_TR is record
      cLineError         : Win32.UCHAR;
      cInternalError     : Win32.UCHAR;
      cBurstError        : Win32.UCHAR;
      cAC_Error          : Win32.UCHAR;
      cAbortDelimiter    : Win32.UCHAR;
      uchReserved1       : Win32.UCHAR;
      cLostFrame         : Win32.UCHAR;
      cReceiveCongestion : Win32.UCHAR;
      cFrameCopiedError  : Win32.UCHAR;
      cFrequencyError    : Win32.UCHAR;
      cTokenError        : Win32.UCHAR;
      uchReserved2       : Win32.UCHAR;
      uchReserved3       : Win32.UCHAR;
      uchReserved4       : Win32.UCHAR;
   end record;

   type LLC_ADAPTER_LOG_ETH is record
      cCRC_Error         : Win32.UCHAR;
      uchReserved1       : Win32.UCHAR;
      cAlignmentError    : Win32.UCHAR;
      uchReserved2       : Win32.UCHAR;
      cTransmitError     : Win32.UCHAR;
      uchReserved3       : Win32.UCHAR;
      cCollisionError    : Win32.UCHAR;
      cReceiveCongestion : Win32.UCHAR;
      uchReserved        : Win32.UCHAR_Array (0 .. 5);
   end record;

   type LLC_ADAPTER_LOG_kind is (Tr_kind, Eth_kind);

   type LLC_ADAPTER_LOG (Which : LLC_ADAPTER_LOG_kind := Tr_kind) is record
      case Which is
         when Tr_kind =>
            Tr : LLC_ADAPTER_LOG_TR;
         when Eth_kind =>
            Eth : LLC_ADAPTER_LOG_ETH;
      end case;
   end record;

   pragma Convention (C_Pass_By_Copy, LLC_ADAPTER_LOG);

   pragma Unchecked_Union (LLC_ADAPTER_LOG);

   type LLC_DIRECT_LOG is record
      cTransmittedFrames : Win32.ULONG;
      cReceivedFrames    : Win32.ULONG;
      cDiscardedFrames   : Win32.ULONG;
      cDataLost          : Win32.ULONG;
      cBuffersAvailable  : Win32.USHORT;
   end record;

   type struct_anonymous36_t is record
      Adapter : LLC_ADAPTER_LOG;
      Dir     : LLC_DIRECT_LOG;
   end record;

   type LLC_DIR_READ_LOG_BUFFER_kind is (Adapter_kind, Dir_kind, both_kind);

   type LLC_DIR_READ_LOG_BUFFER
     (Which : LLC_DIR_READ_LOG_BUFFER_kind := both_kind)
   is
      record
         case Which is
            when Adapter_kind =>
               Adapter : LLC_ADAPTER_LOG;
            when Dir_kind =>
               Dir : LLC_DIRECT_LOG;
            when both_kind =>
               both : struct_anonymous36_t;
         end case;
      end record;

   pragma Unchecked_Union (LLC_DIR_READ_LOG_BUFFER);

   type LLC_DIR_READ_LOG_PARMS is record
      usTypeId       : Win32.USHORT;
      cbLogBuffer    : Win32.USHORT;
      pLogBuffer     : PLLC_DIR_READ_LOG_BUFFER;
      cbActualLength : Win32.USHORT;
   end record;

   type LLC_DIR_SET_EFLAG_PARMS is record
      ulAdapterCheckFlag  : Win32.ULONG;
      ulNetworkStatusFlag : Win32.ULONG;
      ulPcErrorFlag       : Win32.ULONG;
      ulSystemActionFlag  : Win32.ULONG;
   end record;

   type LLC_DIR_STATUS_PARMS is record
      auchPermanentAddress : Win32.UCHAR_Array (0 .. 5);
      auchNodeAddress      : Win32.UCHAR_Array (0 .. 5);
      auchGroupAddress     : Win32.UCHAR_Array (0 .. 3);
      auchFunctAddr        : Win32.UCHAR_Array (0 .. 3);
      uchMaxSap            : Win32.UCHAR;
      uchOpenSaps          : Win32.UCHAR;
      uchMaxStations       : Win32.UCHAR;
      uchOpenStation       : Win32.UCHAR;
      uchAvailStations     : Win32.UCHAR;
      uchAdapterConfig     : Win32.UCHAR;
      auchReserved1        : Win32.UCHAR_Array (0 .. 10);
      ulReserved1          : Win32.ULONG;
      ulReserved2          : Win32.ULONG;
      ulMaxFrameLength     : Win32.ULONG;
      usLastNetworkStatus  : Win32.USHORT;
      usAdapterType        : Win32.USHORT;
   end record;

   type struct_anonymous41_t is record
      usCcbCount           : Win32.USHORT;
      pCcbCompletionList   : PLLC_CCB;
      usBufferCount        : Win32.USHORT;
      pFirstBuffer         : PLLC_BUFFER;
      usReceivedFrameCount : Win32.USHORT;
      pReceivedFrame       : PLLC_BUFFER;
      usEventErrorCode     : Win32.USHORT;
      usEventErrorData     : Win32.WORD_Array (0 .. 2);
   end record;

   type struct_anonymous43_t is record
      usStationId          : Win32.USHORT;
      usDlcStatusCode      : Win32.USHORT;
      uchFrmrData          : Win32.UCHAR_Array (0 .. 4);
      uchAccessPritority   : Win32.UCHAR;
      uchRemoteNodeAddress : Win32.UCHAR_Array (0 .. 5);
      uchRemoteSap         : Win32.UCHAR;
      uchReserved          : Win32.UCHAR;
      usUserStatusValue    : Win32.USHORT;
   end record;

   type union_anonymous44_t_kind is (Event_kind, Status_kind);

   type union_anonymous44_t (Which : union_anonymous44_t_kind := Event_kind) is
      record
         case Which is
            when Event_kind =>
               Event : struct_anonymous41_t;
            when Status_kind =>
               Status : struct_anonymous43_t;
         end case;
      end record;

   pragma Unchecked_Union (union_anonymous44_t);

   type LLC_READ_PARMS is record
      usStationId        : Win32.USHORT;
      uchOptionIndicator : Win32.UCHAR;
      uchEventSet        : Win32.UCHAR;
      uchEvent           : Win32.UCHAR;
      uchCriticalSubset  : Win32.UCHAR;
      ulNotificationFlag : Win32.ULONG;
      c_Type             : union_anonymous44_t;
   end record;

   type LLC_READ_COMMAND is record
      Ccb   : LLC_CCB;
      Parms : LLC_READ_PARMS;
   end record;

   type LLC_RECEIVE_PARMS is record
      usStationId      : Win32.USHORT;
      usUserLength     : Win32.USHORT;
      ulReceiveFlag    : Win32.ULONG;
      pFirstBuffer     : PLLC_BUFFER;
      uchOptions       : Win32.UCHAR;
      auchReserved1    : Win32.UCHAR_Array (0 .. 2);
      uchRcvReadOption : Win32.UCHAR;
   end record;

   type LLC_TRANSMIT_PARMS is record
      usStationId       : Win32.USHORT;
      uchTransmitFs     : Win32.UCHAR;
      uchRemoteSap      : Win32.UCHAR;
      pXmitQueue1       : PLLC_XMIT_BUFFER;
      pXmitQueue2       : PLLC_XMIT_BUFFER;
      cbBuffer1         : Win32.USHORT;
      cbBuffer2         : Win32.USHORT;
      pBuffer1          : Win32.PVOID;
      pBuffer2          : Win32.PVOID;
      uchXmitReadOption : Win32.UCHAR;
   end record;

   type LLC_TRANSMIT_DESCRIPTOR is record
      eSegmentType   : Win32.UCHAR;
      boolFreeBuffer : Win32.UCHAR;
      cbBuffer       : Win32.USHORT;
      pBuffer        : Win32.PVOID;
   end record;

   type LLC_TRANSMIT_DESCRIPTOR_Array is
     array (Natural range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased LLC_TRANSMIT_DESCRIPTOR;

   type LLC_TRANSMIT2_COMMAND is record
      Ccb               : LLC_CCB;
      usStationId       : Win32.USHORT;
      usFrameType       : Win32.USHORT;
      uchRemoteSap      : Win32.UCHAR;
      uchXmitReadOption : Win32.UCHAR;
      Reserved2         : Win32.UCHAR_Array (0 .. 2);
      cXmitBufferCount  : Win32.ULONG;
      aXmitBuffer       : LLC_TRANSMIT_DESCRIPTOR_Array;
   end record;

   type LLC_PARMS_kind is (
      BufferFree_kind,
      BufferGet_kind,
      DlcConnectStation_kind,
      DlcModify_kind,
      DlcOpenSap_kind,
      DlcOpenStation_kind,
      DlcReallocate_kind,
      DlcSetThreshold_kind,
      DlcStatistics_kind,
      DirInitialize_kind,
      DirOpenAdapter_kind,
      DirOpenDirect_kind,
      DirReadLog_kind,
      DirSetEventFlag_kind,
      DirStatus_kind,
      Read_kind,
      Receive_kind,
      Transmit_kind,
      Transmit2_kind,
      TraceInitialize_kind);

   type LLC_PARMS (Which : LLC_PARMS_kind := DirStatus_kind) is record
      case Which is
      when BufferFree_kind =>
         BufferFree : LLC_BUFFER_FREE_PARMS;
      when BufferGet_kind =>
         BufferGet : LLC_BUFFER_GET_PARMS;
      when DlcConnectStation_kind =>
         DlcConnectStation : LLC_DLC_CONNECT_PARMS;
      when DlcModify_kind =>
         DlcModify : LLC_DLC_MODIFY_PARMS;
      when DlcOpenSap_kind =>
         DlcOpenSap : LLC_DLC_OPEN_SAP_PARMS;
      when DlcOpenStation_kind =>
         DlcOpenStation : LLC_DLC_OPEN_STATION_PARMS;
      when DlcReallocate_kind =>
         DlcReallocate : LLC_DLC_REALLOCATE_PARMS;
      when DlcSetThreshold_kind =>
         DlcSetThreshold : LLC_DLC_SET_THRESHOLD_PARMS;
      when DlcStatistics_kind =>
         DlcStatistics : LLC_DLC_STATISTICS_PARMS;
      when DirInitialize_kind =>
         DirInitialize : LLC_DIR_INITIALIZE_PARMS;
      when DirOpenAdapter_kind =>
         DirOpenAdapter : LLC_DIR_OPEN_ADAPTER_PARMS;
      when DirOpenDirect_kind =>
         DirOpenDirect : LLC_DIR_OPEN_DIRECT_PARMS;
      when DirReadLog_kind =>
         DirReadLog : LLC_DIR_READ_LOG_PARMS;
      when DirSetEventFlag_kind =>
         DirSetEventFlag : LLC_DIR_SET_EFLAG_PARMS;
      when DirStatus_kind =>
         DirStatus : LLC_DIR_STATUS_PARMS;
      when Read_kind =>
         Read : LLC_READ_PARMS;
      when Receive_kind =>
         Receive : LLC_RECEIVE_PARMS;
      when Transmit_kind =>
         Transmit : LLC_TRANSMIT_PARMS;
      when Transmit2_kind =>
         Transmit2 : LLC_TRANSMIT2_COMMAND;
      when TraceInitialize_kind =>
         TraceInitialize : LLC_TRACE_INITIALIZE_PARMS;
      end case;
   end record;

   pragma Unchecked_Union (LLC_PARMS);

   type LLC_BUFFER_kind is (
      pNext_kind,
      Next_kind,
      Buffer_kind,
      NotContiguous_kind,
      NotCont_kind,
      Contiguous_kind,
      Cont_kind);

   type LLC_BUFFER (Which : LLC_BUFFER_kind := NotCont_kind) is record
      case Which is
         when pNext_kind =>
            pNext : PLLC_BUFFER;
         when Next_kind =>
            Next : LLC_NEXT_BUFFER;
         when Buffer_kind =>
            Buffer : LlcNextBuffer;
         when NotContiguous_kind =>
            NotContiguous : LLC_NOT_CONTIGUOUS_BUFFER;
         when NotCont_kind =>
            NotCont : struct_anonymous6_t;
         when Contiguous_kind =>
            Contiguous : LLC_CONTIGUOUS_BUFFER;
         when Cont_kind =>
            Cont : struct_anonymous7_t;
      end case;
   end record;

   pragma Unchecked_Union (LLC_BUFFER);

   function LLC_XMIT_BUFFER_SIZE return Size_T;

   function AcsLan
     (pCcb     : PLLC_CCB;
      ppBadCcb : access PLLC_CCB)
      return ACSLAN_STATUS;

private

   pragma Convention (C_Pass_By_Copy, struct_anonymous0_t);
   pragma Convention (C_Pass_By_Copy, struct_anonymous1_t);
   pragma Convention (C, LLC_CCB);
   pragma Convention (C_Pass_By_Copy, LLC_NEXT_BUFFER);
   pragma Convention (C, LLC_NOT_CONTIGUOUS_BUFFER);
   pragma Convention (C, LLC_CONTIGUOUS_BUFFER);
   pragma Convention (C_Pass_By_Copy, LlcNextBuffer);
   pragma Convention (C, struct_anonymous6_t);
   pragma Convention (C, struct_anonymous7_t);
   pragma Convention (C_Pass_By_Copy, LLC_XMIT_BUFFER);
   pragma Convention (C_Pass_By_Copy, LLC_BUFFER_CREATE_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_BUFFER_FREE_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_BUFFER_GET_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_DLC_CONNECT_PARMS);
   pragma Convention (C, LLC_DLC_MODIFY_PARMS);
   pragma Convention (C, LLC_DLC_OPEN_SAP_PARMS);
   pragma Convention (C, LLC_DLC_OPEN_STATION_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_DLC_REALLOCATE_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_DLC_SET_THRESHOLD_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_TRACE_INITIALIZE_PARMS);
   pragma Convention (C, DLC_SAP_LOG);
   pragma Convention (C, DLC_LINK_LOG);
   pragma Convention (C_Pass_By_Copy, LLC_DLC_STATISTICS_PARMS);
   pragma Convention (C, LLC_DIR_INITIALIZE_PARMS);
   pragma Convention (C, LLC_ADAPTER_OPEN_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_DLC_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_EXTENDED_ADAPTER_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_DIR_OPEN_ADAPTER_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_DIR_MULTICAST_ADDRESS);
   pragma Convention (C, LLC_DIR_OPEN_DIRECT_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_ADAPTER_LOG_TR);
   pragma Convention (C_Pass_By_Copy, LLC_ADAPTER_LOG_ETH);
   pragma Convention (C, LLC_DIRECT_LOG);
   pragma Convention (C, struct_anonymous36_t);
   pragma Convention (C_Pass_By_Copy, LLC_DIR_READ_LOG_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_DIR_SET_EFLAG_PARMS);
   pragma Convention (C, LLC_DIR_STATUS_PARMS);
   pragma Convention (C, struct_anonymous41_t);
   pragma Convention (C, struct_anonymous43_t);
   pragma Convention (C, LLC_READ_PARMS);
   pragma Convention (C, LLC_READ_COMMAND);
   pragma Convention (C, LLC_RECEIVE_PARMS);
   pragma Convention (C, LLC_TRANSMIT_PARMS);
   pragma Convention (C_Pass_By_Copy, LLC_TRANSMIT_DESCRIPTOR);
   pragma Convention (C, LLC_TRANSMIT2_COMMAND);

   pragma Import (Stdcall, AcsLan, "AcsLan");

end Win32.Dlcapi;
