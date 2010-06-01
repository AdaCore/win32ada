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

package Win32.Raserror is

   RASBASE                              : constant := 600;
   SUCCESS                              : constant := 0;
   PENDING                              : constant := 600;
   ERROR_INVALID_PORT_HANDLE            : constant := 601;
   ERROR_PORT_ALREADY_OPEN              : constant := 602;
   ERROR_BUFFER_TOO_SMALL               : constant := 603;
   ERROR_WRONG_INFO_SPECIFIED           : constant := 604;
   ERROR_CANNOT_SET_PORT_INFO           : constant := 605;
   ERROR_PORT_NOT_CONNECTED             : constant := 606;
   ERROR_EVENT_INVALID                  : constant := 607;
   ERROR_DEVICE_DOES_NOT_EXIST          : constant := 608;
   ERROR_DEVICETYPE_DOES_NOT_EXIST      : constant := 609;
   ERROR_BUFFER_INVALID                 : constant := 610;
   ERROR_ROUTE_NOT_AVAILABLE            : constant := 611;
   ERROR_ROUTE_NOT_ALLOCATED            : constant := 612;
   ERROR_INVALID_COMPRESSION_SPECIFIED  : constant := 613;
   ERROR_OUT_OF_BUFFERS                 : constant := 614;
   ERROR_PORT_NOT_FOUND                 : constant := 615;
   ERROR_ASYNC_REQUEST_PENDING          : constant := 616;
   ERROR_ALREADY_DISCONNECTING          : constant := 617;
   ERROR_PORT_NOT_OPEN                  : constant := 618;
   ERROR_PORT_DISCONNECTED              : constant := 619;
   ERROR_NO_ENDPOINTS                   : constant := 620;
   ERROR_CANNOT_OPEN_PHONEBOOK          : constant := 621;
   ERROR_CANNOT_LOAD_PHONEBOOK          : constant := 622;
   ERROR_CANNOT_FIND_PHONEBOOK_ENTRY    : constant := 623;
   ERROR_CANNOT_WRITE_PHONEBOOK         : constant := 624;
   ERROR_CORRUPT_PHONEBOOK              : constant := 625;
   ERROR_CANNOT_LOAD_STRING             : constant := 626;
   ERROR_KEY_NOT_FOUND                  : constant := 627;
   ERROR_DISCONNECTION                  : constant := 628;
   ERROR_REMOTE_DISCONNECTION           : constant := 629;
   ERROR_HARDWARE_FAILURE               : constant := 630;
   ERROR_USER_DISCONNECTION             : constant := 631;
   ERROR_INVALID_SIZE                   : constant := 632;
   ERROR_PORT_NOT_AVAILABLE             : constant := 633;
   ERROR_CANNOT_PROJECT_CLIENT          : constant := 634;
   ERROR_UNKNOWN                        : constant := 635;
   ERROR_WRONG_DEVICE_ATTACHED          : constant := 636;
   ERROR_BAD_STRING                     : constant := 637;
   ERROR_REQUEST_TIMEOUT                : constant := 638;
   ERROR_CANNOT_GET_LANA                : constant := 639;
   ERROR_NETBIOS_ERROR                  : constant := 640;
   ERROR_SERVER_OUT_OF_RESOURCES        : constant := 641;
   ERROR_NAME_EXISTS_ON_NET             : constant := 642;
   ERROR_SERVER_GENERAL_NET_FAILURE     : constant := 643;
   WARNING_MSG_ALIAS_NOT_ADDED          : constant := 644;
   ERROR_AUTH_INTERNAL                  : constant := 645;
   ERROR_RESTRICTED_LOGON_HOURS         : constant := 646;
   ERROR_ACCT_DISABLED                  : constant := 647;
   ERROR_PASSWD_EXPIRED                 : constant := 648;
   ERROR_NO_DIALIN_PERMISSION           : constant := 649;
   ERROR_SERVER_NOT_RESPONDING          : constant := 650;
   ERROR_FROM_DEVICE                    : constant := 651;
   ERROR_UNRECOGNIZED_RESPONSE          : constant := 652;
   ERROR_MACRO_NOT_FOUND                : constant := 653;
   ERROR_MACRO_NOT_DEFINED              : constant := 654;
   ERROR_MESSAGE_MACRO_NOT_FOUND        : constant := 655;
   ERROR_DEFAULTOFF_MACRO_NOT_FOUND     : constant := 656;
   ERROR_FILE_COULD_NOT_BE_OPENED       : constant := 657;
   ERROR_DEVICENAME_TOO_LONG            : constant := 658;
   ERROR_DEVICENAME_NOT_FOUND           : constant := 659;
   ERROR_NO_RESPONSES                   : constant := 660;
   ERROR_NO_COMMAND_FOUND               : constant := 661;
   ERROR_WRONG_KEY_SPECIFIED            : constant := 662;
   ERROR_UNKNOWN_DEVICE_TYPE            : constant := 663;
   ERROR_ALLOCATING_MEMORY              : constant := 664;
   ERROR_PORT_NOT_CONFIGURED            : constant := 665;
   ERROR_DEVICE_NOT_READY               : constant := 666;
   ERROR_READING_INI_FILE               : constant := 667;
   ERROR_NO_CONNECTION                  : constant := 668;
   ERROR_BAD_USAGE_IN_INI_FILE          : constant := 669;
   ERROR_READING_SECTIONNAME            : constant := 670;
   ERROR_READING_DEVICETYPE             : constant := 671;
   ERROR_READING_DEVICENAME             : constant := 672;
   ERROR_READING_USAGE                  : constant := 673;
   ERROR_READING_MAXCONNECTBPS          : constant := 674;
   ERROR_READING_MAXCARRIERBPS          : constant := 675;
   ERROR_LINE_BUSY                      : constant := 676;
   ERROR_VOICE_ANSWER                   : constant := 677;
   ERROR_NO_ANSWER                      : constant := 678;
   ERROR_NO_CARRIER                     : constant := 679;
   ERROR_NO_DIALTONE                    : constant := 680;
   ERROR_IN_COMMAND                     : constant := 681;
   ERROR_WRITING_SECTIONNAME            : constant := 682;
   ERROR_WRITING_DEVICETYPE             : constant := 683;
   ERROR_WRITING_DEVICENAME             : constant := 684;
   ERROR_WRITING_MAXCONNECTBPS          : constant := 685;
   ERROR_WRITING_MAXCARRIERBPS          : constant := 686;
   ERROR_WRITING_USAGE                  : constant := 687;
   ERROR_WRITING_DEFAULTOFF             : constant := 688;
   ERROR_READING_DEFAULTOFF             : constant := 689;
   ERROR_EMPTY_INI_FILE                 : constant := 690;
   ERROR_AUTHENTICATION_FAILURE         : constant := 691;
   ERROR_PORT_OR_DEVICE                 : constant := 692;
   ERROR_NOT_BINARY_MACRO               : constant := 693;
   ERROR_DCB_NOT_FOUND                  : constant := 694;
   ERROR_STATE_MACHINES_NOT_STARTED     : constant := 695;
   ERROR_STATE_MACHINES_ALREADY_STARTED : constant := 696;
   ERROR_PARTIAL_RESPONSE_LOOPING       : constant := 697;
   ERROR_UNKNOWN_RESPONSE_KEY           : constant := 698;
   ERROR_RECV_BUF_FULL                  : constant := 699;
   ERROR_CMD_TOO_LONG                   : constant := 700;
   ERROR_UNSUPPORTED_BPS                : constant := 701;
   ERROR_UNEXPECTED_RESPONSE            : constant := 702;
   ERROR_INTERACTIVE_MODE               : constant := 703;
   ERROR_BAD_CALLBACK_NUMBER            : constant := 704;
   ERROR_INVALID_AUTH_STATE             : constant := 705;
   ERROR_WRITING_INITBPS                : constant := 706;
   ERROR_X25_DIAGNOSTIC                 : constant := 707;
   ERROR_ACCT_EXPIRED                   : constant := 708;
   ERROR_CHANGING_PASSWORD              : constant := 709;
   ERROR_OVERRUN                        : constant := 710;
   ERROR_RASMAN_CANNOT_INITIALIZE       : constant := 711;
   ERROR_BIPLEX_PORT_NOT_AVAILABLE      : constant := 712;
   ERROR_NO_ACTIVE_ISDN_LINES           : constant := 713;
   ERROR_NO_ISDN_CHANNELS_AVAILABLE     : constant := 714;
   ERROR_TOO_MANY_LINE_ERRORS           : constant := 715;
   ERROR_IP_CONFIGURATION               : constant := 716;
   ERROR_NO_IP_ADDRESSES                : constant := 717;
   ERROR_PPP_TIMEOUT                    : constant := 718;
   ERROR_PPP_REMOTE_TERMINATED          : constant := 719;
   ERROR_PPP_NO_PROTOCOLS_CONFIGURED    : constant := 720;
   ERROR_PPP_NO_RESPONSE                : constant := 721;
   ERROR_PPP_INVALID_PACKET             : constant := 722;
   ERROR_PHONE_NUMBER_TOO_LONG          : constant := 723;
   ERROR_IPXCP_NO_DIALOUT_CONFIGURED    : constant := 724;
   ERROR_IPXCP_NO_DIALIN_CONFIGURED     : constant := 725;
   ERROR_IPXCP_DIALOUT_ALREADY_ACTIVE   : constant := 726;
   ERROR_ACCESSING_TCPCFGDLL            : constant := 727;
   ERROR_NO_IP_RAS_ADAPTER              : constant := 728;
   ERROR_SLIP_REQUIRES_IP               : constant := 729;
   ERROR_PROJECTION_NOT_COMPLETE        : constant := 730;
   ERROR_PROTOCOL_NOT_CONFIGURED        : constant := 731;
   ERROR_PPP_NOT_CONVERGING             : constant := 732;
   ERROR_PPP_CP_REJECTED                : constant := 733;
   ERROR_PPP_LCP_TERMINATED             : constant := 734;
   ERROR_PPP_REQUIRED_ADDRESS_REJECTED  : constant := 735;
   ERROR_PPP_NCP_TERMINATED             : constant := 736;
   ERROR_PPP_LOOPBACK_DETECTED          : constant := 737;
   ERROR_PPP_NO_ADDRESS_ASSIGNED        : constant := 738;
   ERROR_CANNOT_USE_LOGON_CREDENTIALS   : constant := 739;
   ERROR_TAPI_CONFIGURATION             : constant := 740;
   ERROR_NO_LOCAL_ENCRYPTION            : constant := 741;
   ERROR_NO_REMOTE_ENCRYPTION           : constant := 742;
   ERROR_REMOTE_REQUIRES_ENCRYPTION     : constant := 743;
   ERROR_IPXCP_NET_NUMBER_CONFLICT      : constant := 744;
   RASBASEEND                           : constant := 744;

end Win32.Raserror;
