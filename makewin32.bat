@echo off
rem simulate Makefile for Windows
rem Author: Xu Cheng

cd /d "%~dp0"

if /i "%1" == "unpack"       goto :unpack
if /i "%1" == "example"      goto :example
if /i "%1" == "example-zh"   goto :example-zh
if /i "%1" == "example-en"   goto :example-en
if /i "%1" == "doc"          goto :doc
if /i "%1" == "clean"        goto :clean
if /i "%1" == "all"          goto :all
if /i "%1" == "install"      goto :install
if /i "%1" == "uninstall"    goto :uninstall
goto :help

:help
echo Usage:
echo. makewin32 unpack           - unpack package
echo. makewin32 example          - build Chinese and English example
echo. makewin32 example-zh       - build Chinese example
echo. makewin32 example-en       - build English example
echo. makewin32 doc              - build document
echo. makewin32 all              - build example and document
echo. makewin32 clean            - delete temporary file
echo. makewin32 install          - install into local
echo. makewin32 uninstall        - uninstall
echo.
echo Even this file behaves much like Makefile, 
echo I still recommend you install Make into your Windows.
echo You can download it from http://gnuwin32.sourceforge.net/packages/make.htm
echo.
goto :exit

:all
call :unpack
call :example
call :doc
goto :exit

:unpack
pushd hustthesis
lualatex hustthesis.ins
popd
goto :exit

:example
call :example-zh
call :example-en
goto :exit

:example-zh
call :unpack
pushd hustthesis
lualatex -shell-escape -8bit hustthesis-zh-example
bibtex hustthesis-zh-example
lualatex -shell-escape -8bit hustthesis-zh-example
lualatex -shell-escape -8bit hustthesis-zh-example
popd
goto :exit

:example-en
call :unpack
pushd hustthesis
lualatex -shell-escape -8bit hustthesis-en-example
bibtex hustthesis-en-example
lualatex -shell-escape -8bit hustthesis-en-example
lualatex -shell-escape -8bit hustthesis-en-example
popd
goto :exit

:doc
pushd hustthesis
lualatex -shell-escape -8bit hustthesis.dtx
makeindex -q -s l3doc.ist hustthesis
makeindex -s l3doc.ist  -o hustthesis.ind hustthesis.idx
makeindex -s gglo.ist -o hustthesis.gls hustthesis.glo
lualatex -shell-escape -8bit hustthesis.dtx
lualatex -shell-escape -8bit hustthesis.dtx
popd
goto :exit

:install
call :unpack
if not exist .\hustthesis\hustthesis-zh-example.pdf call :example-zh
if not exist .\hustthesis\hustthesis-en-example.pdf call :example-en
if not exist .\hustthesis\hustthesis.pdf call :doc
call .\install\win32.bat install
goto :exit

:uninstall
call .\install\win32.bat uninstall
goto :exit

:clean
pushd hustthesis
del /f /q *.acn *.acr *.alg *.aux *.bbl *.blg *.dvi *.fdb_latexmk *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.lof *.log *.lot *.maf *.mtc *.mtc0 *.nav *.nlo *.out *.pdfsync *.pyg *.snm *.synctex.gz *.thm *.toc *.vrb *.xdy *.tdo *.hd
popd
goto :exit

:exit