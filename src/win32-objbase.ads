--  $Source : /nile.c/cvs/Dev/NT/Win32Ada/src/win32-objbase.ads, v $
--  $Revision : 1.0 $ $Date : 1998/02/09 15 :50 :09 $ $Author : obry $
--  See end of file for Copyright (c) information.

with Win32.Rpcdce;
with Win32.Rpcdcep;
with Win32.Winbase;
with Win32.Windef;
with Win32.Winerror;
with Win32.Winnt;

package Win32.Objbase is


   MARSHALINTERFACE_MIN            : constant :=  500;       --  objbase.h :274
   CWCSTORAGENAME                  : constant :=  32;        --  objbase.h :284
   STGM_DIRECT                     : constant :=  16#0#;     --  objbase.h :287
   STGM_TRANSACTED                 : constant :=  16#10000#; --  objbase.h :288
   STGM_READ                       : constant :=  16#0#;     --  objbase.h :290
   STGM_WRITE                      : constant :=  16#1#;     --  objbase.h :291
   STGM_READWRITE                  : constant :=  16#2#;     --  objbase.h :292
   STGM_SHARE_DENY_NONE            : constant :=  16#40#;    --  objbase.h :294
   STGM_SHARE_DENY_READ            : constant :=  16#30#;    --  objbase.h :295
   STGM_SHARE_DENY_WRITE           : constant :=  16#20#;    --  objbase.h :296
   STGM_SHARE_EXCLUSIVE            : constant :=  16#10#;    --  objbase.h :297
   STGM_PRIORITY                   : constant :=  16#40000#; --  objbase.h :299
   STGM_DELETEONRELEASE            : constant :=  16#4000000#;
   --  objbase.h:300
   STGM_CREATE                     : constant :=  16#1000#;  --  objbase.h :302
   STGM_CONVERT                    : constant :=  16#20000#; --  objbase.h :303
   STGM_FAILIFTHERE                : constant :=  16#0#;     --  objbase.h :304
   ROTFLAGS_REGISTRATIONKEEPSALIVE : constant :=  1;        --  objbase.h :1013


   type REGCLS is ( --  objbase.h :264
     REGCLS_SINGLEUSE,                                   --  objbase.h :266
     REGCLS_MULTIPLEUSE,                                 --  objbase.h :267
     REGCLS_MULTI_SEPARATE                               --  objbase.h :271
                  );
   for REGCLS'Size use 32;                                 --  objbase.h :264

   type OLECHAR is new Win32.WCHAR;                        --  objbase.h :728
   subtype SCODE is Win32.Winerror.SCODE;                  --  objbase.h :907
   subtype HRESULT is Win32.Winerror.HRESULT;              --  objbase.h :910

   subtype STDAPI   is HRESULT;                            --  objbase.h :61
   subtype STDMETHODIMP  is HRESULT;                       --  objbase.h :64
   subtype STDAPIV  is HRESULT;                            --  objbase.h :69
   subtype STDMETHODIMPV  is HRESULT;                      --  objbase.h :72
   subtype WINOLEAPI  is HRESULT;                          --  objbase.h :79



   type MEMCTX is ( --  objbase.h :1003
     MEMCTX_SAME,                                        --  objbase.h :1009
     MEMCTX_UNKNOWN,                                     --  objbase.h :1007
     MEMCTX_TASK,                                        --  objbase.h :1004
     MEMCTX_SHARED,                                      --  objbase.h :1005
     MEMCTX_MACSYSTEM                                    --  objbase.h :1006
                  );
   for MEMCTX use ( --  objbase.h :1003
      MEMCTX_SAME => -2,                                  --  objbase.h :1009
      MEMCTX_UNKNOWN => -1,                               --  objbase.h :1007
      MEMCTX_TASK => 1,                                   --  objbase.h :1004
      MEMCTX_SHARED => 2,                                 --  objbase.h :1005
      MEMCTX_MACSYSTEM => 3                               --  objbase.h :1006
                  );
   for MEMCTX'Size use 32;                                 --  objbase.h :1003

   type CLSCTX is ( --  objbase.h :1017
     CLSCTX_INPROC_SERVER,                               --  objbase.h :1018
     CLSCTX_INPROC_HANDLER,                              --  objbase.h :1019
     CLSCTX_LOCAL_SERVER,                                --  objbase.h :1020
     CLSCTX_INPROC_SERVER16                              --  objbase.h :1022
                  );
   for CLSCTX use ( --  objbase.h :1017
      CLSCTX_INPROC_SERVER => 1,                          --  objbase.h :1018
      CLSCTX_INPROC_HANDLER => 2,                         --  objbase.h :1019
      CLSCTX_LOCAL_SERVER => 4,                           --  objbase.h :1020
      CLSCTX_INPROC_SERVER16 => 8                         --  objbase.h :1022
                  );
   for CLSCTX'Size use 32;                                 --  objbase.h :1017
   function "or"(l, r : Interfaces.C.unsigned)
                return Interfaces.C.unsigned
     renames Interfaces.C."or";


   type MSHLFLAGS is ( --  objbase.h :1026
     MSHLFLAGS_NORMAL,                                   --  objbase.h :1027
     MSHLFLAGS_TABLESTRONG,                              --  objbase.h :1028
     MSHLFLAGS_TABLEWEAK                                 --  objbase.h :1030
                     );
   for MSHLFLAGS'Size use 32;                              --  objbase.h :1026

   type MSHCTX is ( --  objbase.h :1034
     MSHCTX_LOCAL,                                       --  objbase.h :1035
     MSHCTX_NOSHAREDMEM,                                 --  objbase.h :1036
     MSHCTX_DIFFERENTMACHINE                             --  objbase.h :1038
                  );
   for MSHCTX'Size use 32;                                 --  objbase.h :1034

   type DVASPECT is ( --  objbase.h :1042
     DVASPECT_CONTENT,                                   --  objbase.h :1043
     DVASPECT_THUMBNAIL,                                 --  objbase.h :1044
     DVASPECT_ICON,                                      --  objbase.h :1045
     DVASPECT_DOCPRINT                                   --  objbase.h :1047
                    );
   for DVASPECT use ( --  objbase.h :1042
      DVASPECT_CONTENT => 1,                              --  objbase.h :1043
      DVASPECT_THUMBNAIL => 2,                            --  objbase.h :1044
      DVASPECT_ICON => 4,                                 --  objbase.h :1045
      DVASPECT_DOCPRINT => 8                              --  objbase.h :1047
                    );
   for DVASPECT'Size use 32;                               --  objbase.h :1042

   type STGC is ( --  objbase.h :1051
     STGC_DEFAULT,                                       --  objbase.h :1052
     STGC_OVERWRITE,                                     --  objbase.h :1053
     STGC_ONLYIFCURRENT,                                 --  objbase.h :1054
     STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE             --  objbase.h :1056
                );
   for STGC use ( --  objbase.h :1051
      STGC_DEFAULT => 0,                                  --  objbase.h :1052
      STGC_OVERWRITE => 1,                                --  objbase.h :1053
      STGC_ONLYIFCURRENT => 2,                            --  objbase.h :1054
      STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE => 4        --  objbase.h :1056
                );
   for STGC'Size use 32;                                   --  objbase.h :1051

   type STGMOVE is ( --  objbase.h :1060
     STGMOVE_MOVE,                                       --  objbase.h :1061
     STGMOVE_COPY                                        --  objbase.h :1063
                   );
   for STGMOVE'Size use 32;                                --  objbase.h :1060

   type STATFLAG is ( --  objbase.h :1067
     STATFLAG_DEFAULT,                                   --  objbase.h :1068
     STATFLAG_NONAME                                     --  objbase.h :1070
                    );
   for STATFLAG'Size use 32;                               --  objbase.h :1067

   type EXTCONN is ( --  objbase.h :2232
     EXTCONN_STRONG,                                     --  objbase.h :2233
     EXTCONN_WEAK,                                       --  objbase.h :2234
     EXTCONN_CALLABLE                                    --  objbase.h :2236
                   );
   for EXTCONN use ( --  objbase.h :2232
      EXTCONN_STRONG => 1,                                --  objbase.h :2233
      EXTCONN_WEAK => 2,                                  --  objbase.h :2234
      EXTCONN_CALLABLE => 4                               --  objbase.h :2236
                   );
   for EXTCONN'Size use 32;                                --  objbase.h :2232

   type BIND_FLAGS is ( --  objbase.h :2665
     BIND_MAYBOTHERUSER,                                 --  objbase.h :2666
     BIND_JUSTTESTEXISTENCE                              --  objbase.h :2668
                      );
   for BIND_FLAGS use ( --  objbase.h :2665
      BIND_MAYBOTHERUSER => 1,                            --  objbase.h :2666
      BIND_JUSTTESTEXISTENCE => 2                         --  objbase.h :2668
                      );
   for BIND_FLAGS'Size use 32;                             --  objbase.h :2665

   type MKSYS is ( --  objbase.h :3928
     MKSYS_NONE,                                         --  objbase.h :3929
     MKSYS_GENERICCOMPOSITE,                             --  objbase.h :3930
     MKSYS_FILEMONIKER,                                  --  objbase.h :3931
     MKSYS_ANTIMONIKER,                                  --  objbase.h :3932
     MKSYS_ITEMMONIKER,                                  --  objbase.h :3933
     MKSYS_POINTERMONIKER                                --  objbase.h :3935
                 );
   for MKSYS'Size use 32;                                  --  objbase.h :3928

   type MKREDUCE is ( --  objbase.h :3939
     MKRREDUCE_ALL,                                      --  objbase.h :3944
     MKRREDUCE_THROUGHUSER,                              --  objbase.h :3942
     MKRREDUCE_TOUSER,                                   --  objbase.h :3941
     MKRREDUCE_ONE                                       --  objbase.h :3940
                    );
   for MKREDUCE use ( --  objbase.h :3939
      MKRREDUCE_ALL => 0,                                 --  objbase.h :3944
      MKRREDUCE_THROUGHUSER => 65536,                     --  objbase.h :3942
      MKRREDUCE_TOUSER => 131072,                         --  objbase.h :3941
      MKRREDUCE_ONE => 196608                             --  objbase.h :3940
                    );
   for MKREDUCE'Size use 32;                               --  objbase.h :3939

   type STGTY is ( --  objbase.h :4640
     STGTY_STORAGE,                                      --  objbase.h :4641
     STGTY_STREAM,                                       --  objbase.h :4642
     STGTY_LOCKBYTES,                                    --  objbase.h :4643
     STGTY_PROPERTY                                      --  objbase.h :4645
                 );
   for STGTY use ( --  objbase.h :4640
      STGTY_STORAGE => 1,                                 --  objbase.h :4641
      STGTY_STREAM => 2,                                  --  objbase.h :4642
      STGTY_LOCKBYTES => 3,                               --  objbase.h :4643
      STGTY_PROPERTY => 4                                 --  objbase.h :4645
                 );
   for STGTY'Size use 32;                                  --  objbase.h :4640

   type STREAM_SEEK is ( --  objbase.h :4649
     STREAM_SEEK_SET,                                    --  objbase.h :4650
     STREAM_SEEK_CUR,                                    --  objbase.h :4651
     STREAM_SEEK_END                                     --  objbase.h :4653
                       );
   for STREAM_SEEK'Size use 32;                            --  objbase.h :4649

   type LOCKTYPE is ( --  objbase.h :4657
     LOCK_WRITE,                                         --  objbase.h :4658
     LOCK_EXCLUSIVE,                                     --  objbase.h :4659
     LOCK_ONLYONCE                                       --  objbase.h :4661
                    );
   for LOCKTYPE use ( --  objbase.h :4657
      LOCK_WRITE => 1,                                    --  objbase.h :4658
      LOCK_EXCLUSIVE => 2,                                --  objbase.h :4659
      LOCK_ONLYONCE => 4                                  --  objbase.h :4661
                    );
   for LOCKTYPE'Size use 32;                               --  objbase.h :4657

   type CLIPFORMAT is new Win32.WORD;                      --  objbase.h :6365

   type ADVF is ( --  objbase.h :6549
     ADVF_NODATA,                                        --  objbase.h :6550
     ADVF_PRIMEFIRST,                                    --  objbase.h :6551
     ADVF_ONLYONCE,                                      --  objbase.h :6552
     ADVFCACHE_NOHANDLER,                                --  objbase.h :6554
     ADVFCACHE_FORCEBUILTIN,                             --  objbase.h :6555
     ADVFCACHE_ONSAVE,                                   --  objbase.h :6557
     ADVF_DATAONSTOP                                     --  objbase.h :6553
                );
   for ADVF use ( --  objbase.h :6549
      ADVF_NODATA => 1,                                   --  objbase.h :6550
      ADVF_PRIMEFIRST => 2,                               --  objbase.h :6551
      ADVF_ONLYONCE => 4,                                 --  objbase.h :6552
      ADVFCACHE_NOHANDLER => 8,                           --  objbase.h :6554
      ADVFCACHE_FORCEBUILTIN => 16,                       --  objbase.h :6555
      ADVFCACHE_ONSAVE => 32,                             --  objbase.h :6557
      ADVF_DATAONSTOP => 64                               --  objbase.h :6553
                );
   for ADVF'Size use 32;                                   --  objbase.h :6549

   type TYMED is ( --  objbase.h :6832
     TYMED_NULL,                                         --  objbase.h :6841
     TYMED_HGLOBAL,                                      --  objbase.h :6833
     TYMED_FILE,                                         --  objbase.h :6834
     TYMED_ISTREAM,                                      --  objbase.h :6835
     TYMED_ISTORAGE,                                     --  objbase.h :6836
     TYMED_GDI,                                          --  objbase.h :6837
     TYMED_MFPICT,                                       --  objbase.h :6838
     TYMED_ENHMF                                         --  objbase.h :6839
                 );
   for TYMED use ( --  objbase.h :6832
      TYMED_NULL => 0,                                    --  objbase.h :6841
      TYMED_HGLOBAL => 1,                                 --  objbase.h :6833
      TYMED_FILE => 2,                                    --  objbase.h :6834
      TYMED_ISTREAM => 4,                                 --  objbase.h :6835
      TYMED_ISTORAGE => 8,                                --  objbase.h :6836
      TYMED_GDI => 16,                                    --  objbase.h :6837
      TYMED_MFPICT => 32,                                 --  objbase.h :6838
      TYMED_ENHMF => 64                                   --  objbase.h :6839
                 );
   for TYMED'Size use 32;                                  --  objbase.h :6832

   type DATADIR is ( --  objbase.h :7209
     DATADIR_GET,                                        --  objbase.h :7210
     DATADIR_SET                                         --  objbase.h :7212
                   );
   for DATADIR use ( --  objbase.h :7209
      DATADIR_GET => 1,                                   --  objbase.h :7210
      DATADIR_SET => 2                                    --  objbase.h :7212
                   );
   for DATADIR'Size use 32;                                --  objbase.h :7209

   type CALLTYPE is ( --  objbase.h :7693
     CALLTYPE_TOPLEVEL,                                  --  objbase.h :7694
     CALLTYPE_NESTED,                                    --  objbase.h :7695
     CALLTYPE_ASYNC,                                     --  objbase.h :7696
     CALLTYPE_TOPLEVEL_CALLPENDING,                      --  objbase.h :7697
     CALLTYPE_ASYNC_CALLPENDING                          --  objbase.h :7699
                    );
   for CALLTYPE use ( --  objbase.h :7693
      CALLTYPE_TOPLEVEL => 1,                             --  objbase.h :7694
      CALLTYPE_NESTED => 2,                               --  objbase.h :7695
      CALLTYPE_ASYNC => 3,                                --  objbase.h :7696
      CALLTYPE_TOPLEVEL_CALLPENDING => 4,                 --  objbase.h :7697
      CALLTYPE_ASYNC_CALLPENDING => 5                     --  objbase.h :7699
                    );
   for CALLTYPE'Size use 32;                               --  objbase.h :7693

   type SERVERCALL is ( --  objbase.h :7703
     SERVERCALL_ISHANDLED,                               --  objbase.h :7704
     SERVERCALL_REJECTED,                                --  objbase.h :7705
     SERVERCALL_RETRYLATER                               --  objbase.h :7707
                      );
   for SERVERCALL'Size use 32;                             --  objbase.h :7703

   type PENDINGTYPE is ( --  objbase.h :7711
     PENDINGTYPE_TOPLEVEL,                               --  objbase.h :7712
     PENDINGTYPE_NESTED                                  --  objbase.h :7714
                       );
   for PENDINGTYPE use ( --  objbase.h :7711
      PENDINGTYPE_TOPLEVEL => 1,                          --  objbase.h :7712
      PENDINGTYPE_NESTED => 2                             --  objbase.h :7714
                       );
   for PENDINGTYPE'Size use 32;                            --  objbase.h :7711

   type PENDINGMSG is ( --  objbase.h :7718
     PENDINGMSG_CANCELCALL,                              --  objbase.h :7719
     PENDINGMSG_WAITNOPROCESS,                           --  objbase.h :7720
     PENDINGMSG_WAITDEFPROCESS                           --  objbase.h :7722
                      );
   for PENDINGMSG'Size use 32;                             --  objbase.h :7718

   type RPCOLEDATAREP is new Win32.UINT;                   --  objbase.h :7893

   subtype HMETAFILEPICT is Win32.Winnt.HANDLE;           --  objbase.h :349
   type LPOLESTR is access all OLECHAR;                    --  objbase.h :731
   type LPCOLESTR is access all OLECHAR;              --  objbase.h :734
   type PSCODE is access all SCODE;                        --  objbase.h :913
   subtype HCONTEXT is Win32.Winnt.HANDLE;                --  objbase.h :1073
   type SNB_Extra is access all OLECHAR;                   --  objbase.h :5191
   type SNB is access all SNB_Extra;                       --  objbase.h :5192
   type LPCLIPFORMAT is access all CLIPFORMAT;             --  objbase.h :6368

   type RemHGLOBAL;                                        --  objbase.h :331
   type RemHMETAFILEPICT;                                  --  objbase.h :339
   type RemHENHMETAFILE;                                   --  objbase.h :352
   type RemHBITMAP;                                        --  objbase.h :359
   type RemHPALETTE;                                       --  objbase.h :366
   type RemBRUSH;                                          --  objbase.h :373
   type OBJECTID;                                          --  objbase.h :937
   type IUnknown;                                          --  objbase.h :1173
   type IClassFactory;                                     --  objbase.h :1179
   type IMarshal;                                          --  objbase.h :1185
   type IMalloc;                                           --  objbase.h :1191
   type IStdMarshalInfo;                                   --  objbase.h :1197
   type IExternalConnection;                               --  objbase.h :1203
   type IWeakRef;                                          --  objbase.h :1209
   type IEnumUnknown;                                      --  objbase.h :1215
   type IBindCtx;                                          --  objbase.h :1221
   type IParseDisplayName;                                 --  objbase.h :1227
   type IEnumMoniker;                                      --  objbase.h :1233
   type IRunnableObject;                                   --  objbase.h :1239
   type IRunningObjectTable;                               --  objbase.h :1245
   type IPersist;                                          --  objbase.h :1251
   type IPersistStream;                                    --  objbase.h :1257
   type IMoniker;                                          --  objbase.h :1263
   type IEnumString;                                       --  objbase.h :1269
   type IStream;                                           --  objbase.h :1275
   type IEnumSTATSTG;                                      --  objbase.h :1281
   type IStorage;                                          --  objbase.h :1287
   type IPersistFile;                                      --  objbase.h :1293
   type IPersistStorage;                                   --  objbase.h :1299
   type ILockBytes;                                        --  objbase.h :1305
   type IEnumFORMATETC;                                    --  objbase.h :1311
   type IEnumSTATDATA;                                     --  objbase.h :1317
   type IRootStorage;                                      --  objbase.h :1323
   type IAdviseSink;                                       --  objbase.h :1329
   type IAdviseSink2;                                      --  objbase.h :1335
   type IDataObject;                                       --  objbase.h :1341
   type IDataAdviseHolder;                                 --  objbase.h :1347
   type IMessageFilter;                                    --  objbase.h :1353
   type IRpcChannelBuffer;                                 --  objbase.h :1359
   type IRpcProxyBuffer;                                   --  objbase.h :1365
   type IPSFactoryBuffer;                                  --  objbase.h :1377
   type IUnknownVtbl;                                      --  objbase.h :1451
   type IClassFactoryVtbl;                                 --  objbase.h :1566
   type IMarshalVtbl;                                      --  objbase.h :1715
   type IMallocVtbl;                                       --  objbase.h :1954
   type IStdMarshalInfoVtbl;                               --  objbase.h :2146
   type IExternalConnectionVtbl;                           --  objbase.h :2259
   type IWeakRefVtbl;                                      --  objbase.h :2383
   type IEnumUnknownVtbl;                                  --  objbase.h :2509
   type BIND_OPTS;                                         --  objbase.h :2652
   type IBindCtxVtbl;                                      --  objbase.h :2713
   type IParseDisplayNameVtbl;                             --  objbase.h :2984
   type IEnumMonikerVtbl;                                  --  objbase.h :3095
   type IRunnableObjectVtbl;                               --  objbase.h :3261
   type IRunningObjectTableVtbl;                           --  objbase.h :3456
   type IPersistVtbl;                                      --  objbase.h :3677
   type IPersistStreamVtbl;                                --  objbase.h :3781
   type IMonikerVtbl;                                      --  objbase.h :4027
   type IEnumStringVtbl;                                   --  objbase.h :4483
   type STATSTG;                                           --  objbase.h :4623
   type IStreamVtbl;                                       --  objbase.h :4721
   type IEnumSTATSTGVtbl;                                  --  objbase.h :5042
   type RemSNB;                                            --  objbase.h :5182
   type IStorageVtbl;                                      --  objbase.h :5282
   type IPersistFileVtbl;                                  --  objbase.h :5720
   type IPersistStorageVtbl;                               --  objbase.h :5915
   type ILockBytesVtbl;                                    --  objbase.h :6139
   type DVTARGETDEVICE;                                    --  objbase.h :6354
   type FORMATETC;                                         --  objbase.h :6371
   type IEnumFORMATETCVtbl;                                --  objbase.h :6408
   type STATDATA;                                          --  objbase.h :6560
   type IEnumSTATDATAVtbl;                                 --  objbase.h :6596
   type IRootStorageVtbl;                                  --  objbase.h :6750
   type RemSTGMEDIUM;                                      --  objbase.h :6845
   type union_anonymous7_t;                                --  objbase.h :6867
   type STGMEDIUM;                                         --  objbase.h :6857
   type IAdviseSinkVtbl;                                   --  objbase.h :6920
   type IAdviseSink2Vtbl;                                  --  objbase.h :7091
   type IDataObjectVtbl;                                   --  objbase.h :7262
   type IDataAdviseHolderVtbl;                             --  objbase.h :7542
   type INTERFACEINFO;                                     --  objbase.h :7725
   type IMessageFilterVtbl;                                --  objbase.h :7763
   type RPCOLEMESSAGE;                                     --  objbase.h :7896
   type IRpcChannelBufferVtbl;                             --  objbase.h :7939
   type IRpcProxyBufferVtbl;                               --  objbase.h :8113
   type IRpcStubBufferVtbl;                                --  objbase.h :8239
   type IPSFactoryBufferVtbl;                              --  objbase.h :8451
   type IRpcStubBuffer;                                    --  objbase.h :8282

   type ac_RECTL_t is access all Win32.Windef.RECTL;  --  objbase.h :744
   type LPCRECTL is access all Win32.Windef.RECTL;    --  objbase.h :744
   type LPGUID is access all Win32.Rpcdce.GUID;            --  objbase.h :930
   subtype IID is Win32.Rpcdce.GUID;                       --  objbase.h :947
   type LPIID is access all IID;                           --  objbase.h :950
   type REFGUID is access all Win32.Rpcdce.GUID;      --  objbase.h :989
   type REFIID is access all IID;                     --  objbase.h :993
   subtype CLSID is Win32.Rpcdce.GUID;                     --  objbase.h :947
   type LPCLSID is access all CLSID;                       --  objbase.h :958
   type REFCLSID is access all CLSID;                 --  objbase.h :997
   type LPCRECT is access all Win32.Windef.RECT;      --  objbase.h :1082
   type a_RemHGLOBAL_t is access all RemHGLOBAL;           --  objbase.h :1084
   type a_RemHBITMAP_t is access all RemHBITMAP;           --  objbase.h :1088
   type a_RemHPALETTE_t is access all RemHPALETTE;         --  objbase.h :1092
   type a_RemHBRUSH_t is access all RemBRUSH;              --  objbase.h :1096
   type a_RemHMETAFILEPICT_t is access all RemHMETAFILEPICT;
   --  objbase.h :1100
   type a_RemHENHMETAFILE_t is access all RemHENHMETAFILE;
   --  objbase.h :1104
   type LPUNKNOWN is access all IUnknown;                  --  objbase.h :1429
   type a_IUnknownVtbl_t is access all IUnknownVtbl;       --  objbase.h :1469
   type a_IClassFactoryVtbl_t is access all IClassFactoryVtbl;
   --  objbase.h :1594
   type LPCLASSFACTORY is access all IClassFactory;        --  objbase.h :1544
   type LPMARSHAL is access all IMarshal;                  --  objbase.h :1666
   type a_IMarshalVtbl_t is access all IMarshalVtbl;       --  objbase.h :1774
   type LPMALLOC is access all IMalloc;                    --  objbase.h :1922
   type a_IMallocVtbl_t is access all IMallocVtbl;         --  objbase.h :1996
   type LPSTDMARSHALINFO is access all IStdMarshalInfo;    --  objbase.h :2127
   type a_IStdMarshalInfoVtbl_t is access all IStdMarshalInfoVtbl;
   --  objbase.h :2170
   type LPEXTERNALCONNECTION is access all IExternalConnection;
   --  objbase.h :2228
   type a_IExternalConnectionVtbl_t is access all IExternalConnectionVtbl;
   --  objbase.h :2288
   type LPWEAKREF is access all IWeakRef;                  --  objbase.h :2362
   type a_IWeakRefVtbl_t is access all IWeakRefVtbl;       --  objbase.h :2410
   type LPENUMUNKNOWN is access all IEnumUnknown;          --  objbase.h :2482
   type a_IEnumUnknownVtbl_t is access all IEnumUnknownVtbl;
   --  objbase.h :2544
   type LPBC is access all IBindCtx;                       --  objbase.h :2646
   type LPBINDCTX is access all IBindCtx;                  --  objbase.h :2649
   type LPBIND_OPTS is access all BIND_OPTS;               --  objbase.h :2661
   type a_IBindCtxVtbl_t is access all IBindCtxVtbl;       --  objbase.h :2772
   type LPPARSEDISPLAYNAME is access all IParseDisplayName; --  objbase.h :2964
   type a_IParseDisplayNameVtbl_t is access all IParseDisplayNameVtbl;
   --  objbase.h :3009
   type LPENUMMONIKER is access all IEnumMoniker;          --  objbase.h :3068
   type a_IEnumMonikerVtbl_t is access all IEnumMonikerVtbl;
   --  objbase.h :3130
   type LPRUNNABLEOBJECT is access all IRunnableObject;    --  objbase.h :3232
   type a_IRunnableObjectVtbl_t is access all IRunnableObjectVtbl;
   --  objbase.h :3299
   type LPRUNNINGOBJECTTABLE is access all IRunningObjectTable;
   --  objbase.h :3415
   type a_IRunningObjectTableVtbl_t is access all IRunningObjectTableVtbl;
   --  objbase.h :3508
   type LPPERSIST is access all IPersist;                  --  objbase.h :3660
   type a_IPersistVtbl_t is access all IPersistVtbl;       --  objbase.h :3699
   type LPPERSISTSTREAM is access all IPersistStream;      --  objbase.h :3755
   type a_IPersistStreamVtbl_t is access all IPersistStreamVtbl;
   --  objbase.h :3819
   type LPMONIKER is access all IMoniker;                  --  objbase.h :3924
   type a_IMonikerVtbl_t is access all IMonikerVtbl;       --  objbase.h :4149
   type LPENUMSTRING is access all IEnumString;            --  objbase.h :4456
   type a_IEnumStringVtbl_t is access all IEnumStringVtbl; --  objbase.h :4518
   type LPSTREAM is access all IStream;                    --  objbase.h :4620
   type a_IStreamVtbl_t is access all IStreamVtbl;         --  objbase.h :4796
   type LPENUMSTATSTG is access all IEnumSTATSTG;          --  objbase.h :5015
   type a_IEnumSTATSTGVtbl_t is access all IEnumSTATSTGVtbl;
   --  objbase.h :5077
   type LPSTORAGE is access all IStorage;                  --  objbase.h :5179
   type a_IStorageVtbl_t is access all IStorageVtbl;       --  objbase.h :5391
   type LPPERSISTFILE is access all IPersistFile;          --  objbase.h :5690
   type a_IPersistFileVtbl_t is access all IPersistFileVtbl;
   --  objbase.h :5763
   type LPPERSISTSTORAGE is access all IPersistStorage;    --  objbase.h :5884
   type a_IPersistStorageVtbl_t is access all IPersistStorageVtbl;
   --  objbase.h :5960
   type LPLOCKBYTES is access all ILockBytes;              --  objbase.h :6094
   type a_ILockBytesVtbl_t is access all ILockBytesVtbl;   --  objbase.h :6195
   type LPENUMFORMATETC is access all IEnumFORMATETC;      --  objbase.h :6351
   type a_DVTARGETDEVICE_t is access all DVTARGETDEVICE;   --  objbase.h :6374
   type LPFORMATETC is access all FORMATETC;               --  objbase.h :6381
   type a_IEnumFORMATETCVtbl_t is access all IEnumFORMATETCVtbl;
   --  objbase.h :6443
   type LPENUMSTATDATA is access all IEnumSTATDATA;        --  objbase.h :6545
   type LPSTATDATA is access all STATDATA;                 --  objbase.h :6569
   type a_IEnumSTATDATAVtbl_t is access all IEnumSTATDATAVtbl;
   --  objbase.h :6631
   type LPROOTSTORAGE is access all IRootStorage;          --  objbase.h :6733
   type a_IRootStorageVtbl_t is access all IRootStorageVtbl;
   --  objbase.h :6772
   type LPADVISESINK is access all IAdviseSink;            --  objbase.h :6828
   type LPSTGMEDIUM is access all STGMEDIUM;               --  objbase.h :6891
   type a_IAdviseSinkVtbl_t is access all IAdviseSinkVtbl;
   --  objbase.h :6958
   type a_RemSTGMEDIUM_t is access all RemSTGMEDIUM;
   --  objbase.h :7001
   type LPADVISESINK2 is access all IAdviseSink2;          --  objbase.h :7074
   type a_IAdviseSink2Vtbl_t is access all IAdviseSink2Vtbl;
   --  objbase.h :7133
   type LPDATAOBJECT is access all IDataObject;            --  objbase.h :7205
   type a_IDataObjectVtbl_t is access all IDataObjectVtbl; --  objbase.h :7325
   type LPDATAADVISEHOLDER is access all IDataAdviseHolder; --  objbase.h :7510
   type a_IDataAdviseHolderVtbl_t is access all IDataAdviseHolderVtbl;
   --  objbase.h :7582
   type LPMESSAGEFILTER is access all IMessageFilter;      --  objbase.h :7689
   type LPINTERFACEINFO is access all INTERFACEINFO;
   --  objbase.h :7733
   type a_IMessageFilterVtbl_t is access all IMessageFilterVtbl;
   --  objbase.h :7800
   type PRPCOLEMESSAGE is access all RPCOLEMESSAGE;        --  objbase.h :7908
   type a_IRpcChannelBufferVtbl is access all IRpcChannelBufferVtbl;
   --  objbase.h :7979
   type PIRpcProxyBuffer is access all IRpcProxyBuffer;    --  objbase.h :8465
   type a_IRpcProxyBufferVtbl_t is access all IRpcProxyBufferVtbl;
   --  objbase.h :8138
   type a_IRpcStubBufferVtbl is access all IRpcStubBufferVtbl;
   --  objbase.h :8284
   type a_IRpcStubBuffer_t is access all IRpcStubBuffer;   --  objbase.h :8332
   type a_IPSFactoryBufferVtbl_t is
     access all IPSFactoryBufferVtbl;                    --  objbase.h :8482
   type a_RemSNB_t is access all RemSNB;                   --  objbase.h :8549

   type af_1454_QueryInterface is access function
     (This : access IUnknown;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1454
   pragma Convention (Stdcall, af_1454_QueryInterface);

   type af_1459_AddRef is access function
     (This : access IUnknown)
     return Win32.ULONG;                          --  objbase.h :1459
   pragma Convention (Stdcall, af_1459_AddRef);

   type af_1462_Release is access function
     (This : access IUnknown)
     return Win32.ULONG;                          --  objbase.h :1462
   pragma Convention (Stdcall, af_1462_Release);

   type af_1569_QueryInterface is access function
     (This : access IClassFactory;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1569
   pragma Convention (Stdcall, af_1569_QueryInterface);

   type af_1574_AddRef is access function
     (This : access IClassFactory)
     return Win32.ULONG;                          --  objbase.h :1574
   pragma Convention (Stdcall, af_1574_AddRef);

   type af_1577_Release is access function
     (This : access IClassFactory)
     return Win32.ULONG;                          --  objbase.h :1577
   pragma Convention (Stdcall, af_1577_Release);

   type af_1580_CreateInstance is access function
     (This : access IClassFactory;
                      pUnkOuter : access IUnknown;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1580
   pragma Convention (Stdcall, af_1580_CreateInstance);

   type af_1586_LockServer is access function
     (This : access IClassFactory;
                      fLock : Win32.BOOL)
     return HRESULT;                              --  objbase.h :1586
   pragma Convention (Stdcall, af_1586_LockServer);

   type af_1718_QueryInterface is access function
     (This : access IMarshal;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1718
   pragma Convention (Stdcall, af_1718_QueryInterface);

   type af_1723_AddRef is access function
     (This : access IMarshal)
     return Win32.ULONG;                          --  objbase.h :1723
   pragma Convention (Stdcall, af_1723_AddRef);

   type af_1726_Release is access function
     (This : access IMarshal)
     return Win32.ULONG;                          --  objbase.h :1726
   pragma Convention (Stdcall, af_1726_Release);

   type af_1729_GetUnmarshalClass is access function
     (This : access IMarshal;
                      riid : REFIID;
                      pv : Win32.PVOID;
                      dwDestContext : Win32.DWORD;
                      pvDestContext : Win32.PVOID;
                      mshlflags : Win32.DWORD;
                      pCid : access CLSID)
     return HRESULT;                              --  objbase.h :1729
   pragma Convention (Stdcall, af_1729_GetUnmarshalClass);

   type af_1738_GetMarshalSizeMax is access function
     (This : access IMarshal;
                      riid : REFIID;
                      pv : Win32.PVOID;
                      dwDestContext : Win32.DWORD;
                      pvDestContext : Win32.PVOID;
                      mshlflags : Win32.DWORD;
                      pSize : access Win32.DWORD)
     return HRESULT;                              --  objbase.h :1738
   pragma Convention (Stdcall, af_1738_GetMarshalSizeMax);

   type af_1747_MarshalInterface is access function
     (This : access IMarshal;
                      pStm : access IStream;
                      riid : REFIID;
                      pv : Win32.PVOID;
                      dwDestContext : Win32.DWORD;
                      pvDestContext : Win32.PVOID;
                      mshlflags : Win32.DWORD)
     return HRESULT;                              --  objbase.h :1747
   pragma Convention (Stdcall, af_1747_MarshalInterface);

   type af_1756_UnmarshalInterface is access function
     (This : access IMarshal;
                      pStm : access IStream;
                      riid : REFIID;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1756
   pragma Convention (Stdcall, af_1756_UnmarshalInterface);

   type af_1762_ReleaseMarshalData is access function
     (This : access IMarshal;
                      pStm : access IStream)
     return HRESULT;                              --  objbase.h :1762
   pragma Convention (Stdcall, af_1762_ReleaseMarshalData);

   type af_1766_DisconnectObject is access function
     (This : access IMarshal;
                      dwReserved : Win32.DWORD)
     return HRESULT;                              --  objbase.h :1766
   pragma Convention (Stdcall, af_1766_DisconnectObject);

   type af_1957_QueryInterface is access function
     (This : access IMalloc;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1957
   pragma Convention (Stdcall, af_1957_QueryInterface);

   type af_1962_AddRef is access function
     (This : access IMalloc)
     return Win32.ULONG;                          --  objbase.h :1962
   pragma Convention (Stdcall, af_1962_AddRef);

   type af_1965_Release is access function
     (This : access IMalloc)
     return Win32.ULONG;                          --  objbase.h :1965
   pragma Convention (Stdcall, af_1965_Release);

   type af_1968_Alloc is access function
     (This : access IMalloc;
                      cb : Win32.ULONG)
     return Win32.PVOID;                          --  objbase.h :1968
   pragma Convention (Stdcall, af_1968_Alloc);

   type af_1972_Realloc is access function
     (This : access IMalloc;
                      pv : Win32.PVOID;
                      cb : Win32.ULONG)
     return Win32.PVOID;                          --  objbase.h :1972
   pragma Convention (Stdcall, af_1972_Realloc);

   type ap_1977_Free is access procedure
     (This : access IMalloc;
                      pv : Win32.PVOID);                    --  objbase.h :1977
   pragma Convention (Stdcall, ap_1977_Free);

   type af_1981_GetSize is access function
     (This : access IMalloc;
                      pv : Win32.PVOID)
     return Win32.ULONG;                          --  objbase.h :1981
   pragma Convention (Stdcall, af_1981_GetSize);

   type af_1985_DidAlloc is access function
     (This : access IMalloc;
                      pv : Win32.PVOID)
     return Win32.INT;                            --  objbase.h :1985
   pragma Convention (Stdcall, af_1985_DidAlloc);

   type ap_1989_HeapMinimize is access procedure
     (This : access IMalloc);                      --  objbase.h :1989
   pragma Convention (Stdcall, ap_1989_HeapMinimize);

   type af_2149_QueryInterface is access function
     (This : access IStdMarshalInfo;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :2149
   pragma Convention (Stdcall, af_2149_QueryInterface);

   type af_2154_AddRef is access function
     (This : access IStdMarshalInfo)
     return Win32.ULONG;                          --  objbase.h :2154
   pragma Convention (Stdcall, af_2154_AddRef);

   type af_2157_Release is access function
     (This : access IStdMarshalInfo)
     return Win32.ULONG;                          --  objbase.h :2157
   pragma Convention (Stdcall, af_2157_Release);

   type af_2160_GetClassForHandler is access function
     (This : access IStdMarshalInfo;
                      dwDestContext : Win32.DWORD;
                      pvDestContext : Win32.PVOID;
                      pClsid : access CLSID)
     return HRESULT;                              --  objbase.h :2160
   pragma Convention (Stdcall, af_2160_GetClassForHandler);

   type af_2262_QueryInterface is access function
     (This : access IExternalConnection;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :2262
   pragma Convention (Stdcall, af_2262_QueryInterface);

   type af_2267_AddRef is access function
     (This : access IExternalConnection)
     return Win32.ULONG;                          --  objbase.h :2267
   pragma Convention (Stdcall, af_2267_AddRef);

   type af_2270_Release is access function
     (This : access IExternalConnection)
     return Win32.ULONG;                          --  objbase.h :2270
   pragma Convention (Stdcall, af_2270_Release);

   type af_2273_AddConnection is access function
     (This : access IExternalConnection;
                      extconn : Win32.DWORD;
                      reserved : Win32.DWORD)
     return Win32.DWORD;                          --  objbase.h :2273
   pragma Convention (Stdcall, af_2273_AddConnection);

   type af_2278_ReleaseConnection is access function
     (This : access IExternalConnection;
                      extconn : Win32.DWORD;
                      reserved : Win32.DWORD;
                      fLastReleaseCloses : Win32.BOOL)
     return Win32.DWORD;                          --  objbase.h :2278
   pragma Convention (Stdcall, af_2278_ReleaseConnection);

   type af_2386_QueryInterface is access function
     (This : access IWeakRef;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :2386
   pragma Convention (Stdcall, af_2386_QueryInterface);

   type af_2391_AddRef is access function
     (This : access IWeakRef)
     return Win32.ULONG;                          --  objbase.h :2391
   pragma Convention (Stdcall, af_2391_AddRef);

   type af_2394_Release is access function
     (This : access IWeakRef)
     return Win32.ULONG;                          --  objbase.h :2394
   pragma Convention (Stdcall, af_2394_Release);

   type af_2397_ChangeWeakCount is access function
     (This : access IWeakRef;
                      c_delta : Win32.LONG)
     return Win32.ULONG;                          --  objbase.h :2397
   pragma Convention (Stdcall, af_2397_ChangeWeakCount);

   type af_2401_ReleaseKeepAlive is access function
     (This : access IWeakRef;
                      pUnkReleased : access IUnknown;
                      reserved : Win32.DWORD)
     return Win32.ULONG;                          --  objbase.h :2401
   pragma Convention (Stdcall, af_2401_ReleaseKeepAlive);

   type af_2512_QueryInterface is access function
     (This : access IEnumUnknown;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :2512
   pragma Convention (Stdcall, af_2512_QueryInterface);

   type af_2517_AddRef is access function
     (This : access IEnumUnknown)
     return Win32.ULONG;                          --  objbase.h :2517
   pragma Convention (Stdcall, af_2517_AddRef);

   type af_2520_Release is access function
     (This : access IEnumUnknown)
     return Win32.ULONG;                          --  objbase.h :2520
   pragma Convention (Stdcall, af_2520_Release);

   type af_2523_Next is access function
     (This : access IEnumUnknown;
                      celt : Win32.ULONG;
                      rgelt : access LPUNKNOWN;
                      pceltFetched : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :2523
   pragma Convention (Stdcall, af_2523_Next);

   type af_2529_Skip is access function
     (This : access IEnumUnknown;
                      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :2529
   pragma Convention (Stdcall, af_2529_Skip);

   type af_2533_Reset is access function
     (This : access IEnumUnknown)
     return HRESULT;                              --  objbase.h :2533
   pragma Convention (Stdcall, af_2533_Reset);

   type af_2536_Clone is access function
     (This : access IEnumUnknown;
                      ppenum : access LPENUMUNKNOWN)
     return HRESULT;                              --  objbase.h :2536
   pragma Convention (Stdcall, af_2536_Clone);

   type af_2716_QueryInterface is access function
     (This : access IBindCtx;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :2716
   pragma Convention (Stdcall, af_2716_QueryInterface);

   type af_2721_AddRef is access function
     (This : access IBindCtx)
     return Win32.ULONG;                          --  objbase.h :2721
   pragma Convention (Stdcall, af_2721_AddRef);

   type af_2724_Release is access function
     (This : access IBindCtx)
     return Win32.ULONG;                          --  objbase.h :2724
   pragma Convention (Stdcall, af_2724_Release);

   type af_2727_RegisterObjectBound is access function
     (This : access IBindCtx;
                      punk : access IUnknown)
     return HRESULT;                              --  objbase.h :2727
   pragma Convention (Stdcall, af_2727_RegisterObjectBound);

   type af_2731_RevokeObjectBound is access function
     (This : access IBindCtx;
                      punk : access IUnknown)
     return HRESULT;                              --  objbase.h :2731
   pragma Convention (Stdcall, af_2731_RevokeObjectBound);

   type af_2735_ReleaseBoundObjects is access function
     (This : access IBindCtx)
     return HRESULT;                              --  objbase.h :2735
   pragma Convention (Stdcall, af_2735_ReleaseBoundObjects);

   type af_2738_SetBindOptions is access function
     (This : access IBindCtx;
                      pbindopts : access BIND_OPTS)
     return HRESULT;                              --  objbase.h :2738
   pragma Convention (Stdcall, af_2738_SetBindOptions);

   type af_2742_GetBindOptions is access function
     (This : access IBindCtx;
                      pbindopts : access BIND_OPTS)
     return HRESULT;                              --  objbase.h :2742
   pragma Convention (Stdcall, af_2742_GetBindOptions);

   type af_2746_GetRunningObjectTable is access function
     (This : access IBindCtx;
                      pprot : access LPRUNNINGOBJECTTABLE)
     return HRESULT;                              --  objbase.h :2746
   pragma Convention (Stdcall, af_2746_GetRunningObjectTable);

   type af_2750_RegisterObjectParam is access function
     (This : access IBindCtx;
                      pszKey : LPOLESTR;
                      punk : access IUnknown)
     return HRESULT;                              --  objbase.h :2750
   pragma Convention (Stdcall, af_2750_RegisterObjectParam);

   type af_2755_GetObjectParam is access function
     (This : access IBindCtx;
                      pszKey : LPOLESTR;
                      ppunk : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :2755
   pragma Convention (Stdcall, af_2755_GetObjectParam);

   type af_2760_EnumObjectParam is access function
     (This : access IBindCtx;
                      ppenum : access LPENUMSTRING)
     return HRESULT;                              --  objbase.h :2760
   pragma Convention (Stdcall, af_2760_EnumObjectParam);

   type af_2764_RevokeObjectParam is access function
     (This : access IBindCtx;
                      pszKey : LPOLESTR)
     return HRESULT;                              --  objbase.h :2764
   pragma Convention (Stdcall, af_2764_RevokeObjectParam);

   type af_2987_QueryInterface is access function
     (This : access IParseDisplayName;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :2987
   pragma Convention (Stdcall, af_2987_QueryInterface);

   type af_2992_AddRef is access function
     (This : access IParseDisplayName)
     return Win32.ULONG;                          --  objbase.h :2992
   pragma Convention (Stdcall, af_2992_AddRef);

   type af_2995_Release is access function
     (This : access IParseDisplayName)
     return Win32.ULONG;                          --  objbase.h :2995
   pragma Convention (Stdcall, af_2995_Release);

   type af_2998_ParseDisplayName is access function
     (This : access IParseDisplayName;
                      pbc : access IBindCtx;
                      pszDisplayName : LPOLESTR;
                      pchEaten : access Win32.ULONG;
                      ppmkOut : access LPMONIKER)
     return HRESULT;                              --  objbase.h :2998
   pragma Convention (Stdcall, af_2998_ParseDisplayName);

   type af_3098_QueryInterface is access function
     (This : access IEnumMoniker;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :3098
   pragma Convention (Stdcall, af_3098_QueryInterface);

   type af_3103_AddRef is access function
     (This : access IEnumMoniker)
     return Win32.ULONG;                          --  objbase.h :3103
   pragma Convention (Stdcall, af_3103_AddRef);

   type af_3106_Release is access function
     (This : access IEnumMoniker)
     return Win32.ULONG;                          --  objbase.h :3106
   pragma Convention (Stdcall, af_3106_Release);

   type af_3109_Next is access function
     (This : access IEnumMoniker;
                      celt : Win32.ULONG;
                      rgelt : access LPMONIKER;
                      pceltFetched : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :3109
   pragma Convention (Stdcall, af_3109_Next);

   type af_3115_Skip is access function
     (This : access IEnumMoniker;
                      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :3115
   pragma Convention (Stdcall, af_3115_Skip);

   type af_3119_Reset is access function
     (This : access IEnumMoniker)
     return HRESULT;                              --  objbase.h :3119
   pragma Convention (Stdcall, af_3119_Reset);

   type af_3122_Clone is access function
     (This : access IEnumMoniker;
                      ppenum : access LPENUMMONIKER)
     return HRESULT;                              --  objbase.h :3122
   pragma Convention (Stdcall, af_3122_Clone);

   type af_3264_QueryInterface is access function
     (This : access IRunnableObject;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :3264
   pragma Convention (Stdcall, af_3264_QueryInterface);

   type af_3269_AddRef is access function
     (This : access IRunnableObject)
     return Win32.ULONG;                          --  objbase.h :3269
   pragma Convention (Stdcall, af_3269_AddRef);

   type af_3272_Release is access function
     (This : access IRunnableObject)
     return Win32.ULONG;                          --  objbase.h :3272
   pragma Convention (Stdcall, af_3272_Release);

   type af_3275_GetRunningClass is access function
     (This : access IRunnableObject;
                      lpClsid : access CLSID)
     return HRESULT;                              --  objbase.h :3275
   pragma Convention (Stdcall, af_3275_GetRunningClass);

   type af_3279_Run is access function
     (This : access IRunnableObject;
                      pbc : LPBINDCTX)
     return HRESULT;                              --  objbase.h :3279
   pragma Convention (Stdcall, af_3279_Run);

   type af_3283_IsRunning is access function
     (This : access IRunnableObject)
     return Win32.BOOL;                           --  objbase.h :3283
   pragma Convention (Stdcall, af_3283_IsRunning);

   type af_3286_LockRunning is access function
     (This : access IRunnableObject;
                      fLock : Win32.BOOL;
                      fLastUnlockCloses : Win32.BOOL)
     return HRESULT;                              --  objbase.h :3286
   pragma Convention (Stdcall, af_3286_LockRunning);

   type af_3291_SetContainedObject is access function
     (This : access IRunnableObject;
                      fContained : Win32.BOOL)
     return HRESULT;                              --  objbase.h :3291
   pragma Convention (Stdcall, af_3291_SetContainedObject);

   type af_3459_QueryInterface is access function
     (This : access IRunningObjectTable;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :3459
   pragma Convention (Stdcall, af_3459_QueryInterface);

   type af_3464_AddRef is access function
     (This : access IRunningObjectTable)
     return Win32.ULONG;                          --  objbase.h :3464
   pragma Convention (Stdcall, af_3464_AddRef);

   type af_3467_Release is access function
     (This : access IRunningObjectTable)
     return Win32.ULONG;                          --  objbase.h :3467
   pragma Convention (Stdcall, af_3467_Release);

   type af_3470_Register is access function
     (This : access IRunningObjectTable;
                      grfFlags : Win32.DWORD;
                      punkObject : access IUnknown;
                      pmkObjectName : access IMoniker;
                      pdwRegister : access Win32.DWORD)
     return HRESULT;                              --  objbase.h :3470
   pragma Convention (Stdcall, af_3470_Register);

   type af_3477_Revoke is access function
     (This : access IRunningObjectTable;
                      dwRegister : Win32.DWORD)
     return HRESULT;                              --  objbase.h :3477
   pragma Convention (Stdcall, af_3477_Revoke);

   type af_3481_IsRunning is access function
     (This : access IRunningObjectTable;
                      pmkObjectName : access IMoniker)
     return HRESULT;                              --  objbase.h :3481
   pragma Convention (Stdcall, af_3481_IsRunning);

   type af_3485_GetObjectA is access function
     (This : access IRunningObjectTable;
                      pmkObjectName : access IMoniker;
                      ppunkObject : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :3485
   pragma Convention (Stdcall, af_3485_GetObjectA);

   type af_3490_NoteChangeTime is access function
     (This : access IRunningObjectTable;
                      dwRegister : Win32.DWORD;
                      pfiletime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :3490
   pragma Convention (Stdcall, af_3490_NoteChangeTime);

   type af_3495_GetTimeOfLastChange is access function
     (This : access IRunningObjectTable;
                      pmkObjectName : access IMoniker;
                      pfiletime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :3495
   pragma Convention (Stdcall, af_3495_GetTimeOfLastChange);

   type af_3500_EnumRunning is access function
     (This : access IRunningObjectTable;
                      ppenumMoniker : access LPENUMMONIKER)
     return HRESULT;                              --  objbase.h :3500
   pragma Convention (Stdcall, af_3500_EnumRunning);

   type af_3680_QueryInterface is access function
     (This : access IPersist;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :3680
   pragma Convention (Stdcall, af_3680_QueryInterface);

   type af_3685_AddRef is access function
     (This : access IPersist)
     return Win32.ULONG;                          --  objbase.h :3685
   pragma Convention (Stdcall, af_3685_AddRef);

   type af_3688_Release is access function
     (This : access IPersist)
     return Win32.ULONG;                          --  objbase.h :3688
   pragma Convention (Stdcall, af_3688_Release);

   type af_3691_GetClassID is access function
     (This : access IPersist;
                      pClassID : access CLSID)
     return HRESULT;                              --  objbase.h :3691
   pragma Convention (Stdcall, af_3691_GetClassID);

   type af_3784_QueryInterface is access function
     (This : access IPersistStream;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :3784
   pragma Convention (Stdcall, af_3784_QueryInterface);

   type af_3789_AddRef is access function
     (This : access IPersistStream)
     return Win32.ULONG;                          --  objbase.h :3789
   pragma Convention (Stdcall, af_3789_AddRef);

   type af_3792_Release is access function
     (This : access IPersistStream)
     return Win32.ULONG;                          --  objbase.h :3792
   pragma Convention (Stdcall, af_3792_Release);

   type af_3795_GetClassID is access function
     (This : access IPersistStream;
                      pClassID : access CLSID)
     return HRESULT;                              --  objbase.h :3795
   pragma Convention (Stdcall, af_3795_GetClassID);

   type af_3799_IsDirty is access function
     (This : access IPersistStream)
     return HRESULT;                              --  objbase.h :3799
   pragma Convention (Stdcall, af_3799_IsDirty);

   type af_3802_Load is access function
     (This : access IPersistStream;
                      pStm : access IStream)
     return HRESULT;                              --  objbase.h :3802
   pragma Convention (Stdcall, af_3802_Load);

   type af_3806_Save is access function
     (This : access IPersistStream;
                      pStm : access IStream;
                      fClearDirty : Win32.BOOL)
     return HRESULT;                              --  objbase.h :3806
   pragma Convention (Stdcall, af_3806_Save);

   type af_3811_GetSizeMax is access function
     (This : access IPersistStream;
                      pcbSize : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :3811
   pragma Convention (Stdcall, af_3811_GetSizeMax);

   type af_4030_QueryInterface is access function
     (This : access IMoniker;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :4030
   pragma Convention (Stdcall, af_4030_QueryInterface);

   type af_4035_AddRef is access function
     (This : access IMoniker)
     return Win32.ULONG;                          --  objbase.h :4035
   pragma Convention (Stdcall, af_4035_AddRef);

   type af_4038_Release is access function
     (This : access IMoniker)
     return Win32.ULONG;                          --  objbase.h :4038
   pragma Convention (Stdcall, af_4038_Release);

   type af_4041_GetClassID is access function
     (This : access IMoniker;
                      pClassID : access CLSID)
     return HRESULT;                              --  objbase.h :4041
   pragma Convention (Stdcall, af_4041_GetClassID);

   type af_4045_IsDirty is access function
     (This : access IMoniker)
     return HRESULT;                              --  objbase.h :4045
   pragma Convention (Stdcall, af_4045_IsDirty);

   type af_4048_Load is access function
     (This : access IMoniker;
                      pStm : access IStream)
     return HRESULT;                              --  objbase.h :4048
   pragma Convention (Stdcall, af_4048_Load);

   type af_4052_Save is access function
     (This : access IMoniker;
                      pStm : access IStream;
                      fClearDirty : Win32.BOOL)
     return HRESULT;                              --  objbase.h :4052
   pragma Convention (Stdcall, af_4052_Save);

   type af_4057_GetSizeMax is access function
     (This : access IMoniker;
                      pcbSize : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :4057
   pragma Convention (Stdcall, af_4057_GetSizeMax);

   type af_4061_BindToObject is access function
     (This : access IMoniker;
                      pbc : access IBindCtx;
                      pmkToLeft : access IMoniker;
                      riidResult : access IID;
                      ppvResult : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :4061
   pragma Convention (Stdcall, af_4061_BindToObject);

   type af_4068_BindToStorage is access function
     (This : access IMoniker;
                      pbc : access IBindCtx;
                      pmkToLeft : access IMoniker;
                      riid : REFIID;
                      ppvObj : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :4068
   pragma Convention (Stdcall, af_4068_BindToStorage);

   type af_4075_Reduce is access function
     (This : access IMoniker;
                      pbc : access IBindCtx;
                      dwReduceHowFar : Win32.DWORD;
                      ppmkToLeft : access LPMONIKER;
                      ppmkReduced : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4075
   pragma Convention (Stdcall, af_4075_Reduce);

   type af_4082_ComposeWith is access function
     (This : access IMoniker;
                      pmkRight : access IMoniker;
                      fOnlyIfNotGeneric : Win32.BOOL;
                      ppmkComposite : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4082
   pragma Convention (Stdcall, af_4082_ComposeWith);

   type af_4088_Enum is access function
     (This : access IMoniker;
                      fForward : Win32.BOOL;
                      ppenumMoniker : access LPENUMMONIKER)
     return HRESULT;                              --  objbase.h :4088
   pragma Convention (Stdcall, af_4088_Enum);

   type af_4093_IsEqual is access function
     (This : access IMoniker;
                      pmkOtherMoniker : access IMoniker)
     return HRESULT;                              --  objbase.h :4093
   pragma Convention (Stdcall, af_4093_IsEqual);

   type af_4097_Hash is access function
     (This : access IMoniker;
                      pdwHash : access Win32.DWORD)
     return HRESULT;                              --  objbase.h :4097
   pragma Convention (Stdcall, af_4097_Hash);

   type af_4101_IsRunning is access function
     (This : access IMoniker;
                      pbc : access IBindCtx;
                      pmkToLeft : access IMoniker;
                      pmkNewlyRunning : access IMoniker)
     return HRESULT;                              --  objbase.h :4101
   pragma Convention (Stdcall, af_4101_IsRunning);

   type af_4107_GetTimeOfLastChange is access function
     (This : access IMoniker;
                      pbc : access IBindCtx;
                      pmkToLeft : access IMoniker;
                      pFileTime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :4107
   pragma Convention (Stdcall, af_4107_GetTimeOfLastChange);

   type af_4113_Inverse is access function
     (This : access IMoniker;
                      ppmk : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4113
   pragma Convention (Stdcall, af_4113_Inverse);

   type af_4117_CommonPrefixWith is access function
     (This : access IMoniker;
                      pmkOther : access IMoniker;
                      ppmkPx : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4117
   pragma Convention (Stdcall, af_4117_CommonPrefixWith);

   type af_4122_RelativePathTo is access function
     (This : access IMoniker;
                      pmkOther : access IMoniker;
                      ppmkRelPath : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4122
   pragma Convention (Stdcall, af_4122_RelativePathTo);

   type af_4127_GetDisplayName is access function
     (This : access IMoniker;
                      pbc : access IBindCtx;
                      pmkToLeft : access IMoniker;
                      ppszDisplayName : access LPOLESTR)
     return HRESULT;                              --  objbase.h :4127
   pragma Convention (Stdcall, af_4127_GetDisplayName);

   type af_4133_ParseDisplayName is access function
     (This : access IMoniker;
                      pbc : access IBindCtx;
                      pmkToLeft : access IMoniker;
                      pszDisplayName : LPOLESTR;
                      pchEaten : access Win32.ULONG;
                      ppmkOut : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4133
   pragma Convention (Stdcall, af_4133_ParseDisplayName);

   type af_4141_IsSystemMoniker is access function
     (This : access IMoniker;
                      pdwMksys : access Win32.DWORD)
     return HRESULT;                              --  objbase.h :4141
   pragma Convention (Stdcall, af_4141_IsSystemMoniker);

   type af_4486_QueryInterface is access function
     (This : access IEnumString;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :4486
   pragma Convention (Stdcall, af_4486_QueryInterface);

   type af_4491_AddRef is access function
     (This : access IEnumString)
     return Win32.ULONG;                          --  objbase.h :4491
   pragma Convention (Stdcall, af_4491_AddRef);

   type af_4494_Release is access function
     (This : access IEnumString)
     return Win32.ULONG;                          --  objbase.h :4494
   pragma Convention (Stdcall, af_4494_Release);

   type af_4497_Next is access function
     (This : access IEnumString;
                      celt : Win32.ULONG;
                      rgelt : access LPOLESTR;
                      pceltFetched : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :4497
   pragma Convention (Stdcall, af_4497_Next);

   type af_4503_Skip is access function
     (This : access IEnumString;
                      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :4503
   pragma Convention (Stdcall, af_4503_Skip);

   type af_4507_Reset is access function
     (This : access IEnumString)
     return HRESULT;                              --  objbase.h :4507
   pragma Convention (Stdcall, af_4507_Reset);

   type af_4510_Clone is access function
     (This : access IEnumString;
                      ppenum : access LPENUMSTRING)
     return HRESULT;                              --  objbase.h :4510
   pragma Convention (Stdcall, af_4510_Clone);

   type af_4724_QueryInterface is access function
     (This : access IStream;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :4724
   pragma Convention (Stdcall, af_4724_QueryInterface);

   type af_4729_AddRef is access function
     (This : access IStream)
     return Win32.ULONG;                          --  objbase.h :4729
   pragma Convention (Stdcall, af_4729_AddRef);

   type af_4732_Release is access function
     (This : access IStream)
     return Win32.ULONG;                          --  objbase.h :4732
   pragma Convention (Stdcall, af_4732_Release);

   type af_4735_Read is access function
     (This : access IStream;
                      pv : Win32.PVOID;
                      cb : Win32.ULONG;
                      pcbRead : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :4735
   pragma Convention (Stdcall, af_4735_Read);

   type af_4741_Write is access function
     (This : access IStream;
                      pv : Win32.PVOID;
                      cb : Win32.ULONG;
                      pcbWritten : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :4741
   pragma Convention (Stdcall, af_4741_Write);

   type af_4747_Seek is access function
     (This : access IStream;
                      dlibMove : Win32.Winnt.LARGE_INTEGER;
                      dwOrigin : Win32.DWORD;
                      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :4747
   pragma Convention (Stdcall, af_4747_Seek);

   type af_4753_SetSize is access function
     (This : access IStream;
                      libNewSize : Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :4753
   pragma Convention (Stdcall, af_4753_SetSize);

   type af_4757_CopyTo is access function
     (This : access IStream;
                      pstm : access IStream;
                      cb : Win32.Winnt.ULARGE_INTEGER;
                      pcbRead : access Win32.Winnt.ULARGE_INTEGER;
                      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :4757
   pragma Convention (Stdcall, af_4757_CopyTo);

   type af_4764_Commit is access function
     (This : access IStream;
                      grfCommitFlags : Win32.DWORD)
     return HRESULT;                              --  objbase.h :4764
   pragma Convention (Stdcall, af_4764_Commit);

   type af_4768_Revert is access function
     (This : access IStream)
     return HRESULT;                              --  objbase.h :4768
   pragma Convention (Stdcall, af_4768_Revert);

   type af_4771_LockRegion is access function
     (This : access IStream;
                      libOffset : Win32.Winnt.ULARGE_INTEGER;
                      cb : Win32.Winnt.ULARGE_INTEGER;
                      dwLockType : Win32.DWORD)
     return HRESULT;                              --  objbase.h :4771
   pragma Convention (Stdcall, af_4771_LockRegion);

   type af_4777_UnlockRegion is access function
     (This : access IStream;
                      libOffset : Win32.Winnt.ULARGE_INTEGER;
                      cb : Win32.Winnt.ULARGE_INTEGER;
                      dwLockType : Win32.DWORD)
     return HRESULT;                              --  objbase.h :4777
   pragma Convention (Stdcall, af_4777_UnlockRegion);

   type af_4783_Stat is access function
     (This : access IStream;
                      pstatstg : access STATSTG;
                      grfStatFlag : Win32.DWORD)
     return HRESULT;                              --  objbase.h :4783
   pragma Convention (Stdcall, af_4783_Stat);

   type af_4788_Clone is access function
     (This : access IStream;
                      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :4788
   pragma Convention (Stdcall, af_4788_Clone);

   type af_5045_QueryInterface is access function
     (This : access IEnumSTATSTG;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :5045
   pragma Convention (Stdcall, af_5045_QueryInterface);

   type af_5050_AddRef is access function
     (This : access IEnumSTATSTG)
     return Win32.ULONG;                          --  objbase.h :5050
   pragma Convention (Stdcall, af_5050_AddRef);

   type af_5053_Release is access function
     (This : access IEnumSTATSTG)
     return Win32.ULONG;                          --  objbase.h :5053
   pragma Convention (Stdcall, af_5053_Release);

   type af_5056_Next is access function
     (This : access IEnumSTATSTG;
                      celt : Win32.ULONG;
                      rgelt : access STATSTG;
                      pceltFetched : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :5056
   pragma Convention (Stdcall, af_5056_Next);

   type af_5062_Skip is access function
     (This : access IEnumSTATSTG;
                      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :5062
   pragma Convention (Stdcall, af_5062_Skip);

   type af_5066_Reset is access function
     (This : access IEnumSTATSTG)
     return HRESULT;                              --  objbase.h :5066
   pragma Convention (Stdcall, af_5066_Reset);

   type af_5069_Clone is access function
     (This : access IEnumSTATSTG;
                      ppenum : access LPENUMSTATSTG)
     return HRESULT;                              --  objbase.h :5069
   pragma Convention (Stdcall, af_5069_Clone);

   type af_5285_QueryInterface is access function
     (This : access IStorage;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :5285
   pragma Convention (Stdcall, af_5285_QueryInterface);

   type af_5290_AddRef is access function
     (This : access IStorage)
     return Win32.ULONG;                          --  objbase.h :5290
   pragma Convention (Stdcall, af_5290_AddRef);

   type af_5293_Release is access function
     (This : access IStorage)
     return Win32.ULONG;                          --  objbase.h :5293
   pragma Convention (Stdcall, af_5293_Release);

   type af_5296_CreateStream is access function
     (This : access IStorage;
                      pwcsName : access OLECHAR;
                      grfMode : Win32.DWORD;
                      reserved1 : Win32.DWORD;
                      reserved2 : Win32.DWORD;
                      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :5296
   pragma Convention (Stdcall, af_5296_CreateStream);

   type af_5304_OpenStream is access function
     (This : access IStorage;
                      pwcsName : access OLECHAR;
                      reserved1 : Win32.PVOID;
                      grfMode : Win32.DWORD;
                      reserved2 : Win32.DWORD;
                      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :5304
   pragma Convention (Stdcall, af_5304_OpenStream);

   type af_5312_CreateStorage is access function
     (This : access IStorage;
                      pwcsName : access OLECHAR;
                      grfMode : Win32.DWORD;
                      dwStgFmt : Win32.DWORD;
                      reserved2 : Win32.DWORD;
                      ppstg : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :5312
   pragma Convention (Stdcall, af_5312_CreateStorage);

   type af_5320_OpenStorage is access function
     (This : access IStorage;
                      pwcsName : access OLECHAR;
                      pstgPriority : access IStorage;
                      grfMode : Win32.DWORD;
                      snbExclude : SNB;
                      reserved : Win32.DWORD;
                      ppstg : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :5320
   pragma Convention (Stdcall, af_5320_OpenStorage);

   type af_5329_CopyTo is access function
     (This : access IStorage;
                      ciidExclude : Win32.DWORD;
                      rgiidExclude : access IID;
                      snbExclude : SNB;
                      pstgDest : access IStorage)
     return HRESULT;                              --  objbase.h :5329
   pragma Convention (Stdcall, af_5329_CopyTo);

   type af_5336_MoveElementTo is access function
     (This : access IStorage;
                      pwcsName : access OLECHAR;
                      pstgDest : access IStorage;
                      pwcsNewName : access OLECHAR;
                      grfFlags : Win32.DWORD)
     return HRESULT;                              --  objbase.h :5336
   pragma Convention (Stdcall, af_5336_MoveElementTo);

   type af_5343_Commit is access function
     (This : access IStorage;
                      grfCommitFlags : Win32.DWORD)
     return HRESULT;                              --  objbase.h :5343
   pragma Convention (Stdcall, af_5343_Commit);

   type af_5347_Revert is access function
     (This : access IStorage)
     return HRESULT;                              --  objbase.h :5347
   pragma Convention (Stdcall, af_5347_Revert);

   type af_5350_EnumElements is access function
     (This : access IStorage;
                      reserved1 : Win32.DWORD;
                      reserved2 : Win32.PVOID;
                      reserved3 : Win32.DWORD;
                      ppenum : access LPENUMSTATSTG)
     return HRESULT;                              --  objbase.h :5350
   pragma Convention (Stdcall, af_5350_EnumElements);

   type af_5357_DestroyElement is access function
     (This : access IStorage;
                      pwcsName : access OLECHAR)
     return HRESULT;                              --  objbase.h :5357
   pragma Convention (Stdcall, af_5357_DestroyElement);

   type af_5361_RenameElement is access function
     (This : access IStorage;
                      pwcsOldName : access OLECHAR;
                      pwcsNewName : access OLECHAR)
     return HRESULT;                              --  objbase.h :5361
   pragma Convention (Stdcall, af_5361_RenameElement);

   type af_5366_SetElementTimes is access function
     (This : access IStorage;
                      pwcsName : access OLECHAR;
                      pctime : access Win32.Winbase.FILETIME;
                      patime : access Win32.Winbase.FILETIME;
                      pmtime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :5366
   pragma Convention (Stdcall, af_5366_SetElementTimes);

   type af_5373_SetClass is access function
     (This : access IStorage;
                      clsid : access Win32.Objbase.CLSID)
     return HRESULT;                              --  objbase.h :5373
   pragma Convention (Stdcall, af_5373_SetClass);

   type af_5377_SetStateBits is access function
     (This : access IStorage;
                      grfStateBits : Win32.DWORD;
                      grfMask : Win32.DWORD)
     return HRESULT;                              --  objbase.h :5377
   pragma Convention (Stdcall, af_5377_SetStateBits);

   type af_5382_Stat is access function
     (This : access IStorage;
                      pstatstg : access STATSTG;
                      grfStatFlag : Win32.DWORD)
     return HRESULT;                              --  objbase.h :5382
   pragma Convention (Stdcall, af_5382_Stat);

   type af_5723_QueryInterface is access function
     (This : access IPersistFile;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :5723
   pragma Convention (Stdcall, af_5723_QueryInterface);

   type af_5728_AddRef is access function
     (This : access IPersistFile)
     return Win32.ULONG;                          --  objbase.h :5728
   pragma Convention (Stdcall, af_5728_AddRef);

   type af_5731_Release is access function
     (This : access IPersistFile)
     return Win32.ULONG;                          --  objbase.h :5731
   pragma Convention (Stdcall, af_5731_Release);

   type af_5734_GetClassID is access function
     (This : access IPersistFile;
                      pClassID : access CLSID)
     return HRESULT;                              --  objbase.h :5734
   pragma Convention (Stdcall, af_5734_GetClassID);

   type af_5738_IsDirty is access function
     (This : access IPersistFile)
     return HRESULT;                              --  objbase.h :5738
   pragma Convention (Stdcall, af_5738_IsDirty);

   type af_5741_Load is access function
     (This : access IPersistFile;
                      pszFileName : LPCOLESTR;
                      dwMode : Win32.DWORD)
     return HRESULT;                              --  objbase.h :5741
   pragma Convention (Stdcall, af_5741_Load);

   type af_5746_Save is access function
     (This : access IPersistFile;
                      pszFileName : LPCOLESTR;
                      fRemember : Win32.BOOL)
     return HRESULT;                              --  objbase.h :5746
   pragma Convention (Stdcall, af_5746_Save);

   type af_5751_SaveCompleted is access function
     (This : access IPersistFile;
                      pszFileName : LPCOLESTR)
     return HRESULT;                              --  objbase.h :5751
   pragma Convention (Stdcall, af_5751_SaveCompleted);

   type af_5755_GetCurFile is access function
     (This : access IPersistFile;
                      ppszFileName : access LPOLESTR)
     return HRESULT;                              --  objbase.h :5755
   pragma Convention (Stdcall, af_5755_GetCurFile);

   type af_5918_QueryInterface is access function
     (This : access IPersistStorage;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :5918
   pragma Convention (Stdcall, af_5918_QueryInterface);

   type af_5923_AddRef is access function
     (This : access IPersistStorage)
     return Win32.ULONG;                          --  objbase.h :5923
   pragma Convention (Stdcall, af_5923_AddRef);

   type af_5926_Release is access function
     (This : access IPersistStorage)
     return Win32.ULONG;                          --  objbase.h :5926
   pragma Convention (Stdcall, af_5926_Release);

   type af_5929_GetClassID is access function
     (This : access IPersistStorage;
                      pClassID : access CLSID)
     return HRESULT;                              --  objbase.h :5929
   pragma Convention (Stdcall, af_5929_GetClassID);

   type af_5933_IsDirty is access function
     (This : access IPersistStorage)
     return HRESULT;                              --  objbase.h :5933
   pragma Convention (Stdcall, af_5933_IsDirty);

   type af_5936_InitNew is access function
     (This : access IPersistStorage;
                      pStg : access IStorage)
     return HRESULT;                              --  objbase.h :5936
   pragma Convention (Stdcall, af_5936_InitNew);

   type af_5940_Load is access function
     (This : access IPersistStorage;
                      pStg : access IStorage)
     return HRESULT;                              --  objbase.h :5940
   pragma Convention (Stdcall, af_5940_Load);

   type af_5944_Save is access function
     (This : access IPersistStorage;
                      pStgSave : access IStorage;
                      fSameAsLoad : Win32.BOOL)
     return HRESULT;                              --  objbase.h :5944
   pragma Convention (Stdcall, af_5944_Save);

   type af_5949_SaveCompleted is access function
     (This : access IPersistStorage;
                      pStgNew : access IStorage)
     return HRESULT;                              --  objbase.h :5949
   pragma Convention (Stdcall, af_5949_SaveCompleted);

   type af_5953_HandsOffStorage is access function
     (This : access IPersistStorage)
     return HRESULT;                              --  objbase.h :5953
   pragma Convention (Stdcall, af_5953_HandsOffStorage);

   type af_6142_QueryInterface is access function
     (This : access ILockBytes;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :6142
   pragma Convention (Stdcall, af_6142_QueryInterface);

   type af_6147_AddRef is access function
     (This : access ILockBytes)
     return Win32.ULONG;                          --  objbase.h :6147
   pragma Convention (Stdcall, af_6147_AddRef);

   type af_6150_Release is access function
     (This : access ILockBytes)
     return Win32.ULONG;                          --  objbase.h :6150
   pragma Convention (Stdcall, af_6150_Release);

   type af_6153_ReadAt is access function
     (This : access ILockBytes;
                      ulOffset : Win32.Winnt.ULARGE_INTEGER;
                      pv : Win32.PVOID;
                      cb : Win32.ULONG;
                      pcbRead : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :6153
   pragma Convention (Stdcall, af_6153_ReadAt);

   type af_6160_WriteAt is access function
     (This : access ILockBytes;
                      ulOffset : Win32.Winnt.ULARGE_INTEGER;
                      pv : Win32.PVOID;
                      cb : Win32.ULONG;
                      pcbWritten : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :6160
   pragma Convention (Stdcall, af_6160_WriteAt);

   type af_6167_Flush is access function
     (This : access ILockBytes)
     return HRESULT;                              --  objbase.h :6167
   pragma Convention (Stdcall, af_6167_Flush);

   type af_6170_SetSize is access function
     (This : access ILockBytes;
                      cb : Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :6170
   pragma Convention (Stdcall, af_6170_SetSize);

   type af_6174_LockRegion is access function
     (This : access ILockBytes;
                      libOffset : Win32.Winnt.ULARGE_INTEGER;
                      cb : Win32.Winnt.ULARGE_INTEGER;
                      dwLockType : Win32.DWORD)
     return HRESULT;                              --  objbase.h :6174
   pragma Convention (Stdcall, af_6174_LockRegion);

   type af_6180_UnlockRegion is access function
     (This : access ILockBytes;
                      libOffset : Win32.Winnt.ULARGE_INTEGER;
                      cb : Win32.Winnt.ULARGE_INTEGER;
                      dwLockType : Win32.DWORD)
     return HRESULT;                              --  objbase.h :6180
   pragma Convention (Stdcall, af_6180_UnlockRegion);

   type af_6186_Stat is access function
     (This : access ILockBytes;
                      pstatstg : access STATSTG;
                      grfStatFlag : Win32.DWORD)
     return HRESULT;                              --  objbase.h :6186
   pragma Convention (Stdcall, af_6186_Stat);

   type af_6411_QueryInterface is access function
     (This : access IEnumFORMATETC;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :6411
   pragma Convention (Stdcall, af_6411_QueryInterface);

   type af_6416_AddRef is access function
     (This : access IEnumFORMATETC)
     return Win32.ULONG;                          --  objbase.h :6416
   pragma Convention (Stdcall, af_6416_AddRef);

   type af_6419_Release is access function
     (This : access IEnumFORMATETC)
     return Win32.ULONG;                          --  objbase.h :6419
   pragma Convention (Stdcall, af_6419_Release);

   type af_6422_Next is access function
     (This : access IEnumFORMATETC;
                      celt : Win32.ULONG;
                      rgelt : access FORMATETC;
                      pceltFetched : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :6422
   pragma Convention (Stdcall, af_6422_Next);

   type af_6428_Skip is access function
     (This : access IEnumFORMATETC;
                      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :6428
   pragma Convention (Stdcall, af_6428_Skip);

   type af_6432_Reset is access function
     (This : access IEnumFORMATETC)
     return HRESULT;                              --  objbase.h :6432
   pragma Convention (Stdcall, af_6432_Reset);

   type af_6435_Clone is access function
     (This : access IEnumFORMATETC;
                      ppenum : access LPENUMFORMATETC)
     return HRESULT;                              --  objbase.h :6435
   pragma Convention (Stdcall, af_6435_Clone);

   type af_6599_QueryInterface is access function
     (This : access IEnumSTATDATA;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :6599
   pragma Convention (Stdcall, af_6599_QueryInterface);

   type af_6604_AddRef is access function
     (This : access IEnumSTATDATA)
     return Win32.ULONG;                          --  objbase.h :6604
   pragma Convention (Stdcall, af_6604_AddRef);

   type af_6607_Release is access function
     (This : access IEnumSTATDATA)
     return Win32.ULONG;                          --  objbase.h :6607
   pragma Convention (Stdcall, af_6607_Release);

   type af_6610_Next is access function
     (This : access IEnumSTATDATA;
                      celt : Win32.ULONG;
                      rgelt : access STATDATA;
                      pceltFetched : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :6610
   pragma Convention (Stdcall, af_6610_Next);

   type af_6616_Skip is access function
     (This : access IEnumSTATDATA;
                      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :6616
   pragma Convention (Stdcall, af_6616_Skip);

   type af_6620_Reset is access function
     (This : access IEnumSTATDATA)
     return HRESULT;                              --  objbase.h :6620
   pragma Convention (Stdcall, af_6620_Reset);

   type af_6623_Clone is access function
     (This : access IEnumSTATDATA;
                      ppenum : access LPENUMSTATDATA)
     return HRESULT;                              --  objbase.h :6623
   pragma Convention (Stdcall, af_6623_Clone);

   type af_6753_QueryInterface is access function
     (This : access IRootStorage;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :6753
   pragma Convention (Stdcall, af_6753_QueryInterface);

   type af_6758_AddRef is access function
     (This : access IRootStorage)
     return Win32.ULONG;                          --  objbase.h :6758
   pragma Convention (Stdcall, af_6758_AddRef);

   type af_6761_Release is access function
     (This : access IRootStorage)
     return Win32.ULONG;                          --  objbase.h :6761
   pragma Convention (Stdcall, af_6761_Release);

   type af_6764_SwitchToFile is access function
     (This : access IRootStorage;
                      pszFile : LPOLESTR)
     return HRESULT;                              --  objbase.h :6764
   pragma Convention (Stdcall, af_6764_SwitchToFile);

   type af_6923_QueryInterface is access function
     (This : access IAdviseSink;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :6923
   pragma Convention (Stdcall, af_6923_QueryInterface);

   type af_6928_AddRef is access function
     (This : access IAdviseSink)
     return Win32.ULONG;                          --  objbase.h :6928
   pragma Convention (Stdcall, af_6928_AddRef);

   type af_6931_Release is access function
     (This : access IAdviseSink)
     return Win32.ULONG;                          --  objbase.h :6931
   pragma Convention (Stdcall, af_6931_Release);

   type ap_6934_OnDataChange is access procedure
     (This : access IAdviseSink;
                      pFormatetc : access FORMATETC;
                      pStgmed : access STGMEDIUM);          --  objbase.h :6934
   pragma Convention (Stdcall, ap_6934_OnDataChange);

   type ap_6939_OnViewChange is access procedure
     (This : access IAdviseSink;
                      dwAspect : Win32.DWORD;
                      lindex : Win32.LONG);                 --  objbase.h :6939
   pragma Convention (Stdcall, ap_6939_OnViewChange);

   type ap_6944_OnRename is access procedure
     (This : access IAdviseSink;
                      pmk : access IMoniker);               --  objbase.h :6944
   pragma Convention (Stdcall, ap_6944_OnRename);

   type ap_6948_OnSave is access procedure
     (This : access IAdviseSink);                  --  objbase.h :6948
   pragma Convention (Stdcall, ap_6948_OnSave);

   type ap_6951_OnClose is access procedure
     (This : access IAdviseSink);                  --  objbase.h :6951
   pragma Convention (Stdcall, ap_6951_OnClose);

   type af_7094_QueryInterface is access function
     (This : access IAdviseSink2;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :7094
   pragma Convention (Stdcall, af_7094_QueryInterface);

   type af_7099_AddRef is access function
     (This : access IAdviseSink2)
     return Win32.ULONG;                          --  objbase.h :7099
   pragma Convention (Stdcall, af_7099_AddRef);

   type af_7102_Release is access function
     (This : access IAdviseSink2)
     return Win32.ULONG;                          --  objbase.h :7102
   pragma Convention (Stdcall, af_7102_Release);

   type ap_7105_OnDataChange is access procedure
     (This : access IAdviseSink2;
                      pFormatetc : access FORMATETC;
                      pStgmed : access STGMEDIUM);          --  objbase.h :7105
   pragma Convention (Stdcall, ap_7105_OnDataChange);

   type ap_7110_OnViewChange is access procedure
     (This : access IAdviseSink2;
                      dwAspect : Win32.DWORD;
                      lindex : Win32.LONG);                 --  objbase.h :7110
   pragma Convention (Stdcall, ap_7110_OnViewChange);

   type ap_7115_OnRename is access procedure
     (This : access IAdviseSink2;
                      pmk : access IMoniker);               --  objbase.h :7115
   pragma Convention (Stdcall, ap_7115_OnRename);

   type ap_7119_OnSave is access procedure
     (This : access IAdviseSink2);                 --  objbase.h :7119
   pragma Convention (Stdcall, ap_7119_OnSave);

   type ap_7122_OnClose is access procedure
     (This : access IAdviseSink2);                 --  objbase.h :7122
   pragma Convention (Stdcall, ap_7122_OnClose);

   type ap_7125_OnLinkSrcChange is access procedure
     (This : access IAdviseSink2;
                      pmk : access IMoniker);               --  objbase.h :7125
   pragma Convention (Stdcall, ap_7125_OnLinkSrcChange);

   type af_7265_QueryInterface is access function
     (This : access IDataObject;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :7265
   pragma Convention (Stdcall, af_7265_QueryInterface);

   type af_7270_AddRef is access function
     (This : access IDataObject)
     return Win32.ULONG;                          --  objbase.h :7270
   pragma Convention (Stdcall, af_7270_AddRef);

   type af_7273_Release is access function
     (This : access IDataObject)
     return Win32.ULONG;                          --  objbase.h :7273
   pragma Convention (Stdcall, af_7273_Release);

   type af_7276_GetData is access function
     (This : access IDataObject;
                      pformatetcIn : access FORMATETC;
                      pmedium : access STGMEDIUM)
     return HRESULT;                              --  objbase.h :7276
   pragma Convention (Stdcall, af_7276_GetData);

   type af_7281_GetDataHere is access function
     (This : access IDataObject;
                      pformatetc : access FORMATETC;
                      pmedium : access STGMEDIUM)
     return HRESULT;                              --  objbase.h :7281
   pragma Convention (Stdcall, af_7281_GetDataHere);

   type af_7286_QueryGetData is access function
     (This : access IDataObject;
                      pformatetc : access FORMATETC)
     return HRESULT;                              --  objbase.h :7286
   pragma Convention (Stdcall, af_7286_QueryGetData);

   type af_7290_GetCanonicalFormatEtc is access function
     (This : access IDataObject;
                      pformatectIn : access FORMATETC;
                      pformatetcOut : access FORMATETC)
     return HRESULT;                              --  objbase.h :7290
   pragma Convention (Stdcall, af_7290_GetCanonicalFormatEtc);

   type af_7295_SetData is access function
     (This : access IDataObject;
                      pformatetc : access FORMATETC;
                      pmedium : access STGMEDIUM;
                      fRelease : Win32.BOOL)
     return HRESULT;                              --  objbase.h :7295
   pragma Convention (Stdcall, af_7295_SetData);

   type af_7301_EnumFormatEtc is access function
     (This : access IDataObject;
                      dwDirection : Win32.DWORD;
                      ppenumFormatEtc : access LPENUMFORMATETC)
     return HRESULT;                              --  objbase.h :7301
   pragma Convention (Stdcall, af_7301_EnumFormatEtc);

   type af_7306_DAdvise is access function
     (This : access IDataObject;
                      pformatetc : access FORMATETC;
                      advf : Win32.DWORD;
                      pAdvSink : access IAdviseSink;
                      pdwConnection : access Win32.DWORD)
     return HRESULT;                              --  objbase.h :7306
   pragma Convention (Stdcall, af_7306_DAdvise);

   type af_7313_DUnadvise is access function
     (This : access IDataObject;
                      dwConnection : Win32.DWORD)
     return HRESULT;                              --  objbase.h :7313
   pragma Convention (Stdcall, af_7313_DUnadvise);

   type af_7317_EnumDAdvise is access function
     (This : access IDataObject;
                      ppenumAdvise : access LPENUMSTATDATA)
     return HRESULT;                              --  objbase.h :7317
   pragma Convention (Stdcall, af_7317_EnumDAdvise);

   type af_7545_QueryInterface is access function
     (This : access IDataAdviseHolder;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :7545
   pragma Convention (Stdcall, af_7545_QueryInterface);

   type af_7550_AddRef is access function
     (This : access IDataAdviseHolder)
     return Win32.ULONG;                          --  objbase.h :7550
   pragma Convention (Stdcall, af_7550_AddRef);

   type af_7553_Release is access function
     (This : access IDataAdviseHolder)
     return Win32.ULONG;                          --  objbase.h :7553
   pragma Convention (Stdcall, af_7553_Release);

   type af_7556_Advise is access function
     (This : access IDataAdviseHolder;
                      pDataObject : access IDataObject;
                      pFetc : access FORMATETC;
                      advf : Win32.DWORD;
                      pAdvise : access IAdviseSink;
                      pdwConnection : access Win32.DWORD)
     return HRESULT;                              --  objbase.h :7556
   pragma Convention (Stdcall, af_7556_Advise);

   type af_7564_Unadvise is access function
     (This : access IDataAdviseHolder;
                      dwConnection : Win32.DWORD)
     return HRESULT;                              --  objbase.h :7564
   pragma Convention (Stdcall, af_7564_Unadvise);

   type af_7568_EnumAdvise is access function
     (This : access IDataAdviseHolder;
                      ppenumAdvise : access LPENUMSTATDATA)
     return HRESULT;                              --  objbase.h :7568
   pragma Convention (Stdcall, af_7568_EnumAdvise);

   type af_7572_SendOnDataChange is access function
     (This : access IDataAdviseHolder;
                      pDataObject : access IDataObject;
                      dwReserved : Win32.DWORD;
                      advf : Win32.DWORD)
     return HRESULT;                              --  objbase.h :7572
   pragma Convention (Stdcall, af_7572_SendOnDataChange);

   type af_7766_QueryInterface is access function
     (This : access IMessageFilter;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :7766
   pragma Convention (Stdcall, af_7766_QueryInterface);

   type af_7771_AddRef is access function
     (This : access IMessageFilter)
     return Win32.ULONG;                          --  objbase.h :7771
   pragma Convention (Stdcall, af_7771_AddRef);

   type af_7774_Release is access function
     (This : access IMessageFilter)
     return Win32.ULONG;                          --  objbase.h :7774
   pragma Convention (Stdcall, af_7774_Release);

   type af_7777_HandleInComingCall is access function
     (This : access IMessageFilter;
                      dwCallType : Win32.DWORD;
                      htaskCaller : Win32.Windef.HTASK;
                      dwTickCount : Win32.DWORD;
                      lpInterfaceInfo : Win32.Objbase.LPINTERFACEINFO)
     return Win32.DWORD;                          --  objbase.h :7777
   pragma Convention (Stdcall, af_7777_HandleInComingCall);

   type af_7784_RetryRejectedCall is access function
     (This : access IMessageFilter;
                      htaskCallee : Win32.Windef.HTASK;
                      dwTickCount : Win32.DWORD;
                      dwRejectType : Win32.DWORD)
     return Win32.DWORD;                          --  objbase.h :7784
   pragma Convention (Stdcall, af_7784_RetryRejectedCall);

   type af_7790_MessagePending is access function
     (This : access IMessageFilter;
                      htaskCallee : Win32.Windef.HTASK;
                      dwTickCount : Win32.DWORD;
                      dwPendingType : Win32.DWORD)
     return Win32.DWORD;                          --  objbase.h :7790
   pragma Convention (Stdcall, af_7790_MessagePending);

   type af_7942_QueryInterface is access function
     (This : access IRpcChannelBuffer;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :7942
   pragma Convention (Stdcall, af_7942_QueryInterface);

   type af_7947_AddRef is access function
     (This : access IRpcChannelBuffer)
     return Win32.ULONG;                          --  objbase.h :7947
   pragma Convention (Stdcall, af_7947_AddRef);

   type af_7950_Release is access function
     (This : access IRpcChannelBuffer)
     return Win32.ULONG;                          --  objbase.h :7950
   pragma Convention (Stdcall, af_7950_Release);

   type af_7953_GetBuffer is access function
     (This : access IRpcChannelBuffer;
                      pMessage : access RPCOLEMESSAGE;
                      riid : REFIID)
     return HRESULT;                              --  objbase.h :7953
   pragma Convention (Stdcall, af_7953_GetBuffer);

   type af_7958_SendReceive is access function
     (This : access IRpcChannelBuffer;
                      pMessage : access RPCOLEMESSAGE;
                      pStatus : access Win32.ULONG)
     return HRESULT;                              --  objbase.h :7958
   pragma Convention (Stdcall, af_7958_SendReceive);

   type af_7963_FreeBuffer is access function
     (This : access IRpcChannelBuffer;
                      pMessage : access RPCOLEMESSAGE)
     return HRESULT;                              --  objbase.h :7963
   pragma Convention (Stdcall, af_7963_FreeBuffer);

   type af_7967_GetDestCtx is access function
     (This : access IRpcChannelBuffer;
                      pdwDestContext : access Win32.DWORD;
                      ppvDestContext : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :7967
   pragma Convention (Stdcall, af_7967_GetDestCtx);

   type af_7972_IsConnected is access function
     (This : access IRpcChannelBuffer)
     return HRESULT;                              --  objbase.h :7972
   pragma Convention (Stdcall, af_7972_IsConnected);

   type af_8116_QueryInterface is access function
     (This : access IRpcProxyBuffer;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8116
   pragma Convention (Stdcall, af_8116_QueryInterface);

   type af_8121_AddRef is access function
     (This : access IRpcProxyBuffer)
     return Win32.ULONG;                          --  objbase.h :8121
   pragma Convention (Stdcall, af_8121_AddRef);

   type af_8124_Release is access function
     (This : access IRpcProxyBuffer)
     return Win32.ULONG;                          --  objbase.h :8124
   pragma Convention (Stdcall, af_8124_Release);

   type af_8127_Connect is access function
     (This : access IRpcProxyBuffer;
                      pRpcChannelBuffer : access IRpcChannelBuffer)
     return HRESULT;                              --  objbase.h :8127
   pragma Convention (Stdcall, af_8127_Connect);

   type ap_8131_Disconnect is access procedure
     (This : access IRpcProxyBuffer);              --  objbase.h :8131
   pragma Convention (Stdcall, ap_8131_Disconnect);

   type af_8242_QueryInterface is access function
     (This : access IRpcStubBuffer;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8242
   pragma Convention (Stdcall, af_8242_QueryInterface);

   type af_8247_AddRef is access function
     (This : access IRpcStubBuffer)
     return Win32.ULONG;                          --  objbase.h :8247
   pragma Convention (Stdcall, af_8247_AddRef);

   type af_8250_Release is access function
     (This : access IRpcStubBuffer)
     return Win32.ULONG;                          --  objbase.h :8250
   pragma Convention (Stdcall, af_8250_Release);

   type af_8253_Connect is access function
     (This : access IRpcStubBuffer;
                      pUnkServer : access IUnknown)
     return HRESULT;                              --  objbase.h :8253
   pragma Convention (Stdcall, af_8253_Connect);

   type ap_8257_Disconnect is access procedure
     (This : access IRpcStubBuffer);               --  objbase.h :8257
   pragma Convention (Stdcall, ap_8257_Disconnect);

   type af_8260_Invoke is access function
     (This : access IRpcStubBuffer;
                      prpcmsg : access RPCOLEMESSAGE;
                      pRpcChannelBuffer : access IRpcChannelBuffer)
     return HRESULT;                              --  objbase.h :8260
   pragma Convention (Stdcall, af_8260_Invoke);

   type af_8265_IsIIDSupported is access function
     (This : access IRpcStubBuffer;
                      riid : REFIID)
     return a_IRpcStubBuffer_t;                   --  objbase.h :8265
   pragma Convention (Stdcall, af_8265_IsIIDSupported);

   type af_8269_CountRefs is access function
     (This : access IRpcStubBuffer)
     return Win32.ULONG;                          --  objbase.h :8269
   pragma Convention (Stdcall, af_8269_CountRefs);

   type af_8272_DebugServerQueryInterface is access function
     (This : access IRpcStubBuffer;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8272
   pragma Convention (Stdcall, af_8272_DebugServerQueryInterface);

   type ap_8276_DebugServerRelease is access procedure
     (This : access IRpcStubBuffer;
                      pv : Win32.PVOID);                    --  objbase.h :8276
   pragma Convention (Stdcall, ap_8276_DebugServerRelease);

   type af_8454_QueryInterface is access function
     (This : access IPSFactoryBuffer;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8454
   pragma Convention (Stdcall, af_8454_QueryInterface);

   type af_8459_AddRef is access function
     (This : access IPSFactoryBuffer)
     return Win32.ULONG;                          --  objbase.h :8459
   pragma Convention (Stdcall, af_8459_AddRef);

   type af_8462_Release is access function
     (This : access IPSFactoryBuffer)
     return Win32.ULONG;                          --  objbase.h :8462
   pragma Convention (Stdcall, af_8462_Release);

   type af_8465_CreateProxy is access function
     (This : access IPSFactoryBuffer;
                      pUnkOuter : access IUnknown;
                      riid : REFIID;
                      ppProxy : access PIRpcProxyBuffer;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8465
   pragma Convention (Stdcall, af_8465_CreateProxy);

   type af_8472_CreateStub is access function
     (This : access IPSFactoryBuffer;
                      riid : REFIID;
                      pUnkServer : access IUnknown;
                      ppStub : access a_IRpcStubBuffer_t)
     return HRESULT;                              --  objbase.h :8472
   pragma Convention (Stdcall, af_8472_CreateStub);

   type RemHGLOBAL is                                      --  objbase.h :331
      record
         fNullHGlobal : Win32.INT;                        --  objbase.h :333
         cbData : Win32.UINT;                       --  objbase.h :334
         data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :335
      end record;

   type RemHMETAFILEPICT is                                --  objbase.h :339
      record
         mm : Win32.INT;                              --  objbase.h :341
         xExt : Win32.INT;                              --  objbase.h :342
         yExt : Win32.INT;                              --  objbase.h :343
         cbData : Win32.UINT;                             --  objbase.h :344
         data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :345
      end record;

   type RemHENHMETAFILE is                                 --  objbase.h :352
      record
         cbData : Win32.UINT;                             --  objbase.h :354
         data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :355
      end record;

   type RemHBITMAP is                                      --  objbase.h :359
      record
         cbData : Win32.UINT;                             --  objbase.h :361
         data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :362
      end record;

   type RemHPALETTE is                                     --  objbase.h :366
      record
         cbData : Win32.UINT;                             --  objbase.h :368
         data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :369
      end record;

   type RemBRUSH is                                        --  objbase.h :373
      record
         cbData : Win32.UINT;                             --  objbase.h :375
         data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :376
      end record;

   type OBJECTID is                                        --  objbase.h :937
      record
         Lineage : Win32.Rpcdce.GUID;                  --  objbase.h :939
         Uniquifier : Win32.UINT;                         --  objbase.h :940
      end record;

   type IUnknown is                                        --  objbase.h :1173
      record
         lpVtbl : a_IUnknownVtbl_t;                       --  objbase.h :1469
      end record;

   type IClassFactory is                                   --  objbase.h :1179
      record
         lpVtbl : a_IClassFactoryVtbl_t;                  --  objbase.h :1594
      end record;

   type IMarshal is                                        --  objbase.h :1185
      record
         lpVtbl : a_IMarshalVtbl_t;                       --  objbase.h :1774
      end record;

   type IMalloc is                                         --  objbase.h :1191
      record
         lpVtbl : a_IMallocVtbl_t;                        --  objbase.h :1996
      end record;

   type IStdMarshalInfo is                                 --  objbase.h :1197
      record
         lpVtbl : a_IStdMarshalInfoVtbl_t;                --  objbase.h :2170
      end record;

   type IExternalConnection is                             --  objbase.h :1203
      record
         lpVtbl : a_IExternalConnectionVtbl_t;            --  objbase.h :2288
      end record;

   type IWeakRef is                                        --  objbase.h :1209
      record
         lpVtbl : a_IWeakRefVtbl_t;                       --  objbase.h :2410
      end record;

   type IEnumUnknown is                                    --  objbase.h :1215
      record
         lpVtbl : a_IEnumUnknownVtbl_t;                   --  objbase.h :2544
      end record;

   type IBindCtx is                                        --  objbase.h :1221
      record
         lpVtbl : a_IBindCtxVtbl_t;                       --  objbase.h :2772
      end record;

   type IParseDisplayName is                               --  objbase.h :1227
      record
         lpVtbl : a_IParseDisplayNameVtbl_t;              --  objbase.h :3009
      end record;

   type IEnumMoniker is                                    --  objbase.h :1233
      record
         lpVtbl : a_IEnumMonikerVtbl_t;                   --  objbase.h :3130
      end record;

   type IRunnableObject is                                 --  objbase.h :1239
      record
         lpVtbl : a_IRunnableObjectVtbl_t;                --  objbase.h :3299
      end record;

   type IRunningObjectTable is                             --  objbase.h :1245
      record
         lpVtbl : a_IRunningObjectTableVtbl_t;            --  objbase.h :3508
      end record;

   type IPersist is                                        --  objbase.h :1251
      record
         lpVtbl : a_IPersistVtbl_t;                       --  objbase.h :3699
      end record;

   type IPersistStream is                                  --  objbase.h :1257
      record
         lpVtbl : a_IPersistStreamVtbl_t;                 --  objbase.h :3819
      end record;

   type IMoniker is                                        --  objbase.h :1263
      record
         lpVtbl : a_IMonikerVtbl_t;                       --  objbase.h :4149
      end record;

   type IEnumString is                                     --  objbase.h :1269
      record
         lpVtbl : a_IEnumStringVtbl_t;                    --  objbase.h :4518
      end record;

   type IStream is                                         --  objbase.h :1275
      record
         lpVtbl : a_IStreamVtbl_t;                        --  objbase.h :4796
      end record;

   type IEnumSTATSTG is                                    --  objbase.h :1281
      record
         lpVtbl : a_IEnumSTATSTGVtbl_t;                   --  objbase.h :5077
      end record;

   type IStorage is                                        --  objbase.h :1287
      record
         lpVtbl : a_IStorageVtbl_t;                       --  objbase.h :5391
      end record;

   type IPersistFile is                                    --  objbase.h :1293
      record
         lpVtbl : a_IPersistFileVtbl_t;                   --  objbase.h :5763
      end record;

   type IPersistStorage is                                 --  objbase.h :1299
      record
         lpVtbl : a_IPersistStorageVtbl_t;                --  objbase.h :5960
      end record;

   type ILockBytes is                                      --  objbase.h :1305
      record
         lpVtbl : a_ILockBytesVtbl_t;                     --  objbase.h :6195
      end record;

   type IEnumFORMATETC is                                  --  objbase.h :1311
      record
         lpVtbl : a_IEnumFORMATETCVtbl_t;                 --  objbase.h :6443
      end record;

   type IEnumSTATDATA is                                   --  objbase.h :1317
      record
         lpVtbl : a_IEnumSTATDATAVtbl_t;                  --  objbase.h :6631
      end record;

   type IRootStorage is                                    --  objbase.h :1323
      record
         lpVtbl : a_IRootStorageVtbl_t;                   --  objbase.h :6772
      end record;

   type IAdviseSink is                                     --  objbase.h :1329
      record
         lpVtbl : a_IAdviseSinkVtbl_t;                    --  objbase.h :6958
      end record;

   type IAdviseSink2 is                                    --  objbase.h :1335
      record
         lpVtbl : a_IAdviseSink2Vtbl_t;                   --  objbase.h :7133
      end record;

   type IDataObject is                                     --  objbase.h :1341
      record
         lpVtbl : a_IDataObjectVtbl_t;                    --  objbase.h :7325
      end record;

   type IDataAdviseHolder is                               --  objbase.h :1347
      record
         lpVtbl : a_IDataAdviseHolderVtbl_t;              --  objbase.h :7582
      end record;

   type IMessageFilter is                                  --  objbase.h :1353
      record
         lpVtbl : a_IMessageFilterVtbl_t;                 --  objbase.h :7800
      end record;

   type IRpcProxyBuffer is                                 --  objbase.h :1365
      record
         lpVtbl : a_IRpcProxyBufferVtbl_t;                --  objbase.h :8138
      end record;

   type IPSFactoryBuffer is                                --  objbase.h :1377
      record
         lpVtbl : a_IPSFactoryBufferVtbl_t;               --  objbase.h :8482
      end record;

   type IUnknownVtbl is                                    --  objbase.h :1451
      record
         QueryInterface : af_1454_QueryInterface;         --  objbase.h :1454
         AddRef : af_1459_AddRef;                 --  objbase.h :1459
         Release : af_1462_Release;                --  objbase.h :1462
      end record;

   type IClassFactoryVtbl is                               --  objbase.h :1566
      record
         QueryInterface : af_1569_QueryInterface;         --  objbase.h :1569
         AddRef : af_1574_AddRef;                 --  objbase.h :1574
         Release : af_1577_Release;                --  objbase.h :1577
         CreateInstance : af_1580_CreateInstance;         --  objbase.h :1580
         LockServer : af_1586_LockServer;             --  objbase.h :1586
      end record;

   type IMarshalVtbl is                                    --  objbase.h :1715
      record
         QueryInterface : af_1718_QueryInterface;     --  objbase.h :1718
         AddRef : af_1723_AddRef;             --  objbase.h :1723
         Release : af_1726_Release;            --  objbase.h :1726
         GetUnmarshalClass : af_1729_GetUnmarshalClass;  --  objbase.h :1729
         GetMarshalSizeMax : af_1738_GetMarshalSizeMax;  --  objbase.h :1738
         MarshalInterface : af_1747_MarshalInterface;   --  objbase.h :1747
         UnmarshalInterface : af_1756_UnmarshalInterface; --  objbase.h :1756
         ReleaseMarshalData : af_1762_ReleaseMarshalData; --  objbase.h :1762
         DisconnectObject : af_1766_DisconnectObject;   --  objbase.h :1766
      end record;

   type IMallocVtbl is                                     --  objbase.h :1954
      record
         QueryInterface : af_1957_QueryInterface;         --  objbase.h :1957
         AddRef : af_1962_AddRef;                 --  objbase.h :1962
         Release : af_1965_Release;                --  objbase.h :1965
         Alloc : af_1968_Alloc;                  --  objbase.h :1968
         Realloc : af_1972_Realloc;                --  objbase.h :1972
         Free : ap_1977_Free;                   --  objbase.h :1977
         GetSize : af_1981_GetSize;                --  objbase.h :1981
         DidAlloc : af_1985_DidAlloc;               --  objbase.h :1985
         HeapMinimize : ap_1989_HeapMinimize;           --  objbase.h :1989
      end record;

   type IStdMarshalInfoVtbl is                             --  objbase.h :2146
      record
         QueryInterface : af_2149_QueryInterface;     --  objbase.h :2149
         AddRef : af_2154_AddRef;             --  objbase.h :2154
         Release : af_2157_Release;            --  objbase.h :2157
         GetClassForHandler : af_2160_GetClassForHandler; --  objbase.h :2160
      end record;

   type IExternalConnectionVtbl is                         --  objbase.h :2259
      record
         QueryInterface : af_2262_QueryInterface;      --  objbase.h :2262
         AddRef : af_2267_AddRef;              --  objbase.h :2267
         Release : af_2270_Release;             --  objbase.h :2270
         AddConnection : af_2273_AddConnection;       --  objbase.h :2273
         ReleaseConnection : af_2278_ReleaseConnection;   --  objbase.h :2278
      end record;

   type IWeakRefVtbl is                                    --  objbase.h :2383
      record
         QueryInterface : af_2386_QueryInterface;       --  objbase.h :2386
         AddRef : af_2391_AddRef;               --  objbase.h :2391
         Release : af_2394_Release;              --  objbase.h :2394
         ChangeWeakCount : af_2397_ChangeWeakCount;      --  objbase.h :2397
         ReleaseKeepAlive : af_2401_ReleaseKeepAlive;     --  objbase.h :2401
      end record;

   type IEnumUnknownVtbl is                                --  objbase.h :2509
      record
         QueryInterface : af_2512_QueryInterface;         --  objbase.h :2512
         AddRef : af_2517_AddRef;                 --  objbase.h :2517
         Release : af_2520_Release;                --  objbase.h :2520
         Next : af_2523_Next;                   --  objbase.h :2523
         Skip : af_2529_Skip;                   --  objbase.h :2529
         Reset : af_2533_Reset;                  --  objbase.h :2533
         Clone : af_2536_Clone;                  --  objbase.h :2536
      end record;

   type BIND_OPTS is                                       --  objbase.h :2652
      record
         cbStruct : DWORD;                     --  objbase.h :2654
         grfFlags : DWORD;                     --  objbase.h :2655
         grfMode : DWORD;                     --  objbase.h :2656
         dwTickCountDeadline : DWORD;                     --  objbase.h :2657
      end record;

   type IBindCtxVtbl is                                    --  objbase.h :2713
      record
         QueryInterface : af_2716_QueryInterface;  --  objbase.h :2716
         AddRef : af_2721_AddRef;          --  objbase.h :2721
         Release : af_2724_Release;         --  objbase.h :2724
         RegisterObjectBound : af_2727_RegisterObjectBound;
         --  objbase.h :2727
         RevokeObjectBound : af_2731_RevokeObjectBound;
         --  objbase.h :2731
         ReleaseBoundObjects : af_2735_ReleaseBoundObjects;
         --  objbase.h :2735
         SetBindOptions : af_2738_SetBindOptions;  --  objbase.h :2738
         GetBindOptions : af_2742_GetBindOptions;  --  objbase.h :2742
         GetRunningObjectTable : af_2746_GetRunningObjectTable;
         --  objbase.h :2746
         RegisterObjectParam : af_2750_RegisterObjectParam;
         --  objbase.h :2750
         GetObjectParam : af_2755_GetObjectParam;  --  objbase.h :2755
         EnumObjectParam : af_2760_EnumObjectParam; --  objbase.h :2760
         RevokeObjectParam : af_2764_RevokeObjectParam;
         --  objbase.h :2764
      end record;

   type IParseDisplayNameVtbl is                           --  objbase.h :2984
      record
         QueryInterface : af_2987_QueryInterface;       --  objbase.h :2987
         AddRef : af_2992_AddRef;               --  objbase.h :2992
         Release : af_2995_Release;              --  objbase.h :2995
         ParseDisplayName : af_2998_ParseDisplayName;     --  objbase.h :2998
      end record;

   type IEnumMonikerVtbl is                                --  objbase.h :3095
      record
         QueryInterface : af_3098_QueryInterface;         --  objbase.h :3098
         AddRef : af_3103_AddRef;                 --  objbase.h :3103
         Release : af_3106_Release;                --  objbase.h :3106
         Next : af_3109_Next;                   --  objbase.h :3109
         Skip : af_3115_Skip;                   --  objbase.h :3115
         Reset : af_3119_Reset;                  --  objbase.h :3119
         Clone : af_3122_Clone;                  --  objbase.h :3122
      end record;

   type IRunnableObjectVtbl is                             --  objbase.h :3261
      record
         QueryInterface : af_3264_QueryInterface;     --  objbase.h :3264
         AddRef : af_3269_AddRef;             --  objbase.h :3269
         Release : af_3272_Release;            --  objbase.h :3272
         GetRunningClass : af_3275_GetRunningClass;    --  objbase.h :3275
         Run : af_3279_Run;                --  objbase.h :3279
         IsRunning : af_3283_IsRunning;          --  objbase.h :3283
         LockRunning : af_3286_LockRunning;        --  objbase.h :3286
         SetContainedObject : af_3291_SetContainedObject; --  objbase.h :3291
      end record;

   type IRunningObjectTableVtbl is                         --  objbase.h :3456
      record
         QueryInterface : af_3459_QueryInterface;    --  objbase.h :3459
         AddRef : af_3464_AddRef;            --  objbase.h :3464
         Release : af_3467_Release;           --  objbase.h :3467
         Register : af_3470_Register;          --  objbase.h :3470
         Revoke : af_3477_Revoke;            --  objbase.h :3477
         IsRunning : af_3481_IsRunning;         --  objbase.h :3481
         GetObjectA : af_3485_GetObjectA;        --  objbase.h :3485
         NoteChangeTime : af_3490_NoteChangeTime;    --  objbase.h :3490
         GetTimeOfLastChange : af_3495_GetTimeOfLastChange;
         --  objbase.h :3495
         EnumRunning : af_3500_EnumRunning;       --  objbase.h :3500
      end record;

   type IPersistVtbl is                                    --  objbase.h :3677
      record
         QueryInterface : af_3680_QueryInterface;         --  objbase.h :3680
         AddRef : af_3685_AddRef;                 --  objbase.h :3685
         Release : af_3688_Release;                --  objbase.h :3688
         GetClassID : af_3691_GetClassID;             --  objbase.h :3691
      end record;

   type IEnumStringVtbl is                                 --  objbase.h :4483
      record
         QueryInterface : af_4486_QueryInterface;         --  objbase.h :4486
         AddRef : af_4491_AddRef;                 --  objbase.h :4491
         Release : af_4494_Release;                --  objbase.h :4494
         Next : af_4497_Next;                   --  objbase.h :4497
         Skip : af_4503_Skip;                   --  objbase.h :4503
         Reset : af_4507_Reset;                  --  objbase.h :4507
         Clone : af_4510_Clone;                  --  objbase.h :4510
      end record;

   type STATSTG is                                         --  objbase.h :4623
      record
         pwcsName : LPOLESTR;                    --  objbase.h :4625
         c_type : DWORD;                       --  objbase.h :4626
         cbSize : Win32.Winnt.ULARGE_INTEGER;  --  objbase.h :4627
         mtime : Win32.Winbase.FILETIME;      --  objbase.h :4628
         ctime : Win32.Winbase.FILETIME;      --  objbase.h :4629
         atime : Win32.Winbase.FILETIME;      --  objbase.h :4630
         grfMode : DWORD;                       --  objbase.h :4631
         grfLocksSupported : DWORD;                       --  objbase.h :4632
         clsid : Objbase.CLSID;               --  objbase.h :4633
         grfStateBits : DWORD;                       --  objbase.h :4634
         reserved : DWORD;                       --  objbase.h :4635
      end record;

   type IStreamVtbl is                                     --  objbase.h :4721
      record
         QueryInterface : af_4724_QueryInterface;         --  objbase.h :4724
         AddRef : af_4729_AddRef;                 --  objbase.h :4729
         Release : af_4732_Release;                --  objbase.h :4732
         Read : af_4735_Read;                   --  objbase.h :4735
         Write : af_4741_Write;                  --  objbase.h :4741
         Seek : af_4747_Seek;                   --  objbase.h :4747
         SetSize : af_4753_SetSize;                --  objbase.h :4753
         CopyTo : af_4757_CopyTo;                 --  objbase.h :4757
         Commit : af_4764_Commit;                 --  objbase.h :4764
         Revert : af_4768_Revert;                 --  objbase.h :4768
         LockRegion : af_4771_LockRegion;             --  objbase.h :4771
         UnlockRegion : af_4777_UnlockRegion;           --  objbase.h :4777
         Stat : af_4783_Stat;                   --  objbase.h :4783
         Clone : af_4788_Clone;                  --  objbase.h :4788
      end record;

   type IEnumSTATSTGVtbl is                                --  objbase.h :5042
      record
         QueryInterface : af_5045_QueryInterface;         --  objbase.h :5045
         AddRef : af_5050_AddRef;                 --  objbase.h :5050
         Release : af_5053_Release;                --  objbase.h :5053
         Next : af_5056_Next;                   --  objbase.h :5056
         Skip : af_5062_Skip;                   --  objbase.h :5062
         Reset : af_5066_Reset;                  --  objbase.h :5066
         Clone : af_5069_Clone;                  --  objbase.h :5069
      end record;

   type OLECHAR_Array is array (Natural range <>) of OLECHAR;

   type RemSNB is                                          --  objbase.h :5182
      record
         ulCntStr : Win32.UINT;                          --  objbase.h :5184
         ulCntChar : Win32.UINT;                          --  objbase.h :5185
         rgString : OLECHAR_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :5186
      end record;

   type IStorageVtbl is                                    --  objbase.h :5282
      record
         QueryInterface : af_5285_QueryInterface;        --  objbase.h :5285
         AddRef : af_5290_AddRef;                --  objbase.h :5290
         Release : af_5293_Release;               --  objbase.h :5293
         CreateStream : af_5296_CreateStream;          --  objbase.h :5296
         OpenStream : af_5304_OpenStream;            --  objbase.h :5304
         CreateStorage : af_5312_CreateStorage;         --  objbase.h :5312
         OpenStorage : af_5320_OpenStorage;           --  objbase.h :5320
         CopyTo : af_5329_CopyTo;                --  objbase.h :5329
         MoveElementTo : af_5336_MoveElementTo;         --  objbase.h :5336
         Commit : af_5343_Commit;                --  objbase.h :5343
         Revert : af_5347_Revert;                --  objbase.h :5347
         EnumElements : af_5350_EnumElements;          --  objbase.h :5350
         DestroyElement : af_5357_DestroyElement;        --  objbase.h :5357
         RenameElement : af_5361_RenameElement;         --  objbase.h :5361
         SetElementTimes : af_5366_SetElementTimes;       --  objbase.h :5366
         SetClass : af_5373_SetClass;              --  objbase.h :5373
         SetStateBits : af_5377_SetStateBits;          --  objbase.h :5377
         Stat : af_5382_Stat;                  --  objbase.h :5382
      end record;

   type IPersistFileVtbl is                                --  objbase.h :5720
      record
         QueryInterface : af_5723_QueryInterface;         --  objbase.h :5723
         AddRef : af_5728_AddRef;                 --  objbase.h :5728
         Release : af_5731_Release;                --  objbase.h :5731
         GetClassID : af_5734_GetClassID;             --  objbase.h :5734
         IsDirty : af_5738_IsDirty;                --  objbase.h :5738
         Load : af_5741_Load;                   --  objbase.h :5741
         Save : af_5746_Save;                   --  objbase.h :5746
         SaveCompleted : af_5751_SaveCompleted;          --  objbase.h :5751
         GetCurFile : af_5755_GetCurFile;             --  objbase.h :5755
      end record;

   type IPersistStorageVtbl is                             --  objbase.h :5915
      record
         QueryInterface : af_5918_QueryInterface;        --  objbase.h :5918
         AddRef : af_5923_AddRef;                --  objbase.h :5923
         Release : af_5926_Release;               --  objbase.h :5926
         GetClassID : af_5929_GetClassID;            --  objbase.h :5929
         IsDirty : af_5933_IsDirty;               --  objbase.h :5933
         InitNew : af_5936_InitNew;               --  objbase.h :5936
         Load : af_5940_Load;                  --  objbase.h :5940
         Save : af_5944_Save;                  --  objbase.h :5944
         SaveCompleted : af_5949_SaveCompleted;         --  objbase.h :5949
         HandsOffStorage : af_5953_HandsOffStorage;       --  objbase.h :5953
      end record;

   type ILockBytesVtbl is                                  --  objbase.h :6139
      record
         QueryInterface : af_6142_QueryInterface;         --  objbase.h :6142
         AddRef : af_6147_AddRef;                 --  objbase.h :6147
         Release : af_6150_Release;                --  objbase.h :6150
         ReadAt : af_6153_ReadAt;                 --  objbase.h :6153
         WriteAt : af_6160_WriteAt;                --  objbase.h :6160
         Flush : af_6167_Flush;                  --  objbase.h :6167
         SetSize : af_6170_SetSize;                --  objbase.h :6170
         LockRegion : af_6174_LockRegion;             --  objbase.h :6174
         UnlockRegion : af_6180_UnlockRegion;           --  objbase.h :6180
         Stat : af_6186_Stat;                   --  objbase.h :6186
      end record;

   type DVTARGETDEVICE is                                  --  objbase.h :6354
      record
         tdSize : DWORD;                      --  objbase.h :6356
         tdDriverNameOffset : WORD;                       --  objbase.h :6357
         tdDeviceNameOffset : WORD;                       --  objbase.h :6358
         tdPortNameOffset : WORD;                       --  objbase.h :6359
         tdExtDevmodeOffset : WORD;                       --  objbase.h :6360
         tdData : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :6361
      end record;

   type FORMATETC is                                       --  objbase.h :6371
      record
         cfFormat : CLIPFORMAT;                           --  objbase.h :6373
         ptd : a_DVTARGETDEVICE_t;                   --  objbase.h :6374
         dwAspect : DWORD;                                --  objbase.h :6375
         lindex : LONG;                                 --  objbase.h :6376
         tymed : DWORD;                                --  objbase.h :6377
      end record;

   type IEnumFORMATETCVtbl is                              --  objbase.h :6408
      record
         QueryInterface : af_6411_QueryInterface;         --  objbase.h :6411
         AddRef : af_6416_AddRef;                 --  objbase.h :6416
         Release : af_6419_Release;                --  objbase.h :6419
         Next : af_6422_Next;                   --  objbase.h :6422
         Skip : af_6428_Skip;                   --  objbase.h :6428
         Reset : af_6432_Reset;                  --  objbase.h :6432
         Clone : af_6435_Clone;                  --  objbase.h :6435
      end record;

   type STATDATA is                                        --  objbase.h :6560
      record
         formatetc : Objbase.FORMATETC;                --  objbase.h :6562
         advf : DWORD;                            --  objbase.h :6563
         pAdvSink : LPADVISESINK;                     --  objbase.h :6564
         dwConnection : DWORD;                            --  objbase.h :6565
      end record;

   type IEnumSTATDATAVtbl is                               --  objbase.h :6596
      record
         QueryInterface : af_6599_QueryInterface;         --  objbase.h :6599
         AddRef : af_6604_AddRef;                 --  objbase.h :6604
         Release : af_6607_Release;                --  objbase.h :6607
         Next : af_6610_Next;                   --  objbase.h :6610
         Skip : af_6616_Skip;                   --  objbase.h :6616
         Reset : af_6620_Reset;                  --  objbase.h :6620
         Clone : af_6623_Clone;                  --  objbase.h :6623
      end record;

   type IRootStorageVtbl is                                --  objbase.h :6750
      record
         QueryInterface : af_6753_QueryInterface;         --  objbase.h :6753
         AddRef : af_6758_AddRef;                 --  objbase.h :6758
         Release : af_6761_Release;                --  objbase.h :6761
         SwitchToFile : af_6764_SwitchToFile;           --  objbase.h :6764
      end record;

   type RemSTGMEDIUM is                                    --  objbase.h :6845
      record
         tymed : DWORD;                          --  objbase.h :6847
         dwHandleType : DWORD;                          --  objbase.h :6848
         pData : Win32.UINT;                     --  objbase.h :6849
         pUnkForRelease : Win32.UINT;                     --  objbase.h :6850
         cbData : Win32.UINT;                     --  objbase.h :6851
         data : Win32.BYTE_Array (0 .. Win32.ANYSIZE_ARRAY);
         --  objbase.h :6852
      end record;

   type union_anonymous7_t_kind is ( --  objbase.h :6867
     hBitmap_kind,
     hMetaFilePict_kind,
     hEnhMetaFile_kind,
     hGlobal_kind,
     lpszFileName_kind,
     pstm_kind,
     pstg_kind
                                   );

   type union_anonymous7_t (Which : union_anonymous7_t_kind :=  hBitmap_kind)
   is
      --  objbase.h :6867
      record
         case Which is
            when hBitmap_kind =>
               hBitmap : Win32.Windef.HBITMAP;          --  objbase.h :6860
            when hMetaFilePict_kind =>
               hMetaFilePict : Objbase.HMETAFILEPICT;   --  objbase.h :6861
            when hEnhMetaFile_kind =>
               hEnhMetaFile : Win32.Windef.HENHMETAFILE; --  objbase.h :6862
            when hGlobal_kind =>
               hGlobal : Win32.Windef.HGLOBAL;          --  objbase.h :6863
            when lpszFileName_kind =>
               lpszFileName : LPOLESTR;                 --  objbase.h :6864
            when pstm_kind =>
               pstm : LPSTREAM;                        --  objbase.h :6865
            when pstg_kind =>
               pstg : LPSTORAGE;                       --  objbase.h :6866
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous7_t);

   pragma Unchecked_Union (union_anonymous7_t);

   type STGMEDIUM is                                       --  objbase.h :6857
      record
         tymed : DWORD;                          --  objbase.h :6858
         u : union_anonymous7_t;             --  objbase.h :6867
         pUnkForRelease : LPUNKNOWN;                      --  objbase.h :6868
      end record;

   type IAdviseSinkVtbl is                                 --  objbase.h :6920
      record
         QueryInterface : af_6923_QueryInterface;         --  objbase.h :6923
         AddRef : af_6928_AddRef;                 --  objbase.h :6928
         Release : af_6931_Release;                --  objbase.h :6931
         OnDataChange : ap_6934_OnDataChange;           --  objbase.h :6934
         OnViewChange : ap_6939_OnViewChange;           --  objbase.h :6939
         OnRename : ap_6944_OnRename;               --  objbase.h :6944
         OnSave : ap_6948_OnSave;                 --  objbase.h :6948
         OnClose : ap_6951_OnClose;                --  objbase.h :6951
      end record;

   type IAdviseSink2Vtbl is                                --  objbase.h :7091
      record
         QueryInterface : af_7094_QueryInterface;        --  objbase.h :7094
         AddRef : af_7099_AddRef;                --  objbase.h :7099
         Release : af_7102_Release;               --  objbase.h :7102
         OnDataChange : ap_7105_OnDataChange;          --  objbase.h :7105
         OnViewChange : ap_7110_OnViewChange;          --  objbase.h :7110
         OnRename : ap_7115_OnRename;              --  objbase.h :7115
         OnSave : ap_7119_OnSave;                --  objbase.h :7119
         OnClose : ap_7122_OnClose;               --  objbase.h :7122
         OnLinkSrcChange : ap_7125_OnLinkSrcChange;       --  objbase.h :7125
      end record;

   type IDataObjectVtbl is                                 --  objbase.h :7262
      record
         QueryInterface : af_7265_QueryInterface;  --  objbase.h :7265
         AddRef : af_7270_AddRef;          --  objbase.h :7270
         Release : af_7273_Release;         --  objbase.h :7273
         GetData : af_7276_GetData;         --  objbase.h :7276
         GetDataHere : af_7281_GetDataHere;     --  objbase.h :7281
         QueryGetData : af_7286_QueryGetData;    --  objbase.h :7286
         GetCanonicalFormatEtc : af_7290_GetCanonicalFormatEtc;
         --  objbase.h :7290
         SetData : af_7295_SetData;         --  objbase.h :7295
         EnumFormatEtc : af_7301_EnumFormatEtc;   --  objbase.h :7301
         DAdvise : af_7306_DAdvise;         --  objbase.h :7306
         DUnadvise : af_7313_DUnadvise;       --  objbase.h :7313
         EnumDAdvise : af_7317_EnumDAdvise;     --  objbase.h :7317
      end record;

   type IDataAdviseHolderVtbl is                           --  objbase.h :7542
      record
         QueryInterface : af_7545_QueryInterface;       --  objbase.h :7545
         AddRef : af_7550_AddRef;               --  objbase.h :7550
         Release : af_7553_Release;              --  objbase.h :7553
         Advise : af_7556_Advise;               --  objbase.h :7556
         Unadvise : af_7564_Unadvise;             --  objbase.h :7564
         EnumAdvise : af_7568_EnumAdvise;           --  objbase.h :7568
         SendOnDataChange : af_7572_SendOnDataChange;     --  objbase.h :7572
      end record;

   type INTERFACEINFO is                                   --  objbase.h :7725
      record
         pUnk : LPUNKNOWN;                             --  objbase.h :7727
         iid : Objbase.IID;                           --  objbase.h :7728
         wMethod : WORD;                                  --  objbase.h :7729
      end record;

   type IMessageFilterVtbl is                              --  objbase.h :7763
      record
         QueryInterface : af_7766_QueryInterface;     --  objbase.h :7766
         AddRef : af_7771_AddRef;             --  objbase.h :7771
         Release : af_7774_Release;            --  objbase.h :7774
         HandleInComingCall : af_7777_HandleInComingCall; --  objbase.h :7777
         RetryRejectedCall : af_7784_RetryRejectedCall;  --  objbase.h :7784
         MessagePending : af_7790_MessagePending;     --  objbase.h :7790
      end record;

   type PVOID_Array is array (Natural range <>) of Win32.PVOID;
   --  objbase.h :7903
   type RPCOLEMESSAGE is                                   --  objbase.h :7896
      record
         reserved1 : Win32.PVOID;                --  objbase.h :7898
         dataRepresentation : RPCOLEDATAREP;              --  objbase.h :7899
         Buffer : Win32.PVOID;                --  objbase.h :7900
         cbBuffer : Win32.ULONG;                --  objbase.h :7901
         iMethod : Win32.ULONG;                --  objbase.h :7902
         reserved2 : PVOID_Array (0 .. 4);          --  objbase.h :7903
         rpcFlags : Win32.ULONG;                --  objbase.h :7904
      end record;

   type IRpcChannelBufferVtbl is                           --  objbase.h :7939
      record
         QueryInterface : af_7942_QueryInterface;         --  objbase.h :7942
         AddRef : af_7947_AddRef;                 --  objbase.h :7947
         Release : af_7950_Release;                --  objbase.h :7950
         GetBuffer : af_7953_GetBuffer;              --  objbase.h :7953
         SendReceive : af_7958_SendReceive;            --  objbase.h :7958
         FreeBuffer : af_7963_FreeBuffer;             --  objbase.h :7963
         GetDestCtx : af_7967_GetDestCtx;             --  objbase.h :7967
         IsConnected : af_7972_IsConnected;            --  objbase.h :7972
      end record;

   type IRpcChannelBuffer is                               --  objbase.h :7977
      record
         lpVtbl : a_IRpcChannelBufferVtbl;
         --  objbase.h :7979
      end record;


   type IRpcProxyBufferVtbl is                             --  objbase.h :8113
      record
         QueryInterface : af_8116_QueryInterface;         --  objbase.h :8116
         AddRef : af_8121_AddRef;                 --  objbase.h :8121
         Release : af_8124_Release;                --  objbase.h :8124
         Connect : af_8127_Connect;                --  objbase.h :8127
         Disconnect : ap_8131_Disconnect;             --  objbase.h :8131
      end record;

   type IRpcStubBufferVtbl is                              --  objbase.h :8239
      record
         QueryInterface : af_8242_QueryInterface;
         --  objbase.h :8242
         AddRef : af_8247_AddRef;      --  objbase.h :8247
         Release : af_8250_Release;     --  objbase.h :8250
         Connect : af_8253_Connect;     --  objbase.h :8253
         Disconnect : ap_8257_Disconnect;  --  objbase.h :8257
         Invoke : af_8260_Invoke;      --  objbase.h :8260
         IsIIDSupported : af_8265_IsIIDSupported;
         --  objbase.h :8265
         CountRefs : af_8269_CountRefs;   --  objbase.h :8269
      end record;

   type IRpcStubBuffer is                                  --  objbase.h :8282
      record
         lpVtbl : a_IRpcStubBufferVtbl;                   --  objbase.h :8284
      end record;

   type IPSFactoryBufferVtbl is                            --  objbase.h :8451
      record
         QueryInterface : af_8454_QueryInterface;         --  objbase.h :8454
         AddRef : af_8459_AddRef;                 --  objbase.h :8459
         Release : af_8462_Release;                --  objbase.h :8462
         CreateProxy : af_8465_CreateProxy;            --  objbase.h :8465
         CreateStub : af_8472_CreateStub;             --  objbase.h :8472
      end record;

   type LPFNGETCLASSOBJECT is access function
     (rclsid : REFCLSID;
                      riid : REFIID;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :9055
   pragma Convention (Stdcall, LPFNGETCLASSOBJECT);

   type LPFNCANUNLOADNOW is access function  return HRESULT;
   pragma Convention (Stdcall, LPFNCANUNLOADNOW);  --  objbase.h :9061

   IWinTypes_v0_1_c_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;
   --  objbase.h :1110
   IWinTypes_v0_1_s_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;
   --  objbase.h :1111
   MIDL_intf_0000_v0_0_c_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;
   --  objbase.h :1147
   MIDL_intf_0000_v0_0_s_ifspec : Win32.Rpcdce.RPC_IF_HANDLE;
   --  objbase.h :1148

   GUID_NULL : IID;                      --  cguid.h :35
   IID_NULL : constant IID :=  GUID_NULL; --  objbase.h :952
   CLSID_NULL : constant IID :=  GUID_NULL; --  objbase.h :960

   IID_IUnknown : IID;                      --  objbase.h :1432
   IID_IClassFactory : IID;                      --  objbase.h :1547
   IID_IMarshal : IID;                      --  objbase.h :1669
   IID_IMalloc : IID;                      --  objbase.h :1925
   IID_IStdMarshalInfo : IID;                      --  objbase.h :2130
   IID_IExternalConnection : IID;                      --  objbase.h :2239
   IID_IWeakRef : IID;                      --  objbase.h :2365
   IID_IEnumUnknown : IID;                      --  objbase.h :2485
   IID_IBindCtx : IID;                      --  objbase.h :2671
   IID_IParseDisplayName : IID;                      --  objbase.h :2967
   IID_IEnumMoniker : IID;                      --  objbase.h :3071
   IID_IRunnableObject : IID;                      --  objbase.h :3235
   IID_IRunningObjectTable : IID;                      --  objbase.h :3418
   IID_IPersist : IID;                      --  objbase.h :3663
   IID_IPersistStream : IID;                      --  objbase.h :3758
   IID_IMoniker : IID;                      --  objbase.h :3947
   IID_IEnumString : IID;                      --  objbase.h :4459
   IID_IStream : IID;                      --  objbase.h :4664
   IID_IEnumSTATSTG : IID;                      --  objbase.h :5018
   IID_IStorage : IID;                      --  objbase.h :5195
   IID_IPersistFile : IID;                      --  objbase.h :5693
   IID_IPersistStorage : IID;                      --  objbase.h :5887
   IID_ILockBytes : IID;                      --  objbase.h :6097
   IID_IEnumFORMATETC : IID;                      --  objbase.h :6384
   IID_IEnumSTATDATA : IID;                      --  objbase.h :6572
   IID_IRootStorage : IID;                      --  objbase.h :6736
   IID_IAdviseSink : IID;                      --  objbase.h :6894
   IID_IAdviseSink2 : IID;                      --  objbase.h :7077
   IID_IDataObject : IID;                      --  objbase.h :7215
   IID_IDataAdviseHolder : IID;                      --  objbase.h :7513
   IID_IMessageFilter : IID;                      --  objbase.h :7736
   IID_IRpcChannelBuffer : IID;                      --  objbase.h :7911
   IID_IRpcProxyBuffer : IID;                      --  objbase.h :8097
   IID_IRpcStubBuffer : IID;                      --  objbase.h :8208
   IID_IPSFactoryBuffer : IID;                      --  objbase.h :8429

   function CLSCTX_ALL return Win32.UINT;                  --  objbase.h :254
   function CLSCTX_INPROC return Win32.UINT;               --  objbase.h :258
   function CLSCTX_SERVER return Win32.UINT;               --  objbase.h :260

   procedure LISet32 (li : in out Win32.Winnt.anonymous1_t;
                     v : in Win32.DWORD);                 --  objbase.h : 245

   procedure ULISet32 (li : in out Win32.Winnt.anonymous1_t;
                      v : in Win32.DWORD);                --  objbase.h : 247

   procedure HGLOBAL_to_xmit
     (phGlobal : access Win32.Windef.HGLOBAL;
                      p2 : access a_RemHGLOBAL_t);       --  objbase.h :1084

   procedure HGLOBAL_from_xmit
     (p1 : a_RemHGLOBAL_t;
      phGlobal : access Win32.Windef.HGLOBAL);
   --  objbase.h :1085

   procedure HGLOBAL_free_inst
     (phGlobal : access Win32.Windef.HGLOBAL);     --  objbase.h :1086

   procedure HGLOBAL_free_xmit
     (p1 : a_RemHGLOBAL_t);                        --  objbase.h :1087

   procedure HBITMAP_to_xmit
     (phBitmap : access Win32.Windef.HBITMAP;
                      p2 : access a_RemHBITMAP_t);          --  objbase.h :1088

   procedure HBITMAP_from_xmit
     (p1 : a_RemHBITMAP_t;
      phBitmap : access Win32.Windef.HBITMAP);
   --  objbase.h :1089

   procedure HBITMAP_free_inst
     (phBitmap : access Win32.Windef.HBITMAP);     --  objbase.h :1090

   procedure HBITMAP_free_xmit
     (p1 : a_RemHBITMAP_t);                        --  objbase.h :1091

   procedure HPALETTE_to_xmit
     (phPalette : access Win32.Windef.HPALETTE;
                      p2 : access a_RemHPALETTE_t);         --  objbase.h :1092

   procedure HPALETTE_from_xmit
     (p1 : a_RemHPALETTE_t;
      phPalette : access Win32.Windef.HPALETTE);     --  objbase.h :1093

   procedure HPALETTE_free_inst
     (phPalette : access Win32.Windef.HPALETTE);   --  objbase.h :1094

   procedure HPALETTE_free_xmit
     (p1 : a_RemHPALETTE_t);                       --  objbase.h :1095

   procedure HBRUSH_to_xmit
     (phBrush : access Win32.Windef.HBRUSH;
      p2 : access a_RemHBRUSH_t);                  --  objbase.h :1096

   procedure HBRUSH_from_xmit
     (p1 : a_RemHBRUSH_t;
      phBrush : access Win32.Windef.HBRUSH);       --  objbase.h :1097

   procedure HBRUSH_free_inst
     (phBrush : access Win32.Windef.HBRUSH);       --  objbase.h :1098

   procedure HBRUSH_free_xmit
     (p1 : a_RemHBRUSH_t);                         --  objbase.h :1099

   procedure HMETAFILEPICT_to_xmit
     (phMetaFilePict : access HMETAFILEPICT;
                      p2 : access a_RemHMETAFILEPICT_t);
   --  objbase.h :1100

   procedure HMETAFILEPICT_from_xmit
     (p1 : a_RemHMETAFILEPICT_t;
      phMetaFilePict : access HMETAFILEPICT);      --  objbase.h :1101

   procedure HMETAFILEPICT_free_inst
     (phMetaFilePict : access HMETAFILEPICT);      --  objbase.h :1102

   procedure HMETAFILEPICT_free_xmit
     (p1 : a_RemHMETAFILEPICT_t);                 --  objbase.h :1103

   procedure HENHMETAFILE_to_xmit
     (phEnhMetaFile : access Win32.Windef.HENHMETAFILE;
                      p2 : access a_RemHENHMETAFILE_t);
   --  objbase.h :1104

   procedure HENHMETAFILE_from_xmit
     (p1 : a_RemHENHMETAFILE_t;
                      phEnhMetaFile : access Win32.Windef.HENHMETAFILE);
   --  objbase.h :1105

   procedure HENHMETAFILE_free_inst
     (phEnhMetaFile : access Win32.Windef.HENHMETAFILE);
   --  objbase.h :1106

   procedure HENHMETAFILE_free_xmit
     (p1 : a_RemHENHMETAFILE_t);                   --  objbase.h :1107

   function IUnknown_QueryInterface_Proxy
     (This : access IUnknown;
                      riid : REFIID;
                      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1493

   procedure IUnknown_QueryInterface_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1499

   function IUnknown_AddRef_Proxy
     (This : access IUnknown)
     return ULONG;                                --  objbase.h :1506

   procedure IUnknown_AddRef_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1510

   function IUnknown_Release_Proxy
     (This : access IUnknown)
     return ULONG;                                --  objbase.h :1517

   procedure IUnknown_Release_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1521

   function IClassFactory_RemoteCreateInstance_Proxy
     (This : access IClassFactory;
                      riid : REFIID;
                      ppvObject : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :1625

   procedure IClassFactory_RemoteCreateInstance_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1631

   function IClassFactory_LockServer_Proxy
     (This : access IClassFactory;
      fLock : BOOL)
     return HRESULT;                              --  objbase.h :1638

   procedure IClassFactory_LockServer_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1643

   function IMarshal_GetUnmarshalClass_Proxy
     (This : access IMarshal;
      riid : REFIID;
      pv : Win32.PVOID;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags : DWORD;
      pCid : access CLSID)
     return HRESULT;                              --  objbase.h :1817

   procedure IMarshal_GetUnmarshalClass_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1827

   function IMarshal_GetMarshalSizeMax_Proxy
     (This : access IMarshal;
      riid : REFIID;
      pv : Win32.PVOID;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags : DWORD;
      pSize : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :1834

   procedure IMarshal_GetMarshalSizeMax_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1844

   function IMarshal_MarshalInterface_Proxy
     (This : access IMarshal;
      pStm : access IStream;
      riid : REFIID;
      pv : Win32.PVOID;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      mshlflags : DWORD)
     return HRESULT;                              --  objbase.h :1851

   procedure IMarshal_MarshalInterface_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1861

   function IMarshal_UnmarshalInterface_Proxy
     (This : access IMarshal;
      pStm : access IStream;
      riid : REFIID;
      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :1868

   procedure IMarshal_UnmarshalInterface_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1875

   function IMarshal_ReleaseMarshalData_Proxy
     (This : access IMarshal;
      pStm : access IStream)
     return HRESULT;                              --  objbase.h :1882

   procedure IMarshal_ReleaseMarshalData_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1887

   function IMarshal_DisconnectObject_Proxy
     (This : access IMarshal;
      dwReserved : DWORD)
     return HRESULT;                              --  objbase.h :1894

   procedure IMarshal_DisconnectObject_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :1899

   function IMalloc_Alloc_Proxy
     (This : access IMalloc;
                      cb : Win32.ULONG)
     return Win32.PVOID;                          --  objbase.h :2039

   procedure IMalloc_Alloc_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2044

   function IMalloc_Realloc_Proxy
     (This : access IMalloc;
      pv : Win32.PVOID;
      cb : Win32.ULONG)
     return Win32.PVOID;                          --  objbase.h :2051

   procedure IMalloc_Realloc_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2057

   procedure IMalloc_Free_Proxy
     (This : access IMalloc;
      pv : Win32.PVOID);                         --  objbase.h :2064

   procedure IMalloc_Free_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2069

   function IMalloc_GetSize_Proxy
     (This : access IMalloc;
      pv : Win32.PVOID)
     return ULONG;                                --  objbase.h :2076

   procedure IMalloc_GetSize_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2081

   function IMalloc_DidAlloc_Proxy
     (This : access IMalloc;
      pv : Win32.PVOID)
     return Win32.INT;                            --  objbase.h :2088

   procedure IMalloc_DidAlloc_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2093

   procedure IMalloc_HeapMinimize_Proxy
     (This : access IMalloc);                      --  objbase.h :2100

   procedure IMalloc_HeapMinimize_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2104

   function IStdMarshalInfo_GetClassForHandler_Proxy
     (This : access IStdMarshalInfo;
      dwDestContext : DWORD;
      pvDestContext : Win32.PVOID;
      pClsid : access CLSID)
     return HRESULT;                              --  objbase.h :2198

   procedure IStdMarshalInfo_GetClassForHandler_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2205

   function IExternalConnection_AddConnection_Proxy
     (This : access IExternalConnection;
      extconn : DWORD;
      reserved : DWORD)
     return DWORD;                                --  objbase.h :2319

   procedure IExternalConnection_AddConnection_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2325

   function IExternalConnection_ReleaseConnection_Proxy
     (This : access IExternalConnection;
      extconn : DWORD;
      reserved : DWORD;
      fLastReleaseCloses : BOOL)
     return DWORD;                                --  objbase.h :2332

   procedure IExternalConnection_ReleaseConnection_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2339

   function IWeakRef_ChangeWeakCount_Proxy
     (This : access IWeakRef;
      c_delta : LONG)
     return ULONG;                                --  objbase.h :2441

   procedure IWeakRef_ChangeWeakCount_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2446

   function IWeakRef_ReleaseKeepAlive_Proxy
     (This : access IWeakRef;
      pUnkReleased : access IUnknown;
      reserved : DWORD)
     return ULONG;                                --  objbase.h :2453

   procedure IWeakRef_ReleaseKeepAlive_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2459

   function IEnumUnknown_RemoteNext_Proxy
     (This : access IEnumUnknown;
      celt : Win32.ULONG;
      rgelt : access LPUNKNOWN;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :2581

   procedure IEnumUnknown_RemoteNext_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2588

   function IEnumUnknown_Skip_Proxy
     (This : access IEnumUnknown;
      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :2595

   procedure IEnumUnknown_Skip_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2600

   function IEnumUnknown_Reset_Proxy
     (This : access IEnumUnknown)
     return HRESULT;                              --  objbase.h :2607

   procedure IEnumUnknown_Reset_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2611

   function IEnumUnknown_Clone_Proxy
     (This : access IEnumUnknown;
                      ppenum : access LPENUMUNKNOWN)
     return HRESULT;                              --  objbase.h :2618

   procedure IEnumUnknown_Clone_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2623

   function IBindCtx_RegisterObjectBound_Proxy
     (This : access IBindCtx;
                      punk : access IUnknown)
     return HRESULT;                              --  objbase.h :2827

   procedure IBindCtx_RegisterObjectBound_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2832

   function IBindCtx_RevokeObjectBound_Proxy
     (This : access IBindCtx;
                      punk : access IUnknown)
     return HRESULT;                              --  objbase.h :2839

   procedure IBindCtx_RevokeObjectBound_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2844

   function IBindCtx_ReleaseBoundObjects_Proxy
     (This : access IBindCtx)
     return HRESULT;                              --  objbase.h :2851

   procedure IBindCtx_ReleaseBoundObjects_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2855

   function IBindCtx_SetBindOptions_Proxy
     (This : access IBindCtx;
                      pbindopts : LPBIND_OPTS)
     return HRESULT;                              --  objbase.h :2862

   procedure IBindCtx_SetBindOptions_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2867

   function IBindCtx_GetBindOptions_Proxy
     (This : access IBindCtx;
                      pbindopts : LPBIND_OPTS)
     return HRESULT;                              --  objbase.h :2874

   procedure IBindCtx_GetBindOptions_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2879

   function IBindCtx_GetRunningObjectTable_Proxy
     (This : access IBindCtx;
                      pprot : access LPRUNNINGOBJECTTABLE)
     return HRESULT;                              --  objbase.h :2886

   procedure IBindCtx_GetRunningObjectTable_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2891

   function IBindCtx_RegisterObjectParam_Proxy
     (This : access IBindCtx;
                      pszKey : LPOLESTR;
                      punk : access IUnknown)
     return HRESULT;                              --  objbase.h :2898

   procedure IBindCtx_RegisterObjectParam_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2904

   function IBindCtx_GetObjectParam_Proxy
     (This : access IBindCtx;
      pszKey : LPOLESTR;
      ppunk : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :2911

   procedure IBindCtx_GetObjectParam_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2917

   function IBindCtx_EnumObjectParam_Proxy
     (This : access IBindCtx;
      ppenum : access LPENUMSTRING)
     return HRESULT;                              --  objbase.h :2924

   procedure IBindCtx_EnumObjectParam_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2929

   function IBindCtx_RevokeObjectParam_Proxy
     (This : access IBindCtx;
                      pszKey : LPOLESTR)
     return HRESULT;                              --  objbase.h :2936

   procedure IBindCtx_RevokeObjectParam_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :2941

   function IParseDisplayName_ParseDisplayName_Proxy
     (This : access IParseDisplayName;
      pbc : access IBindCtx;
      pszDisplayName : LPOLESTR;
      pchEaten : Win32.PDWORD;
      ppmkOut : access LPMONIKER)
     return HRESULT;                              --  objbase.h :3037

   procedure IParseDisplayName_ParseDisplayName_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3045

   function IEnumMoniker_RemoteNext_Proxy
     (This : access IEnumMoniker;
      celt : Win32.ULONG;
      rgelt : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :3167

   procedure IEnumMoniker_RemoteNext_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3174

   function IEnumMoniker_Skip_Proxy
     (This : access IEnumMoniker;
      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :3181

   procedure IEnumMoniker_Skip_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3186

   function IEnumMoniker_Reset_Proxy
     (This : access IEnumMoniker)
     return HRESULT;                              --  objbase.h :3193

   procedure IEnumMoniker_Reset_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3197

   function IEnumMoniker_Clone_Proxy
     (This : access IEnumMoniker;
      ppenum : access LPENUMMONIKER)
     return HRESULT;                              --  objbase.h :3204

   procedure IEnumMoniker_Clone_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3209

   function IRunnableObject_GetRunningClass_Proxy
     (This : access IRunnableObject;
      lpClsid : access CLSID)
     return HRESULT;                              --  objbase.h :3339

   procedure IRunnableObject_GetRunningClass_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3344

   function IRunnableObject_Run_Proxy
     (This : access IRunnableObject;
      pbc : LPBINDCTX)
     return HRESULT;                              --  objbase.h :3351

   procedure IRunnableObject_Run_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3356

   function IRunnableObject_IsRunning_Proxy
     (This : access IRunnableObject)
     return BOOL;                                 --  objbase.h :3363

   procedure IRunnableObject_IsRunning_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3367

   function IRunnableObject_LockRunning_Proxy
     (This : access IRunnableObject;
                      fLock : BOOL;
                      fLastUnlockCloses : BOOL)
     return HRESULT;                              --  objbase.h :3374

   procedure IRunnableObject_LockRunning_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3380

   function IRunnableObject_SetContainedObject_Proxy
     (This : access IRunnableObject;
                      fContained : BOOL)
     return HRESULT;                              --  objbase.h :3387

   procedure IRunnableObject_SetContainedObject_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3392

   function IRunningObjectTable_Register_Proxy
     (This : access IRunningObjectTable;
                      grfFlags : DWORD;
                      punkObject : access IUnknown;
                      pmkObjectName : access IMoniker;
                      pdwRegister : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :3554

   procedure IRunningObjectTable_Register_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3562

   function IRunningObjectTable_Revoke_Proxy
     (This : access IRunningObjectTable;
                      dwRegister : DWORD)
     return HRESULT;                              --  objbase.h :3569

   procedure IRunningObjectTable_Revoke_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3574

   function IRunningObjectTable_IsRunning_Proxy
     (This : access IRunningObjectTable;
                      pmkObjectName : access IMoniker)
     return HRESULT;                              --  objbase.h :3581

   procedure IRunningObjectTable_IsRunning_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3586

   function IRunningObjectTable_GetObject_Proxy
     (This : access IRunningObjectTable;
                      pmkObjectName : access IMoniker;
                      ppunkObject : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :3593

   procedure IRunningObjectTable_GetObject_Stub
     (This              : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage       : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase      : Win32.PDWORD); --  objbase.h :3599

   function IRunningObjectTable_NoteChangeTime_Proxy
     (This : access IRunningObjectTable;
      dwRegister : DWORD;
      pfiletime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :3606

   procedure IRunningObjectTable_NoteChangeTime_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3612

   function IRunningObjectTable_GetTimeOfLastChange_Proxy
     (This : access IRunningObjectTable;
                      pmkObjectName : access IMoniker;
                      pfiletime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :3619

   procedure IRunningObjectTable_GetTimeOfLastChange_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3625

   function IRunningObjectTable_EnumRunning_Proxy
     (This : access IRunningObjectTable;
      ppenumMoniker : access LPENUMMONIKER)
     return HRESULT;                              --  objbase.h :3632

   procedure IRunningObjectTable_EnumRunning_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3637

   function IPersist_GetClassID_Proxy
     (This : access IPersist;
      pClassID : access CLSID)
     return HRESULT;                              --  objbase.h :3727

   procedure IPersist_GetClassID_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3732

   type IPersistStreamVtbl is                              --  objbase.h :3781
      record
         QueryInterface : af_3784_QueryInterface;         --  objbase.h :3784
         AddRef : af_3789_AddRef;                 --  objbase.h :3789
         Release : af_3792_Release;                --  objbase.h :3792
         GetClassID : af_3795_GetClassID;             --  objbase.h :3795
         IsDirty : af_3799_IsDirty;                --  objbase.h :3799
         Load : af_3802_Load;                   --  objbase.h :3802
         Save : af_3806_Save;                   --  objbase.h :3806
         GetSizeMax : af_3811_GetSizeMax;             --  objbase.h :3811
      end record;

   type IMonikerVtbl is                                    --  objbase.h :4027
      record
         QueryInterface : af_4030_QueryInterface;    --  objbase.h :4030
         AddRef : af_4035_AddRef;            --  objbase.h :4035
         Release : af_4038_Release;           --  objbase.h :4038
         GetClassID : af_4041_GetClassID;        --  objbase.h :4041
         IsDirty : af_4045_IsDirty;           --  objbase.h :4045
         Load : af_4048_Load;              --  objbase.h :4048
         Save : af_4052_Save;              --  objbase.h :4052
         GetSizeMax : af_4057_GetSizeMax;        --  objbase.h :4057
         BindToObject : af_4061_BindToObject;      --  objbase.h :4061
         BindToStorage : af_4068_BindToStorage;     --  objbase.h :4068
         Reduce : af_4075_Reduce;            --  objbase.h :4075
         ComposeWith : af_4082_ComposeWith;       --  objbase.h :4082
         Enum : af_4088_Enum;              --  objbase.h :4088
         IsEqual : af_4093_IsEqual;           --  objbase.h :4093
         Hash : af_4097_Hash;              --  objbase.h :4097
         IsRunning : af_4101_IsRunning;         --  objbase.h :4101
         GetTimeOfLastChange : af_4107_GetTimeOfLastChange;
         --  objbase.h :4107
         Inverse : af_4113_Inverse;           --  objbase.h :4113
         CommonPrefixWith : af_4117_CommonPrefixWith;  --  objbase.h :4117
         RelativePathTo : af_4122_RelativePathTo;    --  objbase.h :4122
         GetDisplayName : af_4127_GetDisplayName;    --  objbase.h :4127
         ParseDisplayName : af_4133_ParseDisplayName;  --  objbase.h :4133
         IsSystemMoniker : af_4141_IsSystemMoniker;   --  objbase.h :4141
      end record;



   function IPersistStream_IsDirty_Proxy
     (This : access IPersistStream)
     return HRESULT;                              --  objbase.h :3860

   procedure IPersistStream_IsDirty_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3864

   function IPersistStream_Load_Proxy
     (This : access IPersistStream;
                      pStm : access IStream)
     return HRESULT;                              --  objbase.h :3871

   procedure IPersistStream_Load_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3876

   function IPersistStream_Save_Proxy
     (This : access IPersistStream;
      pStm : access IStream;
      fClearDirty : BOOL)
     return HRESULT;                              --  objbase.h :3883

   procedure IPersistStream_Save_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3889

   function IPersistStream_GetSizeMax_Proxy
     (This : access IPersistStream;
      pcbSize : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :3896

   procedure IPersistStream_GetSizeMax_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :3901

   function IMoniker_RemoteBindToObject_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      riidResult : access IID;
      ppvResult : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :4236

   procedure IMoniker_RemoteBindToObject_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4244

   function IMoniker_RemoteBindToStorage_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      riid : REFIID;
      ppvObj : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :4251

   procedure IMoniker_RemoteBindToStorage_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4259

   function IMoniker_Reduce_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      dwReduceHowFar : DWORD;
      ppmkToLeft : access LPMONIKER;
      ppmkReduced : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4266

   procedure IMoniker_Reduce_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4274

   function IMoniker_ComposeWith_Proxy
     (This : access IMoniker;
      pmkRight : access IMoniker;
      fOnlyIfNotGeneric : BOOL;
      ppmkComposite : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4281

   procedure IMoniker_ComposeWith_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4288

   function IMoniker_Enum_Proxy
     (This : access IMoniker;
      fForward : BOOL;
      ppenumMoniker : access LPENUMMONIKER)
     return HRESULT;                              --  objbase.h :4295

   procedure IMoniker_Enum_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4301

   function IMoniker_IsEqual_Proxy
     (This : access IMoniker;
      pmkOtherMoniker : access IMoniker)
     return HRESULT;                              --  objbase.h :4308

   procedure IMoniker_IsEqual_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4313

   function IMoniker_Hash_Proxy
     (This : access IMoniker;
      pdwHash : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :4320

   procedure IMoniker_Hash_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4325

   function IMoniker_IsRunning_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      pmkNewlyRunning : access IMoniker)
     return HRESULT;                              --  objbase.h :4332

   procedure IMoniker_IsRunning_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4339

   function IMoniker_GetTimeOfLastChange_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      pFileTime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :4346

   procedure IMoniker_GetTimeOfLastChange_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4353

   function IMoniker_Inverse_Proxy
     (This : access IMoniker;
      ppmk : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4360

   procedure IMoniker_Inverse_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4365

   function IMoniker_CommonPrefixWith_Proxy
     (This : access IMoniker;
      pmkOther : access IMoniker;
      ppmkPrefix : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4372

   procedure IMoniker_CommonPrefixWith_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4378

   function IMoniker_RelativePathTo_Proxy
     (This : access IMoniker;
      pmkOther : access IMoniker;
      ppmkRelPath : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4385

   procedure IMoniker_RelativePathTo_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4391

   function IMoniker_GetDisplayName_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      ppszDisplayName : access LPOLESTR)
     return HRESULT;                              --  objbase.h :4398

   procedure IMoniker_GetDisplayName_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4405

   function IMoniker_ParseDisplayName_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      pszDisplayName : LPOLESTR;
      pchEaten : Win32.PDWORD;
      ppmkOut : access LPMONIKER)
     return HRESULT;                              --  objbase.h :4412

   procedure IMoniker_ParseDisplayName_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4421

   function IMoniker_IsSystemMoniker_Proxy
     (This : access IMoniker;
      pdwMksys : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :4428

   procedure IMoniker_IsSystemMoniker_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4433

   function IEnumString_RemoteNext_Proxy
     (This : access IEnumString;
      celt : Win32.ULONG;
      rgelt : access LPOLESTR;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :4555

   procedure IEnumString_RemoteNext_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4562

   function IEnumString_Skip_Proxy
     (This : access IEnumString;
      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :4569

   procedure IEnumString_Skip_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4574

   function IEnumString_Reset_Proxy
     (This : access IEnumString)
     return HRESULT;                              --  objbase.h :4581

   procedure IEnumString_Reset_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4585

   function IEnumString_Clone_Proxy
     (This : access IEnumString;
      ppenum : access LPENUMSTRING)
     return HRESULT;                              --  objbase.h :4592

   procedure IEnumString_Clone_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4597

   function IStream_RemoteRead_Proxy
     (This : access IStream;
      pv : Win32.PBYTE;
      cb : Win32.ULONG;
      pcbRead : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :4854

   procedure IStream_RemoteRead_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4861

   function IStream_RemoteWrite_Proxy
     (This : access IStream;
      pv : Win32.PCBYTE;
      cb : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :4868

   procedure IStream_RemoteWrite_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4875

   function IStream_RemoteSeek_Proxy
     (This : access IStream;
      dlibMove : Win32.Winnt.LARGE_INTEGER;
      dwOrigin : DWORD;
      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :4882

   procedure IStream_RemoteSeek_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4889

   function IStream_SetSize_Proxy
     (This : access IStream;
      libNewSize : Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :4896

   procedure IStream_SetSize_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4901

   function IStream_RemoteCopyTo_Proxy
     (This : access IStream;
      pstm : access IStream;
      cb : Win32.Winnt.ULARGE_INTEGER;
      pcbRead : access Win32.Winnt.ULARGE_INTEGER;
      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :4908

   procedure IStream_RemoteCopyTo_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4916

   function IStream_Commit_Proxy
     (This : access IStream;
      grfCommitFlags : DWORD)
     return HRESULT;                              --  objbase.h :4923

   procedure IStream_Commit_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4928

   function IStream_Revert_Proxy
     (This : access IStream)
     return HRESULT;                              --  objbase.h :4935

   procedure IStream_Revert_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4939

   function IStream_LockRegion_Proxy
     (This : access IStream;
      libOffset : Win32.Winnt.ULARGE_INTEGER;
      cb : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
     return HRESULT;                              --  objbase.h :4946

   procedure IStream_LockRegion_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4953

   function IStream_UnlockRegion_Proxy
     (This : access IStream;
      libOffset : Win32.Winnt.ULARGE_INTEGER;
      cb : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
     return HRESULT;                              --  objbase.h :4960

   procedure IStream_UnlockRegion_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4967

   function IStream_Stat_Proxy
     (This : access IStream;
      pstatstg : access STATSTG;
      grfStatFlag : DWORD)
     return HRESULT;                              --  objbase.h :4974

   procedure IStream_Stat_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4980

   function IStream_Clone_Proxy
     (This : access IStream;
      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :4987

   procedure IStream_Clone_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :4992

   function IEnumSTATSTG_RemoteNext_Proxy
     (This : access IEnumSTATSTG;
      celt : Win32.ULONG;
      rgelt : access STATSTG;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :5114

   procedure IEnumSTATSTG_RemoteNext_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5121

   function IEnumSTATSTG_Skip_Proxy
     (This : access IEnumSTATSTG;
      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :5128

   procedure IEnumSTATSTG_Skip_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5133

   function IEnumSTATSTG_Reset_Proxy
     (This : access IEnumSTATSTG)
     return HRESULT;                              --  objbase.h :5140

   procedure IEnumSTATSTG_Reset_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5144

   function IEnumSTATSTG_Clone_Proxy
     (This : access IEnumSTATSTG;
      ppenum : access LPENUMSTATSTG)
     return HRESULT;                              --  objbase.h :5151

   procedure IEnumSTATSTG_Clone_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5156

   function IStorage_CreateStream_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR;
      grfMode : DWORD;
      reserved1 : DWORD;
      reserved2 : DWORD;
      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :5461

   procedure IStorage_CreateStream_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5470

   function IStorage_RemoteOpenStream_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR;
      cbReserved1 : Win32.UINT;
      reserved1 : Win32.PBYTE;
      grfMode : DWORD;
      reserved2 : DWORD;
      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :5477

   procedure IStorage_RemoteOpenStream_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5487

   function IStorage_CreateStorage_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR;
      grfMode : DWORD;
      dwStgFmt : DWORD;
      reserved2 : DWORD;
      ppstg : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :5494

   procedure IStorage_CreateStorage_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5503

   function IStorage_OpenStorage_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR;
      pstgPriority : access IStorage;
      grfMode : DWORD;
      snbExclude : SNB;
      reserved : DWORD;
      ppstg : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :5510

   procedure IStorage_OpenStorage_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5520

   function IStorage_CopyTo_Proxy
     (This : access IStorage;
      ciidExclude : DWORD;
      rgiidExclude : access IID;
      snbExclude : SNB;
      pstgDest : access IStorage)
     return HRESULT;                              --  objbase.h :5527

   procedure IStorage_CopyTo_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5535

   function IStorage_MoveElementTo_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR;
      pstgDest : access IStorage;
      pwcsNewName : PCWSTR;
      grfFlags : DWORD)
     return HRESULT;                              --  objbase.h :5542

   procedure IStorage_MoveElementTo_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5550

   function IStorage_Commit_Proxy
     (This : access IStorage;
      grfCommitFlags : DWORD)
     return HRESULT;                              --  objbase.h :5557

   procedure IStorage_Commit_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5562

   function IStorage_Revert_Proxy
     (This : access IStorage)
     return HRESULT;                              --  objbase.h :5569

   procedure IStorage_Revert_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5573

   function IStorage_RemoteEnumElements_Proxy
     (This : access IStorage;
      reserved1 : DWORD;
      cbReserved2 : Win32.UINT;
      reserved2 : Win32.PBYTE;
      reserved3 : DWORD;
      ppenum : access LPENUMSTATSTG)
     return HRESULT;                              --  objbase.h :5580

   procedure IStorage_RemoteEnumElements_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5589

   function IStorage_DestroyElement_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR)
     return HRESULT;                              --  objbase.h :5596

   procedure IStorage_DestroyElement_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5601

   function IStorage_RenameElement_Proxy
     (This : access IStorage;
      pwcsOldName : PCWSTR;
      pwcsNewName : PCWSTR)
     return HRESULT;                              --  objbase.h :5608

   procedure IStorage_RenameElement_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5614

   function IStorage_SetElementTimes_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR;
      pctime : Win32.Winbase.ac_FILETIME_t;
      patime : Win32.Winbase.ac_FILETIME_t;
      pmtime : Win32.Winbase.ac_FILETIME_t)
     return HRESULT;                              --  objbase.h :5621

   procedure IStorage_SetElementTimes_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5629

   function IStorage_SetClass_Proxy
     (This : access IStorage;
      clsid : REFCLSID)
     return HRESULT;                              --  objbase.h :5636

   procedure IStorage_SetClass_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5641

   function IStorage_SetStateBits_Proxy
     (This : access IStorage;
      grfStateBits : DWORD;
      grfMask : DWORD)
     return HRESULT;                              --  objbase.h :5648

   procedure IStorage_SetStateBits_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5654

   function IStorage_Stat_Proxy
     (This : access IStorage;
      pstatstg : access STATSTG;
      grfStatFlag : DWORD)
     return HRESULT;                              --  objbase.h :5661

   procedure IStorage_Stat_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5667

   function IPersistFile_IsDirty_Proxy
     (This : access IPersistFile)
     return HRESULT;                              --  objbase.h :5807

   procedure IPersistFile_IsDirty_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5811

   function IPersistFile_Load_Proxy
     (This : access IPersistFile;
      pszFileName : LPCOLESTR;
      dwMode : DWORD)
     return HRESULT;                              --  objbase.h :5818

   procedure IPersistFile_Load_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5824

   function IPersistFile_Save_Proxy
     (This : access IPersistFile;
      pszFileName : LPCOLESTR;
      fRemember : BOOL)
     return HRESULT;                              --  objbase.h :5831

   procedure IPersistFile_Save_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5837

   function IPersistFile_SaveCompleted_Proxy
     (This : access IPersistFile;
      pszFileName : LPCOLESTR)
     return HRESULT;                              --  objbase.h :5844

   procedure IPersistFile_SaveCompleted_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5849

   function IPersistFile_GetCurFile_Proxy
     (This : access IPersistFile;
      ppszFileName : access LPOLESTR)
     return HRESULT;                              --  objbase.h :5856

   procedure IPersistFile_GetCurFile_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :5861

   function IPersistStorage_IsDirty_Proxy
     (This : access IPersistStorage)
     return HRESULT;                              --  objbase.h :6007

   procedure IPersistStorage_IsDirty_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6011

   function IPersistStorage_InitNew_Proxy
     (This : access IPersistStorage;
      pStg : access IStorage)
     return HRESULT;                              --  objbase.h :6018

   procedure IPersistStorage_InitNew_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6023

   function IPersistStorage_Load_Proxy
     (This : access IPersistStorage;
      pStg : access IStorage)
     return HRESULT;                              --  objbase.h :6030

   procedure IPersistStorage_Load_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6035

   function IPersistStorage_Save_Proxy
     (This : access IPersistStorage;
      pStgSave : access IStorage;
      fSameAsLoad : BOOL)
     return HRESULT;                              --  objbase.h :6042

   procedure IPersistStorage_Save_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6048

   function IPersistStorage_SaveCompleted_Proxy
     (This : access IPersistStorage;
      pStgNew : access IStorage)
     return HRESULT;                              --  objbase.h :6055

   procedure IPersistStorage_SaveCompleted_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6060

   function IPersistStorage_HandsOffStorage_Proxy
     (This : access IPersistStorage)
     return HRESULT;                              --  objbase.h :6067

   procedure IPersistStorage_HandsOffStorage_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6071

   function ILockBytes_RemoteReadAt_Proxy
     (This : access ILockBytes;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv : Win32.PBYTE;
      cb : Win32.ULONG;
      pcbRead : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :6241

   procedure ILockBytes_RemoteReadAt_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6249

   function ILockBytes_RemoteWriteAt_Proxy
     (This : access ILockBytes;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv : Win32.PCBYTE;
      cb : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :6256

   procedure ILockBytes_RemoteWriteAt_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6264

   function ILockBytes_Flush_Proxy
     (This : access ILockBytes)
     return HRESULT;                              --  objbase.h :6271

   procedure ILockBytes_Flush_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6275

   function ILockBytes_SetSize_Proxy
     (This : access ILockBytes;
      cb : Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :6282

   procedure ILockBytes_SetSize_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6287

   function ILockBytes_LockRegion_Proxy
     (This : access ILockBytes;
      libOffset : Win32.Winnt.ULARGE_INTEGER;
      cb : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
     return HRESULT;                              --  objbase.h :6294

   procedure ILockBytes_LockRegion_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6301

   function ILockBytes_UnlockRegion_Proxy
     (This : access ILockBytes;
      libOffset : Win32.Winnt.ULARGE_INTEGER;
      cb : Win32.Winnt.ULARGE_INTEGER;
      dwLockType : DWORD)
     return HRESULT;                              --  objbase.h :6308

   procedure ILockBytes_UnlockRegion_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6315

   function ILockBytes_Stat_Proxy
     (This : access ILockBytes;
      pstatstg : access STATSTG;
      grfStatFlag : DWORD)
     return HRESULT;                              --  objbase.h :6322

   procedure ILockBytes_Stat_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6328

   function IEnumFORMATETC_RemoteNext_Proxy
     (This : access IEnumFORMATETC;
      celt : Win32.ULONG;
      rgelt : access FORMATETC;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :6480

   procedure IEnumFORMATETC_RemoteNext_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6487

   function IEnumFORMATETC_Skip_Proxy
     (This : access IEnumFORMATETC;
      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :6494

   procedure IEnumFORMATETC_Skip_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6499

   function IEnumFORMATETC_Reset_Proxy
     (This : access IEnumFORMATETC)
     return HRESULT;                              --  objbase.h :6506

   procedure IEnumFORMATETC_Reset_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6510

   function IEnumFORMATETC_Clone_Proxy
     (This : access IEnumFORMATETC;
      ppenum : access LPENUMFORMATETC)
     return HRESULT;                              --  objbase.h :6517

   procedure IEnumFORMATETC_Clone_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6522

   function IEnumSTATDATA_RemoteNext_Proxy
     (This : access IEnumSTATDATA;
      celt : Win32.ULONG;
      rgelt : access STATDATA;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :6668

   procedure IEnumSTATDATA_RemoteNext_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6675

   function IEnumSTATDATA_Skip_Proxy
     (This : access IEnumSTATDATA;
      celt : Win32.ULONG)
     return HRESULT;                              --  objbase.h :6682

   procedure IEnumSTATDATA_Skip_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6687

   function IEnumSTATDATA_Reset_Proxy
     (This : access IEnumSTATDATA)
     return HRESULT;                              --  objbase.h :6694

   procedure IEnumSTATDATA_Reset_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6698

   function IEnumSTATDATA_Clone_Proxy
     (This : access IEnumSTATDATA;
      ppenum : access LPENUMSTATDATA)
     return HRESULT;                              --  objbase.h :6705

   procedure IEnumSTATDATA_Clone_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6710

   function IRootStorage_SwitchToFile_Proxy
     (This : access IRootStorage;
      pszFile : LPOLESTR)
     return HRESULT;                              --  objbase.h :6800

   procedure IRootStorage_SwitchToFile_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :6805

   procedure IAdviseSink_RemoteOnDataChange_Proxy
     (This : access IAdviseSink;
      pFormatetc : access FORMATETC;
      pStgmed : access RemSTGMEDIUM);           --  objbase.h :6998

   procedure IAdviseSink_RemoteOnDataChange_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7004

   procedure IAdviseSink_RemoteOnViewChange_Proxy
     (This : access IAdviseSink;
      dwAspect : DWORD;
      lindex : LONG);                            --  objbase.h :7011

   procedure IAdviseSink_RemoteOnViewChange_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7017

   procedure IAdviseSink_RemoteOnRename_Proxy
     (This : access IAdviseSink;
      pmk : access IMoniker);                     --  objbase.h :7024

   procedure IAdviseSink_RemoteOnRename_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7029

   procedure IAdviseSink_RemoteOnSave_Proxy
     (This : access IAdviseSink);                  --  objbase.h :7036

   procedure IAdviseSink_RemoteOnSave_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7040

   procedure IAdviseSink_RemoteOnClose_Proxy
     (This : access IAdviseSink);                  --  objbase.h :7047

   procedure IAdviseSink_RemoteOnClose_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7051

   procedure IAdviseSink2_RemoteOnLinkSrcChange_Proxy
     (This : access IAdviseSink2;
      pmk : access IMoniker);                     --  objbase.h :7177

   procedure IAdviseSink2_RemoteOnLinkSrcChange_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7182

   function IDataObject_RemoteGetData_Proxy
     (This : access IDataObject;
      pformatetcIn : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
     return HRESULT;                              --  objbase.h :7377

   procedure IDataObject_RemoteGetData_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7383

   function IDataObject_RemoteGetDataHere_Proxy
     (This : access IDataObject;
      pformatetc : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
     return HRESULT;                              --  objbase.h :7390

   procedure IDataObject_RemoteGetDataHere_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7396

   function IDataObject_QueryGetData_Proxy
     (This : access IDataObject;
      pformatetc : access FORMATETC)
     return HRESULT;                              --  objbase.h :7403

   procedure IDataObject_QueryGetData_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7408

   function IDataObject_GetCanonicalFormatEtc_Proxy
     (This : access IDataObject;
      pformatectIn : access FORMATETC;
      pformatetcOut : access FORMATETC)
     return HRESULT;                              --  objbase.h :7415

   procedure IDataObject_GetCanonicalFormatEtc_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7421

   function IDataObject_RemoteSetData_Proxy
     (This : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium : a_RemSTGMEDIUM_t;
      fRelease : BOOL)
     return HRESULT;                              --  objbase.h :7428

   procedure IDataObject_RemoteSetData_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7435

   function IDataObject_EnumFormatEtc_Proxy
     (This : access IDataObject;
      dwDirection : DWORD;
      ppenumFormatEtc : access LPENUMFORMATETC)
     return HRESULT;                              --  objbase.h :7442

   procedure IDataObject_EnumFormatEtc_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7448

   function IDataObject_DAdvise_Proxy
     (This : access IDataObject;
      pformatetc : access FORMATETC;
      advf : DWORD;
      pAdvSink : access IAdviseSink;
      pdwConnection : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :7455

   procedure IDataObject_DAdvise_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7463

   function IDataObject_DUnadvise_Proxy
     (This : access IDataObject;
      dwConnection : DWORD)
     return HRESULT;                              --  objbase.h :7470

   procedure IDataObject_DUnadvise_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7475

   function IDataObject_EnumDAdvise_Proxy
     (This : access IDataObject;
      ppenumAdvise : access LPENUMSTATDATA)
     return HRESULT;                              --  objbase.h :7482

   procedure IDataObject_EnumDAdvise_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7487

   function IDataAdviseHolder_Advise_Proxy
     (This : access IDataAdviseHolder;
      pDataObject : access IDataObject;
      pFetc : access FORMATETC;
      advf : DWORD;
      pAdvise : access IAdviseSink;
      pdwConnection : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :7619

   procedure IDataAdviseHolder_Advise_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7628

   function IDataAdviseHolder_Unadvise_Proxy
     (This : access IDataAdviseHolder;
      dwConnection : DWORD)
     return HRESULT;                              --  objbase.h :7635

   procedure IDataAdviseHolder_Unadvise_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7640

   function IDataAdviseHolder_EnumAdvise_Proxy
     (This : access IDataAdviseHolder;
      ppenumAdvise : access LPENUMSTATDATA)
     return HRESULT;                              --  objbase.h :7647

   procedure IDataAdviseHolder_EnumAdvise_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7652

   function IDataAdviseHolder_SendOnDataChange_Proxy
     (This : access IDataAdviseHolder;
      pDataObject : access IDataObject;
      dwReserved : DWORD;
      advf : DWORD)
     return HRESULT;                              --  objbase.h :7659

   procedure IDataAdviseHolder_SendOnDataChange_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7666

   function IMessageFilter_HandleInComingCall_Proxy
     (This : access IMessageFilter;
      dwCallType : DWORD;
      htaskCaller : Win32.Windef.HTASK;
      dwTickCount : DWORD;
      lpInterfaceInfo : Win32.Objbase.LPINTERFACEINFO)
     return DWORD;                                --  objbase.h :7834

   procedure IMessageFilter_HandleInComingCall_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7842

   function IMessageFilter_RetryRejectedCall_Proxy
     (This : access IMessageFilter;
      htaskCallee : Win32.Windef.HTASK;
      dwTickCount : DWORD;
      dwRejectType : DWORD)
     return DWORD;                                --  objbase.h :7849

   procedure IMessageFilter_RetryRejectedCall_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7856

   function IMessageFilter_MessagePending_Proxy
     (This : access IMessageFilter;
      htaskCallee : Win32.Windef.HTASK;
      dwTickCount : DWORD;
      dwPendingType : DWORD)
     return DWORD;                                --  objbase.h :7863

   procedure IMessageFilter_MessagePending_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :7870

   function IRpcChannelBuffer_GetBuffer_Proxy
     (This : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE;
      riid : REFIID)
     return HRESULT;                              --  objbase.h :8019

   procedure IRpcChannelBuffer_GetBuffer_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8025

   function IRpcChannelBuffer_SendReceive_Proxy
     (This : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE;
      pStatus : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8032

   procedure IRpcChannelBuffer_SendReceive_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8038

   function IRpcChannelBuffer_FreeBuffer_Proxy
     (This : access IRpcChannelBuffer;
      pMessage : access RPCOLEMESSAGE)
     return HRESULT;                              --  objbase.h :8045

   procedure IRpcChannelBuffer_FreeBuffer_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8050

   function IRpcChannelBuffer_GetDestCtx_Proxy
     (This : access IRpcChannelBuffer;
      pdwDestContext : Win32.PDWORD;
      ppvDestContext : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8057

   procedure IRpcChannelBuffer_GetDestCtx_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8063

   function IRpcChannelBuffer_IsConnected_Proxy
     (This : access IRpcChannelBuffer)
     return HRESULT;                              --  objbase.h :8070

   procedure IRpcChannelBuffer_IsConnected_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8074

   function IRpcProxyBuffer_Connect_Proxy
     (This : access IRpcProxyBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer)
     return HRESULT;                              --  objbase.h :8169

   procedure IRpcProxyBuffer_Connect_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8174

   procedure IRpcProxyBuffer_Disconnect_Proxy
     (This : access IRpcProxyBuffer);              --  objbase.h :8181

   procedure IRpcProxyBuffer_Disconnect_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8185

   function IRpcStubBuffer_Connect_Proxy
     (This : access IRpcStubBuffer;
      pUnkServer : access IUnknown)
     return HRESULT;                              --  objbase.h :8330

   procedure IRpcStubBuffer_Connect_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8335

   procedure IRpcStubBuffer_Disconnect_Proxy
     (This : access IRpcStubBuffer);               --  objbase.h :8342

   procedure IRpcStubBuffer_Disconnect_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8346

   function IRpcStubBuffer_Invoke_Proxy
     (This : access IRpcStubBuffer;
      prpcmsg : access RPCOLEMESSAGE;
      pRpcChannelBuffer : access IRpcChannelBuffer)
     return HRESULT;                              --  objbase.h :8353

   procedure IRpcStubBuffer_Invoke_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8359

   function IRpcStubBuffer_IsIIDSupported_Proxy
     (This : access IRpcStubBuffer;
      riid : REFIID)
     return a_IRpcStubBuffer_t;                   --  objbase.h :8366

   procedure IRpcStubBuffer_IsIIDSupported_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8371

   function IRpcStubBuffer_CountRefs_Proxy
     (This : access IRpcStubBuffer)
     return ULONG;                                --  objbase.h :8378

   procedure IRpcStubBuffer_CountRefs_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8382

   function IRpcStubBuffer_DebugServerQueryInterface_Proxy
     (This : access IRpcStubBuffer;
      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8389

   procedure IRpcStubBuffer_DebugServerQueryInterface_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8394

   procedure IRpcStubBuffer_DebugServerRelease_Proxy
     (This : access IRpcStubBuffer;
      pv : Win32.PVOID);                         --  objbase.h :8401

   procedure IRpcStubBuffer_DebugServerRelease_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8406

   function IPSFactoryBuffer_CreateProxy_Proxy
     (This : access IPSFactoryBuffer;
      pUnkOuter : access IUnknown;
      riid : REFIID;
      ppProxy : access PIRpcProxyBuffer;
      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8513

   procedure IPSFactoryBuffer_CreateProxy_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8521

   function IPSFactoryBuffer_CreateStub_Proxy
     (This : access IPSFactoryBuffer;
                      riid : REFIID;
                      pUnkServer : access IUnknown;
                      ppStub : access a_IRpcStubBuffer_t)
     return HRESULT;                              --  objbase.h :8528

   procedure IPSFactoryBuffer_CreateStub_Stub
     (This : access IRpcStubBuffer;
      pRpcChannelBuffer : access IRpcChannelBuffer;
      pRpcMessage : Win32.Rpcdcep.PRPC_MESSAGE;
      pdwStubPhase : Win32.PDWORD);           --  objbase.h :8535

   procedure SNB_to_xmit
     (p1 : access SNB;
      p2 : access a_RemSNB_t);                     --  objbase.h :8549

   procedure SNB_from_xmit
     (p1 : a_RemSNB_t;
      p2 : access SNB);                            --  objbase.h :8550

   procedure SNB_free_inst
     (p1 : access SNB);                            --  objbase.h :8551

   procedure SNB_free_xmit
     (p1 : a_RemSNB_t);                            --  objbase.h :8552

   function IClassFactory_CreateInstance_Proxy
     (This : access IClassFactory;
      pUnkOuter : access IUnknown;
      riid : REFIID;
      ppvObject : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8553

   function IClassFactory_CreateInstance_Stub
     (This : access IRpcStubBuffer;
      riid : REFIID;
      ppvObject : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :8560

   function IEnumUnknown_Next_Proxy
     (This : access IEnumUnknown;
      celt : Win32.ULONG;
      rgelt : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8565

   function IEnumUnknown_Next_Stub
     (This : access IRpcStubBuffer;
      celt : Win32.ULONG;
      rgelt : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8572

   function IEnumMoniker_Next_Proxy
     (This : access IEnumMoniker;
      celt : Win32.ULONG;
      rgelt : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8578

   function IEnumMoniker_Next_Stub
     (This : access IRpcStubBuffer;
      celt : Win32.ULONG;
      rgelt : access LPMONIKER;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8585

   function IMoniker_BindToObject_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      riidResult : access IID;
      ppvResult : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8591

   function IMoniker_BindToObject_Stub
     (This : access IRpcStubBuffer;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      riidResult : access IID;
      ppvResult : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :8599

   function IMoniker_BindToStorage_Proxy
     (This : access IMoniker;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      riid : REFIID;
      ppvObj : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8606

   function IMoniker_BindToStorage_Stub
     (This : access IRpcStubBuffer;
      pbc : access IBindCtx;
      pmkToLeft : access IMoniker;
      riid : REFIID;
      ppvObj : access LPUNKNOWN)
     return HRESULT;                              --  objbase.h :8614

   function IEnumString_Next_Proxy
     (This : access IEnumString;
      celt : Win32.ULONG;
      rgelt : access LPOLESTR;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8621

   function IEnumString_Next_Stub
     (This : access IRpcStubBuffer;
      celt : Win32.ULONG;
      rgelt : access LPOLESTR;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8628

   function IStream_Read_Proxy
     (This : access IStream;
      pv : Win32.PVOID;
      cb : Win32.ULONG;
      pcbRead : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8634

   function IStream_Read_Stub
     (This : access IRpcStubBuffer;
      pv : Win32.PBYTE;
      cb : Win32.ULONG;
      pcbRead : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8641

   function IStream_Write_Proxy
     (This : access IStream;
      pv : PCVOID;
      cb : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8647

   function IStream_Write_Stub
     (This : access IRpcStubBuffer;
      pv : Win32.PCBYTE;
      cb : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8654

   function IStream_Seek_Proxy
     (This : access IStream;
      dlibMove : Win32.Winnt.LARGE_INTEGER;
      dwOrigin : DWORD;
      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :8660

   function IStream_Seek_Stub
     (This : access IRpcStubBuffer;
      dlibMove : Win32.Winnt.LARGE_INTEGER;
      dwOrigin : DWORD;
      plibNewPosition : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :8667

   function IStream_CopyTo_Proxy
     (This : access IStream;
      pstm : access IStream;
      cb : Win32.Winnt.ULARGE_INTEGER;
      pcbRead : access Win32.Winnt.ULARGE_INTEGER;
      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :8673

   function IStream_CopyTo_Stub
     (This : access IRpcStubBuffer;
      pstm : access IStream;
      cb : Win32.Winnt.ULARGE_INTEGER;
      pcbRead : access Win32.Winnt.ULARGE_INTEGER;
      pcbWritten : access Win32.Winnt.ULARGE_INTEGER)
     return HRESULT;                              --  objbase.h :8681

   function IEnumSTATSTG_Next_Proxy
     (This : access IEnumSTATSTG;
      celt : Win32.ULONG;
      rgelt : access STATSTG;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8688

   function IEnumSTATSTG_Next_Stub
     (This : access IRpcStubBuffer;
      celt : Win32.ULONG;
      rgelt : access STATSTG;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8695

   function IStorage_OpenStream_Proxy
     (This : access IStorage;
      pwcsName : PCWSTR;
      reserved1 : Win32.PVOID;
      grfMode : DWORD;
      reserved2 : DWORD;
      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :8701

   function IStorage_OpenStream_Stub
     (This : access IRpcStubBuffer;
      pwcsName : PCWSTR;
      cbReserved1 : Win32.UINT;
      reserved1 : Win32.PBYTE;
      grfMode : DWORD;
      reserved2 : DWORD;
      ppstm : access LPSTREAM)
     return HRESULT;                              --  objbase.h :8710

   function IStorage_EnumElements_Proxy
     (This : access IStorage;
      reserved1 : DWORD;
      reserved2 : Win32.PVOID;
      reserved3 : DWORD;
      ppenum : access LPENUMSTATSTG)
     return HRESULT;                              --  objbase.h :8719

   function IStorage_EnumElements_Stub
     (This : access IRpcStubBuffer;
      reserved1 : DWORD;
      cbReserved2 : Win32.UINT;
      reserved2 : Win32.PBYTE;
      reserved3 : DWORD;
      ppenum : access LPENUMSTATSTG)
     return HRESULT;                              --  objbase.h :8727

   function ILockBytes_ReadAt_Proxy
     (This : access ILockBytes;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv : Win32.PVOID;
      cb : Win32.ULONG;
      pcbRead : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8735

   function ILockBytes_ReadAt_Stub
     (This : access IRpcStubBuffer;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv : Win32.PBYTE;
      cb : Win32.ULONG;
      pcbRead : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8743

   function ILockBytes_WriteAt_Proxy
     (This : access ILockBytes;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv : PCVOID;
      cb : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8750

   function ILockBytes_WriteAt_Stub
     (This : access IRpcStubBuffer;
      ulOffset : Win32.Winnt.ULARGE_INTEGER;
      pv : Win32.PCBYTE;
      cb : Win32.ULONG;
      pcbWritten : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8758

   function IEnumFORMATETC_Next_Proxy
     (This : access IEnumFORMATETC;
      celt : Win32.ULONG;
      rgelt : access FORMATETC;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8765

   function IEnumFORMATETC_Next_Stub
     (This : access IRpcStubBuffer;
      celt : Win32.ULONG;
      rgelt : access FORMATETC;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8772

   function IEnumSTATDATA_Next_Proxy
     (This : access IEnumSTATDATA;
      celt : Win32.ULONG;
      rgelt : access STATDATA;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8778

   function IEnumSTATDATA_Next_Stub
     (This : access IRpcStubBuffer;
      celt : Win32.ULONG;
      rgelt : access STATDATA;
      pceltFetched : Win32.PDWORD)
     return HRESULT;                              --  objbase.h :8785

   procedure IAdviseSink_OnDataChange_Proxy
     (This : access IAdviseSink;
      pFormatetc : access FORMATETC;
      pStgmed : access STGMEDIUM);              --  objbase.h :8791

   procedure IAdviseSink_OnDataChange_Stub
     (This : access IRpcStubBuffer;
      pFormatetc : access FORMATETC;
      pStgmed : access RemSTGMEDIUM);           --  objbase.h :8797

   procedure IAdviseSink_OnViewChange_Proxy
     (This : access IAdviseSink;
      dwAspect : DWORD;
      lindex : LONG);                            --  objbase.h :8802

   procedure IAdviseSink_OnViewChange_Stub
     (This : access IRpcStubBuffer;
      dwAspect : DWORD;
      lindex : LONG);                            --  objbase.h :8808

   procedure IAdviseSink_OnRename_Proxy
     (This : access IAdviseSink;
      pmk : access IMoniker);                     --  objbase.h :8813

   procedure IAdviseSink_OnRename_Stub
     (This : access IRpcStubBuffer;
      pmk : access IMoniker);                     --  objbase.h :8818

   procedure IAdviseSink_OnSave_Proxy
     (This : access IAdviseSink);                  --  objbase.h :8822

   procedure IAdviseSink_OnSave_Stub
     (This : access IRpcStubBuffer);               --  objbase.h :8826

   procedure IAdviseSink_OnClose_Proxy
     (This : access IAdviseSink);                  --  objbase.h :8829

   procedure IAdviseSink_OnClose_Stub
     (This : access IRpcStubBuffer);               --  objbase.h :8833

   procedure IAdviseSink2_OnLinkSrcChange_Proxy
     (This : access IAdviseSink2;
      pmk : access IMoniker);                     --  objbase.h :8836

   procedure IAdviseSink2_OnLinkSrcChange_Stub
     (This : access IRpcStubBuffer;
      pmk : access IMoniker);                     --  objbase.h :8841

   function IDataObject_GetData_Proxy
     (This : access IDataObject;
      pformatetcIn : access FORMATETC;
      pmedium : access STGMEDIUM)
     return HRESULT;                              --  objbase.h :8845

   function IDataObject_GetData_Stub
     (This : access IRpcStubBuffer;
      pformatetcIn : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
     return HRESULT;                              --  objbase.h :8851

   function IDataObject_GetDataHere_Proxy
     (This : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium : access STGMEDIUM)
     return HRESULT;                              --  objbase.h :8856

   function IDataObject_GetDataHere_Stub
     (This : access IRpcStubBuffer;
      pformatetc : access FORMATETC;
      ppRemoteMedium : access a_RemSTGMEDIUM_t)
     return HRESULT;                              --  objbase.h :8862

   function IDataObject_SetData_Proxy
     (This : access IDataObject;
      pformatetc : access FORMATETC;
      pmedium : access STGMEDIUM;
      fRelease : BOOL)
     return HRESULT;                              --  objbase.h :8867

   function IDataObject_SetData_Stub
     (This : access IRpcStubBuffer;
      pformatetc : access FORMATETC;
      pmedium : a_RemSTGMEDIUM_t;
      fRelease : BOOL)
     return HRESULT;                              --  objbase.h :8874

   function IsEqualGUID
     (rguid1 : REFGUID;
      rguid2 : REFGUID)
     return Win32.BOOL;                 --  objbase.h :8923

   function IsEqualIID (riid1 : REFGUID;
                        riid2 : REFGUID)
                       return Win32.BOOL
     renames IsEqualGUID;                --  objbase.h :953, 8926

   function IsEqualCLSID
     (rclsid1 : REFCLSID;
      rclsid2 : REFCLSID)
     return Win32.BOOL;                --  objbase.h :961, 8927

   function CoBuildVersion return DWORD;                   --  objbase.h :8959

   function CoInitialize
     (pvReserved : Win32.LPVOID)
     return HRESULT;                              --  objbase.h :8963

   procedure CoUninitialize;                               --  objbase.h :8964

   function CoGetMalloc
     (dwMemContext : DWORD;
                      ppMalloc : access LPMALLOC)
     return HRESULT;                              --  objbase.h :8965

   function CoGetCurrentProcess return DWORD;              --  objbase.h :8966

   function CoCreateStandardMalloc
     (memctx : DWORD;
                      ppMalloc : access LPMALLOC)
     return HRESULT;                              --  objbase.h :8967

   function CoGetClassObject
     (rclsid : REFCLSID;
                      dwClsContext : DWORD;
                      pvReserved : Win32.LPVOID;
                      riid : REFIID;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8976

   function CoRegisterClassObject
     (rclsid : REFCLSID;
                      pUnk : LPUNKNOWN;
                      dwClsContext : DWORD;
                      flags : DWORD;
                      lpdwRegister : LPDWORD)
     return HRESULT;                              --  objbase.h :8978

   function CoRevokeClassObject
     (dwRegister : DWORD)
     return HRESULT;                              --  objbase.h :8980

   function CoGetMarshalSizeMax
     (pulSize : Win32.PDWORD;
                      riid : REFIID;
                      pUnk : LPUNKNOWN;
                      dwDestContext : DWORD;
                      pvDestContext : Win32.LPVOID;
                      mshlflags : DWORD)
     return HRESULT;                              --  objbase.h :8985

   function CoMarshalInterface
     (pStm : access IStream;
                      riid : REFIID;
                      pUnk : LPUNKNOWN;
                      dwDestContext : DWORD;
                      pvDestContext : Win32.LPVOID;
                      mshlflags : DWORD)
     return HRESULT;                              --  objbase.h :8987

   function CoUnmarshalInterface
     (pStm : access IStream;
                      riid : REFIID;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :8989

   function CoMarshalHresult
     (pstm : access IStream;
                      hresult : Win32.Objbase.HRESULT)
     return Win32.Objbase.HRESULT;                --  objbase.h :8990

   function CoUnmarshalHresult
     (pstm : access IStream;
                      phresult : access Win32.Objbase.HRESULT)
     return HRESULT;                              --  objbase.h :8991

   function CoReleaseMarshalData
     (pStm : access IStream)
     return HRESULT;                              --  objbase.h :8992

   function CoDisconnectObject
     (pUnk : LPUNKNOWN;
                      dwReserved : DWORD)
     return HRESULT;                              --  objbase.h :8993

   function CoLockObjectExternal
     (pUnk : LPUNKNOWN;
                      fLock : BOOL;
                      fLastUnlockReleases : BOOL)
     return HRESULT;                              --  objbase.h :8994

   function CoGetStandardMarshal
     (riid : REFIID;
                      pUnk : LPUNKNOWN;
                      dwDestContext : DWORD;
                      pvDestContext : Win32.LPVOID;
                      mshlflags : DWORD;
                      ppMarshal : access LPMARSHAL)
     return HRESULT;                              --  objbase.h :8995

   function CoIsHandlerConnected
     (pUnk : LPUNKNOWN)
     return BOOL;                                 --  objbase.h :8999

   function CoHasStrongExternalConnections
     (pUnk : LPUNKNOWN)
     return BOOL;                                 --  objbase.h :9000

   function CoLoadLibrary
     (lpszLibName : LPOLESTR;
                      bAutoFree : BOOL)
     return Win32.Windef.HINSTANCE;               --  objbase.h :9005

   procedure CoFreeLibrary
     (hInst : Win32.Windef.HINSTANCE);             --  objbase.h :9006

   procedure CoFreeAllLibraries;                           --  objbase.h :9007

   procedure CoFreeUnusedLibraries;                        --  objbase.h :9008

   function CoCreateInstance
     (rclsid : REFCLSID;
                      pUnkOuter : LPUNKNOWN;
                      dwClsContext : DWORD;
                      riid : REFIID;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :9013

   function StringFromCLSID
     (rclsid : REFCLSID;
                      lplpsz : access LPOLESTR)
     return HRESULT;                              --  objbase.h :9019

   function CLSIDFromString
     (lpsz : LPOLESTR;
                      pclsid : access CLSID)
     return HRESULT;                              --  objbase.h :9020

   function StringFromIID
     (rclsid : REFIID;
                      lplpsz : access LPOLESTR)
     return HRESULT;                              --  objbase.h :9021

   function IIDFromString
     (lpsz : LPOLESTR;
                      lpiid : Win32.Objbase.LPIID)
     return HRESULT;                              --  objbase.h :9022

   function CoIsOle1Class
     (rclsid : REFCLSID)
     return BOOL;                                 --  objbase.h :9023

   function ProgIDFromCLSID
     (clsid : REFCLSID;
                      lplpszProgID : access LPOLESTR)
     return HRESULT;                              --  objbase.h :9024

   function CLSIDFromProgID
     (lpszProgID : LPCOLESTR;
                      lpclsid : access CLSID)
     return HRESULT;                              --  objbase.h :9025

   function StringFromGUID2
     (rguid : access IID;
                      lpsz : LPOLESTR;
                      cbMax : Win32.INT)
     return Win32.INT;                            --  objbase.h :9026

   function CoCreateGuid
     (pguid : access Win32.Rpcdce.GUID)
     return HRESULT;                              --  objbase.h :9028

   function CoFileTimeToDosDateTime
     (lpFileTime : access Win32.Winbase.FILETIME;
                      lpDosDate : LPWORD;
                      lpDosTime : LPWORD)
     return BOOL;                                 --  objbase.h :9030

   function CoDosDateTimeToFileTime
     (nDosDate : WORD;
                      nDosTime : WORD;
                      lpFileTime : access Win32.Winbase.FILETIME)
     return BOOL;                                 --  objbase.h :9032

   function CoFileTimeNow
     (lpFileTime : access Win32.Winbase.FILETIME)
     return HRESULT;                              --  objbase.h :9034

   function CoRegisterMessageFilter
     (lpMessageFilter : Win32.Objbase.LPMESSAGEFILTER;
                      lplpMessageFilter : access Win32.Objbase.LPMESSAGEFILTER)
     return HRESULT;                              --  objbase.h :9037

   function CoGetTreatAsClass
     (clsidOld : REFCLSID;
                      pClsidNew : access CLSID)
     return HRESULT;                              --  objbase.h :9043

   function CoTreatAsClass
     (clsidOld : REFCLSID;
                      clsidNew : access IID)
     return HRESULT;                              --  objbase.h :9044

   function DllGetClassObject
     (rclsid : REFCLSID;
                      riid : REFIID;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :9064

   function DllCanUnloadNow return HRESULT;                --  objbase.h :9066

   function CoTaskMemAlloc
     (cb : Win32.ULONG)
     return LPVOID;                               --  objbase.h :9070

   function CoTaskMemRealloc
     (pv : Win32.LPVOID;
                      cb : Win32.ULONG)
     return LPVOID;                               --  objbase.h :9071

   procedure CoTaskMemFree
     (pv : Win32.LPVOID);                          --  objbase.h :9072

   function CreateDataAdviseHolder
     (ppDAHolder : access LPDATAADVISEHOLDER)
     return HRESULT;                              --  objbase.h :9077

   function CreateDataCache
     (pUnkOuter : LPUNKNOWN;
                      rclsid : REFCLSID;
                      iid : access Win32.Objbase.IID;
                      ppv : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :9079

   function StgCreateDocfile
     (pwcsName : PCWSTR;
                      grfMode : DWORD;
                      reserved : DWORD;
                      ppstgOpen : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :9088

   function StgCreateDocfileOnILockBytes
     (plkbyt : access ILockBytes;
                      grfMode : DWORD;
                      reserved : DWORD;
                      ppstgOpen : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :9093

   function StgOpenStorage
     (pwcsName : PCWSTR;
                      pstgPriority : access IStorage;
                      grfMode : DWORD;
                      snbExclude : SNB;
                      reserved : DWORD;
                      ppstgOpen : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :9098

   function StgOpenStorageOnILockBytes
     (plkbyt : access ILockBytes;
                      pstgPriority : access IStorage;
                      grfMode : DWORD;
                      snbExclude : SNB;
                      reserved : DWORD;
                      ppstgOpen : access LPSTORAGE)
     return HRESULT;                              --  objbase.h :9104

   function StgIsStorageFile
     (pwcsName : PCWSTR)
     return HRESULT;                              --  objbase.h :9111

   function StgIsStorageILockBytes
     (plkbyt : access ILockBytes)
     return HRESULT;                              --  objbase.h :9112

   function StgSetTimes
     (lpszName : PCWSTR;
                      pctime : Win32.Winbase.ac_FILETIME_t;
                      patime : Win32.Winbase.ac_FILETIME_t;
                      pmtime : Win32.Winbase.ac_FILETIME_t)
     return HRESULT;                              --  objbase.h :9114

   function BindMoniker
     (pmk : LPMONIKER;
                      grfOpt : DWORD;
                      iidResult : access IID;
                      ppvResult : access Win32.PVOID)
     return HRESULT;                              --  objbase.h :9124

   function MkParseDisplayName
     (pbc : LPBC;
                      szUserName : LPCOLESTR;
                      pchEaten : Win32.PDWORD;
                      ppmk : access LPMONIKER)
     return HRESULT;                              --  objbase.h :9125

   function MonikerRelativePathTo
     (pmkSrc : LPMONIKER;
                      pmkDest : LPMONIKER;
                      ppmkRelPath : access LPMONIKER;
                      fCalledFromMethod : BOOL)
     return HRESULT;                              --  objbase.h :9127

   function MonikerCommonPrefixWith
     (pmkThis : LPMONIKER;
                      pmkOther : LPMONIKER;
                      ppmkCommon : access LPMONIKER)
     return HRESULT;                              --  objbase.h :9129

   function CreateBindCtx
     (reserved : DWORD;
                      ppbc : access LPBC)
     return HRESULT;                              --  objbase.h :9131

   function CreateGenericComposite
     (pmkFirst : LPMONIKER;
                      pmkRest : LPMONIKER;
                      ppmkComposite : access LPMONIKER)
     return HRESULT;                              --  objbase.h :9132

   function GetClassFile
     (szFilename : LPCOLESTR;
                      pclsid : access CLSID)
     return HRESULT;                              --  objbase.h :9134

   function CreateFileMoniker
     (lpszPathName : LPCOLESTR;
                      ppmk : access LPMONIKER)
     return HRESULT;                              --  objbase.h :9136

   function CreateItemMoniker
     (lpszDelim : LPCOLESTR;
                      lpszItem : LPCOLESTR;
                      ppmk : access LPMONIKER)
     return HRESULT;                              --  objbase.h :9138

   function CreateAntiMoniker
     (ppmk : access LPMONIKER)
     return HRESULT;                              --  objbase.h :9140

   function CreatePointerMoniker
     (punk : LPUNKNOWN;
                      ppmk : access LPMONIKER)
     return HRESULT;                              --  objbase.h :9141

   function GetRunningObjectTable
     (reserved : DWORD;
                      pprot : access LPRUNNINGOBJECTTABLE)
     return HRESULT;                              --  objbase.h :9143

private

   pragma Convention (C_Pass_By_Copy, RemHGLOBAL);          --  objbase.h :331
   pragma Convention (C, RemHMETAFILEPICT);                 --  objbase.h :339
   pragma Convention (C_Pass_By_Copy, RemHENHMETAFILE);     --  objbase.h :352
   pragma Convention (C_Pass_By_Copy, RemHBITMAP);          --  objbase.h :359
   pragma Convention (C_Pass_By_Copy, RemHPALETTE);         --  objbase.h :366
   pragma Convention (C_Pass_By_Copy, RemBRUSH);            --  objbase.h :373
   pragma Convention (C, OBJECTID);                         --  objbase.h :937
   pragma Convention (C_Pass_By_Copy, IUnknown);            --  objbase.h :1173
   pragma Convention (C_Pass_By_Copy, IClassFactory);       --  objbase.h :1179
   pragma Convention (C_Pass_By_Copy, IMarshal);            --  objbase.h :1185
   pragma Convention (C_Pass_By_Copy, IMalloc);             --  objbase.h :1191
   pragma Convention (C_Pass_By_Copy, IStdMarshalInfo);     --  objbase.h :1197
   pragma Convention (C_Pass_By_Copy, IExternalConnection); --  objbase.h :1203
   pragma Convention (C_Pass_By_Copy, IWeakRef);            --  objbase.h :1209
   pragma Convention (C_Pass_By_Copy, IEnumUnknown);        --  objbase.h :1215
   pragma Convention (C_Pass_By_Copy, IBindCtx);            --  objbase.h :1221
   pragma Convention (C_Pass_By_Copy, IParseDisplayName);   --  objbase.h :1227
   pragma Convention (C_Pass_By_Copy, IEnumMoniker);        --  objbase.h :1233
   pragma Convention (C_Pass_By_Copy, IRunnableObject);     --  objbase.h :1239
   pragma Convention (C_Pass_By_Copy, IRunningObjectTable); --  objbase.h :1245
   pragma Convention (C_Pass_By_Copy, IPersist);            --  objbase.h :1251
   pragma Convention (C_Pass_By_Copy, IPersistStream);      --  objbase.h :1257
   pragma Convention (C_Pass_By_Copy, IMoniker);            --  objbase.h :1263
   pragma Convention (C_Pass_By_Copy, IEnumString);         --  objbase.h :1269
   pragma Convention (C_Pass_By_Copy, IStream);             --  objbase.h :1275
   pragma Convention (C_Pass_By_Copy, IEnumSTATSTG);        --  objbase.h :1281
   pragma Convention (C_Pass_By_Copy, IStorage);            --  objbase.h :1287
   pragma Convention (C_Pass_By_Copy, IPersistFile);        --  objbase.h :1293
   pragma Convention (C_Pass_By_Copy, IPersistStorage);     --  objbase.h :1299
   pragma Convention (C_Pass_By_Copy, ILockBytes);          --  objbase.h :1305
   pragma Convention (C_Pass_By_Copy, IEnumFORMATETC);      --  objbase.h :1311
   pragma Convention (C_Pass_By_Copy, IEnumSTATDATA);       --  objbase.h :1317
   pragma Convention (C_Pass_By_Copy, IRootStorage);        --  objbase.h :1323
   pragma Convention (C_Pass_By_Copy, IAdviseSink);         --  objbase.h :1329
   pragma Convention (C_Pass_By_Copy, IAdviseSink2);        --  objbase.h :1335
   pragma Convention (C_Pass_By_Copy, IDataObject);         --  objbase.h :1341
   pragma Convention (C_Pass_By_Copy, IDataAdviseHolder);   --  objbase.h :1347
   pragma Convention (C_Pass_By_Copy, IMessageFilter);      --  objbase.h :1353
   pragma Convention (C_Pass_By_Copy, IRpcProxyBuffer);     --  objbase.h :1365
   pragma Convention (C_Pass_By_Copy, IPSFactoryBuffer);    --  objbase.h :1377
   pragma Convention (C_Pass_By_Copy, IUnknownVtbl);        --  objbase.h :1451
   pragma Convention (C, IClassFactoryVtbl);                --  objbase.h :1566
   pragma Convention (C, IMarshalVtbl);                     --  objbase.h :1715
   pragma Convention (C, IMallocVtbl);                      --  objbase.h :1954
   pragma Convention (C_Pass_By_Copy, IStdMarshalInfoVtbl); --  objbase.h :2146
   pragma Convention (C, IExternalConnectionVtbl);          --  objbase.h :2259
   pragma Convention (C, IWeakRefVtbl);                     --  objbase.h :2383
   pragma Convention (C, IEnumUnknownVtbl);                 --  objbase.h :2509
   pragma Convention (C_Pass_By_Copy, BIND_OPTS);           --  objbase.h :2652
   pragma Convention (C, IBindCtxVtbl);                     --  objbase.h :2713
   pragma Convention (C_Pass_By_Copy, IParseDisplayNameVtbl);
   --  objbase.h :2984
   pragma Convention (C, IEnumMonikerVtbl);                 --  objbase.h :3095
   pragma Convention (C, IRunnableObjectVtbl);              --  objbase.h :3261
   pragma Convention (C, IRunningObjectTableVtbl);          --  objbase.h :3456
   pragma Convention (C_Pass_By_Copy, IPersistVtbl);        --  objbase.h :3677
   pragma Convention (C, IEnumStringVtbl);                  --  objbase.h :4483
   pragma Convention (C, STATSTG);                          --  objbase.h :4623
   pragma Convention (C, IStreamVtbl);                      --  objbase.h :4721
   pragma Convention (C, IEnumSTATSTGVtbl);                 --  objbase.h :5042
   pragma Convention (C_Pass_By_Copy, RemSNB);              --  objbase.h :5182
   pragma Convention (C, IStorageVtbl);                     --  objbase.h :5282
   pragma Convention (C, IPersistFileVtbl);                 --  objbase.h :5720
   pragma Convention (C, IPersistStorageVtbl);              --  objbase.h :5915
   pragma Convention (C, ILockBytesVtbl);                   --  objbase.h :6139
   pragma Convention (C_Pass_By_Copy, DVTARGETDEVICE);      --  objbase.h :6354
   pragma Convention (C, FORMATETC);                        --  objbase.h :6371
   pragma Convention (C, IEnumFORMATETCVtbl);               --  objbase.h :6408
   pragma Convention (C, STATDATA);                         --  objbase.h :6560
   pragma Convention (C, IEnumSTATDATAVtbl);                --  objbase.h :6596
   pragma Convention (C_Pass_By_Copy, IRootStorageVtbl);    --  objbase.h :6750
   pragma Convention (C_Pass_By_Copy, RemSTGMEDIUM);        --  objbase.h :6845
   pragma Convention (C_Pass_By_Copy, STGMEDIUM);           --  objbase.h :6857
   pragma Convention (C, IAdviseSinkVtbl);                  --  objbase.h :6920
   pragma Convention (C, IAdviseSink2Vtbl);                 --  objbase.h :7091
   pragma Convention (C, IDataObjectVtbl);                  --  objbase.h :7262
   pragma Convention (C, IDataAdviseHolderVtbl);            --  objbase.h :7542
   pragma Convention (C, INTERFACEINFO);                    --  objbase.h :7725
   pragma Convention (C, IMessageFilterVtbl);               --  objbase.h :7763
   pragma Convention (C, RPCOLEMESSAGE);                    --  objbase.h :7896
   pragma Convention (C_Pass_By_Copy, IRpcChannelBufferVtbl);
   --  objbase.h :7939
   pragma Convention (C_Pass_By_Copy, IRpcChannelBuffer);   --  objbase.h :7977
   pragma Convention (C, IRpcProxyBufferVtbl);              --  objbase.h :8113
   pragma Convention (C_Pass_By_Copy, IRpcStubBufferVtbl);  --  objbase.h :8239
   pragma Convention (C_Pass_By_Copy, IRpcStubBuffer);      --  objbase.h :8282
   pragma Convention (C, IPSFactoryBufferVtbl);             --  objbase.h :8451
   pragma Convention (C, IPersistStreamVtbl);               --  objbase.h :3781
   pragma Convention (C, IMonikerVtbl);                     --  objbase.h :4027

   pragma Import (Stdcall, IWinTypes_v0_1_c_ifspec, "IWinTypes_v0_1_c_ifspec");
   --  objbase.h :1110
   pragma Import (Stdcall, IWinTypes_v0_1_s_ifspec, "IWinTypes_v0_1_s_ifspec");
   --  objbase.h :1111
   pragma Import (Stdcall, MIDL_intf_0000_v0_0_c_ifspec,
                   "__MIDL__intf_0000_v0_0_c_ifspec");
   --  objbase.h :1147
   pragma Import (Stdcall, MIDL_intf_0000_v0_0_s_ifspec,
                   "__MIDL__intf_0000_v0_0_s_ifspec");
   --  objbase.h :1148
   pragma Import (Stdcall, IID_IUnknown, "IID_IUnknown");   --  objbase.h :1432
   pragma Import (Stdcall, IID_IClassFactory, "IID_IClassFactory");
   --  objbase.h :1547
   pragma Import (Stdcall, IID_IMarshal, "IID_IMarshal");   --  objbase.h :1669
   pragma Import (Stdcall, IID_IMalloc, "IID_IMalloc");     --  objbase.h :1925
   pragma Import (Stdcall, IID_IStdMarshalInfo, "IID_IStdMarshalInfo");
   --  objbase.h :2130
   pragma Import (Stdcall, IID_IExternalConnection, "IID_IExternalConnection");
   --  objbase.h :2239
   pragma Import (Stdcall, IID_IWeakRef, "IID_IWeakRef");   --  objbase.h :2365
   pragma Import (Stdcall, IID_IEnumUnknown, "IID_IEnumUnknown");
   --  objbase.h :2485
   pragma Import (Stdcall, IID_IBindCtx, "IID_IBindCtx");   --  objbase.h :2671
   pragma Import (Stdcall, IID_IParseDisplayName, "IID_IParseDisplayName");
   --  objbase.h :2967
   pragma Import (Stdcall, IID_IEnumMoniker, "IID_IEnumMoniker");
   --  objbase.h :3071
   pragma Import (Stdcall, IID_IRunnableObject, "IID_IRunnableObject");
   --  objbase.h :3235
   pragma Import (Stdcall, IID_IRunningObjectTable, "IID_IRunningObjectTable");
   --  objbase.h :3418
   pragma Import (Stdcall, IID_IPersist, "IID_IPersist");   --  objbase.h :3663
   pragma Import (Stdcall, IID_IPersistStream, "IID_IPersistStream");
   --  objbase.h :3758
   pragma Import (Stdcall, IID_IMoniker, "IID_IMoniker");   --  objbase.h :3947
   pragma Import (Stdcall, IID_IEnumString, "IID_IEnumString");
   --  objbase.h :4459
   pragma Import (Stdcall, IID_IStream, "IID_IStream");     --  objbase.h :4664
   pragma Import (Stdcall, IID_IEnumSTATSTG, "IID_IEnumSTATSTG");
   --  objbase.h :5018
   pragma Import (Stdcall, IID_IStorage, "IID_IStorage");   --  objbase.h :5195
   pragma Import (Stdcall, IID_IPersistFile, "IID_IPersistFile");
   --  objbase.h :5693
   pragma Import (Stdcall, IID_IPersistStorage, "IID_IPersistStorage");
   --  objbase.h :5887
   pragma Import (Stdcall, IID_ILockBytes, "IID_ILockBytes");
   --  objbase.h :6097
   pragma Import (Stdcall, IID_IEnumFORMATETC, "IID_IEnumFORMATETC");
   --  objbase.h :6384
   pragma Import (Stdcall, IID_IEnumSTATDATA, "IID_IEnumSTATDATA");
   --  objbase.h :6572
   pragma Import (Stdcall, IID_IRootStorage, "IID_IRootStorage");
   --  objbase.h :6736
   pragma Import (Stdcall, IID_IAdviseSink, "IID_IAdviseSink");
   --  objbase.h :6894
   pragma Import (Stdcall, IID_IAdviseSink2, "IID_IAdviseSink2");
   --  objbase.h :7077
   pragma Import (Stdcall, IID_IDataObject, "IID_IDataObject");
   --  objbase.h :7215
   pragma Import (Stdcall, IID_IDataAdviseHolder, "IID_IDataAdviseHolder");
   --  objbase.h :7513
   pragma Import (Stdcall, IID_IMessageFilter, "IID_IMessageFilter");
   --  objbase.h :7736
   pragma Import (Stdcall, IID_IRpcChannelBuffer, "IID_IRpcChannelBuffer");
   --  objbase.h :7911
   pragma Import (Stdcall, IID_IRpcProxyBuffer, "IID_IRpcProxyBuffer");
   --  objbase.h :8097
   pragma Import (Stdcall, IID_IRpcStubBuffer, "IID_IRpcStubBuffer");
   --  objbase.h :8208
   pragma Import (Stdcall, IID_IPSFactoryBuffer, "IID_IPSFactoryBuffer");
   --  objbase.h :8429
   pragma Import (Stdcall, HGLOBAL_to_xmit, "HGLOBAL_to_xmit");
   --  objbase.h :1084
   pragma Import (Stdcall, HGLOBAL_from_xmit, "HGLOBAL_from_xmit");
   --  objbase.h :1085
   pragma Import (Stdcall, HGLOBAL_free_inst, "HGLOBAL_free_inst");
   --  objbase.h :1086
   pragma Import (Stdcall, HGLOBAL_free_xmit, "HGLOBAL_free_xmit");
   --  objbase.h :1087
   pragma Import (Stdcall, HBITMAP_to_xmit, "HBITMAP_to_xmit");
   --  objbase.h :1088
   pragma Import (Stdcall, HBITMAP_from_xmit, "HBITMAP_from_xmit");
   --  objbase.h :1089
   pragma Import (Stdcall, HBITMAP_free_inst, "HBITMAP_free_inst");
   --  objbase.h :1090
   pragma Import (Stdcall, HBITMAP_free_xmit, "HBITMAP_free_xmit");
   --  objbase.h :1091
   pragma Import (Stdcall, HPALETTE_to_xmit, "HPALETTE_to_xmit");
   --  objbase.h :1092
   pragma Import (Stdcall, HPALETTE_from_xmit, "HPALETTE_from_xmit");
   --  objbase.h :1093
   pragma Import (Stdcall, HPALETTE_free_inst, "HPALETTE_free_inst");
   --  objbase.h :1094
   pragma Import (Stdcall, HPALETTE_free_xmit, "HPALETTE_free_xmit");
   --  objbase.h :1095
   pragma Import (Stdcall, HBRUSH_to_xmit, "HBRUSH_to_xmit");
   --  objbase.h :1096
   pragma Import (Stdcall, HBRUSH_from_xmit, "HBRUSH_from_xmit");
   --  objbase.h :1097
   pragma Import (Stdcall, HBRUSH_free_inst, "HBRUSH_free_inst");
   --  objbase.h :1098
   pragma Import (Stdcall, HBRUSH_free_xmit, "HBRUSH_free_xmit");
   --  objbase.h :1099
   pragma Import (Stdcall, HMETAFILEPICT_to_xmit, "HMETAFILEPICT_to_xmit");
   --  objbase.h :1100
   pragma Import (Stdcall, HMETAFILEPICT_from_xmit, "HMETAFILEPICT_from_xmit");
   --  objbase.h :1101
   pragma Import (Stdcall, HMETAFILEPICT_free_inst, "HMETAFILEPICT_free_inst");
   --  objbase.h :1102
   pragma Import (Stdcall, HMETAFILEPICT_free_xmit, "HMETAFILEPICT_free_xmit");
   --  objbase.h :1103
   pragma Import (Stdcall, HENHMETAFILE_to_xmit, "HENHMETAFILE_to_xmit");
   --  objbase.h :1104
   pragma Import (Stdcall, HENHMETAFILE_from_xmit, "HENHMETAFILE_from_xmit");
   --  objbase.h :1105
   pragma Import (Stdcall, HENHMETAFILE_free_inst, "HENHMETAFILE_free_inst");
   --  objbase.h :1106
   pragma Import (Stdcall, HENHMETAFILE_free_xmit, "HENHMETAFILE_free_xmit");
   --  objbase.h :1107
   pragma Import (Stdcall, IUnknown_QueryInterface_Proxy,
                   "IUnknown_QueryInterface_Proxy");      --  objbase.h :1493
   pragma Import (Stdcall, IUnknown_QueryInterface_Stub,
                   "IUnknown_QueryInterface_Stub");       --  objbase.h :1499
   pragma Import (Stdcall, IUnknown_AddRef_Proxy, "IUnknown_AddRef_Proxy");
   --  objbase.h :1506
   pragma Import (Stdcall, IUnknown_AddRef_Stub, "IUnknown_AddRef_Stub");
   --  objbase.h :1510
   pragma Import (Stdcall, IUnknown_Release_Proxy, "IUnknown_Release_Proxy");
   --  objbase.h :1517
   pragma Import (Stdcall, IUnknown_Release_Stub, "IUnknown_Release_Stub");
   --  objbase.h :1521
   pragma Import (Stdcall, IClassFactory_RemoteCreateInstance_Proxy,
                   "IClassFactory_RemoteCreateInstance_Proxy");
   --  objbase.h :1625
   pragma Import (Stdcall, IClassFactory_RemoteCreateInstance_Stub,
                   "IClassFactory_RemoteCreateInstance_Stub");
   --  objbase.h :1631
   pragma Import (Stdcall, IClassFactory_LockServer_Proxy,
                   "IClassFactory_LockServer_Proxy");     --  objbase.h :1638
   pragma Import (Stdcall, IClassFactory_LockServer_Stub,
                   "IClassFactory_LockServer_Stub");      --  objbase.h :1643
   pragma Import (Stdcall, IMarshal_GetUnmarshalClass_Proxy,
                   "IMarshal_GetUnmarshalClass_Proxy");   --  objbase.h :1817
   pragma Import (Stdcall, IMarshal_GetUnmarshalClass_Stub,
                   "IMarshal_GetUnmarshalClass_Stub");    --  objbase.h :1827
   pragma Import (Stdcall, IMarshal_GetMarshalSizeMax_Proxy,
                   "IMarshal_GetMarshalSizeMax_Proxy");   --  objbase.h :1834
   pragma Import (Stdcall, IMarshal_GetMarshalSizeMax_Stub,
                   "IMarshal_GetMarshalSizeMax_Stub");    --  objbase.h :1844
   pragma Import (Stdcall, IMarshal_MarshalInterface_Proxy,
                   "IMarshal_MarshalInterface_Proxy");    --  objbase.h :1851
   pragma Import (Stdcall, IMarshal_MarshalInterface_Stub,
                   "IMarshal_MarshalInterface_Stub");     --  objbase.h :1861
   pragma Import (Stdcall, IMarshal_UnmarshalInterface_Proxy,
                   "IMarshal_UnmarshalInterface_Proxy");  --  objbase.h :1868
   pragma Import (Stdcall, IMarshal_UnmarshalInterface_Stub,
                   "IMarshal_UnmarshalInterface_Stub");   --  objbase.h :1875
   pragma Import (Stdcall, IMarshal_ReleaseMarshalData_Proxy,
                   "IMarshal_ReleaseMarshalData_Proxy");  --  objbase.h :1882
   pragma Import (Stdcall, IMarshal_ReleaseMarshalData_Stub,
                   "IMarshal_ReleaseMarshalData_Stub");   --  objbase.h :1887
   pragma Import (Stdcall, IMarshal_DisconnectObject_Proxy,
                   "IMarshal_DisconnectObject_Proxy");    --  objbase.h :1894
   pragma Import (Stdcall, IMarshal_DisconnectObject_Stub,
                   "IMarshal_DisconnectObject_Stub");     --  objbase.h :1899
   pragma Import (Stdcall, IMalloc_Alloc_Proxy,
                   "IMalloc_Alloc_Proxy");                --  objbase.h :2039
   pragma Import (Stdcall, IMalloc_Alloc_Stub, "IMalloc_Alloc_Stub");
   --  objbase.h :2044
   pragma Import (Stdcall, IMalloc_Realloc_Proxy, "IMalloc_Realloc_Proxy");
   --  objbase.h :2051
   pragma Import (Stdcall, IMalloc_Realloc_Stub, "IMalloc_Realloc_Stub");
   --  objbase.h :2057
   pragma Import (Stdcall, IMalloc_Free_Proxy, "IMalloc_Free_Proxy");
   --  objbase.h :2064
   pragma Import (Stdcall, IMalloc_Free_Stub, "IMalloc_Free_Stub");
   --  objbase.h :2069
   pragma Import (Stdcall, IMalloc_GetSize_Proxy, "IMalloc_GetSize_Proxy");
   --  objbase.h :2076
   pragma Import (Stdcall, IMalloc_GetSize_Stub, "IMalloc_GetSize_Stub");
   --  objbase.h :2081
   pragma Import (Stdcall, IMalloc_DidAlloc_Proxy, "IMalloc_DidAlloc_Proxy");
   --  objbase.h :2088
   pragma Import (Stdcall, IMalloc_DidAlloc_Stub, "IMalloc_DidAlloc_Stub");
   --  objbase.h :2093
   pragma Import (Stdcall, IMalloc_HeapMinimize_Proxy,
                  "IMalloc_HeapMinimize_Proxy");
   --  objbase.h :2100
   pragma Import (Stdcall, IMalloc_HeapMinimize_Stub,
                  "IMalloc_HeapMinimize_Stub");
   --  objbase.h :2104
   pragma Import (Stdcall, IStdMarshalInfo_GetClassForHandler_Proxy,
                  "IStdMarshalInfo_GetClassForHandler_Proxy");
   --  objbase.h :2198
   pragma Import (Stdcall, IStdMarshalInfo_GetClassForHandler_Stub,
                  "IStdMarshalInfo_GetClassForHandler_Stub");
   --  objbase.h :2205
   pragma Import (Stdcall, IExternalConnection_AddConnection_Proxy,
                  "IExternalConnection_AddConnection_Proxy");
   --  objbase.h :2319
   pragma Import (Stdcall, IExternalConnection_AddConnection_Stub,
                  "IExternalConnection_AddConnection_Stub");
   --  objbase.h :2325
   pragma Import (Stdcall, IExternalConnection_ReleaseConnection_Proxy,
                  "IExternalConnection_ReleaseConnection_Proxy");
   --  objbase.h :2332
   pragma Import (Stdcall, IExternalConnection_ReleaseConnection_Stub,
                   "IExternalConnection_ReleaseConnection_Stub");
   --  objbase.h :2339
   pragma Import (Stdcall, IWeakRef_ChangeWeakCount_Proxy,
                   "IWeakRef_ChangeWeakCount_Proxy");     --  objbase.h :2441
   pragma Import (Stdcall, IWeakRef_ChangeWeakCount_Stub,
                   "IWeakRef_ChangeWeakCount_Stub");      --  objbase.h :2446
   pragma Import (Stdcall, IWeakRef_ReleaseKeepAlive_Proxy,
                   "IWeakRef_ReleaseKeepAlive_Proxy");    --  objbase.h :2453
   pragma Import (Stdcall, IWeakRef_ReleaseKeepAlive_Stub,
                   "IWeakRef_ReleaseKeepAlive_Stub");     --  objbase.h :2459
   pragma Import (Stdcall, IEnumUnknown_RemoteNext_Proxy,
                   "IEnumUnknown_RemoteNext_Proxy");      --  objbase.h :2581
   pragma Import (Stdcall, IEnumUnknown_RemoteNext_Stub,
                   "IEnumUnknown_RemoteNext_Stub");       --  objbase.h :2588
   pragma Import (Stdcall, IEnumUnknown_Skip_Proxy, "IEnumUnknown_Skip_Proxy");
   --  objbase.h :2595
   pragma Import (Stdcall, IEnumUnknown_Skip_Stub, "IEnumUnknown_Skip_Stub");
   --  objbase.h :2600
   pragma Import (Stdcall, IEnumUnknown_Reset_Proxy,
                    "IEnumUnknown_Reset_Proxy");
   --  objbase.h :2607
   pragma Import (Stdcall, IEnumUnknown_Reset_Stub, "IEnumUnknown_Reset_Stub");
   --  objbase.h :2611
   pragma Import (Stdcall, IEnumUnknown_Clone_Proxy,
                    "IEnumUnknown_Clone_Proxy");
   --  objbase.h :2618
   pragma Import (Stdcall, IEnumUnknown_Clone_Stub, "IEnumUnknown_Clone_Stub");
   --  objbase.h :2623
   pragma Import (Stdcall, IBindCtx_RegisterObjectBound_Proxy,
                   "IBindCtx_RegisterObjectBound_Proxy"); --  objbase.h :2827
   pragma Import (Stdcall, IBindCtx_RegisterObjectBound_Stub,
                   "IBindCtx_RegisterObjectBound_Stub");  --  objbase.h :2832
   pragma Import (Stdcall, IBindCtx_RevokeObjectBound_Proxy,
                   "IBindCtx_RevokeObjectBound_Proxy");   --  objbase.h :2839
   pragma Import (Stdcall, IBindCtx_RevokeObjectBound_Stub,
                   "IBindCtx_RevokeObjectBound_Stub");    --  objbase.h :2844
   pragma Import (Stdcall, IBindCtx_ReleaseBoundObjects_Proxy,
                   "IBindCtx_ReleaseBoundObjects_Proxy"); --  objbase.h :2851
   pragma Import (Stdcall, IBindCtx_ReleaseBoundObjects_Stub,
                   "IBindCtx_ReleaseBoundObjects_Stub");  --  objbase.h :2855
   pragma Import (Stdcall, IBindCtx_SetBindOptions_Proxy,
                   "IBindCtx_SetBindOptions_Proxy");      --  objbase.h :2862
   pragma Import (Stdcall, IBindCtx_SetBindOptions_Stub,
                   "IBindCtx_SetBindOptions_Stub");       --  objbase.h :2867
   pragma Import (Stdcall, IBindCtx_GetBindOptions_Proxy,
                   "IBindCtx_GetBindOptions_Proxy");      --  objbase.h :2874
   pragma Import (Stdcall, IBindCtx_GetBindOptions_Stub,
                   "IBindCtx_GetBindOptions_Stub");       --  objbase.h :2879
   pragma Import (Stdcall, IBindCtx_GetRunningObjectTable_Proxy,
                   "IBindCtx_GetRunningObjectTable_Proxy");
   --  objbase.h :2886
   pragma Import (Stdcall, IBindCtx_GetRunningObjectTable_Stub,
                   "IBindCtx_GetRunningObjectTable_Stub"); --  objbase.h :2891
   pragma Import (Stdcall, IBindCtx_RegisterObjectParam_Proxy,
                   "IBindCtx_RegisterObjectParam_Proxy"); --  objbase.h :2898
   pragma Import (Stdcall, IBindCtx_RegisterObjectParam_Stub,
                   "IBindCtx_RegisterObjectParam_Stub");  --  objbase.h :2904
   pragma Import (Stdcall, IBindCtx_GetObjectParam_Proxy,
                   "IBindCtx_GetObjectParam_Proxy");      --  objbase.h :2911
   pragma Import (Stdcall, IBindCtx_GetObjectParam_Stub,
                   "IBindCtx_GetObjectParam_Stub");       --  objbase.h :2917
   pragma Import (Stdcall, IBindCtx_EnumObjectParam_Proxy,
                   "IBindCtx_EnumObjectParam_Proxy");     --  objbase.h :2924
   pragma Import (Stdcall, IBindCtx_EnumObjectParam_Stub,
                   "IBindCtx_EnumObjectParam_Stub");      --  objbase.h :2929
   pragma Import (Stdcall, IBindCtx_RevokeObjectParam_Proxy,
                   "IBindCtx_RevokeObjectParam_Proxy");   --  objbase.h :2936
   pragma Import (Stdcall, IBindCtx_RevokeObjectParam_Stub,
                   "IBindCtx_RevokeObjectParam_Stub");    --  objbase.h :2941
   pragma Import (Stdcall, IParseDisplayName_ParseDisplayName_Proxy,
                   "IParseDisplayName_ParseDisplayName_Proxy");
   --  objbase.h :3037
   pragma Import (Stdcall, IParseDisplayName_ParseDisplayName_Stub,
                   "IParseDisplayName_ParseDisplayName_Stub");
   --  objbase.h :3045
   pragma Import (Stdcall, IEnumMoniker_RemoteNext_Proxy,
                   "IEnumMoniker_RemoteNext_Proxy");      --  objbase.h :3167
   pragma Import (Stdcall, IEnumMoniker_RemoteNext_Stub,
                   "IEnumMoniker_RemoteNext_Stub");       --  objbase.h :3174
   pragma Import (Stdcall, IEnumMoniker_Skip_Proxy, "IEnumMoniker_Skip_Proxy");
   --  objbase.h :3181
   pragma Import (Stdcall, IEnumMoniker_Skip_Stub, "IEnumMoniker_Skip_Stub");
   --  objbase.h :3186
   pragma Import (Stdcall, IEnumMoniker_Reset_Proxy,
                    "IEnumMoniker_Reset_Proxy");
   --  objbase.h :3193
   pragma Import (Stdcall, IEnumMoniker_Reset_Stub, "IEnumMoniker_Reset_Stub");
   --  objbase.h :3197
   pragma Import (Stdcall, IEnumMoniker_Clone_Proxy,
                    "IEnumMoniker_Clone_Proxy");
   --  objbase.h :3204
   pragma Import (Stdcall, IEnumMoniker_Clone_Stub, "IEnumMoniker_Clone_Stub");
   --  objbase.h :3209
   pragma Import (Stdcall, IRunnableObject_GetRunningClass_Proxy,
                   "IRunnableObject_GetRunningClass_Proxy");
   --  objbase.h :3339
   pragma Import (Stdcall, IRunnableObject_GetRunningClass_Stub,
                   "IRunnableObject_GetRunningClass_Stub");
   --  objbase.h :3344
   pragma Import (Stdcall, IRunnableObject_Run_Proxy,
                    "IRunnableObject_Run_Proxy");
   --  objbase.h :3351
   pragma Import (Stdcall, IRunnableObject_Run_Stub,
                    "IRunnableObject_Run_Stub");
   --  objbase.h :3356
   pragma Import (Stdcall, IRunnableObject_IsRunning_Proxy,
                   "IRunnableObject_IsRunning_Proxy");    --  objbase.h :3363
   pragma Import (Stdcall, IRunnableObject_IsRunning_Stub,
                   "IRunnableObject_IsRunning_Stub");     --  objbase.h :3367
   pragma Import (Stdcall, IRunnableObject_LockRunning_Proxy,
                   "IRunnableObject_LockRunning_Proxy");  --  objbase.h :3374
   pragma Import (Stdcall, IRunnableObject_LockRunning_Stub,
                   "IRunnableObject_LockRunning_Stub");   --  objbase.h :3380
   pragma Import (Stdcall, IRunnableObject_SetContainedObject_Proxy,
                   "IRunnableObject_SetContainedObject_Proxy");
   --  objbase.h :3387
   pragma Import (Stdcall, IRunnableObject_SetContainedObject_Stub,
                   "IRunnableObject_SetContainedObject_Stub");
   --  objbase.h :3392
   pragma Import (Stdcall, IRunningObjectTable_Register_Proxy,
                   "IRunningObjectTable_Register_Proxy"); --  objbase.h :3554
   pragma Import (Stdcall, IRunningObjectTable_Register_Stub,
                   "IRunningObjectTable_Register_Stub");  --  objbase.h :3562
   pragma Import (Stdcall, IRunningObjectTable_Revoke_Proxy,
                   "IRunningObjectTable_Revoke_Proxy");   --  objbase.h :3569
   pragma Import (Stdcall, IRunningObjectTable_Revoke_Stub,
                   "IRunningObjectTable_Revoke_Stub");    --  objbase.h :3574
   pragma Import (Stdcall, IRunningObjectTable_IsRunning_Proxy,
                   "IRunningObjectTable_IsRunning_Proxy"); --  objbase.h :3581
   pragma Import (Stdcall, IRunningObjectTable_IsRunning_Stub,
                   "IRunningObjectTable_IsRunning_Stub"); --  objbase.h :3586
   pragma Import (Stdcall, IRunningObjectTable_GetObject_Proxy,
                   "IRunningObjectTable_GetObject_Proxy"); --  objbase.h :3593
   pragma Import (Stdcall, IRunningObjectTable_GetObject_Stub,
                   "IRunningObjectTable_GetObject_Stub"); --  objbase.h :3599
   pragma Import (Stdcall, IRunningObjectTable_NoteChangeTime_Proxy,
                   "IRunningObjectTable_NoteChangeTime_Proxy");
   --  objbase.h :3606
   pragma Import (Stdcall, IRunningObjectTable_NoteChangeTime_Stub,
                   "IRunningObjectTable_NoteChangeTime_Stub");
   --  objbase.h :3612
   pragma Import (Stdcall, IRunningObjectTable_GetTimeOfLastChange_Proxy,
                   "IRunningObjectTable_GetTimeOfLastChange_Proxy");
   --  objbase.h :3619
   pragma Import (Stdcall, IRunningObjectTable_GetTimeOfLastChange_Stub,
                   "IRunningObjectTable_GetTimeOfLastChange_Stub");
   --  objbase.h :3625
   pragma Import (Stdcall, IRunningObjectTable_EnumRunning_Proxy,
                   "IRunningObjectTable_EnumRunning_Proxy");
   --  objbase.h :3632
   pragma Import (Stdcall, IRunningObjectTable_EnumRunning_Stub,
                   "IRunningObjectTable_EnumRunning_Stub");
   --  objbase.h :3637
   pragma Import (Stdcall, IPersist_GetClassID_Proxy,
                    "IPersist_GetClassID_Proxy");
   --  objbase.h :3727
   pragma Import (Stdcall, IPersist_GetClassID_Stub,
                    "IPersist_GetClassID_Stub");
   --  objbase.h :3732
   pragma Import (Stdcall, IPersistStream_IsDirty_Proxy,
                   "IPersistStream_IsDirty_Proxy");       --  objbase.h :3860
   pragma Import (Stdcall, IPersistStream_IsDirty_Stub,
                   "IPersistStream_IsDirty_Stub");        --  objbase.h :3864
   pragma Import (Stdcall, IPersistStream_Load_Proxy,
                    "IPersistStream_Load_Proxy");
   --  objbase.h :3871
   pragma Import (Stdcall, IPersistStream_Load_Stub,
                    "IPersistStream_Load_Stub");
   --  objbase.h :3876
   pragma Import (Stdcall, IPersistStream_Save_Proxy,
                    "IPersistStream_Save_Proxy");
   --  objbase.h :3883
   pragma Import (Stdcall, IPersistStream_Save_Stub,
                    "IPersistStream_Save_Stub");
   --  objbase.h :3889
   pragma Import (Stdcall, IPersistStream_GetSizeMax_Proxy,
                   "IPersistStream_GetSizeMax_Proxy");    --  objbase.h :3896
   pragma Import (Stdcall, IPersistStream_GetSizeMax_Stub,
                   "IPersistStream_GetSizeMax_Stub");     --  objbase.h :3901
   pragma Import (Stdcall, IMoniker_RemoteBindToObject_Proxy,
                   "IMoniker_RemoteBindToObject_Proxy");  --  objbase.h :4236
   pragma Import (Stdcall, IMoniker_RemoteBindToObject_Stub,
                   "IMoniker_RemoteBindToObject_Stub");   --  objbase.h :4244
   pragma Import (Stdcall, IMoniker_RemoteBindToStorage_Proxy,
                   "IMoniker_RemoteBindToStorage_Proxy"); --  objbase.h :4251
   pragma Import (Stdcall, IMoniker_RemoteBindToStorage_Stub,
                   "IMoniker_RemoteBindToStorage_Stub");  --  objbase.h :4259
   pragma Import (Stdcall, IMoniker_Reduce_Proxy, "IMoniker_Reduce_Proxy");
   --  objbase.h :4266
   pragma Import (Stdcall, IMoniker_Reduce_Stub, "IMoniker_Reduce_Stub");
   --  objbase.h :4274
   pragma Import (Stdcall, IMoniker_ComposeWith_Proxy,
                    "IMoniker_ComposeWith_Proxy");
   --  objbase.h :4281
   pragma Import (Stdcall, IMoniker_ComposeWith_Stub,
                    "IMoniker_ComposeWith_Stub");
   --  objbase.h :4288
   pragma Import (Stdcall, IMoniker_Enum_Proxy, "IMoniker_Enum_Proxy");
   --  objbase.h :4295
   pragma Import (Stdcall, IMoniker_Enum_Stub, "IMoniker_Enum_Stub");
   --  objbase.h :4301
   pragma Import (Stdcall, IMoniker_IsEqual_Proxy, "IMoniker_IsEqual_Proxy");
   --  objbase.h :4308
   pragma Import (Stdcall, IMoniker_IsEqual_Stub, "IMoniker_IsEqual_Stub");
   --  objbase.h :4313
   pragma Import (Stdcall, IMoniker_Hash_Proxy, "IMoniker_Hash_Proxy");
   --  objbase.h :4320
   pragma Import (Stdcall, IMoniker_Hash_Stub, "IMoniker_Hash_Stub");
   --  objbase.h :4325
   pragma Import (Stdcall, IMoniker_IsRunning_Proxy,
                    "IMoniker_IsRunning_Proxy");
   --  objbase.h :4332
   pragma Import (Stdcall, IMoniker_IsRunning_Stub, "IMoniker_IsRunning_Stub");
   --  objbase.h :4339
   pragma Import (Stdcall, IMoniker_GetTimeOfLastChange_Proxy,
                   "IMoniker_GetTimeOfLastChange_Proxy"); --  objbase.h :4346
   pragma Import (Stdcall, IMoniker_GetTimeOfLastChange_Stub,
                   "IMoniker_GetTimeOfLastChange_Stub");  --  objbase.h :4353
   pragma Import (Stdcall, IMoniker_Inverse_Proxy, "IMoniker_Inverse_Proxy");
   --  objbase.h :4360
   pragma Import (Stdcall, IMoniker_Inverse_Stub, "IMoniker_Inverse_Stub");
   --  objbase.h :4365
   pragma Import (Stdcall, IMoniker_CommonPrefixWith_Proxy,
                   "IMoniker_CommonPrefixWith_Proxy");    --  objbase.h :4372
   pragma Import (Stdcall, IMoniker_CommonPrefixWith_Stub,
                   "IMoniker_CommonPrefixWith_Stub");     --  objbase.h :4378
   pragma Import (Stdcall, IMoniker_RelativePathTo_Proxy,
                   "IMoniker_RelativePathTo_Proxy");      --  objbase.h :4385
   pragma Import (Stdcall, IMoniker_RelativePathTo_Stub,
                   "IMoniker_RelativePathTo_Stub");       --  objbase.h :4391
   pragma Import (Stdcall, IMoniker_GetDisplayName_Proxy,
                   "IMoniker_GetDisplayName_Proxy");      --  objbase.h :4398
   pragma Import (Stdcall, IMoniker_GetDisplayName_Stub,
                   "IMoniker_GetDisplayName_Stub");       --  objbase.h :4405
   pragma Import (Stdcall, IMoniker_ParseDisplayName_Proxy,
                   "IMoniker_ParseDisplayName_Proxy");    --  objbase.h :4412
   pragma Import (Stdcall, IMoniker_ParseDisplayName_Stub,
                   "IMoniker_ParseDisplayName_Stub");     --  objbase.h :4421
   pragma Import (Stdcall, IMoniker_IsSystemMoniker_Proxy,
                   "IMoniker_IsSystemMoniker_Proxy");     --  objbase.h :4428
   pragma Import (Stdcall, IMoniker_IsSystemMoniker_Stub,
                   "IMoniker_IsSystemMoniker_Stub");      --  objbase.h :4433
   pragma Import (Stdcall, IEnumString_RemoteNext_Proxy,
                   "IEnumString_RemoteNext_Proxy");       --  objbase.h :4555
   pragma Import (Stdcall, IEnumString_RemoteNext_Stub,
                   "IEnumString_RemoteNext_Stub");        --  objbase.h :4562
   pragma Import (Stdcall, IEnumString_Skip_Proxy, "IEnumString_Skip_Proxy");
   --  objbase.h :4569
   pragma Import (Stdcall, IEnumString_Skip_Stub, "IEnumString_Skip_Stub");
   --  objbase.h :4574
   pragma Import (Stdcall, IEnumString_Reset_Proxy, "IEnumString_Reset_Proxy");
   --  objbase.h :4581
   pragma Import (Stdcall, IEnumString_Reset_Stub, "IEnumString_Reset_Stub");
   --  objbase.h :4585
   pragma Import (Stdcall, IEnumString_Clone_Proxy, "IEnumString_Clone_Proxy");
   --  objbase.h :4592
   pragma Import (Stdcall, IEnumString_Clone_Stub, "IEnumString_Clone_Stub");
   --  objbase.h :4597
   pragma Import (Stdcall, IStream_RemoteRead_Proxy,
                    "IStream_RemoteRead_Proxy");
   --  objbase.h :4854
   pragma Import (Stdcall, IStream_RemoteRead_Stub, "IStream_RemoteRead_Stub");
   --  objbase.h :4861
   pragma Import (Stdcall, IStream_RemoteWrite_Proxy,
                    "IStream_RemoteWrite_Proxy");
   --  objbase.h :4868
   pragma Import (Stdcall, IStream_RemoteWrite_Stub,
                    "IStream_RemoteWrite_Stub");
   --  objbase.h :4875
   pragma Import (Stdcall, IStream_RemoteSeek_Proxy,
                    "IStream_RemoteSeek_Proxy");
   --  objbase.h :4882
   pragma Import (Stdcall, IStream_RemoteSeek_Stub, "IStream_RemoteSeek_Stub");
   --  objbase.h :4889
   pragma Import (Stdcall, IStream_SetSize_Proxy, "IStream_SetSize_Proxy");
   --  objbase.h :4896
   pragma Import (Stdcall, IStream_SetSize_Stub, "IStream_SetSize_Stub");
   --  objbase.h :4901
   pragma Import (Stdcall, IStream_RemoteCopyTo_Proxy,
                    "IStream_RemoteCopyTo_Proxy");
   --  objbase.h :4908
   pragma Import (Stdcall, IStream_RemoteCopyTo_Stub,
                    "IStream_RemoteCopyTo_Stub");
   --  objbase.h :4916
   pragma Import (Stdcall, IStream_Commit_Proxy, "IStream_Commit_Proxy");
   --  objbase.h :4923
   pragma Import (Stdcall, IStream_Commit_Stub, "IStream_Commit_Stub");
   --  objbase.h :4928
   pragma Import (Stdcall, IStream_Revert_Proxy, "IStream_Revert_Proxy");
   --  objbase.h :4935
   pragma Import (Stdcall, IStream_Revert_Stub, "IStream_Revert_Stub");
   --  objbase.h :4939
   pragma Import (Stdcall, IStream_LockRegion_Proxy,
                    "IStream_LockRegion_Proxy");
   --  objbase.h :4946
   pragma Import (Stdcall, IStream_LockRegion_Stub, "IStream_LockRegion_Stub");
   --  objbase.h :4953
   pragma Import (Stdcall, IStream_UnlockRegion_Proxy,
                    "IStream_UnlockRegion_Proxy");
   --  objbase.h :4960
   pragma Import (Stdcall, IStream_UnlockRegion_Stub,
                    "IStream_UnlockRegion_Stub");
   --  objbase.h :4967
   pragma Import (Stdcall, IStream_Stat_Proxy, "IStream_Stat_Proxy");
   --  objbase.h :4974
   pragma Import (Stdcall, IStream_Stat_Stub, "IStream_Stat_Stub");
   --  objbase.h :4980
   pragma Import (Stdcall, IStream_Clone_Proxy, "IStream_Clone_Proxy");
   --  objbase.h :4987
   pragma Import (Stdcall, IStream_Clone_Stub, "IStream_Clone_Stub");
   --  objbase.h :4992
   pragma Import (Stdcall, IEnumSTATSTG_RemoteNext_Proxy,
                   "IEnumSTATSTG_RemoteNext_Proxy");
   --  objbase.h :5114
   pragma Import (Stdcall, IEnumSTATSTG_RemoteNext_Stub,
                   "IEnumSTATSTG_RemoteNext_Stub");
   --  objbase.h :5121
   pragma Import (Stdcall, IEnumSTATSTG_Skip_Proxy, "IEnumSTATSTG_Skip_Proxy");
   --  objbase.h :5128
   pragma Import (Stdcall, IEnumSTATSTG_Skip_Stub, "IEnumSTATSTG_Skip_Stub");
   --  objbase.h :5133
   pragma Import (Stdcall, IEnumSTATSTG_Reset_Proxy,
                    "IEnumSTATSTG_Reset_Proxy");
   --  objbase.h :5140
   pragma Import (Stdcall, IEnumSTATSTG_Reset_Stub, "IEnumSTATSTG_Reset_Stub");
   --  objbase.h :5144
   pragma Import (Stdcall, IEnumSTATSTG_Clone_Proxy,
                    "IEnumSTATSTG_Clone_Proxy");
   --  objbase.h :5151
   pragma Import (Stdcall, IEnumSTATSTG_Clone_Stub, "IEnumSTATSTG_Clone_Stub");
   --  objbase.h :5156
   pragma Import (Stdcall, IStorage_CreateStream_Proxy,
                   "IStorage_CreateStream_Proxy");
   --  objbase.h :5461
   pragma Import (Stdcall, IStorage_CreateStream_Stub,
                    "IStorage_CreateStream_Stub");
   --  objbase.h :5470
   pragma Import (Stdcall, IStorage_RemoteOpenStream_Proxy,
                   "IStorage_RemoteOpenStream_Proxy");    --  objbase.h :5477
   pragma Import (Stdcall, IStorage_RemoteOpenStream_Stub,
                   "IStorage_RemoteOpenStream_Stub");     --  objbase.h :5487
   pragma Import (Stdcall, IStorage_CreateStorage_Proxy,
                   "IStorage_CreateStorage_Proxy");       --  objbase.h :5494
   pragma Import (Stdcall, IStorage_CreateStorage_Stub,
                   "IStorage_CreateStorage_Stub");        --  objbase.h :5503
   pragma Import (Stdcall, IStorage_OpenStorage_Proxy,
                    "IStorage_OpenStorage_Proxy");
   --  objbase.h :5510
   pragma Import (Stdcall, IStorage_OpenStorage_Stub,
                    "IStorage_OpenStorage_Stub");
   --  objbase.h :5520
   pragma Import (Stdcall, IStorage_CopyTo_Proxy, "IStorage_CopyTo_Proxy");
   --  objbase.h :5527
   pragma Import (Stdcall, IStorage_CopyTo_Stub, "IStorage_CopyTo_Stub");
   --  objbase.h :5535
   pragma Import (Stdcall, IStorage_MoveElementTo_Proxy,
                   "IStorage_MoveElementTo_Proxy");       --  objbase.h :5542
   pragma Import (Stdcall, IStorage_MoveElementTo_Stub,
                   "IStorage_MoveElementTo_Stub");        --  objbase.h :5550
   pragma Import (Stdcall, IStorage_Commit_Proxy, "IStorage_Commit_Proxy");
   --  objbase.h :5557
   pragma Import (Stdcall, IStorage_Commit_Stub, "IStorage_Commit_Stub");
   --  objbase.h :5562
   pragma Import (Stdcall, IStorage_Revert_Proxy, "IStorage_Revert_Proxy");
   --  objbase.h :5569
   pragma Import (Stdcall, IStorage_Revert_Stub, "IStorage_Revert_Stub");
   --  objbase.h :5573
   pragma Import (Stdcall, IStorage_RemoteEnumElements_Proxy,
                   "IStorage_RemoteEnumElements_Proxy");
   --  objbase.h :5580
   pragma Import (Stdcall, IStorage_RemoteEnumElements_Stub,
                   "IStorage_RemoteEnumElements_Stub");
   --  objbase.h :5589
   pragma Import (Stdcall, IStorage_DestroyElement_Proxy,
                   "IStorage_DestroyElement_Proxy");
   --  objbase.h :5596
   pragma Import (Stdcall, IStorage_DestroyElement_Stub,
                   "IStorage_DestroyElement_Stub");
   --  objbase.h :5601
   pragma Import (Stdcall, IStorage_RenameElement_Proxy,
                   "IStorage_RenameElement_Proxy");
   --  objbase.h :5608
   pragma Import (Stdcall, IStorage_RenameElement_Stub,
                   "IStorage_RenameElement_Stub");
   --  objbase.h :5614
   pragma Import (Stdcall, IStorage_SetElementTimes_Proxy,
                   "IStorage_SetElementTimes_Proxy");
   --  objbase.h :5621
   pragma Import (Stdcall, IStorage_SetElementTimes_Stub,
                   "IStorage_SetElementTimes_Stub");
   --  objbase.h :5629
   pragma Import (Stdcall, IStorage_SetClass_Proxy, "IStorage_SetClass_Proxy");
   --  objbase.h :5636
   pragma Import (Stdcall, IStorage_SetClass_Stub, "IStorage_SetClass_Stub");
   --  objbase.h :5641
   pragma Import (Stdcall, IStorage_SetStateBits_Proxy,
                   "IStorage_SetStateBits_Proxy");
   --  objbase.h :5648
   pragma Import (Stdcall, IStorage_SetStateBits_Stub,
                    "IStorage_SetStateBits_Stub");
   --  objbase.h :5654
   pragma Import (Stdcall, IStorage_Stat_Proxy, "IStorage_Stat_Proxy");
   --  objbase.h :5661
   pragma Import (Stdcall, IStorage_Stat_Stub, "IStorage_Stat_Stub");
   --  objbase.h :5667
   pragma Import (Stdcall, IPersistFile_IsDirty_Proxy,
                    "IPersistFile_IsDirty_Proxy");
   --  objbase.h :5807
   pragma Import (Stdcall, IPersistFile_IsDirty_Stub,
                    "IPersistFile_IsDirty_Stub");
   --  objbase.h :5811
   pragma Import (Stdcall, IPersistFile_Load_Proxy, "IPersistFile_Load_Proxy");
   --  objbase.h :5818
   pragma Import (Stdcall, IPersistFile_Load_Stub, "IPersistFile_Load_Stub");
   --  objbase.h :5824
   pragma Import (Stdcall, IPersistFile_Save_Proxy, "IPersistFile_Save_Proxy");
   --  objbase.h :5831
   pragma Import (Stdcall, IPersistFile_Save_Stub, "IPersistFile_Save_Stub");
   --  objbase.h :5837
   pragma Import (Stdcall, IPersistFile_SaveCompleted_Proxy,
                   "IPersistFile_SaveCompleted_Proxy");
   --  objbase.h :5844
   pragma Import (Stdcall, IPersistFile_SaveCompleted_Stub,
                   "IPersistFile_SaveCompleted_Stub");
   --  objbase.h :5849
   pragma Import (Stdcall, IPersistFile_GetCurFile_Proxy,
                   "IPersistFile_GetCurFile_Proxy");
   --  objbase.h :5856
   pragma Import (Stdcall, IPersistFile_GetCurFile_Stub,
                   "IPersistFile_GetCurFile_Stub");
   --  objbase.h :5861
   pragma Import (Stdcall, IPersistStorage_IsDirty_Proxy,
                   "IPersistStorage_IsDirty_Proxy");
   --  objbase.h :6007
   pragma Import (Stdcall, IPersistStorage_IsDirty_Stub,
                   "IPersistStorage_IsDirty_Stub");
   --  objbase.h :6011
   pragma Import (Stdcall, IPersistStorage_InitNew_Proxy,
                   "IPersistStorage_InitNew_Proxy");
   --  objbase.h :6018
   pragma Import (Stdcall, IPersistStorage_InitNew_Stub,
                   "IPersistStorage_InitNew_Stub");
   --  objbase.h :6023
   pragma Import (Stdcall, IPersistStorage_Load_Proxy,
                    "IPersistStorage_Load_Proxy");
   --  objbase.h :6030
   pragma Import (Stdcall, IPersistStorage_Load_Stub,
                    "IPersistStorage_Load_Stub");
   --  objbase.h :6035
   pragma Import (Stdcall, IPersistStorage_Save_Proxy,
                    "IPersistStorage_Save_Proxy");
   --  objbase.h :6042
   pragma Import (Stdcall, IPersistStorage_Save_Stub,
                    "IPersistStorage_Save_Stub");
   --  objbase.h :6048
   pragma Import (Stdcall, IPersistStorage_SaveCompleted_Proxy,
                   "IPersistStorage_SaveCompleted_Proxy");
   --  objbase.h :6055
   pragma Import (Stdcall, IPersistStorage_SaveCompleted_Stub,
                   "IPersistStorage_SaveCompleted_Stub");
   --  objbase.h :6060
   pragma Import (Stdcall, IPersistStorage_HandsOffStorage_Proxy,
                   "IPersistStorage_HandsOffStorage_Proxy");
   --  objbase.h :6067
   pragma Import (Stdcall, IPersistStorage_HandsOffStorage_Stub,
                   "IPersistStorage_HandsOffStorage_Stub");
   --  objbase.h :6071
   pragma Import (Stdcall, ILockBytes_RemoteReadAt_Proxy,
                   "ILockBytes_RemoteReadAt_Proxy");
   --  objbase.h :6241
   pragma Import (Stdcall, ILockBytes_RemoteReadAt_Stub,
                   "ILockBytes_RemoteReadAt_Stub");
   --  objbase.h :6249
   pragma Import (Stdcall, ILockBytes_RemoteWriteAt_Proxy,
                   "ILockBytes_RemoteWriteAt_Proxy");
   --  objbase.h :6256
   pragma Import (Stdcall, ILockBytes_RemoteWriteAt_Stub,
                   "ILockBytes_RemoteWriteAt_Stub");
   --  objbase.h :6264
   pragma Import (Stdcall, ILockBytes_Flush_Proxy, "ILockBytes_Flush_Proxy");
   --  objbase.h :6271
   pragma Import (Stdcall, ILockBytes_Flush_Stub, "ILockBytes_Flush_Stub");
   --  objbase.h :6275
   pragma Import (Stdcall, ILockBytes_SetSize_Proxy,
                    "ILockBytes_SetSize_Proxy");
   --  objbase.h :6282
   pragma Import (Stdcall, ILockBytes_SetSize_Stub, "ILockBytes_SetSize_Stub");
   --  objbase.h :6287
   pragma Import (Stdcall, ILockBytes_LockRegion_Proxy,
                   "ILockBytes_LockRegion_Proxy");
   --  objbase.h :6294
   pragma Import (Stdcall, ILockBytes_LockRegion_Stub,
                    "ILockBytes_LockRegion_Stub");
   --  objbase.h :6301
   pragma Import (Stdcall, ILockBytes_UnlockRegion_Proxy,
                   "ILockBytes_UnlockRegion_Proxy");
   --  objbase.h :6308
   pragma Import (Stdcall, ILockBytes_UnlockRegion_Stub,
                   "ILockBytes_UnlockRegion_Stub");
   --  objbase.h :6315
   pragma Import (Stdcall, ILockBytes_Stat_Proxy, "ILockBytes_Stat_Proxy");
   --  objbase.h :6322
   pragma Import (Stdcall, ILockBytes_Stat_Stub, "ILockBytes_Stat_Stub");
   --  objbase.h :6328
   pragma Import (Stdcall, IEnumFORMATETC_RemoteNext_Proxy,
                   "IEnumFORMATETC_RemoteNext_Proxy");
   --  objbase.h :6480
   pragma Import (Stdcall, IEnumFORMATETC_RemoteNext_Stub,
                   "IEnumFORMATETC_RemoteNext_Stub");
   --  objbase.h :6487
   pragma Import (Stdcall, IEnumFORMATETC_Skip_Proxy,
                    "IEnumFORMATETC_Skip_Proxy");
   --  objbase.h :6494
   pragma Import (Stdcall, IEnumFORMATETC_Skip_Stub,
                    "IEnumFORMATETC_Skip_Stub");
   --  objbase.h :6499
   pragma Import (Stdcall, IEnumFORMATETC_Reset_Proxy,
                    "IEnumFORMATETC_Reset_Proxy");
   --  objbase.h :6506
   pragma Import (Stdcall, IEnumFORMATETC_Reset_Stub,
                    "IEnumFORMATETC_Reset_Stub");
   --  objbase.h :6510
   pragma Import (Stdcall, IEnumFORMATETC_Clone_Proxy,
                    "IEnumFORMATETC_Clone_Proxy");
   --  objbase.h :6517
   pragma Import (Stdcall, IEnumFORMATETC_Clone_Stub,
                    "IEnumFORMATETC_Clone_Stub");
   --  objbase.h :6522
   pragma Import (Stdcall, IEnumSTATDATA_RemoteNext_Proxy,
                   "IEnumSTATDATA_RemoteNext_Proxy");
   --  objbase.h :6668
   pragma Import (Stdcall, IEnumSTATDATA_RemoteNext_Stub,
                   "IEnumSTATDATA_RemoteNext_Stub");
   --  objbase.h :6675
   pragma Import (Stdcall, IEnumSTATDATA_Skip_Proxy,
                    "IEnumSTATDATA_Skip_Proxy");
   --  objbase.h :6682
   pragma Import (Stdcall, IEnumSTATDATA_Skip_Stub,
                    "IEnumSTATDATA_Skip_Stub");
   --  objbase.h :6687
   pragma Import (Stdcall, IEnumSTATDATA_Reset_Proxy,
                    "IEnumSTATDATA_Reset_Proxy");
   --  objbase.h :6694
   pragma Import (Stdcall, IEnumSTATDATA_Reset_Stub,
                    "IEnumSTATDATA_Reset_Stub");
   --  objbase.h :6698
   pragma Import (Stdcall, IEnumSTATDATA_Clone_Proxy,
                    "IEnumSTATDATA_Clone_Proxy");
   --  objbase.h :6705
   pragma Import (Stdcall, IEnumSTATDATA_Clone_Stub,
                    "IEnumSTATDATA_Clone_Stub");
   --  objbase.h :6710
   pragma Import (Stdcall, IRootStorage_SwitchToFile_Proxy,
                   "IRootStorage_SwitchToFile_Proxy");
   --  objbase.h :6800
   pragma Import (Stdcall, IRootStorage_SwitchToFile_Stub,
                   "IRootStorage_SwitchToFile_Stub");
   --  objbase.h :6805
   pragma Import (Stdcall, IAdviseSink_RemoteOnDataChange_Proxy,
                   "IAdviseSink_RemoteOnDataChange_Proxy");
   --  objbase.h :6998
   pragma Import (Stdcall, IAdviseSink_RemoteOnDataChange_Stub,
                   "IAdviseSink_RemoteOnDataChange_Stub");
   --  objbase.h :7004
   pragma Import (Stdcall, IAdviseSink_RemoteOnViewChange_Proxy,
                   "IAdviseSink_RemoteOnViewChange_Proxy");
   --  objbase.h :7011
   pragma Import (Stdcall, IAdviseSink_RemoteOnViewChange_Stub,
                   "IAdviseSink_RemoteOnViewChange_Stub");
   --  objbase.h :7017
   pragma Import (Stdcall, IAdviseSink_RemoteOnRename_Proxy,
                   "IAdviseSink_RemoteOnRename_Proxy");
   --  objbase.h :7024
   pragma Import (Stdcall, IAdviseSink_RemoteOnRename_Stub,
                   "IAdviseSink_RemoteOnRename_Stub");
   --  objbase.h :7029
   pragma Import (Stdcall, IAdviseSink_RemoteOnSave_Proxy,
                   "IAdviseSink_RemoteOnSave_Proxy");
   --  objbase.h :7036
   pragma Import (Stdcall, IAdviseSink_RemoteOnSave_Stub,
                   "IAdviseSink_RemoteOnSave_Stub");
   --  objbase.h :7040
   pragma Import (Stdcall, IAdviseSink_RemoteOnClose_Proxy,
                   "IAdviseSink_RemoteOnClose_Proxy");
   --  objbase.h :7047
   pragma Import (Stdcall, IAdviseSink_RemoteOnClose_Stub,
                   "IAdviseSink_RemoteOnClose_Stub");
   --  objbase.h :7051
   pragma Import (Stdcall, IAdviseSink2_RemoteOnLinkSrcChange_Proxy,
                   "IAdviseSink2_RemoteOnLinkSrcChange_Proxy");
   --  objbase.h :7177
   pragma Import (Stdcall, IAdviseSink2_RemoteOnLinkSrcChange_Stub,
                   "IAdviseSink2_RemoteOnLinkSrcChange_Stub");
   --  objbase.h :7182
   pragma Import (Stdcall, IDataObject_RemoteGetData_Proxy,
                   "IDataObject_RemoteGetData_Proxy");
   --  objbase.h :7377
   pragma Import (Stdcall, IDataObject_RemoteGetData_Stub,
                   "IDataObject_RemoteGetData_Stub");
   --  objbase.h :7383
   pragma Import (Stdcall, IDataObject_RemoteGetDataHere_Proxy,
                   "IDataObject_RemoteGetDataHere_Proxy");
   --  objbase.h :7390
   pragma Import (Stdcall, IDataObject_RemoteGetDataHere_Stub,
                   "IDataObject_RemoteGetDataHere_Stub");
   --  objbase.h :7396
   pragma Import (Stdcall, IDataObject_QueryGetData_Proxy,
                   "IDataObject_QueryGetData_Proxy");
   --  objbase.h :7403
   pragma Import (Stdcall, IDataObject_QueryGetData_Stub,
                   "IDataObject_QueryGetData_Stub");
   --  objbase.h :7408
   pragma Import (Stdcall, IDataObject_GetCanonicalFormatEtc_Proxy,
                   "IDataObject_GetCanonicalFormatEtc_Proxy");
   --  objbase.h :7415
   pragma Import (Stdcall, IDataObject_GetCanonicalFormatEtc_Stub,
                   "IDataObject_GetCanonicalFormatEtc_Stub");
   --  objbase.h :7421
   pragma Import (Stdcall, IDataObject_RemoteSetData_Proxy,
                   "IDataObject_RemoteSetData_Proxy");
   --  objbase.h :7428
   pragma Import (Stdcall, IDataObject_RemoteSetData_Stub,
                   "IDataObject_RemoteSetData_Stub");
   --  objbase.h :7435
   pragma Import (Stdcall, IDataObject_EnumFormatEtc_Proxy,
                   "IDataObject_EnumFormatEtc_Proxy");
   --  objbase.h :7442
   pragma Import (Stdcall, IDataObject_EnumFormatEtc_Stub,
                   "IDataObject_EnumFormatEtc_Stub");
   --  objbase.h :7448
   pragma Import (Stdcall, IDataObject_DAdvise_Proxy,
                    "IDataObject_DAdvise_Proxy");
   --  objbase.h :7455
   pragma Import (Stdcall, IDataObject_DAdvise_Stub,
                    "IDataObject_DAdvise_Stub");
   --  objbase.h :7463
   pragma Import (Stdcall, IDataObject_DUnadvise_Proxy,
                   "IDataObject_DUnadvise_Proxy");
   --  objbase.h :7470
   pragma Import (Stdcall, IDataObject_DUnadvise_Stub,
                    "IDataObject_DUnadvise_Stub");
   --  objbase.h :7475
   pragma Import (Stdcall, IDataObject_EnumDAdvise_Proxy,
                   "IDataObject_EnumDAdvise_Proxy");
   --  objbase.h :7482
   pragma Import (Stdcall, IDataObject_EnumDAdvise_Stub,
                   "IDataObject_EnumDAdvise_Stub");
   --  objbase.h :7487
   pragma Import (Stdcall, IDataAdviseHolder_Advise_Proxy,
                   "IDataAdviseHolder_Advise_Proxy");
   --  objbase.h :7619
   pragma Import (Stdcall, IDataAdviseHolder_Advise_Stub,
                   "IDataAdviseHolder_Advise_Stub");
   --  objbase.h :7628
   pragma Import (Stdcall, IDataAdviseHolder_Unadvise_Proxy,
                   "IDataAdviseHolder_Unadvise_Proxy");
   --  objbase.h :7635
   pragma Import (Stdcall, IDataAdviseHolder_Unadvise_Stub,
                   "IDataAdviseHolder_Unadvise_Stub");
   --  objbase.h :7640
   pragma Import (Stdcall, IDataAdviseHolder_EnumAdvise_Proxy,
                   "IDataAdviseHolder_EnumAdvise_Proxy");
   --  objbase.h :7647
   pragma Import (Stdcall, IDataAdviseHolder_EnumAdvise_Stub,
                   "IDataAdviseHolder_EnumAdvise_Stub");
   --  objbase.h :7652
   pragma Import (Stdcall, IDataAdviseHolder_SendOnDataChange_Proxy,
                   "IDataAdviseHolder_SendOnDataChange_Proxy");
   --  objbase.h :7659
   pragma Import (Stdcall, IDataAdviseHolder_SendOnDataChange_Stub,
                   "IDataAdviseHolder_SendOnDataChange_Stub");
   --  objbase.h :7666
   pragma Import (Stdcall, IMessageFilter_HandleInComingCall_Proxy,
                   "IMessageFilter_HandleInComingCall_Proxy");
   --  objbase.h :7834
   pragma Import (Stdcall, IMessageFilter_HandleInComingCall_Stub,
                   "IMessageFilter_HandleInComingCall_Stub");
   --  objbase.h :7842
   pragma Import (Stdcall, IMessageFilter_RetryRejectedCall_Proxy,
                   "IMessageFilter_RetryRejectedCall_Proxy");
   --  objbase.h :7849
   pragma Import (Stdcall, IMessageFilter_RetryRejectedCall_Stub,
                   "IMessageFilter_RetryRejectedCall_Stub");
   --  objbase.h :7856
   pragma Import (Stdcall, IMessageFilter_MessagePending_Proxy,
                   "IMessageFilter_MessagePending_Proxy");
   --  objbase.h :7863
   pragma Import (Stdcall, IMessageFilter_MessagePending_Stub,
                   "IMessageFilter_MessagePending_Stub");
   --  objbase.h :7870
   pragma Import (Stdcall, IRpcChannelBuffer_GetBuffer_Proxy,
                   "IRpcChannelBuffer_GetBuffer_Proxy");
   --  objbase.h :8019
   pragma Import (Stdcall, IRpcChannelBuffer_GetBuffer_Stub,
                   "IRpcChannelBuffer_GetBuffer_Stub");
   --  objbase.h :8025
   pragma Import (Stdcall, IRpcChannelBuffer_SendReceive_Proxy,
                   "IRpcChannelBuffer_SendReceive_Proxy");
   --  objbase.h :8032
   pragma Import (Stdcall, IRpcChannelBuffer_SendReceive_Stub,
                   "IRpcChannelBuffer_SendReceive_Stub");
   --  objbase.h :8038
   pragma Import (Stdcall, IRpcChannelBuffer_FreeBuffer_Proxy,
                   "IRpcChannelBuffer_FreeBuffer_Proxy");
   --  objbase.h :8045
   pragma Import (Stdcall, IRpcChannelBuffer_FreeBuffer_Stub,
                   "IRpcChannelBuffer_FreeBuffer_Stub");
   --  objbase.h :8050
   pragma Import (Stdcall, IRpcChannelBuffer_GetDestCtx_Proxy,
                   "IRpcChannelBuffer_GetDestCtx_Proxy");
   --  objbase.h :8057
   pragma Import (Stdcall, IRpcChannelBuffer_GetDestCtx_Stub,
                   "IRpcChannelBuffer_GetDestCtx_Stub");
   --  objbase.h :8063
   pragma Import (Stdcall, IRpcChannelBuffer_IsConnected_Proxy,
                   "IRpcChannelBuffer_IsConnected_Proxy");
   --  objbase.h :8070
   pragma Import (Stdcall, IRpcChannelBuffer_IsConnected_Stub,
                   "IRpcChannelBuffer_IsConnected_Stub");
   --  objbase.h :8074
   pragma Import (Stdcall, IRpcProxyBuffer_Connect_Proxy,
                   "IRpcProxyBuffer_Connect_Proxy");
   --  objbase.h :8169
   pragma Import (Stdcall, IRpcProxyBuffer_Connect_Stub,
                   "IRpcProxyBuffer_Connect_Stub");
   --  objbase.h :8174
   pragma Import (Stdcall, IRpcProxyBuffer_Disconnect_Proxy,
                   "IRpcProxyBuffer_Disconnect_Proxy");
   --  objbase.h :8181
   pragma Import (Stdcall, IRpcProxyBuffer_Disconnect_Stub,
                   "IRpcProxyBuffer_Disconnect_Stub");
   --  objbase.h :8185
   pragma Import (Stdcall, IRpcStubBuffer_Connect_Proxy,
                   "IRpcStubBuffer_Connect_Proxy");
   --  objbase.h :8330
   pragma Import (Stdcall, IRpcStubBuffer_Connect_Stub,
                   "IRpcStubBuffer_Connect_Stub");
   --  objbase.h :8335
   pragma Import (Stdcall, IRpcStubBuffer_Disconnect_Proxy,
                   "IRpcStubBuffer_Disconnect_Proxy");
   --  objbase.h :8342
   pragma Import (Stdcall, IRpcStubBuffer_Disconnect_Stub,
                   "IRpcStubBuffer_Disconnect_Stub");
   --  objbase.h :8346
   pragma Import (Stdcall, IRpcStubBuffer_Invoke_Proxy,
                   "IRpcStubBuffer_Invoke_Proxy");
   --  objbase.h :8353
   pragma Import (Stdcall, IRpcStubBuffer_Invoke_Stub,
                    "IRpcStubBuffer_Invoke_Stub");
   --  objbase.h :8359
   pragma Import (Stdcall, IRpcStubBuffer_IsIIDSupported_Proxy,
                   "IRpcStubBuffer_IsIIDSupported_Proxy");
   --  objbase.h :8366
   pragma Import (Stdcall, IRpcStubBuffer_IsIIDSupported_Stub,
                   "IRpcStubBuffer_IsIIDSupported_Stub");
   --  objbase.h :8371
   pragma Import (Stdcall, IRpcStubBuffer_CountRefs_Proxy,
                   "IRpcStubBuffer_CountRefs_Proxy");
   --  objbase.h :8378
   pragma Import (Stdcall, IRpcStubBuffer_CountRefs_Stub,
                   "IRpcStubBuffer_CountRefs_Stub");
   --  objbase.h :8382
   pragma Import (Stdcall, IRpcStubBuffer_DebugServerQueryInterface_Proxy,
                   "IRpcStubBuffer_DebugServerQueryInterface_Proxy");
   --  objbase.h :8389
   pragma Import (Stdcall, IRpcStubBuffer_DebugServerQueryInterface_Stub,
                   "IRpcStubBuffer_DebugServerQueryInterface_Stub");
   --  objbase.h :8394
   pragma Import (Stdcall, IRpcStubBuffer_DebugServerRelease_Proxy,
                   "IRpcStubBuffer_DebugServerRelease_Proxy");
   --  objbase.h :8401
   pragma Import (Stdcall, IRpcStubBuffer_DebugServerRelease_Stub,
                   "IRpcStubBuffer_DebugServerRelease_Stub");
   --  objbase.h :8406
   pragma Import (Stdcall, IPSFactoryBuffer_CreateProxy_Proxy,
                   "IPSFactoryBuffer_CreateProxy_Proxy");
   --  objbase.h :8513
   pragma Import (Stdcall, IPSFactoryBuffer_CreateProxy_Stub,
                   "IPSFactoryBuffer_CreateProxy_Stub");
   --  objbase.h :8521
   pragma Import (Stdcall, IPSFactoryBuffer_CreateStub_Proxy,
                   "IPSFactoryBuffer_CreateStub_Proxy");
   --  objbase.h :8528
   pragma Import (Stdcall, IPSFactoryBuffer_CreateStub_Stub,
                   "IPSFactoryBuffer_CreateStub_Stub");
   --  objbase.h :8535
   pragma Import (Stdcall, SNB_to_xmit, "SNB_to_xmit");     --  objbase.h :8549
   pragma Import (Stdcall, SNB_from_xmit, "SNB_from_xmit"); --  objbase.h :8550
   pragma Import (Stdcall, SNB_free_inst, "SNB_free_inst"); --  objbase.h :8551
   pragma Import (Stdcall, SNB_free_xmit, "SNB_free_xmit"); --  objbase.h :8552
   pragma Import (Stdcall, IClassFactory_CreateInstance_Proxy,
                   "IClassFactory_CreateInstance_Proxy");
   --  objbase.h :8553
   pragma Import (Stdcall, IClassFactory_CreateInstance_Stub,
                   "IClassFactory_CreateInstance_Stub");
   --  objbase.h :8560
   pragma Import (Stdcall, IEnumUnknown_Next_Proxy, "IEnumUnknown_Next_Proxy");
   --  objbase.h :8565
   pragma Import (Stdcall, IEnumUnknown_Next_Stub, "IEnumUnknown_Next_Stub");
   --  objbase.h :8572
   pragma Import (Stdcall, IEnumMoniker_Next_Proxy, "IEnumMoniker_Next_Proxy");
   --  objbase.h :8578
   pragma Import (Stdcall, IEnumMoniker_Next_Stub, "IEnumMoniker_Next_Stub");
   --  objbase.h :8585
   pragma Import (Stdcall, IMoniker_BindToObject_Proxy,
                   "IMoniker_BindToObject_Proxy");
   --  objbase.h :8591
   pragma Import (Stdcall, IMoniker_BindToObject_Stub,
                    "IMoniker_BindToObject_Stub");
   --  objbase.h :8599
   pragma Import (Stdcall, IMoniker_BindToStorage_Proxy,
                   "IMoniker_BindToStorage_Proxy");
   --  objbase.h :8606
   pragma Import (Stdcall, IMoniker_BindToStorage_Stub,
                   "IMoniker_BindToStorage_Stub");
   --  objbase.h :8614
   pragma Import (Stdcall, IEnumString_Next_Proxy, "IEnumString_Next_Proxy");
   --  objbase.h :8621
   pragma Import (Stdcall, IEnumString_Next_Stub, "IEnumString_Next_Stub");
   --  objbase.h :8628
   pragma Import (Stdcall, IStream_Read_Proxy, "IStream_Read_Proxy");
   --  objbase.h :8634
   pragma Import (Stdcall, IStream_Read_Stub, "IStream_Read_Stub");
   --  objbase.h :8641
   pragma Import (Stdcall, IStream_Write_Proxy, "IStream_Write_Proxy");
   --  objbase.h :8647
   pragma Import (Stdcall, IStream_Write_Stub, "IStream_Write_Stub");
   --  objbase.h :8654
   pragma Import (Stdcall, IStream_Seek_Proxy, "IStream_Seek_Proxy");
   --  objbase.h :8660
   pragma Import (Stdcall, IStream_Seek_Stub, "IStream_Seek_Stub");
   --  objbase.h :8667
   pragma Import (Stdcall, IStream_CopyTo_Proxy, "IStream_CopyTo_Proxy");
   --  objbase.h :8673
   pragma Import (Stdcall, IStream_CopyTo_Stub, "IStream_CopyTo_Stub");
   --  objbase.h :8681
   pragma Import (Stdcall, IEnumSTATSTG_Next_Proxy, "IEnumSTATSTG_Next_Proxy");
   --  objbase.h :8688
   pragma Import (Stdcall, IEnumSTATSTG_Next_Stub, "IEnumSTATSTG_Next_Stub");
   --  objbase.h :8695
   pragma Import (Stdcall, IStorage_OpenStream_Proxy,
                    "IStorage_OpenStream_Proxy");
   --  objbase.h :8701
   pragma Import (Stdcall, IStorage_OpenStream_Stub,
                    "IStorage_OpenStream_Stub");
   --  objbase.h :8710
   pragma Import (Stdcall, IStorage_EnumElements_Proxy,
                   "IStorage_EnumElements_Proxy");
   --  objbase.h :8719
   pragma Import (Stdcall, IStorage_EnumElements_Stub,
                    "IStorage_EnumElements_Stub");
   --  objbase.h :8727
   pragma Import (Stdcall, ILockBytes_ReadAt_Proxy, "ILockBytes_ReadAt_Proxy");
   --  objbase.h :8735
   pragma Import (Stdcall, ILockBytes_ReadAt_Stub, "ILockBytes_ReadAt_Stub");
   --  objbase.h :8743
   pragma Import (Stdcall, ILockBytes_WriteAt_Proxy,
                    "ILockBytes_WriteAt_Proxy");
   --  objbase.h :8750
   pragma Import (Stdcall, ILockBytes_WriteAt_Stub, "ILockBytes_WriteAt_Stub");
   --  objbase.h :8758
   pragma Import (Stdcall, IEnumFORMATETC_Next_Proxy,
                    "IEnumFORMATETC_Next_Proxy");
   --  objbase.h :8765
   pragma Import (Stdcall, IEnumFORMATETC_Next_Stub,
                    "IEnumFORMATETC_Next_Stub");
   --  objbase.h :8772
   pragma Import (Stdcall, IEnumSTATDATA_Next_Proxy,
                    "IEnumSTATDATA_Next_Proxy");
   --  objbase.h :8778
   pragma Import (Stdcall, IEnumSTATDATA_Next_Stub,
                    "IEnumSTATDATA_Next_Stub");
   --  objbase.h :8785
   pragma Import (Stdcall, IAdviseSink_OnDataChange_Proxy,
                   "IAdviseSink_OnDataChange_Proxy");     --  objbase.h :8791
   pragma Import (Stdcall, IAdviseSink_OnDataChange_Stub,
                   "IAdviseSink_OnDataChange_Stub");      --  objbase.h :8797
   pragma Import (Stdcall, IAdviseSink_OnViewChange_Proxy,
                   "IAdviseSink_OnViewChange_Proxy");     --  objbase.h :8802
   pragma Import (Stdcall, IAdviseSink_OnViewChange_Stub,
                   "IAdviseSink_OnViewChange_Stub");      --  objbase.h :8808
   pragma Import (Stdcall, IAdviseSink_OnRename_Proxy,
                    "IAdviseSink_OnRename_Proxy");
   --  objbase.h :8813
   pragma Import (Stdcall, IAdviseSink_OnRename_Stub,
                    "IAdviseSink_OnRename_Stub");
   --  objbase.h :8818
   pragma Import (Stdcall, IAdviseSink_OnSave_Proxy,
                    "IAdviseSink_OnSave_Proxy");
   --  objbase.h :8822
   pragma Import (Stdcall, IAdviseSink_OnSave_Stub,
                    "IAdviseSink_OnSave_Stub");
   --  objbase.h :8826
   pragma Import (Stdcall, IAdviseSink_OnClose_Proxy,
                    "IAdviseSink_OnClose_Proxy");
   --  objbase.h :8829
   pragma Import (Stdcall, IAdviseSink_OnClose_Stub,
                    "IAdviseSink_OnClose_Stub");
   --  objbase.h :8833
   pragma Import (Stdcall, IAdviseSink2_OnLinkSrcChange_Proxy,
                   "IAdviseSink2_OnLinkSrcChange_Proxy");
   --  objbase.h :8836
   pragma Import (Stdcall, IAdviseSink2_OnLinkSrcChange_Stub,
                   "IAdviseSink2_OnLinkSrcChange_Stub");
   --  objbase.h :8841
   pragma Import (Stdcall, IDataObject_GetData_Proxy,
                    "IDataObject_GetData_Proxy");
   --  objbase.h :8845
   pragma Import (Stdcall, IDataObject_GetData_Stub,
                    "IDataObject_GetData_Stub");
   --  objbase.h :8851
   pragma Import (Stdcall, IDataObject_GetDataHere_Proxy,
                   "IDataObject_GetDataHere_Proxy");      --  objbase.h :8856
   pragma Import (Stdcall, IDataObject_GetDataHere_Stub,
                   "IDataObject_GetDataHere_Stub");       --  objbase.h :8862
   pragma Import (Stdcall, IDataObject_SetData_Proxy,
                    "IDataObject_SetData_Proxy");
   --  objbase.h :8867
   pragma Import (Stdcall, IDataObject_SetData_Stub,
                    "IDataObject_SetData_Stub");
   --  objbase.h :8874
   pragma Import (Stdcall, CoBuildVersion, "CoBuildVersion");
   --  objbase.h :8959
   pragma Import (Stdcall, CoInitialize, "CoInitialize");   --  objbase.h :8963
   pragma Import (Stdcall, CoUninitialize, "CoUninitialize");
   --  objbase.h :8964
   pragma Import (Stdcall, CoGetMalloc, "CoGetMalloc");     --  objbase.h :8965
   pragma Import (Stdcall, CoGetCurrentProcess, "CoGetCurrentProcess");
   --  objbase.h :8966
   pragma Import (Stdcall, CoCreateStandardMalloc, "CoCreateStandardMalloc");
   --  objbase.h :8967
   pragma Import (Stdcall, CoGetClassObject, "CoGetClassObject");
   --  objbase.h :8976
   pragma Import (Stdcall, CoRegisterClassObject, "CoRegisterClassObject");
   --  objbase.h :8978
   pragma Import (Stdcall, CoRevokeClassObject, "CoRevokeClassObject");
   --  objbase.h :8980
   pragma Import (Stdcall, CoGetMarshalSizeMax, "CoGetMarshalSizeMax");
   --  objbase.h :8985
   pragma Import (Stdcall, CoMarshalInterface, "CoMarshalInterface");
   --  objbase.h :8987
   pragma Import (Stdcall, CoUnmarshalInterface, "CoUnmarshalInterface");
   --  objbase.h :8989
   pragma Import (Stdcall, CoMarshalHresult, "CoMarshalHresult");
   --  objbase.h :8990
   pragma Import (Stdcall, CoUnmarshalHresult, "CoUnmarshalHresult");
   --  objbase.h :8991
   pragma Import (Stdcall, CoReleaseMarshalData, "CoReleaseMarshalData");
   --  objbase.h :8992
   pragma Import (Stdcall, CoDisconnectObject, "CoDisconnectObject");
   --  objbase.h :8993
   pragma Import (Stdcall, CoLockObjectExternal, "CoLockObjectExternal");
   --  objbase.h :8994
   pragma Import (Stdcall, CoGetStandardMarshal, "CoGetStandardMarshal");
   --  objbase.h :8995
   pragma Import (Stdcall, CoIsHandlerConnected, "CoIsHandlerConnected");
   --  objbase.h :8999
   pragma Import (Stdcall, CoHasStrongExternalConnections,
                   "CoHasStrongExternalConnections");     --  objbase.h :9000
   pragma Import (Stdcall, CoLoadLibrary, "CoLoadLibrary");
   --  objbase.h :9005
   pragma Import (Stdcall, CoFreeLibrary, "CoFreeLibrary");
   --  objbase.h :9006
   pragma Import (Stdcall, CoFreeAllLibraries, "CoFreeAllLibraries");
   --  objbase.h :9007
   pragma Import (Stdcall, CoFreeUnusedLibraries, "CoFreeUnusedLibraries");
   --  objbase.h :9008
   pragma Import (Stdcall, CoCreateInstance, "CoCreateInstance");
   --  objbase.h :9013
   pragma Import (Stdcall, StringFromCLSID, "StringFromCLSID");
   --  objbase.h :9019
   pragma Import (Stdcall, CLSIDFromString, "CLSIDFromString");
   --  objbase.h :9020
   pragma Import (Stdcall, StringFromIID, "StringFromIID");
   --  objbase.h :9021
   pragma Import (Stdcall, IIDFromString, "IIDFromString");
   --  objbase.h :9022
   pragma Import (Stdcall, CoIsOle1Class, "CoIsOle1Class");
   --  objbase.h :9023
   pragma Import (Stdcall, ProgIDFromCLSID, "ProgIDFromCLSID");
   --  objbase.h :9024
   pragma Import (Stdcall, CLSIDFromProgID, "CLSIDFromProgID");
   --  objbase.h :9025
   pragma Import (Stdcall, StringFromGUID2, "StringFromGUID2");
   --  objbase.h :9026
   pragma Import (Stdcall, CoCreateGuid, "CoCreateGuid");
   --  objbase.h :9028
   pragma Import (Stdcall, CoFileTimeToDosDateTime, "CoFileTimeToDosDateTime");
   --  objbase.h :9030
   pragma Import (Stdcall, CoDosDateTimeToFileTime, "CoDosDateTimeToFileTime");
   --  objbase.h :9032
   pragma Import (Stdcall, CoFileTimeNow, "CoFileTimeNow");
   --  objbase.h :9034
   pragma Import (Stdcall, CoRegisterMessageFilter, "CoRegisterMessageFilter");
   --  objbase.h :9037
   pragma Import (Stdcall, CoGetTreatAsClass, "CoGetTreatAsClass");
   --  objbase.h :9043
   pragma Import (Stdcall, CoTreatAsClass, "CoTreatAsClass");
   --  objbase.h :9044
   pragma Import (Stdcall, DllGetClassObject, "DllGetClassObject");
   --  objbase.h :9064
   pragma Import (Stdcall, DllCanUnloadNow, "DllCanUnloadNow");
   --  objbase.h :9066
   pragma Import (Stdcall, CoTaskMemAlloc, "CoTaskMemAlloc");
   --  objbase.h :9070
   pragma Import (Stdcall, CoTaskMemRealloc, "CoTaskMemRealloc");
   --  objbase.h :9071
   pragma Import (Stdcall, CoTaskMemFree, "CoTaskMemFree");
   --  objbase.h :9072
   pragma Import (Stdcall, CreateDataAdviseHolder, "CreateDataAdviseHolder");
   --  objbase.h :9077
   pragma Import (Stdcall, CreateDataCache, "CreateDataCache");
   --  objbase.h :9079
   pragma Import (Stdcall, StgCreateDocfile, "StgCreateDocfile");
   --  objbase.h :9088
   pragma Import (Stdcall, StgCreateDocfileOnILockBytes,
                   "StgCreateDocfileOnILockBytes");
   --  objbase.h :9093
   pragma Import (Stdcall, StgOpenStorage, "StgOpenStorage");
   --  objbase.h :9098
   pragma Import (Stdcall, StgOpenStorageOnILockBytes,
                    "StgOpenStorageOnILockBytes");
   --  objbase.h :9104
   pragma Import (Stdcall, StgIsStorageFile, "StgIsStorageFile");
   --  objbase.h :9111
   pragma Import (Stdcall, StgIsStorageILockBytes, "StgIsStorageILockBytes");
   --  objbase.h :9112
   pragma Import (Stdcall, StgSetTimes, "StgSetTimes");     --  objbase.h :9114
   pragma Import (Stdcall, BindMoniker, "BindMoniker");     --  objbase.h :9124
   pragma Import (Stdcall, MkParseDisplayName, "MkParseDisplayName");
   --  objbase.h :9125
   pragma Import (Stdcall, MonikerRelativePathTo, "MonikerRelativePathTo");
   --  objbase.h :9127
   pragma Import (Stdcall, MonikerCommonPrefixWith, "MonikerCommonPrefixWith");
   --  objbase.h :9129
   pragma Import (Stdcall, CreateBindCtx, "CreateBindCtx"); --  objbase.h :9131
   pragma Import (Stdcall, CreateGenericComposite, "CreateGenericComposite");
   --  objbase.h :9132
   pragma Import (Stdcall, GetClassFile, "GetClassFile");   --  objbase.h :9134
   pragma Import (Stdcall, CreateFileMoniker, "CreateFileMoniker");
   --  objbase.h :9136
   pragma Import (Stdcall, CreateItemMoniker, "CreateItemMoniker");
   --  objbase.h :9138
   pragma Import (Stdcall, CreateAntiMoniker, "CreateAntiMoniker");
   --  objbase.h :9140
   pragma Import (Stdcall, CreatePointerMoniker, "CreatePointerMoniker");
   --  objbase.h :9141
   pragma Import (Stdcall, GetRunningObjectTable, "GetRunningObjectTable");
   --  objbase.h :9143

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

end Win32.Objbase;


