--  $Source$
--  $Revision$ $Date$ $Author$
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

with Win32.Winnt;

package Win32.Winioctl is

   FILE_DEVICE_BEEP : constant := 16#1#;     --  winioctl.h:33
   FILE_DEVICE_CD_ROM : constant := 16#2#;     --  winioctl.h:34
   FILE_DEVICE_CD_ROM_FILE_SYSTEM : constant := 16#3#;     --  winioctl.h:35
   FILE_DEVICE_CONTROLLER : constant := 16#4#;     --  winioctl.h:36
   FILE_DEVICE_DATALINK : constant := 16#5#;     --  winioctl.h:37
   FILE_DEVICE_DFS : constant := 16#6#;     --  winioctl.h:38
   FILE_DEVICE_DISK : constant := 16#7#;     --  winioctl.h:39
   FILE_DEVICE_DISK_FILE_SYSTEM : constant := 16#8#;     --  winioctl.h:40
   FILE_DEVICE_FILE_SYSTEM : constant := 16#9#;     --  winioctl.h:41
   FILE_DEVICE_INPORT_PORT : constant := 16#a#;     --  winioctl.h:42
   FILE_DEVICE_KEYBOARD : constant := 16#b#;     --  winioctl.h:43
   FILE_DEVICE_MAILSLOT : constant := 16#c#;     --  winioctl.h:44
   FILE_DEVICE_MIDI_IN : constant := 16#d#;     --  winioctl.h:45
   FILE_DEVICE_MIDI_OUT : constant := 16#e#;     --  winioctl.h:46
   FILE_DEVICE_MOUSE : constant := 16#f#;     --  winioctl.h:47
   FILE_DEVICE_MULTI_UNC_PROVIDER : constant := 16#10#;    --  winioctl.h:48
   FILE_DEVICE_NAMED_PIPE : constant := 16#11#;    --  winioctl.h:49
   FILE_DEVICE_NETWORK : constant := 16#12#;    --  winioctl.h:50
   FILE_DEVICE_NETWORK_BROWSER : constant := 16#13#;    --  winioctl.h:51
   FILE_DEVICE_NETWORK_FILE_SYSTEM : constant := 16#14#;    --  winioctl.h:52
   FILE_DEVICE_NULL : constant := 16#15#;    --  winioctl.h:53
   FILE_DEVICE_PARALLEL_PORT : constant := 16#16#;    --  winioctl.h:54
   FILE_DEVICE_PHYSICAL_NETCARD : constant := 16#17#;    --  winioctl.h:55
   FILE_DEVICE_PRINTER : constant := 16#18#;    --  winioctl.h:56
   FILE_DEVICE_SCANNER : constant := 16#19#;    --  winioctl.h:57
   FILE_DEVICE_SERIAL_MOUSE_PORT : constant := 16#1a#;    --  winioctl.h:58
   FILE_DEVICE_SERIAL_PORT : constant := 16#1b#;    --  winioctl.h:59
   FILE_DEVICE_SCREEN : constant := 16#1c#;    --  winioctl.h:60
   FILE_DEVICE_SOUND : constant := 16#1d#;    --  winioctl.h:61
   FILE_DEVICE_STREAMS : constant := 16#1e#;    --  winioctl.h:62
   FILE_DEVICE_TAPE : constant := 16#1f#;    --  winioctl.h:63
   FILE_DEVICE_TAPE_FILE_SYSTEM : constant := 16#20#;    --  winioctl.h:64
   FILE_DEVICE_TRANSPORT : constant := 16#21#;    --  winioctl.h:65
   FILE_DEVICE_UNKNOWN : constant := 16#22#;    --  winioctl.h:66
   FILE_DEVICE_VIDEO : constant := 16#23#;    --  winioctl.h:67
   FILE_DEVICE_VIRTUAL_DISK : constant := 16#24#;    --  winioctl.h:68
   FILE_DEVICE_WAVE_IN : constant := 16#25#;    --  winioctl.h:69
   FILE_DEVICE_WAVE_OUT : constant := 16#26#;    --  winioctl.h:70
   FILE_DEVICE_8042_PORT : constant := 16#27#;    --  winioctl.h:71
   FILE_DEVICE_NETWORK_REDIRECTOR : constant := 16#28#;    --  winioctl.h:72
   METHOD_BUFFERED : constant := 0;         --  winioctl.h:88
   METHOD_IN_DIRECT : constant := 1;         --  winioctl.h:89
   METHOD_OUT_DIRECT : constant := 2;         --  winioctl.h:90
   METHOD_NEITHER : constant := 3;         --  winioctl.h:91
   FILE_ANY_ACCESS : constant := 0;         --  winioctl.h:103
   FILE_READ_ACCESS : constant := 16#1#;     --  winioctl.h:104
   FILE_WRITE_ACCESS : constant := 16#2#;     --  winioctl.h:105
   IOCTL_DISK_BASE : constant := 16#7#;     --  winioctl.h:116
   IOCTL_DISK_GET_DRIVE_GEOMETRY : constant := 16#70000#; --  winioctl.h:117
   IOCTL_DISK_GET_PARTITION_INFO : constant := 16#74004#; --  winioctl.h:118
   IOCTL_DISK_SET_PARTITION_INFO : constant := 16#7c008#; --  winioctl.h:119
   IOCTL_DISK_GET_DRIVE_LAYOUT : constant := 16#7400c#; --  winioctl.h:120
   IOCTL_DISK_SET_DRIVE_LAYOUT : constant := 16#7c010#; --  winioctl.h:121
   IOCTL_DISK_VERIFY : constant := 16#70014#; --  winioctl.h:122
   IOCTL_DISK_FORMAT_TRACKS : constant := 16#7c018#; --  winioctl.h:123
   IOCTL_DISK_REASSIGN_BLOCKS : constant := 16#7c01c#; --  winioctl.h:124
   IOCTL_DISK_PERFORMANCE : constant := 16#70020#; --  winioctl.h:125
   IOCTL_DISK_IS_WRITABLE : constant := 16#70024#; --  winioctl.h:126
   IOCTL_DISK_LOGGING : constant := 16#70028#; --  winioctl.h:127
   IOCTL_DISK_FORMAT_TRACKS_EX : constant := 16#7c02c#; --  winioctl.h:128
   IOCTL_DISK_CHECK_VERIFY : constant := 16#74800#; --  winioctl.h:135
   IOCTL_DISK_MEDIA_REMOVAL : constant := 16#74804#; --  winioctl.h:136
   IOCTL_DISK_EJECT_MEDIA : constant := 16#74808#; --  winioctl.h:137
   IOCTL_DISK_LOAD_MEDIA : constant := 16#7480c#; --  winioctl.h:138
   IOCTL_DISK_RESERVE : constant := 16#74810#; --  winioctl.h:139
   IOCTL_DISK_RELEASE : constant := 16#74814#; --  winioctl.h:140
   IOCTL_DISK_FIND_NEW_DEVICES : constant := 16#74818#; --  winioctl.h:141
   IOCTL_DISK_REMOVE_DEVICE : constant := 16#7481c#; --  winioctl.h:142
   IOCTL_DISK_GET_MEDIA_TYPES : constant := 16#70c00#; --  winioctl.h:144
   PARTITION_ENTRY_UNUSED : constant := 16#0#;     --  winioctl.h:150
   PARTITION_FAT_12 : constant := 16#1#;     --  winioctl.h:151
   PARTITION_XENIX_1 : constant := 16#2#;     --  winioctl.h:152
   PARTITION_XENIX_2 : constant := 16#3#;     --  winioctl.h:153
   PARTITION_FAT_16 : constant := 16#4#;     --  winioctl.h:154
   PARTITION_EXTENDED : constant := 16#5#;     --  winioctl.h:155
   PARTITION_HUGE : constant := 16#6#;     --  winioctl.h:156
   PARTITION_IFS : constant := 16#7#;     --  winioctl.h:157
   PARTITION_UNIX : constant := 16#63#;    --  winioctl.h:158
   VALID_NTFT : constant := 16#c0#;    --  winioctl.h:160
   PARTITION_NTFT : constant := 16#80#;    --  winioctl.h:201
   DISK_LOGGING_START : constant := 0;         --  winioctl.h:412
   DISK_LOGGING_STOP : constant := 1;         --  winioctl.h:418
   DISK_LOGGING_DUMP : constant := 2;         --  winioctl.h:425
   DISK_BINNING : constant := 3;         --  winioctl.h:436
   IOCTL_SERIAL_LSRMST_INSERT : constant := 16#1b007c#; --  winioctl.h:485
   SERIAL_LSRMST_ESCAPE : constant BYTE := 16#0#;
   --  winioctl.h:492
   SERIAL_LSRMST_LSR_DATA : constant BYTE := 16#1#;
   --  winioctl.h:499
   SERIAL_LSRMST_LSR_NODATA : constant BYTE := 16#2#;
   --  winioctl.h:505
   SERIAL_LSRMST_MST : constant BYTE := 16#3#;
   --  winioctl.h:511
   FSCTL_LOCK_VOLUME : constant := 16#90018#; --  winioctl.h:514
   FSCTL_UNLOCK_VOLUME : constant := 16#9001c#; --  winioctl.h:515
   FSCTL_DISMOUNT_VOLUME : constant := 16#90020#; --  winioctl.h:516
   FSCTL_MOUNT_DBLS_VOLUME : constant := 16#90034#; --  winioctl.h:517
   FSCTL_GET_COMPRESSION : constant := 16#9003c#; --  winioctl.h:518
   FSCTL_SET_COMPRESSION : constant := 16#90040#; --  winioctl.h:519
   FSCTL_READ_COMPRESSION : constant := 16#90047#; --  winioctl.h:520
   FSCTL_WRITE_COMPRESSION : constant := 16#9004b#; --  winioctl.h:521

   subtype DEVICE_TYPE is Win32.DWORD;                     --  winioctl.h:31

   type MEDIA_TYPE is
     ( --  winioctl.h:201
       Unknown,                                            --  winioctl.h:202
       F5_1Pt2_512,                                        --  winioctl.h:203
       F3_1Pt44_512,                                       --  winioctl.h:204
       F3_2Pt88_512,                                       --  winioctl.h:205
       F3_20Pt8_512,                                       --  winioctl.h:206
       F3_720_512,                                         --  winioctl.h:207
       F5_360_512,                                         --  winioctl.h:208
       F5_320_512,                                         --  winioctl.h:209
       F5_320_1024,                                        --  winioctl.h:210
       F5_180_512,                                         --  winioctl.h:211
       F5_160_512,                                         --  winioctl.h:212
       RemovableMedia,                                     --  winioctl.h:213
       FixedMedia                                          --  winioctl.h:215
       );
   for MEDIA_TYPE'Size use 32;                             --  winioctl.h:201

   type BAD_TRACK_NUMBER is new Win32.WORD;                --  winioctl.h:237

   type BIN_TYPES is
     ( --  winioctl.h:436
       RequestSize,                                        --  winioctl.h:437
       RequestLocation                                     --  winioctl.h:439
       );
   for BIN_TYPES'Size use 32;                              --  winioctl.h:436

   type PBAD_TRACK_NUMBER is access all Win32.WORD;        --  winioctl.h:238

   type FORMAT_PARAMETERS;                                 --  winioctl.h:222
   type FORMAT_EX_PARAMETERS;                              --  winioctl.h:245
   type DISK_GEOMETRY;                                     --  winioctl.h:262
   type PARTITION_INFORMATION;                             --  winioctl.h:276
   type SET_PARTITION_INFORMATION;                         --  winioctl.h:293
   type DRIVE_LAYOUT_INFORMATION;                          --  winioctl.h:302
   type VERIFY_INFORMATION;                                --  winioctl.h:313
   type REASSIGN_BLOCKS;                                   --  winioctl.h:323
   type PREVENT_MEDIA_REMOVAL;                             --  winioctl.h:339
   type DISK_PERFORMANCE;                                  --  winioctl.h:363
   type DISK_RECORD;                                       --  winioctl.h:379
   type DISK_LOGGING;                                      --  winioctl.h:394
   type BIN_RANGE;                                         --  winioctl.h:445
   type PERF_BIN;                                          --  winioctl.h:454
   type BIN_COUNT;                                         --  winioctl.h:464
   type BIN_RESULTS;                                       --  winioctl.h:473

   type PMEDIA_TYPE is access all MEDIA_TYPE;              --  winioctl.h:215
   type PFORMAT_PARAMETERS is access all FORMAT_PARAMETERS; --  winioctl.h:228
   type PFORMAT_EX_PARAMETERS is access all FORMAT_EX_PARAMETERS;
   --  winioctl.h:254
   type PDISK_GEOMETRY is access all DISK_GEOMETRY;        --  winioctl.h:268
   type PPARTITION_INFORMATION is access all PARTITION_INFORMATION;
   --  winioctl.h:285
   type PSET_PARTITION_INFORMATION is access all SET_PARTITION_INFORMATION;
   --  winioctl.h:295
   type PDRIVE_LAYOUT_INFORMATION is access all DRIVE_LAYOUT_INFORMATION;
   --  winioctl.h:306
   type PVERIFY_INFORMATION is access all VERIFY_INFORMATION;
   --  winioctl.h:316
   type PREASSIGN_BLOCKS is access all REASSIGN_BLOCKS;    --  winioctl.h:327
   type PPREVENT_MEDIA_REMOVAL is access all PREVENT_MEDIA_REMOVAL;
   --  winioctl.h:341
   type PDISK_PERFORMANCE is access all DISK_PERFORMANCE;  --  winioctl.h:371
   type PDISK_RECORD is access all DISK_RECORD;            --  winioctl.h:387
   type PDISK_LOGGING is access all DISK_LOGGING;          --  winioctl.h:398
   type PBIN_RANGE is access all BIN_RANGE;                --  winioctl.h:448
   type PPERF_BIN is access all PERF_BIN;                  --  winioctl.h:458
   type PBIN_COUNT is access all BIN_COUNT;                --  winioctl.h:467
   type PBIN_RESULTS is access all BIN_RESULTS;            --  winioctl.h:476

   type FORMAT_PARAMETERS is                               --  winioctl.h:222
      record
         MediaType : MEDIA_TYPE;                --  winioctl.h:223
         StartCylinderNumber : Win32.DWORD;               --  winioctl.h:224
         EndCylinderNumber : Win32.DWORD;               --  winioctl.h:225
         StartHeadNumber : Win32.DWORD;               --  winioctl.h:226
         EndHeadNumber : Win32.DWORD;               --  winioctl.h:227
      end record;

   type FORMAT_EX_PARAMETERS is                            --  winioctl.h:245
      record
         MediaType : MEDIA_TYPE;                --  winioctl.h:246
         StartCylinderNumber : Win32.DWORD;               --  winioctl.h:247
         EndCylinderNumber : Win32.DWORD;               --  winioctl.h:248
         StartHeadNumber : Win32.DWORD;               --  winioctl.h:249
         EndHeadNumber : Win32.DWORD;               --  winioctl.h:250
         FormatGapLength : Win32.WORD;                --  winioctl.h:251
         SectorsPerTrack : Win32.WORD;                --  winioctl.h:252
         SectorNumber : Win32.WORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winioctl.h:253
      end record;

   type DISK_GEOMETRY is                                   --  winioctl.h:262
      record
         Cylinders : Win32.Winnt.LARGE_INTEGER;   --  winioctl.h:263
         MediaType : MEDIA_TYPE;                  --  winioctl.h:264
         TracksPerCylinder : Win32.DWORD;                 --  winioctl.h:265
         SectorsPerTrack : Win32.DWORD;                 --  winioctl.h:266
         BytesPerSector : Win32.DWORD;                 --  winioctl.h:267
      end record;

   type PARTITION_INFORMATION is                           --  winioctl.h:276
      record
         StartingOffset : Win32.Winnt.LARGE_INTEGER; --  winioctl.h:277
         PartitionLength : Win32.Winnt.LARGE_INTEGER; --  winioctl.h:278
         HiddenSectors : Win32.DWORD;               --  winioctl.h:279
         PartitionNumber : Win32.DWORD;               --  winioctl.h:280
         PartitionType : Win32.BYTE;                --  winioctl.h:281
         BootIndicator : Win32.Winnt.BOOLEAN;       --  winioctl.h:282
         RecognizedPartition : Win32.Winnt.BOOLEAN;       --  winioctl.h:283
         RewritePartition : Win32.Winnt.BOOLEAN;       --  winioctl.h:284
      end record;

   type SET_PARTITION_INFORMATION is                       --  winioctl.h:293
      record
         PartitionType : Win32.BYTE;                      --  winioctl.h:294
      end record;

   type PARTITION_INFORMATION_Array is                     --  winioctl.h:305
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased PARTITION_INFORMATION;

   type DRIVE_LAYOUT_INFORMATION is                        --  winioctl.h:302
      record
         PartitionCount : Win32.DWORD;                    --  winioctl.h:303
         Signature : Win32.DWORD;                    --  winioctl.h:304
         PartitionEntry : PARTITION_INFORMATION_Array;    --  winioctl.h:305
      end record;

   type VERIFY_INFORMATION is                              --  winioctl.h:313
      record
         StartingOffset : Win32.Winnt.LARGE_INTEGER;      --  winioctl.h:314
         Length : Win32.DWORD;                    --  winioctl.h:315
      end record;

   type REASSIGN_BLOCKS is                                 --  winioctl.h:323
      record
         Reserved : Win32.WORD;                        --  winioctl.h:324
         Count : Win32.WORD;                        --  winioctl.h:325
         BlockNumber : Win32.DWORD_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  winioctl.h:326
      end record;

   type PREVENT_MEDIA_REMOVAL is                           --  winioctl.h:339
      record
         PreventMediaRemoval : Win32.Winnt.BOOLEAN;       --  winioctl.h:340
      end record;

   type DISK_PERFORMANCE is                                --  winioctl.h:363
      record
         BytesRead : Win32.Winnt.LARGE_INTEGER;        --  winioctl.h:364
         BytesWritten : Win32.Winnt.LARGE_INTEGER;        --  winioctl.h:365
         ReadTime : Win32.Winnt.LARGE_INTEGER;        --  winioctl.h:366
         WriteTime : Win32.Winnt.LARGE_INTEGER;        --  winioctl.h:367
         ReadCount : Win32.DWORD;                      --  winioctl.h:368
         WriteCount : Win32.DWORD;                      --  winioctl.h:369
         QueueDepth : Win32.DWORD;                      --  winioctl.h:370
      end record;

   type DISK_RECORD is                                     --  winioctl.h:379
      record
         ByteOffset : Win32.Winnt.LARGE_INTEGER;      --  winioctl.h:380
         StartTime : Win32.Winnt.LARGE_INTEGER;      --  winioctl.h:381
         EndTime : Win32.Winnt.LARGE_INTEGER;      --  winioctl.h:382
         VirtualAddress : Win32.PVOID;                    --  winioctl.h:383
         NumberOfBytes : Win32.DWORD;                    --  winioctl.h:384
         DeviceNumber : Win32.BYTE;                     --  winioctl.h:385
         ReadRequest : Win32.Winnt.BOOLEAN;            --  winioctl.h:386
      end record;

   type DISK_LOGGING is                                    --  winioctl.h:394
      record
         C_Function : Win32.BYTE;                      --  winioctl.h:395
         BufferAddress : Win32.PVOID;                     --  winioctl.h:396
         BufferSize : Win32.DWORD;                     --  winioctl.h:397
      end record;

   type BIN_RANGE is                                       --  winioctl.h:445
      record
         StartValue : Win32.Winnt.LARGE_INTEGER;          --  winioctl.h:446
         Length : Win32.Winnt.LARGE_INTEGER;          --  winioctl.h:447
      end record;

   type BIN_RANGE_Array is                                 --  winioctl.h:457
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased BIN_RANGE;

   type PERF_BIN is                                        --  winioctl.h:454
      record
         NumberOfBins : Win32.DWORD;                      --  winioctl.h:455
         TypeOfBin : Win32.DWORD;                      --  winioctl.h:456
         BinsRanges : BIN_RANGE_Array;                  --  winioctl.h:457
      end record;

   type BIN_COUNT is                                       --  winioctl.h:464
      record
         BinRange : BIN_RANGE;                            --  winioctl.h:465
         BinCount : Win32.DWORD;                          --  winioctl.h:466
      end record;

   type BIN_COUNT_Array is                                 --  winioctl.h:475
     array (Integer range 0 .. Win32.ANYSIZE_ARRAY)
     of aliased BIN_COUNT;

   type BIN_RESULTS is                                     --  winioctl.h:473
      record
         NumberOfBins : Win32.DWORD;                      --  winioctl.h:474
         BinCounts : BIN_COUNT_Array;                  --  winioctl.h:475
      end record;

   function CTL_CODE (DeviceType,                           --  winioctl.h:80
                       Function_Name,
                       Method,
                       Access_Name : Win32.DWORD)
                    return Win32.DWORD;

   function IsRecognizedPartition (PartitionType : Win32.DWORD)
      return Boolean;                                       --  winioctl.h:190

