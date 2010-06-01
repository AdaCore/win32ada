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

with Interfaces.C;

package Win32.Sql is

   use type Interfaces.C.char_array;

   ODBCVER                    : constant := 16#201#;
   SQL_SPEC_MAJOR             : constant := 2;
   SQL_SPEC_MINOR             : constant := 1;
   SQL_SPEC_STRING            : constant CHAR_Array := "02.01" & Nul;
   SQL_SQLSTATE_SIZE          : constant := 5;
   SQL_MAX_MESSAGE_LENGTH     : constant := 512;
   SQL_MAX_DSN_LENGTH         : constant := 32;
   SQL_INVALID_HANDLE         : constant := -2;
   SQL_ERROR                  : constant := -1;
   SQL_SUCCESS                : constant := 0;
   SQL_SUCCESS_WITH_INFO      : constant := 1;
   SQL_NO_DATA_FOUND          : constant := 100;
   SQL_CHAR                   : constant := 1;
   SQL_NUMERIC                : constant := 2;
   SQL_DECIMAL                : constant := 3;
   SQL_INTEGER                : constant := 4;
   SQL_SMALLINT               : constant := 5;
   SQL_FLOAT                  : constant := 6;
   SQL_REAL                   : constant := 7;
   SQL_DOUBLE                 : constant := 8;
   SQL_VARCHAR                : constant := 12;
   SQL_TYPE_MIN               : constant := 1;
   SQL_TYPE_NULL              : constant := 0;
   SQL_TYPE_MAX               : constant := 12;
   SQL_C_CHAR                 : constant := 1;
   SQL_C_LONG                 : constant := 4;
   SQL_C_SHORT                : constant := 5;
   SQL_C_FLOAT                : constant := 7;
   SQL_C_DOUBLE               : constant := 8;
   SQL_C_DEFAULT              : constant := 99;
   SQL_NO_NULLS               : constant := 0;
   SQL_NULLABLE               : constant := 1;
   SQL_NULLABLE_UNKNOWN       : constant := 2;
   SQL_NULL_DATA              : constant := -1;
   SQL_DATA_AT_EXEC           : constant := -2;
   SQL_NTS                    : constant := -3;
   SQL_CLOSE                  : constant := 0;
   SQL_DROP                   : constant := 1;
   SQL_UNBIND                 : constant := 2;
   SQL_RESET_PARAMS           : constant := 3;
   SQL_COMMIT                 : constant := 0;
   SQL_ROLLBACK               : constant := 1;
   SQL_COLUMN_COUNT           : constant := 0;
   SQL_COLUMN_NAME            : constant := 1;
   SQL_COLUMN_TYPE            : constant := 2;
   SQL_COLUMN_LENGTH          : constant := 3;
   SQL_COLUMN_PRECISION       : constant := 4;
   SQL_COLUMN_SCALE           : constant := 5;
   SQL_COLUMN_DISPLAY_SIZE    : constant := 6;
   SQL_COLUMN_NULLABLE        : constant := 7;
   SQL_COLUMN_UNSIGNED        : constant := 8;
   SQL_COLUMN_MONEY           : constant := 9;
   SQL_COLUMN_UPDATABLE       : constant := 10;
   SQL_COLUMN_AUTO_INCREMENT  : constant := 11;
   SQL_COLUMN_CASE_SENSITIVE  : constant := 12;
   SQL_COLUMN_SEARCHABLE      : constant := 13;
   SQL_COLUMN_TYPE_NAME       : constant := 14;
   SQL_COLUMN_TABLE_NAME      : constant := 15;
   SQL_COLUMN_OWNER_NAME      : constant := 16;
   SQL_COLUMN_QUALIFIER_NAME  : constant := 17;
   SQL_COLUMN_LABEL           : constant := 18;
   SQL_COLATT_OPT_MAX         : constant := 18;
   SQL_COLUMN_DRIVER_START    : constant := 1000;
   SQL_COLATT_OPT_MIN         : constant := 0;
   SQL_ATTR_READONLY          : constant := 0;
   SQL_ATTR_WRITE             : constant := 1;
   SQL_ATTR_READWRITE_UNKNOWN : constant := 2;
   SQL_UNSEARCHABLE           : constant := 0;
   SQL_LIKE_ONLY              : constant := 1;
   SQL_ALL_EXCEPT_LIKE        : constant := 2;
   SQL_SEARCHABLE             : constant := 3;
   SQL_NULL_HENV              : constant := 0;
   SQL_NULL_HDBC              : constant := 0;
   SQL_NULL_HSTMT             : constant := 0;

   type SCHAR is new Win32.CHAR;
   type SDWORD is new Win32.LONG;
   type SWORD is new Win32.SHORT;
   type UDWORD is new Win32.DWORD;
   type UWORD is new Win32.WORD;
   type SLONG is new Win32.LONG;
   type SSHORT is new Win32.SHORT;
   type SDOUBLE is new Interfaces.C.double;
   type LDOUBLE is new Interfaces.C.double;
   type SFLOAT is new Win32.FLOAT;
   type RETCODE is new Win32.SHORT;

   subtype PTR is Win32.PVOID;
   subtype HENV is Win32.PVOID;
   subtype HDBC is Win32.PVOID;
   subtype HSTMT is Win32.PVOID;

   function SQLAllocConnect
     (henv  : Win32.Sql.HENV;
      phdbc : access HDBC)
      return RETCODE;

   function SQLAllocEnv (phenv : access HENV) return RETCODE;

   function SQLAllocStmt
     (hdbc   : Win32.Sql.HDBC;
      phstmt : access HSTMT)
      return RETCODE;

   function SQLBindCol
     (hstmt      : Win32.Sql.HSTMT;
      icol       : UWORD;
      fCType     : SWORD;
      rgbValue   : PTR;
      cbValueMax : SDWORD;
      pcbValue   : access SDWORD)
      return RETCODE;

   function SQLCancel (hstmt : Win32.Sql.HSTMT) return RETCODE;

   function SQLColAttributes
     (hstmt     : Win32.Sql.HSTMT;
      icol      : UWORD;
      fDescType : UWORD;
      rgbDesc   : PTR;
      cbDescMax : SWORD;
      pcbDesc   : access SWORD;
      pfDesc    : access SDWORD)
      return RETCODE;

   function SQLConnect
     (hdbc      : Win32.Sql.HDBC;
      szDSN     : Win32.PUCHAR;
      cbDSN     : SWORD;
      szUID     : Win32.PUCHAR;
      cbUID     : SWORD;
      szAuthStr : Win32.PUCHAR;
      cbAuthStr : SWORD)
      return RETCODE;

   function SQLDescribeCol
     (hstmt        : Win32.Sql.HSTMT;
      icol         : UWORD;
      szColName    : Win32.PUCHAR;
      cbColNameMax : SWORD;
      pcbColName   : access SWORD;
      pfSqlType    : access SWORD;
      pcbColDef    : access SDWORD;
      pibScale     : access SWORD;
      pfNullable   : access SWORD)
      return RETCODE;

   function SQLDisconnect (hdbc : Win32.Sql.HDBC) return RETCODE;

   function SQLError
     (henv          : Win32.Sql.HENV;
      hdbc          : Win32.Sql.HDBC;
      hstmt         : Win32.Sql.HSTMT;
      szSqlState    : Win32.PUCHAR;
      pfNativeError : access SDWORD;
      szErrorMsg    : Win32.PUCHAR;
      cbErrorMsgMax : SWORD;
      pcbErrorMsg   : access SWORD)
      return RETCODE;

   function SQLExecDirect
     (hstmt    : Win32.Sql.HSTMT;
      szSqlStr : Win32.PUCHAR;
      cbSqlStr : SDWORD)
      return RETCODE;

   function SQLExecute (hstmt : Win32.Sql.HSTMT) return RETCODE;

   function SQLFetch (hstmt : Win32.Sql.HSTMT) return RETCODE;

   function SQLFreeConnect (hdbc : Win32.Sql.HDBC) return RETCODE;

   function SQLFreeEnv (henv : Win32.Sql.HENV) return RETCODE;

   function SQLFreeStmt
     (hstmt   : Win32.Sql.HSTMT;
      fOption : UWORD)
      return RETCODE;

   function SQLGetCursorName
     (hstmt       : Win32.Sql.HSTMT;
      szCursor    : Win32.PUCHAR;
      cbCursorMax : SWORD;
      pcbCursor   : access SWORD)
      return RETCODE;

   function SQLNumResultCols
     (hstmt : Win32.Sql.HSTMT;
      pccol : access SWORD)
      return RETCODE;

   function SQLPrepare
     (hstmt    : Win32.Sql.HSTMT;
      szSqlStr : Win32.PUCHAR;
      cbSqlStr : SDWORD)
      return RETCODE;

   function SQLRowCount
     (hstmt : Win32.Sql.HSTMT;
      pcrow : access SDWORD)
      return RETCODE;

   function SQLSetCursorName
     (hstmt    : Win32.Sql.HSTMT;
      szCursor : Win32.PUCHAR;
      cbCursor : SWORD)
      return RETCODE;

   function SQLTransact
     (henv  : Win32.Sql.HENV;
      hdbc  : Win32.Sql.HDBC;
      fType : UWORD)
      return RETCODE;

   function SQLSetParam
     (hstmt    : Win32.Sql.HSTMT;
      ipar     : UWORD;
      fCType   : SWORD;
      fSqlType : SWORD;
      cbColDef : UDWORD;
      ibScale  : SWORD;
      rgbValue : PTR;
      pcbValue : access SDWORD)
      return RETCODE;

