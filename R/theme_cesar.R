#' @title Create Standard Cesar Plots
#'
#' @description This function converts your ggplot object to the Cesar theme. The default font is Inter
#' @param font_title font family for titles, defaults to Inter/Arial
#' @param font_subtitle font family for subtitles, defaults to Inter/Arial
#' @param font_plot font family for the plot space, defaults to Inter/Arial
#' @param font_caption font family for captions, defaults to Inter/Arial
#' @param facet_space controls how far apart facets are from each other
#' @param text_scale scalar that will grow/shrink all text defined within
#' @param ... pass any parameters from theme that are not already defined within
#'
#' @export
#' @importFrom magrittr %>%
#' @importFrom ggplot2 %+replace% aes geom_point theme_minimal theme
#'
#' @examples
#' library(systemfonts)
#' library(ggplot2)
#' ggplot(iris, aes(Sepal.Length, y = Sepal.Width, colour = Species)) +
#'  geom_point() + theme_cesar()
#'


theme_cesar <- function(font_title,
                        font_subtitle,
                        font_plot,
                        font_caption,
                        facet_space = 2,
                        text_scale = 1,
                        ...) {

  cesar_font_default <- getOption('cesar_font')

  if(missing(font_title))
    font_title <- cesar_font_default
  if(missing(font_subtitle))
    font_subtitle <- cesar_font_default
  if(missing(font_plot))
    font_plot <- cesar_font_default
  if(missing(font_caption))
    font_caption <- cesar_font_default

  half_line <- 5.5

  # build off of theme_minimal settings
  ggplot2::theme_minimal() %+replace%

    ggplot2::theme(
      plot.title = ggplot2::element_text(
        family = font_title,
        size = 16 * text_scale,
        face = "bold",
        color = color_title,
        margin = ggplot2::margin(b = 14 * text_scale),
        hjust = 0),

      #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
      plot.subtitle = ggplot2::element_text(
        family = font_subtitle,
        size = 12  * text_scale,
        face = "bold",
        color = color_subtitle,
        margin = ggplot2::margin(b = 12 * text_scale),
        hjust = 0),
      plot.caption = ggplot2::element_text(
        family = font_caption,
        size = 9 * text_scale,
        color = color_caption,
        margin = ggplot2::margin(t = half_line/2),
        hjust = 1, vjust = 1),
      plot.margin = ggplot2::margin(15, 15, 10, 15), #top, right, bottom, left
      plot.title.position = "plot", #Move plot.title to the left
      plot.caption.position = "plot",

      #Legend format
      # Set the legend to be at the top left of the graphic, below title
      legend.position = "bottom",
      legend.text.align = 0,
      legend.justification = c(0, 0),
      legend.background = ggplot2::element_blank(),
      #legend.title = ggplot2::element_blank(),
      legend.key = ggplot2::element_blank(),
      legend.title = ggplot2::element_text(
        family = font_title,
        size = 10 * text_scale,
        color = color_plot_text),
      legend.text = ggplot2::element_text(
        family = font_title,
        size = 9 * text_scale,
        color = color_plot_text),

      #Axis format
      axis.text = ggplot2::element_text(
        family = font_plot,
        size = 10 * text_scale,
        color = color_plot_text),
      axis.ticks = ggplot2::element_blank(),
      axis.line = ggplot2::element_blank(),
      axis.title = ggplot2::element_text(
        family = font_plot,
        size = 10 * text_scale,
        colour = color_plot_text),

      #Grid lines
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(colour = color_gridline, linewidth = 0.25),
      panel.grid.major.x = ggplot2::element_line(colour = color_gridline, linewidth = 0.25),

      #Blank background
      panel.background = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(facet_space, "lines"),

      # Plot fill and margins
      plot.background = ggplot2::element_rect(fill = "white", color = NA),


      #Strip background (This sets the panel background for facet-wrapped plots to white)
      strip.background = ggplot2::element_rect(fill = alpha(color_strip_background, 0.5), color = NA),
      strip.text = ggplot2::element_text(
        family = font_title,
        size  = 11 * text_scale,
        hjust = 0.5,
        color = color_strip_text,
        margin = ggplot2::margin(0.6 * half_line, 0.6 * half_line, 0.6 * half_line, 0.6 * half_line)
      ),
      ...
    )
}
