--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-conio.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
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

with Stdarg;
with Win32;

package Win32.crt.Conio is

   function cgets (buffer : Win32.PSTR) return Win32.PSTR;   --  conio.h :46

   function cputs (string : Win32.PCSTR)
                  return Win32.INT;                          --  conio.h :47

   function putch (c : Win32.INT) return Win32.INT;          --  conio.h :48

   function ungetch (c : Win32.INT) return Win32.INT;        --  conio.h :49

   function cprintf
     (format : Win32.PCSTR;
      args : Stdarg.ArgList :=  Stdarg.Empty) return Win32.INT;
   --  conio.h :51

   function cscanf
     (format : Win32.PCSTR;
      args : Stdarg.ArgList :=  Stdarg.Empty) return Win32.INT;
   --  conio.h :52

   function getch return Win32.INT;                        --  conio.h :54

   function getche return Win32.INT;                       --  conio.h :55

   function kbhit return Win32.INT;                        --  conio.h :56

private

   pragma Import (C, cgets, "_cgets");                      --  conio.h :46
   pragma Import (C, cputs, "_cputs");                      --  conio.h :47
   pragma Import (C, putch, "_putch");                      --  conio.h :48
   pragma Import (C, ungetch, "_ungetch");                  --  conio.h :49
   pragma Import (C, getch, "_getch");                      --  conio.h :54
   pragma Import (C, getche, "_getche");                    --  conio.h :55
   pragma Import (C, kbhit, "_kbhit");                      --  conio.h :56

end Win32.crt.Conio;


