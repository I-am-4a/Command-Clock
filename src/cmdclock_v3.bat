@echo off
setlocal enabledelayedexpansion
cls
pushd %0\..
title CommandClock v3
set tlag=0
set StartedAt=%date%_%time%
set version_def=CommandClock-v3

set confname=cmdclock.cfg

if not exist %confname% (
	type %confname% > %confname%
	echo timealign=center>> %confname%
	echo debug=false>> %confname%
	echo showdate=true>> %confname%
	echo showprompt=true>> %confname%
	echo log=false>> %confname%
	echo # Do not edit from here>> %confname%
	echo version=CommandClock-v3>> %confname%
)
for /f "delims== tokens=1,* eol=#" %%a in ('findstr /r "[a-zA-Z0-9][a-zA-Z0-9]*=" "%confname%"') do set %%a=%%b

if not %version_def% == %version% (
	echo Error: Invalid version.
	pause
	goto :eof
)
set time2=%time::=.%
set time3=%time2:.=%
set time4=%time3: =0%
if %log% == true (
	echo [UpdateLog/INFO] [%date% %time%] Checking for updates> updates_%time4%.log
)
set ustime=%time:~-5%
set ustime2=%ustime:.=%
echo Checking for updates...
bitsadmin /TRANSFER ccu%time4% http://t-labo.ml/versions.cfg "%cd%\v.d" >nul
for /f "delims== tokens=1,* eol=#" %%a in ('findstr /r "[a-zA-Z0-9][a-zA-Z0-9]*=" "v.d"') do set %%a=%%b
del v.d
if not %version_s% == %version_def% (
	set update=true
	echo 新しいバージョンのCommandClockが利用可能です。
		echo 現在のバージョン: %version_def%
	echo 新しいバージョン: %version_s%
	echo ダウンロードリンク: %downloadLink%
	pause
) else (
	set update=false
	echo No update found.
	timeout /t 1 /nobreak >nul
)
set uetime=%time:~-5%
set uetime2=%uetime:.=%
set /a ulag=%uetime2% - %ustime2%
if %log% == true (
	echo [UpdateLog/INFO] [%date% %time%] End.>> updates_%time4%.log
	echo [UpdateLog/INFO] [%date% %time%] --------------------->> updates_%time4%.log
	echo [UpdateLog/INFO] [%date% %time%] UpdatesFound: %update%>> updates_%time4%.log
	echo [UpdateLog/INFO] [%date% %time%] NowVersion: %version_def%>> updates_%time4%.log
	echo [UpdateLog/INFO] [%date% %time%] NewVersion: %version_s%>> updates_%time4%.log
	echo [UpdateLog/INFO] [%date% %time%] Link: %downloadLink%>> updates_%time4%.log
	echo [UpdateLog/INFO] [%date% %time%] CheckTime: %ulag%00ms>> updates_%time4%.log
	echo [UpdateLog/INFO] [%date% %time%] --------------------->> updates_%time4%.log
)
:loop
cls
set stime=%time:~-2%
set date2=%date%
set echodate00=□■■■□
set echodate01=□□□■□
set echodate02=□■■■□
set echodate03=□■□□□
set echodate04=□■■■□
:: -----------------------------------------
if "%date2:~1,1%" == "0" (
	set echodate10=%echodate00%□■■■□
	set echodate11=%echodate01%□■□■□
	set echodate12=%echodate02%□■□■□
	set echodate13=%echodate03%□■□■□
	set echodate14=%echodate04%□■■■□
) else if "%date2:~1,1%" == "1" (
	set echodate10=%echodate00%□□■□□
	set echodate11=%echodate01%□■■□□
	set echodate12=%echodate02%□□■□□
	set echodate13=%echodate03%□□■□□
	set echodate14=%echodate04%□■■■□
) else if "%date2:~1,1%" == "2" (
	set echodate10=%echodate00%□■■■□
	set echodate11=%echodate01%□□□■□
	set echodate12=%echodate02%□■■■□
	set echodate13=%echodate03%□■□□□
	set echodate14=%echodate04%□■■■□
) else if "%date2:~1,1%" == "3" (
	set echodate10=%echodate00%□■■■□
	set echodate11=%echodate01%□□□■□
	set echodate12=%echodate02%□■■■□
	set echodate13=%echodate03%□□□■□
	set echodate14=%echodate04%□■■■□
) else if "%date2:~1,1%" == "4" (
	set echodate10=%echodate00%□■□■□
	set echodate11=%echodate01%□■□■□
	set echodate12=%echodate02%□■■■□
	set echodate13=%echodate03%□□□■□
	set echodate14=%echodate04%□□□■□
) else if "%date2:~1,1%" == "5" (
	set echodate10=%echodate00%□■■■□
	set echodate11=%echodate01%□■□□□
	set echodate12=%echodate02%□■■■□
	set echodate13=%echodate03%□□□■□
	set echodate14=%echodate04%□■■■□
)
:: ------------------------------------------
if "%date2:~2,1%" == "0" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□■□■□
	set echodate22=%echodate12%□■□■□
	set echodate23=%echodate13%□■□■□
	set echodate24=%echodate14%□■■■□
) else if "%date2:~2,1%" == "1" (
	set echodate20=%echodate10%□□■□□
	set echodate21=%echodate11%□■■□□
	set echodate22=%echodate12%□□■□□
	set echodate23=%echodate13%□□■□□
	set echodate24=%echodate14%□■■■□
) else if "%date2:~2,1%" == "2" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□□□■□
	set echodate22=%echodate12%□■■■□
	set echodate23=%echodate13%□■□□□
	set echodate24=%echodate14%□■■■□
) else if "%date2:~2,1%" == "3" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□□□■□
	set echodate22=%echodate12%□■■■□
	set echodate23=%echodate13%□□□■□
	set echodate24=%echodate14%□■■■□
) else if "%date2:~2,1%" == "4" (
	set echodate20=%echodate10%□■□■□
	set echodate21=%echodate11%□■□■□
	set echodate22=%echodate12%□■■■□
	set echodate23=%echodate13%□□□■□
	set echodate24=%echodate14%□□□■□
) else if "%date2:~2,1%" == "5" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□■□□□
	set echodate22=%echodate12%□■■■□
	set echodate23=%echodate13%□□□■□
	set echodate24=%echodate14%□■■■□
) else if "%date2:~2,1%" == "6" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□■□□□
	set echodate22=%echodate12%□■■■□
	set echodate23=%echodate13%□■□■□
	set echodate24=%echodate14%□■■■□
) else if "%date2:~2,1%" == "7" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□■□■□
	set echodate22=%echodate12%□□□■□
	set echodate23=%echodate13%□□□■□
	set echodate24=%echodate14%□□□■□
) else if "%date2:~2,1%" == "8" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□■□■□
	set echodate22=%echodate12%□■■■□
	set echodate23=%echodate13%□■□■□
	set echodate24=%echodate14%□■■■□
) else if "%date2:~2,1%" == "9" (
	set echodate20=%echodate10%□■■■□
	set echodate21=%echodate11%□■□■□
	set echodate22=%echodate12%□■■■□
	set echodate23=%echodate13%□□□■□
	set echodate24=%echodate14%□■■■□
)
:: ------------------------------------------
if "%date2:~3,1%" == "0" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□■□■□
	set echodate32=%echodate22%□■□■□
	set echodate33=%echodate23%□■□■□
	set echodate34=%echodate24%□■■■□
) else if "%date2:~3,1%" == "1" (
	set echodate30=%echodate20%□□■□□
	set echodate31=%echodate21%□■■□□
	set echodate32=%echodate22%□□■□□
	set echodate33=%echodate23%□□■□□
	set echodate34=%echodate24%□■■■□
) else if "%date2:~3,1%" == "2" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□□□■□
	set echodate32=%echodate22%□■■■□
	set echodate33=%echodate23%□■□□□
	set echodate34=%echodate24%□■■■□
) else if "%date2:~3,1%" == "3" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□□□■□
	set echodate32=%echodate22%□■■■□
	set echodate33=%echodate23%□□□■□
	set echodate34=%echodate24%□■■■□
) else if "%date2:~3,1%" == "4" (
	set echodate30=%echodate20%□■□■□
	set echodate31=%echodate21%□■□■□
	set echodate32=%echodate22%□■■■□
	set echodate33=%echodate23%□□□■□
	set echodate34=%echodate24%□□□■□
) else if "%date2:~3,1%" == "5" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□■□□□
	set echodate32=%echodate22%□■■■□
	set echodate33=%echodate23%□□□■□
	set echodate34=%echodate24%□■■■□
) else if "%date2:~3,1%" == "6" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□■□□□
	set echodate32=%echodate22%□■■■□
	set echodate33=%echodate23%□■□■□
	set echodate34=%echodate24%□■■■□
) else if "%date2:~3,1%" == "7" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□■□■□
	set echodate32=%echodate22%□□□■□
	set echodate33=%echodate23%□□□■□
	set echodate34=%echodate24%□□□■□
) else if "%date2:~3,1%" == "8" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□■□■□
	set echodate32=%echodate22%□■■■□
	set echodate33=%echodate23%□■□■□
	set echodate34=%echodate24%□■■■□
) else if "%date2:~3,1%" == "9" (
	set echodate30=%echodate20%□■■■□
	set echodate31=%echodate21%□■□■□
	set echodate32=%echodate22%□■■■□
	set echodate33=%echodate23%□□□■□
	set echodate34=%echodate24%□■■■□
)
:: ------------------------------------------
set echodate40=%echodate30%□□□■□
set echodate41=%echodate31%□□□■□
set echodate42=%echodate32%□□■□□
set echodate43=%echodate33%□■□□□
set echodate44=%echodate34%□■□□□
:: ------------------------------------------
if "%date2:~5,1%" == "0" (
	set echodate50=%echodate40%□■■■□
	set echodate51=%echodate41%□■□■□
	set echodate52=%echodate42%□■□■□
	set echodate53=%echodate43%□■□■□
	set echodate54=%echodate44%□■■■□
) else if "%date2:~5,1%" == "1" (
	set echodate50=%echodate40%□□■□□
	set echodate51=%echodate41%□■■□□
	set echodate52=%echodate42%□□■□□
	set echodate53=%echodate43%□□■□□
	set echodate54=%echodate44%□■■■□
)
:: ------------------------------------------
if "%date2:~6,1%" == "0" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□■□■□
	set echodate62=%echodate52%□■□■□
	set echodate63=%echodate53%□■□■□
	set echodate64=%echodate54%□■■■□
) else if "%date2:~6,1%" == "1" (
	set echodate60=%echodate50%□□■□□
	set echodate61=%echodate51%□■■□□
	set echodate62=%echodate52%□□■□□
	set echodate63=%echodate53%□□■□□
	set echodate64=%echodate54%□■■■□
) else if "%date2:~6,1%" == "2" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□□□■□
	set echodate62=%echodate52%□■■■□
	set echodate63=%echodate53%□■□□□
	set echodate64=%echodate54%□■■■□
) else if "%date2:~6,1%" == "3" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□□□■□
	set echodate62=%echodate52%□■■■□
	set echodate63=%echodate53%□□□■□
	set echodate64=%echodate54%□■■■□
) else if "%date2:~6,1%" == "4" (
	set echodate60=%echodate50%□■□■□
	set echodate61=%echodate51%□■□■□
	set echodate62=%echodate52%□■■■□
	set echodate63=%echodate53%□□□■□
	set echodate64=%echodate54%□□□■□
) else if "%date2:~6,1%" == "5" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□■□□□
	set echodate62=%echodate52%□■■■□
	set echodate63=%echodate53%□□□■□
	set echodate64=%echodate54%□■■■□
) else if "%date2:~6,1%" == "6" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□■□□□
	set echodate62=%echodate52%□■■■□
	set echodate63=%echodate53%□■□■□
	set echodate64=%echodate54%□■■■□
) else if "%date2:~6,1%" == "7" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□■□■□
	set echodate62=%echodate52%□□□■□
	set echodate63=%echodate53%□□□■□
	set echodate64=%echodate54%□□□■□
) else if "%date2:~6,1%" == "8" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□■□■□
	set echodate62=%echodate52%□■■■□
	set echodate63=%echodate53%□■□■□
	set echodate64=%echodate54%□■■■□
) else if "%date2:~6,1%" == "9" (
	set echodate60=%echodate50%□■■■□
	set echodate61=%echodate51%□■□■□
	set echodate62=%echodate52%□■■■□
	set echodate63=%echodate53%□□□■□
	set echodate64=%echodate54%□■■■□
)
:: ------------------------------------------
set echodate70=%echodate60%□□□■□
set echodate71=%echodate61%□□□■□
set echodate72=%echodate62%□□■□□
set echodate73=%echodate63%□■□□□
set echodate74=%echodate64%□■□□□
:: ------------------------------------------
if "%date2:~8,1%" == "0" (
	set echodate80=%echodate70%□■■■□
	set echodate81=%echodate71%□■□■□
	set echodate82=%echodate72%□■□■□
	set echodate83=%echodate73%□■□■□
	set echodate84=%echodate74%□■■■□
) else if "%date2:~8,1%" == "1" (
	set echodate80=%echodate70%□□■□□
	set echodate81=%echodate71%□■■□□
	set echodate82=%echodate72%□□■□□
	set echodate83=%echodate73%□□■□□
	set echodate84=%echodate74%□■■■□
) else if "%date2:~8,1%" == "2" (
	set echodate80=%echodate70%□■■■□
	set echodate81=%echodate71%□□□■□
	set echodate82=%echodate72%□■■■□
	set echodate83=%echodate73%□■□□□
	set echodate84=%echodate74%□■■■□
) else if "%date2:~8,1%" == "3" (
	set echodate80=%echodate70%□■■■□
	set echodate81=%echodate71%□□□■□
	set echodate82=%echodate72%□■■■□
	set echodate83=%echodate73%□□□■□
	set echodate84=%echodate74%□■■■□
)
:: ------------------------------------------
if "%date2:~9,1%" == "0" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□■□■□
	set echodate92=%echodate82%□■□■□
	set echodate93=%echodate83%□■□■□
	set echodate94=%echodate84%□■■■□
) else if "%date2:~9,1%" == "1" (
	set echodate90=%echodate80%□□■□□
	set echodate91=%echodate81%□■■□□
	set echodate92=%echodate82%□□■□□
	set echodate93=%echodate83%□□■□□
	set echodate94=%echodate84%□■■■□
) else if "%date2:~9,1%" == "2" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□□□■□
	set echodate92=%echodate82%□■■■□
	set echodate93=%echodate83%□■□□□
	set echodate94=%echodate84%□■■■□
) else if "%date2:~9,1%" == "3" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□□□■□
	set echodate92=%echodate82%□■■■□
	set echodate93=%echodate83%□□□■□
	set echodate94=%echodate84%□■■■□
) else if "%date2:~9,1%" == "4" (
	set echodate90=%echodate80%□■□■□
	set echodate91=%echodate81%□■□■□
	set echodate92=%echodate82%□■■■□
	set echodate93=%echodate83%□□□■□
	set echodate94=%echodate84%□□□■□
) else if "%date2:~9,1%" == "5" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□■□□□
	set echodate92=%echodate82%□■■■□
	set echodate93=%echodate83%□□□■□
	set echodate94=%echodate84%□■■■□
) else if "%date2:~9,1%" == "6" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□■□□□
	set echodate92=%echodate82%□■■■□
	set echodate93=%echodate83%□■□■□
	set echodate94=%echodate84%□■■■□
) else if "%date2:~9,1%" == "7" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□■□■□
	set echodate92=%echodate82%□□□■□
	set echodate93=%echodate83%□□□■□
	set echodate94=%echodate84%□□□■□
) else if "%date2:~9,1%" == "8" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□■□■□
	set echodate92=%echodate82%□■■■□
	set echodate93=%echodate83%□■□■□
	set echodate94=%echodate84%□■■■□
) else if "%date2:~9,1%" == "9" (
	set echodate90=%echodate80%□■■■□
	set echodate91=%echodate81%□■□■□
	set echodate92=%echodate82%□■■■□
	set echodate93=%echodate83%□□□■□
	set echodate94=%echodate84%□■■■□
)
:: ------------------------------------------
set time2=%time:~0,8%
if "%time2:~0,2%" == " 0" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□■□■□
	set echotime02=□■□■□□■□■□
	set echotime03=□■□■□□■□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == " 1" (
	set echotime00=□■■■□□□■□□
	set echotime01=□■□■□□■■□□
	set echotime02=□■□■□□□■□□
	set echotime03=□■□■□□□■□□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == " 2" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□□□■□
	set echotime02=□■□■□□■■■□
	set echotime03=□■□■□□■□□□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == " 3" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□□□■□
	set echotime02=□■□■□□■■■□
	set echotime03=□■□■□□□□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == " 4" (
	set echotime00=□■■■□□■□■□
	set echotime01=□■□■□□■□■□
	set echotime02=□■□■□□■■■□
	set echotime03=□■□■□□□□■□
	set echotime04=□■■■□□□□■□
) else if "%time2:~0,2%" == " 5" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□■□□□
	set echotime02=□■□■□□■■■□
	set echotime03=□■□■□□□□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == " 6" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□■□□□
	set echotime02=□■□■□□■■■□
	set echotime03=□■□■□□■□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == " 7" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□■□■□
	set echotime02=□■□■□□□□■□
	set echotime03=□■□■□□□□■□
	set echotime04=□■■■□□□□■□
) else if "%time2:~0,2%" == " 8" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□■□■□
	set echotime02=□■□■□□■■■□
	set echotime03=□■□■□□■□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == " 9" (
	set echotime00=□■■■□□■■■□
	set echotime01=□■□■□□■□■□
	set echotime02=□■□■□□■■■□
	set echotime03=□■□■□□□□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "10" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□■□■□
	set echotime02=□□■□□□■□■□
	set echotime03=□□■□□□■□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "11" (
	set echotime00=□□■□□□□■□□
	set echotime01=□■■□□□■■□□
	set echotime02=□□■□□□□■□□
	set echotime03=□□■□□□□■□□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "12" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□□□■□
	set echotime02=□□■□□□■■■□
	set echotime03=□□■□□□■□□□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "13" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□□□■□
	set echotime02=□□■□□□■■■□
	set echotime03=□□■□□□□□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "14" (
	set echotime00=□□■□□□■□■□
	set echotime01=□■■□□□■□■□
	set echotime02=□□■□□□■■■□
	set echotime03=□□■□□□□□■□
	set echotime04=□■■■□□□□■□
) else if "%time2:~0,2%" == "15" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□■□□□
	set echotime02=□□■□□□■■■□
	set echotime03=□□■□□□□□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "16" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□■□□□
	set echotime02=□□■□□□■■■□
	set echotime03=□□■□□□■□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "17" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□■□■□
	set echotime02=□□■□□□□□■□
	set echotime03=□□■□□□□□■□
	set echotime04=□■■■□□□□■□
) else if "%time2:~0,2%" == "18" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□■□■□
	set echotime02=□□■□□□■■■□
	set echotime03=□□■□□□■□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "19" (
	set echotime00=□□■□□□■■■□
	set echotime01=□■■□□□■□■□
	set echotime02=□□■□□□■■■□
	set echotime03=□□■□□□□□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "20" (
	set echotime00=□■■■□□■■■□
	set echotime01=□□□■□□■□■□
	set echotime02=□■■■□□■□■□
	set echotime03=□■□□□□■□■□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "21" (
	set echotime00=□■■■□□□■□□
	set echotime01=□□□■□□■■□□
	set echotime02=□■■■□□□■□□
	set echotime03=□■□□□□□■□□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "22" (
	set echotime00=□■■■□□■■■□
	set echotime01=□□□■□□□□■□
	set echotime02=□■■■□□■■■□
	set echotime03=□■□□□□■□□□
	set echotime04=□■■■□□■■■□
) else if "%time2:~0,2%" == "23" (
	set echotime00=□■■■□□■■■□
	set echotime01=□□□■□□□□■□
	set echotime02=□■■■□□■■■□
	set echotime03=□■□□□□□□■□
	set echotime04=□■■■□□■■■□
)
:: ------------------------------
set echotime10=%echotime00%□□□
set echotime11=%echotime01%□■□
set echotime12=%echotime02%□□□
set echotime13=%echotime03%□■□
set echotime14=%echotime04%□□□
:: ------------------------------
if "%time2:~3,1%" == "0" (
	set echotime20=%echotime10%□■■■□
	set echotime21=%echotime11%□■□■□
	set echotime22=%echotime12%□■□■□
	set echotime23=%echotime13%□■□■□
	set echotime24=%echotime14%□■■■□
) else if "%time2:~3,1%" == "1" (
	set echotime20=%echotime10%□□■□□
	set echotime21=%echotime11%□■■□□
	set echotime22=%echotime12%□□■□□
	set echotime23=%echotime13%□□■□□
	set echotime24=%echotime14%□■■■□
) else if "%time2:~3,1%" == "2" (
	set echotime20=%echotime10%□■■■□
	set echotime21=%echotime11%□□□■□
	set echotime22=%echotime12%□■■■□
	set echotime23=%echotime13%□■□□□
	set echotime24=%echotime14%□■■■□
) else if "%time2:~3,1%" == "3" (
	set echotime20=%echotime10%□■■■□
	set echotime21=%echotime11%□□□■□
	set echotime22=%echotime12%□■■■□
	set echotime23=%echotime13%□□□■□
	set echotime24=%echotime14%□■■■□
) else if "%time2:~3,1%" == "4" (
	set echotime20=%echotime10%□■□■□
	set echotime21=%echotime11%□■□■□
	set echotime22=%echotime12%□■■■□
	set echotime23=%echotime13%□□□■□
	set echotime24=%echotime14%□□□■□
) else if "%time2:~3,1%" == "5" (
	set echotime20=%echotime10%□■■■□
	set echotime21=%echotime11%□■□□□
	set echotime22=%echotime12%□■■■□
	set echotime23=%echotime13%□□□■□
	set echotime24=%echotime14%□■■■□
)
:: ------------------------------------------
if "%time2:~4,1%" == "0" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□■□■□
	set echotime32=%echotime22%□■□■□
	set echotime33=%echotime23%□■□■□
	set echotime34=%echotime24%□■■■□
) else if "%time2:~4,1%" == "1" (
	set echotime30=%echotime20%□□■□□
	set echotime31=%echotime21%□■■□□
	set echotime32=%echotime22%□□■□□
	set echotime33=%echotime23%□□■□□
	set echotime34=%echotime24%□■■■□
) else if "%time2:~4,1%" == "2" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□□□■□
	set echotime32=%echotime22%□■■■□
	set echotime33=%echotime23%□■□□□
	set echotime34=%echotime24%□■■■□
) else if "%time2:~4,1%" == "3" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□□□■□
	set echotime32=%echotime22%□■■■□
	set echotime33=%echotime23%□□□■□
	set echotime34=%echotime24%□■■■□
) else if "%time2:~4,1%" == "4" (
	set echotime30=%echotime20%□■□■□
	set echotime31=%echotime21%□■□■□
	set echotime32=%echotime22%□■■■□
	set echotime33=%echotime23%□□□■□
	set echotime34=%echotime24%□□□■□
) else if "%time2:~4,1%" == "5" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□■□□□
	set echotime32=%echotime22%□■■■□
	set echotime33=%echotime23%□□□■□
	set echotime34=%echotime24%□■■■□
) else if "%time2:~4,1%" == "6" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□■□□□
	set echotime32=%echotime22%□■■■□
	set echotime33=%echotime23%□■□■□
	set echotime34=%echotime24%□■■■□
) else if "%time2:~4,1%" == "7" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□■□■□
	set echotime32=%echotime22%□□□■□
	set echotime33=%echotime23%□□□■□
	set echotime34=%echotime24%□□□■□
) else if "%time2:~4,1%" == "8" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□■□■□
	set echotime32=%echotime22%□■■■□
	set echotime33=%echotime23%□■□■□
	set echotime34=%echotime24%□■■■□
) else if "%time2:~4,1%" == "9" (
	set echotime30=%echotime20%□■■■□
	set echotime31=%echotime21%□■□■□
	set echotime32=%echotime22%□■■■□
	set echotime33=%echotime23%□□□■□
	set echotime34=%echotime24%□■■■□
)
:: ------------------------------------------
set echotime40=%echotime30%□□□
set echotime41=%echotime31%□■□
set echotime42=%echotime32%□□□
set echotime43=%echotime33%□■□
set echotime44=%echotime34%□□□
:: ------------------------------------------
if "%time2:~6,1%" == "0" (
	set echotime50=%echotime40%□■■■□
	set echotime51=%echotime41%□■□■□
	set echotime52=%echotime42%□■□■□
	set echotime53=%echotime43%□■□■□
	set echotime54=%echotime44%□■■■□
) else if "%time2:~6,1%" == "1" (
	set echotime50=%echotime40%□□■□□
	set echotime51=%echotime41%□■■□□
	set echotime52=%echotime42%□□■□□
	set echotime53=%echotime43%□□■□□
	set echotime54=%echotime44%□■■■□
) else if "%time2:~6,1%" == "2" (
	set echotime50=%echotime40%□■■■□
	set echotime51=%echotime41%□□□■□
	set echotime52=%echotime42%□■■■□
	set echotime53=%echotime43%□■□□□
	set echotime54=%echotime44%□■■■□
) else if "%time2:~6,1%" == "3" (
	set echotime50=%echotime40%□■■■□
	set echotime51=%echotime41%□□□■□
	set echotime52=%echotime42%□■■■□
	set echotime53=%echotime43%□□□■□
	set echotime54=%echotime44%□■■■□
) else if "%time2:~6,1%" == "4" (
	set echotime50=%echotime40%□■□■□
	set echotime51=%echotime41%□■□■□
	set echotime52=%echotime42%□■■■□
	set echotime53=%echotime43%□□□■□
	set echotime54=%echotime44%□□□■□
) else if "%time2:~6,1%" == "5" (
	set echotime50=%echotime40%□■■■□
	set echotime51=%echotime41%□■□□□
	set echotime52=%echotime42%□■■■□
	set echotime53=%echotime43%□□□■□
	set echotime54=%echotime44%□■■■□
)
:: ------------------------------------------
if "%time2:~7,1%" == "0" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□■□■□
	set echotime62=%echotime52%□■□■□
	set echotime63=%echotime53%□■□■□
	set echotime64=%echotime54%□■■■□
) else if "%time2:~7,1%" == "1" (
	set echotime60=%echotime50%□□■□□
	set echotime61=%echotime51%□■■□□
	set echotime62=%echotime52%□□■□□
	set echotime63=%echotime53%□□■□□
	set echotime64=%echotime54%□■■■□
) else if "%time2:~7,1%" == "2" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□□□■□
	set echotime62=%echotime52%□■■■□
	set echotime63=%echotime53%□■□□□
	set echotime64=%echotime54%□■■■□
) else if "%time2:~7,1%" == "3" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□□□■□
	set echotime62=%echotime52%□■■■□
	set echotime63=%echotime53%□□□■□
	set echotime64=%echotime54%□■■■□
) else if "%time2:~7,1%" == "4" (
	set echotime60=%echotime50%□■□■□
	set echotime61=%echotime51%□■□■□
	set echotime62=%echotime52%□■■■□
	set echotime63=%echotime53%□□□■□
	set echotime64=%echotime54%□□□■□
) else if "%time2:~7,1%" == "5" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□■□□□
	set echotime62=%echotime52%□■■■□
	set echotime63=%echotime53%□□□■□
	set echotime64=%echotime54%□■■■□
) else if "%time2:~7,1%" == "6" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□■□□□
	set echotime62=%echotime52%□■■■□
	set echotime63=%echotime53%□■□■□
	set echotime64=%echotime54%□■■■□
) else if "%time2:~7,1%" == "7" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□■□■□
	set echotime62=%echotime52%□□□■□
	set echotime63=%echotime53%□□□■□
	set echotime64=%echotime54%□□□■□
) else if "%time2:~7,1%" == "8" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□■□■□
	set echotime62=%echotime52%□■■■□
	set echotime63=%echotime53%□■□■□
	set echotime64=%echotime54%□■■■□
) else if "%time2:~7,1%" == "9" (
	set echotime60=%echotime50%□■■■□
	set echotime61=%echotime51%□■□■□
	set echotime62=%echotime52%□■■■□
	set echotime63=%echotime53%□□□■□
	set echotime64=%echotime54%□■■■□
)
if %showprompt% == true (
	echo %cd%^> ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	echo %cd%^> ■□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■
	if %showdate% == true (
		echo %cd%^> ■%echodate90%■
		echo %cd%^> ■%echodate91%■
		echo %cd%^> ■%echodate92%■
		echo %cd%^> ■%echodate93%■
		echo %cd%^> ■%echodate94%■
		echo %cd%^> ■□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■
	)
	if %timealign% == left (
		echo %cd%^> ■%echotime60%□□□□□□□□□□□□□□■
		echo %cd%^> ■%echotime61%□□□□□□□□□□□□□□■
		echo %cd%^> ■%echotime62%□□□□□□□□□□□□□□■
		echo %cd%^> ■%echotime63%□□□□□□□□□□□□□□■
		echo %cd%^> ■%echotime64%□□□□□□□□□□□□□□■
	) else if %timealign% == center (
		echo %cd%^> ■□□□□□□□%echotime60%□□□□□□□■
		echo %cd%^> ■□□□□□□□%echotime61%□□□□□□□■
		echo %cd%^> ■□□□□□□□%echotime62%□□□□□□□■
		echo %cd%^> ■□□□□□□□%echotime63%□□□□□□□■
		echo %cd%^> ■□□□□□□□%echotime64%□□□□□□□■
	) else if %timealign% == right (
		echo %cd%^> ■□□□□□□□□□□□□□□%echotime60%■
		echo %cd%^> ■□□□□□□□□□□□□□□%echotime61%■
		echo %cd%^> ■□□□□□□□□□□□□□□%echotime62%■
		echo %cd%^> ■□□□□□□□□□□□□□□%echotime63%■
		echo %cd%^> ■□□□□□□□□□□□□□□%echotime64%■
	) else (
		echo %cd%^> ■□■■■□□■■■□□■□■□□■■■□□□□□□□■■■□□■■□□□■■□□□□■□□□■■□□■
		echo %cd%^> ■□□■□□□□■□□□■■■□□■□□□□□□□□□■□□□□■□■□□■□■□□■□■□□■□■□■
		echo %cd%^> ■□□■□□□□■□□□■■■□□■■□□□□□□□□■■□□□■■□□□■■□□□■□■□□■■□□■
		echo %cd%^> ■□□■□□□□■□□□■□■□□■□□□□□□□□□■□□□□■□■□□■□■□□■□■□□■□■□■
		echo %cd%^> ■□□■□□□■■■□□■□■□□■■■□□□□□□□■■■□□■□■□□■□■□□□■□□□■□■□■
	)
	echo %cd%^> ■□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■
	echo %cd%^> ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
) else (
	echo ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	echo ■□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■
	if %showdate% == true (
		echo ■%echodate90%■
		echo ■%echodate91%■
		echo ■%echodate92%■
		echo ■%echodate93%■
		echo ■%echodate94%■
		echo ■□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■
	)
	if %timealign% == left (
		echo ■%echotime60%□□□□□□□□□□□□□□■
		echo ■%echotime61%□□□□□□□□□□□□□□■
		echo ■%echotime62%□□□□□□□□□□□□□□■
		echo ■%echotime63%□□□□□□□□□□□□□□■
		echo ■%echotime64%□□□□□□□□□□□□□□■
	) else if %timealign% == center (
		echo ■□□□□□□□%echotime60%□□□□□□□■
		echo ■□□□□□□□%echotime61%□□□□□□□■
		echo ■□□□□□□□%echotime62%□□□□□□□■
		echo ■□□□□□□□%echotime63%□□□□□□□■
		echo ■□□□□□□□%echotime64%□□□□□□□■
	) else if %timealign% == right (
		echo ■□□□□□□□□□□□□□□%echotime60%■
		echo ■□□□□□□□□□□□□□□%echotime61%■
		echo ■□□□□□□□□□□□□□□%echotime62%■
		echo ■□□□□□□□□□□□□□□%echotime63%■
		echo ■□□□□□□□□□□□□□□%echotime64%■
	) else (
		echo ■□■■■□□■■■□□■□■□□■■■□□□□□□□■■■□□■■□□□■■□□□□■□□□■■□□■
		echo ■□□■□□□□■□□□■■■□□■□□□□□□□□□■□□□□■□■□□■□■□□■□■□□■□■□■
		echo ■□□■□□□□■□□□■■■□□■■□□□□□□□□■■□□□■■□□□■■□□□■□■□□■■□□■
		echo ■□□■□□□□■□□□■□■□□■□□□□□□□□□■□□□□■□■□□■□■□□■□■□□■□■□■
		echo ■□□■□□□■■■□□■□■□□■■■□□□□□□□■■■□□■□■□□■□■□□□■□□□■□■□■
	)
	echo ■□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■
	echo ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
)
set etime=%time:~-2%
set /a nlag=%etime% - %stime%
set /a tlag=%nlag% + %tlag%
if %debug% == true title CommandClock v3 [Debug=on] TimeLag=%nlag%00ms TotalLag=%tlag%00ms TimeAlign=%timealign% StartedAt=%StartedAt%
if %log% == true echo [Debug] TimeLag=%nlag%00ms TotalLag=%tlag%00ms TimeAlign=%timealign% StartedAt=%StartedAt: =0%>> updates_%time4%.log
timeout /t 1 /nobreak >nul
goto loop