private

   pragma Convention (C, FORMAT_PARAMETERS);                --  winioctl.h:222
   pragma Convention (C, FORMAT_EX_PARAMETERS);             --  winioctl.h:245
   pragma Convention (C, DISK_GEOMETRY);                    --  winioctl.h:262
   pragma Convention (C, PARTITION_INFORMATION);            --  winioctl.h:276
   pragma Convention (C_Pass_By_Copy, SET_PARTITION_INFORMATION);
   --  winioctl.h:293
   pragma Convention (C, DRIVE_LAYOUT_INFORMATION);         --  winioctl.h:302
   pragma Convention (C_Pass_By_Copy, VERIFY_INFORMATION);
   --  winioctl.h:313
   pragma Convention (C_Pass_By_Copy, REASSIGN_BLOCKS);
   --  winioctl.h:323
   pragma Convention (C_Pass_By_Copy, PREVENT_MEDIA_REMOVAL);
   --  winioctl.h:339
   pragma Convention (C, DISK_PERFORMANCE);                 --  winioctl.h:363
   pragma Convention (C, DISK_RECORD);                      --  winioctl.h:379
   pragma Convention (C_Pass_By_Copy, DISK_LOGGING);        --  winioctl.h:394
   pragma Convention (C_Pass_By_Copy, BIN_RANGE);           --  winioctl.h:445
   pragma Convention (C, PERF_BIN);                         --  winioctl.h:454
   pragma Convention (C, BIN_COUNT);                        --  winioctl.h:464
   pragma Convention (C, BIN_RESULTS);                      --  winioctl.h:473

   pragma Inline (CTL_CODE);
   pragma Inline (IsRecognizedPartition);

end Win32.Winioctl;


