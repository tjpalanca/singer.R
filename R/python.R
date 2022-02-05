# Interface ---------------------------------------------------------------

env_name <- function(t) UseMethod("env_name")
pip_name <- function(t) UseMethod("pip_name")
pip_vers <- function(t) UseMethod("pip_vers")
bin_name <- function(t) UseMethod("bin_name")
env_path <- function(t, ...) UseMethod("env_path")
bin_path <- function(t) UseMethod("bin_path")
pip_path <- function(t) UseMethod("pip_path")

config_path <- function(t) UseMethod("config_path")

installed <- function(t, ...) UseMethod("installed")
install   <- function(t, ...) UseMethod("install")
uninstall <- function(t, ...) UseMethod("uninstall")

#' @export
bin_name.python <- function(t) pip_name(t)

#' @export
pip_path.python <- function(t) paste0(pip_name(t), "==", pip_vers(t))

#' @export
env_path.python <- function(t, ...) {
  pkg_data_dir("virtualenvs", env_name(t), ...)
}

#' @export
bin_path.python <- function(t) env_path(t, "bin", bin_name(t))

#' @export
config_path.python <- function(t) env_path(t, "config.json")

#' @export
install.python <- function(t, force = FALSE) {
  if (!installed(t) & !force) {
    virtualenv_create(env_path(t), packages = FALSE)
    virtualenv_install(env_path(t), pip_path(t), ignore_installed = !force)
  }
  return(t)
}

#' @export
installed.python <- function(t) {
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
uninstall.python <- function(t) virtualenv_remove(env_path(t))
