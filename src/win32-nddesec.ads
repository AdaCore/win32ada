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



package Win32.Nddesec is



   NDDE_SHAREDB_ADD           : constant := 16#1#;     --  nddesec.h:6

   NDDE_SHAREDB_DELETE        : constant := 16#2#;     --  nddesec.h:7

   NDDE_SHAREDB_LIST          : constant := 16#4#;     --  nddesec.h:8

   NDDE_SHAREDB_ADMIN         : constant := 16#e0007#; --  nddesec.h:10

   NDDE_SHAREDB_OPER          : constant := 16#7#;     --  nddesec.h:17

   NDDE_SHAREDB_POWER         : constant := 16#7#;     --  nddesec.h:21

   NDDE_SHAREDB_USER          : constant := 16#7#;     --  nddesec.h:25

   NDDE_SHAREDB_EVERYONE      : constant := 16#4#;     --  nddesec.h:29

   NDDE_SHARE_READ            : constant := 16#1#;     --  nddesec.h:31

   NDDE_SHARE_WRITE           : constant := 16#2#;     --  nddesec.h:32

   NDDE_SHARE_INITIATE_STATIC : constant := 16#4#;     --  nddesec.h:33

   NDDE_SHARE_INITIATE_LINK   : constant := 16#8#;     --  nddesec.h:34

   NDDE_SHARE_REQUEST         : constant := 16#10#;    --  nddesec.h:35

   NDDE_SHARE_ADVISE          : constant := 16#20#;    --  nddesec.h:36

   NDDE_SHARE_POKE            : constant := 16#40#;    --  nddesec.h:37

   NDDE_SHARE_EXECUTE         : constant := 16#80#;    --  nddesec.h:38

   NDDE_SHARE_ADD_ITEMS       : constant := 16#100#;   --  nddesec.h:39

   NDDE_SHARE_LIST_ITEMS      : constant := 16#200#;   --  nddesec.h:40

   NDDE_SHARE_GENERIC_READ    : constant := 16#235#;   --  nddesec.h:42

   NDDE_SHARE_GENERIC_WRITE   : constant := 16#1004c#; --  nddesec.h:48

   NDDE_SHARE_GENERIC_EXECUTE : constant := 16#8c#;    --  nddesec.h:53

   NDDE_SHARE_GENERIC_ALL     : constant := 16#f03ff#; --  nddesec.h:57

   NDDE_ITEM_REQUEST          : constant := 16#1#;     --  nddesec.h:73

   NDDE_ITEM_ADVISE           : constant := 16#2#;     --  nddesec.h:74

   NDDE_ITEM_POKE             : constant := 16#4#;     --  nddesec.h:75

   NDDE_ITEM_GENERIC_READ     : constant := 16#3#;     --  nddesec.h:77

   NDDE_ITEM_GENERIC_WRITE    : constant := 16#4#;     --  nddesec.h:78

   NDDE_ITEM_GENERIC_EXECUTE  : constant := 0;         --  nddesec.h:79

   NDDE_ITEM_GENERIC_ALL      : constant := 16#f0007#; --  nddesec.h:80

   NDDE_GUI_NONE              : constant := 0;         --  nddesec.h:88

   NDDE_GUI_READ              : constant := 16#235#;   --  nddesec.h:90

   NDDE_GUI_READ_LINK         : constant := 16#23d#;   --  nddesec.h:92

   NDDE_GUI_CHANGE            : constant := 16#102fd#; --  nddesec.h:95

   NDDE_GUI_FULL_CONTROL      : constant := 16#f03ff#; --  nddesec.h:99



end Win32.Nddesec;





