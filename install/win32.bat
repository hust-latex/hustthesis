@echo off
rem LaTeX package install script
rem Author: Xu Cheng

cd /d "%~dp0"
cd ..

if not defined TEXMFLOCAL (
    for /f "delims=" %%I in ('kpsewhich --var-value=TEXMFLOCAL') do @set TEXMFLOCAL=%%I
)

if /i "%1" == "install"      goto :install
if /i "%1" == "uninstall"    goto :uninstall
goto :help

:install
echo. Install hustthesis.cls template into local.
mkdir "%TEXMFLOCAL%\tex\latex\hustthesis\"
xcopy /q /y .\hustthesis\hustthesis.cls "%TEXMFLOCAL%\tex\latex\hustthesis\" > nul
xcopy /q /y .\hustthesis\hust-title.eps "%TEXMFLOCAL%\tex\latex\hustthesis\" > nul
xcopy /q /y .\hustthesis\hust-title.pdf "%TEXMFLOCAL%\tex\latex\hustthesis\" > nul
mkdir "%TEXMFLOCAL%\bibtex\bst\hustthesis\"
xcopy /q /y .\hustthesis\hustthesis.bst "%TEXMFLOCAL%\bibtex\bst\hustthesis\" > nul
mkdir "%TEXMFLOCAL%\doc\latex\hustthesis\"
xcopy /q /y .\hustthesis\hustthesis.pdf "%TEXMFLOCAL%\doc\latex\hustthesis\" > nul
xcopy /q /y .\hustthesis\README.md "%TEXMFLOCAL%\doc\latex\hustthesis\" > nul
mkdir "%TEXMFLOCAL%\doc\latex\hustthesis\example\"
xcopy /q /y .\hustthesis\hustthesis-zh-example.pdf "%TEXMFLOCAL%\doc\latex\hustthesis\example\" > nul
xcopy /q /y .\hustthesis\hustthesis-zh-example.tex "%TEXMFLOCAL%\doc\latex\hustthesis\example\" > nul
xcopy /q /y .\hustthesis\hustthesis-en-example.pdf "%TEXMFLOCAL%\doc\latex\hustthesis\example\" > nul
xcopy /q /y .\hustthesis\hustthesis-en-example.tex "%TEXMFLOCAL%\doc\latex\hustthesis\example\" > nul
xcopy /q /y .\hustthesis\fig-example.pdf "%TEXMFLOCAL%\doc\latex\hustthesis\example\" > nul
xcopy /q /y .\hustthesis\ref-example.bib "%TEXMFLOCAL%\doc\latex\hustthesis\example\" > nul
goto :hash

:uninstall
echo. Uninstall hustthesis.cls template.
rd /q /s "%TEXMFLOCAL%\tex\latex\hustthesis\"
rd /q /s "%TEXMFLOCAL%\bibtex\bst\hustthesis\"
rd /q /s "%TEXMFLOCAL%\doc\latex\hustthesis\"
goto :hash

:hash
echo. Refresh TeX hash database.
texhash
goto :exit

:help
echo Usage:
echo. %~nx0 install          - install hustthesis.cls template into local.
echo. %~nx0 uninstall        - uninstall hustthesis.cls template.
echo.
goto :exit

:exit