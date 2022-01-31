new_stream <- function(x, ..., class = character()) {
  assert_list(x)
  assert_string(x$stream)
  assert_string(x$tap_stream_id)
  x$schema <- assert_class(new_schema(x$schema), "schema")
  x$metadata <- assert_list(map(x$metadata, new_metadata), types = "metadata")
  assert_character(x$key_properties)
  new_object(x, ..., class = c(class, "stream"))
}
