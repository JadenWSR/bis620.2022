#' Perform a logistic regression analysis on the panitumumab data
#'
#' The response variable is level, and the predictors are ATRT and new_ls
#' @param x must be the `lesion` dataset
#' @param lesion_site this must be one lesion site name from
#' unique(lesion$LSSITE).
#' Data will be processed with data_processing(lesion_name = colname).
#' @return the summary result for the logistic regression model
#' @importFrom dplyr select
#' @importFrom stats glm
#' @importFrom effects allEffects
#' @export
logit_analysis <- function(x, lesion_site) {
  df <- x |>
    data_processing(lesion_name = lesion_site) |>
    select(ATRT, new_ls, level)
  model <- glm(new_ls ~ level * ATRT, data = df, family = "binomial")
  print(paste("The lesion site you chosed is ", lesion_site, ".", sep = ""))
  print(summary(model))
  plot(allEffects(model), ylab = paste("Lesion Site: ", lesion_site,
                                       " = 1; Other = 0",
                                       sep = ""),
       xlab = "Severity Level",
       main = "Effect Plot")
}
