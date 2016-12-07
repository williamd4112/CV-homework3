# Project 3 / Scene recognition with bag of words
## 102062171 (洪章瑋)
### Overview
In this project, I created a scene recognition system and experiemented a lot of techniques such as tiny image, bag of word ... etc.
This project is consist of two parts, feature encoding and classfier. In feature encoding part, I experiemented tiny image, bag of visual words, bag of words with gaussian pyramid, bag of words combined with gist feature and fisher vector. In feature classifer part, I experimented k-NN and 1-vs-all SVM classfier and linear kernel, radial basis function kernel, polynomial kernel SVM. The best accuracy is 0.779 (with bag of words with gaussian pyramid + linear kernel SVM).
### Implementation
- Feature extraction
  - Tiny image (get_tiny_images.m)
    1. Resize the image to the same size
    2. Subtract image mean (zero mean)
    3. Normalize the image
  - Bag of word (SIFT) (build_vocabulary.m, get_bags_of_sifts.m)
    1. Extract same amout of SIFT features from all images in the training set
    2. Cluster all SIFT features into m class (e.g. 400, 800...) to build a vocabulary
    3. Extract SIFT features from training, testing set
    4. Calculate each histogram according to vocabulary which created in Step 2
  - Bag of word (SIFT + GIST) (build_vocabulary_gist_sift.m, get_bags_of_sift_gist.m)
    1. Extract same amout of SIFT features from all images in the training set
    2. Cluster all SIFT features into m class (e.g. 400, 800...) to build a vocabulary
    3. Extract SIFT features from training, testing set
    4. Calculate each histogram according to vocabulary which created in Step 2
    5. Append GIST feature to each image's histogram
  - Bag of word (SIFT + Gaussian pyramid) (build_vocabulary.m, get_bags_of_spatial_sifts.m)
    1. Extract same amout of SIFT features from all images in the training set
    2. Cluster all SIFT features into m class (e.g. 400, 800...) to build a vocabulary
    3. Extract SIFT features from training, testing set in different scale (Level 1 ~ 3)
    4. Calculate each histogram in grid according to vocabulary which created in Step 2
        <img src="spatial.jpg"/>
  - Bag of word (Fisher vector) (get_bags_of_sifts_fisher.m)
    1. Extract same amout of SIFT features from all images in the training set
    2. Calculate GMM model to get [means, covariance, priors]
    3. Extract SIFT features from training, testing set
    4. Calculate fisher vector from SIFT features
- Classfier
  - k-NN (nearest_neighbor_classify.m)
    1. Use 'knnsearch' to search the nearest vector (with Euclidean distance)
  - 1-vs-all SVM (svm_classify.m)
    1. Train SVM model on every category with training features
    2. Calculate confidence value (W * testing features + B)
    3. Choose max confidence class
  - Kernel SVM (svm_kernel_rbf_classify.m)
    1. Use libSVM to train different model under different kernel
      - Linear
        <img src="form_linear_svm.PNG"/>
      - Radial basis function
        <img src="form_rbf_svm.PNG"/>
      - Polynomial
        <img src="form_polynomial_svm.PNG"/>
      - Sigmoid
        <img src="form_sigmoid_svm.PNG"/>
    
### How to run
1. In matlab enter "run('vlfeat-0.9.20-bin\vlfeat-0.9.20\toolbox\vl_setup.m')"
2. In matlab enter "addpath(libsvm/matlab)"
3. run proj3.m
4. modify parameters (e.g. FEATURE, CLASSFIER) in proj3.m 

### Results
- Tiny image + nearest neighbor
  - Accuracy = 0.222
  <img src="tiny_nn.PNG"/>

- Bag of word(SIFT) + nearest neighbor (voc size = 400)
  - Accuracy = 0.222
  <img src="sift_nn.PNG"/>
  
- Bag of word(SIFT) + 1-vs-all SVM (voc size = 400)
  <img src="sift_svm.PNG"/>
- Bag of word(SIFT + GIST) + 1-vs-all SVM (voc size = 400)
  <img src="sift_gist_svm.jpg"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + 1-vs-all SVM (voc size = 400)
  <img src="sift_spatial_svm.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Linear SVM (voc size = 400)
  <img src="voc_400.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + RBF SVM (voc size = 400)
  <img src="sift_spatial_rbf.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Polynomial SVM (voc size = 400)
  <img src="sift_spatial_polynomial.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Sigmoid SVM (voc size = 400)
  <img src="sift_spatial_svm_sigmoid.png"/>
- Bag of word(SIFT and Fisher vector and Gaussian pyramid L=3) (voc size = 400)
  <img src="sift_spatial_fisher_svm.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Linear SVM (voc size = 100)
  <img src="voc_100.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Linear SVM (voc size = 200)
  <img src="voc_200.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Linear SVM (voc size = 800)
  <img src="voc_800.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Linear SVM (voc size = 1600)
   <img src="voc_1600.png"/>
- Bag of word(SIFT and Gaussian pyramid L=3) + Linear SVM (voc size = 3200)
   <img src="voc_3200.png"/>
<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.763
<p>

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.650</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0186.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0011.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0127.jpg" width=114 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0097.jpg" width=101 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0062.jpg" width=114 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0127.jpg" width=119 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0166.jpg" width=111 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0135.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.590</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0005.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0006.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0143.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0004.jpg" width=60 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0035.jpg" width=77 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0168.jpg" width=112 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0114.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0008.jpg" width=89 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.710</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0076.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0091.jpg" width=114 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0120.jpg" width=116 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0122.jpg" width=101 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0052.jpg" width=115 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0150.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0150.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0092.jpg" width=116 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.480</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0103.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0017.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0120.jpg" width=111 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0015.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0065.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0081.jpg" width=105 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0145.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0101.jpg" width=101 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.890</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0105.jpg" width=93 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0202.jpg" width=107 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0144.jpg" width=115 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0108.jpg" width=133 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0098.jpg" width=114 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0141.jpg" width=125 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0140.jpg" width=103 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0119.jpg" width=108 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.640</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0078.jpg" width=105 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0288.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0020.jpg" width=112 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0061.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0102.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Suburb_image_0154.jpg" width=113 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0123.jpg" width=120 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0028.jpg" width=114 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.930</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0141.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0006.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0025.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0149.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0115.jpg" width=94 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0026.jpg" width=97 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0137.jpg" width=113 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0154.jpg" width=113 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.870</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0253.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0135.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0068.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0038.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0055.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0095.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0126.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0084.jpg" width=75 height=75><br><small>Street</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.780</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0284.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0108.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0079.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0119.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0021.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0012.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0046.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0092.jpg" width=75 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.840</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0116.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0158.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0014.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0126.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0020.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0096.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0041.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0052.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.830</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0224.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0113.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0137.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0054.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0107.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0020.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0030.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.640</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0036.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0200.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0015.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0103.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0030.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0024.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0117.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0052.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.780</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0258.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0261.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0044.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0087.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0011.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0042.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0009.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0054.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.900</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0137.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0342.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0095.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0065.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0046.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0118.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0005.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0009.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.910</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0287.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0172.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0027.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0082.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0100.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0124.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0117.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>


