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
TARGET = hustthesis-example

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
    OS := Windows
	else
    OS := Cygwin
	endif
else
    OS := $(shell uname -s)
endif

# Program Defintions
TEX    = lualatex -shell-escape -8bit 
BIBTEX = bibtex
RM     = $(if $(filter $(OS),Windows),del /f /q ,rm -f )

# PATH Config
ifeq ($(OS),Windows)
	export PATH      := .;../hustthesis;${PATH}
	export TEXINPUTS := .;../hustthesis;${TEXINPUTS}
	export BSTINPUTS := .;../hustthesis;${BSTINPUTS}
else
ifeq ($(OS),Cygwin)
	export PATH      := .:../hustthesis:${PATH}
	export TEXINPUTS := .;../hustthesis;${TEXINPUTS}
	export BSTINPUTS := .;../hustthesis;${BSTINPUTS}
else
	export PATH      := .:../hustthesis:${PATH}
	export TEXINPUTS := .:../hustthesis:${TEXINPUTS}
	export BSTINPUTS := .:../hustthesis:${BSTINPUTS}
endif
endif

default all : $(TARGET).pdf

clean:
	-$(RM) *.aux *.bbl *.blg *.log *.dvi *.idx \
	*.ilg *.ind *.pyg *.toc *.lot *.lof *.out *.thm
	-@echo "clean project done."
	
reallyclean:
	-$(RM) *.aux *.bbl *.blg *.log *.dvi *.idx \
	*.ilg *.ind *.pyg *.toc *.lot *.lof *.out *.thm \
	$(TARGET).pdf
	-@echo "really clean project done."

open:
	-@echo "Open $(TARGET).pdf"
ifeq ($(OS),Windows)
	-@start /b cmd /c "$(TARGET).pdf"
else
ifeq ($(OS),Cygwin)
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
