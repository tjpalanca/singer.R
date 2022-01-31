new_catalog <- function(x, ..., class = character()) {
  assert_list(x)
  x$streams <- assert_list(map(x$streams, new_stream), types = "stream")
  new_object(x, ..., class = c(class, "catalog"))
}
