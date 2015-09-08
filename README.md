<!-- README.md is generated from README.Rmd. Please edit that file -->
About
=====

When I switches from Stata to R, there're three commands in Stata that I missed most: - `d`, that is, `describe` - `lookfor` - `codebook, compact`

These commands present \_\_me\_\_ta\_\_da\_\_ta records for datasets in a cleaned way.

This package provides R functions that replicates the behavior of these commands. The package is built upon two R packages: `haven`, which provides a labelled class that supports labelled data frames, and `labelled`, which makes it easier to work with labelled data frames.

Installation
============

Since the `labelled` package is still not up on CRAN, we might also install it as well.

    devtools::install_github("larmarange/labelled")
    devtools::install_github("jjchern/meta")
