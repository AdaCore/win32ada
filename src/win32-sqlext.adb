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





package body Win32.Sqlext is



   function SQL_LEN_DATA_AT_EXEC (length : Win32.Sql.SDWORD)

      return Win32.Sql.SDWORD is                          --  sqlext.h:122



      use type Win32.Sql.SDWORD;

   begin

      return SQL_LEN_DATA_AT_EXEC_OFFSET - length;

   end SQL_LEN_DATA_AT_EXEC;



   --  not in Microsoft OpenTools

   --  function SQL_POSITION_TO(hstmt  : Win32.Sql.HSTMT;

   --  irow   : Win32.Sql.UWORD)

   --  return Win32.Sql.RETCODE is -- sqlext.h:831

   --  begin

   --  return SQLSetPos(hstmt, irow, SQL_POSITION, SQL_LOCK_NO_CHANGE);

   --  end SQL_POSITION_TO;

   --

   --  function SQL_LOCK_RECORD(hstmt  : Win32.Sql.HSTMT;

   --  irow   : Win32.Sql.UWORD;

   --  fLock  : Win32.Sql.UWORD)

   --  return Win32.Sql.RETCODE is -- sqlext.h:832

   --  begin

   --  return SQLSetPos(hstmt, irow, SQL_POSITION, fLock);

   --  end SQL_LOCK_RECORD;

   --

   --  function SQL_REFRESH_RECORD(hstmt  : Win32.Sql.HSTMT;

   --  irow   : Win32.Sql.UWORD;

   --  fLock  : Win32.Sql.UWORD)

   --  return Win32.Sql.RETCODE is -- sqlext.h:833

   --  begin

   --  return SQLSetPos(hstmt, irow, SQL_REFRESH, fLock);

   --  end SQL_REFRESH_RECORD;

   --

   --  function SQL_UPDATE_RECORD(hstmt  : Win32.Sql.HSTMT;

   --  irow   : Win32.Sql.UWORD)

   --  return Win32.Sql.RETCODE is -- sqlext.h:834

   --  begin

   --  return SQLSetPos(hstmt, irow, SQL_UPDATE, SQL_LOCK_NO_CHANGE);

   --  end SQL_UPDATE_RECORD;

   --

   --  function SQL_DELETE_RECORD(hstmt  : Win32.Sql.HSTMT;

   --  irow   : Win32.Sql.UWORD)

   --  return Win32.Sql.RETCODE is -- sqlext.h:835

   --  begin

   --  return SQLSetPos(hstmt, irow, SQL_DELETE, SQL_LOCK_NO_CHANGE);

   --  end SQL_DELETE_RECORD;

   --

   --  function SQL_ADD_RECORD(hstmt  : Win32.Sql.HSTMT;

   --  irow   : Win32.Sql.UWORD)

   --  return Win32.Sql.RETCODE is -- sqlext.h:836

   --  begin

   --  return SQLSetPos(hstmt, irow, SQL_ADD, SQL_LOCK_NO_CHANGE);

   --  end SQL_ADD_RECORD;



end Win32.Sqlext;





