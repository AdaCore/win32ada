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

package Win32.Utils is
   subtype BYTE is Win32.BYTE;
   subtype WORD is Win32.WORD;
   subtype DWORD is Win32.DWORD;

   function MAKEWORD (Low, High : BYTE) return WORD;

   function MAKELONG (Low, High : WORD) return DWORD;

   function LOWORD (L : DWORD) return WORD;

   function HIWORD (L : DWORD) return WORD;

   function LOBYTE (W : WORD) return BYTE;

   function HIBYTE (W : WORD) return BYTE;

private

   pragma Inline (MAKEWORD);
   pragma Inline (MAKELONG);
   pragma Inline (LOWORD);
   pragma Inline (HIWORD);
   pragma Inline (LOBYTE);
   pragma Inline (HIBYTE);

end Win32.Utils;
