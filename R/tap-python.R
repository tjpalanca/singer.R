new_python_tap <- function(x, ..., class = character()) {
  new_tap(x, ..., class = c(class, "python_tap"))
}

env_name <- \(t) UseMethod("env_name")
pip_name <- \(t) UseMethod("pip_name")
pip_vers <- \(t) UseMethod("pip_vers")
bin_name <- \(t) UseMethod("bin_name")
env_path <- \(t, ...) UseMethod("env_path")
bin_path <- \(t) UseMethod("bin_path")
pip_path <- \(t) UseMethod("pip_path")

#' @export
bin_name.python_tap <- \(t) pip_name(t)

#' @export
pip_path.python_tap <- \(t) paste0(pip_name(t), "==", pip_vers(t))

#' @export
env_path.python_tap <- \(t, ...) pkg_data_dir("virtualenvs", env_name(t), ...)

#' @export
bin_path.python_tap <- \(t) env_path(t, "bin", bin_name(t))

#' @export
install.python_tap <- function(t, force = FALSE) {
  if (!is_installed(t) & !force) {
    virtualenv_create(env_path(t))
    virtualenv_install(env_path(t), pip_path(t), ignore_installed = !force)
  }
}

#' @export
is_installed.python_tap <- function(t) {
  env_exists <- virtualenv_exists(env_path(t))
  if (env_exists) {
    installed <- filter(
      pip_list(virtualenv_python(env_path(t))),
      name == !!pip_name(t)
    )
    return((nrow(installed) == 1) && (installed$version == pip_vers(t)))
  } else {
    return(FALSE)
  }
}

#' @export
uninstall.python_tap <- function(t) virtualenv_remove(env_path(t))

