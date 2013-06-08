#####################################################
# LaTeX Makefile
# Author: Xu Cheng
#
# This Makefile is used to compile LaTeX documents
# Included is basic support for BibTeX bibliographies
#
# This Makefile is written based on below document:
# http://www.physics.wm.edu/~norman/thesis/Makefile
#####################################################

# Name of the main tex document(without .tex suffix)
TARGET = hustthesis-en-example

# Source Paths
SRCDIR = . 
BIBDIR = .
# Source Files
TEXSRC = $(foreach VAR,$(SRCDIR),$(wildcard $(VAR)/*.tex))
BIBSRC = $(foreach VAR,$(BIBDIR),$(wildcard $(VAR)/*.bib))
# If the BIBSRC is not empty
# then we need to generate the bbl database
ifneq ($(strip $(BIBSRC)),)
   BBLSRC = $(TARGET).bbl
endif

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
RM     = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f )

# PATH Config
ifeq ($(OS_TYPE),Windows)
	export PATH      := .;../hustthesis-en;${PATH}
	export TEXINPUTS := .;../hustthesis-en;${TEXINPUTS}
else
ifeq ($(OS_TYPE),Cygwin)
	export PATH      := .:../hustthesis-en:${PATH}
	export TEXINPUTS := .;../hustthesis-en;${TEXINPUTS}
else
	export PATH      := .:../hustthesis-en:${PATH}
	export TEXINPUTS := .:../hustthesis-en:${TEXINPUTS}
endif
endif

default all : $(TARGET).pdf

clean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo 
	-@echo "clean project done."
	
reallyclean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo \
			$(TARGET).pdf
	-@echo "really clean project done."

open:
	-@echo "Open $(TARGET).pdf"
ifeq ($(OS_TYPE),Windows)
	-@start /b cmd /c "$(TARGET).pdf"
else
ifeq ($(OS_TYPE),Cygwin)
	-@cygstart $(TARGET).pdf
else
	-$(TARGET).pdf &
endif
endif
	

# To generate a .pdf file from a .tex file
# Note: LaTeX must be run multiple times to get the proper
#       cross referencing from the \ref and \cite commands
#       and to generate correct hyperref and contents.
%.pdf : %.tex
	@echo "======================== TEX -> PDF ============================"
	@$(TEX) $(*F)
	@$(TEX) $(*F)
	
# To generate a .bbl file from a .tex file
%.bbl : %.aux
ifneq ($(strip $(BIBSRC)),)
	@echo "======================== AUX -> BBL ============================"
	@$(BIBTEX) $(basename $(*F))
endif

# To generate a .aux file from a .tex file
%.aux :	%.tex
	@echo "======================== TEX -> AUX ============================"
	@$(TEX) $(*F)
	
# Dependencies
# DO NOT DELETE
$(TARGET).tex : $(TEXSRC)
$(TARGET).bbl : $(TEXSRC) $(BIBSRC)
$(TARGET).pdf : $(TEXSRC) $(BBLSRC)

.PHONY:default all clean reallyclean open
