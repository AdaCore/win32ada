-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-- See end of file for Copyright (c) information.

with Win32.Winbase;
with Win32.Winnt;

package Win32.Wincon is

    RIGHT_ALT_PRESSED              : constant := 16#1#;     -- wincon.h:57
    LEFT_ALT_PRESSED               : constant := 16#2#;     -- wincon.h:58
    RIGHT_CTRL_PRESSED             : constant := 16#4#;     -- wincon.h:59
    LEFT_CTRL_PRESSED              : constant := 16#8#;     -- wincon.h:60
    SHIFT_PRESSED                  : constant := 16#10#;    -- wincon.h:61
    NUMLOCK_ON                     : constant := 16#20#;    -- wincon.h:62
    SCROLLLOCK_ON                  : constant := 16#40#;    -- wincon.h:63
    CAPSLOCK_ON                    : constant := 16#80#;    -- wincon.h:64
    ENHANCED_KEY                   : constant := 16#100#;   -- wincon.h:65
    FROM_LEFT_1ST_BUTTON_PRESSED   : constant := 16#1#;     -- wincon.h:78
    RIGHTMOST_BUTTON_PRESSED       : constant := 16#2#;     -- wincon.h:79
    FROM_LEFT_2ND_BUTTON_PRESSED   : constant := 16#4#;     -- wincon.h:80
    FROM_LEFT_3RD_BUTTON_PRESSED   : constant := 16#8#;     -- wincon.h:81
    FROM_LEFT_4TH_BUTTON_PRESSED   : constant := 16#10#;    -- wincon.h:82
    MOUSE_MOVED                    : constant := 16#1#;     -- wincon.h:88
    DOUBLE_CLICK                   : constant := 16#2#;     -- wincon.h:89
    KEY_EVENT                      : constant := 16#1#;     -- wincon.h:118
    MOUSE_EVENT                    : constant := 16#2#;     -- wincon.h:119
    WINDOW_BUFFER_SIZE_EVENT       : constant := 16#4#;     -- wincon.h:120
    MENU_EVENT                     : constant := 16#8#;     -- wincon.h:121
    FOCUS_EVENT                    : constant := 16#10#;    -- wincon.h:122
    FOREGROUND_BLUE                : constant := 16#1#;     -- wincon.h:136
    FOREGROUND_GREEN               : constant := 16#2#;     -- wincon.h:137
    FOREGROUND_RED                 : constant := 16#4#;     -- wincon.h:138
    FOREGROUND_INTENSITY           : constant := 16#8#;     -- wincon.h:139
    BACKGROUND_BLUE                : constant := 16#10#;    -- wincon.h:140
    BACKGROUND_GREEN               : constant := 16#20#;    -- wincon.h:141
    BACKGROUND_RED                 : constant := 16#40#;    -- wincon.h:142
    BACKGROUND_INTENSITY           : constant := 16#80#;    -- wincon.h:143
    CTRL_C_EVENT                   : constant := 0;         -- wincon.h:169
    CTRL_BREAK_EVENT               : constant := 1;         -- wincon.h:170
    CTRL_CLOSE_EVENT               : constant := 2;         -- wincon.h:171
    CTRL_LOGOFF_EVENT              : constant := 5;         -- wincon.h:174
    CTRL_SHUTDOWN_EVENT            : constant := 6;         -- wincon.h:175
    ENABLE_PROCESSED_INPUT         : constant := 16#1#;     -- wincon.h:181
    ENABLE_LINE_INPUT              : constant := 16#2#;     -- wincon.h:182
    ENABLE_ECHO_INPUT              : constant := 16#4#;     -- wincon.h:183
    ENABLE_WINDOW_INPUT            : constant := 16#8#;     -- wincon.h:184
    ENABLE_MOUSE_INPUT             : constant := 16#10#;    -- wincon.h:185
    ENABLE_PROCESSED_OUTPUT        : constant := 16#1#;     -- wincon.h:191
    ENABLE_WRAP_AT_EOL_OUTPUT      : constant := 16#2#;     -- wincon.h:192
    CONSOLE_TEXTMODE_BUFFER        : constant := 1;         -- wincon.h:685

    type COORD;                                             -- wincon.h:29
    type SMALL_RECT;                                        -- wincon.h:34
    type union_anonymous0_t;                                -- wincon.h:49
    type KEY_EVENT_RECORD;                                  -- wincon.h:41
    type MOUSE_EVENT_RECORD;                                -- wincon.h:67
    type WINDOW_BUFFER_SIZE_RECORD;                         -- wincon.h:91
    type MENU_EVENT_RECORD;                                 -- wincon.h:95
    type FOCUS_EVENT_RECORD;                                -- wincon.h:99
    type union_anonymous1_t;                                -- wincon.h:111
    type INPUT_RECORD;                                      -- wincon.h:103
    type union_anonymous2_t;                                -- wincon.h:128
    type CHAR_INFO;                                         -- wincon.h:124
    type CONSOLE_SCREEN_BUFFER_INFO;                        -- wincon.h:146
    type CONSOLE_CURSOR_INFO;                               -- wincon.h:154

    type PCOORD is access all COORD;                        -- wincon.h:32
    type PSMALL_RECT is access all SMALL_RECT;              -- wincon.h:39
    type PKEY_EVENT_RECORD is access all KEY_EVENT_RECORD;  -- wincon.h:51
    type PMOUSE_EVENT_RECORD is access all MOUSE_EVENT_RECORD;
                                                            -- wincon.h:72
    type PWINDOW_BUFFER_SIZE_RECORD is access all WINDOW_BUFFER_SIZE_RECORD;
                                                            -- wincon.h:93
    type PMENU_EVENT_RECORD is access all MENU_EVENT_RECORD;-- wincon.h:97
    type PFOCUS_EVENT_RECORD is access all FOCUS_EVENT_RECORD;
                                                            -- wincon.h:101
    type PINPUT_RECORD is access all INPUT_RECORD;          -- wincon.h:112
    type PCHAR_INFO is access all CHAR_INFO;                -- wincon.h:130
    type PCONSOLE_SCREEN_BUFFER_INFO is access all CONSOLE_SCREEN_BUFFER_INFO;
                                                            -- wincon.h:152
    type PCONSOLE_CURSOR_INFO is access all CONSOLE_CURSOR_INFO;
                                                            -- wincon.h:157

    type COORD is                                           -- wincon.h:29
        record
            X: Win32.SHORT;                                 -- wincon.h:30
            Y: Win32.SHORT;                                 -- wincon.h:31
        end record;


    type SMALL_RECT is                                      -- wincon.h:34
        record
            Left  : Win32.SHORT;                            -- wincon.h:35
            Top   : Win32.SHORT;                            -- wincon.h:36
            Right : Win32.SHORT;                            -- wincon.h:37
            Bottom: Win32.SHORT;                            -- wincon.h:38
        end record;

    type union_anonymous0_t_kind is (                       -- wincon.h:49
        UnicodeChar_kind,
        AsciiChar_kind
    );

    type union_anonymous0_t 
        (Which: union_anonymous0_t_kind := UnicodeChar_kind) is
                                                            -- wincon.h:49
        record
            case Which is
                when UnicodeChar_kind =>
                    UnicodeChar: Win32.WCHAR;               -- wincon.h:47
                when AsciiChar_kind =>
                    AsciiChar: Win32.CHAR;                  -- wincon.h:48
            end case;
        end record;

	  pragma Convention(C_Pass_By_Copy, Union_Anonymous0_T);

    pragma Unchecked_Union(union_anonymous0_t);

    type KEY_EVENT_RECORD is                                -- wincon.h:41
        record
            bKeyDown         : Win32.BOOL;                  -- wincon.h:42
            wRepeatCount     : Win32.WORD;                  -- wincon.h:43
            wVirtualKeyCode  : Win32.WORD;                  -- wincon.h:44
            wVirtualScanCode : Win32.WORD;                  -- wincon.h:45
            uChar            : union_anonymous0_t;          -- wincon.h:49
            dwControlKeyState: Win32.DWORD;                 -- wincon.h:50
        end record;

    type MOUSE_EVENT_RECORD is                              -- wincon.h:67
        record
            dwMousePosition  : COORD;                       -- wincon.h:68
            dwButtonState    : Win32.DWORD;                 -- wincon.h:69
            dwControlKeyState: Win32.DWORD;                 -- wincon.h:70
            dwEventFlags     : Win32.DWORD;                 -- wincon.h:71
        end record;

    type WINDOW_BUFFER_SIZE_RECORD is                       -- wincon.h:91
        record
            dwSize: COORD;                                  -- wincon.h:92
        end record;

    type MENU_EVENT_RECORD is                               -- wincon.h:95
        record
            dwCommandId: Win32.UINT;                        -- wincon.h:96
        end record;

    type FOCUS_EVENT_RECORD is                              -- wincon.h:99
        record
            bSetFocus: Win32.BOOL;                          -- wincon.h:100
        end record;

    type union_anonymous1_t_kind is (                       -- wincon.h:111
        KeyEvent_kind,
        MouseEvent_kind,
        WindowBufferSizeEvent_kind,
        MenuEvent_kind,
        FocusEvent_kind
    );

    type union_anonymous1_t 
        (Which: union_anonymous1_t_kind := KeyEvent_kind) is-- wincon.h:111
        record
            case Which is
                when KeyEvent_kind =>
                    KeyEvent     : KEY_EVENT_RECORD;        -- wincon.h:106
                when MouseEvent_kind =>
                    MouseEvent   : MOUSE_EVENT_RECORD;      -- wincon.h:107
                when WindowBufferSizeEvent_kind =>
                    WindowBufferSizeEvent: WINDOW_BUFFER_SIZE_RECORD;
                                                            -- wincon.h:108
                when MenuEvent_kind =>
                    MenuEvent    : MENU_EVENT_RECORD;       -- wincon.h:109
                when FocusEvent_kind =>
                    FocusEvent   : FOCUS_EVENT_RECORD;      -- wincon.h:110
            end case;
        end record;

	  pragma Convention(C_Pass_By_Copy, Union_Anonymous1_T);

    pragma Unchecked_Union(union_anonymous1_t);

    type INPUT_RECORD is                                    -- wincon.h:103
        record
            EventType: Win32.WORD;                          -- wincon.h:104
            Event    : union_anonymous1_t;                  -- wincon.h:111
        end record;

    type union_anonymous2_t_kind is (                       -- wincon.h:128
        UnicodeChar_kind,
        AsciiChar_kind
    );

    type union_anonymous2_t 
        (Which: union_anonymous2_t_kind := UnicodeChar_kind) is
                                                            -- wincon.h:128
        record
            case Which is
                when UnicodeChar_kind =>
                    UnicodeChar: Win32.WCHAR;               -- wincon.h:126
                when AsciiChar_kind =>
                    AsciiChar: Win32.CHAR;                  -- wincon.h:127
            end case;
        end record;

	  pragma Convention(C_Pass_By_Copy, Union_Anonymous2_T);

    pragma Unchecked_Union(union_anonymous2_t);

    type CHAR_INFO is                                       -- wincon.h:124
        record
            Char      : union_anonymous2_t;                 -- wincon.h:128
            Attributes: Win32.WORD;                         -- wincon.h:129
        end record;

    type CONSOLE_SCREEN_BUFFER_INFO is                      -- wincon.h:146
        record
            dwSize             : COORD;                     -- wincon.h:147
            dwCursorPosition   : COORD;                     -- wincon.h:148
            wAttributes        : Win32.WORD;                -- wincon.h:149
            srWindow           : SMALL_RECT;                -- wincon.h:150
            dwMaximumWindowSize: COORD;                     -- wincon.h:151
        end record;

    type CONSOLE_CURSOR_INFO is                             -- wincon.h:154
        record
            dwSize  : Win32.DWORD;                          -- wincon.h:155
            bVisible: Win32.BOOL;                           -- wincon.h:156
        end record;

    type PHANDLER_ROUTINE is access function (CtrlType: Win32.DWORD) 
        return Win32.BOOL;                                  -- wincon.h:165
    pragma Convention(Stdcall, PHANDLER_ROUTINE);

    type ac_INPUT_RECORD_t is access all INPUT_RECORD; -- wincon.h:254
    type ac_CHAR_INFO_t is access all CHAR_INFO;       -- wincon.h:305
    type ac_CONSOLE_CURSOR_INFO_t is access all CONSOLE_CURSOR_INFO;
                                                            -- wincon.h:523
    type ac_SMALL_RECT_t is access all SMALL_RECT;     -- wincon.h:534
    type ac_SECURITY_ATTRIBUTES_t is access all 
             Win32.Winbase.SECURITY_ATTRIBUTES;             -- wincon.h:696

    function PeekConsoleInputA(hConsoleInput       : Win32.Winnt.HANDLE;
                               lpBuffer            : PINPUT_RECORD;
                               nLength             : Win32.DWORD;
                               lpNumberOfEventsRead: Win32.LPDWORD)
                                                     return Win32.BOOL;
                                                            -- wincon.h:201

    function PeekConsoleInput(hConsoleInput       : Win32.Winnt.HANDLE;
                              lpBuffer            : PINPUT_RECORD;
                              nLength             : Win32.DWORD;
                              lpNumberOfEventsRead: Win32.LPDWORD)
                                                    return Win32.BOOL
                                                    renames PeekConsoleInputA;
                                                            -- wincon.h:201

    function PeekConsoleInputW(hConsoleInput       : Win32.Winnt.HANDLE;
                               lpBuffer            : PINPUT_RECORD;
                               nLength             : Win32.DWORD;
                               lpNumberOfEventsRead: Win32.LPDWORD)
                                                     return Win32.BOOL;
                                                            -- wincon.h:210

    function ReadConsoleInputA(hConsoleInput       : Win32.Winnt.HANDLE;
                               lpBuffer            : PINPUT_RECORD;
                               nLength             : Win32.DWORD;
                               lpNumberOfEventsRead: Win32.LPDWORD)
                                                     return Win32.BOOL;
                                                            -- wincon.h:225

    function ReadConsoleInput(hConsoleInput       : Win32.Winnt.HANDLE;
                              lpBuffer            : PINPUT_RECORD;
                              nLength             : Win32.DWORD;
                              lpNumberOfEventsRead: Win32.LPDWORD)
                                                    return Win32.BOOL
                                                    renames ReadConsoleInputA;
                                                            -- wincon.h:225

    function ReadConsoleInputW(hConsoleInput       : Win32.Winnt.HANDLE;
                               lpBuffer            : PINPUT_RECORD;
                               nLength             : Win32.DWORD;
                               lpNumberOfEventsRead: Win32.LPDWORD)
                                                     return Win32.BOOL;
                                                            -- wincon.h:234

    function WriteConsoleInputA(hConsoleInput          : Win32.Winnt.HANDLE;
                                lpBuffer               : ac_INPUT_RECORD_t;
                                nLength                : Win32.DWORD;
                                lpNumberOfEventsWritten: Win32.LPDWORD)
                                                         return Win32.BOOL;
                                                            -- wincon.h:249

    function WriteConsoleInput(
        hConsoleInput          : Win32.Winnt.HANDLE;
        lpBuffer               : ac_INPUT_RECORD_t;
        nLength                : Win32.DWORD;
        lpNumberOfEventsWritten: Win32.LPDWORD)
                                 return Win32.BOOL
                                 renames WriteConsoleInputA;-- wincon.h:249

    function WriteConsoleInputW(hConsoleInput          : Win32.Winnt.HANDLE;
                                lpBuffer               : ac_INPUT_RECORD_t;
                                nLength                : Win32.DWORD;
                                lpNumberOfEventsWritten: Win32.LPDWORD)
                                                         return Win32.BOOL;
                                                            -- wincon.h:258

    function ReadConsoleOutputA(hConsoleOutput: Win32.Winnt.HANDLE;
                                lpBuffer      : PCHAR_INFO;
                                dwBufferSize  : COORD;
                                dwBufferCoord : COORD;
                                lpReadRegion  : PSMALL_RECT)
                                                return Win32.BOOL;
                                                            -- wincon.h:273

    function ReadConsoleOutput(hConsoleOutput: Win32.Winnt.HANDLE;
                               lpBuffer      : PCHAR_INFO;
                               dwBufferSize  : COORD;
                               dwBufferCoord : COORD;
                               lpReadRegion  : PSMALL_RECT)
                                               return Win32.BOOL
                                               renames ReadConsoleOutputA;
                                                            -- wincon.h:273

    function ReadConsoleOutputW(hConsoleOutput: Win32.Winnt.HANDLE;
                                lpBuffer      : PCHAR_INFO;
                                dwBufferSize  : COORD;
                                dwBufferCoord : COORD;
                                lpReadRegion  : PSMALL_RECT)
                                                return Win32.BOOL;
                                                            -- wincon.h:283

    function WriteConsoleOutputA(hConsoleOutput: Win32.Winnt.HANDLE;
                                 lpBuffer      : ac_CHAR_INFO_t;
                                 dwBufferSize  : COORD;
                                 dwBufferCoord : COORD;
                                 lpWriteRegion : PSMALL_RECT)
                                                 return Win32.BOOL;
                                                            -- wincon.h:299

    function WriteConsoleOutput(hConsoleOutput: Win32.Winnt.HANDLE;
                                lpBuffer      : ac_CHAR_INFO_t;
                                dwBufferSize  : COORD;
                                dwBufferCoord : COORD;
                                lpWriteRegion : PSMALL_RECT)
                                                return Win32.BOOL
                                                renames WriteConsoleOutputA;
                                                            -- wincon.h:299

    function WriteConsoleOutputW(hConsoleOutput: Win32.Winnt.HANDLE;
                                 lpBuffer      : ac_CHAR_INFO_t;
                                 dwBufferSize  : COORD;
                                 dwBufferCoord : COORD;
                                 lpWriteRegion : PSMALL_RECT)
                                                 return Win32.BOOL;
                                                            -- wincon.h:309

    function ReadConsoleOutputCharacterA(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpCharacter        : Win32.LPSTR;
        nLength            : Win32.DWORD;
        dwReadCoord        : COORD;
        lpNumberOfCharsRead: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:325

    function ReadConsoleOutputCharacter(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpCharacter        : Win32.LPSTR;
        nLength            : Win32.DWORD;
        dwReadCoord        : COORD;
        lpNumberOfCharsRead: Win32.LPDWORD)
        return Win32.BOOL
        renames ReadConsoleOutputCharacterA;                -- wincon.h:325

    function ReadConsoleOutputCharacterW(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpCharacter        : Win32.LPWSTR;
        nLength            : Win32.DWORD;
        dwReadCoord        : COORD;
        lpNumberOfCharsRead: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:335

    function ReadConsoleOutputAttribute(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpAttribute        : Win32.LPWORD;
        nLength            : Win32.DWORD;
        dwReadCoord        : COORD;
        lpNumberOfAttrsRead: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:351

    function WriteConsoleOutputCharacterA(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        lpCharacter           : Win32.LPCSTR;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfCharsWritten: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:362

    function WriteConsoleOutputCharacter(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        lpCharacter           : Win32.LPCSTR;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfCharsWritten: Win32.LPDWORD)
        return Win32.BOOL
        renames WriteConsoleOutputCharacterA;               -- wincon.h:362

    function WriteConsoleOutputCharacterW(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        lpCharacter           : Win32.LPCWSTR;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfCharsWritten: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:372

    function WriteConsoleOutputAttribute(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        lpAttribute           : Win32.PWSTR;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfAttrsWritten: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:388

    function FillConsoleOutputCharacterA(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        cCharacter            : Win32.CHAR;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfCharsWritten: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:399

    function FillConsoleOutputCharacter(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        cCharacter            : Win32.CHAR;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfCharsWritten: Win32.LPDWORD)
        return Win32.BOOL
        renames FillConsoleOutputCharacterA;                -- wincon.h:399

    function FillConsoleOutputCharacterW(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        cCharacter            : Win32.WCHAR;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfCharsWritten: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:409

    function FillConsoleOutputAttribute(
        hConsoleOutput        : Win32.Winnt.HANDLE;
        wAttribute            : Win32.WORD;
        nLength               : Win32.DWORD;
        dwWriteCoord          : COORD;
        lpNumberOfAttrsWritten: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:425

    function GetConsoleMode(
        hConsoleHandle: Win32.Winnt.HANDLE;
        lpMode        : Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:436

    function GetNumberOfConsoleInputEvents(
        hConsoleInput   : Win32.Winnt.HANDLE;
        lpNumberOfEvents: Win32.LPDWORD)
        return Win32.BOOL;                                  -- wincon.h:444

    function GetConsoleScreenBufferInfo(
        hConsoleOutput           : Win32.Winnt.HANDLE;
        lpConsoleScreenBufferInfo: PCONSOLE_SCREEN_BUFFER_INFO)
        return Win32.BOOL;                                  -- wincon.h:452

    function GetLargestConsoleWindowSize(
        hConsoleOutput: Win32.Winnt.HANDLE) return COORD;   -- wincon.h:460

    function GetConsoleCursorInfo(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpConsoleCursorInfo: PCONSOLE_CURSOR_INFO)
        return Win32.BOOL;                                  -- wincon.h:467

    function GetNumberOfConsoleMouseButtons(
        lpNumberOfMouseButtons: Win32.LPDWORD) return Win32.BOOL;
                                                            -- wincon.h:475

    function SetConsoleMode(hConsoleHandle: Win32.Winnt.HANDLE;
                            dwMode        : Win32.DWORD)
                            return Win32.BOOL;              -- wincon.h:482

    function SetConsoleActiveScreenBuffer(
        hConsoleOutput: Win32.Winnt.HANDLE) return Win32.BOOL;
                                                            -- wincon.h:490

    function FlushConsoleInputBuffer(
        hConsoleInput: Win32.Winnt.HANDLE) return Win32.BOOL;
                                                            -- wincon.h:497

    function SetConsoleScreenBufferSize(
        hConsoleOutput: Win32.Winnt.HANDLE;
        dwSize        : COORD)
        return Win32.BOOL;                                  -- wincon.h:504

    function SetConsoleCursorPosition(
        hConsoleOutput  : Win32.Winnt.HANDLE;
        dwCursorPosition: COORD)
        return Win32.BOOL;                                  -- wincon.h:512

    function SetConsoleCursorInfo(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpConsoleCursorInfo: ac_CONSOLE_CURSOR_INFO_t)
        return Win32.BOOL;                                  -- wincon.h:520

    function ScrollConsoleScreenBufferA(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpScrollRectangle  : ac_SMALL_RECT_t;
        lpClipRectangle    : ac_SMALL_RECT_t;
        dwDestinationOrigin: COORD;
        lpFill             : ac_CHAR_INFO_t)
        return Win32.BOOL;                                  -- wincon.h:528

    function ScrollConsoleScreenBuffer(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpScrollRectangle  : ac_SMALL_RECT_t;
        lpClipRectangle    : ac_SMALL_RECT_t;
        dwDestinationOrigin: COORD;
        lpFill             : ac_CHAR_INFO_t)
        return Win32.BOOL
        renames ScrollConsoleScreenBufferA;                 -- wincon.h:528

    function ScrollConsoleScreenBufferW(
        hConsoleOutput     : Win32.Winnt.HANDLE;
        lpScrollRectangle  : ac_SMALL_RECT_t;
        lpClipRectangle    : ac_SMALL_RECT_t;
        dwDestinationOrigin: COORD;
        lpFill             : ac_CHAR_INFO_t)
        return Win32.BOOL;                                  -- wincon.h:538

    function SetConsoleWindowInfo(
        hConsoleOutput : Win32.Winnt.HANDLE;
        bAbsolute      : Win32.BOOL;
        lpConsoleWindow: ac_SMALL_RECT_t)
        return Win32.BOOL;                                  -- wincon.h:554

    function SetConsoleTextAttribute(
        hConsoleOutput: Win32.Winnt.HANDLE;
        wAttributes   : Win32.WORD)
        return Win32.BOOL;                                  -- wincon.h:563

    function SetConsoleCtrlHandler(
        HandlerRoutine: PHANDLER_ROUTINE;
        Add           : Win32.BOOL)
        return Win32.BOOL;                                  -- wincon.h:571

    function GenerateConsoleCtrlEvent(
        dwCtrlEvent     : Win32.DWORD;
        dwProcessGroupId: Win32.DWORD)
        return Win32.BOOL;                                  -- wincon.h:579

    function AllocConsole return Win32.BOOL;                -- wincon.h:587
     
    function FreeConsole return Win32.BOOL;                 -- wincon.h:592

    function GetConsoleTitleA(
        lpConsoleTitle: Win32.LPSTR;
        nSize         : Win32.DWORD)
        return Win32.DWORD;                                 -- wincon.h:598
        
    function GetConsoleTitle(
        lpConsoleTitle: Win32.LPSTR;
        nSize         : Win32.DWORD)
        return Win32.DWORD
        renames GetConsoleTitleA;                           -- wincon.h:598

    function GetConsoleTitleW(
        lpConsoleTitle: Win32.LPWSTR;
        nSize         : Win32.DWORD)
        return Win32.DWORD;                                 -- wincon.h:605

    function SetConsoleTitleA(
        lpConsoleTitle: Win32.LPCSTR) return Win32.BOOL;    -- wincon.h:618

    function SetConsoleTitle(lpConsoleTitle: Win32.LPCSTR) 
        return Win32.BOOL renames SetConsoleTitleA;         -- wincon.h:618

    function SetConsoleTitleW(
        lpConsoleTitle: Win32.LPCWSTR) return Win32.BOOL;   -- wincon.h:624

    function ReadConsoleA(hConsoleInput       : Win32.Winnt.HANDLE;
                          lpBuffer            : Win32.LPVOID;
                          nNumberOfCharsToRead: Win32.DWORD;
                          lpNumberOfCharsRead : Win32.LPDWORD;
                          lpReserved          : Win32.LPVOID)
                                                return Win32.BOOL;
                                                            -- wincon.h:636

    function ReadConsole(hConsoleInput       : Win32.Winnt.HANDLE;
                         lpBuffer            : Win32.LPVOID;
                         nNumberOfCharsToRead: Win32.DWORD;
                         lpNumberOfCharsRead : Win32.LPDWORD;
                         lpReserved          : Win32.LPVOID)
                                               return Win32.BOOL
                                               renames ReadConsoleA;
                                                            -- wincon.h:636

    function ReadConsoleW(hConsoleInput       : Win32.Winnt.HANDLE;
                          lpBuffer            : Win32.LPVOID;
                          nNumberOfCharsToRead: Win32.DWORD;
                          lpNumberOfCharsRead : Win32.LPDWORD;
                          lpReserved          : Win32.LPVOID)
                                                return Win32.BOOL;
                                                            -- wincon.h:646

    function WriteConsoleA(hConsoleOutput        : Win32.Winnt.HANDLE;
                           lpBuffer              : Win32.pcvoid;
                           nNumberOfCharsToWrite : Win32.DWORD;
                           lpNumberOfCharsWritten: Win32.LPDWORD;
                           lpReserved            : Win32.LPVOID)
                                                   return Win32.BOOL;
                                                            -- wincon.h:662

    function WriteConsole(hConsoleOutput        : Win32.Winnt.HANDLE;
                          lpBuffer              : Win32.pcvoid;
                          nNumberOfCharsToWrite : Win32.DWORD;
                          lpNumberOfCharsWritten: Win32.LPDWORD;
                          lpReserved            : Win32.LPVOID)
                                                  return Win32.BOOL
                                                  renames WriteConsoleA;
                                                            -- wincon.h:662

    function WriteConsoleW(hConsoleOutput        : Win32.Winnt.HANDLE;
                           lpBuffer              : Win32.pcvoid;
                           nNumberOfCharsToWrite : Win32.DWORD;
                           lpNumberOfCharsWritten: Win32.LPDWORD;
                           lpReserved            : Win32.LPVOID)
                                                   return Win32.BOOL;
                                                            -- wincon.h:672

    function CreateConsoleScreenBuffer(
        dwDesiredAccess     : Win32.DWORD;
        dwShareMode         : Win32.DWORD;
        lpSecurityAttributes: ac_SECURITY_ATTRIBUTES_t;
        dwFlags             : Win32.DWORD;
        lpScreenBufferData  : Win32.LPVOID)
                         return Win32.Winnt.HANDLE;         -- wincon.h:690

    function GetConsoleCP return Win32.UINT;                -- wincon.h:701

    function SetConsoleCP(wCodePageID: Win32.UINT) 
        return Win32.BOOL;                                  -- wincon.h:706

    function GetConsoleOutputCP return Win32.UINT;          -- wincon.h:713

    function SetConsoleOutputCP(wCodePageID: Win32.UINT) 
        return Win32.BOOL;                                  -- wincon.h:718

private

    pragma Convention(C_Pass_By_Copy, COORD);                            -- wincon.h:29
    pragma Convention(C_Pass_By_Copy, SMALL_RECT);                       -- wincon.h:34
    pragma Convention(C_Pass_By_Copy, KEY_EVENT_RECORD);                 -- wincon.h:41
    pragma Convention(C_Pass_By_Copy, MOUSE_EVENT_RECORD);               -- wincon.h:67
    pragma Convention(C_Pass_By_Copy, WINDOW_BUFFER_SIZE_RECORD);        -- wincon.h:91
    pragma Convention(C_Pass_By_Copy, MENU_EVENT_RECORD);                -- wincon.h:95
    pragma Convention(C_Pass_By_Copy, FOCUS_EVENT_RECORD);               -- wincon.h:99
    pragma Convention(C, INPUT_RECORD);                     -- wincon.h:103
    pragma Convention(C_Pass_By_Copy, CHAR_INFO);                        -- wincon.h:124
    pragma Convention(C, CONSOLE_SCREEN_BUFFER_INFO);       -- wincon.h:146
    pragma Convention(C_Pass_By_Copy, CONSOLE_CURSOR_INFO);              -- wincon.h:154

    pragma Import(Stdcall, PeekConsoleInputA, "PeekConsoleInputA");
                                                            -- wincon.h:201
    pragma Import(Stdcall, PeekConsoleInputW, "PeekConsoleInputW");
                                                            -- wincon.h:210
    pragma Import(Stdcall, ReadConsoleInputA, "ReadConsoleInputA");
                                                            -- wincon.h:225
    pragma Import(Stdcall, ReadConsoleInputW, "ReadConsoleInputW");
                                                            -- wincon.h:234
    pragma Import(Stdcall, WriteConsoleInputA, "WriteConsoleInputA");
                                                            -- wincon.h:249
    pragma Import(Stdcall, WriteConsoleInputW, "WriteConsoleInputW");
                                                            -- wincon.h:258
    pragma Import(Stdcall, ReadConsoleOutputA, "ReadConsoleOutputA");
                                                            -- wincon.h:273
    pragma Import(Stdcall, ReadConsoleOutputW, "ReadConsoleOutputW");
                                                            -- wincon.h:283
    pragma Import(Stdcall, WriteConsoleOutputA, "WriteConsoleOutputA");
                                                            -- wincon.h:299
    pragma Import(Stdcall, WriteConsoleOutputW, "WriteConsoleOutputW");
                                                            -- wincon.h:309
    pragma Import(Stdcall, ReadConsoleOutputCharacterA, 
                     "ReadConsoleOutputCharacterA");        -- wincon.h:325
    pragma Import(Stdcall, ReadConsoleOutputCharacterW, 
                     "ReadConsoleOutputCharacterW");        -- wincon.h:335
    pragma Import(Stdcall, ReadConsoleOutputAttribute, "ReadConsoleOutputAttribute");
                                                            -- wincon.h:351
    pragma Import(Stdcall, WriteConsoleOutputCharacterA, 
                     "WriteConsoleOutputCharacterA");       -- wincon.h:362
    pragma Import(Stdcall, WriteConsoleOutputCharacterW, 
                     "WriteConsoleOutputCharacterW");       -- wincon.h:372
    pragma Import(Stdcall, WriteConsoleOutputAttribute, 
                     "WriteConsoleOutputAttribute");        -- wincon.h:388
    pragma Import(Stdcall, FillConsoleOutputCharacterA, 
                     "FillConsoleOutputCharacterA");        -- wincon.h:399
    pragma Import(Stdcall, FillConsoleOutputCharacterW, 
                     "FillConsoleOutputCharacterW");        -- wincon.h:409
    pragma Import(Stdcall, FillConsoleOutputAttribute, "FillConsoleOutputAttribute");
                                                            -- wincon.h:425
    pragma Import(Stdcall, GetConsoleMode, "GetConsoleMode");     -- wincon.h:436
    pragma Import(Stdcall, GetNumberOfConsoleInputEvents, 
                     "GetNumberOfConsoleInputEvents");      -- wincon.h:444
    pragma Import(Stdcall, GetConsoleScreenBufferInfo, "GetConsoleScreenBufferInfo");
                                                            -- wincon.h:452
    pragma Import(Stdcall, GetConsoleCursorInfo, "GetConsoleCursorInfo");
                                                            -- wincon.h:467
    pragma Import(Stdcall, GetNumberOfConsoleMouseButtons, 
                     "GetNumberOfConsoleMouseButtons");     -- wincon.h:475
    pragma Import(Stdcall, SetConsoleMode, "SetConsoleMode");     -- wincon.h:482
    pragma Import(Stdcall, SetConsoleActiveScreenBuffer, 
                     "SetConsoleActiveScreenBuffer");       -- wincon.h:490
    pragma Import(Stdcall, FlushConsoleInputBuffer, "FlushConsoleInputBuffer");
                                                            -- wincon.h:497
    pragma Import(Stdcall, SetConsoleScreenBufferSize, "SetConsoleScreenBufferSize");
                                                            -- wincon.h:504
    pragma Import(Stdcall, SetConsoleCursorPosition, "SetConsoleCursorPosition");
                                                            -- wincon.h:512
    pragma Import(Stdcall, SetConsoleCursorInfo, "SetConsoleCursorInfo");
                                                            -- wincon.h:520
    pragma Import(Stdcall, ScrollConsoleScreenBufferA, "ScrollConsoleScreenBufferA");
                                                            -- wincon.h:528
    pragma Import(Stdcall, ScrollConsoleScreenBufferW, "ScrollConsoleScreenBufferW");
                                                            -- wincon.h:538
    pragma Import(Stdcall, SetConsoleWindowInfo, "SetConsoleWindowInfo");
                                                            -- wincon.h:554
    pragma Import(Stdcall, SetConsoleTextAttribute, "SetConsoleTextAttribute");
                                                            -- wincon.h:563
    pragma Import(Stdcall, SetConsoleCtrlHandler, "SetConsoleCtrlHandler");
                                                            -- wincon.h:571
    pragma Import(Stdcall, GenerateConsoleCtrlEvent, "GenerateConsoleCtrlEvent");
                                                            -- wincon.h:579
    pragma Import(Stdcall, AllocConsole, "AllocConsole");         -- wincon.h:587
    pragma Import(Stdcall, FreeConsole, "FreeConsole");           -- wincon.h:592
    pragma Import(Stdcall, GetConsoleTitleA, "GetConsoleTitleA"); -- wincon.h:598
    pragma Import(Stdcall, GetConsoleTitleW, "GetConsoleTitleW"); -- wincon.h:605
    pragma Import(Stdcall, SetConsoleTitleA, "SetConsoleTitleA"); -- wincon.h:618
    pragma Import(Stdcall, SetConsoleTitleW, "SetConsoleTitleW"); -- wincon.h:624
    pragma Import(Stdcall, ReadConsoleA, "ReadConsoleA");         -- wincon.h:636
    pragma Import(Stdcall, ReadConsoleW, "ReadConsoleW");         -- wincon.h:646
    pragma Import(Stdcall, WriteConsoleA, "WriteConsoleA");       -- wincon.h:662
    pragma Import(Stdcall, WriteConsoleW, "WriteConsoleW");       -- wincon.h:672
    pragma Import(Stdcall, CreateConsoleScreenBuffer, "CreateConsoleScreenBuffer");
                                                            -- wincon.h:690
    pragma Import(Stdcall, GetConsoleCP, "GetConsoleCP");         -- wincon.h:701
    pragma Import(Stdcall, SetConsoleCP, "SetConsoleCP");         -- wincon.h:706
    pragma Import(Stdcall, GetConsoleOutputCP, "GetConsoleOutputCP");
                                                            -- wincon.h:713
    pragma Import(Stdcall, SetConsoleOutputCP, "SetConsoleOutputCP");
                                                            -- wincon.h:718

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

end Win32.Wincon;
