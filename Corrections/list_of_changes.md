# Post viva report 

### Appearance-based methods for object recognition and visual localisation from hand-held and wearable cameras (José Rivera Rubio)

**Examiners**: Professor Andrea Cavallaro and Dr Mengxing Tang


You will find below a list of recommended changes to the thesis based on the discussion during the viva voce examination.


1. There are a few repetitions of concepts across the thesis and the overall
 ‘story’ is sometimes fragmented. Remove the repetitions and improve the flow of the description as discussed during the viva.

 - [x] I have proof-read and revised the general flow of the story. I have
 removed repetitions, in particular those pertaining to Chapter 5, removing
 Section 5.4.3 as it had too much overlap with Section 5.4.4 and improving 5.4.2.
  I have also improved the Introduction therefore addressing #3 and
 added the main assumptions and limitations to the Introduction and Conclusion.

2. Define all key terms in a table

 - [x] I have included all the key terms in a glossary section before the
 Introduction. The key terms are the following:
 - **Features** A feature is a property of an image that is used to solve a computational task. An example of a feature can
be an interesting point, an edge or a shape present in the image.
    - **Keypoints** Also called interesting points, keypoints are a specific type of features that capture special local properties around a coordinate point within the image.
    - **Descriptors** They are descriptions of a visual feature present in the image such as colour, texture or shape. They are related to keypoints as these can be used as locations for the computation of descriptors that measure local properties of the image.
    - **Visual Path** A collection of image frames that are induced by the relative motion of a person in a scene.
    - **Journey** In our context, a visual path that has a start ’A’ and end ’B’ points.
    - **Corridor** In the present thesis, a corridor represents the recording of a segment of a journey that in great proportion traverses a corridor within a building.
    - **Pass** Each of the recording instances of the same corridor in the RSM dataset.
    - **Biological Place Cells** BPCs are a specific type of neuron found in mammals that exhibit an increased firing rate when the subject navigates a previously visited place.
    - **Artificial Place Cells** The computational models of the BPCs presented in this thesis.
 
