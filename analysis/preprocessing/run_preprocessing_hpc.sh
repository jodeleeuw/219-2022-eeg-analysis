#!/bin/bash
#SBATCH --job-name=219eeg
#SBATCH --output=log-%j.txt
#SBATCH --nodes=1
#SBATCH --ntasks=3
#SBACTH --ntasks-per-node=3
#SBATCH --partition=general
#SBATCH --time=99:00:00
#SBATCH --mail-type=END  	  # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=jdeleeuw@vassar.edu

cd ~/219-2022

srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-44-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-45-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-46-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &


wait