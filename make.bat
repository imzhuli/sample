@echo off

cd build

cmake --build . --config %version%
if "%errorlevel%" NEQ "0" goto :build_failed

ctest.exe --force-new-ctest-process -C %version%
if "%errorlevel%" NEQ "0" goto :test_failed

REM cmake --install . --config %version%

goto :end

REM Error Cases:

:test_failed
echo Failed to pass test(s) !
goto :end

:build_failed
echo Failed to build target(s) !
goto :end

:end
cd ..
