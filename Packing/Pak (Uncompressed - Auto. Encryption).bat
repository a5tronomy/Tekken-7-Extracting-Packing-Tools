@echo off

if exist "..\Required\Temporary\" rd "..\Required\Temporary\" /S /Q >nul
if not exist "..\Required\tools.config" goto confignotfound
if "%~1"=="" goto skip
setlocal enableextensions

echo.
echo [!] Any old "%~n1_P.pak" files will be overwritten.
echo Close the window to abort or press any key to continue...
echo.
pause >nul

mkdir "..\Required\Temporary\" >nul
xcopy %1 "..\Required\Temporary\%~n1" /E /I /y > nul

echo Encrypting...
"..\Required\QuickBMS.exe" -D -Q -Y -f "..\Required\encrypted.assets" "..\Required\Encrypt.bms" "..\Required\Temporary\%~n1" "..\Required\Temporary\%~n1"

echo Packing...
Set "targetLine=4"
Set "file=..\Required\tools.config"

set /A "skipTo=%targetLine%-1"
for /f "skip=%skipTo% tokens=*" %%a In (%file%) do set "path=%%a" & GoTo:packing

:packing
echo "..\Required\Temporary\%~n1\*.*" "..\..\..\*.*" >"..\Required\encryption.content"
if not exist "..\Required\Temporary\%~n1\TEKKEN 7" echo Required placeholder - You can delete this file if it wasn't deleted >"..\Required\Temporary\%~n1\TEKKEN 7"

"..\Required\UnrealPak.exe" "%path%%~n1_P.pak" -create="..\Required\encryption.content" >nul

rd "..\Required\Temporary\" /S /Q >nul
del "..\Required\encryption.content" >nul

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