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

with Win32.Objbase;
with Win32.Rpcdce;

package Win32.Cguid is

   IID_IRpcChannel                    : Win32.Objbase.IID;
   IID_IRpcStub                       : Win32.Objbase.IID;
   IID_IStubManager                   : Win32.Objbase.IID;
   IID_IRpcProxy                      : Win32.Objbase.IID;
   IID_IProxyManager                  : Win32.Objbase.IID;
   IID_IPSFactory                     : Win32.Objbase.IID;
   IID_IInternalMoniker               : Win32.Objbase.IID;
   IID_IDfReserved1                   : Win32.Objbase.IID;
   IID_IDfReserved2                   : Win32.Objbase.IID;
   IID_IDfReserved3                   : Win32.Objbase.IID;
   CLSID_StdMarshal                   : Win32.Objbase.CLSID;
   IID_IStub                          : Win32.Objbase.IID;
   IID_IProxy                         : Win32.Objbase.IID;
   IID_IEnumGeneric                   : Win32.Objbase.IID;
   IID_IEnumHolder                    : Win32.Objbase.IID;
   IID_IEnumCallback                  : Win32.Objbase.IID;
   IID_IOleManager                    : Win32.Objbase.IID;
   IID_IOlePresObj                    : Win32.Objbase.IID;
   IID_IDebug                         : Win32.Objbase.IID;
   IID_IDebugStream                   : Win32.Objbase.IID;
   CLSID_PSGenObject                  : Win32.Objbase.CLSID;
   CLSID_PSClientSite                 : Win32.Objbase.CLSID;
   CLSID_PSClassObject                : Win32.Objbase.CLSID;
   CLSID_PSInPlaceActive              : Win32.Objbase.CLSID;
   CLSID_PSInPlaceFrame               : Win32.Objbase.CLSID;
   CLSID_PSDragDrop                   : Win32.Objbase.CLSID;
   CLSID_PSBindCtx                    : Win32.Objbase.CLSID;
   CLSID_PSEnumerators                : Win32.Objbase.CLSID;
   CLSID_StaticMetafile               : Win32.Objbase.CLSID;
   CLSID_StaticDib                    : Win32.Objbase.CLSID;
   CID_CDfsVolume                     : Win32.Objbase.CLSID;
   CLSID_CCDFormKrnl                  : Win32.Objbase.CLSID;
   CLSID_CCDPropertyPage              : Win32.Objbase.CLSID;
   CLSID_CCDFormDialog                : Win32.Objbase.CLSID;
   CLSID_CCDCommandButton             : Win32.Objbase.CLSID;
   CLSID_CCDComboBox                  : Win32.Objbase.CLSID;
   CLSID_CCDTextBox                   : Win32.Objbase.CLSID;
   CLSID_CCDCheckBox                  : Win32.Objbase.CLSID;
   CLSID_CCDLabel                     : Win32.Objbase.CLSID;
   CLSID_CCDOptionButton              : Win32.Objbase.CLSID;
   CLSID_CCDListBox                   : Win32.Objbase.CLSID;
   CLSID_CCDScrollBar                 : Win32.Objbase.CLSID;
   CLSID_CCDGroupBox                  : Win32.Objbase.CLSID;
   CLSID_CCDGeneralPropertyPage       : Win32.Objbase.CLSID;
   CLSID_CCDGenericPropertyPage       : Win32.Objbase.CLSID;
   CLSID_CCDFontPropertyPage          : Win32.Objbase.CLSID;
   CLSID_CCDColorPropertyPage         : Win32.Objbase.CLSID;
   CLSID_CCDLabelPropertyPage         : Win32.Objbase.CLSID;
   CLSID_CCDCheckBoxPropertyPage      : Win32.Objbase.CLSID;
   CLSID_CCDTextBoxPropertyPage       : Win32.Objbase.CLSID;
   CLSID_CCDOptionButtonPropertyPage  : Win32.Objbase.CLSID;
   CLSID_CCDListBoxPropertyPage       : Win32.Objbase.CLSID;
   CLSID_CCDCommandButtonPropertyPage : Win32.Objbase.CLSID;
   CLSID_CCDComboBoxPropertyPage      : Win32.Objbase.CLSID;
   CLSID_CCDScrollBarPropertyPage     : Win32.Objbase.CLSID;
   CLSID_CCDGroupBoxPropertyPage      : Win32.Objbase.CLSID;
   CLSID_CCDXObjectPropertyPage       : Win32.Objbase.CLSID;
   CLSID_CStdPropertyFrame            : Win32.Objbase.CLSID;
   CLSID_CFormPropertyPage            : Win32.Objbase.CLSID;
   CLSID_CGridPropertyPage            : Win32.Objbase.CLSID;
   CLSID_CWSJArticlePage              : Win32.Objbase.CLSID;
   CLSID_CSystemPage                  : Win32.Objbase.CLSID;
   CLSID_IdentityUnmarshal            : Win32.Objbase.CLSID;
   CLSID_Picture_Metafile             : Win32.Objbase.CLSID;
   CLSID_Picture_EnhMetafile          : Win32.Objbase.CLSID;
   CLSID_Picture_Dib                  : Win32.Objbase.CLSID;
   GUID_TRISTATE                      : Win32.Rpcdce.GUID;

