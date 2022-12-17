## code to prepare `DATASET` dataset goes here
# Load the data
library(haven)
library(purrr)

ukb_accel <- readRDS("accel.rds")
usethis::use_data(ukb_accel, overwrite = TRUE)


folfox_path <- file.path("data-raw", "NCT00364013", "AllProvidedFiles_309",
                        "PDS_DSA_20050203")
ff_files <- dir(folfox_path)
ff_names <- gsub("_pds2019.sas7bdat", "", ff_files)

dl <- map(file.path(folfox_path, ff_files), read_sas)

names(dl) <- ff_names

lesion <- dl$adae %>% filter(AESOC == "Skin and subcutaneous tissue disorders",
                             !is.na(AESEVCD)) %>%
  select(SUBJID, AESEVCD) %>%
  left_join(dl$adls, by = "SUBJID") %>%
  left_join(dl$adsl, by = "SUBJID")

lesion$LSSITE[lesion$LSSITE == ""] <- "None"
lesion$LSSITE[is.na(lesion$LSSITE)] <- "None"
usethis::use_data(lesion, overwrite = TRUE)
