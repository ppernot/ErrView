# __HistDist__ module

This module enables to plot the distribution of errors (as histogram)
and to explore the trends of error sets.

## Controls

### Method

* `Select`: select the error set

* `Remove glob. outl.`: remove global outliers (if any)
  defined in module `Outliers`

### Histogram 

* `# Hist classes`: number of classes in the histogram
  (defaults to Scott's method when slider set to 0)
  
* `Normal fit`: draw a normal fit to the errors histogram

### Trend line

* `Plot trend line`: plot the trend line for a polynomial 
  defined by `Trend degree`

* `Correct trend`: correct the errors from the trend line

* `Trend degree`: degree of the polynomial trend line

### Errors vs. Data

* `Bland-Altman`: plot Bland-Altman statistics (2.5% and
  97.5% interval + mean) with their bootstrapped uncertainty

* `Tag outliers`: plot the tags of points out of the 95% 
  confidence interval defined by the Bland-Altman lines

* `Glob. errror scale`: scale the y-axis from the full dataset
  (all methods) or from the current one


## Plots

The left panel presents a histogram of the errors and 
oprionally a normal fit (same mean and variance).
The histogram reflects the transformations to the errors set
(outliers removal, trend correction...)

The right panel plots the errors as a function of the
calculated data in order to visualize trends that
might be corrected to improve predictions.
