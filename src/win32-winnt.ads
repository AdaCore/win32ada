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
--  Copyright (C) 2000-2025, AdaCore
--
-------------------------------------------------------------------------------

with Interfaces.C; use Interfaces.C;

package Win32.Winnt is

   pragma Elaborate_Body;

   APPLICATION_ERROR_MASK       : constant := 16#20000000#;
   ERROR_SEVERITY_SUCCESS       : constant := 16#0#;
   ERROR_SEVERITY_INFORMATIONAL : constant := 16#40000000#;
   ERROR_SEVERITY_WARNING       : constant := 16#80000000#;
   ERROR_SEVERITY_ERROR         : constant := 16#c0000000#;
   UNICODE_NULL                 : constant WCHAR := WCHAR'Val (0);
   MINCHAR                      : constant := 16#80#;
   MAXCHAR                      : constant := 16#7f#;
   MINSHORT                     : constant := 16#8000#;
   MAXSHORT                     : constant := 16#7fff#;
   MINLONG                      : constant := 16#80000000#;
   MAXLONG                      : constant := 16#7fffffff#;
   MAXBYTE                      : constant := 16#ff#;
   MAXWORD                      : constant := 16#ffff#;
   MAXDWORD                     : constant := 16#ffffffff#;
   LANG_NEUTRAL                 : constant := 16#0#;
   LANG_BULGARIAN               : constant := 16#2#;
   LANG_CHINESE                 : constant := 16#4#;
   LANG_CROATIAN                : constant := 16#1a#;
   LANG_CZECH                   : constant := 16#5#;
   LANG_DANISH                  : constant := 16#6#;
   LANG_DUTCH                   : constant := 16#13#;
   LANG_ENGLISH                 : constant := 16#9#;
   LANG_FINNISH                 : constant := 16#b#;
   LANG_FRENCH                  : constant := 16#c#;
   LANG_GERMAN                  : constant := 16#7#;
   LANG_GREEK                   : constant := 16#8#;
   LANG_HUNGARIAN               : constant := 16#e#;
   LANG_ICELANDIC               : constant := 16#f#;
   LANG_ITALIAN                 : constant := 16#10#;
   LANG_JAPANESE                : constant := 16#11#;
   LANG_KOREAN                  : constant := 16#12#;
   LANG_NORWEGIAN               : constant := 16#14#;
   LANG_POLISH                  : constant := 16#15#;
   LANG_PORTUGUESE              : constant := 16#16#;
   LANG_ROMANIAN                : constant := 16#18#;
   LANG_RUSSIAN                 : constant := 16#19#;
   LANG_SLOVAK                  : constant := 16#1b#;
   LANG_SLOVENIAN               : constant := 16#24#;
   LANG_SPANISH                 : constant := 16#a#;
   LANG_SWEDISH                 : constant := 16#1d#;
   LANG_TURKISH                 : constant := 16#1f#;
   SUBLANG_NEUTRAL              : constant := 16#0#;
   SUBLANG_DEFAULT              : constant := 16#1#;
   SUBLANG_SYS_DEFAULT          : constant := 16#2#;
   SUBLANG_CHINESE_TRADITIONAL  : constant := 16#1#;
   SUBLANG_CHINESE_SIMPLIFIED   : constant := 16#2#;
   SUBLANG_CHINESE_HONGKONG     : constant := 16#3#;
   SUBLANG_CHINESE_SINGAPORE    : constant := 16#4#;
   SUBLANG_DUTCH                : constant := 16#1#;
   SUBLANG_DUTCH_BELGIAN        : constant := 16#2#;
   SUBLANG_ENGLISH_US           : constant := 16#1#;
   SUBLANG_ENGLISH_UK           : constant := 16#2#;
   SUBLANG_ENGLISH_AUS          : constant := 16#3#;
   SUBLANG_ENGLISH_CAN          : constant := 16#4#;
   SUBLANG_ENGLISH_NZ           : constant := 16#5#;
   SUBLANG_ENGLISH_EIRE         : constant := 16#6#;
   SUBLANG_FRENCH               : constant := 16#1#;
   SUBLANG_FRENCH_BELGIAN       : constant := 16#2#;
   SUBLANG_FRENCH_CANADIAN      : constant := 16#3#;
   SUBLANG_FRENCH_SWISS         : constant := 16#4#;
   SUBLANG_GERMAN               : constant := 16#1#;
   SUBLANG_GERMAN_SWISS         : constant := 16#2#;
   SUBLANG_GERMAN_AUSTRIAN      : constant := 16#3#;
   SUBLANG_ITALIAN              : constant := 16#1#;
   SUBLANG_ITALIAN_SWISS        : constant := 16#2#;
   SUBLANG_NORWEGIAN_BOKMAL     : constant := 16#1#;
   SUBLANG_NORWEGIAN_NYNORSK    : constant := 16#2#;
   SUBLANG_PORTUGUESE           : constant := 16#2#;
   SUBLANG_PORTUGUESE_BRAZILIAN : constant := 16#1#;
   SUBLANG_SPANISH              : constant := 16#1#;
   SUBLANG_SPANISH_MEXICAN      : constant := 16#2#;
   SUBLANG_SPANISH_MODERN       : constant := 16#3#;
   SORT_DEFAULT                 : constant := 16#0#;

   LANG_SYSTEM_DEFAULT   : constant :=
     ((SUBLANG_SYS_DEFAULT * (2 ** 10)) + LANG_NEUTRAL);
   LANG_USER_DEFAULT     : constant :=
     ((SUBLANG_DEFAULT * (2 ** 10)) + LANG_NEUTRAL);
   LOCALE_SYSTEM_DEFAULT : constant :=
     ((SORT_DEFAULT * (2 ** 16)) + LANG_SYSTEM_DEFAULT);
   LOCALE_USER_DEFAULT   : constant :=
     ((SORT_DEFAULT * (2 ** 16)) + LANG_USER_DEFAULT);

   SORT_JAPANESE_XJIS                 : constant := 16#0#;
   SORT_JAPANESE_UNICODE              : constant := 16#1#;
   SORT_CHINESE_BIG5                  : constant := 16#0#;
   SORT_CHINESE_UNICODE               : constant := 16#1#;
   SORT_KOREAN_KSC                    : constant := 16#0#;
   SORT_KOREAN_UNICODE                : constant := 16#1#;
   NLS_VALID_LOCALE_MASK              : constant := 16#fffff#;
   STATUS_WAIT_0                      : constant DWORD      := 16#0#;
   STATUS_ABANDONED_WAIT_0            : constant DWORD      := 16#80#;
   STATUS_USER_APC                    : constant DWORD      := 16#c0#;
   STATUS_TIMEOUT                     : constant DWORD      := 16#102#;
   STATUS_PENDING                     : constant DWORD      := 16#103#;
   STATUS_GUARD_PAGE_VIOLATION        : constant DWORD      := 16#80000001#;
   STATUS_DATATYPE_MISALIGNMENT       : constant DWORD      := 16#80000002#;
   STATUS_BREAKPOINT                  : constant DWORD      := 16#80000003#;
   STATUS_SINGLE_STEP                 : constant DWORD      := 16#80000004#;
   STATUS_ACCESS_VIOLATION            : constant DWORD      := 16#c0000005#;
   STATUS_IN_PAGE_ERROR               : constant DWORD      := 16#c0000006#;
   STATUS_NO_MEMORY                   : constant DWORD      := 16#c0000017#;
   STATUS_ILLEGAL_INSTRUCTION         : constant DWORD      := 16#c000001d#;
   STATUS_NONCONTINUABLE_EXCEPTION    : constant DWORD      := 16#c0000025#;
   STATUS_INVALID_DISPOSITION         : constant DWORD      := 16#c0000026#;
   STATUS_ARRAY_BOUNDS_EXCEEDED       : constant DWORD      := 16#c000008c#;
   STATUS_FLOAT_DENORMAL_OPERAND      : constant DWORD      := 16#c000008d#;
   STATUS_FLOAT_DIVIDE_BY_ZERO        : constant DWORD      := 16#c000008e#;
   STATUS_FLOAT_INEXACT_RESULT        : constant DWORD      := 16#c000008f#;
   STATUS_FLOAT_INVALID_OPERATION     : constant DWORD      := 16#c0000090#;
   STATUS_FLOAT_OVERFLOW              : constant DWORD      := 16#c0000091#;
   STATUS_FLOAT_STACK_CHECK           : constant DWORD      := 16#c0000092#;
   STATUS_FLOAT_UNDERFLOW             : constant DWORD      := 16#c0000093#;
   STATUS_INTEGER_DIVIDE_BY_ZERO      : constant DWORD      := 16#c0000094#;
   STATUS_INTEGER_OVERFLOW            : constant DWORD      := 16#c0000095#;
   STATUS_PRIVILEGED_INSTRUCTION      : constant DWORD      := 16#c0000096#;
   STATUS_STACK_OVERFLOW              : constant DWORD      := 16#c00000fd#;
   STATUS_CONTROL_C_EXIT              : constant DWORD      := 16#c000013a#;
   MAXIMUM_WAIT_OBJECTS               : constant := 64;
   MAXIMUM_SUSPEND_COUNT              : constant := 16#7f#;
   SIZE_OF_80387_REGISTERS            : constant := 80;
   CONTEXT_I386                       : constant := 16#10000#;
   CONTEXT_I486                       : constant := 16#10000#;
   CONTEXT_CONTROL                    : constant := 16#10001#;
   CONTEXT_INTEGER                    : constant := 16#10002#;
   CONTEXT_SEGMENTS                   : constant := 16#10004#;
   CONTEXT_FLOATING_POINT             : constant := 16#10008#;
   CONTEXT_DEBUG_REGISTERS            : constant := 16#10010#;
   CONTEXT_EXTENDED_REGISTERS         : constant := 16#10020#;
   CONTEXT_FULL                       : constant := 16#10007#;
   MAXIMUM_SUPPORTED_EXTENSION        : constant := 512;
   EXCEPTION_NONCONTINUABLE           : constant := 16#1#;
   EXCEPTION_MAXIMUM_PARAMETERS       : constant := 15;
   PROCESS_TERMINATE                  : constant := 16#1#;
   PROCESS_CREATE_THREAD              : constant := 16#2#;
   PROCESS_VM_OPERATION               : constant := 16#8#;
   PROCESS_VM_READ                    : constant := 16#10#;
   PROCESS_VM_WRITE                   : constant := 16#20#;
   PROCESS_DUP_HANDLE                 : constant := 16#40#;
   PROCESS_CREATE_PROCESS             : constant := 16#80#;
   PROCESS_SET_QUOTA                  : constant := 16#100#;
   PROCESS_SET_INFORMATION            : constant := 16#200#;
   PROCESS_QUERY_INFORMATION          : constant := 16#400#;
   PROCESS_ALL_ACCESS                 : constant := 16#1f0fff#;
   THREAD_TERMINATE                   : constant := 16#1#;
   THREAD_SUSPEND_RESUME              : constant := 16#2#;
   THREAD_GET_CONTEXT                 : constant := 16#8#;
   THREAD_SET_CONTEXT                 : constant := 16#10#;
   THREAD_SET_INFORMATION             : constant := 16#20#;
   THREAD_QUERY_INFORMATION           : constant := 16#40#;
   THREAD_SET_THREAD_TOKEN            : constant := 16#80#;
   THREAD_IMPERSONATE                 : constant := 16#100#;
   THREAD_DIRECT_IMPERSONATION        : constant := 16#200#;
   THREAD_ALL_ACCESS                  : constant := 16#1f03ff#;
   TLS_MINIMUM_AVAILABLE              : constant := 64;
   THREAD_BASE_PRIORITY_LOWRT         : constant := 15;
   THREAD_BASE_PRIORITY_MAX           : constant := 2;
   THREAD_BASE_PRIORITY_MIN           : constant := -2;
   THREAD_BASE_PRIORITY_IDLE          : constant := -15;
   EVENT_MODIFY_STATE                 : constant := 16#2#;
   EVENT_ALL_ACCESS                   : constant := 16#1f0003#;
   MUTANT_QUERY_STATE                 : constant := 16#1#;
   MUTANT_ALL_ACCESS                  : constant := 16#1f0001#;
   SEMAPHORE_MODIFY_STATE             : constant := 16#2#;
   SEMAPHORE_ALL_ACCESS               : constant := 16#1f0003#;
   TIME_ZONE_ID_UNKNOWN               : constant := 0;
   TIME_ZONE_ID_STANDARD              : constant := 1;
   TIME_ZONE_ID_DAYLIGHT              : constant := 2;
   PROCESSOR_INTEL_386                : constant := 386;
   PROCESSOR_INTEL_486                : constant := 486;
   PROCESSOR_INTEL_PENTIUM            : constant := 586;
   PROCESSOR_INTEL_860                : constant := 860;
   PROCESSOR_MIPS_R2000               : constant := 2000;
   PROCESSOR_MIPS_R3000               : constant := 3000;
   PROCESSOR_MIPS_R4000               : constant := 4000;
   PROCESSOR_ALPHA_21064              : constant := 21064;
   PROCESSOR_PPC_601                  : constant := 601;
   PROCESSOR_PPC_603                  : constant := 603;
   PROCESSOR_PPC_604                  : constant := 604;
   PROCESSOR_PPC_620                  : constant := 620;
   SECTION_QUERY                      : constant := 16#1#;
   SECTION_MAP_WRITE                  : constant := 16#2#;
   SECTION_MAP_READ                   : constant := 16#4#;
   SECTION_MAP_EXECUTE                : constant := 16#8#;
   SECTION_EXTEND_SIZE                : constant := 16#10#;
   SECTION_ALL_ACCESS                 : constant := 16#f001f#;
   PAGE_NOACCESS                      : constant := 16#1#;
   PAGE_READONLY                      : constant := 16#2#;
   PAGE_READWRITE                     : constant := 16#4#;
   PAGE_WRITECOPY                     : constant := 16#8#;
   PAGE_EXECUTE                       : constant := 16#10#;
   PAGE_EXECUTE_READ                  : constant := 16#20#;
   PAGE_EXECUTE_READWRITE             : constant := 16#40#;
   PAGE_EXECUTE_WRITECOPY             : constant := 16#80#;
   PAGE_GUARD                         : constant := 16#100#;
   PAGE_NOCACHE                       : constant := 16#200#;
   MEM_COMMIT                         : constant := 16#1000#;
   MEM_RESERVE                        : constant := 16#2000#;
   MEM_DECOMMIT                       : constant := 16#4000#;
   MEM_RELEASE                        : constant := 16#8000#;
   MEM_FREE                           : constant := 16#10000#;
   MEM_PRIVATE                        : constant := 16#20000#;
   MEM_MAPPED                         : constant := 16#40000#;
   MEM_TOP_DOWN                       : constant := 16#100000#;
   SEC_FILE                           : constant := 16#800000#;
   SEC_IMAGE                          : constant := 16#1000000#;
   SEC_RESERVE                        : constant := 16#4000000#;
   SEC_COMMIT                         : constant := 16#8000000#;
   SEC_NOCACHE                        : constant := 16#10000000#;
   MEM_IMAGE                          : constant := 16#1000000#;
   FILE_READ_DATA                     : constant := 16#1#;
   FILE_LIST_DIRECTORY                : constant := 16#1#;
   FILE_WRITE_DATA                    : constant := 16#2#;
   FILE_ADD_FILE                      : constant := 16#2#;
   FILE_APPEND_DATA                   : constant := 16#4#;
   FILE_ADD_SUBDIRECTORY              : constant := 16#4#;
   FILE_CREATE_PIPE_INSTANCE          : constant := 16#4#;
   FILE_READ_EA                       : constant := 16#8#;
   FILE_READ_PROPERTIES               : constant := 16#8#;
   FILE_WRITE_EA                      : constant := 16#10#;
   FILE_WRITE_PROPERTIES              : constant := 16#10#;
   FILE_EXECUTE                       : constant := 16#20#;
   FILE_TRAVERSE                      : constant := 16#20#;
   FILE_DELETE_CHILD                  : constant := 16#40#;
   FILE_READ_ATTRIBUTES               : constant := 16#80#;
   FILE_WRITE_ATTRIBUTES              : constant := 16#100#;
   FILE_ALL_ACCESS                    : constant := 16#1f01ff#;
   FILE_GENERIC_READ                  : constant := 16#120089#;
   FILE_GENERIC_WRITE                 : constant := 16#120116#;
   FILE_GENERIC_EXECUTE               : constant := 16#1200a0#;
   FILE_SHARE_READ                    : constant := 16#1#;
   FILE_SHARE_WRITE                   : constant := 16#2#;
   FILE_SHARE_DELETE                  : constant := 16#4#;
   FILE_ATTRIBUTE_READONLY            : constant := 16#1#;
   FILE_ATTRIBUTE_HIDDEN              : constant := 16#2#;
   FILE_ATTRIBUTE_SYSTEM              : constant := 16#4#;
   FILE_ATTRIBUTE_DIRECTORY           : constant := 16#10#;
   FILE_ATTRIBUTE_ARCHIVE             : constant := 16#20#;
   FILE_ATTRIBUTE_NORMAL              : constant := 16#80#;
   FILE_ATTRIBUTE_TEMPORARY           : constant := 16#100#;
   FILE_ATTRIBUTE_ATOMIC_WRITE        : constant := 16#200#;
   FILE_ATTRIBUTE_XACTION_WRITE       : constant := 16#400#;
   FILE_ATTRIBUTE_COMPRESSED          : constant := 16#800#;
   FILE_NOTIFY_CHANGE_FILE_NAME       : constant := 16#1#;
   FILE_NOTIFY_CHANGE_DIR_NAME        : constant := 16#2#;
   FILE_NOTIFY_CHANGE_ATTRIBUTES      : constant := 16#4#;
   FILE_NOTIFY_CHANGE_SIZE            : constant := 16#8#;
   FILE_NOTIFY_CHANGE_LAST_WRITE      : constant := 16#10#;
   FILE_NOTIFY_CHANGE_SECURITY        : constant := 16#100#;
   MAILSLOT_NO_MESSAGE                : constant DWORD      := -1;
   MAILSLOT_WAIT_FOREVER              : constant DWORD      := -1;
   FILE_CASE_SENSITIVE_SEARCH         : constant := 16#1#;
   FILE_CASE_PRESERVED_NAMES          : constant := 16#2#;
   FILE_UNICODE_ON_DISK               : constant := 16#4#;
   FILE_PERSISTENT_ACLS               : constant := 16#8#;
   FILE_FILE_COMPRESSION              : constant := 16#10#;
   FILE_VOLUME_IS_COMPRESSED          : constant := 16#8000#;
   IO_COMPLETION_MODIFY_STATE         : constant := 16#2#;
   IO_COMPLETION_ALL_ACCESS           : constant := 16#1f0003#;
   DUPLICATE_CLOSE_SOURCE             : constant := 16#1#;
   DUPLICATE_SAME_ACCESS              : constant := 16#2#;
   DELETE                             : constant := 16#10000#;
   READ_CONTROL                       : constant := 16#20000#;
   WRITE_DAC                          : constant := 16#40000#;
   WRITE_OWNER                        : constant := 16#80000#;
   SYNCHRONIZE                        : constant := 16#100000#;
   STANDARD_RIGHTS_REQUIRED           : constant := 16#f0000#;
   STANDARD_RIGHTS_READ               : constant := 16#20000#;
   STANDARD_RIGHTS_WRITE              : constant := 16#20000#;
   STANDARD_RIGHTS_EXECUTE            : constant := 16#20000#;
   STANDARD_RIGHTS_ALL                : constant := 16#1f0000#;
   SPECIFIC_RIGHTS_ALL                : constant := 16#ffff#;
   ACCESS_SYSTEM_SECURITY             : constant := 16#1000000#;
   MAXIMUM_ALLOWED                    : constant := 16#2000000#;
   GENERIC_READ                       : constant := 16#80000000#;
   GENERIC_WRITE                      : constant := 16#40000000#;
   GENERIC_EXECUTE                    : constant := 16#20000000#;
   GENERIC_ALL                        : constant := 16#10000000#;
   SID_REVISION                       : constant := 1;
   SID_MAX_SUB_AUTHORITIES            : constant := 15;
   SID_RECOMMENDED_SUB_AUTHORITIES    : constant := 1;
   SECURITY_NULL_RID                  : constant := 16#0#;
   SECURITY_WORLD_RID                 : constant := 16#0#;
   SECURITY_LOCAL_RID                 : constant := 16#0#;
   SECURITY_CREATOR_OWNER_RID         : constant := 16#0#;
   SECURITY_CREATOR_GROUP_RID         : constant := 16#1#;
   SECURITY_DIALUP_RID                : constant := 16#1#;
   SECURITY_NETWORK_RID               : constant := 16#2#;
   SECURITY_BATCH_RID                 : constant := 16#3#;
   SECURITY_INTERACTIVE_RID           : constant := 16#4#;
   SECURITY_SERVICE_RID               : constant := 16#6#;
   SECURITY_ANONYMOUS_LOGON_RID       : constant := 16#7#;
   SECURITY_LOGON_IDS_RID             : constant := 16#5#;
   SECURITY_LOGON_IDS_RID_COUNT       : constant := 3;
   SECURITY_LOCAL_SYSTEM_RID          : constant := 16#12#;
   SECURITY_NT_NON_UNIQUE             : constant := 16#15#;
   SECURITY_BUILTIN_DOMAIN_RID        : constant := 16#20#;
   DOMAIN_USER_RID_ADMIN              : constant := 16#1f4#;
   DOMAIN_USER_RID_GUEST              : constant := 16#1f5#;
   DOMAIN_GROUP_RID_ADMINS            : constant := 16#200#;
   DOMAIN_GROUP_RID_USERS             : constant := 16#201#;
   DOMAIN_GROUP_RID_GUESTS            : constant := 16#202#;
   DOMAIN_ALIAS_RID_ADMINS            : constant := 16#220#;
   DOMAIN_ALIAS_RID_USERS             : constant := 16#221#;
   DOMAIN_ALIAS_RID_GUESTS            : constant := 16#222#;
   DOMAIN_ALIAS_RID_POWER_USERS       : constant := 16#223#;
   DOMAIN_ALIAS_RID_ACCOUNT_OPS       : constant := 16#224#;
   DOMAIN_ALIAS_RID_SYSTEM_OPS        : constant := 16#225#;
   DOMAIN_ALIAS_RID_PRINT_OPS         : constant := 16#226#;
   DOMAIN_ALIAS_RID_BACKUP_OPS        : constant := 16#227#;
   DOMAIN_ALIAS_RID_REPLICATOR        : constant := 16#228#;
   SE_GROUP_MANDATORY                 : constant := 16#1#;
   SE_GROUP_ENABLED_BY_DEFAULT        : constant := 16#2#;
   SE_GROUP_ENABLED                   : constant := 16#4#;
   SE_GROUP_OWNER                     : constant := 16#8#;
   SE_GROUP_LOGON_ID                  : constant := 16#c0000000#;
   ACL_REVISION                       : constant := 2;
   ACL_REVISION1                      : constant := 1;
   ACL_REVISION2                      : constant := 2;
   ACCESS_ALLOWED_ACE_TYPE            : constant := 16#0#;
   ACCESS_DENIED_ACE_TYPE             : constant := 16#1#;
   SYSTEM_AUDIT_ACE_TYPE              : constant := 16#2#;
   SYSTEM_ALARM_ACE_TYPE              : constant := 16#3#;
   OBJECT_INHERIT_ACE                 : constant := 16#1#;
   CONTAINER_INHERIT_ACE              : constant := 16#2#;
   NO_PROPAGATE_INHERIT_ACE           : constant := 16#4#;
   INHERIT_ONLY_ACE                   : constant := 16#8#;
   VALID_INHERIT_FLAGS                : constant := 16#f#;
   SUCCESSFUL_ACCESS_ACE_FLAG         : constant := 16#40#;
   FAILED_ACCESS_ACE_FLAG             : constant := 16#80#;
   SECURITY_DESCRIPTOR_REVISION       : constant := 1;
   SECURITY_DESCRIPTOR_REVISION1      : constant := 1;
   SECURITY_DESCRIPTOR_MIN_LENGTH     : constant := 20;
   SE_OWNER_DEFAULTED                 : constant := 16#1#;
   SE_GROUP_DEFAULTED                 : constant := 16#2#;
   SE_DACL_PRESENT                    : constant := 16#4#;
   SE_DACL_DEFAULTED                  : constant := 16#8#;
   SE_SACL_PRESENT                    : constant := 16#10#;
   SE_SACL_DEFAULTED                  : constant := 16#20#;
   SE_SELF_RELATIVE                   : constant := 16#8000#;
   SE_PRIVILEGE_ENABLED_BY_DEFAULT    : constant := 16#1#;
   SE_PRIVILEGE_ENABLED               : constant := 16#2#;
   SE_PRIVILEGE_REMOVED               : constant := 16#4#;
   SE_PRIVILEGE_USED_FOR_ACCESS       : constant := 16#80000000#;
   PRIVILEGE_SET_ALL_NECESSARY        : constant := 1;
   SECURITY_DYNAMIC_TRACKING          : constant := 1;
   SECURITY_STATIC_TRACKING           : constant := 0;
   TOKEN_ASSIGN_PRIMARY               : constant := 16#1#;
   TOKEN_DUPLICATE                    : constant := 16#2#;
   TOKEN_IMPERSONATE                  : constant := 16#4#;
   TOKEN_QUERY                        : constant := 16#8#;
   TOKEN_QUERY_SOURCE                 : constant := 16#10#;
   TOKEN_ADJUST_PRIVILEGES            : constant := 16#20#;
   TOKEN_ADJUST_GROUPS                : constant := 16#40#;
   TOKEN_ADJUST_DEFAULT               : constant := 16#80#;
   TOKEN_ADJUST_SESSIONID             : constant := 16#100#;
   TOKEN_ALL_ACCESS                   : constant := 16#f01ff#;
   TOKEN_READ                         : constant := 16#20008#;
   TOKEN_WRITE                        : constant := 16#200e0#;
   TOKEN_EXECUTE                      : constant := 16#20000#;
   TOKEN_SOURCE_LENGTH                : constant := 8;
   OWNER_SECURITY_INFORMATION         : constant := 16#1#;
   GROUP_SECURITY_INFORMATION         : constant := 16#2#;
   DACL_SECURITY_INFORMATION          : constant := 16#4#;
   SACL_SECURITY_INFORMATION          : constant := 16#8#;
   IMAGE_DOS_SIGNATURE                : constant := 16#5a4d#;
   IMAGE_OS2_SIGNATURE                : constant := 16#454e#;
   IMAGE_OS2_SIGNATURE_LE             : constant := 16#454c#;
   IMAGE_NT_SIGNATURE                 : constant := 16#4550#;
   IMAGE_SIZEOF_FILE_HEADER           : constant := 20;
   IMAGE_FILE_RELOCS_STRIPPED         : constant := 16#1#;
   IMAGE_FILE_EXECUTABLE_IMAGE        : constant := 16#2#;
   IMAGE_FILE_LINE_NUMS_STRIPPED      : constant := 16#4#;
   IMAGE_FILE_LOCAL_SYMS_STRIPPED     : constant := 16#8#;
   IMAGE_FILE_BYTES_REVERSED_LO       : constant := 16#80#;
   IMAGE_FILE_32BIT_MACHINE           : constant := 16#100#;
   IMAGE_FILE_DEBUG_STRIPPED          : constant := 16#200#;
   IMAGE_FILE_SYSTEM                  : constant := 16#1000#;
   IMAGE_FILE_DLL                     : constant := 16#2000#;
   IMAGE_FILE_BYTES_REVERSED_HI       : constant := 16#8000#;
   IMAGE_FILE_MACHINE_UNKNOWN         : constant := 0;
   IMAGE_FILE_MACHINE_I386            : constant := 16#14c#;
   IMAGE_FILE_MACHINE_R3000           : constant := 16#162#;
   IMAGE_FILE_MACHINE_R4000           : constant := 16#166#;
   IMAGE_FILE_MACHINE_ALPHA           : constant := 16#184#;
   IMAGE_FILE_MACHINE_POWERPC         : constant := 16#1f0#;
   IMAGE_NUMBEROF_DIRECTORY_ENTRIES   : constant := 16;
   IMAGE_SIZEOF_ROM_OPTIONAL_HEADER   : constant := 56;
   IMAGE_SIZEOF_STD_OPTIONAL_HEADER   : constant := 28;
   IMAGE_SIZEOF_NT_OPTIONAL_HEADER    : constant := 224;
   IMAGE_NT_OPTIONAL_HDR_MAGIC        : constant := 16#10b#;
   IMAGE_ROM_OPTIONAL_HDR_MAGIC       : constant := 16#107#;
   IMAGE_SUBSYSTEM_UNKNOWN            : constant := 0;
   IMAGE_SUBSYSTEM_NATIVE             : constant := 1;
   IMAGE_SUBSYSTEM_WINDOWS_GUI        : constant := 2;
   IMAGE_SUBSYSTEM_WINDOWS_CUI        : constant := 3;
   IMAGE_SUBSYSTEM_OS2_CUI            : constant := 5;
   IMAGE_SUBSYSTEM_POSIX_CUI          : constant := 7;
   IMAGE_DIRECTORY_ENTRY_EXPORT       : constant := 0;
   IMAGE_DIRECTORY_ENTRY_IMPORT       : constant := 1;
   IMAGE_DIRECTORY_ENTRY_RESOURCE     : constant := 2;
   IMAGE_DIRECTORY_ENTRY_EXCEPTION    : constant := 3;
   IMAGE_DIRECTORY_ENTRY_SECURITY     : constant := 4;
   IMAGE_DIRECTORY_ENTRY_BASERELOC    : constant := 5;
   IMAGE_DIRECTORY_ENTRY_DEBUG        : constant := 6;
   IMAGE_DIRECTORY_ENTRY_COPYRIGHT    : constant := 7;
   IMAGE_DIRECTORY_ENTRY_GLOBALPTR    : constant := 8;
   IMAGE_DIRECTORY_ENTRY_TLS          : constant := 9;
   IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG  : constant := 10;
   IMAGE_SIZEOF_SHORT_NAME            : constant := 8;
   IMAGE_SIZEOF_SECTION_HEADER        : constant := 40;
   IMAGE_SCN_TYPE_NO_PAD              : constant := 16#8#;
   IMAGE_SCN_CNT_CODE                 : constant := 16#20#;
   IMAGE_SCN_CNT_INITIALIZED_DATA     : constant := 16#40#;
   IMAGE_SCN_CNT_UNINITIALIZED_DATA   : constant := 16#80#;
   IMAGE_SCN_LNK_OTHER                : constant := 16#100#;
   IMAGE_SCN_LNK_INFO                 : constant := 16#200#;
   IMAGE_SCN_LNK_REMOVE               : constant := 16#800#;
   IMAGE_SCN_LNK_COMDAT               : constant := 16#1000#;
   IMAGE_SCN_ALIGN_1BYTES             : constant := 16#100000#;
   IMAGE_SCN_ALIGN_2BYTES             : constant := 16#200000#;
   IMAGE_SCN_ALIGN_4BYTES             : constant := 16#300000#;
   IMAGE_SCN_ALIGN_8BYTES             : constant := 16#400000#;
   IMAGE_SCN_ALIGN_16BYTES            : constant := 16#500000#;
   IMAGE_SCN_ALIGN_32BYTES            : constant := 16#600000#;
   IMAGE_SCN_ALIGN_64BYTES            : constant := 16#700000#;
   IMAGE_SCN_MEM_DISCARDABLE          : constant := 16#2000000#;
   IMAGE_SCN_MEM_NOT_CACHED           : constant := 16#4000000#;
   IMAGE_SCN_MEM_NOT_PAGED            : constant := 16#8000000#;
   IMAGE_SCN_MEM_SHARED               : constant := 16#10000000#;
   IMAGE_SCN_MEM_EXECUTE              : constant := 16#20000000#;
   IMAGE_SCN_MEM_READ                 : constant := 16#40000000#;
   IMAGE_SCN_MEM_WRITE                : constant := 16#80000000#;
   IMAGE_SIZEOF_SYMBOL                : constant := 18;
   IMAGE_SYM_UNDEFINED                : constant SHORT      := 0;
   IMAGE_SYM_ABSOLUTE                 : constant SHORT      := -1;
   IMAGE_SYM_DEBUG                    : constant SHORT      := -2;
   IMAGE_SYM_TYPE_NULL                : constant := 0;
   IMAGE_SYM_TYPE_VOID                : constant := 1;
   IMAGE_SYM_TYPE_CHAR                : constant := 2;
   IMAGE_SYM_TYPE_SHORT               : constant := 3;
   IMAGE_SYM_TYPE_INT                 : constant := 4;
   IMAGE_SYM_TYPE_LONG                : constant := 5;
   IMAGE_SYM_TYPE_FLOAT               : constant := 6;
   IMAGE_SYM_TYPE_DOUBLE              : constant := 7;
   IMAGE_SYM_TYPE_STRUCT              : constant := 8;
   IMAGE_SYM_TYPE_UNION               : constant := 9;
   IMAGE_SYM_TYPE_ENUM                : constant := 10;
   IMAGE_SYM_TYPE_MOE                 : constant := 11;
   IMAGE_SYM_TYPE_BYTE                : constant := 12;
   IMAGE_SYM_TYPE_WORD                : constant := 13;
   IMAGE_SYM_TYPE_UINT                : constant := 14;
   IMAGE_SYM_TYPE_DWORD               : constant := 15;
   IMAGE_SYM_DTYPE_NULL               : constant := 0;
   IMAGE_SYM_DTYPE_POINTER            : constant := 1;
   IMAGE_SYM_DTYPE_FUNCTION           : constant := 2;
   IMAGE_SYM_DTYPE_ARRAY              : constant := 3;
   IMAGE_SYM_CLASS_END_OF_FUNCTION    : constant BYTE       := -1;
   IMAGE_SYM_CLASS_NULL               : constant := 0;
   IMAGE_SYM_CLASS_AUTOMATIC          : constant := 1;
   IMAGE_SYM_CLASS_EXTERNAL           : constant := 2;
   IMAGE_SYM_CLASS_STATIC             : constant := 3;
   IMAGE_SYM_CLASS_REGISTER           : constant := 4;
   IMAGE_SYM_CLASS_EXTERNAL_DEF       : constant := 5;
   IMAGE_SYM_CLASS_LABEL              : constant := 6;
   IMAGE_SYM_CLASS_UNDEFINED_LABEL    : constant := 7;
   IMAGE_SYM_CLASS_MEMBER_OF_STRUCT   : constant := 8;
   IMAGE_SYM_CLASS_ARGUMENT           : constant := 9;
   IMAGE_SYM_CLASS_STRUCT_TAG         : constant := 10;
   IMAGE_SYM_CLASS_MEMBER_OF_UNION    : constant := 11;
   IMAGE_SYM_CLASS_UNION_TAG          : constant := 12;
   IMAGE_SYM_CLASS_TYPE_DEFINITION    : constant := 13;
   IMAGE_SYM_CLASS_UNDEFINED_STATIC   : constant := 14;
   IMAGE_SYM_CLASS_ENUM_TAG           : constant := 15;
   IMAGE_SYM_CLASS_MEMBER_OF_ENUM     : constant := 16;
   IMAGE_SYM_CLASS_REGISTER_PARAM     : constant := 17;
   IMAGE_SYM_CLASS_BIT_FIELD          : constant := 18;
   IMAGE_SYM_CLASS_BLOCK              : constant := 100;
   IMAGE_SYM_CLASS_FUNCTION           : constant := 101;
   IMAGE_SYM_CLASS_END_OF_STRUCT      : constant := 102;
   IMAGE_SYM_CLASS_FILE               : constant := 103;
   IMAGE_SYM_CLASS_SECTION            : constant := 104;
   IMAGE_SYM_CLASS_WEAK_EXTERNAL      : constant := 105;
   N_BTMASK                           : constant := 8#17#;
   N_TMASK                            : constant := 8#60#;
   N_TMASK1                           : constant := 8#300#;
   N_TMASK2                           : constant := 8#360#;
   N_BTSHFT                           : constant := 4;
   N_TSHIFT                           : constant := 2;
   IMAGE_SIZEOF_AUX_SYMBOL            : constant := 18;
   IMAGE_COMDAT_SELECT_NODUPLICATES   : constant := 1;
   IMAGE_COMDAT_SELECT_ANY            : constant := 2;
   IMAGE_COMDAT_SELECT_SAME_SIZE      : constant := 3;
   IMAGE_COMDAT_SELECT_EXACT_MATCH    : constant := 4;
   IMAGE_COMDAT_SELECT_ASSOCIATIVE    : constant := 5;
   IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY : constant := 1;
   IMAGE_WEAK_EXTERN_SEARCH_LIBRARY   : constant := 2;
   IMAGE_WEAK_EXTERN_SEARCH_ALIAS     : constant := 3;
   IMAGE_SIZEOF_RELOCATION            : constant := 10;
   IMAGE_REL_I386_ABSOLUTE            : constant := 0;
   IMAGE_REL_I386_DIR16               : constant := 8#1#;
   IMAGE_REL_I386_REL16               : constant := 8#2#;
   IMAGE_REL_I386_DIR32               : constant := 8#6#;
   IMAGE_REL_I386_DIR32NB             : constant := 8#7#;
   IMAGE_REL_I386_SEG12               : constant := 8#11#;
   IMAGE_REL_I386_SECTION             : constant := 8#12#;
   IMAGE_REL_I386_SECREL              : constant := 8#13#;
   IMAGE_REL_I386_REL32               : constant := 8#24#;
   IMAGE_REL_MIPS_ABSOLUTE            : constant := 0;
   IMAGE_REL_MIPS_REFHALF             : constant := 8#1#;
   IMAGE_REL_MIPS_REFWORD             : constant := 8#2#;
   IMAGE_REL_MIPS_JMPADDR             : constant := 8#3#;
   IMAGE_REL_MIPS_REFHI               : constant := 8#4#;
   IMAGE_REL_MIPS_REFLO               : constant := 8#5#;
   IMAGE_REL_MIPS_GPREL               : constant := 8#6#;
   IMAGE_REL_MIPS_LITERAL             : constant := 8#7#;
   IMAGE_REL_MIPS_SECTION             : constant := 8#12#;
   IMAGE_REL_MIPS_SECREL              : constant := 8#13#;
   IMAGE_REL_MIPS_REFWORDNB           : constant := 8#42#;
   IMAGE_REL_MIPS_PAIR                : constant := 8#45#;
   IMAGE_REL_ALPHA_ABSOLUTE           : constant := 16#0#;
   IMAGE_REL_ALPHA_REFLONG            : constant := 16#1#;
   IMAGE_REL_ALPHA_REFQUAD            : constant := 16#2#;
   IMAGE_REL_ALPHA_GPREL32            : constant := 16#3#;
   IMAGE_REL_ALPHA_LITERAL            : constant := 16#4#;
   IMAGE_REL_ALPHA_LITUSE             : constant := 16#5#;
   IMAGE_REL_ALPHA_GPDISP             : constant := 16#6#;
   IMAGE_REL_ALPHA_BRADDR             : constant := 16#7#;
   IMAGE_REL_ALPHA_HINT               : constant := 16#8#;
   IMAGE_REL_ALPHA_INLINE_REFLONG     : constant := 16#9#;
   IMAGE_REL_ALPHA_REFHI              : constant := 16#a#;
   IMAGE_REL_ALPHA_REFLO              : constant := 16#b#;
   IMAGE_REL_ALPHA_PAIR               : constant := 16#c#;
   IMAGE_REL_ALPHA_MATCH              : constant := 16#d#;
   IMAGE_REL_ALPHA_SECTION            : constant := 16#e#;
   IMAGE_REL_ALPHA_SECREL             : constant := 16#f#;
   IMAGE_REL_ALPHA_REFLONGNB          : constant := 16#10#;
   IMAGE_REL_PPC_ABSOLUTE             : constant := 16#0#;
   IMAGE_REL_PPC_ADDR64               : constant := 16#1#;
   IMAGE_REL_PPC_ADDR32               : constant := 16#2#;
   IMAGE_REL_PPC_ADDR24               : constant := 16#3#;
   IMAGE_REL_PPC_ADDR16               : constant := 16#4#;
   IMAGE_REL_PPC_ADDR14               : constant := 16#5#;
   IMAGE_REL_PPC_REL24                : constant := 16#6#;
   IMAGE_REL_PPC_REL14                : constant := 16#7#;
   IMAGE_REL_PPC_TOCREL16             : constant := 16#8#;
   IMAGE_REL_PPC_TOCREL14             : constant := 16#9#;
   IMAGE_REL_PPC_ADDR32NB             : constant := 16#a#;
   IMAGE_REL_PPC_SECREL               : constant := 16#b#;
   IMAGE_REL_PPC_SECTION              : constant := 16#c#;
   IMAGE_REL_PPC_IFGLUE               : constant := 16#d#;
   IMAGE_REL_PPC_IMGLUE               : constant := 16#e#;
   IMAGE_REL_PPC_TYPEMASK             : constant := 16#ff#;
   IMAGE_REL_PPC_NEG                  : constant := 16#100#;
   IMAGE_REL_PPC_BRTAKEN              : constant := 16#200#;
   IMAGE_REL_PPC_BRNTAKEN             : constant := 16#400#;
   IMAGE_REL_PPC_TOCDEFN              : constant := 16#800#;
   IMAGE_SIZEOF_BASE_RELOCATION       : constant := 8;
   IMAGE_REL_BASED_ABSOLUTE           : constant := 0;
   IMAGE_REL_BASED_HIGH               : constant := 1;
   IMAGE_REL_BASED_LOW                : constant := 2;
   IMAGE_REL_BASED_HIGHLOW            : constant := 3;
   IMAGE_REL_BASED_HIGHADJ            : constant := 4;
   IMAGE_REL_BASED_MIPS_JMPADDR       : constant := 5;
   IMAGE_SIZEOF_LINENUMBER            : constant := 6;
   IMAGE_ARCHIVE_START_SIZE           : constant := 8;
   IMAGE_ARCHIVE_START                : constant CHAR_Array :=
      "!<arch>" & CHAR (ASCII.LF) & Nul;
   IMAGE_ARCHIVE_END                  : constant CHAR_Array :=
      "`" & CHAR (ASCII.LF) & Nul;
   IMAGE_ARCHIVE_PAD                  : constant CHAR_Array :=
      "" & CHAR (ASCII.LF) & Nul;
   IMAGE_ARCHIVE_LINKER_MEMBER        : constant CHAR_Array :=
      "/               " & Nul;
   IMAGE_ARCHIVE_LONGNAMES_MEMBER     : constant CHAR_Array :=
      "//              " & Nul;
   IMAGE_SIZEOF_ARCHIVE_MEMBER_HDR    : constant := 60;
   IMAGE_ORDINAL_FLAG                 : constant := 16#80000000#;
   IMAGE_RESOURCE_NAME_IS_STRING      : constant := 16#80000000#;
   IMAGE_RESOURCE_DATA_IS_DIRECTORY   : constant := 16#80000000#;
   IMAGE_DEBUG_TYPE_UNKNOWN           : constant := 0;
   IMAGE_DEBUG_TYPE_COFF              : constant := 1;
   IMAGE_DEBUG_TYPE_CODEVIEW          : constant := 2;
   IMAGE_DEBUG_TYPE_FPO               : constant := 3;
   IMAGE_DEBUG_TYPE_MISC              : constant := 4;
   IMAGE_DEBUG_TYPE_EXCEPTION         : constant := 5;
   IMAGE_DEBUG_TYPE_FIXUP             : constant := 6;
   IMAGE_DEBUG_TYPE_OMAP_TO_SRC       : constant := 7;
   IMAGE_DEBUG_TYPE_OMAP_FROM_SRC     : constant := 8;
   FRAME_FPO                          : constant := 0;
   FRAME_TRAP                         : constant := 1;
   FRAME_TSS                          : constant := 2;
   SIZEOF_RFPO_DATA                   : constant := 16;
   IMAGE_DEBUG_MISC_EXENAME           : constant := 1;
   IMAGE_SEPARATE_DEBUG_SIGNATURE     : constant := 16#4944#;
   HEAP_NO_SERIALIZE                  : constant := 16#1#;
   HEAP_GROWABLE                      : constant := 16#2#;
   HEAP_GENERATE_EXCEPTIONS           : constant := 16#4#;
   HEAP_ZERO_MEMORY                   : constant := 16#8#;
   HEAP_REALLOC_IN_PLACE_ONLY         : constant := 16#10#;
   HEAP_TAIL_CHECKING_ENABLED         : constant := 16#20#;
   HEAP_FREE_CHECKING_ENABLED         : constant := 16#40#;
   HEAP_DISABLE_COALESCE_ON_FREE      : constant := 16#80#;
   IS_TEXT_UNICODE_ASCII16            : constant := 16#1#;
   IS_TEXT_UNICODE_REVERSE_ASCII16    : constant := 16#10#;
   IS_TEXT_UNICODE_STATISTICS         : constant := 16#2#;
   IS_TEXT_UNICODE_REVERSE_STATISTICS : constant := 16#20#;
   IS_TEXT_UNICODE_CONTROLS           : constant := 16#4#;
   IS_TEXT_UNICODE_REVERSE_CONTROLS   : constant := 16#40#;
   IS_TEXT_UNICODE_SIGNATURE          : constant := 16#8#;
   IS_TEXT_UNICODE_REVERSE_SIGNATURE  : constant := 16#80#;
   IS_TEXT_UNICODE_ILLEGAL_CHARS      : constant := 16#100#;
   IS_TEXT_UNICODE_ODD_LENGTH         : constant := 16#200#;
   IS_TEXT_UNICODE_DBCS_LEADBYTE      : constant := 16#400#;
   IS_TEXT_UNICODE_NULL_BYTES         : constant := 16#1000#;
   IS_TEXT_UNICODE_UNICODE_MASK       : constant := 16#f#;
   IS_TEXT_UNICODE_REVERSE_MASK       : constant := 16#f0#;
   IS_TEXT_UNICODE_NOT_UNICODE_MASK   : constant := 16#f00#;
   IS_TEXT_UNICODE_NOT_ASCII_MASK     : constant := 16#f000#;
   COMPRESSION_FORMAT_NONE            : constant := 16#0#;
   COMPRESSION_FORMAT_DEFAULT         : constant := 16#1#;
   COMPRESSION_FORMAT_LZNT1           : constant := 16#2#;
   COMPRESSION_ENGINE_STANDARD        : constant := 16#0#;
   COMPRESSION_ENGINE_MAXIMUM         : constant := 16#100#;
   MESSAGE_RESOURCE_UNICODE           : constant := 16#1#;
   RTL_CRITSECT_TYPE                  : constant := 0;
   RTL_RESOURCE_TYPE                  : constant := 1;
   DLL_PROCESS_ATTACH                 : constant := 1;
   DLL_THREAD_ATTACH                  : constant := 2;
   DLL_THREAD_DETACH                  : constant := 3;
   DLL_PROCESS_DETACH                 : constant := 0;
   EVENTLOG_SEQUENTIAL_READ           : constant := 16#1#;
   EVENTLOG_SEEK_READ                 : constant := 16#2#;
   EVENTLOG_FORWARDS_READ             : constant := 16#4#;
   EVENTLOG_BACKWARDS_READ            : constant := 16#8#;
   EVENTLOG_SUCCESS                   : constant := 16#0#;
   EVENTLOG_ERROR_TYPE                : constant := 16#1#;
   EVENTLOG_WARNING_TYPE              : constant := 16#2#;
   EVENTLOG_INFORMATION_TYPE          : constant := 16#4#;
   EVENTLOG_AUDIT_SUCCESS             : constant := 16#8#;
   EVENTLOG_AUDIT_FAILURE             : constant := 16#10#;
   EVENTLOG_START_PAIRED_EVENT        : constant := 16#1#;
   EVENTLOG_END_PAIRED_EVENT          : constant := 16#2#;
   EVENTLOG_END_ALL_PAIRED_EVENTS     : constant := 16#4#;
   EVENTLOG_PAIRED_EVENT_ACTIVE       : constant := 16#8#;
   EVENTLOG_PAIRED_EVENT_INACTIVE     : constant := 16#10#;
   DBG_CONTINUE                       : constant DWORD      := 16#10002#;
   DBG_TERMINATE_THREAD               : constant DWORD      := 16#40010003#;
   DBG_TERMINATE_PROCESS              : constant DWORD      := 16#40010004#;
   DBG_CONTROL_C                      : constant DWORD      := 16#40010005#;
   DBG_CONTROL_BREAK                  : constant DWORD      := 16#40010008#;
   DBG_EXCEPTION_NOT_HANDLED          : constant DWORD      := 16#80010001#;
   KEY_QUERY_VALUE                    : constant := 16#1#;
   KEY_SET_VALUE                      : constant := 16#2#;
   KEY_CREATE_SUB_KEY                 : constant := 16#4#;
   KEY_ENUMERATE_SUB_KEYS             : constant := 16#8#;
   KEY_NOTIFY                         : constant := 16#10#;
   KEY_CREATE_LINK                    : constant := 16#20#;
   KEY_READ                           : constant := 16#20019#;
   KEY_WRITE                          : constant := 16#20006#;
   KEY_EXECUTE                        : constant := 16#20019#;
   KEY_ALL_ACCESS                     : constant := 16#f003f#;
   REG_OPTION_RESERVED                : constant := 16#0#;
   REG_OPTION_NON_VOLATILE            : constant := 16#0#;
   REG_OPTION_VOLATILE                : constant := 16#1#;
   REG_OPTION_CREATE_LINK             : constant := 16#2#;
   REG_OPTION_BACKUP_RESTORE          : constant := 16#4#;
   REG_LEGAL_OPTION                   : constant := 16#7#;
   REG_CREATED_NEW_KEY                : constant := 16#1#;
   REG_OPENED_EXISTING_KEY            : constant := 16#2#;
   REG_WHOLE_HIVE_VOLATILE            : constant := 16#1#;
   REG_REFRESH_HIVE                   : constant := 16#2#;
   REG_NOTIFY_CHANGE_NAME             : constant := 16#1#;
   REG_NOTIFY_CHANGE_ATTRIBUTES       : constant := 16#2#;
   REG_NOTIFY_CHANGE_LAST_SET         : constant := 16#4#;
   REG_NOTIFY_CHANGE_SECURITY         : constant := 16#8#;
   REG_LEGAL_CHANGE_FILTER            : constant := 16#f#;
   REG_NONE                           : constant := 0;
   REG_SZ                             : constant := 1;
   REG_EXPAND_SZ                      : constant := 2;
   REG_BINARY                         : constant := 3;
   REG_DWORD                          : constant := 4;
   REG_DWORD_LITTLE_ENDIAN            : constant := 4;
   REG_DWORD_BIG_ENDIAN               : constant := 5;
   REG_LINK                           : constant := 6;
   REG_MULTI_SZ                       : constant := 7;
   REG_RESOURCE_LIST                  : constant := 8;
   REG_FULL_RESOURCE_DESCRIPTOR       : constant := 9;
   REG_RESOURCE_REQUIREMENTS_LIST     : constant := 10;
   SERVICE_KERNEL_DRIVER              : constant := 16#1#;
   SERVICE_FILE_SYSTEM_DRIVER         : constant := 16#2#;
   SERVICE_ADAPTER                    : constant := 16#4#;
   SERVICE_RECOGNIZER_DRIVER          : constant := 16#8#;
   SERVICE_DRIVER                     : constant := 16#b#;
   SERVICE_WIN32_OWN_PROCESS          : constant := 16#10#;
   SERVICE_WIN32_SHARE_PROCESS        : constant := 16#20#;
   SERVICE_WIN32                      : constant := 16#30#;
   SERVICE_INTERACTIVE_PROCESS        : constant := 16#100#;
   SERVICE_TYPE_ALL                   : constant := 16#13f#;
   SERVICE_BOOT_START                 : constant := 16#0#;
   SERVICE_SYSTEM_START               : constant := 16#1#;
   SERVICE_AUTO_START                 : constant := 16#2#;
   SERVICE_DEMAND_START               : constant := 16#3#;
   SERVICE_DISABLED                   : constant := 16#4#;
   SERVICE_ERROR_IGNORE               : constant := 16#0#;
   SERVICE_ERROR_NORMAL               : constant := 16#1#;
   SERVICE_ERROR_SEVERE               : constant := 16#2#;
   SERVICE_ERROR_CRITICAL             : constant := 16#3#;
   TAPE_ERASE_SHORT                   : constant := 0;
   TAPE_ERASE_LONG                    : constant := 1;
   TAPE_LOAD                          : constant := 0;
   TAPE_UNLOAD                        : constant := 1;
   TAPE_TENSION                       : constant := 2;
   TAPE_LOCK                          : constant := 3;
   TAPE_UNLOCK                        : constant := 4;
   TAPE_FORMAT                        : constant := 5;
   TAPE_SETMARKS                      : constant := 0;
   TAPE_FILEMARKS                     : constant := 1;
   TAPE_SHORT_FILEMARKS               : constant := 2;
   TAPE_LONG_FILEMARKS                : constant := 3;
   TAPE_ABSOLUTE_POSITION             : constant := 0;
   TAPE_LOGICAL_POSITION              : constant := 1;
   TAPE_PSEUDO_LOGICAL_POSITION       : constant := 2;
   TAPE_REWIND                        : constant := 0;
   TAPE_ABSOLUTE_BLOCK                : constant := 1;
   TAPE_LOGICAL_BLOCK                 : constant := 2;
   TAPE_PSEUDO_LOGICAL_BLOCK          : constant := 3;
   TAPE_SPACE_END_OF_DATA             : constant := 4;
   TAPE_SPACE_RELATIVE_BLOCKS         : constant := 5;
   TAPE_SPACE_FILEMARKS               : constant := 6;
   TAPE_SPACE_SEQUENTIAL_FMKS         : constant := 7;
   TAPE_SPACE_SETMARKS                : constant := 8;
   TAPE_SPACE_SEQUENTIAL_SMKS         : constant := 9;
   TAPE_DRIVE_FIXED                   : constant := 16#1#;
   TAPE_DRIVE_SELECT                  : constant := 16#2#;
   TAPE_DRIVE_INITIATOR               : constant := 16#4#;
   TAPE_DRIVE_ERASE_SHORT             : constant := 16#10#;
   TAPE_DRIVE_ERASE_LONG              : constant := 16#20#;
   TAPE_DRIVE_ERASE_BOP_ONLY          : constant := 16#40#;
   TAPE_DRIVE_ERASE_IMMEDIATE         : constant := 16#80#;
   TAPE_DRIVE_TAPE_CAPACITY           : constant := 16#100#;
   TAPE_DRIVE_TAPE_REMAINING          : constant := 16#200#;
   TAPE_DRIVE_FIXED_BLOCK             : constant := 16#400#;
   TAPE_DRIVE_VARIABLE_BLOCK          : constant := 16#800#;
   TAPE_DRIVE_WRITE_PROTECT           : constant := 16#1000#;
   TAPE_DRIVE_EOT_WZ_SIZE             : constant := 16#2000#;
   TAPE_DRIVE_ECC                     : constant := 16#10000#;
   TAPE_DRIVE_COMPRESSION             : constant := 16#20000#;
   TAPE_DRIVE_PADDING                 : constant := 16#40000#;
   TAPE_DRIVE_REPORT_SMKS             : constant := 16#80000#;
   TAPE_DRIVE_GET_ABSOLUTE_BLK        : constant := 16#100000#;
   TAPE_DRIVE_GET_LOGICAL_BLK         : constant := 16#200000#;
   TAPE_DRIVE_SET_EOT_WZ_SIZE         : constant := 16#400000#;
   TAPE_DRIVE_RESERVED_BIT            : constant := 16#80000000#;
   TAPE_DRIVE_LOAD_UNLOAD             : constant := 16#80000001#;
   TAPE_DRIVE_TENSION                 : constant := 16#80000002#;
   TAPE_DRIVE_LOCK_UNLOCK             : constant := 16#80000004#;
   TAPE_DRIVE_REWIND_IMMEDIATE        : constant := 16#80000008#;
   TAPE_DRIVE_SET_BLOCK_SIZE          : constant := 16#80000010#;
   TAPE_DRIVE_LOAD_UNLD_IMMED         : constant := 16#80000020#;
   TAPE_DRIVE_TENSION_IMMED           : constant := 16#80000040#;
   TAPE_DRIVE_LOCK_UNLK_IMMED         : constant := 16#80000080#;
   TAPE_DRIVE_SET_ECC                 : constant := 16#80000100#;
   TAPE_DRIVE_SET_COMPRESSION         : constant := 16#80000200#;
   TAPE_DRIVE_SET_PADDING             : constant := 16#80000400#;
   TAPE_DRIVE_SET_REPORT_SMKS         : constant := 16#80000800#;
   TAPE_DRIVE_ABSOLUTE_BLK            : constant := 16#80001000#;
   TAPE_DRIVE_ABS_BLK_IMMED           : constant := 16#80002000#;
   TAPE_DRIVE_LOGICAL_BLK             : constant := 16#80004000#;
   TAPE_DRIVE_LOG_BLK_IMMED           : constant := 16#80008000#;
   TAPE_DRIVE_END_OF_DATA             : constant := 16#80010000#;
   TAPE_DRIVE_RELATIVE_BLKS           : constant := 16#80020000#;
   TAPE_DRIVE_FILEMARKS               : constant := 16#80040000#;
   TAPE_DRIVE_SEQUENTIAL_FMKS         : constant := 16#80080000#;
   TAPE_DRIVE_SETMARKS                : constant := 16#80100000#;
   TAPE_DRIVE_SEQUENTIAL_SMKS         : constant := 16#80200000#;
   TAPE_DRIVE_REVERSE_POSITION        : constant := 16#80400000#;
   TAPE_DRIVE_SPACE_IMMEDIATE         : constant := 16#80800000#;
   TAPE_DRIVE_WRITE_SETMARKS          : constant := 16#81000000#;
   TAPE_DRIVE_WRITE_FILEMARKS         : constant := 16#82000000#;
   TAPE_DRIVE_WRITE_SHORT_FMKS        : constant := 16#84000000#;
   TAPE_DRIVE_WRITE_LONG_FMKS         : constant := 16#88000000#;
   TAPE_DRIVE_WRITE_MARK_IMMED        : constant := 16#90000000#;
   TAPE_DRIVE_FORMAT                  : constant := 16#a0000000#;
   TAPE_DRIVE_FORMAT_IMMEDIATE        : constant := 16#c0000000#;
   TAPE_DRIVE_HIGH_FEATURES           : constant := 16#80000000#;
   TAPE_FIXED_PARTITIONS              : constant := 0;
   TAPE_SELECT_PARTITIONS             : constant := 1;
   TAPE_INITIATOR_PARTITIONS          : constant := 2;

   subtype TEXT is Win32.CHAR_Array;

   SE_CREATE_TOKEN_NAME        : constant TEXT :=
      "SeCreateTokenPrivilege" & Nul;
   SE_ASSIGNPRIMARYTOKEN_NAME  : constant TEXT :=
      "SeAssignPrimaryTokenPrivilege" & Nul;
   SE_LOCK_MEMORY_NAME         : constant TEXT :=
      "SeLockMemoryPrivilege" & Nul;
   SE_INCREASE_QUOTA_NAME      : constant TEXT :=
      "SeIncreaseQuotaPrivilege" & Nul;
   SE_UNSOLICITED_INPUT_NAME   : constant TEXT :=
      "SeUnsolicitedInputPrivilege" & Nul;
   SE_MACHINE_ACCOUNT_NAME     : constant TEXT :=
      "SeMachineAccountPrivilege" & Nul;
   SE_TCB_NAME                 : constant TEXT := "SeTcbPrivilege" & Nul;
   SE_SECURITY_NAME            : constant TEXT := "SeSecurityPrivilege" &
                                                  Nul;
   SE_TAKE_OWNERSHIP_NAME      : constant TEXT :=
      "SeTakeOwnershipPrivilege" & Nul;
   SE_LOAD_DRIVER_NAME         : constant TEXT :=
      "SeLoadDriverPrivilege" & Nul;
   SE_SYSTEM_PROFILE_NAME      : constant TEXT :=
      "SeSystemProfilePrivilege" & Nul;
   SE_SYSTEMTIME_NAME          : constant TEXT :=
      "SeSystemtimePrivilege" & Nul;
   SE_PROF_SINGLE_PROCESS_NAME : constant TEXT :=
      "SeProfileSingleProcessPrivilege" & Nul;
   SE_INC_BASE_PRIORITY_NAME   : constant TEXT :=
      "SeIncreaseBasePriorityPrivilege" & Nul;
   SE_CREATE_PAGEFILE_NAME     : constant TEXT :=
      "SeCreatePagefilePrivilege" & Nul;
   SE_CREATE_PERMANENT_NAME    : constant TEXT :=
      "SeCreatePermanentPrivilege" & Nul;
   SE_BACKUP_NAME              : constant TEXT := "SeBackupPrivilege" & Nul;
   SE_RESTORE_NAME             : constant TEXT := "SeRestorePrivilege" & Nul;
   SE_SHUTDOWN_NAME            : constant TEXT := "SeShutdownPrivilege" &
                                                  Nul;
   SE_DEBUG_NAME               : constant TEXT := "SeDebugPrivilege" & Nul;
   SE_AUDIT_NAME               : constant TEXT := "SeAuditPrivilege" & Nul;
   SE_SYSTEM_ENVIRONMENT_NAME  : constant TEXT :=
      "SeSystemEnvironmentPrivilege" & Nul;
   SE_CHANGE_NOTIFY_NAME       : constant TEXT :=
      "SeChangeNotifyPrivilege" & Nul;
   SE_REMOTE_SHUTDOWN_NAME     : constant TEXT :=
      "SeRemoteShutdownPrivilege" & Nul;
   SE_UNDOCK_NAME                 : constant TEXT := "SeUndockPrivilege" & Nul;
   SE_SYNC_AGENT_NAME             : constant TEXT :=
     "SeSyncAgentPrivilege" & Nul;
   SE_ENABLE_DELEGATION_NAME      : constant TEXT :=
     "SeEnableDelegationPrivilege" & Nul;
   SE_MANAGE_VOLUME_NAME          : constant TEXT :=
     "SeManageVolumePrivilege" & Nul;
   SE_IMPERSONATE_NAME            : constant TEXT :=
     "SeImpersonatePrivilege" & Nul;
   SE_CREATE_GLOBAL_NAME          : constant TEXT :=
     "SeCreateGlobalPrivilege" & Nul;
   SE_TRUSTED_CREDMAN_ACCESS_NAME : constant TEXT :=
     "SeTrustedCredManAccessPrivilege" & Nul;
   SE_RELABEL_NAME                : constant TEXT :=
     "SeRelabelPrivilege" & Nul;
   SE_INC_WORKING_SET_NAME        : constant TEXT :=
     "SeIncreaseWorkingSetPrivilege" & Nul;
   SE_TIME_ZONE_NAME              : constant TEXT :=
     "SeTimeZonePrivilege" & Nul;
   SE_CREATE_SYMBOLIC_LINK_NAME   : constant TEXT :=
     "SeCreateSymbolicLinkPrivilege" & Nul;

   type TCHAR is new Win32.CHAR;
   type TBYTE is new Win32.BYTE;
   type CCHAR is new Win32.CHAR;
   type LCID is new Win32.DWORD;
   type LANGID is new Win32.WORD;
   type BOOLEAN is new Win32.BYTE;
   type KSPIN_LOCK is new Win32.DWORD;
   type ACCESS_MASK is new Win32.DWORD;

   type WELL_KNOWN_SID_TYPE is (
      WinNullSid,
      WinWorldSid,
      WinLocalSid,
      WinCreatorOwnerSid,
      WinCreatorGroupSid,
      WinCreatorOwnerServerSid,
      WinCreatorGroupServerSid,
      WinNtAuthoritySid,
      WinDialupSid,
      WinNetworkSid,
      WinBatchSid,
      WinInteractiveSid,
      WinServiceSid,
      WinAnonymousSid,
      WinProxySid,
      WinEnterpriseControllersSid,
      WinSelfSid,
      WinAuthenticatedUserSid,
      WinRestrictedCodeSid,
      WinTerminalServerSid,
      WinRemoteLogonIdSid,
      WinLogonIdsSid,
      WinLocalSystemSid,
      WinLocalServiceSid,
      WinNetworkServiceSid,
      WinBuiltinDomainSid,
      WinBuiltinAdministratorsSid,
      WinBuiltinUsersSid,
      WinBuiltinGuestsSid,
      WinBuiltinPowerUsersSid,
      WinBuiltinAccountOperatorsSid,
      WinBuiltinSystemOperatorsSid,
      WinBuiltinPrintOperatorsSid,
      WinBuiltinBackupOperatorsSid,
      WinBuiltinReplicatorSid,
      WinBuiltinPreWindows2000CompatibleAccessSid,
      WinBuiltinRemoteDesktopUsersSid,
      WinBuiltinNetworkConfigurationOperatorsSid,
      WinAccountAdministratorSid,
      WinAccountGuestSid,
      WinAccountKrbtgtSid,
      WinAccountDomainAdminsSid,
      WinAccountDomainUsersSid,
      WinAccountDomainGuestsSid,
      WinAccountComputersSid,
      WinAccountControllersSid,
      WinAccountCertAdminsSid,
      WinAccountSchemaAdminsSid,
      WinAccountEnterpriseAdminsSid,
      WinAccountPolicyAdminsSid,
      WinAccountRasAndIasServersSid,
      WinNTLMAuthenticationSid,
      WinDigestAuthenticationSid,
      WinSChannelAuthenticationSid,
      WinThisOrganizationSid,
      WinOtherOrganizationSid,
      WinBuiltinIncomingForestTrustBuildersSid,
      WinBuiltinPerfMonitoringUsersSid,
      WinBuiltinPerfLoggingUsersSid,
      WinBuiltinAuthorizationAccessSid,
      WinBuiltinTerminalServerLicenseServersSid,
      WinBuiltinDCOMUsersSid,
      WinBuiltinIUsersSid,
      WinIUserSid,
      WinBuiltinCryptoOperatorsSid,
      WinUntrustedLabelSid,
      WinLowLabelSid,
      WinMediumLabelSid,
      WinHighLabelSid,
      WinSystemLabelSid,
      WinWriteRestrictedCodeSid,
      WinCreatorOwnerRightsSid,
      WinCacheablePrincipalsGroupSid,
      WinNonCacheablePrincipalsGroupSid,
      WinEnterpriseReadonlyControllersSid,
      WinAccountReadonlyControllersSid,
      WinBuiltinEventLogReadersGroup,
      WinNewEnterpriseReadonlyControllersSid,
      WinBuiltinCertSvcDComAccessGroup);

   for WELL_KNOWN_SID_TYPE use
     (WinNullSid                                  => 0,
      WinWorldSid                                 => 1,
      WinLocalSid                                 => 2,
      WinCreatorOwnerSid                          => 3,
      WinCreatorGroupSid                          => 4,
      WinCreatorOwnerServerSid                    => 5,
      WinCreatorGroupServerSid                    => 6,
      WinNtAuthoritySid                           => 7,
      WinDialupSid                                => 8,
      WinNetworkSid                               => 9,
      WinBatchSid                                 => 10,
      WinInteractiveSid                           => 11,
      WinServiceSid                               => 12,
      WinAnonymousSid                             => 13,
      WinProxySid                                 => 14,
      WinEnterpriseControllersSid                 => 15,
      WinSelfSid                                  => 16,
      WinAuthenticatedUserSid                     => 17,
      WinRestrictedCodeSid                        => 18,
      WinTerminalServerSid                        => 19,
      WinRemoteLogonIdSid                         => 20,
      WinLogonIdsSid                              => 21,
      WinLocalSystemSid                           => 22,
      WinLocalServiceSid                          => 23,
      WinNetworkServiceSid                        => 24,
      WinBuiltinDomainSid                         => 25,
      WinBuiltinAdministratorsSid                 => 26,
      WinBuiltinUsersSid                          => 27,
      WinBuiltinGuestsSid                         => 28,
      WinBuiltinPowerUsersSid                     => 29,
      WinBuiltinAccountOperatorsSid               => 30,
      WinBuiltinSystemOperatorsSid                => 31,
      WinBuiltinPrintOperatorsSid                 => 32,
      WinBuiltinBackupOperatorsSid                => 33,
      WinBuiltinReplicatorSid                     => 34,
      WinBuiltinPreWindows2000CompatibleAccessSid => 35,
      WinBuiltinRemoteDesktopUsersSid             => 36,
      WinBuiltinNetworkConfigurationOperatorsSid  => 37,
      WinAccountAdministratorSid                  => 38,
      WinAccountGuestSid                          => 39,
      WinAccountKrbtgtSid                         => 40,
      WinAccountDomainAdminsSid                   => 41,
      WinAccountDomainUsersSid                    => 42,
      WinAccountDomainGuestsSid                   => 43,
      WinAccountComputersSid                      => 44,
      WinAccountControllersSid                    => 45,
      WinAccountCertAdminsSid                     => 46,
      WinAccountSchemaAdminsSid                   => 47,
      WinAccountEnterpriseAdminsSid               => 48,
      WinAccountPolicyAdminsSid                   => 49,
      WinAccountRasAndIasServersSid               => 50,
      WinNTLMAuthenticationSid                    => 51,
      WinDigestAuthenticationSid                  => 52,
      WinSChannelAuthenticationSid                => 53,
      WinThisOrganizationSid                      => 54,
      WinOtherOrganizationSid                     => 55,
      WinBuiltinIncomingForestTrustBuildersSid    => 56,
      WinBuiltinPerfMonitoringUsersSid            => 57,
      WinBuiltinPerfLoggingUsersSid               => 58,
      WinBuiltinAuthorizationAccessSid            => 59,
      WinBuiltinTerminalServerLicenseServersSid   => 60,
      WinBuiltinDCOMUsersSid                      => 61,
      WinBuiltinIUsersSid                         => 62,
      WinIUserSid                                 => 63,
      WinBuiltinCryptoOperatorsSid                => 64,
      WinUntrustedLabelSid                        => 65,
      WinLowLabelSid                              => 66,
      WinMediumLabelSid                           => 67,
      WinHighLabelSid                             => 68,
      WinSystemLabelSid                           => 69,
      WinWriteRestrictedCodeSid                   => 70,
      WinCreatorOwnerRightsSid                    => 71,
      WinCacheablePrincipalsGroupSid              => 72,
      WinNonCacheablePrincipalsGroupSid           => 73,
      WinEnterpriseReadonlyControllersSid         => 74,
      WinAccountReadonlyControllersSid            => 75,
      WinBuiltinEventLogReadersGroup              => 76,
      WinNewEnterpriseReadonlyControllersSid      => 77,
      WinBuiltinCertSvcDComAccessGroup            => 78);

   for WELL_KNOWN_SID_TYPE'Size use 32;

   type SID_NAME_USE is (
      SidTypeUser,
      SidTypeGroup,
      SidTypeDomain,
      SidTypeAlias,
      SidTypeWellKnownGroup,
      SidTypeDeletedAccount,
      SidTypeInvalid,
      SidTypeUnknown);
   for SID_NAME_USE use
     (SidTypeUser           => 1,
      SidTypeGroup          => 2,
      SidTypeDomain         => 3,
      SidTypeAlias          => 4,
      SidTypeWellKnownGroup => 5,
      SidTypeDeletedAccount => 6,
      SidTypeInvalid        => 7,
      SidTypeUnknown        => 8);
   for SID_NAME_USE'Size use 32;

   type ACL_INFORMATION_CLASS is (AclRevisionInformation, AclSizeInformation);
   for ACL_INFORMATION_CLASS use
     (AclRevisionInformation => 1,
      AclSizeInformation     => 2);
   for ACL_INFORMATION_CLASS'Size use 32;

   type SECURITY_DESCRIPTOR_CONTROL is new Win32.WORD;

   type SECURITY_IMPERSONATION_LEVEL is (
      SecurityAnonymous,
      SecurityIdentification,
      SecurityImpersonation,
      SecurityDelegation);
   for SECURITY_IMPERSONATION_LEVEL'Size use 32;

   SECURITY_MAX_IMPERSONATION_LEVEL : constant SECURITY_IMPERSONATION_LEVEL :=
     SecurityDelegation;

   DEFAULT_IMPERSONATION_LEVEL : constant SECURITY_IMPERSONATION_LEVEL :=
     SecurityImpersonation;

   type SECURITY_CONTEXT_TRACKING_MODE is new Win32.BYTE;

   type TOKEN_TYPE is (TokenPrimary, TokenImpersonation);
   for TOKEN_TYPE use (TokenPrimary => 1, TokenImpersonation => 2);
   for TOKEN_TYPE'Size use 32;

   type TOKEN_INFORMATION_CLASS is (
      TokenUser,
      TokenGroups,
      TokenPrivileges,
      TokenOwner,
      TokenPrimaryGroup,
      TokenDefaultDacl,
      TokenSource,
      TokenType,
      TokenImpersonationLevel,
      TokenStatistics,
      TokenRestrictedSids,
      TokenSessionId,
      TokenGroupsAndPrivileges,
      TokenSessionReference,
      TokenSandBoxInert,
      TokenAuditPolicy,
      TokenOrigin,
      TokenElevationType,
      TokenLinkedToken,
      TokenElevation,
      TokenHasRestrictions,
      TokenAccessInformation,
      TokenVirtualizationAllowed,
      TokenVirtualizationEnabled,
      TokenIntegrityLevel,
      TokenUIAccess,
      TokenMandatoryPolicy,
      TokenLogonSid,
      MaxTokenInfoClass);

   for TOKEN_INFORMATION_CLASS use
     (TokenUser                  => 1,
      TokenGroups                => 2,
      TokenPrivileges            => 3,
      TokenOwner                 => 4,
      TokenPrimaryGroup          => 5,
      TokenDefaultDacl           => 6,
      TokenSource                => 7,
      TokenType                  => 8,
      TokenImpersonationLevel    => 9,
      TokenStatistics            => 10,
      TokenRestrictedSids        => 11,
      TokenSessionId             => 12,
      TokenGroupsAndPrivileges   => 13,
      TokenSessionReference      => 14,
      TokenSandBoxInert          => 15,
      TokenAuditPolicy           => 16,
      TokenOrigin                => 17,
      TokenElevationType         => 18,
      TokenLinkedToken           => 19,
      TokenElevation             => 20,
      TokenHasRestrictions       => 21,
      TokenAccessInformation     => 22,
      TokenVirtualizationAllowed => 23,
      TokenVirtualizationEnabled => 24,
      TokenIntegrityLevel        => 25,
      TokenUIAccess              => 26,
      TokenMandatoryPolicy       => 27,
      TokenLogonSid              => 28,
      MaxTokenInfoClass          => 29);
   for TOKEN_INFORMATION_CLASS'Size use 32;

   type SECURITY_INFORMATION is new Win32.DWORD;

   type SERVICE_NODE_TYPE is (
      DriverType,
      FileSystemType,
      AdapterType,
      RecognizerType,
      Win32ServiceOwnProcess,
      Win32ServiceShareProcess);
   for SERVICE_NODE_TYPE use
     (DriverType               => 1,
      FileSystemType           => 2,
      AdapterType              => 4,
      RecognizerType           => 8,
      Win32ServiceOwnProcess   => 16,
      Win32ServiceShareProcess => 32);
   for SERVICE_NODE_TYPE'Size use 32;

   type SERVICE_LOAD_TYPE is (
      BootLoad,
      SystemLoad,
      AutoLoad,
      DemandLoad,
      DisableLoad);
   for SERVICE_LOAD_TYPE'Size use 32;

   type SERVICE_ERROR_TYPE is (
      IgnoreError,
      NormalError,
      SevereError,
      CriticalError);
   for SERVICE_ERROR_TYPE use
     (IgnoreError   => SERVICE_ERROR_IGNORE,
      NormalError   => SERVICE_ERROR_NORMAL,
      SevereError   => SERVICE_ERROR_SEVERE,
      CriticalError => SERVICE_ERROR_CRITICAL);
   for SERVICE_ERROR_TYPE'Size use 32;

   subtype PTCHAR is Win32.PCHAR;
   subtype PTBYTE is Win32.PBYTE;
   subtype PTSTR is Win32.PSTR;
   subtype LPTCH is PTCHAR;
   subtype PTCH is PTCHAR;
   subtype LPTSTR is PTSTR;
   subtype TCHAR_Array is Win32.CHAR_Array;

   subtype LPCTSTR is Win32.PCSTR;

   subtype HANDLE is Win32.PVOID;
   type PHANDLE is access all HANDLE;

   type PLCID is access all LCID;
   subtype PACCESS_TOKEN is Win32.PVOID;
   subtype PSECURITY_DESCRIPTOR is Win32.PVOID;
   subtype PSID is Win32.PVOID;
   type PACCESS_MASK is access all ACCESS_MASK;
   type PSECURITY_DESCRIPTOR_CONTROL is access all SECURITY_DESCRIPTOR_CONTROL;
   type PSECURITY_CONTEXT_TRACKING_MODE is access all
     SECURITY_CONTEXT_TRACKING_MODE;
   type PSECURITY_INFORMATION is access all SECURITY_INFORMATION;
   type PPDWORD is access all Win32.PDWORD;
   type PPWORD is access all Win32.PWORD;

   type anonymous1_t;
   type LARGE_INTEGER;
   type anonymous2_t;
   type ULARGE_INTEGER;
   type LIST_ENTRY;
   type SINGLE_LIST_ENTRY;
   type CONTEXT;
   type anonymous4_t;
   type union_anonymous6_t;
   type LDT_ENTRY;
   type EXCEPTION_RECORD;
   type EXCEPTION_POINTERS;
   type MEMORY_BASIC_INFORMATION;
   type GENERIC_MAPPING;
   type LUID_AND_ATTRIBUTES;
   type SID_IDENTIFIER_AUTHORITY;
   type SID;
   type SID_AND_ATTRIBUTES;
   type ACL;
   type ACE_HEADER;
   type ACCESS_ALLOWED_ACE;
   type ACCESS_DENIED_ACE;
   type SYSTEM_AUDIT_ACE;
   type SYSTEM_ALARM_ACE;
   type ACL_REVISION_INFORMATION;
   type ACL_SIZE_INFORMATION;
   type SECURITY_DESCRIPTOR;
   type PRIVILEGE_SET;
   type SECURITY_QUALITY_OF_SERVICE;
   type SE_IMPERSONATION_STATE;
   type TOKEN_USER;
   type TOKEN_GROUPS;
   type TOKEN_PRIVILEGES;
   type TOKEN_OWNER;
   type TOKEN_PRIMARY_GROUP;
   type TOKEN_DEFAULT_DACL;
   type TOKEN_SOURCE;
   type TOKEN_STATISTICS;
   type TOKEN_CONTROL;
   type IMAGE_DOS_HEADER;
   type IMAGE_OS2_HEADER;
   type IMAGE_FILE_HEADER;
   type IMAGE_DATA_DIRECTORY;
   type IMAGE_OPTIONAL_HEADER;
   type IMAGE_ROM_OPTIONAL_HEADER;
   type IMAGE_NT_HEADERS;
   type IMAGE_ROM_HEADERS;
   type union_anonymous21_t;
   type IMAGE_SECTION_HEADER;
   type anonymous22_t;
   type union_anonymous24_t;
   type IMAGE_SYMBOL;
   type anonymous25_t;
   type union_anonymous26_t;
   type anonymous27_t;
   type anonymous28_t;
   type union_anonymous29_t;
   type anonymous30_t;
   type anonymous32_t;
   type anonymous33_t;
   type IMAGE_AUX_SYMBOL;
   type IMAGE_RELOCATION;
   type IMAGE_BASE_RELOCATION;
   type union_anonymous34_t;
   type IMAGE_LINENUMBER;
   type IMAGE_ARCHIVE_MEMBER_HEADER;
   type IMAGE_EXPORT_DIRECTORY;
   type IMAGE_IMPORT_BY_NAME;
   type union_anonymous42_t;
   type IMAGE_THUNK_DATA;
   type IMAGE_IMPORT_DESCRIPTOR;
   type IMAGE_TLS_DIRECTORY;
   type IMAGE_RESOURCE_DIRECTORY;
   type IMAGE_RESOURCE_DIRECTORY_ENTRY;
   type IMAGE_RESOURCE_DIRECTORY_STRING;
   type IMAGE_RESOURCE_DIR_STRING_U;
   type IMAGE_RESOURCE_DATA_ENTRY;
   type IMAGE_LOAD_CONFIG_DIRECTORY;
   type IMAGE_RUNTIME_FUNCTION_ENTRY;
   type IMAGE_DEBUG_DIRECTORY;
   type IMAGE_COFF_SYMBOLS_HEADER;
   type IMAGE_DEBUG_MISC;
   type IMAGE_FUNCTION_ENTRY;
   type IMAGE_SEPARATE_DEBUG_HEADER;
   type MESSAGE_RESOURCE_ENTRY;
   type MESSAGE_RESOURCE_BLOCK;
   type MESSAGE_RESOURCE_DATA;
   type RTL_CRITICAL_SECTION;
   type RTL_CRITICAL_SECTION_DEBUG;
   type EVENTLOGRECORD;
   type TAPE_ERASE;
   type TAPE_PREPARE;
   type TAPE_WRITE_MARKS;
   type TAPE_GET_POSITION;
   type TAPE_SET_POSITION;
   type TAPE_GET_DRIVE_PARAMETERS;
   type TAPE_SET_DRIVE_PARAMETERS;
   type TAPE_GET_MEDIA_PARAMETERS;
   type TAPE_SET_MEDIA_PARAMETERS;
   type TAPE_CREATE_PARTITION;

   type PLARGE_INTEGER is access all LARGE_INTEGER;
   type PULARGE_INTEGER is access all ULARGE_INTEGER;
   subtype PLUID is PLARGE_INTEGER;
   type PLIST_ENTRY is access all LIST_ENTRY;
   type PSINGLE_LIST_ENTRY is access all SINGLE_LIST_ENTRY;
   type PCONTEXT is access all CONTEXT;
   type PLDT_ENTRY is access all LDT_ENTRY;
   type PEXCEPTION_RECORD is access all EXCEPTION_RECORD;
   type PEXCEPTION_POINTERS is access all EXCEPTION_POINTERS;
   type PMEMORY_BASIC_INFORMATION is access all MEMORY_BASIC_INFORMATION;
   type PGENERIC_MAPPING is access all GENERIC_MAPPING;
   type PLUID_AND_ATTRIBUTES is access all LUID_AND_ATTRIBUTES;
   type PISID is access all SID;
   type PSID_AND_ATTRIBUTES is access all SID_AND_ATTRIBUTES;
   type PACL is access all ACL;
   type PACE_HEADER is access all ACE_HEADER;
   type PACCESS_ALLOWED_ACE is access all ACCESS_ALLOWED_ACE;
   type PACCESS_DENIED_ACE is access all ACCESS_DENIED_ACE;
   type PSYSTEM_AUDIT_ACE is access all SYSTEM_AUDIT_ACE;
   type PSYSTEM_ALARM_ACE is access all SYSTEM_ALARM_ACE;
   type PACL_REVISION_INFORMATION is access all ACL_REVISION_INFORMATION;
   type PACL_SIZE_INFORMATION is access all ACL_SIZE_INFORMATION;
   type PISECURITY_DESCRIPTOR is access all SECURITY_DESCRIPTOR;
   type PPRIVILEGE_SET is access all PRIVILEGE_SET;
   type PSECURITY_QUALITY_OF_SERVICE is access all SECURITY_QUALITY_OF_SERVICE;
   type PSE_IMPERSONATION_STATE is access all SE_IMPERSONATION_STATE;
   type PTOKEN_USER is access all TOKEN_USER;
   type PTOKEN_GROUPS is access all TOKEN_GROUPS;
   type PTOKEN_PRIVILEGES is access all TOKEN_PRIVILEGES;
   type PTOKEN_OWNER is access all TOKEN_OWNER;
   type PTOKEN_PRIMARY_GROUP is access all TOKEN_PRIMARY_GROUP;
   type PTOKEN_DEFAULT_DACL is access all TOKEN_DEFAULT_DACL;
   type PTOKEN_SOURCE is access all TOKEN_SOURCE;
   type PTOKEN_STATISTICS is access all TOKEN_STATISTICS;
   type PTOKEN_CONTROL is access all TOKEN_CONTROL;
   type PIMAGE_DOS_HEADER is access all IMAGE_DOS_HEADER;
   type PIMAGE_OS2_HEADER is access all IMAGE_OS2_HEADER;
   type PIMAGE_FILE_HEADER is access all IMAGE_FILE_HEADER;
   type PIMAGE_DATA_DIRECTORY is access all IMAGE_DATA_DIRECTORY;
   function To_PIMAGE is new Ada.Unchecked_Conversion (
      System.Address,
      PIMAGE_DATA_DIRECTORY);
   type PIMAGE_OPTIONAL_HEADER is access all IMAGE_OPTIONAL_HEADER;
   type PIMAGE_ROM_OPTIONAL_HEADER is access all IMAGE_ROM_OPTIONAL_HEADER;
   type PIMAGE_NT_HEADERS is access all IMAGE_NT_HEADERS;
   type PIMAGE_ROM_HEADERS is access all IMAGE_ROM_HEADERS;
   type PIMAGE_SECTION_HEADER is access all IMAGE_SECTION_HEADER;
   type PIMAGE_SYMBOL is access all IMAGE_SYMBOL;
   type PIMAGE_AUX_SYMBOL is access all IMAGE_AUX_SYMBOL;
   type PIMAGE_RELOCATION is access all IMAGE_RELOCATION;
   type PIMAGE_BASE_RELOCATION is access all IMAGE_BASE_RELOCATION;
   type PIMAGE_LINENUMBER is access all IMAGE_LINENUMBER;
   type PIMAGE_ARCHIVE_MEMBER_HEADER is access all IMAGE_ARCHIVE_MEMBER_HEADER;
   type PIMAGE_EXPORT_DIRECTORY is access all IMAGE_EXPORT_DIRECTORY;
   type PIMAGE_IMPORT_BY_NAME is access all IMAGE_IMPORT_BY_NAME;
   type PIMAGE_THUNK_DATA is access all IMAGE_THUNK_DATA;
   type PIMAGE_IMPORT_DESCRIPTOR is access all IMAGE_IMPORT_DESCRIPTOR;
   type PIMAGE_TLS_DIRECTORY is access all IMAGE_TLS_DIRECTORY;
   type PIMAGE_RESOURCE_DIRECTORY is access all IMAGE_RESOURCE_DIRECTORY;
   type PIMAGE_RESOURCE_DIRECTORY_ENTRY is access all
     IMAGE_RESOURCE_DIRECTORY_ENTRY;
   type PIMAGE_RESOURCE_DIRECTORY_STRING is access all
     IMAGE_RESOURCE_DIRECTORY_STRING;
   type PIMAGE_RESOURCE_DIR_STRING_U is access all IMAGE_RESOURCE_DIR_STRING_U;
   type PIMAGE_RESOURCE_DATA_ENTRY is access all IMAGE_RESOURCE_DATA_ENTRY;
   type PIMAGE_LOAD_CONFIG_DIRECTORY is access all IMAGE_LOAD_CONFIG_DIRECTORY;
   type PIMAGE_RUNTIME_FUNCTION_ENTRY is access all
     IMAGE_RUNTIME_FUNCTION_ENTRY;
   type PIMAGE_DEBUG_DIRECTORY is access all IMAGE_DEBUG_DIRECTORY;
   type PIMAGE_COFF_SYMBOLS_HEADER is access all IMAGE_COFF_SYMBOLS_HEADER;
   type FPO_DATA is record
      ulOffStart : Win32.DWORD;
      cbProcSize : Win32.DWORD;
      cdwLocals  : Win32.DWORD;
      cdwParams  : Win32.WORD;
      cbProlog   : Win32.Bits8;
      cbRegs     : Win32.Bits3;
      fHasSEH    : Win32.Bits1;
      fUseBP     : Win32.Bits1;
      reserved   : Win32.Bits1;
      cbFrame    : Win32.Bits2;
   end record;
   for FPO_DATA use record
      ulOffStart at 0 range 0 .. 31;
      cbProcSize at 4 range 0 .. 31;
      cdwLocals  at 8 range 0 .. 31;
      cdwParams  at 12 range 0 .. 15;
      cbProlog   at 14 range 0 .. 7;
      cbRegs     at 15 range 0 .. 2;
      fHasSEH    at 15 range 3 .. 3;
      fUseBP     at 15 range 4 .. 4;
      reserved   at 15 range 5 .. 5;
      cbFrame    at 15 range 6 .. 7;
   end record;

   type PFPO_DATA is access all FPO_DATA;
   type PIMAGE_DEBUG_MISC is access all IMAGE_DEBUG_MISC;
   type PIMAGE_FUNCTION_ENTRY is access all IMAGE_FUNCTION_ENTRY;
   type PIMAGE_SEPARATE_DEBUG_HEADER is access all IMAGE_SEPARATE_DEBUG_HEADER;
   type PMESSAGE_RESOURCE_ENTRY is access all MESSAGE_RESOURCE_ENTRY;
   type PMESSAGE_RESOURCE_BLOCK is access all MESSAGE_RESOURCE_BLOCK;
   type PMESSAGE_RESOURCE_DATA is access all MESSAGE_RESOURCE_DATA;
   type PRTL_CRITICAL_SECTION_DEBUG is access all RTL_CRITICAL_SECTION_DEBUG;
   type PRTL_CRITICAL_SECTION is access all RTL_CRITICAL_SECTION;
   type PEVENTLOGRECORD is access all EVENTLOGRECORD;
   type PTAPE_ERASE is access all TAPE_ERASE;
   type PTAPE_PREPARE is access all TAPE_PREPARE;
   type PTAPE_WRITE_MARKS is access all TAPE_WRITE_MARKS;
   type PTAPE_GET_POSITION is access all TAPE_GET_POSITION;
   type PTAPE_SET_POSITION is access all TAPE_SET_POSITION;
   type PTAPE_GET_DRIVE_PARAMETERS is access all TAPE_GET_DRIVE_PARAMETERS;
   type PTAPE_SET_DRIVE_PARAMETERS is access all TAPE_SET_DRIVE_PARAMETERS;
   type PTAPE_GET_MEDIA_PARAMETERS is access all TAPE_GET_MEDIA_PARAMETERS;
   type PTAPE_SET_MEDIA_PARAMETERS is access all TAPE_SET_MEDIA_PARAMETERS;
   type PTAPE_CREATE_PARTITION is access all TAPE_CREATE_PARTITION;

   type anonymous1_t is record
      LowPart  : Win32.DWORD;
      HighPart : Win32.LONG;
   end record;
   pragma Convention (C_Pass_By_Copy, anonymous1_t);

   type LARGE_INTEGER_kind is (u_kind, QuadPart_kind);

   type LARGE_INTEGER (Which : LARGE_INTEGER_kind := u_kind) is record
      case Which is
         when u_kind =>
            u : anonymous1_t;
         when QuadPart_kind =>
            QuadPart : Win32.LONGLONG;
      end case;
   end record;

   pragma Unchecked_Union (LARGE_INTEGER);
   pragma Convention (C_Pass_By_Copy, LARGE_INTEGER);

   type anonymous2_t is record
      LowPart  : Win32.DWORD;
      HighPart : Win32.DWORD;
   end record;

   type ULARGE_INTEGER_kind is (u_kind, QuadPart_kind);

   type ULARGE_INTEGER (Which : ULARGE_INTEGER_kind := u_kind) is record
      case Which is
         when u_kind =>
            u : anonymous2_t;
         when QuadPart_kind =>
            QuadPart : Win32.DWORDLONG;
      end case;
   end record;

   pragma Unchecked_Union (ULARGE_INTEGER);

   subtype LUID is LARGE_INTEGER;

   type LIST_ENTRY is record
      Flink : PLIST_ENTRY;
      Blink : PLIST_ENTRY;
   end record;

   type SINGLE_LIST_ENTRY is record
      Next : PSINGLE_LIST_ENTRY;
   end record;

