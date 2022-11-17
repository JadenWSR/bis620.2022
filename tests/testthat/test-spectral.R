test_that(
  "The spectral_signature() returns a dataframe object.",
  {
    data(ukb_accel)
    df <-  spectral_signature(ukb_accel[1:100, ])
    expect_true(inherits(df, "data.frame"))
  }
)

test_that(
  "The spectral_signature() errors when no X,Y or Z columns.",
  {
    data(iris)
    expect_error(spectral_signature(iris))
  }
)

test_that(
  "The spectral_signature() takes log for X, Y and Z columns when take_log = TRUE.",
  {
    data(ukb_accel)
    # take_log = TRUE
    df <- ukb_accel[1:100, ] |>
      spectral_signature(take_log = TRUE) |>
      select(X, Y, Z)

    # take log manually
    df_log <-  ukb_accel[1:100, ] |>
      spectral_signature() |>
      select(X, Y, Z) |>
      log()

    expect_equal(df, df_log)
  }
)

