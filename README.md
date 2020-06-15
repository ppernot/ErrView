[![DOI](https://zenodo.org/badge/235059535.svg)](https://zenodo.org/badge/latestdoi/235059535)

# ErrView: Error sets viewer and comparator

Implements methods from article "_Probabilistic performance estimators for computational chemistry methods: Systematic Improvement Probability and  Ranking Probability Matrix. I. Theory_" by P. Pernot and A. Savin  (2020) [_J. Chem. Phys._ __152__:164108.](http://dx.doi.org/10.1063/5.0006202). Please cite this article if you use the code.

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

[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ppernot/ErrView/master?urlpath=rstudio)

1. Click on the `binder` badge above: this will open a Rstudio session in your browser

2. Select `server.R` in the `Files` panel of Rstudio

3. Click on `Run App`

4. Enjoy !

If you want to use the predefined datasets, 
you will have to download them first from
[here](https://github.com/ppernot/ErrView/tree/master/data).

## Test before install

A web interface to the code is also available online 
[here](http://upsa.shinyapps.io/ErrView).

In thise case, the datasets are availble directly on the server.