#if TARGET = "Win32" then
   type FLOATING_SAVE_AREA is record
      ControlWord   : Win32.DWORD;
      StatusWord    : Win32.DWORD;
      TagWord       : Win32.DWORD;
      ErrorOffset   : Win32.DWORD;
      ErrorSelector : Win32.DWORD;
      DataOffset    : Win32.DWORD;
      DataSelector  : Win32.DWORD;
      RegisterArea  : Win32.BYTE_Array (0 .. 79);
      Cr0NpxState   : Win32.DWORD;
   end record;
   pragma Convention (C, FLOATING_SAVE_AREA);

   type PFLOATING_SAVE_AREA is access all FLOATING_SAVE_AREA;

   type CONTEXT is record
      ContextFlags      : Win32.DWORD;
      Dr0               : Win32.DWORD;
      Dr1               : Win32.DWORD;
      Dr2               : Win32.DWORD;
      Dr3               : Win32.DWORD;
      Dr6               : Win32.DWORD;
      Dr7               : Win32.DWORD;
      FloatSave         : FLOATING_SAVE_AREA;
      SegGs             : Win32.DWORD;
      SegFs             : Win32.DWORD;
      SegEs             : Win32.DWORD;
      SegDs             : Win32.DWORD;
      Edi               : Win32.DWORD;
      Esi               : Win32.DWORD;
      Ebx               : Win32.DWORD;
      Edx               : Win32.DWORD;
      Ecx               : Win32.DWORD;
      Eax               : Win32.DWORD;
      Ebp               : Win32.DWORD;
      Eip               : Win32.DWORD;
      SegCs             : Win32.DWORD;
      EFLAGS            : Win32.DWORD;
      Esp               : Win32.DWORD;
      SegSs             : Win32.DWORD;
      ExtendedRegisters : Win32.BYTE_Array
                            (0 .. MAXIMUM_SUPPORTED_EXTENSION - 1);
   end record;
