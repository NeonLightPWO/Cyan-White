@echo off
rem ; This is the Internet Driver for Cyan-White
rem ; This handles accessing websites and such
rem ; Via the registered default browser.
rem ; Credit to Shade (Neon~Light) for Development.

rem ; This file is only compatiable with 0.0.4 or newer.
IF "%1"=="-INTNET" GOTO DRV_VARIABLES
ECHO Unable to open file stream, Invalid parameters used.
EXIT

:DRV_VARIABLES
rem ; 1.0.0
SET "driverVersion"=="1000"
rem ; Default Webpage to Open.
SET "defaultWebpage"=="http://google.com/"
GOTO INTNET_D

:INTNET_D
ECHO To exit the program website should be typed as "{exit}/"
ECHO Do not include http:// or https:// to your link.
SET /P webPage=Website?: 
IF "%webPage%"=="" ( START %defaultWebpage% )
IF "%webPage%"=="{exit}/" (
    rem ; Should only access to 0.0.4
	IF "%version%"=="0040" (
	    CD ..
	    cmd /k CommandEngine.bat -ver 0030 
	)
	
	rem ; Presume newest version.
	IF "%version%"=="" (
	    CD ..
		cmd /k CommandEngine.bat -ver %latest%
	)
	
	CD ..
	cmd /k CommandEngine.bat -ver %latest%
)

START http://%webPage%
GOTO INTNET_D
