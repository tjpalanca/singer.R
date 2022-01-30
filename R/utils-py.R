pip_list <- function(envname) {
  run(
    command = virtualenv_python(envname),
    args    = c("-m", "pip", "list", "--format", "json"),
    stdout  = "|",
    stderr  = NULL
  ) %$% stdout %>%
    fromJSON() %>%
    as_tibble()
}
