# Viva-voce examination preparation notes

## 1. Introduction

* *However, relying almost entirely in the use of data to solve the problem
has sometimes caused the loss of perspective and very poor improvements on
performance or none at all [^1].*

I can defend this with the same arguments of [^1] but perhaps more
interestingly for viva discussion is [^2]. Basically it depends on the type
of problem. There are two possible situations where a model might not perform
well: the **high variance** case, where the model is too complicated for the
amount of data we have, leading to *overfitting*; and the **high bias** case
where the model is too simple to explain the data we have, where adding more
data will not help.

* Good review of appearance-based methods (for object recognition) by [Roth and
Winter (2008)](http://machinelearning.wustl.edu/uploads/Main/appearance_based_methods.pdf)

## 2. Mobile visual assistive apps: a description of the problem and motivation

* Figure 4: There's some imperfect distribution of the 'within' 50 cm of the
query.
* What if Fig. 4 only shows within corridor results? Then the case
should be that query and db from different corridors should be a much lower
number.
* What is $L_{\infty}$ -type normalisation? This is a special case
of L_p normalisations where the max() of the vector  to be normalised is
taken.

#### Similar approaches

1. [Pradeep, Medioni & Weiland (2010)](http://iris.usc.edu/Outlines/papers/2010/pradeep-medioni-weiland-cvavi10.pdf):
*Robot Vision for the Visually Impaired*. Head-mounted, stereo-vision. They
provide SLAM to BPS users. Visual odometry + feature based SLAM + mapping the
environment using stereo 3D data triangulation. This map is used to perform 3D
traversability to steer the user away from obstacles. Tactile feedback is
provided through microvibrations conveyed to waist and shoulder motors. Their
SLAM is based on Rao-Blackwellised particle filter (RBPF) in a FastSLAM
framework. Effectively there are two mapping processes going on. The SLAM one
also used to give camera pose estimates, and its mapping is only a
"by-product". The traversability map is obtained by registering and processing
dense 3D point clouds obtained by stereo triangulation and only computed when
camera motion > th.
    * Drawbacks: tracking algorithms fail with too much blur,
need resets and odometry reinit. Bumblebee camera to cumbersome, hampering
mobility, thus not a realistic solution.
2. [Wang et al.](http://www.cse.buffalo.edu/~lusu/cse721/papers/No%20Need%20to%20War-Drive%20Unsupervised%20Indoor%20Localization.pdf):
*Unloc, No need to war-drive: unsupervised indoor localization*. By observing
signatures that are present in certain locations on one or more several
sensing dimensions (one or more sensors), mapping can be achieved. These
signatures can be envisioned as internal landmarks of a building, which can be
used to recalibrate mobile phone's positions whilst dead-reckoning can be used
to track distance (with accelerometers' step count) travelled. **War-drive**
is not needed, nor are floorplans. Given the crowdsourcing of these journeys,
dead-reckoning is recalibrated over time. - Accelerometer, gyroscope, compass
for dead-reckoning. - Combinations of these to detect special landmarks, i.e.
elevators, stairs. - Organic Landmarks (OLMs): clustered landmarks. -
Distinctive WiFi areas to provide landmarks: - Distinctive WiFi areas are
locations < 4 m2 which have low similarity with other areas. This similarity
is computed as a sum of the ratios between min and max RSSI of the same AP at
two distinct locations *l<sub>1</sub>* and *l<sub>2</sub>*. By enforcing a low
threshold on this similarity only the very distinctive (and thus very few)
locations would pass it.
3. [Shen et al.](http://research.microsoft.com/en-us/um/people/moscitho/Publications/NSDI_2013.pdf):
*Walkie Markie: Indoor pathway mapping made easy*. WiFi landmarks to
reconstruct indoor pathway maps by fusing crowdsourced user trajectories
obtained from IMUs on users' mobile phones. They rely on the different WiFi
APs strength along the route, and their strength overlap to define WiFi-Marks
(landmarks). They claim they need 5-6 journeys to map with a max error of 3m.
They infer the mapping using a spring network where each edge of the graph is
assumed as a spring. The rest length is the dead-reckoned trajectory.The
interesting point is that they use the RSSI trend instead of absolute values,
making it robust to signal fluctuations and device diversity. Also one AP can
may determine multiple WiFi-Marks.

## 3. Hand-held object recognition

* Main purpose: a dataset with so much variability in standard results.
And we are using these different algorithms to show this variability. So this
test is not a benchmark but rather an analysis of the dataset so the research
community can make use of different number of training images and do analysis
etc.

* From Introduction:

 > The same images can be used for training and query,
 > therefore training data may contain unsystematic views of an object.
 > Training a classifier with this data may introduce bias and can lead to
 > _solving_ the dataset, i.e. over fitting the categorisation model to the
 > particularities of the training set.

 If training and query sets are of totally different quality, classifiers
    have it very difficult to overfit, so they will have to learn the
    particularities of the products in isolation.

 * Section 3.3.4: Why a "scaled" average? Essentially, it's a way of
 normalising across the database so matching scores $\mu^{(n)}$ are weighted
 positively if the pair of images being matched have many pairwise descriptor
 comparisons that pass the criterion $f_u$.

 * Section 3.4.1. What do you mean by *[...] the descriptor matching method,
 despite not encoding geometric relationships between keypoints [...]* Once
 we do descriptor to descriptor distance comparisons, the geometric
 information (location of the descriptor) is lost, unlike with the spatial
 pyramid matching (SPM) approach.

 * Explain LLC, FV and SPM
    - [x] LLC: Locality Constrained Linear Coding (LLC) is a 3-step method to
    encode an image:
        1.  k(=5)-NN between the descriptors of an image and the visual words
        in a BOW dictionary
        2. Calculate coefficients **w** solving $(C+\lambda I_5)\mathbf{w}$ =
        1_{5x1} for each descriptor in the image
        3. The image gets encoded by doing max pooling of the coefficients.
         In the end an image is represented by 1xN (N = dictionary size)
         vector of max pooled LLC coefficients of all the descriptor in the
         image. From a set of descriptors extracted from an image, a
         [Gaussian Mixture Model](http://www.vlfeat.org/api/gmm.html)
         fitting the distribution of descriptors associates each descriptor
         $\vec{x_i}$ into a mode *k* of the mixture with a strength given by the
   posterior probability $\vec{q_{ik}}$. For each mode we compute the mean and
   covariance deviation vectors across the length dimension of the descriptor.
   The FV of image I is the stacking of the mean and covariance vectors for
   each of the K modes in the Gaussian mixtures. These vectors can be seen as
   the difference between the descriptors and the centres of the GMM, which can
   be seen as a soft visual vocabulary. If for example we have SIFT
   descriptors, with _D_ = 128 and _K_ = 256 Gaussian mixtures, the FV will
   have dimension 65536=128*2*256.
    - [x] Fisher Vector: The FV is an image representation obtained by pooling
    local image features. It is frequently used as a global image descripor
    in visual classification. In comparison with the BOF representation, fewer
    visual words are required by this more sophisticated representation.

        **Good resource on FV**: [VLFEAT page](http://www.vlfeat.org/api/fisher-fundamentals.html)
     and [^3]
    - [x] Spatial binning: SPM: A standard way of introducing weak geometry in
    a BOW representation. It introduces the concept of spatial histograms, and
    can be extended to any encoding method. Spatial regions are obtained by
    dividing the image in 3 levels:

        - 1x1
        - 3x1 (a horizontal strip) or 2x2
        - 2x2 (four quadrants), a total of 8 regions; or 4x4 for a total of 21.
    Encoded histograms are obtained per region, then l_2 normalised and then
    stacked.

* Definition of PR curve, mAP and classification rates:
    1. Average Precision is obtained by using all the training examples in linear
kernel and an SVM for each product (one vs all). The testing is done by
computing the linear kernel between the training samples and the testing
queries. The resulted probability estimates from the SVM are ranked and the
precision recall curves are obtained in which the average precision per product
is computed.

    2. Classification rates. These rates are acquired by using 30 positive and 30
negative examples randomly picked from the training set to train the SVM and 30
positive and 30 negative queries to perform the testing. This method is
repeated 20 times to obtains the mean and stds. (only the mean is reported)

    The  average precision indicates the ranking position of a TP query. For
instance if the classifier assigns a correct product label what is the ranked
position of the labelled product. In this case whatever is below 3% is worse
than random. The classification rates indicated the ability of the classifier
to correct label predictions without the ranking, so it’s pure classification
no retrieval involved as in AvPrecision. In this case anything below 50% is
worse than random.

    *Final note*: Another way popular to machine learning is multiclass
    accuracy ( deep learning is using it). Find the labels in the test set
    using your classifier regardless the size of the kernel. For each image
    assign the high prop label. Finally you do Estimated_Labels==True_labels;
    you sum and divide by the number of images you tested.

    Now if many classes co-exist in the same image is better to use per class mAP
where the average mAP (overall) will be a better measure for this tasks.

* Why PR curves? We use PR curves as we are using multiple binary classifiers,
SVMs trained for each class, to determine if each query belongs to a certain
class or not. In this context of binary classification, the focus is on
positives and precision and recall are obtained by varying a certain threshold
or given rank. We take queries from one class at a time, predict their score
for each of the SVMs trained for each class and assign the class of that SVM
with highest score. Also a good summary of the PR curve is the average
precision, which can be computed as the area under the curve or as the mean
precision at a set of N equally spaced recall levels. This AP measurement
highlights differences between methods to a greater extent.

* From Fig. 12: why _Descr-Matching_ performs much better? Let's recall that
we're using Lowe's uniqueness criterion where query descriptors whose scores
against the db ones do not pass the uniqueness threshold are not counted for
the average score, therefore yielding a poor match score for the general image.
Let's say that Lowe's score enforces high precision at a low recall expense at
the descriptor level.
_Another definition for Lowe's uniqueness criterion_:unless there's a distinct
match (i.e. the nearest neighbour and second nearest neighbour are far), reject
the query.

* Why do you claim FV perform better?
 One of the main arguments from the literature to support this claim is that
  because FVs encode relative displacement between a descriptor and a
  codeword they can add some extra information that is normally lost in the
  quantisation process.

* Why FV-S3 has lower mAP than FV-S8? I believe the differences are so small
 (2%) that they can reveal a saturation in the performance at this sampling
 density levels.

* From Fig. 13 with the 4 categories, think why some perform good or
 bad. The generation of the histograms or encoding for each region can be
 obtained by sum pooling, in which case the encodings of the descriptors
 in a given region are combined additively, or max pooling, in which case
 each bin in the encoding is assigned a value equal to the maximum across
 descriptor encodings in that region.


* Explain Table 5, std calculation and voting mechanism. For each video
frame in a query video, a classification result, or a vote, is provided. The
final class for the video is assigned according to the majority of votes.
The std captures the variability of the classification accuracy across
videos of the same object when this is computed as the ratio between the
correctly and incorrectly classified frames in each video of the same
category.

#### Similar approaches
* Groceries dataset: Grozi-120
* Generalistic datasets: Caltech-101,256, PASCAL VOC, ImageNet

#### Key Publications

* [Chatfield et al., 2011](http://www.robots.ox.ac.uk/~vedaldi/assets/pubs/chatfield11devil.pdf):
 *The devil is in the details*


## 4. Appearance-based methods for visual localisation

* Why probabilities of error in localisation are better performance metrics than PR or ROC curves (retrieval ones).
* Great SLAM overview [Link](http://www.computervisionblog.com/2016/01/why-slam-matters-future-of-real-time.html)

### Methods

* **LW_COLOR**: Spatio-temporal chromatic Jacobian pooled over 16 regions to
 form a 144-dimensional frame level descriptor. *Description*: Derivative
filters are computed along the x,y and t dimensions on each of the 3 RGB
channels. Temporal smoothing with a support of 11 neighbouring frames is
applied. Finally, the components of the 3x3 matrix at each of the pixels
locations are averaged (pooled) over 16 spatial regions. The descriptor is thus
144-dimensional (3x3x16).

  * What are "lobe outputs" in Fig. 22? They mean the pooled outputs of
    the spatio-temporal chromatic Jacobian computed at every pixel.

* **KP-SIFT**: VLFEAT implementation, _PeakThresh_, used to filter out
small local maxima (keypoints) in scale-space that might be originated by
noise. $t_p = 0$ as the frames are small (208x117).
[VLFEAT link](http://www.vlfeat.org/api/sift.html)

* **DSIFT**: VLFEAT implementation. $\sigma$ = 1.2, was the chosen scale,
and the stride length (_step_) was set to 3px.
$smoothingSigma = (binSize/magnif)^2 - .25$ where _magnif_ is the relationship
between keypoint scale and bin size. By default, _magnif = 3.0_, and
*binSize*= 3 pixels. [VLFEAT link](http://www.vlfeat.org/overview/dsift.html)

* **SF-GABOR**:
  * Motivation: Gabor filters provide an implicit encoding of the
orientation of local image structures. They're also particularly
appropriate for texture representation and discrimination. Corridors in
indoor spaces are extremely ambiguous thus we need to maximise texture
and structure discrimination. Finally, and linking this descriptors with
the work of Chapter 5, The filters are convolved with the signal,
resulting in a so-called Gabor space. This process is closely related to
processes in the primary visual cortex.[Jones and Palmer](http://www.neuro-it.net/pdf_dateien/summer_2004/Jones%201987.pdf)
showed that the real part of the complex Gabor function is a good fit to the
receptive field weight functions found in simple cells in a cat's striate cortex.

  * Computation:

   1. Compute 8-directional anti-symmetric spatial Gabor filters:

        $$g(x,y;\lambda,\theta,\psi,\sigma,\gamma) =
        \exp(-\frac{x'^2 + \gamma^2y'^2}{2\sigma^2})\exp
        (i2\pi\frac{x'}{\lambda} + \psi)$$

        where:

        $$
        x' = x \cos\theta + y \sin\theta\,
        $$

        and

        $$
        y' = -x \sin\theta + y \cos\theta
        $$

    Parameters are:

    * $\sigma$  = standard deviation (width) of the Gaussian envelope,
        this in-turn controls the size of the result (pixels). Size of the
        output Gabor filter will be $(4\sigma+1)\times(4\sigma+1)$. In
        our case we chose $\sigma = 2$, therefore the extent of the
        filters is $9 \times 9$ pixels.
    * Orientation, or $\theta$ = orientation of the Gabor from the
    vertical (degrees): the direction of the carrier since $x_theta$
    and $y_theta$ are rotated by theta. $\theta \pm = {0, 45, 90, 135}$

    * $\lambda = 4$: the wavelength of the carrier (pixels).
    * Phase $\psi = 0$: the phase offset of the carrier(degrees)
    * Aspect, or $\gamma = 1$: aspect ratio of Gaussian envelope (0 = no
    modulation over sin wave, 1 = circular symmetric envelope).
    Aspect can also be seen as the amount the kernel is "stretched" either
    along or across the kernel wave pattern, or ellipticity of the support.

   2. Filter the greyscale version of the frames with the Gabor kernels:

       $$G_{k,\sigma} = I(x,y) \ast g(x,y;\lambda,\theta,\psi,\sigma,
       \gamma)$$

   3. Spatial pooling: $\mathbf{G}_{k,\sigma} \ast {\Phi}_{m,n}$,
    where the pooling patterns $\Phi_{m,n}$ are defined by

        $$\Phi(x,y;m,n) = e^{-\alpha \left
    [\log_e \left ( \frac{x^2+y^2}{d_n^2}\right )
    \right ]^2 - \beta |\theta-\theta_m | } $$

    $\alpha = 4$, $\beta = 0.4$l $m$ and $n$ were chosen to produce 8
    angular regions ($m$ = 0, 1, ...7) at each of 2 distances away $d1$ and
    $d2$ plus the central region without angular variation. **Total of
    pooling regions = 17**, **size of pooling maps**: 11 $\times$ 11.

   4. Each of the pooling patterns is applied (by a filtering process) to each
    of the 8 gradient layers, yielding a 17 $\times$ 8 = 136-dimensional
    descriptor.

   *Dim*: 136

* HOG3D, from [Kläser et al. (2008)](https://lear.inrialpes.fr/pubs/2008/KMS08/KlaserMarszalekSchmid-BMVC08-3DGradientDescriptor.pdf)
 Originally used for action recognition. The binning in 3D is done using
 convex regular polyhedrons. Gradient computation using integral videos
 (efficient gradient computation for arbitrary scales). Steps:
    1. Full descriptor: descriptor for a local support region around 3D
    position in the video. The support region is divided into a set of MxMxM
    cells. For each cell, an orientation histogram is computed. All cell
    histograms are concatenated. Final vector is normalised and values are
    limited to a cut-off value.

    2. Histogram of gradient orientations: this histogram is computed overs
    a set of gradients. Therefore, a given cell is divided in SxSxS
    subblocks. For each subblock, its mean gradient is computed an quantised
    . Sum over all quantised gradients in subblocks give the histogram.

    3. Orientation quantisation. 3D gradients are quantised using a
    polyhedron. The center point of each face corresponds to a histogram bin
    . Efficient quantisation via projection of gradient vector on bin axes.
    We use dodecahedron or icosahedron.

    4. Gradient computation: Gradients need to be computed at different
    temporal and spatial scales. Other works use a fixed set of precomputed
    spatio-temporal scales. We propose integral videos. Mean gradients can
    be computed for any spatio-temporal scale.

    *Dim*: 192

* ST-GABOR (used in activity recognition, structure from motion ...)
    1. 1-D conv between $I(x,y,t)$ and 3 1-D antisymmetric Gabors: $g_x, g_y$
    (1$\times$5 px filters), $g_t$ (1$\times$9 pixels filter).

    2. Each pixel has associated triplet of values.

    3. Spatio-temporal (3D) binning. 13 bins composed of:

        - 8 spatial orientations
        - 5 elevations

    3. Pooling: same 17 regions as SF-GABOR, $\times$ 13 bins: 221 dimensional
    descriptor

    *Dim*: 221

* ST-GAUSS:Spatial derivatives in space, with smoothing over time.
    1. 2-D filtering in space: 2 5$\times$5 gradient masks based on
    derivatives of the Gaussian function, 1-D filtering in the temporal
    direction (11-point Gaussian smoothing filter ($\sigma =2$).

    2. Quantisation: 8-directional bins applied to the angles of the
    gradient field. A voting process incorporating magnitude was used to
    distribute the votes across the bins of a 136-dim descriptor (same
    weighting used for ST-GABOR).

    3. Pooling using the same petal shaped pattern.

    *Dim*: 136


#### Complex descriptors:
1. DAISY: THe DAISY descriptor is an algorithm that converts local image
regions into low dimensional invariant descriptors which can be used for
matching and classification. It can be applied densely or applied to patches
extracted around interest points.

    a. **Steerable filters** are a type of architecture to synthesise
    filters of arbitrary orientations from linear combinations of basis
    filters, allowing one to adaptively "steer" a filter to any orientation,
    and to determine analytically the filter output as a function of
    orientation. Oriented filters are useful in many early vision and image
    processing tasks such as texture analysis, edge detection, motion
    analysis, etc. Steerable filters enable calculating the filter
    response at various orientations. Source: [Freeman and Adelson, 1991:](http://people.csail.mit.edu/billf/publications/Design_and_Use_of_Steerable_Filters.pdf)
    _The design and Use of Steerable Filters_.

#### Histogram encodings
VLAD from [Jegou et al. (2010)](https://lear.inrialpes.fr/pubs/2010/JDSP10/jegou_compactimagerepresentation.pdf)
_Aggregating local descriptors into a compact image representation_
and
[Arandjelovic and Zisserman (2013)](https://courses.cs.washington.edu/courses/cse590v/13au/arandjelovic13.pdf)
_All about VLAD_: Retrieval oriented encoding where storage requirements are
required and no info of high dimensional descriptors (e.g. SIFT) can be
accessed at run time. Keypoints detected with an affine invariant detector,
SIFT descriptors extracted on kp locations. Vocabulary of _k_ words is
constructed. _k_ is selected to be coarse (8,64). For each cluster _k_, the
residuals (vecotr diff between descr and cluster centres) are accumulated
and the _k_ 128-D are concatenated into a single _k_x128 dimensional
descriptor. This is the _unnormalized VLAD_. Note that VLAD is similar to
other descriptors that record residuals such as Fisher vectors and
super-vector encoding. We use the original VLAD normalisation, where the
descriptor is $L_2$ normalised. Another normalisation is the signed square
rooting (SSR) normalisation 1) transform each element of the unnormalised
vector sgn$(x_i)\sqrt(|x_i|)$ to then $L_2$ normalise this.


### Similar approaches

#### Key publications

[Mikolajczyk and Schmid, 2005](https://www.robots.ox.ac.uk/~vgg/research/affine/det_eval_files/mikolajczyk_pami2004.pdf)
_A performance evaluation of local descriptors_



## 5. Modelling hippocampal place cells for visual localisation

* Study concept of CNNs and biological inspiration
* Study connection of CNN formulation for SF-GABOR with weight sharing
   -> TensorFlow?
* Study RBFs.
* [Good video resource](https://www.youtube.com/watch?v=O8CfrnOPtLc), and
* [short paper](http://hermes.etc.upt.ro/docs/cercetare/articole/NafornitaI2.pdf)


## From College's preparation videos:

- [ ] Prepare and possibly bring 10-12 key papers
- [ ] Prepare extra figures and bring them so you can further explain some
topics. (Presentation images?)
- [ ] Be aware of the papers that have been published recently between the
submission and the viva.
- [ ] Short 10-20 presentation can help prepare.

## References

[^1] Zhu, Vondrick, Ramanan and Fowlkes, *Do we need more training data or
better models for object detection?*, BMVC 2012.
[Link](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.259.7748&rep=rep1&type=pdf)

[^2] Xavier Amatriain, *More data or better models?*
[Link](http://technocalifornia.blogspot.co.uk/2012/07/more-data-or-better-models.html)
[^3] Perronin, F. and Dance, C., 2006, *Fisher Kernels on Visual Vocabularies
for Image Categorization*
