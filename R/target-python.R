# Constructor -------------------------------------------------------------

new_python_target <- function(x, ..., class = character()) {
  new_target(x, ..., class = c(class, "python_target", "python"))
}
