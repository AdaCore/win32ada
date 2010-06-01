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

with Win32.Winnt;

package Win32.Sddl is

   function ConvertStringSidToSid
     (StringId : Win32.Winnt.LPCTSTR;
      Sid      : access Win32.Winnt.PSID)
      return Win32.BOOL;

   function ConvertSidToStringSid
     (Sid      : Win32.Winnt.PSID;
      StringId : access Win32.Winnt.LPTSTR)
      return Win32.BOOL;

private

   pragma Import (Stdcall, ConvertStringSidToSid, "ConvertStringSidToSidA");
   pragma Import (Stdcall, ConvertSidToStringSid, "ConvertSidToStringSidA");

end Win32.Sddl;
