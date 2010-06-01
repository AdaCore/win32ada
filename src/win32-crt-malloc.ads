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

package Win32.crt.Malloc is

   HEAP_MAXREQ  : constant := 16#ffff_ffd8#;
   HEAPEMPTY    : constant := -1;
   HEAPOK       : constant := -2;
   HEAPBADBEGIN : constant := -3;
   HEAPBADNODE  : constant := -4;
   HEAPEND      : constant := -5;
   HEAPBADPTR   : constant := -6;
   FREEENTRY    : constant := 0;
   USEDENTRY    : constant := 1;

   type HEAPINFO is record
      pentry  : Win32.PINT;
      size    : Win32.Size_T;
      useflag : Win32.INT;
   end record;

   function calloc
     (num  : Win32.Size_T;
      size : Win32.Size_T)
      return Win32.PVOID;

   procedure free (memblock : Win32.PVOID);

   function malloc (size : Win32.Size_T) return Win32.PVOID;

   function realloc
     (memblock : Win32.PVOID;
      size     : Win32.Size_T)
      return Win32.PVOID;

   function alloca (size : Win32.Size_T) return Win32.PVOID;

   function expand
     (memblock : Win32.PVOID;
      size     : Win32.Size_T)
      return Win32.PVOID;

   function heapchk return Win32.INT;

   function heapmin return Win32.INT;

   function heapset (fill : Win32.UINT) return Win32.INT;

   function heapwalk (entryinfo : access HEAPINFO) return Win32.INT;

   function msize (memblock : Win32.PVOID) return Win32.Size_T;

private

   pragma Convention (C_Pass_By_Copy, HEAPINFO);

   pragma Import (C, calloc, "calloc");
   pragma Import (C, free, "free");
   pragma Import (C, malloc, "malloc");
   pragma Import (C, realloc, "realloc");
   pragma Import (C, alloca, "_alloca");
   pragma Import (C, expand, "_expand");
   pragma Import (C, heapchk, "_heapchk");
   pragma Import (C, heapmin, "_heapmin");
   pragma Import (C, heapset, "_heapset");
   pragma Import (C, heapwalk, "_heapwalk");
   pragma Import (C, msize, "_msize");

end Win32.crt.Malloc;
