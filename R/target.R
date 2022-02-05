# Constructor -------------------------------------------------------------

new_target <- function(x, ..., class = character()) {
  new_object(x, ..., class = c(class, "target"))
}
