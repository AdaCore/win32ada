-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Objbase;
with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Windef;
with Win32.Wingdi;
with Win32.Winnt;
with Win32.Winuser;

package Win32.Ole2 is

    E_DRAW                          : constant := 16#80040140#;
                                                            -- ole2.h:27
    DATA_E_FORMATETC                : constant := 16#80040064#;
                                                            -- ole2.h:30
    OLEIVERB_PRIMARY                : constant := 0;        -- ole2.h:39
    OLEIVERB_SHOW                   : constant := -1;       -- ole2.h:40
    OLEIVERB_OPEN                   : constant := -2;       -- ole2.h:41
    OLEIVERB_HIDE                   : constant := -3;       -- ole2.h:42
    OLEIVERB_UIACTIVATE             : constant := -4;       -- ole2.h:43
    OLEIVERB_INPLACEACTIVATE        : constant := -5;       -- ole2.h:44
    OLEIVERB_DISCARDUNDOSTATE       : constant := -6;       -- ole2.h:45
    EMBDHLP_INPROC_HANDLER          : constant := 16#0#;    -- ole2.h:48
    EMBDHLP_INPROC_SERVER           : constant := 16#1#;    -- ole2.h:49
    EMBDHLP_CREATENOW               : constant := 16#0#;    -- ole2.h:50
    EMBDHLP_DELAYCREATE             : constant := 16#10000#;-- ole2.h:51
    UPDFCACHE_NODATACACHE           : constant := 16#1#;    -- ole2.h:616
    UPDFCACHE_ONSAVECACHE           : constant := 16#2#;    -- ole2.h:619
    UPDFCACHE_ONSTOPCACHE           : constant := 16#4#;    -- ole2.h:622
    UPDFCACHE_NORMALCACHE           : constant := 16#8#;    -- ole2.h:625
    UPDFCACHE_IFBLANK               : constant := 16#10#;   -- ole2.h:628
    UPDFCACHE_ONLYIFBLANK           : constant := 16#80000000#;
                                                            -- ole2.h:631
    UPDFCACHE_IFBLANKORONSAVECACHE  : constant := 16#12#;   -- ole2.h:634
    UPDFCACHE_ALL                   : constant  DWORD   := 16#7fffffff#;
                                                            -- ole2.h:637
    UPDFCACHE_ALLBUTNODATACACHE     : constant  DWORD   := 16#fffffffe#;
                                                            -- ole2.h:640
    MK_ALT                          : constant := 16#20#;   -- ole2.h:4316
    DROPEFFECT_NONE                 : constant := 0;        -- ole2.h:4319
    DROPEFFECT_COPY                 : constant := 1;        -- ole2.h:4322
    DROPEFFECT_MOVE                 : constant := 2;        -- ole2.h:4325
    DROPEFFECT_LINK                 : constant := 4;        -- ole2.h:4328
    DROPEFFECT_SCROLL               : constant := 16#80000000#;
                                                            -- ole2.h:4331
    DD_DEFSCROLLINSET               : constant := 11;       -- ole2.h:4336
    DD_DEFSCROLLDELAY               : constant := 50;       -- ole2.h:4341
    DD_DEFSCROLLINTERVAL            : constant := 50;       -- ole2.h:4346
    DD_DEFDRAGDELAY                 : constant := 200;      -- ole2.h:4351
    DD_DEFDRAGMINDIST               : constant := 2;        -- ole2.h:4356


    type DISCARDCACHE is (                                  -- ole2.h:644
        DISCARDCACHE_SAVEIFDIRTY,                           -- ole2.h:645
        DISCARDCACHE_NOSAVE                                 -- ole2.h:647
    );
    for DISCARDCACHE'size use 32;                           -- ole2.h:644

    type PDISCARDCACHE is access DISCARDCACHE;

    type OLEGETMONIKER is (                                 -- ole2.h:1265
        OLEGETMONIKER_ONLYIFTHERE,                          -- ole2.h:1266
        OLEGETMONIKER_FORCEASSIGN,                          -- ole2.h:1267
        OLEGETMONIKER_UNASSIGN,                             -- ole2.h:1268
        OLEGETMONIKER_TEMPFORUSER                           -- ole2.h:1270
    );
    for OLEGETMONIKER use (                                 -- ole2.h:1265
        OLEGETMONIKER_ONLYIFTHERE => 1,                     -- ole2.h:1266
        OLEGETMONIKER_FORCEASSIGN => 2,                     -- ole2.h:1267
        OLEGETMONIKER_UNASSIGN => 3,                        -- ole2.h:1268
        OLEGETMONIKER_TEMPFORUSER => 4                      -- ole2.h:1270
    );
    for OLEGETMONIKER'size use 32;                          -- ole2.h:1265

    type OLEWHICHMK is (                                    -- ole2.h:1274
        OLEWHICHMK_CONTAINER,                               -- ole2.h:1275
        OLEWHICHMK_OBJREL,                                  -- ole2.h:1276
        OLEWHICHMK_OBJFULL                                  -- ole2.h:1278
    );
    for OLEWHICHMK use (                                    -- ole2.h:1274
        OLEWHICHMK_CONTAINER => 1,                          -- ole2.h:1275
        OLEWHICHMK_OBJREL => 2,                             -- ole2.h:1276
        OLEWHICHMK_OBJFULL => 3                             -- ole2.h:1278
    );
    for OLEWHICHMK'size use 32;                             -- ole2.h:1274

    type USERCLASSTYPE is (                                 -- ole2.h:1282
        USERCLASSTYPE_FULL,                                 -- ole2.h:1283
        USERCLASSTYPE_SHORT,                                -- ole2.h:1284
        USERCLASSTYPE_APPNAME                               -- ole2.h:1286
    );
    for USERCLASSTYPE use (                                 -- ole2.h:1282
        USERCLASSTYPE_FULL => 1,                            -- ole2.h:1283
        USERCLASSTYPE_SHORT => 2,                           -- ole2.h:1284
        USERCLASSTYPE_APPNAME => 3                          -- ole2.h:1286
    );
    for USERCLASSTYPE'size use 32;                          -- ole2.h:1282

    type OLEMISC is (                                       -- ole2.h:1290
        OLEMISC_RECOMPOSEONRESIZE,                          -- ole2.h:1291
        OLEMISC_ONLYICONIC,                                 -- ole2.h:1292
        OLEMISC_INSERTNOTREPLACE,                           -- ole2.h:1293
        OLEMISC_STATIC,                                     -- ole2.h:1294
        OLEMISC_CANTLINKINSIDE,                             -- ole2.h:1295
        OLEMISC_CANLINKBYOLE1,                              -- ole2.h:1296
        OLEMISC_ISLINKOBJECT,                               -- ole2.h:1297
        OLEMISC_INSIDEOUT,                                  -- ole2.h:1298
        OLEMISC_ACTIVATEWHENVISIBLE,                        -- ole2.h:1299
        OLEMISC_RENDERINGISDEVICEINDEPENDENT                -- ole2.h:1301
    );
    for OLEMISC use (                                       -- ole2.h:1290
        OLEMISC_RECOMPOSEONRESIZE => 1,                     -- ole2.h:1291
        OLEMISC_ONLYICONIC => 2,                            -- ole2.h:1292
        OLEMISC_INSERTNOTREPLACE => 4,                      -- ole2.h:1293
        OLEMISC_STATIC => 8,                                -- ole2.h:1294
        OLEMISC_CANTLINKINSIDE => 16,                       -- ole2.h:1295
        OLEMISC_CANLINKBYOLE1 => 32,                        -- ole2.h:1296
        OLEMISC_ISLINKOBJECT => 64,                         -- ole2.h:1297
        OLEMISC_INSIDEOUT => 128,                           -- ole2.h:1298
        OLEMISC_ACTIVATEWHENVISIBLE => 256,                 -- ole2.h:1299
        OLEMISC_RENDERINGISDEVICEINDEPENDENT => 512         -- ole2.h:1301
    );
    for OLEMISC'size use 32;                                -- ole2.h:1290

    type OLECLOSE is (                                      -- ole2.h:1305
        OLECLOSE_SAVEIFDIRTY,                               -- ole2.h:1306
        OLECLOSE_NOSAVE,                                    -- ole2.h:1307
        OLECLOSE_PROMPTSAVE                                 -- ole2.h:1309
    );
    for OLECLOSE'size use 32;                               -- ole2.h:1305

    type OLERENDER is (                                     -- ole2.h:1890
        OLERENDER_NONE,                                     -- ole2.h:1891
        OLERENDER_DRAW,                                     -- ole2.h:1892
        OLERENDER_FORMAT,                                   -- ole2.h:1893
        OLERENDER_ASIS                                      -- ole2.h:1895
    );
    for OLERENDER'size use 32;                              -- ole2.h:1890

    type OLEUPDATE is (                                     -- ole2.h:2067
        OLEUPDATE_ALWAYS,                                   -- ole2.h:2068
        OLEUPDATE_ONCALL                                    -- ole2.h:2070
    );
    for OLEUPDATE'size use 32;                              -- ole2.h:2067
    for OLEUPDATE use (                                     -- ole2.h:2067
        OLEUPDATE_ALWAYS => 1,                              -- ole2.h:2068
        OLEUPDATE_ONCALL => 3                               -- ole2.h:2070
    );

    type OLELINKBIND is (                                   -- ole2.h:2080
        OLELINKBIND_EVENIFCLASSDIFF                         -- ole2.h:2082
    );
    for OLELINKBIND use (                                   -- ole2.h:2080
        OLELINKBIND_EVENIFCLASSDIFF => 1                    -- ole2.h:2082
    );
    for OLELINKBIND'size use 32;                            -- ole2.h:2080

    type BINDSPEED is (                                     -- ole2.h:2401
        BINDSPEED_INDEFINITE,                               -- ole2.h:2402
        BINDSPEED_MODERATE,                                 -- ole2.h:2403
        BINDSPEED_IMMEDIATE                                 -- ole2.h:2405
    );
    for BINDSPEED use (                                     -- ole2.h:2401
        BINDSPEED_INDEFINITE => 1,                          -- ole2.h:2402
        BINDSPEED_MODERATE => 2,                            -- ole2.h:2403
        BINDSPEED_IMMEDIATE => 3                            -- ole2.h:2405
    );
    for BINDSPEED'size use 32;                              -- ole2.h:2401

    type OLECONTF is (                                      -- ole2.h:2409
        OLECONTF_EMBEDDINGS,                                -- ole2.h:2410
        OLECONTF_LINKS,                                     -- ole2.h:2411
        OLECONTF_OTHERS,                                    -- ole2.h:2412
        OLECONTF_ONLYUSER,                                  -- ole2.h:2413
        OLECONTF_ONLYIFRUNNING                              -- ole2.h:2415
    );
    for OLECONTF use (                                      -- ole2.h:2409
        OLECONTF_EMBEDDINGS => 1,                           -- ole2.h:2410
        OLECONTF_LINKS => 2,                                -- ole2.h:2411
        OLECONTF_OTHERS => 4,                               -- ole2.h:2412
        OLECONTF_ONLYUSER => 8,                             -- ole2.h:2413
        OLECONTF_ONLYIFRUNNING => 16                        -- ole2.h:2415
    );
    for OLECONTF'size use 32;                               -- ole2.h:2409

    type OLEVERBATTRIB is (                                 -- ole2.h:4554
        OLEVERBATTRIB_NEVERDIRTIES,                         -- ole2.h:4555
        OLEVERBATTRIB_ONCONTAINERMENU                       -- ole2.h:4557
    );
    for OLEVERBATTRIB use (                                 -- ole2.h:4554
        OLEVERBATTRIB_NEVERDIRTIES => 1,                    -- ole2.h:4555
        OLEVERBATTRIB_ONCONTAINERMENU => 2                  -- ole2.h:4557
    );
    for OLEVERBATTRIB'size use 32;                          -- ole2.h:4554

    type HOLEMENU is new Win32.Windef.HGLOBAL;              -- ole2.h:3019

    type IOleAdviseHolder;                                  -- ole2.h:66
    type IOleCache;                                         -- ole2.h:72
    type IOleCache2;                                        -- ole2.h:78
    type IOleCacheControl;                                  -- ole2.h:84
    type IOleContainer;                                     -- ole2.h:90
    type IOleClientSite;                                    -- ole2.h:96
    type IOleObject;                                        -- ole2.h:102
    type IOleWindow;                                        -- ole2.h:108
    type IOleLink;                                          -- ole2.h:114
    type IOleItemContainer;                                 -- ole2.h:120
    type IOleInPlaceUIWindow;                               -- ole2.h:126
    type IOleInPlaceActiveObject;                           -- ole2.h:132
    type IOleInPlaceFrame;                                  -- ole2.h:138
    type IOleInPlaceObject;                                 -- ole2.h:144
    type IOleInPlaceSite;                                   -- ole2.h:150
    type IViewObject;                                       -- ole2.h:156
    type IViewObject2;                                      -- ole2.h:162
    type IDropSource;                                       -- ole2.h:168
    type IDropTarget;                                       -- ole2.h:174
    type IEnumOLEVERB;                                      -- ole2.h:180
    type IOleAdviseHolderVtbl;                              -- ole2.h:247
    type IOleCacheVtbl;                                     -- ole2.h:451
    type IOleCache2Vtbl;                                    -- ole2.h:673
    type IOleCacheControlVtbl;                              -- ole2.h:833
    type IOleContainerVtbl;                                 -- ole2.h:949
    type IOleClientSiteVtbl;                                -- ole2.h:1090
    type IOleObjectVtbl;                                    -- ole2.h:1401
    type IOleWindowVtbl;                                    -- ole2.h:1966
    type IOleLinkVtbl;                                      -- ole2.h:2129
    type IOleItemContainerVtbl;                             -- ole2.h:2445
    type IOleInPlaceUIWindowVtbl;                           -- ole2.h:2638
    type IOleInPlaceActiveObjectVtbl;                       -- ole2.h:2821
    type OLEINPLACEFRAMEINFO;                               -- ole2.h:2997
    type OLEMENUGROUPWIDTHS;                                -- ole2.h:3010
    type IOleInPlaceFrameVtbl;                              -- ole2.h:3055
    type IOleInPlaceObjectVtbl;                             -- ole2.h:3305
    type IOleInPlaceSiteVtbl;                               -- ole2.h:3493
    type IViewObjectVtbl;                                   -- ole2.h:3807
    type IViewObject2Vtbl;                                  -- ole2.h:4044
    type IDropSourceVtbl;                                   -- ole2.h:4214
    type IDropTargetVtbl;                                   -- ole2.h:4389
    type OLEVERB;                                           -- ole2.h:4541
    type IEnumOLEVERBVtbl;                                  -- ole2.h:4584
    type OLESTREAM;                                         -- ole2.h:4984
    type OLESTREAMVTBL;                                     -- ole2.h:4986
    type OBJECTDESCRIPTOR;                                  -- ole2.h:1901

    type LPOLEADVISEHOLDER is access all IOleAdviseHolder;  -- ole2.h:216
    type a_IOleAdviseHolderVtbl_t is access all IOleAdviseHolderVtbl;
                                                            -- ole2.h:288
    type LPOLECACHE is access all IOleCache;                -- ole2.h:418
    type a_IOleCacheVtbl_t is access all IOleCacheVtbl;     -- ole2.h:493
    type LPOLECACHE2 is access all IOleCache2;              -- ole2.h:613
    type a_IOleCache2Vtbl_t is access all IOleCache2Vtbl;   -- ole2.h:725
    type LPOLECACHECONTROL is access all IOleCacheControl;  -- ole2.h:814
    type a_IOleCacheControlVtbl_t is access all IOleCacheControlVtbl;
                                                            -- ole2.h:858
    type LPOLECONTAINER is access all IOleContainer;        -- ole2.h:928
    type a_IOleContainerVtbl_t is access all IOleContainerVtbl;
                                                            -- ole2.h:983
    type LPOLECLIENTSITE is access all IOleClientSite;      -- ole2.h:1059
    type a_IOleClientSiteVtbl_t is access all IOleClientSiteVtbl;
                                                            -- ole2.h:1131
    type LPOLEOBJECT is access all IOleObject;              -- ole2.h:1261
    type a_IOleObjectVtbl_t is access all IOleObjectVtbl;   -- ole2.h:1518
    type POBJECTDESCRIPTOR is access all OBJECTDESCRIPTOR;
                                                            -- ole2.h:1914
    subtype LPOBJECTDESCRIPTOR is POBJECTDESCRIPTOR;
                                                            -- ole2.h:1917
    type PLINKSRCDESCRIPTOR is access all OBJECTDESCRIPTOR;
                                                            -- ole2.h:1923
    subtype LPLINKSRCDESCRIPTOR is PLINKSRCDESCRIPTOR;
                                                            -- ole2.h:1926
    type LPOLEWINDOW is access all IOleWindow;              -- ole2.h:1946
    type a_IOleWindowVtbl_t is access all IOleWindowVtbl;   -- ole2.h:1992
    type LPOLELINK is access all IOleLink;                  -- ole2.h:2063
    type a_IOleLinkVtbl_t is access all IOleLinkVtbl;       -- ole2.h:2191
    type LPOLEITEMCONTAINER is access all IOleItemContainer;-- ole2.h:2397
    type a_IOleItemContainerVtbl_t is access all IOleItemContainerVtbl;
                                                            -- ole2.h:2498
    type LPOLEINPLACEUIWINDOW is access all IOleInPlaceUIWindow;
                                                            -- ole2.h:2602
    type LPBORDERWIDTHS is access all Win32.Windef.RECT;  
                                                            -- ole2.h:2608
    type LPCBORDERWIDTHS is access all Win32.Windef.RECT;
                                                            -- ole2.h:2611
    type a_IOleInPlaceUIWindowVtbl_t is access all IOleInPlaceUIWindowVtbl;
                                                            -- ole2.h:2681
    type LPOLEINPLACEACTIVEOBJECT is access all IOleInPlaceActiveObject;
                                                            -- ole2.h:2790
    type a_IOleInPlaceActiveObjectVtbl_t is access all 
        IOleInPlaceActiveObjectVtbl;                        -- ole2.h:2869
    type LPOLEINPLACEFRAME is access all IOleInPlaceFrame;  -- ole2.h:2994
    type LPOLEINPLACEFRAMEINFO is access all OLEINPLACEFRAMEINFO;
                                                            -- ole2.h:3007
    type LPOLEMENUGROUPWIDTHS is access all OLEMENUGROUPWIDTHS;
                                                            -- ole2.h:3016
    type a_IOleInPlaceFrameVtbl_t is access all IOleInPlaceFrameVtbl;
                                                            -- ole2.h:3126
    type LPOLEINPLACEOBJECT is access all IOleInPlaceObject;-- ole2.h:3281
    type a_IOleInPlaceObjectVtbl_t is access all IOleInPlaceObjectVtbl;
                                                            -- ole2.h:3345
    type LPOLEINPLACESITE is access all IOleInPlaceSite;    -- ole2.h:3451
    type a_IOleInPlaceSiteVtbl_t is access all IOleInPlaceSiteVtbl;
                                                            -- ole2.h:3557
    type LPVIEWOBJECT is access all IViewObject;            -- ole2.h:3753
    type a_IViewObjectVtbl_t is access all IViewObjectVtbl; -- ole2.h:3871
    type LPVIEWOBJECT2 is access all IViewObject2;          -- ole2.h:4024
    type a_IViewObject2Vtbl_t is access all IViewObject2Vtbl;
                                                            -- ole2.h:4115
    type LPDROPSOURCE is access all IDropSource;            -- ole2.h:4193
    type a_IDropSourceVtbl_t is access all IDropSourceVtbl; -- ole2.h:4241
    type LPDROPTARGET is access all IDropTarget;            -- ole2.h:4313
    type a_IDropTargetVtbl_t is access all IDropTargetVtbl; -- ole2.h:4430
    type LPENUMOLEVERB is access all IEnumOLEVERB;          -- ole2.h:4538
    type LPOLEVERB is access all OLEVERB;                   -- ole2.h:4550
    type a_IEnumOLEVERBVtbl_t is access all IEnumOLEVERBVtbl;
                                                            -- ole2.h:4619
    type LPOLESTREAM is access all OLESTREAM;               -- ole2.h:4984
    type LPOLESTREAMVTBL is access all OLESTREAMVTBL;       -- ole2.h:4991
    type ac_DVTARGETDEVICE_t is access all Win32.Objbase.DVTARGETDEVICE;
                                                            -- ole2.h:5002

    type IOleAdviseHolder is                                -- ole2.h:66
        record
            lpVtbl: a_IOleAdviseHolderVtbl_t;               -- ole2.h:288
        end record;

    type IOleCache is                                       -- ole2.h:72
        record
            lpVtbl: a_IOleCacheVtbl_t;                      -- ole2.h:493
        end record;

    type IOleCache2 is                                      -- ole2.h:78
        record
            lpVtbl: a_IOleCache2Vtbl_t;                     -- ole2.h:725
        end record;

    type IOleCacheControl is                                -- ole2.h:84
        record
            lpVtbl: a_IOleCacheControlVtbl_t;               -- ole2.h:858
        end record;

    type IOleContainer is                                   -- ole2.h:90
        record
            lpVtbl: a_IOleContainerVtbl_t;                  -- ole2.h:983
        end record;

    type IOleClientSite is                                  -- ole2.h:96
        record
            lpVtbl: a_IOleClientSiteVtbl_t;                 -- ole2.h:1131
        end record;

    type IOleObject is                                      -- ole2.h:102
        record
            lpVtbl: a_IOleObjectVtbl_t;                     -- ole2.h:1518
        end record;

    type IOleWindow is                                      -- ole2.h:108
        record
            lpVtbl: a_IOleWindowVtbl_t;                     -- ole2.h:1992
        end record;

    type IOleLink is                                        -- ole2.h:114
        record
            lpVtbl: a_IOleLinkVtbl_t;                       -- ole2.h:2191
        end record;

    type IOleItemContainer is                               -- ole2.h:120
        record
            lpVtbl: a_IOleItemContainerVtbl_t;              -- ole2.h:2498
        end record;

    type IOleInPlaceUIWindow is                             -- ole2.h:126
        record
            lpVtbl: a_IOleInPlaceUIWindowVtbl_t;            -- ole2.h:2681
        end record;

    type IOleInPlaceActiveObject is                         -- ole2.h:132
        record
            lpVtbl: a_IOleInPlaceActiveObjectVtbl_t;        -- ole2.h:2869
        end record;

    type IOleInPlaceFrame is                                -- ole2.h:138
        record
            lpVtbl: a_IOleInPlaceFrameVtbl_t;               -- ole2.h:3126
        end record;

    type IOleInPlaceObject is                               -- ole2.h:144
        record
            lpVtbl: a_IOleInPlaceObjectVtbl_t;              -- ole2.h:3345
        end record;

    type IOleInPlaceSite is                                 -- ole2.h:150
        record
            lpVtbl: a_IOleInPlaceSiteVtbl_t;                -- ole2.h:3557
        end record;

    type IViewObject is                                     -- ole2.h:156
        record
            lpVtbl: a_IViewObjectVtbl_t;                    -- ole2.h:3871
        end record;

    type IViewObject2 is                                    -- ole2.h:162
        record
            lpVtbl: a_IViewObject2Vtbl_t;                   -- ole2.h:4115
        end record;

    type IDropSource is                                     -- ole2.h:168
        record
            lpVtbl: a_IDropSourceVtbl_t;                    -- ole2.h:4241
        end record;

    type IDropTarget is                                     -- ole2.h:174
        record
            lpVtbl: a_IDropTargetVtbl_t;                    -- ole2.h:4430
        end record;

    type IEnumOLEVERB is                                    -- ole2.h:180
        record
            lpVtbl: a_IEnumOLEVERBVtbl_t;                   -- ole2.h:4619
        end record;


    type af_250_QueryInterface is access function (
                This     : access IOleAdviseHolder;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:250
    pragma Convention(Stdcall, af_250_QueryInterface);

    type af_255_AddRef is access function (
                This: access IOleAdviseHolder)
               return Win32.ULONG;                          -- ole2.h:255
    pragma Convention(Stdcall, af_255_AddRef);

    type af_258_Release is access function (
                This: access IOleAdviseHolder)
               return Win32.ULONG;                          -- ole2.h:258
    pragma Convention(Stdcall, af_258_Release);

    type af_261_Advise is access function (
                This         : access IOleAdviseHolder;
                pAdvise      : access Win32.Objbase.IAdviseSink;
                pdwConnection: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:261
    pragma Convention(Stdcall, af_261_Advise);

    type af_266_Unadvise is access function (
                This        : access IOleAdviseHolder;
                dwConnection: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:266
    pragma Convention(Stdcall, af_266_Unadvise);

    type af_270_EnumAdvise is access function (
                This        : access IOleAdviseHolder;
                ppenumAdvise: access Win32.Objbase.LPENUMSTATDATA)
               return Win32.Objbase.HRESULT;                -- ole2.h:270
    pragma Convention(Stdcall, af_270_EnumAdvise);

    type af_274_SendOnRename is access function (
                This: access IOleAdviseHolder;
                pmk : access Win32.Objbase.IMoniker)
               return Win32.Objbase.HRESULT;                -- ole2.h:274
    pragma Convention(Stdcall, af_274_SendOnRename);

    type af_278_SendOnSave is access function (
                This: access IOleAdviseHolder)
               return Win32.Objbase.HRESULT;                -- ole2.h:278
    pragma Convention(Stdcall, af_278_SendOnSave);

    type af_281_SendOnClose is access function (
                This: access IOleAdviseHolder)
               return Win32.Objbase.HRESULT;                -- ole2.h:281
    pragma Convention(Stdcall, af_281_SendOnClose);

    type af_454_QueryInterface is access function (
                This     : access IOleCache;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:454
    pragma Convention(Stdcall, af_454_QueryInterface);

    type af_459_AddRef is access function (
                This: access IOleCache)
               return Win32.ULONG;                          -- ole2.h:459
    pragma Convention(Stdcall, af_459_AddRef);

    type af_462_Release is access function (
                This: access IOleCache)
               return Win32.ULONG;                          -- ole2.h:462
    pragma Convention(Stdcall, af_462_Release);

    type af_465_Cache is access function (
                This         : access IOleCache;
                pformatetc   : access Win32.Objbase.FORMATETC;
                advf         : Win32.DWORD;
                pdwConnection: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:465
    pragma Convention(Stdcall, af_465_Cache);

    type af_471_Uncache is access function (
                This        : access IOleCache;
                dwConnection: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:471
    pragma Convention(Stdcall, af_471_Uncache);

    type af_475_EnumCache is access function (
                This          : access IOleCache;
                ppenumSTATDATA: access Win32.Objbase.LPENUMSTATDATA)
               return Win32.Objbase.HRESULT;                -- ole2.h:475
    pragma Convention(Stdcall, af_475_EnumCache);

    type af_479_InitCache is access function (
                This       : access IOleCache;
                pDataObject: access Win32.Objbase.IDataObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:479
    pragma Convention(Stdcall, af_479_InitCache);

    type af_483_SetData is access function (
                This      : access IOleCache;
                pformatetc: access Win32.Objbase.FORMATETC;
                pmedium   : access Win32.Objbase.STGMEDIUM;
                fRelease  : Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:483
    pragma Convention(Stdcall, af_483_SetData);

    type af_676_QueryInterface is access function (
                This     : access IOleCache2;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:676
    pragma Convention(Stdcall, af_676_QueryInterface);

    type af_681_AddRef is access function (
                This: access IOleCache2)
               return Win32.ULONG;                          -- ole2.h:681
    pragma Convention(Stdcall, af_681_AddRef);

    type af_684_Release is access function (
                This: access IOleCache2)
               return Win32.ULONG;                          -- ole2.h:684
    pragma Convention(Stdcall, af_684_Release);

    type af_687_Cache is access function (
                This         : access IOleCache2;
                pformatetc   : access Win32.Objbase.FORMATETC;
                advf         : Win32.DWORD;
                pdwConnection: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:687
    pragma Convention(Stdcall, af_687_Cache);

    type af_693_Uncache is access function (
                This        : access IOleCache2;
                dwConnection: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:693
    pragma Convention(Stdcall, af_693_Uncache);

    type af_697_EnumCache is access function (
                This          : access IOleCache2;
                ppenumSTATDATA: access Win32.Objbase.LPENUMSTATDATA)
               return Win32.Objbase.HRESULT;                -- ole2.h:697
    pragma Convention(Stdcall, af_697_EnumCache);

    type af_701_InitCache is access function (
                This       : access IOleCache2;
                pDataObject: access Win32.Objbase.IDataObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:701
    pragma Convention(Stdcall, af_701_InitCache);

    type af_705_SetData is access function (
                This      : access IOleCache2;
                pformatetc: access Win32.Objbase.FORMATETC;
                pmedium   : access Win32.Objbase.STGMEDIUM;
                fRelease  : Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:705
    pragma Convention(Stdcall, af_705_SetData);

    type af_711_UpdateCache is access function (
                This       : access IOleCache2;
                pDataObject: Win32.Objbase.LPDATAOBJECT;
                grfUpdf    : Win32.DWORD;
                pReserved  : Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:711
    pragma Convention(Stdcall, af_711_UpdateCache);

    type af_717_DiscardCache is access function (
                This            : access IOleCache2;
                dwDiscardOptions: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:717
    pragma Convention(Stdcall, af_717_DiscardCache);

    type af_836_QueryInterface is access function (
                This     : access IOleCacheControl;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:836
    pragma Convention(Stdcall, af_836_QueryInterface);

    type af_841_AddRef is access function (
                This: access IOleCacheControl)
               return Win32.ULONG;                          -- ole2.h:841
    pragma Convention(Stdcall, af_841_AddRef);

    type af_844_Release is access function (
                This: access IOleCacheControl)
               return Win32.ULONG;                          -- ole2.h:844
    pragma Convention(Stdcall, af_844_Release);

    type af_847_OnRun is access function (
                This       : access IOleCacheControl;
                pDataObject: Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:847
    pragma Convention(Stdcall, af_847_OnRun);

    type af_851_OnStop is access function (
                This: access IOleCacheControl)
               return Win32.Objbase.HRESULT;                -- ole2.h:851
    pragma Convention(Stdcall, af_851_OnStop);

    type af_952_QueryInterface is access function (
                This     : access IOleContainer;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:952
    pragma Convention(Stdcall, af_952_QueryInterface);

    type af_957_AddRef is access function (
                This: access IOleContainer)
               return Win32.ULONG;                          -- ole2.h:957
    pragma Convention(Stdcall, af_957_AddRef);

    type af_960_Release is access function (
                This: access IOleContainer)
               return Win32.ULONG;                          -- ole2.h:960
    pragma Convention(Stdcall, af_960_Release);

    type af_963_ParseDisplayName is access function (
                This          : access IOleContainer;
                pbc           : access Win32.Objbase.IBindCtx;
                pszDisplayName: Win32.Objbase.LPOLESTR;
                pchEaten      : access Win32.ULONG;
                ppmkOut       : access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:963
    pragma Convention(Stdcall, af_963_ParseDisplayName);

    type af_970_EnumObjects is access function (
                This    : access IOleContainer;
                grfFlags: Win32.DWORD;
                ppenum  : access Win32.Objbase.LPENUMUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:970
    pragma Convention(Stdcall, af_970_EnumObjects);

    type af_975_LockContainer is access function (
                This : access IOleContainer;
                fLock: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:975
    pragma Convention(Stdcall, af_975_LockContainer);

    type af_1093_QueryInterface is access function (
                This     : access IOleClientSite;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:1093
    pragma Convention(Stdcall, af_1093_QueryInterface);

    type af_1098_AddRef is access function (
                This: access IOleClientSite)
               return Win32.ULONG;                          -- ole2.h:1098
    pragma Convention(Stdcall, af_1098_AddRef);

    type af_1101_Release is access function (
                This: access IOleClientSite)
               return Win32.ULONG;                          -- ole2.h:1101
    pragma Convention(Stdcall, af_1101_Release);

    type af_1104_SaveObject is access function (
                This: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1104
    pragma Convention(Stdcall, af_1104_SaveObject);

    type af_1107_GetMoniker is access function (
                This          : access IOleClientSite;
                dwAssign      : Win32.DWORD;
                dwWhichMoniker: Win32.DWORD;
                ppmk          : access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:1107
    pragma Convention(Stdcall, af_1107_GetMoniker);

    type af_1113_GetContainer is access function (
                This       : access IOleClientSite;
                ppContainer: access LPOLECONTAINER)
               return Win32.Objbase.HRESULT;                -- ole2.h:1113
    pragma Convention(Stdcall, af_1113_GetContainer);

    type af_1117_ShowObject is access function (
                This: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1117
    pragma Convention(Stdcall, af_1117_ShowObject);

    type af_1120_OnShowWindow is access function (
                This : access IOleClientSite;
                fShow: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:1120
    pragma Convention(Stdcall, af_1120_OnShowWindow);

    type af_1124_RequestNewObjectLayout is access function (
                This: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1124
    pragma Convention(Stdcall, af_1124_RequestNewObjectLayout);

    type af_1404_QueryInterface is access function (
                This     : access IOleObject;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:1404
    pragma Convention(Stdcall, af_1404_QueryInterface);

    type af_1409_AddRef is access function (
                This: access IOleObject)
               return Win32.ULONG;                          -- ole2.h:1409
    pragma Convention(Stdcall, af_1409_AddRef);

    type af_1412_Release is access function (
                This: access IOleObject)
               return Win32.ULONG;                          -- ole2.h:1412
    pragma Convention(Stdcall, af_1412_Release);

    type af_1415_SetClientSite is access function (
                This       : access IOleObject;
                pClientSite: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1415
    pragma Convention(Stdcall, af_1415_SetClientSite);

    type af_1419_GetClientSite is access function (
                This        : access IOleObject;
                ppClientSite: access LPOLECLIENTSITE)
               return Win32.Objbase.HRESULT;                -- ole2.h:1419
    pragma Convention(Stdcall, af_1419_GetClientSite);

    type af_1423_SetHostNames is access function (
                This          : access IOleObject;
                szContainerApp: Win32.Objbase.LPCOLESTR;
                szContainerObj: Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:1423
    pragma Convention(Stdcall, af_1423_SetHostNames);

    type af_1428_Close is access function (
                This        : access IOleObject;
                dwSaveOption: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1428
    pragma Convention(Stdcall, af_1428_Close);

    type af_1432_SetMoniker is access function (
                This          : access IOleObject;
                dwWhichMoniker: Win32.DWORD;
                pmk           : access Win32.Objbase.IMoniker)
               return Win32.Objbase.HRESULT;                -- ole2.h:1432
    pragma Convention(Stdcall, af_1432_SetMoniker);

    type af_1437_GetMoniker is access function (
                This          : access IOleObject;
                dwAssign      : Win32.DWORD;
                dwWhichMoniker: Win32.DWORD;
                ppmk          : access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:1437
    pragma Convention(Stdcall, af_1437_GetMoniker);

    type af_1443_InitFromData is access function (
                This       : access IOleObject;
                pDataObject: access Win32.Objbase.IDataObject;
                fCreation  : Win32.BOOL;
                dwReserved : Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1443
    pragma Convention(Stdcall, af_1443_InitFromData);

    type af_1449_GetClipboardData is access function (
                This        : access IOleObject;
                dwReserved  : Win32.DWORD;
                ppDataObject: access Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:1449
    pragma Convention(Stdcall, af_1449_GetClipboardData);

    type af_1454_DoVerb is access function (
                This       : access IOleObject;
                iVerb      : Win32.LONG;
                lpmsg      : Win32.Winuser.LPMSG;
                pActiveSite: access IOleClientSite;
                lindex     : Win32.LONG;
                hwndParent : Win32.Windef.HWND;
                lprcPosRect: Win32.Objbase.LPCRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:1454
    pragma Convention(Stdcall, af_1454_DoVerb);

    type af_1463_EnumVerbs is access function (
                This         : access IOleObject;
                ppEnumOleVerb: access LPENUMOLEVERB)
               return Win32.Objbase.HRESULT;                -- ole2.h:1463
    pragma Convention(Stdcall, af_1463_EnumVerbs);

    type af_1467_Update is access function (
                This: access IOleObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:1467
    pragma Convention(Stdcall, af_1467_Update);

    type af_1470_IsUpToDate is access function (
                This: access IOleObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:1470
    pragma Convention(Stdcall, af_1470_IsUpToDate);

    type af_1473_GetUserClassID is access function (
                This  : access IOleObject;
                pClsid: Win32.Objbase.REFCLSID)
               return Win32.Objbase.HRESULT;                -- ole2.h:1473
    pragma Convention(Stdcall, af_1473_GetUserClassID);

    type af_1477_GetUserType is access function (
                This        : access IOleObject;
                dwFormOfType: Win32.DWORD;
                pszUserType : access Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:1477
    pragma Convention(Stdcall, af_1477_GetUserType);

    type af_1482_SetExtent is access function (
                This        : access IOleObject;
                dwDrawAspect: Win32.DWORD;
                psizel      : access Win32.Windef.SIZEL)
               return Win32.Objbase.HRESULT;                -- ole2.h:1482
    pragma Convention(Stdcall, af_1482_SetExtent);

    type af_1487_GetExtent is access function (
                This        : access IOleObject;
                dwDrawAspect: Win32.DWORD;
                psizel      : access Win32.Windef.SIZEL)
               return Win32.Objbase.HRESULT;                -- ole2.h:1487
    pragma Convention(Stdcall, af_1487_GetExtent);

    type af_1492_Advise is access function (
                This         : access IOleObject;
                pAdvSink     : access Win32.Objbase.IAdviseSink;
                pdwConnection: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1492
    pragma Convention(Stdcall, af_1492_Advise);

    type af_1497_Unadvise is access function (
                This        : access IOleObject;
                dwConnection: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1497
    pragma Convention(Stdcall, af_1497_Unadvise);

    type af_1501_EnumAdvise is access function (
                This        : access IOleObject;
                ppenumAdvise: access Win32.Objbase.LPENUMSTATDATA)
               return Win32.Objbase.HRESULT;                -- ole2.h:1501
    pragma Convention(Stdcall, af_1501_EnumAdvise);

    type af_1505_GetMiscStatus is access function (
                This     : access IOleObject;
                dwAspect : Win32.DWORD;
                pdwStatus: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1505
    pragma Convention(Stdcall, af_1505_GetMiscStatus);

    type af_1510_SetColorScheme is access function (
                This   : access IOleObject;
                pLogpal: access Win32.Wingdi.LOGPALETTE)
               return Win32.Objbase.HRESULT;                -- ole2.h:1510
    pragma Convention(Stdcall, af_1510_SetColorScheme);

    type af_1969_QueryInterface is access function (
                This     : access IOleWindow;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:1969
    pragma Convention(Stdcall, af_1969_QueryInterface);

    type af_1974_AddRef is access function (
                This: access IOleWindow)
               return Win32.ULONG;                          -- ole2.h:1974
    pragma Convention(Stdcall, af_1974_AddRef);

    type af_1977_Release is access function (
                This: access IOleWindow)
               return Win32.ULONG;                          -- ole2.h:1977
    pragma Convention(Stdcall, af_1977_Release);

    type af_1980_GetWindow is access function (
                This : access IOleWindow;
                phwnd: access Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:1980
    pragma Convention(Stdcall, af_1980_GetWindow);

    type af_1984_ContextSensitiveHelp is access function (
                This      : access IOleWindow;
                fEnterMode: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:1984
    pragma Convention(Stdcall, af_1984_ContextSensitiveHelp);

    type af_2132_QueryInterface is access function (
                This     : access IOleLink;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2132
    pragma Convention(Stdcall, af_2132_QueryInterface);

    type af_2137_AddRef is access function (
                This: access IOleLink)
               return Win32.ULONG;                          -- ole2.h:2137
    pragma Convention(Stdcall, af_2137_AddRef);

    type af_2140_Release is access function (
                This: access IOleLink)
               return Win32.ULONG;                          -- ole2.h:2140
    pragma Convention(Stdcall, af_2140_Release);

    type af_2143_SetUpdateOptions is access function (
                This       : access IOleLink;
                dwUpdateOpt: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:2143
    pragma Convention(Stdcall, af_2143_SetUpdateOptions);

    type af_2147_GetUpdateOptions is access function (
                This        : access IOleLink;
                pdwUpdateOpt: access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:2147
    pragma Convention(Stdcall, af_2147_GetUpdateOptions);

    type af_2151_SetSourceMoniker is access function (
                This  : access IOleLink;
                pmk   : access Win32.Objbase.IMoniker;
                rclsid: Win32.Objbase.REFCLSID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2151
    pragma Convention(Stdcall, af_2151_SetSourceMoniker);

    type af_2156_GetSourceMoniker is access function (
                This: access IOleLink;
                ppmk: access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:2156
    pragma Convention(Stdcall, af_2156_GetSourceMoniker);

    type af_2160_SetSourceDisplayName is access function (
                This         : access IOleLink;
                pszStatusText: Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2160
    pragma Convention(Stdcall, af_2160_SetSourceDisplayName);

    type af_2164_GetSourceDisplayName is access function (
                This           : access IOleLink;
                ppszDisplayName: access Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2164
    pragma Convention(Stdcall, af_2164_GetSourceDisplayName);

    type af_2168_BindToSource is access function (
                This     : access IOleLink;
                bindflags: Win32.DWORD;
                pbc      : access Win32.Objbase.IBindCtx)
               return Win32.Objbase.HRESULT;                -- ole2.h:2168
    pragma Convention(Stdcall, af_2168_BindToSource);

    type af_2173_BindIfRunning is access function (
                This: access IOleLink)
               return Win32.Objbase.HRESULT;                -- ole2.h:2173
    pragma Convention(Stdcall, af_2173_BindIfRunning);

    type af_2176_GetBoundSource is access function (
                This : access IOleLink;
                ppunk: access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:2176
    pragma Convention(Stdcall, af_2176_GetBoundSource);

    type af_2180_UnbindSource is access function (
                This: access IOleLink)
               return Win32.Objbase.HRESULT;                -- ole2.h:2180
    pragma Convention(Stdcall, af_2180_UnbindSource);

    type af_2183_Update is access function (
                This: access IOleLink;
                pbc : access Win32.Objbase.IBindCtx)
               return Win32.Objbase.HRESULT;                -- ole2.h:2183
    pragma Convention(Stdcall, af_2183_Update);

    type af_2448_QueryInterface is access function (
                This     : access IOleItemContainer;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2448
    pragma Convention(Stdcall, af_2448_QueryInterface);

    type af_2453_AddRef is access function (
                This: access IOleItemContainer)
               return Win32.ULONG;                          -- ole2.h:2453
    pragma Convention(Stdcall, af_2453_AddRef);

    type af_2456_Release is access function (
                This: access IOleItemContainer)
               return Win32.ULONG;                          -- ole2.h:2456
    pragma Convention(Stdcall, af_2456_Release);

    type af_2459_ParseDisplayName is access function (
                This          : access IOleItemContainer;
                pbc           : access Win32.Objbase.IBindCtx;
                pszDisplayName: Win32.Objbase.LPOLESTR;
                pchEaten      : access Win32.ULONG;
                ppmkOut       : access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:2459
    pragma Convention(Stdcall, af_2459_ParseDisplayName);

    type af_2466_EnumObjects is access function (
                This    : access IOleItemContainer;
                grfFlags: Win32.DWORD;
                ppenum  : access Win32.Objbase.LPENUMUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:2466
    pragma Convention(Stdcall, af_2466_EnumObjects);

    type af_2471_LockContainer is access function (
                This : access IOleItemContainer;
                fLock: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2471
    pragma Convention(Stdcall, af_2471_LockContainer);

    type af_2475_GetObjectA is access function (
                This         : access IOleItemContainer;
                pszItem      : Win32.Objbase.LPOLESTR;
                dwSpeedNeeded: Win32.DWORD;
                pbc          : access Win32.Objbase.IBindCtx;
                riid         : Win32.Objbase.REFIID;
                ppvObject    : access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2475
    pragma Convention(Stdcall, af_2475_GetObjectA);

    type af_2483_GetObjectStorage is access function (
                This      : access IOleItemContainer;
                pszItem   : Win32.Objbase.LPOLESTR;
                pbc       : access Win32.Objbase.IBindCtx;
                riid      : Win32.Objbase.REFIID;
                ppvStorage: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2483
    pragma Convention(Stdcall, af_2483_GetObjectStorage);

    type af_2490_IsRunning is access function (
                This   : access IOleItemContainer;
                pszItem: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2490
    pragma Convention(Stdcall, af_2490_IsRunning);

    type af_2641_QueryInterface is access function (
                This     : access IOleInPlaceUIWindow;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2641
    pragma Convention(Stdcall, af_2641_QueryInterface);

    type af_2646_AddRef is access function (
                This: access IOleInPlaceUIWindow)
               return Win32.ULONG;                          -- ole2.h:2646
    pragma Convention(Stdcall, af_2646_AddRef);

    type af_2649_Release is access function (
                This: access IOleInPlaceUIWindow)
               return Win32.ULONG;                          -- ole2.h:2649
    pragma Convention(Stdcall, af_2649_Release);

    type af_2652_GetWindow is access function (
                This : access IOleInPlaceUIWindow;
                phwnd: access Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:2652
    pragma Convention(Stdcall, af_2652_GetWindow);

    type af_2656_ContextSensitiveHelp is access function (
                This      : access IOleInPlaceUIWindow;
                fEnterMode: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2656
    pragma Convention(Stdcall, af_2656_ContextSensitiveHelp);

    type af_2660_GetBorder is access function (
                This        : access IOleInPlaceUIWindow;
                lprectBorder: Win32.Windef.LPRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:2660
    pragma Convention(Stdcall, af_2660_GetBorder);

    type af_2664_RequestBorderSpace is access function (
                This         : access IOleInPlaceUIWindow;
                pborderwidths: LPCBORDERWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:2664
    pragma Convention(Stdcall, af_2664_RequestBorderSpace);

    type af_2668_SetBorderSpace is access function (
                This         : access IOleInPlaceUIWindow;
                pborderwidths: LPCBORDERWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:2668
    pragma Convention(Stdcall, af_2668_SetBorderSpace);

    type af_2672_SetActiveObject is access function (
                This         : access IOleInPlaceUIWindow;
                pActiveObject: access IOleInPlaceActiveObject;
                pszObjName   : Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2672
    pragma Convention(Stdcall, af_2672_SetActiveObject);

    type af_2824_QueryInterface is access function (
                This     : access IOleInPlaceActiveObject;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2824
    pragma Convention(Stdcall, af_2824_QueryInterface);

    type af_2829_AddRef is access function (
                This: access IOleInPlaceActiveObject)
               return Win32.ULONG;                          -- ole2.h:2829
    pragma Convention(Stdcall, af_2829_AddRef);

    type af_2832_Release is access function (
                This: access IOleInPlaceActiveObject)
               return Win32.ULONG;                          -- ole2.h:2832
    pragma Convention(Stdcall, af_2832_Release);

    type af_2835_GetWindow is access function (
                This : access IOleInPlaceActiveObject;
                phwnd: access Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:2835
    pragma Convention(Stdcall, af_2835_GetWindow);

    type af_2839_ContextSensitiveHelp is access function (
                This      : access IOleInPlaceActiveObject;
                fEnterMode: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2839
    pragma Convention(Stdcall, af_2839_ContextSensitiveHelp);

    type af_2843_TranslateAcceleratorA is access function (
                This : access IOleInPlaceActiveObject;
                lpmsg: Win32.Winuser.LPMSG)
               return Win32.Objbase.HRESULT;                -- ole2.h:2843
    pragma Convention(Stdcall, af_2843_TranslateAcceleratorA);

    type af_2847_OnFrameWindowActivate is access function (
                This     : access IOleInPlaceActiveObject;
                fActivate: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2847
    pragma Convention(Stdcall, af_2847_OnFrameWindowActivate);

    type af_2851_OnDocWindowActivate is access function (
                This     : access IOleInPlaceActiveObject;
                fActivate: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2851
    pragma Convention(Stdcall, af_2851_OnDocWindowActivate);

    type af_2855_ResizeBorder is access function (
                This        : access IOleInPlaceActiveObject;
                prcBorder   : Win32.Objbase.LPCRECT;
                pUIWindow   : access IOleInPlaceUIWindow;
                fFrameWindow: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2855
    pragma Convention(Stdcall, af_2855_ResizeBorder);

    type af_2861_EnableModeless is access function (
                This   : access IOleInPlaceActiveObject;
                fEnable: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2861
    pragma Convention(Stdcall, af_2861_EnableModeless);

    type af_3058_QueryInterface is access function (
                This     : access IOleInPlaceFrame;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:3058
    pragma Convention(Stdcall, af_3058_QueryInterface);

    type af_3063_AddRef is access function (
                This: access IOleInPlaceFrame)
               return Win32.ULONG;                          -- ole2.h:3063
    pragma Convention(Stdcall, af_3063_AddRef);

    type af_3066_Release is access function (
                This: access IOleInPlaceFrame)
               return Win32.ULONG;                          -- ole2.h:3066
    pragma Convention(Stdcall, af_3066_Release);

    type af_3069_GetWindow is access function (
                This : access IOleInPlaceFrame;
                phwnd: access Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:3069
    pragma Convention(Stdcall, af_3069_GetWindow);

    type af_3073_ContextSensitiveHelp is access function (
                This      : access IOleInPlaceFrame;
                fEnterMode: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:3073
    pragma Convention(Stdcall, af_3073_ContextSensitiveHelp);

    type af_3077_GetBorder is access function (
                This        : access IOleInPlaceFrame;
                lprectBorder: Win32.Windef.LPRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:3077
    pragma Convention(Stdcall, af_3077_GetBorder);

    type af_3081_RequestBorderSpace is access function (
                This         : access IOleInPlaceFrame;
                pborderwidths: LPCBORDERWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:3081
    pragma Convention(Stdcall, af_3081_RequestBorderSpace);

    type af_3085_SetBorderSpace is access function (
                This         : access IOleInPlaceFrame;
                pborderwidths: LPCBORDERWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:3085
    pragma Convention(Stdcall, af_3085_SetBorderSpace);

    type af_3089_SetActiveObject is access function (
                This         : access IOleInPlaceFrame;
                pActiveObject: access IOleInPlaceActiveObject;
                pszObjName   : Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:3089
    pragma Convention(Stdcall, af_3089_SetActiveObject);

    type af_3094_InsertMenus is access function (
                This        : access IOleInPlaceFrame;
                hmenuShared : Win32.Windef.HMENU;
                lpMenuWidths: LPOLEMENUGROUPWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:3094
    pragma Convention(Stdcall, af_3094_InsertMenus);

    type af_3099_SetMenu is access function (
                This            : access IOleInPlaceFrame;
                hmenuShared     : Win32.Windef.HMENU;
                holemenu        : Win32.Ole2.HOLEMENU;
                hwndActiveObject: Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:3099
    pragma Convention(Stdcall, af_3099_SetMenu);

    type af_3105_RemoveMenus is access function (
                This       : access IOleInPlaceFrame;
                hmenuShared: Win32.Windef.HMENU)
               return Win32.Objbase.HRESULT;                -- ole2.h:3105
    pragma Convention(Stdcall, af_3105_RemoveMenus);

    type af_3109_SetStatusText is access function (
                This         : access IOleInPlaceFrame;
                pszStatusText: Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:3109
    pragma Convention(Stdcall, af_3109_SetStatusText);

    type af_3113_EnableModeless is access function (
                This   : access IOleInPlaceFrame;
                fEnable: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:3113
    pragma Convention(Stdcall, af_3113_EnableModeless);

    type af_3117_TranslateAcceleratorA is access function (
                This : access IOleInPlaceFrame;
                lpmsg: Win32.Winuser.LPMSG;
                wID  : Win32.WORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3117
    pragma Convention(Stdcall, af_3117_TranslateAcceleratorA);

    type af_3308_QueryInterface is access function (
                This     : access IOleInPlaceObject;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:3308
    pragma Convention(Stdcall, af_3308_QueryInterface);

    type af_3313_AddRef is access function (
                This: access IOleInPlaceObject)
               return Win32.ULONG;                          -- ole2.h:3313
    pragma Convention(Stdcall, af_3313_AddRef);

    type af_3316_Release is access function (
                This: access IOleInPlaceObject)
               return Win32.ULONG;                          -- ole2.h:3316
    pragma Convention(Stdcall, af_3316_Release);

    type af_3319_GetWindow is access function (
                This : access IOleInPlaceObject;
                phwnd: access Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:3319
    pragma Convention(Stdcall, af_3319_GetWindow);

    type af_3323_ContextSensitiveHelp is access function (
                This      : access IOleInPlaceObject;
                fEnterMode: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:3323
    pragma Convention(Stdcall, af_3323_ContextSensitiveHelp);

    type af_3327_InPlaceDeactivate is access function (
                This: access IOleInPlaceObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:3327
    pragma Convention(Stdcall, af_3327_InPlaceDeactivate);

    type af_3330_UIDeactivate is access function (
                This: access IOleInPlaceObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:3330
    pragma Convention(Stdcall, af_3330_UIDeactivate);

    type af_3333_SetObjectRects is access function (
                This        : access IOleInPlaceObject;
                lprcPosRect : Win32.Objbase.LPCRECT;
                lprcClipRect: Win32.Objbase.LPCRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:3333
    pragma Convention(Stdcall, af_3333_SetObjectRects);

    type af_3338_ReactivateAndUndo is access function (
                This: access IOleInPlaceObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:3338
    pragma Convention(Stdcall, af_3338_ReactivateAndUndo);

    type af_3496_QueryInterface is access function (
                This     : access IOleInPlaceSite;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:3496
    pragma Convention(Stdcall, af_3496_QueryInterface);

    type af_3501_AddRef is access function (
                This: access IOleInPlaceSite)
               return Win32.ULONG;                          -- ole2.h:3501
    pragma Convention(Stdcall, af_3501_AddRef);

    type af_3504_Release is access function (
                This: access IOleInPlaceSite)
               return Win32.ULONG;                          -- ole2.h:3504
    pragma Convention(Stdcall, af_3504_Release);

    type af_3507_GetWindow is access function (
                This : access IOleInPlaceSite;
                phwnd: access Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:3507
    pragma Convention(Stdcall, af_3507_GetWindow);

    type af_3511_ContextSensitiveHelp is access function (
                This      : access IOleInPlaceSite;
                fEnterMode: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:3511
    pragma Convention(Stdcall, af_3511_ContextSensitiveHelp);

    type af_3515_CanInPlaceActivate is access function (
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3515
    pragma Convention(Stdcall, af_3515_CanInPlaceActivate);

    type af_3518_OnInPlaceActivate is access function (
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3518
    pragma Convention(Stdcall, af_3518_OnInPlaceActivate);

    type af_3521_OnUIActivate is access function (
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3521
    pragma Convention(Stdcall, af_3521_OnUIActivate);

    type af_3524_GetWindowContext is access function (
                This        : access IOleInPlaceSite;
                ppFrame     : access LPOLEINPLACEFRAME;
                ppDoc       : access LPOLEINPLACEUIWINDOW;
                lprcPosRect : Win32.Windef.LPRECT;
                lprcClipRect: Win32.Windef.LPRECT;
                lpFrameInfo : LPOLEINPLACEFRAMEINFO)
               return Win32.Objbase.HRESULT;                -- ole2.h:3524
    pragma Convention(Stdcall, af_3524_GetWindowContext);

    type af_3532_Scroll is access function (
                This        : access IOleInPlaceSite;
                scrollExtant: Win32.Windef.SIZE)
               return Win32.Objbase.HRESULT;                -- ole2.h:3532
    pragma Convention(Stdcall, af_3532_Scroll);

    type af_3536_OnUIDeactivate is access function (
                This     : access IOleInPlaceSite;
                fUndoable: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:3536
    pragma Convention(Stdcall, af_3536_OnUIDeactivate);

    type af_3540_OnInPlaceDeactivate is access function (
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3540
    pragma Convention(Stdcall, af_3540_OnInPlaceDeactivate);

    type af_3543_DiscardUndoState is access function (
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3543
    pragma Convention(Stdcall, af_3543_DiscardUndoState);

    type af_3546_DeactivateAndUndo is access function (
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3546
    pragma Convention(Stdcall, af_3546_DeactivateAndUndo);

    type af_3549_OnPosRectChange is access function (
                This       : access IOleInPlaceSite;
                lprcPosRect: Win32.Objbase.LPCRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:3549
    pragma Convention(Stdcall, af_3549_OnPosRectChange);

    type af_3810_QueryInterface is access function (
                This     : access IViewObject;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:3810
    pragma Convention(Stdcall, af_3810_QueryInterface);

    type af_3815_AddRef is access function (
                This: access IViewObject)
               return Win32.ULONG;                          -- ole2.h:3815
    pragma Convention(Stdcall, af_3815_AddRef);

    type af_3818_Release is access function (
                This: access IViewObject)
               return Win32.ULONG;                          -- ole2.h:3818
    pragma Convention(Stdcall, af_3818_Release);

    type af_3821_Draw is access function (
                This        : access IViewObject;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                hdcTargetDev: Win32.Windef.HDC;
                hdcDraw     : Win32.Windef.HDC;
                lprcBounds  : Win32.Objbase.LPCRECTL;
                lprcWBounds : Win32.Objbase.LPCRECTL;
                pfnContinue : access Win32.PBOOL;
                dwContinue  : Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3821
    pragma Convention(Stdcall, af_3821_Draw);

    type af_3835_GetColorSet is access function (
                This        : access IViewObject;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                hicTargetDev: Win32.Windef.HDC;
                ppColorSet  : access Win32.Wingdi.PLOGPALETTE)
               return Win32.Objbase.HRESULT;                -- ole2.h:3835
    pragma Convention(Stdcall, af_3835_GetColorSet);

    type af_3844_Freeze is access function (
                This        : access IViewObject;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                pdwFreeze   : access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3844
    pragma Convention(Stdcall, af_3844_Freeze);

    type af_3851_Unfreeze is access function (
                This    : access IViewObject;
                dwFreeze: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3851
    pragma Convention(Stdcall, af_3851_Unfreeze);

    type af_3855_SetAdvise is access function (
                This    : access IViewObject;
                aspects : Win32.DWORD;
                advf    : Win32.DWORD;
                pAdvSink: access Win32.Objbase.IAdviseSink)
               return Win32.Objbase.HRESULT;                -- ole2.h:3855
    pragma Convention(Stdcall, af_3855_SetAdvise);

    type af_3861_GetAdvise is access function (
                This     : access IViewObject;
                pAspects : access Win32.DWORD;
                pAdvf    : access Win32.DWORD;
                ppAdvSink: access Win32.Objbase.LPADVISESINK)
               return Win32.Objbase.HRESULT;                -- ole2.h:3861
    pragma Convention(Stdcall, af_3861_GetAdvise);

    type af_3924_pfnContinue is access function (
                dwContinue: Win32.DWORD)
               return Win32.BOOL;                           -- ole2.h:3924
    pragma Convention(Stdcall, af_3924_pfnContinue);

    type af_4047_QueryInterface is access function (
                This     : access IViewObject2;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4047
    pragma Convention(Stdcall, af_4047_QueryInterface);

    type af_4052_AddRef is access function (
                This: access IViewObject2)
               return Win32.ULONG;                          -- ole2.h:4052
    pragma Convention(Stdcall, af_4052_AddRef);

    type af_4055_Release is access function (
                This: access IViewObject2)
               return Win32.ULONG;                          -- ole2.h:4055
    pragma Convention(Stdcall, af_4055_Release);

    type af_4058_Draw is access function (
                This        : access IViewObject2;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                hdcTargetDev: Win32.Windef.HDC;
                hdcDraw     : Win32.Windef.HDC;
                lprcBounds  : Win32.Objbase.LPCRECTL;
                lprcWBounds : Win32.Objbase.LPCRECTL;
                pfnContinue : access Win32.PBOOL;
                dwContinue  : Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4058
    pragma Convention(Stdcall, af_4058_Draw);

    type af_4072_GetColorSet is access function (
                This        : access IViewObject2;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                hicTargetDev: Win32.Windef.HDC;
                ppColorSet  : access Win32.Wingdi.PLOGPALETTE)
               return Win32.Objbase.HRESULT;                -- ole2.h:4072
    pragma Convention(Stdcall, af_4072_GetColorSet);

    type af_4081_Freeze is access function (
                This        : access IViewObject2;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                pdwFreeze   : access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4081
    pragma Convention(Stdcall, af_4081_Freeze);

    type af_4088_Unfreeze is access function (
                This    : access IViewObject2;
                dwFreeze: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4088
    pragma Convention(Stdcall, af_4088_Unfreeze);

    type af_4092_SetAdvise is access function (
                This    : access IViewObject2;
                aspects : Win32.DWORD;
                advf    : Win32.DWORD;
                pAdvSink: access Win32.Objbase.IAdviseSink)
               return Win32.Objbase.HRESULT;                -- ole2.h:4092
    pragma Convention(Stdcall, af_4092_SetAdvise);

    type af_4098_GetAdvise is access function (
                This     : access IViewObject2;
                pAspects : access Win32.DWORD;
                pAdvf    : access Win32.DWORD;
                ppAdvSink: access Win32.Objbase.LPADVISESINK)
               return Win32.Objbase.HRESULT;                -- ole2.h:4098
    pragma Convention(Stdcall, af_4098_GetAdvise);

    type af_4104_GetExtent is access function (
                This        : access IViewObject2;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                lpsizel     : Win32.Windef.LPSIZEL)
               return Win32.Objbase.HRESULT;                -- ole2.h:4104
    pragma Convention(Stdcall, af_4104_GetExtent);

    type af_4217_QueryInterface is access function (
                This     : access IDropSource;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4217
    pragma Convention(Stdcall, af_4217_QueryInterface);

    type af_4222_AddRef is access function (
                This: access IDropSource)
               return Win32.ULONG;                          -- ole2.h:4222
    pragma Convention(Stdcall, af_4222_AddRef);

    type af_4225_Release is access function (
                This: access IDropSource)
               return Win32.ULONG;                          -- ole2.h:4225
    pragma Convention(Stdcall, af_4225_Release);

    type af_4228_QueryContinueDrag is access function (
                This          : access IDropSource;
                fEscapePressed: Win32.BOOL;
                grfKeyState   : Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4228
    pragma Convention(Stdcall, af_4228_QueryContinueDrag);

    type af_4233_GiveFeedback is access function (
                This    : access IDropSource;
                dwEffect: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4233
    pragma Convention(Stdcall, af_4233_GiveFeedback);

    type af_4392_QueryInterface is access function (
                This     : access IDropTarget;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4392
    pragma Convention(Stdcall, af_4392_QueryInterface);

    type af_4397_AddRef is access function (
                This: access IDropTarget)
               return Win32.ULONG;                          -- ole2.h:4397
    pragma Convention(Stdcall, af_4397_AddRef);

    type af_4400_Release is access function (
                This: access IDropTarget)
               return Win32.ULONG;                          -- ole2.h:4400
    pragma Convention(Stdcall, af_4400_Release);

    type af_4403_DragEnter is access function (
                This       : access IDropTarget;
                pDataObj   : access Win32.Objbase.IDataObject;
                grfKeyState: Win32.DWORD;
                pt         : Win32.Windef.POINTL;
                pdwEffect  : access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4403
    pragma Convention(Stdcall, af_4403_DragEnter);

    type af_4410_DragOver is access function (
                This       : access IDropTarget;
                grfKeyState: Win32.DWORD;
                pt         : Win32.Windef.POINTL;
                pdwEffect  : access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4410
    pragma Convention(Stdcall, af_4410_DragOver);

    type af_4416_DragLeave is access function (
                This: access IDropTarget)
               return Win32.Objbase.HRESULT;                -- ole2.h:4416
    pragma Convention(Stdcall, af_4416_DragLeave);

    type af_4419_Drop is access function (
                This       : access IDropTarget;
                pDataObj   : access Win32.Objbase.IDataObject;
                grfKeyState: Win32.DWORD;
                pt         : Win32.Windef.POINTL;
                pdwEffect  : access Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4419
    pragma Convention(Stdcall, af_4419_Drop);

    type af_4587_QueryInterface is access function (
                This     : access IEnumOLEVERB;
                riid     : Win32.Objbase.REFIID;
                ppvObject: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4587
    pragma Convention(Stdcall, af_4587_QueryInterface);

    type af_4592_AddRef is access function (
                This: access IEnumOLEVERB)
               return Win32.ULONG;                          -- ole2.h:4592
    pragma Convention(Stdcall, af_4592_AddRef);

    type af_4595_Release is access function (
                This: access IEnumOLEVERB)
               return Win32.ULONG;                          -- ole2.h:4595
    pragma Convention(Stdcall, af_4595_Release);

    type af_4598_Next is access function (
                This        : access IEnumOLEVERB;
                celt        : Win32.ULONG;
                rgelt       : LPOLEVERB;
                pceltFetched: access Win32.ULONG)
               return Win32.Objbase.HRESULT;                -- ole2.h:4598
    pragma Convention(Stdcall, af_4598_Next);

    type af_4604_Skip is access function (
                This: access IEnumOLEVERB;
                celt: Win32.ULONG)
               return Win32.Objbase.HRESULT;                -- ole2.h:4604
    pragma Convention(Stdcall, af_4604_Skip);

    type af_4608_Reset is access function (
                This: access IEnumOLEVERB)
               return Win32.Objbase.HRESULT;                -- ole2.h:4608
    pragma Convention(Stdcall, af_4608_Reset);

    type af_4611_Clone is access function (
                This  : access IEnumOLEVERB;
                ppenum: access LPENUMOLEVERB)
               return Win32.Objbase.HRESULT;                -- ole2.h:4611
    pragma Convention(Stdcall, af_4611_Clone);

    type af_4988_Get is access function (
                p1: LPOLESTREAM;
                p2: Win32.PVOID;
                p3: Win32.DWORD)
               return Win32.DWORD;                          -- ole2.h:4988
    pragma Convention(Stdcall, af_4988_Get);

    type af_4989_Put is access function (
                p1: LPOLESTREAM;
                p2: Win32.PVOID;
                p3: Win32.DWORD)
               return Win32.DWORD;                          -- ole2.h:4989
    pragma Convention(Stdcall, af_4989_Put);

    type IOleAdviseHolderVtbl is                            -- ole2.h:247
        record
            QueryInterface: af_250_QueryInterface;          -- ole2.h:250
            AddRef        : af_255_AddRef;                  -- ole2.h:255
            Release       : af_258_Release;                 -- ole2.h:258
            Advise        : af_261_Advise;                  -- ole2.h:261
            Unadvise      : af_266_Unadvise;                -- ole2.h:266
            EnumAdvise    : af_270_EnumAdvise;              -- ole2.h:270
            SendOnRename  : af_274_SendOnRename;            -- ole2.h:274
            SendOnSave    : af_278_SendOnSave;              -- ole2.h:278
            SendOnClose   : af_281_SendOnClose;             -- ole2.h:281
        end record;

    type IOleCacheVtbl is                                   -- ole2.h:451
        record
             QueryInterface: af_454_QueryInterface;         -- ole2.h:454
            AddRef        : af_459_AddRef;                  -- ole2.h:459
            Release       : af_462_Release;                 -- ole2.h:462
            Cache         : af_465_Cache;                   -- ole2.h:465
            Uncache       : af_471_Uncache;                 -- ole2.h:471
            EnumCache     : af_475_EnumCache;               -- ole2.h:475
            InitCache     : af_479_InitCache;               -- ole2.h:479
            SetData       : af_483_SetData;                 -- ole2.h:483
        end record;

    type IOleCache2Vtbl is                                  -- ole2.h:673
        record
            QueryInterface: af_676_QueryInterface;          -- ole2.h:676
            AddRef        : af_681_AddRef;                  -- ole2.h:681
            Release       : af_684_Release;                 -- ole2.h:684
            Cache         : af_687_Cache;                   -- ole2.h:687
            Uncache       : af_693_Uncache;                 -- ole2.h:693
            EnumCache     : af_697_EnumCache;               -- ole2.h:697
            InitCache     : af_701_InitCache;               -- ole2.h:701
            SetData       : af_705_SetData;                 -- ole2.h:705
            UpdateCache   : af_711_UpdateCache;             -- ole2.h:711
            DiscardCache  : af_717_DiscardCache;            -- ole2.h:717
        end record;

    type IOleCacheControlVtbl is                            -- ole2.h:833
        record
            QueryInterface: af_836_QueryInterface;          -- ole2.h:836
            AddRef        : af_841_AddRef;                  -- ole2.h:841
            Release       : af_844_Release;                 -- ole2.h:844
            OnRun         : af_847_OnRun;                   -- ole2.h:847
            OnStop        : af_851_OnStop;                  -- ole2.h:851
        end record;

    type IOleContainerVtbl is                               -- ole2.h:949
        record
            QueryInterface  : af_952_QueryInterface;        -- ole2.h:952
            AddRef          : af_957_AddRef;                -- ole2.h:957
            Release         : af_960_Release;               -- ole2.h:960
            ParseDisplayName: af_963_ParseDisplayName;      -- ole2.h:963
            EnumObjects     : af_970_EnumObjects;           -- ole2.h:970
            LockContainer   : af_975_LockContainer;         -- ole2.h:975
        end record;

    type IOleClientSiteVtbl is                              -- ole2.h:1090
        record
            QueryInterface        : af_1093_QueryInterface; -- ole2.h:1093
            AddRef                : af_1098_AddRef;         -- ole2.h:1098
            Release               : af_1101_Release;        -- ole2.h:1101
            SaveObject            : af_1104_SaveObject;     -- ole2.h:1104
            GetMoniker            : af_1107_GetMoniker;     -- ole2.h:1107
            GetContainer          : af_1113_GetContainer;   -- ole2.h:1113
            ShowObject            : af_1117_ShowObject;     -- ole2.h:1117
            OnShowWindow          : af_1120_OnShowWindow;   -- ole2.h:1120
            RequestNewObjectLayout: af_1124_RequestNewObjectLayout;
                                                            -- ole2.h:1124
        end record;

    type IOleObjectVtbl is                                  -- ole2.h:1401
        record
            QueryInterface  : af_1404_QueryInterface;       -- ole2.h:1404
            AddRef          : af_1409_AddRef;               -- ole2.h:1409
            Release         : af_1412_Release;              -- ole2.h:1412
            SetClientSite   : af_1415_SetClientSite;        -- ole2.h:1415
            GetClientSite   : af_1419_GetClientSite;        -- ole2.h:1419
            SetHostNames    : af_1423_SetHostNames;         -- ole2.h:1423
            Close           : af_1428_Close;                -- ole2.h:1428
            SetMoniker      : af_1432_SetMoniker;           -- ole2.h:1432
            GetMoniker      : af_1437_GetMoniker;           -- ole2.h:1437
            InitFromData    : af_1443_InitFromData;         -- ole2.h:1443
            GetClipboardData: af_1449_GetClipboardData;     -- ole2.h:1449
            DoVerb          : af_1454_DoVerb;               -- ole2.h:1454
            EnumVerbs       : af_1463_EnumVerbs;            -- ole2.h:1463
            Update          : af_1467_Update;               -- ole2.h:1467
            IsUpToDate      : af_1470_IsUpToDate;           -- ole2.h:1470
            GetUserClassID  : af_1473_GetUserClassID;       -- ole2.h:1473
            GetUserType     : af_1477_GetUserType;          -- ole2.h:1477
            SetExtent       : af_1482_SetExtent;            -- ole2.h:1482
            GetExtent       : af_1487_GetExtent;            -- ole2.h:1487
            Advise          : af_1492_Advise;               -- ole2.h:1492
            Unadvise        : af_1497_Unadvise;             -- ole2.h:1497
            EnumAdvise      : af_1501_EnumAdvise;           -- ole2.h:1501
            GetMiscStatus   : af_1505_GetMiscStatus;        -- ole2.h:1505
            SetColorScheme  : af_1510_SetColorScheme;       -- ole2.h:1510
        end record;

    type LPOLERENDER is access all OLERENDER;               -- ole2.h:1898

    type IOleWindowVtbl is                                  -- ole2.h:1966
        record
            QueryInterface      : af_1969_QueryInterface;   -- ole2.h:1969
            AddRef              : af_1974_AddRef;           -- ole2.h:1974
            Release             : af_1977_Release;          -- ole2.h:1977
            GetWindow           : af_1980_GetWindow;        -- ole2.h:1980
            ContextSensitiveHelp: af_1984_ContextSensitiveHelp;
                                                            -- ole2.h:1984
        end record;

    type LPOLEUPDATE is access all OLEUPDATE;               -- ole2.h:2073
    type POLEUPDATE is access all OLEUPDATE;                -- ole2.h:2076

    type IOleLinkVtbl is                                    -- ole2.h:2129
        record
            QueryInterface      : af_2132_QueryInterface;   -- ole2.h:2132
            AddRef              : af_2137_AddRef;           -- ole2.h:2137
            Release             : af_2140_Release;          -- ole2.h:2140
            SetUpdateOptions    : af_2143_SetUpdateOptions; -- ole2.h:2143
            GetUpdateOptions    : af_2147_GetUpdateOptions; -- ole2.h:2147
            SetSourceMoniker    : af_2151_SetSourceMoniker; -- ole2.h:2151
            GetSourceMoniker    : af_2156_GetSourceMoniker; -- ole2.h:2156
            SetSourceDisplayName: af_2160_SetSourceDisplayName;
                                                            -- ole2.h:2160
            GetSourceDisplayName: af_2164_GetSourceDisplayName;
                                                            -- ole2.h:2164
            BindToSource        : af_2168_BindToSource;     -- ole2.h:2168
            BindIfRunning       : af_2173_BindIfRunning;    -- ole2.h:2173
            GetBoundSource      : af_2176_GetBoundSource;   -- ole2.h:2176
            UnbindSource        : af_2180_UnbindSource;     -- ole2.h:2180
            Update              : af_2183_Update;           -- ole2.h:2183
        end record;

    type IOleItemContainerVtbl is                           -- ole2.h:2445
        record
            QueryInterface  : af_2448_QueryInterface;       -- ole2.h:2448
            AddRef          : af_2453_AddRef;               -- ole2.h:2453
            Release         : af_2456_Release;              -- ole2.h:2456
            ParseDisplayName: af_2459_ParseDisplayName;     -- ole2.h:2459
            EnumObjects     : af_2466_EnumObjects;          -- ole2.h:2466
            LockContainer   : af_2471_LockContainer;        -- ole2.h:2471
            GetObjectA      : af_2475_GetObjectA;           -- ole2.h:2475
            GetObjectStorage: af_2483_GetObjectStorage;     -- ole2.h:2483
            IsRunning       : af_2490_IsRunning;            -- ole2.h:2490
        end record;

    subtype BORDERWIDTHS is Win32.Windef.RECT;              -- ole2.h:2605

    type IOleInPlaceUIWindowVtbl is                         -- ole2.h:2638
        record
            QueryInterface      : af_2641_QueryInterface;   -- ole2.h:2641
            AddRef              : af_2646_AddRef;           -- ole2.h:2646
            Release             : af_2649_Release;          -- ole2.h:2649
            GetWindow           : af_2652_GetWindow;        -- ole2.h:2652
            ContextSensitiveHelp: af_2656_ContextSensitiveHelp;
                                                            -- ole2.h:2656
            GetBorder           : af_2660_GetBorder;        -- ole2.h:2660
            RequestBorderSpace  : af_2664_RequestBorderSpace;
                                                            -- ole2.h:2664
            SetBorderSpace      : af_2668_SetBorderSpace;   -- ole2.h:2668
            SetActiveObject     : af_2672_SetActiveObject;  -- ole2.h:2672
        end record;

    type IOleInPlaceActiveObjectVtbl is                     -- ole2.h:2821
        record
            QueryInterface       : af_2824_QueryInterface;  -- ole2.h:2824
            AddRef               : af_2829_AddRef;          -- ole2.h:2829
            Release              : af_2832_Release;         -- ole2.h:2832
            GetWindow            : af_2835_GetWindow;       -- ole2.h:2835
            ContextSensitiveHelp : af_2839_ContextSensitiveHelp;
                                                            -- ole2.h:2839
            TranslateAcceleratorA: af_2843_TranslateAcceleratorA;
                                                            -- ole2.h:2843
            OnFrameWindowActivate: af_2847_OnFrameWindowActivate;
                                                            -- ole2.h:2847
            OnDocWindowActivate  : af_2851_OnDocWindowActivate;
                                                            -- ole2.h:2851
            ResizeBorder         : af_2855_ResizeBorder;    -- ole2.h:2855
            EnableModeless       : af_2861_EnableModeless;  -- ole2.h:2861
        end record;

    type OLEINPLACEFRAMEINFO is                             -- ole2.h:2997
        record
            cb           : Win32.UINT;                      -- ole2.h:2999
            fMDIApp      : Win32.BOOL;                      -- ole2.h:3000
            hwndFrame    : Win32.Windef.HWND;               -- ole2.h:3001
            haccel       : Win32.Windef.HACCEL;             -- ole2.h:3002
            cAccelEntries: Win32.UINT;                      -- ole2.h:3003
        end record;

    type OLEMENUGROUPWIDTHS is                              -- ole2.h:3010
        record
            width: Win32.LONG_Array(0..5);                  -- ole2.h:3012
        end record;

    type IOleInPlaceFrameVtbl is                            -- ole2.h:3055
        record
             QueryInterface       : af_3058_QueryInterface; -- ole2.h:3058
            AddRef               : af_3063_AddRef;          -- ole2.h:3063
            Release              : af_3066_Release;         -- ole2.h:3066
            GetWindow            : af_3069_GetWindow;       -- ole2.h:3069
            ContextSensitiveHelp : af_3073_ContextSensitiveHelp;
                                                            -- ole2.h:3073
            GetBorder            : af_3077_GetBorder;       -- ole2.h:3077
            RequestBorderSpace   : af_3081_RequestBorderSpace;
                                                            -- ole2.h:3081
            SetBorderSpace       : af_3085_SetBorderSpace;  -- ole2.h:3085
            SetActiveObject      : af_3089_SetActiveObject; -- ole2.h:3089
            InsertMenus          : af_3094_InsertMenus;     -- ole2.h:3094
            SetMenu              : af_3099_SetMenu;         -- ole2.h:3099
            RemoveMenus          : af_3105_RemoveMenus;     -- ole2.h:3105
            SetStatusText        : af_3109_SetStatusText;   -- ole2.h:3109
            EnableModeless       : af_3113_EnableModeless;  -- ole2.h:3113
            TranslateAcceleratorA: af_3117_TranslateAcceleratorA;
                                                            -- ole2.h:3117
        end record;

    type IOleInPlaceObjectVtbl is                           -- ole2.h:3305
        record
            QueryInterface      : af_3308_QueryInterface;   -- ole2.h:3308
            AddRef              : af_3313_AddRef;           -- ole2.h:3313
            Release             : af_3316_Release;          -- ole2.h:3316
            GetWindow           : af_3319_GetWindow;        -- ole2.h:3319
            ContextSensitiveHelp: af_3323_ContextSensitiveHelp;
                                                            -- ole2.h:3323
            InPlaceDeactivate   : af_3327_InPlaceDeactivate;-- ole2.h:3327
            UIDeactivate        : af_3330_UIDeactivate;     -- ole2.h:3330
            SetObjectRects      : af_3333_SetObjectRects;   -- ole2.h:3333
            ReactivateAndUndo   : af_3338_ReactivateAndUndo;-- ole2.h:3338
        end record;

    type IOleInPlaceSiteVtbl is                             -- ole2.h:3493
        record
            QueryInterface      : af_3496_QueryInterface;   -- ole2.h:3496
            AddRef              : af_3501_AddRef;           -- ole2.h:3501
            Release             : af_3504_Release;          -- ole2.h:3504
            GetWindow           : af_3507_GetWindow;        -- ole2.h:3507
            ContextSensitiveHelp: af_3511_ContextSensitiveHelp;
                                                            -- ole2.h:3511
            CanInPlaceActivate  : af_3515_CanInPlaceActivate;
                                                            -- ole2.h:3515
            OnInPlaceActivate   : af_3518_OnInPlaceActivate;-- ole2.h:3518
            OnUIActivate        : af_3521_OnUIActivate;     -- ole2.h:3521
            GetWindowContext    : af_3524_GetWindowContext; -- ole2.h:3524
            Scroll              : af_3532_Scroll;           -- ole2.h:3532
            OnUIDeactivate      : af_3536_OnUIDeactivate;   -- ole2.h:3536
            OnInPlaceDeactivate : af_3540_OnInPlaceDeactivate;
                                                            -- ole2.h:3540
            DiscardUndoState    : af_3543_DiscardUndoState; -- ole2.h:3543
            DeactivateAndUndo   : af_3546_DeactivateAndUndo;-- ole2.h:3546
            OnPosRectChange     : af_3549_OnPosRectChange;  -- ole2.h:3549
        end record;

    type IViewObjectVtbl is                                 -- ole2.h:3807
        record
            QueryInterface: af_3810_QueryInterface;         -- ole2.h:3810
            AddRef        : af_3815_AddRef;                 -- ole2.h:3815
            Release       : af_3818_Release;                -- ole2.h:3818
            Draw          : af_3821_Draw;                   -- ole2.h:3821
            GetColorSet   : af_3835_GetColorSet;            -- ole2.h:3835
            Freeze        : af_3844_Freeze;                 -- ole2.h:3844
            Unfreeze      : af_3851_Unfreeze;               -- ole2.h:3851
            SetAdvise     : af_3855_SetAdvise;              -- ole2.h:3855
            GetAdvise     : af_3861_GetAdvise;              -- ole2.h:3861
        end record;

    type IViewObject2Vtbl is                                -- ole2.h:4044
        record
            QueryInterface: af_4047_QueryInterface;         -- ole2.h:4047
            AddRef        : af_4052_AddRef;                 -- ole2.h:4052
            Release       : af_4055_Release;                -- ole2.h:4055
            Draw          : af_4058_Draw;                   -- ole2.h:4058
            GetColorSet   : af_4072_GetColorSet;            -- ole2.h:4072
            Freeze        : af_4081_Freeze;                 -- ole2.h:4081
            Unfreeze      : af_4088_Unfreeze;               -- ole2.h:4088
            SetAdvise     : af_4092_SetAdvise;              -- ole2.h:4092
            GetAdvise     : af_4098_GetAdvise;              -- ole2.h:4098
            GetExtent     : af_4104_GetExtent;              -- ole2.h:4104
        end record;

    type IDropSourceVtbl is                                 -- ole2.h:4214
        record
            QueryInterface   : af_4217_QueryInterface;      -- ole2.h:4217
            AddRef           : af_4222_AddRef;              -- ole2.h:4222
            Release          : af_4225_Release;             -- ole2.h:4225
            QueryContinueDrag: af_4228_QueryContinueDrag;   -- ole2.h:4228
            GiveFeedback     : af_4233_GiveFeedback;        -- ole2.h:4233
        end record;

    type IDropTargetVtbl is                                 -- ole2.h:4389
        record
            QueryInterface: af_4392_QueryInterface;         -- ole2.h:4392
            AddRef        : af_4397_AddRef;                 -- ole2.h:4397
            Release       : af_4400_Release;                -- ole2.h:4400
            DragEnter     : af_4403_DragEnter;              -- ole2.h:4403
            DragOver      : af_4410_DragOver;               -- ole2.h:4410
            DragLeave     : af_4416_DragLeave;              -- ole2.h:4416
            Drop          : af_4419_Drop;                   -- ole2.h:4419
        end record;

    type OLEVERB is                                         -- ole2.h:4541
        record
            lVerb       : Win32.LONG;                       -- ole2.h:4543
            lpszVerbName: Win32.Objbase.LPOLESTR;           -- ole2.h:4544
            fuFlags     : Win32.DWORD;                      -- ole2.h:4545
            grfAttribs  : Win32.DWORD;                      -- ole2.h:4546
        end record;

    type IEnumOLEVERBVtbl is                                -- ole2.h:4584
        record
            QueryInterface: af_4587_QueryInterface;         -- ole2.h:4587
            AddRef        : af_4592_AddRef;                 -- ole2.h:4592
            Release       : af_4595_Release;                -- ole2.h:4595
            Next          : af_4598_Next;                   -- ole2.h:4598
            Skip          : af_4604_Skip;                   -- ole2.h:4604
            Reset         : af_4608_Reset;                  -- ole2.h:4608
            Clone         : af_4611_Clone;                  -- ole2.h:4611
        end record;

    type OLESTREAM is                                       -- ole2.h:4984
        record
            lpstbl: LPOLESTREAMVTBL;                        -- ole2.h:4995
        end record;

    type OLESTREAMVTBL is                                   -- ole2.h:4986
        record
            Get: af_4988_Get;                               -- ole2.h:4988
            Put: af_4989_Put;                               -- ole2.h:4989
        end record;

    type OBJECTDESCRIPTOR is                                -- ole2.h:1901
        record
            cbSize            : Win32.ULONG;                -- ole2.h:1903
            clsid             : Win32.Objbase.CLSID;        -- ole2.h:1904
            dwDrawAspect      : Win32.DWORD;                -- ole2.h:1905
            sizel             : Win32.Windef.SIZEL;         -- ole2.h:1906
            pointl            : Win32.Windef.POINTL;        -- ole2.h:1907
            dwStatus          : Win32.DWORD;                -- ole2.h:1908
            dwFullUserTypeName: Win32.DWORD;                -- ole2.h:1909
            dwSrcOfCopy       : Win32.DWORD;                -- ole2.h:1910
        end record;

    subtype LINKSRCDESCRIPTOR is OBJECTDESCRIPTOR;          -- ole2.h:1920

    IID_IOleAdviseHolder       : Win32.Objbase.IID;         -- ole2.h:219
    IID_IOleCache              : Win32.Objbase.IID;         -- ole2.h:421
    IID_IOleCache2             : Win32.Objbase.IID;         -- ole2.h:654
    IID_IOleCacheControl       : Win32.Objbase.IID;         -- ole2.h:817
    IID_IOleContainer          : Win32.Objbase.IID;         -- ole2.h:931
    IID_IOleClientSite         : Win32.Objbase.IID;         -- ole2.h:1062
    IID_IOleObject             : Win32.Objbase.IID;         -- ole2.h:1312
    IOLETypes_v0_0_c_ifspec    : Win32.Rpcdce.RPC_IF_HANDLE;-- ole2.h:1930
    IOLETypes_v0_0_s_ifspec    : Win32.Rpcdce.RPC_IF_HANDLE;-- ole2.h:1931
    IID_IOleWindow             : Win32.Objbase.IID;         -- ole2.h:1949
    IID_IOleLink               : Win32.Objbase.IID;         -- ole2.h:2085
    IID_IOleItemContainer      : Win32.Objbase.IID;         -- ole2.h:2418
    IID_IOleInPlaceUIWindow    : Win32.Objbase.IID;         -- ole2.h:2614
    IID_IOleInPlaceActiveObject: Win32.Objbase.IID;         -- ole2.h:2793
    IID_IOleInPlaceFrame       : Win32.Objbase.IID;         -- ole2.h:3022
    IID_IOleInPlaceObject      : Win32.Objbase.IID;         -- ole2.h:3284
    IID_IOleInPlaceSite        : Win32.Objbase.IID;         -- ole2.h:3454
    IID_IViewObject            : Win32.Objbase.IID;         -- ole2.h:3756
    IID_IViewObject2           : Win32.Objbase.IID;         -- ole2.h:4027
    IID_IDropSource            : Win32.Objbase.IID;         -- ole2.h:4196
    IID_IDropTarget            : Win32.Objbase.IID;         -- ole2.h:4359
    IID_IEnumOLEVERB           : Win32.Objbase.IID;         -- ole2.h:4560

    function IOleAdviseHolder_Advise_Proxy(
                This         : access IOleAdviseHolder;
                pAdvise      : access Win32.Objbase.IAdviseSink;
                pdwConnection: Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:331

    procedure IOleAdviseHolder_Advise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:337

    function IOleAdviseHolder_Unadvise_Proxy(
                This        : access IOleAdviseHolder;
                dwConnection: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:344

    procedure IOleAdviseHolder_Unadvise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:349

    function IOleAdviseHolder_EnumAdvise_Proxy(
                This        : access IOleAdviseHolder;
                ppenumAdvise: access Win32.Objbase.LPEnumSTATDATA)
               return Win32.Objbase.HRESULT;                -- ole2.h:356

    procedure IOleAdviseHolder_EnumAdvise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:361

    function IOleAdviseHolder_SendOnRename_Proxy(
                This: access IOleAdviseHolder;
                pmk : access Win32.Objbase.IMoniker)
               return Win32.Objbase.HRESULT;                -- ole2.h:368

    procedure IOleAdviseHolder_SendOnRename_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:373

    function IOleAdviseHolder_SendOnSave_Proxy(
                This: access IOleAdviseHolder)
               return Win32.Objbase.HRESULT;                -- ole2.h:380

    procedure IOleAdviseHolder_SendOnSave_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:384

    function IOleAdviseHolder_SendOnClose_Proxy(
                This: access IOleAdviseHolder)
               return Win32.Objbase.HRESULT;                -- ole2.h:391

    procedure IOleAdviseHolder_SendOnClose_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:395

    function IOleCache_Cache_Proxy(
                This         : access IOleCache;
                pformatetc   : access Win32.Objbase.FORMATETC;
                advf         : Win32.DWORD;
                pdwConnection: Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:533

    procedure IOleCache_Cache_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:540

    function IOleCache_Uncache_Proxy(
                This        : access IOleCache;
                dwConnection: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:547

    procedure IOleCache_Uncache_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:552

    function IOleCache_EnumCache_Proxy(
                This          : access IOleCache;
                ppenumSTATDATA: access Win32.Objbase.LPENUMSTATDATA)
               return Win32.Objbase.HRESULT;                -- ole2.h:559

    procedure IOleCache_EnumCache_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:564

    function IOleCache_InitCache_Proxy(
                This       : access IOleCache;
                pDataObject: access Win32.Objbase.IDataObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:571

    procedure IOleCache_InitCache_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:576

    function IOleCache_SetData_Proxy(
                This      : access IOleCache;
                pformatetc: access Win32.Objbase.FORMATETC;
                pmedium   : access Win32.Objbase.STGMEDIUM;
                fRelease  : Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:583

    procedure IOleCache_SetData_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:590

    procedure DISCARDCACHE_to_xmit(pEnum : in PDISCARDCACHE;
				   ppLong: out Win32.PLONG);	-- ole2.h:649

    procedure DISCARDCACHE_from_xmit(pLong: in Win32.PLONG;
				     pEnum: out PDISCARDCACHE);
								-- ole2.h:650

    function IOleCache2_UpdateCache_Proxy(
                This       : access IOleCache2;
                pDataObject: Win32.Objbase.LPDATAOBJECT;
                grfUpdf    : Win32.DWORD;
                pReserved  : Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:772

    procedure IOleCache2_UpdateCache_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:779

    function IOleCache2_DiscardCache_Proxy(
                This            : access IOleCache2;
                dwDiscardOptions: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:786

    procedure IOleCache2_DiscardCache_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:791

    function IOleCacheControl_OnRun_Proxy(
                This       : access IOleCacheControl;
                pDataObject: Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:889

    procedure IOleCacheControl_OnRun_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:894

    function IOleCacheControl_OnStop_Proxy(
                This: access IOleCacheControl)
               return Win32.Objbase.HRESULT;                -- ole2.h:901

    procedure IOleCacheControl_OnStop_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:905

    function IOleContainer_EnumObjects_Proxy(
                This    : access IOleContainer;
                grfFlags: Win32.DWORD;
                ppenum  : access Win32.Objbase.LPENUMUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:1018

    procedure IOleContainer_EnumObjects_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1024

    function IOleContainer_LockContainer_Proxy(
                This : access IOleContainer;
                fLock: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:1031

    procedure IOleContainer_LockContainer_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1036

    function IOleClientSite_SaveObject_Proxy(
                This: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1174

    procedure IOleClientSite_SaveObject_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1178

    function IOleClientSite_GetMoniker_Proxy(
                This          : access IOleClientSite;
                dwAssign      : Win32.DWORD;
                dwWhichMoniker: Win32.DWORD;
                ppmk          : access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:1185

    procedure IOleClientSite_GetMoniker_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1192

    function IOleClientSite_GetContainer_Proxy(
                This       : access IOleClientSite;
                ppContainer: access LPOLECONTAINER)
               return Win32.Objbase.HRESULT;                -- ole2.h:1199

    procedure IOleClientSite_GetContainer_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1204

    function IOleClientSite_ShowObject_Proxy(
                This: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1211

    procedure IOleClientSite_ShowObject_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1215

    function IOleClientSite_OnShowWindow_Proxy(
                This : access IOleClientSite;
                fShow: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:1222

    procedure IOleClientSite_OnShowWindow_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1227

    function IOleClientSite_RequestNewObjectLayout_Proxy(
                This: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1234

    procedure IOleClientSite_RequestNewObjectLayout_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1238

    function IOleObject_SetClientSite_Proxy(
                This       : access IOleObject;
                pClientSite: access IOleClientSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:1606

    procedure IOleObject_SetClientSite_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1611

    function IOleObject_GetClientSite_Proxy(
                This        : access IOleObject;
                ppClientSite: access LPOLECLIENTSITE)
               return Win32.Objbase.HRESULT;                -- ole2.h:1618

    procedure IOleObject_GetClientSite_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1623

    function IOleObject_SetHostNames_Proxy(
                This          : access IOleObject;
                szContainerApp: Win32.Objbase.LPCOLESTR;
                szContainerObj: Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:1630

    procedure IOleObject_SetHostNames_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1636

    function IOleObject_Close_Proxy(
                This        : access IOleObject;
                dwSaveOption: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1643

    procedure IOleObject_Close_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1648

    function IOleObject_SetMoniker_Proxy(
                This          : access IOleObject;
                dwWhichMoniker: Win32.DWORD;
                pmk           : access Win32.Objbase.IMoniker)
               return Win32.Objbase.HRESULT;                -- ole2.h:1655

    procedure IOleObject_SetMoniker_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1661

    function IOleObject_GetMoniker_Proxy(
                This          : access IOleObject;
                dwAssign      : Win32.DWORD;
                dwWhichMoniker: Win32.DWORD;
                ppmk          : access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:1668

    procedure IOleObject_GetMoniker_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1675

    function IOleObject_InitFromData_Proxy(
                This       : access IOleObject;
                pDataObject: access Win32.Objbase.IDataObject;
                fCreation  : Win32.BOOL;
                dwReserved : Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1682

    procedure IOleObject_InitFromData_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1689

    function IOleObject_GetClipboardData_Proxy(
                This        : access IOleObject;
                dwReserved  : Win32.DWORD;
                ppDataObject: access Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:1696

    procedure IOleObject_GetClipboardData_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1702

    function IOleObject_DoVerb_Proxy(
                This       : access IOleObject;
                iVerb      : Win32.LONG;
                lpmsg      : Win32.Winuser.LPMSG;
                pActiveSite: access IOleClientSite;
                lindex     : Win32.LONG;
                hwndParent : Win32.Windef.HWND;
                lprcPosRect: Win32.Objbase.LPCRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:1709

    procedure IOleObject_DoVerb_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1719

    function IOleObject_EnumVerbs_Proxy(
                This         : access IOleObject;
                ppEnumOleVerb: access LPENUMOLEVERB)
               return Win32.Objbase.HRESULT;                -- ole2.h:1726

    procedure IOleObject_EnumVerbs_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1731

    function IOleObject_Update_Proxy(
                This: access IOleObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:1738

    procedure IOleObject_Update_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1742

    function IOleObject_IsUpToDate_Proxy(
                This: access IOleObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:1749

    procedure IOleObject_IsUpToDate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1753

    function IOleObject_GetUserClassID_Proxy(
                This  : access IOleObject;
                pClsid: access Win32.Objbase.CLSID)
               return Win32.Objbase.HRESULT;                -- ole2.h:1760

    procedure IOleObject_GetUserClassID_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1765

    function IOleObject_GetUserType_Proxy(
                This        : access IOleObject;
                dwFormOfType: Win32.DWORD;
                pszUserType : access Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:1772

    procedure IOleObject_GetUserType_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1778

    function IOleObject_SetExtent_Proxy(
                This        : access IOleObject;
                dwDrawAspect: Win32.DWORD;
                psizel      : access Win32.Windef.SIZE)
               return Win32.Objbase.HRESULT;                -- ole2.h:1785

    procedure IOleObject_SetExtent_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1791

    function IOleObject_GetExtent_Proxy(
                This        : access IOleObject;
                dwDrawAspect: Win32.DWORD;
                psizel      : access Win32.Windef.SIZE)
               return Win32.Objbase.HRESULT;                -- ole2.h:1798

    procedure IOleObject_GetExtent_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1804

    function IOleObject_Advise_Proxy(
                This         : access IOleObject;
                pAdvSink     : access Win32.Objbase.IAdviseSink;
                pdwConnection: Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1811

    procedure IOleObject_Advise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1817

    function IOleObject_Unadvise_Proxy(
                This        : access IOleObject;
                dwConnection: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1824

    procedure IOleObject_Unadvise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1829

    function IOleObject_EnumAdvise_Proxy(
                This        : access IOleObject;
                ppenumAdvise: access Win32.Objbase.LPEnumSTATDATA)
               return Win32.Objbase.HRESULT;                -- ole2.h:1836

    procedure IOleObject_EnumAdvise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1841

    function IOleObject_GetMiscStatus_Proxy(
                This     : access IOleObject;
                dwAspect : Win32.DWORD;
                pdwStatus: Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:1848

    procedure IOleObject_GetMiscStatus_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1854

    function IOleObject_SetColorScheme_Proxy(
                This   : access IOleObject;
                pLogpal: access Win32.Wingdi.LOGPALETTE)
               return Win32.Objbase.HRESULT;                -- ole2.h:1861

    procedure IOleObject_SetColorScheme_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:1866

    function IOleWindow_GetWindow_Proxy(
                This : access IOleWindow;
                phwnd: access Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:2023

    procedure IOleWindow_GetWindow_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2028

    function IOleWindow_ContextSensitiveHelp_Proxy(
                This      : access IOleWindow;
                fEnterMode: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2035

    procedure IOleWindow_ContextSensitiveHelp_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2040

    function IOleLink_SetUpdateOptions_Proxy(
                This       : access IOleLink;
                dwUpdateOpt: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:2249

    procedure IOleLink_SetUpdateOptions_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2254

    function IOleLink_GetUpdateOptions_Proxy(
                This        : access IOleLink;
                pdwUpdateOpt: Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:2261

    procedure IOleLink_GetUpdateOptions_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2266

    function IOleLink_SetSourceMoniker_Proxy(
                This  : access IOleLink;
                pmk   : access Win32.Objbase.IMoniker;
                rclsid: Win32.Objbase.REFCLSID)
               return Win32.Objbase.HRESULT;                -- ole2.h:2273

    procedure IOleLink_SetSourceMoniker_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2279

    function IOleLink_GetSourceMoniker_Proxy(
                This: access IOleLink;
                ppmk: access Win32.Objbase.LPMONIKER)
               return Win32.Objbase.HRESULT;                -- ole2.h:2286

    procedure IOleLink_GetSourceMoniker_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2291

    function IOleLink_SetSourceDisplayName_Proxy(
                This         : access IOleLink;
                pszStatusText: Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2298

    procedure IOleLink_SetSourceDisplayName_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2303

    function IOleLink_GetSourceDisplayName_Proxy(
                This           : access IOleLink;
                ppszDisplayName: access Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2310

    procedure IOleLink_GetSourceDisplayName_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2315

    function IOleLink_BindToSource_Proxy(
                This     : access IOleLink;
                bindflags: Win32.DWORD;
                pbc      : access Win32.Objbase.IBindCtx)
               return Win32.Objbase.HRESULT;                -- ole2.h:2322

    procedure IOleLink_BindToSource_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2328

    function IOleLink_BindIfRunning_Proxy(
                This: access IOleLink)
               return Win32.Objbase.HRESULT;                -- ole2.h:2335

    procedure IOleLink_BindIfRunning_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2339

    function IOleLink_GetBoundSource_Proxy(
                This : access IOleLink;
                ppunk: access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:2346

    procedure IOleLink_GetBoundSource_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2351

    function IOleLink_UnbindSource_Proxy(
                This: access IOleLink)
               return Win32.Objbase.HRESULT;                -- ole2.h:2358

    procedure IOleLink_UnbindSource_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2362

    function IOleLink_Update_Proxy(
                This: access IOleLink;
                pbc : access Win32.Objbase.IBindCtx)
               return Win32.Objbase.HRESULT;                -- ole2.h:2369

    procedure IOleLink_Update_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2374

    function IOleItemContainer_RemoteGetObject_Proxy(
                This         : access IOleItemContainer;
                pszItem      : Win32.Objbase.LPOLESTR;
                dwSpeedNeeded: Win32.DWORD;
                pbc          : access Win32.Objbase.IBindCtx;
                riid         : Win32.Objbase.REFIID;
                ppvObject    : access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:2543

    procedure IOleItemContainer_RemoteGetObject_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2552

    function IOleItemContainer_RemoteGetObjectStorage_Proxy(
                This      : access IOleItemContainer;
                pszItem   : Win32.Objbase.LPOLESTR;
                pbc       : access Win32.Objbase.IBindCtx;
                riid      : Win32.Objbase.REFIID;
                ppvStorage: access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:2559

    procedure IOleItemContainer_RemoteGetObjectStorage_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2567

    function IOleItemContainer_IsRunning_Proxy(
                This   : access IOleItemContainer;
                pszItem: Win32.Objbase.LPOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2574

    procedure IOleItemContainer_IsRunning_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2579

    function IOleInPlaceUIWindow_GetBorder_Proxy(
                This        : access IOleInPlaceUIWindow;
                lprectBorder: Win32.Windef.LPRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:2725

    procedure IOleInPlaceUIWindow_GetBorder_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2730

    function IOleInPlaceUIWindow_RequestBorderSpace_Proxy(
                This         : access IOleInPlaceUIWindow;
                pborderwidths: LPCBORDERWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:2737

    procedure IOleInPlaceUIWindow_RequestBorderSpace_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2742

    function IOleInPlaceUIWindow_SetBorderSpace_Proxy(
                This         : access IOleInPlaceUIWindow;
                pborderwidths: LPCBORDERWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:2749

    procedure IOleInPlaceUIWindow_SetBorderSpace_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2754

    function IOleInPlaceUIWindow_SetActiveObject_Proxy(
                This         : access IOleInPlaceUIWindow;
                pActiveObject: access IOleInPlaceActiveObject;
                pszObjName   : Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:2761

    procedure IOleInPlaceUIWindow_SetActiveObject_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2767

    function IOleInPlaceActiveObject_RemoteTranslateAccelerator_Proxy(
                This: access IOleInPlaceActiveObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:2916

    procedure IOleInPlaceActiveObject_RemoteTranslateAccelerator_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2920

    function IOleInPlaceActiveObject_OnFrameWindowActivate_Proxy(
                This     : access IOleInPlaceActiveObject;
                fActivate: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2927

    procedure IOleInPlaceActiveObject_OnFrameWindowActivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2932

    function IOleInPlaceActiveObject_OnDocWindowActivate_Proxy(
                This     : access IOleInPlaceActiveObject;
                fActivate: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2939

    procedure IOleInPlaceActiveObject_OnDocWindowActivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2944

    function IOleInPlaceActiveObject_RemoteResizeBorder_Proxy(
                This        : access IOleInPlaceActiveObject;
                prcBorder   : Win32.Objbase.LPCRECT;
                riid        : Win32.Objbase.REFIID;
                pUIWindow   : access IOleInPlaceUIWindow;
                fFrameWindow: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2951

    procedure IOleInPlaceActiveObject_RemoteResizeBorder_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2959

    function IOleInPlaceActiveObject_EnableModeless_Proxy(
                This   : access IOleInPlaceActiveObject;
                fEnable: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:2966

    procedure IOleInPlaceActiveObject_EnableModeless_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:2971

    function IOleInPlaceFrame_InsertMenus_Proxy(
                This        : access IOleInPlaceFrame;
                hmenuShared : Win32.Windef.HMENU;
                lpMenuWidths: LPOLEMENUGROUPWIDTHS)
               return Win32.Objbase.HRESULT;                -- ole2.h:3189

    procedure IOleInPlaceFrame_InsertMenus_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3195

    function IOleInPlaceFrame_SetMenu_Proxy(
                This            : access IOleInPlaceFrame;
                hmenuShared     : Win32.Windef.HMENU;
                holemenu        : Win32.Ole2.HOLEMENU;
                hwndActiveObject: Win32.Windef.HWND)
               return Win32.Objbase.HRESULT;                -- ole2.h:3202

    procedure IOleInPlaceFrame_SetMenu_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3209

    function IOleInPlaceFrame_RemoveMenus_Proxy(
                This       : access IOleInPlaceFrame;
                hmenuShared: Win32.Windef.HMENU)
               return Win32.Objbase.HRESULT;                -- ole2.h:3216

    procedure IOleInPlaceFrame_RemoveMenus_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3221

    function IOleInPlaceFrame_SetStatusText_Proxy(
                This         : access IOleInPlaceFrame;
                pszStatusText: Win32.Objbase.LPCOLESTR)
               return Win32.Objbase.HRESULT;                -- ole2.h:3228

    procedure IOleInPlaceFrame_SetStatusText_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3233

    function IOleInPlaceFrame_EnableModeless_Proxy(
                This   : access IOleInPlaceFrame;
                fEnable: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:3240

    procedure IOleInPlaceFrame_EnableModeless_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3245

    function IOleInPlaceFrame_TranslateAccelerator_Proxy(
                This : access IOleInPlaceFrame;
                lpmsg: Win32.Winuser.LPMSG;
                wID  : Win32.WORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3252

    procedure IOleInPlaceFrame_TranslateAccelerator_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3258

    function IOleInPlaceObject_InPlaceDeactivate_Proxy(
                This: access IOleInPlaceObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:3389

    procedure IOleInPlaceObject_InPlaceDeactivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3393

    function IOleInPlaceObject_UIDeactivate_Proxy(
                This: access IOleInPlaceObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:3400

    procedure IOleInPlaceObject_UIDeactivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3404

    function IOleInPlaceObject_SetObjectRects_Proxy(
                This        : access IOleInPlaceObject;
                lprcPosRect : Win32.Objbase.LPCRECT;
                lprcClipRect: Win32.Objbase.LPCRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:3411

    procedure IOleInPlaceObject_SetObjectRects_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3417

    function IOleInPlaceObject_ReactivateAndUndo_Proxy(
                This: access IOleInPlaceObject)
               return Win32.Objbase.HRESULT;                -- ole2.h:3424

    procedure IOleInPlaceObject_ReactivateAndUndo_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3428

    function IOleInPlaceSite_CanInPlaceActivate_Proxy(
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3619

    procedure IOleInPlaceSite_CanInPlaceActivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3623

    function IOleInPlaceSite_OnInPlaceActivate_Proxy(
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3630

    procedure IOleInPlaceSite_OnInPlaceActivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3634

    function IOleInPlaceSite_OnUIActivate_Proxy(
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3641

    procedure IOleInPlaceSite_OnUIActivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3645

    function IOleInPlaceSite_GetWindowContext_Proxy(
                This        : access IOleInPlaceSite;
                ppFrame     : access LPOLEINPLACEFRAME;
                ppDoc       : access LPOLEINPLACEUIWINDOW;
                lprcPosRect : Win32.Windef.LPRECT;
                lprcClipRect: Win32.Windef.LPRECT;
                lpFrameInfo : LPOLEINPLACEFRAMEINFO)
               return Win32.Objbase.HRESULT;                -- ole2.h:3652

    procedure IOleInPlaceSite_GetWindowContext_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3661

    function IOleInPlaceSite_Scroll_Proxy(
                This        : access IOleInPlaceSite;
                scrollExtant: Win32.Windef.SIZE)
               return Win32.Objbase.HRESULT;                -- ole2.h:3668

    procedure IOleInPlaceSite_Scroll_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3673

    function IOleInPlaceSite_OnUIDeactivate_Proxy(
                This     : access IOleInPlaceSite;
                fUndoable: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:3680

    procedure IOleInPlaceSite_OnUIDeactivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3685

    function IOleInPlaceSite_OnInPlaceDeactivate_Proxy(
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3692

    procedure IOleInPlaceSite_OnInPlaceDeactivate_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3696

    function IOleInPlaceSite_DiscardUndoState_Proxy(
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3703

    procedure IOleInPlaceSite_DiscardUndoState_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3707

    function IOleInPlaceSite_DeactivateAndUndo_Proxy(
                This: access IOleInPlaceSite)
               return Win32.Objbase.HRESULT;                -- ole2.h:3714

    procedure IOleInPlaceSite_DeactivateAndUndo_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3718

    function IOleInPlaceSite_OnPosRectChange_Proxy(
                This       : access IOleInPlaceSite;
                lprcPosRect: Win32.Objbase.LPCRECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:3725

    procedure IOleInPlaceSite_OnPosRectChange_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3730

    function IViewObject_Draw_Proxy(
                This        : access IViewObject;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                hdcTargetDev: Win32.Windef.HDC;
                hdcDraw     : Win32.Windef.HDC;
                lprcBounds  : Win32.Objbase.LPCRECTL;
                lprcWBounds : Win32.Objbase.LPCRECTL;
                pfnContinue : af_3924_pfnContinue;
                dwContinue  : Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3914

    procedure IViewObject_Draw_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3929

    function IViewObject_GetColorSet_Proxy(
                This        : access IViewObject;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                hicTargetDev: Win32.Windef.HDC;
                ppColorSet  : access Win32.Wingdi.LOGPALETTE)
               return Win32.Objbase.HRESULT;                -- ole2.h:3936

    procedure IViewObject_GetColorSet_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3946

    function IViewObject_Freeze_Proxy(
                This        : access IViewObject;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                pvAspect    : Win32.PVOID;
                pdwFreeze   : Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3953

    procedure IViewObject_Freeze_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3961

    function IViewObject_Unfreeze_Proxy(
                This    : access IViewObject;
                dwFreeze: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:3968

    procedure IViewObject_Unfreeze_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3973

    function IViewObject_SetAdvise_Proxy(
                This    : access IViewObject;
                aspects : Win32.DWORD;
                advf    : Win32.DWORD;
                pAdvSink: access Win32.Objbase.IAdviseSink)
               return Win32.Objbase.HRESULT;                -- ole2.h:3980

    procedure IViewObject_SetAdvise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:3987

    function IViewObject_GetAdvise_Proxy(
                This     : access IViewObject;
                pAspects : Win32.PDWORD;
                pAdvf    : Win32.PDWORD;
                ppAdvSink: access Win32.Objbase.LPADVISESINK)
               return Win32.Objbase.HRESULT;                -- ole2.h:3994

    procedure IViewObject_GetAdvise_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4001

    function IViewObject2_GetExtent_Proxy(
                This        : access IViewObject2;
                dwDrawAspect: Win32.DWORD;
                lindex      : Win32.LONG;
                ptd         : access Win32.Objbase.DVTARGETDEVICE;
                lpsizel     : Win32.Windef.LPSIZEL)
               return Win32.Objbase.HRESULT;                -- ole2.h:4162

    procedure IViewObject2_GetExtent_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4170

    function IDropSource_QueryContinueDrag_Proxy(
                This          : access IDropSource;
                fEscapePressed: Win32.BOOL;
                grfKeyState   : Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4272

    procedure IDropSource_QueryContinueDrag_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4278

    function IDropSource_GiveFeedback_Proxy(
                This    : access IDropSource;
                dwEffect: Win32.DWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4285

    procedure IDropSource_GiveFeedback_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4290

    function IDropTarget_DragEnter_Proxy(
                This       : access IDropTarget;
                pDataObj   : access Win32.Objbase.IDataObject;
                grfKeyState: Win32.DWORD;
                pt         : Win32.Windef.POINTL;
                pdwEffect  : Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4467

    procedure IDropTarget_DragEnter_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4475

    function IDropTarget_DragOver_Proxy(
                This       : access IDropTarget;
                grfKeyState: Win32.DWORD;
                pt         : Win32.Windef.POINTL;
                pdwEffect  : Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4482

    procedure IDropTarget_DragOver_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4489

    function IDropTarget_DragLeave_Proxy(
                This: access IDropTarget)
               return Win32.Objbase.HRESULT;                -- ole2.h:4496

    procedure IDropTarget_DragLeave_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4500

    function IDropTarget_Drop_Proxy(
                This       : access IDropTarget;
                pDataObj   : access Win32.Objbase.IDataObject;
                grfKeyState: Win32.DWORD;
                pt         : Win32.Windef.POINTL;
                pdwEffect  : Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4507

    procedure IDropTarget_Drop_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4515

    function IEnumOLEVERB_RemoteNext_Proxy(
                This        : access IEnumOLEVERB;
                celt        : Win32.ULONG;
                rgelt       : LPOLEVERB;
                pceltFetched: Win32.PDWORD)
               return Win32.Objbase.HRESULT;                -- ole2.h:4656

    procedure IEnumOLEVERB_RemoteNext_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4663

    function IEnumOLEVERB_Skip_Proxy(
                This: access IEnumOLEVERB;
                celt: Win32.ULONG)
               return Win32.Objbase.HRESULT;                -- ole2.h:4670

    procedure IEnumOLEVERB_Skip_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4675

    function IEnumOLEVERB_Reset_Proxy(
                This: access IEnumOLEVERB)
               return Win32.Objbase.HRESULT;                -- ole2.h:4682

    procedure IEnumOLEVERB_Reset_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4686

    function IEnumOLEVERB_Clone_Proxy(
                This  : access IEnumOLEVERB;
                ppenum: access LPENUMOLEVERB)
               return Win32.Objbase.HRESULT;                -- ole2.h:4693

    procedure IEnumOLEVERB_Clone_Stub( 
                This             : access Win32.Objbase.IRpcStubBuffer;
                pRpcChannelBuffer: access Win32.Objbase.IRpcChannelBuffer;
                pRpcMessage      : Win32.Rpcdcep.PRPC_MESSAGE;
                pdwStubPhase     : Win32.PDWORD);           -- ole2.h:4698

    procedure UINT_to_xmit(
                p1: access Win32.UINT;
                p2: access Win32.LPLONG);                   -- ole2.h:4712

    procedure UINT_from_xmit(
                p1: access Win32.LONG;
                p2: access Win32.UINT);                     -- ole2.h:4713

    procedure UINT_free_inst(
                p1: access Win32.UINT);                     -- ole2.h:4714

    procedure UINT_free_xmit(
                p1: access Win32.LONG);                     -- ole2.h:4715

    procedure WPARAM_to_xmit(
                p1: access Win32.WPARAM;
                p2: access Win32.LPLONG);                   -- ole2.h:4716

    procedure WPARAM_from_xmit(
                p1: access Win32.LONG;
                p2: access Win32.WPARAM);                   -- ole2.h:4717

    procedure WPARAM_free_inst(
                p1: access Win32.WPARAM);                   -- ole2.h:4718

    procedure WPARAM_free_xmit(
                p1: access Win32.LONG);                     -- ole2.h:4719

    procedure HWND_to_xmit(
                p1: access Win32.Windef.HWND;
                p2: access Win32.LPLONG);                   -- ole2.h:4720

    procedure HWND_from_xmit(
                p1: access Win32.LONG;
                p2: access Win32.Windef.HWND);              -- ole2.h:4721
 
    procedure HWND_free_inst( 
                p1: access Win32.Windef.HWND);              -- ole2.h:4722
 
    procedure HWND_free_xmit( 
                p1: access Win32.LONG);                     -- ole2.h:4723

    procedure HMENU_to_xmit(
                p1: access Win32.Windef.HMENU;
                p2: access Win32.LPLONG);                   -- ole2.h:4724

    procedure HMENU_from_xmit(
                p1: access Win32.LONG;
                p2: access Win32.Windef.HMENU);             -- ole2.h:4725
 
    procedure HMENU_free_inst( 
                p1: access Win32.Windef.HMENU);             -- ole2.h:4726
 
    procedure HMENU_free_xmit( 
                p1: access Win32.LONG);                     -- ole2.h:4727

    procedure HACCEL_to_xmit(
                p1: access Win32.Windef.HACCEL;
                p2: access Win32.LPLONG);                   -- ole2.h:4728

    procedure HACCEL_from_xmit(
                p1: access Win32.LONG;
                p2: access Win32.Windef.HACCEL);            -- ole2.h:4729
 
    procedure HACCEL_free_inst( 
                p1: access Win32.Windef.HACCEL);            -- ole2.h:4730
 
    procedure HACCEL_free_xmit( 
                p1: access Win32.LONG);                     -- ole2.h:4731
 
    procedure HOLEMENU_to_xmit( 
                p1: access HOLEMENU; 
                p2: access Win32.Objbase.a_RemHGLOBAL_t);   -- ole2.h:4732
 
    procedure HOLEMENU_from_xmit( 
                p1: access Win32.Objbase.RemHGLOBAL; 
                p2: access HOLEMENU);                       -- ole2.h:4733
 
    procedure HOLEMENU_free_inst( 
                p1: access HOLEMENU);                       -- ole2.h:4734
 
    procedure HOLEMENU_free_xmit( 
                p1: access Win32.Objbase.RemHGLOBAL);       -- ole2.h:4735

    function IOleItemContainer_GetObject_Proxy(
                This         : access IOleItemContainer;
                pszItem      : Win32.Objbase.LPOLESTR;
                dwSpeedNeeded: Win32.DWORD;
                pbc          : access Win32.Objbase.IBindCtx;
                riid         : Win32.Objbase.REFIID;
                ppvObject    : access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4736

    function IOleItemContainer_GetObject_Stub(
                This         : access Win32.Objbase.IRpcStubBuffer;
                pszItem      : Win32.Objbase.LPOLESTR;
                dwSpeedNeeded: Win32.DWORD;
                pbc          : access Win32.Objbase.IBindCtx;
                riid         : Win32.Objbase.REFIID;
                ppvObject    : access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:4745

    function IOleItemContainer_GetObjectStorage_Proxy(
                This      : access IOleItemContainer;
                pszItem   : Win32.Objbase.LPOLESTR;
                pbc       : access Win32.Objbase.IBindCtx;
                riid      : Win32.Objbase.REFIID;
                ppvStorage: access Win32.PVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4753

    function IOleItemContainer_GetObjectStorage_Stub(
                This      : access Win32.Objbase.IRpcStubBuffer;
                pszItem   : Win32.Objbase.LPOLESTR;
                pbc       : access Win32.Objbase.IBindCtx;
                riid      : Win32.Objbase.REFIID;
                ppvStorage: access Win32.Objbase.LPUNKNOWN)
               return Win32.Objbase.HRESULT;                -- ole2.h:4761

    function IOleInPlaceActiveObject_TranslateAccelerator_Proxy(
                This : access IOleInPlaceActiveObject;
                lpmsg: Win32.Winuser.LPMSG)
               return Win32.Objbase.HRESULT;                -- ole2.h:4768

    function IOleInPlaceActiveObject_TranslateAccelerator_Stub(
                This: access Win32.Objbase.IRpcStubBuffer)
               return Win32.Objbase.HRESULT;                -- ole2.h:4773

    function IOleInPlaceActiveObject_ResizeBorder_Proxy(
                This        : access IOleInPlaceActiveObject;
                prcBorder   : Win32.Objbase.LPCRECT;
                pUIWindow   : access IOleInPlaceUIWindow;
                fFrameWindow: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:4776
 
    function IOleInPlaceActiveObject_ResizeBorder_Stub( 
                This        : access Win32.Objbase.IRpcStubBuffer; 
                prcBorder   : Win32.Objbase.LPCRECT; 
                riid        : Win32.Objbase.REFIID; 
                pUIWindow   : access IOleInPlaceUIWindow; 
                fFrameWindow: Win32.BOOL) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4783
 
    function IEnumOLEVERB_Next_Proxy( 
                This        : access IEnumOLEVERB; 
                celt        : Win32.ULONG; 
                rgelt       : LPOLEVERB; 
                pceltFetched: Win32.PDWORD) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4790
 
    function IEnumOLEVERB_Next_Stub( 
                This        : access Win32.Objbase.IRpcStubBuffer; 
                celt        : Win32.ULONG; 
                rgelt       : LPOLEVERB; 
                pceltFetched: Win32.PDWORD) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4797

    function OleBuildVersion return Win32.DWORD;            -- ole2.h:4829

    function ReadClassStg(
                pStg  : Win32.Objbase.LPSTORAGE;
                pclsid: access Win32.Objbase.CLSID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4832
 
    function WriteClassStg( 
                pStg  : Win32.Objbase.LPSTORAGE; 
                rclsid: Win32.Objbase.REFCLSID)       
               return Win32.Objbase.HRESULT;                -- ole2.h:4833
 
    function ReadClassStm( 
                pStm  : Win32.Objbase.LPSTREAM; 
                pclsid: access Win32.Objbase.CLSID) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4834
 
    function WriteClassStm( 
                pStm  : Win32.Objbase.LPSTREAM; 
                rclsid: Win32.Objbase.REFCLSID)       
               return Win32.Objbase.HRESULT;                -- ole2.h:4835
 
    function WriteFmtUserTypeStg( 
                pstg        : Win32.Objbase.LPSTORAGE; 
                cf          : Win32.Objbase.CLIPFORMAT; 
                lpszUserType: Win32.Objbase.LPOLESTR) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4836
 
    function ReadFmtUserTypeStg( 
                pstg          : Win32.Objbase.LPSTORAGE; 
                pcf           : access Win32.Objbase.CLIPFORMAT; 
                lplpszUserType: access Win32.Objbase.LPOLESTR) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4837
 
    function OleInitialize( 
                pvReserved: Win32.LPVOID) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4842

    procedure OleUninitialize;                              -- ole2.h:4843

    function OleQueryLinkFromData(
                pSrcDataObject: Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:4849

    function OleQueryCreateFromData(
                pSrcDataObject: Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:4850

    function OleCreate(
                rclsid     : Win32.Objbase.REFCLSID;
                riid       : Win32.Objbase.REFIID;
                renderopt  : Win32.DWORD;
                pFormatEtc : Win32.Objbase.LPFORMATETC;
                pClientSite: LPOLECLIENTSITE;
                pStg       : Win32.Objbase.LPSTORAGE;
                ppvObj     : access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4855

    function OleCreateFromData(
                pSrcDataObj: Win32.Objbase.LPDATAOBJECT;
                riid       : Win32.Objbase.REFIID;
                renderopt  : Win32.DWORD;
                pFormatEtc : Win32.Objbase.LPFORMATETC;
                pClientSite: LPOLECLIENTSITE;
                pStg       : Win32.Objbase.LPSTORAGE;
                ppvObj     : access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4859

    function OleCreateLinkFromData(
                pSrcDataObj: Win32.Objbase.LPDATAOBJECT;
                riid       : Win32.Objbase.REFIID;
                renderopt  : Win32.DWORD;
                pFormatEtc : Win32.Objbase.LPFORMATETC;
                pClientSite: LPOLECLIENTSITE;
                pStg       : Win32.Objbase.LPSTORAGE;
                ppvObj     : access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4864

    function OleCreateStaticFromData(
                pSrcDataObj: Win32.Objbase.LPDATAOBJECT;
                iid        : access Win32.Objbase.IID;
                renderopt  : Win32.DWORD;
                pFormatEtc : Win32.Objbase.LPFORMATETC;
                pClientSite: LPOLECLIENTSITE;
                pStg       : Win32.Objbase.LPSTORAGE;
                ppvObj     : access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4869

    function OleCreateLink(
                pmkLinkSrc : Win32.Objbase.LPMONIKER;
                riid       : Win32.Objbase.REFIID;
                renderopt  : Win32.DWORD;
                lpFormatEtc: Win32.Objbase.LPFORMATETC;
                pClientSite: LPOLECLIENTSITE;
                pStg       : Win32.Objbase.LPSTORAGE;
                ppvObj     : access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4875
 
    function OleCreateLinkToFile( 
                lpszFileName: Win32.Objbase.LPCOLESTR; 
                riid        : Win32.Objbase.REFIID; 
                renderopt   : Win32.DWORD; 
                lpFormatEtc : Win32.Objbase.LPFORMATETC; 
                pClientSite : LPOLECLIENTSITE; 
                pStg        : Win32.Objbase.LPSTORAGE; 
                ppvObj      : access Win32.LPVOID)      
               return Win32.Objbase.HRESULT;                -- ole2.h:4879
 
    function OleCreateFromFile( 
                rclsid      : Win32.Objbase.REFCLSID; 
                lpszFileName: Win32.Objbase.LPCOLESTR; 
                riid        : Win32.Objbase.REFIID; 
                renderopt   : Win32.DWORD; 
                lpFormatEtc : Win32.Objbase.LPFORMATETC; 
                pClientSite : LPOLECLIENTSITE; 
                pStg        : Win32.Objbase.LPSTORAGE; 
                ppvObj      : access Win32.LPVOID)      
               return Win32.Objbase.HRESULT;                -- ole2.h:4883
 
    function OleLoad( 
                pStg       : Win32.Objbase.LPSTORAGE; 
                riid       : Win32.Objbase.REFIID; 
                pClientSite: LPOLECLIENTSITE; 
                ppvObj     : access Win32.LPVOID) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4887
 
    function OleSave( 
                pPS        : Win32.Objbase.LPPERSISTSTORAGE; 
                pStg       : Win32.Objbase.LPSTORAGE; 
                fSameAsLoad: Win32.BOOL) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4890
 
    function OleLoadFromStream( 
                pStm        : Win32.Objbase.LPSTREAM; 
                iidInterface: access Win32.Objbase.IID; 
                ppvObj      : access Win32.LPVOID)      
               return Win32.Objbase.HRESULT;                -- ole2.h:4892
 
    function OleSaveToStream( 
                pPStm: Win32.Objbase.LPPERSISTSTREAM; 
                pStm : Win32.Objbase.LPSTREAM) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4893
 
    function OleSetContainedObject( 
                pUnknown  : Win32.Objbase.LPUNKNOWN; 
                fContained: Win32.BOOL) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4896
 
    function OleNoteObjectVisible( 
                pUnknown: Win32.Objbase.LPUNKNOWN; 
                fVisible: Win32.BOOL) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4897
 
    function RegisterDragDrop( 
                hwnd       : Win32.Windef.HWND; 
                pDropTarget: LPDROPTARGET) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4902
 
    function RevokeDragDrop( 
                hwnd: Win32.Windef.HWND) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4903
 
    function DoDragDrop( 
                pDataObj   : Win32.Objbase.LPDATAOBJECT; 
                pDropSource: LPDROPSOURCE; 
                dwOKEffects: Win32.DWORD; 
                pdwEffect  : Win32.LPDWORD) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4904

    function OleSetClipboard(
                pDataObj: Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:4909

    function OleGetClipboard(
                ppDataObj: access Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:4910

    function OleFlushClipboard return Win32.Objbase.HRESULT;-- ole2.h:4911

    function OleIsCurrentClipboard(
                pDataObj: Win32.Objbase.LPDATAOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:4912

    function OleCreateMenuDescriptor(
                hmenuCombined: Win32.Windef.HMENU;
                lpMenuWidths : LPOLEMENUGROUPWIDTHS)
               return HOLEMENU;                             -- ole2.h:4917

    function OleSetMenuDescriptor(
                holemenu        : Win32.Ole2.HOLEMENU;
                hwndFrame       : Win32.Windef.HWND;
                hwndActiveObject: Win32.Windef.HWND;
                lpFrame         : LPOLEINPLACEFRAME;
                lpActiveObj     : LPOLEINPLACEACTIVEOBJECT)
               return Win32.Objbase.HRESULT;                -- ole2.h:4919

    function OleDestroyMenuDescriptor(
                holemenu: Win32.Ole2.HOLEMENU)
               return Win32.Objbase.HRESULT;                -- ole2.h:4923
 
    function OleTranslateAccelerator( 
                lpFrame    : LPOLEINPLACEFRAME; 
                lpFrameInfo: LPOLEINPLACEFRAMEINFO; 
                lpmsg      : Win32.Winuser.LPMSG) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4925
 
    function OleDuplicateData( 
                hSrc    : Win32.Winnt.HANDLE; 
                cfFormat: Win32.Objbase.CLIPFORMAT; 
                uiFlags : Win32.UINT) 
               return Win32.Winnt.HANDLE;                   -- ole2.h:4930
 
    function OleDraw( 
                pUnknown  : Win32.Objbase.LPUNKNOWN; 
                dwAspect  : Win32.DWORD; 
                hdcDraw   : Win32.Windef.HDC; 
                lprcBounds: Win32.Objbase.LPCRECT) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4933
 
    function OleRun( 
                pUnknown: Win32.Objbase.LPUNKNOWN) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4936

    function OleIsRunning(
                pObject: LPOLEOBJECT)
               return Win32.BOOL;                           -- ole2.h:4937

    function OleLockRunning(
                pUnknown         : Win32.Objbase.LPUNKNOWN;
                fLock            : Win32.BOOL;
                fLastUnlockCloses: Win32.BOOL)
               return Win32.Objbase.HRESULT;                -- ole2.h:4938

    procedure ReleaseStgMedium(
                pMedium: Win32.Objbase.LPSTGMEDIUM);        -- ole2.h:4939

    function CreateOleAdviseHolder(
                ppOAHolder: access LPOLEADVISEHOLDER)
               return Win32.Objbase.HRESULT;                -- ole2.h:4940

    function OleCreateDefaultHandler(
                clsid    : Win32.Objbase.REFCLSID;
                pUnkOuter: Win32.Objbase.LPUNKNOWN;
                riid     : Win32.Objbase.REFIID;
                lplpObj  : access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4942

    function OleCreateEmbeddingHelper(
                clsid    : Win32.Objbase.REFCLSID;
                pUnkOuter: Win32.Objbase.LPUNKNOWN;
                flags    : Win32.DWORD;
                pCF      : Win32.Objbase.LPCLASSFACTORY;
                riid     : Win32.Objbase.REFIID;
                lplpObj  : access Win32.LPVOID)
               return Win32.Objbase.HRESULT;                -- ole2.h:4945

    function IsAccelerator(
                hAccel       : Win32.Windef.HACCEL;
                cAccelEntries: Win32.INT;
                lpMsg        : Win32.Winuser.LPMSG;
                lpwCmd       : Win32.PWSTR)
               return Win32.BOOL;                           -- ole2.h:4949

    function OleGetIconOfFile(
                lpszPath       : Win32.Objbase.LPOLESTR;
                fUseFileAsLabel: Win32.BOOL)
               return Win32.Windef.HGLOBAL;                 -- ole2.h:4953
 
    function OleGetIconOfClass( 
                rclsid         : Win32.Objbase.REFCLSID; 
                lpszLabel      : Win32.Objbase.LPOLESTR; 
                fUseTypeAsLabel: Win32.BOOL) 
               return Win32.Windef.HGLOBAL;                 -- ole2.h:4955
 
    function OleMetafilePictFromIconAndLabel( 
                hIcon         : Win32.Windef.HICON; 
                lpszLabel     : Win32.Objbase.LPOLESTR; 
                lpszSourceFile: Win32.Objbase.LPOLESTR; 
                iIconIndex    : Win32.UINT) 
               return Win32.Windef.HGLOBAL;                 -- ole2.h:4958
 
    function OleRegGetUserType( 
                clsid       : Win32.Objbase.REFCLSID; 
                dwFormOfType: Win32.DWORD; 
                pszUserType : access Win32.Objbase.LPOLESTR) 
               return Win32.Objbase.HRESULT;                -- ole2.h:4965
 
    function OleRegGetMiscStatus( 
                clsid    : Win32.Objbase.REFCLSID; 
                dwAspect : Win32.DWORD; 
                pdwStatus: Win32.PDWORD)        
               return Win32.Objbase.HRESULT;                -- ole2.h:4968

    function OleRegEnumFormatEtc(
                clsid      : Win32.Objbase.REFCLSID;
                dwDirection: Win32.DWORD;
                ppenum     : access Win32.Objbase.LPENUMFORMATETC)
               return Win32.Objbase.HRESULT;                -- ole2.h:4971

    function OleRegEnumVerbs(
                clsid : Win32.Objbase.REFCLSID;
                ppenum: access LPENUMOLEVERB)
               return Win32.Objbase.HRESULT;                -- ole2.h:4974

    function OleConvertOLESTREAMToIStorage(
                lpolestream: Win32.Ole2.LPOLESTREAM;
                pstg       : Win32.Objbase.LPSTORAGE;
                ptd        : ac_DVTARGETDEVICE_t)
               return Win32.Objbase.HRESULT;                -- ole2.h:4999

    function OleConvertIStorageToOLESTREAM(
                pstg       : Win32.Objbase.LPSTORAGE;
                lpolestream: Win32.Ole2.LPOLESTREAM)
               return Win32.Objbase.HRESULT;                -- ole2.h:5004

    function GetHGlobalFromILockBytes(
                plkbyt  : Win32.Objbase.LPLOCKBYTES;
                phglobal: access Win32.Windef.HGLOBAL)
               return Win32.Objbase.HRESULT;                -- ole2.h:5010

    function CreateILockBytesOnHGlobal(
                hGlobal         : Win32.Windef.HGLOBAL;
                fDeleteOnRelease: Win32.BOOL;
                pplkbyt         : access Win32.Objbase.LPLOCKBYTES)
               return Win32.Objbase.HRESULT;                -- ole2.h:5011

    function GetHGlobalFromStream(
                pstm    : Win32.Objbase.LPSTREAM;
                phglobal: access Win32.Windef.HGLOBAL)
               return Win32.Objbase.HRESULT;                -- ole2.h:5014

    function CreateStreamOnHGlobal(
                hGlobal         : Win32.Windef.HGLOBAL;
                fDeleteOnRelease: Win32.BOOL;
                ppstm           : access Win32.Objbase.LPSTREAM)
               return Win32.Objbase.HRESULT;                -- ole2.h:5015

    function OleDoAutoConvert(
                pStg     : Win32.Objbase.LPSTORAGE;
                pClsidNew: Win32.Objbase.LPCLSID)
               return Win32.Objbase.HRESULT;                -- ole2.h:5021

    function OleGetAutoConvert(
                clsidOld : access Win32.Objbase.IID;
                pClsidNew: Win32.Objbase.LPCLSID)
               return Win32.Objbase.HRESULT;                -- ole2.h:5022
 
    function OleSetAutoConvert( 
                clsidOld: access Win32.Objbase.IID; 
                clsidNew: access Win32.Objbase.IID) 
               return Win32.Objbase.HRESULT;                -- ole2.h:5023
 
    function GetConvertStg( 
                pStg: Win32.Objbase.LPSTORAGE) 
               return Win32.Objbase.HRESULT;                -- ole2.h:5024
 
    function SetConvertStg( 
                pStg    : Win32.Objbase.LPSTORAGE; 
                fConvert: Win32.BOOL) 
               return Win32.Objbase.HRESULT;                -- ole2.h:5025

    function OleConvertIStorageToOLESTREAMEx(
                pstg    : Win32.Objbase.LPSTORAGE;
                cfFormat: Win32.Objbase.CLIPFORMAT;
                lWidth  : Win32.LONG;
                lHeight : Win32.LONG;
                dwSize  : Win32.DWORD;
                pmedium : Win32.Objbase.LPSTGMEDIUM;
                polestm : LPOLESTREAM)
               return Win32.Objbase.HRESULT;                -- ole2.h:5028

    function OleConvertOLESTREAMToIStorageEx(
                polestm  : LPOLESTREAM;
                pstg     : Win32.Objbase.LPSTORAGE;
                pcfFormat: access Win32.Objbase.CLIPFORMAT;
                plwWidth : access Win32.LONG;
                plHeight : access Win32.LONG;
                pdwSize  : access Win32.DWORD;
                pmedium  : Win32.Objbase.LPSTGMEDIUM)
               return Win32.Objbase.HRESULT;                -- ole2.h:5038

private

    pragma Convention(C_Pass_By_Copy, IOleAdviseHolder);                 -- ole2.h:66
    pragma Convention(C_Pass_By_Copy, IOleCache);                        -- ole2.h:72
    pragma Convention(C_Pass_By_Copy, IOleCache2);                       -- ole2.h:78
    pragma Convention(C_Pass_By_Copy, IOleCacheControl);                 -- ole2.h:84
    pragma Convention(C_Pass_By_Copy, IOleContainer);                    -- ole2.h:90
    pragma Convention(C_Pass_By_Copy, IOleClientSite);                   -- ole2.h:96
    pragma Convention(C_Pass_By_Copy, IOleObject);                       -- ole2.h:102
    pragma Convention(C_Pass_By_Copy, IOleWindow);                       -- ole2.h:108
    pragma Convention(C_Pass_By_Copy, IOleLink);                         -- ole2.h:114
    pragma Convention(C_Pass_By_Copy, IOleItemContainer);                -- ole2.h:120
    pragma Convention(C_Pass_By_Copy, IOleInPlaceUIWindow);              -- ole2.h:126
    pragma Convention(C_Pass_By_Copy, IOleInPlaceActiveObject);          -- ole2.h:132
    pragma Convention(C_Pass_By_Copy, IOleInPlaceFrame);                 -- ole2.h:138
    pragma Convention(C_Pass_By_Copy, IOleInPlaceObject);                -- ole2.h:144
    pragma Convention(C_Pass_By_Copy, IOleInPlaceSite);                  -- ole2.h:150
    pragma Convention(C_Pass_By_Copy, IViewObject);                      -- ole2.h:156
    pragma Convention(C_Pass_By_Copy, IViewObject2);                     -- ole2.h:162
    pragma Convention(C_Pass_By_Copy, IDropSource);                      -- ole2.h:168
    pragma Convention(C_Pass_By_Copy, IDropTarget);                      -- ole2.h:174
    pragma Convention(C_Pass_By_Copy, IEnumOLEVERB);                     -- ole2.h:180
    pragma Convention(C, IOleAdviseHolderVtbl);             -- ole2.h:247
    pragma Convention(C, IOleCacheVtbl);                    -- ole2.h:451
    pragma Convention(C, IOleCache2Vtbl);                   -- ole2.h:673
    pragma Convention(C, IOleCacheControlVtbl);             -- ole2.h:833
    pragma Convention(C, IOleContainerVtbl);                -- ole2.h:949
    pragma Convention(C, IOleClientSiteVtbl);               -- ole2.h:1090
    pragma Convention(C, IOleObjectVtbl);                   -- ole2.h:1401
    pragma Convention(C, IOleWindowVtbl);                   -- ole2.h:1966
    pragma Convention(C, IOleLinkVtbl);                     -- ole2.h:2129
    pragma Convention(C, IOleItemContainerVtbl);            -- ole2.h:2445
    pragma Convention(C, IOleInPlaceUIWindowVtbl);          -- ole2.h:2638
    pragma Convention(C, IOleInPlaceActiveObjectVtbl);      -- ole2.h:2821
    pragma Convention(C, OLEINPLACEFRAMEINFO);              -- ole2.h:2997
    pragma Convention(C, OLEMENUGROUPWIDTHS);               -- ole2.h:3010
    pragma Convention(C, IOleInPlaceFrameVtbl);             -- ole2.h:3055
    pragma Convention(C, IOleInPlaceObjectVtbl);            -- ole2.h:3305
    pragma Convention(C, IOleInPlaceSiteVtbl);              -- ole2.h:3493
    pragma Convention(C, IViewObjectVtbl);                  -- ole2.h:3807
    pragma Convention(C, IViewObject2Vtbl);                 -- ole2.h:4044
    pragma Convention(C, IDropSourceVtbl);                  -- ole2.h:4214
    pragma Convention(C, IDropTargetVtbl);                  -- ole2.h:4389
    pragma Convention(C_Pass_By_Copy, OLEVERB);                          -- ole2.h:4541
    pragma Convention(C, IEnumOLEVERBVtbl);                 -- ole2.h:4584
    pragma Convention(C_Pass_By_Copy, OLESTREAM);                        -- ole2.h:4984
    pragma Convention(C_Pass_By_Copy, OLESTREAMVTBL);                    -- ole2.h:4986
    pragma Convention(C, OBJECTDESCRIPTOR);                 -- ole2.h:1901

    pragma Import(Stdcall, IID_IOleAdviseHolder, "IID_IOleAdviseHolder");
                                                            -- ole2.h:219
    pragma Import(Stdcall, IID_IOleCache, "IID_IOleCache");       -- ole2.h:421
    pragma Import(Stdcall, IID_IOleCache2, "IID_IOleCache2");     -- ole2.h:654
    pragma Import(Stdcall, IID_IOleCacheControl, "IID_IOleCacheControl");
                                                            -- ole2.h:817
    pragma Import(Stdcall, IID_IOleContainer, "IID_IOleContainer");
                                                            -- ole2.h:931
    pragma Import(Stdcall, IID_IOleClientSite, "IID_IOleClientSite");
                                                            -- ole2.h:1062
    pragma Import(Stdcall, IID_IOleObject, "IID_IOleObject");     -- ole2.h:1312
    pragma Import(Stdcall, IOLETypes_v0_0_c_ifspec, "IOLETypes_v0_0_c_ifspec");
                                                            -- ole2.h:1930
    pragma Import(Stdcall, IOLETypes_v0_0_s_ifspec, "IOLETypes_v0_0_s_ifspec");
                                                            -- ole2.h:1931
    pragma Import(Stdcall, IID_IOleWindow, "IID_IOleWindow");     -- ole2.h:1949
    pragma Import(Stdcall, IID_IOleLink, "IID_IOleLink");         -- ole2.h:2085
    pragma Import(Stdcall, IID_IOleItemContainer, "IID_IOleItemContainer");
                                                            -- ole2.h:2418
    pragma Import(Stdcall, IID_IOleInPlaceUIWindow, "IID_IOleInPlaceUIWindow");
                                                            -- ole2.h:2614
    pragma Import(Stdcall, IID_IOleInPlaceActiveObject, 
                     "IID_IOleInPlaceActiveObject");        -- ole2.h:2793
    pragma Import(Stdcall, IID_IOleInPlaceFrame, "IID_IOleInPlaceFrame");
                                                            -- ole2.h:3022
    pragma Import(Stdcall, IID_IOleInPlaceObject, "IID_IOleInPlaceObject");
                                                            -- ole2.h:3284
    pragma Import(Stdcall, IID_IOleInPlaceSite, "IID_IOleInPlaceSite");
                                                            -- ole2.h:3454
    pragma Import(Stdcall, IID_IViewObject, "IID_IViewObject");   -- ole2.h:3756
    pragma Import(Stdcall, IID_IViewObject2, "IID_IViewObject2"); -- ole2.h:4027
    pragma Import(Stdcall, IID_IDropSource, "IID_IDropSource");   -- ole2.h:4196
    pragma Import(Stdcall, IID_IDropTarget, "IID_IDropTarget");   -- ole2.h:4359
    pragma Import(Stdcall, IID_IEnumOLEVERB, "IID_IEnumOLEVERB"); -- ole2.h:4560

    pragma Import(Stdcall, IOleAdviseHolder_Advise_Proxy, 
                     "IOleAdviseHolder_Advise_Proxy");      -- ole2.h:331
    pragma Import(Stdcall, IOleAdviseHolder_Advise_Stub, 
                     "IOleAdviseHolder_Advise_Stub");       -- ole2.h:337 
    pragma Import(Stdcall, IOleAdviseHolder_Unadvise_Proxy,
                     "IOleAdviseHolder_Unadvise_Proxy");    -- ole2.h:344
    pragma Import(Stdcall, IOleAdviseHolder_Unadvise_Stub, 
                     "IOleAdviseHolder_Unadvise_Stub");     -- ole2.h:349 
    pragma Import(Stdcall, IOleAdviseHolder_EnumAdvise_Proxy,
                     "IOleAdviseHolder_EnumAdvise_Proxy");  -- ole2.h:356
    pragma Import(Stdcall, IOleAdviseHolder_EnumAdvise_Stub, 
                     "IOleAdviseHolder_EnumAdvise_Stub");   -- ole2.h:361 
    pragma Import(Stdcall, IOleAdviseHolder_SendOnRename_Proxy,
                     "IOleAdviseHolder_SendOnRename_Proxy");-- ole2.h:368
    pragma Import(Stdcall, IOleAdviseHolder_SendOnRename_Stub, 
                     "IOleAdviseHolder_SendOnRename_Stub"); -- ole2.h:373 
    pragma Import(Stdcall, IOleAdviseHolder_SendOnSave_Proxy,
                     "IOleAdviseHolder_SendOnSave_Proxy");  -- ole2.h:380
    pragma Import(Stdcall, IOleAdviseHolder_SendOnSave_Stub, 
                     "IOleAdviseHolder_SendOnSave_Stub");   -- ole2.h:384 
    pragma Import(Stdcall, IOleAdviseHolder_SendOnClose_Proxy,
                     "IOleAdviseHolder_SendOnClose_Proxy"); -- ole2.h:391
    pragma Import(Stdcall, IOleAdviseHolder_SendOnClose_Stub, 
                     "IOleAdviseHolder_SendOnClose_Stub");  -- ole2.h:395 
    pragma Import(Stdcall, IOleCache_Cache_Proxy, "IOleCache_Cache_Proxy");
                                                            -- ole2.h:533
    pragma Import(Stdcall, IOleCache_Cache_Stub, "IOleCache_Cache_Stub"); 
                                                            -- ole2.h:540
    pragma Import(Stdcall, IOleCache_Uncache_Proxy, "IOleCache_Uncache_Proxy");
                                                            -- ole2.h:547
    pragma Import(Stdcall, IOleCache_Uncache_Stub, "IOleCache_Uncache_Stub"); 
                                                            -- ole2.h:552
    pragma Import(Stdcall, IOleCache_EnumCache_Proxy, "IOleCache_EnumCache_Proxy");
                                                            -- ole2.h:559
    pragma Import(Stdcall, IOleCache_EnumCache_Stub, "IOleCache_EnumCache_Stub"); 
                                                            -- ole2.h:564
    pragma Import(Stdcall, IOleCache_InitCache_Proxy, "IOleCache_InitCache_Proxy");
                                                            -- ole2.h:571
    pragma Import(Stdcall, IOleCache_InitCache_Stub, "IOleCache_InitCache_Stub"); 
                                                            -- ole2.h:576
    pragma Import(Stdcall, IOleCache_SetData_Proxy, "IOleCache_SetData_Proxy");
                                                            -- ole2.h:583
    pragma Import(Stdcall, IOleCache_SetData_Stub, "IOleCache_SetData_Stub"); 
                                                            -- ole2.h:590
    pragma Import(Stdcall, IOleCache2_UpdateCache_Proxy,
                     "IOleCache2_UpdateCache_Proxy");       -- ole2.h:772
    pragma Import(Stdcall, IOleCache2_UpdateCache_Stub, 
                     "IOleCache2_UpdateCache_Stub");        -- ole2.h:779 
    pragma Import(Stdcall, IOleCache2_DiscardCache_Proxy,
                     "IOleCache2_DiscardCache_Proxy");      -- ole2.h:786
    pragma Import(Stdcall, IOleCache2_DiscardCache_Stub, 
                     "IOleCache2_DiscardCache_Stub");       -- ole2.h:791 
    pragma Import(Stdcall, IOleCacheControl_OnRun_Proxy,
                     "IOleCacheControl_OnRun_Proxy");       -- ole2.h:889
    pragma Import(Stdcall, IOleCacheControl_OnRun_Stub, 
                     "IOleCacheControl_OnRun_Stub");        -- ole2.h:894 
    pragma Import(Stdcall, IOleCacheControl_OnStop_Proxy,
                     "IOleCacheControl_OnStop_Proxy");      -- ole2.h:901
    pragma Import(Stdcall, IOleCacheControl_OnStop_Stub, 
                     "IOleCacheControl_OnStop_Stub");       -- ole2.h:905 
    pragma Import(Stdcall, IOleContainer_EnumObjects_Proxy,
                     "IOleContainer_EnumObjects_Proxy");    -- ole2.h:1018
    pragma Import(Stdcall, IOleContainer_EnumObjects_Stub, 
                     "IOleContainer_EnumObjects_Stub");     -- ole2.h:1024 
    pragma Import(Stdcall, IOleContainer_LockContainer_Proxy,
                     "IOleContainer_LockContainer_Proxy");  -- ole2.h:1031
    pragma Import(Stdcall, IOleContainer_LockContainer_Stub, 
                     "IOleContainer_LockContainer_Stub");   -- ole2.h:1036 
    pragma Import(Stdcall, IOleClientSite_SaveObject_Proxy,
                     "IOleClientSite_SaveObject_Proxy");    -- ole2.h:1174
    pragma Import(Stdcall, IOleClientSite_SaveObject_Stub, 
                     "IOleClientSite_SaveObject_Stub");     -- ole2.h:1178 
    pragma Import(Stdcall, IOleClientSite_GetMoniker_Proxy,
                     "IOleClientSite_GetMoniker_Proxy");    -- ole2.h:1185
    pragma Import(Stdcall, IOleClientSite_GetMoniker_Stub, 
                     "IOleClientSite_GetMoniker_Stub");     -- ole2.h:1192 
    pragma Import(Stdcall, IOleClientSite_GetContainer_Proxy,
                     "IOleClientSite_GetContainer_Proxy");  -- ole2.h:1199
    pragma Import(Stdcall, IOleClientSite_GetContainer_Stub, 
                     "IOleClientSite_GetContainer_Stub");   -- ole2.h:1204 
    pragma Import(Stdcall, IOleClientSite_ShowObject_Proxy,
                     "IOleClientSite_ShowObject_Proxy");    -- ole2.h:1211
    pragma Import(Stdcall, IOleClientSite_ShowObject_Stub, 
                     "IOleClientSite_ShowObject_Stub");     -- ole2.h:1215 
    pragma Import(Stdcall, IOleClientSite_OnShowWindow_Proxy,
                     "IOleClientSite_OnShowWindow_Proxy");  -- ole2.h:1222
    pragma Import(Stdcall, IOleClientSite_OnShowWindow_Stub, 
                     "IOleClientSite_OnShowWindow_Stub");   -- ole2.h:1227 
    pragma Import(Stdcall, IOleClientSite_RequestNewObjectLayout_Proxy,
                     "IOleClientSite_RequestNewObjectLayout_Proxy");
                                                            -- ole2.h:1234
    pragma Import(Stdcall, IOleClientSite_RequestNewObjectLayout_Stub, 
                     "IOleClientSite_RequestNewObjectLayout_Stub"); 
                                                            -- ole2.h:1238
    pragma Import(Stdcall, IOleObject_SetClientSite_Proxy,
                     "IOleObject_SetClientSite_Proxy");     -- ole2.h:1606
    pragma Import(Stdcall, IOleObject_SetClientSite_Stub, 
                     "IOleObject_SetClientSite_Stub");      -- ole2.h:1611 
    pragma Import(Stdcall, IOleObject_GetClientSite_Proxy,
                     "IOleObject_GetClientSite_Proxy");     -- ole2.h:1618
    pragma Import(Stdcall, IOleObject_GetClientSite_Stub, 
                     "IOleObject_GetClientSite_Stub");      -- ole2.h:1623 
    pragma Import(Stdcall, IOleObject_SetHostNames_Proxy,
                     "IOleObject_SetHostNames_Proxy");      -- ole2.h:1630
    pragma Import(Stdcall, IOleObject_SetHostNames_Stub, 
                     "IOleObject_SetHostNames_Stub");       -- ole2.h:1636 
    pragma Import(Stdcall, IOleObject_Close_Proxy, "IOleObject_Close_Proxy");
                                                            -- ole2.h:1643
    pragma Import(Stdcall, IOleObject_Close_Stub, "IOleObject_Close_Stub"); 
                                                            -- ole2.h:1648
    pragma Import(Stdcall, IOleObject_SetMoniker_Proxy,
                     "IOleObject_SetMoniker_Proxy");        -- ole2.h:1655
    pragma Import(Stdcall, IOleObject_SetMoniker_Stub, 
                     "IOleObject_SetMoniker_Stub");         -- ole2.h:1661 
    pragma Import(Stdcall, IOleObject_GetMoniker_Proxy,
                     "IOleObject_GetMoniker_Proxy");        -- ole2.h:1668
    pragma Import(Stdcall, IOleObject_GetMoniker_Stub, 
                     "IOleObject_GetMoniker_Stub");         -- ole2.h:1675 
    pragma Import(Stdcall, IOleObject_InitFromData_Proxy,
                     "IOleObject_InitFromData_Proxy");      -- ole2.h:1682
    pragma Import(Stdcall, IOleObject_InitFromData_Stub, 
                     "IOleObject_InitFromData_Stub");       -- ole2.h:1689 
    pragma Import(Stdcall, IOleObject_GetClipboardData_Proxy,
                     "IOleObject_GetClipboardData_Proxy");  -- ole2.h:1696
    pragma Import(Stdcall, IOleObject_GetClipboardData_Stub, 
                     "IOleObject_GetClipboardData_Stub");   -- ole2.h:1702 
    pragma Import(Stdcall, IOleObject_DoVerb_Proxy, "IOleObject_DoVerb_Proxy");
                                                            -- ole2.h:1709
    pragma Import(Stdcall, IOleObject_DoVerb_Stub, "IOleObject_DoVerb_Stub"); 
                                                            -- ole2.h:1719
    pragma Import(Stdcall, IOleObject_EnumVerbs_Proxy, "IOleObject_EnumVerbs_Proxy");
                                                            -- ole2.h:1726
    pragma Import(Stdcall, IOleObject_EnumVerbs_Stub, "IOleObject_EnumVerbs_Stub"); 
                                                            -- ole2.h:1731
    pragma Import(Stdcall, IOleObject_Update_Proxy, "IOleObject_Update_Proxy");
                                                            -- ole2.h:1738
    pragma Import(Stdcall, IOleObject_Update_Stub, "IOleObject_Update_Stub"); 
                                                            -- ole2.h:1742
    pragma Import(Stdcall, IOleObject_IsUpToDate_Proxy, 
                     "IOleObject_IsUpToDate_Proxy");        -- ole2.h:1749
    pragma Import(Stdcall, IOleObject_IsUpToDate_Stub, "IOleObject_IsUpToDate_Stub"); 
                                                            -- ole2.h:1753
    pragma Import(Stdcall, IOleObject_GetUserClassID_Proxy,
                     "IOleObject_GetUserClassID_Proxy");    -- ole2.h:1760
    pragma Import(Stdcall, IOleObject_GetUserClassID_Stub, 
                     "IOleObject_GetUserClassID_Stub");     -- ole2.h:1765 
    pragma Import(Stdcall, IOleObject_GetUserType_Proxy,
                     "IOleObject_GetUserType_Proxy");       -- ole2.h:1772
    pragma Import(Stdcall, IOleObject_GetUserType_Stub, 
                     "IOleObject_GetUserType_Stub");        -- ole2.h:1778 
    pragma Import(Stdcall, IOleObject_SetExtent_Proxy, "IOleObject_SetExtent_Proxy");
                                                            -- ole2.h:1785
    pragma Import(Stdcall, IOleObject_SetExtent_Stub, "IOleObject_SetExtent_Stub"); 
                                                            -- ole2.h:1791
    pragma Import(Stdcall, IOleObject_GetExtent_Proxy, "IOleObject_GetExtent_Proxy");
                                                            -- ole2.h:1798
    pragma Import(Stdcall, IOleObject_GetExtent_Stub, "IOleObject_GetExtent_Stub"); 
                                                            -- ole2.h:1804
    pragma Import(Stdcall, IOleObject_Advise_Proxy, "IOleObject_Advise_Proxy");
                                                            -- ole2.h:1811
    pragma Import(Stdcall, IOleObject_Advise_Stub, "IOleObject_Advise_Stub"); 
                                                            -- ole2.h:1817
    pragma Import(Stdcall, IOleObject_Unadvise_Proxy, "IOleObject_Unadvise_Proxy");
                                                            -- ole2.h:1824
    pragma Import(Stdcall, IOleObject_Unadvise_Stub, "IOleObject_Unadvise_Stub"); 
                                                            -- ole2.h:1829
    pragma Import(Stdcall, IOleObject_EnumAdvise_Proxy,
                     "IOleObject_EnumAdvise_Proxy");        -- ole2.h:1836
    pragma Import(Stdcall, IOleObject_EnumAdvise_Stub, "IOleObject_EnumAdvise_Stub"); 
                                                            -- ole2.h:1841
    pragma Import(Stdcall, IOleObject_GetMiscStatus_Proxy,
                     "IOleObject_GetMiscStatus_Proxy");     -- ole2.h:1848
    pragma Import(Stdcall, IOleObject_GetMiscStatus_Stub, 
                     "IOleObject_GetMiscStatus_Stub");      -- ole2.h:1854 
    pragma Import(Stdcall, IOleObject_SetColorScheme_Proxy,
                     "IOleObject_SetColorScheme_Proxy");    -- ole2.h:1861
    pragma Import(Stdcall, IOleObject_SetColorScheme_Stub, 
                     "IOleObject_SetColorScheme_Stub");     -- ole2.h:1866 
    pragma Import(Stdcall, IOleWindow_GetWindow_Proxy, "IOleWindow_GetWindow_Proxy");
                                                            -- ole2.h:2023
    pragma Import(Stdcall, IOleWindow_GetWindow_Stub, "IOleWindow_GetWindow_Stub"); 
                                                            -- ole2.h:2028
    pragma Import(Stdcall, IOleWindow_ContextSensitiveHelp_Proxy,
                     "IOleWindow_ContextSensitiveHelp_Proxy");
                                                            -- ole2.h:2035
    pragma Import(Stdcall, IOleWindow_ContextSensitiveHelp_Stub, 
                     "IOleWindow_ContextSensitiveHelp_Stub"); 
                                                            -- ole2.h:2040
    pragma Import(Stdcall, IOleLink_SetUpdateOptions_Proxy,
                     "IOleLink_SetUpdateOptions_Proxy");    -- ole2.h:2249
    pragma Import(Stdcall, IOleLink_SetUpdateOptions_Stub, 
                     "IOleLink_SetUpdateOptions_Stub");     -- ole2.h:2254 
    pragma Import(Stdcall, IOleLink_GetUpdateOptions_Proxy,
                     "IOleLink_GetUpdateOptions_Proxy");    -- ole2.h:2261
    pragma Import(Stdcall, IOleLink_GetUpdateOptions_Stub, 
                     "IOleLink_GetUpdateOptions_Stub");     -- ole2.h:2266 
    pragma Import(Stdcall, IOleLink_SetSourceMoniker_Proxy,
                     "IOleLink_SetSourceMoniker_Proxy");    -- ole2.h:2273
    pragma Import(Stdcall, IOleLink_SetSourceMoniker_Stub, 
                     "IOleLink_SetSourceMoniker_Stub");     -- ole2.h:2279 
    pragma Import(Stdcall, IOleLink_GetSourceMoniker_Proxy,
                     "IOleLink_GetSourceMoniker_Proxy");    -- ole2.h:2286
    pragma Import(Stdcall, IOleLink_GetSourceMoniker_Stub, 
                     "IOleLink_GetSourceMoniker_Stub");     -- ole2.h:2291 
    pragma Import(Stdcall, IOleLink_SetSourceDisplayName_Proxy,
                     "IOleLink_SetSourceDisplayName_Proxy");-- ole2.h:2298
    pragma Import(Stdcall, IOleLink_SetSourceDisplayName_Stub, 
                     "IOleLink_SetSourceDisplayName_Stub"); -- ole2.h:2303 
    pragma Import(Stdcall, IOleLink_GetSourceDisplayName_Proxy,
                     "IOleLink_GetSourceDisplayName_Proxy");-- ole2.h:2310
    pragma Import(Stdcall, IOleLink_GetSourceDisplayName_Stub, 
                     "IOleLink_GetSourceDisplayName_Stub"); -- ole2.h:2315 
    pragma Import(Stdcall, IOleLink_BindToSource_Proxy,
                     "IOleLink_BindToSource_Proxy");        -- ole2.h:2322
    pragma Import(Stdcall, IOleLink_BindToSource_Stub, "IOleLink_BindToSource_Stub"); 
                                                            -- ole2.h:2328
    pragma Import(Stdcall, IOleLink_BindIfRunning_Proxy,
                     "IOleLink_BindIfRunning_Proxy");       -- ole2.h:2335
    pragma Import(Stdcall, IOleLink_BindIfRunning_Stub, 
                     "IOleLink_BindIfRunning_Stub");        -- ole2.h:2339 
    pragma Import(Stdcall, IOleLink_GetBoundSource_Proxy,
                     "IOleLink_GetBoundSource_Proxy");      -- ole2.h:2346
    pragma Import(Stdcall, IOleLink_GetBoundSource_Stub, 
                     "IOleLink_GetBoundSource_Stub");       -- ole2.h:2351 
    pragma Import(Stdcall, IOleLink_UnbindSource_Proxy,
                     "IOleLink_UnbindSource_Proxy");        -- ole2.h:2358
    pragma Import(Stdcall, IOleLink_UnbindSource_Stub, "IOleLink_UnbindSource_Stub"); 
                                                            -- ole2.h:2362
    pragma Import(Stdcall, IOleLink_Update_Proxy, "IOleLink_Update_Proxy");
                                                            -- ole2.h:2369
    pragma Import(Stdcall, IOleLink_Update_Stub, "IOleLink_Update_Stub"); 
                                                            -- ole2.h:2374
    pragma Import(Stdcall, IOleItemContainer_RemoteGetObject_Proxy,
                     "IOleItemContainer_RemoteGetObject_Proxy");
                                                            -- ole2.h:2543
    pragma Import(Stdcall, IOleItemContainer_RemoteGetObject_Stub, 
                     "IOleItemContainer_RemoteGetObject_Stub"); 
                                                            -- ole2.h:2552
    pragma Import(Stdcall, IOleItemContainer_RemoteGetObjectStorage_Proxy,
                     "IOleItemContainer_RemoteGetObjectStorage_Proxy");
                                                            -- ole2.h:2559
    pragma Import(Stdcall, IOleItemContainer_RemoteGetObjectStorage_Stub, 
                     "IOleItemContainer_RemoteGetObjectStorage_Stub"); 
                                                            -- ole2.h:2567
    pragma Import(Stdcall, IOleItemContainer_IsRunning_Proxy,
                     "IOleItemContainer_IsRunning_Proxy");  -- ole2.h:2574
    pragma Import(Stdcall, IOleItemContainer_IsRunning_Stub, 
                     "IOleItemContainer_IsRunning_Stub");   -- ole2.h:2579 
    pragma Import(Stdcall, IOleInPlaceUIWindow_GetBorder_Proxy,
                     "IOleInPlaceUIWindow_GetBorder_Proxy");-- ole2.h:2725
    pragma Import(Stdcall, IOleInPlaceUIWindow_GetBorder_Stub, 
                     "IOleInPlaceUIWindow_GetBorder_Stub"); -- ole2.h:2730 
    pragma Import(Stdcall, IOleInPlaceUIWindow_RequestBorderSpace_Proxy,
                     "IOleInPlaceUIWindow_RequestBorderSpace_Proxy");
                                                            -- ole2.h:2737
    pragma Import(Stdcall, IOleInPlaceUIWindow_RequestBorderSpace_Stub, 
                     "IOleInPlaceUIWindow_RequestBorderSpace_Stub"); 
                                                            -- ole2.h:2742
    pragma Import(Stdcall, IOleInPlaceUIWindow_SetBorderSpace_Proxy,
                     "IOleInPlaceUIWindow_SetBorderSpace_Proxy");
                                                            -- ole2.h:2749
    pragma Import(Stdcall, IOleInPlaceUIWindow_SetBorderSpace_Stub, 
                     "IOleInPlaceUIWindow_SetBorderSpace_Stub"); 
                                                            -- ole2.h:2754
    pragma Import(Stdcall, IOleInPlaceUIWindow_SetActiveObject_Proxy,
                     "IOleInPlaceUIWindow_SetActiveObject_Proxy");
                                                            -- ole2.h:2761
    pragma Import(Stdcall, IOleInPlaceUIWindow_SetActiveObject_Stub, 
                     "IOleInPlaceUIWindow_SetActiveObject_Stub"); 
                                                            -- ole2.h:2767
    pragma Import(Stdcall, IOleInPlaceActiveObject_RemoteTranslateAccelerator_Proxy,
                    "IOleInPlaceActiveObject_RemoteTranslateAccelerator_Proxy")
                                                                ;
                                                            -- ole2.h:2916
    pragma Import(Stdcall, IOleInPlaceActiveObject_RemoteTranslateAccelerator_Stub, 
                     "IOleInPlaceActiveObject_RemoteTranslateAccelerator_Stub") 
                                                                ;
                                                            -- ole2.h:2920
    pragma Import(Stdcall, IOleInPlaceActiveObject_OnFrameWindowActivate_Proxy,
                     "IOleInPlaceActiveObject_OnFrameWindowActivate_Proxy");
                                                            -- ole2.h:2927
    pragma Import(Stdcall, IOleInPlaceActiveObject_OnFrameWindowActivate_Stub, 
                     "IOleInPlaceActiveObject_OnFrameWindowActivate_Stub"); 
                                                            -- ole2.h:2932
    pragma Import(Stdcall, IOleInPlaceActiveObject_OnDocWindowActivate_Proxy,
                     "IOleInPlaceActiveObject_OnDocWindowActivate_Proxy");
                                                            -- ole2.h:2939
    pragma Import(Stdcall, IOleInPlaceActiveObject_OnDocWindowActivate_Stub, 
                     "IOleInPlaceActiveObject_OnDocWindowActivate_Stub"); 
                                                            -- ole2.h:2944
    pragma Import(Stdcall, IOleInPlaceActiveObject_RemoteResizeBorder_Proxy,
                     "IOleInPlaceActiveObject_RemoteResizeBorder_Proxy");
                                                            -- ole2.h:2951
    pragma Import(Stdcall, IOleInPlaceActiveObject_RemoteResizeBorder_Stub, 
                     "IOleInPlaceActiveObject_RemoteResizeBorder_Stub"); 
                                                            -- ole2.h:2959
    pragma Import(Stdcall, IOleInPlaceActiveObject_EnableModeless_Proxy,
                     "IOleInPlaceActiveObject_EnableModeless_Proxy");
                                                            -- ole2.h:2966
    pragma Import(Stdcall, IOleInPlaceActiveObject_EnableModeless_Stub, 
                     "IOleInPlaceActiveObject_EnableModeless_Stub"); 
                                                            -- ole2.h:2971
    pragma Import(Stdcall, IOleInPlaceFrame_InsertMenus_Proxy,
                     "IOleInPlaceFrame_InsertMenus_Proxy"); -- ole2.h:3189
    pragma Import(Stdcall, IOleInPlaceFrame_InsertMenus_Stub, 
                     "IOleInPlaceFrame_InsertMenus_Stub");  -- ole2.h:3195 
    pragma Import(Stdcall, IOleInPlaceFrame_SetMenu_Proxy,
                     "IOleInPlaceFrame_SetMenu_Proxy");     -- ole2.h:3202
    pragma Import(Stdcall, IOleInPlaceFrame_SetMenu_Stub, 
                     "IOleInPlaceFrame_SetMenu_Stub");      -- ole2.h:3209 
    pragma Import(Stdcall, IOleInPlaceFrame_RemoveMenus_Proxy,
                     "IOleInPlaceFrame_RemoveMenus_Proxy"); -- ole2.h:3216
    pragma Import(Stdcall, IOleInPlaceFrame_RemoveMenus_Stub, 
                     "IOleInPlaceFrame_RemoveMenus_Stub");  -- ole2.h:3221 
    pragma Import(Stdcall, IOleInPlaceFrame_SetStatusText_Proxy,
                     "IOleInPlaceFrame_SetStatusText_Proxy");
                                                            -- ole2.h:3228
    pragma Import(Stdcall, IOleInPlaceFrame_SetStatusText_Stub, 
                     "IOleInPlaceFrame_SetStatusText_Stub");-- ole2.h:3233 
    pragma Import(Stdcall, IOleInPlaceFrame_EnableModeless_Proxy,
                     "IOleInPlaceFrame_EnableModeless_Proxy");
                                                            -- ole2.h:3240
    pragma Import(Stdcall, IOleInPlaceFrame_EnableModeless_Stub, 
                     "IOleInPlaceFrame_EnableModeless_Stub"); 
                                                            -- ole2.h:3245
    pragma Import(Stdcall, IOleInPlaceFrame_TranslateAccelerator_Proxy,
                     "IOleInPlaceFrame_TranslateAccelerator_Proxy");
                                                            -- ole2.h:3252
    pragma Import(Stdcall, IOleInPlaceFrame_TranslateAccelerator_Stub, 
                     "IOleInPlaceFrame_TranslateAccelerator_Stub"); 
                                                            -- ole2.h:3258
    pragma Import(Stdcall, IOleInPlaceObject_InPlaceDeactivate_Proxy,
                     "IOleInPlaceObject_InPlaceDeactivate_Proxy");
                                                            -- ole2.h:3389
    pragma Import(Stdcall, IOleInPlaceObject_InPlaceDeactivate_Stub, 
                     "IOleInPlaceObject_InPlaceDeactivate_Stub"); 
                                                            -- ole2.h:3393
    pragma Import(Stdcall, IOleInPlaceObject_UIDeactivate_Proxy,
                     "IOleInPlaceObject_UIDeactivate_Proxy");
                                                            -- ole2.h:3400
    pragma Import(Stdcall, IOleInPlaceObject_UIDeactivate_Stub, 
                     "IOleInPlaceObject_UIDeactivate_Stub");-- ole2.h:3404 
    pragma Import(Stdcall, IOleInPlaceObject_SetObjectRects_Proxy,
                     "IOleInPlaceObject_SetObjectRects_Proxy");
                                                            -- ole2.h:3411
    pragma Import(Stdcall, IOleInPlaceObject_SetObjectRects_Stub, 
                     "IOleInPlaceObject_SetObjectRects_Stub"); 
                                                            -- ole2.h:3417
    pragma Import(Stdcall, IOleInPlaceObject_ReactivateAndUndo_Proxy,
                     "IOleInPlaceObject_ReactivateAndUndo_Proxy");
                                                            -- ole2.h:3424
    pragma Import(Stdcall, IOleInPlaceObject_ReactivateAndUndo_Stub, 
                     "IOleInPlaceObject_ReactivateAndUndo_Stub"); 
                                                            -- ole2.h:3428
    pragma Import(Stdcall, IOleInPlaceSite_CanInPlaceActivate_Proxy,
                     "IOleInPlaceSite_CanInPlaceActivate_Proxy");
                                                            -- ole2.h:3619
    pragma Import(Stdcall, IOleInPlaceSite_CanInPlaceActivate_Stub, 
                     "IOleInPlaceSite_CanInPlaceActivate_Stub"); 
                                                            -- ole2.h:3623
    pragma Import(Stdcall, IOleInPlaceSite_OnInPlaceActivate_Proxy,
                     "IOleInPlaceSite_OnInPlaceActivate_Proxy");
                                                            -- ole2.h:3630
    pragma Import(Stdcall, IOleInPlaceSite_OnInPlaceActivate_Stub, 
                     "IOleInPlaceSite_OnInPlaceActivate_Stub"); 
                                                            -- ole2.h:3634
    pragma Import(Stdcall, IOleInPlaceSite_OnUIActivate_Proxy,
                     "IOleInPlaceSite_OnUIActivate_Proxy"); -- ole2.h:3641
    pragma Import(Stdcall, IOleInPlaceSite_OnUIActivate_Stub,  
                     "IOleInPlaceSite_OnUIActivate_Stub");  -- ole2.h:3645 
    pragma Import(Stdcall, IOleInPlaceSite_GetWindowContext_Proxy,
                     "IOleInPlaceSite_GetWindowContext_Proxy");
                                                            -- ole2.h:3652
    pragma Import(Stdcall, IOleInPlaceSite_GetWindowContext_Stub, 
                     "IOleInPlaceSite_GetWindowContext_Stub"); 
                                                            -- ole2.h:3661
    pragma Import(Stdcall, IOleInPlaceSite_Scroll_Proxy,
                     "IOleInPlaceSite_Scroll_Proxy");       -- ole2.h:3668
    pragma Import(Stdcall, IOleInPlaceSite_Scroll_Stub, 
                     "IOleInPlaceSite_Scroll_Stub");        -- ole2.h:3673 
    pragma Import(Stdcall, IOleInPlaceSite_OnUIDeactivate_Proxy,
                     "IOleInPlaceSite_OnUIDeactivate_Proxy");
                                                            -- ole2.h:3680
    pragma Import(Stdcall, IOleInPlaceSite_OnUIDeactivate_Stub, 
                     "IOleInPlaceSite_OnUIDeactivate_Stub");-- ole2.h:3685 
    pragma Import(Stdcall, IOleInPlaceSite_OnInPlaceDeactivate_Proxy,
                     "IOleInPlaceSite_OnInPlaceDeactivate_Proxy");
                                                            -- ole2.h:3692
    pragma Import(Stdcall, IOleInPlaceSite_OnInPlaceDeactivate_Stub, 
                     "IOleInPlaceSite_OnInPlaceDeactivate_Stub"); 
                                                            -- ole2.h:3696
    pragma Import(Stdcall, IOleInPlaceSite_DiscardUndoState_Proxy,
                     "IOleInPlaceSite_DiscardUndoState_Proxy");
                                                            -- ole2.h:3703
    pragma Import(Stdcall, IOleInPlaceSite_DiscardUndoState_Stub, 
                     "IOleInPlaceSite_DiscardUndoState_Stub"); 
                                                            -- ole2.h:3707
    pragma Import(Stdcall, IOleInPlaceSite_DeactivateAndUndo_Proxy,
                     "IOleInPlaceSite_DeactivateAndUndo_Proxy");
                                                            -- ole2.h:3714
    pragma Import(Stdcall, IOleInPlaceSite_DeactivateAndUndo_Stub, 
                     "IOleInPlaceSite_DeactivateAndUndo_Stub"); 
                                                            -- ole2.h:3718
    pragma Import(Stdcall, IOleInPlaceSite_OnPosRectChange_Proxy,
                     "IOleInPlaceSite_OnPosRectChange_Proxy");
                                                            -- ole2.h:3725
    pragma Import(Stdcall, IOleInPlaceSite_OnPosRectChange_Stub, 
                     "IOleInPlaceSite_OnPosRectChange_Stub"); 
                                                            -- ole2.h:3730
    pragma Import(Stdcall, IViewObject_Draw_Proxy, "IViewObject_Draw_Proxy");
                                                            -- ole2.h:3914
    pragma Import(Stdcall, IViewObject_Draw_Stub, "IViewObject_Draw_Stub"); 
                                                            -- ole2.h:3929
    pragma Import(Stdcall, IViewObject_GetColorSet_Proxy,
                     "IViewObject_GetColorSet_Proxy");      -- ole2.h:3936
    pragma Import(Stdcall, IViewObject_GetColorSet_Stub, 
                     "IViewObject_GetColorSet_Stub");       -- ole2.h:3946 
    pragma Import(Stdcall, IViewObject_Freeze_Proxy, "IViewObject_Freeze_Proxy");
                                                            -- ole2.h:3953
    pragma Import(Stdcall, IViewObject_Freeze_Stub, "IViewObject_Freeze_Stub"); 
                                                            -- ole2.h:3961
    pragma Import(Stdcall, IViewObject_Unfreeze_Proxy, "IViewObject_Unfreeze_Proxy");
                                                            -- ole2.h:3968
    pragma Import(Stdcall, IViewObject_Unfreeze_Stub, "IViewObject_Unfreeze_Stub"); 
                                                            -- ole2.h:3973
    pragma Import(Stdcall, IViewObject_SetAdvise_Proxy,
                     "IViewObject_SetAdvise_Proxy");        -- ole2.h:3980
    pragma Import(Stdcall, IViewObject_SetAdvise_Stub, "IViewObject_SetAdvise_Stub"); 
                                                            -- ole2.h:3987
    pragma Import(Stdcall, IViewObject_GetAdvise_Proxy,
                     "IViewObject_GetAdvise_Proxy");        -- ole2.h:3994
    pragma Import(Stdcall, IViewObject_GetAdvise_Stub, "IViewObject_GetAdvise_Stub"); 
                                                            -- ole2.h:4001
    pragma Import(Stdcall, IViewObject2_GetExtent_Proxy,
                     "IViewObject2_GetExtent_Proxy");       -- ole2.h:4162
    pragma Import(Stdcall, IViewObject2_GetExtent_Stub, 
                     "IViewObject2_GetExtent_Stub");        -- ole2.h:4170 
    pragma Import(Stdcall, IDropSource_QueryContinueDrag_Proxy,
                     "IDropSource_QueryContinueDrag_Proxy");-- ole2.h:4272
    pragma Import(Stdcall, IDropSource_QueryContinueDrag_Stub, 
                     "IDropSource_QueryContinueDrag_Stub"); -- ole2.h:4278 
    pragma Import(Stdcall, IDropSource_GiveFeedback_Proxy,
                     "IDropSource_GiveFeedback_Proxy");     -- ole2.h:4285
    pragma Import(Stdcall, IDropSource_GiveFeedback_Stub, 
                     "IDropSource_GiveFeedback_Stub");      -- ole2.h:4290 
    pragma Import(Stdcall, IDropTarget_DragEnter_Proxy,
                     "IDropTarget_DragEnter_Proxy");        -- ole2.h:4467
    pragma Import(Stdcall, IDropTarget_DragEnter_Stub, "IDropTarget_DragEnter_Stub"); 
                                                            -- ole2.h:4475
    pragma Import(Stdcall, IDropTarget_DragOver_Proxy, "IDropTarget_DragOver_Proxy");
                                                            -- ole2.h:4482
    pragma Import(Stdcall, IDropTarget_DragOver_Stub, "IDropTarget_DragOver_Stub"); 
                                                            -- ole2.h:4489
    pragma Import(Stdcall, IDropTarget_DragLeave_Proxy,
                     "IDropTarget_DragLeave_Proxy");        -- ole2.h:4496
    pragma Import(Stdcall, IDropTarget_DragLeave_Stub, "IDropTarget_DragLeave_Stub"); 
                                                            -- ole2.h:4500
    pragma Import(Stdcall, IDropTarget_Drop_Proxy, "IDropTarget_Drop_Proxy");
                                                            -- ole2.h:4507
    pragma Import(Stdcall, IDropTarget_Drop_Stub, "IDropTarget_Drop_Stub"); 
                                                            -- ole2.h:4515
    pragma Import(Stdcall, IEnumOLEVERB_RemoteNext_Proxy,
                     "IEnumOLEVERB_RemoteNext_Proxy");      -- ole2.h:4656
    pragma Import(Stdcall, IEnumOLEVERB_RemoteNext_Stub, 
                     "IEnumOLEVERB_RemoteNext_Stub");       -- ole2.h:4663 
    pragma Import(Stdcall, IEnumOLEVERB_Skip_Proxy, "IEnumOLEVERB_Skip_Proxy");
                                                            -- ole2.h:4670
    pragma Import(Stdcall, IEnumOLEVERB_Skip_Stub, "IEnumOLEVERB_Skip_Stub"); 
                                                            -- ole2.h:4675
    pragma Import(Stdcall, IEnumOLEVERB_Reset_Proxy, "IEnumOLEVERB_Reset_Proxy");
                                                            -- ole2.h:4682
    pragma Import(Stdcall, IEnumOLEVERB_Reset_Stub, "IEnumOLEVERB_Reset_Stub"); 
                                                            -- ole2.h:4686
    pragma Import(Stdcall, IEnumOLEVERB_Clone_Proxy, "IEnumOLEVERB_Clone_Proxy");
                                                            -- ole2.h:4693
    pragma Import(Stdcall, IEnumOLEVERB_Clone_Stub, "IEnumOLEVERB_Clone_Stub"); 
                                                            -- ole2.h:4698
    pragma Import(Stdcall, UINT_to_xmit, "UINT_to_xmit");         -- ole2.h:4712
    pragma Import(Stdcall, UINT_from_xmit, "UINT_from_xmit");     -- ole2.h:4713
    pragma Import(Stdcall, UINT_free_inst, "UINT_free_inst");     -- ole2.h:4714
    pragma Import(Stdcall, UINT_free_xmit, "UINT_free_xmit");     -- ole2.h:4715
    pragma Import(Stdcall, WPARAM_to_xmit, "WPARAM_to_xmit");     -- ole2.h:4716
    pragma Import(Stdcall, WPARAM_from_xmit, "WPARAM_from_xmit"); -- ole2.h:4717
    pragma Import(Stdcall, WPARAM_free_inst, "WPARAM_free_inst"); -- ole2.h:4718
    pragma Import(Stdcall, WPARAM_free_xmit, "WPARAM_free_xmit"); -- ole2.h:4719
    pragma Import(Stdcall, HWND_to_xmit, "HWND_to_xmit");         -- ole2.h:4720
    pragma Import(Stdcall, HWND_from_xmit, "HWND_from_xmit");     -- ole2.h:4721
    pragma Import(Stdcall, HWND_free_inst, "HWND_free_inst");     -- ole2.h:4722
    pragma Import(Stdcall, HWND_free_xmit, "HWND_free_xmit");     -- ole2.h:4723
    pragma Import(Stdcall, HMENU_to_xmit, "HMENU_to_xmit");       -- ole2.h:4724
    pragma Import(Stdcall, HMENU_from_xmit, "HMENU_from_xmit");   -- ole2.h:4725
    pragma Import(Stdcall, HMENU_free_inst, "HMENU_free_inst");   -- ole2.h:4726
    pragma Import(Stdcall, HMENU_free_xmit, "HMENU_free_xmit");   -- ole2.h:4727
    pragma Import(Stdcall, HACCEL_to_xmit, "HACCEL_to_xmit");     -- ole2.h:4728
    pragma Import(Stdcall, HACCEL_from_xmit, "HACCEL_from_xmit"); -- ole2.h:4729
    pragma Import(Stdcall, HACCEL_free_inst, "HACCEL_free_inst"); -- ole2.h:4730
    pragma Import(Stdcall, HACCEL_free_xmit, "HACCEL_free_xmit"); -- ole2.h:4731
    pragma Import(Stdcall, HOLEMENU_to_xmit, "HOLEMENU_to_xmit"); -- ole2.h:4732
    pragma Import(Stdcall, HOLEMENU_from_xmit, "HOLEMENU_from_xmit");
                                                            -- ole2.h:4733
    pragma Import(Stdcall, HOLEMENU_free_inst, "HOLEMENU_free_inst");
                                                            -- ole2.h:4734
    pragma Import(Stdcall, HOLEMENU_free_xmit, "HOLEMENU_free_xmit");
                                                            -- ole2.h:4735
    pragma Import(Stdcall, IOleItemContainer_GetObject_Proxy,
                     "IOleItemContainer_GetObject_Proxy");  -- ole2.h:4736
    pragma Import(Stdcall, IOleItemContainer_GetObject_Stub,
                     "IOleItemContainer_GetObject_Stub");   -- ole2.h:4745
    pragma Import(Stdcall, IOleItemContainer_GetObjectStorage_Proxy,
                     "IOleItemContainer_GetObjectStorage_Proxy");
                                                            -- ole2.h:4753
    pragma Import(Stdcall, IOleItemContainer_GetObjectStorage_Stub,
                     "IOleItemContainer_GetObjectStorage_Stub");
                                                            -- ole2.h:4761
    pragma Import(Stdcall, IOleInPlaceActiveObject_TranslateAccelerator_Proxy,
                     "IOleInPlaceActiveObject_TranslateAccelerator_Proxy");
                                                            -- ole2.h:4768
    pragma Import(Stdcall, IOleInPlaceActiveObject_TranslateAccelerator_Stub,
                     "IOleInPlaceActiveObject_TranslateAccelerator_Stub");
                                                            -- ole2.h:4773
    pragma Import(Stdcall, IOleInPlaceActiveObject_ResizeBorder_Proxy,
                     "IOleInPlaceActiveObject_ResizeBorder_Proxy");
                                                            -- ole2.h:4776
    pragma Import(Stdcall, IOleInPlaceActiveObject_ResizeBorder_Stub,
                     "IOleInPlaceActiveObject_ResizeBorder_Stub");
                                                            -- ole2.h:4783
    pragma Import(Stdcall, IEnumOLEVERB_Next_Proxy, "IEnumOLEVERB_Next_Proxy");
                                                            -- ole2.h:4790
    pragma Import(Stdcall, IEnumOLEVERB_Next_Stub, "IEnumOLEVERB_Next_Stub");
                                                            -- ole2.h:4797
    pragma Import(Stdcall, OleBuildVersion, "OleBuildVersion");   -- ole2.h:4829
    pragma Import(Stdcall, ReadClassStg, "ReadClassStg");         -- ole2.h:4832
    pragma Import(Stdcall, WriteClassStg, "WriteClassStg");       -- ole2.h:4833
    pragma Import(Stdcall, ReadClassStm, "ReadClassStm");         -- ole2.h:4834
    pragma Import(Stdcall, WriteClassStm, "WriteClassStm");       -- ole2.h:4835
    pragma Import(Stdcall, WriteFmtUserTypeStg, "WriteFmtUserTypeStg");
                                                            -- ole2.h:4836
    pragma Import(Stdcall, ReadFmtUserTypeStg, "ReadFmtUserTypeStg");
                                                            -- ole2.h:4837
    pragma Import(Stdcall, OleInitialize, "OleInitialize");       -- ole2.h:4842
    pragma Import(Stdcall, OleUninitialize, "OleUninitialize");   -- ole2.h:4843
    pragma Import(Stdcall, OleQueryLinkFromData, "OleQueryLinkFromData");
                                                            -- ole2.h:4849
    pragma Import(Stdcall, OleQueryCreateFromData, "OleQueryCreateFromData");
                                                            -- ole2.h:4850
    pragma Import(Stdcall, OleCreate, "OleCreate");               -- ole2.h:4855
    pragma Import(Stdcall, OleCreateFromData, "OleCreateFromData");
                                                            -- ole2.h:4859
    pragma Import(Stdcall, OleCreateLinkFromData, "OleCreateLinkFromData");
                                                            -- ole2.h:4864
    pragma Import(Stdcall, OleCreateStaticFromData, "OleCreateStaticFromData");
                                                            -- ole2.h:4869
    pragma Import(Stdcall, OleCreateLink, "OleCreateLink");       -- ole2.h:4875
    pragma Import(Stdcall, OleCreateLinkToFile, "OleCreateLinkToFile");
                                                            -- ole2.h:4879
    pragma Import(Stdcall, OleCreateFromFile, "OleCreateFromFile");
                                                            -- ole2.h:4883
    pragma Import(Stdcall, OleLoad, "OleLoad");                   -- ole2.h:4887
    pragma Import(Stdcall, OleSave, "OleSave");                   -- ole2.h:4890
    pragma Import(Stdcall, OleLoadFromStream, "OleLoadFromStream");
                                                            -- ole2.h:4892
    pragma Import(Stdcall, OleSaveToStream, "OleSaveToStream");   -- ole2.h:4893
    pragma Import(Stdcall, OleSetContainedObject, "OleSetContainedObject");
                                                            -- ole2.h:4896
    pragma Import(Stdcall, OleNoteObjectVisible, "OleNoteObjectVisible");
                                                            -- ole2.h:4897
    pragma Import(Stdcall, RegisterDragDrop, "RegisterDragDrop"); -- ole2.h:4902
    pragma Import(Stdcall, RevokeDragDrop, "RevokeDragDrop");     -- ole2.h:4903
    pragma Import(Stdcall, DoDragDrop, "DoDragDrop");             -- ole2.h:4904
    pragma Import(Stdcall, OleSetClipboard, "OleSetClipboard");   -- ole2.h:4909
    pragma Import(Stdcall, OleGetClipboard, "OleGetClipboard");   -- ole2.h:4910
    pragma Import(Stdcall, OleFlushClipboard, "OleFlushClipboard");
                                                            -- ole2.h:4911
    pragma Import(Stdcall, OleIsCurrentClipboard, "OleIsCurrentClipboard");
                                                            -- ole2.h:4912
    pragma Import(Stdcall, OleCreateMenuDescriptor, "OleCreateMenuDescriptor");
                                                            -- ole2.h:4917
    pragma Import(Stdcall, OleSetMenuDescriptor, "OleSetMenuDescriptor");
                                                            -- ole2.h:4919
    pragma Import(Stdcall, OleDestroyMenuDescriptor, "OleDestroyMenuDescriptor");
                                                            -- ole2.h:4923
    pragma Import(Stdcall, OleTranslateAccelerator, "OleTranslateAccelerator");
                                                            -- ole2.h:4925
    pragma Import(Stdcall, OleDuplicateData, "OleDuplicateData"); -- ole2.h:4930
    pragma Import(Stdcall, OleDraw, "OleDraw");                   -- ole2.h:4933
    pragma Import(Stdcall, OleRun, "OleRun");                     -- ole2.h:4936
    pragma Import(Stdcall, OleIsRunning, "OleIsRunning");         -- ole2.h:4937
    pragma Import(Stdcall, OleLockRunning, "OleLockRunning");     -- ole2.h:4938
    pragma Import(Stdcall, ReleaseStgMedium, "ReleaseStgMedium"); -- ole2.h:4939
    pragma Import(Stdcall, CreateOleAdviseHolder, "CreateOleAdviseHolder");
                                                            -- ole2.h:4940
    pragma Import(Stdcall, OleCreateDefaultHandler, "OleCreateDefaultHandler");
                                                            -- ole2.h:4942
    pragma Import(Stdcall, OleCreateEmbeddingHelper, "OleCreateEmbeddingHelper");
                                                            -- ole2.h:4945
    pragma Import(Stdcall, IsAccelerator, "IsAccelerator");       -- ole2.h:4949
    pragma Import(Stdcall, OleGetIconOfFile, "OleGetIconOfFile"); -- ole2.h:4953
    pragma Import(Stdcall, OleGetIconOfClass, "OleGetIconOfClass");
                                                            -- ole2.h:4955
    pragma Import(Stdcall, OleMetafilePictFromIconAndLabel, 
                     "OleMetafilePictFromIconAndLabel");    -- ole2.h:4958
    pragma Import(Stdcall, OleRegGetUserType, "OleRegGetUserType");
                                                            -- ole2.h:4965
    pragma Import(Stdcall, OleRegGetMiscStatus, "OleRegGetMiscStatus");
                                                            -- ole2.h:4968
    pragma Import(Stdcall, OleRegEnumFormatEtc, "OleRegEnumFormatEtc");
                                                            -- ole2.h:4971
    pragma Import(Stdcall, OleRegEnumVerbs, "OleRegEnumVerbs");   -- ole2.h:4974
    pragma Import(Stdcall, OleConvertOLESTREAMToIStorage, 
                     "OleConvertOLESTREAMToIStorage");      -- ole2.h:4999
    pragma Import(Stdcall, OleConvertIStorageToOLESTREAM, 
                     "OleConvertIStorageToOLESTREAM");      -- ole2.h:5004
    pragma Import(Stdcall, GetHGlobalFromILockBytes, "GetHGlobalFromILockBytes");
                                                            -- ole2.h:5010
    pragma Import(Stdcall, CreateILockBytesOnHGlobal, "CreateILockBytesOnHGlobal");
                                                            -- ole2.h:5011
    pragma Import(Stdcall, GetHGlobalFromStream, "GetHGlobalFromStream");
                                                            -- ole2.h:5014
    pragma Import(Stdcall, CreateStreamOnHGlobal, "CreateStreamOnHGlobal");
                                                            -- ole2.h:5015
    pragma Import(Stdcall, OleDoAutoConvert, "OleDoAutoConvert"); -- ole2.h:5021
    pragma Import(Stdcall, OleGetAutoConvert, "OleGetAutoConvert");
                                                            -- ole2.h:5022
    pragma Import(Stdcall, OleSetAutoConvert, "OleSetAutoConvert");
                                                            -- ole2.h:5023
    pragma Import(Stdcall, GetConvertStg, "GetConvertStg");       -- ole2.h:5024
    pragma Import(Stdcall, SetConvertStg, "SetConvertStg");       -- ole2.h:5025
    pragma Import(Stdcall, OleConvertIStorageToOLESTREAMEx,
                     "OleConvertIStorageToOLESTREAMEx");    -- ole2.h:5028
    pragma Import(Stdcall, OleConvertOLESTREAMToIStorageEx,
                     "OleConvertOLESTREAMToIStorageEx");    -- ole2.h:5038

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

end Win32.Ole2;
