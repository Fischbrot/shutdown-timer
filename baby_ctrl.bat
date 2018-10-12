echo off
color a
set /A hasdate=0

:init

set /p text=< a.txt  
echo %text%

set /p datum=< b.txt  
echo %datum%

IF %hasdate%==0 (
  set /A hasdate=1
  IF %datum%==%date% GOTO:begin
  echo Ist datum gleich? Wenn nein goto:reset
  GOTO:reset
)

:begin


IF /I %text% LEQ 120 (
  IF /I %text% GEQ 120 GOTO:aboard 
  GOTO:start
)

:reset
IF %text%==119 (
  echo 1 > a.txt
)
GOTO:init

:start
IF %datum%==%date% GOTO:aboard 
echo %text% > a.txt
set /A text=%text%+1
timeout 1
GOTO:begin

:aboard
echo %date% > b.txt
echo ZEIT IST VORBEI!
pause