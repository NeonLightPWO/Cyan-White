@echo off
setlocal EnableExtensions EnableDelayedExpansion
SET /P Version=Version? (Package Number Only [0010, 0020, 0030, 0040]: 
rem ; No Version Defined - Presume Latest.
IF "%Version%"=="" (
	ECHO Invalid Package Number, Booting into latest...
	cmd /k CyanDOS.bat 0040
)
rem ; 0.0.1
IF "%Version%"=="0010" (
    cmd /k CyanDOS.bat 0010
)
rem ; 0.0.2
IF "%Version%"=="0020" (
    cmd /k CyanDOS.bat 0020
)
rem ; 0.0.3
IF "%Version%"=="0030" (
    cmd /k CyanDOS.bat 0030
)
rem ; 0.0.4
IF "%Version%"=="0040" (
    cmd /k CyanDOS.bat 0040
)

rem ; Presume Latest
ECHO Invalid Package Number, Booting into latest...
cmd /k CyanDOS.bat 0040
