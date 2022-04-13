# this script is to remove extra information from the EEG epochs to make the
# data frame smaller for processing in memory

library(dplyr)

eeg.data <- readRDS("data/eeg/epochs/epochs.rds")

needed.electrodes <- c("P7", "P8", "O1", "O2", "P3", "P4", "Pz")

eeg.filtered.data <- eeg.data %>%
  filter(event_type %in% 1:6) %>%
  filter(electrode %in% needed.electrodes) %>%
  mutate(ending = case_when(
    event_type %in% c(1,4) ~ "filler",
    event_type %in% c(2,5) ~ "joke",
    event_type %in% c(3,6) ~ "nonjoke"
  )) %>%
  mutate(visual_field = case_when(
    event_type %in% c(1,2,3) ~ "left",
    event_type %in% c(4,5,6) ~ "right"
  ))

saveRDS(eeg.filtered.data, file = "data/eeg/epochs/epochs_filtered.rds")