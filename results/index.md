<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.648
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
<td>0.450</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0058.jpg" width=98 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0196.jpg" width=94 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0123.jpg" width=114 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0044.jpg" width=90 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0083.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0030.jpg" width=113 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0075.jpg" width=107 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0121.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.580</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0224.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0282.jpg" width=67 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0122.jpg" width=74 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0067.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0094.jpg" width=89 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0180.jpg" width=113 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0102.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0039.jpg" width=57 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.510</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0132.jpg" width=112 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0089.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0157.jpg" width=90 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0117.jpg" width=52 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0018.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0054.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0042.jpg" width=101 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0040.jpg" width=113 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0034.jpg" width=93 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0232.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0140.jpg" width=117 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0072.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0182.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0085.jpg" width=81 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0095.jpg" width=100 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0068.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.850</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0198.jpg" width=117 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0066.jpg" width=118 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0064.jpg" width=93 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0103.jpg" width=104 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0037.jpg" width=57 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0080.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0126.jpg" width=108 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0127.jpg" width=119 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.510</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0288.jpg" width=101 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0031.jpg" width=99 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0017.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0060.jpg" width=111 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0082.jpg" width=121 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0177.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0021.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0085.jpg" width=112 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.950</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0078.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0054.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0166.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0043.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0102.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0036.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0013.jpg" width=113 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0173.jpg" width=113 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.630</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0155.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0135.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0093.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0068.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0015.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0008.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0088.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0075.jpg" width=75 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.640</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0240.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0066.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0007.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0021.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0097.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0009.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0030.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0047.jpg" width=75 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.520</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0239.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0120.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0134.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0069.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0137.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0120.jpg" width=113 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0119.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0034.jpg" width=75 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.800</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0021.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0204.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0008.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0060.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0119.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0058.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0029.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0006.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.440</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0205.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0043.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0054.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0052.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0070.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0017.jpg" width=75 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0105.jpg" width=75 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.810</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0290.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0116.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0007.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0006.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0100.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0119.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0004.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.760</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0267.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0070.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0020.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0055.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0124.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0022.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0075.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0097.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.910</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0087.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0129.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0077.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0032.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0100.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0047.jpg" width=75 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0109.jpg" width=75 height=75><br><small>Mountain</small></td>
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


