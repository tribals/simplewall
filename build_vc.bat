@echo off
@setlocal enableextensions
rem @cd /d "%~dp0\..\"

if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
	call "%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" amd64_arm64
	goto start
)

echo VS 2022 (Build Tools) not found...

goto end

:start

msbuild simplewall.sln -property:Configuration=Release -property:Platform=x64 -verbosity:normal
if %ERRORLEVEL% neq 0 goto end

@REM msbuild simplewall.sln -property:Configuration=Release -property:Platform=ARM64 -verbosity:normal
@REM if %ERRORLEVEL% neq 0 goto end

:end

echo done...

pause
