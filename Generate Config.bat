@echo off
goto :check

:generate
echo.
echo This batch file is going to generate the needed configuration file.
echo Paste the path to your local TEKKEN 7 installation as seen in the examples below:
echo.
echo 	C:\Program Files (x86)\Steam\steamapps\common\TEKKEN 7
echo 	E:\Steam\steamapps\common\TEKKEN 7
echo.
set /p location= 
echo Configuration > "Required\tools.config"
echo %location%\TekkenGame\Content\Binary\tkdata.bin>> "Required\tools.config"
echo %location%\TekkenGame\Content\Paks\>> "Required\tools.config"
echo %location%\TekkenGame\Content\Paks\~mods\>> "Required\tools.config"
echo.
echo The configuration file has been generated.
echo Press any key to quit.
pause >nul
exit

:check
IF EXIST "Required\tools.config" (
echo.
CHOICE /C YN /M "The configuration file has already been generated. Do you want to update it?"
IF ERRORLEVEL 2 goto :donotupdate
IF ERRORLEVEL 1 goto :update
) ELSE (
goto :generate
)

:update
del "Required\tools.config" >nul
goto :generate

:donotupdate
echo.
echo The configuration file has not been updated.
echo Press any key to quit.
pause >nul
exit



