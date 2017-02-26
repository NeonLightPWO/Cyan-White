@echo off
setlocal EnableExtensions EnableDelayedExpansion
:int_variables
Title CyanDOS - Version 0.0.2
rem ; 0.0.2
SET CyanOSVersion=0020
rem ; Color Texture - Black Background over Light Aqua (Cyan)
SET CRM=0B
rem ; Latest - Variable for CommandEngine
SET latest=0020
rem ; Delimiter
SET delim=::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:int_setup
ECHO %delim%
ECHO.
rem ; Version Checker
IF %CyanOSVersion% EQU 0010 ( ECHO CyanDOS Version 0.0.1 )
IF %CyanOSVersion% EQU 0020 ( ECHO CyanDOS Version 0.0.2 )
ECHO.
ECHO Bugs may still appear as we are still in pre-alpha, Report bugs to ShadesOfBlack [https://github.com/ShadesOfBlack]
ECHO.
ECHO Welcome to CyanDOS - Press Any Key To Boot Into CyanDOS
ECHO %delim%
PAUSE>NUL
CLS
GOTO out_commands

:out_commands
IF %CyanOSVersion% EQU 0010 ( cmd /k CommandEngine.bat -ver 0010 )
IF %CyanOSVersion% EQU 0020 ( cmd /k CommandEngine.bat -ver 0020 )
rem ; Presume Latest
cmd /k CommandEngine.bat -ver %latest%
