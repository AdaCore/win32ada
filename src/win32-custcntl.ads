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



package Win32.Custcntl is



   CCHCCCLASS : constant := 32;                            --  custcntl.h:20

   CCHCCDESC : constant := 32;                            --  custcntl.h:21

   CCHCCTEXT : constant := 256;                           --  custcntl.h:22

   CCF_NOTEXT : constant := 16#1#;                         --  custcntl.h:123



   type CCSTYLEA;                                          --  custcntl.h:30

   type CCSTYLEW;                                          --  custcntl.h:38

   type CCSTYLEFLAGA;                                      --  custcntl.h:97

   type CCSTYLEFLAGW;                                      --  custcntl.h:103

   type CCINFOA;                                           --  custcntl.h:131

   type CCINFOW;                                           --  custcntl.h:149



   type LPCCSTYLEA is access all CCSTYLEA;                 --  custcntl.h:36

   subtype LPCCSTYLE is LPCCSTYLEA;                        --  custcntl.h:51

   type LPCCSTYLEW is access all CCSTYLEW;                 --  custcntl.h:44

   type LPCCSTYLEFLAGA is access all CCSTYLEFLAGA;         --  custcntl.h:101

   subtype LPCCSTYLEFLAG is LPCCSTYLEFLAGA;                --  custcntl.h:114

   type LPCCSTYLEFLAGW is access all CCSTYLEFLAGW;         --  custcntl.h:107

   type LPCCINFOA is access all CCINFOA;                   --  custcntl.h:147

   subtype LPCCINFO is LPCCINFOA;                          --  custcntl.h:172

   type LPCCINFOW is access all CCINFOW;                   --  custcntl.h:165



   type CCSTYLEA is                                        --  custcntl.h:30

      record

         flStyle : Win32.DWORD;                        --  custcntl.h:31

         flExtStyle : Win32.DWORD;                        --  custcntl.h:32

         szText : Win32.CHAR_Array (0 .. CCHCCTEXT - 1);   --  custcntl.h:33

         lgid : Win32.Winnt.LANGID;                 --  custcntl.h:34

         wReserved1 : Win32.WORD;                         --  custcntl.h:35

      end record;



   subtype CCSTYLE is CCSTYLEA;                            --  custcntl.h:50



   type CCSTYLEW is                                        --  custcntl.h:38

      record

         flStyle : Win32.DWORD;                        --  custcntl.h:39

         flExtStyle : Win32.DWORD;                        --  custcntl.h:40

         szText : Win32.WCHAR_Array (0 .. CCHCCTEXT - 1);  --  custcntl.h:41

         lgid : Win32.Winnt.LANGID;                 --  custcntl.h:42

         wReserved1 : Win32.WORD;                         --  custcntl.h:43

      end record;



   type LPFNCCSTYLEA is access function

     (hwndParent : Win32.Windef.HWND;

      pccs : LPCCSTYLEA)

     return Win32.BOOL;                           --  custcntl.h:62

   pragma Convention (Stdcall, LPFNCCSTYLEA);

   subtype LPFNCCSTYLE is LPFNCCSTYLEA;                    --  custcntl.h:68

   type LPFNCCSTYLEW is access function

     (hwndParent : Win32.Windef.HWND;

      pccs : LPCCSTYLEW)

     return Win32.BOOL;                           --  custcntl.h:63

   pragma Convention (Stdcall, LPFNCCSTYLEW);

   type LPFNCCSIZETOTEXTA is access function

     (flStyle : Win32.DWORD;

      flExtStyle : Win32.DWORD;

      hfont : Win32.Windef.HFONT;

      pszText : Win32.LPSTR)

     return Win32.INT;                            --  custcntl.h:80

   pragma Convention (Stdcall, LPFNCCSIZETOTEXTA);

   subtype LPFNCCSIZETOTEXT is LPFNCCSIZETOTEXTA;          --  custcntl.h:88

   type LPFNCCSIZETOTEXTW is access function

     (flStyle : Win32.DWORD;

      flExtStyle : Win32.DWORD;

      hfont : Win32.Windef.HFONT;

      pszText : Win32.LPWSTR)

     return Win32.INT;                            --  custcntl.h:82

   pragma Convention (Stdcall, LPFNCCSIZETOTEXTW);



   type CCSTYLEFLAGA is                                    --  custcntl.h:97

      record

         flStyle : Win32.DWORD;                       --  custcntl.h:98

         flStyleMask : Win32.DWORD;                       --  custcntl.h:99

         pszStyle : Win32.LPSTR;                       --  custcntl.h:100

      end record;



   subtype CCSTYLEFLAG is CCSTYLEFLAGA;                    --  custcntl.h:113



   type CCSTYLEFLAGW is                                    --  custcntl.h:103

      record

         flStyle : Win32.DWORD;                       --  custcntl.h:104

         flStyleMask : Win32.DWORD;                       --  custcntl.h:105

         pszStyle : Win32.LPWSTR;                      --  custcntl.h:106

      end record;



   type CCINFOA is                                         --  custcntl.h:131

      record

         szClass : Win32.CHAR_Array (0 .. 31);     --  custcntl.h:132

         flOptions : Win32.DWORD;                 --  custcntl.h:133

         szDesc : Win32.CHAR_Array (0 .. 31);     --  custcntl.h:134

         cxDefault : Win32.UINT;                  --  custcntl.h:135

         cyDefault : Win32.UINT;                  --  custcntl.h:136

         flStyleDefault : Win32.DWORD;                 --  custcntl.h:137

         flExtStyleDefault : Win32.DWORD;                 --  custcntl.h:138

         flCtrlTypeMask : Win32.DWORD;                 --  custcntl.h:139

         szTextDefault : Win32.CHAR_Array (0 .. CCHCCTEXT - 1);

         --  custcntl.h:140

         cStyleFlags : Win32.INT;                   --  custcntl.h:141

         aStyleFlags : LPCCSTYLEFLAGA;              --  custcntl.h:142

         lpfnStyle : LPFNCCSTYLEA;                --  custcntl.h:143

         lpfnSizeToText : LPFNCCSIZETOTEXTA;           --  custcntl.h:144

         dwReserved1 : Win32.DWORD;                 --  custcntl.h:145

         dwReserved2 : Win32.DWORD;                 --  custcntl.h:146

      end record;



   subtype CCINFO is CCINFOA;                              --  custcntl.h:171



   type CCINFOW is                                         --  custcntl.h:149

      record

         szClass : Win32.WCHAR_Array (0 .. CCHCCCLASS - 1);

         --  custcntl.h:150

         flOptions : Win32.DWORD;                 --  custcntl.h:151

         szDesc : Win32.WCHAR_Array (0 .. CCHCCDESC - 1);

         --  custcntl.h:152

         cxDefault : Win32.UINT;                  --  custcntl.h:153

         cyDefault : Win32.UINT;                  --  custcntl.h:154

         flStyleDefault : Win32.DWORD;                 --  custcntl.h:155

         flExtStyleDefault : Win32.DWORD;                 --  custcntl.h:156

         flCtrlTypeMask : Win32.DWORD;                 --  custcntl.h:157

         cStyleFlags : Win32.INT;                   --  custcntl.h:158

         aStyleFlags : LPCCSTYLEFLAGW;              --  custcntl.h:159

         szTextDefault : Win32.WCHAR_Array (0 .. CCHCCTEXT - 1);

         --  custcntl.h:160

         lpfnStyle : LPFNCCSTYLEW;                --  custcntl.h:161

         lpfnSizeToText : LPFNCCSIZETOTEXTW;           --  custcntl.h:162

         dwReserved1 : Win32.DWORD;                 --  custcntl.h:163

         dwReserved2 : Win32.DWORD;                 --  custcntl.h:164

      end record;



   type LPFNCCINFOA is access function

     (acci : LPCCINFOA)

     return Win32.UINT;                           --  custcntl.h:194

   pragma Convention (Stdcall, LPFNCCINFOA);



   subtype LPFNCCINFO is LPFNCCINFOA;                      --  custcntl.h:200



   type LPFNCCINFOW is access function

     (acci : LPCCINFOW)

     return Win32.UINT;                           --  custcntl.h:195

   pragma Convention (Stdcall, LPFNCCINFOW);



private



   pragma Convention (C, CCSTYLEA);                         --  custcntl.h:30

   pragma Convention (C, CCSTYLEW);                         --  custcntl.h:38

   pragma Convention (C_Pass_By_Copy, CCSTYLEFLAGA);        --  custcntl.h:97

   pragma Convention (C_Pass_By_Copy, CCSTYLEFLAGW);        --  custcntl.h:103

   pragma Convention (C, CCINFOA);                          --  custcntl.h:131

   pragma Convention (C, CCINFOW);                          --  custcntl.h:149



end Win32.Custcntl;





