
#' Chooses palette to use with ggplot2
#'
#' @description
#' Generate a palette by linear interpolation.
#' If a discrete palette is selected, colors are recycled to the length of the desired vector.
#'
#'
#' @title Palette interpolation
#'
#' @param pal_name name of the palette
#' @param n number of interpolation points
#' @param alpha sets transparency of each color
#' @param reverse if true, reverses order
#'
#' @export
#'
#' @importFrom grDevices colorRampPalette
#' @importFrom scales show_col
#' @importFrom scales alpha
#'
#' @examples
#' #View different interpolations of palettes
#' cesar_rampr("cesar_green_c") %>%  scales::show_col()
#' cesar_rampr("cesar_green_c", n = 10) %>% scales::show_col()
#' cesar_rampr("cesar_green_c", n = 100)
#'


cesar_rampr <- function(pal_name = "cesar", n, alpha = 1, reverse = FALSE) {

  pal <- cesar_palettes[[pal_name]]

  if (is.null(pal))
    stop("\nPlease enter a valid Cesar palette. Select from one in `names(cesar_palettes)`")

  if(missing(n)) {
    n <- length(pal)
  }

  # Do this when you pick a discrete color
  pal_d <- c("cesar", "cesar_light")

  if(pal_name %in% pal_d){

    if(n > length(pal)) {
      pal <- grDevices::colorRampPalette(pal)(n)
      pal <- scales::alpha(pal, alpha = alpha)
    } else {
      pal <- rep(pal, length.out = n)
      pal <- scales::alpha(pal, alpha = alpha)
    }
  }

  pal <- grDevices::colorRampPalette(pal)(n)
  pal <- scales::alpha(pal, alpha = alpha)

  if (reverse) {
    pal <- rev(pal)
  }

  return(pal)
}

#' Cesar palette with ramped colors
#' @description Helper function to incorporate Cesar colors into scale fills
#'
#' @export
#'
#' @param palette Choose from 'cesar_palettes' list
#' @param alpha sets transparency of each color
#' @param reverse if true, reverses the order of palette
#' @importFrom grDevices colorRampPalette
#'

cesar_pal <- function(palette = "cesar", alpha = 1, reverse = FALSE) {

  function(n) {
    cesar_rampr(palette, n, alpha, reverse)
  }

}

#' Cesar gradient palette
#' @description Helper function to incorporate Cesar colors into scale fills
#'
#' @export
#'
#' @param palette Choose from 'cesar_palettes' list
#' @param alpha sets transparency of each color
#' @param reverse if true, reverses the order of palette
#' @param na.color color for NA values
#' @importFrom farver decode_colour
#' @importFrom farver encode_colour
#' @importFrom stats approxfun
#'

cesar_gradient_n_pal <- function(palette = "cesar_green_c", alpha = 1, reverse = T, na.color = NA)
{
  pal <- cesar_rampr(pal_name = palette, n = 256, alpha, reverse)

  colors <- tolower(pal)
  lab_in <- farver::decode_colour(colour = colors, alpha = TRUE,
                                  to = "lab", na_value = "transparent")
  x_in <- seq(0, 1, length.out = length(colors))
  l_interp <- stats::approxfun(x_in, lab_in[, 1])
  u_interp <- stats::approxfun(x_in, lab_in[, 2])
  v_interp <- stats::approxfun(x_in, lab_in[, 3])

  alpha_interp <- stats::approxfun(x_in, lab_in[, 4])
  structure(function(x) {
    lab_out <- cbind(l_interp(x), u_interp(x), v_interp(x))
    out <- farver::encode_colour(lab_out, alpha = alpha_interp(x),
                                 from = "lab")
    out[is.na(out)] <- na.color
    out
  })
}
