#'Clean and preprocess the panitumumab data
#'
#' @param lesion the joined panitumumab dataset
#' @param lesion_name one lesion site name from unique(lesion$LSSiTE). This will
#' result in new_ls column with the 2 categories, 'lesion_name' and 'Other'.
#' @return the lesion data frame with 2 new columns added.
#' @examples
#' data(lesion)
#' data_processing(lesion, "Liver")
#' @importFrom stats relevel
#' @export
data_processing <- function(lesion, lesion_name) {
  if (("LSSITE" %in% colnames(lesion)) && ("AESEVCD" %in% colnames(lesion))) {
    if (lesion_name %in% unique(lesion$LSSITE)) {
      lesion$new_ls <- ifelse(lesion$LSSITE == lesion_name, lesion_name,
                              "Other")
      lesion$new_ls <- relevel(factor(lesion$new_ls), ref = "Other")
      lesion$level <- ifelse(lesion$AESEVCD == 1, "LOW", "HIGH")
      lesion$level <- relevel(factor(lesion$level), ref = "LOW")
      return(lesion)
    }else {
      stop("Incorrect lesion site entered. Please try again.")
    }
  }else {
    stop("Incorrect dataset entered. Please use the panitumumab data.")
  }
}