private

   pragma Import (Stdcall, SQLAllocConnect, "SQLAllocConnect");
   pragma Import (Stdcall, SQLAllocEnv, "SQLAllocEnv");
   pragma Import (Stdcall, SQLAllocStmt, "SQLAllocStmt");
   pragma Import (Stdcall, SQLBindCol, "SQLBindCol");
   pragma Import (Stdcall, SQLCancel, "SQLCancel");
   pragma Import (Stdcall, SQLColAttributes, "SQLColAttributes");
   pragma Import (Stdcall, SQLConnect, "SQLConnect");
   pragma Import (Stdcall, SQLDescribeCol, "SQLDescribeCol");
   pragma Import (Stdcall, SQLDisconnect, "SQLDisconnect");
   pragma Import (Stdcall, SQLError, "SQLError");
   pragma Import (Stdcall, SQLExecDirect, "SQLExecDirect");
   pragma Import (Stdcall, SQLExecute, "SQLExecute");
   pragma Import (Stdcall, SQLFetch, "SQLFetch");
   pragma Import (Stdcall, SQLFreeConnect, "SQLFreeConnect");
   pragma Import (Stdcall, SQLFreeEnv, "SQLFreeEnv");
   pragma Import (Stdcall, SQLFreeStmt, "SQLFreeStmt");
   pragma Import (Stdcall, SQLGetCursorName, "SQLGetCursorName");
   pragma Import (Stdcall, SQLNumResultCols, "SQLNumResultCols");
   pragma Import (Stdcall, SQLPrepare, "SQLPrepare");
   pragma Import (Stdcall, SQLRowCount, "SQLRowCount");
   pragma Import (Stdcall, SQLSetCursorName, "SQLSetCursorName");
   pragma Import (Stdcall, SQLTransact, "SQLTransact");
   pragma Import (Stdcall, SQLSetParam, "SQLSetParam");

end Win32.Sql;
