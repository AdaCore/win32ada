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

with Win32;
with Win32.Winnt;

package Win32.Mapi is

   subtype LHANDLE is Win32.Winnt.HANDLE;

   lhSessionNull                   : constant LHANDLE;
   MAPI_MESSAGEID_LENGTH           : constant := 64;
   MAPI_OLE                        : constant := 16#1#;
   MAPI_OLE_STATIC                 : constant := 16#2#;
   MAPI_ORIG                       : constant := 0;
   MAPI_TO                         : constant := 1;
   MAPI_CC                         : constant := 2;
   MAPI_BCC                        : constant := 3;
   MAPI_UNREAD                     : constant := 16#1#;
   MAPI_RECEIPT_REQUESTED          : constant := 16#2#;
   MAPI_SENT                       : constant := 16#4#;
   MAPI_LOGON_UI                   : constant := 16#1#;
   MAPI_NEW_SESSION                : constant := 16#2#;
   MAPI_DIALOG                     : constant := 16#8#;
   MAPI_UNREAD_ONLY                : constant := 16#20#;
   MAPI_ENVELOPE_ONLY              : constant := 16#40#;
   MAPI_PEEK                       : constant := 16#80#;
   MAPI_GUARANTEE_FIFO             : constant := 16#100#;
   MAPI_BODY_AS_FILE               : constant := 16#200#;
   MAPI_AB_NOMODIFY                : constant := 16#400#;
   MAPI_SUPPRESS_ATTACH            : constant := 16#800#;
   MAPI_FORCE_DOWNLOAD             : constant := 16#1000#;
   SUCCESS_SUCCESS                 : constant := 0;
   MAPI_USER_ABORT                 : constant := 1;
   MAPI_E_FAILURE                  : constant := 2;
   MAPI_E_LOGIN_FAILURE            : constant := 3;
   MAPI_E_DISK_FULL                : constant := 4;
   MAPI_E_INSUFFICIENT_MEMORY      : constant := 5;
   MAPI_E_ACCESS_DENIED            : constant := 6;
   MAPI_E_TOO_MANY_SESSIONS        : constant := 8;
   MAPI_E_TOO_MANY_FILES           : constant := 9;
   MAPI_E_TOO_MANY_RECIPIENTS      : constant := 10;
   MAPI_E_ATTACHMENT_NOT_FOUND     : constant := 11;
   MAPI_E_ATTACHMENT_OPEN_FAILURE  : constant := 12;
   MAPI_E_ATTACHMENT_WRITE_FAILURE : constant := 13;
   MAPI_E_UNKNOWN_RECIPIENT        : constant := 14;
   MAPI_E_BAD_RECIPTYPE            : constant := 15;
   MAPI_E_NO_MESSAGES              : constant := 16;
   MAPI_E_INVALID_MESSAGE          : constant := 17;
   MAPI_E_TEXT_TOO_LARGE           : constant := 18;
   MAPI_E_INVALID_SESSION          : constant := 19;
   MAPI_E_TYPE_NOT_SUPPORTED       : constant := 20;
   MAPI_E_AMBIGUOUS_RECIPIENT      : constant := 21;
   MAPI_E_MESSAGE_IN_USE           : constant := 22;
   MAPI_E_NETWORK_FAILURE          : constant := 23;
   MAPI_E_INVALID_EDITFIELDS       : constant := 24;
   MAPI_E_INVALID_RECIPS           : constant := 25;
   MAPI_E_NOT_SUPPORTED            : constant := 26;

   type FLAGS is new Win32.UINT;

   type LPULONG is new Win32.PULONG;
   type LPLHANDLE is access all LHANDLE;

   type MapiFileDesc;
   type MapiRecipDesc;
   type MapiMessage;

   type lpMapiFileDesc is access all MapiFileDesc;
   type lpMapiRecipDesc is access all MapiRecipDesc;
   type lpMapiMessage is access all MapiMessage;

   type MapiFileDesc is record
      ulReserved   : Win32.ULONG;
      flFlags      : Win32.ULONG;
      nPosition    : Win32.ULONG;
      lpszPathName : Win32.LPSTR;
      lpszFileName : Win32.LPSTR;
      lpFileType   : Win32.LPVOID;
   end record;

   type MapiRecipDesc is record
      ulReserved   : Win32.ULONG;
      ulRecipClass : Win32.ULONG;
      lpszName     : Win32.LPSTR;
      lpszAddress  : Win32.LPSTR;
      ulEIDSize    : Win32.ULONG;
      lpEntryID    : Win32.LPVOID;
   end record;

   type MapiMessage is record
      ulReserved         : Win32.ULONG;
      lpszSubject        : Win32.LPSTR;
      lpszNoteText       : Win32.LPSTR;
      lpszMessageType    : Win32.LPSTR;
      lpszDateReceived   : Win32.LPSTR;
      lpszConversationID : Win32.LPSTR;
      flFlags            : FLAGS;
      lpOriginator       : lpMapiRecipDesc;
      nRecipCount        : Win32.ULONG;
      lpRecips           : lpMapiRecipDesc;
      nFileCount         : Win32.ULONG;
      lpFiles            : lpMapiFileDesc;
   end record;

   function MAPILogon
     (ulUIParam    : Win32.ULONG;
      lpszName     : Win32.LPSTR;
      lpszPassword : Win32.LPSTR;
      flFlags      : FLAGS;
      ulReserved   : Win32.ULONG;
      lplhSession  : LPLHANDLE)
      return Win32.ULONG;

   function MAPILogoff
     (lhSession  : LHANDLE;
      ulUIParam  : Win32.ULONG;
      flFlags    : FLAGS;
      ulReserved : Win32.ULONG)
      return Win32.ULONG;

   function MAPISendMail
     (lhSession  : LHANDLE;
      ulUIParam  : Win32.ULONG;
      lpMessage  : lpMapiMessage;
      flFlags    : FLAGS;
      ulReserved : Win32.ULONG)
      return Win32.ULONG;

   function MAPISendDocuments
     (ulUIParam     : Win32.ULONG;
      lpszDelimChar : Win32.LPSTR;
      lpszFilePaths : Win32.LPSTR;
      lpszFileNames : Win32.LPSTR;
      ulReserved    : Win32.ULONG)
      return Win32.ULONG;

   function MAPIFindNext
     (lhSession         : LHANDLE;
      ulUIParam         : Win32.ULONG;
      lpszMessageType   : Win32.LPSTR;
      lpszSeedMessageID : Win32.LPSTR;
      flFlags           : FLAGS;
      ulReserved        : Win32.ULONG;
      lpszMessageID     : Win32.LPSTR)
      return Win32.ULONG;

   function MAPIReadMail
     (lhSession     : LHANDLE;
      ulUIParam     : Win32.ULONG;
      lpszMessageID : Win32.LPSTR;
      flFlags       : FLAGS;
      ulReserved    : Win32.ULONG;
      lppMessageOut : access lpMapiMessage)
      return Win32.ULONG;

   function MAPISaveMail
     (lhSession     : LHANDLE;
      ulUIParam     : Win32.ULONG;
      pMessage      : lpMapiMessage;
      flFlags       : FLAGS;
      ulReserved    : Win32.ULONG;
      lpszMessageID : Win32.LPSTR)
      return Win32.ULONG;

   function MAPIDeleteMail
     (lhSession     : LHANDLE;
      ulUIParam     : Win32.ULONG;
      lpszMessageID : Win32.LPSTR;
      flFlags       : FLAGS;
      ulReserved    : Win32.ULONG)
      return Win32.ULONG;

   function MAPIFreeBuffer (pv : Win32.LPVOID) return Win32.ULONG;

   function MAPIAddress
     (lhSession    : LHANDLE;
      ulUIParam    : Win32.ULONG;
      plszCaption  : Win32.LPSTR;
      nEditFields  : Win32.ULONG;
      lpszLabels   : Win32.LPSTR;
      nRecips      : Win32.ULONG;
      lpRecips     : lpMapiRecipDesc;
      flFlags      : FLAGS;
      ulReserved   : Win32.ULONG;
      lpnNewRecips : LPULONG;
      lppNewRecips : access lpMapiRecipDesc)
      return Win32.ULONG;

   function MAPIDetails
     (lhSession  : LHANDLE;
      ulUIParam  : Win32.ULONG;
      lpRecip    : lpMapiRecipDesc;
      flFlags    : FLAGS;
      ulReserved : Win32.ULONG)
      return Win32.ULONG;

   function MAPIResolveName
     (lhSession  : LHANDLE;
      ulUIParam  : Win32.ULONG;
      lpszName   : Win32.LPSTR;
      flFlags    : FLAGS;
      ulReserved : Win32.ULONG;
      lppRecip   : access lpMapiRecipDesc)
      return Win32.ULONG;

private

   pragma Convention (C, MapiFileDesc);
   pragma Convention (C, MapiRecipDesc);
   pragma Convention (C, MapiMessage);

   lhSessionNull : constant LHANDLE := System.Null_Address;

   pragma Import (Stdcall, MAPILogon, "MAPILogon");
   pragma Import (Stdcall, MAPILogoff, "MAPILogoff");
   pragma Import (Stdcall, MAPISendMail, "MAPISendMail");
   pragma Import (Stdcall, MAPISendDocuments, "MAPISendDocuments");
   pragma Import (Stdcall, MAPIFindNext, "MAPIFindNext");
   pragma Import (Stdcall, MAPIReadMail, "MAPIReadMail");
   pragma Import (Stdcall, MAPISaveMail, "MAPISaveMail");
   pragma Import (Stdcall, MAPIDeleteMail, "MAPIDeleteMail");
   pragma Import (Stdcall, MAPIFreeBuffer, "MAPIFreeBuffer");
   pragma Import (Stdcall, MAPIAddress, "MAPIAddress");
   pragma Import (Stdcall, MAPIDetails, "MAPIDetails");
   pragma Import (Stdcall, MAPIResolveName, "MAPIResolveName");

end Win32.Mapi;
