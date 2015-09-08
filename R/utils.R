is.not.null = function(x) ! is.null(x)

meda.label = function(df){
  label = labelled::var_label(df)
  label[sapply(label, is.null)] = NA
  label = unlist(label)
  label
}

meda.mean = function(x){
  if (is.character(x)) NA
  else round(mean(x, na.rm = TRUE), digits = 2)
}

meda.min = function(x){
  if (is.character(x)) NA
  else round(min(x, na.rm = TRUE), digits = 2)
}

meda.max = function(x){
  if (is.character(x)) NA
  else round(max(x, na.rm = TRUE), digits = 2)
}

meda.sd = function(x) {
  if (is.character(x)) NA
  else round(sd(x, na.rm = TRUE), digits = 2)
}

meda.head = function(x) {
  paste(head(x, 5), collapse = " ")
}
