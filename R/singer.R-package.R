#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom checkmate assert_character
#' @importFrom checkmate assert_class
#' @importFrom checkmate assert_list
#' @importFrom checkmate assert_posixct
#' @importFrom checkmate assert_string
#' @importFrom dplyr filter
#' @importFrom fs path
#' @importFrom glue glue
#' @importFrom jsonlite fromJSON
#' @importFrom magrittr %>%
#' @importFrom magrittr %$%
#' @importFrom magrittr set_attr
#' @importFrom processx run
#' @importFrom purrr map
#' @importFrom reticulate virtualenv_create
#' @importFrom reticulate virtualenv_exists
#' @importFrom reticulate virtualenv_install
#' @importFrom reticulate virtualenv_python
#' @importFrom reticulate virtualenv_remove
#' @importFrom tibble as_tibble
## usethis namespace: end
NULL

new_object <- function(x, ..., class = character()) {
    structure(x, ..., class = c(class, "singer"))
}

pkg_name <- function() "singer.R"

pkg_data_dir <- function(...) {
    path(tools::R_user_dir(pkg_name()), ...)
}
