new_metadata <- function(x, ..., class = character()) {
  assert_list(x)
  x$breadcrumb <- assert_character(as.character(x$breadcrumb))
  assert_list(x$metadata, names = "named")
  new_object(x, ..., class = c(class, "metadata"))
}
