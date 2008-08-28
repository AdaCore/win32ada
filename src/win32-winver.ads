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

with Win32.Winuser;

package Win32.Winver is

   VS_FILE_INFO : Win32.LPSTR renames Win32.Winuser.RT_VERSION;
   --  winver.h:21
   VS_VERSION_INFO : constant := 1;                 --  winver.h:22
   VS_USER_DEFINED : constant := 100;               --  winver.h:23
   VS_FFI_SIGNATURE : constant := 16#feef04bd#;      --  winver.h:26
   VS_FFI_STRUCVERSION : constant := 16#10000#;         --  winver.h:27
   VS_FFI_FILEFLAGSMASK : constant := 16#3f#;            --  winver.h:28
   VS_FF_DEBUG : constant := 16#1#;             --  winver.h:31
   VS_FF_PRERELEASE : constant := 16#2#;             --  winver.h:32
   VS_FF_PATCHED : constant := 16#4#;             --  winver.h:33
   VS_FF_PRIVATEBUILD : constant := 16#8#;             --  winver.h:34
   VS_FF_INFOINFERRED : constant := 16#10#;            --  winver.h:35
   VS_FF_SPECIALBUILD : constant := 16#20#;            --  winver.h:36
   VOS_UNKNOWN : constant := 16#0#;             --  winver.h:39
   VOS_DOS : constant := 16#10000#;         --  winver.h:40
   VOS_OS216 : constant := 16#20000#;         --  winver.h:41
   VOS_OS232 : constant := 16#30000#;         --  winver.h:42
   VOS_NT : constant := 16#40000#;         --  winver.h:43
   VOS_BASE : constant := 16#0#;             --  winver.h:45
   VOS_WINDOWS16 : constant := 16#1#;             --  winver.h:46
   VOS_PM16 : constant := 16#2#;             --  winver.h:47
   VOS_PM32 : constant := 16#3#;             --  winver.h:48
   VOS_WINDOWS32 : constant := 16#4#;             --  winver.h:49
   VOS_DOS_WINDOWS16 : constant := 16#10001#;         --  winver.h:51
   VOS_DOS_WINDOWS32 : constant := 16#10004#;         --  winver.h:52
   VOS_OS216_PM16 : constant := 16#20002#;         --  winver.h:53
   VOS_OS232_PM32 : constant := 16#30003#;         --  winver.h:54
   VOS_NT_WINDOWS32 : constant := 16#40004#;         --  winver.h:55
   VFT_UNKNOWN : constant := 16#0#;             --  winver.h:58
   VFT_APP : constant := 16#1#;             --  winver.h:59
   VFT_DLL : constant := 16#2#;             --  winver.h:60
   VFT_DRV : constant := 16#3#;             --  winver.h:61
   VFT_FONT : constant := 16#4#;             --  winver.h:62
   VFT_VXD : constant := 16#5#;             --  winver.h:63
   VFT_STATIC_LIB : constant := 16#7#;             --  winver.h:64
   VFT2_UNKNOWN : constant := 16#0#;             --  winver.h:67
   VFT2_DRV_PRINTER : constant := 16#1#;             --  winver.h:68
   VFT2_DRV_KEYBOARD : constant := 16#2#;             --  winver.h:69
   VFT2_DRV_LANGUAGE : constant := 16#3#;             --  winver.h:70
   VFT2_DRV_DISPLAY : constant := 16#4#;             --  winver.h:71
   VFT2_DRV_MOUSE : constant := 16#5#;             --  winver.h:72
   VFT2_DRV_NETWORK : constant := 16#6#;             --  winver.h:73
   VFT2_DRV_SYSTEM : constant := 16#7#;             --  winver.h:74
   VFT2_DRV_INSTALLABLE : constant := 16#8#;             --  winver.h:75
   VFT2_DRV_SOUND : constant := 16#9#;             --  winver.h:76
   VFT2_DRV_COMM : constant := 16#a#;             --  winver.h:77
   VFT2_FONT_RASTER : constant := 16#1#;             --  winver.h:80
   VFT2_FONT_VECTOR : constant := 16#2#;             --  winver.h:81
   VFT2_FONT_TRUETYPE : constant := 16#3#;             --  winver.h:82
   VFFF_ISSHAREDFILE : constant := 16#1#;             --  winver.h:85
   VFF_CURNEDEST : constant := 16#1#;             --  winver.h:87
   VFF_FILEINUSE : constant := 16#2#;             --  winver.h:88
   VFF_BUFFTOOSMALL : constant := 16#4#;             --  winver.h:89
   VIFF_FORCEINSTALL : constant := 16#1#;             --  winver.h:92
   VIFF_DONTDELETEOLD : constant := 16#2#;             --  winver.h:93
   VIF_TEMPFILE : constant := 16#1#;             --  winver.h:95
   VIF_MISMATCH : constant := 16#2#;             --  winver.h:96
   VIF_SRCOLD : constant := 16#4#;             --  winver.h:97
   VIF_DIFFLANG : constant := 16#8#;             --  winver.h:99
   VIF_DIFFCODEPG : constant := 16#10#;            --  winver.h:100
   VIF_DIFFTYPE : constant := 16#20#;            --  winver.h:101
   VIF_WRITEPROT : constant := 16#40#;            --  winver.h:103
   VIF_FILEINUSE : constant := 16#80#;            --  winver.h:104
   VIF_OUTOFSPACE : constant := 16#100#;           --  winver.h:105
   VIF_ACCESSVIOLATION : constant := 16#200#;           --  winver.h:106
   VIF_SHARINGVIOLATION : constant := 16#400#;           --  winver.h:107
   VIF_CANNOTCREATE : constant := 16#800#;           --  winver.h:108
   VIF_CANNOTDELETE : constant := 16#1000#;          --  winver.h:109
   VIF_CANNOTRENAME : constant := 16#2000#;          --  winver.h:110
   VIF_CANNOTDELETECUR : constant := 16#4000#;          --  winver.h:111
   VIF_OUTOFMEMORY : constant := 16#8000#;          --  winver.h:112
   VIF_CANNOTREADSRC : constant := 16#10000#;         --  winver.h:114
   VIF_CANNOTREADDST : constant := 16#20000#;         --  winver.h:115
   VIF_BUFFTOOSMALL : constant := 16#40000#;         --  winver.h:117

   type VS_FIXEDFILEINFO;                                  --  winver.h:123

   type VS_FIXEDFILEINFO is                                --  winver.h:123
      record
         dwSignature : Win32.DWORD;                --  winver.h:125
         dwStrucVersion : Win32.DWORD;                --  winver.h:126
         dwFileVersionMS : Win32.DWORD;                --  winver.h:127
         dwFileVersionLS : Win32.DWORD;                --  winver.h:128
         dwProductVersionMS : Win32.DWORD;                --  winver.h:129
         dwProductVersionLS : Win32.DWORD;                --  winver.h:130
         dwFileFlagsMask : Win32.DWORD;                --  winver.h:131
         dwFileFlags : Win32.DWORD;                --  winver.h:132
         dwFileOS : Win32.DWORD;                --  winver.h:133
         dwFileType : Win32.DWORD;                --  winver.h:134
         dwFileSubtype : Win32.DWORD;                --  winver.h:135
         dwFileDateMS : Win32.DWORD;                --  winver.h:136
         dwFileDateLS : Win32.DWORD;                --  winver.h:137
      end record;

   function VerFindFileA (uFlags : Win32.DWORD;
                          szFileName : Win32.LPSTR;
                          szWinDir : Win32.LPSTR;
                          szAppDir : Win32.LPSTR;
                          szCurDir : Win32.LPSTR;
                          lpuCurDirLen : Win32.PUINT;
                          szDestDir : Win32.LPSTR;
                          lpuDestDirLen : Win32.PUINT)
                         return Win32.DWORD; --  winver.h:144

   function VerFindFile (uFlags : Win32.DWORD;
                         szFileName : Win32.LPSTR;
                         szWinDir : Win32.LPSTR;
                         szAppDir : Win32.LPSTR;
                         szCurDir : Win32.LPSTR;
                         lpuCurDirLen : Win32.PUINT;
                         szDestDir : Win32.LPSTR;
                         lpuDestDirLen : Win32.PUINT)
                        return Win32.DWORD
     renames VerFindFileA;
   --  winver.h:144

   function VerFindFileW (uFlags : Win32.DWORD;
                          szFileName : Win32.LPWSTR;
                          szWinDir : Win32.LPWSTR;
                          szAppDir : Win32.LPWSTR;
                          szCurDir : Win32.LPWSTR;
                          lpuCurDirLen : Win32.PUINT;
                          szDestDir : Win32.LPWSTR;
                          lpuDestDirLen : Win32.PUINT)
                         return Win32.DWORD; --  winver.h:156

   function VerInstallFileA (uFlags : Win32.DWORD;
                             szSrcFileName : Win32.LPSTR;
                             szDestFileName : Win32.LPSTR;
                             szSrcDir : Win32.LPSTR;
                             szDestDir : Win32.LPSTR;
                             szCurDir : Win32.LPSTR;
                             szTmpFile : Win32.LPSTR;
                             lpuTmpFileLen : Win32.PUINT)
                            return Win32.DWORD;
   --  winver.h:174

   function VerInstallFile (uFlags : Win32.DWORD;
                            szSrcFileName : Win32.LPSTR;
                            szDestFileName : Win32.LPSTR;
                            szSrcDir : Win32.LPSTR;
                            szDestDir : Win32.LPSTR;
                            szCurDir : Win32.LPSTR;
                            szTmpFile : Win32.LPSTR;
                            lpuTmpFileLen : Win32.PUINT)
                           return Win32.DWORD
     renames VerInstallFileA;
   --  winver.h:174

   function VerInstallFileW (uFlags : Win32.DWORD;
                             szSrcFileName : Win32.LPWSTR;
                             szDestFileName : Win32.LPWSTR;
                             szSrcDir : Win32.LPWSTR;
                             szDestDir : Win32.LPWSTR;
                             szCurDir : Win32.LPWSTR;
                             szTmpFile : Win32.LPWSTR;
                             lpuTmpFileLen : Win32.PUINT)
                            return Win32.DWORD;
   --  winver.h:186

   function GetFileVersionInfoSizeA (lptstrFilename : Win32.LPSTR;
                                     lpdwHandle : Win32.LPDWORD)
                                    return Win32.DWORD;
   --  winver.h:205

   function GetFileVersionInfoSize
     (lptstrFilename : Win32.LPSTR;
      lpdwHandle : Win32.LPDWORD)
     return Win32.DWORD
     renames GetFileVersionInfoSizeA;    --  winver.h:205

   function GetFileVersionInfoSizeW (lptstrFilename : Win32.LPWSTR;
                                     lpdwHandle : Win32.LPDWORD)
                                    return Win32.DWORD;
   --  winver.h:212

   function GetFileVersionInfoA (lptstrFilename : Win32.LPSTR;
                                 dwHandle : Win32.DWORD;
                                 dwLen : Win32.DWORD;
                                 lpData : Win32.LPVOID)
                                return Win32.BOOL;
   --  winver.h:225

   function GetFileVersionInfo (lptstrFilename : Win32.LPSTR;
                                dwHandle : Win32.DWORD;
                                dwLen : Win32.DWORD;
                                lpData : Win32.LPVOID)
                               return Win32.BOOL
     renames GetFileVersionInfoA;
   --  winver.h:225

   function GetFileVersionInfoW (lptstrFilename : Win32.LPWSTR;
                                 dwHandle : Win32.DWORD;
                                 dwLen : Win32.DWORD;
                                 lpData : Win32.LPVOID)
                                return Win32.BOOL;
   --  winver.h:234

   function VerLanguageNameA (wLang : Win32.DWORD;
                              szLang : Win32.LPSTR;
                              nSize : Win32.DWORD)
                             return Win32.DWORD;   --  winver.h:248

   function VerLanguageName (wLang : Win32.DWORD;
                             szLang : Win32.LPSTR;
                             nSize : Win32.DWORD)
                            return Win32.DWORD
     renames VerLanguageNameA;
   --  winver.h:248

   function VerLanguageNameW (wLang : Win32.DWORD;
                              szLang : Win32.LPWSTR;
                              nSize : Win32.DWORD)
                             return Win32.DWORD;   --  winver.h:255

   function VerQueryValueA (pBlock : Win32.LPVOID;
                            lpSubBlock : Win32.LPSTR;
                            lplpBuffer : access Win32.LPVOID;
                            puLen : Win32.PUINT)
                           return Win32.BOOL;  --  winver.h:268

   function VerQueryValue (pBlock : Win32.LPVOID;
                           lpSubBlock : Win32.LPSTR;
                           lplpBuffer : access Win32.LPVOID;
                           puLen : Win32.PUINT)
                          return Win32.BOOL
     renames VerQueryValueA;
   --  winver.h:268

   function VerQueryValueW (pBlock : Win32.LPVOID;
                            lpSubBlock : Win32.LPWSTR;
                            lplpBuffer : access Win32.LPVOID;
                            puLen : Win32.PUINT)
                           return Win32.BOOL;  --  winver.h:276

