-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winnt;

package Win32.Dlcapi is

    LLC_DIR_INTERRUPT                : constant := 16#0#;   -- dlcapi.h:28
    LLC_DIR_OPEN_ADAPTER             : constant := 16#3#;   -- dlcapi.h:29
    LLC_DIR_CLOSE_ADAPTER            : constant := 16#4#;   -- dlcapi.h:30
    LLC_DIR_SET_MULTICAST_ADDRESS    : constant := 16#5#;   -- dlcapi.h:31
    LLC_DIR_SET_GROUP_ADDRESS        : constant := 16#6#;   -- dlcapi.h:32
    LLC_DIR_SET_FUNCTIONAL_ADDRESS   : constant := 16#7#;   -- dlcapi.h:33
    LLC_DIR_READ_LOG                 : constant := 16#8#;   -- dlcapi.h:34
    LLC_TRANSMIT_FRAMES              : constant := 16#9#;   -- dlcapi.h:35
    LLC_TRANSMIT_DIR_FRAME           : constant := 16#a#;   -- dlcapi.h:36
    LLC_TRANSMIT_I_FRAME             : constant := 16#b#;   -- dlcapi.h:37
    LLC_TRANSMIT_UI_FRAME            : constant := 16#d#;   -- dlcapi.h:38
    LLC_TRANSMIT_XID_CMD             : constant := 16#e#;   -- dlcapi.h:39
    LLC_TRANSMIT_XID_RESP_FINAL      : constant := 16#f#;   -- dlcapi.h:40
    LLC_TRANSMIT_XID_RESP_NOT_FINAL  : constant := 16#10#;  -- dlcapi.h:41
    LLC_TRANSMIT_TEST_CMD            : constant := 16#11#;  -- dlcapi.h:42
    LLC_DLC_RESET                    : constant := 16#14#;  -- dlcapi.h:43
    LLC_DLC_OPEN_SAP                 : constant := 16#15#;  -- dlcapi.h:44
    LLC_DLC_CLOSE_SAP                : constant := 16#16#;  -- dlcapi.h:45
    LLC_DLC_REALLOCATE_STATIONS      : constant := 16#17#;  -- dlcapi.h:46
    LLC_DLC_OPEN_STATION             : constant := 16#19#;  -- dlcapi.h:47
    LLC_DLC_CLOSE_STATION            : constant := 16#1a#;  -- dlcapi.h:48
    LLC_DLC_CONNECT_STATION          : constant := 16#1b#;  -- dlcapi.h:49
    LLC_DLC_MODIFY                   : constant := 16#1c#;  -- dlcapi.h:50
    LLC_DLC_FLOW_CONTROL             : constant := 16#1d#;  -- dlcapi.h:51
    LLC_DLC_STATISTICS               : constant := 16#1e#;  -- dlcapi.h:52
    LLC_DIR_INITIALIZE               : constant := 16#20#;  -- dlcapi.h:53
    LLC_DIR_STATUS                   : constant := 16#21#;  -- dlcapi.h:54
    LLC_DIR_TIMER_SET                : constant := 16#22#;  -- dlcapi.h:55
    LLC_DIR_TIMER_CANCEL             : constant := 16#23#;  -- dlcapi.h:56
    LLC_BUFFER_GET                   : constant := 16#26#;  -- dlcapi.h:57
    LLC_BUFFER_FREE                  : constant := 16#27#;  -- dlcapi.h:58
    LLC_RECEIVE                      : constant := 16#28#;  -- dlcapi.h:59
    LLC_RECEIVE_CANCEL               : constant := 16#29#;  -- dlcapi.h:60
    LLC_RECEIVE_MODIFY               : constant := 16#2a#;  -- dlcapi.h:61
    LLC_DIR_TIMER_CANCEL_GROUP       : constant := 16#2c#;  -- dlcapi.h:62
    LLC_DIR_SET_EXCEPTION_FLAGS      : constant := 16#2d#;  -- dlcapi.h:63
    LLC_BUFFER_CREATE                : constant := 16#30#;  -- dlcapi.h:64
    LLC_READ                         : constant := 16#31#;  -- dlcapi.h:65
    LLC_READ_CANCEL                  : constant := 16#32#;  -- dlcapi.h:66
    LLC_DLC_SET_THRESHOLD            : constant := 16#33#;  -- dlcapi.h:67
    LLC_DIR_CLOSE_DIRECT             : constant := 16#34#;  -- dlcapi.h:68
    LLC_DIR_OPEN_DIRECT              : constant := 16#35#;  -- dlcapi.h:69
    LLC_MAX_DLC_COMMAND              : constant := 16#37#;  -- dlcapi.h:70
    LLC_RESET_LOCAL_BUSY_USER        : constant := 16#80#;  -- dlcapi.h:273
    LLC_RESET_LOCAL_BUSY_BUFFER      : constant := 16#c0#;  -- dlcapi.h:274
    LLC_SET_LOCAL_BUSY_USER          : constant := 0;       -- dlcapi.h:275
    LLC_XID_HANDLING_IN_APPLICATION  : constant := 16#8#;   -- dlcapi.h:295
    LLC_XID_HANDLING_IN_DLC          : constant := 0;       -- dlcapi.h:296
    LLC_INDIVIDUAL_SAP               : constant := 16#4#;   -- dlcapi.h:297
    LLC_GROUP_SAP                    : constant := 16#2#;   -- dlcapi.h:298
    LLC_MEMBER_OF_GROUP_SAP          : constant := 16#1#;   -- dlcapi.h:299
    LLC_INCREASE_LINK_STATIONS       : constant := 0;       -- dlcapi.h:340
    LLC_DECREASE_LINK_STATIONS       : constant := 16#80#;  -- dlcapi.h:341
    LLC_DLC_RESET_STATISTICS         : constant := 16#80#;  -- dlcapi.h:365
    LLC_DLC_READ_STATISTICS          : constant := 0;       -- dlcapi.h:366
    LLC_DIRECT_OPTIONS_ALL_MACS      : constant := 16#1880#;-- dlcapi.h:470
    LLC_DIR_READ_LOG_ADAPTER         : constant := 0;       -- dlcapi.h:534
    LLC_DIR_READ_LOG_DIRECT          : constant := 1;       -- dlcapi.h:535
    LLC_DIR_READ_LOG_BOTH            : constant := 2;       -- dlcapi.h:536
    LLC_ADAPTER_ETHERNET             : constant := 16#10#;  -- dlcapi.h:552
    LLC_ADAPTER_TOKEN_RING           : constant := 16#40#;  -- dlcapi.h:553
    LLC_OPTION_READ_STATION          : constant := 0;       -- dlcapi.h:575
    LLC_OPTION_READ_SAP              : constant := 1;       -- dlcapi.h:576
    LLC_OPTION_READ_ALL              : constant := 2;       -- dlcapi.h:577
    LLC_EVENT_SYSTEM_ACTION          : constant := 16#40#;  -- dlcapi.h:579
    LLC_EVENT_NETWORK_STATUS         : constant := 16#20#;  -- dlcapi.h:580
    LLC_EVENT_CRITICAL_EXCEPTION     : constant := 16#10#;  -- dlcapi.h:581
    LLC_EVENT_STATUS_CHANGE          : constant := 16#8#;   -- dlcapi.h:582
    LLC_EVENT_RECEIVE_DATA           : constant := 16#4#;   -- dlcapi.h:583
    LLC_EVENT_TRANSMIT_COMPLETION    : constant := 16#2#;   -- dlcapi.h:584
    LLC_EVENT_COMMAND_COMPLETION     : constant := 16#1#;   -- dlcapi.h:585
    LLC_READ_ALL_EVENTS              : constant := 16#7f#;  -- dlcapi.h:586
    LLC_INDICATE_LINK_LOST           : constant := 16#8000#;-- dlcapi.h:593
    LLC_INDICATE_DM_DISC_RECEIVED    : constant := 16#4000#;-- dlcapi.h:594
    LLC_INDICATE_FRMR_RECEIVED       : constant := 16#2000#;-- dlcapi.h:595
    LLC_INDICATE_FRMR_SENT           : constant := 16#1000#;-- dlcapi.h:596
    LLC_INDICATE_RESET               : constant := 16#800#; -- dlcapi.h:597
    LLC_INDICATE_CONNECT_REQUEST     : constant := 16#400#; -- dlcapi.h:598
    LLC_INDICATE_REMOTE_BUSY         : constant := 16#200#; -- dlcapi.h:599
    LLC_INDICATE_REMOTE_READY        : constant := 16#100#; -- dlcapi.h:600
    LLC_INDICATE_TI_TIMER_EXPIRED    : constant := 16#80#;  -- dlcapi.h:601
    LLC_INDICATE_DLC_COUNTER_OVERFLOW: constant := 16#40#;  -- dlcapi.h:602
    LLC_INDICATE_ACCESS_PRTY_LOWERED : constant := 16#20#;  -- dlcapi.h:603
    LLC_INDICATE_LOCAL_STATION_BUSY  : constant := 16#1#;   -- dlcapi.h:604
    LLC_DIR_RCV_ALL_TR_FRAMES        : constant := 0;       -- dlcapi.h:660
    LLC_DIR_RCV_ALL_MAC_FRAMES       : constant := 1;       -- dlcapi.h:661
    LLC_DIR_RCV_ALL_8022_FRAMES      : constant := 2;       -- dlcapi.h:662
    LLC_DIR_RCV_ALL_FRAMES           : constant := 4;       -- dlcapi.h:663
    LLC_DIR_RCV_ALL_ETHERNET_TYPES   : constant := 5;       -- dlcapi.h:664
    LLC_CONTIGUOUS_MAC               : constant := 16#80#;  -- dlcapi.h:666
    LLC_CONTIGUOUS_DATA              : constant := 16#40#;  -- dlcapi.h:667
    LLC_NOT_CONTIGUOUS_DATA          : constant := 16#0#;   -- dlcapi.h:668
    LLC_RCV_READ_INDIVIDUAL_FRAMES   : constant := 0;       -- dlcapi.h:674
    LLC_RCV_CHAIN_FRAMES_ON_LINK     : constant := 1;       -- dlcapi.h:675
    LLC_RCV_CHAIN_FRAMES_ON_SAP      : constant := 2;       -- dlcapi.h:676
    LLC_CHAIN_XMIT_COMMANDS_ON_LINK  : constant := 0;       -- dlcapi.h:688
    LLC_COMPLETE_SINGLE_XMIT_FRAME   : constant := 1;       -- dlcapi.h:689
    LLC_CHAIN_XMIT_COMMANDS_ON_SAP   : constant := 2;       -- dlcapi.h:690
    LLC_FIRST_DATA_SEGMENT           : constant := 16#1#;   -- dlcapi.h:705
    LLC_NEXT_DATA_SEGMENT            : constant := 16#2#;   -- dlcapi.h:706
    LLC_STATUS_MAX_ERROR             : constant := 16#ff#;  -- dlcapi.h:877


    type LLC_ETHERNET_TYPE is (                             -- dlcapi.h:451
        LLC_ETHERNET_TYPE_DEFAULT,                          -- dlcapi.h:447
        LLC_ETHERNET_TYPE_AUTO,                             -- dlcapi.h:448
        LLC_ETHERNET_TYPE_802_3,                            -- dlcapi.h:449
        LLC_ETHERNET_TYPE_DIX                               -- dlcapi.h:451
    );
    for LLC_ETHERNET_TYPE'size use 32;                      -- dlcapi.h:451

    type enum_LLC_FRAME_TYPES is (                          -- dlcapi.h:722
        LLC_DIRECT_TRANSMIT,                                -- dlcapi.h:723
        LLC_DIRECT_MAC,                                     -- dlcapi.h:724
        LLC_I_FRAME,                                        -- dlcapi.h:725
        LLC_UI_FRAME,                                       -- dlcapi.h:726
        LLC_XID_COMMAND_POLL,                               -- dlcapi.h:727
        LLC_XID_COMMAND_NOT_POLL,                           -- dlcapi.h:728
        LLC_XID_RESPONSE_FINAL,                             -- dlcapi.h:729
        LLC_XID_RESPONSE_NOT_FINAL,                         -- dlcapi.h:730
        LLC_TEST_RESPONSE_FINAL,                            -- dlcapi.h:731
        LLC_TEST_RESPONSE_NOT_FINAL,                        -- dlcapi.h:732
        LLC_DIRECT_8022,                                    -- dlcapi.h:733
        LLC_TEST_COMMAND_POLL,                              -- dlcapi.h:734
        LLC_DIRECT_ETHERNET_TYPE,                           -- dlcapi.h:735
        LLC_LAST_FRAME_TYPE,                                -- dlcapi.h:736
        LLC_FIRST_ETHERNET_TYPE                             -- dlcapi.h:738
    );
    for enum_LLC_FRAME_TYPES use (                          -- dlcapi.h:722
        LLC_DIRECT_TRANSMIT => 0,                           -- dlcapi.h:723
        LLC_DIRECT_MAC => 2,                                -- dlcapi.h:724
        LLC_I_FRAME => 4,                                   -- dlcapi.h:725
        LLC_UI_FRAME => 6,                                  -- dlcapi.h:726
        LLC_XID_COMMAND_POLL => 8,                          -- dlcapi.h:727
        LLC_XID_COMMAND_NOT_POLL => 10,                     -- dlcapi.h:728
        LLC_XID_RESPONSE_FINAL => 12,                       -- dlcapi.h:729
        LLC_XID_RESPONSE_NOT_FINAL => 14,                   -- dlcapi.h:730
        LLC_TEST_RESPONSE_FINAL => 16,                      -- dlcapi.h:731
        LLC_TEST_RESPONSE_NOT_FINAL => 18,                  -- dlcapi.h:732
        LLC_DIRECT_8022 => 20,                              -- dlcapi.h:733
        LLC_TEST_COMMAND_POLL => 22,                        -- dlcapi.h:734
        LLC_DIRECT_ETHERNET_TYPE => 24,                     -- dlcapi.h:735
        LLC_LAST_FRAME_TYPE => 26,                          -- dlcapi.h:736
        LLC_FIRST_ETHERNET_TYPE => 1501                     -- dlcapi.h:738
    );
    for enum_LLC_FRAME_TYPES'size use 32;                   -- dlcapi.h:722

    type LLC_STATUS is (                                    -- dlcapi.h:790
        LLC_STATUS_SUCCESS,                                 -- dlcapi.h:791
        LLC_STATUS_INVALID_COMMAND,                         -- dlcapi.h:792
        LLC_STATUS_DUPLICATE_COMMAND,                       -- dlcapi.h:793
        LLC_STATUS_ADAPTER_OPEN,                            -- dlcapi.h:794
        LLC_STATUS_ADAPTER_CLOSED,                          -- dlcapi.h:795
        LLC_STATUS_PARAMETER_MISSING,                       -- dlcapi.h:796
        LLC_STATUS_INVALID_OPTION,                          -- dlcapi.h:797
        LLC_STATUS_COMMAND_CANCELLED_FAILURE,               -- dlcapi.h:798
        LLC_STATUS_ACCESS_DENIED,                           -- dlcapi.h:799
        LLC_STATUS_ADAPTER_NOT_INITIALIZED,                 -- dlcapi.h:800
        LLC_STATUS_CANCELLED_BY_USER,                       -- dlcapi.h:801
        LLC_STATUS_COMMAND_CANCELLED_CLOSED,                -- dlcapi.h:802
        LLC_STATUS_SUCCESS_NOT_OPEN,                        -- dlcapi.h:803
        LLC_STATUS_TIMER_ERROR,                             -- dlcapi.h:804
        LLC_STATUS_NO_MEMORY,                               -- dlcapi.h:805
        LLC_STATUS_INVALID_LOG_ID,                          -- dlcapi.h:806
        LLC_STATUS_LOST_LOG_DATA,                           -- dlcapi.h:807
        LLC_STATUS_BUFFER_SIZE_EXCEEDED,                    -- dlcapi.h:808
        LLC_STATUS_INVALID_BUFFER_LENGTH,                   -- dlcapi.h:809
        LLC_STATUS_INADEQUATE_BUFFERS,                      -- dlcapi.h:810
        LLC_STATUS_USER_LENGTH_TOO_LARGE,                   -- dlcapi.h:811
        LLC_STATUS_INVALID_PARAMETER_TABLE,                 -- dlcapi.h:812
        LLC_STATUS_INVALID_POINTER_IN_CCB,                  -- dlcapi.h:813
        LLC_STATUS_INVALID_ADAPTER,                         -- dlcapi.h:814
        LLC_STATUS_LOST_DATA_NO_BUFFERS,                    -- dlcapi.h:815
        LLC_STATUS_LOST_DATA_INADEQUATE_SPACE,              -- dlcapi.h:816
        LLC_STATUS_TRANSMIT_ERROR_FS,                       -- dlcapi.h:817
        LLC_STATUS_TRANSMIT_ERROR,                          -- dlcapi.h:818
        LLC_STATUS_UNAUTHORIZED_MAC,                        -- dlcapi.h:819
        LLC_STATUS_MAX_COMMANDS_EXCEEDED,                   -- dlcapi.h:820
        LLC_STATUS_LINK_NOT_TRANSMITTING,                   -- dlcapi.h:821
        LLC_STATUS_INVALID_FRAME_LENGTH,                    -- dlcapi.h:822
        LLC_STATUS_INADEQUATE_RECEIVE,                      -- dlcapi.h:823
        LLC_STATUS_INVALID_NODE_ADDRESS,                    -- dlcapi.h:824
        LLC_STATUS_INVALID_RCV_BUFFER_LENGTH,               -- dlcapi.h:825
        LLC_STATUS_INVALID_XMIT_BUFFER_LENGTH,              -- dlcapi.h:826
        LLC_STATUS_INVALID_STATION_ID,                      -- dlcapi.h:827
        LLC_STATUS_LINK_PROTOCOL_ERROR,                     -- dlcapi.h:828
        LLC_STATUS_PARMETERS_EXCEEDED_MAX,                  -- dlcapi.h:829
        LLC_STATUS_INVALID_SAP_VALUE,                       -- dlcapi.h:830
        LLC_STATUS_INVALID_ROUTING_INFO,                    -- dlcapi.h:831
        LLC_STATUS_RESOURCES_NOT_AVAILABLE,                 -- dlcapi.h:832
        LLC_STATUS_LINK_STATIONS_OPEN,                      -- dlcapi.h:833
        LLC_STATUS_INCOMPATIBLE_COMMANDS,                   -- dlcapi.h:834
        LLC_STATUS_OUTSTANDING_COMMANDS,                    -- dlcapi.h:835
        LLC_STATUS_CONNECT_FAILED,                          -- dlcapi.h:836
        LLC_STATUS_INVALID_REMOTE_ADDRESS,                  -- dlcapi.h:837
        LLC_STATUS_CCB_POINTER_FIELD,                       -- dlcapi.h:838
        LLC_STATUS_INVALID_APPLICATION_ID,                  -- dlcapi.h:839
        LLC_STATUS_NO_SYSTEM_PROCESS,                       -- dlcapi.h:840
        LLC_STATUS_INADEQUATE_LINKS,                        -- dlcapi.h:841
        LLC_STATUS_INVALID_PARAMETER_1,                     -- dlcapi.h:842
        LLC_STATUS_DIRECT_STATIONS_NOT_ASSIGNED,            -- dlcapi.h:843
        LLC_STATUS_DEVICE_DRIVER_NOT_INSTALLED,             -- dlcapi.h:844
        LLC_STATUS_ADAPTER_NOT_INSTALLED,                   -- dlcapi.h:845
        LLC_STATUS_CHAINED_DIFFERENT_ADAPTERS,              -- dlcapi.h:846
        LLC_STATUS_INIT_COMMAND_STARTED,                    -- dlcapi.h:847
        LLC_STATUS_TOO_MANY_USERS,                          -- dlcapi.h:848
        LLC_STATUS_CANCELLED_BY_SYSTEM_ACTION,              -- dlcapi.h:849
        LLC_STATUS_DIR_STATIONS_NOT_AVAILABLE,              -- dlcapi.h:850
        LLC_STATUS_NO_GDT_SELECTORS,                        -- dlcapi.h:851
        LLC_STATUS_MEMORY_LOCK_FAILED,                      -- dlcapi.h:852
        LLC_STATUS_INVALID_BUFFER_ADDRESS,                  -- dlcapi.h:859
        LLC_STATUS_BUFFER_ALREADY_RELEASED,                 -- dlcapi.h:860
        LLC_STATUS_BIND_ERROR,                              -- dlcapi.h:861
        LLC_STATUS_INVALID_VERSION,                         -- dlcapi.h:862
        LLC_STATUS_NT_ERROR_STATUS,                         -- dlcapi.h:863
        LLC_STATUS_PENDING                                  -- dlcapi.h:865
    );
    for LLC_STATUS use (                                    -- dlcapi.h:790
        LLC_STATUS_SUCCESS => 0,                            -- dlcapi.h:791
        LLC_STATUS_INVALID_COMMAND => 1,                    -- dlcapi.h:792
        LLC_STATUS_DUPLICATE_COMMAND => 2,                  -- dlcapi.h:793
        LLC_STATUS_ADAPTER_OPEN => 3,                       -- dlcapi.h:794
        LLC_STATUS_ADAPTER_CLOSED => 4,                     -- dlcapi.h:795
        LLC_STATUS_PARAMETER_MISSING => 5,                  -- dlcapi.h:796
        LLC_STATUS_INVALID_OPTION => 6,                     -- dlcapi.h:797
        LLC_STATUS_COMMAND_CANCELLED_FAILURE => 7,          -- dlcapi.h:798
        LLC_STATUS_ACCESS_DENIED => 8,                      -- dlcapi.h:799
        LLC_STATUS_ADAPTER_NOT_INITIALIZED => 9,            -- dlcapi.h:800
        LLC_STATUS_CANCELLED_BY_USER => 10,                 -- dlcapi.h:801
        LLC_STATUS_COMMAND_CANCELLED_CLOSED => 11,          -- dlcapi.h:802
        LLC_STATUS_SUCCESS_NOT_OPEN => 12,                  -- dlcapi.h:803
        LLC_STATUS_TIMER_ERROR => 17,                       -- dlcapi.h:804
        LLC_STATUS_NO_MEMORY => 18,                         -- dlcapi.h:805
        LLC_STATUS_INVALID_LOG_ID => 19,                    -- dlcapi.h:806
        LLC_STATUS_LOST_LOG_DATA => 21,                     -- dlcapi.h:807
        LLC_STATUS_BUFFER_SIZE_EXCEEDED => 22,              -- dlcapi.h:808
        LLC_STATUS_INVALID_BUFFER_LENGTH => 24,             -- dlcapi.h:809
        LLC_STATUS_INADEQUATE_BUFFERS => 25,                -- dlcapi.h:810
        LLC_STATUS_USER_LENGTH_TOO_LARGE => 26,             -- dlcapi.h:811
        LLC_STATUS_INVALID_PARAMETER_TABLE => 27,           -- dlcapi.h:812
        LLC_STATUS_INVALID_POINTER_IN_CCB => 28,            -- dlcapi.h:813
        LLC_STATUS_INVALID_ADAPTER => 29,                   -- dlcapi.h:814
        LLC_STATUS_LOST_DATA_NO_BUFFERS => 32,              -- dlcapi.h:815
        LLC_STATUS_LOST_DATA_INADEQUATE_SPACE => 33,        -- dlcapi.h:816
        LLC_STATUS_TRANSMIT_ERROR_FS => 34,                 -- dlcapi.h:817
        LLC_STATUS_TRANSMIT_ERROR => 35,                    -- dlcapi.h:818
        LLC_STATUS_UNAUTHORIZED_MAC => 36,                  -- dlcapi.h:819
        LLC_STATUS_MAX_COMMANDS_EXCEEDED => 37,             -- dlcapi.h:820
        LLC_STATUS_LINK_NOT_TRANSMITTING => 39,             -- dlcapi.h:821
        LLC_STATUS_INVALID_FRAME_LENGTH => 40,              -- dlcapi.h:822
        LLC_STATUS_INADEQUATE_RECEIVE => 48,                -- dlcapi.h:823
        LLC_STATUS_INVALID_NODE_ADDRESS => 50,              -- dlcapi.h:824
        LLC_STATUS_INVALID_RCV_BUFFER_LENGTH => 51,         -- dlcapi.h:825
        LLC_STATUS_INVALID_XMIT_BUFFER_LENGTH => 52,        -- dlcapi.h:826
        LLC_STATUS_INVALID_STATION_ID => 64,                -- dlcapi.h:827
        LLC_STATUS_LINK_PROTOCOL_ERROR => 65,               -- dlcapi.h:828
        LLC_STATUS_PARMETERS_EXCEEDED_MAX => 66,            -- dlcapi.h:829
        LLC_STATUS_INVALID_SAP_VALUE => 67,                 -- dlcapi.h:830
        LLC_STATUS_INVALID_ROUTING_INFO => 68,              -- dlcapi.h:831
        LLC_STATUS_RESOURCES_NOT_AVAILABLE => 70,           -- dlcapi.h:832
        LLC_STATUS_LINK_STATIONS_OPEN => 71,                -- dlcapi.h:833
        LLC_STATUS_INCOMPATIBLE_COMMANDS => 74,             -- dlcapi.h:834
        LLC_STATUS_OUTSTANDING_COMMANDS => 76,              -- dlcapi.h:835
        LLC_STATUS_CONNECT_FAILED => 77,                    -- dlcapi.h:836
        LLC_STATUS_INVALID_REMOTE_ADDRESS => 79,            -- dlcapi.h:837
        LLC_STATUS_CCB_POINTER_FIELD => 80,                 -- dlcapi.h:838
        LLC_STATUS_INVALID_APPLICATION_ID => 82,            -- dlcapi.h:839
        LLC_STATUS_NO_SYSTEM_PROCESS => 86,                 -- dlcapi.h:840
        LLC_STATUS_INADEQUATE_LINKS => 87,                  -- dlcapi.h:841
        LLC_STATUS_INVALID_PARAMETER_1 => 88,               -- dlcapi.h:842
        LLC_STATUS_DIRECT_STATIONS_NOT_ASSIGNED => 92,      -- dlcapi.h:843
        LLC_STATUS_DEVICE_DRIVER_NOT_INSTALLED => 93,       -- dlcapi.h:844
        LLC_STATUS_ADAPTER_NOT_INSTALLED => 94,             -- dlcapi.h:845
        LLC_STATUS_CHAINED_DIFFERENT_ADAPTERS => 95,        -- dlcapi.h:846
        LLC_STATUS_INIT_COMMAND_STARTED => 96,              -- dlcapi.h:847
        LLC_STATUS_TOO_MANY_USERS => 97,                    -- dlcapi.h:848
        LLC_STATUS_CANCELLED_BY_SYSTEM_ACTION => 98,        -- dlcapi.h:849
        LLC_STATUS_DIR_STATIONS_NOT_AVAILABLE => 99,        -- dlcapi.h:850
        LLC_STATUS_NO_GDT_SELECTORS => 101,                 -- dlcapi.h:851
        LLC_STATUS_MEMORY_LOCK_FAILED => 105,               -- dlcapi.h:852
        LLC_STATUS_INVALID_BUFFER_ADDRESS => 128,           -- dlcapi.h:859
        LLC_STATUS_BUFFER_ALREADY_RELEASED => 129,          -- dlcapi.h:860
        LLC_STATUS_BIND_ERROR => 160,                       -- dlcapi.h:861
        LLC_STATUS_INVALID_VERSION => 161,                  -- dlcapi.h:862
        LLC_STATUS_NT_ERROR_STATUS => 162,                  -- dlcapi.h:863
        LLC_STATUS_PENDING => 255                           -- dlcapi.h:865
    );
    for LLC_STATUS'size use 32;                             -- dlcapi.h:790

    type ACSLAN_STATUS is (                                 -- dlcapi.h:881
        ACSLAN_STATUS_COMMAND_ACCEPTED,                     -- dlcapi.h:874
        ACSLAN_STATUS_INVALID_CCB_POINTER,                  -- dlcapi.h:875
        ACSLAN_STATUS_CCB_IN_ERROR,                         -- dlcapi.h:876
        ACSLAN_STATUS_CHAINED_CCB_IN_ERROR,                 -- dlcapi.h:877
        ACSLAN_STATUS_SYSTEM_ERROR,                         -- dlcapi.h:878
        ACSLAN_STATUS_SYSTEM_STATUS,                        -- dlcapi.h:879
        ACSLAN_STATUS_INVALID_COMMAND                       -- dlcapi.h:881
    );
    for ACSLAN_STATUS'size use 32;                          -- dlcapi.h:881

    type struct_anonymous0_t;                               -- dlcapi.h:91
    type struct_anonymous1_t;                               -- dlcapi.h:96
    type CCB_PARMS;                                         -- dlcapi.h:102
    type LLC_CCB;                                           -- dlcapi.h:113
    type LLC_NEXT_BUFFER;                                   -- dlcapi.h:135
    type LLC_NOT_CONTIGUOUS_BUFFER;                         -- dlcapi.h:155
    type LLC_CONTIGUOUS_BUFFER;                             -- dlcapi.h:170
    type LlcNextBuffer;                                     -- dlcapi.h:182
    type struct_anonymous6_t;                               -- dlcapi.h:192
    type struct_anonymous7_t;                               -- dlcapi.h:199
    type LLC_XMIT_BUFFER;                                   -- dlcapi.h:207
    type LLC_BUFFER_CREATE_PARMS;                           -- dlcapi.h:230
    type LLC_BUFFER_FREE_PARMS;                             -- dlcapi.h:237
    type LLC_BUFFER_GET_PARMS;                              -- dlcapi.h:257
    type LLC_DLC_CONNECT_PARMS;                             -- dlcapi.h:267
    type LLC_DLC_MODIFY_PARMS;                              -- dlcapi.h:293
    type LLC_DLC_OPEN_SAP_PARMS;                            -- dlcapi.h:322
    type LLC_DLC_OPEN_STATION_PARMS;                        -- dlcapi.h:338
    type LLC_DLC_REALLOCATE_PARMS;                          -- dlcapi.h:351
    type LLC_DLC_SET_THRESHOLD_PARMS;                       -- dlcapi.h:357
    type LLC_TRACE_INITIALIZE_PARMS;                        -- dlcapi.h:363
    type DLC_SAP_LOG;                                       -- dlcapi.h:374
    type DLC_LINK_LOG;                                      -- dlcapi.h:391
    type LLC_DLC_LOG_BUFFER;                                -- dlcapi.h:396
    type LLC_DLC_STATISTICS_PARMS;                          -- dlcapi.h:404
    type LLC_DIR_INITIALIZE_PARMS;                          -- dlcapi.h:409
    type LLC_ADAPTER_OPEN_PARMS;                            -- dlcapi.h:424
    type LLC_DLC_PARMS;                                     -- dlcapi.h:437
    type LLC_EXTENDED_ADAPTER_PARMS;                        -- dlcapi.h:457
    type LLC_DIR_OPEN_ADAPTER_PARMS;                        -- dlcapi.h:464
    type LLC_DIR_MULTICAST_ADDRESS;                         -- dlcapi.h:468
    type LLC_DIR_OPEN_DIRECT_PARMS;                         -- dlcapi.h:479
    type LLC_ADAPTER_LOG_TR;                                -- dlcapi.h:496
    type LLC_ADAPTER_LOG_ETH;                               -- dlcapi.h:508
    type LLC_ADAPTER_LOG;                                   -- dlcapi.h:513
    type LLC_DIRECT_LOG;                                    -- dlcapi.h:521
    type struct_anonymous36_t;                              -- dlcapi.h:530
    type LLC_DIR_READ_LOG_BUFFER;                           -- dlcapi.h:532
    type LLC_DIR_READ_LOG_PARMS;                            -- dlcapi.h:543
    type LLC_DIR_SET_EFLAG_PARMS;                           -- dlcapi.h:550
    type LLC_DIR_STATUS_PARMS;                              -- dlcapi.h:572
    type struct_anonymous41_t;                              -- dlcapi.h:625
    type struct_anonymous43_t;                              -- dlcapi.h:636
    type union_anonymous44_t;                               -- dlcapi.h:638
    type LLC_READ_PARMS;                                    -- dlcapi.h:640
    type LLC_READ_COMMAND;                                  -- dlcapi.h:653
    type LLC_RECEIVE_PARMS;                                 -- dlcapi.h:686
    type LLC_TRANSMIT_PARMS;                                -- dlcapi.h:703
    type LLC_TRANSMIT_DESCRIPTOR;                           -- dlcapi.h:713
    type LLC_TRANSMIT2_COMMAND;                             -- dlcapi.h:749
    type LLC_PARMS;                                         -- dlcapi.h:76
    type LLC_BUFFER;                                        -- dlcapi.h:126

    type PLLC_PARMS is access all LLC_PARMS;                -- dlcapi.h:77
    type PLLC_CCB is access all LLC_CCB;                    -- dlcapi.h:120
    type PLLC_BUFFER is access all LLC_BUFFER;              -- dlcapi.h:127
    type PLLC_XMIT_BUFFER is access all LLC_XMIT_BUFFER;    -- dlcapi.h:208
    type PLLC_BUFFER_CREATE_PARMS is access all LLC_BUFFER_CREATE_PARMS;
                                                            -- dlcapi.h:230
    type PLLC_BUFFER_FREE_PARMS is access all LLC_BUFFER_FREE_PARMS;
                                                            -- dlcapi.h:237
    type PLLC_BUFFER_GET_PARMS is access all LLC_BUFFER_GET_PARMS;
                                                            -- dlcapi.h:257
    type PLLC_DLC_CONNECT_PARMS is access all LLC_DLC_CONNECT_PARMS;
                                                            -- dlcapi.h:267
    type PLLC_DLC_MODIFY_PARMS is access all LLC_DLC_MODIFY_PARMS;
                                                            -- dlcapi.h:293
    type PLLC_DLC_OPEN_SAP_PARMS is access all LLC_DLC_OPEN_SAP_PARMS;
                                                            -- dlcapi.h:322
    type PLLC_DLC_OPEN_STATION_PARMS is access all LLC_DLC_OPEN_STATION_PARMS;
                                                            -- dlcapi.h:338
    type PLLC_DLC_REALLOCATE_PARMS is access all LLC_DLC_REALLOCATE_PARMS;
                                                            -- dlcapi.h:351
    type PLLC_DLC_SET_THRESHOLD_PARMS is access all LLC_DLC_SET_THRESHOLD_PARMS;
                                                            -- dlcapi.h:357
    type PLLC_TRACE_INITIALIZE_PARMS is access all LLC_TRACE_INITIALIZE_PARMS;
                                                            -- dlcapi.h:363
    type PDLC_SAP_LOG is access all DLC_SAP_LOG;            -- dlcapi.h:374
    type PDLC_LINK_LOG is access all DLC_LINK_LOG;          -- dlcapi.h:391
    type PLLC_DLC_LOG_BUFFER is access all LLC_DLC_LOG_BUFFER;
                                                            -- dlcapi.h:396
    type PLLC_DLC_STATISTICS_PARMS is access all LLC_DLC_STATISTICS_PARMS;
                                                            -- dlcapi.h:404
    type PLLC_DIR_INITIALIZE_PARMS is access all LLC_DIR_INITIALIZE_PARMS;
                                                            -- dlcapi.h:409
    type PLLC_ADAPTER_OPEN_PARMS is access all LLC_ADAPTER_OPEN_PARMS;
                                                            -- dlcapi.h:424
    type PLLC_DLC_PARMS is access all LLC_DLC_PARMS;        -- dlcapi.h:437
    type PLLC_ETHERNET_TYPE is access all LLC_ETHERNET_TYPE;-- dlcapi.h:451

    type PLLC_EXTENDED_ADAPTER_PARMS is access all LLC_EXTENDED_ADAPTER_PARMS;
                                                            -- dlcapi.h:457
    type PLLC_DIR_OPEN_ADAPTER_PARMS is access all LLC_DIR_OPEN_ADAPTER_PARMS;
                                                            -- dlcapi.h:464
    type PLLC_DIR_MULTICAST_ADDRESS is access all LLC_DIR_MULTICAST_ADDRESS;
                                                            -- dlcapi.h:468
    type PLLC_DIR_OPEN_DIRECT_PARMS is access all LLC_DIR_OPEN_DIRECT_PARMS;
                                                            -- dlcapi.h:479
    type PLLC_ADAPTER_LOG_TR is access all LLC_ADAPTER_LOG_TR;
                                                            -- dlcapi.h:496
    type PLLC_ADAPTER_LOG_ETH is access all LLC_ADAPTER_LOG_ETH;
                                                            -- dlcapi.h:508
    type PLLC_ADAPTER_LOG is access all LLC_ADAPTER_LOG;    -- dlcapi.h:513
    type PLLC_DIRECT_LOG is access all LLC_DIRECT_LOG;      -- dlcapi.h:521
    type PLLC_DIR_READ_LOG_BUFFER is access all LLC_DIR_READ_LOG_BUFFER;
                                                            -- dlcapi.h:532
    type PLLC_DIR_READ_LOG_PARMS is access all LLC_DIR_READ_LOG_PARMS;
                                                            -- dlcapi.h:543
    type PLLC_DIR_SET_EFLAG_PARMS is access all LLC_DIR_SET_EFLAG_PARMS;
                                                            -- dlcapi.h:550
    type PLLC_DIR_STATUS_PARMS is access all LLC_DIR_STATUS_PARMS;
                                                            -- dlcapi.h:572
    type PLLC_READ_PARMS is access all LLC_READ_PARMS;      -- dlcapi.h:640
    type PLLC_READ_COMMAND is access all LLC_READ_COMMAND;  -- dlcapi.h:653
    type PLLC_RECEIVE_PARMS is access all LLC_RECEIVE_PARMS;-- dlcapi.h:686
    type PLLC_TRANSMIT_PARMS is access all LLC_TRANSMIT_PARMS;
                                                            -- dlcapi.h:703
    type PLLC_TRANSMIT_DESCRIPTOR is access all LLC_TRANSMIT_DESCRIPTOR;
                                                            -- dlcapi.h:713
    type PLLC_TRANSMIT2_COMMAND is access all LLC_TRANSMIT2_COMMAND;
                                                            -- dlcapi.h:749

    type struct_anonymous0_t is                             -- dlcapi.h:91
        record
            usStationId: Win32.USHORT;                      -- dlcapi.h:89
            usParameter: Win32.USHORT;                      -- dlcapi.h:90
        end record;

    type struct_anonymous1_t is                             -- dlcapi.h:96
        record
            usParameter0: Win32.USHORT;                     -- dlcapi.h:94
            usParameter1: Win32.USHORT;                     -- dlcapi.h:95
        end record;

    type CCB_PARMS_kind is (                                -- dlcapi.h:102
        pParameterTable_kind,
        dlc_kind,
        dir_kind,
        auchBuffer_kind,
        ulParameter_kind
    );

    type CCB_PARMS (
        Which: CCB_PARMS_kind := pParameterTable_kind) is
                                                            -- dlcapi.h:102
        record
            case Which is
                when pParameterTable_kind =>
                    pParameterTable: PLLC_PARMS;            -- dlcapi.h:86
                when dlc_kind =>
                    dlc    : struct_anonymous0_t;           -- dlcapi.h:91
                when dir_kind =>
                    dir    : struct_anonymous1_t;           -- dlcapi.h:96
                when auchBuffer_kind =>
                    auchBuffer: Win32.BYTE_Array(0..3);     -- dlcapi.h:98
                when ulParameter_kind =>
                    ulParameter: Win32.ULONG;               -- dlcapi.h:100
            end case;
        end record;

    pragma Convention(c_pass_by_copy, CCB_PARMS);

    pragma Unchecked_Union(CCB_PARMS);

    type LLC_CCB is                                         -- dlcapi.h:113
        record
            uchAdapterNumber: Win32.UCHAR;                  -- dlcapi.h:109
            uchDlcCommand   : Win32.UCHAR;                  -- dlcapi.h:110
            uchDlcStatus    : Win32.UCHAR;                  -- dlcapi.h:111
            uchReserved1    : Win32.UCHAR;                  -- dlcapi.h:112
            pNext           : PLLC_CCB;                     -- dlcapi.h:113
            ulCompletionFlag: Win32.ULONG;                  -- dlcapi.h:114
            u               : CCB_PARMS;                    -- dlcapi.h:115
            hCompletionEvent: Win32.Winnt.HANDLE;           -- dlcapi.h:116
            uchReserved2    : Win32.UCHAR;                  -- dlcapi.h:117
            uchReadFlag     : Win32.UCHAR;                  -- dlcapi.h:118
            usReserved3     : Win32.USHORT;                 -- dlcapi.h:119
        end record;

    type LLC_NEXT_BUFFER is                                 -- dlcapi.h:135
        record
            pNextBuffer: PLLC_BUFFER;                       -- dlcapi.h:130
            cbFrame    : Win32.USHORT;                      -- dlcapi.h:131
            cbBuffer   : Win32.USHORT;                      -- dlcapi.h:132
            offUserData: Win32.USHORT;                      -- dlcapi.h:133
            cbUserData : Win32.USHORT;                      -- dlcapi.h:134
        end record;

    type LLC_NOT_CONTIGUOUS_BUFFER is                       -- dlcapi.h:155
        record
            pNextBuffer     : PLLC_BUFFER;                  -- dlcapi.h:138
            cbFrame         : Win32.USHORT;                 -- dlcapi.h:139
            cbBuffer        : Win32.USHORT;                 -- dlcapi.h:140
            offUserData     : Win32.USHORT;                 -- dlcapi.h:141
            cbUserData      : Win32.USHORT;                 -- dlcapi.h:142
            usStationId     : Win32.USHORT;                 -- dlcapi.h:143
            uchOptions      : Win32.UCHAR;                  -- dlcapi.h:144
            uchMsgType      : Win32.UCHAR;                  -- dlcapi.h:145
            cBuffersLeft    : Win32.USHORT;                 -- dlcapi.h:146
            uchRcvFS        : Win32.UCHAR;                  -- dlcapi.h:147
            uchAdapterNumber: Win32.UCHAR;                  -- dlcapi.h:148
            pNextFrame      : PLLC_BUFFER;                  -- dlcapi.h:149
            cbLanHeader     : Win32.UCHAR;                  -- dlcapi.h:150
            cbDlcHeader     : Win32.UCHAR;                  -- dlcapi.h:151
            auchLanHeader   : Win32.BYTE_Array(0..31);      -- dlcapi.h:152
            auchDlcHeader   : Win32.BYTE_Array(0..3);       -- dlcapi.h:153
            usPadding       : Win32.USHORT;                 -- dlcapi.h:154
        end record;

    type LLC_CONTIGUOUS_BUFFER is                           -- dlcapi.h:170
        record
            pNextBuffer     : PLLC_BUFFER;                  -- dlcapi.h:158
            cbFrame         : Win32.USHORT;                 -- dlcapi.h:159
            cbBuffer        : Win32.USHORT;                 -- dlcapi.h:160
            offUserData     : Win32.USHORT;                 -- dlcapi.h:161
            cbUserData      : Win32.USHORT;                 -- dlcapi.h:162
            usStationId     : Win32.USHORT;                 -- dlcapi.h:163
            uchOptions      : Win32.UCHAR;                  -- dlcapi.h:164
            uchMsgType      : Win32.UCHAR;                  -- dlcapi.h:165
            cBuffersLeft    : Win32.USHORT;                 -- dlcapi.h:166
            uchRcvFS        : Win32.UCHAR;                  -- dlcapi.h:167
            uchAdapterNumber: Win32.UCHAR;                  -- dlcapi.h:168
            pNextFrame      : PLLC_BUFFER;                  -- dlcapi.h:169
        end record;

    type LlcNextBuffer is                                   -- dlcapi.h:182
        record
            Header  : LLC_NEXT_BUFFER;                      -- dlcapi.h:183
            auchData: Win32.UCHAR_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- dlcapi.h:184
        end record;

    type struct_anonymous6_t is                             -- dlcapi.h:192
        record
            Header  : LLC_NOT_CONTIGUOUS_BUFFER;            -- dlcapi.h:190
            auchData: Win32.UCHAR_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- dlcapi.h:191
        end record;

    type struct_anonymous7_t is                             -- dlcapi.h:199
        record
            Header  : LLC_CONTIGUOUS_BUFFER;                -- dlcapi.h:197
            auchData: Win32.UCHAR_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- dlcapi.h:198
        end record;

    type LLC_XMIT_BUFFER is                                 -- dlcapi.h:207
        record
            pNext      : PLLC_XMIT_BUFFER;                  -- dlcapi.h:211
            usReserved1: Win32.USHORT;                      -- dlcapi.h:212
            cbBuffer   : Win32.USHORT;                      -- dlcapi.h:213
            usReserved2: Win32.USHORT;                      -- dlcapi.h:214
            cbUserData : Win32.USHORT;                      -- dlcapi.h:215
            auchData   : Win32.UCHAR_Array(0..Win32.ANYSIZE_ARRAY);
                                                            -- dlcapi.h:216
        end record;

    type LLC_BUFFER_CREATE_PARMS is                         -- dlcapi.h:230
        record
            hBufferPool           : Win32.Winnt.HANDLE;     -- dlcapi.h:226
            pBuffer               : Win32.PVOID;            -- dlcapi.h:227
            cbBufferSize          : Win32.ULONG;            -- dlcapi.h:228
            cbMinimumSizeThreshold: Win32.ULONG;            -- dlcapi.h:229
        end record;

    type LLC_BUFFER_FREE_PARMS is                           -- dlcapi.h:237
        record
            usReserved1 : Win32.USHORT;                     -- dlcapi.h:233
            cBuffersLeft: Win32.USHORT;                     -- dlcapi.h:234
            ulReserved  : Win32.ULONG;                      -- dlcapi.h:235
            pFirstBuffer: PLLC_XMIT_BUFFER;                 -- dlcapi.h:236
        end record;

    type LLC_BUFFER_GET_PARMS is                            -- dlcapi.h:257
        record
            usReserved1  : Win32.USHORT;                    -- dlcapi.h:240
            cBuffersLeft : Win32.USHORT;                    -- dlcapi.h:241
            cBuffersToGet: Win32.USHORT;                    -- dlcapi.h:248
            cbBufferSize : Win32.USHORT;                    -- dlcapi.h:255
            pFirstBuffer : PLLC_XMIT_BUFFER;                -- dlcapi.h:256
        end record;

    type LLC_DLC_CONNECT_PARMS is                           -- dlcapi.h:267
        record
            usStationId : Win32.USHORT;                     -- dlcapi.h:264
            usReserved  : Win32.USHORT;                     -- dlcapi.h:265
            pRoutingInfo: Win32.PUCHAR;                     -- dlcapi.h:266
        end record;

    type LLC_DLC_MODIFY_PARMS is                            -- dlcapi.h:293
        record
            usRes               : Win32.USHORT;             -- dlcapi.h:278
            usStationId         : Win32.USHORT;             -- dlcapi.h:279
            uchT1               : Win32.UCHAR;              -- dlcapi.h:280
            uchT2               : Win32.UCHAR;              -- dlcapi.h:281
            uchTi               : Win32.UCHAR;              -- dlcapi.h:282
            uchMaxOut           : Win32.UCHAR;              -- dlcapi.h:283
            uchMaxIn            : Win32.UCHAR;              -- dlcapi.h:284
            uchMaxOutIncr       : Win32.UCHAR;              -- dlcapi.h:285
            uchMaxRetryCnt      : Win32.UCHAR;              -- dlcapi.h:286
            uchReserved1        : Win32.UCHAR;              -- dlcapi.h:287
            usMaxInfoFieldLength: Win32.USHORT;             -- dlcapi.h:288
            uchAccessPriority   : Win32.UCHAR;              -- dlcapi.h:289
            auchReserved3       : Win32.BYTE_Array(0..3);   -- dlcapi.h:290
            cGroupCount         : Win32.UCHAR;              -- dlcapi.h:291
            pGroupList          : Win32.PUCHAR;             -- dlcapi.h:292
        end record;

    type LLC_DLC_OPEN_SAP_PARMS is                          -- dlcapi.h:322
        record
            usStationId       : Win32.USHORT;               -- dlcapi.h:302
            usUserStatValue   : Win32.USHORT;               -- dlcapi.h:303
            uchT1             : Win32.UCHAR;                -- dlcapi.h:304
            uchT2             : Win32.UCHAR;                -- dlcapi.h:305
            uchTi             : Win32.UCHAR;                -- dlcapi.h:306
            uchMaxOut         : Win32.UCHAR;                -- dlcapi.h:307
            uchMaxIn          : Win32.UCHAR;                -- dlcapi.h:308
            uchMaxOutIncr     : Win32.UCHAR;                -- dlcapi.h:309
            uchMaxRetryCnt    : Win32.UCHAR;                -- dlcapi.h:310
            uchMaxMembers     : Win32.UCHAR;                -- dlcapi.h:311
            usMaxI_Field      : Win32.USHORT;               -- dlcapi.h:312
            uchSapValue       : Win32.UCHAR;                -- dlcapi.h:313
            uchOptionsPriority: Win32.UCHAR;                -- dlcapi.h:314
            uchcStationCount  : Win32.UCHAR;                -- dlcapi.h:315
            uchReserved2      : Win32.BYTE_Array(0..1);     -- dlcapi.h:316
            cGroupCount       : Win32.UCHAR;                -- dlcapi.h:317
            pGroupList        : Win32.PUCHAR;               -- dlcapi.h:318
            DlcStatusFlags    : Win32.ULONG;                -- dlcapi.h:319
            uchReserved3      : Win32.BYTE_Array(0..7);     -- dlcapi.h:320
            cLinkStationsAvail: Win32.UCHAR;                -- dlcapi.h:321
        end record;

    type LLC_DLC_OPEN_STATION_PARMS is                      -- dlcapi.h:338
        record
            usSapStationId    : Win32.USHORT;               -- dlcapi.h:325
            usLinkStationId   : Win32.USHORT;               -- dlcapi.h:326
            uchT1             : Win32.UCHAR;                -- dlcapi.h:327
            uchT2             : Win32.UCHAR;                -- dlcapi.h:328
            uchTi             : Win32.UCHAR;                -- dlcapi.h:329
            uchMaxOut         : Win32.UCHAR;                -- dlcapi.h:330
            uchMaxIn          : Win32.UCHAR;                -- dlcapi.h:331
            uchMaxOutIncr     : Win32.UCHAR;                -- dlcapi.h:332
            uchMaxRetryCnt    : Win32.UCHAR;                -- dlcapi.h:333
            uchRemoteSap      : Win32.UCHAR;                -- dlcapi.h:334
            usMaxI_Field      : Win32.USHORT;               -- dlcapi.h:335
            uchAccessPriority : Win32.UCHAR;                -- dlcapi.h:336
            pRemoteNodeAddress: Win32.PVOID;                -- dlcapi.h:337
        end record;

    type LLC_DLC_REALLOCATE_PARMS is                        -- dlcapi.h:351
        record
            usStationId              : Win32.USHORT;        -- dlcapi.h:344
            uchOption                : Win32.UCHAR;         -- dlcapi.h:345
            uchStationCount          : Win32.UCHAR;         -- dlcapi.h:346
            uchStationsAvailOnAdapter: Win32.UCHAR;         -- dlcapi.h:347
            uchStationsAvailOnSap    : Win32.UCHAR;         -- dlcapi.h:348
            uchTotalStationsOnAdapter: Win32.UCHAR;         -- dlcapi.h:349
            uchTotalStationsOnSap    : Win32.UCHAR;         -- dlcapi.h:350
        end record;

    type LLC_DLC_SET_THRESHOLD_PARMS is                     -- dlcapi.h:357
        record
            usStationId     : Win32.USHORT;                 -- dlcapi.h:354
            cBufferThreshold: Win32.USHORT;                 -- dlcapi.h:355
            AlertEvent      : Win32.PVOID;                  -- dlcapi.h:356
        end record;

    type LLC_TRACE_INITIALIZE_PARMS is                      -- dlcapi.h:363
        record
            TraceBuffer    : Win32.PVOID;                   -- dlcapi.h:360
            TraceBufferSize: Win32.ULONG;                   -- dlcapi.h:361
            TraceFlags     : Win32.ULONG;                   -- dlcapi.h:362
        end record;

    type DLC_SAP_LOG is                                     -- dlcapi.h:374
        record
            cTransmittedFrames: Win32.ULONG;                -- dlcapi.h:369
            cReceivedFrames   : Win32.ULONG;                -- dlcapi.h:370
            cDiscardedFrames  : Win32.ULONG;                -- dlcapi.h:371
            cDataLost         : Win32.ULONG;                -- dlcapi.h:372
            cBuffersAvailable : Win32.USHORT;               -- dlcapi.h:373
        end record;

    type DLC_LINK_LOG is                                    -- dlcapi.h:391
        record
            cI_FramesTransmitted      : Win32.USHORT;       -- dlcapi.h:377
            cI_FramesReceived         : Win32.USHORT;       -- dlcapi.h:378
            cI_FrameReceiveErrors     : Win32.UCHAR;        -- dlcapi.h:379
            cI_FrameTransmissionErrors: Win32.UCHAR;        -- dlcapi.h:380
            cT1_ExpirationCount       : Win32.USHORT;       -- dlcapi.h:381
            uchLastCmdRespReceived    : Win32.UCHAR;        -- dlcapi.h:382
            uchLastCmdRespTransmitted : Win32.UCHAR;        -- dlcapi.h:383
            uchPrimaryState           : Win32.UCHAR;        -- dlcapi.h:384
            uchSecondaryState         : Win32.UCHAR;        -- dlcapi.h:385
            uchSendStateVariable      : Win32.UCHAR;        -- dlcapi.h:386
            uchReceiveStateVariable   : Win32.UCHAR;        -- dlcapi.h:387
            uchLastNr                 : Win32.UCHAR;        -- dlcapi.h:388
            cbLanHeader               : Win32.UCHAR;        -- dlcapi.h:389
            auchLanHeader             : Win32.BYTE_Array(0..31);  
                                                            -- dlcapi.h:390
        end record;

    type LLC_DLC_LOG_BUFFER_kind is (                       -- dlcapi.h:396
        Sap_kind,
        Link_kind
    );

    type LLC_DLC_LOG_BUFFER (Which: LLC_DLC_LOG_BUFFER_kind := Link_kind) is
                                                            -- dlcapi.h:396
        record
            case Which is
                when Sap_kind =>
                    Sap: DLC_SAP_LOG;                       -- dlcapi.h:394
                when Link_kind =>
                    Link: DLC_LINK_LOG;                     -- dlcapi.h:395
            end case;
        end record;

    pragma Unchecked_Union(LLC_DLC_LOG_BUFFER);

    type LLC_DLC_STATISTICS_PARMS is                        -- dlcapi.h:404
        record
            usStationId   : Win32.USHORT;                   -- dlcapi.h:399
            cbLogBufSize  : Win32.USHORT;                   -- dlcapi.h:400
            pLogBuf       : PLLC_DLC_LOG_BUFFER;            -- dlcapi.h:401
            usActLogLength: Win32.USHORT;                   -- dlcapi.h:402
            uchOptions    : Win32.UCHAR;                    -- dlcapi.h:403
        end record;

    type LLC_DIR_INITIALIZE_PARMS is                        -- dlcapi.h:409
        record
            usBringUps: Win32.USHORT;                       -- dlcapi.h:407
            Reserved  : Win32.UCHAR_Array(0..29);           -- dlcapi.h:408
        end record;

    type LLC_ADAPTER_OPEN_PARMS is                          -- dlcapi.h:424
        record
            usOpenErrorCode      : Win32.USHORT;            -- dlcapi.h:412
            usOpenOptions        : Win32.USHORT;            -- dlcapi.h:413
            auchNodeAddress      : Win32.BYTE_Array(0..5);  -- dlcapi.h:414
            auchGroupAddress     : Win32.BYTE_Array(0..3);  -- dlcapi.h:415
            auchFunctionalAddress: Win32.BYTE_Array(0..3);  -- dlcapi.h:416
            usReserved1          : Win32.USHORT;            -- dlcapi.h:417
            usReserved2          : Win32.USHORT;            -- dlcapi.h:418
            usMaxFrameSize       : Win32.USHORT;            -- dlcapi.h:419
            usReserved3          : Win32.WORD_Array(0..3);  -- dlcapi.h:420
            usBringUps           : Win32.USHORT;            -- dlcapi.h:421
            InitWarnings         : Win32.USHORT;            -- dlcapi.h:422
            usReserved4          : Win32.WORD_Array(0..2);  -- dlcapi.h:423
        end record;

    type LLC_DLC_PARMS is                                   -- dlcapi.h:437
        record
            uchDlcMaxSaps        : Win32.UCHAR;             -- dlcapi.h:427
            uchDlcMaxStations    : Win32.UCHAR;             -- dlcapi.h:428
            uchDlcMaxGroupSaps   : Win32.UCHAR;             -- dlcapi.h:429
            uchDlcMaxGroupMembers: Win32.UCHAR;             -- dlcapi.h:430
            uchT1_TickOne        : Win32.UCHAR;             -- dlcapi.h:431
            uchT2_TickOne        : Win32.UCHAR;             -- dlcapi.h:432
            uchTi_TickOne        : Win32.UCHAR;             -- dlcapi.h:433
            uchT1_TickTwo        : Win32.UCHAR;             -- dlcapi.h:434
            uchT2_TickTwo        : Win32.UCHAR;             -- dlcapi.h:435
            uchTi_TickTwo        : Win32.UCHAR;             -- dlcapi.h:436
        end record;

    type LLC_EXTENDED_ADAPTER_PARMS is                      -- dlcapi.h:457
        record
            hBufferPool        : Win32.PVOID;               -- dlcapi.h:454
            pSecurityDescriptor: Win32.PVOID;               -- dlcapi.h:455
            LlcEthernetType    : LLC_ETHERNET_TYPE;         -- dlcapi.h:456
        end record;

    type LLC_DIR_OPEN_ADAPTER_PARMS is                      -- dlcapi.h:464
        record
            pAdapterParms : PLLC_ADAPTER_OPEN_PARMS;        -- dlcapi.h:460
            pExtendedParms: PLLC_EXTENDED_ADAPTER_PARMS;    -- dlcapi.h:461
            pDlcParms     : PLLC_DLC_PARMS;                 -- dlcapi.h:462
            pReserved1    : Win32.PVOID;                    -- dlcapi.h:463
        end record;

    type LLC_DIR_MULTICAST_ADDRESS is                       -- dlcapi.h:468
        record
            auchMulticastAddress: Win32.UCHAR_Array(0..5);  -- dlcapi.h:467
        end record;

    type LLC_DIR_OPEN_DIRECT_PARMS is                       -- dlcapi.h:479
        record
            Reserved            : Win32.BYTE_Array(0..3);   -- dlcapi.h:473
            usOpenOptions       : Win32.USHORT;             -- dlcapi.h:474
            usEthernetType      : Win32.USHORT;             -- dlcapi.h:475
            ulProtocolTypeMask  : Win32.ULONG;              -- dlcapi.h:476
            ulProtocolTypeMatch : Win32.ULONG;              -- dlcapi.h:477
            usProtocolTypeOffset: Win32.USHORT;             -- dlcapi.h:478
        end record;

    type LLC_ADAPTER_LOG_TR is                              -- dlcapi.h:496
        record
            cLineError        : Win32.UCHAR;                -- dlcapi.h:482
            cInternalError    : Win32.UCHAR;                -- dlcapi.h:483
            cBurstError       : Win32.UCHAR;                -- dlcapi.h:484
            cAC_Error         : Win32.UCHAR;                -- dlcapi.h:485
            cAbortDelimiter   : Win32.UCHAR;                -- dlcapi.h:486
            uchReserved1      : Win32.UCHAR;                -- dlcapi.h:487
            cLostFrame        : Win32.UCHAR;                -- dlcapi.h:488
            cReceiveCongestion: Win32.UCHAR;                -- dlcapi.h:489
            cFrameCopiedError : Win32.UCHAR;                -- dlcapi.h:490
            cFrequencyError   : Win32.UCHAR;                -- dlcapi.h:491
            cTokenError       : Win32.UCHAR;                -- dlcapi.h:492
            uchReserved2      : Win32.UCHAR;                -- dlcapi.h:493
            uchReserved3      : Win32.UCHAR;                -- dlcapi.h:494
            uchReserved4      : Win32.UCHAR;                -- dlcapi.h:495
        end record;

    type LLC_ADAPTER_LOG_ETH is                             -- dlcapi.h:508
        record
            cCRC_Error        : Win32.UCHAR;                -- dlcapi.h:499
            uchReserved1      : Win32.UCHAR;                -- dlcapi.h:500
            cAlignmentError   : Win32.UCHAR;                -- dlcapi.h:501
            uchReserved2      : Win32.UCHAR;                -- dlcapi.h:502
            cTransmitError    : Win32.UCHAR;                -- dlcapi.h:503
            uchReserved3      : Win32.UCHAR;                -- dlcapi.h:504
            cCollisionError   : Win32.UCHAR;                -- dlcapi.h:505
            cReceiveCongestion: Win32.UCHAR;                -- dlcapi.h:506
            uchReserved       : Win32.UCHAR_Array(0..5);    -- dlcapi.h:507
        end record;

    type LLC_ADAPTER_LOG_kind is (                          -- dlcapi.h:513
        Tr_kind,
        Eth_kind
    );

    type LLC_ADAPTER_LOG (Which: LLC_ADAPTER_LOG_kind := Tr_kind) is
                                                            -- dlcapi.h:513
        record
            case Which is
                when Tr_kind =>
                    Tr: LLC_ADAPTER_LOG_TR;                 -- dlcapi.h:511
                when Eth_kind =>
                    Eth: LLC_ADAPTER_LOG_ETH;               -- dlcapi.h:512
            end case;
        end record;

    pragma Convention(c_pass_by_copy, LLC_ADAPTER_LOG);

    pragma Unchecked_Union(LLC_ADAPTER_LOG);

    type LLC_DIRECT_LOG is                                  -- dlcapi.h:521
        record
            cTransmittedFrames: Win32.ULONG;                -- dlcapi.h:516
            cReceivedFrames   : Win32.ULONG;                -- dlcapi.h:517
            cDiscardedFrames  : Win32.ULONG;                -- dlcapi.h:518
            cDataLost         : Win32.ULONG;                -- dlcapi.h:519
            cBuffersAvailable : Win32.USHORT;               -- dlcapi.h:520
        end record;

    type struct_anonymous36_t is                            -- dlcapi.h:530
        record
            Adapter: LLC_ADAPTER_LOG;                       -- dlcapi.h:528
            Dir    : LLC_DIRECT_LOG;                        -- dlcapi.h:529
        end record;

    type LLC_DIR_READ_LOG_BUFFER_kind is (                  -- dlcapi.h:532
        Adapter_kind,
        Dir_kind,
        both_kind
    );

    type LLC_DIR_READ_LOG_BUFFER (
            Which: LLC_DIR_READ_LOG_BUFFER_kind := both_kind) is
                                                            -- dlcapi.h:532
        record
            case Which is
                when Adapter_kind =>
                    Adapter: LLC_ADAPTER_LOG;               -- dlcapi.h:524
                when Dir_kind =>
                    Dir: LLC_DIRECT_LOG;                    -- dlcapi.h:525
                when both_kind =>
                    both: struct_anonymous36_t;             -- dlcapi.h:530
            end case;
        end record;

    pragma Unchecked_Union(LLC_DIR_READ_LOG_BUFFER);

    type LLC_DIR_READ_LOG_PARMS is                          -- dlcapi.h:543
        record
            usTypeId      : Win32.USHORT;                   -- dlcapi.h:539
            cbLogBuffer   : Win32.USHORT;                   -- dlcapi.h:540
            pLogBuffer    : PLLC_DIR_READ_LOG_BUFFER;       -- dlcapi.h:541
            cbActualLength: Win32.USHORT;                   -- dlcapi.h:542
        end record;

    type LLC_DIR_SET_EFLAG_PARMS is                         -- dlcapi.h:550
        record
            ulAdapterCheckFlag : Win32.ULONG;               -- dlcapi.h:546
            ulNetworkStatusFlag: Win32.ULONG;               -- dlcapi.h:547
            ulPcErrorFlag      : Win32.ULONG;               -- dlcapi.h:548
            ulSystemActionFlag : Win32.ULONG;               -- dlcapi.h:549
        end record;

    type LLC_DIR_STATUS_PARMS is                            -- dlcapi.h:572
        record
            auchPermanentAddress: Win32.UCHAR_Array(0..5);  -- dlcapi.h:556
            auchNodeAddress     : Win32.UCHAR_Array(0..5);  -- dlcapi.h:557
            auchGroupAddress    : Win32.UCHAR_Array(0..3);  -- dlcapi.h:558
            auchFunctAddr       : Win32.UCHAR_Array(0..3);  -- dlcapi.h:559
            uchMaxSap           : Win32.UCHAR;              -- dlcapi.h:560
            uchOpenSaps         : Win32.UCHAR;              -- dlcapi.h:561
            uchMaxStations      : Win32.UCHAR;              -- dlcapi.h:562
            uchOpenStation      : Win32.UCHAR;              -- dlcapi.h:563
            uchAvailStations    : Win32.UCHAR;              -- dlcapi.h:564
            uchAdapterConfig    : Win32.UCHAR;              -- dlcapi.h:565
            auchReserved1       : Win32.UCHAR_Array(0..10); -- dlcapi.h:566
            ulReserved1         : Win32.ULONG;              -- dlcapi.h:567
            ulReserved2         : Win32.ULONG;              -- dlcapi.h:568
            ulMaxFrameLength    : Win32.ULONG;              -- dlcapi.h:569
            usLastNetworkStatus : Win32.USHORT;             -- dlcapi.h:570
            usAdapterType       : Win32.USHORT;             -- dlcapi.h:571
        end record;

    type struct_anonymous41_t is                            -- dlcapi.h:625
        record
            usCcbCount          : Win32.USHORT;             -- dlcapi.h:617
            pCcbCompletionList  : PLLC_CCB;                 -- dlcapi.h:618
            usBufferCount       : Win32.USHORT;             -- dlcapi.h:619
            pFirstBuffer        : PLLC_BUFFER;              -- dlcapi.h:620
            usReceivedFrameCount: Win32.USHORT;             -- dlcapi.h:621
            pReceivedFrame      : PLLC_BUFFER;              -- dlcapi.h:622
            usEventErrorCode    : Win32.USHORT;             -- dlcapi.h:623
            usEventErrorData    : Win32.WORD_Array(0..2);   -- dlcapi.h:624
        end record;

    type struct_anonymous43_t is                            -- dlcapi.h:636
        record
            usStationId         : Win32.USHORT;             -- dlcapi.h:628
            usDlcStatusCode     : Win32.USHORT;             -- dlcapi.h:629
            uchFrmrData         : Win32.UCHAR_Array(0..4);  -- dlcapi.h:630
            uchAccessPritority  : Win32.UCHAR;              -- dlcapi.h:631
            uchRemoteNodeAddress: Win32.UCHAR_Array(0..5);  -- dlcapi.h:632
            uchRemoteSap        : Win32.UCHAR;              -- dlcapi.h:633
            uchReserved         : Win32.UCHAR;              -- dlcapi.h:634
            usUserStatusValue   : Win32.USHORT;             -- dlcapi.h:635
        end record;

    type union_anonymous44_t_kind is (                      -- dlcapi.h:638
        Event_kind,
        Status_kind
    );

    type union_anonymous44_t (Which: union_anonymous44_t_kind := Event_kind) is
                                                            -- dlcapi.h:638
        record
            case Which is
                when Event_kind =>
                    Event: struct_anonymous41_t;            -- dlcapi.h:625
                when Status_kind =>
                    Status: struct_anonymous43_t;           -- dlcapi.h:636
            end case;
        end record;

    pragma Unchecked_Union(union_anonymous44_t);

    type LLC_READ_PARMS is                                  -- dlcapi.h:640
        record
            usStationId       : Win32.USHORT;               -- dlcapi.h:607
            uchOptionIndicator: Win32.UCHAR;                -- dlcapi.h:608
            uchEventSet       : Win32.UCHAR;                -- dlcapi.h:609
            uchEvent          : Win32.UCHAR;                -- dlcapi.h:610
            uchCriticalSubset : Win32.UCHAR;                -- dlcapi.h:611
            ulNotificationFlag: Win32.ULONG;                -- dlcapi.h:612
            c_Type            : union_anonymous44_t;        -- dlcapi.h:638
        end record;

    type LLC_READ_COMMAND is                                -- dlcapi.h:653
        record
            Ccb  : LLC_CCB;                                 -- dlcapi.h:651
            Parms: LLC_READ_PARMS;                          -- dlcapi.h:652
        end record;

    type LLC_RECEIVE_PARMS is                               -- dlcapi.h:686
        record
            usStationId     : Win32.USHORT;                 -- dlcapi.h:679
            usUserLength    : Win32.USHORT;                 -- dlcapi.h:680
            ulReceiveFlag   : Win32.ULONG;                  -- dlcapi.h:681
            pFirstBuffer    : PLLC_BUFFER;                  -- dlcapi.h:682
            uchOptions      : Win32.UCHAR;                  -- dlcapi.h:683
            auchReserved1   : Win32.UCHAR_Array(0..2);      -- dlcapi.h:684
            uchRcvReadOption: Win32.UCHAR;                  -- dlcapi.h:685
        end record;

    type LLC_TRANSMIT_PARMS is                              -- dlcapi.h:703
        record
            usStationId      : Win32.USHORT;                -- dlcapi.h:693
            uchTransmitFs    : Win32.UCHAR;                 -- dlcapi.h:694
            uchRemoteSap     : Win32.UCHAR;                 -- dlcapi.h:695
            pXmitQueue1      : PLLC_XMIT_BUFFER;            -- dlcapi.h:696
            pXmitQueue2      : PLLC_XMIT_BUFFER;            -- dlcapi.h:697
            cbBuffer1        : Win32.USHORT;                -- dlcapi.h:698
            cbBuffer2        : Win32.USHORT;                -- dlcapi.h:699
            pBuffer1         : Win32.PVOID;                 -- dlcapi.h:700
            pBuffer2         : Win32.PVOID;                 -- dlcapi.h:701
            uchXmitReadOption: Win32.UCHAR;                 -- dlcapi.h:702
        end record;

    type LLC_TRANSMIT_DESCRIPTOR is                         -- dlcapi.h:713
        record
            eSegmentType  : Win32.UCHAR;                    -- dlcapi.h:709
            boolFreeBuffer: Win32.UCHAR;                    -- dlcapi.h:710
            cbBuffer      : Win32.USHORT;                   -- dlcapi.h:711
            pBuffer       : Win32.PVOID;                    -- dlcapi.h:712
        end record;

    type LLC_TRANSMIT_DESCRIPTOR_Array is                   -- dlcapi.h:748
        array(Natural range 0..Win32.ANYSIZE_ARRAY)
        of aliased LLC_TRANSMIT_DESCRIPTOR;

    type LLC_TRANSMIT2_COMMAND is                           -- dlcapi.h:749
        record
            Ccb              : LLC_CCB;                     -- dlcapi.h:741
            usStationId      : Win32.USHORT;                -- dlcapi.h:742
            usFrameType      : Win32.USHORT;                -- dlcapi.h:743
            uchRemoteSap     : Win32.UCHAR;                 -- dlcapi.h:744
            uchXmitReadOption: Win32.UCHAR;                 -- dlcapi.h:745
            Reserved2        : Win32.UCHAR_Array(0..2);     -- dlcapi.h:746
            cXmitBufferCount : Win32.ULONG;                 -- dlcapi.h:747
            aXmitBuffer      : LLC_TRANSMIT_DESCRIPTOR_Array;
                                                            -- dlcapi.h:748
        end record;

    type LLC_PARMS_kind is (                                -- dlcapi.h:76
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
        TraceInitialize_kind
    );

    type LLC_PARMS (Which: LLC_PARMS_kind := DirStatus_kind) is
                                                            -- dlcapi.h:76
        record
            case Which is
                when BufferFree_kind =>
                    BufferFree: LLC_BUFFER_FREE_PARMS;      -- dlcapi.h:763
                when BufferGet_kind =>
                    BufferGet: LLC_BUFFER_GET_PARMS;        -- dlcapi.h:764
                when DlcConnectStation_kind =>
                    DlcConnectStation: LLC_DLC_CONNECT_PARMS;
                                                            -- dlcapi.h:765
                when DlcModify_kind =>
                    DlcModify: LLC_DLC_MODIFY_PARMS;        -- dlcapi.h:766
                when DlcOpenSap_kind =>
                    DlcOpenSap: LLC_DLC_OPEN_SAP_PARMS;     -- dlcapi.h:767
                when DlcOpenStation_kind =>
                    DlcOpenStation: LLC_DLC_OPEN_STATION_PARMS;
                                                            -- dlcapi.h:768
                when DlcReallocate_kind =>
                    DlcReallocate: LLC_DLC_REALLOCATE_PARMS;-- dlcapi.h:769
                when DlcSetThreshold_kind =>
                    DlcSetThreshold: LLC_DLC_SET_THRESHOLD_PARMS;
                                                            -- dlcapi.h:770
                when DlcStatistics_kind =>
                    DlcStatistics: LLC_DLC_STATISTICS_PARMS;-- dlcapi.h:771
                when DirInitialize_kind =>
                    DirInitialize: LLC_DIR_INITIALIZE_PARMS;-- dlcapi.h:772
                when DirOpenAdapter_kind =>
                    DirOpenAdapter: LLC_DIR_OPEN_ADAPTER_PARMS;
                                                            -- dlcapi.h:773
                when DirOpenDirect_kind =>
                    DirOpenDirect: LLC_DIR_OPEN_DIRECT_PARMS;
                                                            -- dlcapi.h:774
                when DirReadLog_kind =>
                    DirReadLog: LLC_DIR_READ_LOG_PARMS;     -- dlcapi.h:775
                when DirSetEventFlag_kind =>
                    DirSetEventFlag: LLC_DIR_SET_EFLAG_PARMS;
                                                            -- dlcapi.h:776
                when DirStatus_kind =>
                    DirStatus: LLC_DIR_STATUS_PARMS;        -- dlcapi.h:777
                when Read_kind =>
                    Read     : LLC_READ_PARMS;              -- dlcapi.h:778
                when Receive_kind =>
                    Receive  : LLC_RECEIVE_PARMS;           -- dlcapi.h:779
                when Transmit_kind =>
                    Transmit : LLC_TRANSMIT_PARMS;          -- dlcapi.h:780
                when Transmit2_kind =>
                    Transmit2: LLC_TRANSMIT2_COMMAND;       -- dlcapi.h:781
                when TraceInitialize_kind =>
                    TraceInitialize: LLC_TRACE_INITIALIZE_PARMS;
                                                            -- dlcapi.h:782
            end case;
        end record;

    pragma Unchecked_Union(LLC_PARMS);

    type LLC_BUFFER_kind is (                               -- dlcapi.h:126
        pNext_kind,
        Next_kind,
        Buffer_kind,
        NotContiguous_kind,
        NotCont_kind,
        Contiguous_kind,
        Cont_kind
    );

    type LLC_BUFFER (Which: LLC_BUFFER_kind := NotCont_kind) is
                                                            -- dlcapi.h:126
        record
            case Which is
                when pNext_kind =>
                    pNext: PLLC_BUFFER;                     -- dlcapi.h:178
                when Next_kind =>
                    Next : LLC_NEXT_BUFFER;                 -- dlcapi.h:180
                when Buffer_kind =>
                    Buffer: LlcNextBuffer;                  -- dlcapi.h:185
                when NotContiguous_kind =>
                    NotContiguous: LLC_NOT_CONTIGUOUS_BUFFER;
                                                            -- dlcapi.h:187
                when NotCont_kind =>
                    NotCont: struct_anonymous6_t;           -- dlcapi.h:192
                when Contiguous_kind =>
                    Contiguous: LLC_CONTIGUOUS_BUFFER;      -- dlcapi.h:194
                when Cont_kind =>
                    Cont : struct_anonymous7_t;             -- dlcapi.h:199
            end case;
        end record;

    pragma Unchecked_Union(LLC_BUFFER);

    function LLC_XMIT_BUFFER_SIZE return size_t;
							    -- dlcapi.h:219

    function AcsLan(
                pCcb    : PLLC_CCB;
                ppBadCcb: access PLLC_CCB)
               return ACSLAN_STATUS;                        -- dlcapi.h:889

