--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-cguid.ads, v $
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

with Win32.Objbase;
with Win32.Rpcdce;

package Win32.Cguid is

   --  The definition for GUID_NULL was moved to Win32.Objbase to remove a
   --  circular dependency.

   IID_IRpcChannel                    : Win32.Objbase.IID;   --  cguid.h:36
   IID_IRpcStub                       : Win32.Objbase.IID;   --  cguid.h:37
   IID_IStubManager                   : Win32.Objbase.IID;   --  cguid.h:38
   IID_IRpcProxy                      : Win32.Objbase.IID;   --  cguid.h:39
   IID_IProxyManager                  : Win32.Objbase.IID;   --  cguid.h:40
   IID_IPSFactory                     : Win32.Objbase.IID;   --  cguid.h:41
   IID_IInternalMoniker               : Win32.Objbase.IID;   --  cguid.h:42
   IID_IDfReserved1                   : Win32.Objbase.IID;   --  cguid.h:43
   IID_IDfReserved2                   : Win32.Objbase.IID;   --  cguid.h:44
   IID_IDfReserved3                   : Win32.Objbase.IID;   --  cguid.h:45
   CLSID_StdMarshal                   : Win32.Objbase.CLSID; --  cguid.h:46
   IID_IStub                          : Win32.Objbase.IID;   --  cguid.h:47
   IID_IProxy                         : Win32.Objbase.IID;   --  cguid.h:48
   IID_IEnumGeneric                   : Win32.Objbase.IID;   --  cguid.h:49
   IID_IEnumHolder                    : Win32.Objbase.IID;   --  cguid.h:50
   IID_IEnumCallback                  : Win32.Objbase.IID;   --  cguid.h:51
   IID_IOleManager                    : Win32.Objbase.IID;   --  cguid.h:52
   IID_IOlePresObj                    : Win32.Objbase.IID;   --  cguid.h:53
   IID_IDebug                         : Win32.Objbase.IID;   --  cguid.h:54
   IID_IDebugStream                   : Win32.Objbase.IID;   --  cguid.h:55
   CLSID_PSGenObject                  : Win32.Objbase.CLSID; --  cguid.h:56
   CLSID_PSClientSite                 : Win32.Objbase.CLSID; --  cguid.h:57
   CLSID_PSClassObject                : Win32.Objbase.CLSID; --  cguid.h:58
   CLSID_PSInPlaceActive              : Win32.Objbase.CLSID; --  cguid.h:59
   CLSID_PSInPlaceFrame               : Win32.Objbase.CLSID; --  cguid.h:60
   CLSID_PSDragDrop                   : Win32.Objbase.CLSID; --  cguid.h:61
   CLSID_PSBindCtx                    : Win32.Objbase.CLSID; --  cguid.h:62
   CLSID_PSEnumerators                : Win32.Objbase.CLSID; --  cguid.h:63
   CLSID_StaticMetafile               : Win32.Objbase.CLSID; --  cguid.h:64
   CLSID_StaticDib                    : Win32.Objbase.CLSID; --  cguid.h:65
   CID_CDfsVolume                     : Win32.Objbase.CLSID; --  cguid.h:66
   CLSID_CCDFormKrnl                  : Win32.Objbase.CLSID; --  cguid.h:77
   CLSID_CCDPropertyPage              : Win32.Objbase.CLSID; --  cguid.h:78
   CLSID_CCDFormDialog                : Win32.Objbase.CLSID; --  cguid.h:79
   CLSID_CCDCommandButton             : Win32.Objbase.CLSID; --  cguid.h:84
   CLSID_CCDComboBox                  : Win32.Objbase.CLSID; --  cguid.h:85
   CLSID_CCDTextBox                   : Win32.Objbase.CLSID; --  cguid.h:86
   CLSID_CCDCheckBox                  : Win32.Objbase.CLSID; --  cguid.h:87
   CLSID_CCDLabel                     : Win32.Objbase.CLSID; --  cguid.h:88
   CLSID_CCDOptionButton              : Win32.Objbase.CLSID; --  cguid.h:89
   CLSID_CCDListBox                   : Win32.Objbase.CLSID; --  cguid.h:90
   CLSID_CCDScrollBar                 : Win32.Objbase.CLSID; --  cguid.h:91
   CLSID_CCDGroupBox                  : Win32.Objbase.CLSID; --  cguid.h:92
   CLSID_CCDGeneralPropertyPage       : Win32.Objbase.CLSID; --  cguid.h:97
   CLSID_CCDGenericPropertyPage       : Win32.Objbase.CLSID; --  cguid.h:98
   CLSID_CCDFontPropertyPage          : Win32.Objbase.CLSID; --  cguid.h:99
   CLSID_CCDColorPropertyPage         : Win32.Objbase.CLSID; --  cguid.h:100
   CLSID_CCDLabelPropertyPage         : Win32.Objbase.CLSID; --  cguid.h:101
   CLSID_CCDCheckBoxPropertyPage      : Win32.Objbase.CLSID; --  cguid.h:102
   CLSID_CCDTextBoxPropertyPage       : Win32.Objbase.CLSID; --  cguid.h:103
   CLSID_CCDOptionButtonPropertyPage  : Win32.Objbase.CLSID; --  cguid.h:104
   CLSID_CCDListBoxPropertyPage       : Win32.Objbase.CLSID; --  cguid.h:105
   CLSID_CCDCommandButtonPropertyPage : Win32.Objbase.CLSID; --  cguid.h:106
   CLSID_CCDComboBoxPropertyPage      : Win32.Objbase.CLSID; --  cguid.h:107
   CLSID_CCDScrollBarPropertyPage     : Win32.Objbase.CLSID; --  cguid.h:108
   CLSID_CCDGroupBoxPropertyPage      : Win32.Objbase.CLSID; --  cguid.h:109
   CLSID_CCDXObjectPropertyPage       : Win32.Objbase.CLSID; --  cguid.h:110
   CLSID_CStdPropertyFrame            : Win32.Objbase.CLSID; --  cguid.h:112
   CLSID_CFormPropertyPage            : Win32.Objbase.CLSID; --  cguid.h:114
   CLSID_CGridPropertyPage            : Win32.Objbase.CLSID; --  cguid.h:115
   CLSID_CWSJArticlePage              : Win32.Objbase.CLSID; --  cguid.h:117
   CLSID_CSystemPage                  : Win32.Objbase.CLSID; --  cguid.h:118
   CLSID_IdentityUnmarshal            : Win32.Objbase.CLSID; --  cguid.h:120
   CLSID_Picture_Metafile             : Win32.Objbase.CLSID; --  cguid.h:121
   CLSID_Picture_EnhMetafile          : Win32.Objbase.CLSID; --  cguid.h:122
   CLSID_Picture_Dib                  : Win32.Objbase.CLSID; --  cguid.h:123
   GUID_TRISTATE                      : Win32.Rpcdce.GUID;   --  cguid.h:128

