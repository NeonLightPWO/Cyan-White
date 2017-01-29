@echo off
setlocal EnableExtensions EnableDelayedExpansion
:int_variables
Title CyanDOS - Version 0.0.1
rem ; 0.0.1
SET CyanOSVersion=0010
rem ; Color Texture - Black Background over Light Aqua (Cyan)
SET CRM=0B
rem ; Delimiter
SET delim=::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:int_setup
ECHO %delim%
ECHO.
rem ; Version Checker
IF %CyanOSVersion% EQU 0010 ( ECHO CyanDOS Version 0.0.1 )
ECHO.
ECHO Welcome to CyanDOS - Press Any Key To Boot Into CyanDOS
ECHO %delim%
PAUSE>NUL
CLS
GOTO out_commands

:out_commands
cmd /k CommandEngine.bat -ver 0010
