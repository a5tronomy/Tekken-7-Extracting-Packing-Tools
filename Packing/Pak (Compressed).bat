@echo off

if not exist "..\Required\tools.config" goto confignotfound
if "%~1"=="" goto skip
setlocal enableextensions
Set "targetLine=4"
Set "file=..\Required\tools.config"

set /A "skipTo=%targetLine%-1"
for /f "skip=%skipTo% tokens=*" %%a In (%file%) do set "path=%%a" & GoTo:packing

:packing
echo.
echo [!] Any old '%~n1_P.pak' files will be overwritten.
echo Close the window to abort or press any key to continue...
pause >nul
echo.

echo Compressing and packing...
@echo "%~1\*.*" "..\..\..\*.*" >"..\Required\pak.content"
if not exist "..\Packing\%~n1\TEKKEN 7" echo Required placeholder - You can delete this file if it wasn't deleted >"..\Packing\%~n1\TEKKEN 7"

"..\Required\UnrealPak.exe" "%path%%~n1_P.pak" -create="..\Required\pak.content" -compress >nul
del "..\Required\pak.content" >nul
del "..\Packing\%~n1\TEKKEN 7" >nul

echo.
echo Done.
echo.
echo Listing contents of "%~n1_P.pak"...
echo.
"..\Required\u4pak.exe" list "%path%%~n1_P.pak"

echo.
echo '%~n1_P.pak' was generated and placed in "%path%".
echo.
echo Press any key to quit.
pause >nul
exit

:confignotfound
echo.
echo The config file has not been generated yet.
echo Generate "tools.config" by following the instructions given by the "Generate Config" batch file.
echo.
echo Press any key to quit.
pause >nul
exit

:skip
exit