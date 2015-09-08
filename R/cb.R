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
