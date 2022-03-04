#!/bin/bash
#SBATCH --job-name=219eeg
#SBATCH --output=log-%j.txt
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBACTH --ntasks-per-node=6
#SBATCH --partition=general
#SBATCH --time=99:00:00
#SBATCH --mail-type=END  	  # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=jdeleeuw@vassar.edu

cd ~/219-2022

srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-01-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-02-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-03-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-04-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-05-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-06-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &

wait