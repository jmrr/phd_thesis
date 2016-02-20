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
         **x_i** into a mode *k* of the mixture with a strength given by the
         posterior probability *q_ik*. For each mode we compute the mean and
          covariance deviation vectors across the length dimension of the
          descriptor. The FV of image I is the stacking of the mean and
          covariance vectors for each of the K modes in the Gaussian
          mixtures. These vectors can be seen as the difference between the
          descriptors and the centres of the GMM, which can be seen as a
          soft visual vocabulary.
           If for example we have SIFT descriptors, with D = 128
          and K = 256 Gaussian mixtures, the FV will have dimension
          65536=128*2*256.
    - [x] Fisher Vector: The FV is an image representation obtained by pooling
    local image features. It is frequently used as a global image descripor
    in visual classification.

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
