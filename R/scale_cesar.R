#' Cesar colour for ggplot2
#'
#' @importFrom scales rescale_mid
#'
#' @inheritParams cesar_pal
#' @inheritParams cesar_rampr
#' @inheritParams grDevices::colorRampPalette
#' @inheritParams ggplot2::continuous_scale
#' @param ... Other arguments passed on to [discrete_scale()],
#' [continuous_scale()], or [binned_scale()] to control name, limits, breaks,
#'   labels and so forth.
#' @param aesthetics Character string or vector of character strings listing the
#'   name(s) of the aesthetic(s) that this scale works with. This can be useful, for
#'   example, to apply colour settings to the `colour` and `fill` aesthetics at the
#'   same time, via `aesthetics = c("colour", "fill")`.
#' @family colour scales
#' @seealso
#' The documentation on [colour aesthetics][aes_colour_fill_alpha].
#' @rdname scale_cesar
#' @export
#' @examples
#' library(ggplot2)
#'
#' # Use the cesar palette with discrete data (default)
#' txsamp <- subset(txhousing, city %in%
#'   c("Houston", "Fort Worth", "San Antonio", "Dallas", "Austin"))
#' (d <- ggplot(data = txsamp, aes(x = sales, y = median)) +
#'    geom_point(aes(colour = city)))
#' d + theme_cesar() + scale_colour_cesar_d()
#'
#' # Change scale label
#' d + theme_cesar() + scale_colour_cesar_d("City\nCenter")
#'
#' # Select palette to use from names(cesar_palettes)
#' d + theme_cesar() + scale_colour_cesar_d(palette = "cesar_light")
#' d + theme_cesar() + scale_colour_cesar_d(palette = "galliano_c")
#'
#' # scale_fill_cesar_d works just the same as
#' # scale_colour_cesar_d but for fill colours
#' p <- ggplot(txsamp, aes(x = median, fill = city)) +
#'   geom_histogram(position = "dodge", binwidth = 15000)
#' p + theme_cesar() + scale_fill_cesar_d()
#' # the order of colour can be reversed
#' p + theme_cesar() + scale_fill_cesar_d(reverse = T)
#'
#' # Use cesar_c with continuous data
#' (v <- ggplot(faithfuld) +
#'   geom_tile(aes(waiting, eruptions, fill = density)))
#' v + theme_cesar() + scale_fill_cesar_c()
#' v + theme_cesar() + scale_fill_cesar_c(palette = "hobgoblin_c")
#'
#' # Use cesar_b to bin continuous data before mapping
#' v + theme_cesar() + scale_fill_cesar_b()
#'
#' # Use cesar_g for divergent scales
#' ggplot(faithfuld, aes(waiting, eruptions)) +
#' geom_raster(aes(fill = density)) +
#' scale_fill_cesar_g(mid = 0.02) + theme_cesar()
#'

#' @export
scale_colour_cesar_d <- function(name = waiver(), ..., alpha = 1, reverse = FALSE, palette = "cesar",
                                   aesthetics = "colour") {

  if(!palette %in% c("cesar", "cesar_light")){
    warning('continuous palette selected and will discretised; consider using one of c("cesar", "cesar_light") instead')
  }

  discrete_scale(
    aesthetics, name = name,
    palette = cesar_pal(palette, alpha, reverse),
    ...
  )
}

#' @export
#' @rdname scale_cesar
scale_fill_cesar_d <- function(name = waiver(), ..., alpha = 1, reverse = FALSE, palette = "cesar",
                                 aesthetics = "fill") {

  if(!palette %in% c("cesar", "cesar_light")){
    warning('continuous palette selected and will discretised; consider using one of c("cesar", "cesar_light") instead')
  }

  discrete_scale(
    aesthetics, name = name,
    palette = cesar_pal(palette, alpha, reverse),
    ...
  )
}

