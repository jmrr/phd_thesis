# Post viva report 

### Appearance-based methods for object recognition and visual localisation from hand-held and wearable cameras (José Rivera Rubio)

**Examiners**: Professor Andrea Cavallaro and Dr Mengxing Tang


You will find below a list of recommended changes to the thesis based on the discussion during the viva voce examination.


1. There are a few repetitions of concepts across the thesis and the overall
 ‘story’ is sometimes fragmented. Remove the repetitions and improve the flow of the description as discussed during the viva.

2. Define all key terms in a table

3. Improve the quality of the Introduction chapter as discussed during the viva, including referencing to the state of the art

4. Use punctuation for all equations
  - [x] I have added punctuation to all the equations except those where the
  period (.) has a mathematical meaning.

5. Clearly define in the Introduction chapter your assumptions and the associated limitations of the modelling (intrinsic calibration, camera pose, occlusions, impact of the framerate, lack of tracking, motion blur)

6. Clearly state in the Introduction why estimating a 1-dimensional position in the path is more desirable than estimating the 6-dimensional position (location and pose) as related methods do 

7. Several figures are inaccurate or contain insufficient information in the caption

    - Remove Fig. 1
      - [x] I have removed Fig. 1 and the references to it in the 3rd
     paragraph of Chapter 1 and in Section 7.1.

    - Remove Fig. 3 
      - [x] I have removed Fig. 3 from Chapter 2. In its place, I have used Fig.
      53 from Chapter 6 and updated the caption. An adaptation of Fig. 3 has been added to Chapter 4, the "core" of the visual paths study, modifying the caption and references accordingly.
  
    - Improve the captions of the figures so that they are self-contained.

8. Discuss why using a dimension of 4000 for the dictionary size is reasonable for the problem at hand
  The dataset of the problem at hand, the RSM dataset, might seem very
  ambiguous and certainly lacking texture information at some points (e.g.
  sections where the view only shows the walls, ceiling and floor). However,
  other sections are more distinctive and contain elements that once
  captured by a dictionary can provide better retrieval performance. This is
  the case of research posters, permanent exhibition stands, pieces of
  furniture, etc. As dictionaries are computed over the whole sequence,
  large dictionary sizes can assure that this information is collected.

  Another reason for the choice of a large dictionary size was for the
  reproducibility of the results with appearance-based methods that have
  proved success for other tasks such as object categorisation (Chatfield
  et al., 2011).

  Finally, I have added to Section 4.5.1 the fact that an evaluation with
  smaller dictionary (64 words for the case of VLAD and 400 for HA) was
  conducted but showed poorer results. The following comment was included:

  > Large dictionary sizes for an ambiguous dataset such as RSM might not seem
  adequate. However, internal experiments with smaller dictionary sizes
  (64 for VLAD and 400 for HA) showed poorer results and were not included in
  the comparison.

9. Discuss why using a dimension of 256 for the GMM is reasonable for the problem at hand
  This change was addressed in #8.

10. Clarify the meaning of the sentence on page 56: “Using visual information is towards the higher end ….” (or remove that sentence) 
  - [x] I have simplified the sentence, that now reads: *Using visual information
  for localisation holds great potential but lacks reliability [...]*

11. Discuss why using a dimension of 2000 for the descriptors (HOG-3D) is reasonable for the problem at hand
    - [x] The size of 2,000 refers to the number of descriptors extracted from the
    dense methods. This size is directly related with the stride length of
    the dense grids used. These were standard (Chatfield et al., 2011) and
    provide robustness against obstacles and temporal variations present in
    the scene with no computational overhead in the case of DSIFT (VLFEAT,
    2015). A comment has been added in Section 4.6.2:

    > Dense methods are known to provide a better coverage of the scene and
    in principle should show better performance~\cite{tuytelaars2010dense}.
    However the performance of KP-SIFT is in the range of its dense counterpart
    and above other dense methods such as ST-GAUSS, ST-GABOR and HOG3D, thus
    casting doubt on the need for such a dense sampling
    ($\approx$ 2,000 descriptors per image).

12. Remove Sec. 4.8 as discussed during the viva
  - [x] I have removed this section entirely from the main body of the
  thesis, and placed it in Appendix A.4. I make reference to this appendix in
  Section 7.3.2 as part of the future work of the appearance-based localisation
  topic.

13. Remove the last sentence of Point 1 on page 97

  - [x] I have removed the sentence and added the following text to account
     for the latest developments in CNNs for visual self-localisation:

    > Specifically, Kendell et al. [88] have applied deep convolutional neural
    networks to camera pose regression, therefore learning location and orientation
    simultaneously. Also using monocular commodity cameras, Giusti et
    al. [63] train a deep neural network as a supervised image classifier to
    compute the main direction of travel within a trail compared to the viewing
    direction. These are, to our knowledge, the first applications of convolutional
    networks for self-localisation from monocular visual data. These methods
    achieve extraordinary localisation results in the order of 2 m.
    However, they often lack a theoretical formulation of the operators used in
    their neural networks. The tensor operations described in this chapter
    represent an effort towards an unambiguous theoretical tool that can help
    formalise the operators used in state-of-the-art experimental methods.

14. Provide a reference to Lowe’s work for the choice of the value of $\alpha$ (0.7)

15. Clearly summarise in the Conclusion chapter the limitations of your methods, based on the experimental validation 

16. The formatting of the references should be improved and made uniform 

17. References [54] and [55] are corresponding to the same paper

18. Reference [26]: two authors are missing

19. Important information is missing in several references [87], [77], [33], [144] (revise all references)

20. The thesis report would benefit from proofreading

21. Add and comment on the following reference

    A. Giusti, J. Guzzi, D. Ciresan, F. Lin He, J. P. Rodriguez, F. Fontana, M. Faessler, C. Forster, J. Schmidhuber, G. A. Di Caro, D. Scaramuzza, L. Gambardella. A Machine Learning Approach to Visual Perception of Forest Trails for Mobile Robots. IEEE Robotics and Automation Letters, 2015. [link](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&arnumber=7358076)

    - [x] I have added the reference and comments to the first point of
    Section 5.1.2 and 5.3. I have also added the relevant references by
    Kendall & Cipolla [87, 88].


22. Some figure captions can be improved to help understanding (e.g. in Fig2, state what the colour means)

23. Remove on page2 the sentence “In recent years …. at all” 

24. Define “feature” and “descriptor”

25. Consider removing section 2.2.6 & Fig4?

26. Page 24, 1st paragraph, revise the sentence starting “Since…”

27. Page40, define what positive and negative queries are.

28. Page60: consider removing section 4.2.6?

29. Section 4.3.2, revise title

30. Page 91, consider removing section 4.8
  - [x] Done. Same correction as #12.
31. Page97, paragraph 1, last sentence, the claim is invalid, revise or remove
  - [x] done. Same correction as #13.
32. Page143, fig53, consider moving it to introduction?
  - [x] I have moved Fig. 53 and adapted caption and references. It
  describes a higher level concept of *visual path* therefore I agree with
  the examiners, it was more appropriate to place it in the Introduction.
