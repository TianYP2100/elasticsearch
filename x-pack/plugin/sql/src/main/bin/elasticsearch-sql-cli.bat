@echo off

rem Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
rem or more contributor license agreements. Licensed under the Elastic License
rem 2.0; you may not use this file except in compliance with the Elastic License
rem 2.0.

setlocal enabledelayedexpansion
setlocal enableextensions

call "%~dp0elasticsearch-env.bat" || exit /b 1

call "%ES_HOME%/bin/x-pack-env.bat" || exit /b 1

set CLI_JAR=%ES_HOME%/bin/*

%JAVA% ^
  -cp "%CLI_JAR%" ^
  -Des.distribution.type="%ES_DISTRIBUTION_TYPE%" ^
  org.elasticsearch.xpack.sql.cli.Cli ^
  %*

endlocal
endlocal
exit /b %ERRORLEVEL%
