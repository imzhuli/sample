@echo off
setlocal enabledelayedexpansion

set home=!cd!
cd "assets\shaders"
echo !cd!
for /D %%d in (*) do (
	call :make_spv %%d
)
goto:end

:make_spv
cd %1
for %%f in (*.spv) do (
	del /Q "%%f"
)

for %%f in (*) do (
	glslangValidator -V "%%f"
)
cd ..
goto:eof

:end