#else
   type M128A is record
      Low  : ULONGLONG;
      High : LONGLONG;
   end record;
   for M128A'Alignment use 16;
   pragma Convention (C, M128A);

   type M128A_Array is array (Natural range <>) of M128A;
   pragma Convention (C, M128A_Array);

   type XMM_SAVE_AREA32 is record
      ControlWord    : Win32.WORD;
      StatusWord     : Win32.WORD;
      TagWord        : Win32.BYTE;
      Reserved1      : Win32.BYTE;
      ErrorOpcode    : Win32.WORD;
      ErrorOffset    : Win32.DWORD;
      ErrorSelector  : Win32.WORD;
      Reserved2      : Win32.WORD;
      DataOffset     : Win32.DWORD;
      DataSelector   : Win32.WORD;
      Reserved3      : Win32.WORD;
      MxCsr          : Win32.DWORD;
      MxCsr_Mask     : Win32.DWORD;
      FloatRegisters : M128A_Array (0 .. 7);
      XmmRegisters   : M128A_Array (0 .. 15);
      Reserved4      : Win32.BYTE_Array (0 .. 95);
   end record;
   pragma Convention (C, XMM_SAVE_AREA32);

   type anonymous35_t is record
      Header : M128A_Array (0 .. 1);
      Legacy : M128A_Array (0 .. 7);
      Xmm0   : M128A;
      Xmm1   : M128A;
      Xmm2   : M128A;
      Xmm3   : M128A;
      Xmm4   : M128A;
      Xmm5   : M128A;
      Xmm6   : M128A;
      Xmm7   : M128A;
      Xmm8   : M128A;
      Xmm9   : M128A;
      Xmm10  : M128A;
      Xmm11  : M128A;
      Xmm12  : M128A;
      Xmm13  : M128A;
      Xmm14  : M128A;
      Xmm15  : M128A;
   end record;
   pragma Convention (C, anonymous35_t);

   type union_anonymous35_t_kind
     is (FltSave_Kind, FloatSave_Kind, Legacy_Kind);

   type union_anonymous35_t
     (Which : union_anonymous35_t_kind := FltSave_Kind) is
   record
      case Which is
         when FltSave_Kind =>
            FltSave : XMM_SAVE_AREA32;
         when FloatSave_Kind =>
            FloatSave : XMM_SAVE_AREA32;
         when Legacy_Kind =>
            Legacy : anonymous35_t;
      end case;
   end record;

   pragma Convention (C, union_anonymous35_t);
   pragma Unchecked_Union (union_anonymous35_t);

   type CONTEXT is record
      P1Home               : DWORD64;
      P2Home               : DWORD64;
      P3Home               : DWORD64;
      P4Home               : DWORD64;
      P5Home               : DWORD64;
      P6Home               : DWORD64;
      ContextFlags         : DWORD;
      MxCsr                : DWORD;
      SegCs                : WORD;
      SegDs                : WORD;
      SegEs                : WORD;
      SegFs                : WORD;
      SegGs                : WORD;
      SegSs                : WORD;
      EFlags               : DWORD;
      Dr0                  : DWORD64;
      Dr1                  : DWORD64;
      Dr2                  : DWORD64;
      Dr3                  : DWORD64;
      Dr6                  : DWORD64;
      Dr7                  : DWORD64;
      Rax                  : DWORD64;
      Rcx                  : DWORD64;
      Rdx                  : DWORD64;
      Rbx                  : DWORD64;
      Rsp                  : DWORD64;
      Rbp                  : DWORD64;
      Rsi                  : DWORD64;
      Rdi                  : DWORD64;
      R8                   : DWORD64;
      R9                   : DWORD64;
      R10                  : DWORD64;
      R11                  : DWORD64;
      R12                  : DWORD64;
      R13                  : DWORD64;
      R14                  : DWORD64;
      R15                  : DWORD64;
      Rip                  : DWORD64;
      Union                : union_anonymous35_t;
      VectorRegister       : M128A_Array (0 .. 25);
      VectorControl        : DWORD64;
      DebugControl         : DWORD64;
      LastBranchToRip      : DWORD64;
      LastBranchFromRip    : DWORD64;
      LastExceptionToRip   : DWORD64;
      LastExceptionFromRip : DWORD64;
   end record;
   for CONTEXT'Alignment use 16;
