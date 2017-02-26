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
SET "OSFullVersion"=="0.0.2"
SET "OSVersion"=="0020"
SET "OSFullName"=="cyndos.alpha"
SET "OSName"=="Cyan DOS Alpha"
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
IF "%Command%"=="cls" GOTO Clear
IF "%Command%"=="CLS" GOTO Clear
rem ; Github Repo Command.
IF "%Command%"=="git" GOTO Github
IF "%Command%"=="GIT" GOTO Github
IF "%Command%"=="github" GOTO Github
IF "%Command%"=="GITHUB" GOTO Github

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
ECHO OSName : %OSName%
ECHO OSFullName : %OSFullName%
ECHO OSVersion : %OSFullVersion%
ECHO OSVersionPKG : %OSVersion%
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
ECHO Clear - (Alias: CL, CLS): Clears The Command Window.
ECHO Github - (Alias: Git): Opens Link To Cyan-White on Github.
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::
SET Command=
GOTO CommandDest0010

rem ; Internal Command For Clear
:Clear
cls
SET Command=
GOTO CommandDest0010

:Github
ECHO Opening web browser to Cyan-White Github...
START https://github.com/ShadesOfBlack/Cyan-White/
GOTO CommandDest0010
