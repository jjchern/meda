#' @title Describe a data frame
#'
#' @description
#' `d` describes a data frame, just like the `d` command in Stata.
#'
#' @param df `df` should be a data frame.
#' `d` works best with labelled data frames (from the `haven` package).
#' @return `d(df)` returns a data frame that contains metadata records
#' for the dataset.
#'
#' @importFrom dplyr data_frame
#' @import labelled
#'
#' @examples
#' nlsw88 = haven::read_dta("http://www.stata-press.com/data/r13/nlsw88.dta")
#' d(nlsw88)
#'
#' @export

d = function(df) {
  if(!is.data.frame(df)) stop(substitute(df), " should be a data frame.")
  ddf = dplyr::data_frame(
    var = names(df),
    var_type = sapply(df, typeof),
    var_class = sapply(df, class),
    val_label = sapply(labelled::val_labels(df), is.not.null),
    var_label = meda.label(df)
  )
  ddf
}
