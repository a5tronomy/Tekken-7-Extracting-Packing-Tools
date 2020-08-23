@echo off

if not exist "..\Required\tools.config" goto confignotfound
setlocal enableextensions
Set "targetLine=3"
Set "file=..\Required\tools.config"

set /A "skipTo=%targetLine%-1"
for /f "skip=%skipTo% tokens=*" %%a In (%file%) do set "path=%%a" & GoTo:extract

:extract

"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "%path%pakchunk0-WindowsNoEditor.pak" "UI Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "%path%pakchunk0-WindowsNoEditor_P.pak" "UI Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "%path%pakchunk1-WindowsNoEditor.pak" "UI Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "%path%pakchunk1-WindowsNoEditor_P.pak" "UI Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "%path%pakchunk2-WindowsNoEditor.pak" "UI Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "..\Required\ps4-1.data" "UI Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "..\Required\ps4-2.data" "UI Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\userinterface.assets" "..\Required\tk7.bms" "..\Required\ps4-3.data" "UI Assets"

exit

:confignotfound
echo.
echo The config file has not been generated yet.
echo Generate "tools.config" by following the instructions given by the "Generate Config" batch file.
echo.
echo Press any key to quit.
pause >nul
exit