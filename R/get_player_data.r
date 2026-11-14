#' Returns an r dataframe that contains match outcome data for a given player, including win/loss results and age information for the selected player and their opponent.
#' @title get_player_data function
#' @param name Tennis player name - e.g "Roger Federer"
#' @return Dataframe with dates of matches, results, and ages of both players in a match
#' @export
get_player_data <- function(name) {
  parts <- strsplit(name, " ")[[1]]
  slug  <- paste0(toupper(substring(parts, 1, 1)), substring(parts, 2), collapse = "")
  files <- download_player_files(slug)
  make_ages_df(files[["career"]], files[["main"]])
}
