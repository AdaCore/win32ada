--  $Source$
--  $Revision$ $Date$ $Author$
-------------------------------------------------------------------------------
--
--  THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS"
--  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
--  BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY
--  AND/OR FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the
--  entire risk as to the accuracy and the use of this file.
--
--  Copyright (c) Intermetrics, Inc. 1995
--  Royalty-free, unlimited, worldwide, non-exclusive use, modification,
--  reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------

with Interfaces.C; use Interfaces.C;
with Win32.Utils;
with Ada.Unchecked_Conversion;

package body Win32.Winsock is

   pragma Warnings (Off);

   procedure FD_CLR (fd : SOCKET;
                     set : access FD_SET) is                 --  winsock.h:75
      i : Integer := 0;
   begin
      while (i < Integer (set.all.fd_count)) loop
         if (set.all.fd_array (i) = fd) then
            while (i < Integer (set.all.fd_count - 1)) loop
               set.all.fd_array (i) := set.all.fd_array (i + 1);
               i := i + 1;
            end loop;
            set.all.fd_count := set.all.fd_count - 1;
            exit;
         end if;
      end loop;
   end FD_CLR;

   procedure FD_SET_PROC (fd : SOCKET;
                          set : access FD_SET) is            --  winsock.h:90
   begin
      if (set.all.fd_count < FD_SETSIZE) then
         set.all.fd_array (Integer (set.all.fd_count)) := fd;
         set.all.fd_count := set.all.fd_count + 1;
      end if;
   end FD_SET_PROC;

   procedure FD_ZERO (set : access FD_SET);
   procedure FD_ZERO (set : access FD_SET) is                --  winsock.h:95
   begin
      set.all.fd_count := 0;
   end FD_ZERO;

   function timerisset (tvp : access TIMEVAL) return Win32.BOOL is
      --  winsock.h:112
   begin
      return Win32.BOOL
        (Win32.ULONG (tvp.all.tv_sec) or Win32.ULONG (tvp.all.tv_usec));
   end timerisset;

   function timercmp (tvp : access TIMEVAL;
                      uvp : access TIMEVAL;
                      cmp : LPCMPFN)
                     return Win32.BOOL is                  --  winsock.h:113
   begin
      if ((cmp (tvp.all.tv_sec, uvp.all.tv_sec) or
        (tvp.all.tv_sec = uvp.all.tv_sec)) and
        cmp (tvp.all.tv_usec, uvp.all.tv_usec)) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end timercmp;

   procedure timerclear (tvp : access TIMEVAL) is            --  winsock.h:116
   begin
      tvp.all.tv_sec := 0;
      tvp.all.tv_usec := 0;
   end timerclear;

   function IO (x : Win32.CHAR; y : Win32.BYTE) return Win32.LONG;
   function IO (x : Win32.CHAR;
                y : Win32.BYTE)
               return Win32.LONG is                        --  winsock.h:135
   begin
      return Win32.LONG
        (IOC_VOID or
        Win32.Utils.MAKELONG
        (Win32.Utils.MAKEWORD (Win32.BYTE (Win32.CHAR'Pos (x)), y), 0));
   end IO;

   function To_BYTE is new Ada.Unchecked_Conversion (Interfaces.C.char,
     Win32.BYTE);

   function FIONREAD return Win32.LONG is                  --  winsock.h:141
      x : Interfaces.C.char := 'f';
      y : Win32.BYTE := 127;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_OUT or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end FIONREAD;

   function FIONBIO return Win32.LONG is                   --  winsock.h:142
      x : Interfaces.C.char := 'f';
      y : Win32.BYTE := 126;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_IN or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end FIONBIO;

   function FIOASYNC return Win32.LONG is                  --  winsock.h:143
      x : Interfaces.C.char := 'f';
      y : Win32.BYTE := 125;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_IN or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end FIOASYNC;

   function SIOCSHIWAT return Win32.LONG is                --  winsock.h:146
      x : Interfaces.C.char := 's';
      y : Win32.BYTE := 0;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_IN or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end SIOCSHIWAT;

   function SIOCGHIWAT return Win32.LONG is                --  winsock.h:147
      x : Interfaces.C.char := 's';
      y : Win32.BYTE := 1;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_OUT or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end SIOCGHIWAT;

   function  SIOCSLOWAT return Win32.LONG is               --  winsock.h:148
      x : Interfaces.C.char := 's';
      y : Win32.BYTE := 2;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_IN or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end SIOCSLOWAT;

   function SIOCGLOWAT return Win32.LONG is                --  winsock.h:149
      x : Interfaces.C.char := 's';
      y : Win32.BYTE := 3;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_OUT or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end SIOCGLOWAT;

   function  SIOCATMARK return Win32.LONG is               --  winsock.h:150
      x : Interfaces.C.char := 's';
      y : Win32.BYTE := 7;
      w : Win32.WORD := Win32.Utils.MAKEWORD (To_BYTE (x), y);
   begin
      return Win32.LONG
        (Win32.ULONG ((IOC_OUT or Win32.ULONG (u_long'Size)) and
        Win32.ULONG (IOCPARM_MASK * 2 ** 16)) or
        Win32.Utils.MAKELONG (w, 0));
   end SIOCATMARK;

   function IN_CLASSA (i : Win32.LONG) return Win32.BOOL is  --  winsock.h:293
   begin
      if ((Win32.ULONG (i) and  16#80000000#) = 0) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end IN_CLASSA;


   function IN_CLASSB (i : Win32.LONG) return Win32.BOOL is  --  winsock.h:299
   begin
      if ((Win32.ULONG (i) and  16#c0000000#) = 16#80000000#) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end IN_CLASSB;

   function IN_CLASSC (i : Win32.LONG) return Win32.BOOL is  --  winsock.h:305
   begin
      if ((Win32.ULONG (i) and  16#e0000000#) = 16#c0000000#) then
         return Win32.TRUE;
      end if;
      return Win32.FALSE;
   end IN_CLASSC;

   function WSAMAKEASYNCREPLY (buflen : Win32.WORD; error : Win32.WORD)
                              return Win32.DWORD;
   function WSAMAKEASYNCREPLY (buflen : Win32.WORD; error : Win32.WORD)
                              return Win32.DWORD is
      --  winsock.h:872
   begin
      return Win32.Utils.MAKELONG (buflen, error);
   end WSAMAKEASYNCREPLY;

   function WSAMAKESELECTREPLY (event : Win32.WORD; error : Win32.WORD)
                               return Win32.DWORD;
   function WSAMAKESELECTREPLY (event : Win32.WORD;
                                error : Win32.WORD)
                               return Win32.DWORD is
      --  winsock.h:877
   begin
      return Win32.Utils.MAKELONG (event, error);
   end WSAMAKESELECTREPLY;

   function WSAGETASYNCBUFLEN (lParam : Win32.LPARAM) return Win32.WORD;
   function WSAGETASYNCBUFLEN (lParam : Win32.LPARAM) return Win32.WORD is
      --  winsock.h:883
   begin
      return Win32.Utils.LOWORD (Win32.DWORD (lParam));
   end WSAGETASYNCBUFLEN;

   function WSAGETASYNCERROR (lParam : Win32.LPARAM) return Win32.WORD;
   function WSAGETASYNCERROR (lParam : Win32.LPARAM) return Win32.WORD is
      --  winsock.h:889
   begin
      return Win32.Utils.HIWORD (Win32.DWORD (lParam));
   end WSAGETASYNCERROR;

   function WSAGETSELECTEVENT (lParam : Win32.LPARAM) return Win32.WORD;
   function WSAGETSELECTEVENT (lParam : Win32.LPARAM) return Win32.WORD is
      --  winsock.h:895
   begin
      return Win32.Utils.LOWORD (Win32.DWORD (lParam));
   end WSAGETSELECTEVENT;

   function WSAGETSELECTERROR (lParam : Win32.LPARAM)   return Win32.WORD;
   function WSAGETSELECTERROR (lParam : Win32.LPARAM)   return Win32.WORD is
      --  winsock.h:901
   begin
      return Win32.Utils.HIWORD (Win32.DWORD (lParam));
   end WSAGETSELECTERROR;

end Win32.Winsock;


