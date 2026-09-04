@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements. See the NOTICE file
@REM distributed with this work for additional information.
@REM The ASF licenses this file to you under the Apache License, Version 2.0.
@echo off
setlocal

set "BASE_DIR=%~dp0"
set "PROPERTIES=%BASE_DIR%.mvn\wrapper\maven-wrapper.properties"

for /f "tokens=1,* delims==" %%A in (%PROPERTIES%) do (
  if "%%A"=="distributionUrl" set "DISTRIBUTION_URL=%%B"
)

if not defined DISTRIBUTION_URL (
  echo Error: distributionUrl is missing from %PROPERTIES% 1>&2
  exit /b 1
)

for %%F in ("%DISTRIBUTION_URL%") do set "DISTRIBUTION_FILE=%%~nxF"
set "DISTRIBUTION_NAME=%DISTRIBUTION_FILE:-bin.zip=%"
set "MAVEN_HOME=%USERPROFILE%\.m2\wrapper\dists\%DISTRIBUTION_NAME%"
set "MAVEN_BIN=%MAVEN_HOME%\bin\mvn.cmd"

if not exist "%MAVEN_BIN%" (
  if not exist "%MAVEN_HOME%" mkdir "%MAVEN_HOME%"
  set "ARCHIVE=%MAVEN_HOME%\%DISTRIBUTION_FILE%"

  powershell.exe -NoProfile -NonInteractive -Command ^
    "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%DISTRIBUTION_URL%' -OutFile '%MAVEN_HOME%\%DISTRIBUTION_FILE%'"
  if errorlevel 1 exit /b 1

  powershell.exe -NoProfile -NonInteractive -Command ^
    "Expand-Archive -Path '%MAVEN_HOME%\%DISTRIBUTION_FILE%' -DestinationPath '%MAVEN_HOME%' -Force; Move-Item -Path '%MAVEN_HOME%\%DISTRIBUTION_NAME%\*' -Destination '%MAVEN_HOME%' -Force; Remove-Item -Recurse -Force '%MAVEN_HOME%\%DISTRIBUTION_NAME%'; Remove-Item -Force '%MAVEN_HOME%\%DISTRIBUTION_FILE%'"
  if errorlevel 1 exit /b 1
)

call "%MAVEN_BIN%" %*
exit /b %ERRORLEVEL%
