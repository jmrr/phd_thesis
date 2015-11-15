PROJECT=jmrrThesis
TEX=pdflatex -synctex=1 -interaction=nonstopmode
BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex

all:
	$(BUILDTEX)
	$(BIBTEX) $(PROJECT)
	$(BUILDTEX)
	$(BUILDTEX)
my-papers:
	$(BUILDTEX)
	$(BIBTEX) $(PROJECT)
	$(BIBTEX) J # for journal
	$(BIBTEX) C # for conference proceedings
	$(BUILDTEX)
	$(BUILDTEX)
clean-all:
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~

clean:
	rm -f *.log *.bak *.aux *.bbl *.blg *.idx *.toc *.out *~
