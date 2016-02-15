#Jose Rivera-Rubio PhD Thesis


Requires `GNU make`:

```
make
make my-papers # To process multibib reference lists (see below)
```
### ToDo
- [x] Declaration of originality
- [x] Dedication
- [ ] Abstract
	- [x] English
	- [ ] Spanish
- [x] Publications
- [x] Acknowledgments 
- [x] Listings and acronyms (probably delete?)
- [x] Fig. 38, Improve by changing to mean +/- s.d. It's actually the variability due to different training passes
- [x] Homogeneize table captions, top or bottom
- [x] Change 'we' for I
- [x] Chage Fig. for Figure 
- [ ] Capitalisation of sections
- [/] Palatino for images
- [x] Chapter by chapter spell check

- [ ] SHORT chapter
  - [x] Brief definition of voting metric
  - [/] Brief explanation of how std was calculated in Table 5. I believe it's std across videos of each categorie. Final Acc. is calculated for the videos of each category, but std can be computed as the st dev of accuracy across videos. Example: 10 videos per category, 500 frames each. 5000 estimaes of class are provided, 500 per video. With the voting, only 10 decisions are made, and the Acc. is calcualed as #videos correct class/#videos incorrect class. However, each video can have an Acc. metric, i.e. #frames in video correct/#frames in video incorrect. The variability of this accuracy is captured by Std.
  - [x] Clarify Table 5

- [x] Visual paths chapter:
  - [x] Take some bits from related work section of the ACVR paper as it's better structured.
  - [x] For the description of the descriptors, go to the PRL paper, it has all the details.
  - [x] Explain randomization of results using PRL paper.
  - [x] Check reasons why no tracking, ACVR is good!
  - [x] In Fig. 32 make circles bigger and indicate Corridor #
              
- [x] Place cell models
  - [x] Substitute pipeline diagram for FEV generation
  - [x] Update tensor stuff with latest IEEE paper

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
