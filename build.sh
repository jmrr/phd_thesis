#!/bin/bash

pdflatex -synctex=1 -interaction=nonstopmode jmrrThesis.tex
pdflatex -synctex=1 -interaction=nonstopmode jmrrThesis.tex
bibtex -synctex=1 -interaction=nonstopmode jmrrThesis.tex
pdflatex -synctex=1 -interaction=nonstopmode jmrrThesis.tex


