# Constructor -------------------------------------------------------------

new_tap <- function(x, ..., class = character()) {
  assert_list(x)
  new_object(x, ..., class = c(class, "tap"))
}
