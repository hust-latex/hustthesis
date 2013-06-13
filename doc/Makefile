TARGET = hustthesis-en-doc
TEXSRC = hustthesis-en-doc.tex
INDEX_IST = l3doc.ist

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
INDEX  = makeindex -q -s $(INDEX_IST)
RM     = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f )

default all : $(TARGET).pdf

clean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo *.hd
	-@echo "clean project done."
	
reallyclean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo *.hd \
			$(TARGET).pdf
	-@echo "really clean project done."

%.pdf : %.tex
	@echo "======================== TEX -> PDF ============================"
	@$(TEX) $(*F)
	@$(INDEX) $(*F)
	@$(TEX) $(*F)
	@$(TEX) $(*F)

$(TARGET).tex : $(TEXSRC)
$(TARGET).bbl : $(TEXSRC) $(BIBSRC)
$(TARGET).pdf : $(TEXSRC) $(BBLSRC)

.PHONY:default all clean reallyclean open