--  $Source$

--  $Revision$ $Date$ $Author$

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



with Win32.Windef;

with Win32.Winnt;



package Win32.Winnetwk is



   RESOURCE_CONNECTED : constant := 16#1#;         --  winnetwk.h:66

   RESOURCE_GLOBALNET : constant := 16#2#;         --  winnetwk.h:67

   RESOURCE_REMEMBERED : constant := 16#3#;         --  winnetwk.h:68

   RESOURCETYPE_ANY : constant := 16#0#;         --  winnetwk.h:71

   RESOURCETYPE_DISK : constant := 16#1#;         --  winnetwk.h:72

   RESOURCETYPE_PRINT : constant := 16#2#;         --  winnetwk.h:73

   RESOURCETYPE_UNKNOWN : constant := 16#ffffffff#;  --  winnetwk.h:74

   RESOURCEUSAGE_CONNECTABLE : constant := 16#1#;         --  winnetwk.h:76

   RESOURCEUSAGE_CONTAINER : constant := 16#2#;         --  winnetwk.h:77

   RESOURCEUSAGE_RESERVED : constant := 16#80000000#;  --  winnetwk.h:78

   RESOURCEDISPLAYTYPE_GENERIC : constant := 16#0#;         --  winnetwk.h:80

   RESOURCEDISPLAYTYPE_DOMAIN : constant := 16#1#;         --  winnetwk.h:81

   RESOURCEDISPLAYTYPE_SERVER : constant := 16#2#;         --  winnetwk.h:82

   RESOURCEDISPLAYTYPE_SHARE : constant := 16#3#;         --  winnetwk.h:83

   RESOURCEDISPLAYTYPE_FILE : constant := 16#4#;         --  winnetwk.h:84

   RESOURCEDISPLAYTYPE_GROUP : constant := 16#5#;         --  winnetwk.h:85

   RESOURCEDISPLAYTYPE_TREE : constant := 16#a#;         --  winnetwk.h:86

   UNIVERSAL_NAME_INFO_LEVEL : constant := 16#1#;         --  winnetwk.h:91

   REMOTE_NAME_INFO_LEVEL : constant := 16#2#;         --  winnetwk.h:92

   NETPROPERTY_PERSISTENT : constant := 1;             --  winnetwk.h:163

   CONNECT_UPDATE_PROFILE : constant := 16#1#;         --  winnetwk.h:169

   CONNECT_UPDATE_RECENT : constant := 16#2#;         --  winnetwk.h:170

   CONNECT_TEMPORARY : constant := 16#4#;         --  winnetwk.h:171

   CONNECT_INTERACTIVE : constant := 16#8#;         --  winnetwk.h:172

   CONNECT_PROMPT : constant := 16#10#;        --  winnetwk.h:173

   CONNECT_NEED_DRIVE : constant := 16#20#;        --  winnetwk.h:174

   WN_SUCCESS : constant := 0;             --  winnetwk.h:432

   WN_NOT_SUPPORTED : constant := 50;            --  winnetwk.h:433

   WN_NET_ERROR : constant := 59;            --  winnetwk.h:434

   WN_MORE_DATA : constant := 234;           --  winnetwk.h:435

   WN_BAD_POINTER : constant := 487;           --  winnetwk.h:436

   WN_BAD_VALUE : constant := 87;            --  winnetwk.h:437

   WN_BAD_PASSWORD : constant := 86;            --  winnetwk.h:438

   WN_ACCESS_DENIED : constant := 5;             --  winnetwk.h:439

   WN_FUNCTION_BUSY : constant := 170;           --  winnetwk.h:440

   WN_WINDOWS_ERROR : constant := 59;            --  winnetwk.h:441

   WN_BAD_USER : constant := 2202;          --  winnetwk.h:442

   WN_OUT_OF_MEMORY : constant := 8;             --  winnetwk.h:443

   WN_NO_NETWORK : constant := 1222;          --  winnetwk.h:444

   WN_EXTENDED_ERROR : constant := 1208;          --  winnetwk.h:445

   WN_NOT_CONNECTED : constant := 2250;          --  winnetwk.h:450

   WN_OPEN_FILES : constant := 2401;          --  winnetwk.h:451

   WN_DEVICE_IN_USE : constant := 2404;          --  winnetwk.h:452

   WN_BAD_NETNAME : constant := 67;            --  winnetwk.h:453

   WN_BAD_LOCALNAME : constant := 1200;          --  winnetwk.h:454

   WN_ALREADY_CONNECTED : constant := 85;            --  winnetwk.h:455

   WN_DEVICE_ERROR : constant := 31;            --  winnetwk.h:456

   WN_CONNECTION_CLOSED : constant := 1201;          --  winnetwk.h:457

   WN_NO_NET_OR_BAD_PATH : constant := 1203;          --  winnetwk.h:458

   WN_BAD_PROVIDER : constant := 1204;          --  winnetwk.h:459

   WN_CANNOT_OPEN_PROFILE : constant := 1205;          --  winnetwk.h:460

   WN_BAD_PROFILE : constant := 1206;          --  winnetwk.h:461

   WN_CANCEL : constant := 1223;          --  winnetwk.h:462

   WN_RETRY : constant := 1237;          --  winnetwk.h:463

   WN_BAD_HANDLE : constant := 6;             --  winnetwk.h:467

   WN_NO_MORE_ENTRIES : constant := 259;           --  winnetwk.h:468

   WN_NOT_CONTAINER : constant := 1207;          --  winnetwk.h:469

   WN_NO_ERROR : constant := 0;             --  winnetwk.h:471



   type UNIVERSAL_NAME_INFOA;                              --  winnetwk.h:98

   type UNIVERSAL_NAME_INFOW;                              --  winnetwk.h:101

   type REMOTE_NAME_INFOA;                                 --  winnetwk.h:112

   type REMOTE_NAME_INFOW;                                 --  winnetwk.h:117

   type NETRESOURCEA;                                      --  winnetwk.h:130

   type NETRESOURCEW;                                      --  winnetwk.h:140



   type LPUNIVERSAL_NAME_INFOA is access all UNIVERSAL_NAME_INFOA;

   --  winnetwk.h:100

   subtype LPUNIVERSAL_NAME_INFO is LPUNIVERSAL_NAME_INFOA;

   --  winnetwk.h:109

   type LPUNIVERSAL_NAME_INFOW is access all UNIVERSAL_NAME_INFOW;

   --  winnetwk.h:103

   type LPREMOTE_NAME_INFOA is access all REMOTE_NAME_INFOA;

   --  winnetwk.h:116

   subtype LPREMOTE_NAME_INFO is LPREMOTE_NAME_INFOA;      --  winnetwk.h:127

   type LPREMOTE_NAME_INFOW is access all REMOTE_NAME_INFOW;

   --  winnetwk.h:121

   type LPNETRESOURCEA is access all NETRESOURCEA;         --  winnetwk.h:139

   subtype LPNETRESOURCE is LPNETRESOURCEA;                --  winnetwk.h:155

   type LPNETRESOURCEW is access all NETRESOURCEW;         --  winnetwk.h:149



   type UNIVERSAL_NAME_INFOA is                            --  winnetwk.h:98

      record

         lpUniversalName : Win32.LPSTR;                   --  winnetwk.h:99

      end record;



   type UNIVERSAL_NAME_INFOW is                            --  winnetwk.h:101

      record

         lpUniversalName : Win32.LPWSTR;                  --  winnetwk.h:102

      end record;



   subtype UNIVERSAL_NAME_INFO is UNIVERSAL_NAME_INFOA;    --  winnetwk.h:108



   type REMOTE_NAME_INFOA is                               --  winnetwk.h:112

      record

         lpUniversalName : Win32.LPSTR;                  --  winnetwk.h:113

         lpConnectionName : Win32.LPSTR;                  --  winnetwk.h:114

         lpRemainingPath : Win32.LPSTR;                  --  winnetwk.h:115

      end record;



   type REMOTE_NAME_INFOW is                               --  winnetwk.h:117

      record

         lpUniversalName : Win32.LPWSTR;                 --  winnetwk.h:118

         lpConnectionName : Win32.LPWSTR;                 --  winnetwk.h:119

         lpRemainingPath : Win32.LPWSTR;                 --  winnetwk.h:120

      end record;



   subtype REMOTE_NAME_INFO is REMOTE_NAME_INFOA;          --  winnetwk.h:126



   type NETRESOURCEA is                                    --  winnetwk.h:130

      record

         dwScope : Win32.DWORD;                     --  winnetwk.h:131

         dwType : Win32.DWORD;                     --  winnetwk.h:132

         dwDisplayType : Win32.DWORD;                     --  winnetwk.h:133

         dwUsage : Win32.DWORD;                     --  winnetwk.h:134

         lpLocalName : Win32.LPSTR;                     --  winnetwk.h:135

         lpRemoteName : Win32.LPSTR;                     --  winnetwk.h:136

         lpComment : Win32.LPSTR;                     --  winnetwk.h:137

         lpProvider : Win32.LPSTR;                     --  winnetwk.h:138

      end record;



   type NETRESOURCEW is                                    --  winnetwk.h:140

      record

         dwScope : Win32.DWORD;                     --  winnetwk.h:141

         dwType : Win32.DWORD;                     --  winnetwk.h:142

         dwDisplayType : Win32.DWORD;                     --  winnetwk.h:143

         dwUsage : Win32.DWORD;                     --  winnetwk.h:144

         lpLocalName : Win32.LPWSTR;                    --  winnetwk.h:145

         lpRemoteName : Win32.LPWSTR;                    --  winnetwk.h:146

         lpComment : Win32.LPWSTR;                    --  winnetwk.h:147

         lpProvider : Win32.LPWSTR;                    --  winnetwk.h:148

      end record;



   subtype NETRESOURCE is NETRESOURCEA;                    --  winnetwk.h:154



   function WNETADDCONNECTIONA (lpRemoteName : Win32.LPCSTR;

                                lpPassword : Win32.LPCSTR;

                                lpLocalName : Win32.LPCSTR)

                               return Win32.DWORD;

   --  winnetwk.h:177



   function WNETADDCONNECTIONW (lpRemoteName : Win32.LPCWSTR;

                                lpPassword : Win32.LPCWSTR;

                                lpLocalName : Win32.LPCWSTR)

                               return Win32.DWORD;

   --  winnetwk.h:183



   function WNETADDCONNECTION (lpRemoteName : Win32.LPCSTR;

                               lpPassword : Win32.LPCSTR;

                               lpLocalName : Win32.LPCSTR)

                              return Win32.DWORD renames WNETADDCONNECTIONA;

   --  winnetwk.h:191



   function WNETADDCONNECTION2A (lpNetResource : access NETRESOURCEA;

                                 lpPassword : Win32.LPCSTR;

                                 lpUserName : Win32.LPCSTR;

                                 dwFlags : Win32.DWORD)

                                return Win32.DWORD;

   --  winnetwk.h:196



   function WNETADDCONNECTION2W (lpNetResource : access NETRESOURCEW;

                                 lpPassword : Win32.LPCWSTR;

                                 lpUserName : Win32.LPCWSTR;

                                 dwFlags : Win32.DWORD)

                                return Win32.DWORD;

   --  winnetwk.h:203



   function WNETADDCONNECTION2 (lpNetResource : access NETRESOURCEA;

                                lpPassword : Win32.LPCSTR;

                                lpUserName : Win32.LPCSTR;

                                dwFlags : Win32.DWORD)

                               return Win32.DWORD renames WNETADDCONNECTION2A;

   --  winnetwk.h:212



   function WNETADDCONNECTION3A (hwndOwner : Win32.Windef.HWND;

                                 lpNetResource : access NETRESOURCEA;

                                 lpPassword : Win32.LPCSTR;

                                 lpUserName : Win32.LPCSTR;

                                 dwFlags : Win32.DWORD)

                                return Win32.DWORD;

   --  winnetwk.h:216



   function WNETADDCONNECTION3W (hwndOwner : Win32.Windef.HWND;

                                 lpNetResource : access NETRESOURCEW;

                                 lpPassword : Win32.LPCWSTR;

                                 lpUserName : Win32.LPCWSTR;

                                 dwFlags : Win32.DWORD)

                                return Win32.DWORD;

   --  winnetwk.h:224



   function WNETADDCONNECTION3 (hwndOwner : Win32.Windef.HWND;

                                lpNetResource : access NETRESOURCEA;

                                lpPassword : Win32.LPCSTR;

                                lpUserName : Win32.LPCSTR;

                                dwFlags : Win32.DWORD)

                               return Win32.DWORD renames WNETADDCONNECTION3A;

   --  winnetwk.h:234



   function WNETCANCELCONNECTIONA (lpName : Win32.LPCSTR;

                                   fForce : Win32.BOOL)

                                  return Win32.DWORD;

   --  winnetwk.h:238



   function WNETCANCELCONNECTIONW (lpName : Win32.LPCWSTR;

                                   fForce : Win32.BOOL)

                                  return Win32.DWORD;

   --  winnetwk.h:243



   function WNETCANCELCONNECTION (lpName : Win32.LPCSTR;

                                  fForce : Win32.BOOL)

       return Win32.DWORD renames WNETCANCELCONNECTIONA;   --  winnetwk.h:250



   function WNETCANCELCONNECTION2A (lpName : Win32.LPCSTR;

                                    dwFlags : Win32.DWORD;

                                    fForce : Win32.BOOL)

                                   return Win32.DWORD;

   --  winnetwk.h:254



   function WNETCANCELCONNECTION2W (lpName : Win32.LPCWSTR;

                                    dwFlags : Win32.DWORD;

                                    fForce : Win32.BOOL)

                                   return Win32.DWORD;

   --  winnetwk.h:260



   function WNETCANCELCONNECTION2 (lpName : Win32.LPCSTR;

                                   dwFlags : Win32.DWORD;

                                   fForce : Win32.BOOL)

      return Win32.DWORD renames WNETCANCELCONNECTION2A;  --  winnetwk.h:268



   function WNETGETCONNECTIONA (lpLocalName : Win32.LPCSTR;

                                lpRemoteName : Win32.LPSTR;

                                lpnLength : Win32.LPDWORD)

                               return Win32.DWORD;

   --  winnetwk.h:273



   function WNETGETCONNECTIONW (lpLocalName : Win32.LPCWSTR;

                                lpRemoteName : Win32.LPWSTR;

                                lpnLength : Win32.LPDWORD)

                               return Win32.DWORD;

   --  winnetwk.h:279



   function WNETGETCONNECTION (lpLocalName : Win32.LPCSTR;

                               lpRemoteName : Win32.LPSTR;

                               lpnLength : Win32.LPDWORD)

                              return Win32.DWORD renames WNETGETCONNECTIONA;

   --  winnetwk.h:287



   function WNETGETUNIVERSALNAMEA (lpLocalPath : Win32.LPCSTR;

                                   dwInfoLevel : Win32.DWORD;

                                   lpBuffer : Win32.LPVOID;

                                   lpBufferSize : Win32.LPDWORD)

                                  return Win32.DWORD;

   --  winnetwk.h:291



   function WNETGETUNIVERSALNAMEW (lpLocalPath : Win32.LPCWSTR;

                                   dwInfoLevel : Win32.DWORD;

                                   lpBuffer : Win32.LPVOID;

                                   lpBufferSize : Win32.LPDWORD)

                                  return Win32.DWORD;

   --  winnetwk.h:298



   function WNETGETUNIVERSALNAME (lpLocalPath : Win32.LPCSTR;

                                  dwInfoLevel : Win32.DWORD;

                                  lpBuffer : Win32.LPVOID;

                                  lpBufferSize : Win32.LPDWORD)

      return Win32.DWORD renames WNETGETUNIVERSALNAMEA;   --  winnetwk.h:307



   function WNETOPENENUMA (dwScope : Win32.DWORD;

                           dwType : Win32.DWORD;

                           dwUsage : Win32.DWORD;

                           lpNetResource : access NETRESOURCEA;

                           lphEnum : Win32.Windef.LPHANDLE)

                          return Win32.DWORD;

   --  winnetwk.h:312



   function WNETOPENENUMW (dwScope : Win32.DWORD;

                           dwType : Win32.DWORD;

                           dwUsage : Win32.DWORD;

                           lpNetResource : access NETRESOURCEW;

                           lphEnum : Win32.Windef.LPHANDLE)

                          return Win32.DWORD;

   --  winnetwk.h:320



   function WNETOPENENUM (dwScope : Win32.DWORD;

                          dwType : Win32.DWORD;

                          dwUsage : Win32.DWORD;

                          lpNetResource : access NETRESOURCEA;

                          lphEnum : Win32.Windef.LPHANDLE)

                         return Win32.DWORD renames WNETOPENENUMA;

   --  winnetwk.h:330



   function WNETENUMRESOURCEA (hEnum : Win32.Winnt.HANDLE;

                               lpcCount : Win32.LPDWORD;

                               lpBuffer : Win32.LPVOID;

                               lpBufferSize : Win32.LPDWORD)

                              return Win32.DWORD;

   --  winnetwk.h:334



   function WNETENUMRESOURCEW (hEnum : Win32.Winnt.HANDLE;

                               lpcCount : Win32.LPDWORD;

                               lpBuffer : Win32.LPVOID;

                               lpBufferSize : Win32.LPDWORD)

                              return Win32.DWORD;

   --  winnetwk.h:341



   function WNETENUMRESOURCE (hEnum : Win32.Winnt.HANDLE;

                              lpcCount : Win32.LPDWORD;

                              lpBuffer : Win32.LPVOID;

                              lpBufferSize : Win32.LPDWORD)

                             return Win32.DWORD renames WNETENUMRESOURCEA;

   --  winnetwk.h:350



   function WNETCLOSEENUM (hEnum : Win32.Winnt.HANDLE)

                          return Win32.DWORD;

   --  winnetwk.h:354



   function WNETGETUSERA (lpName : Win32.LPCSTR;

                          lpUserName : Win32.LPSTR;

                          lpnLength : Win32.LPDWORD)

                         return Win32.DWORD;

   --  winnetwk.h:363



   function WNETGETUSERW (lpName : Win32.LPCWSTR;

                          lpUserName : Win32.LPWSTR;

                          lpnLength : Win32.LPDWORD)

                         return Win32.DWORD;

   --  winnetwk.h:369



   function WNETGETUSER (lpName : Win32.LPCSTR;

                         lpUserName : Win32.LPSTR;

                         lpnLength : Win32.LPDWORD)

                        return Win32.DWORD renames WNETGETUSERA;

   --  winnetwk.h:377



   function WNETCONNECTIONDIALOG (hwnd : Win32.Windef.HWND;

                                  dwType : Win32.DWORD)

                                 return Win32.DWORD;

   --  winnetwk.h:384



   function WNETDISCONNECTDIALOG (hwnd : Win32.Windef.HWND;

                                  dwType : Win32.DWORD)

                                 return Win32.DWORD;

   --  winnetwk.h:389



   function WNETGETLASTERRORA (lpError : Win32.LPDWORD;

                               lpErrorBuf : Win32.LPSTR;

                               nErrorBufSize : Win32.DWORD;

                               lpNameBuf : Win32.LPSTR;

                               nNameBufSize : Win32.DWORD)

                              return Win32.DWORD;

   --  winnetwk.h:401



   function WNETGETLASTERRORW (lpError : Win32.LPDWORD;

                               lpErrorBuf : Win32.LPWSTR;

                               nErrorBufSize : Win32.DWORD;

                               lpNameBuf : Win32.LPWSTR;

                               nNameBufSize : Win32.DWORD)

                              return Win32.DWORD;

   --  winnetwk.h:409



   function WNETGETLASTERROR (lpError : Win32.LPDWORD;

                              lpErrorBuf : Win32.LPSTR;

                              nErrorBufSize : Win32.DWORD;

                              lpNameBuf : Win32.LPSTR;

                              nNameBufSize : Win32.DWORD)

                             return Win32.DWORD renames WNETGETLASTERRORA;

   --  winnetwk.h:419



