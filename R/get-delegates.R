#' Retrieves current U.S. State delegate assignments for 2020 from the WSJ
#'
#' @export
#' @references <https://asset.wsj.net/wsjnewsgraphics/election/2020/delegates.json>
read_delegates <- function() {

  jsonlite::fromJSON(
    url("https://asset.wsj.net/wsjnewsgraphics/election/2020/delegates.json"),
    simplifyDataFrame = FALSE
  ) -> del

  state_del <- del
  state_del$data[["US"]] <- NULL

  map_df(state_del$data, ~bind_cols(.x$delCount), .id = "state") %>%
    gather(candidate, delegates, -state) %>%
    filter(delegates > 0) -> states

  states

}
