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

with Ada.Unchecked_Conversion;

with Win32.Winnt;

package Win32.AccCtrl is

   type SE_OBJECT_TYPE is
     (SE_UNKNOWN_OBJECT_TYPE,
      SE_FILE_OBJECT,
      SE_SERVICE,
      SE_PRINTER,
      SE_REGISTRY_KEY,
      SE_LMSHARE,
      SE_KERNEL_OBJECT,
      SE_WINDOW_OBJECT,
      SE_DS_OBJECT,
      SE_DS_OBJECT_ALL,
      SE_PROVIDER_DEFINED_OBJECT,
      SE_WMIGUID_OBJECT,
      SE_REGISTRY_WOW64_32KEY);

   for SE_OBJECT_TYPE'Size use 32;

   type ACCESS_MODE is
     (NOT_USED_ACCESS,
      GRANT_ACCESS,
      SET_ACCESS,
      DENY_ACCESS,
      REVOKE_ACCESS,
      SET_AUDIT_SUCCESS,
      SET_AUDIT_FAILURE);

   for ACCESS_MODE'Size use 32;

   type TRUSTEE_FORM is
     (TRUSTEE_IS_SID,
      TRUSTEE_IS_NAME,
      TRUSTEE_BAD_FORM,
      TRUSTEE_IS_OBJECTS_AND_SID,
      TRUSTEE_IS_OBJECTS_AND_NAME);

   for TRUSTEE_FORM'Size use 32;

   type TRUSTEE_TYPE is
     (TRUSTEE_IS_UNKNOWN,
      TRUSTEE_IS_USER,
      TRUSTEE_IS_GROUP,
      TRUSTEE_IS_DOMAIN,
      TRUSTEE_IS_ALIAS,
      TRUSTEE_IS_WELL_KNOWN_GROUP,
      TRUSTEE_IS_DELETED,
      TRUSTEE_IS_INVALID,
      TRUSTEE_IS_COMPUTER);

   for TRUSTEE_TYPE'Size use 32;

   type MULTIPLE_TRUSTEE_OPERATION is
     (NO_MULTIPLE_TRUSTEE,
      TRUSTEE_IS_IMPERSONATE);

   for MULTIPLE_TRUSTEE_OPERATION'Size use 32;

   type TRUSTEE;
   type PTRUSTEE is access all TRUSTEE;

   type TRUSTEE is record
      pMultipleTrustee         : PTRUSTEE;
      MultipleTrusteeOperation : MULTIPLE_TRUSTEE_OPERATION;
      TrusteeForm              : TRUSTEE_FORM;
      TrusteeType              : TRUSTEE_TYPE;
      ptstrName                : Winnt.LPTSTR;
   end record;

   function To_PSID is new Ada.Unchecked_Conversion
     (Winnt.LPTSTR, Winnt.PSID);
   function To_LPSTR is new Ada.Unchecked_Conversion
     (Winnt.PSID, Winnt.LPTSTR);
   --  Can be used to convert to/from ptstrName and PSID (needed when
   --  TrusteeForm is TRUSTEE_IS_SID for example).

   NO_INHERITANCE : constant := 0;

   type EXPLICIT_ACCESS is record
      grfAccessPermissions : DWORD;
      grfAccessMode        : ACCESS_MODE;
      grfInheritance       : DWORD;
      vTrustee             : TRUSTEE;
   end record;

   type PEXPLICIT_ACCESS is access all EXPLICIT_ACCESS;

private

   pragma Convention (C, SE_OBJECT_TYPE);
   pragma Convention (C, ACCESS_MODE);
   pragma Convention (C, TRUSTEE_FORM);
   pragma Convention (C, TRUSTEE_TYPE);
   pragma Convention (C, MULTIPLE_TRUSTEE_OPERATION);
   pragma Convention (C, PTRUSTEE);
   pragma Convention (C_Pass_By_Copy, TRUSTEE);
   pragma Convention (C_Pass_By_Copy, EXPLICIT_ACCESS);
   pragma Convention (C, PEXPLICIT_ACCESS);

end Win32.AccCtrl;
