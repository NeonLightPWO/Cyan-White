@echo off
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

IF EXIST E: (
    ECHO E:\ exists in memory.
	@ECHO E:\ exists in base memory. >>"install_data.txt"
	SET /P installDir=Would you like to use E:\ as base directory? [Y/N] 
	  IF %installDir%==Y GOTO INSTALL_E_DRIVE
	  ECHO Skipped E:\, Continuing to check...
	  @ECHO Skipped E:\, Continuing to check... >>"Install_data.txt"
) 

ECHO Nothing else seems to be here.
@ECHO Nothing else seems to be in base memory or is mounted on the system >>"install_data.txt"
ECHO [[[SCRIPT END]]] >>"install_data.txt"
CD ..
ECHO.
ECHO Press any key to end.
@PAUSE>NUL
