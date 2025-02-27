# WARNING: target end with `!` will modify source code
PACKAGE := hustthesis
EXT := cls
SOURCE := $(PACKAGE).dtx

TAG ?= $(shell git describe --tags --abbrev=0)

TEX := tex -interaction=nonstopmode -shell-escape
LATEX := xelatex -interaction=nonstopmode -shell-escape
LATEXMK := latexmk -xelatex -quiet -outdir=. -auxdir=.
L3BUILD := l3build
ZIP := zip
GIT := git

ifeq ($(OS), Windows_NT)
	RM := cmd //C del //Q //F
	RRM := cmd //C rmdir //Q //S
else
	RM := rm -f
	RRM := rm -r -f
endif

%.ins %.$(EXT): %.dtx
	$(TEX) $<

%.pdf: %.dtx %.$(EXT)
	$(LATEX) $<


.DEFAULT_GOAL = build

.PHONY: all build install full-install uninstall doc tag! ctan! release! clean cleanall

all: build doc full-install

build: $(PACKAGE).$(EXT)

install:
	$(L3BUILD) install

full-install:
	$(L3BUILD) install --full

uninstall:
	$(L3BUILD) uninstall

doc: $(PACKAGE).pdf


tag!: # `make tag! TAG=1.0.0` [WARN: WILL MODIFY SOURCE CODE]
	@if ! $(GIT) diff --quiet $(SOURCE); then \
		echo "Error: Unstaged changes in $(SOURCE)"; \
		exit 1; \
	fi

	@if ! $(GIT) diff --staged --quiet $(SOURCE); then \
		echo "Error: Uncommitted changes in $(SOURCE)"; \
		exit 1; \
	fi

	$(L3BUILD) tag $(TAG)

tag!!: # FORCE TAGGING [WARN: WILL MODIFY SOURCE CODE]
	$(L3BUILD) tag $(TAG)

ctan!: tag! build # CTAN currently requires that the .tds.zip file be excluded
	$(L3BUILD) ctan
	$(ZIP) -d $(PACKAGE)-ctan.zip $(PACKAGE).tds.zip
	$(GIT) restore $(SOURCE)
ctan!!: tag!! build # FORCE TAGGING, WON'T restore source
	$(L3BUILD) ctan
	$(ZIP) -d $(PACKAGE)-ctan.zip $(PACKAGE).tds.zip

release!: tag! build ctan! # generate GitHub release
release!!: tag!! build ctan!! # FORCE TAGGING


clean:
	$(LATEXMK) -c $(PACKAGE).dtx
	$(RM) *.aux *.bbx *.bcf *.fdb_latexmk *.fls *.glo \
		*.synctex.gz *.hd *.idx *.ind *.log *.out \
		 *.toc *.xdv *.run.xml
	$(RM) *.cls *.ins *.sty *.bib *.def *.cbx *.bbx *.zip
	$(RM) $(PACKAGE).pdf

cleanall: clean uninstall
	$(RRM) build/
