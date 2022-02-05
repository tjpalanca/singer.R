# Constructor -------------------------------------------------------------

new_stream <- function(x, ..., class = character()) {
  assert_list(x)
  assert_string(x$stream)
  assert_string(x$tap_stream_id)
  assert_class(x$schema, "schema")
  assert_list(x$metadata, types = "metadata")
  assert_character(x$key_properties)
  new_object(x, ..., class = c(class, "stream"))
}

# Conversion --------------------------------------------------------------

as_stream <- function(x) UseMethod("as_stream")

#' @export
as_stream.list <- function(x) {
  x$schema <- as_schema(x$schema)
  x$metadata <- map(x$metadata, as_metadata)
  x$key_properties <- as.character(x$key_properties)
  new_stream(x)
}

# Methods -----------------------------------------------------------------

select <- function(x, ...) UseMethod("select")

#' @export
select.stream <- function(x, ...) {
  top_level <- detect_index(x$metadata, ~length(.$breadcrumb) == 0)
  if (top_level > 0) {
    modify_in(
      x, list("metadata", top_level, "metadata"),
      list_modify, selected = TRUE
    )
  } else {
    assign_in(
      x, "metadata",
      new_metadata(list(
        breadcrumb = character(0),
        metadata = list(selected = TRUE)
      ))
    )
  }
}
