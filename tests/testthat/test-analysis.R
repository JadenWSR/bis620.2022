test_that(
  "The logit_analysis() returns the correct plot.",
  {
    data(lesion)
    p <- function() logit_analysis(lesion, "Liver")
    vdiffr::expect_doppelganger("Liver_Effects_Plot", p)
  }
)

test_that(
  "The logit_analysis() errors when x is not the lesion dataset",
  {
    data(iris)
    expect_error(logit_analysis(iris, "Liver"))
  }
)

test_that(
  "The logit_analysis() errors when lesion_site is invalid",
  {
    data(lesion)
    lesion_site <- "leg"
    expect_error(logit_analysis(lesion, lesion_site))
  }
)
