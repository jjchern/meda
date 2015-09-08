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
