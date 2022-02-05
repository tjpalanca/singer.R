target_csv <- function(delimiter = NULL,
                       quotechar = NULL,
                       destination_path = NULL) {
  new_python_target(
    list(
      config = list(
        delimiter = assert_choice(delimiter, c("\t", ","), null.ok = TRUE),
        quotechar = assert_choice(quotechar, c("'", "\""), null.ok = TRUE),
        destination_path = assert_string(destination_path, null.ok = TRUE)
      ) %>%
        discard(is.null)
    ),
    class = "target_csv"
  )
}

#' @export
env_name.target_csv <- function(t) "target_csv"

#' @export
pip_name.target_csv <- function(t) "target-csv"

#' @export
pip_vers.target_csv <- function(t) "0.3.3"

#' @export
pip_path.target_csv <- function(t)
  "git+https://github.com/hotgluexyz/target-csv.git@0.3.3"
