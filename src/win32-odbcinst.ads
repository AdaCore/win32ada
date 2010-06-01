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

with Win32.Windef;

package Win32.Odbcinst is

   ODBC_ADD_DSN    : constant := 1;
   ODBC_CONFIG_DSN : constant := 2;
   ODBC_REMOVE_DSN : constant := 3;

   function SQLInstallODBC
     (hwndParent  : Win32.Windef.HWND;
      lpszInfFile : Win32.LPCSTR;
      lpszSrcPath : Win32.LPCSTR;
      lpszDrivers : Win32.LPCSTR)
      return Win32.BOOL;

   function SQLManageDataSources
     (hwndParent : Win32.Windef.HWND)
      return Win32.BOOL;

   function SQLCreateDataSource
     (hwndParent : Win32.Windef.HWND;
      lpszDSN    : Win32.LPCSTR)
      return Win32.BOOL;

   function SQLGetTranslator
     (hwnd       : Win32.Windef.HWND;
      lpszName   : Win32.LPSTR;
      cbNameMax  : Win32.WORD;
      pcbNameOut : Win32.PWORD;
      lpszPath   : Win32.LPSTR;
      cbPathMax  : Win32.WORD;
      pcbPathOut : Win32.PWORD;
      pvOption   : Win32.PWORD)
      return Win32.BOOL;

   function SQLInstallDriver
     (lpszInfFile : Win32.LPCSTR;
      lpszDriver  : Win32.LPCSTR;
      lpszPath    : Win32.LPSTR;
      cbPathMax   : Win32.WORD;
      pcbPathOut  : Win32.PWORD)
      return Win32.BOOL;

   function SQLInstallDriverManager
     (lpszPath   : Win32.LPSTR;
      cbPathMax  : Win32.WORD;
      pcbPathOut : Win32.PWORD)
      return Win32.BOOL;

   function SQLGetInstalledDrivers
     (lpszBuf   : Win32.LPSTR;
      cbBufMax  : Win32.WORD;
      pcbBufOut : Win32.PWORD)
      return Win32.BOOL;

   function SQLGetAvailableDrivers
     (lpszInfFile : Win32.LPCSTR;
      lpszBuf     : Win32.LPSTR;
      cbBufMax    : Win32.WORD;
      pcbBufOut   : Win32.PWORD)
      return Win32.BOOL;

   function SQLConfigDataSource
     (hwndParent     : Win32.Windef.HWND;
      fRequest       : Win32.WORD;
      lpszDriver     : Win32.LPCSTR;
      lpszAttributes : Win32.LPCSTR)
      return Win32.BOOL;

   function SQLRemoveDefaultDataSource return Win32.BOOL;

   function SQLWriteDSNToIni
     (lpszDSN    : Win32.LPCSTR;
      lpszDriver : Win32.LPCSTR)
      return Win32.BOOL;

   function SQLRemoveDSNFromIni (lpszDSN : Win32.LPCSTR) return Win32.BOOL;

   function SQLValidDSN (lpszDSN : Win32.LPCSTR) return Win32.BOOL;

   function SQLWritePrivateProfileString
     (lpszSection  : Win32.LPCSTR;
      lpszEntry    : Win32.LPCSTR;
      lpszString   : Win32.LPCSTR;
      lpszFilename : Win32.LPCSTR)
      return Win32.BOOL;

   function SQLGetPrivateProfileString
     (lpszSection   : Win32.LPCSTR;
      lpszEntry     : Win32.LPCSTR;
      lpszDefault   : Win32.LPCSTR;
      lpszRetBuffer : Win32.LPSTR;
      cbRetBuffer   : Win32.INT;
      lpszFilename  : Win32.LPCSTR)
      return Win32.INT;

   function ConfigDSN
     (hwndParent     : Win32.Windef.HWND;
      fRequest       : Win32.WORD;
      lpszDriver     : Win32.LPCSTR;
      lpszAttributes : Win32.LPCSTR)
      return Win32.BOOL;

   function ConfigTranslator
     (hwndParent : Win32.Windef.HWND;
      pvOption   : Win32.PWORD)
      return Win32.BOOL;

private

   pragma Import (Stdcall, SQLInstallODBC, "SQLInstallODBC");
   pragma Import (Stdcall, SQLManageDataSources, "SQLManageDataSources");
   pragma Import (Stdcall, SQLCreateDataSource, "SQLCreateDataSource");
   pragma Import (Stdcall, SQLGetTranslator, "SQLGetTranslator");
   pragma Import (Stdcall, SQLInstallDriver, "SQLInstallDriver");
   pragma Import
     (Stdcall,
      SQLInstallDriverManager,
      "SQLInstallDriverManager");
   pragma Import (Stdcall, SQLGetInstalledDrivers, "SQLGetInstalledDrivers");
   pragma Import (Stdcall, SQLGetAvailableDrivers, "SQLGetAvailableDrivers");
   pragma Import (Stdcall, SQLConfigDataSource, "SQLConfigDataSource");
   pragma Import
     (Stdcall,
      SQLRemoveDefaultDataSource,
      "SQLRemoveDefaultDataSource");
   pragma Import (Stdcall, SQLWriteDSNToIni, "SQLWriteDSNToIni");
   pragma Import (Stdcall, SQLRemoveDSNFromIni, "SQLRemoveDSNFromIni");
   pragma Import (Stdcall, SQLValidDSN, "SQLValidDSN");
   pragma Import
     (Stdcall,
      SQLWritePrivateProfileString,
      "SQLWritePrivateProfileString");
   pragma Import
     (Stdcall,
      SQLGetPrivateProfileString,
      "SQLGetPrivateProfileString");
   pragma Import (Stdcall, ConfigDSN, "ConfigDSN");
   pragma Import (Stdcall, ConfigTranslator, "ConfigTranslator");

end Win32.Odbcinst;
