Desktop@echo off
CD %cd%
IF NOT EXIST _TEMP (
    MKDIR _TEMP
    IF EXIST _TEMP (
	CD _TEMP
        GOTO Setup
    ) ELSE (
	ECHO The current installation directory has access issues, Perhaps run as admin?
    )
    @PAUSE>NUL
    EXIT
)

IF EXIST _TEMP (
    CD _TEMP
    GOTO Setup
)

:Setup
ECHO [[[SCRIPT START]]] >>"install_data.txt"
IF EXIST C: (
    ECHO C:\ exists in memory. 
	@ECHO C:\ exists in base memory. >>"install_data.txt"
	SET /P installDir=Would you like to use C:\ as base directory? [Y/N] 
	  IF %installDir%==Y GOTO INSTALL_C_DRIVE
	  ECHO Skipped C:\, Continuing to check...
	  @ECHO Skipped C:\, Continuing to check... >>"install_data.txt"
) 

:INSTALL_C_DRIVE
SET /P instDir=Specify a base directory (Specify 1 for automatic): 
IF %instDir%==1 GOTO INSTALL_C_DRIVE_AUTO
ECHO Checking directory [%instDir%]...
IF EXIST %instDir% (
    CD %instDir%
    GOTO INSTALL_C_DRIVE_CUSTOM
) ELSE (
    ECHO [%instDir%] not found.
    GOTO END
)

:INSTALL_C_DRIVE_AUTO
CD C:\Users\%Username%\Desktop
IF NOT EXIST CyanDOS (
    MKDIR CyanDOS
    CD CyanDOS
    IF NOT EXIST ..\CyanDOS (
        ECHO There seems to be an error, Try running as admin?
	GOTO END
    )
    IF NOT EXIST System (
        MKDIR System
    )
    IF NOT EXIST CyanUsers (
        MKDIR CyanUsers
    )
    IF NOT EXIST Programs (
        MKDIR Programs
    )
    IF NOT EXIST CyanBin (
        MKDIR CyanBin
    )
)

REM ;File Checks
IF EXIST System ( ECHO Found \System ) ELSE ( GOTO END )
IF EXIST CyanUsers ( ECHO Found \CyanUsers ) ELSE ( GOTO END )
IF EXIST Programs ( ECHO Found \Programs ) ELSE ( GOTO END )
IF EXIST CyanBin ( ECHO Found \CyanBin ) ELSE ( GOTO END )
REM ;Start another installation program here to setup users ?

:END
ECHO Nothing else seems to be here, Or an error was found.
@ECHO Nothing else seems to be in base memory or is mounted on the system, Or an error was found during install. >>"install_data.txt"
ECHO [[[SCRIPT END]]] >>"install_data.txt"
CD ..
ECHO.
ECHO Press any key to end.
@PAUSE>NUL
