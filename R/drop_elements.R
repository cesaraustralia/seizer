#' @title Drop static elements from plots
#'
#' @description Drop a static theme element from a ggplot object
#' @param axis either "x", "y" or "both"
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(iris, aes(Sepal.Length, y = Sepal.Width, colour = Species)) +
#'  geom_point() + theme_cesar()
#'
#' p + drop_legend()
#'
#' p + drop_grid("x")
#'
#' p + drop_labels("y")
#'
#' p + drop_titles("both")
#'

#' @export
#' @rdname drop_elements
drop_legend <- function(axis = NULL){
  ggplot2::theme(legend.position = "none")
}

#' @export
#' @rdname drop_elements
drop_grid <- function(axis = NULL){
  if(is.null(axis)){
    warning("argument axis of drop_grid should be x, y or both")
    ggplot2::theme()
  } else if (!axis %in% c("x", "y", "both")) {
    warning("argument axis of drop_grid should be x, y or both")
    ggplot2::theme()
  } else if(axis == "x"){
    ggplot2::theme(panel.grid.major.x = ggplot2::element_blank())
  } else if(axis == "y"){
    ggplot2::theme(panel.grid.major.y = ggplot2::element_blank())
  } else if(axis == "both"){
    ggplot2::theme(panel.grid.major.x = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_blank())
  }
}

#' @export
#' @rdname drop_elements
drop_labels <- function(axis = NULL){
  if(is.null(axis)){
    warning("argument axis of drop_labels should be x, y or both")
    ggplot2::theme()
  } else if (!axis %in% c("x", "y", "both")) {
    warning("argument axis of drop_labels should be x, y or both")
    ggplot2::theme()
  } else if(axis == "x"){
    ggplot2::theme(axis.text.x = ggplot2::element_blank())
  } else if(axis == "y"){
    ggplot2::theme(axis.text.y = ggplot2::element_blank())
  } else if(axis == "both"){
    ggplot2::theme(axis.text.x = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank())
  }
}

#' @export
#' @rdname drop_elements
drop_titles <- function(axis = NULL){
  if(is.null(axis)){
    warning("argument axis of drop_titles should be x, y or both")
    ggplot2::theme()
  } else if (!axis %in% c("x", "y", "both")) {
    warning("argument axis of drop_titles should be x, y or both")
    ggplot2::theme()
  } else if(axis == "x"){
    ggplot2::theme(axis.title.x = ggplot2::element_blank())
  } else if(axis == "y"){
    ggplot2::theme(axis.title.y = ggplot2::element_blank())
  } else if(axis == "both"){
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank())
  }
}
