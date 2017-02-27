@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem ; Prevent error escapes.
SET /P Version=Version? (Package Number Only [0010, 0020, 0030]: 
IF "%Version%"=="" (
    rem ; Presume Latest
	ECHO Invalid Package Number, Booting into latest...
	cmd /k CyanDOS.bat 0030
)
IF "%Version%"=="0010" (
    rem ; 0.0.1
    cmd /k CyanDOS.bat 0010
)
IF "%Version%"=="0020" (
    rem ; 0.0.2
    cmd /k CyanDOS.bat 0020
)
IF "%Version%"=="0030" (
    rem ; 0.0.3
    cmd /k CyanDOS.bat 0030
)
rem ; Presume Latest
ECHO Invalid Package Number, Booting into latest...
cmd /k CyanDOS.bat 0030
