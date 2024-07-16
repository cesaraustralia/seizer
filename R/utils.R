.onLoad <- function (libname, pkgname)
{
  sysfonts::font_add_google("Inter", "inter")

  showtext::showtext_auto()

  options(cesar_font = "inter")

  invisible()
}
