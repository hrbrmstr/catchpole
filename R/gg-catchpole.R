#' Plot a U.S. Democratic Delegates Cargogram (2020)
#'
#' @param delegates a data frame with `state`, `candidate`, and
#'        `delegates` count or use the default which gets the
#'        current data as long as the WSJ keeps it alive.
#' @export
gg_catchpole <- function(delegates = read_delegates()) {

  candidates_expanded <- expand_candidates(delegates)

  gsf <- left_join(delegates_sf, candidates_expanded, by = c("state", "idx"))

  ggplot() +
    geom_sf(
      data = gsf,
      aes(fill = candidate),
      col = "#617a89", shape = 22, size = 2, stroke = 0.125
    ) +
    scale_fill_manual(
      name = NULL, values = delegates_pal, na.value = "gray20",
      limits = intersect(unique(delegates$candidate), names(dcols))
    ) +
    guides(
      fill = guide_legend(
        override.aes = list(size = 4)
      )
    ) +
    coord_sf(datum = NA)

}