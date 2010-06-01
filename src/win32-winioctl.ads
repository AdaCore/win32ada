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

package Win32.Winioctl is

   FILE_DEVICE_BEEP                : constant := 16#1#;
   FILE_DEVICE_CD_ROM              : constant := 16#2#;
   FILE_DEVICE_CD_ROM_FILE_SYSTEM  : constant := 16#3#;
   FILE_DEVICE_CONTROLLER          : constant := 16#4#;
   FILE_DEVICE_DATALINK            : constant := 16#5#;
   FILE_DEVICE_DFS                 : constant := 16#6#;
   FILE_DEVICE_DISK                : constant := 16#7#;
   FILE_DEVICE_DISK_FILE_SYSTEM    : constant := 16#8#;
   FILE_DEVICE_FILE_SYSTEM         : constant := 16#9#;
   FILE_DEVICE_INPORT_PORT         : constant := 16#a#;
   FILE_DEVICE_KEYBOARD            : constant := 16#b#;
   FILE_DEVICE_MAILSLOT            : constant := 16#c#;
   FILE_DEVICE_MIDI_IN             : constant := 16#d#;
   FILE_DEVICE_MIDI_OUT            : constant := 16#e#;
   FILE_DEVICE_MOUSE               : constant := 16#f#;
   FILE_DEVICE_MULTI_UNC_PROVIDER  : constant := 16#10#;
   FILE_DEVICE_NAMED_PIPE          : constant := 16#11#;
   FILE_DEVICE_NETWORK             : constant := 16#12#;
   FILE_DEVICE_NETWORK_BROWSER     : constant := 16#13#;
   FILE_DEVICE_NETWORK_FILE_SYSTEM : constant := 16#14#;
   FILE_DEVICE_NULL                : constant := 16#15#;
   FILE_DEVICE_PARALLEL_PORT       : constant := 16#16#;
   FILE_DEVICE_PHYSICAL_NETCARD    : constant := 16#17#;
   FILE_DEVICE_PRINTER             : constant := 16#18#;
   FILE_DEVICE_SCANNER             : constant := 16#19#;
   FILE_DEVICE_SERIAL_MOUSE_PORT   : constant := 16#1a#;
   FILE_DEVICE_SERIAL_PORT         : constant := 16#1b#;
   FILE_DEVICE_SCREEN              : constant := 16#1c#;
   FILE_DEVICE_SOUND               : constant := 16#1d#;
   FILE_DEVICE_STREAMS             : constant := 16#1e#;
   FILE_DEVICE_TAPE                : constant := 16#1f#;
   FILE_DEVICE_TAPE_FILE_SYSTEM    : constant := 16#20#;
   FILE_DEVICE_TRANSPORT           : constant := 16#21#;
   FILE_DEVICE_UNKNOWN             : constant := 16#22#;
   FILE_DEVICE_VIDEO               : constant := 16#23#;
   FILE_DEVICE_VIRTUAL_DISK        : constant := 16#24#;
   FILE_DEVICE_WAVE_IN             : constant := 16#25#;
   FILE_DEVICE_WAVE_OUT            : constant := 16#26#;
   FILE_DEVICE_8042_PORT           : constant := 16#27#;
   FILE_DEVICE_NETWORK_REDIRECTOR  : constant := 16#28#;
   METHOD_BUFFERED                 : constant := 0;
   METHOD_IN_DIRECT                : constant := 1;
   METHOD_OUT_DIRECT               : constant := 2;
   METHOD_NEITHER                  : constant := 3;
   FILE_ANY_ACCESS                 : constant := 0;
   FILE_READ_ACCESS                : constant := 16#1#;
   FILE_WRITE_ACCESS               : constant := 16#2#;
   IOCTL_DISK_BASE                 : constant := 16#7#;
   IOCTL_DISK_GET_DRIVE_GEOMETRY   : constant := 16#70000#;
   IOCTL_DISK_GET_PARTITION_INFO   : constant := 16#74004#;
   IOCTL_DISK_SET_PARTITION_INFO   : constant := 16#7c008#;
   IOCTL_DISK_GET_DRIVE_LAYOUT     : constant := 16#7400c#;
   IOCTL_DISK_SET_DRIVE_LAYOUT     : constant := 16#7c010#;
   IOCTL_DISK_VERIFY               : constant := 16#70014#;
   IOCTL_DISK_FORMAT_TRACKS        : constant := 16#7c018#;
   IOCTL_DISK_REASSIGN_BLOCKS      : constant := 16#7c01c#;
   IOCTL_DISK_PERFORMANCE          : constant := 16#70020#;
   IOCTL_DISK_IS_WRITABLE          : constant := 16#70024#;
   IOCTL_DISK_LOGGING              : constant := 16#70028#;
   IOCTL_DISK_FORMAT_TRACKS_EX     : constant := 16#7c02c#;
   IOCTL_DISK_CHECK_VERIFY         : constant := 16#74800#;
   IOCTL_DISK_MEDIA_REMOVAL        : constant := 16#74804#;
   IOCTL_DISK_EJECT_MEDIA          : constant := 16#74808#;
   IOCTL_DISK_LOAD_MEDIA           : constant := 16#7480c#;
   IOCTL_DISK_RESERVE              : constant := 16#74810#;
   IOCTL_DISK_RELEASE              : constant := 16#74814#;
   IOCTL_DISK_FIND_NEW_DEVICES     : constant := 16#74818#;
   IOCTL_DISK_REMOVE_DEVICE        : constant := 16#7481c#;
   IOCTL_DISK_GET_MEDIA_TYPES      : constant := 16#70c00#;
   PARTITION_ENTRY_UNUSED          : constant := 16#0#;
   PARTITION_FAT_12                : constant := 16#1#;
   PARTITION_XENIX_1               : constant := 16#2#;
   PARTITION_XENIX_2               : constant := 16#3#;
   PARTITION_FAT_16                : constant := 16#4#;
   PARTITION_EXTENDED              : constant := 16#5#;
   PARTITION_HUGE                  : constant := 16#6#;
   PARTITION_IFS                   : constant := 16#7#;
   PARTITION_UNIX                  : constant := 16#63#;
   VALID_NTFT                      : constant := 16#c0#;
   PARTITION_NTFT                  : constant := 16#80#;
   DISK_LOGGING_START              : constant := 0;
   DISK_LOGGING_STOP               : constant := 1;
   DISK_LOGGING_DUMP               : constant := 2;
   DISK_BINNING                    : constant := 3;
   IOCTL_SERIAL_LSRMST_INSERT      : constant := 16#1b007c#;
   SERIAL_LSRMST_ESCAPE            : constant BYTE := 16#0#;
   SERIAL_LSRMST_LSR_DATA          : constant BYTE := 16#1#;
   SERIAL_LSRMST_LSR_NODATA        : constant BYTE := 16#2#;
   SERIAL_LSRMST_MST               : constant BYTE := 16#3#;
   FSCTL_LOCK_VOLUME               : constant := 16#90018#;
   FSCTL_UNLOCK_VOLUME             : constant := 16#9001c#;
   FSCTL_DISMOUNT_VOLUME           : constant := 16#90020#;
   FSCTL_MOUNT_DBLS_VOLUME         : constant := 16#90034#;
   FSCTL_GET_COMPRESSION           : constant := 16#9003c#;
   FSCTL_SET_COMPRESSION           : constant := 16#90040#;
   FSCTL_READ_COMPRESSION          : constant := 16#90047#;
   FSCTL_WRITE_COMPRESSION         : constant := 16#9004b#;

   subtype DEVICE_TYPE is Win32.DWORD;

   type MEDIA_TYPE is (
      Unknown,
      F5_1Pt2_512,
      F3_1Pt44_512,
      F3_2Pt88_512,
      F3_20Pt8_512,
      F3_720_512,
      F5_360_512,
      F5_320_512,
      F5_320_1024,
      F5_180_512,
      F5_160_512,
      RemovableMedia,
      FixedMedia);
   for MEDIA_TYPE'Size use 32;

   type BAD_TRACK_NUMBER is new Win32.WORD;

   type BIN_TYPES is (RequestSize, RequestLocation);
   for BIN_TYPES'Size use 32;

   type PBAD_TRACK_NUMBER is access all Win32.WORD;

   type FORMAT_PARAMETERS;
   type FORMAT_EX_PARAMETERS;
   type DISK_GEOMETRY;
   type PARTITION_INFORMATION;
   type SET_PARTITION_INFORMATION;
   type DRIVE_LAYOUT_INFORMATION;
   type VERIFY_INFORMATION;
   type REASSIGN_BLOCKS;
   type PREVENT_MEDIA_REMOVAL;
   type DISK_PERFORMANCE;
   type DISK_RECORD;
   type DISK_LOGGING;
   type BIN_RANGE;
   type PERF_BIN;
   type BIN_COUNT;
   type BIN_RESULTS;

   type PMEDIA_TYPE is access all MEDIA_TYPE;
   type PFORMAT_PARAMETERS is access all FORMAT_PARAMETERS;
   type PFORMAT_EX_PARAMETERS is access all FORMAT_EX_PARAMETERS;
   type PDISK_GEOMETRY is access all DISK_GEOMETRY;
   type PPARTITION_INFORMATION is access all PARTITION_INFORMATION;
   type PSET_PARTITION_INFORMATION is access all SET_PARTITION_INFORMATION;
   type PDRIVE_LAYOUT_INFORMATION is access all DRIVE_LAYOUT_INFORMATION;
   type PVERIFY_INFORMATION is access all VERIFY_INFORMATION;
   type PREASSIGN_BLOCKS is access all REASSIGN_BLOCKS;
   type PPREVENT_MEDIA_REMOVAL is access all PREVENT_MEDIA_REMOVAL;
   type PDISK_PERFORMANCE is access all DISK_PERFORMANCE;
   type PDISK_RECORD is access all DISK_RECORD;
   type PDISK_LOGGING is access all DISK_LOGGING;
   type PBIN_RANGE is access all BIN_RANGE;
   type PPERF_BIN is access all PERF_BIN;
   type PBIN_COUNT is access all BIN_COUNT;
   type PBIN_RESULTS is access all BIN_RESULTS;

   type FORMAT_PARAMETERS is record
      MediaType           : MEDIA_TYPE;
      StartCylinderNumber : Win32.DWORD;
      EndCylinderNumber   : Win32.DWORD;
      StartHeadNumber     : Win32.DWORD;
      EndHeadNumber       : Win32.DWORD;
   end record;

   type FORMAT_EX_PARAMETERS is record
      MediaType           : MEDIA_TYPE;
      StartCylinderNumber : Win32.DWORD;
      EndCylinderNumber   : Win32.DWORD;
      StartHeadNumber     : Win32.DWORD;
      EndHeadNumber       : Win32.DWORD;
      FormatGapLength     : Win32.WORD;
      SectorsPerTrack     : Win32.WORD;
      SectorNumber        : Win32.WORD_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type DISK_GEOMETRY is record
      Cylinders         : Win32.Winnt.LARGE_INTEGER;
      MediaType         : MEDIA_TYPE;
      TracksPerCylinder : Win32.DWORD;
      SectorsPerTrack   : Win32.DWORD;
      BytesPerSector    : Win32.DWORD;
   end record;

   type PARTITION_INFORMATION is record
      StartingOffset      : Win32.Winnt.LARGE_INTEGER;
      PartitionLength     : Win32.Winnt.LARGE_INTEGER;
      HiddenSectors       : Win32.DWORD;
      PartitionNumber     : Win32.DWORD;
      PartitionType       : Win32.BYTE;
      BootIndicator       : Win32.Winnt.BOOLEAN;
      RecognizedPartition : Win32.Winnt.BOOLEAN;
      RewritePartition    : Win32.Winnt.BOOLEAN;
   end record;

   type SET_PARTITION_INFORMATION is record
      PartitionType : Win32.BYTE;
   end record;

   type PARTITION_INFORMATION_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
            of aliased PARTITION_INFORMATION;

   type DRIVE_LAYOUT_INFORMATION is record
      PartitionCount : Win32.DWORD;
      Signature      : Win32.DWORD;
      PartitionEntry : PARTITION_INFORMATION_Array;
   end record;

   type VERIFY_INFORMATION is record
      StartingOffset : Win32.Winnt.LARGE_INTEGER;
      Length         : Win32.DWORD;
   end record;

   type REASSIGN_BLOCKS is record
      Reserved    : Win32.WORD;
      Count       : Win32.WORD;
      BlockNumber : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
   end record;

   type PREVENT_MEDIA_REMOVAL is record
      PreventMediaRemoval : Win32.Winnt.BOOLEAN;
   end record;

   type DISK_PERFORMANCE is record
      BytesRead    : Win32.Winnt.LARGE_INTEGER;
      BytesWritten : Win32.Winnt.LARGE_INTEGER;
      ReadTime     : Win32.Winnt.LARGE_INTEGER;
      WriteTime    : Win32.Winnt.LARGE_INTEGER;
      ReadCount    : Win32.DWORD;
      WriteCount   : Win32.DWORD;
      QueueDepth   : Win32.DWORD;
   end record;

   type DISK_RECORD is record
      ByteOffset     : Win32.Winnt.LARGE_INTEGER;
      StartTime      : Win32.Winnt.LARGE_INTEGER;
      EndTime        : Win32.Winnt.LARGE_INTEGER;
      VirtualAddress : Win32.PVOID;
      NumberOfBytes  : Win32.DWORD;
      DeviceNumber   : Win32.BYTE;
      ReadRequest    : Win32.Winnt.BOOLEAN;
   end record;

   type DISK_LOGGING is record
      C_Function    : Win32.BYTE;
      BufferAddress : Win32.PVOID;
      BufferSize    : Win32.DWORD;
   end record;

   type BIN_RANGE is record
      StartValue : Win32.Winnt.LARGE_INTEGER;
      Length     : Win32.Winnt.LARGE_INTEGER;
   end record;

   type BIN_RANGE_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased BIN_RANGE;

   type PERF_BIN is record
      NumberOfBins : Win32.DWORD;
      TypeOfBin    : Win32.DWORD;
      BinsRanges   : BIN_RANGE_Array;
   end record;

   type BIN_COUNT is record
      BinRange : BIN_RANGE;
      BinCount : Win32.DWORD;
   end record;

   type BIN_COUNT_Array is
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY) of aliased BIN_COUNT;

   type BIN_RESULTS is record
      NumberOfBins : Win32.DWORD;
      BinCounts    : BIN_COUNT_Array;
   end record;

   function CTL_CODE
     (DeviceType, Function_Name, Method, Access_Name : Win32.DWORD)
      return Win32.DWORD;

   function IsRecognizedPartition
     (PartitionType : Win32.DWORD)
      return Boolean;

private

   pragma Convention (C, FORMAT_PARAMETERS);
   pragma Convention (C, FORMAT_EX_PARAMETERS);
   pragma Convention (C, DISK_GEOMETRY);
   pragma Convention (C, PARTITION_INFORMATION);
   pragma Convention (C_Pass_By_Copy, SET_PARTITION_INFORMATION);
   pragma Convention (C, DRIVE_LAYOUT_INFORMATION);
   pragma Convention (C_Pass_By_Copy, VERIFY_INFORMATION);
   pragma Convention (C_Pass_By_Copy, REASSIGN_BLOCKS);
   pragma Convention (C_Pass_By_Copy, PREVENT_MEDIA_REMOVAL);
   pragma Convention (C, DISK_PERFORMANCE);
   pragma Convention (C, DISK_RECORD);
   pragma Convention (C_Pass_By_Copy, DISK_LOGGING);
   pragma Convention (C_Pass_By_Copy, BIN_RANGE);
   pragma Convention (C, PERF_BIN);
   pragma Convention (C, BIN_COUNT);
   pragma Convention (C, BIN_RESULTS);

   pragma Inline (CTL_CODE);
   pragma Inline (IsRecognizedPartition);

end Win32.Winioctl;
