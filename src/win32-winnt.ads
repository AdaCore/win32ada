--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-winnt.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
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

with Interfaces.C; use Interfaces.C;

package Win32.Winnt is

   APPLICATION_ERROR_MASK : constant :=  16#20000000#; --  winnt.h :153
   ERROR_SEVERITY_SUCCESS : constant :=  16#0#;        --  winnt.h :154
   ERROR_SEVERITY_INFORMATIONAL : constant :=  16#40000000#; --  winnt.h :155
   ERROR_SEVERITY_WARNING : constant :=  16#80000000#; --  winnt.h :156
   ERROR_SEVERITY_ERROR : constant :=  16#c0000000#; --  winnt.h :157
   UNICODE_NULL : constant WCHAR :=  WCHAR'Val (0);
   --  winnt.h :437
   MINCHAR  : constant :=  16#80#;       --  winnt.h :459
   MAXCHAR  : constant :=  16#7f#;       --  winnt.h :460
   MINSHORT : constant :=  16#8000#;     --  winnt.h :461
   MAXSHORT : constant :=  16#7fff#;     --  winnt.h :462
   MINLONG  : constant :=  16#80000000#; --  winnt.h :463
   MAXLONG  : constant :=  16#7fffffff#; --  winnt.h :464
   MAXBYTE  : constant :=  16#ff#;       --  winnt.h :465
   MAXWORD  : constant :=  16#ffff#;     --  winnt.h :466
   MAXDWORD : constant :=  16#ffffffff#; --  winnt.h :467
   LANG_NEUTRAL                 : constant :=  16#0#;  --  winnt.h :503
   LANG_BULGARIAN               : constant :=  16#2#;  --  winnt.h :505
   LANG_CHINESE                 : constant :=  16#4#;  --  winnt.h :506
   LANG_CROATIAN                : constant :=  16#1a#; --  winnt.h :507
   LANG_CZECH                   : constant :=  16#5#;  --  winnt.h :508
   LANG_DANISH                  : constant :=  16#6#;  --  winnt.h :509
   LANG_DUTCH                   : constant :=  16#13#; --  winnt.h :510
   LANG_ENGLISH                 : constant :=  16#9#;  --  winnt.h :511
   LANG_FINNISH                 : constant :=  16#b#;  --  winnt.h :512
   LANG_FRENCH                  : constant :=  16#c#;  --  winnt.h :513
   LANG_GERMAN                  : constant :=  16#7#;  --  winnt.h :514
   LANG_GREEK                   : constant :=  16#8#;  --  winnt.h :515
   LANG_HUNGARIAN               : constant :=  16#e#;  --  winnt.h :516
   LANG_ICELANDIC               : constant :=  16#f#;  --  winnt.h :517
   LANG_ITALIAN                 : constant :=  16#10#; --  winnt.h :518
   LANG_JAPANESE                : constant :=  16#11#; --  winnt.h :519
   LANG_KOREAN                  : constant :=  16#12#; --  winnt.h :520
   LANG_NORWEGIAN               : constant :=  16#14#; --  winnt.h :521
   LANG_POLISH                  : constant :=  16#15#; --  winnt.h :522
   LANG_PORTUGUESE              : constant :=  16#16#; --  winnt.h :523
   LANG_ROMANIAN                : constant :=  16#18#; --  winnt.h :524
   LANG_RUSSIAN                 : constant :=  16#19#; --  winnt.h :525
   LANG_SLOVAK                  : constant :=  16#1b#; --  winnt.h :526
   LANG_SLOVENIAN               : constant :=  16#24#; --  winnt.h :527
   LANG_SPANISH                 : constant :=  16#a#;  --  winnt.h :528
   LANG_SWEDISH                 : constant :=  16#1d#; --  winnt.h :529
   LANG_TURKISH                 : constant :=  16#1f#; --  winnt.h :530
   SUBLANG_NEUTRAL              : constant :=  16#0#;  --  winnt.h :539
   SUBLANG_DEFAULT              : constant :=  16#1#;  --  winnt.h :540
   SUBLANG_SYS_DEFAULT          : constant :=  16#2#;  --  winnt.h :541
   SUBLANG_CHINESE_TRADITIONAL  : constant :=  16#1#;  --  winnt.h :543
   SUBLANG_CHINESE_SIMPLIFIED   : constant :=  16#2#;  --  winnt.h :544
   SUBLANG_CHINESE_HONGKONG     : constant :=  16#3#;  --  winnt.h :545
   SUBLANG_CHINESE_SINGAPORE    : constant :=  16#4#;  --  winnt.h :546
   SUBLANG_DUTCH                : constant :=  16#1#;  --  winnt.h :547
   SUBLANG_DUTCH_BELGIAN        : constant :=  16#2#;  --  winnt.h :548
   SUBLANG_ENGLISH_US           : constant :=  16#1#;  --  winnt.h :549
   SUBLANG_ENGLISH_UK           : constant :=  16#2#;  --  winnt.h :550
   SUBLANG_ENGLISH_AUS          : constant :=  16#3#;  --  winnt.h :551
   SUBLANG_ENGLISH_CAN          : constant :=  16#4#;  --  winnt.h :552
   SUBLANG_ENGLISH_NZ           : constant :=  16#5#;  --  winnt.h :553
   SUBLANG_ENGLISH_EIRE         : constant :=  16#6#;  --  winnt.h :554
   SUBLANG_FRENCH               : constant :=  16#1#;  --  winnt.h :555
   SUBLANG_FRENCH_BELGIAN       : constant :=  16#2#;  --  winnt.h :556
   SUBLANG_FRENCH_CANADIAN      : constant :=  16#3#;  --  winnt.h :557
   SUBLANG_FRENCH_SWISS         : constant :=  16#4#;  --  winnt.h :558
   SUBLANG_GERMAN               : constant :=  16#1#;  --  winnt.h :559
   SUBLANG_GERMAN_SWISS         : constant :=  16#2#;  --  winnt.h :560
   SUBLANG_GERMAN_AUSTRIAN      : constant :=  16#3#;  --  winnt.h :561
   SUBLANG_ITALIAN              : constant :=  16#1#;  --  winnt.h :562
   SUBLANG_ITALIAN_SWISS        : constant :=  16#2#;  --  winnt.h :563
   SUBLANG_NORWEGIAN_BOKMAL     : constant :=  16#1#;  --  winnt.h :564
   SUBLANG_NORWEGIAN_NYNORSK    : constant :=  16#2#;  --  winnt.h :565
   SUBLANG_PORTUGUESE           : constant :=  16#2#;  --  winnt.h :566
   SUBLANG_PORTUGUESE_BRAZILIAN : constant :=  16#1#;  --  winnt.h :567
   SUBLANG_SPANISH              : constant :=  16#1#;  --  winnt.h :568
   SUBLANG_SPANISH_MEXICAN      : constant :=  16#2#;  --  winnt.h :569
   SUBLANG_SPANISH_MODERN       : constant :=  16#3#;  --  winnt.h :570
   SORT_DEFAULT                 : constant :=  16#0#;  --  winnt.h :576

   LANG_SYSTEM_DEFAULT : constant :=                --  winnt.h :639
     ((SUBLANG_SYS_DEFAULT * (2 ** 10)) + LANG_NEUTRAL);
   LANG_USER_DEFAULT : constant :=                --  winnt.h :640
     ((SUBLANG_DEFAULT * (2 ** 10)) + LANG_NEUTRAL);
   LOCALE_SYSTEM_DEFAULT : constant :=                --  winnt.h :642
     ((SORT_DEFAULT * (2 ** 16)) + LANG_SYSTEM_DEFAULT);
   LOCALE_USER_DEFAULT : constant :=                --  winnt.h :643
     ((SORT_DEFAULT * (2 ** 16)) + LANG_USER_DEFAULT);

   SORT_JAPANESE_XJIS : constant :=  16#0#;        --  winnt.h :578
   SORT_JAPANESE_UNICODE : constant :=  16#1#;        --  winnt.h :579
   SORT_CHINESE_BIG5 : constant :=  16#0#;        --  winnt.h :581
   SORT_CHINESE_UNICODE : constant :=  16#1#;        --  winnt.h :582
   SORT_KOREAN_KSC : constant :=  16#0#;        --  winnt.h :584
   SORT_KOREAN_UNICODE : constant :=  16#1#;        --  winnt.h :585
   NLS_VALID_LOCALE_MASK : constant :=  16#fffff#;    --  winnt.h :629
   STATUS_WAIT_0 : constant DWORD    :=  16#0#;
   --  winnt.h :702
   STATUS_ABANDONED_WAIT_0 : constant DWORD    :=  16#80#;
   --  winnt.h :703
   STATUS_USER_APC : constant DWORD    :=  16#c0#;
   --  winnt.h :704
   STATUS_TIMEOUT : constant DWORD    :=  16#102#;
   --  winnt.h :705
   STATUS_PENDING : constant DWORD    :=  16#103#;
   --  winnt.h :706
   STATUS_GUARD_PAGE_VIOLATION : constant DWORD    :=  16#80000001#;
   --  winnt.h :707
   STATUS_DATATYPE_MISALIGNMENT : constant DWORD    :=  16#80000002#;
   --  winnt.h :708
   STATUS_BREAKPOINT : constant DWORD    :=  16#80000003#;
   --  winnt.h :709
   STATUS_SINGLE_STEP : constant DWORD    :=  16#80000004#;
   --  winnt.h :710
   STATUS_ACCESS_VIOLATION : constant DWORD    :=  16#c0000005#;
   --  winnt.h :711
   STATUS_IN_PAGE_ERROR : constant DWORD    :=  16#c0000006#;
   --  winnt.h :712
   STATUS_NO_MEMORY : constant DWORD    :=  16#c0000017#;
   --  winnt.h :713
   STATUS_ILLEGAL_INSTRUCTION : constant DWORD    :=  16#c000001d#;
   --  winnt.h :714
   STATUS_NONCONTINUABLE_EXCEPTION : constant DWORD    :=  16#c0000025#;
   --  winnt.h :715
   STATUS_INVALID_DISPOSITION : constant DWORD    :=  16#c0000026#;
   --  winnt.h :716
   STATUS_ARRAY_BOUNDS_EXCEEDED : constant DWORD    :=  16#c000008c#;
   --  winnt.h :717
   STATUS_FLOAT_DENORMAL_OPERAND : constant DWORD    :=  16#c000008d#;
   --  winnt.h :718
   STATUS_FLOAT_DIVIDE_BY_ZERO : constant DWORD    :=  16#c000008e#;
   --  winnt.h :719
   STATUS_FLOAT_INEXACT_RESULT : constant DWORD    :=  16#c000008f#;
   --  winnt.h :720
   STATUS_FLOAT_INVALID_OPERATION : constant DWORD    :=  16#c0000090#;
   --  winnt.h :721
   STATUS_FLOAT_OVERFLOW : constant DWORD    :=  16#c0000091#;
   --  winnt.h :722
   STATUS_FLOAT_STACK_CHECK : constant DWORD    :=  16#c0000092#;
   --  winnt.h :723
   STATUS_FLOAT_UNDERFLOW : constant DWORD    :=  16#c0000093#;
   --  winnt.h :724
   STATUS_INTEGER_DIVIDE_BY_ZERO : constant DWORD    :=  16#c0000094#;
   --  winnt.h :725
   STATUS_INTEGER_OVERFLOW : constant DWORD    :=  16#c0000095#;
   --  winnt.h :726
   STATUS_PRIVILEGED_INSTRUCTION : constant DWORD    :=  16#c0000096#;
   --  winnt.h :727
   STATUS_STACK_OVERFLOW : constant DWORD    :=  16#c00000fd#;
   --  winnt.h :728
   STATUS_CONTROL_C_EXIT : constant DWORD    :=  16#c000013a#;
   --  winnt.h :729
   MAXIMUM_WAIT_OBJECTS : constant :=  64;        --  winnt.h :731
   MAXIMUM_SUSPEND_COUNT : constant :=  16#7f#;    --  winnt.h :733
   SIZE_OF_80387_REGISTERS : constant :=  80;        --  winnt.h :1132
   CONTEXT_I386 : constant :=  16#10000#; --  winnt.h :1138
   CONTEXT_I486 : constant :=  16#10000#; --  winnt.h :1139
   CONTEXT_CONTROL : constant :=  16#10001#; --  winnt.h :1141
   CONTEXT_INTEGER : constant :=  16#10002#; --  winnt.h :1142
   CONTEXT_SEGMENTS : constant :=  16#10004#; --  winnt.h :1143
   CONTEXT_FLOATING_POINT : constant :=  16#10008#; --  winnt.h :1144
   CONTEXT_DEBUG_REGISTERS : constant :=  16#10010#; --  winnt.h :1145
   CONTEXT_FULL : constant :=  16#10007#; --  winnt.h :1147
   EXCEPTION_NONCONTINUABLE : constant :=  16#1#;     --  winnt.h :1658
   EXCEPTION_MAXIMUM_PARAMETERS : constant :=  15;        --  winnt.h :1659
   PROCESS_TERMINATE : constant :=  16#1#;     --  winnt.h :1686
   PROCESS_CREATE_THREAD : constant :=  16#2#;     --  winnt.h :1687
   PROCESS_VM_OPERATION : constant :=  16#8#;     --  winnt.h :1688
   PROCESS_VM_READ : constant :=  16#10#;    --  winnt.h :1689
   PROCESS_VM_WRITE : constant :=  16#20#;    --  winnt.h :1690
   PROCESS_DUP_HANDLE : constant :=  16#40#;    --  winnt.h :1691
   PROCESS_CREATE_PROCESS : constant :=  16#80#;    --  winnt.h :1692
   PROCESS_SET_QUOTA : constant :=  16#100#;   --  winnt.h :1693
   PROCESS_SET_INFORMATION : constant :=  16#200#;   --  winnt.h :1694
   PROCESS_QUERY_INFORMATION : constant :=  16#400#;   --  winnt.h :1695
   PROCESS_ALL_ACCESS : constant :=  16#1f0fff#; --  winnt.h :1696
   THREAD_TERMINATE : constant :=  16#1#;     --  winnt.h :1699
   THREAD_SUSPEND_RESUME : constant :=  16#2#;     --  winnt.h :1700
   THREAD_GET_CONTEXT : constant :=  16#8#;     --  winnt.h :1701
   THREAD_SET_CONTEXT : constant :=  16#10#;    --  winnt.h :1702
   THREAD_SET_INFORMATION : constant :=  16#20#;    --  winnt.h :1703
   THREAD_QUERY_INFORMATION : constant :=  16#40#;    --  winnt.h :1704
   THREAD_SET_THREAD_TOKEN : constant :=  16#80#;    --  winnt.h :1705
   THREAD_IMPERSONATE : constant :=  16#100#;   --  winnt.h :1706
   THREAD_DIRECT_IMPERSONATION : constant :=  16#200#;   --  winnt.h :1707
   THREAD_ALL_ACCESS : constant :=  16#1f03ff#; --  winnt.h :1710
   TLS_MINIMUM_AVAILABLE : constant :=  64;        --  winnt.h :1714
   THREAD_BASE_PRIORITY_LOWRT : constant :=  15;        --  winnt.h :1715
   THREAD_BASE_PRIORITY_MAX : constant :=  2;         --  winnt.h :1716
   THREAD_BASE_PRIORITY_MIN : constant :=  -2;        --  winnt.h :1717
   THREAD_BASE_PRIORITY_IDLE : constant :=  -15;       --  winnt.h :1718
   EVENT_MODIFY_STATE : constant :=  16#2#;     --  winnt.h :1719
   EVENT_ALL_ACCESS : constant :=  16#1f0003#; --  winnt.h :1720
   MUTANT_QUERY_STATE : constant :=  16#1#;     --  winnt.h :1721
   MUTANT_ALL_ACCESS : constant :=  16#1f0001#; --  winnt.h :1723
   SEMAPHORE_MODIFY_STATE : constant :=  16#2#;     --  winnt.h :1725
   SEMAPHORE_ALL_ACCESS : constant :=  16#1f0003#; --  winnt.h :1726
   TIME_ZONE_ID_UNKNOWN : constant :=  0;         --  winnt.h :1727
   TIME_ZONE_ID_STANDARD : constant :=  1;         --  winnt.h :1728
   TIME_ZONE_ID_DAYLIGHT : constant :=  2;         --  winnt.h :1729
   PROCESSOR_INTEL_386 : constant :=  386;       --  winnt.h :1731
   PROCESSOR_INTEL_486 : constant :=  486;       --  winnt.h :1732
   PROCESSOR_INTEL_PENTIUM : constant :=  586;       --  winnt.h :1733
   PROCESSOR_INTEL_860 : constant :=  860;       --  winnt.h :1734
   PROCESSOR_MIPS_R2000 : constant :=  2000;      --  winnt.h :1735
   PROCESSOR_MIPS_R3000 : constant :=  3000;      --  winnt.h :1736
   PROCESSOR_MIPS_R4000 : constant :=  4000;      --  winnt.h :1737
   PROCESSOR_ALPHA_21064 : constant :=  21064;     --  winnt.h :1738
   PROCESSOR_PPC_601 : constant :=  601;       --  winnt.h :1739
   PROCESSOR_PPC_603 : constant :=  603;       --  winnt.h :1740
   PROCESSOR_PPC_604 : constant :=  604;       --  winnt.h :1741
   PROCESSOR_PPC_620 : constant :=  620;       --  winnt.h :1742
   SECTION_QUERY : constant :=  16#1#;     --  winnt.h :1753
   SECTION_MAP_WRITE : constant :=  16#2#;     --  winnt.h :1754
   SECTION_MAP_READ : constant :=  16#4#;     --  winnt.h :1755
   SECTION_MAP_EXECUTE : constant :=  16#8#;     --  winnt.h :1756
   SECTION_EXTEND_SIZE : constant :=  16#10#;    --  winnt.h :1757
   SECTION_ALL_ACCESS : constant :=  16#f001f#; --  winnt.h :1759
   PAGE_NOACCESS : constant :=  16#1#;     --  winnt.h :1764
   PAGE_READONLY : constant :=  16#2#;     --  winnt.h :1765
   PAGE_READWRITE : constant :=  16#4#;     --  winnt.h :1766
   PAGE_WRITECOPY : constant :=  16#8#;     --  winnt.h :1767
   PAGE_EXECUTE : constant :=  16#10#;    --  winnt.h :1768
   PAGE_EXECUTE_READ : constant :=  16#20#;    --  winnt.h :1769
   PAGE_EXECUTE_READWRITE : constant :=  16#40#;    --  winnt.h :1770
   PAGE_EXECUTE_WRITECOPY : constant :=  16#80#;    --  winnt.h :1771
   PAGE_GUARD : constant :=  16#100#;   --  winnt.h :1772
   PAGE_NOCACHE : constant :=  16#200#;   --  winnt.h :1773
   MEM_COMMIT : constant :=  16#1000#;  --  winnt.h :1774
   MEM_RESERVE : constant :=  16#2000#;  --  winnt.h :1775
   MEM_DECOMMIT : constant :=  16#4000#;  --  winnt.h :1776
   MEM_RELEASE : constant :=  16#8000#;  --  winnt.h :1777
   MEM_FREE : constant :=  16#10000#; --  winnt.h :1778
   MEM_PRIVATE : constant :=  16#20000#; --  winnt.h :1779
   MEM_MAPPED : constant :=  16#40000#; --  winnt.h :1780
   MEM_TOP_DOWN : constant :=  16#100000#; --  winnt.h :1781
   SEC_FILE : constant :=  16#800000#; --  winnt.h :1782
   SEC_IMAGE : constant :=  16#1000000#;
   --  winnt.h :1783
   SEC_RESERVE : constant :=  16#4000000#;
   --  winnt.h :1784
   SEC_COMMIT : constant :=  16#8000000#;
   --  winnt.h :1785
   SEC_NOCACHE : constant :=  16#10000000#;
   --  winnt.h :1786
   MEM_IMAGE : constant :=  16#1000000#;
   --  winnt.h :1787
   FILE_READ_DATA : constant :=  16#1#;     --  winnt.h :1801
   FILE_LIST_DIRECTORY : constant :=  16#1#;     --  winnt.h :1802
   FILE_WRITE_DATA : constant :=  16#2#;     --  winnt.h :1804
   FILE_ADD_FILE : constant :=  16#2#;     --  winnt.h :1805
   FILE_APPEND_DATA : constant :=  16#4#;     --  winnt.h :1807
   FILE_ADD_SUBDIRECTORY : constant :=  16#4#;     --  winnt.h :1808
   FILE_CREATE_PIPE_INSTANCE : constant :=  16#4#;     --  winnt.h :1809
   FILE_READ_EA : constant :=  16#8#;     --  winnt.h :1811
   FILE_READ_PROPERTIES : constant :=  16#8#;     --  winnt.h :1812
   FILE_WRITE_EA : constant :=  16#10#;    --  winnt.h :1814
   FILE_WRITE_PROPERTIES : constant :=  16#10#;    --  winnt.h :1815
   FILE_EXECUTE : constant :=  16#20#;    --  winnt.h :1817
   FILE_TRAVERSE : constant :=  16#20#;    --  winnt.h :1818
   FILE_DELETE_CHILD : constant :=  16#40#;    --  winnt.h :1820
   FILE_READ_ATTRIBUTES : constant :=  16#80#;    --  winnt.h :1822
   FILE_WRITE_ATTRIBUTES : constant :=  16#100#;   --  winnt.h :1824
   FILE_ALL_ACCESS : constant :=  16#1f01ff#; --  winnt.h :1826
   FILE_GENERIC_READ : constant :=  16#120089#; --  winnt.h :1828
   FILE_GENERIC_WRITE : constant :=  16#120116#; --  winnt.h :1835
   FILE_GENERIC_EXECUTE : constant :=  16#1200a0#; --  winnt.h :1843
   FILE_SHARE_READ : constant :=  16#1#;     --  winnt.h :1848
   FILE_SHARE_WRITE : constant :=  16#2#;     --  winnt.h :1849
   FILE_ATTRIBUTE_READONLY : constant :=  16#1#;     --  winnt.h :1850
   FILE_ATTRIBUTE_HIDDEN : constant :=  16#2#;     --  winnt.h :1851
   FILE_ATTRIBUTE_SYSTEM : constant :=  16#4#;     --  winnt.h :1852
   FILE_ATTRIBUTE_DIRECTORY : constant :=  16#10#;    --  winnt.h :1853
   FILE_ATTRIBUTE_ARCHIVE : constant :=  16#20#;    --  winnt.h :1854
   FILE_ATTRIBUTE_NORMAL : constant :=  16#80#;    --  winnt.h :1855
   FILE_ATTRIBUTE_TEMPORARY : constant :=  16#100#;   --  winnt.h :1856
   FILE_ATTRIBUTE_ATOMIC_WRITE : constant :=  16#200#;   --  winnt.h :1857
   FILE_ATTRIBUTE_XACTION_WRITE : constant :=  16#400#;   --  winnt.h :1858
   FILE_ATTRIBUTE_COMPRESSED : constant :=  16#800#;   --  winnt.h :1859
   FILE_NOTIFY_CHANGE_FILE_NAME : constant :=  16#1#;     --  winnt.h :1860
   FILE_NOTIFY_CHANGE_DIR_NAME : constant :=  16#2#;     --  winnt.h :1861
   FILE_NOTIFY_CHANGE_ATTRIBUTES : constant :=  16#4#;     --  winnt.h :1862
   FILE_NOTIFY_CHANGE_SIZE : constant :=  16#8#;     --  winnt.h :1863
   FILE_NOTIFY_CHANGE_LAST_WRITE : constant :=  16#10#;    --  winnt.h :1864
   FILE_NOTIFY_CHANGE_SECURITY : constant :=  16#100#;   --  winnt.h :1865
   MAILSLOT_NO_MESSAGE : constant DWORD :=  -1;  --  winnt.h :1866
   MAILSLOT_WAIT_FOREVER : constant DWORD :=  -1;  --  winnt.h :1867
   FILE_CASE_SENSITIVE_SEARCH : constant :=  16#1#;     --  winnt.h :1868
   FILE_CASE_PRESERVED_NAMES : constant :=  16#2#;     --  winnt.h :1869
   FILE_UNICODE_ON_DISK : constant :=  16#4#;     --  winnt.h :1870
   FILE_PERSISTENT_ACLS : constant :=  16#8#;     --  winnt.h :1871
   FILE_FILE_COMPRESSION : constant :=  16#10#;    --  winnt.h :1872
   FILE_VOLUME_IS_COMPRESSED : constant :=  16#8000#;  --  winnt.h :1873
   IO_COMPLETION_MODIFY_STATE : constant :=  16#2#;     --  winnt.h :1874
   IO_COMPLETION_ALL_ACCESS : constant :=  16#1f0003#; --  winnt.h :1875
   DUPLICATE_CLOSE_SOURCE : constant :=  16#1#;     --  winnt.h :1876
   DUPLICATE_SAME_ACCESS : constant :=  16#2#;     --  winnt.h :1877
   DELETE : constant :=  16#10000#; --  winnt.h :1935
   READ_CONTROL : constant :=  16#20000#; --  winnt.h :1936
   WRITE_DAC : constant :=  16#40000#; --  winnt.h :1937
   WRITE_OWNER : constant :=  16#80000#; --  winnt.h :1938
   SYNCHRONIZE : constant :=  16#100000#; --  winnt.h :1939
   STANDARD_RIGHTS_REQUIRED : constant :=  16#f0000#; --  winnt.h :1941
   STANDARD_RIGHTS_READ : constant :=  16#20000#; --  winnt.h :1943
   STANDARD_RIGHTS_WRITE : constant :=  16#20000#; --  winnt.h :1944
   STANDARD_RIGHTS_EXECUTE : constant :=  16#20000#; --  winnt.h :1945
   STANDARD_RIGHTS_ALL : constant :=  16#1f0000#; --  winnt.h :1947
   SPECIFIC_RIGHTS_ALL : constant :=  16#ffff#;  --  winnt.h :1949
   ACCESS_SYSTEM_SECURITY : constant :=  16#1000000#;
   --  winnt.h :1955
   MAXIMUM_ALLOWED : constant :=  16#2000000#;
   --  winnt.h :1961
   GENERIC_READ : constant :=  16#80000000#;
   --  winnt.h :1967
   GENERIC_WRITE : constant :=  16#40000000#;
   --  winnt.h :1968
   GENERIC_EXECUTE : constant :=  16#20000000#;
   --  winnt.h :1969
   GENERIC_ALL : constant :=  16#10000000#;
   --  winnt.h :1970
   SID_REVISION : constant :=  1;         --  winnt.h :2058
   SID_MAX_SUB_AUTHORITIES : constant :=  15;        --  winnt.h :2059
   SID_RECOMMENDED_SUB_AUTHORITIES : constant :=  1;         --  winnt.h :2060
   SECURITY_NULL_RID : constant :=  16#0#;     --  winnt.h :2106
   SECURITY_WORLD_RID : constant :=  16#0#;     --  winnt.h :2107
   SECURITY_LOCAL_RID : constant :=  16#0#;     --  winnt.h :2108
   SECURITY_CREATOR_OWNER_RID : constant :=  16#0#;     --  winnt.h :2110
   SECURITY_CREATOR_GROUP_RID : constant :=  16#1#;     --  winnt.h :2111
   SECURITY_DIALUP_RID : constant :=  16#1#;     --  winnt.h :2140
   SECURITY_NETWORK_RID : constant :=  16#2#;     --  winnt.h :2141
   SECURITY_BATCH_RID : constant :=  16#3#;     --  winnt.h :2142
   SECURITY_INTERACTIVE_RID : constant :=  16#4#;     --  winnt.h :2143
   SECURITY_SERVICE_RID : constant :=  16#6#;     --  winnt.h :2144
   SECURITY_ANONYMOUS_LOGON_RID : constant :=  16#7#;     --  winnt.h :2145
   SECURITY_LOGON_IDS_RID : constant :=  16#5#;     --  winnt.h :2147
   SECURITY_LOGON_IDS_RID_COUNT : constant :=  3;         --  winnt.h :2148
   SECURITY_LOCAL_SYSTEM_RID : constant :=  16#12#;    --  winnt.h :2150
   SECURITY_NT_NON_UNIQUE : constant :=  16#15#;    --  winnt.h :2152
   SECURITY_BUILTIN_DOMAIN_RID : constant :=  16#20#;    --  winnt.h :2154
   DOMAIN_USER_RID_ADMIN : constant :=  16#1f4#;   --  winnt.h :2168
   DOMAIN_USER_RID_GUEST : constant :=  16#1f5#;   --  winnt.h :2169
   DOMAIN_GROUP_RID_ADMINS : constant :=  16#200#;   --  winnt.h :2175
   DOMAIN_GROUP_RID_USERS : constant :=  16#201#;   --  winnt.h :2176
   DOMAIN_GROUP_RID_GUESTS : constant :=  16#202#;   --  winnt.h :2177
   DOMAIN_ALIAS_RID_ADMINS : constant :=  16#220#;   --  winnt.h :2184
   DOMAIN_ALIAS_RID_USERS : constant :=  16#221#;   --  winnt.h :2185
   DOMAIN_ALIAS_RID_GUESTS : constant :=  16#222#;   --  winnt.h :2186
   DOMAIN_ALIAS_RID_POWER_USERS : constant :=  16#223#;   --  winnt.h :2187
   DOMAIN_ALIAS_RID_ACCOUNT_OPS : constant :=  16#224#;   --  winnt.h :2189
   DOMAIN_ALIAS_RID_SYSTEM_OPS : constant :=  16#225#;   --  winnt.h :2190
   DOMAIN_ALIAS_RID_PRINT_OPS : constant :=  16#226#;   --  winnt.h :2191
   DOMAIN_ALIAS_RID_BACKUP_OPS : constant :=  16#227#;   --  winnt.h :2192
   DOMAIN_ALIAS_RID_REPLICATOR : constant :=  16#228#;   --  winnt.h :2194
   SE_GROUP_MANDATORY : constant :=  16#1#;     --  winnt.h :2220
   SE_GROUP_ENABLED_BY_DEFAULT : constant :=  16#2#;     --  winnt.h :2221
   SE_GROUP_ENABLED : constant :=  16#4#;     --  winnt.h :2222
   SE_GROUP_OWNER : constant :=  16#8#;     --  winnt.h :2223
   SE_GROUP_LOGON_ID : constant :=  16#c0000000#;
   --  winnt.h :2224
   ACL_REVISION : constant :=  2;         --  winnt.h :2267
   ACL_REVISION1 : constant :=  1;         --  winnt.h :2272
   ACL_REVISION2 : constant :=  2;         --  winnt.h :2273
   ACCESS_ALLOWED_ACE_TYPE : constant :=  16#0#;     --  winnt.h :2316
   ACCESS_DENIED_ACE_TYPE : constant :=  16#1#;     --  winnt.h :2317
   SYSTEM_AUDIT_ACE_TYPE : constant :=  16#2#;     --  winnt.h :2318
   SYSTEM_ALARM_ACE_TYPE : constant :=  16#3#;     --  winnt.h :2319
   OBJECT_INHERIT_ACE : constant :=  16#1#;     --  winnt.h :2326
   CONTAINER_INHERIT_ACE : constant :=  16#2#;     --  winnt.h :2327
   NO_PROPAGATE_INHERIT_ACE : constant :=  16#4#;     --  winnt.h :2328
   INHERIT_ONLY_ACE : constant :=  16#8#;     --  winnt.h :2329
   VALID_INHERIT_FLAGS : constant :=  16#f#;     --  winnt.h :2330
   SUCCESSFUL_ACCESS_ACE_FLAG : constant :=  16#40#;    --  winnt.h :2350
   FAILED_ACCESS_ACE_FLAG : constant :=  16#80#;    --  winnt.h :2351
   SECURITY_DESCRIPTOR_REVISION : constant :=  1;         --  winnt.h :2466
   SECURITY_DESCRIPTOR_REVISION1 : constant :=  1;         --  winnt.h :2467
   SECURITY_DESCRIPTOR_MIN_LENGTH : constant :=  20;        --  winnt.h :2477
   SE_OWNER_DEFAULTED : constant :=  16#1#;     --  winnt.h :2482
   SE_GROUP_DEFAULTED : constant :=  16#2#;     --  winnt.h :2483
   SE_DACL_PRESENT : constant :=  16#4#;     --  winnt.h :2484
   SE_DACL_DEFAULTED : constant :=  16#8#;     --  winnt.h :2485
   SE_SACL_PRESENT : constant :=  16#10#;    --  winnt.h :2486
   SE_SACL_DEFAULTED : constant :=  16#20#;    --  winnt.h :2487
   SE_SELF_RELATIVE : constant :=  16#8000#;  --  winnt.h :2488
   SE_PRIVILEGE_ENABLED_BY_DEFAULT : constant :=  16#1#;     --  winnt.h :2627
   SE_PRIVILEGE_ENABLED : constant :=  16#2#;     --  winnt.h :2628
   SE_PRIVILEGE_USED_FOR_ACCESS : constant :=  16#80000000#;
   --  winnt.h :2629
   PRIVILEGE_SET_ALL_NECESSARY : constant :=  1;         --  winnt.h :2635
   SECURITY_DYNAMIC_TRACKING : constant :=  1;         --  winnt.h :2717
   SECURITY_STATIC_TRACKING : constant :=  0;         --  winnt.h :2718
   TOKEN_ASSIGN_PRIMARY : constant :=  16#1#;     --  winnt.h :2761
   TOKEN_DUPLICATE : constant :=  16#2#;     --  winnt.h :2762
   TOKEN_IMPERSONATE : constant :=  16#4#;     --  winnt.h :2763
   TOKEN_QUERY : constant :=  16#8#;     --  winnt.h :2764
   TOKEN_QUERY_SOURCE : constant :=  16#10#;    --  winnt.h :2765
   TOKEN_ADJUST_PRIVILEGES : constant :=  16#20#;    --  winnt.h :2766
   TOKEN_ADJUST_GROUPS : constant :=  16#40#;    --  winnt.h :2767
   TOKEN_ADJUST_DEFAULT : constant :=  16#80#;    --  winnt.h :2768
   TOKEN_ALL_ACCESS : constant :=  16#f00ff#; --  winnt.h :2770
   TOKEN_READ : constant :=  16#20008#; --  winnt.h :2781
   TOKEN_WRITE : constant :=  16#200e0#; --  winnt.h :2785
   TOKEN_EXECUTE : constant :=  16#20000#; --  winnt.h :2790
   TOKEN_SOURCE_LENGTH : constant :=  8;         --  winnt.h :2863
   OWNER_SECURITY_INFORMATION : constant :=  16#1#;     --  winnt.h :2898
   GROUP_SECURITY_INFORMATION : constant :=  16#2#;     --  winnt.h :2899
   DACL_SECURITY_INFORMATION : constant :=  16#4#;     --  winnt.h :2900
   SACL_SECURITY_INFORMATION : constant :=  16#8#;     --  winnt.h :2901
   IMAGE_DOS_SIGNATURE : constant :=  16#5a4d#;  --  winnt.h :2911
   IMAGE_OS2_SIGNATURE : constant :=  16#454e#;  --  winnt.h :2912
   IMAGE_OS2_SIGNATURE_LE : constant :=  16#454c#;  --  winnt.h :2913
   IMAGE_NT_SIGNATURE : constant :=  16#4550#;  --  winnt.h :2914
   IMAGE_SIZEOF_FILE_HEADER : constant :=  20;        --  winnt.h :2985
   IMAGE_FILE_RELOCS_STRIPPED : constant :=  16#1#;     --  winnt.h :2987
   IMAGE_FILE_EXECUTABLE_IMAGE : constant :=  16#2#;     --  winnt.h :2988
   IMAGE_FILE_LINE_NUMS_STRIPPED : constant :=  16#4#;     --  winnt.h :2989
   IMAGE_FILE_LOCAL_SYMS_STRIPPED : constant :=  16#8#;     --  winnt.h :2990
   IMAGE_FILE_BYTES_REVERSED_LO : constant :=  16#80#;    --  winnt.h :2991
   IMAGE_FILE_32BIT_MACHINE : constant :=  16#100#;   --  winnt.h :2992
   IMAGE_FILE_DEBUG_STRIPPED : constant :=  16#200#;   --  winnt.h :2993
   IMAGE_FILE_SYSTEM : constant :=  16#1000#;  --  winnt.h :2994
   IMAGE_FILE_DLL : constant :=  16#2000#;  --  winnt.h :2995
   IMAGE_FILE_BYTES_REVERSED_HI : constant :=  16#8000#;  --  winnt.h :2996
   IMAGE_FILE_MACHINE_UNKNOWN : constant :=  0;         --  winnt.h :2998
   IMAGE_FILE_MACHINE_I386 : constant :=  16#14c#;   --  winnt.h :2999
   IMAGE_FILE_MACHINE_R3000 : constant :=  16#162#;   --  winnt.h :3000
   IMAGE_FILE_MACHINE_R4000 : constant :=  16#166#;   --  winnt.h :3001
   IMAGE_FILE_MACHINE_ALPHA : constant :=  16#184#;   --  winnt.h :3002
   IMAGE_FILE_MACHINE_POWERPC : constant :=  16#1f0#;   --  winnt.h :3003
   IMAGE_NUMBEROF_DIRECTORY_ENTRIES : constant :=  16;       --  winnt.h :3014
   IMAGE_SIZEOF_ROM_OPTIONAL_HEADER : constant :=  56;       --  winnt.h :3079
   IMAGE_SIZEOF_STD_OPTIONAL_HEADER : constant :=  28;       --  winnt.h :3080
   IMAGE_SIZEOF_NT_OPTIONAL_HEADER : constant :=  224;      --  winnt.h :3081
   IMAGE_NT_OPTIONAL_HDR_MAGIC : constant :=  16#10b#;  --  winnt.h :3083
   IMAGE_ROM_OPTIONAL_HDR_MAGIC : constant :=  16#107#;  --  winnt.h :3084
   IMAGE_SUBSYSTEM_UNKNOWN : constant :=  0;        --  winnt.h :3106
   IMAGE_SUBSYSTEM_NATIVE : constant :=  1;        --  winnt.h :3107
   IMAGE_SUBSYSTEM_WINDOWS_GUI : constant :=  2;        --  winnt.h :3108
   IMAGE_SUBSYSTEM_WINDOWS_CUI : constant :=  3;        --  winnt.h :3109
   IMAGE_SUBSYSTEM_OS2_CUI : constant :=  5;        --  winnt.h :3110
   IMAGE_SUBSYSTEM_POSIX_CUI : constant :=  7;        --  winnt.h :3111
   IMAGE_DIRECTORY_ENTRY_EXPORT : constant :=  0;        --  winnt.h :3116
   IMAGE_DIRECTORY_ENTRY_IMPORT : constant :=  1;        --  winnt.h :3117
   IMAGE_DIRECTORY_ENTRY_RESOURCE : constant :=  2;        --  winnt.h :3118
   IMAGE_DIRECTORY_ENTRY_EXCEPTION : constant :=  3;        --  winnt.h :3119
   IMAGE_DIRECTORY_ENTRY_SECURITY : constant :=  4;        --  winnt.h :3120
   IMAGE_DIRECTORY_ENTRY_BASERELOC : constant :=  5;        --  winnt.h :3121
   IMAGE_DIRECTORY_ENTRY_DEBUG : constant :=  6;        --  winnt.h :3122
   IMAGE_DIRECTORY_ENTRY_COPYRIGHT : constant :=  7;        --  winnt.h :3123
   IMAGE_DIRECTORY_ENTRY_GLOBALPTR : constant :=  8;        --  winnt.h :3124
   IMAGE_DIRECTORY_ENTRY_TLS : constant :=  9;        --  winnt.h :3125
   IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG : constant :=  10;      --  winnt.h :3126
   IMAGE_SIZEOF_SHORT_NAME : constant :=  8;       --  winnt.h :3132
   IMAGE_SIZEOF_SECTION_HEADER : constant :=  40;      --  winnt.h :3150
   IMAGE_SCN_TYPE_NO_PAD : constant :=  16#8#;   --  winnt.h :3152
   IMAGE_SCN_CNT_CODE : constant :=  16#20#;  --  winnt.h :3154
   IMAGE_SCN_CNT_INITIALIZED_DATA : constant :=  16#40#;  --  winnt.h :3155
   IMAGE_SCN_CNT_UNINITIALIZED_DATA : constant :=  16#80#;  --  winnt.h :3156
   IMAGE_SCN_LNK_OTHER : constant :=  16#100#; --  winnt.h :3158
   IMAGE_SCN_LNK_INFO : constant :=  16#200#; --  winnt.h :3159
   IMAGE_SCN_LNK_REMOVE : constant :=  16#800#; --  winnt.h :3160
   IMAGE_SCN_LNK_COMDAT : constant :=  16#1000#; --  winnt.h :3161
   IMAGE_SCN_ALIGN_1BYTES : constant :=  16#100000#;
   --  winnt.h :3163
   IMAGE_SCN_ALIGN_2BYTES : constant :=  16#200000#;
   --  winnt.h :3164
   IMAGE_SCN_ALIGN_4BYTES : constant :=  16#300000#;
   --  winnt.h :3165
   IMAGE_SCN_ALIGN_8BYTES : constant :=  16#400000#;
   --  winnt.h :3166
   IMAGE_SCN_ALIGN_16BYTES : constant :=  16#500000#;
   --  winnt.h :3167
   IMAGE_SCN_ALIGN_32BYTES : constant :=  16#600000#;
   --  winnt.h :3168
   IMAGE_SCN_ALIGN_64BYTES : constant :=  16#700000#;
   --  winnt.h :3169
   IMAGE_SCN_MEM_DISCARDABLE : constant :=  16#2000000#;
   --  winnt.h :3171
   IMAGE_SCN_MEM_NOT_CACHED : constant :=  16#4000000#;
   --  winnt.h :3172
   IMAGE_SCN_MEM_NOT_PAGED : constant :=  16#8000000#;
   --  winnt.h :3173
   IMAGE_SCN_MEM_SHARED : constant :=  16#10000000#;
   --  winnt.h :3174
   IMAGE_SCN_MEM_EXECUTE : constant :=  16#20000000#;
   --  winnt.h :3175
   IMAGE_SCN_MEM_READ : constant :=  16#40000000#;
   --  winnt.h :3176
   IMAGE_SCN_MEM_WRITE : constant :=  16#80000000#;
   --  winnt.h :3177
   IMAGE_SIZEOF_SYMBOL : constant :=  18;      --  winnt.h :3200
   IMAGE_SYM_UNDEFINED : constant SHORT :=  0; --  winnt.h :3209
   IMAGE_SYM_ABSOLUTE : constant SHORT :=  -1; --  winnt.h :3210
   IMAGE_SYM_DEBUG : constant SHORT :=  -2; --  winnt.h :3211
   IMAGE_SYM_TYPE_NULL : constant :=  0;       --  winnt.h :3217
   IMAGE_SYM_TYPE_VOID : constant :=  1;       --  winnt.h :3218
   IMAGE_SYM_TYPE_CHAR : constant :=  2;       --  winnt.h :3219
   IMAGE_SYM_TYPE_SHORT : constant :=  3;       --  winnt.h :3220
   IMAGE_SYM_TYPE_INT : constant :=  4;       --  winnt.h :3221
   IMAGE_SYM_TYPE_LONG : constant :=  5;       --  winnt.h :3222
   IMAGE_SYM_TYPE_FLOAT : constant :=  6;       --  winnt.h :3223
   IMAGE_SYM_TYPE_DOUBLE : constant :=  7;       --  winnt.h :3224
   IMAGE_SYM_TYPE_STRUCT : constant :=  8;       --  winnt.h :3225
   IMAGE_SYM_TYPE_UNION : constant :=  9;       --  winnt.h :3226
   IMAGE_SYM_TYPE_ENUM : constant :=  10;      --  winnt.h :3227
   IMAGE_SYM_TYPE_MOE : constant :=  11;      --  winnt.h :3228
   IMAGE_SYM_TYPE_BYTE : constant :=  12;      --  winnt.h :3229
   IMAGE_SYM_TYPE_WORD : constant :=  13;      --  winnt.h :3230
   IMAGE_SYM_TYPE_UINT : constant :=  14;      --  winnt.h :3231
   IMAGE_SYM_TYPE_DWORD : constant :=  15;      --  winnt.h :3232
   IMAGE_SYM_DTYPE_NULL : constant :=  0;       --  winnt.h :3238
   IMAGE_SYM_DTYPE_POINTER : constant :=  1;       --  winnt.h :3239
   IMAGE_SYM_DTYPE_FUNCTION : constant :=  2;       --  winnt.h :3240
   IMAGE_SYM_DTYPE_ARRAY : constant :=  3;       --  winnt.h :3241
   IMAGE_SYM_CLASS_END_OF_FUNCTION : constant BYTE  :=  -1; --  winnt.h :3247
   IMAGE_SYM_CLASS_NULL : constant :=  0;       --  winnt.h :3248
   IMAGE_SYM_CLASS_AUTOMATIC : constant :=  1;       --  winnt.h :3249
   IMAGE_SYM_CLASS_EXTERNAL : constant :=  2;       --  winnt.h :3250
   IMAGE_SYM_CLASS_STATIC : constant :=  3;       --  winnt.h :3251
   IMAGE_SYM_CLASS_REGISTER : constant :=  4;       --  winnt.h :3252
   IMAGE_SYM_CLASS_EXTERNAL_DEF : constant :=  5;       --  winnt.h :3253
   IMAGE_SYM_CLASS_LABEL : constant :=  6;       --  winnt.h :3254
   IMAGE_SYM_CLASS_UNDEFINED_LABEL : constant :=  7;       --  winnt.h :3255
   IMAGE_SYM_CLASS_MEMBER_OF_STRUCT : constant :=  8;       --  winnt.h :3256
   IMAGE_SYM_CLASS_ARGUMENT : constant :=  9;       --  winnt.h :3257
   IMAGE_SYM_CLASS_STRUCT_TAG : constant :=  10;      --  winnt.h :3258
   IMAGE_SYM_CLASS_MEMBER_OF_UNION : constant :=  11;      --  winnt.h :3259
   IMAGE_SYM_CLASS_UNION_TAG : constant :=  12;      --  winnt.h :3260
   IMAGE_SYM_CLASS_TYPE_DEFINITION : constant :=  13;      --  winnt.h :3261
   IMAGE_SYM_CLASS_UNDEFINED_STATIC : constant :=  14;      --  winnt.h :3262
   IMAGE_SYM_CLASS_ENUM_TAG : constant :=  15;      --  winnt.h :3263
   IMAGE_SYM_CLASS_MEMBER_OF_ENUM : constant :=  16;      --  winnt.h :3264
   IMAGE_SYM_CLASS_REGISTER_PARAM : constant :=  17;      --  winnt.h :3265
   IMAGE_SYM_CLASS_BIT_FIELD : constant :=  18;      --  winnt.h :3266
   IMAGE_SYM_CLASS_BLOCK : constant :=  100;     --  winnt.h :3267
   IMAGE_SYM_CLASS_FUNCTION : constant :=  101;     --  winnt.h :3268
   IMAGE_SYM_CLASS_END_OF_STRUCT : constant :=  102;     --  winnt.h :3269
   IMAGE_SYM_CLASS_FILE : constant :=  103;     --  winnt.h :3270
   IMAGE_SYM_CLASS_SECTION : constant :=  104;     --  winnt.h :3272
   IMAGE_SYM_CLASS_WEAK_EXTERNAL : constant :=  105;     --  winnt.h :3273
   N_BTMASK : constant :=  8#17#;   --  winnt.h :3277
   N_TMASK : constant :=  8#60#;   --  winnt.h :3278
   N_TMASK1 : constant :=  8#300#;  --  winnt.h :3279
   N_TMASK2 : constant :=  8#360#;  --  winnt.h :3280
   N_BTSHFT : constant :=  4;       --  winnt.h :3281
   N_TSHIFT : constant :=  2;       --  winnt.h :3282
   IMAGE_SIZEOF_AUX_SYMBOL : constant :=  18;      --  winnt.h :3356
   IMAGE_COMDAT_SELECT_NODUPLICATES : constant :=  1;       --  winnt.h :3362
   IMAGE_COMDAT_SELECT_ANY : constant :=  2;       --  winnt.h :3363
   IMAGE_COMDAT_SELECT_SAME_SIZE : constant :=  3;       --  winnt.h :3364
   IMAGE_COMDAT_SELECT_EXACT_MATCH : constant :=  4;       --  winnt.h :3365
   IMAGE_COMDAT_SELECT_ASSOCIATIVE : constant :=  5;       --  winnt.h :3366
   IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY : constant :=  1;      --  winnt.h :3368
   IMAGE_WEAK_EXTERN_SEARCH_LIBRARY : constant :=  2;      --  winnt.h :3369
   IMAGE_WEAK_EXTERN_SEARCH_ALIAS : constant :=  3;      --  winnt.h :3370
   IMAGE_SIZEOF_RELOCATION : constant :=  10;     --  winnt.h :3384
   IMAGE_REL_I386_ABSOLUTE : constant :=  0;      --  winnt.h :3390
   IMAGE_REL_I386_DIR16 : constant :=  8#1#;   --  winnt.h :3391
   IMAGE_REL_I386_REL16 : constant :=  8#2#;   --  winnt.h :3392
   IMAGE_REL_I386_DIR32 : constant :=  8#6#;   --  winnt.h :3393
   IMAGE_REL_I386_DIR32NB : constant :=  8#7#;   --  winnt.h :3394
   IMAGE_REL_I386_SEG12 : constant :=  8#11#;  --  winnt.h :3395
   IMAGE_REL_I386_SECTION : constant :=  8#12#;  --  winnt.h :3396
   IMAGE_REL_I386_SECREL : constant :=  8#13#;  --  winnt.h :3397
   IMAGE_REL_I386_REL32 : constant :=  8#24#;  --  winnt.h :3398
   IMAGE_REL_MIPS_ABSOLUTE : constant :=  0;      --  winnt.h :3404
   IMAGE_REL_MIPS_REFHALF : constant :=  8#1#;   --  winnt.h :3405
   IMAGE_REL_MIPS_REFWORD : constant :=  8#2#;   --  winnt.h :3406
   IMAGE_REL_MIPS_JMPADDR : constant :=  8#3#;   --  winnt.h :3407
   IMAGE_REL_MIPS_REFHI : constant :=  8#4#;   --  winnt.h :3408
   IMAGE_REL_MIPS_REFLO : constant :=  8#5#;   --  winnt.h :3409
   IMAGE_REL_MIPS_GPREL : constant :=  8#6#;   --  winnt.h :3410
   IMAGE_REL_MIPS_LITERAL : constant :=  8#7#;   --  winnt.h :3411
   IMAGE_REL_MIPS_SECTION : constant :=  8#12#;  --  winnt.h :3412
   IMAGE_REL_MIPS_SECREL : constant :=  8#13#;  --  winnt.h :3413
   IMAGE_REL_MIPS_REFWORDNB : constant :=  8#42#;  --  winnt.h :3414
   IMAGE_REL_MIPS_PAIR : constant :=  8#45#;  --  winnt.h :3415
   IMAGE_REL_ALPHA_ABSOLUTE : constant :=  16#0#;  --  winnt.h :3421
   IMAGE_REL_ALPHA_REFLONG : constant :=  16#1#;  --  winnt.h :3422
   IMAGE_REL_ALPHA_REFQUAD : constant :=  16#2#;  --  winnt.h :3423
   IMAGE_REL_ALPHA_GPREL32 : constant :=  16#3#;  --  winnt.h :3424
   IMAGE_REL_ALPHA_LITERAL : constant :=  16#4#;  --  winnt.h :3425
   IMAGE_REL_ALPHA_LITUSE : constant :=  16#5#;  --  winnt.h :3426
   IMAGE_REL_ALPHA_GPDISP : constant :=  16#6#;  --  winnt.h :3427
   IMAGE_REL_ALPHA_BRADDR : constant :=  16#7#;  --  winnt.h :3428
   IMAGE_REL_ALPHA_HINT : constant :=  16#8#;  --  winnt.h :3429
   IMAGE_REL_ALPHA_INLINE_REFLONG : constant :=  16#9#;  --  winnt.h :3430
   IMAGE_REL_ALPHA_REFHI : constant :=  16#a#;  --  winnt.h :3431
   IMAGE_REL_ALPHA_REFLO : constant :=  16#b#;  --  winnt.h :3432
   IMAGE_REL_ALPHA_PAIR : constant :=  16#c#;  --  winnt.h :3433
   IMAGE_REL_ALPHA_MATCH : constant :=  16#d#;  --  winnt.h :3434
   IMAGE_REL_ALPHA_SECTION : constant :=  16#e#;  --  winnt.h :3435
   IMAGE_REL_ALPHA_SECREL : constant :=  16#f#;  --  winnt.h :3436
   IMAGE_REL_ALPHA_REFLONGNB : constant :=  16#10#; --  winnt.h :3437
   IMAGE_REL_PPC_ABSOLUTE : constant :=  16#0#;  --  winnt.h :3443
   IMAGE_REL_PPC_ADDR64 : constant :=  16#1#;  --  winnt.h :3444
   IMAGE_REL_PPC_ADDR32 : constant :=  16#2#;  --  winnt.h :3445
   IMAGE_REL_PPC_ADDR24 : constant :=  16#3#;  --  winnt.h :3446
   IMAGE_REL_PPC_ADDR16 : constant :=  16#4#;  --  winnt.h :3447
   IMAGE_REL_PPC_ADDR14 : constant :=  16#5#;  --  winnt.h :3448
   IMAGE_REL_PPC_REL24 : constant :=  16#6#;  --  winnt.h :3449
   IMAGE_REL_PPC_REL14 : constant :=  16#7#;  --  winnt.h :3450
   IMAGE_REL_PPC_TOCREL16 : constant :=  16#8#;  --  winnt.h :3451
   IMAGE_REL_PPC_TOCREL14 : constant :=  16#9#;  --  winnt.h :3452
   IMAGE_REL_PPC_ADDR32NB : constant :=  16#a#;  --  winnt.h :3454
   IMAGE_REL_PPC_SECREL : constant :=  16#b#;  --  winnt.h :3455
   IMAGE_REL_PPC_SECTION : constant :=  16#c#;  --  winnt.h :3456
   IMAGE_REL_PPC_IFGLUE : constant :=  16#d#;  --  winnt.h :3457
   IMAGE_REL_PPC_IMGLUE : constant :=  16#e#;  --  winnt.h :3458
   IMAGE_REL_PPC_TYPEMASK : constant :=  16#ff#; --  winnt.h :3460
   IMAGE_REL_PPC_NEG : constant :=  16#100#; --  winnt.h :3464
   IMAGE_REL_PPC_BRTAKEN : constant :=  16#200#; --  winnt.h :3465
   IMAGE_REL_PPC_BRNTAKEN : constant :=  16#400#; --  winnt.h :3466
   IMAGE_REL_PPC_TOCDEFN : constant :=  16#800#; --  winnt.h :3467
   IMAGE_SIZEOF_BASE_RELOCATION : constant :=  8;      --  winnt.h :3479
   IMAGE_REL_BASED_ABSOLUTE : constant :=  0;      --  winnt.h :3485
   IMAGE_REL_BASED_HIGH : constant :=  1;      --  winnt.h :3486
   IMAGE_REL_BASED_LOW : constant :=  2;      --  winnt.h :3487
   IMAGE_REL_BASED_HIGHLOW : constant :=  3;      --  winnt.h :3488
   IMAGE_REL_BASED_HIGHADJ : constant :=  4;      --  winnt.h :3489
   IMAGE_REL_BASED_MIPS_JMPADDR : constant :=  5;      --  winnt.h :3490
   IMAGE_SIZEOF_LINENUMBER : constant :=  6;      --  winnt.h :3505
   IMAGE_ARCHIVE_START_SIZE : constant :=  8;      --  winnt.h :3511
   IMAGE_ARCHIVE_START : constant CHAR_Array :=
     "!<arch>" & CHAR (ASCII.LF) & Nul;
   --  winnt.h :3512
   IMAGE_ARCHIVE_END : constant CHAR_Array :=
     "`" & CHAR (ASCII.LF) & Nul;
   --  winnt.h :3513
   IMAGE_ARCHIVE_PAD : constant CHAR_Array :=
     "" & CHAR (ASCII.LF) & Nul;
   --  winnt.h :3514
   IMAGE_ARCHIVE_LINKER_MEMBER : constant CHAR_Array :=
     "/               " & Nul;
   --  winnt.h :3515
   IMAGE_ARCHIVE_LONGNAMES_MEMBER : constant CHAR_Array :=
     "//              " & Nul;
   --  winnt.h :3516
   IMAGE_SIZEOF_ARCHIVE_MEMBER_HDR : constant :=  60;     --  winnt.h :3528
   IMAGE_ORDINAL_FLAG : constant :=  16#80000000#;
   --  winnt.h :3569
   IMAGE_RESOURCE_NAME_IS_STRING : constant :=  16#80000000#;
   --  winnt.h :3630
   IMAGE_RESOURCE_DATA_IS_DIRECTORY : constant :=  16#80000000#;
   --  winnt.h :3631
   IMAGE_DEBUG_TYPE_UNKNOWN : constant :=  0;      --  winnt.h :3741
   IMAGE_DEBUG_TYPE_COFF : constant :=  1;      --  winnt.h :3742
   IMAGE_DEBUG_TYPE_CODEVIEW : constant :=  2;      --  winnt.h :3743
   IMAGE_DEBUG_TYPE_FPO : constant :=  3;      --  winnt.h :3744
   IMAGE_DEBUG_TYPE_MISC : constant :=  4;      --  winnt.h :3745
   IMAGE_DEBUG_TYPE_EXCEPTION : constant :=  5;      --  winnt.h :3746
   IMAGE_DEBUG_TYPE_FIXUP : constant :=  6;      --  winnt.h :3747
   IMAGE_DEBUG_TYPE_OMAP_TO_SRC : constant :=  7;      --  winnt.h :3748
   IMAGE_DEBUG_TYPE_OMAP_FROM_SRC : constant :=  8;      --  winnt.h :3749
   FRAME_FPO : constant :=  0;      --  winnt.h :3762
   FRAME_TRAP : constant :=  1;      --  winnt.h :3763
   FRAME_TSS : constant :=  2;      --  winnt.h :3764
   SIZEOF_RFPO_DATA : constant :=  16;     --  winnt.h :3778
   IMAGE_DEBUG_MISC_EXENAME : constant :=  1;      --  winnt.h :3781
   IMAGE_SEPARATE_DEBUG_SIGNATURE : constant :=  16#4944#;
   --  winnt.h :3840
   HEAP_NO_SERIALIZE : constant :=  16#1#;  --  winnt.h :3853
   HEAP_GROWABLE : constant :=  16#2#;  --  winnt.h :3854
   HEAP_GENERATE_EXCEPTIONS : constant :=  16#4#;  --  winnt.h :3855
   HEAP_ZERO_MEMORY : constant :=  16#8#;  --  winnt.h :3856
   HEAP_REALLOC_IN_PLACE_ONLY : constant :=  16#10#; --  winnt.h :3857
   HEAP_TAIL_CHECKING_ENABLED : constant :=  16#20#; --  winnt.h :3858
   HEAP_FREE_CHECKING_ENABLED : constant :=  16#40#; --  winnt.h :3859
   HEAP_DISABLE_COALESCE_ON_FREE : constant :=  16#80#; --  winnt.h :3860
   IS_TEXT_UNICODE_ASCII16 : constant :=  16#1#;  --  winnt.h :3862
   IS_TEXT_UNICODE_REVERSE_ASCII16 : constant :=  16#10#; --  winnt.h :3863
   IS_TEXT_UNICODE_STATISTICS : constant :=  16#2#;  --  winnt.h :3865
   IS_TEXT_UNICODE_REVERSE_STATISTICS : constant :=  16#20#; --  winnt.h :3866
   IS_TEXT_UNICODE_CONTROLS : constant :=  16#4#;  --  winnt.h :3868
   IS_TEXT_UNICODE_REVERSE_CONTROLS : constant :=  16#40#; --  winnt.h :3869
   IS_TEXT_UNICODE_SIGNATURE : constant :=  16#8#;  --  winnt.h :3871
   IS_TEXT_UNICODE_REVERSE_SIGNATURE : constant :=  16#80#; --  winnt.h :3872
   IS_TEXT_UNICODE_ILLEGAL_CHARS : constant :=  16#100#; --  winnt.h :3874
   IS_TEXT_UNICODE_ODD_LENGTH : constant :=  16#200#; --  winnt.h :3875
   IS_TEXT_UNICODE_DBCS_LEADBYTE : constant :=  16#400#; --  winnt.h :3876
   IS_TEXT_UNICODE_NULL_BYTES : constant :=  16#1000#;
   --  winnt.h :3877
   IS_TEXT_UNICODE_UNICODE_MASK : constant :=  16#f#;  --  winnt.h :3879
   IS_TEXT_UNICODE_REVERSE_MASK : constant :=  16#f0#; --  winnt.h :3880
   IS_TEXT_UNICODE_NOT_UNICODE_MASK : constant :=  16#f00#; --  winnt.h :3881
   IS_TEXT_UNICODE_NOT_ASCII_MASK : constant :=  16#f000#;
   --  winnt.h :3882
   COMPRESSION_FORMAT_NONE : constant :=  16#0#;  --  winnt.h :3884
   COMPRESSION_FORMAT_DEFAULT : constant :=  16#1#;  --  winnt.h :3885
   COMPRESSION_FORMAT_LZNT1 : constant :=  16#2#;  --  winnt.h :3886
   COMPRESSION_ENGINE_STANDARD : constant :=  16#0#;  --  winnt.h :3887
   COMPRESSION_ENGINE_MAXIMUM : constant :=  16#100#; --  winnt.h :3888
   MESSAGE_RESOURCE_UNICODE : constant :=  16#1#;  --  winnt.h :3936
   RTL_CRITSECT_TYPE : constant :=  0;      --  winnt.h :3961
   RTL_RESOURCE_TYPE : constant :=  1;      --  winnt.h :3962
   DLL_PROCESS_ATTACH : constant :=  1;      --  winnt.h :3978
   DLL_THREAD_ATTACH : constant :=  2;      --  winnt.h :3979
   DLL_THREAD_DETACH : constant :=  3;      --  winnt.h :3980
   DLL_PROCESS_DETACH : constant :=  0;      --  winnt.h :3981
   EVENTLOG_SEQUENTIAL_READ : constant :=  16#1#;  --  winnt.h :3986
   EVENTLOG_SEEK_READ : constant :=  16#2#;  --  winnt.h :3987
   EVENTLOG_FORWARDS_READ : constant :=  16#4#;  --  winnt.h :3988
   EVENTLOG_BACKWARDS_READ : constant :=  16#8#;  --  winnt.h :3989
   EVENTLOG_SUCCESS : constant :=  16#0#;  --  winnt.h :3994
   EVENTLOG_ERROR_TYPE : constant :=  16#1#;  --  winnt.h :3995
   EVENTLOG_WARNING_TYPE : constant :=  16#2#;  --  winnt.h :3996
   EVENTLOG_INFORMATION_TYPE : constant :=  16#4#;  --  winnt.h :3997
   EVENTLOG_AUDIT_SUCCESS : constant :=  16#8#;  --  winnt.h :3998
   EVENTLOG_AUDIT_FAILURE : constant :=  16#10#; --  winnt.h :3999
   EVENTLOG_START_PAIRED_EVENT : constant :=  16#1#;  --  winnt.h :4006
   EVENTLOG_END_PAIRED_EVENT : constant :=  16#2#;  --  winnt.h :4007
   EVENTLOG_END_ALL_PAIRED_EVENTS : constant :=  16#4#;  --  winnt.h :4008
   EVENTLOG_PAIRED_EVENT_ACTIVE : constant :=  16#8#;  --  winnt.h :4009
   EVENTLOG_PAIRED_EVENT_INACTIVE : constant :=  16#10#; --  winnt.h :4010
   DBG_CONTINUE : constant DWORD    :=  16#10002#;
   --  winnt.h :4051
   DBG_TERMINATE_THREAD : constant DWORD    :=  16#40010003#;
   --  winnt.h :4052
   DBG_TERMINATE_PROCESS : constant DWORD    :=  16#40010004#;
   --  winnt.h :4053
   DBG_CONTROL_C : constant DWORD    :=  16#40010005#;
   --  winnt.h :4054
   DBG_CONTROL_BREAK : constant DWORD    :=  16#40010008#;
   --  winnt.h :4055
   DBG_EXCEPTION_NOT_HANDLED : constant DWORD    :=  16#80010001#;
   --  winnt.h :4056
   KEY_QUERY_VALUE : constant :=  16#1#;  --  winnt.h :4064
   KEY_SET_VALUE : constant :=  16#2#;  --  winnt.h :4065
   KEY_CREATE_SUB_KEY : constant :=  16#4#;  --  winnt.h :4066
   KEY_ENUMERATE_SUB_KEYS : constant :=  16#8#;  --  winnt.h :4067
   KEY_NOTIFY : constant :=  16#10#; --  winnt.h :4068
   KEY_CREATE_LINK : constant :=  16#20#; --  winnt.h :4069
   KEY_READ : constant :=  16#20019#;
   --  winnt.h :4071
   KEY_WRITE : constant :=  16#20006#;
   --  winnt.h :4079
   KEY_EXECUTE : constant :=  16#20019#;
   --  winnt.h :4085
   KEY_ALL_ACCESS : constant :=  16#f003f#;
   --  winnt.h :4089
   REG_OPTION_RESERVED : constant :=  16#0#;  --  winnt.h :4103
   REG_OPTION_NON_VOLATILE : constant :=  16#0#;  --  winnt.h :4105
   REG_OPTION_VOLATILE : constant :=  16#1#;  --  winnt.h :4108
   REG_OPTION_CREATE_LINK : constant :=  16#2#;  --  winnt.h :4111
   REG_OPTION_BACKUP_RESTORE : constant :=  16#4#;  --  winnt.h :4114
   REG_LEGAL_OPTION : constant :=  16#7#;  --  winnt.h :4118
   REG_CREATED_NEW_KEY : constant :=  16#1#;  --  winnt.h :4129
   REG_OPENED_EXISTING_KEY : constant :=  16#2#;  --  winnt.h :4130
   REG_WHOLE_HIVE_VOLATILE : constant :=  16#1#;  --  winnt.h :4136
   REG_REFRESH_HIVE : constant :=  16#2#;  --  winnt.h :4137
   REG_NOTIFY_CHANGE_NAME : constant :=  16#1#;  --  winnt.h :4144
   REG_NOTIFY_CHANGE_ATTRIBUTES : constant :=  16#2#;  --  winnt.h :4145
   REG_NOTIFY_CHANGE_LAST_SET : constant :=  16#4#;  --  winnt.h :4146
   REG_NOTIFY_CHANGE_SECURITY : constant :=  16#8#;  --  winnt.h :4147
   REG_LEGAL_CHANGE_FILTER : constant :=  16#f#;  --  winnt.h :4149
   REG_NONE : constant :=  0;      --  winnt.h :4160
   REG_SZ : constant :=  1;      --  winnt.h :4161
   REG_EXPAND_SZ : constant :=  2;      --  winnt.h :4162
   REG_BINARY : constant :=  3;      --  winnt.h :4164
   REG_DWORD : constant :=  4;      --  winnt.h :4165
   REG_DWORD_LITTLE_ENDIAN : constant :=  4;      --  winnt.h :4166
   REG_DWORD_BIG_ENDIAN : constant :=  5;      --  winnt.h :4167
   REG_LINK : constant :=  6;      --  winnt.h :4168
   REG_MULTI_SZ : constant :=  7;      --  winnt.h :4169
   REG_RESOURCE_LIST : constant :=  8;      --  winnt.h :4170
   REG_FULL_RESOURCE_DESCRIPTOR : constant :=  9;      --  winnt.h :4171
   REG_RESOURCE_REQUIREMENTS_LIST : constant :=  10;     --  winnt.h :4172
   SERVICE_KERNEL_DRIVER : constant :=  16#1#;  --  winnt.h :4180
   SERVICE_FILE_SYSTEM_DRIVER : constant :=  16#2#;  --  winnt.h :4181
   SERVICE_ADAPTER : constant :=  16#4#;  --  winnt.h :4182
   SERVICE_RECOGNIZER_DRIVER : constant :=  16#8#;  --  winnt.h :4183
   SERVICE_DRIVER : constant :=  16#b#;  --  winnt.h :4185
   SERVICE_WIN32_OWN_PROCESS : constant :=  16#10#; --  winnt.h :4189
   SERVICE_WIN32_SHARE_PROCESS : constant :=  16#20#; --  winnt.h :4190
   SERVICE_WIN32 : constant :=  16#30#; --  winnt.h :4191
   SERVICE_INTERACTIVE_PROCESS : constant :=  16#100#; --  winnt.h :4194
   SERVICE_TYPE_ALL : constant :=  16#13f#; --  winnt.h :4196
   SERVICE_BOOT_START : constant :=  16#0#;  --  winnt.h :4205
   SERVICE_SYSTEM_START : constant :=  16#1#;  --  winnt.h :4206
   SERVICE_AUTO_START : constant :=  16#2#;  --  winnt.h :4207
   SERVICE_DEMAND_START : constant :=  16#3#;  --  winnt.h :4208
   SERVICE_DISABLED : constant :=  16#4#;  --  winnt.h :4209
   SERVICE_ERROR_IGNORE : constant :=  16#0#;  --  winnt.h :4214
   SERVICE_ERROR_NORMAL : constant :=  16#1#;  --  winnt.h :4215
   SERVICE_ERROR_SEVERE : constant :=  16#2#;  --  winnt.h :4216
   SERVICE_ERROR_CRITICAL : constant :=  16#3#;  --  winnt.h :4217
   TAPE_ERASE_SHORT : constant :=  0;      --  winnt.h :4253
   TAPE_ERASE_LONG : constant :=  1;      --  winnt.h :4254
   TAPE_LOAD : constant :=  0;      --  winnt.h :4265
   TAPE_UNLOAD : constant :=  1;      --  winnt.h :4266
   TAPE_TENSION : constant :=  2;      --  winnt.h :4267
   TAPE_LOCK : constant :=  3;      --  winnt.h :4268
   TAPE_UNLOCK : constant :=  4;      --  winnt.h :4269
   TAPE_FORMAT : constant :=  5;      --  winnt.h :4270
   TAPE_SETMARKS : constant :=  0;      --  winnt.h :4281
   TAPE_FILEMARKS : constant :=  1;      --  winnt.h :4282
   TAPE_SHORT_FILEMARKS : constant :=  2;      --  winnt.h :4283
   TAPE_LONG_FILEMARKS : constant :=  3;      --  winnt.h :4284
   TAPE_ABSOLUTE_POSITION : constant :=  0;      --  winnt.h :4296
   TAPE_LOGICAL_POSITION : constant :=  1;      --  winnt.h :4297
   TAPE_PSEUDO_LOGICAL_POSITION : constant :=  2;      --  winnt.h :4298
   TAPE_REWIND : constant :=  0;      --  winnt.h :4310
   TAPE_ABSOLUTE_BLOCK : constant :=  1;      --  winnt.h :4311
   TAPE_LOGICAL_BLOCK : constant :=  2;      --  winnt.h :4312
   TAPE_PSEUDO_LOGICAL_BLOCK : constant :=  3;      --  winnt.h :4313
   TAPE_SPACE_END_OF_DATA : constant :=  4;      --  winnt.h :4314
   TAPE_SPACE_RELATIVE_BLOCKS : constant :=  5;      --  winnt.h :4315
   TAPE_SPACE_FILEMARKS : constant :=  6;      --  winnt.h :4316
   TAPE_SPACE_SEQUENTIAL_FMKS : constant :=  7;      --  winnt.h :4317
   TAPE_SPACE_SETMARKS : constant :=  8;      --  winnt.h :4318
   TAPE_SPACE_SEQUENTIAL_SMKS : constant :=  9;      --  winnt.h :4319
   TAPE_DRIVE_FIXED : constant :=  16#1#;  --  winnt.h :4336
   TAPE_DRIVE_SELECT : constant :=  16#2#;  --  winnt.h :4337
   TAPE_DRIVE_INITIATOR : constant :=  16#4#;  --  winnt.h :4338
   TAPE_DRIVE_ERASE_SHORT : constant :=  16#10#; --  winnt.h :4340
   TAPE_DRIVE_ERASE_LONG : constant :=  16#20#; --  winnt.h :4341
   TAPE_DRIVE_ERASE_BOP_ONLY : constant :=  16#40#; --  winnt.h :4342
   TAPE_DRIVE_ERASE_IMMEDIATE : constant :=  16#80#; --  winnt.h :4343
   TAPE_DRIVE_TAPE_CAPACITY : constant :=  16#100#; --  winnt.h :4345
   TAPE_DRIVE_TAPE_REMAINING : constant :=  16#200#; --  winnt.h :4346
   TAPE_DRIVE_FIXED_BLOCK : constant :=  16#400#; --  winnt.h :4347
   TAPE_DRIVE_VARIABLE_BLOCK : constant :=  16#800#; --  winnt.h :4348
   TAPE_DRIVE_WRITE_PROTECT : constant :=  16#1000#;
   --  winnt.h :4350
   TAPE_DRIVE_EOT_WZ_SIZE : constant :=  16#2000#;
   --  winnt.h :4351
   TAPE_DRIVE_ECC : constant :=  16#10000#;
   --  winnt.h :4353
   TAPE_DRIVE_COMPRESSION : constant :=  16#20000#;
   --  winnt.h :4354
   TAPE_DRIVE_PADDING : constant :=  16#40000#;
   --  winnt.h :4355
   TAPE_DRIVE_REPORT_SMKS : constant :=  16#80000#;
   --  winnt.h :4356
   TAPE_DRIVE_GET_ABSOLUTE_BLK : constant :=  16#100000#;
   --  winnt.h :4358
   TAPE_DRIVE_GET_LOGICAL_BLK : constant :=  16#200000#;
   --  winnt.h :4359
   TAPE_DRIVE_SET_EOT_WZ_SIZE : constant :=  16#400000#;
   --  winnt.h :4360
   TAPE_DRIVE_RESERVED_BIT : constant :=  16#80000000#;
   --  winnt.h :4362
   TAPE_DRIVE_LOAD_UNLOAD : constant :=  16#80000001#;
   --  winnt.h :4370
   TAPE_DRIVE_TENSION : constant :=  16#80000002#;
   --  winnt.h :4371
   TAPE_DRIVE_LOCK_UNLOCK : constant :=  16#80000004#;
   --  winnt.h :4372
   TAPE_DRIVE_REWIND_IMMEDIATE : constant :=  16#80000008#;
   --  winnt.h :4373
   TAPE_DRIVE_SET_BLOCK_SIZE : constant :=  16#80000010#;
   --  winnt.h :4375
   TAPE_DRIVE_LOAD_UNLD_IMMED : constant :=  16#80000020#;
   --  winnt.h :4376
   TAPE_DRIVE_TENSION_IMMED : constant :=  16#80000040#;
   --  winnt.h :4377
   TAPE_DRIVE_LOCK_UNLK_IMMED : constant :=  16#80000080#;
   --  winnt.h :4378
   TAPE_DRIVE_SET_ECC : constant :=  16#80000100#;
   --  winnt.h :4380
   TAPE_DRIVE_SET_COMPRESSION : constant :=  16#80000200#;
   --  winnt.h :4381
   TAPE_DRIVE_SET_PADDING : constant :=  16#80000400#;
   --  winnt.h :4382
   TAPE_DRIVE_SET_REPORT_SMKS : constant :=  16#80000800#;
   --  winnt.h :4383
   TAPE_DRIVE_ABSOLUTE_BLK : constant :=  16#80001000#;
   --  winnt.h :4385
   TAPE_DRIVE_ABS_BLK_IMMED : constant :=  16#80002000#;
   --  winnt.h :4386
   TAPE_DRIVE_LOGICAL_BLK : constant :=  16#80004000#;
   --  winnt.h :4387
   TAPE_DRIVE_LOG_BLK_IMMED : constant :=  16#80008000#;
   --  winnt.h :4388
   TAPE_DRIVE_END_OF_DATA : constant :=  16#80010000#;
   --  winnt.h :4390
   TAPE_DRIVE_RELATIVE_BLKS : constant :=  16#80020000#;
   --  winnt.h :4391
   TAPE_DRIVE_FILEMARKS : constant :=  16#80040000#;
   --  winnt.h :4392
   TAPE_DRIVE_SEQUENTIAL_FMKS : constant :=  16#80080000#;
   --  winnt.h :4393
   TAPE_DRIVE_SETMARKS : constant :=  16#80100000#;
   --  winnt.h :4395
   TAPE_DRIVE_SEQUENTIAL_SMKS : constant :=  16#80200000#;
   --  winnt.h :4396
   TAPE_DRIVE_REVERSE_POSITION : constant :=  16#80400000#;
   --  winnt.h :4397
   TAPE_DRIVE_SPACE_IMMEDIATE : constant :=  16#80800000#;
   --  winnt.h :4398
   TAPE_DRIVE_WRITE_SETMARKS : constant :=  16#81000000#;
   --  winnt.h :4400
   TAPE_DRIVE_WRITE_FILEMARKS : constant :=  16#82000000#;
   --  winnt.h :4401
   TAPE_DRIVE_WRITE_SHORT_FMKS : constant :=  16#84000000#;
   --  winnt.h :4402
   TAPE_DRIVE_WRITE_LONG_FMKS : constant :=  16#88000000#;
   --  winnt.h :4403
   TAPE_DRIVE_WRITE_MARK_IMMED : constant :=  16#90000000#;
   --  winnt.h :4405
   TAPE_DRIVE_FORMAT : constant :=  16#a0000000#;
   --  winnt.h :4406
   TAPE_DRIVE_FORMAT_IMMEDIATE : constant :=  16#c0000000#;
   --  winnt.h :4407
   TAPE_DRIVE_HIGH_FEATURES : constant :=  16#80000000#;
   --  winnt.h :4408
   TAPE_FIXED_PARTITIONS : constant :=  0;      --  winnt.h :4460
   TAPE_SELECT_PARTITIONS : constant :=  1;      --  winnt.h :4461
   TAPE_INITIATOR_PARTITIONS : constant :=  2;      --  winnt.h :4462

   subtype TEXT is Win32.CHAR_Array;                       --  winnt.h :123

   SE_CREATE_TOKEN_NAME : constant TEXT :=
     "SeCreateTokenPrivilege" & Nul;                     --  winnt.h :2659
   SE_ASSIGNPRIMARYTOKEN_NAME : constant TEXT :=
     "SeAssignPrimaryTokenPrivilege" & Nul;              --  winnt.h :2660
   SE_LOCK_MEMORY_NAME : constant TEXT :=
     "SeLockMemoryPrivilege" & Nul;                      --  winnt.h :2661
   SE_INCREASE_QUOTA_NAME : constant TEXT :=
     "SeIncreaseQuotaPrivilege" & Nul;                   --  winnt.h :2662
   SE_UNSOLICITED_INPUT_NAME : constant TEXT :=
     "SeUnsolicitedInputPrivilege" & Nul;                --  winnt.h :2663
   SE_MACHINE_ACCOUNT_NAME : constant TEXT :=
     "SeMachineAccountPrivilege" & Nul;                  --  winnt.h :2664
   SE_TCB_NAME : constant TEXT :=
     "SeTcbPrivilege" & Nul;                             --  winnt.h :2665
   SE_SECURITY_NAME : constant TEXT :=
     "SeSecurityPrivilege" & Nul;                        --  winnt.h :2666
   SE_TAKE_OWNERSHIP_NAME : constant TEXT :=
     "SeTakeOwnershipPrivilege" & Nul;                   --  winnt.h :2667
   SE_LOAD_DRIVER_NAME : constant TEXT :=
     "SeLoadDriverPrivilege" & Nul;                      --  winnt.h :2668
   SE_SYSTEM_PROFILE_NAME : constant TEXT :=
     "SeSystemProfilePrivilege" & Nul;                   --  winnt.h :2669
   SE_SYSTEMTIME_NAME : constant TEXT :=
     "SeSystemtimePrivilege" & Nul;                      --  winnt.h :2670
   SE_PROF_SINGLE_PROCESS_NAME : constant TEXT :=
     "SeProfileSingleProcessPrivilege" & Nul;            --  winnt.h :2671
   SE_INC_BASE_PRIORITY_NAME : constant TEXT :=
     "SeIncreaseBasePriorityPrivilege" & Nul;            --  winnt.h :2672
   SE_CREATE_PAGEFILE_NAME : constant TEXT :=
     "SeCreatePagefilePrivilege" & Nul;                  --  winnt.h :2673
   SE_CREATE_PERMANENT_NAME : constant TEXT :=
     "SeCreatePermanentPrivilege" & Nul;                 --  winnt.h :2674
   SE_BACKUP_NAME : constant TEXT :=
     "SeBackupPrivilege" & Nul;                          --  winnt.h :2675
   SE_RESTORE_NAME : constant TEXT :=
     "SeRestorePrivilege" & Nul;                         --  winnt.h :2676
   SE_SHUTDOWN_NAME : constant TEXT :=
     "SeShutdownPrivilege" & Nul;                        --  winnt.h :2677
   SE_DEBUG_NAME : constant TEXT :=
     "SeDebugPrivilege" & Nul;                           --  winnt.h :2678
   SE_AUDIT_NAME : constant TEXT :=
     "SeAuditPrivilege" & Nul;                           --  winnt.h :2679
   SE_SYSTEM_ENVIRONMENT_NAME : constant TEXT :=
     "SeSystemEnvironmentPrivilege" & Nul;               --  winnt.h :2680
   SE_CHANGE_NOTIFY_NAME : constant TEXT :=
     "SeChangeNotifyPrivilege" & Nul;                    --  winnt.h :2681
   SE_REMOTE_SHUTDOWN_NAME : constant TEXT :=
     "SeRemoteShutdownPrivilege" & Nul;                  --  winnt.h :2682

   type TCHAR is new Win32.CHAR;                           --  winnt.h :115
   type TBYTE is new Win32.BYTE;                           --  winnt.h :116
   type CCHAR is new Win32.CHAR;                           --  winnt.h :147
   type LCID is new Win32.DWORD;                           --  winnt.h :148
   type LANGID is new Win32.WORD;                          --  winnt.h :150
   type BOOLEAN is new Win32.BYTE;                         --  winnt.h :438
   type KSPIN_LOCK is new Win32.DWORD;                     --  winnt.h :734
   type ACCESS_MASK is new Win32.DWORD;                    --  winnt.h :1920

   type SID_NAME_USE is ( --  winnt.h :2063
     SidTypeUser,                                        --  winnt.h :2064
     SidTypeGroup,                                       --  winnt.h :2065
     SidTypeDomain,                                      --  winnt.h :2066
     SidTypeAlias,                                       --  winnt.h :2067
     SidTypeWellKnownGroup,                              --  winnt.h :2068
     SidTypeDeletedAccount,                              --  winnt.h :2069
     SidTypeInvalid,                                     --  winnt.h :2070
     SidTypeUnknown                                      --  winnt.h :2072
                        );
   for SID_NAME_USE use ( --  winnt.h :2063
      SidTypeUser => 1,                                   --  winnt.h :2064
      SidTypeGroup => 2,                                  --  winnt.h :2065
      SidTypeDomain => 3,                                 --  winnt.h :2066
      SidTypeAlias => 4,                                  --  winnt.h :2067
      SidTypeWellKnownGroup => 5,                         --  winnt.h :2068
      SidTypeDeletedAccount => 6,                         --  winnt.h :2069
      SidTypeInvalid => 7,                                --  winnt.h :2070
      SidTypeUnknown => 8                                 --  winnt.h :2072
                        );
   for SID_NAME_USE'Size use 32;                           --  winnt.h :2063

   type ACL_INFORMATION_CLASS is ( --  winnt.h :2424
     AclRevisionInformation,                             --  winnt.h :2425
     AclSizeInformation                                  --  winnt.h :2427
                                 );
   for ACL_INFORMATION_CLASS use ( --  winnt.h :2424
      AclRevisionInformation => 1,                        --  winnt.h :2425
      AclSizeInformation => 2                             --  winnt.h :2427
                                 );
   for ACL_INFORMATION_CLASS'Size use 32;                  --  winnt.h :2424

   type SECURITY_DESCRIPTOR_CONTROL is new Win32.WORD;     --  winnt.h :2480

   type SECURITY_IMPERSONATION_LEVEL is ( --  winnt.h :2701
     SecurityAnonymous,                                  --  winnt.h :2702
     SecurityIdentification,                             --  winnt.h :2703
     SecurityImpersonation,                              --  winnt.h :2704
     SecurityDelegation                                  --  winnt.h :2706
                                        );
   for SECURITY_IMPERSONATION_LEVEL'Size use 32;           --  winnt.h :2701

   SECURITY_MAX_IMPERSONATION_LEVEL : constant              --  winnt.h :2708
     SECURITY_IMPERSONATION_LEVEL :=  SecurityDelegation;

   DEFAULT_IMPERSONATION_LEVEL : constant                   --  winnt.h :2710
     SECURITY_IMPERSONATION_LEVEL :=  SecurityImpersonation;

   type SECURITY_CONTEXT_TRACKING_MODE is new Win32.BYTE;  --  winnt.h :2720

   type TOKEN_TYPE is ( --  winnt.h :2798
     TokenPrimary,                                       --  winnt.h :2799
     TokenImpersonation                                  --  winnt.h :2801
                      );
   for TOKEN_TYPE use ( --  winnt.h :2798
      TokenPrimary => 1,                                  --  winnt.h :2799
      TokenImpersonation => 2                             --  winnt.h :2801
                      );
   for TOKEN_TYPE'Size use 32;                             --  winnt.h :2798

   type TOKEN_INFORMATION_CLASS is ( --  winnt.h :2811
     TokenUser,                                          --  winnt.h :2812
     TokenGroups,                                        --  winnt.h :2813
     TokenPrivileges,                                    --  winnt.h :2814
     TokenOwner,                                         --  winnt.h :2815
     TokenPrimaryGroup,                                  --  winnt.h :2816
     TokenDefaultDacl,                                   --  winnt.h :2817
     TokenSource,                                        --  winnt.h :2818
     TokenType,                                          --  winnt.h :2819
     TokenImpersonationLevel,                            --  winnt.h :2820
     TokenStatistics                                     --  winnt.h :2822
                                   );
   for TOKEN_INFORMATION_CLASS use ( --  winnt.h :2811
      TokenUser => 1,                                     --  winnt.h :2812
      TokenGroups => 2,                                   --  winnt.h :2813
      TokenPrivileges => 3,                               --  winnt.h :2814
      TokenOwner => 4,                                    --  winnt.h :2815
      TokenPrimaryGroup => 5,                             --  winnt.h :2816
      TokenDefaultDacl => 6,                              --  winnt.h :2817
      TokenSource => 7,                                   --  winnt.h :2818
      TokenType => 8,                                     --  winnt.h :2819
      TokenImpersonationLevel => 9,                       --  winnt.h :2820
      TokenStatistics => 10                               --  winnt.h :2822
                                   );
   for TOKEN_INFORMATION_CLASS'Size use 32;                --  winnt.h :2811

   type SECURITY_INFORMATION is new Win32.DWORD;           --  winnt.h :2896

   type SERVICE_NODE_TYPE is ( --  winnt.h :4224
     DriverType,                                         --  winnt.h :4225
     FileSystemType,                                     --  winnt.h :4226
     AdapterType,                                        --  winnt.h :4227
     RecognizerType,                                     --  winnt.h :4228
     Win32ServiceOwnProcess,                             --  winnt.h :4229
     Win32ServiceShareProcess                            --  winnt.h :4231
                             );
   for SERVICE_NODE_TYPE use ( --  winnt.h :4224
      DriverType => 1,                                    --  winnt.h :4225
      FileSystemType => 2,                                --  winnt.h :4226
      AdapterType => 4,                                   --  winnt.h :4227
      RecognizerType => 8,                                --  winnt.h :4228
      Win32ServiceOwnProcess => 16,                       --  winnt.h :4229
      Win32ServiceShareProcess => 32                      --  winnt.h :4231
                             );
   for SERVICE_NODE_TYPE'Size use 32;                      --  winnt.h :4224

   type SERVICE_LOAD_TYPE is ( --  winnt.h :4233
     BootLoad,                                           --  winnt.h :4234
     SystemLoad,                                         --  winnt.h :4235
     AutoLoad,                                           --  winnt.h :4236
     DemandLoad,                                         --  winnt.h :4237
     DisableLoad                                         --  winnt.h :4239
                             );
   for SERVICE_LOAD_TYPE'Size use 32;                      --  winnt.h :4233

   type SERVICE_ERROR_TYPE is ( --  winnt.h :4241
     IgnoreError,                                        --  winnt.h :4242
     NormalError,                                        --  winnt.h :4243
     SevereError,                                        --  winnt.h :4244
     CriticalError                                       --  winnt.h :4246
                              );
   for SERVICE_ERROR_TYPE use ( --  winnt.h :4241
      IgnoreError => SERVICE_ERROR_IGNORE,                --  winnt.h :4242
      NormalError => SERVICE_ERROR_NORMAL,                --  winnt.h :4243
      SevereError => SERVICE_ERROR_SEVERE,                --  winnt.h :4244
      CriticalError => SERVICE_ERROR_CRITICAL             --  winnt.h :4246
                              );
   for SERVICE_ERROR_TYPE'Size use 32;                     --  winnt.h :4241

   subtype PTCHAR is Win32.PCHAR;                         --  winnt.h :115
   subtype PTBYTE is Win32.PBYTE;                         --  winnt.h :116
   subtype PTSTR is Win32.PSTR;                           --  winnt.h :121
   subtype LPTCH is PTCHAR;                                --  winnt.h :120
   subtype PTCH is PTCHAR;                                 --  winnt.h :120
   subtype LPTSTR is PTSTR;                                --  winnt.h :121
   subtype TCHAR_Array is Win32.CHAR_Array;

   subtype LPCTSTR is Win32.PCSTR;                        --  winnt.h :122

   subtype HANDLE is Win32.PVOID;                         --  winnt.h :144
   type PHANDLE is access all HANDLE;                      --  winnt.h :145

   type PLCID is access all LCID;                          --  winnt.h :149
   subtype PACCESS_TOKEN is Win32.PVOID;                  --  winnt.h :1878
   subtype PSECURITY_DESCRIPTOR is Win32.PVOID;           --  winnt.h :1879
   subtype PSID is Win32.PVOID;                           --  winnt.h :1880
   type PACCESS_MASK is access all ACCESS_MASK;            --  winnt.h :1921
   type PSECURITY_DESCRIPTOR_CONTROL is access all SECURITY_DESCRIPTOR_CONTROL;
   --  winnt.h :2480
   type PSECURITY_CONTEXT_TRACKING_MODE is access all
     SECURITY_CONTEXT_TRACKING_MODE;                     --  winnt.h :2721
   type PSECURITY_INFORMATION is access all SECURITY_INFORMATION;
   --  winnt.h :2896
   type PPDWORD is access all Win32.PDWORD;                --  winnt.h :3543
   type PPWORD is access all Win32.PWORD;                  --  winnt.h :3545

   type anonymous1_t;                                      --  winnt.h :186
   type LARGE_INTEGER;                                     --  winnt.h :178
   type anonymous2_t;                                      --  winnt.h :205
   type ULARGE_INTEGER;                                    --  winnt.h :197
   type LIST_ENTRY;                                        --  winnt.h :446
   type SINGLE_LIST_ENTRY;                                 --  winnt.h :457
   type FLOATING_SAVE_AREA;                                --  winnt.h :1150
   type CONTEXT;                                           --  winnt.h :1174
   type anonymous4_t;                                      --  winnt.h :1270
   type union_anonymous6_t;                                --  winnt.h :1283
   type LDT_ENTRY;                                         --  winnt.h :1261
   type EXCEPTION_RECORD;                                  --  winnt.h :1670
   type EXCEPTION_POINTERS;                                --  winnt.h :1682
   type MEMORY_BASIC_INFORMATION;                          --  winnt.h :1744
   type GENERIC_MAPPING;                                   --  winnt.h :1978
   type LUID_AND_ATTRIBUTES;                               --  winnt.h :2000
   type SID_IDENTIFIER_AUTHORITY;                          --  winnt.h :2041
   type SID;                                               --  winnt.h :2046
   type SID_AND_ATTRIBUTES;                                --  winnt.h :2076
   type ACL;                                               --  winnt.h :2275
   type ACE_HEADER;                                        --  winnt.h :2304
   type ACCESS_ALLOWED_ACE;                                --  winnt.h :2386
   type ACCESS_DENIED_ACE;                                 --  winnt.h :2394
   type SYSTEM_AUDIT_ACE;                                  --  winnt.h :2401
   type SYSTEM_ALARM_ACE;                                  --  winnt.h :2408
   type ACL_REVISION_INFORMATION;                          --  winnt.h :2434
   type ACL_SIZE_INFORMATION;                              --  winnt.h :2443
   type SECURITY_DESCRIPTOR;                               --  winnt.h :2563
   type PRIVILEGE_SET;                                     --  winnt.h :2646
   type SECURITY_QUALITY_OF_SERVICE;                       --  winnt.h :2729
   type SE_IMPERSONATION_STATE;                            --  winnt.h :2741
   type TOKEN_USER;                                        --  winnt.h :2829
   type TOKEN_GROUPS;                                      --  winnt.h :2834
   type TOKEN_PRIVILEGES;                                  --  winnt.h :2840
   type TOKEN_OWNER;                                       --  winnt.h :2846
   type TOKEN_PRIMARY_GROUP;                               --  winnt.h :2851
   type TOKEN_DEFAULT_DACL;                                --  winnt.h :2856
   type TOKEN_SOURCE;                                      --  winnt.h :2865
   type TOKEN_STATISTICS;                                  --  winnt.h :2872
   type TOKEN_CONTROL;                                     --  winnt.h :2888
   type IMAGE_DOS_HEADER;                                  --  winnt.h :2916
   type IMAGE_OS2_HEADER;                                  --  winnt.h :2938
   type IMAGE_FILE_HEADER;                                 --  winnt.h :2975
   type IMAGE_DATA_DIRECTORY;                              --  winnt.h :3009
   type IMAGE_OPTIONAL_HEADER;                             --  winnt.h :3020
   type IMAGE_ROM_OPTIONAL_HEADER;                         --  winnt.h :3063
   type IMAGE_NT_HEADERS;                                  --  winnt.h :3086
   type IMAGE_ROM_HEADERS;                                 --  winnt.h :3092
   type union_anonymous21_t;                               --  winnt.h :3135
   type IMAGE_SECTION_HEADER;                              --  winnt.h :3130
   type anonymous22_t;                                     --  winnt.h :3185
   type union_anonymous24_t;                               --  winnt.h :3187
   type IMAGE_SYMBOL;                                      --  winnt.h :3179
   type anonymous25_t;                                     --  winnt.h :3324
   type union_anonymous26_t;                               --  winnt.h :3326
   type anonymous27_t;                                     --  winnt.h :3331
   type anonymous28_t;                                     --  winnt.h :3334
   type union_anonymous29_t;                               --  winnt.h :3335
   type anonymous30_t;                                     --  winnt.h :3337
   type anonymous32_t;                                     --  winnt.h :3340
   type anonymous33_t;                                     --  winnt.h :3348
   type IMAGE_AUX_SYMBOL;                                  --  winnt.h :3317
   type IMAGE_RELOCATION;                                  --  winnt.h :3373
   type IMAGE_BASE_RELOCATION;                             --  winnt.h :3469
   type union_anonymous34_t;                               --  winnt.h :3496
   type IMAGE_LINENUMBER;                                  --  winnt.h :3492
   type IMAGE_ARCHIVE_MEMBER_HEADER;                       --  winnt.h :3514
   type IMAGE_EXPORT_DIRECTORY;                            --  winnt.h :3534
   type IMAGE_IMPORT_BY_NAME;                              --  winnt.h :3552
   type union_anonymous42_t;                               --  winnt.h :3562
   type IMAGE_THUNK_DATA;                                  --  winnt.h :3557
   type IMAGE_IMPORT_DESCRIPTOR;                           --  winnt.h :3569
   type IMAGE_TLS_DIRECTORY;                               --  winnt.h :3588
   type IMAGE_RESOURCE_DIRECTORY;                          --  winnt.h :3616
   type IMAGE_RESOURCE_DIRECTORY_ENTRY;                    --  winnt.h :3644
   type IMAGE_RESOURCE_DIRECTORY_STRING;                   --  winnt.h :3658
   type IMAGE_RESOURCE_DIR_STRING_U;                       --  winnt.h :3664
   type IMAGE_RESOURCE_DATA_ENTRY;                         --  winnt.h :3679
   type IMAGE_LOAD_CONFIG_DIRECTORY;                       --  winnt.h :3690
   type IMAGE_RUNTIME_FUNCTION_ENTRY;                      --  winnt.h :3714
   type IMAGE_DEBUG_DIRECTORY;                             --  winnt.h :3726
   type IMAGE_COFF_SYMBOLS_HEADER;                         --  winnt.h :3747
   type IMAGE_DEBUG_MISC;                                  --  winnt.h :3779
   type IMAGE_FUNCTION_ENTRY;                              --  winnt.h :3795
   type IMAGE_SEPARATE_DEBUG_HEADER;                       --  winnt.h :3821
   type MESSAGE_RESOURCE_ENTRY;                            --  winnt.h :3930
   type MESSAGE_RESOURCE_BLOCK;                            --  winnt.h :3938
   type MESSAGE_RESOURCE_DATA;                             --  winnt.h :3944
   type RTL_CRITICAL_SECTION;                              --  winnt.h :3953
   type RTL_CRITICAL_SECTION_DEBUG;                        --  winnt.h :3950
   type EVENTLOGRECORD;                                    --  winnt.h :4021
   type TAPE_ERASE;                                        --  winnt.h :4256
   type TAPE_PREPARE;                                      --  winnt.h :4272
   type TAPE_WRITE_MARKS;                                  --  winnt.h :4286
   type TAPE_GET_POSITION;                                 --  winnt.h :4300
   type TAPE_SET_POSITION;                                 --  winnt.h :4321
   type TAPE_GET_DRIVE_PARAMETERS;                         --  winnt.h :4410
   type TAPE_SET_DRIVE_PARAMETERS;                         --  winnt.h :4428
   type TAPE_GET_MEDIA_PARAMETERS;                         --  winnt.h :4440
   type TAPE_SET_MEDIA_PARAMETERS;                         --  winnt.h :4452
   type TAPE_CREATE_PARTITION;                             --  winnt.h :4464

   type PLARGE_INTEGER is access all LARGE_INTEGER;        --  winnt.h :191
   type PULARGE_INTEGER is access all ULARGE_INTEGER;      --  winnt.h :210
   subtype PLUID is PULARGE_INTEGER;                       --  winnt.h :218
   type PLIST_ENTRY is access all LIST_ENTRY;              --  winnt.h :449
   type PSINGLE_LIST_ENTRY is access all SINGLE_LIST_ENTRY; --  winnt.h :458
   type PFLOATING_SAVE_AREA is access all FLOATING_SAVE_AREA;
   --  winnt.h :1162
   type PCONTEXT is access all CONTEXT;                    --  winnt.h :1254
   type PLDT_ENTRY is access all LDT_ENTRY;                --  winnt.h :1284
   type PEXCEPTION_RECORD is access all EXCEPTION_RECORD;  --  winnt.h :1676
   type PEXCEPTION_POINTERS is access all EXCEPTION_POINTERS;
   --  winnt.h :1685
   type PMEMORY_BASIC_INFORMATION is access all MEMORY_BASIC_INFORMATION;
   --  winnt.h :1752
   type PGENERIC_MAPPING is access all GENERIC_MAPPING;    --  winnt.h :1984
   type PLUID_AND_ATTRIBUTES is access all LUID_AND_ATTRIBUTES;
   --  winnt.h :2003
   type PISID is access all SID;                           --  winnt.h :2055
   type PSID_AND_ATTRIBUTES is access all SID_AND_ATTRIBUTES;
   --  winnt.h :2079
   type PACL is access all ACL;                            --  winnt.h :2282
   type PACE_HEADER is access all ACE_HEADER;              --  winnt.h :2309
   type PACCESS_ALLOWED_ACE is access all ACCESS_ALLOWED_ACE;
   --  winnt.h :2392
   type PACCESS_DENIED_ACE is access all ACCESS_DENIED_ACE; --  winnt.h :2399
   type PSYSTEM_AUDIT_ACE is access all SYSTEM_AUDIT_ACE;  --  winnt.h :2406
   type PSYSTEM_ALARM_ACE is access all SYSTEM_ALARM_ACE;  --  winnt.h :2413
   type PACL_REVISION_INFORMATION is access all ACL_REVISION_INFORMATION;
   --  winnt.h :2437
   type PACL_SIZE_INFORMATION is access all ACL_SIZE_INFORMATION;
   --  winnt.h :2448
   type PISECURITY_DESCRIPTOR is access all SECURITY_DESCRIPTOR;
   --  winnt.h :2571
   type PPRIVILEGE_SET is access all PRIVILEGE_SET;        --  winnt.h :2650
   type PSECURITY_QUALITY_OF_SERVICE is
     access all SECURITY_QUALITY_OF_SERVICE;             --  winnt.h :2734
   type PSE_IMPERSONATION_STATE is access all SE_IMPERSONATION_STATE;
   --  winnt.h :2746
   type PTOKEN_USER is access all TOKEN_USER;              --  winnt.h :2831
   type PTOKEN_GROUPS is access all TOKEN_GROUPS;          --  winnt.h :2837
   type PTOKEN_PRIVILEGES is access all TOKEN_PRIVILEGES;  --  winnt.h :2843
   type PTOKEN_OWNER is access all TOKEN_OWNER;            --  winnt.h :2848
   type PTOKEN_PRIMARY_GROUP is access all TOKEN_PRIMARY_GROUP;
   --  winnt.h :2853
   type PTOKEN_DEFAULT_DACL is access all TOKEN_DEFAULT_DACL;
   --  winnt.h :2858
   type PTOKEN_SOURCE is access all TOKEN_SOURCE;          --  winnt.h :2868
   type PTOKEN_STATISTICS is access all TOKEN_STATISTICS;  --  winnt.h :2883
   type PTOKEN_CONTROL is access all TOKEN_CONTROL;        --  winnt.h :2893
   type PIMAGE_DOS_HEADER is access all IMAGE_DOS_HEADER;  --  winnt.h :2936
   type PIMAGE_OS2_HEADER is access all IMAGE_OS2_HEADER;  --  winnt.h :2969
   type PIMAGE_FILE_HEADER is access all IMAGE_FILE_HEADER; --  winnt.h :2983
   type PIMAGE_DATA_DIRECTORY is access all IMAGE_DATA_DIRECTORY;
   --  winnt.h :3012
   type PIMAGE_OPTIONAL_HEADER is access all IMAGE_OPTIONAL_HEADER;
   --  winnt.h :3061
   type PIMAGE_ROM_OPTIONAL_HEADER is
     access all IMAGE_ROM_OPTIONAL_HEADER;               --  winnt.h :3077
   type PIMAGE_NT_HEADERS is access all IMAGE_NT_HEADERS;  --  winnt.h :3090
   type PIMAGE_ROM_HEADERS is access all IMAGE_ROM_HEADERS; --  winnt.h :3095
   type PIMAGE_SECTION_HEADER is access all IMAGE_SECTION_HEADER;
   --  winnt.h :3144
   type PIMAGE_SYMBOL is access all IMAGE_SYMBOL;          --  winnt.h :3194
   type PIMAGE_AUX_SYMBOL is access all IMAGE_AUX_SYMBOL;  --  winnt.h :3350
   type PIMAGE_RELOCATION is access all IMAGE_RELOCATION;  --  winnt.h :3378
   type PIMAGE_BASE_RELOCATION is access all IMAGE_BASE_RELOCATION;
   --  winnt.h :3473
   type PIMAGE_LINENUMBER is access all IMAGE_LINENUMBER;  --  winnt.h :3499
   type PIMAGE_ARCHIVE_MEMBER_HEADER is
     access all IMAGE_ARCHIVE_MEMBER_HEADER;             --  winnt.h :3522
   type PIMAGE_EXPORT_DIRECTORY is access all IMAGE_EXPORT_DIRECTORY;
   --  winnt.h :3546
   type PIMAGE_IMPORT_BY_NAME is access all IMAGE_IMPORT_BY_NAME;
   --  winnt.h :3555
   type PIMAGE_THUNK_DATA is access all IMAGE_THUNK_DATA;  --  winnt.h :3563
   type PIMAGE_IMPORT_DESCRIPTOR is
     access all IMAGE_IMPORT_DESCRIPTOR;                 --  winnt.h :3575
   type PIMAGE_TLS_DIRECTORY is access all IMAGE_TLS_DIRECTORY;
   --  winnt.h :3595
   type PIMAGE_RESOURCE_DIRECTORY is
     access all IMAGE_RESOURCE_DIRECTORY;                --  winnt.h :3624
   type PIMAGE_RESOURCE_DIRECTORY_ENTRY is
     access all IMAGE_RESOURCE_DIRECTORY_ENTRY;          --  winnt.h :3647
   type PIMAGE_RESOURCE_DIRECTORY_STRING is
     access all IMAGE_RESOURCE_DIRECTORY_STRING;         --  winnt.h :3661
   type PIMAGE_RESOURCE_DIR_STRING_U is
     access all IMAGE_RESOURCE_DIR_STRING_U;             --  winnt.h :3667
   type PIMAGE_RESOURCE_DATA_ENTRY is
     access all IMAGE_RESOURCE_DATA_ENTRY;               --  winnt.h :3684
   type PIMAGE_LOAD_CONFIG_DIRECTORY is
     access all IMAGE_LOAD_CONFIG_DIRECTORY;             --  winnt.h :3704
   type PIMAGE_RUNTIME_FUNCTION_ENTRY is
     access all IMAGE_RUNTIME_FUNCTION_ENTRY;            --  winnt.h :3720
   type PIMAGE_DEBUG_DIRECTORY is
     access all IMAGE_DEBUG_DIRECTORY;                   --  winnt.h :3735
   type PIMAGE_COFF_SYMBOLS_HEADER is
     access all IMAGE_COFF_SYMBOLS_HEADER;               --  winnt.h :3756
   type FPO_DATA is                                        --  winnt.h :3762
      record
         ulOffStart : Win32.DWORD;                        --  winnt.h :3763
         cbProcSize : Win32.DWORD;                        --  winnt.h :3764
         cdwLocals : Win32.DWORD;                        --  winnt.h :3765
         cdwParams : Win32.WORD;                         --  winnt.h :3766
         cbProlog : Win32.Bits8;                        --  winnt.h :3767
         cbRegs : Win32.Bits3;                        --  winnt.h :3768
         fHasSEH : Win32.Bits1;                        --  winnt.h :3769
         fUseBP : Win32.Bits1;                        --  winnt.h :3770
         reserved : Win32.Bits1;                        --  winnt.h :3771
         cbFrame : Win32.Bits2;                        --  winnt.h :3772
      end record;
   for FPO_DATA use record
      ulOffStart at 0 range 0 .. 31;                    --  winnt.h :3763
      cbProcSize at 4 range 0 .. 31;                    --  winnt.h :3764
      cdwLocals  at 8 range 0 .. 31;                    --  winnt.h :3765
      cdwParams  at 12 range 0 .. 15;                   --  winnt.h :3766
      cbProlog  at 14 range 0 .. 7;                     --  winnt.h :3767
      cbRegs    at 15 range 0 .. 2;                     --  winnt.h :3768
      fHasSEH   at 15 range 3 .. 3;                     --  winnt.h :3769
      fUseBP    at 15 range 4 .. 4;                     --  winnt.h :3770
      reserved  at 15 range 5 .. 5;                     --  winnt.h :3771
      cbFrame   at 15 range 6 .. 7;                     --  winnt.h :3772
   end record;
   --  pragma pack (FPO_DATA);

   type PFPO_DATA is access all FPO_DATA;                  --  winnt.h :3773
   type PIMAGE_DEBUG_MISC is access all IMAGE_DEBUG_MISC;
   --  winnt.h :3786
   type PIMAGE_FUNCTION_ENTRY is access all IMAGE_FUNCTION_ENTRY;
   --  winnt.h :3799
   type PIMAGE_SEPARATE_DEBUG_HEADER is
     access all IMAGE_SEPARATE_DEBUG_HEADER;             --  winnt.h :3834
   type PMESSAGE_RESOURCE_ENTRY is
     access all MESSAGE_RESOURCE_ENTRY;                  --  winnt.h :3934
   type PMESSAGE_RESOURCE_BLOCK is
     access all MESSAGE_RESOURCE_BLOCK;                  --  winnt.h :3942
   type PMESSAGE_RESOURCE_DATA is
     access all MESSAGE_RESOURCE_DATA;                   --  winnt.h :3947
   type PRTL_CRITICAL_SECTION_DEBUG is
     access all RTL_CRITICAL_SECTION_DEBUG;              --  winnt.h :3959
   type PRTL_CRITICAL_SECTION is
     access all RTL_CRITICAL_SECTION;                    --  winnt.h :3977
   type PEVENTLOGRECORD is access all EVENTLOGRECORD;      --  winnt.h :4049
   type PTAPE_ERASE is access all TAPE_ERASE;              --  winnt.h :4259
   type PTAPE_PREPARE is access all TAPE_PREPARE;          --  winnt.h :4275
   type PTAPE_WRITE_MARKS is access all TAPE_WRITE_MARKS;
   --  winnt.h :4290
   type PTAPE_GET_POSITION is access all TAPE_GET_POSITION;
   --  winnt.h :4304
   type PTAPE_SET_POSITION is access all TAPE_SET_POSITION;
   --  winnt.h :4326
   type PTAPE_GET_DRIVE_PARAMETERS is
     access all TAPE_GET_DRIVE_PARAMETERS;               --  winnt.h :4422
   type PTAPE_SET_DRIVE_PARAMETERS is
     access all TAPE_SET_DRIVE_PARAMETERS;               --  winnt.h :4434
   type PTAPE_GET_MEDIA_PARAMETERS is
     access all TAPE_GET_MEDIA_PARAMETERS;               --  winnt.h :4446
   type PTAPE_SET_MEDIA_PARAMETERS is
     access all TAPE_SET_MEDIA_PARAMETERS;               --  winnt.h :4454
   type PTAPE_CREATE_PARTITION is access all TAPE_CREATE_PARTITION;
   --  winnt.h :4468

   type anonymous1_t is                                    --  winnt.h :186
      record
         LowPart : Win32.DWORD;                          --  winnt.h :184
         HighPart : Win32.LONG;                           --  winnt.h :185
      end record;
   pragma Convention (c_pass_by_copy, anonymous1_t);        --  winnt.h :186

   type LARGE_INTEGER_kind is ( --  winnt.h :178
     u_kind,
     QuadPart_kind
                              );

   type LARGE_INTEGER (Which : LARGE_INTEGER_kind :=  u_kind) is
      --  winnt.h :178
      record
         case Which is
            when u_kind =>
               u : anonymous1_t;                        --  winnt.h :186
            when QuadPart_kind =>
               QuadPart : Win32.LONGLONG;               --  winnt.h :188
         end case;
      end record;

   pragma Unchecked_Union (LARGE_INTEGER);
   pragma Convention (c_pass_by_copy, LARGE_INTEGER);

   type anonymous2_t is                                    --  winnt.h :205
      record
         LowPart : Win32.DWORD;                          --  winnt.h :203
         HighPart : Win32.DWORD;                          --  winnt.h :204
      end record;

   type ULARGE_INTEGER_kind is ( --  winnt.h :197
     u_kind,
     QuadPart_kind
                               );

   type ULARGE_INTEGER (Which : ULARGE_INTEGER_kind :=  u_kind) is
      --  winnt.h :197
      record
         case Which is
            when u_kind =>
               u : anonymous2_t;                        --  winnt.h :205
            when QuadPart_kind =>
               QuadPart : Win32.DWORDLONG;              --  winnt.h :207
         end case;
      end record;

   pragma Unchecked_Union (ULARGE_INTEGER);

   subtype LUID is LARGE_INTEGER;                          --  winnt.h :218

   type LIST_ENTRY is                                      --  winnt.h :446
      record
         Flink : PLIST_ENTRY;                             --  winnt.h :446
         Blink : PLIST_ENTRY;                             --  winnt.h :447
      end record;

   type SINGLE_LIST_ENTRY is                               --  winnt.h :457
      record
         Next : PSINGLE_LIST_ENTRY;                       --  winnt.h :457
      end record;

   type FLOATING_SAVE_AREA is                              --  winnt.h :1150
      record
         ControlWord : Win32.DWORD;                     --  winnt.h :1151
         StatusWord : Win32.DWORD;                     --  winnt.h :1152
         TagWord : Win32.DWORD;                     --  winnt.h :1153
         ErrorOffset : Win32.DWORD;                     --  winnt.h :1154
         ErrorSelector : Win32.DWORD;                     --  winnt.h :1155
         DataOffset : Win32.DWORD;                     --  winnt.h :1156
         DataSelector : Win32.DWORD;                     --  winnt.h :1157
         RegisterArea : Win32.BYTE_Array (0 .. 79);         --  winnt.h :1158
         Cr0NpxState : Win32.DWORD;                     --  winnt.h :1159
      end record;

   type CONTEXT is                                         --  winnt.h :1174
      record
         ContextFlags : Win32.DWORD;                      --  winnt.h :1194
         Dr0 : Win32.DWORD;                      --  winnt.h :1202
         Dr1 : Win32.DWORD;                      --  winnt.h :1203
         Dr2 : Win32.DWORD;                      --  winnt.h :1204
         Dr3 : Win32.DWORD;                      --  winnt.h :1205
         Dr6 : Win32.DWORD;                      --  winnt.h :1206
         Dr7 : Win32.DWORD;                      --  winnt.h :1207
         FloatSave : FLOATING_SAVE_AREA;               --  winnt.h :1214
         SegGs : Win32.DWORD;                      --  winnt.h :1221
         SegFs : Win32.DWORD;                      --  winnt.h :1222
         SegEs : Win32.DWORD;                      --  winnt.h :1223
         SegDs : Win32.DWORD;                      --  winnt.h :1224
         Edi : Win32.DWORD;                      --  winnt.h :1231
         Esi : Win32.DWORD;                      --  winnt.h :1232
         Ebx : Win32.DWORD;                      --  winnt.h :1233
         Edx : Win32.DWORD;                      --  winnt.h :1234
         Ecx : Win32.DWORD;                      --  winnt.h :1235
         Eax : Win32.DWORD;                      --  winnt.h :1236
         Ebp : Win32.DWORD;                      --  winnt.h :1243
         Eip : Win32.DWORD;                      --  winnt.h :1244
         SegCs : Win32.DWORD;                      --  winnt.h :1245
         EFLAGS : Win32.DWORD;                      --  winnt.h :1246
         Esp : Win32.DWORD;                      --  winnt.h :1247
         SegSs : Win32.DWORD;                      --  winnt.h :1248
      end record;

   type anonymous4_t is                                    --  winnt.h :1270
      record
         BaseMid : Win32.BYTE;                            --  winnt.h :1266
         Flags1 : Win32.BYTE;                            --  winnt.h :1267
         Flags2 : Win32.BYTE;                            --  winnt.h :1268
         BaseHi : Win32.BYTE;                            --  winnt.h :1269
      end record;

   type anonymous5_t is                                    --  winnt.h :1282
      record
         BaseMid     : Win32.Bits8; --  winnt.h :1272
         C_Type      : Win32.Bits5; --  winnt.h :1273
         Dpl         : Win32.Bits2; --  winnt.h :1274
         Pres        : Win32.Bits1; --  winnt.h :1275
         LimitHi     : Win32.Bits4; --  winnt.h :1276
         Sys         : Win32.Bits1; --  winnt.h :1277
         Reserved_0  : Win32.Bits1; --  winnt.h :1278
         Default_Big : Win32.Bits1; --  winnt.h :1279
         Granularity : Win32.Bits1; --  winnt.h :1280
         BaseHi      : Win32.Bits8; --  winnt.h :1281
      end record;
   for anonymous5_t use record
      BaseMid     at 0 range 0 .. 7;                    --  winnt.h :1272
      C_Type      at 1 range 0 .. 4;                    --  winnt.h :1273
      Dpl         at 1 range 5 .. 6;                    --  winnt.h :1274
      Pres        at 1 range 7 .. 7;                    --  winnt.h :1275
      LimitHi     at 2 range 0 .. 3;                    --  winnt.h :1276
      Sys         at 2 range 4 .. 4;                    --  winnt.h :1277
      Reserved_0  at 2 range 5 .. 5;                    --  winnt.h :1278
      Default_Big at 2 range 6 .. 6;                    --  winnt.h :1279
      Granularity at 2 range 7 .. 7;                    --  winnt.h :1280
      BaseHi      at 3 range 0 .. 7;                    --  winnt.h :1281
   end record;
   --  pragma pack (anonymous5_t);

   type union_anonymous6_t_kind is ( --  winnt.h :1283
     Bytes_kind,
     Bits_kind
                                   );

   type union_anonymous6_t (Which : union_anonymous6_t_kind :=  Bytes_kind) is
      --  winnt.h :1283
      record
         case Which is
            when Bytes_kind =>
               Bytes : anonymous4_t;                    --  winnt.h :1270
            when Bits_kind =>
               Bits : anonymous5_t;                     --  winnt.h :1282
         end case;
      end record;

   pragma Convention (C, union_anonymous6_t);

   pragma Unchecked_Union (union_anonymous6_t);

   type LDT_ENTRY is                                       --  winnt.h :1261
      record
         LimitLow : Win32.WORD;                           --  winnt.h :1262
         BaseLow : Win32.WORD;                           --  winnt.h :1263
         HighWord : union_anonymous6_t;                   --  winnt.h :1283
      end record;

   type EXCEPTION_RECORD is                                --  winnt.h :1670
      record
         ExceptionCode : Win32.DWORD;              --  winnt.h :1667
         ExceptionFlags : Win32.DWORD;              --  winnt.h :1669
         ExceptionRecord : PEXCEPTION_RECORD;        --  winnt.h :1670
         ExceptionAddress : Win32.PVOID;              --  winnt.h :1671
         NumberParameters : Win32.DWORD;              --  winnt.h :1672
         ExceptionInformation : Win32.DWORD_Array (0 .. 14); --  winnt.h :1673
      end record;

   type EXCEPTION_POINTERS is                              --  winnt.h :1682
      record
         ExceptionRecord : PEXCEPTION_RECORD;             --  winnt.h :1683
         ContextRecord : PCONTEXT;                      --  winnt.h :1684
      end record;

   type MEMORY_BASIC_INFORMATION is                        --  winnt.h :1744
      record
         BaseAddress : Win32.PVOID;                 --  winnt.h :1745
         AllocationBase : Win32.PVOID;                 --  winnt.h :1746
         AllocationProtect : Win32.DWORD;                 --  winnt.h :1747
         RegionSize : Win32.DWORD;                 --  winnt.h :1748
         State : Win32.DWORD;                 --  winnt.h :1749
         Protect : Win32.DWORD;                 --  winnt.h :1750
         C_Type : Win32.DWORD;                 --  winnt.h :1751
      end record;

   type GENERIC_MAPPING is                                 --  winnt.h :1978
      record
         GenericRead : ACCESS_MASK;                    --  winnt.h :1979
         GenericWrite : ACCESS_MASK;                    --  winnt.h :1980
         GenericExecute : ACCESS_MASK;                    --  winnt.h :1981
         GenericAll : ACCESS_MASK;                    --  winnt.h :1982
      end record;

   type LUID_AND_ATTRIBUTES is                             --  winnt.h :2000
      record
         Luid : Win32.Winnt.LUID;
         --  winnt.h :2001
         Attributes : Win32.DWORD;                        --  winnt.h :2002
      end record;
   pragma Convention (c_pass_by_copy, LUID_AND_ATTRIBUTES); --  winnt.h :2000

   SYSTEM_LUID : LUID_AND_ATTRIBUTES;                      --  winnt.h :2206

   type LUID_AND_ATTRIBUTES_ARRAY is                       --  winnt.h :2004
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased LUID_AND_ATTRIBUTES;

   type PLUID_AND_ATTRIBUTES_ARRAY is access all LUID_AND_ATTRIBUTES_ARRAY;
   --  winnt.h :2005

   type SID_IDENTIFIER_AUTHORITY is                        --  winnt.h :2041
      record
         Value : Win32.BYTE_Array (0 .. 5);                  --  winnt.h :2042
      end record;
   pragma Convention (c_pass_by_copy, SID_IDENTIFIER_AUTHORITY);

   type PSID_IDENTIFIER_AUTHORITY is
     access all SID_IDENTIFIER_AUTHORITY;                --  winnt.h :2043

   SECURITY_NULL_SID_AUTHORITY : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 0));                           --  winnt.h :2100
   SECURITY_WORLD_SID_AUTHORITY : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 1));                           --  winnt.h :2101
   SECURITY_LOCAL_SID_AUTHORITY : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 2));                           --  winnt.h :2102
   SECURITY_CREATOR_SID_AUTHORITY : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 3));                           --  winnt.h :2103
   SECURITY_NON_UNIQUE_AUTHORITY : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 4));                           --  winnt.h :2104
   SECURITY_NT_AUTHORITY : constant SID_IDENTIFIER_AUTHORITY :=
     (Value => (0, 0, 0, 0, 0, 5));                           --  winnt.h :2105

   type SID is                                             --  winnt.h :2046
      record
         Revision : Win32.BYTE;                --  winnt.h :2047
         SubAuthorityCount : Win32.BYTE;                --  winnt.h :2048
         IdentifierAuthority : SID_IDENTIFIER_AUTHORITY;  --  winnt.h :2049
         SubAuthority : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winnt.h :2053
      end record;

   type PSID_NAME_USE is access all SID_NAME_USE;          --  winnt.h :2072

   type SID_AND_ATTRIBUTES is                              --  winnt.h :2076
      record
         Sid : PSID;                               --  winnt.h :2077
         Attributes : Win32.DWORD;                        --  winnt.h :2078
      end record;

   type SID_AND_ATTRIBUTES_ARRAY is                        --  winnt.h :2081
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased SID_AND_ATTRIBUTES;

   type anonymous14_t is access all SID_AND_ATTRIBUTES_ARRAY;
   --  winnt.h :2082
   type PSID_AND_ATTRIBUTES_ARRAY is access all SID_AND_ATTRIBUTES_ARRAY;
   --  winnt.h :2082

   type ACL is                                             --  winnt.h :2275
      record
         AclRevision : Win32.BYTE;                        --  winnt.h :2276
         Sbz1 : Win32.BYTE;                        --  winnt.h :2277
         AclSize : Win32.WORD;                        --  winnt.h :2278
         AceCount : Win32.WORD;                        --  winnt.h :2279
         Sbz2 : Win32.WORD;                        --  winnt.h :2280
      end record;

   type ACE_HEADER is                                      --  winnt.h :2304
      record
         AceType : Win32.BYTE;                           --  winnt.h :2305
         AceFlags : Win32.BYTE;                           --  winnt.h :2306
         AceSize : Win32.WORD;                           --  winnt.h :2307
      end record;

   type ACCESS_ALLOWED_ACE is                              --  winnt.h :2386
      record
         Header : ACE_HEADER;                           --  winnt.h :2387
         Mask : ACCESS_MASK;                          --  winnt.h :2388
         SidStart : Win32.DWORD;                          --  winnt.h :2389
      end record;

   type ACCESS_DENIED_ACE is                               --  winnt.h :2394
      record
         Header : ACE_HEADER;                           --  winnt.h :2395
         Mask : ACCESS_MASK;                          --  winnt.h :2396
         SidStart : Win32.DWORD;                          --  winnt.h :2397
      end record;

   type SYSTEM_AUDIT_ACE is                                --  winnt.h :2401
      record
         Header : ACE_HEADER;                           --  winnt.h :2402
         Mask : ACCESS_MASK;                          --  winnt.h :2403
         SidStart : Win32.DWORD;                          --  winnt.h :2404
      end record;

   type SYSTEM_ALARM_ACE is                                --  winnt.h :2408
      record
         Header : ACE_HEADER;                           --  winnt.h :2409
         Mask : ACCESS_MASK;                          --  winnt.h :2410
         SidStart : Win32.DWORD;                          --  winnt.h :2411
      end record;

   type ACL_REVISION_INFORMATION is                        --  winnt.h :2434
      record
         AclRevision : Win32.DWORD;                       --  winnt.h :2435
      end record;

   type ACL_SIZE_INFORMATION is                            --  winnt.h :2443
      record
         AceCount : Win32.DWORD;                     --  winnt.h :2444
         AclBytesInUse : Win32.DWORD;                     --  winnt.h :2445
         AclBytesFree : Win32.DWORD;                     --  winnt.h :2446
      end record;

   type SECURITY_DESCRIPTOR is                             --  winnt.h :2563
      record
         Revision : Win32.BYTE;                           --  winnt.h :2564
         Sbz1 : Win32.BYTE;                           --  winnt.h :2565
         Control : SECURITY_DESCRIPTOR_CONTROL;          --  winnt.h :2566
         Owner : PSID;                                 --  winnt.h :2567
         Group : PSID;                                 --  winnt.h :2568
         Sacl : PACL;                                 --  winnt.h :2569
         Dacl : PACL;                                 --  winnt.h :2570
      end record;

   type PRIVILEGE_SET is                                   --  winnt.h :2646
      record
         PrivilegeCount : Win32.DWORD;                    --  winnt.h :2647
         Control : Win32.DWORD;                    --  winnt.h :2648
         Privilege : LUID_AND_ATTRIBUTES_ARRAY;      --  winnt.h :2649
      end record;

   type PSECURITY_IMPERSONATION_LEVEL is
     access all SECURITY_IMPERSONATION_LEVEL;            --  winnt.h :2706

   type SECURITY_QUALITY_OF_SERVICE is                     --  winnt.h :2729
      record
         Length : Win32.DWORD;               --  winnt.h :2730
         ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL;
         --  winnt.h :2731
         ContextTrackingMode : SECURITY_CONTEXT_TRACKING_MODE;
         --  winnt.h :2732
         EffectiveOnly : BOOLEAN;                   --  winnt.h :2733
      end record;

   type SE_IMPERSONATION_STATE is                          --  winnt.h :2741
      record
         Token : PACCESS_TOKEN;                   --  winnt.h :2742
         CopyOnOpen : BOOLEAN;                         --  winnt.h :2743
         EffectiveOnly : BOOLEAN;                         --  winnt.h :2744
         Level : SECURITY_IMPERSONATION_LEVEL;    --  winnt.h :2745
      end record;

   type PTOKEN_TYPE is access all TOKEN_TYPE;              --  winnt.h :2802
   type PTOKEN_INFORMATION_CLASS is access all TOKEN_INFORMATION_CLASS;
   --  winnt.h :2822

   type TOKEN_USER is                                      --  winnt.h :2829
      record
         User : SID_AND_ATTRIBUTES;                       --  winnt.h :2830
      end record;

   type TOKEN_GROUPS is                                    --  winnt.h :2834
      record
         GroupCount : Win32.DWORD;                        --  winnt.h :2835
         Groups : SID_AND_ATTRIBUTES_ARRAY;           --  winnt.h :2836
      end record;

   type TOKEN_PRIVILEGES is                                --  winnt.h :2840
      record
         PrivilegeCount : Win32.DWORD;                    --  winnt.h :2841
         Privileges : LUID_AND_ATTRIBUTES_ARRAY;      --  winnt.h :2842
      end record;

   type TOKEN_OWNER is                                     --  winnt.h :2846
      record
         Owner : PSID;                                    --  winnt.h :2847
      end record;

   type TOKEN_PRIMARY_GROUP is                             --  winnt.h :2851
      record
         PrimaryGroup : PSID;                             --  winnt.h :2852
      end record;

   type TOKEN_DEFAULT_DACL is                              --  winnt.h :2856
      record
         DefaultDacl : PACL;                              --  winnt.h :2857
      end record;

   type TOKEN_SOURCE is                                    --  winnt.h :2865
      record
         SourceName : Win32.CHAR_Array (0 .. 7);       --  winnt.h :2866
         SourceIdentifier : LUID;                         --  winnt.h :2867
      end record;

   type TOKEN_STATISTICS is                                --  winnt.h :2872
      record
         TokenId : LUID;                       --  winnt.h :2873
         AuthenticationId : LUID;                       --  winnt.h :2874
         ExpirationTime : LARGE_INTEGER;              --  winnt.h :2875
         TokenType : TOKEN_TYPE;                 --  winnt.h :2876
         ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL;
         --  winnt.h :2877
         DynamicCharged : Win32.DWORD;                --  winnt.h :2878
         DynamicAvailable : Win32.DWORD;                --  winnt.h :2879
         GroupCount : Win32.DWORD;                --  winnt.h :2880
         PrivilegeCount : Win32.DWORD;                --  winnt.h :2881
         ModifiedId : LUID;                       --  winnt.h :2882
      end record;

   type TOKEN_CONTROL is                                   --  winnt.h :2888
      record
         TokenId : LUID;                         --  winnt.h :2889
         AuthenticationId : LUID;                         --  winnt.h :2890
         ModifiedId : LUID;                         --  winnt.h :2891
         TokenSource : TOKEN_SOURCE;                 --  winnt.h :2892
      end record;

   type IMAGE_DOS_HEADER is                                --  winnt.h :2916
      record
         e_magic : Win32.WORD;                         --  winnt.h :2917
         e_cblp : Win32.WORD;                         --  winnt.h :2918
         e_cp : Win32.WORD;                         --  winnt.h :2919
         e_crlc : Win32.WORD;                         --  winnt.h :2920
         e_cparhdr : Win32.WORD;                         --  winnt.h :2921
         e_minalloc : Win32.WORD;                         --  winnt.h :2922
         e_maxalloc : Win32.WORD;                         --  winnt.h :2923
         e_ss : Win32.WORD;                         --  winnt.h :2924
         e_sp : Win32.WORD;                         --  winnt.h :2925
         e_csum : Win32.WORD;                         --  winnt.h :2926
         e_ip : Win32.WORD;                         --  winnt.h :2927
         e_cs : Win32.WORD;                         --  winnt.h :2928
         e_lfarlc : Win32.WORD;                         --  winnt.h :2929
         e_ovno : Win32.WORD;                         --  winnt.h :2930
         e_res : Win32.WORD_Array (0 .. 3);             --  winnt.h :2931
         e_oemid : Win32.WORD;                         --  winnt.h :2932
         e_oeminfo : Win32.WORD;                         --  winnt.h :2933
         e_res2 : Win32.WORD_Array (0 .. 9);             --  winnt.h :2934
         e_lfanew : Win32.LONG;                         --  winnt.h :2935
      end record;

   for IMAGE_DOS_HEADER use
      record
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

   type IMAGE_OS2_HEADER is                                --  winnt.h :2938
      record
         ne_magic : Win32.WORD;                    --  winnt.h :2939
         ne_ver : Win32.CHAR;                    --  winnt.h :2940
         ne_rev : Win32.CHAR;                    --  winnt.h :2941
         ne_enttab : Win32.WORD;                    --  winnt.h :2942
         ne_cbenttab : Win32.WORD;                    --  winnt.h :2943
         ne_crc : Win32.LONG;                    --  winnt.h :2944
         ne_flags : Win32.WORD;                    --  winnt.h :2945
         ne_autodata : Win32.WORD;                    --  winnt.h :2946
         ne_heap : Win32.WORD;                    --  winnt.h :2947
         ne_stack : Win32.WORD;                    --  winnt.h :2948
         ne_csip : Win32.LONG;                    --  winnt.h :2949
         ne_sssp : Win32.LONG;                    --  winnt.h :2950
         ne_cseg : Win32.WORD;                    --  winnt.h :2951
         ne_cmod : Win32.WORD;                    --  winnt.h :2952
         ne_cbnrestab : Win32.WORD;                    --  winnt.h :2953
         ne_segtab : Win32.WORD;                    --  winnt.h :2954
         ne_rsrctab : Win32.WORD;                    --  winnt.h :2955
         ne_restab : Win32.WORD;                    --  winnt.h :2956
         ne_modtab : Win32.WORD;                    --  winnt.h :2957
         ne_imptab : Win32.WORD;                    --  winnt.h :2958
         ne_nrestab : Win32.LONG;                    --  winnt.h :2959
         ne_cmovent : Win32.WORD;                    --  winnt.h :2960
         ne_align : Win32.WORD;                    --  winnt.h :2961
         ne_cres : Win32.WORD;                    --  winnt.h :2962
         ne_exetyp : Win32.BYTE;                    --  winnt.h :2963
         ne_flagsothers : Win32.BYTE;                    --  winnt.h :2964
         ne_pretthunks : Win32.WORD;                    --  winnt.h :2965
         ne_psegrefbytes : Win32.WORD;                    --  winnt.h :2966
         ne_swaparea : Win32.WORD;                    --  winnt.h :2967
         ne_expver : Win32.WORD;                    --  winnt.h :2968
      end record;

   type IMAGE_FILE_HEADER is                               --  winnt.h :2975
      record
         Machine : Win32.WORD;               --  winnt.h :2976
         NumberOfSections : Win32.WORD;               --  winnt.h :2977
         TimeDateStamp : Win32.DWORD;              --  winnt.h :2978
         PointerToSymbolTable : Win32.DWORD;              --  winnt.h :2979
         NumberOfSymbols : Win32.DWORD;              --  winnt.h :2980
         SizeOfOptionalHeader : Win32.WORD;               --  winnt.h :2981
         Characteristics : Win32.WORD;               --  winnt.h :2982
      end record;

   type IMAGE_DATA_DIRECTORY is                            --  winnt.h :3009
      record
         VirtualAddress : Win32.DWORD;                    --  winnt.h :3010
         Size : Win32.DWORD;                    --  winnt.h :3011
      end record;

   type anonymous18_t is                                   --  winnt.h :3060
     array (Integer range 0 .. 15)
     of IMAGE_DATA_DIRECTORY;

   type IMAGE_OPTIONAL_HEADER is                           --  winnt.h :3020
      record
         Magic : Win32.WORD;        --  winnt.h :3025
         MajorLinkerVersion : Win32.BYTE;        --  winnt.h :3026
         MinorLinkerVersion : Win32.BYTE;        --  winnt.h :3027
         SizeOfCode : Win32.DWORD;       --  winnt.h :3028
         SizeOfInitializedData : Win32.DWORD;       --  winnt.h :3029
         SizeOfUninitializedData : Win32.DWORD;       --  winnt.h :3030
         AddressOfEntryPoint : Win32.DWORD;       --  winnt.h :3031
         BaseOfCode : Win32.DWORD;       --  winnt.h :3032
         BaseOfData : Win32.DWORD;       --  winnt.h :3033
         ImageBase : Win32.DWORD;       --  winnt.h :3039
         SectionAlignment : Win32.DWORD;       --  winnt.h :3040
         FileAlignment : Win32.DWORD;       --  winnt.h :3041
         MajorOperatingSystemVersion : Win32.WORD;        --  winnt.h :3042
         MinorOperatingSystemVersion : Win32.WORD;        --  winnt.h :3043
         MajorImageVersion : Win32.WORD;        --  winnt.h :3044
         MinorImageVersion : Win32.WORD;        --  winnt.h :3045
         MajorSubsystemVersion : Win32.WORD;        --  winnt.h :3046
         MinorSubsystemVersion : Win32.WORD;        --  winnt.h :3047
         Reserved1 : Win32.DWORD;       --  winnt.h :3048
         SizeOfImage : Win32.DWORD;       --  winnt.h :3049
         SizeOfHeaders : Win32.DWORD;       --  winnt.h :3050
         CheckSum : Win32.DWORD;       --  winnt.h :3051
         Subsystem : Win32.WORD;        --  winnt.h :3052
         DllCharacteristics : Win32.WORD;        --  winnt.h :3053
         SizeOfStackReserve : Win32.DWORD;       --  winnt.h :3054
         SizeOfStackCommit : Win32.DWORD;       --  winnt.h :3055
         SizeOfHeapReserve : Win32.DWORD;       --  winnt.h :3056
         SizeOfHeapCommit : Win32.DWORD;       --  winnt.h :3057
         LoaderFlags : Win32.DWORD;       --  winnt.h :3058
         NumberOfRvaAndSizes : Win32.DWORD;       --  winnt.h :3059
         DataDirectory : anonymous18_t;     --  winnt.h :3060
      end record;

   type IMAGE_ROM_OPTIONAL_HEADER is                       --  winnt.h :3063
      record
         Magic : Win32.WORD;            --  winnt.h :3064
         MajorLinkerVersion : Win32.BYTE;            --  winnt.h :3065
         MinorLinkerVersion : Win32.BYTE;            --  winnt.h :3066
         SizeOfCode : Win32.DWORD;           --  winnt.h :3067
         SizeOfInitializedData : Win32.DWORD;           --  winnt.h :3068
         SizeOfUninitializedData : Win32.DWORD;           --  winnt.h :3069
         AddressOfEntryPoint : Win32.DWORD;           --  winnt.h :3070
         BaseOfCode : Win32.DWORD;           --  winnt.h :3071
         BaseOfData : Win32.DWORD;           --  winnt.h :3072
         BaseOfBss : Win32.DWORD;           --  winnt.h :3073
         GprMask : Win32.DWORD;           --  winnt.h :3074
         CprMask : Win32.DWORD_Array (0 .. 3);
         --  winnt.h :3075
         GpValue : Win32.DWORD;           --  winnt.h :3076
      end record;

   type IMAGE_NT_HEADERS is                                --  winnt.h :3086
      record
         Signature : Win32.DWORD;                    --  winnt.h :3087
         FileHeader : IMAGE_FILE_HEADER;              --  winnt.h :3088
         OptionalHeader : IMAGE_OPTIONAL_HEADER;          --  winnt.h :3089
      end record;

   type IMAGE_ROM_HEADERS is                               --  winnt.h :3092
      record
         FileHeader : IMAGE_FILE_HEADER;              --  winnt.h :3093
         OptionalHeader : IMAGE_ROM_OPTIONAL_HEADER;      --  winnt.h :3094
      end record;

   type union_anonymous21_t_kind is ( --  winnt.h :3135
     PhysicalAddress_kind,
     VirtualSize_kind
                                    );

   type union_anonymous21_t
     (Which : union_anonymous21_t_kind :=  PhysicalAddress_kind) is
      record                                              --  winnt.h :3135
         case Which is
            when PhysicalAddress_kind =>
               PhysicalAddress : Win32.DWORD;           --  winnt.h :3133
            when VirtualSize_kind =>
               VirtualSize : Win32.DWORD;               --  winnt.h :3134
         end case;
      end record;

   pragma Convention (C, union_anonymous21_t);

   pragma Unchecked_Union (union_anonymous21_t);

   type IMAGE_SECTION_HEADER is                            --  winnt.h :3130
      record
         Name : Win32.BYTE_Array (0 .. 7);   --  winnt.h :3131
         Misc : union_anonymous21_t;      --  winnt.h :3135
         VirtualAddress : Win32.DWORD;              --  winnt.h :3136
         SizeOfRawData : Win32.DWORD;              --  winnt.h :3137
         PointerToRawData : Win32.DWORD;              --  winnt.h :3138
         PointerToRelocations : Win32.DWORD;              --  winnt.h :3139
         PointerToLinenumbers : Win32.DWORD;              --  winnt.h :3140
         NumberOfRelocations : Win32.WORD;               --  winnt.h :3141
         NumberOfLinenumbers : Win32.WORD;               --  winnt.h :3142
         Characteristics : Win32.DWORD;              --  winnt.h :3143
      end record;

   type anonymous22_t is                                   --  winnt.h :3185
      record
         Short : Win32.DWORD;                             --  winnt.h :3183
         Long : Win32.DWORD;                             --  winnt.h :3184
      end record;

   type anonymous23_t is                                   --  winnt.h :3186
     array (Integer range 0 .. 1)
     of Win32.PBYTE;

   type union_anonymous24_t_kind is ( --  winnt.h :3187
     ShortName_kind,
     Name_kind,
     LongName_kind
                                    );

   type union_anonymous24_t
     (Which : union_anonymous24_t_kind :=  ShortName_kind) is
      --  winnt.h :3187
      record
         case Which is
            when ShortName_kind =>
               ShortName : Win32.BYTE_Array (0 .. 7);      --  winnt.h :3181
            when Name_kind =>
               Name : anonymous22_t;                    --  winnt.h :3185
            when LongName_kind =>
               LongName : anonymous23_t;                --  winnt.h :3186
         end case;
      end record;

   pragma Convention (C, union_anonymous24_t);

   pragma Unchecked_Union (union_anonymous24_t);

   type IMAGE_SYMBOL is                                    --  winnt.h :3179
      record
         N : union_anonymous24_t;        --  winnt.h :3187
         Value : Win32.DWORD;                --  winnt.h :3188
         SectionNumber : Win32.SHORT;                --  winnt.h :3189
         C_Type : Win32.WORD;                 --  winnt.h :3190
         StorageClass : Win32.BYTE;                 --  winnt.h :3191
         NumberOfAuxSymbols : Win32.BYTE;                 --  winnt.h :3192
      end record;

   type anonymous25_t is                                   --  winnt.h :3324
      record
         Linenumber : Win32.WORD;                         --  winnt.h :3322
         Size : Win32.WORD;                         --  winnt.h :3323
      end record;

   type union_anonymous26_t_kind is ( --  winnt.h :3326
     LnSz_kind,
     TotalSize_kind
                                    );

   type union_anonymous26_t (Which : union_anonymous26_t_kind :=  LnSz_kind) is
      --  winnt.h :3326
      record
         case Which is
            when LnSz_kind =>
               LnSz : anonymous25_t;                    --  winnt.h :3324
            when TotalSize_kind =>
               TotalSize : Win32.DWORD;                 --  winnt.h :3325
         end case;
      end record;

   pragma Convention (C, union_anonymous26_t);

   pragma Unchecked_Union (union_anonymous26_t);

   type anonymous27_t is                                   --  winnt.h :3331
      record
         PointerToLinenumber : Win32.DWORD;             --  winnt.h :3329
         PointerToNextFunction : Win32.DWORD;             --  winnt.h :3330
      end record;

   type anonymous28_t is                                   --  winnt.h :3334
      record
         Dimension : Win32.INT_Array (0 .. 3);               --  winnt.h :3333
      end record;

   type union_anonymous29_t_kind is ( --  winnt.h :3335
     C_Function_kind,
     C_Array_kind
                                    );

   type union_anonymous29_t
     (Which : union_anonymous29_t_kind :=  C_Function_kind) is
      --  winnt.h :3335
      record
         case Which is
            when C_Function_kind =>
               C_Function : anonymous27_t;              --  winnt.h :3331
            when C_Array_kind =>
               C_Array : anonymous28_t;                 --  winnt.h :3334
         end case;
      end record;

   pragma Convention (C, union_anonymous29_t);

   pragma Unchecked_Union (union_anonymous29_t);

   type anonymous30_t is                                   --  winnt.h :3337
      record
         TagIndex : Win32.DWORD;                          --  winnt.h :3319
         Misc : union_anonymous26_t;                  --  winnt.h :3326
         FcnAry : union_anonymous29_t;                  --  winnt.h :3335
         TvIndex : Win32.WORD;                           --  winnt.h :3336
      end record;

   type anonymous32_t is                                   --  winnt.h :3340
      record
         Name : Win32.BYTE_Array (0 .. 17);                  --  winnt.h :3339
      end record;

   type anonymous33_t is                                   --  winnt.h :3348
      record
         Length : Win32.DWORD;               --  winnt.h :3342
         NumberOfRelocations : Win32.WORD;                --  winnt.h :3343
         NumberOfLinenumbers : Win32.WORD;                --  winnt.h :3344
         CheckSum : Win32.DWORD;               --  winnt.h :3345
         Number : Win32.SHORT;               --  winnt.h :3346
         Selection : Win32.BYTE;                --  winnt.h :3347
      end record;

   type IMAGE_AUX_SYMBOL_kind is ( --  winnt.h :3317
     Sym_kind,
     File_kind,
     Section_kind
                                 );

   type IMAGE_AUX_SYMBOL
     (Which : IMAGE_AUX_SYMBOL_kind :=  Sym_kind) is       --  winnt.h :3317
      record
         case Which is
            when Sym_kind =>
               Sym : anonymous30_t;                     --  winnt.h :3337
            when File_kind =>
               File : anonymous32_t;                    --  winnt.h :3340
            when Section_kind =>
               Section : anonymous33_t;                 --  winnt.h :3348
         end case;
      end record;

   pragma Unchecked_Union (IMAGE_AUX_SYMBOL);

   type IMAGE_RELOCATION is                                --  winnt.h :3373
      record
         VirtualAddress : Win32.DWORD;                  --  winnt.h :3374
         SymbolTableIndex : Win32.DWORD;                  --  winnt.h :3375
         C_Type : Win32.WORD;                   --  winnt.h :3376
      end record;

   for IMAGE_RELOCATION use
      record
         VirtualAddress   at 0 range 0 .. 31;
         SymbolTableIndex at 4 range 0 .. 31;
         C_Type           at 8 range 0 .. 15;
      end record;

   --  for IMAGE_RELOCATION'Size use 10*8;

   type IMAGE_BASE_RELOCATION is                           --  winnt.h :3469
      record
         VirtualAddress : Win32.DWORD;                    --  winnt.h :3470
         SizeOfBlock : Win32.DWORD;                    --  winnt.h :3471
      end record;

   type union_anonymous34_t_kind is ( --  winnt.h :3496
     SymbolTableIndex_kind,
     VirtualAddress_kind
                                    );

   type union_anonymous34_t
     (Which : union_anonymous34_t_kind :=  SymbolTableIndex_kind) is
      record                                              --  winnt.h :3496
         case Which is
            when SymbolTableIndex_kind =>
               SymbolTableIndex : Win32.DWORD;          --  winnt.h :3494
            when VirtualAddress_kind =>
               VirtualAddress : Win32.DWORD;            --  winnt.h :3495
         end case;
      end record;

   pragma Convention (C, union_anonymous34_t);

   pragma Unchecked_Union (union_anonymous34_t);

   type IMAGE_LINENUMBER is                                --  winnt.h :3492
      record
         C_Type : union_anonymous34_t;                --  winnt.h :3496
         Linenumber : Win32.WORD;                         --  winnt.h :3497
      end record;

   type IMAGE_ARCHIVE_MEMBER_HEADER is                     --  winnt.h :3514
      record
         Name : Win32.BYTE_Array (0 .. 15);             --  winnt.h :3515
         Date : Win32.BYTE_Array (0 .. 11);             --  winnt.h :3516
         UserID : Win32.BYTE_Array (0 .. 5);              --  winnt.h :3517
         GroupID : Win32.BYTE_Array (0 .. 5);              --  winnt.h :3518
         Mode : Win32.BYTE_Array (0 .. 7);              --  winnt.h :3519
         Size : Win32.BYTE_Array (0 .. 9);              --  winnt.h :3520
         EndHeader : Win32.BYTE_Array (0 .. 1);              --  winnt.h :3521
      end record;

   type IMAGE_EXPORT_DIRECTORY is                          --  winnt.h :3534
      record
         Characteristics : Win32.DWORD;             --  winnt.h :3535
         TimeDateStamp : Win32.DWORD;             --  winnt.h :3536
         MajorVersion : Win32.WORD;              --  winnt.h :3537
         MinorVersion : Win32.WORD;              --  winnt.h :3538
         Name : Win32.DWORD;             --  winnt.h :3539
         Base : Win32.DWORD;             --  winnt.h :3540
         NumberOfFunctions : Win32.DWORD;             --  winnt.h :3541
         NumberOfNames : Win32.DWORD;             --  winnt.h :3542
         AddressOfFunctions : PPDWORD;                 --  winnt.h :3543
         AddressOfNames : PPDWORD;                 --  winnt.h :3544
         AddressOfNameOrdinals : PPWORD;                  --  winnt.h :3545
      end record;

   type IMAGE_IMPORT_BY_NAME is                            --  winnt.h :3552
      record
         Hint : Win32.WORD;                               --  winnt.h :3553
         Name : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY); --  winnt.h :3554
      end record;

   --  ANYSIZE_ARRAY type prevents this :
   --  for IMAGE_IMPORT_BY_NAME use
   --  record
   --  Hint at 0 range 0 .. 15;
   --  Name at 2 range 0 .. 7;
   --  end record;

   --  for IMAGE_IMPORT_BY_NAME'Size use 3*8;

   type union_anonymous42_t_kind is ( --  winnt.h :3562
     C_Function_kind,
     Ordinal_kind,
     AddressOfData_kind
                                    );

   type union_anonymous42_t
     (Which : union_anonymous42_t_kind :=  C_Function_kind) is
      --  winnt.h :3562
      record
         case Which is
            when C_Function_kind =>
               C_Function : Win32.PDWORD;               --  winnt.h :3559
            when Ordinal_kind =>
               Ordinal : Win32.DWORD;                   --  winnt.h :3560
            when AddressOfData_kind =>
               AddressOfData : PIMAGE_IMPORT_BY_NAME;   --  winnt.h :3561
         end case;
      end record;

   pragma Convention (C, union_anonymous42_t);

   pragma Unchecked_Union (union_anonymous42_t);

   type IMAGE_THUNK_DATA is                                --  winnt.h :3557
      record
         u1 : union_anonymous42_t;                        --  winnt.h :3562
      end record;

   type IMAGE_IMPORT_DESCRIPTOR is                         --  winnt.h :3569
      record
         Characteristics : Win32.DWORD;                   --  winnt.h :3570
         TimeDateStamp : Win32.DWORD;                   --  winnt.h :3571
         ForwarderChain : Win32.DWORD;                   --  winnt.h :3572
         Name : Win32.DWORD;                   --  winnt.h :3573
         FirstThunk : PIMAGE_THUNK_DATA;             --  winnt.h :3574
      end record;

   type PIMAGE_TLS_CALLBACK is access procedure
     (DllHandle : Win32.PVOID;
              Reason : Win32.DWORD;
              Reserved : Win32.PVOID);                        --  winnt.h :3582
   pragma Convention (Stdcall, PIMAGE_TLS_CALLBACK);

   type PPIMAGE_TLS_CALLBACK is access all PIMAGE_TLS_CALLBACK;
   --  winnt.h :3592

   type IMAGE_TLS_DIRECTORY is                             --  winnt.h :3588
      record
         StartAddressOfRawData : Win32.DWORD;             --  winnt.h :3589
         EndAddressOfRawData : Win32.DWORD;             --  winnt.h :3590
         AddressOfIndex : Win32.PDWORD;            --  winnt.h :3591
         AddressOfCallBacks : PPIMAGE_TLS_CALLBACK;    --  winnt.h :3592
         SizeOfZeroFill : Win32.DWORD;             --  winnt.h :3593
         Characteristics : Win32.DWORD;             --  winnt.h :3594
      end record;

   type IMAGE_RESOURCE_DIRECTORY is                        --  winnt.h :3616
      record
         Characteristics : Win32.DWORD;              --  winnt.h :3617
         TimeDateStamp : Win32.DWORD;              --  winnt.h :3618
         MajorVersion : Win32.WORD;               --  winnt.h :3619
         MinorVersion : Win32.WORD;               --  winnt.h :3620
         NumberOfNamedEntries : Win32.WORD;               --  winnt.h :3621
         NumberOfIdEntries : Win32.WORD;               --  winnt.h :3622
      end record;

   type IMAGE_RESOURCE_DIRECTORY_ENTRY is                  --  winnt.h :3644
      record
         Name : Win32.DWORD;                      --  winnt.h :3645
         OffsetToData : Win32.DWORD;                      --  winnt.h :3646
      end record;

   type IMAGE_RESOURCE_DIRECTORY_STRING is                 --  winnt.h :3658
      record
         Length : Win32.WORD;                         --  winnt.h :3659
         NameString : Win32.CHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winnt.h :3660
      end record;

   --  ANYSIZE_ARRAY prohibits this :
   --  for IMAGE_RESOURCE_DIRECTORY_STRING use
   --  record
   --  Length     at 0 range 0 .. 15;
   --  NameString at 2 range 0 .. 7;
   --  end record;

   --  for IMAGE_RESOURCE_DIRECTORY_STRING'Size use 3*8;

   type IMAGE_RESOURCE_DIR_STRING_U is                     --  winnt.h :3664
      record
         Length : Win32.WORD;                         --  winnt.h :3665
         NameString : Win32.WCHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winnt.h :3666
      end record;

   type IMAGE_RESOURCE_DATA_ENTRY is                       --  winnt.h :3679
      record
         OffsetToData : Win32.DWORD;                      --  winnt.h :3680
         Size : Win32.DWORD;                      --  winnt.h :3681
         CodePage : Win32.DWORD;                      --  winnt.h :3682
         Reserved : Win32.DWORD;                      --  winnt.h :3683
      end record;

   type IMAGE_LOAD_CONFIG_DIRECTORY is                     --  winnt.h :3690
      record
         Characteristics : Win32.DWORD;     --  winnt.h :3691
         TimeDateStamp : Win32.DWORD;     --  winnt.h :3692
         MajorVersion : Win32.WORD;      --  winnt.h :3693
         MinorVersion : Win32.WORD;      --  winnt.h :3694
         GlobalFlagsClear : Win32.DWORD;     --  winnt.h :3695
         GlobalFlagsSet : Win32.DWORD;     --  winnt.h :3696
         CriticalSectionDefaultTimeout : Win32.DWORD;     --  winnt.h :3697
         DeCommitFreeBlockThreshold : Win32.DWORD;     --  winnt.h :3698
         DeCommitTotalFreeThreshold : Win32.DWORD;     --  winnt.h :3699
         LockPrefixTable : Win32.PVOID;     --  winnt.h :3700
         MaximumAllocationSize : Win32.DWORD;     --  winnt.h :3701
         VirtualMemoryThreshold : Win32.DWORD;     --  winnt.h :3702
         Reserved : Win32.DWORD_Array (0 .. 4);
         --  winnt.h :3703
      end record;

   type IMAGE_RUNTIME_FUNCTION_ENTRY is                    --  winnt.h :3714
      record
         BeginAddress : Win32.DWORD;                  --  winnt.h :3715
         EndAddress : Win32.DWORD;                  --  winnt.h :3716
         ExceptionHandler : Win32.PVOID;                  --  winnt.h :3717
         HandlerData : Win32.PVOID;                  --  winnt.h :3718
         PrologEndAddress : Win32.DWORD;                  --  winnt.h :3719
      end record;

   type IMAGE_DEBUG_DIRECTORY is                           --  winnt.h :3726
      record
         Characteristics : Win32.DWORD;                  --  winnt.h :3727
         TimeDateStamp : Win32.DWORD;                  --  winnt.h :3728
         MajorVersion : Win32.WORD;                   --  winnt.h :3729
         MinorVersion : Win32.WORD;                   --  winnt.h :3730
         C_Type : Win32.DWORD;                  --  winnt.h :3731
         SizeOfData : Win32.DWORD;                  --  winnt.h :3732
         AddressOfRawData : Win32.DWORD;                  --  winnt.h :3733
         PointerToRawData : Win32.DWORD;                  --  winnt.h :3734
      end record;

   type IMAGE_COFF_SYMBOLS_HEADER is                       --  winnt.h :3747
      record
         NumberOfSymbols : Win32.DWORD;              --  winnt.h :3748
         LvaToFirstSymbol : Win32.DWORD;              --  winnt.h :3749
         NumberOfLinenumbers : Win32.DWORD;              --  winnt.h :3750
         LvaToFirstLinenumber : Win32.DWORD;              --  winnt.h :3751
         RvaToFirstByteOfCode : Win32.DWORD;              --  winnt.h :3752
         RvaToLastByteOfCode : Win32.DWORD;              --  winnt.h :3753
         RvaToFirstByteOfData : Win32.DWORD;              --  winnt.h :3754
         RvaToLastByteOfData : Win32.DWORD;              --  winnt.h :3755
      end record;

   type IMAGE_DEBUG_MISC is                                --  winnt.h :3779
      record
         DataType : Win32.DWORD;                          --  winnt.h :3780
         Length : Win32.DWORD;                          --  winnt.h :3781
         Unicode : BOOLEAN;                              --  winnt.h :3783
         Reserved : Win32.BYTE_Array (0 .. 2);               --  winnt.h :3784
         Data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winnt.h :3785
      end record;

   --  ANYSIZE_ARRAY prohibits this :
   --  for IMAGE_DEBUG_MISC use
   --  record
   --  DataType at 0 range 0 .. 31;
   --  Length   at 4 range 0 .. 31;
   --  Unicode  at 8 range 0 .. 7;
   --  Reserved at 9 range 0 .. 23;
   --  Data     at 12 range 0 .. 7;
   --  end record;

   --  for IMAGE_DEBUG_MISC'Size use 13*8;

   type IMAGE_FUNCTION_ENTRY is                            --  winnt.h :3795
      record
         StartingAddress : Win32.DWORD;                   --  winnt.h :3796
         EndingAddress : Win32.DWORD;                   --  winnt.h :3797
         EndOfPrologue : Win32.DWORD;                   --  winnt.h :3798
      end record;

   type IMAGE_SEPARATE_DEBUG_HEADER is                     --  winnt.h :3821
      record
         Signature : Win32.WORD;                 --  winnt.h :3822
         Flags : Win32.WORD;                 --  winnt.h :3823
         Machine : Win32.WORD;                 --  winnt.h :3824
         Characteristics : Win32.WORD;                 --  winnt.h :3825
         TimeDateStamp : Win32.DWORD;                --  winnt.h :3826
         CheckSum : Win32.DWORD;                --  winnt.h :3827
         ImageBase : Win32.DWORD;                --  winnt.h :3828
         SizeOfImage : Win32.DWORD;                --  winnt.h :3829
         NumberOfSections : Win32.DWORD;                --  winnt.h :3830
         ExportedNamesSize : Win32.DWORD;                --  winnt.h :3831
         DebugDirectorySize : Win32.DWORD;                --  winnt.h :3832
         Reserved : Win32.DWORD_Array (0 .. 2);    --  winnt.h :3833
      end record;

   type MESSAGE_RESOURCE_ENTRY is                          --  winnt.h :3930
      record
         Length : Win32.WORD;                             --  winnt.h :3931
         Flags : Win32.WORD;                             --  winnt.h :3932
         Text : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winnt.h :3933
      end record;

   type MESSAGE_RESOURCE_BLOCK is                          --  winnt.h :3938
      record
         LowId : Win32.DWORD;                   --  winnt.h :3939
         HighId : Win32.DWORD;                   --  winnt.h :3940
         OffsetToEntries : Win32.DWORD;                   --  winnt.h :3941
      end record;

   type Message_Resource_Array is                          --  winnt.h :3946
     array (Natural range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased MESSAGE_RESOURCE_BLOCK;

   type MESSAGE_RESOURCE_DATA is                           --  winnt.h :3944
      record
         NumberOfBlocks : Win32.DWORD;                    --  winnt.h :3945
         Blocks : Message_Resource_Array;         --  winnt.h :3946
      end record;

   type RTL_CRITICAL_SECTION is                            --  winnt.h :3953
      record
         DebugInfo : PRTL_CRITICAL_SECTION_DEBUG;    --  winnt.h :3965
         LockCount : Win32.LONG;                     --  winnt.h :3972
         RecursionCount : Win32.LONG;                     --  winnt.h :3973
         OwningThread : HANDLE;                         --  winnt.h :3974
         LockSemaphore : HANDLE;                         --  winnt.h :3975
         Reserved : Win32.DWORD;                    --  winnt.h :3976
      end record;

   type RTL_CRITICAL_SECTION_DEBUG is                      --  winnt.h :3950
      record
         C_Type : Win32.WORD;              --  winnt.h :3951
         CreatorBackTraceIndex : Win32.WORD;              --  winnt.h :3952
         CriticalSection : PRTL_CRITICAL_SECTION;   --  winnt.h :3953
         ProcessLocksList : LIST_ENTRY;              --  winnt.h :3954
         EntryCount : Win32.DWORD;             --  winnt.h :3955
         ContentionCount : Win32.DWORD;             --  winnt.h :3956
         Depth : Win32.DWORD;             --  winnt.h :3957
         OwnerBackTrace : Win32.PVOID_Array (0 .. 4); --  winnt.h :3958
      end record;

   type EVENTLOGRECORD is                                  --  winnt.h :4021
      record
         Length : Win32.DWORD;               --  winnt.h :4022
         Reserved : Win32.DWORD;               --  winnt.h :4023
         RecordNumber : Win32.DWORD;               --  winnt.h :4024
         TimeGenerated : Win32.DWORD;               --  winnt.h :4025
         TimeWritten : Win32.DWORD;               --  winnt.h :4026
         EventID : Win32.DWORD;               --  winnt.h :4027
         EventType : Win32.WORD;                --  winnt.h :4028
         NumStrings : Win32.WORD;                --  winnt.h :4029
         EventCategory : Win32.WORD;                --  winnt.h :4030
         ReservedFlags : Win32.WORD;                --  winnt.h :4031
         ClosingRecordNumber : Win32.DWORD;               --  winnt.h :4032
         StringOffset : Win32.DWORD;               --  winnt.h :4033
         UserSidLength : Win32.DWORD;               --  winnt.h :4034
         UserSidOffset : Win32.DWORD;               --  winnt.h :4035
         DataLength : Win32.DWORD;               --  winnt.h :4036
         DataOffset : Win32.DWORD;               --  winnt.h :4037
      end record;

   type TAPE_ERASE is                                      --  winnt.h :4256
      record
         C_Type : Win32.DWORD;                         --  winnt.h :4257
         Immediate : BOOLEAN;                             --  winnt.h :4258
      end record;

   type TAPE_PREPARE is                                    --  winnt.h :4272
      record
         Operation : Win32.DWORD;                         --  winnt.h :4273
         Immediate : BOOLEAN;                             --  winnt.h :4274
      end record;

   type TAPE_WRITE_MARKS is                                --  winnt.h :4286
      record
         C_Type : Win32.DWORD;                         --  winnt.h :4287
         Count : Win32.DWORD;                         --  winnt.h :4288
         Immediate : BOOLEAN;                             --  winnt.h :4289
      end record;

   type TAPE_GET_POSITION is                               --  winnt.h :4300
      record
         C_Type : Win32.DWORD;                         --  winnt.h :4301
         Partition : Win32.DWORD;                         --  winnt.h :4302
         Offset : LARGE_INTEGER;                       --  winnt.h :4303
      end record;

   type TAPE_SET_POSITION is                               --  winnt.h :4321
      record
         Method : Win32.DWORD;                         --  winnt.h :4322
         Partition : Win32.DWORD;                         --  winnt.h :4323
         Offset : LARGE_INTEGER;                       --  winnt.h :4324
         Immediate : BOOLEAN;                             --  winnt.h :4325
      end record;

   type TAPE_GET_DRIVE_PARAMETERS is                       --  winnt.h :4410
      record
         ECC : BOOLEAN;                 --  winnt.h :4411
         Compression : BOOLEAN;                 --  winnt.h :4412
         DataPadding : BOOLEAN;                 --  winnt.h :4413
         ReportSetmarks : BOOLEAN;                 --  winnt.h :4414
         DefaultBlockSize : Win32.DWORD;             --  winnt.h :4415
         MaximumBlockSize : Win32.DWORD;             --  winnt.h :4416
         MinimumBlockSize : Win32.DWORD;             --  winnt.h :4417
         MaximumPartitionCount : Win32.DWORD;             --  winnt.h :4418
         FeaturesLow : Win32.DWORD;             --  winnt.h :4419
         FeaturesHigh : Win32.DWORD;             --  winnt.h :4420
         EOTWARNINGZONESIZE : Win32.DWORD;             --  winnt.h :4421
      end record;

   type TAPE_SET_DRIVE_PARAMETERS is                       --  winnt.h :4428
      record
         ECC : BOOLEAN;                    --  winnt.h :4429
         Compression : BOOLEAN;                    --  winnt.h :4430
         DataPadding : BOOLEAN;                    --  winnt.h :4431
         ReportSetmarks : BOOLEAN;                    --  winnt.h :4432
         EOTWARNINGZONESIZE : Win32.DWORD;                --  winnt.h :4433
      end record;

   type TAPE_GET_MEDIA_PARAMETERS is                       --  winnt.h :4440
      record
         Capacity : LARGE_INTEGER;                  --  winnt.h :4441
         Remaining : LARGE_INTEGER;                  --  winnt.h :4442
         BlockSize : Win32.DWORD;                    --  winnt.h :4443
         PartitionCount : Win32.DWORD;                    --  winnt.h :4444
         WriteProtected : BOOLEAN;                        --  winnt.h :4445
      end record;

   type TAPE_SET_MEDIA_PARAMETERS is                       --  winnt.h :4452
      record
         BlockSize : Win32.DWORD;                         --  winnt.h :4453
      end record;

   type TAPE_CREATE_PARTITION is                           --  winnt.h :4464
      record
         Method : Win32.DWORD;                            --  winnt.h :4465
         Count : Win32.DWORD;                            --  winnt.h :4466
         Size : Win32.DWORD;                            --  winnt.h :4467
      end record;

   --  Instead of FIELD_OFFSET (Rec, Field),                   --  winnt.h :472
   --  use the Ada 95 attribute Rec.Field'Position

   --  Instead of CONTAINING_RECORD (address, type, field)     --  winnt.h :481
   --  In Ada 95, given an address A and a record R and field F,
   --  use A-R.F'Position

   function MAKELANGID (P, S : WORD) return WORD;           --  winnt.h :607

   function PRIMARYLANGID (LGID : WORD) return WORD;        --  winnt.h :608

   function SUBLANGID (LGID : WORD) return WORD;            --  winnt.h :609

   function MAKELCID (Lgid, Srtid : WORD) return DWORD;     --  winnt.h :631

   function LANGIDFROMLCID (Lcid : DWORD) return WORD;      --  winnt.h :633

   function SORTIDFROMLCID (Lcid : DWORD) return WORD;      --  winnt.h :634

   function IMAGE_FIRST_SECTION (NTHeader : PIMAGE_NT_HEADERS) return
     PIMAGE_DATA_DIRECTORY;                              --  winnt.h :3097

   function BTYPE (X : BYTE) return BYTE;                    --  winnt.h :3287

   function ISPTR (X : BYTE) return Standard.Boolean;        --  winnt.h :3291

   function ISFCN (X : BYTE) return Standard.Boolean;        --  winnt.h :3296

   function ISARY (X : BYTE) return Standard.Boolean;        --  winnt.h :3302

   function ISTAG (X : BYTE) return Standard.Boolean;        --  winnt.h :3307

   function INCREF (X : BYTE) return BYTE;                   --  winnt.h :3311

   function DECREF (X : BYTE) return BYTE;                   --  winnt.h :3314

   function IMAGE_SNAP_BY_ORDINAL (Ordinal : DWORD) return Standard.Boolean;
   --  winnt.h :3570

   function IMAGE_ORDINAL (Ordinal : DWORD) return WORD;     --  winnt.h :3571

private

   pragma Convention (c_pass_by_copy, ULARGE_INTEGER);
   pragma Convention (c_pass_by_copy, FPO_DATA);            --  winnt.h :3762
   pragma Convention (c_pass_by_copy, anonymous2_t);        --  winnt.h :205
   pragma Convention (c_pass_by_copy, LIST_ENTRY);          --  winnt.h :446
   pragma Convention (c_pass_by_copy, SINGLE_LIST_ENTRY);   --  winnt.h :457
   pragma Convention (C, FLOATING_SAVE_AREA);               --  winnt.h :1150
   pragma Convention (C, CONTEXT);                          --  winnt.h :1174
   pragma Convention (c_pass_by_copy, anonymous4_t);        --  winnt.h :1270
   pragma Convention (c_pass_by_copy, anonymous5_t);        --  winnt.h :1282
   pragma Convention (c_pass_by_copy, LDT_ENTRY);           --  winnt.h :1261
   pragma Convention (C, EXCEPTION_RECORD);                 --  winnt.h :1670
   pragma Convention (c_pass_by_copy, EXCEPTION_POINTERS);  --  winnt.h :1682
   pragma Convention (C, MEMORY_BASIC_INFORMATION);         --  winnt.h :1744
   pragma Convention (c_pass_by_copy, GENERIC_MAPPING);     --  winnt.h :1978
                                                            --  winnt.h :2041
   pragma Convention (c_pass_by_copy, SID);                 --  winnt.h :2046
   pragma Convention (c_pass_by_copy, SID_AND_ATTRIBUTES);  --  winnt.h :2076
   pragma Convention (c_pass_by_copy, ACL);                 --  winnt.h :2275
   pragma Convention (c_pass_by_copy, ACE_HEADER);          --  winnt.h :2304
   pragma Convention (c_pass_by_copy, ACCESS_ALLOWED_ACE);  --  winnt.h :2386
   pragma Convention (c_pass_by_copy, ACCESS_DENIED_ACE);   --  winnt.h :2394
   pragma Convention (c_pass_by_copy, SYSTEM_AUDIT_ACE);    --  winnt.h :2401
   pragma Convention (c_pass_by_copy, SYSTEM_ALARM_ACE);    --  winnt.h :2408
   pragma Convention (c_pass_by_copy, ACL_REVISION_INFORMATION);
   --  winnt.h :2434
   pragma Convention (c_pass_by_copy, ACL_SIZE_INFORMATION); --  winnt.h :2443
   pragma Convention (C, SECURITY_DESCRIPTOR);              --  winnt.h :2563
   pragma Convention (C, PRIVILEGE_SET);                    --  winnt.h :2646
   pragma Convention (c_pass_by_copy, SECURITY_QUALITY_OF_SERVICE);
   --  winnt.h :2729
   pragma Convention (c_pass_by_copy, SE_IMPERSONATION_STATE);
   --  winnt.h :2741
   pragma Convention (c_pass_by_copy, TOKEN_USER);          --  winnt.h :2829
   pragma Convention (c_pass_by_copy, TOKEN_GROUPS);        --  winnt.h :2834
   pragma Convention (c_pass_by_copy, TOKEN_PRIVILEGES);    --  winnt.h :2840
   pragma Convention (c_pass_by_copy, TOKEN_OWNER);         --  winnt.h :2846
   pragma Convention (c_pass_by_copy, TOKEN_PRIMARY_GROUP); --  winnt.h :2851
   pragma Convention (c_pass_by_copy, TOKEN_DEFAULT_DACL);  --  winnt.h :2856
   pragma Convention (c_pass_by_copy, TOKEN_SOURCE);        --  winnt.h :2865
   pragma Convention (C, TOKEN_STATISTICS);                 --  winnt.h :2872
   pragma Convention (C, TOKEN_CONTROL);                    --  winnt.h :2888
   pragma Convention (C, IMAGE_DOS_HEADER);                 --  winnt.h :2916
   pragma Convention (C, IMAGE_OS2_HEADER);                 --  winnt.h :2938
   pragma Convention (C, IMAGE_FILE_HEADER);                --  winnt.h :2975
   pragma Convention (c_pass_by_copy, IMAGE_DATA_DIRECTORY); --  winnt.h :3009
   pragma Convention (C, IMAGE_OPTIONAL_HEADER);            --  winnt.h :3020
   pragma Convention (C, IMAGE_ROM_OPTIONAL_HEADER);        --  winnt.h :3063
   pragma Convention (C, IMAGE_NT_HEADERS);                 --  winnt.h :3086
   pragma Convention (C, IMAGE_ROM_HEADERS);                --  winnt.h :3092
   pragma Convention (C, IMAGE_SECTION_HEADER);             --  winnt.h :3130
   pragma Convention (c_pass_by_copy, anonymous22_t);       --  winnt.h :3185
   pragma Convention (C, IMAGE_SYMBOL);                     --  winnt.h :3179
   pragma Convention (c_pass_by_copy, anonymous25_t);       --  winnt.h :3324
   pragma Convention (c_pass_by_copy, anonymous27_t);       --  winnt.h :3331
   pragma Convention (c_pass_by_copy, anonymous28_t);       --  winnt.h :3334
   pragma Convention (C, anonymous30_t);                    --  winnt.h :3337
   pragma Convention (C, anonymous32_t);                    --  winnt.h :3340
   pragma Convention (c_pass_by_copy, anonymous33_t);       --  winnt.h :3348
   pragma Convention (c_pass_by_copy, IMAGE_RELOCATION);    --  winnt.h :3373
   pragma Convention (c_pass_by_copy, IMAGE_BASE_RELOCATION);
   --  winnt.h :3469
   pragma Convention (c_pass_by_copy, IMAGE_LINENUMBER);    --  winnt.h :3492
   pragma Convention (C, IMAGE_ARCHIVE_MEMBER_HEADER);      --  winnt.h :3514
   pragma Convention (C, IMAGE_EXPORT_DIRECTORY);           --  winnt.h :3534
   pragma Convention (c_pass_by_copy, IMAGE_IMPORT_BY_NAME); --  winnt.h :3552
   pragma Convention (c_pass_by_copy, IMAGE_THUNK_DATA);    --  winnt.h :3557
   pragma Convention (C, IMAGE_IMPORT_DESCRIPTOR);          --  winnt.h :3569
   pragma Convention (C, IMAGE_TLS_DIRECTORY);              --  winnt.h :3588
   pragma Convention (c_pass_by_copy, IMAGE_RESOURCE_DIRECTORY);
   --  winnt.h :3616
   pragma Convention (c_pass_by_copy, IMAGE_RESOURCE_DIRECTORY_ENTRY);
   --  winnt.h :3644
   pragma Convention (c_pass_by_copy, IMAGE_RESOURCE_DIRECTORY_STRING);
   --  winnt.h :3658
   pragma Convention (c_pass_by_copy, IMAGE_RESOURCE_DIR_STRING_U);
   --  winnt.h :3664
   pragma Convention (c_pass_by_copy, IMAGE_RESOURCE_DATA_ENTRY);
   --  winnt.h :3679
   pragma Convention (C, IMAGE_LOAD_CONFIG_DIRECTORY);      --  winnt.h :3690
   pragma Convention (C, IMAGE_RUNTIME_FUNCTION_ENTRY);     --  winnt.h :3714
   pragma Convention (C, IMAGE_DEBUG_DIRECTORY);            --  winnt.h :3726
   pragma Convention (C, IMAGE_COFF_SYMBOLS_HEADER);        --  winnt.h :3747
   pragma Convention (c_pass_by_copy, IMAGE_DEBUG_MISC);    --  winnt.h :3779
   pragma Convention (c_pass_by_copy, IMAGE_FUNCTION_ENTRY); --  winnt.h :3795
   pragma Convention (C, IMAGE_SEPARATE_DEBUG_HEADER);      --  winnt.h :3821
   pragma Convention (c_pass_by_copy, MESSAGE_RESOURCE_ENTRY);
   --  winnt.h :3930
   pragma Convention (c_pass_by_copy, MESSAGE_RESOURCE_BLOCK);
   --  winnt.h :3938
   pragma Convention (c_pass_by_copy, MESSAGE_RESOURCE_DATA);
   --  winnt.h :3944
   pragma Convention (C, RTL_CRITICAL_SECTION);             --  winnt.h :3953
   pragma Convention (C, RTL_CRITICAL_SECTION_DEBUG);       --  winnt.h :3950
   pragma Convention (C, EVENTLOGRECORD);                   --  winnt.h :4021
   pragma Convention (c_pass_by_copy, TAPE_ERASE);          --  winnt.h :4256
   pragma Convention (c_pass_by_copy, TAPE_PREPARE);        --  winnt.h :4272
   pragma Convention (c_pass_by_copy, TAPE_WRITE_MARKS);    --  winnt.h :4286
   pragma Convention (c_pass_by_copy, TAPE_GET_POSITION);   --  winnt.h :4300
   pragma Convention (C, TAPE_SET_POSITION);                --  winnt.h :4321
   pragma Convention (C, TAPE_GET_DRIVE_PARAMETERS);        --  winnt.h :4410
   pragma Convention (c_pass_by_copy, TAPE_SET_DRIVE_PARAMETERS);
   --  winnt.h :4428
   pragma Convention (C, TAPE_GET_MEDIA_PARAMETERS);        --  winnt.h :4440
   pragma Convention (c_pass_by_copy, TAPE_SET_MEDIA_PARAMETERS);
   --  winnt.h :4452
   pragma Convention (c_pass_by_copy, TAPE_CREATE_PARTITION);
   --  winnt.h :4464

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



