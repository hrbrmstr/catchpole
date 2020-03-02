#' Expand the state totals per delegate into an indexed data frame
#'
#' @param delegates a data frame with `state`, `candidate`, and
#'        `delegates` count or use the default which gets the
#'        current data as long as the WSJ keeps it alive.
#' @export
expand_candidates <- function(delegates = read_delegates()) {

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

  })

}
