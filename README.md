<!-- README.md is generated from README.Rmd. Please edit that file -->
About `meda`
============

This package provides R functions that replicates the behavior of four Stata commands: (1) `d`, (2) `lookfor`, (3) `codebook, compact`, and (4) `l, sepby()`. These commands present **me**ta**da**ta records for datasets in a cleaned way.

The package is built upon two R packages: `haven`, which provides a labelled class that supports labelled data frames, and `labelled`, which makes it easier to work with labelled data frames.

Installation
============

Since the `labelled` package is still not up on CRAN, we might also install it as well.

``` r
devtools::install_github("larmarange/labelled")
devtools::install_github("jjchern/meda")
```

Usage
=====

Describe and Look for Variables
-------------------------------

``` r
library(meda)
nlsw88 = haven::read_dta("http://www.stata-press.com/data/r13/nlsw88.dta")

d(nlsw88) # shows variable labels, and whether value label exists for certain variables
#> Source: local data frame [17 x 6]
#> 
#>              var  type class val_label                     label
#>            (chr) (chr) (chr)     (lgl)                     (chr)
#> 1         idcode   int   int     FALSE                    NLS id
#> 2            age   int   int     FALSE       age in current year
#> 3           race   int   lbl      TRUE                      race
#> 4        married   int   lbl      TRUE                   married
#> 5  never_married   int   int     FALSE             never married
#> 6          grade   int   int     FALSE current grade complete...
#> 7       collgrad   int   lbl      TRUE          college graduate
#> 8          south   int   int     FALSE            lives in south
#> 9           smsa   int   lbl      TRUE             lives in SMSA
#> 10        c_city   int   int     FALSE  lives in central city...
#> 11      industry   int   lbl      TRUE                  industry
#> 12    occupation   int   lbl      TRUE                occupation
#> 13         union   int   lbl      TRUE              union worker
#> 14          wage   dbl   nmr     FALSE               hourly wage
#> 15         hours   int   int     FALSE        usual hours worked
#> 16       ttl_exp   dbl   nmr     FALSE  total work experience...
#> 17        tenure   dbl   nmr     FALSE        job tenure (years)
#> Variables not shown: head (chr)

# Note that there's a value label for the variable "race", thus we can checkout the values
labelled::val_labels(nlsw88$race)
#> white black other 
#>     1     2     3

# Note also that if a variable label is too long, we can find out the whole label with
labelled::var_label(nlsw88$grade)
#> [1] "current grade completed"

# Or look at all the variable labels
labelled::var_label(nlsw88)
#> $idcode
#> [1] "NLS id"
#> 
#> $age
#> [1] "age in current year"
#> 
#> $race
#> [1] "race"
#> 
#> $married
#> [1] "married"
#> 
#> $never_married
#> [1] "never married"
#> 
#> $grade
#> [1] "current grade completed"
#> 
#> $collgrad
#> [1] "college graduate"
#> 
#> $south
#> [1] "lives in south"
#> 
#> $smsa
#> [1] "lives in SMSA"
#> 
#> $c_city
#> [1] "lives in central city"
#> 
#> $industry
#> [1] "industry"
#> 
#> $occupation
#> [1] "occupation"
#> 
#> $union
#> [1] "union worker"
#> 
#> $wage
#> [1] "hourly wage"
#> 
#> $hours
#> [1] "usual hours worked"
#> 
#> $ttl_exp
#> [1] "total work experience"
#> 
#> $tenure
#> [1] "job tenure (years)"

lookfor(nlsw88, "mar") # search for variables that are related to marriage
#> Source: local data frame [2 x 6]
#> 
#>             var  type class val_label         label         head
#>           (chr) (chr) (chr)     (lgl)         (chr)        (chr)
#> 1       married   int   lbl      TRUE       married 0 0 0 1 1...
#> 2 never_married   int   int     FALSE never married 0 0 1 0 0...
```

List Observations and Separated by Some ID Variable
---------------------------------------------------

``` r
library(dplyr)
abdata = haven::read_dta("http://www.stata-press.com/data/r13/abdata.dta")
abdata %>% select(id, year, wage) %>% l(by = "id", n = 30)
#>    id year             wage
#> 1   1 1977 13.1515998840332
#> 2   1 1978 12.3017997741699
#> 3   1 1979 12.8395004272461
#> 4   1 1980 13.8038997650146
#> 5   1 1981 14.2896995544434
#> 6   1 1982 14.8681001663208
#> 7   1 1983 13.7784004211426
#> 8                          
#> 9   2 1977 14.7909002304077
#> 10  2 1978 14.1035995483398
#> 11  2 1979 14.9533996582031
#> 12  2 1980 15.4910001754761
#> 13  2 1981 16.1968994140625
#> 14  2 1982 16.1313991546631
#> 15  2 1983 16.3050994873047
#> 16                         
#> 17  3 1977 22.6919994354248
#> 18  3 1978 20.6937999725342
#> 19  3 1979 21.2047996520996
#> 20  3 1980   22.19700050354
#> 21  3 1981 24.8714008331299
#> 22  3 1982 24.8446998596191
#> 23  3 1983 28.9076995849609
#> 24                         
#> 25  4 1977 14.8283004760742
#> 26  4 1978 14.8379001617432
#> 27  4 1979  14.875599861145
#> 28  4 1980 15.2332000732422
#> 29  4 1981 17.2528991699219
#> 30  4 1982 19.3141994476318
```
