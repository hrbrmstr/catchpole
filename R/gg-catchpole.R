#' Plot a U.S. Democratic Delegates Cargogram (2020)
#'
#' @param delegates a data frame with `state`, `candidate`, and
#'        `delegates` count or use the default which gets the
#'        current data as long as the WSJ keeps it alive.
#' @export
gg_catchpole <- function(delegates = read_delegates()) {

  map_df(unique(delegates$state), ~{

    filter(delegates, state == .x) %>%
      arrange(desc(delegates)) -> cur

    tibble(
      state = character(0),
      candidate = character(0),
      idx = integer(0)
    ) -> res

    last_idx <-  0

    for (cand in unique(cur$candidate)) {

      tibble(
        state = cur$state[1],
        candidate = cand,
        idx = (last_idx+1):(last_idx+1+cur[cur$candidate == cand,]$delegates)
      ) -> out

      last_idx <- tail(out$idx, 1)

      res <- bind_rows(res, out)

    }

    res

  }) -> candidates_expanded

  c(
    "Biden" = "#5ac4c2",
    "Sanders" = "#63bc51",
    "Warren" = "#9574ae",
    "Buttigieg" = "#007bb1",
    "Klobuchar" = "#af973a",
    "Bloomberg" = "#AA4671",
    "Steyer" = "#4E4EAA",
    "Yang" = "#C76C48",
    "Gabbard" = "#7B8097"
  ) -> dcols

  gsf <- left_join(delegates_sf, candidates_expanded, by = c("state", "idx"))

  ggplot() +
    geom_sf(
      data = gsf,
      aes(fill = candidate),
      col = "#617a89", shape = 22, size = 2, stroke = 0.125
    ) +
    scale_fill_manual(
      name = NULL, values = dcols, na.value = "gray20",
      limits = intersect(unique(delegates$candidate), names(dcols))
    ) +
    guides(
      fill = guide_legend(
        override.aes = list(size = 4)
      )
    ) +
    coord_sf(datum = NA)

}