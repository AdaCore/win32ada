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

with Win32.Winbase;
with Win32.Winnt;

package Win32.Winperf is

   PERF_DATA_VERSION               : constant := 1;
   PERF_DATA_REVISION              : constant := 1;
   PERF_NO_INSTANCES               : constant := -1;
   PERF_SIZE_DWORD                 : constant := 16#0#;
   PERF_SIZE_LARGE                 : constant := 16#100#;
   PERF_SIZE_ZERO                  : constant := 16#200#;
   PERF_SIZE_VARIABLE_LEN          : constant := 16#300#;
   PERF_TYPE_NUMBER                : constant := 16#0#;
   PERF_TYPE_COUNTER               : constant := 16#400#;
   PERF_TYPE_TEXT                  : constant := 16#800#;
   PERF_TYPE_ZERO                  : constant := 16#c00#;
   PERF_NUMBER_HEX                 : constant := 16#0#;
   PERF_NUMBER_DECIMAL             : constant := 16#10000#;
   PERF_NUMBER_DEC_1000            : constant := 16#20000#;
   PERF_COUNTER_VALUE              : constant := 16#0#;
   PERF_COUNTER_RATE               : constant := 16#10000#;
   PERF_COUNTER_FRACTION           : constant := 16#20000#;
   PERF_COUNTER_BASE               : constant := 16#30000#;
   PERF_COUNTER_ELAPSED            : constant := 16#40000#;
   PERF_COUNTER_QUEUELEN           : constant := 16#50000#;
   PERF_COUNTER_HISTOGRAM          : constant := 16#60000#;
   PERF_TEXT_UNICODE               : constant := 16#0#;
   PERF_TEXT_ASCII                 : constant := 16#10000#;
   PERF_TIMER_TICK                 : constant := 16#0#;
   PERF_TIMER_100NS                : constant := 16#100000#;
   PERF_OBJECT_TIMER               : constant := 16#200000#;
   PERF_DELTA_COUNTER              : constant := 16#400000#;
   PERF_DELTA_BASE                 : constant := 16#800000#;
   PERF_INVERSE_COUNTER            : constant := 16#1000000#;
   PERF_MULTI_COUNTER              : constant := 16#2000000#;
   PERF_DISPLAY_NO_SUFFIX          : constant := 16#0#;
   PERF_DISPLAY_PER_SEC            : constant := 16#10000000#;
   PERF_DISPLAY_PERCENT            : constant := 16#20000000#;
   PERF_DISPLAY_SECONDS            : constant := 16#30000000#;
   PERF_DISPLAY_NOSHOW             : constant := 16#40000000#;
   PERF_COUNTER_COUNTER            : constant := 16#10410400#;
   PERF_COUNTER_TIMER              : constant := 16#20410500#;
   PERF_COUNTER_QUEUELEN_TYPE      : constant := 16#450400#;
   PERF_COUNTER_BULK_COUNT         : constant := 16#10410500#;
   PERF_COUNTER_TEXT               : constant := 16#b00#;
   PERF_COUNTER_RAWCOUNT           : constant := 16#10000#;
   PERF_COUNTER_LARGE_RAWCOUNT     : constant := 16#10100#;
   PERF_COUNTER_RAWCOUNT_HEX       : constant := 16#0#;
   PERF_COUNTER_LARGE_RAWCOUNT_HEX : constant := 16#100#;
   PERF_SAMPLE_FRACTION            : constant := 16#20c20400#;
   PERF_SAMPLE_COUNTER             : constant := 16#410400#;
   PERF_COUNTER_NODATA             : constant := 16#40000200#;
   PERF_COUNTER_TIMER_INV          : constant := 16#21410500#;
   PERF_SAMPLE_BASE                : constant := 16#40030401#;
   PERF_AVERAGE_TIMER              : constant := 16#30020400#;
   PERF_AVERAGE_BASE               : constant := 16#40030402#;
   PERF_AVERAGE_BULK               : constant := 16#40020500#;
   PERF_100NSEC_TIMER              : constant := 16#20510500#;
   PERF_100NSEC_TIMER_INV          : constant := 16#21510500#;
   PERF_COUNTER_MULTI_TIMER        : constant := 16#22410500#;
   PERF_COUNTER_MULTI_TIMER_INV    : constant := 16#23410500#;
   PERF_COUNTER_MULTI_BASE         : constant := 16#42030500#;
   PERF_100NSEC_MULTI_TIMER        : constant := 16#22510500#;
   PERF_100NSEC_MULTI_TIMER_INV    : constant := 16#23510500#;
   PERF_RAW_FRACTION               : constant := 16#20020400#;
   PERF_RAW_BASE                   : constant := 16#40030403#;
   PERF_ELAPSED_TIME               : constant := 16#30240500#;
   PERF_COUNTER_HISTOGRAM_TYPE     : constant := 16#80000000#;
   PERF_DETAIL_NOVICE              : constant := 100;
   PERF_DETAIL_ADVANCED            : constant := 200;
   PERF_DETAIL_EXPERT              : constant := 300;
   PERF_DETAIL_WIZARD              : constant := 400;
   PERF_NO_UNIQUE_ID               : constant := -1;

   type PERF_DATA_BLOCK;
   type PERF_OBJECT_TYPE;
   type PERF_COUNTER_DEFINITION;
   type PERF_INSTANCE_DEFINITION;
   type PERF_COUNTER_BLOCK;

   type PPERF_DATA_BLOCK is access all PERF_DATA_BLOCK;
   type PPERF_OBJECT_TYPE is access all PERF_OBJECT_TYPE;
   type PPERF_COUNTER_DEFINITION is access all PERF_COUNTER_DEFINITION;
   type PPERF_INSTANCE_DEFINITION is access all PERF_INSTANCE_DEFINITION;
   type PPERF_COUNTER_BLOCK is access all PERF_COUNTER_BLOCK;

   type PERF_DATA_BLOCK is record
      Signature        : Win32.WCHAR_Array (0 .. 3);
      LittleEndian     : Win32.DWORD;
      Version          : Win32.DWORD;
      Revision         : Win32.DWORD;
      TotalByteLength  : Win32.DWORD;
      HeaderLength     : Win32.DWORD;
      NumObjectTypes   : Win32.DWORD;
      DefaultObject    : Win32.LONG;
      SystemTime       : Win32.Winbase.SYSTEMTIME;
      PerfTime         : Win32.Winnt.LARGE_INTEGER;
      PerfFreq         : Win32.Winnt.LARGE_INTEGER;
      PerfTime100nSec  : Win32.Winnt.LARGE_INTEGER;
      SystemNameLength : Win32.DWORD;
      SystemNameOffset : Win32.DWORD;
   end record;

   type PERF_OBJECT_TYPE is record
      TotalByteLength      : Win32.DWORD;
      DefinitionLength     : Win32.DWORD;
      HeaderLength         : Win32.DWORD;
      ObjectNameTitleIndex : Win32.DWORD;
      ObjectNameTitle      : Win32.LPWSTR;
      ObjectHelpTitleIndex : Win32.DWORD;
      ObjectHelpTitle      : Win32.LPWSTR;
      DetailLevel          : Win32.DWORD;
      NumCounters          : Win32.DWORD;
      DefaultCounter       : Win32.LONG;
      NumInstances         : Win32.LONG;
      CodePage             : Win32.DWORD;
      PerfTime             : Win32.Winnt.LARGE_INTEGER;
      PerfFreq             : Win32.Winnt.LARGE_INTEGER;
   end record;

   type PERF_COUNTER_DEFINITION is record
      ByteLength            : Win32.DWORD;
      CounterNameTitleIndex : Win32.DWORD;
      CounterNameTitle      : Win32.LPWSTR;
      CounterHelpTitleIndex : Win32.DWORD;
      CounterHelpTitle      : Win32.LPWSTR;
      DefaultScale          : Win32.LONG;
      DetailLevel           : Win32.DWORD;
      CounterType           : Win32.DWORD;
      CounterSize           : Win32.DWORD;
      CounterOffset         : Win32.DWORD;
   end record;

   type PERF_INSTANCE_DEFINITION is record
      ByteLength             : Win32.DWORD;
      ParentObjectTitleIndex : Win32.DWORD;
      ParentObjectInstance   : Win32.DWORD;
      UniqueID               : Win32.LONG;
      NameOffset             : Win32.DWORD;
      NameLength             : Win32.DWORD;
   end record;

   type PERF_COUNTER_BLOCK is record
      ByteLength : Win32.DWORD;
   end record;

private

   pragma Convention (C, PERF_DATA_BLOCK);
   pragma Convention (C, PERF_OBJECT_TYPE);
   pragma Convention (C, PERF_COUNTER_DEFINITION);
   pragma Convention (C, PERF_INSTANCE_DEFINITION);
   pragma Convention (C_Pass_By_Copy, PERF_COUNTER_BLOCK);

end Win32.Winperf;
