--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-perthread.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
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

with System;

package Win32.crt.PerThread is

   --  Functions to get the address of per-thread data items.
   --  It would be possible to write single-thread and multi-thread
   --  versions of the bodies of these, where the single-thread
   --  version would just call a function at program startup time
   --  and then remember the address.

   --  type Per_Thread_Object is (Errno, Doserrno, Fpecode, Pxcptinfoptrs);
   type Per_Thread_Object is (Errno, Doserrno);

   function Get_Address (Which : Per_Thread_Object) return System.Address;

private

   pragma Inline (Get_Address);

end Win32.crt.PerThread;


