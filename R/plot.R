
#' Plot UKBiobank Accelerometry Data
#' This function plots UKBiobank accelerometry data.
#' @param x an object inherited from data.frame. It is
#' assumed to have a `time`, `X`, `Y`, and `Z` column along with
#' either a `time` or `freq` column.
#' @return a time-series plot faceted by axis.
#' @importFrom tidyr pivot_longer all_of
#' @importFrom ggplot2 aes ggplot geom_line facet_grid
#' @examples
#' data(ukb_accel)
#' accel_plot(ukb_accel[1:1000,])
#' @export
accel_plot <- function(x) {
  if ("time" %in% colnames(x)) {
    col <- as.symbol("time")
  } else if ("freq" %in% colnames(x)) {
    col <- as.symbol("freq")
  } else {
    stop("A `time` or a `freq` column must appear in the data.")
  }
  x |>
    tidyr::pivot_longer(-tidyr::all_of(col)) |>
    ggplot2::ggplot(ggplot2::aes(x = {{col}}, y = value)) +
    ggplot2::geom_line() +
    ggplot2::facet_grid(name ~ .)
}
