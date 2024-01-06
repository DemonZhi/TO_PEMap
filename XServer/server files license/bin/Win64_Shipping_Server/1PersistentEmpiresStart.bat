@echo off

TITLE Run Dedicated Server

SET /A MyWaitTimer= 3
ECHO %MyWaitTimer%
SET MyServerName=Persistent Empires Beta Test -1-
ECHO %MyServerName%
SET MyPath="C:\Users\admin\Desktop\mbserverguncel2\bin\Win64_Shipping_Server"
ECHO %MyPath%
SET MyExecutable=DedicatedCustomServer.Starter.exe
ECHO %MyExecutable%
SET MyModules=_MODULES_*Native*Multiplayer*PersistentEmpires*_MODULES_
ECHO %MyModules%
SET MyConfig=persistent_empires2.txt
ECHO %MyConfig%
SET /A MyPort= 7233
ECHO %MyPort%
CD %MyPath%
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