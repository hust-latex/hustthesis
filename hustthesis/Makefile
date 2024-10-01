# WARNING: target end with `!` will modify source code
PACKAGE = useclass
EXT := cls

TAG ?= $(shell git describe --tags --abbrev=0)

TEX = tex -interaction=nonstopmode -shell-escape
LATEX = xelatex -interaction=nonstopmode -shell-escape
LATEXMK = latexmk -pdf -quiet -outdir=. -auxdir=.
L3BUILD = l3build
ZIP = zip

ifeq ($(OS), Windows_NT)
	RM = cmd //C del //Q //F
	RRM = cmd //C rmdir //Q //S
else
	RM = rm -f
	RRM = rm -r -f
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
	$(L3BUILD) tag $(TAG)

ctan!: tag! build # CTAN currently requires that the .tds.zip file be excluded
	$(L3BUILD) ctan
	$(ZIP) -d $(PACKAGE)-ctan.zip $(PACKAGE).tds.zip

release!: tag! build doc ctan! # release to GitHub


clean:
	$(LATEXMK) -c $(PACKAGE).dtx
	$(RM) *.aux *.fdb_latexmk *.fls *.glo *.synctex.gz \
		*.hd *.idx *.ind *.log *.out *.pdf *.toc *.xdv
	$(RM) *.cls *.ins *.sty *.zip

cleanall: clean uninstall
	$(RRM) build/
