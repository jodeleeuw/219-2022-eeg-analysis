library(readr)
library(stringr)

source("preprocess_eeg.R")

args <- commandArgs(trailingOnly = TRUE)
file <- args[1]
out_dir <- args[2]

print(paste0("Working on ",file))

s <- str_split(file, "/")[[1]]
subject <- str_extract(s[length(s)], "[0-9]+")
preprocessed.data <- preprocess_eeg(
  file = file, 
  subject_id = subject,
  sampling_rate = 500,
  filter_low = 0.1,
  filter_high = 40,
  segment_begin = -100,
  segment_end = 920,
  segment_offset = 44,
  bad_segment_range = 200)

write_csv(preprocessed.data, file=paste0(out_dir,"/subject-", subject,"-epochs.csv"))