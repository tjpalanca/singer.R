# Catalog -----------------------------------------------------------------

new_catalog <- function(x, ..., class = character()) {
  assert_list(x)
  assert_list(x$streams, types = "stream")
  new_object(x, ..., class = c(class, "catalog"))
}

# Coercion ----------------------------------------------------------------

as_catalog <- function(x) UseMethod("as_catalog")

#' @export
as_catalog.list <- function(x) {
  x$streams <- map(x$streams, as_stream)
  new_catalog(x)
}

#' @export
as_catalog.character <- function(x) {
  as_catalog(from_json(x))
}

# Methods -----------------------------------------------------------------

#' @export
select.catalog <- function(x, tap_stream_id) {
  assert_choice(tap_stream_id, map_chr(x$streams, "tap_stream_id"))
  modify_in(
    x,
    "streams",
    ~modify_if(., ~.$tap_stream_id == tap_stream_id, select)
  )
}
