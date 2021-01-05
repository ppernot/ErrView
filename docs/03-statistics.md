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
    HD version uses the Harrell-Davis estimator for quantiles
    
    + `MSE`: Mean Signed Error; arithmetic mean of the errors
    
    + `Mode`: mode of the errors distribution
    
    + `RMSD`: Root Mean Squared Deviation; standard deviation of the errors
    
    + `MAD_SD`: robust estimator of the standard deviation of the errors
    using the median absolute deviation
    
    + `Skew`, `SkewGM`: skewness of the errors distribution; 
        
        - `Skew` uses the moments definition
        
        - `SkewGM` is a robust estimator based on quantiles
    
    + `Kurt`, `KurtCS`: kurtosis of the errors distribution
    
        - `Kurt` uses the moments definition
        
        - `KurtCS` is a robust estimator of __excess__ kurtosis
        based on quantiles

    + `W`: normality index an errors set by the Shapiro test
    
    + `Gini`: Gini coefficient of the absolute errors
    
    + `GMCF`: Gini coefficient of the mode-centered absolute errors
    
    + `LAC`: Lorenz Asymmetry Coefficient for absolute errors
    
    + `Pietra`: Pietra index of absolute errors

* `SIP analysis` adds Systematic Improvement Probability estimation
to the statistics: Mean SIP, SIP, Mean Gain, Mean Loss. 
See <a href = "11-sipmat.html">`SIP Mat`</A> and 
<a href = "12-deltaerr.html">`Delta |Err|`</A> modules for
graphical representations.

* `Inversion Proba` add inversion probability estimation for the
relevant ranking statistics. The method with the smallest value of
the corresponding statistic is taken a reference for the inversion 
probability estimation.
See <a href = "10-ranking.html">`Ranking`</A> module for
a graphical representation.

* `Correct Trend`: estimate the statistics after trend correction

    + `Trend degree`: degreee of the trend polynomial


* `Generate`: press this button to generate the statistics table