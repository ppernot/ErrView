[![DOI](https://zenodo.org/badge/235059535.svg)](https://zenodo.org/badge/latestdoi/235059535)

# ErrView: Error sets viewer and comparator

Implements methods from article "_Probabilistic performance estimators for computational chemistry methods: Systematic Improvement Probability and  Ranking Probability Matrix_" by P. Pernot and A. Savin

+ rank inversion probability
+ ranking uncertainty matrix
+ systematic improvement probability

## Data

Several datasets treated in the article are available [here](./data).
To use your own data, create a .csv file with the following columns:

* ""   : systems names or codes
* "Ref": reference data
* "M1" : results of first method (replace M1 by the actual name)
* ...
* "Mn" : results of the last method

## Run it on the cloud

Click on the badge

[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ppernot/ErrView/master?urlpath=rstudio)

## Test before install

A web interface to the code is also available online [here](http://upsa.shinyapps.io/ErrView).

