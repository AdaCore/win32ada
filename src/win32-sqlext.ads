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

with Win32.Sql;
with Win32.Windef;

package Win32.Sqlext is

   use type Interfaces.C.char_array;

   SQL_MAX_OPTION_STRING_LENGTH    : constant := 256;
   SQL_STILL_EXECUTING             : constant := 2;
   SQL_NEED_DATA                   : constant := 99;
   SQL_DATE                        : constant := 9;
   SQL_TIME                        : constant := 10;
   SQL_TIMESTAMP                   : constant := 11;
   SQL_LONGVARCHAR                 : constant := -1;
   SQL_BINARY                      : constant := -2;
   SQL_VARBINARY                   : constant := -3;
   SQL_LONGVARBINARY               : constant := -4;
   SQL_BIGINT                      : constant := -5;
   SQL_TINYINT                     : constant := -6;
   SQL_BIT                         : constant := -7;
   SQL_TYPE_DRIVER_START           : constant := -80;
   SQL_SIGNED_OFFSET               : constant := -20;
   SQL_UNSIGNED_OFFSET             : constant := -22;
   SQL_C_DATE                      : constant := 9;
   SQL_C_TIME                      : constant := 10;
   SQL_C_TIMESTAMP                 : constant := 11;
   SQL_C_BINARY                    : constant := -2;
   SQL_C_BIT                       : constant := -7;
   SQL_C_TINYINT                   : constant := -6;
   SQL_C_SLONG                     : constant := -16;
   SQL_C_SSHORT                    : constant := -15;
   SQL_C_STINYINT                  : constant := -26;
   SQL_C_ULONG                     : constant := -18;
   SQL_C_USHORT                    : constant := -17;
   SQL_C_UTINYINT                  : constant := -28;
   SQL_C_BOOKMARK                  : constant := -18;
   SQL_TYPE_MIN                    : constant := -7;
   SQL_ALL_TYPES                   : constant := 0;
   SQL_DRIVER_NOPROMPT             : constant := 0;
   SQL_DRIVER_COMPLETE             : constant := 1;
   SQL_DRIVER_PROMPT               : constant := 2;
   SQL_DRIVER_COMPLETE_REQUIRED    : constant := 3;
   SQL_NO_TOTAL                    : constant := -4;
   SQL_DEFAULT_PARAM               : constant := -5;
   SQL_IGNORE                      : constant := -6;
   SQL_LEN_DATA_AT_EXEC_OFFSET     : constant := -100;
   SQL_API_SQLALLOCCONNECT         : constant := 1;
   SQL_API_SQLALLOCENV             : constant := 2;
   SQL_API_SQLALLOCSTMT            : constant := 3;
   SQL_API_SQLBINDCOL              : constant := 4;
   SQL_API_SQLCANCEL               : constant := 5;
   SQL_API_SQLCOLATTRIBUTES        : constant := 6;
   SQL_API_SQLCONNECT              : constant := 7;
   SQL_API_SQLDESCRIBECOL          : constant := 8;
   SQL_API_SQLDISCONNECT           : constant := 9;
   SQL_API_SQLERROR                : constant := 10;
   SQL_API_SQLEXECDIRECT           : constant := 11;
   SQL_API_SQLEXECUTE              : constant := 12;
   SQL_API_SQLFETCH                : constant := 13;
   SQL_API_SQLFREECONNECT          : constant := 14;
   SQL_API_SQLFREEENV              : constant := 15;
   SQL_API_SQLFREESTMT             : constant := 16;
   SQL_API_SQLGETCURSORNAME        : constant := 17;
   SQL_API_SQLNUMRESULTCOLS        : constant := 18;
   SQL_API_SQLPREPARE              : constant := 19;
   SQL_API_SQLROWCOUNT             : constant := 20;
   SQL_API_SQLSETCURSORNAME        : constant := 21;
   SQL_API_SQLSETPARAM             : constant := 22;
   SQL_API_SQLTRANSACT             : constant := 23;
   SQL_NUM_FUNCTIONS               : constant := 23;
   SQL_EXT_API_START               : constant := 40;
   SQL_API_SQLCOLUMNS              : constant := 40;
   SQL_API_SQLDRIVERCONNECT        : constant := 41;
   SQL_API_SQLGETCONNECTOPTION     : constant := 42;
   SQL_API_SQLGETDATA              : constant := 43;
   SQL_API_SQLGETFUNCTIONS         : constant := 44;
   SQL_API_SQLGETINFO              : constant := 45;
   SQL_API_SQLGETSTMTOPTION        : constant := 46;
   SQL_API_SQLGETTYPEINFO          : constant := 47;
   SQL_API_SQLPARAMDATA            : constant := 48;
   SQL_API_SQLPUTDATA              : constant := 49;
   SQL_API_SQLSETCONNECTOPTION     : constant := 50;
   SQL_API_SQLSETSTMTOPTION        : constant := 51;
   SQL_API_SQLSPECIALCOLUMNS       : constant := 52;
   SQL_API_SQLSTATISTICS           : constant := 53;
   SQL_API_SQLTABLES               : constant := 54;
   SQL_API_SQLBROWSECONNECT        : constant := 55;
   SQL_API_SQLCOLUMNPRIVILEGES     : constant := 56;
   SQL_API_SQLDATASOURCES          : constant := 57;
   SQL_API_SQLDESCRIBEPARAM        : constant := 58;
   SQL_API_SQLEXTENDEDFETCH        : constant := 59;
   SQL_API_SQLFOREIGNKEYS          : constant := 60;
   SQL_API_SQLMORERESULTS          : constant := 61;
   SQL_API_SQLNATIVESQL            : constant := 62;
   SQL_API_SQLNUMPARAMS            : constant := 63;
   SQL_API_SQLPARAMOPTIONS         : constant := 64;
   SQL_API_SQLPRIMARYKEYS          : constant := 65;
   SQL_API_SQLPROCEDURECOLUMNS     : constant := 66;
   SQL_API_SQLPROCEDURES           : constant := 67;
   SQL_API_SQLSETPOS               : constant := 68;
   SQL_API_SQLSETSCROLLOPTIONS     : constant := 69;
   SQL_API_SQLTABLEPRIVILEGES      : constant := 70;
   SQL_API_SQLDRIVERS              : constant := 71;
   SQL_API_SQLBINDPARAMETER        : constant := 72;
   SQL_EXT_API_LAST                : constant := 72;
   SQL_API_ALL_FUNCTIONS           : constant := 0;
   SQL_NUM_EXTENSIONS              : constant := 33;
   SQL_API_LOADBYORDINAL           : constant := 199;
   SQL_INFO_FIRST                  : constant := 0;
   SQL_ACTIVE_CONNECTIONS          : constant := 0;
   SQL_ACTIVE_STATEMENTS           : constant := 1;
   SQL_DATA_SOURCE_NAME            : constant := 2;
   SQL_DRIVER_HDBC                 : constant := 3;
   SQL_DRIVER_HENV                 : constant := 4;
   SQL_DRIVER_HSTMT                : constant := 5;
   SQL_DRIVER_NAME                 : constant := 6;
   SQL_DRIVER_VER                  : constant := 7;
   SQL_FETCH_DIRECTION             : constant := 8;
   SQL_ODBC_API_CONFORMANCE        : constant := 9;
   SQL_ODBC_VER                    : constant := 10;
   SQL_ROW_UPDATES                 : constant := 11;
   SQL_ODBC_SAG_CLI_CONFORMANCE    : constant := 12;
   SQL_SERVER_NAME                 : constant := 13;
   SQL_SEARCH_PATTERN_ESCAPE       : constant := 14;
   SQL_ODBC_SQL_CONFORMANCE        : constant := 15;
   SQL_DBMS_NAME                   : constant := 17;
   SQL_DBMS_VER                    : constant := 18;
   SQL_ACCESSIBLE_TABLES           : constant := 19;
   SQL_ACCESSIBLE_PROCEDURES       : constant := 20;
   SQL_PROCEDURES                  : constant := 21;
   SQL_CONCAT_NULL_BEHAVIOR        : constant := 22;
   SQL_CURSOR_COMMIT_BEHAVIOR      : constant := 23;
   SQL_CURSOR_ROLLBACK_BEHAVIOR    : constant := 24;
   SQL_DATA_SOURCE_READ_ONLY       : constant := 25;
   SQL_DEFAULT_TXN_ISOLATION       : constant := 26;
   SQL_EXPRESSIONS_IN_ORDERBY      : constant := 27;
   SQL_IDENTIFIER_CASE             : constant := 28;
   SQL_IDENTIFIER_QUOTE_CHAR       : constant := 29;
   SQL_MAX_COLUMN_NAME_LEN         : constant := 30;
   SQL_MAX_CURSOR_NAME_LEN         : constant := 31;
   SQL_MAX_OWNER_NAME_LEN          : constant := 32;
   SQL_MAX_PROCEDURE_NAME_LEN      : constant := 33;
   SQL_MAX_QUALIFIER_NAME_LEN      : constant := 34;
   SQL_MAX_TABLE_NAME_LEN          : constant := 35;
   SQL_MULT_RESULT_SETS            : constant := 36;
   SQL_MULTIPLE_ACTIVE_TXN         : constant := 37;
   SQL_OUTER_JOINS                 : constant := 38;
   SQL_OWNER_TERM                  : constant := 39;
   SQL_PROCEDURE_TERM              : constant := 40;
   SQL_QUALIFIER_NAME_SEPARATOR    : constant := 41;
   SQL_QUALIFIER_TERM              : constant := 42;
   SQL_SCROLL_CONCURRENCY          : constant := 43;
   SQL_SCROLL_OPTIONS              : constant := 44;
   SQL_TABLE_TERM                  : constant := 45;
   SQL_TXN_CAPABLE                 : constant := 46;
   SQL_USER_NAME                   : constant := 47;
   SQL_CONVERT_FUNCTIONS           : constant := 48;
   SQL_NUMERIC_FUNCTIONS           : constant := 49;
   SQL_STRING_FUNCTIONS            : constant := 50;
   SQL_SYSTEM_FUNCTIONS            : constant := 51;
   SQL_TIMEDATE_FUNCTIONS          : constant := 52;
   SQL_CONVERT_BIGINT              : constant := 53;
   SQL_CONVERT_BINARY              : constant := 54;
   SQL_CONVERT_BIT                 : constant := 55;
   SQL_CONVERT_CHAR                : constant := 56;
   SQL_CONVERT_DATE                : constant := 57;
   SQL_CONVERT_DECIMAL             : constant := 58;
   SQL_CONVERT_DOUBLE              : constant := 59;
   SQL_CONVERT_FLOAT               : constant := 60;
   SQL_CONVERT_INTEGER             : constant := 61;
   SQL_CONVERT_LONGVARCHAR         : constant := 62;
   SQL_CONVERT_NUMERIC             : constant := 63;
   SQL_CONVERT_REAL                : constant := 64;
   SQL_CONVERT_SMALLINT            : constant := 65;
   SQL_CONVERT_TIME                : constant := 66;
   SQL_CONVERT_TIMESTAMP           : constant := 67;
   SQL_CONVERT_TINYINT             : constant := 68;
   SQL_CONVERT_VARBINARY           : constant := 69;
   SQL_CONVERT_VARCHAR             : constant := 70;
   SQL_CONVERT_LONGVARBINARY       : constant := 71;
   SQL_TXN_ISOLATION_OPTION        : constant := 72;
   SQL_ODBC_SQL_OPT_IEF            : constant := 73;
   SQL_CORRELATION_NAME            : constant := 74;
   SQL_NON_NULLABLE_COLUMNS        : constant := 75;
   SQL_DRIVER_HLIB                 : constant := 76;
   SQL_DRIVER_ODBC_VER             : constant := 77;
   SQL_LOCK_TYPES                  : constant := 78;
   SQL_POS_OPERATIONS              : constant := 79;
   SQL_POSITIONED_STATEMENTS       : constant := 80;
   SQL_GETDATA_EXTENSIONS          : constant := 81;
   SQL_BOOKMARK_PERSISTENCE        : constant := 82;
   SQL_STATIC_SENSITIVITY          : constant := 83;
   SQL_FILE_USAGE                  : constant := 84;
   SQL_NULL_COLLATION              : constant := 85;
   SQL_ALTER_TABLE                 : constant := 86;
   SQL_COLUMN_ALIAS                : constant := 87;
   SQL_GROUP_BY                    : constant := 88;
   SQL_KEYWORDS                    : constant := 89;
   SQL_ORDER_BY_COLUMNS_IN_SELECT  : constant := 90;
   SQL_OWNER_USAGE                 : constant := 91;
   SQL_QUALIFIER_USAGE             : constant := 92;
   SQL_QUOTED_IDENTIFIER_CASE      : constant := 93;
   SQL_SPECIAL_CHARACTERS          : constant := 94;
   SQL_SUBQUERIES                  : constant := 95;
   SQL_UNION                       : constant := 96;
   SQL_MAX_COLUMNS_IN_GROUP_BY     : constant := 97;
   SQL_MAX_COLUMNS_IN_INDEX        : constant := 98;
   SQL_MAX_COLUMNS_IN_ORDER_BY     : constant := 99;
   SQL_MAX_COLUMNS_IN_SELECT       : constant := 100;
   SQL_MAX_COLUMNS_IN_TABLE        : constant := 101;
   SQL_MAX_INDEX_SIZE              : constant := 102;
   SQL_MAX_ROW_SIZE_INCLUDES_LONG  : constant := 103;
   SQL_MAX_ROW_SIZE                : constant := 104;
   SQL_MAX_STATEMENT_LEN           : constant := 105;
   SQL_MAX_TABLES_IN_SELECT        : constant := 106;
   SQL_MAX_USER_NAME_LEN           : constant := 107;
   SQL_MAX_CHAR_LITERAL_LEN        : constant := 108;
   SQL_TIMEDATE_ADD_INTERVALS      : constant := 109;
   SQL_TIMEDATE_DIFF_INTERVALS     : constant := 110;
   SQL_NEED_LONG_DATA_LEN          : constant := 111;
   SQL_MAX_BINARY_LITERAL_LEN      : constant := 112;
   SQL_LIKE_ESCAPE_CLAUSE          : constant := 113;
   SQL_QUALIFIER_LOCATION          : constant := 114;
   SQL_OJ_CAPABILITIES             : constant := 65002;
   SQL_INFO_LAST                   : constant := 114;
   SQL_INFO_DRIVER_START           : constant := 1000;
   SQL_CVT_CHAR                    : constant := 16#1#;
   SQL_CVT_NUMERIC                 : constant := 16#2#;
   SQL_CVT_DECIMAL                 : constant := 16#4#;
   SQL_CVT_INTEGER                 : constant := 16#8#;
   SQL_CVT_SMALLINT                : constant := 16#10#;
   SQL_CVT_FLOAT                   : constant := 16#20#;
   SQL_CVT_REAL                    : constant := 16#40#;
   SQL_CVT_DOUBLE                  : constant := 16#80#;
   SQL_CVT_VARCHAR                 : constant := 16#100#;
   SQL_CVT_LONGVARCHAR             : constant := 16#200#;
   SQL_CVT_BINARY                  : constant := 16#400#;
   SQL_CVT_VARBINARY               : constant := 16#800#;
   SQL_CVT_BIT                     : constant := 16#1000#;
   SQL_CVT_TINYINT                 : constant := 16#2000#;
   SQL_CVT_BIGINT                  : constant := 16#4000#;
   SQL_CVT_DATE                    : constant := 16#8000#;
   SQL_CVT_TIME                    : constant := 16#10000#;
   SQL_CVT_TIMESTAMP               : constant := 16#20000#;
   SQL_CVT_LONGVARBINARY           : constant := 16#40000#;
   SQL_FN_CVT_CONVERT              : constant := 16#1#;
   SQL_FN_STR_CONCAT               : constant := 16#1#;
   SQL_FN_STR_INSERT               : constant := 16#2#;
   SQL_FN_STR_LEFT                 : constant := 16#4#;
   SQL_FN_STR_LTRIM                : constant := 16#8#;
   SQL_FN_STR_LENGTH               : constant := 16#10#;
   SQL_FN_STR_LOCATE               : constant := 16#20#;
   SQL_FN_STR_LCASE                : constant := 16#40#;
   SQL_FN_STR_REPEAT               : constant := 16#80#;
   SQL_FN_STR_REPLACE              : constant := 16#100#;
   SQL_FN_STR_RIGHT                : constant := 16#200#;
   SQL_FN_STR_RTRIM                : constant := 16#400#;
   SQL_FN_STR_SUBSTRING            : constant := 16#800#;
   SQL_FN_STR_UCASE                : constant := 16#1000#;
   SQL_FN_STR_ASCII                : constant := 16#2000#;
   SQL_FN_STR_CHAR                 : constant := 16#4000#;
   SQL_FN_STR_DIFFERENCE           : constant := 16#8000#;
   SQL_FN_STR_LOCATE_2             : constant := 16#10000#;
   SQL_FN_STR_SOUNDEX              : constant := 16#20000#;
   SQL_FN_STR_SPACE                : constant := 16#40000#;
   SQL_FN_NUM_ABS                  : constant := 16#1#;
   SQL_FN_NUM_ACOS                 : constant := 16#2#;
   SQL_FN_NUM_ASIN                 : constant := 16#4#;
   SQL_FN_NUM_ATAN                 : constant := 16#8#;
   SQL_FN_NUM_ATAN2                : constant := 16#10#;
   SQL_FN_NUM_CEILING              : constant := 16#20#;
   SQL_FN_NUM_COS                  : constant := 16#40#;
   SQL_FN_NUM_COT                  : constant := 16#80#;
   SQL_FN_NUM_EXP                  : constant := 16#100#;
   SQL_FN_NUM_FLOOR                : constant := 16#200#;
   SQL_FN_NUM_LOG                  : constant := 16#400#;
   SQL_FN_NUM_MOD                  : constant := 16#800#;
   SQL_FN_NUM_SIGN                 : constant := 16#1000#;
   SQL_FN_NUM_SIN                  : constant := 16#2000#;
   SQL_FN_NUM_SQRT                 : constant := 16#4000#;
   SQL_FN_NUM_TAN                  : constant := 16#8000#;
   SQL_FN_NUM_PI                   : constant := 16#10000#;
   SQL_FN_NUM_RAND                 : constant := 16#20000#;
   SQL_FN_NUM_DEGREES              : constant := 16#40000#;
   SQL_FN_NUM_LOG10                : constant := 16#80000#;
   SQL_FN_NUM_POWER                : constant := 16#100000#;
   SQL_FN_NUM_RADIANS              : constant := 16#200000#;
   SQL_FN_NUM_ROUND                : constant := 16#400000#;
   SQL_FN_NUM_TRUNCATE             : constant := 16#800000#;
   SQL_FN_TD_NOW                   : constant := 16#1#;
   SQL_FN_TD_CURDATE               : constant := 16#2#;
   SQL_FN_TD_DAYOFMONTH            : constant := 16#4#;
   SQL_FN_TD_DAYOFWEEK             : constant := 16#8#;
   SQL_FN_TD_DAYOFYEAR             : constant := 16#10#;
   SQL_FN_TD_MONTH                 : constant := 16#20#;
   SQL_FN_TD_QUARTER               : constant := 16#40#;
   SQL_FN_TD_WEEK                  : constant := 16#80#;
   SQL_FN_TD_YEAR                  : constant := 16#100#;
   SQL_FN_TD_CURTIME               : constant := 16#200#;
   SQL_FN_TD_HOUR                  : constant := 16#400#;
   SQL_FN_TD_MINUTE                : constant := 16#800#;
   SQL_FN_TD_SECOND                : constant := 16#1000#;
   SQL_FN_TD_TIMESTAMPADD          : constant := 16#2000#;
   SQL_FN_TD_TIMESTAMPDIFF         : constant := 16#4000#;
   SQL_FN_TD_DAYNAME               : constant := 16#8000#;
   SQL_FN_TD_MONTHNAME             : constant := 16#10000#;
   SQL_FN_SYS_USERNAME             : constant := 16#1#;
   SQL_FN_SYS_DBNAME               : constant := 16#2#;
   SQL_FN_SYS_IFNULL               : constant := 16#4#;
   SQL_FN_TSI_FRAC_SECOND          : constant := 16#1#;
   SQL_FN_TSI_SECOND               : constant := 16#2#;
   SQL_FN_TSI_MINUTE               : constant := 16#4#;
   SQL_FN_TSI_HOUR                 : constant := 16#8#;
   SQL_FN_TSI_DAY                  : constant := 16#10#;
   SQL_FN_TSI_WEEK                 : constant := 16#20#;
   SQL_FN_TSI_MONTH                : constant := 16#40#;
   SQL_FN_TSI_QUARTER              : constant := 16#80#;
   SQL_FN_TSI_YEAR                 : constant := 16#100#;
   SQL_OAC_NONE                    : constant := 16#0#;
   SQL_OAC_LEVEL1                  : constant := 16#1#;
   SQL_OAC_LEVEL2                  : constant := 16#2#;
   SQL_OSCC_NOT_COMPLIANT          : constant := 16#0#;
   SQL_OSCC_COMPLIANT              : constant := 16#1#;
   SQL_OSC_MINIMUM                 : constant := 16#0#;
   SQL_OSC_CORE                    : constant := 16#1#;
   SQL_OSC_EXTENDED                : constant := 16#2#;
   SQL_CB_NULL                     : constant := 16#0#;
   SQL_CB_NON_NULL                 : constant := 16#1#;
   SQL_CB_DELETE                   : constant := 16#0#;
   SQL_CB_CLOSE                    : constant := 16#1#;
   SQL_CB_PRESERVE                 : constant := 16#2#;
   SQL_IC_UPPER                    : constant := 16#1#;
   SQL_IC_LOWER                    : constant := 16#2#;
   SQL_IC_SENSITIVE                : constant := 16#3#;
   SQL_IC_MIXED                    : constant := 16#4#;
   SQL_TC_NONE                     : constant := 16#0#;
   SQL_TC_DML                      : constant := 16#1#;
   SQL_TC_ALL                      : constant := 16#2#;
   SQL_TC_DDL_COMMIT               : constant := 16#3#;
   SQL_TC_DDL_IGNORE               : constant := 16#4#;
   SQL_SO_FORWARD_ONLY             : constant := 16#1#;
   SQL_SO_KEYSET_DRIVEN            : constant := 16#2#;
   SQL_SO_DYNAMIC                  : constant := 16#4#;
   SQL_SO_MIXED                    : constant := 16#8#;
   SQL_SO_STATIC                   : constant := 16#10#;
   SQL_SCCO_READ_ONLY              : constant := 16#1#;
   SQL_SCCO_LOCK                   : constant := 16#2#;
   SQL_SCCO_OPT_ROWVER             : constant := 16#4#;
   SQL_SCCO_OPT_VALUES             : constant := 16#8#;
   SQL_FD_FETCH_NEXT               : constant := 16#1#;
   SQL_FD_FETCH_FIRST              : constant := 16#2#;
   SQL_FD_FETCH_LAST               : constant := 16#4#;
   SQL_FD_FETCH_PRIOR              : constant := 16#8#;
   SQL_FD_FETCH_ABSOLUTE           : constant := 16#10#;
   SQL_FD_FETCH_RELATIVE           : constant := 16#20#;
   SQL_FD_FETCH_RESUME             : constant := 16#40#;
   SQL_FD_FETCH_BOOKMARK           : constant := 16#80#;
   SQL_TXN_READ_UNCOMMITTED        : constant := 16#1#;
   SQL_TXN_READ_COMMITTED          : constant := 16#2#;
   SQL_TXN_REPEATABLE_READ         : constant := 16#4#;
   SQL_TXN_SERIALIZABLE            : constant := 16#8#;
   SQL_TXN_VERSIONING              : constant := 16#10#;
   SQL_CN_NONE                     : constant := 16#0#;
   SQL_CN_DIFFERENT                : constant := 16#1#;
   SQL_CN_ANY                      : constant := 16#2#;
   SQL_NNC_NULL                    : constant := 16#0#;
   SQL_NNC_NON_NULL                : constant := 16#1#;
   SQL_NC_HIGH                     : constant := 16#0#;
   SQL_NC_LOW                      : constant := 16#1#;
   SQL_NC_START                    : constant := 16#2#;
   SQL_NC_END                      : constant := 16#4#;
   SQL_FILE_NOT_SUPPORTED          : constant := 16#0#;
   SQL_FILE_TABLE                  : constant := 16#1#;
   SQL_FILE_QUALIFIER              : constant := 16#2#;
   SQL_GD_ANY_COLUMN               : constant := 16#1#;
   SQL_GD_ANY_ORDER                : constant := 16#2#;
   SQL_GD_BLOCK                    : constant := 16#4#;
   SQL_GD_BOUND                    : constant := 16#8#;
   SQL_AT_ADD_COLUMN               : constant := 16#1#;
   SQL_AT_DROP_COLUMN              : constant := 16#2#;
   SQL_PS_POSITIONED_DELETE        : constant := 16#1#;
   SQL_PS_POSITIONED_UPDATE        : constant := 16#2#;
   SQL_PS_SELECT_FOR_UPDATE        : constant := 16#4#;
   SQL_GB_NOT_SUPPORTED            : constant := 16#0#;
   SQL_GB_GROUP_BY_EQUALS_SELECT   : constant := 16#1#;
   SQL_GB_GROUP_BY_CONTAINS_SELECT : constant := 16#2#;
   SQL_GB_NO_RELATION              : constant := 16#3#;
   SQL_OU_DML_STATEMENTS           : constant := 16#1#;
   SQL_OU_PROCEDURE_INVOCATION     : constant := 16#2#;
   SQL_OU_TABLE_DEFINITION         : constant := 16#4#;
   SQL_OU_INDEX_DEFINITION         : constant := 16#8#;
   SQL_OU_PRIVILEGE_DEFINITION     : constant := 16#10#;
   SQL_QU_DML_STATEMENTS           : constant := 16#1#;
   SQL_QU_PROCEDURE_INVOCATION     : constant := 16#2#;
   SQL_QU_TABLE_DEFINITION         : constant := 16#4#;
   SQL_QU_INDEX_DEFINITION         : constant := 16#8#;
   SQL_QU_PRIVILEGE_DEFINITION     : constant := 16#10#;
   SQL_SQ_COMPARISON               : constant := 16#1#;
   SQL_SQ_EXISTS                   : constant := 16#2#;
   SQL_SQ_IN                       : constant := 16#4#;
   SQL_SQ_QUANTIFIED               : constant := 16#8#;
   SQL_SQ_CORRELATED_SUBQUERIES    : constant := 16#10#;
   SQL_U_UNION                     : constant := 16#1#;
   SQL_U_UNION_ALL                 : constant := 16#2#;
   SQL_BP_CLOSE                    : constant := 16#1#;
   SQL_BP_DELETE                   : constant := 16#2#;
   SQL_BP_DROP                     : constant := 16#4#;
   SQL_BP_TRANSACTION              : constant := 16#8#;
   SQL_BP_UPDATE                   : constant := 16#10#;
   SQL_BP_OTHER_HSTMT              : constant := 16#20#;
   SQL_BP_SCROLL                   : constant := 16#40#;
   SQL_SS_ADDITIONS                : constant := 16#1#;
   SQL_SS_DELETIONS                : constant := 16#2#;
   SQL_SS_UPDATES                  : constant := 16#4#;
   SQL_LCK_NO_CHANGE               : constant := 16#1#;
   SQL_LCK_EXCLUSIVE               : constant := 16#2#;
   SQL_LCK_UNLOCK                  : constant := 16#4#;
   SQL_POS_POSITION                : constant := 16#1#;
   SQL_POS_REFRESH                 : constant := 16#2#;
   SQL_POS_UPDATE                  : constant := 16#4#;
   SQL_POS_DELETE                  : constant := 16#8#;
   SQL_POS_ADD                     : constant := 16#10#;
   SQL_QL_START                    : constant := 16#1#;
   SQL_QL_END                      : constant := 16#2#;
   SQL_OJ_LEFT                     : constant := 16#1#;
   SQL_OJ_RIGHT                    : constant := 16#2#;
   SQL_OJ_FULL                     : constant := 16#4#;
   SQL_OJ_NESTED                   : constant := 16#8#;
   SQL_OJ_NOT_ORDERED              : constant := 16#10#;
   SQL_OJ_INNER                    : constant := 16#20#;
   SQL_OJ_ALL_COMPARISON_OPS       : constant := 16#40#;
   SQL_QUERY_TIMEOUT               : constant := 0;
   SQL_MAX_ROWS                    : constant := 1;
   SQL_NOSCAN                      : constant := 2;
   SQL_MAX_LENGTH                  : constant := 3;
   SQL_ASYNC_ENABLE                : constant := 4;
   SQL_BIND_TYPE                   : constant := 5;
   SQL_CURSOR_TYPE                 : constant := 6;
   SQL_CONCURRENCY                 : constant := 7;
   SQL_KEYSET_SIZE                 : constant := 8;
   SQL_ROWSET_SIZE                 : constant := 9;
   SQL_SIMULATE_CURSOR             : constant := 10;
   SQL_RETRIEVE_DATA               : constant := 11;
   SQL_USE_BOOKMARKS               : constant := 12;
   SQL_GET_BOOKMARK                : constant := 13;
   SQL_ROW_NUMBER                  : constant := 14;
   SQL_STMT_OPT_MAX                : constant := 14;
   SQL_STMT_OPT_MIN                : constant := 0;
   SQL_QUERY_TIMEOUT_DEFAULT       : constant := 0;
   SQL_MAX_ROWS_DEFAULT            : constant := 0;
   SQL_NOSCAN_OFF                  : constant := 0;
   SQL_NOSCAN_ON                   : constant := 1;
   SQL_NOSCAN_DEFAULT              : constant := 0;
   SQL_MAX_LENGTH_DEFAULT          : constant := 0;
   SQL_ASYNC_ENABLE_OFF            : constant := 0;
   SQL_ASYNC_ENABLE_ON             : constant := 1;
   SQL_ASYNC_ENABLE_DEFAULT        : constant := 0;
   SQL_BIND_BY_COLUMN              : constant := 0;
   SQL_CONCUR_READ_ONLY            : constant := 1;
   SQL_CONCUR_LOCK                 : constant := 2;
   SQL_CONCUR_ROWVER               : constant := 3;
   SQL_CONCUR_VALUES               : constant := 4;
   SQL_CURSOR_FORWARD_ONLY         : constant := 0;
   SQL_CURSOR_KEYSET_DRIVEN        : constant := 1;
   SQL_CURSOR_DYNAMIC              : constant := 2;
   SQL_CURSOR_STATIC               : constant := 3;
   SQL_ROWSET_SIZE_DEFAULT         : constant := 1;
   SQL_KEYSET_SIZE_DEFAULT         : constant := 0;
   SQL_SC_NON_UNIQUE               : constant := 0;
   SQL_SC_TRY_UNIQUE               : constant := 1;
   SQL_SC_UNIQUE                   : constant := 2;
   SQL_RD_OFF                      : constant := 0;
   SQL_RD_ON                       : constant := 1;
   SQL_RD_DEFAULT                  : constant := 1;
   SQL_UB_OFF                      : constant := 0;
   SQL_UB_ON                       : constant := 1;
   SQL_UB_DEFAULT                  : constant := 0;
   SQL_ACCESS_MODE                 : constant := 101;
   SQL_AUTOCOMMIT                  : constant := 102;
   SQL_LOGIN_TIMEOUT               : constant := 103;
   SQL_OPT_TRACE                   : constant := 104;
   SQL_OPT_TRACEFILE               : constant := 105;
   SQL_TRANSLATE_DLL               : constant := 106;
   SQL_TRANSLATE_OPTION            : constant := 107;
   SQL_TXN_ISOLATION               : constant := 108;
   SQL_CURRENT_QUALIFIER           : constant := 109;
   SQL_ODBC_CURSORS                : constant := 110;
   SQL_QUIET_MODE                  : constant := 111;
   SQL_PACKET_SIZE                 : constant := 112;
   SQL_CONN_OPT_MAX                : constant := 112;
   SQL_CONNECT_OPT_DRVR_START      : constant := 1000;
   SQL_CONN_OPT_MIN                : constant := 101;
   SQL_MODE_READ_WRITE             : constant := 0;
   SQL_MODE_READ_ONLY              : constant := 1;
   SQL_MODE_DEFAULT                : constant := 0;
   SQL_AUTOCOMMIT_OFF              : constant := 0;
   SQL_AUTOCOMMIT_ON               : constant := 1;
   SQL_AUTOCOMMIT_DEFAULT          : constant := 1;
   SQL_LOGIN_TIMEOUT_DEFAULT       : constant := 15;
   SQL_OPT_TRACE_OFF               : constant := 0;
   SQL_OPT_TRACE_ON                : constant := 1;
   SQL_OPT_TRACE_DEFAULT           : constant := 0;
   SQL_OPT_TRACE_FILE_DEFAULT      : constant CHAR_Array := "\SQL.LOG" & Nul;
   SQL_CUR_USE_IF_NEEDED           : constant := 0;
   SQL_CUR_USE_ODBC                : constant := 1;
   SQL_CUR_USE_DRIVER              : constant := 2;
   SQL_CUR_DEFAULT                 : constant := 2;
   SQL_BEST_ROWID                  : constant := 1;
   SQL_ROWVER                      : constant := 2;
   SQL_SCOPE_CURROW                : constant := 0;
   SQL_SCOPE_TRANSACTION           : constant := 1;
   SQL_SCOPE_SESSION               : constant := 2;
   SQL_ENTIRE_ROWSET               : constant := 0;
   SQL_POSITION                    : constant := 0;
   SQL_REFRESH                     : constant := 1;
   SQL_UPDATE                      : constant := 2;
   SQL_DELETE                      : constant := 3;
   SQL_ADD                         : constant := 4;
   SQL_LOCK_NO_CHANGE              : constant := 0;
   SQL_LOCK_EXCLUSIVE              : constant := 1;
   SQL_LOCK_UNLOCK                 : constant := 2;

   SQL_ODBC_KEYWORDS : constant CHAR_Array :=
      "ABSOLUTE,ACTION,ADA,ADD,ALL,ALLOCATE,ALTER,AND,ANY,ARE,AS," &
      "ASC,ASSERTION,AT,AUTHORIZATION,AVG,BEGIN," &
      "BETWEEN,BIT,BIT_LENGTH,BOTH,BY,CASCADE,CASCADED,CASE,CAST,CATALOG," &
      "CHAR,CHAR_LENGTH,CHARACTER,CHARACTER_LENGTH,CHECK,CLOSE,COALESCE," &
      "COBOL,COLLATE,COLLATION,COLUMN,COMMIT,CONNECT,CONNECTION,CONSTRAINT," &
      "CONSTRAINTS,CONTINUE,CONVERT,CORRESPONDING,COUNT,CREATE,CROSS,CURRENT,"
      &
      "CURRENT_DATE,CURRENT_TIME,CURRENT_TIMESTAMP,CURRENT_USER,CURSOR," &
      "DATE,DAY,DEALLOCATE,DEC,DECIMAL,DECLARE,DEFAULT,DEFERRABLE," &
      "DEFERRED,DELETE,DESC,DESCRIBE,DESCRIPTOR,DIAGNOSTICS,DISCONNECT," &
      "DISTINCT,DOMAIN,DOUBLE,DROP," &
      "ELSE,END,END-EXEC,ESCAPE,EXCEPT,EXCEPTION,EXEC,EXECUTE," &
      "EXISTS,EXTERNAL,EXTRACT," &
      "FALSE,FETCH,FIRST,FLOAT,FOR,FOREIGN,FORTRAN,FOUND,FROM,FULL," &
      "GET,GLOBAL,GO,GOTO,GRANT,GROUP,HAVING,HOUR," &
      "IDENTITY,IMMEDIATE,IN,INCLUDE,INDEX,INDICATOR,INITIALLY,INNER," &
      "INPUT,INSENSITIVE,INSERT,INTEGER,INTERSECT,INTERVAL,INTO,IS,ISOLATION,"
      &
      "JOIN,KEY,LANGUAGE,LAST,LEADING,LEFT,LEVEL,LIKE,LOCAL,LOWER," &
      "MATCH,MAX,MIN,MINUTE,MODULE,MONTH,MUMPS," &
      "NAMES,NATIONAL,NATURAL,NCHAR,NEXT,NO,NONE,NOT,NULL,NULLIF,NUMERIC," &
      "OCTET_LENGTH,OF,ON,ONLY,OPEN,OPTION,OR,ORDER,OUTER,OUTPUT,OVERLAPS," &
      "PAD,PARTIAL,PASCAL,PLI,POSITION,PRECISION,PREPARE,PRESERVE," &
      "PRIMARY,PRIOR,PRIVILEGES,PROCEDURE,PUBLIC," &
      "REFERENCES,RELATIVE,RESTRICT,REVOKE,RIGHT,ROLLBACK,ROWS," &
      "SCHEMA,SCROLL,SECOND,SECTION,SELECT,SEQUENCE,SESSION,SESSION_USER,SET,"
      &
      "SIZE,SMALLINT,SOME,SPACE,SQL,SQLCA,SQLCODE,SQLERROR,SQLSTATE," &
      "SQLWARNING,SUBSTRING,SUM,SYSTEM_USER," &
      "TABLE,TEMPORARY,THEN,TIME,TIMESTAMP,TIMEZONE_HOUR,TIMEZONE_MINUTE," &
      "TO,TRAILING,TRANSACTION,TRANSLATE,TRANSLATION,TRIM,TRUE," &
      "UNION,UNIQUE,UNKNOWN,UPDATE,UPPER,USAGE,USER,USING," &
      "VALUE,VALUES,VARCHAR,VARYING,VIEW,WHEN,WHENEVER,WHERE,WITH," &
      "WORK,YEAR" &
      Nul;

   SQL_FETCH_NEXT           : constant := 1;
   SQL_FETCH_FIRST          : constant := 2;
   SQL_FETCH_LAST           : constant := 3;
   SQL_FETCH_PRIOR          : constant := 4;
   SQL_FETCH_ABSOLUTE       : constant := 5;
   SQL_FETCH_RELATIVE       : constant := 6;
   SQL_FETCH_BOOKMARK       : constant := 8;
   SQL_ROW_SUCCESS          : constant := 0;
   SQL_ROW_DELETED          : constant := 1;
   SQL_ROW_UPDATED          : constant := 2;
   SQL_ROW_NOROW            : constant := 3;
   SQL_ROW_ADDED            : constant := 4;
   SQL_ROW_ERROR            : constant := 5;
   SQL_CASCADE              : constant := 0;
   SQL_RESTRICT             : constant := 1;
   SQL_SET_NULL             : constant := 2;
   SQL_PARAM_TYPE_UNKNOWN   : constant := 0;
   SQL_PARAM_INPUT          : constant := 1;
   SQL_PARAM_INPUT_OUTPUT   : constant := 2;
   SQL_RESULT_COL           : constant := 3;
   SQL_PARAM_OUTPUT         : constant := 4;
   SQL_RETURN_VALUE         : constant := 5;
   SQL_PARAM_TYPE_DEFAULT   : constant := 2;
   SQL_SETPARAM_VALUE_MAX   : constant := -1;
   SQL_INDEX_UNIQUE         : constant := 0;
   SQL_INDEX_ALL            : constant := 1;
   SQL_QUICK                : constant := 0;
   SQL_ENSURE               : constant := 1;
   SQL_TABLE_STAT           : constant := 0;
   SQL_INDEX_CLUSTERED      : constant := 1;
   SQL_INDEX_HASHED         : constant := 2;
   SQL_INDEX_OTHER          : constant := 3;
   SQL_PT_UNKNOWN           : constant := 0;
   SQL_PT_PROCEDURE         : constant := 1;
   SQL_PT_FUNCTION          : constant := 2;
   SQL_PC_UNKNOWN           : constant := 0;
   SQL_PC_NOT_PSEUDO        : constant := 1;
   SQL_PC_PSEUDO            : constant := 2;
   SQL_DATABASE_NAME        : constant := 16;
   SQL_FD_FETCH_PREV        : constant := 16#8#;
   SQL_FETCH_PREV           : constant := 4;
   SQL_CONCUR_TIMESTAMP     : constant := 3;
   SQL_SCCO_OPT_TIMESTAMP   : constant := 16#4#;
   SQL_CC_DELETE            : constant := 16#0#;
   SQL_CR_DELETE            : constant := 16#0#;
   SQL_CC_CLOSE             : constant := 16#1#;
   SQL_CR_CLOSE             : constant := 16#1#;
   SQL_CC_PRESERVE          : constant := 16#2#;
   SQL_CR_PRESERVE          : constant := 16#2#;
   SQL_FETCH_RESUME         : constant := 7;
   SQL_SCROLL_FORWARD_ONLY  : constant := 0;
   SQL_SCROLL_KEYSET_DRIVEN : constant := -1;
   SQL_SCROLL_DYNAMIC       : constant := -2;
   SQL_SCROLL_STATIC        : constant := -3;
   SQL_PC_NON_PSEUDO        : constant := 1;

   type BOOKMARK is new Win32.UINT;

   type DATE_STRUCT;
   type TIME_STRUCT;
   type TIMESTAMP_STRUCT;

   type DATE_STRUCT is record
      year  : Win32.Sql.SWORD;
      month : Win32.Sql.UWORD;
      day   : Win32.Sql.UWORD;
   end record;

   type TIME_STRUCT is record
      hour   : Win32.Sql.UWORD;
      minute : Win32.Sql.UWORD;
      second : Win32.Sql.UWORD;
   end record;

   type TIMESTAMP_STRUCT is record
      year     : Win32.Sql.SWORD;
      month    : Win32.Sql.UWORD;
      day      : Win32.Sql.UWORD;
      hour     : Win32.Sql.UWORD;
      minute   : Win32.Sql.UWORD;
      second   : Win32.Sql.UWORD;
      fraction : Win32.Sql.UDWORD;
   end record;

   function SQL_LEN_DATA_AT_EXEC
     (length : Win32.Sql.SDWORD)
      return Win32.Sql.SDWORD;

   function SQLColumns
     (hstmt            : Win32.Sql.HSTMT;
      szTableQualifier : Win32.PUCHAR;
      cbTableQualifier : Win32.Sql.SWORD;
      szTableOwner     : Win32.PUCHAR;
      cbTableOwner     : Win32.Sql.SWORD;
      szTableName      : Win32.PUCHAR;
      cbTableName      : Win32.Sql.SWORD;
      szColumnName     : Win32.PUCHAR;
      cbColumnName     : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLDriverConnect
     (hdbc              : Win32.Sql.HDBC;
      hwnd              : Win32.Windef.HWND;
      szConnStrIn       : Win32.PUCHAR;
      cbConnStrIn       : Win32.Sql.SWORD;
      szConnStrOut      : Win32.PUCHAR;
      cbConnStrOutMax   : Win32.Sql.SWORD;
      pcbConnStrOut     : access Win32.Sql.SWORD;
      fDriverCompletion : Win32.Sql.UWORD)
      return Win32.Sql.RETCODE;

   function SQLGetConnectOption
     (hdbc    : Win32.Sql.HDBC;
      fOption : Win32.Sql.UWORD;
      pvParam : Win32.Sql.PTR)
      return Win32.Sql.RETCODE;

   function SQLGetData
     (hstmt      : Win32.Sql.HSTMT;
      icol       : Win32.Sql.UWORD;
      fCType     : Win32.Sql.SWORD;
      rgbValue   : Win32.Sql.PTR;
      cbValueMax : Win32.Sql.SDWORD;
      pcbValue   : access Win32.Sql.SDWORD)
      return Win32.Sql.RETCODE;

   function SQLGetFunctions
     (hdbc      : Win32.Sql.HDBC;
      fFunction : Win32.Sql.UWORD;
      pfExists  : Win32.PWSTR)
      return Win32.Sql.RETCODE;

   function SQLGetInfo
     (hdbc           : Win32.Sql.HDBC;
      fInfoType      : Win32.Sql.UWORD;
      rgbInfoValue   : Win32.Sql.PTR;
      cbInfoValueMax : Win32.Sql.SWORD;
      pcbInfoValue   : access Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLGetStmtOption
     (hstmt   : Win32.Sql.HSTMT;
      fOption : Win32.Sql.UWORD;
      pvParam : Win32.Sql.PTR)
      return Win32.Sql.RETCODE;

   function SQLGetTypeInfo
     (hstmt    : Win32.Sql.HSTMT;
      fSqlType : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLParamData
     (hstmt     : Win32.Sql.HSTMT;
      prgbValue : access Win32.Sql.PTR)
      return Win32.Sql.RETCODE;

   function SQLPutData
     (hstmt    : Win32.Sql.HSTMT;
      rgbValue : Win32.Sql.PTR;
      cbValue  : Win32.Sql.SDWORD)
      return Win32.Sql.RETCODE;

   function SQLSetConnectOption
     (hdbc    : Win32.Sql.HDBC;
      fOption : Win32.Sql.UWORD;
      vParam  : Win32.Sql.UDWORD)
      return Win32.Sql.RETCODE;

   function SQLSetStmtOption
     (hstmt   : Win32.Sql.HSTMT;
      fOption : Win32.Sql.UWORD;
      vParam  : Win32.Sql.UDWORD)
      return Win32.Sql.RETCODE;

   function SQLSpecialColumns
     (hstmt            : Win32.Sql.HSTMT;
      fColType         : Win32.Sql.UWORD;
      szTableQualifier : Win32.PUCHAR;
      cbTableQualifier : Win32.Sql.SWORD;
      szTableOwner     : Win32.PUCHAR;
      cbTableOwner     : Win32.Sql.SWORD;
      szTableName      : Win32.PUCHAR;
      cbTableName      : Win32.Sql.SWORD;
      fScope           : Win32.Sql.UWORD;
      fNullable        : Win32.Sql.UWORD)
      return Win32.Sql.RETCODE;

   function SQLStatistics
     (hstmt            : Win32.Sql.HSTMT;
      szTableQualifier : Win32.PUCHAR;
      cbTableQualifier : Win32.Sql.SWORD;
      szTableOwner     : Win32.PUCHAR;
      cbTableOwner     : Win32.Sql.SWORD;
      szTableName      : Win32.PUCHAR;
      cbTableName      : Win32.Sql.SWORD;
      fUnique          : Win32.Sql.UWORD;
      fAccuracy        : Win32.Sql.UWORD)
      return Win32.Sql.RETCODE;

   function SQLTables
     (hstmt            : Win32.Sql.HSTMT;
      szTableQualifier : Win32.PUCHAR;
      cbTableQualifier : Win32.Sql.SWORD;
      szTableOwner     : Win32.PUCHAR;
      cbTableOwner     : Win32.Sql.SWORD;
      szTableName      : Win32.PUCHAR;
      cbTableName      : Win32.Sql.SWORD;
      szTableType      : Win32.PUCHAR;
      cbTableType      : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLBrowseConnect
     (hdbc            : Win32.Sql.HDBC;
      szConnStrIn     : Win32.PUCHAR;
      cbConnStrIn     : Win32.Sql.SWORD;
      szConnStrOut    : Win32.PUCHAR;
      cbConnStrOutMax : Win32.Sql.SWORD;
      pcbConnStrOut   : access Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLColumnPrivileges
     (hstmt            : Win32.Sql.HSTMT;
      szTableQualifier : Win32.PUCHAR;
      cbTableQualifier : Win32.Sql.SWORD;
      szTableOwner     : Win32.PUCHAR;
      cbTableOwner     : Win32.Sql.SWORD;
      szTableName      : Win32.PUCHAR;
      cbTableName      : Win32.Sql.SWORD;
      szColumnName     : Win32.PUCHAR;
      cbColumnName     : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLDataSources
     (henv             : Win32.Sql.HENV;
      fDirection       : Win32.Sql.UWORD;
      szDSN            : Win32.PUCHAR;
      cbDSNMax         : Win32.Sql.SWORD;
      pcbDSN           : access Win32.Sql.SWORD;
      szDescription    : Win32.PUCHAR;
      cbDescriptionMax : Win32.Sql.SWORD;
      pcbDescription   : access Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLDescribeParam
     (hstmt      : Win32.Sql.HSTMT;
      ipar       : Win32.Sql.UWORD;
      pfSqlType  : access Win32.Sql.SWORD;
      pcbColDef  : access Win32.Sql.SWORD;
      pibScale   : access Win32.Sql.SWORD;
      pfNullable : access Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLExtendedFetch
     (hstmt        : Win32.Sql.HSTMT;
      fFetchType   : Win32.Sql.UWORD;
      irow         : Win32.Sql.SDWORD;
      pcrow        : access Win32.Sql.SWORD;
      rgfRowStatus : Win32.PWSTR)
      return Win32.Sql.RETCODE;

   function SQLForeignKeys
     (hstmt              : Win32.Sql.HSTMT;
      szPkTableQualifier : Win32.PUCHAR;
      cbPkTableQualifier : Win32.Sql.SWORD;
      szPkTableOwner     : Win32.PUCHAR;
      cbPkTableOwner     : Win32.Sql.SWORD;
      szPkTableName      : Win32.PUCHAR;
      cbPkTableName      : Win32.Sql.SWORD;
      szFkTableQualifier : Win32.PUCHAR;
      cbFkTableQualifier : Win32.Sql.SWORD;
      szFkTableOwner     : Win32.PUCHAR;
      cbFkTableOwner     : Win32.Sql.SWORD;
      szFkTableName      : Win32.PUCHAR;
      cbFkTableName      : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLMoreResults
     (hstmt : Win32.Sql.HSTMT)
      return Win32.Sql.RETCODE;

   function SQLNativeSql
     (hdbc        : Win32.Sql.HDBC;
      szSqlStrIn  : Win32.PUCHAR;
      cbSqlStrIn  : Win32.Sql.SDWORD;
      szSqlStr    : Win32.PUCHAR;
      cbSqlStrMax : Win32.Sql.SDWORD;
      pcbSqlStr   : access Win32.Sql.SDWORD)
      return Win32.Sql.RETCODE;

   function SQLNumParams
     (hstmt : Win32.Sql.HSTMT;
      pcpar : access Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLParamOptions
     (hstmt : Win32.Sql.HSTMT;
      crow  : Win32.Sql.UDWORD;
      pirow : access Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLPrimaryKeys
     (hstmt            : Win32.Sql.HSTMT;
      szTableQualifier : Win32.PUCHAR;
      cbTableQualifier : Win32.Sql.SWORD;
      szTableOwner     : Win32.PUCHAR;
      cbTableOwner     : Win32.Sql.SWORD;
      szTableName      : Win32.PUCHAR;
      cbTableName      : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLProcedureColumns
     (hstmt           : Win32.Sql.HSTMT;
      szProcQualifier : Win32.PUCHAR;
      cbProcQualifier : Win32.Sql.SWORD;
      szProcOwner     : Win32.PUCHAR;
      cbProcOwner     : Win32.Sql.SWORD;
      szProcName      : Win32.PUCHAR;
      cbProcName      : Win32.Sql.SWORD;
      szColumnName    : Win32.PUCHAR;
      cbColumnName    : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLProcedures
     (hstmt           : Win32.Sql.HSTMT;
      szProcQualifier : Win32.PUCHAR;
      cbProcQualifier : Win32.Sql.SWORD;
      szProcOwner     : Win32.PUCHAR;
      cbProcOwner     : Win32.Sql.SWORD;
      szProcName      : Win32.PUCHAR;
      cbProcName      : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLTablePrivileges
     (hstmt            : Win32.Sql.HSTMT;
      szTableQualifier : Win32.PUCHAR;
      cbTableQualifier : Win32.Sql.SWORD;
      szTableOwner     : Win32.PUCHAR;
      cbTableOwner     : Win32.Sql.SWORD;
      szTableName      : Win32.PUCHAR;
      cbTableName      : Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLDrivers
     (henv               : Win32.Sql.HENV;
      fDirection         : Win32.Sql.UWORD;
      szDriverDesc       : Win32.PUCHAR;
      cbDriverDescMax    : Win32.Sql.SWORD;
      pcbDriverDesc      : access Win32.Sql.SWORD;
      szDriverAttributes : Win32.PUCHAR;
      cbDrvrAttrMax      : Win32.Sql.SWORD;
      pcbDrvrAttr        : access Win32.Sql.SWORD)
      return Win32.Sql.RETCODE;

   function SQLBindParameter
     (hstmt      : Win32.Sql.HSTMT;
      ipar       : Win32.Sql.UWORD;
      fParamType : Win32.Sql.SWORD;
      fCType     : Win32.Sql.SWORD;
      fSqlType   : Win32.Sql.SWORD;
      cbColDef   : Win32.Sql.UDWORD;
      ibScale    : Win32.Sql.SWORD;
      rgbValue   : Win32.Sql.PTR;
      cbValueMax : Win32.Sql.SDWORD;
      pcbValue   : access Win32.Sql.SDWORD)
      return Win32.Sql.RETCODE;

   function SQLSetScrollOptions
     (hstmt        : Win32.Sql.HSTMT;
      fConcurrency : Win32.Sql.UWORD;
      crowKeyset   : Win32.Sql.SDWORD;
      crowRowset   : Win32.Sql.UWORD)
      return Win32.Sql.RETCODE;

private

   pragma Convention (C_Pass_By_Copy, DATE_STRUCT);
   pragma Convention (C_Pass_By_Copy, TIME_STRUCT);
   pragma Convention (C_Pass_By_Copy, TIMESTAMP_STRUCT);

   pragma Inline (SQL_LEN_DATA_AT_EXEC);

   pragma Import (Stdcall, SQLColumns, "SQLColumns");
   pragma Import (Stdcall, SQLDriverConnect, "SQLDriverConnect");
   pragma Import (Stdcall, SQLGetConnectOption, "SQLGetConnectOption");
   pragma Import (Stdcall, SQLGetData, "SQLGetData");
   pragma Import (Stdcall, SQLGetFunctions, "SQLGetFunctions");
   pragma Import (Stdcall, SQLGetInfo, "SQLGetInfo");
   pragma Import (Stdcall, SQLGetStmtOption, "SQLGetStmtOption");
   pragma Import (Stdcall, SQLGetTypeInfo, "SQLGetTypeInfo");
   pragma Import (Stdcall, SQLParamData, "SQLParamData");
   pragma Import (Stdcall, SQLPutData, "SQLPutData");
   pragma Import (Stdcall, SQLSetConnectOption, "SQLSetConnectOption");
   pragma Import (Stdcall, SQLSetStmtOption, "SQLSetStmtOption");
   pragma Import (Stdcall, SQLSpecialColumns, "SQLSpecialColumns");
   pragma Import (Stdcall, SQLStatistics, "SQLStatistics");
   pragma Import (Stdcall, SQLTables, "SQLTables");
   pragma Import (Stdcall, SQLBrowseConnect, "SQLBrowseConnect");
   pragma Import (Stdcall, SQLColumnPrivileges, "SQLColumnPrivileges");
   pragma Import (Stdcall, SQLDataSources, "SQLDataSources");
   pragma Import (Stdcall, SQLDescribeParam, "SQLDescribeParam");
   pragma Import (Stdcall, SQLExtendedFetch, "SQLExtendedFetch");
   pragma Import (Stdcall, SQLForeignKeys, "SQLForeignKeys");
   pragma Import (Stdcall, SQLMoreResults, "SQLMoreResults");
   pragma Import (Stdcall, SQLNativeSql, "SQLNativeSql");
   pragma Import (Stdcall, SQLNumParams, "SQLNumParams");
   pragma Import (Stdcall, SQLParamOptions, "SQLParamOptions");
   pragma Import (Stdcall, SQLPrimaryKeys, "SQLPrimaryKeys");
   pragma Import (Stdcall, SQLProcedureColumns, "SQLProcedureColumns");
   pragma Import (Stdcall, SQLProcedures, "SQLProcedures");
   pragma Import (Stdcall, SQLTablePrivileges, "SQLTablePrivileges");
   pragma Import (Stdcall, SQLDrivers, "SQLDrivers");
   pragma Import (Stdcall, SQLBindParameter, "SQLBindParameter");
   pragma Import (Stdcall, SQLSetScrollOptions, "SQLSetScrollOptions");
end Win32.Sqlext;
