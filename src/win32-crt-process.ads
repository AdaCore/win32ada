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

package Win32.crt.Process is

   P_WAIT          : constant := 0;
   P_NOWAIT        : constant := 1;
   P_OVERLAY       : constant := 2;
   OLD_P_OVERLAY   : constant := 2;
   P_NOWAITO       : constant := 3;
   P_DETACH        : constant := 4;
   WAIT_CHILD      : constant := 0;
   WAIT_GRANDCHILD : constant := 1;

   type String_Vector is
     array (0 .. Win32.ANYSIZE_ARRAY) of aliased Win32.PSTR;
   type String_Vector_Access is access all String_Vector;

   type Start_Addr is access procedure (Arg : Win32.PVOID);
   pragma Convention (Stdcall, Start_Addr);

   function beginthread
     (start_address : Start_Addr;
      stack_size    : Win32.UINT;
      arglist       : String_Vector_Access)
      return Win32.ULONG;

   procedure endthread;

   procedure c_abort;

   procedure cexit;

   procedure c_exit;

   function cwait
     (termstat       : Win32.PINT;
      procid, action : Win32.INT)
      return Win32.INT;

   function execl
     (cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function execle
     (cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty;
      env     : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function execlp
     (cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function execlpe
     (cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty;
      env     : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function execv
     (cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access)
      return Win32.INT;

   function execve
     (cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access;
      env     : in String_Vector_Access)
      return Win32.INT;

   function execvp
     (cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access)
      return Win32.INT;

   function execvpe
     (cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access;
      env     : in String_Vector_Access)
      return Win32.INT;

   procedure exit_program (status : Win32.INT);

   procedure exit_program_now (status : Win32.INT);

   function getpid return Win32.INT;

   function spawnl
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function spawnle
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty;
      env     : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function spawnlp
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function spawnlpe
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in Stdarg.ArgList := Stdarg.Empty;
      env     : in Stdarg.ArgList := Stdarg.Empty)
      return Win32.INT;

   function spawnv
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access)
      return Win32.INT;

   function spawnve
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access;
      env     : in String_Vector_Access)
      return Win32.INT;

   function spawnvp
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access)
      return Win32.INT;

   function spawnvpe
     (mode    : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args    : in String_Vector_Access;
      env     : in String_Vector_Access)
      return Win32.INT;

   function system (p1 : Win32.PCSTR) return Win32.INT;

   function loaddll (p1 : Win32.PSTR) return Win32.INT;

   function unloaddll (p1 : Win32.INT) return Win32.INT;

   function getdllprocaddr
     (p1   : Win32.INT;
      p2   : Win32.PSTR;
      p3   : Win32.INT)
      return Win32.PCVOID;

private

   pragma Import (C, beginthread, "_beginthread");
   pragma Import (C, endthread, "_endthread");
   pragma Import (C, c_abort, "abort");
   pragma Import (C, cexit, "_cexit");
   pragma Import (C, c_exit, "_c_exit");
   pragma Import (C, cwait, "_cwait");
   pragma Import (C, execv, "_execv");
   pragma Import (C, execve, "_execve");
   pragma Import (C, execvp, "_execvp");
   pragma Import (C, execvpe, "_execvpe");
   pragma Import (C, exit_program, "exit");
   pragma Import (C, exit_program_now, "_exit");
   pragma Import (C, getpid, "_getpid");
   pragma Import (C, spawnv, "_spawnv");
   pragma Import (C, spawnve, "_spawnve");
   pragma Import (C, spawnvp, "_spawnvp");
   pragma Import (C, spawnvpe, "_spawnvpe");
   pragma Import (C, system, "system");
   pragma Import (C, loaddll, "_loaddll");
   pragma Import (C, unloaddll, "_unloaddll");
   pragma Import (C, getdllprocaddr, "_getdllprocaddr");

end Win32.crt.Process;
