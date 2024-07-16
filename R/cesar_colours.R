#' @title List of Cesar Colour Palettes
#'
#' @description
#' Sets of colour palettes for use in Cesar Australia data visualisations.
#' Colours are stored as a named list. Use palette name or position to call in
#' colours.
#'
#' Colour sets are stored as the name of the first colour:
#' Calling `cesar_palettes$cesar` will return the seven color palette where Cesar green is the base.
#' Calling `cesar_palettes$cesar_green_c` will return an interpolated ramp of 10 colors for Cesar green.
#'
#' @export
#'
#' @examples
#'
#' # List names of palettes available
#' names(cesar_palettes)
#'
#' scales::show_col(cesar_palettes$cesar)
#' scales::show_col(cesar_palettes$gold_teal_d)
#' scales::show_col(cesar_palettes$warm_grey_c)
#'

cesar_palettes <- list(

  # Cesar recommended categorical palette (discrete)
  cesar = c("#89b701", "#707070", "#d1ab20", "#aa1b07", "#031e48", "#473f32", "#07aa91"),
  cesar_light = c("#e0fe86", "#ededed", "#f0dd9a", "#fa9283", "#b4d0fc", "#ddd7ce", "#83fae8"),

  # # Cesar recommended categorical palettes (discrete)
  # cesar_green_d = c("#89b701", "#d1ab20", "#aa1b07", "#031e48", "#473f32"),
  # key_lime_d = c("#e0fe86", "#f0dd9a", "#fa9283", "#b4d0fc", "#ddd7ce"),
  #
  # hobgoblin_d = c("#07aa91", "#89b701", "#d1ab20", "#aa1b07", "#031e48"),
  # defense_matrix_d = c("#83fae8", "#e0fe86", "#f0dd9a", "#fa9283", "#b4d0fc"),
  #
  # ancient_lavastone_d = c("#473f32", "#07aa91", "#89b701", "#d1ab20", "#aa1b07"),
  # warm_grey_d = c("#ddd7ce", "#83fae8", "#e0fe86", "#f0dd9a", "#fa9283"),
  #
  # oxford_blue_d = c("#031e48", "#473f32", "#07aa91", "#89b701", "#d1ab20"),
  # ice_cold_d = c("#b4d0fc", "#ddd7ce", "#83fae8", "#e0fe86", "#f0dd9a"),
  #
  # rufous_d =  c("#aa1b07", "#031e48", "#473f32", "#07aa91", "#89b701"),
  # adobe_avenue_d =  c("#fa9283", "#b4d0fc", "#ddd7ce", "#83fae8", "#e0fe86"),
  #
  # galliano_d = c("#d1ab20", "#aa1b07", "#031e48", "#473f32", "#07aa91"), # doesn't have Cesar green!
  # gold_bullion_d = c("#f0dd9a", "#fa9283", "#b4d0fc", "#ddd7ce", "#83fae8"), # doesn't have Cesar green!

  # Cesar recommended sequential palettes (continuous)
  cesar_green_c = c("#171f00", "#3d5200", "#638401", "#89b701", "#afea01", "#c6fe20", "#d3fe53", "#e0fe86", "#edffb8", "#faffeb"),

  hobgoblin_c = c("#03483e", "#03483e", "#057967", "#07aa91", "#09dbbb", "#21f6d5", "#52f8df", "#83fae8", "#b4fcf1", "#e5fefa"),

  warm_grey_c = c("#0b0a08", "#29241d", "#473f32", "#665946", "#84745b", "#9e8d74", "#b3a692", "#c8beb0", "#ddd7ce", "#f2f0ec"),

  oxford_blue_c = c("#010a17", "#031e48", "#053279", "#0747aa", "#095BDB", "#2174f6", "#5293f8", "#83b1fa", "#b4d0fc", "#e5effe"),

  rufous_c = c("#170401", "#480c03", "#791305", "#aa1b07", "#db2309", "#f63b21", "#f86752", "#fa9283", "#fcbdb4", "#fee8e5"),

  galliano_c = c("#201a05", "#4c3e0c", "#796312", "#a58719", "#d1ab20", "#e2c042", "#e9ce6e", "#f0dd9a", "#f6ecc7", "#fdfbf3"),

  neutral_c = c("#0a0a0a", "#242424", "#3d3d3d", "#575757", "#707070", "#8a8a8a", "#a3a3a3", "#bdbdbd", "#d6d6d6", "#f0f0f0"),

  # Cesar recommended diverging palettes (continuous)

  green_brown_d = c("#89b701", "#b0ca67", "#d2ddac", "#f1f1f1", "#b5b1ac", "#7c756c", "#473f32"),

  teal_orange_d = c("#07aa91", "#74c2b0", "#b5dad0", "#f1f1f1", "#e4b3a0", "#cc7654", "#ab3707"),

  orange_green_d = c("#ab3707", "#cc7654", "#e4b3a0", "#f1f1f1", "#d2ddac", "#b0ca67", "#89b701"),

  gold_teal_d = c("#d1ab20", "#e1c16e", "#ecd8af", "#f1f1f1", "#b5dad0", "#74c2b0", "#07aa91")
)

# Cesar Recommended  colors
#' @family Cesar colors
#' @export
#' @description Cesar green
#' @title cesar green
#' @keywords internal
cesar_green = "#89b701"

#' @family Cesar colors
#' @export
#' @description Key lime
#' @title key lime
#' @keywords internal
key_lime = "#e0fe86"

#' @family Cesar colors
#' @export
#' @description Hobgoblin
#' @title hobgoblin
#' @keywords internal
hobgoblin = "#07aa91"

#' @family Cesar colors
#' @export
#' @description Defense matrix
#' @title defense matrix
#' @keywords internal
defense_matrix = "#83fae8"

#' @family Cesar colors
#' @export
#' @description Ancient lavastone
#' @title ancient lavastone
#' @keywords internal
ancient_lavastone = "#473f32"

#' @family Cesar colors
#' @export
#' @description Warm grey
#' @title warm grey
#' @keywords internal
warm_grey = "#ddd7ce"

#' @family Cesar colors
#' @export
#' @description Oxford blue
#' @title oxford blue
#' @keywords internal
oxford_blue = "#031e48"

#' @family Cesar colors
#' @export
#' @description Ice cold
#' @title ice cold
#' @keywords internal
ice_cold = "#b4d0fc"

#' @family Cesar colors
#' @export
#' @description Rufous
#' @title rufous
#' @keywords internal
rufous = "#aa1b07"

#' @family Cesar colors
#' @export
#' @description Adobe avenue
#' @title adobe avenue
#' @keywords internal
adobe_avenue = "#fa9283"

#' @family Cesar colors
#' @export
#' @description Galliano
#' @title galliano
#' @keywords internal
galliano = "#d1ab20"

#' @family Cesar colors
#' @export
#' @description Gold bullion
#' @title gold bullion
#' @keywords internal
gold_bullion = "#f0dd9a"

#' @family Cesar colors
#' @export
#' @description Dark grey
#' @title dark grey
#' @keywords internal
dark_grey = "#707070"

#' @family Cesar colors
#' @export
#' @description Mid grey
#' @title mid grey
#' @keywords internal
mid_grey = "#afafaf"

#' @family Cesar colors
#' @export
#' @description Light grey
#' @title light grey
#' @keywords internal
light_grey = "#ededed"



### DON'T USE ### c("#170117", "#480348", "#780579", "#a907aa", "#da09db", "#f521f6", "#f752f8", "#f983fa", "#fcb4fc", "#fee5fe") ### DON'T USE ###