private



   pragma Convention (C_Pass_By_Copy, UNIVERSAL_NAME_INFOA);

   --  winnetwk.h:98

   pragma Convention (C_Pass_By_Copy, UNIVERSAL_NAME_INFOW);

   --  winnetwk.h:101

   pragma Convention (C_Pass_By_Copy, REMOTE_NAME_INFOA);

   --  winnetwk.h:112

   pragma Convention (C_Pass_By_Copy, REMOTE_NAME_INFOW);

   --  winnetwk.h:117

   pragma Convention (C, NETRESOURCEA);                     --  winnetwk.h:130

   pragma Convention (C, NETRESOURCEW);

   --  winnetwk.h:140



   pragma Import (Stdcall, WNETADDCONNECTIONA, "WNetAddConnectionA");

   --  winnetwk.h:177

   pragma Import (Stdcall, WNETADDCONNECTIONW, "WNetAddConnectionW");

   --  winnetwk.h:183

   pragma Import (Stdcall, WNETADDCONNECTION2A, "WNetAddConnection2A");

   --  winnetwk.h:196

   pragma Import (Stdcall, WNETADDCONNECTION2W, "WNetAddConnection2W");

   --  winnetwk.h:203

   pragma Import (Stdcall, WNETADDCONNECTION3A, "WNetAddConnection3A");

   --  winnetwk.h:216

   pragma Import (Stdcall, WNETADDCONNECTION3W, "WNetAddConnection3W");

   --  winnetwk.h:224

   pragma Import (Stdcall, WNETCANCELCONNECTIONA, "WNetCancelConnectionA");

   --  winnetwk.h:238

   pragma Import (Stdcall, WNETCANCELCONNECTIONW, "WNetCancelConnectionW");

   --  winnetwk.h:243

   pragma Import (Stdcall, WNETCANCELCONNECTION2A, "WNetCancelConnection2A");

   --  winnetwk.h:254

   pragma Import (Stdcall, WNETCANCELCONNECTION2W, "WNetCancelConnection2W");

   --  winnetwk.h:260

   pragma Import (Stdcall, WNETGETCONNECTIONA, "WNetGetConnectionA");

   --  winnetwk.h:273

   pragma Import (Stdcall, WNETGETCONNECTIONW, "WNetGetConnectionW");

   --  winnetwk.h:279

   pragma Import (Stdcall, WNETGETUNIVERSALNAMEA, "WNetGetUniversalNameA");

   --  winnetwk.h:291

   pragma Import (Stdcall, WNETGETUNIVERSALNAMEW, "WNetGetUniversalNameW");

   --  winnetwk.h:298

   pragma Import (Stdcall, WNETOPENENUMA, "WNetOpenEnumA");

   --  winnetwk.h:312

   pragma Import (Stdcall, WNETOPENENUMW, "WNetOpenEnumW");

   --  winnetwk.h:320

   pragma Import (Stdcall, WNETENUMRESOURCEA, "WNetEnumResourceA");

   --  winnetwk.h:334

   pragma Import (Stdcall, WNETENUMRESOURCEW, "WNetEnumResourceW");

   --  winnetwk.h:341

   pragma Import (Stdcall, WNETCLOSEENUM, "WNetCloseEnum");

   --  winnetwk.h:354

   pragma Import (Stdcall, WNETGETUSERA, "WNetGetUserA");

   --  winnetwk.h:363

   pragma Import (Stdcall, WNETGETUSERW, "WNetGetUserW");

   --  winnetwk.h:369

   pragma Import (Stdcall, WNETCONNECTIONDIALOG, "WNetConnectionDialog");

   --  winnetwk.h:384

   pragma Import (Stdcall, WNETDISCONNECTDIALOG, "WNetDisconnectDialog");

   --  winnetwk.h:389

   pragma Import (Stdcall, WNETGETLASTERRORA, "WNetGetLastErrorA");

   --  winnetwk.h:401

   pragma Import (Stdcall, WNETGETLASTERRORW, "WNetGetLastErrorW");

   --  winnetwk.h:409



end Win32.Winnetwk;





