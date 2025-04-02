@echo off
rem -- Usage:
rem --   mkwin32ada <prefix> [nobuild]
rem --
rem --   prefix  : location of the installation
rem --   nobuild : only the sources are installed
rem --
rem ----------------------------------------------- SETUP
if .%1==. goto error
set S_GPR=%1\share\gpr\win32ada.gpr
if exist %S_GPR% gprinstall --uninstall --prefix=%1 win32ada.gpr
if not .%2==.nobuild goto build
rem --
rem ----------------------------------------------- INSTALL SOURCES
gprinstall -Pwin32ada --prefix=%1 -XLIBRARY_TYPE=static -p --sources-only -a
goto exit
rem --
rem ----------------------------------------------- BUILD
:build
echo Building Win32Ada for GNAT installation in %1
path %1\bin;%path%
for /f "tokens=1* delims=" %%a in ('gcc -dumpmachine') do set TARGET=%%a
set BUILD=.build\%TARGET%\release
if %TARGET:w64=pc%==x86_64-pc-mingw32 ( set PREP_TARGET="Win64" ) else ( set PREP_TARGET="Win32" )
gprbuild -j0 -p -Pwin32ada -XLIBRARY_TYPE=static -XPRJ_BUILD=Release -XTARGET=%TARGET% -XPRJ_TARGET=%PREP_TARGET%
if errorlevel 1 goto error
gprbuild -j0 -p -Pwin32ada -XLIBRARY_TYPE=relocatable -XPRJ_BUILD=Release -XTARGET=%TARGET% -XPRJ_TARGET=%PREP_TARGET%
if errorlevel 1 goto error
rem --
rem ----------------------------------------------- INSTALL
gprinstall -Pwin32ada -p --prefix=%1 -XLIBRARY_TYPE=static -XPRJ_BUILD=Release -XTARGET=%TARGET% -XPRJ_TARGET=%PREP_TARGET%
gprinstall -Pwin32ada -f -p --prefix=%1 -XLIBRARY_TYPE=relocatable --build-name=relocatable -XPRJ_BUILD=Release -XTARGET=%TARGET% -XPRJ_TARGET=%PREP_TARGET%
goto exit
rem --
rem ----------------------------------------------- ERROR
:error
echo Couldn't build Win32Ada
cd c:\
exit /b 1
rem --
rem ----------------------------------------------- EXIT
:exit
exit /b 0
