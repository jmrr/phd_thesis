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
  - [ ] Add Saad and Ioannis' work in declaration.	
- [ ] Listings and acronyms (probably delete?)
- [ ] Fig. 38, Improve by changing to mean +/- s.d.
- [ ] Homogeneize table captions, top or bottom
- [ ] Change 'we' for I
- [ ] Chage Fig. for Figure 
- [ ] Capitalisation of sections
- [ ] SHORT chapter
  - [x] Brief definition of voting metric
  - [/] Brief explanation of how std was calculated in Table 5. I believe it's std across videos of each categorie. Final Acc. is calculated for the videos of each category, but std can be computed as the st dev of accuracy across videos. Example: 10 videos per category, 500 frames each. 5000 estimaes of class are provided, 500 per video. With the voting, only 10 decisions are made, and the Acc. is calcualed as #videos correct class/#videos incorrect class. However, each video can have an Acc. metric, i.e. #frames in video correct/#frames in video incorrect. The variability of this accuracy is captured by Std.
  - [x] Clarify Table 5

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
