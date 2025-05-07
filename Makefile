# WARNING: Targets ending with `!` will modify the source code
#   Targets ending with `!!` will forcibly modify the source code without checking
#   Targets starting with `_` should not be called directly

PACKAGE := hustthesis
EXT := cls
SOURCE := $(PACKAGE).dtx

TAG ?= $(shell git describe --tags --abbrev=0)

TEX := xetex -interaction=nonstopmode -shell-escape
LATEX := xelatex -interaction=nonstopmode -shell-escape
LATEXMK := latexmk -xelatex -quiet -outdir=. -auxdir=.
L3BUILD := l3build
ZIP := zip
GIT := git
CURL := curl -s -L -o
UNZIP := unzip

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

_ctan!!: # CTAN currently requires that the .tds.zip file be excluded
	$(L3BUILD) ctan
	$(ZIP) -d $(PACKAGE)-ctan.zip $(PACKAGE).tds.zip
ctan!: tag! build _ctan!!
	$(GIT) restore $(SOURCE)
ctan!!: tag!! build _ctan!! # FORCE TAGGING, WON'T restore source

_user_depends:
	$(CURL) hustvisual.tds.zip 'https://github.com/hust-latex/hustvisual/releases/latest/download/hustvisual.tds.zip'
	$(UNZIP) -j hustvisual.tds.zip 'tex/latex/hustvisual/*'

_user!!: _user_depends
	$(ZIP) $(PACKAGE)-user.zip $(PACKAGE).cls $(PACKAGE)-*.def \
		$(PACKAGE).cbx $(PACKAGE).bbx \
		hustvisual.sty hustvisual-*.def
	$(ZIP) $(PACKAGE)-user.zip --junk-paths demo/*.tex demo/*.bib
user!: tag! build _user!! # generate user distribution
user!!: tag!! build _user!! # FORCE TAGGING

release!: tag! build ctan! user! # generate GitHub release
release!!: tag!! build ctan!! user!! # FORCE TAGGING


clean:
	$(LATEXMK) -c $(PACKAGE).dtx
	$(RM) *.aux *.bbx *.bcf *.fdb_latexmk *.fls *.glo \
		*.synctex.gz *.hd *.idx *.ind *.log *.out \
		 *.toc *.xdv *.run.xml
	$(RM) *.cls *.ins *.sty *.bib *.def *.cbx *.bbx *.zip
	$(RM) $(PACKAGE).pdf

cleanall: clean uninstall
	$(RRM) build/
