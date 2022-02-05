#' @export
sync <- function(tap, target, ...) UseMethod("sync")

#' @export
sync.python_tap <- function(tap, target, ...) sync__python_tap(target, tap, ...)

sync_python_tap <- function(target, tap, ...) UseMethod("sync_python_tap")

#' @export
sync_python_tap.python_target <- function(target, tap, ...) {

  assert_true(installed(target))
  assert_true(installed(tap))
  assert_true(discovered(tap))

  write_json(target$config, config_path(target))
  target.px <- process$new(
    command = bin_path(target),
    args    = c("--config", config_path(target)),
    stdin   = "|",
    stdout  = "|"
  )

  write_json(tap$catalog, catalog_path(tap))
  write_json(tap$config, config_path(tap))
  if (!is.null(tap$state)) write_json(tap$state, state_path(tap))
  run(
    command = bin_path(tap),
    echo = TRUE,
    args = c(
      "--config", config_path(tap),
      "--catalog", catalog_path(tap),
      if (!is.null(tap$state)) c("--state", state_path(tap))
    ),
    stdout_callback = function(out, proc) target.px$write_input(out)
  )

  close(target.px$get_input_connection())
  tap$state <- from_json(target.px$read_all_output())
  target.px$kill_tree()

  return(tap)

}
