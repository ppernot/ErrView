# __Ranking__ module

Plot ranking probability matrices [1].

## Controls
 
* `Plot type`: 

    + `Levels`: plot a color-coded matrix
    
    + `CI`: plot 95% confidence intervals of the ranks

* `Statistic`: select ranking statistic (MUE, Q95 or MSIP)

* `Bootstrap M/N`: test of M-out of-N bootstrap sampling
  to avoid uncertainty underestimation [2].
  The value 1 corresponds to M = N.

* `Label size`: adjust methods label size in plot


## Plot

Plot of the ranking probability matrix.

## References

1. P. Pernot and A. Savin (2020) Probabilistic performance estimators for
computational chemistry methods: Systematic Improvement Probability and 
Ranking Probability Matrix. I. Theory. _J. Chem. Phys._ __152__:164108. 
(http://dx.doi.org/10.1063/5.0006202)

2. P. Hall, H. Miller et al. (2009) Using the bootstrap to quantify 
the authority of an empirical ranking. _Ann. Stat._ __37__:3929–3959. (https://doi.org/10.1214/09-AOS699)
