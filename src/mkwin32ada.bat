@echo off
rem -----------------------------------------------
set I_INC=%1\include\win32ada
set I_LIB=%1\lib\win32ada
set I_GPR=%1\lib\gnat
set I_EXP=%1\share\examples
rem -----------------------------------------------
if .%1==. goto error
if exist %I_INC% rmdir /S /Q %I_INC%
mkdir %I_INC% 2> nul
if exist %I_LIB% rmdir /S /Q %I_LIB%
mkdir %I_LIB% 2> nul
if exist %I_EXP% rmdir /S /Q %I_EXP%
move ..\win32ada %I_EXP% 2> nul
if not .%2==.nobuild goto build
echo Copying Win32Ada to GNAT installation in %1
move *.ad? %I_INC%
if exist %I_GPR%\win32ada.gpr del /F %I_GPR%\win32ada.gpr
move win32ada.gpr %I_GPR%
goto exit
rem -----------------------------------------------
:build
echo Building Win32Ada for GNAT installation in %1
path %1\bin;%path%
mkdir lib
gnatmake -q -d -Pwin32ada_bld -gnatws
if errorlevel 1 goto error
move *.ad? %I_INC%
attrib -R %I_LIB%\*.ali
move *.ali %I_LIB%
attrib +R %I_LIB%\*.ali
move lib\*.a %I_LIB%
if exist %I_GPR%\win32ada.gpr del /F %I_GPR%\win32ada.gpr
move win32ada.gpr %I_GPR%
goto exit
rem -----------------------------------------------
:error
move *.ad? %I_INC%
if exist %I_GPR%\win32ada.gpr del /F %I_GPR%\win32ada.gpr
move win32ada.gpr %I_GPR%\gnat
echo Couldn't build Win32Ada
pause
cd c:\
exit /b 1
rem -----------------------------------------------
:exit
cd c:\
exit /b 0