#end if;

   type anonymous4_t is record
      BaseMid : Win32.BYTE;
      Flags1  : Win32.BYTE;
      Flags2  : Win32.BYTE;
      BaseHi  : Win32.BYTE;
   end record;

   type anonymous5_t is record
      BaseMid     : Win32.Bits8;
      C_Type      : Win32.Bits5;
      Dpl         : Win32.Bits2;
      Pres        : Win32.Bits1;
      LimitHi     : Win32.Bits4;
      Sys         : Win32.Bits1;
      Reserved_0  : Win32.Bits1;
      Default_Big : Win32.Bits1;
      Granularity : Win32.Bits1;
      BaseHi      : Win32.Bits8;
   end record;
   for anonymous5_t use record
      BaseMid     at 0 range 0 .. 7;
      C_Type      at 1 range 0 .. 4;
      Dpl         at 1 range 5 .. 6;
      Pres        at 1 range 7 .. 7;
      LimitHi     at 2 range 0 .. 3;
      Sys         at 2 range 4 .. 4;
      Reserved_0  at 2 range 5 .. 5;
      Default_Big at 2 range 6 .. 6;
      Granularity at 2 range 7 .. 7;
      BaseHi      at 3 range 0 .. 7;
   end record;

   type union_anonymous6_t_kind is (Bytes_kind, Bits_kind);

   type union_anonymous6_t (Which : union_anonymous6_t_kind := Bytes_kind) is
      record
         case Which is
            when Bytes_kind =>
               Bytes : anonymous4_t;
            when Bits_kind =>
               Bits : anonymous5_t;
         end case;
      end record;

   pragma Convention (C, union_anonymous6_t);

   pragma Unchecked_Union (union_anonymous6_t);

   type LDT_ENTRY is record
      LimitLow : Win32.WORD;
      BaseLow  : Win32.WORD;
      HighWord : union_anonymous6_t;
   end record;

   type EXCEPTION_RECORD is record
      ExceptionCode        : Win32.DWORD;
      ExceptionFlags       : Win32.DWORD;
      ExceptionRecord      : PEXCEPTION_RECORD;
      ExceptionAddress     : Win32.PVOID;
      NumberParameters     : Win32.DWORD;
