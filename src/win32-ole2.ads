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
with Win32.Rpcdcep;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;
with Win32.Winuser;

package Win32.Ole2 is

   E_DRAW                         : constant := 16#80040140#;
   DATA_E_FORMATETC               : constant := 16#80040064#;
   OLEIVERB_PRIMARY               : constant := 0;
   OLEIVERB_SHOW                  : constant := -1;
   OLEIVERB_OPEN                  : constant := -2;
   OLEIVERB_HIDE                  : constant := -3;
   OLEIVERB_UIACTIVATE            : constant := -4;
   OLEIVERB_INPLACEACTIVATE       : constant := -5;
   OLEIVERB_DISCARDUNDOSTATE      : constant := -6;
   EMBDHLP_INPROC_HANDLER         : constant := 16#0#;
   EMBDHLP_INPROC_SERVER          : constant := 16#1#;
   EMBDHLP_CREATENOW              : constant := 16#0#;
   EMBDHLP_DELAYCREATE            : constant := 16#10000#;
   UPDFCACHE_NODATACACHE          : constant := 16#1#;
   UPDFCACHE_ONSAVECACHE          : constant := 16#2#;
   UPDFCACHE_ONSTOPCACHE          : constant := 16#4#;
   UPDFCACHE_NORMALCACHE          : constant := 16#8#;
   UPDFCACHE_IFBLANK              : constant := 16#10#;
   UPDFCACHE_ONLYIFBLANK          : constant := 16#80000000#;
   UPDFCACHE_IFBLANKORONSAVECACHE : constant := 16#12#;
   UPDFCACHE_ALL                  : constant DWORD := 16#7fffffff#;
   UPDFCACHE_ALLBUTNODATACACHE    : constant DWORD := 16#fffffffe#;
   MK_ALT                         : constant := 16#20#;
   DROPEFFECT_NONE                : constant := 0;
   DROPEFFECT_COPY                : constant := 1;
   DROPEFFECT_MOVE                : constant := 2;
   DROPEFFECT_LINK                : constant := 4;
   DROPEFFECT_SCROLL              : constant := 16#80000000#;
   DD_DEFSCROLLINSET              : constant := 11;
   DD_DEFSCROLLDELAY              : constant := 50;
   DD_DEFSCROLLINTERVAL           : constant := 50;
   DD_DEFDRAGDELAY                : constant := 200;
   DD_DEFDRAGMINDIST              : constant := 2;

   type DISCARDCACHE is (DISCARDCACHE_SAVEIFDIRTY, DISCARDCACHE_NOSAVE);
   for DISCARDCACHE'Size use 32;

   type PDISCARDCACHE is access DISCARDCACHE;

   type OLEGETMONIKER is (
      OLEGETMONIKER_ONLYIFTHERE,
      OLEGETMONIKER_FORCEASSIGN,
      OLEGETMONIKER_UNASSIGN,
      OLEGETMONIKER_TEMPFORUSER);
   for OLEGETMONIKER use
     (OLEGETMONIKER_ONLYIFTHERE => 1,
      OLEGETMONIKER_FORCEASSIGN => 2,
      OLEGETMONIKER_UNASSIGN    => 3,
      OLEGETMONIKER_TEMPFORUSER => 4);
   for OLEGETMONIKER'Size use 32;

   type OLEWHICHMK is (
      OLEWHICHMK_CONTAINER,
      OLEWHICHMK_OBJREL,
      OLEWHICHMK_OBJFULL);
   for OLEWHICHMK use
     (OLEWHICHMK_CONTAINER => 1,
      OLEWHICHMK_OBJREL    => 2,
      OLEWHICHMK_OBJFULL   => 3);
   for OLEWHICHMK'Size use 32;

   type USERCLASSTYPE is (
      USERCLASSTYPE_FULL,
      USERCLASSTYPE_SHORT,
      USERCLASSTYPE_APPNAME);
   for USERCLASSTYPE use
     (USERCLASSTYPE_FULL    => 1,
      USERCLASSTYPE_SHORT   => 2,
      USERCLASSTYPE_APPNAME => 3);
   for USERCLASSTYPE'Size use 32;

   type OLEMISC is (
      OLEMISC_RECOMPOSEONRESIZE,
      OLEMISC_ONLYICONIC,
      OLEMISC_INSERTNOTREPLACE,
      OLEMISC_STATIC,
      OLEMISC_CANTLINKINSIDE,
      OLEMISC_CANLINKBYOLE1,
      OLEMISC_ISLINKOBJECT,
      OLEMISC_INSIDEOUT,
      OLEMISC_ACTIVATEWHENVISIBLE,
      OLEMISC_RENDERINGISDEVICEINDEPENDENT);
   for OLEMISC use
     (OLEMISC_RECOMPOSEONRESIZE            => 1,
      OLEMISC_ONLYICONIC                   => 2,
      OLEMISC_INSERTNOTREPLACE             => 4,
      OLEMISC_STATIC                       => 8,
      OLEMISC_CANTLINKINSIDE               => 16,
      OLEMISC_CANLINKBYOLE1                => 32,
      OLEMISC_ISLINKOBJECT                 => 64,
      OLEMISC_INSIDEOUT                    => 128,
      OLEMISC_ACTIVATEWHENVISIBLE          => 256,
      OLEMISC_RENDERINGISDEVICEINDEPENDENT => 512);
   for OLEMISC'Size use 32;

   type OLECLOSE is (
      OLECLOSE_SAVEIFDIRTY,
      OLECLOSE_NOSAVE,
      OLECLOSE_PROMPTSAVE);
   for OLECLOSE'Size use 32;

   type OLERENDER is (
      OLERENDER_NONE,
      OLERENDER_DRAW,
      OLERENDER_FORMAT,
      OLERENDER_ASIS);
   for OLERENDER'Size use 32;

   type OLEUPDATE is (OLEUPDATE_ALWAYS, OLEUPDATE_ONCALL);
   for OLEUPDATE'Size use 32;
   for OLEUPDATE use (OLEUPDATE_ALWAYS => 1, OLEUPDATE_ONCALL => 3);

   type OLELINKBIND is (OLELINKBIND_EVENIFCLASSDIFF);
   for OLELINKBIND use (OLELINKBIND_EVENIFCLASSDIFF => 1);
   for OLELINKBIND'Size use 32;

   type BINDSPEED is (
      BINDSPEED_INDEFINITE,
      BINDSPEED_MODERATE,
      BINDSPEED_IMMEDIATE);
   for BINDSPEED use
     (BINDSPEED_INDEFINITE => 1,
      BINDSPEED_MODERATE   => 2,
      BINDSPEED_IMMEDIATE  => 3);
   for BINDSPEED'Size use 32;

   type OLECONTF is (
      OLECONTF_EMBEDDINGS,
      OLECONTF_LINKS,
      OLECONTF_OTHERS,
      OLECONTF_ONLYUSER,
      OLECONTF_ONLYIFRUNNING);
   for OLECONTF use
     (OLECONTF_EMBEDDINGS    => 1,
      OLECONTF_LINKS         => 2,
      OLECONTF_OTHERS        => 4,
      OLECONTF_ONLYUSER      => 8,
      OLECONTF_ONLYIFRUNNING => 16);
   for OLECONTF'Size use 32;

   type OLEVERBATTRIB is (
      OLEVERBATTRIB_NEVERDIRTIES,
      OLEVERBATTRIB_ONCONTAINERMENU);
   for OLEVERBATTRIB use
     (OLEVERBATTRIB_NEVERDIRTIES    => 1,
      OLEVERBATTRIB_ONCONTAINERMENU => 2);
   for OLEVERBATTRIB'Size use 32;

   type HOLEMENU is new Win32.Windef.HGLOBAL;

   type IOleAdviseHolder;
   type IOleCache;
   type IOleCache2;
   type IOleCacheControl;
   type IOleContainer;
   type IOleClientSite;
   type IOleObject;
   type IOleWindow;
   type IOleLink;
   type IOleItemContainer;
   type IOleInPlaceUIWindow;
   type IOleInPlaceActiveObject;
   type IOleInPlaceFrame;
   type IOleInPlaceObject;
   type IOleInPlaceSite;
   type IViewObject;
   type IViewObject2;
   type IDropSource;
   type IDropTarget;
   type IEnumOLEVERB;
   type IOleAdviseHolderVtbl;
   type IOleCacheVtbl;
   type IOleCache2Vtbl;
   type IOleCacheControlVtbl;
   type IOleContainerVtbl;
   type IOleClientSiteVtbl;
   type IOleObjectVtbl;
   type IOleWindowVtbl;
   type IOleLinkVtbl;
   type IOleItemContainerVtbl;
   type IOleInPlaceUIWindowVtbl;
   type IOleInPlaceActiveObjectVtbl;
   type OLEINPLACEFRAMEINFO;
   type OLEMENUGROUPWIDTHS;
   type IOleInPlaceFrameVtbl;
   type IOleInPlaceObjectVtbl;
   type IOleInPlaceSiteVtbl;
   type IViewObjectVtbl;
   type IViewObject2Vtbl;
   type IDropSourceVtbl;
   type IDropTargetVtbl;
   type OLEVERB;
   type IEnumOLEVERBVtbl;
   type OLESTREAM;
   type OLESTREAMVTBL;
   type OBJECTDESCRIPTOR;

   type LPOLEADVISEHOLDER is access all IOleAdviseHolder;
   type a_IOleAdviseHolderVtbl_t is access all IOleAdviseHolderVtbl;
   type LPOLECACHE is access all IOleCache;
   type a_IOleCacheVtbl_t is access all IOleCacheVtbl;
   type LPOLECACHE2 is access all IOleCache2;
   type a_IOleCache2Vtbl_t is access all IOleCache2Vtbl;
   type LPOLECACHECONTROL is access all IOleCacheControl;
   type a_IOleCacheControlVtbl_t is access all IOleCacheControlVtbl;
   type LPOLECONTAINER is access all IOleContainer;
   type a_IOleContainerVtbl_t is access all IOleContainerVtbl;
   type LPOLECLIENTSITE is access all IOleClientSite;
   type a_IOleClientSiteVtbl_t is access all IOleClientSiteVtbl;
   type LPOLEOBJECT is access all IOleObject;
   type a_IOleObjectVtbl_t is access all IOleObjectVtbl;
   type POBJECTDESCRIPTOR is access all OBJECTDESCRIPTOR;
   subtype LPOBJECTDESCRIPTOR is POBJECTDESCRIPTOR;
   type PLINKSRCDESCRIPTOR is access all OBJECTDESCRIPTOR;
   subtype LPLINKSRCDESCRIPTOR is PLINKSRCDESCRIPTOR;
   type LPOLEWINDOW is access all IOleWindow;
   type a_IOleWindowVtbl_t is access all IOleWindowVtbl;
   type LPOLELINK is access all IOleLink;
   type a_IOleLinkVtbl_t is access all IOleLinkVtbl;
   type LPOLEITEMCONTAINER is access all IOleItemContainer;
   type a_IOleItemContainerVtbl_t is access all IOleItemContainerVtbl;
   type LPOLEINPLACEUIWINDOW is access all IOleInPlaceUIWindow;
   type LPBORDERWIDTHS is access all Win32.Windef.RECT;
   type LPCBORDERWIDTHS is access all Win32.Windef.RECT;
   type a_IOleInPlaceUIWindowVtbl_t is access all IOleInPlaceUIWindowVtbl;
   type LPOLEINPLACEACTIVEOBJECT is access all IOleInPlaceActiveObject;
   type a_IOleInPlaceActiveObjectVtbl_t is access all
     IOleInPlaceActiveObjectVtbl;
   type LPOLEINPLACEFRAME is access all IOleInPlaceFrame;
   type LPOLEINPLACEFRAMEINFO is access all OLEINPLACEFRAMEINFO;
   type LPOLEMENUGROUPWIDTHS is access all OLEMENUGROUPWIDTHS;
   type a_IOleInPlaceFrameVtbl_t is access all IOleInPlaceFrameVtbl;
   type LPOLEINPLACEOBJECT is access all IOleInPlaceObject;
   type a_IOleInPlaceObjectVtbl_t is access all IOleInPlaceObjectVtbl;
   type LPOLEINPLACESITE is access all IOleInPlaceSite;
   type a_IOleInPlaceSiteVtbl_t is access all IOleInPlaceSiteVtbl;
   type LPVIEWOBJECT is access all IViewObject;
   type a_IViewObjectVtbl_t is access all IViewObjectVtbl;
   type LPVIEWOBJECT2 is access all IViewObject2;
   type a_IViewObject2Vtbl_t is access all IViewObject2Vtbl;
   type LPDROPSOURCE is access all IDropSource;
   type a_IDropSourceVtbl_t is access all IDropSourceVtbl;
   type LPDROPTARGET is access all IDropTarget;
   type a_IDropTargetVtbl_t is access all IDropTargetVtbl;
   type LPENUMOLEVERB is access all IEnumOLEVERB;
   type LPOLEVERB is access all OLEVERB;
   type a_IEnumOLEVERBVtbl_t is access all IEnumOLEVERBVtbl;
   type LPOLESTREAM is access all OLESTREAM;
   type LPOLESTREAMVTBL is access all OLESTREAMVTBL;
   type ac_DVTARGETDEVICE_t is access all Win32.Objbase.DVTARGETDEVICE;

   type IOleAdviseHolder is record
      lpVtbl : a_IOleAdviseHolderVtbl_t;
   end record;

   type IOleCache is record
      lpVtbl : a_IOleCacheVtbl_t;
   end record;

   type IOleCache2 is record
      lpVtbl : a_IOleCache2Vtbl_t;
   end record;

   type IOleCacheControl is record
      lpVtbl : a_IOleCacheControlVtbl_t;
   end record;

   type IOleContainer is record
      lpVtbl : a_IOleContainerVtbl_t;
   end record;

   type IOleClientSite is record
      lpVtbl : a_IOleClientSiteVtbl_t;
   end record;

   type IOleObject is record
      lpVtbl : a_IOleObjectVtbl_t;
   end record;

   type IOleWindow is record
      lpVtbl : a_IOleWindowVtbl_t;
   end record;

   type IOleLink is record
      lpVtbl : a_IOleLinkVtbl_t;
   end record;

   type IOleItemContainer is record
      lpVtbl : a_IOleItemContainerVtbl_t;
   end record;

   type IOleInPlaceUIWindow is record
      lpVtbl : a_IOleInPlaceUIWindowVtbl_t;
   end record;

   type IOleInPlaceActiveObject is record
      lpVtbl : a_IOleInPlaceActiveObjectVtbl_t;
   end record;

   type IOleInPlaceFrame is record
      lpVtbl : a_IOleInPlaceFrameVtbl_t;
   end record;

   type IOleInPlaceObject is record
      lpVtbl : a_IOleInPlaceObjectVtbl_t;
   end record;

   type IOleInPlaceSite is record
      lpVtbl : a_IOleInPlaceSiteVtbl_t;
   end record;

   type IViewObject is record
      lpVtbl : a_IViewObjectVtbl_t;
   end record;

   type IViewObject2 is record
      lpVtbl : a_IViewObject2Vtbl_t;
   end record;

   type IDropSource is record
      lpVtbl : a_IDropSourceVtbl_t;
   end record;

   type IDropTarget is record
      lpVtbl : a_IDropTargetVtbl_t;
   end record;

   type IEnumOLEVERB is record
      lpVtbl : a_IEnumOLEVERBVtbl_t;
   end record;

   type af_250_QueryInterface is access function
     (This      : access IOleAdviseHolder;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_250_QueryInterface);

   type af_255_AddRef is access function
     (This : access IOleAdviseHolder)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_255_AddRef);

   type af_258_Release is access function
     (This : access IOleAdviseHolder)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_258_Release);

   type af_261_Advise is access function
     (This          : access IOleAdviseHolder;
      pAdvise       : access Win32.Objbase.IAdviseSink;
      pdwConnection : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_261_Advise);

   type af_266_Unadvise is access function
     (This         : access IOleAdviseHolder;
      dwConnection : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_266_Unadvise);

   type af_270_EnumAdvise is access function
     (This         : access IOleAdviseHolder;
      ppenumAdvise : access Win32.Objbase.LPENUMSTATDATA)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_270_EnumAdvise);

   type af_274_SendOnRename is access function
     (This : access IOleAdviseHolder;
      pmk  : access Win32.Objbase.IMoniker)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_274_SendOnRename);

   type af_278_SendOnSave is access function
     (This : access IOleAdviseHolder)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_278_SendOnSave);

   type af_281_SendOnClose is access function
     (This : access IOleAdviseHolder)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_281_SendOnClose);

   type af_454_QueryInterface is access function
     (This      : access IOleCache;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_454_QueryInterface);

   type af_459_AddRef is access function
     (This : access IOleCache)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_459_AddRef);

   type af_462_Release is access function
     (This : access IOleCache)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_462_Release);

   type af_465_Cache is access function
     (This          : access IOleCache;
      pformatetc    : access Win32.Objbase.FORMATETC;
      advf          : Win32.DWORD;
      pdwConnection : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_465_Cache);

   type af_471_Uncache is access function
     (This         : access IOleCache;
      dwConnection : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_471_Uncache);

   type af_475_EnumCache is access function
     (This           : access IOleCache;
      ppenumSTATDATA : access Win32.Objbase.LPENUMSTATDATA)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_475_EnumCache);

   type af_479_InitCache is access function
     (This        : access IOleCache;
      pDataObject : access Win32.Objbase.IDataObject)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_479_InitCache);

   type af_483_SetData is access function
     (This       : access IOleCache;
      pformatetc : access Win32.Objbase.FORMATETC;
      pmedium    : access Win32.Objbase.STGMEDIUM;
      fRelease   : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_483_SetData);

   type af_676_QueryInterface is access function
     (This      : access IOleCache2;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_676_QueryInterface);

   type af_681_AddRef is access function
     (This : access IOleCache2)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_681_AddRef);

   type af_684_Release is access function
     (This : access IOleCache2)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_684_Release);

   type af_687_Cache is access function
     (This          : access IOleCache2;
      pformatetc    : access Win32.Objbase.FORMATETC;
      advf          : Win32.DWORD;
      pdwConnection : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_687_Cache);

   type af_693_Uncache is access function
     (This         : access IOleCache2;
      dwConnection : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_693_Uncache);

   type af_697_EnumCache is access function
     (This           : access IOleCache2;
      ppenumSTATDATA : access Win32.Objbase.LPENUMSTATDATA)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_697_EnumCache);

   type af_701_InitCache is access function
     (This        : access IOleCache2;
      pDataObject : access Win32.Objbase.IDataObject)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_701_InitCache);

   type af_705_SetData is access function
     (This       : access IOleCache2;
      pformatetc : access Win32.Objbase.FORMATETC;
      pmedium    : access Win32.Objbase.STGMEDIUM;
      fRelease   : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_705_SetData);

   type af_711_UpdateCache is access function
     (This        : access IOleCache2;
      pDataObject : Win32.Objbase.LPDATAOBJECT;
      grfUpdf     : Win32.DWORD;
      pReserved   : Win32.LPVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_711_UpdateCache);

   type af_717_DiscardCache is access function
     (This             : access IOleCache2;
      dwDiscardOptions : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_717_DiscardCache);

   type af_836_QueryInterface is access function
     (This      : access IOleCacheControl;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_836_QueryInterface);

   type af_841_AddRef is access function
     (This : access IOleCacheControl)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_841_AddRef);

   type af_844_Release is access function
     (This : access IOleCacheControl)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_844_Release);

   type af_847_OnRun is access function
     (This        : access IOleCacheControl;
      pDataObject : Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_847_OnRun);

   type af_851_OnStop is access function
     (This : access IOleCacheControl)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_851_OnStop);

   type af_952_QueryInterface is access function
     (This      : access IOleContainer;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_952_QueryInterface);

   type af_957_AddRef is access function
     (This : access IOleContainer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_957_AddRef);

   type af_960_Release is access function
     (This : access IOleContainer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_960_Release);

   type af_963_ParseDisplayName is access function
     (This           : access IOleContainer;
      pbc            : access Win32.Objbase.IBindCtx;
      pszDisplayName : Win32.Objbase.LPOLESTR;
      pchEaten       : access Win32.ULONG;
      ppmkOut        : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_963_ParseDisplayName);

   type af_970_EnumObjects is access function
     (This     : access IOleContainer;
      grfFlags : Win32.DWORD;
      ppenum   : access Win32.Objbase.LPENUMUNKNOWN)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_970_EnumObjects);

   type af_975_LockContainer is access function
     (This  : access IOleContainer;
      fLock : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_975_LockContainer);

   type af_1093_QueryInterface is access function
     (This      : access IOleClientSite;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1093_QueryInterface);

   type af_1098_AddRef is access function
     (This : access IOleClientSite)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1098_AddRef);

   type af_1101_Release is access function
     (This : access IOleClientSite)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1101_Release);

   type af_1104_SaveObject is access function
     (This : access IOleClientSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1104_SaveObject);

   type af_1107_GetMoniker is access function
     (This           : access IOleClientSite;
      dwAssign       : Win32.DWORD;
      dwWhichMoniker : Win32.DWORD;
      ppmk           : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1107_GetMoniker);

   type af_1113_GetContainer is access function
     (This        : access IOleClientSite;
      ppContainer : access LPOLECONTAINER)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1113_GetContainer);

   type af_1117_ShowObject is access function
     (This : access IOleClientSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1117_ShowObject);

   type af_1120_OnShowWindow is access function
     (This  : access IOleClientSite;
      fShow : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1120_OnShowWindow);

   type af_1124_RequestNewObjectLayout is access function
     (This : access IOleClientSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1124_RequestNewObjectLayout);

   type af_1404_QueryInterface is access function
     (This      : access IOleObject;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1404_QueryInterface);

   type af_1409_AddRef is access function
     (This : access IOleObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1409_AddRef);

   type af_1412_Release is access function
     (This : access IOleObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1412_Release);

   type af_1415_SetClientSite is access function
     (This        : access IOleObject;
      pClientSite : access IOleClientSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1415_SetClientSite);

   type af_1419_GetClientSite is access function
     (This         : access IOleObject;
      ppClientSite : access LPOLECLIENTSITE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1419_GetClientSite);

   type af_1423_SetHostNames is access function
     (This           : access IOleObject;
      szContainerApp : Win32.Objbase.LPCOLESTR;
      szContainerObj : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1423_SetHostNames);

   type af_1428_Close is access function
     (This         : access IOleObject;
      dwSaveOption : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1428_Close);

   type af_1432_SetMoniker is access function
     (This           : access IOleObject;
      dwWhichMoniker : Win32.DWORD;
      pmk            : access Win32.Objbase.IMoniker)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1432_SetMoniker);

   type af_1437_GetMoniker is access function
     (This           : access IOleObject;
      dwAssign       : Win32.DWORD;
      dwWhichMoniker : Win32.DWORD;
      ppmk           : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1437_GetMoniker);

   type af_1443_InitFromData is access function
     (This        : access IOleObject;
      pDataObject : access Win32.Objbase.IDataObject;
      fCreation   : Win32.BOOL;
      dwReserved  : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1443_InitFromData);

   type af_1449_GetClipboardData is access function
     (This         : access IOleObject;
      dwReserved   : Win32.DWORD;
      ppDataObject : access Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1449_GetClipboardData);

   type af_1454_DoVerb is access function
     (This        : access IOleObject;
      iVerb       : Win32.LONG;
      lpmsg       : Win32.Winuser.LPMSG;
      pActiveSite : access IOleClientSite;
      lindex      : Win32.LONG;
      hwndParent  : Win32.Windef.HWND;
      lprcPosRect : Win32.Objbase.LPCRECT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1454_DoVerb);

   type af_1463_EnumVerbs is access function
     (This          : access IOleObject;
      ppEnumOleVerb : access LPENUMOLEVERB)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1463_EnumVerbs);

   type af_1467_Update is access function
     (This : access IOleObject)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1467_Update);

   type af_1470_IsUpToDate is access function
     (This : access IOleObject)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1470_IsUpToDate);

   type af_1473_GetUserClassID is access function
     (This   : access IOleObject;
      pClsid : Win32.Objbase.REFCLSID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1473_GetUserClassID);

   type af_1477_GetUserType is access function
     (This         : access IOleObject;
      dwFormOfType : Win32.DWORD;
      pszUserType  : access Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1477_GetUserType);

   type af_1482_SetExtent is access function
     (This         : access IOleObject;
      dwDrawAspect : Win32.DWORD;
      psizel       : access Win32.Windef.SIZEL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1482_SetExtent);

   type af_1487_GetExtent is access function
     (This         : access IOleObject;
      dwDrawAspect : Win32.DWORD;
      psizel       : access Win32.Windef.SIZEL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1487_GetExtent);

   type af_1492_Advise is access function
     (This          : access IOleObject;
      pAdvSink      : access Win32.Objbase.IAdviseSink;
      pdwConnection : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1492_Advise);

   type af_1497_Unadvise is access function
     (This         : access IOleObject;
      dwConnection : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1497_Unadvise);

   type af_1501_EnumAdvise is access function
     (This         : access IOleObject;
      ppenumAdvise : access Win32.Objbase.LPENUMSTATDATA)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1501_EnumAdvise);

   type af_1505_GetMiscStatus is access function
     (This      : access IOleObject;
      dwAspect  : Win32.DWORD;
      pdwStatus : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1505_GetMiscStatus);

   type af_1510_SetColorScheme is access function
     (This    : access IOleObject;
      pLogpal : access Win32.Wingdi.LOGPALETTE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1510_SetColorScheme);

   type af_1969_QueryInterface is access function
     (This      : access IOleWindow;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1969_QueryInterface);

   type af_1974_AddRef is access function
     (This : access IOleWindow)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1974_AddRef);

   type af_1977_Release is access function
     (This : access IOleWindow)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_1977_Release);

   type af_1980_GetWindow is access function
     (This  : access IOleWindow;
      phwnd : access Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1980_GetWindow);

   type af_1984_ContextSensitiveHelp is access function
     (This       : access IOleWindow;
      fEnterMode : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_1984_ContextSensitiveHelp);

   type af_2132_QueryInterface is access function
     (This      : access IOleLink;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2132_QueryInterface);

   type af_2137_AddRef is access function
     (This : access IOleLink)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2137_AddRef);

   type af_2140_Release is access function
     (This : access IOleLink)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2140_Release);

   type af_2143_SetUpdateOptions is access function
     (This        : access IOleLink;
      dwUpdateOpt : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2143_SetUpdateOptions);

   type af_2147_GetUpdateOptions is access function
     (This         : access IOleLink;
      pdwUpdateOpt : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2147_GetUpdateOptions);

   type af_2151_SetSourceMoniker is access function
     (This   : access IOleLink;
      pmk    : access Win32.Objbase.IMoniker;
      rclsid : Win32.Objbase.REFCLSID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2151_SetSourceMoniker);

   type af_2156_GetSourceMoniker is access function
     (This : access IOleLink;
      ppmk : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2156_GetSourceMoniker);

   type af_2160_SetSourceDisplayName is access function
     (This          : access IOleLink;
      pszStatusText : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2160_SetSourceDisplayName);

   type af_2164_GetSourceDisplayName is access function
     (This            : access IOleLink;
      ppszDisplayName : access Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2164_GetSourceDisplayName);

   type af_2168_BindToSource is access function
     (This      : access IOleLink;
      bindflags : Win32.DWORD;
      pbc       : access Win32.Objbase.IBindCtx)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2168_BindToSource);

   type af_2173_BindIfRunning is access function
     (This : access IOleLink)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2173_BindIfRunning);

   type af_2176_GetBoundSource is access function
     (This  : access IOleLink;
      ppunk : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2176_GetBoundSource);

   type af_2180_UnbindSource is access function
     (This : access IOleLink)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2180_UnbindSource);

   type af_2183_Update is access function
     (This : access IOleLink;
      pbc  : access Win32.Objbase.IBindCtx)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2183_Update);

   type af_2448_QueryInterface is access function
     (This      : access IOleItemContainer;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2448_QueryInterface);

   type af_2453_AddRef is access function
     (This : access IOleItemContainer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2453_AddRef);

   type af_2456_Release is access function
     (This : access IOleItemContainer)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2456_Release);

   type af_2459_ParseDisplayName is access function
     (This           : access IOleItemContainer;
      pbc            : access Win32.Objbase.IBindCtx;
      pszDisplayName : Win32.Objbase.LPOLESTR;
      pchEaten       : access Win32.ULONG;
      ppmkOut        : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2459_ParseDisplayName);

   type af_2466_EnumObjects is access function
     (This     : access IOleItemContainer;
      grfFlags : Win32.DWORD;
      ppenum   : access Win32.Objbase.LPENUMUNKNOWN)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2466_EnumObjects);

   type af_2471_LockContainer is access function
     (This  : access IOleItemContainer;
      fLock : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2471_LockContainer);

   type af_2475_GetObjectA is access function
     (This          : access IOleItemContainer;
      pszItem       : Win32.Objbase.LPOLESTR;
      dwSpeedNeeded : Win32.DWORD;
      pbc           : access Win32.Objbase.IBindCtx;
      riid          : Win32.Objbase.REFIID;
      ppvObject     : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2475_GetObjectA);

   type af_2483_GetObjectStorage is access function
     (This       : access IOleItemContainer;
      pszItem    : Win32.Objbase.LPOLESTR;
      pbc        : access Win32.Objbase.IBindCtx;
      riid       : Win32.Objbase.REFIID;
      ppvStorage : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2483_GetObjectStorage);

   type af_2490_IsRunning is access function
     (This    : access IOleItemContainer;
      pszItem : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2490_IsRunning);

   type af_2641_QueryInterface is access function
     (This      : access IOleInPlaceUIWindow;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2641_QueryInterface);

   type af_2646_AddRef is access function
     (This : access IOleInPlaceUIWindow)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2646_AddRef);

   type af_2649_Release is access function
     (This : access IOleInPlaceUIWindow)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2649_Release);

   type af_2652_GetWindow is access function
     (This  : access IOleInPlaceUIWindow;
      phwnd : access Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2652_GetWindow);

   type af_2656_ContextSensitiveHelp is access function
     (This       : access IOleInPlaceUIWindow;
      fEnterMode : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2656_ContextSensitiveHelp);

   type af_2660_GetBorder is access function
     (This         : access IOleInPlaceUIWindow;
      lprectBorder : Win32.Windef.LPRECT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2660_GetBorder);

   type af_2664_RequestBorderSpace is access function
     (This          : access IOleInPlaceUIWindow;
      pborderwidths : LPCBORDERWIDTHS)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2664_RequestBorderSpace);

   type af_2668_SetBorderSpace is access function
     (This          : access IOleInPlaceUIWindow;
      pborderwidths : LPCBORDERWIDTHS)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2668_SetBorderSpace);

   type af_2672_SetActiveObject is access function
     (This          : access IOleInPlaceUIWindow;
      pActiveObject : access IOleInPlaceActiveObject;
      pszObjName    : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2672_SetActiveObject);

   type af_2824_QueryInterface is access function
     (This      : access IOleInPlaceActiveObject;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2824_QueryInterface);

   type af_2829_AddRef is access function
     (This : access IOleInPlaceActiveObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2829_AddRef);

   type af_2832_Release is access function
     (This : access IOleInPlaceActiveObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_2832_Release);

   type af_2835_GetWindow is access function
     (This  : access IOleInPlaceActiveObject;
      phwnd : access Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2835_GetWindow);

   type af_2839_ContextSensitiveHelp is access function
     (This       : access IOleInPlaceActiveObject;
      fEnterMode : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2839_ContextSensitiveHelp);

   type af_2843_TranslateAcceleratorA is access function
     (This  : access IOleInPlaceActiveObject;
      lpmsg : Win32.Winuser.LPMSG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2843_TranslateAcceleratorA);

   type af_2847_OnFrameWindowActivate is access function
     (This      : access IOleInPlaceActiveObject;
      fActivate : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2847_OnFrameWindowActivate);

   type af_2851_OnDocWindowActivate is access function
     (This      : access IOleInPlaceActiveObject;
      fActivate : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2851_OnDocWindowActivate);

   type af_2855_ResizeBorder is access function
     (This         : access IOleInPlaceActiveObject;
      prcBorder    : Win32.Objbase.LPCRECT;
      pUIWindow    : access IOleInPlaceUIWindow;
      fFrameWindow : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2855_ResizeBorder);

   type af_2861_EnableModeless is access function
     (This    : access IOleInPlaceActiveObject;
      fEnable : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_2861_EnableModeless);

   type af_3058_QueryInterface is access function
     (This      : access IOleInPlaceFrame;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3058_QueryInterface);

   type af_3063_AddRef is access function
     (This : access IOleInPlaceFrame)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3063_AddRef);

   type af_3066_Release is access function
     (This : access IOleInPlaceFrame)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3066_Release);

   type af_3069_GetWindow is access function
     (This  : access IOleInPlaceFrame;
      phwnd : access Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3069_GetWindow);

   type af_3073_ContextSensitiveHelp is access function
     (This       : access IOleInPlaceFrame;
      fEnterMode : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3073_ContextSensitiveHelp);

   type af_3077_GetBorder is access function
     (This         : access IOleInPlaceFrame;
      lprectBorder : Win32.Windef.LPRECT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3077_GetBorder);

   type af_3081_RequestBorderSpace is access function
     (This          : access IOleInPlaceFrame;
      pborderwidths : LPCBORDERWIDTHS)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3081_RequestBorderSpace);

   type af_3085_SetBorderSpace is access function
     (This          : access IOleInPlaceFrame;
      pborderwidths : LPCBORDERWIDTHS)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3085_SetBorderSpace);

   type af_3089_SetActiveObject is access function
     (This          : access IOleInPlaceFrame;
      pActiveObject : access IOleInPlaceActiveObject;
      pszObjName    : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3089_SetActiveObject);

   type af_3094_InsertMenus is access function
     (This         : access IOleInPlaceFrame;
      hmenuShared  : Win32.Windef.HMENU;
      lpMenuWidths : LPOLEMENUGROUPWIDTHS)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3094_InsertMenus);

   type af_3099_SetMenu is access function
     (This             : access IOleInPlaceFrame;
      hmenuShared      : Win32.Windef.HMENU;
      holemenu         : Win32.Ole2.HOLEMENU;
      hwndActiveObject : Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3099_SetMenu);

   type af_3105_RemoveMenus is access function
     (This        : access IOleInPlaceFrame;
      hmenuShared : Win32.Windef.HMENU)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3105_RemoveMenus);

   type af_3109_SetStatusText is access function
     (This          : access IOleInPlaceFrame;
      pszStatusText : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3109_SetStatusText);

   type af_3113_EnableModeless is access function
     (This    : access IOleInPlaceFrame;
      fEnable : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3113_EnableModeless);

   type af_3117_TranslateAcceleratorA is access function
     (This  : access IOleInPlaceFrame;
      lpmsg : Win32.Winuser.LPMSG;
      wID   : Win32.WORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3117_TranslateAcceleratorA);

   type af_3308_QueryInterface is access function
     (This      : access IOleInPlaceObject;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3308_QueryInterface);

   type af_3313_AddRef is access function
     (This : access IOleInPlaceObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3313_AddRef);

   type af_3316_Release is access function
     (This : access IOleInPlaceObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3316_Release);

   type af_3319_GetWindow is access function
     (This  : access IOleInPlaceObject;
      phwnd : access Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3319_GetWindow);

   type af_3323_ContextSensitiveHelp is access function
     (This       : access IOleInPlaceObject;
      fEnterMode : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3323_ContextSensitiveHelp);

   type af_3327_InPlaceDeactivate is access function
     (This : access IOleInPlaceObject)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3327_InPlaceDeactivate);

   type af_3330_UIDeactivate is access function
     (This : access IOleInPlaceObject)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3330_UIDeactivate);

   type af_3333_SetObjectRects is access function
     (This         : access IOleInPlaceObject;
      lprcPosRect  : Win32.Objbase.LPCRECT;
      lprcClipRect : Win32.Objbase.LPCRECT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3333_SetObjectRects);

   type af_3338_ReactivateAndUndo is access function
     (This : access IOleInPlaceObject)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3338_ReactivateAndUndo);

   type af_3496_QueryInterface is access function
     (This      : access IOleInPlaceSite;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3496_QueryInterface);

   type af_3501_AddRef is access function
     (This : access IOleInPlaceSite)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3501_AddRef);

   type af_3504_Release is access function
     (This : access IOleInPlaceSite)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3504_Release);

   type af_3507_GetWindow is access function
     (This  : access IOleInPlaceSite;
      phwnd : access Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3507_GetWindow);

   type af_3511_ContextSensitiveHelp is access function
     (This       : access IOleInPlaceSite;
      fEnterMode : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3511_ContextSensitiveHelp);

   type af_3515_CanInPlaceActivate is access function
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3515_CanInPlaceActivate);

   type af_3518_OnInPlaceActivate is access function
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3518_OnInPlaceActivate);

   type af_3521_OnUIActivate is access function
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3521_OnUIActivate);

   type af_3524_GetWindowContext is access function
     (This         : access IOleInPlaceSite;
      ppFrame      : access LPOLEINPLACEFRAME;
      ppDoc        : access LPOLEINPLACEUIWINDOW;
      lprcPosRect  : Win32.Windef.LPRECT;
      lprcClipRect : Win32.Windef.LPRECT;
      lpFrameInfo  : LPOLEINPLACEFRAMEINFO)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3524_GetWindowContext);

   type af_3532_Scroll is access function
     (This         : access IOleInPlaceSite;
      scrollExtant : Win32.Windef.SIZE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3532_Scroll);

   type af_3536_OnUIDeactivate is access function
     (This      : access IOleInPlaceSite;
      fUndoable : Win32.BOOL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3536_OnUIDeactivate);

   type af_3540_OnInPlaceDeactivate is access function
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3540_OnInPlaceDeactivate);

   type af_3543_DiscardUndoState is access function
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3543_DiscardUndoState);

   type af_3546_DeactivateAndUndo is access function
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3546_DeactivateAndUndo);

   type af_3549_OnPosRectChange is access function
     (This        : access IOleInPlaceSite;
      lprcPosRect : Win32.Objbase.LPCRECT)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3549_OnPosRectChange);

   type af_3810_QueryInterface is access function
     (This      : access IViewObject;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3810_QueryInterface);

   type af_3815_AddRef is access function
     (This : access IViewObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3815_AddRef);

   type af_3818_Release is access function
     (This : access IViewObject)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_3818_Release);

   type af_3821_Draw is access function
     (This         : access IViewObject;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      hdcTargetDev : Win32.Windef.HDC;
      hdcDraw      : Win32.Windef.HDC;
      lprcBounds   : Win32.Objbase.LPCRECTL;
      lprcWBounds  : Win32.Objbase.LPCRECTL;
      pfnContinue  : access Win32.PBOOL;
      dwContinue   : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3821_Draw);

   type af_3835_GetColorSet is access function
     (This         : access IViewObject;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      hicTargetDev : Win32.Windef.HDC;
      ppColorSet   : access Win32.Wingdi.PLOGPALETTE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3835_GetColorSet);

   type af_3844_Freeze is access function
     (This         : access IViewObject;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      pdwFreeze    : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3844_Freeze);

   type af_3851_Unfreeze is access function
     (This     : access IViewObject;
      dwFreeze : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3851_Unfreeze);

   type af_3855_SetAdvise is access function
     (This     : access IViewObject;
      aspects  : Win32.DWORD;
      advf     : Win32.DWORD;
      pAdvSink : access Win32.Objbase.IAdviseSink)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3855_SetAdvise);

   type af_3861_GetAdvise is access function
     (This      : access IViewObject;
      pAspects  : access Win32.DWORD;
      pAdvf     : access Win32.DWORD;
      ppAdvSink : access Win32.Objbase.LPADVISESINK)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_3861_GetAdvise);

   type af_3924_pfnContinue is access function
     (dwContinue : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, af_3924_pfnContinue);

   type af_4047_QueryInterface is access function
     (This      : access IViewObject2;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4047_QueryInterface);

   type af_4052_AddRef is access function
     (This : access IViewObject2)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4052_AddRef);

   type af_4055_Release is access function
     (This : access IViewObject2)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4055_Release);

   type af_4058_Draw is access function
     (This         : access IViewObject2;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      hdcTargetDev : Win32.Windef.HDC;
      hdcDraw      : Win32.Windef.HDC;
      lprcBounds   : Win32.Objbase.LPCRECTL;
      lprcWBounds  : Win32.Objbase.LPCRECTL;
      pfnContinue  : access Win32.PBOOL;
      dwContinue   : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4058_Draw);

   type af_4072_GetColorSet is access function
     (This         : access IViewObject2;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      hicTargetDev : Win32.Windef.HDC;
      ppColorSet   : access Win32.Wingdi.PLOGPALETTE)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4072_GetColorSet);

   type af_4081_Freeze is access function
     (This         : access IViewObject2;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      pdwFreeze    : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4081_Freeze);

   type af_4088_Unfreeze is access function
     (This     : access IViewObject2;
      dwFreeze : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4088_Unfreeze);

   type af_4092_SetAdvise is access function
     (This     : access IViewObject2;
      aspects  : Win32.DWORD;
      advf     : Win32.DWORD;
      pAdvSink : access Win32.Objbase.IAdviseSink)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4092_SetAdvise);

   type af_4098_GetAdvise is access function
     (This      : access IViewObject2;
      pAspects  : access Win32.DWORD;
      pAdvf     : access Win32.DWORD;
      ppAdvSink : access Win32.Objbase.LPADVISESINK)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4098_GetAdvise);

   type af_4104_GetExtent is access function
     (This         : access IViewObject2;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      lpsizel      : Win32.Windef.LPSIZEL)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4104_GetExtent);

   type af_4217_QueryInterface is access function
     (This      : access IDropSource;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4217_QueryInterface);

   type af_4222_AddRef is access function
     (This : access IDropSource)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4222_AddRef);

   type af_4225_Release is access function
     (This : access IDropSource)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4225_Release);

   type af_4228_QueryContinueDrag is access function
     (This           : access IDropSource;
      fEscapePressed : Win32.BOOL;
      grfKeyState    : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4228_QueryContinueDrag);

   type af_4233_GiveFeedback is access function
     (This     : access IDropSource;
      dwEffect : Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4233_GiveFeedback);

   type af_4392_QueryInterface is access function
     (This      : access IDropTarget;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4392_QueryInterface);

   type af_4397_AddRef is access function
     (This : access IDropTarget)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4397_AddRef);

   type af_4400_Release is access function
     (This : access IDropTarget)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4400_Release);

   type af_4403_DragEnter is access function
     (This        : access IDropTarget;
      pDataObj    : access Win32.Objbase.IDataObject;
      grfKeyState : Win32.DWORD;
      pt          : Win32.Windef.POINTL;
      pdwEffect   : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4403_DragEnter);

   type af_4410_DragOver is access function
     (This        : access IDropTarget;
      grfKeyState : Win32.DWORD;
      pt          : Win32.Windef.POINTL;
      pdwEffect   : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4410_DragOver);

   type af_4416_DragLeave is access function
     (This : access IDropTarget)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4416_DragLeave);

   type af_4419_Drop is access function
     (This        : access IDropTarget;
      pDataObj    : access Win32.Objbase.IDataObject;
      grfKeyState : Win32.DWORD;
      pt          : Win32.Windef.POINTL;
      pdwEffect   : access Win32.DWORD)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4419_Drop);

   type af_4587_QueryInterface is access function
     (This      : access IEnumOLEVERB;
      riid      : Win32.Objbase.REFIID;
      ppvObject : access Win32.PVOID)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4587_QueryInterface);

   type af_4592_AddRef is access function
     (This : access IEnumOLEVERB)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4592_AddRef);

   type af_4595_Release is access function
     (This : access IEnumOLEVERB)
      return Win32.ULONG;
   pragma Convention (Stdcall, af_4595_Release);

   type af_4598_Next is access function
     (This         : access IEnumOLEVERB;
      celt         : Win32.ULONG;
      rgelt        : LPOLEVERB;
      pceltFetched : access Win32.ULONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4598_Next);

   type af_4604_Skip is access function
     (This : access IEnumOLEVERB;
      celt : Win32.ULONG)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4604_Skip);

   type af_4608_Reset is access function
     (This : access IEnumOLEVERB)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4608_Reset);

   type af_4611_Clone is access function
     (This   : access IEnumOLEVERB;
      ppenum : access LPENUMOLEVERB)
      return Win32.Objbase.HRESULT;
   pragma Convention (Stdcall, af_4611_Clone);

   type af_4988_Get is access function
     (p1   : LPOLESTREAM;
      p2   : Win32.PVOID;
      p3   : Win32.DWORD)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_4988_Get);

   type af_4989_Put is access function
     (p1   : LPOLESTREAM;
      p2   : Win32.PVOID;
      p3   : Win32.DWORD)
      return Win32.DWORD;
   pragma Convention (Stdcall, af_4989_Put);

   type IOleAdviseHolderVtbl is record
      QueryInterface : af_250_QueryInterface;
      AddRef         : af_255_AddRef;
      Release        : af_258_Release;
      Advise         : af_261_Advise;
      Unadvise       : af_266_Unadvise;
      EnumAdvise     : af_270_EnumAdvise;
      SendOnRename   : af_274_SendOnRename;
      SendOnSave     : af_278_SendOnSave;
      SendOnClose    : af_281_SendOnClose;
   end record;

   type IOleCacheVtbl is record
      QueryInterface : af_454_QueryInterface;
      AddRef         : af_459_AddRef;
      Release        : af_462_Release;
      Cache          : af_465_Cache;
      Uncache        : af_471_Uncache;
      EnumCache      : af_475_EnumCache;
      InitCache      : af_479_InitCache;
      SetData        : af_483_SetData;
   end record;

   type IOleCache2Vtbl is record
      QueryInterface : af_676_QueryInterface;
      AddRef         : af_681_AddRef;
      Release        : af_684_Release;
      Cache          : af_687_Cache;
      Uncache        : af_693_Uncache;
      EnumCache      : af_697_EnumCache;
      InitCache      : af_701_InitCache;
      SetData        : af_705_SetData;
      UpdateCache    : af_711_UpdateCache;
      DiscardCache   : af_717_DiscardCache;
   end record;

   type IOleCacheControlVtbl is record
      QueryInterface : af_836_QueryInterface;
      AddRef         : af_841_AddRef;
      Release        : af_844_Release;
      OnRun          : af_847_OnRun;
      OnStop         : af_851_OnStop;
   end record;

   type IOleContainerVtbl is record
      QueryInterface   : af_952_QueryInterface;
      AddRef           : af_957_AddRef;
      Release          : af_960_Release;
      ParseDisplayName : af_963_ParseDisplayName;
      EnumObjects      : af_970_EnumObjects;
      LockContainer    : af_975_LockContainer;
   end record;

   type IOleClientSiteVtbl is record
      QueryInterface         : af_1093_QueryInterface;
      AddRef                 : af_1098_AddRef;
      Release                : af_1101_Release;
      SaveObject             : af_1104_SaveObject;
      GetMoniker             : af_1107_GetMoniker;
      GetContainer           : af_1113_GetContainer;
      ShowObject             : af_1117_ShowObject;
      OnShowWindow           : af_1120_OnShowWindow;
      RequestNewObjectLayout : af_1124_RequestNewObjectLayout;
   end record;

   type IOleObjectVtbl is record
      QueryInterface   : af_1404_QueryInterface;
      AddRef           : af_1409_AddRef;
      Release          : af_1412_Release;
      SetClientSite    : af_1415_SetClientSite;
      GetClientSite    : af_1419_GetClientSite;
      SetHostNames     : af_1423_SetHostNames;
      Close            : af_1428_Close;
      SetMoniker       : af_1432_SetMoniker;
      GetMoniker       : af_1437_GetMoniker;
      InitFromData     : af_1443_InitFromData;
      GetClipboardData : af_1449_GetClipboardData;
      DoVerb           : af_1454_DoVerb;
      EnumVerbs        : af_1463_EnumVerbs;
      Update           : af_1467_Update;
      IsUpToDate       : af_1470_IsUpToDate;
      GetUserClassID   : af_1473_GetUserClassID;
      GetUserType      : af_1477_GetUserType;
      SetExtent        : af_1482_SetExtent;
      GetExtent        : af_1487_GetExtent;
      Advise           : af_1492_Advise;
      Unadvise         : af_1497_Unadvise;
      EnumAdvise       : af_1501_EnumAdvise;
      GetMiscStatus    : af_1505_GetMiscStatus;
      SetColorScheme   : af_1510_SetColorScheme;
   end record;

   type LPOLERENDER is access all OLERENDER;

   type IOleWindowVtbl is record
      QueryInterface       : af_1969_QueryInterface;
      AddRef               : af_1974_AddRef;
      Release              : af_1977_Release;
      GetWindow            : af_1980_GetWindow;
      ContextSensitiveHelp : af_1984_ContextSensitiveHelp;
   end record;

   type LPOLEUPDATE is access all OLEUPDATE;
   type POLEUPDATE is access all OLEUPDATE;

   type IOleLinkVtbl is record
      QueryInterface       : af_2132_QueryInterface;
      AddRef               : af_2137_AddRef;
      Release              : af_2140_Release;
      SetUpdateOptions     : af_2143_SetUpdateOptions;
      GetUpdateOptions     : af_2147_GetUpdateOptions;
      SetSourceMoniker     : af_2151_SetSourceMoniker;
      GetSourceMoniker     : af_2156_GetSourceMoniker;
      SetSourceDisplayName : af_2160_SetSourceDisplayName;
      GetSourceDisplayName : af_2164_GetSourceDisplayName;
      BindToSource         : af_2168_BindToSource;
      BindIfRunning        : af_2173_BindIfRunning;
      GetBoundSource       : af_2176_GetBoundSource;
      UnbindSource         : af_2180_UnbindSource;
      Update               : af_2183_Update;
   end record;

   type IOleItemContainerVtbl is record
      QueryInterface   : af_2448_QueryInterface;
      AddRef           : af_2453_AddRef;
      Release          : af_2456_Release;
      ParseDisplayName : af_2459_ParseDisplayName;
      EnumObjects      : af_2466_EnumObjects;
      LockContainer    : af_2471_LockContainer;
      GetObjectA       : af_2475_GetObjectA;
      GetObjectStorage : af_2483_GetObjectStorage;
      IsRunning        : af_2490_IsRunning;
   end record;

   subtype BORDERWIDTHS is Win32.Windef.RECT;

   type IOleInPlaceUIWindowVtbl is record
      QueryInterface       : af_2641_QueryInterface;
      AddRef               : af_2646_AddRef;
      Release              : af_2649_Release;
      GetWindow            : af_2652_GetWindow;
      ContextSensitiveHelp : af_2656_ContextSensitiveHelp;
      GetBorder            : af_2660_GetBorder;
      RequestBorderSpace   : af_2664_RequestBorderSpace;
      SetBorderSpace       : af_2668_SetBorderSpace;
      SetActiveObject      : af_2672_SetActiveObject;
   end record;

   type IOleInPlaceActiveObjectVtbl is record
      QueryInterface        : af_2824_QueryInterface;
      AddRef                : af_2829_AddRef;
      Release               : af_2832_Release;
      GetWindow             : af_2835_GetWindow;
      ContextSensitiveHelp  : af_2839_ContextSensitiveHelp;
      TranslateAcceleratorA : af_2843_TranslateAcceleratorA;
      OnFrameWindowActivate : af_2847_OnFrameWindowActivate;
      OnDocWindowActivate   : af_2851_OnDocWindowActivate;
      ResizeBorder          : af_2855_ResizeBorder;
      EnableModeless        : af_2861_EnableModeless;
   end record;

   type OLEINPLACEFRAMEINFO is record
      cb            : Win32.UINT;
      fMDIApp       : Win32.BOOL;
      hwndFrame     : Win32.Windef.HWND;
      haccel        : Win32.Windef.HACCEL;
      cAccelEntries : Win32.UINT;
   end record;

   type OLEMENUGROUPWIDTHS is record
      width : Win32.LONG_Array (0 .. 5);
   end record;

   type IOleInPlaceFrameVtbl is record
      QueryInterface        : af_3058_QueryInterface;
      AddRef                : af_3063_AddRef;
      Release               : af_3066_Release;
      GetWindow             : af_3069_GetWindow;
      ContextSensitiveHelp  : af_3073_ContextSensitiveHelp;
      GetBorder             : af_3077_GetBorder;
      RequestBorderSpace    : af_3081_RequestBorderSpace;
      SetBorderSpace        : af_3085_SetBorderSpace;
      SetActiveObject       : af_3089_SetActiveObject;
      InsertMenus           : af_3094_InsertMenus;
      SetMenu               : af_3099_SetMenu;
      RemoveMenus           : af_3105_RemoveMenus;
      SetStatusText         : af_3109_SetStatusText;
      EnableModeless        : af_3113_EnableModeless;
      TranslateAcceleratorA : af_3117_TranslateAcceleratorA;
   end record;

   type IOleInPlaceObjectVtbl is record
      QueryInterface       : af_3308_QueryInterface;
      AddRef               : af_3313_AddRef;
      Release              : af_3316_Release;
      GetWindow            : af_3319_GetWindow;
      ContextSensitiveHelp : af_3323_ContextSensitiveHelp;
      InPlaceDeactivate    : af_3327_InPlaceDeactivate;
      UIDeactivate         : af_3330_UIDeactivate;
      SetObjectRects       : af_3333_SetObjectRects;
      ReactivateAndUndo    : af_3338_ReactivateAndUndo;
   end record;

   type IOleInPlaceSiteVtbl is record
      QueryInterface       : af_3496_QueryInterface;
      AddRef               : af_3501_AddRef;
      Release              : af_3504_Release;
      GetWindow            : af_3507_GetWindow;
      ContextSensitiveHelp : af_3511_ContextSensitiveHelp;
      CanInPlaceActivate   : af_3515_CanInPlaceActivate;
      OnInPlaceActivate    : af_3518_OnInPlaceActivate;
      OnUIActivate         : af_3521_OnUIActivate;
      GetWindowContext     : af_3524_GetWindowContext;
      Scroll               : af_3532_Scroll;
      OnUIDeactivate       : af_3536_OnUIDeactivate;
      OnInPlaceDeactivate  : af_3540_OnInPlaceDeactivate;
      DiscardUndoState     : af_3543_DiscardUndoState;
      DeactivateAndUndo    : af_3546_DeactivateAndUndo;
      OnPosRectChange      : af_3549_OnPosRectChange;
   end record;

   type IViewObjectVtbl is record
      QueryInterface : af_3810_QueryInterface;
      AddRef         : af_3815_AddRef;
      Release        : af_3818_Release;
      Draw           : af_3821_Draw;
      GetColorSet    : af_3835_GetColorSet;
      Freeze         : af_3844_Freeze;
      Unfreeze       : af_3851_Unfreeze;
      SetAdvise      : af_3855_SetAdvise;
      GetAdvise      : af_3861_GetAdvise;
   end record;

   type IViewObject2Vtbl is record
      QueryInterface : af_4047_QueryInterface;
      AddRef         : af_4052_AddRef;
      Release        : af_4055_Release;
      Draw           : af_4058_Draw;
      GetColorSet    : af_4072_GetColorSet;
      Freeze         : af_4081_Freeze;
      Unfreeze       : af_4088_Unfreeze;
      SetAdvise      : af_4092_SetAdvise;
      GetAdvise      : af_4098_GetAdvise;
      GetExtent      : af_4104_GetExtent;
   end record;

   type IDropSourceVtbl is record
      QueryInterface    : af_4217_QueryInterface;
      AddRef            : af_4222_AddRef;
      Release           : af_4225_Release;
      QueryContinueDrag : af_4228_QueryContinueDrag;
      GiveFeedback      : af_4233_GiveFeedback;
   end record;

   type IDropTargetVtbl is record
      QueryInterface : af_4392_QueryInterface;
      AddRef         : af_4397_AddRef;
      Release        : af_4400_Release;
      DragEnter      : af_4403_DragEnter;
      DragOver       : af_4410_DragOver;
      DragLeave      : af_4416_DragLeave;
      Drop           : af_4419_Drop;
   end record;

   type OLEVERB is record
      lVerb        : Win32.LONG;
      lpszVerbName : Win32.Objbase.LPOLESTR;
      fuFlags      : Win32.DWORD;
      grfAttribs   : Win32.DWORD;
   end record;

   type IEnumOLEVERBVtbl is record
      QueryInterface : af_4587_QueryInterface;
      AddRef         : af_4592_AddRef;
      Release        : af_4595_Release;
      Next           : af_4598_Next;
      Skip           : af_4604_Skip;
      Reset          : af_4608_Reset;
      Clone          : af_4611_Clone;
   end record;

   type OLESTREAM is record
      lpstbl : LPOLESTREAMVTBL;
   end record;

   type OLESTREAMVTBL is record
      Get : af_4988_Get;
      Put : af_4989_Put;
   end record;

   type OBJECTDESCRIPTOR is record
      cbSize             : Win32.ULONG;
      clsid              : Win32.Objbase.CLSID;
      dwDrawAspect       : Win32.DWORD;
      sizel              : Win32.Windef.SIZEL;
      pointl             : Win32.Windef.POINTL;
      dwStatus           : Win32.DWORD;
      dwFullUserTypeName : Win32.DWORD;
      dwSrcOfCopy        : Win32.DWORD;
   end record;

   subtype LINKSRCDESCRIPTOR is OBJECTDESCRIPTOR;

   IID_IOleAdviseHolder        : Win32.Objbase.IID;
   IID_IOleCache               : Win32.Objbase.IID;
   IID_IOleCache2              : Win32.Objbase.IID;
   IID_IOleCacheControl        : Win32.Objbase.IID;
   IID_IOleContainer           : Win32.Objbase.IID;
   IID_IOleClientSite          : Win32.Objbase.IID;
   IID_IOleObject              : Win32.Objbase.IID;
   IOLETypes_v0_0_c_ifspec     : Win32.Rpcdce.RPC_IF_HANDLE;
   IOLETypes_v0_0_s_ifspec     : Win32.Rpcdce.RPC_IF_HANDLE;
   IID_IOleWindow              : Win32.Objbase.IID;
   IID_IOleLink                : Win32.Objbase.IID;
   IID_IOleItemContainer       : Win32.Objbase.IID;
   IID_IOleInPlaceUIWindow     : Win32.Objbase.IID;
   IID_IOleInPlaceActiveObject : Win32.Objbase.IID;
   IID_IOleInPlaceFrame        : Win32.Objbase.IID;
   IID_IOleInPlaceObject       : Win32.Objbase.IID;
   IID_IOleInPlaceSite         : Win32.Objbase.IID;
   IID_IViewObject             : Win32.Objbase.IID;
   IID_IViewObject2            : Win32.Objbase.IID;
   IID_IDropSource             : Win32.Objbase.IID;
   IID_IDropTarget             : Win32.Objbase.IID;
   IID_IEnumOLEVERB            : Win32.Objbase.IID;

   function IOleAdviseHolder_Advise_Proxy
     (This          : access IOleAdviseHolder;
      pAdvise       : access Win32.Objbase.IAdviseSink;
      pdwConnection : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleAdviseHolder_Advise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleAdviseHolder_Unadvise_Proxy
     (This         : access IOleAdviseHolder;
      dwConnection : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleAdviseHolder_Unadvise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleAdviseHolder_EnumAdvise_Proxy
     (This         : access IOleAdviseHolder;
      ppenumAdvise : access Win32.Objbase.LPENUMSTATDATA)
      return Win32.Objbase.HRESULT;

   procedure IOleAdviseHolder_EnumAdvise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleAdviseHolder_SendOnRename_Proxy
     (This : access IOleAdviseHolder;
      pmk  : access Win32.Objbase.IMoniker)
      return Win32.Objbase.HRESULT;

   procedure IOleAdviseHolder_SendOnRename_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleAdviseHolder_SendOnSave_Proxy
     (This : access IOleAdviseHolder)
      return Win32.Objbase.HRESULT;

   procedure IOleAdviseHolder_SendOnSave_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleAdviseHolder_SendOnClose_Proxy
     (This : access IOleAdviseHolder)
      return Win32.Objbase.HRESULT;

   procedure IOleAdviseHolder_SendOnClose_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCache_Cache_Proxy
     (This          : access IOleCache;
      pformatetc    : access Win32.Objbase.FORMATETC;
      advf          : Win32.DWORD;
      pdwConnection : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleCache_Cache_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCache_Uncache_Proxy
     (This         : access IOleCache;
      dwConnection : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleCache_Uncache_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCache_EnumCache_Proxy
     (This           : access IOleCache;
      ppenumSTATDATA : access Win32.Objbase.LPENUMSTATDATA)
      return Win32.Objbase.HRESULT;

   procedure IOleCache_EnumCache_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCache_InitCache_Proxy
     (This        : access IOleCache;
      pDataObject : access Win32.Objbase.IDataObject)
      return Win32.Objbase.HRESULT;

   procedure IOleCache_InitCache_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCache_SetData_Proxy
     (This       : access IOleCache;
      pformatetc : access Win32.Objbase.FORMATETC;
      pmedium    : access Win32.Objbase.STGMEDIUM;
      fRelease   : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleCache_SetData_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure DISCARDCACHE_to_xmit
     (pEnum  : PDISCARDCACHE;
      ppLong : Win32.PLONG);

   procedure DISCARDCACHE_from_xmit
     (pLong : Win32.PLONG;
      pEnum : PDISCARDCACHE);

   function IOleCache2_UpdateCache_Proxy
     (This        : access IOleCache2;
      pDataObject : Win32.Objbase.LPDATAOBJECT;
      grfUpdf     : Win32.DWORD;
      pReserved   : Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   procedure IOleCache2_UpdateCache_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCache2_DiscardCache_Proxy
     (This             : access IOleCache2;
      dwDiscardOptions : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleCache2_DiscardCache_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCacheControl_OnRun_Proxy
     (This        : access IOleCacheControl;
      pDataObject : Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;

   procedure IOleCacheControl_OnRun_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleCacheControl_OnStop_Proxy
     (This : access IOleCacheControl)
      return Win32.Objbase.HRESULT;

   procedure IOleCacheControl_OnStop_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleContainer_EnumObjects_Proxy
     (This     : access IOleContainer;
      grfFlags : Win32.DWORD;
      ppenum   : access Win32.Objbase.LPENUMUNKNOWN)
      return Win32.Objbase.HRESULT;

   procedure IOleContainer_EnumObjects_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleContainer_LockContainer_Proxy
     (This  : access IOleContainer;
      fLock : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleContainer_LockContainer_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleClientSite_SaveObject_Proxy
     (This : access IOleClientSite)
      return Win32.Objbase.HRESULT;

   procedure IOleClientSite_SaveObject_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleClientSite_GetMoniker_Proxy
     (This           : access IOleClientSite;
      dwAssign       : Win32.DWORD;
      dwWhichMoniker : Win32.DWORD;
      ppmk           : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;

   procedure IOleClientSite_GetMoniker_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleClientSite_GetContainer_Proxy
     (This        : access IOleClientSite;
      ppContainer : access LPOLECONTAINER)
      return Win32.Objbase.HRESULT;

   procedure IOleClientSite_GetContainer_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleClientSite_ShowObject_Proxy
     (This : access IOleClientSite)
      return Win32.Objbase.HRESULT;

   procedure IOleClientSite_ShowObject_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleClientSite_OnShowWindow_Proxy
     (This  : access IOleClientSite;
      fShow : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleClientSite_OnShowWindow_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleClientSite_RequestNewObjectLayout_Proxy
     (This : access IOleClientSite)
      return Win32.Objbase.HRESULT;

   procedure IOleClientSite_RequestNewObjectLayout_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_SetClientSite_Proxy
     (This        : access IOleObject;
      pClientSite : access IOleClientSite)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_SetClientSite_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_GetClientSite_Proxy
     (This         : access IOleObject;
      ppClientSite : access LPOLECLIENTSITE)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_GetClientSite_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_SetHostNames_Proxy
     (This           : access IOleObject;
      szContainerApp : Win32.Objbase.LPCOLESTR;
      szContainerObj : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_SetHostNames_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_Close_Proxy
     (This         : access IOleObject;
      dwSaveOption : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_Close_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_SetMoniker_Proxy
     (This           : access IOleObject;
      dwWhichMoniker : Win32.DWORD;
      pmk            : access Win32.Objbase.IMoniker)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_SetMoniker_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_GetMoniker_Proxy
     (This           : access IOleObject;
      dwAssign       : Win32.DWORD;
      dwWhichMoniker : Win32.DWORD;
      ppmk           : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_GetMoniker_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_InitFromData_Proxy
     (This        : access IOleObject;
      pDataObject : access Win32.Objbase.IDataObject;
      fCreation   : Win32.BOOL;
      dwReserved  : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_InitFromData_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_GetClipboardData_Proxy
     (This         : access IOleObject;
      dwReserved   : Win32.DWORD;
      ppDataObject : access Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_GetClipboardData_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_DoVerb_Proxy
     (This        : access IOleObject;
      iVerb       : Win32.LONG;
      lpmsg       : Win32.Winuser.LPMSG;
      pActiveSite : access IOleClientSite;
      lindex      : Win32.LONG;
      hwndParent  : Win32.Windef.HWND;
      lprcPosRect : Win32.Objbase.LPCRECT)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_DoVerb_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_EnumVerbs_Proxy
     (This          : access IOleObject;
      ppEnumOleVerb : access LPENUMOLEVERB)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_EnumVerbs_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_Update_Proxy
     (This : access IOleObject)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_Update_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_IsUpToDate_Proxy
     (This : access IOleObject)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_IsUpToDate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_GetUserClassID_Proxy
     (This   : access IOleObject;
      pClsid : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_GetUserClassID_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_GetUserType_Proxy
     (This         : access IOleObject;
      dwFormOfType : Win32.DWORD;
      pszUserType  : access Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_GetUserType_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_SetExtent_Proxy
     (This         : access IOleObject;
      dwDrawAspect : Win32.DWORD;
      psizel       : access Win32.Windef.SIZE)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_SetExtent_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_GetExtent_Proxy
     (This         : access IOleObject;
      dwDrawAspect : Win32.DWORD;
      psizel       : access Win32.Windef.SIZE)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_GetExtent_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_Advise_Proxy
     (This          : access IOleObject;
      pAdvSink      : access Win32.Objbase.IAdviseSink;
      pdwConnection : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_Advise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_Unadvise_Proxy
     (This         : access IOleObject;
      dwConnection : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_Unadvise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_EnumAdvise_Proxy
     (This         : access IOleObject;
      ppenumAdvise : access Win32.Objbase.LPENUMSTATDATA)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_EnumAdvise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_GetMiscStatus_Proxy
     (This      : access IOleObject;
      dwAspect  : Win32.DWORD;
      pdwStatus : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_GetMiscStatus_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleObject_SetColorScheme_Proxy
     (This    : access IOleObject;
      pLogpal : access Win32.Wingdi.LOGPALETTE)
      return Win32.Objbase.HRESULT;

   procedure IOleObject_SetColorScheme_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleWindow_GetWindow_Proxy
     (This  : access IOleWindow;
      phwnd : access Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;

   procedure IOleWindow_GetWindow_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleWindow_ContextSensitiveHelp_Proxy
     (This       : access IOleWindow;
      fEnterMode : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleWindow_ContextSensitiveHelp_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_SetUpdateOptions_Proxy
     (This        : access IOleLink;
      dwUpdateOpt : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_SetUpdateOptions_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_GetUpdateOptions_Proxy
     (This         : access IOleLink;
      pdwUpdateOpt : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_GetUpdateOptions_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_SetSourceMoniker_Proxy
     (This   : access IOleLink;
      pmk    : access Win32.Objbase.IMoniker;
      rclsid : Win32.Objbase.REFCLSID)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_SetSourceMoniker_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_GetSourceMoniker_Proxy
     (This : access IOleLink;
      ppmk : access Win32.Objbase.LPMONIKER)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_GetSourceMoniker_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_SetSourceDisplayName_Proxy
     (This          : access IOleLink;
      pszStatusText : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_SetSourceDisplayName_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_GetSourceDisplayName_Proxy
     (This            : access IOleLink;
      ppszDisplayName : access Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_GetSourceDisplayName_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_BindToSource_Proxy
     (This      : access IOleLink;
      bindflags : Win32.DWORD;
      pbc       : access Win32.Objbase.IBindCtx)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_BindToSource_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_BindIfRunning_Proxy
     (This : access IOleLink)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_BindIfRunning_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_GetBoundSource_Proxy
     (This  : access IOleLink;
      ppunk : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_GetBoundSource_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_UnbindSource_Proxy
     (This : access IOleLink)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_UnbindSource_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleLink_Update_Proxy
     (This : access IOleLink;
      pbc  : access Win32.Objbase.IBindCtx)
      return Win32.Objbase.HRESULT;

   procedure IOleLink_Update_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleItemContainer_RemoteGetObject_Proxy
     (This          : access IOleItemContainer;
      pszItem       : Win32.Objbase.LPOLESTR;
      dwSpeedNeeded : Win32.DWORD;
      pbc           : access Win32.Objbase.IBindCtx;
      riid          : Win32.Objbase.REFIID;
      ppvObject     : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   procedure IOleItemContainer_RemoteGetObject_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleItemContainer_RemoteGetObjectStorage_Proxy
     (This       : access IOleItemContainer;
      pszItem    : Win32.Objbase.LPOLESTR;
      pbc        : access Win32.Objbase.IBindCtx;
      riid       : Win32.Objbase.REFIID;
      ppvStorage : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   procedure IOleItemContainer_RemoteGetObjectStorage_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleItemContainer_IsRunning_Proxy
     (This    : access IOleItemContainer;
      pszItem : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   procedure IOleItemContainer_IsRunning_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceUIWindow_GetBorder_Proxy
     (This         : access IOleInPlaceUIWindow;
      lprectBorder : Win32.Windef.LPRECT)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceUIWindow_GetBorder_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceUIWindow_RequestBorderSpace_Proxy
     (This          : access IOleInPlaceUIWindow;
      pborderwidths : LPCBORDERWIDTHS)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceUIWindow_RequestBorderSpace_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceUIWindow_SetBorderSpace_Proxy
     (This          : access IOleInPlaceUIWindow;
      pborderwidths : LPCBORDERWIDTHS)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceUIWindow_SetBorderSpace_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceUIWindow_SetActiveObject_Proxy
     (This          : access IOleInPlaceUIWindow;
      pActiveObject : access IOleInPlaceActiveObject;
      pszObjName    : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceUIWindow_SetActiveObject_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceActiveObject_RemoteTranslateAccelerator_Proxy
     (This : access IOleInPlaceActiveObject)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceActiveObject_RemoteTranslateAccelerator_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceActiveObject_OnFrameWindowActivate_Proxy
     (This      : access IOleInPlaceActiveObject;
      fActivate : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceActiveObject_OnFrameWindowActivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceActiveObject_OnDocWindowActivate_Proxy
     (This      : access IOleInPlaceActiveObject;
      fActivate : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceActiveObject_OnDocWindowActivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceActiveObject_RemoteResizeBorder_Proxy
     (This         : access IOleInPlaceActiveObject;
      prcBorder    : Win32.Objbase.LPCRECT;
      riid         : Win32.Objbase.REFIID;
      pUIWindow    : access IOleInPlaceUIWindow;
      fFrameWindow : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceActiveObject_RemoteResizeBorder_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceActiveObject_EnableModeless_Proxy
     (This    : access IOleInPlaceActiveObject;
      fEnable : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceActiveObject_EnableModeless_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceFrame_InsertMenus_Proxy
     (This         : access IOleInPlaceFrame;
      hmenuShared  : Win32.Windef.HMENU;
      lpMenuWidths : LPOLEMENUGROUPWIDTHS)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceFrame_InsertMenus_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceFrame_SetMenu_Proxy
     (This             : access IOleInPlaceFrame;
      hmenuShared      : Win32.Windef.HMENU;
      holemenu         : Win32.Ole2.HOLEMENU;
      hwndActiveObject : Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceFrame_SetMenu_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceFrame_RemoveMenus_Proxy
     (This        : access IOleInPlaceFrame;
      hmenuShared : Win32.Windef.HMENU)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceFrame_RemoveMenus_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceFrame_SetStatusText_Proxy
     (This          : access IOleInPlaceFrame;
      pszStatusText : Win32.Objbase.LPCOLESTR)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceFrame_SetStatusText_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceFrame_EnableModeless_Proxy
     (This    : access IOleInPlaceFrame;
      fEnable : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceFrame_EnableModeless_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceFrame_TranslateAccelerator_Proxy
     (This  : access IOleInPlaceFrame;
      lpmsg : Win32.Winuser.LPMSG;
      wID   : Win32.WORD)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceFrame_TranslateAccelerator_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceObject_InPlaceDeactivate_Proxy
     (This : access IOleInPlaceObject)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceObject_InPlaceDeactivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceObject_UIDeactivate_Proxy
     (This : access IOleInPlaceObject)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceObject_UIDeactivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceObject_SetObjectRects_Proxy
     (This         : access IOleInPlaceObject;
      lprcPosRect  : Win32.Objbase.LPCRECT;
      lprcClipRect : Win32.Objbase.LPCRECT)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceObject_SetObjectRects_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceObject_ReactivateAndUndo_Proxy
     (This : access IOleInPlaceObject)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceObject_ReactivateAndUndo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_CanInPlaceActivate_Proxy
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_CanInPlaceActivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_OnInPlaceActivate_Proxy
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_OnInPlaceActivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_OnUIActivate_Proxy
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_OnUIActivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_GetWindowContext_Proxy
     (This         : access IOleInPlaceSite;
      ppFrame      : access LPOLEINPLACEFRAME;
      ppDoc        : access LPOLEINPLACEUIWINDOW;
      lprcPosRect  : Win32.Windef.LPRECT;
      lprcClipRect : Win32.Windef.LPRECT;
      lpFrameInfo  : LPOLEINPLACEFRAMEINFO)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_GetWindowContext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_Scroll_Proxy
     (This         : access IOleInPlaceSite;
      scrollExtant : Win32.Windef.SIZE)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_Scroll_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_OnUIDeactivate_Proxy
     (This      : access IOleInPlaceSite;
      fUndoable : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_OnUIDeactivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_OnInPlaceDeactivate_Proxy
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_OnInPlaceDeactivate_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_DiscardUndoState_Proxy
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_DiscardUndoState_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_DeactivateAndUndo_Proxy
     (This : access IOleInPlaceSite)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_DeactivateAndUndo_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IOleInPlaceSite_OnPosRectChange_Proxy
     (This        : access IOleInPlaceSite;
      lprcPosRect : Win32.Objbase.LPCRECT)
      return Win32.Objbase.HRESULT;

   procedure IOleInPlaceSite_OnPosRectChange_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IViewObject_Draw_Proxy
     (This         : access IViewObject;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      hdcTargetDev : Win32.Windef.HDC;
      hdcDraw      : Win32.Windef.HDC;
      lprcBounds   : Win32.Objbase.LPCRECTL;
      lprcWBounds  : Win32.Objbase.LPCRECTL;
      pfnContinue  : af_3924_pfnContinue;
      dwContinue   : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IViewObject_Draw_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IViewObject_GetColorSet_Proxy
     (This         : access IViewObject;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      hicTargetDev : Win32.Windef.HDC;
      ppColorSet   : access Win32.Wingdi.LOGPALETTE)
      return Win32.Objbase.HRESULT;

   procedure IViewObject_GetColorSet_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IViewObject_Freeze_Proxy
     (This         : access IViewObject;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      pvAspect     : Win32.PVOID;
      pdwFreeze    : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IViewObject_Freeze_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IViewObject_Unfreeze_Proxy
     (This     : access IViewObject;
      dwFreeze : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IViewObject_Unfreeze_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IViewObject_SetAdvise_Proxy
     (This     : access IViewObject;
      aspects  : Win32.DWORD;
      advf     : Win32.DWORD;
      pAdvSink : access Win32.Objbase.IAdviseSink)
      return Win32.Objbase.HRESULT;

   procedure IViewObject_SetAdvise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IViewObject_GetAdvise_Proxy
     (This      : access IViewObject;
      pAspects  : Win32.PDWORD;
      pAdvf     : Win32.PDWORD;
      ppAdvSink : access Win32.Objbase.LPADVISESINK)
      return Win32.Objbase.HRESULT;

   procedure IViewObject_GetAdvise_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IViewObject2_GetExtent_Proxy
     (This         : access IViewObject2;
      dwDrawAspect : Win32.DWORD;
      lindex       : Win32.LONG;
      ptd          : access Win32.Objbase.DVTARGETDEVICE;
      lpsizel      : Win32.Windef.LPSIZEL)
      return Win32.Objbase.HRESULT;

   procedure IViewObject2_GetExtent_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDropSource_QueryContinueDrag_Proxy
     (This           : access IDropSource;
      fEscapePressed : Win32.BOOL;
      grfKeyState    : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IDropSource_QueryContinueDrag_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDropSource_GiveFeedback_Proxy
     (This     : access IDropSource;
      dwEffect : Win32.DWORD)
      return Win32.Objbase.HRESULT;

   procedure IDropSource_GiveFeedback_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDropTarget_DragEnter_Proxy
     (This        : access IDropTarget;
      pDataObj    : access Win32.Objbase.IDataObject;
      grfKeyState : Win32.DWORD;
      pt          : Win32.Windef.POINTL;
      pdwEffect   : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IDropTarget_DragEnter_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDropTarget_DragOver_Proxy
     (This        : access IDropTarget;
      grfKeyState : Win32.DWORD;
      pt          : Win32.Windef.POINTL;
      pdwEffect   : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IDropTarget_DragOver_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDropTarget_DragLeave_Proxy
     (This : access IDropTarget)
      return Win32.Objbase.HRESULT;

   procedure IDropTarget_DragLeave_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IDropTarget_Drop_Proxy
     (This        : access IDropTarget;
      pDataObj    : access Win32.Objbase.IDataObject;
      grfKeyState : Win32.DWORD;
      pt          : Win32.Windef.POINTL;
      pdwEffect   : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IDropTarget_Drop_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumOLEVERB_RemoteNext_Proxy
     (This         : access IEnumOLEVERB;
      celt         : Win32.ULONG;
      rgelt        : LPOLEVERB;
      pceltFetched : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   procedure IEnumOLEVERB_RemoteNext_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumOLEVERB_Skip_Proxy
     (This : access IEnumOLEVERB;
      celt : Win32.ULONG)
      return Win32.Objbase.HRESULT;

   procedure IEnumOLEVERB_Skip_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumOLEVERB_Reset_Proxy
     (This : access IEnumOLEVERB)
      return Win32.Objbase.HRESULT;

   procedure IEnumOLEVERB_Reset_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   function IEnumOLEVERB_Clone_Proxy
     (This   : access IEnumOLEVERB;
      ppenum : access LPENUMOLEVERB)
      return Win32.Objbase.HRESULT;

   procedure IEnumOLEVERB_Clone_Stub
     (This              : access Win32.Objbase.IRpcStubBuffer;
      pRpcChannelBuffer : access Win32.Objbase.IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD);

   procedure UINT_to_xmit
     (p1 : access Win32.UINT;
      p2 : access Win32.LPLONG);

   procedure UINT_from_xmit
     (p1 : access Win32.LONG;
      p2 : access Win32.UINT);

   procedure UINT_free_inst (p1 : access Win32.UINT);

   procedure UINT_free_xmit (p1 : access Win32.LONG);

   procedure WPARAM_to_xmit
     (p1 : access Win32.WPARAM;
      p2 : access Win32.LPLONG);

   procedure WPARAM_from_xmit
     (p1 : access Win32.LONG;
      p2 : access Win32.WPARAM);

   procedure WPARAM_free_inst (p1 : access Win32.WPARAM);

   procedure WPARAM_free_xmit (p1 : access Win32.LONG);

   procedure HWND_to_xmit
     (p1 : access Win32.Windef.HWND;
      p2 : access Win32.LPLONG);

   procedure HWND_from_xmit
     (p1 : access Win32.LONG;
      p2 : access Win32.Windef.HWND);

   procedure HWND_free_inst (p1 : access Win32.Windef.HWND);

   procedure HWND_free_xmit (p1 : access Win32.LONG);

   procedure HMENU_to_xmit
     (p1 : access Win32.Windef.HMENU;
      p2 : access Win32.LPLONG);

   procedure HMENU_from_xmit
     (p1 : access Win32.LONG;
      p2 : access Win32.Windef.HMENU);

   procedure HMENU_free_inst (p1 : access Win32.Windef.HMENU);

   procedure HMENU_free_xmit (p1 : access Win32.LONG);

   procedure HACCEL_to_xmit
     (p1 : access Win32.Windef.HACCEL;
      p2 : access Win32.LPLONG);

   procedure HACCEL_from_xmit
     (p1 : access Win32.LONG;
      p2 : access Win32.Windef.HACCEL);

   procedure HACCEL_free_inst (p1 : access Win32.Windef.HACCEL);

   procedure HACCEL_free_xmit (p1 : access Win32.LONG);

   procedure HOLEMENU_to_xmit
     (p1 : access HOLEMENU;
      p2 : access Win32.Objbase.a_RemHGLOBAL_t);

   procedure HOLEMENU_from_xmit
     (p1 : access Win32.Objbase.RemHGLOBAL;
      p2 : access HOLEMENU);

   procedure HOLEMENU_free_inst (p1 : access HOLEMENU);

   procedure HOLEMENU_free_xmit (p1 : access Win32.Objbase.RemHGLOBAL);

   function IOleItemContainer_GetObject_Proxy
     (This          : access IOleItemContainer;
      pszItem       : Win32.Objbase.LPOLESTR;
      dwSpeedNeeded : Win32.DWORD;
      pbc           : access Win32.Objbase.IBindCtx;
      riid          : Win32.Objbase.REFIID;
      ppvObject     : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function IOleItemContainer_GetObject_Stub
     (This          : access Win32.Objbase.IRpcStubBuffer;
      pszItem       : Win32.Objbase.LPOLESTR;
      dwSpeedNeeded : Win32.DWORD;
      pbc           : access Win32.Objbase.IBindCtx;
      riid          : Win32.Objbase.REFIID;
      ppvObject     : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   function IOleItemContainer_GetObjectStorage_Proxy
     (This       : access IOleItemContainer;
      pszItem    : Win32.Objbase.LPOLESTR;
      pbc        : access Win32.Objbase.IBindCtx;
      riid       : Win32.Objbase.REFIID;
      ppvStorage : access Win32.PVOID)
      return Win32.Objbase.HRESULT;

   function IOleItemContainer_GetObjectStorage_Stub
     (This       : access Win32.Objbase.IRpcStubBuffer;
      pszItem    : Win32.Objbase.LPOLESTR;
      pbc        : access Win32.Objbase.IBindCtx;
      riid       : Win32.Objbase.REFIID;
      ppvStorage : access Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   function IOleInPlaceActiveObject_TranslateAccelerator_Proxy
     (This  : access IOleInPlaceActiveObject;
      lpmsg : Win32.Winuser.LPMSG)
      return Win32.Objbase.HRESULT;

   function IOleInPlaceActiveObject_TranslateAccelerator_Stub
     (This : access Win32.Objbase.IRpcStubBuffer)
      return Win32.Objbase.HRESULT;

   function IOleInPlaceActiveObject_ResizeBorder_Proxy
     (This         : access IOleInPlaceActiveObject;
      prcBorder    : Win32.Objbase.LPCRECT;
      pUIWindow    : access IOleInPlaceUIWindow;
      fFrameWindow : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function IOleInPlaceActiveObject_ResizeBorder_Stub
     (This         : access Win32.Objbase.IRpcStubBuffer;
      prcBorder    : Win32.Objbase.LPCRECT;
      riid         : Win32.Objbase.REFIID;
      pUIWindow    : access IOleInPlaceUIWindow;
      fFrameWindow : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function IEnumOLEVERB_Next_Proxy
     (This         : access IEnumOLEVERB;
      celt         : Win32.ULONG;
      rgelt        : LPOLEVERB;
      pceltFetched : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   function IEnumOLEVERB_Next_Stub
     (This         : access Win32.Objbase.IRpcStubBuffer;
      celt         : Win32.ULONG;
      rgelt        : LPOLEVERB;
      pceltFetched : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   function OleBuildVersion return Win32.DWORD;

   function ReadClassStg
     (pStg   : Win32.Objbase.LPSTORAGE;
      pclsid : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT;

   function WriteClassStg
     (pStg   : Win32.Objbase.LPSTORAGE;
      rclsid : Win32.Objbase.REFCLSID)
      return Win32.Objbase.HRESULT;

   function ReadClassStm
     (pStm   : Win32.Objbase.LPSTREAM;
      pclsid : access Win32.Objbase.CLSID)
      return Win32.Objbase.HRESULT;

   function WriteClassStm
     (pStm   : Win32.Objbase.LPSTREAM;
      rclsid : Win32.Objbase.REFCLSID)
      return Win32.Objbase.HRESULT;

   function WriteFmtUserTypeStg
     (pstg         : Win32.Objbase.LPSTORAGE;
      cf           : Win32.Objbase.CLIPFORMAT;
      lpszUserType : Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   function ReadFmtUserTypeStg
     (pstg           : Win32.Objbase.LPSTORAGE;
      pcf            : access Win32.Objbase.CLIPFORMAT;
      lplpszUserType : access Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   function OleInitialize
     (pvReserved : Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   procedure OleUninitialize;

   function OleQueryLinkFromData
     (pSrcDataObject : Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;

   function OleQueryCreateFromData
     (pSrcDataObject : Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;

   function OleCreate
     (rclsid      : Win32.Objbase.REFCLSID;
      riid        : Win32.Objbase.REFIID;
      renderopt   : Win32.DWORD;
      pFormatEtc  : Win32.Objbase.LPFORMATETC;
      pClientSite : LPOLECLIENTSITE;
      pStg        : Win32.Objbase.LPSTORAGE;
      ppvObj      : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleCreateFromData
     (pSrcDataObj : Win32.Objbase.LPDATAOBJECT;
      riid        : Win32.Objbase.REFIID;
      renderopt   : Win32.DWORD;
      pFormatEtc  : Win32.Objbase.LPFORMATETC;
      pClientSite : LPOLECLIENTSITE;
      pStg        : Win32.Objbase.LPSTORAGE;
      ppvObj      : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleCreateLinkFromData
     (pSrcDataObj : Win32.Objbase.LPDATAOBJECT;
      riid        : Win32.Objbase.REFIID;
      renderopt   : Win32.DWORD;
      pFormatEtc  : Win32.Objbase.LPFORMATETC;
      pClientSite : LPOLECLIENTSITE;
      pStg        : Win32.Objbase.LPSTORAGE;
      ppvObj      : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleCreateStaticFromData
     (pSrcDataObj : Win32.Objbase.LPDATAOBJECT;
      iid         : access Win32.Objbase.IID;
      renderopt   : Win32.DWORD;
      pFormatEtc  : Win32.Objbase.LPFORMATETC;
      pClientSite : LPOLECLIENTSITE;
      pStg        : Win32.Objbase.LPSTORAGE;
      ppvObj      : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleCreateLink
     (pmkLinkSrc  : Win32.Objbase.LPMONIKER;
      riid        : Win32.Objbase.REFIID;
      renderopt   : Win32.DWORD;
      lpFormatEtc : Win32.Objbase.LPFORMATETC;
      pClientSite : LPOLECLIENTSITE;
      pStg        : Win32.Objbase.LPSTORAGE;
      ppvObj      : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleCreateLinkToFile
     (lpszFileName : Win32.Objbase.LPCOLESTR;
      riid         : Win32.Objbase.REFIID;
      renderopt    : Win32.DWORD;
      lpFormatEtc  : Win32.Objbase.LPFORMATETC;
      pClientSite  : LPOLECLIENTSITE;
      pStg         : Win32.Objbase.LPSTORAGE;
      ppvObj       : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleCreateFromFile
     (rclsid       : Win32.Objbase.REFCLSID;
      lpszFileName : Win32.Objbase.LPCOLESTR;
      riid         : Win32.Objbase.REFIID;
      renderopt    : Win32.DWORD;
      lpFormatEtc  : Win32.Objbase.LPFORMATETC;
      pClientSite  : LPOLECLIENTSITE;
      pStg         : Win32.Objbase.LPSTORAGE;
      ppvObj       : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleLoad
     (pStg        : Win32.Objbase.LPSTORAGE;
      riid        : Win32.Objbase.REFIID;
      pClientSite : LPOLECLIENTSITE;
      ppvObj      : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleSave
     (pPS         : Win32.Objbase.LPPERSISTSTORAGE;
      pStg        : Win32.Objbase.LPSTORAGE;
      fSameAsLoad : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function OleLoadFromStream
     (pStm         : Win32.Objbase.LPSTREAM;
      iidInterface : access Win32.Objbase.IID;
      ppvObj       : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleSaveToStream
     (pPStm : Win32.Objbase.LPPERSISTSTREAM;
      pStm  : Win32.Objbase.LPSTREAM)
      return Win32.Objbase.HRESULT;

   function OleSetContainedObject
     (pUnknown   : Win32.Objbase.LPUNKNOWN;
      fContained : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function OleNoteObjectVisible
     (pUnknown : Win32.Objbase.LPUNKNOWN;
      fVisible : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function RegisterDragDrop
     (hwnd        : Win32.Windef.HWND;
      pDropTarget : LPDROPTARGET)
      return Win32.Objbase.HRESULT;

   function RevokeDragDrop
     (hwnd : Win32.Windef.HWND)
      return Win32.Objbase.HRESULT;

   function DoDragDrop
     (pDataObj    : Win32.Objbase.LPDATAOBJECT;
      pDropSource : LPDROPSOURCE;
      dwOKEffects : Win32.DWORD;
      pdwEffect   : Win32.LPDWORD)
      return Win32.Objbase.HRESULT;

   function OleSetClipboard
     (pDataObj : Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;

   function OleGetClipboard
     (ppDataObj : access Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;

   function OleFlushClipboard return Win32.Objbase.HRESULT;

   function OleIsCurrentClipboard
     (pDataObj : Win32.Objbase.LPDATAOBJECT)
      return Win32.Objbase.HRESULT;

   function OleCreateMenuDescriptor
     (hmenuCombined : Win32.Windef.HMENU;
      lpMenuWidths  : LPOLEMENUGROUPWIDTHS)
      return HOLEMENU;

   function OleSetMenuDescriptor
     (holemenu         : Win32.Ole2.HOLEMENU;
      hwndFrame        : Win32.Windef.HWND;
      hwndActiveObject : Win32.Windef.HWND;
      lpFrame          : LPOLEINPLACEFRAME;
      lpActiveObj      : LPOLEINPLACEACTIVEOBJECT)
      return Win32.Objbase.HRESULT;

   function OleDestroyMenuDescriptor
     (holemenu : Win32.Ole2.HOLEMENU)
      return Win32.Objbase.HRESULT;

   function OleTranslateAccelerator
     (lpFrame     : LPOLEINPLACEFRAME;
      lpFrameInfo : LPOLEINPLACEFRAMEINFO;
      lpmsg       : Win32.Winuser.LPMSG)
      return Win32.Objbase.HRESULT;

   function OleDuplicateData
     (hSrc     : Win32.Winnt.HANDLE;
      cfFormat : Win32.Objbase.CLIPFORMAT;
      uiFlags  : Win32.UINT)
      return Win32.Winnt.HANDLE;

   function OleDraw
     (pUnknown   : Win32.Objbase.LPUNKNOWN;
      dwAspect   : Win32.DWORD;
      hdcDraw    : Win32.Windef.HDC;
      lprcBounds : Win32.Objbase.LPCRECT)
      return Win32.Objbase.HRESULT;

   function OleRun
     (pUnknown : Win32.Objbase.LPUNKNOWN)
      return Win32.Objbase.HRESULT;

   function OleIsRunning (pObject : LPOLEOBJECT) return Win32.BOOL;

   function OleLockRunning
     (pUnknown          : Win32.Objbase.LPUNKNOWN;
      fLock             : Win32.BOOL;
      fLastUnlockCloses : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   procedure ReleaseStgMedium (pMedium : Win32.Objbase.LPSTGMEDIUM);

   function CreateOleAdviseHolder
     (ppOAHolder : access LPOLEADVISEHOLDER)
      return Win32.Objbase.HRESULT;

   function OleCreateDefaultHandler
     (clsid     : Win32.Objbase.REFCLSID;
      pUnkOuter : Win32.Objbase.LPUNKNOWN;
      riid      : Win32.Objbase.REFIID;
      lplpObj   : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function OleCreateEmbeddingHelper
     (clsid     : Win32.Objbase.REFCLSID;
      pUnkOuter : Win32.Objbase.LPUNKNOWN;
      flags     : Win32.DWORD;
      pCF       : Win32.Objbase.LPCLASSFACTORY;
      riid      : Win32.Objbase.REFIID;
      lplpObj   : access Win32.LPVOID)
      return Win32.Objbase.HRESULT;

   function IsAccelerator
     (hAccel        : Win32.Windef.HACCEL;
      cAccelEntries : Win32.INT;
      lpMsg         : Win32.Winuser.LPMSG;
      lpwCmd        : Win32.PWSTR)
      return Win32.BOOL;

   function OleGetIconOfFile
     (lpszPath        : Win32.Objbase.LPOLESTR;
      fUseFileAsLabel : Win32.BOOL)
      return Win32.Windef.HGLOBAL;

   function OleGetIconOfClass
     (rclsid          : Win32.Objbase.REFCLSID;
      lpszLabel       : Win32.Objbase.LPOLESTR;
      fUseTypeAsLabel : Win32.BOOL)
      return Win32.Windef.HGLOBAL;

   function OleMetafilePictFromIconAndLabel
     (hIcon          : Win32.Windef.HICON;
      lpszLabel      : Win32.Objbase.LPOLESTR;
      lpszSourceFile : Win32.Objbase.LPOLESTR;
      iIconIndex     : Win32.UINT)
      return Win32.Windef.HGLOBAL;

   function OleRegGetUserType
     (clsid        : Win32.Objbase.REFCLSID;
      dwFormOfType : Win32.DWORD;
      pszUserType  : access Win32.Objbase.LPOLESTR)
      return Win32.Objbase.HRESULT;

   function OleRegGetMiscStatus
     (clsid     : Win32.Objbase.REFCLSID;
      dwAspect  : Win32.DWORD;
      pdwStatus : Win32.PDWORD)
      return Win32.Objbase.HRESULT;

   function OleRegEnumFormatEtc
     (clsid       : Win32.Objbase.REFCLSID;
      dwDirection : Win32.DWORD;
      ppenum      : access Win32.Objbase.LPENUMFORMATETC)
      return Win32.Objbase.HRESULT;

   function OleRegEnumVerbs
     (clsid  : Win32.Objbase.REFCLSID;
      ppenum : access LPENUMOLEVERB)
      return Win32.Objbase.HRESULT;

   function OleConvertOLESTREAMToIStorage
     (lpolestream : Win32.Ole2.LPOLESTREAM;
      pstg        : Win32.Objbase.LPSTORAGE;
      ptd         : ac_DVTARGETDEVICE_t)
      return Win32.Objbase.HRESULT;

   function OleConvertIStorageToOLESTREAM
     (pstg        : Win32.Objbase.LPSTORAGE;
      lpolestream : Win32.Ole2.LPOLESTREAM)
      return Win32.Objbase.HRESULT;

   function GetHGlobalFromILockBytes
     (plkbyt   : Win32.Objbase.LPLOCKBYTES;
      phglobal : access Win32.Windef.HGLOBAL)
      return Win32.Objbase.HRESULT;

   function CreateILockBytesOnHGlobal
     (hGlobal          : Win32.Windef.HGLOBAL;
      fDeleteOnRelease : Win32.BOOL;
      pplkbyt          : access Win32.Objbase.LPLOCKBYTES)
      return Win32.Objbase.HRESULT;

   function GetHGlobalFromStream
     (pstm     : Win32.Objbase.LPSTREAM;
      phglobal : access Win32.Windef.HGLOBAL)
      return Win32.Objbase.HRESULT;

   function CreateStreamOnHGlobal
     (hGlobal          : Win32.Windef.HGLOBAL;
      fDeleteOnRelease : Win32.BOOL;
      ppstm            : access Win32.Objbase.LPSTREAM)
      return Win32.Objbase.HRESULT;

   function OleDoAutoConvert
     (pStg      : Win32.Objbase.LPSTORAGE;
      pClsidNew : Win32.Objbase.LPCLSID)
      return Win32.Objbase.HRESULT;

   function OleGetAutoConvert
     (clsidOld  : access Win32.Objbase.IID;
      pClsidNew : Win32.Objbase.LPCLSID)
      return Win32.Objbase.HRESULT;

   function OleSetAutoConvert
     (clsidOld : access Win32.Objbase.IID;
      clsidNew : access Win32.Objbase.IID)
      return Win32.Objbase.HRESULT;

   function GetConvertStg
     (pStg : Win32.Objbase.LPSTORAGE)
      return Win32.Objbase.HRESULT;

   function SetConvertStg
     (pStg     : Win32.Objbase.LPSTORAGE;
      fConvert : Win32.BOOL)
      return Win32.Objbase.HRESULT;

   function OleConvertIStorageToOLESTREAMEx
     (pstg     : Win32.Objbase.LPSTORAGE;
      cfFormat : Win32.Objbase.CLIPFORMAT;
      lWidth   : Win32.LONG;
      lHeight  : Win32.LONG;
      dwSize   : Win32.DWORD;
      pmedium  : Win32.Objbase.LPSTGMEDIUM;
      polestm  : LPOLESTREAM)
      return Win32.Objbase.HRESULT;

   function OleConvertOLESTREAMToIStorageEx
     (polestm   : LPOLESTREAM;
      pstg      : Win32.Objbase.LPSTORAGE;
      pcfFormat : access Win32.Objbase.CLIPFORMAT;
      plwWidth  : access Win32.LONG;
      plHeight  : access Win32.LONG;
      pdwSize   : access Win32.DWORD;
      pmedium   : Win32.Objbase.LPSTGMEDIUM)
      return Win32.Objbase.HRESULT;

private

   pragma Convention (C_Pass_By_Copy, IOleAdviseHolder);
   pragma Convention (C_Pass_By_Copy, IOleCache);
   pragma Convention (C_Pass_By_Copy, IOleCache2);
   pragma Convention (C_Pass_By_Copy, IOleCacheControl);
   pragma Convention (C_Pass_By_Copy, IOleContainer);
   pragma Convention (C_Pass_By_Copy, IOleClientSite);
   pragma Convention (C_Pass_By_Copy, IOleObject);
   pragma Convention (C_Pass_By_Copy, IOleWindow);
   pragma Convention (C_Pass_By_Copy, IOleLink);
   pragma Convention (C_Pass_By_Copy, IOleItemContainer);
   pragma Convention (C_Pass_By_Copy, IOleInPlaceUIWindow);
   pragma Convention (C_Pass_By_Copy, IOleInPlaceActiveObject);
   pragma Convention (C_Pass_By_Copy, IOleInPlaceFrame);
   pragma Convention (C_Pass_By_Copy, IOleInPlaceObject);
   pragma Convention (C_Pass_By_Copy, IOleInPlaceSite);
   pragma Convention (C_Pass_By_Copy, IViewObject);
   pragma Convention (C_Pass_By_Copy, IViewObject2);
   pragma Convention (C_Pass_By_Copy, IDropSource);
   pragma Convention (C_Pass_By_Copy, IDropTarget);
   pragma Convention (C_Pass_By_Copy, IEnumOLEVERB);
   pragma Convention (C, IOleAdviseHolderVtbl);
   pragma Convention (C, IOleCacheVtbl);
   pragma Convention (C, IOleCache2Vtbl);
   pragma Convention (C, IOleCacheControlVtbl);
   pragma Convention (C, IOleContainerVtbl);
   pragma Convention (C, IOleClientSiteVtbl);
   pragma Convention (C, IOleObjectVtbl);
   pragma Convention (C, IOleWindowVtbl);
   pragma Convention (C, IOleLinkVtbl);
   pragma Convention (C, IOleItemContainerVtbl);
   pragma Convention (C, IOleInPlaceUIWindowVtbl);
   pragma Convention (C, IOleInPlaceActiveObjectVtbl);
   pragma Convention (C, OLEINPLACEFRAMEINFO);
   pragma Convention (C, OLEMENUGROUPWIDTHS);
   pragma Convention (C, IOleInPlaceFrameVtbl);
   pragma Convention (C, IOleInPlaceObjectVtbl);
   pragma Convention (C, IOleInPlaceSiteVtbl);
   pragma Convention (C, IViewObjectVtbl);
   pragma Convention (C, IViewObject2Vtbl);
   pragma Convention (C, IDropSourceVtbl);
   pragma Convention (C, IDropTargetVtbl);
   pragma Convention (C_Pass_By_Copy, OLEVERB);
   pragma Convention (C, IEnumOLEVERBVtbl);
   pragma Convention (C_Pass_By_Copy, OLESTREAM);
   pragma Convention (C_Pass_By_Copy, OLESTREAMVTBL);
   pragma Convention (C, OBJECTDESCRIPTOR);

   pragma Import (Stdcall, IID_IOleAdviseHolder, "IID_IOleAdviseHolder");
   pragma Import (Stdcall, IID_IOleCache, "IID_IOleCache");
   pragma Import (Stdcall, IID_IOleCache2, "IID_IOleCache2");
   pragma Import (Stdcall, IID_IOleCacheControl, "IID_IOleCacheControl");
   pragma Import (Stdcall, IID_IOleContainer, "IID_IOleContainer");
   pragma Import (Stdcall, IID_IOleClientSite, "IID_IOleClientSite");
   pragma Import (Stdcall, IID_IOleObject, "IID_IOleObject");
   pragma Import
     (Stdcall,
      IOLETypes_v0_0_c_ifspec,
      "IOLETypes_v0_0_c_ifspec");
   pragma Import
     (Stdcall,
      IOLETypes_v0_0_s_ifspec,
      "IOLETypes_v0_0_s_ifspec");
   pragma Import (Stdcall, IID_IOleWindow, "IID_IOleWindow");
   pragma Import (Stdcall, IID_IOleLink, "IID_IOleLink");
   pragma Import (Stdcall, IID_IOleItemContainer, "IID_IOleItemContainer");
   pragma Import
     (Stdcall,
      IID_IOleInPlaceUIWindow,
      "IID_IOleInPlaceUIWindow");
   pragma Import
     (Stdcall,
      IID_IOleInPlaceActiveObject,
      "IID_IOleInPlaceActiveObject");
   pragma Import (Stdcall, IID_IOleInPlaceFrame, "IID_IOleInPlaceFrame");
   pragma Import (Stdcall, IID_IOleInPlaceObject, "IID_IOleInPlaceObject");
   pragma Import (Stdcall, IID_IOleInPlaceSite, "IID_IOleInPlaceSite");
   pragma Import (Stdcall, IID_IViewObject, "IID_IViewObject");
   pragma Import (Stdcall, IID_IViewObject2, "IID_IViewObject2");
   pragma Import (Stdcall, IID_IDropSource, "IID_IDropSource");
   pragma Import (Stdcall, IID_IDropTarget, "IID_IDropTarget");
   pragma Import (Stdcall, IID_IEnumOLEVERB, "IID_IEnumOLEVERB");

   pragma Import
     (Stdcall,
      IOleAdviseHolder_Advise_Proxy,
      "IOleAdviseHolder_Advise_Proxy");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_Advise_Stub,
      "IOleAdviseHolder_Advise_Stub");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_Unadvise_Proxy,
      "IOleAdviseHolder_Unadvise_Proxy");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_Unadvise_Stub,
      "IOleAdviseHolder_Unadvise_Stub");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_EnumAdvise_Proxy,
      "IOleAdviseHolder_EnumAdvise_Proxy");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_EnumAdvise_Stub,
      "IOleAdviseHolder_EnumAdvise_Stub");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_SendOnRename_Proxy,
      "IOleAdviseHolder_SendOnRename_Proxy");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_SendOnRename_Stub,
      "IOleAdviseHolder_SendOnRename_Stub");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_SendOnSave_Proxy,
      "IOleAdviseHolder_SendOnSave_Proxy");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_SendOnSave_Stub,
      "IOleAdviseHolder_SendOnSave_Stub");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_SendOnClose_Proxy,
      "IOleAdviseHolder_SendOnClose_Proxy");
   pragma Import
     (Stdcall,
      IOleAdviseHolder_SendOnClose_Stub,
      "IOleAdviseHolder_SendOnClose_Stub");
   pragma Import (Stdcall, IOleCache_Cache_Proxy, "IOleCache_Cache_Proxy");
   pragma Import (Stdcall, IOleCache_Cache_Stub, "IOleCache_Cache_Stub");
   pragma Import
     (Stdcall,
      IOleCache_Uncache_Proxy,
      "IOleCache_Uncache_Proxy");
   pragma Import (Stdcall, IOleCache_Uncache_Stub, "IOleCache_Uncache_Stub");
   pragma Import
     (Stdcall,
      IOleCache_EnumCache_Proxy,
      "IOleCache_EnumCache_Proxy");
   pragma Import
     (Stdcall,
      IOleCache_EnumCache_Stub,
      "IOleCache_EnumCache_Stub");
   pragma Import
     (Stdcall,
      IOleCache_InitCache_Proxy,
      "IOleCache_InitCache_Proxy");
   pragma Import
     (Stdcall,
      IOleCache_InitCache_Stub,
      "IOleCache_InitCache_Stub");
   pragma Import
     (Stdcall,
      IOleCache_SetData_Proxy,
      "IOleCache_SetData_Proxy");
   pragma Import (Stdcall, IOleCache_SetData_Stub, "IOleCache_SetData_Stub");
   pragma Import
     (Stdcall,
      IOleCache2_UpdateCache_Proxy,
      "IOleCache2_UpdateCache_Proxy");
   pragma Import
     (Stdcall,
      IOleCache2_UpdateCache_Stub,
      "IOleCache2_UpdateCache_Stub");
   pragma Import
     (Stdcall,
      IOleCache2_DiscardCache_Proxy,
      "IOleCache2_DiscardCache_Proxy");
   pragma Import
     (Stdcall,
      IOleCache2_DiscardCache_Stub,
      "IOleCache2_DiscardCache_Stub");
   pragma Import
     (Stdcall,
      IOleCacheControl_OnRun_Proxy,
      "IOleCacheControl_OnRun_Proxy");
   pragma Import
     (Stdcall,
      IOleCacheControl_OnRun_Stub,
      "IOleCacheControl_OnRun_Stub");
   pragma Import
     (Stdcall,
      IOleCacheControl_OnStop_Proxy,
      "IOleCacheControl_OnStop_Proxy");
   pragma Import
     (Stdcall,
      IOleCacheControl_OnStop_Stub,
      "IOleCacheControl_OnStop_Stub");
   pragma Import
     (Stdcall,
      IOleContainer_EnumObjects_Proxy,
      "IOleContainer_EnumObjects_Proxy");
   pragma Import
     (Stdcall,
      IOleContainer_EnumObjects_Stub,
      "IOleContainer_EnumObjects_Stub");
   pragma Import
     (Stdcall,
      IOleContainer_LockContainer_Proxy,
      "IOleContainer_LockContainer_Proxy");
   pragma Import
     (Stdcall,
      IOleContainer_LockContainer_Stub,
      "IOleContainer_LockContainer_Stub");
   pragma Import
     (Stdcall,
      IOleClientSite_SaveObject_Proxy,
      "IOleClientSite_SaveObject_Proxy");
   pragma Import
     (Stdcall,
      IOleClientSite_SaveObject_Stub,
      "IOleClientSite_SaveObject_Stub");
   pragma Import
     (Stdcall,
      IOleClientSite_GetMoniker_Proxy,
      "IOleClientSite_GetMoniker_Proxy");
   pragma Import
     (Stdcall,
      IOleClientSite_GetMoniker_Stub,
      "IOleClientSite_GetMoniker_Stub");
   pragma Import
     (Stdcall,
      IOleClientSite_GetContainer_Proxy,
      "IOleClientSite_GetContainer_Proxy");
   pragma Import
     (Stdcall,
      IOleClientSite_GetContainer_Stub,
      "IOleClientSite_GetContainer_Stub");
   pragma Import
     (Stdcall,
      IOleClientSite_ShowObject_Proxy,
      "IOleClientSite_ShowObject_Proxy");
   pragma Import
     (Stdcall,
      IOleClientSite_ShowObject_Stub,
      "IOleClientSite_ShowObject_Stub");
   pragma Import
     (Stdcall,
      IOleClientSite_OnShowWindow_Proxy,
      "IOleClientSite_OnShowWindow_Proxy");
   pragma Import
     (Stdcall,
      IOleClientSite_OnShowWindow_Stub,
      "IOleClientSite_OnShowWindow_Stub");
   pragma Import
     (Stdcall,
      IOleClientSite_RequestNewObjectLayout_Proxy,
      "IOleClientSite_RequestNewObjectLayout_Proxy");
   pragma Import
     (Stdcall,
      IOleClientSite_RequestNewObjectLayout_Stub,
      "IOleClientSite_RequestNewObjectLayout_Stub");
   pragma Import
     (Stdcall,
      IOleObject_SetClientSite_Proxy,
      "IOleObject_SetClientSite_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_SetClientSite_Stub,
      "IOleObject_SetClientSite_Stub");
   pragma Import
     (Stdcall,
      IOleObject_GetClientSite_Proxy,
      "IOleObject_GetClientSite_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_GetClientSite_Stub,
      "IOleObject_GetClientSite_Stub");
   pragma Import
     (Stdcall,
      IOleObject_SetHostNames_Proxy,
      "IOleObject_SetHostNames_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_SetHostNames_Stub,
      "IOleObject_SetHostNames_Stub");
   pragma Import (Stdcall, IOleObject_Close_Proxy, "IOleObject_Close_Proxy");
   pragma Import (Stdcall, IOleObject_Close_Stub, "IOleObject_Close_Stub");
   pragma Import
     (Stdcall,
      IOleObject_SetMoniker_Proxy,
      "IOleObject_SetMoniker_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_SetMoniker_Stub,
      "IOleObject_SetMoniker_Stub");
   pragma Import
     (Stdcall,
      IOleObject_GetMoniker_Proxy,
      "IOleObject_GetMoniker_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_GetMoniker_Stub,
      "IOleObject_GetMoniker_Stub");
   pragma Import
     (Stdcall,
      IOleObject_InitFromData_Proxy,
      "IOleObject_InitFromData_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_InitFromData_Stub,
      "IOleObject_InitFromData_Stub");
   pragma Import
     (Stdcall,
      IOleObject_GetClipboardData_Proxy,
      "IOleObject_GetClipboardData_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_GetClipboardData_Stub,
      "IOleObject_GetClipboardData_Stub");
   pragma Import
     (Stdcall,
      IOleObject_DoVerb_Proxy,
      "IOleObject_DoVerb_Proxy");
   pragma Import (Stdcall, IOleObject_DoVerb_Stub, "IOleObject_DoVerb_Stub");
   pragma Import
     (Stdcall,
      IOleObject_EnumVerbs_Proxy,
      "IOleObject_EnumVerbs_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_EnumVerbs_Stub,
      "IOleObject_EnumVerbs_Stub");
   pragma Import
     (Stdcall,
      IOleObject_Update_Proxy,
      "IOleObject_Update_Proxy");
   pragma Import (Stdcall, IOleObject_Update_Stub, "IOleObject_Update_Stub");
   pragma Import
     (Stdcall,
      IOleObject_IsUpToDate_Proxy,
      "IOleObject_IsUpToDate_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_IsUpToDate_Stub,
      "IOleObject_IsUpToDate_Stub");
   pragma Import
     (Stdcall,
      IOleObject_GetUserClassID_Proxy,
      "IOleObject_GetUserClassID_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_GetUserClassID_Stub,
      "IOleObject_GetUserClassID_Stub");
   pragma Import
     (Stdcall,
      IOleObject_GetUserType_Proxy,
      "IOleObject_GetUserType_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_GetUserType_Stub,
      "IOleObject_GetUserType_Stub");
   pragma Import
     (Stdcall,
      IOleObject_SetExtent_Proxy,
      "IOleObject_SetExtent_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_SetExtent_Stub,
      "IOleObject_SetExtent_Stub");
   pragma Import
     (Stdcall,
      IOleObject_GetExtent_Proxy,
      "IOleObject_GetExtent_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_GetExtent_Stub,
      "IOleObject_GetExtent_Stub");
   pragma Import
     (Stdcall,
      IOleObject_Advise_Proxy,
      "IOleObject_Advise_Proxy");
   pragma Import (Stdcall, IOleObject_Advise_Stub, "IOleObject_Advise_Stub");
   pragma Import
     (Stdcall,
      IOleObject_Unadvise_Proxy,
      "IOleObject_Unadvise_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_Unadvise_Stub,
      "IOleObject_Unadvise_Stub");
   pragma Import
     (Stdcall,
      IOleObject_EnumAdvise_Proxy,
      "IOleObject_EnumAdvise_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_EnumAdvise_Stub,
      "IOleObject_EnumAdvise_Stub");
   pragma Import
     (Stdcall,
      IOleObject_GetMiscStatus_Proxy,
      "IOleObject_GetMiscStatus_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_GetMiscStatus_Stub,
      "IOleObject_GetMiscStatus_Stub");
   pragma Import
     (Stdcall,
      IOleObject_SetColorScheme_Proxy,
      "IOleObject_SetColorScheme_Proxy");
   pragma Import
     (Stdcall,
      IOleObject_SetColorScheme_Stub,
      "IOleObject_SetColorScheme_Stub");
   pragma Import
     (Stdcall,
      IOleWindow_GetWindow_Proxy,
      "IOleWindow_GetWindow_Proxy");
   pragma Import
     (Stdcall,
      IOleWindow_GetWindow_Stub,
      "IOleWindow_GetWindow_Stub");
   pragma Import
     (Stdcall,
      IOleWindow_ContextSensitiveHelp_Proxy,
      "IOleWindow_ContextSensitiveHelp_Proxy");
   pragma Import
     (Stdcall,
      IOleWindow_ContextSensitiveHelp_Stub,
      "IOleWindow_ContextSensitiveHelp_Stub");
   pragma Import
     (Stdcall,
      IOleLink_SetUpdateOptions_Proxy,
      "IOleLink_SetUpdateOptions_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_SetUpdateOptions_Stub,
      "IOleLink_SetUpdateOptions_Stub");
   pragma Import
     (Stdcall,
      IOleLink_GetUpdateOptions_Proxy,
      "IOleLink_GetUpdateOptions_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_GetUpdateOptions_Stub,
      "IOleLink_GetUpdateOptions_Stub");
   pragma Import
     (Stdcall,
      IOleLink_SetSourceMoniker_Proxy,
      "IOleLink_SetSourceMoniker_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_SetSourceMoniker_Stub,
      "IOleLink_SetSourceMoniker_Stub");
   pragma Import
     (Stdcall,
      IOleLink_GetSourceMoniker_Proxy,
      "IOleLink_GetSourceMoniker_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_GetSourceMoniker_Stub,
      "IOleLink_GetSourceMoniker_Stub");
   pragma Import
     (Stdcall,
      IOleLink_SetSourceDisplayName_Proxy,
      "IOleLink_SetSourceDisplayName_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_SetSourceDisplayName_Stub,
      "IOleLink_SetSourceDisplayName_Stub");
   pragma Import
     (Stdcall,
      IOleLink_GetSourceDisplayName_Proxy,
      "IOleLink_GetSourceDisplayName_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_GetSourceDisplayName_Stub,
      "IOleLink_GetSourceDisplayName_Stub");
   pragma Import
     (Stdcall,
      IOleLink_BindToSource_Proxy,
      "IOleLink_BindToSource_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_BindToSource_Stub,
      "IOleLink_BindToSource_Stub");
   pragma Import
     (Stdcall,
      IOleLink_BindIfRunning_Proxy,
      "IOleLink_BindIfRunning_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_BindIfRunning_Stub,
      "IOleLink_BindIfRunning_Stub");
   pragma Import
     (Stdcall,
      IOleLink_GetBoundSource_Proxy,
      "IOleLink_GetBoundSource_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_GetBoundSource_Stub,
      "IOleLink_GetBoundSource_Stub");
   pragma Import
     (Stdcall,
      IOleLink_UnbindSource_Proxy,
      "IOleLink_UnbindSource_Proxy");
   pragma Import
     (Stdcall,
      IOleLink_UnbindSource_Stub,
      "IOleLink_UnbindSource_Stub");
   pragma Import (Stdcall, IOleLink_Update_Proxy, "IOleLink_Update_Proxy");
   pragma Import (Stdcall, IOleLink_Update_Stub, "IOleLink_Update_Stub");
   pragma Import
     (Stdcall,
      IOleItemContainer_RemoteGetObject_Proxy,
      "IOleItemContainer_RemoteGetObject_Proxy");
   pragma Import
     (Stdcall,
      IOleItemContainer_RemoteGetObject_Stub,
      "IOleItemContainer_RemoteGetObject_Stub");
   pragma Import
     (Stdcall,
      IOleItemContainer_RemoteGetObjectStorage_Proxy,
      "IOleItemContainer_RemoteGetObjectStorage_Proxy");
   pragma Import
     (Stdcall,
      IOleItemContainer_RemoteGetObjectStorage_Stub,
      "IOleItemContainer_RemoteGetObjectStorage_Stub");
   pragma Import
     (Stdcall,
      IOleItemContainer_IsRunning_Proxy,
      "IOleItemContainer_IsRunning_Proxy");
   pragma Import
     (Stdcall,
      IOleItemContainer_IsRunning_Stub,
      "IOleItemContainer_IsRunning_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_GetBorder_Proxy,
      "IOleInPlaceUIWindow_GetBorder_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_GetBorder_Stub,
      "IOleInPlaceUIWindow_GetBorder_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_RequestBorderSpace_Proxy,
      "IOleInPlaceUIWindow_RequestBorderSpace_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_RequestBorderSpace_Stub,
      "IOleInPlaceUIWindow_RequestBorderSpace_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_SetBorderSpace_Proxy,
      "IOleInPlaceUIWindow_SetBorderSpace_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_SetBorderSpace_Stub,
      "IOleInPlaceUIWindow_SetBorderSpace_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_SetActiveObject_Proxy,
      "IOleInPlaceUIWindow_SetActiveObject_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceUIWindow_SetActiveObject_Stub,
      "IOleInPlaceUIWindow_SetActiveObject_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_RemoteTranslateAccelerator_Proxy,
      "IOleInPlaceActiveObject_RemoteTranslateAccelerator_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_RemoteTranslateAccelerator_Stub,
      "IOleInPlaceActiveObject_RemoteTranslateAccelerator_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_OnFrameWindowActivate_Proxy,
      "IOleInPlaceActiveObject_OnFrameWindowActivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_OnFrameWindowActivate_Stub,
      "IOleInPlaceActiveObject_OnFrameWindowActivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_OnDocWindowActivate_Proxy,
      "IOleInPlaceActiveObject_OnDocWindowActivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_OnDocWindowActivate_Stub,
      "IOleInPlaceActiveObject_OnDocWindowActivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_RemoteResizeBorder_Proxy,
      "IOleInPlaceActiveObject_RemoteResizeBorder_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_RemoteResizeBorder_Stub,
      "IOleInPlaceActiveObject_RemoteResizeBorder_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_EnableModeless_Proxy,
      "IOleInPlaceActiveObject_EnableModeless_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_EnableModeless_Stub,
      "IOleInPlaceActiveObject_EnableModeless_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_InsertMenus_Proxy,
      "IOleInPlaceFrame_InsertMenus_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_InsertMenus_Stub,
      "IOleInPlaceFrame_InsertMenus_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_SetMenu_Proxy,
      "IOleInPlaceFrame_SetMenu_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_SetMenu_Stub,
      "IOleInPlaceFrame_SetMenu_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_RemoveMenus_Proxy,
      "IOleInPlaceFrame_RemoveMenus_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_RemoveMenus_Stub,
      "IOleInPlaceFrame_RemoveMenus_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_SetStatusText_Proxy,
      "IOleInPlaceFrame_SetStatusText_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_SetStatusText_Stub,
      "IOleInPlaceFrame_SetStatusText_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_EnableModeless_Proxy,
      "IOleInPlaceFrame_EnableModeless_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_EnableModeless_Stub,
      "IOleInPlaceFrame_EnableModeless_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_TranslateAccelerator_Proxy,
      "IOleInPlaceFrame_TranslateAccelerator_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceFrame_TranslateAccelerator_Stub,
      "IOleInPlaceFrame_TranslateAccelerator_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_InPlaceDeactivate_Proxy,
      "IOleInPlaceObject_InPlaceDeactivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_InPlaceDeactivate_Stub,
      "IOleInPlaceObject_InPlaceDeactivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_UIDeactivate_Proxy,
      "IOleInPlaceObject_UIDeactivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_UIDeactivate_Stub,
      "IOleInPlaceObject_UIDeactivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_SetObjectRects_Proxy,
      "IOleInPlaceObject_SetObjectRects_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_SetObjectRects_Stub,
      "IOleInPlaceObject_SetObjectRects_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_ReactivateAndUndo_Proxy,
      "IOleInPlaceObject_ReactivateAndUndo_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceObject_ReactivateAndUndo_Stub,
      "IOleInPlaceObject_ReactivateAndUndo_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_CanInPlaceActivate_Proxy,
      "IOleInPlaceSite_CanInPlaceActivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_CanInPlaceActivate_Stub,
      "IOleInPlaceSite_CanInPlaceActivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnInPlaceActivate_Proxy,
      "IOleInPlaceSite_OnInPlaceActivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnInPlaceActivate_Stub,
      "IOleInPlaceSite_OnInPlaceActivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnUIActivate_Proxy,
      "IOleInPlaceSite_OnUIActivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnUIActivate_Stub,
      "IOleInPlaceSite_OnUIActivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_GetWindowContext_Proxy,
      "IOleInPlaceSite_GetWindowContext_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_GetWindowContext_Stub,
      "IOleInPlaceSite_GetWindowContext_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_Scroll_Proxy,
      "IOleInPlaceSite_Scroll_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_Scroll_Stub,
      "IOleInPlaceSite_Scroll_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnUIDeactivate_Proxy,
      "IOleInPlaceSite_OnUIDeactivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnUIDeactivate_Stub,
      "IOleInPlaceSite_OnUIDeactivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnInPlaceDeactivate_Proxy,
      "IOleInPlaceSite_OnInPlaceDeactivate_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnInPlaceDeactivate_Stub,
      "IOleInPlaceSite_OnInPlaceDeactivate_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_DiscardUndoState_Proxy,
      "IOleInPlaceSite_DiscardUndoState_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_DiscardUndoState_Stub,
      "IOleInPlaceSite_DiscardUndoState_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_DeactivateAndUndo_Proxy,
      "IOleInPlaceSite_DeactivateAndUndo_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_DeactivateAndUndo_Stub,
      "IOleInPlaceSite_DeactivateAndUndo_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnPosRectChange_Proxy,
      "IOleInPlaceSite_OnPosRectChange_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceSite_OnPosRectChange_Stub,
      "IOleInPlaceSite_OnPosRectChange_Stub");
   pragma Import (Stdcall, IViewObject_Draw_Proxy, "IViewObject_Draw_Proxy");
   pragma Import (Stdcall, IViewObject_Draw_Stub, "IViewObject_Draw_Stub");
   pragma Import
     (Stdcall,
      IViewObject_GetColorSet_Proxy,
      "IViewObject_GetColorSet_Proxy");
   pragma Import
     (Stdcall,
      IViewObject_GetColorSet_Stub,
      "IViewObject_GetColorSet_Stub");
   pragma Import
     (Stdcall,
      IViewObject_Freeze_Proxy,
      "IViewObject_Freeze_Proxy");
   pragma Import
     (Stdcall,
      IViewObject_Freeze_Stub,
      "IViewObject_Freeze_Stub");
   pragma Import
     (Stdcall,
      IViewObject_Unfreeze_Proxy,
      "IViewObject_Unfreeze_Proxy");
   pragma Import
     (Stdcall,
      IViewObject_Unfreeze_Stub,
      "IViewObject_Unfreeze_Stub");
   pragma Import
     (Stdcall,
      IViewObject_SetAdvise_Proxy,
      "IViewObject_SetAdvise_Proxy");
   pragma Import
     (Stdcall,
      IViewObject_SetAdvise_Stub,
      "IViewObject_SetAdvise_Stub");
   pragma Import
     (Stdcall,
      IViewObject_GetAdvise_Proxy,
      "IViewObject_GetAdvise_Proxy");
   pragma Import
     (Stdcall,
      IViewObject_GetAdvise_Stub,
      "IViewObject_GetAdvise_Stub");
   pragma Import
     (Stdcall,
      IViewObject2_GetExtent_Proxy,
      "IViewObject2_GetExtent_Proxy");
   pragma Import
     (Stdcall,
      IViewObject2_GetExtent_Stub,
      "IViewObject2_GetExtent_Stub");
   pragma Import
     (Stdcall,
      IDropSource_QueryContinueDrag_Proxy,
      "IDropSource_QueryContinueDrag_Proxy");
   pragma Import
     (Stdcall,
      IDropSource_QueryContinueDrag_Stub,
      "IDropSource_QueryContinueDrag_Stub");
   pragma Import
     (Stdcall,
      IDropSource_GiveFeedback_Proxy,
      "IDropSource_GiveFeedback_Proxy");
   pragma Import
     (Stdcall,
      IDropSource_GiveFeedback_Stub,
      "IDropSource_GiveFeedback_Stub");
   pragma Import
     (Stdcall,
      IDropTarget_DragEnter_Proxy,
      "IDropTarget_DragEnter_Proxy");
   pragma Import
     (Stdcall,
      IDropTarget_DragEnter_Stub,
      "IDropTarget_DragEnter_Stub");
   pragma Import
     (Stdcall,
      IDropTarget_DragOver_Proxy,
      "IDropTarget_DragOver_Proxy");
   pragma Import
     (Stdcall,
      IDropTarget_DragOver_Stub,
      "IDropTarget_DragOver_Stub");
   pragma Import
     (Stdcall,
      IDropTarget_DragLeave_Proxy,
      "IDropTarget_DragLeave_Proxy");
   pragma Import
     (Stdcall,
      IDropTarget_DragLeave_Stub,
      "IDropTarget_DragLeave_Stub");
   pragma Import (Stdcall, IDropTarget_Drop_Proxy, "IDropTarget_Drop_Proxy");
   pragma Import (Stdcall, IDropTarget_Drop_Stub, "IDropTarget_Drop_Stub");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_RemoteNext_Proxy,
      "IEnumOLEVERB_RemoteNext_Proxy");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_RemoteNext_Stub,
      "IEnumOLEVERB_RemoteNext_Stub");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_Skip_Proxy,
      "IEnumOLEVERB_Skip_Proxy");
   pragma Import (Stdcall, IEnumOLEVERB_Skip_Stub, "IEnumOLEVERB_Skip_Stub");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_Reset_Proxy,
      "IEnumOLEVERB_Reset_Proxy");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_Reset_Stub,
      "IEnumOLEVERB_Reset_Stub");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_Clone_Proxy,
      "IEnumOLEVERB_Clone_Proxy");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_Clone_Stub,
      "IEnumOLEVERB_Clone_Stub");
   pragma Import (Stdcall, UINT_to_xmit, "UINT_to_xmit");
   pragma Import (Stdcall, UINT_from_xmit, "UINT_from_xmit");
   pragma Import (Stdcall, UINT_free_inst, "UINT_free_inst");
   pragma Import (Stdcall, UINT_free_xmit, "UINT_free_xmit");
   pragma Import (Stdcall, WPARAM_to_xmit, "WPARAM_to_xmit");
   pragma Import (Stdcall, WPARAM_from_xmit, "WPARAM_from_xmit");
   pragma Import (Stdcall, WPARAM_free_inst, "WPARAM_free_inst");
   pragma Import (Stdcall, WPARAM_free_xmit, "WPARAM_free_xmit");
   pragma Import (Stdcall, HWND_to_xmit, "HWND_to_xmit");
   pragma Import (Stdcall, HWND_from_xmit, "HWND_from_xmit");
   pragma Import (Stdcall, HWND_free_inst, "HWND_free_inst");
   pragma Import (Stdcall, HWND_free_xmit, "HWND_free_xmit");
   pragma Import (Stdcall, HMENU_to_xmit, "HMENU_to_xmit");
   pragma Import (Stdcall, HMENU_from_xmit, "HMENU_from_xmit");
   pragma Import (Stdcall, HMENU_free_inst, "HMENU_free_inst");
   pragma Import (Stdcall, HMENU_free_xmit, "HMENU_free_xmit");
   pragma Import (Stdcall, HACCEL_to_xmit, "HACCEL_to_xmit");
   pragma Import (Stdcall, HACCEL_from_xmit, "HACCEL_from_xmit");
   pragma Import (Stdcall, HACCEL_free_inst, "HACCEL_free_inst");
   pragma Import (Stdcall, HACCEL_free_xmit, "HACCEL_free_xmit");
   pragma Import (Stdcall, HOLEMENU_to_xmit, "HOLEMENU_to_xmit");
   pragma Import (Stdcall, HOLEMENU_from_xmit, "HOLEMENU_from_xmit");
   pragma Import (Stdcall, HOLEMENU_free_inst, "HOLEMENU_free_inst");
   pragma Import (Stdcall, HOLEMENU_free_xmit, "HOLEMENU_free_xmit");
   pragma Import
     (Stdcall,
      IOleItemContainer_GetObject_Proxy,
      "IOleItemContainer_GetObject_Proxy");
   pragma Import
     (Stdcall,
      IOleItemContainer_GetObject_Stub,
      "IOleItemContainer_GetObject_Stub");
   pragma Import
     (Stdcall,
      IOleItemContainer_GetObjectStorage_Proxy,
      "IOleItemContainer_GetObjectStorage_Proxy");
   pragma Import
     (Stdcall,
      IOleItemContainer_GetObjectStorage_Stub,
      "IOleItemContainer_GetObjectStorage_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_TranslateAccelerator_Proxy,
      "IOleInPlaceActiveObject_TranslateAccelerator_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_TranslateAccelerator_Stub,
      "IOleInPlaceActiveObject_TranslateAccelerator_Stub");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_ResizeBorder_Proxy,
      "IOleInPlaceActiveObject_ResizeBorder_Proxy");
   pragma Import
     (Stdcall,
      IOleInPlaceActiveObject_ResizeBorder_Stub,
      "IOleInPlaceActiveObject_ResizeBorder_Stub");
   pragma Import
     (Stdcall,
      IEnumOLEVERB_Next_Proxy,
      "IEnumOLEVERB_Next_Proxy");
   pragma Import (Stdcall, IEnumOLEVERB_Next_Stub, "IEnumOLEVERB_Next_Stub");
   pragma Import (Stdcall, OleBuildVersion, "OleBuildVersion");
   pragma Import (Stdcall, ReadClassStg, "ReadClassStg");
   pragma Import (Stdcall, WriteClassStg, "WriteClassStg");
   pragma Import (Stdcall, ReadClassStm, "ReadClassStm");
   pragma Import (Stdcall, WriteClassStm, "WriteClassStm");
   pragma Import (Stdcall, WriteFmtUserTypeStg, "WriteFmtUserTypeStg");
   pragma Import (Stdcall, ReadFmtUserTypeStg, "ReadFmtUserTypeStg");
   pragma Import (Stdcall, OleInitialize, "OleInitialize");
   pragma Import (Stdcall, OleUninitialize, "OleUninitialize");
   pragma Import (Stdcall, OleQueryLinkFromData, "OleQueryLinkFromData");
   pragma Import (Stdcall, OleQueryCreateFromData, "OleQueryCreateFromData");
   pragma Import (Stdcall, OleCreate, "OleCreate");
   pragma Import (Stdcall, OleCreateFromData, "OleCreateFromData");
   pragma Import (Stdcall, OleCreateLinkFromData, "OleCreateLinkFromData");
   pragma Import
     (Stdcall,
      OleCreateStaticFromData,
      "OleCreateStaticFromData");
   pragma Import (Stdcall, OleCreateLink, "OleCreateLink");
   pragma Import (Stdcall, OleCreateLinkToFile, "OleCreateLinkToFile");
   pragma Import (Stdcall, OleCreateFromFile, "OleCreateFromFile");
   pragma Import (Stdcall, OleLoad, "OleLoad");
   pragma Import (Stdcall, OleSave, "OleSave");
   pragma Import (Stdcall, OleLoadFromStream, "OleLoadFromStream");
   pragma Import (Stdcall, OleSaveToStream, "OleSaveToStream");
   pragma Import (Stdcall, OleSetContainedObject, "OleSetContainedObject");
   pragma Import (Stdcall, OleNoteObjectVisible, "OleNoteObjectVisible");
   pragma Import (Stdcall, RegisterDragDrop, "RegisterDragDrop");
   pragma Import (Stdcall, RevokeDragDrop, "RevokeDragDrop");
   pragma Import (Stdcall, DoDragDrop, "DoDragDrop");
   pragma Import (Stdcall, OleSetClipboard, "OleSetClipboard");
   pragma Import (Stdcall, OleGetClipboard, "OleGetClipboard");
   pragma Import (Stdcall, OleFlushClipboard, "OleFlushClipboard");
   pragma Import (Stdcall, OleIsCurrentClipboard, "OleIsCurrentClipboard");
   pragma Import
     (Stdcall,
      OleCreateMenuDescriptor,
      "OleCreateMenuDescriptor");
   pragma Import (Stdcall, OleSetMenuDescriptor, "OleSetMenuDescriptor");
   pragma Import
     (Stdcall,
      OleDestroyMenuDescriptor,
      "OleDestroyMenuDescriptor");
   pragma Import
     (Stdcall,
      OleTranslateAccelerator,
      "OleTranslateAccelerator");
   pragma Import (Stdcall, OleDuplicateData, "OleDuplicateData");
   pragma Import (Stdcall, OleDraw, "OleDraw");
   pragma Import (Stdcall, OleRun, "OleRun");
   pragma Import (Stdcall, OleIsRunning, "OleIsRunning");
   pragma Import (Stdcall, OleLockRunning, "OleLockRunning");
   pragma Import (Stdcall, ReleaseStgMedium, "ReleaseStgMedium");
   pragma Import (Stdcall, CreateOleAdviseHolder, "CreateOleAdviseHolder");
   pragma Import
     (Stdcall,
      OleCreateDefaultHandler,
      "OleCreateDefaultHandler");
   pragma Import
     (Stdcall,
      OleCreateEmbeddingHelper,
      "OleCreateEmbeddingHelper");
   pragma Import (Stdcall, IsAccelerator, "IsAccelerator");
   pragma Import (Stdcall, OleGetIconOfFile, "OleGetIconOfFile");
   pragma Import (Stdcall, OleGetIconOfClass, "OleGetIconOfClass");
   pragma Import
     (Stdcall,
      OleMetafilePictFromIconAndLabel,
      "OleMetafilePictFromIconAndLabel");
   pragma Import (Stdcall, OleRegGetUserType, "OleRegGetUserType");
   pragma Import (Stdcall, OleRegGetMiscStatus, "OleRegGetMiscStatus");
   pragma Import (Stdcall, OleRegEnumFormatEtc, "OleRegEnumFormatEtc");
   pragma Import (Stdcall, OleRegEnumVerbs, "OleRegEnumVerbs");
   pragma Import
     (Stdcall,
      OleConvertOLESTREAMToIStorage,
      "OleConvertOLESTREAMToIStorage");
   pragma Import
     (Stdcall,
      OleConvertIStorageToOLESTREAM,
      "OleConvertIStorageToOLESTREAM");
   pragma Import
     (Stdcall,
      GetHGlobalFromILockBytes,
      "GetHGlobalFromILockBytes");
   pragma Import
     (Stdcall,
      CreateILockBytesOnHGlobal,
      "CreateILockBytesOnHGlobal");
   pragma Import (Stdcall, GetHGlobalFromStream, "GetHGlobalFromStream");
   pragma Import (Stdcall, CreateStreamOnHGlobal, "CreateStreamOnHGlobal");
   pragma Import (Stdcall, OleDoAutoConvert, "OleDoAutoConvert");
   pragma Import (Stdcall, OleGetAutoConvert, "OleGetAutoConvert");
   pragma Import (Stdcall, OleSetAutoConvert, "OleSetAutoConvert");
   pragma Import (Stdcall, GetConvertStg, "GetConvertStg");
   pragma Import (Stdcall, SetConvertStg, "SetConvertStg");
   pragma Import
     (Stdcall,
      OleConvertIStorageToOLESTREAMEx,
      "OleConvertIStorageToOLESTREAMEx");
   pragma Import
     (Stdcall,
      OleConvertOLESTREAMToIStorageEx,
      "OleConvertOLESTREAMToIStorageEx");

end Win32.Ole2;
