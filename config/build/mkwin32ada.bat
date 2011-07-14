@echo off
rem -----------------------------------------------
set I_BIN=%1\bin
set I_INC=%1\include\win32ada
set I_LIB=%1\lib\win32ada
set I_GPR=%1\lib\gnat
set I_EXP=%1\share\examples\win32ada
rem -----------------------------------------------
if .%1==. goto error
if exist %I_INC% rmdir /S /Q %I_INC%
mkdir %I_INC% 2> nul
if exist %I_LIB% rmdir /S /Q %I_LIB%
mkdir %I_LIB% 2> nul
mkdir %I_LIB%\relocatable 2> nul
mkdir %I_LIB%\static 2> nul
mkdir %I_GPR% 2> nul
if exist %I_EXP% rmdir /S /Q %I_EXP%
move win32ada %I_EXP% > nul
if not .%2==.nobuild goto build
echo Copying Win32Ada to GNAT installation in %1
move src\*.ad? %I_INC% > nul
if exist %I_GPR%\win32ada.gpr del /F %I_GPR%\win32ada.gpr
move config\projects\win32ada.gpr %I_GPR%
goto exit
rem -----------------------------------------------
:build
echo Building Win32Ada for GNAT installation in %1
path %1\bin;%path%
for /f "tokens=1* delims=" %%a in ('gcc -dumpmachine') do set HOST=%%a
set BUILD=.build\%HOST%\release
if %HOST%==x86_64-pc-mingw32 ( set PREP_HOST="Win64" ) else ( set PREP_HOST="Win32" )
rem ---- preprocess the sources that need it
set PREP_FILES=win32-crt-math.adb win32-crt-stdio.ads win32-crt-stdlib.ads win32-crt-time.ads win32-winnt.ads
for %%f in (%PREP_FILES%) do move src\%%f src\%%f-prep > nul
for %%f in (%PREP_FILES%) do gnatprep -DHOST=%PREP_HOST% src/%%f-prep src/%%f
gprbuild -q -j2 -p -d -Pwin32ada -XLIBRARY_TYPE=static -XPRJ_BUILD=Release -XPRJ_HOST=%HOST%
if errorlevel 1 goto error
gprbuild -q -j2 -p -d -Pwin32ada -XLIBRARY_TYPE=relocatable -XPRJ_BUILD=Release -XPRJ_HOST=%HOST%
if errorlevel 1 goto error
rem ---- move sources
del src\*.*-prep > nul
move src\*.ad? %I_INC% > nul
copy %BUILD%\relocatable\lib\libwin32ada.dll %I_BIN% > nul
move %BUILD%\relocatable\lib\* %I_LIB%\relocatable > nul
move %BUILD%\static\lib\* %I_LIB%\static > nul
if exist %I_GPR%\win32ada.gpr del /F %I_GPR%\win32ada.gpr
move config\projects\win32ada.gpr %I_GPR% > nul
rmdir /s /q .build
goto exit
rem -----------------------------------------------
:error
del src\*.*-prep > nul
move src\*.ad? %I_INC% > nul
if exist %I_GPR%\win32ada.gpr del /F %I_GPR%\win32ada.gpr
move config\projects\win32ada.gpr %I_GPR% > nul
rmdir /s /q .build
echo Couldn't build Win32Ada
cd c:\
exit /b 1
rem -----------------------------------------------
:exit
cd c:\
exit /b 0