#if TARGET = "Win32" then
      ExceptionInformation : Win32.DWORD_Array (0 .. 14);
#else
      ExceptionInformation : Win32.DWORD64_Array (0 .. 14);
#end if;
   end record;
   for EXCEPTION_RECORD'Alignment use System.Word_Size / 8;

   type EXCEPTION_POINTERS is record
      ExceptionRecord : PEXCEPTION_RECORD;
      ContextRecord   : PCONTEXT;
   end record;

   type MEMORY_BASIC_INFORMATION is record
      BaseAddress       : Win32.PVOID;
      AllocationBase    : Win32.PVOID;
      AllocationProtect : Win32.DWORD;
      RegionSize        : Win32.Size_T;
      State             : Win32.DWORD;
      Protect           : Win32.DWORD;
      C_Type            : Win32.DWORD;
   end record;

   type GENERIC_MAPPING is record
      GenericRead    : ACCESS_MASK;
      GenericWrite   : ACCESS_MASK;
      GenericExecute : ACCESS_MASK;
      GenericAll     : ACCESS_MASK;
   end record;

   type LUID_AND_ATTRIBUTES is record
      Luid       : Win32.Winnt.LUID;
      Attributes : Win32.DWORD;
   end record;
   for LUID_AND_ATTRIBUTES'Alignment use 4;
   pragma Convention (C_Pass_By_Copy, LUID_AND_ATTRIBUTES);

   SYSTEM_LUID : LUID_AND_ATTRIBUTES;

   type LUID_AND_ATTRIBUTES_ARRAY is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased LUID_AND_ATTRIBUTES;

   type PLUID_AND_ATTRIBUTES_ARRAY is access all LUID_AND_ATTRIBUTES_ARRAY;

   type SID_IDENTIFIER_AUTHORITY is record
      Value : Win32.BYTE_Array (0 .. 5);
   end record;
   pragma Convention (C_Pass_By_Copy, SID_IDENTIFIER_AUTHORITY);

   type PSID_IDENTIFIER_AUTHORITY is access all SID_IDENTIFIER_AUTHORITY;

   SECURITY_NULL_SID_AUTHORITY    : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 0));
   SECURITY_WORLD_SID_AUTHORITY   : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 1));
   SECURITY_LOCAL_SID_AUTHORITY   : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 2));
   SECURITY_CREATOR_SID_AUTHORITY : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 3));
   SECURITY_NON_UNIQUE_AUTHORITY  : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 4));
   SECURITY_NT_AUTHORITY          : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 5));

   type SID is record
      Revision            : Win32.BYTE;
      SubAuthorityCount   : Win32.BYTE;
      IdentifierAuthority : SID_IDENTIFIER_AUTHORITY;
      SubAuthority        : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type PSID_NAME_USE is access all SID_NAME_USE;

   type SID_AND_ATTRIBUTES is record
      Sid        : PSID;
      Attributes : Win32.DWORD;
   end record;

   type SID_AND_ATTRIBUTES_ARRAY is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased SID_AND_ATTRIBUTES;

   type anonymous14_t is access all SID_AND_ATTRIBUTES_ARRAY;
   type PSID_AND_ATTRIBUTES_ARRAY is access all SID_AND_ATTRIBUTES_ARRAY;

   type ACL is record
      AclRevision : Win32.BYTE;
      Sbz1        : Win32.BYTE;
      AclSize     : Win32.WORD;
      AceCount    : Win32.WORD;
      Sbz2        : Win32.WORD;
   end record;

   type ACE_HEADER is record
      AceType  : Win32.BYTE;
      AceFlags : Win32.BYTE;
      AceSize  : Win32.WORD;
   end record;

   type ACCESS_ALLOWED_ACE is record
      Header   : ACE_HEADER;
      Mask     : ACCESS_MASK;
      SidStart : Win32.DWORD;
   end record;

   type ACCESS_DENIED_ACE is record
      Header   : ACE_HEADER;
      Mask     : ACCESS_MASK;
      SidStart : Win32.DWORD;
   end record;

   type SYSTEM_AUDIT_ACE is record
      Header   : ACE_HEADER;
      Mask     : ACCESS_MASK;
      SidStart : Win32.DWORD;
   end record;

   type SYSTEM_ALARM_ACE is record
      Header   : ACE_HEADER;
      Mask     : ACCESS_MASK;
      SidStart : Win32.DWORD;
   end record;

   type ACL_REVISION_INFORMATION is record
      AclRevision : Win32.DWORD;
   end record;

   type ACL_SIZE_INFORMATION is record
      AceCount      : Win32.DWORD;
      AclBytesInUse : Win32.DWORD;
      AclBytesFree  : Win32.DWORD;
   end record;

   type SECURITY_DESCRIPTOR is record
      Revision : Win32.BYTE;
      Sbz1     : Win32.BYTE;
      Control  : SECURITY_DESCRIPTOR_CONTROL;
      Owner    : PSID;
      Group    : PSID;
      Sacl     : PACL;
      Dacl     : PACL;
   end record;

   type PRIVILEGE_SET is record
      PrivilegeCount : Win32.DWORD;
      Control        : Win32.DWORD;
      Privilege      : LUID_AND_ATTRIBUTES_ARRAY;
   end record;

   type PSECURITY_IMPERSONATION_LEVEL is access all
     SECURITY_IMPERSONATION_LEVEL;

   type SECURITY_QUALITY_OF_SERVICE is record
      Length              : Win32.DWORD;
      ImpersonationLevel  : SECURITY_IMPERSONATION_LEVEL;
      ContextTrackingMode : SECURITY_CONTEXT_TRACKING_MODE;
      EffectiveOnly       : BOOLEAN;
   end record;

   type SE_IMPERSONATION_STATE is record
      Token         : PACCESS_TOKEN;
      CopyOnOpen    : BOOLEAN;
      EffectiveOnly : BOOLEAN;
      Level         : SECURITY_IMPERSONATION_LEVEL;
   end record;

   type HEAP_INFORMATION_CLASS is
     (HeapCompatibilityInformation,
      HeapEnableTerminationOnCorruption);

   for HEAP_INFORMATION_CLASS use
     (HeapCompatibilityInformation      => 0,
      HeapEnableTerminationOnCorruption => 1);
   for HEAP_INFORMATION_CLASS'Size use 32;

   type PTOKEN_TYPE is access all TOKEN_TYPE;
   type PTOKEN_INFORMATION_CLASS is access all TOKEN_INFORMATION_CLASS;

   type TOKEN_USER is record
      User : SID_AND_ATTRIBUTES;
   end record;

   type TOKEN_GROUPS is record
      GroupCount : Win32.DWORD;
      Groups     : SID_AND_ATTRIBUTES_ARRAY;
   end record;

   type TOKEN_PRIVILEGES is record
      PrivilegeCount : Win32.DWORD;
      Privileges     : LUID_AND_ATTRIBUTES_ARRAY;
   end record;

   type TOKEN_OWNER is record
      Owner : PSID;
   end record;

   type TOKEN_PRIMARY_GROUP is record
      PrimaryGroup : PSID;
   end record;

   type TOKEN_DEFAULT_DACL is record
      DefaultDacl : PACL;
   end record;

   type TOKEN_SOURCE is record
      SourceName       : Win32.CHAR_Array (0 .. 7);
      SourceIdentifier : LUID;
   end record;

   type TOKEN_STATISTICS is record
      TokenId            : LUID;
      AuthenticationId   : LUID;
      ExpirationTime     : LARGE_INTEGER;
      TokenType          : TOKEN_TYPE;
      ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL;
      DynamicCharged     : Win32.DWORD;
      DynamicAvailable   : Win32.DWORD;
      GroupCount         : Win32.DWORD;
      PrivilegeCount     : Win32.DWORD;
      ModifiedId         : LUID;
   end record;

   type TOKEN_CONTROL is record
      TokenId          : LUID;
      AuthenticationId : LUID;
      ModifiedId       : LUID;
      TokenSource      : TOKEN_SOURCE;
   end record;

   type IMAGE_DOS_HEADER is record
      e_magic    : Win32.WORD;
      e_cblp     : Win32.WORD;
      e_cp       : Win32.WORD;
      e_crlc     : Win32.WORD;
      e_cparhdr  : Win32.WORD;
      e_minalloc : Win32.WORD;
      e_maxalloc : Win32.WORD;
      e_ss       : Win32.WORD;
      e_sp       : Win32.WORD;
      e_csum     : Win32.WORD;
      e_ip       : Win32.WORD;
      e_cs       : Win32.WORD;
      e_lfarlc   : Win32.WORD;
      e_ovno     : Win32.WORD;
      e_res      : Win32.WORD_Array (0 .. 3);
      e_oemid    : Win32.WORD;
      e_oeminfo  : Win32.WORD;
      e_res2     : Win32.WORD_Array (0 .. 9);
      e_lfanew   : Win32.LONG;
   end record;

   for IMAGE_DOS_HEADER use record
      e_magic    at 0 range 0 .. 15;
      e_cblp     at 2 range 0 .. 15;
      e_cp       at 4 range 0 .. 15;
      e_crlc     at 6 range 0 .. 15;
      e_cparhdr  at 8 range 0 .. 15;
      e_minalloc at 10 range 0 .. 15;
      e_maxalloc at 12 range 0 .. 15;
      e_ss       at 14 range 0 .. 15;
      e_sp       at 16 range 0 .. 15;
      e_csum     at 18 range 0 .. 15;
      e_ip       at 20 range 0 .. 15;
      e_cs       at 22 range 0 .. 15;
      e_lfarlc   at 24 range 0 .. 15;
      e_ovno     at 26 range 0 .. 15;
      e_res      at 28 range 0 .. 63;
      e_oemid    at 36 range 0 .. 15;
      e_oeminfo  at 38 range 0 .. 15;
      e_res2     at 40 range 0 .. 159;
      e_lfanew   at 60 range 0 .. 31;
   end record;

   for IMAGE_DOS_HEADER'Size use 64 * 8;

   type IMAGE_OS2_HEADER is record
      ne_magic        : Win32.WORD;
      ne_ver          : Win32.CHAR;
      ne_rev          : Win32.CHAR;
      ne_enttab       : Win32.WORD;
      ne_cbenttab     : Win32.WORD;
      ne_crc          : Win32.LONG;
      ne_flags        : Win32.WORD;
      ne_autodata     : Win32.WORD;
      ne_heap         : Win32.WORD;
      ne_stack        : Win32.WORD;
      ne_csip         : Win32.LONG;
      ne_sssp         : Win32.LONG;
      ne_cseg         : Win32.WORD;
      ne_cmod         : Win32.WORD;
      ne_cbnrestab    : Win32.WORD;
      ne_segtab       : Win32.WORD;
      ne_rsrctab      : Win32.WORD;
      ne_restab       : Win32.WORD;
      ne_modtab       : Win32.WORD;
      ne_imptab       : Win32.WORD;
      ne_nrestab      : Win32.LONG;
      ne_cmovent      : Win32.WORD;
      ne_align        : Win32.WORD;
      ne_cres         : Win32.WORD;
      ne_exetyp       : Win32.BYTE;
      ne_flagsothers  : Win32.BYTE;
      ne_pretthunks   : Win32.WORD;
      ne_psegrefbytes : Win32.WORD;
      ne_swaparea     : Win32.WORD;
      ne_expver       : Win32.WORD;
   end record;

   type IMAGE_FILE_HEADER is record
      Machine              : Win32.WORD;
      NumberOfSections     : Win32.WORD;
      TimeDateStamp        : Win32.DWORD;
      PointerToSymbolTable : Win32.DWORD;
      NumberOfSymbols      : Win32.DWORD;
      SizeOfOptionalHeader : Win32.WORD;
      Characteristics      : Win32.WORD;
   end record;

   type IMAGE_DATA_DIRECTORY is record
      VirtualAddress : Win32.DWORD;
      Size           : Win32.DWORD;
   end record;
   for IMAGE_DATA_DIRECTORY'Alignment use 4;

   type anonymous18_t is
     array (Integer range 0 .. 15) of IMAGE_DATA_DIRECTORY;

   type IMAGE_OPTIONAL_HEADER is record
      Magic                       : Win32.WORD;
      MajorLinkerVersion          : Win32.BYTE;
      MinorLinkerVersion          : Win32.BYTE;
      SizeOfCode                  : Win32.DWORD;
      SizeOfInitializedData       : Win32.DWORD;
      SizeOfUninitializedData     : Win32.DWORD;
      AddressOfEntryPoint         : Win32.DWORD;
      BaseOfCode                  : Win32.DWORD;
