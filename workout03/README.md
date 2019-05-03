
Overview
--------

The goal of this `"binomial"` [R](http://www.r-project.org/) package is to provide functions for computing binomial distribution measures and probabilites.

-   `bin_choose()` using factorial to caculate the number combinations in which successes an occur in trials.

-   `bin_probability()` it takes three arguemnts sucess, trials, and prob to calculate bionomial probability of success in a given trial and given probability.

-   `bin_distribution()` it takes two aruments trials & prob to calculate the probability distribution of success in a given trial and given probability. Returns a `"bindis"` object which is a `data.frame`.

-   `bin_distribution()` it takes two aruments trials & prob and calculates the cumulated probability of each trial. Returns a `"bincum"` object which is a `data.frame`.

-   `plot()` method for a `"bindis"` or `"bincum"` object to plot the distribution.

-   `bin_variable()` it takes two aruments trials & prob and calculates an object of class caled "binvar" which is a binomial random variable object and creates a binomial variable object of class `"binvar"`

-   `summary()` method for a `"binvar"` object.

Given number of trials and probability of success:

-   `bin_mean()` computes the mean.
-   `bin_variance()` computes the variance.
-   `bin_mode()` computes the mode.
-   `bin_skewness()` computes the skewness.
-   `bin_kurtosis()` computes the kurtosis.

Motivation
----------

This package has been developed to illustrate some of the concepts behind the creation of an R package.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("/stat133-sp19/hw-stat133-azizidunia/binomial")

# install "binomial" (with vignettes)
devtools::install_github("/stat133-sp19/hw-stat133-azizidunia/binomial", build_vignettes = TRUE)
```

Usage
-----

``` r
#call the binomial pacakge with library()
library(binomial)

# binomial random variable
bin_var <- bin_variable(trials = 7,prob = 0.2)
bin_var
#> "Binomial variable"
#> 
#> Paramaters
#>  - number of trials:  7
#>  - prob of success :  0.2

# binomial probability
bin_prb <- bin_probability(success = 4, trials = 7, prob = 0.2)
bin_prb
#> [1] 0.028672

# binomial distribution
bin_dist <- bin_distribution(trials = 7, prob = 0.2)
bin_dist
#>   success probability
#> 1       0   0.2097152
#> 2       1   0.3670016
#> 3       2   0.2752512
#> 4       3   0.1146880
#> 5       4   0.0286720
#> 6       5   0.0043008
#> 7       6   0.0003584
#> 8       7   0.0000128

# plotting binomial ditribution
plot(bin_dist)
```

![](README-unnamed-chunk-2-1.png)

``` r

# binomial cumulative distribution
bin_cum <- bin_cumulative(7, 0.2)
bin_cum 
#>   success probability cumulative
#> 1       0   0.2097152  0.2097152
#> 2       1   0.3670016  0.5767168
#> 3       2   0.2752512  0.8519680
#> 4       3   0.1146880  0.9666560
#> 5       4   0.0286720  0.9953280
#> 6       5   0.0043008  0.9996288
#> 7       6   0.0003584  0.9999872
#> 8       7   0.0000128  1.0000000

# plotting binomial cumulative distribution
plot(bin_cum )
```

![](README-unnamed-chunk-2-2.png)

``` r

# binomial random variable summary statistics
summary(bin_var)
#> "Summary Binomial"
#> 
#> Paramaters
#>  - number of trials:  7
#>  - prob of success :  0.2
#> 
#> Measures
#>  - mean:       1.4
#>  - variance :  1.12
#>  - mode:       1
#>  - skewness :  0.5669467
#>  - kurtosis :  0.03571429

# summary measures
bin_mean(2, 0.2)
#> [1] 0.4
bin_variance(2, 0.2)
#> [1] 0.32
bin_mode(2, 0.2)
#> [1] 0
bin_skewnees(2, 0.2)
#> [1] 1.06066
bin_kurtosis(2, 0.2)
#> [1] 0.125
```
