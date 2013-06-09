#!/usr/bin/bash
# LaTeX package install script
# Author: Xu Cheng

SCRIPT_PATH=$(realpath $(cd $(dirname $0);pwd))
cd $SCRIPT_PATH/..

TEXMFLOCAL=`kpsewhich --var-value=TEXMFLOCAL | awk -v RS="" -v FS="[\r\n]" '{print $1}' `

install(){
echo "Install hustthesis-en.cls template into local."
mkdir -p "${TEXMFLOCAL}/tex/latex/hustthesis-en/"
cp -f ./hustthesis-en/hust-thesis-var-en.tex "${TEXMFLOCAL}/tex/latex/hustthesis-en/"
cp -f ./hustthesis-en/hustthesis-en.cls "${TEXMFLOCAL}/tex/latex/hustthesis-en/"
mkdir -p "${TEXMFLOCAL}/doc/latex/hustthesis-en/"
cp -f ./doc/hustthesis-en-doc.pdf "${TEXMFLOCAL}/doc/latex/hustthesis-en/"
cp -f ./doc/hustthesis-en-doc.tex "${TEXMFLOCAL}/doc/latex/hustthesis-en/"
mkdir -p "${TEXMFLOCAL}/doc/latex/hustthesis-en/example/"
cp -f ./example/hustthesis-en-example.pdf "${TEXMFLOCAL}/doc/latex/hustthesis-en/example/"
cp -f ./example/hustthesis-en-example.tex "${TEXMFLOCAL}/doc/latex/hustthesis-en/example/"
cp -f ./example/fig-example.pdf "${TEXMFLOCAL}/doc/latex/hustthesis-en/example/"
cp -f ./example/ref-example.bib "${TEXMFLOCAL}/doc/latex/hustthesis-en/example/"
hash
}

uninstall(){
echo "Uninstall hustthesis-en.cls template."
rm -rf "${TEXMFLOCAL}/tex/latex/hustthesis-en/"
rm -rf "${TEXMFLOCAL}/doc/latex/hustthesis-en/"
hash
}

hash(){
echo "Refresh TeX hash database."
texhash
}

help(){
echo "Usage:"
echo " $(basename $0) install          - install hustthesis-en.cls template into local."
echo " $(basename $0) uninstall        - uninstall hustthesis-en.cls template."
echo ""
}

if [[ $1 = "install" ]]; then
    install
elif [[ $1 = "uninstall" ]]; then
    uninstall
else
    help
fi
