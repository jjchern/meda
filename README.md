<!-- README.md is generated from README.Rmd. Please edit that file -->
About `meda`
============

This package provides R functions that replicates the behavior of three Stata commands: (1) `d`, that is, `describe`, (2) `lookfor`, and (3) `codebook, compact`. These commands present **me**ta**da**ta records for datasets in a cleaned way.

The package is built upon two R packages: `haven`, which provides a labelled class that supports labelled data frames, and `labelled`, which makes it easier to work with labelled data frames.

Installation
============

Since the `labelled` package is still not up on CRAN, we might also install it as well.

    devtools::install_github("larmarange/labelled")
    devtools::install_github("jjchern/meta")

Usage
=====

``` r
library(meda)
nlsw88 = haven::read_dta("http://www.stata-press.com/data/r13/nlsw88.dta")

d(nlsw88) # shows variable names, variable labels, and whether value label exists for certain variables
#> Source: local data frame [17 x 5]
#> 
#>              var var_type var_class val_label               var_label
#>            (chr)    (chr)     (chr)     (lgl)                   (chr)
#> 1         idcode  integer   integer     FALSE                  NLS id
#> 2            age  integer   integer     FALSE     age in current year
#> 3           race  integer  labelled      TRUE                    race
#> 4        married  integer  labelled      TRUE                 married
#> 5  never_married  integer   integer     FALSE           never married
#> 6          grade  integer   integer     FALSE current grade completed
#> 7       collgrad  integer  labelled      TRUE        college graduate
#> 8          south  integer   integer     FALSE          lives in south
#> 9           smsa  integer  labelled      TRUE           lives in SMSA
#> 10        c_city  integer   integer     FALSE   lives in central city
#> 11      industry  integer  labelled      TRUE                industry
#> 12    occupation  integer  labelled      TRUE              occupation
#> 13         union  integer  labelled      TRUE            union worker
#> 14          wage   double   numeric     FALSE             hourly wage
#> 15         hours  integer   integer     FALSE      usual hours worked
#> 16       ttl_exp   double   numeric     FALSE   total work experience
#> 17        tenure   double   numeric     FALSE      job tenure (years)

# Note that there's a value label for the variable "race", thus we can checkout the values
labelled::val_labels(nlsw88$race)
#> white black other 
#>     1     2     3

lookfor(nlsw88, "mar") # search for variables that are related to marriage
#> Source: local data frame [2 x 5]
#> 
#>             var var_type var_class val_label     var_label
#>           (chr)    (chr)     (chr)     (lgl)         (chr)
#> 1       married  integer  labelled      TRUE       married
#> 2 never_married  integer   integer     FALSE never married
```
