# __Statistics__ module

This is where tables of statistics are generated.

The statistics are bootstrapped to estimate uncertainty and
correlations.

__Note__: if global outliers have been selected in 
the `Outliers` module, they are removed from the datasets.
An alert arises when the displayed statistics are in
conflict with the outliers status.

## Controls

* `Choose stats` selector: list of statistics to be estimated

    + `MUE`: Mean Unsigned Error; arithmetic mean of the absolute errors
    
    + `Q95`, `Q95(HD)`: 95th quantile of the absolute errors; the
    HD version uses the Harrell-Davis estimator for quantiles [1]
    
    + `MSE`: Mean Signed Error; arithmetic mean of the errors
    
    + `Mode`: mode of the errors distribution
    
    + `RMSD`: Root Mean Squared Deviation; standard deviation of the errors
    
    + `MAD_SD`: robust estimator of the standard deviation of the errors
    using the median absolute deviation
    
    + `Skew`, `SkewGM`: skewness of the errors distribution; 
        
        - `Skew` uses the moments definition
        
        - `SkewGM` is a robust estimator based on quantiles [2]
    
    + `Kurt`, `KurtCS`: kurtosis of the errors distribution
    
        - `Kurt` uses the moments definition
        
        - `KurtCS` is a robust estimator of __excess__ kurtosis
        based on quantiles [2]

    + `W`: normality index an errors set by the Shapiro test
    
    + `Gini`: Gini coefficient of the absolute errors [3]
    
    + `GMCF`: Gini coefficient of the mode-centered absolute errors [3]
    
    + `LAC`: Lorenz Asymmetry Coefficient for absolute errors
    
    + `Pietra`: Pietra index of absolute errors

* `SIP analysis` adds Systematic Improvement Probability estimation
to the statistics: Mean SIP, SIP, Mean Gain, Mean Loss. 
See <a href = "11-sipmat.html">`SIP Mat`</A> and 
<a href = "12-deltaerr.html">`Delta |Err|`</A> modules for
graphical representations. [2]

* `Inversion Proba` add inversion probability estimation for the
relevant ranking statistics. The method with the smallest value of
the corresponding statistic is taken a reference for the inversion 
probability estimation.
See <a href = "10-ranking.html">`Ranking`</A> module for
a graphical representation. [2]

* `Correct Trend`: estimate the statistics after trend correction

    + `Trend degree`: degreee of the trend polynomial


* `Generate`: press this button to generate the statistics table

## References

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
distributions. _arXiv_ https://arxiv.org/abs/2012.09589