private

    pragma Convention(c_pass_by_copy, struct_anonymous0_t); -- dlcapi.h:91
    pragma Convention(c_pass_by_copy, struct_anonymous1_t); -- dlcapi.h:96
    pragma Convention(C, LLC_CCB);                          -- dlcapi.h:113
    pragma Convention(c_pass_by_copy, LLC_NEXT_BUFFER);     -- dlcapi.h:135
    pragma Convention(C, LLC_NOT_CONTIGUOUS_BUFFER);        -- dlcapi.h:155
    pragma Convention(C, LLC_CONTIGUOUS_BUFFER);            -- dlcapi.h:170
    pragma Convention(c_pass_by_copy, LlcNextBuffer);       -- dlcapi.h:182
    pragma Convention(C, struct_anonymous6_t);              -- dlcapi.h:192
    pragma Convention(C, struct_anonymous7_t);              -- dlcapi.h:199
    pragma Convention(c_pass_by_copy, LLC_XMIT_BUFFER);     -- dlcapi.h:207
    pragma Convention(c_pass_by_copy, LLC_BUFFER_CREATE_PARMS);          
							    -- dlcapi.h:230
    pragma Convention(c_pass_by_copy, LLC_BUFFER_FREE_PARMS);            
							    -- dlcapi.h:237
    pragma Convention(c_pass_by_copy, LLC_BUFFER_GET_PARMS);-- dlcapi.h:257
    pragma Convention(c_pass_by_copy, LLC_DLC_CONNECT_PARMS);            
							    -- dlcapi.h:267
    pragma Convention(C, LLC_DLC_MODIFY_PARMS);             -- dlcapi.h:293
    pragma Convention(C, LLC_DLC_OPEN_SAP_PARMS);           -- dlcapi.h:322
    pragma Convention(C, LLC_DLC_OPEN_STATION_PARMS);       -- dlcapi.h:338
    pragma Convention(c_pass_by_copy, LLC_DLC_REALLOCATE_PARMS);         
							    -- dlcapi.h:351
    pragma Convention(c_pass_by_copy, LLC_DLC_SET_THRESHOLD_PARMS);      
							    -- dlcapi.h:357
    pragma Convention(c_pass_by_copy, LLC_TRACE_INITIALIZE_PARMS);       
							    -- dlcapi.h:363
    pragma Convention(C, DLC_SAP_LOG);                      -- dlcapi.h:374
    pragma Convention(C, DLC_LINK_LOG);                     -- dlcapi.h:391
    pragma Convention(c_pass_by_copy, LLC_DLC_STATISTICS_PARMS);         
							    -- dlcapi.h:404
    pragma Convention(C, LLC_DIR_INITIALIZE_PARMS);         -- dlcapi.h:409
    pragma Convention(C, LLC_ADAPTER_OPEN_PARMS);           -- dlcapi.h:424
    pragma Convention(c_pass_by_copy, LLC_DLC_PARMS);       -- dlcapi.h:437
    pragma Convention(c_pass_by_copy, LLC_EXTENDED_ADAPTER_PARMS);       
							    -- dlcapi.h:457
    pragma Convention(c_pass_by_copy, LLC_DIR_OPEN_ADAPTER_PARMS);       
							    -- dlcapi.h:464
    pragma Convention(c_pass_by_copy, LLC_DIR_MULTICAST_ADDRESS);        
							    -- dlcapi.h:468
    pragma Convention(C, LLC_DIR_OPEN_DIRECT_PARMS);        -- dlcapi.h:479
    pragma Convention(c_pass_by_copy, LLC_ADAPTER_LOG_TR);  -- dlcapi.h:496
    pragma Convention(c_pass_by_copy, LLC_ADAPTER_LOG_ETH); -- dlcapi.h:508
    pragma Convention(C, LLC_DIRECT_LOG);                   -- dlcapi.h:521
    pragma Convention(C, struct_anonymous36_t);             -- dlcapi.h:530
    pragma Convention(c_pass_by_copy, LLC_DIR_READ_LOG_PARMS);           
							    -- dlcapi.h:543
    pragma Convention(c_pass_by_copy, LLC_DIR_SET_EFLAG_PARMS);          
							    -- dlcapi.h:550
    pragma Convention(C, LLC_DIR_STATUS_PARMS);             -- dlcapi.h:572
    pragma Convention(C, struct_anonymous41_t);             -- dlcapi.h:625
    pragma Convention(C, struct_anonymous43_t);             -- dlcapi.h:636
    pragma Convention(C, LLC_READ_PARMS);                   -- dlcapi.h:640
    pragma Convention(C, LLC_READ_COMMAND);                 -- dlcapi.h:653
    pragma Convention(C, LLC_RECEIVE_PARMS);                -- dlcapi.h:686
    pragma Convention(C, LLC_TRANSMIT_PARMS);               -- dlcapi.h:703
    pragma Convention(c_pass_by_copy, LLC_TRANSMIT_DESCRIPTOR);          
							    -- dlcapi.h:713
    pragma Convention(C, LLC_TRANSMIT2_COMMAND);            -- dlcapi.h:749

    pragma Import(Stdcall, AcsLan, "AcsLan");               -- dlcapi.h:889

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Dlcapi;

