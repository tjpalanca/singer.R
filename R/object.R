# Constructor -------------------------------------------------------------

new_object <- function(x = list(), ..., class = character()) {
  assert_list(x)
  structure(x, ..., class = c(class, "singer", "list"))
}
