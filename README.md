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

cb(nlsw88) # show summary statistics of a data frame
#> Source: local data frame [17 x 8]
#> 
#>              var   obs unique    mean std.dev   min     max
#>            (chr) (int)  (int)   (dbl)   (dbl) (dbl)   (dbl)
#> 1         idcode  2246   2246 2612.65 1480.86  1.00 5159.00
#> 2            age  2246     13   39.15    3.06 34.00   46.00
#> 3           race  2246      3    1.28    0.48  1.00    3.00
#> 4        married  2246      2    0.64    0.48  0.00    1.00
#> 5  never_married  2246      2    0.10    0.31  0.00    1.00
#> 6          grade  2244     16   13.10    2.52  0.00   18.00
#> 7       collgrad  2246      2    0.24    0.43  0.00    1.00
#> 8          south  2246      2    0.42    0.49  0.00    1.00
#> 9           smsa  2246      2    0.70    0.46  0.00    1.00
#> 10        c_city  2246      2    0.29    0.45  0.00    1.00
#> 11      industry  2232     12    8.19    3.01  1.00   12.00
#> 12    occupation  2237     13    4.64    3.41  1.00   13.00
#> 13         union  1878      2    0.25    0.43  0.00    1.00
#> 14          wage  2246    967    7.77    5.76  1.00   40.75
#> 15         hours  2242     62   37.22   10.51  1.00   80.00
#> 16       ttl_exp  2246   1546   12.53    4.61  0.12   28.88
#> 17        tenure  2231    259    5.98    5.51  0.00   25.92
#> Variables not shown: var_label (chr)

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