3. Improve the quality of the Introduction chapter as discussed during the viva,
 including referencing to the state of the art
 - [x] I have improved the Introduction removing vague paragraphs (#23),
 including references to the state of the art ([114], [91], [84], [59],
 [158], [99], [110] and [163]). I have also defined the assumptions and
 limitations of the modelling of the  different sub-projects (#5), and
 clarified some design choices (#6).

4. Use punctuation for all equations
  - [x] I have added punctuation to all the equations except those where the
  period (.) has a mathematical meaning.

5. Clearly define in the Introduction chapter your assumptions and the associated limitations of the modelling (intrinsic calibration, camera pose, occlusions, impact of the framerate, lack of tracking, motion blur)

 - [x] I have defined the assumptions and limitations of the methods
 throughout the Introduction and Conclusion chapters. Concretely:
   - Introduction:
     - Last paragraph in Section 1.2 now reads:

       > My hypothesis in this aspect is that appearance-based methods can
      be, in isolation, valid solutions for many challenging problems simultaneously, and combined with other sensing (e.g. WiFi, inertial and depth sensors) and inference techniques (e.g. tracking) it can be a complementary technology that help improve the overall performance of the different approaches on their own. Specifically, as a means to test this hypothesis, I have used only vision approaches to test the feasibility of hand-held and wearable object recognition and visual localisation. Moreover, it is also my goal to evaluate which appearance-based techniques adapt better to the needs of these challenging scenarios in terms of accuracy, power, time and computational load and assess their room for performance.

     - I have created Section 1.5 "Technical assumptions and limitations of the
     modelling" to give an overview of the main assumptions and limitations
     of the different sub-projects. This section elaborates as follows:

       >Through the different sub-projects presented in this thesis I have
      made a number of technical assumptions that provide a context to the
      research and might pose limitations to the modelling. Future work, as we
      will see in Chapter 7 often addresses these limitations, but I have included
      them in the Introduction for clarity. I enumerate these assumptions
      divided per sub-project next.

       >**Hand-held object recognition** In this project, the main
        assumption is the separation of the training and test sets of the SHORT
        dataset. The training set is comprised of high quality models of the
        100 grocery products, presenting systematic variability in the views to
        capture multiple angles and elevations. The test set is comprised of a
        large quantity of unstructured queries (multiple non-calibrated
        sensors, camera optics, devices, etc.) and provision for assistive
        testing with the introduction of queries taken by sighted or
        blindfolded users.

        > **Visual localisation from hand-held and wearable cameras**
        The version of the RSM released with the thesis did not include people
        in its sequences and the only occlusions present were cleaning objects
        and semi-stationary furniture that were present in some sequences and
        not in the others.

        >Additionally, despite including different illumination conditions, no
        changes in the viewpoint were included. This can be a limitation in
        establishing where the algorithms tested in Chapter 4
        might fail. Nevertheless, descriptor density and a high frame rate
        ($\geq$ 24 fps) were used as a mitigation strategy for the presence of
        obstacles.

        >Another assumption in this project was the use of
        one-dimensional
        positional ground truth, instead of the customary 6D position (location
        and pose) that methods from the robotics (SLAM) community use. This
        simplification was intentional at this stage of the project, as the
        dataset comprises narrow spaces and contains restricted views (frontal,
        with low variability in the angle of acquisition). This has proven to
        be sufficient for the testing of appearance-based algorithms,
        especially when a comparison against a state-of-the-art SLAM is also
        provided. However it still represents a limitation of the system that
        hinders the evaluation of more SLAM methods with the RSM dataset.

        > Apart from the lack of multiple views of the same sequences, other
        artifacts such as motion blur and the lack of an analysis adding
        tracking to the methods represent a limitation in the generalisation of
        the results presented in this thesis. Although the lack of tracking is
        a deliberated design choice in order to perform the analysis of the
        appearance-based methods in isolation, it must be taken as a limitation
        of the system in a final application, since as we will see in
        Chapter 4, SLAM methods benefit from tracking
        algorithms to supply bad image associations.

        > **Localisation from place-cell models**
        The creation of place cells is based on the assumptions that a) there
        will be sufficient frame rate in the sequences as to create the
        distinctive concave shape of the place cells via associations from
        multiple visual paths; and b) the similarity of contiguous frames in
        the sequence is sufficient to yield a similar description obtained with
        the appearance-based methods.

        >The first assumption does not pose a limitation, as the datasets
        acquired nowadays can easily have an even higher frame
        rate [163]. The second assumption, however, might rely up
        to some extent on the absence of obstacles. The experimental work
        described in Chapter 5 will discuss the use of dense
        appearance-based methods as a mitigation strategy.

        > **A prototype of an assistive haptic App for visual
        localisation**
        This prototype works as a client-server application that assumes a
        robust connection between the client and the server. This limitation
        must be taken into account in a real scenario, together with the
        possibility of testing the different modules of the application
        pipeline in different sides of the application: e.g. descriptor
        computation to be carried out in the client instead of in the server.

     - Conclusion: I have summarised the main limitations and added comments
   in the future work section on how to address these. In particualr, related to the RSM dataset:
   
        >Another limitation of the current version of the RSM dataset is the absence of
obstacles and obstructions such as the presence of people in the sequences.
This can have an impact in the performance of the algorithms that should be
assessed. We are planning to incorporate “natural” sequences to the next
version of the dataset, and there is ongoing work within the group to produce
automatically blurred faces of people present in the sequences to preserve
anonymity and maintain the open status of the dataset.

        >Finally, as mentioned earlier, one of the biggest limitations of the dataset is
the absence of 3D ground truth. Therefore we have the opportunity to expand the
dataset with 2 o 3D ground truth but maintaining the natural particularities of
human motion. Rich 3D ground truth have traditionally been provided by robots,
depriving these datasets from real human motion traits.

        >[...] Finally, a limitation of the evaluation presented in Chapter 5 was the
lack of a comparison with "natural" sequences with obstacles and the presence
of people in the scenes. This evaluation is forecast to be included in future
work, as despite the high frame-rate and descriptor density, the use of
sequences with the presence of human obstacles and other obstructions might
have a large impact in the performance of the methods described.



6. Clearly state in the Introduction why estimating a 1-dimensional position in the path is more desirable than estimating the 6-dimensional position (location and pose) as related methods do 

 - [x] I have addressed this as part of #5, adding a paragraph in Section 1.5 reproduced here for convenience:

    >Another assumption in this project was the use of
    one-dimensional
    positional ground truth, instead of the customary 6D position (location
    and pose) that methods from the robotics (SLAM) community use. This
    simplification was intentional at this stage of the project, as the
    dataset comprises narrow spaces and contains restricted views (frontal,
    with low variability in the angle of acquisition). This has proven to
    be sufficient for the testing of appearance-based algorithms,
    especially when a comparison against a state-of-the-art SLAM is also
    provided. However it still represents a limitation of the system that
    hinders the evaluation of more SLAM methods with the RSM dataset.

7. Several figures are inaccurate or contain insufficient information in the caption

    - Remove Fig. 1
      - [x] I have removed Fig. 1 and the references to it in the 3rd
     paragraph of Chapter 1 and in Section 7.1.

    - Remove Fig. 3 
      - [x] I have removed Fig. 3 from Chapter 2. In its place, I have used Fig.
      53 from Chapter 6 and updated the caption. An adaptation of Fig. 3 has been added to Chapter 4, the "core" of the visual paths study, modifying the caption and references accordingly.
  
    - Improve the captions of the figures so that they are self-contained.
      - [x] I have addressed this as part of #22.
8. Discuss why using a dimension of 4000 for the dictionary size is reasonable for the problem at hand

  - [x] The dataset of the problem at hand, the RSM dataset, might seem very
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

  Finally, I have added to Section 4.5.1 the fact that an evaluation with a smaller dictionary (64 words for the case of VLAD and 400 for HA) was
  conducted but showed poorer results. The following comment was included:

  > Large dictionary sizes for an ambiguous dataset such as RSM might not seem
  adequate. However, internal experiments with smaller dictionary sizes
  (64 for VLAD and 400 for HA) showed poorer results and were not included in
  the comparison.

9. Discuss why using a dimension of 256 for the GMM is reasonable for the problem at hand

  - [x] This change was addressed in #8.

10. Clarify the meaning of the sentence on page 56: “Using visual information is towards the higher end ….” (or remove that sentence) 
  - [x] I have simplified the sentence, that now reads: *Using visual information
  for localisation holds great potential but lacks reliability [...]*

11. Discuss why using a dimension of 2000 for the descriptors (HOG-3D) is reasonable for the problem at hand
    - [x] The size of 2,000 refers to the number of descriptors extracted from the
    dense methods. This size is directly related with the stride length of
    the dense grids used. These are standard (Chatfield et al., 2011) and
    provide robustness against obstacles and temporal variations present in
    the scene with no computational overhead in the case of DSIFT (VLFEAT,
    2015). A comment has been added in Section 4.6.2:

    > Dense methods are known to provide a better coverage of the scene and
    in principle should show better performance [168].
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

  - [x] I have added a reference and a comment:

   >$0 < \alpha < 1$ is set to around 0.7, and any query descriptors that do not
   satisfy this condition is discarded. This “uniqueness criterion” was chosen
   by Lowe as the ratio of closest to second-closest neighbours of each
   descriptor that provides the best ratio of probabilities for correct versus
   incorrect matches [105].

15. Clearly summarise in the Conclusion chapter the limitations of your methods, based on the experimental validation 
  - [x] I have addressed this correction as part of #5, in the sub-section
  dedicated to the Conclusion.

16. The formatting of the references should be improved and made uniform
 - [x] I have reviewed and homogenised the format in all the references. In
 particular:
   - [x] For the journal articles I have made sure volume and pages were
   included.
   - [ ] For the conference proceedings, I have homogenised the name of the
   proceedings, sometimes the title of the book was inverted.
   - [x] For URLs, I have added the date I last accessed the resource.

17. References [54] and [55] are corresponding to the same paper
  - [x] These two references have been merged.

18. Reference [26]: two authors are missing
  - [x] Fixed, added Gong and Xiang.

19. Important information is missing in several references [87], [77], [33],
 [144], (revise all references):
   - [x] I have revised all the references, deleting unnecessary URLs, adding 'Accessed + date' for webpage resources and added the missing details in the following ones:
     - [x] 87: Klein and Murray
     - [x] 77: Huitl, Rinshagen...
     - [x] 33: Jorge Cham (Accessed...)
     - [x] 144: mine, code.

20. The thesis report would benefit from proofreading
  - [x] Addressed in #1.

21. Add and comment on the following reference

    A. Giusti, J. Guzzi, D. Ciresan, F. Lin He, J. P. Rodriguez, F. Fontana, M. Faessler, C. Forster, J. Schmidhuber, G. A. Di Caro, D. Scaramuzza, L. Gambardella. A Machine Learning Approach to Visual Perception of Forest Trails for Mobile Robots. IEEE Robotics and Automation Letters, 2015. [link](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&arnumber=7358076)

    - [x] I have added the reference and comments to the first point of
    Section 5.1.2 and 5.3 and in the Introduction. I have also added the
    relevant references by Kendall & Cipolla [87, 88].


22. Some figure captions can be improved to help understanding (e.g. in Fig2, state what the colour means)

  - [x] I have improved the figure captions throughout the thesis. In
  particular, for Figures 1, 2, 11, 19, 25, 34, 41, 42, 46, 48.

23. Remove on page2 the sentence “In recent years …. at all” 
  - [x] I have removed the vague sentence and rewritten that paragraph, also
  according to the Introduction rewriting specified in #3.

24. Define “feature” and “descriptor”

  - [x] These and other definitios have been addressed in #2.

25. Consider removing section 2.2.6 & Fig4?
  - [x] I have removed Figure 4 as it was misleading. I have decided to keep
   Section 2.2.6 on the $\gamma$ score as it relates to the question "which
   path am I on?" related to the future work that can originate from this PhD
   thesis.

26. Page 24, 1st paragraph, revise the sentence starting “Since…”

  - [x] I have simplified the sentence that now reads:

    > Since a key reason for incorporating computer vision into navigational
 aides would be to detect path obstructions and hazards, Chapter 4 introduces a set of benchmarks using a collection of standard and custom *dense* descriptors that seem to be specially well-suited for this task.

27. Page40, define what positive and negative queries are.

  - [x] I have slighlty rewritten Section 3.5.1 and introduced the sentence:

    >  When testing for each category, a query can be a positive or a
   negative depending whether it belongs to the category being tested or not. In this scenario, a one-against-all binary classifier leads to four possible outcomes [...]

28. Page60: consider removing section 4.2.6?

  - [x] I have removed this section as I consider that the introduction of Chapter 5 already provides enough information regarding the biological motivation of the methods.

29. Section 4.3.2, revise title

  - [x] I have changed this title for the more informative: *Frame-level descriptor: One descriptor per frame*

30. Page 91, consider removing section 4.8
  - [x] Done. Same correction as #12.
31. Page97, paragraph 1, last sentence, the claim is invalid, revise or remove
  - [x] Done. Same correction as #13.
32. Page143, fig53, consider moving it to introduction?
  - [x] I have moved Fig. 53 and adapted caption and references. It
  describes a higher level concept of *visual path* therefore I agree with
  the examiners, it was more appropriate to place it in the Introduction.
