#' @title Look For Variables
#'
#' @description
#' `lookfor` searches for string in variable names and labels,
#' just like the `lookfor` command in Stata.
#'
#' @param df The input `df` should be a data frame.
#' `lookfor` works best with labelled data frames (from the `haven` package).
#'
#' @param kw The keyword to search, `kw`, should be a string of length 1.
#'
#' @return `lookfor(df, kw)` returns a data frame that contains rows which
#' match the keyword being searched.
#'
#' @importFrom dplyr data_frame
#' @import labelled
#'
#' @examples
#' nlsw88 = haven::read_dta("http://www.stata-press.com/data/r13/nlsw88.dta")
#' lookfor(nlsw88, "mar") # search for variables that are related to marriage
#'
#' @export

lookfor = function(df, kw) {
  if(!is.data.frame(df)) stop(substitute(df), " should be a data frame.")
  if(!is.character(kw)) stop(substitute(kw), " shoule be a string.")
  if(length(kw) != 1) stop(substitute(kw), " should has length 1")
  ddf = d(df)
  ldf = ddf[grepl(kw, ddf$var, ignore.case = TRUE) | grepl(kw, ddf$var_label, ignore.case = TRUE), ]
  if(nrow(ldf)) ldf else message("Sorry, nothing found.")
}
