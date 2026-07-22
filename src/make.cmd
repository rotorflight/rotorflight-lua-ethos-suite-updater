@echo off
setlocal
cd /d %~dp0

if not defined UPDATER_VERSION set UPDATER_VERSION=1.0.11

echo [1/6] Checking for pyinstaller...
pyinstaller --version >nul 2>&1
if errorlevel 1 (
    echo PyInstaller not found. Installing...
    pip install pyinstaller || goto :error
)

echo [2/6] Generating version info (%UPDATER_VERSION%)...
python gen_version_info.py || goto :error

echo [3/6] Compiling update_radio_gui.py to standalone EXE...
python -m PyInstaller --onefile --noupx update_radio_gui.py --name rotorflight-lua-ethos-suite-updater --windowed --version-file version_info.txt --icon icon.ico || goto :error

echo [4/6] Moving rotorflight-lua-ethos-suite-updater.exe into parent folder...
if exist ..\rotorflight-lua-ethos-suite-updater.exe (
    del ..\rotorflight-lua-ethos-suite-updater.exe
)
move /Y dist\rotorflight-lua-ethos-suite-updater.exe ..\rotorflight-lua-ethos-suite-updater.exe >nul

echo [5/6] Cleaning up build tree...
rd /s /q build
rd /s /q dist
del /q rotorflight-lua-ethos-suite-updater.spec

echo [6/6] ✅ Build complete. rotorflight-lua-ethos-suite-updater.exe is ready at: ..\rotorflight-lua-ethos-suite-updater.exe
goto :eof

:error
echo ❌ Build failed.
exit /b 1
