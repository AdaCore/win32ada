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

with Win32.AccCtrl;
with Win32.Winnt;

package Win32.Aclapi is

   function GetSecurityInfo
     (hFile                : Winnt.HANDLE;
      ObjectType           : AccCtrl.SE_OBJECT_TYPE;
      SecurityInformation  : Winnt.SECURITY_INFORMATION;
      ppsidOwner           : access Winnt.PSID;
      ppsidGroup           : access Winnt.PSID;
      ppDacl               : access Winnt.PACL;
      ppSacl               : access Winnt.PACL;
      ppSecurityDescriptor : Winnt.PSECURITY_DESCRIPTOR)
      return DWORD;

   function GetNamedSecurityInfo
     (pObjectName          : Winnt.LPTSTR;
      ObjectType           : AccCtrl.SE_OBJECT_TYPE;
      SecurityInformation  : Winnt.SECURITY_INFORMATION;
      ppsidOwner           : access Winnt.PSID;
      ppsidGroup           : access Winnt.PSID;
      ppDacl               : access Winnt.PACL;
      ppSacl               : access Winnt.PACL;
      ppSecurityDescriptor : Winnt.PSECURITY_DESCRIPTOR)
      return DWORD;

   function SetNamedSecurityInfo
     (pObjectName         : Winnt.LPTSTR;
      ObjectType          : AccCtrl.SE_OBJECT_TYPE;
      SecurityInformation : Winnt.SECURITY_INFORMATION;
      psidOwner           : Winnt.PSID;
      psidGroup           : Winnt.PSID;
      pDacl               : Winnt.PACL;
      pSacl               : Winnt.PACL)
      return DWORD;

   function SetEntriesInAcl
     (cCountOfExplicitEntries : ULONG;
      pListOfExplicitEntries  : AccCtrl.PEXPLICIT_ACCESS;
      OldAcl                  : Winnt.PACL;
      NewAcl                  : access Winnt.PACL)
      return DWORD;

   procedure BuildExplicitAccessWithName
     (pExplicitAccess   : AccCtrl.PEXPLICIT_ACCESS;
      pTrusteeName      : Winnt.LPTSTR;
      AccessPermissions : DWORD;
      AccessMode        : AccCtrl.ACCESS_MODE;
      Inheritance       : DWORD);

   function GetExplicitEntriesFromAcl
     (pacl                     : Winnt.PACL;
      pcCountOfExplicitEntries : Win32.PULONG;
      pListOfExplicitEntries   : access AccCtrl.PEXPLICIT_ACCESS)
      return DWORD;

private

   pragma Import (Stdcall, GetSecurityInfo, "GetSecurityInfo");
   pragma Import (Stdcall, GetNamedSecurityInfo, "GetNamedSecurityInfoA");
   pragma Import (Stdcall, SetNamedSecurityInfo, "SetNamedSecurityInfoA");
   pragma Import (Stdcall, SetEntriesInAcl, "SetEntriesInAclA");
   pragma Import
     (Stdcall,
      BuildExplicitAccessWithName,
      "BuildExplicitAccessWithName");
   pragma Import
     (Stdcall,
      GetExplicitEntriesFromAcl,
      "GetExplicitEntriesFromAclA");

end Win32.Aclapi;
