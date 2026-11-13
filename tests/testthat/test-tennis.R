female_career <- test_path("fixtures", "FemalePlayerCareer.js")
male_career   <- test_path("fixtures", "MalePlayerCareer.js")
main_file     <- test_path("fixtures", "MainPlayer.js")

test_that("Main helper function works on female data sample", {
  df <- make_ages_df(female_career, main_file)

  expect_named(df, c("date", "wl", "player_age", "opp_age", "age_diff"))
  expect_equal(df$opp_age[1], as.numeric(as.Date("1995-10-30") - as.Date("1977-01-19")) / 365.25)
})

test_that("Main helper function works on male data sample", {
  df <- make_ages_df(male_career, main_file)

  expect_named(df, c("date", "wl", "player_age", "opp_age", "age_diff"))
  expect_equal(df$opp_age[1], 22.264202601)
})

test_that("Make sure that plot function works on female data sample", {
  df <- make_ages_df(female_career, main_file)
  plot <- make_age_plot(df)

  expect_s3_class(plot, "ggplot")
})

test_that("Make sure that plot function works on male data sample", {
  df <- make_ages_df(male_career, main_file)
  plot <- make_age_plot(df)

  expect_s3_class(plot, "ggplot")
})

test_that("Download data function returns an error for a fake player", {
  expect_error(get_player_data("Gaston Sanchez"))
})
