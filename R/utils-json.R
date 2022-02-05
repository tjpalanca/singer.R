write_json <- function(x, file, ...) {
  readr::write_file(to_json(x, ...), file)
}

from_json <- function(x, simplify = FALSE, ...) {
  jsonlite::fromJSON(x, simplifyVector = simplify, ...)
}

to_json <- function(x, ...) {
  jsonlite::toJSON(
    x,
    POSIXt = "ISO8601",
    pretty = TRUE,
    # force = TRUE,
    auto_unbox = TRUE,
    null = "null",
    ...
  )
}