#if TARGET = "Win32" then
      BaseOfData                  : Win32.DWORD;
      ImageBase                   : Win32.DWORD;
#else
      ImageBase                   : Win32.ULONGLONG;
#end if;
      SectionAlignment            : Win32.DWORD;
      FileAlignment               : Win32.DWORD;
      MajorOperatingSystemVersion : Win32.WORD;
      MinorOperatingSystemVersion : Win32.WORD;
      MajorImageVersion           : Win32.WORD;
      MinorImageVersion           : Win32.WORD;
      MajorSubsystemVersion       : Win32.WORD;
      MinorSubsystemVersion       : Win32.WORD;
      Win32VersionValue           : Win32.DWORD;
      SizeOfImage                 : Win32.DWORD;
      SizeOfHeaders               : Win32.DWORD;
      CheckSum                    : Win32.DWORD;
      Subsystem                   : Win32.WORD;
      DllCharacteristics          : Win32.WORD;
#if TARGET = "Win32" then
      SizeOfStackReserve          : Win32.DWORD;
      SizeOfStackCommit           : Win32.DWORD;
      SizeOfHeapReserve           : Win32.DWORD;
      SizeOfHeapCommit            : Win32.DWORD;
#else
      SizeOfStackReserve          : Win32.ULONGLONG;
      SizeOfStackCommit           : Win32.ULONGLONG;
      SizeOfHeapReserve           : Win32.ULONGLONG;
      SizeOfHeapCommit            : Win32.ULONGLONG;
