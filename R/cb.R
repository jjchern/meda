#' @title Codebook
#'
#' @description
#' `cb` provides summary statistics of a data frame,
#' just like the `codebook, compact` command in Stata.
#'
#' @param df `df` should be a data frame.
#'
#' @return `cb(df)` returns a data frame.
#'
#' @import dplyr
#'
#' @examples
#' library(dplyr)
#' abdata = haven::read_dta("http://www.stata-press.com/data/r13/abdata.dta")
#' cb(nlsw88)
#'
#' @export

cb =function(df) {
  if(!is.data.frame(df)) stop(substitute(df), " should be a data frame.")
  cdf = dplyr::data_frame(
    var = names(df),
    obs = sapply(df, function(x) sum(!is.na(x))),
    unique = sapply(df, function(x) length(unique(na.omit(x)))),
    mean = sapply(df, meda.mean),
    std.dev = sapply(df, meda.sd),
    min = sapply(df, meda.min),
    max = sapply(df, meda.max),
    var_label = meda.label(df)
  )
  cdf
}