private

   pragma Import (Stdcall, IID_IRpcChannel, "IID_IRpcChannel");  --  cguid.h:36
   pragma Import (Stdcall, IID_IRpcStub, "IID_IRpcStub");        --  cguid.h:37
   pragma Import (Stdcall, IID_IStubManager, "IID_IStubManager");
   --  cguid.h :38
   pragma Import (Stdcall, IID_IRpcProxy, "IID_IRpcProxy");      --  cguid.h:39
   pragma Import (Stdcall, IID_IProxyManager, "IID_IProxyManager");
   --  cguid.h :40
   pragma Import (Stdcall, IID_IPSFactory, "IID_IPSFactory");    --  cguid.h:41
   pragma Import (Stdcall, IID_IInternalMoniker, "IID_IInternalMoniker");
   --  cguid.h :42
   pragma Import (Stdcall, IID_IDfReserved1, "IID_IDfReserved1");
   --  cguid.h :43
   pragma Import (Stdcall, IID_IDfReserved2, "IID_IDfReserved2");
   --  cguid.h :44
   pragma Import (Stdcall, IID_IDfReserved3, "IID_IDfReserved3");
   --  cguid.h :45
   pragma Import (Stdcall, CLSID_StdMarshal, "CLSID_StdMarshal");
   --  cguid.h :46
   pragma Import (Stdcall, IID_IStub, "IID_IStub");
   --  cguid.h :47
   pragma Import (Stdcall, IID_IProxy, "IID_IProxy");
   --  cguid.h :48
   pragma Import (Stdcall, IID_IEnumGeneric, "IID_IEnumGeneric");
   --  cguid.h :49
   pragma Import (Stdcall, IID_IEnumHolder, "IID_IEnumHolder");
   --  cguid.h :50
   pragma Import (Stdcall, IID_IEnumCallback, "IID_IEnumCallback");
   --  cguid.h :51
   pragma Import (Stdcall, IID_IOleManager, "IID_IOleManager");
   --  cguid.h :52
   pragma Import (Stdcall, IID_IOlePresObj, "IID_IOlePresObj");
   --  cguid.h :53
   pragma Import (Stdcall, IID_IDebug, "IID_IDebug");
   --  cguid.h :54
   pragma Import (Stdcall, IID_IDebugStream, "IID_IDebugStream");
   --  cguid.h :55
   pragma Import (Stdcall, CLSID_PSGenObject, "CLSID_PSGenObject");
   --  cguid.h :56
   pragma Import (Stdcall, CLSID_PSClientSite, "CLSID_PSClientSite");
   --  cguid.h :57
   pragma Import (Stdcall, CLSID_PSClassObject, "CLSID_PSClassObject");
   --  cguid.h :58
   pragma Import (Stdcall, CLSID_PSInPlaceActive, "CLSID_PSInPlaceActive");
   --  cguid.h :59
   pragma Import (Stdcall, CLSID_PSInPlaceFrame, "CLSID_PSInPlaceFrame");
   --  cguid.h :60
   pragma Import (Stdcall, CLSID_PSDragDrop, "CLSID_PSDragDrop");
   --  cguid.h :61
   pragma Import (Stdcall, CLSID_PSBindCtx, "CLSID_PSBindCtx");
   --  cguid.h :62
   pragma Import (Stdcall, CLSID_PSEnumerators, "CLSID_PSEnumerators");
   --  cguid.h :63
   pragma Import (Stdcall, CLSID_StaticMetafile, "CLSID_StaticMetafile");
   --  cguid.h :64
   pragma Import (Stdcall, CLSID_StaticDib, "CLSID_StaticDib");
   --  cguid.h :65
   pragma Import (Stdcall, CID_CDfsVolume, "CID_CDfsVolume");
   --  cguid.h :66
   pragma Import (Stdcall, CLSID_CCDFormKrnl, "CLSID_CCDFormKrnl");
   --  cguid.h :77
   pragma Import (Stdcall, CLSID_CCDPropertyPage, "CLSID_CCDPropertyPage");
   --  cguid.h :78
   pragma Import (Stdcall, CLSID_CCDFormDialog, "CLSID_CCDFormDialog");
   --  cguid.h :79
   pragma Import (Stdcall, CLSID_CCDCommandButton, "CLSID_CCDCommandButton");
   --  cguid.h :84
   pragma Import (Stdcall, CLSID_CCDComboBox, "CLSID_CCDComboBox");
   --  cguid.h :85
   pragma Import (Stdcall, CLSID_CCDTextBox, "CLSID_CCDTextBox");
   --  cguid.h :86
   pragma Import (Stdcall, CLSID_CCDCheckBox, "CLSID_CCDCheckBox");
   --  cguid.h :87
   pragma Import (Stdcall, CLSID_CCDLabel, "CLSID_CCDLabel");
   --  cguid.h :88
   pragma Import (Stdcall, CLSID_CCDOptionButton, "CLSID_CCDOptionButton");
   --  cguid.h :89
   pragma Import (Stdcall, CLSID_CCDListBox, "CLSID_CCDListBox");
   --  cguid.h :90
   pragma Import (Stdcall, CLSID_CCDScrollBar, "CLSID_CCDScrollBar");
   --  cguid.h :91
   pragma Import (Stdcall, CLSID_CCDGroupBox, "CLSID_CCDGroupBox");
   --  cguid.h :92
   pragma Import (Stdcall, CLSID_CCDGeneralPropertyPage,
                    "CLSID_CCDGeneralPropertyPage");
   --  cguid.h :97
   pragma Import (Stdcall, CLSID_CCDGenericPropertyPage,
                    "CLSID_CCDGenericPropertyPage");
   --  cguid.h :98
   pragma Import (Stdcall, CLSID_CCDFontPropertyPage,
                    "CLSID_CCDFontPropertyPage");
   --  cguid.h :99
   pragma Import (Stdcall, CLSID_CCDColorPropertyPage,
                    "CLSID_CCDColorPropertyPage");
   --  cguid.h :100
   pragma Import (Stdcall, CLSID_CCDLabelPropertyPage,
                    "CLSID_CCDLabelPropertyPage");
   --  cguid.h :101
   pragma Import (Stdcall, CLSID_CCDCheckBoxPropertyPage,
                    "CLSID_CCDCheckBoxPropertyPage");
   --  cguid.h :102
   pragma Import (Stdcall, CLSID_CCDTextBoxPropertyPage,
                    "CLSID_CCDTextBoxPropertyPage");
   --  cguid.h :103
   pragma Import (Stdcall, CLSID_CCDOptionButtonPropertyPage,
                    "CLSID_CCDOptionButtonPropertyPage");
   --  cguid.h :104
   pragma Import (Stdcall, CLSID_CCDListBoxPropertyPage,
                    "CLSID_CCDListBoxPropertyPage");
   --  cguid.h :105
   pragma Import (Stdcall, CLSID_CCDCommandButtonPropertyPage,
                    "CLSID_CCDCommandButtonPropertyPage");
   --  cguid.h :106
   pragma Import (Stdcall, CLSID_CCDComboBoxPropertyPage,
                    "CLSID_CCDComboBoxPropertyPage");
   --  cguid.h :107
   pragma Import (Stdcall, CLSID_CCDScrollBarPropertyPage,
                    "CLSID_CCDScrollBarPropertyPage");
   --  cguid.h :108
   pragma Import (Stdcall, CLSID_CCDGroupBoxPropertyPage,
                    "CLSID_CCDGroupBoxPropertyPage");
   --  cguid.h :109
   pragma Import (Stdcall, CLSID_CCDXObjectPropertyPage,
                    "CLSID_CCDXObjectPropertyPage");
   --  cguid.h :110
   pragma Import (Stdcall, CLSID_CStdPropertyFrame, "CLSID_CStdPropertyFrame");
   --  cguid.h :112
   pragma Import (Stdcall, CLSID_CFormPropertyPage, "CLSID_CFormPropertyPage");
   --  cguid.h :114
   pragma Import (Stdcall, CLSID_CGridPropertyPage, "CLSID_CGridPropertyPage");
   --  cguid.h :115
   pragma Import (Stdcall, CLSID_CWSJArticlePage, "CLSID_CWSJArticlePage");
   --  cguid.h :117
   pragma Import (Stdcall, CLSID_CSystemPage, "CLSID_CSystemPage");
   --  cguid.h :118
   pragma Import (Stdcall, CLSID_IdentityUnmarshal, "CLSID_IdentityUnmarshal");
   --  cguid.h :120
   pragma Import (Stdcall, CLSID_Picture_Metafile, "CLSID_Picture_Metafile");
   --  cguid.h :121
   pragma Import (Stdcall, CLSID_Picture_EnhMetafile,
                    "CLSID_Picture_EnhMetafile");
   --  cguid.h :122
   pragma Import (Stdcall, CLSID_Picture_Dib, "CLSID_Picture_Dib");
   --  cguid.h :123
   pragma Import (Stdcall, GUID_TRISTATE, "GUID_TRISTATE");
   --  cguid.h :128


end Win32.Cguid;