#' @export
#' @rdname scale_cesar
scale_colour_cesar_c <- function(name = waiver(), ..., alpha = 1, reverse = FALSE, palette = "cesar_green_c", guide = "colourbar",
                                   aesthetics = "colour", na.value = "#AFAFAF") {

  if(!palette %in% c("cesar_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")){
    stop('palette not in list of continuous palettes; use one of c("green_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")')
  }

  continuous_scale(
    aesthetics = aesthetics, name = name,
    palette = cesar_gradient_n_pal(palette, alpha, reverse, na.color = na.value),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_cesar
scale_fill_cesar_c <- function(name = waiver(), ..., alpha = 1, reverse = FALSE, palette = "cesar_green_c", guide = "colourbar",
                                 aesthetics = "fill", na.value = "#AFAFAF") {

  if(!palette %in% c("cesar_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")){
    stop('palette not in list of continuous palettes; use one of c("cesar_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")')
  }

  continuous_scale(
    aesthetics = aesthetics, name = name,
    palette = cesar_gradient_n_pal(palette, alpha, reverse, na.color = na.value),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_cesar
scale_colour_cesar_b <- function(name = waiver(), ..., alpha = 1, reverse = FALSE, palette = "cesar_green_c", guide = "coloursteps",
                                   aesthetics = "colour", na.value = "#AFAFAF") {

  if(!palette %in% c("cesar_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")){
    stop('palette not in list of continuous palettes; use one of c("cesar_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")')
  }

  binned_scale(
    aesthetics, name = name,
    palette = cesar_gradient_n_pal(palette, alpha, reverse, na.color = na.value),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_cesar
scale_fill_cesar_b <- function(name = waiver(), ..., alpha = 1, reverse = FALSE, palette = "cesar_green_c", guide = "coloursteps",
                                 aesthetics = "fill", na.value = "#AFAFAF") {

  if(!palette %in% c("cesar_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")){
    stop('palette not in list of continuous palettes; use one of c("cesar_green_c", "hobgoblin_c", "warm_grey_c", "oxford_blue_c", "rufous_c", "galliano_c", "neutral_c")')
  }

  binned_scale(
    aesthetics, name = name,
    palette = cesar_gradient_n_pal(palette, alpha, reverse, na.color = na.value),
    na.value = na.value,
    guide = guide,
    ...
  )
}


#' @export
#' @rdname scale_cesar
scale_colour_cesar_g <- function(name = waiver(), ..., mid = 0, alpha = 1, reverse = FALSE, palette = "green_brown_d", guide = "colourbar",
                                 aesthetics = "colour", na.value = "#AFAFAF") {

  if(!palette %in% c("green_brown_d", "teal_orange_d", "orange_green_d", "gold_teal_d", "red_blue_d")){
    stop('palette not in list of divergent palettes; use one of c("green_brown_d", "teal_orange_d", "orange_green_d", "gold_teal_d", "red_blue_d")')
  }

  force(mid)
  continuous_scale(
    aesthetics, name = name,
    palette = cesar_gradient_n_pal(palette, alpha, reverse, na.color = na.value),
    na.value = na.value,
    guide = guide,
    rescaler = function(x, to = c(0, 1), from = range(x, na.rm = TRUE), ...) {
      scales::rescale_mid(x, to, from, mid)
      },
    ...
  )
}

#' @export
#' @rdname scale_cesar
scale_fill_cesar_g <- function(name = waiver(), ..., mid = 0, alpha = 1, reverse = FALSE, palette = "green_brown_d", guide = "colourbar",
                               aesthetics = "fill", na.value = "#AFAFAF") {

  if(!palette %in% c("green_brown_d", "teal_orange_d", "orange_green_d", "gold_teal_d", "red_blue_d")){
    stop('palette not in list of divergent palettes; use one of c("green_brown_d", "teal_orange_d", "orange_green_d", "gold_teal_d", "red_blue_d")')
  }

  force(mid)
  continuous_scale(
    aesthetics, name = name,
    palette = cesar_gradient_n_pal(palette, alpha, reverse, na.color = na.value),
    na.value = na.value,
    guide = guide,
    rescaler = function(x, to = c(0, 1), from = range(x, na.rm = TRUE), ...) {
      scales::rescale_mid(x, to, from, mid)
    },
    ...
  )
}
