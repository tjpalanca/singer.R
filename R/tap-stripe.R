tap_stripe <- function(start_date,
                       client_secret,
                       account_id) {
  new_python_tap(
    list(
      config = list(
        start_date = assert_posixct(start_date),
        client_secret = assert_string(client_secret),
        account_id = assert_string(account_id)
      )
    ),
    class = "tap_stripe"
  )
}

#' @export
env_name.tap_stripe <- \(t) "tap_stripe"

#' @export
pip_name.tap_stripe <- \(t) "tap-stripe"

#' @export
pip_vers.tap_stripe <- \(t) "1.5.1"

#' @export
discover.tap_stripe <- function(t) {

}
