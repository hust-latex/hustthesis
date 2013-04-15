#!/usr/bin/bash
# LaTeX package install script
# Author: Xu Cheng

SCRIPT_PATH=$(realpath $(cd $(dirname $0);pwd))
cd $SCRIPT_PATH/..

TEXMFLOCAL=`kpsewhich --var-value=TEXMFLOCAL | awk '{print $1}' `

install(){
echo "Install hustthesis.cls template into local."
mkdir -p "${TEXMFLOCAL}/tex/generic/hustthesis/"
cp -f ./hustthesis/hust-thesis-var.tex "${TEXMFLOCAL}/tex/generic/hustthesis/"
cp -f ./hustthesis/hust-title.eps "${TEXMFLOCAL}/tex/generic/hustthesis/"
cp -f ./hustthesis/hust-title.pdf "${TEXMFLOCAL}/tex/generic/hustthesis/"
cp -f ./hustthesis/hustthesis.cls "${TEXMFLOCAL}/tex/generic/hustthesis/"
mkdir -p "${TEXMFLOCAL}/bibtex/bst/hustthesis/"
cp -f ./hustthesis/hustthesis.bst "${TEXMFLOCAL}/bibtex/bst/hustthesis/"
mkdir -p "${TEXMFLOCAL}/doc/generic/hustthesis/"
cp -f ./doc/hustthesis-doc.pdf "${TEXMFLOCAL}/doc/generic/hustthesis/"
cp -f ./doc/hustthesis-doc.tex "${TEXMFLOCAL}/doc/generic/hustthesis/"
mkdir -p "${TEXMFLOCAL}/doc/generic/hustthesis/example/"
cp -f ./example/hustthesis-example.pdf "${TEXMFLOCAL}/doc/generic/hustthesis/example/"
cp -f ./example/hustthesis-example.tex "${TEXMFLOCAL}/doc/generic/hustthesis/example/"
cp -f ./example/fig-example.pdf "${TEXMFLOCAL}/doc/generic/hustthesis/example/"
cp -f ./example/ref-example.bib "${TEXMFLOCAL}/doc/generic/hustthesis/example/"
hash
}

uninstall(){
echo "Uninstall hustthesis.cls template."
rm -rf "${TEXMFLOCAL}/tex/generic/hustthesis/"
rm -rf "${TEXMFLOCAL}/bibtex/bst/hustthesis/"
rm -rf "${TEXMFLOCAL}/doc/generic/hustthesis/"
hash
}

hash(){
echo "Refresh TeX hash database."
texhash
}

help(){
echo "Usage:"
echo " $(basename $0) install          - install hustthesis.cls template into local."
echo " $(basename $0) uninstall        - uninstall hustthesis.cls template."
echo ""
}

if [[ $1 = "install" ]]; then
    install
elif [[ $1 = "uninstall" ]]; then
    uninstall
else
    help
fi
