@echo off

if not exist "..\Required\tools.config" goto confignotfound
setlocal enableextensions
Set "targetLine=3"
Set "file=..\Required\tools.config"

set /A "skipTo=%targetLine%-1"
for /f "skip=%skipTo% tokens=*" %%a In (%file%) do set "path=%%a" & GoTo:extract

:extract

"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.assets" "..\Required\tk7.bms" "%path%pakchunk0-WindowsNoEditor.pak" "Stage Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.decryption" "..\Required\UE4.bms" "%path%pakchunk0-WindowsNoEditor.pak" "Stage Assets"

"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.assets" "..\Required\tk7.bms" "%path%pakchunk0-WindowsNoEditor_P.pak" "Stage Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.decryption" "..\Required\UE4.bms" "%path%pakchunk0-WindowsNoEditor_P.pak" "Stage Assets"

"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.assets" "..\Required\tk7.bms" "%path%pakchunk1-WindowsNoEditor.pak" "Stage Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.decryption" "..\Required\UE4.bms" "%path%pakchunk1-WindowsNoEditor.pak" "Stage Assets"

"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.assets" "..\Required\tk7.bms" "%path%pakchunk1-WindowsNoEditor_P.pak" "Stage Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.decryption" "..\Required\UE4.bms" "%path%pakchunk1-WindowsNoEditor_P.pak" "Stage Assets"

"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.assets" "..\Required\tk7.bms" "%path%pakchunk2-WindowsNoEditor.pak" "Stage Assets"
"..\Required\QuickBMS.exe" -D -Y -f "..\Required\stage.decryption" "..\Required\UE4.bms" "%path%pakchunk2-WindowsNoEditor.pak" "Stage Assets"

exit

:confignotfound
echo.
echo The config file has not been generated yet.
echo Generate "tools.config" by following the instructions given by the "Generate Config" batch file.
echo.
echo Press any key to quit.
pause >nul
exit