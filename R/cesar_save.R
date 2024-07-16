#' Save Plot
#'
#' @description Wrapper around \code{ggplot2::ggsave} with Cesar standards
#'
#' @param filename File name to create on disk, png unless otherwise specified
#' @param plot Plot to save, defaults to last plot displayed.
#' @param path Path of the directory to save plot to: path and filename are combined to create the fully qualified file name. Defaults to the working directory.
#' @param preset Passes pre-determined values to the arguments \code{scale}, \code{width}, \code{height} and \code{dpi} based on the type of output the visualisation is required for. Accepts one of \code{c("twitter", "web", "linkedin", "facebook", "print")}. Deafults to \code{"print"}.
#' @param logo if \code{TRUE} add Cesar logo at top right. Defaults to \code{FALSE}
#' @param ... additional arguments to that pass to ggsave
#'
#' @importFrom ggplot2 ggsave
#'
#' @return exports a file with Cesar dimensions
#' @export
#'
#' @family saving
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(iris, aes(Sepal.Length, y = Sepal.Width, colour = Species)) +
#'   geom_point() + theme_cesar()
#' #default save
#' cesar_save("out/sepal.png")
#' #defaults to png if not specified (.pdf, .svg, .jpeg)
#' cesar_save("out/sepal")
#' #change the preset
#' cesar_save("out/sepal.jpeg", preset = "twitter")  }

cesar_save <- function(filename,
                       plot = last_plot(),
                       path = NULL,
                       preset = "print",
                       logo = FALSE,
                       ...){

  if(!grepl("png$|pdf$|svg$|jpeg$|tiff$", filename))
    filename <- paste0(filename, ".png")

  if(!preset %in% c("twitter", "web", "linkedin", "facebook", "print")){
    warning("unknown preset provided; defaulting to print")
    scale = 1
    height = 5.625
    width = 10
    dpi = 300

    showtext::showtext_opts(dpi = 300)
  }

  if(preset == "twitter"){
    scale = .5
    height = 12.5
    width = 22.2
    dpi = 72

    showtext::showtext_opts(dpi = 72)
  }

  if(preset == "web"){
    scale = .5
    height = 18.5
    width = 27.7
    dpi = 72

    showtext::showtext_opts(dpi = 72)
  }

  if(preset == "linkedin"){
    scale = 1
    height = 8.7
    width = 16.7
    dpi = 72

    showtext::showtext_opts(dpi = 72)
  }

  if(preset == "facebook"){
    scale = 1
    height = 8.75
    width = 16.7
    dpi = 72

    showtext::showtext_opts(dpi = 72)
  }

  if(preset == "print"){
    scale = 1
    height = 5.625
    width = 10
    dpi = 300

    showtext::showtext_opts(dpi = 300)
  }

  if(logo){
    img <- png::readPNG(system.file("logo/Cesar.png", package = "seizer"), native = TRUE)
    ggplot2::ggsave(filename,
                    plot +
                      patchwork::inset_element(p = img,
                                               left = 0.91, bottom = 0.91, right = 1, top = 1,
                                               align_to = "full",
                                               on_top = F),
                    path = path,
                    scale = scale,
                    width = width,
                    height = height,
                    dpi = dpi,
                    ...)

    plot

  } else {
    ggplot2::ggsave(filename,
                    plot,
                    path = path,
                    scale = scale,
                    width = width,
                    height = height,
                    dpi = dpi,
                    ...)
  }
}
