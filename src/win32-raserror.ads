-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

package Win32.Raserror is

    RASBASE                             : constant := 600;  -- raserror.h:14
    SUCCESS                             : constant := 0;    -- raserror.h:15
    PENDING                             : constant := 600;  -- raserror.h:18
    ERROR_INVALID_PORT_HANDLE           : constant := 601;  -- raserror.h:19
    ERROR_PORT_ALREADY_OPEN             : constant := 602;  -- raserror.h:20
    ERROR_BUFFER_TOO_SMALL              : constant := 603;  -- raserror.h:21
    ERROR_WRONG_INFO_SPECIFIED          : constant := 604;  -- raserror.h:22
    ERROR_CANNOT_SET_PORT_INFO          : constant := 605;  -- raserror.h:23
    ERROR_PORT_NOT_CONNECTED            : constant := 606;  -- raserror.h:24
    ERROR_EVENT_INVALID                 : constant := 607;  -- raserror.h:25
    ERROR_DEVICE_DOES_NOT_EXIST         : constant := 608;  -- raserror.h:26
    ERROR_DEVICETYPE_DOES_NOT_EXIST     : constant := 609;  -- raserror.h:27
    ERROR_BUFFER_INVALID                : constant := 610;  -- raserror.h:28
    ERROR_ROUTE_NOT_AVAILABLE           : constant := 611;  -- raserror.h:29
    ERROR_ROUTE_NOT_ALLOCATED           : constant := 612;  -- raserror.h:30
    ERROR_INVALID_COMPRESSION_SPECIFIED : constant := 613;  -- raserror.h:31
    ERROR_OUT_OF_BUFFERS                : constant := 614;  -- raserror.h:32
    ERROR_PORT_NOT_FOUND                : constant := 615;  -- raserror.h:33
    ERROR_ASYNC_REQUEST_PENDING         : constant := 616;  -- raserror.h:34
    ERROR_ALREADY_DISCONNECTING         : constant := 617;  -- raserror.h:35
    ERROR_PORT_NOT_OPEN                 : constant := 618;  -- raserror.h:36
    ERROR_PORT_DISCONNECTED             : constant := 619;  -- raserror.h:37
    ERROR_NO_ENDPOINTS                  : constant := 620;  -- raserror.h:38
    ERROR_CANNOT_OPEN_PHONEBOOK         : constant := 621;  -- raserror.h:39
    ERROR_CANNOT_LOAD_PHONEBOOK         : constant := 622;  -- raserror.h:40
    ERROR_CANNOT_FIND_PHONEBOOK_ENTRY   : constant := 623;  -- raserror.h:41
    ERROR_CANNOT_WRITE_PHONEBOOK        : constant := 624;  -- raserror.h:42
    ERROR_CORRUPT_PHONEBOOK             : constant := 625;  -- raserror.h:43
    ERROR_CANNOT_LOAD_STRING            : constant := 626;  -- raserror.h:44
    ERROR_KEY_NOT_FOUND                 : constant := 627;  -- raserror.h:45
    ERROR_DISCONNECTION                 : constant := 628;  -- raserror.h:46
    ERROR_REMOTE_DISCONNECTION          : constant := 629;  -- raserror.h:47
    ERROR_HARDWARE_FAILURE              : constant := 630;  -- raserror.h:48
    ERROR_USER_DISCONNECTION            : constant := 631;  -- raserror.h:49
    ERROR_INVALID_SIZE                  : constant := 632;  -- raserror.h:50
    ERROR_PORT_NOT_AVAILABLE            : constant := 633;  -- raserror.h:51
    ERROR_CANNOT_PROJECT_CLIENT         : constant := 634;  -- raserror.h:52
    ERROR_UNKNOWN                       : constant := 635;  -- raserror.h:53
    ERROR_WRONG_DEVICE_ATTACHED         : constant := 636;  -- raserror.h:54
    ERROR_BAD_STRING                    : constant := 637;  -- raserror.h:55
    ERROR_REQUEST_TIMEOUT               : constant := 638;  -- raserror.h:56
    ERROR_CANNOT_GET_LANA               : constant := 639;  -- raserror.h:57
    ERROR_NETBIOS_ERROR                 : constant := 640;  -- raserror.h:58
    ERROR_SERVER_OUT_OF_RESOURCES       : constant := 641;  -- raserror.h:59
    ERROR_NAME_EXISTS_ON_NET            : constant := 642;  -- raserror.h:60
    ERROR_SERVER_GENERAL_NET_FAILURE    : constant := 643;  -- raserror.h:61
    WARNING_MSG_ALIAS_NOT_ADDED         : constant := 644;  -- raserror.h:62
    ERROR_AUTH_INTERNAL                 : constant := 645;  -- raserror.h:63
    ERROR_RESTRICTED_LOGON_HOURS        : constant := 646;  -- raserror.h:64
    ERROR_ACCT_DISABLED                 : constant := 647;  -- raserror.h:65
    ERROR_PASSWD_EXPIRED                : constant := 648;  -- raserror.h:66
    ERROR_NO_DIALIN_PERMISSION          : constant := 649;  -- raserror.h:67
    ERROR_SERVER_NOT_RESPONDING         : constant := 650;  -- raserror.h:68
    ERROR_FROM_DEVICE                   : constant := 651;  -- raserror.h:69
    ERROR_UNRECOGNIZED_RESPONSE         : constant := 652;  -- raserror.h:70
    ERROR_MACRO_NOT_FOUND               : constant := 653;  -- raserror.h:71
    ERROR_MACRO_NOT_DEFINED             : constant := 654;  -- raserror.h:72
    ERROR_MESSAGE_MACRO_NOT_FOUND       : constant := 655;  -- raserror.h:73
    ERROR_DEFAULTOFF_MACRO_NOT_FOUND    : constant := 656;  -- raserror.h:74
    ERROR_FILE_COULD_NOT_BE_OPENED      : constant := 657;  -- raserror.h:75
    ERROR_DEVICENAME_TOO_LONG           : constant := 658;  -- raserror.h:76
    ERROR_DEVICENAME_NOT_FOUND          : constant := 659;  -- raserror.h:77
    ERROR_NO_RESPONSES                  : constant := 660;  -- raserror.h:78
    ERROR_NO_COMMAND_FOUND              : constant := 661;  -- raserror.h:79
    ERROR_WRONG_KEY_SPECIFIED           : constant := 662;  -- raserror.h:80
    ERROR_UNKNOWN_DEVICE_TYPE           : constant := 663;  -- raserror.h:81
    ERROR_ALLOCATING_MEMORY             : constant := 664;  -- raserror.h:82
    ERROR_PORT_NOT_CONFIGURED           : constant := 665;  -- raserror.h:83
    ERROR_DEVICE_NOT_READY              : constant := 666;  -- raserror.h:84
    ERROR_READING_INI_FILE              : constant := 667;  -- raserror.h:85
    ERROR_NO_CONNECTION                 : constant := 668;  -- raserror.h:86
    ERROR_BAD_USAGE_IN_INI_FILE         : constant := 669;  -- raserror.h:87
    ERROR_READING_SECTIONNAME           : constant := 670;  -- raserror.h:88
    ERROR_READING_DEVICETYPE            : constant := 671;  -- raserror.h:89
    ERROR_READING_DEVICENAME            : constant := 672;  -- raserror.h:90
    ERROR_READING_USAGE                 : constant := 673;  -- raserror.h:91
    ERROR_READING_MAXCONNECTBPS         : constant := 674;  -- raserror.h:92
    ERROR_READING_MAXCARRIERBPS         : constant := 675;  -- raserror.h:93
    ERROR_LINE_BUSY                     : constant := 676;  -- raserror.h:94
    ERROR_VOICE_ANSWER                  : constant := 677;  -- raserror.h:95
    ERROR_NO_ANSWER                     : constant := 678;  -- raserror.h:96
    ERROR_NO_CARRIER                    : constant := 679;  -- raserror.h:97
    ERROR_NO_DIALTONE                   : constant := 680;  -- raserror.h:98
    ERROR_IN_COMMAND                    : constant := 681;  -- raserror.h:99
    ERROR_WRITING_SECTIONNAME           : constant := 682;  -- raserror.h:100
    ERROR_WRITING_DEVICETYPE            : constant := 683;  -- raserror.h:101
    ERROR_WRITING_DEVICENAME            : constant := 684;  -- raserror.h:102
    ERROR_WRITING_MAXCONNECTBPS         : constant := 685;  -- raserror.h:103
    ERROR_WRITING_MAXCARRIERBPS         : constant := 686;  -- raserror.h:104
    ERROR_WRITING_USAGE                 : constant := 687;  -- raserror.h:105
    ERROR_WRITING_DEFAULTOFF            : constant := 688;  -- raserror.h:106
    ERROR_READING_DEFAULTOFF            : constant := 689;  -- raserror.h:107
    ERROR_EMPTY_INI_FILE                : constant := 690;  -- raserror.h:108
    ERROR_AUTHENTICATION_FAILURE        : constant := 691;  -- raserror.h:109
    ERROR_PORT_OR_DEVICE                : constant := 692;  -- raserror.h:110
    ERROR_NOT_BINARY_MACRO              : constant := 693;  -- raserror.h:111
    ERROR_DCB_NOT_FOUND                 : constant := 694;  -- raserror.h:112
    ERROR_STATE_MACHINES_NOT_STARTED    : constant := 695;  -- raserror.h:113
    ERROR_STATE_MACHINES_ALREADY_STARTED: constant := 696;  -- raserror.h:114
    ERROR_PARTIAL_RESPONSE_LOOPING      : constant := 697;  -- raserror.h:115
    ERROR_UNKNOWN_RESPONSE_KEY          : constant := 698;  -- raserror.h:116
    ERROR_RECV_BUF_FULL                 : constant := 699;  -- raserror.h:117
    ERROR_CMD_TOO_LONG                  : constant := 700;  -- raserror.h:118
    ERROR_UNSUPPORTED_BPS               : constant := 701;  -- raserror.h:119
    ERROR_UNEXPECTED_RESPONSE           : constant := 702;  -- raserror.h:120
    ERROR_INTERACTIVE_MODE              : constant := 703;  -- raserror.h:121
    ERROR_BAD_CALLBACK_NUMBER           : constant := 704;  -- raserror.h:122
    ERROR_INVALID_AUTH_STATE            : constant := 705;  -- raserror.h:123
    ERROR_WRITING_INITBPS               : constant := 706;  -- raserror.h:124
    ERROR_X25_DIAGNOSTIC                : constant := 707;  -- raserror.h:125
    ERROR_ACCT_EXPIRED                  : constant := 708;  -- raserror.h:126
    ERROR_CHANGING_PASSWORD             : constant := 709;  -- raserror.h:127
    ERROR_OVERRUN                       : constant := 710;  -- raserror.h:128
    ERROR_RASMAN_CANNOT_INITIALIZE      : constant := 711;  -- raserror.h:129
    ERROR_BIPLEX_PORT_NOT_AVAILABLE     : constant := 712;  -- raserror.h:130
    ERROR_NO_ACTIVE_ISDN_LINES          : constant := 713;  -- raserror.h:131
    ERROR_NO_ISDN_CHANNELS_AVAILABLE    : constant := 714;  -- raserror.h:132
    ERROR_TOO_MANY_LINE_ERRORS          : constant := 715;  -- raserror.h:133
    ERROR_IP_CONFIGURATION              : constant := 716;  -- raserror.h:134
    ERROR_NO_IP_ADDRESSES               : constant := 717;  -- raserror.h:135
    ERROR_PPP_TIMEOUT                   : constant := 718;  -- raserror.h:136
    ERROR_PPP_REMOTE_TERMINATED         : constant := 719;  -- raserror.h:137
    ERROR_PPP_NO_PROTOCOLS_CONFIGURED   : constant := 720;  -- raserror.h:138
    ERROR_PPP_NO_RESPONSE               : constant := 721;  -- raserror.h:139
    ERROR_PPP_INVALID_PACKET            : constant := 722;  -- raserror.h:140
    ERROR_PHONE_NUMBER_TOO_LONG         : constant := 723;  -- raserror.h:141
    ERROR_IPXCP_NO_DIALOUT_CONFIGURED   : constant := 724;  -- raserror.h:142
    ERROR_IPXCP_NO_DIALIN_CONFIGURED    : constant := 725;  -- raserror.h:143
    ERROR_IPXCP_DIALOUT_ALREADY_ACTIVE  : constant := 726;  -- raserror.h:144
    ERROR_ACCESSING_TCPCFGDLL           : constant := 727;  -- raserror.h:145
    ERROR_NO_IP_RAS_ADAPTER             : constant := 728;  -- raserror.h:146
    ERROR_SLIP_REQUIRES_IP              : constant := 729;  -- raserror.h:147
    ERROR_PROJECTION_NOT_COMPLETE       : constant := 730;  -- raserror.h:148
    ERROR_PROTOCOL_NOT_CONFIGURED       : constant := 731;  -- raserror.h:149
    ERROR_PPP_NOT_CONVERGING            : constant := 732;  -- raserror.h:150
    ERROR_PPP_CP_REJECTED               : constant := 733;  -- raserror.h:151
    ERROR_PPP_LCP_TERMINATED            : constant := 734;  -- raserror.h:152
    ERROR_PPP_REQUIRED_ADDRESS_REJECTED : constant := 735;  -- raserror.h:153
    ERROR_PPP_NCP_TERMINATED            : constant := 736;  -- raserror.h:154
    ERROR_PPP_LOOPBACK_DETECTED         : constant := 737;  -- raserror.h:155
    ERROR_PPP_NO_ADDRESS_ASSIGNED       : constant := 738;  -- raserror.h:156
    ERROR_CANNOT_USE_LOGON_CREDENTIALS  : constant := 739;  -- raserror.h:157
    ERROR_TAPI_CONFIGURATION            : constant := 740;  -- raserror.h:158
    ERROR_NO_LOCAL_ENCRYPTION           : constant := 741;  -- raserror.h:159
    ERROR_NO_REMOTE_ENCRYPTION          : constant := 742;  -- raserror.h:160
    ERROR_REMOTE_REQUIRES_ENCRYPTION    : constant := 743;  -- raserror.h:161
    ERROR_IPXCP_NET_NUMBER_CONFLICT     : constant := 744;  -- raserror.h:162
    RASBASEEND                          : constant := 744;  -- raserror.h:164

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

end Win32.Raserror;
