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
    1. Extract same amout of SIFT features from all images in the training set in different scale
    <img src="spatial.jpg">
    2. Cluster all SIFT features into m class (e.g. 400, 800...) to build a vocabulary
    3. Extract SIFT features from training, testing set
    4. Calculate each histogram according to vocabulary which created in Step 2
  - Bag of word (Fisher vector) (get_bags_of_sifts_fisher.m)
    1. Extract same amout of SIFT features from all images in the training set
    2. Calculate GMM model to get [means, covariance, priors]
    3. Extract SIFT features from training, testing set
    4. Calculate fisher vector from SIFT features
- Classfier
  - k-NN (nearest_neighbor_classify.m)
    1. use 'knnsearch' to search the nearest vector (with Euclidean distance)
  - 1-vs-all SVM
    1. Train SVM model on every category with training features
    2. Calculate confidence value (W * testing features + B)
    3. Choose max confidence class
  - Kernel SVM
    - Linear
    - Radial basis function
    - Polynomial
    - Sigmoid
    
### How to run
1. run('VL_ROOT/vl_setup.m')
2. addpath(libsvm/matlab)
3. run proj3.m
4. modify parameters (e.g. FEATURE, CLASSFIER) in proj3.m 
<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.758
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
<td>0.620</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0174.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0140.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0137.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0138.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0049.jpg" width=101 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0090.jpg" width=114 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0008.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0097.jpg" width=101 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.580</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0132.jpg" width=101 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0295.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0015.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0021.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0046.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0123.jpg" width=114 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0090.jpg" width=112 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0053.jpg" width=57 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.610</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0151.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0058.jpg" width=93 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0053.jpg" width=110 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0043.jpg" width=101 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0083.jpg" width=108 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0170.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0024.jpg" width=95 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0141.jpg" width=101 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.530</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0223.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0184.jpg" width=114 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0066.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0058.jpg" width=101 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0084.jpg" width=107 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0006.jpg" width=113 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0064.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0032.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.870</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0171.jpg" width=116 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0197.jpg" width=119 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0159.jpg" width=108 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0044.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0027.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0088.jpg" width=114 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0183.jpg" width=109 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0083.jpg" width=108 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.620</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0031.jpg" width=99 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0235.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0030.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0101.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0003.jpg" width=104 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0082.jpg" width=135 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0135.jpg" width=77 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0125.jpg" width=46 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.970</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0093.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0157.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0171.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0025.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0083.jpg" width=106 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0116.jpg" width=126 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0008.jpg" width=113 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0103.jpg" width=113 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.820</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0255.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0087.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0118.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0024.jpg" width=57 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0085.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0129.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0049.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.800</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0174.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0331.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0080.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0031.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0066.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0056.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0046.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0053.jpg" width=75 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.860</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0092.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0148.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0132.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0121.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0009.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0122.jpg" width=74 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0047.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0133.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.880</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0018.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0219.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0087.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0086.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0080.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0056.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0022.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0034.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.670</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0223.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0314.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0024.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0083.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0045.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0149.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0076.jpg" width=75 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0101.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.740</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0238.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0006.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0068.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0063.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0036.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0044.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0121.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0011.jpg" width=75 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.860</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0199.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0218.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0052.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0008.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0091.jpg" width=57 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0045.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0045.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0079.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.940</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0140.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0162.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0138.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0002.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0100.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0065.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0109.jpg" width=75 height=75><br><small>Mountain</small></td>
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


