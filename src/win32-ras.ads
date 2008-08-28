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

with Win32.Lmcons;
with Win32.Windef;
with Win32.Winnt;

package Win32.Ras is

   use type Interfaces.C.char_array;

   RAS_MaxEntryName : constant := 20;       --  ras.h:22
   RAS_MaxDeviceName : constant := 32;       --  ras.h:23
   RAS_MaxDeviceType : constant := 16;       --  ras.h:24
   RAS_MaxParamKey : constant := 32;       --  ras.h:25
   RAS_MaxParamValue : constant := 128;      --  ras.h:26
   RAS_MaxPhoneNumber : constant := 128;      --  ras.h:27
   RAS_MaxCallbackNumber : constant := 48;       --  ras.h:28
   RAS_MaxIpAddress : constant := 15;       --  ras.h:29
   RAS_MaxIpxAddress : constant := 21;       --  ras.h:30
   RASCS_PAUSED : constant := 16#1000#; --  ras.h:69
   RASCS_DONE : constant := 16#2000#; --  ras.h:70
   RDEOPT_UsePrefixSuffix : constant := 16#1#;    --  ras.h:192
   RDEOPT_PausedStates : constant := 16#2#;    --  ras.h:193
   RDEOPT_IgnoreModemSpeaker : constant := 16#4#;    --  ras.h:194
   RDEOPT_SetModemSpeaker : constant := 16#8#;    --  ras.h:195
   RDEOPT_IgnoreSoftwareCompression : constant := 16#10#;   --  ras.h:196
   RDEOPT_SetSoftwareCompression : constant := 16#20#;   --  ras.h:197
   RASDIALEVENT : constant CHAR_Array :=
     "RasDialEvent" & Nul; --  ras.h:373
   WM_RASDIALEVENT : constant := 16#cccd#; --  ras.h:374

   type tagRASCONNSTATE is
     ( --  ras.h:73
       RASCS_OpenPort,                                     --  ras.h:75
       RASCS_PortOpened,                                   --  ras.h:76
       RASCS_ConnectDevice,                                --  ras.h:77
       RASCS_DeviceConnected,                              --  ras.h:78
       RASCS_AllDevicesConnected,                          --  ras.h:79
       RASCS_Authenticate,                                 --  ras.h:80
       RASCS_AuthNotify,                                   --  ras.h:81
       RASCS_AuthRetry,                                    --  ras.h:82
       RASCS_AuthCallback,                                 --  ras.h:83
       RASCS_AuthChangePassword,                           --  ras.h:84
       RASCS_AuthProject,                                  --  ras.h:85
       RASCS_AuthLinkSpeed,                                --  ras.h:86
       RASCS_AuthAck,                                      --  ras.h:87
       RASCS_ReAuthenticate,                               --  ras.h:88
       RASCS_Authenticated,                                --  ras.h:89
       RASCS_PrepareForCallback,                           --  ras.h:90
       RASCS_WaitForModemReset,                            --  ras.h:91
       RASCS_WaitForCallback,                              --  ras.h:92
       RASCS_Projected,                                    --  ras.h:93
       RASCS_Interactive,                                  --  ras.h:95
       RASCS_RetryAuthentication,                          --  ras.h:96
       RASCS_CallbackSetByCaller,                          --  ras.h:97
       RASCS_PasswordExpired,                              --  ras.h:98
       RASCS_Connected,                                    --  ras.h:100
       RASCS_Disconnected                                  --  ras.h:102
       );
   for tagRASCONNSTATE use
      ( --  ras.h:73
        RASCS_OpenPort => 0,                                --  ras.h:75
        RASCS_PortOpened => 1,                              --  ras.h:76
        RASCS_ConnectDevice => 2,                           --  ras.h:77
        RASCS_DeviceConnected => 3,                         --  ras.h:78
        RASCS_AllDevicesConnected => 4,                     --  ras.h:79
        RASCS_Authenticate => 5,                            --  ras.h:80
        RASCS_AuthNotify => 6,                              --  ras.h:81
        RASCS_AuthRetry => 7,                               --  ras.h:82
        RASCS_AuthCallback => 8,                            --  ras.h:83
        RASCS_AuthChangePassword => 9,                      --  ras.h:84
        RASCS_AuthProject => 10,                            --  ras.h:85
        RASCS_AuthLinkSpeed => 11,                          --  ras.h:86
        RASCS_AuthAck => 12,                                --  ras.h:87
        RASCS_ReAuthenticate => 13,                         --  ras.h:88
        RASCS_Authenticated => 14,                          --  ras.h:89
        RASCS_PrepareForCallback => 15,                     --  ras.h:90
        RASCS_WaitForModemReset => 16,                      --  ras.h:91
        RASCS_WaitForCallback => 17,                        --  ras.h:92
        RASCS_Projected => 18,                              --  ras.h:93
        RASCS_Interactive => 4096,                          --  ras.h:95
        RASCS_RetryAuthentication => 4097,                  --  ras.h:96
        RASCS_CallbackSetByCaller => 4098,                  --  ras.h:97
        RASCS_PasswordExpired => 4099,                      --  ras.h:98
        RASCS_Connected => 8192,                            --  ras.h:100
        RASCS_Disconnected => 8193                          --  ras.h:102
        );
   for tagRASCONNSTATE'Size use 32;                        --  ras.h:73

   type tagRASPROJECTION is
     ( --  ras.h:230
       RASP_PppIp,                                         --  ras.h:236
       RASP_PppIpx,                                        --  ras.h:234
       RASP_PppNbf,                                        --  ras.h:233
       RASP_Amb                                            --  ras.h:232
       );
   for tagRASPROJECTION use
      ( --  ras.h:230
        RASP_PppIp => 32801,                                --  ras.h:236
        RASP_PppIpx => 32811,                               --  ras.h:234
        RASP_PppNbf => 32831,                               --  ras.h:233
        RASP_Amb => 65536                                   --  ras.h:232
        );

   --  for tagRASPROJECTION'size use 32;                   -- ras.h:230

   subtype HRASCONN is Win32.Winnt.HANDLE;

   type RASCONNW;                                          --  ras.h:41
   type RASCONNA;                                          --  ras.h:49
   type RASCONNSTATUSW;                                    --  ras.h:110
   type RASCONNSTATUSA;                                    --  ras.h:120
   type RASDIALPARAMSW;                                    --  ras.h:143
   type RASDIALPARAMSA;                                    --  ras.h:155
   type RASDIALEXTENSIONS;                                 --  ras.h:180
   type RASENTRYNAMEW;                                     --  ras.h:203
   type RASENTRYNAMEA;                                     --  ras.h:210
   type RASAMBW;                                           --  ras.h:246
   type RASAMBA;                                           --  ras.h:255
   type RASPPPNBFW;                                        --  ras.h:277
   type RASPPPNBFA;                                        --  ras.h:288
   type RASIPXW;                                           --  ras.h:313
   type RASPPPIPXA;                                        --  ras.h:322
   type RASPPPIPW;                                         --  ras.h:343
   type RASPPPIPA;                                         --  ras.h:351

   type RASCONNW is                                        --  ras.h:41
      record
         dwSize : Win32.DWORD;                       --  ras.h:43
         hrasconn : Win32.Ras.HRASCONN;                --  ras.h:44
         szEntryName : Win32.WCHAR_Array (0 .. RAS_MaxEntryName);
         --  ras.h:45
      end record;

   type RASCONNA is                                        --  ras.h:49
      record
         dwSize : Win32.DWORD;                       --  ras.h:51
         hrasconn : Win32.Ras.HRASCONN;                --  ras.h:52
         szEntryName : Win32.CHAR_Array (0 .. RAS_MaxEntryName);
         --  ras.h:53
      end record;

   type RASCONN is access all RASCONNA;                    --  ras.h:59

   type LPRASCONNW is access all  RASCONNW;                --  ras.h:62
   type LPRASCONNA is access all  RASCONNA;                --  ras.h:63
   type LPRASCONN  is access all  RASCONN;                 --  ras.h:64

   type RASCONNSTATE is new tagRASCONNSTATE;                --  ras.h:72

   type LPRASCONNSTATE is access all RASCONNSTATE;         --  ras.h:104

   type RASCONNSTATUSW is                                  --  ras.h:110
      record
         dwSize : Win32.DWORD;                      --  ras.h:112
         rasconnstate : tagRASCONNSTATE;                  --  ras.h:113
         dwError : Win32.DWORD;                      --  ras.h:114
         szDeviceType : Win32.WCHAR_Array (0 .. RAS_MaxDeviceType);
         --  ras.h:115
         szDeviceName : Win32.WCHAR_Array (0 .. RAS_MaxDeviceType);
         --  ras.h:116
      end record;

   type RASCONNSTATUSA is                                  --  ras.h:120
      record
         dwSize : Win32.DWORD;                      --  ras.h:122
         rasconnstate : tagRASCONNSTATE;                  --  ras.h:123
         dwError : Win32.DWORD;                      --  ras.h:124
         szDeviceType : Win32.CHAR_Array (0 .. RAS_MaxDeviceType);
         --  ras.h:125
         szDeviceName : Win32.CHAR_Array (0 .. RAS_MaxDeviceType);
         --  ras.h:126
      end record;

   type RASCONNSTATUS is access all RASCONNSTATUSA;        --  ras.h:132

   type LPRASCONNSTATUSW is access all RASCONNSTATUSW;     --  ras.h:135
   type LPRASCONNSTATUSA is access all RASCONNSTATUSA;     --  ras.h:136
   type LPRASCONNSTATUS  is access all RASCONNSTATUS;     --  ras.h:137

   type RASDIALPARAMSW is                                  --  ras.h:143
      record
         dwSize : Win32.DWORD;                  --  ras.h:145
         szEntryName : Win32.WCHAR_Array (0 .. RAS_MaxEntryName);
         --  ras.h:146
         szPhoneNumber : Win32.WCHAR_Array (0 .. RAS_MaxPhoneNumber);
         --  ras.h:147
         szCallbackNumber : Win32.WCHAR_Array (0 .. RAS_MaxCallbackNumber);
         --  ras.h:148
         szUserName : Win32.WCHAR_Array (0 .. Win32.Lmcons.UNLEN);
         --  ras.h:149
         szPassword : Win32.WCHAR_Array (0 .. Win32.Lmcons.PWLEN);
         --  ras.h:150
         szDomain : Win32.WCHAR_Array (0 .. Win32.Lmcons.DNLEN);
         --  ras.h:151
      end record;

   type RASDIALPARAMSA is                                  --  ras.h:155
      record
         dwSize : Win32.DWORD;                  --  ras.h:157
         szEntryName : Win32.CHAR_Array (0 .. RAS_MaxEntryName);
         --  ras.h:158
         szPhoneNumber : Win32.CHAR_Array (0 .. RAS_MaxPhoneNumber);
         --  ras.h:159
         szCallbackNumber : Win32.CHAR_Array (0 .. RAS_MaxCallbackNumber);
         --  ras.h:160
         szUserName : Win32.CHAR_Array (0 .. Win32.Lmcons.UNLEN);
         --  ras.h:161
         szPassword : Win32.CHAR_Array (0 .. Win32.Lmcons.PWLEN);
         --  ras.h:162
         szDomain : Win32.CHAR_Array (0 .. Win32.Lmcons.DNLEN);
         --  ras.h:163
      end record;

   type RASDIALPARAMS is access all RASDIALPARAMSA;        --  ras.h:169

   type LPRASDIALPARAMSW is access all  RASDIALPARAMSW;    --  ras.h:172
   type LPRASDIALPARAMSA is access all  RASDIALPARAMSA;    --  ras.h:173
   type LPRASDIALPARAMS  is access all  RASDIALPARAMS;    --  ras.h:174

   type RASDIALEXTENSIONS is                               --  ras.h:180
      record
         dwSize : Win32.DWORD;                        --  ras.h:182
         dwfOptions : Win32.DWORD;                        --  ras.h:183
         hwndParent : Win32.Windef.HWND;                  --  ras.h:184
         reserved : Win32.DWORD;                        --  ras.h:185
      end record;

   type LPRASDIALEXTENSIONS is access all RASDIALEXTENSIONS;
   --  ras.h:188

   type RASENTRYNAMEW is                                   --  ras.h:203
      record
         dwSize : Win32.DWORD;                       --  ras.h:205
         szEntryName : Win32.WCHAR_Array (0 .. RAS_MaxEntryName);
         --  ras.h:206
      end record;

   type RASENTRYNAMEA is                                   --  ras.h:210
      record
         dwSize : Win32.DWORD;                       --  ras.h:212
         szEntryName : Win32.CHAR_Array (0 .. RAS_MaxEntryName);
         --  ras.h:213
      end record;

   type RASENTRYNAME is access all RASENTRYNAMEA;          --  ras.h:219

   type  LPRASENTRYNAMEW is access all RASENTRYNAMEW;      --  ras.h:222
   type  LPRASENTRYNAMEA is access all RASENTRYNAMEA;      --  ras.h:223
   type  LPRASENTRYNAME  is access all RASENTRYNAME;      --  ras.h:224

   type RASPROJECTION is new tagRASPROJECTION;              --  ras.h:229

   type LPRASPROJECTION is access all RASPROJECTION;       --  ras.h:238

   type RASAMBW is                                         --  ras.h:246
      record
         dwSize : Win32.DWORD;                    --  ras.h:248
         dwError : Win32.DWORD;                    --  ras.h:249
         szNetBiosError : Win32.WCHAR_Array
           (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
         --  ras.h:250
         bLana : Win32.BYTE;                     --  ras.h:251
      end record;

   type RASAMBA is                                         --  ras.h:255
      record
         dwSize : Win32.DWORD;                    --  ras.h:257
         dwError : Win32.DWORD;                    --  ras.h:258
         szNetBiosError : Win32.CHAR_Array
           (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
         --  ras.h:259
         bLana : Win32.BYTE;                     --  ras.h:260
      end record;

   subtype RASAMB is RASAMBA;                             --  ras.h:266
   type LPRASAMBW is access all RASAMBW;                   --  ras.h:269
   type LPRASAMBA is access all RASAMBA;                   --  ras.h:270
   type LPRASAMB is access all RASAMB;                     --  ras.h:271

   type RASPPPNBFW is                                      --  ras.h:277
      record
         dwSize : Win32.DWORD;                 --  ras.h:279
         dwError : Win32.DWORD;                 --  ras.h:280
         dwNetBiosError : Win32.DWORD;                 --  ras.h:281
         szNetBiosError : Win32.WCHAR_Array
           (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
         --  ras.h:282
         szWorkstationName : Win32.WCHAR_Array
           (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
         --  ras.h:283
         bLana : Win32.BYTE;                  --  ras.h:284
      end record;

   type RASPPPNBFA is                                      --  ras.h:288
      record
         dwSize : Win32.DWORD;                 --  ras.h:290
         dwError : Win32.DWORD;                 --  ras.h:291
         dwNetBiosError : Win32.DWORD;                 --  ras.h:292
         szNetBiosError : Win32.CHAR_Array
           (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
         --  ras.h:293
         szWorkstationName : Win32.CHAR_Array
           (0 .. Win32.Lmcons.NETBIOS_NAME_LEN);
         --  ras.h:294
         bLana : Win32.BYTE;                  --  ras.h:295
      end record;

   type RASPPPNBF is access all RASPPPNBFA;                --  ras.h:301

   type LPRASPPPNBFW is access all RASPPPNBFW;             --  ras.h:304
   type LPRASPPPNBFA is access all RASPPPNBFA;             --  ras.h:305
   type LPRASPPPNBF  is access all RASPPPNBF;             --  ras.h:306

   type RASIPXW is                                         --  ras.h:313
      record
         dwSize : Win32.DWORD;                      --  ras.h:315
         dwError : Win32.DWORD;                      --  ras.h:316
         szIpxAddress : Win32.WCHAR_Array (0 .. RAS_MaxIpxAddress);
         --  ras.h:317
      end record;

   type RASPPPIPXA is                                      --  ras.h:322
      record
         dwSize : Win32.DWORD;                      --  ras.h:324
         dwError : Win32.DWORD;                      --  ras.h:325
         szIpxAddress : Win32.CHAR_Array (0 .. RAS_MaxIpxAddress);
         --  ras.h:326
      end record;

   type RASPPPIPX is access all RASPPPIPXA;                --  ras.h:332

   type LPRASPPPIPXW is access all RASIPXW;                --  ras.h:335
   type LPRASPPPIPXA is access all RASPPPIPXA;             --  ras.h:336
   type LPRASPPPIPX  is access all RASPPPIPX;             --  ras.h:337

   type RASPPPIPW is                                       --  ras.h:343
      record
         dwSize : Win32.DWORD;                       --  ras.h:345
         dwError : Win32.DWORD;                       --  ras.h:346
         szIpAddress : Win32.WCHAR_Array (0 .. RAS_MaxIpAddress);
         --  ras.h:347
      end record;

   type RASPPPIPA is                                       --  ras.h:351
      record
         dwSize : Win32.DWORD;                       --  ras.h:353
         dwError : Win32.DWORD;                       --  ras.h:354
         szIpAddress : Win32.CHAR_Array (0 .. RAS_MaxIpAddress);
         --  ras.h:355
      end record;

   type RASPPPIP is access all RASPPPIPA;                  --  ras.h:361

   type LPRASPPPIPW is access all RASPPPIPW;               --  ras.h:364
   type LPRASPPPIPA is access all RASPPPIPA;               --  ras.h:365
   type LPRASPPPIP  is access all RASPPPIP;               --  ras.h:366

   type RASDIALFUNC is access procedure
     (unMsg : Win32.UINT;
      RasConnState : tagRASCONNSTATE;
      dwError : Win32.DWORD);                 --  ras.h:381
   pragma Convention (Stdcall, RASDIALFUNC);
   type RASDIALFUNC1 is access procedure
     (hRasConn : Win32.Ras.HRASCONN;
      unMsg : Win32.UINT;
      rascs : tagRASCONNSTATE;
      dwError : Win32.DWORD;
      dwExtendedError : Win32.DWORD);              --  ras.h:382
   pragma Convention (Stdcall, RASDIALFUNC1);

   function RasDialA
     (lpRasDialExtensions : access RASDIALEXTENSIONS;
      lpszPhonebookPath : Win32.LPSTR;
      lpRasDialParams : access RASDIALPARAMSA;
      dwNotifierType : Win32.DWORD;
      notifier : Win32.LPVOID;
      lphRasConn : access HRASCONN)
     return Win32.DWORD;                          --  ras.h:387

   function RasDial
     (lpRasDialExtensions : access RASDIALEXTENSIONS;
      lpszPhonebookPath : Win32.LPSTR;
      lpRasDialParams : access RASDIALPARAMSA;
      dwNotifierType : Win32.DWORD;
      notifier : Win32.LPVOID;
      lphRasConn : access HRASCONN)
     return Win32.DWORD
     renames RasDialA;                            --  ras.h:387

   function RasDialW
     (lpRasDialExtensions : access RASDIALEXTENSIONS;
      lpszPhonebookPath : Win32.LPWSTR;
      lpRasDialParams : access RASDIALPARAMSW;
      dwNotifierType : Win32.DWORD;
      notifier : Win32.LPVOID;
      lphRasConn : access HRASCONN)
     return Win32.DWORD;                          --  ras.h:390

   function RasEnumConnectionsA
     (lpRasConn : access RASCONNA;
      lpcb : Win32.LPDWORD;
      lpcConnections : Win32.LPDWORD)
     return Win32.DWORD;                          --  ras.h:393

   function RasEnumConnections
     (lpRasConn : access RASCONNA;
      lpcb : Win32.LPDWORD;
      lpcConnections : Win32.LPDWORD)
     return Win32.DWORD
     renames RasEnumConnectionsA;                 --  ras.h:393

   function RasEnumConnectionsW
     (lpRasConn : access RASCONNW;
      lpcb : Win32.LPDWORD;
      lpcConnections : Win32.LPDWORD)
     return Win32.DWORD;                          --  ras.h:395

   function RasEnumEntriesA
     (reserved : Win32.LPSTR;
      lpszPhonebookPath : Win32.LPSTR;
      lpRasEntryname : access RASENTRYNAMEA;
      lpcb : Win32.LPDWORD;
      lpcEntries : Win32.LPDWORD)
     return Win32.DWORD;                          --  ras.h:397

   function RasEnumEntries
     (reserved : Win32.LPSTR;
      lpszPhonebookPath : Win32.LPSTR;
      lpRasEntryname : access RASENTRYNAMEA;
      lpcb : Win32.LPDWORD;
      lpcEntries : Win32.LPDWORD)
     return Win32.DWORD
     renames RasEnumEntriesA;                     --  ras.h:397

   function RasEnumEntriesW
     (reserved : Win32.LPWSTR;
      lpszPhonebookPath : Win32.LPWSTR;
      lpRasEntryname : access RASENTRYNAMEW;
      lpcb : Win32.LPDWORD;
      lpcEntries : Win32.LPDWORD)
     return Win32.DWORD;                          --  ras.h:400

   function RasGetConnectStatusA
     (hRasConn : Win32.Ras.HRASCONN;
      lprasconnstatus : access RASCONNSTATUSA)
     return Win32.DWORD;                          --  ras.h:403

   function RasGetConnectStatus
     (hRasConn : Win32.Ras.HRASCONN;
      lprasconnstatus : access RASCONNSTATUSA)
     return Win32.DWORD
     renames RasGetConnectStatusA;                --  ras.h:403

   function RasGetConnectStatusW
     (hRasConn : Win32.Ras.HRASCONN;
      lprasconnstatus : access RASCONNSTATUSW)
     return Win32.DWORD;                          --  ras.h:405

   function RasGetErrorStringA
     (uErrorValue : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize : Win32.DWORD)
     return Win32.DWORD;                          --  ras.h:407

   function RasGetErrorString
     (uErrorValue : Win32.UINT;
      lpszErrorString : Win32.LPSTR;
      cBufSize : Win32.DWORD)
     return Win32.DWORD
     renames RasGetErrorStringA;                  --  ras.h:407

   function RasGetErrorStringW
     (uErrorValue : Win32.UINT;
      lpszErrorString : Win32.LPWSTR;
      cBufSize : Win32.DWORD)
     return Win32.DWORD;                          --  ras.h:409

   function RasHangUpA
     (hRasConn : Win32.Ras.HRASCONN)
     return Win32.DWORD;                          --  ras.h:411

   function RasHangUp
     (hRasConn : Win32.Ras.HRASCONN)
     return Win32.DWORD
     renames RasHangUpA;                          --  ras.h:411

   function RasHangUpW
     (hRasConn : Win32.Ras.HRASCONN)
     return Win32.DWORD;                          --  ras.h:413

   function RasGetProjectionInfoA
     (hRasConn : Win32.Ras.HRASCONN;
      Rasprojection : tagRASPROJECTION;
      lpProjection : Win32.LPVOID;
      lpcb : Win32.LPDWORD)
     return Win32.DWORD;                          --  ras.h:415

   function RasGetProjectionInfo
     (hRasConn : Win32.Ras.HRASCONN;
      RasProjection : tagRASPROJECTION;
      lpProjection : Win32.LPVOID;
      lpcb : Win32.LPDWORD)
     return Win32.DWORD
     renames RasGetProjectionInfoA;               --  ras.h:415

   function RasGetProjectionInfoW
     (hRasConn : Win32.Ras.HRASCONN;
      RasProjection : tagRASPROJECTION;
      lpProjection : Win32.LPVOID;
      lpcb : Win32.LPDWORD)
     return Win32.DWORD;                          --  ras.h:418

private

   pragma Convention (C, RASCONNW);                         --  ras.h:41
   pragma Convention (C, RASCONNA);                         --  ras.h:49
   pragma Convention (C, RASCONNSTATUSW);                   --  ras.h:110
   pragma Convention (C, RASCONNSTATUSA);                   --  ras.h:120
   pragma Convention (C, RASDIALPARAMSW);                   --  ras.h:143
   pragma Convention (C, RASDIALPARAMSA);                   --  ras.h:155
   pragma Convention (C_Pass_By_Copy, RASDIALEXTENSIONS);   --  ras.h:180
   pragma Convention (C, RASENTRYNAMEW);                    --  ras.h:203
   pragma Convention (C, RASENTRYNAMEA);                    --  ras.h:210
   pragma Convention (C, RASAMBW);                          --  ras.h:246
   pragma Convention (C, RASAMBA);                          --  ras.h:255
   pragma Convention (C, RASPPPNBFW);                       --  ras.h:277
   pragma Convention (C, RASPPPNBFA);                       --  ras.h:288
   pragma Convention (C, RASIPXW);                          --  ras.h:313
   pragma Convention (C, RASPPPIPXA);                       --  ras.h:322
   pragma Convention (C, RASPPPIPW);                        --  ras.h:343
   pragma Convention (C, RASPPPIPA);                        --  ras.h:351

   pragma Import (Stdcall, RasDialA, "RasDialA");                 --  ras.h:387
   pragma Import (Stdcall, RasDialW, "RasDialW");                 --  ras.h:390
   pragma Import (Stdcall, RasEnumConnectionsA, "RasEnumConnectionsA");
   --  ras.h:393
   pragma Import (Stdcall, RasEnumConnectionsW, "RasEnumConnectionsW");
   --  ras.h:395
   pragma Import (Stdcall, RasEnumEntriesA, "RasEnumEntriesA");   --  ras.h:397
   pragma Import (Stdcall, RasEnumEntriesW, "RasEnumEntriesW");   --  ras.h:400
   pragma Import (Stdcall, RasGetConnectStatusA, "RasGetConnectStatusA");
   --  ras.h:403
   pragma Import (Stdcall, RasGetConnectStatusW, "RasGetConnectStatusW");
   --  ras.h:405
   pragma Import (Stdcall, RasGetErrorStringA, "RasGetErrorStringA");
   --  ras.h:407
   pragma Import (Stdcall, RasGetErrorStringW, "RasGetErrorStringW");
   --  ras.h:409
   pragma Import (Stdcall, RasHangUpA, "RasHangUpA");             --  ras.h:411
   pragma Import (Stdcall, RasHangUpW, "RasHangUpW");             --  ras.h:413
   pragma Import (Stdcall, RasGetProjectionInfoA, "RasGetProjectionInfoA");
   --  ras.h:415
   pragma Import (Stdcall, RasGetProjectionInfoW, "RasGetProjectionInfoW");
   --  ras.h:418

end Win32.Ras;
