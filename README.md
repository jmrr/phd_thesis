#Jose Rivera-Rubio PhD Thesis

### Building instructions

Requires `GNU make`:

```
make
make my-papers # To process multibib reference lists (see below)
```
### ToDo
- [x] Declaration of originality
- [ ] Dedication
- [ ] Abstract
	- [ ] English
	- [ ] Spanish
- [ ] Publications
- [ ] Acknowledgments 
- [ ] Listings and acronyms (probably delete?)
- [ ] Fig. 38, Improve by changing to mean +/- s.d.
- [ ] Homogeneize table captions, top or bottom
- [ ] Change 'we' for I
- [ ] Chage Fig. for Figure 

- [ ] SHORT chapter
  - [x] Brief definition of voting metric
  - [ ] Brief explanation of how std was calculated in Table 5
  - [ ] Clarify Table 5

- [ ] Visual paths chapter:
  - [ ] Take some bits from related work section of the ACVR paper as it's better structured.
  - [x] For the description of the descriptors, go to the PRL paper, it has all the details.
  - [ ] Explain randomization of results using PRL paper.
  - [ ] Check reasons why no tracking, ACVR is good!
  - [ ] In Fig. 32 make circles bigger and indicate Corridor #
              
- [ ] Place cell models
  - [x] Substitute pipeline diagram for FEV generation
  - [ ] Update tensor stuff with latest IEEE paper

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
