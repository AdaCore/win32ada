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

with Stdarg;

package Win32.crt.Process is

   P_WAIT : constant := 0;                        --  process.h:54
   P_NOWAIT : constant := 1;                        --  process.h:55
   P_OVERLAY : constant := 2;                        --  process.h:57
   OLD_P_OVERLAY : constant := 2;                        --  process.h:61
   P_NOWAITO : constant := 3;                        --  process.h:62
   P_DETACH : constant := 4;                        --  process.h:63
   WAIT_CHILD : constant := 0;                        --  process.h:69
   WAIT_GRANDCHILD : constant := 1;                        --  process.h:70

   --  Use the extensible-arrays package to get one of these that is bigger.
   --  Be sure to put a null pointer as the last array element.
   type String_Vector is array (0 .. Win32.ANYSIZE_ARRAY)
     of aliased Win32.PSTR;
   type String_Vector_Access is access all String_Vector;

   type Start_Addr is access procedure (Arg : Win32.PVOID);
   pragma Convention (Stdcall, Start_Addr);

   function beginthread (start_address : Start_Addr;
                         stack_size : Win32.UINT;
                         arglist : String_Vector_Access)
                        return Win32.ULONG;            --  process.h:76

   procedure endthread;                                    --  process.h:78

   procedure c_abort;                                      --  process.h:80

   procedure cexit;                                        --  process.h:81

   procedure c_exit;                                       --  process.h:82

   function cwait
     (termstat : Win32.PINT;                               --  out Win32.INT
      procid,
        action : Win32.INT) return Win32.INT;              --  process.h:83

   function execl
     (cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty)
     return Win32.INT;                                   --  process.h:84

   function execle
     (cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty;
      env : in Stdarg.ArgList := Stdarg.Empty)
     return Win32.INT;                                   --  process.h:85

   function execlp
     (cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty)
     return Win32.INT;                                   --  process.h:86

   function execlpe
     (cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty;
      env : in Stdarg.ArgList := Stdarg.Empty)
     return Win32.INT;                                   --  process.h:87

   function execv
     (cmdname : in Win32.PCSTR;
      args : in String_Vector_Access)
     return Win32.INT;                                   --  process.h:88

   function execve
     (cmdname : in Win32.PCSTR;
      args : in String_Vector_Access;
      env : in String_Vector_Access)
     return Win32.INT;                                   --  process.h:89

   function execvp
     (cmdname : in Win32.PCSTR;
      args : in String_Vector_Access)
     return Win32.INT;                                   --  process.h:90

   function execvpe
     (cmdname : in Win32.PCSTR;
      args : in String_Vector_Access;
      env : in String_Vector_Access)
     return Win32.INT;                                   --  process.h:91

   procedure exit_program (status : Win32.INT);              --  process.h:92

   procedure exit_program_now (status : Win32.INT);          --  process.h:93

   function getpid return Win32.INT;                       --  process.h:94

   function spawnl
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty) return Win32.INT;
   --  process.h:95

   function spawnle
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty;
      env : in Stdarg.ArgList := Stdarg.Empty) return Win32.INT;
   --  process.h:96

   function spawnlp
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty) return Win32.INT;
   --  process.h:97

   function spawnlpe
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in Stdarg.ArgList := Stdarg.Empty;
      env : in Stdarg.ArgList := Stdarg.Empty) return Win32.INT;
   --  process.h:98

   function spawnv
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in String_Vector_Access) return Win32.INT;
   --  process.h:99

   function spawnve
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in String_Vector_Access;
      env : in String_Vector_Access) return Win32.INT;
   --  process.h:100

   function spawnvp
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in String_Vector_Access) return Win32.INT;
   --  process.h:102

   function spawnvpe
     (mode : in Win32.INT;
      cmdname : in Win32.PCSTR;
      args : in String_Vector_Access;
      env : in String_Vector_Access) return Win32.INT;
   --  process.h:103

   function system (p1 : Win32.PCSTR)
                   return Win32.INT;                          --  process.h:105

   function loaddll (p1 : Win32.PSTR) return Win32.INT;
   --  process.h:106

   function unloaddll (p1 : Win32.INT)
                      return Win32.INT;                       --  process.h:107

   function getdllprocaddr (p1 : Win32.INT;
                            p2 : Win32.PSTR;
                            p3 : Win32.INT)
                           return Win32.PCVOID;               --  process.h:108

private

   pragma Import (C, beginthread, "_beginthread");          --  process.h:76
   pragma Import (C, endthread, "_endthread");              --  process.h:78
   pragma Import (C, c_abort, "abort");                     --  process.h:80
   pragma Import (C, cexit, "_cexit");                      --  process.h:81
   pragma Import (C, c_exit, "_c_exit");                    --  process.h:82
   pragma Import (C, cwait, "_cwait");                      --  process.h:83
   pragma Import (C, execv, "_execv");                      --  process.h:88
   pragma Import (C, execve, "_execve");                    --  process.h:89
   pragma Import (C, execvp, "_execvp");                    --  process.h:90
   pragma Import (C, execvpe, "_execvpe");                  --  process.h:91
   pragma Import (C, exit_program, "exit");                 --  process.h:92
   pragma Import (C, exit_program_now, "_exit");            --  process.h:93
   pragma Import (C, getpid, "_getpid");                    --  process.h:94
   pragma Import (C, spawnv, "_spawnv");                    --  process.h:99
   pragma Import (C, spawnve, "_spawnve");                  --  process.h:100
   pragma Import (C, spawnvp, "_spawnvp");                  --  process.h:102
   pragma Import (C, spawnvpe, "_spawnvpe");                --  process.h:103
   pragma Import (C, system, "system");                     --  process.h:105
   pragma Import (C, loaddll, "_loaddll");                  --  process.h:106
   pragma Import (C, unloaddll, "_unloaddll");              --  process.h:107
   pragma Import (C, getdllprocaddr, "_getdllprocaddr");    --  process.h:108

end Win32.crt.Process;


