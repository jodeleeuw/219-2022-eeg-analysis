library(dplyr)
library(readr)

naming.data <- read_csv('data/behavioral/generated/delayed_naming.csv')
eeg.data <- readRDS('data/eeg/epochs/epochs_filtered.rds')

naming.correct <- naming.data %>%
  mutate(subject = subject_id) %>%
  select(subject, trial, correct)

eeg.data.filtered <- eeg.data %>%
  group_by(subject) %>%
  mutate(trial = event_id - min(event_id) + 1) %>%
  ungroup() %>%
  left_join(naming.correct, by=c("subject", "trial")) %>%
  filter(correct==1)

n4.data <- eeg.data.filtered %>%
  filter(electrode %in% c("P3", "P4", "Pz"))

n4.erps <- n4.data %>%
  filter(good_segment == TRUE)

n4.time.window <- 300:500

# ANOVA is 2 (visual field; left or right) x 3 (sentence ending; filler, joke, or nonjoke)

n4.anova.trial.data <- n4.data %>%
  filter(t %in% n4.time.window) %>%
  group_by(subject, trial, visual_field, ending) %>%
  summarize(v = mean(v))


n4.good.segments <- n4.anova.trial.data %>%
  group_by(subject, visual_field, ending) %>%
  summarize(good.segments = n())

min(n4.good.segments$good.segments)

mean(n4.good.segments$good.segments)
