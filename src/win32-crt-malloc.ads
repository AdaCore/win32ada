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

package Win32.crt.Malloc is

   HEAP_MAXREQ : constant := 16#ffff_ffd8#;     --  malloc.h:51
   HEAPEMPTY : constant := -1;                --  malloc.h:54
   HEAPOK : constant := -2;                --  malloc.h:55
   HEAPBADBEGIN : constant := -3;                --  malloc.h:56
   HEAPBADNODE : constant := -4;                --  malloc.h:57
   HEAPEND : constant := -5;                --  malloc.h:58
   HEAPBADPTR : constant := -6;                --  malloc.h:59
   FREEENTRY : constant := 0;                 --  malloc.h:60
   USEDENTRY : constant := 1;                 --  malloc.h:61

   type HEAPINFO is                                        --  malloc.h:64
      record
         pentry : Win32.PINT;                            --  malloc.h:65
         size : Win32.Size_T;                          --  malloc.h:66
         useflag : Win32.INT;                             --  malloc.h:67
      end record;

   function calloc (num : Win32.Size_T;
                   size : Win32.Size_T)
                  return Win32.PVOID;               --  malloc.h:74

   procedure free (memblock : Win32.PVOID);                  --  malloc.h:75

   function malloc (size : Win32.Size_T)
                  return Win32.PVOID;                           --  malloc.h:76

   function realloc (memblock : Win32.PVOID;
                    size : Win32.Size_T)
                   return Win32.PVOID;          --  malloc.h:77

   function alloca (size : Win32.Size_T)
                  return Win32.PVOID;                           --  malloc.h:80

   function expand (memblock : Win32.PVOID;
                   size : Win32.Size_T)
                  return Win32.PVOID;           --  malloc.h:81

   function heapchk return Win32.INT;                      --  malloc.h:82

   function heapmin return Win32.INT;                      --  malloc.h:83

   function heapset (fill : Win32.UINT) return Win32.INT;    --  malloc.h:84

   function heapwalk (entryinfo : access HEAPINFO) return Win32.INT;
   --  malloc.h:85

   function msize (memblock : Win32.PVOID) return Win32.Size_T;
   --  malloc.h:86

private

   pragma Convention (C_Pass_By_Copy, HEAPINFO);            --  malloc.h:64

   pragma Import (C, calloc, "calloc");                     --  malloc.h:74
   pragma Import (C, free, "free");                         --  malloc.h:75
   pragma Import (C, malloc, "malloc");                     --  malloc.h:76
   pragma Import (C, realloc, "realloc");                   --  malloc.h:77
   pragma Import (C, alloca, "_alloca");                    --  malloc.h:80
   pragma Import (C, expand, "_expand");                    --  malloc.h:81
   pragma Import (C, heapchk, "_heapchk");                  --  malloc.h:82
   pragma Import (C, heapmin, "_heapmin");                  --  malloc.h:83
   pragma Import (C, heapset, "_heapset");                  --  malloc.h:84
   pragma Import (C, heapwalk, "_heapwalk");                --  malloc.h:85
   pragma Import (C, msize, "_msize");                      --  malloc.h:86

end Win32.crt.Malloc;


