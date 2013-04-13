@echo off
rem simulate Makefile for Windows
rem Author: Xu Cheng

cd /d "%~dp0"
set PATH=%~dp0\hustthesis;%PATH%
set TEXINPUTS=.;%~dp0\hustthesis;%TEXINPUTS%
set BSTINPUTS=.;%~dp0\hustthesis;%BSTINPUTS%

if /i "%1" == "example"      goto :example
if /i "%1" == "doc"          goto :doc
if /i "%1" == "clean"        goto :clean
if /i "%1" == "all"          goto :all
goto help

:help
echo Usage:
echo. makewin32 example          - build example
echo. makewin32 doc              - build document
echo. makewin32 all              - build example and document
echo. makewin32 clean            - delete temporary file.
echo.
echo Even this file behaves much like Makefile, 
echo I still recommend you install Make into your Windows.
echo You can download it from http://gnuwin32.sourceforge.net/packages/make.htm
echo.
goto exit

:all
call :example
call :doc
goto :exit

:example
pushd example
lualatex -shell-escape -8bit hustthesis-example
bibtex hustthesis-example
lualatex -shell-escape -8bit hustthesis-example
lualatex -shell-escape -8bit hustthesis-example
popd
goto :exit

:doc
pushd doc
lualatex -shell-escape -8bit hustthesis-doc
makeindex -q -s l3doc.ist hustthesis-doc
lualatex -shell-escape -8bit hustthesis-doc
lualatex -shell-escape -8bit hustthesis-doc
popd
goto :exit

:install
goto :exit

:clean
pushd example
del /f /q *.acn *.acr *.alg *.aux *.bbl *.blg *.dvi *.fdb_latexmk *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.lof *.log *.lot *.maf *.mtc *.mtc0 *.nav *.nlo *.out *.pdfsync *.pyg *.snm *.synctex.gz *.thm *.toc *.vrb *.xdy *.tdo *.hd
popd
pushd doc
del /f /q *.acn *.acr *.alg *.aux *.bbl *.blg *.dvi *.fdb_latexmk *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.lof *.log *.lot *.maf *.mtc *.mtc0 *.nav *.nlo *.out *.pdfsync *.pyg *.snm *.synctex.gz *.thm *.toc *.vrb *.xdy *.tdo *.hd
popd
goto :exit

:exit