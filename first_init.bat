@echo off
@rem ===========================================================
@rem Brief	vimrc 初期作成
@rem Author	KORYUOH
@rem Create 2017/12/16
@rem Update 2018/01/21
@rem Version 1.5
@rem ===========================================================
@setlocal

set ROOT=%USERPROFILE%
set ROOTUNDER=0

echo "%CD%" | find "%ROOT%" >NUL
if not ERRORLEVEL 1 set ROOTUNDER=1
set DIRECTORY=%CD%
if %ROOTUNDER% EQU 0 goto CHECK
set DIRECTORY=~/github/_vimrc


:CHECK
echo %DIRECTORY%
set VIMRCNAME=_vimrc
set EXPORTFILE=%ROOT%\%VIMRCNAME%

if exist "%ROOT%\%VIMRCNAME%" goto SELECT
goto CREATE

:SELECT

echo "%ROOT%/%VIMRCNAME%が存在します、処理を選択してください"
choice /c wac /cs /m "上書き (w) , 一番下に書き込み (a) , 手動でやるので行わない(c)"

if %ERRORLEVEL% EQU 1 goto CREATE
if %ERRORLEVEL% EQU 2 goto ADD
goto EOF

:CREATE

echo scriptencoding^=utf-8>%EXPORTFILE%
echo source %DIRECTORY%>>%EXPORTFILE%

goto EOF

:ADD
echo source %DIRECTORY%>>%EXPORTFILE%
goto EOF

:EOF
@endlocal
