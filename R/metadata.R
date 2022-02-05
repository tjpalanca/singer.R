# Constructor -------------------------------------------------------------

new_metadata <- function(x, ..., class = character()) {
  assert_list(x)
  assert_character(x$breadcrumb)
  assert_list(x$metadata, names = "named")
  new_object(x, ..., class = c(class, "metadata"))
}

# Conversion --------------------------------------------------------------

as_metadata <- function(x) UseMethod("as_metadata")

#' @export
as_metadata.list <- function(x) {
  x$breadcrumb <- I(as.character(x$breadcrumb))
  for (m in single_metadata(x)) x$metadata[[m]] <- I(x$metadata[[m]])
  new_metadata(x)
}

# Utilities ---------------------------------------------------------------

single_metadata <- function(x) {
  intersect(
    names(x$metadata),
    c("table-key-properties", "valid-replication-keys", "view-key-properties")
  )
}

