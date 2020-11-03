@echo off

set version=Debug
if /i "%1" == "release" set version=Release

cd build
if "%errorlevel%" NEQ "0" goto :cmake_failed

cmake --install . --config %version%
