test_that(
  "The plot_lesion() returns a ggplot object.",
  {
    data(lesion)
    p <-  plot_lesion(lesion, "Liver")
    expect_true(inherits(p, "gg"))
  }
)

test_that(
  "The plot_lesion() errors when x is not the lesion dataset",
  {
    data(iris)
    expect_error(plot_lesion(iris, "Liver"))
  }
)

test_that(
  "The plot_lesion() errors when lesion_site is invalid",
  {
    data(lesion)
    lesion_site <- "leg"
    expect_error(plot_lesion(lesion, lesion_site))
  }
)
