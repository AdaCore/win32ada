-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Rpc;
with Win32.Rpcdce;
with Win32.Winnt;

package Win32.Rpcnsi is

    RPC_C_NS_SYNTAX_DEFAULT     : constant := 0;            -- rpcnsi.h:21
    RPC_C_NS_SYNTAX_DCE         : constant := 3;            -- rpcnsi.h:22
    RPC_C_PROFILE_DEFAULT_ELT   : constant := 0;            -- rpcnsi.h:24
    RPC_C_PROFILE_ALL_ELT       : constant := 1;            -- rpcnsi.h:25
    RPC_C_PROFILE_MATCH_BY_IF   : constant := 2;            -- rpcnsi.h:26
    RPC_C_PROFILE_MATCH_BY_MBR  : constant := 3;            -- rpcnsi.h:27
    RPC_C_PROFILE_MATCH_BY_BOTH : constant := 4;            -- rpcnsi.h:28
    RPC_C_NS_DEFAULT_EXP_AGE    : constant := -1;           -- rpcnsi.h:30

    subtype RPC_NS_HANDLE is Win32.Winnt.HANDLE;           -- rpcnsi.h:19

    function RpcNsBindingExportA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                BindingVec     : access Win32.Rpcdce.RPC_BINDING_VECTOR;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:35

    function RpcNsBindingExport(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                BindingVec     : access Win32.Rpcdce.RPC_BINDING_VECTOR;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsBindingExportA;                 -- rpcnsi.h:35

    function RpcNsBindingUnexportA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:45

    function RpcNsBindingUnexport(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsBindingUnexportA;               -- rpcnsi.h:45

    function RpcNsBindingExportW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                BindingVec     : access Win32.Rpcdce.RPC_BINDING_VECTOR;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:55

    function RpcNsBindingUnexportW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:64

    function RpcNsBindingLookupBeginA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjUuid        : access Win32.Rpcdce.UUID;
                BindingMaxCount: Win32.ULONG;
                LookupContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:76

    function RpcNsBindingLookupBegin(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjUuid        : access Win32.Rpcdce.UUID;
                BindingMaxCount: Win32.ULONG;
                LookupContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsBindingLookupBeginA;            -- rpcnsi.h:76

    function RpcNsBindingLookupBeginW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjUuid        : access Win32.Rpcdce.UUID;
                BindingMaxCount: Win32.ULONG;
                LookupContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:88

    function RpcNsBindingLookupNext(
                LookupContext: RPC_NS_HANDLE;
                BindingVec   : access Win32.Rpcdce.RPC_BINDING_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:99

    function RpcNsBindingLookupDone(
                LookupContext: access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:105

    function RpcNsGroupDeleteA(
                GroupNameSyntax: Win32.ULONG;
                GroupName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:112

    function RpcNsGroupDelete(
                GroupNameSyntax: Win32.ULONG;
                GroupName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsGroupDeleteA;                   -- rpcnsi.h:112

    function RpcNsGroupMbrAddA(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PUCHAR;
                MemberNameSyntax: Win32.ULONG;
                MemberName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:118

    function RpcNsGroupMbrAdd(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PUCHAR;
                MemberNameSyntax: Win32.ULONG;
                MemberName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsGroupMbrAddA;                   -- rpcnsi.h:118

    function RpcNsGroupMbrRemoveA(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PUCHAR;
                MemberNameSyntax: Win32.ULONG;
                MemberName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:126

    function RpcNsGroupMbrRemove(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PUCHAR;
                MemberNameSyntax: Win32.ULONG;
                MemberName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsGroupMbrRemoveA;                -- rpcnsi.h:126

    function RpcNsGroupMbrInqBeginA(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PUCHAR;
                MemberNameSyntax: Win32.ULONG;
                InquiryContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:134

    function RpcNsGroupMbrInqBegin(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PUCHAR;
                MemberNameSyntax: Win32.ULONG;
                InquiryContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsGroupMbrInqBeginA;              -- rpcnsi.h:134

    function RpcNsGroupMbrInqNextA(
                InquiryContext: RPC_NS_HANDLE;
                MemberName    : access Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:142

    function RpcNsGroupMbrInqNext(
                InquiryContext: RPC_NS_HANDLE;
                MemberName    : access Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsGroupMbrInqNextA;               -- rpcnsi.h:142

    function RpcNsGroupDeleteW(
                GroupNameSyntax: Win32.ULONG;
                GroupName      : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:150

    function RpcNsGroupMbrAddW(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PWSTR;
                MemberNameSyntax: Win32.ULONG;
                MemberName      : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:156

    function RpcNsGroupMbrRemoveW(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PWSTR;
                MemberNameSyntax: Win32.ULONG;
                MemberName      : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:164

    function RpcNsGroupMbrInqBeginW(
                GroupNameSyntax : Win32.ULONG;
                GroupName       : Win32.PWSTR;
                MemberNameSyntax: Win32.ULONG;
                InquiryContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:172

    function RpcNsGroupMbrInqNextW(
                InquiryContext: RPC_NS_HANDLE;
                MemberName    : access Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:180

    function RpcNsGroupMbrInqDone(
                InquiryContext: access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:188

    function RpcNsProfileDeleteA(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:195

    function RpcNsProfileDelete(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsProfileDeleteA;                 -- rpcnsi.h:195

    function RpcNsProfileEltAddA(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PUCHAR;
                Priority         : Win32.ULONG;
                Annotation       : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:201

    function RpcNsProfileEltAdd(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PUCHAR;
                Priority         : Win32.ULONG;
                Annotation       : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsProfileEltAddA;                 -- rpcnsi.h:201

    function RpcNsProfileEltRemoveA(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:212

    function RpcNsProfileEltRemove(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsProfileEltRemoveA;              -- rpcnsi.h:212

    function RpcNsProfileEltInqBeginA(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR;
                InquiryType      : Win32.ULONG;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                VersOption       : Win32.ULONG;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PUCHAR;
                InquiryContext   : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:221

    function RpcNsProfileEltInqBegin(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PUCHAR;
                InquiryType      : Win32.ULONG;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                VersOption       : Win32.ULONG;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PUCHAR;
                InquiryContext   : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsProfileEltInqBeginA;            -- rpcnsi.h:221

    function RpcNsProfileEltInqNextA(
                InquiryContext: RPC_NS_HANDLE;
                IfId          : access Win32.Rpcdce.RPC_IF_ID;
                MemberName    : access Win32.PUCHAR;
                Priority      : access Win32.ULONG;
                Annotation    : access Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:233

    function RpcNsProfileEltInqNext(
                InquiryContext: RPC_NS_HANDLE;
                IfId          : access Win32.Rpcdce.RPC_IF_ID;
                MemberName    : access Win32.PUCHAR;
                Priority      : access Win32.ULONG;
                Annotation    : access Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsProfileEltInqNextA;             -- rpcnsi.h:233

    function RpcNsProfileDeleteW(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:244

    function RpcNsProfileEltAddW(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PWSTR;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PWSTR;
                Priority         : Win32.ULONG;
                Annotation       : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:250

    function RpcNsProfileEltRemoveW(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PWSTR;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:261

    function RpcNsProfileEltInqBeginW(
                ProfileNameSyntax: Win32.ULONG;
                ProfileName      : Win32.PWSTR;
                InquiryType      : Win32.ULONG;
                IfId             : access Win32.Rpcdce.RPC_IF_ID;
                VersOption       : Win32.ULONG;
                MemberNameSyntax : Win32.ULONG;
                MemberName       : Win32.PWSTR;
                InquiryContext   : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:270

    function RpcNsProfileEltInqNextW(
                InquiryContext: RPC_NS_HANDLE;
                IfId          : access Win32.Rpcdce.RPC_IF_ID;
                MemberName    : access Win32.PWSTR;
                Priority      : access Win32.ULONG;
                Annotation    : access Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:282

    function RpcNsProfileEltInqDone(
                InquiryContext: access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:293

    function RpcNsEntryObjectInqBeginA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                InquiryContext : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:300

    function RpcNsEntryObjectInqBegin(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                InquiryContext : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsEntryObjectInqBeginA;           -- rpcnsi.h:300

    function RpcNsEntryObjectInqBeginW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                InquiryContext : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:309

    function RpcNsEntryObjectInqNext(
                InquiryContext: RPC_NS_HANDLE;
                ObjUuid       : access Win32.Rpcdce.UUID)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:318

    function RpcNsEntryObjectInqDone(
                InquiryContext: access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:324

    function RpcNsEntryExpandNameA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                ExpandedName   : access Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:331

    function RpcNsEntryExpandName(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                ExpandedName   : access Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsEntryExpandNameA;               -- rpcnsi.h:331

    function RpcNsMgmtBindingUnexportA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfId           : access Win32.Rpcdce.RPC_IF_ID;
                VersOption     : Win32.ULONG;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:338

    function RpcNsMgmtBindingUnexport(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfId           : access Win32.Rpcdce.RPC_IF_ID;
                VersOption     : Win32.ULONG;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsMgmtBindingUnexportA;           -- rpcnsi.h:338

    function RpcNsMgmtEntryCreateA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:347

    function RpcNsMgmtEntryCreate(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsMgmtEntryCreateA;               -- rpcnsi.h:347

    function RpcNsMgmtEntryDeleteA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:353

    function RpcNsMgmtEntryDelete(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsMgmtEntryDeleteA;               -- rpcnsi.h:353

    function RpcNsMgmtEntryInqIfIdsA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfIdVec        : access Win32.Rpcdce.PRPC_IF_ID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:359

    function RpcNsMgmtEntryInqIfIds(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfIdVec        : access Win32.Rpcdce.PRPC_IF_ID_VECTOR)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsMgmtEntryInqIfIdsA;             -- rpcnsi.h:359

    function RpcNsMgmtHandleSetExpAge(
                NsHandle     : RPC_NS_HANDLE;
                ExpirationAge: Win32.ULONG)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:366

    function RpcNsMgmtInqExpAge(
                ExpirationAge: access Win32.ULONG)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:372

    function RpcNsMgmtSetExpAge(
                ExpirationAge: Win32.ULONG)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:377

    function RpcNsEntryExpandNameW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                ExpandedName   : access Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:384

    function RpcNsMgmtBindingUnexportW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                IfId           : access Win32.Rpcdce.RPC_IF_ID;
                VersOption     : Win32.ULONG;
                ObjectUuidVec  : access Win32.Rpcdce.UUID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:391

    function RpcNsMgmtEntryCreateW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:400

    function RpcNsMgmtEntryDeleteW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:406

    function RpcNsMgmtEntryInqIfIdsW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                IfIdVec        : access Win32.Rpcdce.PRPC_IF_ID_VECTOR)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:412

    function RpcNsBindingImportBeginA(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjUuid        : access Win32.Rpcdce.UUID;
                ImportContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:423

    function RpcNsBindingImportBegin(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PUCHAR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjUuid        : access Win32.Rpcdce.UUID;
                ImportContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS
               renames RpcNsBindingImportBeginA;            -- rpcnsi.h:423

    function RpcNsBindingImportBeginW(
                EntryNameSyntax: Win32.ULONG;
                EntryName      : Win32.PWSTR;
                IfSpec         : Win32.Rpcdce.RPC_IF_HANDLE;
                ObjUuid        : access Win32.Rpcdce.UUID;
                ImportContext  : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:434

    function RpcNsBindingImportNext(
                ImportContext: RPC_NS_HANDLE;
                Binding      : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:445

    function RpcNsBindingImportDone(
                ImportContext: access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:451

    function RpcNsBindingSelect(
                BindingVec: access Win32.Rpcdce.RPC_BINDING_VECTOR;
                Binding   : access RPC_NS_HANDLE)
               return Win32.Rpc.RPC_STATUS;                 -- rpcnsi.h:456

private

    pragma Import(Stdcall, RpcNsBindingExportA, "RpcNsBindingExportA");
                                                            -- rpcnsi.h:35
    pragma Import(Stdcall, RpcNsBindingUnexportA, "RpcNsBindingUnexportA");
                                                            -- rpcnsi.h:45
    pragma Import(Stdcall, RpcNsBindingExportW, "RpcNsBindingExportW");
                                                            -- rpcnsi.h:55
    pragma Import(Stdcall, RpcNsBindingUnexportW, "RpcNsBindingUnexportW");
                                                            -- rpcnsi.h:64
    pragma Import(Stdcall, RpcNsBindingLookupBeginA, "RpcNsBindingLookupBeginA");
                                                            -- rpcnsi.h:76
    pragma Import(Stdcall, RpcNsBindingLookupBeginW, "RpcNsBindingLookupBeginW");
                                                            -- rpcnsi.h:88
    pragma Import(Stdcall, RpcNsBindingLookupNext, "RpcNsBindingLookupNext");
                                                            -- rpcnsi.h:99
    pragma Import(Stdcall, RpcNsBindingLookupDone, "RpcNsBindingLookupDone");
                                                            -- rpcnsi.h:105
    pragma Import(Stdcall, RpcNsGroupDeleteA, "RpcNsGroupDeleteA");
                                                            -- rpcnsi.h:112
    pragma Import(Stdcall, RpcNsGroupMbrAddA, "RpcNsGroupMbrAddA");
                                                            -- rpcnsi.h:118
    pragma Import(Stdcall, RpcNsGroupMbrRemoveA, "RpcNsGroupMbrRemoveA");
                                                            -- rpcnsi.h:126
    pragma Import(Stdcall, RpcNsGroupMbrInqBeginA, "RpcNsGroupMbrInqBeginA");
                                                            -- rpcnsi.h:134
    pragma Import(Stdcall, RpcNsGroupMbrInqNextA, "RpcNsGroupMbrInqNextA");
                                                            -- rpcnsi.h:142
    pragma Import(Stdcall, RpcNsGroupDeleteW, "RpcNsGroupDeleteW");
                                                            -- rpcnsi.h:150
    pragma Import(Stdcall, RpcNsGroupMbrAddW, "RpcNsGroupMbrAddW");
                                                            -- rpcnsi.h:156
    pragma Import(Stdcall, RpcNsGroupMbrRemoveW, "RpcNsGroupMbrRemoveW");
                                                            -- rpcnsi.h:164
    pragma Import(Stdcall, RpcNsGroupMbrInqBeginW, "RpcNsGroupMbrInqBeginW");
                                                            -- rpcnsi.h:172
    pragma Import(Stdcall, RpcNsGroupMbrInqNextW, "RpcNsGroupMbrInqNextW");
                                                            -- rpcnsi.h:180
    pragma Import(Stdcall, RpcNsGroupMbrInqDone, "RpcNsGroupMbrInqDone");
                                                            -- rpcnsi.h:188
    pragma Import(Stdcall, RpcNsProfileDeleteA, "RpcNsProfileDeleteA");
                                                            -- rpcnsi.h:195
    pragma Import(Stdcall, RpcNsProfileEltAddA, "RpcNsProfileEltAddA");
                                                            -- rpcnsi.h:201
    pragma Import(Stdcall, RpcNsProfileEltRemoveA, "RpcNsProfileEltRemoveA");
                                                            -- rpcnsi.h:212
    pragma Import(Stdcall, RpcNsProfileEltInqBeginA, "RpcNsProfileEltInqBeginA");
                                                            -- rpcnsi.h:221
    pragma Import(Stdcall, RpcNsProfileEltInqNextA, "RpcNsProfileEltInqNextA");
                                                            -- rpcnsi.h:233
    pragma Import(Stdcall, RpcNsProfileDeleteW, "RpcNsProfileDeleteW");
                                                            -- rpcnsi.h:244
    pragma Import(Stdcall, RpcNsProfileEltAddW, "RpcNsProfileEltAddW");
                                                            -- rpcnsi.h:250
    pragma Import(Stdcall, RpcNsProfileEltRemoveW, "RpcNsProfileEltRemoveW");
                                                            -- rpcnsi.h:261
    pragma Import(Stdcall, RpcNsProfileEltInqBeginW, "RpcNsProfileEltInqBeginW");
                                                            -- rpcnsi.h:270
    pragma Import(Stdcall, RpcNsProfileEltInqNextW, "RpcNsProfileEltInqNextW");
                                                            -- rpcnsi.h:282
    pragma Import(Stdcall, RpcNsProfileEltInqDone, "RpcNsProfileEltInqDone");
                                                            -- rpcnsi.h:293
    pragma Import(Stdcall, RpcNsEntryObjectInqBeginA, "RpcNsEntryObjectInqBeginA");
                                                            -- rpcnsi.h:300
    pragma Import(Stdcall, RpcNsEntryObjectInqBeginW, "RpcNsEntryObjectInqBeginW");
                                                            -- rpcnsi.h:309
    pragma Import(Stdcall, RpcNsEntryObjectInqNext, "RpcNsEntryObjectInqNext");
                                                            -- rpcnsi.h:318
    pragma Import(Stdcall, RpcNsEntryObjectInqDone, "RpcNsEntryObjectInqDone");
                                                            -- rpcnsi.h:324
    pragma Import(Stdcall, RpcNsEntryExpandNameA, "RpcNsEntryExpandNameA");
                                                            -- rpcnsi.h:331
    pragma Import(Stdcall, RpcNsMgmtBindingUnexportA, "RpcNsMgmtBindingUnexportA");
                                                            -- rpcnsi.h:338
    pragma Import(Stdcall, RpcNsMgmtEntryCreateA, "RpcNsMgmtEntryCreateA");
                                                            -- rpcnsi.h:347
    pragma Import(Stdcall, RpcNsMgmtEntryDeleteA, "RpcNsMgmtEntryDeleteA");
                                                            -- rpcnsi.h:353
    pragma Import(Stdcall, RpcNsMgmtEntryInqIfIdsA, "RpcNsMgmtEntryInqIfIdsA");
                                                            -- rpcnsi.h:359
    pragma Import(Stdcall, RpcNsMgmtHandleSetExpAge, "RpcNsMgmtHandleSetExpAge");
                                                            -- rpcnsi.h:366
    pragma Import(Stdcall, RpcNsMgmtInqExpAge, "RpcNsMgmtInqExpAge");
                                                            -- rpcnsi.h:372
    pragma Import(Stdcall, RpcNsMgmtSetExpAge, "RpcNsMgmtSetExpAge");
                                                            -- rpcnsi.h:377
    pragma Import(Stdcall, RpcNsEntryExpandNameW, "RpcNsEntryExpandNameW");
                                                            -- rpcnsi.h:384
    pragma Import(Stdcall, RpcNsMgmtBindingUnexportW, "RpcNsMgmtBindingUnexportW");
                                                            -- rpcnsi.h:391
    pragma Import(Stdcall, RpcNsMgmtEntryCreateW, "RpcNsMgmtEntryCreateW");
                                                            -- rpcnsi.h:400
    pragma Import(Stdcall, RpcNsMgmtEntryDeleteW, "RpcNsMgmtEntryDeleteW");
                                                            -- rpcnsi.h:406
    pragma Import(Stdcall, RpcNsMgmtEntryInqIfIdsW, "RpcNsMgmtEntryInqIfIdsW");
                                                            -- rpcnsi.h:412
    pragma Import(Stdcall, RpcNsBindingImportBeginA, "RpcNsBindingImportBeginA");
                                                            -- rpcnsi.h:423
    pragma Import(Stdcall, RpcNsBindingImportBeginW, "RpcNsBindingImportBeginW");
                                                            -- rpcnsi.h:434
    pragma Import(Stdcall, RpcNsBindingImportNext, "RpcNsBindingImportNext");
                                                            -- rpcnsi.h:445
    pragma Import(Stdcall, RpcNsBindingImportDone, "RpcNsBindingImportDone");
                                                            -- rpcnsi.h:451
    pragma Import(Stdcall, RpcNsBindingSelect, "RpcNsBindingSelect");
                                                            -- rpcnsi.h:456

-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS PROVIDED WITHOUT CHARGE
-- "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR
-- FITNESS FOR A PARTICULAR PURPOSE.  The user assumes the entire risk as to
-- the accuracy and the use of this file.  This file may be used, copied,
-- modified and distributed only by licensees of Microsoft Corporation's
-- WIN32 Software Development Kit in accordance with the terms of the 
-- licensee's End-User License Agreement for Microsoft Software for the
-- WIN32 Development Kit.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Portions (c) 1985-1994 Microsoft Corporation with permission.
-- Microsoft is a registered trademark and Windows and Windows NT are
-- trademarks of Microsoft Corporation.
--
-------------------------------------------------------------------------------

end Win32.Rpcnsi;
