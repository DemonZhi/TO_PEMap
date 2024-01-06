@echo off

TITLE Run Dedicated Server

SET /A MyWaitTimer= 3
ECHO %MyWaitTimer%
SET MyServerName=Persistent Empires TDM
ECHO %MyServerName%
SET MyPath="C:\Users\Administrator\Desktop\mbserverguncel 4\bin\Win64_Shipping_Server"
ECHO %MyPath%
SET MyExecutable=DedicatedCustomServer.Starter.exe
ECHO %MyExecutable%
SET MyModules=_MODULES_*Native*Multiplayer*_MODULES_
ECHO %MyModules%
SET MyConfig=persistent_tdm.txt
ECHO %MyConfig%
SET /A MyPort= 7232
ECHO %MyPort%
SET MyArguments=%MyExecutable% %MyModules% /dedicatedcustomserverconfigfile %MyConfig% /port %MyPort% /DisableErrorReporting
ECHO %MyArguments%

ECHO "Is %MyServerName% is active..."

:check
TIMEOUT %MyWaitTimer%
TASKLIST | FINDSTR /I "%MyExecutable%"
IF ERRORLEVEL 1 (GOTO :run)
ELSE (GOTO :check)

:run
ECHO "%MyServerName% is not active, starting..."
TIMEOUT %MyWaitTimer%
CD %MyPath%
%MyArguments%
GOTO :check