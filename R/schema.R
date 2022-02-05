# Constructor -------------------------------------------------------------

new_schema <- function(x, ..., class = character()) {
  assert_list(x)
  new_object(x, ..., class = c(class, "schema"))
}

# Conversion --------------------------------------------------------------

as_schema <- function(x) UseMethod("as_schema")

#' @export
as_schema.list <- function(x) new_schema(x)
