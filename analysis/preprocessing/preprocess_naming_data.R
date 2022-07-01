library(jsonlite)
library(dplyr)
library(readr)
library(stringr)

json.files <- list.files(path="data/behavioral/raw", pattern=".json", full.names = TRUE)
experiment.data <- lapply(json.files, fromJSON) %>% bind_rows()

naming.data <- read_csv("data/behavioral/raw/EEG experiment 2022 verbal responses - ALL SUBJECTS.csv")

experiment.data.subject.fix <- experiment.data %>%
  mutate(subject_id = if_else(subject_id == "19\\", "19", subject_id)) %>%
  mutate(left_or_right = case_when(
    left_or_right == "left" ~ "right",
    left_or_right == "right" ~ "left",
  ))

write_csv(experiment.data.subject.fix, file="data/behavioral/generated/jspsych.csv")

trial.info <- experiment.data.subject.fix %>%
  filter(task == "test-response") %>%
  select(subject_id, left_or_right, sentence_type) %>%
  group_by(subject_id) %>%
  mutate(trial = 1:n())

merged.naming.data <- naming.data %>%
  mutate(subject_id = str_pad(as.character(subject), 2, side="left", pad="0")) %>%
  left_join(trial.info, by=c("subject_id", "trial")) %>%
  select(subject_id, trial, left_or_right, sentence_type, correct)

write_csv(merged.naming.data, file="data/behavioral/generated/delayed_naming.csv")
