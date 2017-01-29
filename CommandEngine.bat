@echo off
setlocal EnableExtensions EnableDelayedExpansion
SET CyanOSVersion=0010
Title CyanDOS 0.0.1
IF "%1"=="-ver" IF "%2"=="0010" GOTO CommandDest0010
ECHO Unable to open file stream, Invalid parameters used.
EXIT

:CommandDest0010
COLOR 0B
ECHO.
SET /P Command=::%CD%::[%TIME%]:: 
rem ; Anode Command.
IF "%Command%"=="ANODE" GOTO Anode
IF "%Command%"=="A" GOTO Anode
IF "%Command%"=="a" GOTO Anode
IF "%Command%"=="anode" GOTO Anode

rem ; Command Not On System?
ECHO Invalid command: "%Command%" - Command Not Found.
rem ; Prevent loop of previous command.
SET Command=
GOTO CommandDest0010

rem ; Internal Command For Anode
:Anode
ECHO.
ECHO :::::::::::: System Information ::::::::::::
ECHO.
ECHO OSName : Cyan DOS Alpha
ECHO OSFullName : cyndos.alpha
ECHO OSVersion : 0.0.1
ECHO OSVersionPKG : 0010
ECHO.
ECHO Registered Name : %Username%
ECHO System Directory : %cd%
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
GOTO CommandDest0010

