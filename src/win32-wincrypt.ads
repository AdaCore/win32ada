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
--  Copyright (C) 2014, AdaCore
--
-------------------------------------------------------------------------------

package Win32.WinCrypt is

   CRYPT_VERIFYCONTEXT              : constant := 16#f0000000#;
   CRYPT_NEWKEYSET                  : constant := 16#8#;
   CRYPT_DELETEKEYSET               : constant := 16#10#;
   CRYPT_MACHINE_KEYSET             : constant := 16#20#;
   CRYPT_SILENT                     : constant := 16#40#;
   CRYPT_DEFAULT_CONTAINER_OPTIONAL : constant := 16#80#;

   type HCRYPTPROV is new System.Address;

   function CryptGenRandom
     (hProv    : HCRYPTPROV;
      dwLen    : DWORD;
      pbBuffer : access BYTE) return BOOL;

   function CryptAcquireContextA
     (phProv       : access HCRYPTPROV;
      pszContainer : LPCSTR;
      pszProvider  : LPCSTR;
      dwProvType   : DWORD;
      dwFlags      : DWORD) return BOOL;

   function CryptAcquireContext
     (phProv       : access HCRYPTPROV;
      pszContainer : LPCSTR;
      pszProvider  : LPCSTR;
      dwProvType   : DWORD;
      dwFlags      : DWORD) return BOOL renames CryptAcquireContextA;

   function CryptAcquireContextW
     (phProv       : access HCRYPTPROV;
      pszContainer : LPCSTR;
      pszProvider  : LPCSTR;
      dwProvType   : DWORD;
      dwFlags      : DWORD) return BOOL;

   function CryptReleaseContext
     (phProv  : HCRYPTPROV;
      dwFlags : DWORD) return BOOL;

private

   pragma Import (Stdcall, CryptGenRandom, "CryptGenRandom");
   pragma Import (Stdcall, CryptAcquireContextA, "CryptAcquireContextA");
   pragma Import (Stdcall, CryptAcquireContextW, "CryptAcquireContextW");
   pragma Import (Stdcall, CryptReleaseContext, "CryptReleaseContext");

end Win32.WinCrypt;
