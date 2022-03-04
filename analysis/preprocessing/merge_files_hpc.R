library(readr)
library(dplyr)

all.eeg.epoch.files <- list.files(path="/scratch/jdeleeuw/219-2022-eeg/preprocessed/", pattern=".csv", full.names = T)

all.eeg.epochs <- lapply(all.eeg.epoch.files, read_csv)

all.eeg.epochs.df <- bind_rows(all.eeg.epochs)

saveRDS(all.eeg.epochs.df, file="/scratch/jdeleeuw/219-2022-eeg/preprocessed/epochs.rds")

