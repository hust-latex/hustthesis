
# OS detected
ifeq ($(OS),Windows_NT)
	ifneq ($(findstring .exe,$(SHELL)),)
    OS_TYPE := Windows
	else
    OS_TYPE := Cygwin
	endif
else
    OS_TYPE := $(shell uname -s)
endif

# Program Defintions
TEX    = lualatex -shell-escape -8bit 
BIBTEX = bibtex
INDEX  = makeindex -q 
RM     = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f )

all:class bst doc example

unpack:hustthesis.dtx hustthesis.ins
	@$(TEX) hustthesis.ins

%.cls %.tex %.md %.bib %.bst:hustthesis.dtx hustthesis.ins
	@$(TEX) hustthesis.ins

class:hustthesis.cls

bst:hustthesis.bst

doc:hustthesis.pdf

hustthesis.pdf:hustthesis.dtx
	@$(TEX) $(^F)
	@$(INDEX) -s l3doc.ist $(basename $(^F))
	@$(TEX) $(^F)
	@$(TEX) $(^F)

example:example-zh example-en
example-zh:hustthesis-zh-example.pdf
example-en:hustthesis-en-example.pdf

hustthesis-zh-example.pdf hustthesis-en-example.pdf:%-example.pdf:%-example.tex hustthesis.cls hustthesis.bst ref-example.bib
	@$(TEX) $(<F)
	@$(BIBTEX) $(basename $(<F))
	@$(TEX) $(<F)
	@$(TEX) $(<F)

clean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.hd *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo \
			*.cls *.tex *.md *.bib *.bst

reallyclean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.hd *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo \
			*.cls *.tex *.md *.bib *.bst hustthesis*.pdf

.PHONY:all unpack class bst doc example example-zh example-en clean reallyclean FORCE