#end if;
      LoaderFlags                 : Win32.DWORD;
      NumberOfRvaAndSizes         : Win32.DWORD;
      DataDirectory               : anonymous18_t;
   end record;
   for IMAGE_OPTIONAL_HEADER'Alignment use 4;

   type IMAGE_ROM_OPTIONAL_HEADER is record
      Magic                   : Win32.WORD;
      MajorLinkerVersion      : Win32.BYTE;
      MinorLinkerVersion      : Win32.BYTE;
      SizeOfCode              : Win32.DWORD;
      SizeOfInitializedData   : Win32.DWORD;
      SizeOfUninitializedData : Win32.DWORD;
      AddressOfEntryPoint     : Win32.DWORD;
      BaseOfCode              : Win32.DWORD;
      BaseOfData              : Win32.DWORD;
      BaseOfBss               : Win32.DWORD;
      GprMask                 : Win32.DWORD;
      CprMask                 : Win32.DWORD_Array (0 .. 3);
      GpValue                 : Win32.DWORD;
   end record;

   type IMAGE_NT_HEADERS is record
      Signature      : Win32.DWORD;
      FileHeader     : IMAGE_FILE_HEADER;
      OptionalHeader : IMAGE_OPTIONAL_HEADER;
   end record;

   type IMAGE_ROM_HEADERS is record
      FileHeader     : IMAGE_FILE_HEADER;
      OptionalHeader : IMAGE_ROM_OPTIONAL_HEADER;
   end record;

   type union_anonymous21_t_kind is (PhysicalAddress_kind, VirtualSize_kind);

   type union_anonymous21_t
     (Which : union_anonymous21_t_kind := PhysicalAddress_kind)
   is
      record
         case Which is
            when PhysicalAddress_kind =>
               PhysicalAddress : Win32.DWORD;
            when VirtualSize_kind =>
               VirtualSize : Win32.DWORD;
         end case;
      end record;

   pragma Convention (C, union_anonymous21_t);

   pragma Unchecked_Union (union_anonymous21_t);

   type IMAGE_SECTION_HEADER is record
      Name                 : Win32.BYTE_Array (0 .. 7);
      Misc                 : union_anonymous21_t;
      VirtualAddress       : Win32.DWORD;
      SizeOfRawData        : Win32.DWORD;
      PointerToRawData     : Win32.DWORD;
      PointerToRelocations : Win32.DWORD;
      PointerToLinenumbers : Win32.DWORD;
      NumberOfRelocations  : Win32.WORD;
      NumberOfLinenumbers  : Win32.WORD;
      Characteristics      : Win32.DWORD;
   end record;

   type anonymous22_t is record
      Short : Win32.DWORD;
      Long  : Win32.DWORD;
   end record;
   for anonymous22_t'Alignment use 2;

   type anonymous23_t is array (Integer range 0 .. 1) of Win32.DWORD;

   type union_anonymous24_t_kind is (
      ShortName_kind,
      Name_kind,
      LongName_kind);

   type union_anonymous24_t
     (Which : union_anonymous24_t_kind := ShortName_kind)
   is
      record
         case Which is
            when ShortName_kind =>
               ShortName : Win32.BYTE_Array (0 .. 7);
            when Name_kind =>
               Name : anonymous22_t;
            when LongName_kind =>
               LongName : anonymous23_t;
         end case;
      end record;
   for union_anonymous24_t'Alignment use 2;

   pragma Convention (C, union_anonymous24_t);

   pragma Unchecked_Union (union_anonymous24_t);

   type IMAGE_SYMBOL is record
      N                  : union_anonymous24_t;
      Value              : Win32.DWORD;
      SectionNumber      : Win32.SHORT;
      C_Type             : Win32.WORD;
      StorageClass       : Win32.BYTE;
      NumberOfAuxSymbols : Win32.BYTE;
   end record;
   for IMAGE_SYMBOL'Alignment use 2;

   type anonymous25_t is record
      Linenumber : Win32.WORD;
      Size       : Win32.WORD;
   end record;
   for anonymous25_t'Alignment use 2;

   type union_anonymous26_t_kind is (LnSz_kind, TotalSize_kind);

   type union_anonymous26_t (Which : union_anonymous26_t_kind := LnSz_kind) is
      record
         case Which is
            when LnSz_kind =>
               LnSz : anonymous25_t;
            when TotalSize_kind =>
               TotalSize : Win32.DWORD;
         end case;
      end record;
   for union_anonymous26_t'Alignment use 2;

   pragma Convention (C, union_anonymous26_t);

   pragma Unchecked_Union (union_anonymous26_t);

   type anonymous27_t is record
      PointerToLinenumber   : Win32.DWORD;
      PointerToNextFunction : Win32.DWORD;
   end record;
   for anonymous27_t'Alignment use 2;

   type anonymous28_t is record
      Dimension : Win32.WORD_Array (0 .. 3);
   end record;
   for anonymous28_t'Alignment use 2;

   type union_anonymous29_t_kind is (C_Function_kind, C_Array_kind);

   type union_anonymous29_t
     (Which : union_anonymous29_t_kind := C_Function_kind)
   is
      record
         case Which is
            when C_Function_kind =>
               C_Function : anonymous27_t;
            when C_Array_kind =>
               C_Array : anonymous28_t;
         end case;
      end record;
   for union_anonymous29_t'Alignment use 2;

   pragma Convention (C, union_anonymous29_t);

   pragma Unchecked_Union (union_anonymous29_t);

   type anonymous30_t is record
      TagIndex : Win32.DWORD;
      Misc     : union_anonymous26_t;
      FcnAry   : union_anonymous29_t;
      TvIndex  : Win32.WORD;
   end record;
   for anonymous30_t'Alignment use 2;

   type anonymous32_t is record
      Name : Win32.BYTE_Array (0 .. 17);
   end record;
   for anonymous32_t'Alignment use 2;

   type anonymous33_t is record
      Length              : Win32.DWORD;
      NumberOfRelocations : Win32.WORD;
      NumberOfLinenumbers : Win32.WORD;
      CheckSum            : Win32.DWORD;
      Number              : Win32.SHORT;
      Selection           : Win32.BYTE;
   end record;
   for anonymous33_t'Alignment use 2;

   type IMAGE_AUX_SYMBOL_kind is (Sym_kind, File_kind, Section_kind);

   type IMAGE_AUX_SYMBOL (Which : IMAGE_AUX_SYMBOL_kind := Sym_kind) is record
      case Which is
         when Sym_kind =>
            Sym : anonymous30_t;
         when File_kind =>
            File : anonymous32_t;
         when Section_kind =>
            Section : anonymous33_t;
      end case;
   end record;
   for IMAGE_AUX_SYMBOL'Alignment use 2;
   pragma Unchecked_Union (IMAGE_AUX_SYMBOL);

   type IMAGE_RELOCATION is record
      VirtualAddress   : Win32.DWORD;
      SymbolTableIndex : Win32.DWORD;
      C_Type           : Win32.WORD;
   end record;
   for IMAGE_RELOCATION'Alignment use 2;

   for IMAGE_RELOCATION use record
      VirtualAddress   at 0 range 0 .. 31;
      SymbolTableIndex at 4 range 0 .. 31;
      C_Type           at 8 range 0 .. 15;
   end record;

   type IMAGE_BASE_RELOCATION is record
      VirtualAddress : Win32.DWORD;
      SizeOfBlock    : Win32.DWORD;
   end record;

   type union_anonymous34_t_kind is (
      SymbolTableIndex_kind,
      VirtualAddress_kind);

   type union_anonymous34_t
     (Which : union_anonymous34_t_kind := SymbolTableIndex_kind)
   is
      record
         case Which is
            when SymbolTableIndex_kind =>
               SymbolTableIndex : Win32.DWORD;
            when VirtualAddress_kind =>
               VirtualAddress : Win32.DWORD;
         end case;
      end record;
   for union_anonymous34_t'Alignment use 2;
   pragma Convention (C, union_anonymous34_t);

   pragma Unchecked_Union (union_anonymous34_t);

   type IMAGE_LINENUMBER is record
      C_Type     : union_anonymous34_t;
      Linenumber : Win32.WORD;
   end record;
   for IMAGE_LINENUMBER'Alignment use 2;

   type IMAGE_ARCHIVE_MEMBER_HEADER is record
      Name      : Win32.BYTE_Array (0 .. 15);
      Date      : Win32.BYTE_Array (0 .. 11);
      UserID    : Win32.BYTE_Array (0 .. 5);
      GroupID   : Win32.BYTE_Array (0 .. 5);
      Mode      : Win32.BYTE_Array (0 .. 7);
      Size      : Win32.BYTE_Array (0 .. 9);
      EndHeader : Win32.BYTE_Array (0 .. 1);
   end record;

   type IMAGE_EXPORT_DIRECTORY is record
      Characteristics       : Win32.DWORD;
      TimeDateStamp         : Win32.DWORD;
      MajorVersion          : Win32.WORD;
      MinorVersion          : Win32.WORD;
      Name                  : Win32.DWORD;
      Base                  : Win32.DWORD;
      NumberOfFunctions     : Win32.DWORD;
      NumberOfNames         : Win32.DWORD;
      AddressOfFunctions    : DWORD;
      AddressOfNames        : DWORD;
      AddressOfNameOrdinals : WORD;
   end record;

   type IMAGE_IMPORT_BY_NAME is record
      Hint : Win32.WORD;
      Name : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type union_anonymous42_t_kind is (
      C_Function_kind,
      Ordinal_kind,
      AddressOfData_kind);

   type union_anonymous42_t
     (Which : union_anonymous42_t_kind := C_Function_kind)
   is
      record
         case Which is
            when C_Function_kind =>
               C_Function : Win32.PDWORD;
            when Ordinal_kind =>
               Ordinal : Win32.DWORD;
            when AddressOfData_kind =>
               AddressOfData : PIMAGE_IMPORT_BY_NAME;
         end case;
      end record;

   pragma Convention (C, union_anonymous42_t);

   pragma Unchecked_Union (union_anonymous42_t);

   type IMAGE_THUNK_DATA is record
      u1 : union_anonymous42_t;
   end record;

   type IMAGE_IMPORT_DESCRIPTOR is record
      Characteristics : Win32.DWORD;
      TimeDateStamp   : Win32.DWORD;
      ForwarderChain  : Win32.DWORD;
      Name            : Win32.DWORD;
      FirstThunk      : Win32.DWORD;
   end record;

   type PIMAGE_TLS_CALLBACK is access procedure
     (DllHandle : Win32.PVOID;
      Reason    : Win32.DWORD;
      Reserved  : Win32.PVOID);
   pragma Convention (Stdcall, PIMAGE_TLS_CALLBACK);

   type PPIMAGE_TLS_CALLBACK is access all PIMAGE_TLS_CALLBACK;

   type IMAGE_TLS_DIRECTORY is record
#if TARGET = "Win32" then
      StartAddressOfRawData : Win32.DWORD;
      EndAddressOfRawData   : Win32.DWORD;
      AddressOfIndex        : Win32.PDWORD;
#else
      StartAddressOfRawData : Win32.ULONGLONG;
      EndAddressOfRawData   : Win32.ULONGLONG;
      AddressOfIndex        : Win32.ULONGLONG;
#end if;
      AddressOfCallBacks    : PPIMAGE_TLS_CALLBACK;
      SizeOfZeroFill        : Win32.DWORD;
      Characteristics       : Win32.DWORD;
   end record;

   type IMAGE_RESOURCE_DIRECTORY is record
      Characteristics      : Win32.DWORD;
      TimeDateStamp        : Win32.DWORD;
      MajorVersion         : Win32.WORD;
      MinorVersion         : Win32.WORD;
      NumberOfNamedEntries : Win32.WORD;
      NumberOfIdEntries    : Win32.WORD;
   end record;

   type IMAGE_RESOURCE_DIRECTORY_ENTRY is record
      Name         : Win32.DWORD;
      OffsetToData : Win32.DWORD;
   end record;

   type IMAGE_RESOURCE_DIRECTORY_STRING is record
      Length     : Win32.WORD;
      NameString : Win32.CHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type IMAGE_RESOURCE_DIR_STRING_U is record
      Length     : Win32.WORD;
      NameString : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type IMAGE_RESOURCE_DATA_ENTRY is record
      OffsetToData : Win32.DWORD;
      Size         : Win32.DWORD;
      CodePage     : Win32.DWORD;
      Reserved     : Win32.DWORD;
   end record;

   type IMAGE_LOAD_CONFIG_DIRECTORY is record
      Characteristics               : Win32.DWORD;
      TimeDateStamp                 : Win32.DWORD;
      MajorVersion                  : Win32.WORD;
      MinorVersion                  : Win32.WORD;
      GlobalFlagsClear              : Win32.DWORD;
      GlobalFlagsSet                : Win32.DWORD;
      CriticalSectionDefaultTimeout : Win32.DWORD;
