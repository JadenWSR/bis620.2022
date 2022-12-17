test_that(
  "The data_processing() returns a dataframe object.",
  {
    data(lesion)
    df <-  data_processing(lesion, "Liver")
    expect_true(inherits(df, "data.frame"))
  }
)

test_that(
  "The data_processing() errors when no LSSITE or AESEVCD columns.",
  {
    data(iris)
    expect_error(data_processing(iris))
  }
)

test_that(
  "The data_processing() errors when lesion_name is invalid.",
  {
    data(lesion)
    expect_error(data_processing(lesion, "ABC"))
  }
)


test_that(
  "The data_processing() generates the correct new_ls column and level column",
  {
    data(lesion)
    df <- data_processing(lesion, "Liver")

    df_new <- lesion
    df_new$new_ls <- ifelse(df_new$LSSITE == "Liver", "Liver", "Other")
    df_new$new_ls <- relevel(factor(df_new$new_ls), ref = "Other")
    df_new$level <- ifelse(df_new$AESEVCD == 1, "LOW", "HIGH")
    df_new$level <- relevel(factor(df_new$level), ref = "LOW")

    expect_equal(df, df_new)
  }
)
