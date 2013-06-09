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
echo. Install hustthesis-en.cls template into local.
mkdir "%TEXMFLOCAL%\tex\latex\hustthesis-en\"
xcopy /q /y .\hustthesis-en\hust-thesis-var-en.tex "%TEXMFLOCAL%\tex\latex\hustthesis-en\" > nul
xcopy /q /y .\hustthesis-en\hustthesis-en.cls "%TEXMFLOCAL%\tex\latex\hustthesis-en\" > nul
mkdir "%TEXMFLOCAL%\doc\latex\hustthesis-en\"
xcopy /q /y .\doc\hustthesis-en-doc.pdf "%TEXMFLOCAL%\doc\latex\hustthesis-en\" > nul
xcopy /q /y .\doc\hustthesis-en-doc.tex "%TEXMFLOCAL%\doc\latex\hustthesis-en\" > nul
mkdir "%TEXMFLOCAL%\doc\latex\hustthesis-en\example\"
xcopy /q /y .\example\hustthesis-en-example.pdf "%TEXMFLOCAL%\doc\latex\hustthesis-en\example\" > nul
xcopy /q /y .\example\hustthesis-en-example.tex "%TEXMFLOCAL%\doc\latex\hustthesis-en\example\" > nul
xcopy /q /y .\example\fig-example.pdf "%TEXMFLOCAL%\doc\latex\hustthesis-en\example\" > nul
xcopy /q /y .\example\ref-example.bib "%TEXMFLOCAL%\doc\latex\hustthesis-en\example\" > nul
goto :hash

:uninstall
echo. Uninstall hustthesis-en.cls template.
rd /q /s "%TEXMFLOCAL%\tex\latex\hustthesis-en\"
rd /q /s "%TEXMFLOCAL%\doc\latex\hustthesis-en\"
goto :hash

:hash
echo. Refresh TeX hash database.
texhash
goto :exit

:help
echo Usage:
echo. %~nx0 install          - install hustthesis-en.cls template into local.
echo. %~nx0 uninstall        - uninstall hustthesis-en.cls template.
echo.
goto :exit

:exit