# __Outliers__ module

This module enables to identify and select _global_ outliers,
_i.e._, systems that are poorly predicted by all methods in the 
set.

The presence of global outliers has a strong impact on some 
shape and ranking statistics. 

They typically originate from problematic experimental
reference data, or from a common shortcoming in all the
compared methods. In any case, they should be handled 
with care.

## Controls

* `Scaled error`: centering and rescaling of errors by their 
   per-method standard deviation 

* `Labels Thresh.`: threshold (in scaled errors units) to 
   display systems labels

* `Scramble points`: add a random shift to the points abscissae
   for better separation

* `Methods Clustering`: ordering the methods as resulting
   from a clustering of the error sets
   
* `Outliers` selector

    + `No`: do not select outliers
    
    + `Q + IQR`: selection based on the interquartile range
    
    + `CI90`: selection based on the 90% confidence intervals
    
    + `CI95`: selection based on the 95% confidence intervals
    
* `Labels size`: tweak the size of systems labels

* `Methods size`: tweak the size of the methods name


