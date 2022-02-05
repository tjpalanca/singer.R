#' List installed `pip` packages
pip_list <- function(python) {
  run(
    command = python,
    args    = c("-m", "pip", "list", "--format", "json"),
    stdout  = "|",
    stderr  = NULL
  ) %$% stdout %>%
    from_json(simplify = TRUE) %>%
    as_tibble()
}
