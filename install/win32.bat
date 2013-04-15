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
mkdir "%TEXMFLOCAL%\tex\generic\hustthesis\"
xcopy /q /y .\hustthesis\hust-thesis-var.tex "%TEXMFLOCAL%\tex\generic\hustthesis\" > nul
xcopy /q /y .\hustthesis\hust-title.eps "%TEXMFLOCAL%\tex\generic\hustthesis\" > nul
xcopy /q /y .\hustthesis\hust-title.pdf "%TEXMFLOCAL%\tex\generic\hustthesis\" > nul
xcopy /q /y .\hustthesis\hustthesis.cls "%TEXMFLOCAL%\tex\generic\hustthesis\" > nul
mkdir "%TEXMFLOCAL%\bibtex\bst\hustthesis\"
xcopy /q /y .\hustthesis\hustthesis.bst "%TEXMFLOCAL%\bibtex\bst\hustthesis\" > nul
mkdir "%TEXMFLOCAL%\doc\generic\hustthesis\"
xcopy /q /y .\doc\hustthesis-doc.pdf "%TEXMFLOCAL%\doc\generic\hustthesis\" > nul
xcopy /q /y .\doc\hustthesis-doc.tex "%TEXMFLOCAL%\doc\generic\hustthesis\" > nul
mkdir "%TEXMFLOCAL%\doc\generic\hustthesis\example\"
xcopy /q /y .\example\hustthesis-example.pdf "%TEXMFLOCAL%\doc\generic\hustthesis\example\" > nul
xcopy /q /y .\example\hustthesis-example.tex "%TEXMFLOCAL%\doc\generic\hustthesis\example\" > nul
xcopy /q /y .\example\fig-example.pdf "%TEXMFLOCAL%\doc\generic\hustthesis\example\" > nul
xcopy /q /y .\example\ref-example.bib "%TEXMFLOCAL%\doc\generic\hustthesis\example\" > nul
goto :hash

:uninstall
echo. Uninstall hustthesis.cls template.
rd /q /s "%TEXMFLOCAL%\tex\generic\hustthesis\"
rd /q /s "%TEXMFLOCAL%\bibtex\bst\hustthesis\"
rd /q /s "%TEXMFLOCAL%\doc\generic\hustthesis\"
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