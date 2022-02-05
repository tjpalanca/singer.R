# Constructor -------------------------------------------------------------

new_python_tap <- function(x, ..., class = character()) {
  new_tap(x, ..., class = c(class, "python_tap", "python"))
}

# Interface ---------------------------------------------------------------

catalog_path <- function(t) UseMethod("catalog_path")
state_path   <- function(t) UseMethod("state_path")
discovered   <- function(t) UseMethod("discovered")
discover     <- function(t) UseMethod("discover")
catalog      <- function(t) UseMethod("catalog")
invoke       <- function(t) UseMethod("invoke")

# Methods -----------------------------------------------------------------

#' @export
catalog_path.python_tap <- function(t) env_path(t, "catalog.json")

#' @export
state_path.python_tap <- function(t) env_path(t, "state.json")

#' @export
catalog.python_tap <- function(t) {
  write_json(t$config, config_path(t))
  run(
    command = bin_path(t),
    args    = c("--config", config_path(t), "--discover"),
    stderr  = NULL
  ) %$%
    stdout %>%
    from_json() %>%
    as_catalog()
}

#' @export
discovered.python_tap <- function(t) !is.null(t$catalog)

#' @export
discover.python_tap <- function(t) {
  assert_true(installed(t))
  inset2(t, "catalog", catalog(t))
}

#' @export
select.python_tap <- function(t, ...) {
  assert_true(discovered(t))
  reduce(
    list(...),
    ~inset2(.x, "catalog", select(.x$catalog, .y)),
    .init = t
  )
}



