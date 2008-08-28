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

with Interfaces.C;

package Win32.Sql is

   use type Interfaces.C.char_array;

   ODBCVER : constant := 16#201#;   --  sql.h:24
   SQL_SPEC_MAJOR : constant := 2;         --  sql.h:33
   SQL_SPEC_MINOR : constant := 1;         --  sql.h:34
   SQL_SPEC_STRING : constant CHAR_Array := "02.01" & Nul;
   --  sql.h:35
   SQL_SQLSTATE_SIZE          : constant := 5;    --  sql.h:37
   SQL_MAX_MESSAGE_LENGTH     : constant := 512;  --  sql.h:38
   SQL_MAX_DSN_LENGTH         : constant := 32;   --  sql.h:39
   SQL_INVALID_HANDLE         : constant := -2;   --  sql.h:42
   SQL_ERROR                  : constant := -1;   --  sql.h:43
   SQL_SUCCESS                : constant := 0;    --  sql.h:44
   SQL_SUCCESS_WITH_INFO      : constant := 1;    --  sql.h:45
   SQL_NO_DATA_FOUND          : constant := 100;  --  sql.h:46
   SQL_CHAR                   : constant := 1;    --  sql.h:49
   SQL_NUMERIC                : constant := 2;    --  sql.h:50
   SQL_DECIMAL                : constant := 3;    --  sql.h:51
   SQL_INTEGER                : constant := 4;    --  sql.h:52
   SQL_SMALLINT               : constant := 5;    --  sql.h:53
   SQL_FLOAT                  : constant := 6;    --  sql.h:54
   SQL_REAL                   : constant := 7;    --  sql.h:55
   SQL_DOUBLE                 : constant := 8;    --  sql.h:56
   SQL_VARCHAR                : constant := 12;   --  sql.h:57
   SQL_TYPE_MIN               : constant := 1;    --  sql.h:59
   SQL_TYPE_NULL              : constant := 0;    --  sql.h:60
   SQL_TYPE_MAX               : constant := 12;   --  sql.h:61
   SQL_C_CHAR                 : constant := 1;    --  sql.h:65
   SQL_C_LONG                 : constant := 4;    --  sql.h:66
   SQL_C_SHORT                : constant := 5;    --  sql.h:67
   SQL_C_FLOAT                : constant := 7;    --  sql.h:68
   SQL_C_DOUBLE               : constant := 8;    --  sql.h:69
   SQL_C_DEFAULT              : constant := 99;   --  sql.h:70
   SQL_NO_NULLS               : constant := 0;    --  sql.h:75
   SQL_NULLABLE               : constant := 1;    --  sql.h:76
   SQL_NULLABLE_UNKNOWN       : constant := 2;    --  sql.h:77
   SQL_NULL_DATA              : constant := -1;   --  sql.h:80
   SQL_DATA_AT_EXEC           : constant := -2;   --  sql.h:81
   SQL_NTS                    : constant := -3;   --  sql.h:82
   SQL_CLOSE                  : constant := 0;    --  sql.h:85
   SQL_DROP                   : constant := 1;    --  sql.h:86
   SQL_UNBIND                 : constant := 2;    --  sql.h:87
   SQL_RESET_PARAMS           : constant := 3;    --  sql.h:88
   SQL_COMMIT                 : constant := 0;    --  sql.h:91
   SQL_ROLLBACK               : constant := 1;    --  sql.h:92
   SQL_COLUMN_COUNT           : constant := 0;    --  sql.h:95
   SQL_COLUMN_NAME            : constant := 1;    --  sql.h:96
   SQL_COLUMN_TYPE            : constant := 2;    --  sql.h:97
   SQL_COLUMN_LENGTH          : constant := 3;    --  sql.h:98
   SQL_COLUMN_PRECISION       : constant := 4;    --  sql.h:99
   SQL_COLUMN_SCALE           : constant := 5;    --  sql.h:100
   SQL_COLUMN_DISPLAY_SIZE    : constant := 6;    --  sql.h:101
   SQL_COLUMN_NULLABLE        : constant := 7;    --  sql.h:102
   SQL_COLUMN_UNSIGNED        : constant := 8;    --  sql.h:103
   SQL_COLUMN_MONEY           : constant := 9;    --  sql.h:104
   SQL_COLUMN_UPDATABLE       : constant := 10;   --  sql.h:105
   SQL_COLUMN_AUTO_INCREMENT  : constant := 11;   --  sql.h:106
   SQL_COLUMN_CASE_SENSITIVE  : constant := 12;   --  sql.h:107
   SQL_COLUMN_SEARCHABLE      : constant := 13;   --  sql.h:108
   SQL_COLUMN_TYPE_NAME       : constant := 14;   --  sql.h:109
   SQL_COLUMN_TABLE_NAME      : constant := 15;   --  sql.h:111
   SQL_COLUMN_OWNER_NAME      : constant := 16;   --  sql.h:112
   SQL_COLUMN_QUALIFIER_NAME  : constant := 17;   --  sql.h:113
   SQL_COLUMN_LABEL           : constant := 18;   --  sql.h:114
   SQL_COLATT_OPT_MAX         : constant := 18;   --  sql.h:115
   SQL_COLUMN_DRIVER_START    : constant := 1000; --  sql.h:119
   SQL_COLATT_OPT_MIN         : constant := 0;    --  sql.h:121
   SQL_ATTR_READONLY          : constant := 0;    --  sql.h:124
   SQL_ATTR_WRITE             : constant := 1;    --  sql.h:125
   SQL_ATTR_READWRITE_UNKNOWN : constant := 2;    --  sql.h:126
   SQL_UNSEARCHABLE           : constant := 0;    --  sql.h:130
   SQL_LIKE_ONLY              : constant := 1;    --  sql.h:131
   SQL_ALL_EXCEPT_LIKE        : constant := 2;    --  sql.h:132
   SQL_SEARCHABLE             : constant := 3;    --  sql.h:133
   SQL_NULL_HENV              : constant := 0;    --  sql.h:136
   SQL_NULL_HDBC              : constant := 0;    --  sql.h:137
   SQL_NULL_HSTMT             : constant := 0;    --  sql.h:138

   type SCHAR is new Win32.CHAR;                           --  sql.h:154
   type SDWORD is new Win32.LONG;                          --  sql.h:155
   type SWORD is new Win32.SHORT;                          --  sql.h:156
   type UDWORD is new Win32.DWORD;                         --  sql.h:157
   type UWORD is new Win32.WORD;                           --  sql.h:158
   type SLONG is new Win32.LONG;                           --  sql.h:160
   type SSHORT is new Win32.SHORT;                         --  sql.h:161
   type SDOUBLE is new Interfaces.C.double;                --  sql.h:166
   type LDOUBLE is new Interfaces.C.double;                --  sql.h:168
   type SFLOAT is new Win32.FLOAT;                         --  sql.h:172
   type RETCODE is new Win32.SHORT;                        --  sql.h:180

   subtype PTR is Win32.PVOID;                            --  sql.h:174
   subtype HENV is Win32.PVOID;                           --  sql.h:176
   subtype HDBC is Win32.PVOID;                           --  sql.h:177
   subtype HSTMT is Win32.PVOID;                          --  sql.h:178

   function SQLAllocConnect (henv : Win32.Sql.HENV;
                             phdbc : access HDBC)
                            return RETCODE;         --  sql.h:185

   function SQLAllocEnv (phenv : access HENV) return RETCODE;
   --  sql.h:189

   function SQLAllocStmt (hdbc : Win32.Sql.HDBC;
                          phstmt : access HSTMT)
                         return RETCODE;           --  sql.h:192

   function SQLBindCol (hstmt : Win32.Sql.HSTMT;
                        icol : UWORD;
                        fCType : SWORD;
                        rgbValue : PTR;
                        cbValueMax : SDWORD;
                        pcbValue : access SDWORD)
                       return RETCODE;         --  sql.h:196

   function SQLCancel (hstmt : Win32.Sql.HSTMT) return RETCODE; --  sql.h:204

   function SQLColAttributes (hstmt : Win32.Sql.HSTMT;
                              icol : UWORD;
                              fDescType : UWORD;
                              rgbDesc : PTR;
                              cbDescMax : SWORD;
                              pcbDesc : access SWORD;
                              pfDesc : access SDWORD)
                             return RETCODE;    --  sql.h:207

   function SQLConnect (hdbc : Win32.Sql.HDBC;
                        szDSN : Win32.PUCHAR;
                        cbDSN : SWORD;
                        szUID : Win32.PUCHAR;
                        cbUID : SWORD;
                        szAuthStr : Win32.PUCHAR;
                        cbAuthStr : SWORD)
                       return RETCODE;          --  sql.h:216

   function SQLDescribeCol (hstmt : Win32.Sql.HSTMT;
                            icol : UWORD;
                            szColName : Win32.PUCHAR;
                            cbColNameMax : SWORD;
                            pcbColName : access SWORD;
                            pfSqlType : access SWORD;
                            pcbColDef : access SDWORD;
                            pibScale : access SWORD;
                            pfNullable : access SWORD)
                           return RETCODE;   --  sql.h:225

   function SQLDisconnect (hdbc : Win32.Sql.HDBC) return RETCODE; --  sql.h:236

   function SQLError (henv : Win32.Sql.HENV;
                      hdbc : Win32.Sql.HDBC;
                      hstmt : Win32.Sql.HSTMT;
                      szSqlState : Win32.PUCHAR;
                      pfNativeError : access SDWORD;
                      szErrorMsg : Win32.PUCHAR;
                      cbErrorMsgMax : SWORD;
                      pcbErrorMsg : access SWORD)
                     return RETCODE;        --  sql.h:239

   function SQLExecDirect (hstmt : Win32.Sql.HSTMT;
                           szSqlStr : Win32.PUCHAR;
                           cbSqlStr : SDWORD)
                          return RETCODE;        --  sql.h:249

   function SQLExecute (hstmt : Win32.Sql.HSTMT) return RETCODE;  --  sql.h:254

   function SQLFetch (hstmt : Win32.Sql.HSTMT) return RETCODE;    --  sql.h:257

   function SQLFreeConnect (hdbc : Win32.Sql.HDBC) return RETCODE;
   --  sql.h:260

   function SQLFreeEnv (henv : Win32.Sql.HENV) return RETCODE;    --  sql.h:263

   function SQLFreeStmt (hstmt : Win32.Sql.HSTMT;
                         fOption : UWORD)
                        return RETCODE;           --  sql.h:266

   function SQLGetCursorName (hstmt : Win32.Sql.HSTMT;
                              szCursor : Win32.PUCHAR;
                              cbCursorMax : SWORD;
                              pcbCursor : access SWORD)
                             return RETCODE;  --  sql.h:270

   function SQLNumResultCols (hstmt : Win32.Sql.HSTMT;
                              pccol : access SWORD)
                             return RETCODE;        --  sql.h:276

   function SQLPrepare (hstmt : Win32.Sql.HSTMT;
                        szSqlStr : Win32.PUCHAR;
                        cbSqlStr : SDWORD)
                       return RETCODE;           --  sql.h:280

   function SQLRowCount (hstmt : Win32.Sql.HSTMT;
                         pcrow : access SDWORD)
                        return RETCODE;             --  sql.h:285

   function SQLSetCursorName (hstmt : Win32.Sql.HSTMT;
                              szCursor : Win32.PUCHAR;
                              cbCursor : SWORD)
                             return RETCODE;     --  sql.h:289

   function SQLTransact (henv : Win32.Sql.HENV;
                         hdbc : Win32.Sql.HDBC;
                         fType : UWORD)
                        return RETCODE;             --  sql.h:294

   function SQLSetParam (hstmt : Win32.Sql.HSTMT;
                         ipar : UWORD;
                         fCType : SWORD;
                         fSqlType : SWORD;
                         cbColDef : UDWORD;
                         ibScale : SWORD;
                         rgbValue : PTR;
                         pcbValue : access SDWORD)
                        return RETCODE;          --  sql.h:304

