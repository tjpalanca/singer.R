#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom checkmate assert_character
#' @importFrom checkmate assert_choice
#' @importFrom checkmate assert_class
#' @importFrom checkmate assert_flag
#' @importFrom checkmate assert_list
#' @importFrom checkmate assert_posixct
#' @importFrom checkmate assert_string
#' @importFrom checkmate assert_true
#' @importFrom dplyr filter
#' @importFrom fs path
#' @importFrom glue glue
#' @importFrom jsonvalidate json_validator
#' @importFrom lubridate as_datetime
#' @importFrom magrittr %<>%
#' @importFrom magrittr %>%
#' @importFrom magrittr %$%
#' @importFrom magrittr inset2
#' @importFrom magrittr set_attr
#' @importFrom processx process
#' @importFrom processx run
#' @importFrom purrr assign_in
#' @importFrom purrr detect
#' @importFrom purrr detect_index
#' @importFrom purrr discard
#' @importFrom purrr imap
#' @importFrom purrr list_modify
#' @importFrom purrr map
#' @importFrom purrr map_chr
#' @importFrom purrr map_lgl
#' @importFrom purrr modify_if
#' @importFrom purrr modify_in
#' @importFrom purrr reduce
#' @importFrom purrr walk
#' @importFrom reticulate virtualenv_create
#' @importFrom reticulate virtualenv_exists
#' @importFrom reticulate virtualenv_install
#' @importFrom reticulate virtualenv_python
#' @importFrom reticulate virtualenv_remove
#' @importFrom rlang %||%
#' @importFrom rlang abort
#' @importFrom tibble as_tibble
#' @importFrom tools R_user_dir
## usethis namespace: end
NULL

pkg_name <- function() "singer.R"

pkg_data_dir <- function(...) {
  path(R_user_dir(pkg_name()), ...)
}
