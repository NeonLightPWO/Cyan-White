@echo off
setlocal EnableExtensions EnableDelayedExpansion
SET CyanOSVersion=0020
Title CyanDOS 0.0.2
IF "%1"=="-ver" IF "%2"=="0010" GOTO VersionCheck
rem ; Still using same command destination.
IF "%1"=="-ver" IF "%2"=="0020" GOTO VersionCheck
ECHO Unable to open file stream, Invalid parameters used.
EXIT

:VersionCheck
COLOR 0B
IF %CyanOSVersion%==0010 Title CyanDOS 0.0.1 && GOTO CommandDest0010
IF %CyanOSVersion%==0020 Title CyanDOS 0.0.2 && GOTO CommandDest0010
ECHO Unknown Version - Press any key to end booting into Cyan-White.
PAUSE>NUL
EXIT

:CommandDest0010
ECHO.
SET /P Command=::%CD%::[%TIME%]:: 
rem ; Command Escape
IF "%Command%"=="" GOTO CommandDest0010
rem ; Anode Command.
IF "%Command%"=="ANODE" GOTO Anode
IF "%Command%"=="A" GOTO Anode
IF "%Command%"=="a" GOTO Anode
IF "%Command%"=="anode" GOTO Anode
rem ; Command command. (To list commands)
IF "%Command%"=="commands" GOTO Commands
IF "%Command%"=="COMMANDS" GOTO Commands
rem ; Clear Command.
IF "%Command%"=="CL" GOTO Clear
IF "%Command%"=="cl" GOTO Clear
IF "%Command%"=="CLEAR" GOTO Clear
IF "%Command%"=="clear" GOTO Clear

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
ECHO OSVersion : 0.0.2
ECHO OSVersionPKG : 0020
ECHO.
ECHO Registered Name : %Username%
ECHO System Directory : %cd%
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
SET Command=
GOTO CommandDest0010

rem ; Internal Command For Commands
:Commands
ECHO :::::::::::::: Command List :::::::::::::::::
ECHO.
ECHO Anode - (Alias: A): Shows System Information.
ECHO Commands: Shows This Command List.
ECHO Clear - (Alias: CL): Clears The Command Window.
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::
SET Command=
GOTO CommandDest0010

rem ; Internal Command For Clear
:Clear
cls
SET Command=
GOTO CommandDest0010
