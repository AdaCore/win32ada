-- $Source$ 
-- $Revision$ $Date$ $Author$ 
-------------------------------------------------------------------------------
--
-- THIS FILE AND ANY ASSOCIATED DOCUMENTATION IS FURNISHED "AS IS" WITHOUT 
-- WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
-- TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR 
-- PURPOSE.  The user assumes the entire risk as to the accuracy and the 
-- use of this file.
--
-- Copyright (c) Intermetrics, Inc. 1995
-- Royalty-free, unlimited, worldwide, non-exclusive use, modification, 
-- reproduction and further distribution of this file is permitted.
--
-------------------------------------------------------------------------------


with Ada.Unchecked_Conversion;
with Interfaces.C;
use Interfaces.C;
with Win32.Gl;

package body Win32.Glaux is

    function AUX_WIND_IS_RGB(x: Win32.INT) return Win32.BOOL is   -- glaux.h:91
    begin
	if ((Win32.UINT(x)  and AUX_INDEX) = 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_IS_RGB;

    function AUX_WIND_IS_INDEX(x: Win32.INT) return Win32.BOOL is -- glaux.h:92
    begin
	if ((Win32.UINT(x) and  AUX_INDEX) /= 0) then 
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_IS_INDEX;

    function AUX_WIND_IS_SINGLE(x: Win32.INT) return Win32.BOOL is
							-- glaux.h:93 
    begin
	if ((Win32.UINT(x) and AUX_DOUBLE) = 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_IS_SINGLE;

    function AUX_WIND_IS_DOUBLE(x: Win32.INT) return Win32.BOOL is
							-- glaux.h:94
    begin
	if ((Win32.UINT(x) and AUX_DOUBLE) /= 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_IS_DOUBLE;

    function AUX_WIND_IS_INDIRECT(x: Win32.INT) return Win32.BOOL is 
							-- glaux.h:95
    begin
	if ((Win32.UINT(x) and AUX_INDIRECT) /= 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_IS_INDIRECT;

    function AUX_WIND_IS_DIRECT(x: Win32.INT) return Win32.BOOL is
							-- glaux.h:96 
    begin
	if ((Win32.UINT(x) and AUX_INDIRECT) = 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_IS_DIRECT;

    function AUX_WIND_HAS_ACCUM(x: Win32.INT) return Win32.BOOL is
							-- glaux.h:97 
    begin
	if ((Win32.UINT(x) and AUX_ACCUM) /= 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_HAS_ACCUM;

    function AUX_WIND_HAS_ALPHA(x: Win32.INT) return Win32.BOOL is
							-- glaux.h:98
    begin
	if ((Win32.UINT(x) and AUX_ALPHA) /= 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_HAS_ALPHA;

    function AUX_WIND_HAS_DEPTH(x: Win32.INT) return Win32.BOOL is
							-- glaux.h:99 
    begin
	if ((Win32.UINT(x) and (AUX_DEPTH or AUX_DEPTH16)) /= 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_HAS_DEPTH;

    function AUX_WIND_HAS_STENCIL(x: Win32.INT) return Win32.BOOL is 
							-- glaux.h:100
    begin
	if ((Win32.UINT(x) and AUX_STENCIL) /= 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_HAS_STENCIL;

    function AUX_WIND_USES_FIXED_332_PAL(x: Win32.WORD) return Win32.BOOL is  
							-- glaux.h:101  
    begin
	if ((Win32.UINT(x) and AUX_FIXED_332_PAL) /= 0) then
	    return Win32.TRUE;
	end if;
	return Win32.FALSE;
    end AUX_WIND_USES_FIXED_332_PAL;

    -- auxRGBMap not in Microsoft OpenTools
    -- procedure AUX_SETCOLOR(x: Win32.INT;
			   -- y: Win32.INT) is          -- glaux.h:240
	-- function To_ac_GLdouble is new Ada.Unchecked_Conversion(
	    -- Win32.Float, Win32.GL.ac_GLdouble);
    -- begin
	-- if (AUX_WIND_IS_RGB(x) = Win32.TRUE) then
		-- Win32.Gl.glColor3fv(To_ac_GLdouble(auxRGBMap(integer(y),0)));
	-- else
		-- Win32.Gl.glIndexf(Win32.Gl.Glfloat(y));
	-- end if;
    -- end AUX_SETCOLOR;

end Win32.Glaux;
