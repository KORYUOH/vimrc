@echo off
@rem ===========================================================
@rem Brief	vimrc �����쐬
@rem Author	KORYUOH
@rem Create 2017/12/16
@rem Update 2024/09/17
@rem Version 1.7
@rem ===========================================================
@setlocal

set ROOT=%USERPROFILE%
set ROOTUNDER=0

echo "%CD%" | find "%ROOT%" >NUL
if not ERRORLEVEL 1 set ROOTUNDER=1
set DIRECTORY=%CD%
if %ROOTUNDER% EQU 0 goto CHECK
call set DIRECTORY=%%DIRECTORY:%ROOT%=~%%/_vimrc


:CHECK
echo %DIRECTORY%
set VIMRCNAME=_vimrc
set EXPORTFILE=%ROOT%\%VIMRCNAME%

if exist "%ROOT%\%VIMRCNAME%" goto SELECT
goto CREATE

:SELECT

echo "%ROOT%/%VIMRCNAME%�����݂��܂��A������I�����Ă�������"
choice /c wac /cs /m "�㏑�� (w) , ��ԉ��ɏ������� (a) , �蓮�ł��̂ōs��Ȃ�(c)"

if %ERRORLEVEL% EQU 1 goto CREATE
if %ERRORLEVEL% EQU 2 goto ADD
goto END_VIMRC

:CREATE

echo scriptencoding^=utf-8>%EXPORTFILE%
echo source %DIRECTORY%>>%EXPORTFILE%

goto END_VIMRC

:ADD
echo source %DIRECTORY%>>%EXPORTFILE%
goto END_VIMRC

:END_VIMRC

:CHECK_DENO
choice /c yn /m "deno���C���X�g�[�����܂����H"
if %ERRORLEVEL% EQU 1 goto DENO_INSTALL
if %ERRORLEVEL% EQU 2 goto EOF
goto CHECK_DENO

:DENO_INSTALL
powershell -Command "irm https://deno.land/install.ps1|iex"

:EOF
@endlocal
