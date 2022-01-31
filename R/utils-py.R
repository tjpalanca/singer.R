#' List installed `pip` packages
pip_list <- function(python) {
  run(
    command = python,
    args    = c("-m", "pip", "list", "--format", "json"),
    stdout  = "|",
    stderr  = NULL
  ) %$% stdout %>%
    fromJSON() %>%
    as_tibble()
}
