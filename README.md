[![DOI](https://zenodo.org/badge/235059535.svg)](https://zenodo.org/badge/latestdoi/235059535)

# ErrView: Error sets viewer and comparator

Implements methods from the following articles:

1. P. Pernot and A. Savin (2018) Probabilistic performance estimators 
for computational chemistry methods: The empirical cumulative distribution 
function of absolute errors. _J. Chem. Phys._ __148__:241707.
https://doi.org/10.1063/1.5016248

2. P. Pernot and A. Savin (2020) Probabilistic performance estimators for
computational chemistry methods: Systematic Improvement Probability and 
Ranking Probability Matrix. I. Theory. _J. Chem. Phys._ __152__:164108. 
http://dx.doi.org/10.1063/5.0006202

3. P. Pernot and A. Savin (2021) Using the Gini coefficient 
to characterize the shape of computational chemistry error 
distributions. _Theor. Chem. Acc._ __140__:24 https://doi.org/10.1007/s00214-021-02725-0 ; https://arxiv.org/abs/2012.09589

Please cite these articles if you use the code.

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

Predefined datasets are availble directly on the server.

__Warning !__ This version runs on a server with limited memory. 
It will handle only small datasets. Running out of memory will generate 
a message "Error: An error has occurred. Check your logs or contact 
the app author for clarification." 
__Sorry, there is nothing the author can do for you.__
Please try the `binder` method (see above) of install the code.

