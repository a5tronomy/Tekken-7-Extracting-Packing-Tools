@echo off

@if "%~1"=="" goto skip
@setlocal enableextensions
if not exist "unpak" mkdir "unpak"

echo.
echo [!] Any old '%~n1' mod folders will be overwritten.
echo Close the window to abort or press any key to continue...
pause >nul
echo.

echo Unpacking '%~n1.pak'...
if exist "unpak\%~n1\" rd "unpak\%~n1\" /s /q >nul
mkdir "unpak\%~n1\TekkenGame\Content\" >nul
"..\Required\UnrealPak.exe" %1 -extract "..\Packing\unpak\%~n1" >nul
del "..\Packing\unpak\%~n1\TEKKEN 7" >nul
"..\Required\QuickBMS.exe" -D -Q -Y -f "..\Required\encrypted.assets" "..\Required\Decrypt.bms" unpak\%~n1 unpak\%~n1

echo.
echo '%~n1.pak' was unpacked and placed in "unpak".
echo.
echo Press any key to quit.
pause >nul
exit

:skip
exit