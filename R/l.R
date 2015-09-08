#' @title List observations
#'
#' @description
#' `l` lists observations in a data frame, just like the `l` command in Stata.
#'
#' @param df `df` should be a data frame.
#' @param by `by` should be a string indicating variables in the data frame.
#' @param n `n` should be a positive integer.
#'
#' @return `l(df)` returns a data frame.
#'
#' @examples
#' library(dplyr)
#' abdata = haven::read_dta("http://www.stata-press.com/data/r13/abdata.dta")
#' abdata %>% select(id, year, wage) %>% l("id", n = 30)
#'
#' @export

l = function(df, by = NULL, n = 20) {
  if(!is.data.frame(df)) stop(substitute(df), " should be a data frame.")

  if (is.null(by)) df
  else {
    breaks = rep("---", ncol(df))
    df_list = split(df, df[by], drop = TRUE)
    df_list = lapply(df_list, t)
    df_list = lapply(df_list, function(x) cbind(x, breaks))
    df_list = lapply(df_list, t)
    ldf = do.call(rbind, df_list)
    ldf = data.frame(ldf, row.names = NULL, stringsAsFactors = FALSE)
    head(ldf, n = n)
  }
}
