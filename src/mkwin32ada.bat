@echo off
mkdir %1\lib\gnat\win32ada\src
mkdir %1\lib\gnat\win32ada\obj
if not .%2==.nobuild goto build
echo Copying Win32Ada to GNAT installation in %1
move /Y *.ad? %1\lib\gnat\win32ada\src
move /Y win32ada.gpr %1\lib\gnat
goto exit
:build
echo Building Win32Ada for GNAT installation in %1
path %1\bin;%path%
gnatmake -Pwin32ada_bld -gnatws
if errorlevel 1 goto error
move /Y *.ad? %1\lib\gnat\win32ada\src
move /Y *.ali %1\lib\gnat\win32ada\obj
attrib +R %1\lib\gnat\win32ada\obj\*.ali
move /Y *.o %1\lib\gnat\win32ada\obj
move /Y win32ada.gpr %1\lib\gnat
goto exit
:error
echo Couldn't build Win32Ada
exit /b 1
:exit
exit /b 0