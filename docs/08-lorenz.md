# __Lorenz__ module

Plot of Lorenz curves of absolute errors and associated statistics [1].

## Controls
 
* `Gini vs. LAC`:  2D plot of Lorenz Asymmetry coefficients
  vs. Gini coefficients (experimental)

* `Remove glob. outl.`: remove global outliers (if any)
  defined in module `Outliers`

* `Correct trend`: remove trend from errors

* `Trend degree`: degree of the polynomial to fit trend

* `Identity grid`: plot parallel y=a+x lines to evaluate
  asymmetry of Lorenz curves

* `Normal curve`: plot Lorenz curve for half-normal distrubution

* `Var-based`: variance-based Lorenz curves (experimental)

* `Fix colors`: use a color palette adapted to the selected methods,
  or a colr palette based on the full set of methods (if checked)

### Methods selector
  
* `Choose metods`: a set of checkboxes to select the methods to
  be plotted.
  
* `Check all`: select all methods

* `Reset`: uncheck all methods except the first one


## Plot

Plot of the Lorenz curves or from the 'Gini va. LAC' data.


## References

1. P. Pernot and A. Savin (2021) Using the Gini coefficient 
to characterize the shape of computational chemistry error 
distributions. _arXiv_ https://arxiv.org/abs/2012.09589
