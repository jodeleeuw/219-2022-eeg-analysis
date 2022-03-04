library(readr)
library(stringr)

source('preprocessing/preprocess_eeg.R')

eeg.files <- list.files(path="data/eeg/raw", pattern=".bdf", full.names = T)

for(file in eeg.files){
  print(paste("Working on ", file))
  subject <- str_extract(file, "[0-9]+")
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
  write_csv(preprocessed.data, file=paste0("data/eeg/epochs/subject-", subject,"-epochs.csv"))
}
