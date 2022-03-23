json.files <- list.files(path="data", pattern=".json", full.names = TRUE)
experiment.data <- lapply(json.files, fromJSON) %>% bind_rows()

naming.data <- read_csv("data/verbal_responses_EEG_2022.csv")

trial.info <- experiment.data %>%
  filter(task == "test-response") %>%
  select(subject_id, left_or_right, sentence_type) %>%
  group_by(subject_id) %>%
  mutate(trial = 1:n()) %>%
  mutate(subject_id = if_else(subject_id == "19\\", "19", subject_id))

merged.naming.data <- naming.data %>%
  mutate(subject_id = str_pad(as.character(subject), 2, side="left", pad="0")) %>%
  left_join(trial.info, by=c("subject_id", "trial")) %>%
  select(subject_id, trial, left_or_right, sentence_type, correct)

write_csv(merged.naming.data, file="data/delayed_naming.csv")