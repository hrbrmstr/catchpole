#' 2020 Democrat POTUS Delegate Map Tracker
#'
#' @section Credit:
#'
#' The hard work was done by WSJ's Brian McGill ([@@brian_mcgill](https://twitter.com/brian_mcgill/)) who **manually crafted** the base cartogram over **days** then translated that into the beautiful and illuminating creation that is the WSJ online delegate tracker: <https://www.wsj.com/graphics/elections/2020/track-the-delegate-count/>.
#'
#' Brians's tweetnouncement: <https://twitter.com/brian_mcgill/status/1222556373864648704?ref_src=twsrc%5Etfw>
#'
#' @md
#' @name catchpole
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @author Brian McGill
#' @import sf
#' @importFrom purrr map_df
#' @importFrom dplyr left_join filter bind_cols tibble arrange
#' @importFrom tidyr gather
#' @importFrom ggplot2 ggplot aes scale_fill_manual guides guide_legend coord_sf
#' @importFrom hrbrthemes theme_ft_rc
#' @importFrom jsonlite fromJSON
"_PACKAGE"
