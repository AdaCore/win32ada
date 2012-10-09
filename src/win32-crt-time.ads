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
--  Copyright (C) 2000-2012, AdaCore
--
-------------------------------------------------------------------------------

with Win32.crt.Types;

package Win32.crt.Time is

   CLOCKS_PER_SEC : constant := 1000;

   type clock_t is new Win32.LONG;

   type tm;

   type ac_time_t is access constant Win32.crt.Types.time_t;
   type ac_tm_t is access constant tm;
   type a_tm_t is access all tm;

   type tm is record
      tm_sec   : Win32.INT;
      tm_min   : Win32.INT;
      tm_hour  : Win32.INT;
      tm_mday  : Win32.INT;
      tm_mon   : Win32.INT;
      tm_year  : Win32.INT;
      tm_wday  : Win32.INT;
      tm_yday  : Win32.INT;
      tm_isdst : Win32.INT;
   end record;

   type TZ_Array is array (0 .. 1) of Win32.PSTR;

   type AI is access Win32.INT;
   type AL is access Win32.LONG;
   type ATZ is access all TZ_Array;

#if TARGET = "Win32" then
   function daylight_Addr return AI;
   pragma Import (C, daylight_Addr, "__p__daylight");

   function timezone_Addr return AL;
   pragma Import (C, timezone_Addr, "__p__timezone");

   function tzname_Addr return ATZ;
   pragma Import (C, tzname_Addr, "__p__tzname");
#else
   daylight_Addr : constant AI;
   pragma Import (C, daylight_Addr, "__imp__daylight");

   timezone_Addr : constant AL;
   pragma Import (C, timezone_Addr, "__imp__timezone");

   tzname_Addr : constant ATZ;
   pragma Import (C, tzname_Addr, "__imp__tzname");
#end if;

   daylight : Win32.INT renames daylight_Addr.all;

   timezone : Win32.LONG renames timezone_Addr.all;

   tzname : TZ_Array renames tzname_Addr.all;

   function asctime (timeptr : ac_tm_t) return Win32.PSTR;

   function ctime (timer : ac_time_t) return Win32.PSTR;

   function clock return clock_t;

   function difftime
     (timer1 : Win32.crt.Types.time_t;
      timer0 : Win32.crt.Types.time_t)
      return Win32.DOUBLE;

   function gmtime (timer : ac_time_t) return a_tm_t;

   function localtime (timer : ac_time_t) return a_tm_t;

   function mktime (timeptr : access tm) return Win32.crt.Types.time_t;

   function strftime
     (string1 : Win32.PSTR;
      maxsize : Win32.Size_T;
      format  : Win32.PCSTR;
      timeptr : ac_tm_t)
      return Win32.Size_T;

   function strdate (datestr : Win32.PSTR) return Win32.PSTR;

   function strtime (timestr : Win32.PSTR) return Win32.PSTR;

   function time
     (timer : access Win32.crt.Types.time_t)
      return Win32.crt.Types.time_t;

   procedure tzset;

   function getsystime (p1 : access tm) return Win32.UINT;

   function setsystime (p1 : access tm; p2 : Win32.UINT) return Win32.UINT;

private

   pragma Convention (C, tm);

   pragma Import (C, asctime, "asctime");
   pragma Import (C, ctime, "ctime");
   pragma Import (C, clock, "clock");
   pragma Import (C, difftime, "difftime");
   pragma Import (C, gmtime, "gmtime");
   pragma Import (C, localtime, "localtime");
   pragma Import (C, mktime, "mktime");
   pragma Import (C, strftime, "strftime");
   pragma Import (C, strdate, "_strdate");
   pragma Import (C, strtime, "_strtime");
   pragma Import (C, time, "time");
   pragma Import (C, tzset, "_tzset");
   pragma Import (C, getsystime, "_getsystime");
   pragma Import (C, setsystime, "_setsystime");

end Win32.crt.Time;
