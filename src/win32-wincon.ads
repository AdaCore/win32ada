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

with Win32.Winbase;
with Win32.Winnt;

package Win32.Wincon is

   RIGHT_ALT_PRESSED            : constant := 16#1#;
   LEFT_ALT_PRESSED             : constant := 16#2#;
   RIGHT_CTRL_PRESSED           : constant := 16#4#;
   LEFT_CTRL_PRESSED            : constant := 16#8#;
   SHIFT_PRESSED                : constant := 16#10#;
   NUMLOCK_ON                   : constant := 16#20#;
   SCROLLLOCK_ON                : constant := 16#40#;
   CAPSLOCK_ON                  : constant := 16#80#;
   ENHANCED_KEY                 : constant := 16#100#;
   FROM_LEFT_1ST_BUTTON_PRESSED : constant := 16#1#;
   RIGHTMOST_BUTTON_PRESSED     : constant := 16#2#;
   FROM_LEFT_2ND_BUTTON_PRESSED : constant := 16#4#;
   FROM_LEFT_3RD_BUTTON_PRESSED : constant := 16#8#;
   FROM_LEFT_4TH_BUTTON_PRESSED : constant := 16#10#;
   MOUSE_MOVED                  : constant := 16#1#;
   DOUBLE_CLICK                 : constant := 16#2#;
   KEY_EVENT                    : constant := 16#1#;
   MOUSE_EVENT                  : constant := 16#2#;
   WINDOW_BUFFER_SIZE_EVENT     : constant := 16#4#;
   MENU_EVENT                   : constant := 16#8#;
   FOCUS_EVENT                  : constant := 16#10#;
   FOREGROUND_BLUE              : constant := 16#1#;
   FOREGROUND_GREEN             : constant := 16#2#;
   FOREGROUND_RED               : constant := 16#4#;
   FOREGROUND_INTENSITY         : constant := 16#8#;
   BACKGROUND_BLUE              : constant := 16#10#;
   BACKGROUND_GREEN             : constant := 16#20#;
   BACKGROUND_RED               : constant := 16#40#;
   BACKGROUND_INTENSITY         : constant := 16#80#;
   CTRL_C_EVENT                 : constant := 0;
   CTRL_BREAK_EVENT             : constant := 1;
   CTRL_CLOSE_EVENT             : constant := 2;
   CTRL_LOGOFF_EVENT            : constant := 5;
   CTRL_SHUTDOWN_EVENT          : constant := 6;
   ENABLE_PROCESSED_INPUT       : constant := 16#1#;
   ENABLE_LINE_INPUT            : constant := 16#2#;
   ENABLE_ECHO_INPUT            : constant := 16#4#;
   ENABLE_WINDOW_INPUT          : constant := 16#8#;
   ENABLE_MOUSE_INPUT           : constant := 16#10#;
   ENABLE_PROCESSED_OUTPUT      : constant := 16#1#;
   ENABLE_WRAP_AT_EOL_OUTPUT    : constant := 16#2#;
   CONSOLE_TEXTMODE_BUFFER      : constant := 1;

   type COORD;
   type SMALL_RECT;
   type union_anonymous0_t;
   type KEY_EVENT_RECORD;
   type MOUSE_EVENT_RECORD;
   type WINDOW_BUFFER_SIZE_RECORD;
   type MENU_EVENT_RECORD;
   type FOCUS_EVENT_RECORD;
   type union_anonymous1_t;
   type INPUT_RECORD;
   type union_anonymous2_t;
   type CHAR_INFO;
   type CONSOLE_SCREEN_BUFFER_INFO;
   type CONSOLE_CURSOR_INFO;

   type PCOORD is access all COORD;
   type PSMALL_RECT is access all SMALL_RECT;
   type PKEY_EVENT_RECORD is access all KEY_EVENT_RECORD;
   type PMOUSE_EVENT_RECORD is access all MOUSE_EVENT_RECORD;
   type PWINDOW_BUFFER_SIZE_RECORD is access all WINDOW_BUFFER_SIZE_RECORD;
   type PMENU_EVENT_RECORD is access all MENU_EVENT_RECORD;
   type PFOCUS_EVENT_RECORD is access all FOCUS_EVENT_RECORD;
   type PINPUT_RECORD is access all INPUT_RECORD;
   type PCHAR_INFO is access all CHAR_INFO;
   type PCONSOLE_SCREEN_BUFFER_INFO is access all CONSOLE_SCREEN_BUFFER_INFO;
   type PCONSOLE_CURSOR_INFO is access all CONSOLE_CURSOR_INFO;

   type COORD is record
      X : Win32.SHORT;
      Y : Win32.SHORT;
   end record;

   type SMALL_RECT is record
      Left   : Win32.SHORT;
      Top    : Win32.SHORT;
      Right  : Win32.SHORT;
      Bottom : Win32.SHORT;
   end record;

   type union_anonymous0_t_kind is (UnicodeChar_kind, AsciiChar_kind);

   type union_anonymous0_t
     (Which : union_anonymous0_t_kind := UnicodeChar_kind)
   is
      record
         case Which is
            when UnicodeChar_kind =>
               UnicodeChar : Win32.WCHAR;
            when AsciiChar_kind =>
               AsciiChar : Win32.CHAR;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous0_t);

   pragma Unchecked_Union (union_anonymous0_t);

   type KEY_EVENT_RECORD is record
      bKeyDown          : Win32.BOOL;
      wRepeatCount      : Win32.WORD;
      wVirtualKeyCode   : Win32.WORD;
      wVirtualScanCode  : Win32.WORD;
      uChar             : union_anonymous0_t;
      dwControlKeyState : Win32.DWORD;
   end record;

   type MOUSE_EVENT_RECORD is record
      dwMousePosition   : COORD;
      dwButtonState     : Win32.DWORD;
      dwControlKeyState : Win32.DWORD;
      dwEventFlags      : Win32.DWORD;
   end record;

   type WINDOW_BUFFER_SIZE_RECORD is record
      dwSize : COORD;
   end record;

   type MENU_EVENT_RECORD is record
      dwCommandId : Win32.UINT;
   end record;

   type FOCUS_EVENT_RECORD is record
      bSetFocus : Win32.BOOL;
   end record;

   type union_anonymous1_t_kind is (
      KeyEvent_kind,
      MouseEvent_kind,
      WindowBufferSizeEvent_kind,
      MenuEvent_kind,
      FocusEvent_kind);

   type union_anonymous1_t (Which : union_anonymous1_t_kind := KeyEvent_kind)
   is
      record
         case Which is
            when KeyEvent_kind =>
               KeyEvent : KEY_EVENT_RECORD;
            when MouseEvent_kind =>
               MouseEvent : MOUSE_EVENT_RECORD;
            when WindowBufferSizeEvent_kind =>
               WindowBufferSizeEvent : WINDOW_BUFFER_SIZE_RECORD;
            when MenuEvent_kind =>
               MenuEvent : MENU_EVENT_RECORD;
            when FocusEvent_kind =>
               FocusEvent : FOCUS_EVENT_RECORD;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous1_t);

   pragma Unchecked_Union (union_anonymous1_t);

   type INPUT_RECORD is record
      EventType : Win32.WORD;
      Event     : union_anonymous1_t;
   end record;

   type union_anonymous2_t_kind is (UnicodeChar_kind, AsciiChar_kind);

   type union_anonymous2_t
     (Which : union_anonymous2_t_kind := UnicodeChar_kind)
   is
      record
         case Which is
            when UnicodeChar_kind =>
               UnicodeChar : Win32.WCHAR;
            when AsciiChar_kind =>
               AsciiChar : Win32.CHAR;
         end case;
      end record;

   pragma Convention (C_Pass_By_Copy, union_anonymous2_t);

   pragma Unchecked_Union (union_anonymous2_t);

   type CHAR_INFO is record
      Char       : union_anonymous2_t;
      Attributes : Win32.WORD;
   end record;

   type CONSOLE_SCREEN_BUFFER_INFO is record
      dwSize              : COORD;
      dwCursorPosition    : COORD;
      wAttributes         : Win32.WORD;
      srWindow            : SMALL_RECT;
      dwMaximumWindowSize : COORD;
   end record;

   type CONSOLE_CURSOR_INFO is record
      dwSize   : Win32.DWORD;
      bVisible : Win32.BOOL;
   end record;

   type PHANDLER_ROUTINE is access function
     (CtrlType : Win32.DWORD)
      return Win32.BOOL;
   pragma Convention (Stdcall, PHANDLER_ROUTINE);

   type ac_INPUT_RECORD_t is access all INPUT_RECORD;
   type ac_CHAR_INFO_t is access all CHAR_INFO;
   type ac_CONSOLE_CURSOR_INFO_t is access all CONSOLE_CURSOR_INFO;
   type ac_SMALL_RECT_t is access all SMALL_RECT;
   type ac_SECURITY_ATTRIBUTES_t is access all
     Win32.Winbase.SECURITY_ATTRIBUTES;

   function PeekConsoleInputA
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : PINPUT_RECORD;
      nLength              : Win32.DWORD;
      lpNumberOfEventsRead : Win32.LPDWORD)
      return Win32.BOOL;

   function PeekConsoleInput
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : PINPUT_RECORD;
      nLength              : Win32.DWORD;
      lpNumberOfEventsRead : Win32.LPDWORD)
      return Win32.BOOL renames PeekConsoleInputA;

   function PeekConsoleInputW
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : PINPUT_RECORD;
      nLength              : Win32.DWORD;
      lpNumberOfEventsRead : Win32.LPDWORD)
      return Win32.BOOL;

   function ReadConsoleInputA
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : PINPUT_RECORD;
      nLength              : Win32.DWORD;
      lpNumberOfEventsRead : Win32.LPDWORD)
      return Win32.BOOL;

   function ReadConsoleInput
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : PINPUT_RECORD;
      nLength              : Win32.DWORD;
      lpNumberOfEventsRead : Win32.LPDWORD)
      return Win32.BOOL renames ReadConsoleInputA;

   function ReadConsoleInputW
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : PINPUT_RECORD;
      nLength              : Win32.DWORD;
      lpNumberOfEventsRead : Win32.LPDWORD)
      return Win32.BOOL;

   function WriteConsoleInputA
     (hConsoleInput           : Win32.Winnt.HANDLE;
      lpBuffer                : ac_INPUT_RECORD_t;
      nLength                 : Win32.DWORD;
      lpNumberOfEventsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function WriteConsoleInput
     (hConsoleInput           : Win32.Winnt.HANDLE;
      lpBuffer                : ac_INPUT_RECORD_t;
      nLength                 : Win32.DWORD;
      lpNumberOfEventsWritten : Win32.LPDWORD)
      return Win32.BOOL renames WriteConsoleInputA;

   function WriteConsoleInputW
     (hConsoleInput           : Win32.Winnt.HANDLE;
      lpBuffer                : ac_INPUT_RECORD_t;
      nLength                 : Win32.DWORD;
      lpNumberOfEventsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function ReadConsoleOutputA
     (hConsoleOutput : Win32.Winnt.HANDLE;
      lpBuffer       : PCHAR_INFO;
      dwBufferSize   : COORD;
      dwBufferCoord  : COORD;
      lpReadRegion   : PSMALL_RECT)
      return Win32.BOOL;

   function ReadConsoleOutput
     (hConsoleOutput : Win32.Winnt.HANDLE;
      lpBuffer       : PCHAR_INFO;
      dwBufferSize   : COORD;
      dwBufferCoord  : COORD;
      lpReadRegion   : PSMALL_RECT)
      return Win32.BOOL renames ReadConsoleOutputA;

   function ReadConsoleOutputW
     (hConsoleOutput : Win32.Winnt.HANDLE;
      lpBuffer       : PCHAR_INFO;
      dwBufferSize   : COORD;
      dwBufferCoord  : COORD;
      lpReadRegion   : PSMALL_RECT)
      return Win32.BOOL;

   function WriteConsoleOutputA
     (hConsoleOutput : Win32.Winnt.HANDLE;
      lpBuffer       : ac_CHAR_INFO_t;
      dwBufferSize   : COORD;
      dwBufferCoord  : COORD;
      lpWriteRegion  : PSMALL_RECT)
      return Win32.BOOL;

   function WriteConsoleOutput
     (hConsoleOutput : Win32.Winnt.HANDLE;
      lpBuffer       : ac_CHAR_INFO_t;
      dwBufferSize   : COORD;
      dwBufferCoord  : COORD;
      lpWriteRegion  : PSMALL_RECT)
      return Win32.BOOL renames WriteConsoleOutputA;

   function WriteConsoleOutputW
     (hConsoleOutput : Win32.Winnt.HANDLE;
      lpBuffer       : ac_CHAR_INFO_t;
      dwBufferSize   : COORD;
      dwBufferCoord  : COORD;
      lpWriteRegion  : PSMALL_RECT)
      return Win32.BOOL;

   function ReadConsoleOutputCharacterA
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpCharacter         : Win32.LPSTR;
      nLength             : Win32.DWORD;
      dwReadCoord         : COORD;
      lpNumberOfCharsRead : Win32.LPDWORD)
      return Win32.BOOL;

   function ReadConsoleOutputCharacter
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpCharacter         : Win32.LPSTR;
      nLength             : Win32.DWORD;
      dwReadCoord         : COORD;
      lpNumberOfCharsRead : Win32.LPDWORD)
      return Win32.BOOL renames ReadConsoleOutputCharacterA;

   function ReadConsoleOutputCharacterW
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpCharacter         : Win32.LPWSTR;
      nLength             : Win32.DWORD;
      dwReadCoord         : COORD;
      lpNumberOfCharsRead : Win32.LPDWORD)
      return Win32.BOOL;

   function ReadConsoleOutputAttribute
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpAttribute         : Win32.LPWORD;
      nLength             : Win32.DWORD;
      dwReadCoord         : COORD;
      lpNumberOfAttrsRead : Win32.LPDWORD)
      return Win32.BOOL;

   function WriteConsoleOutputCharacterA
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      lpCharacter            : Win32.LPCSTR;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfCharsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function WriteConsoleOutputCharacter
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      lpCharacter            : Win32.LPCSTR;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfCharsWritten : Win32.LPDWORD)
      return Win32.BOOL renames WriteConsoleOutputCharacterA;

   function WriteConsoleOutputCharacterW
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      lpCharacter            : Win32.LPCWSTR;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfCharsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function WriteConsoleOutputAttribute
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      lpAttribute            : Win32.PWSTR;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfAttrsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function FillConsoleOutputCharacterA
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      cCharacter             : Win32.CHAR;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfCharsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function FillConsoleOutputCharacter
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      cCharacter             : Win32.CHAR;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfCharsWritten : Win32.LPDWORD)
      return Win32.BOOL renames FillConsoleOutputCharacterA;

   function FillConsoleOutputCharacterW
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      cCharacter             : Win32.WCHAR;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfCharsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function FillConsoleOutputAttribute
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      wAttribute             : Win32.WORD;
      nLength                : Win32.DWORD;
      dwWriteCoord           : COORD;
      lpNumberOfAttrsWritten : Win32.LPDWORD)
      return Win32.BOOL;

   function GetConsoleMode
     (hConsoleHandle : Win32.Winnt.HANDLE;
      lpMode         : Win32.LPDWORD)
      return Win32.BOOL;

   function GetNumberOfConsoleInputEvents
     (hConsoleInput    : Win32.Winnt.HANDLE;
      lpNumberOfEvents : Win32.LPDWORD)
      return Win32.BOOL;

   function GetConsoleScreenBufferInfo
     (hConsoleOutput            : Win32.Winnt.HANDLE;
      lpConsoleScreenBufferInfo : PCONSOLE_SCREEN_BUFFER_INFO)
      return Win32.BOOL;

   function GetLargestConsoleWindowSize
     (hConsoleOutput : Win32.Winnt.HANDLE)
      return COORD;

   function GetConsoleCursorInfo
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpConsoleCursorInfo : PCONSOLE_CURSOR_INFO)
      return Win32.BOOL;

   function GetNumberOfConsoleMouseButtons
     (lpNumberOfMouseButtons : Win32.LPDWORD)
      return Win32.BOOL;

   function SetConsoleMode
     (hConsoleHandle : Win32.Winnt.HANDLE;
      dwMode         : Win32.DWORD)
      return Win32.BOOL;

   function SetConsoleActiveScreenBuffer
     (hConsoleOutput : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function FlushConsoleInputBuffer
     (hConsoleInput : Win32.Winnt.HANDLE)
      return Win32.BOOL;

   function SetConsoleScreenBufferSize
     (hConsoleOutput : Win32.Winnt.HANDLE;
      dwSize         : COORD)
      return Win32.BOOL;

   function SetConsoleCursorPosition
     (hConsoleOutput   : Win32.Winnt.HANDLE;
      dwCursorPosition : COORD)
      return Win32.BOOL;

   function SetConsoleCursorInfo
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpConsoleCursorInfo : ac_CONSOLE_CURSOR_INFO_t)
      return Win32.BOOL;

   function ScrollConsoleScreenBufferA
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpScrollRectangle   : ac_SMALL_RECT_t;
      lpClipRectangle     : ac_SMALL_RECT_t;
      dwDestinationOrigin : COORD;
      lpFill              : ac_CHAR_INFO_t)
      return Win32.BOOL;

   function ScrollConsoleScreenBuffer
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpScrollRectangle   : ac_SMALL_RECT_t;
      lpClipRectangle     : ac_SMALL_RECT_t;
      dwDestinationOrigin : COORD;
      lpFill              : ac_CHAR_INFO_t)
      return Win32.BOOL renames ScrollConsoleScreenBufferA;

   function ScrollConsoleScreenBufferW
     (hConsoleOutput      : Win32.Winnt.HANDLE;
      lpScrollRectangle   : ac_SMALL_RECT_t;
      lpClipRectangle     : ac_SMALL_RECT_t;
      dwDestinationOrigin : COORD;
      lpFill              : ac_CHAR_INFO_t)
      return Win32.BOOL;

   function SetConsoleWindowInfo
     (hConsoleOutput  : Win32.Winnt.HANDLE;
      bAbsolute       : Win32.BOOL;
      lpConsoleWindow : ac_SMALL_RECT_t)
      return Win32.BOOL;

   function SetConsoleTextAttribute
     (hConsoleOutput : Win32.Winnt.HANDLE;
      wAttributes    : Win32.WORD)
      return Win32.BOOL;

   function SetConsoleCtrlHandler
     (HandlerRoutine : PHANDLER_ROUTINE;
      Add            : Win32.BOOL)
      return Win32.BOOL;

   function GenerateConsoleCtrlEvent
     (dwCtrlEvent      : Win32.DWORD;
      dwProcessGroupId : Win32.DWORD)
      return Win32.BOOL;

   function AllocConsole return Win32.BOOL;

   function FreeConsole return Win32.BOOL;

   function GetConsoleTitleA
     (lpConsoleTitle : Win32.LPSTR;
      nSize          : Win32.DWORD)
      return Win32.DWORD;

   function GetConsoleTitle
     (lpConsoleTitle : Win32.LPSTR;
      nSize          : Win32.DWORD)
      return Win32.DWORD renames GetConsoleTitleA;

   function GetConsoleTitleW
     (lpConsoleTitle : Win32.LPWSTR;
      nSize          : Win32.DWORD)
      return Win32.DWORD;

   function SetConsoleTitleA
     (lpConsoleTitle : Win32.LPCSTR)
      return Win32.BOOL;

   function SetConsoleTitle
     (lpConsoleTitle : Win32.LPCSTR)
      return Win32.BOOL renames SetConsoleTitleA;

   function SetConsoleTitleW
     (lpConsoleTitle : Win32.LPCWSTR)
      return Win32.BOOL;

   function ReadConsoleA
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : Win32.LPVOID;
      nNumberOfCharsToRead : Win32.DWORD;
      lpNumberOfCharsRead  : Win32.LPDWORD;
      lpReserved           : Win32.LPVOID)
      return Win32.BOOL;

   function ReadConsole
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : Win32.LPVOID;
      nNumberOfCharsToRead : Win32.DWORD;
      lpNumberOfCharsRead  : Win32.LPDWORD;
      lpReserved           : Win32.LPVOID)
      return Win32.BOOL renames ReadConsoleA;

   function ReadConsoleW
     (hConsoleInput        : Win32.Winnt.HANDLE;
      lpBuffer             : Win32.LPVOID;
      nNumberOfCharsToRead : Win32.DWORD;
      lpNumberOfCharsRead  : Win32.LPDWORD;
      lpReserved           : Win32.LPVOID)
      return Win32.BOOL;

   function WriteConsoleA
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      lpBuffer               : Win32.PCVOID;
      nNumberOfCharsToWrite  : Win32.DWORD;
      lpNumberOfCharsWritten : Win32.LPDWORD;
      lpReserved             : Win32.LPVOID)
      return Win32.BOOL;

   function WriteConsole
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      lpBuffer               : Win32.PCVOID;
      nNumberOfCharsToWrite  : Win32.DWORD;
      lpNumberOfCharsWritten : Win32.LPDWORD;
      lpReserved             : Win32.LPVOID)
      return Win32.BOOL renames WriteConsoleA;

   function WriteConsoleW
     (hConsoleOutput         : Win32.Winnt.HANDLE;
      lpBuffer               : Win32.PCVOID;
      nNumberOfCharsToWrite  : Win32.DWORD;
      lpNumberOfCharsWritten : Win32.LPDWORD;
      lpReserved             : Win32.LPVOID)
      return Win32.BOOL;

   function CreateConsoleScreenBuffer
     (dwDesiredAccess      : Win32.DWORD;
      dwShareMode          : Win32.DWORD;
      lpSecurityAttributes : ac_SECURITY_ATTRIBUTES_t;
      dwFlags              : Win32.DWORD;
      lpScreenBufferData   : Win32.LPVOID)
      return Win32.Winnt.HANDLE;

   function GetConsoleCP return Win32.UINT;

   function SetConsoleCP (wCodePageID : Win32.UINT) return Win32.BOOL;

   function GetConsoleOutputCP return Win32.UINT;

   function SetConsoleOutputCP (wCodePageID : Win32.UINT) return Win32.BOOL;

