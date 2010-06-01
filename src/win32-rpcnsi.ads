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

with Win32.Rpc;
with Win32.Rpcdce;
with Win32.Winnt;

package Win32.Rpcnsi is

   RPC_C_NS_SYNTAX_DEFAULT     : constant := 0;
   RPC_C_NS_SYNTAX_DCE         : constant := 3;
   RPC_C_PROFILE_DEFAULT_ELT   : constant := 0;
   RPC_C_PROFILE_ALL_ELT       : constant := 1;
   RPC_C_PROFILE_MATCH_BY_IF   : constant := 2;
   RPC_C_PROFILE_MATCH_BY_MBR  : constant := 3;
   RPC_C_PROFILE_MATCH_BY_BOTH : constant := 4;
   RPC_C_NS_DEFAULT_EXP_AGE    : constant := -1;

   subtype RPC_NS_HANDLE is Win32.Winnt.HANDLE;

   function RpcNsBindingExportA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      BindingVec      : access Win32.Rpcdce.RPC_BINDING_VECTOR;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingExport
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      BindingVec      : access Win32.Rpcdce.RPC_BINDING_VECTOR;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS renames RpcNsBindingExportA;

   function RpcNsBindingUnexportA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingUnexport
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS renames RpcNsBindingUnexportA;

   function RpcNsBindingExportW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      BindingVec      : access Win32.Rpcdce.RPC_BINDING_VECTOR;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingUnexportW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingLookupBeginA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjUuid         : access Win32.Rpcdce.UUID;
      BindingMaxCount : Win32.ULONG;
      LookupContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingLookupBegin
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjUuid         : access Win32.Rpcdce.UUID;
      BindingMaxCount : Win32.ULONG;
      LookupContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS renames RpcNsBindingLookupBeginA;

   function RpcNsBindingLookupBeginW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjUuid         : access Win32.Rpcdce.UUID;
      BindingMaxCount : Win32.ULONG;
      LookupContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingLookupNext
     (LookupContext : RPC_NS_HANDLE;
      BindingVec    : access Win32.Rpcdce.RPC_BINDING_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingLookupDone
     (LookupContext : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupDeleteA
     (GroupNameSyntax : Win32.ULONG;
      GroupName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupDelete
     (GroupNameSyntax : Win32.ULONG;
      GroupName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsGroupDeleteA;

   function RpcNsGroupMbrAddA
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PUCHAR;
      MemberNameSyntax : Win32.ULONG;
      MemberName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrAdd
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PUCHAR;
      MemberNameSyntax : Win32.ULONG;
      MemberName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsGroupMbrAddA;

   function RpcNsGroupMbrRemoveA
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PUCHAR;
      MemberNameSyntax : Win32.ULONG;
      MemberName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrRemove
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PUCHAR;
      MemberNameSyntax : Win32.ULONG;
      MemberName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsGroupMbrRemoveA;

   function RpcNsGroupMbrInqBeginA
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PUCHAR;
      MemberNameSyntax : Win32.ULONG;
      InquiryContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrInqBegin
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PUCHAR;
      MemberNameSyntax : Win32.ULONG;
      InquiryContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS renames RpcNsGroupMbrInqBeginA;

   function RpcNsGroupMbrInqNextA
     (InquiryContext : RPC_NS_HANDLE;
      MemberName     : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrInqNext
     (InquiryContext : RPC_NS_HANDLE;
      MemberName     : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsGroupMbrInqNextA;

   function RpcNsGroupDeleteW
     (GroupNameSyntax : Win32.ULONG;
      GroupName       : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrAddW
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PWSTR;
      MemberNameSyntax : Win32.ULONG;
      MemberName       : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrRemoveW
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PWSTR;
      MemberNameSyntax : Win32.ULONG;
      MemberName       : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrInqBeginW
     (GroupNameSyntax  : Win32.ULONG;
      GroupName        : Win32.PWSTR;
      MemberNameSyntax : Win32.ULONG;
      InquiryContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrInqNextW
     (InquiryContext : RPC_NS_HANDLE;
      MemberName     : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsGroupMbrInqDone
     (InquiryContext : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileDeleteA
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileDelete
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsProfileDeleteA;

   function RpcNsProfileEltAddA
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PUCHAR;
      Priority          : Win32.ULONG;
      Annotation        : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltAdd
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PUCHAR;
      Priority          : Win32.ULONG;
      Annotation        : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsProfileEltAddA;

   function RpcNsProfileEltRemoveA
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltRemove
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsProfileEltRemoveA;

   function RpcNsProfileEltInqBeginA
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR;
      InquiryType       : Win32.ULONG;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      VersOption        : Win32.ULONG;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PUCHAR;
      InquiryContext    : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltInqBegin
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PUCHAR;
      InquiryType       : Win32.ULONG;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      VersOption        : Win32.ULONG;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PUCHAR;
      InquiryContext    : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS renames
     RpcNsProfileEltInqBeginA;

   function RpcNsProfileEltInqNextA
     (InquiryContext : RPC_NS_HANDLE;
      IfId           : access Win32.Rpcdce.RPC_IF_ID;
      MemberName     : access Win32.PUCHAR;
      Priority       : access Win32.ULONG;
      Annotation     : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltInqNext
     (InquiryContext : RPC_NS_HANDLE;
      IfId           : access Win32.Rpcdce.RPC_IF_ID;
      MemberName     : access Win32.PUCHAR;
      Priority       : access Win32.ULONG;
      Annotation     : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsProfileEltInqNextA;

   function RpcNsProfileDeleteW
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltAddW
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PWSTR;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PWSTR;
      Priority          : Win32.ULONG;
      Annotation        : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltRemoveW
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PWSTR;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltInqBeginW
     (ProfileNameSyntax : Win32.ULONG;
      ProfileName       : Win32.PWSTR;
      InquiryType       : Win32.ULONG;
      IfId              : access Win32.Rpcdce.RPC_IF_ID;
      VersOption        : Win32.ULONG;
      MemberNameSyntax  : Win32.ULONG;
      MemberName        : Win32.PWSTR;
      InquiryContext    : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltInqNextW
     (InquiryContext : RPC_NS_HANDLE;
      IfId           : access Win32.Rpcdce.RPC_IF_ID;
      MemberName     : access Win32.PWSTR;
      Priority       : access Win32.ULONG;
      Annotation     : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsProfileEltInqDone
     (InquiryContext : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsEntryObjectInqBeginA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      InquiryContext  : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsEntryObjectInqBegin
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      InquiryContext  : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS renames RpcNsEntryObjectInqBeginA;

   function RpcNsEntryObjectInqBeginW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      InquiryContext  : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsEntryObjectInqNext
     (InquiryContext : RPC_NS_HANDLE;
      ObjUuid        : access Win32.Rpcdce.UUID)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsEntryObjectInqDone
     (InquiryContext : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsEntryExpandNameA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      ExpandedName    : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsEntryExpandName
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      ExpandedName    : access Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsEntryExpandNameA;

   function RpcNsMgmtBindingUnexportA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfId            : access Win32.Rpcdce.RPC_IF_ID;
      VersOption      : Win32.ULONG;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtBindingUnexport
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfId            : access Win32.Rpcdce.RPC_IF_ID;
      VersOption      : Win32.ULONG;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS renames RpcNsMgmtBindingUnexportA;

   function RpcNsMgmtEntryCreateA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtEntryCreate
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsMgmtEntryCreateA;

   function RpcNsMgmtEntryDeleteA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtEntryDelete
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR)
      return Win32.Rpc.RPC_STATUS renames RpcNsMgmtEntryDeleteA;

   function RpcNsMgmtEntryInqIfIdsA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfIdVec         : access Win32.Rpcdce.PRPC_IF_ID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtEntryInqIfIds
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfIdVec         : access Win32.Rpcdce.PRPC_IF_ID_VECTOR)
      return Win32.Rpc.RPC_STATUS renames RpcNsMgmtEntryInqIfIdsA;

   function RpcNsMgmtHandleSetExpAge
     (NsHandle      : RPC_NS_HANDLE;
      ExpirationAge : Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtInqExpAge
     (ExpirationAge : access Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtSetExpAge
     (ExpirationAge : Win32.ULONG)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsEntryExpandNameW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      ExpandedName    : access Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtBindingUnexportW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      IfId            : access Win32.Rpcdce.RPC_IF_ID;
      VersOption      : Win32.ULONG;
      ObjectUuidVec   : access Win32.Rpcdce.UUID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtEntryCreateW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtEntryDeleteW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsMgmtEntryInqIfIdsW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      IfIdVec         : access Win32.Rpcdce.PRPC_IF_ID_VECTOR)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingImportBeginA
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjUuid         : access Win32.Rpcdce.UUID;
      ImportContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingImportBegin
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PUCHAR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjUuid         : access Win32.Rpcdce.UUID;
      ImportContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS renames RpcNsBindingImportBeginA;

   function RpcNsBindingImportBeginW
     (EntryNameSyntax : Win32.ULONG;
      EntryName       : Win32.PWSTR;
      IfSpec          : Win32.Rpcdce.RPC_IF_HANDLE;
      ObjUuid         : access Win32.Rpcdce.UUID;
      ImportContext   : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingImportNext
     (ImportContext : RPC_NS_HANDLE;
      Binding       : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingImportDone
     (ImportContext : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

   function RpcNsBindingSelect
     (BindingVec : access Win32.Rpcdce.RPC_BINDING_VECTOR;
      Binding    : access RPC_NS_HANDLE)
      return Win32.Rpc.RPC_STATUS;

private

   pragma Import (Stdcall, RpcNsBindingExportA, "RpcNsBindingExportA");
   pragma Import (Stdcall, RpcNsBindingUnexportA, "RpcNsBindingUnexportA");
   pragma Import (Stdcall, RpcNsBindingExportW, "RpcNsBindingExportW");
   pragma Import (Stdcall, RpcNsBindingUnexportW, "RpcNsBindingUnexportW");
   pragma Import
     (Stdcall,
      RpcNsBindingLookupBeginA,
      "RpcNsBindingLookupBeginA");
   pragma Import
     (Stdcall,
      RpcNsBindingLookupBeginW,
      "RpcNsBindingLookupBeginW");
   pragma Import (Stdcall, RpcNsBindingLookupNext, "RpcNsBindingLookupNext");
   pragma Import (Stdcall, RpcNsBindingLookupDone, "RpcNsBindingLookupDone");
   pragma Import (Stdcall, RpcNsGroupDeleteA, "RpcNsGroupDeleteA");
   pragma Import (Stdcall, RpcNsGroupMbrAddA, "RpcNsGroupMbrAddA");
   pragma Import (Stdcall, RpcNsGroupMbrRemoveA, "RpcNsGroupMbrRemoveA");
   pragma Import (Stdcall, RpcNsGroupMbrInqBeginA, "RpcNsGroupMbrInqBeginA");
   pragma Import (Stdcall, RpcNsGroupMbrInqNextA, "RpcNsGroupMbrInqNextA");
   pragma Import (Stdcall, RpcNsGroupDeleteW, "RpcNsGroupDeleteW");
   pragma Import (Stdcall, RpcNsGroupMbrAddW, "RpcNsGroupMbrAddW");
   pragma Import (Stdcall, RpcNsGroupMbrRemoveW, "RpcNsGroupMbrRemoveW");
   pragma Import (Stdcall, RpcNsGroupMbrInqBeginW, "RpcNsGroupMbrInqBeginW");
   pragma Import (Stdcall, RpcNsGroupMbrInqNextW, "RpcNsGroupMbrInqNextW");
   pragma Import (Stdcall, RpcNsGroupMbrInqDone, "RpcNsGroupMbrInqDone");
   pragma Import (Stdcall, RpcNsProfileDeleteA, "RpcNsProfileDeleteA");
   pragma Import (Stdcall, RpcNsProfileEltAddA, "RpcNsProfileEltAddA");
   pragma Import (Stdcall, RpcNsProfileEltRemoveA, "RpcNsProfileEltRemoveA");
   pragma Import
     (Stdcall,
      RpcNsProfileEltInqBeginA,
      "RpcNsProfileEltInqBeginA");
   pragma Import
     (Stdcall,
      RpcNsProfileEltInqNextA,
      "RpcNsProfileEltInqNextA");
   pragma Import (Stdcall, RpcNsProfileDeleteW, "RpcNsProfileDeleteW");
   pragma Import (Stdcall, RpcNsProfileEltAddW, "RpcNsProfileEltAddW");
   pragma Import (Stdcall, RpcNsProfileEltRemoveW, "RpcNsProfileEltRemoveW");
   pragma Import
     (Stdcall,
      RpcNsProfileEltInqBeginW,
      "RpcNsProfileEltInqBeginW");
   pragma Import
     (Stdcall,
      RpcNsProfileEltInqNextW,
      "RpcNsProfileEltInqNextW");
   pragma Import (Stdcall, RpcNsProfileEltInqDone, "RpcNsProfileEltInqDone");
   pragma Import
     (Stdcall,
      RpcNsEntryObjectInqBeginA,
      "RpcNsEntryObjectInqBeginA");
   pragma Import
     (Stdcall,
      RpcNsEntryObjectInqBeginW,
      "RpcNsEntryObjectInqBeginW");
   pragma Import
     (Stdcall,
      RpcNsEntryObjectInqNext,
      "RpcNsEntryObjectInqNext");
   pragma Import
     (Stdcall,
      RpcNsEntryObjectInqDone,
      "RpcNsEntryObjectInqDone");
   pragma Import (Stdcall, RpcNsEntryExpandNameA, "RpcNsEntryExpandNameA");
   pragma Import
     (Stdcall,
      RpcNsMgmtBindingUnexportA,
      "RpcNsMgmtBindingUnexportA");
   pragma Import (Stdcall, RpcNsMgmtEntryCreateA, "RpcNsMgmtEntryCreateA");
   pragma Import (Stdcall, RpcNsMgmtEntryDeleteA, "RpcNsMgmtEntryDeleteA");
   pragma Import
     (Stdcall,
      RpcNsMgmtEntryInqIfIdsA,
      "RpcNsMgmtEntryInqIfIdsA");
   pragma Import
     (Stdcall,
      RpcNsMgmtHandleSetExpAge,
      "RpcNsMgmtHandleSetExpAge");
   pragma Import (Stdcall, RpcNsMgmtInqExpAge, "RpcNsMgmtInqExpAge");
   pragma Import (Stdcall, RpcNsMgmtSetExpAge, "RpcNsMgmtSetExpAge");
   pragma Import (Stdcall, RpcNsEntryExpandNameW, "RpcNsEntryExpandNameW");
   pragma Import
     (Stdcall,
      RpcNsMgmtBindingUnexportW,
      "RpcNsMgmtBindingUnexportW");
   pragma Import (Stdcall, RpcNsMgmtEntryCreateW, "RpcNsMgmtEntryCreateW");
   pragma Import (Stdcall, RpcNsMgmtEntryDeleteW, "RpcNsMgmtEntryDeleteW");
   pragma Import
     (Stdcall,
      RpcNsMgmtEntryInqIfIdsW,
      "RpcNsMgmtEntryInqIfIdsW");
   pragma Import
     (Stdcall,
      RpcNsBindingImportBeginA,
      "RpcNsBindingImportBeginA");
   pragma Import
     (Stdcall,
      RpcNsBindingImportBeginW,
      "RpcNsBindingImportBeginW");
   pragma Import (Stdcall, RpcNsBindingImportNext, "RpcNsBindingImportNext");
   pragma Import (Stdcall, RpcNsBindingImportDone, "RpcNsBindingImportDone");
   pragma Import (Stdcall, RpcNsBindingSelect, "RpcNsBindingSelect");

end Win32.Rpcnsi;
