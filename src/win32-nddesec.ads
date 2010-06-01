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

package Win32.Nddesec is

   NDDE_SHAREDB_ADD           : constant := 16#1#;
   NDDE_SHAREDB_DELETE        : constant := 16#2#;
   NDDE_SHAREDB_LIST          : constant := 16#4#;
   NDDE_SHAREDB_ADMIN         : constant := 16#e0007#;
   NDDE_SHAREDB_OPER          : constant := 16#7#;
   NDDE_SHAREDB_POWER         : constant := 16#7#;
   NDDE_SHAREDB_USER          : constant := 16#7#;
   NDDE_SHAREDB_EVERYONE      : constant := 16#4#;
   NDDE_SHARE_READ            : constant := 16#1#;
   NDDE_SHARE_WRITE           : constant := 16#2#;
   NDDE_SHARE_INITIATE_STATIC : constant := 16#4#;
   NDDE_SHARE_INITIATE_LINK   : constant := 16#8#;
   NDDE_SHARE_REQUEST         : constant := 16#10#;
   NDDE_SHARE_ADVISE          : constant := 16#20#;
   NDDE_SHARE_POKE            : constant := 16#40#;
   NDDE_SHARE_EXECUTE         : constant := 16#80#;
   NDDE_SHARE_ADD_ITEMS       : constant := 16#100#;
   NDDE_SHARE_LIST_ITEMS      : constant := 16#200#;
   NDDE_SHARE_GENERIC_READ    : constant := 16#235#;
   NDDE_SHARE_GENERIC_WRITE   : constant := 16#1004c#;
   NDDE_SHARE_GENERIC_EXECUTE : constant := 16#8c#;
   NDDE_SHARE_GENERIC_ALL     : constant := 16#f03ff#;
   NDDE_ITEM_REQUEST          : constant := 16#1#;
   NDDE_ITEM_ADVISE           : constant := 16#2#;
   NDDE_ITEM_POKE             : constant := 16#4#;
   NDDE_ITEM_GENERIC_READ     : constant := 16#3#;
   NDDE_ITEM_GENERIC_WRITE    : constant := 16#4#;
   NDDE_ITEM_GENERIC_EXECUTE  : constant := 0;
   NDDE_ITEM_GENERIC_ALL      : constant := 16#f0007#;
   NDDE_GUI_NONE              : constant := 0;
   NDDE_GUI_READ              : constant := 16#235#;
   NDDE_GUI_READ_LINK         : constant := 16#23d#;
   NDDE_GUI_CHANGE            : constant := 16#102fd#;
   NDDE_GUI_FULL_CONTROL      : constant := 16#f03ff#;

end Win32.Nddesec;
