-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Windef;

package Win32.Odbcinst is

    ODBC_ADD_DSN    : constant := 1;                        -- odbcinst.h:26
    ODBC_CONFIG_DSN : constant := 2;                        -- odbcinst.h:27
    ODBC_REMOVE_DSN : constant := 3;                        -- odbcinst.h:28

    function SQLInstallODBC(hwndParent : Win32.Windef.HWND;
                            lpszInfFile: Win32.LPCSTR;
                            lpszSrcPath: Win32.LPCSTR;
                            lpszDrivers: Win32.LPCSTR)
                                         return Win32.BOOL; -- odbcinst.h:48

    function SQLManageDataSources(hwndParent: Win32.Windef.HWND) 
        return Win32.BOOL;                                  -- odbcinst.h:52

    function SQLCreateDataSource(hwndParent: Win32.Windef.HWND;
                                 lpszDSN   : Win32.LPCSTR)
                                             return Win32.BOOL;
                                                            -- odbcinst.h:53

    function SQLGetTranslator(hwnd      : Win32.Windef.HWND;
                              lpszName  : Win32.LPSTR;
                              cbNameMax : Win32.WORD;
                              pcbNameOut: Win32.PWORD;
                              lpszPath  : Win32.LPSTR;
                              cbPathMax : Win32.WORD;
                              pcbPathOut: Win32.PWORD;
                              pvOption  : Win32.PWORD)
                                          return Win32.BOOL;-- odbcinst.h:55

    function SQLInstallDriver(lpszInfFile: Win32.LPCSTR;
                              lpszDriver : Win32.LPCSTR;
                              lpszPath   : Win32.LPSTR;
                              cbPathMax  : Win32.WORD;
                              pcbPathOut : Win32.PWORD)
                                           return Win32.BOOL;
                                                            -- odbcinst.h:67

    function SQLInstallDriverManager(lpszPath  : Win32.LPSTR;
                                     cbPathMax : Win32.WORD;
                                     pcbPathOut: Win32.PWORD)
                                                 return Win32.BOOL;
                                                            -- odbcinst.h:72

    function SQLGetInstalledDrivers(lpszBuf  : Win32.LPSTR;
                                    cbBufMax : Win32.WORD;
                                    pcbBufOut: Win32.PWORD)
                                               return Win32.BOOL;
                                                            -- odbcinst.h:75

    function SQLGetAvailableDrivers(lpszInfFile: Win32.LPCSTR;
                                    lpszBuf    : Win32.LPSTR;
                                    cbBufMax   : Win32.WORD;
                                    pcbBufOut  : Win32.PWORD)
                                                 return Win32.BOOL;
                                                            -- odbcinst.h:78

    function SQLConfigDataSource(hwndParent    : Win32.Windef.HWND;
                                 fRequest      : Win32.WORD;
                                 lpszDriver    : Win32.LPCSTR;
                                 lpszAttributes: Win32.LPCSTR)
                                                 return Win32.BOOL;
                                                            -- odbcinst.h:82

    function SQLRemoveDefaultDataSource return Win32.BOOL;  -- odbcinst.h:86

    function SQLWriteDSNToIni(lpszDSN   : Win32.LPCSTR;
                              lpszDriver: Win32.LPCSTR)
                                          return Win32.BOOL;-- odbcinst.h:87

    function SQLRemoveDSNFromIni(lpszDSN: Win32.LPCSTR) 
        return Win32.BOOL;                                  -- odbcinst.h:89

    function SQLValidDSN(lpszDSN: Win32.LPCSTR) return Win32.BOOL;
                                                            -- odbcinst.h:90

    function SQLWritePrivateProfileString(lpszSection : Win32.LPCSTR;
                                          lpszEntry   : Win32.LPCSTR;
                                          lpszString  : Win32.LPCSTR;
                                          lpszFilename: Win32.LPCSTR)
        return Win32.BOOL;                                  -- odbcinst.h:93

    function SQLGetPrivateProfileString(lpszSection  : Win32.LPCSTR;
                                        lpszEntry    : Win32.LPCSTR;
                                        lpszDefault  : Win32.LPCSTR;
                                        lpszRetBuffer: Win32.LPSTR;
                                        cbRetBuffer  : Win32.INT;
                                        lpszFilename : Win32.LPCSTR)
        return Win32.INT;                                   -- odbcinst.h:98

    function ConfigDSN(hwndParent    : Win32.Windef.HWND;
                       fRequest      : Win32.WORD;
                       lpszDriver    : Win32.LPCSTR;
                       lpszAttributes: Win32.LPCSTR)
                                       return Win32.BOOL;   -- odbcinst.h:108

    function ConfigTranslator(hwndParent: Win32.Windef.HWND;
                              pvOption  : Win32.PWORD)
                                          return Win32.BOOL;-- odbcinst.h:113

private

    pragma Import(Stdcall, SQLINSTALLODBC, "SQLInstallODBC");     -- odbcinst.h:48
    pragma Import(Stdcall, SQLMANAGEDATASOURCES, "SQLManageDataSources");
                                                            -- odbcinst.h:52
    pragma Import(Stdcall, SQLCREATEDATASOURCE, "SQLCreateDataSource");
                                                            -- odbcinst.h:53
    pragma Import(Stdcall, SQLGETTRANSLATOR, "SQLGetTranslator"); -- odbcinst.h:55
    pragma Import(Stdcall, SQLINSTALLDRIVER, "SQLInstallDriver"); -- odbcinst.h:67
    pragma Import(Stdcall, SQLINSTALLDRIVERMANAGER, "SQLInstallDriverManager");
                                                            -- odbcinst.h:72
    pragma Import(Stdcall, SQLGETINSTALLEDDRIVERS, "SQLGetInstalledDrivers");
                                                            -- odbcinst.h:75
    pragma Import(Stdcall, SQLGETAVAILABLEDRIVERS, "SQLGetAvailableDrivers");
                                                            -- odbcinst.h:78
    pragma Import(Stdcall, SQLCONFIGDATASOURCE, "SQLConfigDataSource");
                                                            -- odbcinst.h:82
    pragma Import(Stdcall, SQLREMOVEDEFAULTDATASOURCE, "SQLRemoveDefaultDataSource");
                                                            -- odbcinst.h:86
    pragma Import(Stdcall, SQLWRITEDSNTOINI, "SQLWriteDSNToIni"); -- odbcinst.h:87
    pragma Import(Stdcall, SQLREMOVEDSNFROMINI, "SQLRemoveDSNFromIni");
                                                            -- odbcinst.h:89
    pragma Import(Stdcall, SQLVALIDDSN, "SQLValidDSN");           -- odbcinst.h:90
    pragma Import(Stdcall, SQLWRITEPRIVATEPROFILESTRING, 
                  "SQLWritePrivateProfileString");          -- odbcinst.h:93
    pragma Import(Stdcall, SQLGETPRIVATEPROFILESTRING, 
                  "SQLGetPrivateProfileString");            -- odbcinst.h:98
    pragma Import(Stdcall, ConfigDSN, "ConfigDSN");               -- odbcinst.h:108
    pragma Import(Stdcall, ConfigTranslator, "ConfigTranslator");     
                                                            -- odbcinst.h:113

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Odbcinst;
