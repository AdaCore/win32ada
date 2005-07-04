@echo off
if .%1==. goto error
if exist %1\lib\gnat\win32ada rmdir /S /Q %1\lib\gnat\win32ada
mkdir %1\lib\gnat\win32ada\src 2> nul
mkdir %1\lib\gnat\win32ada\obj 2> nul
if exist %1\examples\win32ada rmdir /S /Q %1\examples\win32ada 
move ..\win32ada %1\examples 2> nul
if not .%2==.nobuild goto build
echo Copying Win32Ada to GNAT installation in %1
move *.ad? %1\lib\gnat\win32ada\src
if exist %1\lib\gnat\win32ada.gpr del /F %1\lib\gnat\win32ada.gpr
move win32ada.gpr %1\lib\gnat
goto exit
:build
echo Building Win32Ada for GNAT installation in %1
path %1\bin;%path%
gnatmake -q -d -Pwin32ada_bld -gnatws
if errorlevel 1 goto error
move *.ad? %1\lib\gnat\win32ada\src
attrib -R %1\lib\gnat\win32ada\obj\*.ali
move *.ali %1\lib\gnat\win32ada\obj
attrib +R %1\lib\gnat\win32ada\obj\*.ali
move *.o %1\lib\gnat\win32ada\obj
if exist %1\lib\gnat\win32ada.gpr del /F %1\lib\gnat\win32ada.gpr
move win32ada.gpr %1\lib\gnat
goto exit
:error
move *.ad? %1\lib\gnat\win32ada\src
if exist %1\lib\gnat\win32ada.gpr del /F %1\lib\gnat\win32ada.gpr
move win32ada.gpr %1\lib\gnat
echo Couldn't build Win32Ada
pause
cd c:\
exit /b 1
:exit
cd c:\
exit /b 0