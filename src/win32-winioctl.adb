--  $Source$
--  $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------


package body Win32.Winioctl is

   function CTL_CODE (DeviceType,
                        Function_Name,
                        Method,
                        Access_Name : Win32.DWORD)
                     return Win32.DWORD is
      use Interfaces;
   begin
      return Win32.DWORD
        (Shift_Left (Unsigned_32 (DeviceType), 16) or
         Shift_Left (Unsigned_32 (Access_Name), 14) or
         Shift_Left (Unsigned_32 (Function_Name), 2) or
         Unsigned_32 (Method));
   end CTL_CODE;

   function IsRecognizedPartition (PartitionType : Win32.DWORD)
                                  return Boolean is

      use type Win32.DWORD;
      use type Interfaces.C.unsigned_long;
      Masked_Val : constant DWORD := (DWORD (PartitionType) and not 16#C0#);
   begin
      return
        Masked_Val = PARTITION_FAT_12 or
        Masked_Val = PARTITION_FAT_16 or
        Masked_Val = PARTITION_IFS    or
        Masked_Val = PARTITION_HUGE;
   end IsRecognizedPartition;

end Win32.Winioctl;


