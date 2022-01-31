new_tap <- function(x, ..., class = character()) {
    assert_list(x)
    object(x, ..., class = c(class, "tap"))
}

is_installed <- \(t, ...) UseMethod("is_installed")
install <- \(t, ...) UseMethod("install")
uninstall <- \(t, ...) UseMethod("uninstall")

discover <- \(t, ...) UseMethod("discover")
is_discovered <- \(t, ...) UseMethod("discover")
