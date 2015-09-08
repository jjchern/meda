<!-- README.md is generated from README.Rmd. Please edit that file -->
About `meda`
============

This package provides R functions that replicates the behavior of three Stata commands: (1) `d`, that is, `describe`, (2) `lookfor`, and (3) `codebook, compact`. These commands present **me**ta**da**ta records for datasets in a cleaned way.

The package is built upon two R packages: `haven`, which provides a labelled class that supports labelled data frames, and `labelled`, which makes it easier to work with labelled data frames.

Installation
============

Since the `labelled` package is still not up on CRAN, we might also install it as well.

    devtools::install_github("larmarange/labelled")
    devtools::install_github("jjchern/meda")

Usage
=====

``` r
library(meda)
nlsw88 = haven::read_dta("http://www.stata-press.com/data/r13/nlsw88.dta")

d(nlsw88) # shows variable labels, and whether value label exists for certain variables
#> Source: local data frame [17 x 6]
#> 
#>              var  type class val_label                   label
#>            (chr) (chr) (chr)     (lgl)                   (chr)
#> 1         idcode   int   int     FALSE                  NLS id
#> 2            age   int   int     FALSE     age in current year
#> 3           race   int   lbl      TRUE                    race
#> 4        married   int   lbl      TRUE                 married
#> 5  never_married   int   int     FALSE           never married
#> 6          grade   int   int     FALSE current grade completed
#> 7       collgrad   int   lbl      TRUE        college graduate
#> 8          south   int   int     FALSE          lives in south
#> 9           smsa   int   lbl      TRUE           lives in SMSA
#> 10        c_city   int   int     FALSE   lives in central city
#> 11      industry   int   lbl      TRUE                industry
#> 12    occupation   int   lbl      TRUE              occupation
#> 13         union   int   lbl      TRUE            union worker
#> 14          wage   dbl   nmr     FALSE             hourly wage
#> 15         hours   int   int     FALSE      usual hours worked
#> 16       ttl_exp   dbl   nmr     FALSE   total work experience
#> 17        tenure   dbl   nmr     FALSE      job tenure (years)
#> Variables not shown: head (chr)

# Note that there's a value label for the variable "race", thus we can checkout the values
labelled::val_labels(nlsw88$race)
#> white black other 
#>     1     2     3

lookfor(nlsw88, "mar") # search for variables that are related to marriage
#> Source: local data frame [2 x 6]
#> 
#>             var  type class val_label         label      head
#>           (chr) (chr) (chr)     (lgl)         (chr)     (chr)
#> 1       married   int   lbl      TRUE       married 0 0 0 1 1
#> 2 never_married   int   int     FALSE never married 0 0 1 0 0
```
