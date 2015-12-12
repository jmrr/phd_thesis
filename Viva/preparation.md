# Viva-voce examination preparation notes

## 1. Introduction

 * *However, relying almost entirely in the use of data to solve the problem has sometimes caused the loss of perspective and very poor improvements on performance or none at all [^1].*

  I can defend this with the same arguments of [^1] but perhaps more interestingly for viva discussion is [^2]. Basically it depends on the type of problem. There are two possible situations where a model might not perform well: the **high variance** case, where the model is too complicated for the amount of data we have, leading to *overfitting*; and the **high bias** case where the model is too simple to explain the data we have, where adding more data will not help.

 * Good review of appearance-based methods (for object recognition) by [Roth and Winter (2008)](http://machinelearning.wustl.edu/uploads/Main/appearance_based_methods.pdf)

## 2. Mobile visual assistive apps: a description of the problem and motivation

 * Figure 4: There's some imperfect distribution of the 'within' 50 cm of the query.

## 3. Hand-held object recognition

 * From Fig. 12 with the 4 categories, think why some perform good or bad.

 * Definition of PR curve.
 
 * Be ready to explain Table 5, std calculation and voting mechanism.

 * Revise Fisher Vector: good resource in [VLCEAT page](http://www.vlfeat.org/api/fisher-fundamentals.html) and [^3]

## 4. Appearance-based methods for visual localisation
 * Why probabilities of error in localisation are better performance metrics than PR or ROC curves (retrieval ones).
## 5. Modelling hippocampal place cells for visual localisation

 * Study concept of CNNs and biological inspiration
 * Study connection of CNN formulation for SF-GABOR with weight sharing -> TensorFlow?
 * Study RBFs. [Good video resource](https://www.youtube.com/watch?v=O8CfrnOPtLc), and [short paper](http://hermes.etc.upt.ro/docs/cercetare/articole/NafornitaI2.pdf)

## References

[^1] Zhu, Vondrick, Ramanan and Fowlkes, *Do we need more training data or better models for object detection?*, BMVC 2012. [Link](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.259.7748&rep=rep1&type=pdf)

[^2] Xavier Amatriain, *More data or better models?* [Link](http://technocalifornia.blogspot.co.uk/2012/07/more-data-or-better-models.html)
[^3] Perronin, F. and Dance, C., 2006, *Fisher Kernels on Visual Vocabularies for Image Categorization*
