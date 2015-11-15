#Jose Rivera-Rubio PhD Thesis

### Building instructions

Requires `GNU make`:

```
make
make my-papers # To process multibib reference lists (see below)
```

#####Multibib instructions
To process multibib multiple reference lists that allows to have my personal list of publications and the general bibliography of the library:

```
pdflatex jmrrThesis
bibtex jmrrThesis
bibtex J # for journals
bibtex C # for conference proceedings
pdflatex jmrrThesis
pdflatex jmrrThesis

```

-----

London, 2015