private

   pragma Convention (C_Pass_By_Copy, COORD);
   pragma Convention (C_Pass_By_Copy, SMALL_RECT);
   pragma Convention (C_Pass_By_Copy, KEY_EVENT_RECORD);
   pragma Convention (C_Pass_By_Copy, MOUSE_EVENT_RECORD);
   pragma Convention (C_Pass_By_Copy, WINDOW_BUFFER_SIZE_RECORD);
   pragma Convention (C_Pass_By_Copy, MENU_EVENT_RECORD);
   pragma Convention (C_Pass_By_Copy, FOCUS_EVENT_RECORD);
   pragma Convention (C, INPUT_RECORD);
   pragma Convention (C_Pass_By_Copy, CHAR_INFO);
   pragma Convention (C, CONSOLE_SCREEN_BUFFER_INFO);
   pragma Convention (C_Pass_By_Copy, CONSOLE_CURSOR_INFO);

   pragma Import (Stdcall, PeekConsoleInputA, "PeekConsoleInputA");
   pragma Import (Stdcall, PeekConsoleInputW, "PeekConsoleInputW");
   pragma Import (Stdcall, ReadConsoleInputA, "ReadConsoleInputA");
   pragma Import (Stdcall, ReadConsoleInputW, "ReadConsoleInputW");
   pragma Import (Stdcall, WriteConsoleInputA, "WriteConsoleInputA");
   pragma Import (Stdcall, WriteConsoleInputW, "WriteConsoleInputW");
   pragma Import (Stdcall, ReadConsoleOutputA, "ReadConsoleOutputA");
   pragma Import (Stdcall, ReadConsoleOutputW, "ReadConsoleOutputW");
   pragma Import (Stdcall, WriteConsoleOutputA, "WriteConsoleOutputA");
   pragma Import (Stdcall, WriteConsoleOutputW, "WriteConsoleOutputW");
   pragma Import
     (Stdcall,
      ReadConsoleOutputCharacterA,
      "ReadConsoleOutputCharacterA");
   pragma Import
     (Stdcall,
      ReadConsoleOutputCharacterW,
      "ReadConsoleOutputCharacterW");
   pragma Import
     (Stdcall,
      ReadConsoleOutputAttribute,
      "ReadConsoleOutputAttribute");
   pragma Import
     (Stdcall,
      WriteConsoleOutputCharacterA,
      "WriteConsoleOutputCharacterA");
   pragma Import
     (Stdcall,
      WriteConsoleOutputCharacterW,
      "WriteConsoleOutputCharacterW");
   pragma Import
     (Stdcall,
      WriteConsoleOutputAttribute,
      "WriteConsoleOutputAttribute");
   pragma Import
     (Stdcall,
      FillConsoleOutputCharacterA,
      "FillConsoleOutputCharacterA");
   pragma Import
     (Stdcall,
      FillConsoleOutputCharacterW,
      "FillConsoleOutputCharacterW");
   pragma Import
     (Stdcall,
      FillConsoleOutputAttribute,
      "FillConsoleOutputAttribute");
   pragma Import (Stdcall, GetConsoleMode, "GetConsoleMode");
   pragma Import
     (Stdcall,
      GetNumberOfConsoleInputEvents,
      "GetNumberOfConsoleInputEvents");
   pragma Import
     (Stdcall,
      GetConsoleScreenBufferInfo,
      "GetConsoleScreenBufferInfo");
   pragma Import (Stdcall, GetConsoleCursorInfo, "GetConsoleCursorInfo");
   pragma Import
     (Stdcall,
      GetNumberOfConsoleMouseButtons,
      "GetNumberOfConsoleMouseButtons");
   pragma Import (Stdcall, SetConsoleMode, "SetConsoleMode");
   pragma Import
     (Stdcall,
      SetConsoleActiveScreenBuffer,
      "SetConsoleActiveScreenBuffer");
   pragma Import
     (Stdcall,
      FlushConsoleInputBuffer,
      "FlushConsoleInputBuffer");
   pragma Import
     (Stdcall,
      SetConsoleScreenBufferSize,
      "SetConsoleScreenBufferSize");
   pragma Import
     (Stdcall,
      SetConsoleCursorPosition,
      "SetConsoleCursorPosition");
   pragma Import (Stdcall, SetConsoleCursorInfo, "SetConsoleCursorInfo");
   pragma Import
     (Stdcall,
      ScrollConsoleScreenBufferA,
      "ScrollConsoleScreenBufferA");
   pragma Import
     (Stdcall,
      ScrollConsoleScreenBufferW,
      "ScrollConsoleScreenBufferW");
   pragma Import (Stdcall, SetConsoleWindowInfo, "SetConsoleWindowInfo");
   pragma Import
     (Stdcall,
      SetConsoleTextAttribute,
      "SetConsoleTextAttribute");
   pragma Import (Stdcall, SetConsoleCtrlHandler, "SetConsoleCtrlHandler");
   pragma Import
     (Stdcall,
      GenerateConsoleCtrlEvent,
      "GenerateConsoleCtrlEvent");
   pragma Import (Stdcall, AllocConsole, "AllocConsole");
   pragma Import (Stdcall, FreeConsole, "FreeConsole");
   pragma Import (Stdcall, GetConsoleTitleA, "GetConsoleTitleA");
   pragma Import (Stdcall, GetConsoleTitleW, "GetConsoleTitleW");
   pragma Import (Stdcall, SetConsoleTitleA, "SetConsoleTitleA");
   pragma Import (Stdcall, SetConsoleTitleW, "SetConsoleTitleW");
   pragma Import (Stdcall, ReadConsoleA, "ReadConsoleA");
   pragma Import (Stdcall, ReadConsoleW, "ReadConsoleW");
   pragma Import (Stdcall, WriteConsoleA, "WriteConsoleA");
   pragma Import (Stdcall, WriteConsoleW, "WriteConsoleW");
   pragma Import
     (Stdcall,
      CreateConsoleScreenBuffer,
      "CreateConsoleScreenBuffer");
   pragma Import (Stdcall, GetConsoleCP, "GetConsoleCP");
   pragma Import (Stdcall, SetConsoleCP, "SetConsoleCP");
   pragma Import (Stdcall, GetConsoleOutputCP, "GetConsoleOutputCP");
   pragma Import (Stdcall, SetConsoleOutputCP, "SetConsoleOutputCP");

end Win32.Wincon;
