#' Plot histogram given colname name wrapped by ATRT
#' Plots are genereated based on the lesion data in this dataset.
#' @param x must be the `lesion` dataset
#' @param lesion_site this must be one lesion site name from
#' unique(lesion$LSSiTE).
#' Data will be processed with data_processing(lesion_name = colname).
#' @return a set of bar plots facet wrapped by ATRT and new_ls
#' (result from the data_processing)
#' @importFrom dplyr select group_by summarise
#' @importFrom ggplot2 ggplot aes geom_col geom_text ylim facet_wrap labs
#' position_dodge
#' @examples
#' data(lesion)
#' plot_lesion(lesion, "Liver")
#' @export
plot_lesion <- function(x, lesion_site) {
  x |>
    data_processing(lesion_name = lesion_site) |>
    select(ATRT, LSSITE, new_ls, level) |>
    group_by(ATRT, level, new_ls) |>
    summarise(count = dplyr::n()) |>
    ggplot(aes(x = new_ls, y = count)) +
    geom_col() +
    geom_text(aes(label = count), position = position_dodge(width = 0.9),
              vjust = -0.25) +
    ylim(c(0, 40000)) +
    labs(x = "Lesion Site") +
    facet_wrap(~ATRT + level)
}