#if TARGET = "Win32" then
      DeCommitFreeBlockThreshold    : Win32.DWORD;
      DeCommitTotalFreeThreshold    : Win32.DWORD;
      LockPrefixTable               : Win32.PVOID;
      MaximumAllocationSize         : Win32.DWORD;
      VirtualMemoryThreshold        : Win32.DWORD;
      ProcessHeapFlags              : Win32.DWORD;
      ProcessAffinityMask           : Win32.DWORD;
#else
      DeCommitFreeBlockThreshold    : Win32.ULONGLONG;
      DeCommitTotalFreeThreshold    : Win32.ULONGLONG;
      LockPrefixTable               : Win32.ULONGLONG;
      MaximumAllocationSize         : Win32.ULONGLONG;
      VirtualMemoryThreshold        : Win32.ULONGLONG;
      ProcessAffinityMask           : Win32.ULONGLONG;
      ProcessHeapFlags              : Win32.DWORD;
#end if;
      CSDVersion                    : Win32.WORD;
      Reserved1                     : Win32.WORD;
#if TARGET = "Win32" then
      EditList                      : Win32.DWORD;
      SecurityCookie                : Win32.DWORD;
      SEHandlerTable                : Win32.DWORD;
      SEHandlerCount                : Win32.DWORD;
#else
      EditList                      : Win32.ULONGLONG;
      SecurityCookie                : Win32.ULONGLONG;
      SEHandlerTable                : Win32.ULONGLONG;
      SEHandlerCount                : Win32.ULONGLONG;
#end if;
   end record;

   type IMAGE_RUNTIME_FUNCTION_ENTRY is record
      BeginAddress      : Win32.DWORD;
      EndAddress        : Win32.DWORD;
      UnwindInfoAddress : Win32.DWORD;
   end record;

   type IMAGE_DEBUG_DIRECTORY is record
      Characteristics  : Win32.DWORD;
      TimeDateStamp    : Win32.DWORD;
      MajorVersion     : Win32.WORD;
      MinorVersion     : Win32.WORD;
      C_Type           : Win32.DWORD;
      SizeOfData       : Win32.DWORD;
      AddressOfRawData : Win32.DWORD;
      PointerToRawData : Win32.DWORD;
   end record;

   type IMAGE_COFF_SYMBOLS_HEADER is record
      NumberOfSymbols      : Win32.DWORD;
      LvaToFirstSymbol     : Win32.DWORD;
      NumberOfLinenumbers  : Win32.DWORD;
      LvaToFirstLinenumber : Win32.DWORD;
      RvaToFirstByteOfCode : Win32.DWORD;
      RvaToLastByteOfCode  : Win32.DWORD;
      RvaToFirstByteOfData : Win32.DWORD;
      RvaToLastByteOfData  : Win32.DWORD;
   end record;

   type IMAGE_DEBUG_MISC is record
      DataType : Win32.DWORD;
      Length   : Win32.DWORD;
      Unicode  : BOOLEAN;
      Reserved : Win32.BYTE_Array (0 .. 2);
      Data     : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type IMAGE_FUNCTION_ENTRY is record
      StartingAddress : Win32.DWORD;
      EndingAddress   : Win32.DWORD;
      EndOfPrologue   : Win32.DWORD;
   end record;

   type IMAGE_SEPARATE_DEBUG_HEADER is record
      Signature          : Win32.WORD;
      Flags              : Win32.WORD;
      Machine            : Win32.WORD;
      Characteristics    : Win32.WORD;
      TimeDateStamp      : Win32.DWORD;
      CheckSum           : Win32.DWORD;
      ImageBase          : Win32.DWORD;
      SizeOfImage        : Win32.DWORD;
      NumberOfSections   : Win32.DWORD;
      ExportedNamesSize  : Win32.DWORD;
      DebugDirectorySize : Win32.DWORD;
      Reserved           : Win32.DWORD_Array (0 .. 2);
   end record;

   type MESSAGE_RESOURCE_ENTRY is record
      Length : Win32.WORD;
      Flags  : Win32.WORD;
      Text   : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type MESSAGE_RESOURCE_BLOCK is record
      LowId           : Win32.DWORD;
      HighId          : Win32.DWORD;
      OffsetToEntries : Win32.DWORD;
   end record;

   type Message_Resource_Array is
     array (Natural range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased MESSAGE_RESOURCE_BLOCK;

   type MESSAGE_RESOURCE_DATA is record
      NumberOfBlocks : Win32.DWORD;
      Blocks         : Message_Resource_Array;
   end record;

   type RTL_CRITICAL_SECTION is record
      DebugInfo      : PRTL_CRITICAL_SECTION_DEBUG;
      LockCount      : Win32.LONG;
      RecursionCount : Win32.LONG;
      OwningThread   : HANDLE;
      LockSemaphore  : HANDLE;
      Reserved       : Win32.DWORD;
   end record;

   type RTL_CRITICAL_SECTION_DEBUG is record
      C_Type                : Win32.WORD;
      CreatorBackTraceIndex : Win32.WORD;
      CriticalSection       : PRTL_CRITICAL_SECTION;
      ProcessLocksList      : LIST_ENTRY;
      EntryCount            : Win32.DWORD;
      ContentionCount       : Win32.DWORD;
      Spare                 : Win32.DWORD_Array (0 .. 1);
   end record;

   type EVENTLOGRECORD is record
      Length              : Win32.DWORD;
      Reserved            : Win32.DWORD;
      RecordNumber        : Win32.DWORD;
      TimeGenerated       : Win32.DWORD;
      TimeWritten         : Win32.DWORD;
      EventID             : Win32.DWORD;
      EventType           : Win32.WORD;
      NumStrings          : Win32.WORD;
      EventCategory       : Win32.WORD;
      ReservedFlags       : Win32.WORD;
      ClosingRecordNumber : Win32.DWORD;
      StringOffset        : Win32.DWORD;
      UserSidLength       : Win32.DWORD;
      UserSidOffset       : Win32.DWORD;
      DataLength          : Win32.DWORD;
      DataOffset          : Win32.DWORD;
   end record;

   type TAPE_ERASE is record
      C_Type    : Win32.DWORD;
      Immediate : BOOLEAN;
   end record;

   type TAPE_PREPARE is record
      Operation : Win32.DWORD;
      Immediate : BOOLEAN;
   end record;

   type TAPE_WRITE_MARKS is record
      C_Type    : Win32.DWORD;
      Count     : Win32.DWORD;
      Immediate : BOOLEAN;
   end record;

   type TAPE_GET_POSITION is record
      C_Type    : Win32.DWORD;
      Partition : Win32.DWORD;
      Offset    : LARGE_INTEGER;
   end record;

   type TAPE_SET_POSITION is record
      Method    : Win32.DWORD;
      Partition : Win32.DWORD;
      Offset    : LARGE_INTEGER;
      Immediate : BOOLEAN;
   end record;

   type TAPE_GET_DRIVE_PARAMETERS is record
      ECC                   : BOOLEAN;
      Compression           : BOOLEAN;
      DataPadding           : BOOLEAN;
      ReportSetmarks        : BOOLEAN;
      DefaultBlockSize      : Win32.DWORD;
      MaximumBlockSize      : Win32.DWORD;
      MinimumBlockSize      : Win32.DWORD;
      MaximumPartitionCount : Win32.DWORD;
      FeaturesLow           : Win32.DWORD;
      FeaturesHigh          : Win32.DWORD;
      EOTWARNINGZONESIZE    : Win32.DWORD;
   end record;

   type TAPE_SET_DRIVE_PARAMETERS is record
      ECC                : BOOLEAN;
      Compression        : BOOLEAN;
      DataPadding        : BOOLEAN;
      ReportSetmarks     : BOOLEAN;
      EOTWARNINGZONESIZE : Win32.DWORD;
   end record;

   type TAPE_GET_MEDIA_PARAMETERS is record
      Capacity       : LARGE_INTEGER;
      Remaining      : LARGE_INTEGER;
      BlockSize      : Win32.DWORD;
      PartitionCount : Win32.DWORD;
      WriteProtected : BOOLEAN;
   end record;

   type TAPE_SET_MEDIA_PARAMETERS is record
      BlockSize : Win32.DWORD;
   end record;

   type TAPE_CREATE_PARTITION is record
      Method : Win32.DWORD;
      Count  : Win32.DWORD;
      Size   : Win32.DWORD;
   end record;

   function MAKELANGID (P, S : WORD) return WORD;

   function PRIMARYLANGID (LGID : WORD) return WORD;

   function SUBLANGID (LGID : WORD) return WORD;

   function MAKELCID (Lgid, Srtid : WORD) return DWORD;

   function LANGIDFROMLCID (Lcid : DWORD) return WORD;

   function SORTIDFROMLCID (Lcid : DWORD) return WORD;

   function IMAGE_FIRST_SECTION
     (NTHeader : PIMAGE_NT_HEADERS)
      return PIMAGE_DATA_DIRECTORY;

   function BTYPE (X : BYTE) return BYTE;

   function ISPTR (X : BYTE) return Standard.Boolean;

   function ISFCN (X : BYTE) return Standard.Boolean;

   function ISARY (X : BYTE) return Standard.Boolean;

   function ISTAG (X : BYTE) return Standard.Boolean;

   function INCREF (X : BYTE) return BYTE;

   function DECREF (X : BYTE) return BYTE;

   function IMAGE_SNAP_BY_ORDINAL (Ordinal : DWORD) return Standard.Boolean;

   function IMAGE_ORDINAL (Ordinal : DWORD) return WORD;

   type FILE_NOTIFY_INFORMATION is record
      NextEntryOffset : Win32.DWORD;
      Action          : Win32.DWORD;
      FileNameLength  : Win32.DWORD;
      FileName        : Win32.WCHAR_Array(0..Win32.ANYSIZE_ARRAY);
   end record;

private

   pragma Convention (C_Pass_By_Copy, ULARGE_INTEGER);
   pragma Convention (C_Pass_By_Copy, FPO_DATA);
   pragma Convention (C_Pass_By_Copy, anonymous2_t);
   pragma Convention (C_Pass_By_Copy, LIST_ENTRY);
   pragma Convention (C_Pass_By_Copy, SINGLE_LIST_ENTRY);
   pragma Convention (C, CONTEXT);
   pragma Convention (C_Pass_By_Copy, anonymous4_t);
   pragma Convention (C_Pass_By_Copy, anonymous5_t);
   pragma Convention (C_Pass_By_Copy, LDT_ENTRY);
   pragma Convention (C, EXCEPTION_RECORD);
   pragma Convention (C_Pass_By_Copy, EXCEPTION_POINTERS);
   pragma Convention (C, MEMORY_BASIC_INFORMATION);
   pragma Convention (C_Pass_By_Copy, GENERIC_MAPPING);
   pragma Convention (C_Pass_By_Copy, SID);
   pragma Convention (C_Pass_By_Copy, SID_AND_ATTRIBUTES);
   pragma Convention (C_Pass_By_Copy, ACL);
   pragma Convention (C_Pass_By_Copy, ACE_HEADER);
   pragma Convention (C_Pass_By_Copy, ACCESS_ALLOWED_ACE);
   pragma Convention (C_Pass_By_Copy, ACCESS_DENIED_ACE);
   pragma Convention (C_Pass_By_Copy, SYSTEM_AUDIT_ACE);
   pragma Convention (C_Pass_By_Copy, SYSTEM_ALARM_ACE);
   pragma Convention (C_Pass_By_Copy, ACL_REVISION_INFORMATION);
   pragma Convention (C_Pass_By_Copy, ACL_SIZE_INFORMATION);
   pragma Convention (C, SECURITY_DESCRIPTOR);
   pragma Convention (C, PRIVILEGE_SET);
   pragma Convention (C_Pass_By_Copy, SECURITY_QUALITY_OF_SERVICE);
   pragma Convention (C_Pass_By_Copy, SE_IMPERSONATION_STATE);
   pragma Convention (C_Pass_By_Copy, TOKEN_USER);
   pragma Convention (C_Pass_By_Copy, TOKEN_GROUPS);
   pragma Convention (C_Pass_By_Copy, TOKEN_PRIVILEGES);
   pragma Convention (C_Pass_By_Copy, TOKEN_OWNER);
   pragma Convention (C_Pass_By_Copy, TOKEN_PRIMARY_GROUP);
   pragma Convention (C_Pass_By_Copy, TOKEN_DEFAULT_DACL);
   pragma Convention (C_Pass_By_Copy, TOKEN_SOURCE);
   pragma Convention (C, TOKEN_STATISTICS);
   pragma Convention (C, TOKEN_CONTROL);
   pragma Convention (C, IMAGE_DOS_HEADER);
   pragma Convention (C, IMAGE_OS2_HEADER);
   pragma Convention (C, IMAGE_FILE_HEADER);
   pragma Convention (C_Pass_By_Copy, IMAGE_DATA_DIRECTORY);
   pragma Convention (C, IMAGE_OPTIONAL_HEADER);
   pragma Convention (C, IMAGE_ROM_OPTIONAL_HEADER);
   pragma Convention (C, IMAGE_NT_HEADERS);
   pragma Convention (C, IMAGE_ROM_HEADERS);
   pragma Convention (C, IMAGE_SECTION_HEADER);
   pragma Convention (C_Pass_By_Copy, anonymous22_t);
   pragma Convention (C, IMAGE_SYMBOL);
   pragma Convention (C_Pass_By_Copy, anonymous25_t);
   pragma Convention (C_Pass_By_Copy, anonymous27_t);
   pragma Convention (C_Pass_By_Copy, anonymous28_t);
   pragma Convention (C, anonymous30_t);
   pragma Convention (C, anonymous32_t);
   pragma Convention (C_Pass_By_Copy, anonymous33_t);
   pragma Convention (C_Pass_By_Copy, IMAGE_RELOCATION);
   pragma Convention (C_Pass_By_Copy, IMAGE_BASE_RELOCATION);
   pragma Convention (C_Pass_By_Copy, IMAGE_LINENUMBER);
   pragma Convention (C, IMAGE_ARCHIVE_MEMBER_HEADER);
   pragma Convention (C, IMAGE_EXPORT_DIRECTORY);
   pragma Convention (C_Pass_By_Copy, IMAGE_IMPORT_BY_NAME);
   pragma Convention (C_Pass_By_Copy, IMAGE_THUNK_DATA);
   pragma Convention (C, IMAGE_IMPORT_DESCRIPTOR);
   pragma Convention (C, IMAGE_TLS_DIRECTORY);
   pragma Convention (C_Pass_By_Copy, IMAGE_RESOURCE_DIRECTORY);
   pragma Convention (C_Pass_By_Copy, IMAGE_RESOURCE_DIRECTORY_ENTRY);
   pragma Convention (C_Pass_By_Copy, IMAGE_RESOURCE_DIRECTORY_STRING);
   pragma Convention (C_Pass_By_Copy, IMAGE_RESOURCE_DIR_STRING_U);
   pragma Convention (C_Pass_By_Copy, IMAGE_RESOURCE_DATA_ENTRY);
   pragma Convention (C, IMAGE_LOAD_CONFIG_DIRECTORY);
   pragma Convention (C, IMAGE_RUNTIME_FUNCTION_ENTRY);
   pragma Convention (C, IMAGE_DEBUG_DIRECTORY);
   pragma Convention (C, IMAGE_COFF_SYMBOLS_HEADER);
   pragma Convention (C_Pass_By_Copy, IMAGE_DEBUG_MISC);
   pragma Convention (C_Pass_By_Copy, IMAGE_FUNCTION_ENTRY);
   pragma Convention (C, IMAGE_SEPARATE_DEBUG_HEADER);
   pragma Convention (C_Pass_By_Copy, MESSAGE_RESOURCE_ENTRY);
   pragma Convention (C_Pass_By_Copy, MESSAGE_RESOURCE_BLOCK);
   pragma Convention (C_Pass_By_Copy, MESSAGE_RESOURCE_DATA);
   pragma Convention (C, RTL_CRITICAL_SECTION);
   pragma Convention (C, RTL_CRITICAL_SECTION_DEBUG);
   pragma Convention (C, EVENTLOGRECORD);
   pragma Convention (C_Pass_By_Copy, TAPE_ERASE);
   pragma Convention (C_Pass_By_Copy, TAPE_PREPARE);
   pragma Convention (C_Pass_By_Copy, TAPE_WRITE_MARKS);
   pragma Convention (C_Pass_By_Copy, TAPE_GET_POSITION);
   pragma Convention (C, TAPE_SET_POSITION);
   pragma Convention (C, TAPE_GET_DRIVE_PARAMETERS);
   pragma Convention (C_Pass_By_Copy, TAPE_SET_DRIVE_PARAMETERS);
   pragma Convention (C, TAPE_GET_MEDIA_PARAMETERS);
   pragma Convention (C_Pass_By_Copy, TAPE_SET_MEDIA_PARAMETERS);
   pragma Convention (C_Pass_By_Copy, TAPE_CREATE_PARTITION);

   pragma Inline (MAKELANGID);
   pragma Inline (PRIMARYLANGID);
   pragma Inline (SUBLANGID);
   pragma Inline (MAKELCID);
   pragma Inline (LANGIDFROMLCID);
   pragma Inline (SORTIDFROMLCID);
   pragma Inline (IMAGE_FIRST_SECTION);
   pragma Inline (BTYPE);
   pragma Inline (ISPTR);
   pragma Inline (ISFCN);
   pragma Inline (ISARY);
   pragma Inline (ISTAG);
   pragma Inline (INCREF);
   pragma Inline (DECREF);
   pragma Inline (IMAGE_SNAP_BY_ORDINAL);
   pragma Inline (IMAGE_ORDINAL);

end Win32.Winnt;
