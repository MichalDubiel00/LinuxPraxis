TEXFILE := linux-25
PDFFILE := $(TEXFILE).pdf
TEXSRC  := $(TEXFILE).tex
BIBSRC  := $(TEXFILE).bib

all: $(PDFFILE)

$(PDFFILE): $(TEXSRC) $(BIBSRC)
	pdflatex $(TEXFILE)
	bibtex $(TEXFILE)
	pdflatex $(TEXFILE)

	@if grep -q 'undefined references' $(TEXFILE).log; then \
		echo "Found undefined references. Recompiling..."; \
		pdflatex $(TEXFILE); \
	else \
		echo "No undefined references."; \
	fi

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf

.PHONY: all clean
