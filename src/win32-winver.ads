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

with Win32.Winuser;

package Win32.Winver is

   VS_FILE_INFO         : Win32.LPSTR renames Win32.Winuser.RT_VERSION;
   VS_VERSION_INFO      : constant := 1;
   VS_USER_DEFINED      : constant := 100;
   VS_FFI_SIGNATURE     : constant := 16#feef04bd#;
   VS_FFI_STRUCVERSION  : constant := 16#10000#;
   VS_FFI_FILEFLAGSMASK : constant := 16#3f#;
   VS_FF_DEBUG          : constant := 16#1#;
   VS_FF_PRERELEASE     : constant := 16#2#;
   VS_FF_PATCHED        : constant := 16#4#;
   VS_FF_PRIVATEBUILD   : constant := 16#8#;
   VS_FF_INFOINFERRED   : constant := 16#10#;
   VS_FF_SPECIALBUILD   : constant := 16#20#;
   VOS_UNKNOWN          : constant := 16#0#;
   VOS_DOS              : constant := 16#10000#;
   VOS_OS216            : constant := 16#20000#;
   VOS_OS232            : constant := 16#30000#;
   VOS_NT               : constant := 16#40000#;
   VOS_BASE             : constant := 16#0#;
   VOS_WINDOWS16        : constant := 16#1#;
   VOS_PM16             : constant := 16#2#;
   VOS_PM32             : constant := 16#3#;
   VOS_WINDOWS32        : constant := 16#4#;
   VOS_DOS_WINDOWS16    : constant := 16#10001#;
   VOS_DOS_WINDOWS32    : constant := 16#10004#;
   VOS_OS216_PM16       : constant := 16#20002#;
   VOS_OS232_PM32       : constant := 16#30003#;
   VOS_NT_WINDOWS32     : constant := 16#40004#;
   VFT_UNKNOWN          : constant := 16#0#;
   VFT_APP              : constant := 16#1#;
   VFT_DLL              : constant := 16#2#;
   VFT_DRV              : constant := 16#3#;
   VFT_FONT             : constant := 16#4#;
   VFT_VXD              : constant := 16#5#;
   VFT_STATIC_LIB       : constant := 16#7#;
   VFT2_UNKNOWN         : constant := 16#0#;
   VFT2_DRV_PRINTER     : constant := 16#1#;
   VFT2_DRV_KEYBOARD    : constant := 16#2#;
   VFT2_DRV_LANGUAGE    : constant := 16#3#;
   VFT2_DRV_DISPLAY     : constant := 16#4#;
   VFT2_DRV_MOUSE       : constant := 16#5#;
   VFT2_DRV_NETWORK     : constant := 16#6#;
   VFT2_DRV_SYSTEM      : constant := 16#7#;
   VFT2_DRV_INSTALLABLE : constant := 16#8#;
   VFT2_DRV_SOUND       : constant := 16#9#;
   VFT2_DRV_COMM        : constant := 16#a#;
   VFT2_FONT_RASTER     : constant := 16#1#;
   VFT2_FONT_VECTOR     : constant := 16#2#;
   VFT2_FONT_TRUETYPE   : constant := 16#3#;
   VFFF_ISSHAREDFILE    : constant := 16#1#;
   VFF_CURNEDEST        : constant := 16#1#;
   VFF_FILEINUSE        : constant := 16#2#;
   VFF_BUFFTOOSMALL     : constant := 16#4#;
   VIFF_FORCEINSTALL    : constant := 16#1#;
   VIFF_DONTDELETEOLD   : constant := 16#2#;
   VIF_TEMPFILE         : constant := 16#1#;
   VIF_MISMATCH         : constant := 16#2#;
   VIF_SRCOLD           : constant := 16#4#;
   VIF_DIFFLANG         : constant := 16#8#;
   VIF_DIFFCODEPG       : constant := 16#10#;
   VIF_DIFFTYPE         : constant := 16#20#;
   VIF_WRITEPROT        : constant := 16#40#;
   VIF_FILEINUSE        : constant := 16#80#;
   VIF_OUTOFSPACE       : constant := 16#100#;
   VIF_ACCESSVIOLATION  : constant := 16#200#;
   VIF_SHARINGVIOLATION : constant := 16#400#;
   VIF_CANNOTCREATE     : constant := 16#800#;
   VIF_CANNOTDELETE     : constant := 16#1000#;
   VIF_CANNOTRENAME     : constant := 16#2000#;
   VIF_CANNOTDELETECUR  : constant := 16#4000#;
   VIF_OUTOFMEMORY      : constant := 16#8000#;
   VIF_CANNOTREADSRC    : constant := 16#10000#;
   VIF_CANNOTREADDST    : constant := 16#20000#;
   VIF_BUFFTOOSMALL     : constant := 16#40000#;

   type VS_FIXEDFILEINFO;

   type VS_FIXEDFILEINFO is record
      dwSignature        : Win32.DWORD;
      dwStrucVersion     : Win32.DWORD;
      dwFileVersionMS    : Win32.DWORD;
      dwFileVersionLS    : Win32.DWORD;
      dwProductVersionMS : Win32.DWORD;
      dwProductVersionLS : Win32.DWORD;
      dwFileFlagsMask    : Win32.DWORD;
      dwFileFlags        : Win32.DWORD;
      dwFileOS           : Win32.DWORD;
      dwFileType         : Win32.DWORD;
      dwFileSubtype      : Win32.DWORD;
      dwFileDateMS       : Win32.DWORD;
      dwFileDateLS       : Win32.DWORD;
   end record;

   function VerFindFileA
     (uFlags        : Win32.DWORD;
      szFileName    : Win32.LPSTR;
      szWinDir      : Win32.LPSTR;
      szAppDir      : Win32.LPSTR;
      szCurDir      : Win32.LPSTR;
      lpuCurDirLen  : Win32.PUINT;
      szDestDir     : Win32.LPSTR;
      lpuDestDirLen : Win32.PUINT)
      return Win32.DWORD;

   function VerFindFile
     (uFlags        : Win32.DWORD;
      szFileName    : Win32.LPSTR;
      szWinDir      : Win32.LPSTR;
      szAppDir      : Win32.LPSTR;
      szCurDir      : Win32.LPSTR;
      lpuCurDirLen  : Win32.PUINT;
      szDestDir     : Win32.LPSTR;
      lpuDestDirLen : Win32.PUINT)
      return Win32.DWORD renames VerFindFileA;

   function VerFindFileW
     (uFlags        : Win32.DWORD;
      szFileName    : Win32.LPWSTR;
      szWinDir      : Win32.LPWSTR;
      szAppDir      : Win32.LPWSTR;
      szCurDir      : Win32.LPWSTR;
      lpuCurDirLen  : Win32.PUINT;
      szDestDir     : Win32.LPWSTR;
      lpuDestDirLen : Win32.PUINT)
      return Win32.DWORD;

   function VerInstallFileA
     (uFlags         : Win32.DWORD;
      szSrcFileName  : Win32.LPSTR;
      szDestFileName : Win32.LPSTR;
      szSrcDir       : Win32.LPSTR;
      szDestDir      : Win32.LPSTR;
      szCurDir       : Win32.LPSTR;
      szTmpFile      : Win32.LPSTR;
      lpuTmpFileLen  : Win32.PUINT)
      return Win32.DWORD;

   function VerInstallFile
     (uFlags         : Win32.DWORD;
      szSrcFileName  : Win32.LPSTR;
      szDestFileName : Win32.LPSTR;
      szSrcDir       : Win32.LPSTR;
      szDestDir      : Win32.LPSTR;
      szCurDir       : Win32.LPSTR;
      szTmpFile      : Win32.LPSTR;
      lpuTmpFileLen  : Win32.PUINT)
      return Win32.DWORD renames VerInstallFileA;

   function VerInstallFileW
     (uFlags         : Win32.DWORD;
      szSrcFileName  : Win32.LPWSTR;
      szDestFileName : Win32.LPWSTR;
      szSrcDir       : Win32.LPWSTR;
      szDestDir      : Win32.LPWSTR;
      szCurDir       : Win32.LPWSTR;
      szTmpFile      : Win32.LPWSTR;
      lpuTmpFileLen  : Win32.PUINT)
      return Win32.DWORD;

   function GetFileVersionInfoSizeA
     (lptstrFilename : Win32.LPSTR;
      lpdwHandle     : Win32.LPDWORD)
      return Win32.DWORD;

   function GetFileVersionInfoSize
     (lptstrFilename : Win32.LPSTR;
      lpdwHandle     : Win32.LPDWORD)
      return Win32.DWORD renames GetFileVersionInfoSizeA;

   function GetFileVersionInfoSizeW
     (lptstrFilename : Win32.LPWSTR;
      lpdwHandle     : Win32.LPDWORD)
      return Win32.DWORD;

   function GetFileVersionInfoA
     (lptstrFilename : Win32.LPSTR;
      dwHandle       : Win32.DWORD;
      dwLen          : Win32.DWORD;
      lpData         : Win32.LPVOID)
      return Win32.BOOL;

   function GetFileVersionInfo
     (lptstrFilename : Win32.LPSTR;
      dwHandle       : Win32.DWORD;
      dwLen          : Win32.DWORD;
      lpData         : Win32.LPVOID)
      return Win32.BOOL renames GetFileVersionInfoA;

   function GetFileVersionInfoW
     (lptstrFilename : Win32.LPWSTR;
      dwHandle       : Win32.DWORD;
      dwLen          : Win32.DWORD;
      lpData         : Win32.LPVOID)
      return Win32.BOOL;

   function VerLanguageNameA
     (wLang  : Win32.DWORD;
      szLang : Win32.LPSTR;
      nSize  : Win32.DWORD)
      return Win32.DWORD;

   function VerLanguageName
     (wLang  : Win32.DWORD;
      szLang : Win32.LPSTR;
      nSize  : Win32.DWORD)
      return Win32.DWORD renames VerLanguageNameA;

   function VerLanguageNameW
     (wLang  : Win32.DWORD;
      szLang : Win32.LPWSTR;
      nSize  : Win32.DWORD)
      return Win32.DWORD;

   function VerQueryValueA
     (pBlock     : Win32.LPVOID;
      lpSubBlock : Win32.LPSTR;
      lplpBuffer : access Win32.LPVOID;
      puLen      : Win32.PUINT)
      return Win32.BOOL;

   function VerQueryValue
     (pBlock     : Win32.LPVOID;
      lpSubBlock : Win32.LPSTR;
      lplpBuffer : access Win32.LPVOID;
      puLen      : Win32.PUINT)
      return Win32.BOOL renames VerQueryValueA;

   function VerQueryValueW
     (pBlock     : Win32.LPVOID;
      lpSubBlock : Win32.LPWSTR;
      lplpBuffer : access Win32.LPVOID;
      puLen      : Win32.PUINT)
      return Win32.BOOL;

private

   pragma Convention (C, VS_FIXEDFILEINFO);

   pragma Import (Stdcall, VerFindFileA, "VerFindFileA");
   pragma Import (Stdcall, VerFindFileW, "VerFindFileW");
   pragma Import (Stdcall, VerInstallFileA, "VerInstallFileA");
   pragma Import (Stdcall, VerInstallFileW, "VerInstallFileW");
   pragma Import
     (Stdcall,
      GetFileVersionInfoSizeA,
      "GetFileVersionInfoSizeA");
   pragma Import
     (Stdcall,
      GetFileVersionInfoSizeW,
      "GetFileVersionInfoSizeW");
   pragma Import (Stdcall, GetFileVersionInfoA, "GetFileVersionInfoA");
   pragma Import (Stdcall, GetFileVersionInfoW, "GetFileVersionInfoW");
   pragma Import (Stdcall, VerLanguageNameA, "VerLanguageNameA");
   pragma Import (Stdcall, VerLanguageNameW, "VerLanguageNameW");
   pragma Import (Stdcall, VerQueryValueA, "VerQueryValueA");
   pragma Import (Stdcall, VerQueryValueW, "VerQueryValueW");

end Win32.Winver;
