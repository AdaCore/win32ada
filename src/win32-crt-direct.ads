--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-crt-direct.ads, v $
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

with Win32;

package Win32.crt.Direct is

   type diskfree_t is                                      --  direct.h :54
      record
         total_clusters : Win32.UINT;                --  direct.h :55
         avail_clusters : Win32.UINT;                --  direct.h :56
         sectors_per_cluster : Win32.UINT;                --  direct.h :57
         bytes_per_sector : Win32.UINT;                --  direct.h :58
      end record;

   function chdir (dirname : Win32.PCSTR)
                 return Win32.INT;                             --  direct.h :67

   function chdrive (drive : Win32.INT) return Win32.INT;    --  direct.h :68

   function getcwd (buffer : Win32.PSTR;
                   maxlen : Win32.INT)
                  return Win32.PSTR;                  --  direct.h :69

   function getdcwd (drive : Win32.INT;
                    buffer : Win32.PSTR;
                    maxlen : Win32.INT)
                   return Win32.PSTR;                 --  direct.h :70

   function getdrive return Win32.INT;                     --  direct.h :71

   function mkdir (dirname : Win32.PCSTR)
                 return Win32.INT;                             --  direct.h :72

   function rmdir (dirname : Win32.PCSTR)
                 return Win32.INT;                             --  direct.h :73

   function getdiskfree (p1 : Win32.UINT;
                        p2 : access diskfree_t)
                       return Win32.UINT;             --  direct.h :74

   function getdrives return Win32.UINT;                   --  direct.h :75

private

   pragma Convention (C_Pass_By_Copy, diskfree_t);             --  direct.h :54

   pragma Import (C, chdir, "_chdir");                      --  direct.h :67
   pragma Import (C, chdrive, "_chdrive");                  --  direct.h :68
   pragma Import (C, getcwd, "_getcwd");                    --  direct.h :69
   pragma Import (C, getdcwd, "_getdcwd");                  --  direct.h :70
   pragma Import (C, getdrive, "_getdrive");                --  direct.h :71
   pragma Import (C, mkdir, "_mkdir");                      --  direct.h :72
   pragma Import (C, rmdir, "_rmdir");                      --  direct.h :73
   pragma Import (C, getdiskfree, "_getdiskfree");          --  direct.h :74
   pragma Import (C, getdrives, "_getdrives");              --  direct.h :75

end Win32.crt.Direct;