private

   pragma Convention (C, VS_FIXEDFILEINFO);                 --  winver.h:123

   pragma Import (Stdcall, VerFindFileA, "VerFindFileA");
   --  winver.h:144
   pragma Import (Stdcall, VerFindFileW, "VerFindFileW");
   --  winver.h:156
   pragma Import (Stdcall, VerInstallFileA, "VerInstallFileA");
   --  winver.h:174
   pragma Import (Stdcall, VerInstallFileW, "VerInstallFileW");
   --  winver.h:186
   pragma Import (Stdcall, GetFileVersionInfoSizeA, "GetFileVersionInfoSizeA");
   --  winver.h:205
   pragma Import (Stdcall, GetFileVersionInfoSizeW, "GetFileVersionInfoSizeW");
   --  winver.h:212
   pragma Import (Stdcall, GetFileVersionInfoA, "GetFileVersionInfoA");
   --  winver.h:225
   pragma Import (Stdcall, GetFileVersionInfoW, "GetFileVersionInfoW");
   --  winver.h:234
   pragma Import (Stdcall, VerLanguageNameA, "VerLanguageNameA");
   --  winver.h:248
   pragma Import (Stdcall, VerLanguageNameW, "VerLanguageNameW");
   --  winver.h:255
   pragma Import (Stdcall, VerQueryValueA, "VerQueryValueA");
   --  winver.h:268
   pragma Import (Stdcall, VerQueryValueW, "VerQueryValueW");
   --  winver.h:276

end Win32.Winver;
