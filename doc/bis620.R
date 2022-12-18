## ---- include = FALSE, echo = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  error = FALSE,
  fig.width = 7,
  fig.height = 4
  )

## ----setup--------------------------------------------------------------------
library(bis620.2022)

## -----------------------------------------------------------------------------
devtools::load_all()
data(lesion)
print(sum(is.na(lesion$LSSITE)))
print(sum(lesion$LSSITE == ""))

## ---- echo=FALSE--------------------------------------------------------------
knitr::kable(table(lesion |> select(LSSITE)), "simple")

## -----------------------------------------------------------------------------
plot_lesion(lesion, "Liver")

## -----------------------------------------------------------------------------
plot_lesion(lesion, "Pulmonary")

## -----------------------------------------------------------------------------
logit_analysis(lesion, "Liver")

## -----------------------------------------------------------------------------
logit_analysis(lesion, "Lymph Nodes")

## -----------------------------------------------------------------------------
logit_analysis(lesion, "Pulmonary")

## -----------------------------------------------------------------------------
logit_analysis(lesion, "Gastrointestinal")

