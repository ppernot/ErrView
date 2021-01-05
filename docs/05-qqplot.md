# __QQ-Plot__ module

This module enables to assess the normality of the errors
distribution by plotting its quantiles vs. those of a normal
distribution. 

The errors are centered and scaled for the comparison.

## Controls

### Method

* `Select`: select the error set

* `Remove glob. outl.`: remove global outliers (if any)
  defined in module `Outliers`

### Histogram 

* `Inter-quartile Reg. line`: plot a line passing through
  the limits of the inter-quartile range. For a normal 
  distribution the line should be on the diagonal.
  
* `Confidence interval`: plot a 95% confidence interval 
  accounting for the finite size of the data set. 
  Ideally, the points should not strongly deviate from
  this interval.
  
* `Range of plot`: define the range of the plot.


## Plot

The quantiles dor the centered and scaled errors are
potted agains the theoretical quantiles for a normal
distribution (blue points). 
For a normal data set, these should line close to the diagonal.

