download_player_files <- function(slug) {
  base <- "https://www.tennisabstract.com/jsmatches/"
  file_career <- tempfile(fileext = ".js")
  file_main   <- tempfile(fileext = ".js")
  tryCatch({
    download.file(paste0(base, slug, "Career.js"), destfile = file_career, quiet = TRUE)
    download.file(paste0(base, slug, ".js"),       destfile = file_main,   quiet = TRUE)}, error = function(e) 
    {stop("Couldn't find a player matching \"", slug, "\". Check the spelling.", call. = FALSE)}, warning = function(w) 
    {stop("Couldn't find a player matching \"", slug, "\". Check the spelling.", call. = FALSE)})
  c(career = file_career, main = file_main)
}

convert_to_df <- function(json) {
  ct <- V8::v8()
  ct$source(json)
  rows <- ct$get("morematchmx", simplifyVector = FALSE)
  df <- dplyr::bind_rows(lapply(rows, function(r) as.data.frame(t(unlist(r)))))
  names(df)[1:20] <- c("date", "tourn", "surf", "level", "wl", "rank", "seed", "entry",
                       "round", "score", "max", "opp", "orank", "oseed", "oentry",
                       "ohand", "obday", "oht", "ocountry", "oactive")
  df <- df[, 1:20]
  return(df)
}

get_player_birthday <- function(json) {
  ct2 <- V8::v8()
  ct2$source(json)
  dob <- as.Date(as.character(ct2$get("dob")), format = "%Y%m%d")
  return(dob) 
}

make_ages_df <- function(career_file, main_file) {
  df  <- convert_to_df(career_file)
  dob <- get_player_birthday(main_file)
  df$date <- as.Date(df$date, format = "%Y%m%d")
  ob <- as.character(df$obday)
  df$opp_age <- ifelse(nchar(ob) == 8,
                       as.numeric(df$date - as.Date(ob, format = "%Y%m%d")) / 365.25,
                       suppressWarnings(as.numeric(ob)))
  df$player_age <- as.numeric(df$date - dob) / 365.25
  df$age_diff   <- df$player_age - df$opp_age
  out <- df[, c("date", "wl", "player_age", "opp_age", "age_diff")]
  return(out)
}