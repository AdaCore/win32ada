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

with Stdarg;
with Win32;

package Win32.crt.Conio is

   function cgets (buffer : Win32.PSTR) return Win32.PSTR;

   function cputs (string : Win32.PCSTR) return Win32.INT;

   function putch (c : Win32.INT) return Win32.INT;

   function ungetch (c : Win32.INT) return Win32.INT;

   function cprintf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function cscanf
     (format : Win32.PCSTR;
      args   : Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function getch return Win32.INT;

   function getche return Win32.INT;

   function kbhit return Win32.INT;

private

   pragma Import (C, cgets, "_cgets");
   pragma Import (C, cputs, "_cputs");
   pragma Import (C, putch, "_putch");
   pragma Import (C, ungetch, "_ungetch");
   pragma Import (C, getch, "_getch");
   pragma Import (C, getche, "_getche");
   pragma Import (C, kbhit, "_kbhit");

end Win32.crt.Conio;