private

   pragma Import (Stdcall, IID_IRpcChannel, "IID_IRpcChannel");
   pragma Import (Stdcall, IID_IRpcStub, "IID_IRpcStub");
   pragma Import (Stdcall, IID_IStubManager, "IID_IStubManager");
   pragma Import (Stdcall, IID_IRpcProxy, "IID_IRpcProxy");
   pragma Import (Stdcall, IID_IProxyManager, "IID_IProxyManager");
   pragma Import (Stdcall, IID_IPSFactory, "IID_IPSFactory");
   pragma Import (Stdcall, IID_IInternalMoniker, "IID_IInternalMoniker");
   pragma Import (Stdcall, IID_IDfReserved1, "IID_IDfReserved1");
   pragma Import (Stdcall, IID_IDfReserved2, "IID_IDfReserved2");
   pragma Import (Stdcall, IID_IDfReserved3, "IID_IDfReserved3");
   pragma Import (Stdcall, CLSID_StdMarshal, "CLSID_StdMarshal");
   pragma Import (Stdcall, IID_IStub, "IID_IStub");
   pragma Import (Stdcall, IID_IProxy, "IID_IProxy");
   pragma Import (Stdcall, IID_IEnumGeneric, "IID_IEnumGeneric");
   pragma Import (Stdcall, IID_IEnumHolder, "IID_IEnumHolder");
   pragma Import (Stdcall, IID_IEnumCallback, "IID_IEnumCallback");
   pragma Import (Stdcall, IID_IOleManager, "IID_IOleManager");
   pragma Import (Stdcall, IID_IOlePresObj, "IID_IOlePresObj");
   pragma Import (Stdcall, IID_IDebug, "IID_IDebug");
   pragma Import (Stdcall, IID_IDebugStream, "IID_IDebugStream");
   pragma Import (Stdcall, CLSID_PSGenObject, "CLSID_PSGenObject");
   pragma Import (Stdcall, CLSID_PSClientSite, "CLSID_PSClientSite");
   pragma Import (Stdcall, CLSID_PSClassObject, "CLSID_PSClassObject");
   pragma Import (Stdcall, CLSID_PSInPlaceActive, "CLSID_PSInPlaceActive");
   pragma Import (Stdcall, CLSID_PSInPlaceFrame, "CLSID_PSInPlaceFrame");
   pragma Import (Stdcall, CLSID_PSDragDrop, "CLSID_PSDragDrop");
   pragma Import (Stdcall, CLSID_PSBindCtx, "CLSID_PSBindCtx");
   pragma Import (Stdcall, CLSID_PSEnumerators, "CLSID_PSEnumerators");
   pragma Import (Stdcall, CLSID_StaticMetafile, "CLSID_StaticMetafile");
   pragma Import (Stdcall, CLSID_StaticDib, "CLSID_StaticDib");
   pragma Import (Stdcall, CID_CDfsVolume, "CID_CDfsVolume");
   pragma Import (Stdcall, CLSID_CCDFormKrnl, "CLSID_CCDFormKrnl");
   pragma Import (Stdcall, CLSID_CCDPropertyPage, "CLSID_CCDPropertyPage");
   pragma Import (Stdcall, CLSID_CCDFormDialog, "CLSID_CCDFormDialog");
   pragma Import (Stdcall, CLSID_CCDCommandButton, "CLSID_CCDCommandButton");
   pragma Import (Stdcall, CLSID_CCDComboBox, "CLSID_CCDComboBox");
   pragma Import (Stdcall, CLSID_CCDTextBox, "CLSID_CCDTextBox");
   pragma Import (Stdcall, CLSID_CCDCheckBox, "CLSID_CCDCheckBox");
   pragma Import (Stdcall, CLSID_CCDLabel, "CLSID_CCDLabel");
   pragma Import (Stdcall, CLSID_CCDOptionButton, "CLSID_CCDOptionButton");
   pragma Import (Stdcall, CLSID_CCDListBox, "CLSID_CCDListBox");
   pragma Import (Stdcall, CLSID_CCDScrollBar, "CLSID_CCDScrollBar");
   pragma Import (Stdcall, CLSID_CCDGroupBox, "CLSID_CCDGroupBox");
   pragma Import
     (Stdcall,
      CLSID_CCDGeneralPropertyPage,
      "CLSID_CCDGeneralPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDGenericPropertyPage,
      "CLSID_CCDGenericPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDFontPropertyPage,
      "CLSID_CCDFontPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDColorPropertyPage,
      "CLSID_CCDColorPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDLabelPropertyPage,
      "CLSID_CCDLabelPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDCheckBoxPropertyPage,
      "CLSID_CCDCheckBoxPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDTextBoxPropertyPage,
      "CLSID_CCDTextBoxPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDOptionButtonPropertyPage,
      "CLSID_CCDOptionButtonPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDListBoxPropertyPage,
      "CLSID_CCDListBoxPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDCommandButtonPropertyPage,
      "CLSID_CCDCommandButtonPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDComboBoxPropertyPage,
      "CLSID_CCDComboBoxPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDScrollBarPropertyPage,
      "CLSID_CCDScrollBarPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDGroupBoxPropertyPage,
      "CLSID_CCDGroupBoxPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CCDXObjectPropertyPage,
      "CLSID_CCDXObjectPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CStdPropertyFrame,
      "CLSID_CStdPropertyFrame");
   pragma Import
     (Stdcall,
      CLSID_CFormPropertyPage,
      "CLSID_CFormPropertyPage");
   pragma Import
     (Stdcall,
      CLSID_CGridPropertyPage,
      "CLSID_CGridPropertyPage");
   pragma Import (Stdcall, CLSID_CWSJArticlePage, "CLSID_CWSJArticlePage");
   pragma Import (Stdcall, CLSID_CSystemPage, "CLSID_CSystemPage");
   pragma Import
     (Stdcall,
      CLSID_IdentityUnmarshal,
      "CLSID_IdentityUnmarshal");
   pragma Import (Stdcall, CLSID_Picture_Metafile, "CLSID_Picture_Metafile");
   pragma Import
     (Stdcall,
      CLSID_Picture_EnhMetafile,
      "CLSID_Picture_EnhMetafile");
   pragma Import (Stdcall, CLSID_Picture_Dib, "CLSID_Picture_Dib");
   pragma Import (Stdcall, GUID_TRISTATE, "GUID_TRISTATE");

end Win32.Cguid;
