#' @title Describe a data frame
#'
#' @description
#' `d` describes a data frame, just like the `d` command in Stata.
#'
#' @param df `df` should be a data frame.
#' `d` works best with labelled data frames (from the `haven` package).
#' @param compact `compact` should be logical.
#'
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

d = function(df, compact = TRUE) {
  if(!is.data.frame(df)) stop(substitute(df), " should be a data frame.")
  ddf = dplyr::data_frame(
    var = names(df),
    type = sapply(df, typeof),
    class = sapply(df, class),
    val_label = sapply(labelled::val_labels(df), is.not.null),
    label = meda.label(df),
    head = sapply(df, meda.head)
  )
  if (compact == TRUE) {
    ddf$type = abbreviate(ddf$type, 3)
    ddf$class = abbreviate(ddf$class, 3)
    ddf$head = substr(ddf$head, 1, 25)
    ddf
    }
  else {
    ddf
  }
}
