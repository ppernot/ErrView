# __ECDFs__ module

Plot of probability density functions using a gaussian kernel.

## Controls

 
* `Absolute errors`: plot PDF of absolute errors. 
Note that the use of a gaussian kernel produces an
artefactual tail for negative errors.

* `Remove glob. outl.`: remove global outliers (if any)
  defined in module `Outliers`

* `Show MUE`: display the mean of absolute errors

* `Show Q95`: display the Q95 statistic

* `Correct trend`: remove trend from errors

* `Trend degree`: degree of the polynomial to fit trend

* `HD quantiles`: use Harrell-Davis quantiles (default)

* `Fix colors`: use a color palette adapted to the selected methods,
  or a colr palette based on the full set of methods (if checked)

### Methods selector
  
* `Choose metods`: a set of checkboxes to select the methods to
  be plotted.
  
* `Check all`: select all methods

* `Reset`: uncheck all methods except the first one


## Plot

The plot is zoomable by click and drag + dble click.
A simple dble click restores the full scale.