private

   pragma Import (Stdcall, SQLAllocConnect, "SQLAllocConnect");   --  sql.h:185
   pragma Import (Stdcall, SQLAllocEnv, "SQLAllocEnv");           --  sql.h:189
   pragma Import (Stdcall, SQLAllocStmt, "SQLAllocStmt");         --  sql.h:192
   pragma Import (Stdcall, SQLBindCol, "SQLBindCol");             --  sql.h:196
   pragma Import (Stdcall, SQLCancel, "SQLCancel");               --  sql.h:204
   pragma Import (Stdcall, SQLColAttributes, "SQLColAttributes"); --  sql.h:207
   pragma Import (Stdcall, SQLConnect, "SQLConnect");             --  sql.h:216
   pragma Import (Stdcall, SQLDescribeCol, "SQLDescribeCol");     --  sql.h:225
   pragma Import (Stdcall, SQLDisconnect, "SQLDisconnect");       --  sql.h:236
   pragma Import (Stdcall, SQLError, "SQLError");                 --  sql.h:239
   pragma Import (Stdcall, SQLExecDirect, "SQLExecDirect");       --  sql.h:249
   pragma Import (Stdcall, SQLExecute, "SQLExecute");             --  sql.h:254
   pragma Import (Stdcall, SQLFetch, "SQLFetch");                 --  sql.h:257
   pragma Import (Stdcall, SQLFreeConnect, "SQLFreeConnect");     --  sql.h:260
   pragma Import (Stdcall, SQLFreeEnv, "SQLFreeEnv");             --  sql.h:263
   pragma Import (Stdcall, SQLFreeStmt, "SQLFreeStmt");           --  sql.h:266
   pragma Import (Stdcall, SQLGetCursorName, "SQLGetCursorName"); --  sql.h:270
   pragma Import (Stdcall, SQLNumResultCols, "SQLNumResultCols"); --  sql.h:276
   pragma Import (Stdcall, SQLPrepare, "SQLPrepare");             --  sql.h:280
   pragma Import (Stdcall, SQLRowCount, "SQLRowCount");           --  sql.h:285
   pragma Import (Stdcall, SQLSetCursorName, "SQLSetCursorName"); --  sql.h:289
   pragma Import (Stdcall, SQLTransact, "SQLTransact");           --  sql.h:294
   pragma Import (Stdcall, SQLSetParam, "SQLSetParam");           --  sql.h:304

end Win32.Sql;
