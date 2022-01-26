library(hexSticker)
library(usethis)
library(magrittr)

logo_location <- "inst/img/logo.png"

sticker(
  subplot =
    png::readPNG("inst/img/singer.png") %>%
    grid::rasterGrob(interpolate = TRUE),
  package  = "singer.R",
  filename = logo_location,
  p_size   = 20,
  s_width  = 10,
  s_height = 0.6,
  s_x      = 1,
  h_color  = "#008080",
  h_fill   = "#1A5591"
)

file.remove("man/figures/logo.png")
use_logo(logo_location)
