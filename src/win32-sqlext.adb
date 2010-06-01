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

package body Win32.Sqlext is

   function SQL_LEN_DATA_AT_EXEC
     (length : Win32.Sql.SDWORD)
      return Win32.Sql.SDWORD
   is
      use type Win32.Sql.SDWORD;
   begin
      return SQL_LEN_DATA_AT_EXEC_OFFSET - length;
   end SQL_LEN_DATA_AT_EXEC;

end Win32.Sqlext;
