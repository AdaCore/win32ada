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

package Win32.Lmapibuf is

   function NetApiBufferAllocate
     (ByteCount : Win32.DWORD;
      Buffer    : access Win32.LPVOID)
      return Win32.DWORD;

   function NetApiBufferFree (Buffer : Win32.LPVOID) return Win32.DWORD;

   function NetApiBufferReallocate
     (OldBuffer    : Win32.LPVOID;
      NewByteCount : Win32.DWORD;
      NewBuffer    : access Win32.LPVOID)
      return Win32.DWORD;

   function NetApiBufferSize
     (Buffer    : Win32.LPVOID;
      ByteCount : Win32.LPDWORD)
      return Win32.DWORD;

   function NetapipBufferAllocate
     (ByteCount : Win32.DWORD;
      Buffer    : access Win32.LPVOID)
      return Win32.DWORD;

private

   pragma Import (Stdcall, NetApiBufferAllocate, "NetApiBufferAllocate");
   pragma Import (Stdcall, NetApiBufferFree, "NetApiBufferFree");
   pragma Import (Stdcall, NetApiBufferReallocate, "NetApiBufferReallocate");
   pragma Import (Stdcall, NetApiBufferSize, "NetApiBufferSize");
   pragma Import (Stdcall, NetapipBufferAllocate, "NetapipBufferAllocate");

end Win32.Lmapibuf;
